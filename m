Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B84C71153
	for <intel-xe@archiver.kernel.org>; Thu, 24 Aug 2023 16:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF7910E579;
	Thu, 24 Aug 2023 16:09:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB2110E579
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Aug 2023 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692893350; x=1724429350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ic4mSSalgHr3/DAP6LzLQPU2/P8mOySc4R0+NmDvBZI=;
 b=F2g873SuQo9bchiBL9m07e5zyb8vR2NmhIcEwwk9qjGh7Cc6dpKOtLoh
 KYCaJKJ8vlI/SkTKcLwzQuXm0ba1LHwV+nQf6N4/ugEhDgebLnNUqA/2X
 13WD2odrFYPfJdm9ig5HaNvGlPE9XfGqMfjXFLvxpaTb8QaIE4V9ITrxJ
 PdSHUVs/BFU2f18WvNcMp2c6fqReQBL7hBeAByPvImXnEUs3oHfPnRejW
 5Z+v0OzHX91HEtwn+jRKGajRjJ3P3YCFTwKIJZFgKtiUtGUOfjdEp6c4R
 +UcY+uGgNS+1lR8Ip92HMCfrM4Whs3MtlDCGt5KdTIwrdI4hfcNlNirau g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364675334"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="364675334"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 09:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802591264"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="802591264"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 24 Aug 2023 09:03:32 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 09:03:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 09:03:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 24 Aug 2023 09:03:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGA2P4vEeePgtR2LSHB+PLeDqHev2/p3LeM8QwZMIk1U1mjYSe6dQI/++hRlsTGcNb9YLxEfXEUmKYrp9f68HyXA6IdkaJcE/GBRA1GFK5LxLTaOuP8DDcKmjE5GN51TrN0tDoKSaUwNoFCB8Jgy6auXOmVstwHrfLcsiaqTI6ixGKKMH3THTPpAqVnz0PUugUFdxRC2OeU+GhT0tmvYvOVz1vPErdizC+lVlJmj0/jcK8zhsoTCBk2fXzIKm/q5Za+m9+T5RDoOzB9vYatJSPRTl12N4dai0gzrVwnxvfhTzVYvE0/z0RkjvglLOm9QAFJsWNnxEd9s5ToWagc+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH+FpI8lKOH95yslGNFh+ZjSLq38A8ESzV60iabthkk=;
 b=KJXDNYTF6Z/nQqbfRdvKqPNrmtgtTQ+rd1ThSaiZr4jThAMBaG8AGpIW2p6niy1BG5NNLK0BXUCIVUOBDw1jWPSDdkG/Zc/2mHiNkSV7tLXL2Fh1TAcFC4+JgJv2FvnhatLU88LZ9qiNgo6R81H+nV22wZdZlVKA2DUqPMCnMr5MyxsBghJR3z+tnh2bX5rzktDiVBmAFVe35jeuu4IfhBKvrLuYn2uaU6ssnRkdZk+Qeg/WeDjY5ko5YhZYnXwtGJJEvhcYr0idcBRmY4AGZOoC2+j/gGR51ZMUbXH4eCPnImU7G5f8i/PYcPbpnQPoaLpDPXnva6G8+w3lv3/3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by IA1PR11MB7269.namprd11.prod.outlook.com (2603:10b6:208:42b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 16:03:28 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::c66d:c5f1:1ea6:74b7%5]) with mapi id 15.20.6699.027; Thu, 24 Aug 2023
 16:03:27 +0000
Date: Thu, 24 Aug 2023 09:03:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Message-ID: <20230824160324.GU1529860@mdroper-desk1.amr.corp.intel.com>
References: <20230823114040.31769-1-niranjana.vishwanathapura@intel.com>
 <20230823114040.31769-2-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230823114040.31769-2-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|IA1PR11MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 998655cd-4c41-480d-e1b3-08dba4bba737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQpgbkD+CulF2P3WoRgs57wt+IIMf8VLQfEEzqmnhpr9brxL+CEmw5Dqb9UQs2uPKuThsee/HpWQKge3l1ZyHTjLul/mWFN2qS95RMnS6zql+CSR2zZcgp0z/O3vmv8rwrX91HTR+2NnFZ9GNwlvidW36qU5WxkGIxixaqRiiqhgJ29aD83F87MDl6KGfMkPlVZq2vDM30Dsp+BWwUw5mXg0as0qi2mw98gX8YCeMltIObxlIfXBSrn33WPIds6ULH6Lqaa/3/3pMOQJ6WxgZTxic3PVyJR6sbXR0aA9TD1WHIaIa2nvDppm+Q2HdyN5wRT/4MXusUgI4+vcTO5CmkXJPFKAcu5z/jolmNLRemCzBILT8cMw8KrSply+rlzcKYD70b95uIn5GOTPXk7n+ccxKOtZnKrbvjA6NJqcVDvULJhGYyzZNf/QXtsPk/iyEYrqE1pvb+E8+mOQajlmxahKNet1b//JAn3azd87IPFDT4xpTbWoV0ZR2qHo4V8flo6w7CAB8DT8Uq9hDCRWFdcMiG3e8i53SAD6fO4AWNPAW/pw1zFFS972LzOG9prw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(39860400002)(346002)(366004)(1800799009)(451199024)(186009)(33656002)(86362001)(38100700002)(82960400001)(6506007)(6666004)(478600001)(6486002)(5660300002)(316002)(6636002)(2906002)(6862004)(8676002)(4326008)(8936002)(26005)(6512007)(66946007)(66556008)(66476007)(41300700001)(1076003)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j6RZym7tZGzW/1TZUVVOVlhvt+10VdvkSx8EoMWQASQ9HQTYgtq5N7hagxXg?=
 =?us-ascii?Q?5Qo5wJPTN9BKYJYmnHS3BNVwV203RKKp+UP1Wo4fVJtg0mCIGo54V01Dgx9L?=
 =?us-ascii?Q?CeegSp3OyrHO7pZwQGnGZkFE7zGhxeGcnYHSPJva09zIDC2AvVJ76TlbZQ5I?=
 =?us-ascii?Q?Gs5xDE0JuNLE9OVRApvrN/dO7kJlI6U0z1nVNocyjj/y8dnPNNdXtoy6i1Dt?=
 =?us-ascii?Q?Y3bWY0yp8idQyi9jsViy+A4O9xQORKC+BAhB6dBS3BL0msj7Z2Pwxw30G7Ea?=
 =?us-ascii?Q?lv5mncksev4RyhPjtQOpemG4pNMuactkkvkP10D6G/nkrtYtCd0QCi5ajoWe?=
 =?us-ascii?Q?H2ATyAhAknfwMMcc3nGgSyuTIIGZdQa2YMXNOTS8dteRX1UQ8n2nfhrwvvBp?=
 =?us-ascii?Q?xCHARygvl7BRGgUuk8MpBYsPHnm3zXnY9qmMv2Wrva3+GS30kF9phB76yoDd?=
 =?us-ascii?Q?oew+oBdjHcvdBxvEH+OQZzLi/Abs4LoNoXmiRO0O4LNssVt+/jFYPOOpcDsv?=
 =?us-ascii?Q?tOZXySj7Yr+mIyplplTygVEdiuZUUcPlMcbnm2szWrxg0KImD+jtyw+93W57?=
 =?us-ascii?Q?yzf4yPybdaOVNJssyN61gEfhqcYHMgktIjpq6P7VMlz4h0bdFFXnvGHCP3+6?=
 =?us-ascii?Q?njoCZ0c9I0t0y3/x3GyTku3Q8XGU7Wt3mYJ+psXK24OJbW69ZfBn/SIo57iU?=
 =?us-ascii?Q?Cys5SwfYNGJdaBQSKLTomwhs7ctSgx6TaXVlk4+Z53D7vJfqXE4D4YZtiofh?=
 =?us-ascii?Q?svPaPTRPMrjXGjRvqbXqva6ch0BojmYH6OKBqbQ/nVkyEJJqOOxwRhQVrQR3?=
 =?us-ascii?Q?mlmlj/tAGA2ZRFJNNkPTCNzsWYKfQUSEYPreobm4uqnbW6xR0NpRz30OLIds?=
 =?us-ascii?Q?6GZ0Dou/NHmt49R2QxKrPTBo4F1i91PSYipctj0dJigHrawe1ybapW0Sq2Mf?=
 =?us-ascii?Q?9CBklpojv0ekBDNeM2Vo375qjj0D6GyN/icC4V6hp6GTiKoEkukmS5OHqg3B?=
 =?us-ascii?Q?bF9RvK712kgs6c/KI18RMPNxc+/7XFvof1FgbdFtk1SqI6gbCQS//wWMTgYG?=
 =?us-ascii?Q?fA8fEPsx2ZW6Hc6YyRAj/tLQ/n871vTxxeIQw2z4LX7Ay8vteyauR5PSIZoW?=
 =?us-ascii?Q?VH6jj7s7WMbhehNJMEEjKRSzoKR4/RjqoWkVmUZbCuVVmFls9khJE8tH17FC?=
 =?us-ascii?Q?w0j8urrzJtGmplRF4OwUcjPbKoiUxCvSH81+EWDd9CdUI6mlrj+OI2gX/lwH?=
 =?us-ascii?Q?ckNgdnM5xxGUlhrg5S2zrP/MAKjWtp0qBX3Wbpf491VpxaW+M89UPxKJ0z7T?=
 =?us-ascii?Q?I0TAzRvF+4ZzcNtFy+buHiNx9b8wdAu3VBfkicOT+B3VHUF1mClvgKPrllGV?=
 =?us-ascii?Q?4j/cWE8TGRJQZ84Em4+XIx9QDYLj6zrZaKq3a2Sqnucat49CF07uBv64XyWN?=
 =?us-ascii?Q?Cz/1pSRyTYO/46c44QMWheNgZZGZw7H+DawvYSQHiZrqEFQEU1LazAH5nrYk?=
 =?us-ascii?Q?s6ZZqA8I7S+lftexVsK3OSgddSg4Rt7K2zD/xNC19gyZYuyNd3w4XEkMV3OK?=
 =?us-ascii?Q?pWgd9WZHWe66q/txB0szCGsHwhVEMQUAFpSV+19O7sf22BnJmfkxTC2+RYTh?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 998655cd-4c41-480d-e1b3-08dba4bba737
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 16:03:27.7459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8evJi0IzeRXrOIgJYSSt3w+0eMcLeZk+p9vIx7giD8x4DbywZCNOWQHx0ZHbmEo6R1xyTJl9o4klhcmVt4Ns98JWBl88cPyAjQg7iEgPqpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7269
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe/pvc: Blacklist BCS_SWCTRL
 register
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Aug 23, 2023 at 04:40:38AM -0700, Niranjana Vishwanathapura wrote:
> Wa_16017236439 requires the BCS_SWCTRL to be privileged.
> 
> v2: Define and use BCS_SWCTRL()
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 ++
>  drivers/gpu/drm/xe/xe_reg_whitelist.c    | 6 ++++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index d57fd855086a..1a366d8070f3 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -63,6 +63,8 @@
>  #define RING_BBADDR(base)			XE_REG((base) + 0x140)
>  #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
>  
> +#define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
> +
>  /* Handling MOCS value in BLIT_CCTL like it was done CMD_CCTL */
>  #define BLIT_CCTL(base)				XE_REG((base) + 0x204)
>  #define   BLIT_CCTL_DST_MOCS_MASK		REG_GENMASK(14, 9)
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index e83781f9a516..e66ae1bdaf9c 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -50,6 +50,12 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  				   RING_FORCE_TO_NONPRIV_DENY |
>  				   RING_FORCE_TO_NONPRIV_RANGE_64))
>  	},
> +	{ XE_RTP_NAME("16017236439"),
> +	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COPY)),
> +	  XE_RTP_ACTIONS(WHITELIST(BCS_SWCTRL(0),
> +				   RING_FORCE_TO_NONPRIV_DENY,
> +				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
>  	{}
>  };
>  
> -- 
> 2.21.0.rc0.32.g243a4c7e27
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
