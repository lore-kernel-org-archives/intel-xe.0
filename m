Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A183DC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 21:25:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F5A10E085;
	Mon,  9 Jun 2025 21:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nb5Dr8C5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9C710E085
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 21:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749504305; x=1781040305;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2hOuHE/RQp+DHTQV5UziN7N4WW13HRkWEA2fbXLDieI=;
 b=nb5Dr8C5cYKBjmOSFS+ZXFf048OC2LVejmySBo02CgykE3Cpbonp0ml/
 mdQpozYNYNzdAcPch/udE4F0u++fq5YPou82ciU+zGIFKPRlw9RCjAOLn
 GcauDw1BEy/4AMPwUlQP1o+8x+7qsci3neZt5oUdNPvQCi343MMceoD+i
 VkQX4MvL9qj7WofttQrw91ZlFPtTtQi20mSNqrGvkieYyETs2isNpIJvH
 6jqL5dfuUF0GrX69wOxdMJUjtpmw48/RmyPDkvDdinpSBm0JXVC96opod
 EUwaeGT/Acdt2+ara2NsgkyHlQVpb5FYvLwxkXl2rUnY8awrejZx1IljL Q==;
X-CSE-ConnectionGUID: Uhqtr+E1Sa6VtYu/xydH9g==
X-CSE-MsgGUID: UHATVqj0SjuquS+5kX5amQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74131714"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="74131714"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:25:03 -0700
X-CSE-ConnectionGUID: 1ilC4mx9Sgyi2Q/4oIWBaA==
X-CSE-MsgGUID: tHKz5qGyQKyfyITz0AMdEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="147203185"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 14:25:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:25:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 14:25:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 14:25:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqRusVeEPjNyoC4Htmfldsidu7PRV7JPeFLTQH9AW1ocICQVhwWvfcnlsT+ckomHGXnD9nV7D6/YPYBWvmKc6ilQQ3D6W/ejGxhvU0zouDGxgoZIqn5p3suC3TJB8UYLG9g6PbJzqOSxGNW3M9cZ2H8gll5/m7atiLvMQviyb4dBWMBAGx3lTLkh2RnjgnHM5mNrbpvwVLDKPTW5ccEIRGaikx3zVq4hm/WyGf22pN5t/abmtGCWHfSD0CiezTBieOgGrDKmD8o06BSoan3xegft+2JSjNfX1miNp792nRAe1/GqbU9EyfXhbKgOpFhNIx62xCeWCRtrjfrkEgr0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSh9Xlv99nddcl6l5BTszaN0uwT5fHfH2bnBjGQoYWk=;
 b=EMLPr/gbunuX5ApYbUajMFY61kSz+y/35K5+eb4kAGw9Iyvc2jQzUKmglqy8mx8HIhYFXi/isw3n/77XXlESLSvC978NWOo0ZnOG+RtcKp1OxEzb2MqgIqHJjq6rKpo9FyWpXmk444u93vkEFdQfSGn/e8vHzy/T8uqN2vn+L5WMJ+43G2LEhhKOrnaoE7REDttzhLpRUlCsTYZBsf235E34MVO8yjeq41GhR2+SVR/123GevLssfyLhQ7cg5yrl66q5diwooQVTo5Y0ettxj1KZOdU4HhI/FcHdU8H9eYKRoKDCcavA8kjQUx5mKdzwV7b+nxjyRhK8//kxbGoNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8559.namprd11.prod.outlook.com (2603:10b6:408:1e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 21:24:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 21:24:59 +0000
Date: Mon, 9 Jun 2025 14:24:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Promote struct xe_tile definition to own file
Message-ID: <20250609212456.GN5080@mdroper-desk1.amr.corp.intel.com>
References: <20250603202826.681-1-michal.wajdeczko@intel.com>
 <20250603202826.681-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250603202826.681-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c45bfe5-7521-4bb2-f83c-08dda79c1652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vIiFitQm+kIIcXBiF4T/nxHnbWhTWp0ZDNh1DYv14tE/cK38YznbEZ0YCP?=
 =?iso-8859-1?Q?7iL3XiPHhVS62OGJjcGOQvEziNTVdRJbwsLnnWVBqkaMBp94zWWrqwvpr4?=
 =?iso-8859-1?Q?erMnAMYGXrp2UfP/XtHT7yjF9OqiUy1ZohP2zF+mM/7Wc8fJFIjbmlq2Gw?=
 =?iso-8859-1?Q?NVADQ7gAVHDiTY3SjEnpSbgNpj5h5y3Xe4h4Bigw/6KZiX1rcbmRDkaOxG?=
 =?iso-8859-1?Q?uadtyESazEzd+QbEGxywdzkd8LEacU5+hxrktz8Md21MOyr//zzy+NVooj?=
 =?iso-8859-1?Q?o+ahfZOb828qXjT7EkP5sT1GdXZj8bN/fLeSF9VRRSM3xaQK2zQSoAsF5b?=
 =?iso-8859-1?Q?6Uay0YXqIhlCXlTjrH2wpUnmjvB9UaywC4YxlSlaSEcn3F9Wk/zSEunRSp?=
 =?iso-8859-1?Q?r9dOgCgGbSRR3xJnwMwJH+dumANyMnQ7BVeof5kLrq1t5ZpgvpOw1rwTH9?=
 =?iso-8859-1?Q?fuZTz9h35y0Y6VNZyay6z1i/GqlJX6yAf4oeBvaSJnB+w+968zcPBe7olj?=
 =?iso-8859-1?Q?YDBAxJRmFPGzwS00rOvQM3WFl5okeUIZvrR2CL4sg7ABQJ68QfcKjc2Fio?=
 =?iso-8859-1?Q?GBSi+DxWxkALuvm8e8kJ7Gk5Z1ijOQ3cGIFOHXi+urg7RV4UHantXE5Jpn?=
 =?iso-8859-1?Q?cR/Lxi1BvPKRhd2GQvLC9i3qFxInOh++P4QkhpVvREtPu90JN+sJSOyYfY?=
 =?iso-8859-1?Q?fy2lkd8zJJKhzhHsFvQec2XZKjJLa1x/N9ImPw+3JNkmH3dMslcO0LKN0j?=
 =?iso-8859-1?Q?UvHHTRGA/KWtYh61FpufwR2wiEGJP50P22EAlrtcn7ZZ+Vtitih6HgGKLL?=
 =?iso-8859-1?Q?Xzr1GSJSE/o5dMXbo/UCHsgqG0oLGOCKZd3bdHvCl/KVurMM+m/Jf8Z/4v?=
 =?iso-8859-1?Q?6LhWb8aDR8g7ZFg7UHl8cfqVtEr/sRzWKaGa4kDgMf57z8sKQV6FDi3HZq?=
 =?iso-8859-1?Q?Ujk9rcR36RqNXgHwtJInrbQp/+TmNAa5fkH0bYerYZykKJwNy2Z5yVrWSq?=
 =?iso-8859-1?Q?LcwmJaB14Loo9zrKgmV9Q+BZd77JJa6AW1mt/SZJsOJfJ+RxR168971ZtT?=
 =?iso-8859-1?Q?ee/d3ugX0+aZVN5jjkC0QaHPESdjSh8J3w5HoOQBiuJCeOsCuCcewwPhI1?=
 =?iso-8859-1?Q?R2l3Dz2FgB7w83xxWBzgQ47IwrV5uT+r6YxrWP0u+SHGF1vRTERlYTnNnf?=
 =?iso-8859-1?Q?1qaKGmmFYdLTYD2+1wgFbnWrdghzyQ0wlVBC23SIiog4uBVdinDAXNGoa8?=
 =?iso-8859-1?Q?mD45i33MBlU81Di1tEZdElJppSzwnf4ybOd7L8GdhHAajz3+1s2iAC38yl?=
 =?iso-8859-1?Q?807Kevzw9O9iQkROoobD3oQwtXJA90wfH7v0VcCKAK3nFFGEywAQ8dLaiJ?=
 =?iso-8859-1?Q?eFvIicQ+hD+XXcQeobc5ItjozeFyRjjxwpCG4dIDYn0VVVf8fUaj6Aj4r2?=
 =?iso-8859-1?Q?TbumcxwINHbt276tpeDjCM/RL3UupXASn1k5QIGw8h593m9zn1jtfyA/Al?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UCXAjFkbHvqR+qRzJsiiZpM0l0Fj5Ca+vl3KiakSepgWZRt9tCBO3C1Pwp?=
 =?iso-8859-1?Q?AFMBvHgg5lwBh72/p2ASw5oe1Pg1lxdZtTnKF2D98+xzxN0e6i8BBv59oE?=
 =?iso-8859-1?Q?tehBYXJMVhgpy86dyah0uJ7dLo/KFqAmBQxcpb4vzBfwS6HNhpkoVPD2P5?=
 =?iso-8859-1?Q?SuH/1T2vqDlTL3rjrjUl4rMWvs5uXgdHWKRJxdFREm3C2XVQR/FuDzthHX?=
 =?iso-8859-1?Q?k51ZG1wht+EC1Oj2TjtutvBVfMUoDNnYS1BK13gV0HC5ZRgR0VQV4Oq4ir?=
 =?iso-8859-1?Q?hX81gRE36d9Wb2IlUGS+SyVR2OfNyZau0CHIgS/A1i+IlyE4dhAqkPmqla?=
 =?iso-8859-1?Q?b1bvkW0GzIjRLsPD4L74JucW9K0b0RK9Ccqn48AqGF8EYvWyuOgUK0gAX5?=
 =?iso-8859-1?Q?9qo9fY2UswTdJa3ujfmOL9rq2WYjihNMQAGGDKW7loU5OXPByDeiBkbaZX?=
 =?iso-8859-1?Q?Ct2M9A2dq/sRk16G0WaFJydvS2eTq5CgKMRRjAzubZIiLpeJMnodxhQfI9?=
 =?iso-8859-1?Q?Ubp1tx3QmQVVG8eicR8HnEasSAkyZhvT/CqaKf3A5N1xd5qWSYVF/S/+v0?=
 =?iso-8859-1?Q?G3izM+ZIAgzazIAeuyqiUPQLDxiDiBeUFdkdYnQ3LxEapQNtGYgH2qcO3w?=
 =?iso-8859-1?Q?9WM+5/R6YeIhC5wn1WhvnWs6ohQIi2RJbucfQQ4ZnQQoErxpmKxw6HK07T?=
 =?iso-8859-1?Q?1mtETwUncNdjU8QaWwcJ0hbulbe1mthzBN54r4RaxohbulNz5iQXW5edgU?=
 =?iso-8859-1?Q?LQfgqjLMemUfUGr/q0PX2Gjh/nU9zm5EH18Zi4wMEP+6W2siey29deTs+a?=
 =?iso-8859-1?Q?fT9P49VKnh0jbQQOIjJQNGMEHBC5mPDcJjJndNEXXYXWjGXgopbMThg+N2?=
 =?iso-8859-1?Q?Mev50sgAmwLY7eA1BeNS+EGzZlMY4ayM3JknHp/R7SNYrCfJi3OlLCNCeE?=
 =?iso-8859-1?Q?HGKPDzQU5RemziWfuoc8rdR+GlC29pwab381kxR5nngjMD2UZLVLzdWBfW?=
 =?iso-8859-1?Q?gocupy+JRqyNEweMUCLTHRgMywBuQoTF6jB64FnymSBXiZTyaXS32BGXpy?=
 =?iso-8859-1?Q?o9J6qvv024siz74HCAq1Vj7qapIdU3E9yD8DPUqHoRJJkenUp/LQ17gb8+?=
 =?iso-8859-1?Q?aE2LhezG8bBao9n91AXwQO1ouG/6N4Ztcz1qkK9+9e3cQtZAr+T3wgCVI8?=
 =?iso-8859-1?Q?yEIZQzdnww9QqLIYOd8Ms6uwvSGUDE7jbom5IBO8GEmxhreRsubWXO0vLP?=
 =?iso-8859-1?Q?7U7/b74Ilh/2Nc+Fk5vdr/KNkSM6kKREy+6usAtzP09r2zGA+znHUsC/xX?=
 =?iso-8859-1?Q?42twYVXEY0i7Ja78eVVGITRhnrL9oxxxF6j0wbpVvpR1rPAKyrjs6jjJvB?=
 =?iso-8859-1?Q?tSwrKL2b78q7Xu/iTEdq00OpBNNd6wGpSsgiUDNjBq/JKZLkUgkfYK7oD+?=
 =?iso-8859-1?Q?luJrKu6Vk8K0upkGZYTDxWr22NeummYOpto6GmmRbU48VklaHQd830YGAv?=
 =?iso-8859-1?Q?+Mm9KqEYsf5vFv+LCiJfkPkQIRuAWOsd7i9d7l+HofHUp0Adr9d+VlSHS9?=
 =?iso-8859-1?Q?LJMvVI1rCCDunqnzxcH40NG4EgCSfflX8FHmHe7ee6rttDkyiTxM2xAMFn?=
 =?iso-8859-1?Q?Jwx12DOXwE59nE46CHv6zugZ/lAAAnHJ6iug9juQ6MvT4MJlNomhrRaA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c45bfe5-7521-4bb2-f83c-08dda79c1652
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 21:24:58.9860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jP0Qc0YPwL0TaujRFne8/MgQoD0bGnOJbi+7tNQGQA1CXpb/5qG8Y8Jf7yQ+aL54J9fq6N3vVv0vE3E99M+hqnB2HdAOgQguyRme7gzTBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8559
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

On Tue, Jun 03, 2025 at 10:28:25PM +0200, Michal Wajdeczko wrote:
> We already have separate .c and .h files for xe_tile functions,
> time to introduce _types.h to follow what other components do.

Solely looking at today's code this movement makes sense, but looking
forward it might make sense to put the vram region in its own header
since it likely won't always be as closely tied to a tile.  See, for
example, this in-flight patch which is breaking some of the hard-coded
relationship between tile/vram:

https://lore.kernel.org/all/20250528074743.2027563-2-piotr.piorkowski@intel.com/


Matt

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 159 +------------------------
>  drivers/gpu/drm/xe/xe_tile_types.h   | 172 +++++++++++++++++++++++++++
>  2 files changed, 173 insertions(+), 158 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_tile_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 831dd88a4c52..c9401acb6710 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -10,14 +10,10 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> -#include <drm/drm_pagemap.h>
>  #include <drm/ttm/ttm_device.h>
>  
>  #include "xe_devcoredump_types.h"
>  #include "xe_heci_gsc.h"
> -#include "xe_lmtt_types.h"
> -#include "xe_memirq_types.h"
> -#include "xe_mmio_types.h"
>  #include "xe_oa_types.h"
>  #include "xe_platform_types.h"
>  #include "xe_pmu_types.h"
> @@ -25,14 +21,13 @@
>  #include "xe_sriov_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
> -#include "xe_ttm_vram_mgr_types.h"
> +#include "xe_tile_types.h"
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  #define TEST_VM_OPS_ERROR
>  #endif
>  
>  struct intel_display;
> -struct xe_ggtt;
>  struct xe_pat_ops;
>  struct xe_pxp;
>  
> @@ -62,158 +57,6 @@ struct xe_pxp;
>  	 (_xe)->info.step.graphics >= (min_step) &&			\
>  	 (_xe)->info.step.graphics < (max_step))
>  
> -#define tile_to_xe(tile__)								\
> -	_Generic(tile__,								\
> -		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> -		 struct xe_tile * : (tile__)->xe)
> -
> -/**
> - * struct xe_vram_region - memory region structure
> - * This is used to describe a memory region in xe
> - * device, such as HBM memory or CXL extension memory.
> - */
> -struct xe_vram_region {
> -	/** @io_start: IO start address of this VRAM instance */
> -	resource_size_t io_start;
> -	/**
> -	 * @io_size: IO size of this VRAM instance
> -	 *
> -	 * This represents how much of this VRAM we can access
> -	 * via the CPU through the VRAM BAR. This can be smaller
> -	 * than @usable_size, in which case only part of VRAM is CPU
> -	 * accessible (typically the first 256M). This
> -	 * configuration is known as small-bar.
> -	 */
> -	resource_size_t io_size;
> -	/** @dpa_base: This memory regions's DPA (device physical address) base */
> -	resource_size_t dpa_base;
> -	/**
> -	 * @usable_size: usable size of VRAM
> -	 *
> -	 * Usable size of VRAM excluding reserved portions
> -	 * (e.g stolen mem)
> -	 */
> -	resource_size_t usable_size;
> -	/**
> -	 * @actual_physical_size: Actual VRAM size
> -	 *
> -	 * Actual VRAM size including reserved portions
> -	 * (e.g stolen mem)
> -	 */
> -	resource_size_t actual_physical_size;
> -	/** @mapping: pointer to VRAM mappable space */
> -	void __iomem *mapping;
> -	/** @ttm: VRAM TTM manager */
> -	struct xe_ttm_vram_mgr ttm;
> -#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> -	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> -	struct dev_pagemap pagemap;
> -	/**
> -	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> -	 * pages of this tile.
> -	 */
> -	struct drm_pagemap dpagemap;
> -	/**
> -	 * @hpa_base: base host physical address
> -	 *
> -	 * This is generated when remap device memory as ZONE_DEVICE
> -	 */
> -	resource_size_t hpa_base;
> -#endif
> -};
> -
> -/**
> - * struct xe_tile - hardware tile structure
> - *
> - * From a driver perspective, a "tile" is effectively a complete GPU, containing
> - * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
> - *
> - * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
> - * device and designate one "root" tile as being responsible for external PCI
> - * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
> - * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
> - * with each tile similarly.  Device-wide interrupts can be enabled/disabled
> - * at the root tile, and the MSTR_TILE_INTR register will report which tiles
> - * have interrupts that need servicing.
> - */
> -struct xe_tile {
> -	/** @xe: Backpointer to tile's PCI device */
> -	struct xe_device *xe;
> -
> -	/** @id: ID of the tile */
> -	u8 id;
> -
> -	/**
> -	 * @primary_gt: Primary GT
> -	 */
> -	struct xe_gt *primary_gt;
> -
> -	/**
> -	 * @media_gt: Media GT
> -	 *
> -	 * Only present on devices with media version >= 13.
> -	 */
> -	struct xe_gt *media_gt;
> -
> -	/**
> -	 * @mmio: MMIO info for a tile.
> -	 *
> -	 * Each tile has its own 16MB space in BAR0, laid out as:
> -	 * * 0-4MB: registers
> -	 * * 4MB-8MB: reserved
> -	 * * 8MB-16MB: global GTT
> -	 */
> -	struct xe_mmio mmio;
> -
> -	/** @mem: memory management info for tile */
> -	struct {
> -		/**
> -		 * @mem.vram: VRAM info for tile.
> -		 *
> -		 * Although VRAM is associated with a specific tile, it can
> -		 * still be accessed by all tiles' GTs.
> -		 */
> -		struct xe_vram_region vram;
> -
> -		/** @mem.ggtt: Global graphics translation table */
> -		struct xe_ggtt *ggtt;
> -
> -		/**
> -		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
> -		 *
> -		 * Media GT shares a pool with its primary GT.
> -		 */
> -		struct xe_sa_manager *kernel_bb_pool;
> -	} mem;
> -
> -	/** @sriov: tile level virtualization data */
> -	union {
> -		struct {
> -			/** @sriov.pf.lmtt: Local Memory Translation Table. */
> -			struct xe_lmtt lmtt;
> -		} pf;
> -		struct {
> -			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> -			struct xe_ggtt_node *ggtt_balloon[2];
> -		} vf;
> -	} sriov;
> -
> -	/** @memirq: Memory Based Interrupts. */
> -	struct xe_memirq memirq;
> -
> -	/** @pcode: tile's PCODE */
> -	struct {
> -		/** @pcode.lock: protecting tile's PCODE mailbox data */
> -		struct mutex lock;
> -	} pcode;
> -
> -	/** @migrate: Migration helper for vram blits and clearing */
> -	struct xe_migrate *migrate;
> -
> -	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> -	struct kobject *sysfs;
> -};
> -
>  /**
>   * struct xe_device - Top level struct of XE device
>   */
> diff --git a/drivers/gpu/drm/xe/xe_tile_types.h b/drivers/gpu/drm/xe/xe_tile_types.h
> new file mode 100644
> index 000000000000..572b6c4b651d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_tile_types.h
> @@ -0,0 +1,172 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2025 Intel Corporation
> + */
> +
> +#ifndef _XE_TILE_TYPES_H_
> +#define _XE_TILE_TYPES_H_
> +
> +#include <drm/drm_pagemap.h>
> +
> +#include "xe_lmtt_types.h"
> +#include "xe_memirq_types.h"
> +#include "xe_mmio_types.h"
> +#include "xe_ttm_vram_mgr_types.h"
> +
> +struct xe_device;
> +struct xe_ggtt;
> +struct xe_gt;
> +
> +#define tile_to_xe(tile__)								\
> +	_Generic(tile__,								\
> +		 const struct xe_tile * : (const struct xe_device *)((tile__)->xe),	\
> +		 struct xe_tile * : (tile__)->xe)
> +
> +/**
> + * struct xe_vram_region - memory region structure
> + * This is used to describe a memory region in xe
> + * device, such as HBM memory or CXL extension memory.
> + */
> +struct xe_vram_region {
> +	/** @io_start: IO start address of this VRAM instance */
> +	resource_size_t io_start;
> +	/**
> +	 * @io_size: IO size of this VRAM instance
> +	 *
> +	 * This represents how much of this VRAM we can access
> +	 * via the CPU through the VRAM BAR. This can be smaller
> +	 * than @usable_size, in which case only part of VRAM is CPU
> +	 * accessible (typically the first 256M). This
> +	 * configuration is known as small-bar.
> +	 */
> +	resource_size_t io_size;
> +	/** @dpa_base: This memory regions's DPA (device physical address) base */
> +	resource_size_t dpa_base;
> +	/**
> +	 * @usable_size: usable size of VRAM
> +	 *
> +	 * Usable size of VRAM excluding reserved portions
> +	 * (e.g stolen mem)
> +	 */
> +	resource_size_t usable_size;
> +	/**
> +	 * @actual_physical_size: Actual VRAM size
> +	 *
> +	 * Actual VRAM size including reserved portions
> +	 * (e.g stolen mem)
> +	 */
> +	resource_size_t actual_physical_size;
> +	/** @mapping: pointer to VRAM mappable space */
> +	void __iomem *mapping;
> +	/** @ttm: VRAM TTM manager */
> +	struct xe_ttm_vram_mgr ttm;
> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> +	 * pages of this tile.
> +	 */
> +	struct drm_pagemap dpagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
> +#endif
> +};
> +
> +/**
> + * struct xe_tile - hardware tile structure
> + *
> + * From a driver perspective, a "tile" is effectively a complete GPU, containing
> + * an SGunit, 1-2 GTs, and (for discrete platforms) VRAM.
> + *
> + * Multi-tile platforms effectively bundle multiple GPUs behind a single PCI
> + * device and designate one "root" tile as being responsible for external PCI
> + * communication.  PCI BAR0 exposes the GGTT and MMIO register space for each
> + * tile in a stacked layout, and PCI BAR2 exposes the local memory associated
> + * with each tile similarly.  Device-wide interrupts can be enabled/disabled
> + * at the root tile, and the MSTR_TILE_INTR register will report which tiles
> + * have interrupts that need servicing.
> + */
> +struct xe_tile {
> +	/** @xe: Backpointer to tile's PCI device */
> +	struct xe_device *xe;
> +
> +	/** @id: ID of the tile */
> +	u8 id;
> +
> +	/**
> +	 * @primary_gt: Primary GT
> +	 */
> +	struct xe_gt *primary_gt;
> +
> +	/**
> +	 * @media_gt: Media GT
> +	 *
> +	 * Only present on devices with media version >= 13.
> +	 */
> +	struct xe_gt *media_gt;
> +
> +	/**
> +	 * @mmio: MMIO info for a tile.
> +	 *
> +	 * Each tile has its own 16MB space in BAR0, laid out as:
> +	 * * 0-4MB: registers
> +	 * * 4MB-8MB: reserved
> +	 * * 8MB-16MB: global GTT
> +	 */
> +	struct xe_mmio mmio;
> +
> +	/** @mem: memory management info for tile */
> +	struct {
> +		/**
> +		 * @mem.vram: VRAM info for tile.
> +		 *
> +		 * Although VRAM is associated with a specific tile, it can
> +		 * still be accessed by all tiles' GTs.
> +		 */
> +		struct xe_vram_region vram;
> +
> +		/** @mem.ggtt: Global graphics translation table */
> +		struct xe_ggtt *ggtt;
> +
> +		/**
> +		 * @mem.kernel_bb_pool: Pool from which batchbuffers are allocated.
> +		 *
> +		 * Media GT shares a pool with its primary GT.
> +		 */
> +		struct xe_sa_manager *kernel_bb_pool;
> +	} mem;
> +
> +	/** @sriov: tile level virtualization data */
> +	union {
> +		struct {
> +			/** @sriov.pf.lmtt: Local Memory Translation Table. */
> +			struct xe_lmtt lmtt;
> +		} pf;
> +		struct {
> +			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> +			struct xe_ggtt_node *ggtt_balloon[2];
> +		} vf;
> +	} sriov;
> +
> +	/** @memirq: Memory Based Interrupts. */
> +	struct xe_memirq memirq;
> +
> +	/** @pcode: tile's PCODE */
> +	struct {
> +		/** @pcode.lock: protecting tile's PCODE mailbox data */
> +		struct mutex lock;
> +	} pcode;
> +
> +	/** @migrate: Migration helper for vram blits and clearing */
> +	struct xe_migrate *migrate;
> +
> +	/** @sysfs: sysfs' kobj used by xe_tile_sysfs */
> +	struct kobject *sysfs;
> +};
> +
> +#endif
> -- 
> 2.47.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
