Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880A0C3DA42
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 15:31:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3B810E389;
	Mon,  8 Jul 2024 15:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5LTbSvd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F81F10E389
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jul 2024 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720452663; x=1751988663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8cJdpDEPZuevvsusVHXFciGPx3NAnrAFGftmGj0jrLo=;
 b=g5LTbSvdgTrlNj0NJ2IgNx0fsUfGQ48W9QTUO6kvNpbOKH/eHAO8gWfD
 q4WjjA4n9X0DCj7H6lPjAZvxHM8RW+3svUMRTlM3/PuoacJp/QwmJoNCl
 d8kWxZhN9oFi0w2EohIAt+ciZnMeXQMM5l0gjXSLQ8CSiQdIqHEnTAggg
 8zB2pHiqm7wbKR+gQUWmvnYOQXQl8eMrq495bno0S3fG1dmUP5SNQkIk3
 DafthxQgtPlt9Bjd6k3rizium7V7z7qaWzMull7DcSY8YAp6wOtL9zZG2
 RWqBidzMCHa/LEpyWeAk+o7SLPutXvcE5oLAPXXLKKhxckzasDsGoM+7A Q==;
X-CSE-ConnectionGUID: y8JAUm+gSgWsrvb0YYTbbA==
X-CSE-MsgGUID: nSz/O/r3Qy+ZAKtjVpCLbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17369803"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="17369803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 08:31:02 -0700
X-CSE-ConnectionGUID: yMqfZ6gERxib18/Npph90w==
X-CSE-MsgGUID: 1IpeHlCUTkafqzIx3c3Ihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="85083814"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 08:31:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 08:31:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 08:31:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 08:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqOLQQtGyke0DM7ZYNARlHCJ0l13jjicQvVfgK2Lhjpqw3aj7F3x8uv29TLQ2uVpCX/TH6ye5wONfmX0kij/ePl3C4fD1NH4vpjRwJxk4tyzKDXlqkqi1I4QClhdJXugWQIU72LDJ6BeGmYzWccbEweLIivzFBpWwVTmgnz0p2tC6sjIJlt6j1N+z/Dda3nwG7VJFebxrTh7G6EeR4rFEpIPWfvA0s3q0K8shRVaZI3WEAoYJKw0psM5i4NlxuCUjjWzbFRYjX99E8nqLV8czF6+Mp5EbULtNoYlWPLoQF2D3WInwNVXZEx1mH7QrS+bT0+giAsQEXD4oNjaFlntYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sGcZ6ffVnnUgSSGIBD4Mb+nqiL9BZpyHOby4+QEMa4=;
 b=nvqJ9/MGissHL9ie/DJRTeiWIaHIkrn84ms20zrJXEJhyd8/DrkT3KTg36XqnoTe2vxd4jAncTT0YGu/C6fibsc2DY7hnRSttxt+ZX/GR98JlUPRgIvdyJ/JBKpLO1sOlhf4jJ0VmJ9gTZJvWwBU9hpQ9Yq8ZoiaSieLI6XFWdXK+nFEIDFrbOaamylcFZ1pBgXfbAbJGDmH06lGfv4A2/hYSiNl6s3VEAzdo7koE1+RCYK4fUffK6/glvy53ZABxOyhedCYdZwhQidZeUYLrH0uwLUJav3aIqxiFKIMBnJZdLeFkvrrS1KipYNd/fgkLPGU2N7sXa6xJEJpdgHdCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 15:30:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 15:30:43 +0000
Date: Mon, 8 Jul 2024 08:30:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for
 drm/xe/xe2lpm: Extend Wa_16021639441
Message-ID: <20240708153040.GC2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240701184637.531794-1-ngai-mint.kwan@linux.intel.com>
 <171987115354.3730.17587941054718868148@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171987115354.3730.17587941054718868148@2413ebb6fbb6>
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d25b5a0-44cc-4143-cc32-08dc9f62ee1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9B/ANXSy8dGABXy3docsA3u048dd1FAdPuSYq0iRz1k6IU0/vPZ7I6JK3e6L?=
 =?us-ascii?Q?PsZ+Y5gGEkzYXtyczr7OLjFIAhqkqaLiyGhQfszr75KAY7hXntoIk0OaCkTv?=
 =?us-ascii?Q?nMZn0p1dRCt+OBNJdg42Onol/CIrDyJmq85VN7ado0k8c8uxhLhCDdn9TI3N?=
 =?us-ascii?Q?aR+D+z1ATErWJeA8J0SbvQpI3sFDJ/jez04/p3qwCmolX/9T0VCZIlYQTqcZ?=
 =?us-ascii?Q?bK41fkLPT6VZVdTwiAgHYhaJgKAGpDYJHkO2+Hsuj4C0X5P1ugk/l9QIiI2g?=
 =?us-ascii?Q?jPGoUlxl8LaM0Ogc8RAijOyUXE1OPd7o4yKatfBhfAJE907C8eEuUEB9BFCL?=
 =?us-ascii?Q?Y8F0zObyXWXmyPxlg6/Jq+xd0voyUMLeb13+zB2LB1RPTwAjv2a/I6zdS8MQ?=
 =?us-ascii?Q?dYuiRcvD5tRlpYK40deuRcxbKUpX4ysr07eDSPREwaPd+rUtudtemPOjojm0?=
 =?us-ascii?Q?8vmtfVq4HXUvpse5pUyzeBECM5cEC9s7yfpvk9XdXZUnWJTaWkowRI6JMpI9?=
 =?us-ascii?Q?7JgInwnunmd+ul9nUBOT+Rohhmd/AVbhTytRp6zBebJrOFQsDpLrpATkz1/z?=
 =?us-ascii?Q?bLmxkb7NVw6Euked0X9vwO2CJP00derXyZY7iFLa/BQyW0erPXdOHOAs8pDY?=
 =?us-ascii?Q?RcxYHXufH14uItASBGhB6BQ6Dw036Wy/zJiEPz5ZXX+cuUgB9wYKtF7MGlgG?=
 =?us-ascii?Q?2ooT1JNdj23md3HKIIljlgUWYXNKAe+QBeeVqVtn6PlmMpBsButLPrpz2MR5?=
 =?us-ascii?Q?Tc/9WFqQCh/7kLvBei+2Qnw8ZXxk/GTGv2Opw1yZ7TsZzRqL4UABFI2/zdhR?=
 =?us-ascii?Q?szE560DLZ3z2LhK7dElcfvWcwvACA1qMbOsPa90Hz11z8xFi7Cu/bPOwaxE6?=
 =?us-ascii?Q?978TJvSXyBMgbqYASVVzG2DLqmlikI0nluQynEA636DPJW6cHyaA6iu40GBj?=
 =?us-ascii?Q?LiawseEeJGgjroNqGz37XHfD94HIH8H8icrl3JqGdP0/9LmeyeobayGrAyYx?=
 =?us-ascii?Q?GivcGLhswUgkYq1W0CNRy6D36XXYzetnvsgoAd6g8wJV2GfPeO5giw+w9Kvr?=
 =?us-ascii?Q?5riKecnHtqyYSQIpCfxg+eJ65Bb0ZAeWmZG84LULyGOxFGgK5FfVzdLAw4sx?=
 =?us-ascii?Q?MgXOIzWYLPFetaBcVnNe9cn1ZkS9q9q6VMD50LnsmQqqk6MnfCXGnVktnZnK?=
 =?us-ascii?Q?phZ+IIJgX15/ZX4M9Pz3jf89F+Ftnwx3/1f6RqJNkfbPQrTmfoseBYeOetM1?=
 =?us-ascii?Q?+pyIKy485/QcY0DNUJC1/BvWh8QR36ji3wYsyI5nTyTmRAPaAJNNLUvOmhtR?=
 =?us-ascii?Q?7hI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0a6onE5NNWzQeReg522VlhukO16AxUeA4Pmkyj8HHQRfcfq2Ese0DKdD+phF?=
 =?us-ascii?Q?+eQgKSRT8Jl5PrngvPRyQQngAf5OzhiT2bIId1pdFdtbmY18Wed0uNzLsOtk?=
 =?us-ascii?Q?22/VHIcuFPcfVeyZG48A7biTvZDHzjv7VLJd8vCayQkoLi6W6fSIE6Uyli5w?=
 =?us-ascii?Q?WYwFWl0Ami+b2NxBtPoLCTFqIOY9PP5iwwAZ8DAeOfdI4XJa67xYfd3827rk?=
 =?us-ascii?Q?XtbUDNT9zMNfUq2Lyo0LNYpcaWb1c3KaQwOxDoJNuH2zOJArJ3zSgVudv+g2?=
 =?us-ascii?Q?DQ+Xt1xAZuhQp0Fli0lUm02Pm7mTRq4y+hBv/vvt61TDpb3n4zk3JKBfAQrJ?=
 =?us-ascii?Q?HR1zSQbD8Wsrdq5RAdXua1B1KMsZ6PCtG87I7YqP6GlcJrqBM2Jl/JUOqTop?=
 =?us-ascii?Q?PDQdBWpAHaZ/r5//7jVPT9SKu9qHgo0CrHASFLxi3zhczBcL5ntu5DekajtV?=
 =?us-ascii?Q?3+GYJvVp8uq9AWQyHt6R3RYD8kFSVSCJN3SpDg5pQjp5rDoOBd2Yz9t7XTFw?=
 =?us-ascii?Q?blcCN0vFbMf2ar/MuQvZuwzTKxaH2LOnHmrG2QjGFJJ1Pfi87ZK1/pQtolnP?=
 =?us-ascii?Q?0AA/ATJd4/Sj3ieM9kk2/IBGj+QWQTmN0yH48ciIwE3PoMRmatwJoGZ8NvjD?=
 =?us-ascii?Q?H2rcpKU69z5YTbglQp5IUoy0PuuROOJ8T9zOr2haNBA5GyCT8Nd7z9MXDl7s?=
 =?us-ascii?Q?OFvvzDoxh6coIc58ENMdP5kGMqoqVxDPBPM921GUX/BUvvyh86+tdyMyiTH+?=
 =?us-ascii?Q?6WEUTyYqRfB+2i5/7TYt7UuZJgkfUg2WDhLKgLtmk/ghvFNcSj5xqTMRd2Sm?=
 =?us-ascii?Q?BZ2m9uWElZ5gfqgG2O+Q3C4oiwFfTbDuH9fsc5ZvcefmiV56YpoyxkFp0ta9?=
 =?us-ascii?Q?IMoVnOQTeyQIKyy9q77/0sgxHRW7+UHKOWxa83waPB3uP4DmCmjCbFSPTj40?=
 =?us-ascii?Q?G3XTWRHKAPVYB3Gii5a3I17gUjNZiEAFwu5QHdzRAr84DMDJN4FHV/4ZKX4Z?=
 =?us-ascii?Q?C3CfbOLIz0XidOp4rAvKSFAKjm9kasGJZ5qXBMgQTlVIM2BuTV4QvO1Cq/4M?=
 =?us-ascii?Q?lkjFBZTIxphazWL9UxjbAPBmLamOjy0+MaSxgYww4wviRCV270qQJbIbUhT1?=
 =?us-ascii?Q?OgkoNFnR33BH7R7Mm0Hp0fSUqNOwGcukwAmgUGyRFoSyc9dzaQcemBW6JSUj?=
 =?us-ascii?Q?xWX9HAdgEi/O6cR/SlYfcW0s85ujHV5JIUmdY+ocCB0+KnwVDyteKkZfUoTg?=
 =?us-ascii?Q?+164sCaOCa+qEyEOEW/wsdRt1lzSm8ATZOG0/R1HT47GHzDsCkdTJ9xS8P1Z?=
 =?us-ascii?Q?vFixZ2MkB190X+qcDEm5RetrNXlXewH/gCkvM9nB0wfbnzFkiAbQj8cwMuFD?=
 =?us-ascii?Q?U35UhyMls3v0gOjFVNEvJggT4fm78dwawmdobAry4vmUPpi7D9+a7Yppi5EG?=
 =?us-ascii?Q?JaZ50euubAd2XM71dmFs89/TmHU2JXmVeFi6jgTlohONkd7hdszyA0tgh6Ny?=
 =?us-ascii?Q?zFDv3/sbYLvIm7mkqRS0c9GlJZawg72QY/BtyNDAwBwsKGvZiUsieNexJt54?=
 =?us-ascii?Q?za7P0UIgrKOipPLAqinnofGeduoBEwr2ubcpBJUR3wp1fUItIGrJ1HrjhWIs?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d25b5a0-44cc-4143-cc32-08dc9f62ee1e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 15:30:43.3453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ryqDHVvEaGBUbW1hcihvelE+TnM71NjZJ/kFt5M1JctzurUwl09ErKcrlTqgXDFuGi58BU30e6q0qk1gZe75azBXA+t5iKSbYIu0bKNWgg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
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

On Mon, Jul 01, 2024 at 09:59:13PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/xe2lpm: Extend Wa_16021639441
> URL   : https://patchwork.freedesktop.org/series/135612/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299_full -> xe-pw-135612v1_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-135612v1_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-135612v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-135612v1_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1:
>     - shard-adlp:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a1.html

Test actually passed, but IGT runner got confused about lockdep status,
something that's been happening occasionally lately.  Looks like we
already have https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2103
for such issues.

This media patch only affects LNL, so it's unrelated to the behavior of
the ADL-P display test.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
>     - shard-adlp:         [SKIP][3] ([Intel XE#1201] / [Intel XE#651]) -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p}:
>     - {shard-lnl}:        NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-135612v1_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1201] / [Intel XE#623])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][7] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][8] ([Intel XE#1033] / [Intel XE#1214])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][9] ([Intel XE#1214] / [Intel XE#324]) +2 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#619])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>     - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#607])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#1874]) +2 other tests fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         NOTRUN -> [FAIL][14] ([Intel XE#1231])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-adlp:         [PASS][16] -> [FAIL][17] ([Intel XE#1204]) +1 other test fail
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#324])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1231]) +2 other tests fail
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#367])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
>     - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +18 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#787]) +29 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@ctm-limited-range:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#306])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html
> 
>   * igt@kms_chamelium_edid@dp-edid-resolution-list:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_color@ctm-signed:
>     - shard-adlp:         [PASS][32] -> [SKIP][33] ([Intel XE#1201]) +13 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-2/igt@kms_color@ctm-signed.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_color@ctm-signed.html
> 
>   * igt@kms_content_protection@atomic@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1178]) +1 other test fail
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-435/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#307])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#309]) +3 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-adlp:         [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1214] / [Intel XE#877]) +1 other test dmesg-warn
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_feature_discovery@dp-mst:
>     - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1137] / [Intel XE#1201])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_feature_discovery@dp-mst.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1135] / [Intel XE#1201])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - shard-adlp:         [PASS][42] -> [ABORT][43] ([Intel XE#1553])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1:
>     - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#1214] / [Intel XE#1553])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-9/igt@kms_flip@basic-flip-vs-wf_vblank@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#651]) +6 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         [PASS][49] -> [FAIL][50] ([Intel XE#1861])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
>     - shard-adlp:         NOTRUN -> [FAIL][51] ([Intel XE#1861]) +1 other test fail
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#658])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#656]) +23 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1151] / [Intel XE#1201])
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#417])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_alpha_blend@alpha-7efc:
>     - shard-adlp:         [PASS][59] -> [SKIP][60] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-7efc.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_plane_alpha_blend@alpha-7efc.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [FAIL][61] ([Intel XE#1874]) +4 other tests fail
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1122] / [Intel XE#1201])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#836])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201]) +4 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#1489])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-434/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_psr@psr-basic.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1149] / [Intel XE#1201])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-433/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rmfb@close-fd:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#294]) +2 other tests fail
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-464/igt@kms_rmfb@close-fd.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#327])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1127] / [Intel XE#1201])
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-dg2-set2:     [PASS][72] -> [DMESG-WARN][73] ([Intel XE#1214] / [Intel XE#1551])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#1932]) +1 other test skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1091] / [Intel XE#1201])
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-435/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1123] / [Intel XE#1201])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1126] / [Intel XE#1201])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#261]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][79] -> [TIMEOUT][80] ([Intel XE#1473] / [Intel XE#392]) +1 other test timeout
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-434/igt@xe_evict@evict-threads-large.html
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>     - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#688]) +1 other test skip
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
>     - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#1392]) +6 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-6/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#288]) +6 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
> 
>   * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:
>     - shard-adlp:         [PASS][85] -> [DMESG-WARN][86] ([Intel XE#1214] / [Intel XE#1727])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html
> 
>   * igt@xe_exec_threads@threads-hang-fd-userptr:
>     - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#1214] / [Intel XE#358])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@xe_exec_threads@threads-hang-fd-userptr.html
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@xe_exec_threads@threads-hang-fd-userptr.html
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>     - shard-adlp:         NOTRUN -> [FAIL][89] ([Intel XE#1414])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@xe_gt_freq@freq_fixed_exec.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#1192] / [Intel XE#1201])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-433/igt@xe_live_ktest@xe_dma_buf.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#378])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@xe_module_load@force-load.html
> 
>   * igt@xe_noexec_ping_pong:
>     - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#379])
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@xe_noexec_ping_pong.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#366])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html
>     - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#366])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [PASS][96] -> [DMESG-WARN][97] ([Intel XE#1214] / [Intel XE#1551] / [Intel XE#569])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-464/igt@xe_pm@s3-basic-exec.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-d3hot-basic-exec:
>     - shard-dg2-set2:     [PASS][98] -> [DMESG-WARN][99] ([Intel XE#1214]) +2 other tests dmesg-warn
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-adlp:         [PASS][100] -> [ABORT][101] ([Intel XE#1794])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   * igt@xe_query@multigpu-query-gt-list:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#1201] / [Intel XE#944])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html
> 
>   * igt@xe_vm@large-split-binds-33554432:
>     - shard-adlp:         [PASS][103] -> [DMESG-WARN][104] ([Intel XE#1214]) +15 other tests dmesg-warn
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@xe_vm@large-split-binds-33554432.html
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@xe_vm@large-split-binds-33554432.html
> 
>   * igt@xe_vm@unbind-all-2-vmas:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][105] ([Intel XE#1214])
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@xe_vm@unbind-all-2-vmas.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotrebind-lateclose:
>     - shard-adlp:         [DMESG-WARN][106] ([Intel XE#1214]) -> [PASS][107] +2 other tests pass
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@core_hotunplug@hotrebind-lateclose.html
> 
>   * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][108] ([Intel XE#1214] / [Intel XE#324]) -> [PASS][109] +1 other test pass
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
>     - shard-dg2-set2:     [DMESG-WARN][110] ([Intel XE#1214]) -> [PASS][111] +1 other test pass
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
>     - shard-dg2-set2:     [DMESG-WARN][112] ([Intel XE#1214] / [Intel XE#1551]) -> [PASS][113] +1 other test pass
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         [DMESG-FAIL][114] ([Intel XE#324]) -> [PASS][115] +3 other tests pass
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
>     - shard-adlp:         [FAIL][116] ([Intel XE#1874]) -> [PASS][117] +5 other tests pass
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
>     - shard-adlp:         [FAIL][118] ([Intel XE#1861]) -> [PASS][119] +1 other test pass
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
>     - shard-dg2-set2:     [FAIL][120] ([Intel XE#361]) -> [PASS][121] +2 other tests pass
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - {shard-lnl}:        [DMESG-WARN][122] ([Intel XE#2052]) -> [PASS][123] +1 other test pass
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-8/igt@kms_pm_backlight@fade-with-suspend.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-lnl-7/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
>     - {shard-lnl}:        [INCOMPLETE][124] -> [PASS][125] +1 other test pass
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-4/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-lnl-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_vblank@query-idle@pipe-d-hdmi-a-1:
>     - shard-adlp:         [INCOMPLETE][126] ([Intel XE#1195]) -> [PASS][127] +1 other test pass
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_vblank@query-idle@pipe-d-hdmi-a-1.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@kms_vblank@query-idle@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][128] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][129]
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][130] ([Intel XE#1473]) -> [PASS][131]
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][132] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][133] +1 other test pass
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-464/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race:
>     - {shard-lnl}:        [ABORT][134] ([Intel XE#2097]) -> [PASS][135]
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@many-invalid-fault:
>     - {shard-lnl}:        [DMESG-WARN][136] ([Intel XE#1638]) -> [PASS][137]
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-4/igt@xe_exec_fault_mode@many-invalid-fault.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][138] ([Intel XE#2105]) -> [PASS][139]
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_gt_freq@freq_range_idle:
>     - {shard-lnl}:        [SKIP][140] ([Intel XE#1462]) -> [PASS][141] +1 other test pass
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-8/igt@xe_gt_freq@freq_range_idle.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-lnl-2/igt@xe_gt_freq@freq_range_idle.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - {shard-lnl}:        [SKIP][142] ([Intel XE#1192]) -> [PASS][143]
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-lnl-8/igt@xe_live_ktest@xe_migrate.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-lnl-6/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_pm@s3-multiple-execs:
>     - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#1551] / [Intel XE#569]) -> [PASS][145]
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-436/igt@xe_pm@s3-multiple-execs.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-adlp:         [ABORT][146] ([Intel XE#1358]) -> [PASS][147]
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-9/igt@xe_pm@s4-basic.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@xe_pm@s4-basic.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [SKIP][148] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][149] ([Intel XE#1201]) +1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-adlp:         [FAIL][150] ([Intel XE#1874]) -> [SKIP][151] ([Intel XE#1201])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-adlp:         [DMESG-FAIL][152] ([Intel XE#324]) -> [FAIL][153] ([Intel XE#1231]) +1 other test fail
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>     - shard-adlp:         [SKIP][154] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][155] ([Intel XE#1201]) +1 other test skip
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-adlp:         [SKIP][156] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][157] ([Intel XE#1201])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
>     - shard-adlp:         [SKIP][158] ([Intel XE#1201]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-adlp:         [SKIP][160] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][161] ([Intel XE#1201]) +1 other test skip
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x10.html
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
>     - shard-adlp:         [SKIP][162] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][163] ([Intel XE#1201]) +1 other test skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-adlp:         [FAIL][164] -> [SKIP][165] ([Intel XE#1201] / [Intel XE#651])
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-adlp:         [SKIP][166] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][167] ([Intel XE#1201]) +3 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-adlp:         [SKIP][168] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][169] ([Intel XE#1201]) +2 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-dg2-set2:     [FAIL][170] ([Intel XE#616]) -> [DMESG-FAIL][171] ([Intel XE#1551]) +1 other test dmesg-fail
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-435/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-adlp:         [DMESG-FAIL][172] -> [FAIL][173] ([Intel XE#718])
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-adlp:         [SKIP][174] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][175] ([Intel XE#1201])
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][176] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][177] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-WARN][178] ([Intel XE#1214] / [Intel XE#1760]) -> [DMESG-FAIL][179] ([Intel XE#1760])
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
>   [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1414
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
>   [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
>   [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1553
>   [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
>   [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
>   [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
>   [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
>   [Intel XE#1932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1932
>   [Intel XE#1960]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1960
>   [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
>   [Intel XE#2097]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2097
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7907 -> IGT_7908
>   * Linux: xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299 -> xe-pw-135612v1
> 
>   IGT_7907: 676b8e660cadae8ffb29a45b12ad5b53ef228b6a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7908: 7908
>   xe-1542-886eeb6d89b58f914ee5045fcac54b59a73d8299: 886eeb6d89b58f914ee5045fcac54b59a73d8299
>   xe-pw-135612v1: 135612v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135612v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
