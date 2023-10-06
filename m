Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35088E92FDB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 03:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA5510E1C3;
	Fri,  6 Oct 2023 03:27:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331AC10E1C3
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 03:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696562819; x=1728098819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OR3i42HO3Ye+Di7KrjbVjhr23AwNqNIM0erasM9G6kQ=;
 b=VkrYIvuvoE40E3wKrK+QFHLt/pNShncNM2NRBtFy0tlzU54lfLkPUwl2
 ZaFV3chMUQN//pQMRVdI0lVM3hxdjoaA4XiQOpFNJ4uPUxj25E79n7Ikx
 XgtMC3EPkn2zuuHzpBpZK7lrFknv1fc0nB6YmvvzYHhbmzM8lJoaW7KYo
 z70oDTwuIHk+8l9YKvZE0Z+7ObGAXbf2eroxjaPZxZ0g5vDuSxUgHtkG8
 lmo2pb1/91qG5/3/mwNxxjlkusqRMN+Oi14ynlCk0PbFU2/kw02VRaxos
 KhGhk9BNCXARVtJCTgmTMKqIl7El00hPhS542rZp2rf5IF2SXKJNHZzX0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387549008"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="387549008"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 20:26:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="787241624"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="787241624"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 20:26:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 20:26:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 20:26:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 20:26:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 20:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIxKnaXBDfteqEz4NxicmnbS0Qahr0XprQ9+nMLmm//HBhky7OhQDh0fZU3yydkF2bsrfUdBq4OSn/Zy70jscS8fbX/w+gjDBliHExSpYAHvF78B/W2w2Gy7j0rqjmpB21mwquU5Zq8kf1KO8ZwRsEEX5rwuc3gffxAl1hwmGtU6uAlic9xoMJNS4j1XUV+X5iKOJycegmGMyLmSpeWiG625NNliANkrTm0109Mvisebn9HbLo4jLSw+XfqMfiPIJUu3Lyry2BvFk7e+GakhEd7rJ3CQ0NPHw7HW7rqtsc1eW23R8cjIsCDcr98dW9eRcDyAqrzxfOocDJ3xDfXYIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR3i42HO3Ye+Di7KrjbVjhr23AwNqNIM0erasM9G6kQ=;
 b=KOxkUxiYb1Bi5T9q4wq08Dze3l/uobIwce39BtypBkuAansGRXAJfrLCCXKztG3W8qM13QLByKiueaP4bwnKxo3BHT7DCxNqTdMh5H1xgT053Cv6GeDHSzYIU70E8PXf7Bw6FON6Dl+OE9odO5vskM20ZxqmZ6VV5byAwdqb8+804w+ccf+GGNLc7V0mzFyS2no68smKK4NfgkQtwi5cdFXZszRWGf2Gg2aoXZ9pR/78+5ZNLAB5MV+1W/xm85U/XnvxAlDZXFFuKMeuqxOFsKWYi6VLML9EOXymSMbHOEWYIz5Vvi32fqDzT5UkbcgU1X0MTbr5RFvkH+Fpw3WlCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 SA2PR11MB4825.namprd11.prod.outlook.com (2603:10b6:806:111::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 03:26:43 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::c013:26f7:5743:995b%6]) with mapi id 15.20.6838.033; Fri, 6 Oct 2023
 03:26:42 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 3/3] drm/xe: Create a dummy version for vga decode
Thread-Index: AQHZ95MtX+Gwu0M7q0GoVdOvjLh5VLA8Ge1w
Date: Fri, 6 Oct 2023 03:26:40 +0000
Message-ID: <DM6PR11MB3177B057D7A83AB91CE0D54ABAC9A@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20231005135918.2345364-1-uma.shankar@intel.com>
 <20231005135918.2345364-4-uma.shankar@intel.com>
In-Reply-To: <20231005135918.2345364-4-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|SA2PR11MB4825:EE_
x-ms-office365-filtering-correlation-id: 0129c104-16cf-420d-f113-08dbc61c0e9c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZVfHDlUVuIWBH3sS5PhF4uj5fuBQgxf91PiDkKUmqt0xlMznmNoy5Z7wVzIx6OrrWkUD3WvggYarPQha8/mfWdZD/G2kElSGVugeePRHekj0qAgv9/xMA2aNyJgBCgd8g+VXBBC5GT32N5keruvDpAi792s+V+1cRwp4+CiH9lQu2TRP57KexmjolDGBoQNqgKSU8dkj+FE8rW6cpC9BNV+vOMQEr+xuIJ5nSmjsgwpFKSJi8i00Ic6AhLkUvPVuDF8k3G/LRM2yySsq2ui+wqO8xhNtTuqO3YsQelORWeZITXREcVYUa7XnkRXuNVe7eGeqWCYrED4QV7IBs0NadabetbDNE8rS76Xa2MXBnJh93fKTq0ezmmDlZtljApQ7PhUK8LIAZiMXFFut1jCI7G6wPP/ObGXnW4jHIfxZUGl+tyPOpLTTZedUoQtZaGFuiw0ICX2GJgvAPqIaPW3kH6+cpIdTlP0/6t85ckKXVD31BRU3xpfY2xI6+89N0vALAn3M2l1a7Rsn9TyTS+SY4SQbamMr1dkuiMGZ0aHBcGC9RXel5eNZYZvloEmx3VXBSXq9+L2Mv7I7rHL2EigSy69yTSLm55rPmLO0OVYiaTcXo0kC1U6cSJSZ2Vy+4fB+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(83380400001)(5660300002)(55016003)(33656002)(66946007)(76116006)(110136005)(66556008)(86362001)(9686003)(82960400001)(26005)(107886003)(122000001)(2906002)(7696005)(6506007)(71200400001)(53546011)(38070700005)(38100700002)(41300700001)(478600001)(64756008)(66476007)(66446008)(8936002)(4326008)(52536014)(316002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlVhaThKcUhwMStIY0NwVzQzZzRXbVpRZStqcHJVN3NWRXFBV1MyMThMSVJy?=
 =?utf-8?B?akZTWVFZelJtTzNySDBvaXZxbTBMYkRDUFBobHNVUUFib2FEQm93VTJKYjNP?=
 =?utf-8?B?aW8xTitnbEgyRjBpam9kTlE5SjZGQ005dEFMVUVBY1Z5K241QzFwcURROUx4?=
 =?utf-8?B?OVdZc0x2NjNaZVpudmFVODBlSHRjMGQxNDRCNkk5SDlOek04N0tESXlWYkls?=
 =?utf-8?B?SFZJeXJFdU5NRHo1dW5jQko4NmN4Z2NMTVppZlVZS0RDSitUVlhIRXpXYWto?=
 =?utf-8?B?YUY5ZkMzc0ZSOG9nNnFxMGs1bXBHOGt1QWRxV3hvK05sNCtjMkw5YUplTVgy?=
 =?utf-8?B?WnVtcUpMY2RWanZEeXNyRC9iUzdDTVV2emZpNVM5MzQrTE9ScENSOURtZVYz?=
 =?utf-8?B?TUtnd3IzMUtHaDRoL243bXdnUmYzdGFDNGJoUEN6WXFqb1QrU2Robis4TEpl?=
 =?utf-8?B?ckY0S3VaekRWTUR3MThoQU84alRuOU8zTytrVXhLUWtDWE1yQmFQS1hIMzVu?=
 =?utf-8?B?QlhWM25ZUFhNL3B0VjVSSks5YzhYSW5xZTVBWDF3Z0tEY3diUVRiQW1uYnhP?=
 =?utf-8?B?dTlGbmM4VUJBSjhkbzlmdS93TllQZC83Q01KWUFXVExocmRxaW80eTc3cTlF?=
 =?utf-8?B?aWVvVFgxaDI3N1h5Zk9HUGdmeHB0bzUyMncrajJUQnR4ajUvZHd6MFIvRGMx?=
 =?utf-8?B?akJvYTYrc3B6VW9KbnZzVTkvNEpIZy9SNjQ3OHpQRlc5ZG9PS0ovcDRpSFRp?=
 =?utf-8?B?VDVoSHVRTkpHcVFROCtVNmxlc0sxS2lSTTBVdDdpOWsrYkY0MlJkaG82NVZ3?=
 =?utf-8?B?UXkxWUtNU2FUNzArTFJtRk1WcHM0WTJQVS8zUEZlMkh4WDVJbWMzM0UxWlFp?=
 =?utf-8?B?WWJQNFdHSkNxVVdQQkZzK0c0VnRObTQvQVdjdmd0R2kzQUhzd3ZGeXFwUFky?=
 =?utf-8?B?SS8rVkVzVWJrNEQ5NUtZUXpqNThHdDdXTXBtUlBPMjFuN0xKVG12SFNYZ09F?=
 =?utf-8?B?Yk5WYnRBRTVlYVZGb0xOb25hYzZRb21EMHNsa2MySjlMOURlTFpVY0s2eUM3?=
 =?utf-8?B?SDduTFcxUTRKM3JmSytEUEduaXkvRzdCRitIVnlVajlPY0lSN0g3WnpXRzRQ?=
 =?utf-8?B?emJGTmZITFYzcHg5bndCcThYRkI4Z2k3V3h6dUQ0TThzR0p1TkJEOTBHc1VV?=
 =?utf-8?B?OGlxRmRuaEJjV2R5MUxzZmxKc2F5TitYdldRMmR6Q1Vuc0llSU81NEdhMmFM?=
 =?utf-8?B?a3Y2V2pIZGExZUwwcGJORkFvelVNQTNnNnhqNXdIbHZRbkVXN1ZSRko4RmJO?=
 =?utf-8?B?Uk5sU3d3aktHL3J3M3NWZ3orZndWVVJ0Unp1dm12QXZyQWRMMy9jenpXU2hn?=
 =?utf-8?B?U1I0TzgyeFZLUHR1WlRFaG5NUFBXWTluOElRQzYwcEVCNGdMSmNpdjJTM25m?=
 =?utf-8?B?MUpsNzk4YTJRamlWNEl3aGlDWll2NWpOZGlObTNVblVZL2NVZjd6UGh6dFNl?=
 =?utf-8?B?VGRIZzhNM2RLaStNeTJQQkV4NWZrVnRQblNhc3YwSFphL0Y2QWhOYVVtVTh2?=
 =?utf-8?B?QUdyVWhWK2Nuc3p1RElFNER2RjVNaUY5bitIK1BTN1hXNnNlcUI1dDFIOXpv?=
 =?utf-8?B?MUZ1NEwyTkhab0dURFlHT2lEQXM1aXR1Qk5mWmphaGRHMzYyRFJUbTdLVnp3?=
 =?utf-8?B?WTV2b0Fvd2w3VTl3eDNncWtwakN2NlFzZWthQnJFbGlnVDhIVGhETC95VzZm?=
 =?utf-8?B?SXhEZmxhVHNrSUZGMml5VENaaXpCQWtUelVaZzY4S0VSc3lUQTU1THRlRmdO?=
 =?utf-8?B?eTZFalhVTk5oR1ZUMVJpZWdiRFpnSGJQMjNXV3QzMHlqbXkwTXR3UWttNzlN?=
 =?utf-8?B?eTBWYXl4UHBLSk1WNWxJNUpFTjlMNmlBelpDbE5vcWVHSWc4cXUvV3FNS0tp?=
 =?utf-8?B?QlhOcXlzcGxiRFdJK094Y09tazE4VWtnbGJObzQ0bGw4Z3RjT2szOWpJSjM2?=
 =?utf-8?B?MU1qdkVzZklKaSt6SjVPQUFhenRVL24zVVowNnFtS2g4RDFBaVlXaEhZSkoz?=
 =?utf-8?B?aWdrMjdYMGdrRitpNE9SY0ZGVDlKbjVkcFkwbHY2QkhGYWFqeU04WFh5cWJy?=
 =?utf-8?Q?bZ3tZUjbi8RE/8uShOkeBvgqQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0129c104-16cf-420d-f113-08dbc61c0e9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 03:26:40.9095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WhjcAozBLV3NJvcp9f1AKCALNGmzL7TkZ3AErryrq5Q2Uoehq9t0ybm93pLCzUnhbRfgumgnKYb98O15NR2Lrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4825
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Create a dummy version for vga
 decode
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNoYW5rYXIsIFVtYSA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgT2N0b2JlciA1LCAyMDIzIDc6
MjkgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTmlrdWxh
LCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBNdXJ0aHksIEFydW4gUg0KPiA8YXJ1bi5y
Lm11cnRoeUBpbnRlbC5jb20+OyBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT4N
Cj4gU3ViamVjdDogW1BBVENIIDMvM10gZHJtL3hlOiBDcmVhdGUgYSBkdW1teSB2ZXJzaW9uIGZv
ciB2Z2EgZGVjb2RlDQo+IA0KPiBUaGlzIGltcGxlbWVudHMgYW4gZXhjbHVzaXZlIHZlcnNpb24g
b2YgdmdhIGRlY29kZSBmb3IgeGUuDQo+IFJlc3Qgb2YgdGhlIGRpc3BsYXkgY2hhbmdlcyB3aWxs
IGJlIHJlLXVzZWQgZnJvbSBpOTE1Lg0KSW1wbGVtZW50YXRpb24gSSB5ZXQgdG8gY29tZSBpbiB0
aGUgZm9sbG93IHVwIHBhdGNoZXMuIEhlcmUgd2UgYXJlIGp1c3QgYWRkaW5nIHRoZSBmdW5jdGlv
biBkZWZpbml0aW9ucy4NCg0KPiANCj4gQ3VycmVudGx5IGl0IGFkZHMganVzdCBhIGR1bW15IGlt
cGxlbWVudGF0aW9uLiBWR0EgZGVjb2RlIG5lZWRzIHRvIGJlDQo+IGhhbmRsZWQgY29ycmVjdGx5
IGluIGk5MTUsIHByb3BlciBpbXBsZW1lbnRhdGlvbiB3aWxsIGJlIGFkb3B0ZWQgb25jZSB0aGUg
aTkxNQ0KPiBjaGFuZ2VzIGFyZSBmaW5hbGl6ZWQgYW5kIG1lcmdlZCB1cHN0cmVhbS4NCk1lcmdl
ZCBpbiB1cHN0cmVhbS4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5z
aGFua2FyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUg
ICAgICAgICAgICAgICAgICB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hl
X2Rpc3BsYXlfbWlzYy5jIHwgMTMgKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZGlzcGxheV9taXNjLmMNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0veGUvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgaW5kZXgNCj4g
ZGZmMTM4NmVlNmIzLi4xNzVhMzU3MzY2ZDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9NYWtlZmlsZQ0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUNCj4gQEAg
LTE1MCw2ICsxNTAsNyBAQCB4ZS0kKENPTkZJR19EUk1fWEVfRElTUExBWSkgKz0gXA0KPiAgCWRp
c3BsYXkveGVfaGRjcF9nc2MubyBcDQo+ICAJZGlzcGxheS94ZV9wbGFuZV9pbml0aWFsLm8gXA0K
PiAgCWRpc3BsYXkveGVfZGlzcGxheV9ycHMubyBcDQo+ICsJZGlzcGxheS94ZV9kaXNwbGF5X21p
c2MubyBcDQo+ICAJZGlzcGxheS9leHQvaTkxNV9pcnEubyBcDQo+ICAJZGlzcGxheS9leHQvaTkx
NV91dGlscy5vDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkv
eGVfZGlzcGxheV9taXNjLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNw
bGF5X21pc2MuYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAu
LjRmMjM5MmY5MTFjZQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5jDQo+IEBAIC0wLDAgKzEsMTMgQEANCj4gKy8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgwqkgMjAy
MyBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArICovDQo+ICsNCj4gKyNpbmNsdWRlICJpbnRlbF9kaXNw
bGF5X3R5cGVzLmgiDQo+ICsNCj4gK3N0cnVjdCBwY2lfZGV2Ow0KPiArDQo+ICt1bnNpZ25lZCBp
bnQgaW50ZWxfZ21jaF92Z2Ffc2V0X2RlY29kZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgYm9vbA0K
PiArZW5hYmxlX2RlY29kZSkgew0KSXMgYSBUT0RPOiByZXF1aXJlZCBvdmVyIGhlcmU/DQoNCj4g
KwlyZXR1cm4gMDsNCj4gK30NCj4gLS0NCj4gMi40Mi4wDQoNClRoYW5rcyBhbmQgUmVnYXJkcywN
CkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo=
