Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3988CCCD183
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 20:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE30710E20D;
	Thu,  9 Oct 2025 20:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvRKxkzc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A9210EB18
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 20:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760042879; x=1791578879;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dt4iP/MvAsaWTZ96CftESqFshc5Mt59Sq3/lExw7V0E=;
 b=BvRKxkzcAY+iNAeFvctnwLLMWEfPXmcLP0ja55QXJm5dSEMbvpR4N1bC
 VVuo9rPuGHByuA+3VRGBaNjldKV6wItpIslJ9/ncmy3SjfqAEGiz7QHko
 8T921/MdGMjzhO21Fb8ONej+7eEMHxwx56dXT5ZSkyUADL7XjmzbFMPqN
 PAF90p4iXzARkNRoJoKtIo3S0l+L7XcH23WB1YQrU0vfB6CKB85Lecqdu
 WIE4nD98IuGVQheFw+QvRQhIfyh3jhaF+fx76iJYkIyGVL1OypCwvn/F3
 naWWAmDv8Hj8dhsWsqkE2rE+QYF+3W3rNkW2Q4b403DkZNLtkkhlQOgfT Q==;
X-CSE-ConnectionGUID: 6mlylNzwRGyoC/48jsk82Q==
X-CSE-MsgGUID: qegSdFz5TPCjYqJfs1HZKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="84885763"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="84885763"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 13:47:59 -0700
X-CSE-ConnectionGUID: FTtjkebISWWyxNfYP+sQ3g==
X-CSE-MsgGUID: PAtU1nqcQaSv7PRAnC1zOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; d="scan'208";a="180758054"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 13:47:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 13:47:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 13:47:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.25)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 13:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vlj3G9HaFRHLDtaWKYWby8HHebFJTewlwZFwTLRGxlApV2Xp+WHaC5h1FXXaS5udt30WFStuUPIg8ZX0GphVj+sojknXzMRr+t7IjGCEqzlQhYdycfGjA7sxDw74S8UdWugDjxDfyAO/Wew84/CNo0mqC70R6dILUgdsx4AS0ud/c3y5Qw7yCbaCGQJbp5styNg3j9vBixwitZyL06b6kDYtN7/s9glKgR+wJZexKw3yaiCulQldVwGQGlT6wGw0V5wIgcZtMDU1qQ6x3hOWKWbvIgowHJkkJRFzdtRT8QXAxQ+7b0mi/gYBmfNPOvxwtLXZcUdkuZcbhgG2FaShBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AykJdRXO7MyYl25H7aGoKs7bbDTjjXbBj34DVIbMnk=;
 b=eLZ5vXjK40SQmZtB/Hgod5K4WDGsq3CJ4Yqu4C1RGtErGktpBPMBamYaOaMO/1xAIzlCE+1o8HVzyprxdRkMH1fdtWOUyRLOVn6xHwumErvNZbVa3lXbs5vzS28BUYD2XkFr+ikCQ3cdzDxed/Gy1uWXxDm2LzsCtJMfV9oCv8P127Ai1MxrPBVI5be8UNUQVWAmwWGfDjrj9WvManbvC5ijvLtY7fzlPPdZsbJ4JVkEkFgp+wT9kZVJEl8U5AhrOanwfQIA1NZd2jwEg2AuSV1rrx4/l0XQyDi6H6jVdV2Thw58wVSDr9bWqhglEH0d8dV7SWT22z010Y2wyWKemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM3PR11MB8760.namprd11.prod.outlook.com (2603:10b6:0:4b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 20:47:54 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9160.018; Thu, 9 Oct 2025
 20:47:53 +0000
Message-ID: <694610a1-6735-4875-978f-c626e9300050@intel.com>
Date: Thu, 9 Oct 2025 13:47:50 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Refresh RPe frequency while setting min
 frequency
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>
References: <20251009180853.578184-2-sk.anirban@intel.com>
 <aOgTgFc_-FgrV9wJ@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <aOgTgFc_-FgrV9wJ@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:930:4f::23) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM3PR11MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fd22c3-525d-4000-19cc-08de07751df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0w5VkVScmVBbm0rcXR5S2JtN0YxbEl0Sm5mSE1VcTB2Y3JDM2hYN1IzWk43?=
 =?utf-8?B?L2xUTXlJcUtiOWhzN096SElyczNBZHFjd3o1RW91NzNtcGg4ZlF5NXQvOGUv?=
 =?utf-8?B?YzB3dWNRUkNIelFvM0drQ2FUOGlsdmJqaXlOMnA5YkwxYmZ6aXR5RjNuaGNE?=
 =?utf-8?B?VmxhUmo1OGo4Q0x5MjZsdU9NUEJTdzJ3K0gwSktHa0U2Q29nbjZjUldQUjFj?=
 =?utf-8?B?Zm05T1N5aXZUdU9hWXlEbzFjUXYya3UwUSt1TElUQVRsZ2ZyMkFlQ3BZWnhm?=
 =?utf-8?B?S29YNVZqUEZueGNtMGpMT0RlOWN2QWNZRHlLOEU0eUFwTlpEb0ZEbkQ5Z2Ez?=
 =?utf-8?B?SFdDRkh5VldXSHdIU0FnVm5SZjVlRFFFeXptallyeGVBZnhGL1krSm0zalE4?=
 =?utf-8?B?blZlMFhzZU9zS0tYN0hiUDAvR0hBYlRNZlc1Sm9GT2Z3N0Y1dWtRam5rbkdj?=
 =?utf-8?B?dU9meTRtbjhCSFF4TDVUdW5uZTdJUWh3N1dmUVdBQVJqUnZaemNsRE9ZR3RO?=
 =?utf-8?B?YW81SVZnQ1VyMXRaVDNoZVZjWXZnY3Bibzc1S3JJbmUvMzg2UHRRajZxT2Fn?=
 =?utf-8?B?QnpzbzFlOE1oWi90YWk1eXYrRFBYaVRzUXNDbVRybk1BMlNPR2JLc0ovb1ZH?=
 =?utf-8?B?Si9WUHU5OTNvL0xOUkxQR2I2czc5V1VyYUxOZE00U0dnN3RSMGF5SDFJM210?=
 =?utf-8?B?NmN5Tlp5c2RoMXpiNW1lWk0vTGtBNGwyc0hpUmw4WW5VckVISmowdUhsMFc4?=
 =?utf-8?B?azVrU1h0S0hqTEpNamhzdVBhZWd3SjkrcVY3ZmEvWGlwZGd3dlcvQ3Y1YmZv?=
 =?utf-8?B?ZDdkZSs0dWN5M1FqUnhRRzN0RmdDTU5QWVM5Qjd6NGtqbEZmZVdsa3NzSEkw?=
 =?utf-8?B?cGF4SzAwdThxWmZSc0NLekJLcTg0UlJHS1RSRFlocWNsbGhzUHc1djBZN2FO?=
 =?utf-8?B?WElDZ3RERldseXVTZ1puNDlBUncwSVlUNzJZNzZkMnVOcGRQNCsxN1BWbDdG?=
 =?utf-8?B?cnYzaFF5dkRDdDdESHQxaDdSRmo3ekZ1UW84MStDV3FFdGJtOGRVRDZZN1pT?=
 =?utf-8?B?eDVOQjZERnlFcnVnWW4rN0NNem5IdWpDSU4xcjZpa3lGYk9XVEd2VUVsSDdQ?=
 =?utf-8?B?V01iRGtHL3pjSlpVWHZGeVduYk1icXZibkV6ZVRqR0JHeE45ai9wbUNrYk51?=
 =?utf-8?B?bnBYTm1kdFl4bUtPbG5UVlN2QnNjcW1qZ2wrdzFYOW9GcWNmSEk3M21NYzBh?=
 =?utf-8?B?RFhoYk1MVVFOd1o3cWFjYU9RTVRuNitLWDVNK3Z5VVRtQmliRnRnS3BHd3dm?=
 =?utf-8?B?Q3hOU0FJdmtwc3JibTkvZlR6dHdlTFlBemphZ1JzOC9kTjR4SU4zbnF1MkpL?=
 =?utf-8?B?b1VrUVRmVHNvQWtuMVlaWjBjUk9FWVI4K3lmSVI4NHZjbkEvMlpsS2hOenkx?=
 =?utf-8?B?WVZucnpEQmwxcUJhVzZLNmk5SEVidkRKdVZnMFFSMC9NOEN4S1FuVnZZQjBO?=
 =?utf-8?B?U1ArVXY5eHpESnZhNXFwQnozYllNbGRCZWR3MXdLNVJHejJuZ0hFRUhxbUZ2?=
 =?utf-8?B?SjM2aFY0eWlFcDA0UG0yL01TOEdzMnNiTjZaOTN6cDEwbWlQOUxNZU1QYWN1?=
 =?utf-8?B?VThqOHNCcXdndENQMlpUVjFnVEVzL1ZKY05DcWZ0UXpTTVAvWkVJNHo2UzZ0?=
 =?utf-8?B?VTY2WExjdmJ2dkNMNE42R1BScVI4dDZKcDV0YVk0bFlDVVJKcExKNnZ2bmVa?=
 =?utf-8?B?eVF4TWd5OFVyWG1uU2xtb1ErWjVRVW5PVm5EeVNsS1c5RGk1bzR2eWk0bldu?=
 =?utf-8?B?ekNXeDkybkxrOFNzd25ILzJvQkFaNHJPWW5veml0bUM2V2N2ME91OWFxUDBJ?=
 =?utf-8?B?QnFSL1M2ck4wYk13V2p1N1lBcXN4RCtHMTVMcXN0RzdQWVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHE2SktuWjFGZk9jRk9ESm5nTlVoYlhEbWNSdmhoaGdCVjliQm9jdXJHY0lv?=
 =?utf-8?B?VHRoMTBkMHJXVGFQb1d4b3lURUNrVjB0Q1IxckdPc04wdGYxYWpIeGo0UVBP?=
 =?utf-8?B?Ri9RTW5lZGdXYnl5SFBDRHJBR3Q3NnZERGEvQlF0MVpSOEUrbk5HMHpPbzBo?=
 =?utf-8?B?MjR1dllReGpaWENZVWVLa2poaHYzcVBrbzhzNmhLRldVSE9LK0NSUUhCSjJ6?=
 =?utf-8?B?OWN5bDI5a0xDZGVrNllkNDEySGR4eHRReTdBaVllSEZBOUs3NWluYnNnbSth?=
 =?utf-8?B?aFhNM3MzdXppWkNlK0dsTENuY3ZXTVFCalZjdEd2WUlXUjRUSmgzY0FoWkRl?=
 =?utf-8?B?aUhuQnhJWm5mWk5mSG1mNHk0UDRkanRPOGdGYXpPRzdxczlVNHl1ODVLOVEv?=
 =?utf-8?B?YWhZU1BRemxDTGo3TEZ4UmkzdWExM2M4R3B3UFJNT3JMSmZiOUVZWDJHeXZC?=
 =?utf-8?B?YnIvWlZKaUMzSG1EYmRQdjZtVnU3VDloSjdVL081R25XUXZpVTQ0NXYxNXo2?=
 =?utf-8?B?d0ZqbWR3bUovT01uMWhEb2cxbC9aR0dEc0RHWVpNaGpIZEdQQnovbzl4ZU16?=
 =?utf-8?B?VXN0UXlhVjc4RHV4R0VkSitUY21YTE9vajNFcjRab1hTYXFNaG9JOHZEb05X?=
 =?utf-8?B?ZHVKWFY5QWh4VHU4bGVUNXo2RzNaRlpzMWZWamlQQk1LR1VNRXFrTTNKVlJB?=
 =?utf-8?B?K3pQdVBLK0JIVGtmRllqL2VzUk9TNGQvSngxd2RRZHZMZEljRHNFNmhnSldK?=
 =?utf-8?B?elVrQTF3SEIvRHVhQWo2TFpEc1lQVHdoMlpxOTlvWEhPa3lQZm9penlhSVcy?=
 =?utf-8?B?Q1RKOHJzSzY4Qzk1YmJNWGdEUm85T3VtTFVsS1l1RzdGMXU3QjArbWZvSjdE?=
 =?utf-8?B?Y1pWS1RGdjZBNVJseHFkQzBoK2ZZYThkaUtGRDE2NkM0S281am9MSU1nS1Na?=
 =?utf-8?B?Wkw4WVpkV0lITUdQUEY4M0lRakdaN1VaYWJ6NjM3L1NEQXkrSTBzTEdUeGlr?=
 =?utf-8?B?ZG1CYXptQk9NK0d5OE1ydEF2Y1JDdlhtbFBzbnJ4SnZ2aFhuZENjRU9qQ1Y2?=
 =?utf-8?B?M25PcEo4V1pubzk5QVBqaGNNNkdmdlFpd0dmUXdLTUJQd3hZOG14dnFxYjR0?=
 =?utf-8?B?ZFRERmtuUjVJMmljTUc3dWFsWkVGZ2tROHFnTWFlTTRTWUxzY1AxODh0SjVI?=
 =?utf-8?B?b05TNEdzR1pPcTByZ3RkRWVaK0tROUR3Rk5YM21qZmQwUW5USS9tclNQQjdQ?=
 =?utf-8?B?dlh1eDkyT3dlZEQ2LzdkRzcvZGRUMlRJQ2tsbjBHNU9MdloyMG8yUDNMUjZl?=
 =?utf-8?B?ekxrWmNqZWhIOTFodU5YL3Q1VWRiak9pK0FvYlZNaVByNEtaNFBCQ3hTc3Yx?=
 =?utf-8?B?MkZjSUhteG94TUpWTlVUVDQxU2FaVk5oQnN0UXRiNFgxWFY5YVVvNll2OElF?=
 =?utf-8?B?RVZJSHBlM0Uvdi9JckZSN0xzM3ZZZFlsaCtjVERjSHdmSXhNQnlSTVJKVjJt?=
 =?utf-8?B?MldNTXlNNzVkdWZqYmg0N1RzOEdYRWd4SkNldzF1NXMxa3dCV1ljV0VjSVJU?=
 =?utf-8?B?M1B4cm5jek5QTUpHdFVUZ2RwV29rNG1mNjVHaHAySHFqS2RXNEFLeVF4WW9N?=
 =?utf-8?B?NmlkaitkOWhSUjBwVmtJQWV4Y0dlRG0yVUl4OEIwUklnd2dTLzlWanRiRmRL?=
 =?utf-8?B?QU11cnNKbzZ4NnA2aUhzcHBtcDJHbDBmeDMrczIzT1JNbVMzcmVsaDRRM1o2?=
 =?utf-8?B?U2hWMlFSckVmK3poNnBsa3Izd2YzL3VCbW1TV3NMSEo5cU9wSnlPdXBSMDRW?=
 =?utf-8?B?VzRKVk1PZWlBbnBzSDVvU3JadkM3bWk2SjRYSUxoRDJyZjlhNnBna1Axblhn?=
 =?utf-8?B?OHlVNkFteFBGNEwrWEh0Y0Q2SVovVVJDWDNhWWt2QkNPazBLeW4yMkUzLzBG?=
 =?utf-8?B?SmZaTGw4UDBqbmpGbE5pczBkNjRLRDJXbTBVNUo3MlNxTElWeDFvdm5nYzF6?=
 =?utf-8?B?dmx6bDVvOGlzaWxNSHBmM1hCQkNLb0NQSEpqYkVmRm5ETCtvbTZwUGRxZk1R?=
 =?utf-8?B?enZiNm1GMnNCNnc2aWpGOXNvdVRTeTFnNVRvNit2MWU2Q2VTVEx2QzhxSWlz?=
 =?utf-8?B?RS95bmZNQStic2s3UmZqbFBFS2JYdzRWb09TbW5vZ25ETk1DSWR4Mm5peXBj?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fd22c3-525d-4000-19cc-08de07751df8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 20:47:53.0566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HWEc+A9nO4cG0duYW/q3SuiLE3aBhTSMvw3g7maWXt55xwimproyaVvDcGHLg/RKA4H3PtcnP1toEXq3to/Uo76IytV45ypY+tKCyFZgjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8760
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


On 10/9/2025 12:56 PM, Rodrigo Vivi wrote:
> On Thu, Oct 09, 2025 at 11:38:54PM +0530, Sk Anirban wrote:
>> Replace cached pc->rpe_freq with xe_guc_pc_get_rpe_freq() call to ensure
>> current RPe values are used when setting
>> SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 3c0feb50a1e2..ea1ff96bec32 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   	 * Our goal is to have the admin choices respected.
>>   	 */
>>   	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
>> -			    freq < pc->rpe_freq);
>> +			    freq < xe_guc_pc_get_rpe_freq(pc));
> I believe this is correct... But wondering if we should entirely kill the
> pc->rpe_freq ?!
>
> Vinay, thoughts?

Makes sense. No point caching something that can change based on thermal 
conditions.

Thanks,

Vinay.

>
>>   
>>   	return pc_action_set_param(pc,
>>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> -- 
>> 2.43.0
>>
