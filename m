Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CE5C5321E
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 09:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA88A10E165;
	Mon, 26 Aug 2024 09:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZV8Oa2E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E807810E165
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 09:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724664202; x=1756200202;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=meIy3WHS5jAV91JSEozrK/OWeXEhePDlEhKwrd83an8=;
 b=eZV8Oa2EWJ1f1RHK7Oo+WxZg780P+GwuYa7iXuUkKRqGw2HxYIC0v9IN
 StghL6vR+5J0VyzjumuDHBsOfwrtIgfObj1li9Z+Tlog0se72dj0Ms/5i
 u7YNE/FkcnAYMcS+toyMGfpICpbL5EwoaghnxrsV1hesSk0e94OcjojEA
 qjAHQRwQHJESkwScYEE4bkx71mdxJ2HGahb9qhrObzwCSENIWdGgX8hg4
 rA1xqubv2koE/Kpaf2Kzb+M/Hs1ZdS3jhPjWMFX3ZPzpjFg3BHaN4myHw
 jAD1NU2/uQY1aBN7W8PSVaiuAgS2k4VIN+uMbdY+ULXczV1M3RfxW9b86 Q==;
X-CSE-ConnectionGUID: H4PxIKXKRqKRz55TyvFReg==
X-CSE-MsgGUID: yWtePpmhT/Glx0UsHUgB3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="34484698"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208,217";a="34484698"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:23:21 -0700
X-CSE-ConnectionGUID: 8YLKm5YoQU+eYwfg/CILHw==
X-CSE-MsgGUID: 8Ts8LoFsT3iwonPV1CKOmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208,217";a="63169141"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 02:23:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 02:23:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 02:23:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 02:23:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 02:22:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xj16HjyHkS8rid8vCOJdrDodzo/KLIHqBCcYaDprA12nZS/TDgFyNFXMhNTHXcjsfbSah+ObfOWgiA487P/umcEqIWMmzyrYKaQWFjrfPVwyP/RBvVXpxTLHqD4mzxx5PqhLy3NNEHlrClQf4h6F9qqvRQlLELp22ip0uH0RhJ8zOWKa7PhGrPQS0vv4//zwg3nKIDV89xv1fmK5NOsbTCkHLLf0I2/LTEBI8usdd9Em8eJX7RdVXXywKJ/eYelh2fTHlT4GQsmF3rw4/YMG+OBYi0pQTGhp2mJQrUhXl/ekUKDTDD8HF0DCMKmYYnzQfTywTwRbKX3BnKmFz3cBfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW7/TjfBII/h9igBbYBngjMCokXIkdkAdjKee3H8Pgk=;
 b=enz0WslB7cpreptCswUvW7iHZgm5rq9+4X0ZG1QQBTi3y5fdEto/tIEyRt9yXH/XLomhtsg3jrr6fGttRwjwrS1OZqyavfYjKbYRcVsOgsZWXRxe8QpRLx04ZAInQnkKMOdFq4U1MWpQFdVE0knk/whKJ5MI/Pw1rOWHuts57kT/oQlVyQiegpk9VnHiZHtYVCAD0cvAUL4uoSHW7lqUSEjcgfm9/BLrM4oHb0dqJl+Qqi9xiTPJcK4KLw9huefTTpYBfa45/rBCsv5wlaoLU01wFFvTrU2eyT95yeDNk1QsxBEOOsGnP4OrfcmQGNJFH4PCSFGJ/okvXtsy7rykFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 09:22:54 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:22:54 +0000
Content-Type: multipart/alternative;
 boundary="------------2Xih6YtTiLra92XQjn2RdU6R"
Message-ID: <42ae2817-134c-483f-8601-8d7807c75b02@intel.com>
Date: Mon, 26 Aug 2024 11:22:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/xe/lnl: Implement clear-on-free for pooled BOs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20240822124244.10554-1-nirmoy.das@intel.com>
 <7645111403a453311b16ff2b11d49cb63a74518f.camel@linux.intel.com>
 <a20245c6-7628-470d-bd6e-4e719dbd198f@linux.intel.com>
 <e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com>
X-ClientProxiedBy: ZR0P278CA0120.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4f350a-6225-43be-d113-08dcc5b0aa60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjZ0djRKbmlRdDJFZ1BvRDI0R2t3UGZTNkcveUhIMzdRemhwdlVBWTdndzZz?=
 =?utf-8?B?NE5sVmlOTkdDT1VYYXFaSXhHRW5nWk5xS2JTcFpNUnU1Y1o4aER5eGlDcHVv?=
 =?utf-8?B?SGljV0ZIZWxRcmR1R2lCampoMnVBczZKaTZTY1hDampZS1lVN29UdXdQNDRY?=
 =?utf-8?B?MldWRWNjQlRQak9NRjA1SEh3OWFPWG4wb1ptdEJ5RnhaL2NIT0xiN1ZQRXZF?=
 =?utf-8?B?czROV3BGWjhEM21IUm9IcE1RREdmU0J6cytkRzZSN1ZiU08rVU5nc3g4ajVh?=
 =?utf-8?B?TmpDNUozQ0JSMDNZWmR1MHhHd3NCN0orbDMwUjUvWUY1U0E3WmN2YUN3a1I0?=
 =?utf-8?B?dExyNXl1Q3dGelQvL29YMkxzeVEvWVV5Wm1WWkRSQ0c2YzBLVEVWb2NZTE9T?=
 =?utf-8?B?S29wTGJvK2xSYldZc2YvcmdYUTZ0Qm1SWlZsT09sSitzcVRNVVJGVjVKNE1a?=
 =?utf-8?B?djZhTGRYcXN0V05TOFJxNVRUU005SHZ3WjczdENOS2prcUFIQzJkS085Z2Y2?=
 =?utf-8?B?bWxDUk9Ma1phSmJid2R2bCtQdStMd09sa3ZzTHVDcnlycUgyYWJ2ZVlSZWhG?=
 =?utf-8?B?U0FFOWFqUVc5SWdLZkF2V0VHclpyQUdVYnErR0Fzczdaa2lUM2phdExrbm02?=
 =?utf-8?B?cklUVHpjemlhNEgyb2NIWUsvZm9BZHd1Mk42VXBiNTFjeEM1TXQ3UEQ0eUZr?=
 =?utf-8?B?bnlaaW9YOElZUFZRRm9SZzBTY2xnK3RHZkFDbEtlV2VURGcyWmpSb2tIeUd1?=
 =?utf-8?B?ZlFDdi9ubFgrY3NlV0J4TlBBbi9DUmNubXVBRHNpVER3cmYwYXVsWTZ6enBH?=
 =?utf-8?B?UjEvT0MxWWNQMEo0L3Ayb000Tzc5ajNmaXdJQXZZVEYyam9WTHI3ekhXWW9N?=
 =?utf-8?B?TW9Zd2QwbGQzNkhqK2xVV2JTMWg4bVpSS2U0ZTMwVis1OE05STl4Y3Y5NVRF?=
 =?utf-8?B?UGw0RExOQ2dxZXZBU0s1Z3BLUUxFRDdPVmFxcTV0VHNCeWQwU2FyN1ltbkh6?=
 =?utf-8?B?eDdCNzRMeEVzOUFJVXI4ek9GQnVJL0x3djNrZGtOUGVFTUpjakdCdEpaL0Vm?=
 =?utf-8?B?TUFtRmNRLzFQVEUwRjBpOE96ZmxrZ1p4c0NFVGVVYlN5QUMxaGFnMjcwbXlr?=
 =?utf-8?B?ZFZFR1Npd1B5Ui9FVTdrYXV0YTVRVloxVDNLNDRMYmNFRVpGSWw2UkFCRUZO?=
 =?utf-8?B?d1l1NExoMDhjT1owS3BsZkpZaGRGYzc0cVkxVG5PNnd6ZTNGMjdGNlZWU05l?=
 =?utf-8?B?WWNadElZSkF2MktGWEpmZC9yYlVlVXp5dEtVQ3YrVW1zdTRxQlVycFdhYTRx?=
 =?utf-8?B?MmhpTUp2aG9ic001NjQxdHovWTl5b0hDQW0yQ3IxZ2tPODdFMEozZitNS0ZD?=
 =?utf-8?B?ZDhyT3VwRXpTd2NpZjNEdWRhclNieXNlTEc5WjR1cXBRbkN4NmJEV2ppdnV5?=
 =?utf-8?B?NXVnQzU3eUlqYnZyd2UrN0pwZWRQQ3VQUk1aWnE2Ni9DVXVpUUFKb3pMUExq?=
 =?utf-8?B?YTg2aXBQbE55b3h5UzJKVVFlc2NJbzhESzhTMWZXOTF3NUo1L1g2Q1prdWRO?=
 =?utf-8?B?THlMcjZ2Ulh1ZE5qWjRmZUVyZy9saUtybUNIWCtucUtINHFpYkY0MzhVRitP?=
 =?utf-8?B?RS9jdFJub25mZ2hpZGg2blJLbEpKbVVlSVg4NVc1NWhDWUlML0FJbG55RVNT?=
 =?utf-8?B?cUhxTEROMHFRVHM4cmRjYzNpYWdvNjFZMmpqSHNQVWl4VlVIVXBpL0JkRlVB?=
 =?utf-8?B?emdDcjdSTDZjQVlZU01sRURCWFJVc1NJRGwxd01MNVk0SlpjWmJnSkxiakha?=
 =?utf-8?B?d0kyTk4zT2NhcWUrM20wQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVDTG1aa29GamJnMTQycGlJc2t5cXRhZTdWQ3lTZC9ZcGtBVUxGR1Q4emhJ?=
 =?utf-8?B?aU9pSE5HZFdvSENySHIxL1JHckJpd2pjTmhaYndQMmlHbDJLNVZRY3czVjU1?=
 =?utf-8?B?VGhqdXZBam1sSGxxaDk0dVBzR2o0T1BabEFFdDJCUXF0ZnJzWU0wazFiWERQ?=
 =?utf-8?B?NmhqQzR0bTRRNnZIRm9WWWdETnJTVW41YkhhSWxqbTM0T1IxMHZrb2lqQURG?=
 =?utf-8?B?SXljYWoxVUtuaWkvQTkvaVh2dDJEN1NyaFRIOU5YdzV3RHA4WUEvQ1JVMlN2?=
 =?utf-8?B?Nks1d0ZnRUQ0dkV6UVRkU2kwNXV1S2twT01HcFlSNTJZNERnZ0dsWWZOUW83?=
 =?utf-8?B?Vmw0M1pYMjVET0JSYXNweng2MmJDelJxK3FHTkE5UHFyWmFMeWZrQ2l4L1dB?=
 =?utf-8?B?VVRDd3c2eC9QUWsvaHhldXh6Y2lLM0hrbWllMFlJbUlCSTNLTjRSdFE0Ti9L?=
 =?utf-8?B?QWFjeFhWL1RMSmZtU2tpa3F4cU5odUxiSStwOWxxb09EN3VwWlI0LzlxcnlT?=
 =?utf-8?B?TUlzdUZqcDZvc0dqbVk2c2pkakE4ZmVrMTMyMk1GL054QUkxcnV5YkgrV09t?=
 =?utf-8?B?T0I4U2tmSU5mUlhxNGZyMUZtY1JLWUVZUThPVUs4ZU5CczBvbWhNK1pCUElO?=
 =?utf-8?B?Z2hETzU2Y3RCVHMrOHRxZ1ZLc29TdFM0VllzT2dvc0VkeUQ1ek8wSXFQUHhU?=
 =?utf-8?B?NW94QkNGVkw3VVN4ZlVTb0NncUltTVJHSHlqd2ZqZWdEaXpFWEZKTngzMitZ?=
 =?utf-8?B?SXBCcVdGSldXQmpRY01WeWNlc3VoRElQanY2bEhrVlRXS3JZRzRaVFYzRTRM?=
 =?utf-8?B?RWNrK1NQeVVmSVVQUlBIK3k2UjFiZEFyQjBYdFEzenFTN21BN3J5dzd4M3Fk?=
 =?utf-8?B?amVOMU8vSXlHbVZRcWlZVDJ3TGZJZ01ia0F4cUIyaXBlR2pjWHZZcVNaa3Bv?=
 =?utf-8?B?V2s5Wm1mYy8yNm4yc2g3bjRPL2VHUDVrT1A1anlKamhYbTMwT0lXZXBSSFFu?=
 =?utf-8?B?aVJORmgvWllIZ0Jwa3JTaE04MjZGNkVSWi9xM3F6K0V0Vitmc3BMT1k5T25Q?=
 =?utf-8?B?MFVmRVdaVTBZU2Fqci81OXNzY3hzV1Nab2hPU0RUNFMwVUpZTnQxZEo0QzNZ?=
 =?utf-8?B?VjJiTXFMdXdkenhUYXdVaklHN1oxZU02aFhHblJzUFpCUjcwMVRaazhQWWto?=
 =?utf-8?B?L093NjZTWUVmeGNmWHRFdDNFNDdadHRlTWV0Z2N5THEzYkNrTVZveTRjbXph?=
 =?utf-8?B?eUlaM1hMOVN0Z1dOcXNhem5TTXhUQ3hUQ1hHMFN6MDR1MnFqOTVSeU4wRDNL?=
 =?utf-8?B?WnRyY0ZiK0dud3ZhcDhpelAwMkVUVkVkcWZQdVN4NnVZUWVBOEdOUmJXN2Jy?=
 =?utf-8?B?a3VaWFRqVEo0N3NTbUxjUXg4Q1ZMN090c1B3T3lrWGMyRmlac3RsaXM2UC9F?=
 =?utf-8?B?emU1Ny96WWRBcWpjVGM0SGF1QmhvZ3dYL21ZSEhsNVlVcnFZZExObGtRWS8z?=
 =?utf-8?B?Sm5uc2pXUnpJMGVXMzhTK0JPMk1SbEl4eHl4ZHJUQ2t6Mk5RZ2lDRmNHVmZt?=
 =?utf-8?B?SFRTaFJFcGt2S0E3eVFXMDVXd2pUaW5jOGFLdEkyVUNRMTNITks3Slp1ZWZh?=
 =?utf-8?B?Z2trVTl1L2diNkxTQTZudGZjQUY5cE5jQ0s1VHVaWUcxYmxQVDg2RWZRb3h5?=
 =?utf-8?B?NFdjV0g4SVFUbWlQajF1aVo2ZVQyajBBamszb1kxREMyQ1pETW5yKzFaWmlW?=
 =?utf-8?B?dms2YjhSVDFpQlp2ZCsvSnNCTXpUQUZkbHJvdkQvaW1OSHBJcStGMzAxcEtG?=
 =?utf-8?B?ZXBzOEtVWDB4RVczblVFUTlQYjlraThNZnROVE9aWTRsTjlkSzNFcytpb1VM?=
 =?utf-8?B?U0NlNkRnUHFuaWlYSzZPbWpRSTB5MWdJS1U3Y2JqcTNPTnNKVDVkRXF6MnFl?=
 =?utf-8?B?bnAxMDZKSVlXNW1VVm03YzdUSEQzVlp1akVCYnB6clo4YnN0TjlYcFV0NU5Q?=
 =?utf-8?B?Q3dvako0Z3RrdU04MHpORTFYWVFyRkxVOFRJalM5MjVxUnM2cHRzV1dBRVUv?=
 =?utf-8?B?V1A1Nnl2NUpDRWdLcEEyV0RiVEh4NUZyQlAzbkI5UUhpSVY5dEl5R1VPbkpX?=
 =?utf-8?Q?XWeIkq04rh51YzWehP9p4E0or?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4f350a-6225-43be-d113-08dcc5b0aa60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:22:54.5424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+IOKvOuEOIw0y/rN9vVN/MH9dUaDD8Uj6pUQquoeWN+n2lCO/Q1FJCd6InI3VkI3pfFqyrAM8TD939oO3zf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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

--------------2Xih6YtTiLra92XQjn2RdU6R
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 8/26/2024 10:36 AM, Thomas Hellström wrote:
> On Mon, 2024-08-26 at 10:26 +0200, Nirmoy Das wrote:
>> Hi Thomas,
>>
>> On 8/23/2024 11:38 AM, Thomas Hellström wrote:
>>> Hi, Nirmoy,
>>>
>>> On Thu, 2024-08-22 at 14:42 +0200, Nirmoy Das wrote:
>>>> Implement GPU clear-on-free for pooled system pages in Xe.
>>>>
>>>> Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by leveraging
>>>> ttm_device_funcs.release_notify() for GPU clear-on-free. If GPU
>>>> clear
>>>> fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.
>>>>
>>>> Clear-on-free is only relevant for pooled pages as driver needs
>>>> to
>>>> give
>>>> back those pages. So do clear-on-free only for such BOs and keep
>>>> doing
>>>> clear-on-alloc for ttm_cached type BOs
>>>>
>>>> Cc: Matthew Auld<matthew.auld@intel.com>
>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>> While this would probably work, I don't immediately see the benefit
>>> over CPU clearing, since we have no way of combining this with the
>>> CCS
>>> clear, right?
>>
>> If XE/ttm could do clear-on-free(data+CCS) with GPU all the time then
>> I
>> think we could
>>
>> skip ccs clearing on alloc, assuming only GPU access modifies a CCS
>> state and on boot CCS region
>>
>> is zeroed. I think that can't be guaranteed so we have to clear ccs
>> on
>> alloc. I agree, there won't be much
>>
>> latency benefit of doing clear-on-free for ccs devices. I will still
>> try
>> to run some tests to validate it, I have done that for this RFC.

s/have done/haven't done


> OK, yes this would probably work. Do we need to clear all CCS on module
> load or can we safely assume that no useful info is left in the CCS
> memory at that time?


I tried to find some info on this but I don't see any mention of initial 
state of CCS state memory at boot.

I think, currently we are safe as we do clear clearing on alloc so even 
if something is left out, UMD will never see it.

>>
>> I've discussed this with Ron and it seems there is on going
>> conversation
>> if there is a way to avoid ccs clearing if data is zeroed.
>>
>> Let's see how that goes.
>>
>>
>>>    So the clearing latency will most probably be increased,
>>> but the bo releasing thread won't see that because the waiting for
>>> clear is offloaded to the TTM delayed destroy mechanism.
>>>
>>> Also, once we've dropped the gem refcount to zero, the gem members
>>> of
>>> the object, including bo_move, are strictly not valid anymore and
>>> shouldn't be used.
>>
>> Could you please  expand this? I am not seeing the connection between
>> bo_move and refcount.
>>
>> Are you saying release_notify is not the right place to do this ?
> Yes. At release_notify, the gem refcount has dropped to zero, and we
> don't allow calling bo_move at that point, as the driver might want to
> do some cleanup in the gem_release before putting the last ttm_bo
> reference.


What should be the correct place do clear pool pages if we plan to do 
this in future ?


Regards,

Nirmoy

>
> Thanks,
> Thomas
>
>
>>> If we want to try to improve freeing latency by offloading the
>>> clearing
>>> on free to a separate CPU thread, though, maybe we could discuss
>>> with
>>> Christian to always (or if a flag in the ttm device requests it)
>>> take
>>> the TTM delayed destruction path for bos with pooled pages, rather
>>> than
>>> to free them sync, something along the lines of:
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 320592435252..fca69ec1740d 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -271,7 +271,7 @@ static void ttm_bo_release(struct kref *kref)
>>>    
>>>                   if (!dma_resv_test_signaled(bo->base.resv,
>>>                                              
>>> DMA_RESV_USAGE_BOOKKEEP) ||
>>> -                   (want_init_on_free() && (bo->ttm != NULL)) ||
>>> +                   (bo->ttm && (want_init_on_free() || bo->ttm-
>>>> caching != ttm_cached)) ||
>>>                       bo->type == ttm_bo_type_sg ||
>>>                       !dma_resv_trylock(bo->base.resv)) {
>>>                           /* The BO is not idle, resurrect it for
>>> delayed
>>> destroy */
>>>
>>> Would ofc require some substantial proven latency gain, though.
>>> Overall
>>> system cpu usage would probably not improve.
>>
>> I will run some tests with the above change and get back.
>>
>>
>> Thanks,
>>
>> Nirmoy
>>
>>> /Thomas
>>>
>>>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_bo.c | 101
>>>> +++++++++++++++++++++++++++++++++--
>>>> --
>>>>    1 file changed, 91 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>> b/drivers/gpu/drm/xe/xe_bo.c
>>>> index 6ed0e1955215..e7bc74f8ae82 100644
>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>> @@ -283,6 +283,8 @@ struct xe_ttm_tt {
>>>>    	struct device *dev;
>>>>    	struct sg_table sgt;
>>>>    	struct sg_table *sg;
>>>> +	bool sys_clear_on_free;
>>>> +	bool sys_clear_on_alloc;
>>>>    };
>>>>    
>>>>    static int xe_tt_map_sg(struct ttm_tt *tt)
>>>> @@ -401,8 +403,23 @@ static struct ttm_tt
>>>> *xe_ttm_tt_create(struct
>>>> ttm_buffer_object *ttm_bo,
>>>>    	 * flag. Zeroed pages are only required for
>>>> ttm_bo_type_device so
>>>>    	 * unwanted data is not leaked to userspace.
>>>>    	 */
>>>> -	if (ttm_bo->type == ttm_bo_type_device && xe-
>>>>> mem.gpu_page_clear_sys)
>>>> -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>>>> +	if (ttm_bo->type == ttm_bo_type_device && xe-
>>>>> mem.gpu_page_clear_sys) {
>>>> +		/*
>>>> +		 * Non-pooled BOs are always clear on alloc when
>>>> possible.
>>>> +		 * clear-on-free is not needed as there is no
>>>> pool
>>>> to give pages back.
>>>> +		 */
>>>> +		if (caching == ttm_cached) {
>>>> +			tt->sys_clear_on_alloc = true;
>>>> +			tt->sys_clear_on_free = false;
>>>> +		} else {
>>>> +		/*
>>>> +		 * For pooled BO, clear-on-alloc is done by the
>>>> CPU
>>>> for now and
>>>> +		 * GPU will do clear on free when releasing the
>>>> BO.
>>>> +		 */
>>>> +			tt->sys_clear_on_alloc = false;
>>>> +			tt->sys_clear_on_free = true;
>>>> +		}
>>>> +	}
>>>>    
>>>>    	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
>>>> caching,
>>>> extra_pages);
>>>>    	if (err) {
>>>> @@ -416,8 +433,10 @@ static struct ttm_tt
>>>> *xe_ttm_tt_create(struct
>>>> ttm_buffer_object *ttm_bo,
>>>>    static int xe_ttm_tt_populate(struct ttm_device *ttm_dev,
>>>> struct
>>>> ttm_tt *tt,
>>>>    			      struct ttm_operation_ctx *ctx)
>>>>    {
>>>> +	struct xe_ttm_tt *xe_tt;
>>>>    	int err;
>>>>    
>>>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>>>>    	/*
>>>>    	 * dma-bufs are not populated with pages, and the dma-
>>>>    	 * addresses are set up when moved to XE_PL_TT.
>>>> @@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct
>>>> ttm_device
>>>> *ttm_dev, struct ttm_tt *tt,
>>>>    		return 0;
>>>>    
>>>>    	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
>>>> system pages */
>>>> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
>>>> +	if (xe_tt->sys_clear_on_alloc)
>>>>    		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>>>>    
>>>>    	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>>>> @@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct
>>>> ttm_device
>>>> *ttm_dev, struct ttm_tt *tt,
>>>>    
>>>>    static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev,
>>>> struct
>>>> ttm_tt *tt)
>>>>    {
>>>> +	struct xe_ttm_tt *xe_tt;
>>>> +
>>>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>>>> +
>>>>    	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>>>>    		return;
>>>>    
>>>>    	xe_tt_unmap_sg(tt);
>>>>    
>>>> +	/* Hint TTM pool that pages are already cleared */
>>>> +	if (xe_tt->sys_clear_on_free)
>>>> +		tt->page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>>>> +
>>>>    	return ttm_pool_free(&ttm_dev->pool, tt);
>>>>    }
>>>>    
>>>> @@ -664,6 +691,7 @@ static int xe_bo_move(struct
>>>> ttm_buffer_object
>>>> *ttm_bo, bool evict,
>>>>    	struct ttm_resource *old_mem = ttm_bo->resource;
>>>>    	u32 old_mem_type = old_mem ? old_mem->mem_type :
>>>> XE_PL_SYSTEM;
>>>>    	struct ttm_tt *ttm = ttm_bo->ttm;
>>>> +	struct xe_ttm_tt *xe_tt;
>>>>    	struct xe_migrate *migrate = NULL;
>>>>    	struct dma_fence *fence;
>>>>    	bool move_lacks_source;
>>>> @@ -674,12 +702,13 @@ static int xe_bo_move(struct
>>>> ttm_buffer_object
>>>> *ttm_bo, bool evict,
>>>>    	bool clear_system_pages;
>>>>    	int ret = 0;
>>>>    
>>>> +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>>>> ttm);
>>>>    	/*
>>>>    	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
>>>> when
>>>>    	 * moving to system as the bo doesn't have dma_mapping.
>>>>    	 */
>>>>    	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
>>>> -		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
>>>> +		xe_tt->sys_clear_on_alloc = false;
>>>>    
>>>>    	/* Bo creation path, moving to system or TT. */
>>>>    	if ((!old_mem && ttm) && !handle_system_ccs) {
>>>> @@ -703,10 +732,9 @@ static int xe_bo_move(struct
>>>> ttm_buffer_object
>>>> *ttm_bo, bool evict,
>>>>    	move_lacks_source = handle_system_ccs ? (!bo-
>>>>> ccs_cleared)
>>>> :
>>>>    						(!mem_type_is_vr
>>>> am(o
>>>> ld_mem_type) && !tt_has_data);
>>>>    
>>>> -	clear_system_pages = ttm && (ttm->page_flags &
>>>> TTM_TT_FLAG_CLEARED_ON_FREE);
>>>> +	clear_system_pages = ttm && xe_tt->sys_clear_on_alloc;
>>>>    	needs_clear = (ttm && ttm->page_flags &
>>>> TTM_TT_FLAG_ZERO_ALLOC) ||
>>>> -		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
>>>> -		clear_system_pages;
>>>> +		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
>>>> clear_system_pages;
>>>>    
>>>>    	if (new_mem->mem_type == XE_PL_TT) {
>>>>    		ret = xe_tt_map_sg(ttm);
>>>> @@ -1028,10 +1056,47 @@ static bool
>>>> xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>>>>    	return locked;
>>>>    }
>>>>    
>>>> +static struct dma_fence *xe_ttm_bo_clear_on_free(struct
>>>> ttm_buffer_object *ttm_bo)
>>>> +{
>>>> +	struct xe_bo *bo  = ttm_to_xe_bo(ttm_bo);
>>>> +	struct xe_device *xe = xe_bo_device(bo);
>>>> +	struct xe_migrate *migrate;
>>>> +	struct xe_ttm_tt *xe_tt;
>>>> +	struct dma_fence *clear_fence;
>>>> +
>>>> +	/* return early if nothing to clear */
>>>> +	if (!ttm_bo->ttm)
>>>> +		return NULL;
>>>> +
>>>> +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>>>> ttm);
>>>> +	/* return early if nothing to clear */
>>>> +	if (!xe_tt->sys_clear_on_free || !bo->ttm.resource)
>>>> +		return NULL;
>>>> +
>>>> +	if (XE_WARN_ON(!xe_tt->sg))
>>>> +		return NULL;
>>>> +
>>>> +	if (bo->tile)
>>>> +		migrate = bo->tile->migrate;
>>>> +	else
>>>> +		migrate = xe->tiles[0].migrate;
>>>> +
>>>> +	xe_assert(xe, migrate);
>>>> +
>>>> +	clear_fence = xe_migrate_clear(migrate, bo, bo-
>>>>> ttm.resource,
>>>> +				
>>>> XE_MIGRATE_CLEAR_FLAG_FULL);
>>>> +	if (IS_ERR(clear_fence))
>>>> +		return NULL;
>>>> +
>>>> +	xe_tt->sys_clear_on_free = false;
>>>> +
>>>> +	return clear_fence;
>>>> +}
>>>> +
>>>>    static void xe_ttm_bo_release_notify(struct ttm_buffer_object
>>>> *ttm_bo)
>>>>    {
>>>>    	struct dma_resv_iter cursor;
>>>> -	struct dma_fence *fence;
>>>> +	struct dma_fence *clear_fence, *fence;
>>>>    	struct dma_fence *replacement = NULL;
>>>>    	struct xe_bo *bo;
>>>>    
>>>> @@ -1041,15 +1106,31 @@ static void
>>>> xe_ttm_bo_release_notify(struct
>>>> ttm_buffer_object *ttm_bo)
>>>>    	bo = ttm_to_xe_bo(ttm_bo);
>>>>    	xe_assert(xe_bo_device(bo), !(bo->created &&
>>>> kref_read(&ttm_bo->base.refcount)));
>>>>    
>>>> +	clear_fence = xe_ttm_bo_clear_on_free(ttm_bo);
>>>> +
>>>>    	/*
>>>>    	 * Corner case where TTM fails to allocate memory and
>>>> this
>>>> BOs resv
>>>>    	 * still points the VMs resv
>>>>    	 */
>>>> -	if (ttm_bo->base.resv != &ttm_bo->base._resv)
>>>> +	if (ttm_bo->base.resv != &ttm_bo->base._resv) {
>>>> +		if (clear_fence)
>>>> +			dma_fence_wait(clear_fence, false);
>>>>    		return;
>>>> +	}
>>>>    
>>>> -	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
>>>> +	if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
>>>> +		if (clear_fence)
>>>> +			dma_fence_wait(clear_fence, false);
>>>>    		return;
>>>> +	}
>>>> +
>>>> +	if (clear_fence) {
>>>> +		if (dma_resv_reserve_fences(ttm_bo->base.resv,
>>>> 1))
>>>> +			dma_fence_wait(clear_fence, false);
>>>> +		else
>>>> +			dma_resv_add_fence(ttm_bo->base.resv,
>>>> clear_fence,
>>>> +					
>>>> DMA_RESV_USAGE_KERNEL);
>>>> +	}
>>>>    
>>>>    	/*
>>>>    	 * Scrub the preempt fences if any. The unbind fence is
>>>> already
--------------2Xih6YtTiLra92XQjn2RdU6R
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Thomas,<br>
    </p>
    <div class="moz-cite-prefix">On 8/26/2024 10:36 AM, Thomas Hellström
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, 2024-08-26 at 10:26 +0200, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hi Thomas,

On 8/23/2024 11:38 AM, Thomas Hellström wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi, Nirmoy,

On Thu, 2024-08-22 at 14:42 +0200, Nirmoy Das wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Implement GPU clear-on-free for pooled system pages in Xe.

Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by leveraging
ttm_device_funcs.release_notify() for GPU clear-on-free. If GPU
clear
fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.

Clear-on-free is only relevant for pooled pages as driver needs
to
give
back those pages. So do clear-on-free only for such BOs and keep
doing
clear-on-alloc for ttm_cached type BOs

Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">While this would probably work, I don't immediately see the benefit
over CPU clearing, since we have no way of combining this with the
CCS
clear, right?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">

If XE/ttm could do clear-on-free(data+CCS) with GPU all the time then
I 
think we could

skip ccs clearing on alloc, assuming only GPU access modifies a CCS 
state and on boot CCS region

is zeroed. I think that can't be guaranteed so we have to clear ccs
on 
alloc. I agree, there won't be much

latency benefit of doing clear-on-free for ccs devices. I will still
try 
to run some tests to validate it, I have done that for this RFC.</pre>
      </blockquote>
    </blockquote>
    <p>s/have done/haven't done</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
OK, yes this would probably work. Do we need to clear all CCS on module
load or can we safely assume that no useful info is left in the CCS
memory at that time?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I tried to find some info on this but I don't see any mention of
      initial state of CCS state memory at boot.</p>
    <p>I think, currently we are safe as we do clear clearing on alloc
      so even if something is left out, UMD will never see it.<span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

I've discussed this with Ron and it seems there is on going
conversation 
if there is a way to avoid ccs clearing if data is zeroed.

Let's see how that goes.


</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">&nbsp; So the clearing latency will most probably be increased,
but the bo releasing thread won't see that because the waiting for
clear is offloaded to the TTM delayed destroy mechanism.

Also, once we've dropped the gem refcount to zero, the gem members
of
the object, including bo_move, are strictly not valid anymore and
shouldn't be used.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">

Could you please&nbsp; expand this? I am not seeing the connection between
bo_move and refcount.

Are you saying release_notify is not the right place to do this ?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Yes. At release_notify, the gem refcount has dropped to zero, and we
don't allow calling bo_move at that point, as the driver might want to
do some cleanup in the gem_release before putting the last ttm_bo
reference.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>What should be the correct place do clear pool pages if we plan
      to do this in future ?</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy <br>
    </p>
    <blockquote type="cite" cite="mid:e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Thomas


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">If we want to try to improve freeing latency by offloading the
clearing
on free to a separate CPU thread, though, maybe we could discuss
with
Christian to always (or if a flag in the ttm device requests it)
take
the TTM delayed destruction path for bos with pooled pages, rather
than
to free them sync, something along the lines of:

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
b/drivers/gpu/drm/ttm/ttm_bo.c
index 320592435252..fca69ec1740d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -271,7 +271,7 @@ static void ttm_bo_release(struct kref *kref)
&nbsp; 
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!dma_resv_test_signaled(bo-&gt;base.resv,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
DMA_RESV_USAGE_BOOKKEEP) ||
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (want_init_on_free() &amp;&amp; (bo-&gt;ttm != NULL)) ||
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (bo-&gt;ttm &amp;&amp; (want_init_on_free() || bo-&gt;ttm-
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">caching != ttm_cached)) ||
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;type == ttm_bo_type_sg ||
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !dma_resv_trylock(bo-&gt;base.resv)) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The BO is not idle, resurrect it for
delayed
destroy */

Would ofc require some substantial proven latency gain, though.
Overall
system cpu usage would probably not improve.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">

I will run some tests with the above change and get back.


Thanks,

Nirmoy

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
/Thomas


</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">---
&nbsp;&nbsp;drivers/gpu/drm/xe/xe_bo.c | 101
+++++++++++++++++++++++++++++++++--
--
&nbsp;&nbsp;1 file changed, 91 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c
b/drivers/gpu/drm/xe/xe_bo.c
index 6ed0e1955215..e7bc74f8ae82 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -283,6 +283,8 @@ struct xe_ttm_tt {
&nbsp;&nbsp;	struct device *dev;
&nbsp;&nbsp;	struct sg_table sgt;
&nbsp;&nbsp;	struct sg_table *sg;
+	bool sys_clear_on_free;
+	bool sys_clear_on_alloc;
&nbsp;&nbsp;};
&nbsp; 
&nbsp;&nbsp;static int xe_tt_map_sg(struct ttm_tt *tt)
@@ -401,8 +403,23 @@ static struct ttm_tt
*xe_ttm_tt_create(struct
ttm_buffer_object *ttm_bo,
&nbsp;&nbsp;	 * flag. Zeroed pages are only required for
ttm_bo_type_device so
&nbsp;&nbsp;	 * unwanted data is not leaked to userspace.
&nbsp;&nbsp;	 */
-	if (ttm_bo-&gt;type == ttm_bo_type_device &amp;&amp; xe-
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">mem.gpu_page_clear_sys)
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">-		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+	if (ttm_bo-&gt;type == ttm_bo_type_device &amp;&amp; xe-
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">mem.gpu_page_clear_sys) {
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">+		/*
+		 * Non-pooled BOs are always clear on alloc when
possible.
+		 * clear-on-free is not needed as there is no
pool
to give pages back.
+		 */
+		if (caching == ttm_cached) {
+			tt-&gt;sys_clear_on_alloc = true;
+			tt-&gt;sys_clear_on_free = false;
+		} else {
+		/*
+		 * For pooled BO, clear-on-alloc is done by the
CPU
for now and
+		 * GPU will do clear on free when releasing the
BO.
+		 */
+			tt-&gt;sys_clear_on_alloc = false;
+			tt-&gt;sys_clear_on_free = true;
+		}
+	}
&nbsp; 
&nbsp;&nbsp;	err = ttm_tt_init(&amp;tt-&gt;ttm, &amp;bo-&gt;ttm, page_flags,
caching,
extra_pages);
&nbsp;&nbsp;	if (err) {
@@ -416,8 +433,10 @@ static struct ttm_tt
*xe_ttm_tt_create(struct
ttm_buffer_object *ttm_bo,
&nbsp;&nbsp;static int xe_ttm_tt_populate(struct ttm_device *ttm_dev,
struct
ttm_tt *tt,
&nbsp;&nbsp;			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_operation_ctx *ctx)
&nbsp;&nbsp;{
+	struct xe_ttm_tt *xe_tt;
&nbsp;&nbsp;	int err;
&nbsp; 
+	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
&nbsp;&nbsp;	/*
&nbsp;&nbsp;	 * dma-bufs are not populated with pages, and the dma-
&nbsp;&nbsp;	 * addresses are set up when moved to XE_PL_TT.
@@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct
ttm_device
*ttm_dev, struct ttm_tt *tt,
&nbsp;&nbsp;		return 0;
&nbsp; 
&nbsp;&nbsp;	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
system pages */
-	if (tt-&gt;page_flags &amp; TTM_TT_FLAG_CLEARED_ON_FREE)
+	if (xe_tt-&gt;sys_clear_on_alloc)
&nbsp;&nbsp;		tt-&gt;page_flags &amp;= ~TTM_TT_FLAG_ZERO_ALLOC;
&nbsp; 
&nbsp;&nbsp;	err = ttm_pool_alloc(&amp;ttm_dev-&gt;pool, tt, ctx);
@@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct
ttm_device
*ttm_dev, struct ttm_tt *tt,
&nbsp; 
&nbsp;&nbsp;static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev,
struct
ttm_tt *tt)
&nbsp;&nbsp;{
+	struct xe_ttm_tt *xe_tt;
+
+	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
+
&nbsp;&nbsp;	if (tt-&gt;page_flags &amp; TTM_TT_FLAG_EXTERNAL)
&nbsp;&nbsp;		return;
&nbsp; 
&nbsp;&nbsp;	xe_tt_unmap_sg(tt);
&nbsp; 
+	/* Hint TTM pool that pages are already cleared */
+	if (xe_tt-&gt;sys_clear_on_free)
+		tt-&gt;page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
+
&nbsp;&nbsp;	return ttm_pool_free(&amp;ttm_dev-&gt;pool, tt);
&nbsp;&nbsp;}
&nbsp; 
@@ -664,6 +691,7 @@ static int xe_bo_move(struct
ttm_buffer_object
*ttm_bo, bool evict,
&nbsp;&nbsp;	struct ttm_resource *old_mem = ttm_bo-&gt;resource;
&nbsp;&nbsp;	u32 old_mem_type = old_mem ? old_mem-&gt;mem_type :
XE_PL_SYSTEM;
&nbsp;&nbsp;	struct ttm_tt *ttm = ttm_bo-&gt;ttm;
+	struct xe_ttm_tt *xe_tt;
&nbsp;&nbsp;	struct xe_migrate *migrate = NULL;
&nbsp;&nbsp;	struct dma_fence *fence;
&nbsp;&nbsp;	bool move_lacks_source;
@@ -674,12 +702,13 @@ static int xe_bo_move(struct
ttm_buffer_object
*ttm_bo, bool evict,
&nbsp;&nbsp;	bool clear_system_pages;
&nbsp;&nbsp;	int ret = 0;
&nbsp; 
+	xe_tt = container_of(ttm_bo-&gt;ttm, struct xe_ttm_tt,
ttm);
&nbsp;&nbsp;	/*
&nbsp;&nbsp;	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
when
&nbsp;&nbsp;	 * moving to system as the bo doesn't have dma_mapping.
&nbsp;&nbsp;	 */
&nbsp;&nbsp;	if (!old_mem &amp;&amp; ttm &amp;&amp; !ttm_tt_is_populated(ttm))
-		ttm-&gt;page_flags &amp;= ~TTM_TT_FLAG_CLEARED_ON_FREE;
+		xe_tt-&gt;sys_clear_on_alloc = false;
&nbsp; 
&nbsp;&nbsp;	/* Bo creation path, moving to system or TT. */
&nbsp;&nbsp;	if ((!old_mem &amp;&amp; ttm) &amp;&amp; !handle_system_ccs) {
@@ -703,10 +732,9 @@ static int xe_bo_move(struct
ttm_buffer_object
*ttm_bo, bool evict,
&nbsp;&nbsp;	move_lacks_source = handle_system_ccs ? (!bo-
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">ccs_cleared)
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">:
&nbsp;&nbsp;						(!mem_type_is_vr
am(o
ld_mem_type) &amp;&amp; !tt_has_data);
&nbsp; 
-	clear_system_pages = ttm &amp;&amp; (ttm-&gt;page_flags &amp;
TTM_TT_FLAG_CLEARED_ON_FREE);
+	clear_system_pages = ttm &amp;&amp; xe_tt-&gt;sys_clear_on_alloc;
&nbsp;&nbsp;	needs_clear = (ttm &amp;&amp; ttm-&gt;page_flags &amp;
TTM_TT_FLAG_ZERO_ALLOC) ||
-		(!ttm &amp;&amp; ttm_bo-&gt;type == ttm_bo_type_device) ||
-		clear_system_pages;
+		(!ttm &amp;&amp; ttm_bo-&gt;type == ttm_bo_type_device) ||
clear_system_pages;
&nbsp; 
&nbsp;&nbsp;	if (new_mem-&gt;mem_type == XE_PL_TT) {
&nbsp;&nbsp;		ret = xe_tt_map_sg(ttm);
@@ -1028,10 +1056,47 @@ static bool
xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
&nbsp;&nbsp;	return locked;
&nbsp;&nbsp;}
&nbsp; 
+static struct dma_fence *xe_ttm_bo_clear_on_free(struct
ttm_buffer_object *ttm_bo)
+{
+	struct xe_bo *bo&nbsp; = ttm_to_xe_bo(ttm_bo);
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_migrate *migrate;
+	struct xe_ttm_tt *xe_tt;
+	struct dma_fence *clear_fence;
+
+	/* return early if nothing to clear */
+	if (!ttm_bo-&gt;ttm)
+		return NULL;
+
+	xe_tt = container_of(ttm_bo-&gt;ttm, struct xe_ttm_tt,
ttm);
+	/* return early if nothing to clear */
+	if (!xe_tt-&gt;sys_clear_on_free || !bo-&gt;ttm.resource)
+		return NULL;
+
+	if (XE_WARN_ON(!xe_tt-&gt;sg))
+		return NULL;
+
+	if (bo-&gt;tile)
+		migrate = bo-&gt;tile-&gt;migrate;
+	else
+		migrate = xe-&gt;tiles[0].migrate;
+
+	xe_assert(xe, migrate);
+
+	clear_fence = xe_migrate_clear(migrate, bo, bo-
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">ttm.resource,
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">+				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
XE_MIGRATE_CLEAR_FLAG_FULL);
+	if (IS_ERR(clear_fence))
+		return NULL;
+
+	xe_tt-&gt;sys_clear_on_free = false;
+
+	return clear_fence;
+}
+
&nbsp;&nbsp;static void xe_ttm_bo_release_notify(struct ttm_buffer_object
*ttm_bo)
&nbsp;&nbsp;{
&nbsp;&nbsp;	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
+	struct dma_fence *clear_fence, *fence;
&nbsp;&nbsp;	struct dma_fence *replacement = NULL;
&nbsp;&nbsp;	struct xe_bo *bo;
&nbsp; 
@@ -1041,15 +1106,31 @@ static void
xe_ttm_bo_release_notify(struct
ttm_buffer_object *ttm_bo)
&nbsp;&nbsp;	bo = ttm_to_xe_bo(ttm_bo);
&nbsp;&nbsp;	xe_assert(xe_bo_device(bo), !(bo-&gt;created &amp;&amp;
kref_read(&amp;ttm_bo-&gt;base.refcount)));
&nbsp; 
+	clear_fence = xe_ttm_bo_clear_on_free(ttm_bo);
+
&nbsp;&nbsp;	/*
&nbsp;&nbsp;	 * Corner case where TTM fails to allocate memory and
this
BOs resv
&nbsp;&nbsp;	 * still points the VMs resv
&nbsp;&nbsp;	 */
-	if (ttm_bo-&gt;base.resv != &amp;ttm_bo-&gt;base._resv)
+	if (ttm_bo-&gt;base.resv != &amp;ttm_bo-&gt;base._resv) {
+		if (clear_fence)
+			dma_fence_wait(clear_fence, false);
&nbsp;&nbsp;		return;
+	}
&nbsp; 
-	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
+	if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
+		if (clear_fence)
+			dma_fence_wait(clear_fence, false);
&nbsp;&nbsp;		return;
+	}
+
+	if (clear_fence) {
+		if (dma_resv_reserve_fences(ttm_bo-&gt;base.resv,
1))
+			dma_fence_wait(clear_fence, false);
+		else
+			dma_resv_add_fence(ttm_bo-&gt;base.resv,
clear_fence,
+					&nbsp;&nbsp;
DMA_RESV_USAGE_KERNEL);
+	}
&nbsp; 
&nbsp;&nbsp;	/*
&nbsp;&nbsp;	 * Scrub the preempt fences if any. The unbind fence is
already
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------2Xih6YtTiLra92XQjn2RdU6R--
