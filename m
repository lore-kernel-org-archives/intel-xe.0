Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272DDCEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 22:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3EA10E051;
	Mon, 17 Nov 2025 22:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mxt5GcAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2845A10E051
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 22:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763417103; x=1794953103;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=pw0JYniI6Rvk3wY9Eg0B17rn+2buCv0CF2X5Lc/c0l4=;
 b=mxt5GcAwM+oJ5BF2GwHeIRjAgwWCeIcX9dmKg0uaEwmyl5aTyur6jTfW
 dbwj1w+kFgE+hXVbVypHfbje4P9gYDkqRqWDl53MgiTaNUMdCe2TjZY48
 mZf5IyvPENKCViJULcUVG36Y2ODv63f3pFsgTAmWJEM+LCaM9kBEXaLuB
 2wfYSdeZonzNa0VbCNGeUMVx62hqq1YPYg/ChGGF9QAPf/4U/w3eaLovs
 EE+4/mUOBHuPNAPZdSGCOxsI7Zrk+XQb5JizJHpWMYWFs0K4ZSWuenNyW
 Xr33VEzB6PjhMeO5xrrkH4NjlPQRnVuuiK1eT7wmqF0rBKajW6yJ2zTNT g==;
X-CSE-ConnectionGUID: 76VPVRiEQKau8fUmy79yDg==
X-CSE-MsgGUID: zsy26dXnSRyfLt2JVVE6ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65469584"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="65469584"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:05:03 -0800
X-CSE-ConnectionGUID: htqg4OZXQdCfcJI3ZuxBjg==
X-CSE-MsgGUID: eoRYMdJuSzi46CqMJeerpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="195499606"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:05:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:05:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 14:05:02 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:05:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6Uu8lchNsqlxaka6vsUEMbt4iqGSI2uBnDHh+CfYvokQZLWzJV3f+PZzsakhwEJFhiEJXxWRbhcJ0ytoUAy3eXcZQ1FH0xYTNuoHnUEq8pXPNXW81OAB9/ra3UiwVckIMKq0zvRUinou7MOoWquhTEcXG6jOl6XCUXTqm8v6C85D+PXPJSvoOdectVHh/Uhm/MmfIbFEXX7crAfNqByNZHYOHJk0T4RtyF/WYtjdS4QHRYwzcxu1PhZQSn22nQw0EtMOQP3GZV7Bd/NsaAbCl0Lnxhm6ILdEKYoZoaGE+b0nL7ANYQNty832BXWAKlb/47D4TcQ0o0+9tjY+tS1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpHYAQrvmi7guSEtE5kn+TwcjhsYwWXg+nKWJA7knCE=;
 b=F5yigzsYbdO6esNOBunNYSLw7QfetnqUHKUqF1EGXDTWf0zrjwWXk8aGCKC7yCNCIhfdse5EdIeWQR8hsm+eyds8ugy375K034QAhBhS5ZsqENR1UOjzYbl9GGaAoZLyDsb798qPBi8HikKvkXIvhkLbT3M21xCENcNOuYw+VOHShgbVIZfmXqM41QHt3e8Rgx3ZyBlZ1/ztJ+zd7tiKKB6Xz0Z0f+qmffPJy77ark3G+O8HCNwDQdwZZugAy3TyjawkE74q2/kv0NhhqrMviDAD22wxtJKk6nIQu48/mr9yi1cuKd64LXDzgWE08PmSQPm8/oN/XR+IPCZHex2DqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5115.namprd11.prod.outlook.com (2603:10b6:806:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 22:05:00 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 22:05:00 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114214335.2388972-31-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
 <20251114214335.2388972-31-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 02/27] drm/xe/pm: Add scope-based cleanup helper for
 runtime PM
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 17 Nov 2025 19:04:55 -0300
Message-ID: <176341709502.5989.12881632941364116182@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR21CA0009.namprd21.prod.outlook.com
 (2603:10b6:a03:114::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5115:EE_
X-MS-Office365-Filtering-Correlation-Id: 9530c11b-e4aa-4c7b-ac3d-08de26255a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3hQMzUvQ3FKNFRDemhRWXZqTHE4LzNWWUwwQXNvTnZlSXZWV2tERzh4Q1l1?=
 =?utf-8?B?NjFIWExuRTc5MDVsSU1Lekw4b3VVZWRGZFRVQ2V4NXBsam9Lb2U5MXpNUkY3?=
 =?utf-8?B?TWxhZG52OFMrWWhTVGI5YkljSm9IalNyZyt0NWY1alhPOE5XeFA0d3Urek4v?=
 =?utf-8?B?QzV4UGJZaEw0cE1PckFqZENUYTBmcFg2b1ErZ1dPQlA4ckNsbTBCNVVpY3J2?=
 =?utf-8?B?eDBjb2tuWE5HT3VMN2dSd2s2OEhmdlpSdGRkUEgzMEJjQ1FEOE5GaGFrRzlq?=
 =?utf-8?B?cVQrYUlPaGRDZkZPZ1dyeWtLOWYySWkzVDRmTVQ2VHdrcjB2aVVaSmRwa3pS?=
 =?utf-8?B?TVR3U204SGxOUGZUTmtSMHZmWXl3anRRa1I0OHMzUXB0a2JvOWhsRXhKUFBx?=
 =?utf-8?B?VHFMN3NlQWQ4Z3ViNEpoYi9KQlNKTTB3WUxFZXNUQVU4NnUzalZ5RTFuZ2FJ?=
 =?utf-8?B?MXlMdTNML2hnK3FMKzVmWkNhVTdieG9BTEVxcEdvVVZSbmVHdG9lWlIvUVRG?=
 =?utf-8?B?TDVTT0llVVZGdGpzOTNUSXJ3YUFHdHBISHJ3SmIzSzJ5RGRQNzRxeCtySmxQ?=
 =?utf-8?B?Smd6NjBOdkpUME1XQnpROEtGd0xYQUFwUHRabGFZcGdXL3lRTkVaQmZ1SDlT?=
 =?utf-8?B?dy9sRWRTVHVVWFBKNkhEZzBTSGs5YWhjVEdaOG56T01qYThuSG5MTXBqQ0lS?=
 =?utf-8?B?NXVxem9GSkw2NndKR0YzbDVUNjhvOS9aZHlEcmVBREk1ZnpDS1p5TmZ3Mnp0?=
 =?utf-8?B?ZXdkR1hsck93QXFjUWRDTUlMR1lMZzlaNXRLTzkvU2UzWndLZitBajExOHBq?=
 =?utf-8?B?cHl3VnYyUndLcDFrTXN6RTJ6K3RtRW4zb29OVjlRQ3lzR0hIWnZUT3JETzVx?=
 =?utf-8?B?a2x4MHdlQTJPV2JIcjRCemZkZEpZc1ZNZXFUSElCRENDeHpQQTk3RFVZMTB6?=
 =?utf-8?B?OU9XU1BoemtIMGRzV0YyM3ZVWnVjRHZPTVUyd2VkTzk4M1c5SjFTU2JsT0lx?=
 =?utf-8?B?SFlHRy9tK3J2R3BGNnVNeFMrbnlnendrOTJGQzdiZ3BwUG9DZ0tzWEI2V2xo?=
 =?utf-8?B?RG1FeUNNbkFHWlp5ZFFIS1JOcjV2Vjk3WGtrNmltUkNwM0RTNEpFMnBuNE5S?=
 =?utf-8?B?WktEZEt0bkFDREY4VnNSQUNvZ0cyMHlCc3VxU3lURzY2bmgvRXppK1FMYWdk?=
 =?utf-8?B?SG9GZjVYdmsybUZCbm8yb3RVQ2oxeUdkMkNuNG5MMG9ja0RQYng4TU5yZ0s5?=
 =?utf-8?B?bDVXRXdzc25zREZ4R2E3cE9RWk5hY0NreHJYdnpTNUY5L0N4bmRDakFhYkYw?=
 =?utf-8?B?NnZKU2lKa0xoS0Rpb2RaQUh6OXc2eE1LMkdNOTlabUZHU1E1b3FRcDh2ckRV?=
 =?utf-8?B?N2hLcjNSNHd1Y1p4SEtvOXdSREdKTVNHTE5MeUYxb2ZVSTYrUUhMNGdSTFB2?=
 =?utf-8?B?Q2xTNU1vbE91aG9vcm9tbTNTNE11M29kNit2QmhxL1FaTFkvMXNDeGR4L3J6?=
 =?utf-8?B?WWxIQUp4UXhhQTlIOHlvd2lKWXlsWWRHRnZMOTFTa2s3bFlQZHBpSGEyNnVy?=
 =?utf-8?B?M2U3bk5Jc05sYWx3VTJXNGY5Yjg4VTVBaTc3MC9EdTF0OTlxVnJTb21HNmho?=
 =?utf-8?B?bFE2TnN2M0FwR2ZZZmIyN1JQZmlZVkhuUEVtT1VvWGtpYXlBei9lOHhuK1JF?=
 =?utf-8?B?a0U2RGUrSTJCUllSdE84Mkp3NEZ3U3dNY0Z4M0greWxRK0dvNnVLVzFBMTNI?=
 =?utf-8?B?WkpMbld3anpoMlRrQkZtN3BramduQXU2NWVpU0c1bEZqVUZqNkI5Q3dtK0Zn?=
 =?utf-8?B?VUt1c0VxbkIweUQ1d3BOVFFaV25vS1lSRENLY2VjQVE3QmM2LzFVZElNQ043?=
 =?utf-8?B?MERZYUZ0bnlMWmxNQ2JPbGFXWTVxNlRGZFpxaEs2SUhLNHV1cGpBU2Z1bzZG?=
 =?utf-8?Q?7YHE6J7tajwLZeLOBel1VAkRaokCj+Kx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vzc3V0dWd1prM2FFVkVzeml4ZEZmT2JWbzBoV3RhYlJxYklGOVpxTUxqNzQw?=
 =?utf-8?B?NENSMTFDUmlwMHFsbFJkNHRncFNSNjdQYUdYTXp0cGxhYUI4dkhZcWQ2ZlNn?=
 =?utf-8?B?b3k2cWFqbTV2NDBNQXFjVTBHdi8vT2lNRTk4WTRIdFJiNjdvb2xUNTFCcmRZ?=
 =?utf-8?B?TlhWU2prM3BQYkVhVkhlSDJDWHpyZG5NRmRCRmdXSmZXSHZ3c0pMM0drKzdN?=
 =?utf-8?B?NGFzYTdXeXpib2RiN3J0Yk1aVHczWHdUanUvbzgzMjlxZ1lRN0xiYjh3MGZR?=
 =?utf-8?B?ekZ4N1pYNnF0bE53Q2tUNk12QWdKK3l1Y0V3clBXVlZiWHorZzNtUW5tOGhn?=
 =?utf-8?B?QU81Mnc2bjFic3ZVNlRUTDN4SUVjN2NYYVFVZHdPbWQwT05aOUFlemJaaUFT?=
 =?utf-8?B?d2diRS9NbXNDNm5UN1pnODY3NExkNnoyMmFzQmdjUFBFMHZWZEN3SWZXYmRa?=
 =?utf-8?B?VW81MG9tNk9oT0YwZUlmMjAvS2Y5V3RxLzh0Y0NlcSs3VlZ1T0F1ZUtjdVpJ?=
 =?utf-8?B?SlNYVVZ6ckhLQi9CdzBaOWNUYWJaQlIxQkRsdU9lNVFhNlBIa2NGUm82TUVF?=
 =?utf-8?B?SE8vU1gvLzhhQ1AxdWpCQzNOQzM2cTlJVEo4YzhudFA2R2JJUktwYTFPd0xm?=
 =?utf-8?B?alFTTzlEb0ZoNVBUdDlZUUw3V25DUWNQc1hadHp2cWhzT0wwdXM5ejROVThu?=
 =?utf-8?B?YXhMWkVMR3dXWWpNbUcrMDh1Z05rMDJtd3hUY2Y3YnFCQUdGdkFOTnRJUGtK?=
 =?utf-8?B?d3AzTUExdW1nWkxsWWhnWXJJM05TQ0Z3d2JhVGY5VWxNbjI1aEV3VjRGaGFO?=
 =?utf-8?B?OEQ1YUFhTzVJMFR0ZGRDY2NrZTBldE9jL0VDdVJaWFY4UHRDamtCVVJSYVJT?=
 =?utf-8?B?bGF5M2dEcC9qWEVYQVA1NnJvVjJnZmRROWJqamQwdVB3K0dKdDF5ZTJZZm9j?=
 =?utf-8?B?VHBJemM4ZVZDK1ZDSFgzbFovWGVPNG9kUkF1THVyOE8zcHp0NFNBeW9BcUlP?=
 =?utf-8?B?UlE4MG5tU1NmK0FWQnJxWktsZDFDWUhBakU5MjFOenVNaWIxakZKdVNKeWNQ?=
 =?utf-8?B?TjNyUWF3c05Ca2NpN0lFa25DMXI5VzMwQUd2VXNJb3VBdjR6L1IvWjcyNVlp?=
 =?utf-8?B?U2xlcW56N0YrQlA1NjdMTitJUkNEZ2kzRWhQRDQxSDV4SUFxbXUybnZTMUhS?=
 =?utf-8?B?RklMS2t2YUp3dzlWa2V3TDk3VDN1OUZPbU94OVhnVEppNEJnWDJiQ3ZOcENS?=
 =?utf-8?B?aXkwcjFIMS9VM0oxMnNXSE5yV0ozcWdtWFlka1NmMWh3TVJkaW1IV3NWVEl2?=
 =?utf-8?B?Q1IwYU91Yy90SXEzb3Z1cC8yNnlEQlFFbTNIM1ZhUHM1alRxNldKSzd5Unpn?=
 =?utf-8?B?dmd2SHlGVU5DU1djbXlBMTdEK3NDN2R3U2RrMzM0OFJLcXhlMUx6aWh0K1FD?=
 =?utf-8?B?SXlkN0pKemhYSGsvRVZZMS9UUVZ2ZnI1SiszSFhSVGYrQnhNYTFBa1RnR0Nt?=
 =?utf-8?B?UjlHYkJjR1hXUGNQNDNjZzdsbm1Td09IZTNQZklpNDRTbDhGSFgwOHdOQXJC?=
 =?utf-8?B?VUMvYzMwdnRsSWhERXhHSUwrQWIyVCtwdUNEaDZ4b1NaVk1Xd1ptZGtRd3lM?=
 =?utf-8?B?ak5JM3d3bjN5cncySTFvNlhpdmVHVHA5S2U5MEIrY0wzMktIdXRNU2Q5aE10?=
 =?utf-8?B?QXp2cEROS2RYQWZhNVU0L1FxdnR0UEdTTE52WVpibW1XTFFKZWpYdXlzR3Vt?=
 =?utf-8?B?c0Z4ZlVwOVhtRkFMYkdaYXdZbUxoQUJ4Q1I1b1J2c1VTQzUwZEVGZVJFeXpH?=
 =?utf-8?B?Q2RYU2hwelFKSXkzTmd4cER5RG5LSXhuNkh4QVRrMXNqNUxWNTExZUtnTll1?=
 =?utf-8?B?dmxQRGRsZWZUN3JzYUhZTFcxVU15d1ZNZGRoZjQrMytCUFN5WHVOVzVFdHE3?=
 =?utf-8?B?cVlieFFBZWk1cWI2aWVyL1ozNU54WGJGOWc1ZDdLdzZhZC9KaVFycjBHWTVq?=
 =?utf-8?B?eVF6M3hrd0ViT2RMcjREdUJmVzk0QzVkZUZvaW5aQXVqWlZJWGswdmduRjNH?=
 =?utf-8?B?ajBaYzg1VVUzR1lBU3dnWWJ0TWdHbFFaSnpZbGJ2VXpmRWJYY01ESDI0L3Vo?=
 =?utf-8?B?OXA0T0pONDg1RDFRL3J4bStxUE5FcUJUd0FuV0dTT1dlemMyaWdDR2p3TGwr?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9530c11b-e4aa-4c7b-ac3d-08de26255a15
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:05:00.6481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uy5BBfDRx/pXt0tdkYF1isJnM+InDBg/o4K7Fx4m/1p8VgsWuaXHF0811KhUKYxY+ETjAKjA0ldsDCJmdYViMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5115
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

Quoting Matt Roper (2025-11-14 18:43:38-03:00)
>Add a scope-based helpers for runtime PM that may be used to simplify
>cleanup logic and potentially avoid goto-based cleanup.
>
>For example, using
>
>        guard(xe_pm_runtime)(xe);
>
>will get runtime PM and cause a corresponding put to occur automatically
>when the current scope is exited.  'xe_pm_runtime_noresume' can be used
>as a guard replacement for the corresponding 'noresume' variant.
>There's also an xe_pm_runtime_ioctl conditional guard that can be used
>as a replacement for xe_runtime_ioctl():
>
>        ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
>        if ((ret =3D ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm)) < 0)
>                /* failed */
>
>In a few rare cases (such as gt_reset_worker()) we need to ensure that
>runtime PM is dropped when the function is exited by any means
>(including error paths), but the function does not need to acquire
>runtime PM because that has already been done earlier by a different
>function.  For these special cases, an 'xe_pm_runtime_release_only'
>guard can be used to handle the release without doing an acquisition.
>
>These guards will be used in future patches to eliminate some of our
>goto-based cleanup.
>
>v2:
> - Specify success condition for xe_pm runtime_ioctl as _RET >=3D 0 so
>   that positive values will be properly identified as success and
>   trigger destructor cleanup properly.
>
>v3:
> - Add comments to the kerneldoc for the existing 'get' functions
>   indicating that scope-based handling should be preferred where
>   possible.  (Gustavo)
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_pm.c | 21 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_pm.h | 17 +++++++++++++++++
> 2 files changed, 38 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>index 0e573fb11bbb..ad92a142dc7e 100644
>--- a/drivers/gpu/drm/xe/xe_pm.c
>+++ b/drivers/gpu/drm/xe/xe_pm.c
>@@ -722,6 +722,13 @@ static void xe_pm_runtime_lockdep_prime(void)
> /**
>  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronousl=
y
>  * @xe: xe device instance
>+ *
>+ * When possible, scope-based runtime PM (through guard(xe_pm_runtime)) i=
s
>+ * be preferred over direct usage of this function.  Manual get/put handl=
ing
>+ * should only be used when the function contains goto-based logic which
>+ * can break scope-based handling, or when the lifetime of the runtime PM
>+ * reference does not match a specific scope (e.g., runtime PM obtained i=
n one
>+ * function and released in a different one).
>  */
> void xe_pm_runtime_get(struct xe_device *xe)
> {
>@@ -754,6 +761,13 @@ void xe_pm_runtime_put(struct xe_device *xe)
>  * xe_pm_runtime_get_ioctl - Get a runtime_pm reference before ioctl
>  * @xe: xe device instance
>  *
>+ * When possible, scope-based runtime PM (through
>+ * ACQUIRE(xe_pm_runtime_ioctl, ...)) is be preferred over direct usage o=
f this
>+ * function.  Manual get/put handling should only be used when the functi=
on
>+ * contains goto-based logic which can break scope-based handling, or whe=
n the
>+ * lifetime of the runtime PM reference does not match a specific scope (=
e.g.,
>+ * runtime PM obtained in one function and released in a different one).
>+ *
>  * Returns: Any number greater than or equal to 0 for success, negative e=
rror
>  * code otherwise.
>  */
>@@ -823,6 +837,13 @@ static bool xe_pm_suspending_or_resuming(struct xe_de=
vice *xe)
>  * It will warn if not protected.
>  * The reference should be put back after this function regardless, since=
 it
>  * will always bump the usage counter, regardless.
>+ *
>+ * When possible, scope-based runtime PM (through guard(xe_pm_runtime_nor=
esume))
>+ * is be preferred over direct usage of this function.  Manual get/put ha=
ndling
>+ * should only be used when the function contains goto-based logic which =
can
>+ * break scope-based handling, or when the lifetime of the runtime PM ref=
erence
>+ * does not match a specific scope (e.g., runtime PM obtained in one func=
tion
>+ * and released in a different one).
>  */
> void xe_pm_runtime_get_noresume(struct xe_device *xe)
> {
>diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>index f7f89a18b6fc..6b27039e7b2d 100644
>--- a/drivers/gpu/drm/xe/xe_pm.h
>+++ b/drivers/gpu/drm/xe/xe_pm.h
>@@ -6,6 +6,7 @@
> #ifndef _XE_PM_H_
> #define _XE_PM_H_
>=20
>+#include <linux/cleanup.h>
> #include <linux/pm_runtime.h>
>=20
> #define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
>@@ -37,4 +38,20 @@ int xe_pm_block_on_suspend(struct xe_device *xe);
> void xe_pm_might_block_on_suspend(void);
> int xe_pm_module_init(void);
>=20
>+static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
>+
>+DEFINE_GUARD(xe_pm_runtime, struct xe_device *,
>+             xe_pm_runtime_get(_T), xe_pm_runtime_put(_T))
>+DEFINE_GUARD(xe_pm_runtime_noresume, struct xe_device *,
>+             xe_pm_runtime_get_noresume(_T), xe_pm_runtime_put(_T))
>+DEFINE_GUARD_COND(xe_pm_runtime, _ioctl, xe_pm_runtime_get_ioctl(_T), _RE=
T >=3D 0)
>+
>+/*
>+ * Used when a function needs to release runtime PM in all possible cases
>+ * and error paths, but the wakeref was already acquired by a different
>+ * function (i.e., get() has already happened so only a put() is needed).
>+ */
>+DEFINE_GUARD(xe_pm_runtime_release_only, struct xe_device *,
>+             __xe_pm_runtime_noop(_T), xe_pm_runtime_put(_T));
>+
> #endif
>--=20
>2.51.1
>
