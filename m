Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E06C001DC
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jul 2023 20:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079D810E6F4;
	Fri, 21 Jul 2023 20:35:06 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383E889065
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jul 2023 20:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689971704; x=1721507704;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=IusoGBBcJXjRyZS0vPogKVcj2aiMxOpj3I4AQJsnM5o=;
 b=dYgaotdWq4e7m7MRQjgK5DkRld7IML36HaGaZFreYGfl64aEAArFb1fx
 UZ+OCT6l8oq4uk8Ri1MvK889OWQtnEHA7M4CvFQsn7LFra9mBd+2cUXHD
 4SNaoG/bISmm+CPMtM2KmZlGNPZpaZYDI8xTCQKb5RkBhmAWcoy6WZnmh
 bf3Og9d4m8SkXyee9eu94EaaYEYKGqtH9oiQl5dKAi2v+pE50cK6uJfs+
 MGb9vRI3aalgKPSzfZjEP+JkuYHT6aA6icNfIb+qFOz63xhtHf23QpEnw
 WX2n1QuZt/sm1vhz3sOVYZKay7azk2zzlfhFRx4HI4sVTZUIVr41nyZt5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="430906329"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="430906329"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 13:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="971552817"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="971552817"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 21 Jul 2023 13:35:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:35:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 13:35:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 13:35:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 13:35:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmGbCyf6UlHcdqwPUYXvhhN86Tn+itHL34seC+tvQOb+ESBhRbTzJL4620Z8yErDP6JZursxTfmmLkVrobzaz6bNI6r0qWbt7d1QYdzfnVzWoVp96sxGlvylgF8nOK3YblFLpBTjXJ5aNDxlcIhNTsVJf6YwvNIAWf+Cmj8gIWSZwO9gfVxS7JYdzjXD8lRcg6+p1B1p3P4rWBb+QZtnJvARbalNoEJWxubj+75vablMRIE+BBtfQbet+1zKuedhvfnOhoMrpNyMoV2O0ItoBW63owIlTCQOU5naVskzyYVStifdlBYeglWN1zcYVt5i1kTTSPi51cNU3vmbA/YDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IusoGBBcJXjRyZS0vPogKVcj2aiMxOpj3I4AQJsnM5o=;
 b=CENPaAiO/QoutGf6f+k/lemPvjjP/mVREU7ruqKV8HlcvHmsqfQK7B1DfULDBKluQTMYIrL3N9nXMf33tWCVVE7oNkqVQ3xUwcbgh0vAB1WdJ1TqfM6vBrJZY41GHiFtdlaRi0BS1QO82RHf2rCFvJQ/Jf46Eqpz2PMERp2oyTqAGe8VbBDGASdGTvsNrxRZJAL3XAzaEqdAEjVMuMw+T8HjN5Of7m95WmGA+5bsxlg6wevH10VZ1DkSSYELi3zOBZoTxUQi/T/8NBv1tmyrtaWSPgCWRQvvGXaQiCPRKwyLq4z1QUAn+UYBITvgWIqehnIKF9enM66Z7RAwvinF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Fri, 21 Jul
 2023 20:34:57 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 20:34:57 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/3] drm/xe/uapi: Remove
 XE_QUERY_CONFIG_FLAGS_USE_GUC
Thread-Index: AQHZvBEGp6Y+M1rSGE+5R00cPt5nlK/ErXoA
Date: Fri, 21 Jul 2023 20:34:57 +0000
Message-ID: <dca195f660ec08dbcb5a181543d56c03280c3bc6.camel@intel.com>
References: <20230721202144.269837-1-rodrigo.vivi@intel.com>
 <20230721202144.269837-2-rodrigo.vivi@intel.com>
In-Reply-To: <20230721202144.269837-2-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|LV3PR11MB8554:EE_
x-ms-office365-filtering-correlation-id: 5b749c3e-f044-4fbe-6578-08db8a29f2ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sHJhdZK5O8n5h0GqktmmYlQcTmg0nmDnc6dbzoYi+sNKGXPgTZ961VVPrFSeypL2XkhFk9e57xLArtQGPubNR7h0yN3imzzyfvJDu4GEgx6eWnQZfC+FYqHZwNJIVEizOodroZ/pg/E7m+bQABGPJ8ZBp7UcchNEi8VBT6633koJIlxQDUFnLOK4QXbYggSI8/gpqQueMe/370B3pqenHbU7LHUqv8SVtCFRggJE7EykmV3YbLfq7Ec4j7+BwnC1KhCpXoiUTpf7+YmRZzeiqieIZdCVEOcw+b/l+dBq2Zh+eBz0L2KJtUI/6l7FznhaBI8g0QVAH/vlWj4ABEhJAyq8xFIZNMteXZDxGSiDJ8xqyvvxdC6mZh3dp4w22nMrbu03ZrauUpZDj24qZqyBaI6EwZA9YXYCkbLjdKes5K6lN8cWU50uG/8LJud34S9SOYEs9r7PZoUhQ8xTnubdc0q1hY4TVI9FCBwoJgY1HUHJSCo4+8OPp0qFMM+tSvad/iD4dVy6aNUqrYysIuFk1KD9X1DjaDsoIdw1IWVhB+utn5JbDxrC1X1/difFLrjxQmuMZCtLIHuMCeiiNAD897LfDZbuX71+7mU94xxsuk0OIzJbTMpllUXHIm6BWh+r
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(6512007)(6636002)(478600001)(71200400001)(64756008)(316002)(36756003)(66476007)(41300700001)(66556008)(38070700005)(66946007)(6486002)(110136005)(86362001)(76116006)(66446008)(186003)(38100700002)(83380400001)(82960400001)(2616005)(91956017)(122000001)(8936002)(2906002)(8676002)(5660300002)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzJCMDEvYUVwUzNpSG5vR01xcHlvcCs4MjJxcHNHekZsaE9JS2FabEswUGN5?=
 =?utf-8?B?ZHY0d0Q4NU1CRFp2UFp1bDdpNDdqTEdLK1JBNWpxcjQ4cXFENnVCVWF1TVhZ?=
 =?utf-8?B?T0NXcm9kamx6cnFVNTg4MWpSTzYzcWQxamNEK2Q1enF4NG9hYzVOeDRYVmlD?=
 =?utf-8?B?cDZWTGh1K2ZtNFVvUWJDbllORFppTEd3NnJPa2pObEQvNEdhS3A5MGVlQlEy?=
 =?utf-8?B?d2R3TFZKZ1I2RzJ6Uk4zODhPbVl0THA1VXRPa3BtaHFXMy85K0pDMGUzaWFO?=
 =?utf-8?B?c25ESUhvZ3dZZ3R0NFp4RHIveVBRcmZRSDdOQXlpWXBWVWhWVTA5TWVFWTNE?=
 =?utf-8?B?QkV6VUdObUZrMGkxV25jWEpTb3ZVa1pTZlRVaTZpdjNCOE1RbnlSSXM5dHVh?=
 =?utf-8?B?ZVE5ekFPd2JFMVQwTXN1OW8vYm4wcnBHdVo2bjdVd09FOEUrODBLRFFPQW11?=
 =?utf-8?B?b1ZTd282STVEZDVNVk5CcGo2VnRyRU8wY0M3T0NxMmp5ZEhqdm9Oend6NXlh?=
 =?utf-8?B?clJ5R1ZWczhLL2c4T2ZQQWFnYWlBSlVWUUpWVUhDSEpYK0hBd2dCWTdqaDZB?=
 =?utf-8?B?dithOFJCcDNpZHRtNFdvMVhZZy9oMmVXSDZyR0tOc3lNamZ2VzRSaUxtWVJO?=
 =?utf-8?B?ZVZmNVFEWi9Gd1NpZjQ3Wlp1YjFyMEtoUC9pdWlWMGRBM2libVhrejlueEJI?=
 =?utf-8?B?QnNDZG1ER2NTU1hmbTgwOVhNVVhHb09tajhhQ1VyNnZ2RlQ3WW13YThFNTZE?=
 =?utf-8?B?RENrYnM2bWV5OHdGU0Y2R21RUnVtYURFNzFLdXpOdGd0TGF3MXN6c1Q4VTQv?=
 =?utf-8?B?K1h3Z1QwN1YzUTg2cHZYakoyUzFtMDBaNllFZHpwY2JOYmQvV09XMGhQWHN2?=
 =?utf-8?B?azd2QWFZU0ZxQ1MvaUJBNGhuZ2hqVXRXV0lBZGdxNDBxZklqamV4ZDQ2UzhH?=
 =?utf-8?B?dTBzb28yRUNJQ0RQQjV3NjNXVnArKzB3OG54eVlRODc2clhZVERPbGdFcGo1?=
 =?utf-8?B?VDJZdmVuVUVTelhoNHJmYjB5UUlCZnpCTWlYVnJ0eHhTWkNvZ3loN0Z4c052?=
 =?utf-8?B?SkpET2xMcDFCYkM2SWc2KzVBWGFYc1dkcVRHNEgvbnYzMGZDWnpFN0k2aWdN?=
 =?utf-8?B?QUtYZ3JaU1hmdUdMVFJOWGNpV3BEL3ZmWFFhaDZML0hIYzdqR3JHOTMrY0w0?=
 =?utf-8?B?TEdERjJpVVgrNlNmb2srdFVYTktiYy9ENDEzZStPTWJEcG03a0xGU1NMOUZL?=
 =?utf-8?B?NjlaTUNVZDdQMndYdzJQbFJqdzFrR3NsWm1FVGJXanRhTGJlaTlDT2hvNCtj?=
 =?utf-8?B?bFFBU1g3YmNRUE5vSHh4bElnWXc1bU9GUHhGY2l4OU5HMVNqTVh3K0pmYTYz?=
 =?utf-8?B?WTJWY05zakNMZDBkbkIreHJCcmVwY1JVdGlKOEtMM3VDSUNtMXp0REpscDQ3?=
 =?utf-8?B?NDk1cVBLVHBaSkFvbWhCWjF4eURyQkVYUE9jVm55OG9pYVplRnJDTEdxWUxi?=
 =?utf-8?B?SUU2NWNRWk1RbzQ1bVgwQy9BeStmZThmWnlSSWRRQ3lWbVVRS1YybDJ5QVBN?=
 =?utf-8?B?bm9yK1I0RHVKOXZ6M0dpVkd3RTdIbWNBNzlIVlErQzVkMGhIeXpJYnpmZUZF?=
 =?utf-8?B?SGNsMUdNczZJK1ZiWERsSkU2c1Bhd1prS1RCakhBU2hNSEdqTStveHl1SEFK?=
 =?utf-8?B?U05LN3AyODF0MDVKeWN4V25paG5SL1RITE9lVDkwRDRzd2x1U3VYSXMyZGxo?=
 =?utf-8?B?SXFIT25pNGtkeVExSHBpQU9QazFXSUc1SGwvbnJ5TzZ5QkJaTVo0eC9IVmc0?=
 =?utf-8?B?SDB3YXdzWThwdnNkdEp6bXdNcUprUzNYOWdJcklKZ0hmeE5vM0J5MzZmanl2?=
 =?utf-8?B?bDBSdVdVK1ZudDlaNHN0dHhEbko3UmY4dmprazFhL2c5b3JaL0VxY3RlbVpq?=
 =?utf-8?B?ZWlnM1UrRWN2SlBYU21SZzNjcmU3K2owY3lTcktReE5ERUM0THdNdHlHb0c4?=
 =?utf-8?B?cEVVb1lNSDRiYlRIOGoxZGJQSzI5RGl3V0JPVi8zOHN4TmRodTB6cUFDNmU3?=
 =?utf-8?B?L2N3aWRMa3FBaVhSdnVIWG9KS3c5TXVKaFBuazRNVlBKNU05Q01RcVFyY0RJ?=
 =?utf-8?B?YmdzYnlCM2t0MW9YN3JtZU1vc1QrZ2N0cjdDUVMxM2VoMVR6RjlaTTBVVkRl?=
 =?utf-8?B?NVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24162EBA410D28438628E9926A323ADD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b749c3e-f044-4fbe-6578-08db8a29f2ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 20:34:57.2125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mmNL5HcQjtHk4XUcuYvVLySXSOYtNd0iZ/8gsfZgdcya/GF8GSEBky0whgj7B7tDDjAqeFOndhPmelr+1P+nLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/uapi: Remove
 XE_QUERY_CONFIG_FLAGS_USE_GUC
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

T24gRnJpLCAyMDIzLTA3LTIxIGF0IDE2OjE5IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IFRoaXMgY29uZmlnIGlzIHRoZSBvbmx5IHJlYWwgb25lLiBJZiBleGVjbGlzdCByZW1haW5zIGlu
IHRoZQ0KPiBjb2RlIGl0IHdpbGwgZm9yZXZlciBiZSBleHBlcmltZW50YWwgYW5kIHdlIHNob3Vs
ZG4ndCBtYWludGFpbg0KPiBhbiB1YXBpIGxpa2UgdGhhdCBmb3IgdGhhdCBleHBlcmltZW50YWwg
cGllY2Ugb2YgY29kZSB0aGF0DQo+IHNob3VsZCBuZXZlciBiZSB1c2VkIGJ5IHJlYWwgdXNlcnMu
DQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVs
LmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgMyAt
LS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggICAgIHwgMSAtDQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiBpbmRleCBm
ODgwYzlhZjE2NTEuLjU2NDQwYTI3ZGRiYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3F1ZXJ5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4g
QEAgLTE5MSw5ICsxOTEsNiBAQCBzdGF0aWMgaW50IHF1ZXJ5X2NvbmZpZyhzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5KQ0KPiAgCWlmICh4ZV9k
ZXZpY2VfZ2V0X3Jvb3RfdGlsZSh4ZSktPm1lbS52cmFtLnVzYWJsZV9zaXplKQ0KPiAgCQljb25m
aWctPmluZm9bWEVfUVVFUllfQ09ORklHX0ZMQUdTXSA9DQo+ICAJCQlYRV9RVUVSWV9DT05GSUdf
RkxBR1NfSEFTX1ZSQU07DQo+IC0JaWYgKHhlLT5pbmZvLmVuYWJsZV9ndWMpDQo+IC0JCWNvbmZp
Zy0+aW5mb1tYRV9RVUVSWV9DT05GSUdfRkxBR1NdIHw9DQo+IC0JCQlYRV9RVUVSWV9DT05GSUdf
RkxBR1NfVVNFX0dVQzsNCj4gIAljb25maWctPmluZm9bWEVfUVVFUllfQ09ORklHX01JTl9BTElH
TkVNRU5UXSA9DQo+ICAJCXhlLT5pbmZvLnZyYW1fZmxhZ3MgJiBYRV9WUkFNX0ZMQUdTX05FRUQ2
NEsgPyBTWl82NEsgOiBTWl80SzsNCj4gIAljb25maWctPmluZm9bWEVfUVVFUllfQ09ORklHX1ZB
X0JJVFNdID0gMTIgKw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBi
L2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gaW5kZXggMzQ3MzUxYThmNjE4Li43OTBiZjI3
NDA3YTUgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmgNCj4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBAQCAtMjE3LDcgKzIxNyw2IEBAIHN0cnVjdCBk
cm1feGVfcXVlcnlfY29uZmlnIHsNCj4gICNkZWZpbmUgWEVfUVVFUllfQ09ORklHX1JFVl9BTkRf
REVWSUNFX0lECTANCj4gICNkZWZpbmUgWEVfUVVFUllfQ09ORklHX0ZMQUdTCQkJMQ0KPiAgCSNk
ZWZpbmUgWEVfUVVFUllfQ09ORklHX0ZMQUdTX0hBU19WUkFNCQkoMHgxIDw8IDApDQo+IC0JI2Rl
ZmluZSBYRV9RVUVSWV9DT05GSUdfRkxBR1NfVVNFX0dVQwkJKDB4MSA8PCAxKQ0KPiAgI2RlZmlu
ZSBYRV9RVUVSWV9DT05GSUdfTUlOX0FMSUdORU1FTlQJCTINCj4gICNkZWZpbmUgWEVfUVVFUllf
Q09ORklHX1ZBX0JJVFMJCQkzDQo+ICAjZGVmaW5lIFhFX1FVRVJZX0NPTkZJR19HVF9DT1VOVAkJ
NA0KDQo=
