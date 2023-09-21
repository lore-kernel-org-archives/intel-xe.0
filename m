Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D32E7D0AB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 21:05:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FA510E608;
	Thu, 21 Sep 2023 21:05:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0139410E608
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 21:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695330328; x=1726866328;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XA3X19YVwViQ2Jm3fav1R55R0JGl3khXjhT1NcTOvoM=;
 b=So3SBIZ8Q5/duZq7mhOO4T06NjdJp1TwBqNNEzr0GOLHg+7cAgC5/9MY
 J/m41RXYVgeIx5MqPsikEzZlRQo0FppOD8diP3K61wDUyg/FIjjEfuRBs
 gt84DpxdRoCnDEh0fq9IMvC6VPsqKy7MUivGqkk7/bXxAyr19LX1oeg8W
 CiNORvk8sxpWezGpdGN5siM57DZ+GbGpFICM1KRWpcp8+lIv9WGa9Mx0E
 0aHEHiEg52htc7GFx5v643blb9JzSAEUqQyhb0QT3QjrI5TIFZsmNIAko
 E/s2RxaWsXNuNXgY8LRby7jte8E9J/rZdDuLs+Tc2YDViCmq5/DU6cXmq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="365725325"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="365725325"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 14:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="776582617"
X-IronPort-AV: E=Sophos;i="6.03,166,1694761200"; d="scan'208";a="776582617"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 14:05:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 14:05:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 14:05:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 14:05:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4bSY8eKdRWmTlMZjDnuluaQSwYci+xfylDSRPaj/zVDSs/sa+sD+WcinhUheY7b9+/f6YD1J0IzC0TwykjMHlteTVesomAwxG5R2K91ygd9xlKYF3AqyTdocZblbgjvkmH9YKawQ4yT82w53z5UrRk6GLRo0tCUW3/P3o0Kc6KJR/GZUGJ3qbvtzxS/U+88lCLX7hyGESsDCz0PkiaRDmHWRBiscsuDtnG0WCSX2EWBrsnXie8dD0MKEGaI+7U/mFSpuwaKv23JVtweNctsxKGKIB54m0/3Sgbk3SilOPvh+NTgLLrf9nGWjctyPgMerQIV1cQpyYpiqv4d23bsjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA3X19YVwViQ2Jm3fav1R55R0JGl3khXjhT1NcTOvoM=;
 b=NWHR9yxilVZigjWq53GtO79YepPAqz+OovYJARjZxldMd6Wttd+MBTQIIxie1iTiVaB07A4isUtA4IQDokrpJgRzWW4kzqus/Lqw9tgEbuM0lH4ygCdn6ICSvwuYJWMVqgzeoXgmApKeyDmYZBLTsuokh9oc9rZzgXYa5YyNRtLNWYeTDnisFtUllvNdgofxmZT4yeTRUGOZJcM0rJwhZVnAmIhShch7LHsfGomXM7FpdTqAy6kZ928q8W3ay1VR65VLe6BOb61FM4eO9HUDm7b48ccy+hyd266HbeAXhCLxPaG0Ed/4P4ZhE1Pl3bpBQH93r3E7IfG43wtT1NUPNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MN0PR11MB5964.namprd11.prod.outlook.com (2603:10b6:208:373::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Thu, 21 Sep
 2023 21:04:59 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 21:04:58 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference Clock
 updates
Thread-Index: AQHZ6/kgX36nKQVj+0qKNbSy1REPwrAlbqGAgABTiICAAARwAA==
Date: Thu, 21 Sep 2023 21:04:58 +0000
Message-ID: <cf6996b8db07d548b44a5ead9a19fb8c059d7303.camel@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
 <20230920192940.135004-20-rodrigo.vivi@intel.com>
 <6e8dc2efb800a305bb651f576d0ef22c5aea1cf0.camel@intel.com>
 <ZQysPzeenUYVVIDr@intel.com>
In-Reply-To: <ZQysPzeenUYVVIDr@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MN0PR11MB5964:EE_
x-ms-office365-filtering-correlation-id: 3558f7f8-2228-4e9d-118d-08dbbae66a27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VQbO2AdQ1jAB3tHVHj7WxEELGtJ1uZ1Dn0cAKlnDZK9JW27azpW3m1Pw33wa51+bUxN13lYJA77OYqchFt4WOlTZWrI8mZwwaZcXWvi3N3B/Ome5N+FdRfI/kcG4x/fQiIAldw0XZmsMF9CXsOoGKgpMH5jKYGsurPpdnejPvm3u40GBiF8rUKV03pin7qMlAtGE30oUWTD7ZV546QdNzlBNQOimjOHghSI+MXaEIPJVq7P8KywxXsI5gpQ5NudDmrKFJfjO4PDwgk3tUNitONa1J9EccUQndOEQ9M3nEIDbsOOwrf3eH0dPhnpSbWQneTiF7snl60NKFUbImtwAYDzW4bE3AGkQKHLAQLfXqWrFqujkiilQMGjx/YfVlWRGfpeeImY+PixpauikUb1hda4MhzjTgQO7U7cEPqwRLOiAjTHntsoJ/WaiQ0/tK1hw2DLepUdcEUZzLY9nNan9rUG3Fr3VDiLh76LxqAEjNJa7cj3P3AapWzdtz6c20/6y0GfJkFuPDUh9cFxy5vdOAtxXqM2g4YJBumK4fx2cojrvcDcKed2bwh00TePGzzFcIGQrGN+uql6mL/UAG3ZgmbY35SC33gRwImznnmr6eBQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(186009)(451199024)(1800799009)(83380400001)(6486002)(8676002)(6506007)(36756003)(82960400001)(122000001)(38070700005)(86362001)(38100700002)(26005)(64756008)(2906002)(2616005)(966005)(6512007)(478600001)(5660300002)(8936002)(110136005)(91956017)(41300700001)(4326008)(54906003)(66556008)(66946007)(107886003)(66446008)(71200400001)(66476007)(6636002)(316002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWhLamJHcHN1QzlBenA5ejZpcFNwR0VrTXpWbi85Y3NtRlBuZWpCTHZxZVoz?=
 =?utf-8?B?dzdiMll3VjdjM21EdmZjd2Z3eHRHM1NiZ2pVNnhCWGt0WXpzeElNSXBXaSs3?=
 =?utf-8?B?QktKMUM2dFIzK0dvcjBIV0NkaUxtdjhLSU9mZjZ3WTZyOTQwVWVoZm5nNEJy?=
 =?utf-8?B?YkdQK3B6dnhhcm1iNUd6OGFqVkV2RTZlN3hBbWVBeDlwWWthN3JTaFg5VUFk?=
 =?utf-8?B?emcybVpNYnB6SHJYemRvdER6dUhnYTExeFVpUmh4R3dZOVBYZ0FFYXpyVjZE?=
 =?utf-8?B?bUwrNWFDL3c1Q0Q5QkZ2QmdPKzdCMk5pWG1OOEJrQmljalRJRzRxUHZmZWtD?=
 =?utf-8?B?SmZiKzI3Q21XZ1FFNlZXRzBaVyt3d2F4dXJxUWJteGUwS3BibkZWR1JTQTd3?=
 =?utf-8?B?Y3NqUWhINXQvUFBwSWFRY2Fra0RxamhRWjdpNFFRNjh4MGVaMDJFR0xhbUsx?=
 =?utf-8?B?RTlDWUFtT3l2K1FUUGZhdzV2WmpLUWJSdzM3SzFCM1RsNUdKd2N1RG4yL25n?=
 =?utf-8?B?dkJTQ1lsZ0VKUXdFMVNiWGNMSHlGVFVOUFQxMXZuQmZPMDNVOERveWVqMDlE?=
 =?utf-8?B?WDhXNzUxaTBCTDFvVnUxazVkYVEyYXMzYkhoZFIyWU1hRVlWeC8xMUhDajl3?=
 =?utf-8?B?ZzMxcjBoencxMVFjdXdvbG56WklzM2pIdVVKS3AydlhEakNjOGE0dEFSNU9S?=
 =?utf-8?B?eXlWdUlTUE4vSVQyaGE5eUllcHVMcFRmNDBseXppTUk5MmVRZHM0R0RJbWxN?=
 =?utf-8?B?b1VJSmYwK045SUdjanF6NmhNUlhlQ1Y3U082VFFFUko1eXJ3Q29BK2MzaEZt?=
 =?utf-8?B?MHRUeHpwcmh2UWtzQU51OFd2QjU1b2dHTmYvSFdLZjloWi92MFN2Q1dSTUFP?=
 =?utf-8?B?b1g4R0hIVUJvQ2YzblhXU2lUd0Y5MW10cUt6WmtleXl1ajREQnNGMVdGTllh?=
 =?utf-8?B?N2ExM1puWWQzRlhNeXRvNDUyak5wM053bmY3dCs0cWVxMDhTREN2U25pcDln?=
 =?utf-8?B?MDNsYnpSclFBM3RabXBwVVFzTld4aXpHbHJqbWJMNVlGZlF6NzM0RkVuTys3?=
 =?utf-8?B?a2JiOHlWVDd5WUtiTFJLQlNWc21DbVpPTkVIZUswRk1rdWY1L0hSNTFIOTdk?=
 =?utf-8?B?OUI4MjY3bldQWmxXM2FCZ0xHT3UzQi9VZEd3a0UyZFB0L2JHV2o5QmpKaWFo?=
 =?utf-8?B?ZlJqdDlNcUQ1ejAxRUhneDB3TDJQTEdvNDhRMHNYVDQvaUNURjQ4QTBzMFdk?=
 =?utf-8?B?OUdCWDc1VG1QR01zWTA0b2czOCtaUWlmT1pUNGc0WTdvSXYrYmtGK09vMGk4?=
 =?utf-8?B?NFlINVJLN0ZibU5uTVJ5QVV4YzdiaVhaZ3Z0TTJHZitqUU1UdUlZTm5uTUUx?=
 =?utf-8?B?blZEWHVFWDNQNWNnZzZKL1JSZG9VYmdsMXR5UEEreXJTclhwbEtJRjR1ZitN?=
 =?utf-8?B?SWdrT3Y1Z09HR01OVEF1UXRjQ1pXaW1TOXpCNWt5b1BnQ2lzR2NqTmNUSFh5?=
 =?utf-8?B?OEdhbmlRbTdtOUNIdHg3Zm9jTzdSckpCMExIVXEyTHBoellhZHI1UGx5OVdI?=
 =?utf-8?B?d1NqTTdVSWU0Q0ZEL2JZMGdwaU04SE9CUFlwSTlFYWc0QjNHY0dRMC91Nm4x?=
 =?utf-8?B?NHlRQi9NVWZqYTRPZzRCRndGSzBUS2NnL0RCbmcvTXpTLytCVnlTbXR1cFZV?=
 =?utf-8?B?Uk9JQTM2S29KQVBzRW1kblNyYldHUEphMW5Qd1pyQTNBZ3hhSHVOdUZjbjN3?=
 =?utf-8?B?UkEvOFFPdUw3WmNvdW9XUTNUemNHYXM5SDgxV0U0T2Nlbnd2aVFHNXVLeE83?=
 =?utf-8?B?Tmh1ZHRRSzVnV3RLaGl5SUVwNkQ4RmpVb01vNjJGeWgvUm03ZkFTd2w1Vy9C?=
 =?utf-8?B?QklyQXozTWhMRlFwUVZXYUEyK0ZESjdpK2oyb3dXSVdLTzNJZ2tMbjl3cjlr?=
 =?utf-8?B?Q2RRMnhTVFRIejlmR0kwVUY1aExHT2d4WVBUODBnSklqNnJvdVY4b3V4VmpU?=
 =?utf-8?B?eWNFTUpYTFBKQm5XbFhnV0tDcEtYd0oxVklrR1BTY1lGN1JFdm5ibTBUUzRm?=
 =?utf-8?B?ZmhXMFFXSldqZ1NCYXdLeXZNQkFmLzh0cXpwRVJ2VzkrT3EvMUR1Y2VTMmRC?=
 =?utf-8?B?dG1XY3ZrRVRySVo3SVBaTUFhTTlHR2pxblVvWjBwNzZQYklyNkpLRFNROW1w?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A96F3ABE20C90F42BC7A44D578F7470B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3558f7f8-2228-4e9d-118d-08dbbae66a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 21:04:58.8950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRZn2V2WBWqLZ/P/siYkeS/uDeLpm01nU0PeGr5pJ+Vn0hHVBfbd/78cFJjXb4cKCK9rMOi3U+zXhP6WL6EDpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5964
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 19/20] drm/xe/uapi: Crystal Reference
 Clock updates
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA5LTIxIGF0IDE2OjQ5IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFRodSwgU2VwIDIxLCAyMDIzIGF0IDAzOjUwOjA3UE0gKzAwMDAsIFNvdXphLCBKb3NlIHdy
b3RlOg0KPiA+IE9uIFdlZCwgMjAyMy0wOS0yMCBhdCAxNToyOSAtMDQwMCwgUm9kcmlnbyBWaXZp
IHdyb3RlOg0KPiA+ID4gRmlyc3Qgb2YgYWxsLCBsZXQncyByZW1vdmUgdGhlIGR1cGxpY2F0aW9u
Lg0KPiA+ID4gQnV0IGFsc28sIGxldCdzIHJlbmFtZSBpdCB0byByZW1vdmUgdGhlIHdvcmQgJ2Zy
ZXF1ZW5jeScNCj4gPiA+IG91dCBvZiBpdC4gSW4gZ2VuZXJhbCwgdGhlIGZpcnN0IHRoaW5nIHBl
b3BsZSB0aGluayBvZiBmcmVxdWVuY3kNCj4gPiA+IGlzIHRoZSBmcmVxdWVuY3kgaW4gd2hpY2gg
dGhlIEdUcyBhcmUgb3BlcmF0aW5nIHRvIGV4ZWN1dGUgdGhlDQo+ID4gPiBHUFUgaW5zdHJ1Y3Rp
b25zLg0KPiA+ID4gDQo+ID4gPiBXaGlsZSB0aGlzIGZyZXF1ZW5jeSBoZXJlIGlzIGEgY3J5c3Rh
bCByZWZlcmVuY2UgY2xvY2sgZnJlcXVlbmN5DQo+ID4gPiB3aGljaCBpcyB0aGUgYmFzZSBvZiBl
dmVyeXRoaW5nIGVsc2UsIGFuZCBpbiB0aGlzIGNhc2Ugb2YgdGhpcw0KPiA+ID4gdUFQSSBpdCBp
cyB1c2VkIHRvIGNhbGN1bGF0ZSBhIGJldHRlciBhbmQgcHJlY2lzZSB0aW1lc3RhbXAuDQo+ID4g
PiANCj4gPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+
ID4gVW1lc2ggTmVybGlnZSBSYW1hcHBhIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29t
Pg0KPiA+ID4gQ2M6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4N
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNv
bT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0
QGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVy
eS5jIHwgIDUgKystLS0NCj4gPiA+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oICAgICB8IDEw
ICsrKystLS0tLS0NCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBk
ZWxldGlvbnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9xdWVyeS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+IGluZGV4
IGEyN2IxMDU4M2Y1YS4uODE4NGRmNGFiZGUxIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9x
dWVyeS5jDQo+ID4gPiBAQCAtMTQ5LDcgKzE0OSw3IEBAIHF1ZXJ5X2NzX2N5Y2xlcyhzdHJ1Y3Qg
eGVfZGV2aWNlICp4ZSwNCj4gPiA+ICAJaWYgKCFod2UpDQo+ID4gPiAgCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPiA+ICANCj4gPiA+IC0JcmVzcC5jc19mcmVxdWVuY3kgPSBndC0+aW5mby5jbG9ja19m
cmVxOw0KPiA+ID4gKwlyZXNwLmNzX3JlZmVyZW5jZV9jbG9jayA9IGd0LT5pbmZvLmNsb2NrX2Zy
ZXE7DQo+ID4gPiAgDQo+ID4gPiAgCXhlX2RldmljZV9tZW1fYWNjZXNzX2dldCh4ZSk7DQo+ID4g
PiAgCXhlX2ZvcmNlX3dha2VfZ2V0KGd0X3RvX2Z3KGd0KSwgWEVfRk9SQ0VXQUtFX0FMTCk7DQo+
ID4gPiBAQCAtMTY3LDcgKzE2Nyw3IEBAIHF1ZXJ5X2NzX2N5Y2xlcyhzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwNCj4gPiA+ICAJcmVzcC53aWR0aCA9IDM2Ow0KPiA+ID4gIA0KPiA+ID4gIAkvKiBPbmx5
IHdyaXRlIHRvIHRoZSBvdXRwdXQgZmllbGRzIG9mIHVzZXIgcXVlcnkgKi8NCj4gPiA+IC0JaWYg
KHB1dF91c2VyKHJlc3AuY3NfZnJlcXVlbmN5LCAmcXVlcnlfcHRyLT5jc19mcmVxdWVuY3kpKQ0K
PiA+ID4gKwlpZiAocHV0X3VzZXIocmVzcC5jc19yZWZlcmVuY2VfY2xvY2ssICZxdWVyeV9wdHIt
PmNzX3JlZmVyZW5jZV9jbG9jaykpDQo+ID4gPiAgCQlyZXR1cm4gLUVGQVVMVDsNCj4gPiA+ICAN
Cj4gPiA+ICAJaWYgKHB1dF91c2VyKHJlc3AuY3B1X3RpbWVzdGFtcCwgJnF1ZXJ5X3B0ci0+Y3B1
X3RpbWVzdGFtcCkpDQo+ID4gPiBAQCAtMzgwLDcgKzM4MCw2IEBAIHN0YXRpYyBpbnQgcXVlcnlf
Z3RfbGlzdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkg
KnF1ZXJ5DQo+ID4gPiAgCQllbHNlDQo+ID4gPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udHlw
ZSA9IFhFX1FVRVJZX0dUX1RZUEVfTUFJTjsNCj4gPiA+ICAJCWd0X2xpc3QtPmd0X2xpc3RbaWRd
Lmd0X2lkID0gZ3QtPmluZm8uaWQ7DQo+ID4gPiAtCQlndF9saXN0LT5ndF9saXN0W2lkXS5jbG9j
a19mcmVxID0gZ3QtPmluZm8uY2xvY2tfZnJlcTsNCj4gPiA+ICAJCWlmICghSVNfREdGWCh4ZSkp
DQo+ID4gPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0ubmF0aXZlX21lbV9yZWdpb25zID0gMHgx
Ow0KPiA+ID4gIAkJZWxzZQ0KPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVf
ZHJtLmggYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiBpbmRleCA0NWVjMjBjMjc2
NWQuLjUxNTZiYWM4NGYyMCAxMDA2NDQNCj4gPiA+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVf
ZHJtLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+IEBAIC0y
NDgsOCArMjQ4LDggQEAgc3RydWN0IGRybV94ZV9xdWVyeV9tZW1fcmVnaW9uIHsNCj4gPiA+ICAg
KiByZWxldmFudCBHUFUgdGltZXN0YW1wLiBjbG9ja2lkIGlzIHVzZWQgdG8gcmV0dXJuIHRoZSBz
cGVjaWZpYyBDUFUNCj4gPiA+ICAgKiB0aW1lc3RhbXAuDQo+ID4gPiAgICoNCj4gPiA+IC0gKiBU
aGUgcXVlcnkgcmV0dXJucyB0aGUgY29tbWFuZCBzdHJlYW1lciBjeWNsZXMgYW5kIHRoZSBmcmVx
dWVuY3kgdGhhdCBjYW4NCj4gPiA+IC0gKiBiZSB1c2VkIHRvIGNhbGN1bGF0ZSB0aGUgY29tbWFu
ZCBzdHJlYW1lciB0aW1lc3RhbXAuIEluIGFkZGl0aW9uIHRoZQ0KPiA+ID4gKyAqIFRoZSBxdWVy
eSByZXR1cm5zIHRoZSBjb21tYW5kIHN0cmVhbWVyIGN5Y2xlcyBhbmQgdGhlIHJlZmVyZW5jZSBj
bG9jayB0aGF0DQo+ID4gPiArICogY2FuIGJlIHVzZWQgdG8gY2FsY3VsYXRlIHRoZSBjb21tYW5k
IHN0cmVhbWVyIHRpbWVzdGFtcC4gSW4gYWRkaXRpb24gdGhlDQo+ID4gPiAgICogcXVlcnkgcmV0
dXJucyBhIHNldCBvZiBjcHUgdGltZXN0YW1wcyB0aGF0IGluZGljYXRlIHdoZW4gdGhlIGNvbW1h
bmQNCj4gPiA+ICAgKiBzdHJlYW1lciBjeWNsZSBjb3VudCB3YXMgY2FwdHVyZWQuDQo+ID4gPiAg
ICovDQo+ID4gPiBAQCAtMjY2LDggKzI2Niw4IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfY3NfY3lj
bGVzIHsNCj4gPiA+ICAJICovDQo+ID4gPiAgCV9fdTY0IGNzX2N5Y2xlczsNCj4gPiA+ICANCj4g
PiA+IC0JLyoqIEZyZXF1ZW5jeSBvZiB0aGUgY3MgY3ljbGVzIGluIEh6LiAqLw0KPiA+ID4gLQlf
X3U2NCBjc19mcmVxdWVuY3k7DQo+ID4gPiArCS8qKiBSZWZlcmVuY2UgQ2xvY2sgb2YgdGhlIGNz
IGN5Y2xlcyBpbiBIei4gKi8NCj4gPiA+ICsJX191NjQgY3NfcmVmZXJlbmNlX2Nsb2NrOw0KPiA+
ID4gIA0KPiA+ID4gIAkvKioNCj4gPiA+ICAJICogQ1BVIHRpbWVzdGFtcCBpbiBucy4gVGhlIHRp
bWVzdGFtcCBpcyBjYXB0dXJlZCBiZWZvcmUgcmVhZGluZyB0aGUNCj4gPiA+IEBAIC0zODEsOCAr
MzgxLDYgQEAgc3RydWN0IGRybV94ZV9xdWVyeV9ndCB7DQo+ID4gPiAgCV9fdTE2IHR5cGU7DQo+
ID4gPiAgCS8qKiBAZ3RfaWQ6IFVuaXF1ZSBJRCBvZiB0aGlzIEdUIHdpdGhpbiB0aGUgUENJIERl
dmljZSAqLw0KPiA+ID4gIAlfX3UxNiBndF9pZDsNCj4gPiA+IC0JLyoqIEBjbG9ja19mcmVxOiBB
IGNsb2NrIGZyZXF1ZW5jeSBmb3IgdGltZXN0YW1wICovDQo+ID4gPiAtCV9fdTMyIGNsb2NrX2Zy
ZXE7DQo+ID4gDQo+ID4gVGhpcyBuZWVkcyB0byBiZSBicm91Z2h0IGJhY2ssIGlmIHlvdSB3YW50
IHRvIHJlbW92ZSB0aGUgZHVwbGljYXRpb24gcmVtb3ZlIGl0IGZyb20gZHJtX3hlX3F1ZXJ5X2Nz
X2N5Y2xlcyB0aGVuLg0KPiA+IERSTV9YRV9RVUVSWV9DU19DWUNMRVMgd2lsbCBmYWlsIHdoZW4g
cnVubmluZyBpbiBTUklPViBWRiBhcyBpdCBjYW4ndCBkbyBtbWlvIHJlYWRzLg0KPiANCj4gU28s
IGRvZXMgdGhlIENTX0NZTEVTIG1ha2Ugc2Vuc2UgdGhlbj8gb3IgYWxsIHRoYXQgaW5mb3JtYXRp
b24gY291bGQvc2hvdWxkDQo+IGJlIGluc2lkZSB0aGUgZ3QgaW5mbyBoZXJlPw0KDQoNCkl0IG1h
a2VzIHNlbnNlLCBjc19jeWNsZXMsIGNwdV90aW1lc3RhbXAgYW5kIGNwdV9kZWx0YSB3aWxsIGNo
YW5nZSBvbiBldmVyeSBjYWxsLg0KDQpjc19jeWNsZXMgPSBlbmdpbmUgdGltZXN0YW1wDQpjcHVf
dGltZXN0YW1wID0gQ1BVIHRpbWVzdGFtcCBhZnRlciByZWFkIGNzX2N5Y2xlcw0KY3B1X2RlbHRh
ID0gY3B1X3RpbWVzdGFtcCAtIENQVSB0aW1lc3RhbXAgYmVmb3JlIHJlYWQgY3NfY3ljbGVzDQoN
CkZvciBzb21lIHVzZSBjYXNlcyBNZXNhIGNhbiByZXF1ZXN0IGVuZ2luZSB0aW1lc3RhbXAgZnJv
bSBiYXRjaCBidWZmZXIgc28gaXQgd2lsbCBuZWVkIHRoZSBHVCBjbG9ja19mcmVxIGV2ZW4gd2hl
biBEUk1fWEVfUVVFUllfQ1NfQ1lDTEVTIGlzIG5vdA0KcG9zc2libGUsIGZvciBvdGhlcnMgY2Fz
ZSBsaWtlIHdoZW4gZ2F0aGVyaW5nIGRhdGEgdG8gZG8gcGVyZm9ybWFuY2UgYW5hbHlzdHMgdGhl
IHJlcXVlc3QgdHJvdWdoIGJhdGNoIGJ1ZmZlcnMgYWRkcyB0byBtdWNoIGRlbGF5IGFuZCB2YXJp
YW5jZS4NCg0KPiANCj4gTGV0J3MgdGFrZSBPQSBpbnRvIGNvbnNpZGVyYXRpb24gYXMgd2VsbCBo
ZXJlLg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA5MTkxNjEwNDkuMjMwNzg1
NS0xNy1hc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20NCj4gDQo+IENjOiBBc2h1dG9zaC4NCj4gQW55
dGhpbmcgZnJvbSBPQSB0aGF0IHdlIGNvdWxkIGRvIHRvIHVuaWZ5IHRoZXNlIGRhdGE/DQo+IA0K
PiA+IA0KPiA+ID4gIAkvKioNCj4gPiA+ICAJICogQG5hdGl2ZV9tZW1fcmVnaW9uczogQml0IG1h
c2sgb2YgaW5zdGFuY2VzIGZyb20NCj4gPiA+ICAJICogZHJtX3hlX3F1ZXJ5X21lbV91c2FnZSB0
aGF0IGxpdmVzIG9uIHRoZSBzYW1lIEdQVS9UaWxlIGFuZCBoYXZlDQo+ID4gDQoNCg==
