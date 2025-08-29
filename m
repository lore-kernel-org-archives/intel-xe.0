Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88842CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 00:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC2B10E0AA;
	Fri, 29 Aug 2025 00:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhHq5kHm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA73710E0AA
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 00:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756428680; x=1787964680;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0XIuVr73GzcpVUAmb14toQUcABW7x23XdjmmhevDs/I=;
 b=JhHq5kHmrlWV7+FJYzFT2H4ydUiTkbBK/nPDaEt2YYEUPbTHffjvbsU1
 sqP3iCT+Fb2+ekH5+c+zHFSgCi/I/JRU0e/Jgcpv6Fx68Nh+z1RUGIGTS
 7YZczkV5h6JSyg/Tgr9OhcOzcA58/qWcto537w8CMPeL0z/CRdmbElFgD
 CpLLW6zqwFFENDpHqdn+nh9DdTzD3xI4Mp/sloexvSLHc5GNcuFZqxxeS
 D7z83U3/UR6QtdM7XJkpl7DIgm0BHeYlxLhvsQnuWSA2vOq6v3V3gIPNq
 J5402mDlEgdZF9MgORM+XUEZjTTlPVP0ZSSwn4VKGWzYqEH6cWTbWHURR g==;
X-CSE-ConnectionGUID: 8403ArYAQnGxFBoc35qECw==
X-CSE-MsgGUID: sRMrDCnSS2GgyNfvM5DDsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76164255"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76164255"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 17:51:20 -0700
X-CSE-ConnectionGUID: lYgktDuKTaGxh/YfcuQgQg==
X-CSE-MsgGUID: lc91dDq3SoiM4mzPG4CqLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="201197730"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 17:51:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 17:51:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 17:51:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.54)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 17:51:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuZnUZvptIx2RssIbRMzANnque89HGzMJAFJrAdr5C2EK/brjfQXMVBpxYnvnkSdoInuAoWAlhp3Hcu24P8bpLk8kEQctKBRzvfTpkSx8bCDaCXYY9iub2hDDqeZ6oKAN4Crd426tzoR/cwgn9pVz+6zBuBzJQNjOThpvqkliFgmOdEr9hP29c8+sl4jjPqd6/IpYYbY0JHhDwYuin0t6u/j3nhrhtniEIz0PtqPz+lhAFalMr32udiRxUUHaIkUQCYSYDYtsLL7I+Db/EYQbCVJOM21hLlBSEuDey2cDikIWx2tPIuf64zQ8Qn08lBa7sOhy5Zy1LfosBmLw3B6YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQt0HrsOIzSuQpFcsnWKD8URyDVrtyU87hrn8UNEkA4=;
 b=mCWSTTtECvizxl+wR37W/PWtJE41li+Jq1J34m33EjCnQYz1HPcwZ2F4ccv82TfF5iI0hSxSLOnfEi82lnEIfzN+R2Fqp+lp2PiQ8jwQ9wSNL9YWdxa1EmnE+TD4egSxOn9ohHDqtEEbe9oVGf50p3drfvpm9wR9VHQrW3xPgxSi7w676Ujvl70laMrqOaso5vSlTCz/AV7mfe+Sb/EyoLHnjx9HyDEY5ivffvlsGPM8PXBu9ad3GsLoSOUnALOt5/EKwHGY1KmZJsofgPLlLDp9L7OfSr0+D6eoa6DEWdocKD1g9bwgGjk0udah1il87WBvSIuoeN/HgNfjDRo7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 00:51:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 00:51:12 +0000
Date: Thu, 28 Aug 2025 17:51:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 05/11] drm/xe: Implement xe_pagefault_queue_work
Message-ID: <aLD5fKBe3PJ5u3Oq@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-6-matthew.brost@intel.com>
 <166f81266cadb292826b56586d28d5a0fc68b5dd.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <166f81266cadb292826b56586d28d5a0fc68b5dd.camel@intel.com>
X-ClientProxiedBy: BY3PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::14) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 88adc7fc-a3ed-4dde-a91d-08dde696266e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ws3vnwA7Oioshqte/C7O7G1LqT5qIThTUb6df2ahX8R4VSn6RMPBZQGTTg?=
 =?iso-8859-1?Q?Ix5wGMPfEQ/eiErWPcv7oeh/GTRWET6dtoJblez4iTTp82KQDCuoF+u7PX?=
 =?iso-8859-1?Q?E/5MOvjSn77J2OcGoWQ8NC7oA4232KL+Nm8+kOH/INe3SusA/62fDIGUe8?=
 =?iso-8859-1?Q?+F9FX7bIiQ9sgVOprP5NhahTn4mO8EzeLQNLN4w5zFaRHXbJDgdFUoty7e?=
 =?iso-8859-1?Q?/FdRESPd58cR5mwdyqPG5FoTXgK8zZZlBXMLaZwEky3NqGhHhFyeAVrj9M?=
 =?iso-8859-1?Q?m8hmWhQKPS7gW+OtWYw6C4c/HkvLec1F7nOs8QffaJwRtyiM6TQQshlWBm?=
 =?iso-8859-1?Q?jsE8Gp1spGs6+IF2hRktsK14xBdtKiqH8wAQNY/3LPaNr888/V1E7izCAH?=
 =?iso-8859-1?Q?3B4B1vZbpLhK1qDGE7zVmDv6obpd9CGKnEmf9GKBKYJC+irY2BtvCxeEoc?=
 =?iso-8859-1?Q?sCtAJxyT+bAT33aMNIhtx/jaO//iiEEnYYgrra8bc2NwepRgq71U+tkHRT?=
 =?iso-8859-1?Q?9xF9OBq7ltTtDGqm+c2LOJSw7B7P3ZaH0dkcCdbFFWMizFm2aKnyKytauE?=
 =?iso-8859-1?Q?EhSuqMAQ3a8X3sGHNxXKBUJRsmJ/gKm78xotkkvsoMIu3a5db00DT0vTu8?=
 =?iso-8859-1?Q?qAveKVCuyjF83U8ubC38QQmtjZNjVP29w97za1PpvRjUy5H4ez0vvdCKms?=
 =?iso-8859-1?Q?pugXFZ+fpGUctEdU3DGxlWTsAUs5ERuvjwWDl1Ubf4BM5G0Oww7nC71bkK?=
 =?iso-8859-1?Q?j9V5OlsIL0K3QnWTKl6IdM9KNpMme61wCvR3Z/2ZE5c/uXisCl5XEdHkNe?=
 =?iso-8859-1?Q?Sp2rmpjQDSTpeu03V3oS6vOtLfQTZbKn8rTI/w9QEwu7oPHl4JAMz+ajFT?=
 =?iso-8859-1?Q?spJ3gpW8LNwP0vR5eLojKsZa6SFPaG+D1X9d78xM70bqpAtNRMzYKisN4a?=
 =?iso-8859-1?Q?S88hXnBnrgvo51ZIQF0y+H9Nk/Es3e7Duuw9bnPDqgQkWEIPytndvMXfdX?=
 =?iso-8859-1?Q?gR5vpBoqOk60EKv9Ycdv3AYEXmylTP7h6QBt5J8db4VvDzvztlHO40s7RV?=
 =?iso-8859-1?Q?5adtu4CR21IrkPlrKC4wZGu8c2Qh17LppcBxyVh6LgowMS2T8b/+VxoYut?=
 =?iso-8859-1?Q?UguYGU2Vh+3HeY35tQa10Pmt0d7ZJ2638QxAxc46pr5jXPdjwFkiWI0avj?=
 =?iso-8859-1?Q?wkHHgZdyXMZ6xAlCbpRS5eLQWYuc5fPf65243ZuX/b1PkTuwRgTZbX3lFf?=
 =?iso-8859-1?Q?4pu8/zpq+r9E9Joqdo6Ij7D7rgFHq/kew9b3Ssba12EHU9dB9WhELYK4PA?=
 =?iso-8859-1?Q?tEgdsOEro+mLButJwKYXsh60I0w5b5VNooxQ55DBtm5qi8CpSez+emrQqJ?=
 =?iso-8859-1?Q?uGebXegKjpVmiwk1p/4j7pR3+1+6UHeZd96PDRvj+0xb24E+BOada157l9?=
 =?iso-8859-1?Q?fYEXbn7mLzwZuvFkUN/1BkhZQ8kaA8EBrzuD1HpJMHH7uRp2BtU4727Q9A?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EGxpSb/gvVo23VBAYGw/hyZ+ZlOdUXipmA4Ii+cxN/10nyGvMBQxVayjIG?=
 =?iso-8859-1?Q?Ecvb4kO4IHxLTeSu8y8UeYOIL+lIq2sFvzhsawNBOWPvq5CElqLMSRIXOu?=
 =?iso-8859-1?Q?poxtVPFJr4XCEMy2lY+xN+0BlaReFgiX4b49LP8T4tPAAhUYcFsIjdBOOl?=
 =?iso-8859-1?Q?AfKm+r/CO5lyaVzloV4iQZhwQdUqTkKMQ4Vo+CNLTGbkQ1dH10GoK4gAPi?=
 =?iso-8859-1?Q?ArIhY8uvLIfCENbbCH1D0pU+Z2G2t47HRPYsrGk6HP9S5+Yj8Afv6cAEsh?=
 =?iso-8859-1?Q?0Y2FMmxH0Xx1Yc3Ogq+xU09BRm1DI26u7sq4TrtPuvDD0t7w9x7SXv8eju?=
 =?iso-8859-1?Q?jlljhLHujLZEHoQUVjD6YlLYHSwDMG/u+r74P5qpn7nfFmDf30TTe6/ar3?=
 =?iso-8859-1?Q?81dupca2qQK7NM1VuNi//gNk12DH0nwap46s/o4RqVocbucvRPq2fKiOnA?=
 =?iso-8859-1?Q?bSuCvWnEQ8Flbux+hmHVLGdm+WJJ1nS1sQsnCCUxKc6AXRfp4UJ0lX697E?=
 =?iso-8859-1?Q?nOKecCzE0u9PBloijWHyEJWkpFQEhUcwqR0iyoE1yLRHBTnpuGgTwKH3Cw?=
 =?iso-8859-1?Q?wvvsw/zDS8c+L89yadgHOXpc9yzgFHNIsA5F4jCHS4Zyho+F6d2XhRvr/v?=
 =?iso-8859-1?Q?KBf1NAX43GDsArZ7pbnKOOchicCrmRcTM+0yneW3if0SSR/6ICvVHQ5ZWe?=
 =?iso-8859-1?Q?UbnJF/TTTxNm1WYxYJiAQMVeO08D16WP6T3kxa2ii56W5p7LfeOj922y4V?=
 =?iso-8859-1?Q?GLB+euUu6b7rk1fxXDjdk3vengzEbPcZvclcNwziqP3nK1IQmvcdcXLwCk?=
 =?iso-8859-1?Q?2i542p4UDmufpDHOQaojsGXA/jCU5hXCBtbnBq6LqBie4BKzS0Rnz/OBHe?=
 =?iso-8859-1?Q?kRGH9sg7PD9Tb7sLBqWJUWIu/A7WQxQcdechRrAQjp8ttdO4zZKIRjGINw?=
 =?iso-8859-1?Q?1v6zSrDrgnAugfbE99Jyel/1TC/Ayh6D0BXGK4j5qgNWmqUzlVyIboHYdb?=
 =?iso-8859-1?Q?Iuc87pv8qgql+IVSYxZrAkoUmQG6KMJ1LpECjjTg/nxVyubhc4ABVRWatO?=
 =?iso-8859-1?Q?BOYflde+K5VEImkQefmloxyaTBH+4DDDZw4YmPCsrMQBkieBuvPLoOifqU?=
 =?iso-8859-1?Q?FunKI9q8pDzwJ9ttXpKZMRF7ysdzxbQ3FYeamnlO6HU7PTEKXtYruSskAh?=
 =?iso-8859-1?Q?xruNa+z+wxb8KqqaIXd6Fqr2bVPV2RzNgApDqC/mTM/vbyhnsx+br0uOMF?=
 =?iso-8859-1?Q?68WmUJtyQB4qyL57NBgLWtrZN0qx8jG2Tq8zaDdXoXJc09OsXxokaPXQCX?=
 =?iso-8859-1?Q?nvzfDINvfAz6do6vLe7iBPKaq0QzMXOC/5Q4dWpJ97FNAu7IilO5bVl7LO?=
 =?iso-8859-1?Q?0K1yPI/PV5qz6JrFGaU9YnIYgFFezPNfVNA2OZI7sZZoJOkq1tN1Mu47ep?=
 =?iso-8859-1?Q?mbIeF0hH2U2uDWcL6Q5eB89zRgeVTI37Zq941+mCGedzCcjDLopyHdWwUR?=
 =?iso-8859-1?Q?l7Y5hzHWuOeWr+jqNF0iULUCerbG9aaCZHUz8Nyg1ruoP4loK78qw5ry81?=
 =?iso-8859-1?Q?8dkj/yMw4slOaozkCuARmks1eSFOX243M0GHYX39PBYMcoWUqFvJsKj7FY?=
 =?iso-8859-1?Q?4FOy0ajEhzCl05+I4PcoOuz5EQl7NM/TcA40hcb2rKILmmLMzGqGwWTw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88adc7fc-a3ed-4dde-a91d-08dde696266e
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:51:12.3257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ubv8f4inoB36WrcIM0qQhQLr658qFnORr8nyQcQ3o044zYbb5fA7dJoGBrpJzNoauBWHVkpYhfyFcMoZjW8UOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
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

On Thu, Aug 28, 2025 at 04:04:13PM -0600, Summers, Stuart wrote:
> On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > Implement a worker that services page faults, using the same
> > implementation as in xe_gt_pagefault.c.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pagefault.c | 240
> > +++++++++++++++++++++++++++++-
> >  1 file changed, 239 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > index 98be3203a9df..474412c21ec3 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -5,12 +5,20 @@
> >  
> >  #include <linux/circ_buf.h>
> >  
> > +#include <drm/drm_exec.h>
> >  #include <drm/drm_managed.h>
> >  
> > +#include "xe_bo.h"
> >  #include "xe_device.h"
> > +#include "xe_gt_printk.h"
> >  #include "xe_gt_types.h"
> > +#include "xe_gt_stats.h"
> > +#include "xe_hw_engine.h"
> >  #include "xe_pagefault.h"
> >  #include "xe_pagefault_types.h"
> > +#include "xe_svm.h"
> > +#include "xe_trace_bo.h"
> > +#include "xe_vm.h"
> >  
> >  /**
> >   * DOC: Xe page faults
> > @@ -30,9 +38,239 @@ static int xe_pagefault_entry_size(void)
> >         return roundup_pow_of_two(sizeof(struct xe_pagefault));
> >  }
> >  
> > +static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma
> > *vma,
> > +                             bool atomic, unsigned int id)
> > +{
> > +       struct xe_bo *bo = xe_vma_bo(vma);
> > +       struct xe_vm *vm = xe_vma_vm(vma);
> > +       int err;
> > +
> > +       err = xe_vm_lock_vma(exec, vma);
> > +       if (err)
> > +               return err;
> > +
> > +       if (atomic && IS_DGFX(vm->xe)) {
> > +               if (xe_vma_is_userptr(vma)) {
> > +                       err = -EACCES;
> > +                       return err;
> > +               }
> > +
> > +               /* Migrate to VRAM, move should invalidate the VMA
> > first */
> > +               err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
> > +               if (err)
> > +                       return err;
> > +       } else if (bo) {
> > +               /* Create backing store if needed */
> > +               err = xe_bo_validate(bo, vm, true);
> > +               if (err)
> > +                       return err;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma
> > *vma,
> > +                                  bool atomic)
> > +{
> > +       struct xe_vm *vm = xe_vma_vm(vma);
> > +       struct xe_tile *tile = gt_to_tile(gt);
> > +       struct drm_exec exec;
> > +       struct dma_fence *fence;
> > +       ktime_t end = 0;
> > +       int err;
> > +
> > +       lockdep_assert_held_write(&vm->lock);
> > +
> > +       xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
> > +       xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
> > +                        xe_vma_size(vma) / SZ_1K);
> > +
> > +       trace_xe_vma_pagefault(vma);
> > +
> > +       /* Check if VMA is valid, opportunistic check only */
> > +       if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
> > +                                       vma->tile_invalidated) &&
> > !atomic)
> > +               return 0;
> > +
> > +retry_userptr:
> > +       if (xe_vma_is_userptr(vma) &&
> > +           xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
> > +               struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> > +
> > +               err = xe_vma_userptr_pin_pages(uvma);
> > +               if (err)
> > +                       return err;
> > +       }
> > +
> > +       /* Lock VM and BOs dma-resv */
> > +       drm_exec_init(&exec, 0, 0);
> > +       drm_exec_until_all_locked(&exec) {
> > +               err = xe_pagefault_begin(&exec, vma, atomic, tile-
> > >id);
> > +               drm_exec_retry_on_contention(&exec);
> > +               if (xe_vm_validate_should_retry(&exec, err, &end))
> > +                       err = -EAGAIN;
> > +               if (err)
> > +                       goto unlock_dma_resv;
> > +
> > +               /* Bind VMA only to the GT that has faulted */
> > +               trace_xe_vma_pf_bind(vma);
> > +               fence = xe_vma_rebind(vm, vma, BIT(tile->id));
> > +               if (IS_ERR(fence)) {
> > +                       err = PTR_ERR(fence);
> > +                       if (xe_vm_validate_should_retry(&exec, err,
> > &end))
> > +                               err = -EAGAIN;
> > +                       goto unlock_dma_resv;
> > +               }
> > +       }
> > +
> > +       dma_fence_wait(fence, false);
> > +       dma_fence_put(fence);
> > +
> > +unlock_dma_resv:
> > +       drm_exec_fini(&exec);
> > +       if (err == -EAGAIN)
> > +               goto retry_userptr;
> > +
> > +       return err;
> > +}
> > +
> > +static bool
> > +xe_pagefault_access_is_atomic(enum xe_pagefault_access_type
> > access_type)
> > +{
> > +       return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
> > +}
> > +
> > +static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe,
> > u32 asid)
> > +{
> > +       struct xe_vm *vm;
> > +
> > +       down_read(&xe->usm.lock);
> > +       vm = xa_load(&xe->usm.asid_to_vm, asid);
> > +       if (vm && xe_vm_in_fault_mode(vm))
> > +               xe_vm_get(vm);
> > +       else
> > +               vm = ERR_PTR(-EINVAL);
> > +       up_read(&xe->usm.lock);
> > +
> > +       return vm;
> > +}
> > +
> > +static int xe_pagefault_service(struct xe_pagefault *pf)
> > +{
> > +       struct xe_gt *gt = pf->gt;
> > +       struct xe_device *xe = gt_to_xe(gt);
> > +       struct xe_vm *vm;
> > +       struct xe_vma *vma = NULL;
> > +       int err;
> > +       bool atomic;
> > +
> > +       /* Producer flagged this fault to be nacked */
> > +       if (pf->consumer.fault_level == XE_PAGEFAULT_LEVEL_NACK)
> > +               return -EFAULT;
> > +
> > +       vm = xe_pagefault_asid_to_vm(xe, pf->consumer.asid);
> > +       if (IS_ERR(vm))
> > +               return PTR_ERR(vm);
> > +
> > +       /*
> > +        * TODO: Change to read lock? Using write lock for
> > simplicity.
> > +        */
> > +       down_write(&vm->lock);
> > +
> > +       if (xe_vm_is_closed(vm)) {
> > +               err = -ENOENT;
> > +               goto unlock_vm;
> > +       }
> > +
> > +       vma = xe_vm_find_vma_by_addr(vm, pf->consumer.page_addr);
> > +       if (!vma) {
> > +               err = -EINVAL;
> > +               goto unlock_vm;
> > +       }
> > +
> > +       atomic = xe_pagefault_access_is_atomic(pf-
> > >consumer.access_type);
> > +
> > +       if (xe_vma_is_cpu_addr_mirror(vma))
> > +               err = xe_svm_handle_pagefault(vm, vma, gt,
> > +                                             pf->consumer.page_addr,
> > atomic);
> > +       else
> > +               err = xe_pagefault_handle_vma(gt, vma, atomic);
> > +
> > +unlock_vm:
> > +       if (!err)
> > +               vm->usm.last_fault_vma = vma;
> > +       up_write(&vm->lock);
> > +       xe_vm_put(vm);
> > +
> > +       return err;
> > +}
> > +
> > +static bool xe_pagefault_queue_pop(struct xe_pagefault_queue
> > *pf_queue,
> > +                                  struct xe_pagefault *pf)
> > +{
> > +       bool found_fault = false;
> > +
> > +       spin_lock_irq(&pf_queue->lock);
> > +       if (pf_queue->tail != pf_queue->head) {
> > +               memcpy(pf, pf_queue->data + pf_queue->tail,
> > sizeof(*pf));
> > +               pf_queue->tail = (pf_queue->tail +
> > xe_pagefault_entry_size()) %
> > +                       pf_queue->size;
> > +               found_fault = true;
> > +       }
> > +       spin_unlock_irq(&pf_queue->lock);
> > +
> > +       return found_fault;
> > +}
> > +
> > +static void xe_pagefault_print(struct xe_pagefault *pf)
> > +{
> > +       xe_gt_dbg(pf->gt, "\n\tASID: %d\n"
> > +                 "\tFaulted Address: 0x%08x%08x\n"
> > +                 "\tFaultType: %d\n"
> > +                 "\tAccessType: %d\n"
> > +                 "\tFaultLevel: %d\n"
> > +                 "\tEngineClass: %d %s\n",
> > +                 pf->consumer.asid,
> > +                 upper_32_bits(pf->consumer.page_addr),
> > +                 lower_32_bits(pf->consumer.page_addr),
> > +                 pf->consumer.fault_type,
> > +                 pf->consumer.access_type,
> > +                 pf->consumer.fault_level,
> > +                 pf->consumer.engine_class,
> > +                 xe_hw_engine_class_to_str(pf-
> > >consumer.engine_class));
> > +}
> > +
> >  static void xe_pagefault_queue_work(struct work_struct *w)
> >  {
> > -       /* TODO: Implement */
> > +       struct xe_pagefault_queue *pf_queue =
> > +               container_of(w, typeof(*pf_queue), worker);
> > +       struct xe_pagefault pf;
> > +       unsigned long threshold;
> > +
> > +#define USM_QUEUE_MAX_RUNTIME_MS      20
> > +       threshold = jiffies +
> > msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
> > +
> > +       while (xe_pagefault_queue_pop(pf_queue, &pf)) {
> > +               int err;
> > +
> > +               if (!pf.gt)     /* Fault squashed during reset */
> > +                       continue;
> > +
> > +               err = xe_pagefault_service(&pf);
> > +               if (err) {
> > +                       xe_pagefault_print(&pf);
> 
> I realize you're just copying over the existing functionality here.
> Since this is already, but should we change this to an info and use dbg
> to just print all incoming faults?
> 

That spam you'd get would be enormous. Every section of
xe_exec_system_alloc trigger 100s, if not 1000s of faults. We already
have ftrace points for faults if you really want that information.

Matt

> Anyway even if we do want to do this, not really applicable here since
> this is just copying as mentioned.
> 
> With the changes Francois suggested in place:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> Thanks,
> Stuart
> 
> > +                       xe_gt_dbg(pf.gt, "Fault response:
> > Unsuccessful %pe\n",
> > +                                 ERR_PTR(err));
> > +               }
> > +
> > +               pf.producer.ops->ack_fault(&pf, err);
> > +
> > +               if (time_after(jiffies, threshold)) {
> > +                       queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> > +                       break;
> > +               }
> > +       }
> > +#undef USM_QUEUE_MAX_RUNTIME_MS
> >  }
> >  
> >  static int xe_pagefault_queue_init(struct xe_device *xe,
> 
