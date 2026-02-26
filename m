Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CDCFD45F9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 01:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 409A410E062;
	Thu, 26 Feb 2026 01:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KS6T2fz0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D57510E062
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 01:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772070578; x=1803606578;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i9ymW9msyPGrhy+dhC+u1gicL0FZtGdWwbPa8FvZ3nE=;
 b=KS6T2fz0QTh51UzxmzhtguyEsxpTgVzKm44uOD4Ng9M9TMWIn2lN8Sja
 rM8sdOsPrQK1S8TzMPE3F0XuKfeATIz0X4i5VIU7qFqcwKALEgWN+mApv
 UrLBT5KgmaFk5nqHdXGOTLP+GoQ92IyYgt10VZVtV7wHYhkVAlcjFrgsu
 VnrFTANMYKreOKJ/iDSp8zdXmoyCG3oTWw3FMVOayD2JAx2O6YGQFmfvk
 3uimqLg1yUXYe8Vl2NikAcqe2q8CP5YrdN+59r+4yVTjcMxsDg0L8TFb+
 1/sxJFvHF1zOMkP4LPCc2wzGZ2PqOYcQDEHPu4WVpmm8yjrjpaQU9xdBR g==;
X-CSE-ConnectionGUID: CA5rICqfSpyA6KhVxIPGEA==
X-CSE-MsgGUID: bwRfwIAhS9CW1kjG7GXFLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73193463"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="73193463"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 17:49:37 -0800
X-CSE-ConnectionGUID: x3ytBfvARLCCIq739A6wAA==
X-CSE-MsgGUID: zTEGhLflRS6h7AE0Sme4MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="221390714"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 17:49:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 17:49:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 17:49:36 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 17:49:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjvRPhskapcHBDBG+Y58nJ/GbxF05RDtP/BD2Vt7i/wJcpYnnMDhXYRSDIso+rTZ5ZgsFr9jAnE7anjwXJho0VmlCZy/DU1x5Qll6eqv8XMP6cDCoSWcqtJC0ZIamxbq+JHkwiL6cJBN6YXAeDzGQqdapiEyS3lK5wknNg4uBZ4aFOJORg7ca5+e6KWdkgcQEAijqT4N+AG/ZOWKIwgpm6SfqqkxSoTO6PnWsm/Zt0FGRH2iiIrgf53lvqsEEBLdGJ+nQtNHMx8IaPZJoXzbuLzOFUHTJwDO0IS0jAn8VUtT9qtBYVzG8QBQzAXfSdc3X+aMyI7wlHL+WfG0z9gdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMegidccnh0DtDRNMZlhcQfib+d1I80gOdzW7l3v6X8=;
 b=qvx65pPhYI1v4gMkNEITBFndi0M2aPLP+82Ey3AkNFNuTjCs4/itPsF+tG5diR2DNGnMFUoAroIqh3tP1jKRFfgMgCpdx6Q/+WMLxy4JHKjIEV45msOy9tvD3bBig1ugClWe6n4CHT8UhykUNax0z7dzZaShYOEWS/N42V4lzviJn8zWM8NBg98uDAD1/bV3jSAthYkc2gfcJr8txsf1XtfmXKpXShlRy6OoshX3/IBELTncBq6PgjJqmR6AcH9L02sRoJWLke8eInpFfbS8HMwY1xBO7T97PcEpvz9AkXcMQPEUTAGX7NmnEpGkbqr8NjIP8rdkbkgz05TO3L1/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7664.namprd11.prod.outlook.com (2603:10b6:510:26a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 01:49:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 01:49:34 +0000
Date: Wed, 25 Feb 2026 17:49:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe/vf: Redo LRC creation while in VF fixups
Message-ID: <aZ+mq7//0vNGe03S@lstrano-desk.jf.intel.com>
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
 <20260225235447.2772383-5-tomasz.lis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260225235447.2772383-5-tomasz.lis@intel.com>
X-ClientProxiedBy: MW4PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:303:16d::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d615fc-f481-4bdf-676a-08de74d94a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: FwHE1SukFuxU2xCiMuQNo2alXhWOPEieG3p9HiWGMd7Vpzk30W5RSIDPKKQglbpK9N2ekscPgYge3DEGluhmIIaHNi9IWVmtZTzMhXl/icxndvpH7mhrd3mcmOZF9fbQNus3+XLIOvikUoKv8j0mJGqBM7SS30usBXozx2pJEJUYIAd9dZZWVZOYI+2mCE+14yCha1b12YCuOOvmhzDf0tZslEwubSh6CcA21s1pj/hnOuPVrO9y/pbrKkV+1kIPUbN7u6zyNbpH7XKw1wfJ8x7Ktd43cdwmgKNbVU1e5Y80FaBqWfL51j5QbGlWIdMmVeLFR7DZxyBGQyR+DEiXsqHjKZnBK0uJ72rhheNSFjUPAUG5tmc5pa+/wXWrDM2GFNVFQw0VYmYGgM7Og7Y3dDna/Z9g+ZTYzNL7A6nf8SIcMf0lrWLFRNxuROWI74coMD3URQl9xADOgT85PNeb1OA8+llGDf7taoHbjh+1OyELdJoe8SlATGUZeb0vWs7SYOHDBotwLp5VyQv5SAQs1MQU5eFUhBk1O2ywYK1RqL+QSCB2jAJH3VSXGxAaJiV7Kh++nkJZsmBuYYDSkeIrKEDl04+6RKmLSpi5xHRVRsKKEefSW4x8EbzVtfqAHDzZuRlgCtqeY4HNrGZyi6y4HzHewpi3Xo6DFeTDII8aCp54F/N4xSO+ggbDbOs20x8hz6Vbl7Gn8xs1mSIolhh3gHKq9hikdhTQ0WRqkXuwa1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sc69tFyDR9WdaxyFJpcQkWbh1pBEHieIN9yJUsI4ACN/KioDz58yusfvOq7n?=
 =?us-ascii?Q?blT+JUyCkCMnmnUjKSOwpM7cxS+SHLj8defN67Hi50Rh9T9V4Q5Ig6xXvDBh?=
 =?us-ascii?Q?p0STsrfG+RG9HUPAZkmKsQV0fAUI/brBogapFKNy3diNdLu5lDaZMEdajh60?=
 =?us-ascii?Q?osBLdGJmbBerxqSYe1VnLychwqCiDRiZMg/G5/kHYWFMd9WtVLNCLlMfw3v4?=
 =?us-ascii?Q?g3WFQBWlHgqwW4XI3TxGofQXisr8KmAQsoBgHs6mjAezHKIV3D3KwjxTZhpY?=
 =?us-ascii?Q?Esyi+j8erBCfygSexZZbgtYNgjC2BeoqKDgxaMDbACaBEnekp8kFHlzxL32q?=
 =?us-ascii?Q?bm+lwHYXJVqt4RzX1PlW1ET9nvqywcMAMpkBHAKFlb5icgFeD5G8y/0y80Is?=
 =?us-ascii?Q?bD/6U35aBtAIPIBGqpIvvoj2TdxQYubyzcKWKvmI1xrJKkaVGym//z1CXRSZ?=
 =?us-ascii?Q?k4AJLyls0NA6Srd6lV1koLdeN4r8jQKyisGHEZj3tI/wISYz0Q6xIoQUzwIj?=
 =?us-ascii?Q?AaJJ9ZsyCYM4poVltdO/6nzrJNhqjEdrwP+0JqqsVHkQx+fYRpYBUCVgGEB8?=
 =?us-ascii?Q?1JGcfm9ZVCEyRD3WexRPuUktahvgguUyrjw0A+7IB4VjVmt/eKXh9ssMUDwM?=
 =?us-ascii?Q?GywxD8CH1smJDbNQiJZkVAIg0Z0Z366RWqle73x4qCDi2znBsfG2pnfM7RZj?=
 =?us-ascii?Q?4rxYHf/cw8boI4Qx7kl7NQxQokcbQPfFfJ3YyR0rGbM03lmV21OGKWkWpXsy?=
 =?us-ascii?Q?ofmqxfc8l3nM1SO3zRpbGp3VkVaaDiMIu0hkFP7Eokdsgbp0qG9bdTKr0XTt?=
 =?us-ascii?Q?O9YvHxeLdot+mmZPYzo+LNWludTaSakh98uKVElqOH9Kne8nyLsi5O/+UCZF?=
 =?us-ascii?Q?SQ7OhHR05Kw+4Zpqw0DP2NCt28+PtFzFvfFHVNb1dUyWLpDPUTbocXR+4NPc?=
 =?us-ascii?Q?5NWgMeAakQe76Tw+3IL6cu4lk7f/kwbHM14bYaqiUBUFj6uKlY31RlyJXq4K?=
 =?us-ascii?Q?T7Q9M1ICA2x9n1k5FKd7MxI8cBcfXekZKPpuL9eNYOJnPj/AKfqr+7QXE6NU?=
 =?us-ascii?Q?dQjwkdl5GCnLAFTbxbXaXMJa/JSwm/ltqLgYXiUkofTalgT/HMOGVl9UTmPl?=
 =?us-ascii?Q?gb8xAVfYTk0Q2eQlurwbH08P7lxDa7QK8I8Fo9G5iQ51UDYlF/JOTzH9E6T5?=
 =?us-ascii?Q?SroSzj62hMCF7XKcaPVzv5W3Kuc0z4I1cWADZMhldS15A1znB78l8Z2uaK1E?=
 =?us-ascii?Q?7F71i7aaxCpk45dpjwq6cpcvH8/LVOuPr4wevPTNZyRRieIVatWcTgjb0dIP?=
 =?us-ascii?Q?+Dd5qJ40Ptq5HBpRbkw/5JhGWP9ccFZ9PmuuWD4qYh/dnDNC+JALeyTSbeqM?=
 =?us-ascii?Q?aegxE5IqXfvx+aSH1pzyIOKp173S3NZYR0DEboc1rY5S+Dwifm1QtAAOaWBD?=
 =?us-ascii?Q?1GBYJ2/hvPjSMyZkJXyVu8ivM1KG4Qn3vfXHipZ6Ry5WabsK+eLZF8OUDJ7e?=
 =?us-ascii?Q?MqyUeiPBFEvUURbw+hkGYSS9BcFHppH8ZUY+rH3rSDI+OMaVdHjwdfiiyWx9?=
 =?us-ascii?Q?ut1r7+nzlI1385LYAIr1lvRfjoSFKDttjqO91d/u++CKnJVuhTcTWz7l8tXh?=
 =?us-ascii?Q?6JpvRkVWU6kumTYkjBjQDSxQtgulLFQ3AeQSUUkiWG3odwjrgwJRxR9hGlw3?=
 =?us-ascii?Q?52gHGYDcuO9jtVkyds04o/vSnraZ1mBB41qaGV8s8MUowfDuRnGrXNwP9GF0?=
 =?us-ascii?Q?tr/A8I0Bi/HsSr5qkKM9Bum8kGSBbu8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d615fc-f481-4bdf-676a-08de74d94a84
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 01:49:34.1889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNZbQDrniohNJkybvpdSSn02MMI1E/o8+SzNcUbo5x8G1Jz6Iih/1ctHQZtfKtQTlFQULmzC3QQRrX27AbCNyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7664
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

On Thu, Feb 26, 2026 at 12:54:47AM +0100, Tomasz Lis wrote:
> If the xe module within a VM was creating a new LRC during save/
> restore, this LRC will be invalid. The fixups procedure may not
> be able to reach it, as there will be a race to add the new LRC
> reference to an exec queue.
> 
> Even if the new LRC which was being created during VM migration is
> added to EQ in time for fixups, said LRC may still remain damaged.
> In a small percentage of specially crafted test cases, the resulting
> LRC was still damaged and caused GPU hang.
> 
> Any LRC which could be created in such a situation, have to be
> re-created.
> 
> Due to VM having arbitrarily set amount of CPU cores, it is possible
> to limit the amount to 1. In such case, there is a possibility that
> kernel will switch CPU contexts in a way which allows to miss
> VF migration recovery running in parallel (by simply not switching
> to the LRC creation thread during recovery). Therefore checking
> if the migration is in progress just after LRC creation, is not
> enough to ensure detection.
> 
> Free the incorrectly created LRC, and trigger a re-run of the
> creation, but only after waiting for default LRC to get fixups.
> Use additional atomic value increased after fixups, to ensure any VF
> migration that avoided detection by just checking for recovery in
> progress, will be caught.
> 
> v2: Merge marker and wait for default LRC, reducing amount of calls
>   within xe_init_eq(). Alter the LRC creation loop to remove a race
>   with post-migration fixups worker.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c        | 29 ++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 25 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  3 ++-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
>  4 files changed, 47 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 2cb37af42021..07c6d8bc3ad8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -365,17 +365,28 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	 * from the moment vCPU resumes execution.
>  	 */
>  	for (i = 0; i < q->width; ++i) {
> -		struct xe_lrc *lrc;
> +		struct xe_lrc *__lrc = NULL;
> +		int marker;
>  
> -		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> -		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> -				    xe_lrc_ring_size(), q->msix_vec, flags);
> -		if (IS_ERR(lrc)) {
> -			err = PTR_ERR(lrc);
> -			goto err_lrc;
> -		}
> +		do {
> +			struct xe_lrc *lrc;
> +
> +			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
> +
> +			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> +					    xe_lrc_ring_size(), q->msix_vec, flags);
> +			if (IS_ERR(lrc)) {
> +				err = PTR_ERR(lrc);
> +				goto err_lrc;
> +			}
> +
> +			xe_exec_queue_set_lrc(q, lrc, i);
> +
> +			if (__lrc)
> +				xe_lrc_put(__lrc);
> +			__lrc = lrc;
>  
> -		xe_exec_queue_set_lrc(q, lrc, i);
> +		} while (marker != xe_vf_migration_fixups_complete_count(q->gt));
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 7f83c0d3b099..3da38f2ee317 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1277,6 +1277,8 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	atomic_inc(&gt->sriov.vf.migration.fixups_complete);
> +
>  	return 0;
>  }
>  
> @@ -1515,20 +1517,39 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
>  	return true;
>  }
>  
> +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt)

Kernel doc.

> +{
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)) ||
> +	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> +		return 0;
> +
> +	/* should never match fixups_complete value */
> +	if (!vf_valid_ggtt(gt))
> +		return -1;
> +
> +	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
> +}
> +
>  /**
>   * xe_gt_sriov_vf_wait_valid_ggtt() - wait for valid GGTT nodes and address refs
>   * @gt: the &xe_gt

Return: explain return value.

>   */
> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>  {
>  	int ret;
>  
> +	/*
> +	 * this condition shall identical to one in
> +	 * xe_vf_migration_fixups_complete_count()
> +	 */
>  	if (!IS_SRIOV_VF(gt_to_xe(gt)) ||
>  	    !xe_sriov_vf_migration_supported(gt_to_xe(gt)))
> -		return;
> +		return 0;
>  
>  	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
>  					       vf_valid_ggtt(gt),
>  					       HZ * 5);
>  	xe_gt_WARN_ON(gt, !ret);
> +
> +	return atomic_read(&gt->sriov.vf.migration.fixups_complete);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 7d97189c2d3d..a6f7127521a5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -39,6 +39,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>  
> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +int xe_vf_migration_fixups_complete_count(struct xe_gt *gt);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index fca18be589db..0b397f259a26 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -54,6 +54,8 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/** @fixups_complete: Counts completed fixups stages */
> +	atomic_t fixups_complete;

Hate to nitpick names but fixups_complete_count?

Logic in patch LGTM.

Matt

>  	/** @debug: Debug hooks for delaying migration */
>  	struct {
>  		/**
> -- 
> 2.25.1
> 
