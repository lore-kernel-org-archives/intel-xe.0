Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EED8C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 23:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A78B10E092;
	Wed, 10 Jul 2024 23:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3myKVmA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C951B10E092
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720654952; x=1752190952;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oYSANboo/o+KS8XBty1qx6VL9jmV1pCqs4GnvsLqyRA=;
 b=m3myKVmApoVx5KtZQHc1oxUNhohHj6a+kWpA0fXE5+aa/SrqyNH1XAMG
 r/4CstQNmKiWXU/r70hWpOUCnpiOQ4jO72vDP7olUPQBrXUbdh/J92yQd
 GWVnfAPCFXibHlzb9qLVvthEy/105+rmMkG7TQjKAvo47+kr/Gf5GxfK5
 BMPAfZwhVH2XiMoapYke7bu/OLIhzZnYAg6lwmvGtzbK4TigTapV6YVyj
 VpbyItfyOHqdOdqjDorkguSnD5JTOgftMDRRtTnQhBvtEh4P9z8IWy5V+
 bKwxDMOcgIbM16+iki8r6CzjiK6ZQgck6yzXRfiJv3MBV3FTbvVO95c+k w==;
X-CSE-ConnectionGUID: DlyrnK3WQhmQSUqqG77P+A==
X-CSE-MsgGUID: 8TpBznYvRcezgO5kVwluTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="18217408"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="18217408"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 16:42:31 -0700
X-CSE-ConnectionGUID: Qhf+uVebRMiXBlIgcSuRtQ==
X-CSE-MsgGUID: JPWP+vI3S9a72M+OzLlFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="53194906"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 16:42:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 16:42:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 16:42:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 16:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYhmvG3jkj4kvAPR8eH6c8LuK9Uu0cx1shdYHH7Q61Kp1YMpVIZSad1qx+7qTVEl6hnBLX4cpfjKU3K9+/qZJtf+bQpc1ij/KQJjB5u3PnnPr49+orC+G58SBtrphGLYnb1eQPcJPWCXKhQwnD9zAgoVn/dyTD8NG2+1C7t7OnRj/1A08LsDNb2kJFa9aQRQ0a64MQ5CXXOmbcxCMEv8kkjjaOkX7pbOzeyBKVLKNXW2KxaoVEVnShSsvqQ1wv60jNIyUdtTnjpLhDrvL0SBxI0hUQFPUpEz3dFMH3nu1/NI+dlSPPN0dbI06/qpTZzC8GiwI240T5L6Gz8d0o0IHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oR5agyv72TtymCnNq3SfSEmZthKqkX0mOn4fFX4l3uA=;
 b=R5ILEhp6Gfoh7fWXPuOvz9eIK07Fz2yVENM1csxT0vyETmA/cesArYUBgcsEQ0pmeLnS0TLlA93LP66U4DlhSrj3AYVoPwiql+j6wtzTAPCuZqFGX5EkG64/5uh/F9Y07qi/eHTk02tPUlo1/BTUpYy0O+NSHU0S+6iSq3yGIqjJamldfxAb63Vdm2FRLL1TAsXzVkiwUQuGoOVe7HcP6yzs7mgVIoXj9zbbPB0WhGfkAc8jHyyhuoIPCa3j33U95dUTV13CuFDA6qJ6E+sVrer3vBsGOEbNrBbs8HxcRxddQbmb76e+t9QlyRn6pSZazko9cMx/1RizmE2cLdrbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5103.namprd11.prod.outlook.com (2603:10b6:a03:2d3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 23:42:27 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 23:42:27 +0000
Date: Wed, 10 Jul 2024 23:41:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Add process name and PID to job timedout message
Message-ID: <Zo8cMyjffKq3mYJo@DUT025-TGLU.fm.intel.com>
References: <20240710213149.57662-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240710213149.57662-1-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3b66db-6b22-443a-ba9e-08dca139f4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YSLnrYAQHvBZN4H4fZvm4LeQm8nbn4/XPMkDxYv9R/NgJDMScRDnqIlbTe?=
 =?iso-8859-1?Q?T6e4rEPAF8ddvsvojCtxVW/IdUVDHTE4/qtqfGEJR1xL8HbA+j8hGLInlU?=
 =?iso-8859-1?Q?Q2WaJ2ZzwQxhPOsnFySVDmcsRbLmcXmRwOfaUC8yITwIzVXJ/WjtYmXvw6?=
 =?iso-8859-1?Q?mf1D7PtcM4WtC54NU74gNmdRxW0ryJ/fAqumivxogQDh0mZAK1SL3ROuEQ?=
 =?iso-8859-1?Q?UdTRKCIMPDdUfcQygbabG1nZyP6irK0w2GyBiiH0ZoRwSUBmvJGm2R3unB?=
 =?iso-8859-1?Q?Wg3OHke2oUMiMiTKccqDCvBjKz2I9cBAvUa9VFSJ1Gm211bDlVWdZIw5v/?=
 =?iso-8859-1?Q?+E6Rrbu3SRqgtQLpq2736XpHNt/H3M2SUI7X7WizFiGwUEwrOUJcGynF+3?=
 =?iso-8859-1?Q?EBpAdfdoe3Fp/ln5qW/Dr9vYaH4UYmOhKIoa/P59PYh4PzYpAUZsIJl16Y?=
 =?iso-8859-1?Q?wxVFlleTLwzgpcHkHmBxZ53b7cZczQTqXrKN0EFAQCv+K/nCjh3CBo9qcB?=
 =?iso-8859-1?Q?OAmZETEt/IWzQ8NkCBxsZWoa62HAUdoGmokltKfP6Qc5Vi0r9D3CNNVGG1?=
 =?iso-8859-1?Q?gfErJi2tEKFj+p5LVO7IM5O6oivSjWdqbPuMiKnA1ZlylAgVhJv5wvc0a5?=
 =?iso-8859-1?Q?pFd0Ou8DwxjDvtOkq9uy8isZsVvLfsgGM/puOqkpflWsh+Pq++dPLv/Z3q?=
 =?iso-8859-1?Q?5De64aC2UIxNh0vqWp2/CnwOtckpn9zuQW5HhJa9JkRYy4lr9fb36yAdYt?=
 =?iso-8859-1?Q?Md0AzKeGZ87ssx848XE3Sa1frzuM1UwyaZir9oNJ1niAi9RwJfmY1u0iOn?=
 =?iso-8859-1?Q?WyfsVrOj32a1L1CnJtGgzqkSXTOao5+f5FQPQjTk8IffxSCzDfpN+6Bz9f?=
 =?iso-8859-1?Q?LVxxs1Hbh9x1jIZQMl3TZAoCy16YWb6+BzTJL1x+pu5ZtS+9Z36+eZktwk?=
 =?iso-8859-1?Q?eQTl+GsVbaDmJ+SHqA2qqfh2wlwbRJb2Y5lvvpb/WnksBr19LQFcEsSNWP?=
 =?iso-8859-1?Q?UxZBOoONbbSL6ZUZHSOmB+HFqYThWRCj1NnlifechYh2ca3wkOHxQWP/xx?=
 =?iso-8859-1?Q?7TAoLLbwkuo/OGS8FDfA/GTDi97OAC7S/O51D3PZrCk3eQKPAiMC6Ai3EM?=
 =?iso-8859-1?Q?wl7WaJi3ysO3GaOEi2am627l3EKzuHXkkqLs5NlDxnahWlUpwyz1GkU+qj?=
 =?iso-8859-1?Q?FmTrzrWmo3c0ZHDgRKU1V7VQgKZcAk9+eQt5a6QeAPSQCvQkfwMUlxLLWH?=
 =?iso-8859-1?Q?lHISeN5rDVnkBXtF631u4v2K8KBGJliikt6LYQhugbIXfPGLah3vAagbCb?=
 =?iso-8859-1?Q?UhobGwYVszZo1cj+mvzsjlEY8XJdEBh45hRJUuLZb0hJoVJo0IhiYOsbW8?=
 =?iso-8859-1?Q?FD7B0dUGPv4pdm6Fa36/r4mwCUXz14aQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Vg2lgk6TGrPGbSgb5YMwBiuwrg3GUVbnc3oC6v6T7G27+Pwqa5A3vUQ9cW?=
 =?iso-8859-1?Q?Cbz2yFRMrkDU08huFg0O0oaBKm1M0qJ92JeJpFB5P/uCAqPtdHqO4d1HhS?=
 =?iso-8859-1?Q?cWzMNOeEBmCGLnzki8WdGV/yJXNICV8FZwg60wXvgyMcA8dRKg2IG34hl9?=
 =?iso-8859-1?Q?Z50rwSFuk6iCG+q/OXwkAfdZPUMf9hA+yryUY17jS52idkqzqS6VTh9f7r?=
 =?iso-8859-1?Q?v5o8yiapmY+Mgmz0UOE6KQEYJOPz6Y/6jIIJN0I99Q1BKxvb/Rt3YD7Zwf?=
 =?iso-8859-1?Q?fjUEl5G77f91AslRiylcZqsZqJSzRkLMtbZAgVkywrj2Zb9O93SrIdJP8j?=
 =?iso-8859-1?Q?TBlBA03wXgE5kPc/6HIEk5pjKaPIuNSo9hSBBGg4h5YUZnNAQsVfbMozgt?=
 =?iso-8859-1?Q?kb/chj6AS7QDryVYXmbozm9RZvmxRHRCEhQQnxP+lw26Budakq4JIyYYZx?=
 =?iso-8859-1?Q?RBa7UTYgSAK/AgbGQTdi+b47k0wNgXIPahWtKwOQMHCXQERUexNjESEfp6?=
 =?iso-8859-1?Q?r3B6RwgadP46jOIuQiFiKcCsCHyp7b6PPZ8NKL2R+NTkocQWDLf27JtMK7?=
 =?iso-8859-1?Q?41A52xyDWYq1nxN18CNgwHfNNWGaWtK6gjl2aTpLzrILyt/uELCGMYLNoN?=
 =?iso-8859-1?Q?gwvSY/3fao90YOTT/bO9AQEtH7lHfqaxVJ4454IDL0jEMYjjfjKe2F78q3?=
 =?iso-8859-1?Q?+1+bSSwwwmbPr+QyTKTwD5hY2PFySHNJv/1ex86jDaUf83IJJys7pFP+dU?=
 =?iso-8859-1?Q?HzGjt5f3NpngkR1x3WEIeF4vOnoCxZFc+dOEA4dvBmG5sRY8bHcUX+BHz6?=
 =?iso-8859-1?Q?fTnTJeUfyRwfbpZDQRt03vb2pQF83OIdQHYb9NOp96OH8QJm2r/jftBQ5j?=
 =?iso-8859-1?Q?ughB8wvoXbExqB8CTIXFqUi3ovooKyCuY1Pe3SSfa13uyWJm2HIt29RYV6?=
 =?iso-8859-1?Q?v+NnICqBZAVRcpeXWnWCVI65rgOdomdgh7xrgWjlbD/suT781wxwayOxsA?=
 =?iso-8859-1?Q?/eJirmtbbtuGUfMcFsh1n+8irSTTlfAQpvZXqYQ5me7U+wk4295rPipFbO?=
 =?iso-8859-1?Q?NLkKG/VXG+CFvW2EToIgXF8yYbJ9ewbZH1Cc1Yi9S3lJ6rwMJQXGGVZE3i?=
 =?iso-8859-1?Q?ue05LGoa3iAj9nQRLHN46Isj0rvfvQ3oIzFI7XKE2cMYBuuXJ3XAJj9DxM?=
 =?iso-8859-1?Q?ihXl5c1tuU4GA0W7JjbqctPDXpN3WFFQW02IWkhN0eRRbKOtwFPxFg5h5W?=
 =?iso-8859-1?Q?igX+fQ3QJeJVxccyYZmk721hwLkNRRwWiliVAghxjAoQzgRC6h/X23y08F?=
 =?iso-8859-1?Q?TC7EJqRKLP7UA0uQbb670BHiD/seNjVeQPRM0QIZiskRbX0LMpZTg54+OK?=
 =?iso-8859-1?Q?usaOG4Dlcpitvo0D592WlK/q/RVAJlQYeHAanX9c/VrFCqZL8cPeCdf5db?=
 =?iso-8859-1?Q?5mquRIvlOZTm/II+nPqF/S7rSvPFQ0GXnV1wjxtkfeqvHjHYBvU9IGKPve?=
 =?iso-8859-1?Q?m03DZhEATYVCiGn8NwlLBR3bLe080nMb8YSzjD1/63z698sEIGoI59ObVp?=
 =?iso-8859-1?Q?R6zcBbGhNDECuY3/tXnqHhwWi9emEyN75eatujNx14naly2s4nwlhIQFnI?=
 =?iso-8859-1?Q?a7tf7o0GMnPTQCI2cFxCWFxVOhealROPrn4ny4ZXFa48qWbYBqkwPz4g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3b66db-6b22-443a-ba9e-08dca139f4c7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 23:42:27.3132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKQqerYBV+AGLTS0yXkew7no9cnQ2BlIFeeqgFGzWZslVHvrA6uNXzODZkSXfQcgdtIEAR11B02DnWGaUF/09g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5103
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

On Wed, Jul 10, 2024 at 02:31:49PM -0700, José Roberto de Souza wrote:
> This will be very helpful for Mesa CI, where it uses PID to match
> the exacly test that cause timedout/GPU hang and mark that test as
> failing.
> 
> Also printing the process name as it might be relavant for human
> readers.
> 

Always for adding useful debug info...

> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 6392381e8e697..8604055271156 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1060,7 +1060,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	struct xe_exec_queue *q = job->q;
>  	struct xe_gpu_scheduler *sched = &q->guc->sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	const char *process_name = "no process";
> +	struct task_struct *task = NULL;
>  	int err = -ETIME;
> +	pid_t pid = -1;
>  	int i = 0;
>  	bool wedged, skip_timeout_check;
>  
> @@ -1157,9 +1160,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  		goto sched_enable;
>  	}
>  
> -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> +	if (q->vm && q->vm->xef) {
> +		task = get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);

We do something simliar in devcoredump_snapshot.

Would it be worth while to have a helper like this?

struct task_struct *task xe_exec_queue_get_pid_task(struct xe_exec_queue *q)
{
	if (q->vm && q->vm->xef)
		return get_pid_task(q->vm->xef->drm->pid, PIDTYPE_PID);;

	return NULL;
}

Matt

> +		if (task) {
> +			process_name = task->comm;
> +			pid = task->pid;
> +		}
> +	}
> +	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
>  		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		     q->guc->id, q->flags);
> +		     q->guc->id, q->flags, process_name, pid);
> +	if (task)
> +		put_task_struct(task);
> +
>  	trace_xe_sched_job_timedout(job);
>  
>  	if (!exec_queue_killed(q))
> -- 
> 2.45.2
> 
