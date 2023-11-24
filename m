Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625BBC61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 18:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2108410E371;
	Fri, 24 Nov 2023 18:38:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A1510E371
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 18:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700851096; x=1732387096;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oj/nsttgUNgQxAfOLeZDz9Wc7k24zRrZZhaT4Uo22Xo=;
 b=CZvmojaUok/2k8n1FRdxd5KzoWVOtfmd3cMq+zGXRYgbLiGBxHOB7Uqa
 NJMZge3ic5HPZT91bwjFcchJRoHIMjim9hv/TexgTYUVLcgbN84zIcu6e
 d3iciEyXbX8w9dWeNfhAEeVwd9HUIM63pL9AzaDJ/SjyVIRq/dJFIx4uh
 pJ4NH3C7N4yp9I+12DM0g0rSwItLc+/+ILFkQN0cHBUonngUc+jSFRQdv
 Zm6hI8PkhnXobAloN4ChfLM6rSLbh/5MTjRBbRkDTGiLECqT8VfmiJ3jQ
 +TPhnpNViOSpop4FSd+zFAD5QOPYg2LrhwNb9avAR6HU4icqWjbub6vnL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5683979"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5683979"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 10:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="767548040"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="767548040"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Nov 2023 10:38:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 10:38:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 24 Nov 2023 10:38:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 24 Nov 2023 10:38:14 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 24 Nov 2023 10:38:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqyzKueE+G2sc2hLWWXc8lZBuGcglazjx11vzsPhgPfJ9pqFhoZoVE0WpBOz4DdXZugpGtyoFiDn8xAykG88c5+LsomoU5Z0DhVWsTdhsyOUqdDVXK7CYxXc3mrjHGjYv5WjnFVdP0ZQytq2tWIAbk7vA2BmWhqO1+j29w4YHLIIJdPDThs/RHTl/kU1C8HuWFnah3pxAZEKtNisRKbRkl3lK5LdZjDEa1IcawgJCgRDkKUGdFxYVYwSiDuNq6JO5aJ6kggBGywEreBAfhFyPf1Wcq8v7Yi++ASlOFMHfbDk6FVAyRUDrdMIrsVRRHGnLrgmXahFH/+1iypHWu5D1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oj/nsttgUNgQxAfOLeZDz9Wc7k24zRrZZhaT4Uo22Xo=;
 b=NdSGgyXdRSsjkRRUHf+T8sbVzQPKLEwqIEmZV92NmElDC8mNvfuWn+PkL3I6aejoAXAsgNmuHTKT770g6AveNy/gPxexccEKS2bhAZuIBcgHVLb3hxDI9+uh19V1qCtu8QzAYkllRpCEHxDo+YOiTS86jXyEqqBVIJVwvnhcwlEOrG41367mHLKSsbdbuZxzYdc/W7Bang5OOva75ItSqydO9Vlimbj9ClAPoxO5oda9Af3CN630hIaX0ThdryCJnGbIbqFAsWdQU6bksK0h1UmorxWA6JHriFd6vkYp5DbXqvb0C4STqtGN96n+hHWnu78HJ2cKphq8dgcskn42Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DS0PR11MB7508.namprd11.prod.outlook.com (2603:10b6:8:152::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 18:38:05 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 18:38:05 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 10/14] drm/xe/uapi: Crystal Reference Clock updates
Thread-Index: AQHaHVGk2KvVqWZVUkO2II+SgPW7TrCJ0BIA
Date: Fri, 24 Nov 2023 18:38:04 +0000
Message-ID: <e5871895301ff0053323d5f83eb46275bf4ac45e.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-11-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-11-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DS0PR11MB7508:EE_
x-ms-office365-filtering-correlation-id: ff2714c3-9254-46d4-69d9-08dbed1c7ec4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H4pYhIEWltICKj1ZQzlObwQzO3HTXmswP2kuK6jIdFQFh67ZFE3FKo30hO8FpIZyJnJQGo5akhkBDftUzvVPKwhGopBk+EYfamDFq8eTwcZRcYQcfgmwyy0OmJqwmJ/ofgmRA04vz9skqrV6/beb7+SLdlALkQV9m8D1lXiYR0ET/BvhxuaSnEblEvL/EomLJ9AeBKrZDkg0h2Q0pvpy0K8RYhK7f3h1rPvKeGGStPMlXZmsOuVI7keOIH2XIG6YXWJzRpgDgviYv8FmhQ7QezqgrvOw8yDJQviyn0YeqAgetss/zqmQZdQ/5dSOmqSP3cSIMgQdAd+v+drXoPtZ2obEVb/6iKej7ixMN7spSw5N3s+f3BNC0vLz7tbO/cOIJ8AfE2E4eeEYSmzCRIxJ3jrCjeI4zBAvbLmyOV7f5rZy1d5kKDKKzUghZIN7/5NT3TXHyZbulUDY+MjH3nLw52tcUMSgtmMNKDE55ZGeD18pogjntQm+DYXfv2zQVRXG/2y1K9nPHP1WqveS503V3gXSf4GrqMcEmcol1ynOr6rBQxiwR5mjS3fQpd9BGrkrOevNB25hyOd7rEbz0txJEUgxwyptUuIQi5sOfDIwS3MytCAp2C/hev5PfSHKtAnB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(110136005)(91956017)(6636002)(54906003)(76116006)(64756008)(66446008)(66476007)(316002)(66556008)(66946007)(478600001)(6486002)(71200400001)(86362001)(5660300002)(38070700009)(2906002)(4326008)(8676002)(8936002)(4001150100001)(2616005)(107886003)(36756003)(41300700001)(26005)(82960400001)(6506007)(122000001)(83380400001)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bE9RVER6YlB3VzZyeWRKUWc4dTFPbWdaQ2tPOVFlb3FsUS9jaG5rdmV2UGpW?=
 =?utf-8?B?bmxTck11bjljdGNrRjNOVVpNTk5pN3FBNTFpb0hOeFo1cGxpaFg1MFBQY2hs?=
 =?utf-8?B?Y2ZFV1YyWnIxeXQ3ZFQza283ZStCSnY4RmdwRG5HYXYwOGVkUi9UY0xPQm1h?=
 =?utf-8?B?RGt0WDZhVnFudGlMTXFQN1lvV2JsaFZWTnNiREVwLyt3N1N0bm83LzEzYTVY?=
 =?utf-8?B?Ry9CZjhlaWlBYkpOc1pyaEN1WTFlK3BGRkpVNDhpL2xKaDlEZ25qb05GTWVH?=
 =?utf-8?B?aWk5M2lOYUlyUTFObSsvKy9UMndiZXJkL1QyU1N2eXpXTytFc29DUmhkcUpU?=
 =?utf-8?B?QU1YRGE1aGxBa0RDWGUrWURwMDV5U01nd045aE1sNlZ6aTdWZktMVkFlOTNV?=
 =?utf-8?B?UTVwNm5SbGdPVEEvOWlMeU9JbWdMdlkycm9CVFpENmM4VTVabWZkN2NDMHhh?=
 =?utf-8?B?c2hFY0I5Q2taWU92N3d6U1BLVEJHWk52OFkxVjdzaWJ2VzhzV0podzlvdWly?=
 =?utf-8?B?Q0oxTGxlQzMrdHB5UXozeDlaWFJTZDRkNFM4ZGdscHhKTmRYY0hZUkZSb0Fz?=
 =?utf-8?B?aHBKK2JPbUxRZWptcG8xM1FhbjJkRHVBYm5GRGR2V3hla3EzVC9EYUJNZG5Z?=
 =?utf-8?B?ZlJOUjI3TENTL3F1UjNpNFM0WWgvQ0t3UDRsU1VBWjAzcjZzdnN3VXhHdURN?=
 =?utf-8?B?d3pYZUtyV25JMWZjWGJXZkFUSHJ3dW0rLytiZjVmWmFKdDAvOFNBR1RhVDVk?=
 =?utf-8?B?NGowVmt3UE5scjF0eDluNEswT25IKzVlZGJudXd2c1BBMWcwbUc5eDJtMDRm?=
 =?utf-8?B?TnBMTEY2N2YwTmoxVVN1UE16cVR3NVQ4eGt6RDhDcDB1SjA3VW5TdzRza0Vk?=
 =?utf-8?B?WlhRV0hjWWk5Z1NOTDVFRWp3S2dHRXJqbGc0M3F1RkRUNU0wZmhBL1ArbTBM?=
 =?utf-8?B?K1dEbU50RmdkMmd2L25XaHVTZ1k3K1F4ZWhHZC83eFV4V2FHZjk2bjIxSWVv?=
 =?utf-8?B?WHBKQmFnZ1hFQkdmMktNa2ZzdEZGRjJiWVlDR3JDT1QvOWZEQzBmSVdnOExW?=
 =?utf-8?B?d2dxRnNNTEdOS3FvQ1NJNDlvdEUySUcvL1JSQTd0NXg0Ui9uU2trWjJsN1Bq?=
 =?utf-8?B?aTBXaksxT0hnVzRyVG9JbHZhcGFFTVRSYUd0V0lhQjQ0cWk0Tm1XZUdmb2ps?=
 =?utf-8?B?YmtVVTFRTTBPQTdPUDZXcmRCWlRmc3lMR1k4d1Nla3RiRkhBaU5xZ0g5Qmlo?=
 =?utf-8?B?cUluNTdNWVRGZHlXdzdZaHU0TEQwamVmbE5sV1YyNVJOam0zbVdJTmxIQUU0?=
 =?utf-8?B?di94aERYS1FFNkx0eEJEdVFHd2h1VkluMnFkUGVtUzN3aVh4VnYxZThwalpS?=
 =?utf-8?B?bTBXd0JxN0JzZWlWaTJvYWxqL09FdmZud3BwdVlRTVlBOHZMTmhFZEx1dTZT?=
 =?utf-8?B?YndLcTJVcVcrYWlMdjZZUzlsZDVUZFcwNEVsVldZWnNFVlRQK2oxUU5zeWdz?=
 =?utf-8?B?WXNZcVV2cC9QMVBJblF0dlBXK2FmQTZzYjRDK3M4aHF3dG1JWmt0NXlFNW1u?=
 =?utf-8?B?VW9hYktMN3VINmdQcjJiZnVMUlA0Um1ONjlCY2RYdVBxUlB6UnhBUkxHaUtn?=
 =?utf-8?B?ME5MYU9waVlUQ2xBK1FjeVNpeXpKTmxEeHhSUlJpN3JwTWtnTlNmWDRGaDZa?=
 =?utf-8?B?NDUxRkpwZzlFZ2JUdGgxOE9uRDFES2w5ZXNBZW96ZUdTL3JnVG5LYTFuWkVL?=
 =?utf-8?B?RzQwK3hsbFhjZ1JQbVI3aHhwK0lReHpGdmVZSFArUCtRNkd0QUtSemU0RWtZ?=
 =?utf-8?B?OEFFc1hNajFDZ3NMOTVFd3BUQ09tUTZaUENna2R6S212NFpqNnJnTWxqdWNM?=
 =?utf-8?B?eDJ0MHlSMTczbHZVbXJNRS9UVkUrb2c4OVorYno0MUhZZTYxbTNXbEcvMzIv?=
 =?utf-8?B?QlZxRmtiMjAySS9Eb3k0ZlBZQ1VEM2ZrazBER2hxejhoR1lTL3FiZU1FU0Rt?=
 =?utf-8?B?R3pKb0lUYmFYWG9tcDZ1S3ZVdnAwcGkrVE9YTThyM0thRjVHdlBBeXVYVm1a?=
 =?utf-8?B?OGFtNllvWUJOTGtCajE5dS8zbjFaUW5nbFFNS001bnUrSGJ0WG5jYS91NlMy?=
 =?utf-8?B?SUNqOENtYk5JY1IzTTJOQWk1Q3BKZ2lkWGJubUxCS2dFWU9ib09vWUFDdFkv?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F68D298C52BD3047A504BF6A10CDD151@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2714c3-9254-46d4-69d9-08dbed1c7ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 18:38:04.4456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MXh6gYiHWzY0lZ++3JM2DBoE3nhIogvSX0B9BnGscDeF5rd/a2ApZvdvAW/RanhfCXEtOGUdTnniJG44zfH+jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7508
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/14] drm/xe/uapi: Crystal Reference
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTIyIGF0IDE0OjM4ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IEZp
cnN0IG9mIGFsbCwgbGV0J3MgcmVtb3ZlIHRoZSBkdXBsaWNhdGlvbi4NCj4gQnV0IGFsc28sIGxl
dCdzIHJlbmFtZSBpdCB0byByZW1vdmUgdGhlIHdvcmQgJ2ZyZXF1ZW5jeScNCj4gb3V0IG9mIGl0
LiBJbiBnZW5lcmFsLCB0aGUgZmlyc3QgdGhpbmcgcGVvcGxlIHRoaW5rIG9mIGZyZXF1ZW5jeQ0K
PiBpcyB0aGUgZnJlcXVlbmN5IGluIHdoaWNoIHRoZSBHVHMgYXJlIG9wZXJhdGluZyB0byBleGVj
dXRlIHRoZQ0KPiBHUFUgaW5zdHJ1Y3Rpb25zLg0KPiANCj4gV2hpbGUgdGhpcyBmcmVxdWVuY3kg
aGVyZSBpcyBhIGNyeXN0YWwgcmVmZXJlbmNlIGNsb2NrIGZyZXF1ZW5jeQ0KPiB3aGljaCBpcyB0
aGUgYmFzZSBvZiBldmVyeXRoaW5nIGVsc2UsIGFuZCBpbiB0aGlzIGNhc2Ugb2YgdGhpcw0KPiB1
QVBJIGl0IGlzIHVzZWQgdG8gY2FsY3VsYXRlIGEgYmV0dGVyIGFuZCBwcmVjaXNlIHRpbWVzdGFt
cC4NCj4gDQo+IHYyOiAoU3VnZ2VzdGVkIGJ5IEpvc2UpIFJlbW92ZSB0aGUgZW5naW5lX2NzIGFu
ZCBrZWVwIHRoZSBHVCBpbmZvIG9uZQ0KPiBzaW5jZSBpdCBtaWdodCBiZSB1c2VmdWwgZm9yIG90
aGVyIFNSSU9WIGNhc2VzIHdoZXJlIHRoZSBlbmdpbmVfY3MNCj4gd2lsbCBiZSB6ZXJvZWQuIFNv
LCBncmFiYmluZyBmcm9tIHRoZSBHVF9MSVNUIHNob3VsZCBiZSBjbGVhbmVyLg0KPiANCj4gQ2M6
IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IFVtZXNoIE5lcmxpZ2Ug
UmFtYXBwYSA8dW1lc2gubmVybGlnZS5yYW1hcHBhQGludGVsLmNvbT4NCj4gQ2M6IEpvc2UgU291
emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBW
aXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY29pcyBE
dWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X2Nsb2NrLmMgfCAgNCArKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdHlwZXMuaCB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jICAg
IHwgIDggKy0tLS0tLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgICAgIHwgMTEg
KysrKy0tLS0tLS0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2xv
Y2suYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jbG9jay5jDQo+IGluZGV4IDI1YTE4ZWFh
ZDljNC4uOTM3MDU0ZTMxZDcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfY2xvY2suYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfY2xvY2suYw0KPiBA
QCAtNzUsMTEgKzc1LDExIEBAIGludCB4ZV9ndF9jbG9ja19pbml0KHN0cnVjdCB4ZV9ndCAqZ3Qp
DQo+ICAJCWZyZXEgPj49IDMgLSBSRUdfRklFTERfR0VUKFJQTV9DT05GSUcwX0NUQ19TSElGVF9Q
QVJBTUVURVJfTUFTSywgYzApOw0KPiAgCX0NCj4gIA0KPiAtCWd0LT5pbmZvLmNsb2NrX2ZyZXEg
PSBmcmVxOw0KPiArCWd0LT5pbmZvLnJlZmVyZW5jZV9jbG9jayA9IGZyZXE7DQo+ICAJcmV0dXJu
IDA7DQo+ICB9DQo+ICANCj4gIHU2NCB4ZV9ndF9jbG9ja19jeWNsZXNfdG9fbnMoY29uc3Qgc3Ry
dWN0IHhlX2d0ICpndCwgdTY0IGNvdW50KQ0KPiAgew0KPiAtCXJldHVybiBESVZfUk9VTkRfQ0xP
U0VTVF9VTEwoY291bnQgKiBOU0VDX1BFUl9TRUMsIGd0LT5pbmZvLmNsb2NrX2ZyZXEpOw0KPiAr
CXJldHVybiBESVZfUk9VTkRfQ0xPU0VTVF9VTEwoY291bnQgKiBOU0VDX1BFUl9TRUMsIGd0LT5p
bmZvLnJlZmVyZW5jZV9jbG9jayk7DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfdHlwZXMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oDQo+
IGluZGV4IGQzZjI3OTM2ODRlMi4uNTZiMGYyMmVlNzhkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3RfdHlwZXMuaA0KPiBAQCAtMTA3LDggKzEwNyw4IEBAIHN0cnVjdCB4ZV9ndCB7DQo+ICAJCWVu
dW0geGVfZ3RfdHlwZSB0eXBlOw0KPiAgCQkvKiogQGlkOiBVbmlxdWUgSUQgb2YgdGhpcyBHVCB3
aXRoaW4gdGhlIFBDSSBEZXZpY2UgKi8NCj4gIAkJdTggaWQ7DQo+IC0JCS8qKiBAY2xvY2tfZnJl
cTogY2xvY2sgZnJlcXVlbmN5ICovDQo+IC0JCXUzMiBjbG9ja19mcmVxOw0KPiArCQkvKiogQHJl
ZmVyZW5jZV9jbG9jazogY2xvY2sgZnJlcXVlbmN5ICovDQo+ICsJCXUzMiByZWZlcmVuY2VfY2xv
Y2s7DQo+ICAJCS8qKiBAZW5naW5lX21hc2s6IG1hc2sgb2YgZW5naW5lcyBwcmVzZW50IG9uIEdU
ICovDQo+ICAJCXU2NCBlbmdpbmVfbWFzazsNCj4gIAkJLyoqDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5j
DQo+IGluZGV4IDhiZjBmZTZiMDllMC4uNzdjYWI2NmQzMzdmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
cXVlcnkuYw0KPiBAQCAtMTQ3LDggKzE0Nyw2IEBAIHF1ZXJ5X2VuZ2luZV9jeWNsZXMoc3RydWN0
IHhlX2RldmljZSAqeGUsDQo+ICAJaWYgKCFod2UpDQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAg
DQo+IC0JcmVzcC5lbmdpbmVfZnJlcXVlbmN5ID0gZ3QtPmluZm8uY2xvY2tfZnJlcTsNCj4gLQ0K
PiAgCXhlX2RldmljZV9tZW1fYWNjZXNzX2dldCh4ZSk7DQo+ICAJeGVfZm9yY2Vfd2FrZV9nZXQo
Z3RfdG9fZncoZ3QpLCBYRV9GT1JDRVdBS0VfQUxMKTsNCj4gIA0KPiBAQCAtMTY0LDEwICsxNjIs
NiBAQCBxdWVyeV9lbmdpbmVfY3ljbGVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCXhlX2Rl
dmljZV9tZW1fYWNjZXNzX3B1dCh4ZSk7DQo+ICAJcmVzcC53aWR0aCA9IDM2Ow0KPiAgDQo+IC0J
LyogT25seSB3cml0ZSB0byB0aGUgb3V0cHV0IGZpZWxkcyBvZiB1c2VyIHF1ZXJ5ICovDQoNCnRo
ZSBjb21tZW50IGlzIHJlbGV2YW50IHRvIHRvIG90aGVyIHB1dF91c2VyKCkgY2FsbHMuDQoNCj4g
LQlpZiAocHV0X3VzZXIocmVzcC5lbmdpbmVfZnJlcXVlbmN5LCAmcXVlcnlfcHRyLT5lbmdpbmVf
ZnJlcXVlbmN5KSkNCj4gLQkJcmV0dXJuIC1FRkFVTFQ7DQo+IC0NCj4gIAlpZiAocHV0X3VzZXIo
cmVzcC5jcHVfdGltZXN0YW1wLCAmcXVlcnlfcHRyLT5jcHVfdGltZXN0YW1wKSkNCj4gIAkJcmV0
dXJuIC1FRkFVTFQ7DQo+ICANCj4gQEAgLTM4Myw3ICszNzcsNyBAQCBzdGF0aWMgaW50IHF1ZXJ5
X2d0X2xpc3Qoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5
ICpxdWVyeQ0KPiAgCQllbHNlDQo+ICAJCQlndF9saXN0LT5ndF9saXN0W2lkXS50eXBlID0gRFJN
X1hFX1FVRVJZX0dUX1RZUEVfTUFJTjsNCj4gIAkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0uZ3RfaWQg
PSBndC0+aW5mby5pZDsNCj4gLQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0uY2xvY2tfZnJlcSA9IGd0
LT5pbmZvLmNsb2NrX2ZyZXE7DQo+ICsJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLnJlZmVyZW5jZV9j
bG9jayA9IGd0LT5pbmZvLnJlZmVyZW5jZV9jbG9jazsNCj4gIAkJaWYgKCFJU19ER0ZYKHhlKSkN
Cj4gIAkJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLm5lYXJfbWVtX3JlZ2lvbnMgPSAweDE7DQo+ICAJ
CWVsc2UNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggYi9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oDQo+IGluZGV4IDg1YjBhZmZjOWY4OS4uYTk0Yzc1MTQ1MGQ1IDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ICsrKyBiL2luY2x1ZGUv
dWFwaS9kcm0veGVfZHJtLmgNCj4gQEAgLTI4MCw4ICsyODAsOCBAQCBzdHJ1Y3QgZHJtX3hlX21l
bV9yZWdpb24gew0KPiAgICogaW4gLmRhdGEuIHN0cnVjdCBkcm1feGVfcXVlcnlfZW5naW5lX2N5
Y2xlcyBpcyBhbGxvY2F0ZWQgYnkgdGhlIHVzZXIgYW5kDQo+ICAgKiAuZGF0YSBwb2ludHMgdG8g
dGhpcyBhbGxvY2F0ZWQgc3RydWN0dXJlLg0KPiAgICoNCj4gLSAqIFRoZSBxdWVyeSByZXR1cm5z
IHRoZSBlbmdpbmUgY3ljbGVzIGFuZCB0aGUgZnJlcXVlbmN5IHRoYXQgY2FuDQo+IC0gKiBiZSB1
c2VkIHRvIGNhbGN1bGF0ZSB0aGUgZW5naW5lIHRpbWVzdGFtcC4gSW4gYWRkaXRpb24gdGhlDQo+
ICsgKiBUaGUgcXVlcnkgcmV0dXJucyB0aGUgZW5naW5lIGN5Y2xlcywgd2hpY2ggYWxvbmcgd2l0
aCBHVCdzIEByZWZlcmVuY2VfY2xvY2ssDQo+ICsgKiBjYW4gYmUgdXNlZCB0byBjYWxjdWxhdGUg
dGhlIGVuZ2luZSB0aW1lc3RhbXAuIEluIGFkZGl0aW9uIHRoZQ0KPiAgICogcXVlcnkgcmV0dXJu
cyBhIHNldCBvZiBjcHUgdGltZXN0YW1wcyB0aGF0IGluZGljYXRlIHdoZW4gdGhlIGNvbW1hbmQN
Cj4gICAqIHN0cmVhbWVyIGN5Y2xlIGNvdW50IHdhcyBjYXB0dXJlZC4NCj4gICAqLw0KPiBAQCAt
MzA5LDkgKzMwOSw2IEBAIHN0cnVjdCBkcm1feGVfcXVlcnlfZW5naW5lX2N5Y2xlcyB7DQo+ICAJ
ICovDQo+ICAJX191NjQgZW5naW5lX2N5Y2xlczsNCj4gIA0KPiAtCS8qKiBAZW5naW5lX2ZyZXF1
ZW5jeTogRnJlcXVlbmN5IG9mIHRoZSBlbmdpbmUgY3ljbGVzIGluIEh6LiAqLw0KPiAtCV9fdTY0
IGVuZ2luZV9mcmVxdWVuY3k7DQo+IC0NCj4gIAkvKioNCj4gIAkgKiBAY3B1X3RpbWVzdGFtcDog
Q1BVIHRpbWVzdGFtcCBpbiBucy4gVGhlIHRpbWVzdGFtcCBpcyBjYXB0dXJlZCBiZWZvcmUNCj4g
IAkgKiByZWFkaW5nIHRoZSBlbmdpbmVfY3ljbGVzIHJlZ2lzdGVyIHVzaW5nIHRoZSByZWZlcmVu
Y2UgY2xvY2tpZCBzZXQgYnkgdGhlDQo+IEBAIC0zODIsOCArMzc5LDggQEAgc3RydWN0IGRybV94
ZV9ndCB7DQo+ICAJX191MTYgdHlwZTsNCj4gIAkvKiogQGd0X2lkOiBVbmlxdWUgSUQgb2YgdGhp
cyBHVCB3aXRoaW4gdGhlIFBDSSBEZXZpY2UgKi8NCj4gIAlfX3UxNiBndF9pZDsNCj4gLQkvKiog
QGNsb2NrX2ZyZXE6IEEgY2xvY2sgZnJlcXVlbmN5IGZvciB0aW1lc3RhbXAgKi8NCj4gLQlfX3Uz
MiBjbG9ja19mcmVxOw0KPiArCS8qKiBAcmVmZXJlbmNlX2Nsb2NrOiBBIGNsb2NrIGZyZXF1ZW5j
eSBmb3IgdGltZXN0YW1wICovDQo+ICsJX191MzIgcmVmZXJlbmNlX2Nsb2NrOw0KPiAgCS8qKg0K
PiAgCSAqIEBuZWFyX21lbV9yZWdpb25zOiBCaXQgbWFzayBvZiBpbnN0YW5jZXMgZnJvbQ0KPiAg
CSAqIGRybV94ZV9xdWVyeV9tZW1fcmVnaW9ucyB0aGF0IGFyZSBuZWFyZXN0IHRvIHRoZSBjdXJy
ZW50IGVuZ2luZXMNCg0K
