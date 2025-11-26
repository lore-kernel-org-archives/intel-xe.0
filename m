Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A30AD10F57
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 14:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC5710E649;
	Wed, 26 Nov 2025 14:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hgA2S+9v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B010810E649
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 14:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764168429; x=1795704429;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TiMIhfA/qH8t0pkwnlFYgvvnyivviH3JogNDJfrvHSc=;
 b=hgA2S+9vi44jS8yVgljcU/kPz1HfbAn170gBTtk862tVCypzSDdD0ist
 YvAYrfeOldn3IOBmQw6IlqPTfNPTt9bXAUGOe7VNP/St3FqYJ1xOq3DIS
 CcBUSdxytyDRQOfzdDs3kHDCXx0i8ZYFU/tXZoAXnaMsnFQNYWUOlFWvB
 HnX2eWexMynQXKyt7imAOnyztHwMjr3e2LqnWfsgZTtVL8WE8bvFAZiYo
 UuQjxhY/6nX64knKHAkeKbx5IkVe97WW4th3Y5swwUbGbX1LbYhc0BJn2
 vFYrUmx7Y/vjAb9k4JSrthV33mQmakimQVSwzdDuJsaU1VBticWQLG9Nf w==;
X-CSE-ConnectionGUID: Zk/mtZsBRTeWPc1+7GgsRA==
X-CSE-MsgGUID: ZlSTZ3OGT4CyQIfHNwOGHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83816877"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="83816877"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:47:08 -0800
X-CSE-ConnectionGUID: b32r0VBrTDSpdfUhbTeRXQ==
X-CSE-MsgGUID: tg7DaHsMTrKhlkCPYdEpbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="193767995"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:47:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 06:47:07 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 06:47:07 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 06:47:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Za1eicGqWeH3I/9Aa0YRfC6xvekMdb/fC0fVyfKcHRBBikir4F2CuyUvScKYhtTtKNUoT4UL49irrF0rBchdldUl2r7L1MW/HmWzeOl3HvFywQOuD22JNR65k/7o8uZZFZRV0rVDli88sL9vP+N2jJB/oQoxyABeOqZbcHnesNwW6thF7Q4HdYNFuug9NFpkaG8f0/6+YUec/bwaskfqUCQ+MZOVKfPJKdA8lOAypFsW+yQ51WEM9VwxQ5GLl7yNnvSlhGhyiyya3BLttS2qw8VWfTawAPRbee5tD7eZDiWav5mRzI5xNDvoL6IDDr9O2yRRpnh+7kd8mS4zRaATeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gq9xl4XOGUedMD7YyBlmGsOzlvw9VmSDXKdykoVL4hA=;
 b=JKht+C0TE+B6b002V3AiX1UV6kbsmLhjmoUNNfTasZjOScRV8dixvgD0GHXxIU2WykGha2K7VyrxdFNURig3zCMpuGdOWkjeeCOwN4bJN9U/uBgjdkNYyrgwhxxgmB2A4Akdn3DWpGXsG1j5oXFZHO6DoJLM7LK3Y0d1Wr576JOMu7bYIeTzKHoZq2M2aoImb1CbkdB4LzejegOmO9po9ta3mM7t59fa2F8sFKCnPpK+Ad7jadX2aFV8a4rEKOaMqqGl4Po2ZOZvDoerWXTbyhDAwMxHfUwUQrXzjwyljageVV2gUpkzsWvRwCj62QvwgBc+hxReY9tjILPm0peP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:47:05 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 14:47:05 +0000
Message-ID: <1e82f705-e1f2-4d98-9646-8734f8d17c14@intel.com>
Date: Wed, 26 Nov 2025 20:16:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/remapper: Reprogram remapper index on PM
 resume events
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>
References: <20251117205315.1458477-6-umesh.nerlige.ramappa@intel.com>
 <20251117205315.1458477-10-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20251117205315.1458477-10-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c562cad-f54c-4ab0-161d-08de2cfaaa5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFlwV1VhcWNVbklFR1h1aFczVXZDa3JZR1I4OEdFL20yTE9sSTZlM2daRzZa?=
 =?utf-8?B?UDlJVkgxdGUwalh3LzAzVGdkZzdRcTg3ZVdoYTdqVy8vK1h2WkV0VFlNNk5u?=
 =?utf-8?B?bWsyekJMOFk2TGFnSTl6c28wZVN2cEhOMDdxMVpJc01GdFUwb21LcnNkMkE4?=
 =?utf-8?B?eWhyNGZYeVh5NjVQSFl2Yk5xWDNRRUhXK0NGWGRFT0JZSlpPZ0V5bnZiTDRJ?=
 =?utf-8?B?TkNUZExuZklRRHdhL2p6anVzMm1SeHJZRGpqYVpKMmpNYkg5V0VUZExvdzc4?=
 =?utf-8?B?VzZUaXdDNHByTWMwY1ZZRjlVNVNBbU5JZDRUTVNXaWtrUXpWMzRsZCtBQnRq?=
 =?utf-8?B?ZE85TmJaa1lxUXlLTUcrM0YwWXFlN29zNURMMndkRzAwNUVQT1d1Y2ZxTzNH?=
 =?utf-8?B?alNFSDBneThxTUxXS0FGU1ZlQ3JiYnVEVTNuMGZHZUd6T0FqSGVXdGNVQXR0?=
 =?utf-8?B?VWZzS21XKzBUdU5XOU1ibTAyRWxiN1c2NC9QTGpLejhialdtVVJXSWtpWUo1?=
 =?utf-8?B?Z0Jad2c3Uk9KSUdCQktLMFN1Qm5JMFBsaHp4ajhiaThuQTE3T0dJU2hucjkx?=
 =?utf-8?B?a1FkWFJyRXp5Y1YyVVNXWFRZREZaU1YzaXdDbjRuQkNoOXk3YkJIOXpiRXEr?=
 =?utf-8?B?VkdWRzQxalpra1lyMEpPaUEweDhjd2hDNjZzbG5xa2lkeFF1dEsrelg3RTJr?=
 =?utf-8?B?TG9QTEdTN1FBS3BPT3ZWVXQ4dG9KTUsxODdJcDFNWTQrTCtMZFhidk5PUmhF?=
 =?utf-8?B?VmVIb0pTM0Z2ekd4TzFWdDRqMnBCeEdkdnNsM1U1WDZER3EzUVJ1S05FclRX?=
 =?utf-8?B?V1NPQjNrNU0wZnQ0dGdPblFqNWZlYUFQN241OVlISW9sV2ErdXVzajRUV1k3?=
 =?utf-8?B?TGVaTzF1aGF2UDN3V2hPQk9iblROc3dzMkdoSGVrbytEeFdaakExYTJIS1lV?=
 =?utf-8?B?WEtOQUQ4dmpNd3BMem1hWldNSTlzWUhFY0dLWGZwWEFFd0JsRUZPWStLcWtK?=
 =?utf-8?B?Yy9PYVgzTWk5c0gyN1krZldnUWZNWjdlNkFnNkttTjZ3NnAzVGZCUjZyZ0xo?=
 =?utf-8?B?dkg2R0FhekJiU3lGbEIxQ25jMkpVeCtuaWZzUnFKb2txM0xKTFpSbEVNWEdJ?=
 =?utf-8?B?ZVhjamJKdXJ1OERaTThPY1c1dk8waW1RRDJOYTJxUTFoblNoVXBDSG1TNThm?=
 =?utf-8?B?ck9NZk1GOGhEYjRFMTN3NmtNOFFSV0Z2d0R4Z2Z6K1JkMk5KSnFqMElIZXBs?=
 =?utf-8?B?RnNwWXlBdkJSSkVhTkVGL0RwbU9hRlc0M01kTUpjMzRiV3BGbHpsRzcreUVN?=
 =?utf-8?B?UXNUcmtqbWxyRFlwRG9kVEZPa2x3V05PR0lnbG9sM3YvZXRkakZaaXdMQU5F?=
 =?utf-8?B?Q1llUFlYdnpEOUNJVVhKaDgwdmVFLzNWZFBBdjZua0ZLVG9rbkhuajJUL2JE?=
 =?utf-8?B?THpiTndmMFpCMGdnTGFnTU1oNHdVOHJ3M0lxWW0weGdqNzJpVmNXOGxQVGhP?=
 =?utf-8?B?VlAwdUpvSkdNOFMxVUJCYzgrUU9KaG16bGNTS1RaS1pwemQvSG5VcGdGcUlJ?=
 =?utf-8?B?Zkx2RU5STjdlMXoxbDZNc3M2WTVhaGoyOWlHYWZrQkIvM0Z6bmpoQU5xcXIy?=
 =?utf-8?B?bnREcEVyc1lEN3pXZVVIWXBUSUV1VUFTenk5Vkd5Z3pza2paaTltbTlCOFEw?=
 =?utf-8?B?b1UwZ3dqTzlLWklHODhIblhudlZibldOUXdGVTlVQ2dOQ0ZYTDYwVDZEOERz?=
 =?utf-8?B?WkRTNHJpOXJRZklNdzluZ0FGa1VMQjJhYnFwRlhPZE8rSHMxc0VQYStFdER0?=
 =?utf-8?B?MHNQNFRVeUorNDIxa0tkUzRlWmhsek44V1FibGlTWnBPMFlxZEtBSHE0eUta?=
 =?utf-8?B?eGJKcUl3bEh4d3kvUzczOVhoYkkrMmZoekFnME96WURlY3UveTMrVEJqZjlE?=
 =?utf-8?Q?4vmiUUiMaTdyspUWtFpYdqJoeWzwPRpq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkw2UG9Wc3pxMUl2UW82TWY0algwL01uWEtscEpPWE9LQnBURTBieG8xQ2xk?=
 =?utf-8?B?RTV1Ymx3czl2eFZRM21QTWt1SXlWdVl4WDNPMHdEcUJKblh0ek5EN0YzR3dC?=
 =?utf-8?B?RnA1SjZtWFZlWkpwRzNCZXozWUVZSjF5NnlJdzV1OVpUcXE3Z2VHcUZpSXNL?=
 =?utf-8?B?aFZRVXJBUUtVUmR2K0xtOXI5eTg3ZDMwTy9GTEdxV3NoREkzRlRLTUYzeGJI?=
 =?utf-8?B?TnAzU3BuU0hhRmpJSzJqWGszZHUzeTRYWTdINjhrY2FXUlZBY2VBeVpvZnp5?=
 =?utf-8?B?Mk1xYm4zL3NTQ21zVXB1clZ3dXRVUkZSNWZ6OTZvdWdzdElDRDlJNGVKN2sy?=
 =?utf-8?B?WDJveG5qcHNGRHZLb3RXTzNxYWtQQW44dmZuamM4Z3hEcjlVWnFYSWZLTGV5?=
 =?utf-8?B?NW9YZm1kRUxQQkp2Wk52QlkySStyeGdwb0lHVThTQ1ZYQ3NhS0hVWklwdnFv?=
 =?utf-8?B?ZS9aK1V3TGsyOFRQS1BTOFk3WFduWGlic0Ezc0czRlJtZlU3NEc4NVR5NHJ0?=
 =?utf-8?B?MGtkMXVGRGtjRzZ4SjJadS9maHdscWFRTkhBdCtxcG1qYVk5anVmVERyUnJn?=
 =?utf-8?B?WTlQcjRYclRSQXZmbHFYZ1gybFQ1bFhXWjFyVURhRmZPc2hSVmNSbXhWdFhu?=
 =?utf-8?B?KzZmS1FHQTIyQldCR050RWM0blZhN0gvaVFpMzBMY0t3NWdYOExFL1ZDK0Rt?=
 =?utf-8?B?dVBBUVN1R1ZwV2Y2WXZseTV1RGp2T01EanRjajhiNmxzcC9seDF3eEFFbjk1?=
 =?utf-8?B?bzVuWk1MNjRQdVhLbVVPKzM3VE01d2Z4VWZvc2lxYmZXb05KYTZZdi9DUzhB?=
 =?utf-8?B?NTIyWFdTWTA0L1pNYUVMQTNIdDJNZkxPcXpORXYxenFuaVZobFZja2xCbUho?=
 =?utf-8?B?SVgyZWVWNWVseFFROSt5NCt6eFZsc2dmd2VHeDJjTEVmRTVzZHJtdEVUNTZB?=
 =?utf-8?B?c1dlOWF3UExiV3BoQ3FMZStGTERaUk9Hc096Ny9qd0E5alVvQjlYT2dGNW9Z?=
 =?utf-8?B?cStkMkx6Ym9uSXJ2S1VDdTBqbWsvdVJJL1dvTEdML3BmeFN3K0ZQOEYxeU53?=
 =?utf-8?B?QnlEcklLSkoyNGV3Yk5HQ1Q2V1AvY0UwTjhuWDJnelA5WE5iWHZOb1JzRWQy?=
 =?utf-8?B?RVNib1ZVdkczREd0cDFsYTVkY2FQR0J3b3ZDcnRtS2tVQzdxbnBBZmZGdlBz?=
 =?utf-8?B?Qk5KWW5vWHRPZTNBSnI3U29qd25qT0FEVmJYREFBNzhSR2VxVEVTdk1sSWtr?=
 =?utf-8?B?RXZvZUd2ekFka1Zma3ppZjZXZnNOTVppb0k5b1pTRmZEaGg0SVdnbEd0cENF?=
 =?utf-8?B?R283K2d0eWNZMjh3ZUNlSXhFL1dOT3FCSThhMkNFQjlTa0JybitSWUpBN2VU?=
 =?utf-8?B?Zkd3bktjVC9EVjhhUU9mdXJmWE9Tbi92QWJXdDRBUlk2WWVXOExWVnh1NFJZ?=
 =?utf-8?B?Nk0xVmpIWGdXdys2L2FRYndTZnZkSU9WQzhHS0RBdFdYdTZXb1g0VG5ia3Rt?=
 =?utf-8?B?bUZzWWg2UWlXcDJHL1JNSUdCMWMzM2dsMVdGRkFSd1h2RWlZTVJ1cmRNZTlW?=
 =?utf-8?B?UktIZTJRYXo4NmU3VTY4TmQ2R2c2ZnNTU3UwWEZBNi80YUwyYUxlQ0NLRFV1?=
 =?utf-8?B?MDRoSkVya2dPdzdGSFpNRkdUZVdNdjhrVmZLRzk1WXVYOFdrRnQ5UWZ2NU1o?=
 =?utf-8?B?R2NqL0RmVXo0OVpTYXlZVXlFQ3dlMTFSY0lqVWpxOC8xZmg4U2t0aUpkMzBQ?=
 =?utf-8?B?anAzeElHNGgzdVErcEZDRUhwSmhselgzT1FmbU9oYzVub1dHb0xDVmFRWUZ3?=
 =?utf-8?B?bnhJSXlaVXIxVlk1OXZzTC85QVQzUFpUUHlrTlM1YWZSY0ZhdHN0RTU1TSto?=
 =?utf-8?B?dGFsSG5SNE4xMzcvU0tZY1lkOGdCblprbldpdDNRVWtxMXEyMlc3V003M3Rm?=
 =?utf-8?B?a1ZQcnpaa0JvclRlZXJDc2J0Q0R0eXdKRytVemdEVGZ3aWNGS1BtRFZYY05j?=
 =?utf-8?B?Z2FFOTVwTTRmeGVwWm9ER3MxUjhJZkY4RDNEcU4vb2owV3E3M0hVa3Mvd2Uz?=
 =?utf-8?B?STYzWUErRitYUXJPNCtqUW9Xd1NiSUIwSVJkNnprRXFUV3JzU2JpK1Y0c1R6?=
 =?utf-8?B?WGc1aU9vMDVkSWtsN1ZDVFRhUE15Vm9OQXpGeVZ1RDBCRzVheVBTN0NaZmVL?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c562cad-f54c-4ab0-161d-08de2cfaaa5b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:47:05.1001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SR3ENNODOqB0JORAXvO7uq+gZWJsHUeLAzerljsae8WRzRcLCmlxkiD/YkJL7B7Czpjrgf+4oyUbrXFPZaeyHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
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


On 18-11-2025 02:23, Umesh Nerlige Ramappa wrote:
> Device enters the D3 cold state during both runtime and system suspend,
> which requires reprogramming the SoC re-mapper index
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
>   drivers/gpu/drm/xe/xe_pm.c           |  5 +++++
>   drivers/gpu/drm/xe/xe_soc_remapper.c | 17 ++++++++++++++++-
>   drivers/gpu/drm/xe/xe_soc_remapper.h |  1 +
>   4 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index de23fff3262c..9875e3db4a1f 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -551,6 +551,12 @@ struct xe_device {
>   	struct {
>   		/* Serialize access to SoC Remapper's index registers */
>   		spinlock_t lock;
> +
> +		/* Last value of INDEX1 register */

Use prescribed kernel doc format, here and other places in the file.
/** @soc_remapper.state: Last value of INDEX1 register */

> +		u32 state;
> +
> +		/* A flag indicating state is initialized */
> +		bool state_initialized;

We can eliminate this flag by initializing state to an invalid value 
such as UINT_MAX, and then check this value before restoring the SoC 
remapper register in the resume function.

Thanks,
Badal

>   	} soc_remapper;
>   
>   	/**
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 44924512830f..8a1b440df4ce 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -24,6 +24,7 @@
>   #include "xe_late_bind_fw.h"
>   #include "xe_pcode.h"
>   #include "xe_pxp.h"
> +#include "xe_soc_remapper.h"
>   #include "xe_sriov_vf_ccs.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
> @@ -236,6 +237,8 @@ int xe_pm_resume(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Resuming device\n");
>   	trace_xe_pm_resume(xe, __builtin_return_address(0));
>   
> +	xe_soc_remapper_resume(xe);
> +
>   	for_each_gt(gt, xe, id)
>   		xe_gt_idle_disable_c6(gt);
>   
> @@ -633,6 +636,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_rpm_lockmap_acquire(xe);
>   
> +	xe_soc_remapper_resume(xe);
> +
>   	for_each_gt(gt, xe, id)
>   		xe_gt_idle_disable_c6(gt);
>   
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.c b/drivers/gpu/drm/xe/xe_soc_remapper.c
> index ed6b6c594e51..c425195f7152 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.c
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.c
> @@ -13,9 +13,12 @@ static void xe_soc_remapper_set_region(struct xe_device *xe, struct xe_reg reg,
>   				       u32 mask, u32 val)
>   {
>   	unsigned long flags;
> +	u32 old;
>   
>   	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
> -	xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
> +	old = xe_mmio_rmw32(xe_root_tile_mmio(xe), reg, mask, val);
> +	xe->soc_remapper.state = (old & ~mask) | val;
> +	xe->soc_remapper.state_initialized = true;
>   	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
>   }
>   
> @@ -31,6 +34,18 @@ void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index)
>   				   REG_FIELD_PREP(SG_REMAP_SYSCTRL_MASK, index));
>   }
>   
> +void xe_soc_remapper_resume(struct xe_device *xe)
> +{
> +	unsigned long flags;
> +
> +	if (!xe->soc_remapper.state_initialized)
> +		return;
> +
> +	spin_lock_irqsave(&xe->soc_remapper.lock, flags);
> +	xe_mmio_write32(xe_root_tile_mmio(xe), SG_REMAP_INDEX1, xe->soc_remapper.state);
> +	spin_unlock_irqrestore(&xe->soc_remapper.lock, flags);
> +}
> +
>   int xe_soc_remapper_init(struct xe_device *xe)
>   {
>   	spin_lock_init(&xe->soc_remapper.lock);
> diff --git a/drivers/gpu/drm/xe/xe_soc_remapper.h b/drivers/gpu/drm/xe/xe_soc_remapper.h
> index 289aa41c3408..507701c74f6f 100644
> --- a/drivers/gpu/drm/xe/xe_soc_remapper.h
> +++ b/drivers/gpu/drm/xe/xe_soc_remapper.h
> @@ -13,5 +13,6 @@
>   int xe_soc_remapper_init(struct xe_device *xe);
>   void xe_soc_remapper_set_telem_region(struct xe_device *xe, u32 index);
>   void xe_soc_remapper_set_sysctrl_region(struct xe_device *xe, u32 index);
> +void xe_soc_remapper_resume(struct xe_device *xe);
>   
>   #endif
