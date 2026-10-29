Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84980606A324
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LJnYBKis
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B2D112079;
	Thu, 29 Oct 2026 08:12:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90462112079
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793261574; x=1824797574;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BVaF8yPX83k574pspPWq7MzMUuuCY5nli75Rdf5w/W4=;
 b=LJnYBKispYcsLKhabYEKpY3+W4h22lPFz6tofrAeubGlyBMZRjWkXdZU
 Mb31bpe9ajqvcMr0Wh1asdurcs+1sZcUxU1m4HitacJnX1BWfq+GqvOxg
 QmKk/y49jNCKx23PpLzJenQEQecrMXVvGrsXKEh2Q0zrHsYW8MTX2+f+9
 ZHTVpHQ0TPxTQv+sFNsXPWUwOWHm5ccBKWQUuZ4ZS4fRJ/G3EkBqbFidB
 YL9Z3KW4Nijn7Wbbfq6rA6/h6U0t9NU+OQaPh2ZEnaBSSDUKy0yCHZ2ki
 dTbBfEDhomUqWn+Ai+O5QFm0KjrsQJhSX8HQ8NiMeG3UFMFkKkYcWt4yN g==;
X-CSE-ConnectionGUID: AwxOM2/PRkymvZI8l0wL6w==
X-CSE-MsgGUID: m1kUfAn6QMuYua1dBLANWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1991179"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1991179"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:12:53 -0700
X-CSE-ConnectionGUID: AFDh1tFDR+SjnbZ5L53TTw==
X-CSE-MsgGUID: CMGkw/hfR3a3Vd1WzIT5QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5403493"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:12:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:12:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:12:52 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:12:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmB3JSoY//IosEeJ60gQerL+V/o7BktweRQIrr+SOk+FhnNSf9tn6shLiCvxvdhzMLe09pt20m71eEfVClhLMUwOsFatRPDaIpnkHRBPl7JWClczU4thJfLCf2ecGVrhHRP9jVlybYp1gGlVHq6TAwqq6JsfcCK/yQAHNkWcsuDAIugDQ6SKrcPBfctMTZvBWPYG8SmyjmTiSGNxPvRtbMtYoF4AXkgHRk0GBVtc5YoHyTm/NstR3i1w6/U5VbNd+aku0p+lv6uvSAEYEP1rEIGxoihr24z3J51TAAaZgcyUaj0N5AxIROnJDUC8bT6aAcFZAGSLnT3ZZXLweskQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFEdPsTQsYmn0CHuaATBSX13bbOAc5FFVAsJxs8lkbI=;
 b=Ae9tmeMj9zopAB3pe5ey/3BqF2nEyqe8LZJfCWOFnZtYFlYUm65yyTH/d2DuqdBUM/bfsAfoG1iSY76nTN9MX4jYKDYgB7EKd8/lOjN/OKn3mBdPzzL4AezFFnM4zj4iUYnlUi2ini9B3yN1CzC+2DD7ASymzCYmm2scKnFwCOfUq0kb7r+df1QQdCSa94EF5z4Fx2OYHTixVImMYkyK6CM82jivR4lkqfRSCu8H0LH7nabQAwFcI5XABK1Nrs7FerpkvE6va1+DFnHwrhz771dag0nLPP1zF1HA7/6e/z/3aB9iwAPxvyeEV75IwprKRqieoQF8uI1gtjGkv8iFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA3PR11MB870554.namprd11.prod.outlook.com (2603:10b6:806:510::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 08:12:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:12:44 +0000
Message-ID: <1e63a1e9-c5f4-4beb-8b1d-1b7f282bf57c@intel.com>
Date: Thu, 29 Oct 2026 13:42:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/xe: Add wa_14028434957 to Graphics Version
 35.11
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <tejas.upadhyay@intel.com>, Varun Gupta <varun.gupta@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-14-riana.tauro@intel.com>
 <7eed64cc-70fb-4acc-8577-b92764e7f4e3@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <7eed64cc-70fb-4acc-8577-b92764e7f4e3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA3PR11MB870554:EE_
X-MS-Office365-Filtering-Correlation-Id: f80e05a6-04d7-4456-2c65-08df359468dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|260925022911599003|260925021911599003|260925021311599003|4143699003|11063799006|56012099006|261009223027099003|261026121527099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ciGwnFeQXtkVsBYdUkxdFk2UXFYKpYpaS3M06VhoPz72CaKGLJ8w1d30KfMr8GsIXS0ciymSgH1Zk9khQlLWME7sPjzhe4Nx+sLCwjdUAUe9o8DbG1KbRT6vXKnYc6AwMDJHA5Hn3PF1UfC9Tc8UntUx/sndIfZgDcQpS801bTdip99WDKaWh9ArLSbIaI66CUVpTbrLg5sQ6juQ898FYt1BFic7Ug0nUP8KrHbwbHlGLJjnoiGmJDJWUSB66EDmRbLVa8MQ8E0lz2FBIEI6x5gwj0Vs50KM4PNVrm8aEHact++orvOC3gXQolBRD28LA2MwIIWpai6jKdHD4A1dk7DbfZ3DR5Gf56VmOhy3uD/mU2cPEG80QVPUtSmjENYMe0shCkY9w2C6EK3qbkJzVnlWGgahL12C21+GtocwpcezqGWfikIvw2c2nzVSyIoenuJKEazO4BpWeJr+NxD2CTx25hNgml4DLYNAXsoskiyh2jmNM5b1R6/LKS4mbVgcvftKRBRqtxJ6HaaYzIGdy4o1GbKl3yXmWn4ji4Sv9HMvz6KyLlp5kQYDb49o4KMIn9sMcp4uzYxC10qXn/FfCoQ7Cpx5Q219xLN74pn1Gvn9+w1grr4aJ2+dY2cGvCB0D49LCKaapzJRvLhV8ilSR/LeE8lyraUNMDBJsMo8w6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(260925022911599003)(260925021911599003)(260925021311599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDNwaFNhRHU0dTZmMzZqOGVKcUh1WUNiTXg2S2FZQmJrNFdXYm9ROEhJMmFU?=
 =?utf-8?B?ZU9WcEVuOW9WZ3l1TzVYR25ZdHY3WndYT3JIZjZXZDVwL1l6MGpMcVRtSGpM?=
 =?utf-8?B?NzJNWXNNZmFyRGZjZEUvckRYVkI0cWF2Y081QkxIVFpvYlNjR3EwbGlCdEdm?=
 =?utf-8?B?Z1g0Mk1nS3c2U0dlUlhGM1hpZ3NKZTNJZEVDMUV2c09TaUh5QlVSM3dGcld3?=
 =?utf-8?B?SDg5VmlXOER1aGc2WStPdnkyT1JucTlQVlkwUDhyYW84aEJoZG9oUzVZQUJZ?=
 =?utf-8?B?d2FrdEtod1RPaDhQay8xM0ZmNVFhRlgrMVB4R211Z3ZSU0Z4d3V6TnlCdnIw?=
 =?utf-8?B?bG9iQW14MHJpTG1BZ01KVEZySmxtajZ2T3Ard3I3OEMvR2YzTGgxVUlmZzRo?=
 =?utf-8?B?Mi9GRzhJcVc4bVphR0NuaW1YTTh6SjdzalZDUTd4akNPOCtuZGlZKzdMekY2?=
 =?utf-8?B?Y2FlYlhKSU5pYlAxSFYzNnlnRlNISGI3dk5lNkxmTjFnNjVtVHd6M24zZ3o2?=
 =?utf-8?B?c3RYSVRPWWhpWnIyQjFqZjlLWTFlRWIrb3VkbTBEMkVGRFNYaFQ2MGRWUHFD?=
 =?utf-8?B?Y0lwUm5kYlhTZjREc0JHdUoySW9RcWVtL0hrRllxYzlTcmpURHlMY3ZHVHdj?=
 =?utf-8?B?SDhrdUt6cXBsVENvZGhieExKQjlQRlJoY3dmVjVQQkoxeWhwTlA3RVhwSzd2?=
 =?utf-8?B?c3cwSVBqZUxJazN0dE1tdkJjRFFQNzMvOVpZLzNMZndzL1Jjd2RMTktRSjRl?=
 =?utf-8?B?YldxZmdFMXhPVnovQXdSUEhHZ21hSG5yc1VtWWtGQnRtVkJaTFU2TTVBdmQx?=
 =?utf-8?B?anh2WnJkN1ArMm9YYW1SZW9xcUxSWmNFY3F5TlZPVjJDaDB0ZC9WNS90NzVP?=
 =?utf-8?B?RTU5ODhXdXdoQndIa1NLUDFINE1qWVJPSVhSOFl6NU1mZzQyVHU0U20zdEg4?=
 =?utf-8?B?NVZVZEtlU25KWnRTK21UbnliUkJlV1k3bVhJOVpaVHVhakpJTmo5SHMwamtI?=
 =?utf-8?B?MEVqNmlMMzVUZk8wREZKbW1tTmJzcXFvMWtLdWJkaDJFbE5pNTB4aFJWVVdH?=
 =?utf-8?B?Rm5xZTRoSzdJQ2VDZkZXL1M0eGdlMUJIU1VScVl4dkIwRUgxYjUzcUI1Nm9I?=
 =?utf-8?B?eGZvekY4YnBPUDBjK2dGMlZ3RTRiWkJ6VkpzVmpEampvWHl2bFp5VnpUMWhX?=
 =?utf-8?B?b2hEY1JuSjliY05qbnI3WGFTSXJhendJbzk1NGRHY2Q1Rm9vWDZQRHRmd1d2?=
 =?utf-8?B?RzFET3QxNjNHMEJ6bzh3NHliL1MwRkwxdVFkbkZHTU4ydHZnOHJvbnVLdFpB?=
 =?utf-8?B?aVovR3JRSDdnSUwzandYbXdNNk5PYTFFcmxPdGFaTmRVTFVqbWJhS0RCRnQ2?=
 =?utf-8?B?NytiLy95RXRKREZGaU4zRDZ6RzFxNTNMSEdLWVA1ME5kOTdtRlUzK3g3RWpP?=
 =?utf-8?B?OElWVFhsT1c2TFlVWnNWWmpnQ3hmQUtGOExDRGptOUJOZXg1WEZHVlBzRWhx?=
 =?utf-8?B?YkF2MEJ3TE5BSmFkYnpjcllJYmRLcjRuN3lUU1l1WlNzVVlwSHFLZFlFcFFw?=
 =?utf-8?B?UTVxYitZV1ZLbVhpc1BxeTFFY2IyTk9STFYxRXhKbk5LVlN0Q21ZK2kzamZY?=
 =?utf-8?B?R09lNVRtMnBocGFBWm9ON1hLZ0lBM3FkaThiOUlWbDBodzVMZnlFWjVHbWxo?=
 =?utf-8?B?K1h4eCsyVFczRGdzWUozbXIrRFlGYXBHSUdjcGpnQTZyY0JldlFLVGRhV1Fw?=
 =?utf-8?B?Vzlkd3JVQ2JobmVXb0p5bHJQZitPNjBVOHZrbFg4UWpWY2I1Q3FHNkNFYlpi?=
 =?utf-8?B?Z1hBNncvenNnVlJ5RVBJdU1iZFM5S1BoNHZROG12N1JZMDZrNnI0d2YyTEpE?=
 =?utf-8?B?dnBLT1puUjJDRWt1bWZOMVdFME5ZV3B0MCtURm5sRlh1WUhrT0phTk9RY2xP?=
 =?utf-8?B?bGdMbGpSOThub3V4YTZwY28yakJhTGpXdkoxNmk4UW8rNDU5YS80MDZuUEUv?=
 =?utf-8?B?VHpXRWx5dHI3bGR1VitXaVhMQTZFMnV2S1lDdGtVdHJ6VU5TUnZKeWxqZ1BT?=
 =?utf-8?B?M1ZaZ0pURHNpM25VSEl6SlpLV20xN1kzeTZBS3dFQ2Fzc3pFMzRwMjQrS3NN?=
 =?utf-8?B?THUxdGxXVWorc09VR05sOGtnUFlXRmJNZ0REVTRZcUtlNmlUQ29oVkkrQmVF?=
 =?utf-8?B?UVppY1NvZG9jeXAzRU9yL3NsRDFoY3NyRkRGcXJHY0hzRmY3VlBQaFdONVJt?=
 =?utf-8?B?MzFSdEdtN3Q5UWNuTmozaVJieHRkcVhBaitDSlE5Z1ZJbS9CL2pFRmVXdllh?=
 =?utf-8?B?TDJLOG1TOUU3WnpxZDlST3dwWFB4VUc1ZDU5UXZmL0xjTXo3ZXdCZz09?=
X-Exchange-RoutingPolicyChecked: c8rZKRuERtTE2aaue9YJTkjPVrtUuNCzwguhQFCDcVkWeeaPRACIiZ31jjbdBTpieEiiUUyz0S122lB/CyX8iJ1ecToyEDHsB9rAHgm0vKtqQTSsmp8gpRV7TEM5g3CcSSVZcJQtTqSp1yHWBdG8nu2/LazujyMWZnwSo41utyIos3pmL22zNnTC+DId6ZxGUNln7miR3pFSomFesoIbRZWvzT01SUUjiqi/IvVM4MOdF3smz4Cj0mdlNoBqEvZ3VyKX8SXiDWsCYRHNHBweaO0XD83qix41EAWx+uLNOzS81T1qHVtEyzEAKu9u5U3joA0eAN9g5f8loWgBt2Qugw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f80e05a6-04d7-4456-2c65-08df359468dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:12:44.3937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr+vsu0rz2lJdhCW3ndwBhwSuyzV75xylcSMhlQ08UGskgljOLNnvh2iEPQC7LwLHqMQi2cLdjbUNrXOb08cgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB870554
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


On 28-10-2026 11:46, Mallesh, Koujalagi wrote:
>
> On 26-10-2026 11:35 am, Riana Tauro wrote:
>> From: Varun Gupta <varun.gupta@intel.com>
>>
>> Add wa_14028434957 for Graphics Version 35.11 to the table.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device_wa_oob.rules | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules 
>> b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> index d8dc41851425..36b2567994db 100644
>> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> @@ -7,3 +7,4 @@
>>   14026633728    PLATFORM(CRESCENTISLAND)
>>   14026746987    PLATFORM(CRESCENTISLAND)
>>   14026779378    PLATFORM(CRESCENTISLAND)
>> +14028434957    PLATFORM(CRESCENTISLAND)
>
> can you please combine 3 and 4 patches? 

Yeah will do that. Took a patch from different author . So split it.

Thanks
Riana

>
> Thanks,
>
> -/Mallesh
