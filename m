Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C81AC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 20:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE4710E02D;
	Mon, 24 Aug 2026 20:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2OrmEQ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE47210E02D
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 20:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787602704; x=1819138704;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7sDUVbmzGrGxlaaibAYNVoU3LmmiRC7ILa5h7dVFMuc=;
 b=M2OrmEQ+olbot+Vk140WgZoh6hYqNidcAQ6dr1EUacM2/6y2aqkEB/xU
 Q4YV+XIqx5dDlVigE0DEoqOhpxgQv9XTYpPK3SahbiDRZ+LnMqON34Fgh
 NpHa7goIjrc1JjhBlKi2LaN6gtUCcTQJZBq2MvjdFuLSwPzaIb3/JmSAe
 SnVW+Nngdre+0q57ycJrcA1ZbP3f1CmNrAUJhnjUkALUmNXHNfLnW+EY6
 PJ+OwRZMpt6UOuUwkFjfnxoPqW7Uf5HV3B05Jn8IsLq6ZeeLsHk8/lwNI
 EQgbkgoRndLJT3WKF9sLbbE/BtOnmFFURrFVRGUcNQCPAol4Fp3yFxLW8 w==;
X-CSE-ConnectionGUID: cfXLSZ8gRM+KOfCToP7syg==
X-CSE-MsgGUID: hC7mAkIgQNChll/OqWpFag==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87187370"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="87187370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 13:18:24 -0700
X-CSE-ConnectionGUID: SP1COz0bSYafpQ2Yt8ELOg==
X-CSE-MsgGUID: rFMzHTamQ2ais8CjtcDwHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="291947354"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 13:18:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 13:18:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 13:18:23 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 13:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DG+45JqbLrKacwaoo0xsiw0/CBDbjI9A3znWJ3//TrIYKX3EbPsutzKKBJB+6jvZLWEPAKTCQfJlu+g2ix4LJlEm5Xvs2Jn7Fe/LQ/kgfVawhgIGp5PL+CYjyzOkmgNAxPV4v51FHxxWjP9wKUmoma0iffAE0hep1T4goW7xv1BExCO2/9Gj+S/1HA6LD6BBGKmIM30iUsUtjGqX16nS+nSIqviUgTtaDkXy1cBrgbV8Tae0GioDphbx1GXiUoirZosJo8zUhvA96Y+O7DxFhqScmdcFLm/Ng0bH8y+ssAAbZ2tYj/sQ4MVqrLLV4q37uk7CFf/+0YIy2koK8ymrPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sDUVbmzGrGxlaaibAYNVoU3LmmiRC7ILa5h7dVFMuc=;
 b=R9YDzO89+mZoLT9n+cTSIUSzPZ6elMcioYZAxhMxW4pY6oJS2N922bbeStH/OLkJUJ4CqdSWEBYyzH23I9euINaOo63q5/MAWvRWc43Es69CEgtlzZ6zbPKp1/peOApznMVCq/Yxq8lh6YmQYIb4xW33CbVomWahK6QNxsL2nsQGXCyzyQ1iWIbFPdFkWkXcT9kFvgBZGxAmuSBhfEUdo+I3PjLiSQydZYGYvIiARqbggpEEP6hY5Ovc5qAogeF/+TBKorwwvOQJWUXT8vfNhjoHm+A35HKTc9/cNjDvsl9jFyUtmwl2BKAJYQawkJIuVvIKWpTmOhUvcFQrOLzauw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by DSWPR11MB9761.namprd11.prod.outlook.com (2603:10b6:8:356::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 20:18:21 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 20:18:21 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Wajdeczko, Michal"
 <michal.wajdeczko@intel.com>, "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: [PATCH 03/10] drm/xe: Split out configfs data structures
Thread-Topic: [PATCH 03/10] drm/xe: Split out configfs data structures
Thread-Index: AQHdMOfWGUECAczdwUGo+iJAmtv/ALapAvAAgASmqIA=
Date: Mon, 24 Aug 2026 20:18:21 +0000
Message-ID: <2d6bfbbf82eaaa08aa3bcf04e252f81d12ef7559.camel@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-15-stuart.summers@intel.com>
 <20260821211648.GF681121@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260821211648.GF681121@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|DSWPR11MB9761:EE_
x-ms-office365-filtering-correlation-id: 87462e6b-0e03-4426-a77b-08df021cd7fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|3023799007|22082099003|18002099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: iD2KuFyWxRFxfvheJj6BPA4rL/ZJ+bOmzuyEZLCFIc8NJH01Xl1ByiEjwjIhDMIvj4+BXf7jI56Pn0ppbT+u7/hIpmSgxOk1lJe/DkMKZlwmj5gvlNNTamrQdjC4hfW5sWPcoLdFf9QKLq3yuomGL7kmFay/hSuaGO7RdR/yhc9yAzdJ4kL3YqZR0HSMKgo1c1W5PJUMaiePky/TVQpnql7lcvfIvLrh4bEDFZMuVuN61djGG5HxfOFq+AoAfqnK8bVLdWDFoemkD7po/l7CiEuswlkRmAzSDRN6PceNZLpIA/UYY4wZ80eFo/YpBubzNuWU0EktUWOE9CB9YK0SSZ9LAAfCFlM+amRFOH/VP3bujQPoLKzj6fOVPqWoe3DYPMLmv2Kjgzk7Yv+3nBoy0nrkS1BdskkUUnp4hF6f7Bs3aHjDS/necEQqaTwuRYw8ja4ZwP6ezZFMo2Rxt8a6TASb//saUXT2+E7o9vLuqbVhy6E3qH91dUQqJ/5ysCqbZyeY99dDbcMQpvzmX/16yf5vMTa/Sjq3uEHcBvuyChtcmJouK3hestPKnI2a29L4tQjRZOI+e3YfkINgHM7mEKhW+tmw71D/lpdqkALpvRH5PVDHYaVg0MFGCCHIKMNMs2l7y4cOGNkbDwyuFY1AErmMjlVdAepFKtQH/RP3ljrqWHsgdVCxJ3vv6oS7ELvLddlakRWKmk4J6pCaN2kGNjiCSfW0jMoPCDEM0XezvvE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFhQVlZ1Uk9RYWp6TEJMNU54VVdsc0ZOa1B1S3BNaTJtQ2lsUklSdVJ3Mk5k?=
 =?utf-8?B?TUJJWHJKT0JPSStkME5rSERlZFk0Y3NBZ1Y3aFA3OTR1V2NvWVhOVUJpTzFB?=
 =?utf-8?B?RVhrMEZIME8vUXB4MjlKbGl3aFhTUWxZT0NCNEhCbUZ0LzdMSWZtNzFGdUhH?=
 =?utf-8?B?R3hvZExNMDNqQWxxTUFoZXcrQk4xUGtYMEI3OTNEajNod0kxZ0taQVRveitP?=
 =?utf-8?B?bWxoS1IzL3d5TjVVWXdpbCs0Z2NiUVNPYlVBYWtKeGVqMExCbGdIa0MzU2F1?=
 =?utf-8?B?TEM2R2UwMjgvakxHZkR0MHIycjJheEErUzRjbzdNbWxEYnFjSy9YY0xoaTJv?=
 =?utf-8?B?bWtQcUNRR0gvcnZSVTc5dUxwemQrWWpSSllBR2RlTkFWdUtidGhyaXhOVjY3?=
 =?utf-8?B?VGo3NjQ4WFRNTDBKei95MTVvSXpkRVB3c3hLREQ1cUdrZG9oVG9CMU5tUjR5?=
 =?utf-8?B?bk5aSzJVU05vc2FGZnZtSy8yWnVKcmdYcjlYTURzT1RReUdNL3hLYXNNMzh5?=
 =?utf-8?B?MHk2cDkycG1sd2xJdlBRb25scUlKMGs1YVNWTlJpdmlHSkg1c3EwWDJqUE4v?=
 =?utf-8?B?VXhUTGVPM0xlU1JvUTNnbjNkNlBRVGQ0cW02Q0Y0WjdZR293ZjZ3QzFqZTB5?=
 =?utf-8?B?c2VLUnFGN21uaDFwNUN2UnVrN1VqMWRTYS9nakdvL3A2YURIUUxVSTZqQlJu?=
 =?utf-8?B?WFM4VVdhc0NETmU5ajRjS0dOWkJPQnVIUjlnUUZYL01xeE5wdzlGcUY2N1ZJ?=
 =?utf-8?B?aWRjbytabWlGcU11SFNmeUdJamxnZG92R3ZYVVg0TlRrMlF1alNBanJ5TmRT?=
 =?utf-8?B?em5hamRNSFNYeE0rSWIvWUxSUldCRnVUSWQwaUF1YXk1anhuZGEwckExNmdp?=
 =?utf-8?B?Snd0aHVVYnNFdlViYzZ5TXNWR1VWRWlGS0lQSFk5V2xhUGMxMjM0QVVyT0Fi?=
 =?utf-8?B?TzJJVzhBM1pQcHRxRkphcU9UcDRJYXBZaGZHcEpwdllkQkVTL1pubkYxdFl1?=
 =?utf-8?B?U3NmSzMwUmllV1R1ZFBmMzY0VFM5M09WcURKRGFJUklEcjlnbUdUeS9sR1h1?=
 =?utf-8?B?NmlTN3RrUUhLa3ZFYXdjWDZaYzhYbFFJek1ySTlvdE1oTXZjSk1FVEplcElT?=
 =?utf-8?B?OEt0RWRyQ0YxZjlaM3ozVmFIU3JpUk5CUnQxS2dxVEtxQW96NWZQSlRKQUc2?=
 =?utf-8?B?QkIrSGd0NDNMZUZ0Z202NUFERllvMzZXRVd0emIvSGtNY2x5T0V1bi9NSGpl?=
 =?utf-8?B?UTRrdU9pUHJoY1Q2SlVIVHNQZ1ZJR0pROXF0eHdpZ1VLMGR4c1VOQ1JtUHhL?=
 =?utf-8?B?L3ZWSHJrdGJpWjd5R1Z2NDVMTjY0Z3o2UWlpY0JZTEZxb3FPQnlmUzhFazl6?=
 =?utf-8?B?anVucS9jejYrUisrRDhCb1pmMEREUktXYzBRbWdZdFh0VEVjUGoxWDYwQWlM?=
 =?utf-8?B?b1pJT1lvS3NyVlY5Y2t6TjNlOGpjY2tMMFEzNUZxYThOVWh3eW14b2tOazBy?=
 =?utf-8?B?bmF1eDZpTEx6SDQrTlh1SXNMVjhGZDJ3WEVKbURqK2VsK0tCUUtVTkFOdFYw?=
 =?utf-8?B?bUJlMEdBb21SNHhOMDV2RUhHbkZhdHZFK2R4Mk5oUjJ3dHpFQytVNlRabHI2?=
 =?utf-8?B?elQxelQ5dEY4eDUzSVRGaEpnMkpzNkxJbjNuTGNzdG1ZQWxXcnJDa3VJS1Fv?=
 =?utf-8?B?QzFMM1hsY2xVVm9GZ3JYTEQybUt5MVJad3dPNFJkbEpUK2tqNFpRb0swanph?=
 =?utf-8?B?TXowdUxGcVNJWE42OE9GRW5WRDJaeTJtUVhoT0dXSWgyYnJxMjlPOHhkZnZF?=
 =?utf-8?B?U0VBYWhjeWVMM3hCOVkydVlRUG5KS04yUkdmKzBlWmFRdmt5N2N3blJYcHdz?=
 =?utf-8?B?Y1ZIQXlQT0pkMnFPMTc4L3A1alNZaEU5MXU4SGxSbDJ4OUF1QWdTeDBYQzlE?=
 =?utf-8?B?bEJsOE5mRWhSRHdJT0hXM0piU0NIdE10Y0x6bFVtQ3RxdWx2cEhiaU1sT2Vv?=
 =?utf-8?B?NjdrakdpdDFsRy92d3JjZnhkR1lRSE8wU1J2NTZxbUVzdlNINHc0Wkh1cy9H?=
 =?utf-8?B?dGNnNUxGS3JONHRNYkprWlRmZ2VyTEZtTDRDUWdaWlpzNUcxUlc1dkFteU54?=
 =?utf-8?B?ZWZBTU4ydWFwdFVGNVlZcEhhV0w5ZGNKNTVJYllwSGYrTHRGYlZJSU8vVndh?=
 =?utf-8?B?cFdMcTdBcjczNzNxK1duMWJQc2RaMjEzZzBvZVV3Wk84c3R6ckw2VlpxNGFB?=
 =?utf-8?B?cEpobyt5M2RoTzJqbkc2WjZlVUpSTnYxaklWejRlU3VNMGNqSmZUS1RWQjZz?=
 =?utf-8?B?UmVObTJjWXZkc3ZHWXkwTzRNSW1scTJjUU0vMzY2a3F3QjNMbTZYcTNiMFRy?=
 =?utf-8?Q?lp3id2XMzNn+JXg4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B92D53A82031ED4C8C156C9A5DB32882@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Cy9Xs+h0ssK15ZLaQIPvFmM8EIvP1IVa+uMWNrjPNj2NaZnvtvRD0KrRfoGfaX4CO49mvwyw66D0p4b39s5TvG7CEtmVWSI02vuQeLs+gw2Ny/wASuxJzAg2NEDgld+k6/m3El+qpAtWb/BdcI3JUcmMvMKpd5xkJZH2l1Spbd5lEIm0K1FvcmIEzr4s7YI09nTNw4DRf3aFhBL8+Ld2M0BzlUIqDD6RYJGrSMWtupn8H3rtkf3TgA/WM6S746F4vftRxVFUmwz1XYcb7HXlz6CNGpVuEvTA2JGeU36Pyz8g+4sedN1mLjc/tP34WvNXv/Plv/qiYlrzDjoeYN2c+g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87462e6b-0e03-4426-a77b-08df021cd7fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2026 20:18:21.3493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FrCz4jE9wFJWTt2ktt6I7ZzLaKR/z995Zn/aimOuTiVxIr7cqCqrAORZvumIGJl9kDjI1xQpDztY+SJFXN1asn/26fa/nbLUQcvIG37mCWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9761
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

T24gRnJpLCAyMDI2LTA4LTIxIGF0IDE0OjE2IC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOgo+IE9u
IFRodSwgQXVnIDIwLCAyMDI2IGF0IDA5OjA2OjQyUE0gKzAwMDAsIFN0dWFydCBTdW1tZXJzIHdy
b3RlOgo+ID4gUGxhbm5pbmcgb24gbW92aW5nIGRlYnVnIHNwZWNpZmljIGNvbmZpZ2ZzIHBhcmFt
ZXRlcnMKPiA+IHRvIHRoZWlyIG93biBmaWxlIGluIGEgZnV0dXJlIHBhdGNoLiBJbiBwcmVwYXJh
dGlvbiBmb3IKPiA+IHRoYXQgY2hhbmdlLCBtb3ZlIHRoZSBzdHJ1Y3R1cmVzIGluIHhlX2NvbmZp
Z2ZzLmMgdG8gYQo+ID4gbmV3IF90eXBlcy5oIGZpbGUgc28gd2UgY2FuIGVhc2lseSBhY2Nlc3Mg
dGhlbSBpbiB0aGUKPiA+IGRpZmZlcmVudCBjb25maWdmcyBmaWxlcy4KPiA+IAo+ID4gRG9pbmcg
dGhhdCBzZXBhcmF0ZWx5IGhlcmUgaW5zdGVhZCBvZiBjb21iaW5pbmcgd2l0aAo+ID4gdGhlIHBh
dGNoIHRoYXQgYWRkcyB0aGUgZGVidWcgZmlsZSBmb3IgZWFzZSBvZiByZXZpZXcuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+
Cj4gPiBBc3Npc3RlZC1ieTogQ29waWxvdDpjbGF1ZGUtc29ubmV0LTQuNixjbGF1ZGUtb3B1cy00
LjcKPiAKPiBSZXZpZXdlZC1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNv
bT4KClRoYW5rcyBmb3IgdGhlIHJldmlldyEKCj4gCj4gPiAtLS0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2NvbmZpZ2ZzLmPCoMKgwqDCoMKgwqAgfCA0MSAtLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaMKgwqDCoMKgwqDCoCB8wqAg
MiArLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlwZXMuaCB8IDUzCj4g
PiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDU0IGlu
c2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzX3R5cGVzLmgKPiA+IAo+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9jb25maWdmcy5jCj4gPiBpbmRleCBjYjZhYjFmY2I4YzEuLjAyOWM5ZjY4MmM4ZSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9jb25maWdmcy5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuYwo+ID4gQEAgLTQsNyArNCw2IEBACj4gPiDC
oCAqLwo+ID4gwqAKPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPgo+ID4gLSNpbmNsdWRl
IDxsaW51eC9jdHlwZS5oPgo+ID4gwqAjaW5jbHVkZSA8bGludXgvY29uZmlnZnMuaD4KPiA+IMKg
I2luY2x1ZGUgPGxpbnV4L2NsZWFudXAuaD4KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2ZpbmQuaD4K
PiA+IEBAIC0xNywxMCArMTYsNyBAQAo+ID4gwqAjaW5jbHVkZSAieGVfY29uZmlnZnMuaCIKPiA+
IMKgI2luY2x1ZGUgInhlX2RlZmF1bHRzLmgiCj4gPiDCoCNpbmNsdWRlICJ4ZV9ndF90eXBlcy5o
Igo+ID4gLSNpbmNsdWRlICJ4ZV9od19lbmdpbmVfdHlwZXMuaCIKPiA+IMKgI2luY2x1ZGUgInhl
X21vZHVsZS5oIgo+ID4gLSNpbmNsdWRlICJ4ZV9wY2lfdHlwZXMuaCIKPiA+IC0jaW5jbHVkZSAi
eGVfc3Jpb3ZfdHlwZXMuaCIKPiA+IMKgCj4gPiDCoC8qKgo+ID4gwqAgKiBET0M6IFhlIENvbmZp
Z2ZzCj4gPiBAQCAtMjU5LDQzICsyNTUsNiBAQAo+ID4gwqAgKsKgwqDCoMKgwqAjIHJtZGlyIC9z
eXMva2VybmVsL2NvbmZpZy94ZS8wMDAwOjAzOjAwLjAvCj4gPiDCoCAqLwo+ID4gwqAKPiA+IC0v
KiBTaW1pbGFyIHRvIHN0cnVjdCB4ZV9iYiwgYnV0IG5vdCB0aWVkIHRvIEhXICh5ZXQpICovCj4g
PiAtc3RydWN0IHdhX2JiIHsKPiA+IC3CoMKgwqDCoMKgwqDCoHUzMiAqY3M7Cj4gPiAtwqDCoMKg
wqDCoMKgwqB1MzIgbGVuOyAvKiBpbiBkd29yZHMgKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0cnVj
dCB4ZV9jb25maWdfZ3JvdXBfZGV2aWNlIHsKPiA+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCBjb25m
aWdfZ3JvdXAgZ3JvdXA7Cj4gPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgY29uZmlnX2dyb3VwIHNy
aW92Owo+ID4gLQo+ID4gLcKgwqDCoMKgwqDCoMKgLyoKPiA+IC3CoMKgwqDCoMKgwqDCoCAqIEZp
ZWxkcyBzb3J0ZWQgYnkgdHlwZSAobGFyZ2VzdCBmaXJzdCkgdGhlbiBuYW1lOiBzdHJ1Y3QKPiA+
IGFycmF5cywKPiA+IC3CoMKgwqDCoMKgwqDCoCAqIHU2NCwgdTMyL3Vuc2lnbmVkIGludCwgdTgs
IGJvb2wsIHN1Yi1zdHJ1Y3RzIGxhc3QuCj4gPiBXaXRoaW4gZWFjaAo+ID4gLcKgwqDCoMKgwqDC
oMKgICogdHlwZSwgZW50cmllcyBhcmUgc29ydGVkIGFscGhhYmV0aWNhbGx5Lgo+ID4gLcKgwqDC
oMKgwqDCoMKgICovCj4gPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfY29uZmlnX2RldmljZSB7
Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHdhX2JiCj4gPiBjdHhf
cmVzdG9yZV9taWRfYmJbWEVfRU5HSU5FX0NMQVNTX01BWF07Cj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHdhX2JiCj4gPiBjdHhfcmVzdG9yZV9wb3N0X2JiW1hFX0VO
R0lORV9DTEFTU19NQVhdOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHU2NCBl
bmdpbmVzX2FsbG93ZWQ7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTY0IGd0
X3R5cGVzX2FsbG93ZWQ7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYm9vbCBl
bmFibGVfbXVsdGlfcXVldWU7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYm9v
bCBlbmFibGVfcHNtaTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBib29sIHN1
cnZpdmFiaWxpdHlfbW9kZTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3Qgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1
bnNpZ25lZCBpbnQgbWF4X3ZmczsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYm9vbCBhZG1pbl9vbmx5X3BmOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoH0gc3Jpb3Y7Cj4gPiAtwqDCoMKgwqDCoMKgwqB9IGNvbmZpZzsKPiA+IC0K
PiA+IC3CoMKgwqDCoMKgwqDCoC8qIHByb3RlY3RzIGF0dHJpYnV0ZXMgKi8KPiA+IC3CoMKgwqDC
oMKgwqDCoHN0cnVjdCBtdXRleCBsb2NrOwo+ID4gLcKgwqDCoMKgwqDCoMKgLyogbWF0Y2hpbmcg
ZGVzY3JpcHRvciAqLwo+ID4gLcKgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IHhlX2RldmljZV9k
ZXNjICpkZXNjOwo+ID4gLcKgwqDCoMKgwqDCoMKgLyogdGVudGF0aXZlIFNSLUlPViBtb2RlICov
Cj4gPiAtwqDCoMKgwqDCoMKgwqBlbnVtIHhlX3NyaW92X21vZGUgbW9kZTsKPiA+IC19Owo+ID4g
LQo+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX2NvbmZpZ19kZXZpY2UgZGV2aWNlX2RlZmF1
bHRzID0gewo+ID4gwqDCoMKgwqDCoMKgwqDCoC5lbmdpbmVzX2FsbG93ZWQgPSBVNjRfTUFYLAo+
ID4gwqDCoMKgwqDCoMKgwqDCoC5ndF90eXBlc19hbGxvd2VkID0gVTY0X01BWCwKPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaAo+ID4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfY29uZmlnZnMuaAo+ID4gaW5kZXggYmJhNTkyZmI2MTJjLi43ZGIyZjQ2Mjkx
ZmEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMuaAo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmgKPiA+IEBAIC04LDggKzgsOCBA
QAo+ID4gwqAjaW5jbHVkZSA8bGludXgvbGltaXRzLmg+Cj4gPiDCoCNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPgo+ID4gwqAKPiA+ICsjaW5jbHVkZSAieGVfY29uZmlnZnNfdHlwZXMuaCIKPiA+IMKg
I2luY2x1ZGUgInhlX2RlZmF1bHRzLmgiCj4gPiAtI2luY2x1ZGUgInhlX2h3X2VuZ2luZV90eXBl
cy5oIgo+ID4gwqAjaW5jbHVkZSAieGVfbW9kdWxlLmgiCj4gPiDCoAo+ID4gwqBzdHJ1Y3QgcGNp
X2RldjsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlw
ZXMuaAo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNfdHlwZXMuaAo+ID4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2JlN2Q2MTYwYjRjCj4g
PiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnNf
dHlwZXMuaAo+ID4gQEAgLTAsMCArMSw1MyBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBNSVQgKi8KPiA+ICsvKgo+ID4gKyAqIENvcHlyaWdodCDCqSAyMDI2IEludGVsIENvcnBv
cmF0aW9uCj4gPiArICovCj4gPiArI2lmbmRlZiBfWEVfQ09ORklHRlNfVFlQRVNfSF8KPiA+ICsj
ZGVmaW5lIF9YRV9DT05GSUdGU19UWVBFU19IXwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9j
b25maWdmcy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgo+ID4gKyNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlICJ4ZV9od19lbmdpbmVfdHlwZXMuaCIK
PiA+ICsjaW5jbHVkZSAieGVfcGNpX3R5cGVzLmgiCj4gPiArI2luY2x1ZGUgInhlX3NyaW92X3R5
cGVzLmgiCj4gPiArCj4gPiArLyogU2ltaWxhciB0byBzdHJ1Y3QgeGVfYmIsIGJ1dCBub3QgdGll
ZCB0byBIVyAoeWV0KSAqLwo+ID4gK3N0cnVjdCB3YV9iYiB7Cj4gPiArwqDCoMKgwqDCoMKgwqB1
MzIgKmNzOwo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIGxlbjsgLyogaW4gZHdvcmRzICovCj4gPiAr
fTsKPiA+ICsKPiA+ICtzdHJ1Y3QgeGVfY29uZmlnX2dyb3VwX2RldmljZSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgY29uZmlnX2dyb3VwIGdyb3VwOwo+ID4gK8KgwqDCoMKgwqDCoMKgc3Ry
dWN0IGNvbmZpZ19ncm91cCBzcmlvdjsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qCj4gPiAr
wqDCoMKgwqDCoMKgwqAgKiBGaWVsZHMgc29ydGVkIGJ5IHR5cGUgKGxhcmdlc3QgZmlyc3QpIHRo
ZW4gbmFtZTogc3RydWN0Cj4gPiBhcnJheXMsCj4gPiArwqDCoMKgwqDCoMKgwqAgKiB1NjQsIHUz
Mi91bnNpZ25lZCBpbnQsIHU4LCBib29sLCBzdWItc3RydWN0cyBsYXN0Lgo+ID4gV2l0aGluIGVh
Y2gKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIHR5cGUsIGVudHJpZXMgYXJlIHNvcnRlZCBhbHBoYWJl
dGljYWxseS4KPiA+ICvCoMKgwqDCoMKgwqDCoCAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX2NvbmZpZ19kZXZpY2Ugewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0
cnVjdCB3YV9iYgo+ID4gY3R4X3Jlc3RvcmVfbWlkX2JiW1hFX0VOR0lORV9DTEFTU19NQVhdOwo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB3YV9iYgo+ID4gY3R4X3Jl
c3RvcmVfcG9zdF9iYltYRV9FTkdJTkVfQ0xBU1NfTUFYXTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB1NjQgZW5naW5lc19hbGxvd2VkOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHU2NCBndF90eXBlc19hbGxvd2VkOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGJvb2wgZW5hYmxlX211bHRpX3F1ZXVlOwo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGJvb2wgZW5hYmxlX3BzbWk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgYm9vbCBzdXJ2aXZhYmlsaXR5X21vZGU7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3RydWN0IHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IG1heF92ZnM7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJvb2wgYWRtaW5fb25seV9wZjsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IHNyaW92Owo+ID4gK8KgwqDCoMKgwqDC
oMKgfSBjb25maWc7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBwcm90ZWN0cyBhdHRyaWJ1
dGVzICovCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbXV0ZXggbG9jazsKPiA+ICvCoMKgwqDC
oMKgwqDCoC8qIG1hdGNoaW5nIGRlc2NyaXB0b3IgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoGNvbnN0
IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyAqZGVzYzsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIHRlbnRh
dGl2ZSBTUi1JT1YgbW9kZSAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgZW51bSB4ZV9zcmlvdl9tb2Rl
IG1vZGU7Cj4gPiArfTsKPiA+ICsKPiA+ICsjZW5kaWYgLyogX1hFX0NPTkZJR0ZTX1RZUEVTX0hf
ICovCj4gPiAtLSAKPiA+IDIuNDMuMAo+ID4gCj4gCgo=
