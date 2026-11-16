Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56330606A88C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j7eoLVhM;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Q2/LV9cU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 183E410EDCB;
	Mon, 16 Nov 2026 09:47:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D6D10E1F4
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822417; x=1826358417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ClzYyLhcNm1ShelvlE5MgWPPhhe9hpWqDUgGh0C8Rgs=;
 b=j7eoLVhMQ3W5CPQta7h9eYS+BoUFQ6hx+5mrZ/4gGc1L8PmqS1h3qoVQ
 IjgYeFBdQUDjsjImG6L0YFX7GpCFZHbhkkWr+PZO2yZYSiTMnTOdwhzIU
 AbH3+AssI4qOJ9RZTWKMOWukglgikykAfomHg1WcrO+U0gcjzbKAe5n5f
 nqUVWeVvjGI1rkef1spvImYlh0Rhi8nUlGgQ+xkUcex7auKSrogHcjtyR
 uAiNKCrAA2nwhgBe8W5wUahREDly0JWYl51hDPycaa+u185GFRcoJLBNH
 n45DFLPhCMRoXYmUk7G5QgEawtY9phaK8nKJExVhQZfLkDRt5Hq+sNbcH Q==;
X-CSE-ConnectionGUID: tJN6sZaXR2q5IqXZ8htiog==
X-CSE-MsgGUID: smdMayHdSaSPYshsMM8dQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3426446"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3426446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:46:57 -0800
X-CSE-ConnectionGUID: OplI6RPyTuCCRucWowPfeA==
X-CSE-MsgGUID: oeFREhhtSVWJJ7Dwjrk4qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9312403"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:46:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:46:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:46:51 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:46:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLpBl2n06jTTHaQ/LpWak1dy6StIk3Mb4R268HfjIs8ArgC32YEo3CDxKy7wu3xR8q5cE8zzPypfu0gNmhaiLLv49EMVM05mRc9U/l4QJRwWrrLCJeTJq1ISWAjCb65XXwAMJ8Z1dK9h8IzcIke+LuRi23OKwJPTp6eJtYUkTmR1PQummGBGsIrnZWxbVvfVFDIXYT/2c5vlSCJL8DUCb6kHkUeeyRqDh3Wxkwf5b6mU9XlrOkQR+h+BUBQ09Vipf5+PkCHHU6u0WxXh8QwW81yKNJszBp5IuMzLTniul7pYZiu8MPCWe4iGBQGWR9MirOvbyNVmS+8DkwgXr+KXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awXbvxTtTufT+7uHG9M6z90hdfdl7bG9uDmKfgIv6oY=;
 b=TeLi0MBEvPisS8CjLaAhWy/qClb/mdVw+HZGyJrAyQJfWqXLDeK1gKjaUM/dZ7yqU8j46XdZ1Sgbj/v5oCkGU5IZk/KNiVTttgQu+CKhz2p+qVzmkxxliFM4ZYUBm6DD7mfhEulOqrfpCicN1lwOwcZBKXfUYYxckcnm76nuRPjGiwqpD4TbO0pFusOvJGvlGsgFYtjNd9rpj1qs/eCGtl+n/YY+rtJBsFz6G/Eqbw1tp7sM6Adtj4K2HFbdeyBnAouPoNI7OHxv56mptk50XZ2jgKQDdf5RlsyG6UzDZaHzkQU52Z7SWGO3XMRzNKALeXM75w5s6aa6ffLQLsIsSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awXbvxTtTufT+7uHG9M6z90hdfdl7bG9uDmKfgIv6oY=;
 b=Q2/LV9cUMO9KXAlu0jNmTrljeWmHxt2NOYrrrkA+NEdSxB2vIW1xA1hPEYTTAUlrKIcc5rJTP+cZApSFKYtu5nlVVjjYyRnKBrBoE96OxbfLtOzVJHHjm8kXsptYZ35ggRO3YCC5s8oUTwE3u90ljbHYJ01dxlq9Y6vsRw0VFUc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:45:56 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:45:56 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 6/7] drm/xe/kunit: Test partitioned VRAM manager
Date: Mon, 16 Nov 2026 10:45:22 +0100
Message-Id: <20261116094523.2484301-7-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: c9af80f6-8f57-4a8c-3531-08df43c6694f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|261022105027099003|261022075727099003|261028144727099003|261022113327099003|261026121527099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: Y29J6FtNleAX0d9c5weu9+7pt+h/62sgTGktDXhe4AMZ8EGkGNfEEAdavXB++Wwct/2vitThJAcjN2N9g58lHdMMdwegGIeNcyDvG2n1dYknaEhWpGx8rDThreM79Gia52I9sTAvUSxe7N1maj6xQUPDIlNnSzWNTrTzUuUX0t52qRZE4aBoxXwvN8AGK0hdpaZdS0H7ItNL7GJmyvdb1hGh9zg18NV0aGroYTE4XmXDjZ5N8my118qT19CM0L+w2vxsvheEL2sycxGGi8up+0p1lQ0KkeT47oZHu1uS++nxiyJ6XSKgZQ8/ia+7HpngKy/Hks2FX75ekxdyYOn/AkaYmrZH3vIJJujLzGQ8H0cSP1Y8HvLphTfWDVek1pnm4Yz6ipMaB5wSctSbgjC34EnGJOcvApVXB4ehqCBZmfs1U0ZLIVjLepr4ablEsETo9IYj3a1iLTp+TlXyt+/N64Dii/ihzA8x19UOtqEzcvKZhfzAxjxuvZspGQQuI2FOtOPkJeIaDz8KNpBXgmJHjfDQN6VeW+xPeWuGEw+KWhLiby/1e140g1n6p/blb2lg8T9n8ocGHM9J2K0BDiJg6+Iv08jC9hCxDQVaEK8aYW7y+HbSaFu+02Z36p+0f60l4VJwPk9bqHRMXcu6cUNJ+8cAyS//wNHUTKUFLZLnWf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261022105027099003)(261022075727099003)(261028144727099003)(261022113327099003)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anNFTnNjT2tvUTVaM051Rmh1QkhzOTFhMW9MNXBLSXNzU3FuRGpSVGx0Sk82?=
 =?utf-8?B?eTlyZG1MRk0xUzR4bXFoNmdYbmg3eWhia09DTnkyZVZiM2QwOXYrN0pMZ1dB?=
 =?utf-8?B?YkFSckJadWVyVHkzdXQ2NEg0UUZnNFEvVmZKTXVoZzR2SDFEVGthWGxyb3Vi?=
 =?utf-8?B?RGhqRkFUZVQ1aGJlYS81ck9LYitMTEh2aEszWHhGT3MyZG51SE9CdTErVWN3?=
 =?utf-8?B?cUJRMTl6djIvbmg5V2I4SkZrSDJySFR5bUFITlR6NHAyU010bHZBbHhDRTB2?=
 =?utf-8?B?UFRvclRwNktDSkYwK2grbmVpR1lQTGlFbElCUE11OWYyc0g3dEZzRjdKdUJz?=
 =?utf-8?B?UzRZcHhzaXJFYlF3S2k4VXZZTGQxWkcxdXVCS09UUlN4QXlSSmk2RDFnWXhL?=
 =?utf-8?B?L1l6WGNxNkltS1M2NVJoTEVYQWJqVTNuQlBuQjJseFgzVVpwL0dUOXNuZUY3?=
 =?utf-8?B?VllIY1pCK3dmSFptRjVYT0hRYWtKSHdsa3J4RDREQUNXTHNhRzhIaldRTnB4?=
 =?utf-8?B?bDVSSWRDNjkvMGM1M21KZHBuZUw2bEM4NlFQUU4wcXRkMjBlWWdKVG5GNXpZ?=
 =?utf-8?B?Mk5RcURlRy93R2NrWVFTRUxySkJMczB3RXExbGF5QUJWYm1wRnU4S0lPWDhz?=
 =?utf-8?B?M0x0THE5cmJCUEJVUlM2VGthbnpBZlhOQmdkTHlLb0ZGekwrR1llK0ZSbUhk?=
 =?utf-8?B?RTgwYVVYcWNhNE9UVVZMQUF0bDRueXNXWmx1VlJveCtLQ0pFYWZzb1pyekow?=
 =?utf-8?B?bWdzVUVjN2VWVDdodUVZdFR6cm14Z1RJY1cxeElyT2h1bGhzYkFFOTZGSlFz?=
 =?utf-8?B?KzlVNk1ZUDNnVTFma2JGUm8zK3Z5d280SGMrWlQwbERRQk8zNUQyQW9zUk5P?=
 =?utf-8?B?V01IbXRWOFYveEFWL2daY0g3YlhkRHNsbmRYUlV0bHdCcElNOTBuWUtmOFVp?=
 =?utf-8?B?VDd6ZjQ2OFA4YnFUR2JBTlF2eUtTSGZmR2VtVmZVNDgzL25uTk5WOGdDb01Y?=
 =?utf-8?B?NGIvcFA0VGJEQmxIbXZaUmJFZzlLTjZFanVZRE1iNFUyVUozNlBKRm1aRmlC?=
 =?utf-8?B?c0hUNE5HczVJOUY3QlJ1eHc4UkhuMDdNaTRxOGpkNnZIZVZsNjQ3R1MvWmdu?=
 =?utf-8?B?bXkyRkNsQno5K3NWUmRpM0NDalpXTEJsMXM2Z1U3MFA4alJmZVA3VzB2UUlX?=
 =?utf-8?B?b3BiODlFQWRYUktXWnF2bkZqNkxUeGlqcXBoTGQ0d3pvZGh4Z2RrK2RmNFVK?=
 =?utf-8?B?SVJhZmEyVVpsS3pBWHpUTlVjOGVvbEtTTThGK1V3dmM0cmVXNFhiQ3o0ek1U?=
 =?utf-8?B?Uml4aVRFalZFbWUzSk01dFUvWG9FRzZBUUdJVkZDZGVaY1ZXVHIrZHVSUW9O?=
 =?utf-8?B?RWwxNnpka0h1bEhWVWVhdXQxT0tIN2Q1Nm51Tk1WT20zekV5VXl0bHplV3BR?=
 =?utf-8?B?UDJUZHhveTdOSFBqQUlGS1JsRzVaMERBbzNHZUZHZXlwc3gvc3Fub1d6RTA3?=
 =?utf-8?B?RmZURnByc0l3S0JPUE9oM1NNdk52YmNSL3JTWVExdEZoK3h3V29LaWdKaE9y?=
 =?utf-8?B?TUFQZ2RsOHVrVmJBQWUzekNpWnkweUNvS2dEVWNHRkVGQVpEZSt5ajRqSUFJ?=
 =?utf-8?B?ZTVpTy8zUUtyWTJIeHdzcnoyMnB1MnJlekhrYVJ1eVVrWmlsbG5RN1hoNXMy?=
 =?utf-8?B?dEpIQ3VHSHdUTGlHZ0lnRTVueDNteUQxbEw4b1dWb0w0RDh3cXVvc2Vxa3lm?=
 =?utf-8?B?LzFhT2tnZU85SDQwbFRKc25keENnUHBPYjdxTFZyc3RmcFVDMDBDWGpDenFh?=
 =?utf-8?B?UmpiazZadElGOFJmWFI0cGIwTjRZaXFaNlc2N1RoaUpGK1VtYTBXTzV3UHZq?=
 =?utf-8?B?L0IxNEdNTE10Mk5WTWpkWVNkZmhaKzZCTlVuWkZRZzJYQkRzOGFEMytjNmtJ?=
 =?utf-8?B?Wkt0Y3hmVkg2TVBSUGFpUDBsMkdKRmNSWkRVYUxIa3laNDNjTnpNS21rcHZI?=
 =?utf-8?B?UVNldnlFYkNNU3JKWGl0Q0lQQmFIMktmcnFVcFBScjR0aTF0Um1WRE9veHA4?=
 =?utf-8?B?N25nNVhsanVnNG55d01URktqcmZ2aUFYYlVucHdZREd0a1I2ck16NnNpd3Fp?=
 =?utf-8?B?YjM5UFNEeEFMaTNnU2NiUFE1SVRoLzJWVExzV3Z3NHFlWDBuVEhaK24wNFNM?=
 =?utf-8?B?aWxTNjFTZUtyZGNETHdPQTFybHJabjgrcEVsVDY3eU1Za25vZ25kSzRpRy9z?=
 =?utf-8?B?ODZxTGd0ZHRiVzVKb2k5d1J4bnJnV1p3TFdRTnAxcE9ET0hFMzU2eE51bjMw?=
 =?utf-8?B?S2RIUGxMc3B2RUlFVnJ4TDc2YzF1Q01USGRxRXoySlg3OEZDQVhJcW1mWndZ?=
 =?utf-8?Q?6DOvMSO9doNPbEuQ=3D?=
X-Exchange-RoutingPolicyChecked: G83bDhAzHWkNh+K6DQ0H+F+4gwoOwvzQp2Z57ocLqbwBLkPqOCCBPLcMtA0ytf4mM0Vo1FBWvs/mDbRqqrKZR1Lwf04tXJlQ8r21awaVmEImPpCgo4TGJTxHRokN0LbKnhm3AjnhrM77teu5SAseEFhVIY03Gsgq2M5SQB7f4gGEzW+ZCfXAFZDJHmaN73Vgu+fEsIB/h6dg5NDyQ29F5uhf0DYMXmJwv78V17mvOiX9zcgkO/4tKuj95FQkWAvaElu+qe0Ea44hyLwzkKQUavi4nCfa742ukAdl3MnSvHeb9OXiqNfQiRG8Ca99gVlap+T9EMQNfLTP4x9MFsEjBg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c9af80f6-8f57-4a8c-3531-08df43c6694f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:45:56.0367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywP9hd/RVtymvV8jWXIOd86vBfaQOFbCfkBGd7pwFtvoEPOaXs6l/wT+MvS3ZqGAU9p81N23JQvvpu7LSQEcQh/LeoP58tvXa5E74kKhHj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Exercise partition selection and address lookup, plus pool usage and
CPU-visible memory accounting across partitions.

v2:
 - Guard the test include with IS_BUILTIN() instead of IS_ENABLED(), so
   that the suite is not built into xe.ko when the KUnit tests are
   modular (Sashiko).

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c | 147 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |   4 +
 2 files changed, 151 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
new file mode 100644
index 0000000000000..1ad3186e6d5be
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_vram_types.h"
+
+/* The layout xe_ttm_vram_mgr_init() derives from the pools of a region */
+static struct xe_ttm_vram_mgr *split_mgr(struct kunit *test, u64 kernel_size, u64 size)
+{
+	struct xe_ttm_vram_mgr *mgr;
+	struct xe_vram_pool *pools;
+
+	mgr = kunit_kzalloc(test, sizeof(*mgr), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, mgr);
+	pools = kunit_kcalloc(test, 2, sizeof(*pools), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, pools);
+
+	pools[0].offset = 0;
+	pools[0].size = kernel_size;
+	pools[0].purpose = XE_VRAM_POOL_KERNEL;
+	pools[1].offset = kernel_size;
+	pools[1].size = size - kernel_size;
+	pools[1].purpose = XE_VRAM_POOL_GENERAL;
+	mgr->parts[0].pool = &pools[0];
+	mgr->parts[1].pool = &pools[1];
+	mgr->num_parts = 2;
+
+	return mgr;
+}
+
+static void select_part(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+	struct xe_ttm_vram_mgr_part *part;
+	bool exact = false;
+
+	/* The ranges a pool resolves to cover a whole partition */
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_128M, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[0]);
+	KUNIT_EXPECT_TRUE(test, exact);
+
+	part = xe_ttm_vram_mgr_select_part(mgr, SZ_128M, SZ_1G, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[1]);
+	KUNIT_EXPECT_TRUE(test, exact);
+
+	/* A narrower range still resolves, but needs a range allocation */
+	part = xe_ttm_vram_mgr_select_part(mgr, SZ_256M, SZ_512M, &exact);
+	KUNIT_EXPECT_PTR_EQ(test, part, &mgr->parts[1]);
+	KUNIT_EXPECT_FALSE(test, exact);
+
+	/* Partitions are a hard split */
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_256M, &exact);
+	KUNIT_EXPECT_NULL(test, part);
+	part = xe_ttm_vram_mgr_select_part(mgr, 0, SZ_2G, &exact);
+	KUNIT_EXPECT_NULL(test, part);
+}
+
+static void addr_to_part(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, 0), &mgr->parts[0]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_128M - PAGE_SIZE),
+			    &mgr->parts[0]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_128M), &mgr->parts[1]);
+	KUNIT_EXPECT_PTR_EQ(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_1G - PAGE_SIZE),
+			    &mgr->parts[1]);
+	KUNIT_EXPECT_NULL(test, xe_ttm_vram_mgr_addr_to_part(mgr, SZ_1G));
+}
+
+static void general_pool_usage(struct kunit *test)
+{
+	struct xe_ttm_vram_mgr *mgr = split_mgr(test, SZ_128M, SZ_1G);
+	LIST_HEAD(kernel_blocks);
+	LIST_HEAD(general_blocks);
+	u64 kernel_visible = 0;
+	u64 general_visible = 0;
+	u64 used, used_visible;
+	unsigned int i;
+	int err;
+
+	mutex_init(&mgr->lock);
+	/* Only the bottom 256M are CPU visible */
+	mgr->visible_size = SZ_256M;
+	mgr->visible_avail = SZ_256M;
+	for (i = 0; i < mgr->num_parts; ++i) {
+		KUNIT_ASSERT_EQ(test, gpu_buddy_init(&mgr->parts[i].mm,
+						     mgr->parts[i].pool->size,
+						     PAGE_SIZE), 0);
+		gpu_buddy_driver_set_lock(&mgr->parts[i].mm, &mgr->lock);
+	}
+
+	mutex_lock(&mgr->lock);
+	err = xe_ttm_vram_buddy_alloc(mgr, &mgr->parts[0], 0, SZ_128M, SZ_8M,
+				      PAGE_SIZE, &kernel_blocks,
+				      GPU_BUDDY_RANGE_ALLOCATION, NULL,
+				      &kernel_visible);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	/* Straddles the end of the CPU visible window */
+	err = xe_ttm_vram_buddy_alloc(mgr, &mgr->parts[1], SZ_256M - SZ_4M,
+				      SZ_256M + SZ_4M, SZ_8M, PAGE_SIZE,
+				      &general_blocks,
+				      GPU_BUDDY_RANGE_ALLOCATION, NULL,
+				      &general_visible);
+	KUNIT_EXPECT_EQ(test, err, 0);
+	mutex_unlock(&mgr->lock);
+
+	KUNIT_EXPECT_EQ(test, kernel_visible, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general_visible, (u64)SZ_4M);
+	KUNIT_EXPECT_EQ(test, mgr->visible_avail, (u64)(SZ_256M - SZ_8M - SZ_4M));
+
+	/* Memory taken from the kernel-only pool is not reported */
+	xe_ttm_vram_get_general_pool_used(&mgr->manager, &used, &used_visible);
+	KUNIT_EXPECT_EQ(test, used, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, used_visible, (u64)SZ_4M);
+
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_buddy_free(mgr, &mgr->parts[0], &kernel_blocks, kernel_visible);
+	xe_ttm_vram_buddy_free(mgr, &mgr->parts[1], &general_blocks, general_visible);
+	mutex_unlock(&mgr->lock);
+
+	xe_ttm_vram_get_general_pool_used(&mgr->manager, &used, &used_visible);
+	KUNIT_EXPECT_EQ(test, used, 0ull);
+	KUNIT_EXPECT_EQ(test, used_visible, 0ull);
+	KUNIT_EXPECT_EQ(test, mgr->visible_avail, (u64)SZ_256M);
+
+	for (i = 0; i < mgr->num_parts; ++i)
+		gpu_buddy_fini(&mgr->parts[i].mm);
+	mutex_destroy(&mgr->lock);
+}
+
+static struct kunit_case xe_ttm_vram_mgr_tests[] = {
+	KUNIT_CASE(select_part),
+	KUNIT_CASE(addr_to_part),
+	KUNIT_CASE(general_pool_usage),
+	{}
+};
+
+static struct kunit_suite xe_ttm_vram_mgr_test_suite = {
+	.name = "xe_ttm_vram_mgr",
+	.test_cases = xe_ttm_vram_mgr_tests,
+};
+
+kunit_test_suite(xe_ttm_vram_mgr_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 83baeec2ef9b1..886b2712ff848 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -1303,3 +1303,7 @@ void xe_ttm_vram_debugfs_init(struct xe_device *xe, struct dentry *root)
 		return;
 	debugfs_create_file("vram_bad_pages", 0444, root, xe, &vram_bad_pages_fops);
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ttm_vram_mgr.c"
+#endif
-- 
2.34.1

