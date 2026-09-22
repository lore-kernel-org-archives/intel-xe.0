Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E32BC98302
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 19:23:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB2110EE3B;
	Tue, 22 Sep 2026 19:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dG2kLZjJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F45410EE3B
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790104982; x=1821640982;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=T6a3ipIHBZs/2Nl7GI1qFDDlYSdy8ig9s2tQ1SNX/uo=;
 b=dG2kLZjJz79eeKf92c62lWJ7eY99OWdVWdTzpu+xmjrMWRMGiuTJW2R5
 N8WfQpCwmfWPYfGADF24t45CvJPMx9kdwI9pigLS1iBFvypQpmv+wlabo
 BTlkwFRTCabpsCYa9sFzn9Gl6QWTHd+2C3aQjhb35VeM/yjKfc/+Uo8OP
 imEkUoUh9ADsof6xLxybC9Jle1cOPoVA3h+vOav71l0YTw/+f5eZ/DAmu
 qKh34j7bWQ57LokQN+0fbIJvEvZquerHxdxb8OdgtXJ93ABNDMrASLvXC
 E7su+jNJ0Cjw8ouTdj1h+Wha24lrfrNQbcfMnG/6LRmGso1//BxrW4QMW w==;
X-CSE-ConnectionGUID: 4bf7wkgNQsKs82ieeZtUXA==
X-CSE-MsgGUID: zKGE7fEHQT6sUtlxw7IHyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1250743"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="1250743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 12:23:02 -0700
X-CSE-ConnectionGUID: tH/xLY1/RsaEyRGC2CjvdQ==
X-CSE-MsgGUID: uoUGr4VJQeu8DmWCbsM6EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; d="scan'208";a="281352407"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 12:23:02 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 12:23:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 12:23:01 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 12:23:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgWJtNNzii3lmaP+dzASA4tOelnC8FDdR3Nk45moiyU7hFpjwdT8o3OX45DdlFGl1hrqfBFcnEagZJob02NJsXQXStChIFzMiQxCvRnFDlVuTdgY2HTe8N+GDeimO3BLeIg02rAOLU1zPTbON/sprwHdQtZqNy/3rNlRWGMFn1euglUWoVLqvNnlt60I5oXlVJ0r+FF20SFp9C5745Dgaw7qmXg23x9YBDGBCl0Mw9ctG4Faehpklfo2q9WsQxG5lejBP/zqtht8nxMe/+MFzltaSviDFI+uVHNwsFUhpwS8EMMd6SDqIhIDAZuQnRi8L+hcyLr36g3DuwibFjvHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6a3ipIHBZs/2Nl7GI1qFDDlYSdy8ig9s2tQ1SNX/uo=;
 b=Aos1EKv14Ml9avg9B9KLhLucRl9Uny0aj6lC1MWJFQ7gMRsDpBP9qyv5o6AAKA9Td8fQbGWCVHpzr4AjMvapPr86ZKRFxctdTAJBquJT+2keNM7cRimi3J1LjIN7AsgBkGx2NHnT1AARGTqJMXHx8D2N3D5dBD9iqilkn+wkQJJ93lCq9JctPizJnN7GmmjPSiWsZ70iNx214FoJdh5Xr8bUsae5BkkL+RGZJPtiq6AW7CSHtOc44NP3LnitMyJOPy8bLZkSpEgeWruNxxju56P25+nWKnTX9FfjdS0UxiTZk6neuhQUlN16AEzPzEpNKnSdPPDMKJBrjmTfc5SUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 19:22:59 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 19:22:59 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "talesam@gmail.com" <talesam@gmail.com>
Subject: Re: [PATCH] drm/xe: Add and use TLBINVAL component
Thread-Topic: [PATCH] drm/xe: Add and use TLBINVAL component
Thread-Index: AQHdSraX1u0u3hYKNEOE4OAsWkEXMLba+h6A
Date: Tue, 22 Sep 2026 19:22:59 +0000
Message-ID: <ca660eb96bacc75620c6c58a521cc28c445ea9e7.camel@intel.com>
References: <20260922171911.500-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260922171911.500-1-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|PH7PR11MB6426:EE_
x-ms-office365-filtering-correlation-id: 65aeca9b-ff04-40f9-b8bd-08df18dee9d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|10067099003|11063799006|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info: PmiYAUg6z1rETySfMQF2SJLIsSsyOWJ1xOuarHoxbQoZlvGIQ/mLNI4fIuIuhePy1gKb8k+hcgu6yDpfjUTqWBeLyUj780Iwl7F8XInWYgOMWFtjw4iQUUSeNd127tjB8uYw3N1O6qIG3v0bwcEaKB39iDd3EfuIP2HrUHFqwm0M28jMzQe6HXbOW3AELHkFFrpaxEuDy5LhvQslYe1ctVfGTww7b6NEkxlz1HDCjAjjWL1IIF14ebgWUC+gd6r3cFUu8+SFzU+84KtcjGUHzMfATjcNEzIbC1yrU+hVmHiT0ctdnys+mpU3czcakFD/+3vE3I5VgEWmVgTHrGfghDc4r/AlFGuogfvxlnTNQVPaVTfwXYVqa3OhUsXFQQrLq9Sjp3qy+cv8aVMPMAO5Fltcv5d7TWHnVXjfBtlPTPEd2r+z/KhmJI4vKVHGvQPTPvSmYkFNoqGkuiQ5x3G4CzxXL8FTnd/k7dZpZRaP41bqlbhPMt6PHpkF4lGUklk29r8S0CvW3zEmdLX8N4/lrqoJVTVNYZp1issc/J6MoSB0CNq1vNaRxgfy0xPBsUjJAxt4mEtKNe77OeplYfp573Jp2dctRxPQTjIsIvLUtHwDvaBE/CFXdvIFT5Ejwz+iBvjVGDuyZ65u+jnqS6VRvuhJyRXHy60IJ1Bt+ILXLfqZHR1W9+aHr+upXfoJC29KpH+XtjezlwFD8E+T2A8FhHdb31BN9RzutF0CHEyTx4A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjVpNjU0T1BtK01UdjlvZm5UNC9nYWhVWXN3L001c2txeS91dDYwUGxpTWQr?=
 =?utf-8?B?SVYxT1RyZXVTNUpuQmo1eUlVakJsQkhBbEJHcENPR0c4elNmVVZFZ29TVFVz?=
 =?utf-8?B?WVo3azhMdjVMUk5zbkx5RkhweFpBTkNtSEM3V1BHUGUwdzJEbzRsQUJpcDdr?=
 =?utf-8?B?a0lUaUQvR3V1NHpwbkhSeFBZYzZIOTVkcTFlaFVob0hSUUxmMHlBQ0kwc2Zw?=
 =?utf-8?B?RVhDM1VhWkhLd3RwVXEyRzRZcW1rWjdVT0UxR1lScFA4ZDMxamhacUVjQkVM?=
 =?utf-8?B?UjduNzJZZXlwUHc2YUc2WDhUWmw5eHJvdjBQbWRHbkhmVkdpYUtodlJkMUE5?=
 =?utf-8?B?aXRrYUNXUStLOUVhZG92aklQdWdTczl2VW1JNHpQNUtnRkNFVks5UFFRcDhU?=
 =?utf-8?B?S2JDanpiWHZQSzZjdCtla0lZZ09jL2hacFFQemIzQUlKZmEvdzlTTGlsL3U1?=
 =?utf-8?B?SlFuVXNLVG4waDZFS0VrNVBjc1R0MUwvMWV0TDVqTGI2T1Z6a1NOQXRhdDZu?=
 =?utf-8?B?TjlBVXNvRW5qTzgxNkV5WWpQRGRmdEN5VGRnWkRRai90YldOWFJ5dXdZcnBu?=
 =?utf-8?B?TWJkUWpRdEhzUDU5WHRyQnJid01PWERpQ2NpcnUvcis2clVQRFVBbyt5dDFD?=
 =?utf-8?B?UmFWaXBsdDZOWTgxNEkxdTZXbnBrZkhOVlFWdklpbG15bjRobStjc1o5dkJO?=
 =?utf-8?B?cjc5VVlWTEQ4VWwycHpDSXdDVHNzR0ZLdkkzMkZYQkp5T2FsaWNvTUI3MHVD?=
 =?utf-8?B?R1F6a0xZNHJQZHdZZitRMHFtc2V1bzlod2J6MmNJRlJ4RVpSSFRmWjQ1eTBL?=
 =?utf-8?B?UkJZeFdMdUltV0VqTkRzUExualgwVlVNczM4VC9mNTRXd3o1VjB2SDJuaUtr?=
 =?utf-8?B?cndxS1hVc2djS1ZXeEJzUThjN1hzR2N6THdPMXVDWUJGd0Zoai9lQjRWRGow?=
 =?utf-8?B?SmdIMkRlcjNQUUxNR25XYWlkOHhiWDZranJVSXMyMHp1b0QxVEl6L1VkNWF0?=
 =?utf-8?B?NU9yWGh0aGxRUmh1OVYrUm85c3RVUFRnMWl0QllPKzJjdU1wb0F3ZDhtM1Nn?=
 =?utf-8?B?Z29WbE1Ea29qVjB1WnNtZi9FVnJaR256dWpXQjdtZ1FjekswaWVhWFJyNUNK?=
 =?utf-8?B?bVpnRktkdG05UWh0dDVkMjl0SFdockczbEZ0ai80OFkwU0xZQkl5V0EyWVo0?=
 =?utf-8?B?MnN1QnI4MFprNVNkaHVKbnRCOEhack9WaWE0N211ZG92Ym0yRy91OTZ6dXNS?=
 =?utf-8?B?blBOY0EzczNXMmd5dXl0eHp2UTNWS1NCeTZhQzdja3E0TkUyMkJGVUlXVjBO?=
 =?utf-8?B?dnFObG01Nk94T01Cd1lhT3JoS1hVQnF5RWhlU1hnV3hnd21jMWptUWlUcEpO?=
 =?utf-8?B?amJHUlBpOHlHeGtEbDNhYytxVUx6RlFERng2cXdFR3g3SkQrYi9IemZHa0Nh?=
 =?utf-8?B?elNrR21YazFTdnFqSXRacDJNSVV3cVdQYkpONXJXdU5KcklsRWJ6SDZHNngr?=
 =?utf-8?B?S215VUdZb2R5T3FhMm1uUm9TRDErTUw2T3ZlREFLTmxDd0JMSHozWU45YTJp?=
 =?utf-8?B?QXl5cS90ZXJsRlFSMzVzY3pTN0RJU0Q5RldSUUhZdmM3bENXM3ZYWFdCZDln?=
 =?utf-8?B?dE5TM0JqTjI5UkF0RGVVL3ZIZXRqaFF6ZG5ZWTBVTFZJYnVNZ29DVGttbWVn?=
 =?utf-8?B?UkRwbnJNZ2NzZ05zTGVqcHNjTHZPZGRqck40SHArVDYrQ1cxOWJYaG5iM05B?=
 =?utf-8?B?QlBZZThtU0pjdDdmTWFTK2JOREN4aFBqSW53NGVJUzVUNUw4UnZ6eTQzM1ZS?=
 =?utf-8?B?Yk5qQ2s5c0JCR2hpaHhiNG8rUy9BUytjUzRRaTBxT2p3SzFTSDIxOWtuUmVW?=
 =?utf-8?B?VksvUlN1SVRPOFlpejVseFA4TC9UMy9lU0JFa3duQnpWWUNOVmQzbGhJS2l2?=
 =?utf-8?B?Vng3c3M0bVdwaEduRVBocjFqWGtFcW10aXpQK2JRMWVFSnhNWUxhNkw0akl0?=
 =?utf-8?B?WVVHemJCVk9XRVVnLzEzYXJ0M0pyTXZlR3FKR2JFalNnTGJvSkw1OWJIdWtK?=
 =?utf-8?B?Z3ZUQk00MjRDY2FtbHFmeWtTbDdEUngyMXdYbk5EdnNJelJ0Y1FIdklyTDFT?=
 =?utf-8?B?QmQ5WjJjcnJoeHVYYkE1VEMxQ1NvMCs4S1dTejA4akRPOFV6cStqaVVlYjc2?=
 =?utf-8?B?ZTRHc2dhYU9KYUk3OW1xUExGZlhvcjdZelVFdWZiTzNiakx0Y0lzWnFwQTg0?=
 =?utf-8?B?MmgwWE9QVnBNWTYzQkRURDc4SzFHQ0hLLy9kMUhQMUxEWDhaeWNCbGlTNE1N?=
 =?utf-8?B?VEdJdnVkd21mbHdaOEZIK2RTYmEwdThEYllIZ2gxTnFqeWVNN1ArU29vQ0s1?=
 =?utf-8?Q?337QbLH81DDKv4hU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C78B925924B5F49A11D023A1D9B34FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qqki1MiKZiWruP+hhXIUjHIHUlOg2+eyCpDUsBiYZI54mWNNzmDaLMF9SiK2PvHXy0dL0rIiRstIxAIodGtvYO3+/qyeQHdvsWVtpXUMv+CY+eCtBeCyzawGAgWO0bKzfc1/4UbU0JHSaCHPW3ec8VfYk6U+dfscjOEEoRTFBBT/JIbhIaKt870m/xYfkQk1quthqZ8buC6Q5zn71YSHEPApDNV6HEmzGj3CjgIf8woM86W1OEbmq9yMzzsTb13ZlwyMtDcGim+wG371lBFOTX2/Ln398nxh2LEiaCvLWn87vRmF7CzTty8Lfn1V/b7+6g501gyQxRG8PLJ3DKSpfw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65aeca9b-ff04-40f9-b8bd-08df18dee9d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 19:22:59.4048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQo7dLSf8ZHmNwWfOPb2CynQbRD+xijmPqnsK3jejtDA/VpuqIW1OxQqqZW9ibzZTfujOwTAW8/dJodnl2Af8LWu9HjgJ4xKz1IYiXye9dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
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

T24gVHVlLCAyMDI2LTA5LTIyIGF0IDE5OjE5ICswMjAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Ogo+IFJlcGxhY2UgdGhlIGV4aXN0aW5nIFRMQiBpbnZhbGlkYXRpb24gZXJyb3IgbWVzc2FnZSB3
aXRoIGEgbmV3IG9uZQo+IGJhc2VkIG9uIHRoZSB4ZV9sb2dfZXJyKCkgbWFjcm8gYW5kIHVzZSB0
aGUgZGVkaWNhdGVkIFRMQklOVkFMIGxvZwo+IGNvbXBvbmVudC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtvQGludGVsLmNvbT4KPiAtLS0KPiBD
YzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+IENjOiBNYXR0aGV3IEJy
b3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiBDYzogVGFsZXMgQS4gTWVuZG9uw6dhIDx0
YWxlc2FtQGdtYWlsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9hYmkveGVfbG9n
X2FiaS5oIHwgMSArCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsLmPCoMKgIHwg
NiArKystLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvYWJpL3hlX2xvZ19hYmku
aAo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL2FiaS94ZV9sb2dfYWJpLmgKPiBpbmRleCA1MjZhYWRm
ODVmZTkuLmFkYjNjMjEyODI1MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvYWJp
L3hlX2xvZ19hYmkuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9hYmkveGVfbG9nX2FiaS5o
Cj4gQEAgLTE0NSw2ICsxNDUsNyBAQCBlbnVtIHhlX2xvZ19sb2NhdGlvbl9iaXRzIHsKPiDCoMKg
wqDCoMKgwqDCoMKgZGVmaW5lKERSSVZFUiwgNSwgV0EsIFNXLAo+ICJXb3JrYXJvdW5kcyIpwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoFwKPiDCoMKgwqDCoMKgwqDCoMKgZGVmaW5lKERSSVZFUiwgNiwgUEFHRUZBVUxULCBNRU1f
RkFVTFQsICJQYWdlCj4gRmF1bHQiKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgXAo+IMKgwqDCoMKgwqDCoMKgwqBkZWZpbmUoRFJJVkVSLCA3LCBHVUNTVUJNSVQsIEdUX1RE
UiwgIkd1Qwo+IFN1Ym1pc3Npb24iKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oFwKPiArwqDCoMKgwqDCoMKgwqBkZWZpbmUoRFJJVkVSLCA4LCBUTEJJTlZBTCwgR1RfVERSLCAi
VExCCj4gSW52YWxpZGF0aW9uIinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgXAo+
IMKgwqDCoMKgwqDCoMKgwqAvKgo+ICovwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiBcCj4gwqDCoMKg
wqDCoMKgwqDCoGRlZmluZShEUklWRVJfSEFSRFdBUkUsIDEsIFJFR1MsIElPX0JVUywKPiAiUmVn
aXN0ZXJzIinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFwKPiDCoMKgwqDC
oMKgwqDCoMKgZGVmaW5lKERSSVZFUl9IQVJEV0FSRSwgMiwgR0dUVCwgSU9fQlVTLCAiR2xvYmFs
Cj4gR1RUIinCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuYwo+IGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3RsYl9pbnZhbC5jCj4gaW5kZXggZGQxMDMwZGU5YWI2Li5kYTYyOWQ0MTA4MjkgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbC5jCj4gQEAgLTExLDYgKzExLDcgQEAKPiDCoCNp
bmNsdWRlICJ4ZV9ndF90eXBlcy5oIgo+IMKgI2luY2x1ZGUgInhlX2d1Y19jdC5oIgo+IMKgI2lu
Y2x1ZGUgInhlX2d1Y190bGJfaW52YWwuaCIKPiArI2luY2x1ZGUgInhlX2xvZy5oIgo+IMKgI2lu
Y2x1ZGUgInhlX21taW8uaCIKPiDCoCNpbmNsdWRlICJ4ZV9wbS5oIgo+IMKgI2luY2x1ZGUgInhl
X3RsYl9pbnZhbC5oIgo+IEBAIC04Niw5ICs4Nyw4IEBAIHN0YXRpYyB2b2lkIHhlX3RsYl9pbnZh
bF9mZW5jZV90aW1lb3V0KHN0cnVjdAo+IHdvcmtfc3RydWN0ICp3b3JrKQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+IMKgCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0cmFjZV94ZV90bGJfaW52YWxfZmVuY2VfdGltZW91
dCh4ZSwgZmVuY2UpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkcm1fZXJyKCZ4
ZS0+ZHJtLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IlRMQiBpbnZhbGlkYXRpb24gZmVuY2UgdGltZW91dCwgc2Vxbm89JWQKPiByZWN2PSVkIiwKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZlbmNlLT5zZXFu
bywgdGxiX2ludmFsLT5zZXFub19yZWN2KTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgeGVfbG9nX2Vycih4ZSwgVExCSU5WQUwsIC1FVElNRSwgImZlbmNlIHRpbWVvdXQsCj4gc2Vx
bm89JWQgcmVjdj0lZCIsCgpDYW4gd2Uga2VlcCB0aGUgIlRMQiBpbnZhbGlkYXRpb24iIHBpZWNl
IGhlcmUgc2luY2UgdGhhdCdzIGEgbGl0dGxlCmVhc2llciBmb3IgZ3JlcHBpbmcgd2hlbiBtYW51
YWxseSBkZWJ1Z2dpbmc/CgpBbmQgc2xpZ2h0IG5pdHBpY2suLiBDYW4gd2UgdXNlIGEgdmFyaWFi
bGUgZm9yIC1FVElNRSBoZXJlIHNpbmNlIHdlJ3JlCm5vdyB1c2luZyBpdCBpbiB0d28gcGxhY2Vz
IGluIGNhc2Ugd2Ugd2FudCB0byBjaGFuZ2UgaW4gdGhlIGZ1dHVyZT8KCk90aGVyd2lzZSB0aGUg
cGF0Y2ggbG9va3MgZ29vZDoKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3Vt
bWVyc0BpbnRlbC5jb20+CgpUaGFua3MsClN0dWFydAoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmVuY2UtPnNlcW5vLCB0bGJfaW52YWwtPnNl
cW5vX3JlY3YpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmZW5jZS0+
YmFzZS5lcnJvciA9IC1FVElNRTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X3RsYl9pbnZhbF9mZW5jZV9zaWduYWwoZmVuY2UpOwoK
