Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF01CCF9E9
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 11:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3683510E315;
	Thu, 26 Sep 2024 11:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIvE6PgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAE510E315
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Sep 2024 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727349610; x=1758885610;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qMbNK6sGpIYTGkDndrNG7c7UmzzIH6D/gmjv/KPEhxE=;
 b=IIvE6PgYBdyS5yClb56t73aURwr/jLahtQhyPnjC3DsjkCILaimp2ifC
 4I6KuHmkV/aNIh63+PJduBJyJclFTus03VQGPC0Nv/9rjnxioRxvvvLp1
 vBA8ptrTIF6i7Sx0L4fDa1Ori2CvYi+dqKOmXtl0b8BT8TFzBqZpNLRra
 MgATcgaGoZQejHkowTu2TB/bvGC/BT+fbLbm3cpmumRXqvGB+L2U0pDXW
 2XkVpKSlD7mzllLkLCexbq8rhIfBkEJfiS2DLG2GT3uB23s5Lnzor6B6+
 wM7CdBLpeVxSY1R2IxzGxru5YOm+Ofa39T8fZkCF491MoiJ18Bq4oXvH/ Q==;
X-CSE-ConnectionGUID: oT+CH3OMRAWpYy7S5KBsWQ==
X-CSE-MsgGUID: LseghgtGTXGZIHP3IJuRqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26386219"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="26386219"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 04:20:10 -0700
X-CSE-ConnectionGUID: P/MD41grQ2SRnt1kgwDV1g==
X-CSE-MsgGUID: 46zUq0DnQjeRRqgy+D8PXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; d="scan'208";a="76887866"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 04:20:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 04:20:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 04:20:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 04:20:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 04:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjsIHxQSvhUh/T/hlRx9rjkCGzH075sqN20dcoGUGyw9M4S1YXeGevEySxX4b2yJo1e7Vn+0i9U/w5+COY4CmjuatZMs+GQxQm3i5FKYtrqeVYXTcUOaLpTzoXspVQE3TlKYJVbh9GgCR43+HOuHe1ooSTa5P9nTJt3CYFbjOYDiutT7SyIxS0O/YZqlS5mFAVzVhdhk/tULymD5Y6wQnhnGZHmNUNrx8H/TLd0mMJbtPHatQExRf3wC++nBw/8o5w4BoHTj8WBT9Jp3P0TD5KyG5gm96/h0oejet3ymJWeyR4IXRIVQTUCTfaMpWfIoKlDOLLI6XMx/8Pv5CjeE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIseVXeh8nSdvoBiyniLrMNu9f0SZKIoIMsQ8sq8Oq0=;
 b=I/cdq7P2TDMtJJq1WMY9Yq8lClsg9Jn2DhU5jWSaKc3Pr8qN+y2k/oym3dI3oV3kJ8hzDOxPCrG69nWnmQxFG24BhL+lVVmB96+YKLs7+mrVsLYMyCo6pncTE1b2FPub9KwM21JM6IJ+KzI2LnJqTb89ozguu9lIFvjKzh3jPvpo0Li7p9He7rkOOG4PL33kZHjD6ofKY8mcjBM2uHxKOmBZtQdIbc4tONLG+CZYTL39IJoT1u0CxBozxl59aZDnv8YVGOx0pnC7SJ7vrn4Mh0JWPr3dKmG/C+yP0sz3I+4NXEHVkje/TbUmEJQE3sgQNguH8DGI33GAmJUjqUNVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by LV8PR11MB8770.namprd11.prod.outlook.com (2603:10b6:408:202::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Thu, 26 Sep
 2024 11:20:05 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 11:20:05 +0000
Message-ID: <9744a79e-17cc-4830-ac48-0b783d99ed8f@intel.com>
Date: Thu, 26 Sep 2024 16:49:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check return values of functions in
 xe_gt_shutdown()
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 <apoorva.singh@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240926110026.407383-1-apoorva.singh@intel.com>
 <51d67f36-5acd-493f-b81e-5381af3884a5@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <51d67f36-5acd-493f-b81e-5381af3884a5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|LV8PR11MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: c80fe161-78ed-4e33-cc27-08dcde1d2bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTVUVzRzRk1hRHJSVkhCYlcxcVBNa1haYlNEUjVUZkF6TFNuWmNuaUR6Yy96?=
 =?utf-8?B?ZTI0Wm1qNUZwSHp0eDJKbk5UTjRuVno0UkVIa0dEWUN1akYwQmdrNjd1QWZp?=
 =?utf-8?B?dnc1am9CTjhRSC9GNU5Pc0ZUc1lDdXdFM3BMcC9kU1Z1N05XaEZEeWNnNGFB?=
 =?utf-8?B?RGtReE5tWnNKV2pQR3ZRUU1KV1piQWpnV0pZS2hIOXN2OXIxNFdpN1BicXpH?=
 =?utf-8?B?QkViMytML0JlSStwV053NnRNVjRndjdyNjJOSGhSRFUyVlhTRmNqRVpXVzBm?=
 =?utf-8?B?eXlBY1lVc1AzTWVpRWtXVDlvU1VMY285azkrRzN5RWNuR1Jobm9peEdmK3NH?=
 =?utf-8?B?MCtpWXM2QWFVTjZZVjFheE1YRjNEMDJsMWMxUHhYKzNLK094RVc2YnBybFdK?=
 =?utf-8?B?WW45NGgzNHdrS0FxZ2U2MXpFeFFncXFEeFJTQ1QyaytIM3JJc2pjLzR0TGJm?=
 =?utf-8?B?Z3pvamc5NWlDYjB1ZUFrUXJudVJ5dEU0K29pN1lyTjh1N1Ftb2p5ekhIYnRZ?=
 =?utf-8?B?bnFmbUs4RzFreTdpQzNhS2tmYW5FSUZoNFdjNHNXYmR4cnBBZ3dBcFNaNHRz?=
 =?utf-8?B?OFEwMFhyaGkvVVhEbURvSkJiemJBK1JuNmZNN25HRzh6SFVKS3BrUkNEWll2?=
 =?utf-8?B?R3BVOERuTG9sZmJkQ3p0d2JudVlEZ0dtcm93YmdGL3lLYVQ2V3BJaHBtQnlI?=
 =?utf-8?B?dnoxVHhzVE5zdzgwTnVqeEs4dnpEN0VGYmViS1JIRzRxL05ReXV4aUgxc1F6?=
 =?utf-8?B?aDdiL3dJVllSTGMyOWZVcytFRkVtTmhheDNqYkNWQjdTOHBKdDNuVlpXU1Vi?=
 =?utf-8?B?UC9YaE9yWThRdWowUmQyd004TkxrWUZEWlJsejlUbFBzaHpTeDQzZWV6b2lp?=
 =?utf-8?B?NDhIdmFzNzIyeFA1b2ZPbkhiTGg3dVZjcEJIYjh3THJ5enJtQThmcWJOc1Vr?=
 =?utf-8?B?RUU2OHBiSEhTbUxyOHhPbE8vVkNIOHRvVWViQ09iR2RvRWY1NlNCM2ZwczVz?=
 =?utf-8?B?SHZ4RXFTVVRrT0ZpeFZKR2JsZ2xrT3JJejI5blBLMkt5T2Q3Uzc3U3BKemxi?=
 =?utf-8?B?OXQ2MmhZTWRXSFAvL1JDMEV4dTMvWmN4VFI5OXFvTk9EYnp1NjNMck50blhF?=
 =?utf-8?B?RFJIb1c1dFBYZitOcE9pVWRGZ2NjbHR3dG5xZzUvczBRMjZIRHhhclN5VU1X?=
 =?utf-8?B?Vi9ZaDA3K2NndUEwNk5WeE9yOUhIVE1WS1krNWNwWDZHQTRPR3NHUUVqQTZo?=
 =?utf-8?B?SWpUczZrR0lTS3I2RldIdTh2UmlTaTYvOGc1RGl1cUZIL2Myd0lZN29ydDg0?=
 =?utf-8?B?VTZ4Vk9HMWhIRXRaOW43d0hBemZoV21zMW91d2x2WmtEUFZIMnRGSjRzaWcv?=
 =?utf-8?B?MldmNmxQdG1SeVBkT2xSd3JhQlZpR212MFp1M2JkcHNNSWFxWXV2UlRNU2ta?=
 =?utf-8?B?RHRrRFVGVDdEYU5sRU1QcEtNNXlIMVJqdUVVZHZJYmJOakV2Nng1Uk43dGh3?=
 =?utf-8?B?cGtxU2RQWlFNandmTmpkMkgxWXV2MndsMTJ3UHdlWnNuT09lVkFuQ0J0RzBW?=
 =?utf-8?B?YldSdVNzZHpJTjdNVEFKL0xqMlV6WXZDRzQwZEV6bXV1WDR5dHpBc0xqb3Mr?=
 =?utf-8?B?LzIwQkRtbEtqRXRDYmg0NytySjNveTJZQzNYWERncGhLSlUrazZZVEVuREZv?=
 =?utf-8?B?aitKRkVwa2kyUkRCQ1NNeDJsUzhhZy9OaHU2MkJDbjd6anNlcGFvS3d4cHZi?=
 =?utf-8?Q?b17OrX0XH47CL2zz8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZncvN0MyZWczREoraFlYVTRWaWhpTjJuYTVNcUJQOSs1cHZEMGVscEhXeXFS?=
 =?utf-8?B?cjFoWnBlNUVxaVdYZTkxVGsvb1NQdzJrRUtjSGRYK1BwVEx0UlAxRHI4MlBR?=
 =?utf-8?B?UVVWeVRqcDFXa2hVWmhjYlI5di94MFpaSnZKRktnd08vbXM0NTlGcmpsUUVr?=
 =?utf-8?B?RUxKSmdWbUkwaUJ4QmtLZFBBczBROXhWTTJOTzFqWks2WldSNEtPM0twSEZY?=
 =?utf-8?B?cWd1c0xwSzdyZjU4RU1TZzIvWm05V1FLMnlkMkRJT2crRVBETW8wdWdTZ3No?=
 =?utf-8?B?bjZob0J6VHUzdWVPVkgvNUdvZzErV0UwVEU3dWR1dzJTc1JFZGt2ZzF1ZlJ1?=
 =?utf-8?B?dlM3UWtKUDNueE9QWjk1bmEvNmJXMldDVXpmT3N1T1hYcmlWbTJ0aWJUcVBP?=
 =?utf-8?B?a3FPNlA1Y3NJN29tVWZJMnpVRXBFSzlnMEtLb2tRczVrU09QeHRsS1hIQ1ho?=
 =?utf-8?B?TmZaNW0wSHZMQ3lrc1ZTcCt4emZLaENDTTkwZjRBN0tsYUdIY0xmK0t2TzMz?=
 =?utf-8?B?azFFQUk1Z0FOR3hEM2V1QUYwQXNJaHNPUCsvNDY5TGNCNUFpZlhRRmpjTnJJ?=
 =?utf-8?B?OVQyVkk1aGFyV3JBUFBUU2phOTBoUGRLT3dnYnU1WlFYWUVMak5FZHBqRDJD?=
 =?utf-8?B?aDRTQ0FuS2hhUlRPTStpM2E2VnBhSkxrWEVRNmx2dnJpMUpBZm53eFRBZHY3?=
 =?utf-8?B?MnBmRDhMNmtFRFo1aU5YdkNKT1NMbm9ia2R6alNGbWZEZlIvU2ZJdkNEU3lO?=
 =?utf-8?B?WXEvUDhGdzRKK2JoTk0vcU1adU4yT2Rnb0tDZ2hGdjNKdWsyUVhGY1g3ZFJZ?=
 =?utf-8?B?T2RpRFNzbDZiVStLWjJ6Q0pWYnpHak0zbFJHSDFzWHR0Q0h1OFJ5cWYzSUpX?=
 =?utf-8?B?ME15c1dIS01pMVpMOUhyRS9hOXdkTiswMmZMVkxyeVFuaW81VWxvUW5hUUU5?=
 =?utf-8?B?TklTNU1DU2IzcWtZdjhnZEFVbG9kRVdZSG81OTZXMFJvVkRxZEZQak1OaEU4?=
 =?utf-8?B?VDZlMTFVdUdsQlpQZG5wUHFyZHlqdTZoY01TbFJ1d1p6Q3lhQlNMV1NNVjN1?=
 =?utf-8?B?dzVGVi9jQURXVWhsS1ZUdVpPWFEwZnZJZVVVSTNmTmhhWmlBRlVZVExxUDIw?=
 =?utf-8?B?dXQ4eXVFb2RmcFN6U1lxaEF1MGxEUE12MDFKSzQ5dWpXS2w2UWJnQzQxMGhN?=
 =?utf-8?B?dnhMWDh2UGlMbE9tSzNVck8ycTNaQkpOd2lVdFVQbkFTa1pCaks2dE8vNWR4?=
 =?utf-8?B?TmJDeVJ4ZHEzU1kwMHlIWWN1bjJZN1N1VFR1cklxMjhuZmtsWmJTU0JZNlpT?=
 =?utf-8?B?bXVtQkIzSzdJZkR2cGNIRG12emR2K0VFdzY4N29zSStUMU9DS2xKdlJLL0p0?=
 =?utf-8?B?M3NjdUdSRmJwbkJ2YVA3ZWV3alg5WWh6WDFyRFpzQUpXM2VHT0QwdUJCV1Bj?=
 =?utf-8?B?aisvbzJEZ00wTVZSNE1FeCtrTnBIaWY1ZXNTcmozZEhPbzQ3QkN2REYwTXVL?=
 =?utf-8?B?MnNXcnRndDdRVG5OcHp5NFBqZTdzeThxUTF1NnJwdXZwc2hGQnlvbTNMU2Ju?=
 =?utf-8?B?SmdnQTE4clpURjhQcjArZEF0bU9pTVkvQ0dhc2xUandJSUFyWDBHcUxFQitP?=
 =?utf-8?B?UG5KVjl4WlFOMFlmSGEvcWdxaUc4U2tKd1lNZlhKQlZwTERQcHg4OFJzOFVi?=
 =?utf-8?B?a0xiallIL0xWMzJ4MldzNG1LSEd6aHI4WHRNSlNXWlMvMHhPRDZ5QmFHa0RP?=
 =?utf-8?B?UUpiWm5XT0FhQmRjaXZMekkyeklwLzJyUnFIUDR6WFFvMGdNdkZFTXpKbGNr?=
 =?utf-8?B?bC85US9oSEphblEzSHNBK1RTYituVkdWQzlYcUVOVm1JaE5GWTVWSVdGWU5o?=
 =?utf-8?B?dkV2RTR4dExLMkJVZGxwK255VGh3b3lVSTBkUzN5MzRBVFZWanRzejU0Z244?=
 =?utf-8?B?d3Q4b3VlajBOZ25CVXh5bTBWelJuRkZqNFhDdzhpU3l2d0RnVmwrc2dubXJu?=
 =?utf-8?B?THNWOUR6WFVpNFpVZFNGMEovVlB4M0pzMnFJVy8wekF0cCtRRGwveDMweVlH?=
 =?utf-8?B?RVVaUCtsSGl1cGwwSWZvMThRY3UzbjhCQUVwejVPcUV3aWcxN1p3Z3luYWc5?=
 =?utf-8?B?Q3hBcGw2d0o0YmxlSTFXZmlpQ1VSNmNBQWVYZWNYWElJYkJXQ1ZmSHo0SURp?=
 =?utf-8?Q?V7ga7HleVTBmpsJEaUn8BIk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c80fe161-78ed-4e33-cc27-08dcde1d2bb2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 11:20:05.1047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaQNy4urJaBaKH3qRxPoKZ8C6f5oO6KKzBXXMdkewSO9xjCCqiCUXseZ4fiTi3ZI26SyNksWEEBs9S709YKz4NS4v9ys31Przn3++4LwUdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8770
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



On 26-09-2024 16:41, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2024-09-26 kl. 13:00, skrev apoorva.singh@intel.com:
>> From: Apoorva Singh <apoorva.singh@intel.com>
>>
>> Check the return values of the functions xe_force_wake_get()
>> and xe_force_wake_put() to prevent mistakenly treating them as
>> void returns.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
>> Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 274737417b0f..317640554310 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -890,9 +890,12 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   
>>   void xe_gt_shutdown(struct xe_gt *gt)
>>   {
>> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	int err;
>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	xe_gt_WARN(gt, err, "Acknowledgment for domain awake timedout");
>>   	do_gt_reset(gt);
>> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	xe_gt_WARN(gt, err, "Acknowledgment for domain sleep timedout");
>>   }
> 
> There's absolutely nothing we can do with xe_force_wake_put, the only thing you can do here is:
> 
> int ret = xe_force_wake_get(..);
> do_gt_reset;
> if (!ret)
> xe_force_wake_put

This is wrong in current scenario. force_wake_get() fails but it still 
increases refcount. So xe_force_wake_put needs to be called here to 
decrease the refcount. I am already working on solving the problem in 
entire driver.

https://lore.kernel.org/intel-xe/20240924121641.1045763-1-himal.prasad.ghimiray@intel.com/T/#t 


> 
> Also no point in complaining, the hardware may already be hosed. :)
> 
> I believe that xe_force_wake_put should return void, there's nothing we can do except log the error here.

Agreed. Above series covers same too.

> 
> Cheers,
> Maarten

