Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C900C021B2
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 01:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D44710EA0B;
	Fri, 21 Feb 2025 01:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4Cl8iBc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805F510EA0B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Feb 2025 01:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740101891; x=1771637891;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JmuPv0V76i0ykqPPRjSDb/Gndi+j7nLFVsyQTdu+NYg=;
 b=d4Cl8iBcEkw6KBN0GQgsbeu91UoIYYmJ8Qw9NVq5Gep9Dr2kWKsNNvV4
 H6BIeqxkSfmFpP0V82cYyFVY32XnS9U5unG6db3gUhLomZsfNF1Z+rN9p
 OhMtkuDv8LhvzwSQy/JNvYIzH7rMa8q6Jt1QLze4lxbNQFn/JBvEm9cZ1
 KrlfCywiKGq8LO1J9uy2HjadWc3WhcLwdQqDml0lLtb4fb5gzVim9rUus
 LJTXNaiyyEy5S7LFuxTF6CTA4QlNCtZ+ArDi1Wunfw+pZkhCHQSpmQ79h
 gh1G4hR8SOIWLvD1FV3Zq8uUGBu4gyC5NvyGHd63Jk5uiwTFq+ox6K9uZ w==;
X-CSE-ConnectionGUID: bHCKFwMbR1WDv45SzIUVzQ==
X-CSE-MsgGUID: aTpkwkqjTGC7i9DVGfcTqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41171478"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="41171478"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 17:38:11 -0800
X-CSE-ConnectionGUID: Ws5hog55RCCO1Zcat6ddwA==
X-CSE-MsgGUID: 4rXEIdZqSXWTAOh1ogBSnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115050645"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 17:38:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 17:38:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 20 Feb 2025 17:38:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 17:38:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEkYCNfEit9rCw4rISNy6E41CbrftjSxn7kyQN2CC2a3hUI/ZRJ1O7nkUOwD2DMYIWyoBnwOfsM9XQeFOH60oubUE6Ur6wASJX0l+KEV8LYoko6+pxNivR4q146e8yNJDaG8+RhEj/piVYdPL+wFRHGi7bpxZNHkNLBfpG6EYiF+J+hnNAW/B9W9zh2PECCRa499l+Qul85zvzbRgmKmgLZlIdMKzFsLSl+TJJWKdlYCsx9lw5p/AmkElfrNQFy59YSEKQDL0bGlDBImdGQKM3JX7iuxuEZv+Ymx25K+eE+Sul+gvWOdHMBCeOkktbWfy7qWdt2UQyIG0PyY4Z3KuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjOqsFp/NjB+UPrcCkeALrEJ0JAxOsiGBxwbcyfaFrg=;
 b=eqTZgZ1xQs1NQghNwMB/5KiEQFbIzA7oelsHmT74pcACVXFxEklXanb4tnJo/eR+J1v3oJQzFtwV80ZGVCj8X/Pvx3WXczuLLMtPDGmyFfe9e4R2qnMdCe3nGTt+R+9CySiEnv4b99SWF07UeTBAk+0KPjBLW0EBpjd0QaDouyDiQ8nCTKMy8ASGnNlDtBf3havnR8tIMBjV1140/stJvMmMX6wLtDKBHxMJF7rcJqW1+Hq+8UEwu+FH8R139JloQnFb9acRxCWdXLTTjG47Sdog7opVzGpSUvaVUsDKdElWjLqbu2QR8Ob/re7cAqbVgA4NxL9Je3vLuLodNTkRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Fri, 21 Feb
 2025 01:38:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 01:38:08 +0000
Date: Thu, 20 Feb 2025 17:38:06 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 drm/xe/oa: Ensure that polled read returns latest data
Message-ID: <Z7fY/pB8zqf4choa@orsosgc001>
References: <20250212010255.1423343-1-umesh.nerlige.ramappa@intel.com>
 <173934530071.1215186.173789869590573127@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173934530071.1215186.173789869590573127@b555e5b46a47>
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 6954581b-7d94-402e-9e33-08dd521864c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk0wdjU2T0cxZk5IZTF1VTR4cnovWmIzMFFXY3NwS0dpVm1yb2kwYTI0c2Rt?=
 =?utf-8?B?SGlmTGx6L3JkdDZLd3BkbGxBMlRHVjlZNXZudHI5L2l6QnFpaTMxSDVUQUZn?=
 =?utf-8?B?Mk9BK3YxcDdZYUlpcG5vVzRuemtzYmY4NUIvYVRkMUFEUWxqZ25lUEdwamJO?=
 =?utf-8?B?amt0RWVERGh6ek5OZnl0RmZEYzFFVm9abjBIcnFzbGlKR2xENmpBYkZHaFFY?=
 =?utf-8?B?aXBTMXgvM0xzWEx2cWhJQzRSNFVhQUJzeitKQ2p2QnljeXpHOGpYaGIxaXBU?=
 =?utf-8?B?MkJvWWZ4MmlMSHhFdzZjbDJVUENFUk1Zbk5BUlhiLzAwaXl0TU90MWY3Q1h1?=
 =?utf-8?B?elp3NHdBZ0ZiQnNoQk9TRzVBN0JnZTdCS29sOTEyTzdOMWRPSHBRUzdBRUxo?=
 =?utf-8?B?Y250QXFiVExlYTh3ekh3b1lYT2RRM3lxa1RYSG9EWWtocHl5Q21GbVFtanhT?=
 =?utf-8?B?UGdOL2NsUzF1T2xoWmpMT1ZxM1I2LzFwcVlVaUpEZFlFU0FxemdsUCs4TVd6?=
 =?utf-8?B?QTBLa2pwdG9mZ1FWUkVxakF3eEM4d0RGc3FHTDZlemF2aVhmcERsN3oyN0dy?=
 =?utf-8?B?WEVsWWRFMTR1RG9seTNyUUNtRE1TbHJCNFdvYm5mUGZjeEVOMUZFMC9reklO?=
 =?utf-8?B?SU1MZ0NtWHIyc1VPVHY5bnJzNWxHVVR0M3FTWGduajllUDlWMkR6SlAyQjM1?=
 =?utf-8?B?Um01ZEVxL05Lb2ovRlg4N1lVMWErRU5PbWNTaHF6Mm5iS3VycjlIUGN0eGlz?=
 =?utf-8?B?MDFhNHJGRXpONTA5MmtiYmN6UEJQamRoaXRZNytGSFJadnRjNkJHdlpoOVN6?=
 =?utf-8?B?bFY4VkxxbVdPb3ZoZmwzeVVXc1dCY0hFTlFzZVlmSW12ZHVTSGJPUVk1M2du?=
 =?utf-8?B?VmZzYS9vUEdpbk8xdnlVcW9NenlKTWFRaU9qWjAwRmEvSWdGa1owQy9sdGgz?=
 =?utf-8?B?VC9QS1ozekxubHkzWmdxNUVYMHdvNzlUNzNnb0dFRVo3Z0kwQXpRMWxScUdI?=
 =?utf-8?B?a2c2VXdlZjFycUYzaXJ5eUJwTVQ5WkRrSDVCRGdGRHB2STBIdWRzWW91M3Bi?=
 =?utf-8?B?b0FsYWdGK2ZvVEtySmRuaWVRK1ovOU5jUmQrdFFLZXVnb1U3cnEyeDBpT0tF?=
 =?utf-8?B?T3cwOENpWTBodFNuL3BDRS9XTVFqSUd6Q09ibDhJb0w4YmlCU0pCS0R6eGV6?=
 =?utf-8?B?aE4vOThVNTUyRENuOVJwR05ybTc3VnA3alBXemI1MnBSRWlQeHh6MWl4SVU0?=
 =?utf-8?B?Rnc4VEZuTkR6NTlVTDhYdm0xZEE4bDBWWGNUUm1idnpsMGdNUTJnRkNaNXdM?=
 =?utf-8?B?djNKRC8xYVZCb2xXa2N2dGpneWtNSzdPMVVVZnVKY1dEMmFnalZhdkljb0k5?=
 =?utf-8?B?RHNWK3pOUnN2bGRCOXRZRUVVUjhFTnFYa3ZtY2ltZTBPOHk5TnhpSCtJclRi?=
 =?utf-8?B?UkxTUWlCSW9JcmdIcjhtL2lHN1VvclRqZEc1RWZMUWh0aTl0UmdRZmtiK3RM?=
 =?utf-8?B?SHhoRWlFTmUzVW0vK2VVUGFSMTQrNmRWNzNwZ2Jld0Q0NTcybklwdFR2ZXpD?=
 =?utf-8?B?TFZPdU55UTVOMWIxVGZtM2ZqSFVpcjFsY3BuUUN2dktUa1doVURCT20wUXVD?=
 =?utf-8?B?VXJEaE5CQklNZDBjenZzZzByVFdyWUFBa3ZWekNFbTNEd3FGeml3N1FVYXpq?=
 =?utf-8?B?OVNoQVZ6TTBWRXM3aXpYQTh5amM4ZjVXQXFJYk1TRmIrRHI5eDlnOWFyS2dk?=
 =?utf-8?Q?Nxl+1sZjoFbQ6rPp5MNV0oNHy4/+fLU41ArM/zv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk5Kc2I2SWVHSURCTHFaT3Rhc09IaDI2TzliZGtkUEFISTcxSGFDdklDUTVP?=
 =?utf-8?B?WWRyNGV0U2ZlQmxUaW04YmVuS2FiZTRLQVk5NzgwcEE3d0tPMDFFdTBPSHZ2?=
 =?utf-8?B?NVJLK0pBUFBQWVRlM3BCTGxCdERYSGRCSnp4YnB1ak00WUZxS3RZa3E1T3No?=
 =?utf-8?B?Yys2RUF3Yno0dThLL2MrZk54SURvMHNwN1VIUW1SSFJ2QnlVUFpvbWZ4YUJD?=
 =?utf-8?B?aFp3bjFKdjBxcERrOVNGQUlYaXhoWTY4WmhZR2szNzBBZitPdUVtV243ZVJ3?=
 =?utf-8?B?bXR1bTJQTEpTNkMrVkxVT1hjeHlZSm9RdndtL0d5Wi8rTTBPUmUrcHRnYmZ0?=
 =?utf-8?B?ZHVXQzMzNVR5eGJrSFNBSnExTlRtR1ZvRlU5WkNKMGNSNDhxTXpJVzMrcGpC?=
 =?utf-8?B?M05MeUVtZkl1b01MYno1NWFEL2t4NTVFQ2RMelFXbFJHQi94U3lzOExIYkx4?=
 =?utf-8?B?WjVpYXUwdGpxRGJNNGMvZUI5Um9KQ2lxako0Ym5RKzJlYmpTN3g3bWFzeGZG?=
 =?utf-8?B?TllOMXlKSm5SVWZKdHNFSmRWSGJYNnljTXk0djlFbTNZRHhaeFNIUnZMTU14?=
 =?utf-8?B?V2FmNlYzaUp2TFZaRG1jQzBLYXZaNldIYWZacVl6NjJjV2huUEV2cHRKNFNT?=
 =?utf-8?B?YUFWanl2MGI3K3ZnZWUySnp6ZjNmSEJzS3V4Y1NnbmVNWXFTQTdCYlZYaXls?=
 =?utf-8?B?L3UxVFBZK2FhTUdnczZWSEJUeUFNb290MWF1dEttQ0FVZ3duSFVJTEZCdXp5?=
 =?utf-8?B?UDRmbU5KVTNtMjJ1Z1V3YmZKV2ZiSlIyWjlZaEljRUNxWnhNTnN4VVVvT3pl?=
 =?utf-8?B?WHQ5TVBDam14OWYxQUsrSmxPMkZPUmJWVU9UL3o0N1MyY2t4eDV0ZjRTclhD?=
 =?utf-8?B?YnpDTXlWRnNsOE4xNjN6alVsM2k5ZjMrcmRNTnJ2RjdtcXZvSit5QklhRkFr?=
 =?utf-8?B?a2MzbGErZGtJL0NrcTJpSFZ1OVNTMHg5UXJPRGxOdnRYZzZkYWZNYVBWMXZu?=
 =?utf-8?B?NGdyQ0xwSEhSU2FYZnJoRmRMdTZ3Rnhkb3ZGZVJOVDNmVlJ4NnE0Y28zdmxq?=
 =?utf-8?B?UXlIZU5vdkxmRmRtNS9ha08yK2VzT2pGV3ludzBsYWlQUVN6aWdvOHVNSVpq?=
 =?utf-8?B?ZHJzaWJ4RzRVMGFkRjNSWHVvNkUzdk1BdEY1NjhETjlIY0JLUUJGaTEwaVEy?=
 =?utf-8?B?allDU0trcHdLRkt0KzdhWUJGdnVXUThibmxhUjN5M29iSWxvbGt5RjIxQlRv?=
 =?utf-8?B?Tmk3eUZjaEQvV2l6QkVqcHZubXJHdmJLV2tOeGxDd1N4RERHajAvczRhcXpx?=
 =?utf-8?B?TG8vNzhJaDhYZnZsN2h1RjFSVyt0WUszdnN3WThQRVBiWjh0KzJJZnV5UU1v?=
 =?utf-8?B?NU93ZGhCN3I0UkxmaG0vZ0xkVTNBbEFyK3pQRDQreCsyNzg4UzBwYkM4K3k2?=
 =?utf-8?B?VjV3MGNOdGtzRkx2aHMrNjVRN1IzYk84QVk2YkJjMkVSU1ZyWjZsODhWc1c4?=
 =?utf-8?B?Qk5YZTNYM3I1U1JFbXRTbkJ6U3VFcVdETWJGbEJqd0szTzZBOWVBQ1YxQlk0?=
 =?utf-8?B?OGtaT2s0T2lqNkNacFB1WFlzMnZRM1JvZnBuNmR4WW5uMW5DS2FZd3pvbkJP?=
 =?utf-8?B?MHQzQUNtNUp6RUJnUE9MeFUvYXcwQk81RGcrb0E1U0kxemg0Z0IwNXFnRWFN?=
 =?utf-8?B?aU9PYUU0dGovUzB3RHdtSlFLT1NXdFB2VXNXbUoybyt3Ry9SZjZKNER0MXZh?=
 =?utf-8?B?bGZTSXFEWmJBdlF4SHg2clVQWmJJUVU3Nk5MUTVpTTJCWlBNVlJiVVlhWWl1?=
 =?utf-8?B?K0s1dEczZTJNYkVmTGFkcU9ZdWxqZ0JQZTB2cXQ4TVVzWUZTVHkyc09KZndu?=
 =?utf-8?B?TDRHOU5JN2tlb3VtMU1jb2RCd3RqWm9lSkc0V2VWOGNpOEEzaXhtVXNSWlZp?=
 =?utf-8?B?d1BLdHZHdGY1NUFRRzhyclhmQ01vL2JKU2gvbkxpc2ZSRy9POWx3aG9QTkJ0?=
 =?utf-8?B?TXN1YWVyM2pjYmlGenlpSmgxQmg1VHJFVlVuSkoyakI5ckRaU3dyWlkybnhG?=
 =?utf-8?B?TDUyMytlcm50T0xDTWVlRUZyQURoTW1ib1hwc1UzRGlLZEEvM1lXTmJTTDNr?=
 =?utf-8?B?R3h3M2RnVlMwWmxUS2FUbDI3SVVaRG9sTzExQy94cFZRelAwbFVaaDl6c1Jm?=
 =?utf-8?Q?t/8ftdmUBAxqi1w7UTiOXZg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6954581b-7d94-402e-9e33-08dd521864c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 01:38:08.0667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tj1lQYUPtr3R/aMpPjFfJ+YJDmmClk14VYpHtBrCh6v93r7GwAp00cZ3n7+asPXI6Nplr5fr6Eb4CLiPbIhy1EHxVa76VHqfG4LtVBmxyNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
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

On Wed, Feb 12, 2025 at 07:28:20AM +0000, Patchwork wrote:
>   Patch Details
>
> Series:  drm/xe/oa: Ensure that polled read returns latest data
> URL:     [1]https://patchwork.freedesktop.org/series/144684/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144684v1/index.html
>
>CI Bug Log - changes from xe-2642-76120b67a3d5e7a38cbc92fc39846297130fc6d0_full
>                             -> xe-pw-144684v1_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-144684v1_full absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144684v1_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 4)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-144684v1_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a2:
>
>          * shard-dg2-set2: NOTRUN -> [3]FAIL
>
>     * igt@kms_rmfb@rmfb-ioctl:
>
>          * shard-adlp: [4]PASS -> [5]DMESG-WARN +3 other tests dmesg-warn

The failures are unrelated since the patch touches only the OA path.

Umesh
>
>Known issues
>
