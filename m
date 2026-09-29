Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04521CA5FA1
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 05:41:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46E810E9B3;
	Tue, 29 Sep 2026 05:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cD2/JutM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6233210E9B3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 05:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790660463; x=1822196463;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gtkTVMVeeKxQoaTMYaPtmpdinC/nr48sa2qNWSb5l9Y=;
 b=cD2/JutMcLpwAiDjvnVNddGUEjsoziOr7jjoDTDeWCUaaXGkmv9MFKlJ
 lzGkizS4h7Gd7ToGjxVtM4xkdryC0btn6Mljt1c+8jZa27JjRpiIPCDrH
 dAH5VHJjLGerwmL36nWhwzIektGg0drzL90SfmfZhpSr7QHcWJWkHpK0b
 53dTNYOS8pzKFMrCdrx0b68KsJYr4Rvb1t0cf4R0i9170/UM2s4P9vaKD
 kNyKapnYalX6BbFTavbMuJPvMC5dvqCCeMRvsB0namXF0DuaNQG5LQL+Q
 fCcTlpPnqHIcDnuJjEO+Lwee5xqAEBpYyfolx+CUqUQln+AXYczuq+KGR g==;
X-CSE-ConnectionGUID: Nk3ebq8sQP2TJ+EjEfJWkA==
X-CSE-MsgGUID: j4FrSniPRAWJGTxKtty0tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91468771"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="91468771"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:41:03 -0700
X-CSE-ConnectionGUID: fBKbSCctTneA8I5LTq9j8Q==
X-CSE-MsgGUID: 3OdcKyPFT5W+7MD4ZW6OTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; d="scan'208";a="274377802"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 22:41:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:41:02 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 22:41:02 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 22:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ym7VyQ8DobUXwQLs5DAxiX6/Zr3A4IqwoPvUdk0HCdLODBmb1CaFfSpqOwWPpfAVCkYoO0gPas2MtoWXhixPUxPJXV2CMi+oYZ0Y50n1PAfgZj6wzWb7JLHbN3fBDwcuP/EpZDeMPVI6p7H+VsRzx+7ZYCZXSGPRfiOpCNBrXv7UI8pqaEW3fTW8xSQ2cxJabXN0jFCYhMS7kS+1d7lFqPTh+xJ7HZ8ahjWkzX3U7eiuIg8XbCXf7n+hREWmJK2mF16moMoLELahO5ufQat48pk0vgapJf9ndHo/zArk5bmsUQ8wV+a01eHrcFX30wff+kh6O8k8eAJ97bA9wt1YbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZrXmsV+G0v/r2mZoXUtvEdAmLl/hOBq0Fd/yJgWDw4=;
 b=Rgcna0jcM6J8S4usuuWscR8IJadm6aB9JlgGnpIitFyshjocJtUkBeqSG1aAuiKZts6yANGDoo5UJiH7HSbE3Z99FDdhWfFBAE8kHaabhXdUryWCF4C4DyL7E/AEzpg7gKoDQ2YbWfJZpck2wpd3R7wvIBOGWIrSPe832y0H2L2wxEaGIyVyHb/IUrcWYBvuPMdCfpCJrBI8zf1O5L4EbWPCNqNsXGzfsvE6jVfqnamYptKRYqECKV7RkyZ5cazpnX+RiY0fYKQJciksL6JyIyl6OwFIf2e+VvqxVA0RgDI3eEO1BPiY9jx4sMwNywaHe77rNxlHhoUtjYgbP2sciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB8059.namprd11.prod.outlook.com (2603:10b6:510:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 05:40:58 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0451.014; Tue, 29 Sep 2026
 05:40:58 +0000
Message-ID: <3f757daf-1ada-47ee-a951-e19d96300a92@intel.com>
Date: Tue, 29 Sep 2026 11:10:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20260928092114.1610203-1-dnyaneshwar.bhadane@intel.com>
 <20260928092114.1610203-6-dnyaneshwar.bhadane@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260928092114.1610203-6-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 66994075-73a3-4a2b-80d0-08df1dec3cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: p4up9E0EtJKJlkvyVI7++B3vpgmo9Kit85Q3v3UYnGgkmprQA7i0mab8itoc5Wb25mgAZ36b/lEmib4aMKTQzvXkZJFCI+8UCiTolrvyWYk7zxX7muGj8IX5E+hRD9iXOqyZsDrvvYe/sZdG261D1P1LgWyPgjXVszmB9MEYDfG0NrITQ8SDr3X/Fs2J6b1ZYcgMjPbsVYBA15/16ZmeqoXjAVggogID1VgG05itmuTIRyzXrE7A6DPF3ZBsGmxdkyVcagdJKYEG0mX9EI9mLj1RMzCV1nca9sIZmVjZU2Zqapc2JTT6fbESE6hVcduYGHkJ976Agl+UNXGMebA8XxFwH+eqFUOW5CHMMv/WAne0vK49RtxZIzDd1jvNkGlNnrKVZMI/UKIJPrCTTAnH07h9uqtbV6ftc43MfSKHVEM3uGjFQw4nvmyA2snJp8q9UWpV/EMDA11PNDFjxwormK7T0TUSVVQzTz68GwJ0xsXX7zIxqG15RIPg9nvOUW7kOoJ6pocpSH9QT0/vkJMhPUa/AF9lTWWqkAuW8umfYaK+phHznlE54D9npAaQaPotqhAci9jvIaE6p1x3ss/xcs2/PpHGj9N0XGKX4HBw0RTCJkU3Svqj+SVd1ApAHYodPemrw936UK7t7FRJeIl0ZpBH/kAkOE8qYykbIz1PIns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azRiM3NRdWN1REV5TUgvaWcrRk50UDZZdWRMZ1dQdDl3MGwvVWE3cDQrTGth?=
 =?utf-8?B?bTdDTGloYUYwNEJmM0R0c01tUnZvSjhWaGFPZEZnckZYVFNNOHhHSjhScVRW?=
 =?utf-8?B?MnFMTGZzaGFrVVljdHRpblNtK3JKZHQrWnlWbXU5bWxNcll1aDhBZmtlV05x?=
 =?utf-8?B?Z3ArdnErUDlnTzZZT3pzMnFLaVVkYVhqK3gveHJSR2paNnlueWo4aVFtckpr?=
 =?utf-8?B?VzZBN3F5U1VMWEZEbmpNY2t0ZWlUaDIwT3ZpbTU5OFJrUmQ0bm55Kzl4b2NJ?=
 =?utf-8?B?aWFtbzVpME8wZDFyM21ZOE5MMlAwWnNiY1kzK0owbUhZN3A1d2xmZGZaVmJo?=
 =?utf-8?B?SkdBMExCL2E2QlhmMkFwOVcxVU5yNWV0dkhNOGFRb0NWNGF4ZzJvNFNXVjQ1?=
 =?utf-8?B?dEUxejFLUTVhakg2VVBDR1l4Yjdpc09sRVpEQWVDaDF4ajROaEZJWkI4QlFG?=
 =?utf-8?B?eU5tY3FDSVZoR29nYzNTUUNpc3VzOUkwY0hWOWNhM0ZJRDBiSmdjdlNodHpu?=
 =?utf-8?B?dmlzek1ic0U0Q3owYXVTcU85eW43bEt3WjU2QkpsbHJLbm5YR0J1Q1ZYOFYx?=
 =?utf-8?B?YTBMU3AwUFdwVXBKRml4Zk9vemhWZ0F3Um44QS8rWGRtYW9UTlVTdGdYc2RX?=
 =?utf-8?B?aDRNZnpHTmNmaEs0T3lUVHdYT0Vsa2tUUyttMk82WWZmOHNHMVVSd1l2NjhT?=
 =?utf-8?B?NFdkcFRNYk9FVm94ZTM1S1JWMVJkNlFTaW9PdE9RNDZnc2RVdFowMnJNTmR4?=
 =?utf-8?B?eWUxd0hnYWo5WnZWR2dqY2crK0UrQ0hqUCtDNG50RUdvcjY3ZGV6TE5RYVMy?=
 =?utf-8?B?ZSs5eFBEa0RsNm9tMW0xeHQzK3M4OUx0clU4cFJVck50L0lTeHY5N3hCZ3RI?=
 =?utf-8?B?eFdYZ3RWNjQxbllhNzc2WnpScHFvN2xLOE9TbVFrNVFOSnA0dmdBOFNRYnJS?=
 =?utf-8?B?ekRkTlNCak5ka2hHZzZOYllkaXZsZ1ZPb3BaV1NZNXZpMk9JbnRhOEo3bEFh?=
 =?utf-8?B?Z2wwY0VFUGhidllEQ1haZGNnUm5GenMyNkY5U1lwZHljTUFoZ1dyNnJaYnA4?=
 =?utf-8?B?MGY4QWJCSE1UNDdHWTQyb1lUYWRRbnBIUGtobnIvMXlnc0hKTWQ4VHgxZzFM?=
 =?utf-8?B?MU1ZQy9WREVqZ1ZQN3hqbTJUZnhiTWV0NEI3TlhDZHR1Z0VzTWtFM1hWck9N?=
 =?utf-8?B?WjY0d0ZpbGNVejlxNlB1RjNpb0dyeGZnK09uQnJIU0MySFcwbkxVcmI2czc3?=
 =?utf-8?B?cDdFY2tXS1VBUUhtT1QyTUdxc2s3aDArNWhsV1JKaEx0UzVpZlluSTFvNHoy?=
 =?utf-8?B?cXBxdjZVZ1dtS1hxUFpES3FCMXRZSTE0NHZHZzZkTUIyN0d4K3o3SGk1TEIz?=
 =?utf-8?B?UWxUUTVFYXlaczExNGZZam81b2NLWFlBUVpSa01Gb1Ryei9YNU1aak5nTUsr?=
 =?utf-8?B?eUdKRGxud0hock1yTW9VOFUzNi9YRTJQUWZKMnFKVjJkTEdIZ0Z4akdiYmxN?=
 =?utf-8?B?d3dyTjl0YXVmMWxENVJnVHlxVzFDUWlTanFDK2lhdzhXWXhzSDNWVXpUak80?=
 =?utf-8?B?NUNDeERxN1oxL2hneFlZamh0aGluRWhhTkZiU1FsMXNaMGNHaFJKNERuWG5P?=
 =?utf-8?B?TWh4c00zUFRqTEU3WWZ3ZUM5QXhMYlhqc1RiZjd6alhGNkFSejdYSzJMRjVz?=
 =?utf-8?B?aHYvSWZteWNmMFNnRHdiTVZzcGlaeDdmQjlDc2FsdFMrcGxVOENZcDZHczlF?=
 =?utf-8?B?UDVSRFZiSEFzNFBMaXlaSXlsWDR4cStGWDRjZ3EwVEVMRHpPOWx6WWhsZjR5?=
 =?utf-8?B?YjFnaG5BbVFhQ0wvTWhLMC83YjM5NzVFRXA0VjhLNG9oTGN4M3QyaFhkcXN0?=
 =?utf-8?B?VXZlZklKN3NtZ204bTR3TkcyQWQ2TjczNSt2V2RuQWhnbTB5NUc0NVNwaEM2?=
 =?utf-8?B?eEN4Z0hTbVUvMjV4N1dPN3FnLytydWlZVVhPZE1VTnlvaXlxYU5nc2tTOXBW?=
 =?utf-8?B?MGxvRFE5Qk1LREx3S3BxNkYxS3UrUUVwL2FScEgyV2Q0NkJHdkdHdDZDNENV?=
 =?utf-8?B?VHJPeUVRZmNMMUtxMStScCtmc2pnTHkzbXdMSHNGSUx1b0RLUWlGbXgyZWFa?=
 =?utf-8?B?R1p5RlZtdnc2ZTVHcmZFSnFjVVYzL3I1aERXQmc5UzFXa1ZjRmEwelZwYTNp?=
 =?utf-8?B?Smpzd3p5YVhtOW5VQms0eEY2TEVXVWNPNWhWbUpkaGZrZkg1ZHZoUTdVbHll?=
 =?utf-8?B?czcxNm5QaGt5c2d0elhjVnJiRUNHN2RXNHR1Mms0TlBXQ09tQ0h5ZE4xZmZk?=
 =?utf-8?B?MU1DN0VtZUxIVW0vcHRaRUgyS2I2Y0RnSDJtZHlSNXJUR0RnV2lMdmpXSmpq?=
 =?utf-8?Q?/9vV1U1FnvpT07wE=3D?=
X-Exchange-RoutingPolicyChecked: G/zG4KAZDFnIX77RwRDD6hygWBzsy59wS6utAMIxoh7svPym8YsMjpy4SLq1mAR4LjfOYFQW/eKhy5sXdqqL8QO3mD8xwcufdCohtp5kAJjRN+dNinU/tOhypNqjLiGeM0QO3vck98WCHDf8aJsNvNeKfT77hr3hwtskGpZkwoiALbDxIEu3CD6lClEtDgOxXmZaFpW35YQFBoBaLqP06DZ/H/1fMZgDX1E7tqXQeIQL0Acyds4xlzBqTicfPcLMklyk0MGZyEmY+18Admat8n/dSWypHzg4MdTEcaJB91BCKW3HQWxGUGpVbGX0OE8u2c6IrV6xJhhHJz1PDGfXPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66994075-73a3-4a2b-80d0-08df1dec3cbf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 05:40:57.9732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+cgdn2fZeSR+vTkm4u8X5H1c+xOocKZhN1elnQCf1Si3zh9WJtCgLFHQf2ZTus6BcVTcaEL5Y4YQNMo3ROfQ9yl0gBPGTDDXmFP6wF3i+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8059
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


On 28-09-2026 02:51 pm, Dnyaneshwar Bhadane wrote:
> Replace memirq_err() calls with xe_log_err() using the MEMIRQ
> component tag for memory-based IRQ failures
>
> v2:
> - No need to log ERR_PTR(err) explicitly (Mallesh)
> - Using tile instead of xe for more local log location(sashiko bot)
>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_memirq.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
> index 9dfe965cb46e..32b9f87a10ec 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> @@ -15,6 +15,7 @@
>   #include "xe_gt.h"
>   #include "xe_guc.h"
>   #include "xe_hw_engine.h"
> +#include "xe_log.h"
>   #include "xe_memirq.h"
>   #include "xe_tile_printk.h"
>   
> @@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
>   	return 0;
>   
>   out:
> -	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
> +	xe_log_err(tile, MEMIRQ, err, "Failed to allocate memirq page\n");
>   	return err;
>   }
>   
> @@ -370,8 +371,8 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>   	return 0;
>   
>   failed:
> -	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
> -		   guc_name(guc), ERR_PTR(err));
> +	xe_log_err(memirq_to_tile(memirq), MEMIRQ, err,
> +		   "Failed to setup report pages in %s\n", guc_name(guc));
>   	return err;
>   }
>   
