Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81ACC001E0
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 15:18:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D66C10E37E;
	Wed, 16 Aug 2023 15:18:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E4110E37C
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692199079; x=1723735079;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t9cufwEhNUubEcmWQZad/ZHVe2rEvTe9gVPToROMdf8=;
 b=dGVNatK/65UNyu+PA4wmJ1LmCeDKEtZuYqLXGx46QTp2QUWHdYAepkyE
 pc1kljvfkAGbMFLCpndenn4VOGXwA7s/wT5ITP0Sc48NpjnZrwY5jR699
 2qcS+qR9SB+G8szQka+VrwtYCyQqHaehaJOWXHJFd0dR2sov4BrIDsr9m
 pP4yOXWoWYjO4iLiUTHdN3uuUGqvj+oHd6CC5f9wmZ7nHGB1xf5FGib9C
 YU7sQNSw01qctqnj0cGGbg7bqmJu39JPhxs44+nrzD3C4OKtTGp51VtWl
 3W454uZiDBHOi4mQvh6hxN1AgZwtSCTBm+QH7WE3jaP6AJrnlnNP1OYyC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371467101"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="371467101"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 08:17:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769232337"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; d="scan'208";a="769232337"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 16 Aug 2023 08:17:02 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 08:17:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 08:17:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 08:17:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 08:16:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDx+zpmMfSDXNSPtoRIlc664dIr4XMk23wN0aK02kT+hccUb2Z7+Bwqvg08OykDfCvTX+0CzXdCtTqn8ZH55Pg2v8RtfbZ+MlingJiYo4NKaU4OV2M6PFVBbnL6bxg8vd8JTwNGfQ9XiiGAGw9xWxErOzVlw/EEcz1ehjqB94Ss6aC5FX5OH1OFnZ0KpEpfz2/Ae8mL8s1pu+1cqinY2MvjqDndagyo56Zpb4qVAVu2tGD1DNO39bTjxnNP/DwQ9xavO+DDcWZ1weolMDln2G8xxetV70lGSRc8weeaPSU61kj/5gOv3S7d78ECVPovCTaSvyVPt62401dlhdp7y8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9cufwEhNUubEcmWQZad/ZHVe2rEvTe9gVPToROMdf8=;
 b=NcNSwhxnCSwFC4+sdkF1tMnZgZBPGptZ2BjIAbTTE0ohtIcewfysu8DWDgzBWDg0TIgje7vxQk6Iblj0mJE/fNqeX4LcyoiON9V0h6DRckyEU8zbiP1q3LSrAjRqH3t7bLzL+jqa0wK+NmaMp/wNYtVQSkfWRqN/scJ4sHVT5sYaysyp+6chKW5nIqUqUXtI2RsnYmOzlZKwR0S7njSrdYCAF2lPRCjuiRCxsY1PshY9inw93ZkO82xEI8iLAkW17mT1ekPsmIad69hWEdgDb49qkiwU9HylP3u5KGg8ej+WH8YQLXkPj61wxWAfWIevifWeTbEvtnChCk/AnEwrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Wed, 16 Aug 2023 15:16:57 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::306f:ccd1:2620:a9d7]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::306f:ccd1:2620:a9d7%7]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 15:16:56 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <dev@lankhorst.se>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Implement xe DPT slightly
 differently.
Thread-Index: AQHZzoqvd2ZyDNVFsUG6Smc+Jn9Uma/qHYOAgAD5ooCAAEBcAIAAS1EAgAFnupA=
Date: Wed, 16 Aug 2023 15:16:56 +0000
Message-ID: <DM4PR11MB6360FF278F14DA9A8EED1C9AF415A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20230814083744.4408-1-dev@lankhorst.se>
 <20230814083744.4408-2-dev@lankhorst.se> <ZNpymXLxJGhisx6j@intel.com>
 <875y5gd5ha.fsf@intel.com>
 <303c941b-7d4b-b478-2b39-e438231b4c0c@lankhorst.se>
 <87h6p0b3rn.fsf@intel.com>
In-Reply-To: <87h6p0b3rn.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DS0PR11MB7802:EE_
x-ms-office365-filtering-correlation-id: 797a2796-b315-453f-30da-08db9e6bd45b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pUslGxoVd6Ar+EONDcnNCkDQFrx7vM/llkPjXU5aDWMmVvWkAemEiQxY6SDGrrySO9Jlij9M3uHucUiSDNEtSw2nCtb2NRRyN4og9mgAyU3tygqqJRMRLzn7Gt+jSNFr0FgWlbuCKKObOaITRCb41HNFdX07iMyuwDG56a+GiwICSjR3wDP0gnE3BdV8vA2Ko+0J/3VK3i4REEv01gOxn39BkVX0ibJz0dVa97k7d3GKwjVgms07hsFxEkeDJFuT+DRDhl/MR/cWA7TVHXcOhCwkUSZ/H1xUpwHQZpa0MakghcXO3QVtemCjEoMZS7lDu2mP4xU3RvApOiRWhsihtnGMFG1gOjccEJ6XCtlMxR8z3bwwzaUp+B1kfRysQhBv0suMpt5Km7R/JKbX2c5ilnlLuA7A2GcQqwrLDmvMTMV5eqJ7Am1gzmiYxn9lEJHJt/234CxEAqt1Wo4OsjoC3G7KlI2ckVR4AyFI0PTbEporoPFpI8kSj29Xi/1cehSHpCTA8Kw1SqEuV4tBfBLQReWqKVDcrOQhvxzgP37r22hIiG9Iw2paqL5Mtp9uaHImvh7r/MNwHyLTzH3ZmAuAZzqg31dOLaiXbVIdJJ4lUF0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(6636002)(76116006)(66946007)(64756008)(110136005)(66476007)(66556008)(66446008)(122000001)(41300700001)(52536014)(5660300002)(38070700005)(38100700002)(8676002)(4326008)(8936002)(82960400001)(66899024)(2906002)(83380400001)(26005)(55016003)(478600001)(86362001)(9686003)(53546011)(33656002)(7696005)(6506007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2NaaU4wMis1S3Q1dkhMQWh6dlRubDhQNzRWMjVIMUs2MWd3K2lxcTdWMWVI?=
 =?utf-8?B?YUVqU0lNem9meFJtWFpuaUhSa1Z0cHlxK1Y0MmdXaFNaM3RjSytrMkRvNUJ0?=
 =?utf-8?B?Zzh4cys2K2EzUjcyNmNZVDRZY1h1anRNeFk4R1pkTXNCUTBOVm1PVUMvMm1Z?=
 =?utf-8?B?OWdNSXFzemNGb1NpWXNqTXFMcUFKZWljR1JEQ0hJK3RCZTN2VWtxVWVldG05?=
 =?utf-8?B?R0xvV3hLKytDaXVTZzd2akVVeGF2bXRSMyt3dFhNN3NsQko4SUJaeGtCWWk0?=
 =?utf-8?B?Mzhrenl0TE9ONFpubjJXYWE4a3RvcDRjRjJMc2IvYzhTUmNDV1F1RFZDNExV?=
 =?utf-8?B?YzhUYWpvNFZIRmlSamt5KzA1Mk1IZkF1dGVPSTBRMHA3VE9DcnJEa0szUHRo?=
 =?utf-8?B?QlVCanRBV2Q1MDRaSUFZdEpGU2s1ZnVKbXZIaG93N3E2KzlxVFpvNGNyQmoy?=
 =?utf-8?B?NGViVXdobmd1bHVNZUltRnI3SVFkQkNWb2RPUnU0M3liVVBzaUlvMkdabENz?=
 =?utf-8?B?ejU3NEo2Ykwxd2FGb0R1cmdDM25lQjNCcWZ2ZGNlTDBndXNJcEYzdlJsSFdt?=
 =?utf-8?B?OE80ZzRCT0hCTkMvZ3IrcDhZa2d3VGlPMkluN0FPN1UxZ0JOS1NuLzNaakJo?=
 =?utf-8?B?aDhjMHdXYktmK25QUkNXWVYvdzd5ZXQ3dVVQWTVFUUdFSTFQMm9mVHEzUXFX?=
 =?utf-8?B?aUVRZTZtMFFvcHM0MmZuMFNhWjR3WmpvWDY3OW01aitBTzFnd2QxdFlQN0VC?=
 =?utf-8?B?YVBIaXFVSDJSb3FlbHBUYkJoSUgvZEV6aUI4azEvN0FqdHRqZ0x2K1BmSnVx?=
 =?utf-8?B?L2RFUzdkTTgwSCt4cjQ3QUZ1Umw4VW4yaDRpKzBFM3VkbFhYZE9kbHFKNU1v?=
 =?utf-8?B?cWdvOWYzcTdqVUhoZDh3V3c5ckVYd29jYkJjVjBFL0NqamlGZFAzRFBJVXp5?=
 =?utf-8?B?K0VyS3gvMHNTUStIc0tlUTlzRnJvTklBYWpnNXpjNzAxRWZWamdrTlhGL3RR?=
 =?utf-8?B?Z3MyVDJtN1d0TThXWmE5SW83VG5DbXhiU0lzaWx2cTZkbGFsWUdMNGpiU01r?=
 =?utf-8?B?alB2MWRCVXFSTmh5eXZHQ1ZWNThiR0UycThPK1U3eGFKUXNvcUxzdXlDNnhy?=
 =?utf-8?B?RkY2cEl4WlVpUGY1ekZscnNXUkJaS20rQ0tLWmdzQkx4aEFTdnZyQlJLdW9N?=
 =?utf-8?B?TXJ1QjdhN3FZbjd6UGUxTExXd3VLb0ZRSmdQUUNVK1B3NkZkK1BtK1FuSTRK?=
 =?utf-8?B?SHRLazhkQ29BcVNEQWtMMjFYS2lqYVV0WitrbG5EUGZJcHhiS2FRUVNHbFNr?=
 =?utf-8?B?a0dRU2tnTnFpdnYwdWs1a3R5NmFVL1VpaGNiR2pKT0FYdTZBUWxVYkhQc3gz?=
 =?utf-8?B?eXFUQm54UnhPcDI1dmxXNTJUWjd1aFB1elJmRVlhMWE4RXhydVcyUndQcVpT?=
 =?utf-8?B?bFhoSUEwZm9xZGZMeVl5RU9weTRQYWZQdnpvTEVMVEd5SVFlbzN5SmhmOU1l?=
 =?utf-8?B?cW1vVHRML0pqZ3dnYkhSOC9mVzIvVmVZeFJFNVd4NjBCRnE3OFhhVXhaaW00?=
 =?utf-8?B?azJTWTJEQU5kOTRrcVQzS21mMnVweHR5anNyV1hWY3lZSHNEM0lmRkRURXFQ?=
 =?utf-8?B?MzN4T29XUkNGR3pWRnBwdDdyMUNBTkRtb3B6dkpwQkhZaGlVSURrM3V0d2Nm?=
 =?utf-8?B?MktILzVIcmR6TXpqY1FRTWpZOFFGSmFjWlRmMkgzSFhnN2xFRzNJQVY4TTZt?=
 =?utf-8?B?WFpnRTdaR1pKSDAxUnRqSVpZaGJkS2s4ZUF2SVBSNUI5NjdCL1dNUmZDeUF6?=
 =?utf-8?B?ZUtreXJEOGNUNGFHZTlEa0wzaGVtMjZUMHNDR05MVXZrT0lyam1PQVA5RzND?=
 =?utf-8?B?aUlrTzhqcjhjMXJkMno5d1NNOVFlOXdnOFVPWjVTQTRhUFBDUEdBMklST0s0?=
 =?utf-8?B?NlpadHVqV0RhbjVFVjlaWEQvbXpXa0FQSW1xM1ZWT1lkRytxaFp3cW02REZI?=
 =?utf-8?B?Mkt0blNTUHJiOS9rL3RnSkdSS1JpaTdJM1dvYm42QUJ1ejVDYnh1M2x6bElt?=
 =?utf-8?B?YVNxb2ZocVlJbUJOK0VQd0Q2ekcwOGhpei82U3FwdmxkRmtUaWZ1NFcwR0cx?=
 =?utf-8?Q?/zk6KSf8iW+rSAZm6PdbhTjzb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797a2796-b315-453f-30da-08db9e6bd45b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2023 15:16:56.4348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrA9FYdPsRi3+DPEPOH+/9iZK66btAUk67FT+B8ZlE1GGqusFIVmGViI6dZ9ghZ3yHuhErPoBSCiegi1Kk42yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Implement xe DPT slightly
 differently.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSmFuaSBOaWt1
bGENCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDE1LCAyMDIzIDExOjEzIFBNDQo+IFRvOiBNYWFy
dGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28u
dml2aUBpbnRlbC5jb20+DQo+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
U3ViamVjdDogUmU6IFtJbnRlbC14ZV0gW1BBVENIIDIvMl0gZHJtL3hlOiBJbXBsZW1lbnQgeGUg
RFBUIHNsaWdodGx5IGRpZmZlcmVudGx5Lg0KPiANCj4gT24gVHVlLCAxNSBBdWcgMjAyMywgTWFh
cnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+IHdyb3RlOg0KPiA+IEV2ZW4gZm9yIDEg
bGluZSBjaGFuZ2VzIGxpa2UgdGhpcz8gKEFkZGluZyBhbiBpZiB0aGF0IGlzIGFsd2F5cyB0cnVl
DQo+ID4gb24NCj4gPiBpOTE1LikNCj4gDQo+IFllcy4gQXQgdGhlIG1vbWVudCB0aGUgZGVwZW5k
ZW5jaWVzIGFyZSBwcmV0dHkgY29tcGxleCwgYmVjYXVzZSB0aGUgeGUgY2hhbmdlcw0KPiBoZXJl
IGRlcGVuZCBvbiBhIGxvdCBvZiB4ZSBjb21taXRzIHRoYXQgaW4gdHVybiBkZXBlbmQgb24gYSBi
dW5jaCBvZiBpOTE1IGNvbW1pdHMNCj4gdGhhdCBuZWVkIHRvIGJlIHJlZmFjdG9yZWQuDQo+IA0K
PiBJZiB3ZSBjYW4gaXNvbGF0ZSB0aGUgaTkxNSBwYXRjaGVzIHN1Y2ggdGhhdCB0aGV5IGRvbid0
IGRlcGVuZCBvbiBhbnl0aGluZyBhbmQgY2FuDQo+IGJlIHF1ZXVlZCB1cHN0cmVhbSBmaXJzdCB0
aGluZywgaXQgbWFrZXMgb3VyIGxpdmVzIGVhc2llci4NCj4gDQo+IEFuZCBvYnZpb3VzbHkgaXQn
cyAqbXVjaCogZWFzaWVyIHRvIHNxdWFzaCBhbmQganVnZ2xlIHBhdGNoZXMgbGF0ZXIgb24gdGhh
biB0byBzcGxpdA0KPiB0aGVtIHVwLg0KDQpIaSBNYWFydGVuLA0KSWYgdGhlIGNoYW5nZXMgYXJl
IG1peGVkLCBpdCB3aWxsIGNyZWF0ZSBwcm9ibGVtIGluIHJlYmFzZXMgYW5kIGNsZWFyIHNlcGFy
YXRpb24gZXRjLiANCkl0cyBnb29kIHRvIGhhdmUgY2hhbmdlcyBpbiBzZXBhcmF0ZSBwYXRjaGVz
Lg0KDQpPdGhlcndpc2UgdGhlIGNoYW5nZSBsb29rcyBhbiBvayB3b3JrYXJvdW5kIHRvIHVuYmxv
Y2sgRFBULiBIYXZpbmcgYSBjdXN0b20gZHVtbXkNCmltcGxlbWVudGF0aW9uIGluIFhlLiBIb3dl
dmVyIHRoaXMgd2lsbCByZXF1aXJlIGEgcHJvcGVyIGhhbmRsaW5nIHdpdGggY2xlYW4gZml4IGxh
dGVyIG9uLg0KVG8gdW5ibG9jayBYZSBkZXZlbG9wbWVudCBhbmQgZW5hYmxlIHRpbGluZyBhbmQg
cmVzdCBvZiB0aGUgRFBUIGRlcGVuZGVudCB0ZXN0LCBJIGZlZWwgd2UNCmNhbiBnbyB3aXRoIHRo
ZSBjdXJyZW50IGFwcHJvYWNoLiBBIGNsZWFuZXIgc29sdXRpb24gY2FuIGJlIHBsYW5uZWQgZGly
ZWN0bHkgaW4gdXBzdHJlYW0uDQpQbGVhc2UgcmUtZmxvYXQgdGhlIGNoYW5nZXMgYW5kIHdpbGwg
YWNrIHRoZSBzYW1lLg0KDQpSZWdhcmRzLA0KVW1hIFNoYW5rYXINCg0KPiBCUiwNCj4gSmFuaS4N
Cj4gDQo+IA0KPiA+DQo+ID4gT24gMjAyMy0wOC0xNSAxMToyMywgSmFuaSBOaWt1bGEgd3JvdGU6
DQo+ID4+IE9uIE1vbiwgMTQgQXVnIDIwMjMsIFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4gd3JvdGU6DQo+ID4+PiBPbiBNb24sIEF1ZyAxNCwgMjAyMyBhdCAxMDozNzo0NEFN
ICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90ZToNCj4gPj4+PiBGcm9tOiBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiA+Pj4+DQo+ID4+
Pj4gSnVzdCBjcmVhdGUgYSBkdW1teSB0byBtYWtlIERQVCB3b3JrLg0KPiA+Pj4+DQo+ID4+Pj4g
U2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QNCj4gPj4+PiA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICAgLi4uL2RybS9pOTE1L2Rp
c3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jICAgIHwgIDMgKy0NCj4gPj4+PiAgIGRyaXZlcnMv
Z3B1L2RybS94ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gPj4+PiAgIGRy
aXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2RwdC5jICAgICAgICAgICB8IDQ2ICsrKysrKysr
KysrKysrKysrKysNCj4gPj4+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiA+Pj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS94ZS9kaXNwbGF5L3hlX2RwdC5jDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gPj4+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+ID4+Pj4g
aW5kZXggYzI4ZjQxOThhYTE1Li45NDY5ZWM1YTA0MTcgMTAwNjQ0DQo+ID4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gPj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3NrbF91bml2ZXJzYWxfcGxhbmUuYw0K
PiA+Pj4NCj4gPj4+IFdlIG5lZWQgdG8gbWFrZSBpOTE1IGFuZCB4ZSBjaGFuZ2VzIGluIHNlcGFy
YXRlZCBwYXRjaGVzLg0KPiA+Pj4gSWRlYWxseSB3ZSBtYWtlIGFsbCBpOTE1IGNoYW5nZXMgaW4g
YSB3YXkgdGhhdCBpdCBjb3VsZCBldmVuIGdvDQo+ID4+PiBkaXJlY3RseSB0byBkcm0taW50ZWwt
bmV4dCBhbHJlYWR5Li4uDQo+ID4+DQo+ID4+IFllcywgcGxlYXNlIQ0KPiA+Pg0KPiA+PiBCUiwN
Cj4gPj4gSmFuaS4NCj4gPj4NCj4gPj4+DQo+ID4+PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4NCj4gPj4+DQo+ID4+Pj4gQEAgLTEwMTAsNyArMTAxMCw4IEBAIHN0YXRp
YyB1MzIgc2tsX3N1cmZfYWRkcmVzcyhjb25zdCBzdHJ1Y3QNCj4gaW50ZWxfcGxhbmVfc3RhdGUg
KnBsYW5lX3N0YXRlLA0KPiA+Pj4+ICAgCQkgKiBUaGUgRFBUIG9iamVjdCBjb250YWlucyBvbmx5
IG9uZSB2bWEsIHNvIHRoZSBWTUEncyBvZmZzZXQNCj4gPj4+PiAgIAkJICogd2l0aGluIHRoZSBE
UFQgaXMgYWx3YXlzIDAuDQo+ID4+Pj4gICAJCSAqLw0KPiA+Pj4+IC0JCWRybV9XQVJOX09OKCZp
OTE1LT5kcm0sIHBsYW5lX3N0YXRlLT5kcHRfdm1hLT5ub2RlLnN0YXJ0KTsNCj4gPj4+PiArCQlp
ZiAocGxhbmVfc3RhdGUtPmRwdF92bWEpDQo+ID4+Pj4gKwkJCWRybV9XQVJOX09OKCZpOTE1LT5k
cm0sIHBsYW5lX3N0YXRlLT5kcHRfdm1hLQ0KPiA+bm9kZS5zdGFydCk7DQo+ID4+Pj4gICAJCWRy
bV9XQVJOX09OKCZpOTE1LT5kcm0sIG9mZnNldCAmIDB4MWZmZmZmKTsNCj4gPj4+PiAgIAkJcmV0
dXJuIG9mZnNldCA+PiA5Ow0KPiA+Pj4+ICAgCX0gZWxzZSB7DQo+ID4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiA+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3hl
L01ha2VmaWxlIGluZGV4IDZkOTE5NmFiMjc1Yy4uMzNiZmUzMzYzMmRiDQo+ID4+Pj4gMTAwNjQ0
DQo+ID4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlDQo+ID4+Pj4gQEAgLTE0MSw2ICsxNDEsNyBAQCAk
KG9iaikvaTkxNS1kaXNwbGF5LyUubzoNCj4gJChzcmN0cmVlKS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5LyUuYyBGT1JDRQ0KPiA+Pj4+ICAgIyBEaXNwbGF5IGNvZGUgc3BlY2lmaWMgdG8g
eGUNCj4gPj4+PiAgIHhlLSQoQ09ORklHX0RSTV9YRV9ESVNQTEFZKSArPSBcDQo+ID4+Pj4gICAJ
eGVfZGlzcGxheS5vIFwNCj4gPj4+PiArCWRpc3BsYXkveGVfZHB0Lm8gXA0KPiA+Pj4+ICAgCWRp
c3BsYXkveGVfZmJfcGluLm8gXA0KPiA+Pj4+ICAgCWRpc3BsYXkveGVfaGRjcF9nc2MubyBcDQo+
ID4+Pj4gICAJZGlzcGxheS94ZV9wbGFuZV9pbml0aWFsLm8gXA0KPiA+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9kcHQuYw0KPiA+Pj4+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL2Rpc3BsYXkveGVfZHB0LmMNCj4gPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0K
PiA+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMDY5NTg4NjA0NWUzDQo+ID4+Pj4gLS0tIC9kZXYv
bnVsbA0KPiA+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2RwdC5jDQo+
ID4+Pj4gQEAgLTAsMCArMSw0NiBAQA0KPiA+Pj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTUlUDQo+ID4+Pj4gKy8qDQo+ID4+Pj4gKyAqIENvcHlyaWdodCDCqSAyMDIzIEludGVsIENv
cnBvcmF0aW9uICAqLw0KPiA+Pj4+ICsNCj4gPj4+PiArI2luY2x1ZGUgImludGVsX2RwdC5oIg0K
PiA+Pj4+ICsNCj4gPj4+PiArI2luY2x1ZGUgImk5MTVfcmVnLmgiDQo+ID4+Pj4gKw0KPiA+Pj4+
ICsjaW5jbHVkZSAiaW50ZWxfZGUuaCINCj4gPj4+PiArI2luY2x1ZGUgImludGVsX2Rpc3BsYXku
aCINCj4gPj4+PiArI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4gPj4+PiArDQo+
ID4+Pj4gK3ZvaWQgaW50ZWxfZHB0X2Rlc3Ryb3koc3RydWN0IGk5MTVfYWRkcmVzc19zcGFjZSAq
dm0pIHsgfQ0KPiA+Pj4+ICsNCj4gPj4+PiArc3RydWN0IGk5MTVfYWRkcmVzc19zcGFjZSAqDQo+
ID4+Pj4gK2ludGVsX2RwdF9jcmVhdGUoc3RydWN0IGludGVsX2ZyYW1lYnVmZmVyICpmYikgew0K
PiA+Pj4+ICsJcmV0dXJuIE5VTEw7DQo+ID4+Pj4gK30NCj4gPj4+PiArDQo+ID4+Pj4gK3ZvaWQg
aW50ZWxfZHB0X2NvbmZpZ3VyZShzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0Yykgew0KPiA+Pj4+ICsJ
c3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KGNydGMtPmJhc2UuZGV2KTsN
Cj4gPj4+PiArDQo+ID4+Pj4gKwlpZiAoRElTUExBWV9WRVIoaTkxNSkgPT0gMTQpIHsNCj4gPj4+
PiArCQllbnVtIHBpcGUgcGlwZSA9IGNydGMtPnBpcGU7DQo+ID4+Pj4gKwkJZW51bSBwbGFuZV9p
ZCBwbGFuZV9pZDsNCj4gPj4+PiArDQo+ID4+Pj4gKwkJZm9yX2VhY2hfcGxhbmVfaWRfb25fY3J0
YyhjcnRjLCBwbGFuZV9pZCkgew0KPiA+Pj4+ICsJCQlpZiAocGxhbmVfaWQgPT0gUExBTkVfQ1VS
U09SKQ0KPiA+Pj4+ICsJCQkJY29udGludWU7DQo+ID4+Pj4gKw0KPiA+Pj4+ICsJCQlpbnRlbF9k
ZV9ybXcoaTkxNSwgUExBTkVfQ0hJQ0tFTihwaXBlLCBwbGFuZV9pZCksDQo+ID4+Pj4gKwkJCQkg
ICAgIFBMQU5FX0NISUNLRU5fRElTQUJMRV9EUFQsDQo+ID4+Pj4gKwkJCQkgICAgIGk5MTUtPnBh
cmFtcy5lbmFibGVfZHB0ID8gMCA6DQo+IFBMQU5FX0NISUNLRU5fRElTQUJMRV9EUFQpOw0KPiA+
Pj4+ICsJCX0NCj4gPj4+PiArCX0gZWxzZSBpZiAoRElTUExBWV9WRVIoaTkxNSkgPT0gMTMpIHsN
Cj4gPj4+PiArCQlpbnRlbF9kZV9ybXcoaTkxNSwgQ0hJQ0tFTl9NSVNDXzIsDQo+ID4+Pj4gKwkJ
CSAgICAgQ0hJQ0tFTl9NSVNDX0RJU0FCTEVfRFBULA0KPiA+Pj4+ICsJCQkgICAgIGk5MTUtPnBh
cmFtcy5lbmFibGVfZHB0ID8gMCA6DQo+IENISUNLRU5fTUlTQ19ESVNBQkxFX0RQVCk7DQo+ID4+
Pj4gKwl9DQo+ID4+Pj4gK30NCj4gPj4+PiArDQo+ID4+Pj4gLS0NCj4gPj4+PiAyLjM5LjINCj4g
Pj4+Pg0KPiA+Pg0KPiANCj4gLS0NCj4gSmFuaSBOaWt1bGEsIEludGVsIE9wZW4gU291cmNlIEdy
YXBoaWNzIENlbnRlcg0K
