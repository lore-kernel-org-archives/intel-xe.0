Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A043AD2A53E
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 18:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D80210E181;
	Wed, 16 Oct 2024 18:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jp1iTaxA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF6D10E181
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 18:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729104920; x=1760640920;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mIOjsz25mtYf/NVbp+L0M8lcxibxgPHmIVpTeLP+c/c=;
 b=Jp1iTaxA8E0RjJsK6dsoFFKsRzoYA6VSF1mKdxtFCJO9F7TqI5IkEeE9
 ffJpsg/Q9G1WOhK62AGHXBmS43BNnJtzBleBq6NZOvr1wvtsLdIJf5iud
 RwcZul4U/TLLy1mdbP9DmlO9sV9y+4DdLfveEGFn5ZP//crsuAKY5hdfy
 zktc7bFi5A4W0VgNMvND2iBK2KR2ArGrtl/fKL2wsnIKd9WsscrFBs0ig
 U7wcha8RNWDUf5ghOd+cU2uFsuQzFXcpG/R09/qfeRKJsrxrr43o5JOnz
 2D/KwFWPNtCE9dAn5KnBS2615suuwCrSgl1yShet9UvM4d+S0TxfCQT1N w==;
X-CSE-ConnectionGUID: PaA97Y6hSra9+2he+KVccA==
X-CSE-MsgGUID: Xjuc7z+bQiy1scpRXO7Hxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39690419"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39690419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 11:55:19 -0700
X-CSE-ConnectionGUID: PtITMBnJS5CziV3YhRr07Q==
X-CSE-MsgGUID: GxdNQrwSRVeVTkFLivijIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="82852770"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 11:55:19 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 11:55:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 11:55:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 11:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PI0CuaBsw/XJ4uxrvpqboTo0aoH+jpwqZLiZZ8g0tmdqSde8zlqEZrcAJC2y4l316oDx8sesXuvOYr5BhGQzoZ3PxMiM3U5LQ4QDL1Oj3l81WF5mOpwEvUAjO06ThYQvNMckziDCuIZ0Ox3apgO/ykCW0rFEMI31i2f80fW0rq1Hz8/IVpMGJmzs1b9JfgY6C2Sz6Pwmw7jb1ljakqGJTX91aQfintKMBYWmyekT3Zlp9qp+0noYYy2Bj/BZaipA3fplos3pa5hhAZbPp73wr90pvUvxKa4ZJzoufu5llBPq4VDhIBaSV2U/QFmL676eQsAYTwqsP7FF/yAvnpm1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/1ZHtnFMzE7alcO51GKejBVaLjWvywi+RouBDmhgpA=;
 b=izIiVXQgPBWLBKeNuJwAndXi+rssJpr1QA2Dvsq6FysisjPHKf6G1fByKxexCHIGpofVdnCYISN4cn3uIlOQ4QGTViL1A1ROOlw3HvM/ZIlX64pGcQyqwT1Li29k+aQHtHtVpuf5IR8nbfGBkqDONGJ4qANx5u6ka3ISwYJAbmib9sqzAn8A+UMEx2HbIj+EaQAMLlfy4A8iB7tIlq4FCDb8o1mhs/vloJPV/tg/GnswMTG66BBeOILLqi7CzPx83sx6Vpxhv8BFg9IRqXpMppwssWt9fBoSopZFPGw6naeasV0p6CAVOYYhBW+yH4ijp9M8ECMV+LFPuIQNwxzXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB8362.namprd11.prod.outlook.com (2603:10b6:610:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 18:55:16 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%3]) with mapi id 15.20.8048.017; Wed, 16 Oct 2024
 18:55:16 +0000
Message-ID: <8cc4c4cd-c3d4-4b40-9fce-1284e9b4df96@intel.com>
Date: Wed, 16 Oct 2024 11:55:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
From: John Harrison <john.c.harrison@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>
References: <20241016115256.349791-1-badal.nilawar@intel.com>
 <20241016115256.349791-3-badal.nilawar@intel.com>
 <a6870973-20ab-4eff-a0d2-34dec13e52e0@intel.com>
Content-Language: en-GB
In-Reply-To: <a6870973-20ab-4eff-a0d2-34dec13e52e0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0133.namprd04.prod.outlook.com
 (2603:10b6:303:84::18) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: e02d4db2-0c48-4dd3-4163-08dcee1412a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3l0S0o2ZHVqeVE4MlZkTFpyUjN5UlZoTUliQlNDSERZTGUzOHhhaUZ4MDIr?=
 =?utf-8?B?WE4rTmN2cWxuZkZOTndFbk9uOU9yRTM1UHpFbW5jaStMMjEwNkdLQVh3U0xt?=
 =?utf-8?B?Y0pHL0syZDJHTm01WFNiTllMLzY5QlM1Rk5ZbGZkbVdvZGdKNGxhRXBJNTM0?=
 =?utf-8?B?T0tqMDI3MTRTOHZweXJCampQM3E1NEM1eStMVml6RWFHbjlmNnQyaFJCelZB?=
 =?utf-8?B?c2hXV0wvODdRMXNrVnQzNFZzZ3dhUVJ0R2xtb045Uy80R2Y3WXRQekNlL3l2?=
 =?utf-8?B?ZDNYcGpoSHdmQ0I5b25WZjFYUk9kOFp0RkM3ZHMzbzhKVHRtK2F2Q0dnam9t?=
 =?utf-8?B?S3RJVFhVdXovZTE4WnpuMC9PN2xmTHdkeUtOaTdPNzVLNTczQWFpNEZnMFRL?=
 =?utf-8?B?dXNaY01OaXdPQy9sTDhGRDhwWWl6MWxVSSs3Zmg3RWpiMW9sZmJVeURjZUFM?=
 =?utf-8?B?WFI2OFFFR2tramhPbi8wRDYwVkZrUlErSnUwRW41YTBrZmdQc2JMOGlTelNC?=
 =?utf-8?B?MllmeWlsVUswZ2c3Y0dMcGQ1Z3VyNlcveHF1TlhxY0oyZkZ3UDF2bFkzVXM3?=
 =?utf-8?B?RFZwODdueXVDMGRtMGg3VTA3eThPajNRTGZZUm42aXZQUVI5Vm4vZk1MRk5q?=
 =?utf-8?B?MnNjN0RXYVZySG90b0JCbHp0UmNadzVMSW9ndkhmdFRzeHhFQkRmN0ZvN0xQ?=
 =?utf-8?B?RGFBOExxVEdSSlNyTUZTRk1DUUZmZ0pTREd5UkkvalhkTVlpUWVJTTJiWVZo?=
 =?utf-8?B?WnRqQUVhNXJ2bDJibG5kOWpzWHlCZC9yOUpJZGVqd0xGQmRHUUk5UDZiUXpu?=
 =?utf-8?B?dERKdi9rTzhobjlRRlF5bE02N21nNU80blZMMHl0TE9pSkZ0QXVTc1Jic29j?=
 =?utf-8?B?QzV3Yi9waHIzTmsvQ3padWlHVWM2UGdWZ1hLcm9haERyd3dSWHZMaFZCN1hL?=
 =?utf-8?B?TnhQUnpYQWlENjJybHpaUWJQZHRtTDhXWWxySXlmYklSeVlPU0RlZjZFdnEz?=
 =?utf-8?B?YW92OTZRVXZqR1hZMkx5cEU4WUVkN0JtZmdwaCtNWjBRMmRnZ0hqN3pzZS9x?=
 =?utf-8?B?a3NrS3NuNTdmVWRJZDRkMXRQeGFZeDZKMWlmQXdHaDk4M0NpcmRMM1ZodDll?=
 =?utf-8?B?ZWUzU0tuVE1ZUjQvS2dCdTZWZjVYVHViRW5RQklmYmRnVHdFSXZyODh1VmVs?=
 =?utf-8?B?cWtNazZId2FBWldibGZUVnJ1bFBGaXhzR0hiV3p5MzJQM2JLYWJia3FkWWxr?=
 =?utf-8?B?QkdvTzAxTzQyRW1OU2lyZzlNMW9YRDJ2eXhqME9taEl5elBHdmJWUlBpYk5H?=
 =?utf-8?B?WXF5UVpWUjF1dWhodWJ4dUV2bE1IOHBFeTJuTUwrL0VTYzNCKzd6MEN5OFlX?=
 =?utf-8?B?NmxRclV6dW4ySm9VT255bFQzc045YWxFTmZaN2FyVEFOSWFJU2s4VVpORWtE?=
 =?utf-8?B?NXUrOGRNUEZ5QzB0MTBsL3ZnUzg5Vlo3bEZwVmFLbm8xU01EZG9XdnYwSGFr?=
 =?utf-8?B?RlA2SGFEVmhWVnhnZWJTTktERU9GbXpaNHJWNzJvT1FNUFkrWE92b2dXRFVu?=
 =?utf-8?B?RktqMFBZV1lCMHlXa1FENkxiT2pRampCQXhqcVdxL05OT3ZOWHBXLy9Vd2FJ?=
 =?utf-8?Q?NJ6uuUz4OWOlQmfV3x223VYgVzZ/qfYFFet3dNCx0rGc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZS9USnQwWUVpajJEQWUrblhGQ2JRU0dMcU1OL29rTWhCTjJDMjQ2OUh0bnlp?=
 =?utf-8?B?ejhjTE8yQlJRSnRvNjJTS2ZmbmpNejhralk1dUdoNVlIY2x5L3ZaZ0g4amlr?=
 =?utf-8?B?OXN6a2Y1TGFoVjJ2SDBjdllNOGlQanVtMjdFQ1NnQmxyM2JIQjRxenRCNmpJ?=
 =?utf-8?B?TUdoZXgyRGd3WkEvNEJ4M3U5RHhjbUV6QTFvdDUxam9yZzJHZzNDNThaL3hD?=
 =?utf-8?B?RGQvOXJqdzFmOSsxeUFYcmNLWk5IN0RxT1VLSlBadkw2c1VWUXg1aThsVUdB?=
 =?utf-8?B?OFZteWg5RlBENDNWVkZSU0JSV2txNHBCenFNSW1TdHhpN1paaXVURFNZSHhx?=
 =?utf-8?B?UlE3L0VOczdWSUNnNEh6YU9uWDB0UTJtN2JIUjFJZ2lVSFd0WVZZMjY5cmZJ?=
 =?utf-8?B?T3JFSTkrbHhMcjA1T1J3a3d5Qk1XSTBlSURVU2JnT3lldkxVaFVTanBiSWZK?=
 =?utf-8?B?Y3FCQmc2SDFvcXhPMTdXUTFDVVpITFVIbkV0S1dwOHR0L3pMNmxibmRLQ1R3?=
 =?utf-8?B?eXFyOVVSQ21yUyt5RmJRRmFFL1FJbVlVa2FQZXZ3a0dtNlRQdjQrRDBWY3JO?=
 =?utf-8?B?ZVNTUzRraHd1bVpmUTYwcE93d2FCcXJJK2tpTXcyeFJHVmJ5c1puU0lJQURx?=
 =?utf-8?B?RlZ6eWpJN2dHdmVrU0M5QmxBeFlZMllta1JHNHJGK0s5dExTUlFsZTFkQUg0?=
 =?utf-8?B?cWZPZzIxcnhmNS9nTFpIWWpreUNRYlRQTmJNakdXVzI4YXhzV3YrdUJxTjRY?=
 =?utf-8?B?M0RkMmhjdFAwUDhqQWFZdVNQZ2RVamE1dG1tcTlVREpJUW50NnZ1RTBzdUpE?=
 =?utf-8?B?SlYxRXFoSGFaSmh4N2dvTS9VdUJvYTB2OTVqcUtqWEJzTTQrM2ZXUXhMVUpz?=
 =?utf-8?B?UTJhWFdmUlU3K2x4V3dtYjJRejhWMVQ1MXNKSjJ5cThjK2I2bktLd3g2M1Vm?=
 =?utf-8?B?Y2ZyY2JwQmdmU0NUWmNaNUNjNzg2clFaOXQxUnp4VHRpaDVsZC9jbzFaRWtt?=
 =?utf-8?B?WldnRnZaY1QwR0FrYUpRd1pLWDJicERNaFh4OW5zSEVZdWR5ZmFHbUFlaHNj?=
 =?utf-8?B?V3MxSldFYlZQSTBGa2JCdmJxQXhNeGIrZzl1amhPWkQyZlEwLzVpb050Ymp6?=
 =?utf-8?B?OW5yckxDOW5iYUtWVVQ1YkVjQlo1YlJhNndRQU0yWkpjTXZoL0c2RFpkS0l3?=
 =?utf-8?B?bzA0NXNJSDNZQnJEZkw5WUI2eTA3QnBhRHhkQUdTM3dTU2JQV0NEeHgvOWFD?=
 =?utf-8?B?bGp2em03amdITHVXTXBVaVJ0SFN1d3NqT1FjalYzeXNIOFpQYkxYWmU5cVpz?=
 =?utf-8?B?MFBWektNcFB3cTRhS29kNVJnYjczOVNLRTJ5TnFEYnJyUGRqV1lWT2xvQW1y?=
 =?utf-8?B?TWxuZXRSeU9ZY3NIdHQ3NUJYKzFzRWFWZUd3KzdyM2Z0M1ZEWldmR1VwWHlm?=
 =?utf-8?B?eGNTTmlRdUdxb2dYSDU5NEJoS0lzakZGVzBraTc2NXoxa21vaWJGNHB2Qnhs?=
 =?utf-8?B?OWVEMS9tVFJSOW9SUStkS05lMExVeCsxTmxBdTN4aUlRMVpvSTY4OWt5R1RH?=
 =?utf-8?B?ZEMxc25KTitiQm8zK1UwRUNSeXJCVnBQeWpmaW5tUFNOUndKZzc3NjlwaUNQ?=
 =?utf-8?B?OVpjMm1reTJxYVhZM0R6NHROMGhxR0cvRGRWeG1aY0krclNkdTNwUWhEdVdU?=
 =?utf-8?B?RG11YU1IUHUyUEY4ZE9iNVMxcU5JQWlWT0xxWXgvNW84a2pWTGxVdk9udGZ3?=
 =?utf-8?B?OUo3RkNPd2RHMEdqbXBqbHc3SEhHZFNWR1hkd1RIVXdZS25NeU1DM0R2MzVG?=
 =?utf-8?B?aEt4Z3Ntc2JPOWNaeGRzVytNVHV3bXFVRzRLSXNTSkJlcXlrM3RxNlhiNjda?=
 =?utf-8?B?N0tMclV1TktQY0Z2Zi9pZ3VENHRJUGJMWlRsbVpLa0VLRFpqOHFJQ0h3Z2JN?=
 =?utf-8?B?aEgvQlYwbFRWZ1BCbjBFU0tGZ241L1dwd3Z0RlE5cndJT2R5WXh3Q1ZXaXFQ?=
 =?utf-8?B?WUlUUlY4ektxalRGK1d5MkpUcjFoOFJmZjlPN0QwcDlYVzFIMkh4TnptdEwr?=
 =?utf-8?B?RVVtRGllSVROVGJTM2RKMTBHTXp2clNqNjRqWXRHYk1UVjFhdy9TOGhZUWxx?=
 =?utf-8?B?U0FQZGZHQ3dreVNIb3UvSHZsSHp4emNWUUM1YmZQdWh5a0ZNVVh3WmlkMkpM?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e02d4db2-0c48-4dd3-4163-08dcee1412a6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 18:55:16.0854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlFwNIZDz/WsbT6QMnmjQL0Y8EBEwNkK06v+ZM+l8bhqB0N4kmzlIkZOQ7YaP5Z5QqKevDq1TEnbON1U1c+KKZ8M+4YYm7IoPZipA+DP1p4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8362
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

On 10/16/2024 11:51, John Harrison wrote:
> On 10/16/2024 04:52, Badal Nilawar wrote:
>> In case if g2h worker doesn't get opportunity to within specified
>> timeout delay then flush the g2h worker explicitly.
>>
>> v2:
>>    - Describe change in comment and add TODO (Matt B/John H)
>>    - Add xe_gt_warn on fence done after G2H flush (John H)
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c 
>> b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 3096baa4c9f4..c4e06d6722f0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1028,6 +1028,21 @@ static int guc_ct_send_recv(struct xe_guc_ct 
>> *ct, const u32 *action, u32 len,
>>         ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ 
>> * 3);
>>   +    /*
>> +     * Explicitly flush g2h_worker if it hasn’t had the chance to 
>> run after being queued due
>> +     * to delays in workqueue scheduling.
>> +     *
>> +     * TODO: Drop this change once workqueue scheduling delay issue 
>> root caused and fixed.
>> +     */
>> +    if (!ret) {
>> +        flush_work(&ct->g2h_worker);
>> +        if (g2h_fence.done) {
>> +            xe_gt_warn(gt, "G2H fence %u, action %04x, done %s after 
>> G2H flush\n",
>> +                   g2h_fence.seqno, action[0], 
>> str_yes_no(g2h_fence.done));
>> +            ret = 1;
>> +        }
>> +    }
> Why bump the timeout and then do the flush? If the only issue is 
> believed to be the delayed worker thread then waiting longer before 
> doing the flush seems counter productive. You are just increasing the 
> time taken for no benefit. Flushing the worker thread should be all 
> that is required. If anything, we should be breaking the timeout up 
> into smaller chunks with a flush in each so that the completion 
> happens sooner not later.
>
> Also, there was a big discussion about resets on the previous revision 
> of the patch set. What happened with that? I'm not seeing anything 
> about connecting with the reset paths here?
>
> John.
>
PS: No point in printing a 'str_yes_no' for something that is the 
condition on which the entire string is being printed.

John.

>
>> +
>>       /*
>>        * Ensure we serialize with completion side to prevent UAF with 
>> fence going out of scope on
>>        * the stack, since we have no clue if it will fire after the 
>> timeout before we can erase
>

