Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2435C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 19 Apr 2023 20:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557BD10EAD5;
	Wed, 19 Apr 2023 20:25:30 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D54F10EAD5
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Apr 2023 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681935929; x=1713471929;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XaI96DkKeHG6gkdhE1ujQ+2s5Y7ZyP3UGwKaNenQVms=;
 b=HiVaq7XmtL7YxZ26JCI3s/8ZD+afg4tW9/cJMSGSS8e8KvWTbIyclA1I
 6X6pGy4ONf7dFJlUaCvNxgsHPNnSOarh3HJFCjhAlmGOlDHY5ZCXFTMEh
 7nRUzLuRXjANuCdikkL9WWX58OLHccuwK/yhN0whrjdsUOCoMjvWlUAPY
 RQ1mJeAI5A1TfQ1iv0NypyUFa5so/UzBlefRn/qEHcYieetCqQ9vkQ6E4
 yEKsNIGxZBElu4pXjUVXmuOi80H48SOohGOga7sqWnz9RiVeEEoBgeuft
 rGTXSdLZKzVvJguRjJRqfhyJjGE3jrSCx48EQeJPvW9LP/RYHQLCSGFpP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="347409077"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="347409077"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 13:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="803038426"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="803038426"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2023 13:25:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 13:25:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 13:25:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 13:25:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dxf22C7d0BzXtVPgvMEM5uqh4gG5BGB6O3PW3hWeJ0LvL0rK+t5LV6CYznRvhgzeGhJCqMEPyZhYBMVQk609BNF4bkXHggJ2OPicWUxJRDI9T0t6ZjWv+BgwkEI3VcJgev+Ldc3JNkOV+X9fFqi7miqogt9rWIaZ7RFBjlxsCs6+LfuZmr+dSxXdtqcbfo/A64Z/OxI4DqnZZjMvJuvzZrJ2qbeFkS16PHf3yFSSNMyjA08Ouj1RCJRrJtfkbo/J56ywAj+ZWwyGBBZ0vHXqZsGsavH4ggFfaF0L2ChwvzP92+9vjrSmuPdYfx20Bha51P+efA4EN6rQ3EC6Y5OYfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58k18I6wYKLSkuybF0sEiOUFRlIT6mKTKZeQkCI6Mj4=;
 b=oY9UGPgLXqfdVMCyf5aTR15W0blXYRH+KRzP/5pGRgY07vHjX6+TeCpPLQzlrj2SIi042Xwstoz6z6mv8xJngmRz29xUA6lJ84FjX81uyDlDsdRWo/LDYw3bhXrss2IU5JF7rmUSBnaKB89LL8fOXmfitro4EbAUy5jVH+p6tn1v7LaYRNf/yowmpuYICrSOEl4fBaq0DtNLqw8noT4orX+0Re0xQ7odZ3xE0HwZQrKSyg7QrbbRhYQX7DNOU4qmElewnSkZNB1d/lnUW5MIClcOAa8XAGwFJNEOtKY9+HzTNaGFHgpIJxXCin4RG5QNdLo5bEFNdGFg21WLsxiHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL3PR11MB6531.namprd11.prod.outlook.com (2603:10b6:208:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 20:25:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Wed, 19 Apr 2023
 20:25:19 +0000
Date: Wed, 19 Apr 2023 16:25:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Message-ID: <ZEBOK945SSdHDh4V@intel.com>
References: <20230419090933.289818-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230419090933.289818-1-riana.tauro@intel.com>
X-ClientProxiedBy: BY3PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:217::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL3PR11MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: a23f5c78-2cfd-4020-5a29-08db4114318e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gvmeTYkhdc8wRH/h0uRSOn8YBzrCd2uIbM/3W+OVChMUcn5LyZCBmEGUqaOd8Weu34jMZCoAXY9CHQ21N/uzz9lQvfFsSOan9+4CG8B7dI8J5qVSc1v0dA19ua5LG350v/gVwS/9ManXyw8d1iuwHxQ0oW5Ke8U8lPiQa921yfMlFKV13bn9DJb0YFPZyTGjZwaHPgor8Io9ULJG7nwHrlH3ZFzwR6liWQEOvxQpGN7w5SrSyip3r1NG1V6W5ncoBf2zdfJoSZZoTsNP6XI4N0odtvxloarUR4J2vLyhjge9/O8W8rT60H0ZpagFJfuLQMEOJDC8yI2pgXtZQhLZOMuRc7GZ40c6K2bw9+kp6+kegdm422DdlVAvIzah7tpHuQHSnflEW512/J1bOivqfT6HHZLOl0wkuTq3utu1Ol5ipQxI+1v4977IC58ApN+v7gLuYwvTWXjjKu43M+Pvo9aOzDwf+1JHmz4YxGeU7B7i1+RrV3k5G9TM6pkhuBcS9aKxsX+Mf9lFN3wpj/d4I0Of5saLFeQh3pibImcZKSRj/ORWS6P+ChUfEy64rEpavrdD6pPGUxk7VSto6jt77HgoQDpZ+Dbeyt3pElyvb44=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(2906002)(44832011)(2616005)(478600001)(6666004)(26005)(86362001)(6512007)(6506007)(107886003)(6486002)(36756003)(186003)(82960400001)(41300700001)(6862004)(8676002)(8936002)(38100700002)(4326008)(66556008)(66476007)(66946007)(83380400001)(316002)(37006003)(6636002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dwVu/SFmW/uOLyuCjUlDrMgOeIrx11zi+cVU+UCFxYnm69yl7FJ6ojbYLutD?=
 =?us-ascii?Q?8YlecGgwBifnTnQBTQNa+mWnkOV3l8XQxp6m+KYoMg7tMDCBtQke+OyrvVLp?=
 =?us-ascii?Q?rx76p0He9lFn0pe7qI/aF/89+yxleaBAUQ/VpYKXVIcGWKubzb23waYFyjYJ?=
 =?us-ascii?Q?DDW97kB43CitMoFuckOpYSxpbVa5JXTrcVcVg5fSuOsZZ6F0R6CHLPDyFZt9?=
 =?us-ascii?Q?U0BIVRVN0bNiRbe84eCzgwhjSqNS8AhDeqfUyJ3fhLVBNUbycfIzOv5NrByp?=
 =?us-ascii?Q?Y+u6xX+IuYvfTWn1wkuzJirM9zfmZj1NXi3V+QRaeeZXkSHSi2RnZ8ttD7HQ?=
 =?us-ascii?Q?ImUQxHzATTT2yde5BRWZ5Dg0yuXbpK05t+OMb+l9g2Ye4xfiyYNWEY3KLMaS?=
 =?us-ascii?Q?FQ0LRVsYygZocWVEwFHQckTmNqjYarhJX7v1lcJj4gdzoZNv1zz6+1BAitQB?=
 =?us-ascii?Q?bihSz57VrzVFYfXnk1uNIGBh0KYpmy7yueRUBUxGcPBQa/7Y5oqt0v7p4ldb?=
 =?us-ascii?Q?aHpuuGnuYwbpQHVypKUGPPNhTjg8oOM5wIbPFDUK78u6rd7nGtl5fHqQMPai?=
 =?us-ascii?Q?sIshAqtONYnxH7DiVb3WAJ1J7lhspmozIGdjBplijgaeTv620vmACkvu8Yw3?=
 =?us-ascii?Q?+z6+YYt5nu+gNIKrMoUJOBC7EjV+HE5lEANCo8SroJhyX6gnAF7xNi6c0pEb?=
 =?us-ascii?Q?qExXeN/aD3RQQn6Kv6y5S2vPbzC6J+6dbjswqrUhQV5YXjZ+YAtWhg//4nz2?=
 =?us-ascii?Q?MnZU1a3+af/9cisbfdTiBf1EzeVmrfx8T7Jah191CrJBE/+x1Ne4aprbnQzt?=
 =?us-ascii?Q?q5+BHMYJ5LIECJfZDUSp2lFazO32dFcje5ePjuTZPGOpPDsDHVYLUyDrhu9+?=
 =?us-ascii?Q?DRVTr54ACh/+zut1VUHgzl1NdJ2RT7NEUjdA5y2D30Ky4glIH7zIPb9msVU9?=
 =?us-ascii?Q?WWGJxvOCgeISVL8COxtEeDmyDrIUIeHCYJI88qFQ1ofcXaNb4xEuOnaLdfGQ?=
 =?us-ascii?Q?Lt6wh/pD+9zJEqaF81FUNxjulIMSBK0uhBMM/1nMIMLMayeEKz1fQVS5jdu9?=
 =?us-ascii?Q?kFVQfLMt4PcZpCRRnf1T7gGJbXyjW7uRV2lbp42ksdrfuxg6HwNAbgXIV4Cm?=
 =?us-ascii?Q?IXYdx76Rlvyl8pebr1lFG/SQicYn6+vcB3q1o4FlPEcq6am12IpMYogHIFgD?=
 =?us-ascii?Q?z2567DguqgbY6q3Ug88onQspxalDKwLnmLFvfzRQD7MD3dTxAZjAyhqkpe77?=
 =?us-ascii?Q?1y8NEYsKLK0/P/un3lnv/LLCKErfoH8ZKO24448vUHHb4PM1kcufYs4mwYA4?=
 =?us-ascii?Q?eafU2FLeDA/8MJ4wTHWFWU2eDqJ3v0IVUt0WoIMB6q+u4aq0bkqHBIdkaSid?=
 =?us-ascii?Q?bF/HYYLUj2tm1difbx+jcNrV4x2a4r+sZ1MGkCJBnxB6In2Uv9ojlAe2oEnt?=
 =?us-ascii?Q?yiQpLhw0ghN8OT5WWqesdeXcTsktl5YjLojZRqgkfRVQgd8fnu5h/Icha9Cz?=
 =?us-ascii?Q?p1cSqt//evx3YMRkPA5g01WXSdjgRVkEhj+tvDHXz15UBPP0uO687UGbTVlG?=
 =?us-ascii?Q?PBgHKcYWpj6EURI5Op40LxlvYL3LcuCIh2Kc3UUeY1WsE2YOVvm7ek9WFQDF?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a23f5c78-2cfd-4020-5a29-08db4114318e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 20:25:19.2806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGu/RlkVjSje/gNq5lDpUsL3kMxfZtfkmwSGm4n/hS4AUPhIO+eKfP8YMJGL1n+t5IyTedOyrk3rYJc8+l5iRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6531
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/guc_pc: Reorder forcewake and
 xe_pm_runtime calls
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
Cc: anshuman.gupta@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 02:39:33PM +0530, Riana Tauro wrote:
> When the device is runtime suspended, reading some of the sysfs
> entries under device/gt#/ causes a resume error
> This is due to the ordering of pm_runtime and forcewake calls.
> Reorder to wake up using xe_pm_runtime_get and then forcewake
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 5a8d827ba770..f71f6b3df38a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -370,6 +370,7 @@ static ssize_t freq_act_show(struct device *dev,
>  	u32 freq;
>  	ssize_t ret;
>  
> +	xe_device_mem_access_get(gt_to_xe(gt));
>  	/*
>  	 * When in RC6, actual frequency is 0. Let's block RC6 so we are able
>  	 * to verify that our freq requests are really happening.
> @@ -378,8 +379,6 @@ static ssize_t freq_act_show(struct device *dev,
>  	if (ret)
>  		return ret;

you probably need to change these returns to some goto, no?!
(and others below as well...)

>  
> -	xe_device_mem_access_get(gt_to_xe(gt));
> -
>  	if (xe->info.platform == XE_METEORLAKE) {
>  		freq = xe_mmio_read32(gt, MTL_MIRROR_TARGET_WP1.reg);
>  		freq = REG_FIELD_GET(MTL_CAGF_MASK, freq);
> @@ -388,11 +387,10 @@ static ssize_t freq_act_show(struct device *dev,
>  		freq = REG_FIELD_GET(GEN12_CAGF_MASK, freq);
>  	}
>  
> -	xe_device_mem_access_put(gt_to_xe(gt));
> -
>  	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(freq_act);
> @@ -405,6 +403,7 @@ static ssize_t freq_cur_show(struct device *dev,
>  	u32 freq;
>  	ssize_t ret;
>  
> +	xe_device_mem_access_get(gt_to_xe(gt));
>  	/*
>  	 * GuC SLPC plays with cur freq request when GuCRC is enabled
>  	 * Block RC6 for a more reliable read.
> @@ -413,14 +412,13 @@ static ssize_t freq_cur_show(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	xe_device_mem_access_get(gt_to_xe(gt));
>  	freq = xe_mmio_read32(gt, GEN6_RPNSWREQ.reg);
> -	xe_device_mem_access_put(gt_to_xe(gt));
>  
>  	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
>  	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(gt_to_xe(gt));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(freq_cur);
> @@ -610,17 +608,16 @@ static ssize_t rc6_residency_show(struct device *dev,
>  	u32 reg;
>  	ssize_t ret;
>  
> +	xe_device_mem_access_get(pc_to_xe(pc));
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (ret)
>  		return ret;
>  
> -	xe_device_mem_access_get(pc_to_xe(pc));
>  	reg = xe_mmio_read32(gt, GEN6_GT_GFX_RC6.reg);
> -	xe_device_mem_access_put(pc_to_xe(pc));
> -
>  	ret = sysfs_emit(buff, "%u\n", reg);
>  
>  	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_device_mem_access_put(pc_to_xe(pc));
>  	return ret;
>  }
>  static DEVICE_ATTR_RO(rc6_residency);
> -- 
> 2.40.0
> 
