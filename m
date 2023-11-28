Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063CFC4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 20:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C120210E18F;
	Tue, 28 Nov 2023 20:56:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA10210E18F
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 20:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701205011; x=1732741011;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0ljuFxqeOr4AZ4b6XqjTuAVJTb3GxBwmZE92drE2eH0=;
 b=bzya/3xqcgrJ5HjZkd2jk9YpnpcM3zz2vZoKOBr6bY75b67s35bboLD6
 vmn1vdBJCi2gS1nEnURSxGLbwQs354VluZuIUWCb6Oo5kV9yprrFOGbyX
 EHq3fUxIAkjCls5++f1f/L6Rzngda03YDs6JAME5VzUcvifBGy+ONkI1J
 BpgHMOtxcMADvVl5ciYSY4RmYED7k91OuwPpRBSpdXD8xjpUSzu3KHH49
 38GiF5ikOCMAJjCK+UnclTKIQP46LWaUP8tt4IhLmIvgPp4ADIE9zBuEJ
 2HDnCwkdZAqEKHpEXA7U/t/hMHJFElYDrO3+lCRc5YAyikSkWH2k+D6DE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="373209352"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="373209352"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:56:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768654972"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="768654972"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 12:56:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 12:56:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 12:56:50 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 12:56:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxLFBkmeqVA7yKQSFn3jP7YdvxCF58OyDR9Tdq6yZ7FXqV84qbzCibUDsQTPd9EDJcwA/outGuwUlNfbyuZZQc5Fyk9I4NRiqRAaZ3K6lVmEdQnIVqkklbuloAL7r+9OxWwip9QS1MMD3Ai84mINmODkNjD5f4cAtO60j2lpn7EBZ5jDmsACm1aWJhJivr0E3uMpSsaYeFSyGjjFLVijROmjtQG81VlzdbjJF1WO3ptrYYW/Qc0e7SM1TyOu4HU3BVPgT/Aq4YDwMh8gXv0AiKljCAcM5t2bfsF650bp8RPKPIRqdiHxdN+ms0nGVFlugMDM6sIuWAtBKmYIjVZxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZRAZvQNRvt2iSKHHwUiSvY6SEvNE3oYvFQEup8OR6E=;
 b=NP+2UhjJoc6/lQ6gLRhq6fM3g/7v7pxJPU4rTCYnX5OPbhEViUBYA62TyuTrgCqRfYHVBdUAgCqBKcTeiXefGlcNBnypDv9z8ImlMI2AtPTkhWgNnbTJfawbDr2M5dvkHb+Yr8pdW7XkYwivZBlWoIKfRIAy3ns0GWlzxLbInEQriigLci2291SJiTd7/NTCHw73HxgLEG6XGm5coS0x1Q23VGms3yZ895MlzUvRVeYMYC0HyqgeXpyyKW0Vu6HhtrvqfI1O82hPDqFdbjqlchhPMbH15zL9t6xlx0t3ZAgfhctsNf5GjvNX6LvnLFe2GZdb7LWfygmvicoDmYOyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BL1PR11MB6004.namprd11.prod.outlook.com (2603:10b6:208:390::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 20:56:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 20:56:48 +0000
Date: Tue, 28 Nov 2023 15:56:45 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <ZWZUDfU4XVRxkngN@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231122143833.7-8-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:180::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BL1PR11MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdd3bd3-640b-472d-090f-08dbf0548995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qy8UFnvM5VFuuttdOeS6X3H91SL0BmElRvh0E3emGEhr1LBb5iSrEGX4ES9yRVuajX5Q5N0tWZ6f3I73ZTvtZ3c5ZtX8vUBVwwI53Kq4l637spdhOPdePW4cPpQRqjxJoYQe5O/8utdeWuxkDzqAtt/C6mMq2k5UGZs+gC7YxnrkDlFu916aIgwa58XlJ0wogMx1I/JvgX+TAVQL6pjY3GlJ2YCD31d4YjhHkbtm8Ht7JfPpn5sqyASHCgr3zzxAiAvQ57y0LjEd/y0HICsmQiPaGF0EpXcHfF4DkJDT3iDOZpr/4w+uN+b2ThEr+OoE3Sylei5nEY/awjHSt9xvU1vZqeJb67JhxH28FdYwIt0KeVrUSYV3UIFqWAlt2Wm1Gqv5I5Dxe395UlKOCL4AyDi1UjNbCbnwkw7vei4NbGMKODyf3chsZNpc5+iPnqKsEXrJellJv91XzchwYzb4PhYhiH/KXvdvMv+vYrtRQNsVjxJDXRCkjbPdUS5CR1EB/0hgUZjkfJcTejKgf8m27bOEfioGXILieGjmPDgSyDwTOkK67ltfJDbmB5qy5Bdz+32JqGWJOTt+yO6mv/yDCKYgfAq70Px0mXHHKs9D5Dk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(39860400002)(346002)(136003)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(86362001)(2906002)(6506007)(6666004)(2616005)(316002)(26005)(37006003)(66946007)(6862004)(66556008)(6486002)(8936002)(4326008)(8676002)(6512007)(66476007)(6636002)(478600001)(38100700002)(82960400001)(36756003)(83380400001)(44832011)(41300700001)(43043002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ACgTUwYfumc+t9hgLDFAvR/1uV+kt5xIO923+NCceglsM/N4Cjtu3WQzsj?=
 =?iso-8859-1?Q?N511g1jfrIlBfC8FrDv+b7l12f9V+tuJhOjoAeYYKmhQxPugPDlaWKgjA+?=
 =?iso-8859-1?Q?F4Oe63aGjEBD5WaztVuVHvXPHVNUcNR+HSzOySD6Lwnt7rmB64ECxA9knC?=
 =?iso-8859-1?Q?mMILci3yWQwMLzos19tf/papC/MPNHMi11NlRfL9hKlYjf2Es7kHyVvbTc?=
 =?iso-8859-1?Q?0G2fmnCcgaCduoxsnqpvkcV+FqnbN/duoPxw0SQ4K8zd7oD9XJ7tjQ8JZG?=
 =?iso-8859-1?Q?m7JRdZXLnhz+wTLqia+j4jChJ3kLjfUlSv6E13LMHr62emgkLDaM9rTpkN?=
 =?iso-8859-1?Q?6enXS9RtPu9OCGBKow/npk/Vetf3ZOQ0IGS83xX8A68a/1U6zec572lSQZ?=
 =?iso-8859-1?Q?e+i9jaN2kxuVmJShTcLNTFEBmhhuD7eaqeBtLJxE8BoNV2lx+NI6XEqAKx?=
 =?iso-8859-1?Q?cvU1DbMi+c0Uys80chWwRwEahGQQNLBSg8HWwBM+W5QCNS2nRM7xMpRV6u?=
 =?iso-8859-1?Q?ups9dH+uJ33+xn2R3GNymhUeblV56fP04fOs3Dg4Zki0TOQ0HU107qmiqO?=
 =?iso-8859-1?Q?K1fjMMd7DslGpatexyzSgXwMLewk9btPOY8SrdXXtjpv2LOVMhQEp/CQIZ?=
 =?iso-8859-1?Q?OrgNWgFJ8ZK1M7+xKXPcq7b4W16ac+EQNI4Esx1hCO+/Fufl9LMpmC9lqC?=
 =?iso-8859-1?Q?fFtJHsEZT1a1oFWQiEfVBmPS1rpwJzZGWnxKj6QfEuiG08BqVMpdHAiGZx?=
 =?iso-8859-1?Q?v7dM2Us7iQSXf/bEQL8X7DBDkOLeLfmzfsXEckNhctSpGI0rYo6UaiuePi?=
 =?iso-8859-1?Q?AYLQYKoqIzFI+/J7eLWRFuzxEvIKLJC2pNBWmCVKBfXOR/Iqjt8UK32DV8?=
 =?iso-8859-1?Q?8QLB0llFKrqguTpxq3SuC7xWun72wnFeTbQ6PFwP5eO01wMdKRsvlT9Mk3?=
 =?iso-8859-1?Q?k/rtU+koXja2+ddzISsHUuyoxufevIqd3e01+uB97dlmK3bq7Sbk4pdvJn?=
 =?iso-8859-1?Q?47muT0ToS4gKXwXdbQnzwtFuNjMrf709DopkprmRr5CTubK74wb71hdMkA?=
 =?iso-8859-1?Q?UVoI963/OzqtkhBfSjUV3aOaHoT7S7a6MLZAIJuMOV1oIYsAIHKnkAUjwl?=
 =?iso-8859-1?Q?tJlIGsCnlHJ8YpR70Esn+ypkE4TkCjp5B37Ek+wWZ26gToQW2P/VP+n8H4?=
 =?iso-8859-1?Q?Zi/JspiuJEy0H4VSqxn7ScEdDe0MTRqvVcci42mPWJKSTQ8wXnFuxdD2Uy?=
 =?iso-8859-1?Q?a1Ac3kiBaetKuwOPl+u3aJHS6+3HbgNM4cR0E9T1eCyjgFsiMymiff/QEy?=
 =?iso-8859-1?Q?7SNgqFcs4OoFTFAFNFKA7G6p4wg8YaHbcN1d/dhiCZsr9m06587H9n6FhI?=
 =?iso-8859-1?Q?ydDDFY6uTmXuUlFdD6gp/PUTcM9wCEfYtT0epE+hVcxBzRs4MZHYCzmnm+?=
 =?iso-8859-1?Q?1d94svsw2eoeFQzmFo9GCfCHxIioE1Hy0Pd81RqIj8Uiq+jVOHHW/EIoC1?=
 =?iso-8859-1?Q?opKyCXW9VuBOh64QUWK8dFRfarRu47bPhNYvEaM3AH7113DrDYTOdD3aly?=
 =?iso-8859-1?Q?YSDTPeAmw7kLEkz428Npa3JdsK6eBbVDdB3ExIcuR9O7pNFxYCsypWqRGe?=
 =?iso-8859-1?Q?0oBKM+zsStKuJ8BJxK+xsbKhefDLMNGwdRyeC82T4hdhkkv9KcmgiG7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdd3bd3-640b-472d-090f-08dbf0548995
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 20:56:48.0554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXHaWd3C4HbRUFrV5/rRsNg83wPjzRgXlAD8G1/bLJ6YN6ZWDDNCvAVkoHBdWw5nd8Kz85R2GFiOjE6K8OhIxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6004
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/14] drm/xe/uapi: Align on a common way
 to return arrays (engines)
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

On Wed, Nov 22, 2023 at 02:38:26PM +0000, Francois Dugast wrote:
> The uAPI provides queries which return arrays of elements. As of now
> the format used in the struct is different depending on which element
> is queried. Fix this for engines by applying the pattern below:
> 
>         struct drm_xe_query_Xs {
>            __u32 num_Xs;
>            struct drm_xe_X Xs[];
>            ...
>         }
> 
> Instead of directly returning an array of struct
> drm_xe_query_engine_info, a new struct drm_xe_query_engines is
> introduced. It contains itself an array of struct drm_xe_engine
> which holds the information about each engine.
> 
> v2: Use plural for struct drm_xe_query_engines as multiple engines
>     are returned (José Roberto de Souza)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 31 ++++++++------
>  include/uapi/drm/xe_drm.h     | 78 +++++++++++++++++++++--------------
>  2 files changed, 65 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 28ea6dbf1cf9..8bf0fe6b09e0 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -53,7 +53,8 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
>  			i++;
>  		}
>  
> -	return i * sizeof(struct drm_xe_query_engine_info);
> +	return sizeof(struct drm_xe_query_engines) +
> +		i * sizeof(struct drm_xe_engine);
>  }
>  
>  typedef u64 (*__ktime_func_t)(void);
> @@ -186,9 +187,9 @@ static int query_engines(struct xe_device *xe,
>  			 struct drm_xe_device_query *query)
>  {
>  	size_t size = calc_hw_engine_info_size(xe);
> -	struct drm_xe_query_engine_info __user *query_ptr =
> +	struct drm_xe_query_engines __user *query_ptr =
>  		u64_to_user_ptr(query->data);
> -	struct drm_xe_query_engine_info *hw_engine_info;
> +	struct drm_xe_query_engines *engines;
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  	struct xe_gt *gt;
> @@ -202,8 +203,8 @@ static int query_engines(struct xe_device *xe,
>  		return -EINVAL;
>  	}
>  
> -	hw_engine_info = kmalloc(size, GFP_KERNEL);
> -	if (!hw_engine_info)
> +	engines = kmalloc(size, GFP_KERNEL);
> +	if (!engines)
>  		return -ENOMEM;
>  
>  	for_each_gt(gt, xe, gt_id)
> @@ -211,22 +212,26 @@ static int query_engines(struct xe_device *xe,
>  			if (xe_hw_engine_is_reserved(hwe))
>  				continue;
>  
> -			hw_engine_info[i].instance.engine_class =
> +			engines->engines[i].instance.engine_class =
>  				xe_to_user_engine_class[hwe->class];
> -			hw_engine_info[i].instance.engine_instance =
> +			engines->engines[i].instance.engine_instance =
>  				hwe->logical_instance;
> -			hw_engine_info[i].instance.gt_id = gt->info.id;
> -			hw_engine_info[i].instance.pad = 0;
> -			memset(hw_engine_info->reserved, 0, sizeof(hw_engine_info->reserved));
> +			engines->engines[i].instance.gt_id = gt->info.id;
> +			engines->engines[i].instance.pad = 0;
> +			memset(engines->engines[i].reserved, 0,
> +			       sizeof(engines->engines[i].reserved));
>  
>  			i++;
>  		}
>  
> -	if (copy_to_user(query_ptr, hw_engine_info, size)) {
> -		kfree(hw_engine_info);
> +	engines->pad = 0;

we don't need to initialize the pad. kzalloc already takes care of that.
But also I see that the one in region above was already initialized and
I don't see a big problem.

this at least is consistent with the above, but we could also remove the
one above or not touching this... anyway you decide to go:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +	engines->num_engines = i;
> +
> +	if (copy_to_user(query_ptr, engines, size)) {
> +		kfree(engines);
>  		return -EFAULT;
>  	}
> -	kfree(hw_engine_info);
> +	kfree(engines);
>  
>  	return 0;
>  }
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index e38e7b701edf..fe911728fd97 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -127,9 +127,9 @@ struct xe_user_extension {
>  /**
>   * struct drm_xe_engine_class_instance - instance of an engine class
>   *
> - * It is returned as part of the @drm_xe_query_engine_info, but it also is
> - * used as the input of engine selection for both @drm_xe_exec_queue_create
> - * and @drm_xe_query_engine_cycles
> + * It is returned as part of the @drm_xe_engine, but it also is used as
> + * the input of engine selection for both @drm_xe_exec_queue_create and
> + * @drm_xe_query_engine_cycles
>   *
>   */
>  struct drm_xe_engine_class_instance {
> @@ -153,13 +153,9 @@ struct drm_xe_engine_class_instance {
>  };
>  
>  /**
> - * struct drm_xe_query_engine_info - describe hardware engine
> - *
> - * If a query is made with a struct @drm_xe_device_query where .query
> - * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
> - * struct @drm_xe_query_engine_info in .data.
> + * struct drm_xe_engine - describe hardware engine
>   */
> -struct drm_xe_query_engine_info {
> +struct drm_xe_engine {
>  	/** @instance: The @drm_xe_engine_class_instance */
>  	struct drm_xe_engine_class_instance instance;
>  
> @@ -167,6 +163,22 @@ struct drm_xe_query_engine_info {
>  	__u64 reserved[5];
>  };
>  
> +/**
> + * struct drm_xe_query_engines - describe engines
> + *
> + * If a query is made with a struct @drm_xe_device_query where .query
> + * is equal to %DRM_XE_DEVICE_QUERY_ENGINES, then the reply uses an array of
> + * struct @drm_xe_query_engines in .data.
> + */
> +struct drm_xe_query_engines {
> +	/** @num_engines: number of engines returned in @engines */
> +	__u32 num_engines;
> +	/** @pad: MBZ */
> +	__u32 pad;
> +	/** @engines: The returned engines for this device */
> +	struct drm_xe_engine engines[];
> +};
> +
>  /**
>   * enum drm_xe_memory_class - Supported memory classes.
>   */
> @@ -466,28 +478,32 @@ struct drm_xe_query_topology_mask {
>   *
>   * .. code-block:: C
>   *
> - *	struct drm_xe_engine_class_instance *hwe;
> - *	struct drm_xe_device_query query = {
> - *		.extensions = 0,
> - *		.query = DRM_XE_DEVICE_QUERY_ENGINES,
> - *		.size = 0,
> - *		.data = 0,
> - *	};
> - *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> - *	hwe = malloc(query.size);
> - *	query.data = (uintptr_t)hwe;
> - *	ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> - *	int num_engines = query.size / sizeof(*hwe);
> - *	for (int i = 0; i < num_engines; i++) {
> - *		printf("Engine %d: %s\n", i,
> - *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
> - *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COPY ? "COPY":
> - *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
> - *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
> - *			hwe[i].engine_class == DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
> - *			"UNKNOWN");
> - *	}
> - *	free(hwe);
> + *     struct drm_xe_query_engines *engines;
> + *     struct drm_xe_device_query query = {
> + *         .extensions = 0,
> + *         .query = DRM_XE_DEVICE_QUERY_ENGINES,
> + *         .size = 0,
> + *         .data = 0,
> + *     };
> + *     ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> + *     engines = malloc(query.size);
> + *     query.data = (uintptr_t)engines;
> + *     ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
> + *     for (int i = 0; i < engines->num_engines; i++) {
> + *         printf("Engine %d: %s\n", i,
> + *             engines->engines[i].instance.engine_class ==
> + *                 DRM_XE_ENGINE_CLASS_RENDER ? "RENDER":
> + *             engines->engines[i].instance.engine_class ==
> + *                 DRM_XE_ENGINE_CLASS_COPY ? "COPY":
> + *             engines->engines[i].instance.engine_class ==
> + *                 DRM_XE_ENGINE_CLASS_VIDEO_DECODE ? "VIDEO_DECODE":
> + *             engines->engines[i].instance.engine_class ==
> + *                 DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE ? "VIDEO_ENHANCE":
> + *             engines->engines[i].instance.engine_class ==
> + *                 DRM_XE_ENGINE_CLASS_COMPUTE ? "COMPUTE":
> + *             "UNKNOWN");
> + *     }
> + *     free(engines);
>   */
>  struct drm_xe_device_query {
>  	/** @extensions: Pointer to the first extension struct, if any */
> -- 
> 2.34.1
> 
