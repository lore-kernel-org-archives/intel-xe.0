Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C89C54731
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 19:50:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02BD10E0FB;
	Tue, 27 Aug 2024 19:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/11EDMO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FD210E0FB
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 19:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724788244; x=1756324244;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LU4sIxGzq+N4y3Qnf5J4+psGcAJAGF4wRvNgB65l6fM=;
 b=a/11EDMOHiuS9YXXbHcEzcZfTDmDuQfnRcR7vodcB7yTLf7Y8hQFpIwg
 rLOjQbkODFgj/wwwqR/zg8FdTyyKGcfZ5tq2pr0fAAOcJOVPug6sO/i89
 z6eOIPyD3CnfuFX2d/0Nbxbk+zEDPmqPAahe7M21H61W/3/zqQXnoXTIm
 J1FfRepXOnqD502/K6D7SCgn6X+4J8mEDdxU+94sU6YF7bHZM9FCClKou
 C8+RKtBpx1Sy7mulAuVgsLscldoh373nSQAbYorm1vpRMY2DSf7LOX85t
 tN5xgYf18V8N4bm1FCGULs2t+57KmldVaQcamr5SbWfs0dH1ruEjQmjWo Q==;
X-CSE-ConnectionGUID: SJ3n4wFhQiWCFIkqs4EnUw==
X-CSE-MsgGUID: /QG9LaDIRlSwlTTPKrabJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27058107"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="27058107"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 12:50:44 -0700
X-CSE-ConnectionGUID: n3IgaH8DSTuYOOTqsJM7Cg==
X-CSE-MsgGUID: HqD4QPeBS1KY2LV0F8KYDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="63697226"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Aug 2024 12:50:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 12:50:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 Aug 2024 12:50:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 27 Aug 2024 12:50:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 27 Aug 2024 12:50:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ1d4b1cCIpg6sparB9A7cgqsXuXEwkDnT8RnAa2Qh0kTy1VaPFnqUDLHR1Hr1B0Qatp5oLWnh8//l9xm7Cd41jph2xeKhaDTjh38Bx2lym2okjGt0fs2NcjzA7OxARCXvSI2MyUmOQmtvbBEPsb9zDJMbXGXJrhG2KyRj0Bf+YYDDPC4YnDfYcHnHb0gPmEYPzH/Dqt+0bmigcKA3Vvx5TSvtDBqwWcSVRbPi1Kvy+9DK4LYAGtBaikvqqE12uiEDQDEITLpI5HZxh+Kgt9xD/qNIbS6UNpLFz1p0zZo72ui0xC7oOsoFwvdYL2NotDM0IhNJPix0butqOWMSPrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKwRFYNS1Hl89ufQEVRpgki7F5TXH3gw58FzSbBjBiU=;
 b=EYTghZK6k4srKCS2nJ3fy9I3W/e5tYazlucrC/66mIaOkYxxM0YtPfpwXl4KgbXMgDtCDCcIp8MF+odu0yCw9FzD8wPR4i4PPKG1c4xmP35a2uGVbWcCBfOCE/v2C02R66ahbiKo8tThVS6ZRRe90JTxjTV37dkrqJG/aaRej2jDMnYPCZ6OV06LPMUo7fjCjwXhUJwHccCLgp7CxJIMfW68BID/5RRWuw3vfNpzYhwWOsbBYbndBfEv3rAgu5nMi/8F+OvRgncKsJHYvFZ8Lh1xPvpV4hdZ9F9nwP7UGwWCIdDeL7SxvjYZMSiXoHa1Zi+ClbgIVK9+Vsx7z5DWjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6150.namprd11.prod.outlook.com (2603:10b6:8:9d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33; Tue, 27 Aug
 2024 19:50:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Tue, 27 Aug 2024
 19:50:40 +0000
Date: Tue, 27 Aug 2024 19:49:21 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] Revert "drm/xe/lnl: Offload system clear page
 activity to GPU"
Message-ID: <Zs4twWpSuu2yHqHO@DUT025-TGLU.fm.intel.com>
References: <20240827154910.24841-1-nirmoy.das@intel.com>
 <20240827154910.24841-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240827154910.24841-2-nirmoy.das@intel.com>
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: 3997edba-c7dd-44ea-f265-08dcc6d18725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Ql2hiz4hum+Whwy0lmyzucrjaO9Giin5uVXvuV5RVHeAF1KKwvifOwBjzK?=
 =?iso-8859-1?Q?8PgucZKHNYCuPV4tpCCl02WXbyg/ZTK8lFDHntE41htHB14t03RaheXHkA?=
 =?iso-8859-1?Q?6E2EGg0cLsQbwUf02tKcGlDmpFH2ofKI07ssBIx7OKC7oM9Zxvx2AVvGGs?=
 =?iso-8859-1?Q?R3F9FeHsWduNp79Dnamr5/PlPFU5V/mFe9N5PixKoyUJ4WkKVDFaYFPDAw?=
 =?iso-8859-1?Q?Qu2jtxCa8F31aBmcxxervDCvCynIYNb5Ah0ShbNZUrTNKp/NcbSfW+jnbn?=
 =?iso-8859-1?Q?Riwe/mOXCBZfnapUSO7FY+yE/t06S8MQVvC3xgqk7uFmWU85KeC3JzGxoo?=
 =?iso-8859-1?Q?LRY5MVzIicPyYvOJmU9RFCMNJ/m5i+fk/ni70Ka6/To/iQ50f4KYMGpnkM?=
 =?iso-8859-1?Q?IRpI9au4hINxjBQQl6dRr8QZCpwG9S1ykBASfBofmALegKeKh5LSujpw2Z?=
 =?iso-8859-1?Q?9gMYjqZ9K00POnNGGPAxJKKJHYylhTrTvtS1OW4zXYEbutmIr/9nzHlYHw?=
 =?iso-8859-1?Q?2NGieFlYjWFtlBx2T0wB9KMqY4RH8ct70ZMmf/bPLmcaT6GRbQE0m3Vs4E?=
 =?iso-8859-1?Q?NXWiePebp/Pm8aHCQfY2S81ohhfi42hP5vk9KoPKJnbJjeL8wvhWRCO/FN?=
 =?iso-8859-1?Q?0dUxL3B/QrNPMXuuaKmcSvlK5X0+exoqX2rUJ7bNe4QJchSkQ50c3N/nAl?=
 =?iso-8859-1?Q?Fg+l82ZfwfJdXZdHwppHUKHrPRe7k9g525/Dkoba9LAnQSKvmnp1jy1Z48?=
 =?iso-8859-1?Q?UdMjzifTgCQugo8prAa1enDsGAwSwqRvBBrE7udSLD+L6ERGlnXA8qF27T?=
 =?iso-8859-1?Q?qh00wk2Qj4ZczojWuYnolI0QdsWlSdKI0SXKLfXhn2kx7GlIv59A7qFqjW?=
 =?iso-8859-1?Q?ujQ3EzCbKhPL2BSlhCtBWzGR0A/l70HwtH//C3H1/N7t0xG+VgmJjrrfhv?=
 =?iso-8859-1?Q?/mS/+KboLGcf/Vh4mmhBBoMrMCdSpOK3vDSFEwNZBIRcKA84uQYiXkd5kn?=
 =?iso-8859-1?Q?szwxWiL4ISv10muZDTEpHW89sxlFzmX6lxSuSpSy5vSxNSiJST4uywkXyY?=
 =?iso-8859-1?Q?5Pn8TvdRbhagGp7zPvbBDxSqij1FD7hUwCB+9diPZi9leGMXxyftTja8+P?=
 =?iso-8859-1?Q?v6qWyh7u1IZuO6us2A+fGnNskVKYUxmkapWijSBXiAxZ22MsfvaBZqcpbU?=
 =?iso-8859-1?Q?vmIU695wEAaszZYQ3AesQ9+ok4oNaDiei+Je2o4Z6Mmi5ca+E2uvSK6JMG?=
 =?iso-8859-1?Q?FuIjgDg+w9TqAvg7tLGlwxH+rjil5FSSJDCzaBsP38uxjr7N2WdX4ZG8h5?=
 =?iso-8859-1?Q?PqfJ3giS9SNd2cEShSPBthmSQ5pFSYmEzH47SC4l8Xse4G26vc0EXZPZLJ?=
 =?iso-8859-1?Q?pWr87/yvxaGRgdpkMmXvxX7X8jIhx11A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rGZ7DCFO3JIbsKc3Tump0NLwvCje2TnToq3eO8bWAUiv+Ico04rhUH07cJ?=
 =?iso-8859-1?Q?tEF6vi1FH/odtGGYpQb4XD9XcpAQz/Q56qNl0MlLKd7Dq1TLp34fEWl67z?=
 =?iso-8859-1?Q?B9YzxWncqhh+lRawjbPsgOnryCEpOLw6N8GTmsShL7QQeVEQsid13H14YB?=
 =?iso-8859-1?Q?1GdGM81BaMwPKuinHhSaXx0+zai9xAhY5Y9R4Z/tktGeG0CL/XY6ZX1Sya?=
 =?iso-8859-1?Q?5qv6E5C1DQJaEs5O/FKrEiTWUNuel5POmbcW5X7unxx9aCh73F8A+bZE6l?=
 =?iso-8859-1?Q?z+AA5GRok1ZkTBWQ5dOTCeoybap0m7D9gnGdB7b7UlytmLXkDMBkOiq+e4?=
 =?iso-8859-1?Q?V5PJvPO+NwcnaL58uP7Llmtr5kpuckTZ4ZJ4DjR3sl/870srH8dmoFKfug?=
 =?iso-8859-1?Q?GcyDXkwl6BxOt3ifiWi85dRb3SY2bEDbCJAtXM7X4Kpg1Fr+LypGCXF/Z0?=
 =?iso-8859-1?Q?37S9GwRUGyofKY8K7nYDvLi+a38NlZWR4X0Et4axnoDCDHVzi0wmSVeOSN?=
 =?iso-8859-1?Q?Zle8NuIgsp2DsRPZtAc7K6s738mh19ky9rrjXTrGVxF5vo6j+KfoqssgUg?=
 =?iso-8859-1?Q?w/ldYQOQYMkWQM9mCKPpcB1feyVyoBP3jcj/DwRy5YThdoso7lzLA5ROot?=
 =?iso-8859-1?Q?WJtnvoPqc4mdgf3X5qVmMUJ6TQc5zmFfG27l+WzaGuDp7T0PpZ0hffVezo?=
 =?iso-8859-1?Q?YM9GJWevqlzZDW5YE/UBiMLKE4dD8lOFnsL6J6YI+GI+MkYTpmfCUgWwR3?=
 =?iso-8859-1?Q?ZL9kWMbKfKFrEttJzPNjSYDCY4WmVa6s1aIhc0a4NdCbzLI+OTDgHc66pC?=
 =?iso-8859-1?Q?sNclEc+GTvFUD4trki4FivHMIW2zyzmeFjy8aKO44LC5WNwhyAoiMEuIKn?=
 =?iso-8859-1?Q?98S7oLlJesu19gbEyiiM8rT7xb0mwA1mcF+MqRIWNsA5C/IQUNrKqSizAc?=
 =?iso-8859-1?Q?305V5p3Royf8r5R5i69r7CeoBxZyYjUa6rS7WcCuXV8+W3S787iN37kLk7?=
 =?iso-8859-1?Q?6jHO4CS1UxwQ6YilJD1B1kfFTU4b52Ag3xqrBgRa6ieuLslGu7G9yprJfH?=
 =?iso-8859-1?Q?UAJXKymR+MLKLs21Yz3RNK4abPAPbdOCrPc8JuddPsvpigGWPB2CCbeTdo?=
 =?iso-8859-1?Q?5c1cX6Q9sWLA2iWMEKArtK3932CjaBukZ1KeluBpZ5uO/RjuCIK99Z1cEN?=
 =?iso-8859-1?Q?IKw2DAe/z2mlaeESX9MTuqt1mGZcMn9nK9pEHKvL+HGmyTjFLL3FrKkblN?=
 =?iso-8859-1?Q?XNAlEJ7aKhua46TOKqbx9ujwT7877/yB5Bz3UZYa8K36J6mxaJWdGTgPmf?=
 =?iso-8859-1?Q?p8a7RzPU8GWiZBlrn0e1ijGmGp2bxsRTf2QshBYP9nKVsL+TA1wPvYJsfN?=
 =?iso-8859-1?Q?REqmILZyimUYhW1HPQPT1G27/LuSgu1+gA+Vkt6vFfBQSuCKptlxnRkXy4?=
 =?iso-8859-1?Q?Ab4LRncCkxP2nLqzfc10StbetSbrhnV+VEesm0jIfasu9wNHMOlQbTveD1?=
 =?iso-8859-1?Q?OGZobiaED/jVjKofZrAZ9nugA4AnltdQipDQVemYl68dPtHylDgrRZHGjT?=
 =?iso-8859-1?Q?bNpq9sUw4926v2vSG3hK6Wu2OQPOyYMw2aR7E4v4gAmBw4iMZRPcQh5YHL?=
 =?iso-8859-1?Q?nm2LaMDMFH4pu7UkrJnoJSwVymolbGxn2A2PSijr/z4KE21w9kWZcsQA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3997edba-c7dd-44ea-f265-08dcc6d18725
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 19:50:39.9101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVUGrBGeCBEYWX2QI94KrTnpW8u+Z4IVY7zZ09iGiQtNeVFE8S/ZAekhu9WDGeCQPMCv5JXRsyLEWHK3Su095w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6150
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

On Tue, Aug 27, 2024 at 05:49:10PM +0200, Nirmoy Das wrote:
> This optimization relied on having to clear CCS on allocations.
> If there is no need to clear CCS on allocations then this would mostly
> help in reducing CPU utilization.
> 
> Revert this patch because of:
> 1 Currently Xe can't do clear on free and using a invalid ttm flag,
> TTM_TT_FLAG_CLEARED_ON_FREE which could poison global ttm pool on
> multi-device setup.
> 
> 2 BO with WB caching type can't have compression enabled so there
> is no need to do clear CCS for such allocation. Reducing CPU
> utilization is a plus but latency is more important.
> 
> Without this patch:
> UsmMemoryAllocation(api=l0 type=Host size=4KB)  113.1 us
> UsmMemoryAllocation(api=l0 type=Host size=1GB)  91452.6 us
> 13.93% api_overhead_be  [kernel.kallsyms] [k] pages_are_mergeable
> 7.59%  api_overhead_be  [kernel.kallsyms] [k] __lock_acquire
> 3.86%  api_overhead_be  [kernel.kallsyms] [k] lock_is_held_type
> 3.39%  api_overhead_be  [kernel.kallsyms] [k] rcu_is_watching
> 3.37%  api_overhead_be  [xe]              [k] emit_pte
> 
> With this patch:
> UsmMemoryAllocation(api=l0 type=Host size=4KB) 91.7 us
> UsmMemoryAllocation(api=l0 type=Host size=1GB) 89486.5 us
> 91.86%  api_overhead_be [kernel.kallsyms [k] clear_page_erms
> 1.81%  api_overhead_be  [kernel.kallsyms [k] pages_are_mergeable
> 0.99%  api_overhead_be  [kernel.kallsyms [k] get_page_from_freelist
> 0.63%  api_overhead_be  [kernel.kallsyms [k] __free_pages_ok
> 0.50%  api_overhead_be  [kernel.kallsyms [k] __lock_acquire
> 

Cool stats. How did you collect these. I'll likely need to collect
similar stats very soon for some of the working I'm doing.

> For larger memory the delta is very low so it is likely worth
> doing gpu based system page clear that can be reconsidered in the
> future.
> 
> This reverts commit 23683061805be368c8d1c7e7ff52abc470cac275 with
> minor conflict fixes.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Anyways:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 26 ++------------------------
>  drivers/gpu/drm/xe/xe_device_types.h |  2 --
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 12 ------------
>  3 files changed, 2 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 24701272e3af..fd4b2b2dfd8d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -397,14 +397,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>  		caching = ttm_uncached;
>  	}
>  
> -	/*
> -	 * If the device can support gpu clear system pages then set proper ttm
> -	 * flag. Zeroed pages are only required for ttm_bo_type_device so
> -	 * unwanted data is not leaked to userspace.
> -	 */
> -	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
> -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
> -
>  	/* compression is not allowed for cached BO so ccs clear can be skipped. */
>  	tt->skip_ccs_clear = caching == ttm_cached;
>  	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
> @@ -428,10 +420,6 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>  	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>  		return 0;
>  
> -	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
> -		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
> -
>  	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>  	if (err)
>  		return err;
> @@ -677,16 +665,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>  				  ttm && ttm_tt_is_populated(ttm) &&
>  				  !xe_tt->skip_ccs_clear) ? true : false;
> -	bool clear_system_pages;
>  	int ret = 0;
>  
> -	/*
> -	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
> -	 * moving to system as the bo doesn't have dma_mapping.
> -	 */
> -	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
> -		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
> -
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
>  		if (new_mem->mem_type == XE_PL_TT)
> @@ -709,10 +689,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>  						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>  
> -	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
> -		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
> -		clear_system_pages;
> +		(!ttm && ttm_bo->type == ttm_bo_type_device);
>  
>  	if (new_mem->mem_type == XE_PL_TT) {
>  		ret = xe_tt_map_sg(ttm);
> @@ -824,7 +802,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (move_lacks_source) {
>  			u32 flags = 0;
>  
> -			if (mem_type_is_vram(new_mem->mem_type) || clear_system_pages)
> +			if (mem_type_is_vram(new_mem->mem_type))
>  				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
>  			else if (handle_system_ccs)
>  				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4ecd620921a3..e73fb0c23932 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -333,8 +333,6 @@ struct xe_device {
>  		struct xe_mem_region vram;
>  		/** @mem.sys_mgr: system TTM manager */
>  		struct ttm_resource_manager sys_mgr;
> -		/** @mem.gpu_page_clear_sys: clear system pages offloaded to GPU */
> -		bool gpu_page_clear_sys;
>  	} mem;
>  
>  	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index e0ac20f20758..9844a8edbfe1 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -117,17 +117,5 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>  	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
>  	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
>  	ttm_resource_manager_set_used(man, true);
> -
> -	/*
> -	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
> -	 * and use GPU to clear pages as well.
> -	 *
> -	 * Disable this when init_on_free and/or init_on_alloc is on to avoid double
> -	 * zeroing pages with CPU and GPU.
> -	 */
> -	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe) &&
> -	    !want_init_on_alloc(GFP_USER) && !want_init_on_free())
> -		xe->mem.gpu_page_clear_sys = true;
> -
>  	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
>  }
> -- 
> 2.42.0
> 
