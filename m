Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3ABC3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 18:40:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5BF10EC95;
	Fri, 19 Jul 2024 18:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQVJp6fC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBF010EC95
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721414450; x=1752950450;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cYULYilF4ry1plTY25EwN2GEQmRvJbLQVx7MAQUlqVU=;
 b=lQVJp6fCayNWAHraiX8DhiCk/ZVbLSzvsJHWGCXX87VFhDwi3ZtIqtox
 DcDfbX7/LnxvwCTSKktfzURr7s3sQHDNL07vSkc8HB0CAFogRe3AMukJq
 UvxIWalbEd7pnGckOlkkDcFkU7l0wc9wsilZC2QU1dSrDMxvQq36VlYVo
 kYFVKf6JQMfQWnspzGR8CZZ9JttqzLka02xeGcvS0vUY01udjVTpDfRZG
 /yQj0t4VtEwWiPFoLtXgTnUTupIHen5yW1Jx2gMB+mKRjy5+Awg4yjmi4
 CBPJIxRinIOVSt3zKa5azw4vfzX32bGK2mNOsZMilBVH/6c0ngQo27C4n g==;
X-CSE-ConnectionGUID: l7lJWX+FRrmKh8ffaZxrTA==
X-CSE-MsgGUID: Mwnna9liQPigW9OFARHXgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30471496"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="30471496"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 11:40:50 -0700
X-CSE-ConnectionGUID: Nen4nYTeS0mUhcYXCa4/qA==
X-CSE-MsgGUID: D4i6FX3jTIOjE8cDVjJktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="56043481"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 11:40:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 11:40:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 11:40:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 11:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuAiZ0La3cenOQN8lywDxU5e9/ZXdVBkMbZPyDzbKmkMDSuOHVaZsq7ct+j+Vj0xBfz7D2RyNQ1RHyNpaFrrqNbyl6B8RdCFYnxlX9XxW8i2CzX4xZFx+S7S8PssjAIpKphoM3wjCB9l8BEYAFHzzvgNDvaHdm9Pklj8aLhOe3rNiVTt674+szEQwFYPkTEg55gcDoo9yqYpzsffhilrpI4bnf7r2YHmSXIUHJgLmmMLHIEk4NTKJHTYEI4vZZUXem7cSoC479/H7sTpanOMWXiLhbkrrZ5OoHWHKOzFgpenS+Ub8+bT316yeQWbHUKGtmtDTdAqo9Y5CRGTiW5hTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v517/1o7FLQ+azkXy2E/WvfoNDHOrolKTJJYkBfne1E=;
 b=Jpc8rnW9UPOcJmML4M7bJHtrBqZERWIHZ1PF8rBGI0GrPijxFVOKvkzFgc33dlWDACTeHmG+QYqqkvniWjrfUBl7scZT0CeMe1s75XeU7LC2zNwnbeBqGWacD7Vrozz1e1ihh8gsvnwXHKGVRUdojw0SZdCZ3OSceUrLgS7WpFctZf5B6JcR+gaM2gJgZsLdsRZvhK7TB7HltkZ5UMxtazp9fbIgKcneqVKXLt7kRerv0DDwKteCdbyCjOpgSrpxv6l0izrhfmFsTfPXcMGBWMADHPQVPaVCvNhuQlXqNEy74CxsSiQIgvBzYSwvZ4zsi4t0QxxftMww2miZwutacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 19 Jul
 2024 18:40:46 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 18:40:46 +0000
Date: Fri, 19 Jul 2024 11:40:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 0/4] Have xe_vm and xe_exec_queue take references to xef
Message-ID: <ZpqzJ+PwGi89quSe@orsosgc001>
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
 <ZpoSw8/LCzIydcsj@DUT025-TGLU.fm.intel.com>
 <65ibpaeheqwit3co3h2rywtnbh4a6gu2bdth4bbyecuwiqdlms@7bx63x4bis24>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <65ibpaeheqwit3co3h2rywtnbh4a6gu2bdth4bbyecuwiqdlms@7bx63x4bis24>
X-ClientProxiedBy: MW4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: 940718d5-cea2-444b-bb78-08dca8224d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2ovWEY3dUtjb2lzQTZINXNFNWMxQXhySkwrREJhN1I1SStiT2daTEE4dm0r?=
 =?utf-8?B?am0xd3UzakI5SHlYWFIzZGllcTl6VU1EbTNoYThCTWZkMG9GUFBpZ3VSRllx?=
 =?utf-8?B?Zkg5MkpBUkE4M1p0Y2pLT0s0Vll4bFlSRE84ajQra1RZZnhlOVNsZFNJdGg0?=
 =?utf-8?B?dmVLYWxxK01vWEVhSzFQSW9QWS9MTURQaTV4bXlJZG5zTHlCTXp5RlI4WWFG?=
 =?utf-8?B?Wk5OdjVobVQwTjhWbVNHaEU1eW1vdGd6MHBFQnRMakQ5L3hrbFRybzBFd28y?=
 =?utf-8?B?NHVUVzhZVWRFU1I1R2gvR1lqSm1ZWjlOdEZWMVVybEN4Y1JmNW9mTW0zbFNU?=
 =?utf-8?B?b1F1UGJmWnZ6WUJGdUVuRkJtVWJCaWZ5d2NhQlhDdWxiYWlSSkdxbEhueFN5?=
 =?utf-8?B?NnY1enZ5eWMrczJFWmJiT01CbHlyOTJnd2c2YW91dEVmN1pycWZjc2hmWHdu?=
 =?utf-8?B?WUswMW5rY2pvMEFqaHcvZHFpR2l1dHRLamlMMEZjR3JCUzBjS0k4bVVYY0FW?=
 =?utf-8?B?ZHgya2lNMDk2M2IzL3RZcURUSk1mdCtkMFkxb0h2NWwxM3VGMjIwR3VOUkZr?=
 =?utf-8?B?WG9OeGhNWlV1R21haWZIMGp2bXd6WWJXa0ZZTmQzaExXQzRlcFBGUWR3NG9r?=
 =?utf-8?B?QUFkYTVWT3h1bFdZaWVicXBpT2VmN3p4cHpod0VvZ3JQdVZ3djNHTlgvWVAx?=
 =?utf-8?B?ODFQUzVhNDByejJqZlFveHBhMTlTQkNwM3VUM3dRK2ZoSHF3b1B5aWlqWTR2?=
 =?utf-8?B?K3ltYWFFLzZnSVJUSEJoYlFVYWUzTFJia0MvcUU1QXN5WEk1UWdMeUlwN2NB?=
 =?utf-8?B?dzYySEg2OHlYVlJvcy9kZ2ZiUCtnU0tIM0x6dVFKWDR3aXpIc2NNYzVnZ1JC?=
 =?utf-8?B?eFVGMEE3T2dEUmM2RWhQR2hKeDE0SkVoRFFwcVNoUE9FRHBZdnEzWmZoY3BR?=
 =?utf-8?B?S0hPWHNEWVdKQVNDUy80dXV0cVI5ckhRMHpTSkhlRTFMalFRMTE3eHBwbm0r?=
 =?utf-8?B?akJtUlNtNndQSERidzBWd3IvaStQRHg4czM1RjhJNU1aM2JQeHFmUWptVnc5?=
 =?utf-8?B?QjVrcFQxOERMelQ1eFRUclJoSHV5OG5WRzRCYjNBU1YrZS9ZdXZsZUJlajg2?=
 =?utf-8?B?Y3RGZ0g3SDBPbTFabnJEU09sMjFIdUk0cmhjOWVNakFOSWVLTFV3SDBuUHIz?=
 =?utf-8?B?WUhqeVkvVytlMWFVY290aVM1OFhuVVRtVDBLTUUyYlhhNmxWOGJ6Z2VCenRU?=
 =?utf-8?B?OTRGR241MlBRR1hXNlZ3U3lDNEUvazlHeTZZQXdSaWpZaW8zWmd6emh0K2xo?=
 =?utf-8?B?SFpadXYwcyszQmVrT2VENlZQZWM4OXYvWTlCcXRnakxCRWkyRU1TM1dPc1BR?=
 =?utf-8?B?Vi91Y3A0T24yL01vc25sY3JuRFV2MnFFZDFPbWk4ZDMrYUVBV1N4bGxhb1ZO?=
 =?utf-8?B?cEI1Wm5RbzhGTkhmL244a2k0OE1vZHgzRGZsRXBBQVkvQVhjWnRZU0V4U2JU?=
 =?utf-8?B?dkc2UTBMUEJTdVZ3bUFVYS9PbjNtS3hhQ09RemdYaFZqQ1FaaGJqdCtQYjM2?=
 =?utf-8?B?N0ttRnVPWEJpaWxCNnlIK2dMSzRzOE1TdG5jWWtodHZsZEw3VjVHeU1yVXlN?=
 =?utf-8?B?N2l5dW04UnBsMVVjUXdnUXMvaWpTaHo1SjhPY2ZHV0RxazNkZWI5TzRoVnVn?=
 =?utf-8?B?dXRrR2lncCtjVVdKQ2tWYk50clJja1lxdzBYZ1hMNmY2UWwrZWZEMmlNRUgr?=
 =?utf-8?Q?n84byoQCK5i4LBDx2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEYvMVpVSkdvY29aNlZhSnZvemkxOHFCT3Q1OGtaNmxDRytoakEvWFZ4SHoy?=
 =?utf-8?B?WkwyWG0xYzBwbitLS2ZpRmN4N3VQNmU2SUY2VHVmS2dGeTJXaG5RMG1LVmN4?=
 =?utf-8?B?bGgvZHRZSkhVVmlPM1B2cmNBczArQVRJQk96dUJCdE92ZTJJTHpYSmE0ZGVW?=
 =?utf-8?B?L2lTMm53RitQenU5VmdnY1pyRnM2KzlqS2N1RU5aOHVHamZ0cE0wVVFrK0U2?=
 =?utf-8?B?SzViWmJyMjZ6VExYbFBPL0FKS3BlM05md1pDbFVPck9NMnIyQ3hkb1J3aUg3?=
 =?utf-8?B?aHhkcDVkdEdkTldhbWtoMkw1NjNVcUQrbVZOVnRyZGw3akkwbkxEOGVqYThM?=
 =?utf-8?B?YmpCTTZjWUo5WEFPZGRpMEJLVk1ZZ2k4dTN5cTE5bm9waDdlbk11aUJVNlBC?=
 =?utf-8?B?cDVvMDFJZVJZOXFHQWszM0wvL3RDUzZHVHQyUzZhb0NSejVXY2hCQ0ozeWdp?=
 =?utf-8?B?UkVncXd3a1ZwakIxV0tzdStLVnd0cC9FMkJkTE5FK3psbFhOYk9tMEljWEtx?=
 =?utf-8?B?SHhndDhnRVJhMjNoa2RpTW9FbjZ4NEhVamg5eWpZV2toZGg1TlQ2TWJBYk1S?=
 =?utf-8?B?U0dIU0VDVkJRK3JOTmNsQVBFdVlyc2s4aWpCYmV4RkR0TEZYbFErU1U1N3dl?=
 =?utf-8?B?MHNjakdKeUplUWFRSXpGVVZmMzV5RGJMVkZ4U2RVSmhTRDRUT1BMSHhRS2dT?=
 =?utf-8?B?Z2hnTVM1UWJZNlRFbkl4T3MvcmNhZFJSelN6dFdNNjU4OG8vNDU3dmpUUmFO?=
 =?utf-8?B?MUpQOXhoNUgwM1ZsdVhJZTV0UHlDcjFCeGFJaXc1SGxibnNrSU9Zckx1dXVG?=
 =?utf-8?B?VVRLQk0yWXUvbHFsM0trdGRiUWtWakRrcG5GKzh1MmlGSXE0MGdnSDRTYkhB?=
 =?utf-8?B?Mk9JNlUyVzJ0VFU3WHFQTEllYnhtVFZSZVMrUXZYQ0JOQWxGeDJsUFE1OFFx?=
 =?utf-8?B?ci95cTJ4R2tpU25mdlJxTkdmZUQyZUJqa3NzbjBpZjgzWEZWL05kVXpELzdl?=
 =?utf-8?B?MjhjZ09yblU4eVQ4MHBvSVMxaElyclBjeXppOUNKemM2SGk3U2NlMEl5N0Fu?=
 =?utf-8?B?ZlkwYXVQVThKODgzWDdkdUNOUHdJWVhmOGNITnNSTFNnMHdKaitMZ0tiNys5?=
 =?utf-8?B?ZUNycmFsTDdVcEJzZEs2elZXNEJZTDZrcng3T2NIeTk3YjBBc0orK21hZ2ht?=
 =?utf-8?B?ejVpMUxUSmtCaHZMMTFlcGFqcDNXUExMV2NBYy9yQ3AvemVSM2pxWDlRaGV0?=
 =?utf-8?B?Z0lLRTNuaXUwc3VhaGtEVzNvVWRXTFNyVk9vcHVuc2NMQ1FHVkhuWGtibFlF?=
 =?utf-8?B?MzgrRlptR2VFMTFsbDNEM0xtYmFUbk8xMFdBa08yMHFNcFBRY1M2UnRpVWFs?=
 =?utf-8?B?bndMUVlGVTBDT0pSQ014Rnkzendxb0ZTR25LSlVERmpCclg5Kzl2cHYxeTlm?=
 =?utf-8?B?OGZtUWxUdURnNjVwS2o2Y1l3SW82UjVkTkloVlhrTE12SXJyUlpLN1B3WDJD?=
 =?utf-8?B?WUR1NG1uNDFQVWRrMnVhaHlhYk0rd1FWZFBPNnZldlJUaVF6SmdzZnlueFk3?=
 =?utf-8?B?aWZMSWtsczVUbEJvYVEyeEk3Tm0vNzdwRExGRWM3eWJVajd3aG1ZRnpGTlRI?=
 =?utf-8?B?MVdrd1BMWUM2R3hiOXlzTkRXRU5iRzlBZXhFTlNQL2JmSjNaQTN1QVB2RDhw?=
 =?utf-8?B?WlpTaDZIdCtjczVERXJTK3BzUWdtS0piYlpQRlppaWhQcm1jd1JDcVVvUmRr?=
 =?utf-8?B?L2xXM1l5QXV1MXBBUDZ0d3d3L3ZQbXJxRUtCY25oT25mVmNWT2xKUmJBMGpO?=
 =?utf-8?B?dnpEQUNWS0w4czhzTmJpcjFGSWJ1RElWZ1pPdjFhd2MzMlBuT3dQU3BDclZt?=
 =?utf-8?B?Sm1UanhJTTF2emJzditCeUFhUCtaYWFyRGJKaC9xbkd5clRNS00rZ2JSUjRO?=
 =?utf-8?B?VllEWEZwQkJFcWdwTzNvT3NrQTRpcjJVSEl6SHNNalAwU1IvL1lxMlJtTytt?=
 =?utf-8?B?VkNIbTNKWVZKZEtqWTlhNnNtak1vUU1DbnlqUHIxVGRzc0tDdTk4akI0VG9W?=
 =?utf-8?B?MFBpMzZZYktPaFV6S2FVSm9kMmgzc2UxajhhK1hPTVVjTmFmVnF6bXk2Mitk?=
 =?utf-8?B?ZkJjWGdOL1czVFVic2c3SmQvenlaRDhhWm5zY2t2Y2hZTzRLV0hTcTQ3UWZR?=
 =?utf-8?Q?1mJ+G/JxmF2mXLhNa2oE2qg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 940718d5-cea2-444b-bb78-08dca8224d7d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 18:40:46.3880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODYcwBnt/agLWTjhKcednBE1PmOXwIOcNpX/e7z2hR+FtrAxKfJKar68ZurG+LGdqY51WLS9ky4+RKMHfBsp1iTdMsmX4MG+tf4wx/8k+J4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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

On Fri, Jul 19, 2024 at 02:47:29AM -0500, Lucas De Marchi wrote:
>On Fri, Jul 19, 2024 at 07:16:19AM GMT, Matthew Brost wrote:
>>On Thu, Jul 18, 2024 at 02:05:44PM -0700, Umesh Nerlige Ramappa wrote:
>>>Just posting the revision that will be pushed for reference. This rev
>>>only has documentation changes compared to v2, so will not run CI on
>>>this.
>>>-----
>
>great. indeed no need to wait for CI.
>
>>>xe_file_close triggers an asynchronous queue cleanup and then frees up
>>>the xef object. Since queue cleanup flushes all pending jobs and the KMD
>>>stores client usage stats into the xef object after jobs are flushed, we
>>>see a use-after-free for the xef object. Resolve this by taking a
>>>reference to xef from xe_exec_queue.
>>>
>>>Issue: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>>
>>It looks like not having ref to vm->xref is causing other issues too [1]
>>[2].
>>
>>Let's get this in ASAP.
>
>IN it is. There was only a minor conflict with drm-misc-next, but that
>was trivial to solve.

You beat me to it, I was having some dim ub trouble this morning. It 
keeps getting disconnected.

Thanks for pushing this.

Regards,
Umesh

>
>Thanks for this fix,
>
>Lucas De Marchi
>
>>
>>Matt
>>
>>[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
>>[2] https://patchwork.freedesktop.org/patch/605099/?series=136240&rev=1
>>
>>>
>>>The series adds xef refcounting and ensures all consumers of xef take a
>>>ref to it.
>>>
>>>v2:
>>>- Include review comments from v1
>>>- Squash patch 3 and 5 from v1 to add Fixes/Closes tags
>>>
>>>v3:
>>>- kernel-doc fixes (Lucas, Matt)
>>>
>>>v4: Rebase to drm-tip
>>>
>>>Note: Patches 1 - 3 can be merged independently
>>>
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>
>>>Umesh Nerlige Ramappa (4):
>>>  drm/xe: Move part of xe_file cleanup to a helper
>>>  drm/xe: Add ref counting for xe_file
>>>  drm/xe: Take a ref to xe file when user creates a VM
>>>  drm/xe: Fix use after free when client stats are captured
>>>
>>> drivers/gpu/drm/xe/xe_device.c           | 58 +++++++++++++++++++-----
>>> drivers/gpu/drm/xe/xe_device.h           |  3 ++
>>> drivers/gpu/drm/xe/xe_device_types.h     |  3 ++
>>> drivers/gpu/drm/xe/xe_drm_client.c       |  5 +-
>>> drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++-
>>> drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++-
>>> drivers/gpu/drm/xe/xe_vm.c               |  6 ++-
>>> 7 files changed, 71 insertions(+), 21 deletions(-)
>>>
>>>--
>>>2.38.1
>>>
