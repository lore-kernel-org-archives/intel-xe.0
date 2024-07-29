Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6151C3DA61
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jul 2024 20:39:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F48D10E492;
	Mon, 29 Jul 2024 20:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Anx+I5mL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FA710E48F
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jul 2024 20:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722285558; x=1753821558;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WL/+XMXBpKVYWY0IGKgzEXuf01WchaiWNn02Y4ZuTCY=;
 b=Anx+I5mLysl0oZ1FOSqgzH6bU35rNR+PMO3SRx/l1vhM1jDQ4IIdPOgm
 aHOEGYHANGUUlnnAdpba6XZxoHDOs/RUnAfxJz492GT49pZFM+hT4WfdS
 R90plbqTqChirlRKv7yVGeY+iVIg9p2+8yxzzfpho+MfIkzCQr8E2SQC3
 J3XXfl5pPgpbfwyJKuSaux2B6rFjcPgTOiZ+XAhsnVhjwNHTvhKItKpVc
 TIIo29hvRKR4Dr17SlVQV2iVpeAyE9Z/JdGKQ/13jPGTRZsKHGdhGenM2
 qNb1LwzzG2gSbS42BJrOtjDhFY0ruR2KXyCTQv/vrrvMmQRuEJExYah63 A==;
X-CSE-ConnectionGUID: 074rD/qTReSRJ+9kLLusjQ==
X-CSE-MsgGUID: cjFs8srESm+Bdegi2sAYJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20016150"
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="20016150"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 13:38:48 -0700
X-CSE-ConnectionGUID: nZPywoZfRbGviBHOEktLRQ==
X-CSE-MsgGUID: K6rDVscDT8CTAi0rbDMZuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,246,1716274800"; d="scan'208";a="54064528"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 13:38:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 13:38:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 13:38:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 13:38:46 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 13:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGLTXZOv7gJcNxEp/yynpULAK311DvPGSPVDZTJ4yXGEfaJ7cHoxMHwFqERleGyoBpRPsXofymNaPigrA9qY2DglQoBisyt3yGKdAMOiuX/QbRsoju0vFsumLP4pQIlsZ0fMZsEiLg+SzcG8G2Z76CupJMbqO5QA0OzUHQ6AgCvNhbRPAzmSmQe+CG5JpG0cEjs0gMJz6r5al2TgUaSlBlMP30jzGrSms66btZrMmTNWaQqu7W/JITXJDdvVo7j1gSM38Esb8b7Z6KJQ7AHtAy8vIuMet5IUR3PmVbeK1cC3BUKfCFbdy9vuDm8v4RIiy3pSqAAHI+LwwcZ1G3E3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GAKQbqsuMQYayj1DKqebeM/aNzLb704zn9ulsngb+E=;
 b=UQVqoxNSXtWBULQI4ajDD/jWasQiGR4tBF2FMl2tqvBaYS3F46KsY5U3rKFddf8JJii6+Mf3xjFhZaD2ZapIt/4qrl/4ozIwBHEN4zo9saulcKQZKPeooSCriAPNatFWVAux733I8CM8kG/vQPecszvht3sOTRp5BAl01NBIfR7TdcJ/sdp+54hco475+b3bjUf1iZ+Yii+hAibrG7Oo8ipKO9wqkdF/4aVqfOC2JuAW9J+GsIVZp4wVB3k5PhEStvr60gWZMpfSPjcCNsMzNQHopyzwJr5CT5ZV3LxTI8EsnnIxZV1DZkuVgIgOL6L+cfAkZFxyAKgCf67+45Rqqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8547.namprd11.prod.outlook.com (2603:10b6:610:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 20:38:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 20:38:45 +0000
Date: Mon, 29 Jul 2024 13:38:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe2hpg: Introduce performance tuning changes for
 Xe2_HPG
Message-ID: <20240729203842.GD2685051@mdroper-desk1.amr.corp.intel.com>
References: <20240724121521.2347524-1-sai.teja.pottumuttu@intel.com>
 <172193399009.1567.13779997283728313218@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172193399009.1567.13779997283728313218@gjsousa-mobl2>
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: ce46d557-1067-4430-c22a-08dcb00e7117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w/AP5FrqDKh3xU/NL48i5htpNKWKPoydz3H/AiQsExoJIeDzooaQfqGBLWSF?=
 =?us-ascii?Q?0oN8Hvvvjf/3mJITZLuBLDPgZS7AS8X+qlehKa1+mts7MI88Lv2EuQOwA4mO?=
 =?us-ascii?Q?UGK28b+jvnXFjjcLNBntIB2CCvuo5tSfhxSAitMCGm+NclmVHRr592lr6J/l?=
 =?us-ascii?Q?82q/o87do9pf4ADLcpq7tGLtM1UPQ3ctCTy1SLslCy1veaNF8BU3D2/iTggj?=
 =?us-ascii?Q?y/nNqEVTKMBKdDRw1FkZPniDjVnk3cyc+2Hg3C4G2YeWwj0xdw4DQTvOfzDh?=
 =?us-ascii?Q?bvjvHoFtuFbOQPHxY60GfxDFMLCNb5dRMzFQDhvwx+qLvAa1eJAp5PPQvOuy?=
 =?us-ascii?Q?dBDmOZmLXDFYYAsOyfBwKcYiTgikBuJl42UABdf4FWhxfVpkNVldbZNjj5+0?=
 =?us-ascii?Q?ieWzWu8Lx/TpMpHgqSxEUWD//G+raxVYAMk/KDjo3TFEKR8RXqFWpDXrwIfh?=
 =?us-ascii?Q?Ily1+vuGhYgBaTHEZTB/T+W7334aQWU7ALWvAzkBD9D65gGE7LZ0PaI1KLnm?=
 =?us-ascii?Q?CcX3cSl7Xbku4EdHrrIZGuv49MUnKd2VmROYkJUZXA9r008Jf1f/8hoLWcFS?=
 =?us-ascii?Q?Q04U5TrdibmNRQPymgZLxUbY4n3+X1ZvIwR7AVGw6Q754YgNInaFv3bFJoai?=
 =?us-ascii?Q?06zpdHSqrKlUANAqdpvRMgMXvTp1Kq9kbvD1wLpcpHXZWoydBudWlXpLF9Y+?=
 =?us-ascii?Q?N2MuAwcJ5ABYFsFIa6r20QEWvuLkj54bptksnjyngLQRti44TL1KWp8Xql4S?=
 =?us-ascii?Q?I6RQe1njQY8S2WFIap3brepAkN4giMnpOY6L+ZihPbDjkRMqqeLT4dl+S0jC?=
 =?us-ascii?Q?+Ki3r7WiHAziPcBFG/xVtnuZmiF1bp52flpzBpE/1O2qqTq35Pp4b29EpppP?=
 =?us-ascii?Q?6VzsvU8wN/cTr1eKfdincEbn5yk603T4aLQO0jQcKdvx64uh6/0lKwDdgcOy?=
 =?us-ascii?Q?jzEMWv8vrsUHxWHjaHdxKsfA1W77qQIq9rphEYhDX3AsmC9hdKzt51N8R3mI?=
 =?us-ascii?Q?E1tQSvb5x+MNJscFHAx9VeOfZSQAtZtExQwWSTSIRXpRGoE6lKym00NCx50j?=
 =?us-ascii?Q?YIsVQ4K+hJQDfZZqzVxycrGs0gLWxilARePL08j2xpzZ/Bny75pqBUZiq5Bm?=
 =?us-ascii?Q?KRKuYmu4zZzqKlJ4YuDP/k+Jjtggu4QwapzRBjhXCcEW6EEeL69d3xQZDwGO?=
 =?us-ascii?Q?R+TiHLN6P9OliWO0ZYoCjAJWzl3btAf74e/dRcBRKtJ2dd3GCg/2fh2CVpUR?=
 =?us-ascii?Q?mjGqFPZfau53zXq9e6Bbk+VMZN1l22uoksVby2QTui8Rry/8b8RQj4D7Cayq?=
 =?us-ascii?Q?sEybc14QXMaURf1Ct16UJzF0J4xFYa/jmabNFm9v3XPA6g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2nsJcv0A4o/YgMOzEz26WHegCPtxCqCKZ4xgyxIjd5l0KcKd9KR7OxlF511G?=
 =?us-ascii?Q?3+Bk2bK//wNiNLgZM2TdvuMlYjEAFnC2VGPCYQ8i510VaRImwIKyFEzZww11?=
 =?us-ascii?Q?BFb+hF3uYwkGQkmUTjOOiJtDDBnUZt8KGKi7uasVFkKSdVS/7q6Mlu8scyPy?=
 =?us-ascii?Q?3nVJ4VTLHchrvm+BtjINNnDkaoHVEVpzJGWZueQ+aymxo+Vbced8cNk/0br3?=
 =?us-ascii?Q?WqZM31HOoFoG9gNHe0hMGm4hs3rhAANs2fhXUntwXfc7YTHiP5ydyOVlYNJG?=
 =?us-ascii?Q?G57dfQJV0l14GCp1h8acqqWcXZMs2qVGHFgWKqk8th/l6tYVXGaArmXmz/Ae?=
 =?us-ascii?Q?13FXhrUVMws1k4C5ChyweJcPf1YlhahWGo0kLj5EEcEdHZAbfgiFspo6r/Fy?=
 =?us-ascii?Q?ElChyLKMVK2SOBycoSOyiCe8iLmigb/eW7i5BYME4ouhmsf3sVkZ6oyWK2+O?=
 =?us-ascii?Q?dUUGEYypvuFII7MmmwrTxsz7vh7hr4GtTYA50k7AS8gvw8vYWiU9Tr2f4V35?=
 =?us-ascii?Q?6v/drVmrxmt3RtkwrRPqyBGRgD0dgJhmTnyfY1+Yi/kKC1fwMBz7dAS2UP3N?=
 =?us-ascii?Q?Eh6FWZ5qMrWzbxqqupag4Wqx7WOvqgZeAsPx+kKjSFsEZIetDYjhfdm9HpgF?=
 =?us-ascii?Q?2Z596d0XL5vIe9owNlp0DIh8821ceIsxNq5JBFfADUJ6QXlfjjV/taBs+sTc?=
 =?us-ascii?Q?YRPfJ2ay6BjZija4oI4StnTd6H9JG0XGLQyDm5FZDaGhx/Sa+fbvmLHxOOl5?=
 =?us-ascii?Q?pjljrVUPB3W+LlFxpMIfdkIoNK0gBEZnadSWA7+je3iE8iITgzse/E/4MO8B?=
 =?us-ascii?Q?FQhRenKTmtmwRiHAIGMmFGQrBt3waszublsVo2AvN4cUUsNEznLFiIwPdM8J?=
 =?us-ascii?Q?A1yewrc2y7wXXQ7Jy6teNVP3uI5ax1X48qd0yM+jIDougf4m6YACOoikR3wA?=
 =?us-ascii?Q?Foq9hJ1M2w20pGctvHOFz7r7/g0OIglPRuvGHXRjLlMKuQcEn37jDiA1vVtK?=
 =?us-ascii?Q?RXjsE9hoBNaq7jPX+H1u2epJjF6N+bKxhO6efh8FmU54inj5ebS8jsg5z3mk?=
 =?us-ascii?Q?Xe+U0UKhWbU29BbsBPM9HWtiFJPXI9ChSzgzZyD0up41AOFsIc8VoJaab5zR?=
 =?us-ascii?Q?vHO/VM+9b/pAc0KaBH7uNIHJQKbnD0qMhgXwFEiXxibQvLu5HubWKHhPsrCY?=
 =?us-ascii?Q?+Oh4E8YqfsWAfT3GLocb9sg7esE+NeQ+fJCQwP+JFP7vDI49FXpgZfsbU3Kp?=
 =?us-ascii?Q?ckDO3RP3qLx0nrWruOfum02bIxwfUiTohfKU6Y3AXunUU5QniBkQmp2ZqAKt?=
 =?us-ascii?Q?WbiBwkrG6gyFkg3knh9AdOVNIMPtKKwQaxFPokEUWLjLlpxP2JUTpGaS8lJN?=
 =?us-ascii?Q?N3gGV17wmyc8sRwOzOXosuJnZsXdl1LalRzlcbxlKu0XMu6Y2shAGRgz142m?=
 =?us-ascii?Q?RwTqMtG1UqbGOCPq1xAcqDnkq8a4LRg3JSAyKrJvPdiEHl79YlSQR2hvRZhU?=
 =?us-ascii?Q?hncEmVNy+8LpNpbhGnypQoHuLGxtNbClSlySvYKlOl+PfmxRcqL33VIUGTuC?=
 =?us-ascii?Q?c44tkFV8mXAdhi/fi+R6HZYesLbUiGma1un9z/N/Ip+vN/gPRhGsNT7oAkWr?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce46d557-1067-4430-c22a-08dcb00e7117
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 20:38:45.5972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hug50dFZ4vjK/TgQpvf4dDA58/KDIyoyrb61zyvj7NWz9hb6Bf6YmFfke5GL98WV/Muszby9wN2KBIw0Zoqgprgb/3WQncPryvE/uBNOWrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8547
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 25, 2024 at 03:59:50PM -0300, Gustavo Sousa wrote:
> Quoting Sai Teja Pottumuttu (2024-07-24 09:15:21-03:00)
> >Add performance tuning changes for Xe2_HPG
> >
> >Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> 
> I would add "Bspec: 72161" just before the s-o-b line.
> 
> >---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> > drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
> > 2 files changed, 9 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >index 8a94a94d2267..3b87f95f9ecf 100644
> >--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> >@@ -108,6 +108,7 @@
> > 
> > #define FF_MODE                                        XE_REG_MCR(0x6210)
> > #define   DIS_TE_AUTOSTRIP                        REG_BIT(31)
> >+#define   VS_HIT_MAX_VALUE_MASK                        REG_GENMASK(25, 20)
> > #define   DIS_MESH_PARTIAL_AUTOSTRIP                REG_BIT(16)
> > #define   DIS_MESH_AUTOSTRIP                        REG_BIT(15)
> > 
> >diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> >index d4e6fa918942..a8e1cfc99ed2 100644
> >--- a/drivers/gpu/drm/xe/xe_tuning.c
> >+++ b/drivers/gpu/drm/xe/xe_tuning.c
> >@@ -93,6 +93,14 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
> >                                    REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
> >         },
> > 
> >+        /* Xe2_HPG */
> >+
> >+        { XE_RTP_NAME("Tuning: vs hit max value"),
> >+          XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> >+          XE_RTP_ACTIONS(FIELD_SET(FF_MODE, VS_HIT_MAX_VALUE_MASK,
> >+                                   REG_FIELD_PREP(VS_HIT_MAX_VALUE_MASK, 0x3F)))
> 
> We are using lowercase for hex values in this file.
> 
> The patch looks correct based on the specs. With the nitpicks addressed:
> 
>     Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Applied to drm-xe-next with the suggested tweaks.  Thanks for the patch
and review.


Matt

> 
> >+        },
> >+
> >         {}
> > };
> > 
> >-- 
> >2.34.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
