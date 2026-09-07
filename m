Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B2CC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 05:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D46910E438;
	Mon,  7 Sep 2026 05:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPvSQ3Mq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D093A10E438
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 05:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788758052; x=1820294052;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sHRdbBp1GW7H4Hu7kYldHhq6Z0UugKiY1QQnsRiL4Zw=;
 b=cPvSQ3MqtgST/TbLY99D717JSsp+n20V4VCaIbf5vxDtX2VuhE6kg7NW
 NmOHzQ/hifXlbwowDg0y7n1W0FkqncBKlPyfnQeRflTowrnH6CUFtNCBn
 IhUTLHSHT7LZGzHLfFV3/njjtZeDGDaWVg4YjpAc7LMvaS5H6myWo7Lrr
 JVPDSE2KZ3hHKeysp9hBok6GQJttst+OMv2FbuD+Pd5P2FsV6DSvOcZml
 nUgT150xOVdo60MbzhxaGmT6/bEM4mEbalXyZeoWad1Tx8hm3M3FbWbjD
 E6nqloAREKyGXgOppM1Idt15JvLL9VzHGB9n0N1AjaS2nVOaYo7fGsF5D g==;
X-CSE-ConnectionGUID: hEVpnfZvSTOQ74jT8VCq8A==
X-CSE-MsgGUID: 5KUX71jhSxySf5GdHlWzhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88916107"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="88916107"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:14:12 -0700
X-CSE-ConnectionGUID: Sl2luwlkT8aPPchbqNhbxA==
X-CSE-MsgGUID: h8BUjydNRlmJQ/5zFmiOAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="274125293"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:14:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 22:14:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 6 Sep 2026 22:14:11 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 22:14:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAI2qRHyjaXow67FxhMkTH0L8MHgQaifhw5WALvpKwWnR1riqXriPro8WTsYcllN9KZlAx5PRiigC9KMde9783JJ/bf/yxOaWwiIzaxyFWSgnpjZFXrkYSriGbr6oHmqpOtCuljELORLmt0EH0eM/wX9gbeLuUuCm/BLv3qNk6BhL2YTQM6lZ0Mae34uEV23OLYWKo0GhhOX4b8QSFNuLI+AOL7udHf/MdvSKcGkhifKtkS6EQ66ZzTa6+bV54lTOqMi3ZMYI6ZvJ++F0m6bvB0keANrYecw6CRtSioaNECIEerWV8xN2b+3IlARPGfEitGWthRzJPktiWUZuc0vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHRdbBp1GW7H4Hu7kYldHhq6Z0UugKiY1QQnsRiL4Zw=;
 b=EQkKN/sAKCrW1EAt/rX3cTNeNo4A2ATdJMW9f+d+oWXYFsTJP+mtK6dgnNjTiBDh0XwhuTpg1GJyz+0HXllgadNtGxhrvz7FvJxBOXhNXLdvxBMTG03fCHW+kk3+OBLjpIbQczUwBXGUk4v/m1xayATSedpS3g+V/5vO/+lM0gEv+Y4PP2S6dRDR0r0naEHG3+K1DIh4PyYWCyaGZjwSe2yUnAltA9XUbclStlS8x0q3NV6c956FgUUiPoCzTnU3ctGX/KncIiu10zi6l28DO+X9wsCexv+PlQMirk96eVTlXymGW7muhOlt7vQaKiKZPoPyI7PfXjCzpIn3j3SpVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by FT1PR11MB380434.namprd11.prod.outlook.com (2603:10b6:170:b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 05:14:09 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 05:14:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, Sashiko <sashiko-bot@kernel.org>
Subject: RE: [PATCH v2] drm/xe/vm: Handle purged BOs in VM snapshots
Thread-Topic: [PATCH v2] drm/xe/vm: Handle purged BOs in VM snapshots
Thread-Index: AQHdPD5Mcb2RwGOARU+euCApws5WOLbCltCg
Date: Mon, 7 Sep 2026 05:14:09 +0000
Message-ID: <DS0PR11MB8718A6F78AF56EBE929F349081B22@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260904072252.4009491-1-arvind.yadav@intel.com>
In-Reply-To: <20260904072252.4009491-1-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|FT1PR11MB380434:EE_
x-ms-office365-filtering-correlation-id: 7a8dcaf9-2def-4f2b-3da9-08df0c9ed921
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|6133799003|56012099006|11063799006|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: H6xrJPwM/z9A/yOIBi6l7aMF4xLY7jkdnr+u4z/eFeTl0t/Gj/Y8yaSTfDpzlSCsRTY8HXMLhIhnswbtZWjGN/9X/OpQX57LCSN/v8/9TnOVym+PxtLWbp6YUV+tj6HEwv/wbIyoBSjp9loyRAiWsBHSaZxhpk2b4wrnOx7WJ/5z41d6KG4plQ67HiSmd4hcMvIY/qkTzBs7IwGLbRyNX7BCVnMI4Z/Qw2Mf/Rbp8KZdg8nn75/QKP6/a8rbT4Vx5AvJ4ZZAa7ZF5EefP4OIMH6udXe3eLWytRCvBYRa65Ec7Zu9H3MwogmISzVBBhWAOFUDmWYtaElcuIzZIHqSr0lC82pJa22T5ZErCWeiInUqCya0rECY3awqFTshqYogiTXuofmfjaoB/fvpLExe92Zr78DGpSIiZ0PWxKVAG596kKjblYVFanT8DI1hmlJ+jHiMmYJhFDnyxQ0v8ozzaeckuRJKXixQFC8c5+HoOawDX5s00WQcDkiaAnugVmqsnBXD15wjFSwTen+qc8Q05n0VMmDtq6Xav14GA1VlUqAI23YlkIIjU+R3HDRr1NMqBh6fhfJMVTVo8BRmQhUfK6BeBLX0c/bX2+yyJQBluF3AFQbKAJCkKIBTeWrZu7pA+6erUlCF1MyQqkIc7KNAju3y5FmL9jumROo9L0zj3tI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEZ0NE9xWWNkcTJBbzBGUmZ3TzhKUHZEVjdvN0YxY284ZmQ4QTZkekFiY05j?=
 =?utf-8?B?UGxXLytxb01KUTgzUkNuS05Cd1V0SDY0OTh3UHRzOG13S2E0Ti9LcDBuak5S?=
 =?utf-8?B?WCtyTlplelBCbFBXc0U3dSt0T0srMnJuMEoxWjBJekRwY1NUSnZPMjB4L3dL?=
 =?utf-8?B?Rk1VUEErdEFtNU9EYy9aUytRQmRkSUh4WjRXeWJGWU5Zb0ZMS05OZjlpcU1F?=
 =?utf-8?B?b3RPSTBrZ0I2aHlVQnJEbkJzUDgwL1ZQS0xheHREWklYWHRRbkVuNGRYT25y?=
 =?utf-8?B?NXc3M1FSUklkMlJvaEt5YUxkK2NQOVdkMWFYWDZUQ1V5dUlvWktzZ2VpbXZT?=
 =?utf-8?B?V3psUVZwY0M1ODNqWTVlcnpaczhoRTlSelN1OVFSNGdCa1ZmcEM0cjh1OFNE?=
 =?utf-8?B?VVh0Yks3dEdTeDR1QklpZlJYN2p4MW9Vd3dOalZPMndXUVlCdzMrQ0ZRK2gw?=
 =?utf-8?B?SmE0UWJ4M21HeVMvUTVkZnhKZTFjWmdCYnFWQUI0b2JkR3Z0QlJCWW83Q1ZD?=
 =?utf-8?B?b2t5VzhWUHc2RTM2UEl0T3Nzc1JuVWZhQ1FvanF3RWZWY1BrbHBtTmVacVFQ?=
 =?utf-8?B?bmFBdVN2c05jNnJyQkJxVHlBT29uM2xjYkRuaVBJQytEbUUxR3FrUnYvcGs4?=
 =?utf-8?B?VGV5T05WY0xPUllnUkZKYllMdmwyRS9qa09tQ2dkM3pqSzhXc00rWTc3Q2xX?=
 =?utf-8?B?OTJMcTlDUzNianc4dVZScXBkbXV0eE9CWXNaUlVDejNrTHVaTjVON0h4ZEpa?=
 =?utf-8?B?REc2VVZIRExoWHMxVUtsVEFyTlZXN0VpcmxSSE5ST3pZR3BwRlZTYjBhOFUy?=
 =?utf-8?B?QVF2YzE0WXdoUW0vOHl3TDEyVGpLU3VTc3JWRFlYUU02d0JaTFBJcEFRUTJ3?=
 =?utf-8?B?M0FaVS9LSUFjNXFsUFBTOC91YWc3WDFKam9saGhpekZJTlFOUmFPM3FYa2M1?=
 =?utf-8?B?L01VOVlvcFU2bVV3TkUrUEtNMDhoK1ZQYmkwTDN0dWRoNjZYZFRaMXVkMmdK?=
 =?utf-8?B?d1VqQjNZdVVtVHBpd1o0NitXdU93UUxmdUV0ZDlvSDVhY3dRQUE2UFg2UlIv?=
 =?utf-8?B?SU1DWU5YdWhZNDhoRkNpMis0eW5YZzJOMFdza1ZIVFJScGFiNXlGcUU4SlZT?=
 =?utf-8?B?TEVvN20yMGsrVHlubEhFTDk4U1pGWGxPaUFNMHFzN2tEVGtYK2hLN2hxdkdH?=
 =?utf-8?B?L09RNWRxOXREQnp4R2YyWWhCQnAycWZ0Vk16VmZGVlY3WG9RMyszQm1aS2FU?=
 =?utf-8?B?OVV4M3hzSndrcnZPMDE2Yk0zYlVSRGFRdS9Hd3JjdFE4TkJoVW1lcDRjSEpL?=
 =?utf-8?B?Tk4xRm5Bci9kTFErSGNGaUMyNHZhZGR5OTNqZzhuTEhYVjFtTXVxWi9OZVYw?=
 =?utf-8?B?R293cWh1ekdEVjVTNm9ZeDRHYmM3MGl4K1NFQktTNHVIcGN4SVFWNVZOM09X?=
 =?utf-8?B?cERvR0lYSDc3TGd0a0tDd1o0S0dpQysrTW1WTHlRTldBbkxISmZlZWwrZzJN?=
 =?utf-8?B?YVc4dktwekdZdzk0dkJYZDcvVUozUVBTTXlPdjdnWWpWeFRWTU5uaDA5dnVt?=
 =?utf-8?B?SkxyZjlFZjh3WWdtVmNwQ2d1TmJYcUx4VHB0Y1cyaWdwWXFrWEJBMDV4Mm0v?=
 =?utf-8?B?VGZzQVJjQ0VBT2p2eHNyWkVURUlvbGhHd0tXWFVUUzIybjAwaFRyZ1phZGpi?=
 =?utf-8?B?b1FMSjZacWhIOHkwM1JPT29TNDVPYU94WU5iMjU2M2RqYm9WeUlFT2doZ2xX?=
 =?utf-8?B?Snd1dDJtZVNSSThyNVFFRHpRYjRWUlM4YmcyYkxteE1GcWxWTDE2dmhxWUNX?=
 =?utf-8?B?ZnhCaGZZS3dUbVV0a1RrM081RU5sOFJsTHBMQjg0S1gzSjRnS2xiMzdwSW96?=
 =?utf-8?B?WWgwT2Z1WHJQZ0psQ3NqOUoySzVRaENUYlNUaEsyREtVNnk1eGZ1Q1JSSDJY?=
 =?utf-8?B?RDJUZWdrOWNpai9oTUl6TkVaOTNrYnVCWE5CWUg0NmZ3UEExUFZtY1B3RFZZ?=
 =?utf-8?B?WXVYaXN2a1VlcW96aVdMSGp4RDJ2L092Nko3eHpUN2xkNnRqenI2eExCMjNY?=
 =?utf-8?B?eWUrWnRxSFBxanQ0bVEzK1pDNUc1Z25LNFNXWmN3WWpMMGw5SjROUWQ2SGxU?=
 =?utf-8?B?bktoRkZUdzhxLzdKUFFraERtT0hNNm82NWt3U1U1TVArd2FLZzh3dEY3Nnc4?=
 =?utf-8?B?a1ZFcjlBaFF1OGc0d2J4amE2azdzZzNBc0JUUzQrWHdkZytYbEpPbWRTY1VO?=
 =?utf-8?B?UXM5Z054MTBLM3ZESm95YVdBbHlkcm9oM0RQWWU3WSsxQWFOQkRoNFJwWlgv?=
 =?utf-8?B?UmZpUzhFUG9keFJ6NVFjM1g0aWhRdE54UERUY1hXdDZSL1Y3RU5UUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MU6ec3AALZj+m2ZVtlHsLmW6FNdv60GW2FS40OYxjksVs1lg9DljMde27+wSbuvZ01O52Lj2xreskcBrDEpxwVua84sMxrm5WSdfhZpRdHJjntyo7RL9TbRMTmgqC8NGZRjpkB7uC4KC5JfrAJRrJVNddY+ag/TtTG/to2KvkqJg8WvULLGLnQfjxRDlY5LL880Cecs3CjaHTn6yoMa8cAUDMtozfiEqhHoPQJ1msKl9i8EdSZT/mHUdq5YRMiuVy4TzD+733FafUnwbfGQ2Bs37yMpLu+lQaS1GxrDABJPC4Y7WdJYusuj2m9BPLVXMveabuXbPJSsK2DgnzOBtkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8dcaf9-2def-4f2b-3da9-08df0c9ed921
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 05:14:09.6960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mbw7wvCYjhH74UUOSMziVNwy21T0Nkaw61mil06FeFjTaTA5QACM851aDsCID5JA9XH7Mp9Szsl2z5u/AKIt1N1MaeAP4RoQ0FKQejAV5LM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB380434
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQXJ2aW5kDQo+
IFlhZGF2DQo+IFNlbnQ6IDA0IFNlcHRlbWJlciAyMDI2IDEyOjUzDQo+IFRvOiBpbnRlbC14ZUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0
QGludGVsLmNvbT47IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQNCj4gPGhpbWFsLnByYXNhZC5naGlt
aXJheUBpbnRlbC5jb20+OyB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsNCj4gU2Fz
aGlrbyA8c2FzaGlrby1ib3RAa2VybmVsLm9yZz4NCj4gU3ViamVjdDogW1BBVENIIHYyXSBkcm0v
eGUvdm06IEhhbmRsZSBwdXJnZWQgQk9zIGluIFZNIHNuYXBzaG90cw0KPiANCj4gQSBwdXJnZWQg
Qk8gY2FuIHJlbWFpbiBpbiBhIFZNIGFmdGVyIGl0cyBUVE0gcmVzb3VyY2UgaGFzIGJlZW4gZnJl
ZWQuDQo+IHhlX3ZtX3NuYXBzaG90X2NhcHR1cmUoKSBjYW4gdGhlbiBkZXJlZmVyZW5jZSBhIE5V
TEwgcmVzb3VyY2Ugd2hpbGUNCj4gY2FwdHVyaW5nIGEgZGV2Y29yZWR1bXAuDQo+IA0KPiBSZWNv
cmQgLUVOT0RBVEEgZm9yIHRoZSBhZmZlY3RlZCBWTUEgaW5zdGVhZCBvZiBkZXJlZmVyZW5jaW5n
IHRoZSByZXNvdXJjZS4NCj4gDQo+IHYyOg0KPiAgLSBSZWFkIHRoZSBCTyByZXNvdXJjZSBvbmNl
IHdpdGggUkVBRF9PTkNFKCkuIChNYXR0KQ0KPiANCj4gRml4ZXM6IGFkOTg0M2FhYzkxYSAoImRy
bS94ZS9tYWR2aXNlOiBJbXBsZW1lbnQgcHVyZ2VhYmxlIGJ1ZmZlciBvYmplY3QNCj4gc3VwcG9y
dCIpDQo+IFJlcG9ydGVkLWJ5OiBTYXNoaWtvIDxzYXNoaWtvLWJvdEBrZXJuZWwub3JnPg0KPiBD
bG9zZXM6IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDgzMTA2NDk0Mi4zMTU3
MjAtMTctDQo+IHRlamFzLnVwYWRoeWF5JTQwaW50ZWwuY29tP3BhcnQ9NA0KPiBDYzogVGhvbWFz
IEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogSGlt
YWwgUHJhc2FkIEdoaW1pcmF5IDxoaW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBD
YzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEFydmluZCBZYWRhdiA8YXJ2aW5kLnlhZGF2QGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfdm0uYyB8IDMxICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jIGluZGV4DQo+IDE5YjNkMGJlNzkyOC4uZmNkZDM0YzRmMGZhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdm0uYw0KPiBAQCAtNDY2MywyMCArNDY2MywyOSBAQCBzdHJ1Y3QgeGVf
dm1fc25hcHNob3QNCj4gKnhlX3ZtX3NuYXBzaG90X2NhcHR1cmUoc3RydWN0IHhlX3ZtICp2bSkN
Cj4gIAkJCVhFX1ZNX1NOQVBfRkxBR19SRUFEX09OTFkgOiAwOw0KPiAgCQlzbmFwLT5zbmFwW2ld
LnBhdF9pbmRleCA9IHZtYS0+YXR0ci5wYXRfaW5kZXg7DQo+ICAJCWlmIChibykgew0KPiArCQkJ
c3RydWN0IHR0bV9yZXNvdXJjZSAqcmVzOw0KPiArDQo+ICAJCQlzbmFwLT5zbmFwW2ldLmNwdV9j
YWNoaW5nID0gYm8tPmNwdV9jYWNoaW5nOw0KPiAgCQkJc25hcC0+c25hcFtpXS5ibyA9IHhlX2Jv
X2dldChibyk7DQo+ICAJCQlzbmFwLT5zbmFwW2ldLmJvX29mcyA9IHhlX3ZtYV9ib19vZmZzZXQo
dm1hKTsNCj4gLQkJCXN3aXRjaCAoYm8tPnR0bS5yZXNvdXJjZS0+bWVtX3R5cGUpIHsNCj4gLQkJ
CWNhc2UgWEVfUExfU1lTVEVNOg0KPiAtCQkJY2FzZSBYRV9QTF9UVDoNCj4gLQkJCQlzbmFwLT5z
bmFwW2ldLnVhcGlfbWVtX3JlZ2lvbiA9IDA7DQo+IC0JCQkJYnJlYWs7DQo+IC0JCQljYXNlIFhF
X1BMX1ZSQU0wOg0KPiAtCQkJCXNuYXAtPnNuYXBbaV0udWFwaV9tZW1fcmVnaW9uID0gMTsNCj4g
LQkJCQlicmVhazsNCj4gLQkJCWNhc2UgWEVfUExfVlJBTTE6DQo+IC0JCQkJc25hcC0+c25hcFtp
XS51YXBpX21lbV9yZWdpb24gPSAyOw0KPiAtCQkJCWJyZWFrOw0KPiArCQkJc25hcC0+c25hcFtp
XS51YXBpX21lbV9yZWdpb24gPSAtMTsNCj4gKw0KPiArCQkJcmVzID0gUkVBRF9PTkNFKGJvLT50
dG0ucmVzb3VyY2UpOw0KPiArCQkJaWYgKCFyZXMpIHsNCj4gKwkJCQlzbmFwLT5zbmFwW2ldLmRh
dGEgPSBFUlJfUFRSKC1FTk9EQVRBKTsNCj4gKwkJCX0gZWxzZSB7DQo+ICsJCQkJc3dpdGNoIChy
ZXMtPm1lbV90eXBlKSB7DQo+ICsJCQkJY2FzZSBYRV9QTF9TWVNURU06DQo+ICsJCQkJY2FzZSBY
RV9QTF9UVDoNCj4gKwkJCQkJc25hcC0+c25hcFtpXS51YXBpX21lbV9yZWdpb24gPSAwOw0KPiAr
CQkJCQlicmVhazsNCj4gKwkJCQljYXNlIFhFX1BMX1ZSQU0wOg0KPiArCQkJCQlzbmFwLT5zbmFw
W2ldLnVhcGlfbWVtX3JlZ2lvbiA9IDE7DQo+ICsJCQkJCWJyZWFrOw0KPiArCQkJCWNhc2UgWEVf
UExfVlJBTTE6DQo+ICsJCQkJCXNuYXAtPnNuYXBbaV0udWFwaV9tZW1fcmVnaW9uID0gMjsNCj4g
KwkJCQkJYnJlYWs7DQo+ICsJCQkJfQ0KDQpMR1RNLCBSZXZpZXdlZC1ieTogVGVqYXMgVXBhZGh5
YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT4NCg0KVGVqYXMNCg0KPiAgCQkJfQ0KPiAgCQl9
IGVsc2UgaWYgKHhlX3ZtYV9pc191c2VycHRyKHZtYSkpIHsNCj4gIAkJCXN0cnVjdCBtbV9zdHJ1
Y3QgKm1tID0NCj4gLS0NCj4gMi40My4wDQoNCg==
