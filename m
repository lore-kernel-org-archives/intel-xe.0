Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE43C77B7C
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 22:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364DE10E478;
	Mon, 23 Jun 2025 22:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bM0e56OS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B990510E478
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 22:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750718526; x=1782254526;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XQl4pVjLrbbD1aKKjqBZy7X9H4E6GLoDBwdQzYbsSNI=;
 b=bM0e56OSHoWn+IO/yTtFlQciVAxVhG9lTF1LkmekDkvsO1oOzocQs24Y
 wUW5jakq5ZMjtcFf86/xAfHtrwurPNbpWGI43ytgCny0F+PM2kbE+tWhM
 8Qk9S/4W6qTuN8qEHIYAAL7YhAnN6DPgTJhnwezeIqadqspYg79OSEiab
 0Fe4nPambFmCxUJzXdwPZ2ZpWZ+2mlS/1IJbw6OvfCQ4eNuNRvBBLgqjb
 pWk96035gNQtgc9h8iIOEYiJZTupPpTGN0Sh03oXaIQlogLecRpscA7DE
 8JHW7F9yRLAcvnEG+3K7tVTzwaAVvAGRSDGlwiloKKZ/E+feUU4FD9vi4 g==;
X-CSE-ConnectionGUID: D23+JSX6R8qOSOseMwW4xw==
X-CSE-MsgGUID: 850+TObwRy6od/H0UX76dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52059148"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="52059148"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 15:42:00 -0700
X-CSE-ConnectionGUID: yTre1zOVQ7aV1aJ81uposA==
X-CSE-MsgGUID: cJikb+oLRHumVCU7FkKqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="155736784"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 15:41:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 15:41:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 15:41:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.75)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 15:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/CAP98qoyo77KJeO+EW4YhArmi584VVxOjYFJ9OxFjCLWms4Jkq8hqV1R9rBCI5ZibXropSPDb0ozE+Xvmrd2xfrbMp84iHfDzvoeJlpdAL0foZf3XABzXJsyJ2GHtn0Gr68PijLpHz+GrBQqWsODJ1ZO0uCvWCW3DAllgsxz3akZlP8sw2gFHrgb53tnZM/hMRnj97hfj8Wi/e5l8uuqpZkS7mK0qqs2kxlGQHtJIgRGcrXTRK8kZ7+GzTUNwFR4Q/86DmNForbpWOuaGIJhgaFfN+y9N0oCDR8diJKD2JxtqFWZoZSpaRZxorwAziB6DMJmfvfFOhXDsWR8Q/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6gJlcBmwUX/EZq6SHyExdiRM+KkrO/LJhDqQqKxI3ic=;
 b=C0ZlDcSud956MZN8wE7v7gRp3nsWXHnCUiNPi8OtGs09TnEQ2BprrdsSUYa0OsJlytnHyBXz+18kaGf0Td5KG9pzN4F/uUe6zgH+dhEjz0lAv/zxUT/JbfZHoD5hTp3XjpTP/Pw2pdKXZc8Qs9dfaBU7l9ln5MajGPCoPlz08W/KroXLZVywQYrjvV/xPTA1OOrzFxOHhyBBBkEPrzxCvpBw1b8hv6bN4qhaYIkWqtYmEj9vIpp6W6i+DlSjXAL8kriQ9m80RWO8p53af2n1e/60EBaiPW2fyxWpekbxPpWm6RsnDzXybd7bao5BO+B5xymEc5qbUBCeeqnQH93HNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Mon, 23 Jun
 2025 22:41:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 22:41:29 +0000
Date: Mon, 23 Jun 2025 15:43:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 19/20] drm/xe/uapi: Add UAPI for querying VMA count
 and memory attributes
Message-ID: <aFnYfE/zpR4u3u8j@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613125558.2607665-20-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a749d1-9d1e-4a88-715d-08ddb2a71831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Elt0d1F82GqXvhwPZItaqhS1OpZKBsvV1H34V5igfraIuYpWulnLo+TcM/?=
 =?iso-8859-1?Q?9+hhDhyOk5MIOSl4II+k8+8IIrEYX4O4+irqecWzn5HCKjK1PE2Znir1S+?=
 =?iso-8859-1?Q?DR91UgB6/dMx4ro2fnV9mcHGlPLvJDb0vH3Xcnn7UwZnyBu/Jwv1qnAcSO?=
 =?iso-8859-1?Q?B3g+nYfGaCuHX6L7jz8ledGGzsbttdscuQ1OWwwQGggNkx8yrDulWIniTT?=
 =?iso-8859-1?Q?VRtwvqhJ/KN7yvSnWu2Fb/FmeRZ6d0LpBhEEdGCbSc3YpuReR/B3zmn5zD?=
 =?iso-8859-1?Q?YFItgWEEcCCBLpJ6EW5AxEj7Xdhk+e5sXwn1QtoN3M9l3XWjw6W3xo8U7J?=
 =?iso-8859-1?Q?JKmMv5wkBSbPhKw+3l7sFS09FF8kgtSd/M27ajidOn4CkRn1zYo7eYpaVb?=
 =?iso-8859-1?Q?TmatHx2gXlW1o2qEhv5XbhymAniX/CnWBk3duoH5n0RefiKCGITQ5+H7m1?=
 =?iso-8859-1?Q?2aVD4rM9l7eN0QaHm+VksVY+Pmy4i62B5o78kNRx1xYG22m/w8t6KRCnoK?=
 =?iso-8859-1?Q?2E8i7gYYnUYAoH6QYBtwM1wH6AD8etTlRgopNlo5LI9hv/hsaDCJL6uk3X?=
 =?iso-8859-1?Q?7M65IkblWXxXWrGC6OQhVqZ+5KSYh9yD6nihKbgynS1fHNB5dmcvK58KIq?=
 =?iso-8859-1?Q?0BAYWXaFBMVvfvB10ekIq766gVyviAfqmK4BRx+raET0t5akUrW9kNKH2L?=
 =?iso-8859-1?Q?EcgG3e0laXejKgandJgZ6Flqg1c+TC1riZjtFBV3wxBSpD7yLWgQIsVzGH?=
 =?iso-8859-1?Q?QvsYrLqYWPplstXOPMNYs6/wF+ICYwFYOsuOv9wjXVBah5vpggbqQtJ/5/?=
 =?iso-8859-1?Q?42H1jeHjxnRrLwNoTnysyYA3xv/2fOu2eWJpIsa/eIW5hokYq/WU2B+1RK?=
 =?iso-8859-1?Q?Hraej+8rwKFvYlDXesQjE/X2tQ4wlZI+q9GnXb48OOeSh88eYWIoIuWt8z?=
 =?iso-8859-1?Q?U2mxV7ZIRNs3kz3XrOBKEgIZqxCHZChcN6tOo1BluVJyDakzyAjTsuV+o4?=
 =?iso-8859-1?Q?1zuGnxhwMIBTL6nSn4tvAr5OsxHvkwMgmGGOGDb/wrR49bYyJc3sdCDZAE?=
 =?iso-8859-1?Q?U1HnALNCS/AJXb89m+fzwujeBbFwZ2kKqGir5089fWmpDbWuW2RX6bnaB6?=
 =?iso-8859-1?Q?FcUcV2+BJejfP4T6TBYFQIebACzpCahQrgVZWOaA/jtobvQNVjP2GI3SrX?=
 =?iso-8859-1?Q?8VFLxr/sLLxD1JY5AkNW9QJlb1GGOWc2eESurr1RWzn6EOc+diVpm1MzSB?=
 =?iso-8859-1?Q?hDbgAwuuk3IUs6gOUezwkzgRlbFe/LUXyLhMC0srcn+/THjGKZHiM0LRPP?=
 =?iso-8859-1?Q?gKrPzTpH3/DomwHXyCTsASe7k4YF9zUGyxpZzpS6K3q2V1tbqI0acc9e9s?=
 =?iso-8859-1?Q?dy3T+y4msNphqG8o6jDYkQz7TsHfH8wN6LvvmEIyShFHTQKiCdlAyqtqrz?=
 =?iso-8859-1?Q?CoIQfhan5zcbJTD9qTSIz0wWHTMi8N0gkCLW/1JsZy0Mcapf2cONRA06Dd?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?A1Ifto4ZD2A6tupQI9hqc1fAVIdpx8XQCDOBbJo55rifl7tGIUKQ9nFr6r?=
 =?iso-8859-1?Q?G/ffd5fTVrUCBAGHKFfiCRjcpvkBB1twFhRub9pm7OiAkABhFSGoggOAjf?=
 =?iso-8859-1?Q?VeCGMBKk/zmqMSmU2fMVl9TjHRxWhBgTjZwJtO6mmaViiVHTudxHOKMit+?=
 =?iso-8859-1?Q?I47Cbxs8PBVx206eRmB726lxt9UAbqOK5UBrnUc7ngAJIcO2k4VImWaWVQ?=
 =?iso-8859-1?Q?VMNUxbIqAigWw57gcrjuCJaaoyuaoAgin61aSpCCcv0xzw6U7ZfHkmMljB?=
 =?iso-8859-1?Q?QJj8A2jmMzXS1wt94uYGT4gj7NjcoSKTKwgFIMh++yILnXdAVFpidFh+jl?=
 =?iso-8859-1?Q?52BQmbPkq0t8x/H64eha47aaTb0zZtd6foKQAXQv1TwUTQYH1ZsvaDcwLO?=
 =?iso-8859-1?Q?hoZABYe/fOBq5uPeICKwc9WOy5UBqcDV96uC6GGUgUPjOzhXXgVhLJrblS?=
 =?iso-8859-1?Q?4mqpxwE0+GcAVLKs7ppv8tiXPTDiStAbNIQwn9NV1VyiwQRctBPPe8LAYF?=
 =?iso-8859-1?Q?kYxdrgKgrmHIqaI71sHMZc7U8azNVwhHyknnPKKxIM7ATtQT5B4TkITIpx?=
 =?iso-8859-1?Q?L9UcbryeVQV//o1uBOzChvuEdHNKjr/Koube+GICZYOQu+cA/EpWc6DRTr?=
 =?iso-8859-1?Q?qnIvMsGRB0Kx/0sTKRCUdlGKxaWeeQvqzvo8Vrhi9vSb9IJEyrPfnJbYul?=
 =?iso-8859-1?Q?oPiAMuc8dhexBxVWYf+UJV3MtDS1T3M3Jl+1H8vY36NZNvK2PsxWPi98J8?=
 =?iso-8859-1?Q?Aj6rhvtiFvX3CyxaNcvDoMgAZ2v0lgC07sNEm6LVK09JXpVikkwt9TMD7j?=
 =?iso-8859-1?Q?wcq9jQvcfOmOUELMkjlLtjVDbkowvDOeTx5I7A0sltQNMMN1N2yoVA825X?=
 =?iso-8859-1?Q?Vo6D4+FiyvpbwaM4pNgMtcQXR1clF2lXseuR68dognYPJdlJCOrTIaRwDJ?=
 =?iso-8859-1?Q?TCIpDFxYHOlQlMiuLRCpo7QENDpVLflghEFfkZU7EFHJjtFOrUBCLAQpeL?=
 =?iso-8859-1?Q?X5gqNiGFeqo4JxrqRYT52W8QgW78LQuPGqPNiKT9Jbihb2DtE59aPnjn6c?=
 =?iso-8859-1?Q?QeUQo5xwXrnRNNEI39YgkwEJ8ag3tDyyB4YgsgmBJPKoUVfgGpjWAp9iiY?=
 =?iso-8859-1?Q?wAXQ3tRcKWLb7zWRbMqSGz0lOjWuf289aks+Bbsd2cFHnK180Ap293S3Fk?=
 =?iso-8859-1?Q?6EZxfURNE5kUJ51hTfML7YlIArfNx9DDcvH+cs5kXugJPkXM1eyeJF2oAt?=
 =?iso-8859-1?Q?avvN4AzxiqL7ZeP9PZcyY2tU0EyNlGIXaca7FXJ1q4wnr5dv9ozYGLa3j2?=
 =?iso-8859-1?Q?pLWpjB+ZUOwSAxwUNefN7IwY7LdPjkCUTjQ0+1M1mgdyARwft9C+Z5WCts?=
 =?iso-8859-1?Q?nTgRXGnO/5U7m410MyK5lILTUWEvCgbEYvUbUQlvJy8fvr59FG1sYutY3J?=
 =?iso-8859-1?Q?UPLc/t7UH+4kdMQk7eJ9z/rgMFLqVbwVmnLkrz1IpQCakhp9DsmjfoFIJ+?=
 =?iso-8859-1?Q?SX8J57IfCY6oAJA4C9w6miPnay+oyYaQsYj5ibVDYjeWIXN6mZXmpIOll4?=
 =?iso-8859-1?Q?SBhpWHeMz6fwuD+gbTsEQsqc6MqLHzGD/95EASnjsItz9VYWF8OrJj+atn?=
 =?iso-8859-1?Q?7WSpy7VdX9OG7GMrMbhms1s0pLZeRj5RgmXqA5cecAhmUTo1qDZoHefQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a749d1-9d1e-4a88-715d-08ddb2a71831
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 22:41:29.3692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WN7cxoY5inWajDopyq5IwX98LdnYVqWlzuVRgjR358HkwibqlLr78mbYSGqPf0jYTPtFhrdN41TQ78UMYOPyOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6522
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

On Fri, Jun 13, 2025 at 06:25:57PM +0530, Himal Prasad Ghimiray wrote:
> Introduce the DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl to allow userspace
> to query memory attributes of VMAs within a specified virtual address
> range.
> If num_vmas == 0 and vector_of_vma_mem_attr == NULL, the ioctl returns
> the number of VMAs in the specified range.
> If num_vmas > 0 and a valid user pointer is provided in
> vector_of_vma_mem_attr, the ioctl fills the buffer with memory
> attributes for each VMA.
> This two-step interface allows userspace to first query the required
> buffer size, then retrieve detailed attributes efficiently.
> 
> v2 (Matthew Brost)
> - Use same ioctl to overload functionality
> 
> v3
> - Add kernel-doc
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |   1 +
>  drivers/gpu/drm/xe/xe_vm.c     |  89 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h     |   2 +-
>  include/uapi/drm/xe_drm.h      | 130 +++++++++++++++++++++++++++++++++
>  4 files changed, 221 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 632d3ab12392..1f9969acbcd9 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -199,6 +199,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 14e554f3f4d5..d9ce25f3abf4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2171,6 +2171,95 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  	return err;
>  }
>  
> +static void xe_vm_query_vmas(struct xe_vm *vm, u32 *num_vmas, u64 start, u64 end)
> +{
> +	struct drm_gpuva *gpuva;
> +
> +	lockdep_assert_held(&vm->lock);
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end)
> +		(*num_vmas)++;

Return num_vmas rather than pass by reference?

> +}
> +
> +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
> +			 u64 end, struct drm_xe_vma_mem_attr *attrs)
> +{
> +	struct drm_gpuva *gpuva;
> +	int i = 0;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (i == *num_vmas)
> +			return -EINVAL;

Hmm, if the number of num_vmas has changed behind users back (e.g.,
binds happen), I think it is fair to return an error. But I think
-ENOSPC would better and also document what this error code means (e.g.,
call the query IOCTL again with num_vmas == 0 and try again.

> +
> +		attrs[i].start = xe_vma_start(vma);
> +		attrs[i].end = xe_vma_end(vma);
> +		attrs[i].atomic.val = vma->attr.atomic_access;
> +		attrs[i].pat_index.val = vma->attr.pat_index;
> +		attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
> +		attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;

You should either explictly set the reserved bits to zero or kvzalloc
the attrs.

> +
> +		i++;
> +	}
> +
> +	if (i <  (*num_vmas - 1))
> +		*num_vmas = i;
> +	return 0;
> +}
> +
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct xe_file *xef = to_xe_file(file);
> +	struct drm_xe_vma_mem_attr *mem_attrs;
> +	struct drm_xe_vm_query_vmas_attr *args = data;
> +	u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
> +	struct xe_vm *vm;
> +	int err = 0;
> +
> +	if (XE_IOCTL_DBG(xe,
> +			 (args->num_vmas == 0 && attrs_user) ||
> +			(args->num_vmas > 0 && !attrs_user)))
> +		return -EINVAL;
> +
> +	vm = xe_vm_lookup(xef, args->vm_id);
> +	if (XE_IOCTL_DBG(xe, !vm))
> +		return -EINVAL;
> +
> +	down_read(&vm->lock);

down_read_interruptable

> +
> +	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
> +
> +	if (args->num_vmas == 0 && !attrs_user) {
> +		xe_vm_query_vmas(vm, &args->num_vmas, args->start, args->start + args->range);
> +		goto unlock_vm;
> +	}
> +
> +	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
> +				   GFP_KERNEL | __GFP_ACCOUNT |
> +				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> +	if (!mem_attrs) {
> +		err = args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
> +		goto unlock_vm;
> +	}
> +
> +	err = get_mem_attrs(vm, &args->num_vmas, args->start,
> +			    args->start + args->range, mem_attrs);
> +	if (err)
> +		goto free_mem_attrs;
> +
> +	err = __copy_to_user(attrs_user, mem_attrs,

I think copy_to_user is preferred. This is fixed in a bunch of places in
Xe recently.

> +			     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
> +
> +free_mem_attrs:
> +	kvfree(mem_attrs);
> +unlock_vm:
> +	up_read(&vm->lock);
> +	return err;
> +}
> +
>  static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>  {
>  	if (page_addr > xe_vma_end(vma) - 1 ||
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 1fb639a33ffb..e4a601a3583f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -195,7 +195,7 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file);
>  int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>  		     struct drm_file *file);
> -
> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>  void xe_vm_close_and_put(struct xe_vm *vm);
>  
>  static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 81e90270313d..c0aa7c19870e 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -82,6 +82,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
>   */
>  
>  /*
> @@ -104,6 +105,7 @@ extern "C" {
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
>  #define DRM_XE_MADVISE			0x0c
> +#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0d
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -120,6 +122,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> +#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -2093,6 +2096,133 @@ struct drm_xe_madvise {
>  	__u64 reserved[2];
>  };
>  
> +/**
> + * struct drm_xe_vma_mem_attr - Output of &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
> + *
> + * This structure is provided by userspace and filled by KMD in response to the
> + * DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS ioctl. It describes memory attributes of
> + * a VMA within a specified address range in a VM.
> + *
> + * The structure includes information such as atomic access policy, purgeable
> + * state, page attribute table (PAT) index, and preferred memory location.
> + * Userspace allocates an array of these structures and passes a pointer to the
> + * ioctl to retrieve attributes for each VMA
> + *
> + * @extensions: Pointer to the first extension struct, if any
> + * @start: Start address of the virtual memory area
> + * @end: End address of the virtual memory area
> + *
> + * @atomic.val: Value of atomic operation policy
> + * @atomic.reserved: Reserved, must be zero
> + *
> + * @purge_state_val.val: Value for DRM_XE_VMA_ATTR_PURGEABLE_STATE
> + * @purge_state_val.reserved: Reserved, must be zero
> + *
> + * @pat_index.val: Page Attribute Table (PAT) index
> + * @pat_index.reserved: Reserved, must be zero
> + *
> + * @preferred_mem_loc.devmem_fd: File descriptor for preferred device memory
> + * @preferred_mem_loc.migration_policy: Migration policy for memory placement

Double kernel doc for the fields?

> + *
> + */
> +struct drm_xe_vma_mem_attr {
> +	 /** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the vma */
> +	__u64 start;
> +
> +	/** @end: end of the vma */
> +	__u64 end;
> +
> +	struct {

Same thing here, match the order of the defines for these.

Also no need for the outer struct here.

> +		struct {
> +		/** @atomic.val: atomic attribute for vma*/
> +			__u32 val;
> +
> +		/** @atomic.reserved: Reserved */

Alignment is off in my editor.

> +			__u32 reserved;
> +		} atomic;
> +
> +		struct {
> +			/** @pat_index.val: PAT index of vma */
> +			__u32 val;
> +
> +			/** @pat_index.reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;
> +
> +		/** @preferred_mem_loc: preferred memory location */
> +		struct {
> +			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
> +			__u32 devmem_fd;
> +
> +			/** @preferred_mem_loc.migration_policy: Page migration policy */
> +			__u32 migration_policy;
> +		} preferred_mem_loc;
> +	};
> +
> +	 /** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
> +/**
> + * struct drm_xe_vm_query_vmas_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
> + *
> + * This structure is used to query memory attributes of virtual memory areas
> + * (VMAs) within a specified address range in a VM. It provides detailed
> + * information about each VMA, including atomic access policy, purgeable state,
> + * page attribute table (PAT) index, and preferred memory location.
> + *
> + * Userspace first calls the ioctl with @num_vmas = 0 and
> + * @vector_of_vma_mem_attr = NULL to retrieve the number of VMAs in the range.
> + * Then, it allocates a buffer of that size and calls the ioctl again to fill
> + * the buffer with VMA attributes.
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *

I'd show how query is initialized. See drm_xe_device_query kernel doc
for an example.

Matt

> + *     struct drm_xe_vma_mem_attr *attrs;
> + *     __u32 num_vmas;
> + *
> + *     // First call to get number of VMAs
> + *     ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);
> + *     num_vmas = query.num_vmas;
> + *
> + *     // Allocate and query attributes
> + *     attrs = malloc(num_vmas, sizeof(*attrs));
> + *     query.vector_of_vma_mem_attr = (__u64)(uintptr_t)attrs;
> + *     query.num_vmas = num_vmas;
> + *     ioctl(fd, DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS, &query);
> + */
> +struct drm_xe_vm_query_vmas_attr {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +	/** @num_vmas: number of vmas in range */
> +	__u32 num_vmas;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +	/**
> +	 * @vector_of_ops: userptr to array of struct
> +	 * drm_xe_vma_mem_attr
> +	 */
> +	__u64 vector_of_vma_mem_attr;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
