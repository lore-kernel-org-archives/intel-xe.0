Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A01606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 05:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OtawSnQ9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD5610E2ED;
	Wed, 11 Nov 2026 05:03:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1481510E2ED
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 05:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794373433; x=1825909433;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dbvwrZl3KaISOxcaYwuvsS6fMPuVv+EJ7kpngJ1MP00=;
 b=OtawSnQ9YdrAgBDiOCdc+tXsVf9gTfk53I1hCdLFqnPVQ8avSaq6au05
 GLXRq7uOZznuDf4p4PdmhX18QkuvnwJ6vMNuj4Fxgud/I2kcURKzYXcb8
 QOWlgar5QTEE7hP6JqtAdVL9c3YihCUNLcE0d9Q0DvhXO3NqAkWsf99Tr
 3IGQl2t57udBvkNW7hlrigDEFfx+Zel87/5plq+YD0M9zNEthae2VWPk7
 APdTT/S+8YGRqB0zahAQgxeVLU1wsSXSnBQrQkcdBkdvuOw0g7cgRZ/eI
 RVG0ueCChsGIjki72taccRvvkzVDie5mbYKMAQKBD7XuJnNsK+FWTDBrV Q==;
X-CSE-ConnectionGUID: o/xuORTtQdW1xqLPVrtGKQ==
X-CSE-MsgGUID: pFKkjWmbS96EkzkJ9VvJvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3137998"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3137998"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:03:52 -0800
X-CSE-ConnectionGUID: MlOoYWTTSlWZYoBKsaS1ZA==
X-CSE-MsgGUID: 5DrKES5+R9uPSsonDRjF8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208";a="10066839"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 21:03:51 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 21:03:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 21:03:51 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 21:03:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YqyyIepPEIsRM4l4FRIM5q7QDYzBXHSQUP292mV7sb4xSbjwV5Vrj4ftFt9fG8EouLREujDrNkpNY3CwGuffm7xBTVLanGHbfxDFGrJO4n+b7huT/eGT6et3zKa5euwP6G7tflpFnn/4B9hi+jpftURr8HJ5Gvgpk7qqsGuKma1RigqCQ/GGRV2muXSSpysa+HevlWyYcAWQukEDulRLs3pzeoGEpMavb6RF6GxmaZy8qSeWLoAcGGHUfyMfEqu7qvhiE3V53KlCttrSNBxjQUUCKM3IrJ+jKUei2XsaZJ+3kxCehq5gRqVECk5EVHP5/bn90YsBGbsRSQUqbzzR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuE/5XsjzKTZwZkkJ8R1GFObQr4uEoChpCpSASzPYiM=;
 b=NnfVgNGYCQchWQiClFP3uPYnthhC74p5kkxZPzqF+QwH6OxKa1lRJB2f+ToTK2hdwjRtzMOePNuiQrHaxDf6IZhykjBzqX1PwEhp1m+lkMqyqNcMzq7ovtxFvvZUksFXQsKoUilS+ktH7SAT/be/YLcnwRVOnnkxpljn6u5LAa5D9R0N/Z+g/I09vNjN+B4z0zNQ1YW1UlgVwy/bUYNrtvdoSmp1DF6LcyG17WzYuHBJzqjs0OcLmqadZa9umx6I+H7yJvwxXy2wQyxXZYyRPeH39/LzSX5WAVts5ZAugXSOcXqDfNCNgvVpnRiy3bsvkxDGd11WfbPPGuG6QdLa3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:03:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 05:03:47 +0000
Message-ID: <034b563e-dbd6-4bcf-a8fd-696d58027d9e@intel.com>
Date: Wed, 11 Nov 2026 10:33:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/10] drm/xe/pci: Introduce PCIe Function Level Reset
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, Raag Jadav
 <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <aravind.iddamsetty@intel.com>, <tejas.upadhyay@intel.com>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukas@wunner.de>,
 <daniele.ceraolospurio@intel.com>, <badal.nilawar@intel.com>
References: <20261106073921.1512530-1-raag.jadav@intel.com>
 <20261106073921.1512530-10-raag.jadav@intel.com>
 <a4f08719-fe86-4805-ab89-aa372a76a9b8@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <a4f08719-fe86-4805-ab89-aa372a76a9b8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA0PR11MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c31d5e-871f-4a2c-6ab9-08df3fb12afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|6133799003|3023799007|56012099006|5023799004|4143699003|261009220027099003|261026140227099003|261028144727099003|261026121527099003|261022105027099003|261102123227099003|261009223327099003|261021121427099003|261022075727099003|261009221227099003|11063799006|261009223027099003|261009221727099003|261022113327099003|10067099003;
X-Microsoft-Antispam-Message-Info: H7wPX/pupX/Nxa1AeKTu0OobC5MOl8gJteahYF2gz2/f9Hac149YAMqHcyR2R+7z5xhm1sqSJuKWrIGI6Ey2NNcRQqEZX7T6Dr964tSBA1VPs3v+4Dv67KLNRK068nAYLAb5WG74DjFLIVdBSKs4lcSZF1pFl/YiAvN1yIfcCrJzRPahWK4oyKI0zClskSYoqsbMc+EkvoVBp/bYmURzk8CWav9ah75TF3HF69EIAhLA9TdpNRHTHBSax3T/t5pU/bly1sTKYerdQueqeEOFKY4otwpT5HlEltPX5GFJBAHOW8J/7Tte9ooYS6x3IeSXLr7cbSv6oPPSWLuBofiYqLx00yC4q0JAfdcH3lkeAtL918nziZRQABxP9wGA3tWnBTgiDJxgYairsTCulsK6e1ts0hiRgGOuWj+KRKulTEm/r1L6cCTUpWj4l9BhHmy0YoalGbb4m79K2U1bnaQ8PielRzuGs2rn6C3WT7gKadMo0wTu51vjh0iLYTzIwov1dTRuKxQ9R8wf5svJN+Y5xtiWxAleN4p+ndlOAsP8vjS9KBvt0nPH6N7iOBuY09vxWT9ebGamk+iFfcVrndbQYJ9BE5hYY6m1/wBxq9u7o9ScBxre3ZJNUa14bjoSK4rB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(6133799003)(3023799007)(56012099006)(5023799004)(4143699003)(261009220027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261102123227099003)(261009223327099003)(261021121427099003)(261022075727099003)(261009221227099003)(11063799006)(261009223027099003)(261009221727099003)(261022113327099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0MxS3ZvYlZwdkZCaHZFZ1VpNG5wNEpqUzQvWUtNVEFsTU9BLysxcjhzbzE2?=
 =?utf-8?B?azJFcTVLWHZkN2dMNEJmLzYxcFZpTmxNZjdCUWhocGp5U1JaK0NiYkgrUU40?=
 =?utf-8?B?RStHUHplZ1o2OWM2c05ZYklpdys4ajA1MVZGZExveEc2ZVU0SUs0ZGwwYUxF?=
 =?utf-8?B?ckpya201V3JYMzRucWZqR1piQXR3NEtqdDhnaFBCLzlWTGdGVDd2MTFNblRv?=
 =?utf-8?B?UWRCOGZBaU80NjEvUDMzMEQ4ajhwMHZRQ29RV2l3NUtsMlMwM0xzSjV1RzBl?=
 =?utf-8?B?QWMyUGYyYjY1NEw2T0xManRvaks5QjZwVklMeURhVUFmVkcyMjZ0ck52dnNq?=
 =?utf-8?B?MjZyN3hSMEExTk42eVJobGtnajBjMGxYOGdPSUdreGVRREI4ayt2OURTb25k?=
 =?utf-8?B?ZDA3OEJoenhtQmdXZmtSUCtjaFk4aTU1T1J1NFdJeE1PeDh5OTh0ZkxTZnoz?=
 =?utf-8?B?Z3YvdldVZ3NzNDkvZDBUOVZYNHc4L2JiWTJ4L0FLMGdDMThOckM1MTkwa3du?=
 =?utf-8?B?WnpQUFFUSUliVFlJN2hhMGNITHR3UWJtQmJ2VWhKS1lmMkNjYmN2S3hyQXI2?=
 =?utf-8?B?RTFzVXBnb2F2dGVtK3V3ekhWZHlKUlFQa0N6MmFHWVhjZ2d2RHhhRXo3WHd0?=
 =?utf-8?B?ZCsxd2YraG10eTdSdlBSdWc5ZExTdHZwNXlkRnE4WGxJVnJCYWZyalpEdGlK?=
 =?utf-8?B?THBYVEh1V2pQdUJicEdSMFI2UGo3bGtuVFJCS2NMRSsxenozMkI2T0RDTjZa?=
 =?utf-8?B?SWRtelh2T1FvSWFlSGt0L0wyeHFCQ3BidE41dmpTRzdlUzl3cWlxaVRVSDZj?=
 =?utf-8?B?VVRkdFRUT2dtK2E4QTZMbi9IVkFnb3VNNWlVdFIyMENjaHdxZ2lJdDNGbVJn?=
 =?utf-8?B?alVSaU1FOFMxSTNod3pjY0s1Syt3VTVndFZCOHJVekhNbk80NjBwZGN2VWtC?=
 =?utf-8?B?aWpoTkJhZjBubzdlK0VTY1J6bU1rZEhVamJ0c0t1cVQrRWI2VHJzMWx4YjVY?=
 =?utf-8?B?OVJHNzVqWktvTUY3OCtYWlRrMTFKUUJpQno3a042bllUNW9BR2ZBWk9WR3dG?=
 =?utf-8?B?cE5abUluOG94VGxCU1pacVBHb0NIWEt2M1VnMzFyK1JFNjRDSFRqNTdjM2cw?=
 =?utf-8?B?WWFvUEljWkdXajhxMWFpY1dqZERXLy9LR0F1blErTFNiakl6WUxOZ1IyL2kz?=
 =?utf-8?B?b1NtTEZ3ZGRBYTYwcTBoVVBnRGwxNUZVVE1scEZvRWdLd3ZrUkpCQXV5THVh?=
 =?utf-8?B?WkgzSDNXVERvWFQxRTFxTVpkSlM4UVNhU0hBYnB5dUwvR1NYY1BYeFBmcUZ5?=
 =?utf-8?B?d0JFYlVuVlprdnFZdkFrK2NtOU9BVGFLaUpMdXBDTDlkR2ViUmhXQWNCS1ZU?=
 =?utf-8?B?bEFIeFI0MUhqSFhGUGZIckJXRWxnSytkdENHQkovNmhpSlA4ZlFlb0plem4z?=
 =?utf-8?B?dENLenUzVTlHZHlnbzVUaFVlK0h6SzBWZnRycUl4b3JrSjcvcHZORTk1OUdk?=
 =?utf-8?B?MEdIUE14dkZ2bGlweG9Za3RiQW4rei9lVFhCd3BTdmw2RjdmRzZseTZjcHpK?=
 =?utf-8?B?NG5RNzZEOHQ2ZGtSNDF1S3drakE5djNpSGZpUkt5VmxJeHVVMjJCVkV1M2po?=
 =?utf-8?B?dGdLdUNZYjRSTjVtWmF3MUUwbVNRWHZuQTZrZzVWb1JTeE1UQUVqaVR4ZnRn?=
 =?utf-8?B?ZzRiZWxlZW5RY1FISkcrUm1aZDdPZ2l4cXJyOFlvM0ZXdEhWai9UME5pM1hV?=
 =?utf-8?B?NkVjanhKdDZ6M05tTmNqYjhiV1l6WmUxMlhYZVF1b2NiQjRUM3o1SG9vYkNn?=
 =?utf-8?B?RHI4WUMrRlllZUN5bTdLN0g3enc1bExDUEpYMFpqM0dUemU4UkJxUmI1NXZa?=
 =?utf-8?B?eFJwTHliVGl1REsvZEFWMExRcGlJMGMrTWtvbHlXdjNUam5JbzUvL2RiRm5K?=
 =?utf-8?B?QkpRL1VQdkd3YmNMN1J6QjZzTzdLd2FuQmEvQmNjcUV6U0sxUjRBa1ZkTVc4?=
 =?utf-8?B?QmRxY0w1S2w0U0xORVFPNVdHd0ZFT2NPMGkxOUVsc3hXWlJIOWlyV0NNbE9K?=
 =?utf-8?B?RWZXM3FFVlQwK2ZqeFptZEpBNnlyemptTTZYTjFaOTVwcHNDamlpZGdYSk4r?=
 =?utf-8?B?U25wVUZ4ODY1clJIaU85dlc4YTBOc1JZczlOWGxUdmJSRWpwV0Rib1RCdXVS?=
 =?utf-8?B?SlZhSHM1UzBoczFvYXFVYkkvRUJOc2ZQK1ZiQ0ZkUVRLNUZJWlFRNkpCTXFV?=
 =?utf-8?B?WGxsN0FQWTJxVHFDQzBPRHZMTENvdDNwOGpmQjZXZ09ScE1GU3RsK2h5WXQy?=
 =?utf-8?B?TW44T3VYOGZWUENzYmhtb3JIbmdFZjNRUkNaTjdJNnp1ajhOOTgxQT09?=
X-Exchange-RoutingPolicyChecked: LHbPPbQah5sZ3ikb1XkxpuGROdQmnkUijjLELnHmda8JPaBpVjlMRlf8dfZF6JkUBRBNF7iwrPBhOa7Y946GBpI6LpdVN3SdKxnp2H4IupkicSZ5TWi4uzr18YDPtTa4aTse8eQAAOgSrJ78OavW0jucSXfhbTiWS3VpAj07cMLkTOQEiiQ1yb0tAiEkPmNwOk4EHSSrmOqmK70QgkRd96jf15RsglHZYW9nFvZAsHfnYJiauJZpNh5fQbIR8urkT0WsAOzzntyEgeHlb1/Z+twEjsuia8IbROVNBk4CBRn0RQTTxXjvek8NyHBKQoMVNGf+yi3qsBYIMhp/96z2wQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c31d5e-871f-4a2c-6ab9-08df3fb12afc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:03:47.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXiJ2U48lyX9a1tct9S2yCynaqPNDY3tZQpBnB/Layk0EWOHQIZeYCD1zf7YfCdD/9s7C71LZ1ieI0tR9yo3Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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


On 06-11-2026 19:02, Laguna, Lukasz wrote:
> On 11/6/2026 08:38, Raag Jadav wrote:
>> With bare minimum pieces in place, we can finally introduce PCIe Function
>> Level Reset (FLR) support which re-initializes hardware state without the
>> need for reloading the driver from userspace. All VRAM contents are lost
>> along with hardware state and driver takes care of recreating the required
>> kernel bos as part of re-initialization, but user still needs to recreate
>> user bos and reload context after PCIe FLR.
>>
>> Signed-off-by: Raag Jadav<raag.jadav@intel.com>
>> Tested-by: Lukasz Laguna<lukasz.laguna@intel.com>
>> Acked-by: Rodrigo Vivi<rodrigo.vivi@intel.com>
>> Reviewed-by: Riana Tauro<riana.tauro@intel.com>
>> ---
>>   v2: Spell out Function Level Reset (Jani)
>>   v5: Prevent PM ref leak for wedged device (Matthew Brost)
>>   v6: Add PCIe FLR documentation (Daniele)
>>   v7: Refine PCIe FLR documentation (Daniele)
>>       Introduce xe_pci_reset_skip() helper (Lukasz)
>>   v9: Add 'Xe' prefix to document title (Rodrigo)
>> v10: Update documentation to include PCI Error Handling (Lukasz)
>>       Maintain wedge reference on FLR failure (Lukasz)
>> v11: Cleanup wedge reference logic in ->reset_prepare() (Lukasz)
>>       Use 'PCI reset' in logs (Riana)
>> v12: Refine error logging (Riana)
>> v14: Early return on survivability mode (Riana)
>> ---
>>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>>   drivers/gpu/drm/xe/xe_pci_error.c    | 139 +++++++++++++++++++++++++++
>>   2 files changed, 142 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index d99881c6e1d5..6dcaec224338 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -535,6 +535,9 @@ struct xe_device {
>>   	/** @pxp: Encapsulate Protected Xe Path support */
>>   	struct xe_pxp *pxp;
>>   
>> +	/** @flr_prepared: Prepared for function-reset */
>> +	bool flr_prepared;
>> +
>>   	/** @needs_flr_on_fini: requests function-reset on fini */
>>   	bool needs_flr_on_fini;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> index be58fc9e22dc..129cf3395f16 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -13,9 +13,55 @@
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>> +#include "xe_sriov_pf_helpers.h"
>>   #include "xe_survivability_mode.h"
>>   #include "xe_wedge.h"
>>   
>> +/**
>> + * DOC: Xe PCI Error Handling
>> + *
>> + * Xe driver registers PCI callbacks which are called by PCI core in case of
>> + * bus errors or resets.
>> + *
>> + * Currently both Function Level Reset (FLR) and bus error handling callbacks are
>> + * supported. Both wipe the VRAM and resets the state of all the hardware units.
>> + * Therefore, the contents of all exec queues and BOs in VRAM are lost, and the
>> + * hardware needs a full re-initialization. The way Xe driver handles it, is
>> + * pretty much similar to system suspend/resume flow with a few notable exceptions.
>> + *
>> + * Prepare phase:
>> + *
>> + * - Temporarily wedge the device to prevent userspace access
>> + * - Kill exec queues which signals all fences and frees in-flight jobs
>> + * - Stop the scheduler and all submissions to GuC
>> + * - The fact that FLR is needed is because hardware could be in corrupted state
>> + *   and access unreliable, so skip memory eviction due to untrustworthy VRAM
>> + *   contents
>> + * - Remove all memory mappings since VRAM contents will be lost
>> + *
>> + * Re-initialization phase:
>> + *
>> + * - Recreate kernel BOs due to skipped memory eviction in prepare phase
>> + * - Restore kernel queues which were killed in prepare phase
>> + * - Reload all uC firmwares
>> + * - Bring up all hardware units
>> + * - Unwedge the device to allow userspace access
>> + *
>> + * Since VRAM contents are lost, the user is expected to recreate user memory
>> + * and reload context.
>> + *
>> + * TODO: Reuse FLR callbacks for bus error handling.
>
> I agree we should reuse the FLR callbacks for bus error handling. I 
> think it's a natural next step.
>
> Aravind, Tejas, are you aware of this? Page offlining currently relies 
> on the driver reload after SBR, so it will need to be adjusted for the 
> in-place flow.

yes we do need processing of the errors post sbr once these are reused 
for pci error handling.

>
> Today, when we're informed about a bad page that belongs to a critical 
> (pinned kernel) BO, we can't offline it right away and we request a 
> reset. slot_reset() then re-probes, and xe_ras_init() -> 
> get_offline_queue() reserves the page before any kernel VRAM 
> allocation, so the BO lands elsewhere.
>
> With the in-place FLR flow:
> - the offline queue isn't reprocessed (xe_ras_init() is probe-only), and
> - even if it were, pinned BOs keep their placement across the reset, 
> so the page still can't be reserved.
>
> *For VFs this is an immediate problem*: there's no SBR on a VF, so the 
> recovery for a critical BO would be a VF FLR, which follows this 
> in-place flow.

For VFs do we need FLR for critical bo or is it wedging? Either ways 
this needs to be handled even for 
https://lore.kernel.org/intel-xe/20261106071944.2693854-17-riana.tauro@intel.com/.
We can take this as a separate series as this is only GT.

Thanks,
Riana

>
> It looks like we need to reprocess pending bad pages during re-init 
> and relocate the pinned kernel BOs overlapping them.
>
> Thanks,
> Lukasz
>
>> + *
>> + * Current implementation is only limited to re-initializing GT. This needs to
>> + * be extended for a lot of components listed below.
>> + *
>> + * - Proper re-initialization of GSC and PXP for integrated platforms
>> + * - SR-IOV cases which need PF and VF synchronization
>> + * - Re-initialization of all child devices registered by Xe
>> + * - MM corner cases
>> + * - Display
>> + */
>> +
>>   static void prepare_device_for_reset(struct pci_dev *pdev)
>>   {
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> @@ -147,9 +193,102 @@ static void xe_pci_error_resume(struct pci_dev *pdev)
>>   	xe_info(xe, "PCI error: resume\n");
>>   }
>>   
>> +static inline bool xe_pci_reset_skip(struct xe_device *xe)
>> +{
>> +	return !IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe_sriov_pf_num_vfs(xe) || xe->info.probe_display;
>> +}
>> +
>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	int err;
>> +
>> +	err = xe_survivability_mode_is_boot_enabled(xe);
>> +	if (err) {
>> +		xe_err(xe, "PCI reset: device in survivability mode\n");
>> +		return;
>> +	}
>> +
>> +	/* No guarantees by PCI core */
>> +	err = !pm_runtime_active(&pdev->dev);
>> +	if (err) {
>> +		xe_err(xe, "PCI reset: unexpected power state\n");
>> +		return;
>> +	}
>> +
>> +	err = xe_wedged(xe);
>> +	if (err)
>> +		xe_err(xe, "PCI reset: device in unexpected state\n");
>> +
>> +	/* Wedge the device to prevent userspace access but don't send the event yet */
>> +	xe_wedge_get(xe);
>> +	if (err)
>> +		return;
>> +
>> +	err = xe_pci_reset_skip(xe);
>> +	if (err) {
>> +		xe_err(xe, "PCI reset: not supported\n");
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * The hardware could be in corrupted state and access unreliable, but we try to
>> +	 * update data structures and cleanup any pending work to avoid side effects during
>> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
>> +	 */
>> +	err = xe_device_suspend(xe, true);
>> +	if (err) {
>> +		xe_err(xe, "PCI reset: failed to prepare\n");
>> +		return;
>> +	}
>> +
>> +	xe->flr_prepared = true;
>> +	xe_info(xe, "PCI reset: prepared\n");
>> +}
>> +
>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>> +{
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	int err;
>> +
>> +	err = xe_survivability_mode_is_boot_enabled(xe) || !pm_runtime_active(&pdev->dev);
>> +	if (err)
>> +		return;
>> +
>> +	if (!xe->flr_prepared)
>> +		goto out;
>> +
>> +	/* Unprepare early in case we fail */
>> +	xe->flr_prepared = false;
>> +
>> +	/*
>> +	 * We already have the data structures intact, so try to re-initialize the device.
>> +	 * This will be similar to system resume flow, except we'll also need to recreate
>> +	 * kernel bos and restore kernel queues.
>> +	 */
>> +	err = xe_device_resume(xe, true);
>> +	if (err) {
>> +		xe_err(xe, "PCI reset: re-initialization failed\n");
>> +		goto out;
>> +	}
>> +
>> +	/* Unwedge to allow userspace access */
>> +	xe_wedge_put(xe);
>> +	xe_info(xe, "PCI reset: done\n");
>> +
>> +	return;
>> +out:
>> +	/* Most likely the device is unusable and there's nothing we can do about it */
>> +	xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>> +	/* Drop local reference */
>> +	xe_wedge_put(xe);
>> +}
>> +
>>   const struct pci_error_handlers xe_pci_error_handlers = {
>>   	.error_detected	= xe_pci_error_detected,
>>   	.mmio_enabled	= xe_pci_error_mmio_enabled,
>>   	.slot_reset	= xe_pci_error_slot_reset,
>>   	.resume		= xe_pci_error_resume,
>> +	.reset_prepare	= xe_pci_reset_prepare,
>> +	.reset_done	= xe_pci_reset_done,
>>   };
