Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A435DC71159
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 16:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6541E10E3FC;
	Mon, 16 Jun 2025 16:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="njxR0+xd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5214010E3FC
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750091607; x=1781627607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RgHyUElh/xAy6IW0/a/6hVganMKmJ0YoW8tprjlVfLg=;
 b=njxR0+xdHw5y16i1qimGwWU/ENOS2XYTATD5BN1ez1kfiAOzAeGXAck6
 WLVDYpri9lhWFbnZ7tbkx2c8RWW+DjfrsE2O390etiDnLKM/ZHBJ7aTDa
 577QVUVjMF7KuXDyT2rK2w19xVj1QCJR27i5feHrCb5Sn0rY8BPGJdrLJ
 PAZCk5EqMXkgNoV7tu4O9Q2j7HvQ1qUYcV06Y/vWIfFVAlQwbdHjqSvpr
 q4OpX3RzvBW4kmtwESZkHaGPTZVi7r+anBSGVM5SBIDay6J52B79v+2qT
 SYaY06zEPrFQhRmH9L77B6hrcAC/8psaI5ClrqEv23wZq7EcFYthh1bES w==;
X-CSE-ConnectionGUID: Vayc7ffQRqiTLTD/PszluA==
X-CSE-MsgGUID: lVsI942QRfeKEa70WY+Sew==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69687023"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69687023"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:33:27 -0700
X-CSE-ConnectionGUID: FeX4FNSrRxCubLR1q5yGjQ==
X-CSE-MsgGUID: 05gPjt3jT7GGoaAMwAYWSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="153396702"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:33:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:33:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 09:33:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.63)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:33:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rytYJSJ+Rr0uymB+PL1h76Dq0O9RU2T+QYKwpOLRibkK7CoobMA3p3VyKDcKh/4KnmtbxnLnbpqd4Q0URhg4xweoKmy8C51dCJCwCep/MjQolQTEqPEHOpPO3A3GvF0TfC1eKhvVUqWf6AGBgWJdPQmS7WNEyCG4An2MdVFIZRn41TVZAioCW4VxLRHJLGfvnfGti2jjS1zqrzKov1H0UrBsmRQMP9xgS7XeA6SiNiNy44hSauBbOJNpaMAEUIzjaS/7nK6iHUg2zTFXzcj0zjijsQjcYMP6GdwHClMd6aWHdaEL0B04Tpiht/2DApD6P90bKFKewVYxiic6qFUbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H15A9+l30MrT+TkII+1pnMCFFvPTH9Zn7wRzCY8SA+Y=;
 b=s/U943X9Nwk8gE8nNm+Ska1oMwwzcOwUYUkO+LZGV+rl3dS3dpsgOPcCH6r/TWV5ikBLX6a3Zi6zW5EQmPU/LIP995cOvOvnzlX9D72hfcIWi2UZRInoFX3IgbgcXVce+0ts3rDFZCRVmu2EmGv0hNe3U3porSVHGqp3AtRrVC0QEA4NQN43G46Qy35XvG6iTp0OahEWuX6dQDCJJE2XzRNGelGnjjEx5DSs6S/kgcNLviryD1VL0O5p23JwJBBQM5sbAfWGDknyNgVf/MYWhiB1VFjoaruHeR/bZij4oxbSb51MG9DOcdryL3MrRitCcO/V65IhyguY6EZnNGEy4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6977.namprd11.prod.outlook.com (2603:10b6:510:205::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 16:33:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 16:33:23 +0000
Date: Mon, 16 Jun 2025 11:33:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH v2 4/7] drm/xe/guc: Recommend GuC v70.46.2 for BMG, LNL,
 DG2
Message-ID: <wgbww4noujwbpxydqqgjcbks22abbql23sigqg4v6c7t75hrhu@m6uhe22uuqdz>
References: <20250614015511.691610-1-julia.filipchuk@intel.com>
 <20250614015511.691610-5-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250614015511.691610-5-julia.filipchuk@intel.com>
X-ClientProxiedBy: MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: dfbee624-61f6-4b86-4fba-08ddacf382ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?URHLxmsRoQZor65PNVVBVN+QnTx2S1sTuV1o5g6r/F+amwr3Qvx9uPc2NJZG?=
 =?us-ascii?Q?nFiw5dxNGWRQaALRsakX17waCbWdn5RjF2m1bX+yhHZGOdLkbh7DmRORi64q?=
 =?us-ascii?Q?3uGSvOauhG99vQy6ySP+mKIG+dOABAGI91sTZjwn3T6sJdVNxwILiDQTdaWI?=
 =?us-ascii?Q?3fNIItZQlBm6kXKZYK4y7XmNwDD2GD0M8IBwmF9sfo4Li0UHx1AzGF20dIY1?=
 =?us-ascii?Q?KeG5CYU1eDKgFn6Afm1VyKobyG5CEAmnfpkgkzvSy1tZyoBcL+Dqzrv+BniF?=
 =?us-ascii?Q?4He26zFmbVA8ymNiQYTsz3PIepQHQjty/Er45MTsJlM7JtZgCAItMFe5RgUL?=
 =?us-ascii?Q?hK9wYcarvA2v1+D7kj3kQDeFFKqXZCfKj4wPV/shGhOeLeM98tv9WcgSYNj9?=
 =?us-ascii?Q?jOq/DlhMF4JtZlEeX+3n7KDWwNWBiW/vjLSJAzWsvybvc43CjySCYqtYOWkt?=
 =?us-ascii?Q?8UaDmHcb7gJ7qLJ2tm0raU8eGPjzul/t+xjJ3GKbmliXW8e57eB0S6Tg30mS?=
 =?us-ascii?Q?TfDwb001tfDFNzajutja2N+y0eT5MCxo4VRHEo5zA/s5QwGAzs2nUS8CnoGx?=
 =?us-ascii?Q?AF4zxqzo8mlFrIynAl8wS3G51rnO1O75mrYIjz0ptFVtfLqjSLTfNhlo0/OQ?=
 =?us-ascii?Q?icJJQOucFpMXMCCYKfMHK/qbJwilYX5MjXBq96wY3DunkxDhlmRl6SmOWVMd?=
 =?us-ascii?Q?XZ6Pulo/t5XXzUg0Qc6EFBrAujKrFEKT6xchyLWL8y1hB/tWAW8z08UBRDuG?=
 =?us-ascii?Q?0Zb9RJ9tURsVDkQonQlAlI7H4rfUn36LZywZsnLS10SKid0MMSrF060fQK7d?=
 =?us-ascii?Q?vkELzvForfcRKM5q5QUO5UjJ/pAGMDEIq7dZQHM29kbdmAXswc3uMatRU2+Q?=
 =?us-ascii?Q?aCYVS/nW5heYSMfBGoF8vksOx4gk5i7xofXS9A49pvQ3KqiSvITm9EJcDyqQ?=
 =?us-ascii?Q?gHJwZHLbPR1iRn/idBxiaWANajbciZnqF2IwKtq9IAhppYVybnykmkhl7DxZ?=
 =?us-ascii?Q?seRx82n+tFz0AnjDLHBuzUgjuIhNxcWqhFAanO8VB+OJI2bqMC5px7pvNBOc?=
 =?us-ascii?Q?4UtextPdG+043uJy4A93NQwi+OF4s35PpURN7ODXY97j9YRsbFNlyLh0aKiA?=
 =?us-ascii?Q?Gje8yeu28UKEfjEXPghIK/ixaCXeW/4cDxU+WozdobOgRt308GTMGQeDMX7x?=
 =?us-ascii?Q?ZWWLszGJc2lUBwRVtEpF/Em2RO72DZGELnVz4y41YII5cF3dWa8PCAs3fJ3e?=
 =?us-ascii?Q?1M79zQydMvrELBAhPR7RHwzfkYETBmFKmKddEk/uDcx0+1DWW5F3q4FNAOhB?=
 =?us-ascii?Q?cM6XVvjWLNizMR2d5s01kGrG81cBYopkCsm5jD3Ra4qW1oQfplfxx9axcV80?=
 =?us-ascii?Q?0QgZuG4lmPpBDCNPCnUjXPpcit54FYv0CSMuBan8Fk+rku82wPJl99Inqtl1?=
 =?us-ascii?Q?VZGp5Ohmn+Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?inMZ//7h5wQOCev+Yshe8UpR1KtgPYC2lnMvjWqXl/iPAKQWnRReqHBMvgth?=
 =?us-ascii?Q?BOgar7qlJeldSTd8k+QH6c4z0xFzMVs2D5flYq4+GnPRlUmcQ2PjyZRO8bpj?=
 =?us-ascii?Q?kV6Lb88Df0GN/Ob4Hnm0U7JsCUMnKEgt6b9FzOTXgiX+imoWqklxyu3LiJLU?=
 =?us-ascii?Q?mURtzvztS+jGnG/qMinokHtWeaXiUusU5AUMOiQinxDuSCEO82KZC7s+purY?=
 =?us-ascii?Q?kc43CMg4bMHe9s5drKwsViCIAgAeu3tsDf3LK6CdJb56BcWfN7gkSrVfpAYB?=
 =?us-ascii?Q?CV/Z3KZLjXXN7peqBZXhjih7J+Sst8xbbIAe3+wFoJqLZSD4oaK5cKVxMwK1?=
 =?us-ascii?Q?awigKxTVoNHkPe3z9OdZMkyNWTqpu4IHKxlF7SkoxT9rdUbbXqVTVfvgAkBN?=
 =?us-ascii?Q?mJex0UoO5mj8ppvtONaMxOHLJVCaGub1Ad4WUKEsyJUw2kwONhPDpVK2KU0U?=
 =?us-ascii?Q?18CjrT7/+FrICWy430D15GwtPR8zyg+49I3cT0iHi2v9u5kBxJJGMjR69K3F?=
 =?us-ascii?Q?NKh1xM6gDtDHRq1CtA4meDASHm0A3sfgLFU9zxtz8jL+XkTk6mIFSLhOQo7h?=
 =?us-ascii?Q?X5TNJgPyNwrNRa5YsA27gn3qarhQPtEDhR6QUP1G9Es95N8xhUCD850op5AM?=
 =?us-ascii?Q?lVra7Th10kPAAsYD5m6T8+u9WcR4qwrLAiBihohgMHCgU3mLfcr5XoYe2IEy?=
 =?us-ascii?Q?opGrMN+IM1UijtmDhGDNB26w/shDf9u3iGDmLiPkAWKgxYIPGkS6bMocDGej?=
 =?us-ascii?Q?+LE+N8qEk9QLjTg9amyv35E8dnOl8lKtZcVKU5S4+BPksqhnyV6l2/cyBUtt?=
 =?us-ascii?Q?6nQSjv5f4vw5SoVa/pGpmjNc1VKNJPfAiKRQlp6+aYhD10P1SM0BWl6n8p/h?=
 =?us-ascii?Q?DxvTzdhv+8aOk+EEw0ZJr/2RCt1NCqSp8yeSF8J7RNkLBBPcEmw1vn/jztEK?=
 =?us-ascii?Q?a/c0+kEvmR9CbVTOoNmGevwmuQqmVi8IW/ecC6y5z2s2GLcaKtIzZ6rJebt7?=
 =?us-ascii?Q?lbMDE3Ye+avwtpzFRURsJXhK3pkPXEkZZhKqZ1WmFNZNozKIsTZ4vzvA5TWJ?=
 =?us-ascii?Q?JEwEQ4ePU0m38umAVnlrfUS3mVb26/dPXHgBLMq8i79oD4rnTVIv416v4N2o?=
 =?us-ascii?Q?tPIGiUf9+8q5SQTQcBT8IMIzl44Tcm7fwZSDU2OPtPRPbcQSsJ3YYZmPFARh?=
 =?us-ascii?Q?WRFdw2/e0cdWVq/qSVdqeIh+rven6gSNbDpf6Zdix0pBFeMdw1eZSN+RVRH1?=
 =?us-ascii?Q?dly812sVOF9Cip8pSEWJHITEHQiKyf5T9J8nWfM0Rx36yupjIVXTYY+rMswB?=
 =?us-ascii?Q?i84FsLujUoQKn91Xe0Xh3LYkjmeoMmUtxX0D4lc01+ZhKicaxbUCZFuvOKfV?=
 =?us-ascii?Q?xo2ciFBNVmwqlxp7TSGCL07P6mkQIdSTDmCpLEdThAnxKy0k1nTwJ4CvJ2S4?=
 =?us-ascii?Q?uU/bBl1lk05KctOs1CdqXoQt2wQ0Tmz68hm3v/BBI2RRpGa7K7r0ANxrOFXV?=
 =?us-ascii?Q?7TKeLW4CPF12r7svJRHZ0z4LhNlSbQInJ9Al9AUp8I7Qhd8X2Vp9K+2KJX/n?=
 =?us-ascii?Q?hYUZ1s7iNVZOrGlDESkL/HtXCpUGA68DV4Mm3fb01fSl3KleqkGaQVBbr1To?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbee624-61f6-4b86-4fba-08ddacf382ef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:33:23.2255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GItO6nkfqPdEPtqeS2gaAIhYuKaukoSvAj9A5fJ1Nk6biP2IsePlM9v5MGNRJTZLTe5n52j9Yfpqmy96YzP7+MQ0tfLxcZtXsdzT2xdWhbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6977
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

On Fri, Jun 13, 2025 at 06:55:08PM -0700, Julia Filipchuk wrote:
>UAPI compatibility version 1.22.2
>
>Resolves various bugs. Recommend newer version.
>
>Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

Daniele, from the previous  version you seemed to be ok and v2 is mostly
for the way the patch was submitted, right?

Also Cc John

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 6d08695186521..4d3ace56f38aa 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -115,10 +115,10 @@ struct fw_blobs_by_type {
> #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
>-	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 44, 1))	\
>-	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 44, 1))	\
>+	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
>+	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
> 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
>-	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 44, 1))	\
>+	fw_def(DG2,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg2,	70, 45, 2))	\
> 	fw_def(DG1,		GT_TYPE_ANY,	major_ver(i915,	guc,	dg1,	70, 44, 1))	\
> 	fw_def(ALDERLAKE_N,	GT_TYPE_ANY,	major_ver(i915,	guc,	tgl,	70, 44, 1))	\
> 	fw_def(ALDERLAKE_P,	GT_TYPE_ANY,	major_ver(i915,	guc,	adlp,	70, 44, 1))	\
>-- 
>2.49.0
>
