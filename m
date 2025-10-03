Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9600CCA471
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 14:26:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563410E125;
	Fri,  3 Oct 2025 14:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVExwWX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4878010E92A
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759501570; x=1791037570;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=otEPpuZ4xwolf0ih9vkERvD4vAdrHQaVYCBDRHbV0QI=;
 b=ZVExwWX6t+819HbBXO3welgHi136hj/SkTqD6FZIR24JU/sd2HUK2fY1
 /3rVdcHFFkuhK0aMkGT10wKwl+8bjxDjmPv1kPk3jV6jGSf2xrg7t+qbb
 5UvlSGIQMMZPG9Ky+V7513C6Lu3H1FOIcDLqOjavkOzElMSOei4nW19lM
 3QYRE1huT2d0zfo5aEP1D1nuYfUSUu9WvOTbtZcLPhwCDtaQWmShynC6m
 q1oBOrc8a6HWTEI2nsGbx2Il8ajvNE+cCzOuSx7You61UX1vRGbzathCQ
 ENWwZbaczKB2idXJe09SK5TrnPJo3hGhSCbbOX6aR6j68ET026r2iYajT Q==;
X-CSE-ConnectionGUID: VQo0Lk9ZSTid9mLIr4RuuA==
X-CSE-MsgGUID: whxFrmq4QrWJtkDBYjJTww==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="87240446"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="87240446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:26:10 -0700
X-CSE-ConnectionGUID: GT3XmmY0QOa3fMwRvuXg+g==
X-CSE-MsgGUID: 9A6f2XHWSW2XGE6VVgUNbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="179722037"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 07:26:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:26:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 07:26:09 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 07:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKlel4qYvdlhPDRCTIjkiQQfIciL2josqtrdUmY8UymZeWBuc7TvRF2y42j7SRQokhkt+z7/C6tid5IfQpzn+6T4hLrr+BiaZKGtPqHniWWYPyL2NixfLeuENL8PNhblS5S4QhiZByxKx25awG1cgkMVrK6nmytSyguMP9FjTF/CLTXovhDZDlH1m8Rc+Ie57xK30RKhXzlK3ICm7eQ012CT0Hbvi6wTHqSpi9N5G4G/MGQ5gG9ky/8ACLdhmtagIrGMQm3w6CzzynB9FI3c4tjC6Z4Fa7VsxH2uKQbqpv7ovHVVv1KvWYBG6IW/D4N8+u3I1ujejvCFBhBLd02EhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj7BQZApURrChpe69u0009WEDwKR1T4Ym58GH8Exj4k=;
 b=fW1VBXQOcgVrfZpi5QfGIj/Nt5Mg96190WGrCeb3Ac+TeY/qEKYKupvgkKaP/Z0jnx/i0xdxvjfC7tS+C5jVqdlhh0o/c3PUPPY12DZxm4k5uhjrM1QZvzDUkz2Tda/DtjJ0kSRi6TCvkpxxjnP2SgTVPU5iQLXEoD0dQWDqGvP2k5jVw/e0CP6AE7zWMsbTYT4ro3UaKc9JnMDr0zBgxstY5DKDHSr591f27KxJSUk8MniiIy51bD1uXXFrobnDvMRzEkeppwyqJMGJi+O+FPNaO4vgfvuPsfn4RM4NAUj/gB7Nu2r04+dysJGdU3KucRI9gbJ0bLgEFoZ27CPH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SJ2PR11MB8585.namprd11.prod.outlook.com (2603:10b6:a03:56b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 14:26:07 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Fri, 3 Oct 2025
 14:26:07 +0000
Message-ID: <ebf7e2db-b166-4a60-b80e-ae95f063142c@intel.com>
Date: Fri, 3 Oct 2025 16:26:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/34] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-21-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-21-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SJ2PR11MB8585:EE_
X-MS-Office365-Filtering-Correlation-Id: ca3e2d71-634f-4705-ce0e-08de0288ca63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1FJWVpmaGdXWXdmOWFpMUpSdjZPSysrRFF2QlIvdFoxYVVKYjMrbmJjblhy?=
 =?utf-8?B?aHoyeG5hdHVXQ1JDUUQxRmZ0V2J0QkUzLzNFSTVFQ0tiWjFFZGNpS2tBUm9l?=
 =?utf-8?B?alJsdzI4TllBVEZ0ZFlXU1J0cGIrQk9IUHlQSUFZY0g0WHNSeGY4ODNBRFpn?=
 =?utf-8?B?cENRWmJzWTNPT0h3NEpyT0JyS0locVRvc0t3T1Q5Ymt6elFKL3J2Tit5cG9x?=
 =?utf-8?B?S0txa1FJWU82a1hzODVNLy8rMmdaWnRsNWJhMHNLZ1F5azlIZ1VRa3AvRHhS?=
 =?utf-8?B?Sm1vcWdkVUlrdUFvbk9CRVlmd1REaEpnUHM1R3psbjVpNWU2Z0piSk54WVZR?=
 =?utf-8?B?bHgyL2N2OGtmU3ZNRUFKNWNhYXo5dTMwSERDS1hqMUZZVWQ3NUZSeUVxajUw?=
 =?utf-8?B?TGNKNEEzeldueXVwM1JJNUpjdVA0T01UZEIreG9mWFBlTysvUFBnQzJaalYv?=
 =?utf-8?B?ZnNNdHd1bXMxdzFtQmdRMGtnZFdNNmFtOWJTK0RoTGNPUk9GTHAwZnZuNTY1?=
 =?utf-8?B?bE1IMzg4Vi9MVm9JclVUYjJ5cVQ4MVJvbGRvamg1ZWI2SWtDclNXNTZlcld2?=
 =?utf-8?B?V2xYZUZ2eUVwbFhPTDlKK1RETVloaEhENlhZbkNyUE1RT24rVTNvcEsvZGFD?=
 =?utf-8?B?Tkc5S3Vwb2RSL25vNGhsUXRIS3ZiMkhuekZHQkZGK0lLWUpVeURCQXFULzc0?=
 =?utf-8?B?OFhDKzFzREJCVFJaQU5Xak92VlJ3NUVrUGh5WGZyUkVyUmNFNjdnZzNMWmJ2?=
 =?utf-8?B?Rll1NnJWRjR3dVRmUTJNdDdNVlplNi8ydDVPZERUODNYc1o2Ym9GNmgyeW4r?=
 =?utf-8?B?OWN0VGZYMzByMk9kamhOamxYemdHQUszRFBpT00vdVdOQkdsU3BhWkNjVXZm?=
 =?utf-8?B?bWtDTGw2eGVPSjR5VFZzUDh5b2o4VElZZVd6TGZPSHhScWRrMVlYajZwS0g1?=
 =?utf-8?B?WmIray9HQVczN3phVGFtbkZTZkNBZnBIY3g4aGZtSmVTL3VMUVhMUG0vKzVH?=
 =?utf-8?B?WDF4UUYxUzk0ZEM0bnZ0SytPWGZ5bXJXZGs0djM3RDVXbU9yQkcvUGdMTUtv?=
 =?utf-8?B?T3R4NlZVcStWb2R2c0RUdEJ4MFdybytzZTRJdXpCV2VHN3hrbWw0MHNNcEpH?=
 =?utf-8?B?M2tNdnhST0ltTXBocGJOem1pdWwzdkhud1RNc2hzYWNvcDdUZjFFL0dwUzND?=
 =?utf-8?B?SFZYK1FzZHBMbmszQ0pYSUh1Z2JuYWVXMFRRQ054RlF1eDNZZnFTbmM3VjMv?=
 =?utf-8?B?NFZPS1VTT21UVUVkbEpLdityWXIyQko1czgxYnppUGNLNklDNW1VOHRRNnln?=
 =?utf-8?B?cnZtM3d3YnQwenNZSE11ekRVaW8zcXVvTSs5N0VNMkp0UE0rdzk2K3hLVVVx?=
 =?utf-8?B?K1Q4ZHZyWC9XYW9IY2hYWFBnMm43VEJEcklZZHppSVRjUnovNUNHbmpPU2s4?=
 =?utf-8?B?Vm9oVzZkWHE0UW1wQlVOKzZFdHZqUjJTTHNtWkNvKzdhNWpDU1p6SEZpT3Fo?=
 =?utf-8?B?ZEF4V2wrbjJpbDRKU3M3NnJVSExEaUZscml1WUpld243ZWtuVm10MVZ2Kzd5?=
 =?utf-8?B?NlM3ejlnU2ljL3VJTmY2d1VJTEg1Nk1aWVl6ellyZ0hjOWNDc2VubWdMdnhk?=
 =?utf-8?B?SkV2MnQ2YUJlMjZhZFZVNjgxQ2x5V0FRd2sxZWRyOG9XeXcxWllUV2RxOG5W?=
 =?utf-8?B?bkMyRWRhTithVjdWUlEzaHJQOVhpTThkalp0bVVhWjR3VkhFTTJ4TVFNcEt6?=
 =?utf-8?B?QTJtVVN3Y1Jsb2J6b293R0E2aGxHTFdkN2V0eGhLMkdkMTQwWWF0Y25UME5r?=
 =?utf-8?B?dTRmZmlHM0M3Q1JjN0FpUm45anJ5bkJjdFZBMnJXbUs0dTFpU2NDZ0F0M25n?=
 =?utf-8?B?bDRpS05iVzdnOFhBTk80Y0JLNjUvUjRTN1JleHVTazJUdHZRaS90bERaQm9k?=
 =?utf-8?Q?h7flSiUqB7n5DvD9N/mOX6WnBEFgNmvy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWdOVnordHhxY2xzYnZ1QzBmU0ZUWjFHNFNpQlRwN1R4YkNjSCtza0tJTytx?=
 =?utf-8?B?bTdwUGVtZ1JyVjlzbVdDdERMUnU0Tk1vNWpzcGZ0WXh5Tnk3RDYzdlZ2cUFN?=
 =?utf-8?B?WmxESnMvWWxmcXRzUVFwaW91ekdqK2FIU1VDZ1hhYmhSYWZ1cEIrOFJjZzFt?=
 =?utf-8?B?QWlwUWppdDdhUG04eGJ1UW5MalB5OFhONEJSV3dzc2tmdjM2eWszMHNtRTc4?=
 =?utf-8?B?VStIV1BlKzZDT0h3MC8rVWlmMWN3OXg5aG0vdUdlMGhNUDFoNnFTaXRPdksr?=
 =?utf-8?B?NFhsSWpLQnhJcERFalR2aXlVcXhmR3dTZWtzdnJMTVFvWDJwWk9aR1laUFYv?=
 =?utf-8?B?QW1GclRZZFlTVjBnbEdCTi9Ma283c2M5U28vUUgxU3puRE5tSkk4MERXRkl1?=
 =?utf-8?B?bkY3Rkpib2l1RW82RzJaMW1LamM0UExLa2RBM2h3aHlGTHVhUkpHd3VPZlA3?=
 =?utf-8?B?SHh4OUhaODVqMk01OGMwNTQ3b0ZaMVFKZlFBS0Z2bk9GazZYWVFHWFpPVSs5?=
 =?utf-8?B?eTRpNUhyRlBqQ2FRZG0yVDZtY2pSMERQUE02RzhrcElhbXlOSTdWMkVibm1a?=
 =?utf-8?B?ZjJTRlZqVUd1eVZzdFdmcTliL210QlEybFJnU0Flbm5jU1dlR1o1UmhiZysw?=
 =?utf-8?B?eUVWd0xHTmlNVkc2NjA1bmRaNVM4NzVOMEtvbFMxZWd0YlJaSmwvUHpROFVo?=
 =?utf-8?B?am9QRTB2c3BwS3UvdXFENnVXMXFHa3llclA1YjJYQ0RuZXVxNXcyQjdodTd6?=
 =?utf-8?B?VG9IazZWT2dmTFFlSkRqYk5BeWZaM0Q4SGpXYkFsamRkY0U2YkswNTBDbXQ3?=
 =?utf-8?B?cmh5L1llUFRGY3NkcEpoVFVTUzNvVXNEaFNleDhReUhtRitLbFdpS1AyeXU4?=
 =?utf-8?B?N2xlVFFkNFIxU1p3OXVVUTQrai9PdWdJTFlQYUJtanErYTRaNG9HdVlwQ3VP?=
 =?utf-8?B?NlVseXRDT2RVbEZhYWlNSktpOGJqUnFUclZJYTZrc1MxTjEvM1NNNkpnMTJ0?=
 =?utf-8?B?OTFSTEVxNjdVaTlNa0d2Nm9xR2lhV1dyOU8yUHFxaTdtOVpSV2xLUktiQVhG?=
 =?utf-8?B?SU96NVZPbkdnUDViYm5ta3ZaQXEwZWNjNmVrNlQrcDJSUXNkR2p6T2ZDZ3Uz?=
 =?utf-8?B?eU1vU0Y4blBHbUM3TzBSRGJibmpvUUk5NjYrV3BBVHVHQlNDLzFqdDRYY2tC?=
 =?utf-8?B?dXVZVjdqN2RCWE9jY2JSSlRlTGlqNjdqSmRoa1JhaGlENmM0VkkxZ2poWS9F?=
 =?utf-8?B?WFJzYWFXVFVKamx6WnhaWURibDZkeFpPdlhjdlMzckNzek9hTTZvM1g0ZU50?=
 =?utf-8?B?UkFPelU3Yk1pTmlqVktBUE8wUkJQNWRqNlR0cGI5Y2poM2c3NnRMMDdidVRj?=
 =?utf-8?B?c2VRTDlDeEw3TnZqNjE0SWJGZEI4bm5nS3pGdnQyUmdyZTliUlFLV1RMVEsv?=
 =?utf-8?B?SWNXUDRjbHByTU4xU20xeGNNWkN4NE9mOXlNdW10cnRQQXB1VU5YVVpLYm95?=
 =?utf-8?B?cUl3MGxNemdwRzRZSWYzSWY4dStmS3NGQXc2dUhlcUQyNHROVHNsdERlRXpU?=
 =?utf-8?B?eDRoVnQwVHhYSkRlM2NvN0Z6RHZ4TklOVGV3bmhVNXEzQnNIQTZzU09JUGg5?=
 =?utf-8?B?TmFUdmF0clBHbXdPWGRCTi9QSFN5WXFIaHFSMlNSZHB4VTUzU0xzVHkrNTkv?=
 =?utf-8?B?cTRoR2lVZVZ6OUZ4c3B4czZVMDY0clp3SitKWmJka0VadHgxMDZNMnFlN2l5?=
 =?utf-8?B?dFhhbWxtNXBacnNSSUEybngrNFlMRW14R3VkeEs1ME55aThOaHdnb3JXdEFh?=
 =?utf-8?B?RjAwSlJyV0UzcldkOXdlZzY0bDhzSkdlcnMwazRzWjZzQlArZUViamozT2Vm?=
 =?utf-8?B?REJDSGtwNCsyRC9sK0F3eDBlYlRhYTJkU1VYNWRpTEQ2ZWhIQ0E0MUI4MW5F?=
 =?utf-8?B?QjFWVVpqMUNXS0tsVjh5eXB2UnkzcnZvNDdwNS9VWkREYzl6Z2ZHUHIxQkov?=
 =?utf-8?B?cjczdkNxOXpDSGJSdHJMc0hqTzdEZnhYWldQNEdkdlBSNEVFRW5MSW8xMm13?=
 =?utf-8?B?Q25NZUNnZzV0ZVZCajJPZEVGSnUrb3hwZDBpZ3lVamo0aEhMdkhpby9vY3Qx?=
 =?utf-8?Q?io0jWroFoCgGEdyucacwmhEi6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca3e2d71-634f-4705-ce0e-08de0288ca63
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 14:26:07.0118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1yavJiszt6xSryGaBMVMe6TvVUjTcHFcuJfF97z5FGgalVeh93abvBJuI8cSKJOJbiemAg+mAu7L0DSYRJQPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8585
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


On 10/2/2025 7:53 AM, Matthew Brost wrote:
> The only case where the GuC submission backend cannot reason 100%
> correctly is when a GuC context is registered during VF post-migration
> recovery. In this scenario, it's possible that the GuC context register
> H2G is processed, but the immediately following schedule-enable H2G gets
> lost.
Shouldn't the solution then be to treat the schedule-enable H2G as 
separate state, and be able to revert to it?
>
> A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> simply drops the duplicate H2G. To keep things simple, use
> `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 32 ++++++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d0fde371fae3..d84de8544532 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -736,6 +736,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
>   	return seqno;
>   }
>   
> +#define MAKE_ACTION(type, __action)				\
> +({								\
> +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> +})
> +
> +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
Something is very wrong with that name. Context registration can't 
"safely fail".
> +{
> +	/*
> +	 * If we are VF resuming, we can't exactly track if a context
> +	 * registration has been completed in the GuC state machine, it is
> +	 * harmless to resend as it will just fail silently if
> +	 * GUC_HXG_TYPE_EVENT is used.
> +	 */
> +	return IS_SRIOV_VF(xe) &&
> +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);

Shouldn't we at the very least limit that to vf migration enabled?

Looks to me like we're completely ripping out context registration 
errors propagation. From the kalloc() fixup patches, I was under 
impression that error support and propagation is important for Xe. And 
here, we're willingly damaging it?

Can we really ignore them? If we really must, shouldn't we mimic GuC 
checks here on the KMD side, to at least decrease probability of problems?

This will cause possible error messages in GuC log, which do not 
indicate real errors. We're willingly sending a message which may result 
in an error.

Having error messages in GuC log which are considered normal flow on KMD 
side would have to be properly documented, to avoid people debugging 
non-existing issues. Best in several places.


I don't know about this, we're creating a bad situation by choice.

-Tomasz

> +}
> +
>   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
>   
>   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> @@ -807,18 +827,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
>   		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
>   	if (want_response) {
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
>   	} else {
>   		fast_req_track(ct, ct_fence_value,
>   			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
>   
> -		cmd[1] =
> -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
>   	}
>   
>   	/* H2G header in cmd[1] replaces action[0] so: */
