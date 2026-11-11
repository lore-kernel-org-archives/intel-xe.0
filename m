Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86334606A33C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AMGb5X/7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4810810F98F;
	Wed, 11 Nov 2026 08:52:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A695D10F98F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794387135; x=1825923135;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/JUR/Noukq0N0X4wTGk91o5aVluQmbJQfUcTEnKtGxY=;
 b=AMGb5X/7fG0yo6C/PKwa7tIdV3HOEL+iqyfzFIscsCZ7Mj89gnn48SKh
 POucO+w0zY5h0BDj9zAGBJmDzpzDYz/HyCnfHPO+C41a79zZWmIn2EdtW
 XE0j4cBVugJYRTAOU3F3rWkxEBPArHHVNSH2DjQnt3l9bl9DUGYSVafBd
 A2wxmHQoZcopVI2u+hiFolseugyd1SI3N6SbpdRtxBF2Fb7dWk1Nv/E0s
 JUDqupWoPnEhBQAIXg1XOGxMwRt/Bu0k+Upc/uXjpVMGxzvsf2y3UnH79
 gM2J8HYsw9dlTLkS2jDp2y8kfExlxoiwB7yG71f6PdSLeAx6VpsGaMMDi w==;
X-CSE-ConnectionGUID: YSJDyUvyQLeFBgZRNAoR4A==
X-CSE-MsgGUID: PFUnAVRzQSawBcmeg+tO3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3056171"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3056171"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 00:52:13 -0800
X-CSE-ConnectionGUID: tfOTJRV+SfeBTT43qkl8qw==
X-CSE-MsgGUID: ivvMaz+fTxKwFljmowuDBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208";a="10244135"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 00:52:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 00:52:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 00:52:12 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 00:52:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHUUAZl32pGhj7qSrL1zt820mQulhbVk4liR3ug2W8HAg2G5pNG8DJx58ZwQ4LjHiI8i78ynxji87o7YQO6vq2i4fWVlKGDToKs9f7C97jQXNjiUs4KLZQ2BXeXRz/6DvNxK5nNN5/hBAQZHZgzLtFPMtxyGxCraVWkqMYu0+StpLTyorRwD1qolk7TuYq7PldZOInGppNL7yIr3t9ZqGSou94xTM+4QwVRUwEpBYmtdQMEg4VIHCc2soN5nVnvrG2VY/PBa/QOlP3BXEFrSH2S6ocjwdW1CgE3WK4L021tzVoJRXrLK2TY7F8jX36xDFRHa59vFJ/XU9LNYYLO0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiZ9hgCqIujFCUazQPUhpuES+tgut6K3aVNbePQyPFE=;
 b=Osl+GLCSsku0CHxxwL2ubTyS5BH/x4HBwTOlEuKIJ7IlME4OFA9u7RXUhM7Ypt9Yx/lAtBNZntT0tFCG1zEhqPb7JPoU/QhiwBsmZQv7VuwbAAaxIZzAYgF3+b6KwOd7xgdpYSxgE0QDwmSJIRAtx8ktlMWkTGWAJEVM2hc6vvbJM1jQHbmkgdYSXrb4m4j/sO9egPXyLQuuzA6mQI/PPghVlEiTs4/jgkE3goE9RdVXcseqG8ZKbOi219CcwCx0ZrkHcPBnf2ayc+dmnI52e0F+2GX9uasnVnUYN7Pym1l3ZGoBmVRoqAvc6JhVuEg4j+t+IrSOKwz+ibwWDqb0LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by SJ2PR11MB7671.namprd11.prod.outlook.com (2603:10b6:a03:4c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 08:52:10 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 08:52:10 +0000
Message-ID: <500b36c3-5f0b-42a8-b674-705089bf5215@intel.com>
Date: Wed, 11 Nov 2026 14:21:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/xe/cper: Add software CPER emission entry point
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-9-mallesh.koujalagi@intel.com>
 <f58d57bc-05c2-42fc-94af-dbd5ea260323@intel.com>
 <d7c8f01c-2e27-4e1a-93a2-35dfdbe0c5b2@intel.com>
 <6a332e0b-c447-4841-9f73-ff4f22a5694a@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <6a332e0b-c447-4841-9f73-ff4f22a5694a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0242.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::16) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|SJ2PR11MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1d7a73-10db-4b46-9053-08df3fd11224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|261026140227099003|261022075727099003|261026121527099003|261028144727099003|261009223027099003|261021123027099003|261021121427099003|261022105027099003|10067099003|261022113327099003|261102123227099003|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: G1+Gg8jfnmd5v/L+9U1sH4npMe2yQ0L4oLE1TmRdR7NOQAidoXtI0Lt0AdaQoB+fKQ8+gPewXW5U5NLO5z4iwY66MbfD6/YTovd3Yt8VO9zeDfWplhPgyKpMgFZ9nXK999/Brs7GgyrNxYIP+pVdBIVarKP+GbcVjghzm3Gfvgq/0Y5NNHvdrcdW0BrnuSlQ/IIHNfguSSxgtcrCylKe5I1ICYW1U1x1RV1Z+2LGKICVa6KuYtz4qeY37J1J+qu1xIR0SbN/aQNzbuCxtuo0pnBUodtLEF3LLrpCi3cGfV+ZDCUSPOrEsNb9Eu9YI6+RGXC/Igf7psLVnZB5VBsESaOUlDd3C5tJp49Y/izwF+fc+yphk7iJci9FpmmUgylrouv5/P287dY4E5EyVPrYs4L9m8RIBGEZtfDmhaEhxEsnJv2m6vHPPbPTcI1V76gTt7jB2nQPmGRQ1k+snFDzoIWOQi45FSsyXwd1bHVxxO6IcnDjzKaVCCUTQrsYBj4syQRAZzkPa1e5Q399Zm9nZ4Fmqe71VFzGOnMsDat7HTdBMf8EU1J4Jo/IT2yMxDto1l400217NquhvCkrn0EjwwxERuPMq1hyAfTzKqFMXDgHw1e80Dy4phGO22jd3Wg54HVlen2lPyvKjl5hahW3Zv/Ipx2QDpclsLyUQwKwu18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261026140227099003)(261022075727099003)(261026121527099003)(261028144727099003)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(261022113327099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dC9NeWF6bmpBVjNtQjBzck9LaXA3Y1ZCVitHTnFLUzdYMURDNmVuTEFseG5q?=
 =?utf-8?B?RXhPdnFIZE80R25OLzhUQ01oYi9DRlJtSldmSGRmZUltUGZmeFRxeU1aVENT?=
 =?utf-8?B?anhtUGtzeTR1blJzTS8zbG5mZklzNmo0SHpNR2RYQTh0NmtVbitQQ2ZQMzlF?=
 =?utf-8?B?V2FHeVJZQ0NBZXRMMFR0a3ljV0tRQms0NlBHUWdLQjJPb2xPTzdqWGwwb2Ro?=
 =?utf-8?B?ZGp1aXRPcmgzNit1Q2FKVkZwelZvQjNrS3lxaTFobkNvZ2E4L1U0M0p6Z0Vm?=
 =?utf-8?B?YXgvc21Db3pCL3lyZ3VYYXpKcWlQU0YvVm0wd2VEeWEwZ1l6SU5HWG1lazI4?=
 =?utf-8?B?TjByZ0YzdE92M0VzdFVZVGU2MWFGV2J6NldBWVc0cVdud1NaTDlubUVRSklE?=
 =?utf-8?B?NzU5OG1rL3NWZWZQVUhLYkNFSWJYMGJSRWw3eTFWTjF2dm1sd1JQb1o2NXhC?=
 =?utf-8?B?K2w0b25zT0xObE15NURmNDFQMjRJQjlwVjNOR1FCSkdDT3B3c1VmbmtMc2Ey?=
 =?utf-8?B?MG9rRFNNZFE3VSswaU56Mlo3ZGkrQ21URlNzOWxucjI5bVNUeEVJWkk5dHNH?=
 =?utf-8?B?d3pPVG1tWXAvQ3MyYnFETE83RnlaQXZTekJvY2g3WTN0aG9JOUhLN0xVYmt2?=
 =?utf-8?B?Q094RjNnMnpoekpWMGpMc1NydzhMYTR6TGZXN2M5MWx3R2srblZqOUN3TmRu?=
 =?utf-8?B?QjNCVklOMHZwYWd0SVdRQnFIcU51d3VBRkN0OUsvMy9wZzZDQzh1K1JzNS9R?=
 =?utf-8?B?OEczUzdNbVlwVDNRcWlZbkl4UC8zWk1nVFhNOEkyZWhPdXFLeGlDaXFON3d3?=
 =?utf-8?B?ZnVuZVd1c1hweldmeVRTTko1eW5tN1JvZmZuYXp0dG5iZWswaXZURi93Qmgw?=
 =?utf-8?B?QWlLUmRZazJLYktsaW91bklRZFBpcEF2NGxsODV0WXUwdkdyblNkT1BSQlJZ?=
 =?utf-8?B?c0RQVXpFbk9GcERmYVc0MEdNWkc1RUE2eGdHUUZWZjdoS0xrUHFzSjFLQW5w?=
 =?utf-8?B?bDk3Wm16b0daNHoyemxzWDZ4U1JJK0Yram8ra3F4TXZkUXVuMS9UQ0hZM1N0?=
 =?utf-8?B?ZTRtSmN6UXBRbHVZOTBIWE02bHhqS0YvZ2xXeXN1Y0IwZHFVaFFTZFMvV3hV?=
 =?utf-8?B?TE1QMVNtemc4UTBGVVltbFZlMjdXQm1pRmRtSVVUNWtES1FsckROLzgvT09o?=
 =?utf-8?B?dllmbWRXYkxjVEs1SUdDNUIzdTlBMjFaOE1XTVNwM0ZKelpHT3YwNTF0bnov?=
 =?utf-8?B?a1d1ZTdzUDI2U3UvcmJpN0svb1YrTlZxNGJQci8xL1F0UFUwU0lZb2tTVTVU?=
 =?utf-8?B?YjBoTjFTc01zUENSVE5yaGJVM3hVWGUwM0c4RlEyaHVxUEZGOTJuM1V5UGts?=
 =?utf-8?B?QVl3eWRwWlBHcWNNK2tYbzFtRHNSVmF6c2FTTjNZRUI3UlRFemxzZVZSc1Jv?=
 =?utf-8?B?d2F5REJ5alFPWHJzc3BKTEFTM2ZRQmNKU0dCbmJua2o4YVV2Wnp2VVNpOVla?=
 =?utf-8?B?U1dJOStXeE94UDFtbDkwajV0VVZISGhPV1hURHZHUTNoUll0Zy90aVFpSUg4?=
 =?utf-8?B?ZWRHZkExL1hjVGpuMnB2K0JCNGJxYWtzVmp6Sk9GYlBKdlBDa3pqZ3ljeVRw?=
 =?utf-8?B?NFdUMzJkbkNGN2kzaFVLdjN2ZEFubEdrVS9COHZ3clJ1SGZGYlRYSy81a3Fy?=
 =?utf-8?B?ckRmaDlRWko2enFsWjl1cS9waytYWlVVWHhyM2orS3dvNTZ1RmpNQkgwUkth?=
 =?utf-8?B?ZkNmOGIrTzlPaUVvRHJKTitkcGV3amNVZWd2dXhET3ZoSEx2L0xod0RmdDBz?=
 =?utf-8?B?TVpad1Fsc2c1ZWtEMS9Lb09UN2d1c2FKVTdKS2d6dWQ0S2tySVY4NnZGNVpC?=
 =?utf-8?B?MXFwTHpVWTJpR2V6ZnY2MFBLSFVMUzMyanh4RmNjY05hTWZ6b0UyOVRCbmdo?=
 =?utf-8?B?MWdoM1hZYlE5T0JRdFhuZTVxQ1ZDTk1zenVqektRa0gvb2NrNzlONG1LT0Jv?=
 =?utf-8?B?NEJuQkhQR2tNWlFSRmc3dXhtYmhQNWY0TUV0S3VGdm54S3NJL1o3UzQ0ejBm?=
 =?utf-8?B?NGxkZkU5dGdoM2ZPY1drczFycnM1Y1l5TEJlcmhKQk8yaEVBVmo5ZURJck02?=
 =?utf-8?B?MzJlbW9kTW1CWGl6eElQOGc3RVlHSDNFS3drMlhPM2ZaNXdITzdaMW5BaHVB?=
 =?utf-8?B?WXVzaktWM1Y3V2VZVGN6blc4cTVuekowU0wvektCbG1PaHo5UVdLUWlaNG9n?=
 =?utf-8?B?UE1MZ2JncjF5REI5RU11eis2QzdVOHpmSjZCZ05keUUzOEdtdlB0QjFpQk9m?=
 =?utf-8?B?Q1pqQUVIMkdmSXVMUVVYTXQ5a2pac2JKdHQyanhXUmtyYjlnYjhISE93Y1Ji?=
 =?utf-8?Q?ZnByhPvO8+xEGQak=3D?=
X-Exchange-RoutingPolicyChecked: VYPUkI0pdBdR1JyVY5xqlCikn7K/z/rWFMwhmGxV8MG1dnEka5/tMB7qD1MtWOLYnMo7IHSLTVRjj40xs6rimlyo09xyZfteiPZaV4k4+aFhW2xeP/uZQU84QF3NTjgBT1x93PsvSvdseJrf3ykjqD2oC6RVILXx8+H6nY+T9238qNzgS/8jIwOvaVniSRzROkTTZun2cL63C/tWZN3OquJaV7fA5w8/tyuoX2GaDRNK5ATcMsZZlG+9fv97iB6rTolGRGP5Lwkpw4iO8gI0KBNc94Bn7fD8DhZLtAZ2UVZYbSxYk90daFB1cwvphg8t/+AbdGuFsy2zxSKXM9ueOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1d7a73-10db-4b46-9053-08df3fd11224
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 08:52:09.8930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fj9L7n6sLcVz/l564q1LRRMdPHFQAhgrbZUGT2SigBcKNvhZUAOM03eXXx7eQz5NDsr5ghvslbNUmXt81lRok8V4Zc47cjxpWKzLOZznpdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7671
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10-11-2026 08:28 pm, Nilawar, Badal wrote:
>
> On 10-11-2026 19:19, Mallesh, Koujalagi wrote:
>>
>> On 10-11-2026 06:58 pm, Nilawar, Badal wrote:
>>>
>>> On 05-11-2026 14:23, Mallesh Koujalagi wrote:
>>>> Add a software CPER emission handler for CRI SIGIDs.
>>>>
>>>> Keep hardware CPER handling unchanged and return early
>>>> when the Xe device is unavailable.
>>>>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> ---
>>>> v3:
>>>> - Handle early PCI probe where xe device is null. (Sashiko)
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_cper.c | 22 +++++++++++++++++++++-
>>>>   1 file changed, 21 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_cper.c 
>>>> b/drivers/gpu/drm/xe/xe_cper.c
>>>> index bb90030bcd2d..db3513c59834 100644
>>>> --- a/drivers/gpu/drm/xe/xe_cper.c
>>>> +++ b/drivers/gpu/drm/xe/xe_cper.c
>>>> @@ -32,6 +32,11 @@ static bool is_hw_sigid(enum xe_sigid sigid)
>>>>       return in_range(sigid, INTEL_SIGID_GPU_XE_HARDWARE_START, 
>>>> INTEL_SIGID_BATCH);
>>>>   }
>>>>   +static bool is_sw_sigid(enum xe_sigid sigid)
>>>> +{
>>>> +    return in_range(sigid, INTEL_SIGID_GPU_XE_SOFTWARE_START, 
>>>> INTEL_SIGID_BATCH);
>>>> +}
>>>> +
>>>>   /* CPER platform_id GUIDs (RFC 9562 UUIDv5) for each PCI device 
>>>> ID. */
>>>>   static const struct xe_device_guid_entry xe_device_guids[] = {
>>>>       { 0x674C, GUID_INIT(0x9046afe5, 0x9041, 0x5124,
>>>> @@ -240,6 +245,12 @@ static void cper_emit_hw_err(struct xe_device 
>>>> *xe, int cper_sev, enum xe_sigid s
>>>>       xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>>>>   }
>>>>   +static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, 
>>>> enum xe_sigid sigid,
>>>> +                 u32 component, u32 location, const void *data,
>>>> +                 struct va_format *vaf)
>>>> +{
>>>> +}
>>>> +
>>>>   /**
>>>>    * xe_cper_emit() - Emit a CPER record for a SIGID log entry
>>>>    * @xe: The &xe_device
>>>> @@ -268,12 +279,21 @@ void xe_cper_emit(struct xe_device *xe, int 
>>>> cper_sev, enum xe_sigid sigid,
>>>>             u32 component, u32 location, const void *data, size_t len,
>>>>             struct va_format *vaf)
>>>>   {
>>>> +    if (!xe)
>>>> +        return;
>>>
>>> xe is expected to be valid here. Silently returning on NULL would 
>>> hide a caller bug.
>>
>> During early probe function xe is null, only passed pdev (pcie 
>> device) to emit logs. In that
>>
>> case we need to handle it.
>
> Ok, But why do we need SIGID logging for early probe functions? Why 
> not use drm_error/info?

Early probe failure (critical one) use XE_SIGID_PROBE ("Device 
probe/bind was aborted") so that we are recorded in

the XE SIGID error reporting framework. This provides structure error 
tracking, whereas drm_err()/drm_info only print message to

the dmesg.


Thanks,

-/Mallesh

>
> Thanks,
> Badal
>
>>
>>>
>>>> +
>>>>       if (is_hw_sigid(sigid) && !IS_ERR_OR_NULL(data)) {
>>>>           cper_emit_hw_err(xe, cper_sev, sigid, data);
>>>>           return;
>>>>       }
>>>>   -    /* TODO software CPER */
>>>> +    if (xe->info.platform == XE_CRESCENTISLAND) {
>>>
>>> Introduce has_driver_cper flag here.
>>
>> Ok, will update next revision.
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>>
>>> Thanks,
>>> Badal
>>>
>>>> +        if (is_sw_sigid(sigid) &&
>>>> +            (cper_sev == CPER_SEV_RECOVERABLE ||
>>>> +             cper_sev == CPER_SEV_FATAL))
>>>> +            cper_emit_sw_err(xe, cper_sev, sigid, component, 
>>>> location, data, vaf);
>>>> +        return;
>>>> +    }
>>>>   }
>>>>     static ssize_t cper_on_query_show(struct device *dev, struct 
>>>> device_attribute *attr, char *buf)
