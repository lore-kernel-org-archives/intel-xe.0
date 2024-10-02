Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983A3CF6D28
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 15:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B82D10E0F4;
	Wed,  2 Oct 2024 15:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYBQlEeK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A8510E0F4
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Oct 2024 15:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727881452; x=1759417452;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ROgTaQC61pwHi+kkjTs01pmd+Aei0LTDvQuOi/R81eY=;
 b=QYBQlEeKLlifbwddLR7JQFfAkda8VbIBUHRQN4m7/E4fqD6BrOcHC/EU
 jra66TjTZBm/WLJC7yi/kAiAe/ila00dMZfuIlKDpkbx7KHFmDlhSVbG7
 JP+0h2woG+UXMSC34PdmOEJ8wT3LdjJ/dd7Jc5zvHyuZNOPU2RaQ05tbS
 zlYtcjxW2uuJzdWpCZUTT7a1EOKwR4QEgBKBdawxVe/IjdhwOjDQ6G0uT
 N/sgqwLWPrQE8cRl+bFKuiCSRXWBVF+rojtSzWjD3+Ox01c85V4Ewa+Wc
 ttAgsvOFgRY3fLMH/pSZSkgy4+mrz1BKjbZzqol9V8mTYoO7BT4xSp97D w==;
X-CSE-ConnectionGUID: 8Np8bBdzSG2WLUy8Kk/ccQ==
X-CSE-MsgGUID: XXiVZYJuQ8GyDSakyd+LEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="37716081"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="37716081"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 08:04:11 -0700
X-CSE-ConnectionGUID: q0h5W43vRLSxAgcxMDoG9w==
X-CSE-MsgGUID: AxqJlJNUSn+E424B396tAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78986254"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 08:04:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 08:04:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 08:04:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 08:04:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 08:04:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxTTV/fz7jn3N9BheCIbHrNTLYT5M4goNY2xeOV3gWBMw/4dcXcQ/kzpSaEWID/L3koWlu5Vqj8Jq/Ulky9peO4n1iQJLxAge6Oh8CcahH6P/jyjqW28DCZ2tcVKN/7qT/gh1d31w3XSeHraiXbreiqC/cnCYh16F18/b+JxOSsSZLv2ejPRJWVcpNZdJOo8cNLrxdUvUK78uZ59SP3UEBdfXhVC9SKr6TVLwyLe/PbdksooAWoiqD5wwIG0Pu7pHj8BJg8im0ey6kODA0Jq9KIvhjkO2mvoYQ6+z96fZufZWRIY3U0yfgPbA8KGt6nDcA6KdKvz/atXDGmoS4y6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHqoYDjyezKcXDbQ5tL6TcvQJDqXe3VuNqPMYtFRhts=;
 b=Tj2Wq2fSbSdqVAqTRmalw10Y4mwo3cV/KH56RrMKmUPkghUzvrCaD9YCKBep67PdWZvbyb3ANc4zp3CoEkmKdnAfc3c/pbt+Iz+ZvoigP6Yyfn9EyT4tZXc92z2Ut5PMJd2n9GyT3ki3vb97YeHG+g8N99RxtK8TqbmFE8MCTYJh1jU2LA6M8dgb/4vb1fzMnnda6R9ZUUCowDP62xoLP0YbKfRByLwIQiPrnkW+J5+rX3J6G6DK/d1syJUhkGp/ymIZxjnqXpzBXBdOHpIIilZx9yzjwSpgt3xjS+mvqDhPLY/Go1lywcje1DiLdJPT/2uWT/BI1JJ3VYkfTpLlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB7737.namprd11.prod.outlook.com (2603:10b6:8:e1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 15:04:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8005.024; Wed, 2 Oct 2024
 15:04:07 +0000
Date: Wed, 2 Oct 2024 15:03:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <apoorva.singh@intel.com>, <intel-xe@lists.freedesktop.org>,
 <oak.zeng@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/uapi: Restore uapi for access counting
Message-ID: <Zv1g0tKMaCZXMKs0@DUT025-TGLU.fm.intel.com>
References: <20241001135432.447074-1-apoorva.singh@intel.com>
 <20241001135432.447074-3-apoorva.singh@intel.com>
 <juv7n3jsyv6hqcxbcnlxgeq5rlqayukriwrcbjq3lmonlhrnos@t5dpzwna5r27>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <juv7n3jsyv6hqcxbcnlxgeq5rlqayukriwrcbjq3lmonlhrnos@t5dpzwna5r27>
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB7737:EE_
X-MS-Office365-Filtering-Correlation-Id: e4e903ea-c799-4765-72e9-08dce2f376b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fq50IkWU8oWq5mVUSwKblIwFLZmCGNarx8Z5O/m9Pm1bcGFnHpzcG4LQS794?=
 =?us-ascii?Q?H4pEmajlt78KtkoLIDJpVjhdgIiidvccvXbhlQGSU4UQuP2YctcS3AmDt2Ue?=
 =?us-ascii?Q?0icE/XpVTNisAGrZb0sdBJ+SXPVYoTHUtZUlHTo9taIEZhjGy60Xvx8HiYiG?=
 =?us-ascii?Q?Io54TqKFGSlpROylSUrZ9gF5M4K0yZtPmiKyVsgEaXC2kO0AJXqOgwkR6an4?=
 =?us-ascii?Q?RJThgeqcikOdobDF0YX6lOPuqCK4GyA4rVec5xjNRetekxi3iiGrGi392Jy9?=
 =?us-ascii?Q?VijgkYy6FLiDYZQpYq62qFa0NbvfsFNzKG5IdZ8Dyt/jNroauBt5feMoCAtC?=
 =?us-ascii?Q?mE9SHHzQbg/ascnD0jGhugmiyeEqur4oq/pkloDHLzDxBE0pYj+fLxXi7YXs?=
 =?us-ascii?Q?dhiFRh0tuKOvzyM1Knj0tWB4RC0UUv9cj6KAVLruPnXB1V5hjTYYpHGQWHt4?=
 =?us-ascii?Q?uz7j2v1chHRsRQeJmkxf/8gU2kdNWoDwVbLyt+S4WfthYCQbzCWBCG0bw4Ku?=
 =?us-ascii?Q?4mcZa1v1hj7AaS/8ZnNFez6D9Sxbom85DwS0y0VaOVWxvsDTPFGOMV4ATvQS?=
 =?us-ascii?Q?sc5L1eMQWKEgpPYoxw/t5fuhpm0cJwuZSXAm4W79ynts8z/e45owdg4y8I3J?=
 =?us-ascii?Q?HaCAiwt1BSwQGeVzml90/oQeRaWBOVMxvEwNQvGrF47HE+MLppofELqFGfJP?=
 =?us-ascii?Q?WRUURwhQrhW6EBPycQyAzwgDSUCe95dkyOa1gKIcB3u6ptdOUqvFMvTZjgV7?=
 =?us-ascii?Q?Qz+Zu2///8fT+RWj95yjb8voxhfqWgiaTBvKRn1CDYXuzMs1LQaNmUq5dfJ8?=
 =?us-ascii?Q?m7Hx9eUPVC8wesmV1JihZWvdMuKH764li+q2X9loIX71Yn1n+u/lyFJnQ/iw?=
 =?us-ascii?Q?QXHhbUPCuLh6MAgR5oCbZfsRMAxit+dpr102+jmjxovssegcmx1iduB1eLUi?=
 =?us-ascii?Q?ZquTj5yf+UECQGJJHMhQhu9suLNZFEijy2LPrA0Ba6WvBubEOLqU7zwMwtFh?=
 =?us-ascii?Q?YEsArN/yjRyz9wHhlX56YkpIiRo+w1Z1vnbly3bNAZ7+otPKUluGpjjgFd4p?=
 =?us-ascii?Q?zLIKxnvrCMWmSefx/7I7AftXhZI3jG5AhAPvX3dhWzgarOUCJKy62a189vQq?=
 =?us-ascii?Q?lOtU/k8Eb7SwlFhyte2POjM7rKjn3bN4sckhJ2gSn4DGBa0Ofyim5ycO7ybc?=
 =?us-ascii?Q?B2qcNw2U3+XH8NYESrdbg7WYZqnVfNuSTcgWahc73mOcTvtVODiNZS1yKIak?=
 =?us-ascii?Q?emWRKiqAw8L3LWSxQGSjAGkQmg5/s8ATSyoBMCgadg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJLazXa+xuYe9szvq7B2eVEY9JVpUICiWcayXL7NkL57UVK6uGA8xjqHuYaD?=
 =?us-ascii?Q?Qt3HsgokowWE2z7i8LitYCAUJUo0qWT1RfSx9dUp56xFzCbw4On7BAx+9qct?=
 =?us-ascii?Q?Ox0KW/i9vAV4mpDQeXZkyZBgUMpayiFdj4kifyj+2PzAgFNOba5n19X0c/8P?=
 =?us-ascii?Q?HdzuGVim7LbfS7pIsFo/k0NILtHfl4/tF+9/9cUF03CRv7yVovyb8wAz5g1B?=
 =?us-ascii?Q?invQazV8XEfAQVZK918nLydY5rPWJPcKDdzhIy0NJRehpvlawhTjrghXgNl9?=
 =?us-ascii?Q?5te72u76+5SfTjC89OKgOlF4FA8Ia/Y1e+V23yceNv86SSV2PDFdueiVDTj6?=
 =?us-ascii?Q?PrZo/u1Ribnb/9McWC9ySaaKMPBAhapKGx8pcBWXOyc2y7M1liGKGGlBgvSz?=
 =?us-ascii?Q?KIJYTOjPLthOfjoI2nACCaqqiL8rmG/m1EaeX/ds1X2NX5UVaezKR75yFogk?=
 =?us-ascii?Q?suca68aJ9lNE6B+VbT8kt3HbcozKkEZFehGuTVKsx1TSaVz3ekg7Nx1ARdi3?=
 =?us-ascii?Q?TUVeYbh9flIIzJnvRlaSRw+oQ0QzNh4K/vuuwL5ncwged+XrByVgd6cWcB9M?=
 =?us-ascii?Q?mU2YPmnROjNcDyDy9OkHJ2U1rlpZ8O7YLmH5M2iRudkKxcq5sOXZtPyhKZkX?=
 =?us-ascii?Q?WIM42Nghslb7r+bjl5vJ+aHxXvPXuDV+wnq3klVqikzXw6ysAx+Et1X0CEDz?=
 =?us-ascii?Q?BqWeGHgvfEwRUpRtG9isKp096nmzTsML4K4qJmZkvB3j2sbDttqQpyeT3rR0?=
 =?us-ascii?Q?ks/Ozf0vwhgEOlNdefi/jsjTdxYYbDONIfpYvYfrB9EUt81pr1H2IF2HK70s?=
 =?us-ascii?Q?nGprkyI+UtWVUHJkErKK467ES2mKWPGjLK6wo0C9EaIokFWrhDwe/QV4JSJ7?=
 =?us-ascii?Q?Yg4isD2+HmmgiQPcSpbQW36yb0FRgG5nndvuxR9f4qIqG+QYPYe7yrr9bmKk?=
 =?us-ascii?Q?Vheksrs1MqENrARMjHSxUx2uKPrHxM6UypQdNWSfFJExOHgGL/TtDSRhu2Fu?=
 =?us-ascii?Q?nTvrysLLTJl1NhcSOo8q8wvhNGm9emvVxkgM53zojsrSW+zEQBHTUi/Obaa+?=
 =?us-ascii?Q?AP0Sn8F6D1CsKS1+yLqrjJCupfCKRGu2a8JwQ+JHmzhlPf7+YjRopBgf+OjP?=
 =?us-ascii?Q?zSNlVj2lSWd1+7okKQ3bSWU7XbAGMt7t/Jkw5SU8bdbbo2A9GutKfYCXiNZB?=
 =?us-ascii?Q?iyIm/f7GMlsLC4DDqrbWHSLvyaB5tE4Pv9al7YnpMNUHKdsMIR/gCYrJPP9F?=
 =?us-ascii?Q?TNZ1QEb4lkJ51YTScMrkgkohXGBZJ95oaQBq1miS6KseQ274JObckNwt7ChK?=
 =?us-ascii?Q?fQ4owgEWv5uRlH7uMgsc/12pDO6LUh7Y7X7kLBWxoV2uFcIqCpj3TGfJzFgY?=
 =?us-ascii?Q?QaFH99Jl429TiM5FQ5BQFJLz5eJOVuwPolJWqg3FOjqiPoTzs6GouMP4pOmN?=
 =?us-ascii?Q?+UTqUs/iMAnt4JMqA6k4FGKI5lldE57ilUDu8UzzBhAdSrwRQ8Q9wrnZ0/4M?=
 =?us-ascii?Q?d1lostk7oT6BWzdgaeO/d2nXApUMf8GG3x1oad8tasj8aJwAQ3VM/DsBrO40?=
 =?us-ascii?Q?pZzzrHfkRv8BapPS3MSrzbN8Pa0Gnae3pfkdE1de9AjHCW3h9lXe+BCDRclz?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e903ea-c799-4765-72e9-08dce2f376b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:04:07.7483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0EqtsyPD+/XJxpoT4OArNZB6N1Rw3HkkenRojJtJQyKqUkgpVHjiG5/nd5PXUsNrtUDYiI9rZIEFFV1f5v/dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7737
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

On Tue, Oct 01, 2024 at 04:02:55PM -0500, Lucas De Marchi wrote:
> On Tue, Oct 01, 2024 at 07:24:32PM GMT, apoorva.singh@intel.com wrote:
> > From: Brian Welty <brian.welty@intel.com>
> > 
> > In order to enable access counters, this must be enabled in LRC for
> > the exec_queue. Add basic uAPI to set configuration of access counter
> > trigger threshold and granularity.
> > 
> > When access counters are enabled and threshold is hit, the access
> > counter handler in xe_gt_pagefault.c will migrate the buffer to that
> > to that GT's local VRAM.
> > 
> > Signed-off-by: Brian Welty <brian.welty@intel.com>
> > Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> 
> 
> What do you mean by **Restore**? I'd expect a minimum amount of
> documentation explaining what this is and how a real
> userspace can be used it for implementing X, Y and Z.  Link to userspace
> is also missing, and is required for uapi.
> 

I was going to say do we have user space for this yet? I also suspect
getting this implementation right is going to part of the SVM work. I
personally rather leave this disabled until we get the SVM
implementation for this all worked out so we can freely change this if
required.

I can't imagine any user space is really demanding this to be enabled
yet.

Matt

> Lucas De Marchi
