Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8F9EB7EC9
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 10:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A67410E9AE;
	Wed,  4 Mar 2026 10:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP9dkjfk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9964D10E9AD
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772621988; x=1804157988;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cu1YSexGF2MerhDKJUopDwwZ/ND73Z+Cm6b6Y4AudxM=;
 b=LP9dkjfkG0mKQ8mjRrWh3F9vNd2LN3MM1B65Tke66hkO+rMYawgv3hMZ
 W95vTbrzqIihNjuONWGzkzggHpIt248jI0jvWlRjbeY+zLlKHEUaAZ+JG
 mRFDflr6AHXPMikaWpkfrFn2NrqdOHFVfUNkET/gbmvGH8o42+xIpiPXL
 pzoMyw5oH2R4adRtv67VkX0IXIWi5M+GAU607wGiUrLn13slYKmVIcX+g
 5VROctjjC4yIrs0Kg2lMb4UcI+Wpmn3OsqCd/ZB7G5hQcYi0K6YwgIMHs
 JpyDAwyD8Zipafw5iBzK1tXnJaefvSadPP64fAsGapN9RlETP7T/uV40Y Q==;
X-CSE-ConnectionGUID: LrBwUoU1R6W2YVS2NM4jKQ==
X-CSE-MsgGUID: pX3PFKbQQC+PszPawRtKTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77524227"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="77524227"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:59:48 -0800
X-CSE-ConnectionGUID: MmsimKWGS7KpjZ1mNsyU2g==
X-CSE-MsgGUID: wZBW4QclQC+gp12e9g+AEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222803189"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:59:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 02:59:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 02:59:45 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 02:59:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pK62lTe2vuii6G5+UMtZ/hAgzg8mHzPXBfV3PBXEPps7Zu6BowYtIa7XXhFtTC8ZrQE1gqRsO6vhcEue3edzcWYYOYn7CYvq6jYNOeQo3TuJzVljqPQLj8EIlPGUnmwqMIvxQrsZozOde4MIrB6T/57QyGbaQZrlicr6rNpUlSVSzkAjhvoq/2hk2H1y0sE8Kq0/s4ln+8iitLrAfs2DDVhIl569TsFeA306zJ+bR7A5f68Ezsv+SmTEIfcnVK+s9Zrfvu9KbAURLgJnFi1VenahCbsy6KvWpMPVy05z7JMdAlnB3awqY8BiKS1LhLy2O5jKkK4htvpZF+KfcdejxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wM1lYNbhAldxuQtK4gH2qwUSKR9Vkvt2Df+1V0JFUX8=;
 b=ssJhs1DUZDlX2Alogq+aY0JOzqe1GFtqzDADjEhtvMuDsIbbC43PtMtzsShmLusp2qJVKwaLuqCbvaDx54WJLlM6T3HPlYuI7B8BBurnnkzUyQlG0ens084ekvMfBbvtdlKGQ6POpvqLZg4OqJst1s0TIISBnyCyfX+4b9qLmJwqRKdFS3D/H0qBeroVT9AcetquRpZt5L19SrjqMuFQaK80pjG8GnFly0JtFPwXaXTt70Sp3cFCfsKREeTNg+TGy6Bds+41FTN2WxjKPIiV1zprzHAritW3x27PteXhjmOCdd7dviI7A4MZH2/hAoR3Bqje6kFS8eCP9f8HAHD5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by MW3PR11MB4521.namprd11.prod.outlook.com (2603:10b6:303:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 10:59:38 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 10:59:38 +0000
Message-ID: <32b0bdbd-e9bb-476f-af1c-7843be3099b0@intel.com>
Date: Wed, 4 Mar 2026 16:29:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] drm/xe: Skip device access during PCI error
 recovery
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20260302102155.4074630-13-riana.tauro@intel.com>
 <20260302102155.4074630-18-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260302102155.4074630-18-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|MW3PR11MB4521:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d732c7-7c32-4833-0330-08de79dd20ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: vl6aDVjTba5WaV5eOba8ZhQfElI2dZC8FYELpZHzrVRQEuGpNRXmfLNCDk94cPU+3/Lwb+WsVrs7y3cAEL/bHXwhOf4/Jxvf9Pjn0MuZtf61zufvAkeUwqh+owvVXW3q1CCzwW6w6EtIGoDRz+O7EXq1ZO8pIPnWhkR0Qk6Dkduc3Ka6/SwbXaVMlQIIhWEEh2LntX4zidJOVtvyZHAGBFpxRNa3ovL60EFO+rtqMIol+WUUihmRJxbtzJQO+Hm771jJAS3LrJL9Oj9G7wHPaitBH0dhOYkfSGA3RmUP2GlaYGvXAKbWX/kzedSI80DzbP2ET+rcyFtu8tvLk4chlcFB3RF4FxidlimI1hHiFJWfpBj8j5QKn1dGe+aNGxlwuo2aHqHFdQaQThmK8gVkDwNkcHo5VEpHw3Cpyylu0bttEMMaucmQWkI4veDd4R8emjE+adWS4k9u19PNex+eGtN2uHRXqZAEmE8rC+NWhIhsY1hbnpJp5aIOXOude6qqa7FisyL01iL8cWs3idh6jGd4StkdCKmEupzqSRjhiNZmq86MVVtNzAPxW5WZJuBjHit6bzvwx90IEByWT9tGh/WYd/T6piD3dVUyoMis1h8HrRwcEOK6hsXc2Yz7Mr6w5ZCQtd8Ya5bOpZe2HgSWIZD44WW3yVES4CeNZ4xfvxohXENXqKLfBpGg16gE0I8krehrNnHbyjpAYtMgoYy06xu1xLdiFxjVEGAQUY3bxUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1M4c2FyaWw4cVZJSTR0ZVRUdFJxWEhBNS9LK2dUSHRTai9nVWhrTXhOdmNH?=
 =?utf-8?B?dWxSY3QxQlYrbUFuaWM3U2VvV2tKZ1llRzV6TURSNDdMeG12U1h0YUE0S2Jn?=
 =?utf-8?B?K1VicEEwOWNuRmwwdHJtT2tWLzdaN1JzYkxIYkx6Tk5EVHpKdFRxY3pnSjNT?=
 =?utf-8?B?bzdwT2Z0em5BdExqNE1KZEZNZVd0WkNEcG5iSmtrdzJxQWFDU3M4dWhkTlla?=
 =?utf-8?B?SEpneXlwSTdPWFQyY3VPRDhwdTlqVFZMUTluTi9rRWRtbmp6UFJYYzFzWnp1?=
 =?utf-8?B?SE9PeG1oZ2lrY1ZhUWdUdFpKUFZJVmkyZVh4QkY0UEFsTkx0S3hRQTgvUlIw?=
 =?utf-8?B?ditlVFIyMzdseFBacEczUGQ0djFrSDB4SEMzTFhqNE91M0lGWGZUNVhwUDFv?=
 =?utf-8?B?K2xjTnZpOGVWTk1scmFoMEVHaTFOckxqZVFSVzlqNElnZGJGMkhMWGhzYWN4?=
 =?utf-8?B?dm0rd25STUxYUmt6Y2xPYW5RRHpUVjV6RVRTd2FJMXdGUExwaTV3b1hTbnhT?=
 =?utf-8?B?S1ZCTUJGbEZod2FRcUY1YWs1TUx5QlFRUnpmdmYyeWNoVENUVjZsSEhCelI2?=
 =?utf-8?B?aTF2ditML0FjbmJ5ZDY3UWlPRTM2ZkE2Um9hUFlkVTRURHhZNDJ5RlVKb2Qw?=
 =?utf-8?B?em9JNjNvYm1DVS9IR1c5bFBnbUwrQWhOVEFZeFRlSUtFK0hlTUtuaWhyOXdz?=
 =?utf-8?B?VXJybFVnbnJ0NEkzTlhSZFAzajZHZm5DT1I0VHh3bTdMN01WUXE4NUNoV0o1?=
 =?utf-8?B?OCtKZk5ZTVJkSlZVakgzcmFiU3YxOGZhTmVKNkU4N01qaHdmeW5QWllKVmNI?=
 =?utf-8?B?eHlWZ0lxaTJVd0VuTzZqWmZOQnI1cWZYZVJZcnNEZGpwOVlSeTlBaEhraUZl?=
 =?utf-8?B?UHBQWnhBVmxqSUxFUjRHdHZ2L1JFZnMwQVpINVlEdXZlMnpxV3JuT3MxaWUw?=
 =?utf-8?B?T3ZxWERKemZQM0E2OEliajQwVmJINUUwdUtCQ2lnWmFnS00yWWkrYXpTRnUy?=
 =?utf-8?B?d1BJNFZZUkRGUzNFTkY2OVA2SHBXbFgwVkVIQnc2MTIxL1ZtWUlVYjZPTUNJ?=
 =?utf-8?B?dTNVUjJiNGFSc1lVODkvTTJmSHpOcDBCT2o4Tk1tT0J0NENzdVc3c0FiTnpY?=
 =?utf-8?B?RUZabDQxNHdXRGp6M2FDOFV4akZRK3RVY0lneDQzbml6OG5IRFhEUmRzUXBO?=
 =?utf-8?B?cDlzOFRXYmlvSUs4bDNMeDdiYU9ta3BMMWlVRlpVTXFvdkxoSDlNaGFqS1dQ?=
 =?utf-8?B?cVE0MGNHOG5QbGtGd04zcnhMcm5xdGVmQ2J6ZDExVm8rV09DNmkrQ0ltb2t3?=
 =?utf-8?B?aEdoZmRYenlPODlTR2lIcTZYWUNYUHBhUzg0TVZxMnN1VkIyWDBSYXpOU3Nx?=
 =?utf-8?B?b092RG5EL2F4VjRrWW82ZGVkWDdzUURWRVdRK1dMVjE5Y1lPMzRtOTR0aXZS?=
 =?utf-8?B?Uko0YVcybDZ5ZGQ0MHM0cDBJUlhJZWdxeVBZZit5QjBWc0U3WktsZUFmY2tG?=
 =?utf-8?B?ZnVqQmFwTE05R2pLcUFiWWpkTFRQd2ZqWEFNMjlmalo3UlZlcWNpRENXaXFs?=
 =?utf-8?B?R0orY0k4WDJsVHlBM1c1KzQ3K3ZlaFBlZGN0NXpneG9rMHF1bDU4R2htaUZV?=
 =?utf-8?B?cUV3NGlyRndoR2Ywb0xRVDhtbGNJaVNCVnJXSmhKUmVmT0cydENNYm9Pa0dE?=
 =?utf-8?B?ZGFXb3FmNVJEUVNESlNOeGxZSHJVODBLR1RUbDh2UEduUmk0MWswT3grVTNi?=
 =?utf-8?B?UlQ3ZlZwNVMvNmZjaCtSZWFkY1lWYWxNaWRhb3RTR253RnMxTFl2WGxZZlF4?=
 =?utf-8?B?ZHpHcXBiUXM5MHpKbUo5MUJWeVlMckdLS1NnRnhaSXhsb01naWtNSmlNNXlB?=
 =?utf-8?B?dXQ2ZjlkUFlhZVRHOFVvVEdoVitua1JpODNDcnpBSW5YRW13UFdpQWFTemoy?=
 =?utf-8?B?blU5ZWZTemZ5Z0NZVGFsSDE4UUJBbko5eXJRTXRSeFZrSkdRU3dXdjhYZVlW?=
 =?utf-8?B?TE12N1BGQjQ3V3M1Nm1tZERiZmhFcTAyRGN3cVp1a25TS2JTRCtJQTR0L2hD?=
 =?utf-8?B?Tm55cmwrK0ZzZ2RMYUFLb3hSRDBnZDQ4TDgvbm82UUJyN0psV1pJOUtIcE9V?=
 =?utf-8?B?R2FLVEw5cU1VOVM0VnlzQXhFRis0cmtXemNGdGdTa3lGd3RLcTVyU015Skdm?=
 =?utf-8?B?NU5TWlJ1MlhhRVZ0d3JBeHJPZW05a3lqL0tWbGU0cnVaWU9CVXFyL0xON3pn?=
 =?utf-8?B?MUs3aGZCYXE1bjI5TjNhanlaczNBMjJuMEFqeU0reDcrNnpCM3JVYUxzWFhZ?=
 =?utf-8?B?Yy9iTGlFZkltZTZLVWhMN2ZqQVB2bFVjMGtMQ0I1dGJlc2prRzQwM1dsSDRW?=
 =?utf-8?Q?MVjHASUuzw5BAWXo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d732c7-7c32-4833-0330-08de79dd20ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 10:59:38.1454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlcdIyM4X459F73NrSGPiHwxLS6BauwDXcrjPE5Xegh3Bs8iVVX1N8Oo8XMhWB3dFwvOgzx110AJFFC2vLd8l7SEtVUmRXDKvQJL+Y0UY9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4521
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


On 02-03-2026 03:52 pm, Riana Tauro wrote:
> When a fatal error occurs and the error_detected callback is
> invoked the device is inaccessible. The error_detected callback
> wedges the device causing the jobs to timeout.
>
> The timedout handler acquires forcewake to dump devcoredump and
> triggers a GT reset. Since the device is inacessible this causes
> errors. Skip all mmio accesses and gt reset when the device
> is in recovery.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c         | 11 ++++++++---
>   drivers/gpu/drm/xe/xe_guc_submit.c |  9 +++++----
>   2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index b455af1e6072..6f41090063bf 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -933,18 +933,23 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   void xe_gt_reset_async(struct xe_gt *gt)
>   {
> -	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (xe_device_is_in_recovery(xe))
> +		return;

Need to check in_recovery flag in the gt_reset_worker() as well to skip 
GT reset when device in PCI recovery.

Thanks

-/Mallesh

>   	/* Don't do a reset while one is already in flight */
>   	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
> +	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
> +
>   	xe_gt_info(gt, "reset queued\n");
>   
>   	/* Pair with put in gt_reset_worker() if work is enqueued */
> -	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> +	xe_pm_runtime_get_noresume(xe);
>   	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
> -		xe_pm_runtime_put(gt_to_xe(gt));
> +		xe_pm_runtime_put(xe);
>   }
>   
>   void xe_gt_suspend_prepare(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index ca7aa4f358d0..c25658f1e44b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1508,7 +1508,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	 * If devcoredump not captured and GuC capture for the job is not ready
>   	 * do manual capture first and decide later if we need to use it
>   	 */
> -	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> +	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
>   	    !xe_guc_capture_get_matching_and_lock(q)) {
>   		/* take force wake before engine register manual capture */
>   		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> @@ -1530,8 +1530,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	set_exec_queue_banned(q);
>   
>   	/* Kick job / queue off hardware */
> -	if (!wedged && (exec_queue_enabled(primary) ||
> -			exec_queue_pending_disable(primary))) {
> +	if (!xe_device_is_in_recovery(xe) && !wedged &&
> +	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>   		int ret;
>   
>   		if (exec_queue_reset(primary))
> @@ -1599,7 +1599,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   
>   	trace_xe_sched_job_timedout(job);
>   
> -	if (!exec_queue_killed(q))
> +	/* Do not access device if in recovery */
> +	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q))
>   		xe_devcoredump(q, job,
>   			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
