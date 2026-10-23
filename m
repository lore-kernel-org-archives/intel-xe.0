Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C71B606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ifg2yEHd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597AB10E101;
	Fri, 23 Oct 2026 12:51:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572AF10E623
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792759905; x=1824295905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tq3U5TdPR/JpZwJptzlL+KacJhCnk5xaQ/W+9GpGiwg=;
 b=ifg2yEHd0qVngHyIi/EFUyMxX4slN++BTEK3UxYdKYvjGj2wwzIGxK8y
 zDVv6WFaju1ohVVbXFCAaW4jBPoyEB1TF14X833UJKNzR1xmdXFTDDLGo
 Z9TSd9rkPP8UVZiaBtlfBpINB7KthSEbWjd4M/e7i6rz/YpYs2hDVEdkZ
 YDJhkpCfHAB9YtmAoh5nPars44+zkCu3fvyjP90ph6RSAuuuzqYAttCbM
 ZBt6+q+v/X3OJxnJCeIhoNwQ0lwjiQqkRf3vgR+jP35C0NAUaFaL7KHEI
 KEGczpUW4y4WixEWW+6mrsu2byw3Vj5MsiLjiprN250vF825n21rjGqU3 A==;
X-CSE-ConnectionGUID: Ysn6lyhtSLym57tfBf4pug==
X-CSE-MsgGUID: Lo2aupSKQ8myCUsOyPo8BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1407895"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1407895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:51:45 -0700
X-CSE-ConnectionGUID: V+CFP9gZT9WXzfKZlR2CPw==
X-CSE-MsgGUID: J5EA+NeDTn2w/NFP9PNNpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3735619"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 05:51:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 05:51:44 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 05:51:44 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 05:51:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQRDwHiHxI1m7OBBYQpJy+6Q7SuTjmPNQIeTb/lhRkz7EuM0mw2/xr8OOwibCBB2N7GfimS/MW7l4F1hFX45Ks5DkkeI5XvxsDkxyqxz+lBhKDBTanz2aCLwOfZQdR8NfkubQWkphVtz85AHdiUeIhVvTiG6ndyXMGd/BEq8h3Z7exFkrhbZYZzB0qDgXsIN64/2ZbKyFid7GEF/et0Y/Q5hvyynHrw/4OUQzaKYH0sPqHpN9bxrDHXtrdIH+BHJEaVkOvF28D1gkWGTllxaUYUnFYyb5vt1d9BMIieiwdH/6RLsOek0bWkfQ+Flz/ufdARManBDgs7xterLc639aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0nJHskntGtKutvRXyonSUl3lwjTfYAQ1S+LV2Srivg=;
 b=HL0PjHkPyHxbJhzac9CBpbmIIQFepakrwbT6z8irrh+pXhn+vzDH9PsLD07jGq1J702twauZMZBakuiD4NmOvnsTMLgppF5l5jB2nFeOc8IpERYkryu17HtG530rdYACYd9F0ejfEM5O2+uYcZvVgJ/PpHFp2O/Vag6nyJ7YxOLHaESwWiZlUKZgKUU53h8plPr7+kcJoJSR3uyVsB8zkZB198hFgdobeoZelMEBQGNyyfi8fTKc/y4m6Ru3QgzY5KJOFjHv7ZGdl+FGYla6ipmQ26IiSITgcAW0SpDpKjvq0YKHDJMAdqtW9XgRfY+pL14qhFBH5MC2zQe79cmNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 12:51:41 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 12:51:40 +0000
Message-ID: <cf26d883-b8e4-441b-b739-40104b874b9b@intel.com>
Date: Fri, 23 Oct 2026 18:21:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Restrict LONG_MAX overflow check to 32-bit
 builds
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261023082939.387258-2-mallesh.koujalagi@intel.com>
 <e5d55f7adef63e5ff054b1493f1759c83cf5e33b@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <e5d55f7adef63e5ff054b1493f1759c83cf5e33b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0298.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA1PR11MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: d46e201a-1117-4e79-673a-08df310461f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|261022115727099003|4143699003|11063799006|261021123027099003|261009223027099003|261021121427099003|10067099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info: yQ2eg9G7zlbpEEHky+8wlJc+/P77JQGqkH9GGzao9pEcwFMfgjnIQsVVU+f3nNx3s1nLIwpABwFWhpq+4vdlu0dGLajtn5QACZYGxmb4non6r0rEXTHke+PuElklhADwZQdvmnGozkp0Gzkq87d19iev/2pDN5+roVRDv8CkOOnfT3+aksXj7gNqruZpFpZ+5CASQMLVJ+h2Q1wSUK+OLtkmcuak/4Iyp8Q2d4M8KNSN+ZXQ9IpEZ3bpvdE6vE7H2FvlPMENn3VYlPiqZfDUqrRYd/qrX/GMfkE1ZE1nDgE2fXUQufcaUpNC2LxeVh7qMrhkAq+9EK9wPKjHaG8EB37BQvURgeXSFhwXelomQe2B1e4T0+n2BE6XFEswXL+3mi7XHs9MV1OxPcr7KsqdnhUtM8KsxnMT5vrCcfLJvRtzKKD1rC5u4zMbWRdODfKn/19M1b+f5Tc7C6FlBdHIU2KEfid4g7GK3tqmKr+DrU5qQpUSnmTkB0SVk2+NVdKccvfe/LFUPGqMYm4nrtji5KZZDWoHLOaxxeWFvVCy77dR0uR3rmjwaonQYv9Uia9ftcapMc+r9TyM5Bmv+ZXvKi3sBbZj366bp4Lq2zUX+V3v1RY9RHaXH666q9OZQMtEIdxrzD3kw0E7hOajcwzKPCy4tV6nEeC8SO6daPSXH20=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(261022115727099003)(4143699003)(11063799006)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(261022105027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ti94UnlxTzZmWXpwdWNDcGQrcXo3Q2QvOEdFdmpLdWk2NWZlNzd1cjRWSTMv?=
 =?utf-8?B?NThndk9ldjV0NmNjOGpocTVpK3JiM284SEp0a2YwbC9ob2tESUd0ZWw3U3Ex?=
 =?utf-8?B?ZUVtemwwRmphQ2FFay9qaTN2OHZJM3pyWmc5RWlMQjV6aG5uTEhwYzJ0YzFR?=
 =?utf-8?B?QzVicmw2cHlRYWFoRVhTd3F5c29mNWNNVFZJWjBYektaV3VtWDRMVVF3S2hG?=
 =?utf-8?B?WTZTZEkwUWlFaWZsOEhTN05lSDhKU1hmbzBpMkhZWnhkOHFoZ2RxcURydUlV?=
 =?utf-8?B?aGkzN2ZaLzRmQ2R3Y0gwS0lzdnV1WTc4T0QvdmR6T1M5ZXdWYVFGNjdMYmww?=
 =?utf-8?B?bGxidXZuWE9qSWl1cWkyTVRpejZzeGVVZkJuQ2lZT0tlN2N2R05hZlNEQVM2?=
 =?utf-8?B?L2ptRG5JNmowQVU2WlVPbWtCLzVEdlJ2Y1YvSFNMRXNZRkRJWktvc24xMTI4?=
 =?utf-8?B?MXBOYi80U296azQ3OHNMb25IaHk1bG9zNEM4VHlHYzd0SmpUYzhpVEY5RXVv?=
 =?utf-8?B?K05kck4wTjdhaEtrY3hFLzJnOWFaMHRGcUt3MEdRRW9mSVVWZXd4b0FkRHBM?=
 =?utf-8?B?NHlyTERQVFJobStuVm5OVW9GcHRnMUVBcXNQUjVOZDcyWWdscnpDQ2hPUWd5?=
 =?utf-8?B?KzdtVEd4dTRRTDVEdWxjdjVlMEJhU3kzM05VSnNUOWJNYTQ5TmRkcmh6bG9r?=
 =?utf-8?B?YVBlcE5sMUNUbjYwMzFvWFcrSW9XOTB2VlUySEFRNE85S2kzZjgzZlVzT2ZE?=
 =?utf-8?B?UVFITFBBcW43RjUya3JSUXQ4VU5jQm1FWkFzUUxPalNQZFNybG1aZzdnN0pC?=
 =?utf-8?B?ajljTkwrRHVZU3VMSFhHeUJkZHZjYTNuVG5lN2x4RUgyQWdBWFQvTHpKVS9i?=
 =?utf-8?B?RVI4UjQ1cmpzOUhGb3RQa1ZYSXA1RUwzT3Y1NUhsTHBpeVJVb0JZdStiZTIy?=
 =?utf-8?B?RkRtbCtjUHYzaDVJbGY4SUFaYm1WU29XaXo2SmtkVkw4SUdUWGdTM3M4Z2M1?=
 =?utf-8?B?a2syVlNVL1JSb2xEVEFOWlR3OUpnV2JRU0NXcjZ1U29IN2RUbjNUM2VtNGpE?=
 =?utf-8?B?eW01b20xZlNCL0swZ25MTXZpNmtMR3RvVmdndmtEQ25KV3F2MklvR1VnSHNV?=
 =?utf-8?B?YXN5dWhCcHpadHh4NVBHMGRGT2I5ZmRJcHNyUHkyTTBTRmFOK1FQSFkxMVRk?=
 =?utf-8?B?NzRYcGc4WklCSHlpV3ZQdnpSZDFQMHJmdDVkMDRuQ2IycmM1WVF1REttVFBw?=
 =?utf-8?B?d0c5UjZNVis5Z0dETlZaalBtV1ZTWXZ2bzU3NmZaTFkxaFU4d3MyYjZMcmhK?=
 =?utf-8?B?cS81UVpOUFB4cWZRU0hKaVJIMlh5NlUzQUZSOTU2Z2F2Yk8xQWUvQTkvZTJu?=
 =?utf-8?B?UmRSS3lkVkJaQzVPTWd5TUdDSWRzQ3JQelc2STIyeUpFSVcraXhCUEZxTWJC?=
 =?utf-8?B?R0ZCWHF2VVlLYUFTZmlybzZqcjJMdGFYaWNudTNsU21YSi9LN3FSQ3NoazZS?=
 =?utf-8?B?NUdFRjlWS2hzSWxLOEltRnB0RkN2eVZ0RG9uKzNvemlJM0pYbmtOazdnRE9H?=
 =?utf-8?B?d1FlQmRFcldjS0NDZ3JSRHQ4YU11RDdhV3Vxa3ZGU1RvUTlGNnpiR3gvMW8v?=
 =?utf-8?B?WlFaRGpERXlrM3N6UXN4c01OS3VyNUV5VU1MeU1taDZlSXNudGFwU05TUE9x?=
 =?utf-8?B?MHhXa0UvZDRnVUc3cnV5UW9jT2V6WHB2YWNjSUFRckgyVjVKRnpxbStZclls?=
 =?utf-8?B?b3Q4N1RrVU9LVCs2a1QwZm5JeWtCRzNTY2VQTFhEbzJ5b3dWL2t1TFNCcU9H?=
 =?utf-8?B?RFV6NGJUQzlDTG9pZ09vd1p4WUszUWFtVitBTFRObGg2NVlTSE5yTjI5SWc1?=
 =?utf-8?B?aW1hWWRUeUZCbGJ1VTRDS1hpV0h3b1A0cTVJRXVSWGpkajZaUElYcDFhRXgw?=
 =?utf-8?B?TWphSHNkR2RYNmZXLzFjNjVBb2ZnMlhmZE9SVytzSGYrZ1ZlazNRNllSM0ZT?=
 =?utf-8?B?TmJCSWd5TFdOK0NVMmdHU21KVTFpeXo4WUs1WFBHM1VpY29IcklNVG9YdFFR?=
 =?utf-8?B?REluYmNnS0xVNVo1ZEJFTWg0dEVhZHd5aGRoM2E1akx2VHZ4aTFvMURBZkUr?=
 =?utf-8?B?aExNSUtkUWl3cVlNUFY4azFRT2ZJZlQzUmRrajdCSytaKy9ielhvM2R6dmdY?=
 =?utf-8?B?VVlCSU1kenZLa3BYbXY2aGEycTY5VmorRTU5ell0STJCeW9qS2xMZnA2RklI?=
 =?utf-8?B?OVpLbmg1SzZtczFiSjdYK0V2RHQzcjB6UG5hMnRicmExNFNCZjVYdFo1cVpV?=
 =?utf-8?B?a2duTVkwMVZZeTVVeTErRzRucW52VTRydlN2RzhUUFRScWxybzdidkFyWEto?=
 =?utf-8?Q?7divB689TbexKHuU=3D?=
X-Exchange-RoutingPolicyChecked: k35vLiPs2Y8MUBdIVHOXInTQWm9EY7dEVvJI4llA+Vk/rm/e5ka9kPdPI9QwfJyOPxo/yhyZN1QlfsQd6p2N4TRLmvmsi/EBILqUyQ1Ax3iqjuSlIS3K4lAmyC68fh1Hn7WyzcthTthWtejWo0KVUENb5btq+pZpYtuR3NyrYSY1AcK3xC8Hdb3pY98raMX0Q2ZZt2mcvKJzazXRKWeKEdG9KlEG89GzIY3Lx7Sha6MXfRdIgnaJtQGl6CUSCZ/yzrsL8TBVdiwIyy4o+wWhwM0fReFJRtDnBgM2wAjhkieudzsk6N1uNDX4Q3k1GQpoaasArHTy6ohbv6+ksjf8WA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d46e201a-1117-4e79-673a-08df310461f6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 12:51:40.7437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3IMkjqwL7+EKF4aBlstUnwFWuZz/e7t4Jw5DQpiiqRBwE5rgUmsy2tz0jWPjmJPVUQN1q3o839nCoBBa0qUoVGDrdtdHC5sW2cvMRAL5Z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 23-10-2026 05:28 pm, Jani Nikula wrote:
> On Fri, 23 Oct 2026, Mallesh Koujalagi <mallesh.koujalagi@intel.com> wrote:
>> The temperature decoding code stores the intermediate result in an
>> s64 and checks it against LONG_MAX before assigning it to a long.
>>
>> This check is only needed on 32-bit architectures, where long is
>> narrower than s64. On 64-bit systems, long and s64 are both 64 bits,
>> so the condition can never be true.
>>
>> Wrap the check with BITS_PER_LONG == 32 so it is only compiled where
>> it is needed, preserving the existing overflow protection on 32-bit
>> architectures while eliminating the dead branch on 64-bit builds.
> Why would it matter? Why make the code harder to read with the inline
> #ifdef?

Static analysis tools complain that the code contains dead code on

64-bit systems because the "value > LONG_MAX" check is always false there.


My initial thought was to handle this explicitly for 32 bit systems,

but I agree that the #ifdef makes the code harder to read.


An alternative is to user overflows_type(), which handles both 32-bit and

64-bit cases without conditional code and keeps the overflow check clear

and simple.


Any thoughts? If that sounds reasonable, I'll send a next revision with 
that approach.


Please let me know.


Thanks,

-/Mallesh

>> Fixes: 24ec15d64617 ("drm/xe/hwmon: Decode CRI temperature registers as IEEE-754")
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 42acfeb8818c..2ee51921acf5 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -1322,9 +1322,14 @@ static int xe_hwmon_temperature_decode(u32 reg_val, long *temperature)
>>   		value = 0;
>>   	}
>>   
>> -	/* Ensure the magnitude fits in long, which is 32-bit on some arches. */
>> +#if BITS_PER_LONG == 32
>> +	/*
>> +	 * On 32-bit systems, long is smaller than s64, so the value may
>> +	 * still overflow long even if it fits in s64.
>> +	 */
>>   	if (value > LONG_MAX)
>>   		return -ERANGE;
>> +#endif
>>   
>>   	if (reg_val & IEEE754_SIGN)
>>   		value = -value;
