Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E90C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 17:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DD310E06B;
	Tue, 16 Jul 2024 17:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1MDOfpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C577810E06B
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 17:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721150270; x=1752686270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CHDk7Z0MNs+jlEpSiQrNztuPYvIVjvX3tLTjGR8TvcE=;
 b=g1MDOfpua+TNpgoQ20KigV5kbBLX8Riu43eiAOWmC77dx3/psJNBbYTm
 TTbinY1CJnkplMCHswAKF9y7XHPFQgO/KnlhfGbJxLMiGz5dkHZKoFpI1
 GZt/DRGmT/cTmdleAsnbMgyRu2+EvDQDMT4s7e5V3uUK3XeiiujoUfRJJ
 T6plwusXzocjK7HDvJJQJhXty7p0Egv8uPkIBsj9ATUd0kRgFArkdvIhT
 hGxJahUBo0I/q7dl8dIFoWKUDAlDCTL4BzYcYpTLABsFkG7Yxjd6enfUq
 GF8kTmavlH4WELjXObFTI7np8rrr1WoUovt19NQcdf0E7pux8ntun4vAL A==;
X-CSE-ConnectionGUID: uQSb8hZcTSmujgIBMc6JkA==
X-CSE-MsgGUID: fDJIOTRBRBmZvEFyd7eOrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="36044897"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="36044897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 10:17:50 -0700
X-CSE-ConnectionGUID: 2li1RgeBTIKuTonWoSRO2w==
X-CSE-MsgGUID: dok2jXP8QaW6HILFZp8qWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="50447019"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 10:17:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 10:17:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 10:17:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 10:17:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 10:17:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkfRBwzg+oQFG8zAfjYlUqTMsVLkoP0GtJe88COQPXNMsl+mKEnorf05uRf0t/SiDlbWKEgxmm8CcTQxgbPWmN7ggNXAzzlWf1oi6HQ9GMdrH4DCu+rn0AAK4vPdyGu7oAbuWzd6i9zmwX2qQ6i/8DV4asXHp25XODcAAxvTyoo7u0kApZPSo5eg8qGXisLLuHTQ92b5LA66oHOrCUJpwyz4cW/3UlpKunRJ5tQc3x7qCjGrTLFQKtIbH/YMfUkrM3JkuoX4VYgJtj3mOvqlH8Cntzec+UqO/L4mXId4C1QdUgchPWAr4sRz2IKfTCVTRC8rHf3WX8rNPpc24J+AFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OofBTjm7rZ4z3aOrywtw/Z6Wo/MRWEDtecQhd+qdyrw=;
 b=No1UEhxK0GfDVXaFMCg/BqfSt3bEDFHP+mfNAXraBxnU9EXZ/i4VIPjNSF05cWXBoXZxf2OUWocjOlsLFmJNhwLMTZquhVRHUQN/eBbM0f6XCgnAx9LbC10bfli6aIbzMKnANs+hL4IIxqj1k+XtC7J0kcMIDSvowdOyhtL9+5sqaYJIrijFHqVEDNdvXjaAbzriDTF3QiAXqVzVUXpON8KzY9xW+7EjZfE3iBoj7cI2t7AM5HKQjm2LNj9EYA0HBFO9YRG6poSurYOM9YmXu8zvwkUQxtyQCzMb19LIHEkR2UjgrfYQYJIVDxn2J62tP2p4zTf7py5GofXz2l+bRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 17:17:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 17:17:43 +0000
Date: Tue, 16 Jul 2024 17:16:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/12] drm/xe: Encapsulate drm_mm_node inside xe_ggtt_node
Message-ID: <ZparCUnXnm+UsnpJ@DUT025-TGLU.fm.intel.com>
References: <20240711171155.173717-1-rodrigo.vivi@intel.com>
 <20240711171155.173717-5-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711171155.173717-5-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0069.namprd05.prod.outlook.com
 (2603:10b6:a03:332::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5894:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e9c6f6-4436-4a1d-3293-08dca5bb3477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TmtZyiWjMEEY1ST74CaYe0q99eVDvrckrUbRossZjza/xTR7rj+k02C4lyEJ?=
 =?us-ascii?Q?V5D5YA2lHUhUZL2NwfrZtJxqDa9n/kDgdcBFEiq3L1AyPGf1xX8GCkaesiOl?=
 =?us-ascii?Q?rf3vtsxXPC9ktj4lFkEhMQvzk51M1Q9CyWglhH60vrbowXfIRpkozfr1aL7g?=
 =?us-ascii?Q?VvLfuw2eUGP5gmIThW1sa0NuoaZnKVAiQDXONlTOEvcwEAlxS5wvXyMTctEu?=
 =?us-ascii?Q?a/tRhL99z3mxaoONqjl1IoJ9eQP9wbzT5lhdE9oSn2o1ueyPp07gL8qCMpDl?=
 =?us-ascii?Q?aorEg7OgTdQEjZkpMz8DhhxSietX3ml9ncrJUAtXhm47hhz2sqVZQAm6Tqql?=
 =?us-ascii?Q?H0zs+QXdX42PGwonfRofsF12GfJz1+QzOqKTM26by7sK+t76y0806NV6CWq8?=
 =?us-ascii?Q?ls/paPhZCsgoFzWcvr7EGlwVYmPTM2Qr/Ss3S/OFuN84nekiDrogZV3/oI8Z?=
 =?us-ascii?Q?8KXgk2Ai9ueRLlN4cOcBp608DEJZNh0gKM53o/7x7xgOAjLhcJ0J0LcJ6val?=
 =?us-ascii?Q?wovyHmW1R8wu7RHbeEOJyH83xAujdHsElvEMyvZ03nkTXf464/Foo2Zzpfqs?=
 =?us-ascii?Q?uQ22oIenHNS8ottXiqfXw9CwLAHGzR1U1/WPsBqSbF7wuZdCw+cCig3sZrd6?=
 =?us-ascii?Q?+cBoE8rMKL/jZDTe22nNp8T+y8FBFCjpNBIXk1REUo62BWqWQDl4tpDkACVw?=
 =?us-ascii?Q?ZidSxtVZGryPHdRbkrLOqGVfbswARbYmYqEMmXBQnQgKtyggL4elGTcUyWkt?=
 =?us-ascii?Q?+BRTMOvW3K/G3js+ywH9Xxri0Fn3sF8D5l+MQWJAo4LXiuOR5yKYfpkC9Drg?=
 =?us-ascii?Q?YxqbqUUbTK8OjLg9Sb6quoLjqjwpwnAfpAlU1ufIcZ6kLH0G+KKILKgFtn/n?=
 =?us-ascii?Q?6q0vGsuQPw4YSiClTXmYiLBkxCNPoAdK1+otLb/uPFKPE2Jqv8sv0pkAWjw0?=
 =?us-ascii?Q?RKFi3lSgefp5EljNE7DrSklNv5tN392jyKBSUrOQK11/toIamqbkJODbhCAc?=
 =?us-ascii?Q?kVc2wpbMNE+ZhxaZpJpxz+oJvrido045PqvsU4BKuR3O6z6uYZNMutOIyQBd?=
 =?us-ascii?Q?Clm1XETy6zmew9QkYORadJdpsUJJ6cHuXnh9BtRqAddJUMfHvJ3QOG5KoIFC?=
 =?us-ascii?Q?l97XFP7kFUeZ7oUNp5lbciS44vB3CsALJ4jgNwB24w0xt8R1fRqo1aHXupZa?=
 =?us-ascii?Q?N7B3+Mh3ScRRCEcRuvddL0OnIUJVzCj20N7mkkj7P2xN6OMwU+5Q1Pwx4U1B?=
 =?us-ascii?Q?awBWlAFiIVA4yQQUz6fqcjmQn3EmIDrHoJOg/I2Ob7mYW5W/hCkJQTvUK2g6?=
 =?us-ascii?Q?DmI80RJh7g8w7ENOA5HDMvQ8z+R+e1zqfiOVEPWQfs/8GA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sfq4l4cVYwdLz/aOXghR/dhRe7MiUlICQH+1Ukw21siGLrfL4btNuqokfZpy?=
 =?us-ascii?Q?t2+bciJ0WfL6vx9zCkMPGhAdB7cSq0xJx8n1ygOYdcuuC1ifVUYibUgRcRHv?=
 =?us-ascii?Q?rZ+ra6XnYeBcasIHR93h+9L6bv/yYKagofuRMIcroHfI02134Meaygy1KiPM?=
 =?us-ascii?Q?tjEYGssgSPiujVo7EAOqhBpOzBOQespEr3d+gLc2gTxudcjocwTltIBH3ex4?=
 =?us-ascii?Q?NzTv7AtzVaASoW6q60yntfLyldBSZDkGkSbFDV8xdNPJLaJNWi4iWTBynkuX?=
 =?us-ascii?Q?+d2JeUpRGJWatA4DhRtencoKlJO7piXJFuAOCogOfoIlJmhUxKkRQzGB/kLc?=
 =?us-ascii?Q?wb4Y5VwBZ/Nto9M/MQ9F9CaCn2BPas6IgZkzdnODdJLBYCK3seMjteMOLFlR?=
 =?us-ascii?Q?IV07MrkFpwJZuGzp6l3yqski1XlilW0nt1jV5PKMQvI2WbZUZqVzxEFMEoF4?=
 =?us-ascii?Q?/4eu30GfnovTEKrEYDWgKobTj0VB0FwA+dHbsiyw281O2yJgYG5P3tB7P1Pz?=
 =?us-ascii?Q?E4p9HFSpgl9/EfRvW2cj1fUAbeiMwvImwusyYDw/eFryM2GhBrEEfs5xwTaR?=
 =?us-ascii?Q?X1qauxTUA6wq8RpmVJHmvOFNSokuNzS3iM01ErtEWm+9o8A3yqAiwl9rmHcv?=
 =?us-ascii?Q?5LdVgSaINxgLe3iEZvXJbLmpqJKnCMdmn0tWyO4PHPEUZKW+k7WL5RmBQrZp?=
 =?us-ascii?Q?aVdHNmjW7dKm5t/17d8jI5+7LHG9d1bNcbu40A86sjjmlKzk3EtMzDlVSLh3?=
 =?us-ascii?Q?rxCUbqzONeaBx0bP2K7rwtASf0lEcdFLDM8XnJWOAsFhAV+7Hiwo8tctVzdO?=
 =?us-ascii?Q?pamYM3/fYjhf7cGN+khzysk0IQsfQ9AUlxJEj2jn3WpsYy84c3XJrpsB1GAW?=
 =?us-ascii?Q?31J9HcxeNfWY66GdNzLLilT/PsdmTavVItQq+iuXjCYPQxVO8gYateq39vph?=
 =?us-ascii?Q?LxoNKkpbXTqbmqTXUrPVESjV30c6a2/gbaPYuxhaHO+gkrMNHwQxZ2/zI0l0?=
 =?us-ascii?Q?FjpFURDgrgLWSt8a6PJW/ZPjBIjP4YxkooMO3u/ue3vZRw007fFwDpYUx00s?=
 =?us-ascii?Q?4OWlRO1dHAfGcUORmwC/gYT/sjXYkz9oeIJcLWS6e4di8TsK8pDwK+/UauIM?=
 =?us-ascii?Q?wdpSo98AHCVsR0pKMkIlTPAbLHgIFWsK8FCsfEqCwVY7q+Wn3w8UPZVEjvPa?=
 =?us-ascii?Q?vAI3LoTiN95wn6ZkW4gqiAGk9ZlTTkA2Yj2gaKkxX+oOPv1+wgtURPAV+RG+?=
 =?us-ascii?Q?AfoVs8RooPiW0w1FHaOpIOS0MQ2Npnbd5ZVGTOjTgnQ96n5/RMCZ/MCrPdB0?=
 =?us-ascii?Q?YyFXGAu+L8yXnZCJMy6KkJxRQNng5iiII8xF0gmKoCGqq56yihxc0ZXZ+X35?=
 =?us-ascii?Q?9XvmlGDb3rXkK6/Q0e35BSabCvIvRXv5H2ngw6qNYH+enL7ERgzMqKwKEveg?=
 =?us-ascii?Q?xHJSd/6Gg/uQtQKojNryvT9mOfcBuZW6wTShbe6Odd6uSMRVGWkhyCp/7djK?=
 =?us-ascii?Q?fn+kfnuWHZpUYL+gFI2nW36PYsuTFMqOPbusgPlHMLSj0LIAWwxL7ujRifEe?=
 =?us-ascii?Q?kby6ZDjUTQyFWR4VccnXHyXL+bDzaZ314bCYY9B1EMEpLDE33qQidGCSv+Qr?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e9c6f6-4436-4a1d-3293-08dca5bb3477
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 17:17:43.8890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r96Job+07/3Clbakbk6h48SBR5p2A3si6PHZME/7MySeRbCE8cR0ujA0VIVAk6SGxPC6tBJVaPa5v59y5clbjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5894
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

On Thu, Jul 11, 2024 at 01:11:48PM -0400, Rodrigo Vivi wrote:
> The xe_ggtt component uses drm_mm to manage the GGTT.
> The drm_mm_node is just a node inside drm_mm, but in Xe we use that
> only in the GGTT context. So, this patch encapsulates the drm_mm_node
> into a xe_ggtt's new struct.
> 
> This is the first step towards limiting all the drm_mm access
> through xe_ggtt. The ultimate goal is to have a better control of
> the node insertion and removal, so the removal can be delagated
> to a delayed workqueue.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Agree with Michal's nits, but the changes in this patch LGTM.

With Michal's comments addressed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com.

> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  .../gpu/drm/xe/compat-i915-headers/i915_vma.h |  7 +-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        | 10 +--
>  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
>  drivers/gpu/drm/xe/xe_bo.h                    |  6 +-
>  drivers/gpu/drm/xe/xe_bo_types.h              |  5 +-
>  drivers/gpu/drm/xe/xe_device_types.h          |  2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                  | 72 +++++++++----------
>  drivers/gpu/drm/xe/xe_ggtt.h                  | 12 ++--
>  drivers/gpu/drm/xe/xe_ggtt_types.h            |  8 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 39 +++++-----
>  .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  4 +-
>  11 files changed, 90 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> index a20d2638ea7a..97193e660f6c 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
> @@ -7,7 +7,8 @@
>  #define I915_VMA_H
>  
>  #include <uapi/drm/i915_drm.h>
> -#include <drm/drm_mm.h>
> +
> +#include <xe_ggtt_types.h>
>  
>  /* We don't want these from i915_drm.h in case of Xe */
>  #undef I915_TILING_X
> @@ -19,7 +20,7 @@ struct xe_bo;
>  
>  struct i915_vma {
>  	struct xe_bo *bo, *dpt;
> -	struct drm_mm_node node;
> +	struct xe_ggtt_node node;
>  };
>  
>  #define i915_ggtt_clear_scanout(bo) do { } while (0)
> @@ -28,7 +29,7 @@ struct i915_vma {
>  
>  static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
>  {
> -	return vma->node.start;
> +	return vma->node.base.start;
>  }
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 42d431ff14e7..a93923fb8721 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -204,7 +204,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		align = max_t(u32, align, SZ_64K);
>  
> -	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
> +	if (bo->ggtt_node.base.size && view->type == I915_GTT_VIEW_NORMAL) {
>  		vma->node = bo->ggtt_node;
>  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x, size = bo->ttm.base.size;
> @@ -218,7 +218,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
>  							      xe->pat.idx[XE_CACHE_NONE]);
>  
> -			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.start + x, pte);
> +			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.base.start + x, pte);
>  		}
>  	} else {
>  		u32 i, ggtt_ofs;
> @@ -232,7 +232,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  		if (ret)
>  			goto out_unlock;
>  
> -		ggtt_ofs = vma->node.start;
> +		ggtt_ofs = vma->node.base.start;
>  
>  		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
>  			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
> @@ -325,8 +325,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  
>  	if (vma->dpt)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
> -	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
> -		 vma->bo->ggtt_node.start != vma->node.start)
> +	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
> +		 vma->bo->ggtt_node.base.start != vma->node.base.start)
>  		xe_ggtt_remove_node(ggtt, &vma->node, false);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 31192d983d9e..3501a5871069 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1090,7 +1090,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  
>  	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
>  
> -	if (bo->ggtt_node.size)
> +	if (bo->ggtt_node.base.size)
>  		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
>  
>  #ifdef CONFIG_PROC_FS
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6de894c728f5..7c95133cc32b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
>  static inline u32
>  xe_bo_ggtt_addr(struct xe_bo *bo)
>  {
> -	XE_WARN_ON(bo->ggtt_node.size > bo->size);
> -	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
> -	return bo->ggtt_node.start;
> +	XE_WARN_ON(bo->ggtt_node.base.size > bo->size);
> +	XE_WARN_ON(bo->ggtt_node.base.start + bo->ggtt_node.base.size > (1ull << 32));
> +	return bo->ggtt_node.base.start;
>  }
>  
>  int xe_bo_vmap(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index ebc8abf7930a..3ba96a93623c 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -8,12 +8,13 @@
>  
>  #include <linux/iosys-map.h>
>  
> -#include <drm/drm_mm.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_device.h>
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_placement.h>
>  
> +#include <xe_ggtt_types.h>
> +
>  struct xe_device;
>  struct xe_vm;
>  
> @@ -39,7 +40,7 @@ struct xe_bo {
>  	/** @placement: current placement for this BO */
>  	struct ttm_placement placement;
>  	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
> -	struct drm_mm_node ggtt_node;
> +	struct xe_ggtt_node ggtt_node;
>  	/** @vmap: iosys map of this buffer */
>  	struct iosys_map vmap;
>  	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f0cf9020e463..30f9c58932bb 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -203,7 +203,7 @@ struct xe_tile {
>  			struct xe_memirq memirq;
>  
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> -			struct drm_mm_node ggtt_balloon[2];
> +			struct xe_ggtt_node ggtt_balloon[2];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 709ef48f2fdb..ea55c7eabee4 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -351,61 +351,61 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>   * @ggtt: the &xe_ggtt where we want to make reservation
>   * @start: the starting GGTT address of the reserved region
>   * @end: then end GGTT address of the reserved region
> - * @node: the &drm_mm_node to hold reserved GGTT node
> + * @node: the &xe_ggtt_node to hold reserved GGTT node
>   *
>   * Use xe_ggtt_deballoon() to release a reserved GGTT node.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct drm_mm_node *node)
> +int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
>  {
>  	int err;
>  
>  	xe_tile_assert(ggtt->tile, start < end);
>  	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
>  	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
> -	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(node));
> +	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
>  
> -	node->color = 0;
> -	node->start = start;
> -	node->size = end - start;
> +	node->base.color = 0;
> +	node->base.start = start;
> +	node->base.size = end - start;
>  
>  	mutex_lock(&ggtt->lock);
> -	err = drm_mm_reserve_node(&ggtt->mm, node);
> +	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
>  	mutex_unlock(&ggtt->lock);
>  
>  	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>  		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> -		       node->start, node->start + node->size, ERR_PTR(err)))
> +		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
>  		return err;
>  
> -	xe_ggtt_dump_node(ggtt, node, "balloon");
> +	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
>  	return 0;
>  }
>  
>  /**
>   * xe_ggtt_deballoon - release a reserved GGTT region
>   * @ggtt: the &xe_ggtt where reserved node belongs
> - * @node: the &drm_mm_node with reserved GGTT region
> + * @node: the &xe_ggtt_node with reserved GGTT region
>   *
>   * See xe_ggtt_balloon() for details.
>   */
> -void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> +void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
>  {
> -	if (!drm_mm_node_allocated(node))
> +	if (!drm_mm_node_allocated(&node->base))
>  		return;
>  
> -	xe_ggtt_dump_node(ggtt, node, "deballoon");
> +	xe_ggtt_dump_node(ggtt, &node->base, "deballoon");
>  
>  	mutex_lock(&ggtt->lock);
> -	drm_mm_remove_node(node);
> +	drm_mm_remove_node(&node->base);
>  	mutex_unlock(&ggtt->lock);
>  }
>  
>  /**
> - * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
> + * xe_ggtt_insert_special_node_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>   * @ggtt: the &xe_ggtt where node will be inserted
> - * @node: the &drm_mm_node to be inserted
> + * @node: the &xe_ggtt_node to be inserted
>   * @size: size of the node
>   * @align: alignment constrain of the node
>   * @mm_flags: flags to control the node behavior
> @@ -414,23 +414,23 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  				       u32 size, u32 align, u32 mm_flags)
>  {
> -	return drm_mm_insert_node_generic(&ggtt->mm, node, size, align, 0,
> +	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
>  					  mm_flags);
>  }
>  
>  /**
> - * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
> + * xe_ggtt_insert_special_node - Insert a &xe_ggtt_node into the GGTT
>   * @ggtt: the &xe_ggtt where node will be inserted
> - * @node: the &drm_mm_node to be inserted
> + * @node: the &xe_ggtt_node to be inserted
>   * @size: size of the node
>   * @align: alignment constrain of the node
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  				u32 size, u32 align)
>  {
>  	int ret;
> @@ -452,7 +452,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
>  	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
>  	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> -	u64 start = bo->ggtt_node.start;
> +	u64 start = bo->ggtt_node.base.start;
>  	u64 offset, pte;
>  
>  	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
> @@ -470,9 +470,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		alignment = SZ_64K;
>  
> -	if (XE_WARN_ON(bo->ggtt_node.size)) {
> +	if (XE_WARN_ON(bo->ggtt_node.base.size)) {
>  		/* Someone's already inserted this BO in the GGTT */
> -		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> +		xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
>  		return 0;
>  	}
>  
> @@ -482,7 +482,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  
>  	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>  	mutex_lock(&ggtt->lock);
> -	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
> +	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node.base, bo->size,
>  					  alignment, 0, start, end, 0);
>  	if (!err)
>  		xe_ggtt_map_bo(ggtt, bo);
> @@ -523,12 +523,12 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  }
>  
>  /**
> - * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
> + * xe_ggtt_remove_node - Remove a &xe_ggtt_node from the GGTT
>   * @ggtt: the &xe_ggtt where node will be removed
> - * @node: the &drm_mm_node to be removed
> + * @node: the &xe_ggtt_node to be removed
>   * @invalidate: if node needs invalidation upon removal
>   */
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  			 bool invalidate)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
> @@ -541,9 +541,9 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  
>  	mutex_lock(&ggtt->lock);
>  	if (bound)
> -		xe_ggtt_clear(ggtt, node->start, node->size);
> -	drm_mm_remove_node(node);
> -	node->size = 0;
> +		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
> +	drm_mm_remove_node(&node->base);
> +	node->base.size = 0;
>  	mutex_unlock(&ggtt->lock);
>  
>  	if (!bound)
> @@ -563,11 +563,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>   */
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> -	if (XE_WARN_ON(!bo->ggtt_node.size))
> +	if (XE_WARN_ON(!bo->ggtt_node.base.size))
>  		return;
>  
>  	/* This BO is not currently in the GGTT */
> -	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> +	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
>  
>  	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
>  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
> @@ -602,17 +602,17 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
>  /**
>   * xe_ggtt_assign - assign a GGTT region to the VF
>   * @ggtt: the &xe_ggtt where the node belongs
> - * @node: the &drm_mm_node to update
> + * @node: the &xe_ggtt_node to update
>   * @vfid: the VF identifier
>   *
>   * This function is used by the PF driver to assign a GGTT region to the VF.
>   * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as on some
>   * platforms VFs can't modify that either.
>   */
> -void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid)
>  {
>  	mutex_lock(&ggtt->lock);
> -	xe_ggtt_assign_locked(ggtt, node, vfid);
> +	xe_ggtt_assign_locked(ggtt, &node->base, vfid);
>  	mutex_unlock(&ggtt->lock);
>  }
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 2546bab97507..30a521f7b075 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -13,15 +13,15 @@ struct drm_printer;
>  int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
> -int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct drm_mm_node *node);
> -void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node);
> +int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
> +void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
>  
> -int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  				u32 size, u32 align);
>  int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
> -				       struct drm_mm_node *node,
> +				       struct xe_ggtt_node *node,
>  				       u32 size, u32 align, u32 mm_flags);
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
>  			 bool invalidate);
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> @@ -32,7 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>  
>  #ifdef CONFIG_PCI_IOV
> -void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid);
> +void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index 4e2114201b35..f3292e6c3873 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -47,6 +47,14 @@ struct xe_ggtt {
>  	unsigned int access_count;
>  };
>  
> +/**
> + * struct xe_ggtt_node - A node in GGTT
> + */
> +struct xe_ggtt_node {
> +	/** @base: A drm_mm_node */
> +	struct drm_mm_node base;
> +};
> +
>  /**
>   * struct xe_ggtt_pt_ops - GGTT Page table operations
>   * Which can vary from platform to platform.
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index db6c213da847..3600468da013 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -6,6 +6,9 @@
>  #include <linux/string_choices.h>
>  #include <linux/wordpart.h>
>  
> +/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
> +#include <drm/drm_mm.h>
> +
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "abi/guc_klvs_abi.h"
>  
> @@ -232,14 +235,14 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
>  {
>  	u32 n = 0;
>  
> -	if (drm_mm_node_allocated(&config->ggtt_region)) {
> +	if (drm_mm_node_allocated(&config->ggtt_region.base)) {
>  		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
> -		cfg[n++] = lower_32_bits(config->ggtt_region.start);
> -		cfg[n++] = upper_32_bits(config->ggtt_region.start);
> +		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
> +		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
>  
>  		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
> -		cfg[n++] = lower_32_bits(config->ggtt_region.size);
> -		cfg[n++] = upper_32_bits(config->ggtt_region.size);
> +		cfg[n++] = lower_32_bits(config->ggtt_region.base.size);
> +		cfg[n++] = upper_32_bits(config->ggtt_region.base.size);
>  	}
>  
>  	return n;
> @@ -369,11 +372,11 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
>  	return err ?: err2;
>  }
>  
> -static void pf_release_ggtt(struct xe_tile *tile, struct drm_mm_node *node)
> +static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
>  {
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -	if (drm_mm_node_allocated(node)) {
> +	if (drm_mm_node_allocated(&node->base)) {
>  		/*
>  		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
>  		 * is redundant, as PTE will be implicitly re-assigned to PF by
> @@ -391,7 +394,7 @@ static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_confi
>  static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	struct drm_mm_node *node = &config->ggtt_region;
> +	struct xe_ggtt_node *node = &config->ggtt_region;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	u64 alignment = pf_get_ggtt_alignment(gt);
> @@ -403,14 +406,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	size = round_up(size, alignment);
>  
> -	if (drm_mm_node_allocated(node)) {
> +	if (drm_mm_node_allocated(&node->base)) {
>  		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
>  		if (unlikely(err))
>  			return err;
>  
>  		pf_release_ggtt(tile, node);
>  	}
> -	xe_gt_assert(gt, !drm_mm_node_allocated(node));
> +	xe_gt_assert(gt, !drm_mm_node_allocated(&node->base));
>  
>  	if (!size)
>  		return 0;
> @@ -421,9 +424,9 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	xe_ggtt_assign(ggtt, node, vfid);
>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
> -				vfid, node->start, node->start + node->size - 1);
> +				vfid, node->base.start, node->base.start + node->base.size - 1);
>  
> -	err = pf_distribute_config_ggtt(gt->tile, vfid, node->start, node->size);
> +	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
>  	if (unlikely(err))
>  		return err;
>  
> @@ -433,10 +436,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
> -	struct drm_mm_node *node = &config->ggtt_region;
> +	struct xe_ggtt_node *node = &config->ggtt_region;
>  
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> -	return drm_mm_node_allocated(node) ? node->size : 0;
> +	return drm_mm_node_allocated(&node->base) ? node->base.size : 0;
>  }
>  
>  /**
> @@ -2018,13 +2021,13 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>  
>  	for (n = 1; n <= total_vfs; n++) {
>  		config = &gt->sriov.pf.vfs[n].config;
> -		if (!drm_mm_node_allocated(&config->ggtt_region))
> +		if (!drm_mm_node_allocated(&config->ggtt_region.base))
>  			continue;
>  
> -		string_get_size(config->ggtt_region.size, 1, STRING_UNITS_2, buf, sizeof(buf));
> +		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
>  		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
> -			   n, config->ggtt_region.start,
> -			   config->ggtt_region.start + config->ggtt_region.size - 1, buf);
> +			   n, config->ggtt_region.base.start,
> +			   config->ggtt_region.base.start + config->ggtt_region.base.size - 1, buf);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> index 7bc66656fcc7..6d0d9299bafa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> @@ -6,7 +6,7 @@
>  #ifndef _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
>  #define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
>  
> -#include <drm/drm_mm.h>
> +#include <xe_ggtt_types.h>
>  
>  #include "xe_guc_klv_thresholds_set_types.h"
>  
> @@ -19,7 +19,7 @@ struct xe_bo;
>   */
>  struct xe_gt_sriov_config {
>  	/** @ggtt_region: GGTT region assigned to the VF. */
> -	struct drm_mm_node ggtt_region;
> +	struct xe_ggtt_node ggtt_region;
>  	/** @lmem_obj: LMEM allocation for use by the VF. */
>  	struct xe_bo *lmem_obj;
>  	/** @num_ctxs: number of GuC contexts IDs.  */
> -- 
> 2.45.2
> 
