Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595E0C87FCB
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 00:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0BD10E6C3;
	Fri, 30 Aug 2024 00:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J13z0KsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9805410E6C3
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 00:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724977694; x=1756513694;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=33/K0zDangrT6+UsZv5qWO0ujEyirHOb9uDj3bxYIY8=;
 b=J13z0KsO/tkT5qR2DALDZVnI8oQTHrA0OlLsCzn0stRdtv0kWrKZZraH
 +Xe3mSXUpkGP+VXVEUisrKGxfFRHZBVdNo7gIh1scAFNIyF2uB8kR5orU
 axsZNX8sc5dhMwn/PLE7T8ZCr36hqVBdjGjuOKpsoLlRHub0PZk9NeAn7
 Wldie+nxgMen+Yd524WmXettWAMzyshaL9LNiEb4ETUgoDrc55uHHcXkT
 f2KxLcC9ERfwdHU8/yh1vmcPPbwirIzQNoxGAspyduGLZbxa5XSE0AXpT
 z557uvjWg4zMKYO2PS+CSaV4RAIrZx+UCwO9vPBQxZQsUGfuhUTWRAUPX A==;
X-CSE-ConnectionGUID: 0VLtVh/jSDSYMY8M9ULS7A==
X-CSE-MsgGUID: 5Z6A+OLESCekEF1mE8p6nQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="41108553"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="41108553"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 17:28:12 -0700
X-CSE-ConnectionGUID: 42TdCmAGShOtAqJe1QHOBw==
X-CSE-MsgGUID: wVnZthiNRX+bV0U0c/gEJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="64245527"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 17:28:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 17:28:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 17:28:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 17:28:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hb9Clz08M0yIXqhZy3uPdgn00IWeRIevocK0euUfvmcdbIgyzXFOxdFcWG3TW/6et1jb4RC8sbLhD1ruOIVfuNAR6n7kxTiEUHeAqUZGd/opz4ru8duabpN4cwZUYzrqVRe+VdhyOr75m01vvoqUo8ZvtViMF+AeUeANJ7n+KFMegNvK8CJYXUiE8Vu5Udbs5nvRJ+wYQQyJq4A3E3QBX3EPgm9E2Iig0EwV55Ih2WTazavspKz3hYINDRg4Y66dmXbY8FwIrbvoUwVsrVpGk5azUdX0rjOnETPyjFN0o4JOEWLpYcxhYomE1IgpswebYAZY1lgUzh+zwsg12ArV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg/PrIfcUvcPUPBh032c0JEXobxbR2FeiYxqF82hlW4=;
 b=dcC6sfiYW1CtBxvSSoZfszHeT5hJEuv4C4I97tdjiVs7ekt3xJdUgaHatwd/XHFkXCbbCZ9weZc+b+wQ5NUgZQIL/dtozlLDtPNGjxWdqZrX3USPrP9FxC51uBqNQoSfNWdvSHbAE50JCw4+zuclgJoWeZD/VekRJvNbJLEoRYvBArJMHllxWsRoO6nmd4fC6JLfIftycmoyS4ROyVMMQM2Qu8u3MeI2RwwPi/Ji93g89LOyA1AXh9zAiLOkHdZY887IJZH6ELrUJOhsfmO0+lg0/CcN9+T3YWySsh6xH9iu+NMF7ph1Jb/17aWzdwK0a/F74P4VNqlMh8HnD7OO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CY8PR11MB7797.namprd11.prod.outlook.com (2603:10b6:930:76::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Fri, 30 Aug
 2024 00:28:09 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7875.019; Fri, 30 Aug 2024
 00:28:09 +0000
Message-ID: <8dea3eca-9196-4e14-8bb0-919ec1ea9f2b@intel.com>
Date: Thu, 29 Aug 2024 17:28:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe/pmu: Define and init a timer
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@ntel.com>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-3-vinay.belgaumkar@intel.com>
 <Zs924vLoxdmMIb5T@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Zs924vLoxdmMIb5T@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CY8PR11MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: f4678307-772d-45e8-8fb4-08dcc88a9ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blUyUmZZd0dxVmVIN2xLU3NDd29TcnNNSEc1OEgyUjBILzNNQXEvVEIwcVIy?=
 =?utf-8?B?cS9CbVFORUtkY0ZRZ09iTzFlbkUwbkR3dXU2WTFIeVZFcHZFZjZGbTg1M1Nq?=
 =?utf-8?B?elRxUDVKZFpScEcrN3EwRHM2RDBqdXdnSEFlMVQzMks5eG1iejNzT3hGVVRr?=
 =?utf-8?B?WUZYZHNYOS9TUmtseVZUZEY0YnVFSzJrRTNhNzIyd2kyNWJUVG9zQ0tkU0Rr?=
 =?utf-8?B?QmFEYWNITUZSWktndlhEMTV2TnBUb25mTEFMbHA4cTBGRmNxQVdKeDUwQ3JY?=
 =?utf-8?B?cml0dkppT05ERlZ3anR6cHhXcUMvSS80U0tNUVE1ay84eGw4eW1LcXhpL1d6?=
 =?utf-8?B?alYyTy9kSjFxT0JlOERFbHNhekRpUmJLZCswaldKL3B5NlZrZkFZRjZoeEFR?=
 =?utf-8?B?blVEQVdCdzR0TnRNWTQvek9MOVdBam85UndzRkpDQ0tIKzVESTNPVDlmTjg3?=
 =?utf-8?B?SVhSZWZuV0tqS2V1MUU1NWs2TGVJcHI5dEtKQlVpMExPZ2pLaExrS3V6Z2Js?=
 =?utf-8?B?WmI0Zi8ySGd4SjVkbngvYWtkakY1QTU2c2VOcG5lVVNFcW1lTWtxLzRzbGVh?=
 =?utf-8?B?ellZQ3Y0RTdVUWIveXBaSFllY2xaa1FldFA2UTdOSWxyQTRSTUpPREFZeUZM?=
 =?utf-8?B?NnNoVUhMR3NISzF6M09ZN2lCRUM5M3FLbWNsZkJXb2Q3UjdXTTVFRzVtaXNP?=
 =?utf-8?B?S0I3T2Q1NWlzV1Z0cDgxK1NuUzhJVGtveDBRZEFQTS9pVnR5RnRVcnJnQVd5?=
 =?utf-8?B?QkJNWDRxYUpvMVlZSkJZVnFRN0h2M0RIN1NRNlZmNmcvY2JzZDlkbVprMDNm?=
 =?utf-8?B?NGNGbUVQZkpyQ0N1dzNyMHcyWUN0Nlg1enpMaXNYM2M0djdBT1ZsNlNSaWVt?=
 =?utf-8?B?KzE5aG1yazJyc0V6T0NtaEVaN09sYTVzUWYzQmFNRTc3OTZaQkFBRWpYa2xH?=
 =?utf-8?B?eG1HNnIvbmxrbE8xZXFKVC9KSGlRcG1ibDJwZFh1UkI0clJZQ281elQ1ZGY3?=
 =?utf-8?B?cjZiWk5JYUpBNWtGVnRENWpuWVhENEFEakl5cUdYaUZnRnJqdElxUVNuZG9u?=
 =?utf-8?B?UXN5OVd2Mi9Ra1daNkFSTEZJeit6MWt1TjIrTmxYcURTaE5raktieWI3Z01O?=
 =?utf-8?B?YlZNbnJWVnAxT0EvNXdwdXZYOThvQ2FUNDVQenpzTSsySWJNVzhGNUpMTmxM?=
 =?utf-8?B?MVNUZWI0by82NFVJZDlxN1JVZzdpNkE4b3JMczZrb3EvckFIdnpYb0o5TFQ3?=
 =?utf-8?B?cTFwa004QUZVaXJvSmF2YW1jWUJITzdiY0NDMmV3WURPdVQ0Rlp1TGppT3Iw?=
 =?utf-8?B?cHFuZlFZOUpkQnZma0M5M0UvZDRnVWJ1RklGRTZHNitQYmVKcW9wZDkxWFpN?=
 =?utf-8?B?VUZYbnVDbnRWTFNyUkE5bklWODZBSklqNnhBcmxDYytRNmpxN1FoaExoSzdy?=
 =?utf-8?B?ckNaYUhWa2JhdFA1ajA4R3ltSlJUOFlhVStXTnRKbHFydmNjOUc2VE1FOU40?=
 =?utf-8?B?RVdESW1pUmNKSTlSSFZUSzhiRWtXcG5NTm5JSzRLcXpiZURIWFpIcDIxNmw5?=
 =?utf-8?B?UkNCMlo2MG1tT21OYlAxZlNRTU9iV2k2bmlkNS9mSjdLaGhZTzRhWDF4S3dX?=
 =?utf-8?B?L3RFd0Rnems3TmhuZzYxbjVjb2ZPRElGc3d2U0daeFhUREsrUVQ0R3cwZ0hh?=
 =?utf-8?B?RFZCa2hrUFZ2YVlpRmQxa3EyeXV4U2N3S2tQRHorcTgydjdCdnNPV1BtOWhn?=
 =?utf-8?B?aG9FZWI5UlNHVW1VZzJtbzEvN3k3T1QwUU5PeGl4TVVmS2hWWnlkMnVFS2p5?=
 =?utf-8?B?NHN0dTBlOE1lL0xKVnhrUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UllFL3VUVmlTeWIvSHE3cE5lNFFKalV2dGVYM25Tb3FUUlUvcGZuTE1jNFRo?=
 =?utf-8?B?Y25md3Z6dFdKNEhuRUx6U2t6eU42YUUzSUdXckdZRGtQMUc5Sjg0cGhvUjBP?=
 =?utf-8?B?OTdqT0l2TFFRRWpTaUQzZjBFTEhmUGtCc2JIREkyNENKUWVkTEhvZm5QK2NE?=
 =?utf-8?B?RWRuSWxGNkFGRlNhaTJFYTUvRjhWN2RId2RYdmdxWDhLY1RCZ2RMR1FnV1hY?=
 =?utf-8?B?YUcycGdDdHNJbWd4RHFiTG5TRGYyajRXVlBvR01La3lPa1pVOXFmdmw0WUY1?=
 =?utf-8?B?MU9CRDdKSFNsemdBUWpCcjJ3ZGp3NnpJVCtVOXZvQ0VLMDY1dkEvZnRnZDdZ?=
 =?utf-8?B?S2dhSlB4RHV2Q1hOMEhCdHJjNW1BY0pNTjZlNFdLUlMxdEZhOWdKS2VPYlZu?=
 =?utf-8?B?c2wwNmU1b2JiWXhRNjd1MVZWNG4wNUlmOGZaZFNMNHZwVS9lTWNPS0lnUDJK?=
 =?utf-8?B?Z2RmQTdVM0VxUmpzN1ZZZENQZnNHSGFoQksrK2IwUEpaRmtyZmM2ZmhWTkg0?=
 =?utf-8?B?bnZtVGU2YWJUQkhHV0dia2N0WFFtNW1kSWh5NTNxZGgrZ0ZpS2RMVE1XYXAx?=
 =?utf-8?B?VmJNWTFudzMrVFBUYVY5cW0zTDdTeXBRS2dIUXhWOXVDWHJUUENHVlF3OCs5?=
 =?utf-8?B?MHEvZDBUYWxRSjVjNFJCWnhmbDdVeVpaTUFUVnVZUkE3eitBdlVCd3d5YXNH?=
 =?utf-8?B?TklraTdRVlJONkRCQlUzSmZqODZWdDhGaGl4QXQ0WFdxaVd0aWVtK0RqazZj?=
 =?utf-8?B?Q3huRW9qbmpjbWROTDErM090b3F4Wmt6TzFkS0p0V250bjJ2VWZ2ZmZ4SXQ0?=
 =?utf-8?B?OCtRRDRISGVqZ0M5ZXFXVmlpMjBQWVUreExRRHozSHlqdnBubThTWUx0dVo5?=
 =?utf-8?B?SkkrOHgybnBsWFdWNVVDWjlYUkFBMGQrQm8yd0ZFQkdpaVFOSnNvbGpBQ1NW?=
 =?utf-8?B?a2xBUGpTSjNQMmcrbW0wc0RxWUIyUVpzMmJ0eHUvYldodW56b2J0ZUZIMFJK?=
 =?utf-8?B?QXRLajB2eE5xM2ZtZnc2WVhOTVpMY2VQMzlYT05PTmJkOEd1dmtWLzdJK2pF?=
 =?utf-8?B?eFRFRXFFeWJXdkRyeVBiMXlaQkxtRGoxcjJJRWY2T3pabkxzSW9tWU5zeVp0?=
 =?utf-8?B?TldxTXQ1QWEzbG85amZhUE5ITzhCTnZFeUM2ZGg0STdhSFVBUS91Q1Ntd01D?=
 =?utf-8?B?RVJTMk5VWkFYUTFEakNhcVlEYjJoTXpINXdsVGJielZocVJITkNDS0tFTE52?=
 =?utf-8?B?blpGdWUyRlhkR2N2eWhDZlFXQ1c4VER2UkZCZWRsWWJQWkxnc0EvMGtkcjB5?=
 =?utf-8?B?YVZaeWRGZHd2SVNpcW45OTFwQXpMUDVBSXo2YnlFZ2FFN1hmSUoxODNDV2xT?=
 =?utf-8?B?N0NxMElTbGhaM1dlM0ZYR1hoblFJOVpFTUd2SlIreTJzc1g2WnNCdUVQcURE?=
 =?utf-8?B?WHJuVGYwaVVIaG5TbitKQ0FBNTFEamd6YU1QUkNxUCtxZEhUdVVhbThSSVBP?=
 =?utf-8?B?U1J3K05KeUR3UHA2blVuMGt2V1o3SHBtZUI2NjRib3JxUFpzK2ZUQTcyN0t5?=
 =?utf-8?B?WW9Ua29RbVlyampMRG5Id3JXYmlRQUZuc3pHQ0k5UUE5ck1CYmx5SXRsSmNq?=
 =?utf-8?B?cDJVM0VHNmRCVXhPMzdhYWVkdnFHOUxwcWt5RTdZdUhPL3BZcUpib1NKKzBq?=
 =?utf-8?B?dzNZL1hZUTlYQkZOcEFiUk9HclNKalNlVkdQR3lDYVpnczhTMWV0a1FaZDU5?=
 =?utf-8?B?Ymo1aU43TU1VR21PUlkwbFU1VC9yUSttOUNIUm9qcmN1dkdCK1U3VnUxdlZh?=
 =?utf-8?B?djVxd2J4UkRKK3E3aXcvQ0lSYngwUHJsclBKWURNS2pNODdLa3JwQk9qWUls?=
 =?utf-8?B?WXNlWmJ0ZCs0cVBMcTlONmczbWtTZVllUkdpK1NKV2RHM2NJRVpUWHk2aVYx?=
 =?utf-8?B?cjVKb2FLZGpOcTh4V0RYMkFIdFExZCtzc1h1UElVbEMzdVFFMTdkN2hYQXIx?=
 =?utf-8?B?N3d0NXNTRmt1ZGVEZVk4a0xrUm0rMDdZYjdmY0lPOUR0cDJJWUF1L05qRHVa?=
 =?utf-8?B?bnhVMk1rNVBobVltWnZaS2JFZ3FrcVZKRTR6Z3J2YjhTdkVibGsrSHN1SXNz?=
 =?utf-8?B?MDVFR0JMbk0rNlRVVlJWNFplK004L1RuZG9uaWxVbFNBaHNMV0Z3RGZ4UUpn?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4678307-772d-45e8-8fb4-08dcc88a9ff5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 00:28:09.5597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WPVFE4lX1X1ARSEE41MHRHJviWWxXzqPASkTrNjmSnM/Wf18jcKqbL2gHJkrk+oeBSwRoYKiOGevygurkpTF3/4v/6Wt2S9MGh6glg6J/04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7797
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


On 8/28/2024 12:13 PM, Rodrigo Vivi wrote:
> On Tue, Aug 27, 2024 at 09:41:05AM -0700, Vinay Belgaumkar wrote:
>> This patch adds the necessary framework for a timer. Code
>> is ported over from the i915 driver. This will be used
>> for frequency related events. Instead of having a fixed
>> sampling frequency, it now provides a modparam so user is
>> able to change the sampling frequency if needed.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@ntel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_module.c    |  5 ++
>>   drivers/gpu/drm/xe/xe_module.h    |  1 +
>>   drivers/gpu/drm/xe/xe_pmu.c       | 92 +++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu_types.h | 51 +++++++++++++++++
>>   4 files changed, 149 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index a95c771e7fac..e36c10c10af4 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -22,6 +22,7 @@ struct xe_modparam xe_modparam = {
>>   #ifdef CONFIG_PCI_IOV
>>   	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>>   #endif
>> +	.pmu_sampling_freq = 200,
>>   	.wedged_mode = 1,
>>   	/* the rest are 0 by default */
>>   };
>> @@ -61,6 +62,10 @@ MODULE_PARM_DESC(max_vfs,
>>   		 "(0 = no VFs [default]; N = allow up to N VFs)");
>>   #endif
>>   
>> +module_param_named_unsafe(pmu_sampling_freq, xe_modparam.pmu_sampling_freq, int, 0600);
>> +MODULE_PARM_DESC(wedged_mode,
> wrong param here.
ugh, will fix.
>
>> +		 "Module's default policy for the PMU sampling freq mode - 200=normal[default]");
> do we really need a module parameter? is it really neede to change the freq of sampling?
> could it be a debugfs?

I guess we could, but not sure if it will work on the fly. Start_timer 
can occur after a resume, so change may take effect, but no guarantee it 
will happen right away?

Thanks,

Vinay.

>
>> +
>>   module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
>>   MODULE_PARM_DESC(wedged_mode,
>>   		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> index 161a5e6f717f..b583579b0594 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -21,6 +21,7 @@ struct xe_modparam {
>>   #ifdef CONFIG_PCI_IOV
>>   	unsigned int max_vfs;
>>   #endif
>> +	unsigned int pmu_sampling_freq;
>>   	int wedged_mode;
>>   };
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index 33e7966f449c..7140bf795cae 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -13,11 +13,17 @@
>>   #include "xe_gt_clock.h"
>>   #include "xe_mmio.h"
>>   #include "xe_macros.h"
>> +#include "xe_module.h"
>>   #include "xe_pm.h"
>>   
>>   static cpumask_t xe_pmu_cpumask;
>>   static unsigned int xe_pmu_target_cpu = -1;
>>   
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +	return container_of(event->pmu, struct xe_pmu, base);
>> +}
>> +
>>   static unsigned int config_gt_id(const u64 config)
>>   {
>>   	return config >> __XE_PMU_GT_SHIFT;
>> @@ -28,6 +34,32 @@ static u64 config_counter(const u64 config)
>>   	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>   }
>>   
>> +static unsigned int other_bit(const u64 config)
>> +{
>> +	unsigned int val;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		/*
>> +		 * Events that do not require sampling, or tracking state
>> +		 * transitions between enabled and disabled can be ignored.
>> +		 */
>> +		return -1;
>> +	}
>> +
>> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
>> +}
>> +
>> +static unsigned int config_bit(const u64 config)
>> +{
>> +	return other_bit(config);
>> +}
>> +
>> +static unsigned int event_bit(struct perf_event *event)
>> +{
>> +	return config_bit(event->attr.config);
>> +}
>> +
>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>> @@ -132,8 +164,66 @@ static void xe_pmu_event_read(struct perf_event *event)
>>   	local64_add(new - prev, &event->count);
>>   }
>>   
>> +static bool pmu_needs_timer(struct xe_pmu *pmu)
>> +{
>> +	u32 enable;
>> +
>> +	/*
>> +	 * Only some counters need the sampling timer.
>> +	 *
>> +	 * We start with a bitmask of all currently enabled events.
>> +	 */
>> +	enable = pmu->enable;
>> +
>> +	/*
>> +	 * If some bits remain it means we need the sampling timer running.
>> +	 */
>> +	return enable;
>> +}
>> +
>> +static void __xe_pmu_maybe_start_timer(struct xe_pmu *pmu)
>> +{
>> +	const u64 freq = xe_modparam.pmu_sampling_freq;
>> +	u64 period = max_t(u64, 10000, NSEC_PER_SEC / freq);
>> +
>> +        if (!pmu->timer_enabled && pmu_needs_timer(pmu)) {
>> +		pmu->timer_enabled = true;
>> +		pmu->timer_last = ktime_get();
>> +		hrtimer_start_range_ns(&pmu->timer,
>> +				       ns_to_ktime(period), 0,
>> +				       HRTIMER_MODE_REL_PINNED);
>> +        }
>> +}
>> +
>>   static void xe_pmu_enable(struct perf_event *event)
>>   {
>> +	struct xe_pmu *pmu = event_to_pmu(event);
>> +	const unsigned int bit = event_bit(event);
>> +	unsigned long flags;
>> +
>> +	if (bit == -1)
>> +		goto update;
>> +
>> +	spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	/*
>> +	 * Update the bitmask of enabled events and increment
>> +	 * the event reference counter.
>> +	 */
>> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
>> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
>> +
>> +	pmu->enable |= BIT(bit);
>> +	pmu->enable_count[bit]++;
>> +
>> +	/*
>> +	 * Start the sampling timer if needed and not already enabled.
>> +	 */
>> +	__xe_pmu_maybe_start_timer(pmu);
>> +
>> +	spin_unlock_irqrestore(&pmu->lock, flags);
>> +update:
>>   	/*
>>   	 * Store the current counter value so we can report the correct delta
>>   	 * for all listeners. Even when the event was already enabled and has
>> @@ -462,6 +552,7 @@ static void xe_pmu_unregister(void *arg)
>>   	 */
>>   	pmu->closed = true;
>>   	synchronize_rcu();
>> +	hrtimer_cancel(&pmu->timer);
>>   
>>   	xe_pmu_unregister_cpuhp_state(pmu);
>>   
>> @@ -484,6 +575,7 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>   	int ret = -ENOMEM;
>>   
>>   	spin_lock_init(&pmu->lock);
>> +	hrtimer_init(&pmu->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>>   	pmu->cpuhp.cpu = -1;
>>   
>>   	pmu->name = kasprintf(GFP_KERNEL,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index ca0e7cbe2081..f718a5a2f44d 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -16,6 +16,22 @@ enum {
>>   
>>   #define XE_PMU_MAX_GT 2
>>   
>> +/*
>> + * Non-engine events that we need to track enabled-disabled transition and
>> + * current state.
>> + */
>> +enum xe_pmu_tracked_events {
>> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>> +};
>> +
>> +/*
>> + * How many different events we track in the global PMU mask.
>> + *
>> + * It is also used to know to needed number of event reference counters.
>> + */
>> +#define XE_PMU_MASK_BITS \
>> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
>> +
>>   struct xe_pmu {
>>   	/**
>>   	 * @cpuhp: Struct used for CPU hotplug handling.
>> @@ -58,6 +74,41 @@ struct xe_pmu {
>>   	 * @pmu_attr: Memory block holding device attributes.
>>   	 */
>>   	void *pmu_attr;
>> +
>> +	/**
>> +	 * @enable: Bitmask of specific enabled events.
>> +	 *
>> +	 * For some events we need to track their state and do some internal
>> +	 * house keeping.
>> +	 *
>> +	 * Each engine event sampler type and event listed in enum
>> +	 * i915_pmu_tracked_events gets a bit in this field.
>> +	 *
>> +	 * Low bits are engine samplers and other events continue from there.
>> +	 */
>> +	u32 enable;
>> +
>> +	/**
>> +	 * @timer_last:
>> +	 *
>> +	 * Timestmap of the previous timer invocation.
>> +	 */
>> +	ktime_t timer_last;
>> +
>> +	/**
>> +	 * @enable_count: Reference counts for the enabled events.
>> +	 *
>> +	 * Array indices are mapped in the same way as bits in the @enable field
>> +	 * and they are used to control sampling on/off when multiple clients
>> +	 * are using the PMU API.
>> +	 */
>> +	unsigned int enable_count[XE_PMU_MASK_BITS];
>> +	/**
>> +	 * @timer_enabled: Should the internal sampling timer be running.
>> +	 */
>> +	bool timer_enabled;
>> +
>> +	struct hrtimer timer;
>>   };
>>   
>>   #endif
>> -- 
>> 2.38.1
>>
