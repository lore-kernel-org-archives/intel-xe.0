Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7CCC982EE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 12:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD06D10E065;
	Mon, 21 Sep 2026 12:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UL98j1Fw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B920F10E065
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 12:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789995244; x=1821531244;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SFrYRc+np1vwIIOpcWYDV+ap14tZ0ZK2rJUid4XgUcY=;
 b=UL98j1FwvrQgHSGmBehs6oSsiKSvG/mZbko+LCaBKsW+/0kdT/UisePA
 6qG2e68HEHpgQDZldjjtFOJnYttyDBbVnquMSEFYxtA5LG0dR320OrOuW
 9OQiyWh2ulwXEAG2jdRGJ7Qy2GVNI0Lz3fQVz0BPlqLgOz7zA3YUd3maf
 69ycqP6X+ZgRF+C1oahiwiuuN3edOJ9go6EasY8IH6aAikMY6RL1ndJb8
 /ef1/AMTnlGoe3uVW1H0X9dqzyqrqe+StUt8HLwnxkQWWRbMZ0kbKzg9m
 3YRZWr26NObL8ndFQakDjfBUFufl0RoC6YnDazOQ657780BlrlXKSP3Ff A==;
X-CSE-ConnectionGUID: 2xbUsk6CQJ2Ayu0Y54sggw==
X-CSE-MsgGUID: tVCye+M9T4mAqJAjS65wmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="1008348"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1008348"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:54:04 -0700
X-CSE-ConnectionGUID: e991+tAdTuKBneCcGyfYjQ==
X-CSE-MsgGUID: 65xDy5c4R5qwQz55/hancQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272801118"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:54:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 05:54:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 05:54:03 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 05:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ntnn4vAgURzukpEjZEuTq+amXVfmT9NR3d/jSEBRjzr+FBw2861UkuHez+mMXpC7emGdvODYP28ZXscO1i9hg9lI8jeV1A1E63U0Qld2Bq5bXTdOmCgRT00o96sdGg8BzHru/YNxXdLIZyFs5TgidwSh11zm0Ik2LSM4tXQ3ceG9i0zKylLdSK41T3blxiP5y2HMo8wiM5EQDtNrN5kdVJEV9Am3OX38MhC7UPuyIgBi7wqM0m+Vb+Vh512VT2pSwmqVrJKU7hVCgWwV+3ZmGsk0w/sGchafNKAkn5SyTcYsJymnYGsoWss5KEgMaFsIAMuB7k04FwKKevX7zHd/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1sIfF93nOVi/XK8auXH4pd9oudY59mpzgnopKm75bw=;
 b=HV+r8JQHGn2XzmNrL2fid4ViYDm8BfwaO4ab63zS7cllUQcABkisOcqdDcbhGBcDMyBrR2NWRna8UpHUQOaKFM02qnLRNDLySDtF1RLb/jtnsTPltQrR27tsB26wwSZAKYyXl7tliCpMbAetd10C8GauE5EzZZDfEGm09brdYpalnIt1Mlw60s87uFmZ65uNBt8kuZCztPqDJqou6Bqlyw9jcj5/T57UfTrNHf1zSY/llBvLVg/7Vz/OK1DddgyX7EFhJGnvBkvzc29ufN+PjuqA1Ej+WyIrbrNDNOT9imh+63/V5C72CmetPdi335tD00JLAolTLnhhVi4ZIG3/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DM4PR11MB8225.namprd11.prod.outlook.com
 (2603:10b6:8:188::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 12:53:55 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 12:53:55 +0000
Message-ID: <c7c39b76-580b-4ef0-91fb-242acf347114@intel.com>
Date: Mon, 21 Sep 2026 18:23:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/24] drm/xe: Store level in struct
 xe_vm_pgtable_update
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Stuart Summers <stuart.summers@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-12-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260904211613.3934307-12-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0126.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::7) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DM4PR11MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 817f909c-8667-48dd-6dba-08df17df6519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XSzL8YbHr7udAGtmqHSQbwhC7AMZl6xlZ65B21W43Fo4r55FG8UT87ROB7WpV6oD+5sHYOvOUqa2ePMAFlMDgiJabqhSFJ0RLWa8zIz3f1tB9xUNOEB2kA4QMfVLwC/Bpjst/24cpreDIvZ0csDcvPhXfdgCkd0nBX8jaxVISU6pypI3AfEUCq6TXwWM8Z+Xfv99qrYo6qh1kaUFVVlNquDm8mRiN3qc8oNnC3g88i/tE33qYgnhV6swqKDAa0Vjncy9z/7LJBo7YOZuVp3wW+Cr6OQgaQ5K/7WwkOF7S2GOqwHCv2psvK/a9NWCY0qOuANBy9ebQALsblhH6nQEJEl8ol6nK7dxntwg8IFObOAi3JqsjeyIrPcgp5BaWOzVRtv8IxIHx/1NYjarafEdVCLld3T//6eL5KdkVK3LZf38RKWrxnqD1ElwTuK5Zm1694m0sirmB6gcxfdYPrnNmf7U7Y+4tO+6kWoYIbkugsffC38B2+ost7RVlFb+eIPxmtdW/D9D6xJOtkaXFBB6Ci5UYNClXbmUc3l3nPRewRNWBreMcL/JfPB7uaz9DL9JCEVvacDxYvvONzTlVZN53UjD7NLBfAOjXqetr26GmJtntseHW/u8sT5mxjNxCr8d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGt2TjFWTXoraWd6WDAyR0ZZUStRU3NxVGVnRGhVc1lhUGZqQlEwSmRIS0Iv?=
 =?utf-8?B?aFlrV1VnMkJQcm1wWjQwRE1Ta25LUlAzekJ4eVVMcXdONitmT1VpUEVkNlFu?=
 =?utf-8?B?dGZRUG5YVmtXWVp4c3pNRGZqbXpZZzRaSlNocVYvS2IwQUlsSTVmU2pEZ29Y?=
 =?utf-8?B?Z2Q0c0h0ODFlNjJGM1hLcnRLWE9JWkIvWHpJTS84dFFmOTliczQ3WE16QkNn?=
 =?utf-8?B?SjUxTWtrUVdua1hZQnoydGpqUGVZVHBtRktPUy9xM2lkTDRacjY1WCswWFhK?=
 =?utf-8?B?dXhHc3VuTUhLYUZSQUlpdS8yclphb2x1MXFNYzFIWGtydWpGTjdjdW8xK3pl?=
 =?utf-8?B?cldRc0x3eXlmRTJMYlUzWG5XeUxYRlVBZlc0aWlnUG5XamVDU0dPOURDb0hS?=
 =?utf-8?B?alVEZ0hQWnhneVZScUJtM0lvcks3VW0vK0t1cldKYUdXdkU0cUhnK01nK2Ni?=
 =?utf-8?B?d1FJay9YZjNVU0EweHBNVHdZRXF3WlpDZVEyc2xHS2xTRU1OdG05aHZHTkpO?=
 =?utf-8?B?OVR0V0hsVGhab3BvazRIaXl1YTQwY281TFNmSDFoTEkxdkhZR3BMVGpINlNh?=
 =?utf-8?B?ZlRidmdXTWQxWFNOZDZ5MTVSVHRHSm9vbTBZMThkYjBkQitSTnpCb05UQmEy?=
 =?utf-8?B?UEtVeGlnOWRyWEZ6UkRmZlNWVi82dk5TRVFtUEs3QXFlODFzcStvTkZBNzF2?=
 =?utf-8?B?VXF1VGc0dGJSMWIzR2l1d1d6c05VallwNTFKem8xOEI0K0lZaE13UlJNdlVo?=
 =?utf-8?B?a3lrR1ZxbDVYd2tMTGtvM01tbGFGUHk4aXNINndGTXlDTnhTaHJBc1NseVY2?=
 =?utf-8?B?ejJFUU0xSkhjRXBmSTdXVXI1b0ljazU5eThWa0g5aHM2YzVTbVMrUEZ1YlRJ?=
 =?utf-8?B?ZklwZUxER1VudUw2RjZQK0NtVDNnaWMvUm9kcXVYbzhJbU5zRjdXbzJQWlhL?=
 =?utf-8?B?aVFhQXhyOGY5WEJmNGhWZ2NoeFdhVnRkb0VlWDZ6bWVLclRMc1BFZTA3SjBN?=
 =?utf-8?B?NHVkMGZtNk1iOGxoM0lqWk5QbXRiOWpJZW5rOXdOYnZHWmdmSUFwOGtDdXg2?=
 =?utf-8?B?RFhkRWNoVEMzMUNSMzJFSmw0bmY4YmxEa2dyaXhSN2Z4VjZtY2lqNzhheEZq?=
 =?utf-8?B?Vi9LajVnOEMyZWdqWlpXTkRZcnNDMHdkenFDWXJPWFdXYTBxVjN6U2RYMEZ1?=
 =?utf-8?B?VXA3NEJ0ejVId1ZWRFVCQkxKOTIrcDBuaGQ0YXhxTzAxcml3T0pFVjliUGt3?=
 =?utf-8?B?YzV0bXJ2dENDVEhMbmRIWWtubEVKN25JemlSTjQ4UXFGMUNoYzQ1RExIZ2pn?=
 =?utf-8?B?NENXWFphZVdDTTZJeVlTUzUxMGtIQlZpbStGSGV3dTE0Y2l0ZTl5OW1LOVdp?=
 =?utf-8?B?MHp2MVpBdENLTVhVVlVPa01yZVIrS0trbWgxUm5CQzZlYUl2N1cvdWZWbnFh?=
 =?utf-8?B?Mk0zN25XYmN2T3M0dlJjOEZKQnljeHRKZUVwNS9oQ3gyZW1uSHlUSWRteDJE?=
 =?utf-8?B?Q2ZITlBQRE1vVkV5bHdTM1ZjQlRXZnFmc1dRY0NpK2hCZWFMekhIbytMdWNv?=
 =?utf-8?B?czdUckVoSDN6aHIzTHNkMlptU0lFMldCQkIrVk5pelFsZ3hTRmU5U2xVTkJZ?=
 =?utf-8?B?UkN3dGV6NWl4V3h1RVJjaStveWx5MmtRSjNmb3E1cWZjd25rRHZKL1lOSDdX?=
 =?utf-8?B?VE5yd1lnMGkxV1BMc1FrKzQxRU1PcFFwNGxWL1V6TlhnTEFPSGZWTGdBMlVG?=
 =?utf-8?B?VFBUTFdydzlkb1pVV1BFYnU4TWRXYjNITUNnN3ZLTDQ1NHNDRDFkbVJaci9q?=
 =?utf-8?B?QzNnbzVUMlN4ZUZDRm83MS9hUlhYRW9tYU1xdkF3SE0wNGZqOGs5NXVDbEVT?=
 =?utf-8?B?Q0M1MmFaNjkvZUZVczY5SkZFWU1XRXlIWW9qUjVHYjc1K0NPbFREdzlCalVs?=
 =?utf-8?B?YVhHelJHaU1QNFZ5bHZ6aXdjOS9IQ2NRMlNxdUZaQ2pSTVROdEJQdWlhRnFx?=
 =?utf-8?B?NmVhWnNtNjJHN3NqOW0yU1BpUU5lRW13dkdlUVFvYnQxSnJ5T3NGMVJjOU5M?=
 =?utf-8?B?VmtJNi9HclNEVktiVkFVVVdqajRUZy9remtaQ3dYUE9IaVNmZHU1b0wzeEpw?=
 =?utf-8?B?RXpRUWJPdHlkanRuUkFBekhkQ2owR1FSaFBQeC9rRnRTanZFYllaTzJvWFdK?=
 =?utf-8?B?VkJuaWc1VUxwcFZRS3JZMUZMYWE5SDNOZU1ML3ZENS9VQnBvZTM1b010aE5Y?=
 =?utf-8?B?SVpGQjJGTXQyKzdPVnlKMk9MSEhyRGFLdHF2SmNNQ2M3R1gxZFo0Tm9ZbXpV?=
 =?utf-8?B?RkYwb2tGODl3WElRRGM5SE45Zmg1OG9oSjkrQmVaYWtxS1JocDNla2o4bnpS?=
 =?utf-8?Q?HNXTdWv+nmYSrnns=3D?=
X-Exchange-RoutingPolicyChecked: Vro+7hcriQ8OQyMAzJsTd2+badt8+PQF8+gRobNwT2FRR4LALQvFrqU74+APWrmVoza6ABHXw8CpQKigg8PejL1+kI7RRvGl4oNXuCn5+Qh6FcUU4W1QuB+B9SmHxAwIdpOmtFlfbAs8UREvoatmibeM0WZmL2q4u5RgQ/QCYN4o3egwZgOHpLzIHZLZMzYiubnv5KE4U112gvu+bH43qhxAgTcpx+/HZ5Nvgrac897e5o/qXI/Rtd7Irzk0P0A4B+lmgR6sE6WSc9HXciN9i/8tXv0WxV6LaOZPL70uPTY/tJ2ZZbx4AqQpMT852UByZNiLBAngoXRNQMefVxoSrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 817f909c-8667-48dd-6dba-08df17df6519
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 12:53:55.4314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFu958kagOdrlUCGPwQ10Oq9DqA8Y/gcVk7Mr8TVxUcHay3eof6tjo2svedurBkQqtCYT5aCUR2w4XnYozYSIgNmYhnfZgZ+sHUUxOsWQW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8225
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



On 05-09-2026 02:46, Matthew Brost wrote:
> The level was previously extracted from struct xe_pt inside
> xe_vm_pgtable_update during CPU binds, which always occurred during the
> bind IOCTL. With CPU binds now supported in bind jobs, struct xe_pt may
> no longer be valid in memory at that point. To address this, store the
> level directly in struct xe_vm_pgtable_update.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> Link: https://patch.msgid.link/20260228013501.106680-12-matthew.brost@intel.com
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/xe_pt.c       | 3 ++-
>   drivers/gpu/drm/xe/xe_pt_types.h | 8 +++++++-
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 30127ebf1b60..16126ffc2ec1 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -388,6 +388,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
>   	entry->flags = 0;
>   	entry->qwords = 0;
>   	entry->pt_bo->update_index = -1;
> +	entry->level = parent->level;
>   
>   	if (alloc_entries) {
>   		entry->pt_entries = kmalloc_objs(*entry->pt_entries, XE_PDES);
> @@ -2025,7 +2026,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
>   				  u32 qword_ofs, u32 num_qwords,
>   				  const struct xe_vm_pgtable_update *update)
>   {
> -	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
> +	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
>   	int i;
>   
>   	if (map && map->is_iomem)
> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
> index 39c5b89ce9b7..ccab6613385f 100644
> --- a/drivers/gpu/drm/xe/xe_pt_types.h
> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> @@ -65,12 +65,18 @@ struct xe_vm_pgtable_update {
>   	/** @qwords: number of PTE's to write */
>   	u32 qwords;
>   
> -	/** @pt: opaque pointer useful for the caller of xe_migrate_update_pgtables */
> +	/**
> +	 * @pt: opaque pointer useful for PT building in the bind IOCTL. Only
> +	 * safe to touch during the bind IOCTL (i.e., not in bind jobs).
> +	 */
>   	struct xe_pt *pt;
>   
>   	/** @pt_entries: Newly added pagetable entries */
>   	struct xe_pt_entry *pt_entries;
>   
> +	/** @level: level of update */
> +	unsigned int level;
> +

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	/** @flags: Target flags */
>   	u32 flags;
>   };

