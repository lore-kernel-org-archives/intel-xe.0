Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B80EFEFB4D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:26:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3011110EB41;
	Fri, 27 Feb 2026 13:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8wPWHvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019B610EB40
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772198771; x=1803734771;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=FLlbAv5TruuZN0R4EAoMBcF6OIljs1GcLED6M4BqGSY=;
 b=b8wPWHvngMwp58e2BGRXp7ZCBwqZ8UW95EhJRQPxqf/WZnw6xOtAgStc
 2C/LvKENHOwqKqFWmjv7afsnWWQlxoNIXma+3SNNiJIo4T9M56PgotvLA
 7R656NlogZsM6CQ1XwqJui9GvOtdH3W1hihos5XimdpT4OUlH/FY3rlBP
 4kk2yFcwoquYtVOjPNpLj7bzg2IArv5qUTIHMrTYoCinJZIlBoGvNfcel
 A5IRM8266/reW/uVnzDCdXRpEpAZpwrDngVX3BHEH+aqIloMiCpE9Ppr1
 cdaB91weglr3xYiwbCq1kuserC6rQO7rXIlB912uxoUfdRaaJp01E5YFJ Q==;
X-CSE-ConnectionGUID: IjGDVQPfQR2rFA44tlvwWA==
X-CSE-MsgGUID: LzykGUkJS4CLopJE8T4VqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73463998"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208,217";a="73463998"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:26:11 -0800
X-CSE-ConnectionGUID: 7JfR0+8ZT2uj6JflYSHn5g==
X-CSE-MsgGUID: v5C43hj2Q+OBHXvzIVECCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
 d="scan'208,217";a="244280758"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:26:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 05:26:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 05:26:09 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 05:26:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjut29WGVaOcZ/8RVx/TTHcqvVXfsFZK6mr45rtFcl2zQiJ4fq2LDgn+Xv4XvN2gFbTI2S7GR50pn1bQPDGEf533OdbHjPcEXw+LrtD2Tzg3Lri4Ygz2UdxvZHV32DbEpkpBMctbdQLwGTmASTwZwW9QDcrAIGnMokdUNZiW+ZH2i6i5IeUrTKY20ZxrnOkOerk/1AQAqyPCr0F/nIf5T4QyvlTGYZnmON7WwsGJlCW6dmTv6prUQTN3UJvkwhzTC/dg5Dg84/QcbejhmVj0K3IYk4HOBHam9ckeLk6AMFtLcYE6km2+/+kTPhAjgMOEWOsxQpTGzdafwHnkRDMAnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hTd0FFS27Gvh4+8m+64kQZlnkewvVTckNAX8aM/D+M=;
 b=hUNOn36NOJnGbMq8YJdBeq7x10Kf52PCyN38aMgMP5f+Gc+KadlM/fyV7q7H/Kp5gICF/rcPGNU4GIH8BOeUOwO9R2UPf7tP4TIFEqLgBNDMC3u8qtUhBzGwowu6QoPa2IYBvyvrOkEJ0UIifVYnHPHbYaqfUuDi+heTC64xOb8tuYMrgxq55uuf2rpnZuhw/RtQEDWMRefp1KCMWFGgKzWdGNHMmWgAfl8HSjJvmJUTYHe5LCROQdF6GKleu21XBxssgvFEA+ucXOhRU/aYnLDH+j3slDNC7YM+btZocTc0fl7hlu3pJ/6dPvIk4sxqhYTUatwxxcjkpGDZCUFV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 13:25:55 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 13:25:54 +0000
Content-Type: multipart/alternative;
 boundary="------------z0cFmW8xhYdYcIyuDc0WWpzC"
Message-ID: <ee5cc042-3785-481c-8dea-44372f5b9350@intel.com>
Date: Fri, 27 Feb 2026 14:25:51 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvdmY6?=
 =?UTF-8?Q?_Fix_exec_queue_creation_during_post-migration_recovery_=28rev4?=
 =?UTF-8?Q?=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260226212701.2937065-1-tomasz.lis@intel.com>
 <177216382264.293785.15820279821045060817@a3b018990fe9>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <177216382264.293785.15820279821045060817@a3b018990fe9>
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|BN9PR11MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: aa951c33-5553-4889-50dc-08de7603bc0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: yXn8NfGGQGH8wjd7ogC7qvL0yFmfZSE+EA2syij15jlS11027ncKW4njEm7v7BTBpPuNr8v8B0ZiwaU0sKE09TrbOJ5IuM+xGlzxv4UaAkQbegQDNxTQhDfJ1fj+5YrZYocDR4puUchgXbYAVbD5Sgw3Id74teRbBk6eLzCQbTU4kifCuwIetLZYA8pW3A1xfFu2MbYlHtcQtjaewAYPIJKFMEcr/dVuDaI4Uv0jw3u6lBYhTpXcTViqA6yhyZTyYtLBIloUhG8KWe1G7+T7K7CTQPzpXJqhSG8QU4EfyEO3EVas4II6ELd6QW2Tb5oJcuMEZuPQRn0yFmiEKka1oqPc7+qvlPGp68VoA8dT9NI6dxZF4CS87O9FpAH+wy/p1adKlJ8cybZ30J/Qf5YNUTGp0x1XoOOVOBAExbA9myrE31KetuRInfVZLukEqBDJcfS4W7+GNSEc8j9MS/n6nj7scoPMLtPn0LdJaupqccjT7vwVsfrDs1J01yswK5uwARMgeRsfTwh39KtYAWNWPq7T4uN+pncYjxBofL40hM0oBS5Dzy+P5Wfl5iu9LR0CSzHllzG3XYZpUI8ueKt0qIwiKUw2syd5wJ+Q0+RTCNE9MOeMKhTGgnNF4SA9Hgn9R2FliRmUGDBHK0SlT+lBWMHFd2tcUyC+4vte+Jq9u1R9CFqPoFSJmq5BweUpLPxn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2J6OHRBU0QwSDYxbzJuZlBEd0FnT2FYWUZCZjFPTnl4QmdXWlF0NEY1NjBK?=
 =?utf-8?B?TGlYV2F3VUpBYXErdTBLcjhwTGhoMXlnWERNMTFDWk43Y1lRM3NCMlB2NU1K?=
 =?utf-8?B?SUhnc0syakNkckdOamFTb3VlVXJPSVhQYjVzcnlZNTk3T0RId1ZTckNTVktS?=
 =?utf-8?B?aGNCcjdsdGNFcUlIcTU2V1UwZWk1cW9SbFd4NC9KaWVuMjNEZ3U4cm9pQlRL?=
 =?utf-8?B?RnpOdTgrRWhqbURvRUFENlJEc3NYUVc0Z2tPVGZpUEdBc3dxWkNvVjBXekhN?=
 =?utf-8?B?TVBKNW1RWnpGalB6TFdlOHpnMFBTdGhVVnpEMFAyeXBYc2hZTlh2aHRaWWRj?=
 =?utf-8?B?eFI1eVVYc2lRVXBJMndERzIwSnVsS3V5d2F6anc2am9ZQVZtTVR4QVNZdXdK?=
 =?utf-8?B?NmdSMGZFUExlZ2QrK1FHN1RiSVNCN0NCeWNXMndOdVRvc2JlSW84YjBCWEpJ?=
 =?utf-8?B?a2F0TnMwajZDODkxOWdxVW9udGp5d2FVKzZid2VxVFhZVy9Wczcxd0htSzdM?=
 =?utf-8?B?VVBwSVNIYVIxeGcwYUVkL0IzWElIME9HazBJR2hNeUs0TnI2TjVRYnkxSkgw?=
 =?utf-8?B?SHBRc2h2MFB6MWZFWkwwQkdtRW5IcjVXcUdKN3BsMnhrNFNzcnRpY2RVcmx3?=
 =?utf-8?B?cVNzVE9jRnFydHhaTkdpWkx1VHpvNVI5cEZibnY2WFlNM3dTdUY5VzMrQ2tF?=
 =?utf-8?B?bDR5bGhZcE9oeW5iWmo2S2ZBb1RKN09tZ2Iya05zWFNtM213Rkg5ZW9XdVp3?=
 =?utf-8?B?MXFDc1Z6Wkt3WFlUekpSZklUQWQrRjYzdU9RaStaL0QrSi9GNHBONForVXlR?=
 =?utf-8?B?OTRtaXVlQ3Z2eWxZOUNHMm14NlJXd3BzVGpiSFVITTlsT2RpWmV5c2ZxbSsw?=
 =?utf-8?B?TktOMDhERXNaT1hPR2lqVkR1OWN3Skt6dXV6OWZENGI5elVFbTNYcGJEZG1i?=
 =?utf-8?B?aS9IYmxWbVVCSFZFS08wblVTSzBPWVM4VmZONEprMC8vNmN5M1B3NU5Qazhh?=
 =?utf-8?B?OCttWXN4VFBkRXdzZEZ6UUVVMmVRc3FGdDNZTDJBZTNyZFUzbXNLbnkwdEE3?=
 =?utf-8?B?cVNVRGJwTmErT3BrUjN5YVJiSHUzUHZCOFBycFZ2b0ZQU1loUjZoMmtOTHBJ?=
 =?utf-8?B?YjBFWUtWT3h5dDN5ZDZsSS91SFlpZWJ6cHNkSnVVN0RnZjlka2hNZXd1UkFE?=
 =?utf-8?B?ZXhYMmRxS1NaR2swdGxiTVFsNThuQklEQnYwRmlsQU1oRlJMV05aUSt4akpR?=
 =?utf-8?B?ZEVOb1BOTVBqOTBMSGxXd1d2MEl0VTBtN3NISUs4bk0rZDhlTEJMM1VuRHNV?=
 =?utf-8?B?c2kxNUVHVEVhcmRiM1Q2bkNFR1J2TlU3ZU96MzNwbUZ4RmZRSkcxU1lWcVFP?=
 =?utf-8?B?aVUwVFR6SE5ucUVoa1JibUtsYzlXSG5SS0hTWjhQMlJvWkpEbGRqZCsxNGV2?=
 =?utf-8?B?bmFCd1RvUEorTWZQaEJaTklObkRWUWNCV0QyQi8rNkxjVTdZSUNrdytycWw3?=
 =?utf-8?B?UGwvei90VmFOQzVYSFBIMVBwaTFtSDRHVlRFTnBDZ2xhN05UejVkNnlIWHpW?=
 =?utf-8?B?UXhlc25taS9KTHBGRGwyVTBCalByYVNqYTY2a0hLOHZkUzNtZG96SEI2NG9i?=
 =?utf-8?B?MndRbmNVQ3hHcGlVdGRCRkZlMW0rR1JTN0ZaYTlwamlyZnZ3Q2F2Y2UwdjJS?=
 =?utf-8?B?RS9nU1NxTWJ5Q1BpWFFVdHFmalhoWXI0VU1zZUNKQlk1MUVkWDUvWFV4Vlht?=
 =?utf-8?B?ZzhPSG50U1BGWStaYVQ3WmN4MmRtVEo1U0pDM3RFWjhhc1ovdGRFVXppTmNF?=
 =?utf-8?B?c2w4Q1RkemE2djYydVVkYU5QRXFNaUpweHlkUWMwaHNGZndJSFFrUG5BRitR?=
 =?utf-8?B?N0F3V3FpOGc5b0VOTFgranNPNXhjTWEwbkRQZUIxRjlHSEV2Ylh2OXowVHFN?=
 =?utf-8?B?Rzh3R2ZucDVBY3h6WmlhN1ErRFIrRkpGRXpzNUxrbkt0VkZyYXU5ejNCUW04?=
 =?utf-8?B?cW9yNVJBVUlxS1EzaFhpNCtDbzE1NXRrdGptRjdPZldNSGxDSVZ1WFVhNWtV?=
 =?utf-8?B?Umd4eWRRT3ZianhoK2x3Z3RxODZxUGdNcEl1dkdKKzJYa2h0dUJ4c1ZtVWpp?=
 =?utf-8?B?V3F6blhUbkorSHdacFpmREhDekZKMU1OcURBVmhBaWhiRzhqcE5MUGkyN0xh?=
 =?utf-8?B?QjV0YWRIWmtLeHZBN3VhUm1aYkE3cmQzOVI0SmwrdUo2dm53VE1rSlZ5OEtj?=
 =?utf-8?B?NzhnbGIzRWFZaGYxaDBkQkoyL2h3Q2VkTUlVOXhZdmpZN1o1RHhGVElCY3R4?=
 =?utf-8?B?ZEJ2dXQ0aDZBM0FpNzFrd0JSZzlXbmlTNmFJVGxaRndZL25rNDI0Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa951c33-5553-4889-50dc-08de7603bc0b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 13:25:54.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cekhLZj2BcwfQ41/CBJBX11zMfb3JEpmkkQ4VEI4QD73HlhkySjvLvkGiUWmrXrJY/M9IfRsldB0TS34QPH33g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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

--------------z0cFmW8xhYdYcIyuDc0WWpzC
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Analysis of fails:

* igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:

This display test required a compressed framebuffer, but got 
uncompressed one. It is not possible to lint that to the series under test.

It is bad that we have a test which may fail due to KMDs decision. 
Someone from display team should make sure that test design is adjusted 
to KMDs logic.


* igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:

I guess the test checks if vblank wait is interruptible? And it is, 
though it looks like the error path is not clean of errors. But this is 
display issue, unrelated to the series under test.


* igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:

Another vblank interruption test, a different problem in error path. 
Display team should fix their error paths. Not related to series under test.


* igt@kms_plane_alpha_blend@constant-alpha-max:

That's new - not a display problem, but GuC problem. I don't think it's 
a good idea to try dumping GuC log to dmesg though - we should have 
separate mechanisms for capturing GuC log. Dumping 10MB of encoded 
binary data into dmesg does not look right, and makes the log harder to 
read. I don't think GuC should ever crash, so GuC team should take a 
look. Unrelated to series under test.


* igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:

Despite the test name, issue did not happened during exec queue 
operations but during unbind. It looks like - not a surprise - display 
code caused a general protection fault. The display code seem to be 
unsafe during unbind. "sleeping function called from invalid context" - 
this should never happen. The display code is clearly broken. If an 
issue with such message became a sporadic, this also means the code 
lacks asserts.


Almost all fails being related to display support, could mean that 
display is way better tested than other blocks of the KMD. Unfortunately 
looking at the fails suggests that the reason is simpler - we have some 
serious problems within our display code. The code has invalid flows in 
error paths, and races in kmd unbind path. The sporadics will not go 
away until fixed.


I did not found any indication of any of the issues being related to the 
series under test. Also none of these cases reproduced in previous 
revision of the series.

(though some did reproduced two versions earlier, which means the fails 
aren't that rare - there is no excuse for not fixing a sporadic with 33% 
repro rate; in the series under test we worked hard to fix a 0.3% 
(3/1000) problem, and that was the repro rate after creating a custom 
crafted test case which maximized reproduction)

-Tomasz


On 2/27/2026 4:43 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/vf: Fix exec queue creation during post-migration 
> recovery (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/161287/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/index.html
>
>
>   CI Bug Log - changes from
>   xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f_FULL ->
>   xe-pw-161287v4_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-161287v4_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-161287v4_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-161287v4_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html>
>         +2 other tests fail
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html>
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html>
>         +2 other tests abort
>  *
>
>     igt@kms_plane_alpha_blend@constant-alpha-max:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-max.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_plane_alpha_blend@constant-alpha-max.html>
>         +2 other tests dmesg-warn
>  *
>
>     igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html>
>         +1 other test abort
>
>
>     Known issues
>
> Here are the changes found in xe-pw-161287v4_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-limited-range:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +4
>         other tests skip
>  *
>
>     igt@kms_content_protection@legacy@pipe-a-dp-1:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-1.html>
>         (Intel XE#3304
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_content_protection@uevent-hdcp14:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_content_protection@uevent-hdcp14.html>
>         (Intel XE#6707
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x10:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x10.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html>
>         (Intel XE#5354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312> /
>         Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +1
>         other test skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#7308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-4@pipe-b-dp-2:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_plane_lowres@tiling-4@pipe-b-dp-2.html>
>         (Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545> /
>         Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2029
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029> /
>         Intel XE#7314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7314>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@fbc-psr-primary-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters-userptr.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@discovery-empty:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug_online@pagefault-write-stress:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_eudebug_online@pagefault-write-stress.html>
>         (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665> /
>         Intel XE#6681
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681>)
>  *
>
>     igt@xe_evict@evict-beng-cm-threads-small-multi-vm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html>
>         (Intel XE#6540
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3
>         other tests skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>)
>  *
>
>     igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html>
>         (Intel XE#7482
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +13 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +3
>         other tests skip
>  *
>
>     igt@xe_multigpu_svm@mgpu-atomic-op-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>  *
>
>     igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>) +1
>         other test skip
>  *
>
>     igt@xe_oa@oa-tlb-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#2248
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248> /
>         Intel XE#7325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420>)
>  *
>
>     igt@xe_pm@d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_query@multigpu-query-pxp-status:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) +1
>         other test fail
>  *
>
>     igt@xe_sriov_vram@vf-access-after-resize-up:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_sriov_vram@vf-access-after-resize-up.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376> /
>         Intel XE#7330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-9/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         (Intel XE#2142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_evict@evict-mixed-many-threads-small:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_system_allocator@fault-process-same-page-benchmark:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-5/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-5/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html>
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
>  *
>
>     igt@xe_wedged@basic-wedged:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-1/igt@xe_wedged@basic-wedged.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_wedged@basic-wedged.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466> /
>         Intel XE#6652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652>)
>
>
>     Build changes
>
>   * Linux: xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f ->
>     xe-pw-161287v4
>
> IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f: 
> 340c78371713a8fdd88fbfe77fd0f7165294c31f
> xe-pw-161287v4: 161287v4
>
--------------z0cFmW8xhYdYcIyuDc0WWpzC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Analysis of fails:</p>
    <p>*
      igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:<br>
    </p>
    <p>This display test required a compressed framebuffer, but got
      uncompressed one. It is not possible to lint that to the series
      under test.</p>
    <p>It is bad that we have a test which may fail due to KMDs
      decision. Someone from display team should make sure that test
      design is adjusted to KMDs logic.</p>
    <p><br>
      * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:</p>
    <p>I guess the test checks if vblank wait is interruptible? And it
      is, though it looks like the error path is not clean of errors.
      But this is display issue, unrelated to the series under test.</p>
    <p><br>
      * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
    <p>Another vblank interruption test, a different problem in error
      path. Display team should fix their error paths. Not related to
      series under test.</p>
    <p><br>
      * igt@kms_plane_alpha_blend@constant-alpha-max:</p>
    <p>That's new - not a display problem, but GuC problem. I don't
      think it's a good idea to try dumping GuC log to dmesg though - we
      should have separate mechanisms for capturing GuC log. Dumping
      10MB of encoded binary data into dmesg does not look right, and
      makes the log harder to read. I don't think GuC should ever
      crash,&nbsp;so GuC team should take a look. Unrelated to series under
      test.</p>
    <p><br>
      * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:<br>
    </p>
    <p>Despite the test name, issue did not happened during exec queue
      operations but during unbind. It looks like - not a surprise -
      display code caused a general protection fault. The display code
      seem to be unsafe during unbind. &quot;<span id="dmesg-normal312" class="dmesg dmesg-normal">sleeping function called from invalid
        context&quot; - this should never happen. The display code is clearly
        broken. If an issue with such message became a sporadic, this
        also means the code lacks asserts.</span></p>
    <p><br>
    </p>
    <p>Almost all fails being related to display support, could mean
      that display is way better tested than other blocks of the KMD.
      Unfortunately looking at the fails suggests that the reason is
      simpler - we have some serious problems within our display code.
      The code has invalid flows in error paths, and races in kmd unbind
      path. The sporadics will not go away until fixed.</p>
    <p><br>
    </p>
    <p>I did not found any indication of any of the issues being related
      to the series under test. Also none of these cases reproduced in
      previous revision of the series.</p>
    <p>(though some did reproduced two versions earlier, which means the
      fails aren't that rare - there is no excuse for not fixing a
      sporadic with 33% repro rate; in the series under test we worked
      hard to fix a 0.3% (3/1000) problem, and that was the repro rate
      after creating a custom crafted test case which maximized
      reproduction)</p>
    <p>-Tomasz</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/27/2026 4:43 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177216382264.293785.15820279821045060817@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/vf: Fix exec queue creation during post-migration
              recovery (rev4)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/161287/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/161287/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f_FULL -&gt;
        xe-pw-161287v4_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-161287v4_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-161287v4_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-161287v4_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-dp-2.html" moz-do-not-send="true">FAIL</a> +2 other tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html" moz-do-not-send="true">DMESG-FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html" moz-do-not-send="true">ABORT</a> +2 other tests abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-1/igt@kms_plane_alpha_blend@constant-alpha-max.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_plane_alpha_blend@constant-alpha-max.html" moz-do-not-send="true">DMESG-WARN</a> +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html" moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-161287v4_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-limited-range:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_chamelium_color@ctm-limited-range.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_chamelium_color@degamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send="true">Intel XE#306</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-5/igt@kms_content_protection@legacy@pipe-a-dp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304" moz-do-not-send="true">Intel XE#3304</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send="true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent-hdcp14:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_content_protection@uevent-hdcp14.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707" moz-do-not-send="true">Intel XE#6707</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x10:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send="true">Intel XE#1424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354" moz-do-not-send="true">Intel XE#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send="true">Intel XE#1508</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-mst:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send="true">Intel XE#4354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-send="true">Intel XE#4422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_flip@2x-nonexisting-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp2:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@d-dp2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send="true">Intel XE#2597</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-not-send="true">Intel XE#7178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" moz-do-not-send="true">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308" moz-do-not-send="true">Intel XE#7308</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_joiner@basic-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911" moz-do-not-send="true">Intel XE#6911</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send="true">Intel XE#7283</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-4@pipe-b-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_plane_lowres@tiling-4@pipe-b-dp-2.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545" moz-do-not-send="true">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652" moz-do-not-send="true">Intel XE#6652</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021" moz-do-not-send="true">Intel XE#5021</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029" moz-do-not-send="true">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7314" moz-do-not-send="true">Intel XE#7314</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-primary-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_psr@fbc-psr-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_vrr@flip-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-empty:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_eudebug@discovery-empty.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-write-stress:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_eudebug_online@pagefault-write-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681" moz-do-not-send="true">Intel XE#6681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-cm-threads-small-multi-vm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_evict@evict-beng-cm-threads-small-multi-vm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540" moz-do-not-send="true">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send="true">Intel XE#6321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482" moz-do-not-send="true">Intel XE#7482</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send="true">Intel XE#7136</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send="true">Intel XE#7136</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-send="true">Intel XE#7138</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send="true">Intel XE#6964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_multigpu_svm@mgpu-coherency-fail-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send="true">Intel XE#6964</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-tlb-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-7/igt@xe_oa@oa-tlb-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248" moz-do-not-send="true">Intel XE#2248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325" moz-do-not-send="true">Intel XE#7325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420" moz-do-not-send="true">Intel XE#1420</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send="true">Intel XE#4733</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-pxp-status:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-5/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937" moz-do-not-send="true">Intel XE#5937</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-4/igt@xe_sriov_vram@vf-access-after-resize-up.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376" moz-do-not-send="true">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330" moz-do-not-send="true">Intel XE#7330</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-9/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send="true">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-send="true">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142" moz-do-not-send="true">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-mixed-many-threads-small:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321" moz-do-not-send="true">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@fault-process-same-page-benchmark:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-5/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-5/igt@xe_exec_system_allocator@fault-process-same-page-benchmark.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625" moz-do-not-send="true">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@basic-wedged:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-1/igt@xe_wedged@basic-wedged.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-2/igt@xe_wedged@basic-wedged.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send="true">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send="true">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v4/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-send="true">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652" moz-do-not-send="true">Intel XE#6652</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f
          -&gt; xe-pw-161287v4</li>
      </ul>
      <p>IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-4626-340c78371713a8fdd88fbfe77fd0f7165294c31f:
        340c78371713a8fdd88fbfe77fd0f7165294c31f<br>
        xe-pw-161287v4: 161287v4</p>
    </blockquote>
  </body>
</html>

--------------z0cFmW8xhYdYcIyuDc0WWpzC--
