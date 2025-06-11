Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC99C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 18:19:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF8810E156;
	Wed, 11 Jun 2025 18:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9UTfAr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A4610E156
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749665965; x=1781201965;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E9p13izIFuSLJwSLE3T3ZGSaWd3D3TNMaW0uTLyCEnw=;
 b=S9UTfAr1OHDhqkk9miyOlNP9dBhX444nARJLr6Ymtqi4pnTAsNAQVe4T
 Fu3vzt9OjNy1GvW85dfVOplN1MhlY2waIdX+80Z4N7dEThVE2BuKd3hrg
 jKAs2QzC4BLK7hA692QF9beKZizIsVEvX3SefNRcgfd5odcrx6832Ngbt
 9ajHeFKXIePgGX/PS3VLTWT901gsqNQ2tD8Oz0sJBWI6OuIDHq17wwdkX
 7Xy54rFfT1jVOWUqWgm5LpUcMpglWot5AjhLP/3t3wBkUeDmIi/CwZu+a
 MqF2mXFFcewaBJpZgCC/G6z9bH0wNteEAfjaDe8GBNe8LnUVbHyJH4qDN g==;
X-CSE-ConnectionGUID: c1271ZgYRk+GdOrgoL6b+A==
X-CSE-MsgGUID: kIr9wj6uRuWEV1qZURKFzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51737173"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="51737173"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:19:25 -0700
X-CSE-ConnectionGUID: g8cAeHYZRwWk7PRfWaSufg==
X-CSE-MsgGUID: vXx75tjNRQG8Kuw89e7hGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="152541281"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 11:19:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:19:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 11:19:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 11:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gs1WlL899zR0bgxtFRfuelKv00Tjg8JPcEZ5A2IgD71gIupnDSny8fFsIRxvUuNmtzgYtDcuf4yEZQOz1Agdpaacq10zTrlYW6Bkow7lnmQUghtbWjoryBf2boPMJH8kHuXWdIZcNlFZ6UzvdLr7ZKztx4mXxXojAkGFuJH1hvPIaF8FbBjUPHOLzV7+IBqkxdX5hL5OREbHug0XopahWZJAGJ+iKKlTm8zGwTfWjkgjZRgj3aBXh6/V6KLIVTGgcV4jVGCfmQZvlBtoiCF5rzsV9yGLft6a4HEC60LnDW+ZqfUfhC/NdIvsbHG8zJsIyNIHcoMUd1NUPgA8zOXGXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+J4zJYMe7qIttWsTojQAf7llA/51i84OqitXt38MYjc=;
 b=C8t4QlAyrteCraAJ5slT5JYuW8i1WcZoDRCjraa4OjX2YlPicKy8lVpGmYTrUiJlT0Q71d1BsKNlwC09v/A2N9ifIeSk3tqTWl33JMNoddk0ohY+hzOjeL4l6LbDmEamr4RTl1oJDaP2Hd0YEvkbuvsyTZZZiVfKqdio/TM1vOg0pKJGeI9RKkxoleMZk0H616E3qpmKmbYnrK31lBF2cVns9ErdUa8uFjVKQFg9M8W48zRNoVLfzDRH/pUHhd5t7bbrq8LUia3WJ7DMRKbM98l55pXf4qTGeAvSTq29bMWIvZBokz6rfKDJChRsfUOoZEp4qDjY0fuwtR3CImoQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 18:18:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 18:18:54 +0000
Date: Wed, 11 Jun 2025 11:20:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
Message-ID: <aEnI7t5DTbcfYibp@lstrano-desk.jf.intel.com>
References: <20250611054235.3540936-1-matthew.brost@intel.com>
 <0c909f7376ab30f8260d83a74b3a908a4e6eb764.camel@intel.com>
 <aEmy8yBp0Ghssyuq@lstrano-desk.jf.intel.com>
 <7ede4886131931de5f9a672fd823d8bac3f374af.camel@intel.com>
 <aEnDbmfEVUEzmk0A@lstrano-desk.jf.intel.com>
 <c99af8b540ab40381b2bc44f78bfc634c27043b6.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c99af8b540ab40381b2bc44f78bfc634c27043b6.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0232.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6fbed5-b227-400f-7b90-08dda9146cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?957DDmGAenKz5dJTjmOVT7w8N5ivhUdqsVg1h7kKBkYUar8lizuOzXfhD2?=
 =?iso-8859-1?Q?PZ0PolzIeXQLGIoooDVE9YUf6TjhEe80um2BYiFlk1tryFQuIYR3URQLgs?=
 =?iso-8859-1?Q?gm990cJm1p63Tg3wJTWLL6d9NKlGtO50AZ7lqHxE3rndCwlsV/n2nkoj8Z?=
 =?iso-8859-1?Q?eGd7soPRs7sKAgat3CrwbkYcVGRmM0ZvG6axB0wtLJ1c9+NZCxeUjdHyBS?=
 =?iso-8859-1?Q?e6xVkqzwbMkjUoa9gydsBdALNjeb4+7plfBffE+mTVdNcQBwCQ47uSP0MH?=
 =?iso-8859-1?Q?LP+aBOjwoKvOQBHqrGEgAqpqQ8UI4aTXh7XF0EBOh0nzhdZHsZszC3mI0m?=
 =?iso-8859-1?Q?cfHlh8aoKEXIiPNMMk18RyVuGqwH0506mJ3QjlyoyuUTuhkz0vVCPxYFKk?=
 =?iso-8859-1?Q?HIIaex/PISAtiU3MD3fZMDAaKSccAAWdGTQl3NMu4fYaD+HZL8OAWpraUn?=
 =?iso-8859-1?Q?8zOSPkHVSG1HcbhnQjaWuzp6E/0NUOHrRUFYkPDls3BrMZ257NY9rm6V8Q?=
 =?iso-8859-1?Q?8xC8AxZV1mS7mdrmQ0jtwOMsvkromhgAQhcOVrUg/sA3fEfhZ3chaEnM7K?=
 =?iso-8859-1?Q?c0KetwT711A1B4DCfTAf2NJCjHMKvqVkPccfmnjf8fvMthV0TULY1ruBs1?=
 =?iso-8859-1?Q?hQExPN0AvIW6RCc3fmJxIldbqoMeJEB+/EfiY/VVTKGOjMGENr1M5q57Uv?=
 =?iso-8859-1?Q?9ZBiZelj/UY2gOGPswfYStw1A6HcrKONKS0z6nTQ6HV+ZbxwYhQ2vNz5nG?=
 =?iso-8859-1?Q?HCkNHm16F6Oxfdo/IX+aLBVqteHRJGLyH48yW6EoEKmYJtVRSEWG4fkAo9?=
 =?iso-8859-1?Q?WCyBJyHO+PWxSIwp36a0JWp42Np+8hTIAmCh+p6E/2XofXXCGz72c2c41u?=
 =?iso-8859-1?Q?EpJ+KmEpm9FTGgC+jZKDOnYTdO57UvtkGSqdqG7Nc5k3gNemms4dtV+muQ?=
 =?iso-8859-1?Q?nPuwgTXhNKJ0jb4VclhLWP1U3AJpcjiJPPEv2IRjheR+ewk8XElK/gBZ4k?=
 =?iso-8859-1?Q?jlr3koBt+Eiw/t7Dr5W3my3m5vIl14K8nS2Lubqgjs59t+f5tdmLHYSxK0?=
 =?iso-8859-1?Q?QRLaOUmRnTNqiU5zjoaquwU3KCuhJgbCDv6aXVLjIphwGi2DqhS4sPOiiq?=
 =?iso-8859-1?Q?49l2cW6Os1aB77Z8vvh4yJRhd6LULCk5v8jodVzkB+ktpggJkGGXuZoB47?=
 =?iso-8859-1?Q?nkpsMEC37nFA9woSVC0EzBrVkUA3YgJIiDvwh1xLhvKl4rJMITg5LxOdF0?=
 =?iso-8859-1?Q?VssGIAjnTfuwm9yRDnNwUFUO05nKOpIFvAr5VQe5nHyh6AVn0G+55veP2z?=
 =?iso-8859-1?Q?C1P0CGXS9gs/agswXeGl/gLLrvt+KPN/BrVt4RmpuHVXVm9i/vFXRV+xbK?=
 =?iso-8859-1?Q?G0W0YlC/xK5HVl2zEFKnK5JTRNUX1ySVZVZpVMkICuC8AtJ7IINNXHadld?=
 =?iso-8859-1?Q?+8Pe+rLZaRaUW4LfamAPED9Z/p/xgVaitCuhbRhXCtmN10TrmdYb4DkdAn?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wp9QeC9yv+xmxYKJQIyzHdwS+WLQGFnc5Q7DHoY9PRbA5EJsgwNg2OxkcU?=
 =?iso-8859-1?Q?HUJ60urwNQbPzgT5lxN0x5r4+hLqt7QDGJ/D1u/uHAxxDiynBScQhVWHh3?=
 =?iso-8859-1?Q?2sOIYBdXrJAvk81jqZ7LdCp35dgSSawYW94JncYrJXOPSOfGci8k3WBIBA?=
 =?iso-8859-1?Q?yQuiZp2DyZyhlgfGj1ijeSrDALNMKOsXDfrwkw+u0RIWWfG0Nhhg+d9Cin?=
 =?iso-8859-1?Q?J8H92jqWqavnHj2CQAXzPvjbSQNCu0yZGpam050rMTGEz2u6m71c7qajdd?=
 =?iso-8859-1?Q?MvHZiRxqJfL7++QMIWIrcuHf3SgqDjA1FgP0a6GTCMzRt4B7Fps6vByEWf?=
 =?iso-8859-1?Q?m37go4ciEwj95/MnNV2ePIw0ZZOBKvzSib0pg1MPRjGB/UAnJvTyIQIIGT?=
 =?iso-8859-1?Q?D8/fAfCrjTMxOJO+PPkOR3lPLlcebTVsesy+3pt8xNlR97HwhIDyeUnsXG?=
 =?iso-8859-1?Q?FLNRdSjAvAbYxt+h7GnctwU7a1tzJQlmmmuznVKLwCaNt3AxTzUmclgHdc?=
 =?iso-8859-1?Q?4bbyp4VvLsg6gUQot01Uu0Bul3rLqbOMQhYdM+XyMUktruVoF6OcGlMO9K?=
 =?iso-8859-1?Q?SEEi1bT0URGpbOFIm5tajC+fS8BAJGOsxb8XvnMKjkzjA9t1ZPYoz2CRR6?=
 =?iso-8859-1?Q?vZ82oRFBV2bnti/byYWdqYo7Sp1l67OgG/N/SAfE/q1blrpFwcMUNUs7PT?=
 =?iso-8859-1?Q?pO8VCDJwpOY0i1bMDMpRs559XBtCjfkooD/PVenKlDp5cRLtLrgzfTLcnC?=
 =?iso-8859-1?Q?9sgHaZMOF/x9lYRbJd5opRIFFsbg6UNy4dWKpq3mUD7RhhTrGeKZxskBVb?=
 =?iso-8859-1?Q?XV8N8DNretYsEv6l8l7uDPdhOuM1y1qeZuV4YIY54jwaqCKwDE6Z3j45AA?=
 =?iso-8859-1?Q?nBEUC4gKF63C+hrHNLZAuRhtFUe4AOKNU0gNQUDQjmmHSFH3VuTbCjNLgp?=
 =?iso-8859-1?Q?2V7ONXdYFXtfUJVFLmuHdpzInWctZ7hFUIHVokvmOL9NrrFtecoyJkJ7co?=
 =?iso-8859-1?Q?Q0vPouJ+x2eZht38oaqP2T+3JCrmlplMK1TP//uD6vxJFjjC8LHvCk1Gmx?=
 =?iso-8859-1?Q?OkiAyw4qJ0JefLLlNJ954UtYowVDGB/6ZUGVOkMt0bI+cue1Oe7LIcx8SR?=
 =?iso-8859-1?Q?1PO2R7pZL4SLuBQnQXCxLnkdMHfeHNPmTeWp2kC5vaLBLIvmM9TO5WfbHn?=
 =?iso-8859-1?Q?gAfvMwsy26Sd04vyJ3rbcT+gTM2YuDSDkNaHfG6fwxG5WTgRJmkojFmbI1?=
 =?iso-8859-1?Q?25opdXkRFpSkT5vUMobV0UhQLdZnA1TSNiL82kipooU6x5LAf7A4oqIoBC?=
 =?iso-8859-1?Q?I4XLajXzKo9OMe8+Dodqq7fGtB/PlTIi8gV/2U45Bcxopl15LZIW9602Qm?=
 =?iso-8859-1?Q?snX6+EbX7K+Oa8J/roOS8A+oIK7zpZMUq/V9k4XNG8TBmOrBoFRPYYY+4G?=
 =?iso-8859-1?Q?tiRDCdKvBGrejq0m3NLs5GVLQ3Dudy59yzyujxZEsXuLek6UVaZZqGP/sg?=
 =?iso-8859-1?Q?qAmoP+3rXnldZBIhh26qkYJvdR2FyK9Z435cWT+27FE5ccNt0IbUk+mDFj?=
 =?iso-8859-1?Q?H+rZDwEy0v1vA9Upyr4uGsN5plMXqYjh0QLv1LzXefOI8UITz4i/w2RDx8?=
 =?iso-8859-1?Q?lbYmLG2TA1vQUEbHa/8eC4yCL5LCVETKcJ5KY/J58FAycXGc4wMXz/ZA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6fbed5-b227-400f-7b90-08dda9146cc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 18:18:54.7538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flkyGzJVJYGEYyormtGDNWHobVnGM7BOezEgw4wmZj+1HAiuUQ5ho5+Fi2EP2w2YhiCpfqiP09nwclJR7cKndA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
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

On Wed, Jun 11, 2025 at 12:05:36PM -0600, Summers, Stuart wrote:
> On Wed, 2025-06-11 at 10:57 -0700, Matthew Brost wrote:
> > On Wed, Jun 11, 2025 at 11:04:06AM -0600, Summers, Stuart wrote:
> > > On Wed, 2025-06-11 at 09:46 -0700, Matthew Brost wrote:
> > > > On Wed, Jun 11, 2025 at 10:26:44AM -0600, Summers, Stuart wrote:
> > > > > On Tue, 2025-06-10 at 22:42 -0700, Matthew Brost wrote:
> > > > > > Clearing on free should hide latency of BO clears on new user
> > > > > > BO
> > > > > > allocations.
> > > > > 
> > > > > Do you have any test results showing the latency improvement
> > > > > here
> > > > > on
> > > > > high volume submission tests? Also how does this impact at very
> > > > > large
> > > > 
> > > > No performance data yet available. Something we definitely should
> > > > look
> > > > into and would be curious about the results. FWIW, AMDGPU
> > > > implements
> > > > clear on free in a very similar way to this series. 
> > > 
> > > I had a few other comments towards the end of the patch. Basically
> > > I
> > 
> > I should slow down and read... Repling to all comments here.
> > 
> > > think it would be nice to be able to configure this. There was
> > > significant testing done here for Aurora in i915 and the
> > > performance
> > > benefits were potentially different based on the types of workloads
> > > being used. Having user hints for instance might allow us to take
> > > advantage of those workload specific use cases.
> > > 
> > 
> > We can wire this mode to the uAPI for BO creation if needed - this
> > patch
> > does clear-on-free blindly for any user BO. Ofc with uAPI we need a
> > UMD
> > user to upstream. We may just want to start with this patch and do
> > that
> > in a follow up if needed as it a minor tweak from a code PoV.
> 
> Actually it would be great if you can add exactly this to the commit
> message. Basically we are intentionally doing clear on free here
> blindly because we don't currently have a user for some kind of more
> complicated (from the user perspective) hint system. (just kind of
> repeating what you said)
> 
> This way we have some documentation of why we chose this route other
> than just because amd is doing that.
> 

Sure.

> > 
> > > > 
> > > > > buffer size submissions and mix of large and small buffer
> > > > > submissions
> > > > > with eviction between different processes?
> > > > > 
> > > > 
> > > > Eviction somewhat orthogonal to this. If an eviction occurs and
> > > > it is
> > > > a
> > > > new allocation a clear would still have be issued ahead handing
> > > > the
> > > > memory over to the new BO, if eviction occurs and paged in BO has
> > > > backing store (it was previously evicted) we'd just copy the
> > > > contents
> > > > into the allocated memory.
> > > 
> > > Good point. I still think we should consider the scenarios of
> > > having a
> > > large buffer workload running and then clearing, then we have a
> > > small
> > > buffer workload coming in which now needs to wait on the clear from
> > > that large workload. Whereas on clear-on-alloc for the small
> > > workload,
> > > we can get that submission in quickly and not wait for that larger
> > > one.
> > > 
> > 
> > The buddy allocator tries to allocate cleared VRAM first, then falls
> > back to dirty VRAM. Dirty VRAM will still be cleared upon allocation
> > in
> > this patch.
> > 
> > The senerio you describe could result in eviction actually. If a
> > large
> > BO has pending clear - it won't be in either buddy allocator pool -
> > it
> > will be TTM as ghost object (pending free). If the buddy allocator
> > fails
> > an allocation, eviction is triggered with the ghost objects in TTM
> > being
> > tried to allocate first (I think, if I'm misstaing TTM internals my
> > bad). This would as you suggest result in the BO allocation waiting
> > on
> > potentially a large clear to finish even though the allocation is
> > small
> > in size.
> 
> So we have had customers in the past who have wanted explicit disabling
> of eviction. I agree in the current implementation that might be the

Explicitly disabling eviction is not an upstream option, downstream in
i915 you can do whatever you want as there are no rules. We have
discussed a pin accounting controler vis cgroups or something upstream
which may be acceptable. Different discussion though.

> case, but in the future we might want such a capability, so there is
> still a chance of blocking. But again, maybe this can be a future
> enhancement as you said.
> 
> > 
> > > I don't think there is necessarily a one-size-fits-all solution
> > > here
> > > which is why I think the hints are important.
> > > 
> > 
> > Jumping to new uAPI + hints immediately might not be the best
> > approach,
> > but as I stated this is minor thing to add if needed.
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > > 
> > > > > > Implemented via calling xe_migrate_clear in release notify
> > > > > > and
> > > > > > updating
> > > > > > iterator in xe_migrate_clear to skip cleared buddy blocks.
> > > > > > Only
> > > > > > user
> > > > > > BOs
> > > > > > cleared in release notify as kernel BOs could still be in use
> > > > > > (e.g.,
> > > > > > PT
> > > > > > BOs need to wait for dma-resv to be idle).
> > > > > > 
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_bo.c           | 47
> > > > > > ++++++++++++++++++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
> > > > > >  drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> > > > > >  drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
> > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> > > > > >  6 files changed, 94 insertions(+), 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > index 4e39188a021a..74470f4d418d 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > @@ -1434,6 +1434,51 @@ static bool
> > > > > > xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object
> > > > > > *ttm_bo)
> > > > > >         return locked;
> > > > > >  }
> > > > > >  
> > > > > > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object
> > > > > > *ttm_bo)
> > > > > > +{
> > > > > > +       struct xe_device *xe = ttm_to_xe_device(ttm_bo-
> > > > > > >bdev);
> > > > > > +       struct dma_fence *fence;
> > > > > > +       int err, idx;
> > > > > > +
> > > > > > +       xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > > > > > +
> > > > > > +       if (ttm_bo->type != ttm_bo_type_device)
> > > > > > +               return;
> > > > > > +
> > > > > > +       if (xe_device_wedged(xe))
> > > > > > +               return;
> > > > > > +
> > > > > > +       if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo-
> > > > > > > resource-
> > > > > > > mem_type))
> > > > > > +               return;
> > > > > > +
> > > > > > +       if (!drm_dev_enter(&xe->drm, &idx))
> > > > > > +               return;
> > > > > > +
> > > > > > +       if (!xe_pm_runtime_get_if_active(xe))
> > > > > > +               goto unbind;
> > > > > > +
> > > > > > +       err = dma_resv_reserve_fences(&ttm_bo->base._resv,
> > > > > > 1);
> > > > > > +       if (err)
> > > > > > +               goto put_pm;
> > > > > > +
> > > > > > +       fence = xe_migrate_clear(mem_type_to_migrate(xe,
> > > > > > ttm_bo-
> > > > > > > resource->mem_type),
> > > > > > +                                ttm_to_xe_bo(ttm_bo),
> > > > > > ttm_bo-
> > > > > > > resource,
> > > > > > +                                XE_MIGRATE_CLEAR_FLAG_FULL |
> > > > > > +                                XE_MIGRATE_CLEAR_NON_DIRTY);
> > > > > > +       if (XE_WARN_ON(IS_ERR(fence)))
> > > > > > +               goto put_pm;
> > > > > > +
> > > > > > +       xe_ttm_vram_mgr_resource_set_cleared(ttm_bo-
> > > > > > >resource);
> > > > > > +       dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > > > > > +                          DMA_RESV_USAGE_KERNEL);
> > > > > > +       dma_fence_put(fence);
> > > > > > +
> > > > > > +put_pm:
> > > > > > +       xe_pm_runtime_put(xe);
> > > > > > +unbind:
> > > > > > +       drm_dev_exit(idx);
> > > > > > +}
> > > > > > +
> > > > > >  static void xe_ttm_bo_release_notify(struct
> > > > > > ttm_buffer_object
> > > > > > *ttm_bo)
> > > > > >  {
> > > > > >         struct dma_resv_iter cursor;
> > > > > > @@ -1478,6 +1523,8 @@ static void
> > > > > > xe_ttm_bo_release_notify(struct
> > > > > > ttm_buffer_object *ttm_bo)
> > > > > >         }
> > > > > >         dma_fence_put(replacement);
> > > > > >  
> > > > > > +       xe_ttm_bo_release_clear(ttm_bo);
> > > > > > +
> > > > > >         dma_resv_unlock(ttm_bo->base.resv);
> > > > > >  }
> > > > > >  
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > index 8f8e9fdfb2a8..39d7200cb366 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > @@ -1063,7 +1063,7 @@ struct dma_fence
> > > > > > *xe_migrate_clear(struct
> > > > > > xe_migrate *m,
> > > > > >         struct xe_gt *gt = m->tile->primary_gt;
> > > > > >         struct xe_device *xe = gt_to_xe(gt);
> > > > > >         bool clear_only_system_ccs = false;
> > > > > > -       struct dma_fence *fence = NULL;
> > > > > > +       struct dma_fence *fence = dma_fence_get_stub();
> > > > > >         u64 size = bo->size;
> > > > > >         struct xe_res_cursor src_it;
> > > > > >         struct ttm_resource *src = dst;
> > > > > > @@ -1075,10 +1075,13 @@ struct dma_fence
> > > > > > *xe_migrate_clear(struct
> > > > > > xe_migrate *m,
> > > > > >         if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> > > > > >                 clear_only_system_ccs = true;
> > > > > >  
> > > > > > -       if (!clear_vram)
> > > > > > +       if (!clear_vram) {
> > > > > >                 xe_res_first_sg(xe_bo_sg(bo), 0, bo->size,
> > > > > > &src_it);
> > > > > > -       else
> > > > > > +       } else {
> > > > > >                 xe_res_first(src, 0, bo->size, &src_it);
> > > > > > +               if (!(clear_flags &
> > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > +                       size -= xe_res_next_dirty(&src_it);
> > > > > > +       }
> > > > > >  
> > > > > >         while (size) {
> > > > > >                 u64 clear_L0_ofs;
> > > > > > @@ -1125,6 +1128,9 @@ struct dma_fence
> > > > > > *xe_migrate_clear(struct
> > > > > > xe_migrate *m,
> > > > > >                         emit_pte(m, bb, clear_L0_pt,
> > > > > > clear_vram,
> > > > > > clear_only_system_ccs,
> > > > > >                                  &src_it, clear_L0, dst);
> > > > > >  
> > > > > > +               if (clear_vram && !(clear_flags &
> > > > > > XE_MIGRATE_CLEAR_NON_DIRTY))
> > > > > > +                       size -= xe_res_next_dirty(&src_it);
> > > > > > +
> > > > > >                 bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> > > > > >                 update_idx = bb->len;
> > > > > >  
> > > > > > @@ -1146,7 +1152,7 @@ struct dma_fence
> > > > > > *xe_migrate_clear(struct
> > > > > > xe_migrate *m,
> > > > > >                 }
> > > > > >  
> > > > > >                 xe_sched_job_add_migrate_flush(job,
> > > > > > flush_flags);
> > > > > > -               if (!fence) {
> > > > > > +               if (fence == dma_fence_get_stub()) {
> > > > > >                         /*
> > > > > >                          * There can't be anything userspace
> > > > > > related
> > > > > > at this
> > > > > >                          * point, so we just need to respect
> > > > > > any
> > > > > > potential move
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > index fb9839c1bae0..58a7b747ef11 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > > > > > @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct
> > > > > > xe_migrate
> > > > > > *m, struct xe_bo *bo,
> > > > > >  
> > > > > >  #define XE_MIGRATE_CLEAR_FLAG_BO_DATA          BIT(0)
> > > > > >  #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA         BIT(1)
> > > > > > +#define XE_MIGRATE_CLEAR_NON_DIRTY             BIT(2)
> > > > > >  #define
> > > > > > XE_MIGRATE_CLEAR_FLAG_FULL     (XE_MIGRATE_CLEAR_FLAG_BO_DATA
> > > > > > | \
> > > > > >                                         XE_MIGRATE_CLEAR_FLAG
> > > > > > _CCS
> > > > > > _DAT
> > > > > > A)
> > > > > >  struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > index d1a403cfb628..630082e809ba 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > > > > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct
> > > > > > xe_res_cursor *cur, u64 size)
> > > > > >         }
> > > > > >  }
> > > > > >  
> > > > > > +/**
> > > > > > + * xe_res_next_dirty - advance the cursor to next dirty
> > > > > > buddy
> > > > > > block
> > > > > > + *
> > > > > > + * @cur: the cursor to advance
> > > > > > + *
> > > > > > + * Move the cursor until dirty buddy block is found.
> > > > > > + *
> > > > > > + * Return: Number of bytes cursor has been advanced
> > > > > > + */
> > > > > > +static inline u64 xe_res_next_dirty(struct xe_res_cursor
> > > > > > *cur)
> > > > > > +{
> > > > > > +       struct drm_buddy_block *block = cur->node;
> > > > > > +       u64 bytes = 0;
> > > > > > +
> > > > > > +       XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > > > > > +                  cur->mem_type != XE_PL_VRAM1);
> > > > > 
> > > > > What if we have more than just these two? Maybe check against
> > > > > the
> > > > > mask
> > > > > instead.
> > 
> > Sure. I think we do this test in a couple of other places in the
> > driver too
> > and clean this up in seperate patch first.
> 
> No problem, just wanted to call it out. We can do this later..
> 
> > 
> > > > > 
> > > > > > +
> > > > > > +       while (cur->remaining &&
> > > > > > drm_buddy_block_is_clear(block))
> > > > > > {
> > > > > > +               bytes += cur->size;
> > > > > > +               xe_res_next(cur, cur->size);
> > > > > > +               block = cur->node;
> > > > > > +       }
> > > > > > +
> > > > > > +       return bytes;
> > > > > > +}
> > > > > > +
> > > > > >  /**
> > > > > >   * xe_res_dma - return dma address of cursor at current
> > > > > > position
> > > > > >   *
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > index 9e375a40aee9..120046941c1e 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > > > > > @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct
> > > > > > ttm_resource_manager *man,
> > > > > >         if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> > > > > >                 vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> > > > > >  
> > > > > > +       if (tbo->type == ttm_bo_type_device)
> > > > > > +               vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> > > > > > +
> > > > > >         if (WARN_ON(!vres->base.size)) {
> > > > > >                 err = -EINVAL;
> > > > > >                 goto error_fini;
> > > > > > @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct
> > > > > > ttm_resource_manager *man,
> > > > > >         struct drm_buddy *mm = &mgr->mm;
> > > > > >  
> > > > > >         mutex_lock(&mgr->lock);
> > > > > > -       drm_buddy_free_list(mm, &vres->blocks, 0);
> > > > > > +       drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> > > > > >         mgr->visible_avail += vres->used_visible_size;
> > > > > >         mutex_unlock(&mgr->lock);
> > > > > >  
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > index cc76050e376d..dfc0e6890b3c 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > > > > > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct
> > > > > > ttm_resource
> > > > > > *res)
> > > > > >         return container_of(res, struct
> > > > > > xe_ttm_vram_mgr_resource,
> > > > > > base);
> > > > > >  }
> > > > > >  
> > > > > > +static inline void
> > > > > > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource
> > > > > > *res)
> > > > > > +{
> > > > > > +       to_xe_ttm_vram_mgr_resource(res)->flags |=
> > > > > > DRM_BUDDY_CLEARED;
> > > > > 
> > > > > I see the amd driver is doing the same thing here. Maybe we can
> > > > > pull
> > > > > this in based on the flags given at the resource initialization
> > > > > so
> > > > > we
> > > > > can potentially tweak this for different scenarios (when to
> > > > > free)
> > > > > and
> > > > > converge what we're doing here and what amd is doing into the
> > > > > common
> > > > > code.
> > > > > 
> > 
> > AMD has a flag, which is the same test in this series as 'type ==
> > ttm_bo_type_device'. AMD blindly sets this flag on user BO creation
> > but
> > as I stated above we could wire this to uAPI if needed.
> > 
> > Also I think there are some kernel BOs which clear-on-free is safe
> > too
> > (e.g., I think only PT BOs need contents to stick around after final
> > put
> > until dma-resv is clean of fences). Would have to fully to test for
> > definitive answer though.
> 
> In most cases the kernel operations are going to be lower priority than

It is the inverse of that - kernel operations are a always higher
priority as without them a user app can't function (think any page table
memory allocation or memory allocation for a LRC). This is one of
reasons we just pin kernel memory in Xe compared evictable kernel memory
in the i915 (also evicting kernel memory is a huge pain as we have idle
the GuC state which could use that memory).

> the user operations (with the exception of maybe page faults). We had
> looked at things in i915 like preempting kernel operations when a user
> op comes in (the user clear-on-alloc preempts the kernel clear-on-
> free/alloc). This probably falls in the same optimization category you

We definitely won't do that as this would require multiple migration
queues and preemption via the GuC is so expensive I'd doubt you'd ever
win. I guess we could have a convolved algorithm in the migration queue
to jump to higher priortiy jobs but would need some really strong data
indicating this is needed. Also with dma-resv basically the migration
queue needs to be idle before anything from the user can run.

Matt

> mentioned, although it doesn't necessarily need a user hint.
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > > +}
> > > > > > +
> > > > > >  static inline struct xe_ttm_vram_mgr *
> > > > > >  to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> > > > > >  {
> > > > > 
> > > 
> 
