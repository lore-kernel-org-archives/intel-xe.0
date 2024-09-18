Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0672CCD18B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 08:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A98A10E553;
	Wed, 18 Sep 2024 08:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsC2ls0S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDE810E553
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726646784; x=1758182784;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7NA6M8WQjXh9pSs4YrbC5uWrVp8zY1DH1xiCOz9sqow=;
 b=ZsC2ls0SDTjKvnFmv1Etqcs+ZNTzME4al8HJKkypicC+2wm8IkSDEoeA
 obYEylrzJkP9iMby00K1LtZ/4iWwJdjGcjOXGHqWHmXo6JVe+J3m9GGbJ
 rYxhMJbux+Doq/LTUn8leJK+H3FMh4VeeCcvtykbOLBoWgEriRdUH98EH
 LdthQ8APkHBhUQfh7xJA+0Ufj1ACyJFpxEx3ENNJySmi20oDP/bjZGdTy
 5O0+UKjCL3OArIRPOGp3u/ltPm2WGjW7f6jeB04p50aOpofH+s5zypoFN
 z4P27WPt5+fJwCMIkzW8dNJfnpdBIC7gVdmQy++Z+5ndlw8em97eZyt7j Q==;
X-CSE-ConnectionGUID: Ye4rvWANQq62E319OjIbmA==
X-CSE-MsgGUID: AJfsp6raT7+twvXGuDlw7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36679522"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="36679522"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 01:06:09 -0700
X-CSE-ConnectionGUID: O8eYhdlHSoqg7mByacF6OQ==
X-CSE-MsgGUID: 6FXf6SUwTGKET9knHTJLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69103491"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 01:06:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:06:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 01:06:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 01:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6w61KfqRz/jaXZ0gsOchoSwoYPhwemje3eNymBVqCDwUbB76vMPdiuPiGPMCCXPSRPiJYLXitQ/voGmbm3x3j8/vdqhg0j4+blytPCPY3mo6wFAZ7aYJKlwjFyFzJsPLE8bchUGjPEn7btkS1W/pztlWR4eN6uJeC3SpNB085HZ63/2uWcV5sbdv9AqEitPX3G+SeAr2f46K3HXyqc/usRWNRFJU+CVlToeARv1K03aFCYGMFd+q9w/cEB+czEstbDqcCFWK9JGH+VYCXkarPpB99GQjDMR1v96ajreGzBhU2je3ePwhxf6gGjGWQAM9uC+wNXqCMBZDzRmVXpHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxFhnWCwDDuq0zpwPmm1Rk2ZnMlTWrIyKdqQ7BpPy3U=;
 b=bFiHAOiHs3nIj2lCceX1/8M60gj9Hw7P7s1KGTC3M9sUpSICVNFb7Tppg4GdmMgdYwQn94tR71l3IwginYLFG6VKhXE4xmzvw7PDtJVCjfWrInUqlY188wnEge3kJfpAGjG4cbXi7MFTDrwjjcAXxxynB7jHIOksKDdoMPtrW1jULKUarpeqBMftkUGRM8OvqV6BnsnPRk+fnUUjZqrqVkWZArxFrI23sQPsoa5TUGv+Dx/jgQMfDyPdvauejkV2CPvAY05lXp4OFwcnMVM3wl1wIiUzZVRaoKxYU1O4ojeOiHZB9sHpTh7mQqZaarbH+wHyqboz4iPwfNUv6fXFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Wed, 18 Sep
 2024 08:05:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 08:05:58 +0000
Message-ID: <5d7bd410-5576-4add-a7f3-4da14abe6b99@intel.com>
Date: Wed, 18 Sep 2024 13:35:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Convert to USM lock to rwsem
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240918054436.1971839-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240918054436.1971839-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: 2957a973-6974-4b06-7e7a-08dcd7b8ba39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEZoREZ4SjVkTDZnc1Q1K0Rxb3ZEbWRhTjFKOUhBekYvV1J3SFI5VnZpTmda?=
 =?utf-8?B?Q0c5eWVkdU9xVmtnOUtFZG53aVVGT25UYzN3QnplWVVzMFJmQ1VzMzBKekI5?=
 =?utf-8?B?NDJ1MUV4cXVvV0YvVDlEcDFXQmhYc1BYa1dwKzFwTVZBR3hGV1I5WFlXZWI1?=
 =?utf-8?B?bGpwUDhkWlAwQjRGdUwxYUpKMXV3VWYzMUlUN1F3RGZZUkx0ZkRJWVhYWUp2?=
 =?utf-8?B?REdvdjhaNTdRTFVTdHNvK1NKS2ppRXQ1ZFBvUmlwN09mVnkzbWhMR3dGY2o0?=
 =?utf-8?B?ZW55eUNpTS9zSDlZZU85cFkyL3JQYndqbXFiVk5MTmMwQTdGS0lRdHNvMzZa?=
 =?utf-8?B?Z204bjhiUGJhMUlVMVNQQmZNNEltQVNwYkF2Ky9VbS9LT1VSTG5KaUxVVTNB?=
 =?utf-8?B?OHY3TVk4ckQvSUdaN2ZRN3RhSjc4Z1oybnlkZHd0eGNsZnp1aWlxa3dwcm9s?=
 =?utf-8?B?d1RHQytVb2xOZW5PWUNiSGJiS0s5elhRYmFRYXNGdTM3ZTNoR2dnSXBOS212?=
 =?utf-8?B?WlowdHRSYmovQk1qQ294RlBvUlAwNnNCZ01BeEV4YmU0Mm9vQnovT0lrSUpx?=
 =?utf-8?B?dVN3cE1TOXRCUjNvNkRxSTlubURXZmE1bUtaSEdNL29VNzF3TGxja0FrRkdD?=
 =?utf-8?B?aXVrQ256YmJiOFlVNFh1Y1R5TmphQUVDTG5LdzdWYmRkWmxJdlNCMU1UeG54?=
 =?utf-8?B?VExpeHlzVkFrR0dQbzVOYWNBenlXd3JBRmRWUmhiZUFidFczMzNZTEZNTy9p?=
 =?utf-8?B?OVduSlBZS3d3aG5nQitjckNLQ0RMdVUzcGRzVnVrRE0zZUxMY3JyQnNzSjkz?=
 =?utf-8?B?MGNVL1dTVmR6OGZjYm0xUlFDNmNTWURjWkVaZDhPejNVSFhMWlE1UHZWT0Rj?=
 =?utf-8?B?UTltZUZXQm1ETk5tdVoyYThjY29QOXFzSE8wajBLbzNEd2dJdHhBbllUcFFO?=
 =?utf-8?B?ZnF0TTA3MEVRSFNra1R4V0dxekxLZUN1Zmt4ZVpqTnhuN3RyY3dmMXRtYW1Z?=
 =?utf-8?B?bzlKSlcrWTAvSmRiUUJXcWVKY3doeHhRUnZiOE9YcE1LbG1yeUVNQ25hQ25S?=
 =?utf-8?B?ZngzYUVNcmRONjYraGJ5SzN2dWc5UXV0RFl0dCtqcTlQdjg2NlVNYkxzTjJS?=
 =?utf-8?B?UUpPelNqVkh2LzVRanQvRFNRamgwdldMbURMekRnUHIydXlJd2xpL08yYkl2?=
 =?utf-8?B?TVozK0h3MjZpVngxTmY3a3oyTHMvUWU5djYwY0M3RnQvVmRoMmI1YnJYVHlM?=
 =?utf-8?B?bmgva3BLZ2pPc1ppc3Z2WHRqOHVRMjdNeGxNSzEzbmlJV0hLZzByeHlDb0Jp?=
 =?utf-8?B?ZzlJOURjYmJBR0p1NTN5S1MweFNLVENwY1Vmakc4WWZIZ0NCNERUZEZPT3ov?=
 =?utf-8?B?UmtmYmt5dkN2dEcrWTkxak5UaUcxNGg5VGFWbTZFMHdIbVoxN3kwK20wUWR2?=
 =?utf-8?B?TFpNNWNNekF2SFlpWkFlUHA2UWNTR3RlUlZjd3lNU0NSS3ZWMVZNV29vRkFX?=
 =?utf-8?B?NS93c2Z1eTR0YUMrYW5MOU9oMnBxV0I5cmJYQVZJZDhveFF4TXhQWFg3ejhh?=
 =?utf-8?B?RmdETVNXMS8wOXcwR1lKMmFVd3ltUmdhOVVMZHI1NXBncW94c214a3g0bEox?=
 =?utf-8?B?QWNJT1dVc0lTY1dQZjczQXZZSzJITW95UWNVc3EwbFc3Qjd3MkJnNTBiUmNo?=
 =?utf-8?B?Sk4xM09kd1Z3MDRKMDE4Ny9hNFlQMUNqVnNrSDBja25mZjloWTdmQ1VjZlo1?=
 =?utf-8?B?ZnVOc1NZZXFtdzVCWFZMZ0ExMVFDSzZ0bFpBazIyS0p0YlRCR0pIMlJRLytS?=
 =?utf-8?B?NExHdXJZL0JKeWk4bm5JQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtPN0Y1bEIxM1ZTOVNqUkF6M3d3TUVwdm5iMjJEKzg5YXgvc2xQc1dLN2U1?=
 =?utf-8?B?NHN1Mkx3bythMmR0ejdZNnhxYjVyUXM1RWt0S21Ocmt1OCt3QXh1c2U1aXl1?=
 =?utf-8?B?QUR1QjVlTzR2Qk5rbXVYSUxzaWJVdlVEdkN4SEZUZlFYMmZEUFpZblYrOHJ0?=
 =?utf-8?B?em10aThjWGl3YXNsc1QwM1NkVHNGZVoyMnUvS0JKRTdhV00vdW5WZlBNbktO?=
 =?utf-8?B?TUkrTEtFT0ZzNWpwT2VhbndEcWNFSlpVTTJnY0tPYTRLZ3QvSWRWUDFaeXVL?=
 =?utf-8?B?aTNadFVDa084ZjV4KzVSZlVyUW9ETk4yVFR0b3ArU1JLem1xUjMyTjJlanRx?=
 =?utf-8?B?eERTL1I0L0xkYkhQa2gvYWt1Y3RUQVdHL2srai9qeHVEUC9QMmgzUEZKWHBU?=
 =?utf-8?B?QWFodUhZaXJNZzRRSlJYZjN1dlluKzUwMmh2UjljV1J2TDhDRitEQlFkdVhz?=
 =?utf-8?B?ZXJJdzZ3S2dxUVJtdGt6cjN1VFNLT2dsRjV6a2NJZ3RVZnM0SmNWbXUwZ2Jy?=
 =?utf-8?B?N1JaRzJNVnNpbXFBMWp4eHBBM3pneHhsM1F1T2RwSnFPR29SWW5mSDNnNDdm?=
 =?utf-8?B?U0FONjdIcUJYUVM2amhraTh3YWhITXJMNHI5SUNqOXE3MFVBeG1QNmU0Qk9V?=
 =?utf-8?B?NFJuM0lwQnljUmNGZzhDdktxRmFTQm1rWEg1RXpIZEM0UUplYkZSMFNIZks5?=
 =?utf-8?B?WDdEdDRFN0dxUit2dnhyTDNHUmUzMjBLMzQ5cUFyVk9TVnhoMVJ3TWVWMDI2?=
 =?utf-8?B?VUlVMDJWVExjNjR4czRSd0lFY2RELzhQemRMK3NYVlZQeGxKVDdkeGl6TjBm?=
 =?utf-8?B?N2JOejZmUHhBNHRubU1kOU5uYTRBTDV4N1lnZHMxYVFhZVh1NCtROURQdExE?=
 =?utf-8?B?WmZKZHlUUTlJV25lci9ZRG1iOHd6blJCTm1GbHBSeDZWTEtyZ1NxMlBBa292?=
 =?utf-8?B?ZERwb3pHM0poOVdURXdGQlFUOVlXRXh1L3hZVzh0aFhNMmVmZVpOQVdOZjlp?=
 =?utf-8?B?bTlmdlQ4TEhtOTExUW9uMG04U3diUkdVNk5uL2o4SG1vSkpxa05tR2k2Q3hR?=
 =?utf-8?B?RElyTjFnSzNMUG4vcE1UTjY4SjZkS0h0T0RaTkx3ZUwvazI3TWY5b0FoZzBJ?=
 =?utf-8?B?Tmc3OGV5bldBUFc1Ukh2TlMyUTZaM20zbGhQSWFURUxadTgrZHVhWHJNVmR1?=
 =?utf-8?B?Zy9oNGNGMjN6ZWZ3bzI5VmlRa0NVQVppUUZ2dXorZ3k3MS9PVzJ0bGs2Ny9R?=
 =?utf-8?B?UVlRK0VFekcrejJwY2VzbEhQK296UHNsaDNaRHhkWTVrQURLZDJwNEdVMjhr?=
 =?utf-8?B?TVNMeWFOTUEreXpKVzVIOFZVYTcxZW53YjBBNmNTRUlHV1B0di9CeEx5NXVM?=
 =?utf-8?B?RTVCeWlUWkMxNytrMmJ5Y0U5eVpJdnZOMU54L0lxcFdjeTdMUUllTVRLcElW?=
 =?utf-8?B?QXpDL045K1E4amNTemJkRnhra3JKcE9XV1F2NEZsZGJLZUdJSklhT2VYN2Rq?=
 =?utf-8?B?RW1VczBIbWRBWFlPQ2JOSUlEbVEwdFNBZ0k5cnJQMFViNElVVXFSbDljRjFw?=
 =?utf-8?B?WjZQMHFvREgwaUUxdTZFNGZWYjZKblJTNzF6NEVHQm93YzlrWmtKbkduVGFl?=
 =?utf-8?B?T052V01oRFBlazNvNHBpTzFDQ2hpcjRKMnpERjlpSTNNZm55WEcyaWxkdXds?=
 =?utf-8?B?WnJma0t6dlJxd1g2ZnZCSCtTTGE4TDRaTCtSb2ZwTFNjOWk0REpaTEo3Y2Jq?=
 =?utf-8?B?NFRGU2VjTFkwUDNCVHNXZWRubWRvUHNnQi9vMWRKa1MyS2R3MjczTXMxVUUz?=
 =?utf-8?B?Q3ZiSk5CYVp3SFZCZDE1aS9TZURBM1Z3UThDREFTeVcraDFQY1ZQTkU5aE5p?=
 =?utf-8?B?cjgzYXJHeUFrUTcwQVNiK0dMWFJCNVkrVUFpdDBnWk1kWjQzZUJQeWRIMzJT?=
 =?utf-8?B?aEhCQzRGMmdRcGZyY1BDVk9IMkFjWXZVU3ZUekZSUEpCQmRmeHZ0N3duUnFT?=
 =?utf-8?B?aGI1YUVINndLMnBCRE1BRjlVeHU0bGNCbVFSdnpaZlN6ekdVL1ZldVNGS3Az?=
 =?utf-8?B?SGkzVGQySXdLVnpyZllEcmlyUGh2MU1rNjRPUmxrcnFqV3Z0UkUvTVpaY21X?=
 =?utf-8?B?cUxjTERjQmdSR3hkaXlQWHQxVytQM2txUkNKMloxclk2TXJFUlJLTVhzVWVK?=
 =?utf-8?Q?DW0JxAnswo4y+cqbY9Kd8ms=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2957a973-6974-4b06-7e7a-08dcd7b8ba39
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 08:05:58.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATP7IwDM26GWb0wKB9jLdeM4YHKG4sh99tUxRsR8S1Pu4+STlY2ZwEkPq+Ltvl8013rCmS9liwrwJUEHozTW7WTpXoNtU/eGMDHjSPrT22E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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



On 18-09-2024 11:14, Matthew Brost wrote:
> Remove contention from GPU fault path for ASID->VM lookup.

Usage of rwsem ensures, vm lookup is blocked only on vm create/del 
instead of vm lookup or (xa_load) while maintaing XArray in consistent 
state. This makes a lot of sense to me.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 4 +---
>   drivers/gpu/drm/xe/xe_device_types.h | 2 +-
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 8 ++++----
>   drivers/gpu/drm/xe/xe_vm.c           | 8 ++++----
>   4 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4d3c794f134c..38eade07a004 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -335,9 +335,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   
>   	init_waitqueue_head(&xe->ufence_wq);
>   
> -	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
> -	if (err)
> -		goto err;
> +	init_rwsem(&xe->usm.lock);
>   
>   	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c92df0a2423f..4507a5756a05 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -395,7 +395,7 @@ struct xe_device {
>   		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
>   		u32 next_asid;
>   		/** @usm.lock: protects UM state */
> -		struct mutex lock;
> +		struct rw_semaphore lock;
>   	} usm;
>   
>   	/** @pinned: pinned BO state */
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 00af059a8971..5c3af2bb5402 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -198,13 +198,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   		return -EFAULT;
>   
>   	/* ASID to VM */
> -	mutex_lock(&xe->usm.lock);
> +	down_read(&xe->usm.lock);
>   	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
>   	if (vm && xe_vm_in_fault_mode(vm))
>   		xe_vm_get(vm);
>   	else
>   		vm = NULL;
> -	mutex_unlock(&xe->usm.lock);
> +	up_read(&xe->usm.lock);
>   	if (!vm)
>   		return -EINVAL;
>   
> @@ -549,11 +549,11 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>   		return -EINVAL;
>   
>   	/* ASID to VM */
> -	mutex_lock(&xe->usm.lock);
> +	down_read(&xe->usm.lock);
>   	vm = xa_load(&xe->usm.asid_to_vm, acc->asid);
>   	if (vm)
>   		xe_vm_get(vm);
> -	mutex_unlock(&xe->usm.lock);
> +	up_read(&xe->usm.lock);
>   	if (!vm || !xe_vm_in_fault_mode(vm))
>   		return -EINVAL;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7acd5fc9d032..a3d7cb7cfd22 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1613,7 +1613,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   
>   	up_write(&vm->lock);
>   
> -	mutex_lock(&xe->usm.lock);
> +	down_write(&xe->usm.lock);
>   	if (vm->usm.asid) {
>   		void *lookup;
>   
> @@ -1623,7 +1623,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   		lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
>   		xe_assert(xe, lookup == vm);
>   	}
> -	mutex_unlock(&xe->usm.lock);
> +	up_write(&xe->usm.lock);
>   
>   	for_each_tile(tile, xe, id)
>   		xe_range_fence_tree_fini(&vm->rftree[id]);
> @@ -1772,11 +1772,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   		goto err_close_and_put;
>   
>   	if (xe->info.has_asid) {
> -		mutex_lock(&xe->usm.lock);
> +		down_write(&xe->usm.lock);
>   		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
>   				      XA_LIMIT(1, XE_MAX_ASID - 1),
>   				      &xe->usm.next_asid, GFP_KERNEL);
> -		mutex_unlock(&xe->usm.lock);
> +		up_write(&xe->usm.lock);
>   		if (err < 0)
>   			goto err_free_id;
>   
