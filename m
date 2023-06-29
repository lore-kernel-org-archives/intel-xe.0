Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08220C001B0
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 19:12:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C1410E059;
	Thu, 29 Jun 2023 19:12:50 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C4610E059
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688065969; x=1719601969;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=/MNQYO0dkMVGI4y9nuhZixBdajhLHEvlvMyr96OyGMg=;
 b=ESeRPXJLMNrQwlGRhyi6HRqg9nY26+dfQUa9f/cRGP9rGNbkqvezlZ4r
 QfzXfpSRoS0tCijgzE+AY3BimR0hqQLRYJ9iXOkYKnKcQo379HirBwObT
 DIPlBspBV/1dflwtewfmY93//3a28LZBHEc7QCZue6BcHN9Oz9BYAkK49
 IdNVCpmqnb1s32mTkFVCJFCOzyyNboNdXPdr3XfNqH0doQ/7J6AcY3Iks
 x9wZtlQXazA744YJzOc98ZHmBIHmCBQRKtdKCEb5ssmHl1KwnFTYoQuX+
 XSbs+9WM9SJntdwchhg+e4eAHArDWgc5sNh1JvJTHz9t0HpRRVMjfq3Xa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="346986172"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="346986172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 12:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="747129899"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="747129899"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 29 Jun 2023 12:12:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 12:12:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 12:12:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 12:12:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 12:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZgfXlWe/Z84J6NrYKw2HeU5iIgiVlCLpMenszIlgJ+BZaWx2Ha+IT5T+68lQ/3Z6k4vD7hDJu8of/F+Io4xcEneSCuVd38AH5dLutXN1D5it7bQA143wAcNi0WRCAe6opB7zpB/UCH+vTtoDOROPQXYhasmrDiGq1b3YeW8Q3USnLbkXRG/CU4x2cAzG1VTHoOTrrRhs8SMSy5NupZN12WsesMaudOa3AoPfZqu7X5HcYZvWbKnFaVUTHVkI19yZKW+mPP74kwrO/KQiVbNqaQ+xFIjB0PJLi2OVXtAJRN5XLWiYbhjvYWG7xDBfFhw/GI4l5rCF0ikLMdmzGqybcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MNQYO0dkMVGI4y9nuhZixBdajhLHEvlvMyr96OyGMg=;
 b=mzvrS+YC8D1Z3GP8V91+kLbfYhF48rxia/aCfjtGUJeyWyNcCHoTfnEuPYmjv0IPbKByE/XvGJJGyNIqTFwjq6l7GT9d93ALRM5XzHkGxmJKoUbDGM7OaxsJ2GHakV4xrf9Wr/DjGacwwByTPBCBazlSBEBPSXveohr1Z0vUFR8PPs8fJEAuT5JTXOx1CmdWhiJv3X/p5V30v6z/A3sxzB/3SGukoYniOPnzLPlA8USYjUb4r+Pz+HtHK1PhyONAKISdZQpy9ViZ1wYAw0qumQlx2CVotfVu3PfGwLQHLqrUHKrWKr+YuH6VhDR4mSxWrYeydcUHX7hOEZFnj6dsBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 19:12:37 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 19:12:37 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yu,
 Effie" <effie.yu@intel.com>, "Zhang, Carl" <carl.zhang@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Hazubski, Filip"
 <filip.hazubski@intel.com>
Thread-Topic: [Intel-xe] [PATCH v6 0/6] uAPI bits for small-bar
Thread-Index: AQHZop1ZstXJZEoUaEaaqGiTqqsaSa+iNWCAgAAAt4A=
Date: Thu, 29 Jun 2023 19:12:37 +0000
Message-ID: <46ad96b97b10828cf721b944c84c5b75de7b5872.camel@intel.com>
References: <20230619110018.53538-8-matthew.auld@intel.com>
 <fb445fe4c72588d7582aa877b7a2653d321bec7a.camel@intel.com>
In-Reply-To: <fb445fe4c72588d7582aa877b7a2653d321bec7a.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH8PR11MB6802:EE_
x-ms-office365-filtering-correlation-id: 4538deff-38a1-4f89-8e63-08db78d4cd19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i0X0zPsvVxXGOi4JkFgB7mQbX7v+jyYIiDC7f9+X5h7tE2YRQtduSOeOwcIyzC5iZcc+cLKYUHPFbt7jQsMSQNdmBZ6nhC1n8SFMITJvH7M6VtNQ850XWOrONQKYxnnVQm6Vw+huEcNKF3yL95e7h+jD+ecR8FZ2qetdk2giy15U0C9Txk+OBYDSBH/iBxc/nKPREHj4llMGNR/x1h36OUc10jAqZSHeciWxOHXO/s50v7x8B+MI2ILw3lp8BiBOZqOp6hx2NXtAQ+Kh+SqsTL/WLUiVFaTAbJAWasNRFf5cKI1DexqRwMSPwSHguWQteCSLTodGr0M/HRB8kfSmL8fRrx5ET9//15d0oM0HZR5YKZEGFdRXd72XVymxp1Mj1lR4XGf2uXz0+GRMsCkOnUYa7hPb+gNyq1mjtog8XXFeLCEHTwSOvBydLWnfUEOzAjW1iYPewLPGqcy1FybET2qJu+iHOOnSGEWZA9DvjgQfDrvRLRilmi3YueW+hThrtLFytcSlHfuj4D3mOc9e52iSWPhAJDTH2ttOSALDZRivSUcVIa6lzP4b5RfXtFPjfGAfO0dRoyQ6RIhrTT5fo71KGMRjLlDOfeYIA4KNbAs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(36756003)(66556008)(6506007)(122000001)(66476007)(76116006)(86362001)(5660300002)(316002)(64756008)(82960400001)(66446008)(41300700001)(8936002)(38070700005)(38100700002)(66946007)(91956017)(6636002)(8676002)(966005)(6486002)(4744005)(478600001)(2906002)(186003)(6512007)(71200400001)(26005)(83380400001)(110136005)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0U5ZXlWZGd6MU1VbFRmR0I5WmRyQzBpakJMdjg1NHI1c20rM2VMdENlSldm?=
 =?utf-8?B?dVRwaDdWUW1kUjE0ZWIrQThWeGJ5TnFwMkRWOENoUXdIMVFldFhySkhybXJz?=
 =?utf-8?B?a1BTSDJkYUFGOVpOY3ZkTTJpV0pnVk5Tcng4bytRWGZIMm1jdUMyZUJwVDFu?=
 =?utf-8?B?dVpsYWkwa0o5RjNwRWl1enN1NjRIcjI1dlNCazlnTm5UbE05azl2cysrU0Yz?=
 =?utf-8?B?T3kwaEVXQlZidEgydHBxaERhbVVBL2dqM1hoU0F3c3pFR3VwZC9iTkUyVWFY?=
 =?utf-8?B?UUlZTHJ1MWxoUnVVRnJYOTV2aGdIaEoxZ0kvU1kxYVZPWEtJQWZpb3pkbGdM?=
 =?utf-8?B?YTdEZDdIWHNjbXRiMFFlZENzMWZ4SE1URXJrRzRacVA4R0ttTUZBcnEzOURo?=
 =?utf-8?B?TWJJK2lPL3FNSlhhcENReFBlZ3VydFBwTjliMmpMRzVVUGtKWDJZd24rdk9h?=
 =?utf-8?B?dVAvUXBEMUcwUVRXdkRJQkF3d0hZUDJtY2VPTWFUc2g3OTROZ3lwc2ROYmpk?=
 =?utf-8?B?VmJUWmNnenRLNzQrdXJManBZanhGSktSRkJtdDFQWXlJWnNmWnRhN3F6cWJz?=
 =?utf-8?B?cVhtblNpN1BYVkJKZEdHRnVONk42TkpUMUx3bCtVOEh5b1VUTm9lOEZBZnNF?=
 =?utf-8?B?aWlHeS9BdWRlbjBRZGtsa3pXTVJQS3NGVzZVdEtSaGFrMjhLWjdZUmNIWU5Z?=
 =?utf-8?B?NzZVSWlSbUtIMXZkMnc5dVNYNFdtUGhCcXFkUjdZN01MSXdqSjB0YSt0dkdr?=
 =?utf-8?B?aE1vRUc1Y2J3Q1h1dnVXbDBvNjZ2THplTlF1WXZoSWhTcU56Szh1SVZmV0d0?=
 =?utf-8?B?bmxEMG5NbU15SGUzSkV2RVFBbE5qeVA5QWJXN2ZoTmM2WVFhcWhZZ0hEQXla?=
 =?utf-8?B?bTlqSGhkTXJ2QzU1ZmYvOCtNUjhKK2pKUnhKcmx6bk1qU3hwYisrWHU3dmI2?=
 =?utf-8?B?R3Q1UXpoU3J5aHZFcmJyeEtBUXg5d0lEcUFwVFNCWFBwYTc4QTlFRW5iMWFY?=
 =?utf-8?B?RjNVaWZDZFFsdXM0a0dtRmczd3ZBeG14YkJwOUh6ODNmendZK3E0ZDRsYnIx?=
 =?utf-8?B?cUsyamMwaHdvWlc3UUdnUEdNcTdoSkd1SEY1azRtb0NzZDNXRU9wcTkzVlVY?=
 =?utf-8?B?NVl2RVRReUZoZmEwUXhRK1p2azh1ZWtySm51dFBMTGJqWEJxSVRpS0RMOFY0?=
 =?utf-8?B?NnNMVHMvUFdyNmlJNVFJOEhLMUo4SU12WDNvb005amlSWmJoRDNud24xMU0x?=
 =?utf-8?B?UnUzcFg2b1F0dGJWQ3ZjL1JHUzc3Y1JwVXBSSnlUbnV5VWdFWUI0K0dBZ05C?=
 =?utf-8?B?M1A4NVN1eUJjZ1Y0YmRIQWtKZWVTT3QrbnNzSjhqdzF4T3ZWNk1oSUlCYUVz?=
 =?utf-8?B?ME1tVE5RdVQ2REovQU9HbHBKR0RiblZoczFIbDE4QXVXOUk1ZEYwcFdzYXhq?=
 =?utf-8?B?SndYQlJnSTVOWEhtZmk5MEJpZnhYemdCSFNYVjRpUjBycFpMVlZSVGNLNG13?=
 =?utf-8?B?bm5kUXBaRVM3RWcyUk9mOUlRaC9ZUnE0ekZoMkNhYk5qNnJRbWpVR1poNTRw?=
 =?utf-8?B?WTJwdFMvcXVBK2tCajN0ZmFmTDlCODBqdWJrMEYvQzIzbG9ZMUlTWVovUVNC?=
 =?utf-8?B?cEtTRDFGcTRsZmNneDBCWXZDbC9LSnY4THBSQ3lyOEpUbCtWcEpDQzlwNGdt?=
 =?utf-8?B?aDVzUTZoU2ZjSHFxaGI2ZlorUWdHaHRTN2xENUlTQm5aVG5WRnBpazl5ZnZu?=
 =?utf-8?B?Y2xJOEpjUjZlUWpOam1kdnZWTXMxTEpaQ3R5YmY1b1VQQklSNDNDVk9pekVu?=
 =?utf-8?B?ZWNOOHd6R3MyMEpqc3l1NkRqdzRELzZseVVYRSt5N3I0TzRHRDlOVi9pT3ZY?=
 =?utf-8?B?cjBpZDRseDR5Ym4zUGZ6R0I5UDVaTlRpZE5QZnNkNys2RytJTGx1MUFqQ1Zw?=
 =?utf-8?B?L3hsN2t0MW4zUGtEZ0JYKzh2ZUw3VHhDSFAxMU11N1BWd2FxTTZSY3pWMVZv?=
 =?utf-8?B?YlhwU05uYUQ3QzBMK3crS09oVWxRQUsyKzNEWk5ZNjhMdnVkL2FpclgxU1FY?=
 =?utf-8?B?alV1Z3ZoQnVzU0JlTk9nMThQL3hzWDAvbzM3cU55RFVvKzZZb3ErSTFGVUlG?=
 =?utf-8?B?MzNadk9yNndlcTlxRWFCYlU3Nm5FdGkwdXBBTzhIbWhXVzdaVnpIK2s5cExo?=
 =?utf-8?B?dGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1126418613C18E4B81CC4F5B1A4B4B0F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4538deff-38a1-4f89-8e63-08db78d4cd19
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 19:12:37.2081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3Qeoi5Om4KpmYXCJUWUG5wVQc//lm0cEdVGJyqEX/P3YewgE0IoKAo0Hd5xaP8xRE5Mf5SJeUqv3dJBQbOQFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 0/6] uAPI bits for small-bar
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

Y2MgdG8gb3RoZXIgVU1EcywgaW4gY2FzZSB0aGV5IGFyZSBub3QgYXdhcmUgb2YgdGhpcyB1QVBJ
IGNoYW5nZXMuDQoNCk9uIFRodSwgMjAyMy0wNi0yOSBhdCAxOToxMCArMDAwMCwgU291emEsIEpv
c2Ugd3JvdGU6DQo+IE9uIE1vbiwgMjAyMy0wNi0xOSBhdCAxMjowMCArMDEwMCwgTWF0dGhldyBB
dWxkIHdyb3RlOg0KPiA+IFRoZSByZW1haW5pbmcgc21hbGwtYmFyIGJpdHMuIEFkZCBzdXBwb3J0
IGZvciByZXF1ZXN0aW5nIENQVSBhY2Nlc3MgZm9yIFZSQU0NCj4gPiBidWZmZXJzLiBBbHNvIGV4
cG9zZSB0aGlzIHRvIHVzZXJzcGFjZSwgYWxvbmcgd2l0aCB2YXJpb3VzIGJpdHMgb2YgcmVsYXRl
ZA0KPiA+IGFjY291bnRpbmcuIEZpbmFsbHkgdHVybiBvbiBzbWFsbC1iYXIgc3VwcG9ydC4NCj4g
DQo+IE1lc2EgTVIgbWFraW5nIHVzaW5nIG9mIG5ldyB1QVBJIHJldmlld2VkIGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0cy8yMzc4MSBqdXN0
IHdhaXRpbmcgdGhpcyB0byBnZXQgbWVyZ2VkLg0KPiANCj4gPiANCj4gPiB2MjogVmFyaW91cyBp
bXByb3ZlbWVudHMgc3VnZ2VzdGVkIGJ5IEpvc8OpDQo+ID4gdjM6IEFkZCBzb21lIGtlcm5lbC1k
b2MgKEd3YW4tZ3llb25nKQ0KPiA+IHY0OiBTbWFsbCBrZXJuZWwtZG9jIGZpeCwgYWxzbyB1c2Ug
dGhlIGNvcnJlY3QgdmVyc2lvbiBvZiB0aGUgc3RydWN0DQo+ID4gdjU6IFJlYmFzZSBvbiBsYXRl
c3QgeGUtbmV4dCBjaGFuZ2VzDQo+ID4gdjY6IFJlYmFzZSBvbiB0aGUgbmVlZGVkIFBMX1RUIC0+
IFBMX1RUIG1vdmUgZml4LCBwbHVzIGZpeCBzb21lIG90aGVyIGlzc3Vlcw0KPiA+ICAgICByZXBv
cnRlZCBieSBKb3PDqSB3aGVuIHJ1bm5pbmcgYWN0dWFsIHdvcmtsb2Fkcw0KPiA+IA0KPiANCg0K
