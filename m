Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCFED59D8E
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 20:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8993B10E967;
	Fri, 12 Dec 2025 20:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcbkIcOm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D041810E95E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765570649; x=1797106649;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bPLdCVD/VljVde3JSr+uSq2gS4d7FxmkTanX3LP2+50=;
 b=UcbkIcOmHahm72n6yLgYrJV0/7s71G5wlOFHhT/rFDxAP5rUiHvklOIF
 zqiY1z1YRv/JmnpWRgbRBPnXSo/CT55H2FK9lJpJnjoFv8efbVyiOaj95
 fpuGWhwZGw2IqMCm05A/WSOvlcmGMy+WgEEl/Jc8XOCDVHl7BwBQPTkYH
 pKfnWi8KpCRXJIri8OZTqaXf0PkJVpFSr7H8jFVOKCb72d+12c8Jvrt1r
 QhuW/JmFHNjauXOskfiX2KRQPyBu3nQih4qT2rysu23MsNfjUH34hxFvL
 vEuiCuKL9nUbBTiwzmWbNnDzUwtDnxsKyw29srIYheK4UpQsu94XpZHvF Q==;
X-CSE-ConnectionGUID: R5WeJpdLSAO/XbxN+R9Hbg==
X-CSE-MsgGUID: e3D84L73THe1kmMlNbEDqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67521829"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67521829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 12:17:29 -0800
X-CSE-ConnectionGUID: cWYwjMsKQSWeL0+xLpXuJg==
X-CSE-MsgGUID: qgs79s3mSGSoE1W9sef32A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201660475"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 12:17:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 12:17:28 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 12:17:28 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 12:17:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmnJve5swHfN69B3mmsAJ7GdRzz7K78CDw25hzPjrOeQs7Dv0Uds/FtNE3oXb/43g0+KFd8RAdeya+PoKKrCz1Yihb/zeUvL+inVMmn7egwtP6GBUtNkcqzLNSnBUMHlXj0Ox9mnVcCcIag83CCXgKnFj9fHSx1NXE6UOv5X2pN4uyrEcoohaWqRolz94yrhMHh3JSs+mU1mZ8Vnl4AGxShdFw9EPySab7g/syOT1m+As/w+9ABarj0/b7HDWgByxyFCwac+FP9nGOFyorBTMnxffcVavERp+22UX3HpbMJoupFnkj02gT4sD5UPt23D8RqpKvc+3uKxjs+hiCeenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZhJN4Iw4yC78wSyVIYXQbz9gEU6uPDwmtf3HUJrWLQ=;
 b=yYbE9yKihRyB/xwrfL7ogE0ZqcpQIh5KtaZV3ZfuKg9aBYzg+XjMS6KHrIt9AN6PUuQDNEMpUU4mpZUYUa5PVzEPBOtHX4fx32hgBMxYuZFbmutPh3BNxgePl7jSyEoUWNmRXE0SGZ/VObJkOk3CDMUyqmM7JsJ9lcKhXtKV6SxIsRJKD2yZax4/9gT2XXTZLwuqxBFk7ubapH5XqjJWTv+codbYPwHncajtfR3F6KjUJshwO29pA6LylUprEua/yGB9wqSXD3IhVbn9PZ9XzgEqS8zH0UTTO1vw0JyWb9Ez7Hb7ZXIdUxVKkl8rbQYoHJatc20r5HS+HVeYKOi0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 12 Dec
 2025 20:17:25 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 20:17:24 +0000
Message-ID: <84f13b72-7210-47ca-a6ce-78329195ded7@intel.com>
Date: Fri, 12 Dec 2025 12:17:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Add handling for MLRC adverse event
 threshold
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251212173449.192639-1-michal.wajdeczko@intel.com>
 <20251212173449.192639-4-michal.wajdeczko@intel.com>
 <d419d646-ffe3-486e-aec6-54f2b8c24a55@intel.com>
Content-Language: en-US
In-Reply-To: <d419d646-ffe3-486e-aec6-54f2b8c24a55@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a23aa58-81f4-4efe-d65a-08de39bb76b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXFWdFgyS1VPMVd5ckl5bFVMVkdoSFNFb0hoU1RkSS9KbG13Nm9NRDBmLzR5?=
 =?utf-8?B?aUdOc1IvdHFmcU5GNmQ5cjNWcmE0eXc5YU9NdWs2Z2ZJYmpmOUJWc0lJTDdR?=
 =?utf-8?B?Vm5aUXExS0xiSlR1WStOaXlhd2NiQXBvZXJLVHFtbndrcXZpdFFUNER6R0s0?=
 =?utf-8?B?RjlwSXdReWNqTmIvL3dCbzJNL3R0QWdid3VrM1hUS3BITjF1bnIydFJFNlp1?=
 =?utf-8?B?ZmlSV1UwdWJpQ0xsbFQxTkRaOVZwLy9aaU56QzZXZy9ESm1Cc1ZRUVVlU2hq?=
 =?utf-8?B?eGNHeGRmL1dROEVRU3lDL05iT0pFWVFoaXdpYWE3TE1RMWNKWEpXN3U2T2dL?=
 =?utf-8?B?c214dlIvZ0JXdzRoNU5HZ2NpNWo2NzR1UnhJSzdnOXg3amJtOTNMZUdzY0lJ?=
 =?utf-8?B?TmhMSmVYcWtmQ21TeXNaTlhsZUJHTnpoR1AyQU1TaWdLelN3aDdNOWlRMVJG?=
 =?utf-8?B?NmtGR05LY0RwTEhJNXVFdVZ2Tk9qYUlPN0tzOUdMMXRxL1hRNnYza3dTM211?=
 =?utf-8?B?YWkwUld4aE0yRXZGTzFWNSs1azI2SnN1aU1lZGFYakxJTXo1YTF0bGR6NXZ5?=
 =?utf-8?B?U000VWhpdEdiVEt2VkNDUlBha0t6anhmZ0x1ODkwRC93ZmhwY1krbE5VMDZh?=
 =?utf-8?B?STNpSXhKUzF6elR5K1EvakpBb0tGdjdIZG9ldEduQ0wxZS91ZzBpcWFoM2NJ?=
 =?utf-8?B?U3Q5S1ZIbEZmbWkrVW51QUNLZ210b0wyWVZhM1ZVU1IxS0hES0JEbi9kUnhR?=
 =?utf-8?B?RWJMWXNBU0RwUGxsNXdPZWprNTlxb05GSGRMVHFhbDVmYmlkZkdRQzdOeVlJ?=
 =?utf-8?B?NUlWNUhqZjVOWnhhVzZrUklabHFtdWc1Z0R6YkJUd3BMTTlDMEM1S09VQitn?=
 =?utf-8?B?SGJLdFR5WDFoYXR6QXZQZFd6VGx2UHlTSWh3d0lJbDdUdUY3TDRtaUdTaHpH?=
 =?utf-8?B?Y1hiZVQvMXdBWVFJWER6d1dYNThIS0Fja2pTY1llaFUyRWFCSDYwVUM1bWlR?=
 =?utf-8?B?K0VCZDhhRmVrbnhVWmtGc1dma3k2Y29LVURlM3g5UVZTcEJTN1p1aHVqQVF4?=
 =?utf-8?B?eVBZNHZSaDZ5T0YxV1NuYjhhTnloRzRFRGRjRmhFQTBSNVBSRWZLYVBac0tj?=
 =?utf-8?B?czdiZitQR0hLOElUemtyMExML3J1U0RUVDlGTWFnWllOTFYrbXo5ekJvbm5t?=
 =?utf-8?B?M1F4ZDArQW9Gb0Q1NlB4VDlIRkdhZW5LQlpRR0FsVGxKRGw5Ni85WlNJOVdh?=
 =?utf-8?B?RVBRbWJ2VVhDcnNsTXZ3OHpqdkJHVlVvNUoxbDREdnJBNjhqUEQ3UkgwZzM4?=
 =?utf-8?B?WXgraTBpWjMxRThIZjZnL2NBbFp5dkhJazJ4RVVwaVJHVEMxMXhRWmptZ0hV?=
 =?utf-8?B?b3JESGpiYVEzM3VtdE5mTzdYSnZkYVI4emJ0dlliL2c1eFBZZi9Qb3dMeXlY?=
 =?utf-8?B?WHpoeURWY2dFZFhUdC93VmFJRzZScmY1Ny8veDlLcll4bTlZUWtGTU9zVnpB?=
 =?utf-8?B?Z0k5TUhqUnFDbmwxOURDMFh6TVM2N2RUbGVBOEYwdVV1amRVaVlvL3ZjOFA5?=
 =?utf-8?B?bExxSjEvcStmdXpMSXBUNkFTNVJNb0V2ZitoZ3pHcVUyeHNyaU05TDltSW0x?=
 =?utf-8?B?MC93U1JLa3crRE9kWUdDRVl6SEwzeU1DS3kraWE0czI5b0EwNm1QVWllMXJq?=
 =?utf-8?B?bFYwTldlUHhaV0xXWE1UWjdUNU95ZUhkeVJYTGorSkxtVWFaTWtXVTRqT0Zq?=
 =?utf-8?B?OG9MZ2xqUjUzTWsyMFNWbG5ESzlwVmxGWEVjbDl2TlZLdDFvMTJhWVg0VFBv?=
 =?utf-8?B?UkZ1d2djZHlxUTBDQjVXR29tWnBGeDlZVWtmQU5RNlYyczFoTi92c0FWSWhy?=
 =?utf-8?B?cElrNXhseVBVQU91NU54REJMK0x1VkdDY0dSRFNhZU9sblE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0F4T3huVzk5LzY3ODVOUFRtQ1JXOTlkdW1EL01XTS9kbTdlUlZWcmtsN0FQ?=
 =?utf-8?B?aXZXdDRWblJaZDc3UjY0bW5IK3B2MU4wSlBFK0pjVG0wUmNROFRwNUh3emta?=
 =?utf-8?B?NE5VajJLMjAxQytDRU0vaDYxMkNqWHlLazNOQ0pqS2VxMkRMcTVnaGh5aU44?=
 =?utf-8?B?TDFZTGE5SXNCUlZRa1BJa3Y1VExLSThPUU0weUdIbHhna1BIZENPRFd5TWxW?=
 =?utf-8?B?MVJIeURjSTU4UGswVjNic3h3cUxJaEFHaVhJR0p5ak9ZRGdxWnNvajJDV0dY?=
 =?utf-8?B?dFpucUtGNnlId3JDRndDMm5DdkRtaTVVam1TWXFnQWUvS3VQR3lWU0NGcDR4?=
 =?utf-8?B?SjNUNXQ5VDl4ZXdNZ1JMY1ZqbHBHbEpjbCtsWVJJK2RBOVNlSFU2WWJDQU9V?=
 =?utf-8?B?MjUwMjg3MDloSkczZjllK2ZueVpmVmlmOExUbUdCR3pEbFNzYkVYVHgxUmM1?=
 =?utf-8?B?NnU2WmRRRXNpUXF2VFltQ1JCcW8wRXQ1bTNVd0tGdWp3MWw0WkMvdlJDSG1Q?=
 =?utf-8?B?M3UyS0o2TXo1R1pzSngzKzl4MThtMnJ5Zko3ZlI1ZTNWSXF1a3liOS9sc2Z4?=
 =?utf-8?B?K3grTkM0cjlCNTR1T2hObk1Pc1RIbkxtZmdiMThKbVp6OTdUaUI2V0d6SDNa?=
 =?utf-8?B?VGR6WUVYNFMyN3lXTGxwYXZtaWc3eXJWdUZOUE1GSUQ4SkxjM005TDFPMWhx?=
 =?utf-8?B?a1N0WW9jNGhXRVZEQWoxV1dsWnAxeHR4d0hTajc0WFpMY01CWllzSFpYQzJH?=
 =?utf-8?B?Y3htZk5sdEpVbmx3cXpsYTVHRjhSRkZvQUxtUGVGRGE4bzBEdElaY3ozZCtE?=
 =?utf-8?B?MCtIK1loSHBaOWRKTURuank4MG1iYk5VQ2ZDSzQ1dXF0bW94YkRsT01COEE0?=
 =?utf-8?B?eUZhY1Q1MldJdFZkUmtIQzZyayt2cTRKV2xpeHJxNVRkeXlRSlRPZE01WjFQ?=
 =?utf-8?B?aWxoVUFtaUcwODBPbTJvb1M1RmdibHRWM0ZNWkVFa3JxMHlSRmZvNWdhVmpY?=
 =?utf-8?B?eWFGdFJUSW9zeHI3bUhER2w3N3lKSXR2STZTR2FrMloweW5XdEthU2ZacEwr?=
 =?utf-8?B?Tm9tNm90bGZaWHc1dCtONjA5dEkydVFEUGtsVWIyTUYyMEFyRWdhMWR1ZXdF?=
 =?utf-8?B?dE5YcHFsbjV0dTJEUDZtem1CblI2aUVYd0dXbkEwNVQyTmVsbUVMeDNXakVy?=
 =?utf-8?B?VmhNMTRIWWhpeDEvSWV4OE5FWEhHd2FMRWhlUEZQc3hwWGhqTEhXTmw2MGhP?=
 =?utf-8?B?SzBPcjM2TGwvZGhORGYzT3Nkdi9rczNSV3BycDIxZkNMY21VUXBZak9UQ0lr?=
 =?utf-8?B?Ujl1Z3NnbUkxOFcybm00MlNSVjIwSjJwWkZkS2N1cW0wODJWZ2xvWEdJMG9n?=
 =?utf-8?B?UnB2SnFMblhDTmdPcHlWbkw5eGJid1NPbzhkZGJaYk1GMUlYNitpSi9HS3RE?=
 =?utf-8?B?NkV2RzhENXU1WVc5V3ZCdWtPdnBoZWJhbndERW9iWkRwUUxHdXFtWWFKNjJ6?=
 =?utf-8?B?TFdDaXdGN3JVc1llR0lVOTVxNGsyaktZWVFEUmdIbTdialNVblNMWG5LVThO?=
 =?utf-8?B?akIwclYybXorQWcxRUlvWEdqVW5nQUdyeHZycGJab0hOODdrQjdwVmRtN3hK?=
 =?utf-8?B?WnkyMUl2WmplZ3NTdDVtbjhnMmxpODBtOTZ6QzdkV3pPcTRmYXNIWk5id1Qv?=
 =?utf-8?B?aUpmemZsY1lrdW8zVFdpcTE1eDl3MHRqMkNkSmNHMUhhWFRDV1hqQkszTVF5?=
 =?utf-8?B?aFU1QlJKV3diRUJITCtMbkVSd29pUFB5c3U3T1pNVmlsNTZxaE05RGJqKzlF?=
 =?utf-8?B?NlJhblRTMU1VUy9US1g0ZUg1aUk2R0ZCZ1RZUlRBT2t4VXJ4Vmx0eXRjUVhL?=
 =?utf-8?B?OUVmK3VvZ3dHNlpJYUZZQmhsVTFKbWVrbE8waHFLY0ViM0N6K3k2c2hKZUUx?=
 =?utf-8?B?VjNjSnUyWGZxY2hCMlZlN1lLV0VwSEVma3huZUQxQkRDODl5MDE2c2FMNWVJ?=
 =?utf-8?B?NzkzTkFLdTJOeTZPVzNPdXJLelNuN3NsWHVhbTFIZ2tINVBoaTB3ZHlvTzUy?=
 =?utf-8?B?UkdNNTVuOHdLV2xRZWgzNGwveHBqSXk1T1cwblg1cDVTZlFud2xCZ3d0WmRw?=
 =?utf-8?B?RmJQd2hFR2V6bjZZaDhTUUZHS2RMSW1TaTdKUEtXc1dXazNyUjcyaHR6Vjl1?=
 =?utf-8?Q?lDayfZEpfo/fSOAc5sVMgns=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a23aa58-81f4-4efe-d65a-08de39bb76b5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:17:24.7987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEEAp11zADerGwglE1/xInj9KCqWdfKXsWaStYjzcrUAGBvdWEr4bgTfPS9B1sKiIXQaRSRFGq1w6L7KKw2TMgTJdEWcG/J6cL+NTzDyIII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5765
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



On 12/12/2025 12:15 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 12/12/2025 9:34 AM, Michal Wajdeczko wrote:
>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Since it is illegal to register a MLRC context when scheduler groups are
>> enabled, the GuC consider the VF doing so as an adverse event. Like for
>> other adverse event, there is a threshold for how many times the event
>> can happen before the GuC throws an error, which we need to add support
>> for.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> LGTM. Not sure if my r-b counts as the original author, but here it is 
> anyway:
>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

BTW, this patch is different enough from previous revs that you should 
probably take authorship of it.

Daniele

>
> Daniele
>
>> ---
>> v2: split from previous patch, add GuC version checking
>> v3: don't move version code to its own file, call MAKE_GUC_VER from the
>> caller instead.
>> v4: cherry-picked from [1] and rebased (Michal)
>>
>> [1] https://patchwork.freedesktop.org/series/158142/#rev3
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h                | 9 +++++++++
>>   drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h | 1 +
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 265a135e7061..89a4f8c504e6 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -352,6 +352,12 @@ enum  {
>>    *      :1: NORMAL = schedule VF always, irrespective of whether it 
>> has work or not
>>    *      :2: HIGH = schedule VF in the next time-slice after current 
>> active
>>    *          time-slice completes if it has active work
>> + *
>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>> + *      Given that multi-LRC contexts are incompatible with SRIOV 
>> scheduler
>> + *      groups and cause the latter to be turned off when registered 
>> with the
>> + *      GuC, this config allows the PF to set a threshold for 
>> multi-LRC context
>> + *      registrations by VFs to monitor their behavior.
>>    */
>>     #define GUC_KLV_VF_CFG_GGTT_START_KEY        0x0001
>> @@ -410,6 +416,9 @@ enum  {
>>   #define   GUC_SCHED_PRIORITY_NORMAL        1u
>>   #define   GUC_SCHED_PRIORITY_HIGH        2u
>>   +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY 0x8a0d
>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN    1u
>> +
>>   /*
>>    * Workaround keys:
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h 
>> b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> index 5f84da3d10d3..45ab5a3b5218 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> @@ -37,6 +37,7 @@
>>       define(H2G_STORM, guc_time_us)            \
>>       define(IRQ_STORM, irq_time_us)            \
>>       define(DOORBELL_STORM, doorbell_time_us)    \
>> +    define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)\
>>       /* end */
>>     /**
>

