Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B98C48BC4
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 00:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676EC10E5BE;
	Wed, 21 Feb 2024 00:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4fHyjrl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6FB10E5BE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 00:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708476217; x=1740012217;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s1FBR0Se8keHJlYuUDuaoyorSnhfQTektmBu4acBOpY=;
 b=H4fHyjrlgEbbHb3541OPsTN+pv8jytsopfVlVlT9vpCyXywWThbj6Ciw
 UpsjTAoxMT2go4eU+9BMfcGBAhYfU/ZC8YKvEsamu+6llfASNjT2t/n7y
 UrArmfFzAHGa6FJ62J5KDonHpbkyKfF84x0Z16ydBX6BZEeeaAVQVLPhO
 OEG5xI2/fzCBMxmkxDcv7/Ne+4VX9wqjpE9dJBQC4tHfq8LWH+opbW2Q5
 +OETV1WT7W7W1B5LJcQOxk7eKBG8DInnAgWxK1EiNXX/yXbRoermUaZlH
 Z44JLPDqXAZBMkdGJrx/HTPoA15irsro0prfKRFz+DMg+uzt+umPY1atF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="14022518"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="14022518"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 16:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4910243"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 16:43:36 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 16:43:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 16:43:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 16:43:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 16:43:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIVE4EIEm7UTQkQV4Fdi5r/3EimhsZRXul7I0WJzE6EW00KzAwKY3eRUHjzSC9Fxgs7Zh3XH80hdwiS3VozoXhUo9fk6yJVFMTw427AsYIVBijqT842cPvvy94zRhoc7LySoUVIs9FrO4u8EXEHGpVo9VrLeBc2o6cyAIilHVmG7fvnuSOuLQHspeDlIP/Uz9xxlG8MhVA3L1TrjPLAvicAEzZALhpRQmomUU+SxJaLkytAlSNiI4OOhU7Vy6l+NEmCaoGlhIYWXmsCQcwW5HSRw8f3Sn8ZyYhe5T4vvbdpbxNa9SYuHNeU8a8/SJi76GuJftf58MLM+gwNNkRxZ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1FBR0Se8keHJlYuUDuaoyorSnhfQTektmBu4acBOpY=;
 b=gW9UKBD4nlJ0THbUyaEi0pD1Z+vdfpXM39PvK4IM7S6jvln0J8V/wtgxnXCqmtFWmWdIa00kPf+VRKIl5e1g6tpOWb436uigQw4b8oNle/Y9jwuJ9wh6CcPzPEfNCNrYATCvr1+jPSvPzAGhs5NU9/1FI6Krc8bobOuoE2Z/OOovdaUMXqGx/l5RLv0biLdarXvpl9AEo5E2a+W+pn3tTMF1i3tIvX1O1/yZhu741BsuM/j7rgBCgQuJCduFx2l9rG06BhBE+tajkjzaDh/jeVvkW98eQ3oPMCnOL5/E7Lsxp0ivt375uhauMDsnqra2fvBxaR3a6ermYfqnqKQLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CO6PR11MB5649.namprd11.prod.outlook.com (2603:10b6:5:35b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 00:43:30 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::561a:33d3:dd4c:14b2]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::561a:33d3:dd4c:14b2%5]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 00:43:30 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Skip TLB invalidation time out log if ct is
 disabled
Thread-Topic: [PATCH] drm/xe: Skip TLB invalidation time out log if ct is
 disabled
Thread-Index: AQHaY6KVZlfrvFDMWke6KD3MrVHfIrETVTSAgAAyuQCAAAfhAIAAZnJQ
Date: Wed, 21 Feb 2024 00:43:30 +0000
Message-ID: <DM4PR11MB5456E4546F4A76A7AD6EAF2CEA572@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20240220021356.3514454-1-shuicheng.lin@intel.com>
 <ZdS/t2KKI79Kyy7C@DUT025-TGLU.fm.intel.com>
 <996d9944-e355-407c-bcbc-ae3deabca6b4@intel.com>
 <ZdTw4K4WdLFUmAlJ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZdTw4K4WdLFUmAlJ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CO6PR11MB5649:EE_
x-ms-office365-filtering-correlation-id: 6b5d0d3d-655f-4ec1-6d80-08dc32761fef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GJj9+C4w4l8Rzwikt9V2m/JTJVIBYjJFtrGcwVWDFPSigl2z6K/S8TcIBedvZczL+6XMOrmia6btAMRCJVhwna1wDkyv+zTwwSHZfw/QpiNDJ0EfAlDOzSro7iWWVFWaFEmuqGQEgtd3Aj5PPlvNGTjmLqztwtGEwn1ew4KDj+O8mCt64F9zZQpaLmUxKApJa+WgJKXs5mvWst6ObONbNRKZ2exPunT1vgbrVedQXcpaJCfAnWcxc9BRjHyp8Cv2fCknKaTagUOvGDyb1uLs1PeAm1zuV0EY93/zZF2pxlVyD63TenQryYtQ7QXi0mL7VRv2Fa4o4381WceRxwbJDXg8t4vqrKmOfhPUa/qDBqqc6v5Dx4rXHKduOEFJOzdVg9NMQBS1oFfVE//WSuybLWTVoZr8IsM58LDIfQoMG1gpnIETzLCXkDk5+6e2pVKmqWOTwimVg/2rjnbt9ga+AewljYLGAG+ZKB4dioijd6u5JEiJwP1QzlfcO5J5CulcX0dI482vr3MhAFN3q24WQErn4i0JhKuZEkb6qckABwVApw3/cny26KgMpPtRUvuSY02pGvKAAuxYDM89TKVbA0B7dwMpfdgmaQjLt3qj1/8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVpzcHZ2VkdTc3oyL2tjZGdLa0F6QWpzRHk0L2FqRnQvMEhVTktkOHczeGNw?=
 =?utf-8?B?Q1UybGVURUVPeWNaa1JOb2ZjZnBxNnpCejl3UVY0OVlSTnlnT0tVaWNZcXBQ?=
 =?utf-8?B?WFFEL1B6d2doQUovT3RTLy9USHJ1bXJvWkV3QURFcVF4aWZHS0xoSkRZMzJn?=
 =?utf-8?B?Q0RLV0N0bWVxSG5TUWFBTStjVW0wZ2ZKa0dQN2pXVXBsZFE0b1hrdzVxNjRy?=
 =?utf-8?B?MmFTL1pTSHhOSTk5MVRIQldZN0pZVnh4bXBiUjFIWHJBdWthUUcrWnh2azlM?=
 =?utf-8?B?U29rZGw0Ri9ac01FcW5yaHBTQXF4QU54NFg5cS9TYjJFOEhEYnV3QnJNb1hW?=
 =?utf-8?B?TXVTdTBwcWt0NzRQR2hDU2xhVnJSL2NNbEd1Tlh1ejN1aWdVUEMySUJ5alpw?=
 =?utf-8?B?Q2lucUx3eTFSWUwrRUVZUU5UdnY4S0hlVkg0T3I1WktUUUJHNlV4VGFOV21n?=
 =?utf-8?B?VldVSU5zN1UrTWwrQWFOVFk1REsyNDRENWMveDZGckFJOGxJMTlNbU1OSzYv?=
 =?utf-8?B?MXJmK21jemo4ZjJtOE1JL2NYYzFJdlVmZitNdUFJZzNPMCtqbEQxVGduTGF6?=
 =?utf-8?B?N0l2TTEvMldEZnpYM3V2RTdUOTgrcUIzMnFqTUsvVlo4N3dGRWlRSG9BRUJK?=
 =?utf-8?B?NFFrd09SRTBsaFZucytsN3M3MU5CaCsvaUVIVVpnZDlZYnFCMDZWUHdiNWZw?=
 =?utf-8?B?UnJQWlFMMUpEUkFaSXNMb0NYdWdTWnFYV3lieStwRG15b1I0Tkh1c29QVEs3?=
 =?utf-8?B?RkV4VXRwZFVFVGdwT3pyb29RM1FUbEpIRGhOT3o2M1pvUUo0MGZMQU5IaEtO?=
 =?utf-8?B?VTh1STdmVGdxWTd3Y1Y2WFRiRXAyZmc2SjNFeFhHeWhmUHl6dFpmL3dtckpo?=
 =?utf-8?B?eG02VVpLNmlqQWU0dFJlNGR1RktManNORWlmazZ3ZVQrWUNQTy9tMWxndTlv?=
 =?utf-8?B?aURZbkRYd08zT3JXNGsyY0pndjdaQTJwWURDQ0hxMTVZS3NQZ1I5TUV4RWJu?=
 =?utf-8?B?RUs0ejVrQzF5a29yd2gxa1BOVjVuaWRLWTVZc2J6aFpBUTdrYXA1YitnRUor?=
 =?utf-8?B?RzBVb1lUS2diWVk1N2d6UmRaVDh0VFJPRld5T2FVbFhnSTRTY1hIcXZYWVov?=
 =?utf-8?B?RHNMbVF1cExuVjdOT1VVQU1rak1HcjFXVmxOakk0L0ovWnE3T0VRK3IrMEY2?=
 =?utf-8?B?bDFFZTBpb25YK2ZtWjVzODVsUHgwRXlabUNraWxtcm9jVVpBWkdZU0g2UHhk?=
 =?utf-8?B?UmJHckp4aE1PNjBMLzYrMzd6RU5xaFhXVXUxSVlxU1p4MVA3WmRrajJ2OGxX?=
 =?utf-8?B?bHRtV1A0RlBhdzhjb3haMGZWYUN5cGY5Umd3NytQSUFGMC8yN3FXKzZMR091?=
 =?utf-8?B?MDJNZU05QXNWTlNFV1BnbW1GSEZaUGg4N2hsaDdtSnRYV0xVYzlSOUNoNi9E?=
 =?utf-8?B?SDJpUmtrUUVHNUZoL2pVVWtMMWFRNW9qZmtjSHZITnhHZEdPOXJHNXlIUGtL?=
 =?utf-8?B?dXY5VG1yUzlRSTFUcGNEVUtUSmJnb1M3b1VBL0tYR3VVL3pQcTgvTnNrd1Uz?=
 =?utf-8?B?eUtPWTNMQXVKcE9WU1pMOEswSklMcDJMMG1GQ1NaVk14eS84M0pNMWJzalNP?=
 =?utf-8?B?WHkrUkhBa0owZkswYXRScHBuMk4yaGprcWVtSExrVkxyQ3FjUWtwbXBrN2Z6?=
 =?utf-8?B?UWNaUERuazdkQnk2bTZtSHFXbTNCcXhiakh2cWZMVGxmWnl5djZwUlp2OTJR?=
 =?utf-8?B?dm5aNFJYYk5nYWtSN2loL0ZoeEsyckxPMlhwQkVvSDR3YXdWNEd1anRiaVRn?=
 =?utf-8?B?dUlnSWhlQ0VpUWF3a2UzcmMreUR1d3FTeklDQjhwSlRxRW1vMWo4bHd0K1N4?=
 =?utf-8?B?VGx2cVhWT0xhY1c5bVE1WUgzUEdqK0FPWXcxWGszMnBUVldIQ2g2NEthRGJw?=
 =?utf-8?B?TmxzVnd0M0gzS3dJTVVRU1cva09hVEtNS2xmUW5kZ0RYalltZXkwSXpYa2Vr?=
 =?utf-8?B?OWNhY2x2QzNGT3JZRDcyckFGZUdHa2Q2aGJNaTR3TGhMQkpVZCt2RTl5Q0dY?=
 =?utf-8?B?ZjB0V2N0S1IwNHplSS9GQ2hvWmEvL285S2ZnQW1laElpRm96dTJEUzVtd0lX?=
 =?utf-8?Q?MZzptvaJL/hBFnAni2Y98tHEl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5d0d3d-655f-4ec1-6d80-08dc32761fef
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 00:43:30.2692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2sgG4DN7ms6kaM317h21ouomVxF9RrbKJTtRt2sYh02tBxiDda7s+RWJhvivn5GEUmVXj0mFhAvO1cDCwatYyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5649
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

VGhhbmtzIGFsbCBmb3IgdGhlIHJldmlldy4gV2lsbCBjaGVjayBpdCBhZ2FpbiBhZnRlciB0aGUg
MiBzZXJpZXMgYXJlIG1lcmdlZC4NCg0KQmVzdCBSZWdhcmRzDQpTaHVpY2hlbmcNCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCcm9zdCwgTWF0dGhldyA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjEsIDIwMjQgMjoz
NSBBTQ0KPiBUbzogQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gQ2M6
IExpbiwgU2h1aWNoZW5nIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT47IGludGVsLXhlQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGU6IFNraXAgVExC
IGludmFsaWRhdGlvbiB0aW1lIG91dCBsb2cgaWYgY3QgaXMgZGlzYWJsZWQNCj4gDQo+IE9uIFR1
ZSwgRmViIDIwLCAyMDI0IGF0IDA2OjA3OjAwUE0gKzAwMDAsIE1hdHRoZXcgQXVsZCB3cm90ZToN
Cj4gPiBPbiAyMC8wMi8yMDI0IDE1OjA1LCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24g
VHVlLCBGZWIgMjAsIDIwMjQgYXQgMDI6MTM6NTZBTSArMDAwMCwgU2h1aWNoZW5nIExpbiB3cm90
ZToNCj4gPiA+ID4gU3VzcGVuZCBtYXkgY2F1c2UgdGhlIFRMQiBpbnZhbGlkYXRpb24gdGltZSBv
dXQgYXMgYmVsb3cgbG9nLg0KPiA+ID4gPiBTa2lwIHRoZSBsb2cgcHJpbnQgaWYgY3QgaXMgZGlz
YWJsZWQgdG8gbWFrZSBsb2cgY2xlYW4uDQo+ID4gPiA+ICINCj4gPiA+ID4gWyAgMjI4LjgxMjI2
Nl0geGVfZ3RfdGxiX2ludmFsaWRhdGlvbl93YWl0IGVudGVyIFsgIDIyOC44MTIzMTFdDQo+ID4g
PiA+IHhlX2d0X3N1c3BlbmQgZW50ZXIgWyAgMjI4LjgxMjc4Ml0geGUgMDAwMDowMzowMC4wOiBb
ZHJtXSBHVDA6DQo+ID4gPiA+IHN1c3BlbmRlZCBbICAyMjguODEyNzg2XSB4ZV9ndF9zdXNwZW5k
IGVudGVyIFsgIDIyOC44MTM1MDhdIHhlDQo+ID4gPiA+IDAwMDA6MDM6MDAuMDogW2RybV0gR1Qx
OiBzdXNwZW5kZWQg4oCmIFsgIDIyOS4wNjcwMDddIHhlDQo+ID4gPiA+IDAwMDA6MDM6MDAuMDog
W2RybV0gKkVSUk9SKiBUSUxFMCBbR1RUXSBHVDA6IFRMQiBpbnZhbGlkYXRpb24NCj4gPiA+ID4g
dGltZSdkIG91dCwgc2Vxbm89MzIxLCByZWN2PTMxOSBbICAyMjkuMDY3MDk5XSB4ZSAwMDAwOjAz
OjAwLjA6DQo+ID4gPiA+IFtkcm1dICpFUlJPUiogR1QwOiBDVCBkaXNhYmxlZCAiDQo+ID4gPiA+
DQo+ID4gPg0KPiA+ID4gVGhpcyBkb2Vzbid0IGxvb2sgcmlnaHQgZm9yIGEgZmV3IHJlYXNvbnMu
DQo+ID4gPiAtIFRoZSB0aW1lb3V0IHN0aWxsIGNhbiByYWNlIHN1c3BlbmQgYW5kIHRoZW4gYSBy
ZXN1bWUNCj4gPiA+IC0gVGhlIHhlX2d1Y19jdF9lbmFibGVkIGNoZWNrIGFsc28gc3VwcmVzc2Vz
IHRoZSAtRVRJTUUgcmV0dXJuDQo+ID4gPiAtIEkgdGhpbmsgdGhpcyBtZXNzYWdlIGl0IGFjdHVh
bGx5IHZhbGlkDQo+ID4gPg0KPiA+ID4gV2hhdCBzaG91bGQgcHJvYmFibHkgYmUgZG9uZSBpcyBz
aWduYWwgYWxsIHBlbmRpbmcgVExCIGludmFsaWRhdGlvbnMNCj4gPiA+IG9uIHN1c3BlbmQuIEkg
dGhpbmsgd2UgYXJlIGRvaW5nIGEgYml0IG9mIHJld29yayBpbiBbMV0gaW4gdGhpcyBhcmVhIHRv
by4NCj4gPiA+IEknZCBzYXkgbGV0J3MgZ2V0IFsxXSB0byBsYW5kIGFuZCBpZiB0aGlzIGlzIHN0
aWxsIGFuIGlzc3VlIGZpeHVwDQo+ID4gPiB0aGUgc3VzcGVuZCBwYXRoIHRvIHNpZ25hbCBhbGwg
VExCIGludmFsaWRhdGlvbiB3YWl0ZXJzLiBTaWduYWxpbmcNCj4gPiA+IGFsbCB3YWl0ZXJzIG9u
IHN1c3BlbmQgc2hvdWQgYXZvaWQgaGF2aW5nIHRoaXMgbWVzc2FnZSBiZSBwcmludGVkLg0KPiA+
DQo+ID4gSSB0aGluayBbMV0gd2lsbCBvbmx5IGhlbHAgd2l0aCBycG0sIGFsc28gY3VycmVudGx5
IGFsbCBjYWxsZXJzIG9mDQo+ID4geGVfZ3RfdGxiX2ludmFsaWRhdGlvbl93YWl0KCkgd2lsbCBh
bHdheXMgaGF2ZSBhbiBycG0gcmVmIGFueXdheSwgQUZBSUNULg0KPiA+IFRoZXJlIGlzIHRoZSBm
b3JjZWQgc3VzcGVuZCBwYXRoIHdoaWNoIGlzIHF1aXRlIGEgZGlmZmVyZW50IGJlYXN0DQo+ID4g
dGhvdWdoLCBzbyBsaWtlbHkgaXQgaXMgdGhlcmUgd2hlcmUgd2UgbmVlZCB0byBiZSBtb3JlIHNv
bGlkPw0KPiA+DQo+IA0KPiBZZXMgaXQgbGlrZWx5IG5vdCB0aGUgcnBtIHBhdGggaGVyZSBidXQg
c3RpbGwgdGhpbmsgaXQgd29ydGggZ2V0dGluZyBbMV0gaW4gYW5kDQo+IHBlcmhhcHMgYSB2ZXJz
aW9uIFsyXSBpbiBmaXJzdCB0aG91Z2guDQo+IA0KPiBNYXR0DQo+IA0KPiBbMV0gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMjkyMTcvDQo+IFsyXSBodHRwczovL3Bh
dGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyMjc3Mi8NCj4gDQo+ID4gPg0KPiA+ID4g
TWF0dA0KPiA+ID4NCj4gPiA+IFsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcv
c2VyaWVzLzEyOTIxNy8NCj4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBM
aW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jIHwgMTcgKysrKysrKysrKysr
LS0tLS0NCj4gPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gPiA+IGluZGV4IDdiM2E1NDc0OGI0OS4uOGFh
YzEyZWZlYTg0IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
dGxiX2ludmFsaWRhdGlvbi5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF90bGJfaW52YWxpZGF0aW9uLmMNCj4gPiA+ID4gQEAgLTMzMCwxMSArMzMwLDE4IEBAIGludCB4
ZV9ndF90bGJfaW52YWxpZGF0aW9uX3dhaXQoc3RydWN0IHhlX2d0DQo+ICpndCwgaW50IHNlcW5v
KQ0KPiA+ID4gPiAgIAlpZiAoIXJldCkgew0KPiA+ID4gPiAgIAkJc3RydWN0IGRybV9wcmludGVy
IHAgPSB4ZV9ndF9lcnJfcHJpbnRlcihndCk7DQo+ID4gPiA+IC0JCXhlX3RpbGVfcmVwb3J0X2Ry
aXZlcl9lcnJvcihndF90b190aWxlKGd0KSwNCj4gWEVfVElMRV9EUlZfRVJSX0dUVCwNCj4gPiA+
ID4gLQkJCQkJICAgICJHVCV1OiBUTEIgaW52YWxpZGF0aW9uIHRpbWUnZCBvdXQsDQo+IHNlcW5v
PSVkLCByZWN2PSVkIiwNCj4gPiA+ID4gLQkJCQkJICAgIGd0LT5pbmZvLmlkLCBzZXFubywgZ3Qt
DQo+ID50bGJfaW52YWxpZGF0aW9uLnNlcW5vX3JlY3YpOw0KPiA+ID4gPiAtCQl4ZV9ndWNfY3Rf
cHJpbnQoJmd1Yy0+Y3QsICZwLCB0cnVlKTsNCj4gPiA+ID4gLQkJcmV0dXJuIC1FVElNRTsNCj4g
PiA+ID4gKwkJLyoNCj4gPiA+ID4gKwkJICogZ3VjIGN0IG1heSBiZSBkaXNhYmxlZCBkdXJpbmcg
dGhlIHdhaXRpbmcgcGVyaW9kIGFuZCBsZWFkIHRvDQo+IHRoZSB0aW1lb3V0Lg0KPiA+ID4gPiAr
CQkgKiBTdWNoIGFzIHBvd2VyIHN1c3BlbmQganVzdCBhZnRlciB0aGlzIHRsYiBpbnZhbGlkYXRp
b24gd2FpdC4NCj4gPiA+ID4gKwkJICogU2tpcCB0aGUgZXJyb3IgbG9nIHByaW50IGlmIGN0IGlz
IGRpc2FibGVkLg0KPiA+ID4gPiArCQkgKi8NCj4gPiA+ID4gKwkJaWYgKHhlX2d1Y19jdF9lbmFi
bGVkKCZndWMtPmN0KSkgew0KPiA+ID4gPiArCQkJeGVfdGlsZV9yZXBvcnRfZHJpdmVyX2Vycm9y
KGd0X3RvX3RpbGUoZ3QpLA0KPiBYRV9USUxFX0RSVl9FUlJfR1RULA0KPiA+ID4gPiArCQkJCQkJ
ICAgICJHVCV1OiBUTEIgaW52YWxpZGF0aW9uDQo+IHRpbWUnZCBvdXQsIHNlcW5vPSVkLCByZWN2
PSVkIiwNCj4gPiA+ID4gKwkJCQkJCSAgICBndC0+aW5mby5pZCwgc2Vxbm8sIGd0LQ0KPiA+dGxi
X2ludmFsaWRhdGlvbi5zZXFub19yZWN2KTsNCj4gPiA+ID4gKwkJCXhlX2d1Y19jdF9wcmludCgm
Z3VjLT5jdCwgJnAsIHRydWUpOw0KPiA+ID4gPiArCQkJcmV0dXJuIC1FVElNRTsNCj4gPiA+ID4g
KwkJfQ0KPiA+ID4gPiAgIAl9DQo+ID4gPiA+ICAgCXJldHVybiAwOw0KPiA+ID4gPiAtLQ0KPiA+
ID4gPiAyLjI1LjENCj4gPiA+ID4NCg==
