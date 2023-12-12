Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB1EC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 22:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA39F10E0A3;
	Tue, 12 Dec 2023 22:16:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDCE10E0A3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702419364; x=1733955364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2t41LVJ538tmkP/SYWwUbEMyCwv1OtiTLMiq6eLjEow=;
 b=UtwtzzWUrE5HXCmZJgiK+NS480vCY8/nGO0b5j6UKVKAL9pWTbBdtEgA
 pHP6W1KD96iaijVbcVED6yQjNPKDUCpw8Ym0OY1pmhKNTpy3hrUmZl6vH
 unhApnddCXKJXlUGhD5JSgD2/ordWnyn39lvBBW1z0pNkJvNiMCE6ZkcM
 delTCGGbWCp40iREgF35M+q7gBzwilPIhgJ7L4J/3AmnOB5UjFTr73kXW
 RSCB681Vjoz+xEvet0VU7yqp+c7DvkU0em99cABKeQFqXfXDvE2h9ICJE
 rbA60i94vhSEynC0OzbHoD1x3ND70QsbkATHlqJNYgJfILjAigOMlFj9U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397665863"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397665863"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 14:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="807931982"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="807931982"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2023 14:16:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 14:16:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 14:16:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 14:16:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZN15HRcV+m2HVQn+5qUR9SC6RKaFhv5AzdgpcDtltHH/XZD9relnrPcLBWB5VZX+mupd+nD+7W2/6dvCqKLoxjV6KcAUTpeLkuMVvnawuk8XFoJtEtpuOUAeZVEb/sE0/BytWMNecwy1RJufXjeFdrkzMXySdL9eyDEAgAXSzFSQXmo65gjbgr4eA5ALxvYUL6gl3VyO5VlKBlR9TG8n/rc032XOree+XXis6noOJgE26gilPvF4342PZAo5y4wF0gLca49pnZpwERI+d0ueUcsp94TKHU99tUxOd8ZmL2LIYKsMg50A8Dho1kUsYOxo4h4Z+QElWVE9v8kkE/r/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vYDnNl7TrIH9kYpriAJYuOaXLVZJjnU85IV+uSatyY=;
 b=cxlJalnx4/R6KKuxw41PPSw6ECUKfJ75L1IF1blHPVftaIINuurM1qNYM6USugL4LJAJRRagz3HyrUzw0m877vhYEEZGLUCk2KUYZvHkYUvBNJpny/8Qj2GJHBt+zSGoeQ40fLDY+jMHIJ+EZrrHA0spSOg8TQ66tll0+hS3LJBWWxeKRrQqCzp2ZQuCvZdXZmOlb1xUGkVCKdPn2FFgEyNO9Xojh5siCzIQeZArveHKjhdtfLjqEssTwZS0/wuoM0lGFk6pbOu4PXQvWBtEzcnWDTgSrX2921g2JpyoUWiwH8yO5dlZ2gWdVeDP/k92d3TNV/nBmRXAEUqQ7/yqrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 22:16:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 22:16:00 +0000
Date: Tue, 12 Dec 2023 14:15:57 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 04/10] drm/xe: Update LRC context layout definitions
Message-ID: <20231212221557.GK1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231212210054.1747-1-michal.wajdeczko@intel.com>
 <20231212210054.1747-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212210054.1747-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: df31a714-51b6-413a-8780-08dbfb5febfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVS/9DB5jpXMe+X8s7t/gEmfwpZ0D9sGRkA/U82FsPrs0jbFp3o6X7bXXtEKbrsEaEjci3z2KaDEXEWa9GU7oVT3qDH0jngZsi+4WrmBgwKtstlCMWua7Ptl7dMOCF0f5AKraQA/e1+dbayUSLFiNF7fqHIVnm/KiSKEYOzu0FmTrBEJ/g39HA+FTlPwPCqQih+rAkt9Vy2pGsbolL4t/b63Vdv9z9XfoFVsd6rsp4veYH0CtSCgwFvyJykWQ85tiJV5zL2YXHjvLvJNfcCfQPQB8fM/umJv528R4X0m9Wcui7CUSvT+5SkUti3PwgjTPbO699OP7Vq8YbEN0rGptNmg2TqGz8gq5n35ecqbPMSKeXRi6zvYvDZixNIfHzY8BujVg+wOq5qZFvjd7dZDGZTFjXLyrCLRkWyKhn5p8IZrXv9c6hj1a8sHNh6UJYSkg1Ly4hmhW+6chOO9JDp0EEBHvVqwzlQVl9RmdeUfLARpKJk7Xg6muvRbch2vAC++WwKI8iFx9sRAQGAd4I1xrnJhuQPR/BOk7eYj7DKGR8c4+ooWGJj8Tec2kYFsLFHN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(6506007)(6512007)(1076003)(5660300002)(26005)(33656002)(6486002)(66946007)(66476007)(66556008)(6636002)(82960400001)(2906002)(86362001)(478600001)(41300700001)(4326008)(6862004)(8936002)(8676002)(6666004)(316002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rcv5EnBYkmNxsurc4efRw09Y+bBZncYdyu8fdIkXT5R6V8mQaWfd/BjsEQbv?=
 =?us-ascii?Q?St7vB2etwsu46DwQ2ipPcZHHZQVtJlk/yTe99mFTvciJOhHUO5jNvIez9IzK?=
 =?us-ascii?Q?Ni4jI/EvjIOX7STxlwZfiUz/tXBqgy9TVe8MtEG91irtg+VZ4N3WLTucRDkA?=
 =?us-ascii?Q?UUlZc5YQ/YE9IkmbY9KVjyVe3+StwKti+EQhDKJwnZKweoUUbA8+cU/AXDzI?=
 =?us-ascii?Q?dxt+AGtQYWX6eYk+jJ7UVEEu6Ygp6XLWI0CNr5r1LRubIYiRhOrDvlRM7Nvg?=
 =?us-ascii?Q?k1IZd0sq8JTa1K1bZUgvY0jb/kTQ1J74bXG5RUeT8MPkZ22EYtiP9PtIQcNK?=
 =?us-ascii?Q?USZcoG2t6NOOMfmOtdpoc/SU3+f3Prg6xEE+8q4dLHr72Tr4z14lmXdWdEy8?=
 =?us-ascii?Q?GxtJUGIsmrhPjluc2NSWSfq9DO3ujhozr+gB0uJzjmCHGw8DnSVatd05u7II?=
 =?us-ascii?Q?XoIxgQlE3s8zxCSG9HdRvOX9q5XM9ojsdeBYrSxzpPvQ56GfZl1DRnrn118Z?=
 =?us-ascii?Q?fuOXTWkLpufKTyctHx4Ve7KQkhozqybd0UWsX6VLKdEtMLZEsgGkUigrxLGL?=
 =?us-ascii?Q?dyi3B5N+tjc5DTz+R00vLl2R/3GdkCkO0L8IVu/T1rjQLRyjQ4ZRBu6UbVpi?=
 =?us-ascii?Q?PKmBxpZ/K+g1cdPiqVf0ZljNvzYAnzLkLF8p+DPXaTYjFb1Ii8KpbLtcqofB?=
 =?us-ascii?Q?AxCzY0tXqDKaT4/qgboPplcIcw5VRoUaFTz1HD0QdW1FYRIgxcnBAqVwZyLW?=
 =?us-ascii?Q?squP+WrQhakNmVzJm5CVX5zn98fqBXCMTjVMiCZnlQxT6ReYQboxxy/zEjSP?=
 =?us-ascii?Q?Y/TaON+Zc1WFj0XNnor1F3hg/jH9bT9Cpo3OxDi/xg76mf/w37QNfpZBxkUo?=
 =?us-ascii?Q?pYHpHU1DSDm3t+YmRC6moq4D3A14mlhUEgr277F12a8/fsywxhbChtcizbBA?=
 =?us-ascii?Q?LXL2w7YolF3Wy6fzo2olgIWO7xU83NnqOSImDMCBxmGTnjMoBUd+lt185sIP?=
 =?us-ascii?Q?l3WEpmIa4m0MR4J52utMYtIIJU2TTWiGhUhRPCcpBuY2acfnpsAs72MFDpI+?=
 =?us-ascii?Q?Ft9nhr/6di5Ejxr/2ihY++XAmutaJFdVtwKwW68ZKQBVtcY7auKeK0JJbBHu?=
 =?us-ascii?Q?IQqJE+hZYPHe5tbrcHUZjPyIsIe1OT5Xyb7K1JZYQnMUd5+OpxJqZsR42HIe?=
 =?us-ascii?Q?NQ5MeMCS3HpgkhO7RQr9Pq3P/WwqvXAM1vtjoL4DJWaJpjolipc8lhhKrl7Q?=
 =?us-ascii?Q?cvls04Ysod/6JIJPSMNLzcUpNj6pP6QygqGt4KWWUEsGIA6xlZYjN41u2qJB?=
 =?us-ascii?Q?VWqtpkWXUQ7X7YofDyO2OaIHaGoJDF/0WBHE/u6Cz7nTUjC400gnZjpNBnts?=
 =?us-ascii?Q?M3Kq23xf6CNREKpEreVN/LBYHp7VOUHrovThlU7YUpPHWmnmnlcd4NBGFYjY?=
 =?us-ascii?Q?asbH5ajHEN2riYelmZbtPegVEozGodQ1jZ2aUolIFO17sVdzycPif7/qtym6?=
 =?us-ascii?Q?qeK8ECv+6yVC3ttiT1wU7NPsC1+x5L3EaJbSdMTBk9Dbqe+l2vhRpBWIwzby?=
 =?us-ascii?Q?kaVLo9v28gRvQHLYJgt5Gl0vS9qmlbFY0U+rxdMEcB/3yFkz5/u4Zurf6dBC?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df31a714-51b6-413a-8780-08dbfb5febfa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 22:16:00.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNC3/m7ynLk6nJS/qhzeoHwapS1NMBuFyuPh4DqApc6KfwWs27eWeBEU//nLOqRTwZ+4KxyI9+LMr/4KpI9PUS+VvgJapt+ogE0GQF1gdsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Dec 12, 2023 at 10:00:48PM +0100, Michal Wajdeczko wrote:
> The new memory based interrupt processing uses additional entries
> in the context.  Add required definitions.
> 
> Bspec: 45585

You might want to add the Xe2 bspec page here as well (60184) since the
context layout is different.  The Xe2 page doesn't have the same handy
running dword tally that the Xe1 page has, and the stuff preceding the
MI_LRM has changed, but when I count up the dwords manually it does
indeed seem that the MI_LRM itself still winds up at the same 0x50
offset into the LRC, so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> index 4be81abc86ad..1825d8f79db6 100644
> --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
> @@ -14,4 +14,13 @@
>  #define CTX_PDP0_UDW			(0x30 + 1)
>  #define CTX_PDP0_LDW			(0x32 + 1)
>  
> +#define CTX_LRM_INT_MASK_ENABLE		0x50
> +#define CTX_INT_MASK_ENABLE_REG		(CTX_LRM_INT_MASK_ENABLE + 1)
> +#define CTX_INT_MASK_ENABLE_PTR		(CTX_LRM_INT_MASK_ENABLE + 2)
> +#define CTX_LRI_INT_REPORT_PTR		0x55
> +#define CTX_INT_STATUS_REPORT_REG	(CTX_LRI_INT_REPORT_PTR + 1)
> +#define CTX_INT_STATUS_REPORT_PTR	(CTX_LRI_INT_REPORT_PTR + 2)
> +#define CTX_INT_SRC_REPORT_REG		(CTX_LRI_INT_REPORT_PTR + 3)
> +#define CTX_INT_SRC_REPORT_PTR		(CTX_LRI_INT_REPORT_PTR + 4)
> +
>  #endif
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
