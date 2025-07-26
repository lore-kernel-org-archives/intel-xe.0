Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A42C87FCA
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 12:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B2B10E26D;
	Sat, 26 Jul 2025 12:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hchqK6J6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A283610E26D
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753531365; x=1785067365;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w2+IAsYz6fFXKR3F3P/PJhmCDBOf1qnFOd+PRm9FJZA=;
 b=hchqK6J6qd85Ji6lV99nK0xg/S136sYX9YmxD38MzAjCLStqvFJ0D4mr
 YOn/2DI0BPLuRKYWdLUInt5OJiPXNDito4kgx7CRe38Y7x8TjWZRAAj62
 qcWQ3ppGq+ZtCS1bobeL9U9QgaNpci1g0nyzgZ4oFtl3bZbjKX2W1l6CI
 IzryktAAC5kCFRFVgZKghdb+vcASZY53x53ryjoRF9oMu5DdXTTjhS7WR
 gtHUUBcHEnPXyiuxnBFnJiASiYJ+pGOaznh0RDMJnkUJfpC2egy9JbbX9
 DsKZJalPgAYsQX0Qr6nmAHCUGiAHTInAjM1PaU4EQqiQ7mft4QNk0dNEC g==;
X-CSE-ConnectionGUID: 05+L2tzxTsSNKtGt7cZT2Q==
X-CSE-MsgGUID: Ug6Y1+26QxSeDNkPMFZIMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="66925078"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66925078"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 05:02:44 -0700
X-CSE-ConnectionGUID: TCaXbXGbQ1eyLzCRctp8DQ==
X-CSE-MsgGUID: uDIcjbopQYGSw0NoK4EWEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="161887213"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2025 05:02:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 26 Jul 2025 05:02:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sat, 26 Jul 2025 05:02:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 26 Jul 2025 05:02:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kn/Uxc2VJ49Yj0yfko2lgFt7Mve2DFpzvg2RYeZJrY8HhZNAsPRQ68+kjhBVv0cgywMCCqEogc6uFAKHCuSfJcadSPp9uZLtgACVeJoiqk4ONk/ItB4EUtL8YFVixa6q+UrevDN4pA4ISlX2pci36Bacb1Upc8ZmU3TIHb8dmUoc6ANVv1RSctX1qt3ez75sSAgUw4NRLESKpj4KkXu0SqyLp7Qv7ZJwPKIBh61BmLipm1LJ7FYQZdEViE+Z8EPe1Lr19ACmHr4lNVcHGu9LzjLuA5lhxGp/F2Zg8YWmMBbAXWfQaDvU9fl8IHS5+r3kdbRhrAPGFTepQTxliKYVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MPC0nIvNm0u7T/fuEti/hGQFpKqo1CyrZnaVj5EFpE=;
 b=IiewWLuBIWL6qF1xogRcUKoFeJ7Ng0WrMzR8FvuNKiUNcBa4R8PFMTv+GleXAqYv7+DFFK5fQlH3mtBbVjvWmD8nLxgbTKepsjMTEBYG3K5m2cBPznO1cI0+83Iyj1CTmx9o7uzgFEa8H7vqCkmY4vcuFTbbrszGusX81wqUScSidZUeTGybz1sOn3tdofvSlfIVWG0xMhX8XbfZKeRXV0+nG2YOPCHGP0Y4S84KDr0zTaDhl1LarUvXaADxPKTSmpopvGz8J+P01yIZlBZ3skzV+NIRqHLCbKzFB13l8TznOUxWjG6NIF80Nyq7sa2SLix2m7W6RSvxqhpKuKzhOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8858.namprd11.prod.outlook.com (2603:10b6:806:46a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Sat, 26 Jul
 2025 12:02:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8964.021; Sat, 26 Jul 2025
 12:02:38 +0000
Date: Sat, 26 Jul 2025 09:02:30 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilia Levi <ilia.levi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <koby.elbaz@intel.com>,
 <konstantin.sinyuk@intel.com>, <yaron.avizrat@intel.com>,
 <moti.haimovski@intel.com>, <didi.freiman@intel.com>,
 <tejas.upadhyay@intel.com>, <matthew.auld@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>
Subject: Re: [PATCH v4] drm/xe: Support for mmap-ing mmio regions
Message-ID: <mgyarnkqmv36pgifjqeqdsmzscolclaah34vsvlwiyzn5ns4uk@vz737ap3n2o7>
References: <20250714122658.1803-1-ilia.levi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250714122658.1803-1-ilia.levi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0127.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e305c15-d9d9-4931-6beb-08ddcc3c509e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vma+tZg1cyELzAvxPlBVgT8GMaf99iFUsX8PNWzauB6SQU6nWSSjXsg7Zj?=
 =?iso-8859-1?Q?CGTKoUHfBayZ9o7HBjovjQe/LKm47ty2LfT1jwAl0vpWxD+pYTlqLVOMDq?=
 =?iso-8859-1?Q?bT91pOlTAdEch7N84gKm5POJ9xzlptz7mv+//6wgNTumpqdGR0G3twwInw?=
 =?iso-8859-1?Q?SwgXnz/T7YmnwcEjfnQXj+yf55H599opDmXoql+2wcPxAmvZ3vbEGrzzwS?=
 =?iso-8859-1?Q?r8eMmSOW0RG0vr8ZuD9BYeCYKQ6IdYJIxj/HRpe/4YkPpMxmGXKaEFfCmF?=
 =?iso-8859-1?Q?RVUDP+DJTO5B/fPGdKq2N19cZkBaDtBGfLrvEDzADHRmU1w1QGRCqyf3Dy?=
 =?iso-8859-1?Q?HZHc5LcW1VLiVRrUM3pS1+T/1w9XxsInc6gb7KW94mK1koqcWfEAEh9Ft6?=
 =?iso-8859-1?Q?ObfG86IRjQjhXi5FNxIR24V4XHPEnRBwQAQz22WmX1urASow33aSOeYkVz?=
 =?iso-8859-1?Q?ymfbZY/8xzqeVHxAbOda/FTNKBDB2nkR0XNvLu6Gq3M5mL2REOVFJixekc?=
 =?iso-8859-1?Q?oO/Hij6Vd8TaIrO5fmRpFx6CxAAlBIdnXx4gX+iR8s178iEzJp1xZ93WoC?=
 =?iso-8859-1?Q?XS1gu0Q22KyuJmJ0kODGr2ElIVgPRhHuUkMfauMJLHn3ByOXif/z4wMwzL?=
 =?iso-8859-1?Q?IHVG9xCCs1RuN2MZjw/CCJviGJLW0qDnf2zxDh+EwMYygilTUOMopl1/Wr?=
 =?iso-8859-1?Q?yHzz0Zrrn6Tu5NlFmxrKLaqJZzEgPquM2DOuahSDYzw84677LjF39K/Sc6?=
 =?iso-8859-1?Q?wXZnltelRDI08am7/Jyt7HIVm3RH3P+tZ5xy4TJ3si5axnZic92xhZWLMj?=
 =?iso-8859-1?Q?xZ5b5NESWR/9PHI5bqRIiVIevkdwAmGkkKVcL5CBh+97rR1GXt5khyCK2y?=
 =?iso-8859-1?Q?1Zr7mccKAn7WCFpF5SCIZXe6wYvEf3Zklbssp+eLpUOw2iNIwjd2pItsKQ?=
 =?iso-8859-1?Q?TtgpBLLG1NHlPVtHGqkn75SpTKTIn86QqHaQf5/v1D7vGZTUib0YVU6JW/?=
 =?iso-8859-1?Q?NQeqiaeyY3ESKpViEYUJKHwk2eMomJPegYkZQKdDbtk3/jILn2Wz4DI9gb?=
 =?iso-8859-1?Q?HqbWVjs3hr63fW03p1KMoj14Ush+L6xwd8ltKj+O34yarRRSjD+FgJZO/M?=
 =?iso-8859-1?Q?W+1sBe+r22e5SFBzxZ4ihMUaFYH50A4bVLTrP+59jPxo497iGpheSL4ozM?=
 =?iso-8859-1?Q?XSw8+B+PlQNvWnC0cghGETzymHmkGqkPz/J8DpQIX4LuQ+kuFuKmIFk8j8?=
 =?iso-8859-1?Q?2Z7FglPJcqR9EdOeRtZl85wrNdPpTZxELorQaMRhJnrClQPq0XwsWbPM9L?=
 =?iso-8859-1?Q?HOh9mLbUTHrYGDUXhpWjZPaozK3LxnH2adTvJkOetJdQ9wBXB2qQl92wHN?=
 =?iso-8859-1?Q?vcdp5uQxaFCOvEXGuZq0KceIkoJXhDMhnOFLsSHziHctq5xjHp+giGcZme?=
 =?iso-8859-1?Q?0jQLtKuuzI22Il5bQEP8n8D9C/+RKR0HKzUt9jimBfSHfXGSnjDNbZSf5e?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Udhk1xoE5Ip+k5Scu7vKQS3ZwVdmefheEvL/7Om7EuP0XVmwNktPAEURLU?=
 =?iso-8859-1?Q?23Ii0GT0T5xWVOy2IC3IKCs6hbkOoITAsCBEOyKrNki32z36XcA9X2XWq4?=
 =?iso-8859-1?Q?yEiuizoXTcvZqrgC2z3unCLw3cn3BhpEDAVSVdpB3mhVQ727z3Lbx7wVPS?=
 =?iso-8859-1?Q?3sK4nrzAD0aCmI7XEQekpZSLEmJXg3XhP2N4ZTLDr5dyAnnB0Vc+GISafZ?=
 =?iso-8859-1?Q?xaXTjLxsnR6xjBE4s1Me21hhLQBuyADK2GagYO7lGRK8gc+7Bw3jodWs4k?=
 =?iso-8859-1?Q?rXwMZoK++2yo5t7/PEwl1VwJUrA/B6odAXj45FgAafAO7Z4SZKzCFD1YNp?=
 =?iso-8859-1?Q?W9/0X7cx2HgYdSv87YwU7VfXEjWDND/6ONFRuACv103JyA4dpiUhPZLvfK?=
 =?iso-8859-1?Q?W47ZOXDJ0yg/bkNSzXqdu6bWZrBLQvHZpSjtG49rNpxjR9RCdtJ/b/j+Oz?=
 =?iso-8859-1?Q?jzJqk8V+kj0tZ6aCT9WMQewH4xxVMHGtnqubiq7YPBVXagwrKg0rcCEtfd?=
 =?iso-8859-1?Q?Elw2IiMh04h4bqpVTs3BQbYt0fpUPFW3O/sBWtc9ZqYNWeXLyzMD1eWAZO?=
 =?iso-8859-1?Q?ksibck/NUbdGaZt+hI2YZWX1FO1s/zMbI+gziluyOvwQqWmOOUc6gbGrMh?=
 =?iso-8859-1?Q?0osYo2AHhBgqoPOvATCgzyW8r8fZ4qeL5QwLy3AC7JFk5SR3ZIsd8KLocn?=
 =?iso-8859-1?Q?8Paf1FrNTMOs23MwShG9vqZU7HljPJXDS8vw4p3MRNZiXeD/BOsJyg+5gy?=
 =?iso-8859-1?Q?RMgUyI24ROkH8/0oYoDY4nxAu/C5Jm8DuOTvOr5Sosg543eR/FezC8kDr3?=
 =?iso-8859-1?Q?5w7p6IvgB7VdO7QA9PmwXnIxyN+xmxD9l601LWePCAmsRYo17dcazMxW+z?=
 =?iso-8859-1?Q?eRHTKbXURMopRsYD8LA19HZjUBW4jt0epQNF4pFxNeVsicoCtAX+/q8WA4?=
 =?iso-8859-1?Q?+OYvrgbw+j7MyJFdzbsk6wfssbrkDqwd/QPymEn7VD9ssEQesZ0QwR0k4n?=
 =?iso-8859-1?Q?tnOTjB0pwgruQpnnDEbEaO9915KoIkh9GVewGaKbL2JS88salmeDZmEvff?=
 =?iso-8859-1?Q?8KIwgc2kedMMuHgGzT3Bpv1lyBuRpuCoxoYA1fqw0YYNZrdMFdhNWcVX9+?=
 =?iso-8859-1?Q?HsnMse6WTZjzKHG22qik8iuG61ayMfR3Swahl3eU2p4r2Wfw8cSnyf6JPO?=
 =?iso-8859-1?Q?I+utEAl4z+040XxSHYPzovqoLSSJOl/7CVoT5djeusTjNqAsFg0hHB1Z2S?=
 =?iso-8859-1?Q?OZorYOrl/zxs4zLzu40Lpgi17qXaFJXUe/4gtWhvLqXsQI/zpZesDo/gdW?=
 =?iso-8859-1?Q?lvEcdfa0cpgltK5LlNPLZqA0LKpqznqOT7IOsoNonGeYmMusNyuSiBZ6G4?=
 =?iso-8859-1?Q?YxCH+FeeDGinFmgzaPsPnaPyK4zBGuc2mybRXT9qRL2M6WxzJ3JMRBMFZO?=
 =?iso-8859-1?Q?Rik9T3ZuCoXZJONbzSRdePvzLg5F0RlOEd40mLR3QIdssBJkuLbyS2x1Q/?=
 =?iso-8859-1?Q?y4j6SLjf3w3xeNT8wejFGA+76hmG1xO4+dBrzw4d8bsGGc2dGZ6/tOYyQ0?=
 =?iso-8859-1?Q?CBMtbzyuMB7S1oizMNpnQIbEbgeQoKceR3XEXNm+BnHq9BwTs/8YbkGzzo?=
 =?iso-8859-1?Q?UXz+DeNi/59DSzCHaMTSL2H08PDmpLtvocPiwsgmNNUR/hTx88WfNAHg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e305c15-d9d9-4931-6beb-08ddcc3c509e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2025 12:02:38.3667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I3Iy2cC1OscczfVpGn0YAkWSwmlqOzg3Pqfsk614EL7HLE8bDQUxcqMZXct9okiOF1OlXSgmSV6W1kn0Ds4R3vBDjL3uL0PB4CKyrtyutxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8858
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

On Mon, Jul 14, 2025 at 03:26:58PM +0300, Ilia Levi wrote:
>Allow the driver to expose hardware register spaces to userspace
>through GEM objects with fake mmap offsets. This can be useful
>for userspace-firmware communication, debugging, etc.
>
>v2: Minor doc fix (CI)
>v3: Enforce MAP_SHARED (Tejas)
>    Add fault handler with dummy page (Tejas, Matt Auld)
>    Store physical address instead of xe_mmio in the GEM object (MattB)
>v4: Separate xe_mmio_gem from xe_mmio and make it private (MattB)
>
>Signed-off-by: Ilia Levi <ilia.levi@intel.com>

applied to drm-xe-next.

Thanks,
Lucas De Marchi

>---
> drivers/gpu/drm/xe/Makefile      |   1 +
> drivers/gpu/drm/xe/xe_mmio_gem.c | 226 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_mmio_gem.h |  20 +++
> 3 files changed, 247 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.c
> create mode 100644 drivers/gpu/drm/xe/xe_mmio_gem.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 4bda20f586ed..382aadd4e816 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -85,6 +85,7 @@ xe-y += xe_bb.o \
> 	xe_lrc.o \
> 	xe_migrate.o \
> 	xe_mmio.o \
>+	xe_mmio_gem.o \
> 	xe_mocs.o \
> 	xe_module.o \
> 	xe_nvm.o \
>diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
>new file mode 100644
>index 000000000000..9a97c4387e4f
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
>@@ -0,0 +1,226 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include "xe_mmio_gem.h"
>+
>+#include <drm/drm_drv.h>
>+#include <drm/drm_gem.h>
>+#include <drm/drm_managed.h>
>+
>+#include "xe_device_types.h"
>+
>+/**
>+ * DOC: Exposing MMIO regions to userspace
>+ *
>+ * In certain cases, the driver may allow userspace to mmap a portion of the hardware registers.
>+ *
>+ * This can be done as follows:
>+ * 1. Call xe_mmio_gem_create() to create a GEM object with an mmap-able fake offset.
>+ * 2. Use xe_mmio_gem_mmap_offset() on the created GEM object to retrieve the fake offset.
>+ * 3. Provide the fake offset to userspace.
>+ * 4. Userspace can call mmap with the fake offset. The length provided to mmap
>+ *    must match the size of the GEM object.
>+ * 5. When the region is no longer needed, call xe_mmio_gem_destroy() to release the GEM object.
>+ *
>+ * NOTE: The exposed MMIO region must be page-aligned with regards to its BAR offset and size.
>+ *
>+ * WARNING: Exposing MMIO regions to userspace can have security and stability implications.
>+ * Make sure not to expose any sensitive registers.
>+ */
>+
>+static void xe_mmio_gem_free(struct drm_gem_object *);
>+static int xe_mmio_gem_mmap(struct drm_gem_object *, struct vm_area_struct *);
>+static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>+
>+struct xe_mmio_gem {
>+	struct drm_gem_object base;
>+	phys_addr_t phys_addr;
>+};
>+
>+static const struct vm_operations_struct vm_ops = {
>+	.open = drm_gem_vm_open,
>+	.close = drm_gem_vm_close,
>+	.fault = xe_mmio_gem_vm_fault,
>+};
>+
>+static const struct drm_gem_object_funcs xe_mmio_gem_funcs = {
>+	.free = xe_mmio_gem_free,
>+	.mmap = xe_mmio_gem_mmap,
>+	.vm_ops = &vm_ops,
>+};
>+
>+static inline struct xe_mmio_gem *to_xe_mmio_gem(struct drm_gem_object *obj)
>+{
>+	return container_of(obj, struct xe_mmio_gem, base);
>+}
>+
>+/**
>+ * xe_mmio_gem_create - Expose an MMIO region to userspace
>+ * @xe: The xe device
>+ * @file: DRM file descriptor
>+ * @phys_addr: Start of the exposed MMIO region
>+ * @size: The size of the exposed MMIO region
>+ *
>+ * This function creates a GEM object that exposes an MMIO region with an mmap-able
>+ * fake offset.
>+ *
>+ * See: "Exposing MMIO regions to userspace"
>+ */
>+struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *file,
>+				       phys_addr_t phys_addr, size_t size)
>+{
>+	struct xe_mmio_gem *obj;
>+	struct drm_gem_object *base;
>+	int err;
>+
>+	if ((phys_addr % PAGE_SIZE != 0) || (size % PAGE_SIZE != 0))
>+		return ERR_PTR(-EINVAL);
>+
>+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>+	if (!obj)
>+		return ERR_PTR(-ENOMEM);
>+
>+	base = &obj->base;
>+	base->funcs = &xe_mmio_gem_funcs;
>+	obj->phys_addr = phys_addr;
>+
>+	drm_gem_private_object_init(&xe->drm, base, size);
>+
>+	err = drm_gem_create_mmap_offset(base);
>+	if (err)
>+		goto free_gem;
>+
>+	err = drm_vma_node_allow(&base->vma_node, file);
>+	if (err)
>+		goto free_gem;
>+
>+	return obj;
>+
>+free_gem:
>+	xe_mmio_gem_free(base);
>+	return ERR_PTR(err);
>+}
>+
>+/**
>+ * xe_mmio_gem_mmap_offset - Return the mmap-able fake offset
>+ * @gem: the GEM object created with xe_mmio_gem_create()
>+ *
>+ * This function returns the mmap-able fake offset allocated during
>+ * xe_mmio_gem_create().
>+ *
>+ * See: "Exposing MMIO regions to userspace"
>+ */
>+u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem)
>+{
>+	return drm_vma_node_offset_addr(&gem->base.vma_node);
>+}
>+
>+static void xe_mmio_gem_free(struct drm_gem_object *base)
>+{
>+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>+
>+	drm_gem_object_release(base);
>+	kfree(obj);
>+}
>+
>+/**
>+ * xe_mmio_gem_destroy - Destroy the GEM object that exposes an MMIO region
>+ * @gem: the GEM object to destroy
>+ *
>+ * This function releases resources associated with the GEM object created by
>+ * xe_mmio_gem_create().
>+ *
>+ * See: "Exposing MMIO regions to userspace"
>+ */
>+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
>+{
>+	xe_mmio_gem_free(&gem->base);
>+}
>+
>+static int xe_mmio_gem_mmap(struct drm_gem_object *base, struct vm_area_struct *vma)
>+{
>+	if (vma->vm_end - vma->vm_start != base->size)
>+		return -EINVAL;
>+
>+	if ((vma->vm_flags & VM_SHARED) == 0)
>+		return -EINVAL;
>+
>+	/* Set vm_pgoff (used as a fake buffer offset by DRM) to 0 */
>+	vma->vm_pgoff = 0;
>+	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
>+	vm_flags_set(vma, VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP |
>+		     VM_DONTCOPY | VM_NORESERVE);
>+
>+	/* Defer actual mapping to the fault handler. */
>+	return 0;
>+}
>+
>+static void xe_mmio_gem_release_dummy_page(struct drm_device *dev, void *res)
>+{
>+	__free_page((struct page *)res);
>+}
>+
>+static vm_fault_t xe_mmio_gem_vm_fault_dummy_page(struct vm_area_struct *vma)
>+{
>+	struct drm_gem_object *base = vma->vm_private_data;
>+	struct drm_device *dev = base->dev;
>+	vm_fault_t ret = VM_FAULT_NOPAGE;
>+	struct page *page;
>+	unsigned long pfn;
>+	unsigned long i;
>+
>+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
>+	if (!page)
>+		return VM_FAULT_OOM;
>+
>+	if (drmm_add_action_or_reset(dev, xe_mmio_gem_release_dummy_page, page))
>+		return VM_FAULT_OOM;
>+
>+	pfn = page_to_pfn(page);
>+
>+	/* Map the entire VMA to the same dummy page */
>+	for (i = 0; i < base->size; i += PAGE_SIZE) {
>+		unsigned long addr = vma->vm_start + i;
>+
>+		ret = vmf_insert_pfn(vma, addr, pfn);
>+		if (ret & VM_FAULT_ERROR)
>+			break;
>+	}
>+
>+	return ret;
>+}
>+
>+static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *vmf)
>+{
>+	struct vm_area_struct *vma = vmf->vma;
>+	struct drm_gem_object *base = vma->vm_private_data;
>+	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>+	struct drm_device *dev = base->dev;
>+	vm_fault_t ret = VM_FAULT_NOPAGE;
>+	unsigned long i;
>+	int idx;
>+
>+	if (!drm_dev_enter(dev, &idx)) {
>+		/*
>+		 * Provide a dummy page to avoid SIGBUS for events such as hot-unplug.
>+		 * This gives the userspace the option to recover instead of crashing.
>+		 * It is assumed the userspace will receive the notification via some
>+		 * other channel (e.g. drm uevent).
>+		 */
>+		return xe_mmio_gem_vm_fault_dummy_page(vma);
>+	}
>+
>+	for (i = 0; i < base->size; i += PAGE_SIZE) {
>+		unsigned long addr = vma->vm_start + i;
>+		unsigned long phys_addr = obj->phys_addr + i;
>+
>+		ret = vmf_insert_pfn(vma, addr, PHYS_PFN(phys_addr));
>+		if (ret & VM_FAULT_ERROR)
>+			break;
>+	}
>+
>+	drm_dev_exit(idx);
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.h b/drivers/gpu/drm/xe/xe_mmio_gem.h
>new file mode 100644
>index 000000000000..4b76d5586ebb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_mmio_gem.h
>@@ -0,0 +1,20 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_MMIO_GEM_H_
>+#define _XE_MMIO_GEM_H_
>+
>+#include <linux/types.h>
>+
>+struct drm_file;
>+struct xe_device;
>+struct xe_mmio_gem;
>+
>+struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *file,
>+				       phys_addr_t phys_addr, size_t size);
>+u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem);
>+void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
>+
>+#endif /* _XE_MMIO_GEM_H_ */
>-- 
>2.43.0
>
