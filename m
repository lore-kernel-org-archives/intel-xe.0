Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CB1CDB47E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 11:45:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E61910E3CE;
	Wed, 18 Oct 2023 11:45:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9899310E3CE
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697629549; x=1729165549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0TH9mJL4qRXlFI4YYPlVXyt14sigllUGzeSdgD8JTmI=;
 b=GUj48RUwREpwRhMqKZTxZnS77mLMXOkEMMVqRBK15Y4HQnz5IWhqfW11
 eckyLFVPdw0lQyCyLzxYlyBSucQqtaRAVs5QI+E74XMuayP/JN9OM8BtM
 PARJz4wjhNua3ucy029mr6/I8FPuvr31uD+WJEg4TvHFXAkrX0Lzo+Yoe
 gDoHCGcYSXes5GsUxn+j5bycdlAy9A1jcbi7HuboS+zzotI5vZ0Igcp9m
 0pdFgya+DDMDsvHbIvlfZjP3dvbp+QddXANHuxcU5pLYxOxMIyPxIS6Ui
 bDMujXm3RAGhSgS2HaDdnGY04o/PGaYpOzBaX9eBF6waFQ97xX6cTmQN3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389872307"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389872307"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 04:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="750065154"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="750065154"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2023 04:45:48 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 04:45:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 04:45:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 04:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOHtZEUyLax2GaZtbG5XGr/MI4lIXdtV8ajtlHCGEvs9a9UcOrLyJrNquCcCEEnrfdKhpNvGkhmVBM3BGTbmjuvPNXTzhy57C2XVXmwxliC+Gbcxpw586OUgRpMhm3Y3O0FxIIYQub5tgiyHjMQXSlCLl8yF81ywJ5WKU9kHpKacKuMScd7AxmBnKsDLrRqTWXUUIyGeG6xK6B/185UpHh8hzUmu0ImiAkunbmJtwajc+L4ZdGXQ21u7Au9BTTg7ucCm7SC6DxM0kHS/zpYPtfx/Jglf0SA/Y3+w7aQ6CDYuK1FwRoedsJGW7rX5kIfQT5iwjZES3YiXb2UuWGJwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TH9mJL4qRXlFI4YYPlVXyt14sigllUGzeSdgD8JTmI=;
 b=B8Gdqvk0bmsGgIYEKEF1LeQNZh4aUNhs6I60O6fNxzbC6eg8n6u1BE6wqtTnV2EzFhTBQDwD9SwIv6ttD9ugI2MNEPxBSA8bv2dG9Pl9Qbwza6XOX3xFXKEkXQty+UjgNss3/OGP3dt83OkUtCTCJAQkSbNkZe3CIQb8J4gEghBpqMmZDYFnYNp/kyxdxPXZw3+FDOVmgAuW/3MDQ5QNWv3Tn5R84pO4oDo8t4g2HWgILIRiiY/qJHj1MQwtb/GsB68B5fY/EXl/fn87M/RBNbinzMh2PJYDAYZlqYp9YeCuzZgVJrFe6/rflz0Ij9l8ghoVbogC8B3MmUAyOCzzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13)
 by SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 11:45:46 +0000
Received: from DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::a32b:3ba8:43d1:e0fc]) by DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::a32b:3ba8:43d1:e0fc%5]) with mapi id 15.20.6863.043; Wed, 18 Oct 2023
 11:45:45 +0000
From: "Coelho, Luciano" <luciano.coelho@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/i915: handle uncore spinlock when not
 available
Thread-Index: AQHZ/T8mJ/btGB7CpUKrbV0dcGl2LbBPdsGA
Date: Wed, 18 Oct 2023 11:45:45 +0000
Message-ID: <d73ff3cdc911dc48fc7db36639064b84794ac044.camel@intel.com>
References: <20230919094737.743358-1-luciano.coelho@intel.com>
 <20230919094737.743358-3-luciano.coelho@intel.com>
 <ZShDl2VRDu6iW3ie@intel.com>
In-Reply-To: <ZShDl2VRDu6iW3ie@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7382:EE_|SJ0PR11MB5056:EE_
x-ms-office365-filtering-correlation-id: 30c49274-ea73-4795-170f-08dbcfcfc3ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nK3E9Mdlwf8Pj3IhUf+rF7q9pmpW0jKWBzg4kN7YM9n3yZ+Eyx4Zdf+CD7NY9RlJYS5G+blXN6ovWQxRpO9t/d8J1e1hbUtjYdsckcn6ou+ZdUzNnZtjVT6pT8xKmkmOzdWbZcT9+7mPUQoPCwMOHQ7CnUX7m9VunYt+6EMwK9vCbAb7KwaCrjqwFbAMY+1RXMldWz9YAXRpwV+GsscPhTVT9RdMB2ajQs07fK3zau20n7t30LkrvOfkfO46XRzXFoQv+KUNANKNMW+T16Q5HbtxWo/z2kIrYAlmHiE6lvIzF1s/XLwdbW2PcfBf+4yEuLPupaBYv7ZahkM8gB8f9OLbUJYfxzRjZjq8sKpEY/rylPbLdHjNZCoBjDWIA2+l7rTeF7d45YrlPKQO+9O5YANnKoSA9Qv/gwsNVWzoxrDf4LdByCT2OX+c+un9oKR9u9DVJMUdVpuzz7CT9l1x/2uEKglL8RSNcCm1fW6GVGMjL2D6HOfEw/rgWU4+lopS1mFEp6afX6ZHdPFjBhUy/AD8mpzb0D/aEh/Rz1N5Q/KqupNSQmqGPtbVA3kSgOIlQx9fVcv7vWJXahtv5OCQN14TPfvSBpLA1xpCeszYlwc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(136003)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(36756003)(5660300002)(2906002)(86362001)(4001150100001)(83380400001)(71200400001)(6506007)(2616005)(6512007)(38070700005)(6486002)(966005)(478600001)(82960400001)(38100700002)(26005)(122000001)(41300700001)(66946007)(4326008)(76116006)(8936002)(6862004)(66476007)(66446008)(91956017)(6636002)(316002)(64756008)(8676002)(66556008)(37006003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZE1uenhKZm9ITUR1NkhpUWNjTkNUU2FtUDVwUk1CWW1UL09aQVJFMnAxcUNq?=
 =?utf-8?B?SkJiUU5VemdEY0VHM05EWXFNc1FSQ29wQ2sxaHQzdWFsbjV4ek1XOEpSZE93?=
 =?utf-8?B?UHY4amxKYm9LRk1PUXNWQkRCUW5iN0dtNG15VVlnTnJoc1NhQ0VpMVdMdEVp?=
 =?utf-8?B?Mm9UdWxway90WTMzajViRXV2SVBkNjRYbFhoV1NqeUM3WER4MTNCSStlZGlK?=
 =?utf-8?B?dElpS3Q3WW9CaFI2aW0wTXowVDR0ZGFRaW5PbHEyT2JzcUlDNUZvaXlYQW9o?=
 =?utf-8?B?bHhLbWtWV1R2ME1QdGYxejdRQnllK29TSlVtdXgrWnpoSDRJMk0wNGpBTllx?=
 =?utf-8?B?RHFJNm5ITDhVL0V5dGdsWFRQK09uampxSDB1K3V4U3duSmlvWXdpakxTWE1M?=
 =?utf-8?B?bUhpaEhFM09qSE41YmRFb3FSa2JObndVRzllaERHQkowc0lRZnp4bFdqVmNk?=
 =?utf-8?B?VFdsS0Z4cmNiWDhvSGlKaWRoNVFybzRPRmxUdnA4NHA2bVJ5YWQzenlNZFlK?=
 =?utf-8?B?aG9hOXZZamZWaGxLOVJ5MHNjRGZjanBxM0ZtbktCbDJrTmVzSldhMExFcy9j?=
 =?utf-8?B?YUZWYXlCQXcwNW1CclJYajg0VmRocTBSU1Q0WTU1c1prMER3WENtY1V4RmpH?=
 =?utf-8?B?YWNITytkeUkxN2MxYWYzdEw2N2xRdWMwZVFhNzdRaVBWR1hrMVRsU2Q4dUxU?=
 =?utf-8?B?SXVLdFoyWDlIdHI0ZnlJckVUSVlTd3l4VHh2dzR5U1E1MG1SSTlTOWVZRDE4?=
 =?utf-8?B?V1ZOSW4zMFlpKzZWeGZHQTd5TW5tTUpSVm5KSkNJSVZzY3A4VVZjQ1hHTWZu?=
 =?utf-8?B?STJhd0VVTzRYMVl3V2xnWElFcCtXelJwZGZ4ZDFWL3hsZnR1R0ZiMHAyZGFY?=
 =?utf-8?B?YXg1bk0wN2wzbnIyQlp4SE5aWUxHd2xIWnY2THhMODVJeEpTTGhLa1JpZlhH?=
 =?utf-8?B?RWxrWnBoVTVYT0lJREQ1WkJBdXBZTnhYNzNraDRHSmlPRVFGM01xc3RlUGVE?=
 =?utf-8?B?N1Z3amM0M0JNN2JYV3RiVER1OSt3STh1UThhcEE4K3loTWxIYStXQnh6Wktv?=
 =?utf-8?B?YkRvdzZ1YkVxNDRMcnFEcGhXV3g1QmhPM2liNTFoWUxNM3JhQS9TeGozWStS?=
 =?utf-8?B?VWxONmlzTktXNWNMUVBkMis5cmI0ME04SytsWVVwVlRMNkE4RVhpY05ZTnNR?=
 =?utf-8?B?WEpXaTkvend1ZS9GK0gyUDd1RWoralFWdzdhSHFwMDgwQ29ZRi9zOGVNOGZ5?=
 =?utf-8?B?am5yWjhtaUx3MnpQbVQyM1p2V0ZqUnR5YXl6UGg2eFR5L1hIcFVsM2Z6Vk5O?=
 =?utf-8?B?UHhSQnhrckN4WGFvRWM1c1Q0aU5CZWtDM0NjK3Exa2IzRkV4bnhYR1RheElV?=
 =?utf-8?B?NWtob3lXd0ZaMTFvdFgxbUFrV0g5UzZJVVArSThYenh3cnUrL040MGtud2VC?=
 =?utf-8?B?aHg1UzB6OE9PdUNEWTBnVGNLaG90NkFDQW5FellKek5uZDRpalEyaWJWcHAw?=
 =?utf-8?B?dmo0UDZKNTdzbllXYm8xUXpXQi92MjMrc3VjOUZWZ0NIKzRQTzFNSE5tUTZu?=
 =?utf-8?B?RzNFY3BjdytJYTF1OUV3aExmcWN2dGxCUERKeDE1SWM0Z2JqQXBUVEpUbElQ?=
 =?utf-8?B?OVAwekc2VXpCYW9xb2RXUHA1d0J4Zyt3Y1NydFBHTDRpdmNET1k5M0F3T3lk?=
 =?utf-8?B?bU9lY053VEJiNnhDL2pxdnIzdXJIa0p1cnpBWFR6b1FhWXlDbUJ3QWMwZ3Nj?=
 =?utf-8?B?bkgxcXR5Y3g3L3VnOTRwN3lWem5TUWR4V2xJdjd0bzR5Tmp1RlRyVjBLSHN3?=
 =?utf-8?B?dXg4T24vZ0tob0h6Z0Noemh4VDhVUm5QQkc5dCtEZzVYS1VuTmVrOXhRMlJQ?=
 =?utf-8?B?UUJBTm1BTUtsUEZLZ2VpMnQ5ejlqNStFRGZkemlNZnlHT0xPMHBkT05RN1Yw?=
 =?utf-8?B?ZjFKc0JkOXAxejhIck8ySXVKdEVVSGFneFUvR09NOUZTbHdic0UrSWRaNEdH?=
 =?utf-8?B?cEFPTklWL1VTaFpwVEVEVG9KSlZIL1dsOWJIbnZrZWpFa0RvczNPVjV5bXAz?=
 =?utf-8?B?Q09KakdROXAvdGJFMXI4OUhlSEJjVjErWHpNNFFCRGRmVWFaNS9qR2F6VXZB?=
 =?utf-8?B?bmR6Ym04RDFaS01EeVNxWS9yWEFsU0kvU2lEMVEvV3pKd3A4a3BHeW9aVkZw?=
 =?utf-8?B?RWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CF4887B20C51F4A96785E467E451401@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c49274-ea73-4795-170f-08dbcfcfc3ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 11:45:45.0801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nR2bBn+KGovXOuDaaJWyvddiVn1Wsjvnkk/xn7aoLfYrZ64OrHNmB/p3I3s78mylS/8DtRJ10/uNykaQpxlnoIrhc8qm/sUhjOgxgnwrj0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/i915: handle uncore spinlock when
 not available
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTEwLTEyIGF0IDE1OjA1IC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIFR1ZSwgU2VwIDE5LCAyMDIzIGF0IDEyOjQ3OjM3UE0gKzAzMDAsIEx1Y2EgQ29lbGhvIHdy
b3RlOg0KPiA+IFRoZSB1bmNvcmUgY29kZSBtYXkgbm90IGFsd2F5cyBiZSBhdmFpbGFibGUgKGUu
Zy4gd2hlbiB3ZSBidWlsZCB0aGUNCj4gPiBkaXNwbGF5IGNvZGUgd2l0aCBYZSksIHNvIHdlIGNh
bid0IGFsd2F5cyByZWx5IG9uIGhhdmluZyB0aGUgdW5jb3JlJ3MNCj4gPiBzcGlubG9jay4NCj4g
PiANCj4gPiBUbyBoYW5kbGUgdGhpcywgc3BsaXQgdGhlIHNwaW5fbG9jay91bmxvY2tfaXJxc2F2
ZS9yZXN0b3JlKCkgaW50bw0KPiA+IHNwaW5fbG9jay91bmxvY2soKSBmb2xsb3dlZCBieSBhIGNh
bGwgdG8gbG9jYWxfaXJxX3NhdmUvcmVzdG9yZSgpIGFuZA0KPiA+IGNyZWF0ZSB3cmFwcGVyIGZ1
bmN0aW9ucyBmb3IgbG9ja2luZyBhbmQgdW5sb2NraW5nIHRoZSB1bmNvcmUncw0KPiA+IHNwaW5s
b2NrLiAgSW4gdGhlc2UgZnVuY3Rpb25zLCB3ZSBoYXZlIGEgY29uZGl0aW9uIGNoZWNrIGFuZCBv
bmx5DQo+ID4gYWN0dWFsbHkgdHJ5IHRvIGxvY2svdW5sb2NrIHRoZSBzcGlubG9jayB3aGVuIEk5
MTUgaXMgZGVmaW5lZCwgYW5kDQo+ID4gdGh1cyB1bmNvcmUgaXMgYXZhaWxhYmxlLg0KPiA+IA0K
PiA+IFRoaXMga2VlcHMgdGhlIGlmZGVmcyBjb250YWluZWQgaW4gdGhlc2UgbmV3IGZ1bmN0aW9u
cyBhbmQgYWxsIHN1Y2gNCj4gPiBsb2dpYyBpbnNpZGUgdGhlIGRpc3BsYXkgY29kZS4NCj4gPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMdWNhIENvZWxobyA8bHVjaWFuby5jb2VsaG9AaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXkuaCB8IDIwICsrKysrKysrKysrKysNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF92YmxhbmsuYyAgfCAzMSArKysrKysrLS0tLS0tLS0tLS0tLQ0KPiA+ICAyIGZpbGVz
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaCBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5oDQo+ID4gaW5kZXgg
NTFlYjY1MTA5ZDM5Li5mZGY5ZmY2OGE4YTYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuaA0KPiA+IEBAIC01NjUsNCArNTY1LDI0IEBA
IGJvb2wgYXNzZXJ0X3BvcnRfdmFsaWQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUsIGVu
dW0gcG9ydCBwb3J0KTsNCj4gPiAgDQo+ID4gIGJvb2wgaW50ZWxfc2Nhbm91dF9uZWVkc192dGRf
d2Eoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpOw0KPiA+ICANCj4gPiArLyoNCj4gPiAr
ICogVGhlIHVuY29yZSB2ZXJzaW9uIG9mIHRoZSBzcGluIGxvY2sgZnVuY3Rpb25zIGlzIHVzZWQg
dG8gZGVjaWRlDQo+ID4gKyAqIHdoZXRoZXIgd2UgbmVlZCB0byBsb2NrIHRoZSB1bmNvcmUgbG9j
ayBvciBub3QuICBUaGlzIGlzIG9ubHkNCj4gPiArICogbmVlZGVkIGluIGk5MTUsIG5vdCBpbiBY
ZS4gIEtlZXAgdGhlIGRlY2lzaW9uLW1ha2luZyBjZW50cmFsaXplZA0KPiA+ICsgKiBoZXJlLg0K
PiA+ICsgKi8NCj4gPiArc3RhdGljIGlubGluZSB2b2lkIHVuY29yZV9zcGluX2xvY2soc3Bpbmxv
Y2tfdCAqbG9jaykNCj4gPiArew0KPiA+ICsjaWZkZWYgSTkxNQ0KPiA+ICsJc3Bpbl9sb2NrKGxv
Y2spOw0KPiA+ICsjZW5kaWYNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlubGluZSB2b2lk
IHVuY29yZV9zcGluX3VubG9jayhzcGlubG9ja190ICpsb2NrKQ0KPiA+ICt7DQo+ID4gKyNpZmRl
ZiBJOTE1DQo+ID4gKwlzcGluX3VubG9jayhsb2NrKTsNCj4gPiArI2VuZGlmDQo+ID4gK30NCj4g
PiArDQo+ID4gICNlbmRpZg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX3ZibGFuay5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF92YmxhbmsuYw0KPiA+IGluZGV4IDQxNmFhNjc0OWVhZi4uOTc4NDFmY2Y1YjBmIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdmJsYW5rLmMNCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3ZibGFuay5jDQo+ID4g
QEAgLTI5MiwxMSArMjkyLDkgQEAgc3RhdGljIGJvb2wgaTkxNV9nZXRfY3J0Y19zY2Fub3V0cG9z
KHN0cnVjdCBkcm1fY3J0YyAqX2NydGMsDQo+ID4gIAkgKiByZWdpc3RlciByZWFkcywgcG90ZW50
aWFsbHkgd2l0aCBwcmVlbXB0aW9uIGRpc2FibGVkLCBzbyB0aGUNCj4gPiAgCSAqIGZvbGxvd2lu
ZyBjb2RlIG11c3Qgbm90IGJsb2NrIG9uIHVuY29yZS5sb2NrLg0KPiA+ICAJICovDQo+ID4gLSNp
ZmRlZiBJOTE1DQo+ID4gLQlzcGluX2xvY2tfaXJxc2F2ZSgmZGV2X3ByaXYtPnVuY29yZS5sb2Nr
LCBpcnFmbGFncyk7DQo+ID4gLSNlbHNlDQo+IA0KPiBBIHBhdGNoIGxpa2UgdGhpcyBzaG91bGQg
YmUgZG9uZSBmaXJzdCBwdXJlbHkgaW4gaTkxNSwgdGhlbiBwb3J0ZWQgdG8gZHJtLXhlLW5leHQN
Cj4gd2l0aCB0aGUgcHJvcGVyIGNsZWFuLXVwLg0KDQpSaWdodCwgdGhpcyBtYWtlcyBzZW5zZS4N
Cg0KDQo+IEJ1dCBhdCB0aGlzIHBvaW50LCBJJ20gYXNraW5nIG15c2VsZiB3aHkgZG9lcyBkaXNw
bGF5IGNvZGUgbmVlZHMNCj4gdG8gdGFrZSB0aGUgdW5jb3JlIGxvY2sgdG8gc3RhcnQgd2l0aD8g
d2hhdCBraW5kIG9mIHJhY2VzIG9yIHNlcmlhbGl6YXRpb24NCj4gYXJlIHdlIHRyeWluZyB0byBh
Y2NvbXBsaXNoIHdpdGggdGhpcz8NCj4gDQo+IFRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSBiaWcg
cGljdHVyZSBoZXJlIHNvIHdlIGNhbiB0cnkgdG8gZmluZCB0aGUgcmlnaHQNCj4gc29sdXRpb24u
IEkgbWVhbiwgbWF5YmUgdGhlIHJpZ2h0IHNvbHV0aW9uIGlzIGV2ZW4gYWRkIHRoZSBzcGluX2xv
Y2tzIHRvDQo+IHhlX21taW8gYW5kIG1ha2UgYm90aCB4ZV9tbWlvIGFuZCBpbnRlbF91bmNvcmUg
dG8gZXhwb3J0IGhlbHBlcnMgZm9yIHRoZQ0KPiBleHRlcm5hbCBsb2NraW5nIG1lY2hhbmlzbT8N
Cg0KVGhlIGludGVudGlvbiBvZiB0aGlzIHBhdGNoIGlzIG5vdCB0byBjaGFuZ2UgYW55dGhpbmcg
ZnVuY3Rpb25hbGx5LCBzbw0KSSB0aGluayB0aGlzIHNob3VsZCBiZSBhZGRyZXNzZWQgc2VwYXJh
dGVseS4NCg0KDQo+IEFsdGhvdWdoIHRvIG1lIGl0IHNvdW5kcyBsaWtlIHRoZSBwaXRmYWxsIG9m
IHVzaW5nIGxvY2tzIHRvIHByb3RlY3QgY29kZQ0KPiBhbmQgbm90IGRhdGE6IGh0dHBzOi8vYmxv
Zy5mZndsbC5jaC8yMDIyLzA3L2xvY2tpbmctZW5naW5lZXJpbmcuaHRtbA0KDQpUaGFua3MgZm9y
IHRoZSBsaW5rISBJJ2xsIGNoZWNrIGl0IG91dC4NCg0KQW5kIHRoYW5rcyBmb3IgdGhlIHJldmll
dy4gIEknbGwgcmVzcGluIHRoaXMgc28gaXQncyBkb25lIGluIGk5MTUNCmZpcnN0LCBzbyB3ZSBj
YW4gaW5jbHVkZSB0aGF0IG9uZSBpbiB4ZSB3aXRoIHRoZSBuZWVkZWQgbW9kaWZpY2F0aW9ucy4N
Cg0KLS0NCkNoZWVycywNCkx1Y2EuDQo=
