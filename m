Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D2BC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 13:40:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F062A10E4E1;
	Mon,  7 Sep 2026 13:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KNJ3V5sh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72B410E4E1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788788456; x=1820324456;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JnGMoY2y1ypPXLgopPrxW7JYSR2jJ2/KHXDdq7VKVHQ=;
 b=KNJ3V5shEw/axuSmeJizpDHXQ3jlbYoTdHwbE/Xlru4TcgCEvJFMtug8
 m/KSSJ0qwGQjpYJIhD7N+fpSqq3S+SjZRP9SuvJgpTma7+9sd33BAmw+G
 2bO8zukDuvWNO4Usj7MjDAX0EJkrsd4XpEm8+5W2Zs5+aJmZfOg5CMKAE
 ZPmudQljjBuSrFH2eX7xiCAYUQ+2S+PN05EoOJrs5kNMeG8PHlVjXl6PA
 NbqnMvkWhAEM+lL9eLoJVjoeJdLDbtDv7+mjT14NWgY/qDthc+IGC6nVK
 CepH1Oa+bIf4OOmFLTRFDk/WG/kelZVGxRkptfFe5C+lAxSyir9btoOpN g==;
X-CSE-ConnectionGUID: huRB35UeS46Koz8TLF9OZA==
X-CSE-MsgGUID: 4ytAymOLRQ+KlVC7/+driQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88952946"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88952946"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:40:55 -0700
X-CSE-ConnectionGUID: upvd6d7cSAi/pqlRjjqNng==
X-CSE-MsgGUID: C32FWzRdQGuIKZA974gNbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="295596682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 06:40:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 06:40:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 06:40:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 06:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBTuTE/DzZappOrF/TWRreZxLE2rB2M0Kj3KqoMrSEjHcm1O52nyaBFrLGSEGu9KlPrcpJmufR+MairbyF36vNCWHG7TCbnfLMDPGqnNGpl8MYYLewooY1BqHoXccKqqqcexcsmDPtNr8i4iFtNBdaqpIua8Eqm3M9GYgqK0ISH3GraSetmrBFadk0ibn6mkjJ3M/9nVr71QZE/z/GfzNlvlP3aKaDZFV+seDhrZXOSJ6eRpsZlxTelqZxkSczYMAr8QIR5x73Ki0DhB1VNf/TP14OWelDFrSdhsVQxy930VACGK+aoSo37mAvFC2A8K6aEMUSc387+QY5phxDMOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3rkGg61SEGsb9NFk4OxcCFSXOCe4TXfRlehDWIblAs=;
 b=tkzHbvdL5CM4nkrnTPD6HDxFNRginO3wBLW26xSjzFaF85170q0UUionlpnJbLMfAGucfg0rioXuxEwOfifi26luD+xmuUNWlff2oabIYlUn+gjqbsaVWWpbnlCIZ1JQHIxqu33t7n644bcNFdGwaomqzcnKG31YW1LdKkhcZtMFRCCzW6OiR2UpSGtED/gLIkYmdnUuiLdU3MN1voEF1tDJs/rf1POV6bl24Jpo2azKg2wLIN0d9Jha631p2adHjAmFQLS7e1n9H7UVCBZoduUoUNeMNHFAHfsrvpSsfXj5FWl6DEdcKNmsEiPP/VPSjg2w2peiXQlmzoHFpjOVWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 13:40:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 13:40:51 +0000
Message-ID: <2b8859f5-3da4-4c48-9b2e-59bcf957205c@intel.com>
Date: Mon, 7 Sep 2026 19:10:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: FW: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests
 for device memory ecc errors
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 <tejas.upadhyay@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-9-riana.tauro@intel.com>
 <0ef3ec26-7426-42e1-95a1-532dd5cffed4@intel.com>
 <SJ2PR11MB7619EA09682C7DE8C0A603128CB22@SJ2PR11MB7619.namprd11.prod.outlook.com>
 <d4906b36-bdf1-47df-9876-7fe86ddc4fc3@intel.com>
 <781e3915-f275-46c1-8784-04f5722b8cf4@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <781e3915-f275-46c1-8784-04f5722b8cf4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3e2c4a-6805-4dbf-74ea-08df0ce5a1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: NotwXORZXb4FYrJqv/LhZyUlJyPGLPn2024QFeltfh70qpWQcwM14I0E+8rKfEZ01R/6OjnYuE2HiPLStcsKsHznqUS7M9XOrHvaEeGBhY/Ur2CWRK9H+3ILpXqVtxCNEVTQosw6NDZRofiAMHSpbmn8V5LXuWB9qgTjRtf7VYpOa8bKkhRhZKG6Hda8mnBeowuMJCfyj1lI13m3TW9InVyROF+MGqhAoSkFJUx4gT9I4jgDh3spHv8noOT5HECgv53j0ttkG1JX7W0w/gOzsp/oUb4J3TFAN6zm97iosfvmizisSFiOQ/2wNDiUAWXCBMgrSkHNH6flOi0LK7aewCvGsh/PwHfVzNMZld1grXfvNc+1Jp+1uI335EC2YE4iOeys/3ujezSUVzKEd9UFjZaugocxXn1N6sbM2xcE//67dnR3Ijmc/KK388oXSqJFf5aPeX3GyX6mFIYC+X+SUlm4x/EK+uRm9ZXqlETxSVGiMEVPi04+luvBeuXHJCck1NtNiCbbsierbt0lB6wOHvBynYAJ+I/3olKTE4zzswYBtna93gW6qg8SSB5L/GoF+AxolYdtzF9MXFlA8AYQ6WIESne7MudjKHDMRWJGiotJ7yimvR2WqCQVqbzV0P5BlgaL1UDIRrzqmgaTDAJLEXM2huLAE5r3JbgbrDuFZ8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFI4MlRPRlJBOW1XVWNNTjVnd1NIeHdnSkFpS0hVMXFvSW1IY0ZSaEYxUkdZ?=
 =?utf-8?B?Q05RU2lmT1dKRmJLcGJhT1A2SklVUVF5OTRxNnlabUxtdFlHNmhHQlV1RDFK?=
 =?utf-8?B?Q3RnRVFkNU5CUmZjZ2RzR2dwUC9DUWZPdFZCakNHU3M2TDRHekNkczFuWkow?=
 =?utf-8?B?Y0FRRkRDS1FNSm1WRUVidVhiOU5IeTRNcGYyQTdSWDBIQVVEelhJdFpGZHJj?=
 =?utf-8?B?d3R5YWVKYjFQM0dVREJWN3ZiWDBTMFE4RGcrZ3hzSUVyOWVFKzFWL2RPVkln?=
 =?utf-8?B?ZVFXNkFKd0RQRkJXY1BrQUNPSlZNKzdsOU1BbUhDai9DTUxyMmNNYjJJS3FB?=
 =?utf-8?B?amp3UUFJd283ZmxLUGkyeXIzbXRZUlR6MHRZS25PZFFFSnJOd2hEa1hBY1hM?=
 =?utf-8?B?Y09HUWNya2w1Z0VvQitKUHRrTTF3Y3dnOG9JOUc3QndONjRzRlZ0Q0xhMEw5?=
 =?utf-8?B?RzF1cjF4bnd1TERwbUl1Zk1BUi9iQlFKQ1ZqQ1AwVE5wcFRrZmNCUGxiWEhU?=
 =?utf-8?B?V1c1aURQVExmMUxseVd6WjdhZlBMZHRCVDM0ekllNmF0SUlINkZIbUlFNUEy?=
 =?utf-8?B?OXdaU0N5REY1RzhDTkltNGZwZDZ1MGhZQklCVklqMVpEakl4aUZaSDNSQXF6?=
 =?utf-8?B?dWYyL2RqSXJhWmJFZzhaVlR0UitCU25SbnhRMkVQVDRNdnVCdFUxRVNCUklu?=
 =?utf-8?B?SGc1MjN6M09yWmgvVW41dXpiMXBoMmNGWDBkMEJvcE4valEyRGdRK3dvUjNJ?=
 =?utf-8?B?cHM1OEVyY283N2xjMDh2VUdjdzQ5SHlDVEhOUm43STEvZVJkYUZ0SEdBeStL?=
 =?utf-8?B?UEgrL3BGSy9zVG1TcVpmYStKdGE5WDBDRnBSS01aTUxObEozQXV1eEE5VWc1?=
 =?utf-8?B?eVlubjIzSlVvSDB4NU9EOTRuNW9ZVjdka3NYV2dQUUlOMEpMakhHY3dVLzRJ?=
 =?utf-8?B?aVAzUVRVS3duSUZ5SzA5QmJNdUhwcllkLzdKYlE0RmJ3MC80akwvRHhXYlpL?=
 =?utf-8?B?NDBGRDJ3eFQ4NHNpTVMzYzc5amh4UHFZOHRHZThMNVl4YUZjN1VsZFRrTDVq?=
 =?utf-8?B?WEQxQUhSOGpyRzZqT0UzU2svV3ZaZmZ5UXdFNDNXRkFYei9Tays0bStHa0dD?=
 =?utf-8?B?UHFkWnB3L0tFU1I3VTJsSHdhUDE4RUZJUGZxMEZpVXJuelNNWCtvVjF5elQ1?=
 =?utf-8?B?ZHIySGlVeXZGVERqWXMzMWsvRmE2MVBsRW1pVTN5TFlVcitndE9LbHVCWThV?=
 =?utf-8?B?M1Rlc3NzcWJ4d1dmWDQ0NDNzMCt0azFqa1Ryam9qTVAyQVk5bXcyOHFPQVRU?=
 =?utf-8?B?cFE0VDFHU0lteEtZeGJIais5RERMN0YzT0lyNHBRS2E2UW9HTy8veEdrOFdJ?=
 =?utf-8?B?dFdXb2hDdHpwWG42bzhlUHdOcGJBS2Ird1RRVE5DR2U1WHJndExWZkd3cjBl?=
 =?utf-8?B?SExzQ0hXTmxSRlNoY0dsRDl1cVZiZlVPemlHMUN3T2o5dW1ZL1pHYlRXeTN4?=
 =?utf-8?B?emphcUdVTXl5SzVhSWxkTkFjVnNoZVVWYmFRTE1ERU1yeVRqRHhmR2dId21a?=
 =?utf-8?B?SFJKMHV6SDRtSTAweTdTNzg2VC9peW9XSUJVVjZKb2l6NThKZUNZeWswazdY?=
 =?utf-8?B?QmxXR0htMW83cHZxcU9lSXVjQ1JrKzB5bXhrZnFUeVYvc3htalBUb2FzOFM2?=
 =?utf-8?B?cTBwMiszcDdBSVEwRkNodnRaSXkwam1yVS9HaWlYeHpOM0c4aDByR0lHTlpF?=
 =?utf-8?B?ckxmTkttQmR2OFQwSjA3M3JrVnZpbHByTkNJUHN0SjEzOXFKQnEwS2JnUGNT?=
 =?utf-8?B?QUpQWnk0SXJKdWg4R0Z6azBSQjlwVEFWZ0FTR1FhQ1orTlZqZ0IyTm5WM1pL?=
 =?utf-8?B?c0V5TDdlYmdkKzlpelRMRVZ5VVl3d0JsYVNheFJpeWpFM240VnZRMy9IeXpI?=
 =?utf-8?B?Smd3clc0b0Y1QmduU0pzRUZENnN2UXBtTzNPVTd0ZmpMSzhXVERYVklNQjFo?=
 =?utf-8?B?MHR4UHpZSWQ5M21Mb1BySjNFTTVYMnptU29YSStlWjJXbWhIZmRqOVVMdUZr?=
 =?utf-8?B?MDJjNGF4RUozaGhSZXY4RXhVY0hqTklScWVvbnNqcTArSHZ5S1dpSmxrQ3Vx?=
 =?utf-8?B?YmNlaW1aTlJzN09oc3UvY2FHbjBpbnd0dzRQenJQTEVvL0k2QmFyT29nKzlO?=
 =?utf-8?B?QW5qKzI0YkZCeGNEUU9scEl2dG5GbWpoM05qUlNkVHdpMWhkUUVON2VOeHpI?=
 =?utf-8?B?N2s1cDVkSWF2OG5qYXNSUUhSYk90ZjhXd0NOMUt1UDVSUVNIblFRN2puVFpT?=
 =?utf-8?B?dVdkSFp6K1E3MFpmallFQU9wbjQ0ODNNVGZReTNubzF6Vk50U1NRUT09?=
X-Exchange-RoutingPolicyChecked: MCFDta+gsFo7/Tnqdgs94spEna7vYB1RhHQ5Qb/t6ikl16421UOzlCdk+f6mY+5JzrMzYkjApD5nWAkHECNN2K2fKWJANFdv07slXZa4XFz3W8tfJSd0X2ksdGHdi/i6JfmlgfO6FQKv6knzp2tiaVuqkXmQGC5KvXfZ9nKsw9BY628raI6uh0KbDiafgbYgTfMPjvlBB0gjqcWMa4rWB0n6/GU58dPFdzvdnNWEiQ7tHmpgF2uFK2hz7WtAV6xOPCx+jtVTWQH1GjbNuBSuMei2P0FgRNqmA9UUYfpkAzfv+259zKrxyibT49tVi5VFXdIEB04q6Vc6S0ma5xxxjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3e2c4a-6805-4dbf-74ea-08df0ce5a1d3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 13:40:51.3848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oXcpavlDm3lb4KVtPRFGcpf3p/uYEOrG5f7EVxlxCX7JAleTH+iJdz2UW9CHJ50dlC+KfbQEUcESAtMpv3GVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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


On 07-09-2026 17:53, Michal Wajdeczko wrote:
>
> On 9/7/2026 8:31 AM, Tauro, Riana wrote:
>>> On 8/25/2026 8:36 AM, Riana Tauro wrote:
>>>> This will be integrated with the related address-fault handling flow
>>>> once this patch is merged.
>>>> https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/
>>>> Sending for initial comments.
>>>>
>>>> Add basic support for sending page offline/decline requests to system
>>>> controller and use it for device memory ECC error handling.
>>>> Pages that belong to critical BOs cannot be handled by offlining and
>>>> require a SBR (Secondary Bus Reset).
>>>> Pages that are configured for log-only handling are not marked as bad by
>>>> firmware.
>>>>
>>>> For all other valid page addresses, the first occurrence of error
>>>> indicates a poison error and the page is offlined only by software.
>>>> Firmware avoids permanently marking the page as bad. The second occurrence
>>>> of an error indicates a Double-bit ECC error and the firmware
>>>> permanently marks the page as bad.
>>>>
>>>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ras.c                   | 121 +++++++++++++++++-
>>>>    drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>>>>    drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>>>    3 files changed, 153 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>>> index d25d25f77531..c643c7137a42 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -3,6 +3,7 @@
>>>>     * Copyright © 2026 Intel Corporation
>>>>     */
>>>>    +#include "xe_bo.h"
>>>>    #include "xe_debugfs.h"
>>>>    #include "xe_device.h"
>>>>    #include "xe_drm_ras.h"
>>>> @@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
>>>>        return xe_ras_components[component];
>>>>    }
>>>>    +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>>>> +                 enum xe_ras_page_action action)
>>>> +{
>>>> +    struct xe_sysctrl_mailbox_command command = {0};
>>>> +    struct xe_ras_page_offline_request request = {0};
>>>> +    struct xe_ras_page_offline_response response = {0};
>>>> +    size_t rlen;
>>>> +    int ret;
>>>> +
>>>> +    if (!xe->info.has_sysctrl)
>>>> +        return 0;
>>>> +
>>>> +    if (action >= XE_RAS_PAGE_ACTION_MAX) {
>>>> +        xe_log_err(xe, DEVICE_MEMORY, -EINVAL, "Invalid page offline action %d\n", action);
>>>> +        return -EINVAL;
>>> this looks like our programming mistake, shouldn't we use xe_assert() instead?
>> Sure will change it to assert instead of sigid
>>
>>>> +    }
>>>> +
>>>> +    request.page_address = page_address;
>>>> +    request.action = action;
>>>> +
>>>> +    xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>>>> +                  &request, sizeof(request), &response, sizeof(response));
>>>> +
>>>> +    ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>>> +    if (ret) {
>>>> +        xe_log_err_fatal(xe, SYSCTRL, ret, "failed to send page offline command\n");
>>> what about moving xe_log to the xe_sysctrl_send_command() and use:
>>>
>>>      "Failed to send command %u.%u (%s %s)\n"
>>>          group_id, cmd_id,
>>>          group_id_str(group_id), cmd_id_str(cmd_id)
>> This can be taken as a separate patch if required.  This is currently consistent with rest of the file
>>
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    if (rlen != sizeof(response)) {
>>>> +        xe_log_err(xe, SYSCTRL, -EINVAL,
>>> -EPROTO ?
>> This is consistent with rest of the file.
> but there are already other series in flight where we are trying
> to fix returned errors, so why not doing that here right from the
> beginning?

Can you please point me to the series. Since response is invalid, imo 
the return code
seems right.

>
>>>> +               "unexpected page offline response length %zu (expected %zu)\n",
>>>> +               rlen, sizeof(response));
>>>> +        return -EINVAL;
>>>> +    }
>>>> +
>>>> +    ret = ras_status_to_errno(response.status);
>>>> +    if (ret) {
>>>> +        xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
>>>> +               response.status);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
>>>> +{
>>>> +    enum xe_ras_page_action action;
>>>> +    int ret = 0;
>>>> +
>>>> +    if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>>> hmm, can FW really send us such a broken address?
>> We cannot guarantee. Its better to have a check
>>
>>>> +        xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
>>>> +               page_address);
>>> shouldn't we try to log/print other details from the notification?
>> like?
> "Page offline notification for unaligned address: %#x\n"

Sure will fix in v3.


>
>>>> +        return -EINVAL;
> btw, shouldn't we try to fix that address and move on with
> attempt to offline something close to the reported bad page?
>
> or if we think it is very unusual for FW to report that bad
> address, maybe we should escalate to reset ?

The firmware spec says the address will be 4k aligned. This is a
defensive check to log if we see a mismatch.

IMO reset is not necessary, as these are non-fatal errors.

>
> just logging info about bad address seems not enough IMO
>
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * TODO: Call function to handle address fault
>>>> +     * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
>>>> +     */
>>>> +
>>>> +    /*
>>>> +     * Handle return code from address fault handling function:
>>>> +     *  0: Page soft offlined, decline to firmware
>>>> +     * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
>>> maybe:
>>>
>>> #define    EADDRINUSE    98    /* Address already in use */
>>>
>>>> +     * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
>>> #define    EPERM         1    /* Operation not permitted */
>>>
>>>> +     * -EXIST: Address is soft offlined but yet to be offlined by firmware for second occurrence
>>> #define    EUCLEAN        117    /* Structure needs cleaning */
>> These return codes are from https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/.
>> Any change will have to be made there as this is dependent on the above patch.
> hmm, as there are strict expectations for each scenario, maybe handle_fault()
> should return one of the custom predefined enum instead of generic int/errno?

That patch is already merged. Any new changes will have to be a separate 
patch series.
++@tejas

Thanks
Riana

>
> see enum irqreturn as example
>
>>>> +     */
>>>> +
>>>> +    switch (ret) {
>>>> +    case 0:
>>>> +        action = XE_RAS_PAGE_ACTION_DECLINE;
>>>> +        xe_log_err(xe, DEVICE_MEMORY, 0,
>>>> +               "Poison detected at physical address 0x%llx, page software offlined\n",
>>>> +               page_address);
>>>> +        break;
>>>> +    /* User policy set to decline page offlining */
>>>> +    case -EOPNOTSUPP:
>>>> +        action = XE_RAS_PAGE_ACTION_DECLINE;
>>>> +        break;
>>>> +    case -EIO:
>>>> +        xe_log_err(xe, DEVICE_MEMORY, -EIO,
>>>> +               "Physical page address belongs to critical BO: 0x%llx\n", page_address);
>>>> +        return ret;
>>>> +    case -EEXIST:
>>>> +        action = XE_RAS_PAGE_ACTION_OFFLINE;
>>>> +        xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
>>>> +               "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
>>>> +               page_address);
>>>> +        break;
>>>> +    default:
>>>> +        xe_log_err_fatal(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
>>>> +                 page_address);
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    if (send_cmd) {
>>>> +        ret = send_page_offline_cmd(xe, page_address, action);
>>>> +        if (ret)
>>>> +            xe_log_err_fatal(xe, SYSCTRL, ret,
>>>> +                     "Failed to offline page for physical address 0x%llx\n",
>>>> +                     page_address);
>>> there are 3x xe_log() in send_page_offline_cmd()
>>> do we need yet another one here?
>> Sure will remove additional log.
>>
>> Thanks
>> Riana
>>
>>
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>    static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>>>>    {
>>>>        u8 severity = counter->common.severity;
>>>> @@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>>>    static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>>>    {
>>>>        struct xe_ras_memory_error *info = (void *)arr->details;
>>>> +    int ret;
>>>>          /*
>>>>         * For memory errors, the recovery action depends on the error category
>>>>         *
>>>> -     * TODO: Double-bit ECC errors: Page offlining
>>>> +     * Double-bit ECC errors: Page offlining
>>>>         * Poison and data parity errors: Log only
>>>>         * For any other memory errors, request a reset as recovery mechanism
>>>>         */
>>>> @@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>>>            xe_info(xe, "[RAS]: Data parity error detected\n");
>>>>            break;
>>>>        case XE_RAS_MEMORY_DB_ECC:
>>>> -        xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
>>>> -            info->sw_address);
>>>> -        /* TODO: Add page offlining for Double-bit ECC error */
>>>> -        fallthrough;
>>>> +        ret = handle_page_offline(xe, info->sw_address, true);
>>>> +        if (ret)
>>>> +            return XE_RAS_RECOVERY_ACTION_RESET;
>>>> +        break;
>>>>        default:
>>>>            return XE_RAS_RECOVERY_ACTION_RESET;
>>>>        }
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>>>> index 99b2466e2062..2fac968879b6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>>>> @@ -17,6 +17,19 @@
>>>>    #define XE_RAS_MEMORY_POISON            BIT(2)
>>>>    #define XE_RAS_MEMORY_DATA_PARITY        BIT(5)
>>>>    +/**
>>>> + * enum xe_ras_page_action - Page offline actions for page offline request
>>>> + *
>>>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
>>>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
>>>> + * @XE_RAS_PAGE_ACTION_MAX: Max value
>>>> + */
>>>> +enum xe_ras_page_action {
>>>> +    XE_RAS_PAGE_ACTION_OFFLINE,
>>>> +    XE_RAS_PAGE_ACTION_DECLINE,
>>>> +    XE_RAS_PAGE_ACTION_MAX
>>>> +};
>>>> +
>>>>    /**
>>>>     * enum xe_ras_recovery_action - RAS recovery actions
>>>>     *
>>>> @@ -245,6 +258,28 @@ struct xe_ras_memory_error {
>>>>        u32 reserved2[10];
>>>>    } __packed;
>>>>    +/**
>>>> + * struct xe_ras_page_offline_request - Request for page offline command
>>>> + */
>>>> +struct xe_ras_page_offline_request {
>>>> +    /** @page_address: Page address (4KB aligned) */
>>>> +    u64 page_address;
>>>> +    /** @action: Action to be performed, see &enum xe_ras_page_action */
>>>> +    u32 action;
>>>> +    /** @reserved: Reserved for future use */
>>>> +    u32 reserved;
>>>> +} __packed;
>>> if this is a FW ABI, then please move it to file in abi/ folder
>>>
>>>> +
>>>> +/**
>>>> + * struct xe_ras_page_offline_response - Response from page offline command
>>>> + */
>>>> +struct xe_ras_page_offline_response {
>>>> +    /** @status: Status of the page offline request */
>>>> +    u32 status;
>>>> +    /** @reserved: Reserved for future use */
>>>> +    u32 reserved;
>>>> +} __packed;
>>> ditto
>>>
>>>> +
>>>>    /**
>>>>     * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>>>>     */
>>>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> index d0341538ad05..3363f48da2b7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>>>> @@ -26,6 +26,7 @@ enum xe_sysctrl_group {
>>>>     * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>>>     * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>>>     * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>>>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
>>>>     * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>>>     * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>>>     */
>>>> @@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
>>>>        XE_SYSCTRL_CMD_GET_COUNTER        = 0x03,
>>>>        XE_SYSCTRL_CMD_CLEAR_COUNTER        = 0x04,
>>>>        XE_SYSCTRL_CMD_GET_PENDING_EVENT    = 0x07,
>>>> +    XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
>>> ditto
>>>
>>>>        XE_SYSCTRL_CMD_GET_HEALTH        = 0x0B,
>>>>        XE_SYSCTRL_CMD_SET_HEALTH        = 0x0C,
>>>>    };
