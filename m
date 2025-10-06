Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416CBCCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 13:10:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACE610E0AD;
	Mon,  6 Oct 2025 13:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oHGzR+wn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4A610E0AD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759756233; x=1791292233;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q0VQv/b+KgjgqJHvusqZvja+vvkMqsqWx9Sp21wVgoA=;
 b=oHGzR+wnwL+pi4ggO8zztduG48JgVzQEPG9zCY01jsb9UYAKuI5Ne2IY
 KEAh4W2lCuxVfGYZByOXct75Gce0Ffq3cB/E9JkmFPQQUKgYdmuuAqSJI
 sruESFA9/xTxUI+VLizNa1Wsu3qVdz+mMQCDnrR9WBS7hzEj/yTMW7Vm/
 MMnYz1eOJxSH5LYMlQQjJ0UUMAD40/62MT1fCe5DlGrJL99cSvB+Jp4o2
 zlE3adL5SGzczLHCOp8XjtgGTY7tjjQgZ54ZhdnjCCujpIMEqGHC9+5bd
 U10NuOBtqvww9Hw13MrEFua7LEY1i2fXjNIHNCu2r+QiZ5I/2LF8spLaZ w==;
X-CSE-ConnectionGUID: zGcotefMQaW9N0qFX68m/w==
X-CSE-MsgGUID: 8FtXrmqtQ1ylUPjTS6iayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="73027318"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73027318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:10:33 -0700
X-CSE-ConnectionGUID: jH4IQADKQnGtA6AtMG8Cuw==
X-CSE-MsgGUID: MKgiRwSbS+aGPJgPz2hv5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180676577"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 06:10:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:10:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 06:10:31 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 06:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYbmpKxxFPos/NqfrMa2Fienzi+Dw3rfSvtIA06JoNXWsQfbxHBJncRq3MA1aZRY0Izvu6eoHaIz+hMKpUqC7yvEY4lwYBLybHZjlt7B8TUw2jW3lUZ7SivW0LiUKZVl4EdgeywZ/TOzO/fs9LDREW5gBByUyR3m9yKDhXt5ZA2h2vMaXOnNDtBAZw8tAVZjqpDf4wMP8AZk2Zs9lA3qe4DvrmTEK+5TwZynhG9hroLyJIkT4dHjfgCCdB/BFIkqlHzSlyLtOBoqfl8ThIoP4mKBkcd4IQLLSkFfmbqayBHPjoVW+2GiCu85mOqBUiJwGNW2PR/5uxFrb9JXtWASbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S60IkWgwcEN59OoJStGoF2xjc/SABoeFXgybnlFEcis=;
 b=Mbgla+9vDmFdZGVPfX7EpWYk/R2pEWKJDyT3KkPmHfoiHcx6tUiYpGqx0Ydq52lB/FE062YuokA01Y1vVgIB95IOYOrBgC2DT/+rMf2vZw7Dtk2QMa/sfHTVQ0xl/1IoDcmOzplpuACm4zWxHEQ91rSDWY10mgu17B4zTYZNTI5ToWulTK8JhphIfyqnOPoqlItEN9ng66xerYs8PtMSrEEGxqIVujIJy+Ypmzvh1XAFZekpKo9DULfi00vZrnRub6davajo7gy1ryb3PswjBUiUd2JT7IVf6h5lMbrxHfho1DZ4aSeaRMnoEOX6O1N5dVjI9UZ67ejeVLqrKBVVbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB9448.namprd11.prod.outlook.com (2603:10b6:208:572::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Mon, 6 Oct
 2025 13:10:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 13:10:28 +0000
Message-ID: <0574798a-4dd7-420d-b859-e541e63853c2@intel.com>
Date: Mon, 6 Oct 2025 15:10:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/30] drm/xe/vf: Add xe_gt_recovery_pending helper
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-8-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251006111038.2234860-8-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2bcf14-f2ab-45f1-f9de-08de04d9b8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2N1VW1taG1xYkVoVWwrZWNIT1dPbDE4SVpJUkxpcXRFVVg1ZTFVMVBRS3M2?=
 =?utf-8?B?U2JOd1ZGeU13OHpUczcvRmtPNDJjOFBFN2ZZVkdZdWdGQXhGeWFYc0xod3dW?=
 =?utf-8?B?RDFrVTIvUDhsdGRVMU0yMDVFSlZUYkUrVm94WTRMZFdaRGZVdEFDS0plNVc5?=
 =?utf-8?B?Y09UWm5CUkFFYlJwcmJ5VlIzYUFJekl2ek5ocjl6b1dqOXVXV0dTOG4wUlpW?=
 =?utf-8?B?V21Pdnk0bVlFblRhZU9HMzNWalFvaUZDRmp6OGhxdkR2QTAyRHRmZ3dtbzEy?=
 =?utf-8?B?cm9BQjFRejRrOUNBcUpma2U4M2RLVzVndGU4TWEySVpVVTJ1Y2RWbHNCQnNv?=
 =?utf-8?B?NjNLbDhFbDdraC9YTGdWYnZ2TzZsQndnYmFXY0lod1dWNjEwNDBPcTM3NzNi?=
 =?utf-8?B?RlBkdVVOTmFkUG5WN2p4T3pnTDcrK1RlLzNZVFhQeXNrZFFoalZSQ2NEQUgw?=
 =?utf-8?B?UFFPbTMzV0F4VnVrMFYwWFBwY2hNVzNJYjk1SUpuMEsvV0xBL2VEd29za3Zh?=
 =?utf-8?B?MDEvR2VHMzZBQmw1aGM2ZW13NE5CWlAwQUoxZFh1K2NGTWl0bkRjeVpBTERJ?=
 =?utf-8?B?OURGbW9KaE5POWdRSTlCZGxqV21PRG5xdllOK2FIVGJEV2ZiZXdrREtKSEZk?=
 =?utf-8?B?azRjbk1lTjBNOHZPcGpHN2lWUjJydEhHdlNybFFPUUFVTG5TUFdmK2FHd2Uv?=
 =?utf-8?B?K3lIVERPQWc3a1VwcXFydTJ4dDBVWS9zU1I1Y3R1TVByWmQ2VGNvSXc2a3E5?=
 =?utf-8?B?bmI3TjhOOENFWXJ2MS9KT2p3dm1aSDNDVTlXWmFKU0UwWGY3OU9DZTQrck9Q?=
 =?utf-8?B?bkJvd0FoRVNKVFNWVzJLWnFOZU9jZTI1OSsxZ3ozN3R3OXc0QnI4dkdVdS9N?=
 =?utf-8?B?VXpqcTdCL2s4Y1VsSkVBbjVoLzZJUHRtWjhZS1ZnbXdzMHRTeVE2WEhsWElu?=
 =?utf-8?B?MVIxQU0zQTdUZmNDTHlIVkRSNGNVSi96VlYyZFhidGhJZ0g3VjJZamlXd3pT?=
 =?utf-8?B?YWpXTFZsc2lhN0c0RnJzZ21rSmdyRk80NHpIZjVqN25oR3F2SUZBaDV1UnFp?=
 =?utf-8?B?U0NoVytWREtRY0dxSldLSERrV0c1RjA3UkxvV0FmUVhqSmR6bjVtcGRBczlT?=
 =?utf-8?B?MUhZQTIxZy9YT2pzTlIxcit1cERrYjlrYXdQaC9RdmtNWVBwdlpzaktsRWdO?=
 =?utf-8?B?b0Z6OHJOemFzUDQ2WlFZUDB3bE9GYVU0c3g4UU9hSi9tUWtHcHRWdHZNMHEx?=
 =?utf-8?B?VG1jU2N0TmlRNXF3SVFJS2puNGpKSGRjZU5QYUdad0hXY1plbDVjaFJ5OGxS?=
 =?utf-8?B?TU1aNUhRRWNtQ3dnbU1LMDZza3B3NXN3U20yMWpBamJsRDNkaDhsR3hmMzhm?=
 =?utf-8?B?aC9XY2tCM0FDMXA3aEdQTkVDbWIrbzJBei84blBiUnU5KzRaOUNsZ2U1Y3ZZ?=
 =?utf-8?B?UlhBeEw3STdLZUNOQmJ0dnJqcWdlYWVQUGNBUHcrRVRvWXMwYXV5cEJ1azEw?=
 =?utf-8?B?dm9jbEsxQTRrSFdBdk5ZNTJodUJnZGEzSXlLdGtaY1BHUXZjb205L2hWQk9a?=
 =?utf-8?B?bnZUM2ZGbUtYU3YwZFF0OVQyRGFiTnIwSFI2ZW9SZFdvbDlGc2pTZHNTajRF?=
 =?utf-8?B?TG1mZHphUVMrTXBSWmFnUDNKZVFCYnRmOG9LbjZMck95ajd1SWxMNzg0elRU?=
 =?utf-8?B?ems2a3ErUEpMZFViRmNPZDNXeVJ4eHY3bGZjb1I1VlJrMEZoREFsTGlCbSs2?=
 =?utf-8?B?QlRoa3M1NFdzU0E2Rm1Td2JuUEJ2VkNRQUY3dTM4SnZUVytZYklLOTVpL3J4?=
 =?utf-8?B?VHdxZjJYcEdYUjVhV3ZodjVuL242RFc5T0RyMkM0ZmFTdmdva2dhZ09qZi9n?=
 =?utf-8?B?VTRSWW9uMXF2OVQ2K09Sc1ZRUHZJemVpVW9FWFdWNWhDOXJCejlvT2ZIdnNM?=
 =?utf-8?Q?cUdAJbVKNvs5W10foQnZsKdRZlWVZPlL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVE2WFFWQ3M4QTI4OERQUXkrUTFVZjlYaWFnV2lsaGhrVVVYUU9KUGkxWERt?=
 =?utf-8?B?bWVrSHBZSWNlK2VscXlPcklKN20zbzkvQ0NDMVlLOGhCQ1RUMFpSWStKbUdL?=
 =?utf-8?B?L28vR0puc2hZWUhNZjFyN0tPY1Q5cDZralppdHNkRkFwQmgrRE5LTW5xQ2xj?=
 =?utf-8?B?a1cyTThNYTR0TmFSOGtYSUp6WlV3MXArV2FRamdiR21maHlvNlhSN2dUb2Rn?=
 =?utf-8?B?WjlQcDcxa2ZreExlV0dLOTJVZXlzOFEwaHhBVWxTVnhMZXhxb01JVW1ETlRo?=
 =?utf-8?B?eGF1aFNOblY0QlJaaGphRThKckhpVmF4allhY094Q0cyZ2pvLzQ3L1o1eTY4?=
 =?utf-8?B?NmZjVFB4ZlFXcSt5MEFmbEU5M21iQ25Gd2RpRkxId00zdGRKQWNVUUhaMmJ3?=
 =?utf-8?B?WnNCQkgwQUR0S3l1OEJSNWVZQUlzL3AzMGpJTGpVR1ZLUGY2TlhTVnRqNmpS?=
 =?utf-8?B?M3ZzM2R5LzJ0RTFGNWF4cVpodEJEWG9zZTBmeGVNRm1SYUVROUdRdjBxWHY0?=
 =?utf-8?B?dFVHUEZqY1dHSUx1TkpFZlA3cHVnb0t1eHVXczkreW9UbXhZVi9iZUZ5WlRq?=
 =?utf-8?B?eXdYbHBNMnh6algrMTZzR1gvNTU3bEFvTXNJanRwVlFCb2VML3Z4OHZQbkRF?=
 =?utf-8?B?amNCVXM3VU5GUTJEeVdCeFpxcjVkSFZmM2JRcVNWSVlWbFByMUJLenVZMU1z?=
 =?utf-8?B?YzFVTEhJRkVNTGxJVktmNHo0Q3MvWGYxUnRKYVhBa0tBS2xTQ21IYjI1Y0li?=
 =?utf-8?B?YklyajkwSnhtNjRobTZxNmQ4c3F3TnR4alZsSzlEdnpiaVM0LzZwRVZzNU1G?=
 =?utf-8?B?a3UxWXpOdHNYVmdTL0JnMnNUQkVldXBXUnRuMDhXdHVpWi9BOEVVSTFhQVB5?=
 =?utf-8?B?YkJ5NDROeis3NDdxVGRmMDBhRGp0Z2YrSWRLN2wxNWVXeUYyL2lqQldxWVRr?=
 =?utf-8?B?N0lqYk1tOElJTU5CM1c2eG5Edlk4bVAxWDBEWW8xa0pFT0pSTHd2K082N2No?=
 =?utf-8?B?SFl0MkVhbHhkNm94QU96bzFRVlp5a1VtdEY5N2pqMVRaQjI0cExjS2hHUDJQ?=
 =?utf-8?B?MHc0Z05oK3VBcXprOWlPaE5ZZnRUWThUeDBDRzRKMWEwOUFRSWtnZWFHd1Bv?=
 =?utf-8?B?a09Uc3Y1TC9wSkZLYWZCZWRoRUtjYSs0ZEE4VU1UU2JVOXRQRGxMM2l3MG02?=
 =?utf-8?B?alEyUk4yb1AvczNpRmJBZFR0a1pQYzNJUUw1WnZsMVpzK29iYmZvVWpxcFhS?=
 =?utf-8?B?NDFaRmdXTFR2VjNxcWJadW1wMmcweHNnMEpJdTliem5RejZXRlBUelBlZkpu?=
 =?utf-8?B?RDBQZ00wSi8yNEo4N1FYNTFOYVM5eE5QMU8yd1Z4MmpTb3FLUUVEZkJUcWJX?=
 =?utf-8?B?cjc2MlNmcXhZQ2xrL1RobkV5cFJaMUlZVldSNmRhbGRDOXpKYi9TWnlUMlRt?=
 =?utf-8?B?REZuc1hKQld0NkZjZWNCZ2VvT2tuZEFPMnZXR1pNa24rTnIwcTRPcTUyVVVj?=
 =?utf-8?B?blRHMFVTTElHVkE5RzNJMmcyZXVsYXJHRkhiL25SNDJyR2JBUkI2U2pIVVVv?=
 =?utf-8?B?UFQwQ2dETzBtUWs2cjgzSTVCbG1CNnppei9rVG9CVGFFc2xrT2xpZXBNaG5m?=
 =?utf-8?B?MVpNTEpzTGJUUlRJSUJKbkthNGZwYTQxUnU1TUhWNWFOUnJSMHdaZzh6VytD?=
 =?utf-8?B?d0N4VXdEN1M0QXl1d3VLRUZ1RnZsd0NLWVpLcU93S0s5MlVTTm44T3lVRVpw?=
 =?utf-8?B?STk4UU5RdmJHeEZSaks3S3NqdTlhTVh5WFZDTk5wbjM5c2lMWnRBa3JIcVhx?=
 =?utf-8?B?QkFDM0RxOTZZdFptVmFaMUZBM0pYTGNwNDVCZnUvTTJnSWd5bS95YnVJMjRO?=
 =?utf-8?B?T2c0Nll3YVd2QUNnSnRQRXFmTi81MkN0WnhiRWJEbS9samNUTndzVVpxaThZ?=
 =?utf-8?B?eE5kTjE5cTVvSW53THFvOUF1bUY3NlU2MEtEek5acnYzVm9LRmRsOHJjRUJB?=
 =?utf-8?B?ZVlQNWhYckVudzJPMm4raW9Ed3hUaEMrMmdBWm94UkhiSlk4M1M2OG1xc09C?=
 =?utf-8?B?V1hVNWxFcS8rNFR2L0dSUE5FaFFBYXMvbElVbkVNcHo5Q050aFZMZmprc3FJ?=
 =?utf-8?B?cFAvOVdFMUcrcHhKbVduSVVNUnVZcTRqV0Jpc3Q1RmhoalNtdGdPTmJqVXV3?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2bcf14-f2ab-45f1-f9de-08de04d9b8c0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 13:10:28.9341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cyq5wt8EesipdpxiZ7w6dr19EfV+lhbKsWoghuYNkBRzQoS+ohXNheHweAbEZWUtL8RXxcZr3AVhAfEMqAkpxyMuurN1tKIormH2s6AP98Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9448
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



On 10/6/2025 1:10 PM, Matthew Brost wrote:
> Add xe_gt_recovery_pending helper.
> 
> This helper serves as the singular point to determine whether a GT
> recovery is currently in progress. Expected callers include the GuC CT
> layer and the GuC submission layer. Atomically visable as soon as vCPU
> are unhalted until VF recovery completes.
> 
> v3:
>  - Add GT layer xe_gt_recovery_inprogress (Michal)
>  - Don't blow up in memirq not enabled (CI)
>  - Add __memirq_received with clear argument (Michal)
>  - xe_memirq_sw_int_0_irq_pending rename (Michal)
>  - Use offset in xe_memirq_sw_int_0_irq_pending (Michal)
> v4:
>  - Refactor xe_gt_recovery_inprogress logic around memirq (Michal)
> v5:
>  - s/inprogress/pending (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.h                | 13 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 27 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 10 +++++
>  drivers/gpu/drm/xe/xe_memirq.c            | 48 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_memirq.h            |  2 +
>  6 files changed, 98 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..5df2ffe3ff83 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -12,6 +12,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_hw_engine.h"
>  
>  #define for_each_hw_engine(hwe__, gt__, id__) \
> @@ -124,4 +125,16 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>  		hwe->instance == gt->usm.reserved_bcs_instance;
>  }
>  
> +/**
> + * xe_gt_recovery_pending() - GT recovery pending
> + * @gt: the &xe_gt
> + *
> + * Return: True if GT recovery in pending, False otherwise
> + */
> +static inline bool xe_gt_recovery_pending(struct xe_gt *gt)
> +{
> +	return IS_SRIOV_VF(gt_to_xe(gt)) &&
> +		xe_gt_sriov_vf_recovery_pending(gt);
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0461d5513487..86131ee481dc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -26,6 +26,7 @@
>  #include "xe_guc_hxg_helpers.h"
>  #include "xe_guc_relay.h"
>  #include "xe_lrc.h"
> +#include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_vf.h"
> @@ -776,6 +777,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_pending(gt));
>  
>  	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>  	/*
> @@ -1118,3 +1120,28 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "\thandshake:\t%u.%u\n",
>  		   pf_version->major, pf_version->minor);
>  }
> +
> +/**
> + * xe_gt_sriov_vf_recovery_pending() - VF post migration recovery pending
> + * @gt: the &xe_gt
> + *
> + * This function's return value must be immediately visable upon vCPU unhalt and
> + * be persisent until RESFIX_DONE is issued. This guarnetee is only coded for

2x typos

> + * platforms which support memirq, if non-memirq platforms support VF migration
> + * this function will need to be updated.
> + *
> + * Return: True if VF post migration recovery in pending, False otherwise

"is pending" ?

> + */
> +bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	/* early detection until recovery starts */
> +	if (xe_device_uses_memirq(gt_to_xe(gt)) &&
> +	    xe_memirq_guc_sw_int_0_irq_pending(memirq, &gt->uc.guc))
> +		return true;
> +
> +	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0af1dc769fe0..b91ae857e983 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -25,6 +25,8 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> +bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
> +
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 298dedf4b009..1dfef60ec044 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -46,6 +46,14 @@ struct xe_gt_sriov_vf_runtime {
>  	} *regs;
>  };
>  
> +/**
> + * xe_gt_sriov_vf_migration - VF migration data.
> + */
> +struct xe_gt_sriov_vf_migration {
> +	/** @recovery_inprogress: VF post migration recovery in progress */
> +	bool recovery_inprogress;
> +};
> +
>  /**
>   * struct xe_gt_sriov_vf - GT level VF virtualization data.
>   */
> @@ -58,6 +66,8 @@ struct xe_gt_sriov_vf {
>  	struct xe_gt_sriov_vf_selfconfig self_config;
>  	/** @runtime: runtime data retrieved from the PF. */
>  	struct xe_gt_sriov_vf_runtime runtime;
> +	/** @migration: migration data for the VF. */
> +	struct xe_gt_sriov_vf_migration migration;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 49c45ec3e83c..56acfdd77266 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -398,8 +398,9 @@ void xe_memirq_postinstall(struct xe_memirq *memirq)
>  		memirq_set_enable(memirq, true);
>  }
>  
> -static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> -			    u16 offset, const char *name)
> +static bool __memirq_received(struct xe_memirq *memirq,
> +			      struct iosys_map *vector, u16 offset,
> +			      const char *name, bool clear)
>  {
>  	u8 value;
>  
> @@ -409,12 +410,26 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
>  			memirq_err_ratelimited(memirq,
>  					       "Unexpected memirq value %#x from %s at %u\n",
>  					       value, name, offset);
> -		iosys_map_wr(vector, offset, u8, 0x00);
> +		if (clear)
> +			iosys_map_wr(vector, offset, u8, 0x00);
>  	}
>  
>  	return value;
>  }
>  
> +static bool memirq_received_noclear(struct xe_memirq *memirq,
> +				    struct iosys_map *vector,
> +				    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, false);
> +}
> +
> +static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> +			    u16 offset, const char *name)
> +{
> +	return __memirq_received(memirq, vector, offset, name, true);
> +}
> +
>  static void memirq_dispatch_engine(struct xe_memirq *memirq, struct iosys_map *status,
>  				   struct xe_hw_engine *hwe)
>  {
> @@ -434,8 +449,16 @@ static void memirq_dispatch_guc(struct xe_memirq *memirq, struct iosys_map *stat
>  	if (memirq_received(memirq, status, ilog2(GUC_INTR_GUC2HOST), name))
>  		xe_guc_irq_handler(guc, GUC_INTR_GUC2HOST);
>  
> -	if (memirq_received(memirq, status, ilog2(GUC_INTR_SW_INT_0), name))
> +	/*
> +	 * We must wait to perform the clear operation until after
> +	 * xe_gt_sriov_vf_start_migration_recovery() runs, to avoid race
> +	 * conditions where xe_gt_sriov_vf_recovery_pending() returns false.

nit: we were trying to make memirq changes VF agnostic, but we failed with this comment ;(

also the "avoid race where X returns false" isn't very explaining

maybe more general comment could be that: 

"this is a software interrupt that must be cleared _after_ it's consumed to avoid races"

nit: and since we have 

	xe_memirq_guc_sw_int_0_irq_pending()

maybe the alternative flow could be that clearing is done in explicit call to:

	xe_memirq_guc_sw_int_0_irq_clear()

so from the memirq API POV it will be visible that sw_int_0 is not cleared in usual way

> +	 */
> +	if (memirq_received_noclear(memirq, status, ilog2(GUC_INTR_SW_INT_0),
> +				    name)) {
>  		xe_guc_irq_handler(guc, GUC_INTR_SW_INT_0);

		/* SW interrupts are cleared _after_ being processed */

> +		iosys_map_wr(status, ilog2(GUC_INTR_SW_INT_0), u8, 0x00);
> +	}
>  }
>  
>  /**
> @@ -460,6 +483,23 @@ void xe_memirq_hwe_handler(struct xe_memirq *memirq, struct xe_hw_engine *hwe)
>  	}
>  }
>  
> +/**
> + * xe_memirq_guc__sw_int_0_irq_pending() - SW_INT_0 IRQ is pending

double mid underscore

> + * @memirq: the &xe_memirq
> + * @guc: the &xe_guc to check for IRQ
> + *
> + * Return: True if SW_INT_0 IRQ is pending on @guc, False otherwise
> + */
> +bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc)
> +{
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	u32 offset = xe_gt_is_media_type(gt) ? ilog2(INTR_MGUC) : ilog2(INTR_GUC);
> +	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&memirq->status, offset * SZ_16);
> +
> +	return memirq_received_noclear(memirq, &map, ilog2(GUC_INTR_SW_INT_0),
> +				       guc_name(guc));
> +}
> +
>  /**
>   * xe_memirq_handler - The `Memory Based Interrupts`_ Handler.
>   * @memirq: the &xe_memirq
> diff --git a/drivers/gpu/drm/xe/xe_memirq.h b/drivers/gpu/drm/xe/xe_memirq.h
> index 06130650e9d6..e25d2234ab87 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.h
> +++ b/drivers/gpu/drm/xe/xe_memirq.h
> @@ -25,4 +25,6 @@ void xe_memirq_handler(struct xe_memirq *memirq);
>  
>  int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc);
>  
> +bool xe_memirq_guc_sw_int_0_irq_pending(struct xe_memirq *memirq, struct xe_guc *guc);
> +
>  #endif

few typos in comments, with those fixed:

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

