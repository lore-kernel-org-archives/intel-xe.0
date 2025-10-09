Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8041CCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 23:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5E410E045;
	Thu,  9 Oct 2025 23:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/bbcOgK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D493E10E045
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 23:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760051649; x=1791587649;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2IxEIrImldLkh0mloEOW07afDfDQMVfCjBL6LyFokTE=;
 b=J/bbcOgKCROWT56xRY90d1Wd16q3UnMzeCp4Qt3EefJpZn31duv19gLO
 CVqCo86Uq9fRtA2giIiMr324oyQyrz9SXB3x9uBVEloj9p62q4ygKe5u8
 dzCIgW1PiOC6refFulHGhR/q/li2YSBYaF+YgiDRzmFXuPqX8fuGOlDPc
 +N+XZQWRzX1TnvlECiP8I6ApfQq2TCHz425qCdRPcMJciah+vjASGnDYs
 SzKp3Fog466l9xdKVuHXyKbIM/dioit5cq1NUkRwe17PPsobmbJ6epJvG
 nGBRWjnivuvwFnUwAI+/xkE64U0PnmHA9Xl0FFUgKW35/o8ERU2zADEOl g==;
X-CSE-ConnectionGUID: mk5RQEF/RY6PdqbirwKNLQ==
X-CSE-MsgGUID: NT7JsfZ/S56tL1BZT8b5sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62313102"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="62313102"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:14:08 -0700
X-CSE-ConnectionGUID: rzSDsTvhRjmlfBMmpHvDcg==
X-CSE-MsgGUID: qkYVdBy6QdesWLzKKfSD9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="186099182"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 16:14:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 16:14:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 16:14:07 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 16:14:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=empAwY8QEK2etOXPqWUqLROLXnze4zxVpTiWJXeYR4OasyQjerEcG1QwbulyaBwFYHsZjYhrh0HJqOwBBLwCA49y1ZK1IT0dMEIFUTa7joxZhPCnXZNS5MNAZm5qRURe2GJa52pF5FpYhXQqHMYOxuSssUNkZ0PAbSNpa6VdZ4Rg7ywFDG/rIgSf1PtxmcC9cPV2AAPO9Gbz3OYT/Qy8q3I6l2s7k1yDLM6hLe7BhWr8BglLw3Pc6eGxJ0wE5NTiZD5CI9EhZPZfw4PMA3vqXc7ie/8PQykGyPaioN+vD4jr4/K/7vrgbDZwYNre8STmPpX3gj9SJADpr186rX9sIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNap0TIsDo7x4upCkwrnArghKyfOMgyh+NZQHQXhphI=;
 b=YL/rbMYhXOQV3vP8N4NByuqkJrrY3sWlcEpz8uO5mH124BOweMSbFUHheCPO9A2McnmyLm7X4C/PlD31jqMKZu+U6xTmwLD7Oq5jblzarZZog4Az2XIlElW8uBMq16tU7EEtreveRXhjzHfEuXkCNp49qkurGbiEzVLXu9ANiFBnU34nAY8om2z2VZdQ2JeqR2Sf8RTtCsrrI0y1BLQdTVoIP8p9bEwJaTCcFEY821ED279K69T4EjmrLxNszgShN282rN2QrKKkuNsMT3QVnoOlObprWC9mjt8XtFrNiX4GSauRnALNlsvPrH3dmHJBOJCCZFZmuNse4k27jNwOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 23:14:05 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 23:14:05 +0000
Date: Thu, 9 Oct 2025 16:14:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Enable media sampler power gating
Message-ID: <20251009231403.GG1207432@mdroper-desk1.amr.corp.intel.com>
References: <20251008172119.1630380-1-vinay.belgaumkar@intel.com>
 <aOfFY1alTToqR7_W@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aOfFY1alTToqR7_W@intel.com>
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4989:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adbc1b6-24b0-4965-d8fd-08de07898af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xGbOFuhBVzc1htbfNLEBCyRaFWIKtbOLYewJMlBcSTGLvcsplByOnqaW6NiQ?=
 =?us-ascii?Q?tw5PVSjZ0NagRH5m9DxwDNRIvuF02OrixsoFA/cLF0155q4+vrvxT2JG6/ME?=
 =?us-ascii?Q?amVTRxKbsiEJK4Xk+WYfDlssUCNugASUhkkGxig+y4C6CNSpERscMljJxNU2?=
 =?us-ascii?Q?vfZFf2tueEBN87sDDeh7Y53Wx3oWK53w7mTedoCwJY6aSH0MPcpCizRnt4/F?=
 =?us-ascii?Q?kKgbt7uGSuucpB5U3YjXZb8j+hclpPavvC0oQ4vZmlXfeajUX4Ae3mn2i5sy?=
 =?us-ascii?Q?rkfcBpAtps3n9kzudf5NCVobP+LhFeS5ueFHX7SILVn1nCGK0WTQKZGfrWiE?=
 =?us-ascii?Q?lcVajuuH2b5D1e82c4vLjpxO/SPno7Ga/XKTBkbuLd/E0EOzvZDMXJDn+qan?=
 =?us-ascii?Q?oI2kxaygC6XiorHLJqQBanDLBJuKOLVjTIjqClofRY1CVRhz/Oz2SvYesD1W?=
 =?us-ascii?Q?oOoCHLCXPLc4PAFFcBhUHfUXuqqnzq/tbe3k1qklHnWn++TxI6Z2F2gieEVt?=
 =?us-ascii?Q?LdhEI4QnTmcrdKIQnx6rsza0d5v7iJv2lqd7vh809TbSmVxlzQ3n9BhpK2SK?=
 =?us-ascii?Q?xvVaA8rltoPJY2/j+c7JLyQ860EC68LXo+JhzsCX1fehE6tMO38vXY0pPkEZ?=
 =?us-ascii?Q?Cu0AJBfoLWLgXmiIGeisrBbshIH6SpXVAjW7+rwIn0K04MUohSl3vXTIbmeQ?=
 =?us-ascii?Q?FUos/IvQEC+IpqltPfOSuXypWbvIKoJ0EUDI8I6gg3QgLZSYfjKlG2XFyme9?=
 =?us-ascii?Q?vC9IxsKHF8lp93OjSzwb9MBti6yiE3onxGDaASQSCz83/Swe/V/J/oSTNLPS?=
 =?us-ascii?Q?4dNPzw3dhCjK/JCeGS1mfTeAoQmZqZ+6plQzubYVyBDfoaGRbNUZ8D6aXqDz?=
 =?us-ascii?Q?Tck6oWfZr5R9Sl4OG0/vXR1T2FIlFfVOoENAi1A6FCXXwLzdswz+d8xWVIxV?=
 =?us-ascii?Q?tvkZCEEtBpsYQ2PZ8Mb4cTllmILY98GNSZ0+3k4vGqWP8IIAwHFCwy4zcbXt?=
 =?us-ascii?Q?to1N2KxUMpeKLxzWn2TTRpLPWogNUc+970r+tNifvmhCwho1CyPeSifz+xZs?=
 =?us-ascii?Q?SXUFA4wqde9Bc9lngev6n2VLBk716jFQ80ibSQL/kCdj0A6pdM3Wucael4La?=
 =?us-ascii?Q?9FZHPXf2Q2Ry1E/Dt6SPJrWSrbDPosSmI/Jece6LLGXcesnhNaQT7BiygZ6u?=
 =?us-ascii?Q?69ykm4P/eY+9F2SB/0cyAVM0jJE8w0Pu/v6pEFOH9jJ+fbFft+3Xsd46O4eM?=
 =?us-ascii?Q?Bkf34p+CU6D5R+ISZgdFwL8K96HYfle0muMjYsXR59Hmt1/g4kFr3D/IPHov?=
 =?us-ascii?Q?1E9YeoznPkPVUsEEqEOC0DsOXtV+PSBhxd+VpSYTabvm7lsEtaSD212wd+kK?=
 =?us-ascii?Q?DP4FzrpCk/MmtLUZE27pamV7BQt9FPctpyJ9c37mBCj6hUAnyLrtM3iNiO3F?=
 =?us-ascii?Q?pGVDERTjAt7RvNiKKvO6WxUk41X08i9J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SLEPgnhrbXNITv7aeoeB7YyWNOMMwzGqadNfKW0f63SZ36LMvZBDc+raSdcl?=
 =?us-ascii?Q?9VEvpvN3x73NGuGGVOw5bujlGhsGA7p7HlLgWrKh5HCFIXpsbDARIsRpkFL4?=
 =?us-ascii?Q?m9T8jhGuhpyBTtmfAN80Db8EFDG6q5lxscN2jguaPd6Frc3JusQJSV1DaoZh?=
 =?us-ascii?Q?P1hmxL1ws6AEsLQVWl3ufTrcdSI7g7NMX1/jA8R9+EJuYkz8xM7FzHnSj1m9?=
 =?us-ascii?Q?8SeIKVmfGvV/rxzUNN0AXJtFUO/coUVd1GHPw+F38OOJTvA/pHeJjfz1RGYY?=
 =?us-ascii?Q?7TnTiTShSM+4mWDpWuZk2eLkbbttnlSzGEqY2ELaof23+ootSAYCxanm35Sd?=
 =?us-ascii?Q?a5YZink1oSDsD1XSykLq8aNYPwduha6s1coE5C3WB6jyL1l8jtL/VU7iyyjd?=
 =?us-ascii?Q?XhoLsOLU/AiVvA+nN3V3MHHRn7/wNYocFGux2HO/9GKG4YpPltljCsVSH8Cq?=
 =?us-ascii?Q?tfgEQu/7WkFnt+1wjclF94nWMLazY3Eg4nO9tT54A1hU6v/ICzK8rvNyZhRP?=
 =?us-ascii?Q?sVdWN71aRf1tMPQVx2pGT+FBTO4paRxhU7xuF/PMBLMQnXb6n+5Fq7g2YoeY?=
 =?us-ascii?Q?6qav90XFfNE2b90GVgfcUYTTk7FvyjMl8AF0iqHWDbQNIYbJ66W6WPdwqqK6?=
 =?us-ascii?Q?0iynvvENVDrJkCIk95YGGi5DAdVGDLFhpZAs51rrFo81X7k/Yp3Nmvcl8rlx?=
 =?us-ascii?Q?3zrDPQLJ7sDpSwsBOBWDiei4r776osyk3WmrbBVNLMONRAC8V+cdq2aTyUz0?=
 =?us-ascii?Q?EfnXhm1oEO93fW+91FJp9I7UxspQCkUhMTRV0mmqAbXGIeFBYyludDW3FSy7?=
 =?us-ascii?Q?RQoHKEENXxGB3BgDCQUsNvA7JEpc/JtEtHYBxKSNbYVbPlcPUCuDDgTRG+G1?=
 =?us-ascii?Q?NcNyc/Vetg9rfgXBrtkN51leKgekeuqCcrJiwPkLWf9wafXE/9vl3XhnXSPS?=
 =?us-ascii?Q?LLyEe+osV89zlS+bKc5MN+dgxAkCI541wMXYlFUIrMuZPojnaAHZex7GDuW8?=
 =?us-ascii?Q?9AmMp3Nvd4bHmtqj412yS7rAf/qaefRc3jhk3YW3a/JJv3lIYTejL8lk3mOh?=
 =?us-ascii?Q?Wn4CC1w2qiwhXDvd5dnIu9WDYZF9j4zAdrBs0H+es8lhVg2MRGoBpEcAKleY?=
 =?us-ascii?Q?o1VwgELfBhlAFHchIIFCVvAg+mlZ92TQxI8kZRJ+IRBMhaMABS0eyEWxpg/f?=
 =?us-ascii?Q?mih6cB4zEEShPo0TDWOAwAbVbjsjkvX1mAIuWW5GBh6W2thegBr+554Cu5qD?=
 =?us-ascii?Q?COKLAZdPNr5v1TtkVlhT4VsPp5piRTgDaFWAJwmNvCj/o6IEFrfSbApAIMsi?=
 =?us-ascii?Q?qeojuLbTE4o76WACx9xPi+T4X/bikccrLqKYbRH44Z877Xne3Aied9L2KrYO?=
 =?us-ascii?Q?e7eBvVRGPgrRIDRl3a+iMCbrRdwapKvkCpQv+QXbhjB41lglfdU+G8dTLJXs?=
 =?us-ascii?Q?MNy9QLNde5DZthhN0SHUXLLGbb5sv/Qk3MuV4NQbeatbrSZ5nEPHLA5W9kHU?=
 =?us-ascii?Q?wNcD/Og819WRLYXUg9tiekgvZAn5H+3nQubn8NBXJ/U/nlpDLSem0fD+FjsU?=
 =?us-ascii?Q?nGGzGYk7NEgFiLyTUyMAgXsWw5rOkJCqhJJtbly76nP3ibJuzG4d7bHyC50O?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adbc1b6-24b0-4965-d8fd-08de07898af0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 23:14:05.7667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLcXmoYFDGnDrUc/5ZmQuvD2YTJYS15frV3sR+yX9azv4oltRGJ3n1U13oN6kjE+kegBiNyjJAcNXUPiFLN+PzvpocoRvy7FmVFDx9ojns0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
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

On Thu, Oct 09, 2025 at 10:23:31AM -0400, Rodrigo Vivi wrote:
> On Wed, Oct 08, 2025 at 10:21:19AM -0700, Vinay Belgaumkar wrote:
> > Where applicable, enable media sampler power gating. Also, add
> > it to the powergate_info debugfs.
> > 
> > v2: Remove the sampler powergate status since it is cleared quickly anyway.
> > 
> > Fixes: 38e8c4184ea0 ("drm/xe: Enable Coarse Power Gating")
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_gt_idle.c      | 8 ++++++++
> >  2 files changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 06cb6b02ec64..51f2a03847f9 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -342,6 +342,7 @@
> >  #define POWERGATE_ENABLE			XE_REG(0xa210)
> >  #define   RENDER_POWERGATE_ENABLE		REG_BIT(0)
> >  #define   MEDIA_POWERGATE_ENABLE		REG_BIT(1)
> > +#define   MEDIA_SAMPLERS_POWERGATE_ENABLE	REG_BIT(2)
> >  #define   VDN_HCP_POWERGATE_ENABLE(n)		REG_BIT(3 + 2 * (n))
> >  #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)	REG_BIT(4 + 2 * (n))
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> > index f8950a52d0a4..b5f89d15276a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > @@ -124,6 +124,9 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
> >  	if (xe_gt_is_main_type(gt))
> >  		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
> >  
> > +	if (MEDIA_VER(xe) >= 11 && MEDIA_VER(xe) < 13)
> > +		gtidle->powergate_enable |= MEDIA_SAMPLERS_POWERGATE_ENABLE;
> 
> should we do this conditionally on vcs_mask and vecs_mask along with the
> main media power gate?!

The bit being handled here is related to the render engine's media
sampler; it's orthogonal to the presence/absence of VCS/VECS media
engines.

Once upon a time the render engine had a media pipeline you could choose
with the PIPELINE_SELECT instruction (other pipeline options were "3D"
and "GPGPU"), and that allowed you to run certain media commands on RCS
engine.  The media sampler here is part of that pipeline, but the entire
pipeline (including the samplers) was removed as part of the Xe_HP
architecture.


Matt

> 
> > +
> >  	if (xe->info.platform != XE_DG1) {
> >  		for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
> >  			if ((gt->info.engine_mask & BIT(i)))
> > @@ -246,6 +249,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
> >  				drm_printf(p, "Media Slice%d Power Gate Status: %s\n", n,
> >  					   str_up_down(pg_status & media_slices[n].status_bit));
> >  	}
> > +
> > +	if (MEDIA_VER(xe) >= 11 && MEDIA_VER(xe) < 13)
> > +		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
> > +			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
> 
> I was going to ask you to remove this print, but then I noticed we have
> for the other bits as well...
> 
> We should perhaps remove all of them and put in a single debugfs,
> but that can be a follow-up work...
> 
> > +
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.38.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
