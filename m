Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94963606A321
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O4qSSkDT;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=F0Pa+QdG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5840010E0C3;
	Mon, 23 Nov 2026 09:48:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590F610E7A9
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795427272; x=1826963272;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yu8+g9tiZP+GgY5cs6Q6p9Euu4AfxzPV7THhwBdjcVU=;
 b=O4qSSkDTSMeSlJsAgGRB9zw4LRAUxftJjHTodFg0hM2mXnWlKxlXmQpk
 diC/HzaqNB+m7eCLGWRlbKb1ztM/2WohygFGUrHzutkUdUUkSx6OSRBCo
 YNIstz3WaLLlgsfga1h/EBJfvZS88UuLIJC6bUHtRUoxgzSViX8D1F7xU
 atca5VZTPovmpKQR/PTF30ZjdcTmsvwWhWllMhZ6u4rA/UXXHGGv0K32A
 sRpioecFeQKdr6Fo9Hf8P5xv/sqDWQPPTgJFCo8b0L5mi6/Iquwat/Zv3
 zC+qHRTKxqJT64ELZNpEV0b5kPfid7y9O4CBRtOiqsraP2BMAKx4K6Q1Z A==;
X-CSE-ConnectionGUID: Dc85m7qfSACZ5F6PgpmejA==
X-CSE-MsgGUID: KM32T7BRQhenV27Fo4449Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4271252"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4271252"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:47:51 -0800
X-CSE-ConnectionGUID: YE40N8SdT9e76+Blp0uREw==
X-CSE-MsgGUID: JOaItB5aSkC69YLe5SBKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11038524"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 01:47:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 01:47:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 01:47:47 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 01:47:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQIzHXbeLd3EJFsBLCi2r6QUj6PNWGJ3gKJyXz+hYlsgJqVF37OBD3nQZ0E2NtGHbg/RRYdXvezz5eA1CiERQx+NV4CxwefK2coBZly7iPIKwh1/2uxfzR79GkJ/y9fZjIevb2yIg448PTSFomWfLo5Qr4PXzUccyQMzlat8i9IjSHJRGXCndhHQMQ7oS2APAbl2k3SzrSXdtjZIREXN0S9QzO7yD3cL9hRsW5Cz78F1aqG0cb+an17uZjTEpgv2EsoWFsHMdnl8xjS5E0Udvt7qc+UVVuM5gIt2EeRKvmFBvjHgU2V/hnAcdF3RA0xSjufcrzEMkcVm0YaJZq2jWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5faGc0dhH2Kz8WFHYM8Bg1hus26ipdALWRkDqA6niI=;
 b=K6ElLQXqCCdki6IMwlKmhBernaJCWDVaOw7Mq7W/aQj8iXaga3o8k0GFeoT0UPC6eiy/MENDFwmSG4kjY8COmRMa8jUQKT/vTfYxK4/O57/LFfCBeA3fXmLQHacFy8idjFxjoP7gHrFjQvCj2wof75rRJLPL/BzZfXHHs5/GV8iVqdnftMCtdiIvEglLH7w0V/FL8ieDak3nfGv1mbSzUGAr8PtFaM7mtHpUtuA7CUR5PqDYhglOWpisxvBkN6LJW8Eju31SJQMxQn4aT20w9FaHPZc58bLJ/5cxQu3zAEgLkvWrgaOuqinLRgAgOwluEBsufIIYcKRl74rNCMTh6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5faGc0dhH2Kz8WFHYM8Bg1hus26ipdALWRkDqA6niI=;
 b=F0Pa+QdGc+6XGFpqe9jsl/khCeCe2ZTMXLzlwWZx6N3epF8XwE99rM43CcUD0jki1M0XlDKmpcNarwsFhF363sKjBeq3i5x4ynb7cBVUOpANUSv1c+d9tkOyXPiv8YGQuWsv4CgUZSQ1XiKFDD608hDnt6gLAdB2IBOJ0DgFjag=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Mon, 23 Nov 2026 09:47:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 09:47:44 +0000
Message-ID: <04a89126-f5be-4e7f-adde-0d2af844f932@intel.com>
Date: Mon, 23 Nov 2026 15:17:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_ras: Hint at application page fault for local
 compute errors
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <raag.jadav@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20261123091356.1877750-1-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261123091356.1877750-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab23376-c18d-49e2-56c5-08df4946d2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006|261028144727099003|261022105027099003|261026140227099003|261021121427099003|261009223027099003|261021123027099003|261009221227099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: ku4DWFPHdyMSJOHGMdTUXV5HMQpL9nMU4VNbaI75d0ZTsYc7hruJX5Blezx4z+iHtRtmgMXytwk7SvExsMVgIJ3O5VlcNwwWhTqj4/HdkLSXMLowEd/2P63CxlosKpWGF8IhhBFO04QlZrNKvCGZAq/JaiAsocYPloVh0e0mlmqsevpK3PUzBOQLzomp8PW/WpU4Knh+9OE3G1sOVEpuDBuPl4rjvrJoa0syokNjk7UzqEY4yuDcNDYCK43C9euiX2L/3ozwX8vsLQjnV8EBzlC1G+QgUxyqN8fmA5+y0ot+0KIuSpXwGbvJrFIY59o4sjLWK6fe1L3u7qmysPMlxLeStDrR0OIS9YNYY8LXhGwJ68shyLwFJOwkCfV9cNVficRHBS8JS3frVkKC1ilvCB0XtElqGtM8+AHcd/pvnwr36DjBsT5AH+46elHfoND5UJn/Ou2yHFeGGGHSHi+5CgI1ddfXhEeu6Reenjw/dBSHqehxMQffskQ8YMRkmEsMo1sdAQRL5NeFCOnUBDfrM9/tA+oU+86ZnHICrTf+QiMJ8sQkBbIj6jKn9Gu/kUTKG7Bv8dFakOz8cK4EsHsvjdZY/RozsaTROe/ybfDgiXATkICxrt8YHWKnRn3WljcK3DjRZ16wE56kzdnx8YkwgrS5kNRvrQeBFvEBzKb/pDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261021121427099003)(261009223027099003)(261021123027099003)(261009221227099003)(261102123227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OSt1YkRnM0Zjby9DSDg4K0hBQTg0RG51WDAyRURrOUlrNzNNaTZKeFRQV1ly?=
 =?utf-8?B?cFlLcTJVUG9lM1Y3V3JyVkM3a0pDN3lTMkhUYlM1L1BwVHBYQzRUc0N6SnIy?=
 =?utf-8?B?U0R0RUR2VzZZWXB4UXcrd3BlN2ZhVXhPN01mRVFtdWwwQjdIeHBjVU8yTytj?=
 =?utf-8?B?K2JzRXpMbkp1aTZLcWVjMnNTeUtjS3NXUjVVcDVoakV3bnU0VU9xeGdPdC9k?=
 =?utf-8?B?bjdlUUJxVnJDdkFhWDZUY3B6bVN3c0F1cVh1MWJ1WUlLMGlOd1Z2L3V0OGtt?=
 =?utf-8?B?WThGV0FJRnU2M0J1R2NZRit4VGJxeEoyKzcyVEdZbFcyMSsveWJDQWJzai9w?=
 =?utf-8?B?SGNFN2svOUxKVS9JdjlUbjhKWjJwNWZoTzRYVWk2RHp5YnNMcW9JWiszSVZm?=
 =?utf-8?B?VnREc2RXWnM4TWRiVFp0KzRXbEY3NGJIK2RUdU5HcEtVMjZTTmJSY0haclFn?=
 =?utf-8?B?K004cEpaeXd4R1lPRGZsRnFSZURiT2JNVE9OTEd5RHNVVmtvNFc1aUlGTHk0?=
 =?utf-8?B?eGdETmdITXBvY2J6ajQ1czVPMlI2eHBsNTVWK3ZJdXhrRnZpMVRQLzNyc29W?=
 =?utf-8?B?c2orTWh3SEVWVmxHVVR1T0dvd2FNV1ptZUhsbDVZVFlDSExnMXRKbUJTL2JH?=
 =?utf-8?B?REJ2eWFXZnFaaFdQL3Y5Y2ltY3V4Zm1VZTIycUhDQ3hrZURyUEJSemZKeVNM?=
 =?utf-8?B?MmpreGNrbzhQTkd3NEpQUmtja3IxWXBwc0NsT2ZMUHcvTC93cEJrM0lXNklz?=
 =?utf-8?B?T1FNM2UyeVNUMklYcDZubHZWWWlnd29UWDRSeWNRT3dLYzBIeVN4c0VWalNo?=
 =?utf-8?B?Zkg5WCtJdVFJMWl5dDFaY2NocEVTdFNjKzA0bWpnenNZOUVlVUVtYnR2b0ZZ?=
 =?utf-8?B?QlN3N0FELzhBcUV6U05lY3g2bHdGN1dNN3B2V3h2Vmc3WDF4eWRQTlhIQWRj?=
 =?utf-8?B?WmY2b2pPbnlzUDRnU3RWTlB6dnRaNldxbEdmQnlJYm9CZStjVWQycXV1eHc5?=
 =?utf-8?B?UFNYcGdnVzBJTCtGcVpWZC9mRmR0QWlMWU8wN1VsVDY3NzN5K2RyZ3p4bXBq?=
 =?utf-8?B?OVNtZW9LZk5pSVdJNHR1UXlEN2hmTjA3aHJjSWJCdGZRY2kzTHlyM0JKaHIv?=
 =?utf-8?B?ZUQyWndXTVhBNDZQbjlwbGZDMU5xNTZ1MlMxSFdNZEZYdEFrNUxRZjdqaDZS?=
 =?utf-8?B?b0dQbkVuV2dkRElYdW5IWFBJQWhyeDVCMTdsdWIxWU1jcjhJSnhuQm9kY3Ew?=
 =?utf-8?B?cnU5VVRHWVgwZWxhZFNJdUlldEpMVXdhQjNyQ1RFYk13NVpNQk54MUdyZ3ZK?=
 =?utf-8?B?bHlsMkhKWnVhaTBBZ0tOZWlTZHI0bDNHcHNUTGVjM3R4UkhGVG1jbFRGZzBl?=
 =?utf-8?B?cmx0bnh4Zmg1b2Q5TzdwWXh6REZ5c3VndjVqSCs3WjQ0Q0F1TFdvYlhRM3g4?=
 =?utf-8?B?NTNlQ2h3eTZQOW1PdHhrN2NtT05mMWRPWGlRcGJGV3B5NkpxN1hid3ltUlJR?=
 =?utf-8?B?VVVzMlJQSm9nMUx3c2I2dWRqaUFlNEFpN2ErNGwvcllSRlgwemQrOXZueC9j?=
 =?utf-8?B?bEJObHpzRDJnUWpsdVJ0a2N0a3IxNTk5U3Y0SGl2dzRlNmpDTGVsaHQzMTJO?=
 =?utf-8?B?b2VydW9qOTNaVkdtRVFHdEsxZllBMXhJL0JpelFyTDRkeDNzNTdxdVZGbkdj?=
 =?utf-8?B?STJiRk41eGdrMmxPc0JSMU4wcHhsQXFmMjNOeHZTTDBQckJzUmZOR1JKVWR3?=
 =?utf-8?B?ekMrV2VnWWNTRm9UWUxEUHYzSVhVYTUvQnBHZTVEclNITi9sNXQ3M3R4QlVk?=
 =?utf-8?B?dWxJdk9oQTZoQ2FjL2xGMStIRmtjbFVtSjBOTEZ1TmQ0RU9zaEw5bEY4dmdt?=
 =?utf-8?B?RWVrZk81NklYempkRlhBd2x5S1BkdFEyNmw3MEsvL3hVd0Z0ZHluNEpTYVNX?=
 =?utf-8?B?Rnp1aGh6eE1STzY4ak5ZaXdDQ3dXTDJFOHdjcTJFbVdERnBJRFl1Ulg4RWtP?=
 =?utf-8?B?aFQwaklMUElmVk5WYXBxN1EyaFI0RStNOTczKzlDTDIraHJHaE4wV1V3UklC?=
 =?utf-8?B?YmZFejFkNjFpMklIdjlrQ0Q3eHQxQ0kzZjlZd0creCtiREJzMXB6OVQ2cE51?=
 =?utf-8?B?eVltVi8xbDE3L0pEaTEwKzYxeHdsTmpGT09idEpiNkhoUGlxdVJlTmh0Z2x3?=
 =?utf-8?B?UUh0aS9ScURVRGpwdXFZRjd4VDJQd1BpRzF3NVl5K1h2NHR0Nis4UURVeFo5?=
 =?utf-8?B?dlk1dEh0clFCTWppdnVTcUxDTkhPSCttNTB1RUhZc1JxcHllaXVFWGtkR0NU?=
 =?utf-8?B?bFY3OVZ5THVPdUE4UUFraGd1MUNsVkVBS0YwSFpuMENGcDl2U1dlUT09?=
X-Exchange-RoutingPolicyChecked: BC3kbTOxC2hEizaiA5vqajBX40h6SI7Z1CKR4bFm2B7U1ez3Ire2CGTmd/UoFXmhLUJUHzZz8E6S0TVGA0A8Hbv4KJUSIrwyIitJjkkNwRuKasEniMryo9OLJO4lXxMX5YgKCY9UxnYhOxLmyeAE2yaFWxmInVH5cUsXbt44GW5C+nKHz3eFTcS6BbPIT6kiG9ydNQRr+2NrjLtO7KUesfp6h/JR1ESxzxQV7zlghJv309Tb4ksSKbvOVExfDazF6rp4O6g/qWOlC7TmR2bT5JOfbh6ZNGRoKKUOKuTw+L/5lQJtFxKvePqusXM2J6lzIEq11xUY7Gb2ojnGcSJCPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab23376-c18d-49e2-56c5-08df4946d2c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:47:44.4138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOS3SR4O2F4GqN9JzRxBDS7e8KhPvGwrfxTNe9IpUkUmcuAA1q0FsRCWraCGzRlbrhsQ9b14W30p8JhRUFKHkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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


On 23-11-2026 14:43, Ravi Kishore Koppuravuri wrote:
> Unhandled application page faults are reported by the hardware as local
> core core compute uncorrectable errors. Users reading the resulting SIGID
> 203 log treats it as a hardware failure.
>
> Add an additional log to the core compute error message for local uncorrectable
> errors that they are often caused by an application page fault.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>

Nack.. This is not the expectation. Local errors can be both h/w and s/w 
errors.
This should be handled based on error details.

Riana

> ---
>   drivers/gpu/drm/xe/xe_ras.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36..3371ddf5ddf4 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -39,6 +39,7 @@
>    * 2 - Global Uncorrectable Error
>    * 3 - Informational Error
>    */
> +#define  LOCAL_UNCORR_ERROR		1
>   #define  GLOBAL_UNCORR_ERROR		2
>   
>   /* Severity of detected errors  */
> @@ -583,7 +584,9 @@ static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_a
>   	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
>   
>   	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
> -		    "Uncorrectable error detected, type %u\n", uncorr_type);
> +		    "Uncorrectable error detected, type %u%s\n", uncorr_type,
> +		    uncorr_type == LOCAL_UNCORR_ERROR ?
> +		    " (often caused by an application page fault)" : "");
>   
>   	/* Request a reset if error is global */
>   	if (uncorr_type == GLOBAL_UNCORR_ERROR)
