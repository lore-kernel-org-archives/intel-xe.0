Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C68C5AD5A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 04:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7F410EE30;
	Wed, 12 Aug 2026 04:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XR7G95io";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE11910E3C3;
 Wed, 12 Aug 2026 04:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786508657; x=1818044657;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XL3VV2/Rt7HsGtC9Msda6jQDCSMz5+H+BbpJCs/tvwE=;
 b=XR7G95ioHoqk4J1EpjRSCZ4t9StReUu89hyKF1PFyRKjkUu1+qT+HEoa
 vBMB6VwKx0lQEWfK/VxRxWB6qQ9z8CVlErwg8WGz2o53UCtrwD+eT13KH
 3YnCKOrY1EC1S8vYfxvVdD0kAVBMmPlwp6RFFDhfP0rtP4tvOs0Q9S8BV
 q6aSxP//SccyB7Tw3UuXPEmgTw7jb2FyUtTBFcJcSzYaOQYBNbebIkLOP
 trV5vyRMR+/Xdqrci++4JmOgKWXICbGQx4IJeX5opzPIhzoB9aWVuUwe5
 89mxC2TMagKHAgdz+pcU6b6U2YL8YN9FHH8AnFkupYo4JJuCrxVhzWSZz g==;
X-CSE-ConnectionGUID: n0Ld9QA/QhWdMVUb4huweQ==
X-CSE-MsgGUID: gCqqUWW0SqK1y4V1JuApng==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="98410835"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="98410835"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 21:24:16 -0700
X-CSE-ConnectionGUID: vSAICSwdRaaHnmKC3w6a3Q==
X-CSE-MsgGUID: bjs42zb2ReKB5GsyEkIdTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="265515741"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 21:24:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 21:24:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 21:24:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 21:24:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPjZWjYug6MdV50YuWl6L93b46o7UqbMyHDkrS0vn+Zo0kyvm0iXNgPv7hZ4MoWnrVpHpiQg4Xw4mPvGDm4FFkPCrswbIsuRIciEruAUgVfFt/bs+L/c58WB75ZdhRHTCeoiKAcMY24vOTXJEHQ+D4d8Eb418yjKiqX509ucQvXst2t1fJ1m9sNjZbyCEo/q9aITDafPtVf8ztCVGEPuK3ZbWnJnj9mFmplnCqyKlyu9fqV5CGBdlh1L3Q2XBuOYoL2AYrxDCGW27xKXtTSRmS99rBytcvjYijo5ks7FbWdMEz3+VRzc/AiUxLmtDFrYasC6Hy9PbPSbccLcSH87wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XL3VV2/Rt7HsGtC9Msda6jQDCSMz5+H+BbpJCs/tvwE=;
 b=O0TMWE1WaTsmrgPhpr6p0jKKE8TJ/g612REBwNYz6gF8LQ+Qc0aZSeCq8JZKgPYg4wGRf6f/jCROE5S+zTqnUip5KB3kAMgY2lJ8nGzDC8O8BpZ9JkMLqpBHFsakPCCz48KO17352HsauTUR/jrkhmC0NdVtsy6XqBt95JN9VLb+sTVk1MV4go8EZj3qkwtZCjW1DLxhBrKi+G1sNtm3iRi8WoRH6/oNVtVI9oNIl5TBqH1HPioUL+qDdCdnUBz4OCM549K3Ve/+2KAlMr6A7CnbIzE2DH1964PVKGdAvzJG8rC3gEmt0B3ZPH9Wr8Igc7b4p7Z1j4rHFXRnSIe/lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by SJ1PR11MB6082.namprd11.prod.outlook.com
 (2603:10b6:a03:48b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 04:24:13 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::5be7:2ceb:99ef:6334%8]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 04:24:13 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DDI
 clock frequency
Thread-Topic: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DDI
 clock frequency
Thread-Index: AQHdKbsZQLw9kt38Q0m7t95/zWj2WraZx7yAgAAJYmA=
Date: Wed, 12 Aug 2026 04:24:13 +0000
Message-ID: <DS4PPFE901A304FE6C52090B8408482686DE3DC2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
 <20260811175844.2613721-3-suraj.kandpal@intel.com>
 <d760d5c7-6e2e-45c3-b38e-108571d94cf1@intel.com>
In-Reply-To: <d760d5c7-6e2e-45c3-b38e-108571d94cf1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|SJ1PR11MB6082:EE_
x-ms-office365-filtering-correlation-id: e43db35c-b534-4699-533c-08def8299057
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 0ht9ZZbfUtoQnhHiFbyT5r4A4wph3puoyJRzkKX8ehI7n2gD+ZASPgQRIKGeeioM8dHnI59M8iD1h5sJJ0bWuFkNmtLNkz79pgupxe8llNkRuRWRbgy68aLtFRTFn0UKR3hQD3HTY6aVu3eINIeGv4fg/45sOq2RSwuWXgdS3CwfA0ZGi8lRw3vb6Z6SZ96fp1smWJHXo5SFPLLdcwVWy5cBhwpnC/E2T/RqFdIE2709DJVfc/crH1X+bRSfX1nuzBt1uobdVGmcw2kTakk8dhIJ7wHj6bsJ/CENjZC64nAH6hv5TQexg0Ol7zlfT9sszn1to7zYBwxqe1BaFrZWzczWlPt7mYUBpeBe0waNvw3g9Yb68ohxYHSbwVo+XuW0v3YoYDU74pavccZc5+JaTHH6Yl/qy6wovG75Lrj5NoevEZuwYTGWCrEopHMoo4Fgwk1Hlsoqu8ajll4IDzl+jGUA0MHPB8ZvOvPCJTn54IhdE8x0UsyUzR+BY83B6EWXLoZvpf6CMMLkp4DO6MGzZCY3GERQS0EkE+DZL9DOYHGS2EKG7VgpYuBJmd/v2unJvmO2Afucf5vyQL0twI3Y576ZRX3IGDd+x7wufVwUBJD8s+bXdQutoCWE1Zl1UErP1ZXlZkKwUAFMXdFFkdmOo5Ys6XjDgvUkBudWQygzl2zmg4t/hgNZQjmRgt4rswNwcxIWVzCoK9fTlVKh0oRa2X1wJHYuJC8UtoitJDSQBqI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RU1FZSs3VlVSQis4K09OYmFaM04rcmlya3h0akovMkp4bUFZeFBFcnhHb0RG?=
 =?utf-8?B?YTlhVXh1WjhmTDFzd094RzYvWEY0RjkyWmRKTktucllVT0Z1N1I2Qm9veGhv?=
 =?utf-8?B?cTVSa3Q5REx3SW5Eb2pJSGExeTJqQXZ4NDAvWVJHT0JaUWFscERrRWpLRFla?=
 =?utf-8?B?b1FjTnN1TUZJaGZXbkpERVhteWhFTUpqNE4xUkY4eTMyb3MwdEtFTEtKdFJy?=
 =?utf-8?B?RG93cmx5ZUxCMzJhOGg3SC91UHRweDB5emt6bE15N3pCT2R0bkl4eEZHZ1JN?=
 =?utf-8?B?TXBveWVIRHZyK29waWUzaDlDSVIwT2NsR0JPZE55Z0dHTUUwczRxRWJJRDVB?=
 =?utf-8?B?RHdDM0FNMWtHbVVJQTRTQlg0WGJ2R2dHTU5lcVJMeXRqckphWWdzZ21UalJI?=
 =?utf-8?B?ajlQWk9uUlVTS1I3VFBTOXJGYVR1TGlqUGYrVUFOS1hEUXFoSm1yT1FuRmh6?=
 =?utf-8?B?dUluRHp4K0Izb0tmK2dCaDFuOTBKR0hjc2tMSUhEYWlEZDFXbEsvcmNVQXlQ?=
 =?utf-8?B?VUQva3JabGVTNVBIdDFnSTVCWm1ZUTFJcUpqd0NWM2hJK2RWQ0hneDVqNm1P?=
 =?utf-8?B?OEZYbUhEeGI5bGJzd0RGTi9NcFRBL0tkdWVnRWtDVjJpWXNqdTZhU1Q3Mnp0?=
 =?utf-8?B?WnNZUm9ua2x1TnIzNlBiTERqTzZwbVpUcHJDckh3Z3F6VDRBeUIvUkg4cCt6?=
 =?utf-8?B?SkEyRGtob01GTU5RREF4SXRvOWFFNGRiaXRPaXFrVzZBd3l0ei8yTVVIdjdS?=
 =?utf-8?B?NWFhZC92R3VmRGZlRUhDTXBaWUpYZ01jSGR4UmlqVWVZSEtoZDgzbFZ6V3g3?=
 =?utf-8?B?VlNVVTNMRnBrMVpTV3JyNS9Pb2hVZ1B6Zkw5ZkhwZ1U0OUxTZFd1NTNwK2pX?=
 =?utf-8?B?UmVzV3ZON3czMVBoako4MFhzNUNnR05HTldKYWRQQlpkeUUxdmNLTXpCNnlr?=
 =?utf-8?B?SjROSWxrVGRJNnZkOW0xcVhVYzlRL3BSRndVTVdqOFFENHRQdWFIZnBhYmpk?=
 =?utf-8?B?QjhXSWpwOHBzeUV0WFNxeFlVT2NRVkpseG9RVlZsTnM3YldSU3l4akN6RGwx?=
 =?utf-8?B?VjU3bVpseGoyRmxKZUFKTmFzSEV6NUZyVHA3UzBrV0twWlBJUndIajc2dm9O?=
 =?utf-8?B?UWFoUUVuVHZnWkRrODVlRC9WRUliYmE5bHIxamFVWURFUFlZdUowQmxDVFBx?=
 =?utf-8?B?UGVYTFRQUUp0NzJZbklxeW9mTjZJUldRbTJoYVRTaFBYdEsyQmM2eEdDdlIz?=
 =?utf-8?B?Wk1McGJrZy9RNk9NQjE5cE5SeUJQeTRicFp1K01MdG5acHBMZ3lKb3VXMGY2?=
 =?utf-8?B?cGVrcExSa1d2djAxbC92b2F0T2REcWw0bHdmdGF0aW55Wkx6eXlIZXBMdk9Q?=
 =?utf-8?B?aUNJL1lVY3ZGV0I5OGtxTjVwcmtlWnVmNFVWSGk3Tndmb0Z1T2pOTHgvU2VG?=
 =?utf-8?B?K3B2ZGFNNGVuWlBtWDdKVDNKV1RhMVF5cWZoeWc0TzRLWk1NbFRPVmZkaWNT?=
 =?utf-8?B?SnBlcjhsQTBrK1V3OWllbUZZSVVWTktMSEEvQ2ZEcU1UTU5OOFhFL0VnMys5?=
 =?utf-8?B?MlJNQ1c3M2ZZeDlvZ01zWVcvRkxKcW1hWUUreTdZOTJlY1Jyc3hXamxXTW5t?=
 =?utf-8?B?NSt2RFpMclNPREdONlNiOFNRT1ZLNFZwRy9JeXp4NUN0RFJwYnZWNDVaR1Ro?=
 =?utf-8?B?MTg0Z3h0a1dCdlhESEJNSE5kN3ljTDhuQmxpNjdqSlQrVy9tdEMvdmlYb1Qr?=
 =?utf-8?B?Sk5XLzd6L2cyS25ObU14aHIzNDJYL2xZdEduNEV1NGlOdTJEUEpUNEkzMTV4?=
 =?utf-8?B?eUJzNUNPVUtONllTNWNRL2o4M2RsYXZSVk5Ja3lINUtHQmtOK2xNc2U3SEVl?=
 =?utf-8?B?N25nd0xUT0xMdk1KaWlYSkV3c215aThSclU2cFdUQk9TYUhsUklRN3hlbXZm?=
 =?utf-8?B?SzNrNk9xTnBpNjJLRENYc0Z0UzBseFBHZnp4Q29KTWltYWkyRlFReERWc096?=
 =?utf-8?B?VmFjZmkwMHBjbStnWDhpdi9LWFdyMTZXb1FtK0xNVWlQMEJlZ2lGZHRWT2h1?=
 =?utf-8?B?cXI2Q0FXNjluTGpJdCt1bmk2RTBNbngrN0NqREY5SzRseWorMWZoTDJqd3du?=
 =?utf-8?B?M0UweXczUEE4TEpZZktzK21pY2hGT2JsK3llYU9oK0xkQkw2VjRQUmcxK1c0?=
 =?utf-8?B?eWEvK2hUcit5OTk3Qmpvc1dQZVZ5b1gvVWNSS21JVEI3N21jNW5SY1ZvQkk3?=
 =?utf-8?B?emRzL2VCNTNXRXdzYkw2UGJMMENMQWV3NEZrcW1WOGFkQldjMENqaXBTQXpu?=
 =?utf-8?B?SVQxVWszcTZxWk1MNEcvZFJBenZDVFZiUENRK1Z0MUUxOEE4VHFYQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ZGlXZB3ehdbR5uHgkhEfg7dis938kxIMaldfUMDm+LNy+dyNjk10fx/3CslPP4defl1BABFrn4pG4oQQ29XN2kMhKmz7LDF4oxKDIkDo3EwU5Y+C0O1Db6DHnMn2wQA6IX0VUVoGQgojyOyAu49a5RZ/nguwxFw8y3uYyMC7joo6GmU0kPNQTElkBFwfRKcQx84CkdRiheQw5fB7EM3d4Qob9EA7NacLZilsnPt+d2K/J4Gdd6kg/2PtdZkBLN1GbTbHPkglo3XoZ3eFRfPRQvxCIUk7klFOd0p7ANlFrco0GbRcjNt424WMZtV2vAQm0V5EycM8qTxBLmhHY5ZgZA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43db35c-b534-4699-533c-08def8299057
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 04:24:13.2017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 29nkrdVGLuD7rBdLpL57fYB8XRPHNI/5MtsSsFza4Xl39AExULNd8jyeXgCh15V4iGYL1rPMUWGuhf9aCWKqbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6082
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvM10gZHJtL2k5MTUvY3gwOiBwcm9ncmFtIERESV9D
TEtfVkFMRlJFUSB3aXRoIERESQ0KPiBjbG9jayBmcmVxdWVuY3kNCj4gDQo+IA0KPiBPbiA4LzEx
LzIwMjYgMTE6MjggUE0sIFN1cmFqIEthbmRwYWwgd3JvdGU6DQo+ID4gRERJX0NMS19WQUxGUkVR
IGlzIHByb2dyYW1tZWQgd2l0aCB0aGUgcG9ydCBjbG9jaywgd2hpY2ggZm9yIERQIGlzIHRoZQ0K
PiA+IHN5bWJvbCBjbG9jayBjb21wdXRlZCBhc3N1bWluZyA4Yi8xMGIgZW5jb2RpbmcgKGxpbmtf
cmF0ZSAvIDEwKS4gRm9yDQo+ID4gRFAgMTI4Yi8xMzJiIChVSEJSKSByYXRlcyBhbmQgZm9yIEhE
TUkgRlJMIHRoZSBwb3J0IGNsb2NrIG5lZWRzIHRvIGJlDQo+ID4gbW9kZmllZC4NCj4gPiBPbiBz
aWxpY29uIERESV9DTEtfVkFMRlJFUSBpcyBhIHNjcmF0Y2ggcmVnaXN0ZXIgd2l0aCBubyBmdW5j
dGlvbmFsDQo+ID4gaW1wYWN0LCBzbyB0aGUgYnVnIGlzIG5vdCBvYnNlcnZlZC4NCj4gPiBVc2Ug
aW50ZWxfZGRpX2xpbmtfc3ltYm9sX2Nsb2NrKCkgdG8gd3JpdGUgdGhlIGNvcnJlY3QgRERJIGNs
b2NrIGluDQo+ID4ga0h6Lg0KPiANCj4gUGVyaGFwcyBjYW4gYmUgcmUtcGhyYXNlZCBhcyA6DQo+
IA0KPiBERElfQ0xLX1ZBTEZSRVEgZG9lcyBub3QgY29uZmlndXJlIGhhcmR3YXJlLCBpdCBvbmx5
IHJlY29yZHMgdGhlIGZyZXF1ZW5jeQ0KPiBzb2Z0d2FyZSBpbnRlbmRzIHRvIHNldCwgc28gdGhl
cmUgaXMgbm8gZnVuY3Rpb25hbCBpbXBhY3QuDQo+IA0KPiBQYXRjaCBMR1RNLg0KPiANCj4gUmV2
aWV3ZWQtYnk6IEFua2l0IE5hdXRpeWFsIDxhbmtpdC5rLm5hdXRpeWFsQGludGVsLmNvbT4NCg0K
VGhhbmtzIGZvciB0aGUgcmV2aWV3DQoNClB1c2hlZCB0byBkaW4gd2l0aCBhYm92ZSBtZW50aW9u
ZWQgY2hhbmdlcyBpbiBjb21taXQgbWVzc2FnZQ0KDQpSZWdhcmRzLA0KU3VyYWogS2FuZHBhbA0K
DQo+IA0KPiANCj4gPg0KPiA+IEZpeGVzOiA1MTM5MGNjMGUwMGEgKCJkcm0vaTkxNS9tdGw6IEFk
ZCBTdXBwb3J0IGZvciBDMTAgUEhZIG1lc3NhZ2UNCj4gPiBidXMgYW5kIHBsbCBwcm9ncmFtbWlu
ZyIpDQo+ID4gRml4ZXM6IDczZmMzYWJjYjc5NyAoImRybS9pOTE1L210bDogRW5hYmxpbmcvZGlz
YWJsaW5nIHNlcXVlbmNlDQo+ID4gVGh1bmRlcmJvbHQgcGxsIikNCj4gPiBTaWduZWQtb2ZmLWJ5
OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3gwX3BoeS5jIHwgNSArKystLQ0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N4
MF9waHkuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jeDBfcGh5
LmMNCj4gPiBpbmRleCA0NTIwNjI0MTdjZTkuLmRiZWJkNzIxMDg0OCAxMDA2NDQNCj4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2N4MF9waHkuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3gwX3BoeS5jDQo+ID4gQEAgLTMy
MzMsNyArMzIzMyw4IEBAIHN0YXRpYyB2b2lkIGludGVsX2N4MHBsbF9lbmFibGUoc3RydWN0IGlu
dGVsX2VuY29kZXINCj4gKmVuY29kZXIsDQo+ID4gICAJICogOC4gUHJvZ3JhbSBERElfQ0xLX1ZB
TEZSRVEgdG8gbWF0Y2ggaW50ZW5kZWQgRERJDQo+ID4gICAJICogY2xvY2sgZnJlcXVlbmN5Lg0K
PiA+ICAgCSAqLw0KPiA+IC0JaW50ZWxfZGVfd3JpdGUoZGlzcGxheSwgRERJX0NMS19WQUxGUkVR
KGVuY29kZXItPnBvcnQpLCBwb3J0X2Nsb2NrKTsNCj4gPiArCWludGVsX2RlX3dyaXRlKGRpc3Bs
YXksIERESV9DTEtfVkFMRlJFUShlbmNvZGVyLT5wb3J0KSwNCj4gPiArCQkgICAgICAgaW50ZWxf
ZGRpX2xpbmtfc3ltYm9sX2Nsb2NrKGVuY29kZXIsIHBvcnRfY2xvY2spKTsNCj4gPg0KPiA+ICAg
CS8qDQo+ID4gICAJICogOS4gU2V0IFBPUlRfQ0xPQ0tfQ1RMIHJlZ2lzdGVyIFBDTEsgUExMIFJl
cXVlc3QgQEAgLTM0MDYsNw0KPiA+ICszNDA3LDcgQEAgdm9pZCBpbnRlbF9tdGxfdGJ0X3BsbF9l
bmFibGVfY2xvY2soc3RydWN0IGludGVsX2VuY29kZXINCj4gKmVuY29kZXIsIGludCBwb3J0X2Ns
b2MNCj4gPiAgIAkgKiBjbG9jayBmcmVxdWVuY3kuDQo+ID4gICAJICovDQo+ID4gICAJaW50ZWxf
ZGVfd3JpdGUoZGlzcGxheSwgRERJX0NMS19WQUxGUkVRKGVuY29kZXItPnBvcnQpLA0KPiA+IC0J
CSAgICAgICBwb3J0X2Nsb2NrKTsNCj4gPiArCQkgICAgICAgaW50ZWxfZGRpX2xpbmtfc3ltYm9s
X2Nsb2NrKGVuY29kZXIsIHBvcnRfY2xvY2spKTsNCj4gPiAgIH0NCj4gPg0KPiA+ICAgdm9pZCBp
bnRlbF9tdGxfcGxsX2VuYWJsZShzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwNCg==
