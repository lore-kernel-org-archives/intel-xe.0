Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD7CC61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 11:22:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0AD10F333;
	Fri, 28 Aug 2026 11:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYmqrWz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9F010F333
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787916156; x=1819452156;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=jL4l1o49b9mi8gPZeY5nd1CS4tksQPrimhnwQVQrzyc=;
 b=hYmqrWz41dmLw7T2fKRgF8T58abX3lTgoIp3HsYKD6eq6FfLf7Y7sNbH
 mCxorhS1rBsPZKW0fAuNA6PJEMi1CpZjOABzWV1DQGRVl3MUkn3oTAvfn
 IBR9M4JyvVG5ABlANyjjCUuiM55nUZt9aDvYVJMjOGpT3GrAf0QfHoq9T
 CRDmoTC0hg9C+TRxlhXnV9NJ1mS8VUSjol+tQzSiHb5WBlBIP8XmZFJxo
 +lpJ38nKNJh5LBfo1ztuAjhnX45Cmppj2JkvXC7PrfsLpFmWJ+IoR7MB1
 jhTlFdL4CExYHSFMpUPPlvdxtbk64riS5t+oeCRIndRA12TMwUxEOflcj w==;
X-CSE-ConnectionGUID: q6DMN41lQ96e2LC7Iw5jUQ==
X-CSE-MsgGUID: 5owaIiXxSqSJ2dvboghIew==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88449660"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208,217";a="88449660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:22:35 -0700
X-CSE-ConnectionGUID: WFY0dVEkSbqI0ZUEYtZvaA==
X-CSE-MsgGUID: KMvjSU57Q2i59ChJnhpoyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
 d="scan'208,217";a="272348013"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:22:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 04:22:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 04:22:35 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 04:22:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPuUH1cSISEGqJiKAyOAKvEkxwddYTNriF1D+blwMb/A4bhKVfi910wWITlGX3GPwb/xpdnUNi/3ImdJrJUibxTZ8PZxH5S0814RtOqJ1Fy76KIIWatiazeWgZuBtArotS1Jp3Dmjniqh1GCJr4oIAg0anBm7B32MOQ8JrysBDUE1gpr8ugoxPGkK1blU5FokHc2fgJohfGRWE43dOjxD5GQ0sI99tgc7yOGgRX5IaLBfmE78HkDVeesZ/kGM8x//SakUmPgabj+uEYLPJF3y5jwDXZ2cl66STS6ha6HBrXIShg7nQoK9UHtV0tlWsDg1919269WsIvPcYDZZmsCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0h/YIne9q7+W+WTjbp91F2k/DGXpjIH6Lu0mCgIfl8M=;
 b=KVgxk0OQCbuy/iBw+q6hhNXQSluakogUEEq9wYgJ7SmKuWJKuL1oCTlPaRfBdZU57eJ6jzi2w5sZNyT44gY2fqPT9I/w59NoJOZbaXVhd+uCZGNXAHa4GT1zb4QKCxO3awL61ocqmBK31GcvLlg6DnoskIm3VfjQ/l03nTfwG9R9hLgboEj/TBD6ZmmWaZJRtxwk+gzppwx1S8lNwSlxFoXZj6aLeXYjiBlE/sT0wFy1WCJbs6kpsWjIGqxMWvndqy/FI2+DB4DsyZSLhF3q/ONgBdMK5CqLiVIeQjK/y3TLMDTbIO8DN/E6RdyJjF4l09B7aLmXEqmu7oiT2cHrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS3PR11MB9670.namprd11.prod.outlook.com (2603:10b6:8:390::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 11:22:31 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 11:22:31 +0000
Content-Type: multipart/alternative;
 boundary="------------eqjd0tEaETuqNccud28uPj54"
Message-ID: <99677ee3-038b-4c1e-a2a6-3d0ad5ae4b97@intel.com>
Date: Fri, 28 Aug 2026 16:52:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe_ras: Add Fabric error handling
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-5-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260825141109.3797483-5-riana.tauro@intel.com>
X-ClientProxiedBy: MA5PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::10) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS3PR11MB9670:EE_
X-MS-Office365-Filtering-Correlation-Id: d1749c9d-fda5-4038-81eb-08df04f6a6aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|8096899003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: kLZBj9ONRAGNHEwWq0aIfu8/uX7H4Jos3hW3Yq/UbhB+JM1f4PJlEuwUTIeOkdemco+RBBwmBU3xHQxv43hIf+GYl8LkhlviD7c+t0U7GUQtxOvqdTlMsD5nPvUKExDKNKqWWJmOgOcPh5Mnlx3lulg8Php6njId3pYT5UjulqAUBO2pEs0J/tSE5f0fHVYSFkgzhrm3pf/wIvmO7C0MM+j7JZWueyVKLfO+Bk6IsMkbr5j1mE/k55jH13E88wikvlORcKAnTZDm4JE3BxuCEaiR0qZRoStEX9lHT9KTwPVNlx2UG4KVNn5weH0fs/nckXZS9h870WNcUeUbIgcRYofrSWaf4qaEHlm5k+RuYAtnFkjArx3SKcSr5K6U3rsp90WXDRJwQlBjra3d5inSHvwdFYOAaP4njW4jWAwdtGrPSbloOTI9n8AX91ydmPgDLTqa6KwF7EPyANfAcMDUt9ZAcDj7FzDEHCFI7Z2PVsTrMHMRKvwTsAp05kWDGpaVwQOgdVzb1XppOjFNRbtHG8OQeGm6TxX+bsuz2FZmnNAx6b5Rxn03QFaESRZVs3czwrENVdUh/EnEfNqDWrmaOZ6hb3OH6e1w2jknjnGDIQe4LX4MoRAGIel+6QyiVTxpOSMkz/twYzu7Wbp46v1dzeU/+dQTp+KSVHerz+DZ1s4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(8096899003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0duazBiNjVGTkV0RFNZeUZkVjJSL2hmSEw2cGJ0aUJGNnhJdmVlNzgydDRW?=
 =?utf-8?B?bWsyL2dtRjRSeFIyYmRZWnBVRHFBSkZTUmJxMFcwQ3FuQ1dBTThTRlpvK0tX?=
 =?utf-8?B?bUVBRWJIL1crTmVlUzV6M2l1NnlxRVAxTk1YYlNINENvRExQTFFyZnBGVzVE?=
 =?utf-8?B?R1o5bzNQSy9lMVUvZGVOMGJFcklTQXpmZEM5d1dqcVZ6Zm91eEo2eDY0VFFV?=
 =?utf-8?B?em1NNDZuTzRWRGlhT1FVdGw1Y1Nma28wNHNEMWlSbWFMd2FyOVl0bm00b0Q2?=
 =?utf-8?B?QzUzMjNWcjRvdUUzUktodFZVVER0Q1doOUQ5YTdTTmJVY1FDamc4VEE5aUtl?=
 =?utf-8?B?QzA4NFVXR05yTkFtVWpYNy94OWltcm5Yd3dRZUd0UTYvN0dVQ2dDQThpdW56?=
 =?utf-8?B?SUlYQkhOWHRNejh3a3JIcXovdHJidU9tN1J4NmpHWkROSGlmeDduUVlHdDZI?=
 =?utf-8?B?VXI1d2FWNU1yandNUFBtQWNxYnJKOFJTT25vOU1vS1FCRW0vbnZFQkZuUW5Y?=
 =?utf-8?B?b1Y2bTJxSmtrK3BDaVV3YUtkZEpNM1Aya2Q4dFl3cklURnNBRzQ2M0thSkNY?=
 =?utf-8?B?bFhRdmNIdWNIQnVscldhL3hJSVBEY00vMjFGRjRhdURZSnUreUhMamI0RlRk?=
 =?utf-8?B?ZkY0SnJuK2Y1U1FkRWl2UUtJd0c0dFRWLzFPQU5BLzFhb2FIZlVRbmRaYXRi?=
 =?utf-8?B?NGlDazRXcGgxWk1EYjA5Q0lCSUNqYm9WTWQxNmw4ZTNrRy9GWUxlbS9za0po?=
 =?utf-8?B?VnVxUGxyK1VTY3hsd1U3bmNlczJmbE1ITXBKb1FDM0d5RGxMb2RhNXlpQVdh?=
 =?utf-8?B?akY0NDdvL2dPdUdyT3NvMkhGSU52V1Z0bmM3UVAvTUZKYkpyc0IxbEQxczFY?=
 =?utf-8?B?NHg0a0oyMTBrd2RTT1F1MTQ5Z21NZXpuVzdCdFR4T2E5ZG1NSXk3eHRNT2dr?=
 =?utf-8?B?MWN0L0lsT2ZsM3FwNW0wVzlCZUlxWnNXMGxtaDl4MDFvMTNoOXBVTFc1b3Uy?=
 =?utf-8?B?S3JKU2wwMTI4RjluZWtHQlVhRTNqYmpnVkowQ25jcE1EaU1YaDJGUmtqRXcx?=
 =?utf-8?B?RnRQUjNPRldOWUZOYzB1SlRlZjFKYmRDWTRKUHJKVFZzbUtSMEN4U2g3VEU4?=
 =?utf-8?B?NUo2cFNobU82bDcxRStRNSs5cHZ2UFZlQzZFcmNxRnlTQ3hZT3JjNGZOV0ZY?=
 =?utf-8?B?dVcrU2wxZHFXM0ZLR0lRSzZzb1lGbUxCTHhwQzVzRGhqUXYyd1N5bXk1S3gz?=
 =?utf-8?B?djZyYkNoVXE5OWFWUFIrVkQyOWNhc2x0TVFvYlVoQkVLRnk4YkV4dEk2K2dE?=
 =?utf-8?B?UTJQZWxMTnlGZlRpUUdpbHhzZlZFN2I1UFJHZXZEeGo0TVZaU3NRQnd4RHF2?=
 =?utf-8?B?Tnh0NEk0SEtkS2d6NlNiRHc0eUJyZENHeWxiNXM5cWh0L3IrQVBHNTFWZmRl?=
 =?utf-8?B?dXpiYWxRN2ZlRUx0blltWE5pZEZ6QnBkbEtoUVI5OW5laWdxeVFWcG9HUk0z?=
 =?utf-8?B?bEl2YlFlSU5vUmJjZTBWZ0xDMUI0RERTNU4wQXBML3lOc255a0ZYZXYwYmc1?=
 =?utf-8?B?ZmV4R1FDMFRmemZHbjVlYnFwcEEvQ3RXUmUwZWI4UHd2eThoaG4rTytDRVZR?=
 =?utf-8?B?Smk5elhnZGVuM2EraGcySWJYdzU3VkpQZzNld1ZLZndITjJPSWRpcnJmY1Br?=
 =?utf-8?B?RXdkOC9aOHFaemxOL0pzcXBZYmdlL0tqRlZUa0ZSOU9pdTJ5SGFVVnlVWG9X?=
 =?utf-8?B?dnM1NFVmNy9WVU1YWjJCNXpSem1BWFFVSmtBSEd1MkowVzFEbmZBVEt6N1ZV?=
 =?utf-8?B?dGlOS1dBWk02QUd3ZWlxVW52OEFsempTd2JWKzJ0d2NrNnFaYWVMamgySk14?=
 =?utf-8?B?cGkzWVpqMmh4Y2JOdDFLa2VUSmJheUlVR1NlMTQwTDI0WFdkZXRYek9vWFlL?=
 =?utf-8?B?dGdwTG9DRkNCanZndk1xRlNWLzlkcjJTRWxMYzZRRk5zY241TFJSelFOV1d6?=
 =?utf-8?B?RG4yVTE5UUlyR2x5ekFMZC9KaERIL24yNU8wend4d3ZiWVNKb3dHSTVyN1l3?=
 =?utf-8?B?TGR2Z2JYaHQxZnEvTGR6TWQ4d09NRjZLcFRlRUh2aUh4bHFyQmpVZWlHNi9Y?=
 =?utf-8?B?aVRWRFY1bGRaOFFVcXBqVE85ZytxbzNWWmZXeDBWQUthVkQzOHl2RWhwZGlY?=
 =?utf-8?B?NDBkNks2T0tLRXBFWnFaU0JzNEpxOVFkRjF0YmM3YVFKT2huOEdCK1FITUor?=
 =?utf-8?B?ZDF4K3FLYmY5a0RrOCtJKzJYM1BFY3VvdVZQdlp1SnF6MHhLUWhpL3Ard1VW?=
 =?utf-8?B?ang2bXhtcXhLdWtXS0E1aGFQdWhwSHhRdmdnc3pyd1FaOThmQmZqYmFpcmFu?=
 =?utf-8?Q?szYJijeMYYdPBvo8=3D?=
X-Exchange-RoutingPolicyChecked: rXUWVk4beU1QYyc508EHmcqJV/tLpzPm9+HVGDCmJ3wIshsy/BZWuQo9gnWLPZqfDLu4IeEKOstPaqiKSje9VNgZCFdUJ2kleCi4jI1vyuOn3zz3uLvpO7gxe6v9uGEnJkfln8toTmsE9SR0t/WO5QtOA8wcJyB0xp2EKPvSNf8s86XyHk45CNIFX/Z+H2uaqcEDl5zpGsXec20MMboKo5ml2L+BgtkonVetzpLEHgH6gIDMeZ/Sd5UNLzkp/DwO1DyV28Vd5dJBJgK/rrsFNQWDkD/tHmDlEgrfPhdwq5JIfhK6weiLaiY0Q8Gx+IOm3XWwWA//xnw6sTAJfIJ0PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d1749c9d-fda5-4038-81eb-08df04f6a6aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:22:31.6031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTRyZo/4P0b0jRAz19wbsqT8xrX9+0ysiHxJVocYF3SRhmpGnBm28qCTWEWRxTtKQfIaqEzJGDyEoXoq5nm11dZfeCpZI2c4w7vh73gFpmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9670
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

--------------eqjd0tEaETuqNccud28uPj54
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 25-08-2026 07:41 pm, Riana Tauro wrote:
> SAF MHB errors are collected and classifed under Fabric error component
> by System controller. For SAF_MHB errors, if the cause is data
> payload parity error then log and return.
>
> For all other errors and causes, request a Secondary Bus Reset (SBR)
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
>   2 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index d25d25f77531..586dc28a638a 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> +static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_error_product *product = &arr->counter.product;
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +
> +	if ((info->global_error_status & XE_RAS_FAB_IEH_SAF_MHB) &&
> +	    product->cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
> +		xe_log_comp_recoverable(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> +					"SAF MHB error detected\n");

We need to convert RAS to CPER severity and make use of xe_log_comp 
SIGID helper function with arr->counter.common.severity.

Helper function will take care of severity.

> +		return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +	}
> +
> +	xe_log_comp_fatal(xe, FABRIC, &arr->counter, sizeof(arr->counter),
> +			  "Other errors detected\n");
ditto
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_DEVICE_MEMORY:
>   				action = handle_device_memory_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_FABRIC:
> +				action = handle_fabric_errors(xe, arr);
> +				break;
>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 99b2466e2062..73517fd0d415 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -12,6 +12,10 @@
>   #define XE_RAS_NUM_ERROR_ARR			3
>   /* Error bits in IEH global error status register */
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +/* Bits 16-31 represent individual SAF MHB unit */
> +#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
> +/* Fabric Data payload parity errors */
> +#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
>   /* Device memory error categories */
>   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>   #define XE_RAS_MEMORY_POISON			BIT(2)
--------------eqjd0tEaETuqNccud28uPj54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-08-2026 07:41 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260825141109.3797483-5-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">SAF MHB errors are collected and classifed under Fabric error component
by System controller. For SAF_MHB errors, if the cause is data
payload parity error then log and return.

For all other errors and causes, request a Secondary Bus Reset (SBR)

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ras.c       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  4 ++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index d25d25f77531..586dc28a638a 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -394,6 +394,23 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_error_product *product = &amp;arr-&gt;counter.product;
+	struct xe_ras_ieh_error *info = (void *)arr-&gt;details;
+
+	if ((info-&gt;global_error_status &amp; XE_RAS_FAB_IEH_SAF_MHB) &amp;&amp;
+	    product-&gt;cause.cause == XE_RAS_FAB_CAUSE_PAYLOAD) {
+		xe_log_comp_recoverable(xe, FABRIC, &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
+					&quot;SAF MHB error detected\n&quot;);</pre>
    </blockquote>
    <p class="MsoNormal"><span style="mso-fareast-font-family:&quot;Times New Roman&quot;">We
        need to convert RAS to CPER severity and make use of&nbsp;<span style="white-space:pre-wrap">xe_log_comp SIGID helper function with </span><span style="white-space:pre-wrap">arr-&gt;counter.common.severity.</span></span></p>
    <p class="MsoNormal"><span style="mso-fareast-font-family:&quot;Times New Roman&quot;"><span style="white-space:pre-wrap">Helper function will take care of severity.</span></span></p>
    <blockquote type="cite" cite="mid:20260825141109.3797483-5-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return XE_RAS_RECOVERY_ACTION_RECOVERED;
+	}
+
+	xe_log_comp_fatal(xe, FABRIC, &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
+			  &quot;Other errors detected\n&quot;);</pre>
    </blockquote>
    ditto
    <blockquote type="cite" cite="mid:20260825141109.3797483-5-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -555,6 +572,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_DEVICE_MEMORY:
 				action = handle_device_memory_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_FABRIC:
+				action = handle_fabric_errors(xe, arr);
+				break;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 99b2466e2062..73517fd0d415 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,10 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+/* Bits 16-31 represent individual SAF MHB unit */
+#define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
+/* Fabric Data payload parity errors */
+#define XE_RAS_FAB_CAUSE_PAYLOAD		BIT(2)
 /* Device memory error categories */
 #define XE_RAS_MEMORY_DB_ECC			BIT(1)
 #define XE_RAS_MEMORY_POISON			BIT(2)
</pre>
    </blockquote>
  </body>
</html>

--------------eqjd0tEaETuqNccud28uPj54--
