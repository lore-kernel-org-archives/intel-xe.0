Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1894E668A0
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 22:53:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDFC10E91D;
	Fri, 19 Dec 2025 22:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bjdig+QR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE5710E91D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 22:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766184820; x=1797720820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QcDutY8KGrhzrf38KjVquXZBWFhYcGA71bF7+ShuPcQ=;
 b=Bjdig+QRC9kSxly8fACj3H64bypAs65mSBysL3gQMHK3ASyjUi2MBIV4
 g8XFb/dD4VUGqVIlgfF1y3QS2EANqLKVCsgah3E5hP00WlEoFL2aEgwHJ
 5qYOpdxtOTRxTLD8ld2LeLYgEyPtvKTVoj7yx0yy15eXF58NVGyHnU0aR
 Hse+9By0WT7d0fcWmrOkQN0uIZ2PmGLqQisRnE0NNsTouU8qWh/oGf9un
 9Q+m8ENbc7iSK9Bw+9LuBsvdiAQCXhrX58vwWiiJlqOy0tq89WNeplr+1
 cJ+LNrNayD0ZEbTMs1rbgZ+Jo7xciVA4EncLPd8OyeRPfMfjysAzyu9wv w==;
X-CSE-ConnectionGUID: 3D36/gvOTL+MDZ/NMpbp1Q==
X-CSE-MsgGUID: CayuwHuUTTqvO8dfju4zUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68193259"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68193259"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 14:53:40 -0800
X-CSE-ConnectionGUID: zBPavbEeTsmXkC9Hsp+NGg==
X-CSE-MsgGUID: 6K8FfAz2TxatZYMaWsrjaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="203897564"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 14:53:39 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 14:53:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 14:53:38 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 14:53:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVZkL0M7vggihS6r6KtW19chFWE0JriLUM5TwwPHZApYT3e6PeFxlV0HCIyQt1rmawOwP7mlVoklt5CzYsGMw2YpNUgC1oLpRJZWkApZ3GDLGsTkIoVI+wvfE3kZvj8PrikGGl8CXiWyw4Gbv+Em4xWUNWHio1dZ9E/YI0Ki0vJ3954jogDDlyMnySPX2xnn0c13oABz38MUOv4tfb16IPH7u/wpzVzjjHtUfI6L1M5od4ESboRhwDb0fsZwdFeyr67QhYqRTe0P/a5Gg9j62LvnPE/U3pFIeO8aFlxeypPaY4aBKRinMf6OZJTRjNZBFexsiNyfVajDY7E/GHFffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FktIv1uQhx3MQWj2OrKRrNNH+7QxHu0e7z1PBpjH6Rs=;
 b=kOH4ZsBWAgg7vJOV1JsOm5H0pxz+wKDawwDs0N2jRRFXWAsYam4bInQ/OZwuK3dstym5trk/BTv1/k4heKIwaxw8BXM0zWUBmvT8iU7hBNdGYfMD+jfVrGvLwZS2batnjl//vjBCcivkrZn3uysrGGosShe8rKlWApQhpj5QFIFVdjVlwbYCHhJemTjLQcbbdlzUHDjt6eWTfCw2Pd/pc8t3UKViiI9k2E2PSS9Blw8rFoL5LfSQ6gk8sV4EAF5QxPm2yd052G1YQi4s3nzAQ+0C0isYwJS6KK3l1f2IGWKC9RDC01MKjKkPHfpDkK/AxQ0kdadWvmUatKr7KWbErQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 22:53:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 22:53:36 +0000
Date: Fri, 19 Dec 2025 14:53:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH v6 15/17] drm/xe/multi_queue: Support active group after
 primary is destroyed
Message-ID: <20251219225333.GQ4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-34-niranjana.vishwanathapura@intel.com>
 <aUW-SeH7NnRoN0AM@intel.com> <aUXTSR3snBJBTrO5@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUXTSR3snBJBTrO5@nvishwa1-desk>
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eb2e0cc-b28d-43ed-ad0b-08de3f517152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uHBQrXYn/MBQ5QW/WgVswF5tdwru28Lz39GWPEVVSiFgrj/PdA9B24mL8r9R?=
 =?us-ascii?Q?b9NJXL6qHysIQjOKv0PZ1V+xCMmhmeNyBzcPDIjlm6Xw4XyPbwEnjCt/O4UQ?=
 =?us-ascii?Q?zBd2vbnALywhXASadXDDGwkyvNFhgHvvEhXvx+pgtCCRHrHOVRBRa0s3vxeZ?=
 =?us-ascii?Q?jJlbcoMGwG6/Q6xt5GNd8mdc0k7Zg1uNt2+Q69BAvfeukdsRTsfRmtHw91/T?=
 =?us-ascii?Q?Qofv9iWYyzp8uDA35wAsc4JpgkFWl8LbZWldsFfxiDWiT4GdTUUIAtssVLJi?=
 =?us-ascii?Q?Om6cwsn0CJfeMYqvwGtRs0tnPnVpcoRQ6Pm6bW/+gBj786yDUoFkSQPXypZ7?=
 =?us-ascii?Q?uuxThWH9U8jA5doXFYj2ro7Zwpbkuz/Pn7nRl449wQA4F0ZBtgDLTdMur6eN?=
 =?us-ascii?Q?Q5FfeulEn2kD/82hgbXfRaRC2TCr7fflLozlLY64NhP2sv5rTNlC/2nc2KJB?=
 =?us-ascii?Q?0g4QH3ZPeIdCatDHOT+F4pgBh7eLe4Ss6OdWYJsjYyBiM9301Em3s/EBnqZs?=
 =?us-ascii?Q?PyVd4XbWEjBRfudN6S9x8CSHmjCb5CUqC0x9MV8MT+uZiIVwYzAJZIgHpOI6?=
 =?us-ascii?Q?TL/M04xJlk3gqeA26z+3aHRXJjTGJleEd4qX8XSuV9NszzalYrJ8TjXO2JJw?=
 =?us-ascii?Q?K90YKoKnBoWDFTJfrN2yE8tSY1KsPXvLnrFi1q3g5z5+1Z/PSuGQD3IWki9Z?=
 =?us-ascii?Q?c/ZlIXitZbTOvwGgtf3cCtXZRxXViwgrhhaZD70+JdYTbdWa2AeSScbKGpnU?=
 =?us-ascii?Q?ozv3SQSezNJAgZbirA4QVFdY3LllcpaSbwwGhzLifMa/KIdgRm7x1qDETsSu?=
 =?us-ascii?Q?njI6R4dZ/edyODWYQCyT8LRTf8EfihGj94MRpBTKuNOjNTGLLf1svQPh/pZL?=
 =?us-ascii?Q?Lc0Yj2+DJy5HS97+xGZ15zLRuMCuWNSCZD8OF8CHLsCFGGWXqwN+y5lBRRVi?=
 =?us-ascii?Q?AM4Xixc6FD76B0r3jXzR292eVi+ItlqbHgJfae4MwhcTBpnpNv39lBt78X7m?=
 =?us-ascii?Q?oJnvF8ThD6p+d9U9XSxyIh2FFtChaShZdyC9d6nblrXoU2EQvoq4ILXAISqT?=
 =?us-ascii?Q?gijF/ZQerKQh6TLOrs8o7cXP12FfI1dnhkZryZhuHhTPbbg5IzJsCxGRReg5?=
 =?us-ascii?Q?0/W5pKwHz4ltWG4BmNKWLuZalxrQWbsBwVmRU+lTbg6GkEr3d+NbcZ8hvZfS?=
 =?us-ascii?Q?Z+Pcp7dR+qlX2mkrJyjQ2xnKPKccqezQXnaAcJucbrRM2JVNIbtH3wQe+5Ds?=
 =?us-ascii?Q?RPuqv4UIPG1vuKt0+waETeAjrEABSlSq6ryMOnSHmjv+Mk9DHFjbWITe4ZgL?=
 =?us-ascii?Q?PM9Te8re0+IrwII48CqWqb3fvRb1r9rNvczp3YKWBVH6bWJ/Bo9Y9FO8Dq38?=
 =?us-ascii?Q?AnAab2dXzs4wLqliSaFWiKynLR0nrkO0tGPuC6HANYQDuD6U+w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hdmx5yz+7KUspJ30ul5Y99NqFTgUBsH6XlRW8e2zbh21aU47mEJWwE/ZhjSz?=
 =?us-ascii?Q?QI9+Hz8ftqhUBUAzUeSdu41pIGShjMY1AqmE5knxiRKOleFLvDQVpmSJRG/5?=
 =?us-ascii?Q?7peBAewvN6NtOxN393WvgtHS3OTu16wVZE1Gf8ki52Q091qEw9nVnnSfKlBm?=
 =?us-ascii?Q?Om4zO4G38qxA/k1gJSQ5XYg6DtIFsQ81JjXZ9gr9gPh9MmaUb5RK2XCMkiWo?=
 =?us-ascii?Q?ZHWH1Tlk1eYGW8UmhyOzEE76HT8hKyfL2NNu94Hu+AlxPPjEiC7cjfXaaI4B?=
 =?us-ascii?Q?SEgTCV//dsn8vbkNuhYqEHoz70J6oBIPijqgc/q2pbjM5cEAChNEc/dEvl8K?=
 =?us-ascii?Q?Vj6g1I//B6iI2nt/qhd1Nx4JLWoo3EJlyisJhL6TGKDdjI+9+Iffv05vGMQ3?=
 =?us-ascii?Q?u+zQ+aCZ5SQsLtykDCeAydDtVG+QEhiYxmtrzxRuWnpbGix2XUhxYiuqppm3?=
 =?us-ascii?Q?HmdKsGjnPYuFkh7qZvu2KvnqyYZacPqm3VGP9vdwRPxU2grQfMjWhgjkWZrb?=
 =?us-ascii?Q?vFUe7kDfZpM7LlyZARY57/hazNiQaze0EIhdYxjKH8CpXm7XmMNxNkugp/5f?=
 =?us-ascii?Q?rBG4u8NsfsQ2na/QbeZNznJGNwtl0qeOT57wICRT2elRMx0mcQyantfOXrtJ?=
 =?us-ascii?Q?vn2ateuPFFXZwZYj0gSSyfEwGhy35Pz37j952hDZsCIk4q0HpvbSgeNCZoKz?=
 =?us-ascii?Q?HKSqpEdCM/yyDYGVUpVyagqdY5E2Q4gmcI1hf8vbvYhY9yqWMhZb/Y8YEkis?=
 =?us-ascii?Q?K8mgVVsy6MolUXg7SGWPfTjpn/XoDeLDuVHWxJ31l33DMvSurqpGXPVzO8H9?=
 =?us-ascii?Q?R9D+yLFB8DATSzZ/Hkx5BHkAl3gRSdorLMx6uIw9VFnTvlxEO2UorJcQVnj9?=
 =?us-ascii?Q?MhXABlP6mC1iFzwcn0otavcME16untfTKSK0cfnOKwYdwEXLhiW+st3RP3D1?=
 =?us-ascii?Q?SonHl0Rl5G/+/sPP7/epKnnf7YDVPYYS3diTWAgKiRDc9Fd/TrQM7I5EEaeO?=
 =?us-ascii?Q?p5uUDnbga1z2LQDXtYQHM/mjOg/DQF6OFwTZKMWJenQXC3z8NgOhIddqaKjp?=
 =?us-ascii?Q?d/SlX4Vt/qyaZUlWMn7doiDyg7jo3OgBcS35kIxnduFirvjeUfksAcDQJ/SB?=
 =?us-ascii?Q?7ztQc3diIQ8fEEj/STJDrLrecmhGsQdDar78clgE2rHTZO3mpq2aamMhztMX?=
 =?us-ascii?Q?uvSjjrNPh4HJozpBkg+nRcovIe+Ui3BEVN2u9OX8OteBygFSr200kxX9dIV+?=
 =?us-ascii?Q?db7zJA+1IYEwF3z1WG8HlAaoGFbPuEMV0rDq9/KEv+SRVRJ30ZP0HIR8m0xY?=
 =?us-ascii?Q?k+QcmkHwAUURgSRecyAOLfs6as5HWMHnEYH0aBocEu4SV7r8HLLUOVpEgucX?=
 =?us-ascii?Q?0eYrwJkYHAq+dgaSHO+jX1nUPtvjLE5ceyRE/MuiwPSAZ2HeHZdJBZ+D/4QS?=
 =?us-ascii?Q?1LKdmm7aQNPLXww24MWv75ptrU/NjvCJbSmOb6NQ6N1UK8Z4YJ4P0LJfFkaq?=
 =?us-ascii?Q?XmlfI5kHRauKWmRc2PzszrljhXV7sMcygXJ1Tj5hoDXRO4aiuxnNHycl45s5?=
 =?us-ascii?Q?LhJyuR3VLNGlWUJRQUNhq95bBQP9rA5xR3VE0R+mYest2uSjyoovp9cm0oMQ?=
 =?us-ascii?Q?DhujB1lvh6cMI9Z0A393j9ZOc8vS8cRcbqyOYGzklLgCZ7wchNhyZGCeJhXw?=
 =?us-ascii?Q?Jh+HMMp7RYej1e+CpD6YqhHgWm6tq3AfRHzId4SSoSv/PW8GVnOgzA2tySQJ?=
 =?us-ascii?Q?xaC175xLh+IvW/1loM8DOG/GPRnkf7g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb2e0cc-b28d-43ed-ad0b-08de3f517152
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 22:53:36.0886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kyLIRis4LVXYflVLf4fU/pTivB5qhS6bPybQQ175ryTaO+VoXdb8GxEJeNZCBJBPo9L29hFlYO2s7EeA8/D5DUd2lrl5qBwdYcIWxrZLIKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
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

On Fri, Dec 19, 2025 at 02:35:53PM -0800, Niranjana Vishwanathapura wrote:
> On Fri, Dec 19, 2025 at 04:06:17PM -0500, Rodrigo Vivi wrote:
> > On Wed, Dec 10, 2025 at 05:03:03PM -0800, Niranjana Vishwanathapura wrote:
> > > Add support to keep the group active after the primary queue is
> > > destroyed. Instead of killing the primary queue during exec_queue
> > > destroy ioctl, kill it when all the secondary queues of the group
> > > are killed.
> > > 
> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_device.c           |  7 ++-
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +++++++++++++++++++++++-
> > >  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 ++
> > >  include/uapi/drm/xe_drm.h                |  4 ++
> > 
> > Hi Niranjana,
> > 
> > Where is the UMD ack for this? Who is using this uAPI?
> 
> https://lists.freedesktop.org/archives/intel-xe/2025-November/105779.html

I think Rodrigo's question was more about the specific
DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag added in this patch.  It doesn't
appear that the compute-runtime PR linked in the cover letter makes use
of that flag at all.  Is there a second PR that adds usage of that?


Matt

> 
> Niranjana
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> > >  5 files changed, 69 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 7a498c8db7b1..24efb6a3e0ea 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -177,7 +177,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> > >  	xa_for_each(&xef->exec_queue.xa, idx, q) {
> > >  		if (q->vm && q->hwe->hw_engine_group)
> > >  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> > > -		xe_exec_queue_kill(q);
> > > +
> > > +		if (xe_exec_queue_is_multi_queue_primary(q))
> > > +			xe_exec_queue_group_kill_put(q->multi_queue.group);
> > > +		else
> > > +			xe_exec_queue_kill(q);
> > > +
> > >  		xe_exec_queue_put(q);
> > >  	}
> > >  	xa_for_each(&xef->vm.xa, idx, vm)
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index d337b7bc2b80..3f4840d135a0 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -418,6 +418,26 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> > >  }
> > >  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
> > > 
> > > +static void xe_exec_queue_group_kill(struct kref *ref)
> > > +{
> > > +	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
> > > +							 kill_refcount);
> > > +	xe_exec_queue_kill(group->primary);
> > > +}
> > > +
> > > +static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
> > > +{
> > > +	kref_get(&group->kill_refcount);
> > > +}
> > > +
> > > +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
> > > +{
> > > +	if (!group)
> > > +		return;
> > > +
> > > +	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
> > > +}
> > > +
> > >  void xe_exec_queue_destroy(struct kref *ref)
> > >  {
> > >  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
> > > @@ -650,6 +670,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
> > >  	group->primary = q;
> > >  	group->cgp_bo = bo;
> > >  	INIT_LIST_HEAD(&group->list);
> > > +	kref_init(&group->kill_refcount);
> > >  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
> > >  	mutex_init(&group->list_lock);
> > >  	q->multi_queue.group = group;
> > > @@ -725,6 +746,11 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
> > > 
> > >  	q->multi_queue.pos = pos;
> > > 
> > > +	if (group->primary->multi_queue.keep_active) {
> > > +		xe_exec_queue_group_kill_get(group);
> > > +		q->multi_queue.keep_active = true;
> > > +	}
> > > +
> > >  	return 0;
> > >  }
> > > 
> > > @@ -738,6 +764,11 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
> > >  	lrc = xa_erase(&group->xa, q->multi_queue.pos);
> > >  	xe_assert(xe, lrc);
> > >  	xe_lrc_put(lrc);
> > > +
> > > +	if (q->multi_queue.keep_active) {
> > > +		xe_exec_queue_group_kill_put(group);
> > > +		q->multi_queue.keep_active = false;
> > > +	}
> > >  }
> > > 
> > >  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> > > @@ -759,12 +790,24 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
> > >  		return -EINVAL;
> > > 
> > >  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> > > -		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
> > > +		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
> > > +					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
> > > +			return -EINVAL;
> > > +
> > > +		/*
> > > +		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
> > > +		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
> > > +		 */
> > > +		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
> > > +				 xe_vm_in_preempt_fence_mode(q->vm)))
> > >  			return -EINVAL;
> > > 
> > >  		q->multi_queue.valid = true;
> > >  		q->multi_queue.is_primary = true;
> > >  		q->multi_queue.pos = 0;
> > > +		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
> > > +			q->multi_queue.keep_active = true;
> > > +
> > >  		return 0;
> > >  	}
> > > 
> > > @@ -1312,6 +1355,11 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
> > > 
> > >  	q->ops->kill(q);
> > >  	xe_vm_remove_compute_exec_queue(q->vm, q);
> > > +
> > > +	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
> > > +		xe_exec_queue_group_kill_put(q->multi_queue.group);
> > > +		q->multi_queue.keep_active = false;
> > > +	}
> > >  }
> > > 
> > >  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > > @@ -1338,7 +1386,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > >  	if (q->vm && q->hwe->hw_engine_group)
> > >  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> > > 
> > > -	xe_exec_queue_kill(q);
> > > +	if (xe_exec_queue_is_multi_queue_primary(q))
> > > +		xe_exec_queue_group_kill_put(q->multi_queue.group);
> > > +	else
> > > +		xe_exec_queue_kill(q);
> > > 
> > >  	trace_xe_exec_queue_close(q);
> > >  	xe_exec_queue_put(q);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > index ffcc1feb879e..10abed98fb6b 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > @@ -113,6 +113,8 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
> > >  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
> > >  }
> > > 
> > > +void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
> > > +
> > >  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
> > > 
> > >  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 5fc516b0bb77..67ea5eebf70b 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -62,6 +62,8 @@ struct xe_exec_queue_group {
> > >  	struct list_head list;
> > >  	/** @list_lock: Secondary queue list lock */
> > >  	struct mutex list_lock;
> > > +	/** @kill_refcount: ref count to kill primary queue */
> > > +	struct kref kill_refcount;
> > >  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> > >  	bool sync_pending;
> > >  	/** @banned: Group banned */
> > > @@ -161,6 +163,8 @@ struct xe_exec_queue {
> > >  		u8 valid:1;
> > >  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
> > >  		u8 is_primary:1;
> > > +		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
> > > +		u8 keep_active:1;
> > >  	} multi_queue;
> > > 
> > >  	/** @sched_props: scheduling properties */
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 705081bf0d81..bd6154e3b728 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -1280,6 +1280,9 @@ struct drm_xe_vm_bind {
> > >   *    then a new multi-queue group is created with this queue as the primary queue
> > >   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
> > >   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
> > > + *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
> > > + *    set, then the multi-queue group is kept active after the primary queue is
> > > + *    destroyed.
> > >   *    All the other non-relevant bits of extension's 'value' field while adding the
> > >   *    primary or the secondary queues of the group must be set to 0.
> > >   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> > > @@ -1328,6 +1331,7 @@ struct drm_xe_exec_queue_create {
> > >  #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
> > >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
> > >  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> > > +#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
> > >  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> > >  	/** @extensions: Pointer to the first extension struct, if any */
> > >  	__u64 extensions;
> > > --
> > > 2.43.0
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
