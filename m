Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD28C44529
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 17:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B91B10E1A4;
	Mon, 20 Jul 2026 17:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GH5l36cS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19B510E1A4
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jul 2026 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784567580; x=1816103580;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FYh6qLAibs7lmqShkxbR2IjfFFKGOgEONgQzDV1v0fs=;
 b=GH5l36cS2mbwh0KKRoU2ew8YIqoHFRxMjUKeOy0e1HsbIMDe8ymb9bmx
 iwwKkO4T0jGe7gM1oEen85JLx0Fg4Cl7IIJoXKZooUA6nqa7Iq1tbo884
 2+35r5p6132dxo+H62g5vqCJFcaWUaBImheL7YHtuN/gelY2rjRSiUH9r
 IJnavjCXF3NuOGik8hF39RNtwV1k19A5eb+7LujDvklo754zBslS6deHW
 rBasynsqykS8CDjxmA4UKtFsM5w1h7BPMNa2UZYjiDiHzTlYzk8MLUYTJ
 Rgfdk4hTfnIBEUlqIyR0CCG5R1UPbpcNn3HAfVPtE1vVyS5BWFCz4Ro7A A==;
X-CSE-ConnectionGUID: mnyNK/lLTaqFb2g+v8plLQ==
X-CSE-MsgGUID: IUhO+eUMTc+c3rzQGuf2qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="89048515"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="89048515"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:13:00 -0700
X-CSE-ConnectionGUID: 4IgAMyGDQMWnLlfZpYeNhw==
X-CSE-MsgGUID: 8w14IAEcQjWodFA9qS79Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="262467892"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 10:13:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:12:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 10:12:59 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 10:12:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmgICt+PDcYZ1rnCqLbOLpY9oImpp+OJPg41WsZ5kwWkqI5xNTD/Vh0iYs7oZxmK+3BGlMoEgfRnoC2Y68UXrc+q8EXSsz7w8+Q4aV30qc6htBs3H//QfJmG6Vm/HOwsdVN01ZgCK0DWOafgtVPQ+Vug8krKRjLuNKXCl/QFvidNi3410jDt/7hatuv6SFRZIyjfaIWc6PxG1IDwhHiQrvEXintvMq4sBFkdp9jlFJoF5HMa9ciuLx1vqfkV4lhx46sJnVpa61U1Tz8ME5wwf0I6ZrLs1T98u/TQI95ScMdTbSyXzbGMWS4/Rs5ctKexqODmtNgi/SOUN9xwpkEUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt1tvgBGD+rwo991YEFC4FJco0C2224sgF0i1k31kjE=;
 b=HBO9AyNFC8OZgGVWSAwx8XU18mKs0Po+u586cjvuWDRSpLOx1okfpfTBQUVopyeSYjMuES9NiQPa2ds7NOGjMobq8leBAa27OoTYfo5SBv3poJmJRtcywpIQTI2vKYBJnYiWym9EKsPgTT21fUmSYrPQVq8bq80T7lMMirI6VHkvWeUgCh+/Xs2GRZKyY3kzBTZq+T91HXfho6yhjX+ViyB8IGhs0+DwsPThdjQJ1AE5b8cSXELM+V76R+WWelnw96U1Ww83Y0tmpg+MySGcACeBs4XetpLKjpyp/kQ0bUtaqZHnKEwMVZ/nMV9ZVMTZ/BLAdrtGQY25HFhduQGSjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH0PR11MB8233.namprd11.prod.outlook.com (2603:10b6:610:183::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 17:12:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 17:12:55 +0000
Message-ID: <9bff9629-31ca-4618-92c6-c63b4f993bd9@intel.com>
Date: Mon, 20 Jul 2026 19:12:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Hold pci_rescan_remove_lock while disabling VFs
To: Lukasz Laguna <lukasz.laguna@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260720080510.2743242-1-lukasz.laguna@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260720080510.2743242-1-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0190.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH0PR11MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f09c67-b159-461b-f1fe-08dee682239c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: NxGPyiffPQ8JXKTCEGIVAzVMtsb11wcNHmKAycyUT7nuP+3y7aU3sBUsYg/Yj/qQS7H/9iW0v++CAa4HouiKoka1q+zf7+D10uaMf5GPa+/rOxLbfLXTX3D8euhcL5B8m07hGm0Ev53ft+UcWGgoO29ICN8Aiw1Aarf3BTYJsC/u+FMBieybmT3TJFDyNzlM43PW4U/x9OFwOD40tjCov9z3YqVP39CidRQoAIfxK1SdKHeE4u+/ofYpX5ATJtstBdoBJLQjcz2c8ZAK0h9L+EY3aTdTK2huai4hg7peCo2z2bN+0k1HMPFR/xFfoD8tL7udXfPOkVj/JZeu+OfyYs8S2MHKw0DItA1YO97ruFjfBngYgs6ewUhk/sX+7G4YZyWjfjfh9t+NwrPaq1IoPb7fWCklbuQPelKVkMwCuprV5Prkt2JAsJI3HSq/82VTMeUluWELke5KuWuD8Kwg94yo793NJqVKTy4PIaYkAJI/usjeYGPZGiOylPPNjypQx3Isi64F99wNHpFk96+HZ5yAg/ci61kqMaVP9cY3PkWhI3R6OBOkSIW2MNe+sObZZi8TM4Y1isRAPA4t5Hp580/yqmUlnfwSvYRipF6yKVg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0kzWkNOK213VFphSGFUS09meFdDSzIxWklSb09CMG83SkYyR2Zicm9JejFB?=
 =?utf-8?B?NzJJWXdQUVVCdDQyWmpDUThMWi9KNjlTVjlKMHp2SlBIY1BKeDhqYlp6MTM5?=
 =?utf-8?B?amFpbjd6b1V4OWxhaUIyQlIyRUcvVEsyZ2o1RTZLVzFobGZ5aGpLK2RPbHZW?=
 =?utf-8?B?OW5JYkhuTit6MHNVelJ4a2tzYXhpVmViTmtiUDZMcVYvbWh5T0RKMjU4Yko0?=
 =?utf-8?B?VGVpeFlBai9vTWdzMkR2ZWFKS25URlFtVW56ZzZxNW9LSW5FYU9PK0xzTkcz?=
 =?utf-8?B?WjRwejBzVlFkbHlqb0pEdFc0ZTRNU1M0T3hHdTlOQUUrekEyOFpEam1Qa3FP?=
 =?utf-8?B?NFd4UVdIRkluRmh2WGFpL25MV3o5MmNRNHdzVGw4bkRwbW1jclhRRXprcDNV?=
 =?utf-8?B?YWpRWnk3ZzM1SUlKVkpJSU5LbFgrV1I5OUlHN3ZDbndSdllEL3dra3Z0cUY4?=
 =?utf-8?B?QVZhZXNyY003U3BmaVhTWGtwU3I5bGljNWhXUzg5L1o5ZjRhMGUycnR3Qk5H?=
 =?utf-8?B?aXRrR0hzOHkwbEk5dDN5Q3AyaE1HUmd4a1ErTmpxN2JSbFJtVll3R3dGdXMx?=
 =?utf-8?B?MTRBb2lhaTVoK0ZBbmlWNDNwbHFLSnZTV09KY0tVaHNRWkpoVUJOUzkyS1FC?=
 =?utf-8?B?cDBNMFRGL3ZEWUZFUFFLY0NLNWg2TkdWK3JYRlFpS0p0aXVYK0VoLzVUMS9y?=
 =?utf-8?B?ZDBhY2tsVzBEbE1Rd2d0TVB5U01xV0FzbFNVb0RadDh5Q2t2dk1nazg5R2Ur?=
 =?utf-8?B?cjdjRHVTV3p0OTRHeXZqRTh4aXlYMWpVdzFpMFBXdnlOZnBXdWdKMkVndW5v?=
 =?utf-8?B?aC9lZTlqeEg2b3NRbHF2M3hQZ25VOFNWN214MjQzMERKSVZJZGpKRnU4NlQ2?=
 =?utf-8?B?Ykt3RWpjWGZmY3BvUXdqOE9FYkFjWWtXbzM4Rk1ScE5oenVkZEhSMGJHa3Er?=
 =?utf-8?B?WmRyUTNTL0EveFFqTy85RHpzVlI5ZGFWMDRRN09BYnpiM3FwRW81bFNWRHNM?=
 =?utf-8?B?QVpWWmdRYWVrc2RCSjFqejhGZi95SkZFM3JUcGI3SEk0bDF2K0pPbTFQdlFC?=
 =?utf-8?B?N0c4WmtWYXAzRXJ6cVdBSXBLdkFHYXRtczVSUzlnSzNvRnlBQjN0Q3UwRExF?=
 =?utf-8?B?RGtJMXV0SGdUdFNSVXpXMEtTclJuUW5MSVBzRUVUUEp1N0pIakIxaHVvenNS?=
 =?utf-8?B?a3BrM2Y2amZuc2E3UHl0L3Y2eDM1WGVCNXRNYWxrUXAvdjI4cG9IWm9oc29a?=
 =?utf-8?B?WmVLL3VsWUFNLzNLSFU0b2R4cEI2SFN6RTh1bmpaSHRYcU5QcTRBTVdOVCtx?=
 =?utf-8?B?NFhETkw3NDV2ek1HSjk0UXJLcXJIV3dqeWhIUkJrckhXNkNzeG9CRHNGUHBI?=
 =?utf-8?B?eVY0VmdzNGYyOHlwUTk5TFA1Q25JN1JoNUdIejFhQW13R0xkeCtsRnRrSVo4?=
 =?utf-8?B?emt3d0xQMkdxSm5TcnVNMlZueDFlZ3c1Umw5cUpZQ2lIZmttT1J5cGFaMXk0?=
 =?utf-8?B?Y0xHS3dieTYwbHZsRnNqZTNTcDlmS1k2MUM2ZmNqVzVVZEpjdnl3MkNTSXlr?=
 =?utf-8?B?OVpsR1B5bk1HSC9EYTNKOWdSR1RVd2NCcmY2Z2txWWZMUlNOekRqQjdvT1Va?=
 =?utf-8?B?dWVIN1ZlUVJSSUduaEcwUnA4a2tjUjNRb0g2VnR6VnphNFo4T0FPUDZUb0o1?=
 =?utf-8?B?b01nSFR4bjB2WXI3NExRS2lLc0RidEdYTFhnZTVFb1hINmkveXkvTUxPSnZE?=
 =?utf-8?B?T3RUUDR2cnE4QzdSNWJPSEVzY2srbXFMZXViVkJwazgzNUsybnZQWGJQdDFX?=
 =?utf-8?B?ckxFYms1Slk2Zm1reHF0SGp4OU9jemVweVF3SWNqcDBLMkJjbGNFbm5RMXBJ?=
 =?utf-8?B?cXYyT1hyWGZlMXhablR6VG9SUG1rSnRrZW0rdUVxN3ZpdmRFU0FVOVJoaktH?=
 =?utf-8?B?K1FKbXVKT05WbXlMWnl2YUk3WGdCSGFLN0p5V0sreCswNkZoTjFUSG9aK2tD?=
 =?utf-8?B?aG43OERaZXY0L2U2WXUyM0xGdVNCeSs1bmRYWEVSTG5ndGQ4Q0hYQWVBRmdj?=
 =?utf-8?B?QUhGeWdLTnZ0T2RuMEhmTGxlYW0rWml6SHNKTjNjRUdKSTZWeUNYOEdFdTJ0?=
 =?utf-8?B?ZElqdDhKODhLQ0VkZExBV3o2cks3aWpZTFFUWFhLMG9RZVF2QXZnZHhGRTUw?=
 =?utf-8?B?cDh2VURBSzNKUVRlZXF5L3FZNTQ1ejU5aGJlQUVjRkl5ZUszSUxBaG9mcXJN?=
 =?utf-8?B?OVpNRSt2eHBhMXZEKy9vRjAxNjR3MWRHdmlxdU1YRnY0MTVYWmlmdURnQ2gw?=
 =?utf-8?B?a1g4akEvNVJ0R0NUN1J0ZzVqZWtmei80cDNEYVRhZFFMcGZQVEVVTUJUSExz?=
 =?utf-8?Q?tw86Wk4esbwttBNs=3D?=
X-Exchange-RoutingPolicyChecked: FtaiYpxTS5d0nG8X55sOyl4A8J4HaVZHW5VdBwe5G/6mpSkfHFhZ3iBlzQu88a5QqJQb0POUX3Lcziiy/4ZvBr49Yk4Lea9eKzSGzzscnTCPN0IaKAJ1cv+yVQ689LzBrbUqJLJnP3pQFVuUYXcp0h4rgCO7bBrTYxOUFRG2jJo1dzLPV8ILsj5Sbgqa7tDJQwDPX+U7zZnKG8luuJ2x1vkdYSUqK/Za9vNAD+fczUAbiWFZBaj3euZ010JLyhPZVoCsXaGpm6W1bWp1hGzR9hj+SYoW8RwD8bAMtkGj36tdkMTbjCdxpOFYtySLBl2EwYXi6VsORGLZiokkm7aYUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f09c67-b159-461b-f1fe-08dee682239c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 17:12:55.5693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drA+SRLBeiK0b5Ev9yXHUiYG+MzEYlK0lc9+uCXIoiC+W4oQjJbCiNxt1afnHCoOhnYP+J56ZV8UNz/cBm8abnsbcjFW6t4QFeDpnc18djk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8233
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



On 7/20/2026 10:05 AM, Lukasz Laguna wrote:
> When unbinding PF with VFs enabled, xe_pci_remove() calls
> xe_pci_sriov_configure(), which reaches pci_disable_sriov() and VF
> teardown. It requires pci_rescan_remove_lock to be held and triggers
> warning otherwise.
> 
> Take pci_rescan_remove_lock around xe_pci_sriov_configure() in
> xe_pci_remove() to follow PCI core locking requirement and avoid the
> warning.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

I was already trying this, see [1], but it didn't work
now I guess we are still waiting for [2] as our problem was already noticed

[1] https://patchwork.freedesktop.org/series/162346/#rev2
[2] https://lore.kernel.org/linux-pci/cover.1776839248.git.ionut.nechita@windriver.com/


> ---
>  drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 123ffd4c1ee9..f9adf62dce03 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1112,8 +1112,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
>  {
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
>  
> -	if (IS_SRIOV_PF(xe))
> +	if (IS_SRIOV_PF(xe)) {
> +		pci_lock_rescan_remove();
>  		xe_pci_sriov_configure(pdev, 0);
> +		pci_unlock_rescan_remove();
> +	}
>  
>  	if (xe_survivability_mode_is_boot_enabled(xe))
>  		return;

