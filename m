Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA8EC46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 20:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D07410E339;
	Mon, 18 Sep 2023 20:54:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEE610E339
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 20:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695070454; x=1726606454;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=igD8o1sKOzkY7F1YRi5tWHP3QtGwyShI/3alTE6VjpI=;
 b=ZFCo4wiJCmubK60lXGzCNgVHo1y2/tOHZA8VCQVG2XoFAKitlWqWs6cy
 BCbO0eWT/9XRCshBwakdbiY/hgftLogKL/Y3DnzrNHeMHSt7vZDK/R8Je
 4huqetqMxE0yFohl6UCcMmXMjAendyhKXiecI0SKp+1WmNWU/VbgEjzGa
 xszXgN5w61MijnRmJge7YS1qenBBUDS0vkSVf9x2VFy3Yzg+ZsgpQZcV9
 mbwG+PHai3Io/KFaHLuQjHPYneb77HgYMU6Rc8NYEP+TZqchuMQEatW60
 IP4Pr3Z/hNeU79qKe2xCyyzSvbH207Jltkq6BqSEk5pa9rTj6xN06anZS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377084518"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="377084518"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 13:54:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745966501"
X-IronPort-AV: E=Sophos;i="6.02,157,1688454000"; d="scan'208";a="745966501"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 13:54:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 13:54:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 13:54:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 13:54:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qt3Mn9JgtxmVl0XRN6exsNHoGXjMGhr95Rf0VgMeToz8F2LZswHxEp/1nxY+tztbH0mk3dYiLhR2Xf3FnPYBSIBuLC70Xxfed8iiSXBhu3y0961DmZd6OwF+QQtB74GQ9BMUY31NiwIotcuBU5DPn+G+MWtmLyFnzHWEv7Sx9WNBe6b6X5aRxqV0D8IAk7TlA2IvU8VJQ3olqrlYpdP0Xa3XYJjaOpxDcZa9XTgelvF3HLbZRGDese0j1WW/hmCo8/dGFGsZZiroPCxAx6i2YMPs2cbsiv822/2qNcDXLH0SlQNfUFQKb+eS3ymnm2lTIAntmwK3QCa6iEI4rRQyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igD8o1sKOzkY7F1YRi5tWHP3QtGwyShI/3alTE6VjpI=;
 b=bcOMpNDbrQPz/jZkr8Z7X+oUiaOk7zKmCfwvJEPtw99r8DW1HXa1njOqcCzHyZUMgcoTY38GY4Z8KNGELfahv5mK9fQw2Zh14bridguWaYlwY8ZLcoEHRc6zmSGdoanpyrlNkqrGSU4PLgvi0Mw49FAAgWwxgmBdyUhvkKw9csGMvjV8WtOh0NMRuxpYwOvGpKt6RPHu51l4PSYh5vjXXMg9dAyvGb3JV6u9BqLdbKfrWPHoAVPwxgWIGBDbT6Unsp7WwCruGH9xDfyETh9butDvq0ytLmdONz2aTnHmA8xOG+oFoTrxxHMN+sPIbiuRxcHjdkFga2XmHEHGnF1yTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by SJ0PR11MB5200.namprd11.prod.outlook.com (2603:10b6:a03:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 20:54:07 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::cf28:4320:6c5e:aec%5]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 20:54:07 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
Thread-Index: AQHZ58N8wHuMzMA6dEe/x5NketoN2bAhFP0A
Date: Mon, 18 Sep 2023 20:54:06 +0000
Message-ID: <826cdfdb62b6033f60aeaa9d6384b3d92a4e81fc.camel@intel.com>
References: <20230915105724.1025509-1-jouni.hogander@intel.com>
 <20230915105724.1025509-2-jouni.hogander@intel.com>
In-Reply-To: <20230915105724.1025509-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|SJ0PR11MB5200:EE_
x-ms-office365-filtering-correlation-id: df465e07-5656-4f4f-36e1-08dbb8896664
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZEmYjNbmkTPuirMV8SgqF/PFKVBmtEB4lHsXxkxrJtDxRFAxdxauIFay6sJX9buq4kb2Eqfr7x12YLoeLe64dgW+Ka1nFlCmDdB31GRvanBmmeHN9anZ33bvO2Ey+FL1s7zzmQR8VgW2GEyQK/jd2UIlA8x/pLvBW14V1b6JpEHfMi1zyHwxkC0mJ3b6QkFEVPV76UCxWZaO+dfIkKrWKPhBoq4BfsNJoJ51S1rz+YjH20pXKlhH0gkmiYoWS7P5WNsgFiGn4Bhx3oq06gyoje5746fhJJfAEi75hK2mtoIbJj4Rs3yF+bCmlPc9U1DXiYokxJDeRpXtFQV7TCZ3XoyPdRFBuA8luYLlj0Si7RWnexi9Aof300vVLFWBEGZgAN6VO1hvkvgJJ7soTj2pWENwJnqVE+611BcN+9diLoyW70uKWYmiRRFs0n8aWrVO9zHUGcT+YIGolIKA9B7p6Nbc75Rr/qhx1T92kOgi1uu4aNYA2Or3ebj+IEbkyGdqEGeLBoRTS0s2XbPW7Y0WBG19wdcAtZiNelUNkr0RLQrtTpQgahBNvWkU8xQ5tuu8ajZ7BUd1+QCEPo1bk+8jTtqOR+jV2ACqUCgjk+RlZfEJB9B4idI9ajkkh1dHG1Dz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(396003)(376002)(346002)(1800799009)(451199024)(186009)(66556008)(66476007)(66946007)(76116006)(66446008)(64756008)(66574015)(316002)(6636002)(8936002)(8676002)(41300700001)(6486002)(6506007)(6512007)(478600001)(71200400001)(91956017)(83380400001)(110136005)(122000001)(2616005)(26005)(38070700005)(86362001)(2906002)(82960400001)(38100700002)(5660300002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWxkci9TVzR2WWUrOUpDekFuZmtscU5GUW1UdVBBY09mSlRLQWthL2xsenQw?=
 =?utf-8?B?R0dVdmlLMnE4RWVEdVM4djY0cHVmNDRUTEc5TGdINXdpWHlzbS9TSVpMSDIx?=
 =?utf-8?B?R1hYODVEWkRhWHp6WGg1dEh5OU1CK3Y4M0FnQ1grNDlNWWFwNWRQczhTeDYw?=
 =?utf-8?B?bmE4RUZ1ZS9XUXRGNU9uQnJHQTlGcWhEaTd4YUVaeU02TUM2VWY2YmhkK2Zw?=
 =?utf-8?B?c3RtUG81bXpvQTliNVFVUjlydEJ4WUxIVmxYSUxvbGdjMEhGZFhCcmVrYWhI?=
 =?utf-8?B?TTc2MEsvaXFEeFZ3bm12dHJZTHdxRkw5bXVaemM1WWFNT1pVcDBBTE8yTGdv?=
 =?utf-8?B?bVZBd0UvMzlsZmREdGVlWmdJb3YxUUNzSC9zeXpodTY0TENlZUlERmdqNWI5?=
 =?utf-8?B?SGpVSTU0Q29nOGo2MmdvRnBVbWVqVGhLR251bm1EZ21nbUhYOEt0YlZPUmIr?=
 =?utf-8?B?ZVF3WDUvcFF5RWk1MXJkeTM0QUZxS3Q2ZGl6S3JacDRKUUZKcTc1RWxLMVFN?=
 =?utf-8?B?VkxJbzliOHBuMW5neUFIdkJUbEUzRFRmY054WTRNWDJiUjlmc0FlOWt5WnEx?=
 =?utf-8?B?S1NMWldVdndkVngrK2s5WVJ3TmcvenM1V0xzRHVtT3plRGlXbmlpZnY2ZkEx?=
 =?utf-8?B?bURwdUNkRXk5NmxkellrYnpqNEljMHdTM0x3MFlIYUFCOFJPeEJKMFV2N1hp?=
 =?utf-8?B?TDFuUVhRS0M2L3J5R0ZjbE9tditKVzg4YU9RVWUzVURVQkRCN0NZcHdOK0g0?=
 =?utf-8?B?aExuZ3ltQVlmVXZMQXJqemU1RHZBTklucnFXbURMd3kveThpSGw5ajlFVHhs?=
 =?utf-8?B?YStIMDArMUdTSHBHNVJKdCt3UTFjVDd1R3N5citJY1VZTUdOMzVzQTZSUWN4?=
 =?utf-8?B?K2xOaUw3V1dJQWhhRnZYSEU0WUxBNTNPdDh0M2t6N2pWajROeHN2eGlvUmJH?=
 =?utf-8?B?SmtNSTdtWE1yMnh0ZCtEMDI3TWRXVzQvQi94TDhXUDgrK2dzL2hFM0kwZXA4?=
 =?utf-8?B?b1lLTkJRdnRCa0FuU09naHNMcmNWbGRVZUJWRHRMbGM4NTRjM2RNakV3Rys0?=
 =?utf-8?B?S1RtUHI3aGM1eTJBTWJSODBMbUJtRmFJcnRITGdDQ245Lzg0eXJsWFNyTlZS?=
 =?utf-8?B?Ni9qR25Hb2FVTHRUYlVDNjZMS2c0RVZNYXdiTTcyV3ZqQTA5ckx5bnVicjM4?=
 =?utf-8?B?bmdMWktXWk5vZWxnL2VHR0c0SVNtWk8veWpKMkdUUFZrRkM1RGppNGdUMWVY?=
 =?utf-8?B?YUNSMmtXRU9SM1J3V013ZzF6Q0U2dWtEekdyMG83UTluTnk1emY1bFFWQkc4?=
 =?utf-8?B?bE9HN09tOE9Oa2g1eHBwaVIyV0RwRlFQQUliQzVqN0pqS3N1YzV1STZlY21z?=
 =?utf-8?B?RlI2MWE1QkU1TmdRRHVrbDlnV1ZsSTVhUHR3SkM4dWxDd3hKNWJnRmJBcjFN?=
 =?utf-8?B?U2Z2NDhSRzJ1ZHNEb1lHMVBBUWtsbDl6VGI3Y2d2VW42bEdiYnp3SXNwNmlQ?=
 =?utf-8?B?TGpqZHgycHdNUjIrRWFKVFlBaENUWGlWRzR0UWU0RmtQaHF2VTJaRmt0WWJa?=
 =?utf-8?B?S3g5TFV1T1QvN2F6aTh3d1ArbE4vWVU5bDJuTDFLOURYT2xkRG5KN09lUzYr?=
 =?utf-8?B?bVJDaVlZUDk0c3ArQzBTdHQ2WTNNektQRXpGcnQ0UkF0WDUxMXVTQ2s2VS9D?=
 =?utf-8?B?cVpjV21MUFFua094Uk1lZ1J5NEdvUUhnTzYvbTdvMnVuMWdLSmtrbkpBUU1X?=
 =?utf-8?B?aVRqNUgrVms3R0dFTmN3NEIvSHlNdXpUVGNrVmVJZ2ZKbitoNU9mU2Y1bklZ?=
 =?utf-8?B?L1FlY1hrTk80MGRGU3NLWjh0ZW9mcjVoTnRiVEZndkFTdHlPN1lZRlBrb1cy?=
 =?utf-8?B?YUo4ZFR5cnEzd29ESkM1MWdsbFlLWFUyM3ZqY1VlWE5xa20zSzU4bkRkdlFR?=
 =?utf-8?B?Q21lNDQySXNsNGlxZzA2d1FQMCsyNU0zL0czU0ZadFhXQlNCeUowR0NyWkFP?=
 =?utf-8?B?WWRPNVlheUFXc2JVZ3JRNEM2L0hjd09EQjZ3UElpN1djZnZTd3YwV1lBNDNp?=
 =?utf-8?B?QXpTWklDUXBoQVNWUVZWaHBLY2ZFWjZYczA3SmdmcTZUYm5WTEU0Mm9hTDhH?=
 =?utf-8?B?SHR1UG0rWHlsZnVwRjVKSnlacFJWMUczdVpMZTJjdG8xYXcvTFBRSnozRFd0?=
 =?utf-8?Q?Sa6r+f1BP1LZIb5uUjzp9wk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A71A94987FC6641B2D4743A8B671A6F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df465e07-5656-4f4f-36e1-08dbb8896664
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 20:54:07.0324 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ou1sacbAz38Z0DVL4Wlifo/TKPyI5lS3T325UmxgLQ1Aqi+FjPzzyl/hUa1jUGAC/LUQ9Rken+YuDCU53AnYCFpg9htvS2Ba4IvNabaeiiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5200
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] Revert "FIXME: drm/i915: include
 intel_frontbuffer.h from skl_universal_plane.c"
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

T24gRnJpLCAyMDIzLTA5LTE1IGF0IDEzOjU3ICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgYzNlOTQyYTA2NDMzZThjNTM4MTA4ZjI0YjRmZTc4YTA5
MjdlMmFlYS4NCj4gDQo+IFdlIGFyZSBhYm91dCB0byBiYWNrcG9ydCB1cHN0cmVhbSBjaGFuZ2Vz
IHRoYXQgaXMgdGFraW5nIGNhcmUgb2YgaW5jbHVkaW5nDQo+IGludGVsX2Zyb250YnVmZmVyLmgg
YXMgbmVjZXNzYXJ5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3Vu
aS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IC0tLQ0KDQpIaSBKb3VuaSwNCg0KU2hvdWxkIHRoZXNl
IHJldmVydHMgYmUgbW92ZWQgYWZ0ZXIgdGhlIHBhdGNoIDQgaW4gdGhpcyBzZXJpZXM/IFdvbid0
IHRoYXQgY2F1c2UgYnVpbGQgZmFpbHVyZT8gT3INCnRoZSBwYXRjaCBkZXNjcmlwdGlvbiBpcyBu
b3QgYWNjdXJhdGU/DQoNCldpdGggdGhhdCBjaGVja2VkLCANCg0KUmV2aWV3ZWQtYnk6IFZpbm9k
IEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+IMKgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMgfCAxIC0NCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9za2xfdW5pdmVyc2FsX3BsYW5lLmMNCj4gaW5kZXggNGQw
MWM3YWU0NDg1Li4yZGVkMWJjY2U3NTQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvc2tsX3VuaXZlcnNhbF9wbGFuZS5jDQo+IEBAIC0xNiw3ICsxNiw2IEBA
DQo+IMKgI2luY2x1ZGUgImludGVsX2Rpc3BsYXlfdHlwZXMuaCINCj4gwqAjaW5jbHVkZSAiaW50
ZWxfZmIuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfZmJjLmgiDQo+IC0jaW5jbHVkZSAiaW50ZWxf
ZnJvbnRidWZmZXIuaCINCj4gwqAjaW5jbHVkZSAiaW50ZWxfcHNyLmgiDQo+IMKgI2luY2x1ZGUg
InNrbF9zY2FsZXIuaCINCj4gwqAjaW5jbHVkZSAic2tsX3VuaXZlcnNhbF9wbGFuZS5oIg0KDQo=
