Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7764B606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 16:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aF7il8AK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA6010E314;
	Thu,  5 Nov 2026 16:57:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5877F10E314
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 16:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793897831; x=1825433831;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cfPjWnu0KREMBf7O7dbhX+u598ejZh7mUvj3M5CHnF0=;
 b=aF7il8AKxPeN/C/iqXBgqdz1sOY9Dnlmefmpz3MEuo9Y0Zl0Ja3EBR8z
 0AU3s85M74t2+MtFfFBQucPshHdo4KoASyvsbj3nmpwp87qiHq8OLEi+u
 rUQHnZMrUC49+mkAa52gTvncQSF7OdLz35jx4WNXlJ+12mV1kDpKQFbFU
 hDmPaSlAiqJHhK0q+XuteABFxWtHZNLQusaRylBR3FIuaroL4hVkVcgaZ
 BGrARxqDbYaG/BsQ3CtsUDfRH7aXgRunRDoMkJrM1XepgwvlxSQWDTeju
 SZjx/htUC2z6d3VgUAp/oIgrPSHuO6uPArBoj9+8pHdUkgrtvuW/cFnKA g==;
X-CSE-ConnectionGUID: zBkNe9PUQheUi2boxaIrvg==
X-CSE-MsgGUID: lb0X2VNgR4WdO0RjxYVXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2596137"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2596137"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:57:11 -0800
X-CSE-ConnectionGUID: DJOwc6VgTZqICCqyvs2D/Q==
X-CSE-MsgGUID: F9Jwu1rsS/ydjGkxbk73EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8824958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:57:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 08:57:10 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 08:57:10 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 08:57:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmJ/3L8zvT2Qs9LHiWv3ugkA1HOZqaRVNzmcjxV9p6qqZUX4wnH/sU7yIcAZDwb5IUnnRfxtVxYrfwzDZfq57gvZrs/qmG6ODAMlzVXsvXDLbvAGAlPNnNExZayjXsqZ7JrmV3JTQkg4V2vc03sfb1GCdGYjcsFnHJKuteLA5a7XsUEqOuJwtlmtQGjDZCVX07Mos3omHo2ZJXAXE3DCE4Q/AYJb64bS8YpYGonpzFtmth/EciUxcdbhJrkFf33YsUjZH3G3fSPknVMvBe3gdQpJuFezL/1OlEHB2Dv96iZfaLEh2Hw05I6didMM6usKwhqh/2iqSr4bXn+CCLq5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCz//xetSHcc7HkBGy5S+RL4tGoO4CFdqNScwlbICDo=;
 b=yTO42yPnDUfSYIz7rJjT/AtrSCiqs9fDhqu0FttmwJD1xkFBycbhLuxEJI8j3gyh+xgOvQrsXeNSZl9uoVW/gdSm69dXoLrrr0dArbRKamdgPmS6Cpi85VpYQy+MUQvufrEul/A1mYnF1TQszmyHAsamMLUvhWd+Lt2O1vNej+zX3Y6P4hZgpUnW1YWJNKZeVjJysO/8mR2h/gXVTl6eo6Bx9fzdOBFkFuq3Jlv3P9/NWB1VljsyDqzVngWgp2MnED+ybU6iM8WwrjNc9F7XSKxzQiGNT/bt9+y6gO6gflJQmdboItj2ZxXSBLz38unjzW1FJTexrY1ASTxLnJ5JPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by IA0PR11MB7257.namprd11.prod.outlook.com
 (2603:10b6:208:43e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 16:57:07 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 16:57:03 +0000
Message-ID: <4ddcd705-a947-4781-9b7c-10e5302c0c1d@intel.com>
Date: Thu, 5 Nov 2026 22:26:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/xe/hwmon: initialize fan-control backend and
 table cache
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-2-karthik.poosa@intel.com>
 <1750b7b2-cc7b-4018-9a4d-9caac9dc11bd@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <1750b7b2-cc7b-4018-9a4d-9caac9dc11bd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0119.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::19) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|IA0PR11MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: fed39d81-b0f8-4f40-303c-08df3b5dd0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|6133799003|18002099003|22082099003|11063799006|261022105027099003|56012099006|261102123227099003|4143699003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261009223027099003|261022113327099003;
X-Microsoft-Antispam-Message-Info: ZZYQlF0GCqrIo/WaIvF4S9+A5esIRkkdFGqeFa7CeYhyYH+yjPedJYBZrk/ZhJ4ZGAzAYNQhusaazXgM66pEmwIQ+px6n1ql23lm2nLebrMbi8PaFCsO8XOdxVC9pqi2W2gCM/BqJoOsyb1WxSIVPZ5sGmHo+6UhsrTpxxAAVKIZKTKQfTH/mN2RTQSTZyH3G77vHQhx8kwtgUPxu7W1O2dh99i0oCwr4tTz3SeRNCK3nt74BaECLpgQsd8LDlCRVGrEQO+/mrEYISDqRhloJ/UVceYQRZedliz6jnVOycVn6MLdSAT8rt/7F87sDx+R9hAsheZvDow2PjbjNMsh/tgYApyZ04TllP/4DrnKH99PoyDwvSC4TVbmNczbHfBIRnxmB3+eGWQBYOMck08v6gbFzmY5yOoyXKLDmK92GHQ0nimThp3Tn1CCP8hgYK1bNq2MHrtMBGHqOh4ysxBmKtrvK/NFRJQv7euF04PBLqiJPQ5qARDF84HA7Lpnmr/uzymE35m5pcwauIlqeAUVhLJ8DchbOemI3fUA1mJUFBAufz70cllQV7h4k8DSvnZ/3dRGGH8E1YyR+hgCmRhGh2fpfeB22Bt7ipb+IgmzwAfgqzhbv5eiAjD9drLTZgUzvaGWtmdJzCIYdEFhUTbZzpD8ATkRzR33L6THqa9SmM4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FT1PR11MB960200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(261022105027099003)(56012099006)(261102123227099003)(4143699003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261022113327099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFlxaTNvMm5DMGVRem1KTnpML09SS3RqOXJRRGRCMERzMUF1UzEwa05xeS9K?=
 =?utf-8?B?cFZWS0dmRFg1eUE2YlFhNXQrS1NscDcrdUtkclVVeTNic3JFYitHd2tFMUd2?=
 =?utf-8?B?Q2NiYVRDMUZHV1lrem1oSW5taitFWHJUSlNWWUtEMFJFNjNjeHVHYmE4SUwr?=
 =?utf-8?B?SWg0RmYzU0lORzJibVg0OUl6ZjNOZU5qckFybTBVVkhmbmxqKy9jdUhFczZ6?=
 =?utf-8?B?NXJ6L09HZ24zVmtPZVVpQmtuNHdsZ0pNMDltSHorbU80NFhBUEt5K0p4K2w4?=
 =?utf-8?B?akFidklMbjdQcloyT29TL2JOUThoT3RCdlRmbzJnTWRhOFVBYXhhOHZEa1BH?=
 =?utf-8?B?K3lwZUhtT25NTXdNUVYweWxBK1dIcmMreVg5dmxhUzRITjUvelFvNS9qUzlP?=
 =?utf-8?B?YStPRUFTWm14eEFEVUgxUjZLMTdRUXNFQVB4TC9JTkNGM2k5STM1bGZHL3RG?=
 =?utf-8?B?SDdPR2pvVmJiekp5dW5XaTdJOGlvSDY3MkFzYWh3VlhBODNMMFExUHRBM0pM?=
 =?utf-8?B?b0krZDM1bi9rKzZJeUhXc2dxR0VockRCV1ZiaDg0endNazdSUmlRMkJTS3BS?=
 =?utf-8?B?MkE2Y0pFYkNsTjIrRys1S1hyT0lLSkJwc2JEazh1U3ZKNFMrc3FFRWZZRTJX?=
 =?utf-8?B?N2FLM25PQXB1YjBKTTFvRUhmSjFkS0ZENUEwOXdQM0lndVAydmM1cG02cm1i?=
 =?utf-8?B?Q2VpdmhzOG9mbzMvdmFWSmh5c2M1SzRiWExNTHIxMGVVbjBvd0x1V3NJMUhU?=
 =?utf-8?B?L08vWjNHQ01KRzhFS3pHbkxNd1hHZ1VLWGpCcVlYSGRnenZrdllpLzRtdmM1?=
 =?utf-8?B?Ui9HaWdkU2Q0OW50OHE4c1p5WjA4cytjejFCdmJSdFFLVW9OVlh0bkVYVFRu?=
 =?utf-8?B?Y3hHOHVmQU1XRE0rSG9kVEZJZEZQREVrU3ltWG9tSkhHMitQVXUxdEJ0by9o?=
 =?utf-8?B?QTd1dTh0T1ltTDZRUGJ1ZmpycFJRUEIzeVBPTDhPeDcrb0tjMEdaalZPU2Zt?=
 =?utf-8?B?MmdZQTF4WkpKZDM2bFgyd3k5RnpMM01uaVNkMVZnTnMwZkR4a1gveU9QMDJD?=
 =?utf-8?B?ZzNBUGZnMy85cFdpZmEzVWdnTi8xbnNYSE4wMzFCRkRSUC9PSk1HRTJYRlJW?=
 =?utf-8?B?SElja0RqVHZSa3BPRVNZdUVIMThIUDNlTTZodXd6aWJ3QkppblBwSkVZWDRL?=
 =?utf-8?B?bS9YenkzenpJTEwrc3BDUGp3WWVaVGljeit2Z0R6VVkrR2U2MDNhNEhETzZ3?=
 =?utf-8?B?RDVqd0VXQllhS2JXb0UyaitIcldRMWRTZllubkh0WjlMaUk4TDRwblRXQS9V?=
 =?utf-8?B?dVorM29TWWJ4cjFvTHdwbzE5RExsNVdZanFsQ3RkczUzTDFGOVkrcHN3Zkh4?=
 =?utf-8?B?cEVVUVh3ZWJCOEc5d0V2WERDMVVsSEZFTVZSOEc3KzlLTG5DN09IZlh2VE5x?=
 =?utf-8?B?ak9ySm84MUJKUENmRWNyN2h3elNLbHo1SHhZZDVDL2ZTRlh6NWcvTnlvS0o2?=
 =?utf-8?B?anV2TCtJTGNuRVJWLzZjcktzTXdkSVJSM0x4a2tEV29LRzRvbDRQYjB2ODM1?=
 =?utf-8?B?SDJkZ09IOFNyZHY5OXFWbmtqMEd0NWN6N2ZyK0VqbHZMWjQyM1dxZkN0alBk?=
 =?utf-8?B?cVhFTWQ3YUZaUGxQM1I2WDFqODNLVHFqTnk5bVR6dzNTTjFkVnJrbit3dlkr?=
 =?utf-8?B?L2pra2Y4K0psWGVUdFhLTkg1a1k4QXJqa1FGS0ZnVzBhWTBHRkIyejNpWmhN?=
 =?utf-8?B?SncyRSs1TXJ5Q0E1MDdqYWM2TGJEZVU4czVrMERXUFNBWkNMVVNQbG5hK1Ey?=
 =?utf-8?B?RmFVTGxDUlZQckhXK21Bc2FKR2hPRStMY3YrSGZ1WXVnMFd1aVdUWWQ3dy8r?=
 =?utf-8?B?c2lCWnIvQ0VBT0RwdHFqTjk0VEdSSEJTZGM5azM5aEoxRFBkeHV6U2hGZ1V4?=
 =?utf-8?B?ZVYvaUsxQ1FXcSt2eU8vamcveDQ4ZXFSS0pWM2dRSWRCZTNJelFwL0FwWURs?=
 =?utf-8?B?ZUE2MnliTUdTbkhFV2xqRkUyYUxqNDlQZkdJWVBJbHcxL3pRQ1dJdGpFVXpm?=
 =?utf-8?B?WGJlQUJyV1pYMHVZMnp2eUVTdzRrSTQzK3F3SUc3VmxLS29zNjhyMUhIL3V4?=
 =?utf-8?B?bVk2RGFqWCtZeXZHdWFyYkpSZmg4WC9FVjRac2J3R3dmS1FXS2tUVldPWEJq?=
 =?utf-8?B?U3hPWmYzRTd3RlJLbjc0Q1MwdWY2bThCak1FQmJoNUxrM2h5VDM3NVovZ1Np?=
 =?utf-8?B?c0g0S3JFOEx5RjdBajIrRzVwSUtlVzFMbXphVVNwdEtOQ04vYkxHSTlMOC8z?=
 =?utf-8?B?VGExQk1NdDVBdUpwekJPYnV6c0h2RitkTk9nTmV4YnBjWG5IRGVEQT09?=
X-Exchange-RoutingPolicyChecked: UhsxCcSbcT8cX6NljfeoSdT3P5tQYOco7hZf3kQBFGgG0WrG7fAh/uMYN1WoDIaq8y6sCXWt5hPI4yrBY7lalUQ6VTAAHJvCmZiUpi+RVF4T8+DI/O7H481wVpgBcqMcQ1U8pPo9rDXGnYM/PDSWKYEmir0ajZ0BXfAC2Me/mfy2QvAtslg7E41L0Yo0SBacaycG+MLojW7L+0KrKGccMPar0NyHtI5nBeIYfTVXHPhzVsZc6rDH5vpAPOo+YQ20zeFboRDLe2GoLxLui8lvfNmzKx79NIP+4nAqTno5mukfFWl4Jfme7Nl/3x/6qi7eRqpiOdtEcS71jXnKLm1WXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fed39d81-b0f8-4f40-303c-08df3b5dd0ff
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 16:57:03.7582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTyXFHGzrY/Y/UgNvfUoVyC4zOCRo+KbpxiW4DnKJDYRbOsw3vpUDrC2lIIJtR8zYMZtjh1WS+L0tKcW1AmNFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7257
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


On 05-11-2026 11:28, Purkait, Soham wrote:
> Hi Karthik,
> On top of the previous comments kindly also address these:
>
> On 16-10-2026 00:37, Karthik Poosa wrote:
>> Initialize Xe hwmon fan-control support by detecting fan count,
>> reading stock fan control points and min PWM.
>>
>> v2:
>>   - Avoid user table initialization during probe. (Badal)
>>   - Move unused code to appropriate patches.
>>   - Use xe helpers for dmesg logs.
>>
>> v3:
>>   - Rebase.
>>   - Refine a few debug log messages and comments.
>>   - Update xe_hwmon_read_fan_control_info() to return on any stock table
>>     read failures.
>>   - Avoid returning when num_fans is 0 in
>>     xe_hwmon_get_preregistration_info(), ensuring thermal mailbox
>>     initialization is not skipped.
>>   - Remove XE_PCODE_FAN_CONTROL_TIMEOUT_MS which is unncessary as 
>> default
>>     timeout itself is now 10ms.
>>   - Use xe_pcode_read() instead of xe_pcode_read_timeout().
>>   - Rename fan_control_point_count to point_count in struct fan_table.
>>   - Resolve kgdoc warnings.
>>   - Add valid check for stock table fan point count.
>>   - Use the fan-enable bitmap reported by FSC_READ_NUM_FANS when 
>> enumerating
>>     fans. This avoids assuming contiguous fan indices and allows 
>> masks with
>>     gaps to be represented correctly in the hwmon interface.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: LLM
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c     | 167 +++++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_pcode_api.h |   5 +
>>   2 files changed, 157 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 42acfeb8818c..f2bd20f8b0a2 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -21,6 +21,7 @@
>>   #include "xe_pcode_api.h"
>>   #include "xe_sriov.h"
>>   #include "xe_pm.h"
>> +#include "xe_printk.h"
>>   #include "xe_vsec.h"
>>   #include "regs/xe_pmt.h"
>>   @@ -137,14 +138,51 @@ struct xe_hwmon_energy_info {
>>       long accum_energy;
>>   };
>>   +enum fan_table_type {
>> +    /** @STOCK_FAN_TABLE: firmware-provided fan table */
>> +    STOCK_FAN_TABLE,
>> +    /** @USER_FAN_TABLE: user fan table written through sysfs */
>> +    USER_FAN_TABLE,
>> +    /** @FAN_TABLE_MAX: number of fan tables tracked per fan */
>> +    FAN_TABLE_MAX,
>> +};
>> +
>> +/* Check if a fan is enabled based on the fan_enable_mask got from 
>> FSC_READ_NUM_FANS. */
>> +#define IS_FAN_ENABLED(fan) (hwmon->fan_enable_mask & BIT(fan))
>> +
>> +/* Maximum number of fan control points supported by each fan. */
>> +#define MAX_FAN_CONTROL_POINTS    (10)
> Why within parentheses?
used them as a defensive macro convention, so the macro remains safe and 
consistent if the value is later changed to an expression.
I think we exclude it.

>> +
>> +/* Fan control point index: bit31 selects fan table type; bits30:0 
>> control point index. */
>> +#define FCP_INDEX(FAN_TABLE_TYPE, POINT_NUM) (((FAN_TABLE_TYPE) << 
>> 31) | \
> Nit: use lowercase macro args.
ok
>> +                        ((POINT_NUM) & REG_GENMASK(30, 0)))
> Should GENMASK be use here ?
Yes, REG_GENMASK(30, 0) is intentional here to ensure POINT_NUM is 
restricted to bits [30:0] and cannot affect bit 31, which is reserved 
for FAN_TABLE_TYPE.

>> +
>>   /**
>> - * struct xe_hwmon_fan_info - to cache previous fan reading
>> + * struct xe_hwmon_fan_info - cached fan telemetry and control state
>> + *
>> + * Each fan keeps the latest tachometer sampling state along with 
>> two fan
>> + * tables: the stock table discovered from firmware and the user 
>> table managed
>> + * by hwmon sysfs writes.
>>    */
>>   struct xe_hwmon_fan_info {
>>       /** @reg_val_prev: previous fan reg val */
>>       u32 reg_val_prev;
>>       /** @time_prev: previous timestamp */
>>       u64 time_prev;
>> +    /** @fan_table: fan control tables */
>> +    struct fan_table {
>> +        /** @point_count: number of fan control points */
>> +        u8 point_count;
>> +        /** @fcp: array of fan control points */
>> +        struct fan_control_point {
>> +            /** @temp: temperature in degree celsius */
>> +            u8 temp;
>> +            /** @speed: fan speed in percentage */
>> +            u8 speed;
>> +        } fcp[MAX_FAN_CONTROL_POINTS];
>> +    } fan_table[FAN_TABLE_MAX];
>> +    /** @min_pwm: minimum fan PWM */
>> +    u32 min_pwm;
>>   };
>>     /**
>> @@ -193,6 +231,8 @@ struct xe_hwmon {
>>       int scl_shift_time;
>>       /** @ei: Energy info for energyN_input */
>>       struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>> +    /** @fan_enable_mask: bitmask of available fans */
>> +    u32 fan_enable_mask;
>>       /** @fi: Fan info for fanN_input */
>>       struct xe_hwmon_fan_info fi[FAN_MAX];
>>       /** @read_power_limit_from_pcode: pcode accepted power limits 
>> write for the channel */
>> @@ -1075,17 +1115,112 @@ static int xe_hwmon_pcode_write_i1(const 
>> struct xe_hwmon *hwmon, u32 uval)
>>                     (uval & POWER_SETUP_I1_DATA_MASK));
>>   }
>>   -static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon 
>> *hwmon, u32 subcmd, u32 *uval)
>> +static int xe_hwmon_pcode_read_fan_control(const struct xe_hwmon 
>> *hwmon, u32 subcmd, u8 fan_num,
>> +                       u32 *uval)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, 
>> subcmd, fan_num),
>> +                     uval, NULL);
>> +}
>> +
>> +static int xe_hwmon_get_fan_enable_mask(struct xe_hwmon *hwmon)
>> +{
>> +    int ret;
>>         /* Platforms that don't return correct value */
>> -    if (hwmon->xe->info.platform == XE_DG2 && subcmd == 
>> FSC_READ_NUM_FANS) {
>> -        *uval = 2;
>> +    if (hwmon->xe->info.platform == XE_DG2) {
>> +        hwmon->fan_enable_mask = GENMASK(1, 0);
>>           return 0;
>>       }
>>   -    return xe_pcode_read(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL, 
>> subcmd, 0), uval, NULL);
>> +    ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, 0,
>> +                          &hwmon->fan_enable_mask);
>> +    if (ret) {
>> +        xe_warn(hwmon->xe, "failed to read number of fans, 
>> ret=%d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Check if fan mask exceeds FAN_MAX and log a warning if it 
>> does */
>> +    if (hwmon->fan_enable_mask & ~GENMASK(FAN_MAX - 1, 0)) {
>> +        xe_warn(hwmon->xe, "fan enable mask exceeds maximum 
>> supported fans\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    xe_info(hwmon->xe, "Number of fans detected: %u\n",
>> +        hweight32(hwmon->fan_enable_mask));
> Should be xe_dbg?
i'd prefer it to be xe_info, to know number fans present, also this 
would be seen only during probe, so i think it is fine.
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    int point;
>> +    int fan;
>> +    int ret;
>> +
>> +    for (fan = 0; fan < FAN_MAX; fan++) {
>> +        u32 stock_fcp_count = 0;
>> +
>> +        struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> Inverted xmas tree.
ok
>> +
>> +        if (!IS_FAN_ENABLED(fan))
>> +            continue;
>> +
>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon,
>> + FSC_READ_STOCK_FAN_CONTROL_POINTS,
>> +                              fan, &stock_fcp_count);
>> +        if (ret) {
>> +            xe_err(hwmon->xe,
>> +                   "failed to read fan %d stock table point count, 
>> ret=%d\n",
>> +                   fan, ret);
>> +            return ret;
>> +        }
>> +
>> +        if (!stock_fcp_count || stock_fcp_count > 
>> MAX_FAN_CONTROL_POINTS) {
>> +            xe_warn(hwmon->xe,
>> +                "fan %d stock table point count %u is invalid\n",
>> +                fan, stock_fcp_count);
>> +            return -EINVAL;
>> +        }
>> +
>> +        fi->fan_table[STOCK_FAN_TABLE].point_count = stock_fcp_count;
>> +        xe_dbg(hwmon->xe, "fan %d stock table point count is %u\n", 
>> fan,
>> +               fi->fan_table[STOCK_FAN_TABLE].point_count);
>> +
>> +        /* Cache the stock fan table for later use. */
>> +        for (point = 0; point < 
>> fi->fan_table[STOCK_FAN_TABLE].point_count;
>> +             point++) {
>> +            u32 fcp = 0;
>> +
>> +            fcp = FCP_INDEX(STOCK_FAN_TABLE, point);
>> +            ret = xe_pcode_read(root_tile, 
>> PCODE_MBOX(FAN_SPEED_CONTROL,
>> +                                  FSC_READ_FAN_TABLE, fan),
>> +                        &fcp, NULL);
> Can xe_hwmon_pcode_read_fan_control() be used here?
yes
>> +            if (ret) {
>> +                xe_err(hwmon->xe, "failed to read fan %d stock point 
>> %d, ret=%d\n",
>> +                       fan, point, ret);
>> +                fi->fan_table[STOCK_FAN_TABLE].point_count = 0;
>> +                return ret;
>> +            }
>> +
>> +            fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp =
>> + REG_FIELD_GET(FAN_CONTROL_POINT_TEMP_MASK, fcp);
>> +            fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed =
>> + REG_FIELD_GET(FAN_CONTROL_POINT_SPEED_MASK, fcp);
>> +            xe_dbg(hwmon->xe, "fan %d stock point %d: temp %u C, 
>> speed %u\n",
>> +                   fan, point, 
>> fi->fan_table[STOCK_FAN_TABLE].fcp[point].temp,
>> + fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>> +        }
>> +
>> +        /* Read minimum fan PWM */
>> +        ret = xe_hwmon_pcode_read_fan_control(hwmon, 
>> FSC_READ_FAN_MIN_PWM, fan,
>> +                              &fi->min_pwm);
>> +        if (ret)
>> +            xe_warn(hwmon->xe, "fan %d min pwm unavailable, 
>> ret=%d\n", fan, ret);
>> +        else
>> +            xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
>> +    }
>> +    return 0;
>>   }
>>     static int xe_hwmon_power_curr_crit_read(struct xe_hwmon *hwmon, 
>> int channel,
>> @@ -1615,17 +1750,12 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, 
>> u32 attr, int channel, long *val)
>>   static umode_t
>>   xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   {
>> -    u32 uval = 0;
>> -
>>       if (!hwmon->xe->info.has_fan_control)
>>           return 0;
>>         switch (attr) {
>>       case hwmon_fan_input:
>> -        if (xe_hwmon_pcode_read_fan_control(hwmon, 
>> FSC_READ_NUM_FANS, &uval))
>> -            return 0;
>> -
>> -        return channel < uval ? 0444 : 0;
>> +        return IS_FAN_ENABLED(channel) ? 0444 : 0;
>>       default:
>>           return 0;
>>       }
>> @@ -1858,11 +1988,18 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_hwmon *hwmon)
>>           if (xe_hwmon_is_visible(hwmon, hwmon_energy, 
>> hwmon_energy_input, channel))
>>               xe_hwmon_energy_get(hwmon, channel, &energy);
>>   -    /* Initialize 'struct xe_hwmon_fan_info' with initial fan 
>> register reading. */
>> -    for (channel = 0; channel < FAN_MAX; channel++)
>> -        if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, 
>> channel))
>> -            xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +    if (hwmon->xe->info.has_fan_control) {
>> +        xe_hwmon_get_fan_enable_mask(hwmon);
>
> Why the return value is dropped ?
>
> Regards,
> Soham
because we will however use hwmon->fan_enable_mask to determine which 
fan is enabled.
>> +
>> +        /* Initialize 'struct xe_hwmon_fan_info' with initial fan 
>> register reading. */
>> +        for (channel = 0; channel < FAN_MAX; channel++)
>> +            if (IS_FAN_ENABLED(channel))
>> +                xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>>   +        /* Fan control tables initialization */
>> +        if (xe_hwmon_read_fan_control_info(hwmon))
>> +            xe_warn(hwmon->xe, "Fan control tables are not 
>> available\n");
>> +    }
>>       return xe_hwmon_init_temp_info(hwmon);
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 00c4fc7d0124..0349b24a8259 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -83,6 +83,11 @@
>>     #define   FAN_SPEED_CONTROL            0x7D
>>   #define     FSC_READ_NUM_FANS            0x4
>> +#define     FSC_READ_STOCK_FAN_CONTROL_POINTS    0x5
>> +#define     FSC_READ_FAN_TABLE            0x7
>> +#define     FAN_CONTROL_POINT_TEMP_MASK        REG_GENMASK(7, 0)
>> +#define     FAN_CONTROL_POINT_SPEED_MASK    REG_GENMASK(15, 8)
>> +#define     FSC_READ_FAN_MIN_PWM        0x8
>>     #define PCODE_SCRATCH(x)        XE_REG(0x138320 + ((x) * 4))
>>   /* PCODE_SCRATCH0 */
