Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442CAC982D8
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 15:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAD310F425;
	Fri, 18 Sep 2026 15:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A4mV2g09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A1410F419;
 Fri, 18 Sep 2026 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789744163; x=1821280163;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=qdOlqz/fUv9Ef3deB2QpNZ18UVaiusMwQuACirJKmDo=;
 b=A4mV2g09+6mGiQ9wuoB3midKi6uOGsKnsS02EScSC4aIGvt5K2B1/bZz
 633yNbVP1IbrO+Q0CWKFGR47u84Bx+Vtecl0JZNLeSRtyV6gpERCCnt5h
 NzRn6sFBCr3x33SdLuyT6L+/+5SWU0VVtaenDnPaTBnBs7FDYhz0p+cFk
 UnqU4bnk4a9gkUMtvOHdihF7X4Bv1nTurJMGP2bEmw0Za6oJ1joax7wxp
 ilg44I8qWQt3W35FUuD7N0nkyP1PckyfGBh0N09aOiIsPiVwXoEsSTioM
 NzJkyeWF9pheQaqnHfffNsZ8HSgnFJ8XjROTJCybrgyy5aFeeVGmXsXRj g==;
X-CSE-ConnectionGUID: ZRf6uklbSqWv+3hoT0bWTQ==
X-CSE-MsgGUID: SHYJSWlTS0WJD1IRYS4Pig==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="115789132"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; d="scan'208";a="115789132"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 08:09:22 -0700
X-CSE-ConnectionGUID: HEtfa+g+TACbOA0kQaXzoQ==
X-CSE-MsgGUID: gCHAeBuPTh+C1mTaVVOnag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="2648654"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 08:09:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 08:09:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 08:09:21 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 08:09:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlbACFzD4YI6bqYxmSJAmfqrXMwfbFRuMv3acQjjpUF+H5Ndm3WmJaJd3Am4/LGUss+vluUkg5u+rKr09d3FP+UIMO5jHAyx/Kpqb/nUZBCkqPcSJWiPYagNh47vkUf/0rDSB5z9ZtqnxpOYdk/t9WuwsWdKeprEYpAqVwWrvQWpFoqkj6osvaBtZ2F0L5kfIPZur5XjPAsP12V9ZPmlqvN27HBrxbrEbQSljjETtb+YnGf7pXNYpjXO5m730h4Z1IOxjMgSjERlqf+eAaSXtEBabnVISlvIIRvlZd542Y8TUK/mL+SBoDILpLHel3YQKbvbXRF45E7cl4aiAKDNog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rv1nRvl5OaK7H4WCTVFTXbzmVtspTa1rLPDmQS8UREo=;
 b=mFUUDJBW80NyX6E339dgo8Li2m5zjgBt+oWNdWqnVVrMiVZcj7sLNQqSc4h2GESVUvkwMFrvIVj1szV2DlOUwy6ZoolUKLN51WesgDLQIGtDlXx7tx6SrDStJ4QgqUSZrzqRhBJCLpgkZH+JmbVZfKWRWMQy2SFvfr0UR9+H3xymSdJ6o8BpsOINXi57sy6oHmR5EkVquj1Qc+70msAcxXTIdR/Z52zZw4WX+rbKbWP7n6MQOyncmKGX105CkKBmCsE4pfS1PI/5w2+v5I0LAycbkHEBDZCbrF1edtixSn4J9pw15/XJdfq94a8dXy2xfBnhOyOFonSfdmGN7mz8AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9273.namprd11.prod.outlook.com (2603:10b6:208:573::17)
 by MW6PR11MB8437.namprd11.prod.outlook.com (2603:10b6:303:249::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 15:09:16 +0000
Received: from IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa]) by IA3PR11MB9273.namprd11.prod.outlook.com
 ([fe80::31a4:58c:e3b5:43fa%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 15:09:16 +0000
Date: Fri, 18 Sep 2026 18:09:08 +0300
From: Imre Deak <imre.deak@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <ankit.k.nautiyal@intel.com>, <arun.r.murthy@intel.com>,
 <uma.shankar@intel.com>, <swati2.sharma@intel.com>, Ramanaidu Naladala
 <ramanaidu.naladala@intel.com>
Subject: Re: [PATCH v2] drm/i915/dp: Disable DC5/6 before AUX programming
Message-ID: <aq1UFD8toza-u2pl@ideak-desk.lan>
References: <20260918060426.1162123-1-suraj.kandpal@intel.com>
 <20260918063829.1321703-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260918063829.1321703-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-ClientProxiedBy: GV3PEPF0001DD95.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6dc) To IA3PR11MB9273.namprd11.prod.outlook.com
 (2603:10b6:208:573::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9273:EE_|MW6PR11MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d9465d-f594-4ac3-7cc8-08df1596ce0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|11063799006|10067099003|18002099003|4143699003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: uAUsjeAG7IZaahAsAlRSM6mmPGZxVj6vKJNupQhWkZQG9FGc09YVQ1/Di4u7rnb25lcXqJcagHPy3E+Zl0miM5gp9EDy8jn4Co2LsNZcS8R4WgsDom5HvlNUP89Xuoo+D9ayXoee79Fj1HsakImK+ngu8ys6pKVozTLLfe+8Ps2P6wYjAXmAfhAsmLTAjrbZzMLkPGInFMV2LjRv2agw4An3/rAPteuyCrH0bsldtnCDHFMWfeSNUOf4/FfvY6Jdg4Eu/r14/g+Yvc7qGRGNM7rcQidr+YcnDgFpPECGI/xtf9HVrUi/r4FWwTB4S8lbCyuXj4uP7caYP3ba5XFuMgbYAs2oWhnjUEBJDVA5GfwG158RRph/jrVRYONE16ItCl+NTDunRrE3lV+X7f9gfjBUt6mZ6FhEKC3XyWKcXxxOPt26c6mvVllQ/5LaVg3pqY2lNp5zzXBLTPhXoKQxvnK5NlTsSpnUcUOx+r/9VXaqiG89FOXZ63HnYMCZUBhXT4JTRxWWvJKrECo+AiM+y6fESTptlIcuxkfWJufAV96RZvh3v+wFWm2Qw7luZ2492oi0JUoSPXR/kEpTEgaPC5F1fswFgbCGhlDvjTgW3c3Joi0LIvLmKg3UtyrqzyZ+QsZBk+wyEvIoGMajWFmeO1E1zCWGq2cwy/hOi2+QF3I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9273.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(10067099003)(18002099003)(4143699003)(56012099006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tjyuyY+BFrgIrZQfYwAt1wSGfXCorGlhf0Fy4QAca0l7opODRIE/78JzxfXu?=
 =?us-ascii?Q?2Z+h+NBiAZXtSmCjFsxIfKp/oRHQsAEq/UoVGFdp6/X1UJwkDq1UlODvO6xL?=
 =?us-ascii?Q?WiMXWONOD+ckFaRvV/CO3yGDAd9/KcEiChiD+f2JhpUzyPq2Ocyj9yzlAuTJ?=
 =?us-ascii?Q?ZpJ7YwV/h97DkpCqX1pqz6b4kQRCbmiU5LuZ23W7NwzkM/CgT6vs9aTmynHF?=
 =?us-ascii?Q?e1onh/33712nmwLfa6/GMZncl0DH40FyLGg6j9Yg4jBKKcYah4xbvEXk/lrO?=
 =?us-ascii?Q?fA32kCqKQ2pOqdiLgm//AIzPdKLjIQcJ56qUhkRDPJyoHnElFAW7ex73MBjQ?=
 =?us-ascii?Q?EsLbWkyNH3/MoDSJ/1JU2wwsh4RNYJLWN8dMzJ0Q4NMFte1aBw43bDJknSnX?=
 =?us-ascii?Q?k/Dm0C+NMdFM3R3bnNuIlOgWHHWBldSD4GCxHx8mQJ0JtGNVFVswj9WCZk0F?=
 =?us-ascii?Q?Yni6fIaAV9Mcpr6IQfzivRYHoncFvNvH2+Jeem8AcvKH/2od1xyJMoLz4GKN?=
 =?us-ascii?Q?pgU+1JfM6o4skltzHt+s/VmxrJB8NMltgVnaLDGRiJxYPfTl4xy7q1sefMGQ?=
 =?us-ascii?Q?mHxBrVZFjYZq/lZAe8MjG6wYEDasPgXAWVHYc+7B40EOuCZszcU5nIjpZ388?=
 =?us-ascii?Q?iJrHhq8/3y1pPqzkvlu4d4g/kJCOhkIb1PiqKN3GmBwww426E/AZyAo1TnN3?=
 =?us-ascii?Q?3XRG6pzlqGZ7nQt/jb9mnJA+Qasr4UmXElaczdU2idWXdNa53iuHN/I4QU5Q?=
 =?us-ascii?Q?F4XnYmaoMYcYAwh6kLgy610CsvKoHwflDfMq9LjYgPPo0RGkO83b+ghwloxk?=
 =?us-ascii?Q?HVSh92NzKIUXLD66725HMtnDo4IwGT+oFLiBvK+15GcMfuyQ071JYV0OGN+F?=
 =?us-ascii?Q?vcMG4MuSvAGU2xxActQXl1KUFW39eZT9uYfUMMtReWTpYUcPMm84Btl8jViU?=
 =?us-ascii?Q?HVUqZgKP0w3fciwpNg2oc9Z8LCMClUHr657Qqa57n8nJNs1r1t5VR4Aft5wy?=
 =?us-ascii?Q?QB3wQp1mrl/SRHbdB4HA8jxBLlunRAZIJDnGJscZNBRQUByUhKKe7RHX7MsS?=
 =?us-ascii?Q?XuvyURiC7amSlKPryAJ2Soq1KBVM+JKxfl7iDz9E2i743SrDqEkkohyB2JtC?=
 =?us-ascii?Q?07QwcN45d7FXbHqvnDIRgiVV7gF/XoZxEqWA8Ph6O41OwM+VErhZVGAJRkiw?=
 =?us-ascii?Q?ZjqAJTZ67SGQYN7EgqCg7/i/JLZhWGPh5aazPt1eMMevyH3PsXkiWI1ymy5p?=
 =?us-ascii?Q?C82y8FNDdyfSG9eLeWsMIxTMj/983Vogmqvq4WcK6yZ0l2yr0u/IFKK8HqJS?=
 =?us-ascii?Q?zYpubX+FkWgfFklzeSrJKXIxg0dMV6GdTmfu9Xhk5+QXdftcPxcJSCBaGPlp?=
 =?us-ascii?Q?3ShFIe50q84nEUG7kIixuyqIxyxty6+YEfipSQcWHlmiYJaRo011QxtHrKcg?=
 =?us-ascii?Q?HRXw4sqd7mza1cdNprcRnc8IwnF5byiM2PyGcFr/tReA523i0hQK1DeoTsX0?=
 =?us-ascii?Q?VhVTCJHDTIuVvgH6DQBauFZP9JxFKjfqFAmMqPYVi0ke7cA2SWLag26/shRL?=
 =?us-ascii?Q?1GBEZITsqq0EhV7Ij9aBR0Mz0aTXu6hDTgM+gINqQiDiJkTREnMJb5fAWESB?=
 =?us-ascii?Q?AQI/wyWe2kR5H+KQiiqyhz2ZXUp8kTPnn5THhgd0sD7GrXw4fEmYBYwgTCAB?=
 =?us-ascii?Q?ZWb8lsE795ACjERkzsWIKZwfGETWK0gyOgQ0eXeA4bL39+6azwmUG+D94gkF?=
 =?us-ascii?Q?7UmJS1dwpw=3D=3D?=
X-Exchange-RoutingPolicyChecked: OMvPw3fCjoTbseyTl/g0aV0fJHf1Ur5dAX7F/otpxKC4Yk6LHrBMDkSi+9w5mNB6hrsO3kks86SqjrCHs59lCN2iCuxJpJ/JTDauZOxlCLoDqdYSe8es0g0ymE62Yp5b3yKn/nmLABFB1BB07BCZOY1yVrlSFi21lmK1MWFwo8kC7iC64AOD9MykDBxJOTbSL2Ial+046E+m8/e/xrwiPDWxZ3Xp4S2uYpzZ8YxyJeUiHnDJzPtzf66pcV3WvKbjQz81coxw+rVA+vI0+wmnuR0tdYeLjS/MauH/tONhhOSev/xWD0sqdZYV1ZWZAuEcCLdpsqs+kENch5dmWtDkQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a1d9465d-f594-4ac3-7cc8-08df1596ce0d
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9273.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 15:09:15.9087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3cP6LZyAa+7Q7MzZKepBp3/MQlFJNfoqJ/yFhO/rJd0wf8P6SrfQ6O65Zrb4Ece2cHN6DFm/HxqHuraQkuC7RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8437
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2026 at 12:08:29PM +0530, Suraj Kandpal wrote:
> From Xe2Lpd we removed the step to disable DC5/6 because as per Bspec
> for SNPS PHY Aux will be always up. But from Xe3p LT PHY was introduced
> which powers down the PHY. Which means we need to make sure
> "Disable DC5/6" of AUX Programming sequence is honored.
> Disable Dc5/6 when programming AUX.
> 
> Bspec: 68851, 68967
> Co-developed-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
> v1 -> v2:
> -Fix commit message (Arun)
> -Fix the if typo (Arun, Sashiko)
> 
>  drivers/gpu/drm/i915/display/intel_dp_aux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> index 3cb07b0a901c..879b203f9258 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> @@ -260,6 +260,7 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	u32 aux_clock_divider;
>  	enum intel_display_power_domain aux_domain;
>  	struct ref_tracker *aux_wakeref;
> +	struct ref_tracker *dc_off_wakeref = NULL;
>  	struct ref_tracker *pps_wakeref = NULL;
>  	int i, ret, recv_bytes;
>  	int try, clock = 0;
> @@ -286,6 +287,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  
>  	aux_wakeref = intel_display_power_get(display, aux_domain);
>  
> +	if (HAS_LT_PHY(display))
> +		dc_off_wakeref = intel_display_power_get(display, POWER_DOMAIN_DC_OFF);

Please don't do this. There is already a way to enable all dependent
power wells for a power domain, in this case for the above AUX domain,
which would do the correct thing whenever the AUX domain is enabled; as
opposed to the above special casing of the AUX transfer. For NVL+
setting that dependency would be something like:

I915_DECL_PW_DOMAINS(nvl_pwdoms_dc_off,
        POWER_DOMAIN_DC_OFF,
        XE3LPD_PW_2_POWER_DOMAINS,
        XE3LPD_PW_C_POWER_DOMAINS,
        XE3LPD_PW_D_POWER_DOMAINS,
        POWER_DOMAIN_AUDIO_MMIO,
        POWER_DOMAIN_AUDIO_PLAYBACK,
        POWER_DOMAIN_AUX_A, \
        POWER_DOMAIN_AUX_B, \
        POWER_DOMAIN_AUX_USBC1, \
        POWER_DOMAIN_AUX_USBC2, \
        POWER_DOMAIN_AUX_USBC3, \
        POWER_DOMAIN_AUX_USBC4, \
        POWER_DOMAIN_AUX_TBT1, \
        POWER_DOMAIN_AUX_TBT2, \
        POWER_DOMAIN_AUX_TBT3, \
        POWER_DOMAIN_AUX_TBT4, \
        POWER_DOMAIN_INIT);

static const struct i915_power_well_desc nvl_power_wells_dcoff[] = {
        {
                .instances = &I915_PW_INSTANCES(
                        I915_PW("DC_off", &nvl_pwdoms_dc_off,
                                .id = SKL_DISP_DC_OFF),
                ),
                .ops = &gen9_dc_off_power_well_ops,
        },
};

static const struct i915_power_well_desc_list nvl_power_wells[] = {
        I915_PW_DESCRIPTORS(i9xx_power_wells_always_on),
        I915_PW_DESCRIPTORS(icl_power_wells_pw_1),
        I915_PW_DESCRIPTORS(nvl_power_wells_dcoff),
        I915_PW_DESCRIPTORS(xe3lpd_power_wells_main),
        I915_PW_DESCRIPTORS(xe2lpd_power_wells_pica),
        I915_PW_DESCRIPTORS(xelpdp_power_wells_aux),
};

and using nvl_power_wells[] on NVL and platforms with the above DC_OFF
dependency.

> +
>  	/*
>  	 * The PPS state needs to be locked for:
>  	 * - eDP on all platforms, since AUX transfers on eDP need VDD power
> @@ -459,6 +463,9 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
>  	if (pps_wakeref)
>  		intel_pps_unlock(intel_dp, pps_wakeref);
>  
> +	if (dc_off_wakeref)
> +		intel_display_power_put(display, POWER_DOMAIN_DC_OFF, dc_off_wakeref);
> +
>  	intel_display_power_put_async(display, aux_domain, aux_wakeref);
>  out_unlock:
>  	intel_digital_port_unlock(encoder);
> -- 
> 2.34.1
> 
