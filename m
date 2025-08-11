Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C263ECA0EC4
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 20:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAD410E30F;
	Mon, 11 Aug 2025 20:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cVFNKZ9k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A7410E30F
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 20:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754944839; x=1786480839;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JclIJvynr71nBLTHlkm7dKDMhNXX64r2cDJ9m7MeWJI=;
 b=cVFNKZ9k3FOnn+5wuACJZZxt82omSv/hMyeqsJYUp3Ch3OXdfZUugw7Z
 0S2NJfr3FKXnTRo7L7upAGJ4IOTwMm5FWeGektdHho+F/WlN1I7H3aszo
 X0xqh/RqDdqsYf4ToSEb0N5H/tYv4abVMH7Gq6dNcqb1eKEAtKmc37xsY
 fmS2OPqgfLKF8kRtZCbqam9OENlgc4Na1/MNADjmMTyFAdnH/FjvieCiN
 XHplrul6D4osK/nICfkBXi7Vb1eOuWcX5Y1S1SjxvvvLVXwrSx8Cu+9pG
 DcHbU2YthM6bNyl9sBnqJQvtJftrw/J3hiLO7RIKawbLa/rqdZ2y3ktk7 g==;
X-CSE-ConnectionGUID: rp4eQ9w2SNanBogqN0oFpg==
X-CSE-MsgGUID: Z+RSLYzyQNuNGVxR8uAK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57289504"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57289504"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 13:40:38 -0700
X-CSE-ConnectionGUID: aJUGpQLaRGyArGlEuHtrVQ==
X-CSE-MsgGUID: 5QEXlSlJTlK6Sdf7uu8WKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165634042"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 13:40:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 13:40:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 13:40:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 13:40:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdFNQ6pjQnqvwhx7TfcuVzPAx6J4K/WD9mHvC2VAjp5nki1KN2BV/Q8Y3bNv8EJi30441NOs5zjHx1okEXjaM0lfSNtmGKxhFe2ws/MZXspp+aIN9moqIUtP6zBZmTf36FZRdCF9i7rrP+u4tGc1I2wgZ/WZtEHwKG4nPchoRFyOQ9KH65CZSSv5Rivu4DSljqYJcg7pNN7Nb7KWXWA0zSW/x47Yca4b0VyH10fnt6BGGE98iXdzKZUCVkytVnrVx4JwI0A+pPAqnSyhzDih+U4SXLputWl+0BRzvCnTQ08aaTsWQkiRL3Jre9bp5bv8O/SMXucfoXissOQkG23hkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giy+GaFHH0qzX0Ae2B31FbeEczjZv9cfcgeCVNqLw+g=;
 b=PfC+RXejj/D1JzOSN4qw211tD7EWmz3krR7nTmJpqBFfemfNuJkQwzJPLGAY2Q0dYAZgMhEsjIcPNcZnQQTdvblzxZJXur9auWGhwy9qc2RU96KAbeHqp4j6D+YFWw1hZWepKf/SjM++LX/OGQzfKY0CmbwdokJK1nwG5ThYxjnbdBxBewPZSW/FWIBU0XF3nu0WenMmNtZlcIY5TFk4ABzDsOs8blAOgRVtPMJ9IdVNtAKJQC+3HJZVLo+Zpiy+lX77WUKQU1lWDs84rnR09tj1XpAIw3OXzrPpeFmgMyv5a8rbF01SA/lFDfyDG1+zkE4/lp0LAxLrbAfcQm1A/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 20:40:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 20:40:34 +0000
Date: Mon, 11 Aug 2025 13:40:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH v2] drm/xe: GPU frequency tracing support
Message-ID: <aJpVQB3tYc6OUnae@lstrano-desk.jf.intel.com>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811083414.3863103-1-s.sebinraj@intel.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 557bfe24-2673-4a32-11ff-08ddd917522e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?cqIjRvWCDbqBaUoAn1w3TH+bh5xZId7uvpcG3+o/2f2zxipFUBkBaDF+Es?=
 =?iso-8859-1?Q?f4WCtA72T1KAd4pszjIXztNaFXRDpzNm+bsum+gPNJeLSxNfSaFZEPw9+L?=
 =?iso-8859-1?Q?wM2vEDlLL7bAsANW4MhrcZWwR59RdCG6Wdh6/9CMSWvOUbIbSwfYFmjv9L?=
 =?iso-8859-1?Q?qTf/f6ohEkSNf/ErX5eQfW4Z5J78PKpBIpKWGmaZSkV54pW/x7Clzk0Y3N?=
 =?iso-8859-1?Q?sgprxlAA8qogecdHT5NBm9sajI//w21M/68N1XHQCnrf0pDrk66vCWmrJo?=
 =?iso-8859-1?Q?ZIkde51b1FlwdCTqPM89vJVzximF87dChwD5ixlXAREnGpkFEy9TuyXGuA?=
 =?iso-8859-1?Q?KFKcNhYExffySl4MVbQ/W/VElolbLW3aj9NC9OnwrdVvbUxnRlhUatYiLL?=
 =?iso-8859-1?Q?F78AGzlI8LG74ET1LshKrLe7HIjbY82DUztcPNn7Q2zG30iH3hG2Mi3qY2?=
 =?iso-8859-1?Q?OXil6I0RIpa0DGv8cIMn8G3VGdVZqRQ6c7p3BNN+0sLFdpdWCI6AF2S6Vn?=
 =?iso-8859-1?Q?dzvb8I6AapRmGFSBxX2dE8dnazR0gtyP3GlQImq2qHqrJUiLjxNs4fqk4E?=
 =?iso-8859-1?Q?P0RqSLhdIjCrkTcGcNpYEVtjqzHFQQQd5GNOyTnzDLzl9Kn+oB81xlN2kK?=
 =?iso-8859-1?Q?YoT/0T6LIaTX2leqH7bGHD/CAs2sx403zSlxnzsVLFbuUS7rFJqU4UgjwE?=
 =?iso-8859-1?Q?HTPHuYnFWOAKM9IvUUzU1GQdMFMDc5UrRfTX7gtxgSx/54P7aed2+F25Ma?=
 =?iso-8859-1?Q?EZPdzYFlXRNCuHWgB17fdqBWmvc7wc/ppgn2h87SK+7SwOLMHjS41tWrjo?=
 =?iso-8859-1?Q?7v1dXZEcukBU/fhYNpedA/qLGVdI2oOB0Cp5edo1BFvDj6xs/CvqvqD3L9?=
 =?iso-8859-1?Q?rEAoUrtKpfWHBaM4yzOJLc7Z8bRIw0lkQ3obpe2u1DGjK3JUkLYG7Y2TwK?=
 =?iso-8859-1?Q?vIOVcjY2knlzwEOUEZzXsSwTKKEFh/I76b5qFOFZPwLEOuZiMEsEFZXsxe?=
 =?iso-8859-1?Q?nhJ8sc7k/Gcgmp1sicJgGdTKAy2DFUroqMP9mM7/CegX7SgtUkJf/D4BB3?=
 =?iso-8859-1?Q?boHaniM21sJnma0+R8RblgGO34wWVIReiXu+E/ASprr4iErH0HDCTeH9PA?=
 =?iso-8859-1?Q?YCiyqvqFOZQ+dkXFrm7c8VdS8RnY67+94bpLgbIbzXWZ7UUkcuE8AKB6IH?=
 =?iso-8859-1?Q?ewg6fWt44ZkK+Yq5HLbtlDeIL8lXfRLvaB2wBlrG3UVfMIWyxHu4JHAGF3?=
 =?iso-8859-1?Q?YI8sawxpd0mQZxzBx12PhowQ7w5NIkHY8Yhzo0B3FoJE1f3lzLp9E5Nuoq?=
 =?iso-8859-1?Q?yZtb2YvoeQptz+pVV1UPbed++oHmj6DxcaHv4xsEnbVkNyqS+3dsr1RhvU?=
 =?iso-8859-1?Q?70cCM1RbWLSrvCzL67X6RoKhDHKLhXvgCpLUnfvcd4AONjyX0F1Aw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yDxbS5lcGQh60o7EiZ4zgtmwxc+DbatN7w2su9mEhf+8PJcXukxAuVLdsi?=
 =?iso-8859-1?Q?vXVNzcJEIHxzmonDCRjaSasEkSPI3PnYjlGxhlvxZ2tLtQ5wh8RJfiehzx?=
 =?iso-8859-1?Q?ygTrC7GJ3dRgyUNld+NMS/yI6IHSqLfsxINAXmTI6Bx3TNDcO6kxiA0dr6?=
 =?iso-8859-1?Q?XR3TzkDgNRhiNHSg6BrGZ4dKZ/ikq4ds1xHS5f+nfg4kGU9VugxW4MYNfN?=
 =?iso-8859-1?Q?Tyf8EFQ65YYMf+20p+BpTFfYp9e9MxFH8JB2vwUTWJ5VB7MFWL28LXh856?=
 =?iso-8859-1?Q?KRENoWBwR0GiKGEaL3LvTPixrnbdr27oPjNHEZLkm8xHXUBiMf5ItBUhX/?=
 =?iso-8859-1?Q?kq/ICGi65NkSMYouCiK4deR6fZK8p0JJCe7CGMxqHfk7BUDUnhYe75VuXx?=
 =?iso-8859-1?Q?BwJKA4P7BACcPaf4PZQSK0daI2jPXBGks0xiMZVR7MPuZyOilDLBRM+ZGD?=
 =?iso-8859-1?Q?piQjH3YK6Gjf9mPiFU3qXg6pFFhWUqgWVRojazCEG3uCMCLwA8buL3h9l3?=
 =?iso-8859-1?Q?tbOU5KZLbEWFFy7KHa3SqCxSU84biVmfYUovjOuAT1w8QsPG4SE8kpHUY+?=
 =?iso-8859-1?Q?4DhQTXylathan95Jazt1irxKpa0eE3hZ6fgwPdZff6F+n+MdFYTmH6mzU/?=
 =?iso-8859-1?Q?iPnvGnOF0Tt0plG333l90S7LblfePQdh5A1ZRP1pxi55/u0gPEMMw5qR1m?=
 =?iso-8859-1?Q?90Zjf1ovnoz+AOFnGOvld2BGOXsNlqWNwnIRHEEBAvChOW7sn1GqYI8y4B?=
 =?iso-8859-1?Q?sI1bZNPblbcTQk9os6x8qpLnfXSqcIR3aFOEVxqnVztQ06swZ3CNV2CXN+?=
 =?iso-8859-1?Q?yg0n4Iw/g53ni2UD4YC8oeC955C7I1i25yz4JyUqE4dENm5BM85YPzKvYU?=
 =?iso-8859-1?Q?ZYDMEOlMt//HaJ/ZpJKR1xEQPXxNLc5xmLecblXfUZ3S2zcILgnpYwH9Zg?=
 =?iso-8859-1?Q?eIbLnZNnGPdE1tXlDcGsTmoDdDrJ6KUvxxD8XVNqd2sQhrHb+081TN1hcv?=
 =?iso-8859-1?Q?+yO9/KReJWQVNFhQK6v6JmdpVLQgnvzq9+gJ+BkfH6T+3cnHl77oMWYroB?=
 =?iso-8859-1?Q?9LWZQlgTZXBuTmVZOiYeKVHpfIYvHr8H0P7ktWpDXn/mt2BBqpWwyPJznE?=
 =?iso-8859-1?Q?O91b7bZhSzeUTf5e+MnmSiMpMl0NFtbZqZoBdBkrdkS5+Mi94LD4h/CRfk?=
 =?iso-8859-1?Q?FfFgf0zVdAcYAHCRsmCbyF8TW9WPHdiou99Od2jyH/STxoJfS/7umSgIJN?=
 =?iso-8859-1?Q?Ey1smW0AdLnFiO8oOVBxS/ATXqma2EYebc5CNyCLI1uPxsgRrp1zpBtUOL?=
 =?iso-8859-1?Q?8LB/emTHcBWGBUbYRDgKIoFjx+tjtDJ1gMVPkd5YbFGv693qABr5YeMAFg?=
 =?iso-8859-1?Q?Z86gK4pQBqeVT6myjjqoAprhz32VXHYOzyFXod3TKgSBmJVHF3eoGzlnTD?=
 =?iso-8859-1?Q?cIjw0cNG1ckG/D6PXupMzS+1fbrHAWb/06vGde5NxBkLulaL64gkU6B2Su?=
 =?iso-8859-1?Q?VcnJvxORzFFzfpkxpb6NsmQwPNwNnxiQ7XbyTMRjRXWGwZDJFP8b5WNgwI?=
 =?iso-8859-1?Q?1AgJGAs4O/5cdZ7nDNW7+i1k1UZW/gK7R20x9rasjFX6Mh/mn9KX8DmHxa?=
 =?iso-8859-1?Q?wqY1BVehl4Oc49iQwA58jqsdd0NfNO2fYQ4HhTYhldoEbvhY/kFJzvkA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 557bfe24-2673-4a32-11ff-08ddd917522e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:40:34.4560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2OVbcTdo3WLIgF2gchZyHN4MnwmB+lpWmuuJFJ6MJKKTjrfgig3IhiCahKVzHJzkrbfLM7KeOZxrEOKoRFO+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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

On Mon, Aug 11, 2025 at 02:04:14PM +0530, S Sebinraj wrote:
> A periodic GPU frequency monitoring and tracing program for the
> Xe driver. The implementation provides periodic sampling of
> GPU frequency through the Linux ftrace infrastructure.
> 
> Key features:
> - Periodic GPU frequency sampling with configurable intervals
> - Immediate frequency change reporting via tracepoints
> - Integration with Linux ftrace subsystem under 'power' events
> - Per-GT (Graphics Technology) monitoring support
> - Dedicated workqueue for non-blocking frequency sampling
> - Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
> - The monitoring interval can be configured at runtime via the sysfs
>   (default 5sec).
> 
> The sysfs entry is at:
> /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> 
> The tracepoint is exposed at:
> /sys/kernel/debug/tracing/events/power/gpu_frequency
> 
> Format: {unsigned int state, unsigned int gpu_id}
> - state: GPU frequency in KHz
> - gpu_id: GPU clock domain identifier
> 
> This enables userspace tools and system monitoring applications to track
> GPU frequency changes for power management analysis, performance tuning,
> and debugging purposes.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig                  |  22 ++
>  drivers/gpu/drm/xe/Makefile                 |   3 +
>  drivers/gpu/drm/xe/xe_device.c              |   7 +
>  drivers/gpu/drm/xe/xe_device_types.h        |   4 +
>  drivers/gpu/drm/xe/xe_gpufreqtracer.c       | 292 ++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gpufreqtracer.h       |  30 ++
>  drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h |  48 ++++
>  drivers/gpu/drm/xe/xe_module.c              |  12 +
>  drivers/gpu/drm/xe/xe_module.h              |   3 +
>  9 files changed, 421 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 714d5702dfd7..d9d07ec69875 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
>  
>  	  Use "!*" to block the probe of the driver for all known devices.
>  
> +config DRM_XE_GPUFREQTRACER
> +	bool "Enable XE GPU frequency tracing"
> +	depends on DRM_XE && FTRACE
> +	default n
> +	help
> +	  Enable GPU frequency tracing support for Intel XE driver.
> +	  This adds an ftrace tracepoint that reports GPU frequency changes
> +	  at periodic boundaries (default 5 secs, configurable via the
> +	  gpufreq_monitoring_interval_ms module parameter) and
> +	  on direct frequency change events.
> +
> +	  The monitoring interval can be configured at runtime via the sysfs module parameter:
> +	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> +
> +	  The tracepoint will be available at:
> +	  /sys/kernel/debug/tracing/events/power/gpu_frequency
> +
> +	  Format: {unsigned int state, unsigned int gpu_id}
> +	  Where state is the frequency in KHz and gpu_id is the GPU clock domain.
> +
> +	  If unsure, say N.
> +
>  menu "drm/Xe Debugging"
>  depends on DRM_XE
>  depends on EXPERT
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e0c3412a757..61d46cc4dc25 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_sriov_pf.o \
>  	xe_sriov_pf_service.o
>  
> +# GPU frequency tracer
> +xe-$(CONFIG_DRM_XE_GPUFREQTRACER) += xe_gpufreqtracer.o
> +
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
>  xe-y += tests/xe_kunit_helpers.o
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f..88198ceb519b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -34,6 +34,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_ggtt.h"
> +#include "xe_gpufreqtracer.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> @@ -896,6 +897,12 @@ int xe_device_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_GPUFREQTRACER)
> +	err = xe_gpufreqtracer_init(xe);
> +	if (err)
> +		return err;
> +#endif
> +
>  	err = xe_oa_init(xe);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f..0634dbbbdc3f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -35,6 +35,7 @@ struct dram_info;
>  struct intel_display;
>  struct intel_dg_nvm_dev;
>  struct xe_ggtt;
> +struct xe_gpufreqtracer_data;
>  struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
> @@ -529,6 +530,9 @@ struct xe_device {
>  	/** @oa: oa observation subsystem */
>  	struct xe_oa oa;
>  
> +	/** @gpufreqtracer_data: GPU frequency tracer data */
> +	struct xe_gpufreqtracer_data *gpufreqtracer_data;
> +
>  	/** @pxp: Encapsulate Protected Xe Path support */
>  	struct xe_pxp *pxp;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
> new file mode 100644
> index 000000000000..07eedfb79e93
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
> @@ -0,0 +1,292 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_gpufreqtracer.h"
> +
> +#include <linux/workqueue.h>
> +#include <linux/slab.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/moduleparam.h>
> +#include <linux/types.h>
> +#include <linux/container_of.h>
> +#include <linux/gfp.h>
> +#include <linux/atomic.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_types.h"
> +#include "xe_guc_pc.h"
> +#include "xe_module.h"
> +
> +/* GPU frequency monitoring interval constants (in milliseconds) */
> +#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
> +#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
> +#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
> +
> +#define CREATE_TRACE_POINTS
> +#include "xe_gpufreqtracer_trace.h"
> +
> +/**
> + * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
> + * @gt: Reference to the GT
> + * @delayed_work: Delayed work for periodic monitoring
> + * @last_frequency: Last reported frequency to avoid duplicate reports
> + * @monitoring_active: Whether monitoring is currently active
> + */
> +struct xe_gpufreqtracer_gt_data {
> +	struct xe_gt *gt;
> +	struct delayed_work delayed_work;
> +	atomic_t last_frequency;
> +	atomic_t monitoring_active;
> +};
> +
> +/**
> + * struct xe_gpufreqtracer_data - Per-device frequency tracer data
> + * @xe: Reference to the XE device
> + * @gt_data: Array of per-GT monitoring data
> + */
> +struct xe_gpufreqtracer_data {
> +	struct xe_device *xe;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +};
> +
> +
> +/**
> + * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency.
> + * @work: Pointer to the delayed_work_struct representing the scheduled work.
> + *
> + * This function is executed in a workqueue context to periodically sample
> + * the GPU frequency and perform any necessary tracing or logging operations.
> + * It reschedules itself for the next sampling interval.
> + */
> +static void xe_gpufreqtracer_sample_work(struct work_struct *work)
> +{
> +	struct xe_gpufreqtracer_gt_data *gt_data =
> +		container_of(work, struct xe_gpufreqtracer_gt_data, delayed_work.work);
> +	struct xe_gt *gt = gt_data->gt;
> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> +	u32 current_freq, last_freq;
> +
> +	if (!atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, exiting",
> +			 gt->info.id);
> +		return;
> +	}
> +
> +	current_freq = xe_guc_pc_get_act_freq(pc) * 1000; /* Convert MHz to KHz */

I missed this. The above function performs an MMIO read, which relies on
a runtime PM reference being held. I think you will need a
xe_pm_runtime_get_if_active to protect this function, and perhaps a
drm_dev_enter to protect against hotplug as well.

With regard to power management, if the PM reference fails (and I don't
think we want this worker waking the device), you can likely set
current_freq to a known value. I suspect that if we don't have a PM
reference, the GuC PC frequency is fixed at a (low) value, but I'm not
100% sure on that. You can check with a PM expert (perhaps Rodrigo or
Vinay) to confirm.

It should probably look similar to xe_migrate_ulls_exit in this patch
[1].

Matt

[1] https://patchwork.freedesktop.org/patch/667257/?series=149888&rev=2

> +	last_freq = atomic_read(&gt_data->last_frequency);
> +
> +	/* Only report if frequency has changed or this is the first sample */
> +	if (current_freq != last_freq) {
> +		drm_dbg(&gt_to_xe(gt)->drm, "GT%u frequency changed, tracing %u KHz",
> +			gt->info.id, current_freq);
> +		trace_gpu_frequency(current_freq, gt->info.id);
> +		atomic_set(&gt_data->last_frequency, current_freq);
> +	}
> +
> +	/* Reschedule for the next sampling interval if monitoring is still active */
> +	if (atomic_read(&gt_data->monitoring_active)) {
> +		schedule_delayed_work(&gt_data->delayed_work,
> +				      msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_start_monitoring - Start periodic frequency monitoring
> + * @gt: The GT instance
> + *
> + * Starts periodic sampling of GPU frequency for the specified GT using the global
> + * monitoring interval from module parameters.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +
> +	if (!tracer_data) {
> +		drm_warn(&gt_to_xe(gt)->drm, "no tracer data for GT%u, not supported", gt->info.id);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> +		drm_err(&gt_to_xe(gt)->drm, "invalid GT ID %u, max supported is %u",
> +			gt->info.id, gt_to_xe(gt)->info.gt_count - 1);
> +		return -EINVAL;
> +	}
> +
> +	gt_data = &tracer_data->gt_data[gt->info.id];
> +
> +	if (atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring already active for GT%u", gt->info.id);
> +		return -EALREADY;
> +	}
> +
> +	atomic_set(&gt_data->monitoring_active, 1);
> +	atomic_set(&gt_data->last_frequency, 0);
> +
> +	/* Start the delayed work using global interval */
> +	schedule_delayed_work(&gt_data->delayed_work,
> +			      msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> +
> +	drm_dbg(&gt_to_xe(gt)->drm, "monitoring started for GT%u with interval %u ms",
> +		 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gpufreqtracer_stop_monitoring - Stop periodic frequency monitoring
> + * @gt: The GT instance
> + *
> + * Stops periodic sampling of GPU frequency for the specified GT.
> + */
> +static void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> +	struct xe_gpufreqtracer_gt_data *gt_data;
> +
> +	if (!tracer_data || gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> +		drm_err(&gt_to_xe(gt)->drm, "invalid tracer data or GT ID %u for stop request",
> +			gt->info.id);
> +		return;
> +	}
> +
> +	gt_data = &tracer_data->gt_data[gt->info.id];
> +
> +	if (!atomic_read(&gt_data->monitoring_active)) {
> +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, nothing to stop",
> +			 gt->info.id);
> +		return;
> +	}
> +
> +	atomic_set(&gt_data->monitoring_active, 0);
> +
> +	cancel_delayed_work_sync(&gt_data->delayed_work);
> +}
> +
> +/**
> + * xe_gpufreqtracer_validate_params - Validate GPU frequency monitoring parameters
> + *
> + * Validates and corrects the GPU frequency monitoring interval parameter.
> + * If the parameter is out of range, it will be reset to the default value.
> + */
> +static void xe_gpufreqtracer_validate_params(void)
> +{
> +	if (xe_modparam.gpufreq_monitoring_interval_ms < XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS ||
> +	    xe_modparam.gpufreq_monitoring_interval_ms > XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS) {
> +		pr_warn("xe: gpufreq_monitoring_interval_ms %u out of range [%u, %u], using default %u ms\n",
> +			xe_modparam.gpufreq_monitoring_interval_ms,
> +			XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS,
> +			XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS,
> +			XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS);
> +		xe_modparam.gpufreq_monitoring_interval_ms = XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS;
> +	}
> +}
> +
> +/**
> + * xe_gpufreqtracer_cleanup_action - DRM managed cleanup action
> + * @drm: DRM device
> + * @ptr: Pointer to xe_device
> + *
> + * Cleanup function called automatically by DRM managed resource system.
> + */
> +static void xe_gpufreqtracer_cleanup_action(struct drm_device *drm, void *ptr)
> +{
> +	struct xe_device *xe = ptr;
> +	struct xe_gpufreqtracer_data *tracer_data = xe->gpufreqtracer_data;
> +	struct xe_gt *gt;
> +	u8 tile_id;
> +
> +	if (!tracer_data) {
> +		drm_warn(drm, "no tracer data found, nothing to cleanup");
> +		return;
> +	}
> +
> +	/* Stop all monitoring */
> +	for_each_gt(gt, xe, tile_id) {
> +		drm_dbg(drm, "stopping monitoring for GT%u", gt->info.id);
> +		xe_gpufreqtracer_stop_monitoring(gt);
> +	}
> +
> +	/* Memory is automatically freed by drmm - just clear the pointer */
> +	xe->gpufreqtracer_data = NULL;
> +}
> +
> +/**
> + * xe_gpufreqtracer_init - Initialize GPU frequency tracer for a device
> + * @xe: The XE device
> + *
> + * Sets up the frequency tracer infrastructure for all GTs in the device.
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int xe_gpufreqtracer_init(struct xe_device *xe)
> +{
> +	struct xe_gpufreqtracer_data *tracer_data;
> +	struct xe_gt *gt;
> +	u8 tile_id;
> +	int ret = 0;
> +
> +	/* Validate module parameters first */
> +	xe_gpufreqtracer_validate_params();
> +
> +	tracer_data = drmm_kzalloc(&xe->drm, sizeof(*tracer_data), GFP_KERNEL);
> +	if (!tracer_data)
> +		return -ENOMEM;
> +
> +	tracer_data->xe = xe;
> +
> +	/* Allocate GT data array based on actual GT count */
> +	tracer_data->gt_data = drmm_kcalloc(&xe->drm, xe->info.gt_count,
> +				       sizeof(*tracer_data->gt_data),
> +				       GFP_KERNEL);
> +	if (!tracer_data->gt_data) {
> +		ret = -ENOMEM;
> +		goto err_free_tracer;
> +	}
> +
> +	/* Initialize per-GT data */
> +	for_each_gt(gt, xe, tile_id) {
> +		struct xe_gpufreqtracer_gt_data *gt_data =
> +			&tracer_data->gt_data[gt->info.id];
> +
> +		drm_dbg(&xe->drm, "initializing GT%u (tile %u)", gt->info.id, tile_id);
> +
> +		gt_data->gt = gt;
> +		atomic_set(&gt_data->monitoring_active, 0);
> +		atomic_set(&gt_data->last_frequency, 0);
> +
> +		INIT_DELAYED_WORK(&gt_data->delayed_work, xe_gpufreqtracer_sample_work);
> +
> +		drm_dbg(&xe->drm, "GT%u initialized with global interval=%u ms",
> +			 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> +	}
> +
> +	xe->gpufreqtracer_data = tracer_data;
> +
> +	/* Start periodic monitoring on all GTs using global module parameter */
> +	for_each_gt(gt, xe, tile_id) {
> +		ret = xe_gpufreqtracer_start_monitoring(gt);
> +		if (ret) {
> +			drm_err(&xe->drm, "xe_gpufreqtracer: failed to start monitoring for GT%u, err=%d\n",
> +				gt->info.id, ret);
> +		}
> +	}
> +
> +	/* Register cleanup action for proper work cancellation */
> +	ret = drmm_add_action(&xe->drm, xe_gpufreqtracer_cleanup_action, xe);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +
> +err_free_tracer:
> +	drm_err(&xe->drm, "initialization failed, freeing tracer data");
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.h b/drivers/gpu/drm/xe/xe_gpufreqtracer.h
> new file mode 100644
> index 000000000000..561abe27b6e2
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_GPUFREQTRACER_H_
> +#define _XE_GPUFREQTRACER_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +struct xe_gt;
> +
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +
> +/*
> + * Initialize the GPU frequency tracer for a device
> + */
> +int xe_gpufreqtracer_init(struct xe_device *xe);
> +
> +#else /* CONFIG_DRM_XE_GPUFREQTRACER */
> +
> +static inline int xe_gpufreqtracer_init(struct xe_device *xe)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_DRM_XE_GPUFREQTRACER */
> +
> +#endif /* _XE_GPUFREQTRACER_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h b/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> new file mode 100644
> index 000000000000..5664db62e3fb
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +
> +#if !defined(_XE_GPUFREQTRACER_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _XE_GPUFREQTRACER_TRACE_H
> +
> +#include <linux/tracepoint.h>
> +
> +/*
> + * Tracepoint for GPU frequency changes
> + * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
> + *
> + * location: /d/events/power/gpu_frequency
> + * format: {unsigned int state, unsigned int gpu_id}
> + * where state holds the frequency(in Khz) and the gpu_id holds the GPU clock domain.
> + */
> +
> +TRACE_EVENT(gpu_frequency,
> +	TP_PROTO(unsigned int state, unsigned int gpu_id),
> +
> +	TP_ARGS(state, gpu_id),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned int, state)
> +		__field(unsigned int, gpu_id)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->state = state;
> +		__entry->gpu_id = gpu_id;
> +	),
> +
> +	TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
> +);
> +
> +#endif /* _XE_GPUFREQTRACER_TRACE_H */
> +
> +/* This part must be outside protection */
> +#undef TRACE_INCLUDE_PATH
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_PATH .
> +#define TRACE_INCLUDE_FILE xe_gpufreqtracer_trace
> +#include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d08338fc3bc1..f5d4f8bca61f 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -31,6 +31,7 @@
>  #define DEFAULT_MAX_VFS_STR		"unlimited"
>  #define DEFAULT_WEDGED_MODE		1
>  #define DEFAULT_SVM_NOTIFIER_SIZE	512
> +#define DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS	5000
>  
>  struct xe_modparam xe_modparam = {
>  	.probe_display =	DEFAULT_PROBE_DISPLAY,
> @@ -41,6 +42,9 @@ struct xe_modparam xe_modparam = {
>  #endif
>  	.wedged_mode =		DEFAULT_WEDGED_MODE,
>  	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	.gpufreq_monitoring_interval_ms = DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS,
> +#endif
>  	/* the rest are 0 by default */
>  };
>  
> @@ -93,6 +97,14 @@ MODULE_PARM_DESC(wedged_mode,
>  		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
>  		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
>  
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +module_param_named(gpufreq_monitoring_interval_ms,
> +		   xe_modparam.gpufreq_monitoring_interval_ms, uint, 0644);
> +MODULE_PARM_DESC(gpufreq_monitoring_interval_ms,
> +		 "GPU frequency monitoring interval in milliseconds (100-10000, default: "
> +		 __stringify(DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS) ")");
> +#endif
> +
>  static int xe_check_nomodeset(void)
>  {
>  	if (drm_firmware_drivers_only())
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..fd60de38d24d 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -23,6 +23,9 @@ struct xe_modparam {
>  #endif
>  	int wedged_mode;
>  	u32 svm_notifier_size;
> +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> +	u32 gpufreq_monitoring_interval_ms;
> +#endif
>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.34.1
> 
