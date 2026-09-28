Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CB2CA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 16:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECC810EB31;
	Mon, 28 Sep 2026 16:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YJrfdzR+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C897E10EB31
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 16:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790613988; x=1822149988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ox/Uwp+ZAB9ADuuh0Q/hnE8BqZQ2iUoSnXtcmiyJ6BE=;
 b=YJrfdzR+K10VqxOiO9GqFuKyANhqlnGged4ieSva6aEAqlIGROvfZ/zk
 yB9UVxjudy9EPbDmdGbwKJNfX/pdECOa4OF/wv8MwnNeyyhYOeDBvdxcB
 qqtkEDKLjEU5oWl4yfEuQloQFkbSf/qHaw2ijYUaXc48kuscDJsb2wTNE
 B6tE2X3Fut7XkMjAL5vUaCQsukFXGh8wUqh7axp7jcs8ncqmDr+9ycJ9/
 3JJNGBIkQdTAKTm5XrM7mhx0G+tTnhRDpmzfntJz2+MQWPjO+ZB8HVqJ6
 xM2ETdDBd5VWA1T14QDq4hiDW9o1rNK//OdsnZkC6JJVjwmdalRU5OXAw g==;
X-CSE-ConnectionGUID: EctqByEUTMayzICI9KStpw==
X-CSE-MsgGUID: bncDOyDGRyWBm82vePt1HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94199915"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="94199915"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:46:27 -0700
X-CSE-ConnectionGUID: TZXzazupQGaaVk+V82ewlA==
X-CSE-MsgGUID: dDPB8GxGTDmNUuE3zAXFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; d="scan'208";a="303045489"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2026 09:46:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 09:46:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 09:46:26 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 09:46:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9v92JKWNujpVe5roZ3fCMuV+KoEw9V+0cj50B/lI/8OiA/+pMhVtN2HQjl5ar43Jfrl1tSK3QPCfTMiyj1JNZplXllOIIDL/N9qHd9POfXRXmxT7ZACIAHkmA/iaLiXTEFdVnc/dePPkhYfBT2huCFwFRejE9KZNMyiJUxFkHO5KUE7Uw4v5V5tTMWBe042kKeLfTnlYtUXpIdV/PvFLeQbdS06RLcEXg9kT89fzFU828hvhojxV4qdxLXcB/9qCnUJyWs9uknNE//bUTD+g8lYmQgsrF1CD3BdM5DKbHEQVnM3d/tbNboAyq0yY9wJPfCFMCbNJrPgO8s4LDz06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ox/Uwp+ZAB9ADuuh0Q/hnE8BqZQ2iUoSnXtcmiyJ6BE=;
 b=OE707Vpp+Y0pB/OMrwoZOCbjXbFBphhnaYKgvH/4xwpEuodhYch4smUKun8vpT7RExfKC2DYv7TPV9n9MND+Ctdfde39yALa9Rhe/3+CQt88F4zUlAZKVcMmoFyc6jfGPVOcQtCerCUUnEkM6irRB69HjUGazJEnu91nNyv+ws0yYQ6EB+fguWg5ubF9IhZXtQA711uIRaVVp2abWZJoOOGjzHZcJyNer0sltQ3weCYI+ATe7bEhgr7H2xrrO0kbz0n6cXsOCg3JPzxBuiehugvDTvAgARPWecPZ+ODJFMawillifF17wK0P4/7bORSVU1uyT1hSuM4vMJ8vp7jE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 16:46:24 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:46:24 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Sousa, Gustavo"
 <gustavo.sousa@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH 04/16] drm/xe: Require CONFIGFS_FS
Thread-Topic: [PATCH 04/16] drm/xe: Require CONFIGFS_FS
Thread-Index: AQHdTHimbUkgONWfPkWPm5b4/JRHpbbf7u6AgARJ6oA=
Date: Mon, 28 Sep 2026 16:46:24 +0000
Message-ID: <fefc463daa7401eff04fd28be098e9108d0f4980.camel@intel.com>
References: <20260924230120.389685-18-stuart.summers@intel.com>
 <20260924230120.389685-22-stuart.summers@intel.com>
 <20260925231647.GK730887@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260925231647.GK730887@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|BL1PR11MB5320:EE_
x-ms-office365-filtering-correlation-id: de8cabf8-eb87-42b4-5f41-08df1d80087a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|4143699003|10067099003|6133799003|56012099006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: iLS508SfoXgZwG0oZd1hsgHw1Oo9m/HV7CvTE0lBj3FJckPYbqepszKpltfyLNXPOgmTwiw0Cr7nMi8jWwWjYN++jTN/FZ8+jJXVpAUnkSYc7amPXJ1GCoAlYW1E3p3P7QqfbVeBOSY6kbp6DVBjCvGkPzBbe6weJKMn36RXJbYZPZTbIgWQweXKYQQ8homvFzTfbfIiN8n2cmsqZDGIQ3irDu+LWAlTjhtvauX0QC/MN3GpmIr5QLRbcT/T+pi6vwTl/RLsZQTBT+60a0iNQvRlc/Qos9P/eYFZqhLkWGJi52ZQJvQzyixXac0ZGnXvDEX4bnNFqLqNks904rKHUbHuG7cdnKTsDxwVE1BrSq6ej1tS1PNrpJQMQZ0HgFhBFIPsYEro5lLNuBhggQT+rxQ9e1LfaUOj2NIwnnokbFlWpBt77NIvFin5kT8vyFenv0PYDLOvbCou2gChC7JOqX+GbjwsCYlExDHyAKTCz7pScJTrgxnGG4W4N+OaKZ4V2qeT5Gy12s77hRMh26r9Gf1CmQAkL3ALs2NkvRiQVkLh6qvi09hvFcdFw3pIvzonH48GdJpbE64kHZPFEO30kkAlWzL5aP91j/x+41MSzx1SQzMld2uJpmtNCWVuAZAGUfXNM8Bn+cCKfLc84NYio0idohZBR/ZuOYlYt/xLb5RdcoAIm0ZA4Eklwcm7o8BVA61PDqEhhWA7m6sL5BcjbJXn8UlhKaH0rrYFGXvieCU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(4143699003)(10067099003)(6133799003)(56012099006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHE4UGJ2VEZtdzBTT1pRTnFjRmh2d3ZCRjh1UGQxcTNjUmhnQ1NpdTFSSUp3?=
 =?utf-8?B?ZFIzdWs3RGNjU1AvYnRRWUs5b0hCT05rcXRvOW40RnNaNTJ2dWI5YWU1OEE5?=
 =?utf-8?B?dG50cnFRV1NSYzR3WDVEY2h4MWg5NkQwaytORjl1QmxSeEcrZFgzRndlL2lD?=
 =?utf-8?B?aEtCRlVEZ0JkYnp0WGo1bFcwSHcyM1I5R3pEZXJkemJOMStiZ2ovandOcVYv?=
 =?utf-8?B?Qnh4WmcrY29MZnJBS1ZVY29yQjJUOGdMWnBpN3ZsL0xTdTRqaThZcG5iNDRw?=
 =?utf-8?B?SndIMDhWa2hIYkd3RFk1SjBOMDNXdEt5cWlNUXRLKzg0dndIVDFKakU0MDhT?=
 =?utf-8?B?Y0RrS3k2V1Ixc283TVFVRUhMYUlETlg2N0psT0prN1l0L0lOVmpJaVkzQ3FE?=
 =?utf-8?B?YWVrMWdqaERYOXlmMWg3a3NlOHo1bXhqY0p2VDVGZGpaN1ZldW5MdmJlL0NI?=
 =?utf-8?B?Ym1XeTBYYmxURW5EaUhzcW12d2ZFenVadEp0bDZLM2kvN1BEM0tCd1NhcnVZ?=
 =?utf-8?B?emZFNS96TGRGQkk4WmxZYkhyRFNZMW9hUWRPRnVzOWkyMXZhbTk2S2YyRk1S?=
 =?utf-8?B?NFkzaStOdVc2bXU2by9tUDl6WTlKK1p6R3FIQ2V4SDVHUFgzM0lzaHNZSUdG?=
 =?utf-8?B?TWZYaUJYSEFIMFBjMURLelBJbVUxSDJUVmRocEVuRFpFM1hubWVvRFVOMTZa?=
 =?utf-8?B?QnIraXluazZtWnRsKy82eFVseWVnMUtSNFUweE9lYitqSVpCMXR5QWcrc0ph?=
 =?utf-8?B?b0NKaWU2TXcvU0tpRy83YXUyRnQ4YXRITXlNUzJmbDZZbmt3VnpCSG1tZHBE?=
 =?utf-8?B?VFhnZ0FUVkdYcDJSRit5WFdtMjdPWEZMYUgvN1ZKai8yL3IxL0hKNmYrNFgy?=
 =?utf-8?B?WCtGRmR3b0IrQmZlWko0WlB3MHkvcWR3cUlIeGd2Qk50Q09GM2VOTEd2MzRJ?=
 =?utf-8?B?VjhsKzZuc2t2dllDVDlVUkpDTGU5ZEt4NXpveGtZWEc4NG5TbXdvc1BKWUZ0?=
 =?utf-8?B?MEpJQXZaTmZ0VEdvVVFkTHRPZUpVRzRkT3NqcjhMYWpjNy9XcU9UM2xkSzBQ?=
 =?utf-8?B?SUlXVFZXRnJhNisvNzN1Tjh0U2svcUZ6aHJZa3Z0UlB0SWdFVUNOb09qTnEr?=
 =?utf-8?B?aTFLZkYwSDl5OC9mT0drUDllRGk3Lzc1ZEtPOEFMcFBGVHpQVG95R2FqUWxu?=
 =?utf-8?B?Tm5sZko3Umc0WktkeHYzN2ZWaldNRzZuakJuNjBXSjJHajh4VU84bzFoamN2?=
 =?utf-8?B?bEkyRVZ2cmV1K3ArcCtKY1ZuL3Q2NWZ3bzlxb0lONWpDejduanN5Nk01MVRu?=
 =?utf-8?B?RUVTZ0Ntdy9KQmh4YlZyZGFSYXdOM3I5ek1xZ24wbVFqTDVycFVybjUyK0J3?=
 =?utf-8?B?eE1NRlJNUnNkWnB5Y0F6QWJkUHFIUHBOdjUvQTZUYmRyejZXSXZRc1hFTit1?=
 =?utf-8?B?VEJjeU5PR1RKNjU5OWdQK3JmYSt1bFQ4REdRNXEwUjg4LysvUm5EVzFuOWs0?=
 =?utf-8?B?Z3BDTFVqaWt1ck9EeUl4c0UxcU9VUmlveG9zTDVBVkgwTk9iYWpGZmJmMVlB?=
 =?utf-8?B?L0Y4Q1JLQzdMVXdwY1BRbUtERXpXbDJsSi81SVFEdlBrZ0I3WEYybno5QldH?=
 =?utf-8?B?RVM3VlU0M1hFTWZIMGVLNUpuL2xGVVZGMzZ4VUU5ZjlqMmxTYzJpTWpSYnVx?=
 =?utf-8?B?Q1kxWjdjWDdscnV2b29WdFNhNW9uSk1XQ2IzM29KMFFIWEpuQnZZMGIyRmVt?=
 =?utf-8?B?RG9LeE1tR2VjU3FkN3htK1VxcXlQSWF1Ykk2bHZXem1qUVlMdXR1UlJZTDFP?=
 =?utf-8?B?TUJIQWZxRFNtWmxMMFdUSnl6QWo3VGVrUEZOeVZQM0VYOWp2T2RmOEpMNkdr?=
 =?utf-8?B?U2VqcS9nWWkxVVZ2SUNEK1h2NnF1NCsyanI0UjNreE1ZUncvZVp4L3JiVW1M?=
 =?utf-8?B?eDhLQldsWjF3L0kyQlB5TXRnbDM5UTAvejJmZkxNK0M3SGx4ZjBFSHdCS2Zp?=
 =?utf-8?B?b1NTYTc1cTlBQmZKTUxscFNFYm95QjM0SFJoOVB4K2FYMlFXTWVsVFY2aHBw?=
 =?utf-8?B?Vllac3loamZPTFVHVnd2ekNENGtjbUhNZ2N1SWJLMGU3cDlKck10dk1KbDVB?=
 =?utf-8?B?c0QwdTVodFY5dnRLSW9pMS9KNWh0MjVNT1UrME1ycXNaZjFDQ2cvNTZhcW14?=
 =?utf-8?B?Rm55YzAzSHNhaVVmRnl5Y2hoeW92OGVwUlF4ZURqRktkUkdqbFZ6aEFEWGRV?=
 =?utf-8?B?L0NBRjFENFZnVFM4T1padTJCUTErMTNOdG1zamFIV1grUGhSS2FsVnhKL0h5?=
 =?utf-8?B?VzdZd3NIMUwyaVB3R3c2RjRjMFQydUMxaThHdHcxNXpsZHVsVHRYOHQ0SDBm?=
 =?utf-8?Q?G6NL+D54qaFcK6jU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <707F94DCA336874F8391A24801A1397D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: iEDTQrnECVZkrU/yL/9XadyAS3SGawhvu/p1vTC+2Heydy7b1ODRHXpvX8r7/7Kbs3YA4shuZZY0/0u15BrI1MVhFHWFbCzyTFLNJtiu+Q5stvoyiEQMPh/iNmRQqgdCO/M2asAB1A3eU2MbAyHl9rrIE/jjeOQR7ffn6CklTjrg/iFi1Pndzp8rQuCSfI50GmaSkPo56EyzlLZap0XVkF8r8H4cTI9eGgscHFHQ3vWaGQ7p2aDTJXwYKdSXz67SYbP1URfdIzkCdlbVyL+j6qWqsbZTO7BRSC0amWKy5Nv+j17tuyK+OuRwxk+g6KvSUhaMJ1jvUDw9qk+ZcCkFYQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de8cabf8-eb87-42b4-5f41-08df1d80087a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 16:46:24.4744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eWZoppq5Tpi2TooQ9EcJezrJ2Hrjak402VC3a9zj2f8llGFDFVBxA/gFJWqeRyrSG13WivFmpKiOhdcGOKjuSQ6Y187i4OgLTbDG4T10sQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
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

T24gRnJpLCAyMDI2LTA5LTI1IGF0IDE2OjE2IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBUaHUsIFNlcCAyNCwgMjAyNiBhdCAxMTowMToyM1BNICswMDAwLCBTdHVhcnQgU3VtbWVycyB3
cm90ZToNCj4gPiBjb25maWdmcyBpcyBub3Qgb3B0aW9uYWwgZm9yIHhlIGluIHByYWN0aWNlOiBh
IGdyb3dpbmcgc2V0IG9mDQo+ID4gZGV2aWNlDQo+IA0KPiBJJ20gbm90IHN1cmUgSSBhZ3JlZSB3
aXRoIHRoaXMgY2xhaW07IHRoZSBYZSBkcml2ZXIgaXMgY2VydGFpbmx5DQo+IHVzYWJsZQ0KPiB0
b2RheSB3aXRob3V0IGNvbmZpZ2ZzIGFuZCBtb3N0IHVzZXJzIHdpbGwgbmV2ZXIgaGF2ZSBhbnkg
bmVlZCB0byB1c2UNCj4gaXQNCj4gKGFuZCBtb3N0IGFyZSBwcm9iYWJseSB1bmF3YXJlIG9mIGl0
cyBleGlzdGVuY2UpLsKgIEhhdmluZyBjb25maWdmcw0KPiB3aWxsDQo+IGdpdmUgeW91IGEgc21h
bGwgbnVtYmVyIG9mIGFkZGl0aW9uYWwgZmVhdHVyZXMgZm9yIGNlcnRhaW4gY29ybmVyDQo+IGNh
c2VzDQo+IChzdWNoIGFzIHN1cnZpdmFiaWxpdHkgbW9kZSksIGFuZCB0aG9zZSBjYXBhYmlsaXRp
ZXMgbWlnaHQgYmUgY3J1Y2lhbA0KPiB0bw0KPiBzcGVjaWZpYyB1c2VycywgYnV0IHRoZXkncmUg
bm90IG1hbmRhdG9yeSBmb3IgZ2VuZXJhbCB1c2Ugb2YgdGhlDQo+IGRyaXZlcg0KPiBvciBoYXJk
d2F3cmUuwqAgSW4gZmFjdCBldmVuIGZlYXR1cmVzIGxpa2Ugc3Vydml2YWJpbGl0eSBtb2RlIGFy
ZSBvbmx5DQo+IHJlbGV2YW50IG9uIGEgc3BlY2lmaWMgc3Vic2V0IG9mIHRoZSBwbGF0Zm9ybXMg
c3VwcG9ydGVkIGJ5IFhlLsKgIEknbQ0KPiBub3QNCj4gc3VyZSBpZiB0aGVyZSdzIGFueSBlbmQt
dXNlciB1c2UgY2FzZSBmb3IgY29uZmlnZnMgdG9kYXkgb24gaWdwdQ0KPiBwbGF0Zm9ybXMgZm9y
IGV4YW1wbGUuDQo+IA0KPiBJIGJlbGlldmUgbW9zdCBkaXN0cmlidXRpb24ga2VybmVscyBkbyBp
bmNsdWRlIGNvbmZpZ2ZzIHN1cHBvcnQNCj4gdG9kYXksDQo+IHNvIHRoaXMgc3VwcG9ydCB3aWxs
IHVzdWFsbHkgYmUgdGhlcmUgaWYgZ2VuZXJhbCB1c2VycyBuZWVkIGl0LsKgIEJ1dA0KPiBpZg0K
PiBzb21lb25lIG1ha2VzIGEgY29uc2Npb3VzIGRlY2lzaW9uIHRoYXQgdGhleSB3YW50IGEgdmVy
eSBzbWFsbCBrZXJuZWwNCj4gYW5kIHRoZXkgZmVlbCB0aGV5IGRvbid0IG5lZWQgYW55IG9mIHRo
ZSBleHRyYSBmZWF0dXJlcyBvZmZlcmVkIGJ5DQo+IGNvbmZpZ2ZzLCB0aGVuIHRoYXQncyByZWFs
bHkgdGhlaXIgY2FsbCB0byBtYWtlLsKgIFRoZXJlIGFyZSBhIGxvdCBvZg0KPiBlbWJlZGRlZCBz
eXN0ZW0gdXNlIGNhc2VzIHdoZXJlIHNvbWV0aGluZyBsaWtlIGNvbmZpZ2ZzIGp1c3QgaXNuJ3QN
Cj4gZ29pbmcNCj4gdG8gYmUgdXNlZnVsIGJlY2F1c2UgeW91IGNhbid0IGdldCBhdCBpdCBhbnl3
YXkgdGhyb3VnaCB0aGUNCj4gaW50ZXJmYWNlcw0KPiB0aGUgZGV2aWNlIG1ha2VzIGF2YWlsYWJs
ZSwgYW5kIGluY2x1ZGluZyB1bm5lY2Vzc2FyeSBmYWNpbGl0aWVzIGxpa2UNCj4gY29uZmlnZnMg
Y2FuIGludGVyZmVyZSB3aXRoIGNlcnRpZmljYXRpb24gcmVxdWlyZW1lbnRzLCB0aW1pbmcNCj4g
cmVxdWlyZW1lbnRzLCBldGMuDQoNCkhtLi4geWVhaCBJIHVuZGVyc3RhbmQgd2hhdCB5b3UncmUg
c2F5aW5nIGFuZCBpdCdzIGEgZ29vZCBwb2ludC4gSSB3YXMNCmhvcGluZyB3ZSBjb3VsZCBnZXQg
cmlkIG9mIHRoZSBkYW5nbGluZyBjb2RlIGhlcmUsIGJ1dCBtYXliZSBpdCdzDQpiZXR0ZXIgdG8g
a2VlcCBpdCBmb3IgdGhvc2UgdXNlIGNhc2VzLiBJIGNhbiBkcm9wIHRoaXMgbmV4dCByZXYuDQoN
ClRoYW5rcywNClN0dWFydA0KDQo+IA0KPiANCj4gTWF0dA0KPiANCj4gPiBzZXR0aW5ncyBpcyBv
bmx5IHJlYWNoYWJsZSB0aHJvdWdoIGl0LCBhbmQgdGhlICFDT05GSUdGU19GUyBzdHVicw0KPiA+
IHNpbGVudGx5IHJldHVybiBkZWZhdWx0cyBpbnN0ZWFkLCBzbyB0aG9zZSBidWlsZHMgcXVpZXRs
eSBpZ25vcmUNCj4gPiBldmVyeQ0KPiA+IGNvbmZpZ2ZzIGtub2IuIFNlbGVjdCBpdCBhbmQgZHJv
cCB0aGUgc3R1YnMgcmF0aGVyIHRoYW4ga2VlcA0KPiA+IGdyb3dpbmcgYQ0KPiA+IHNlY29uZCwg
bm8tb3AgY29weSBvZiB0aGUgZ2V0dGVyIEFQSS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBT
dHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KPiA+IEFzc2lzdGVkLWJ5
OiBDb3BpbG90OmNsYXVkZS1vcHVzLTUNCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS9LY29uZmlnwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS9N
YWtlZmlsZcKgwqDCoMKgwqAgfMKgIDIgKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9j
b25maWdmcy5oIHwgMzIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IC0tLS0NCj4g
PiDCoDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkNCj4g
PiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL0tjb25maWcNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS9LY29uZmlnDQo+ID4gaW5kZXggNGQ3ZGNhZmYyYjkxLi5hMjRiNWU1
NzQ2OTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL0tjb25maWcNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUvS2NvbmZpZw0KPiA+IEBAIC02LDYgKzYsNyBAQCBjb25m
aWcgRFJNX1hFDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGRlcGVuZHMgb24gSU5URUxfVlNFQyB8fCAh
SU5URUxfVlNFQw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBkZXBlbmRzIG9uIFg4Nl9QTEFURk9STV9E
RVZJQ0VTIHx8ICEoWDg2ICYmIEFDUEkpDQo+ID4gwqDCoMKgwqDCoMKgwqDCoGRlcGVuZHMgb24g
UEFHRV9TSVpFXzRLQiB8fCBDT01QSUxFX1RFU1QgfHwgQlJPS0VODQo+ID4gK8KgwqDCoMKgwqDC
oMKgc2VsZWN0IENPTkZJR0ZTX0ZTDQo+ID4gwqDCoMKgwqDCoMKgwqDCoHNlbGVjdCBJTlRFUlZB
TF9UUkVFDQo+ID4gwqDCoMKgwqDCoMKgwqDCoCMgd2UgbmVlZCBzaG1mcyBmb3IgdGhlIHN3YXBw
YWJsZSBiYWNraW5nIHN0b3JlLCBhbmQgaW4NCj4gPiBwYXJ0aWN1bGFyDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoCMgdGhlIHNobWVtX3JlYWRwYWdlKCkgd2hpY2ggZGVwZW5kcyB1cG9uIHRtcGZzDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gaW5kZXggYmE0NDA0ODk2ZjJmLi5hYTVkNjE4NDcx
M2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4gQEAgLTE2NCw3ICsxNjQsNyBAQCB4
ZS0kKENPTkZJR19EUk1fR1BVU1ZNKSArPSB4ZV91c2VycHRyLm8NCj4gPiDCoHhlLSQoQ09ORklH
X0hXTU9OKSArPSB4ZV9od21vbi5vDQo+ID4gwqANCj4gPiDCoHhlLSQoQ09ORklHX1BFUkZfRVZF
TlRTKSArPSB4ZV9wbXUubw0KPiA+IC14ZS0kKENPTkZJR19DT05GSUdGU19GUykgKz0geGVfY29u
ZmlnZnMubw0KPiA+ICt4ZS15ICs9IHhlX2NvbmZpZ2ZzLm8NCj4gPiDCoA0KPiA+IMKgIyBncmFw
aGljcyB2aXJ0dWFsaXphdGlvbiAoU1ItSU9WKSBzdXBwb3J0DQo+ID4gwqB4ZS15ICs9IFwNCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmgNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5oDQo+ID4gaW5kZXggZjg5ZGMwZmZiODg0Li5m
ZjkwMmQ3NDg4Y2EgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZp
Z2ZzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaA0KPiA+IEBA
IC01LDE2ICs1LDEyIEBADQo+ID4gwqAjaWZuZGVmIF9YRV9DT05GSUdGU19IXw0KPiA+IMKgI2Rl
ZmluZSBfWEVfQ09ORklHRlNfSF8NCj4gPiDCoA0KPiA+IC0jaW5jbHVkZSA8bGludXgvbGltaXRz
Lmg+DQo+ID4gwqAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCj4gPiDCoA0KPiA+IC0jaW5jbHVk
ZSAieGVfZGVmYXVsdHMuaCINCj4gPiDCoCNpbmNsdWRlICJ4ZV9od19lbmdpbmVfdHlwZXMuaCIN
Cj4gPiAtI2luY2x1ZGUgInhlX21vZHVsZS5oIg0KPiA+IMKgDQo+ID4gwqBzdHJ1Y3QgcGNpX2Rl
djsNCj4gPiDCoA0KPiA+IC0jaWYgSVNfRU5BQkxFRChDT05GSUdfQ09ORklHRlNfRlMpDQo+ID4g
wqBpbnQgeGVfY29uZmlnZnNfaW5pdCh2b2lkKTsNCj4gPiDCoHZvaWQgeGVfY29uZmlnZnNfZXhp
dCh2b2lkKTsNCj4gPiDCoHZvaWQgeGVfY29uZmlnZnNfY2hlY2tfZGV2aWNlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KTsNCj4gPiBAQCAtMzUsMzMgKzMxLDUgQEAgc3NpemVfdA0KPiA+IHhlX2NvbmZp
Z2ZzX2dldF9jdHhfcmVzdG9yZV9wb3N0X2JiKHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPiA+IMKg
dW5zaWduZWQgaW50IHhlX2NvbmZpZ2ZzX2dldF9tYXhfdmZzKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KTsNCj4gPiDCoGJvb2wgeGVfY29uZmlnZnNfYWRtaW5fb25seV9wZihzdHJ1Y3QgcGNpX2RldiAq
cGRldik7DQo+ID4gwqAjZW5kaWYNCj4gPiAtI2Vsc2UNCj4gPiAtc3RhdGljIGlubGluZSBpbnQg
eGVfY29uZmlnZnNfaW5pdCh2b2lkKSB7IHJldHVybiAwOyB9DQo+ID4gLXN0YXRpYyBpbmxpbmUg
dm9pZCB4ZV9jb25maWdmc19leGl0KHZvaWQpIHsgfQ0KPiA+IC1zdGF0aWMgaW5saW5lIHZvaWQg
eGVfY29uZmlnZnNfY2hlY2tfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPiA+IHsgfQ0K
PiA+IC1zdGF0aWMgaW5saW5lIGJvb2wgeGVfY29uZmlnZnNfZ2V0X3N1cnZpdmFiaWxpdHlfbW9k
ZShzdHJ1Y3QNCj4gPiBwY2lfZGV2ICpwZGV2KSB7IHJldHVybiBmYWxzZTsgfQ0KPiA+IC1zdGF0
aWMgaW5saW5lIGJvb2wgeGVfY29uZmlnZnNfcHJpbWFyeV9ndF9hbGxvd2VkKHN0cnVjdCBwY2lf
ZGV2DQo+ID4gKnBkZXYpIHsgcmV0dXJuIHRydWU7IH0NCj4gPiAtc3RhdGljIGlubGluZSBib29s
IHhlX2NvbmZpZ2ZzX21lZGlhX2d0X2FsbG93ZWQoc3RydWN0IHBjaV9kZXYNCj4gPiAqcGRldikg
eyByZXR1cm4gdHJ1ZTsgfQ0KPiA+IC1zdGF0aWMgaW5saW5lIHU2NCB4ZV9jb25maWdmc19nZXRf
ZW5naW5lc19hbGxvd2VkKHN0cnVjdCBwY2lfZGV2DQo+ID4gKnBkZXYpIHsgcmV0dXJuIFU2NF9N
QVg7IH0NCj4gPiAtc3RhdGljIGlubGluZSBib29sIHhlX2NvbmZpZ2ZzX2dldF9wc21pX2VuYWJs
ZWQoc3RydWN0IHBjaV9kZXYNCj4gPiAqcGRldikgeyByZXR1cm4gZmFsc2U7IH0NCj4gPiAtc3Rh
dGljIGlubGluZSBib29sIHhlX2NvbmZpZ2ZzX2dldF9lbmFibGVfbXVsdGlfcXVldWUoc3RydWN0
DQo+ID4gcGNpX2RldiAqcGRldikgeyByZXR1cm4gdHJ1ZTsgfQ0KPiA+IC1zdGF0aWMgaW5saW5l
IGJvb2wNCj4gPiB4ZV9jb25maWdmc19nZXRfZGlzYWJsZV92cmFtX3BhZ2Vfb2ZmbGluZShzdHJ1
Y3QgcGNpX2RldiAqcGRldikgew0KPiA+IHJldHVybiBmYWxzZTsgfQ0KPiA+IC1zdGF0aWMgaW5s
aW5lIHNzaXplX3QgeGVfY29uZmlnZnNfZ2V0X2N0eF9yZXN0b3JlX21pZF9iYihzdHJ1Y3QNCj4g
PiBwY2lfZGV2ICpwZGV2LA0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtDQo+ID4geGVfZW5naW5lX2NsYXNzIGNsYXNzLA0KPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
MzIgKmNzLA0KPiA+IHNpemVfdCBtYXhfbGVuKSB7IHJldHVybiAwOyB9DQo+ID4gLXN0YXRpYyBp
bmxpbmUgc3NpemVfdCB4ZV9jb25maWdmc19nZXRfY3R4X3Jlc3RvcmVfcG9zdF9iYihzdHJ1Y3QN
Cj4gPiBwY2lfZGV2ICpwZGV2LA0KPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0NCj4gPiB4ZV9lbmdpbmVfY2xhc3MgY2xhc3Ms
DQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdTMyICpjcywNCj4gPiBzaXplX3QgbWF4X2xlbikgeyByZXR1cm4gMDsgfQ0KPiA+IC0j
aWZkZWYgQ09ORklHX1BDSV9JT1YNCj4gPiAtc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgeGVf
Y29uZmlnZnNfZ2V0X21heF92ZnMoc3RydWN0IHBjaV9kZXYNCj4gPiAqcGRldikNCj4gPiAtew0K
PiA+IC3CoMKgwqDCoMKgwqDCoHJldHVybiB4ZV9tb2RwYXJhbS5tYXhfdmZzOw0KPiA+IC19DQo+
ID4gLXN0YXRpYyBpbmxpbmUgYm9vbCB4ZV9jb25maWdmc19hZG1pbl9vbmx5X3BmKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQ0KPiA+IC17DQo+ID4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIFhFX0RFRkFV
TFRfQURNSU5fT05MWV9QRjsNCj4gPiAtfQ0KPiA+IC0jZW5kaWYNCj4gPiAtI2VuZGlmDQo+ID4g
wqANCj4gPiDCoCNlbmRpZg0KPiA+IC0tIA0KPiA+IDIuNDMuMA0KPiA+IA0KPiANCg0K
