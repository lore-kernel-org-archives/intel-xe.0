Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A60C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 16:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA2A10E15E;
	Thu, 30 May 2024 16:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFKUJKX7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D0A10E30F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 16:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717087789; x=1748623789;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/TpDMwVgSPMmdfkRssnn83eUpfCxvj7r+x3BBSqPXII=;
 b=iFKUJKX71MmV9KYb3/Y1P8qWYMjRMnLxN21qGC6lYwu/sqKU60UZ+Rol
 pkAjlAlds3nnWipoPokhakEV5nCheVrsL7BpN3rPdR+bIdBZEWMO1/krf
 pEUfLRqF+z08F//klOio3iErKVHZJZKNQsfsV3oNeoZQu9NADa+pP863S
 lkDCx/XIgVVzp2xTYzDpJpWtg5XAW2Xfxs0Nwf/ZjH7EM8aSody9rB6sj
 OenExA3z+bDHEFS4ST6DpJ3U9gcI4sLtE6fLSG7Z2aIzY8WIPo6LNvLF+
 K1zoFsk7xi0Qm+KS38pns/9Ih+B8uq/Cw/ekJWidseIAByuIzzG5U2Ums g==;
X-CSE-ConnectionGUID: eBLDQQ59SbSrdXHDIIP52g==
X-CSE-MsgGUID: pEbIqmWsSUaV94tqaU+yUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="36124582"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="36124582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 09:49:45 -0700
X-CSE-ConnectionGUID: bw8G1Nl9QiiWJDqX14vGGA==
X-CSE-MsgGUID: YkTLpuYhSN6M3zqjZ6vsEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40768568"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 09:49:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 09:49:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 09:49:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 09:49:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 09:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2GCbYU/ylnHtN9ebMrH0HLXI3YaqtmroJmzCqSO/jWjp9wCK/mUS5sKc6K3Vhec0OipcsopN1rygd2bPHlU9LtfFxDQuGS4uOCtUj2BCfswqvxPPdyI4iwXw2aNrm1QewR0Chiz5VFD7Gx4m62xzMGOivdXIhFiDz0QIXAvZttp2JPOrI9U8gcLehUvUUBFl7+dWs8spVYr/cFsxmpnH644AXH/ubp1HisEGK8SQOaslqLaHejK36yxR79zBn1E5DzmLedMt+lSJ0+u/4Ts2tDBMR1MV9679WhoSncJpGoSfZNSB2ZXHeWSLfn88+yDzlP1tZ8dmOMwHKfCRTdGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbstd9JRov/kGV2HXNii9to2sTzRWt7e+XEJxaJ+GgY=;
 b=VFn4mIKQIPykp/0MpkLYKme7Ih4VkAMx72ggyalcVkLlp5DUklVRAlK7xcB8pEhR6e18x1+43nc+5rag/babApO5mwi8ejJTCaVKjPAbR9W5leIbD/pvnNlUAaqY+GbQimej3nCpserNQ/t9zSVFaePd2/PX77cgbLCq/7hrv5wneqG86s8h9hY7tcdqObIqqin1Y3ypHgfcC1iewMGrWzFt5BClKkjbF2cHGpDl9oQAeThH+ydYjzxdm3oyj+4bsHWokViU5o17kx4st0ChcNiV6GOgyWTWcOtoqOhRg0ApqtKmxX/YBDI9Lntwu7IuOjmErru2zVNdQbcElqxTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 30 May
 2024 16:49:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 16:49:42 +0000
Date: Thu, 30 May 2024 09:49:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/xe2: Enable Priority Mem Read
Message-ID: <20240530164939.GM5383@mdroper-desk1.amr.corp.intel.com>
References: <20240530062509.1529357-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240530062509.1529357-1-pallavi.mishra@intel.com>
X-ClientProxiedBy: BY5PR17CA0043.namprd17.prod.outlook.com
 (2603:10b6:a03:167::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: e2bcd409-c7d2-47eb-14ee-08dc80c880f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?et9ax7+2scoBtxX/iXGYUqdPbKmVSkU4xgjiNqBA41YWW7GDJdkwTPt1GYwt?=
 =?us-ascii?Q?G8gv+nU54ex0LqMglaQJ7Qbmezi+l0aLAkvuTyAPwXM2OkDmNBg7BNYNkidL?=
 =?us-ascii?Q?e/ZDAIj9ACFT90ppm2FC5qR+AkC9sJfR+gDNCLTpdoYN6mPnLCuoD2v6T65d?=
 =?us-ascii?Q?ED62WeKfgRy/nDHR69QIODTotqCq2TDActI1/ZHBy4rQZs8u/0mJ2ZcDttEq?=
 =?us-ascii?Q?1D8847pJRpvSygzb52yipt/vtlqMOvZnV+UBj1PBQZcyForfFzr+5aAM3/Ag?=
 =?us-ascii?Q?zswr8KG6ZU3BsmcJ9amgK3MN7sb2CXHW5XE4hnw50dGF5ypqOEdE0/IOlETb?=
 =?us-ascii?Q?U42ujI5VVaH6AC92HDBf/LvyvD1d9cExRzI95h6FkfDDUmVtTQX1Lv+vwTfF?=
 =?us-ascii?Q?gLHlxV++zuiYE8m1T0gDXqZhMqueKVSBK2o8knKG6TnMUjPH3K6gtGIY4T3R?=
 =?us-ascii?Q?6JSafn0yF4xekYMCFvBytXJH/OMa+xUSF7quHDjy+h3qgYhw60oSg1tqaVT3?=
 =?us-ascii?Q?R9IQib+RZXr0Sf14dKD4duGZ1iRkkoS+wuEh8X/NZ1Hp1fm71yT9CNkvTQq8?=
 =?us-ascii?Q?LpCBKCa0cSaBmzvcXwCLylThtBrdtaEfsELks5msEO6LZiM+Q1hPETHIpAoe?=
 =?us-ascii?Q?s6VW7CgEJ+nJA9Z8N7DgQnQHCvjrpnkHsiw5vVG49QRcNECSa7JsD/K80oRC?=
 =?us-ascii?Q?TlEjAQM00SbYB9yJdoqTZ2kaSPhqjs0Zb2xggIsZpJtgdIss5eSDslaWSbJ0?=
 =?us-ascii?Q?U5+eQvzKN4s+6GyV05CIIbS1+b4bVY/FQl+GrEJ845qRTYbLQEb7c2fF/Zef?=
 =?us-ascii?Q?MdfrQS87GJh+7btyDXaYWD6dMhtkenk6rhuMsD6LjXp2kDQA8+Chl9xwXsk1?=
 =?us-ascii?Q?n8ghaYFOACDyfbs04nZ4vd6pfSH4TpmdbxXQ2A0/Xr9KAOihCmptPCdQY+NK?=
 =?us-ascii?Q?dQRnvhI3WzFisHXddFHO2vn81wdd4n+9OwqnItypMRBR4PQiHrh3JkfxtGe+?=
 =?us-ascii?Q?kOWj8RwDRcCsO+yfIeg9E7dyE3Fp26Nj9FfIwsSKgPUHHPilHG4iuIraNwT/?=
 =?us-ascii?Q?VU/UmE8dqCvyrA+r4Xnrep60zkzyTVr9hZ+yqNLMH6vJjpesPcWyqVhFA6C+?=
 =?us-ascii?Q?+paUC8yHPVki1BI709UfgZdyAGuUvm8wp9pUwYYjv9TDvy9HAGtxpq3M1Kch?=
 =?us-ascii?Q?ddh0AQ+TJviuq88IymA6S7C5snC/vv8qWtubsAdlxmq59Us41HMDf9kQe5/I?=
 =?us-ascii?Q?/edNUcMr7Jz8MCTlWd7oimq39A1klIPQb5AQqp2lSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K2VfbkvIys90I7Bh8SnBlcVMSkIodSvKjZTOZ1odQ2hEjwt48hm9So0CuN/y?=
 =?us-ascii?Q?behWWuegSRez4LVb0kZbiMbVCDamLAsV4b/vT1yl8jAlsC5qA2dosnJMsZW6?=
 =?us-ascii?Q?BIwbbAezc8ArQrde9Hl9H2GntAO99UIWRSObWKIZB+AonwgwkS+7L4ehvsrd?=
 =?us-ascii?Q?QrhXNp7Nt4nYu8bwrtS+tm0nTEa8T6AIc4a6rXg+2EqiVm2pjJMWFNyoF/qy?=
 =?us-ascii?Q?J/8rjP7IrqzhYxIHIFWXL9hXEQIznp00hm8HasgDvx3TzHedrirAEkhDD67Z?=
 =?us-ascii?Q?ZB3qrQMdHwPiyhaT6yKJMHeIrLUNTgzeLAhyXR5QvvTerGx7sdFChiZeGDuD?=
 =?us-ascii?Q?O307YLAAWWTkM7kht3XALp++4cQWWky+fBueH55nU37Zh9XHn3n8orQLbIb6?=
 =?us-ascii?Q?V4jF34crvbhmNFbOqYg+TDC9mhwetMXDybmYya/Z488GxFNtzPnJOxiaVQVk?=
 =?us-ascii?Q?aH2IUgXeJyOySl6mbL6YjKFYDa/Auud/w2wrbXi6R8qfNiEP3BxXUu5wtXcY?=
 =?us-ascii?Q?Xyu415qZ8OtxB8MVCBXLJxvyRQnkyX06fPEhyZSxKGjvi3nXx+IrgoZVNluK?=
 =?us-ascii?Q?uYCLe4UMotEbKUfyKNX8kaxd+m14AO5l0eWmH8WQn0UAMPpJFB/FfjucBppX?=
 =?us-ascii?Q?nTmSmI9BrJ4u6Gj2aP3hJfIkxkTjIExc+511N/E4C18UitFLalOgR/bnt854?=
 =?us-ascii?Q?LES0m5lX6Mt+wBHwlrug01U+vt5buE5qHLQO07uapF6c676SUuYrZixKjO2x?=
 =?us-ascii?Q?V8P6GtmoJrJsDm7+oG3SwAPVAkjnwsTgTPwq+t1RMHcdHuAcjB1Y/+xl2U+e?=
 =?us-ascii?Q?sWDTTx28hNG01Klhm2gTbw0myXGgHOVWQdC23aLm3PDgo7TvFr5WMgfTvA02?=
 =?us-ascii?Q?mQfs2rj6Z5TOAbOJq71mN3PdC+s0cH8CDlCVZWCUXZhGFZB/i2uRp16BUYB2?=
 =?us-ascii?Q?f//6cFDR7JkVAJMxWyTMbqyJ659ewBDfrwEwW2VxxNzl9ihvvLAuKUBwMiYC?=
 =?us-ascii?Q?Z7LNvFcIeSMfbznoOujnG4f8cPM2YOcOb1z9jhlGYImCftkp6w2lxUkahKev?=
 =?us-ascii?Q?Lw8oGUwuUKylmvRUZvDJp9H7se6O808nUYhuWZCOy1QkW4cZ0MCJLe5SvXhY?=
 =?us-ascii?Q?kqLYf5tST/x3yKJ+TnbsxdOheYYtmyBA3FCbtIbDFWQ76eJwL/2Tu4pvGF3V?=
 =?us-ascii?Q?uQ7s76rQySXqd07EhbrvhOIiOO5vrw42zAR9kXWns604JQl9r1FnI3G/HA63?=
 =?us-ascii?Q?B/fhQoelVVIL0ieUVmWKBC6Grtr50vVlDJq3A4/u4X5BggMnfHK2Bb4gehq+?=
 =?us-ascii?Q?yLB/AjEok21F6VTOQ5XajjwpPTZ3gTTvjuq0qed24h4BmKU0SwRAHfFoQ7fh?=
 =?us-ascii?Q?K6KxoZ/kNSTIgvIfs6w2s4xNK9KYZFvYJ5Lr3Ewbgtf/8vLA30Ck6tjBKvB/?=
 =?us-ascii?Q?UjjA5rCDHLlacuJtme6hkl/+QXR6SDLk8a1dK/FIX4B1gUVCZjwWXkMbqifZ?=
 =?us-ascii?Q?z60vHIKeGiiHNSOPMgab36ZVGOkHORZAbeO8Kd+X4QLGKriFQtrYsE+C654M?=
 =?us-ascii?Q?h2DL6FkvjQvT82PPa4JqbipiDcCXiurPsgFyzbBWgvqv9O2lE34OuZGWo7g3?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2bcd409-c7d2-47eb-14ee-08dc80c880f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 16:49:42.6642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8Wex1TAPXsaJZaqGlS+Gf+4TP3r/babO1bxNjP7DnXw8f1hguCDq6TXfKQ6oAt7ccEmna+uMsS6MyYLL0K8jvksMeM4TGxJh0mqqdV9Al8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
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

On Thu, May 30, 2024 at 11:55:09AM +0530, Pallavi Mishra wrote:
> Enable feature to allow memory reads to take a
> priority memory path. This will reduce latency
> on the read path, but may introduce read after
> write (RAW) hazards as read and writes will no
> longer be ordered.
> 
> To avoid RAW hazards, SW can use the MI_MEM_FENCE
> command or any other MI command that generates
> non posted memory writes. This will ensure data
> is coherent in memory prior to execution of
> commands which read data from memory.
> 
> No pattern identified in KMD that could lead to a
> hazard.
> 
> v2: Modify commit message, enable priority mem
> read feature for media, modify version range,
> modify bspec detail (Matt Roper)
> 
> Bspec: 60298, 60237, 60187, 60188

Nitpick:  the line wrapping of this commit message is very aggressive
and looks a bit cramped (it seems to be wrapped ~column 50 rather than a
more typical wrapping around 72 or 75).  We can rewrap it while applying
though; no need to send another version.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index 263ffc7bc2ef..4e8f9a61f0bf 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -104,6 +104,7 @@
>  #define CSFE_CHICKEN1(base)			XE_REG((base) + 0xd4, XE_REG_OPTION_MASKED)
>  #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
>  #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
> +#define   CS_PRIORITY_MEM_READ			REG_BIT(7)
>  
>  #define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
>  #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 9eef789be897..f03e5cc9063e 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -424,6 +424,17 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
>  					   0xA,
>  					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>  		},
> +		/* Enable Priority Mem Read */
> +		{ XE_RTP_NAME("Priority_Mem_Read"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED)),
> +		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
> +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
> +		{ XE_RTP_NAME("Priority_Mem_Read_For_Media"),
> +		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, XE_RTP_END_VERSION_UNDEFINED)),
> +		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
> +				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +		},
>  		{}
>  	};
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
