Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB154E95A99
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 04:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8010E041;
	Mon,  9 Oct 2023 04:28:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32B410E041
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 04:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696825683; x=1728361683;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fRYtcb668LI8Jl5ey8EjGyKQ3rC6LE8906CkaRDI64k=;
 b=ILFA12/rJt/vIPlN8v4wwCcgHSiRVizw/t8rFTYXe9tn7o0tbCaUhwjc
 2xVGgxq7uo2F2JidwMw1bVDYQ8dK4Ctcjx5K0WF7ksaneh6dXPcvrk/4+
 QN7fYeS8a88ktwhf2g2ntCIomS+Nx8oujQIUtN2g/qKZxTNavDv6P7uh6
 JtdvqDl/IPS/8AxOW1WOMeqzqkx5znZ55yIFbENyuk7DJGOfd0JKPApxl
 Ae9XDxu3HfnPuoCZZCvn2XlNTBgd6X6SxsdVvySCzj6S3SoRkkUXt2eTS
 JubzqjejVAqwu0tUSqoDNZJgaUyTp6eH/FFOuU3Hqxxcy50wngUAu+UCO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="387931474"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; d="scan'208";a="387931474"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 21:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="843567026"
X-IronPort-AV: E=Sophos;i="6.03,209,1694761200"; d="scan'208";a="843567026"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2023 21:28:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 8 Oct 2023 21:28:03 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sun, 8 Oct 2023 21:28:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Sun, 8 Oct 2023 21:28:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Sun, 8 Oct 2023 21:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrwUE/2xxaJQWTQxcKA9uviatMek/q2u2yLND+aqa29Jvb92nUeYdAfudVDTWtdByI83MfbjdxrODrOEyV9J+dg32jK4J3TGHxkBqe3zyz4NUuyjIjjzca8d0rwj8Mw814MegWyRuQIEWf9G/19VzFUwc19YozMD4eYVKtQqyLsIHc0i+2sxd0Vhgs7uSFJpYNk/tZpRVhVmNMUj8bzPOMvYbL2tX3ENPB8ofif7q7HjmYvzlYmpuYAvVFjui+3RH5LgvRnKEXiHKhhysRlb1JR4GNOpzy7jCR9/YAb0Qsh/DwntK/XjcBnPxFcbEqHbnY+U4vmKwJBKbtRIgSk3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRYtcb668LI8Jl5ey8EjGyKQ3rC6LE8906CkaRDI64k=;
 b=H8p0ZzoIDhDyDVj0siuu94vAJ24NLroUylQSMv0bBK/QuNKCtIjYSYEwEF+66Olzt0ft0OR4f+krJEkC6G7rSQlrz7lQ1vBf6qBRLM/P5wz1X7b9+e24zCXkhMW+a+n0RuvxeXC0A1OoWB+7lWUwEkMsymDiQV81PNasS+qImhy7Yx1Pv0c3XcGcR7m+SxPaRevOgAI+IGcW1HMSA3WfrRjDAs/5T4dvLuzS8XqkJjvXODI22Nzd52TA2GMgxhR2K1HQcDeS1x8HRdelAAv1lGtM7lTySk8f8XV9XEFlRsOl0NKoqdJJnzcNdz8GJshKBVTWaRkDpjZqBSCHYoLaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Mon, 9 Oct
 2023 04:27:54 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::55a3:7967:f63d:b76b]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::55a3:7967:f63d:b76b%5]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 04:27:54 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [v2 3/3] drm/xe: Create a dummy version for vga decode
Thread-Index: AQHZ+Es9+DSGgAPuyU+5NKKnbpCvGLBA4SUQ
Date: Mon, 9 Oct 2023 04:27:53 +0000
Message-ID: <DM6PR11MB3177EAD727A47713E825B03FBACEA@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20231006115645.2402795-1-uma.shankar@intel.com>
 <20231006115645.2402795-4-uma.shankar@intel.com>
In-Reply-To: <20231006115645.2402795-4-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3177:EE_|CH0PR11MB8087:EE_
x-ms-office365-filtering-correlation-id: d136a5ac-7f56-4b8b-96e4-08dbc8801af2
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OWN6GDP5wCXFsKfEKwiYBlW4MYzIiAKCuX6Gfq9WcyqlXfUlW3dzjjTGHkMr2XqejuxTfCvenDUQlqJoO1I5b7NcKvGgEwpa2HFs3SS0Jbu6iUzuYpON7B2StraK2baIU0ggYkEg7q5Yrf1qFzK684m7IXQOG2NHh35zMMs+rPjNis4PU9k+Xn7ma58ZuKA7htqMOKLZ2BetdU/fHs2SnGkQSatPSrmkmgH2vtAHd51SZFvK8iLNLY1zOHv9PC6WTc2QcQzoI5EYhgixCjlXC3PIX4DHh1KozV2Kau2Mo+EAfWMSLSjkJHii3WxexSSgqP6+UUZQxzsC85MNF0EQQW8P8tUUojQ6y8YwVlpxkp95F3/NE3h/6T+LgMUHGs4NL+zw68EalDP65iEAzVxRSGgAxYgkD8BwyH3PK5yHRQdQUMrLEo3TWqGVNwLd5LlkZ//5XKFvluEnjV5mn7493HxzSucW4hbFKhxB1NGbUgB1KWYNPpZenLGVX4R8kofZjE4WZG3CKoJGiETi/dznXc00PVHvPenfBbyXXtCHvdfp+wZW/mdHOcgbRMLwWPJTTzcKhNcN8mV/i++JL+/Kk81adClRzsahvJPhgjGkYQBNaZeEbNyDmdjP31dvchgF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(66946007)(66446008)(66556008)(66476007)(316002)(76116006)(64756008)(41300700001)(110136005)(26005)(71200400001)(53546011)(55236004)(107886003)(9686003)(2906002)(8936002)(8676002)(6506007)(7696005)(4326008)(5660300002)(83380400001)(52536014)(478600001)(38070700005)(82960400001)(38100700002)(122000001)(55016003)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3FzeUhLdGF3ZUdWM2M1Nk5XRlN5d0Y3OUxMY0FWVjdrUFJlMEpEenpUc285?=
 =?utf-8?B?RjRxZFpKeDFDdWpkVk05cWEyZnVvNEt1VEVtdVo0NXcxd2U3YmRQdW9Qdlp4?=
 =?utf-8?B?S1RocG9IMGdxTWYrbUxHRUY5bVh0OVlLUWtNRWxzWHg3cGVOS1ZLM0dTOG9M?=
 =?utf-8?B?T0R5MEhORHF3blA0RG9jcTNTTGdjVGxpNFVlWG85SkRhZlBJYUdBd0dhWitr?=
 =?utf-8?B?bjd3UnhyUTJUT09EUDB2eHkraHI3OGJselVtRU1KdmpnT29nRE1ISXR0ajBR?=
 =?utf-8?B?UU5PT055UEZRdzYzcGozT0QyQUxnUll5TG1FbFlXTTFaekp0ajVWNlV4Y0E2?=
 =?utf-8?B?MFM0QlQ4cURkd2dOZ1ZGMlJNRk1LMXJHeHFPVkUzcGtSQlR4eTdvVDBDamZi?=
 =?utf-8?B?R0lWZnEvUXhqZ1l6YXNNMi9rN1lxUGFBZGhkRzAxL0JnOGY5cnlicXZJQzhO?=
 =?utf-8?B?NUNaT2xaY3JMVlQvNkdNcStvS2NJNTh0WjhZRVZFR3V6azdrU1JkdG9FaWNm?=
 =?utf-8?B?ei82YnNVUWZJSnZBRUhmWVFpSHVlbnB2WUlyNzRXRDhPb2wyQU1vN0g1MTBo?=
 =?utf-8?B?QUd1MElSR3NXQ2VqMEoyTEtzM3N1a01qVSt6dEozQzk3UnBzZFpZVFhKUm13?=
 =?utf-8?B?TkIyOFhhVXlUVUVMS2V5K1IrVjVzU2VnUVJKdm02cWhXL1dYeXp3d1pQQ2Yz?=
 =?utf-8?B?c1dZK3ZjcXNZQm9WYUdFNitkOXVWMHhDZHBKejUxVDJ6RWhreGtqdG9WTUZz?=
 =?utf-8?B?dmZxV3VlUjl1Z1NyYjkrSjRvaGRRcVpTenhRN0lvbFRDaVQxSVcyczlMVnBx?=
 =?utf-8?B?Z05YNkwvM29WSkgveldVcTh4UzkrS3hQcEx6bkdDck5vUVJtcnptelZ3Rm1G?=
 =?utf-8?B?cjFXQTJpYjhiaGdieHVTU1NHNVVleVNydk5OZ2xjL2thc1B1OXhtdXQrRUl4?=
 =?utf-8?B?ZVhYMTdVc1NhdGdyU2hxYTdxaW5RNDVpVGhMVkcyUVpIajAzR21qOVJZUEI5?=
 =?utf-8?B?QmFHRk1hR2djV21oWmh2UGhKYU9DUllMNUpuQWw2SWlyeWdGSnVvTGtlQlZk?=
 =?utf-8?B?Z0pqbE4rWUhIR204SThyMFJGcEJsRU1raE9RYzNpS3QrSktyS05vVDRxbjB4?=
 =?utf-8?B?M0xnenIvL0p4WnIwL3kxVC9BOWNENUZvdmhTaE0rV1RFME5ZbDB6TEYxR3Bi?=
 =?utf-8?B?L2pNdlczTEhRallzWnhjbjgzOTRwalBraUZTUWhoZUNsNnBleGVDRktQRmJO?=
 =?utf-8?B?UHN6dzNNdTRpWkxldmVIR0hobG5OdXJhWkJEb0g0S1YxdGFpT01kOG5nd2s1?=
 =?utf-8?B?VGJqNUVCV3J4QlNCTFFjYVJscWNROFZXemlhdC9xZFJ6MWJqVW5xVy9XWkYv?=
 =?utf-8?B?YW9tNXlyVmZYeTNUaXpiNnRYb25rUDVsUWNGL1F5N2dKb2tGRmhZcWZ6N2Iv?=
 =?utf-8?B?S21OUytoSy9pUjJJUjlseGFOdzFEM005aU5CV2RWYWJnSml0aDNCMjEvdTdN?=
 =?utf-8?B?MlY0akE1aitKVVVBUFRWZlRtUENQN3EzSS9wQ0tvcHpXcXM1QmhsRmRxOHk3?=
 =?utf-8?B?RitCMUc3QWVsUzJMNExHUlJrZWNMaFVWUUFTazZsUlF1NytnS04vMWhpN3hL?=
 =?utf-8?B?Q3FQQ2hCdUhLYjBHcDZMZlV3Uk9nY3FnQ0ZxOHljbkFVSk55NmdWUDU1aEQz?=
 =?utf-8?B?My9DZE42Z2w4aXA3WEh5RnZLTmdFQ0UwU1FwZzJsTERKdXF0bnc1Q056aTBz?=
 =?utf-8?B?L2h4ODlaVEtwUFN6cWZjMnVQeU9qamM2VXBOMkljTFAwRWNsMzllZzZDdDVT?=
 =?utf-8?B?ODFvOFRuYnQxczlqY0dTYktVSTh6UHM2RmNpNEwwS1pnTzhxK0FJZVFzY28z?=
 =?utf-8?B?RkZQbDlLclRkVDZrcVBKY1NNb2VZSy9rTFJ2UDFZdG1rWk1iR2MxM1pWdjg1?=
 =?utf-8?B?aUxFbmlLK0xJZUhiVzV6d1NpeC9wUTZXa1RDaXErZ1BiZmgzQWZPYStCa3Ux?=
 =?utf-8?B?RUxSdy9EaUVKV2lKRThvYXdzNVY2UG4ybDh1bVNodW9UVS9iUUVESFo5bzZs?=
 =?utf-8?B?SHQ5Wm5aL1pTN0JOZFFnR3FUQ0Zpb3ViSTZ4di82elFtVkVXakl6QVk2UFB5?=
 =?utf-8?Q?XTVakcVW5pdY2zQzhiGB9owCv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d136a5ac-7f56-4b8b-96e4-08dbc8801af2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 04:27:53.6276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4jc2tKAFURbC4m6zCMXbXWB3yiAYpTETk8bEpq9ljbv64NIPxPLaL/Xw+B9K9SuecjgzqYpbJdvPESvUniWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [v2 3/3] drm/xe: Create a dummy version for vga
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
LnNoYW5rYXJAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgNiwgMjAyMyA1OjI3
IFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IE5pa3VsYSwg
SmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPjsgTXVydGh5LCBBcnVuIFINCj4gPGFydW4uci5t
dXJ0aHlAaW50ZWwuY29tPjsgU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+
IFN1YmplY3Q6IFt2MiAzLzNdIGRybS94ZTogQ3JlYXRlIGEgZHVtbXkgdmVyc2lvbiBmb3Igdmdh
IGRlY29kZQ0KPiANCj4gVGhpcyBpbnRyb2R1Y2VzIGFuIGV4Y2x1c2l2ZSB2ZXJzaW9uIG9mIHZn
YSBkZWNvZGUgZm9yIHhlLg0KPiBSZXN0IG9mIHRoZSBkaXNwbGF5IGNoYW5nZXMgd2lsbCBiZSBy
ZS11c2VkIGZyb20gaTkxNS4NCj4gDQo+IEN1cnJlbnRseSBpdCBhZGRzIGp1c3QgYSBkdW1teSBp
bXBsZW1lbnRhdGlvbi4gVkdBIGRlY29kZSBuZWVkcyB0byBiZQ0KPiBoYW5kbGVkIGNvcnJlY3Rs
eSBpbiBpOTE1LCBwcm9wZXIgaW1wbGVtZW50YXRpb24gd2lsbCBiZSBhZG9wdGVkIG9uY2UgdGhl
IGk5MTUNCj4gY2hhbmdlcyBhcmUgZmluYWxpemVkIGFuZCBtZXJnZWQgaW4gdXBzdHJlYW0uDQo+
IA0KPiB2MjogQWRkcmVzc2VkIEFydW4ncyByZXZpZXcgY29tbWVudHMNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+IC0tLQ0KUmV2aWV3
ZWQtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tcnV0aHlAaW50ZWwuY29tPg0KDQpUaGFua3Mg
YW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5X21pc2MuYyB8IDE0ICsrKysrKysrKysr
KysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5X21pc2MuYw0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1
L2RybS94ZS9NYWtlZmlsZSBpbmRleA0KPiBkZmYxMzg2ZWU2YjMuLjE3NWEzNTczNjZkOSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9NYWtlZmlsZQ0KPiBAQCAtMTUwLDYgKzE1MCw3IEBAIHhlLSQoQ09ORklHX0RS
TV9YRV9ESVNQTEFZKSArPSBcDQo+ICAJZGlzcGxheS94ZV9oZGNwX2dzYy5vIFwNCj4gIAlkaXNw
bGF5L3hlX3BsYW5lX2luaXRpYWwubyBcDQo+ICAJZGlzcGxheS94ZV9kaXNwbGF5X3Jwcy5vIFwN
Cj4gKwlkaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5vIFwNCj4gIAlkaXNwbGF5L2V4dC9pOTE1X2ly
cS5vIFwNCj4gIAlkaXNwbGF5L2V4dC9pOTE1X3V0aWxzLm8NCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kaXNwbGF5X21pc2MuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS9kaXNwbGF5L3hlX2Rpc3BsYXlfbWlzYy5jDQo+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uODFmZjk3ZTcwNGVhDQo+IC0tLSAvZGV2L251bGwN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZGlzcGxheV9taXNjLmMNCj4g
QEAgLTAsMCArMSwxNCBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiAr
LyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4g
Kw0KPiArI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4gKw0KPiArc3RydWN0IHBj
aV9kZXY7DQo+ICsNCj4gK3Vuc2lnbmVkIGludCBpbnRlbF9nbWNoX3ZnYV9zZXRfZGVjb2RlKHN0
cnVjdCBwY2lfZGV2ICpwZGV2LCBib29sDQo+ICtlbmFibGVfZGVjb2RlKSB7DQo+ICsJLyogVG9E
bzogSW1wbGVtZW50IHRoZSBhY3R1YWwgaGFuZGxpbmcgb2YgdmdhIGRlY29kZSAqLw0KPiArCXJl
dHVybiAwOw0KPiArfQ0KPiAtLQ0KPiAyLjQyLjANCg0K
