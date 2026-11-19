Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8363606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 01:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btWUawzr;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Du/KCunG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C2510E668;
	Thu, 19 Nov 2026 01:23:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF8410E668
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 01:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795051410; x=1826587410;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g61IZf5c1zlGEwzpaCrD6NLBadP77cKLzM8b+23kk9o=;
 b=btWUawzrZsIh54uCT5FsU7Rsa+9SunM2QEJar5bskjld3eTSkoAwIAKh
 tolUQBnxaoWXS4kZeETb+MsIoO8aB062e/Z8obX/7dJ4PiKruWgIVk+OL
 E/PYW2ffpXNcWlqZ506Gt+Ik6FAY7D7MWfCx46IwRRRmS6t1BuiFQqBg0
 fVMb3CoUsENHaffmR2yGaP4MxelU+Qk8pp4b1gx2a0kKHgKaXskD9hv3W
 2aiWdFjwlO0l//CAXwSWxicnAAMnbSqz3NzUXtfofV3DoIIoU6IAsh+im
 szMlZWOR7JD5QBl+JW1TxZYZqy4egCP8X55zd1/BKY9VkAqFH5VvqZw0U A==;
X-CSE-ConnectionGUID: OZIC+BXtSHeGgUL9V2XdUA==
X-CSE-MsgGUID: qB7UljrXQICcbfSTL1XMSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3775030"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3775030"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 17:23:30 -0800
X-CSE-ConnectionGUID: LjuFK/+ATyC1pLhyX6tOyw==
X-CSE-MsgGUID: k03ybzK2Qoy5RP5Sf+iLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10429957"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 17:23:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 17:23:29 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 17:23:29 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 17:23:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrDLzYChLcHCHv0wq6NHwq46fWlYsP8Xc8A00UMlY3eeBzlf83sa2VBNpgR89pPsT6naPVt3WlhEhe5afAAl+5WkjQyCL/3SfRqQqxNsG/5ap2ztv+F2d1JKit8d33EfD81McDjJ/8UmJ5Dw3rvN0m5DPyiAbcnfOYsTR7u8Wj+JNzrtI1S1ReLBzkfo3i7qASaPey3qJBS71F22m1FhywWgkA6xvOpjgw1WdYge/E4lPksKA9NFY4DdzcWVKYSNb82grUrx33hxiGr+nArOPXtzxsZx7EBy++1opZglr+igRPUv0Eau5UkNXuWp74nfjXsmLuGhb40QfFrgAl3E1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emHWOXRs5imF/g01oK/yMHQDd8r9HiL0Bw8HrwDh2CI=;
 b=QGuoBevgULwS1EFyk9nFGYyO1ojauFDapZLUtDdCz9PI+K4nh2SMJIlct66NfD9gGpVIta5FkPBbmtmAuDNCWBdCDgdt6T06QO36F3r8DzZ0VN3Pdafgj8EI5iksLWp5z4aOoX1StGnmoMYSOPohiqmF7a3hGebhJeFkG8g5BGlfvBOo80YDJ7mJ5gG2GGIz4UoVnYWUBTXcN4gdBA0SVEHl7zbcz/ls/CnqdLEqB3PYu3itRQJpYyj5wN1LTNlHmUJWKtLa4dpv86TQgdCUQMSvtQCmT3Tg+LVS/PV7T8/voCdnRU/XL+up+3deSAe8Ge4LHGZ2udGSyIdKmw6QOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emHWOXRs5imF/g01oK/yMHQDd8r9HiL0Bw8HrwDh2CI=;
 b=Du/KCunGtnlo+etcmCOjhmSjdvrDJW/elcuQq2A6ZVAu957p1Hn+NbqN617fclKt3UxtLaEBa1Ri2BOhDZUBVfXSXE4NNmTRZiz0wilh1MX0+lw4IkspuiI4KT7EQ2wiFd147AoI+vQefGtZw1HiGTl+c9qOorgsmcvdWbwSVH8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SA3PR11MB8075.namprd11.prod.outlook.com (2603:10b6:806:303::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 01:23:26 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 01:23:25 +0000
Message-ID: <f6f0bf18-de0a-4953-af31-d13436121d0b@intel.com>
Date: Wed, 18 Nov 2026 17:23:24 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Restore PF config before resuming submission
 after GT reset
To: FNU VISHWANATHA <fnu.vishwanatha@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20261118233946.275114-1-fnu.vishwanatha@intel.com>
 <20261118235638.295939-1-fnu.vishwanatha@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261118235638.295939-1-fnu.vishwanatha@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SA3PR11MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: f29a0b24-da91-42c7-7d07-08df45dbb589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|261022075727099003|261021121427099003|261026121527099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: T+Rd9UHmF2eQ+P2Mqc8/EcatrhliIqjLebVgYzEReSQlj3bJegdbmptxogjoqk5VfO2KmvfjA6KaqlpBQMfgW8sWfng2j6KhKPBQ2KtucbouMlZb1+LF1p7Rk6AmsgJdibm/8Pxdw69WcBm7GkQyNMmOxe5BdZbp2pkMkJX+F9d1t9nEg5tgd1UKuLuSMLTuDSNlIzEZMG1K3d2SGEOwhfYHm+gPVwT5EiO2Ju58NQi/w0Yo5xvaQaX1LJ3r5Y00JbisV8FApfdJWx48/Rehz+iLv7DekAQlvCbONsh3vSfgJNUm157euTXcado0V/j6kfGOqSV4ZMGwklzauyq9MhXiRMludNAXJ3JVsynpvBMnMNJFab8ByUrvSYOZEoXLnx3mDKv9vt/QA1y++2m5Wdq+Dt7WgQoInqxUX1SxbqFjidSXraZIn5pDkc+QAicCxz1keSSFnIg1WWvRHYmSPjTZWViV2kW08Z8wpNKbt0ICh7LMG8JL2FZXAwcjMRnS/8TS5n+4SlxDOCAUmpQoq1nnOK0xkR2v4MOZVOJcnpAW9x+SASE8vyTR7kKtij1uWOmkTxqPr1DL9CV7w6fwBEmtNAXzv8qe+mSLRQSD5Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261021121427099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkFJczREaXJiVEdCKzEyaS9NR0czNWRWRlBmcURkc3MybHFRVHNzU2JsWG5X?=
 =?utf-8?B?THJUcTdxQ0NKOEdGKzlvOFdWbHQvT1Z5ZHBRTjNxV1NteXc3aGhOOGpnM1pO?=
 =?utf-8?B?WlJkZUZIL3Y3bHZjM2FrRnZxcnQ4OFdwNWNnUUhJSWRaWmV5RkxPZ3VKYnQ4?=
 =?utf-8?B?ZGVjZkdzbDk0L0JFMkp1Q3ZydXhmRlhFdDU1d01zOGg4QkZHSnFualFoYjRz?=
 =?utf-8?B?SHJVSHZyN2szd2d6MG42Y2J2M210alhjcmZ2Mk5TWWZ0V0t2OHc3Z3MvUUtl?=
 =?utf-8?B?SU5vbTVGN3RrRHgvcDRETG9saWpqL0FjclZGVC94aktXaUNjaFA2TlNvRHBX?=
 =?utf-8?B?bEcwc2tMcmVKM3JqbHFNWjdiZGxraTZkU3Rpak9VUFNSQkt4ejh4QnpxYmRy?=
 =?utf-8?B?TTBkUi9EUmpUR0ZUTTU1aGVtU05BQTRvL2NUU0VsaEJvTXowdy9xbkhDa0x0?=
 =?utf-8?B?SUR5eWlFRWs3RExmbmozRDNiODM5czMwZk1KV1dSRE84UC9NTUpaRHAzY29m?=
 =?utf-8?B?UHM2RXVXY3hHRWxTUHVDZ29GTktDZkdsTkJOUlBEbHVERzM5YitSOTlKYnh0?=
 =?utf-8?B?bTBxSllqV1JwKzJzbnpnSVgzbFZmL1d3cC9UQVFlVUNiMUZZN0VRdGUrQVdC?=
 =?utf-8?B?MUx1ci9aVFgrNGZkYktqbExpdkp0T2w4Qjlaa2YxaCtjd2R2TFpRZnlpM01X?=
 =?utf-8?B?Uk0zNFR3WDE5aC9XR2VGa1dPMEp1cUE2Ty9yMjRpUThsOEhmR01MaGoxL0d2?=
 =?utf-8?B?NVJVaTZXdS9Bc2RFeDgrdEVZb3dlQ2VnWEtTb0xLek9XeWx2ekVTUmhPdXBI?=
 =?utf-8?B?SU5HZzRkMlYzcWczd01LMGM2VS9OcWlBYWxndFp1T212QmhuS3lweEFRMG9o?=
 =?utf-8?B?djBvRzRHZGlaZFF4aEFNZ2dBTjljTW1LZ3NaVkJWNmN4c2sxL3o3TFFNRzAx?=
 =?utf-8?B?a0hhTmswRUxOVEdXUnJ3MWtEc0JJMUYwM01TT2ZqdDF2cnlFZ0VQQTJsOWFZ?=
 =?utf-8?B?OWM5SzBnQlZIa3h0M0VTS214cGxyREw3bWVuZ1hreFVnVW9GVmw1bG1SczVR?=
 =?utf-8?B?TXlFUi9mTmhrVzB5WG00dW5ZMjl3V2pVVDNQNWdSaUVRUmlYdnYyTFFQUTQ5?=
 =?utf-8?B?Qzc2SlNMUDBLR1dyUyttU2FDRmNCMzBBdVNXMWVtQ0l6SnZwYXhZYkdtODdP?=
 =?utf-8?B?M1hnZU4xSm5UUHpPSVpwaWZRSXJ1ZkdVVTBzanl2bndpMUlBTktJZGpyS0Ey?=
 =?utf-8?B?WmppMERSdmdQSkRmOGpYeDZPbWZCT1ZYVm1JaU9ZVUllaUtJOUhjZEVERE1P?=
 =?utf-8?B?NDNLT21BUDJPTzNBWXFmd0t6YmhKMDJ6OFByT3dUOVFSNHd4RnIwZHlyKzVY?=
 =?utf-8?B?MEx1V3h1dloxWnFpMzhMZDBFaHNtSmdYRkR4WmEwY1ZwTnQ5a0pwQXdKZTJE?=
 =?utf-8?B?QWJWcFZuQllPbmN0WWdidUlGcXMyV0JrSDRNMHZ2V0NSQlk3OFdYMlFGNklO?=
 =?utf-8?B?dVRTbWRDL1phOGZjaW9nV3hzRjZTaEZ3L2RCYnp3aWwzYzVPcDR5enpHZUth?=
 =?utf-8?B?VzJQY1p6TS9mYnl1SlhtK3lqb0FaV1dsUENIVXIzMEtOQ1hobCs0MVJlVmUw?=
 =?utf-8?B?WFY2OTAvZVpHRXpTaGsyaVhCZ2g4U1VSMjM4MytSczc2THUrQ25wcFZIYWIz?=
 =?utf-8?B?NHNqZWpqaFN5UVBSeG91TkNSaCtPU2xBSHY1TlAzOUFaYk4yMjMrRTZZRGNo?=
 =?utf-8?B?R1Aza0F6YWp2ckE4OVVPbWNna2pLK1owenhzK0VoMDhFbmlDS3loZGVuVE5U?=
 =?utf-8?B?RkRaTEQ1NERaV3JGZTMxeGNnMFk2SEoxMXpuZElUQjFBaUFaM00vbG4yWmZC?=
 =?utf-8?B?c3lCQXB5L1Z0M2prNDVJdHdzMEJNT3BhdEUxdysrSFdTeitzV0g4MW5ZcEFp?=
 =?utf-8?B?Y1hZcE1iWkViUXg4MDNHeExiQ1JqZDBWY1FJaEdEVzBKbXQ5SUN4R1RPaXE1?=
 =?utf-8?B?U3ppajBCLzVhNVR5M1lLS3lBM3EyWnEyMS9ydFZrZWJpdTNrbHhsbFptelZQ?=
 =?utf-8?B?MS84dVE5Si9WVjNmcmlIV082TVhBNkxnUnEwOUVEN3A3dERnbDNtSm1qZXdm?=
 =?utf-8?B?dmljOUlkUEFVUUtEOVJWa3dXRVFtZFFsVHVUL2pNU1dvZWtSdXVJWTh4T2hS?=
 =?utf-8?B?dm9OYTlBV2ZFZ3g4SXovc1oxK3JQQnRVdzZnZmpPcVBVVE0rOGk3TlBxL3VU?=
 =?utf-8?B?THFRL3RaODB5eTh6QmNYYm81eHJQaHczMTBSMUtVbldrY01nR3ZWbmJ2YUU5?=
 =?utf-8?B?Q1RadGtZT1NPNC95VDliZkJNc2poejg0ZkpVZmxyNU1Uc0Z3YUR4a3BlcjRU?=
 =?utf-8?Q?u8hjzWIIxzTocoyw=3D?=
X-Exchange-RoutingPolicyChecked: VcmoUzoF7DyHhnSxw2NDHA8R0XvjJPEgGk/il9v0iwKEB6DlmirsTCfaB2DopooLN/cH1zFJty/kuUlbCy5J93kWzfqbGBYrPu53nrUAy+X6ek32/Of4LaclF/47VD9ATEkpL6BCkG0Ts3vNBBoxkLlHm0aFvWC1IcgQ8KfAwJdb7rGk9osf1e9FCVK/p+p6DGb9YghwjTpinTV3OaCS9VLn/mVHEiobBf+g1Ra6PUh9fcD4izRpYkrWfvNrnOI8MqCqgjPg0sV0+zBpsv/7ysCuTQzikL5cgxtz08vbkynh5CbBIuOz4Ke3PUewZ9B/VxySRnNSO8mTxsOjKEdkQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f29a0b24-da91-42c7-7d07-08df45dbb589
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 01:23:25.7610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1WOvhK1Sn5pBzKX7IjLM7CqySyTl2IlwUkxQky1Di0APobfdbSoCRq7AnrI7iO+WLGkf+TqnX/95krwCpCAepvOCvqE6ZSocwIIWUHPh20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8075
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GuC should never silently drop submissions, so we might have a GuC 
bug here. Even if the driver is doing the wrong thing, the GuC should at 
least return an error to inform us.
I'll loop in one of the GuC devs and see if they have any feedback.

Daniele

On 11/18/2026 3:56 PM, FNU VISHWANATHA wrote:
> Adding Daniele and Tomasz to Cc for review, together with Piotr and
> Matthew. The patch moves the PF configuration restore in do_gt_restart()
> ahead of xe_uc_start() after a GT reset.
>
> Patchwork: https://patchwork.freedesktop.org/series/178984/
>
> Thanks,
> Vishwanatha

