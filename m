Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDF6C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 17:25:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674F910E32D;
	Wed,  9 Jul 2025 17:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l99nJNqT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF6110E32D
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752081899; x=1783617899;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/fR36xgEvi+zqU87/l3Typ02SUO/dd0ocSxj7FPSuCM=;
 b=l99nJNqT+iJPFa+GiF2FA0vTr/EorYrit6Fa0wdczFRMPVHrELPbXV/+
 G3Tt02+9eyhU0J40njVP4VDMMs8uK2pm7g+JSqObt39GaCBlM2fw8KOeA
 WidmFQw2Y8b+pjVwdcgpK4Qpwvesvy+ijRtXsioNwD28ZxUX9ziKTKaSP
 KUPL22Hc0sl9CRKJd/e62iYdX8jGGE1p6S8IWip9e3pzAL7k8oyQRQ8+W
 m+AkvZOS2mcdKPxLIWZw4uUHuTBltHQGNBQwjt2R/ye8sdpndDPiJCHLq
 BP95P4JEfDrUvWr/ZrCv5DluSd9eYGxa67czCWD1SRpa6LH9zRpUUdG91 A==;
X-CSE-ConnectionGUID: pEZDlDaeSoanfwO7e+Mpag==
X-CSE-MsgGUID: i9+P79CMT8qdbLKG0+9zPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65701698"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="65701698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:24:59 -0700
X-CSE-ConnectionGUID: WpXrhSGLQUeda8Hqj0fnXw==
X-CSE-MsgGUID: l43DUwdRTAaebhMCw/PqFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155475436"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:24:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 10:24:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 10:24:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.82)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 10:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBtK8KUbnypD2ePo4ICGYbwuzbKJTuXRXC3gW8LXv79F9xrXJjW6qx0/CoIEKN/gb9MN2DmWQVR4OJtpYAkGsPtWO4nfrQffxMTJoGJFV5Xzqjjb3nqRep0g1d50HAEVYTMKfkE3TeDA/3lLR/+Yy4Y4Ybj3cUSJw62POL/wn305OrACAzR+Xn/fKDdy0SJV8q/21GkuCq1uNeWMkKMLwaNPp9BSv1McyF3xLnGR0gZlLzkB/PP5fdgD1o1Gd0lX4ikyRd3+u8iKCkk96rUabwF0whatwChhbCLrPPdaJHWRgyakO29t8CgK0TCgfyIDuZRC407P4cJo09qAp2vh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTdrviwSqU0vobOTJq+wzZTwgky8BtFH0rA3P1uDMV8=;
 b=Qz/1BDlaR5uiij8eTpGEbAJTTyVO2Cw9EnwBGXZfLOhYaD17vE9LMPLqWzuYKCQfuYzuumtTyy4aWWI4rrXcgKt5rvuNfV7SMBlfrHe1ybO9vaPsqPcJLRhdoEQ4quYKqTOmJB7Z6a7vH9DCfyXnU5mikGZllGYTN1U/lW9en6q896Rya76qjypLKYfRWRLGypw7XllgA/0sdlV++D+9PCiIG7Um8qnPEcRpVueRXEgSGIVmSLFTkhbKzB2qSHzFSgQaaFKlr+0c5GoAAHvKL8hlIXd2y9A0zlEM/da9yv4IsZCqTziZhq5eys0gNxKUOweM6yrLu2Xsvuo0Pq6ekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 17:24:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 17:24:56 +0000
Date: Wed, 9 Jul 2025 10:26:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <lucas.demarchi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <frank.scarbrough@intel.com>,
 <sk.anirban@intel.com>
Subject: Re: [PATCH v4 2/9] drm/xe: Set GT as wedged before sending wedged
 uevent
Message-ID: <aG6mT3K9tEUAx3Aq@lstrano-desk.jf.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250709112024.1053710-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: d443b8cb-9c1f-4472-5f63-08ddbf0d85e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?K5/+s0h6E1yn4oqjs6OCoeFXw7w7RHlQ/RZzmRkgjAvgDZtmWidJ0Tu40/Jy?=
 =?us-ascii?Q?Z7O2g/rLH0VitwCaqSNRppQxKp9Kw4ID4fzOTVEX8LAp3GNXGpUrmUvYM6i0?=
 =?us-ascii?Q?lCa/O+ZlXf22cjZA/yhQ5Y9dIuSTx7WY6Sgk7wRo7LUrUXpZk1rJuJHVWe/d?=
 =?us-ascii?Q?Dlp57BJF3QT4t08cnCeDYwbgWkxqcufqfikr+R81hxfjME7Vb7AeiEcP9Kon?=
 =?us-ascii?Q?mQ5lmgl69X0Z9WhvVbUpcqoDsRvrR2n5Ye/RELp9EampMNAU4AcZ+uSpky8Q?=
 =?us-ascii?Q?DVk4dP+MLwpjJcs+0Byhdf6sDtfK32/v908fqattlXRn8x01jGrtEHawJA0v?=
 =?us-ascii?Q?rl99hSRxtYVDScpFsUO6ZLYpE8UZHjBcAFmhd0aNSzM0bq0Cal0PB/N03CRh?=
 =?us-ascii?Q?FiJLGbW9fwIWNhN0+PJCEbZ25zZaCDCkJniw/3OfXK2Ock4tkADNTQxe0qd6?=
 =?us-ascii?Q?I8ozfctN7l99YaRDmHQK9ui809h0VJs13znLpT56sQVmMoGrwQ52RzKnvwxg?=
 =?us-ascii?Q?Y8Wy0r8SsRyP0iIQzH9l+KjxWgVS2SPN6/ZNddig4cM7BwdCGoLuOdLIPxOd?=
 =?us-ascii?Q?UH8a17l40RLk5gLDuXaSDsKPMBc4XlnU+3W7WEkaJgWgwg2NKmRZfUTVgF1w?=
 =?us-ascii?Q?HmuRn37TRwRb0oa11AyAbEPRaKj9et6Ts8CPqv/oDTz05OhTcEsMo1slpSLX?=
 =?us-ascii?Q?Jg8v7n4DowZWS6Ql9N9VD+Im+6K/MwFnkIoRVYoRGUrgP5bd/Iq0FnXx4iHs?=
 =?us-ascii?Q?Xf01jslrZyeIfBWiO1jz5BCGZBGxTTS46AllAC0PYxeXq1ePMk5uneWRpEBB?=
 =?us-ascii?Q?8d46Vkvu4ekyKyg9+vqdceagspjG5yk99ESeY7LttYJ/lYb4lpaUA78oG5mj?=
 =?us-ascii?Q?q3+3xizvVLRzO7L242FlIw6PXs2yX6163H+xqx+IemUO1cafJm3tuaSeDaNH?=
 =?us-ascii?Q?AEn4N8hWz4infGWYztHoeWMHop81BI4XUEto/hWOCQbdI9idtFA6Jx1TboyF?=
 =?us-ascii?Q?DUGZFzUKu53PTG4mCQzSTsgOEQnh8ccK5JWvVNhrvOXUJFoMczKEDM7EB7tK?=
 =?us-ascii?Q?2Z80WtCtkCad5ZhLoNEQ0SnqjoZwQ6Pkfkt/d+vXPUe13QEpVYvyuV9u0nbe?=
 =?us-ascii?Q?zY1uAGYfYAN/W+iBDMylbdLbc+3r0jmifotHdTHR15ouUDhABo1fgqB6VgOC?=
 =?us-ascii?Q?94qBkOB9JkJ81o9HepAlqPb8CkjKYQfxJeuKrD03ON8GTZIbtfL0quLKKugV?=
 =?us-ascii?Q?/p8GpMBO4vw4WYReAbBK1jQXIspQXvpWQ/OYCG+LAVIUZlB8/KcaDSAeXLCA?=
 =?us-ascii?Q?LUemHA0oTFoelEoiZwYBFS8nufH92Pbyw+Poc87kG0aURdHz8Rf0xnKXKAdL?=
 =?us-ascii?Q?4hfKwo4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kv9JmuHxKW0DpSCuUnvMr6GAL8Lm9CIft/jxguj8BMyryGjoCxu5F+a0dlka?=
 =?us-ascii?Q?yt6Hf5tk3Iwl4F0Isauunpd5MVp4Wy/zANMFUx54nvG9MHNz7k4IzuI4idVo?=
 =?us-ascii?Q?tgpPU2CFh8mfng2wm6JJ2/emN59iY/vTJe4w9zieJEYFTppOec89Sw8Tr1VQ?=
 =?us-ascii?Q?bsFUwkLv45dKag3/IqdYY2PMx35qPjlDrxVDP5gCXLPql6cs1Bxodn+YQyZs?=
 =?us-ascii?Q?Ue3pF3aYhaR/3oCbN7QnFRUbKdx23mvHgD1uQ0vfr6cl9pf8g2s223UDwp8y?=
 =?us-ascii?Q?5C6yxIhaDmpwQQOlnOM0KtmFJMIVBGPMF3Maqp4XLPGCq2k85bOBxuPczZNL?=
 =?us-ascii?Q?EJZVcVy1eYW0WlJ0Ecefx+rP26imOci1YpWJzHI90wGN6hs4WobSRi3mNB7y?=
 =?us-ascii?Q?Yu6yvgoa8BoGk9hnF3wBeJRYuxj7er5Zuu8oLJgZ8UB2mdZYdBoNrLT2/7j+?=
 =?us-ascii?Q?lCNvqFFAPnsJbVmRMFBTCiPIXZV6jBbHivSj4w94SUh7epFC/DLkbyrW4dsR?=
 =?us-ascii?Q?LgJxfZgzKS2dwalVy/w8zqKsD2TCoBqPxAcu+1lazGqHtJX7sepGQwXIVbJT?=
 =?us-ascii?Q?noCIxrzGbadxo/RqD9tHkH1PgvavzJYjgwAcOhkdacm+eE6AEjMG2mG1ACf0?=
 =?us-ascii?Q?wah/OatT0WC1Yp0vT946aNzqQHU/Glhbc9OL09KJceQjNkUx0vmWnNVXaNlY?=
 =?us-ascii?Q?ZwLbZzNRlz+uSbk+/J2M1355f/FZ0SE1DVmPTpLrULM5tUXm9Kn/UbYIjVlN?=
 =?us-ascii?Q?tM9pXv2PST2zTpxGd1E8IQJs0J6C/C33CohUV24DqgFxkNcOTfuozfqQZyAQ?=
 =?us-ascii?Q?olMsLcE6ZjfvxBNJv9+utT5AuRZFNU7hp+oD7gAcla4Tw7pKCDT9t4o2V6je?=
 =?us-ascii?Q?TdOvyd/e5+c49Yln7UMfJ0HLFHFZq+wOosrroklPJ0c36Qcd1iPaxIJQKTci?=
 =?us-ascii?Q?0O9IzmjtCA/rauF0D4Rlw6g9apj94Ub1nyAueFveLA4/9gSpyRasxHXb05pI?=
 =?us-ascii?Q?RRvMPKkvrSQa/HBsP0oBzGgIHbcTZVAU9BnL4pA4ElkOk2Vo4b+DIJefyU5G?=
 =?us-ascii?Q?HmtztZ9lFCl+XAeg+i+/IQbV3ijuoBKglrR8M4sqS+hggWqJJSkbEDHJMz+8?=
 =?us-ascii?Q?8aPX9PgfW47buFackrZHF/OHj2ydAIoJAYDbe/DMTjQ3VYHitCDWOwKjXg5N?=
 =?us-ascii?Q?MzEwRQjJ+cnoVl7ohs0NFw/7gCopKKMJN7qoadSzzJtNB59d6/RKl2f1J69i?=
 =?us-ascii?Q?3JHsnQwUaiiLenGpOBcYPpIc8ErGe1GP5vx3urwkiXqV57ZI18Jik4jNRwfk?=
 =?us-ascii?Q?sm6g4MwngrrkaVbnyeqkE54GZP/HYTYZEgmBP0nKSYMU9WjPejyysn0GV4uU?=
 =?us-ascii?Q?E0NGa1VNs292gvMoGKJTX/5MuADcL3f4L/FruIeCMkprHoIGKVgnuTOKpO9D?=
 =?us-ascii?Q?xvAIZruUHEffYqF1u27aRgczMXneoyPBhHpvaRxdGtx9ogFgXaWg/NMcrjL0?=
 =?us-ascii?Q?gl6k8lWUUTSqRGAdYzvtlCFMIvZuxJDbPHE+ZO6FP5FVwnL5TvfJXoPGXs61?=
 =?us-ascii?Q?UaRIECVqsnkr1++bD8XE03LrpbHh2Dcc1V3nR0vxlhxdA5jDwQc7NRgyV9Oo?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d443b8cb-9c1f-4472-5f63-08ddbf0d85e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 17:24:55.9968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URDAW+IPuMQA8dmXANZdoaSeBc4zBDnXUfG84eoHHTp9R//leIEpAjqKt8+YfDPCOoGgqIxndTfedz1TGTJqwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
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

On Wed, Jul 09, 2025 at 04:50:14PM +0530, Riana Tauro wrote:
> Userspace should be notified after setting the device as wedged.
> Re-order function calls to set gt wedged before sending uevent.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Suggested-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0b73cb72bad1..8a5bb7b6d09b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1123,8 +1123,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
>   *
> - * This is a final state that can only be cleared with a module
> + * This is a final state that can only be cleared with the recovery method
> + * specified in the drm wedged uevent. The default recovery method is
>   * re-probe (unbind + bind).
> + *
>   * In this state every IOCTL will be blocked so the GT cannot be used.
>   * In general it will be called upon any critical error such as gt reset
>   * failure or guc loading failure. Userspace will be notified of this state
> @@ -1158,13 +1160,15 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>  			dev_name(xe->drm.dev));
> +	}
> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
>  
> +	if (xe_device_wedged(xe)) {
>  		/* Notify userspace of wedged device */
>  		drm_dev_wedged_event(&xe->drm,
>  				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
>  				     NULL);
>  	}
> -
> -	for_each_gt(gt, xe, id)
> -		xe_gt_declare_wedged(gt);
>  }
> -- 
> 2.47.1
> 
