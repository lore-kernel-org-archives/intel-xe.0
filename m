Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE935C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 22:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F92910E04E;
	Tue,  5 Dec 2023 22:17:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B31110E04E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 22:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701814674; x=1733350674;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DGEDgKaHfvj98WFfrDYKEDCDepjttBjk4JXA49BlUT0=;
 b=TVCXUJoIc/MQykt5TyQRHAruOeK+FhVEH9JcEOqjIKt7BmOUrZOTC1af
 Gevd/KmInrIISBSo298gMV75rvqKx3xS2/r3rj81j4kgIcrCekUDCtNO4
 58HPAnsbI2Sd660eyEhS+TGtdNW5Yr7DIZhUTphPe1NC3gCHG5YT08j0w
 vfv+rAlAiK8JIIcq7DBDOQEnSvUjc8EYfMD8X+4fW9GUKDxWOAULNF6wF
 ArPUJhCdWbKBquU2Iw3N33tw+IE6AKJVvyFUvco0ad3/InZfcIrTbu01z
 ColIPUMjWRzmaEfVkMyktn0tDIWVbYQQJg9hLObD2j0/OvI3FziIJZkmH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1033004"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="1033004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 14:17:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; d="scan'208";a="19116033"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 14:17:53 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:17:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 14:17:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 14:17:52 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Dec 2023 14:17:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXk8i1JXBpGOp+cJV4aVHuziYnYrKJwa77opfb3I7KqUw/5uCA6trIgtpCSlueT4oV/pP3n5/bI96dz3fWBMB5fS5S6Gw5fbfEiJsWoKgFzXSnzKTIAf3+hNBetAZNOkD7hIzU75peR9v0pVz6sLpSeDiDegVY5Z/KJV6HiwgmAbItH0sm9STQC7d7oS9uGmIeA3blzG3AomE+EO4EC2PaJ8ETk28/GlUC1FJtp2EXbgP7zSY2HXXGYrDjLd0cqUQpRYbWTxsW2IrX7Rt1ZKj2iYkFUhlDzeQxKrD8NEd4wEq5KjVF+yQ1rOtVDqMrIlIGjiVpqZAMfn8wptkRaHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3o0NeDuvIcQ4vpKZgRE8AxDXQR8su/imabRFzpiwR7M=;
 b=O8OJfSk23W/xOAInXlpcNa2/akbgGG/8q4V7mzcM1pmoaeIWE4RJIJQperyHbhCXJ6fVUI2QYGpHnwRkFqF/HcUWktqx0KCBCnENenAMBDCqm1aF4SbxL20qlYCAjHl/py7fF22DQCX6cgmAY3zTEQDAnmqgtU4xFudyWg7+QLNfsOd+BfD9rMTsmp8f9A/+Ew8uiOdTwo9KnMG5pqVxhcpnN+Pix4Hafa4MtYCb8LdvUmIafOmx4ljhXvQefqXUJKJ2aEwWLzkUNi2SYutTI6HqgF9fF/gj3teJH6iFCkJMJdkGLjn8cEgI1OhOh91+5P4561QSO8OsluSe01oADg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6290.namprd11.prod.outlook.com (2603:10b6:208:3e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 22:17:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 22:17:43 +0000
Date: Tue, 5 Dec 2023 14:17:41 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <20231205221741.GO1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231205054202.823773-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231205054202.823773-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY5PR16CA0032.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::45) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e139a0e-bdd1-4a9f-5047-08dbf5e000bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iTHXJ2m9e5AmFr4EyPLLgm5nXtUeNfCDy3V0bC3ugbXoBe6qBqtQPCeYceXhUWxk3VIGT0lYL7XJCoXv3WTo+22tKEEBgB+4tdpqzVZpQ4j+1E2ZcUc2bVyvApjt0L/pWgcc4rg8q/fbG8jwlxG2E0dhJe+yWTCFAPckhphXoAx6BHZDGMNRpfwrQ1+Uyqq1aVhtvUkCxWoOITStMaUyTtG/UEh/p9G7VL1XbReX/QVfKAzupd/yQln/sNMwrrDH2k+mLsOkfMEzxqkhJ732VrduL8EXC3rpwRnaR0DbBffeBLHXh6425G+34cbL7qWPw97J6FSx95zBUfVDZIrgPWyd+12TKpSmvHpKw2Mg8zySwEe7R+cUibqKDICksu7JjUQvyKd4TO2hrq7t7wUtxtvzy5L11VYvV/fooGpXywvFge2CqNTkM1N/PofNnMCUtLWmyQWWX5Ryip5DgV3RGeWcwmMvRCC1ppypDXcdhcsJx8nxaGr9Ju8yZ7Bc/WethUpD01AsD06QmzBWneGv06Cdc2J9JuOW+pZ1+e6I+CjXeoTg7Uj0UIo4mafw4v1O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(38100700002)(33656002)(5660300002)(2906002)(6512007)(82960400001)(83380400001)(6506007)(1076003)(26005)(66476007)(478600001)(41300700001)(6486002)(66946007)(316002)(4326008)(6862004)(8676002)(8936002)(86362001)(6636002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mopDAjYMIrSFTI011A58xP3/1j9g9HZkWD1M2t2GLw6khiwUQpaKKni94iHr?=
 =?us-ascii?Q?FaWkajYaljQ3AF2U9AwJFroOPCZdPr2xlOW6cml3SvNEqrs3bs3cyqqxbBGk?=
 =?us-ascii?Q?XrzqJ+Alsceu+gcruG3V6lwFa65kfMvZ2/Qu9fvOs52bMlHfvA6JnAjP4yoa?=
 =?us-ascii?Q?dGGgrjKHevHi75fkL8HmaqRH+chaq6rx29/o0Ul/OpxfZNTzBshbPu+iXZYG?=
 =?us-ascii?Q?d3mXcSomKI1BcIB5c1VP6UrYdspaUBT+YIOLo4vXYgGu4BFYK3d/6xrp3171?=
 =?us-ascii?Q?Fw1F/JxVAjGWFs9KUqGLwWrnGtX0/GneM+3rFYjOSQH1mf7MmveG0je6/j6j?=
 =?us-ascii?Q?cQkTXm5ALq54sdk/v78/gQk7lx1kxU3gkhn56W7k2jAA4r4F04TXW2hhOCHx?=
 =?us-ascii?Q?xFiwUBk+2OCjQxErQ7LrLYja9nS6I6QNavMSUjWCSKX5bQtLgPB2+2e3XT7b?=
 =?us-ascii?Q?jejyOkNX/xv13d8D2KKEcdBvHL6+RcezGYlJV7qDUeDfhoWw0Bu9r0MhxO4a?=
 =?us-ascii?Q?1I3i63UqUlFRTAOC32iFbYIywWmRdfrXs+H5ksvYnn/XwkqKVDh46DO/i98y?=
 =?us-ascii?Q?6hlMqacUHmONgBU43cPbCb1Fe46NNle6nOlJNmEXNU8xvSmLn858/H+SBu1j?=
 =?us-ascii?Q?CsQT2PNLOVWnO08YDWFrcqh8pt4gTeVcYhGMYABO1tGcFEo6Qytms7gSJ5Gw?=
 =?us-ascii?Q?SzLsWGdkNVnK//510tDTwdIlAR1HnZtlOjbPYayanB3nVtSyV8/jM3EcGCT1?=
 =?us-ascii?Q?rdJLs+c6JHXjfm+ao4dsDtgRwUSZU8JowbVE6dUGv1AGtmLdw/TtdgnDMH+x?=
 =?us-ascii?Q?mcHNc5nr9FvjmpZ5dupTdZuQHjqFdCEIXKXsSZiLh7NGSiBr6RZX27d2O2hq?=
 =?us-ascii?Q?2kw+BBGVKS26knCKEga59e9+NfGnC91+TyehVkFFReycPVRBXGe+pQIxj7Us?=
 =?us-ascii?Q?ZiioKJngjag1naVQQNzJXvBltuUgw2cDqYvMzLPoloTkzuj3XbFEHQWsfIca?=
 =?us-ascii?Q?iHNGuBGRw+ODByMA30e8wWVZp2Eto2mYvhwpI5wZ1mm9HeWksYBX7md3JgOb?=
 =?us-ascii?Q?TbSMqZDf2W6VXmHlWi+cPlJBYq4D6hgLdxypkE87mhhvdlHV/hH4ThbH2UrY?=
 =?us-ascii?Q?pworsThroJxP2V16rcUSPyIW7pE8dLP051vtAbwWeaD4o/u2JrwRpJBA3zgj?=
 =?us-ascii?Q?m/bUHHM03z9At/mTvMKahIzkdIp3u76YnzahZS1aCDiI6A+ptZtGcFV2FWxv?=
 =?us-ascii?Q?3Tr6EQviBEpugT+a4j9w7Sjcv3zT5eYhH95b+KbtqUS/T3CsO6ubENPL0Oz9?=
 =?us-ascii?Q?8lCeZ82nuetH5m8dPOokwT1j+YjbW55OyYRa/HnC0ULk0vGoU8Wq39yswnf1?=
 =?us-ascii?Q?AE7apXU5nUYVtDCxZ/h6l3rvwkClCR91vIP9qCdW5IPD2J43zW+M/jjpbbk/?=
 =?us-ascii?Q?YLy2EAYyK1wM1XPB+DvDksqlrVyjjkMtfBUy/MMphBvaAVagiSZ1kWdn6PeX?=
 =?us-ascii?Q?FuXtsjPcOGrYmISKrEdo99AASbP5DZLZpwqblADWfE/73In7nx1Ff0BiHMaB?=
 =?us-ascii?Q?yhUjB5SncXxb9YWJvYBo3GdYVzKszNjRSP1fddP29ya2pXseYMb82k9rgwMB?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e139a0e-bdd1-4a9f-5047-08dbf5e000bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 22:17:43.8031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7JgaWxBX8aHTM8LPYY/gCYzpHk7EnbGJgw4x37pg2B0Q77IWGpQNQsyzTNERz1IRCeADmoAi40f0XFM8N+oy0RMzXN8vzyRT2M72PHCiRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6290
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2] drm/xe/xe2: Add workaround 14019988906
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 11:12:02AM +0530, Tejas Upadhyay wrote:
> This workaround applies to Graphics 20.04 as engine
> workaround
> 
> V2(MattR):
>  - Reorder bit define
>  - Apply WA for RCS only
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>  drivers/gpu/drm/xe/xe_wa.c           | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d318ec0efd7d..e8dc463a49f6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -124,6 +124,7 @@
>  #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
>  
>  #define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044, XE_REG_OPTION_MASKED)
> +#define   FLSH_IGNORES_PSD			REG_BIT(10)
>  #define   FD_END_COLLECT			REG_BIT(5)
>  
>  #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 63bd4bb1af03..ce897f2d49be 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -719,6 +719,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  		       ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>  	},
> +	{ XE_RTP_NAME("14019988906"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> +	},
>  
>  	{}
>  };
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
