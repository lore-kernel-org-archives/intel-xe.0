Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD8AEE7FEF
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 12:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8427210E8A3;
	Fri,  8 Sep 2023 12:47:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C273410E8A3
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694177232; x=1725713232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=gUKnWQiljJnfp+4sxdSj+NUHI7IF6nkoCmBy0bVY20Q=;
 b=dvRRfRNDQsP35qe3CYpDkpJOAImVYX+Z6VefykIhCKpxTzuO+pXaQZld
 9XtlO1T/y1KgpDlsxn1CO+d2tbvRT48z78fIcmSRLV5iCnZmUiVEWHMEY
 bnSSHPqYuPdaMTolKsl7jP3Ko/g7VNrueIatQpoa+mdeTek46+fS6ncRe
 rtkbNuipJoBSQH1tAlYwaSC3H/mpVNx92V7Ufw4E0+QpOXrsQ1/KasH0/
 obbPt8weblXyrHu+U+IoYYZHudsg0SIEMFINycv/sRu4m/pztjrl57XLX
 8flp7ywI5WowjlaJAxVhKjrpj8jhViQssP+7ViuBe3O/65A5FzpAcS3FX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="367898822"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="367898822"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 05:47:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="771739563"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="771739563"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 05:47:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 05:47:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 05:47:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 8 Sep 2023 05:47:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boQOqicRjwusvkudbkDLyXIOiG4k23uK0O4UFbULg/xvxT+IYQbUXEat1O49IXvdZ2IAceVYWptakS6Qlj3JwfbpaqHk37S3T5zz77JG1HRtnlPOWp/7gVQlsr5Q/+VflNb8mIW5nzXr7h+ccT3mKuKTT6eZHokGrK6OZ8tyMwM+KnMkmVC3p2XhqHD1s3SM7gs6eexqpJBu3RAMTIndF+x16ofQHZB1AlmDv+O7S+R54awwslhgMbAZi+gdKm5MV/rWDmiVrpztXTLKIANUO/UhTlRvPeWgfZtPULRRP/CjwTk0RxJO+lhNpZv+O8bh6abINf4Zd/5zZMbtxhSBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUKnWQiljJnfp+4sxdSj+NUHI7IF6nkoCmBy0bVY20Q=;
 b=HVhxtnvziQVxOaUH3KHcWQ8559HEeDw6yBRnS51WXw0YsWIuxU5KhI+vJVp8fC2rEe5O47L82IEnZJNBceUNt23cCPdZzpNhtKpY6b3bJ+773ybfj5qqvWCY8BqeodR5ehoNhgMpZR/GVd4DkOJ4ZnRuBhiXDTeLdWciM9R8ACkxwFJZADM+vntlUXolkG5j+5TUrUF+ezI1puPabgFbfJF8T9/yR6bmecvWMRPJQXMTbAhhhIgnxwOv2WDV+FNuQ8xhbIkthfA9PumXlSW7bdbjcsBoCAY8qbazf1p1XWj0H2nOTm3qWexLvEfcDYA1FV2Mhu9vbu4Y7DHVOEKZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB6358.namprd11.prod.outlook.com (2603:10b6:8:b7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 12:47:08 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 12:47:08 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "faith@gfxstrand.net" <faith@gfxstrand.net>
Thread-Topic: [PATCH] drm/xe: Extend drm_xe_vm_bind_op
Thread-Index: AQHZ3z7z2gLyLaezKEuNRE/XOOdAAbAODfMAgAFYU4CAAISVgIAAsH0AgABLToA=
Date: Fri, 8 Sep 2023 12:47:08 +0000
Message-ID: <920ec9b8e8aa475b749d03b7df295d8402ddcff4.camel@intel.com>
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
 <20230904144644.3259148-1-mika.kuoppala@linux.intel.com>
 <ZPi0gnYZlMk6mD2d@intel.com> <87zg1yay7a.fsf@mkuoppal-desk>
 <ZPpEkR47cLTO9NH0@intel.com>
 <169416105435.18944.2863510374468750259@jlahtine-mobl.ger.corp.intel.com>
In-Reply-To: <169416105435.18944.2863510374468750259@jlahtine-mobl.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB6358:EE_
x-ms-office365-filtering-correlation-id: 6c82b92a-f177-4c2a-8703-08dbb069b66c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UwnD7Mwb3smwLEM3nsRSUZRfjaiVCbyYSVgOmvUd8SEZeCl3EVzYI4/rjmpuhADv3SlOyuO6lVfPCUXNSHafI6oE3Yiz2EvBZe9WiONWVJKpnE2AtJsPL7aUs8wcrtFgbh8iXVGYL73F4Vw7HEV82hbpHWti9xQa6WHs7+l3gEX7YbAzJ/bGJGyQHKUrHuR85t0LEo1xNq8VfUsBtdC4rz0pi0gsykBMAvuyrgIS1ec4ndWOlCR/qE57M9V4ogQ5cL3aTz6aI/ByLKPyU8s8wJI6EE9/s9YtbSUHtiLGv60kA+aVDMopj5g3xzBV+vleAPNDkNsSVupJME/SjZmuKxl/34VQrZJKepT/B71pXD4tglYx4uN8vG32bEfMx61Cq3lRUUrmunJa5jtHsD865ygp0/ib5x2oYLMjXaf90pK6LhPJXglUNUgim22O/AwA89lyx6IkLKBqC506mGFMQocHxcy4mApTh6gOkYKny0M2qqMNWKFAM2J1mUUBf6DjqqlZrADhUfmjXgRl5hjBFX8drSUivgjp5TAQ4QeiZq4EXJkF/mCtbPQ41l7TbnwVTN4EeOpVGm60HM3ojHDgBvay7+WpeeKx2ISkZtj2YCL409XCF/O7OyuARk969GWd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199024)(186009)(1800799009)(8936002)(478600001)(8676002)(4326008)(66446008)(66476007)(110136005)(76116006)(66556008)(66946007)(91956017)(5660300002)(71200400001)(41300700001)(2906002)(64756008)(316002)(86362001)(54906003)(6486002)(6506007)(6512007)(26005)(82960400001)(2616005)(122000001)(38100700002)(38070700005)(66899024)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk5USEJzOFZNMUd4Y21FQjBZcWcvTkkrVWdCNnNjMG1IWnFZTmlRcE54SXY4?=
 =?utf-8?B?Tk9zTFl4K1B4MDlBazcrZGY3c0JFdFk0TytPNE0rbHRMeGNxSU1RZ3k1b2xS?=
 =?utf-8?B?dzVLZ2s2S21vNjh1U2o3Y2hrdWdhMENmcTlCZ29QL20vc3RIT3RpYy9zbXkx?=
 =?utf-8?B?d21HR2kxbWJEZW9jRU1oU2hLa2NYTEh5M1I5Ymd2VndzSVhMekVhU0ErelVq?=
 =?utf-8?B?TS9MTm41cENrajI2dGJ4T1Z1a1k0VnFNZy9Nd1FDa3ZWYzI0UHZXSUs0UUxW?=
 =?utf-8?B?U3VwN25TNTVMeVlScmhxZWI1cXJZYWF1T2pSaGkxOWIrenZ1dnVITzlITWZX?=
 =?utf-8?B?TW5Mazl0TEdJdG80MFpBa2NNdXgxdjZHZlNrSmpUY0F0T3A0T083REJEVSty?=
 =?utf-8?B?MldpQUF0NjdvVTkrTE1Falc4N2l1em95ZlUzYlhFdkZYN1Z6SHVQY1NHbHFP?=
 =?utf-8?B?dTdpcW1sOUNzV0xhZnJpb0FlVmxHUER2NkNVSlltRFJ4QUY5SDZTenJGUHkx?=
 =?utf-8?B?ZTQ4NW00N0tjMWZqZmRVQ2FKeUpnelA4ZjVCOGpYV1czQm1oeGZNWHBXWDZs?=
 =?utf-8?B?aFRZV1ErMVJwSklReXlhVmRqeEhTMmM4b3NUQzc5dDBoOVliVlBkSC9pWkVR?=
 =?utf-8?B?K0Rsc0djU0dYVUNLeGZVejN3WFRIVWc3VXJqaDVqeTVIRElURnFHOUsyNkJr?=
 =?utf-8?B?aFBVeExaSzFlckk4ZFBkQXVMbS9iTjlIbFBrdDYzbml6ek81UnVaZzkvRUhM?=
 =?utf-8?B?TlNvMlArV3dYTGJqTksrVy9VUjNMa25heE5DcUtwSXpKYms2RU10QThKc1pJ?=
 =?utf-8?B?S0FxNUIxN0JheFZBdUdJQ2J2ZElnWk0weUNKdlFnRGhIYVNVYXRNQk9IamlI?=
 =?utf-8?B?OXMvc05DYjU0dEtkeUxYc0dFTSsvamVHRTYzVlUxdmVMa0tMbm9BZ1dBL1lN?=
 =?utf-8?B?aFRKS2JUTzkzeUhYSk5lS0lrUFF2dDlHcS83ZjFqaFovSWhrNUJFMmZubkY2?=
 =?utf-8?B?WDZSOEdUMTNNS3ZKU0hEQ2Z2N2R3bjF5S1lSeTRkK25RRHEvS0VEL0k3K0dt?=
 =?utf-8?B?QmFRc2x0QlJvcXFUMyt0Umw2ODR3SFY0ZWFXVkMrYmw4NzBubWIwUzR4ZXky?=
 =?utf-8?B?ZFA5VDNhb2hvRzBGVk96ekJMK3hiR0x2ZVJVZUZPdExWUVFnUmlkOUhVZERm?=
 =?utf-8?B?eURlZzBWdTVxcUhNRXZON1N3K0RtbEZDUDNqdGR6MDFpaXh4UHorT3htL1c4?=
 =?utf-8?B?MXZWVTIrNk9KK3IzU2VRMFhOYjdnR2hsRW1nVE9UOWs1Z1BJTHlwVlZGZ002?=
 =?utf-8?B?dDE5NDJCWDZoRnQ2QUR3R3l2S2F3Ly9wOG9idDVWT2lVWmxMbXN4N2dtZEhx?=
 =?utf-8?B?dFY4aEt2SzVmY1R3ZGRoelZlbmVZM0dwb2RQa2NqQlZmRHROT290cUV2MldG?=
 =?utf-8?B?bVVmUVg3em43TUF4MC9JWWptbHVBbmJsMmxtQVBDK1phOUVMcDlkVjBac3JJ?=
 =?utf-8?B?QzhKTVBSVmdmYjRoTDhtbFZwcnhHenpMaG41MFR2N0p5a1pRalBMUkNOZ2d4?=
 =?utf-8?B?NVp6YkpUOEZWdWZ0Z2Z5MjhZcEU4amdreG90QVJmUnFvRlQvTUgrVVdkblBW?=
 =?utf-8?B?U1NyNDFsWGNhRFo0T2d3QXQ2UWxBbGVwc1cxOC9DQ1crZzBQZ3V3Qkl2MHlT?=
 =?utf-8?B?YUkwWGlzNmlva0JWa0huR25nWkNCYnZxS2p4WURqcUpvcEZIMzE4RG05WTBS?=
 =?utf-8?B?ZGZIdDRmR2g1NWdlNHZtSitaNUY5NUN2dTQyQ2RBaTNxaC94UVR4dHFqNC9T?=
 =?utf-8?B?V1FNa01xY1B0R01sRWJLMnVNbWp6R29iNDBBUEJVajBMa20rS2dSaHQveThV?=
 =?utf-8?B?TkpNenZXb2NuZGdISGZOdEVudm1kMmtFRkhsYWdFQXRCS3M5dEp0aGN4QzFh?=
 =?utf-8?B?N1FZWk1rWllDc3Vra1BKTHFVTkZoYkRyalV0LzZocTBJUm1kU0xrNmUyRTBn?=
 =?utf-8?B?TERrcTBRaW9IanREbnM0ZWl3NUltVmwxSFhtbldERlZpSUp3NTQ3Mmh1Snpx?=
 =?utf-8?B?WXExMHNVQTJZVTBJckZsME1SUDlsdlNBVFI3NENMU1RlalphQWw4UVRUK1Br?=
 =?utf-8?B?RjB6Tjh6OVUzS1lXZFlibjUzeU5CcUJHalF4ZUcybWd5YzdKZzBFa2RTQ2Fm?=
 =?utf-8?B?MHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE47AD85C796F54CB564CE7925795B96@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c82b92a-f177-4c2a-8703-08dbb069b66c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2023 12:47:08.1334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s9uDvDgn9Z+qGNtiykKYpj8a2EFjjXnTF7C/57o90MJh6TYZkAHflrIAPEp5id5h5PcJumSxumDjn29kY2wgnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6358
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: "paulo.zanoni@intel.com" <paulo.zanoni@intel.com>, "Dugast,
 Francois" <francois.dugast@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA5LTA4IGF0IDExOjE3ICswMzAwLCBKb29uYXMgTGFodGluZW4gd3JvdGU6
DQo+ICgrIFRob21hcyB3aG8gdGhpcyB3YXMgZGlzY3Vzc2VkIHdpdGggYW5kIEZhaXRoIGZvciBv
cmlnaW5hbA0KPiByZWFzb25pbmcgZm9yIG9wW10pDQo+IA0KPiBUb3AtcG9zdGluZyB0byBkaXNj
dXNzIHRoZSBhbHRlcm5hdGl2ZSBvZiBoYXZpbmcgYSBzaW5nbGUgVk1fQklORCBwZXINCj4gb3Bl
cmF0aW9uIGluc3RlYWQgb2YgYXJyYXkgb2Ygb3BlcmF0aW9ucy4NCj4gDQo+IFRob21hcyBpcyB3
b3JraW5nIG9uIHRoZSBmZWF0dXJlIG9mIHJldHVybmluZyBhbiBlcnJvciBmcm9tIHRoZQ0KPiBt
aWRkbGUNCj4gb2YgdGhlIG9wW10gYXJyYXkgdG8gdGhlIHVzZXJzcGFjZSBhbmQgdW5yb2xsaW5n
IHRoZSBvcGVyYXRpb25zIHBsdXMNCj4gLUVJTlRSDQo+IGhhbmRsaW5nIGJlY2FtZSB1bmRlciBk
aXNjdXNzaW9uLg0KPiANCj4gV2l0aCB0aGUgYWRkaXRpb24gb2YgZGVidWcgbWV0YWRhdGEgcGVy
IG9wIChha2EuIHBlciB2bWEpIHRoZQ0KPiB1bnJvbGxpbmcgYW5kDQo+IC1FSU5UUiBoYW5kbGlu
ZyB3aWxsIGJlY29tZSBmdXJ0aGVyIGNvbXBsZXguDQo+IA0KPiBXb3VsZCB0aGVyZSBiZSBhIG1l
YXN1cmFibGUgcGVyZm9ybWFuY2UgaXNzdWUgaWYgd2Ugd291bGQgc2ltcGxpZnkNCj4gYW5kDQo+
IGp1c3QgdG8gZG8gVk1fQklORChvcClbXSBpbnN0ZWFkIG9mIFZNX0JJTkQob3BbXSk/DQo+IA0K
PiBVbnJvbGxpbmcgd291bGQgYmUgbXVjaCBlYXNpZXIgYW5kIHRoZXJlIHdvdWxkIGJlIG5vIG5l
ZWQgZm9yIGNvbXBsZXgNCj4gZXJyb3INCj4gcmV0dXJuaW5nIHNjaGVtZS4gVGhlIEdQVVZBIG9w
ZXJhdGlvbiBtYXkgc3RpbGwgc3BsaXQgaW50byBtYXhpbXVtIDMNCj4gc2VwYXJhdGUNCj4gb3Bz
IGJ1dCB0aGUgcmVzdCBvZiB0aGUgdW5yb2xsaW5nIGxpa2UgbWV0YWRhdGEgd291bGQgbmVlZCB0
byBiZSBvbmx5DQo+IGRlYWx0IHdpdGggb25jZS4NCg0KQ2M6IFBhdWxvIGFuZCBKb3NlDQoNCj4g
DQo+IFJlZ2FyZHMsIEpvb25hcw0KPiANCj4gUXVvdGluZyBSb2RyaWdvIFZpdmkgKDIwMjMtMDkt
MDggMDA6NDU6NTMpDQo+ID4gT24gVGh1LCBTZXAgMDcsIDIwMjMgYXQgMDQ6NTE6MjFQTSArMDMw
MCwgTWlrYSBLdW9wcGFsYSB3cm90ZToNCj4gPiA+IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4gd3JpdGVzOg0KPiA+ID4gDQo+ID4gPiA+IE9uIE1vbiwgU2VwIDA0LCAyMDIz
IGF0IDA1OjQ2OjQ0UE0gKzAzMDAsIE1pa2EgS3VvcHBhbGEgd3JvdGU6DQo+ID4gPiA+ID4gVGhl
IGJpbmQgYXBpIGlzIGV4dGVuc2libGUgYnV0IGZvciBhIHNpbmdsZSBiaW5kIG9wLCB0aGVyZQ0K
PiA+ID4gPiA+IGlzIG5vdCBhIG1lY2hhbmlzbSB0byBleHRlbmQuIEFkZCBleHRlbnNpb25zIGZp
ZWxkIHRvDQo+ID4gPiA+ID4gc3RydWN0IGRybV94ZV92bV9iaW5kX29wLg0KPiA+ID4gPiANCj4g
PiA+ID4gQnV0IHdoeSB3b3VsZCB5b3Ugd2FudCB0byBleHRlbmQgdGhlIG9wZXJhdGlvbj8NCj4g
PiA+ID4gRXhjZXB0IGZvciB0aGUgZGVzdHJveSBvbmVzLCBldmVyeSBpb2N0bCBpdHNlbGYgaXMg
ZXh0ZW5zaWJsZS4NCj4gPiA+ID4gDQo+ID4gPiA+IFNvLCBEUk1fSU9DVExfWEVfVk1fQklORCBp
cyBleHRlbnNpYmxlLiBXaHkgd291bGQgd2UgbmVlZCB0bw0KPiA+ID4gPiBnZXQNCj4gPiA+ID4g
cHJlcGFyZWQgdG8gZXh0ZW5kIHRoZSBvcGVyYXRpb25zIHRoZW1zZWx2ZXM/IEFuZCBpZiB3ZSBl
eHRlbmQNCj4gPiA+ID4gdGhlIG9wZXJhdGlvbiwgd2hhdCB0byBkbyB3aXRoIHRoZSBleHRlbnNp
b24gYXQgdGhlIGlvY3RsDQo+ID4gPiA+IGxldmVsPw0KPiA+ID4gPiB3aGljaCBvbmUgaGFzIHBy
ZWNlZGVuY2U/IGhvdyB0byBvcmdhbml6ZSB0aGF0Pw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4g
VGhlIGludGVudCBpcyB0byBwYXNzIGRlYnVnZ2VyIG1ldGFkYXRhIGFzIHBhcnQgb2YgcGFydGlj
dWxhcg0KPiA+ID4gdm0gYmluZCBvcGVyYXRpb24uIEZvciBleGFtcGxlIG9uIE1BUCwgd2UgY291
bGQgYXNzb2NpYXRlDQo+ID4gPiBFTEYvSVNBIChyZWxldmFudCBwYXJ0cykgYXMgbWV0YWRhdGEg
Zm9yIHRoaXMgYmluZCByYW5nZS4NCj4gPiA+IA0KPiA+ID4gU28gaW4gdmVjdG9yIG9mIGJpbmRz
LCB3ZSB3YW50IHRvIHRhZyBzcGVjaWZpYyBvbmUgbWFwIChpbg0KPiA+ID4gYmV0d2VlbikNCj4g
PiA+IHdpdGggZGVidWdnZXIgbWV0YWRhdGEuDQo+ID4gPiANCj4gPiA+IFdpdGggZXh0ZW5kaW5n
IHRoZSBYRV9WTV9CSU5EIGl0c2VsZiwgdGhpcyBjb3VsZCBiZSBwb3NzaWJsZSB0b28NCj4gPiA+
IGJ1dCB3b3VsZCB0aGVuIG5lZWQgdG8gZGVsaXZlciBpbmRleCBpbnRvIHRoZSB2ZWN0b3IgaW5z
dGVhZA0KPiA+ID4gb2YgY2FycnlpbmcgdGhlIG1ldGFkYXRhIGFzIHBhcnQgb2YgcGVyIG9wZXJh
dGlvbi4NCj4gPiA+IEFzIGF0bGVhc3QgaW4gdGhpcyBleGFtcGxlLCB0aGUgZXh0ZW5zaW9uIGlz
IGhlYXZpbHkgdGllZA0KPiA+ID4gaW50byBwYXJ0aWN1bGFyIE9QIChtYXApLg0KPiA+ID4gDQo+
ID4gPiBJIHRha2UgdGhhdCB5b3UgbWVhbiBwcmVjZWRlbmNlIG9mIFZNX0JJTkQgdnMgYmluZCBv
cD8NCj4gPiA+IEV4Y2VsbGVudCBxdWVzdGlvbiBhbmQgSSBkb250IGtub3cgYWxsIHRoZSB1c2Ug
Y2FzZXMgdGhlDQo+ID4gPiB2bV9iaW5kIGhhdmUgdG8gY2F0ZXIuIFNvIEkgY2FuIG9ubHkgcmVm
ZXIgdG8gZXhhbXBsZSBhYm92ZSwNCj4gPiA+IFZNX0JJTkQgZXh0ZW5zaW9ucyB3b3VsZCBiZSBv
bmx5IGluIHNjb3BlIHRvIGFsbCBvcGVyYXRpb25zDQo+ID4gPiBhbmQgdm1fYmluZF9vcCBleHRl
bnNpb25zIHdvdWxkIGJlIHRpZ2h0bHkgY291cGxlZCB0byBwZXINCj4gPiA+IG9wZXJhdGlvbiBv
bmx5Lg0KPiA+IA0KPiA+IFNvLCBtYXliZSB3ZSBzaG91bGQgZG8gdGhlIHNhbWUgdW5pb24gdGhh
dCB3ZSBkbyB3aXRoIHRoZQ0KPiA+IG9wcyB0aGVtc2VsdmVzIGFuZCBtYWtlIHRoZSBleHRlbnNp
b24gYWxzbyBhbiBhcnJheSBvZiBudW1fYmluZHMgPw0KPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGFu
a3MgZm9yIGZlZWRiYWNrIQ0KPiA+ID4gLU1pa2ENCj4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gPiA+ID4g
Q2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+ID4gPiA+IENj
OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPiA+ID4gPiBD
YzogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiA+ID4gPiA+
IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+DQo+
ID4gPiA+ID4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVs
LmNvbT4NCj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3Bw
YWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiDCoGluY2x1ZGUv
dWFwaS9kcm0veGVfZHJtLmggfCAzICsrKw0KPiA+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+ID4gYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5o
DQo+ID4gPiA+ID4gaW5kZXggODZmMTZkNTBlOWNjLi41YzZjODZmNWU1ZmMgMTAwNjQ0DQo+ID4g
PiA+ID4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiA+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gPiA+ID4gPiBAQCAtNTUyLDYgKzU1Miw5IEBAIHN0
cnVjdCBkcm1feGVfdm1fZGVzdHJveSB7DQo+ID4gPiA+ID4gwqB9Ow0KPiA+ID4gPiA+IMKgDQo+
ID4gPiA+ID4gwqBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmRfb3Agew0KPiA+ID4gPiA+ICvCoCAvKiog
QGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmDQo+
ID4gPiA+ID4gYW55ICovDQo+ID4gPiA+ID4gK8KgIF9fdTY0IGV4dGVuc2lvbnM7DQo+ID4gPiA+
ID4gKw0KPiA+ID4gPiA+IMKgwqAgLyoqDQo+ID4gPiA+ID4gwqDCoMKgICogQG9iajogR0VNIG9i
amVjdCB0byBvcGVyYXRlIG9uLCBNQlogZm9yIE1BUF9VU0VSUFRSLA0KPiA+ID4gPiA+IE1CWiBm
b3IgVU5NQVANCj4gPiA+ID4gPiDCoMKgwqAgKi8NCj4gPiA+ID4gPiAtLSANCj4gPiA+ID4gPiAy
LjM0LjENCj4gPiA+ID4gPiANCg0K
