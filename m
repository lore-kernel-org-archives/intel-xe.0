Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C1CC0018A
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 19:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD7F10E3EC;
	Mon,  6 Nov 2023 19:36:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336D610E3EC
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 19:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699299386; x=1730835386;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RDOEMnQs2EYL+r70veEtuRwEWB2qz3VdG2f/GXRyRQI=;
 b=GR1G3r0MYobso56DmV12HPSHAjjoTQNiT6prznBYX9CuczNW9vol4w70
 rdYgp4StrJ5OfkYyrGxNuMSDTJtatGhmcdvIlHK//hvzlVdc9bURCXMwl
 jGat/L433GUV5U3et1x4lQxRWvg/5R6uZLozpY+DMKcODnU21+SLG3jGz
 VuXoGOZUKbL/UVhSAHsXV3457kvTRl2Kj1xumgLEiq8U5yAew/o5bLjsx
 pRkXR5qUDaLiFxF9CABG/MCQhO8m1QcIf+UKjNkm7FRlQ4dAubWEm5Bzq
 g8NWLsa0gPYy2NoX4IRHablMplbt+92rzrRfiBJMZ1KyjHHU4AeCP9RsI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="379746141"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="379746141"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 11:36:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="10560873"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2023 11:36:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 6 Nov 2023 11:36:24 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 6 Nov 2023 11:36:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 6 Nov 2023 11:36:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMjFSAN0vPcu4FeTFxDM2FUc5QiORRzIm0h2Y5E2AuA9Jz3klMW1+L1UTV3hJR9dZXuES5KGOiMnV/tK4T+/W/gm3yhnSdwcBQ0k5PJU6nB3m3UsuqQoJKTLPqaB36/2fWddeBzfthk8bhQXLDoCK2a5MOQRHwnD8haad0Ep3dFVpipaBxVyLmc/Ow1dKkEiPKCoCz7ziGn+dTysNhslh7QZG8pqvbpTcc4ri0ovxXZ6TMuD8RskuOigurJdhyUebymQQE2DRJedvJ9lZO9LBAKgxsUauN5NkfehhO8YN/bkVBd4fW84smbjPRiGSpPfCknjtt4e4eu8FRbxC/IxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDOEMnQs2EYL+r70veEtuRwEWB2qz3VdG2f/GXRyRQI=;
 b=npYEnDuIAjVXWqgIO2jYYBh3mavWHZ2DBTYEQ5gTxazcTxgRHzC4VCtwS4UF5CxVSmKS1ptuRZgmihiOlMjT/0ezwZWjMbHco3LSYwZg3M3ZOB5t76jrIgQ6ltVNAR2Wpqd43lB/mNITYH1c2VOOaxHXcaQjchYzNjV1yRJ2TdYadTrLbbNF32SSfKrCIFRkRUJR1rwcKso0JWKrxrOhABQw/y7rEpCat/XfSwVxxNrSsHUOM+DsukX8kjTJiyv74br+L4Sui0ITPqKIgiXjBDEK4PVVu2gVrop6Mn3x6uqFX+dloZhYln6YEU9zwTz1pI8gR4VzLM+IsOATqCtsew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5782.namprd11.prod.outlook.com (2603:10b6:510:147::11)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 19:36:23 +0000
Received: from PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37]) by PH0PR11MB5782.namprd11.prod.outlook.com
 ([fe80::dfa4:95a8:ac5:bc37%4]) with mapi id 15.20.6954.028; Mon, 6 Nov 2023
 19:36:22 +0000
From: "Mishra, Pallavi" <pallavi.mishra@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
Thread-Index: AQHaDppBx+gpPkJdIE6uyU2+b8lfP7BtgA+AgAAzdNA=
Date: Mon, 6 Nov 2023 19:36:22 +0000
Message-ID: <PH0PR11MB5782370A6F21C4C44FFA9C7A82AAA@PH0PR11MB5782.namprd11.prod.outlook.com>
References: <20231103211924.426715-1-pallavi.mishra@intel.com>
 <7702e3a9dd33089049a2fa2253525df54db557a4.camel@intel.com>
In-Reply-To: <7702e3a9dd33089049a2fa2253525df54db557a4.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5782:EE_|SA3PR11MB7610:EE_
x-ms-office365-filtering-correlation-id: 63476e29-2e53-4aac-d509-08dbdeffa885
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XDMQ3RhIJ+tqV1fK6DIHsLffcsvBoJBauRvwNV5anl1j5oazEkyo/py15mdmm8F5ndC0DDvaBvpiXV5nWr4V6HVgoWZi/kM37C2o8VLA1C/5NsRgo/F3ddhaG2+6xFJNn3L9F6Cw1LgKqWfhoyC5GxH/W1YTpGkgBRzchN5xgUc3q6CQDr7V8Qfcj1VE3RQfemw/Lwvwxg8rFgDPWIxPlEO3+UZ0vcgVXP7D95XYzQLUNcWtxrp0YktjBcLa0Qfz/Zx1cXVAd2mT+d3WMz2LKPsERjSusXcTEaA3ABMJtZwfvZ2qCCbeYwdBMWLr8rt/mgUHUbX8Ho28ITt/Qs63+KBNDOEaZLhvIjO9D0wuyby5dWxYcSERjKgsKuyBpk62eL3DN9XrHQbSIoj/jxBnzAAGJJxypNSNjuO9/CW2mg1LhTOZvoQ+0z5gIJQDRTI1v1rh5oACJXXqmlWLhj0wfH60pOFSQRNZOF9A6K12oFL0copj3hCEUOiostFcnCLKR23v+77x8jYhFT0n81RLYiJDgNgGtn0y/k0GfzQtZvvydzj9RwWzlZWhbrioMdz90KOQT76yGw6f+cMSzeY856Shbj9+0nr5negTmJeudcCMK10KAvaSFpnOecYm6vd+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5782.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(8936002)(8676002)(52536014)(5660300002)(478600001)(2906002)(41300700001)(55016003)(316002)(110136005)(66946007)(66476007)(66556008)(66446008)(64756008)(76116006)(86362001)(26005)(38070700009)(71200400001)(6506007)(7696005)(53546011)(9686003)(122000001)(82960400001)(83380400001)(33656002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q05PWWxWUDlKTTEyOWpXQjVId1FIc2Y4TFU3UDF6cGZXR3RRc2V6eDNrRTlh?=
 =?utf-8?B?Wm15MjN6Nit3R0hnZFd6MGVvUEdiOHNTSFBBV0lqQU5nb1BhUWxPUy9vUHdW?=
 =?utf-8?B?dFppRWNCd1dySGtDNHJ4RlJRazFXUG8wVDVqTjlXbURRaUV4M2NYQVN3a2ZO?=
 =?utf-8?B?akdreTlFTUcwbXR2VWNvdm1qR0FGbWlBa0NUNHcwY1BIY25aMUpHYkVIZTgw?=
 =?utf-8?B?NUJPckRRbEhwMVBsMnhHKzRSdVBiR3dFL0pXc2lVTGJGYlNUU2VkOEhUUHps?=
 =?utf-8?B?MTZhTE05ZTBUN3ZobkRLdnFLMy9IRGVHMlN5S1JoYmtZL212SDhTb1Nsb0N3?=
 =?utf-8?B?YzJlN3lNWmxsNExxcjZiY01pTS9meEx0WDN3eGFhQlBkTytRdDRTQ0RBVHZh?=
 =?utf-8?B?d0RuVHJobUZtUWJ1NDU4UGVwSEtMd25iZGUxcExaVWpod1h4ZXliUG11SGFv?=
 =?utf-8?B?c1pYNCt1U0YycGlDVUVLdjN0a0dMNDIxMkhOeFNsTkU4UXZXTmdOc010dDBh?=
 =?utf-8?B?WE4zZUE5aHhtMmhjK0pjcXdJbE1HaDRraW9hWjRkK3lEV1Nyd2Q4bTV1ZmhG?=
 =?utf-8?B?NjB1Rzh2d1NCU3B5cXVxN1plblFTTTRsZ2ZjN2ZoOUN3TnJBN2FCOU4rZE80?=
 =?utf-8?B?N3BMQ2VqWVZzY3hPcEJHb201RjRCWm1wZXB4UlZKUU5HWW40T2VDRklLczJx?=
 =?utf-8?B?YkhYRms0RXY0RkV3N2ZPckZNMEh2VkNwN1gvUFdOVVVXdW43Rk5YOWVHN05s?=
 =?utf-8?B?VFNxY0xnQmszK3EvVzRkY2hsOHJyQmMwTCtDR1V3VnFOdUgrMVZUN29PWXV2?=
 =?utf-8?B?TzdJZWpKRlRKbFBuQVJIa0Y4MG1GL1B4c1g2LzBOYVFPUWdiWitRbzAvZ1hK?=
 =?utf-8?B?aEE1UGplVnd5SnRIWWpQTHRoWUh6a3pFb3BMSkhDTnd2Ri9RdFZ4eVBxc1Rp?=
 =?utf-8?B?RjNzNWZuMTRnTmZBazIyOHZpQkdYOXRlaGhaTkhGSGtkb0NCdGwxaFZDaXdW?=
 =?utf-8?B?TDVHUkUrUWdQMmRnS1JlTjNDNzdjblZmZVN3dk5UWk83WXBFVTRWZkVFY0lv?=
 =?utf-8?B?MGFtc281cEc3SDRNRlJvNFNWREhTNHo1QUV6ZFJ2WldVdFkyK3l3YkZPejdR?=
 =?utf-8?B?MVh3dHRqeW9oSTZ2Z3Bma0x0cDBaS09TeXFqcXFLU0hKZzhvUDNNN1ZWNkY1?=
 =?utf-8?B?WCtOakZHRzRnZnN0dUNyUmRiOWRVRStUOEtzTWRPODJCaGhMc2JVVVNZY0FH?=
 =?utf-8?B?NzNPMEtzY0RNOUIxUHcwb1dSNkpKcW94ZHRtbzVpNVBXbmNJYW1yNzVNQW00?=
 =?utf-8?B?cXU1UXo0Qm1mSmRCRTgrcGJra1NiUyszeGFYQlYvU3k0ZW9yYVNEbUNGRFJ0?=
 =?utf-8?B?ZEx3OUJUbVUzREJvZkpKaXZCMXlxZG45M284MDFHNUZmYytOMnM0ZUVveWI1?=
 =?utf-8?B?U3lxQ2FoUVRDdmM1Wm9GY2dWT2xFRjB6R1Y3cUQyVUs5MnN4cysyUDdwZzdY?=
 =?utf-8?B?Z0NkNzlRQmducHVrNUlseEl5WUVuTG1CMjc4Z3FTMHpqNFBMQ3E3V0RMZEt1?=
 =?utf-8?B?OXBkTkFUWlpaUFErQ1BqQ2tZbW8wREdDTDRRdWZzMFU2bVVOaUxjMndaOGNC?=
 =?utf-8?B?amJjS1luMjl6NmVjSE5COUVoV2lwZlUwQlZxZEJ6YS9KK0tRSE1tK056bTQz?=
 =?utf-8?B?K0N3NXdSV2V3Rk45RkRtU2oxNHN3S2Nack9KOGNxQUlDTUJPaFJDQ3pmTjZa?=
 =?utf-8?B?VjBXTldXeUJNWmltbzFGYThwVVMvWllJNmw2Rk94NFVqSFRHS2IraUEwOVJZ?=
 =?utf-8?B?SG5rMTNEWFVvUFduUGg0SnhyMHVxcTNLSFV3a3hzcmZFSkczUmdFMDJZazc0?=
 =?utf-8?B?WjVQRkpNc1VwU3RrTURkTGJiSWNQU0NWd1RBSXh3ZGZDSHlaR0lVaS9YQW9Q?=
 =?utf-8?B?THNpOGFsK3dydWc2ZEVKVEhFOE9hQ29xL0dYeGRXZWw4bCtTWHZKa1NGR1Q2?=
 =?utf-8?B?cVE0MVpqK0tYUmpTa0lmR05yOXFjUGtSaDU4a3plOXBIdHd0N0JycTR5Wnlh?=
 =?utf-8?B?L3hMN0JGVm9uK2lSbkxVTjVLaU94akk2anJMWENzZFQwZGpWTnZ6RTMwMGd6?=
 =?utf-8?Q?mMR7+qDPJD86Bj6qn7zvgTe5Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5782.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63476e29-2e53-4aac-d509-08dbdeffa885
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 19:36:22.8178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qT/OUu+OHkPHxhVackrdc2/q/C8rwMZcQW40u3PeomLpIMd6+Yb6TYao88N3+7+Q4wZ9XzEvO5AW87x5ERD0j7RaItlxTobOf45tcMEDFVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Prevent null ptr dereference
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3VtbWVycywgU3R1YXJ0
IDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgNiwg
MjAyMyA4OjMxIEFNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IE1pc2hy
YSwgUGFsbGF2aSA8cGFsbGF2aS5taXNocmFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW0lu
dGVsLXhlXSBbUEFUQ0hdIGRybS94ZTogUHJldmVudCBudWxsIHB0ciBkZXJlZmVyZW5jZQ0KPiAN
Cj4gT24gU2F0LCAyMDIzLTExLTA0IGF0IDAyOjQ5ICswNTMwLCBQYWxsYXZpIE1pc2hyYSB3cm90
ZToNCj4gPiBJbiBzY2VuYXJpb3Mgd2hlcmUgdm0gaXMgbm90IGluaXRpYWxpemVkLCB1c2UgeGVf
bWlncmF0ZSB0byBnZXQgdGhlDQo+ID4gYWRkcmVzcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFBhbGxhdmkgTWlzaHJhIDxwYWxsYXZpLm1pc2hyYUBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jIHwgNSArKysrLQ0KPiA+IMKgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9taWdyYXRlLmMgaW5kZXggZTZhMzFmOTBlYmRiLi5mNzllYzhlNGFlNGUNCj4g
PiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiA+IEBAIC0xMjk2LDcgKzEy
OTYsMTAgQEAgeGVfbWlncmF0ZV91cGRhdGVfcGd0YWJsZXMoc3RydWN0IHhlX21pZ3JhdGUNCj4g
PiAqbSwNCj4gPg0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHhlX3RpbGVfYXNzZXJ0KHRpbGUsIHB0X2JvLT5zaXplID09IFNaXzRLKTsNCj4gPg0K
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRkciA9
IHZtLT5wdF9vcHMtPnB0ZV9lbmNvZGVfYm8ocHRfYm8sIDAsDQo+ID4gcGF0X2luZGV4LCAwKTsN
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICh2
bSkNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBhZGRyID0gdm0tPnB0X29wcy0NCj4gPiA+cHRlX2VuY29kZV9ibyhwdF9i
bywgMCwgcGF0X2luZGV4LCAwKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGVsc2UNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhZGRyID0gbS0+cS0+dm0tPnB0X29wcy0N
Cj4gPiA+cHRlX2VuY29kZV9ibyhwdF9ibywgMCwgcGF0X2luZGV4LCAwKTsNCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBiYi0+Y3NbYmItPmxlbisr
XSA9IGxvd2VyXzMyX2JpdHMoYWRkcik7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYmItPmNzW2JiLT5sZW4rK10gPSB1cHBlcl8zMl9iaXRzKGFk
ZHIpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiANCj4gSSBhbHNv
IHNlZSB0aGlzIGluIHRoZSByb3V0aW5lIGluIHF1ZXN0aW9uOg0KPiAgICAgICAgIGlmIChmaXJz
dF9tdW5tYXBfcmViaW5kKSB7DQo+ICAgICAgICAgICAgICAgICBlcnIgPSBqb2JfYWRkX2RlcHMo
am9iLCAmdm0tPnJlc3YsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRE1B
X1JFU1ZfVVNBR0VfQk9PS0tFRVApOw0KPiAgICAgICAgICAgICAgICAgaWYgKGVycikNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfam9iOw0KPiAgICAgICAgIH0NCj4gDQo+IHNv
IGxvb2tzIGxpa2Ugd2UgaGF2ZSBhIHBvdGVudGlhbCBmb3IgdHdvIE5QRHMgaGVyZS4NCj4gDQo+
IEFsc28gaW4geGVfbWlncmF0ZV91cGRhdGVfcGd0YWJsZXNfY3B1Og0KPiAgICAgICAgIGlmICh3
YWl0X3ZtICYmICFkbWFfcmVzdl90ZXN0X3NpZ25hbGVkKCZ2bS0+cmVzdiwNCj4gDQo+IERNQV9S
RVNWX1VTQUdFX0JPT0tLRUVQKSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1F
VElNRSk7DQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nLiBMZXQgbWUgZml4IHRoZXNlIHR3byBhcyB3
ZWxsIGFuZCByZXNlbmQuDQo+IA0KPiBUaGFua3MsDQo+IFN0dWFydA0KDQo=
