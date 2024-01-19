Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D699C4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 09:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C145A10E9A6;
	Fri, 19 Jan 2024 09:35:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563F610E99E
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705656948; x=1737192948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hZrS4ELoryOgcPOZochoWDAeVAC17p6m4irCInYkXJs=;
 b=GlLR/EpxZ5FrR0CM42rKxBj5zAvSrXVNoDSo4bOcxfJ0b9cHbijkGdUo
 BffERPJl+4R3D9+UY/X49EupNGQEdxrdvpBbVXHk3abPSFYd/C4xgxDl8
 r77o/HA9Xy/Z60upTusC/Qd8NVCPguBBSpCLIB/2LjASAc79tQIBNh6/F
 PqAPoouH7DbrnHWAj3NCL7wF3iOuMXxqE9h4gYb8wcn39hCuqeqq6YBJ9
 tpPucBBzKVtUCni1SASTM1zTfnB9z9dVvG5VJTE15Hrte95eDWlIa/EYC
 jgF42tkpLgBsDFtf5+lPF2LqqsMwm+VGyHwtCWF+ZuuISSFsuJmupzcYS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="391146851"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="391146851"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 01:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="643492"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 01:35:26 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 01:35:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 01:35:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 01:35:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3WQkkaT0Xfe1+z+gFZ13yR/HT1kDnUUznky2f2N8kMboBHXGvCzoXEcXcxd7XpA+WZR7qHQo8hNimqopsfUPguvnJZmme7hkLG1otOLeed9OLZ1dfBcX4mES6itYmzZPIsKvqzTxbXZrS/Z4Flq9JSB15KsdCeZEqYyxo9jZUWRCpfnIsSpZ9xsgXY2g+XFf7CYYM2yt8bghftv3wCOfClmQUyyKJxlWUKMEdMD/dteZBzM2PNduOVg/AGDaSDmQjOpB1hZq9xJjG9GpEUYIdH0JIsEFNDx0X3wUl8OEuKdtKISUX0XTVVAcYQcr93dLpgeqi6+V7HaJYohfD6CtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZrS4ELoryOgcPOZochoWDAeVAC17p6m4irCInYkXJs=;
 b=fee++9AaRLE93AZHp2VdwpVuLTbaclFugVfGuu2pBq5CddjmRps4nkMtWWjExi2TTlTOw/TIeprABRSRj2fHAk6u452yW+7i8rD/zS8Cq7sOOg2wilJ9ZbzDDkEz9RlULTpxwD5LR3eXuIK3M3lFyWiwR0t8T/kyHZfli2B/HoZLio/cE8oWfyb7s3vilpXGGlQ3z114Okk+vMTjP60iw68rcziKkVgdXqfRvVmCtdqktlCT2p33yrQuEG96PnQZpy47UblaaLmshlrBUK6W+uR5CjpUGLRb2mh4B6XaIYTBUNAkEh6fhZyPAtEeYSvx+HF0LZR2BBRUT7LoJz45yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.26; Fri, 19 Jan
 2024 09:35:23 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 09:35:22 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
Thread-Topic: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
Thread-Index: AQHaSq5/sHAJbBHwP0+sQUDZVH3d1LDg3fuAgAABIACAAAAugA==
Date: Fri, 19 Jan 2024 09:35:22 +0000
Message-ID: <CY5PR11MB6211834CA364535838F7EC8095702@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
 <CY5PR11MB621172B0F827E4FD706646DB95702@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d4620fae-0316-4881-ac03-cb4d6f99b01b@intel.com>
In-Reply-To: <d4620fae-0316-4881-ac03-cb4d6f99b01b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CO1PR11MB4850:EE_
x-ms-office365-filtering-correlation-id: 997387c0-d1ff-4b2e-943c-08dc18d1f547
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9xb2qeasC1sjX1qaXFclhULPMoTOirQyXw5PWKO0RjMAwngWi4dMk6du9KNqNAV+jC6O9JajQEe1P+nVDufla//LEv9hWq2VbrEV//ZslxIGYEcRLTj7/URzd5XlK8CODiOaZL1c8uUn7Y6PSzz5J5ye788Hn6ico64iZ414BGdRN1VMufbSvcvm4f7uWJXQExQaCRDEi7bmnxo5bqNkAs9EPKXtJ9LLbGYxHJlbSRuuCDVmVJ4neFAKUO9yR76L45uJ0J4yabdkOJTHkYHhKovTeQr8fkeNZO+kEkmp6I7Ks10l49BAEU4knTrNHzsPBpY03od6+Tr0ipY2pdSWe9974FNaF8nyOqtNMcMDmDe9WsMMxsCLfS2nfpbrEmQxg5XrTS3PJVsfzcGVTqZdpkR894fH0/94m4ZeOHzktdm6rlj7wpj7pgG45k0JsaCRvpJ3YZrEUCbNGJjsqB38ueCqqZ2s8bWhbrDxh/LbUkdrTygfcvd1ijVEjRCxBGb+lKtJj1x9naxfFzwfXw2wVWRFmUlHLOWCO8+sqlHofTKTtOxV9q6WaT9sa4GqwtogTpJSsui7lP+L6y0V2ofoyp3DRVuAInpdTD1emo+Yqm8aMtOmk2dps80PX8Jto6tO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(122000001)(41300700001)(33656002)(86362001)(38100700002)(82960400001)(83380400001)(478600001)(6506007)(71200400001)(7696005)(8936002)(8676002)(4326008)(316002)(110136005)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(54906003)(5660300002)(26005)(2906002)(9686003)(53546011)(52536014)(107886003)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjZZVTNhUWF2UVJpK0laQStpRlBNRUw2aWgxNmI0WmdIdHA3eE8yUWN1U3BR?=
 =?utf-8?B?Q1lXMXBybVdBcVRmWFMyMm1nNEZrYW80YVFJUHpna2oyWVp6ZDh2dnE4eVN2?=
 =?utf-8?B?OXYzREQwLzdBSm5RZWEvS3ZwdGZoMWpkZ2ZlOFdmd0lPR3prMTJ0dUIraEY0?=
 =?utf-8?B?WVBLelVpSFh6OEJPQ2krMUZiOEZsWjl3NCtNWW5INXVrY1dmVmN2QzhNVnQz?=
 =?utf-8?B?WEN2c1B1RThSd2M2eXFSc1pSdEpnNFlmU0FDYktpQ0R1RG9XTzloT1VHeWpR?=
 =?utf-8?B?TVQ2bGVxVFoyZ1dxR2V1cnIzR1A5bGtKQlN6end6R2xvYzFNc09Eb3B5RXll?=
 =?utf-8?B?ejBZdmdEZjVKS0F1S1c0WmVEZjAzSTMrOXUwUVU1cWk4bE13VkpVOSs0a2dt?=
 =?utf-8?B?MVhoaWpRRGNhTVlOZzJIOGEvOFkxdzBVRVU5WnFwMXVyd2JQd3RaT2Jia3M4?=
 =?utf-8?B?U0t0YWVZOUhMOE1OYmp2RVdNVnpYMWx1UU5lYUd3QXpjQ3VIcWNuZEtMTmZW?=
 =?utf-8?B?RndEYlZvM0hLaGJyWDUrcStlSFVLMW5yaU84MXdRaThzdHFGVlV4LzNjMTJV?=
 =?utf-8?B?dkhKYW4xVG5QQjhkNVBsUklncEc5eitwa053UWpxL3h6bG5yTzRkcEVnOGxC?=
 =?utf-8?B?V2lGcEI4cGtpdjdvZCtQME5MN2Npem1acWl5NFhZTkh5d1pJZlpkZEZReXlU?=
 =?utf-8?B?b2MwUHRWQklhMFlrcUdLc2w1RmVub2FER3lBUFNXWWlKRWdUd1ZYbGhPV3Fm?=
 =?utf-8?B?RmtqcjN3aHdhZWNUcWZQUjY3dHBmRUZiT3BtRTlWTmdtMXkvZkdjNFAyZTJD?=
 =?utf-8?B?QjFrTmdWV0ZoREw4OHZtcW54NW83ZmZteFh0cXZHSWlXMTQvRW9sRnU2bTBQ?=
 =?utf-8?B?T3hPM3dsRzlwV3FNK1N3OWxJVVdOOWZnajFpRmlhWThGR09BOFJSUm1QNU5l?=
 =?utf-8?B?NlZ1UnB3dmtmcDBLTnJkSUN4RGxCRmdhbmtuYURnMnRYQ1lBMTlpME9Pa0Vh?=
 =?utf-8?B?dnlpN2tFQU9UN09PUWJ2Mk9CYkpteHN0Sm0rdTk4MHEyWUZVSnNNbFIyc21I?=
 =?utf-8?B?MlQzeWFGWjc5dSt3WkpJUEVDS1ZCVVdyWTJNcU5kNW1JVjRZRXYwU0tHUFB6?=
 =?utf-8?B?SnFjWkJwekpsdmUrM05CYm5TaXE4YVQ5RmM4TmRpbWVOQlJpS211Q0RBLzdC?=
 =?utf-8?B?V2NZbnNGQXZxemhXbUJQM1NkeWJyd1lBV1Z6bGhSaStXY29NWWFuRXg4WkJk?=
 =?utf-8?B?bEhjRTdWZm5iODMvc1RPT0tiNWRBWEpTeTllbGRiVjFDYm5BeHdkM04xZnRa?=
 =?utf-8?B?T3BTTkY4Z0tBanJpdXVSclhidmM2NjF6c1dFZElhemthUDFSZWJpd2orYXVM?=
 =?utf-8?B?QjR2aFVNYzJsQmVGSXYwMGZaT3ZzVG9BZ0VmOS8zSXFBZWxJM0NDOG02V1M2?=
 =?utf-8?B?Nm9CR2ZMc1J2SSs0anEzSzQ3WnR2K2g4RWljTEU1WUZzelZRdlVSWDNFMXp2?=
 =?utf-8?B?Z00rL0JvcU1CTTMzZ08zNzFZN1hUS1lrN25zRnRxQzVhN0ZKclVvbkRlWFZo?=
 =?utf-8?B?SDhabmpoMS9GZmYycXd5QkgzSTRoQklGQkh4SEVoRnBwTlViWENkU25LMmVt?=
 =?utf-8?B?SmllSEszTDZvbmwyWmJ3MXdyY0lEdzkrU0J1VmR6MVhUZTdIRzV5NmZLdnRy?=
 =?utf-8?B?NEpvbzZpSWt6eTRWRTRMZUhaTG1XUnNITEZhM29pOUJLU21yWm55L0laRnhP?=
 =?utf-8?B?NmExUnIzZi9GWndsUzVqRUJQelJjQnloaDREd0syMktEVDJGem15SEorQ3Jp?=
 =?utf-8?B?c2p2NFQ5MU1hdkhja2pqZjlDV0U1RlppZHl3WENSemhlV0VBdENDQ2FBQUl0?=
 =?utf-8?B?cUhweW5ObWFMWTdhNVdNeVVtYXQzKzdpR0IrT1g2elBseXRTaUJWWWlHcE9N?=
 =?utf-8?B?MExHRkJ0MDV1Zjh1d0ViRGU5TTBnZm0zSC9aajBPeFVQNUk1eXVrejk3Sk9Q?=
 =?utf-8?B?ZzhGOFVkR1VmUHFoWXNlVmw3RW91c0J5UkRYSDJWVmczaWorTHY4ZDdqUGFs?=
 =?utf-8?B?QjYzdVJNWGIvQUNQTytBTFpOcUVFdUt2RERmN3hxNzYyQ0c5Z2ZzU2RrYzVw?=
 =?utf-8?Q?Va4oGRoYbo29cmyCv4yTrKbte?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 997387c0-d1ff-4b2e-943c-08dc18d1f547
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 09:35:22.1592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VoLv1DRhkVC69NmsDe18M5WPzucMGsEpGxsSdr5izmzc31jVC9GP+YYRgwzgbyhXUVU3hLLjPjaPRIHzgqSHqht5Cm8hgtjW/I6nGtL7AmI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmlsYXdhciwgQmFkYWwg
PGJhZGFsLm5pbGF3YXJAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEphbnVhcnkgMTksIDIw
MjQgMzowMSBQTQ0KPiBUbzogR3VwdGEsIEFuc2h1bWFuIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5j
b20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBWaXZpLCBSb2Ry
aWdvIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRA0KPiA8bWF0dGhl
dy5kLnJvcGVyQGludGVsLmNvbT47IERpeGl0LCBBc2h1dG9zaCA8YXNodXRvc2guZGl4aXRAaW50
ZWwuY29tPjsNCj4gQmVsZ2F1bWthciwgVmluYXkgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGUvZGVidWdmczogRXhwb3NlIGRlYnVnZnMg
ZW50cnkgdG8gY2hlY2sgZ3VjIHBjDQo+IHN1cHBvcnQNCj4gDQo+IA0KPiANCj4gT24gMTktMDEt
MjAyNCAxNDo1OCwgR3VwdGEsIEFuc2h1bWFuIHdyb3RlOg0KPiA+DQo+ID4NCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogTmlsYXdhciwgQmFkYWwgPGJhZGFsLm5p
bGF3YXJAaW50ZWwuY29tPg0KPiA+PiBTZW50OiBGcmlkYXksIEphbnVhcnkgMTksIDIwMjQgMTo0
OSBQTQ0KPiA+PiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+IENjOiBH
dXB0YSwgQW5zaHVtYW4gPGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT47IFZpdmksIFJvZHJpZ28N
Cj4gPj4gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBSb3BlciwgTWF0dGhldyBEDQo+ID4+IDxt
YXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPjsgRGl4aXQsIEFzaHV0b3NoDQo+ID4+IDxhc2h1dG9z
aC5kaXhpdEBpbnRlbC5jb20+OyBCZWxnYXVta2FyLCBWaW5heQ0KPiA+PiA8dmluYXkuYmVsZ2F1
bWthckBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlL2RlYnVnZnM6IEV4
cG9zZSBkZWJ1Z2ZzIGVudHJ5IHRvIGNoZWNrIGd1YyBwYw0KPiA+PiBzdXBwb3J0DQo+ID4+DQo+
ID4+IEV4cG9zZSBkZWJ1Z2ZzIGVudHJ5IHRvIGNoZWNrIGlmIHBsYXRmb3JtIHN1cHBvcnQgR3VD
IFBDIChTTFBDKSBmZWF0dXJlLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBCYWRhbCBOaWxh
d2FyIDxiYWRhbC5uaWxhd2FyQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RlYnVnZnMuYyB8IDggKysrKysrKysNCj4gPj4gICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGVidWdmcy5jDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMu
YyBpbmRleCBjNTZmZDdkNTlmMDUuLjJmNDc0YmYwZTdjNw0KPiA+PiAxMDA2NDQNCj4gPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RlYnVnZnMuYw0KPiA+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGVidWdmcy5jDQo+ID4+IEBAIC0zMCw2ICszMCwxMyBAQCBzdGF0aWMgc3Ry
dWN0IHhlX2RldmljZSAqbm9kZV90b194ZShzdHJ1Y3QNCj4gPj4gZHJtX2luZm9fbm9kZSAqbm9k
ZSkNCj4gPj4gICAJcmV0dXJuIHRvX3hlX2RldmljZShub2RlLT5taW5vci0+ZGV2KTsgIH0NCj4g
Pj4NCj4gPj4gK3N0YXRpYyBpbnQgaXNfZ3VjcGNfc3VwcG9ydGVkKHN0cnVjdCBzZXFfZmlsZSAq
bSwgdm9pZCAqZGF0YSkgew0KPiA+PiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0gbm9kZV90b194
ZShtLT5wcml2YXRlKTsNCj4gPj4gKw0KPiA+PiArCXJldHVybiAoaW50KSF4ZS0+aW5mby5za2lw
X2d1Y19wYzsNCj4gPj4gK30NCj4gPj4gKw0KPiA+PiAgIHN0YXRpYyBpbnQgaW5mbyhzdHJ1Y3Qg
c2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpICB7DQo+ID4+ICAgCXN0cnVjdCB4ZV9kZXZpY2UgKnhl
ID0gbm9kZV90b194ZShtLT5wcml2YXRlKTsgQEAgLTY3LDYgKzc0LDcgQEANCj4gPj4gc3RhdGlj
IGludCBpbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkNCj4gPj4NCj4gPj4gICBz
dGF0aWMgY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QgZGVidWdmc19saXN0W10gPSB7DQo+ID4+
ICAgCXsiaW5mbyIsIGluZm8sIDB9LA0KPiA+PiArCXsiaXNfZ3VjcGNfc3VwcG9ydGVkIiwgaXNf
Z3VjcGNfc3VwcG9ydGVkLCAwfSwNCj4gPiBBYm92ZSBkZWJ1Z2ZzIGlzIHBlciBkZXZpY2UuDQo+
ID4gV2UgbmVlZCB0aGlzIGRlYnVnZnMgZm9yIGVhY2ggZ3QuDQo+IFRoZSBmaWVsZCBza2lwX2d1
Y19wYyBpcyBkZXZpY2Ugc3BlY2lmaWMgc28ga2VwdCBkZWJ1Z2ZzIGRldmljZSBzcGVjaWZpYy4N
ClRoYXQgbWFrZSBzZW5zZSBidXQgdGhlbiBpdCBpcyBiZXR0ZXIgdG8gaGF2ZSBhIHByaW50IGlu
IGV4aXN0aW5nIGluZm8gZGVidWdmcyANCmFzIHRoaXMgaXMgZmlsZWQgaW4geGUtPmluZm8gPw0K
RnJvbSBpZ3Qgd2UgY2FuIGdyZXAgdGhlIHNraXBfZ3VjX3BjIGVpdGhlciAiWWVzIiBvciAiTm8i
Lg0KVGhhbmtzLA0KQW5zaHVtYW4uDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEJhZGFsDQo+ID4gVGhh
bmtzLA0KPiA+IEFuc2h1bWFuLg0KPiA+PiAgIH07DQo+ID4+DQo+ID4+ICAgc3RhdGljIGludCBm
b3JjZXdha2Vfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZSkNCj4g
Pj4gLS0NCj4gPj4gMi4yNS4xDQo+ID4NCg==
