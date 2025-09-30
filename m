Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76050CAC5BE
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 15:27:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406D810E5F9;
	Tue, 30 Sep 2025 15:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWTc4ck6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A8F10E5F9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759246046; x=1790782046;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Sx5cWwOCNO7GYWbHmDXVJWIAL6H+93v+Yob/l4VyigI=;
 b=GWTc4ck65zF9F5GiR2AWdrxM4GbDMINYnVSK+Mmm0L8QC6NoYr1JOnOS
 UEkfyg+PkU6hW8R46wk82hA1FzIA9R8IytJRZJdQ79s4OUPqfNvh8urbX
 RzNYURoKldLgFq2Dp9xS92ATqZzgcxqrEWY2Ce4bh+Hl5vuJBMP04nEn9
 fujcAN3bRoJym3/vOk0RG+Fl5bFfhuqrgFuAgGCh5IZIHBc3Ad3zq8ss+
 PVInJ4+AbBou+MR3YKKif8Ayy/IxpvTCQz9iC0hsYIFqFcS/d7yEKnTPw
 fY168KhXaB6EO6/eT6+qdj91TLjMAsmnN8cKeRx2YBHLIkKZ41zwK7guu A==;
X-CSE-ConnectionGUID: LLRub1CXSJSgZZil0omxBQ==
X-CSE-MsgGUID: nw8HKCuwSXilAJoYc3V3fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84123880"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="84123880"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 08:27:26 -0700
X-CSE-ConnectionGUID: KapqwQXLS0Sz5rf0Amvjhw==
X-CSE-MsgGUID: 7Hn/whwCSwekpOI0LznD9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="182962975"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 08:27:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 08:27:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 08:27:24 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 08:27:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e69Nos2XfW1Lt+E9qI9HmGf9RjyP2TwQ56zHEytl0e3Sm40dulCE4fgZn3IrCxV+098V+FC/FwQVDGAqT0UOoEUVdDer+P+BNhFLxJ3VDOWfdysYyox7Qegzbdk2+4jcv62JfvTTj5/mkoIwkY+O3z95tJ6kQzVohdAxz8ord0lA9aIi/PK5MKpfFRhV3mzj5CCT6bfsOM5vqLtD3leg11A2xOAlKtdzIcAZr1XO1eNWL6MwPMdeBH8AzY4NfpnfFwHT0pPhLmf256+4B1Nb2oZm0Zt+AOcMFMnq3KYgETlfrK/GgXhy4N5zY3RFk54awWh2qFsVa11no67CS26VlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=estN1qoE8ErKlM0fp3zeh3vAcNvz6hp2Vh+F2oKBVw0=;
 b=qeaiWjKvfEtaPrynRq0+wx2cH7VbsqU79RLaBUxzAEJ/jEGS6bsUqwpXj3zPkLZuH9d5zl4m9HwITK1V+VBQC9GBzV/aJa86uvUaj/zECzdkEs7DPMi66A7fPD7bmz7lv7zMKw0AkIwnXpODvLwKGJPDcE9gcI3gv5kLJbvUJ8xFbTjmpzOOB2YGJBzpOwhYcuByZEunGtBNIDGAMRf7z0oDA6vGXE77/IYXkx6/4idv8V5FGAkBpkJ5n0CP7hN67c3hV3dbok0Wz7JwSQDxynUFKiDx6LBsk8fRxcIiT2zZQJhWslKjUHZNhXm7vL4AL9AXkrVzilV5G5JH8vb1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV3PR11MB8529.namprd11.prod.outlook.com (2603:10b6:408:1b3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 15:27:21 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 15:27:21 +0000
Message-ID: <f582fff5-84bb-4fd8-b246-79545450cc62@intel.com>
Date: Tue, 30 Sep 2025 17:27:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/36] Revert "drm/xe/vf: Fixup CTB send buffer
 messages after migration"
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-6-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-6-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV3PR11MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 845f2613-7e07-437b-1ba8-08de0035d94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3d0Y0tXZDBXYVZTT3JMVmVSZWtjem4yeG9wd3N3WGwySkt5Vms0b2FFeUxn?=
 =?utf-8?B?YjZxbCtDNEpFcGdUcUFqYlFQMlhIVkI3WlBTbWpnSTd0d3NxR3FQanl1UU5M?=
 =?utf-8?B?aDlZVmZxTmg5VVMzWWw4a0FKcXd5YTNjbzAySGFqL1E4Y2k4MG81a3dTQVZt?=
 =?utf-8?B?NS9kQW1GTzRhSGNnMnMrd0RuTi9TRDN3Vlg1bG5oOW9lL0xzazJ6OFJ2c0hD?=
 =?utf-8?B?M3VRYlprNGZUVy9CWklINUNSeWNOdm1qMFIwVHRiNXBBVzNQTWJzNjdLc3lp?=
 =?utf-8?B?dHVDZGJsOUZsTWFPZjRlNyt1L09ZalgzeTRJVjVRaUxIazBkcWFjQ3VTQUIv?=
 =?utf-8?B?b2JIc21IM3hON1U5RFlzN3V1eVA5MHhCcElrczdDWFgzUERFcmhLRHBRT2Ix?=
 =?utf-8?B?YzV4eGI2WUorL3pHZXBqZ01yNHRkdktpOHZvVDdnQkxOWko0MldCdWcrRHM5?=
 =?utf-8?B?UmNhUnJQeGJlSGRRaVgwNlF5bDU2N0NZRUpNbTAxbDFDWi9MWEFNZEppL1kr?=
 =?utf-8?B?c05jbDlOcTJxVUhCKzRXNFYrdWxhV0pqaGttdmUzelNpRzdibWQ1eG1HamRH?=
 =?utf-8?B?bE1BWDNtL1lvRUZMOE1HSTk4YytoQlBhZzdteFlRZ0ZHZTRpN3k2VFp3MCty?=
 =?utf-8?B?OTVtaUZCcTk2NlNKYzM1QUE0SXVtRjRySDh0QkY2cFJCM2I0a3cwbzlCcTJF?=
 =?utf-8?B?SE45NzFPckh0ZE00TGVtYlZFbU5tY01pWlZ1bmZjV3k5UHdRcnBvT2JyYU1l?=
 =?utf-8?B?MnpXYkU2eWRFazZ3Y1BCYktHZmxOSE8rNy9oeWVUTjhTL2tvbjJLdGpZYi93?=
 =?utf-8?B?NHA0VGI2cWxLVngxY0RqOCs0aVJQLyt4VFMvVXpCVVlxS3FZeVBiQlRjMlhX?=
 =?utf-8?B?ZG8vbEFZTHBEN0RiUktBSW11RmNRSHdZS1o2STdWL2d3MW1uRUlYVndaMjc0?=
 =?utf-8?B?RlJhbkxzNnB6R2pyZjJVM2dna1htQUxoeTkyRWIrQWtkalZDSzQrcCtBS0Fw?=
 =?utf-8?B?MldiMHB2Ry8wNE5XQlBaQlF6UUc0RWtSUVB0Nk9qSmhLTHQ3MTlhL3hqd1hz?=
 =?utf-8?B?cUFKVEhpVm5OOGRMWjRmeCtDN3pZWWs1cnlpc0tLeGVmR2NndVlnVm1LaUZ2?=
 =?utf-8?B?Z0syNitXQ1N6bHVTeG5HQVM1SlB4TVF3c2tRNDViZnpjRXpqZVhKZ0tZVFlm?=
 =?utf-8?B?QkNJaTY5QWFrOHZ4NTZtR29HMU4wTTNZUC9RZzRiTHVHbWNnNFFqT2YyV0Yv?=
 =?utf-8?B?YUxXVTY0VmZLNWpCLzFDbTNQVGJtTGNKcHoxUTRJdXZNOVB5ZVl5Y0xyQldP?=
 =?utf-8?B?cGpteWViTTBydlJwMldFalR6L3E1TGlHZFVZTmlUUzM2Q2xod2RqTUNobXlP?=
 =?utf-8?B?N2tjZ3hRSDNuUy9hK243M2xJK2M4dE53Z1BLTVlqekJZb203bTZuWXlRMVR3?=
 =?utf-8?B?bmc0QzY2R3NHWGFYOUZjT2hFS1BUZFVFMFhsN2lnTnNGNVZRNVlOM0g3aGNW?=
 =?utf-8?B?WDB1T2ozRDdRMmJFRjlPSVdrQWNyT1VHTWFCelB6YzVvQ09mbTBpZExFeS9Q?=
 =?utf-8?B?WC9qRnJUbkt3R1BocTY1ZVF1NjBIUHJUNUNNRjZaSHdXZVpWeEo5Q0ZjaGh5?=
 =?utf-8?B?QXZZVjArT0ZJL2ZDMjhyVDkrV3dmN3BDcDVUM2w4Tmp1K1lHakNoUUNkaWFM?=
 =?utf-8?B?Qzk1dGpxNlhtV3N3dkpRTlVFZXBZUytuUTdKbzNtT3NMcmFtL015UzlNbzRC?=
 =?utf-8?B?bkhiU3JNTThZL3JMWitKL01KRFgxbTJqc2JsRGVlcFpJUlVHRVNUbWxyRHVy?=
 =?utf-8?B?RzZobGtPRGN0blJFMWNFSVlMc2JvajErTDlQT21SK01lOHRmWHFwdHU2MmVP?=
 =?utf-8?B?UGNTaWorSTNuSk5RRkZqTzdBdXdkZzFQbklnUHEzbTRJVjFDNmwzRUd4NWZE?=
 =?utf-8?Q?mpLFK3dgukKL3fOwqwBBGdpNl9WsnSX+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlVhUlBWQkw0ajU5MEsyZk4yWVFiSCtlL3lnMm1DYnlOVWRSblc5bjZDWUhZ?=
 =?utf-8?B?TXBMRm5IdzRac3dCZ2pqQ3cxa2FVYk12SWJ3TlpiMnE3aXg0K3dXbzJaVDRX?=
 =?utf-8?B?V3d6VjJKMWhheXo0cTFjY0xacFl5Um56VDlCQmtyU2czNFVlbncvY1N3MndK?=
 =?utf-8?B?NWxOaDM0RWE1aFRFWEFnQjJ2SHJJdk53bzJmQkpEeUJ5QjZjZzhkUlJCdEpF?=
 =?utf-8?B?TlR2UFVEZjQ2dnhPSENlV3hSWWhjZ0RaR0RjYWNzOVhVVFRndTZuMzNWamZK?=
 =?utf-8?B?Y01mL0tPbTFFVGdLZDhSNm5PeE5vdWFuZWNDYXZndHZBRnNuTHZsaVdneDhx?=
 =?utf-8?B?eHJZakdhWS91eHhyeXhEaTdQVXQvaFRwWXVHcFJJNDlvYjQzTWZ6RWRidzZu?=
 =?utf-8?B?NVg1TUc2RmxTV2lwQjRwb2JsRXBpK0dRY0xQTzV0cXNVbkN5ZjBLaCs0a0Z0?=
 =?utf-8?B?QmZVck00Tk5ZZUxUMjJSU2o5ZE9wOG44MWNxTUw1R0x2dDZGSVlpWld5YTZR?=
 =?utf-8?B?WkZHUHpSN0YwRUV5dXVCNmZNVGN0QjRmWlRDSm5aMy9zQm52TnJjQW4wQ0tJ?=
 =?utf-8?B?dm90bzRnSWc0U3VHemlLSlhCZzVhaUg4bktXTzNIMHBkcTVYcVVuOVZQSTZl?=
 =?utf-8?B?Zkl3N2JtRFZJdnYrd3pVYkE3SzdKaG84R2dKWEZGUXNDb2tYaEp4Z2FuOFhv?=
 =?utf-8?B?Z08rcnhpVjlKc2VSWnRDWU85aTJyaU8vUXlDNnIwSE9veEgyb0c2eXkwelZ0?=
 =?utf-8?B?UkpPeHN3cnBVNXZiRHUrbXFKMjYrczJuYVBRbHo3SjhtajI0REpMT1VhbFYv?=
 =?utf-8?B?Z1J2ajlxR2FLeVV0bllRMDBNaVI4WnlBZUxJaHoydVd1YjE2NllpZmpKZ09o?=
 =?utf-8?B?OEV3UU5uVXZwNTc3WGhDaVRVdVkwOThNdS9wQ203RHhSMWFxZEJaZmd6Vk93?=
 =?utf-8?B?RmJ4VzRveDltdnFtaUpjaE5KemFJN2lqdUhWdVN4SkdYMUJETXF3b0VwaEwr?=
 =?utf-8?B?bTZlZWxrMCtFNnJuS1Urakd5LzhRdTAzNE9EKzdLQ2NWN0V2YkRLczlqdXFW?=
 =?utf-8?B?U0lTZWNWZHk4VVBaMFJHTFhnemdWWnFNL2ppTU5VelJYZlMyM0xlelVPc2Fy?=
 =?utf-8?B?OTc4VjVxQktyNHQwUXhWSFVUZW02bFJ5bzAvelZXMFl3T3lHQ29XTk9qQ3Jj?=
 =?utf-8?B?OWFBTmgwQ2RXYkxPZWlxQmFpQ3RmcmVZN0t4OGVvNWE5ZEsxVVJIam50OTNV?=
 =?utf-8?B?cW5qV1h2NmlLMFR4Y3F2bTRFamdCeTVWMktyRGJPaHBDWVlCWGpwWlZnVTgx?=
 =?utf-8?B?QS8rSkNoRlg4a0h2VjA5SkxRcHlwNTMrVkFvWXpTdXN4dloyK3gvUFJpMmhW?=
 =?utf-8?B?SmZNRUd1WHd1Si9mNjZRN1dhRWtEN0dkb1NURmpCVVJ6eFoxVUVtb0tIR3Ay?=
 =?utf-8?B?VWN4V244dEljczFrbWhwYlZVVVNXbGFJQURaTXNBSWhMNkUwZ1Nhd0lVWld6?=
 =?utf-8?B?UXVreXVjVDczOG1LTzVrbFBGZnp2cDZDQnFwWUNsdnAxOWtQTVF3ZDdKcG1I?=
 =?utf-8?B?ZWtkVHZHREs3U2d3UlVjMXVoanhXOVUrL2lIT3N3VWw0WjZHQk14Z0VheXlI?=
 =?utf-8?B?N1dCMTB1VkhhWmNJclMyVWRTM0VRNkswT2pjZ0UwOXBLeGF6RFNmVlNzKzRn?=
 =?utf-8?B?bnI2Y05DZWRCNmpkZ3BUenhpc1FtendNRGZyOVN5cG9wZE4xUHh4bnpwbmlk?=
 =?utf-8?B?VzhpYTlQaUtPZlhOeXdoWS85RXNMMmtSYXM2WlArWFp6SHgxcEdYYVN5WEhi?=
 =?utf-8?B?MDVnMEpRRFBDNWxZaVVrWkJ3Z0RiZWR5Y0wzTm1wR3NIanJrOFJTRkpwRzRq?=
 =?utf-8?B?bzM0b251ZkJuY21IN1QyVEVyYXo5L0JHWG1QTmNqWUM3K2IzUHNhRVdPd2NN?=
 =?utf-8?B?SVR6TXZSUlA0eDRpc2dtTVZKTXp4dGNVUWdZSlo3OTBRRFBHWjNvVHNnWkFa?=
 =?utf-8?B?WXdVRnZ3K1B5ekJKdC9BSmRObnFWYlhKZzFxZGNsVzlaUGxhV2E2NzdpcHNz?=
 =?utf-8?B?eFNqbFBUcm5jOHZDWENlSHFsdHJtQTNJekJXajNMVStPc3cvUWpsbzBPMkNu?=
 =?utf-8?B?blZCUDdPZjV4Nm80TWFRQ3lhdHNBRlYrRlRPam82V1JLOW1vV3JRaDQrUHlv?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 845f2613-7e07-437b-1ba8-08de0035d94c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:27:21.5300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNXO5Ny2tNXyj74PjtNf17VK1S7iPOi+W1kjV+pfO6xztzIeGTROLiw6nelqD3TiNoi+cIuXohUJ9fcYN4Za+eJ7Y8GRNK2rW6pborRnv7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8529
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



On 9/29/2025 4:55 AM, Matthew Brost wrote:
> This reverts commit cef88d1265cac7d415606af73ba58926fd3cd8b7.
> 
> Due to change in the VF migration recovery design this code
> is not needed any more.
> 
> v3:
>  - Add commit message (Michal / Lucas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c   | 183 -------------------------------
>  drivers/gpu/drm/xe/xe_guc_ct.h   |   2 -
>  drivers/gpu/drm/xe/xe_map.h      |  18 ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c |   2 -
>  4 files changed, 205 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 18f6327bf552..47079ab9922c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -25,7 +25,6 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_monitor.h"
> -#include "xe_gt_sriov_printk.h"
>  #include "xe_guc.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_relay.h"
> @@ -93,8 +92,6 @@ struct g2h_fence {
>  	bool done;
>  };
>  
> -#define make_u64(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
> -
>  static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>  {
>  	memset(g2h_fence, 0, sizeof(*g2h_fence));
> @@ -1793,186 +1790,6 @@ static void g2h_worker_func(struct work_struct *w)
>  	receive_g2h(ct);
>  }
>  
> -static void xe_fixup_u64_in_cmds(struct xe_device *xe, struct iosys_map *cmds,
> -				 u32 size, u32 idx, s64 shift)
> -{
> -	u32 hi, lo;
> -	u64 offset;
> -
> -	lo = xe_map_rd_ring_u32(xe, cmds, idx, size);
> -	hi = xe_map_rd_ring_u32(xe, cmds, idx + 1, size);
> -	offset = make_u64(hi, lo);
> -	offset += shift;
> -	lo = lower_32_bits(offset);
> -	hi = upper_32_bits(offset);
> -	xe_map_wr_ring_u32(xe, cmds, idx, size, lo);
> -	xe_map_wr_ring_u32(xe, cmds, idx + 1, size, hi);
> -}
> -
> -/*
> - * Shift any GGTT addresses within a single message left within CTB from
> - * before post-migration recovery.
> - * @ct: pointer to CT struct of the target GuC
> - * @cmds: iomap buffer containing CT messages
> - * @head: start of the target message within the buffer
> - * @len: length of the target message
> - * @size: size of the commands buffer
> - * @shift: the address shift to be added to each GGTT reference
> - * Return: true if the message was fixed or needed no fixups, false on failure
> - */
> -static bool ct_fixup_ggtt_in_message(struct xe_guc_ct *ct,
> -				     struct iosys_map *cmds, u32 head,
> -				     u32 len, u32 size, s64 shift)
> -{
> -	struct xe_gt *gt = ct_to_gt(ct);
> -	struct xe_device *xe = ct_to_xe(ct);
> -	u32 msg[GUC_HXG_MSG_MIN_LEN];
> -	u32 action, i, n;
> -
> -	xe_gt_assert(gt, len >= GUC_HXG_MSG_MIN_LEN);
> -
> -	msg[0] = xe_map_rd_ring_u32(xe, cmds, head, size);
> -	action = FIELD_GET(GUC_HXG_REQUEST_MSG_0_ACTION, msg[0]);
> -
> -	xe_gt_sriov_dbg_verbose(gt, "fixing H2G %#x\n", action);
> -
> -	switch (action) {
> -	case XE_GUC_ACTION_REGISTER_CONTEXT:
> -		if (len != XE_GUC_REGISTER_CONTEXT_MSG_LEN)
> -			goto err_len;
> -		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> -				     XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
> -				     shift);
> -		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> -				     XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
> -				     shift);
> -		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> -				     XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR, shift);
> -		break;
> -	case XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC:
> -		if (len < XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN)
> -			goto err_len;
> -		n = xe_map_rd_ring_u32(xe, cmds, head +
> -				       XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS, size);
> -		if (len != XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN + 2 * n)
> -			goto err_len;
> -		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> -				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
> -				     shift);
> -		xe_fixup_u64_in_cmds(xe, cmds, size, head +
> -				     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
> -				     shift);
> -		for (i = 0; i < n; i++)
> -			xe_fixup_u64_in_cmds(xe, cmds, size, head +
> -					     XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR
> -					     + 2 * i, shift);
> -		break;
> -	default:
> -		break;
> -	}
> -	return true;
> -
> -err_len:
> -	xe_gt_err(gt, "Skipped G2G %#x message fixups, unexpected length (%u)\n", action, len);
> -	return false;
> -}
> -
> -/*
> - * Apply fixups to the next outgoing CT message within given CTB
> - * @ct: the &xe_guc_ct struct instance representing the target GuC
> - * @h2g: the &guc_ctb struct instance of the target buffer
> - * @shift: shift to be added to all GGTT addresses within the CTB
> - * @mhead: pointer to an integer storing message start position; the
> - *   position is changed to next message before this function return
> - * @avail: size of the area available for parsing, that is length
> - *   of all remaining messages stored within the CTB
> - * Return: size of the area available for parsing after one message
> - *   has been parsed, that is length remaining from the updated mhead
> - */
> -static int ct_fixup_ggtt_in_buffer(struct xe_guc_ct *ct, struct guc_ctb *h2g,
> -				   s64 shift, u32 *mhead, s32 avail)
> -{
> -	struct xe_gt *gt = ct_to_gt(ct);
> -	struct xe_device *xe = ct_to_xe(ct);
> -	u32 msg[GUC_HXG_MSG_MIN_LEN];
> -	u32 size = h2g->info.size;
> -	u32 head = *mhead;
> -	u32 len;
> -
> -	xe_gt_assert(gt, avail >= (s32)GUC_CTB_MSG_MIN_LEN);
> -
> -	/* Read header */
> -	msg[0] = xe_map_rd_ring_u32(xe, &h2g->cmds, head, size);
> -	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
> -
> -	if (unlikely(len > (u32)avail)) {
> -		xe_gt_err(gt, "H2G channel broken on read, avail=%d, len=%d, fixups skipped\n",
> -			  avail, len);
> -		return 0;
> -	}
> -
> -	head = (head + GUC_CTB_MSG_MIN_LEN) % size;
> -	if (!ct_fixup_ggtt_in_message(ct, &h2g->cmds, head, msg_len_to_hxg_len(len), size, shift))
> -		return 0;
> -	*mhead = (head + msg_len_to_hxg_len(len)) % size;
> -
> -	return avail - len;
> -}
> -
> -/**
> - * xe_guc_ct_fixup_messages_with_ggtt - Fixup any pending H2G CTB messages
> - * @ct: pointer to CT struct of the target GuC
> - * @ggtt_shift: shift to be added to all GGTT addresses within the CTB
> - *
> - * Messages in GuC to Host CTB are owned by GuC and any fixups in them
> - * are made by GuC. But content of the Host to GuC CTB is owned by the
> - * KMD, so fixups to GGTT references in any pending messages need to be
> - * applied here.
> - * This function updates GGTT offsets in payloads of pending H2G CTB
> - * messages (messages which were not consumed by GuC before the VF got
> - * paused).
> - */
> -void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift)
> -{
> -	struct guc_ctb *h2g = &ct->ctbs.h2g;
> -	struct xe_guc *guc = ct_to_guc(ct);
> -	struct xe_gt *gt = guc_to_gt(guc);
> -	u32 head, tail, size;
> -	s32 avail;
> -
> -	if (unlikely(h2g->info.broken))
> -		return;
> -
> -	h2g->info.head = desc_read(ct_to_xe(ct), h2g, head);
> -	head = h2g->info.head;
> -	tail = READ_ONCE(h2g->info.tail);
> -	size = h2g->info.size;
> -
> -	if (unlikely(head > size))
> -		goto corrupted;
> -
> -	if (unlikely(tail >= size))
> -		goto corrupted;
> -
> -	avail = tail - head;
> -
> -	/* beware of buffer wrap case */
> -	if (unlikely(avail < 0))
> -		avail += size;
> -	xe_gt_dbg(gt, "available %d (%u:%u:%u)\n", avail, head, tail, size);
> -	xe_gt_assert(gt, avail >= 0);
> -
> -	while (avail > 0)
> -		avail = ct_fixup_ggtt_in_buffer(ct, h2g, ggtt_shift, &head, avail);
> -
> -	return;
> -
> -corrupted:
> -	xe_gt_err(gt, "Corrupted H2G descriptor head=%u tail=%u size=%u, fixups not applied\n",
> -		  head, tail, size);
> -	h2g->info.broken = true;
> -}
> -
>  static struct xe_guc_ct_snapshot *guc_ct_snapshot_alloc(struct xe_guc_ct *ct, bool atomic,
>  							bool want_ctb)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index cf41210ab30a..d6c81325a76c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -24,8 +24,6 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_pr
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
> -void xe_guc_ct_fixup_messages_with_ggtt(struct xe_guc_ct *ct, s64 ggtt_shift);
> -
>  static inline bool xe_guc_ct_initialized(struct xe_guc_ct *ct)
>  {
>  	return ct->state != XE_GUC_CT_STATE_NOT_INITIALIZED;
> diff --git a/drivers/gpu/drm/xe/xe_map.h b/drivers/gpu/drm/xe/xe_map.h
> index 8d67f6ba2d95..f62e0c8b67ab 100644
> --- a/drivers/gpu/drm/xe/xe_map.h
> +++ b/drivers/gpu/drm/xe/xe_map.h
> @@ -78,24 +78,6 @@ static inline void xe_map_write32(struct xe_device *xe, struct iosys_map *map,
>  	iosys_map_wr(map__, offset__, type__, val__);			\
>  })
>  
> -#define xe_map_rd_array(xe__, map__, index__, type__) \
> -	xe_map_rd(xe__, map__, (index__) * sizeof(type__), type__)
> -
> -#define xe_map_wr_array(xe__, map__, index__, type__, val__) \
> -	xe_map_wr(xe__, map__, (index__) * sizeof(type__), type__, val__)
> -
> -#define xe_map_rd_array_u32(xe__, map__, index__) \
> -	xe_map_rd_array(xe__, map__, index__, u32)
> -
> -#define xe_map_wr_array_u32(xe__, map__, index__, val__) \
> -	xe_map_wr_array(xe__, map__, index__, u32, val__)
> -
> -#define xe_map_rd_ring_u32(xe__, map__, index__, size__) \
> -	xe_map_rd_array_u32(xe__, map__, (index__) % (size__))
> -
> -#define xe_map_wr_ring_u32(xe__, map__, index__, size__, val__) \
> -	xe_map_wr_array_u32(xe__, map__, (index__) % (size__), val__)
> -
>  #define xe_map_rd_field(xe__, map__, struct_offset__, struct_type__, field__) ({	\
>  	struct xe_device *__xe = xe__;					\
>  	xe_device_assert_mem_access(__xe);				\
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 0581b881b628..da064a1e7419 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -12,7 +12,6 @@
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> -#include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_irq.h"
>  #include "xe_lrc.h"
> @@ -340,7 +339,6 @@ static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>  		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>  		if (err)
>  			goto out;
> -		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>  	}
>  
>  out:

