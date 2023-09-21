Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914A7E7D0AB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 20:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A1A10E608;
	Thu, 21 Sep 2023 20:46:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22F810E608
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 20:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695329180; x=1726865180;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xCw77G0AuIU4vAs+pTvD08iS8gU7OaQafyJ9biMBfTM=;
 b=WdrSQdVeKTkMNV3mEvxDsRWe6DN+RO8R76MPXs8Rx1W+DFWXqGTI7hBh
 +ue+cBfxUFz5bOMihe91Wdj8zcWerOsc3FpL4PfjDsd9ycEoW5qV8yZ/+
 u6goIJ+NpZ5RW4INT+lY2RrZnbGWo+EdvfyaDueNUXZUnWNCUTdQfZUOL
 kX+lTVuTSsXsVC/KVdyvB2orPUPN1HhQPG803rwJEZEpMd/+Wl6AN0n1q
 fPoMNdReT41TDudWmG4oCijZFdcbJVz6FOUwHTanPZrt7+Vfx4NHSNJxG
 sCUzyFQ8UgI+VvAxbc62o+IS1P2WVK4KFesflfnAQ/QK5O1JOms+qBNtN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="380564330"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="380564330"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 13:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="750547193"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="750547193"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 13:46:01 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 13:46:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 13:46:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 13:46:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz4T83LERH5TQcyIINB86ABzrvkcWWK9KQR3DBWc1magBYJmWouszmALdSP3RbbkCF5M12HnlemToDjIYYb8nKr1tJ6vRLMi2M4fl66pe2Ocds4AVVJnwnqg3SRxFKqL39akQf61eG/CSBqQ4SMN3KsOBjf8hbgPWYlk8rjQEutKcxk4hiIeCqoYqOXQ3ZACh0A5XUD9iNyg+c7gYdnCc9ps9kzTw4j1DHWcbDTPEJocOcaJgMEBOrdjgh1cL1O7du1LzBpA3kyhW4BRp/+TWC7zrwmHS42+l8hmeVkZIopRdER2DUyY1fNgo57OoJDOUNS0WFX/2TOSLRcsMkowAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQn3ewH98PNPiC23TL5UzJ3dzVPYGkmHXdNB/IML4so=;
 b=SxI3Ofg337ltBBEGAtIiG5NFoUnUZIQjImCVfdNs3PXAhWgsref3GsRG9b7CU1ntCZs0rkJi7wOBE7yEFaZLwL4+/ORPuAri273y69DRsJFJhY4hqALx3fLxB5U1cNs2BzVksmLRyWeXAmb1i3o1g5qEaJ6z2KruV1xwSRB35waXdTy3LPdJABDlv1IGlG/GiVQjzK8Gwy/IMsu+rNVT+MusH70rv07ukxVpFcGz1miLNIeCAlT71ybVAwdXXD30BF06W25i32DxavBs+PN3J+0UkmrgSjxWOXEHdfWLi9Pb5v5xZf+OddP9na3pT1+cuSIDaoh5XKRFfsrrkHM3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 20:45:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Thu, 21 Sep 2023
 20:45:58 +0000
Date: Thu, 21 Sep 2023 16:45:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZQyrgm74zjHjdr3x@intel.com>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-17-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-17-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 145a7715-fc5b-48ec-3759-08dbbae3c1df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rqlDa7yccMnSOEbOBxNTQs9ucwNhOite26CyrseestQfZFnFqE5PTIEM54LLU2o0yQR5nOZvg4Y3z6HetUAnLdR/ozxpKE7rgFPw8ZODj+OtrabaqjV0jz6Gkz9BxF2324ILGunPRpGGfJedM/iEYG+j0kHuJSmfCy9osj1QgA+qfg552uEDJGT7UOLEnr3GiWXjyJro0am4IRzEF+oM8YCleHfcokkwit/CmsW1hCttl86tsexidZ3RcHqDqQ8ds/9c7z0cT9v0EqiPWaiuBEjnWTU2ulL0ySQQP/yinjzNPlPTeukZIigot0a+awAfS8YDXuVc4LEGoLRCtWo92CiXwmV7AqaGbCNRWQp5gXoGhvd1dJaSe+12hGDp7iD21kGnXfTpavbPL4q0CxCbRffDihFsCWdaBgUCBLuXwznvzsJZeFfsv3JSEkRB2lhmYKz+pSUo5uLsp/rhf5Qtt7fX2pJNp2K1oulJA2V+o2v7Ld3jdPYa83j+VqGjj53x3k/Td+fqp5JJUZ20VetihbDlGflS8I427VXCI+lS+WY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199024)(1800799009)(186009)(6486002)(966005)(44832011)(6506007)(86362001)(6512007)(38100700002)(66476007)(66556008)(66946007)(5660300002)(6666004)(37006003)(478600001)(316002)(6636002)(8936002)(82960400001)(2616005)(83380400001)(41300700001)(26005)(2906002)(36756003)(6862004)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?87jnT1fQJvydsoDay8ZBuY2mXkmcYJZe1I5bG1jp55AcdvQsiPCm82v4D/ob?=
 =?us-ascii?Q?6pycL4NoT25NJl90aJuDmQUCxu8KAa1fZjKSE7aNA93ihK0rOVugmTP8KDz2?=
 =?us-ascii?Q?kSjA3HrVVhvsUTrR6sLNZkctI58PJPJa/E/l4JbqZMf+coztteriF9w2Loqh?=
 =?us-ascii?Q?9Tc/8sVhA/WjHahWuXhmC2CHzZUnC8Nw+Mgneb22VHBLz81GkEUYNW8EDTHK?=
 =?us-ascii?Q?K9Ho4ts84yKD+RvaMEhX53F51jZO2aMCTSN1INshZctfvBUn2CJNtsNMas6V?=
 =?us-ascii?Q?Pg9SvmIY2KYFTu3NcoD0qTFR7+V4VerIF8iQ22674X6ToEU0rhUFeMcUdsGQ?=
 =?us-ascii?Q?LKGRtVvbz9rnyGM5IKilyPRgi8k8TSOAiNjnWwTa7l2Kmlzyn0ToPBbQIfD+?=
 =?us-ascii?Q?JO/6uIg95IsihQ+LUJrOGfhsBro/ca48QQoFZq8AHCB9xhBNEkfuy0+JcQJi?=
 =?us-ascii?Q?zxi0UJyAsgSPvn0gsLyB8De6lYsj5rv/K+rVFqXip0dhl4tRde99A4LlP1Xu?=
 =?us-ascii?Q?ls4jMpP3S9MuOa7OqUB1jNrr9RTWGzj6ADDK7LUh9GhdtVmiSN4Y5gb3e6ka?=
 =?us-ascii?Q?xBaNL+lyaT1vqYWLGnRxgK8svPUOQt4IPzjSMEIEDuCF9bvXj0Ri+tfXLJUu?=
 =?us-ascii?Q?/zgKlvOekX6veCWFpodfSBztRstpEi2rDegXAT8LLdpKrsBHI3IUGk13vbgp?=
 =?us-ascii?Q?F5MFk0ri8/FJ7ll88zSDwvfZdDCeDXyYx18x2YNoyuJQz5qlHEq1vIOZxTUU?=
 =?us-ascii?Q?l1nGp/d/2348DOcYOuR9GU7vWpMhv6TeMKbJ2IRuYyGh3RXF1xw2mpjBaoYd?=
 =?us-ascii?Q?FrQ4nzr4NO344gE4q/rRbM71/ZnCCtquoJ+b19lhkPITe4FdOJKXmuYa9yjR?=
 =?us-ascii?Q?ko5ekTmGsa+NMuFBvb/FvX0wDGb6MDmy6t7FoiywbatRW2PmVWZRPPDJ9kz3?=
 =?us-ascii?Q?is5oaY16XINAjDmxXVr6A/CHPenScsEwDkEWXVaYZryQGSWswR+2Y7kX8ZwI?=
 =?us-ascii?Q?ez4br2vSQKkj/LOpch+etRdAeaRjJiSc//qgp5kKoizmPqzVJ18L9IJa5IdV?=
 =?us-ascii?Q?7U2fOscM60+RXGEm3oYSRvJZ/DvEqsY42SAMULRkz+pcYjUJVykc7HZbZ0mb?=
 =?us-ascii?Q?FV4edyb7WE7A9MDWKKX8+u4khlHAMTiOKi9FbjA6Xlq2zg5e2+5jmIg7flUJ?=
 =?us-ascii?Q?Te+m5ovt1rCtbI2bmoRbBnulRQowWN7axcEQtDvj2QUpA9e3UWhTOjQqcUEC?=
 =?us-ascii?Q?q6RVGvra/2uOmTSznTIfnmGtye5/QoB0nAlHOjjqRyTeKE458vbTnSBNANkJ?=
 =?us-ascii?Q?JSnXXfaDJx4NDwBNa+GmgP8VBSNzOnBfhTvQzSWyaaxIZPQfamhpR/lKp3rR?=
 =?us-ascii?Q?0RoNO+YMp3t1PSBYo2V4T7lycKaNyYb6+SuKdgmyZA25DG/0/yd1xHrk8Z48?=
 =?us-ascii?Q?RPhPx5Vuvid4wvgkBeYP2mYfG0zP8/imZi2AQPPgsK2lpLR0oV+MSyp2N9cL?=
 =?us-ascii?Q?OEuVJsHoDtF9t4GNOwp5KfKCshfmuK5vr6j4uZpD52Dbew/AbnWATLEttyp0?=
 =?us-ascii?Q?DMMQh1BEND75J3LWC5uKthZZGmTa4gF0cl9LvJ1RuY0EzW4/34t+KU7DPmpI?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 145a7715-fc5b-48ec-3759-08dbbae3c1df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 20:45:57.8928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YomU8XALsRuVjgg1V3C5TeUNsELV9X2z7Vplp2GWO2PhNEpJuckCpgtuLST5dWe0KUXsONzlCHTms6kbga5lKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 16/21] drm/xe/oa: Make
 xe_oa_timestamp_frequency per gt
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

On Tue, Sep 19, 2023 at 09:10:44AM -0700, Ashutosh Dixit wrote:
> Clock freq's can be different for different gt's.
> 
> Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c    | 44 +++++++++++++++++------------------
>  drivers/gpu/drm/xe/xe_oa.h    |  2 +-
>  drivers/gpu/drm/xe/xe_query.c |  2 +-
>  3 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index d49debe732bbd..8648652e05aa5 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -1496,7 +1496,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
>   * platforms OA unit ignores the CTC_SHIFT and the 2 timestamps differ. In such
>   * cases, return the adjusted CS timestamp frequency to the user.
>   */
> -u32 xe_oa_timestamp_frequency(struct xe_device *xe)
> +u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
>  {
>  	u32 reg, shift;
>  
> @@ -1505,26 +1505,26 @@ u32 xe_oa_timestamp_frequency(struct xe_device *xe)
>  	 * Wa_14015568240:pvc
>  	 * Wa_14015846243:mtl
>  	 */
> -	switch (xe->info.platform) {
> +	switch (gt->tile->xe->info.platform) {
>  	case XE_DG2:
>  	case XE_PVC:
>  	case XE_METEORLAKE:
> -		xe_device_mem_access_get(xe);
> -		reg = xe_mmio_read32(xe_root_mmio_gt(xe), RPM_CONFIG0);
> -		xe_device_mem_access_put(xe);
> +		xe_device_mem_access_get(gt->tile->xe);
> +		reg = xe_mmio_read32(gt, RPM_CONFIG0);
> +		xe_device_mem_access_put(gt->tile->xe);
>  
>  		shift = REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
> -		return xe_root_mmio_gt(xe)->info.clock_freq << (3 - shift);
> +		return gt->info.clock_freq << (3 - shift);
>  
>  	default:
> -		return xe_root_mmio_gt(xe)->info.clock_freq;
> +		return gt->info.clock_freq;
>  	}
>  }
>  
> -static u64 oa_exponent_to_ns(struct xe_oa *oa, int exponent)
> +static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
>  {
>  	u64 nom = (2ULL << exponent) * NSEC_PER_SEC;
> -	u32 den = xe_oa_timestamp_frequency(oa->xe);
> +	u32 den = xe_oa_timestamp_frequency(gt);
>  
>  	return div_u64(nom + den - 1, den);
>  }
> @@ -1591,7 +1591,6 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
>  	instance = 0;
>  
>  	for (i = 0; i < n_props; i++) {
> -		u64 oa_period, oa_freq_hz;
>  		u64 id, value;
>  
>  		ret = get_user(id, uprop);
> @@ -1631,18 +1630,6 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
>  					OA_EXPONENT_MAX);
>  				return -EINVAL;
>  			}
> -
> -			BUILD_BUG_ON(sizeof(oa_period) != 8);
> -			oa_period = oa_exponent_to_ns(oa, value);
> -
> -			oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
> -			if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
> -				drm_dbg(&oa->xe->drm,
> -					"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
> -					  xe_oa_max_sample_rate);
> -				return -EACCES;
> -			}
> -
>  			props->oa_periodic = true;
>  			props->oa_period_exponent = value;
>  			break;
> @@ -1701,6 +1688,19 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
>  		return -EINVAL;
>  	}
>  
> +	if (props->oa_periodic) {
> +		u64 oa_period, oa_freq_hz;
> +
> +		oa_period = oa_exponent_to_ns(props->hwe->gt, props->oa_period_exponent);
> +		oa_freq_hz = div64_u64(NSEC_PER_SEC, oa_period);
> +		if (oa_freq_hz > xe_oa_max_sample_rate && !perfmon_capable()) {
> +			drm_dbg(&oa->xe->drm,
> +				"OA exponent would exceed the max sampling frequency (sysctl dev.xe.oa_max_sample_rate) %uHz without CAP_PERFMON or CAP_SYS_ADMIN privileges\n",
> +				xe_oa_max_sample_rate);
> +			return -EACCES;
> +		}
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_oa.h b/drivers/gpu/drm/xe/xe_oa.h
> index 1f3d05067f19d..cc6f64bc24ddf 100644
> --- a/drivers/gpu/drm/xe/xe_oa.h
> +++ b/drivers/gpu/drm/xe/xe_oa.h
> @@ -22,7 +22,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, void *data,
>  			   struct drm_file *file);
>  int xe_oa_remove_config_ioctl(struct drm_device *dev, void *data,
>  			      struct drm_file *file);
> -u32 xe_oa_timestamp_frequency(struct xe_device *xe);
> +u32 xe_oa_timestamp_frequency(struct xe_gt *gt);
>  u16 xe_oa_unit_id(struct xe_hw_engine *hwe);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 4a3a9c11e8cc4..ad280bac9eed4 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -244,7 +244,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
>  			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
>  		gts->gts[id].instance = id;
>  		gts->gts[id].clock_freq = gt->info.clock_freq;

first look it here                      ^

> -		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(xe);
> +		gts->gts[id].oa_timestamp_freq = xe_oa_timestamp_frequency(gt);

Then please notice that we are trying to kill the duplications on the uapi [1]
and now notice that this series is adding yet another duplication:

+u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
+               return gt->info.clock_freq;
(copied from above)

[1] - https://lore.kernel.org/all/20230920192940.135004-20-rodrigo.vivi@intel.com/

>  		if (!IS_DGFX(xe))
>  			gts->gts[id].native_mem_regions = 0x1;
>  		else
> -- 
> 2.41.0
> 
