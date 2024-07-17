Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C789C3DA5D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 22:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566DB10E482;
	Wed, 17 Jul 2024 22:58:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XYy85eeL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7683810E482
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 22:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721257082; x=1752793082;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ueze50VNw0afo4mYXpBHlGrTHvir498dpGf6Qt6woHc=;
 b=XYy85eeLoIP7DpDpydNX+OMuPH9cMSqCVJwug3MVY2ZtcwuReGO96KmC
 XiAV4BrI6CBU9e4P8y6MhlGEfOPZ5Y+tpsOj89+y49I9wiqR1rQl6xs3k
 Zxt/Ul0mk5zLLE0ZXRKkOCwDgmqi30JhCJlxRzj6uFlgKPhNGRBl/tDv4
 jee6xgDOHsKuS90OVLM/t3GDcY0IguBvB1hBcrD1zXxmQw1tPzWM5CK2T
 qmcte03OqGOKoW5sYgIfdjdJde+5AuNHZuAq3vPaKPSOe6zFMNW/W1PAp
 bcg21DRF5fpTvZbxTt3eUd67iTcC0ZrmgLKnEeLzvolgCrBjIq+WFI5o3 g==;
X-CSE-ConnectionGUID: mywuupcqSD62s7oINTPYxQ==
X-CSE-MsgGUID: NmSoT3JaRVyVGEjvMRIyqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="21700101"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="21700101"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 15:58:00 -0700
X-CSE-ConnectionGUID: aXcQmWFvRPm17X6E3qmpcg==
X-CSE-MsgGUID: pZvIGxkTQxSjFk+kBSGP2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; d="scan'208";a="88025097"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 15:58:00 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 15:57:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 15:57:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 15:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yuV8UtmIupt4j9GZJqhOOZD2KkLnmEGUg2Y8Xmy9/3XSlmx9yPX5gSSm2Rr5bUCFyJD6y4NbVE6dY/yZq27gc89ZxA1niQXHgVSTffkFeN6kIFiChIPVLjvUjBe4tpMXm4poju4aLH6AVrHJGjHrEjgKfZlvYc98KkHg6tXsTtdnmHLQuMIyR/6++F/7gz8LKoLUx4zSFB1I4IrCTSGyRLzMpsucrnFzfOwAi54A7zQDNG5U3tTwe3eZm7+dMkKVSrTOw+J/xqQMSsUWE2Y79vFEXLy9Nw1RPglWUvBvDNcPxnfj4BG5s6LcJKbZip+Wu6BqmxT4OJwP+X2qcWIVKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nca+X2uYcm2ZfkdhJW4Vjgt4yDHN7yc0OxCvudaAd4A=;
 b=e0+L5G6A+mIYM23FcQdElOxXlfGi9Wcd0lEihyKRzWXlEpoccHpOzcYlNOtMy66rhK+A9bVyS/X9F1AU4UyksjD3KHa0TN0VgffZZNSZ5SUgzbhqJ1VzpO2VD5z+aghRsnCQLszf/o6hCUhTuABKXvTRuXR5sAZ7xAZv/UPZf3IGAOSlDovy703BJ0EqVvV7IBccSthzFM4WpaVBkWn0Vcs7T5c/BEFmYp48QSCtEPKOYY+rL9DlsUANOhYa9k02o3X6J2sPSzl3AADHR3UYmCHxHgZT+NisKb//TK5Tnvm/oFXDOuzA7IIGFGM1cesENxdTet8ABa8/WIUV0wpnlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 17 Jul
 2024 22:57:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Wed, 17 Jul 2024
 22:57:57 +0000
Date: Wed, 17 Jul 2024 22:57:06 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 7/9] drm/xe/exec: Switch hw engine group execution mode
 upon job submission
Message-ID: <ZphMQp7ZW3Xhhpwm@DUT025-TGLU.fm.intel.com>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-8-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240717130821.1073379-8-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0PR05CA0118.namprd05.prod.outlook.com
 (2603:10b6:a03:334::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f5269c-a844-44f1-4d27-08dca6b3e64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wl5Dl9Mh5sevNYd1hHwrolRjfLpgxIQNEqd9IyK87dF6e42P9ems15DmEZB+?=
 =?us-ascii?Q?Z8aPlFEHv/E05YFkhqyW1lveWq7Gl5qffZ5eMTm6T2lPbthHtlb8yY4OzjA/?=
 =?us-ascii?Q?60i5Addi9esGVf07XH9tK/C5UttXQyX4o6vVstpV1/c6oC9qzg27x7hrirIm?=
 =?us-ascii?Q?k36pgApbAjyQ64NJcToyFIr2JoIyQ/lNLdbTLZFNU8hJBG/dP6KJBfTM3fUN?=
 =?us-ascii?Q?9vS4zk8W1IINorGjJfFDVyxIHDIeuZfLY9xWBbww4txZ4iO8yl/6QvHfxmUZ?=
 =?us-ascii?Q?9wIo2JeQiTOEK1jtBj46WDMdPdnLxJtNW82jXLuapRdfF6rDg0g3wNxk1caE?=
 =?us-ascii?Q?jOapyOYuVi6XcCT0aROWemScJQmMBK0WrQjZUWYfWzM8hASzBrbTIjQ+I1ha?=
 =?us-ascii?Q?72Oa8/0pqJg+m0ApINs8B9dfDv+V24/B81HseBkJNz7kJcIlhEEgbn1AndhY?=
 =?us-ascii?Q?KFy39iFv95SDrXH37a5Cj/1nFDzcrHeIqJoAlAa9KwThGWmfQCiIvf1Vtu6n?=
 =?us-ascii?Q?Y1osWOG+zwtH1k7g7lPZOqdvEidg22gKhdCXolzvHbj45i4m5QocPhUVWhu7?=
 =?us-ascii?Q?k4iPi1G3yogqsGJITxpZ9bWuLWkpNQ/OFAiwuxLBJs5Zea2/GyLxMO5jBFGc?=
 =?us-ascii?Q?0Oas3AsPSKa0eQ1CS4t0+Ei92S6zjJKGk6pO4kSA0Ij56Pdp1OU1adeuE/t6?=
 =?us-ascii?Q?AfJ+1uKHEtle2QCb3oCQJWJiq49k/NSnRVcTDfYGeVCno2GF5pM/BFTLEjTs?=
 =?us-ascii?Q?XDKC3kh1CP1pRmcSg+0uymPvgQvDYpKrXl5tWVVFUJs5WO7H+xV7ukNw5ktg?=
 =?us-ascii?Q?ZnMe7ZTVfw6ocHdcw56d/y3ioK+22XBcbkqrmM+i3fwruUSh4N8SOl0KsMrc?=
 =?us-ascii?Q?js1WJxw3t7xtuTtYfIqZjlvaYw8gdg/R3kOLpGDVcawo7e/OJKLqQ/snz2MU?=
 =?us-ascii?Q?m6jbevt5AOGVbEh2pPcNoF7d6vIMtrNsUyxHCvzzdjyTID95XiXgyo976KqW?=
 =?us-ascii?Q?bVYO5D5pAgt8rCzQlfec/75INlMwiW46HrtIwoE0nRbxT3Gj/krl5XniIdvi?=
 =?us-ascii?Q?YvwsKDQ/m27qVWS+ZdULw42aWCz9o2EizwzjEkHnDIP2KYMvobksv/KeFYUt?=
 =?us-ascii?Q?JLKlHhyvmSRA4i520mX77ntIyL54Qdb9702+xicyu9G4CGf6K42PsLglwhN9?=
 =?us-ascii?Q?q77rfqYLjjlwfofucRl+D9JxqtfAb7qAjKovfyafyPhQRjHEOcSR71Hieduv?=
 =?us-ascii?Q?0+P/Lsm5nFGJL4NwKKxnGP1qGYF8FCqv624eRphLXLKfbnksHdh36kOwoSG3?=
 =?us-ascii?Q?x1qvf0o0UfFJFdKpGgUbp28052sRS5r2DWWRYAzxcM412A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OT5w2fsXOiKKZsznp4kaOLha9VObaCtWl7V+WiCoJ8KRw5ocFIFVYIipZjJ+?=
 =?us-ascii?Q?FH5XhTQQgOkaCwiZ77No+JIYPyXX7wOElAl4ccA6pq/CcadHYoJitND4/7UC?=
 =?us-ascii?Q?5SIsld2AI/jXXrwZ1DbsTyFRxF6XoTIzPBy1gzX4ROqdmaLIEeY0jgHTVmYD?=
 =?us-ascii?Q?PVfvMP6O+EQc3gsb6PZTM2QP9QwxZCxDGUYYbghpBOGizBe93rvEAfSgw2xe?=
 =?us-ascii?Q?PU7oQQdZX5cxinm2q4J18GjaNxgfSznhhkEenFrvTfbD1NIK2WNoyXlO8ukl?=
 =?us-ascii?Q?FeJ3wA/xMWlbHrlYeP/80w+pCTWIwFgB/Tv/bj41lVi7Fti5umwcuRVKEPRm?=
 =?us-ascii?Q?t+jsmeTLun1KijZtGJep5nSvNiuobcELVYQ21yjDrQsIoK5V8IQ66nPR7vZJ?=
 =?us-ascii?Q?9ABWX56oD7DnbQRH3GFHKUSqtRtloS5y1BUpWAt6VO6r0e6PBBeqxq1Rfa/F?=
 =?us-ascii?Q?VvWKiHxr+qabAq9izsRXw/jGxmITi0NcAwg9qcu6Vtp2cqhNsTrNZnrhGi5i?=
 =?us-ascii?Q?dLyawyQUv+6xwRqC9PAZjLrPdOlYIWTy/tZgLUCAlGkhUj4NCBH5AfYNYnyZ?=
 =?us-ascii?Q?K0EjAcwAK3XkQ0eolDXzePOgEqFgXdJ/fKAcV+pGsJ3zSMuQTmmTCJEq/Rek?=
 =?us-ascii?Q?jETTIvl7nkFNw1puhG+ER9/ArvZ6Qd5nVXwDmesrGzHUuX90eHNJmSnlnTpV?=
 =?us-ascii?Q?WbXb5B6NCmVg7tM3M+RqX/Sp5zUgzRhk7l8ydk9EKGaIlUuPq5JJEL9N90Z0?=
 =?us-ascii?Q?Shye8IPrel/yS6pOBJMHmJe3U2NIEEnMZDg9lSsl26w7nll47NnG9WYOJuxU?=
 =?us-ascii?Q?4jxGWzqowDj0oCzcEUkXb85pPGxM8iOatUe3viFXKiYmAKfBBAEUgFCOwwJh?=
 =?us-ascii?Q?2ZR/m6X9IVBMIN/kvRFbV5L4jtwBXUhSSRhqyjz1sqIHVBAzcbuvx1YxX5pS?=
 =?us-ascii?Q?OKbldgXxNtfvv7bCEQzVB7Tb9kzIia9nR4Qank5/6peHlNDCaW672JSZVSNv?=
 =?us-ascii?Q?K/ZbfTtd5FwQK4MhgVXfpb/ms0M918JiBHidHFx6HOjVb2tzBXp0eEs+MAw6?=
 =?us-ascii?Q?a3AtzacUPpmrRZJtI6rprwtzEh9hp5SKG0Sa86dVl97Ii1t+a48AMctHwKIp?=
 =?us-ascii?Q?mcvAFr2Kt699W53fsj6AFOdlDHL5UNpxDU/DJppDUJ4csx1tNXGrLR3Uswr7?=
 =?us-ascii?Q?ADx2lIlSmfNDDNXIIdasSMIDY/Tlzksf940V+vAMf8z8E0FjzW/cBNJCTGyr?=
 =?us-ascii?Q?3wFRGSrse0hh05ayseRSbhze11v9vqqElQj+JwId271kdd0Om+V77meAAOOf?=
 =?us-ascii?Q?4GDyawPVoJJDE3H9ypt5GbveXT6sCSfUFzgKet+3ZbxzQccfof1Fz6nNv0TY?=
 =?us-ascii?Q?gICcWUjgmY+I0GoBakuUbM5Hmoxg0Xj5cbux7sCpGVm/MuQYKuHRsZzg2z9F?=
 =?us-ascii?Q?ReEuRGmWXm6hAYD/ip+S2+HT4aBP4W+fYOGUQGnpqGowynzjuBMvYpWLTksV?=
 =?us-ascii?Q?6a9WJM55fnLbnfumFMHnP8jEGCdJyT7BkAy+zY3t51Sco1XLH3MSDheb2xNi?=
 =?us-ascii?Q?SKiFrc+QMptgebJT56gRK2yDCDjUYCLGgc1Km3mKsk/R6ITH6z1iDJYQ/a+d?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f5269c-a844-44f1-4d27-08dca6b3e64b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 22:57:57.3782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TS7kA2YpAXochJPMqOmxmqx+Sxe5/Kw/U5kqt6XXFFz1XbGx2XQs8NWQfcLuKV+aNtyVxAB44f0vo5a1knA/VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
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

On Wed, Jul 17, 2024 at 03:07:28PM +0200, Francois Dugast wrote:
> Update the current execution mode of the hw engine group which will be
> used to run the job that is about to be submitted. This triggers the
> required operations to ensure mutual exclusion of executions modes in
> this hw engine group.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c      | 14 +++++++++++++-
>  drivers/gpu/drm/xe/xe_hw_engine.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h |  2 ++
>  3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 2d72cdec3a0b..35418b5d1f5c 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -14,6 +14,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> +#include "xe_hw_engine.h"
>  #include "xe_macros.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
> @@ -124,6 +125,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	bool write_locked, skip_retry = false;
>  	ktime_t end = 0;
>  	int err = 0;
> +	struct xe_hw_engine_group *group;
> +	enum xe_hw_engine_group_execution_mode mode;
>  
>  	if (XE_IOCTL_DBG(xe, args->extensions) ||
>  	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> @@ -182,6 +185,13 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		}
>  	}
>  
> +	group = q->hwe->hw_engine_group;
> +	mode = xe_hw_engine_group_find_exec_mode(q);
> +

So you only need to call xe_hw_engine_group_get_mode if in dma-fence
mode as LR submissions are allowed in the suspended state. They are just
held in GuC until submission is enabled.

> +	err = xe_hw_engine_group_get_mode(group, mode);
> +	if (err)
> +		goto err_syncs;
> +
>  retry:
>  	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
>  		err = down_write_killable(&vm->lock);
> @@ -199,7 +209,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		downgrade_write(&vm->lock);
>  		write_locked = false;
>  		if (err)
> -			goto err_unlock_list;
> +			goto err_hw_exec_mode;
>  	}
>  
>  	if (!args->num_batch_buffer) {
> @@ -324,6 +334,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	up_read(&vm->lock);
>  	if (err == -EAGAIN && !skip_retry)
>  		goto retry;
> +err_hw_exec_mode:
> +	xe_hw_engine_group_put(group);
>  err_syncs:
>  	for (i = 0; i < num_syncs; i++)
>  		xe_sync_entry_cleanup(&syncs[i]);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 4f539711357a..e6c755a04fd8 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -1345,3 +1345,16 @@ void xe_hw_engine_group_put(struct xe_hw_engine_group *group)
>  {
>  	up_read(&group->mode_sem);
>  }
> +
> +/**
> + * xe_hw_engine_group_find_exec_mode() - Find the execution mode for this exec queue
> + * @q: The exec_queue
> + */
> +enum xe_hw_engine_group_execution_mode
> +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
> +{
> +	if (xe_vm_in_lr_mode(q->vm))
> +		return EXEC_MODE_LR;
> +	else
> +		return EXEC_MODE_DMA_FENCE;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index fce0adf6a7c4..6dfebb18cbb7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -76,5 +76,7 @@ int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct x
>  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
>  				enum xe_hw_engine_group_execution_mode mode);
>  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> +enum xe_hw_engine_group_execution_mode
> +xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);

Same comment as previous patch, consider a standalone file for
xe_hw_engine_group.

Matt

>  
>  #endif
> -- 
> 2.43.0
> 
