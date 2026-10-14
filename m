Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A06CC6B2D
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 18:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704A910EA81;
	Wed, 14 Oct 2026 18:08:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84EA10EA81
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 18:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792001283; x=1823537283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rmHiYMCoyXy8iVsTXQ36ueKHf7UBlUJdx97qTH+vXWs=;
 b=AzxHTdKWkp74eScpa3xtm0dDkfivkEx3rB0V13jg1TuSNatbomyNS9/A
 X5oRpR8/6LOJxQYebcWsz0pCfcPwGGfsQalPjdf5ovsiv0hYRVWIUO1M8
 coyNG/4C+Awav9XpTIA6ZsQcnYHxsBzRSHdyFykMDt24HUTlj/CHbOuHt
 Am5FglUb53was/3y655vC3p3zjzxJBaA7QEAwOUYHW76dPCo8d/60ZWt+
 XploJpEpOT7IFH7PAGz6hxjTlmuIvvGvJ75tjXt6kOof2T65lJ9MZlVO4
 2/lhhEXAAaNy7cKitAQnY69+1Q7NHZ9XFaqkHK4XcoNW2eLk0fTR0eDsm w==;
X-CSE-ConnectionGUID: P2UAKCeIQYuvWtKCVl6FdQ==
X-CSE-MsgGUID: +o5l2rVzTYqo8FnJV5OIIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="665026"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="665026"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:08:03 -0700
X-CSE-ConnectionGUID: L362DR33TpK7O9kslxzZmg==
X-CSE-MsgGUID: mVGNcdBBSCaI44oWB18sGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1501532"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 11:08:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:08:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 11:08:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 11:08:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0eCkBV3GnVVoRdRgTmS7lCNLtTduvTE5C2ekQ98+RWPmMg6iJMaQLxkXx+TkvIbFMELNPLtNDnGSb2GsH2MLE6WZIHAVdalfAbSYwaW2qe5NOF5QhI00S9vu4d1baZBt0muKWOilY5O6GADbpMBWGTBCZn9Jz6Q8lckymxSd7aC8+xWRgVaRsJRz1MEQpXCxACAesdXie5PHaAgYSrsIGSohoJtcgn9hWzVvu4e7zcvGwyp2jaPNJxCe9yvmtZeONz7VH7QwbI0w0EJ7gUXDBgkxTEyVFbjl/SOvZrvDorsu/aYuqwVhESQF0f0D5IH/35JS83PwhKZHHQUNx+KvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW0EalJ+a9YrrGgjZx3NV7ZfF/TTohCFtyd/S18pk6s=;
 b=EzN2UXE9X8bWXufktxX8HuIJt9cLQfTD7hufR4dQxzkZz3DtzXRbscrKoKWSflxt0pYTQC5GjGjWIDp16WVxvdHU1ERYxQeAjLjc5DVadkNEBM9BEDDnqasKzscnvzkPirJ2CZ/CNMw6H+vUVjdiliiUJEMufclPlnbRMz+sZS4q9qT0CB267KUL+G4OEman0Fp6SEY0WohGX7ZuGGQDlducRJbn/ZQMM7tCp6HEaZY3UQznqxgQxJbFdnZ3QYo49ZhGGGeDQ4qtiyLlK9Mhw3hI/O3ypMAnGeXdPOKt4zRXl5GxEyewK0SRpPPhBw+tLX0kq6psPGJGCRg3SQLVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SJ5PPF3D06B1BFF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::822) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 18:07:57 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 18:07:57 +0000
Date: Wed, 14 Oct 2026 14:07:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v6 4/7] drm/xe: Make xe_device_declare_wedged() IRQ safe
Message-ID: <as_E-S4FKmBTc4wZ@intel.com>
References: <20261014055215.330408-1-raag.jadav@intel.com>
 <20261014055215.330408-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261014055215.330408-5-raag.jadav@intel.com>
X-ClientProxiedBy: PH7P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::22) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SJ5PPF3D06B1BFF:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3eaa15-4589-4274-14ca-08df2a1e1349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|261009223027099003|4143699003|11063799006|6133799003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 8DHZ6PNiF6TsrSH7iauhyvk9r3VuKIH6xbLm6AF2dwu1jCX3mdC7AdJx+2MTaejNTQHAmxioHLi5oMLmdK8BDDvDpEm3phOxhqLbG4tbkazT8OmZ3kuvqORpnXhOiRWVIZh8F7A2FObtjVphNadXHqa5HjkaMdG5PJLpoyMLQNgo+/FFfY5Ns+5aGBpPgCF32D5iORnNNk7XR80cKY/AJ2xlUwpm7VmD8nAMq4YYAuNj1porjCg0bYfjyLvUS1XA75QMjRR43cO9U5kN+Qd5zg4ryMHsEFCCw5UsPmUQi5WIfJOFzY15ZrIGX/aCcDQ6AevWr9vr6yJ+JRvjSjStJG06nx7nw81+quRH9xHhVMJodFkfn1IpgDmPMpKaEW1gi2ZCbNkO+71C3on3Qd25cugYpd0Rvkx9J8+KNU2OC++MKk6lFS1c1tV5iKK3JO8C1DMJEWohc72YskWhnG3pHlRNfyt5S92xYMjG2XBh9eVgdcl7a5WXHiQt0gFezW30fiL+odCpUAoQ2pjk3iwfmOn+DxhCNr2Y25syMi4rAXsAFcLhDuew2bPqXtSAV5gHjfwgCyZwolNGri+ywjSYNoG41XH0N6ZitkEXdNfuiodYXM1rIWDBVsOO6UC57DsD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(261009223027099003)(4143699003)(11063799006)(6133799003)(18002099003)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SDKYwLHoTZrM7Um7LP0onGGrY2b9K0pORd8N6hukemux5G8xBIO6Pvf8tcwJ?=
 =?us-ascii?Q?dl+0MaWFilkqTZAOcgHvI1lQpEluqWMXKs7xGp0k9xnClXV/G9dqyDlvtIMR?=
 =?us-ascii?Q?zddf55JQCBYX0qtMcPd0QMK87Uwfq02/c3uK41Vj+s838iQ450fIA9IaA21w?=
 =?us-ascii?Q?qAYy8mJ3YlgiIhIRtXFzOmbVar/2mhBSMkwJ/4pjf5mHx8i7qohfgUPyNzv1?=
 =?us-ascii?Q?IJNqTRd9N+3BJfR+AFOfoH/RSkBcwpQzDQXRA3KEXUknQVvYUEueEPiK7Fja?=
 =?us-ascii?Q?rFIyfrcWrl0lu3H9dK+T+Z6DeKenRGMF5phumd7RlHoVwh8wJ0kmMVmijRpd?=
 =?us-ascii?Q?iUPQpSbLLJFO6BsLKcLcXOdzj/k9qkQJpTrXKP1AUmIjY56zrhaXyNhHvBui?=
 =?us-ascii?Q?CWs7Z4ijYVqiw7VXatJLp4AzkS3QY/HeNW5hbM82PhJSvg4AkUFsMrPn9ZjP?=
 =?us-ascii?Q?S389BRRw2pT+fVrqnNaB7LK3uxxGzygkjbLky2TpcBhvR+9UDPKDXV6VAswr?=
 =?us-ascii?Q?M/kCTu1gW12zy/Bh1G0u8xVbP9N+2NPfQCiRYHm0u6jsY1F9ztQK8JNeJwkM?=
 =?us-ascii?Q?zUQ/3tNuozxAlceRsEX/KBZUqIcCs3/UdDXmb7B/KENe7Bx6CQBCtdO+a6b1?=
 =?us-ascii?Q?FQ8p+jsct4f83XorXFrsDf3OESXqCJgAeVntffe4juLYmErXlR9Aiw6K+672?=
 =?us-ascii?Q?2PLT0bivX4kwWk8e9eX9DUU3veYA/NbnJSnobcoel2BRNzMyXtzy1wa5XR2F?=
 =?us-ascii?Q?jPVkk2IC2NQxjQcDmNioCVGMSyr70mLQmnYqkVcHBUYexD/QcOwMMB/30qs0?=
 =?us-ascii?Q?lmIMlhmlEXhFM/MVMVv5/Uzvf9Nuc0QiQSB9QRxG2sSq2xYuV+FZTo34d//6?=
 =?us-ascii?Q?9H63KsLiy1rFmmtTI/Ze6tWJkBLcCpQWKIYOlHOc1RKyc8j/1OIHwACjdxtH?=
 =?us-ascii?Q?AnsdRjrU8wzmHYDbTDjfame1IKhWLmJ7I+DJIgzKxdTSoMU8iaBfAzDQ0IM+?=
 =?us-ascii?Q?LUuSQ7FgSn6VNE3+1nkVHbD/lsG3p1zj4JGbQYm5Q6ar+3/7zy70zfh87jhv?=
 =?us-ascii?Q?bj3llt9W4OBChPnn64JGEmCIvJp6wFYBQGeUdutkEIVpVEawP8fz0xfSRgmV?=
 =?us-ascii?Q?L71ohM5IlpOvWd6/uDWR9NlWdDpyTJT+PTrMhU+G89qvkCF3lkTLp6WEkAxV?=
 =?us-ascii?Q?QpkBOYS4byzCGgPLqOqS8IaOJevL0ltbAXqy0H7oGrp9UnF6mbMupD6MSKPG?=
 =?us-ascii?Q?H4zaxtLb034TgfFM2D8yYRzf95qB296rE8yzxPF9++A45FR/6+VNl+fUSwIK?=
 =?us-ascii?Q?1Yog0tq6M5cMqaWFEewaV8a5TuVzhg5dL6woEkteBSQ2u45Hb20bpUS9hlDF?=
 =?us-ascii?Q?tD6WOj8AOMxm1JAAk/8IlaCpo1qWPs8gqIyRdUH3czC7d66jM7DhZwcmH2uk?=
 =?us-ascii?Q?rfUs8QLUGHxfgBttEmoIcBl+hCJioSTnq4aY/J7q/bWHD6WiCQ9l2AB7HlJR?=
 =?us-ascii?Q?fBgdt6vZHQ+8l6cir68JNg689JJYmlpPxfxwEzFqlTBX3BtegKRFyzw50s3e?=
 =?us-ascii?Q?r6Pan3mdhiKJq/wc/6NGs33VUxCoUucULY5MBk5Ffqg8Aueigoe5fYMAw9AX?=
 =?us-ascii?Q?wVW5UWwl1ox4OexFV4V+OCcbvx4Fj7+j7Hg/6lPpDGLw409Hh4pjlGuhdG8v?=
 =?us-ascii?Q?dF5+KLg1n8HhekzuelpT/kSSd+zZPMop6Zs+nrXYq3uzq9j0obUVLrUfC6ib?=
 =?us-ascii?Q?VwMOAFE6DA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 3+wdhMkixrRocI6+yemwq16WvS5RN3hcJOSehqexcC20nmK39gBDdfKvlKw2kl9sz19AvulV61oJiQNtEi3TCR15HCt9g0DDN6gxViKpvXc82fF2tj1i8eOx4JzlhTD69j2tafhmGpGWEfxpw/Z02G7otJW3bVR0qb98boIxJevFMsy1paAAvgplBaxu8jOtK+7rRpM9k1EQvnOxpmUJgEZQ0FvvWE4c3XYKGIfLLIvYnZHVFG7Y7m8liAkQF6P4Z5lkcpFuFcEZ7LOShcVwdrFiNpngvEfgaSvoZ2xhPx4OXKG8luIWTokNh4StVRcqZ2grpSzvKv/ZKPr9UvJR7w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3eaa15-4589-4274-14ca-08df2a1e1349
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 18:07:57.4880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A8Py1H1W4R0XaYl2bsAG54uPBfG91bWXYSqtYjet4uQ9fmAFwE6Io79qyIPFgtqGqGmvAPseD7gGa+sssC8D5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3D06B1BFF
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

On Wed, Oct 14, 2026 at 11:21:21AM +0530, Raag Jadav wrote:
> Currently, xe_device_declare_wedged() implementation wedges the GTs and
> sends wedged uevent to userspace. This is problematic for usecases which
> require declaring the device as wedged in IRQ context, as it allocates
> memory for event buffer and acquires mutexes deep into it's call path.
> 
> Fix this by deferring wedge handling into its dedicated worker, so that
> xe_device_declare_wedged() can be called in IRQ context.
> 
> First user of this requirement is introduced in commit def675cf3f10
> ("drm/xe/mert: Improve handling of MERT CAT errors"), which declares the
> device as wedged on catastrophic errors received in form of an IRQ.
> 
> Fixes: def675cf3f10 ("drm/xe/mert: Improve handling of MERT CAT errors")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: Split fixes into separate patches (Rodrigo, Michal)
> v5: Drop IRQ safe wedging for its flawed design
> v6: Include IRQ safe wedging with redesign
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 33 ++++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  2 files changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d05d2791b9a0..b7461edad5ad 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -697,8 +697,16 @@ static int xe_device_vram_alloc(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static void wedged_work(struct work_struct *work);
>  static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
>  
> +static int xe_device_wedged_init(struct xe_device *xe)
> +{
> +	INIT_WORK(&xe->wedged.work, wedged_work);
> +
> +	return drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +}
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
> @@ -767,7 +775,7 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	err = xe_device_wedged_init(xe);
>  	if (err)
>  		return err;
>  
> @@ -1380,6 +1388,14 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>   *   firmware and restore device to normal operation.
>   */
>  
> +static void wedged_work(struct work_struct *work)
> +{
> +	struct xe_device *xe = container_of(work, struct xe_device, wedged.work);
> +
> +	/* Notify userspace of wedged device */
> +	drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +}
> +
>  #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
>  #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
>  
> @@ -1412,29 +1428,28 @@ void xe_device_declare_wedged(struct xe_device *xe, unsigned long method)
>  
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
> -		xe_pm_runtime_get_noresume(xe);
> +		pm_runtime_get_noresume(xe->drm.dev);

oh! I had missed that, please let's only use xe_pm_runtime functions

>  
>  		xe_log_err_fatal(xe, WEDGED, -EIO, "Device declared wedged!\n");
>  		xe_err_once(xe, "IOCTLs and executions are now blocked!\n"
>  			    "For recovery procedure, refer to %s\n"
>  			    "Please file a _new_ bug report at %s\n",
>  			    WEDGED_URL, XE_BUG_URL);
> -	}
>  
> -	for_each_initialized_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
> +		for_each_initialized_gt(gt, xe, id)
> +			xe_gt_declare_wedged(gt);
>  
> -	if (xe_device_wedged(xe)) {
>  		/*
>  		 * XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET is intended for debugging
>  		 * hangs, so wedge the device with 'none' recovery method and have
>  		 * it available to the user for debugging.
>  		 */
>  		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			method = DRM_WEDGE_RECOVERY_NONE;
> +			xe->wedged.method = DRM_WEDGE_RECOVERY_NONE;
> +		else
> +			xe->wedged.method = method;
>  
> -		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, method, NULL);
> +		schedule_work(&xe->wedged.work);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4e0e1bc040c1..ec5c1f0b8f00 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -547,6 +547,8 @@ struct xe_device {
>  		unsigned long method;
>  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>  		bool inconsistent_reset;
> +		/** @wedged.work: Worker for wedge handling */
> +		struct work_struct work;
>  	} wedged;
>  
>  	/** @devres_group: devres group */
> -- 
> 2.43.0
> 
