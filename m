Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0625E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 06:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757E210E18B;
	Fri, 13 Dec 2024 06:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQowW2Ai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2D410E18B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 06:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734069656; x=1765605656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/voUPeEyDnTTbJnmA+67m3qQFTw9G2RisXh/XkWVmD4=;
 b=eQowW2AiotsFZR4lLILrHz0zvfuZeDK0jL0CIuOx6Sxy2pZuL+YzZoLr
 Y6XuYR2EB2ZdZN/R1m7jxvfAvAheik42iI88vhE5cSigdOlk0JreC3qEm
 IDLzMWotSvvvBFVvN34rdDV9kJoaQjhkBPVo9MjogICvm1CiZtwLbg0v1
 tFR6OLrDPIJpJii5JdOEo05Npj8ynsmKN8FwLzEo7p8mGRh5mTXHlIT8u
 UEpDyjO3wUYniWOURuCe5lpkl/l+MgJeb+rhYI68JliT6H0jlkm0OucQQ
 zIEOx5T6ktnw7OP6CIUAH9lj9ti8y2v1skp55G4iOfyPs/rZE/YiBjH0G w==;
X-CSE-ConnectionGUID: FMh0vxEFRnWcDmlodcl74w==
X-CSE-MsgGUID: VQSheQHMSCS3dqObuENp1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34430116"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34430116"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 22:00:56 -0800
X-CSE-ConnectionGUID: 5H9CFOPfQ/GALzt3tcKI4Q==
X-CSE-MsgGUID: SejqfkxqTISAw+0epPuYKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="101472037"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Dec 2024 22:00:55 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 12 Dec 2024 22:00:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 12 Dec 2024 22:00:54 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 12 Dec 2024 22:00:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W91x2/v/lXeYpuiwDoTJ9twNeKjBJzBchJmTrBsc4Vy9ZIup9w5k2gRnJjKVr5NG2XH/w5aRkHnRLqnj7pPEcNvX+5xScZCap8E1OjQ7GO75wq3dy+inMNz9eEklK3DikzwXIzibsq2n3CSox2yC6pNEBMOULUALRtAwkvYEnWZ0B2rMql6kj77i92UYMQcpIt0Ua/G64N7cvVruduqLlqWyGr0dN+z6im+3XXt4Vn3iuHxxtk2LKlHrUAcjOmWW+A7Yuh9ekXvHBDRFQwZRrdnRSeIulRJHl0fkIjGR6o8yVmmbqDSdRQKd9rhrDPeOoMcP9l2QoIQzhu6B8LmZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98qboW3706VQhTpJM9SdRC657jIvCZnrQoeP4uBO6Qo=;
 b=OjU69VQM6Ld0JyU7nFMCk4MXlKb1Qtwz4hqoTBjZVQeneNq14dwlHeoqym9BzpyueE7CW2usTbjKchTbMAtQVmVL6CYQGLi1/NwlxEdJFVQwAIi+6tnDzq72Vmh3XSodW5EmFy9Lu5YUk4Topa3fBT29/wQzXt2msGBCDX/bydSozl1a/Lvy8cmK/YWIIJrKJ/BrBXglm4UeXHltK77MhmMqImcLTyXiSWXW0tP4zp86chFhmeJyUQ4oqNtlTvj6a8GUrtu0zig1WCIylE2jcZEYnUEf1ehMuXCbHk8XMJWaPl2Z6NttMLuOGYr+z9yvPSMBOEiZxwJxB+5MhOdKnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 06:00:46 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 06:00:45 +0000
Message-ID: <30a06548-d50f-4c57-9697-39a2bc3a562b@intel.com>
Date: Fri, 13 Dec 2024 11:30:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] drm/xe/guc: Expose engine busyness only for
 supported GuC version
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <john.c.harrison@intel.com>, <ashutosh.dixit@intel.com>,
 <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-8-riana.tauro@intel.com>
 <u3bmt4wjtini2n7bes6gyq2f23kboagca4ee3ekg3oer3qjujj@mh5ct5xwggo6>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <u3bmt4wjtini2n7bes6gyq2f23kboagca4ee3ekg3oer3qjujj@mh5ct5xwggo6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::27) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 578acbe4-ba85-41bd-7af6-08dd1b3b7c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHl5QnlqNjFWUXlQeTd6V2E0SkU4Q2pEVTJsNk9BR2hlWkJtYTlDS3dpN2M2?=
 =?utf-8?B?NmsyQVIwQklVM3ZNeUhQeFhuanpqRTZYaWhmbkIvT21wYzNCNTRGWVd5aVl3?=
 =?utf-8?B?Vitya242YW41Wis5RVdwS1FlbnF4THdiOHB5bXU1OUl4dVJlV2pvU0ZHT0hU?=
 =?utf-8?B?d1J0UVJ4S2QrNGtjMFFoelVpS2N5bytQbEcxdWNmRmJsbDBTN0NHRWxIbVNt?=
 =?utf-8?B?Rnhsb2NoNWdXdC95NXA5S2RoRHF5VGQzV2lBWkhncFlOVk9KaGhZMDI0cG1o?=
 =?utf-8?B?N2pBdEtRbDlZV0kwK2NHdFljekw1MEN2M3RVamR2Mnp1TENadXFOSE1jdTNi?=
 =?utf-8?B?Ly9IWU1FK1RSU3ZCQTcxMjRSa3pqRmpWU0JsOTdKNFUzYkNmS05YL1JjS2I0?=
 =?utf-8?B?SExWUmxHR0FQR2ZoWGJNMUNXVnlmcll6V2pTeVdNSVhKZXZFWlA5TUFockdn?=
 =?utf-8?B?V2JJU3k3cnRIWUMvdkM2VEZrYS94cEVkT3JZZ09MTW5tMHY1Q2pXYWdPSHVq?=
 =?utf-8?B?U0hKSmo3NFpSaTJmY1BDNTNyOWlOZ1hUdVpudGFOUjVWSlc2RnhhbTdtTjll?=
 =?utf-8?B?ZzNBOW8wK0FNTG43WTF5ZFNQU3h2TGNkYkp2N1dDVmpteG41blE2R3hVdjFy?=
 =?utf-8?B?eHdUVWRQT3U0MSsydUkvaFRzdjNvWmltOTdvY1YwNFpmcEdhTlBjZi9Gb2Zn?=
 =?utf-8?B?d2NCVHhxMzRGbEdTNGNCbHVRUGNjMC9pcWxTRU4zNzdUYVM3U1JlVnR4ZitL?=
 =?utf-8?B?MiszdllrUng5YUxRVTBsaU1mRm91ckM3QW5UQzVHRGhObU5kUXJCVU00QWxm?=
 =?utf-8?B?a0t5NGhJS2NnbXlxQzRwWnJ4QWtOZmhrTzcvWnpLd2dZa1YwTG1yczZLYUtH?=
 =?utf-8?B?WGhDMlN5L3ZvcjMwZjROM2hFRThnQU5NQUo3ZmNkT2k2QldPTVpvRktjclFZ?=
 =?utf-8?B?OE5PVjhGSDl3ZmdlMXNJcDE5TWFUUTRzZVA5dFdQK3E1akkzN3ZaeDVOU1Ev?=
 =?utf-8?B?d2ZzWXNhTWxUeUdkT1BMLzZ0NVZ3b3U3MWljOFFaYjRZb0MvR1VNdlJIWk40?=
 =?utf-8?B?NFRxaUR5WEUwNHpQZGw4R0ZNSE5GNWkyYmJTVE90VUZMTnJ3dmhyR215NUFq?=
 =?utf-8?B?MU1JK3A0MVFBSW0xV2VGOGY4MDE0YzZDbnBnMnB5V0pETmZ4WEo4aHB1Uzdq?=
 =?utf-8?B?TjdnWVZHeFc2UStqU0srZ2VtNkxpeHFIN3hXMjlpS1A2cU9nQ2NsSkhHMmpB?=
 =?utf-8?B?UGVaV0pLSHlkYnQrQkVxc0NKdXVwWmU4ZHRvNVJSUUxZalI2NklXS1ZyeDBk?=
 =?utf-8?B?TDlXcllLd1JCdldxL2pKQ0psWm5INld0bnVveVEzbE8vbjE1UHR3dlhrTlZM?=
 =?utf-8?B?a3MxUmhQaDVmUUVVQ2QyZGdtVWpWY2RJSms2T1lET0ExVlJ1NDF6bVZwbFc5?=
 =?utf-8?B?d3dSK3ZxS1ZBYjYyQVZCVWVZU1pEOXJEM0FTMFJ1blZPZ1N3ZUE5NzErRGhJ?=
 =?utf-8?B?ZTRVTGExL3hNRjlnQlJBS3N6dndpbCtBcVU5cEI3L1A4eDUxUkpaSURQbHlK?=
 =?utf-8?B?dVpldVZiemY4NzJzT01pNit4enp5U3lnUDFrUVk3MEM5YUxSQ0t0VkdpTW5B?=
 =?utf-8?B?ZThaTTBxaWtlb3JaUkpSZUFqRGMrREdXWHJrMVdNQVYvMDB3QWg4QU5qdVkw?=
 =?utf-8?B?NGVvNTd0SjVxWmdQSVVWS3VnTlNzdE9IYWNjOEJyazlGdkNrTDUvNE1ESXJl?=
 =?utf-8?B?TFRhYmtiVTMyNkdQYnJFSlMzNWVITCtxMUFEdGRzVnJZdlNUTFBZWVBUVzV5?=
 =?utf-8?Q?Ybzbojyphma+v+lj4a4lQPz2LDiCdCWyJn888=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWpRK3RoV2ZweWZvWHhnVGllNVpWOTl0Q01PNWhvall1bWhmZzFXN0FlQmpW?=
 =?utf-8?B?YUNXeTZCai81R2FFdDVBdHl4cW9SemtiSWVBazY3eTNhUnJtRDZEOG0yVjZi?=
 =?utf-8?B?MTNxN0kzSGMwZ09zMDBNQ05QWmQzMmZJVHpRQk1Nb2orQTFPV0pFWXZmNGp3?=
 =?utf-8?B?V2dNU2ZpSWpVdTh6OUlKRGZEdHlCbXNuNkp6ZFFpYjJkZkU1NUJSZmlQZGZt?=
 =?utf-8?B?NlNVYkxBV09EM0lNUDV1SHZGczlLVVdiWkZUSHR3anFmU21lWkcvbTBZY1A1?=
 =?utf-8?B?S2ZjeHI1MEx6UFhJVnNPdGl1Vkc0RGlrTzFBVDVmT0RzMzcyekxTWjRncXdK?=
 =?utf-8?B?NjAveUtqTXQ1cTFHbGtPUytXUXROZ2Q4QVBRUjNRK1d5ZUxad1h6ME9QOCtj?=
 =?utf-8?B?K2I0ODVoWDNDUnV2TElKeEo5ZmJMakRMVlIwZFc3Q3pLUGd6SzQ0cFBCWUxU?=
 =?utf-8?B?UmVzQmhKWWV0cUJHeGRVdzdYMkJMNyt2ZVFsNFY0RGQzUHA2Sm9jZUNsYlp5?=
 =?utf-8?B?VHZ4TWRPZW1ybTcwN0R4cTdwWmxrb0ZJRG55MlorNm5Ec05UcHppSkdZZDhW?=
 =?utf-8?B?L3pxcGdtODhId3FhWmtPMEx6N2hxT1VDem1yVThIU1dwOUZMbGgzMTRNWloz?=
 =?utf-8?B?ejgyRktDUk83bUVvaTk2L09iSllvSHZtZjNOYVp3U01HNjI2VHFDNWJlN0R6?=
 =?utf-8?B?WkhyampZemk1K0YxZmsyR0dCdHY1ZERYTDIxRDA0R0ltN3Z6VWtkc0lYeGJl?=
 =?utf-8?B?ODZoaG53cFVoMDJnZkdNb3BJcHBjNmI2NC9yVUsrSGVST2wxaDVNMFIyUkF2?=
 =?utf-8?B?Nm9sRkluYzRQVXEyNW1wdFRhTkpIamJ4dFFYajVEemJLdm1VNWRyMVRBRnBC?=
 =?utf-8?B?Y20xYWpPUVpJSjMrWURvc2JsaXZ0eE9LMFk3MDVBVjM5Q1Q1THA1aHRKNmt4?=
 =?utf-8?B?Y0hxWmJLK2plWHhCZmdPc0wwMXhZeXVoWWw0Ty9ycGdOa3F0czhJdU9MR2hp?=
 =?utf-8?B?cmtQUzZGU1oxZ2VOWWxsMXJ6bjZFbUlUeXVXbmhBRzAxVGZaRllVMXNtbjAw?=
 =?utf-8?B?VUF5YXJGL0F5bDFjeEQ3RlFLdmVOSHhXY01ZMXVhK28yTGx5S2RlOXVkc2ZP?=
 =?utf-8?B?Rm9pSUc0Q2ljSkFrQTdoRERsSy9QR0lNeE1Jd1d4VHdPNXc1QnZKT3U2Y1hp?=
 =?utf-8?B?bm5MeWNvZDFhVWJXaEsvUm1ERXB0Tzg4NGE0TkVYSUI0aEU4R3lWUXYwYmRi?=
 =?utf-8?B?Yk56clBxdmowekM3UXRyeGJWQU83b1FqV1J2TXg2ZGorUDFxdmtZTWhKM1dl?=
 =?utf-8?B?aVZ4ZFkvVHNxYlNFL0ozNk11T1VNeDV3ZUEwRjdOU3dLV1AyNVMyQ0VNazNi?=
 =?utf-8?B?OXduUnEvQm40aitzSFIzVjVqc1F3akhNdDRaZ1ZLQlZzdjQyTHdHWDV6bVRZ?=
 =?utf-8?B?VWpnWDhxZXBDQzNNQk56Q0xqb3NEb0Q0MTZQOElZWkFFVDVxT2JUWjVVaTBy?=
 =?utf-8?B?VVp3ZVA2ZjBSR0M4dEpSdi92aGZ0WThsbUJXQTRxR2dBem91cVN5Z3M3L1lw?=
 =?utf-8?B?MGU0RG9oU21kenlua3RnQkVqYmtIdjBEeDNqV2JEMEk2ZXRXSVE3Q3hENVho?=
 =?utf-8?B?VERiSEExMFgxTU5yakxSWDMrV0VJcE9jc2JlZ1d1RGwwZkdHR2FNVjd3bnFz?=
 =?utf-8?B?ME9oVG5aZDJXaEwwQ1ZLT1paWUhzTC9wU1RhbDJjakpUS0g2YVhXZnpydVQ4?=
 =?utf-8?B?QUV2UkF6RHhkM09VUWVuOHJFQVl2d3d0RTZsdXJaZ0JhQVpibkYwdFVLYkdI?=
 =?utf-8?B?d0VLNUd2cGhrNzVHMVFtcmpseFVLaWlOcXpOTkFpQktkTUJQM200b2tuSXl1?=
 =?utf-8?B?T2FpQlh4WTJWaVhXUDAyRFJESlRiYmtKRzR5NmdBS1dGRFpsaytTdjVZcGlr?=
 =?utf-8?B?enJLTEkwTkNYRml6SkM1amM0cFRNcnBISStHMmtRZ1ppUmhNbGtJekt0anNZ?=
 =?utf-8?B?ODc5VVJOcXg1ejlld294UmplRWIvK0xKQlRuTFpuMllZbkVkZnhRWEpzbUU0?=
 =?utf-8?B?b2x6N3F5Ti92QTVCMHBjclQ0ZFlUMHltUmxpd0M5M0NFaTBWMXRTcHMweEo2?=
 =?utf-8?Q?vAW1f1AxiQ48bPtmP7E28KxqV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 578acbe4-ba85-41bd-7af6-08dd1b3b7c08
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 06:00:45.7790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zGzbfEPl1Mkh/zFVKP/nGWuF8n9+RYWJubxrkRnNrquYXpQcXNaaHdiCatz8GZ5ChAh4ToU4gfkh9ZgeWJtBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
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

Hi Lucas

On 12/13/2024 11:14 AM, Lucas De Marchi wrote:
> On Thu, Nov 21, 2024 at 12:09:03PM +0530, Riana Tauro wrote:
>> Engine busyness is supported only on GuC versions >= 70.32.0
>> Allow enabling/reading engine busyness only on supported
>> GuC versions. Warn once if not supported.
> 
> did i915 used a different version of the guc api?
> 
> There's no platform supporting GuC >= 70.32.0. We will need to add one
> to be able to test.
Requested for this guc version. Will merge this once CI passes with the 
required version.

Thanks
Riana
> 
> Lucas De Marchi

