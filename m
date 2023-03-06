Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E870EC6FD1B
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 22:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E62110E420;
	Mon,  6 Mar 2023 22:05:07 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B138D10E420
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678140306; x=1709676306;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E/bg//gJOsScEFaFkZ37uuxhtFyN1f4lKGoFqQgux+w=;
 b=niRq8Q39lFuASb6d6MAN0y/L+F9OSYvoUjJzpv5kZaMuVyKpKUYo7YQN
 K6+19lLm8mXFvAuWQWPU28X4bakDBi9x4IloGOpSG9285MflXV8+8sTz0
 IJUlbXbF7V5xaVDbgiyiU1tUYwBhJMDlVNM/0CSbj82WvNsb3x0aFcA1Q
 /sbUBNS2D60pt9BJkflDVAMjOnrxSfcZBKgdgnvJU3pPQs6BcoFzXobeD
 BxrFD4u4B75W4+8HQ4JczNIj0ldT8OkruQQfF+IYofJNmAYkieIs1AO98
 ZAGpTAGVnebeESBdJG0QlDOPx767N4eQflNjBdjgoZ/vWdZdDgmJ1touw Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338012657"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="338012657"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 14:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="669628725"
X-IronPort-AV: E=Sophos;i="5.98,238,1673942400"; d="scan'208";a="669628725"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 06 Mar 2023 14:05:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 14:05:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 14:05:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 14:05:05 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 14:05:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsyZju4brUm7jgktuyksy3fwsvnjU9wdd5MWajGBTNNGSaya9YEerZm8CgyENWKhDaGO2Bkr+mnIzX+oBmn8pYyCNyH3wGCwo59IL17/586Y4z/y7aMNJXWMBR+grt0m60NBnrD20qxUheznI+NzUOrTadpV6puyhUOs93G+K/CiMT6as55abD6oTAxi23mS3la+j6PHATMYCs0p3YiEyWG4KsLzaARbZnKxH3ZtNSzNZVXOwYMsdr3x6Eq04sTPnCfXHVaIEMNKBv3eeeSiwjC/b1W7UWLxZqvaceH31IikCiI3p98QxiMBwc0NyYOOD0R2MBulH1FnfC+ls/V8MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEHXtvT/zGAjBh6Or2+6uEnoliNNFSRXSHGqk73/3NA=;
 b=e7r5aZdXbqk+OV5MXnWQvH7S53Ioi10JFaIv2pOQnx1dhIfxLT/xjRRMI6/p5ASGGbxUe3uPJwBrbmrKF4thQk1Ub6nlmXpMqXrvXjOLXSWD0BKIoRoT5/+/hyByxeQTLuomk/5HVJ56cnh96X6VoibrPWSAASzHdSXbfvRomyONaHkAx1rGKHQOp+pK8T/CU2cf7vNNVW3slnR+S7h8N3Y4qPVUwo9PxjgwjmKB3Iaqy41UU8DN2Uxcn7UjH8XcWCG3eDOsK0F4wi2+pwdL0WAOf0EJF3EOdoddxZjHBPCd60PsnLSRkWRM8tr9n5WypbIVykv1epUynZ9c7sd2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 22:05:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 22:05:03 +0000
Date: Mon, 6 Mar 2023 17:05:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZAZjjGdfNpNmZoDf@intel.com>
References: <20230306212450.803557-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306212450.803557-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0130.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 4107405c-36c9-4652-3b6f-08db1e8ed62e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m8y88RZI9yn55U/3qeB5J219MHz0eW+pW0Hci2u4L+WjUwjY6bLrhw+QcqG1XZd8+x8zHaHC3nogr2YPP/XHEeOsSxLG9iRRqw1nmXoEUwHWpCA7f7ajL8Xy/OTHkbW2xaS80riZa5hzKd5XluyuRPchLCS9MRUmP8tuSLxA6MzvGd1MRtQR4RFZFeZNZNVuT6ZdGGm492k/ru1WD0i6HJHT40Rz2efbP4QmlGDjIwZYDMiUsSwoTeCBxGcz26+eMLRNJMHg9tPRrVCRm41xb9q3pQqZ6dikh4jI08oV2biGr+9i+5ziavqjfsTJbcKzLpSLmpbwKst9ML5fM2E7N5w4zEc45SZaQaM+26BM2tZenUvIimccwBziH5GxIJRvrVbvT5mtHC82MbvXYgXS37mgt8zSX2veh0xeJqeoiFfV8UOaaeJrygMCgs/lFhJRy56t6HZLFllDf5tM3/GAkuFQK7IT0zpC9AScawDdnP7i45c6BOeTu20bbGCgIB5hDA5cIgjF+pL7bOZQcouT4TFgpsqCA+rqpN/BTPwGWIsD2+ELJwiQAhNEI4EKf3aPBhC9pKQsc0hqzU1HQ2XB7auZrWpuDBcS89K79wjVn+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199018)(82960400001)(86362001)(38100700002)(66476007)(36756003)(44832011)(66946007)(5660300002)(2906002)(4326008)(6862004)(8936002)(8676002)(41300700001)(66556008)(186003)(2616005)(83380400001)(6506007)(6512007)(316002)(6636002)(478600001)(37006003)(26005)(6486002)(966005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?374y80AUkhojevgoGN1YnSW3EmpRtDim5GkpkYeipH1eZux5Btfw02gyXL?=
 =?iso-8859-1?Q?8gyA7UKoJgrgif0csQ3htG9mBM7A31H7VOjieXJ2F9F9rcAtG5zNY8cKSa?=
 =?iso-8859-1?Q?XAKzOO8L816N0KCCRt9yXsdgVWJEWoet2Xx8gLmPbg9c1MetLvdvwkSO9M?=
 =?iso-8859-1?Q?oQ+LJYYRxfSeb+UeUAtbq7t/6/WmD7u+62IVAz2sM1DR0HRoQLG2Rbbbtg?=
 =?iso-8859-1?Q?RYC8jMQAUuhIRDiL9fWUmJlMKxSY+//gWE34U9uOXzFYlbYx6R4zgx6WGP?=
 =?iso-8859-1?Q?XabRNIGF2+VA/v2OWEvIsIEySFCBl/mNa4M8ehYL0p06rtUh3uFkk27ibD?=
 =?iso-8859-1?Q?grmK6ZXDLNpKJWr4QluDNia6VZ08SYi7aGw3w9FfzoczHSaiCXfowltIQP?=
 =?iso-8859-1?Q?sGTebi52KDghk9zw/Kr74fSpEqvb0PTeW7DpN+bnNon6YorG6ESqTOrqUT?=
 =?iso-8859-1?Q?6eE9MV0CyXNp+MmQFVJDUriKUx/V04ktTblx5VkM1xXZ/pkI/CDjLiPU2O?=
 =?iso-8859-1?Q?I1ZHDZQx29s95bldxQjBTl5c9OzWqClbsPfv5iflaNT3e6mK2BeL1eZGE4?=
 =?iso-8859-1?Q?2sXOU0823kKjm3Jv6RdHFPVXcfvjb+nCq16oLrBeSGUYW8dkIJHRRTK9I8?=
 =?iso-8859-1?Q?TxkvzvVsLXE3LEIGxl5CDcoQSZyf+Ke1E0JPIdB7Rm36R4dBh/U/t/AF7R?=
 =?iso-8859-1?Q?37FJXRzK8KOtVpjra+OiuIf7gjjjqWyCPEYexfq/bygsln6BVjoQyeBtCi?=
 =?iso-8859-1?Q?YcHHfTNGyc2iDewsfLFUKR2Wl5HyW8rnMl7AVLBWTFFdi8simkvr4ZkjxL?=
 =?iso-8859-1?Q?C2mc+bsCkMLX8qPNBi/mEerj7kAj7zHG/KTEuhaZB/n9Celfq+p/uIbyKe?=
 =?iso-8859-1?Q?wEUiDcHZkFyZJqbCyKz55XE2s2MKosMUjl4WeCVTdxeo16LGNt9CRDWvUu?=
 =?iso-8859-1?Q?wsfMKQ4e3ToJjF0fSan0TYdMSQw9Z952GS/4nJE+4CoWmORzFObSKH2DKU?=
 =?iso-8859-1?Q?ARzoFScr4yXnAfJpjHETz3fvnWFUv/Kczby2R/PUbmwz0zuyL2feSRpqDJ?=
 =?iso-8859-1?Q?FFcmB5VoJGXuzh3IUxKwAV3TVCNekd29hh/pulm1Tz0Oq+Df4HhQ4x1hHL?=
 =?iso-8859-1?Q?/gQo5ew22hbVT2nWWFO7DT8fp4cC02Ju+gCMk3IvKt+z8VXyCOKnpY3H/6?=
 =?iso-8859-1?Q?vZ2Pd9nwA75V6NaC8zmleWZvUDD4hap0M0LZ+t75l3ZYYTrse18bWg7OB2?=
 =?iso-8859-1?Q?Vuy7/b7tiusUOCS4NcHSfdamcrFFYrHAtp+FCCj14H+5SDZIob0bkPo0hs?=
 =?iso-8859-1?Q?MFLaVMpxGnZjrQUxeJOpoX/G4MM02d+uAn6uPzniDUiGnPydt1WF70YCL5?=
 =?iso-8859-1?Q?Wh/yt7SAxTzWU7XLFG7lk1pOZ2TZunTvQyAExUc9lxczoJWm9juCMZ65qP?=
 =?iso-8859-1?Q?RoS69MECVl/r95yFOa89x2Gka01Ad5L27JRBgmcyrmQSEc6nxfZKzpeGob?=
 =?iso-8859-1?Q?HkUOLNF6YheURwi/Hpla7xTM7v4FPFDbbOlNzcLFbiu2eVg/SsKCGRwxVO?=
 =?iso-8859-1?Q?XGgKwN6t9op988sfbcwj1928X42VvbeiJunrejRxoy3HG0LxreMwFsNBAJ?=
 =?iso-8859-1?Q?GOWxO/EbJFBdkuaRrVHIx8RxsvY9kLvO2SDWBxkg94/OkLOmPjZ3I8iQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4107405c-36c9-4652-3b6f-08db1e8ed62e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 22:05:03.3568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXCNiZLH+ojNbaSslA75wUEKZhImX/GJgs4Io9NNXBSnkBCWjeahGm930MyQeEKt+6qCN+J0sVFBFLmpV8QQ5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix duplicated setting for register
 0x6604
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

On Mon, Mar 06, 2023 at 01:24:50PM -0800, Lucas De Marchi wrote:
> The following warning shows up for TGL:
> 
> 		[drm:xe_reg_sr_add [xe]] *ERROR* Discarding save-restore reg 6604 (clear: 00ff0000, set: 00040000, masked: no): ret=-22
> 		[drm:xe_reg_sr_add [xe]] *ERROR* Discarding save-restore reg 6604 (clear: 00ff0000, set: 00040000, masked: no): ret=-22
> 
> That is because the same register is being set both by the WAs and the
> tunings. Like was done in i915, prefer the tuning over the workaround
> since that is applicable for more platforms. Also fix the tuning: it
> was incorrectly using the MCR version of the register, but that only
> became true in XEHP.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/233
> Reported-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 -
>  drivers/gpu/drm/xe/xe_tuning.c       | 11 ++++++-----
>  drivers/gpu/drm/xe/xe_wa.c           | 10 +++-------
>  3 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 4d0f09cd447c..c025c6dbf3a9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -70,7 +70,6 @@
>  #define XEHP_FLAT_CCS_BASE_ADDR			MCR_REG(0x4910)
>  
>  #define GEN12_FF_MODE2				_MMIO(0x6604)
> -#define XEHP_FF_MODE2				MCR_REG(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK		REG_GENMASK(31, 24)
>  #define   FF_MODE2_GS_TIMER_224			REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> index 624b257ecfbc..2861a014c85c 100644
> --- a/drivers/gpu/drm/xe/xe_tuning.c
> +++ b/drivers/gpu/drm/xe/xe_tuning.c
> @@ -24,11 +24,12 @@ static const struct xe_rtp_entry gt_tunings[] = {
>  };
>  
>  static const struct xe_rtp_entry lrc_tunings[] = {
> -	{ XE_RTP_NAME("1604555607"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
> -	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(XEHP_FF_MODE2,
> -						FF_MODE2_TDS_TIMER_MASK,
> -						FF_MODE2_TDS_TIMER_128))
> +	{ XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> +	  /* read verification is ignored due to 1608008084. */
> +	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(GEN12_FF_MODE2,
> +						FF_MODE2_GS_TIMER_MASK,
> +						FF_MODE2_GS_TIMER_224))
>  	},
>  	{}
>  };
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index df72b15dfeb0..71e9e1a111f8 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -265,13 +265,9 @@ static const struct xe_rtp_entry lrc_was[] = {
>  				   GEN9_PREEMPT_GPGPU_THREAD_GROUP_LEVEL,
>  				   XE_RTP_ACTION_FLAG(MASKED_REG)))
>  	},
> -	{ XE_RTP_NAME("16011163337"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
> -	  /* read verification is ignored due to 1608008084. */
> -	  XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(GEN12_FF_MODE2,
> -						FF_MODE2_GS_TIMER_MASK,
> -						FF_MODE2_GS_TIMER_224))
> -	},
> +
> +	/* DG1 */
> +
>  	{ XE_RTP_NAME("1409044764"),
>  	  XE_RTP_RULES(PLATFORM(DG1)),
>  	  XE_RTP_ACTIONS(CLR(GEN11_COMMON_SLICE_CHICKEN3,
> -- 
> 2.39.0
> 
