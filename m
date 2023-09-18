Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7052ACD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 08:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2C910E225;
	Mon, 18 Sep 2023 08:57:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA4B10E225
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695027461; x=1726563461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GenEVA1muBX7cheEzqUZgmT5wujVhe+N0uhXXpM5X4c=;
 b=Z0hvoy1DCSY5SzQuo4QDLb+Fj8KRjQRHHGBIDCdbu2GspGhl8yZU8hK7
 s/vKrFdrK3rTvmZI7G7nvM3hAD7hgYW6bJaO7sejMwpCJQZq90WeeaTHA
 k+KCwEvdTUdRry97ZFHpi3rgB40Jd3QEBf6RmvciCDS1rUKeAGqIpa/E6
 bpuZKn9+BSi45zx/2FdyHAeUiHFgSu5xLWnA1Ct79klou+ngPZPzgLGyq
 sOjuZ7rghABf5512dVSFbeayPymGhA+zfdip9XYORmhH50fz5J/Xfe1y9
 orDSrba7qSjDlgPreLzpWw7cFc79OJ0IRD5CQQyjVfQlY/Dq9C4+zFpk0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="383425778"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="383425778"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 01:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="739042829"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="739042829"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 01:55:29 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 01:55:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 01:55:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 01:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7h6EHiTYf0mCIeKH6uKbCkjdhr4F3fq4EvjA9kxU3clOlhVHkePmxvPg07JQf/ZRpkw2lyXmvAtoqxo3+OWd2y/yY7/3pQRKklkKc9aGsybKUwPbFA+nHVR6pgmt/uifHP7TgLpjl5ZbdRK9H+arLEov/1If2uIfz3R7KYjORbJ5rQJv+R3yT7EI1Sbi2GtxzwXG//ZOweP24TLbZZttJfYP/ei8YT5hWg2t/be5i70f16XgQIW27l1mwqc+v7jc1Ak/2Nkmd46jioA9EakYlqTg691TtnP0PgIbYkuyz5EHyjQh72PinpiifQrvslKx0ezKmDJytj1H/iEMqLsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GenEVA1muBX7cheEzqUZgmT5wujVhe+N0uhXXpM5X4c=;
 b=kPZtq1wg7QWtFu+ojaqQLPKTdKctW1JBgFGfve17LpWp99vizgp1AeoyBGk8vtkYhBX5AoMuNSrBL4TxpXnWWWO7ALHwYYEvLBD1VjY3cjT0CLvGOVuPsJUNvlTq5WQgF1bqW6nxuSRuByXbL5eyVH/U+vaPA76PRdSrznNFEGgLlmBWnNjh5YAtvdDOpBaKcUel1oTqPpsR+dP4EX15t8G+p1aFLhN/bduLp3rt/oI+SuuEXfcgsGKiilCKAWvPAvd9yl8iP0TW/lnVoCgldF8WjdD7lSjot4xXLfXuRc9L12yhVaLNDBZQWD0T6WcDwATTOZ2V38mHy8vUjtLowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by MW3PR11MB4556.namprd11.prod.outlook.com (2603:10b6:303:5b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 08:55:24 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 08:55:23 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 2/2] Revert "FIXME: drm/i915: add a lot of
 includes in intel_display_power.h"
Thread-Index: AQHZ5tVNfuQD9IzUy0G7nIzgEGsL+LAgTgwA
Date: Mon, 18 Sep 2023 08:55:23 +0000
Message-ID: <ba43e6de67f38b41eff181acd9f601fba9a92f4f.camel@intel.com>
References: <20230914063211.5210-1-jouni.hogander@intel.com>
 <20230914063211.5210-3-jouni.hogander@intel.com>
In-Reply-To: <20230914063211.5210-3-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|MW3PR11MB4556:EE_
x-ms-office365-filtering-correlation-id: 1c5fc7b9-5642-4725-b60b-08dbb824fe9a
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3KdWElWfVnggDzSpXmPDtgv1azy0yZ50nK+QAs99mzSwL03Te0vkcTP6cRxHck9e35zmp0UqAFPQ9w+OFN+M7cZsFY2VWSjrAPD7xiPStjzT0NLqTgCDySnUqTe66j5YicvJOzTdbyIqkTk5mSZosXHo/7KRRoBTOZwWA/Jem0j2BHk0EmnQzTsCQ6+SmZlWlYsByXyQM0ZjiBB+NG7D90k9z4Jf6QDtndPINSPNuVSxfT53qguq9ylET352gK2/A3XhvBwZxYXEd2CBcVUAIa/8BZKaJRyJ9Ag+uIp1Do241HJ50RU3rqlRgLEZLU+YlNxywEO1lBZDhEDkY1w5XMOR9ziAusUmqDAoD8b9uK6HEuWLbXTZUGIm6qKNt3SiclMRa9DXzoqs8juJgbSY0rz5IdoO8M16AWsNIPbDyLqXZfOceSB0cs+JsrGxo9Uu4HdBSyQycNzxrv3Ss1BMHazJuqdq1ipmjE+nXqEGFqf28pJ/Qq2D5XAihtjNcbzN+k30yFaPGxd5r+DOazmvJEEVphi1YElxQMOs+PoTz4WxlYaGb/f5JZlln0ndi+l/DXREh42LAlY3KA4Iya3oa6OifO+p9cWkQfU09TPzmKNl0oOrkpUDCFMuhoTKvp6H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199024)(186009)(1800799009)(66556008)(36756003)(107886003)(26005)(2616005)(2906002)(82960400001)(4744005)(5660300002)(38070700005)(38100700002)(86362001)(4326008)(8676002)(8936002)(6636002)(122000001)(316002)(41300700001)(76116006)(66946007)(66446008)(66476007)(64756008)(478600001)(71200400001)(83380400001)(91956017)(110136005)(6486002)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlNqYWV2NXQrYmNwRnhaSmp1RE92akNoOWJLcXc2QVZRNXEzbXVVSkFyV3Ji?=
 =?utf-8?B?UjNWWDN1aFRHT29JTHk5S0NmRnY3dVdSekwzQ1NDaVh2Q0hoaS9oSXlpaHlB?=
 =?utf-8?B?UDNoU2ZQN2NLeEZRSk9PY0NQZkk0eDZMRUJZSlNHaXZCVzJvNVRWRkg4blNE?=
 =?utf-8?B?T1V0RnpkbG9jZW1rTW1tWE44VUVJWllwVWNnNnBqQnc3N2hDbEFOSDVIVEFp?=
 =?utf-8?B?bjBMWklUSjIwZEY2dVMvcUkzOFFtYjFiY3Q1RGZPSUpZRjQ0dDlRSEswdldQ?=
 =?utf-8?B?YUQyLzRZWncrK3lZeGdTdHlPYTdUWEdtL3FteU9vc04xdHdxcXkrVHFrNE8x?=
 =?utf-8?B?cXZGbTNOT3BJVUNpcmo2Qkp6Z2pmVkhSWVUwNG5pOWJocXJuNWNRRWd5OXpK?=
 =?utf-8?B?bEpDTVNwUHR3enppY2pMT2s0bG5SR0V1cWwwQnFNdmsvUTBUYm1pVjh2VllN?=
 =?utf-8?B?RnRodlFpRVJJVnp0NG0yMFdTY0JkRHNORE50aExpZDRGV1V1NzM4M2R2TjZa?=
 =?utf-8?B?QW5hTHh6VjBKUGxLQmZQQy95Q0Y2UzhPeUJTb3llZWkzeTR5WXJBSUVHN0gr?=
 =?utf-8?B?eTBuNFhseU5hQnJlb2tXdVdNS3pMMkVPay9KT29rV3dWYlhHMkhWblF1T1Fw?=
 =?utf-8?B?blFMK2Y1d0JwNlcxcGIxV09jUDBZYlFHRXBMSHVEa0ltemdUYzZ0ODMrTGN6?=
 =?utf-8?B?d0xvMDFGSTczUi9ZQ3VOSEFnaEpVazE4OWpqODlSY3ZZcUtVd1pFUVNJcy9V?=
 =?utf-8?B?WEk5WFVRYlZVcDRPbUZQM3hLVE8zVHdpbVlqSDNGUEtJQTVRWVIvSmtHMG9E?=
 =?utf-8?B?cVpMVXc2WWQ2Q0xFYThqUlNHSmVYc0pES0EzQ29RUUk5WDN4WGtXVXJoT2Fi?=
 =?utf-8?B?UlBSYTVvbUFwcytWM3ZpMFE4eTMwTXl6QXNROHhpWUREL1RobkFRQTVCQ2lh?=
 =?utf-8?B?dmlsUlJaTWVtYjMyaHYyN1BiaW55WW40dHJXOWMzb1hHcUtVYVdtYzZpeG1t?=
 =?utf-8?B?YXZTTXpPVjZyUWRhSm1aU3dVdVhtSzZOb0xPZkdhNjlWSS9KUFIvZjkvMTdH?=
 =?utf-8?B?QzIxTmJyZDMzeDA5c01QRGlzSmxvRTN3Q3dMelA4dWY0MVRVLytzWmRlcG1p?=
 =?utf-8?B?U2ZpNFNDb1BEMktBNkxySTNwR0VDbDdtMjgwSUI3ZHBnYWg0Qm5wUGdUblNs?=
 =?utf-8?B?NmIvYTVvTVE2NWhBVzVUMDY5NHNzbTNmbXhBVjFEQ0lvR2dqSEEwZDIwVVVS?=
 =?utf-8?B?M1NDT1hvVDBxbnBFWVhhdm9GK0Z5SHJVU25TUG5wZ25BVkJSM1NueFAwQ1BC?=
 =?utf-8?B?SG1pVFZWdnBoVTZWRFY3eUdXVFFjQkxyclhWdEJVeVpscGNrTHJmM0ZzV0li?=
 =?utf-8?B?SFJTa1IxV1NUTU51TnduN1d5Z2tXbHdYZVFqRFdXUVNZMXQ4eTNGL1RUT0hO?=
 =?utf-8?B?OERWMTlCU1pXSEVQdk16YnkrOC9VS1V3Tm95aGFWQmZZUFFEa2tLdk5qVTl5?=
 =?utf-8?B?dEhHZlJGRGM5N1RRaDErNzRub1U3Yk9jdnhUamtnMFFXaDFKSDlXcWZYYVVP?=
 =?utf-8?B?R21xS1BKWEJHV3E3Vjdvc0NXbWlYUS9tM2ZwMFBpUkNaVlpCeDZTR28zSkJv?=
 =?utf-8?B?MGFMY1Q0RVVJZHVBWTBCbVNOWTNreEtJMzJHK3IwNWZObkM4UVQ0dVY1TUZx?=
 =?utf-8?B?WWlnb1pzZ1A4ZHRKRFAzdkQ5czMxaC96Z2lsSWNqZStjbDR5NTd3OU1WeHg2?=
 =?utf-8?B?U3B6S2F1T2M2NmMxa2E5eURGYk4yVTU0Z3dCL3VlNHBKNGRPcGJmclRDNlNy?=
 =?utf-8?B?RVA2SHBUK1N5SUZsWGVxYWp2SUVnT2NPWlRQaEczd3RUSmY5YXdpSTJjQ1Q0?=
 =?utf-8?B?UmhKY2MrSGVCQWMrMXBoZUxmSlpwWlpZak44ZWhWUUVxWWIvcy8zSmQ5MGJ2?=
 =?utf-8?B?TTdTendkSmVRbkt4Zk81S0ZoemFvWStIeTE2VUFVa2E0akwycmZ3amdpZEFT?=
 =?utf-8?B?RmNhTzN3eUdtN3A3MDV2WWo0YjVKYkpmQjNVYmZNeENYMGJaSWJvdkRKcm5L?=
 =?utf-8?B?dTNHa01xaEphc3BXY3lDZlpmbFAyU21pd3ZGWnFMZWc3Yml5RlNtWTlyRHZO?=
 =?utf-8?B?ZE8yVDNmd2h5SW9uY1BzcXJwQVhmUlg1MS9NV0loZi9NdkRINTYwc3FRcUhW?=
 =?utf-8?Q?p0ghCfWGI6Py4WShg6+csec=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CAAA9F7B3BBBE4F82950240DC0CF738@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5fc7b9-5642-4725-b60b-08dbb824fe9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 08:55:23.2494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3mIOtrN59WOd4/PemqV7w9IoLHJ+6vYzla6q9Bi+K5o5buMVKvbBJrKBFi8nniv6ftJXb+sVSVF1HF9nPvZNTy6T6V4bK2HJSpvt5iT/Bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4556
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] Revert "FIXME: drm/i915: add a lot of
 includes in intel_display_power.h"
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

T24gVGh1LCAyMDIzLTA5LTE0IGF0IDA5OjMyICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMzA0YmFhOGMyMGNmYWQzMzBhNmM3Y2FkNDdkODYwNDNl
OTY4NjQyYy4NCj4gDQo+IFdlIGNhbiByZXZlcnQgdGhpcyBub3cgYXMgbWlzc2luZyBpbmNsdWRl
cyBhcmUgYWRkZWQgaW50bw0KPiBjb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZHJ2LmguDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNv
bT4NCj4gQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IC0t
LQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV9wb3dlci5o
IHwgNSAtLS0tLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQ0KDQpSZXZpZXdl
ZC1ieTogVmlub2QgR292aW5kYXBpbGxhaSA8dmlub2QuZ292aW5kYXBpbGxhaUBpbnRlbC5jb20+
DQoNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfcG93ZXIuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV9wb3dlci5oDQo+IGluZGV4IGI1MTQ0MmZlNTk3Ni4uZWMyYjU1NjA4NzdmIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfcG93
ZXIuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlf
cG93ZXIuaA0KPiBAQCAtMTAsMTEgKzEwLDYgQEANCj4gwqAjaW5jbHVkZSA8bGludXgvd29ya3F1
ZXVlLmg+DQo+IMKgDQo+IMKgI2luY2x1ZGUgImludGVsX3dha2VyZWYuaCINCj4gLSNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5oPg0KPiAtI2luY2x1
ZGUgPGxpbnV4L211dGV4Lmg+DQo+IC0jaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+DQo+IC0j
aW5jbHVkZSAiaW50ZWxfcnVudGltZV9wbS5oIg0KPiDCoA0KPiDCoGVudW0gYXV4X2NoOw0KPiDC
oGVudW0gcG9ydDsNCg0K
