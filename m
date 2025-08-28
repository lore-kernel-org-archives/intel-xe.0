Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E924CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 21:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E655810EAE4;
	Thu, 28 Aug 2025 21:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JuBblKZK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9AA10EAE4
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 21:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756416813; x=1787952813;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+FixG1Plm3vJiJuJqUx+bgPnq/a1hedryeHLciLzR7w=;
 b=JuBblKZKKL/K66alt3OV+/H4aagRTOmdMLxcDipQ/OFC/pAHmHr80OV6
 fiEjbqHbMMUir/g26UxKPIx1WgjLIF0UwtEgejrVrDbJdEcsehjyLfS5Q
 yTVgIqU0IZkoz1NPNSLVbBymghsXmSUwO91C5eZN425Y8hx/ouTaeZ/l0
 N/pWQzcOMQ0vVsLpxlSEQErjSVmFEj478N4lHoJfGIrS99pLOjyJ5nbwk
 7PQAqrn7VDTWBlX2NW9t+0D5PFBngiI5BLDelrsu8Re7aXqzZe1m0CF80
 XJIinTRO78APjoZ8drTi+dEpt8Pb9WDkq86RTLK/iiF+0SIlMZFM8fbVE A==;
X-CSE-ConnectionGUID: ugCjU8lmSxeF14GEI+2OLQ==
X-CSE-MsgGUID: FKj+b8Y2SxKHB0RziKiLiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58846460"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58846460"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:33:33 -0700
X-CSE-ConnectionGUID: IcP2LeaGQvCAbhyPNmK0qQ==
X-CSE-MsgGUID: BfEhhBrSTxegmlf/7rtCQA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:33:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:33:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 14:33:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.84) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 14:33:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYOiHoyjwuW3+8BKszRw0ErBkVE8I1xB/WQTsiHZqzc9vJdhdS1ygp5gKth3ek3K25uDbepvPN9W+tnyvmf0doTA6yt3eJU3AJzDh7hgyk+X8jk2iVsxZQqAPEWIda67t7+S1Smdiz3jH0FIuMDQ3iicL1PX+MVSORBQNUXCjHjhwi2mXGjHhRETa9cIdbpU2As28i0PQMV3r8HqwBfl64CZw+JIXOyhYKDaTK+qDQfY3HSfV0Z3TS4A5hUuguXlkohT7AoChveSDYEvhaA2RRwUW39HDC2PIvHsdTVXGVdhaJfTn4OIurAInflRWALTc7FRp73OdygGorgBRfXJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7ev6N+WvkNW+m2rFcO6mZT06LH7odK70KTOvff3RHQ=;
 b=M5mh+Rjfv142TdG/I1t+lyY8My/12uOUyj/ApSiQzdYTA3kDf8C5ZgYulgjg/T0Tn2yVrOni9SaeW/Q3CCg5kOgl2JWgvgg232QcIMIgV82nwmuyMmAfI/pcf4EJ5EwyVNzziIxv2d4QC63cw6deV671Tyb8ZO9kM7OsJzYhznrg5C+OTPLm2DCkYA32LMBNcczGbfSwYJhU63WqyQLl0ay/97G450FIVRkRRq4pP7be/bhTfjqL90Ue6rT/VL3dfE3a1+NSzQFoCcnNyuKI3PhP+Leab4MzRHvGo03ifhNkLedNN5m+3HDweouzbMuT+CVUgYMN9FY9Jc9qCV8dxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by DS4PPFCCD6F4BBE.namprd11.prod.outlook.com (2603:10b6:f:fc02::4e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 28 Aug
 2025 21:33:25 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 21:33:25 +0000
Message-ID: <7cca975b-c27d-4c6f-a70e-c6316bbe3e1d@intel.com>
Date: Thu, 28 Aug 2025 14:33:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Increase GuC crash dump buffer size
To: "Summers, Stuart" <stuart.summers@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20250827212110.1024961-1-zhanjun.dong@intel.com>
 <39b6759c8ada538ba44e375c7cb4e38ef824fa79.camel@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <39b6759c8ada538ba44e375c7cb4e38ef824fa79.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:303:6a::7) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|DS4PPFCCD6F4BBE:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bb6fee-b80c-4977-a1b3-08dde67a8512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REhwMW0wVHVZZnh6ZUdxOTI2Wll6dmpabU5EdGZMVHRjNzJTVGR0VWNoZDg2?=
 =?utf-8?B?R1JRRlhOaFJnbXBnM1BOVGZpN1lUSWRiajZnQW1rdnZveTg5b1dLRms2UkZP?=
 =?utf-8?B?d3U5enEzRFB6Y3BiaHJNZEZBbTJ5ZzNuUGlGUmRYVUJKOSt6SWRVcU5raXRP?=
 =?utf-8?B?WXBoeXZxVjRrT2RSM042eEFwa21vZzRCYVEyNGpCdGpKdEtIRnZWcThJOXJL?=
 =?utf-8?B?TDAyd0Y0dC96aTh2QXRZRTlFbmplMEtwTE9OT3BpUmRxcmQ4U2ZXZGMyNXBT?=
 =?utf-8?B?TDNYejJ5aVRwN2FhaU9FY3B0YmxpQ1N5VHZzTEJGdjBqQ2FmWVgvTDNtanVW?=
 =?utf-8?B?bmtQemlyQ1RqTm4xVnBxcEZKa0hpczVvZ3FwbEJReVQrM2FCc3FQV3VyczNo?=
 =?utf-8?B?OGNMUlozV29QOXNpck9KV1Fwb0FRMHJqS0tONDRnd3ArLzFuSng5cjkvK0ZL?=
 =?utf-8?B?LzZ4TGJkQ2srbWdnQ09iSXgzbE9GRURuM0JFemZpUzFEM3RIVDA3ejIzd1E2?=
 =?utf-8?B?Um5weXZVZnFlbzd4MFJ5VE1NcGZ0dkJPWUE0YzBCVUVHSmdOaXpXYzVoaFVC?=
 =?utf-8?B?QTEzS2lJWGdrNGRkeGE2aUNraXFqbWg1VEd3WWphSEJ3Qjk2cjY2b3ZnZkVv?=
 =?utf-8?B?NmxVa1plTEZRYVZESkx2VlA0VHdYVGlQRnh4S3l6dmtJMDJKSWpIRStMN3lX?=
 =?utf-8?B?eWZLNzRLVlBJNXl6S2pVMGZsQmtYV3VUc1g0TEpkcGlNWitTcWFzS1A0RERu?=
 =?utf-8?B?MEJnbnNzOGw5Y05rNnFUNmc4WU9WMWxPU3Joc1orSkFxVGovZTE0R3Z2Snhl?=
 =?utf-8?B?aXVLZTJzWVg2TzVpOGpyenlTbnpEMlY3Ujd5YTI1Nkt2ZjJ0R0J3eUhhK0hX?=
 =?utf-8?B?YnZhQS9MYzhWODJLclp5QkdRQk4rV1NwZ09XTUZXZE15UzhGVXFEZGxocFNH?=
 =?utf-8?B?ZlpCMXhVUWxZU3lBcVpJKzZvbU5OekI1elNYNnpldXorY2x1SzBhM3IrUzRm?=
 =?utf-8?B?KytGOHBqWjZNak9McFlVTmZtOTZDb1RsSHA5eG5uejM0bHRCME9zV1orbWJX?=
 =?utf-8?B?Z3BHNldxSEdObWRycWVuZDlUVVhsV3AyS0FwS1ZEbWVIeUJ2ZlNMRFJFa2Jy?=
 =?utf-8?B?VE14eVFjb2VSc3FKQ1crcG50bnExWWQvd2x1bHNRSGEzQVNSZTlhN2JQODlY?=
 =?utf-8?B?Y1FsQkdYRDNTRjJOeXR2NVUrSEZVR0x5bmw2WUdMNVp2dWFUdzhia3J4VGoy?=
 =?utf-8?B?bVpFZ0ZKdlBJNGYvbUx6SVh3ZFhKdDh4a0lsV0dla004ZEEyaXZncjdFOHFP?=
 =?utf-8?B?UHBwRXl5c2tUbGlGSXRMNjFrMmNCT3FKaEVCQnBCTERibXdmQ0RkYnFBb2V5?=
 =?utf-8?B?QXdBTCs5RkRtdlAzUWh5M21EUXNhYXRWbHg3NE1rY2tQenlDTmVLTEZQT0F6?=
 =?utf-8?B?SFh5STdJRVBpNC9RNG5VTzdkczFrQy9pQmRDSnliYkp0YVRkYzRZY1JEcm1s?=
 =?utf-8?B?TDJjZ0tVRWRPSHIrTDVlVk5qYkIxOUpJZGJTY2YyeFdIVnhISDJ0U2wwbnd3?=
 =?utf-8?B?elg1Q21JSUQ3T0FxbHQ1TlpZU2FxZEk1MzVPTElIa3krbW84d0VXUGV1anRZ?=
 =?utf-8?B?RHhTcWpuRFA2NnVxMy9jaXdPcWo3dWJnenJCcDVTLzFIV1d1aSs2Rkg5TWdq?=
 =?utf-8?B?YUlteU1XMFZueEFkRE1rTDl0V05ZYUFqdGJWOFdBMVJhUUFzdkVIWFcxczhZ?=
 =?utf-8?B?M1BjWTBrOTVtMUdGWlNhR0RPMCt6VHhTWVpXdlVSTDFEZ3hRYlFxUEg4djZH?=
 =?utf-8?B?dE91QmIxQ3FYSk1ibHNabHVraDJwOU45YzlTejhHYTRoZUU0NTBxNWM0ZlJl?=
 =?utf-8?B?cFY3WTFEMGhxV1FxeER0VVgrdmF5QVljU2lJcmVSQWZCOU9KbmI1MDhNWUd3?=
 =?utf-8?Q?vTnUqNZthCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXpaZUpVNGRZSmJnZzRvbE1hbUNiMVRXeGVseFo0U1JNQTU0K0tBSnJxWGpK?=
 =?utf-8?B?TmN2dysvRjJtZkN6OU5oc2tqakVYaVZVMHEzTS9JVTlSVHkvZ3pWNW5kQmpX?=
 =?utf-8?B?VWdUajU1KzFqbW1tcytpalliT2JQYzZ6cmk5K1BQa0VqUFNDREFLKzdISnlX?=
 =?utf-8?B?eVNhU3pZb05jWmV1MnJYZm5BQUoxWlpXME1YMGZiMTZKcjAxWktsZDQ5Vk92?=
 =?utf-8?B?R1ZpWGVNcm0xdEFHT3EyZUhoV2hVZDJ5NEtGWEphSmVkL0ZJNjEvVi9KOXUy?=
 =?utf-8?B?Nmp1eUNzeUx0Wk9pNHVHS3Ewam5jYldyYWJkTHZXSlZVaDJuUnN2aGkybXdT?=
 =?utf-8?B?WGwrU0JzSFNKUE1oL1NMZzZwRXVFOGlBNkJ4MW1PK0laL1phZnV0clk4S0JE?=
 =?utf-8?B?OXdDMlc3MWJsc3VWck9TNCtpQzJJdTJDOTY4dlYxd0ZSTTVONmZYNFRXMnRp?=
 =?utf-8?B?TjZWQU5yaUQ2VEx1cjJSZUhjV1poSmpSQ3RKamtmZ0pHQUVSVGlNUmUxZUdO?=
 =?utf-8?B?UENSaXZRMGNGczJaRlZpNzlyamZwNVRNOEEzZHFUOGZGRHpnUThRRzA3OHNp?=
 =?utf-8?B?c2J1aHZ3QlZGY1Zoc0FueFEzb2NDRFRCWDZWM3RBY3U4ejJrbjc1M0x6Rmlx?=
 =?utf-8?B?c0RKSFNhSDN3S2toS0ZJSjZMcXU5dkVZYjRNaFYxODFaWHlWcG9JMFpIRnB3?=
 =?utf-8?B?cVRSdGU1aW9qVDBJMFh3T2h5T0ptcCs2akpna2dxbmpSVFVyK0daNXhqRjNw?=
 =?utf-8?B?UDRMY0FsdGVaNm1ZSWo0UnBNTTFGd1JZNFRNb3RlMTN4Z096ckIwN0pvMlcy?=
 =?utf-8?B?N1VobXdJR0p5SlZkTk5yYVpqaDFlUEpaZUg4ZG0vaW9sSXlmam81aU9yOXkx?=
 =?utf-8?B?cnVCbWUrbStpdzIzWC8yYWQ1NU1NSlNSMVQ2dUZzK0lZVWNxUVd1ZWIyV2Vh?=
 =?utf-8?B?TEhQZFMrbytoNmtQTE5sTlBaWkZpaWtvM09VMlNXQVBNRDh2dzV5NmNuaXha?=
 =?utf-8?B?b1RNWkpTbkw1b2grdGRPaGhwejc5WS9taHRBTjdacEN5RnNoYXZ0RVhEYWdy?=
 =?utf-8?B?RjgyN1NvUDF1NFpNK1AxVmxzZDBRQm82cjgyeksxZmlhM3FMQXg0bnJueTFi?=
 =?utf-8?B?SDhQaVlFdVFRSWsySDRLNWVZVlpKV2RBbFNEKzkzWEx2Ym0zYmxucDlIUlI5?=
 =?utf-8?B?OGtQNG5IMGFkYUNNc2ZBdTN0bG1yeS8rSXgyQkxQMzhUQng5dGxGa2hiQzJU?=
 =?utf-8?B?MFp1azBTU1NYSk1Tc0RpdG9KS3BiMnFSRTNuRktaMzI0OGE1ZnA1K0NEMTNG?=
 =?utf-8?B?bEo5cWZpRmRSVkZva0lLQWlWR2E3elN4YW5nRm1LTE1ET2RyODNBZmtNVGU2?=
 =?utf-8?B?QlBXbGxoenhucW5ZODRGTFVGY1hqNk9ORnhpeHFzVkpUc0srVThoSkROVDE4?=
 =?utf-8?B?NU9sbEpaYWtaeXlROGJSWGdzd1MzTytFRC96K0x2K2U1WUhzZlBXM01MdkJO?=
 =?utf-8?B?aXczNEtrd0l0eTA5SDE2OHpab1hrSWtqZllXR2VPZzR1SXh6NXU2dVB3dmFU?=
 =?utf-8?B?SnprdHdWbVoyMlY5VzE0Rk9GR2ZTaUYvWkhrS1lpYmZaQThxVTVIcmpQYVpQ?=
 =?utf-8?B?VnVEK1ViaTU3YVgzYnl0VXZPdnBpZTNFQTJCRnZIM0tiRU1vVWhvcXk4ZThQ?=
 =?utf-8?B?b09sV01ETmJBZ0pKRVNRTTVoUDdzZUdIZWJYbHBsdDB0WjFWeUpyQ3R6MGVn?=
 =?utf-8?B?SGsvNndSdGxHYk9QSU10MDZVS1B6blllQndnRnkvQmtKL1pGeHcwNi8xSHNU?=
 =?utf-8?B?WEFTRnlmOHM4ZHZlNUdCeHZrVCtTaHEvRW5rZG10d2VnVWtmTCtSWGdKN3Ns?=
 =?utf-8?B?a0hoMGpyNFpSK0pyeUdDTXVZT29HNUo3dUZYdHdzQlF6dkhYenM0OWpGRnFB?=
 =?utf-8?B?NFpvRk5qZE9TSFhlTHhaQ3pLZ01mVGJ0NWh0MGxyN3VZRmZ2dlI0eHhRTWlY?=
 =?utf-8?B?SnpsbkZ4NXZiM0NPT0JpekR2T0lFVUVraE1DS0RQSG8yQ0poMHRDUFBQenU3?=
 =?utf-8?B?U2wxOEZvaDBndHpDNUoraXQxS0FHbnJsZXZ1UGp5WUxlYUwrelFlMk1OM1FT?=
 =?utf-8?B?OUV1bk5nb0VUYktoSDEzQis2cERZYThRNWFIbkVqMzBHbUtJcSsrVlFkUHF6?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb6fee-b80c-4977-a1b3-08dde67a8512
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 21:33:25.0890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdO2P9kvd/yFwpvmWIfedetOD9lVCd9OCpBX86OVAMvmDGuljQ1/TL2UzZZG5tO2aXQ5qWIWmwXsnleoTub0F1bh7EsKsE3rxLmy/MTex3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCCD6F4BBE
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

On 8/28/2025 11:19 AM, Summers, Stuart wrote:
> On Wed, 2025-08-27 at 17:21 -0400, Zhanjun Dong wrote:
>> Increase GuC crash dump buffer size to support up to 16K dump size.
> But why do we need to do this?
Because some current platforms already have a maximum dump size of 12KB. 
So if things go truly pear shaped, we are already truncating the crash 
dump. That should have been mentioned in the commit message.

John.

>
> -Stuart
>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_log.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h
>> b/drivers/gpu/drm/xe/xe_guc_log.h
>> index f1e2b0be90a9..98a47ac42b08 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
>> @@ -17,7 +17,7 @@ struct xe_device;
>>   #define DEBUG_BUFFER_SIZE       SZ_8M
>>   #define CAPTURE_BUFFER_SIZE     SZ_2M
>>   #else
>> -#define CRASH_BUFFER_SIZE      SZ_8K
>> +#define CRASH_BUFFER_SIZE      SZ_16K
>>   #define DEBUG_BUFFER_SIZE      SZ_64K
>>   #define CAPTURE_BUFFER_SIZE    SZ_1M
>>   #endif

