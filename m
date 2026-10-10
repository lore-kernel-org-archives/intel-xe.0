Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6A8CA9EBB
	for <intel-xe@archiver.kernel.org>; Sat, 10 Oct 2026 01:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2C310E1DB;
	Sat, 10 Oct 2026 01:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLv/GgET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7113710E1DB
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Oct 2026 01:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791594877; x=1823130877;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Ur3NSRHRfKGHYSkiZd3G2sm0WbTK8IVE/4NoG8oCQU=;
 b=SLv/GgETIIMWfyPsDRIzPSZ7ZYzAOC28J5Igx0mDOyIfmpvyBYy0nPMZ
 mSUFkBqq9ZKn99yTZ3xgcyC8q6ExZ7Zdn7Qbg/TBeh2616OXoItJZBq0L
 MWDK2lEE+WH6gIsLUGIh1GTTYtUrP5u5LfcrhHOi19qOVmnvT0EVeEJFd
 fC9aBrrZzYsdCHNAMizRNr8SVAj30yHsW3hT2K0+bAzI6YlE4beCNQyrJ
 6l2Z7k5+V1ZtxhPAS2a3b6/w0qWev2+hifX2NRGAUkWxFXAw7lE8FK+y3
 grTdtKuXItVW+pd/IbeHuLjDNgjmFT92f4qy+/O/dJ9JdC7je+rxJeIaE A==;
X-CSE-ConnectionGUID: 1B2He8U7Ttq44YXmUTIgJw==
X-CSE-MsgGUID: y7UR4pKwQrmj6FJ28jN4zA==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="406603"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="406603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:14:36 -0700
X-CSE-ConnectionGUID: TckgyrU8T36UpmTUMprW2w==
X-CSE-MsgGUID: 9KYEfYN7RbaSoereXtyEbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="756818"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2026 18:14:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:14:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 18:14:34 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 18:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Orxv+iSUCjJAvJ0fOVmRJZtKF8qYph+XuiyKpp8zw/Q8z2iwXpAr2L+ZySN3Eae3to+KvGN/iIGKFkt2A47R4Zx92t2fXmIXNsis1gI4Et/lhpaHxu8Drf7G768EgKAvD7Uc9A0KVlIjkbIbblunDn1rYwv/FJH6veGzmTqBaWWXsZ+tRjgfsZsDuxYKsrTlhwBmRR1vrvnGFLGWPXU/hdqXz8VqxVYptFlV9qic51WXizgKIoWxgbSdavJrGpCI27PC202G4Mr2fzeOyhpVTmGrRphl2Q0bPikIOjbQKRSYuM5j+qHzCq2rvjdqwcu7XTKPmALCF4HDKsDHeymXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PoVpX+DqO25tmAu1p2J4TRbtHxnwrs/hooPtaym+m8=;
 b=mDSiWGJbazdKbPZG5tzP6WwQR5QMfublRi42NL2ei1svS5XO1PxCLIR1ZstLi2UN3jv8NqDbb/47CT0RMjlTyiJZxiAlUxqAaePCUbtZv6JXwn86ZrQqcC0Bb0z89QIzsvE/K1P76M4NCgDpalIHIOHW0ppGFxx8ds/W17f5hOLc2Gz/VWmViR2LcaoB38AAqo3fAAmwGVkAtXVC0b+FqHKGnahRjmGUqkHzM+uJaouaqoa2t7o/0Mmamjb7uoI3bT+Hq6Q731xVzPOvxLiRBpAvDNivLqW8xQm8v0f8za/cgnwf3xU2rxbZ4sJNdEKxEVmKFroQ+d9Ys1qsLs6OQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Sat, 10 Oct
 2026 01:14:25 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 01:14:25 +0000
Date: Fri, 9 Oct 2026 21:14:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe: Move xe_device_wedged_fini() registration
 to xe_device_probe_early()
Message-ID: <asmRZJJwxxyLd4ts@intel.com>
References: <20260907083541.2194747-1-raag.jadav@intel.com>
 <20260907083541.2194747-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260907083541.2194747-3-raag.jadav@intel.com>
X-ClientProxiedBy: SI3PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:295::12) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cbdc4ae-a4f7-4155-471f-08df266bd2b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|260925022911599003|261009223027099003|11063799006|260925021911599003|4143699003|260925021311599003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XYy7x7EgLVUadsZO2ICViW9RiQ4jKCV3uiq0vApomiyXEysqtEzb3oSDc/CnlxC7wFjY6F42SBgcDB4aDvm2GwQy4GP0r/DqW0gqqEVJVL10yT4kBTTTizmz+bRUn5zRnJH60rai8OXGBjHJS4Emsfa7LSlMJssouzKgsJs1BLbmfnIdw+/LsMYxqFCAIrOYvMwdoRPGynexWMocYnGZs5czQ79G8wKoAFFYnjwNE80PTwv/CVatx1mFTEUE5DEBQGGPpm0aORr2w7IR273NU9LwS8wATYj+5wXV9YgpCiNjmBQ7KaHzMskW9q9oj0XoEH1t0t0nyH6ZcF09cNG6MDvoNYokssTkH6DNRANb1zCtN/Q7PEgVUnfK8V6TI18tKS54p3zr+SZoypA4sNXAU6JvKRt7j9N+pFKro/nspTKGA1l0XlDW6PPYKyAdTzp/CvP0CWCGXrOneWMxsXZQPsydVTTlAjfUWtg2vRjQj5IpDrUGEebIO97U1prUyUcIPXd/OUu4SANbHqSSmm5pJEBtx66t2tBsG7KzVOev2sDYnElVJx2IcllRqeR35MBffU6miGakP0QEq8NKDKnmFeaS0OcsXkGHCYi6z43ame39iab4KX5NOBDkD2jnAjtqK57sowdCGJBFXSG9zmOFl9ZIOKgxRILHXLJ7Qro0R10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(260925022911599003)(261009223027099003)(11063799006)(260925021911599003)(4143699003)(260925021311599003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AeZr329aWJezWEvUYtmIKKrwTf81GmRy0GVreokYboOLEop7FhzvoQb3ygRp?=
 =?us-ascii?Q?rD71+cjuf15dEItZLDSugs2g0D6jgxeDOES+heGezx71L3kQJIRnPRHHuIXi?=
 =?us-ascii?Q?TZPFSxAlJ6mo9cI1g/eH9pTtsGC1m/2RHkpP0O7y31310AicnWLxhjiiXCTa?=
 =?us-ascii?Q?Flx0wEJG71p+C/wqR8A/L+dK6RpuYMHb1QnbZsG2rhfSxHwJrtCVxJsbX7iP?=
 =?us-ascii?Q?7gOh4q6fwDKS2q9B8gT6UyTbUPtbMZl9cyQ9Cf/adh7+cL0cqr73s9WfGT//?=
 =?us-ascii?Q?Oxd2sv1djyX2VgjkelRMyfYyycprjOcuNCvnIG/x8QLOfhf2VER68RJB+R+K?=
 =?us-ascii?Q?ochnEIqvOYJElNjS4xr3jJN+1y0dlJKGfNFdvMqkVbjBzqxuOcKxmNoUb/74?=
 =?us-ascii?Q?VSqWdy1v/Ghi/Fvgsq+wzgEphOHzJ1kvr6MaRU+2TTTrxxlIJBaduPH3kem7?=
 =?us-ascii?Q?tlZS9VlJO9UoYzkc/uklofoUCkfgAb38D8ftW03FeRcT7YUJZXE3J0Z6tYLI?=
 =?us-ascii?Q?RzrR2jaG6KazVxBB++Km026crZWCaifRay1/bu3mCdrycxImRoltE6PKQ11v?=
 =?us-ascii?Q?l0vSpPdt8cFxKpTbiXufUUsycbpnpSmraFmPjY0OXuCRD1uV07z7uvzcUi4Z?=
 =?us-ascii?Q?JK98SbgBtJkz448RV7NHAGGh6xOHZvlREJPl3tNq80SENkEHuIgCQ3CjADl7?=
 =?us-ascii?Q?dN6IkBkrAj0kQjmlnHBEtHWyNGsA8jtIklLel4DnYardSgAffQMY2td2fEIp?=
 =?us-ascii?Q?/Z4fiwF3QJw/2mEXQOFTTDZ3dfrCEIRnK9l37H8jf40XCqA1m81d5MtVbhb5?=
 =?us-ascii?Q?m8g+u9Yun1Ns8Cpl949OTw+2GgWfcLZT2StpuQ3YyTComs+Z2wX4B7F6Qef/?=
 =?us-ascii?Q?4QMeGPf8AyxqBRG86UdrKgMvQ7N9aObcaZJ+zlr7b20tDQIb/XxOkgSpuX2B?=
 =?us-ascii?Q?WEc3I+5iu+mpZ8hqspqCLP5Jn80vY1FD6jxM6tSoVpfNnFZWjpcatXKbn1jt?=
 =?us-ascii?Q?Ku4Iz1nHZUizt3SQwYzwCuvuW6py6XvBM/VRo+ciO13P/VqXsEkelepsyOMw?=
 =?us-ascii?Q?cp7yXRWF8pYXQS7PADRuw6Ho1MTmu6npQDDTXyRAQfJJqyzCp+1mfHBdYlKL?=
 =?us-ascii?Q?kEW4FeKsaHZ30N5yQFHaSNqkZh/sy4dysxNV+wVdcOJOqhm3Ci7x5PJqrljr?=
 =?us-ascii?Q?cvGps5QSrxRI9vjmE1w++k/E48EbJoT6PQR4ja0rSZ+yjASolpxncwpT1dBY?=
 =?us-ascii?Q?qOVak9dqeIRlzOrMFZrLxAqDMR1TlRslivvljHjZMqnKl0uVRaU+EmIgt1wD?=
 =?us-ascii?Q?RH8OSI8+2duLnVrccnzre80v5Cr5Ge0cRDkH+oydWt/EB6JD7vI0wkDzu0cV?=
 =?us-ascii?Q?L4jWJg29RgqRn9CqxMzujInurcuuI7fCTSq5mxwDq0YxvkrXSyDWyhBy7c2E?=
 =?us-ascii?Q?xBWjYWSl8G7Ktw/I6a3/nVVNZnV/Hh39Usrmw3lUxoASpmIuLwsBxfOBdF02?=
 =?us-ascii?Q?vGjHZlbqt3I1UcpKJ3QEV1z8K/X4kCo816gEx/JGPjCQGf8ZHKQyQAVZ9m+/?=
 =?us-ascii?Q?7lISNpbZyxeleQQf55GaNUKdkAxgIRQeED3o3QqxK0BuxgIwKhn993Zz3/m4?=
 =?us-ascii?Q?94f05GoSLfQfZOSmvncqMECkzT8Z3FtWPEDiVVyNWJU4vSJA4ScrRZoeeRj9?=
 =?us-ascii?Q?AIMMdiSkmWcZYZdDWHQtEUxiCW6Xz3JUlMLkbD9ZkxSfgOTFJ6JOtn4tCWzd?=
 =?us-ascii?Q?2UOAeZSeAzFqo563Zc3K0nru8IdyDG8=3D?=
X-Exchange-RoutingPolicyChecked: LkH/9notvArEcw2C0IuSE8ScGPgw34Pi76JJ35O6+481b0oNr3ZV/5kyM470kjohKRUsS+0LH9ZgpnKqy2TBpBW6Z0UglHasA/vrYwEFeD+QXWB0ckmdF3KOPaaKk+FF7wjhK8lAdENcAYAdN+pGbNEgEXQOp4JpB6sTGCHa93x7MjxdUz45UbOFlELMIpPA32xeDcX8IdKNJZXrBhh2Dm3cL140ULhLkxOpCcjcYAqZ3KupB7LwB9mP31mdS6L7SPsB9zhJfuz/mKh76FkydDCyb5wOZ0MPLOL8t8HfRtxv3QPxbvG2aQSgIV6K18/kzL+crKd4TBaI9HEQNVK2/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbdc4ae-a4f7-4155-471f-08df266bd2b6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 01:14:25.3582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21DnIjRZ/PzGHPNOxOhcbZ0dz3vX5C5jS5rpS7+Gm1PYMkAHVWjrufdKwj3p3Jg1Q8f0CIo6yRiXZXwz5U0d9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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

On Mon, Sep 07, 2026 at 02:04:37PM +0530, Raag Jadav wrote:
> The device can be declared wedged while processing boot-time hardware
> errors, which can result in PM reference leak if driver probe fails
> before xe_device_wedged_fini() is registered.
> 
> Early register the required cleanup action and fix this.
> 
> Fixes: a7df563b45b0 ("drm/xe/xe_hw_error: Handle CSC Firmware reported Hardware errors")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v2: Split fixes into separate patches (Rodrigo, Michal)
> ---
>  drivers/gpu/drm/xe/xe_device.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8583b2e9ecf4..c4194507118b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -770,6 +770,8 @@ static int xe_device_vram_alloc(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static void xe_device_wedged_fini(struct drm_device *drm, void *arg);
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
> @@ -838,6 +840,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> +	if (err)
> +		return err;
> +
>  	return 0;
>  }
>  ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
> @@ -1156,10 +1162,6 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	detect_preproduction_hw(xe);
>  
> -	err = drmm_add_action_or_reset(&xe->drm, xe_device_wedged_fini, xe);
> -	if (err)
> -		goto err_unregister_display;
> -
>  	/*
>  	 * Process and log any errors detected by hardware. Possible results can
>  	 * include declaring the device as wedged, which must be done only after
> -- 
> 2.43.0
> 
