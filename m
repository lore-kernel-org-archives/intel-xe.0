Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9118DE7B5F4
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 11:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4536210E002;
	Wed,  4 Oct 2023 11:27:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5249210E002
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696418829; x=1727954829;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=k6KQpOoKRdXn9vDHVuDMbqWUz9/os2AvEHVkgDPstp4=;
 b=ey7zLJD5CmBxh1TUMDMtyVb6Ee+6VNJf6Ge62jpVI8ZnEfPp1jk4VTiB
 7dzNkEfsHve4x7AcDNymLfW8lofjYcaJdU43YyG0BXInTFh6wncfcfA9x
 9yvOOJIomRFlcejTPhdIjo33FyBriYTAKMjGSyrmTT7e8RXlwTXj1XrBx
 ZrWnJ5S9pkGGQfxeTxl2D/ch58lCAsFdAV0bdf2vR/sDYHDf3shlJYJbf
 QJQ2GotNrcZngYQ0L3ZCs5NamiWS96QPZbpiSVOL8NrffsQSbA9/a300y
 7N9OfUlyEau74OuRw1p9PL3GAVbkvo9a8WM1FKgEGyQ3radBnpseUexMt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368194267"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="368194267"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 04:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821632468"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="821632468"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 04:27:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 04:27:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 04:27:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 04:27:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPQJdwE1k9LrENftiNeRDEwFaJp8TMfC0XhQlLQizv7gYkcbnGxDgzG/6JiAFXAZfbpk+lAA/Cirgb0thZfpFrzsaomC3ZSsJgojzcQi7BEcKtq1bZuJVU8m817e8AWgay/mDqxbaHUwfQ0icRVNrfMhFPx5m/yzaHC+D+BapuK9BL6SAvkUEbp9QJVErhLu49FAMa8d8RbMtMJDXoJD+PJv2HIYGN0Zo4W+GOhVHLas5qO6D/ZBC5EwYoiU64AOwDGaQtVUfB+35n1n2JcDKLAG4J4Ut/4ZhylhMPaN3sJJa0nytBXoLXupyfsUYW9r1vuHsS1g8wI3P9irB+kTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6KQpOoKRdXn9vDHVuDMbqWUz9/os2AvEHVkgDPstp4=;
 b=P7N1RD1cGPjCkN8JUzOqNKSXorBWP/e9pWMF5DKkHEv9ROaRQEUAMT9I7lmncsBGffz1h0km5eL4AOitM7Y3EDGWZZx8TKsooQVTA9+IYayLUstp3pBnY24WUErxhiMwNUX7hB6JgLDa3t/ScVa9lhP3KMzbK9jZzmkpQUiZsNFh5R9NpOgE3OWfXChIWc6ZbkK496Nco/4qdzTdeuG6YRJtS4rTFSY3ED/haSDcVhSMVYojFIH8qmQu2Tzb1v24tGJrjGICsfSPnDC2gBF4ss6+Hvh+5qPNX+/mVwq+4e5IQW8UgG8YCcrvSIKXHDqDIvkt9qLi+kJCdfzcds2XyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.31; Wed, 4 Oct 2023 11:27:05 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 11:27:05 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: Revert "drm/i915/display: Fix a use-after-free when
 intel_edp_init_connector fails"
Thread-Index: AQHZ9rWzDLLzxToab0C9XKz3GITDFw==
Date: Wed, 4 Oct 2023 11:27:05 +0000
Message-ID: <b143638fbb62182f890551768b510615fae16a9c.camel@intel.com>
References: <20231002104037.1923861-1-jani.nikula@intel.com>
In-Reply-To: <20231002104037.1923861-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB7097:EE_
x-ms-office365-filtering-correlation-id: 8ec57046-62bc-4a29-9eff-08dbc4ccd68e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HsxwF2EaaeQYzodQe8IbsQ/cECRtk4CgJCliL2sGvuObR7V1LDC4MQ/LPMbx0rxvZOVW81SPnY4jQZ+NI2C+oAyLjNEZQZd5ejnjznJoOn/3C1upCSaeqVWIQUFnkCv5TByhJgXDTk+VLYK0+XBtQi2xSA6+vsUpPm6ltbvBBB6DqqH3eWH2Afbu0RFh+8BQ6WUN3nkiS59oK3/F3Br3WJ9c4ZjVR6+EW6l0QiU2OQRypY4HBahrV94rkFp1RYg3ufEW36m6TjZ6ASK3K+475SWQTFBoA80j4ljBAccCq4uddXp14ziwjT/6sIDokhs1jzBlwbZUEJf9elWfpDm8geKisYmlBp+NmpTcDbdrTx2xHGgJcqoj4DQJIgHARZ7LQNeLGi7H2oiUZIAqeCJBHhAA9uhkZ/tByuQa9Wsa6MvkufQvhiL5ajEHc5qikxda25C8qj0ntRC3TEirODwvkLLQ3efpQxXtUkGpEDLmd5ZqdmglaYEYdoDHOEUc9pTwuNNPVKdr5Ff4wZVPAiraAkyMwyVtQ9aT+84mw3J4cyPoAs9T8EC6Ee7uqNXuVxHGFvbtjhzWVROKHrKz5hrzCdYEZgPSb3Vicl9Gw8D9RKgBktOoaTbz1K6HphG7ELSJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(346002)(376002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(5660300002)(8936002)(8676002)(41300700001)(26005)(64756008)(66946007)(91956017)(110136005)(6636002)(76116006)(66476007)(6512007)(66446008)(66556008)(2616005)(316002)(6486002)(6506007)(478600001)(38070700005)(122000001)(66574015)(86362001)(36756003)(71200400001)(83380400001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDdzUEJvNUdGTVRSSytrWGVjYlg5Mk9XQ1JmSm1vaHVwVnd6WHZ4cTJKUEpX?=
 =?utf-8?B?MGlWSjQrNmdlcFFzU3hMQXc5RkdBdGhFWnUzcE9PQTQyWWdvY0NocFI2NkQ5?=
 =?utf-8?B?cDVnKzhVbCtLWmxNUTZUVTdMVjZKY0Y2WS9hdDVWdithRzZHeTgvaXhWSVZB?=
 =?utf-8?B?TzJtQlRIbEYxNk9NUVN3Nk9Fa0ZWSjlMaVljSEpwWlFtNnhodHNuVCtHTUkx?=
 =?utf-8?B?dE0zeUdTK0d1OXp2ZVZiQ2hUbkMrd2ZtNHo5OWZZVnVnSHFPZUVBNGVzSkhP?=
 =?utf-8?B?Ui9PTkUyaWxYM01VTXk4dk0raWVVR0NBR1BXNzBDWGdMWWJkcEt4NVJvaWxN?=
 =?utf-8?B?cWtzWTBINWJ0R2JDZS91ZFkwQW96cWNQa1Zyd3NseXh6N3pqZTRHRGZia01i?=
 =?utf-8?B?VWd4dUFCU29jendsajNGSm9uaytPK3VmLzQvdnh4ZTFIaXZTVm9odnhWK2dX?=
 =?utf-8?B?UUhJeFlKTzBBZDd5eHRnNlNzbnVYOGtiT2FUdXE1WDJadmpkTm1nZUlnb3o0?=
 =?utf-8?B?U0NJRkp0RlZ1Z1BBelFFTW9ad013SW1WQXZMN2FFYWhRam9ONmYwaXk3dGNo?=
 =?utf-8?B?bjgzalZRV0QydWdQREZvTVB6b1Vubk5pK0pkYWUreDRZYmwxSFVQM3AvQ2I2?=
 =?utf-8?B?NjVCeDlNcmx0UWV3SU52Yk5FSFRRTk1NYmU3ODhVTEVXMFZEdjFydFQ2VjJE?=
 =?utf-8?B?UjJ1b2l0T0ZSbFdTOG15ZkV6R1BhY2hENzFzZ21lT281VzNpUUw3OG5KdnNV?=
 =?utf-8?B?ZGpSOHZHUTRZdFJRNnQ0bU1XYkY1ajhDWHJ1eXhpR1FrT3VJWDdVSGNuSitM?=
 =?utf-8?B?WitscXh3Y0FWbDJsRlFkSlVBdVhrMlhnb3BCcWR4ZDRybi9BVmlXNWtRMTFt?=
 =?utf-8?B?VFRlRjBGc3R4ZXRrOEJTekM0U3FWN2tnQXMxR25seXZVOWRJaEk4dWdVVS8v?=
 =?utf-8?B?YzNydVVJbzVrYmxlZUhSYWhjSUZFa2JtVWFCdnJkWUFZWEN4ZDdJaXc2cHNl?=
 =?utf-8?B?ZWl2dldJLzJjWHdHUGg4VUcxdmVPeVJ6R1JqbitwcGZzUTBlUHZyQWhjL3F6?=
 =?utf-8?B?NDdNUVE2MFJzRk9FK2VBbitZNWs4QlFzVEgwUllGekNSZ3ZxNHZLQU9ubml1?=
 =?utf-8?B?UXhCTHpoLzNHQ3FaWTZtUG5RUXQ1YXVoZjhPUmRKZzh0MDBvNThCeDlhVmg1?=
 =?utf-8?B?RENwdVBkTWd5emt4RjFIQzZxZGlLSXhWWDhyaS8rdCs0T3Y2WWFSMVI0Ymha?=
 =?utf-8?B?a2tnV3cvOGZiL2NSVys4VytkMVhETUFDT25hUnJXWkhZZ29GWVJIZTR6S25X?=
 =?utf-8?B?Tk1RYWlSZlBvd05HRTd4TENBaVNCeElvcStvekR5NThHazNrYjNYeldWTWps?=
 =?utf-8?B?ais3bHZzSVdsNE42QmZPbEQyMEJUdXAwaEVXSThEK3o4cXdubXZ1V2tLNFo0?=
 =?utf-8?B?WnJXKzhUTGZROTBCWVhNOTJwd0V4Z1JxZUgwbEtlWkNKbDd2OGIyTmxzR2Q0?=
 =?utf-8?B?RmljY3cvNG1IWm5hd3pUbWYvK1I2K0pkYkNYYUJPNGU0cTRndFdXRTIvOHhQ?=
 =?utf-8?B?enorRWVOYlUvZElqaUxMOWphNWZTZjB0cHZXMW9jV0VaVEIydXRkZi9pbHd2?=
 =?utf-8?B?MWlpTVVHU1VkN0JBTWU3NkFBSzhaRDdVNkdPYWJwcnFXaHlpZS9TMkNWNzg4?=
 =?utf-8?B?NU9rV0RaQ1lVYmxRQUc3alpsK1h2akRzUnBZR2hZbkkwam1VUXZxVzB5cXV5?=
 =?utf-8?B?RXQrOFR4bjdMVERIbHEzSlFmeUgyVGtmd1BTa1gzbVVqWXpydnBwbURTYWtZ?=
 =?utf-8?B?NGVubng5UDRlTng3ZU5raXZPcC9CSmZSOHRIbWVpVzNKVnU4cVh1U3ZZRTZa?=
 =?utf-8?B?QWxMUHl4NSs0c1NxeHYwWUxDV2I2TkdHUVMwQ1NjMllnUUpwL0lVN0h0QkVk?=
 =?utf-8?B?c2x5WXd5U2M1RXgrbDhxeUFIOEd5SHo5RjdzUnVYczhJdUxya01WbFFPWDEv?=
 =?utf-8?B?UG9aYXZZTFk5aXVXS0ovTG5sNkUzQWROblYzQjBXMEZRZWt3K0ROeXBBeVJu?=
 =?utf-8?B?R2FxYkFkVk5JQ0hIM3haK0E4bGZWeEFwc2lRQnBmeUF2Tno3dmcvRjRBYkw1?=
 =?utf-8?B?bVZLcGIwekEzazdPdnNlcFJXSnlXMFBZSHl2TnMrejJLOWFZSlNGK0ZkMUxK?=
 =?utf-8?B?akE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FC3A71AF3D2C84592A7B1801E11F831@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec57046-62bc-4a29-9eff-08dbc4ccd68e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 11:27:05.4525 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +994afM5VAtJjfcDQLaBJHJHTNiqORjQ409D04vlzmFMBvZRKFindO2CPTU1pKQPPRBGMlVd5rRmfjgc+zTGbW0GqVY/T58HzBhhXvF8QeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] Revert "drm/i915/display: Fix a use-after-free when
 intel_edp_init_connector fails"
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

T24gTW9uLCAyMDIzLTEwLTAyIGF0IDEzOjQwICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
VGhpcyByZXZlcnRzIGNvbW1pdCAyOTlkZGIxMDAzMWEzM2NkNTFlMzc1NTY1ZWEyMmIzZTgyOWY1
OTQ5Lg0KPiANCj4gVGhpcyBpcyBmaXhlZCBieSBjb21taXQgZjkxNzEzMGYxOWZlICgiZHJtL2k5
MTU6IEZsdXNoIHBvd2VyIGRlbGF5ZWQNCj4gcHV0DQo+IHdoZW4gY29ubmVjdG9yIGluaXQgZmFp
bGVkIikgdXBzdHJlYW0sIGFuZCBhbHJlYWR5IHBhcnQgb2YgdGhlDQo+IGJhc2VsaW5lLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0K
DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9w
b3dlci5jIHwgMiArLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlz
cGxheV9wb3dlci5oIHwgMSAtDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcF9hdXguY8KgwqDCoMKgwqDCoMKgIHwgMiAtLQ0KPiDCoDMgZmlsZXMgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93ZXIuYw0KPiBpbmRleCAwOGY2MzM0
MGZmNTguLmUyNTc4NWFlMWMyMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmMNCj4gQEAgLTgxMiw3ICs4MTIsNyBAQCB2
b2lkIGludGVsX2Rpc3BsYXlfcG93ZXJfZmx1c2hfd29yayhzdHJ1Y3QNCj4gZHJtX2k5MTVfcHJp
dmF0ZSAqaTkxNSkNCj4gwqAgKiBMaWtlIGludGVsX2Rpc3BsYXlfcG93ZXJfZmx1c2hfd29yaygp
LCBidXQgYWxzbyBlbnN1cmUgdGhhdCB0aGUNCj4gd29yaw0KPiDCoCAqIGhhbmRsZXIgZnVuY3Rp
b24gaXMgbm90IHJ1bm5pbmcgYW55IG1vcmUgd2hlbiB0aGlzIGZ1bmN0aW9uDQo+IHJldHVybnMu
DQo+IMKgICovDQo+IC12b2lkDQo+ICtzdGF0aWMgdm9pZA0KPiDCoGludGVsX2Rpc3BsYXlfcG93
ZXJfZmx1c2hfd29ya19zeW5jKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KQ0KPiDCoHsN
Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpOTE1X3Bvd2VyX2RvbWFpbnMgKnBvd2VyX2RvbWFp
bnMgPSAmaTkxNS0NCj4gPmRpc3BsYXkucG93ZXIuZG9tYWluczsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5oDQo+IGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3Bvd2VyLmgNCj4gaW5kZXgg
ZWMyYjU1NjA4NzdmLi5kNmMyYTU4NDZiZGMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5oDQo+IEBAIC0yMDAsNyArMjAw
LDYgQEAgdm9pZCBfX2ludGVsX2Rpc3BsYXlfcG93ZXJfcHV0X2FzeW5jKHN0cnVjdA0KPiBkcm1f
aTkxNV9wcml2YXRlICppOTE1LA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZWxfd2FrZXJlZl90IHdh
a2VyZWYsDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgZGVsYXlfbXMpOw0KPiDCoHZvaWQgaW50ZWxf
ZGlzcGxheV9wb3dlcl9mbHVzaF93b3JrKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1KTsN
Cj4gLXZvaWQgaW50ZWxfZGlzcGxheV9wb3dlcl9mbHVzaF93b3JrX3N5bmMoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUNCj4gKmk5MTUpOw0KPiDCoCNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fSTkx
NV9ERUJVR19SVU5USU1FX1BNKQ0KPiDCoHZvaWQgaW50ZWxfZGlzcGxheV9wb3dlcl9wdXQoc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtIGludGVsX2Rpc3BsYXlfcG93
ZXJfZG9tYWluIGRvbWFpbiwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfZHBfYXV4LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RwX2F1eC5jDQo+IGluZGV4IDAzZjFlMTQyNWEwYS4uNDQzMWI2MjkwYzRjIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX2F1eC5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfYXV4LmMNCj4gQEAgLTcz
NCw4ICs3MzQsNiBAQCB2b2lkIGludGVsX2RwX2F1eF9maW5pKHN0cnVjdCBpbnRlbF9kcCAqaW50
ZWxfZHApDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoY3B1X2xhdGVuY3lfcW9zX3JlcXVlc3RfYWN0
aXZlKCZpbnRlbF9kcC0+cG1fcW9zKSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBjcHVfbGF0ZW5jeV9xb3NfcmVtb3ZlX3JlcXVlc3QoJmludGVsX2RwLT5wbV9xb3MpOw0KPiDC
oA0KPiAtwqDCoMKgwqDCoMKgwqAvKiBFbnN1cmUgYXN5bmMgd29yayBmcm9tIGludGVsX2RwX2F1
eF94ZmVyKCkgaXMgZmx1c2hlZA0KPiBiZWZvcmUgd2UgY2xlYW4gdXAgKi8NCj4gLcKgwqDCoMKg
wqDCoMKgaW50ZWxfZGlzcGxheV9wb3dlcl9mbHVzaF93b3JrX3N5bmMoZHBfdG9faTkxNShpbnRl
bF9kcCkpOw0KPiDCoMKgwqDCoMKgwqDCoMKga2ZyZWUoaW50ZWxfZHAtPmF1eC5uYW1lKTsNCj4g
wqB9DQo+IMKgDQoNCg==
