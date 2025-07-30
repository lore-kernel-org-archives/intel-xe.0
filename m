Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7219C87FCA
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 00:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B30710E34A;
	Wed, 30 Jul 2025 00:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVqiwAEi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0D510E34B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 00:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753835270; x=1785371270;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YFGM/mOLCWW0ysiAOIlPsTFmKpuFKs5G9hhtBwaZO5I=;
 b=kVqiwAEi9kAPrAJFNp9AFzKTTkvHFU5pADJyqu0xfLSMMYIXTCSZ2Duz
 FPhoc0yx5egEfRHoKniVg/y/crZpHVdNvHvm2fLDA3feepXyq7pLXEpK+
 2edcVDc9Sec9Rxx4BaEQYDVSvNtca+xVXfbIl8zfAGXnIz4CVFGdadZtK
 EW2AaBJQo+a3AjonZxIn1UD1NfAtoIUJt5beS7+uptBl2JGUPkFs9Tpjq
 qF7y+5WFQqzGNd/e2l3Dvfg8/xXLcooeqB47V3RBvbg4iKPMoCskB688B
 xTQy/A/CluLNaRnH6Go1zLnZhULL/Tng0udbD/2oJsraYOO9Tu7y0pHdq g==;
X-CSE-ConnectionGUID: 6wKw7NKQQl+XzylyhZhP9w==
X-CSE-MsgGUID: l5m7UbIlQjq6y8Zut8NGag==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="43727882"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="43727882"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 17:27:48 -0700
X-CSE-ConnectionGUID: rhYUxy3XTuyJhgmZoinvBQ==
X-CSE-MsgGUID: +tN62HxbSxC0RPhIv1Q3Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162562500"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 17:27:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 17:27:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 17:27:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 17:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rx94TX5lOuLNkPOj0Ay9wR94bNbVe5YM/2fzceYR1eYrWrZojsNnqCUe+FJkc2MwPr2yybflzNj4ozcaeFesaQpi/3KarhC85NXUEoEpm42ouRq7fJEuR8Z3PMqtn/I8lhvLrIDHFVHxsgf9r8iXTU//vhsZ+QSdOwHgd+opY+UTOzszLj5ybQxipMZhukZ//pojKrOIaWxNgFjIOHyFtbvDHx3Xl1ddSkSUtkDMnYD5p/lSxj/rzNxWLBIVS96CfEhUJhpmvoAGJnbbJ5CKBG4eir7UNzMbYI+Mj6HM0nv3cUNIafyaJzumrHvHeoaiHKFHa/uwJeUSPPY01mb28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00e5uurJ5JQSxJvI6JX+BlB4gWA4NSijewxhxwxSxto=;
 b=YyqIPnD0J88+LfhqbMPouiLl8w6eG44UQ0QOasb5rbtWWUavZHQRSCrLDdkSU3i57jK4rUKjA5bgOfLeqf4i1Yad3isdMs632xxL3K7d5ZxnKwP0rgfdERMlUk9Klv5T0MxExX7xXXWeQ4HlQDZJlsG3fhvTlTJIr0Q+zQleDIKOYD4sIbsPPAbj7uA7EVqcx28oJH5P+ZLcH6nQonZ0ade5OEHzrZGBCS09r+ujY7pYvDIY2mWIu0ba3VlAFmhmGAuFCWiw4tpk8kYQRL2aw6Wya5CJOanC8+v8MwGhCYa3qfzqX9lIFF8M76OpzPsaTzw7OB/7UQNJ+WnRlKsvug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by IA4PR11MB9204.namprd11.prod.outlook.com (2603:10b6:208:56d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 30 Jul
 2025 00:27:04 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 00:27:04 +0000
Message-ID: <4c3a225f-fbeb-45c9-9659-ddfb1046d0f6@intel.com>
Date: Tue, 29 Jul 2025 17:27:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/xe/guc: Add GuC log init config in LFD format
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-5-zhanjun.dong@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250722013553.1266218-5-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:303:8e::12) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|IA4PR11MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ca2b71-19cb-4672-d8c2-08ddceffcecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlUzeGh2T1libWFuRTI1VlhlVDRPYnRFRWFCeUR3Smo4bXkwcjFZNllWQzVM?=
 =?utf-8?B?MXJ6emRxN09wbC9KOWZ4aVREQS9OLzYyK1RSWFBRSnZWSWE0QnFSUk4xR3Vw?=
 =?utf-8?B?UFVOOUVnRTNzeVJaMEN6YlpWYVBIZzBsTFlweWNKZE5kZHgybmM2bkI4cFBG?=
 =?utf-8?B?RG1SN0NjTXorWTZ4N2cwWmdjWTVNblBUbFVTcy9KN01Td0xLdnFLbHFBVWdD?=
 =?utf-8?B?a2R5MVB0VDdibEtlRnFCTTM1bmVzZnJDNkljckJXSDZ5V0dBaG5qRlpON3JI?=
 =?utf-8?B?K3hEMGNNd0FWN3RtMm1sNmp6ZzgzYkxOcXRkWHBNblh3SkExWm5zbnI5N2RT?=
 =?utf-8?B?cm93RHpMd0xXQmNRbVZzdTZXalUvclNRcEw2WGs2WHp2TWhZRmVzL0N5SXBt?=
 =?utf-8?B?MVpQUTc2MWZKK1Z1TmtINUx0MzYyb0xFMlc2NE0vZ2dNWURQcWpidm8rNHp2?=
 =?utf-8?B?eXp3cFRSdGxDZW1xL3k1N3JwNHk3NVBjWnBhU2tTeGRQRzN2ZURUWXpSU3Ru?=
 =?utf-8?B?TTMwQ1J3QnZTL1ZtbWd3MjczNVNSUVNYNWMrNjVaN0FJTENvYmpveksvaSt3?=
 =?utf-8?B?MWRqemx6aFluRG91Y1ZsQ1ZPd2d6Zi9qcGFPRXUxb1I4MUE1LzZ3TlA4OWQ4?=
 =?utf-8?B?YncwaVdEUzNRQ0ZsaXdvWlpZUlZaYW96QUVweHcvdWRsZSt3U2JyUWlDMHRG?=
 =?utf-8?B?VmRhbWcyYUJPZXVpeHVTaFA0dDBaaXk4WlBOOEo0S1BaQkdIWDFCMVBtSThx?=
 =?utf-8?B?TGtwRlBjLy9yUHcvRFkwY0FnQndGQWFKZWk3b3NuVXp0QUtTanEwTHpuUjFQ?=
 =?utf-8?B?OHF2UklRYmpHTEJVOGRMQU01M2k5NllwTnVCM2Zjc2IxU0RYQjJkSk5wR0pp?=
 =?utf-8?B?UXZSM3A5a2I3dVJaUjY5TlRTblBZUW1kdVBvaUtvUWxPY0tSOUxZbWJOMVhv?=
 =?utf-8?B?V2t4a0lWdTJ4MXVFb1Z6Szl4SzljaHF5YXF2NUN2a28xSDVsYXpCMkZqNzZW?=
 =?utf-8?B?eHJGVHlaKzExaXpQTDZRcDEvNDN0cXcvNEpoUzA4QWtzTHE4UGtvV245dDJV?=
 =?utf-8?B?NC9nckQzOGlyWWtaTHpuK3FOOXgrM1dGZjVQbHhybERGd1hnWGdZdDFaWk5T?=
 =?utf-8?B?NHh6bzd6d1RDMm42dVNtNTlHS3FqWk5zT3NNL1o3eXlyanpMMnJ3RmRCRjA3?=
 =?utf-8?B?L0s4dGl3R2ZhaElMeVdKWFQvMEVQUmJkV0l1VzI5ZGt2c0pPUU45RitxMzht?=
 =?utf-8?B?YjdLSXZ4V2NuT3o4dHc5cXRhNHA4ZzgraUVvZDVLc3lXSExGU0tqSUd4TzNz?=
 =?utf-8?B?a1Ura3k1eTlycUZYaksyUnJwVFprUzFvZnoyV0paTk5reC9GMFZ3dGZqZW45?=
 =?utf-8?B?RUFsN3RaM0ljcjgrcCtnUWNNRDg5OVdMZndTWC9pK2h6VnV2VjU3cTgwaUls?=
 =?utf-8?B?Uml4YThwQ0tGa0ROd2RSZG4rMy9UdlNFUE0zbjQxdzhjdkVRQ1doNWFCMmp4?=
 =?utf-8?B?TThHTzUrYWZsMENSaXVRbi9hRUNCQlk2RjNyMDV6WlNHczVlbkN6aWR0VkFG?=
 =?utf-8?B?QVg1Z2l2NlA0MzZnQnNzN0EwVlI1aUQvbXNsT29lMTBEdDcwbzdaZDFmQ01Y?=
 =?utf-8?B?WEkzZ3BQSHVHdk5BeUVJek15L0ZsSDBtWlZES2cvYlp4ZkRuOVFvYStpM29k?=
 =?utf-8?B?SjBhOEJjeWQ4WU1RejA1OGNlTDBsY2FIZ0tjUGtpU1IyVUxQbzE0UGo1SHA2?=
 =?utf-8?B?SHd4bEMzWFpCenpkaHZvVHVnZktqYVFPUGk2TGFLZDBxTTU5cGN0SXNNN0dj?=
 =?utf-8?B?MUZTNWloc05xaTd2RU1tNXBVTGZuUldWbTdicjVQaFUzQTY1UjkvU3pydXJN?=
 =?utf-8?B?Q3NtQU00cUZ4bkg2ZnFrdThCU2ZWUmF3aVlaUWR4b0tad091QkhIVjNrb2ti?=
 =?utf-8?Q?pXfbUjgoLQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWlLL210MEZFbXRoNDBSaGZ1QVplZUtIL2w3aVp4bjJVd1hnd2dieXFYY2Ur?=
 =?utf-8?B?ZmgycWJhMC9hc1FydEdBNFEwMjY5ZGg0TjZyVmk4SnVpaElNMWlnSkkyekQ4?=
 =?utf-8?B?Z3AvZ1UzZW1nR05TYmJXUUt3RU0zeWZKZnFLTzYyRyt0L1hnV0svTUViUlJI?=
 =?utf-8?B?ZmdWc0pEa2pKQkdzZVphaWlaQ1AyamJLTGt4M0U3SFhTRGpreFEvcmpZSnN3?=
 =?utf-8?B?VUx0aFk2ZnF6dHpCRWdoWk5Xamt3Qk9HVnBLSitYNUNMcmtLTGpPNXgxSGxY?=
 =?utf-8?B?dzBuODlwV01rMjRaaDUvdVM1SjVFTitOMk1zdFFQbFc1bUZCWkZXaVNHeExW?=
 =?utf-8?B?UXZ4MXgxTFdObHBVTUNnRU1KUGNaY01HZTVlWlFuckdjZldIR3hQQ2l1MWg3?=
 =?utf-8?B?Ky9PVTgwdWRXZ3UwVktrYi9UUTBBNSsrL1Awc2NpZFNER3BQOFY1VXVTNXQ0?=
 =?utf-8?B?WmJJTTdpMXd0Y2lRbVJNakRNT2I2Mmc1dXhUMmlCNlBQWlp2RFJTRWtpNmQx?=
 =?utf-8?B?RDNXOXR5TmE0WkI4UmxzdkUvZFNyWUlLMEVwT3hxTUs3Q3RBaUNkU1F5cTJH?=
 =?utf-8?B?S2dZeC9WTVprY1dXaXZlYW1hWlY3blNVQ2h2L2ZLY1F2clRjMnRsVXMzOUQ4?=
 =?utf-8?B?OTd4QUVYZDFMMy9MUDdSdlowNElOUjNOSFNnTlJvRzhPRXJXUFRiNDdqSWNz?=
 =?utf-8?B?OW51QlJTdFQzdjN5aGtOekJBVTJCbzBYVURSTElldnBHNld0MFVDUkRRNlhX?=
 =?utf-8?B?SjNtNGFnVllCMTBjTFZxWEc5VWFQUTJlbzJqc3hoNzJhZml1cmlXWjdJc3JV?=
 =?utf-8?B?cjA4YWhCTkRyZ1BuVGdOZzBibGc2QitEOTd4Q0JXR2xmdTNnK3hEZXVIN25V?=
 =?utf-8?B?TkU5N0x3RUF4MElKVnAxWGdkRWxDQ2I2SjI0TnpzaCt5Z2c5MWZ2TjkxSWcw?=
 =?utf-8?B?WGRvUHRpWDI4L044cEJPYU5CY3FyRmNWUFlmN2d2M0pqTDFRVUlWV0s3US9B?=
 =?utf-8?B?NDd2NHMxR3RuUHBSNnI5R3Nqa0tzMXNFY2JjU0R6VE9RajMzaEw4dkY3MmRu?=
 =?utf-8?B?TjljeDkrb1V5NytkOTFKT2VMelBHL2FQaG1PMmR0NXh3UWZadVFMZVY3MXVx?=
 =?utf-8?B?RkJ4MGp1Zzk0YjhWZ3FPVGNUN2RDclovU1BGQndxZVEyTEpnMndYQU9VWjZI?=
 =?utf-8?B?Zk9iMWxBOFg5VHdreXhBSUI5cm1kMFlrcnFHVGN5emR2M0hwLzh6YjdHTVdI?=
 =?utf-8?B?NUU5dGwyVXBhWjgrUjh3T3Q0SFRSVjVWOHVZTE95b0hTbElDbFJ5QU1Hb09k?=
 =?utf-8?B?THBFcDFVTXBDWEVEdjV4WFRzUm44VWpjRlBzVm41ZDBnOGIrM1ZxbU1WSzll?=
 =?utf-8?B?MU92aVFhSkgxcVVsZTIyVklxaExLOHJYWlNWVExuajN1YThtWjlyRGZpLy9B?=
 =?utf-8?B?SUpBQ0hjdjJIVXRETUgveU80VTZrQVR0Zk0yM0RwT0tvN3lNcGQwTndwRzIx?=
 =?utf-8?B?dHJsTU9tdmpPOWVubHNjNmtWc0Uxd3doV3plYVowcnFOaEVrZ09tbGFXY0sy?=
 =?utf-8?B?dEtBZjdQOHN2VVNMbUdLb2pTaW14bXJxT1F6YlZoSmlDQXpOdWtvMnNleGUv?=
 =?utf-8?B?MjMrYXI1Z3Y5UGk2ZUlSeS84ektEaUFneEpQcjN1QUZuRFZJeVdtelNwUWRn?=
 =?utf-8?B?bzNkY0NYbW5ncEJFYkh1Sk5mRGNadmJ3UDNnb0pIVHg3SmE3MnUvVkViL3dB?=
 =?utf-8?B?QkdySW9XRWkyQ2RDcWl2aVJQRlk2UmpENDQ1VDZCWnIxZkc4QUsrMlZvU1VY?=
 =?utf-8?B?V1NoYnhJOHMvMFVuMlBOT0dhaHF3OFp3Nk5SQVVvT3IzZGY2aW9GY3BQbDlE?=
 =?utf-8?B?V3VlS0ZKYjlTODladWNXZkh1d0svTFhKbTNmdFhyUDJTancyNDRrQURwRXE1?=
 =?utf-8?B?STJvUXh2Skx6cUFmZTNDMzZFd3o0VjV0ZVlYVlBmRi9xNFZ2TGhZUFVyZVhn?=
 =?utf-8?B?UTFwU0FNZzl4LzNOTFY5TE16clZ4elhFcDNKa0YwUmJNa2huNStSVjNCVjI2?=
 =?utf-8?B?bDRJd3M1dGozRU9NQXBSSHNwOUpmY2lFUFhBdUlkaWx6T0IrS1RVd3grbHNy?=
 =?utf-8?B?bndENDZ6aXY2K05oUHdaQ2hpZ09vc0ZFdGhnWERuVmVnRHZ0YTlTaDQrQ2xj?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ca2b71-19cb-4672-d8c2-08ddceffcecc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 00:27:04.0872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHvDr64PhHy8altuUVsBF468c5w4Jbn5ul9QvAouZG4uz6MM2VDIdI7PbQfM39jnl0l6CX7d6sIo/AeHrbdUpPqa8f9gNnivfYFoy9pHe7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9204
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

On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
> Add support to output GuC log init config (LIC) in LFD format.
>
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_log.c | 204 ++++++++++++++++++++++++++++++++
>   1 file changed, 204 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index d2256773aaf3..609a9fd5ba0c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/fault-inject.h>
>   
> +#include <linux/utsname.h>
>   #include <drm/drm_managed.h>
>   
>   #include "abi/guc_lfd_abi.h"
> @@ -20,12 +21,67 @@
>   #include "xe_mmio.h"
>   #include "xe_module.h"
>   
> +/* LFD supported LIC type range */
> +#define GUC_LOG_LIC_TYPE_FIRST	(GUC_LIC_TYPE_GUC_SW_VERSION)
> +#define GUC_LOG_LIC_TYPE_LAST	(GUC_LIC_TYPE_BUILD_PLATFORM_ID)
> +
> +#define GUC_LOG_BUFFER_STATE_HEADER_LENGTH		4096
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG		0
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CRASH		1
> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_CAPTURE	2
These are already defined in guc_log_abi.h.

> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT		3
And the LIC is not/does not have a guc_log_buffer_state header.

> +#define GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT		4
> +
> +#define GUC_LFD_BUFFER_SIZE	SZ_1K
> +
> +struct guc_log_buffer_entry_list {
> +	u32 offset;
> +	u32 rd_ptr;
> +	u32 wr_ptr;
> +	u32 buf_size;
> +};
> +
> +struct guc_lic_save {
> +	u32 version;
> +	/*
> +	 * Array of init config KLVs.
> +	 * Range from GUC_LOG_LIC_TYPE_FIRST to GUC_LOG_LIC_TYPE_LAST
> +	 */
> +	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST + 1];
> +	struct guc_log_buffer_entry_list entry[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
> +};
> +
> +static const struct guc_lfd_data default_guc_lfd_data = {
> +	.dw0 = FIELD_PREP_CONST(GUC_LFD_DATA_MAGIC, GUC_LFD_DATA_HEADER_MAGIC)
> +};
> +
>   static const struct guc_lfd_file_header default_guc_lfd_file_header = {
>   	.magic = GUC_LFD_DRIVER_KEY_STREAMING,
>   	.version.dw0 = FIELD_PREP_CONST(GUC_LFD_VERSION_MINOR, GUC_LFD_FORMAT_VERSION_MINOR) |
>   		       FIELD_PREP_CONST(GUC_LFD_VERSION_MAJOR, GUC_LFD_FORMAT_VERSION_MAJOR)
>   };
>   
> +static struct guc_log_buffer_entry_markers {
> +	u32 key[2];
> +} const entry_markers[4] = {
> +	{{
> +		GUC_LFD_LOG_BUFFER_MARKER_1V2,
> +		GUC_LFD_LOG_BUFFER_MARKER_2
> +	}},
> +	{{
> +		GUC_LFD_LOG_BUFFER_MARKER_1V2,
> +		GUC_LFD_CRASH_DUMP_BUFFER_MARKER_2
> +	}},
> +	{{
> +		GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
> +		GUC_LFD_STATE_CAPTURE_BUFFER_MARKER_2
> +	}},
> +	{{
> +		GUC_LIC_MAGIC,
> +		((GUC_LIC_FORMAT_VERSION_MAJOR << 16) | GUC_LIC_FORMAT_VERSION_MINOR)
> +	}}
> +};
> +
>   static struct xe_guc *
>   log_to_guc(struct xe_guc_log *log)
>   {
> @@ -223,15 +279,163 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>   	}
>   }
>   
> +static int xe_guc_log_add_lfd_header(void *buf, int buf_size)
> +{
> +	int len = sizeof(default_guc_lfd_data);
> +
> +	memcpy(buf, &default_guc_lfd_data, len);
> +	return len;
> +}
For the sake of adding one dword in one place in the code, this seems 
massively over-engineered.

I would just do "buf[0] = FIELD_PREP(MAGIC)".

> +
> +static int xe_guc_log_add_payload(void *buf, int buf_size, u32 data_len, void *data)
> +{
> +	struct guc_lfd_data *lfd = buf;
> +
> +	/* make length DW aligned */
> +	lfd->dw_size = DIV_ROUND_UP(data_len, sizeof(u32));
> +	memcpy(lfd->data, data, data_len);
> +	return lfd->dw_size * sizeof(u32);
> +}
Again, why split this out into a separate function? For such a small 
amount of code that called only once, it is simpler/clearer to just do 
it inline.

> +
> +static int xe_guc_log_add_typed_payload(void *buf, int buf_size, u32 type,
> +					u32 data_len, void *data)
> +{
> +	struct guc_lfd_data *lfd = buf;
> +	int index;
> +
> +	index = xe_guc_log_add_lfd_header(buf, buf_size);
> +	lfd->dw0 |= FIELD_PREP(GUC_LFD_DATA_DESC_TYPE, type);
> +	index += xe_guc_log_add_payload(buf, buf_size, data_len, data);
I'm not seeing any checks that the pre-allocated size is sufficient.

> +
> +	return index;
> +}
> +
> +static inline int lic_type_to_KLV_index(u32 lic_type)
> +{
> +	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type > GUC_LOG_LIC_TYPE_LAST);
> +
> +	return lic_type - GUC_LOG_LIC_TYPE_FIRST;
> +}
> +
> +static int xe_guc_log_add_klv(void *buf, int size, u32 lic_type,
> +			      struct guc_lic_save *config)
> +{
> +	int klv_index = lic_type_to_KLV_index(lic_type);
> +
> +	return xe_guc_log_add_typed_payload(buf, size, lic_type, sizeof(u32),
> +					    &config->KLV[klv_index]);
> +}
> +
> +static int xe_guc_log_add_os_id(void *buf, int buf_size, u32 id)
> +{
> +	struct guc_lfd_data *lfd = buf;
> +	struct guc_lfd_data_os_info *os_id;
> +	char *version;
> +	int info_len;
> +
> +	os_id = (void *)lfd->data;
> +	os_id->os_id = id;
> +
> +	version = init_utsname()->release;
> +	info_len = strnlen(version, buf_size) + 1;
> +
> +	if (buf_size < sizeof(struct guc_lfd_data) + info_len)
> +		return -ENOMEM;
> +
> +	strscpy(os_id->build_version, version, info_len);
> +	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
> +					    info_len + sizeof(*os_id), os_id);
> +}
> +
> +static void xe_guc_log_loop_log_init(struct guc_lic *init,
> +				     struct guc_lic_save *config)
> +{
> +	struct guc_klv_generic_dw_t *p = (void *)init->data;
> +	int i;
> +
> +	for (i = 0; i < init->dw_size;) {
> +		int klv_len = FIELD_GET(GUC_KLV_0_LEN, p->kl) + 1;
> +		int key = FIELD_GET(GUC_KLV_0_KEY, p->kl);
> +
> +		if (key < GUC_LOG_LIC_TYPE_FIRST || key > GUC_LOG_LIC_TYPE_LAST)
> +			break;
Error message?

> +		config->KLV[lic_type_to_KLV_index(key)] = p->value;
> +		i += klv_len;
> +		p = (void *)((u32 *)p + klv_len);
> +	}
> +}
> +
> +static void xe_guc_log_load_lic(void *guc_log, struct guc_lic_save *config)
> +{
> +	u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
> +	struct guc_log_buffer_state *p = guc_log;
> +	int i = 0;
> +
> +	config->version = p->version;
> +	while (p) {
> +		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
> +			if (p->marker[0] == entry_markers[i].key[0] &&
> +			    p->marker[1] == entry_markers[i].key[1]) {
> +				config->entry[i].offset = offset;
> +				config->entry[i].rd_ptr = p->read_ptr;
> +				config->entry[i].wr_ptr = p->write_ptr;
> +				config->entry[i].buf_size = p->size;
> +
> +				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
> +					offset += p->size;
> +					p++;
> +				} else {
> +					/* Load log init config */
> +					xe_guc_log_loop_log_init((void *)p, config);
> +
> +					/* Init config is the last */
> +					return;
> +				}
> +			}
> +		}
> +		if (i >= GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
> +			break;
> +	}
This does not seem like the correct way to decode this data. Not all 
these items are the same structure. While the crash dump section does 
technically have a standard log buffer state header, it does not 
actually use it. And of the register capture buffer is not interesting 
at all to LFD dumping, which is the only other section to have a valid 
header.

I would flip this around and have a helper function which finds the 
structure in the buffer that starts with the given magic header and 
simply returns a pointer to it (or the offset from base). Then the 
processing code for each section (which would be very different 
implementations and be called at different times) can retrieve the bit 
it is interested in and use it and not worry about having to have a 
generic function that processes all sections at once.

> +}
> +
> +static int
> +xe_guc_log_output_lfd_init(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
> +			   struct guc_lic_save *config)
> +{
> +	int type, len;
> +	size_t size = 0;
> +	char buf[GUC_LFD_BUFFER_SIZE] = {0};
This will add 1KB of zeros as a global static object. You should never 
give large arrays an empty initialisation like that. I recall someone 
once doing that with a 16MB array and it took us ages to work out why 
the driver was so huge in debug builds!  Also, this is putting a 1KB 
array on the stack. Kernel stack space is limited and you should never 
put large objects on the stack unless absolutely necessary. Just use 
kzalloc() for this.

> +
> +	/* FW required types */
> +	for (type = GUC_LOG_LIC_TYPE_FIRST; type <= GUC_LOG_LIC_TYPE_LAST; type++)
> +		size += xe_guc_log_add_klv(&buf[size], GUC_LFD_BUFFER_SIZE - size, type, config);
I really don't like this idea of effectively cloning the LIC blocks into 
LFD blocks. There is no requirement for any cross-compatibility of 
structures, enums, etc. Also, the LIC information is potentially useful 
data for the driver to include in other places, e.g. devcoredump output.

My preference would be to decode the LIC blocks as part of the GuC 
initialisation and save the info in the xe_guc structure. Then the 
devcoredump code can print it out and the LFD code can create LFD blocks 
from it. But no longer with any assumptions or connections to LIC 
formatting.

Also, no buffer overflow checking?

> +
> +	/* KMD required type(s) */
> +	len = xe_guc_log_add_os_id(&buf[size], GUC_LFD_BUFFER_SIZE - size,
&buf[size] -> buf + size

> +				   GUC_LFD_OS_TYPE_OSID_LIN);
> +	if (len < 0)
> +		return len;
Aborting on error means that if the given LFD block didn't fit then you 
get no output at all. Would it not be better to print a warning message 
and just skip adding that block?

> +	size += len;
> +
> +	xe_print_blob_ascii85(p, NULL, 0, buf, 0, size);
Why use ASCII85 encoding? The LFD stream is supposed to just be raw 
binary data, isn't it?

Hmm. For small logs, it might be useful to output in ASCII, but then do 
we need some kind of file format on top of the LFD format? E.g. the 
"[LOG].data" tag below is part of the devcoredump format and has nothing 
to do with LFDs. Do we need any kind of extra formatting? The LFD 
already contains all the meta data we currently need and can support 
adding arbitrary meta data anyway. So there is no need for extra data 
around the side of the main payload such as we have in the current 
debugfs log dump file.

However, the main purpose of a streaming output file is for capturing 
very large logs. And those are going to need to be compressed to move 
them around. In which case, there is no point in doing ASCII encoding 
because it is going to become a non-ASCII zip file anyway.

John.

> +	return size;
> +}
> +
>   static void
>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
>   {
> +	struct guc_lic_save config;
> +
>   	if (!snapshot || !snapshot->size)
>   		return;
>   
>   	/* Output LFD file header */
>   	xe_print_blob_ascii85(p, "[LOG].data", 0, &default_guc_lfd_file_header, 0,
>   			      offsetof(struct guc_lfd_file_header, lfd_stream));
> +
> +	/* Output LFD stream */
> +	xe_guc_log_load_lic(snapshot->copy[0], &config);
> +	xe_guc_log_output_lfd_init(p, snapshot, &config);
>   }
>   
>   /**

