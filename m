Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4798C54E60
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 20:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D9E10EED6;
	Wed, 13 Mar 2024 20:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHbnb9TC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE11810EED6
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 20:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710361633; x=1741897633;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6JZwKY1+HhAlequxetQnjI+smEKSCe9L8SAu3rJ8cq8=;
 b=HHbnb9TC59bEB7sCS46QGgqLaEtgd4TVuP08p9QvYAngoWJKeHxLXNnK
 4zNvTBrDS6aRS0bXr5pGu32pe5/E5HNhy1sZ+alOPWIT6mI5bkgArYMoo
 F9/TC/DNOaF+DWOsszKOQ35mYXtA+ggi3Y6zwuZRDzcm1Q8V42U1Pz7or
 lWTGr1hIJcKEdkYyxlw5q5RbmbrdNqMXOBjFKtjlnlU7a3iu6eh15fLug
 AP+53tz2m5b8zNjNhXqPmfPOxZHvtL3ulLYOhNatg8ESC8JqqcZ83s64l
 t990MnJEGIdCb5NO4xLa8G5hLtIKvi19sxmEIYzlg5Uy4bo1zZ0GJETTj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8096354"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="8096354"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2024 13:27:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; d="scan'208";a="42975908"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Mar 2024 13:27:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 13:27:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Mar 2024 13:27:11 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Mar 2024 13:27:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzHXRK5xHxJn4885rFO5Rg84I+2pyPqOcWVh4ccBSqqCii/8VCf1kez2fthAZONkrzxvQwh7fOFuL7fuXcn0abvlRSxR5uAeUWt9Hh5i7D30oiEvuIrZWwAso8yRkweek6zH7SqNMbGyci7Dt432JgIXkUJH9HpjtO+n33O6Ev0n2cb9wosgwYwjrulP/3NtFDEhijNBuXPWe/IkNfM41oiqAOPpWNhpiNGtwH3tSZ3zVRhc8GaWhinou6whiHElxGFAPo811tAAEQPS3WOeYlXSnWnxCB3lI+IymfuNAg9Sl7oWCvm6qI0jTxJJu9pALbGTNdL6Og/C/yRXL+LsHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlMFsHDN5Ssq3OfbMI9r6rniGlSUxjMgasDLaO99xQ4=;
 b=gFzj3+rQ9YvLeCP2a9Go6w0tRKXie6kLOHIyKpfo2zpAeKZYNIcAV8zXuqLyCZs3EEA7io6kb+Ih85JBWf8s4y4leT15MfpiD/1r9SS6IUbUU35L1D4sclvX6k2Csg0XKQyhyGigw/J5dh+YfFBfOsIjKHDl5Y5HeReUokK9Hr08NB4ujL6DruWvyVkX6wwBOB3twxZmN4+XPLxJU2jUyvilK3xnjXwpI+4f64b9guGD1j9AG4S2duWGtC6nLX/BRyH/qY2A7hHu7frtXMhMxf9+NwUmgZXkC2NMDzL9j5jrXWdsYI8Zar1k95CV2Mt5dSniTaVfNooVMlZFwCNJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 20:27:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 20:27:09 +0000
Date: Wed, 13 Mar 2024 15:27:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Introduce a simple wedged state
Message-ID: <qjap3n4uesovz4eaxnxjwvdiylv7gu7mz6p75umc2lvvcqi2hx@ghdxl2vwkz4g>
References: <20240313195459.141463-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240313195459.141463-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0132.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 10553563-6da2-42a5-18ce-08dc439bf4de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdO+ZOo/KFCSsla1f6N1JeqCzbBfjbRHlarODtqVQVmaTg+/j+HDAA22lUJC7Vcn5KsEnTAUrM2P9EmNFpvHlkclAmOesxR78SdqO89hNfcG3V4dF/MIYANGYfXYIIRrrA+uExK1iVhaWsuOdJcrkvJi3X/tDp3uSF/pEdZOWKr5HAkiObQyTd87/OaHe1XfYRnd4kDI+HhdwbwfR/3wzdZLhax96jU9dP8+oWXjJYyefoWlqH5Ewl0uqE5oshzHLVVFVb9NZgSGJXTv8xE/q0d3K5eLoSyNfuwJdrfayNQg5Tv4qvK8/Vw3KKU5/cAw6rzh9jHCWo9g6ol/CL0Pu8cVQ6c3GH6eUp0BGsZkDkNXkL2pZqgM77CqREYRjwhs7XG0qpvIC+ZgKCF/BDIj3M5RtxJBHi92CB2mGVvtqbWf5JfFeaxEmEyOAzt3NlKIgz2z7h18hJBsXbluKUsaXf+WitQfspBNhmmHR4jSUqon+eLSTSqKZ9yYSUK9JIaExrV5hvfrNx+f/xtjov415YqhEgTyuM8LaAufhv5H2zvMo/4F/pMtsslpA4KglRk2D1fm9PQGeUQ83uzk5qaEHmr9hj/gOoFFlU0/SVnqKp0iM7ngKHMDK0QOxc1bPRxkOqVuGetA53YNL0rShIw1VG3K+yhI5cnHrP5xfoFSuzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yrJk7BhVwuymH1tWr1201KkRT5R5Wc/yEpJ1khyV4oddDF1cI5DShBAPxc?=
 =?iso-8859-1?Q?s0d+o5841fqGWl6anfkGTQhF6DdcMJJdKgsxynTnvjPhEM1DSduPYknLb6?=
 =?iso-8859-1?Q?iy1LkVuJ83vOGVAW788soVfHFvqpVQPAbc7s9Jxc9B2NNf8NJ8oztBjkYr?=
 =?iso-8859-1?Q?hm67wk19Z4Jqy2bn3yktQWrOMPSITLYv+S7L66jQz8kJ04/MaCFWnAmNw0?=
 =?iso-8859-1?Q?ciIHp/96Yjcsx4lTFo5kKiOaakDEs/KFkaYAKlbudLH1O6KTb5VzOuP/wN?=
 =?iso-8859-1?Q?YsLSjHrzyPI5oN+qh5qsJIsyZKkO177ft75FxW/uRhFCAyS3CVGqYZ/iqs?=
 =?iso-8859-1?Q?EEYZ5Vauk+I0/SYp4vw9UYVC0UkMcT3XOhURzZp9auePrV5BssbLmed7kd?=
 =?iso-8859-1?Q?fv/dTLwNUE+xEeTVjqBdoySqAKrb6kHryNsvYX3QI0C09A1j0kNHlMKUud?=
 =?iso-8859-1?Q?AAFHXORmLX6GODua0/aKMqlMhApLPWQ9PWIsctuaBBJM386izMpPP3ujrD?=
 =?iso-8859-1?Q?W1q3l9QXJ2HkIkP+DqH2N27tkAPEUOX+7LuLwqPWj9M5kL11+87mvHy+0X?=
 =?iso-8859-1?Q?/GE8XlRBN4miqNRoO/UPsq3Q4adT2SIpbRUZbaRw2bVZY9wzBMIxjsd6Un?=
 =?iso-8859-1?Q?BKv7MkxavSqkCQacDThXdadkyI+cWqavVSEaYdvHIxhBX8qj0fKSnpDyxv?=
 =?iso-8859-1?Q?zY8DvEp9oUIUq4LOh8C7Gjz0heFn26uDngedRZFcUnk4Ecf31StM31LdfS?=
 =?iso-8859-1?Q?aZibUVjggEPuPMKhfFVqE6GCyWlfWHkV65hUmXhatfNwLwWrN5a1WhY7RH?=
 =?iso-8859-1?Q?BFzN28e88MSBjv2oExB0bAzdgivKVOmLw0iegF4y7pJAlu5UCiy/OiTl1D?=
 =?iso-8859-1?Q?XapTgGicwSVVOQb43gHOeaqdavTM0CGBSCY4WZMt2uxi8HbwkpbtnWzL8A?=
 =?iso-8859-1?Q?n/HbtCKpKiqDgbbQA9HQ/IQUEcW4cPVxCSLSpLlMDorDy0uM6B/598U4nh?=
 =?iso-8859-1?Q?/KOOZJ7a3h+LNuJH4EHM5TtliFmYBA34P6nmuysB2QQVBnXFWRaLQHJ2O4?=
 =?iso-8859-1?Q?GrDi4Qe7GLH3CW4vLjYeWXrFeU5xDLY5ETJZ/DKc0MVv/S1Qu8WfSDcXAv?=
 =?iso-8859-1?Q?dNM8MZ3uSwjujCOivma/BFoMPU2G7gtUbdRLzoeAHXlme41TATBYJDkwVF?=
 =?iso-8859-1?Q?Z9YF2Z7BvgNHYfkzXWROsuAi70BA0PzBxuSEywu0vLBWkGXhYhaKb4u3kf?=
 =?iso-8859-1?Q?tQwOqBovTrAP9cL+bS9d+gKtt36G1TpwJVkQcoSsD8jHHTY3bzvN9TTszW?=
 =?iso-8859-1?Q?wPajCgQU8goz+FaK4tWYkhAOrbWAcbM0ZeydQ7Siynz/zc7y7Rshhw9bUQ?=
 =?iso-8859-1?Q?Nvb36OHuOl/C2YHatXyYVvokco/kOegk7jL5aIywqAOi74xdeKxQ+uoJUy?=
 =?iso-8859-1?Q?O4pndZSdqK9taW33ydwb9JkosOftwlkMsXxyWd7+TzIAUgJJaRpFzfAKr2?=
 =?iso-8859-1?Q?1bPDqamv/rNWooYLNzias76DVtq3QLHUSsz6pKBnYyczbwAWWkz6olBaeq?=
 =?iso-8859-1?Q?zsnQZdiazTwoiKzOU5RyJETfDcpnEuKWWDwnRHPW7MBCQNpptsDxJtUcRN?=
 =?iso-8859-1?Q?GqHJxLKkR1wjSum7uBwfYbmyxGsHIxpwCvwur7VqvoPkr8G1oHh+Ehxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10553563-6da2-42a5-18ce-08dc439bf4de
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 20:27:08.9690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfDbkqmxUqbpztVH+JAEnUWw1LLhYlSH99sFAxGRsJ7Qq5qXGTkH30DFSBKfd6selfC076ZVAqs3EdQMUKPjPqyP78+0oZ+uPEC1n98RULA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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

On Wed, Mar 13, 2024 at 03:54:57PM -0400, Rodrigo Vivi wrote:
>Introduce a very simple 'wedged' state where any attempt
>to access the GPU is entirely blocked.
>
>On some critical cases, like on gt_reset failure, we need to
>block any other attempt to use the GPU. Otherwise we are at
>a risk of reaching cases that would force us to reboot the machine.
>
>So, when this cases are identified we corner and block any GPU
>access. No IOCTL and not even another GT reset should be attempted.
>
>The 'wedged' state in Xe is an end state with no way back.
>Only a module reload can restore the GPU access.

I don´t really like this last line. See my feedback on igt: this should
not be a module thing, but rather a device thing. I don't want to nuke
xe from my igpu when debugging something in DG2.

>
>Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
> drivers/gpu/drm/xe/xe_device.h       | 11 +++++++++++
> drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
> drivers/gpu/drm/xe/xe_gt.c           |  4 ++++
> drivers/gpu/drm/xe/xe_migrate.c      |  6 ++++++
> 5 files changed, 33 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 919ad88f0495..5f0a2bdb7c24 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -142,6 +142,9 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> 	long ret;
>
>+	if (xe_device_wedged(xe))
>+		return -ECANCELED;
>+
> 	ret = xe_pm_runtime_get_ioctl(xe);
> 	if (ret >= 0)
> 		ret = drm_ioctl(file, cmd, arg);
>@@ -157,6 +160,9 @@ static long xe_drm_compat_ioctl(struct file *file, unsigned int cmd, unsigned lo
> 	struct xe_device *xe = to_xe_device(file_priv->minor->dev);
> 	long ret;
>
>+	if (xe_device_wedged(xe))
>+		return -ECANCELED;
>+
> 	ret = xe_pm_runtime_get_ioctl(xe);
> 	if (ret >= 0)
> 		ret = drm_compat_ioctl(file, cmd, arg);
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 14be34d9f543..d10664d32f7f 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -176,4 +176,15 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
> u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
> u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
>
>+static inline bool xe_device_wedged(struct xe_device *xe)
>+{
>+	return atomic_read(&xe->wedged);
>+}
>+
>+static inline void xe_device_declare_wedged(struct xe_device *xe)
>+{
>+	atomic_set(&xe->wedged, 1);
>+	drm_err(&xe->drm, "CRITICAL: Xe has been declared wedged. A module reload is required.\n");

should probably identify the device and remove the mention to module
reload. At most say "Device needs to be re-initialized" (or "re-probed",
not sure which is better). Do we want to mention it will be FLR'ed in
that case?

the rest of the patch seems to be device-based, so it's more the commit
message and log above.

>+}
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 9785eef2e5a4..13971eb2334f 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -455,6 +455,12 @@ struct xe_device {
> 	/** @needs_flr_on_fini: requests function-reset on fini */
> 	bool needs_flr_on_fini;
>
>+	/**
>+	 * @wedged: Xe device faced a critical error and is now blocked.
>+	 * It cannot return to life without a module reload.
>+	 */
>+	atomic_t wedged;
>+
> 	/* private: */
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 85408e7a932b..972c0c6d0608 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -633,6 +633,9 @@ static int gt_reset(struct xe_gt *gt)
> {
> 	int err;
>
>+	if (xe_device_wedged(gt_to_xe(gt)))
>+	    return -ECANCELED;
>+
> 	/* We only support GT resets with GuC submission */
> 	if (!xe_device_uc_enabled(gt_to_xe(gt)))
> 		return -ENODEV;
>@@ -686,6 +689,7 @@ static int gt_reset(struct xe_gt *gt)
> 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
>
> 	gt_to_xe(gt)->needs_flr_on_fini = true;
>+	xe_device_declare_wedged(gt_to_xe(gt));
>
> 	return err;
> }
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index ee1bb938c493..5b2eeb2048b5 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -713,6 +713,9 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
> 		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
> 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
>
>+	if (xe_device_wedged(xe))
>+	    return ERR_PTR(-ECANCELED);
>+
> 	/* Copying CCS between two different BOs is not supported yet. */
> 	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> 		return ERR_PTR(-EINVAL);
>@@ -986,6 +989,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> 	int err;
> 	int pass = 0;
>
>+	if (xe_device_wedged(xe))
>+	    return ERR_PTR(-ECANCELED);
>+

bikeshed: I never liked the term "wedged" much from i915.
Wouldn't "dead" describe the situation better?

what was the motivation to add the checks on migration and migration
only? If we want to make it die/wedge, shouldn't we be checking this in
other places as well?

Lucas De Marchi



> 	if (!clear_vram)
> 		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> 	else
>-- 
>2.44.0
>
