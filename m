Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E355C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 18:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC6510E940;
	Thu, 10 Jul 2025 18:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zn66GHey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CB810E940
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 18:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752170642; x=1783706642;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=K7G9+XFUg/pWRVStEZqlg1q53nbz5gLr9aSufa3OKps=;
 b=Zn66GHeyaZ+I/d6Ie8vbrUbY5s/qrNIzx8CrzE4PjKG/wlmziODtrkzq
 W83+CopdZlXMCn+wuE+XOPhQMiMgZK16N8YmEKsTocQ2NOkIBbHpzNC6x
 t+R0WTsx8dWYYPAXKQwkpPN0SAF6gw095ZxFs1Hq2VAIHd4HtsUEhpZ/N
 LOVtQfCOWhkE7r4UEZox/kGvGbRMIJXt5of5u4v01/px8crN0CYp7r//y
 hVmqoml7ANseejYhfKsvl85GahA5ipjAgVea94b8zn5dHHuQpg5OucxR8
 BVPAqjRGqT/Xnl94z/FMD0EndONQCu56KeeA+5VQiPoKC+JkwnjMbEVjh Q==;
X-CSE-ConnectionGUID: sFbOXjDNSyWnoQ9BVw3eoQ==
X-CSE-MsgGUID: 39XQBJgzSN+8GwWJbOj6bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="64719284"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="64719284"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:04:01 -0700
X-CSE-ConnectionGUID: EdxzMX1lTF6u4y/htf9dAQ==
X-CSE-MsgGUID: esNjmxI9T0eih9zLTCiZtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="161723456"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 11:03:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:03:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 11:03:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 11:03:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRkBi6CXAUBCJVOjnSR6ks0d/i+8N9ppmf4ybvS+FOfWrbUenk2cUjmEZTQI381Tp3EgF7vKc05Qnhs82ZrAXjR3TweXhT1SZ0B15dSVvSmD596Lha4HINVa3eTkeZUdkteIrngNtyP/Z5WmOaUxgxwiH7mYj808leGUCL3cc7DOpm0MQ3mn+2gY68dL9wxHGYFQvH/6UY/MSOhj5uENM96sXzogmighN43MroXKDN41Hj8fLOok7mGIRc15/n5ieldSJ5KecLDwHPfK6ClXca6gN99JdjZe+SeYU27ZPJClTTCSngEZCq8NCkZIvybZArXdYADv46SH1rb5VDcHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MTdOe0dYTWCoyitj2t2HUlZbw8lEPpFbC+bmW7TokA=;
 b=aP3L5r1HWZIXUy8w9tAxqmAX/7HXcc67PNOKqrVfs3AG0PH9Jr0tvwaUeMQSflBJpKXKMPytSRVRKXGAmVihY2Mo1DQOARRjQ0ToG3bbwAhbU8LCnL6KY9dOfNCjvHAE33tz8raaHOsudstqUO2h9foMGsCXTxVAS+imkEgfXd816e/EdP/FF1B753s4RWuj3wKj2azAUcUrLGh3wHqt8tnto3lzhn1ThKSXqyTew/H069jjaHHVjzAqTrTTpgGM2TKZ4OzAgAsASgP20mjwRCKs1j8R8kKTYi3MbWUM2RQOJ7klTF4AXSmPJXtMmqIWxuSS8udWuMW6ggEZ6WIMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 18:03:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 10 Jul 2025
 18:03:45 +0000
Date: Thu, 10 Jul 2025 13:03:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <matthew.brost@intel.com>, <tejas.upadhyay@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <joonas.lahtinen@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY
Message-ID: <5gwyv6u4qtbqbmnnxaat6zjlbp3hgdl65dqron4w6qcxhyq5ua@h7vffx4fs3uc>
References: <20250710075435.407068-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250710075435.407068-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR05CA0107.namprd05.prod.outlook.com
 (2603:10b6:a03:334::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7972:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a583596-4611-49f8-1277-08ddbfdc1ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q3iCZr/JuWzm8WxImwnT7czoSvHxLjGtANfaal5qiUSKrcOP/q7pRQhY5SQ/?=
 =?us-ascii?Q?KaijZFxzswoUmBlmunN8Ob5PCc4h5NHjEGylw6ODiBtyfD9I3EX6SsRmcA44?=
 =?us-ascii?Q?h92pOFzVJvHBv/pUO538aeq2XLTFr7wHtBvSVhtQuZdkefZdFRCCWqTRZbsJ?=
 =?us-ascii?Q?76yJujsHves6NJGCmqxciq++keHDKC2CIwz7fmSgTVsu9ewYZZpzA+y96IGC?=
 =?us-ascii?Q?oaTJ4rJAAu9Kd464+wJo+BAKNbEV7epE2rWJLK30ULgZktUtVPx6ezFNeaYg?=
 =?us-ascii?Q?5ceLJzH9YUYFpkWuobkKPLSaO3XNL0Nb/dMMv1fg7/3R7FLj/8vTg2Htj1qL?=
 =?us-ascii?Q?/jsqpPZZNP+Tmcsu+7BYv1+KzCRgEvA6zaOYSII95WZZ4wBMW48PBM4c8wdI?=
 =?us-ascii?Q?z8Ver2yAqCvvR2MiRdv4Sib83noVLWBtLCdOpFSXN6sxCym4AAnIUGMa8OZO?=
 =?us-ascii?Q?ubwFUL1u4NPYfwEFMRaKAht/YFdT1CZ3FD0K7GimSi5EG5pTTwieonB4X/oq?=
 =?us-ascii?Q?Sc/IIwHH+JYBuwoGOoplAGd6eif72lBOz2TcghgTtqfLGP+A3sPUoRNRdJKH?=
 =?us-ascii?Q?bieCR9o2m8vBAIxNDdX25sbfvRGFIUIyA07pTCJ5F/Sp4SiK+sPbFa2/COiK?=
 =?us-ascii?Q?tqqonMqlC2QfrW1b4FgqRB7psmKn+2RL75CM7bt7PI1ia1sdnp0UVl2ffxYB?=
 =?us-ascii?Q?aJaVvjSIzQKcGWv7n8zTkL3NGRtgc2oIVUptxsFPnR9O5y3S9za01tmE6vRh?=
 =?us-ascii?Q?8EIPBr/UvFROb7cjyiXJh+4b+BxFDHZGY5o6OvMdxHVukcrlrg9ArlMIXRW2?=
 =?us-ascii?Q?pBeehbn6Mt/QnXMnX5RQ6r+u7m8DOjjEjjcM98h6Jb6lEY/evpbReH6giZLA?=
 =?us-ascii?Q?+GRPn1LU/O2ge2GxIstoA9wZKvpt4qfhi139dI/Pdhhd0We5IIW/gXFBwJWC?=
 =?us-ascii?Q?GRtZkc5BpYmYaJ+wa/71KpLn490iNLFxOkj4sYCk4/0p+1K/dYkHCB+O7RCS?=
 =?us-ascii?Q?BAy1ZhA37E4MbHS4pslqcCQTQ/VU2+3+bWD6UrLYR9+ULIb5Vg7bfO9QtzcT?=
 =?us-ascii?Q?jdkNNaNMm4uA11Mbv5JtPq2a/aKaqKsjuYzBT9lnT5T8a3nGhhD3olGPG+41?=
 =?us-ascii?Q?1AMcQLvzOioCajJ/sfrU6xcnW6UU1nGfl6FttbSv5wG+2UTY9O54m4tU4EKD?=
 =?us-ascii?Q?oczwpg91yH7sqS4W626AgF1BbFxAl4PNfhzZIzYUNHpO/LBihcF9G8fGiwWI?=
 =?us-ascii?Q?5DJ5/tWfmqGyVbgz9ss2unSxz1BXDI4Ax0EHy3ebaJpMmqV87K/qMbHnfnlK?=
 =?us-ascii?Q?WA//Kzv3O4mzZIT3rF8sVy3isN5cmte63sKFHCrOgfa/Vf+iz2MlSsIJpj9b?=
 =?us-ascii?Q?uPe84gw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yswQhaB9fuJa3Nsd/ruldJ8WMPSestrPclh3mrH86kc9Yfs9MHKW6UXpYvvd?=
 =?us-ascii?Q?l2FlZTP1tr6xYOop8skGGshTSMjMxRH5owSOqD0DFjIRUqArypVWAkmGjnLw?=
 =?us-ascii?Q?C76D/TGH3vngXaK6o3gW3gDTQoGSwCSUsEjdlFxNddwjYuKXHkGV3cKOOAqJ?=
 =?us-ascii?Q?aH4rfUgJ4mkzpKLx27iPcq+Tw+yLi20Ebf6TImK2S3O8ad49tqwaM1JOCqvg?=
 =?us-ascii?Q?tuOliA/0Y/O8mBErV4D+AQyDU2FOf2u2HWmOFhw4Yby+obihnXVXHCbNR6Q7?=
 =?us-ascii?Q?j7S4l6WuGiTKiUq7Rt0A7G+aJzCUAcpdMPyr/h+S3VeOINJggIIFaluDPLHw?=
 =?us-ascii?Q?YPqcHY0bzQez+c6TmLDinK/lugs2LPfyNpqR+xNUcAzhBC3i7W6g6QsgRBz3?=
 =?us-ascii?Q?QII2FqB6uKQoXOr7k/12QV1Koc2JVq8jlbSiEBie1RuG/9UO0om7vOu6KCt9?=
 =?us-ascii?Q?OQW28NRTQkkHtpOQa37oeDpwzVQ5IeuKcw8BNojdQmfpTOjgcYpKg8mwphkN?=
 =?us-ascii?Q?nS2ubtvZV3VtqEAwJ3uCGk/LetD5iWxyq+rq/WBjHP9CJ+teVYiex4JSdYTN?=
 =?us-ascii?Q?o7yJ+z/i+EURyKtDEJRC7KKJRbIFNlCPrDoavcxxGJsaRVxwm/ikEhwTcQYy?=
 =?us-ascii?Q?6o+2uMAgU2cXS4B8fVwTtEFzqVWJyGbZ3ntzyLr/aHcYMOwE49Yjp4YPNkLB?=
 =?us-ascii?Q?NfcGSGlLkZTaA8xOh1atXNfq0FtnWrzSjQm+3oEvk7ePYHbXtAEQC99q7Glb?=
 =?us-ascii?Q?KCud/o1SkuGHodCO/jeWv1whhXlM9PK9K1lYu4Kxu/IlWEvZTkbZ+Gwi7jCx?=
 =?us-ascii?Q?8CKfk/fmm6I58/OG0bIkfizHBdk1xsGkwDlu5eKHijlQi22UmnpPigshmul7?=
 =?us-ascii?Q?QyOnv78hkC6fPi7Yy1ECK4rL3raufr+TgxsQyPyrCu01UsYML2+U5V96xu2y?=
 =?us-ascii?Q?NrvHf9oEiVT62DzZu1o1Wc/YWNlyMgVkcVNlAQLxKtMByF9w20+p6+QQi7lO?=
 =?us-ascii?Q?cmqlmPfEPEPXHRAmPihBy0PG7YvpmkisDBB3nN4nlwyQ5RpddbwvfvYRiMUc?=
 =?us-ascii?Q?tOhWyWtWhYouMiBkqiARIOfPjDXtfor3OHBqsZp1tlchKpONEkS9TEWCfRY0?=
 =?us-ascii?Q?NYVgf77tC5E9OB5smsxgDVS5sEQoxCD0ZHeze+xxSoMN6rqCtTYuw8KryNDR?=
 =?us-ascii?Q?ozfUjrrPYWnTg8tOesvLyPGD2ErT3nyB9+fOUOy//A6yLqPMggOP9VjYwfET?=
 =?us-ascii?Q?reXTyrHHgJjiKhxkUtE2FMR5gmE1wOn/bmXGneYcI/70ea9+zeFnY1oDXH3k?=
 =?us-ascii?Q?l0Dnx4U8hTtA7VcOcGPYnTMcy5PybLDWgZoRsJlb1sAqzFwwb1cYF3Uz3Fbp?=
 =?us-ascii?Q?wTmGpUL9HiL+7a3304COp9Sf3d14KqjWymvbpASyVeHfWMYzHFwjKReSKO6D?=
 =?us-ascii?Q?KYbMPT8PaFg2bLNzJZ3Kky1h/EUz9CP4Wi68fNYI0J4zKi1XtWbSYT/xQUXK?=
 =?us-ascii?Q?xMrD7FeqMFY2iJ5sRjfSpaH6e9NcQnPF3Ei0CBURJz6ykTmQg5FuGIJhXTO4?=
 =?us-ascii?Q?8MoL9wBjng/VfayUrWy0D1AGbzF9nNl5gDiMqipfma4XiWcPOzOPyanzGTZh?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a583596-4611-49f8-1277-08ddbfdc1ca9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:03:45.2828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6zCdgYD9UKw+k+Um4z7W+QS0aMHFMuWwwWLULjelI/ivYP7HIj0/fCZ9yEJ3aK0vQsaOhw0F9YK0mPKjsH/p1l9CAv3toexSjjQu0xwqm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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

On Thu, Jul 10, 2025 at 01:24:35PM +0530, Nitin Gote wrote:
>Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY device query flag
>which indicates whether a device supports DIS_NULL_QUERY (Disable null
>anyhit shader query mechanism). The intent is for UMDs
>to use this query and opt-in DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY flag
>to disable null query mechanism for anyhit shader by setting
>DIS_NULL_QUERY bit of RT_CTRL register for Xe2.

it seems like this commit has been over squashed and this commit message
doesn't really match what it's doing. This isn't just adding a
DRM_XE_QUERY_* (what the title implies), it's actually implementing the
DRM_XE_EXEC_QUEUE_*

>
>v2:
>   - Use xe_rtp_match_first_render_or_compute() api to check
>     render_or_compute. (Tejas)
>   - Validate args->flags (Tejas/Matthew)
>   - Add proper kernel-doc for both DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY
>     and DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT. (Matthew)
>
>v3:
>   - Rename DRM_XE_EXEC_QUEUE_DIS_NULL_QUERY to
>     DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY. (Matthew)
>   - Move implementaion from exec queue creation time to
>     WA BB program. (Matthew)
>
>Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>---
>Hi,
>
>Please note the review comments from previous rev2, addressed in this patch.
>https://patchwork.freedesktop.org/patch/660580/?series=150601&rev=2
>
>
> .../gpu/drm/xe/instructions/xe_mi_commands.h  |  4 ++
> drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  2 +
> drivers/gpu/drm/xe/xe_exec_queue.c            |  9 ++-
> drivers/gpu/drm/xe/xe_exec_queue_types.h      |  2 +
> drivers/gpu/drm/xe/xe_gt_mcr.c                |  1 -
> drivers/gpu/drm/xe/xe_lrc.c                   | 65 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_query.c                 |  3 +-
> include/uapi/drm/xe_drm.h                     | 12 ++++
> 8 files changed, 95 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>index e3f5e8bb3ebc..84e889528464 100644
>--- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>+++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>@@ -80,4 +80,8 @@
> #define MI_SET_APPID_SESSION_ID_MASK	REG_GENMASK(6, 0)
> #define MI_SET_APPID_SESSION_ID(x)	REG_FIELD_PREP(MI_SET_APPID_SESSION_ID_MASK, x)
>
>+#define MI_SEMAPHORE_WAIT		__MI_INSTR(0x1c)
>+#define  MI_SEMAPHORE_POLL		(1 << 15)
>+#define  MI_SEMAPHORE_SAD_EQ_SDD	(4 << 12)
>+#define  MI_SEMAPHORE_REGISTER_POLL	(1 << 16)

look at the defines above and implement it according to them. There are
multiple things wrong wrt coding style here:

1) the MI definition is sorted by its number. 0x1c shouldn't be the last
in the file
2) bits definition should be sorted, highest number first, to follow the
bspec and be easy to compare
3) don't use shifts, use REG_BIT()
4) there's a missing space in the bits definitions


> #endif
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 5cd5ab8529c5..8234789f05b7 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -55,6 +55,8 @@
> #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>
>+#define STEER_SEMAPHORE				XE_REG(0xFD0)

ditto, should be sorted too, but it also clashes with
MCFG_MCR_SELECTOR. I'm actually not sure why we are using MCFG_MCR_SELECTOR
name... probably a copy & paste from i915. That register is indeed
called STEER_SEMAPHORE in bspec.

>+
> #define PS_INVOCATION_COUNT			XE_REG(0x2348)
>
> #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 8991b4aed440..18a0bee38eed 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -131,6 +131,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
> 			flags |= XE_LRC_CREATE_RUNALONE;
> 	}
>
>+	if (q->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
>+		flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
>+
> 	for (i = 0; i < q->width; ++i) {
> 		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> 		if (IS_ERR(q->lrc[i])) {
>@@ -597,7 +600,8 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 	u32 len;
> 	int err;
>
>-	if (XE_IOCTL_DBG(xe, args->flags & ~DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT) ||
>+	if (XE_IOCTL_DBG(xe, args->flags &
>+	    ~(DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT | DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)) ||
> 	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> 		return -EINVAL;
>
>@@ -616,6 +620,9 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 	if (args->flags & DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT)
> 		flags |= EXEC_QUEUE_FLAG_LOW_LATENCY;
>
>+	if (args->flags & DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY)
>+		flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
>+
> 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> 		if (XE_IOCTL_DBG(xe, args->width != 1) ||
> 		    XE_IOCTL_DBG(xe, args->num_placements != 1) ||
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>index cc1cffb5c87f..b62502a18c1b 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>@@ -87,6 +87,8 @@ struct xe_exec_queue {
> #define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> /* flag to indicate low latency hint to guc */
> #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>+/* flag to indicate disable null query hint */
>+#define EXEC_QUEUE_DISABLE_NULL_QUERY		BIT(6)

		     ^ missing FLAG here to follow the other defines
>
> 	/**
> 	 * @flags: flags for this exec queue, should statically setup aside from ban
>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>index 64a2f0d6aaf9..a7624b30d0c9 100644
>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>@@ -46,7 +46,6 @@
>  * MCR registers are not available on Virtual Function (VF).
>  */
>
>-#define STEER_SEMAPHORE		XE_REG(0xFD0)
>
> static inline struct xe_reg to_xe_reg(struct xe_reg_mcr reg_mcr)
> {
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index d2ad8fe737eb..6fc09df67442 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -13,6 +13,7 @@
> #include "instructions/xe_gfxpipe_commands.h"
> #include "instructions/xe_gfx_state_commands.h"
> #include "regs/xe_engine_regs.h"
>+#include "regs/xe_gt_regs.h"
> #include "regs/xe_lrc_layout.h"
> #include "xe_bb.h"
> #include "xe_bo.h"
>@@ -25,6 +26,7 @@
> #include "xe_map.h"
> #include "xe_memirq.h"
> #include "xe_mmio.h"
>+#include "xe_rtp.h"
> #include "xe_sriov.h"
> #include "xe_trace_lrc.h"
> #include "xe_vm.h"
>@@ -972,9 +974,56 @@ static ssize_t wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
> 	return cmd - batch;
> }
>
>+/*
>+ * wa_bb_disable_null_query() - Emit commands in the WA BB
>+ * to disable or enable NULL Anyhit Shader Query Mechanism.
>+ *
>+ * Some platforms require a workaround to disable (or enable) the
>+ * Anyhit Shader NULL QUERY for specific engines (typically the
>+ * first render or compute engine). This function emits a sequence
>+ * of MI commands into the workaround batch buffer (WA BB) to perform
>+ * a multicast write to the RT_CTRL register, setting or clearing the
>+ * DIS_NULL_QUERY bit.
>+ *
>+ * The sequence includes a semaphore wait to ensure proper ordering,
>+ * followed by MI_LOAD_REGISTER_IMM commands to write the desired value
>+ * to the RT_CTRL register, and finally restores the semaphore state.
>+ *
>+ */
>+static ssize_t wa_bb_disable_null_query(struct xe_gt *gt, struct xe_hw_engine *hwe,
>+					u32 *batch, size_t max_size, u32 value)
>+{
>+	u32 *cmd = batch;
>+	struct xe_reg_mcr reg_mcr = RT_CTRL;
>+	struct xe_reg reg = reg_mcr.__reg;
>+	struct xe_reg reg_sema = STEER_SEMAPHORE;
>+
>+	/* Add WARN_ON check for minimum required space (10 DWORDs) */

no need for this comment

>+	if (xe_gt_WARN_ON(gt, max_size < 10))
>+		return -ENOSPC;
>+
>+	if (xe_rtp_match_first_render_or_compute(gt, hwe)) {
>+		*cmd++ = (MI_SEMAPHORE_WAIT | MI_SEMAPHORE_POLL |
>+			  MI_SEMAPHORE_SAD_EQ_SDD | MI_SEMAPHORE_REGISTER_POLL);
>+		*cmd++ = 1;
>+		*cmd++ = reg_sema.addr;

I think we can simply use

		*cmd++ = STEER_SEMAPHORE.addr

and similarly in other places here and let go the local vars above.

>+		*cmd++ = 0;
>+		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
>+		*cmd++ = reg.addr;
>+		*cmd++ = value;
>+		*cmd++ = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1) | MI_LRI_MMIO_REMAP_EN;
>+		*cmd++ = reg_sema.addr;
>+		*cmd++ = 1;
>+	}
>+
>+	return cmd - batch;
>+}
>+
> struct wa_bb_setup {
> 	ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 			 u32 *batch, size_t max_size);
>+	ssize_t (*disable_null_query)(struct xe_gt *gt, struct xe_hw_engine *hwe,
>+				      u32 *batch, size_t max_size, u32 value);

this is not how this works... you should define just your function, and
add it to the array below as a "setup function".

> };
>
> static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>@@ -982,6 +1031,7 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	const size_t max_size = LRC_WA_BB_SIZE;
> 	static const struct wa_bb_setup funcs[] = {
> 		{ .setup = wa_bb_setup_utilization },
>+		{ .disable_null_query = wa_bb_disable_null_query },

should have been:

		{ .setup = wa_bb_disable_null_query },

But also beware we are refactoring this a little bit, so on next rev you
will hit some conflicts. See 

drm/xe: LRC refactors @ https://patchwork.freedesktop.org/series/151152/
More missing XeLP workarounds @ https://patchwork.freedesktop.org/series/149097/



> 	};
> 	ssize_t remain;
> 	u32 *cmd, *buf = NULL;
>@@ -1000,6 +1050,18 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> 	for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
> 		ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
>
>+		if (((GRAPHICS_VER(gt_to_xe(lrc->gt)) >= 20) &&

this check should be inside the setup function, not here.

Also, is this a WA? It's looking like it, which means you need a
WA number, add it to drivers/gpu/drm/xe/xe_wa_oob.rules with the
graphics range where it applies and then in wa_bb_disable_null_query()
you use:

	if (!XE_WA(gt, ...))
		return 0;

>+		     (GRAPHICS_VER(gt_to_xe(lrc->gt)) < 30))) {
>+			if (lrc->flags & EXEC_QUEUE_DISABLE_NULL_QUERY)
>+				len += funcs[i].disable_null_query(lrc->gt, hwe,
>+								   cmd, remain,
>+								   DIS_NULL_QUERY);
>+			else
>+				len += funcs[i].disable_null_query(lrc->gt, hwe,
>+								   cmd, remain,
>+								   ~DIS_NULL_QUERY);
>+		}
>+
> 		remain -= len;
>
> 		/*
>@@ -1175,6 +1237,9 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> 	map = __xe_lrc_start_seqno_map(lrc);
> 	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>
>+	if (init_flags & EXEC_QUEUE_DISABLE_NULL_QUERY)

ahn? Please don't mix LRC_*_FLAGS and EXEC_QUEUE_*_FLAGS. This
is a recipe for disaster. I don't see why you'd need to set any flag in
lrc.

Lucas De Marchi

>+		lrc->flags |= EXEC_QUEUE_DISABLE_NULL_QUERY;
>+
> 	err = setup_wa_bb(lrc, hwe);
> 	if (err)
> 		goto err_lrc_finish;
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index d517ec9ddcbf..5b48befd32cd 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -344,7 +344,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
> 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> 			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>-			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>+			(DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY |
>+			DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY);
> 	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> 		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
> 	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index e2426413488f..adab49e63757 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -397,6 +397,8 @@ struct drm_xe_query_mem_regions {
>  *      has low latency hint support
>  *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
>  *      device has CPU address mirroring support
>+ *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY - Flag is set if the
>+ *      device has null query support for anyhit shader.
>  *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>  *    required by this device, typically SZ_4K or SZ_64K
>  *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>@@ -415,6 +417,7 @@ struct drm_xe_query_config {
> 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
> 	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>+	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_NULL_QUERY	(1 << 3)
> #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>@@ -1270,7 +1273,16 @@ struct drm_xe_exec_queue_create {
> 	/** @vm_id: VM to use for this exec queue */
> 	__u32 vm_id;
>
>+	/** DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY - \
>+	 *	Flag is set if the device has low latency hint support
>+	 */
> #define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT	(1 << 0)
>+
>+	/** DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY - \
>+	 *	flag is use to disable null query check for Anyhit shader
>+	 */
>+#define DRM_XE_EXEC_QUEUE_DISABLE_NULL_QUERY	(1 << 1)
>+
> 	/** @flags: flags to use for this exec queue */
> 	__u32 flags;
>
>-- 
>2.25.1
>
