Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A22CD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 10:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5673B10E462;
	Wed, 10 Jun 2026 10:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k83dMbvI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A6610E46F
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781088271; x=1812624271;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WAvPKrrRQD1nJM9bgZtRDz2PoGvvywu9jYqMj43Janw=;
 b=k83dMbvIZe1vMr6PkGCPjosFqO9kSvUmAWXNI2hU2zWkrl38O/5I6Zsz
 7k6ZdicyWNr4p2g7k0lnw58I7HjzqPSxHAvYZcUu524H8vffZYaddi4Iv
 HvfEfeoU/6I0k/9xezUzo7oy5yHDQOsevcxidxnr3x9kiesOzATnqGUAk
 qmXTX0OIjBrYJufHWovDAoloX9T3LJs2tWSxRFjCBBIQokAXwiJWlXjun
 CVcmBBKD3G1QWiuG3DIjodI3qWFUCbzsh2x05+m1YLoN99AOAHtiaptq0
 iH06vJRx3ax/nmSql/hlQpy9QoQmhSLcF1YcZniOLtw0yhFfdc69y5W/Q g==;
X-CSE-ConnectionGUID: rFgXqLhmQIC8YHBToxcsFA==
X-CSE-MsgGUID: cm2jWrbhQLWCXG+5ZAII0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81726047"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81726047"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 03:44:31 -0700
X-CSE-ConnectionGUID: +wU7p8f/QE+xdMNnA0/WlA==
X-CSE-MsgGUID: BOg0myAeRaCou1fXImssXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="248001076"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 03:44:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 03:44:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 03:44:30 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 03:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQfn5RQ7btMyQr/ZyPzgaK1Ewht/kNCTV1gPfW7ofp7N+8jNdOCsify7uq5lLsgCGRdZcZ4/FMa3H0p1pGH0m6d6BCm60+aaDOITRnh56zXV77fIe8gFoTS2t28uGIiLYIVSec4P9qlmMb3Hw+ssSGsswGtMmzOaO/Rr/FH16vSetSZ9gGy3jHANRU12WOBcjvQmGSfvQ1/Q5XDuMgMAuN6yeSPuJXvYGo0EIV7kIE0r1gopVrYOA/O+A9N0K51ChbeFxEcAYFvDjJG/pAjm9gRT+A0Jv2+/LjaYxgLKbmw+/TvUD6JBKXApgSUEr5s38rV2i3k7kPF+Rs5stV4UYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAvPKrrRQD1nJM9bgZtRDz2PoGvvywu9jYqMj43Janw=;
 b=HGpyRwUpw2FnfAQBVPFHus+wy46I2L7HAsBYn59ExDXRKH/eXG9L8mqnzhKJ0gMw6kTx2ibw/RL/qWJK4uhl8I9KVPCUxbpIb4eorBmvDB8+mkiR6GTlO5RqSKC6ZF6JXBI+F7pRzvSk9Uqjjor+lV1lcCf6/H12FgznVdHB3ewPT7dtJOiMeAjpUAx9vmeScSNQu+y5ujyyYNSkchAv9ea5LMKBdGVWWiWbbPHrAVavJphIptFwHOAlvVlQFped5DtYg6nxjBi5MwCkvWy5tvB+jQAcfw8YgGbOJ6M64XIEjN3H9ZjQR+4v2WCuYpyAY8u9Higag5B5psps33CgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 10:44:21 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 10:44:21 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] drm/xe/pat: Fix invalid L4 cache policy in xe2_pat_ats
Thread-Topic: [PATCH] drm/xe/pat: Fix invalid L4 cache policy in xe2_pat_ats
Thread-Index: AQHc+KGslqn8n0w9EECTD3VHHbJnZ7Y3d34AgAAME3A=
Date: Wed, 10 Jun 2026 10:44:21 +0000
Message-ID: <SA3PR11MB81189D05FB81C95A0A72F6D6D01A2@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260610065923.3382050-2-nitin.r.gote@intel.com>
 <f98bc6f4-aab6-4be9-8ec6-5d479bec551b@intel.com>
In-Reply-To: <f98bc6f4-aab6-4be9-8ec6-5d479bec551b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|BY1PR11MB8029:EE_
x-ms-office365-filtering-correlation-id: 0a77385b-a825-4bbb-ad00-08dec6dd3adc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|4143699003|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: SHffMj9HPC874pAOeLR+7Fdu9+bQy8xjWLOtoEZFtHzqI/Cwq51hxftezZt6o6CcZ5t+N2ugRoGgzIbozAaEg8+bNICnUuS/ppSTDiotgd/d/BMFrSTEWAXpHrzFsPZYFTLyjXmcUE58nphig+iWvaPiGDm3BsTHDe8eAj4H3Q0YieBuDLTeZ9W/HVMGMsRRdlbTRBQ0h1wrIN5nUR61wFJmPw2UKXHKWeam+AbYsQElIay5HxOyUiE7ixNrxQNdTLF8QPNre/AX+zog/CCop2JVUv8n566dVwgd+R/MdoXedZxIK10a/cocZPaCz/MBLSKxVvaWcfTOqFnzzUoxmb2Yu4V4Vnd4iXa92oyKIKU7rq6Uce2emjiu/KpL6fZKA+59EDfdBu8myuzAvFJSVNdBm7X6pWoL8kxGW5gODI/QcCdetHo/SVbcjNLDefyoP9zE5EftW7BfyeNYAk8XFUGStNe/8bIpnlYyiMOJJxXYgleMYKDiNtO10GRW8G9nVNhC7GRx1bzkOCMerWoVzuYGVIXJsOcK4uoMnENTX5TAYCl92f27Atvn0mCfYWpVBjl9UA0JzmOCxW+F9NbJGrhK9SWiEA/U0svI+EHZBy2+cuqsa/Vt/71VraVkr+W3nnmKAmxJnnYViNbDxb2UlG2D4k5JoApMNzjYBLtRYdF2HZhVZequNgMzs1hOMm4RE2Fh9inkuYi7bdLKbppdf8KvlThUQTgSCV3JMGKt0lOI/D5y6HmgedyGk7PbbJVf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFhSQVVzbXNqZnR6bHc2MUhnRy9DK0xuZzRidlova1ZWMnRkcFpXTE93enFo?=
 =?utf-8?B?SGxWVGlLSGFEUmJ2Q2RuVUFtM3hEQjZRWGNaMllUUkxaTTdobWlqdHQyV3dC?=
 =?utf-8?B?azA0NmgyVXY1aHZ0OXZEa1I5aFBRbjFqVy9wYlBJeU16dDhQbXVBQXIweWRW?=
 =?utf-8?B?NkNMVzBBdGlPdUJsTHRiMEdzOVB1dWNOcVljcHJuckRSRVBWVWt4TU9XMU1Q?=
 =?utf-8?B?QmkrU001eTRJTnlGNi96UGN1Y05uRnkxKzhPN09LeUhieXQzOEN6d0psNFVl?=
 =?utf-8?B?bkZJL3hZN051Nzh6TW85bjZVZTlzekYwYW1sYzdJYW5NOEptS1hVYitFYUFE?=
 =?utf-8?B?MDdaM09ZRmV6NFVMVmhhU2MycGdNY1F4RXRIZmd0bFp6R0xvS0NhT0dnTHpz?=
 =?utf-8?B?dWNqWUxyYzVDRkpaLzNETDBtQW9xTTlCOXkrLzhkWWlYb2VDRDBZVzVVTm10?=
 =?utf-8?B?OGpqeUY3OEMva1JjRnpKNGtZK2lHcXROdnRZZGhWbUd5d09yV0hERFM3MHQ1?=
 =?utf-8?B?TVhTdGNQL0Z5OEhIWmVSOGlIS2FDL09xZTRWUGhvOU5PT21md1BDNjRWZEk3?=
 =?utf-8?B?aDcvUWRMdTFlb3MrQXVVbzV6c0xUMURETUJtZGJ4Q1VmYndURUVCZmpzZ2tI?=
 =?utf-8?B?a2txUUFJZHo1VHZXajdkdnV2SEhEenl6QlYyQi95b2llZTFsNDZxWGlVR3Zk?=
 =?utf-8?B?WW13ZFpnUlAweE1jUFJ5WVN1LzF6RGEwdmwwTnVCZnhxUldyTTJ1cTNOL0pW?=
 =?utf-8?B?YmExbFhpaXp4S1BpLzlxbHVtSEMvVk5oVzgvalBKeVdTOWI4TVcvcXYzUFI1?=
 =?utf-8?B?SnpKUzZycHJNbW1PT2gxL3BsTU1kTk1nZjlSM2MyOXh5c3dWUENXWExFUGps?=
 =?utf-8?B?TCtTSk5qTmM5Z29xeHRzb3VQNi94ZUVZSTNFdnZrck1qZVNvTm52MFYvOHNa?=
 =?utf-8?B?emdoeXFxUkpKSXZ3T0tKSkpCenI1ek5YcFRUYzcvUFpqRGVMdURHQklrN3hW?=
 =?utf-8?B?YkJOUHJkZCt3QnNsdUJqOStTandzdE9FY0VLcytvN2k5N0lldTBIRGQ1RnJO?=
 =?utf-8?B?ZEl5NmREdktmTEZyOFRqNWRpUnJzOHBLa05HbURVSVJvb2s2Nkh3ay9QVlcx?=
 =?utf-8?B?RTdhalVjUjN3Rk9sOW0xeE5xU1ptdVNuZ1o5WkpXYkl5OGFIUXlodCtScUp4?=
 =?utf-8?B?NlNCVkJDRGN0NkNPTlNyd1Azb2dMR1pScUpQQWJGTUpQOExTSEhheDZlY3F6?=
 =?utf-8?B?TWh4Z1Z1ODdBc0RvOXJnN3RSZGwxMXg0TEYrdWFSR0dya3M3d3IveHY4cHh2?=
 =?utf-8?B?cnZaR1NPYnU1OWJzVTJIRUJXUGtVRU4wZ3BTcGtyY0RkTDY2T3d6dGREaFdN?=
 =?utf-8?B?VFZvSjBtZGtjUytESGtXS3M0WDdPK1NzdlVNQ210QllsNHJUU3dZYnVkYnBB?=
 =?utf-8?B?NnNUKyswL3FxbmZnSTBoOWxwRFZQR1BYVnFhTDBGN1Q3UEExNWFjUmVqVUF4?=
 =?utf-8?B?T0F1VE9hMWtwOE1EK05pOVRsdkJoSFJqVE5rVmxETHNnN1Awb1o2TnViU0Rt?=
 =?utf-8?B?cjV6QnRwSVlGK1NVaEdYMjhNV0pwejQzaHd6MlJyRXhMVVNncmJoK250ZlJT?=
 =?utf-8?B?RmF6bHJoNkt6dkRGQnoreDFZdHpxVXVicWJPbW81SnE4T1RCcExyMWtERE5L?=
 =?utf-8?B?S2ZWVjMyWHU1SmV2N2ZsS1RRYVFRcUJFMHdpRDk3LzRoUlY0NkNUV2YvK2th?=
 =?utf-8?B?ZDNIUVMzbVFoMXVqMEhsTUhFdnhMVy9kUm5xSm4yVEttWlVKbUE1MytxcWRR?=
 =?utf-8?B?OUZzalU4UzNIdi9xZUR2Ty9SVUVUb1V6eW9qeW5YS0RrNzR0UkluRXRrVUJp?=
 =?utf-8?B?MncybmtEV3VBVVZFaGcxdEg0TDZaR1Q1NHFOY0ZObXFFQlZLdjA4aER1ZnRH?=
 =?utf-8?B?blUrVXpoclp5V0s3YUtuTmVCUHlmYVhHaDIwQ082aXR1eUQ0MkJybzhEU1BQ?=
 =?utf-8?B?U0hOb0NQY295a2Q1VWJiVkgrSU5GZUxzSmJ1UGhlRTlLai93WGp6c3hPV3lQ?=
 =?utf-8?B?RjhYNm43anRVelNxV3poN0ZmUUVYL04xdnNOMy9xZ0RYanNmRVZaekdjd0ty?=
 =?utf-8?B?YmgxaUpNZTZjS2NXOXc0R1dndWhDQkdZRWhRcWpmdno4bnVSSHFoVm9UMVhF?=
 =?utf-8?B?bytHUVZRWmlSQUZta2tpNmdranF1V1BxNU50TDFuemxhZnlLdEFqUm5OSDcw?=
 =?utf-8?B?ak9VQ01tckY1SkUzT2ZzYkhkYVd2d0dkZGlNRkxYODhUN3hFT3l2T20vanlr?=
 =?utf-8?B?dGlhek5kZDhjOUJOYzdwYkdNQWpjMnZ4eGt1L0JHSERsN0U5QlFpdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nf1ALwVzMeTs1Mz2siAOm+qR6IsGu3VxCkn/weduB16sItLGnhkEnudQ2URpox3cPluxY0usyBnBZ+YuMTMMDPpcAhRurdrCQveD2voVMx2QbW7o8Fesw5zXUffrQGGbWrQ1YO8g26CikZSJcmyovuDnVRLKFOUW4Nj6w0QBmQvReGOIhIOuph7iA5oCDi9PyFCKvL3FpR7GE1ANa26boUXZe91y+OKMWFGDoyGFfUmOxvbLdto2f68o/95+NhfxrUwHInYSzibfRJr39Y1K86FzdYBiK74muBRX+oY9vUJA95JEO3ZzPAjiXMtYqB68lUUqcjNVQHo91WwDCvOLQw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a77385b-a825-4bbb-ad00-08dec6dd3adc
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 10:44:21.0698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xFR7Y3c2JgRl6alMxWzT1Al4DPVN8+HWvexfj++2T2+5qGBP9EIrO+OlaCfrvP+ttfqRYRVoTzdBnrHwVuIAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
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

SGkgTWF0dCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBdWxkLCBN
YXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUg
MTAsIDIwMjYgMjowOCBQTQ0KPiBUbzogR290ZSwgTml0aW4gUiA8bml0aW4uci5nb3RlQGludGVs
LmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogU3VtbWVycywgU3R1
YXJ0IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
bS94ZS9wYXQ6IEZpeCBpbnZhbGlkIEw0IGNhY2hlIHBvbGljeSBpbiB4ZTJfcGF0X2F0cw0KPiAN
Cj4gT24gMTAvMDYvMjAyNiAwNzo1OSwgTml0aW4gR290ZSB3cm90ZToNCj4gPiBUaGUgeGUyX3Bh
dF9hdHMgZW50cnkgd2FzIHByb2dyYW1tZWQgd2l0aCBMNF9DQUNIRV9QT0xJQ1k9MyAoVUMpIGFu
ZA0KPiA+IENPSF9NT0RFPTMgKDItd2F5IGNvaGVyZW50KS4gUGVyIGJzcGVjLCB3aGVuIENPSF9N
T0RFIGlzIDItd2F5ICgxMWIpLA0KPiA+IEw0X0NBQ0hFX1BPTElDWSB2YWx1ZXMgMDEvMTAvMTEg
YXJlIGFsbCByZXNlcnZlZCBhbmQgZm9yY2VkIHRvIFdCIGJ5DQo+ID4gaGFyZHdhcmUuIFRoaXMg
Y2F1c2VkIGEgbWlzbWF0Y2ggYmV0d2VlbiB0aGUgcHJvZ3JhbW1lZCB2YWx1ZSAoMHhmKQ0KPiA+
IGFuZCB0aGUgcmVhZGJhY2sgdmFsdWUgKDB4MyksIHJlc3VsdGluZyBpbiBpZ3RAeGVfcGF0QHBh
dC0qIGZhaWx1cmVzLg0KPiANCj4gRG8geW91IGhhdmUgYSBsaW5rIHRvIHRoZSBpc3N1ZT8gSSBh
c3N1bWUgdGhpcyBpcyBqdXN0IGEgc3cvaWd0IGlzc3VlLCBhbmQgbm90IGEgcmVhbA0KPiBidWc/
DQo+IA0KDQpUaGUgaXNzdWUgaXMgc2VlbiB3aGVuIElHVCByZWFkYmFjayBjb21wYXJpc29uIGZh
aWxzIGJlY2F1c2UgdGhlIHByb2dyYW1tZWQgdmFsdWUgKDB4ZikgZG9lc24ndCBtYXRjaCByZWFk
YmFjayAoMHgzKS4NCklzc3VlIGRldGFpbHMgcHJvdmlkZWQgb2ZmbGluZSwgYXMgSSBoYXZlIG5v
dCBmb3VuZCB0aGUgaXNzdWUgc291cmNlIGxpbmsuDQoNCj4gPg0KPiA+IEZpeCBieSBzZXR0aW5n
IEw0X0NBQ0hFX1BPTElDWT0wIChXQiksIHdoaWNoIGlzIHRoZSBvbmx5IHZhbGlkIEw0DQo+ID4g
dmFsdWUgd2hlbiAyLXdheSBjb2hlcmVuY3kgaXMgZW5hYmxlZC4NCj4gPg0KPiA+IEJzcGVjOiA3
MTE4OSwgNzE1ODINCj4gPg0KPiA+IEZpeGVzOiBmNmEyMmU2ODYyNzMgKCJkcm0veGUvcGF0OiBh
bm5vdGF0ZSBwYXRfaW5kZXggd2l0aCBjb2hlcmVuY3kNCj4gPiBtb2RlIikNCj4gDQo+IEkgZG9u
J3QgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQgZml4ZXMgdGFnPyBJdCB3YXMgYWxyZWFkeSB0aGF0
IHZhbHVlIHByaW9yIHRvIHRoaXMNCj4gQUZBSUNULg0KDQpZb3UncmUgcmlnaHQsIENvcnJlY3Qg
dGFnIGlzIDgxMWFhNGQyMDc0YSAoImRybS94ZS94ZTI6IFByb2dyYW0gUEFUIHRhYmxlcyIpDQoN
Cj4gDQo+ID4gQ2M6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gPiBD
YzogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBOaXRpbiBHb3RlIDxuaXRpbi5yLmdvdGVAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIHwgMiArLQ0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5j
DQo+ID4gaW5kZXggYTk3OTdkMDlmMDU0Li5iMzZiNjQzMDdmZjAgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3BhdC5jDQo+ID4gQEAgLTIxNyw3ICsyMTcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhl
X3BhdF90YWJsZV9lbnRyeQ0KPiB4ZTNfbHBnX3BhdF90YWJsZVtdID0gew0KPiA+ICAgCVszMV0g
PSBYRTJfUEFUKCAwLCAwLCAzLCAwLCAzLCAzICksDQo+ID4gICB9Ow0KPiA+ICAgLyogU3BlY2lh
bCBQQVQgdmFsdWVzIHByb2dyYW1tZWQgb3V0c2lkZSB0aGUgbWFpbiB0YWJsZSAqLyAtc3RhdGlj
DQo+ID4gY29uc3Qgc3RydWN0IHhlX3BhdF90YWJsZV9lbnRyeSB4ZTJfcGF0X2F0cyA9IFhFMl9Q
QVQoIDAsIDAsIDAsIDAsIDMsDQo+ID4gMyApOw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHhl
X3BhdF90YWJsZV9lbnRyeSB4ZTJfcGF0X2F0cyA9IFhFMl9QQVQoIDAsIDAsDQo+ID4gKzAsIDAs
IDAsIDMgKTsNCj4gDQo+IFRoaXMgcHJldmlvdXNseSBtYXRjaGVkIHRoZSBzcGVjIHByb2dyYW1t
aW5nIHRob3VnaC4gTm90IHN1cmUgaWYgd2Ugc2hvdWxkDQo+IGV2ZXIgYmUgZGl2ZXJnaW5nIGhl
cmU/IERvIHdlIGZ1bGx5IGtub3cgYWxsIHRoZSByYW1pZmljYXRpb25zIGhlcmU/DQo+IA0KPiBJ
TU8gd2Ugc2hvdWxkIGp1c3QgYWx3YXlzIG1pcnJvciB0aGUgc3BlYyBleGFjdGx5IGZvciB0aGUg
UEFUIHByb2dyYW1taW5nLiBPcg0KPiBnZXQgdGhlbSB0byBjaGFuZ2UgdGhlIHNwZWMsIGlmIHNv
bWV0aGluZyBpcyBub3QgcmlnaHQuDQo+IA0KDQpGYWlyIHBvaW50LiBUaGUgYnNwZWMgcGF0IHRh
YmxlIGRvZXMgc3BlY2lmeSB0aGlzIGV4YWN0IHZhbHVlLCBidXQgdGhlIFBBVF9BVFMgcmVnaXN0
ZXIgZGVmaW5pdGlvbiBhbHNvIHNheXMgTDQ9VUMgaXMgIlJlc2VydmVkIChXQikiIHdoZW4gQ09I
X01PREU9Mi13YXkNClNvLCBoZXJlIHRoZSBzcGVjIHNlZW1zIGludGVybmFsbHkgY29udHJhZGlj
dG9yeS4gSSB3aWxsIGNoZWNrIHdpdGggc3BlYyBvbmNlLg0KDQpUaGFua3MsDQpOaXRpbg0KDQo+
ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3BhdF90YWJsZV9lbnRyeSB4ZTJfcGF0X3B0YSA9
IFhFMl9QQVQoIDAsIDAsDQo+ID4gMCwgMCwgMywgMCApOw0KPiA+DQo+ID4gICAvKg0KDQo=
