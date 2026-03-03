Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B65EEDEBF0
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 21:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9BB10E8DD;
	Tue,  3 Mar 2026 21:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDzQI0Js";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06F510E8DD
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 21:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772573222; x=1804109222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wrxvYsv91RPqhPKhAPxhkBti+g/hCq+9Fmh9ZWfAgmk=;
 b=fDzQI0JspYQmG+njPNtN4yC4/hXHZQ+c2q2Ez0QqwZZDNG+8KLCYk65x
 iU689RFu21oZljxlrkiYhXHTDH3pUF3zuOyKwvXW7E8vj74W1OvRn4w7S
 VlDfzrQxuqDT7g56/3jKMiNtqR2eijIJhEFyCG0InXhYxbNztj4ehzCs4
 MnEaRWN2KfpcXVcavzNt5B2cQAtSmqXyBabPBoDbTUCa7tD65ogVLXnvm
 AR0kJwk2+XiolLDKd9W9wEdNgf5uyfqOLpeCmumRFw/60P8D0iqZxzsl5
 QN0MdIERSAAj3syDshAkMDuOtAdCFnjHF2MnnccyjcvTlvRgL7JSD0O11 A==;
X-CSE-ConnectionGUID: m/pzH0UOQL6cBHTLmYM8Zw==
X-CSE-MsgGUID: PgP2crsCSEiBwJ0EqLMAGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73532414"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73532414"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 13:27:02 -0800
X-CSE-ConnectionGUID: 49egzlCqQ0Wb337Dx27oUg==
X-CSE-MsgGUID: 9GiQS8iKTgWlor8mxQkVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217292457"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 13:27:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 13:27:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 13:27:00 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 13:27:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jmRiXzx7gdIQOHRnhJLeIFb/1k9+BZ6Eh6khoUc6ZYRBJgzlgKxsboLh1PdoDZ6gLwQQcXuqZXU9Dka984fbAwG7gkzL3mdP1Y4/8b2fADrgsGYAwGmJq7+4Jk+9NVUNFWooQbHQ+ZciaHHyiVc5Aq+6BFuyJnlDQM3Sh3RvnLDDlYCqTepg4f84nntWxiuYjbxQtlfQIBMy7kB9vYfgHiJRsezrubPVUtDoLR5kdw8ErxJ4fFyEBAw04SO81brUs47liDzmBn53i2ql8X/7huC9CLEUH9AIHUOtiLUd0THxdercSwFC9QEWX+9LgoDknxmhT0F15D0t3YzxHIL8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrxvYsv91RPqhPKhAPxhkBti+g/hCq+9Fmh9ZWfAgmk=;
 b=PQMXEa9MdYncQdOoUjsQkmLUnkQK3Zk2JObJ7JBW37nLcjnM/jcP1dGirRXUVUjowj8N0n1vtZYOpWxCJdJzcR8THCzG2GEz98AP7kCbSEw6nC2mxWVe4U4nH558odLmz79/RjP/KFaNsmukPWbl6IJi5bgqQ8YJr7sm1KNoOgnb2C9YM1tGFsuv6IrD3KLoMGdUmQS+Oxr12FfgocE3p9Vr7KyZb85jFkll/IMMf2W+yhJIvg3OoVAQmJCMoVizLl7TwdHV7XqyYVZeQ4qkFWHswm5XVGoUY6idUrMTejzmzjRUp/aw0vYugNrpy/huA7Cs6DPfE3i0PjcJ0oS+DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SA2PR11MB4938.namprd11.prod.outlook.com (2603:10b6:806:fb::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 21:26:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 21:26:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 03/25] drm/xe: Decouple exec queue idle check from LRC
Thread-Topic: [PATCH v3 03/25] drm/xe: Decouple exec queue idle check from LRC
Thread-Index: AQHcqFKAUNfvNZ13i0KIe9mS5ua2BbWbu6uAgAADcwCAAZklgA==
Date: Tue, 3 Mar 2026 21:26:56 +0000
Message-ID: <fd39339c6fc8461bb32fa01454754c58bb88f835.camel@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-4-matthew.brost@intel.com>
 <a88781b47e972b47ee6e46a3347f6293d36d9e39.camel@intel.com>
 <aaX65nBqdWvXGmZF@lstrano-desk.jf.intel.com>
In-Reply-To: <aaX65nBqdWvXGmZF@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SA2PR11MB4938:EE_
x-ms-office365-filtering-correlation-id: 51c3632d-6e12-4e2a-24bc-08de796b98b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: l55O1WCliGXqEyXqj2ulfjg1ri1vHgMs69zAmqfRwvkMo3ipg8pEt/fEHsRMzY1v4LSNrrVckU99bmgT0zfQLfd8Af9IhkfU2/vQywvpUANAHj+jwgkDzeRcKoVBgGD19iceXI5XCmKQ9B+wlZC7dQUBgEJm5PdSAf0+xor3CHPPukWTDMgQhczEOJAy5h1ULKkEavpjLWpjrYEq/UckTzfOpq8f35hwT9Xa1HVL43SiZH+dN2Ym+gmdXm0p1FFNQrWxPShR1hVSGvFEW3ZUH3HNZiaN7JV3WICh8DpG5je7cD7UG6ayrk62GmLeUuZ5iOTKkxVVVxWNKcssSQK5v6NgU0GRyPQOXuTVO4Uwega5IU9BBVvfZhoA2XMSWmRgqzBoBcddM0M2CZVf7dcqavOBFfSyua9/279TedCUZvPWnuYWySFTpHqdaf+TdbRZAWsTu3lhVYifsXb9NgHlChf+8PMLE+smunj0VE9zD8Ryq6hc4O2/KXJu8kW9CPUDy/0F/FgCHAg4hTBuJhsqnDfFXQLI+b7pSiJdaWUm9NvlJkN0PRiUtcIl3BJIO6B9f0j0y8/2hJA6onAXGaxjx7lY/7HKw9SqBX5LoI5XBydcPXvEPgXMPPMoyz8BJYJkGBdBsiI7+Xu3pKiWN4K6oeFD7bgrZR21bzOfSaNfKjYcFXPKQGiOOMYHRmdjVicsD+S1H3lciOrpm3StZduT0+bUo9gJq1cjIvaIIH4muQdNFfENHv/2nfToPCODjlZ6e5Y9y7kXRrDcIUEEIpPkzJlpzi2iZf7xII1G3tGfadQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE5zZUhTcVY5MFNsZzhxdzdKS1hQUWpxNFRMRjNVd24rWElWdEJZWkxENm5D?=
 =?utf-8?B?MXV1Q2hNa2lUTWU3RC81Z2FlZ3hFY3FWbXVuTEpwZlFLL2pOVVYvOUs0MENY?=
 =?utf-8?B?b3NNWDlrOFZQd2xoOVZIZ2h2c1ByRGtJNWxuWmREVUpCSEJ3bzFtVVlXQjVI?=
 =?utf-8?B?L1NCSG5GQnp5QjRvQ29qZDJxbFBubEVYRFdScDRUMmpNSDJBL29KOGR0TDF6?=
 =?utf-8?B?eDJ5aWJTS0hNRmF4Q1J1MGlPcW5hQVRZRmwrZ0hFVjdIczhzTzhmTUxxZ2Zu?=
 =?utf-8?B?cWxVTHNsQ0hHd0hoRzRFaHAwQzF4cU9rMVRYUlgrRzUzV0JNbERHc3psU0dY?=
 =?utf-8?B?RmMvenF0VTEyQVlwZWNJS0hPOE9Nb1ZSbkJDU010US9odGpvbVNISUxpM1E0?=
 =?utf-8?B?ZG1SVkpscHVNek5RVm9BTDBqb0lLRWtNZGZzTzdWZHd5NDZMQXVzeEJpZTRN?=
 =?utf-8?B?Ynp3UjVYOUhLTkNJd2tLejJNdTBrZUVkb2thbFI5M1ZacUdQdmpqOE5kM0FC?=
 =?utf-8?B?VHFFdFB4S0ZnT0M3UDFWZDQ5MW8xdSt6TkwrZVF2TDhJTWZxdUlEeG9jVEVW?=
 =?utf-8?B?UGJjTnQ5SnozVk5jcnJBZGR2UU9rejlsdkVMMnhjQjlHV3N5NUpIdkdoL0J3?=
 =?utf-8?B?SUdoNmZRQTdjaFJPYUdBeTlOc3RZYUZ1WmNHOTM5NDY3WEtmUEFvL3VNZ3ZZ?=
 =?utf-8?B?dEtOd2xHcTZQRGZlby81c1doNGVsYjVsRXQvZ3dubzBXQTBZanlpY0VTTUNU?=
 =?utf-8?B?TmpicEVpRS9HUFpXVlhBTFFxcWo3NllXemxKdFJSRUs1ZmNGK2JiTXNoVlJQ?=
 =?utf-8?B?QURFcUorblpMMENtYkNTOHRjZGpjM0hKUDNweTNXc2EzUGZ4NWh5UnFVdXl3?=
 =?utf-8?B?ZzZvdkRRd1p0MXZoRkpmUkFLcmpobExKakZqWGU5OVFJVHhXNjhMK2pKR0ZC?=
 =?utf-8?B?RWcvbG1vSnd6MmdPdjl5cVl4RkQ3UmNxZ3dwOWt2d3JFblNZTGdKWjhuenR6?=
 =?utf-8?B?WWg0azlXVUdJZHpwTXJINWhJTGVHSjRkenJPWUJoVU4yMnlFMXFNVkNiTmFK?=
 =?utf-8?B?OEZGS2xEVFBkc2tDYXBVbjJuRWIwR2VXZjFxeXZYSkRtckJqZFV6elBKQXp4?=
 =?utf-8?B?TzdtZmpWa2I4dnBtVmpCWWhBK1lqWHdTblU1Q2FBbjVQaDI5ai9YWVhodkFS?=
 =?utf-8?B?QXlOZC9wSktVNUVEblJKM2pkRzVYVXZHcm50aVY3RVpyRDRxZEZrZi9ySkZR?=
 =?utf-8?B?MTJNWmNBWTBmdW5NVjNhMTdRbDlaQTNLb2t0eXVjbk5UL1Awb3lBeERrd2Rl?=
 =?utf-8?B?TnNtR0ZRUENCK25VVHR3Q3NzYmp5VXkyMnY3cTd1YjFya2l6bWQ5d21vd0Rx?=
 =?utf-8?B?Z1lrZS96MFBEQi9KU0xBRHYxY3hZNWthUCtHaXdHY0txb1B4WFJsZjM1Y25R?=
 =?utf-8?B?NGRTZUFFcGExQ3Q0Zzh0RFhPWU4yQ213MkZ5c0NQQWVWN0dGN1Q3UXNpOTRm?=
 =?utf-8?B?NnJXdG4yMlYvZDFWeTNZSld0Z0IzSG1RM1RFcjNsTjdMR1pHL1RZUFM2dVBS?=
 =?utf-8?B?MXNqYTRRKyt5K0FveHVyMWIxU09LTkk4UVZ2WWEwZHNlbzUzVWlPdUsvMG9B?=
 =?utf-8?B?Z1hZRGVQaVBGVjJ5bGpUV1NhOXNBNDlCN1QzVUNmWTB6OGI5Y2VZRkE2eHQ1?=
 =?utf-8?B?VUVFZXVZbnJxRUtiRDNhRHpYd0JiR2E0SFhDWm5iczVlZDV4MWpWUFNVbTZC?=
 =?utf-8?B?WmZVWk85UzJMdU91SkEzdjhpbEhZeEhlUnZmajJ5ek9KcnpiY0Q4TkVJNHJB?=
 =?utf-8?B?aDRoUHJiZDlmZVk1Zm16VThEdC84NFNvTnNBaW9LN3FLQlNDNVVBTkVPWnZO?=
 =?utf-8?B?MktER2FhakhCUDhQcmRUZll3ZWZDVVVFSG9mWnFKUzZ3a1VYaytEby9ldkEv?=
 =?utf-8?B?M054dkxPOUcxeFBNWTRvdFJQQUpVMVdYbmxaTDh2S1pCYk1ick1uRE5BWkdQ?=
 =?utf-8?B?TGFaaWl3bFRFWFpqZGhXbzdUR1psbmtFZmhrOXI3aS80M3JwRFpWUEJFRlJR?=
 =?utf-8?B?MEZraStZNGdiL29Mb0NNUE1QM3JqZDZCMEgxTDRaZkh4S1pxYjJMaHpOQ05R?=
 =?utf-8?B?YWNrMThwSVp6OVB3aTMzRG53NUZ1eG81b3UxQjlzSXRZVnNGV0VReTFUcXJ4?=
 =?utf-8?B?bkthZnpYYXpoamo1U2kraDhGOENRWlFBNzMwOG12K2x5KytsNG1ZRTB0S0Z0?=
 =?utf-8?B?aU01SUYxNVA1WDZjaDRidExqYlBDQVdzNGp4WFgyUGk1SlF1SG1kOXBtNzFR?=
 =?utf-8?B?Ym5jdEVTNXViVEZEbjZWYmFJWFVCcEtYRjBHUXpqZ09DdXBjMFhSV0RNUmJ6?=
 =?utf-8?Q?HI2omPpkI6Rr6qsE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F284EEC461692A4988F8C2AF5195E680@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c3632d-6e12-4e2a-24bc-08de796b98b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 21:26:56.3731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: de7ptfdK7fU24bgP0n7epc51lAP06s81MeqqgSXSazqLYglT1yh31xl5JreIN7L2iYLv6od7XGtBv3ZDC6LChsvJ75bzuzfoabRszE7CmBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4938
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

T24gTW9uLCAyMDI2LTAzLTAyIGF0IDEzOjAyIC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiA+IE9uIE1vbiwgTWFyIDAyLCAyMDI2IGF0IDAxOjUwOjExUE0gLTA3MDAsIFN1bW1lcnMsIFN0
dWFydCB3cm90ZToNCj4gPiA+ID4gT24gRnJpLCAyMDI2LTAyLTI3IGF0IDE3OjM0IC0wODAwLCBN
YXR0aGV3IEJyb3N0IHdyb3RlOg0KPiA+ID4gPiA+ID4gV2UgYWxyZWFkeSBtYWludGFpbiBhIGpv
YiBjb3VudCBmb3IgZWFjaCBleGVjIHF1ZXVlLCBzbw0KPiA+ID4gPiA+ID4gc2ltcGxpZnkgPiA+
ID4gdGhlDQo+ID4gPiA+ID4gPiBpZGxlDQo+ID4gPiA+ID4gPiBjaGVjayB0byByZWx5IG9uIHRo
ZSBqb2IgY291bnQgcmF0aGVyIHRoYW4gdGhlIExSQyBzdGF0ZS4NCj4gPiA+ID4gPiA+IFRoaXMN
Cj4gPiA+ID4gPiA+IGRlY291cGxlcw0KPiA+ID4gPiA+ID4gZXhlYyBxdWV1ZXMgZnJvbSBMUkMt
YmFzZWQgYmFja2VuZHMgYW5kIGF2b2lkcw0KPiA+ID4gPiA+ID4gdW5uZWNlc3NhcmlseSA+ID4g
PiBjb3VwbGluZw0KPiA+ID4gPiA+ID4gaWRsZQ0KPiA+ID4gPiA+ID4gZGV0ZWN0aW9uIHRvIGJh
Y2tlbmQtc3BlY2lmaWMgaW1wbGVtZW50YXRpb24gZGV0YWlscy4NCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRl
bC5jb20+DQo+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2V4ZWNfcXVldWUuYyB8IDE1ICstLS0tLS0tLS0tLS0tLQ0KPiA+ID4gPiA+ID4gwqAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDE0IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVl
dWUuYw0KPiA+ID4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlY19xdWV1ZS5jDQo+
ID4gPiA+ID4gPiBpbmRleCAyZDBlNzNhNmE2ZWUuLmIzZjcwMGE5ZDQyNSAxMDA2NDQNCj4gPiA+
ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gPiA+ID4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMNCj4gPiA+ID4gPiA+
IEBAIC0xMzgyLDIwICsxMzgyLDcgQEAgYm9vbCB4ZV9leGVjX3F1ZXVlX2lzX2xyKHN0cnVjdCA+
ID4NCj4gPiA+ID4gPiA+ID4geGVfZXhlY19xdWV1ZQ0KPiA+ID4gPiA+ID4gKnEpDQo+ID4gPiA+
ID4gPiDCoCAqLw0KPiA+ID4gPiA+ID4gwqBib29sIHhlX2V4ZWNfcXVldWVfaXNfaWRsZShzdHJ1
Y3QgeGVfZXhlY19xdWV1ZSAqcSkNCj4gPiA+ID4gPiA+IMKgew0KPiA+ID4gPiA+ID4gLcKgwqDC
oMKgwqDCoMKgaWYgKHhlX2V4ZWNfcXVldWVfaXNfcGFyYWxsZWwocSkpIHsNCj4gPiA+ID4gPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnQgaTsNCj4gPiA+ID4gPiA+IC0NCj4g
PiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3IgKGkgPSAwOyBpIDwg
cS0+d2lkdGg7ICsraSkgew0KPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfbHJjX3NlcW5vKHEtPmxyY1tpXSkgIT0NCj4gPiA+
ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHEtPmxyY1tpXS0+ZmVuY2VfY3R4Lm5leHRfc2Vxbm8NCj4gPiA+ID4gPiA+IC0gMSkNCj4g
PiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsNCj4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHRydWU7DQo+ID4gPiA+ID4gPiAtwqDCoMKgwqDC
oMKgwqB9DQo+ID4gPiA+ID4gPiAtDQo+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4g
eGVfbHJjX3NlcW5vKHEtPmxyY1swXSkgPT0NCj4gPiA+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBxLT5scmNbMF0tPmZlbmNlX2N0eC5uZXh0X3NlcW5vIC0gMTsNCj4gPiA+
ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAhYXRvbWljX3JlYWQoJnEtPmpvYl9jbnQpOw0K
PiA+ID4gPiANCj4gPiA+ID4gU3RpbGwgbG9va2luZyB0aHJvdWdoIHRoZSBzZXJpZXMsIHNvIG1p
Z2h0IGJlIGhhbmRsZWQNCj4gPiA+ID4gZWxzZXdoZXJlLCA+ID4gYnV0DQo+ID4gPiA+IGp1c3Qg
bG9va2luZyBhdCB0aGlzIHBhdGNoIGFsb25lLCBJJ20gYSBsaXR0bGUgd29ycmllZCB0aGlzDQo+
ID4gPiA+IHdpbGwgPiA+IGNhdXNlDQo+ID4gPiA+IHVuZXhwZWN0ZWQgaXNzdWVzIGluIHRoZSBl
eGVjIHF1ZXVlIGNsZWFudXAuIFRoaXMgZnVuY3Rpb24gPiA+DQo+ID4gPiA+IGN1cnJlbnRseQ0K
PiA+ID4gPiBlbnN1cmVzIHRoYXQgdGhlIGpvYiBpcyBpZGxlIGZyb20gdGhlIGhhcmR3YXJlIGxl
dmVsLiBUaGUNCj4gPiA+ID4gY2hhbmdlID4gPiB5b3UNCj4gPiANCj4gPiBUaGUgY3VycmVudCBj
aGVjayBpcyBhY3R1YWxseSBpbmNvcnJlY3QgaWYsIGZvciBleGFtcGxlLCBhIHF1ZXVlIGlzDQo+
ID4gcmVzZXQgYW5kIHRoZSBMUkMgaGVhZCAhPSB0YWlsLiBIb3dldmVyLCBJIGJlbGlldmUgdGhl
IG9ubHkgcGxhY2VzDQo+ID4gd2UNCj4gPiB1c2UgeGVfZXhlY19xdWV1ZV9pc19pZGxlIGFyZSBj
YXNlcyB3aGVyZSBhIHF1ZXVlIGhhc27igJl0IGJlZW4NCj4gPiByZXNldCwgPiBzbw0KPiA+IGl0
IGhhcHBlbnMgdG8gd29yayBpbiBwcmFjdGljZS4gSXTigJlzIGFsc28ganVzdCBhbiBhZHZpc29y
eSBjaGVjaywNCj4gPiBzbw0KPiA+IG5vdGhpbmcgYmFkIGhhcHBlbnMgaWYgaXQgaW5jb3JyZWN0
bHkgcmVwb3J0cyDigJxub3QgaWRsZSIuDQoNClNvIHJlc2V0IGNhc2UgYXNpZGUgKHdoaWNoIG5v
dCB0YWtpbmcgaW50byBjb25zaWRlcmF0aW9uIGFueXRoaW5nIHlvdQ0Kc2FpZCBiZWxvdyA6KSBJ
J2QgY29uc2lkZXIgYSBidWcgaGVyZSksIGl0IGRvZXMgZ2l2ZSBhIGZhbHNlIHNlbnNlIG9mDQp0
aGluZ3MgYmVpbmcgYWN0dWFsbHkgaWRsZSBvbiB0aGUgaGFyZHdhcmUgSU1PIHRoYXQgbWlnaHQg
YmUgZXh0ZW5kZWQNCm91dCB0byBvdGhlciBhcmVhcyB3aXRob3V0IHJlYWxpemluZyBpbiB0aGUg
ZnV0dXJlLiBJIGFncmVlIHRoYXQgdGhlDQpjdXJyZW50IHVzZSBjYXNlcyBtYXRjaCB3aGF0IHlv
dSBzYWlkLg0KDQo+ID4gDQo+ID4gPiA+IG1ha2UgaGVyZSBtb3ZlcyB0aGF0IHRvIGEgc29mdHdh
cmUgbGV2ZWwgY2hlY2suIEFuZCB0aGlzIGlzDQo+ID4gPiA+IGdldHRpbmcNCj4gPiA+ID4gZGVj
cmVtZW50ZWQgYW5kIGNoZWNrZWQgYmVmb3JlIHdlIHRlYXIgZG93biB0aGUgZXhlYyBxdWV1ZS4g
U28NCj4gPiA+ID4gcHJlc3VtYWJseSwgR3VDIGFuZCB0aGUgY29tbWFuZCBzdHJlYW1lciBjb3Vs
ZCBzdGlsbCBiZSBkb2luZyA+DQo+ID4gPiA+ID4gc29tZXRoaW5nDQo+ID4gPiA+IGhlcmUgYW5k
IHdlJ3JlIGZhbHNlbHkgdGVsbGluZyBvdGhlciBwYXJ0cyBvZiB0aGUgZHJpdmVyIHRoYXQNCj4g
PiA+ID4gcmVseSA+ID4gb24NCj4gPiA+ID4gdGhlIGVuZ2luZSB0byByZWFsbHkgYmUgaWRsZSB0
byB0cnVzdCB1cyBoZXJlLg0KPiA+ID4gPiANCj4gPiANCj4gPiBTZWUgYWJvdmUgZm9yIHBhcnQg
b2YgdGhlIGV4cGxhbmF0aW9uLCBidXQgdGhlIG90aGVyIHBhcnQgaW52b2x2ZXMNCj4gPiByZWZl
cmVuY2UgY291bnRpbmcgYW5kIGZlbmNlIHNpZ25hbGluZy4gQSBqb2IgY2FuIG9ubHkgaGF2ZSBp
dHMNCj4gPiBsYXN0DQo+ID4gcmVmZXJlbmNlIGRyb3BwZWQgd2hlbiBpdHMgZmVuY2UgaXMgc2ln
bmFsZWQuDQo+ID4gDQo+ID4gQSBmZW5jZSBjYW4gb25seSBzaWduYWwgdW5kZXIgdGhlIGZvbGxv
d2luZyBjb25kaXRpb25zOg0KPiA+IA0KPiA+IC0gSXRzIHNlcW5vIGlzIGluY3JlbWVudGVkIHZp
YSByaW5nIGluc3RydWN0aW9ucyAod2hpY2ggY29ycmVzcG9uZHMNCj4gPiA+IHRvDQo+ID4gwqAg
dGhlIExSQyBoZWFkID09IHRhaWwgaWYgaXTigJlzIHRoZSBsYXN0IGpvYiBvbiB0aGUgcXVldWUp
Lg0KDQpSaWdodCwgc28gdGVjaG5pY2FsbHkgSSBndWVzcyB3ZSBjb3VsZCBoYXZlIGEgaGFyZHdh
cmUgaGFuZyBhZnRlciB0aGUNCnNlcXVlbmNlIG51bWJlciB3YXMgd3JpdHRlbiBzaW5jZSB0aGF0
IGlzbid0IHRoZSBsYXN0IGluc3RydWN0aW9uDQp0aGVyZSwgYnV0IHNlZW1zIHZlcnkgdW5saWtl
bHkuIEFuZCBpZiB3ZSBkaWQgaGl0IHRoYXQgY2FzZSwgdGhlIHJlc2V0DQpoYW5kbGVyIHdvdWxk
IGNvdmVyIHRoYXQuDQoNCk1heWJlIHRoaXMgc2hvdWxkIGJlIG9idmlvdXMuLi4gYnV0IGp1c3Qg
c28gSSdtIG5vdCBtaXNzaW5nIHNvbWV0aGluZw0KaGVyZS4uDQoNClNvIEkgdGhpbmsgdGhlIHNp
Z25hbGluZyBoZXJlIHdlJ3JlIHRhbGtpbmcgYWJvdXQgaXMgdmlhIHRoZQ0KTUlfVVNFUl9JTlQg
aW46DQp4ZV9od19lbmdpbmVfaGFuZGxlX2lycSAtPiB4ZV9od19mZW5jZV9ycV9ydW4NCg0KQW5k
IHRoYXQgZGVwZW5kZW5jeSB5b3UncmUgdGFsa2luZyBhYm91dCBpcyBoZXJlICh4ZV9leGVjLCBh
bHRob3VnaCBJDQprbm93IHRoZXJlIGFyZSBhIGZldyBpbiB4ZV9taWdyYXRlLCB4ZV9wdCwgZXRj
KT8NCiAgICAgICAgLyogV2FpdCBiZWhpbmQgcmViaW5kcyAqLw0KICAgICAgICBpZiAoIXhlX3Zt
X2luX2xyX21vZGUodm0pKSB7DQogICAgICAgICAgICAgICAgZXJyID0geGVfc2NoZWRfam9iX2Fk
ZF9kZXBzKGpvYiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
eGVfdm1fcmVzdih2bSksDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIERNQV9SRVNWX1VTQUdFX0tFUk5FTCk7DQogICAgICAgICAgICAgICAgaWYgKGVycikNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3B1dF9qb2I7DQogICAgICAgIH0NCg0KV2hh
dCBpcyB0aGUgZXhwZWN0YXRpb24gZm9yIExSIGpvYnM/DQoNClRoYW5rcywNClN0dWFydA0KDQo+
ID4gLSBXZSB0aW1lIG91dCBqb2JzIG9uIHRoZSBxdWV1ZSBhbmQgc2lnbmFsIHRoZWlyIGZlbmNl
cyBpbg0KPiA+IHNvZnR3YXJlLiA+IFdlDQo+ID4gwqAgb25seSBzaWduYWwgZmVuY2VzIGluIHNv
ZnR3YXJlIG9uY2UgdGhlIHF1ZXVlIGhhcyBiZWVuIGtpY2tlZCBvZmYNCj4gPiA+IHRoZQ0KPiA+
IMKgIGhhcmR3YXJlIChpLmUuLCBzY2hlZHVsaW5nLWRpc2FibGUgSDJHIHRyaWdnZXJzIGEgRzJI
IHJlc3BvbnNlKS4NCj4gPiANCj4gPiA+ID4gRm9yIHJlZmVyZW5jZSwgSSdtIGxvb2tpbmcgYXQg
eGVfc2NoZWRfam9iX2Rlc3Ryb3koKSB3aGVyZSB3ZQ0KPiA+ID4gPiBkbyA+ID4gdGhlDQo+ID4g
PiA+IGRlY3JlbWVudCBhbmQgdGhlbiB0aGUgZXhlYyBxdWV1ZSBwdXQuDQo+ID4gPiA+IA0KPiA+
ID4gPiBTbyBteSBxdWVzdGlvbiBpcywgaG93IGFyZSB3ZSBndWFyYW50ZWVpbmcgdGhhdCBoYXJk
d2FyZSBpcw0KPiA+ID4gPiBpbmRlZWQgPiA+IGlkbGUNCj4gPiA+ID4gYWZ0ZXIgdGhpcyBjaGFu
Z2U/IEFyZSB3ZSBtb3ZpbmcgdGhlIHNlcXVlbmNlIG51bWJlciBjaGVjayA+ID4NCj4gPiA+ID4g
c29tZXdoZXJlDQo+ID4gPiA+IGVsc2U/DQo+ID4gPiA+IA0KPiA+IA0KPiA+IEkgdGhpbmsgYWJv
dmUgZXhwbGFpbnMgdGhpcy4NCj4gPiANCj4gPiBNYXR0DQo+ID4gDQo+ID4gPiA+IFRoYW5rcywN
Cj4gPiA+ID4gU3R1YXJ0DQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gwqB9DQo+ID4gPiA+ID4gPiDC
oA0KPiA+ID4gPiA+ID4gwqAvKioNCj4gPiA+ID4gDQoNCg==
