Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D218ECD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 19:16:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7213410E0BB;
	Wed, 20 May 2026 19:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjLa/mE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0CBB10E0BB
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 19:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779304576; x=1810840576;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=azZ5xWOM1vtf+YgVJ9B9AGghvcalqym0e+7B3k5lIMA=;
 b=FjLa/mE21jse4Hb1bBohjqGJM9NKYSO5zeg41KIHyPt3Bqq0uVXFJxth
 rVD6SFqjncNccmvY4OZ03WpI74GNLG+FOlzGQUyKF8gMynZeezh18/f+Q
 8nW+rmBBnrt5Hiro8knw2lVd0iUXSMJBeA1UdB6s0OZmW4Lg1CBKDuU9Z
 NKTB0GWo37GpKDiu5LpBO6TY4ucBFd1hm7ggPNIfdtd9qr65lHutF2Kam
 Ne037Tjo+jyCm/om+dIUM8sEGqNOVUjW6auHOc6RGmlxpZRzIM/9p00Ap
 MKDKOt7RA5nAOKVr5WWwv1gSA8OA87e5WiVHwZafUM7/HuU5ZTGZuM5eq g==;
X-CSE-ConnectionGUID: RmklxUD4R26s0wO3Wx5GLg==
X-CSE-MsgGUID: cmNIgEwwRq+rbr/uCsweyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90792407"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="90792407"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 12:16:15 -0700
X-CSE-ConnectionGUID: gr0U4+PvSWSKYa9a8FButA==
X-CSE-MsgGUID: RYGqUw58T4G/1UqZrKMxBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="263796926"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 12:16:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 12:16:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 12:16:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 12:16:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnE2XTEhZ9uoG2/AcH6M1Jm0AfK9wz05dqaDsr6eKUFMni6S/bvTlyYqZk0Fd8ADfY5N+IFlxZA67qZ1zEqLSvI3pn7dbl94opoEcyZ9MAcqjhwYTbJyexJ1ktpxkNxmtuCpQmYDBdEryb+5aYB8C7grSjtLkRm6b+kTDZYpfDmWaC9IkoZ0q7bD4R70gU4ttruL8kG70JzPArfvqmDmqkHqEdSVSCtBDRIMqCLmG1eGpXLU/DOIzSHqk6cYHCdD2hJaGtq0cL1ZLKgHZrRt/3HU0p37DhvbkKeAy9HgObX6xBUZERgA7jvKPKC1W36zQayu1phfSe0AZlrRo3gYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgOuNCIK0wtKie9AqqRDvbz/zY2WJejD0dKqh4tbE/Q=;
 b=XvXD1xVyZfR5ebF+YnJcQTzde4EZE5gSuWeRklRfQ4gcBz+2WgZyVi3sM1J65Wgjv6s8V1+8RVeeWZ7WKkG2rQundo1c8ZpwTgIB252mM3Ao4f4RmIWTQE339xuRaFluv517YW1cHz5sLAz3MVJNhLSMvIgnPqFFgWNm+SHCYqQOBlPx/Q76TkP5bWYnD9pCG+7WCdzpLBup1CQNf1hxr6oreoDhMP3QJnydowqBG37dEYZbiqWNTbVi5FA19O3eG1s21CWhsln5Bb6y872W8TMxkhQAedlEKTX3jys1oko2fv2IQ1EXWAcIwho6cI8Zi4E4env87TieM+agNjriAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by IA4PR11MB8963.namprd11.prod.outlook.com (2603:10b6:208:55c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.13; Wed, 20 May
 2026 19:16:11 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%4]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 19:16:09 +0000
Date: Wed, 20 May 2026 15:16:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Fix return type of disable_late_binding_set() in
 debugfs
Message-ID: <ag4IdWWxBOYcKp1P@intel.com>
References: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260520070255.2021100-1-mohanram.meenakshisundaram@intel.com>
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|IA4PR11MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: 5851be10-e2b2-4ea6-7cdf-08deb6a43fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: G8xpFaHFWlhOs1kC/ObFwLAE2kQ6tVtprfE0Lpb8t1H2sbTuGmb+rSy5Qv/J71E0ivnPfxKLcwtNOwZwCEZihXhLDeTjxaeLFzCF7VEg7ulTNcOw6HX6mIeh3DLN7y3klKG9QWzoxXt51lE5IXXt5i+oRbv2CjDKmcpS8HoNgOM6cROOX3bilkRGORF9CuyZETk9e6SHq7G6hStPcna1A8BsZTZem8lJWkZv5nLFKaHfuOfWLXMZJQNGVLkdnwdk/+hqu64qlLPJfrvsfXprjJvRT0pBP/CDEE7zddJrl/gt6FfvnzaeOJDmBmKUwPUQvqh2WBxW5xbGdz8vMXUym7fJx/WVMX8o9GDrknTiTVcD/1whfONrKDuKfpeau/LJzEOXZlIyUsFern0DfGRByw7Tlk+k8yiCXwIjCtRFZJYnozjXV6JEBqPZ+SqS0HQvoAwZ4cZXQJAvV9olPka82TJsQxzaixgzFNjfK0tA5yxzTWz4NXOVybVyUOql4dAis33C2N2x2HySQ+RRT15rkvSaUUwqRWlJYGNGcvQu0tplkvb1H2Cn1rMnhZWuAhZXA8GSY5WzrDUU11lJ87xcQiox3cyyQXj0hzGSA90HMJQzYghFvp8/iSoJaCMvBfOvyaCh8YesKeNeTTLp5xDzY7sk6NR/uX1DnYYRYBl40wLQxir7Qw4vIaxHU1KNKTbJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P60pPJluY8EJq6bSbwcZCxnK7xXsDL6Nfo3Ky+v4InyY9Pff6vKOUkqoLSJz?=
 =?us-ascii?Q?/XE0GXjNhmCgfzVKSSXcnTQe2648oxx2e0brwJqYwYIvWKKOkpEqzmXOmVMr?=
 =?us-ascii?Q?j9+c+3IdJ469WVYF1M+KE8JsIe8G5Psm6os/NGLnB31kIuMJRfaa7givUZjt?=
 =?us-ascii?Q?0ytsNVNHBN+37wGNZiQgIq1niIb6tHZeSyf+c5fcyF5G/LmIMQezHwcE12a8?=
 =?us-ascii?Q?Waw4Ero+5JguWhx5WNnw2AFgiTiqBS3ieDibpV/Uk79+Y4HIOECwVEyYeOwv?=
 =?us-ascii?Q?MkYoJIWKr4Qv2GzlZo06z19CcNpkiKjlyYM7uYVqKnaBreIvS0mJUv1Rf2k6?=
 =?us-ascii?Q?EtTyPgE1wIWjN7cWFkbrWP5M+DF3soY4Km8yy0QS52Wo3LkVvM8O4NOHSYLF?=
 =?us-ascii?Q?+LFe2tAUX+IiZHIBgbu8yqcIrUjkLN/WV9EyFraucd+55844AZjoH6G8S3cf?=
 =?us-ascii?Q?JgL4hKBkAeSIrc+ApZpsGoSggi0QPaONkBCQZNqXAJEjoSrkk0peU9aYw31L?=
 =?us-ascii?Q?IA77+pxRmbxwlftasRRoXx3UuNxJaLl6PYWKnAeLVdscOTmbCuyPHmDse1ol?=
 =?us-ascii?Q?lZbX5icpaixB2plmWIVVDH/B9BpU6d0yPEBXBnbg2fLykq5DUaAvWd1+qakb?=
 =?us-ascii?Q?BxGgE9iyWNnLrxqm1Roy4iV3q1Eo6aLXoeSL0WrnNtkjzmG23Gb4E/d2Y6Tx?=
 =?us-ascii?Q?yK86vehg44yAtLgHoatT4GzgS2E3iZdkvz79vQ4TpdWU66azzRS78hUezS9F?=
 =?us-ascii?Q?rhZLI6YLfnfmfT+UBE2iU0jV0GJY0+gn4wVzsWTSjFfAErruu2Vyh6DtAE9W?=
 =?us-ascii?Q?Tissolpz7Egp7vewuDD0S1an4qI3Vzq2pSW1cFN6gFnGiaE22IVyTjEEnxCA?=
 =?us-ascii?Q?BYVFVVAuDG8gKCSZnt5HN5tkH3OSI31t5jms7f4uyqawmutwR3C/gZLvh1z4?=
 =?us-ascii?Q?XGINByrmqouXtfJy9dElmpVhqwohmPHQ1tz9zUVY/NiGO4YS5oafJIYQ/SPu?=
 =?us-ascii?Q?9Z7uNvbVLOoYG1f83w8OCojgt06vQEQhBzYCkDybMSp0HCDdoIqDtDU35E+A?=
 =?us-ascii?Q?4XV+jyXxLYh7wD3wMhIY+qV/Lj3HW33c6ApK874oxVKsHzWsfz5I2lSZFSGj?=
 =?us-ascii?Q?h3nmA37e7Yqh9x+dGyBYwxlXiQve8huSS5ROV35PJe+a3Ulek0KUIVA8iqA/?=
 =?us-ascii?Q?YOlO9+TDyX/b07zM+6bcedo60Te5SJE8Nn7OGgp00hEuhOJzmtifamtZZA5d?=
 =?us-ascii?Q?8qQkPiTyfCdSdk9mymkA2ONdiGcYd6ExFGpF7mVUNEGWzQODd+IwENq3wjfR?=
 =?us-ascii?Q?dyXSFC8mYDLKkOgC+Whjjq3JvUlqdsX2T9LJZa+w898QoJmLKxu8fnSFBsbf?=
 =?us-ascii?Q?pLmPLPr9gO0HTuQgJJR6H4CgLDU9dDGyguGEiTgkBfvDrYCwpqWAdx2OUbyd?=
 =?us-ascii?Q?TIpHSrmXw/NLcHlkkjiIVdIsOkOUExPGvlhnc7HqA51mzY0Ngqb7dTE4tp4T?=
 =?us-ascii?Q?juVlwE2WWyGA1nD2DE23sDiflKzyBNbpJqsjzxsSxOKoCnpUpZPTrUDukHcA?=
 =?us-ascii?Q?K1noHPqTJNPRy3wu3T8aWRAsKigRIwdImX+JpduTY4Izyj9IFp51bBj4heKf?=
 =?us-ascii?Q?HtgrLYrswIugE+b+Ux39yXh/BmzUUF4Eb4dJ2hH3Qrq8LlFQWNDLrJrO3wQH?=
 =?us-ascii?Q?MZmAxw58WZbCcVBiCmA1KLc3+1mQb0Zr4sHrmpG8z5OzPYnpNrgI0Cpm8LhT?=
 =?us-ascii?Q?VTTdMLX4PA=3D=3D?=
X-Exchange-RoutingPolicyChecked: lFRJpKsbIy53ou+9TGBVQB4K3Z0BxhP8frodl9pHmCoc4Z/g4GKHQQifuHkEaJXZAM+q6jI7EHBOUMTEZv+s4LhnEjCMnxpdZAAY91VAI+hPoOF6kxQWsuOUmH4yOHFnNlVt5m3oiVVkBg7tQAFS0biZ+ZHp/Yq9xg1RiLGpbbNTmjGSuf+Q4W6CNXhfqwCEtW93HQNOy7F3OR4yaKIlVJ860ch+HgFfwmHUtUV7rYNT2oUJIJ0Cu9iAGWpxJ6yaMFcyRR04c8CAdKJlc+aBHeMGYOgmCRxX/542Ems3CxwJ2JNcTHbTBgJcwT7mYDvyTTj2iDJ1tM9PtCIh3woY2w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5851be10-e2b2-4ea6-7cdf-08deb6a43fd0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 19:16:09.6645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwyuF2nVagkxjAETwhA9eeBkdJ6VoTbZO5XJKdmOuI2sKvl8/mrxmUa/t72nwz8avAT+pPqpP3VB+TFbDaVLqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8963
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

On Wed, May 20, 2026 at 12:32:55PM +0530, Mohanram Meenakshisundaram wrote:
> Fix disable_late_binding_set() to declare 'ret' as ssize_t instead of
> int, consistent with the function's return type.
> 
> Also remove '0' initializations for the 'len' variable in

If you do both in the same patch, please adjust the subject/title
line to something like:

drm/xe: Adjust variable initialization in xe_debugfs.c

or something like that that is generic enough.

> four debugfs show functions (wedged_mode_show,
> atomic_svm_timeslice_ms_show,
> min_run_period_lr_ms_show, min_run_period_pf_ms_show).
> The variable is updated immediately on next line by scnprintf(), so the
> initialize to '0' not required.
> 
> Fixes: 62519b77aeca ("drm/xe: Fix memory leak when handling pagefault vma")

I can't see how this commit 62519b77aeca has anything to do with this patch
here....
Please provide a proper fix or simply remove it.

> Signed-off-by: Mohanram Meenakshisundaram <mohanram.meenakshisundaram@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 22b471303984..675cc0ddd83b 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -282,7 +282,7 @@ static ssize_t wedged_mode_show(struct file *f, char __user *ubuf,
>  {
>  	struct xe_device *xe = file_inode(f)->i_private;
>  	char buf[32];
> -	int len = 0;
> +	int len;
>  
>  	len = scnprintf(buf, sizeof(buf), "%d\n", xe->wedged.mode);
>  
> @@ -411,7 +411,7 @@ static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __user *ubuf,
>  {
>  	struct xe_device *xe = file_inode(f)->i_private;
>  	char buf[32];
> -	int len = 0;
> +	int len;
>  
>  	len = scnprintf(buf, sizeof(buf), "%d\n", xe->atomic_svm_timeslice_ms);
>  
> @@ -446,7 +446,7 @@ static ssize_t min_run_period_lr_ms_show(struct file *f, char __user *ubuf,
>  {
>  	struct xe_device *xe = file_inode(f)->i_private;
>  	char buf[32];
> -	int len = 0;
> +	int len;
>  
>  	len = scnprintf(buf, sizeof(buf), "%d\n", xe->min_run_period_lr_ms);
>  
> @@ -480,7 +480,7 @@ static ssize_t min_run_period_pf_ms_show(struct file *f, char __user *ubuf,
>  {
>  	struct xe_device *xe = file_inode(f)->i_private;
>  	char buf[32];
> -	int len = 0;
> +	int len;
>  
>  	len = scnprintf(buf, sizeof(buf), "%d\n", xe->min_run_period_pf_ms);
>  
> @@ -528,7 +528,7 @@ static ssize_t disable_late_binding_set(struct file *f, const char __user *ubuf,
>  	struct xe_device *xe = file_inode(f)->i_private;
>  	struct xe_late_bind *late_bind = &xe->late_bind;
>  	bool val;
> -	int ret;
> +	ssize_t ret;
>  
>  	ret = kstrtobool_from_user(ubuf, size, &val);
>  	if (ret)
> -- 
> 2.34.1
> 
