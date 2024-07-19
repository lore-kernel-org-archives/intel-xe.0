Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE103C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 16:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA0E10EC57;
	Fri, 19 Jul 2024 16:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0swSWDC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA2410EC55
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721407077; x=1752943077;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XEuBRbxdm9exHXTWt48v77x2yMt2Yv/a5WEWUL/tro8=;
 b=m0swSWDCHsnUOwu6jNUB7WZbURw8es4mBtt79mlJ+5nyerO8mK8bJA14
 GRjGeaTUa6tT0wPy2L59rolavcOi97/QQ2SOMBng3Zma8nItndEy6l3bM
 4Qn9HMBJB016o6pq4G/PGj6NwN7yn//Lb3ynVsJ5zAkZKcxyVVamQKHw4
 9JLeOfu4yKzJl+2GFECnUPsSoPOIzD4LWgGW0UM6PjJhnaFYhckHWKK6x
 K4kZSQ81bEa970+MDXs+Ez47hIniwGbAriWRrD/s6vL1xhjMzXuKoRMy7
 hufkpmOWy1KWuiSdokssPClU+pIt/0csRwxOnyhh+XpSkrQyCqw1jpR10 g==;
X-CSE-ConnectionGUID: mjVyrGy9TG6kVw56zRNKEQ==
X-CSE-MsgGUID: Z58IqAvMTj6rgE3hqMHO3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18732194"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="18732194"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 09:37:56 -0700
X-CSE-ConnectionGUID: 59rSQUTzRLakKnIY+sUzuQ==
X-CSE-MsgGUID: T/xv+oNkTLqwwvqMDjX+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="55361746"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 09:37:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:37:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 09:37:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 09:37:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 09:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ef98f0AY32TEcYlsEcsvkL88BZAMAwN/8DVQP3n/oWCvOCQeyEZJAqHaVRh7LbdeGHdpQL4NDFfWgccAoj7rIli5wHflL3CjKjKf+EFvaqvsEicssRSMkpvKcKsYDco4a1GFA9o1AFIVHEIzQAyJRLSLm4C5i+24uBCbdhZ8/bCp5rRH7qIkMJSWtIcT/I6eH4cUpznxxrldBDHmtrxgEv4RRkYw0TyqpIkEbxJF/ZYHQKXbZ4gjIoYsqKwMoYn0RnWp/Ji54nW23t3QmmTAeM3/f0r9Fpct7gQ0K4AgsXcgejNDn/A3PQB1dtZSbZtXJblwmMnbyUW6JHPdWX9ShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9IAulUUgjnZ3yVw2Ab3zcHuaD3W+Tup6WKpBfDAl0A=;
 b=PCvvZ6KK+X4ibrh+W6gfFKdorQhJCX62ymc313uRBjPEE2R1LJYg3vBs8YEB5Get+CBnI/IO2qXd/ZCktSUE0fjzbH2yGG6JfyQXoN3pO9mHNzNbDUUXI9psb9YX89aZzhkop/rbYwopoyUxPKQgyDhuEogOW4IEiU/skDpkSwxfueFncyxinxi+KQ+IuVUljFVmvUcmTFvO0xt9t4Qnd7rTW4D6g1CXBihYtUvuXhR8th9A3XnXh+SfSxVaFs7K4iqlyPQt0preF/K09THOtGFN71TBvEWUnLJTovg00NYQZbt81YTt0vhB2yIY/zal157+vPba7gMaUADtbtaJGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Fri, 19 Jul
 2024 16:37:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 16:37:38 +0000
Date: Fri, 19 Jul 2024 11:37:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/7] drm/xe/tests: Add helpers for use in live tests
Message-ID: <oobqld5nhkmzotfrmcr6o55vpto2jagrybddrurojsfvrfrd2h@m5vcqrlxkdts>
References: <20240717195155.442-1-michal.wajdeczko@intel.com>
 <20240717195155.442-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240717195155.442-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0232.namprd04.prod.outlook.com
 (2603:10b6:303:87::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 77567f51-e6be-4f4a-7307-08dca8111a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UL24fe02WZJGfJlxg+LE40VPvQQ1mfHHPmGm94ufw1wGQuzz+zOVh+edcWUW?=
 =?us-ascii?Q?rUie++pmXcEDDMndqj1/6nkrvbBuYLEqu1fITZvDfEa6vBeCNSETmI/kjFZO?=
 =?us-ascii?Q?1kV1+uFtRBJhpqGqRqo6PuRzjCnEyHrnSmfW2x6SnZmRCZDfia8aJDW5HVwq?=
 =?us-ascii?Q?oqDqre8rhNu8CQ+HpZJ7HldcEIoYmApk7LqYdqqUqNNZXxNzMKYj9+aznNnn?=
 =?us-ascii?Q?purFDWt9syDlN+hkZNNYT5tjl3ONodei7xTMaUk2CXCOeHuG4sHedWvG26NI?=
 =?us-ascii?Q?aJwffauUI9XM1WERAdg1WH/zvHbyDKXmlxW7VjmBRlJVi2i/BukZjmgO5+yb?=
 =?us-ascii?Q?IpxVpfw6xsC+2SzzSyWqQiR3XccBJswbMjQCPk0jJZoZfXX8iFbYE5v5Jzag?=
 =?us-ascii?Q?tYoCW+8k807vzl+GOK3YMNa/afNBwUKPC/haZMed5ZzVLptXilqfjrFqD7Aa?=
 =?us-ascii?Q?M5wgBf8ntbJ9wD2QiaYghUvR9CkPmk4VNOOG+KqMbWB97XWNHcu81uu6E4AU?=
 =?us-ascii?Q?x2FQcvwlhyUWQJq7EGliTE11VvGFydImGFpE1uMhJBU55sx27op7vPFgwBXw?=
 =?us-ascii?Q?Tr8yCTTRk0MifiEwoie7JgFyBaMNhoqjMCWbYXM9ta0XCkXO7W9vQ68NiZF8?=
 =?us-ascii?Q?+r7we/fUGlYHSixmdo51ZIdS18LSi9cO69s3PrjOssWnzKYhIbiNsnNaKEc7?=
 =?us-ascii?Q?6j0EJcfCCT6lNvqoFbgmx7zVO6eB9kOwHRYDC02BrcQ/zZAzD5F8/i0KL11/?=
 =?us-ascii?Q?Dn11MxSBpTF17Xjc0Vv6T8E8C9X/LHeMKeZM8Xax6MeKPDEgqzsQB6IJuNdT?=
 =?us-ascii?Q?8IHX1DtyPw6jbQ5Oy10fExi96R0nZQg38qMKTBnVqKRnnw0fAxgQNC0TDzTJ?=
 =?us-ascii?Q?D3IqR4NcCY0qDXFn+Gp4aHllnWqmpps7G1F/QUvf/xm3qVh596d1dvnKVsFy?=
 =?us-ascii?Q?qDFHAIuGJ3IMeEAcXDGN1ZbttBCgHDC8c/R76/d6OkEAMqwFm03xMLE3wy/M?=
 =?us-ascii?Q?8OqJJVP5WNRUXomjX4DT6S+OHiEte3Mt6YMnpUZfGTQwEeadwZ3uwMYOfx7A?=
 =?us-ascii?Q?9/ZZInDlIJ/VUcMs1i/hvBBxkZZZXPLUP+YkT/El93BFHEb1ARVBXDYc0gTl?=
 =?us-ascii?Q?XGq76Q4lgk8rLZ2bJppqoGZ/asvyRVdnqtIo13xuOu2p0qW6kBpxe/4B49I3?=
 =?us-ascii?Q?pWAn1UGZN4t7kc3gDEbLJWWbJZLExHuxm69ceEBvwmlrEhBwzKS7uu2xnu4i?=
 =?us-ascii?Q?gTdN1Zb07HsvWfExLL6VUUtHPYVVw376nTQ4bgKj3pVEp7lw1+I15I/mDVmJ?=
 =?us-ascii?Q?3IX1HSPyCHQl0QiuHiCt5tqwsewtIVlZOXulAM5ygRj1lQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mUXtxQOUdvEaFc+TcLtei7P+70vU197J/xk7z8zoL0BtOSOfszj3IvcKTkTU?=
 =?us-ascii?Q?5QddzXC2spprBep8e2led2mO2WFOtN4yhbO4LAau/tqCWRPOoRpKrba8Te2M?=
 =?us-ascii?Q?aEzpO2p+4e5iKJx1Eo3Gh+jslztd4IQZO7bw/7LoE2D4vzbbjRNT1qGBOf0g?=
 =?us-ascii?Q?V/JR7VmCvSvH5C8ibxkW4lxznK98+KkIQCgHFeMPg9d9uKqu0Y3cFzcRQ2HO?=
 =?us-ascii?Q?hR0U+VHjM9qyLrlwG7C2cJbXg7OewTjtqVCOPABysWuKUwhumn487/q4fpjg?=
 =?us-ascii?Q?Tb3xhKyY6KE+FLvHnx9/Y0vx1nmOW3y4MA/XvUQlARuOE0SGE9qn5KNLkkni?=
 =?us-ascii?Q?3qom5KhW4GFd9ZBCOZM+N0c/5UwbneOZvX/0WG908+Rj+egOgxE4VmGJReIm?=
 =?us-ascii?Q?xirrlODRhq+QQEU1g+ScTgbTNCSsw1EkNytE7dRWYIvIg8CvedARtwjOsBOa?=
 =?us-ascii?Q?jSpkcH9BGVuUA5LlUztpDB8zwoSfpPYNC1s1u6cWiFV5s4Jmy5i/8wqdUpAv?=
 =?us-ascii?Q?2JTr8oheNHFFtwnPpPEPEA7JGDfdpc/FyHSX5TJbaYTUDACXqnqEc9fkz28E?=
 =?us-ascii?Q?ztlLpjQl30+4mK+e5T2omYl5wwv38ewWKobvnsM4DGRjY++Ov+NR9Mvq3oTr?=
 =?us-ascii?Q?/oKA/6wJImeLGyZY/6Jh5M1bB2Q6ACs9DXgMyCempufvczbkmgqu0LLLMbgm?=
 =?us-ascii?Q?svmPZIk7/jcOpqyNJHeZ4TFinytcOUuLBbRaQSy8Cq7OyxHJZSo5vTDXrcvx?=
 =?us-ascii?Q?QNHWUcCBoUaKbm3Uanen0yI4yC0AHIGkFV6RB32V2rdRRSuQg4P07eCoPre9?=
 =?us-ascii?Q?qjdMKipdHnoTskezyK26iyI7GOtnuhIN0SCNO5BHw3NvsSw8qF3bkLTxWjCp?=
 =?us-ascii?Q?JAmfd89s3IpGmp8ektYQixB1gYaEFbCJ4SwFlNqf3MDHPGBFHuUmuC7LYvhi?=
 =?us-ascii?Q?VzwO0v5FsSN1uV7j1tyxtYEKAvZ0ze4q+ba5t6OquZuMOmKmaTh8XDlKR3ux?=
 =?us-ascii?Q?13tXGwy1glAjX1CMsyryrp572BXwjRinlXLE1XmG4V6L/mUnT8nNsIjsYHn8?=
 =?us-ascii?Q?ym15zoo0HeWumfOwTv2l63bH6QMYssT+ho3ku1XMcHTPrc/1jaTC8EmyufWS?=
 =?us-ascii?Q?5fnTmhfMPfI+UGQ00dpSX0nLbRh0WEnI1nkFiNg0JfSkzHTWUW/jIQZLKfjc?=
 =?us-ascii?Q?GVBC4Gm77Ro5Y/XnA4ZxV/qBPOcNr9rE+wEhdcADCPyWlhpjV/U/Gv7zoepo?=
 =?us-ascii?Q?UMJ1YPaKTcu7v4h9pxBbItE+fo1qmxxLDzOlTRM+ekdX/BI7q5bKm4s7TKJ8?=
 =?us-ascii?Q?CSaB08aPuZJVxGAPnW2zDIZFkj5KoRbSf89G39W0ZjkdtR520ZSEI+2tkfny?=
 =?us-ascii?Q?oCtqORsZs4xfyR3hWIVnMGx+/PX9YWsGqGPe1o5TWP2nqOD2P7IAyL7i4K87?=
 =?us-ascii?Q?kLRDTIrnaJ9VsRkPB1v7RfsGlSfXZrue/+dBPnQ1gm8t8PWz5dtxKGDQ6Kj4?=
 =?us-ascii?Q?t1dSb8om/KHtJ15SLTwh9MzB1j12ikLzFqhErtUvfihsNsh7IaoaAZ3VhuC9?=
 =?us-ascii?Q?D6zt4cmZhIhjQJax3YFOmyJXBUl91yT45EYwO8gnxQ2DjzBI45fOY5QuY/mP?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77567f51-e6be-4f4a-7307-08dca8111a02
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 16:37:38.5582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uWhuC+En5kAXgGBhY44Hjj1X6E9El4QGvT8dq34XiDgYZKs5kQ+zxAm6OERVkiVK2YDc+7RftLvTJXlKymOGK0qxZOsrsaMglXgvgcjB2uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
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

On Wed, Jul 17, 2024 at 09:51:50PM GMT, Michal Wajdeczko wrote:
>Instead of iterating over available Xe devices within a testcase,
>without being able to distinguish potential failures from different
>devices on system with many Xe devices, introduce helpers that will
>allow to treat each Xe device as a parameter for the testcase like:
>
>static void bar(struct kunit *test)
>{
>	struct xe_device *xe = test->priv;
>	...
>}
>
>struct kunit_case foo_live_tests[] = {
>	KUNIT_CASE_PARAM(bar, xe_pci_live_device_gen_param),
>	{}
>};
>
>struct kunit_suite foo_suite = {
>	.name = "foo_live",
>	.test_cases = foo_live_tests,
>	.init = xe_kunit_helper_xe_device_live_test_init,
>};
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
>v2: can't rely on test->priv in .exit helper (CI)
>    for cleanup use kunit_add_action_or_reset() instead
>---
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 39 +++++++++++++++++++++
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  2 ++
> drivers/gpu/drm/xe/tests/xe_pci.c           | 30 ++++++++++++++++
> drivers/gpu/drm/xe/tests/xe_pci_test.h      |  2 ++
> 4 files changed, 73 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>index fefe79b3b75a..bc5156966ce9 100644
>--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>@@ -12,7 +12,9 @@
>
> #include "tests/xe_kunit_helpers.h"
> #include "tests/xe_pci_test.h"
>+#include "xe_device.h"
> #include "xe_device_types.h"
>+#include "xe_pm.h"
>
> /**
>  * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
>@@ -88,3 +90,40 @@ int xe_kunit_helper_xe_device_test_init(struct kunit *test)
> 	return 0;
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
>+
>+KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put, struct xe_device *);
>+
>+/**
>+ * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
>+ *                                            use in a live KUnit test.
>+ * @test: the &kunit where live &xe_device will be used
>+ *
>+ * This function expects pointer to the &xe_device in the &test.param_value,
>+ * like it is prepared by the &xe_pci_live_device_gen_param and stores that
>+ * pointer as &kunit.priv to allow the test code to access it.
>+ *
>+ * This function makes sure that device is not wedged and then resumes it
>+ * to avoid waking up the device inside the test. It uses deferred cleanup
>+ * action to release a runtime_pm reference.
>+ *
>+ * This function can be used as custom implementation of &kunit_suite.init.
>+ *
>+ * This function uses KUNIT_ASSERT to detect any failures.
>+ *
>+ * Return: Always 0.
>+ */
>+int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>+{
>+	struct xe_device *xe = xe_device_const_cast(test->param_value);
>+
>+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>+	kunit_info(test, "running on %s device\n", xe->info.platform_name);
>+
>+	KUNIT_ASSERT_FALSE(test, xe_device_wedged(xe));
>+	xe_pm_runtime_get(xe);
>+	KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test, put_xe_pm_runtime, xe));
>+
>+	test->priv = xe;
>+	return 0;
>+}
>+EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
>diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>index 067a1babf049..83665f7b1254 100644
>--- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>+++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>@@ -14,4 +14,6 @@ struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
> 						  struct device *dev);
> int xe_kunit_helper_xe_device_test_init(struct kunit *test);
>
>+int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>index f62809ca8b51..ab570dbb71ac 100644
>--- a/drivers/gpu/drm/xe/tests/xe_pci.c
>+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>@@ -167,3 +167,33 @@ int xe_pci_fake_device_init(struct xe_device *xe)
> 	return 0;
> }
> EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_device_init);
>+
>+/**
>+ * xe_pci_live_device_gen_param - Helper to iterate Xe devices as a KUnit parameters

s/a KUnit parameters/KUnit parameters/ , or remove plural.

Can we filter by device or is this something coming in future?

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
