Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9550BFF8868
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D79E10E2C8;
	Mon, 27 Apr 2026 19:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fn9cb0t/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B17B10E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 19:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777318005; x=1808854005;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QjRu75oZE6ZlJttlIaVrDCPg0IdA92DklW7PK6CtDuE=;
 b=Fn9cb0t//tc2ZKMwnWqq8KLXmhQDNLEcjvlCDo60iF9u28ehWudJNXbr
 jdcj7OurPPIkByjWcWjPlYVJzYMrhBwZVlo8tZfNmCX3MBufKJu1tM6IM
 3diKfsRoMQnqO+tMNlfvZm7VKD5DsvkXjxy7yfFF3Q7GdZsTYyfsV8iWA
 tZe3Er3Qn8CiiQjwVv0iVF/lk79xC+s/5Myvpc4vokEtQH9WphPXFpslW
 8eLuqLokWPZTn3NlrrGwmNFJRMmOEGODzma4lQ6tFSOXjyIgVIs8ccCb6
 tOKkrQspwAWi3NldTe/rR2ycyM24qTFyDo3TH3aEupJirV+qZ717+YY0i A==;
X-CSE-ConnectionGUID: BQ50JFJMSSWyniZ5isPVzA==
X-CSE-MsgGUID: Vsmgyu4+QkSEfxKafKGh9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77923502"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="77923502"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:26:45 -0700
X-CSE-ConnectionGUID: jqp251WDQTS4V2g5ykwzaw==
X-CSE-MsgGUID: SzHxnqpnQYmhzX1ZxdWfkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="264129428"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 12:26:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:26:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 12:26:44 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 12:26:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlcJPgVYz47MzifqrhB/oFvt3eM/R2o0e4iuYAgLiqSt9DqwK+ffFhy/KCUDz0cDHKHP2qUKwitM4iL7E0+DL5Q0Gw+MnGadfydLzEhbvHiwVihUax+fF7wATm1rf2OphpZ9ZFb3DUlYhRK/2g/3XdHyAex8fa2IsIK2dOQJiMGmYKt2tJZF+LxPlCiusTK3NrucGRiTgyiC69Er9x1U8F/6DuLeAO6LBuP8DFtwSrXLrA5PbgZnNBtcNqRMQownIzdjad8FOvI1NaUywKlCVYDFHRdTLhBR6SjexYfMaMwaEwTFFOap1wdkH5pyuSPx9aC12vDul5e7L4ani5uSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsNXTKRq+OpSRcUYqLQRfevt5I7n+iE4YmEIQUK2v4g=;
 b=WEakp+XGceCKkg8cFOC5CcULmdHCtr9KxTgjTFq+VAsP77nCaglS3MBdXSCtGxVRTWjZHaY2/B4SvTW931fKM/AI7zcIozHYKGo26qr9F5ylwALltFtDpOfndeyf5kbrHxvbDdMz6k4vGUgJ0F7KJ12Jvr+sXQ2g3knn0Z6D2/2QXfy3nVS/YYUoUg5L7qlDxDuhM/ZQKYF9U2Pas/cf3J2BgrPoPMr9k7h/csRpsU3yhYymsUf3kH/BUgEwNCzjHbSosO3Zh163zo24SmCMW76KkByH3ECh0Fr3sIkgDiJRygiEwCp/YkX1KBNv7SYA4kFbreJjq7eQalOiFM0rxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by IA4PR11MB9369.namprd11.prod.outlook.com
 (2603:10b6:208:565::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 19:26:33 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::27ef:1374:9fc8:d6ea]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::27ef:1374:9fc8:d6ea%4]) with mapi id 15.20.9846.012; Mon, 27 Apr 2026
 19:26:33 +0000
Date: Mon, 27 Apr 2026 12:26:30 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Steer MCR for NODE/L3BANK according to L3 fusing
 on Xe2/Xe3
Message-ID: <20260427192630.GA576512@msatwood-mobl>
References: <20260421-xe2_l3bank_steering-v1-1-613158a27383@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260421-xe2_l3bank_steering-v1-1-613158a27383@intel.com>
X-ClientProxiedBy: MW4P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::6) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|IA4PR11MB9369:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec08a11-47fe-467e-76c5-08dea492e3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|11006099003;
X-Microsoft-Antispam-Message-Info: 6vgUsH58W8kZJVCFCWPsXet2eUBK2X5J3GJR5WKGr+gmCqTqFLEyfp/p5XUmTtGKtORdd7eVEc6v61NF4hOB6I2N0Cs3m0OpvAQfTKAd6hZd3z8h3qlZCx3E+PfJeVR/ES27n4FKCqYwK5jA0ubQhyr8wbY2zH5RP9liOD/D24ldlM4eXOr7NyWwzgTTsfjD8fcxzuA6LQd7CpSUUvAuViD6i8nn4rvIMZB10YfAYwBaTSoIt68rO3w+bEE9wh6YhlpkKG3Oo9oRVhuwQtKzK0ryiz0R/om/tVYYW77ol05jjJpXg2slhaHbg1225VKl/8NFYZ+hw4USG4znt3y0s/S/9aCTB47OQdvFa9lNL7ici58S5JsLivNL3DlZkVrwLDV4JM2wOgU6D/j01T3h1AdLyyYb56CwsIOCQhWezSCznxl9xxBccHfj8QFDjecl7XrXEsvYorGZQLLQQexaT4Tvw7VTCzBHvduyDhWv7gtKEqD5bi3V99BYphb8szQIGlfkkDeD+iFzFkAuIv20K3l4OPn93dZewFT+Q+BjoQJoaMMdBOsYMGDuqHunBMH0PUlmffLEvbbQ5/QqxZDsB3E9hdIODX7X4+dEoM6YpE4tAHJc//8xLn1u95omVRDu1qhW7aciS3BSqBA4JHBrthSzbh0AKkqu6JWHrQr2zu4rniHo9/L0CmS2L7jEIR2G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11006099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1pIQsoU+FPtTnzechk5xbrKacFknCRDRyggC39OCzjG4+XnvdVFKmGaPQ7M?=
 =?us-ascii?Q?FOjv+8ncd+Z3DRqPkhwncY68GKNbwnFgB8cODEr9+2Gao9gNr2NgkSH69bEB?=
 =?us-ascii?Q?SeKGncro4ATw4vXXOi1ofDv2Vx4VzFAs8qkWYZ1XTQU85WxXjMNsrWdo5oNt?=
 =?us-ascii?Q?5XCYy92I7FTQzIE7LVQsvAftIQIJjm1CoXq13jhOWym9SKomyqYLCTOyuujD?=
 =?us-ascii?Q?0dDore+ITfxCSiS9YA6mMWKfYXFEU3ANrGtM+2qj341SQ8XQ6tCVGwE42nrt?=
 =?us-ascii?Q?KYgkVnWHXcaJBs584JskLQITe/i++i88jEsDHtMMBe7Hugd3r95L+jjUCBey?=
 =?us-ascii?Q?KVjLREBLURI1I4oae/8GQaVYtrYRGdJ+qM5LXOqrqLXMGTj8QlMo5zeFeDoA?=
 =?us-ascii?Q?1Tf//N+lxN9LJC2SU6O8FznxqG363Q1qxxly17Gx4KY6vhicDaP/3NnrIEDn?=
 =?us-ascii?Q?ph5U12jsjKOsJTfjpkLcBLBXAqWnnGvqrXn6YHu6kSHjCQ418ypGTKZdymXi?=
 =?us-ascii?Q?K2vv22Q/YxfGiQBJ9I1OlZIEX2OADWI/2SZAhiCPjHIlZy+9x/YJr2QYnL//?=
 =?us-ascii?Q?vOi+EDYRrwCBZlwYHDeuzBEDqGxdJKFCvQyloNeg63rGSitdqUqzktgjsbjj?=
 =?us-ascii?Q?Cp8iATEqbbqotWdZuY5AqnZ3SStdClD8sttQLsXsYtCybeGYyZ6wpx4iTH6U?=
 =?us-ascii?Q?2/tA1FHjv6ty1fMx6+4wuGoN4bbAwClryy5KM6LVcVQaxlzep5ztUtSXXymD?=
 =?us-ascii?Q?oPKn/IGOU50MW3IKP1Krd527y3ATDvaEz2osbMqp/Ux2cMg1tb7YVwoJKX8L?=
 =?us-ascii?Q?m18qJsghbb2yIt/VL2ZdvTOSz+JKpNmtYXi+PR0u6wM3+G26VB8jo/60abmu?=
 =?us-ascii?Q?5hE4duaY4jgkY8kixzIpEUNDPHk3rZpmjfJ/fVEpOSoM7GQA62TzmlphCQIB?=
 =?us-ascii?Q?2gvySVCKIyVsSPw5dzH5LvzO7whPYFaXmusG0wJ4pmh8xiCipiAyOAAs2aef?=
 =?us-ascii?Q?HyyjSqF42TLeadIX3ETGF/rGYFu6UDfNVgT5yZuJ3G7kEGgdXNjcUiIWEUVr?=
 =?us-ascii?Q?QYp4eA5lu9cRznFCbPVflnustvkJGl6Sr+1xk7YiaM6+SSr7R9TZFFibBIMn?=
 =?us-ascii?Q?+0Z85ssfRuMuDfaB8ZKqBna4Gu3F60qlq0ApBreyBLO2GLJLfONpy72+I6tK?=
 =?us-ascii?Q?p5LNtNlqk0U5PmnlbLmIqmsGoJ6JMs3Fz6ik8efKwH9i02RilBsimLLCsTHm?=
 =?us-ascii?Q?+wXDmyTyhynpgr0qolr3AH+wVUe8VZJt+Smrh5oX1to5riKfoqnXuWzAwoiH?=
 =?us-ascii?Q?comuhwKGcjhEukiCrpL9uLDnSgnBX/KxcmkuV9sryuJycLZpgzEC57VuboB7?=
 =?us-ascii?Q?2elKI1weM1w7bRjHEBBUfsnzIMhpyiR9S52H+4PEnx/b1MY5a2z7Q/aV6qIk?=
 =?us-ascii?Q?fN2UvxtOy+ZR08kT8MBDX2frjorlRXXNYIr96LVya8CNR474+aSft5Pa3AKw?=
 =?us-ascii?Q?MqAIPUFT+D9o8onrz62H4ZAai67HxeV238R7FzLu0lCJBXFNWxYpsM0OhSEB?=
 =?us-ascii?Q?aP0oLaKuATePdUWL+8wPEveTvQTGsOiZfKw1qWNqS0BD+YHupUv0u1CewoWS?=
 =?us-ascii?Q?kCz98pWg5TNRxEHtxp5DeAOiOvUuOCY3tljQYtG5iwQhAlhhVGPXe/aesVuR?=
 =?us-ascii?Q?nONnXnJZnaYd7dmUnGhehq+ypYY+qfucR+QAdzp1vukIPyHfwEP5yjCIvErQ?=
 =?us-ascii?Q?Ojlhtr1XFinOVVlPg2kS4+9YlcTN4Ho=3D?=
X-Exchange-RoutingPolicyChecked: HcPQfmXOvVrKE+kWPmW7LqT/tPZlnzwgFkd3RI5TfxNnYuljkFmM9eGCHg2E8WDgH8FmuugfyicFVSzMDGwCorwpW/6w7kV3rYqAcFRmJl/T4nMxcF1nRg3dhwXuit6Wrhnye+0PCaHlPvFJu/09j5QpqNJcpDuP2+1wgMLx3FF+/Un3fJRHhAz4KnI5bj5JeAYud/dFcQzk0u5fxsFZ1OCWvvfPa/pn02TJ+FYk3bsJMErD66rWO6JoDVhF+lGs9/zWUvuNX7XsSC1wUq7vZ9qcG6KKRLeXG40J2DYmG8zAzZ/wfHO4sdUPp/Hg32RRlJYCHETDxxyo7FLSvA8urw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec08a11-47fe-467e-76c5-08dea492e3de
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 19:26:33.0280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dniHIB+xtrFqYPxFOtUZVC8g3/qAxgms9a1ZD4RGFBw758eCKT9vsHxhg0ugZLwdbOD5AAQlmMAMT2lt+1FgnsTbC8SqwuLaOa8ysSr5qvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9369
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

On Tue, Apr 21, 2026 at 02:18:34PM -0700, Matt Roper wrote:
> Although the bspec currently indicates that steered reads/writes to L3
> register ranges are never terminated for physically present instances
> (regardless of fusing) on Xe2, it turns out this is information is
> incorrect.  The hardware architects have also confirmed that the current
> documentation is wrong (or that possibly the wording was intended to be
> interpreted in a different way), but have not yet provided an official
> spec update.
> 
> All of our driver's writes to registers in these ranges are done as
> multicast, so steering is not actually important to proper driver
> operation; the only impact of this documentation mistake is that on some
> fused-down SKUs where the first L3 bank is absent we're not able to
> properly read back the values that were written to those registers to
> confirm that the writes were applied correctly (e.g., when using the
> register-save-restore-check debugfs interface).
> 
> Since we don't have an official spec update yet, let's assume that
> Xe2/Xe3 use the same fuse => steering logic as Xe3p.  I.e., remove
> L3BANK and NODE register ranges from the "INSTANCE0" steering group and
> add handle them with dedicated handling according to the L3 fuses.  From
> testing on various fused-down platforms this does appear to give proper
> steering and fix the failures reported by IGT's
> igt@xe_debugfs@check-gt-reg-sr test.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7706
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index 7c6f039c880d..89e105cee09b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -216,9 +216,7 @@ static const struct xe_mmio_range xe2lpg_sqidi_psmi_steering_table[] = {
>  static const struct xe_mmio_range xe2lpg_instance0_steering_table[] = {
>  	{ 0x004000, 0x004AFF },         /* GAM, rsvd, GAMWKR */
>  	{ 0x008700, 0x00887F },         /* SQIDI, MEMPIPE */
> -	{ 0x00B000, 0x00B3FF },         /* NODE, L3BANK */
>  	{ 0x00C800, 0x00CFFF },         /* GAM */
> -	{ 0x00D880, 0x00D8FF },         /* NODE */
>  	{ 0x00DD00, 0x00DDFF },         /* MEMPIPE */
>  	{ 0x00E900, 0x00E97F },         /* MEMPIPE */
>  	{ 0x00F000, 0x00FFFF },         /* GAM, GAMWKR */
> @@ -267,7 +265,7 @@ static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] = {
>  	{},
>  };
>  
> -static const struct xe_mmio_range xe3p_xpc_node_steering_table[] = {
> +static const struct xe_mmio_range xe2_node_steering_table[] = {
>  	{ 0x00B000, 0x00B0FF },
>  	{ 0x00D880, 0x00D8FF },
>  	{},
> @@ -298,7 +296,7 @@ static void init_steering_l3bank(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_mmio *mmio = &gt->mmio;
>  
> -	if (GRAPHICS_VER(xe) >= 35) {
> +	if (GRAPHICS_VER(xe) >= 20) {
>  		unsigned int first_bank = xe_l3_bank_mask_ffs(gt->fuse_topo.l3_bank_mask);
>  		const int banks_per_node = 4;
>  		unsigned int node = first_bank / banks_per_node;
> @@ -536,7 +534,7 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>  			gt->steering[GAM1].ranges = xe3p_xpc_gam_grp1_steering_table;
>  			gt->steering[INSTANCE0].ranges = xe3p_xpc_instance0_steering_table;
>  			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
> -			gt->steering[NODE].ranges = xe3p_xpc_node_steering_table;
> +			gt->steering[NODE].ranges = xe2_node_steering_table;
>  		} else if (GRAPHICS_VERx100(xe) >= 3510) {
>  			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
>  			gt->steering[INSTANCE0].ranges = xe3p_lpg_instance0_steering_table;
> @@ -544,6 +542,8 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>  			gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
>  			gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
>  			gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
> +			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
> +			gt->steering[NODE].ranges = xe2_node_steering_table;
>  		} else if (GRAPHICS_VERx100(xe) >= 1270) {
>  			gt->steering[INSTANCE0].ranges = xelpg_instance0_steering_table;
>  			gt->steering[L3BANK].ranges = xelpg_l3bank_steering_table;
> 
> ---
> base-commit: 33d3b65ec51f2bddafa26a80249e26c78435f169
> change-id: 20260421-xe2_l3bank_steering-92cd6485a387
> 
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 
