Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DA4CD343B
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 15:46:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD1B10EE03;
	Wed,  6 May 2026 15:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BwGLJUWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE81910EDED
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778082401; x=1809618401;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hGBJytac3ERAqtIeewuBqJ6X0gqXyzsdqPWU+4E23BI=;
 b=BwGLJUWMZtgfqHfbctu6t1Lt8kNMCazVdAofd/sok1sD+sV7NClObAk0
 t3eXFsELqSn151P7NJec2/pOpCi32MF/MS+GCizJsvllfKKYl6Q4GfDjn
 UWKEdy3QBBkz3egm3GpjZDKrXoLl6Vgw4ByrYtq7Py288TpfhFehQ98Gt
 23q5YxdArITEJtDUwFFSb5banOEplkyw51LdOwD9UmOjythM88I9IgsU2
 1vI27Vlxn0eLTWcmw7LPi6UlKXeCLISQ7filcMiNq5NihR06JFp4qi2UW
 DUDz94FLwEInMXVhaGM/BDSaa1NfuZLZwlKKXbN1k68gE2tuHEJur2NIL g==;
X-CSE-ConnectionGUID: 9KDeouCjTxWQ4Qtk/ZGXeA==
X-CSE-MsgGUID: 6eLzKyXLRtSS0L8dX/T6nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78044997"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78044997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:46:40 -0700
X-CSE-ConnectionGUID: TVkPte3EQqGpp49aTDrq7A==
X-CSE-MsgGUID: Qub2ADr8TQC19oRt67eMmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="241164975"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:46:40 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:46:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 08:46:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUvRytuF7WRfyJStTg/5tiaiiNYU8Odr+CzxztQEPcSHaoJoO4RdHvg4zyWqtHXQdS5kLjG9r7FCtg9fFO/CX0ba7zytC6PMgY4LROhujIQ1E6YqdxQ5DKL7kD3USRnVfmr3a1ELLgXxANn+1w4N8+0KcxkGlAKMmmpDRQd3hj9hWGBa5WCYBc7YIj1JpMAJDj0CdGpxG2QYxgQU+Z9Mc+FIC72c+V32u9RdBVvBlWXjlQFbEV7TYZ0fvKw+Qws5qTpeNsIs0Sy6/4eSn9bFffPAYmpTx+9+DfcDaM2an2d7XoOTBK0TzUSbSCSaT+QfJeWSwMES9cGbeH7TTMKbbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir703MSPaFzipZ63vyWC1vGrHwhxyjp2lLZv1dXDYhI=;
 b=cofYsLmMcsvVUizFELpy3Jb/28GWqJeR/3e1GaVRq9zH6FzDhz64+H/JdhHuvp3L3WbkHMePodHGHFh7AyvUJ8s/KTzIjJaVdjQFqwh9jAXmUFlPFPjJRofzpBXKROq1QzE+Cgn1Gl+Ap7xYRXq6JJRisrlPNAUXEn2YaSXYEv7jBwdfyUTM12r2UNS+ye5Kw4zqcbRjkc2l6Ijgm/8zy6RmKxCl3Xt2Ur2s8eoPFNTtLjxvuLhcDIkI2uqu//tNZTWW3efHa5ilLR2m7rztQ3E25LuriyECxVIYB7Lh7DHsjkVcrrbUSizgs75ciLU7SkcOMYkNsUJEIp2ZLG7mMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 by PH7PR11MB7074.namprd11.prod.outlook.com (2603:10b6:510:20d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 15:46:37 +0000
Received: from SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803]) by SA1PR11MB5900.namprd11.prod.outlook.com
 ([fe80::d294:7b1f:a7a2:e803%7]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 15:46:37 +0000
Message-ID: <59b9532d-68ad-42b1-b7eb-c693b648b564@intel.com>
Date: Wed, 6 May 2026 17:46:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/12] drm/xe: Use a single page-fault queue with
 multiple workers
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <stuart.summers@intel.com>, <arvind.yadav@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <francois.dugast@intel.com>
References: <20260226042834.2963245-1-matthew.brost@intel.com>
 <20260226042834.2963245-5-matthew.brost@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260226042834.2963245-5-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0304.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::6) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB5900:EE_|PH7PR11MB7074:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc335e4-c6df-428a-5cf6-08deab86a849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: iXT9nJg8/DxIcfuMg5Xf9JrWNba9mHj2M71vb4e5vkPEW7oVr5SMZURDShNRFho0z2yMId0nkfzksjzN3gUhEMAG0KoAKuuxS4RB5nfwE5bzgHjZ4uqZkcxD7RCjhUSF6jR0KC7U1MIqc/FyIuRJCJEpG4GEYXYSm1b7QQZextOWX/6mNoajPDBMOVuxW8SmcEBDXaGQa11bmUPxv4InP2dzU37wzZALl0yCTWkWTdnVnYCHVTc5dXzJ1ljWGF4lFkRS9BhAlmm8JgactXPm+Jb71Bl0LOMJZ967Eas1ISZYmR91fgyVciWP50kSsZ6VU1eoFC5PejmVGMGmibMnAz18iAYzyHamg93XMtzkOfB+6cdBFs6G3C9TO5iNq+cqrs2fxUHACt1SPsR8mzTM8+BsNz0tz6tJSvGmnfNHdwDg01tcGGghaaa4Oka68ZFS9uK8jBB62S4KycuaR/FsMPM6WXwH5S+HNU8GdyXIn8/MWZ0s/6gqnrGhbsBnt5enm54EGHv5JXGZUXAWLke+d3/oWzswZkN1lUQk91727XaMYy21SiraMM3lb1jwsBy68iZ3Yu7Umhn2OY+NX+AAXGD6vT5UVQ9bE6yoFp9BC7JvAGbtb0zLtsQSGbhS7+h9yTKS00jH+i134MjYbuWgNb4zSbXYyKj18NAgde70i2SfrAIjxha1sFntRDWKS5eE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB5900.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEY0NTlCc0p5MHhYNG8wZHNiUlpsZTNxWVA1ZXh6SzhFQ2YvSjd5c1I3WFlR?=
 =?utf-8?B?bys0MzFkMDl3Titha2UwS1ZVMWd5SGwwWnU0emtPaEsyYWRic2t3Z1hrR3dy?=
 =?utf-8?B?d3pRdTAxUXdxMUp1K0RtbHRreEJSanpFNjcxUGdjTzJvTWhETi9kSy90SGV2?=
 =?utf-8?B?dnFwWmltMVluUjVMcHF0L0dsR3dwQjN3aERyVmtpUytFblQvWjdGcHJaL2ph?=
 =?utf-8?B?N0ltQXRDOVI3bUxWR1ZzTllvMHprL0R3TEg5UjM4OHhiT2FPVjc3bFUrUGZt?=
 =?utf-8?B?UTJVWGFIMGQvTTFPLy95b0lXcHlNVmdVN05KMjl1MDFCL2kzdWN5WjlJNWVk?=
 =?utf-8?B?dEN1ZVJVb21rcmh0U2hleFFqN004OVJPT3lOOVpxRVd5YjBYVU1TVGQ4NHBZ?=
 =?utf-8?B?SzFXb3g3U1FTeWdvbkhFZG05UVFOcGRQNW5MM2xHUnljUnRya2dtVExuOWJ5?=
 =?utf-8?B?QUNta1pvajk0MGJOYnhpekt1UitqMFNhSjVmNkg0ZnNqc0lFTXVuQTIra0Ri?=
 =?utf-8?B?cmIyS3FLSEhhRWFiOXRNSHFWQmp3TDlEclJpRG1RSDBsbWk5SmhGKzBGYTcx?=
 =?utf-8?B?OFZWY2U4NDh4VXNiNGt6K2ZCSlZTejN2VEZMbllKczJlQ1I2NXRyV21tVkVI?=
 =?utf-8?B?TjFDeEZaOEorVXRiMWxGaU9IeUNzaEJBeCt5a0FDczBmSURCTElkOFhhd0Fz?=
 =?utf-8?B?Q2JKYUFJVXJNeUM4NG9yNXEzU25wT3NYK3VERG1iaUNaekFVZnlscHp3WEdE?=
 =?utf-8?B?dVcxRTR0MS9QalQramNHZHBpYmJBM0pzZ0QyeHNja0h3UVZtNG5KalFiY1ZS?=
 =?utf-8?B?c2tiZmFzbFpQQjVjNGswSTByRHhCb3ozOStacHFqcmI3OUhiTzM4NjJORTB4?=
 =?utf-8?B?TW5JaWNlbWEyRStQeStiMTNBN21pR09pK25zY1Z1ZkpqVExrK1pPdlpsRWww?=
 =?utf-8?B?cFRFeXhwUWtiOEVJK0hBeTFraHhRdDRSOGs5NXJoNzlMY0VaM1N5UEpYUjla?=
 =?utf-8?B?OVZkNkZiTldmbTljK3BDQ2RtU1liS0lRYTNYRGlMeURLbjhVRkd0TW9uMHNa?=
 =?utf-8?B?Y2NZSS92NzVHazBKaUoxTVhNMXcyWGJkTXMxVmpRSjlnNWl5azF3MW9hU01U?=
 =?utf-8?B?cnVXYnBxNkdtckNIR0VMRkNzQy9ldSs2cU82cjh2QWdYeE9TOE0wcHhGN3FY?=
 =?utf-8?B?bGNyMG9icVBVM3l6cUlKTXBsQVROQVFKVUM0bXk3bnp6OHNCa0hoSWs2Nzkw?=
 =?utf-8?B?Y1M2aHR1dzgvSERXU2JyK0w4QTdZengzS0Jha1RrREtqcnV5bGRIQkRsNFBj?=
 =?utf-8?B?ODZ5bDBHVU81N2ZHMElPUmErbEdwdTcwYmdnTEtwVVZEVWF2MXBIa2tyUE1I?=
 =?utf-8?B?TWR0ZnpEUFRNUXc0QzE1RDllTnNHZURNQllydC9vQTBhMFJpU09NYmt2b3pG?=
 =?utf-8?B?NEpWbFpTNVNyWVhpWWd5Qk5ySG1RUW4yZjByTVgzUm5ZcTIvV3doT3oyVXd0?=
 =?utf-8?B?Y0hpRkNwQi9ZN1A5S0FCYzlBRkpDK3UzM1ladG5Ka3J2K0JHMFVJVmUwZno0?=
 =?utf-8?B?ZGF1SXdjOUFkekhvdGFyWDZzSjFrMzVaVUZuNTF3Mm0yRFdjd3dwR0NYWWVL?=
 =?utf-8?B?eXdZTE5jdE5kMk5rWDc1NERnejdSNXVrYm9JL2FMWE9RNmp2cnNOR3IrWEhp?=
 =?utf-8?B?RnBPVjVER3lkak5jNEpkS2RhQzZaZUU0RXN1VG0yVUo2dmFHcVdvbmFzVVdQ?=
 =?utf-8?B?V3FpWTFSZk4rTFp4ZDZwUG5RODErd2E4TkZxK3FPeFBqQ0xycC9CVkVQd0Rj?=
 =?utf-8?B?L1ZjNUYyYjNKYStHeGJYdk1ZKzN4VUtFQ1FoVm5xMmNvZU8xbVZjRGNJcldS?=
 =?utf-8?B?dHZLWUhKUERZSUNLTG8xaVVjYmltMGFJUVcwdjdubjJmYmQ3Rlo3RXN4ODla?=
 =?utf-8?B?WDZqT0hWTFJOdXpjRlNkSXdzcmdLaTQySXhESFRvU2RTS1g2QWhnRnhtYXVr?=
 =?utf-8?B?UnpmWXFienZUZm4ydXRtMVNjR0pNdXFCZFM2eHd4Zk5LM3o0YzFWbGZkWE1M?=
 =?utf-8?B?dXFGZ0NRVTBmNTBOZ2xocjl1KzBzSFhzeGxzeGx2S0dFaWhLZGVhaFZSSkYv?=
 =?utf-8?B?ajdSdExKM1hQVER0OGhVa3BVZ3lHdFAzczhRQnRKSmM4ZU1UbisrWC9XMzdB?=
 =?utf-8?B?SUtreWRoYmUxNXlpNXhEbGhQVWtEOUw5NDRnUDM3aGpYNUJNVzU2a1FPd0tq?=
 =?utf-8?B?TFlMV1Q3V0VjbE9Da2FKTXN5dWx0WURCMlJ6NXZLZzIrUmN6K0UranpaVHV1?=
 =?utf-8?B?N1YwT3dvZkxHY1NVc0xIRFV3bWhXbFl6THhFbVY4ejE0WHdkdlMrS0tNaGVy?=
 =?utf-8?Q?ycCYbMZnnXgOxCRs=3D?=
X-Exchange-RoutingPolicyChecked: B4zIlVGEsF15PL1DLCCuEvWJEUSWKBaUUVJNtsw8BSEc77/bUfbRY4KnI+OKqAyNAnRGNDWLXBsvNMRlWB3S0v32Tl2TqNMxwi3xOU+jTD12q07kUhB+DBvkcwNG96A+gy64z9YCQnWAlgBVoj/5cO59iL2gtOepR9V74NHIkrxbpWQ8f5C2K9/RrW4/yScCJKwsoZ3ghdF7TpSfaTJlbUmrTZjhYL1sOddRLNZcuwG5VmAKqPwmVJxSejwWWsCFgi43BV7qw97eApFb7Ib+S82C/I2Rw1mVfNAlvPg6WF4oIN/wM6RYBazEDt6YVIXQs293m0+taoZF8cdwJP9XNw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc335e4-c6df-428a-5cf6-08deab86a849
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 15:46:37.2696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRRhJr7TdLNxn+olY2qc9D6Xy6beVXM3u7/xlaLHo2uUhURLumBFaA3QfiKxq9Z4slm+HOJD6q7qQAKoxGWB59fMefBCDEY3tvMB6bjYXhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7074
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

On 26/02/2026 05:28, Matthew Brost wrote:

> With fine-grained page-fault locking, it no longer makes sense to
> maintain multiple page-fault queues, as we no longer hash queues based
> on the VM’s ASID. Multiple workers can pull page faults from a single
> queue, eliminating any head-of-queue blocking. Refactor the structures
> and code to use a single shared queue.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h    | 12 +++---
>   drivers/gpu/drm/xe/xe_pagefault.c       | 52 +++++++++++++------------
>   drivers/gpu/drm/xe/xe_pagefault_types.h | 17 +++++++-
>   3 files changed, 50 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1eb0fe118940..0558dfd52541 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -304,8 +304,8 @@ struct xe_device {
>   		struct xarray asid_to_vm;
>   		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
>   		u32 next_asid;
> -		/** @usm.current_pf_queue: current page fault queue */
> -		u32 current_pf_queue;
> +		/** @usm.current_pf_work: current page fault work item */
> +		u32 current_pf_work;
>   		/** @usm.lock: protects UM state */
>   		struct rw_semaphore lock;
>   		/** @usm.pf_wq: page fault work queue, unbound, high priority */
> @@ -315,9 +315,11 @@ struct xe_device {
>   		 * yields the best bandwidth utilization of the kernel paging
>   		 * engine.
>   		 */
> -#define XE_PAGEFAULT_QUEUE_COUNT	4
> -		/** @usm.pf_queue: Page fault queues */
> -		struct xe_pagefault_queue pf_queue[XE_PAGEFAULT_QUEUE_COUNT];
> +#define XE_PAGEFAULT_WORK_COUNT	4
> +		/** @usm.pf_workers: Page fault workers */
> +		struct xe_pagefault_work pf_workers[XE_PAGEFAULT_WORK_COUNT];
> +		/** @usm.pf_queue: Page fault queue */
> +		struct xe_pagefault_queue pf_queue;
>   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>   		/** @usm.pagemap_shrinker: Shrinker for unused pagemaps */
>   		struct drm_pagemap_shrinker *dpagemap_shrinker;
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index a372db7cd839..7880fc7e7eb4 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -222,6 +222,7 @@ static void xe_pagefault_queue_retry(struct xe_pagefault_queue *pf_queue,
>   		pf_queue->tail = pf_queue->size - xe_pagefault_entry_size();
>   	else
>   		pf_queue->tail -= xe_pagefault_entry_size();
> +	memcpy(pf_queue->data + pf_queue->tail, pf, sizeof(*pf));
>   	spin_unlock_irq(&pf_queue->lock);
>   }
>   
> @@ -267,8 +268,10 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>   
>   static void xe_pagefault_queue_work(struct work_struct *w)
>   {
> -	struct xe_pagefault_queue *pf_queue =
> -		container_of(w, typeof(*pf_queue), worker);
> +	struct xe_pagefault_work *pf_work =
> +		container_of(w, typeof(*pf_work), work);
> +	struct xe_device *xe = pf_work->xe;
> +	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
>   	struct xe_pagefault pf;
>   	unsigned long threshold;
>   
> @@ -285,7 +288,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   
>   		if (err == -EAGAIN) {
>   			xe_pagefault_queue_retry(pf_queue, &pf);
> -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> +			queue_work(xe->usm.pf_wq, w);
>   			break;
>   		} else if (err) {
>   			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> @@ -302,7 +305,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>   		pf.producer.ops->ack_fault(&pf, err);
>   
>   		if (time_after(jiffies, threshold)) {
> -			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
> +			queue_work(xe->usm.pf_wq, w);
>   			break;
>   		}
>   	}
> @@ -348,7 +351,6 @@ static int xe_pagefault_queue_init(struct xe_device *xe,
>   		xe_pagefault_entry_size(), total_num_eus, pf_queue->size);
>   
>   	spin_lock_init(&pf_queue->lock);
> -	INIT_WORK(&pf_queue->worker, xe_pagefault_queue_work);
>   
>   	pf_queue->data = drmm_kzalloc(&xe->drm, pf_queue->size, GFP_KERNEL);
>   	if (!pf_queue->data)
> @@ -381,14 +383,20 @@ int xe_pagefault_init(struct xe_device *xe)
>   
>   	xe->usm.pf_wq = alloc_workqueue("xe_page_fault_work_queue",
>   					WQ_UNBOUND | WQ_HIGHPRI,
> -					XE_PAGEFAULT_QUEUE_COUNT);
> +					XE_PAGEFAULT_WORK_COUNT);
>   	if (!xe->usm.pf_wq)
>   		return -ENOMEM;
>   
> -	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i) {
> -		err = xe_pagefault_queue_init(xe, xe->usm.pf_queue + i);
> -		if (err)
> -			goto err_out;
> +	err = xe_pagefault_queue_init(xe, &xe->usm.pf_queue);
> +	if (err)
> +		goto err_out;
> +
> +	for (i = 0; i < XE_PAGEFAULT_WORK_COUNT; ++i) {
> +		struct xe_pagefault_work *pf_work = xe->usm.pf_workers + i;
> +
> +		pf_work->xe = xe;
> +		pf_work->id = i;
> +		INIT_WORK(&pf_work->work, xe_pagefault_queue_work);
>   	}
>   
>   	return devm_add_action_or_reset(xe->drm.dev, xe_pagefault_fini, xe);
> @@ -430,10 +438,7 @@ static void xe_pagefault_queue_reset(struct xe_device *xe, struct xe_gt *gt,
>    */
>   void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
>   {
> -	int i;
> -
> -	for (i = 0; i < XE_PAGEFAULT_QUEUE_COUNT; ++i)
> -		xe_pagefault_queue_reset(xe, gt, xe->usm.pf_queue + i);
> +	xe_pagefault_queue_reset(xe, gt, &xe->usm.pf_queue);
>   }
>   
>   static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
> @@ -448,13 +453,11 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
>    * This function can race with multiple page fault producers, but worst case we
>    * stick a page fault on the same queue for consumption.
>    */
> -static int xe_pagefault_queue_index(struct xe_device *xe)
> +static int xe_pagefault_work_index(struct xe_device *xe)
>   {
> -	u32 old_pf_queue = READ_ONCE(xe->usm.current_pf_queue);
> -
> -	WRITE_ONCE(xe->usm.current_pf_queue, (old_pf_queue + 1));
> +	lockdep_assert_held(&xe->usm.pf_queue.lock);
>   
> -	return old_pf_queue % XE_PAGEFAULT_QUEUE_COUNT;
> +	return xe->usm.current_pf_work++ % XE_PAGEFAULT_WORK_COUNT;
>   }
>   
>   /**
> @@ -469,22 +472,23 @@ static int xe_pagefault_queue_index(struct xe_device *xe)
>    */
>   int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>   {
> -	int queue_index = xe_pagefault_queue_index(xe);
> -	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + queue_index;
> +	struct xe_pagefault_queue *pf_queue = &xe->usm.pf_queue;
>   	unsigned long flags;
> +	int work_index;
>   	bool full;
>   
>   	spin_lock_irqsave(&pf_queue->lock, flags);
> +	work_index = xe_pagefault_work_index(xe);
>   	full = xe_pagefault_queue_full(pf_queue);
>   	if (!full) {
>   		memcpy(pf_queue->data + pf_queue->head, pf, sizeof(*pf));
>   		pf_queue->head = (pf_queue->head + xe_pagefault_entry_size()) %
>   			pf_queue->size;
> -		queue_work(xe->usm.pf_wq, &pf_queue->worker);
> +		queue_work(xe->usm.pf_wq,
> +			   &xe->usm.pf_workers[work_index].work);
>   	} else {
>   		drm_warn(&xe->drm,
> -			 "PageFault Queue (%d) full, shouldn't be possible\n",
> -			 queue_index);
> +			 "PageFault Queue full, shouldn't be possible\n");
>   	}
>   	spin_unlock_irqrestore(&pf_queue->lock, flags);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index b3289219b1be..45065c25c25f 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -131,8 +131,21 @@ struct xe_pagefault_queue {
>   	u32 tail;
>   	/** @lock: protects page fault queue */
>   	spinlock_t lock;
> -	/** @worker: to process page faults */
> -	struct work_struct worker;
> +};
> +
> +/**
> + * struct xe_pagefault_work - Xe page fault work item (consumer)
> + *
> + * Represents a worker that pops a &struct xe_pagefault from the page fault
> + * queue and processes it.
> + */
> +struct xe_pagefault_work {
> +	/** @xe: Back-pointer to the Xe device */
> +	struct xe_device *xe;
> +	/** @id: Identifier for this work item */
> +	int id;
> +	/** @work: Work item used to process the page fault */
> +	struct work_struct work;
>   };
>   
>   #endif

Matt,

There were total 4 pf_queues each of size = (total_num_eus + 
XE_NUM_HW_ENGINES) * xe_pagefault_entry_size() * PF_MULTIPLIER 
additionally bigger of roundup_pow_of_two().

Each of this queue had a dedicated worker.

There is a comment on queue calculation size in xe_pagefault_queue_init():

"XXX: Multiplier required as compute UMD are getting PF queue errors

without it. Follow on why this multiplier is required."

PF queue errors could be due to slow pf processing by handler in KMD 
plus generating PF for a single VM (asid) therefore hitting constantly 
single queue.


Now there is a single queue which is 4 times smaller (overall) but it 
has 4 workers and there are optimizations which potentially drastically 
decrease processing time.

In the end it could resolve to a case where a single queue had 4 workers 
instead of one which would be still faster than it is now.

Still, not sure if queue size is not too small.

Did you have a thought about it?


And I think this XXX comment becomes obsolete with such change.


Regards,

Maciej


