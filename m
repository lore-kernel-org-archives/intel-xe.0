Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D888FCAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 21:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2A210E3D1;
	Mon, 29 Sep 2025 21:49:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/8P7z/+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB48110E3D1
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 21:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759182591; x=1790718591;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PHF+8I5hqbTZi4meVu0K4U58WwRHSWnES9vpw3nCKMQ=;
 b=d/8P7z/+BKpu/BBKptBl5XLCUyVNywyMb3zs67rw0RcuwZAU4dyG70yU
 P7CagX/XsbptVgMsFjNuj3hy+UJL3b7Jr8ekIeYPbJzWa0yoJIB3qnjD4
 5KU9WOa6AoI+PQubsxs0erU6CTjWi3eJYryQ8ALp1swFjO7XjN0B6tMQu
 m0mAeEH25QgSEQU/BGoO7KODaVTYJuv3EFx9gtpwee+y1EJeXgcdO0ZIe
 AJCemv6U/YmDRwpTdt29EhAzHazB/IjbteIhZseGdOeKr5+3KcB0wLwGy
 ZrUQPOF/qlbO170j4htI6WR1ZSLhfQt1uiNrCe9WKWUwjU10Zgg+QS0rR Q==;
X-CSE-ConnectionGUID: c0udQ39dQAyw8lRBee+0KA==
X-CSE-MsgGUID: ji2io7KDRl2ZNnu8crPjtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61144009"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61144009"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:49:48 -0700
X-CSE-ConnectionGUID: B1XPr7HpRs2nPsQs3m3qpQ==
X-CSE-MsgGUID: b/KXA085QEm/n9YYx9QmOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="183523762"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:49:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:49:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:49:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:49:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhnn68O6t4jZaQpKnzx2+OL/7bmK1pFNrZWzJUAWF3ZaIQ5FodPXPEYhBaQGcTH5JoQrCGg+G0Y9uyEzsKXqDf1NVHKUHjlrFdQZH8CpEcacrB6VukdvYE2YkqEmyC9BsBpjR3BnajkpqteHM3xb4PBD0/T6o9SizaL56arq2l1xlotlcFNen096+Y1txt7PnAO35ut7/BqvyG+bn+QWaBk7M+gndqQKG9w30R2KisFPib9CfeM+q8mh5W/e8vOlt1UdAo++YV2Pc17MsKNTbqyaYkrbR6lhL1tMDQB3xRVKr6gEIjdPGUeNerPwQ19lwj9Ho+pWG1xGQCc9U9wnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGZP3L4VHssFYyvSMUsir7FYMN++LA3XKsiK5RY20rA=;
 b=Y7KZm7ktNOBUEJoesaa64hFiOcp3HegEvwQ5dzSP5fsevOS3tzcYDmC8f86YnUGNfRctYdV4yIB3x2mF7X3sCRtUQG2NhGQIalV/iSXpXyKNXKofoo2LMcMnpTx2cOMDZkPGpbmH82j0A5XBVEf/BswhjVrhS9mBVWxuw0wSREbcYbFUh8vD1hx2DgURLaYwiOd7k7igFcZG2wQZ4g4eHeJ+klwznSXhdKijOJp9IBymg4dmQgCu6L7dFHbvXjNnj8VV4T3+Fyh7Eh3+sZjx50wB96z73QfTxRgmMv1CKkm7pdipoAueStfKChRmXEoprV6NfrVhbqhy23/nVmxAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 21:49:44 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:49:44 +0000
Message-ID: <bc6ca30e-99a9-4371-9560-658ba2306b56@intel.com>
Date: Mon, 29 Sep 2025 23:49:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/36] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-27-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-27-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4945:EE_
X-MS-Office365-Filtering-Correlation-Id: ca623b4a-512a-4133-d66c-08ddffa21a31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cldiS1pad3NqV2ZBRFByUDJxTDFDaDJLa2U4a2FzMlBuWGxGZm5Rd2tqNW9N?=
 =?utf-8?B?R1l2TGRRRHNadVY0ZnVFZGsvZHhxZkludmtlN01RczZlbW1jTDlUWFBKZTRa?=
 =?utf-8?B?eXFYRk1Db0dieEtKeDdoQ2FOdm9LWUhwTkpDSm5ZYzQwS3Rac3kyMkdsV2Ew?=
 =?utf-8?B?WU1MRlJLWTZHTHRWRDJTZHBCbXhJOU1ZZ081R0ZXaUZPWDQrWDBSZjlSUmZY?=
 =?utf-8?B?L3pUV0NiQWxIQmJkbFVRRFpUNWg0ZUdBWXRlWGgzcHNpUEZJSGhNdUtlak10?=
 =?utf-8?B?R0ZFQkVhRXR6TktTeW5POXJnalVKVjhaSDJMNWlCM3BYYzRKWXFsMmlYVmUr?=
 =?utf-8?B?VmNrUzA5WlgxR1pVQTZvMW9nTU5heHNnV0NKQjQ2V3dWVzRQM0pNR1FsaXhw?=
 =?utf-8?B?ZlhtVkZSTzkxSlN2KzNDSFJsVTRjN0xGYTRURWRsWGZpdHZNcXBFQk9TMm16?=
 =?utf-8?B?RmMxTEFGUWJiRDVxOTMrZWhyOGdSTDBsa1JDdDVSNDlxUGdGSXU5YUNkNUZx?=
 =?utf-8?B?L3pxc2Zta09zY2FWMEZvbVdwTHY3a1VSdmVHTVJtaDZhaGZhQXRmTXhFM1kz?=
 =?utf-8?B?MFMvbnRGUW5UeEZhTG5NYTU0Z2d6N2d4UFJHNHp4cGZnOHB1MnJLT2JhUnI2?=
 =?utf-8?B?TnMxWTJEQmRXVXdpbWI5YW9uMUZoS1FWc0ZHSkJUODd6YUVZREZJdEJVZjZ5?=
 =?utf-8?B?ZXpqTGRtN2ozcFIzWmlnTHVCYTJjeUdHc1dZKzB5VWZVQktpYzhYbHdZRXRa?=
 =?utf-8?B?QVZWZStNRVRqcDdzSUZiM0Q1dW0xVjlBbzgrYkxpVnh5YUgrckZ1cWRKSWdD?=
 =?utf-8?B?dW1FTkd3cDlwYVhqdnQ4d084N05WMnowRndTS3ZBaUsybXdwR25BSlpCN0lj?=
 =?utf-8?B?Um5OcW1qNUNqdTViWC93bHh3blZqSkgyNEcySmdTOVJvNWhKNHIvNEZzVm1F?=
 =?utf-8?B?b0YwWlludGN5VG1nTGN0Y05RQzR0eUh4NHdlZW1aN29BL1VYRG54ZUZwM29v?=
 =?utf-8?B?eElMdjdaVFJCQ2FGeDdjOUtDbVNwVkdiYWNMZG5CTGJieVQzSlR0a054NXdz?=
 =?utf-8?B?QzFyaE5WNUhXQ2hONCtWaWVXMTRES2lUWGEzRk40Q3psNkNYQzZZeWtLbmQ4?=
 =?utf-8?B?VVZnUmYrREtxRGUyT2JKYnI4NkZVWEdoWkFHcjZTUkRkSm82MkxjbmtQOUtj?=
 =?utf-8?B?SndQVlBjeUNVd0NJbVd6b3BCNUQ3T1F6dnhFRnlBZ2JvNi9CREJ5d0w3YmNH?=
 =?utf-8?B?MGt0WkxzWk5CdFRhc1dFek96MHNFRVYwRSszKzcrN3VBeTQxaDJoVXp0MXN6?=
 =?utf-8?B?ekw1dWliRkxhejNwckMyekxIYmo3S3R0SStJMzlyeEpzbElTdTBxdGw5Tm9q?=
 =?utf-8?B?dTRUNWdDSnJXSnlWSFJzVUtRU1hXR05uNDdwQTllaU9tVGlFRC95cHZQZUZu?=
 =?utf-8?B?dG4zTzZlbUtIcnV3U2gyc25TOG5mcTFGaXdHemJDcDJqNEFKamdmdStpQVY2?=
 =?utf-8?B?c2hZMG5QTGZEWFdUaFZsWG1LZnpjODJvU0N2VUMxblpCaXRKQUZGeGNuQUhO?=
 =?utf-8?B?bWFwZVM4Ui80L3FzNDkvbGJGZG8vSGtyUUkwOWNLb3VGVUpHNlFWOUk4MFpa?=
 =?utf-8?B?MVlZdXdHa2NGMlo4MGZWR1g1anVXdTYwamROa3VXOGRiZWYvKzU1bEJFSHo0?=
 =?utf-8?B?KzJmQ3dpNXZjRHZpNEhBb3FRelhXckdCeFYzT2tRbXhqSE5LVldJeCs1NXQ5?=
 =?utf-8?B?bXhBNVJ5VkJ4UGlON21qYmlUajJabkM3NzREbytmUEhKdDYvZkovandNODkw?=
 =?utf-8?B?WlhLMXNYT2NFTnh2Q201YitWazY1bXQ0YVgwWGpmNW9SdW9HSEpNZHVoait1?=
 =?utf-8?B?WlB6UU1Lb2ZNTHhUdkw5dVl0Rm1SSVg4ZnI0RXpVUTZzUy9lbkd2QS82bzFh?=
 =?utf-8?Q?YHEjvHCIT8Ehq5UotctAhAzOtl4R5KDW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2dMelpJNXNNQ1liOU0yUk5ibXNxVk94eGQrNXdXc1JZQkJ0K3lIWEtIaWRR?=
 =?utf-8?B?NFNzRmRrR3ArMmhNaXdWcE9ETS9odnRyRmlBbEVVbFExUTVqQzZ4bzlON2NC?=
 =?utf-8?B?akc0WXhlbGJ0MVdvYlQ5Q3JKQ3J2WCtTZFpINEdZZUVIWGEyTW44N0JZWitR?=
 =?utf-8?B?TVRpa1AwbkNmenVpTFRPTjkrclVUNVJ0d0R1UFlDeGdVVTl1MDdGNGtLcGpI?=
 =?utf-8?B?MkV6ODF2R1VUSVNCTUYvWlRDZThHaHc0V2duWHF2WDRXVXJFM0lTbmRNai9Q?=
 =?utf-8?B?ZGxqSTlGT1A0Vzl5OFhyeXJGcmgwQlY1RW9YanRib3ArVzZSQTh0Vkx2SXNM?=
 =?utf-8?B?Wjc4YWlVandCMlNGSW9xRk8yZGZFcUtZaUlScDh1SnpERW53cUVGODNDYnFz?=
 =?utf-8?B?dDl2bnJIeDRPclN2cm0rengrM2o2UkFCbXN4SXNUc2g2WWJ3OWVpR3U5SFVp?=
 =?utf-8?B?ZklaS1pNK2NOZk43eE43R0hXZlRQMS9VUnpCU0lPb3dyQlZzSXNZRWtFZmRT?=
 =?utf-8?B?UnBuWWxiZkV6cHBLZkJieWpCdnNjL0gxUFAxZWVUcGtpb1V5RFU3TDhTRkk2?=
 =?utf-8?B?dGFoVnQ3WUdHYzAvV3NTOXcxU0RyKzRVdFZVcDVnWGVLdlZReGtNWkRrSC9W?=
 =?utf-8?B?L2EyVm1oWWhkK2xGdkpFRkRYclN3U0FFQnloaHV2OVV0MGxsbERtYis5L0Ft?=
 =?utf-8?B?bUhpQk5QYVU2eCtpeVdrc2dyVUdnaXEwbEFMYlBlZmZLd0pDMnRuSWpDMEpB?=
 =?utf-8?B?VU4vNnIxTEpoeklsTmd3VGZxTUEvd2xkTkNCbFJ0YkJFUlZ0VzM5SnNNNEV6?=
 =?utf-8?B?eXMyNWhicW53NkkvYkREZGhQQlZiK2ozakM3NnphMGh3QjdPeXRCYzRFSHFJ?=
 =?utf-8?B?UUxUVGRCelBLOHZJTEorTkxTQjN4SHNzM2JudWw4RFA2Sk43dUU1WGw3SzhC?=
 =?utf-8?B?ajEwY1hQL3VRcjBMaldmc1pFYXc2ODRjTkNsZWhQZVl3VEdnR1BWWW9YUXA4?=
 =?utf-8?B?dUtPMFMxdHZBcXh3ZVJ6Q01BWlo2V043dW1FR0t2WWluYWJaTFI3YTVRZ3ov?=
 =?utf-8?B?TVM1aW5ZVWRHTytJbXhKWFBrSzM5RUxqc2cyYWZ6NWVzRVJyRml2WXB6QnVU?=
 =?utf-8?B?WmxhZWdsUU16VWdsQmNpT3JrYUhYTXNKbEdSRVlRb3k1azhTanNrY25BT1Ri?=
 =?utf-8?B?aGFuVVNPU3Z3bWJJZzY3Ym16V1B5MWlQNWhJR3pPUUpTZENMN0pxVVBsTUdF?=
 =?utf-8?B?Z25lTGRCNnRiOWxYaEx2UmV0SmtmTEpGSmQ0VjcvV0w4cmN4dk5KWWxoakVv?=
 =?utf-8?B?SVlMRnlvVGt4NFBoNGtUcjdzcjc5bFBlZHF1dENsNXY3ZkFVc201aEh3bUtJ?=
 =?utf-8?B?N3htZlJGSVBSQk9LRjVyWHRvcDVnNjYrSldyYzh5SlZzZHovSFJ0QUVlcitI?=
 =?utf-8?B?RG5FdHJvZHhhUEkrR1h0ZnlCcEpnRk1ma0VMc2tXTjYrQUFWVTVWdE5OTEVH?=
 =?utf-8?B?L0JLMk14NWhIVGprWlBZQ3V4MllKWWlrcG5kVWpOekVlc0dTbVhuQWduOGM1?=
 =?utf-8?B?d0dVTXJOTENaaGJ1dEkxbmNIZHV2YTlRSUJoelRxS2xPT0c0RFpib2wvZmdJ?=
 =?utf-8?B?T3dwOXlRMlduOXVYYXdtcVc1amsrTFhxYjhaSDRRaWVXSUJ3RnJaRVJsNEhJ?=
 =?utf-8?B?c0xOY0NSd2pldFNhMWpkWUNUaHF0WGltTm5WeHZyZjZCMGloWnY1Y0tLWmZz?=
 =?utf-8?B?ZG5ZSTdqd3VHZjNNNWtGcEdtQzk0d1dxaHhzV2dHaDFDNFVZTXVWcEVNdW9q?=
 =?utf-8?B?WGl3VS9OQVBJMlZHbkRRcUNJc0xpbFNxVWpIeVl1WlRtbkVGMTRGRng4YXZy?=
 =?utf-8?B?cE9HcEFDRW1iUnRmZnVjd0JPbmtvRmhYQ2pXakVPNlM0MzYwMTZMYjJSQmRF?=
 =?utf-8?B?aVlqMTVHVFpwVXpYT2sxMmdKZ2hWZUZzUHZ2empyZGRzOCtmckEzcitJY21a?=
 =?utf-8?B?amhDRmNmY1pkWktYVCsxdVV6eDhZbzR5LzlteTVkUDhXZlhUOGhnOUdvVnFu?=
 =?utf-8?B?SitjZHlDMkFlWHFEZTZ6ZERzY2dOSDBQQnl4VHg4RWY3cHlqdDNhMHpvaGFK?=
 =?utf-8?B?M2lKTHg0WFpBOFNUWEdrR2IzM3VmbnVWTTlPdkVJY1lOZlBDdmFaalZkbmVR?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca623b4a-512a-4133-d66c-08ddffa21a31
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:49:44.7876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbRoE4sFifixnEqmMHKLI8sdyJwWg3MrptzqqZa+GUTwNdgyzEhp36VZ0EVYL7SODBtRWo2tqEgjqCelTi0HP/ukevxw1ql8ab7a+0WXlfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
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
> Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as
> they may contain stale or invalid data.
> 
> Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> resubmitted by the GuC submission state machine.
> 
> v3:
>  - Don't mess with head / tail values (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 ++++
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 59 ++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>  3 files changed, 54 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 35de8977c6d0..cb3e9f6e83fa 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1214,6 +1214,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void vf_post_migration_rearm(struct xe_gt *gt)
> +{
> +	xe_guc_ct_restart(&gt->uc.guc.ct);
> +}
> +
>  static void vf_post_migration_kickstart(struct xe_gt *gt)
>  {
>  	xe_guc_submit_unpause(&gt->uc.guc);
> @@ -1265,6 +1270,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_rearm(gt);
> +
>  	err = vf_post_migration_notify_resfix_done(gt);
>  	if (err && err != -EAGAIN)
>  		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index fd6e731c0395..25efc1f813ce 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -500,7 +500,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>  }
>  
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -508,21 +508,28 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  
>  	xe_gt_assert(gt, !xe_guc_ct_enabled(ct));
>  
> -	xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> -	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> -	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
> +	if (needs_register) {
> +		xe_map_memset(xe, &ct->bo->vmap, 0, 0, xe_bo_size(ct->bo));
> +		guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
> +		guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
>  
> -	err = guc_ct_ctb_h2g_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_h2g_register(ct);
> +		if (err)
> +			goto err_out;
>  
> -	err = guc_ct_ctb_g2h_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_g2h_register(ct);
> +		if (err)
> +			goto err_out;
>  
> -	err = guc_ct_control_toggle(ct, true);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_control_toggle(ct, true);
> +		if (err)
> +			goto err_out;
> +	} else {
> +		ct->ctbs.h2g.info.broken = false;
> +		ct->ctbs.g2h.info.broken = false;

if CTB was broken before migration, shouldn't we leave it as such?

IMO it should be cleared only by a normal reset, that involves CT re-registration,
not just by our recovery, as GuC may continue to ignore broken CTB

> +		xe_map_memset(xe, &ct->bo->vmap, CTB_DESC_SIZE * 2, 0,
> +			      CTB_H2G_BUFFER_SIZE);

now it's better, but maybe we should introduce

#define CTB_H2G_BUFFER_OFFSET (CTB_DESC_SIZE * 2)

> +	}
>  
>  	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
>  
> @@ -554,6 +561,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> +/**
> + * xe_guc_ct_restart() - Restart GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, false);
> +}
> +
> +/**
> + * xe_guc_ct_enable() - Enable GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, true);
> +}
> +
>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>  {
>  	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 0a88f4e447fa..b1cba250c51c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +int xe_guc_ct_restart(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);

