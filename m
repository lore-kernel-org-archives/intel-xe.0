Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F213CAC5B9
	for <intel-xe@archiver.kernel.org>; Sat, 27 Sep 2025 03:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3655A10E008;
	Sat, 27 Sep 2025 03:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LECEtzQC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E497110E008
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Sep 2025 03:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758944661; x=1790480661;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=C6xsn+zGr97ztRO6Kw7Yhz4P6L3Mme7hT8MNgV2EzK0=;
 b=LECEtzQCaJK4GZ5v6qvwtNMpYlVFr5QY287a3SuBQPbDvqcMI+7gzgXL
 9/NuHBBsPFHO5hINHMvQ+l1kLrKc8sBc3Lo0hrRQO3BhKp9TL3qFMfmzl
 AjvhcCaTyzR1ko5BqOyfIOp520rqeYPjephRNR42fdtnxD1hqRA4S8guM
 eQt0+rjt9c9DxrFUhfJsqzZFz7Z/94Y+KMauWjCJPidXIyxb2jfkwXzVK
 R+A64ZVPwi2d4Dh4att3/gwzfDpwW06VA+j2iLHeSnVcHBktXOSwPeO2v
 htayOfaCKU7UkzJUa03hvuW3nbiJwd/Hs6p25DkYPtHVzv8ZIPRkqyfrK Q==;
X-CSE-ConnectionGUID: ywKnGgteRCeSTk9pVPg1Rw==
X-CSE-MsgGUID: YdBoWBWfSpuFGNsZD2lztA==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60978519"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="60978519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 20:44:20 -0700
X-CSE-ConnectionGUID: EjhAypMyRXio3cjHCMGEiw==
X-CSE-MsgGUID: lJRwGp74SVeui0gRobrEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="182168312"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 20:44:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 20:44:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 20:44:19 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 20:44:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLM3pjVDX8XNW1jOHzxtsK4k7ejoucUcA7JRqCZey1uBBxbux3raIqG6mYtiG9ucr46EXHDlkc8fW462LahYH4tJkz1iRUSq93NWpDPjCK0tto7bztjtgWMKFhwtqsWdvsZ+91B1Fs5FuS7Q9IBRDRHXGKeOEJwFBhmOmGKXilPgEMK1CQbm16Ti1aM7Mx58CqtzIR6T0xojBN6kSpfYbCqYek5NPGCp2ZupAYZeG1274CCmUWpfzROXvRmAJFS49mJrnPB5Ht9wl12BZ9hCV3Zfp5B16CkXEA52iXGENs7My20n2x+H3c+dNAxfZlvKnduu17fwnlcRY67EiiBDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqkUA0UmVahelEYTKZL19qnMV6YQuLkpYkF2n9kO04A=;
 b=tUtr4qpB6sdzuGdBbwlp84e4TBUC4H734gmfWBnS/gJg8hMraUkBRZhSvS+MY73uSZ2gXMdsmU5EH9decmjRp3/uyulSXw2lDGhiEtdA893IR0g+3MmjBzRtTLRa7iA24KuS2MrDvvFc3YRDyMl5TjLwC9lQ4cxXX026pqkGp88q/xXaSKmg+apwZDaz9+pe7GLN8NJcgDfaWH0HMr+Rl3yQ8djoXBRzV3KqGWW2ZcNmRpxYoKkNmKFQoMU4sBoZeUcn80Hkb0h17E4I8p6kpfbJxElmtNr12wjc/PyRiGm3IQ71s6xNfrDB/tlgxWV8n1MCoJNMgaCJtggCYg0rVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Sat, 27 Sep
 2025 03:44:01 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Sat, 27 Sep 2025
 03:44:01 +0000
Message-ID: <75b42874-6628-4f4d-b7d4-4f702abfd46b@intel.com>
Date: Sat, 27 Sep 2025 05:43:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/34] drm/xe/vf: Reset TLB invalidations during VF
 post migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-23-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250924011601.888293-23-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0047.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::16) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DS7PR11MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: e50b217d-fc9f-4653-3fe9-08ddfd7818e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlIwOHRNcUVuVDRpOC9rNldIVFUvWHZValN0K3Zad0ZIYmthYXhJbnJ0ZHI0?=
 =?utf-8?B?a3lxT1N4YmVjaldISG53c0w2eDdqbWtzdUY5ZEUxUm4rOERab0JQRnp0MzBI?=
 =?utf-8?B?UDhnQlJ2UFpzWi9uS215aEttekdlbWZaMXZtcDFoaU5Dck1EZFVBZzduTEpr?=
 =?utf-8?B?WUkrQUVYWVNiMmI1MmZ1UENZc0trZ2pGWTNycUhhSFRZUDBRMklZMDBLazlt?=
 =?utf-8?B?RU8xUWRDVUpnUEhIU0t2NVhpelVyYlJTVVE1bHJGSkpIZXlRb1RVYk12cW1n?=
 =?utf-8?B?aUhxUlh0K0wrUStoVU04MmJHdDlpdnZYNndvNWFYSCt6SEtVZ3laZHdSamlB?=
 =?utf-8?B?RGhSQksrQnpQcHVtdXE3Y0tmbTNrM0pibHBaWFl6bTduWUlyVk9xcnRtSmxh?=
 =?utf-8?B?UXBlOTVqbmFrWHpDYUV6RVZHenJPWWZ1ZXdzVEFUdnV5Q1ZqRDdzMWZ2N21O?=
 =?utf-8?B?VUdma25VSjV6RDdKYzlGd0czWVVCUXYwZVQ0MlBrNEFpcWVhWUZvT1ZmMTBU?=
 =?utf-8?B?MUxHYjRaN0Y4bU5JcXlKb3dkaUhTRmJhbnQ0K1pjOHA0K210SnR3OG1Wdm9k?=
 =?utf-8?B?K0ZwOHZ0REtoQ0dJdHNsTWFyWmJ3aXNFUlVTdXdCMmZ3Z0ZqUDZPUnpxYVVq?=
 =?utf-8?B?ZmduMTlPSUQ5dFh5NXpidmcxQ2tnSEI1MGgrQldUVnhQRnRPa1kyN1hITVRC?=
 =?utf-8?B?TEJ3ZXo1UkpxejZxSndjMjlJUENXS1ZUMHU5YjQwUGQzcWtGL2Q1RXZ2Uk1s?=
 =?utf-8?B?ZVhHYWJPUlBFWXNrZ0F0cjhEbHRXd2xPY1F5UGZOdm9hZTdlbnRaSGJlUFl6?=
 =?utf-8?B?cHJBbk9LQm5lcjllTVltcXc4US9OcVFFRjU5Z3JtQjIvRTJKeEpkR0JGZW5X?=
 =?utf-8?B?dzRzOFFsT1NrNVZmRVNBZzYzdm5uSStpSVpDai94RTJRTHBmRzgxeG1QM2hC?=
 =?utf-8?B?amJ1MC9SQUxmdHptdy9TSGN1RmxGSXF1bDM3dGQ4Z0NsRG0xWmxJczZseksy?=
 =?utf-8?B?NGY3Sm9mUGpDMXJ1VWZJTVpCSUNiVnB5VWswelBFYXdlVVFkRzJjMnFVS2NO?=
 =?utf-8?B?OFVkbTM0clQxeXM2Tkp2RmxkUDdzNkltMlF5QnpDdlRWdFpMSEREWS94SFBs?=
 =?utf-8?B?UTdyaUdkV0xnR3VaNm8wQ3hUd2pkTWg5SHN4SFVYdXZVbmNHVklhNER4cjRX?=
 =?utf-8?B?OHRpSEJZMG9QaDIwcnZpYjMxZjhxTmUrTmVSS0JrenhHbzB4Q1dpUTdQNWpt?=
 =?utf-8?B?SXZLRGdwcFl2cENSNnBlTUFjRko2QUpTZ1FaTitGUGdxcjNoS0p2RzVmNVY1?=
 =?utf-8?B?REFxcXlFS1ZoeEgvZ0VOYzBUYlA3RW1FcnZSNFdERUhWNitmMWZlcWtYWk5U?=
 =?utf-8?B?MCtQZkh3SVZ5UFJwMURuR0VmSzc4RmhFN3A1a3J2bEgrdjRrVUI0OUR0SDBF?=
 =?utf-8?B?ZWtWR28xOUxMSTV4dVpZNnhYRGR6bFJRdm9DdmdjTVM3NDFPbFAydzAwek5r?=
 =?utf-8?B?NnA2cFRJODN2amxhV2hPTlk3KzVHeEFYaDZIekV0MWs3aWxsZ2EzOTE0ajRG?=
 =?utf-8?B?cVNvWGJmUlNZM1R1L2JsSnhGUmRSNEtGQjlrUWdBTGpWbkVVYnJRQWpHdVln?=
 =?utf-8?B?bjN2TlIvbTROUUxDTEtTaW8wTGxJbTVMcmE1V2ZYTGYzV0FycXNYVk5RbUs0?=
 =?utf-8?B?SXljUHNNZ1pWb0lGSlFNWFYrYmhsenQ0MWwvZzU5OUlQU1hpUXk5OS9UTmht?=
 =?utf-8?B?V2NjQWttRXN4dVJ2MVllNHZaUWgzQTJXV1NzYlZiUlZ0SElmMDZ6Q3RCSTBi?=
 =?utf-8?B?Y1JnQU1TNVFOMWxGQ2p4NW42QVVZV1JGSWcrSnBXa1ROVHhBQkhQR0ZKOWJI?=
 =?utf-8?B?dWNxM2NySEJHUyt2SUpDa1VWdFVyaWZqbkxzeExDRlFZS3NkUU9IYklXeGhk?=
 =?utf-8?Q?0x62MwzihkjDhBZ+3b7nn2JRlU68uZAB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzlQdUVPNGR3N3lWUGMxTTFVWVpIQ0ZxQXJuR0pHVTcvT1BnT0ZBbFNPeDJa?=
 =?utf-8?B?Tm5YSzRpV3JEdnByN0Z5ZFVwUmdxYnZTL3lFUjBVT0tiT0lvOEJ1TUpobFBl?=
 =?utf-8?B?V0V6MGF1OEVNNnVPVlhWSDZVMnhWejhNem5aS1A5dnlUcklRRmxXWHBBSUFN?=
 =?utf-8?B?ek80WkxMV21HeE82WCt4Z3YwYnFJdXBLUDBROTI2THYxZm1pRHpWa3ZnL1h3?=
 =?utf-8?B?M3lVRDhxeVY1enpWK3dGQS9QU2g1c201RTcrRTl2MmV4MjZ6aVJaSjJoU0Jj?=
 =?utf-8?B?d1A0dEd6SDg1M0VDRDhudzBvWDNmMEhTenk5RkZIN010aXRIR3FQZVBMVFNr?=
 =?utf-8?B?Qm1HUWNEVTYxS1BjNis4bWg3amxQNGZ3SDdJT1hob2JXc0l4bTB6YTF1bEtX?=
 =?utf-8?B?dEp3RDF4Y1ArbklDNnU1Tm1OVlh3ZmkwVHZiUHpmYXM0OGlhL2NBaGh4M0Nl?=
 =?utf-8?B?WTNQTXN3YTNPSDVvck9nZFBkMVFQN3NzNXlnOGRyT0FGVFgraXZkOE1KbkRM?=
 =?utf-8?B?TEpYYVJOUmJDTGdValNuUWpMUlVHVmhBTG1GOXNpbWZ3bnppY1pnVVJzbFNQ?=
 =?utf-8?B?b3hPajhaYUd4dUE0YmcvdXlKaHhpZkZwVUpneTZJQVBVQ1pucncySDdjS1lq?=
 =?utf-8?B?eCtwTmpuRmphT0puMzFvVHQzQkRGbzJSOFpmN0s1MlVPOEVIK1QzdmxuTEpG?=
 =?utf-8?B?QWFkWGVwRllvZGM0L3U1TWJYYjIvemJsS3dlcFU1NHZDTmF6YSttRjRRYWpq?=
 =?utf-8?B?NVduL1NjWU10TzFLL3dqM20zbmRPOUYxMXh1aFJpR0lCMGdnQ21Md0I4RGVX?=
 =?utf-8?B?d3NBMEQzbFdVT2Zndk1wUEFzYlZXZXV6blM0dWxYa3E2UUtrRWZLUzJQS2U5?=
 =?utf-8?B?Z0VyeEl3dFVBWDhvbHNRZ1NrL00zWmRMUFQvdDEwUEtwZjRZMDRKc3VocUJ5?=
 =?utf-8?B?Mzk3R1VGaERVQWJBZzJlMFE2ZVBpb3BnSVVBUUpYUURjaHJaNWxGSVJTM1pR?=
 =?utf-8?B?eWRXK2x6TFJsYkN6QkxLR3N5UE81bEhOSHVNL1p5a2tPZUFpZE5oTzU4Tmcr?=
 =?utf-8?B?M055RWhpNzNwMG84dThLbUUvNjMxU3dvVlJaYW5GZTBLZXRucTlPc29iT0cx?=
 =?utf-8?B?SXJ3WjFCNG5GYS9GS1JnZjlxSVBDSENxZmJacVl6SFRWMWd0VXkyek8wOW5k?=
 =?utf-8?B?SlZ6NnVmWGl4VG5uMXJSc3h2WXUxMFJUdkJyZGJOTXVuR0l6T3BzMDUzWG8w?=
 =?utf-8?B?cjB4YmJYcnFtRVdXMXVNcnpYVkxwaXluN2ZkdmtTWnhNYjJFRGdpZ1dFSnc4?=
 =?utf-8?B?MHhRSGFqS0dERGpObVlqbEhqTVFRb2tTOS9XTlo3VVVTaUphejFyRkhxdnVN?=
 =?utf-8?B?KzVUMW1qMk5aWUZUa0N2S1lxZEFNSE9IYmw3YUhNZVBMckM4SGRWWVRkZHo1?=
 =?utf-8?B?dTBmQU5EQXFiN1pyczRTSDRtb09zZXBiVk1Yd0pLRUJCdTVBSytyN2dGazdG?=
 =?utf-8?B?YncvRUR1ZzJFem5UWFVFN1ZNN2pWN2plSkRSMlJFZlhTN25TdU1oZ0NjNHFI?=
 =?utf-8?B?NWJMdkpmUyt5ZzJhaC83T3Q4VldnSk8wdVNrWGF2KzdwcFUyc2lNQ2hlUHdo?=
 =?utf-8?B?Sy9aZnZ6d0czQVFsL3h2dmhFZzFzYTJGa3M5OFF4cFcxay8wVFo4d3J0bDZO?=
 =?utf-8?B?U1dPQjBkbEdHSUJyZzVSWTljQTVsNDNsY1RxTFc1MXNvZ296VzUybHNUem11?=
 =?utf-8?B?K1BEZFVlMkt5U2JhSEJOdUZoRHFiTlc0Z1FHaDlsaGZJZG9VaU9FWlVSdk9s?=
 =?utf-8?B?dFpQSTdWQWJNRS9GbzUzSFVINDVWUlVoWlFaQ0hNeWNxV2lPT0p6LzRtMXNP?=
 =?utf-8?B?RHJpekxaV2M0RjJRTXo5RG5uSWNEN3pOV2lJWUFMNHpOSWI5cXAwRmNWeEg5?=
 =?utf-8?B?ekpzRzE3YXVFbG9tYWs2WHo1dXVyTDk4Si9IZ001MkxMUVEyUUR0UE5oK09W?=
 =?utf-8?B?Y00vbWNrc0lCTDRWNHVNT3UvcVRuZ3RsTkJKVmNvQUtSbVNoMUM3MlJhT0VM?=
 =?utf-8?B?TFhPUWl2cDA1OS9admZpOXYyWGVHTk1pQTFtTnExVjNvT1Zud2hYUzJMMlJG?=
 =?utf-8?Q?TwwH+KLcZl9gsqsrUziOz0jCy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e50b217d-fc9f-4653-3fe9-08ddfd7818e3
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2025 03:44:01.4093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FzJns5vT1y1oO3kqQfzsgLmZfcrbYQA9uf9vL+sqBzk6rOGCcWFeeP6BxTjflLVHzpM4HvqBJpWUzhvagoQPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7859
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


On 9/24/2025 3:15 AM, Matthew Brost wrote:
> TLB invalidations can be lost during VF post-migration recovery. Since
> the VF has migrated, these invalidations are no longer needed.
>
> Reset the TLB invalidation frontend, which will signal all pending
> fences.

Can something other than timeout wait on these fences? Because if they 
trigger

additional processes, then it would make sense to wait with this.

If this can trigger submissions, then doing this after submit_pause 
would make sense.

If can trigger even more, then moving this to `kickstart` (to after 
recovery) may be a good idea.

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 071c2c5e0d0a..01399a871f12 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -35,6 +35,7 @@
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf.h"
>   #include "xe_tile_sriov_vf.h"
> +#include "xe_tlb_inval.h"
>   #include "xe_uc_fw.h"
>   #include "xe_wopcm.h"
>   
> @@ -1187,6 +1188,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>   
>   	xe_guc_ct_flush(&gt->uc.guc.ct);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
>   	xe_guc_submit_pause(&gt->uc.guc);
>   }
>   
