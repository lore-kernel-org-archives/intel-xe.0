Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2BBC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6D510E23E;
	Tue,  5 Aug 2025 03:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RrXb4KsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1DA10E23E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754365090; x=1785901090;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Bi4cTEpI7UEQBTTHJN7Itr9pxPuIhgWcMkqckiw4h8=;
 b=RrXb4KsOKaEG7sTKpntS6K68SJBlKmBqwRmh+YFqdG+ZLjWV9DB1cOCE
 Db6J0cKUqlJwD1UdoakuyIjxhARHaAMfZPl8Z1B/7v8Acd+OH6lgVrJS/
 gthkCHKY3RT/2vzgetQ844iOuHiUxcuSxH0tCetoJ2GxJAwDcu/D+EEhg
 lqSbE63Ns9TcWVVuv9uAnqT9aT0gqL6MbCsRLwjnImQf28L1qw+sADucz
 RN50fRq4IdeEiOv69oduxgHlMVWHz6OgZs74LVnTBRdUWYrtd7haGOs2P
 b/0E2McBKBaNUKeeXnjtahrdcjaEHHTLg6J/Q25jtnde2P7EudnaTzkh7 g==;
X-CSE-ConnectionGUID: 1zP/nG8BTGORH64gHpdk5g==
X-CSE-MsgGUID: Mr+oKrBiSRWfjjrXitk6BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="79197310"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="79197310"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:38:10 -0700
X-CSE-ConnectionGUID: ywRb8JMERIKg1MLfCfV+wg==
X-CSE-MsgGUID: 3v4W60J4SxG+1gEX0+w7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164253758"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:38:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:38:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:38:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avZHxamvgsEC5+R3yPBOmtZOBN8zDUxYWa/EQBR82+qHXl+U4jnfgTATlBsjA5PFBAC4TE4qpmvfjDG9n4r9/R8cKfd7huj+/aKOAu19FzSoKfTdq1qmJ9UstsQx0yDMueUVb9rXKMe9S02R+XbvIRAQ6FwQsEGW6Cr7z28q2dFu8frsH5Dzin8ibgUkgM3YR08n1ZUhUckk1T4uyDeoffJSexScdXoHptN64Z8GprIBykwrU/dtqsp6knbHQIGGdEBpo6wx4nzpPp6mt80sRYOZDMZtwFoQila+JUehmDk8a3u153fnuN38r0ZpDl3+fFvBoeBoc5+AIfPfz+5D3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQKXXBAdxKpldzK3K45eOeZvGknqP8UzVAuBSXxcF2w=;
 b=h7vXMztomwoHbit336t/wSlTa0uAtsG7fQKeIgi9aLNxqZ+Qv05kdInyatis8yzUTBnaCDugJJBfGS4y7oxpF0d+YHI8LONSkagdQNaN5ZmeC+O+GY2GtA1JlJVjtLTL/D98ypGQOzz96VqjWdmBmy74U44b3YR2sd1OGhCcuCyzBDQcEeRbL2PLG4OlAT5G66wiH6WHPQzyJ5ZuWtyIoU+gfJa7GnGDHyVVWgijNxFVAbStbNvIVYvspgHLVi3drFL8isxfy58wO/xstMTQox8ktJIJw94z1YWgfYjUxe1KPUgDqxdG5gl3xiUtYce4ZMO9+UWW/YVTgZLsRs7SDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Tue, 5 Aug
 2025 03:38:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:38:05 +0000
Date: Mon, 4 Aug 2025 20:38:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix coverity issue, cast_overflow
Message-ID: <aJF8mvTFJFIYYMqs@lstrano-desk.jf.intel.com>
References: <20250804094038.3301004-1-pravalika.gurram@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250804094038.3301004-1-pravalika.gurram@intel.com>
X-ClientProxiedBy: MW4PR03CA0168.namprd03.prod.outlook.com
 (2603:10b6:303:8d::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6479:EE_
X-MS-Office365-Filtering-Correlation-Id: 920d2ea1-4727-455c-1f4f-08ddd3d17cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zdM6aRxFawPmEZMbytvaz9VN0lEazmbwFYFAplBhvlNcMGcarm3zKwnejJIq?=
 =?us-ascii?Q?yqGXQ4EnMQM5X6yDabSbahgyHdiP3EaCnd9ifQF/bNX9E7LOXnSQuCkp4MZa?=
 =?us-ascii?Q?c4ODzdx31vOrQ4baWQNYOM8gOkga1LYJ0tXRqPwkCz+WAoQU1e4opykeNTSw?=
 =?us-ascii?Q?kzk4jQNqJxRrJHdU3Qff5EcHZ25h2BM7M/D169PNd/4nZW/Buz3bJ3wOvZdI?=
 =?us-ascii?Q?zOSfRZClq4Jvvrqv3mAxi96gAgc2mrvbEwLT29QecgMTdSlImQml47tmS9i5?=
 =?us-ascii?Q?4y+RtoZFFGI38hov9W5oRa2h/EY0l0/3unU6M3yore3fdh47HXD+OWsI1kq5?=
 =?us-ascii?Q?wGhcbKFHELelvfoNZmhTYP7pL7jV0pFW5jbqicozhPMCtdTRysSO+aZ0CwYS?=
 =?us-ascii?Q?CVooK4PdgSllDYQrv6k7yU6YzvCxwcZM9nwA7yI6vBFYBGyd2oxDogZmDTc/?=
 =?us-ascii?Q?AO+TIGTU1/FqYoS3s1thUF6ZNBlE/UFhXayWhb9UqyNhychNLDEKzh5UhppU?=
 =?us-ascii?Q?JdaVhzEfJ8iPvPVAIC1J7Q0VmrL3QZhuSqWsNNXNM8tPYtu6q3MzvLEByNk9?=
 =?us-ascii?Q?DrhSRHQTaSH/k4AmaHEHYz0lUPp41sfGr4Gk3xl6OVRzRmcC2PwAXUN/0OOS?=
 =?us-ascii?Q?cDuCI4o9+vBr/FANZ9E6T3sYXGIsUd7QaGn1xpGDSe3OWbLi87ycrE2YC4bM?=
 =?us-ascii?Q?mV7ezN0fubcKlLhnr7HiJSWXA+Q5+uKU6h0kAU13mL3nNbKTjogyRsjU8SNp?=
 =?us-ascii?Q?MxV9Y0YfUt/7UhZmjsDlCDXnK+Bc3ei8p/cI+HayXRNMZ71V11X/fYCI2no3?=
 =?us-ascii?Q?AHlGeHWTyXDMTONO02MaCF99k/9B9NuF81Dqk512cXJHsFGn6f+5DThvl92D?=
 =?us-ascii?Q?T6xz9rQ1Hi8ami+FGd47BgH/OBQIzePSn6VT1Egolo5QsbEBHeBZ7otU467p?=
 =?us-ascii?Q?U7lOOfRp7bZZX2eBy7ve708b7WDGhOmy9U7O6GfMzDKizkUqAr1FyYkrYAVp?=
 =?us-ascii?Q?kP7N36xyue+oiDBHE/pr1pypXN1L/NpwGp3yhlS6IgqW27OI4lXhrpNt2H7O?=
 =?us-ascii?Q?dKL/N0AmIiXhp4gF9TT0OQ0N94XISwjhaDF87nhAhjWl/7VR8131ve9HhtFv?=
 =?us-ascii?Q?w2B5DhEZKX9oL6qWwSYvDn5B2tA70grbWdoadc8XjgP7WHD6Xu2qAr4WS3Ar?=
 =?us-ascii?Q?kiv/EHOw/4Dcsc+vHqAzdjKUnodAuUiPaW4oDSwI+d21fcv0HmrvJU21nhVC?=
 =?us-ascii?Q?IWiy8ZjLG6WcmOY6lsuBn5dUwbJ9/Wtf3F6VaDu/86yqbO6ji66k5OgRYWrw?=
 =?us-ascii?Q?ZGPJozyuseIoUw6MHaQbtxxsHudCsMZaP+H/wv1y3x2YauVWm1BCZz2oegJb?=
 =?us-ascii?Q?85U+qKc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gqwFX4UW/kHtNCjkFRyHQ/ZpL0YUeajFwG1zIDaAaE/ilvBaKjvxo3gPt/Up?=
 =?us-ascii?Q?+AivqKXhRC0y9jJsghe0sPhw/PSgCpJh9q3isSyn2N/oavayrWAp5wtWjmSK?=
 =?us-ascii?Q?PYrrHtKFtooxiPqh633jJrIbEottSIi1ixrDUzmmkFgrzA2Ys6yjdSQsaLnE?=
 =?us-ascii?Q?xH+mLHCq5ivPI2ia89oWIfLqx4ufrTnt2dB1oYVm14hJGinFuPIqr1B6ysQs?=
 =?us-ascii?Q?B+e3GOAjYaE8lhD05Shp6+4RHlhpWFUHDaDpyL23B/VCwp3x0+gnweLBFtPB?=
 =?us-ascii?Q?gfoLF5a35lLxJriX2WIDtgf6qaA1eHHIvFEdkfAAiRxHT0Vc+j5ERU4YCsud?=
 =?us-ascii?Q?Pxsj4iRdraiE6x0X9CVQj0+PS/THPsuhXzlBxbCb6ZUhMVlGTMuNfnPyvS3n?=
 =?us-ascii?Q?ijVW9w8aDySkLVc3WdTxMDHdMDj0HB5roSeu0lkD8ic1T4g4QepGpLxaj9f0?=
 =?us-ascii?Q?TaYxyOyJK2hvVu1y5p+r9uKt/YQJVL2KGdyhU7JbsA6/2s9AUNOz8GCNQC/u?=
 =?us-ascii?Q?9NjKQIekl/4x4bUzNzpglpu1KF68xELSX+wJZ2vUlvTNrdx+k2C6/OkPi1l2?=
 =?us-ascii?Q?XuxfSmB/wExpC8Ohx+rD1LP8/pV6p2x7/cZIt1G6AAoQeOOZRaSd+/vZK/t2?=
 =?us-ascii?Q?UDH0zhkqwEmLKg76r7RIW3FsLElpR2KOf48PD6fzQcncZujiIV5BHJpJ0RwZ?=
 =?us-ascii?Q?wMjavvkhNz2s5r4oEYL/OzSbuLXzVmdTFt85mKVvh+sbi7+Cb1CxwM6kU95n?=
 =?us-ascii?Q?bfM0Oyob56eJK6gjtV7nFbv6tYVd7goIOZJCfyIQUkeJa/5aKcU6wta6uZmT?=
 =?us-ascii?Q?hKrBVjFyql37UQJtx8z1GG+7lFn9mNiNjlurL/bzCXAGc2IxhyeOTeKjVyuL?=
 =?us-ascii?Q?baAqT2gtiuSFdz8OEM1Lhbh7C1Y3k6nb6g/J2Gdj1U8GURS7JauAWUGvTgHq?=
 =?us-ascii?Q?oe+10i/zVilIJklSLaUoIy8Zy3QvbtpQkDGEP+THywIDZS6YYEL/Arge3MGD?=
 =?us-ascii?Q?P4yovDSgLEWrUuV6+GRlZRztVmcnRJLFfLcg6rLxZ6444dzp6Kv1RSsQc6z5?=
 =?us-ascii?Q?FbaMlDcm34kkz9RQT6gSijiSULWUzpwI5WxS5L1JB6kR+4pqpPSdJ7cbe3Lf?=
 =?us-ascii?Q?HLSlIFzgRwT4lw7ctu+bGLrVhhpp92bSfriBNWFTJfeAmYvt0wfit7Wm3a5g?=
 =?us-ascii?Q?CqRzFpp85Ssi3M47UO4hpPZFDhsa2BeNt/Y6fWN3oBovhFb7kCZ9EaFFUTPi?=
 =?us-ascii?Q?luqJAbdtAW377HiFkUrCNjpSMRrUxwuefE1wPjZSlhiK7LeAmCpWUI5muOWJ?=
 =?us-ascii?Q?jH3mTOTTqK9Phk831JrQhJfkSJIkBmlYE2lSCXmUeUpLV9hA2ytDa87PFjmr?=
 =?us-ascii?Q?PnwLCyBWgcqVST/auWUvrx60QoLKsFdrf4m6d5ukTKNcaHmebBEajvzPwU2a?=
 =?us-ascii?Q?doyUFXLybwDECzm7M3Mc8YcGqHLLFBS/tGn/YONOSG4rZG1ybPwExewNKZKz?=
 =?us-ascii?Q?kGSJ42hStsIl1p/bQZTByAlMk/NcRN8bqrLEuZNPr4E/FhKLn3IAeNPQCWnR?=
 =?us-ascii?Q?kP75y18VNPUD8MaDGacL9SdvVXrCLvXhvtwBxbk0qPItC0O6jk/lwOVf0HVa?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 920d2ea1-4727-455c-1f4f-08ddd3d17cad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:38:05.1180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmB06v1hNqvckpRw+B/V/jrEITE88sYAzeHrq7KYqvjfLqR9PnG7UPF7dytbmdG5wdfessCKkdD7vuwaqbpOXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6479
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

On Mon, Aug 04, 2025 at 03:10:38PM +0530, Pravalika Gurram wrote:
> Add bounds check for error code assignment.
> Prevent integer truncation when assigning 64-bit return values
> to 32-bit error codes by validating the range before casting.
> Fall back to -ETIMEDOUT for out-of-range values.
> 
> Fixes: 16ba2b28df3a8 ("drm/xe/pf: Add function to sanitize VF resources")
> 
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index f00cce81f1ff..2fa1a4fba1ca 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2091,7 +2091,7 @@ static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo, long timeout
>  	} else {
>  		long ret = dma_fence_wait_timeout(fence, false, timeout);
>  
> -		err = ret > 0 ? 0 : ret < 0 ? ret : -ETIMEDOUT;
> +		err = ret > 0 ? 0 : (ret < 0 && ret >= INT_MIN) ? (int)ret : -ETIMEDOUT;

This looks like false positive similar to [1]. 'ret' here will be
positive (success), 0 (timeout), or ERESTARTSYS.

IMO we don't need aggesive defensive programing here as the returns from
dma_fence_wait_timeout are well defined.

Matt

[1] https://patchwork.freedesktop.org/series/152488/

>  		dma_fence_put(fence);
>  		if (!err)
>  			xe_gt_sriov_dbg_verbose(tile->primary_gt, "LMEM cleared in %dms\n",
> -- 
> 2.34.1
> 
