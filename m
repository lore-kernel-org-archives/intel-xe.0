Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCBDC71135
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 20:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2102710E730;
	Wed, 11 Jun 2025 20:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TqnkHoJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EC110E72A
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 20:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749672641; x=1781208641;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8LDwlMitjNMCsuhTzdB2gCRvaRQmflQ8ms0LHtM4j0k=;
 b=TqnkHoJnaBnOeHqjzjaf59P8xXq7U3tdLAz0jyAR0Y4fvixc/IWALMLh
 1JbnXPHgJFF5+LWlVWogTWaRXmDWQvaGDke3X21Ad+BoOnTZZLLyPlvRF
 We9/FOwTxFPahDlvb4FCYjkQAFHd5Ldh8xF48U1lDsFF80cYuP/YZp3hx
 h0ByizXNVfrnJjHk86gAPV+nLQJYSfxK0tSTayJkXYSS9Jcf4SxurAxYl
 G/RVK5w72Q0bGXsIquz/3zxNDciOzkavBPSBrc2LST6F/z3DK8GZPJJlu
 Ty9PkIoY7SU0Cd+BhsR1DaEOMlogXph1TEKOfLXddEmVkps8fpKYbY+JZ w==;
X-CSE-ConnectionGUID: 0EBsHG0LRzSx9o65qI1mWQ==
X-CSE-MsgGUID: PbsJcE4LRjqVENfxW/41/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51708011"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51708011"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:10:40 -0700
X-CSE-ConnectionGUID: y5usgFQdQqWmsgRU4eAKaA==
X-CSE-MsgGUID: zsPfl9xDTkq4SH2+34U8+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="148202749"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:10:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:10:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 13:10:39 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 13:10:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWlexAjAtogs6VClViqIBkacTapek72COHD2iAIQSnQQ8NHU2ZNgbSYjE/yf9IQGHxh5hxzRhAhVH6NN437KdXFiCnI3/R9ZnAquedSY/4Q2xncDQF1Iee2RNPU9YfLLeKQicBkSH5pH88Kv8jh8w0grN3dzs3xk5/DkayNyXHBRm8zPTkIwovgScaT8yYsPJfkgbzmqumQJ+p1fLn4+WOrxi4HD1an5UWW2RWxXuAtvASv3bqrayYdtVLDimGJgT7oBR8tcxHUyv4qbErY53dQQGORqn8uPy7lsK/qR8MP15UyeMpQIBf7RIuKaqhZfV7mcY/rKdK+0EqP5OPQ8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Ihr+5WL6EGiO4zrNyvKQlMD0a+a0L9IkwXRwPYbMMI=;
 b=iOhsFjHJRzNwLLYalNKzKfUme0lTO0zekMc0Hbn1VuhrGTz8QlRIZf0jJSaJHsmcdCDtWcjXrNMo5B6TdKLhIe0yqS0PZgHBEvvZQwXPe7Tp4nxR/lE1SFQEAfQmLguLx/hOjliqSXUbO/+X6DiHYuSZx9Hxvi7Iav5ME6gJuJ8Om5VhzXfMP2Ec0YyNMAv1bFJTtDPLt2PcObH09/nLf633spnNkoItw17r4zwPMe9g2rAr7nDNmYGEnuoYRrD1eKJJ72mehxkH6VK3vx3o7q86taAIwctCtw+NNbyrvQkPM5dl9gzCVf+xe2jJh42xcQjWLa/eNHpcNQga1G30eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 11 Jun
 2025 20:10:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 20:10:22 +0000
Date: Wed, 11 Jun 2025 15:10:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Yao, Jia"
 <jia.yao@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Nguyen, Brian3" <brian3.nguyen@intel.com>, 
 "Zuo, Alex" <alex.zuo@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>,
 "Patelczyk, Maciej" <maciej.patelczyk@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
Message-ID: <3q6tczaluirw6ezidkrgztowvk57dl72437gwlfanvo5ak5use@2udirsn4ebir>
References: <20250523150418.168362-1-jia.yao@intel.com>
 <20250527163050.287042-1-jia.yao@intel.com>
 <aDYDsozeWc+kpEfV@lstrano-desk.jf.intel.com>
 <DM4PR11MB5456F18EC221141CB3388FE6EA75A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5456F18EC221141CB3388FE6EA75A@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: e002615f-3b69-4b57-0ac0-08dda923fea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FXQyAVcsZOhSL9V4gp8Y2qgAz6nr//RqVUfU/KoMk4V+b4OUGDyV5IdSmAbX?=
 =?us-ascii?Q?R6/hpf7QBGcYgaiQ3tmz4leQYcYvjEFiYaqbpOklEYMyw0Xv5AoA9fa1Sdfm?=
 =?us-ascii?Q?JGqVpcd+YZZodqyQCUMeRiNmQaeIAMkVDWkAJyI2L1eOZxa9WwJWDtiHvIkW?=
 =?us-ascii?Q?kxey9DwoTw6oHNZz3KZMN3AzQJpnb1mQSKj+4vIoakhxpArWvbLbIDD5TlcT?=
 =?us-ascii?Q?u1ONzhgQipRYqnJKVsenNfqzGjCbKcLnvI+sz0PoEwv/9hTqfHNHC6BwG81E?=
 =?us-ascii?Q?Wn/M+Vy9PyLe1L/UCrPP7Y1yg2BLdnM4NzsgS01vw0/f6OtyTPQH6xfG6/6V?=
 =?us-ascii?Q?NAiIzCJRkbDggYkxut5OTiEycR2IpXuoZ7gwrFPm78u2iODHSEK8CgIT2qvl?=
 =?us-ascii?Q?SL3H9l0LmzBDNXOsFZxGzG5leLL7VqdyIrzHbcQQ+g86ZZLyzknNknAgPuDZ?=
 =?us-ascii?Q?QQ0B4NP8br64KsI0q8cio1ETy7HzaaFsd12uaFeaYrTe7EdQyk9Pwh4qLnW6?=
 =?us-ascii?Q?0dE4hLSP5VyLlMQvmLplhzMA/CaNhwiE5Ed0BMGsl2DZINDeEyWMIDzlbuw4?=
 =?us-ascii?Q?UiGfFYKuJrJ8zMlSXwtPvjEtRFFG6OTlKqA89O29NXJ3QSJ3fSLBh+AijQEX?=
 =?us-ascii?Q?ZuZBSQmvRmvGidkY5Jp1gg+eA5PSJyWuDoT+Yip64hX0u658OGTr0gf7J9Yj?=
 =?us-ascii?Q?5Eu3fhdhyk8/H+YL0RfrPc1Gw18DAaK4OpCaMCKdFq62e/OKgECitSqyONze?=
 =?us-ascii?Q?+qroTxjDPPYj8zmEeLR52xBZKZU7XZ7/Nl7QTz0f+nhLe4r9bFwdAtLyXpVl?=
 =?us-ascii?Q?m/wjR0TEACwoqMkaSzy7RA1HCNhNJWkVBzgxReOiCJ/mYzWXCUE/E65LljDW?=
 =?us-ascii?Q?LVvTX0ohp4X7UHVuUxp7DRp0ORt9u8NsnRx986yauxuaA3RUJyy1Q4s44e1K?=
 =?us-ascii?Q?x+T49NEMjiSH940FdH5JGzoyh5qsR3ZvouR4AsWbtC5jpJGdGXpywe+HVsYp?=
 =?us-ascii?Q?J+1B4JkXOJhOwaCN2mNbR+o9zjjFUQF+xtyQgGJ2J0K19BOkMlVgf7WtU9ow?=
 =?us-ascii?Q?BhI6T1LC/HvvuCy2rcxewpuxmvJzlHvGluVa4DBti0ZXFz3diypttilt3HtF?=
 =?us-ascii?Q?nhkH/lGaz8u7XsCm4iU4jVT7UkNbFc2ozf4eJgWR0bQkXPFvJsnE0r9WJ7RF?=
 =?us-ascii?Q?U7zl/56MQTpa9iq/mnqifZevHzuvQeAFyfGptY4ExYubAo8UunUtIyB7cn4h?=
 =?us-ascii?Q?EmcD/NRQSlfEtj/1cAGlXV6oRL371Y/fAel7dL167FR/pT9U1lwLhR8RASIP?=
 =?us-ascii?Q?RQdHNtVQeVIofhV5X3CznbDTKoyH2CxWGN6bNLKOQvBYLBikss+4COTDgOre?=
 =?us-ascii?Q?UYt3NG9mXvggA3WNmQAt2POgxMy9FRp3bRtfjBZe8A9ANdQavGhRKkwC9+Nd?=
 =?us-ascii?Q?cfGWxiNsDM0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CshLV/JsbHUxpfQwS0KRSdCvo47jqtAThsGNvuoOULswf7h2j6KrUBWF+IyI?=
 =?us-ascii?Q?MPhE/aoeAjE0nyDExYokoZKZROnPxgil5pK08B0qDeP0JBTod8tBE1Vz7O38?=
 =?us-ascii?Q?f7hGtseb2Tss2VmkokjRh3L7ts5te5ttN58DqEg6mF3QnS1l82Lb71Qeg4sH?=
 =?us-ascii?Q?GXTmOZ8ea/JWE0BxLisZiSHhuDpxypaqA0sUgwJhoXWFUjFXBF5aa+eQAFnZ?=
 =?us-ascii?Q?t2peQ+S144xCLApIZTVjU5pgEEs2R51mIWyZnnIE15UZowyuigP+UnAg1ceM?=
 =?us-ascii?Q?qt9uoJQblcxTa/UVTB0SeEIK7Jb12YliyKgNdawfJK+VruKpg+TVphYGxFCp?=
 =?us-ascii?Q?kISzWl3Mhagmgk7H+FHwrXYH9AlYxGtjAituIOzH96bNuiOvl1zlkfL9opFO?=
 =?us-ascii?Q?YTDDxtYtLjGirrxshCVjS9XvMkR9syEJfcGJI3LGNaUJxIdi6g9/hKTSvRql?=
 =?us-ascii?Q?pwBb7I/b8JeDVeMuIEE6s8sDRhupeqDB5LDX+yos7LdMTKThClphPaj4Qqgt?=
 =?us-ascii?Q?r0CmZX+SijpNNofT3YqxCvir9wqI2BFKNfbCz8SHvGlgRbHcHMkef9cRk91w?=
 =?us-ascii?Q?uvITKFq7WMw/oRdUMABuQs5jhwl+H3bwNb02oY2o60SD/7ocX/v6YUy/GxXZ?=
 =?us-ascii?Q?UkUuRVgYzVkF2r05ZpcctMaeONqBwofMlLrlTwfXUCOx8Ct7SYAhQlSi5wdl?=
 =?us-ascii?Q?twJFn6yvcTq1ALKEvSz+/usTwcxEllNYMwlc9sfpkbjx88YH6os1vIUegxN5?=
 =?us-ascii?Q?5fJ7jc7EN3KOIw6oeMvo6YeldgEKlxYreCK1pwHbdHK0xQBqrpeezuoSEo3b?=
 =?us-ascii?Q?Vjkg6pGjMD4JNJmhZ2V4aH3mYognkA3rV6WBXbtd0m4a+KEqCD1NUwiTdLct?=
 =?us-ascii?Q?TwzB033K/AH+XSsMVL57jNw+O6jR1/DUsjg1UZUsbctCmuNWOlnBZm4N4OOD?=
 =?us-ascii?Q?wYVVdYMy/GM2IcIfbdHspRHoJNaAZB5aVT1WscaIyR6dLkMfMBKJs51ooKtc?=
 =?us-ascii?Q?bLetJt7LAtWhwjJJ4lXXgRLngi8EYa/QTJGRl4azAVbnKA8Z4s9Vx+Fm+N4r?=
 =?us-ascii?Q?Kh7froXCdjtGdlNy/6UA851zYtQG7+J2t27JoQeOfm2D0pCB8jzmYnUwH2AK?=
 =?us-ascii?Q?4K8+EcvBAmezyuOxtzS6c76FYiFl+ex/B+IgIYVvGAGskmMFioeo5gv3lfXV?=
 =?us-ascii?Q?FAqoJEBnIDeJvLj5rPty5TJj2EQJtS4hzwhsP4MTDsM8D9/bZvs481KKkYWG?=
 =?us-ascii?Q?NdNwK4xheJH387ciSF9xnROYTVQPbM4FsjPIeichDWveNVg//lCv/zlW4Go1?=
 =?us-ascii?Q?GvXjrWGNrkSB0qsXJoCScL7S1ivly6AcQkUn5gF8Q9lLWva+sZDVklqKSReN?=
 =?us-ascii?Q?943c8eolSStirF+LYJvEyNp+KZNgoeDX1vYknvaoT4njL2QetV10aKgioXCn?=
 =?us-ascii?Q?rL0QnYy3T37rMKRBt8+jNoaZJEdMKhgxQN1wqZl4U5b4TyKzDczP+FkBskkG?=
 =?us-ascii?Q?n8MRYsVfg/HVQePU0VaDOq4p2xiJ0hpHXUw9phezmXUosIpsmqT0RFKxeiw+?=
 =?us-ascii?Q?cHZuQ5YB9rpL/vQKJF5TG4SORbHwFVnEqt0cLE5L98KI0o43P1BgJRj9xd2R?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e002615f-3b69-4b57-0ac0-08dda923fea8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 20:10:22.0290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHaco6T6q1ezgw0WvMLKOLLZAi3s3OUH0o0mPtac058ENIX7cxisRSHRTXzBeBQlqOm1+yd5wzXYCcBf3Ky8VPn9SpsViKPAz22g0FiKPUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
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

On Wed, Jun 11, 2025 at 09:17:56AM +0000, Lin, Shuicheng wrote:
>Hi maintainers:
>Just to avoid this patch be missed, could you please help review and merge it?
>Thanks.
>
>Best Regards
>Shuicheng
>
>On Wed, May 28, 2025 2:26 AM Brost, Matthew wrote:
>> On Tue, May 27, 2025 at 04:30:50PM +0000, Jia Yao wrote:
>> > According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE.
>> > The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
>> > condition 2 * x + 1 <= 0x3FE must be satisfied. Therefore, the maximum
>> > valid value for x is 0x1FE, not 0x1FF.
>> >
>> > v2
>> >  - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew &
>> > Patelczyk, Maciej)

it seems some replaces were missed. See below.

>> >
>> > Bspec: 60246
>> >
>> > Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM
>> > support")
>> > Cc: Matthew Brost <matthew.brost@intel.com>
>>
>> Thanks for the fix:
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>> > Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
>> > Cc: Alex Zuo <alex.zuo@intel.com>
>> > Cc: Matthew Auld <matthew.auld@intel.com>
>> > Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
>> > Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
>> > Signed-off-by: Jia Yao <jia.yao@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>> >  1 file changed, 4 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> > b/drivers/gpu/drm/xe/xe_migrate.c index 8f8e9fdfb2a8..1ede50780a14
>> > 100644
>> > --- a/drivers/gpu/drm/xe/xe_migrate.c
>> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> > @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
>> >  	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
>> >  	/*
>> >  	 * MI_STORE_DATA_IMM command is used to update page table. Each
>> > -	 * instruction can update maximumly 0x1ff pte entries. To update
>> > -	 * n (n <= 0x1ff) pte entries, we need:
>> > +	 * instruction can update maximumly 0x1fe pte entries. To update

					    ^ here

>> > +	 * n (n <= 0x1fe) pte entries, we need:

		   ^ and here

>> >  	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
>> >  	 * 2 dword for the page table's physical location
>> >  	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
>> >  	 */
>> > -	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
>> > +	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries,
>> MAX_PTE_PER_SDI);
>> >  	num_dword += entries * 2;
>> >
>> >  	return num_dword;
>> > @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct
>> > xe_migrate *m,
>> >
>> >  	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>> >  	while (ptes) {
>> > -		u32 chunk = min(0x1ffU, ptes);
>> > +		u32 chunk = min(MAX_PTE_PER_SDI, ptes);

and first arg would not be unsigned anymore. Maybe also change the
define to add the u suffix?

Lucas De Marchi

>> >
>> >  		bb->cs[bb->len++] = MI_STORE_DATA_IMM |
>> MI_SDI_NUM_QW(chunk);
>> >  		bb->cs[bb->len++] = pt_offset;
>> > --
>> > 2.34.1
>> >
