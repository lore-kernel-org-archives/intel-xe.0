Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF088D3176B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 17:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD97910E41C;
	Tue,  5 Nov 2024 17:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhjGm2n+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A7810E41C
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 17:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730829019; x=1762365019;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cZAPoJ6An7pOzXGUG8IRqkXvHJySOngm1ITAQxWjylQ=;
 b=XhjGm2n+yUu9GXjjDC80TR2UmWJGdBfEkyI0hwJMyJ8wIeAinT8PlUGD
 tOSQ65j8Ag32DleR8G5CUtr8AiGTq78TY+eu3WAncsVD6pYQYV48WX2Vp
 Yhovju6kpSH3w5CQBLW06pnqovHdN598J9RhzTDHebSIuegbFOV+jBj5I
 +OqNcsiTbyIYwLWBI2pFfzkeI4erUUHliv4YJWlUgFGBFsxfomK92anKl
 Im7mXTUoI2Lh3aOx5L0EOsEjIuEZ8Go8kzgFYvHbQzR5NuYE3uTpwwZyS
 56k9/o8mRx5KMPL9pSgrqwVcIMO7M3U9cQQI/jLEKdxmwlIhFEoQUPxbE Q==;
X-CSE-ConnectionGUID: nOPbotl1RcuuCfftMPlIWw==
X-CSE-MsgGUID: 61oy1F72RK6mPFxbmfMEew==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30472288"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30472288"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 09:50:18 -0800
X-CSE-ConnectionGUID: 7ckxq2uQT5isEekakJACMA==
X-CSE-MsgGUID: CPQJxCzsSlW9BVTsAxp3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="88674304"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 09:50:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 09:50:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 09:50:17 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 09:50:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNjRw+Ia4RpJfCqL0Et8XhuB6N4P+rwQvn+vOSJ+auq7dxeCU9xHhpgP3jCHdC/ipsTLYNoK6KMRR9eGSEjPXOM/U6gU3v3xPBNDx0quaHKyZcdtbJwsvtaPmr84yonj/5Gsl1v6qwHgWvEobrpBF+SBLyE9EdDzQxbqgc7iJWU0Q9TxOVqSWwcUoKVYuoiRxrbxW/11TgEj16OSvJf1UdBRFmS7jUpNgPhWFSOUjl+L0lBkEqvEHXom6jtSExCPxBoN8W/UjqlX6x4DV0OKk85QEp9MNmI6Kwg+XY680PygdAX6x6avsJJaidPoAHWnIIIuKechBJHKBeL1J5F77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G394Sd8HxJnGvCrQbrXcYyeyPCT1REiXknbVl3uCwdY=;
 b=WFTGUGTwrdULugjQseiBogcemGc4VW/FGqeJniNraae4nhmwWEOtChaPCcTdWKoEEbB8VOarThz5oKauERi6Fl4MRzH2E1bP8PzPMUjaaqOzKrWJ827phYkokYDKZXPV40DKAXiiGH1JphCyXk+VlmuWNu6noPpWnKeq3X/JGsk2x6Y0qCxuPlLPPI1q0oJ71o3SVSHb7UCE3Ly9DQB7vvpI3AXNjp77hMniVFUgLEebycsbjwnB6ClBVoSwXnBhpqmUL/KYMqyz2YrDL8LnhiJrzGrowjlPA+zWc0Ez3LpDOcdji6j8pXngECzvhwwQCF+yvImrbu2O480n7Lvzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 17:50:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 17:50:13 +0000
Date: Tue, 5 Nov 2024 09:50:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Take job list lock in xe_sched_first_pending_job
Message-ID: <Zypa9M+p2+4RZ3Oa@lstrano-desk.jf.intel.com>
References: <20241105160327.2970277-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241105160327.2970277-1-nirmoy.das@intel.com>
X-ClientProxiedBy: MW4PR04CA0201.namprd04.prod.outlook.com
 (2603:10b6:303:86::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dad32ae-f18a-49e3-d76f-08dcfdc24cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WazdVRMo7YFIHRXTKCusuN/toBl9yd3XASsUBteBaJmWgevXRV1voEKDd8Zp?=
 =?us-ascii?Q?kTquo/ApBtMC3OXl1VYFVJS1boND4me4JXNhveBhMdLKJz/1rZLsf8thRQ/X?=
 =?us-ascii?Q?jBensjnHvvw7ayaE6eX//LssQa+83VQIJ+ngodpNKixhuJBm1Xp0qtwTW9Xu?=
 =?us-ascii?Q?pC3C6YViopfLXl+8J7RzmOZZy3zt2wz0FkWHWPn2hAt7G9fDY29rpYvCtXtT?=
 =?us-ascii?Q?WHuTF7aXMc7KJIK1lFxgUjC7hKhmpXHQUCMYmMJH8l97HgHxi4hoKiu3/e+w?=
 =?us-ascii?Q?9qutqw5X9GUtb6vFTHbUHbT+O2V01tZ/PaF22bXoj39KdihlpWv/2xtjYa7n?=
 =?us-ascii?Q?z63Dc2DB7SyVyTTvnQCnXJKyB3dG8Muo+WGii4In3aRHOKEwZRGtsOxLENV1?=
 =?us-ascii?Q?RVue4fifHUNT1Sbv9ZzgYk8aVaTBgrKGPV2NuSMudMJG84E4PYVqR8YiFR9L?=
 =?us-ascii?Q?uq2I5CGMreMRIZNEPg9LLOtkGzYoreUdS7DDYCSUJA9HoYcSQF6ZHILMSvVB?=
 =?us-ascii?Q?Gglx26BYTL97hniRr6uSnYQk9TySvcllFC6Oxz3ajsc62q3WPOF8hRnH1rm/?=
 =?us-ascii?Q?ST+HRLh1gu19HrkOoY3S6kyWle1Jef2NGSb7u1QuubtCIuks2bv2iMm68O4u?=
 =?us-ascii?Q?uatHU76OgE1lc+YCV6YF8SeFE59+xsC0XmV9y4f0LlStUktxliHEXOxSiKkJ?=
 =?us-ascii?Q?Zl9ncBrQ6ECvoAlUArShsgOHM9/83YLkjhPqgC+BNO5OFXgNtSPyKtkdwmAX?=
 =?us-ascii?Q?CbhmB7L1HseLK9XbvUqko0AeaeNkucCH6mxSmrYNavxGG9ehEcxvX6q2PneM?=
 =?us-ascii?Q?/diKCqmt6HzTDDqVwWOEGEGgXB7dFRJR8/E7zv7IaI5WEw1SfYstOLIf7SdN?=
 =?us-ascii?Q?WoBSU/S0VT8bpVKE/J+N8/TRbiH5mYyK0XdodgMDFyHa6l5oZxkLJPwZPnHA?=
 =?us-ascii?Q?49TRHJD0xSj8bwrpS3BuO6lOzsid6QeIy9+ONKIw/S/3+roynXZAJSobAz/7?=
 =?us-ascii?Q?Ww93OJVmLjXpP+VoSlDUf7zBHloEhvo1PIOkoqC5fZPWFsFiim9Pe6S5D1Ws?=
 =?us-ascii?Q?xEzMBUYlsVpNIPa7woa8wzRbK7/RrdlKV9OizgpdvLrJm21qsf3V09UGOlHm?=
 =?us-ascii?Q?WkIUM//EQ8HLC/xe3HUVAnbGGKqDnWIWG95Kp2zvCrbvKr9WRkfffWppPBLW?=
 =?us-ascii?Q?asafsOu8cMOAYbaariXtwFlUlBj/xYjjbWBdLV5MeHA9Zh+bnHW2+egAFybW?=
 =?us-ascii?Q?UnL/Wwa5fNY758ZXbaMMxo1S5H9aUNnN41z3RGCWrkq7tc63wR26jeFyIDwC?=
 =?us-ascii?Q?TzQIKUANmmyNQJTM/2aaC0dP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IdILZ/nhrEl1DTfOyULfM9Vihp8DUVX2jcHzKtcLbIdSmo7jeVMq14Lhy0aS?=
 =?us-ascii?Q?b0oBAGz9d4PqRTTHulgm6QJ7HeaYoJZjfFkfp858KJYJ6YVWQcPUhiKmqfWF?=
 =?us-ascii?Q?1Jd8hO+J/jmAQADWUvoiWuQ/kIAuKuUIG4iZUHDqF3cpA/f0hlEIiW/OEaUx?=
 =?us-ascii?Q?F4keLusfBZHJDfdf9owd9j9+74N9cd9z0bUTGzLDi8dFSmFUhJNKpTk2FADk?=
 =?us-ascii?Q?U6yYM2Jz2ZJktW2FIMGao7LxyWciASQiBuM+gIhQKh23eb8m29J8GIwMb559?=
 =?us-ascii?Q?vjTFaYahxrmxrAy9ms6E+CsigIl882pevpxVay4gDY1MMe9iAbsMEj2KsngW?=
 =?us-ascii?Q?d7vAcOABnIjfx7b7YV3nlnhGWzhlR/7zvRYHtEbim1fEqwV6bAoiQ+W1yYLq?=
 =?us-ascii?Q?yp3kJiiMm5kwDoPulj86nHJSiTv4x9ADB5RGeHGWjhnR7IQi4hHbUwW6/HVW?=
 =?us-ascii?Q?YL9mA69/SshMlZbTvvhJSgrg0XlfokL31WB1Ls8Awe/dBQeeIdERXXsE8xRe?=
 =?us-ascii?Q?WYaYB1iyAhZtPmM0LtW120KsJ2UhkMdEevCh6JRf9tCY3bFQaunESNY6TzR+?=
 =?us-ascii?Q?F23Bip0TP5SBDm59yBoVnMsZxy6E0tSL0vaunHj1epb3+HmR6Mm8DWzjJVcb?=
 =?us-ascii?Q?vkgzWqVtlNMURcwPUJ95ToL5ae1eoPh9ffTE/bW9KwCJphUCAlTDLap7FvrI?=
 =?us-ascii?Q?nFujQEGO6yd5RL3WLSmGStr0m7qB/UGBY+dOVWVKT+0TFzsQbz9bvUBtqutR?=
 =?us-ascii?Q?TGshEff2d8RyAbApoXjjOsdgPIWvUi+DhnJB1pSnBjE7NtMT1Ktcw9gZB2NN?=
 =?us-ascii?Q?5a+2VfV5AY2efCTxJLewNH9CkjIIECzZefO/GE0m7TVuexQr0OmU2AEsw1VL?=
 =?us-ascii?Q?mm30+lVUNqrQyueW6BrfgBW9ZG6eEk/zyaCuxo2eHK248yKFOYMD165OqE/v?=
 =?us-ascii?Q?fQZHqi7z/HFGkL1YEw8/MHXBJgcEARt8hQ1YpWXx33k28Y3DilbEWiX8WLH9?=
 =?us-ascii?Q?TkH6gnfabgtjLFvKVI/INuVOvUHoysp1IC2LgDauVuNg6VwlIcZ8h0XF4MO/?=
 =?us-ascii?Q?FYoN56zsCZJqucfYEHBo8XXtyiEJXFR2OPiFypTgQAbNtAro+xOgLmkTi7Xm?=
 =?us-ascii?Q?NLzJBRxftKUIhD9IZXZhBzg9eDnbzcg7nN0CGKI9nb+JCZJI+VpYyA2QVXbN?=
 =?us-ascii?Q?vT5KM/y47O7qaYUjSdPlhjod4kXI/mdQSzsoePfhxidPS0x8ZGVn1pFnPe6P?=
 =?us-ascii?Q?+2lBwsRts67ed6zkLcimj0OTw40ed8+O9SZa+iHxFWHKMJHEMCGzO4AORjxk?=
 =?us-ascii?Q?C5fklmjlipy+6XQGsoezmh9xxOLysI15RWDzeOP/t9sZ2ADPIlU7geTVJpat?=
 =?us-ascii?Q?reMYRNfJV/DV0riF/HspAKLQ7tFqt2m5cX6lFutDvg/JIuYOC+Sjmm9xrQUt?=
 =?us-ascii?Q?Ok856hNNIcv8snBMjuozUE7WomiSwNJjeqWua7Fpg3PDGujrxFQazqMsvbVN?=
 =?us-ascii?Q?yDio9YGq/NwNCzjB78DG1ia5oRO4njXo5RiJw2b0rB0iDZkplxcf8G3jN4zv?=
 =?us-ascii?Q?VM7k1ZEWujoK7gDnev1+yA7/IW48f3VE5MzFOBKwvzyCsCe5WBKy2oFUdFX6?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dad32ae-f18a-49e3-d76f-08dcfdc24cac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:50:13.3189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRio+17vn/41FaYqwVBgt1kpUfOCpF42fmIpXneuu5SzQrLxVK6a+/O7fHlicn60zxGlabLjmW7Waxfi56prkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
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

On Tue, Nov 05, 2024 at 05:03:27PM +0100, Nirmoy Das wrote:
> Access to the pending_list should always happens under job_list_lock.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")

Is this showing up in any bug reports? The only user of this function is
guc_exec_queue_stop which as stopped the scheduler worker so I think
accessing to the pending_list is in fact safe without this lock. This is
however a micro-optimization in a non-hot path which I think is frowned
upon.

So I think with above the fixes tag is not strickly required.

For the patch though:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 64b2ae6839db..c250ea773491 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -71,8 +71,14 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
>  static inline
>  struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
>  {
> -	return list_first_entry_or_null(&sched->base.pending_list,
> -					struct xe_sched_job, drm.list);
> +	struct xe_sched_job *job;
> +
> +	spin_lock(&sched->base.job_list_lock);
> +	job = list_first_entry_or_null(&sched->base.pending_list,
> +				       struct xe_sched_job, drm.list);
> +	spin_unlock(&sched->base.job_list_lock);
> +
> +	return job;
>  }
>  
>  static inline int
> -- 
> 2.46.0
> 
