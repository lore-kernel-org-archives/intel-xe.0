Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F641CA5531
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 09:45:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B2E10E0A1;
	Wed, 13 Sep 2023 09:45:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E09210E0A1
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 09:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694598305; x=1726134305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=mtPRls+P9/sa7AqxycHZgcmNLvhEMI3Lme66xGVNwZo=;
 b=oDTHdTj4TBPDBJ6IS43+AAPteyBaYIzUe7GVZAHFjYgOZqthrChLwU3x
 F4GtniPDhqkrkYeWbOBEMrS486QPKdEH9R1erunSZKsB7YuTQF6lut9nD
 uIjxPpc1S/OF4PbyxFm/B0idAJFl4P1FYnVKd57kRmrQQqqbNeqlN04wx
 11MVQerQ3y2w33XFevdMVOdqjq7DL7qROe/Fn6lAHu/FyAfCo+BYRMbir
 F/BFex+oSrni5CGRGGzAVOoOYOftBEiPoDVcUPp5B4g0slbV/R/DnbAVC
 aVUgogdgcDFlABDobIRJbjJ6Xsh4e0BcUZXBsjAf0eYZYuYtCQPBzyjSV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377524708"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="377524708"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 02:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="1074890829"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; d="scan'208";a="1074890829"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 02:45:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 02:45:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 02:45:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 02:45:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZh5KWtv4HS7hQ4C9x8kTaowV8dZzil7Mlb4aPQ4HpxWPEpJgOzn3Lif30fYdb0h0f/QY5uRLy+fJkMMdFkPZZxttvqyxag8D96P/l8bBi624q2tgNTgl/GFvlXsaRxm65SKmSX6/sk/L5jWMZB62E6cO8k+HmGPfI2peC3h9PNiWF+bk3LHEk3AY7+4+VA42EVcgFSVuMODqJfr+t9EUh6NOvYCjSxKKw/DJcwUmjdK1YL1juTD5WQip2LacBDPy8gssK4pUlHFTPQxkVrEhYJNRKxBBW/h2XfmwpKEjYNGXnNsDIOzEuRw4Kb0gWc/qPrnLpHdYuy9+jxfzcKcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtPRls+P9/sa7AqxycHZgcmNLvhEMI3Lme66xGVNwZo=;
 b=fuhDsGH0AoSPSUYqkmw6KVE7Y5AgMEGwPtdCda7Reb5l+mxUMDGHnqZcVzXWXxQnjZqThpcUkzax7lF63Pk4JlpCxo4PfxKYoaE9EwYnffw/ZHW8K1iFlWKYaOahDC3drW9/HkXR3u6mC5qnI1QFZWdA/WpDw0X1yPWa9loCrIq/5e+wRV9Ds/PuSY74es6hzlLmEiJyaSflomzf4/9JBsFKcR3+NdF0CxMnWcTEvr1s7jNwpcw8TJq2knhD+yI6xz5oKVbfxmWWMlA/hhlqdXW3LWgIXjo/7RnWEHmvXFVFF8/1BPuzVsXYjgc6rTn+DedGefPnmRVxErcPc1293A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.31; Wed, 13 Sep 2023 09:45:00 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 09:45:00 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [PATCH v3 00/12] Frontbuffer tracking refactoring
Thread-Index: AQHZ5UT95bmc0NQolUykvF/3dqXNXLAXXYWAgAEl2wA=
Date: Wed, 13 Sep 2023 09:44:59 +0000
Message-ID: <e4b9a3b890d8306808e833c301f2d127a3c0e2c5.camel@intel.com>
References: <20230912064709.2802305-1-jouni.hogander@intel.com>
 <0dd3d826-2d1a-6e99-5859-90aab350da2e@linux.intel.com>
In-Reply-To: <0dd3d826-2d1a-6e99-5859-90aab350da2e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB5765:EE_
x-ms-office365-filtering-correlation-id: e0914d04-1564-4c64-032f-08dbb43e18bc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QGakhcr6TDtun+gwe4CKxBPZ9fAIVlDScojyR6YOtudgzbFTZ1xT+QjqeXnyFX1XZksjJGSiJG2206GlFv78TK0Daty0gnmL3WnRZ/5PSVUv2QMc/GnCNBUDjRJ7VUw5cy/M42iuIcLJYr8Vm7L/0x27PNaMfZp1XKw0X11XfQGVOse6CFuND4SfHweK8rA3tpvdXg8BrmhB+Nv+VlrtyKFbgZq6ADWjNh4Bu+ErO7qwyUPoEJnY6wfYN3nTIcExc+qW2V9wtTWGgVTKGq1fG9sJwtRAa5/ALbGmiNWC7KNCf7nk7Uy/Z0EQbDDlMJP+dK/u5mgo+Jp2gjDrIDHHPO5QxoAR2ot2ux93pMj85naju6n7adsEp3mEXxFSrQ8dXVtjfV/euAjJKeDMZmJ/MiAdplz88ZYuIlxJ8+mwaj6CVfGS0o9mq9moMHCG+NJiy8pnCALMHUbFsWf3nJXKFb2sg73Isi2ki/rS5xk8SxT1eEQq3cE+Ty3smYubElVah39XMIy5u34PMCiVE1IlC7cqQzPeCjv3EoRQaz3koMRKtXfANjaBCGhAkDU9Lts69JbteNwW23UUdCTsjvpXmcjmJUSoGyxUQaPa6Rr4NEC6Q42kVYd0iwcPXRFH2AYj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199024)(186009)(1800799009)(110136005)(122000001)(71200400001)(53546011)(6506007)(6486002)(38100700002)(82960400001)(38070700005)(86362001)(36756003)(2906002)(83380400001)(6512007)(26005)(478600001)(2616005)(8676002)(4326008)(8936002)(91956017)(41300700001)(5660300002)(66476007)(66446008)(66946007)(54906003)(76116006)(64756008)(316002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzhvdzB1d2I3N3ZvcWFZWnBPTStFRG1GdGlvRDY4Y2wrRjZ5VVNLejFWYkps?=
 =?utf-8?B?TlA4dFFSUjlocjhTZXFsZ09QR1p1QjQvRzU5S3FRSC9TSkk1cnFxcDZwNmxx?=
 =?utf-8?B?MCs0RTcxa3YvbnlRVXAwTzFDa0NFMGorZWlMeTZ0eng3UUkvbnVDZ29tU0g3?=
 =?utf-8?B?WjVidEpudlBLNkhvcHJnM3dZUTNsRDVXckc1cWxYNk5EZmFOZEhKMENsbC9v?=
 =?utf-8?B?cW5PUkNHOGkxM2hTOVhKNHljUDdaQUpNUTBkODhJZ1QxcjAvQVdWd0VBdGxj?=
 =?utf-8?B?MUxyNVl6VW45bWxVellOSnV5U0trVVJtMnlHd0hzMVBQbDhHZGl3RXZwM0Fh?=
 =?utf-8?B?WUFjVUFxSE45NURlaUFkN1d2WU5RZ2VlWmtLbncvZFc3Q3hBUWNJOHY4U0Zj?=
 =?utf-8?B?a2V4OGVPKy9Lb0FGb1BiNUdiOWZ5QzRoSzIxbnFiclgreW94WkV2UzBWRHkx?=
 =?utf-8?B?ZVdpR2VpSzdYbG9paWZGT3NPYWpNRVFxRnV2eEcva28rdkVYZ1Z6dzFrS3Fv?=
 =?utf-8?B?Y0Jzb25lYmZDYmwwZ1ExQXY2TU0wRExqRXZWS3RMb1dxWkEvWHl4cjFOczU4?=
 =?utf-8?B?elNRQitnNDdVVHpWZ0tXaVFramliVlQzazlEb0NITTlwQVhDdmRsWHFXa0NZ?=
 =?utf-8?B?bjRSVE4wMHZicDRCRjc3MDRnSHJ0Z3VtdXV2dXp4aEpwQ3JuaVNoNlM0Mm9G?=
 =?utf-8?B?UTlVRm9rdjhWbVF6cUlNa0c4NG5NaUdCc2poTXNMdC84aUJHbTRqVE9iYlVF?=
 =?utf-8?B?V1pqZnQ4NFNKQ0FoK1llVlozbTBmV2p2b3lHaG02ZFJuUHNhWkhoZEtrV0hm?=
 =?utf-8?B?NVBTejJCWTNMTnpBU1RYZmdQTnAydXdZaEc2YkRjUUMvcWFqNlpwMFpycmNk?=
 =?utf-8?B?KzdLdFZVVnhXNHgrN05ENFk0YnNPcXNDUkhpVFJvUkZQdStaSlM1TUw0c2hj?=
 =?utf-8?B?ZWpBWExqbWt4QVdLd1F4MEVMYWV4ZldFSXpPM1FZWGU0eEVpS3VEazMzK2lQ?=
 =?utf-8?B?aVQ5QzByVmsxSGlWbEVpZEJQNnFGbVI1ZWtmN0Y3WWtaUm1INEFXOE5IQmhS?=
 =?utf-8?B?NnFDblRLcWJ2bmxOUWlpcGh2RTFoZk5pK1gyVlYwaFYxMHlkeUJiWnZ3VjQz?=
 =?utf-8?B?UXZHNFNYK3RhRVFEeVNSeE5BTm52ajJLdVlkZG4xWng5ODlUdjFaTjN5RDh5?=
 =?utf-8?B?a1BKbVBkZHJma1dMN2ptRU9aUThEUmFhNkdtOTVWbGg3bG5uZ3hwYWdjZGlW?=
 =?utf-8?B?RU1JWjAwSHRJYUtUcmh0dTZ2UHZ1bUNYWDZ0NkFrMjJhdlJ4N2U3WmZTRmxC?=
 =?utf-8?B?dExyUFNIN2V6WkpLY09vaTdRVU9NQ3BZVHBwRzJKaG81dEE1MDZsSHN5bGcx?=
 =?utf-8?B?VkR3T1UrbS93MUwvL2lNM2hudmJUclJ1bCtIMnFWR0dIdnhUOUxqL3F6eVU0?=
 =?utf-8?B?ejJuNlBJWTRPWDNnUVdaMmNMVjV4NkMrNHFEdUQ5a3dBNHhqelJRY3VSWlh6?=
 =?utf-8?B?UGE5aXhvc2orN2ZuZkd5NkZKN3JhellIUkUwWGc2ZVRXSTVBWmU1TG52NWwx?=
 =?utf-8?B?RllYSW9KUEFnb1ZvOUdHbXZGWENTQytmV3VYRE1CcU5kNzFtaTU1OWtDS0hx?=
 =?utf-8?B?Zm9HQUYyTTJLNWE2eUlkcG1XQzB5SE1MNksweVZYemE2SnRuSVE0dnRHN2Nn?=
 =?utf-8?B?OWloZFc0WkJaRURHeFQ0WmtQYUFBOXZhU2ZvNmVtQWY4REIxemhER3RmdjI5?=
 =?utf-8?B?bFdnY0JBK1ExL2xLbFlFck5IZU5JblJWWHlGaG1hUHJKc3dqUmN3ZWx5VHdC?=
 =?utf-8?B?REFEOUxLbVhaZW54MVpFQzhwRmZ1U0grK3YvaklQeEZlZ2xEc3hsUlV3YUcz?=
 =?utf-8?B?UFdvd3JjMldWV2xwVE9jZEdFN0xBUldQRWZkdldwbyttQ20vYzVCNFJBMFF1?=
 =?utf-8?B?YlZDaTBWTE9ZcEZUYjBsVExDUkVyOFB2eHcvV3ZLOXRFeE9mSlJTMmdqSmZ3?=
 =?utf-8?B?WDhVLy9qbFVNQ3UxVUthTWZTRkVvRi9wVlFrNDVVeEpvbloyd3pzNGkxaldu?=
 =?utf-8?B?OVFVTU85cklKOW5UY3R4dEw1N0F1UWY1WGZTbXlYaEZSTG1zajhOUThyU1do?=
 =?utf-8?B?UXBWSndIS1E2OVpKbjhYUTZOVnVncjRoOHBiNE03eEhLaUVxQUhOL09ENS9K?=
 =?utf-8?B?YVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C375E646F19A41498D6C3E2EC47373B4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0914d04-1564-4c64-032f-08dbb43e18bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 09:44:59.8652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jO4AdXo/T9Wpt3plYBUsH0O3JVxDUKU0iQHXAtjpO90fqkivhxBKcK+4qflYjtvhhgu0f6hec9bJtVmcjdvpNcF457OLDPFepUiUMje7bVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5765
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 00/12] Frontbuffer tracking refactoring
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTEyIGF0IDE4OjEzICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gRm9yIHRoZSBzZXJpZXM6DQo+IFJldmlld2VkLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KDQpUaGFuayB5b3UgTWFhcnRlbiBm
b3IgcmV2aWV3aW5nIG15IHBhdGNoZXMuIFRoZXNlIGFyZSBub3cgbWVyZ2VkLg0KDQpCUiwNCg0K
Sm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IE9uIDIwMjMtMDktMTIgMDg6NDYsIEpvdW5pIEjDtmdh
bmRlciB3cm90ZToNCj4gPiBUaGVzZSBwYXRjaGVzIGFyZSBjbGVhbmluZyB1cCBhbGwgI2lmZGVm
cyBhZGRlZCBpbnRvDQo+ID4gaW50ZWxfZnJvbnRidWZmZXIuW2NoXSBmb3IgWGUgYnVpbGQuIEk5
MTUgcGFydCBvZiB0aGUgcmVmYWN0b3JpbmcNCj4gPiBpcw0KPiA+IGFscmVhZHkgbWVyZ2VkIGlu
dG8gZHJtLXRpcCBhbmQgdGhlc2UgcGF0Y2hlcyBhcmUgaW1wbGVtZW50aW5nIG9yDQo+ID4gYWRk
aW5nIGVtcHR5IGRlZmluZXMgZm9yIFhlLg0KPiA+IA0KPiA+IHYzOg0KPiA+IMKgwqAgLSBkcm9w
IHJlZmVyZW5jZSBjb3VudGluZyBmcm9tIHhlIGZyb250YnVmZmVyIHNldCBpbXBsZW1lbnRhdGlv
bg0KPiA+IHYyOg0KPiA+IMKgwqAgLSB4ZV9ibyBnZXQvcHV0IGhhbmRsaW5nIGNoYW5nZWQNCj4g
PiANCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gPiBDYzogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4g
PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4gPiBDYzogUm9kcmln
byBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiA+IA0KPiA+IEpvdW5pIEjDtmdhbmRl
ciAoMTIpOg0KPiA+IMKgwqAgZHJtL2k5MTUvZGlzcGxheTogTW92ZSByZWxlYXNpbmcgZ2VtIG9i
amVjdCBhd2F5IGZyb20gZmINCj4gPiB0cmFja2luZw0KPiA+IMKgwqAgZHJtL2k5MTU6IElnbm9y
ZSBzZXQgZnJvbnRidWZmZXIgcmV0dXJuIHZhbHVlIG9uIHJlbGVhc2UNCj4gPiDCoMKgIGZpeHVw
ISBkcm0vaTkxNS9kaXNwbGF5OiBSZW1haW5pbmcgY2hhbmdlcyB0byBtYWtlIHhlIGNvbXBpbGUN
Cj4gPiDCoMKgIGRybS94ZTogQWRkIG1hY3JvIHRvIGdldCBpOTE1IGRldmljZSBmcm9tIHhlX2Jv
DQo+ID4gwqDCoCBmaXh1cCEgZHJtL2k5MTUvZGlzcGxheTogUmVtYWluaW5nIGNoYW5nZXMgdG8g
bWFrZSB4ZSBjb21waWxlDQo+ID4gwqDCoCBkcm0veGU6IEFkZCBmcm9udGJ1ZmZlciBzZXR0ZXIv
Z2V0dGVyIGZvciB4ZV9ibw0KPiA+IMKgwqAgZml4dXAhIGRybS9pOTE1L2Rpc3BsYXk6IFJlbWFp
bmluZyBjaGFuZ2VzIHRvIG1ha2UgeGUgY29tcGlsZQ0KPiA+IMKgwqAgZHJtL3hlOiBBZGQgaTkx
NV9hY3RpdmUuaCBjb21wYXRpYmlsaXR5IGhlYWRlcg0KPiA+IMKgwqAgZHJtL3hlL2Rpc3BsYXk6
IEluY2x1ZGUgaTkxNl9hY3RpdmUgaGVhZGVyDQo+ID4gwqDCoCBkcm0veGU6IEFkZCBzdHJ1Y3Qg
aTkxNV9hY3RpdmUgZm9yIFhlDQo+ID4gwqDCoCBmaXh1cCEgZHJtL2k5MTUvZGlzcGxheTogUmVt
YWluaW5nIGNoYW5nZXMgdG8gbWFrZSB4ZSBjb21waWxlDQo+ID4gwqDCoCBkcm0veGU6IEFkZCBl
bXB0eSBkZWZpbmUgZm9yIGk5MTVfZ2d0dF9jbGVhcl9zY2Fub3V0DQo+ID4gDQo+ID4gwqAgLi4u
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Zyb250YnVmZmVyLmPCoCB8IDI5ICsrKy0tLS0t
LS0tLS0tDQo+ID4gLS0tLS0NCj4gPiDCoCAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZnJvbnRidWZmZXIuaMKgIHzCoCAyIC0tDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX29iamVjdC5owqDCoMKgIHzCoCAxICsNCj4gPiDCoCAuLi4vZHJtL3hlL2NvbXBh
dC1pOTE1LWhlYWRlcnMvaTkxNV9hY3RpdmUuaMKgIHwgMjIgKysrKysrKysrKysrKysNCj4gPiDC
oCAuLi4vY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1X2FjdGl2ZV90eXBlcy5owqDCoCB8IDEzICsr
KysrKysrKw0KPiA+IMKgIC4uLi9ncHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV92
bWEuaCB8wqAgMiArKw0KPiA+IMKgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5owqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMgKysNCj4gPiDCoCBkcml2ZXJzL2dw
dS9kcm0veGUveGVfYm9fdHlwZXMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsr
DQo+ID4gwqAgOCBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMo
LSkNCj4gPiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL2NvbXBhdC1p
OTE1LQ0KPiA+IGhlYWRlcnMvaTkxNV9hY3RpdmUuaA0KPiA+IA0KDQo=
