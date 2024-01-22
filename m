Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DEAC47DD9
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 18:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBACB10EC45;
	Mon, 22 Jan 2024 18:40:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAE110E5AB
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jan 2024 18:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705948853; x=1737484853;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+Zx/3tYBngP/HPVe9Erpt5xDygvYLwjMF+DCks4p6ac=;
 b=X948qQq//4W+u+t9lbQF8LspyZDzXfv1//3cXnenLU1AQY+HYVs0aAjP
 AwcyjwEPdbXS1/lvRIb9PiTnGoRmc8/JSOWM/x1aw5+bo2pgdUPrKY+Ee
 p8XtkqNjg4H9TYmudK1h7H0bSea2kywLrxcdcjER1QDKosncnCYGOP9X6
 QNjBZkZG+K65xkp4BaGI5cbg+/4wpHnpb9+qI9/tC6R+8ReRq3zhU7JPB
 +Lbpne1vMJra1BM9QCn/ymH+36XdIkOzUo6PW7DXnlqU2ynlFx+VPP1rM
 RIaw5d0NCjLTa7s2Z4JvXGx8u5ldsUQMuX+2apkaMCzgxeWD+ZBvm5kwL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8688424"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; 
   d="scan'208";a="8688424"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 10:38:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="904943548"
X-IronPort-AV: E=Sophos;i="6.05,212,1701158400"; d="scan'208";a="904943548"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2024 10:38:52 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 10:38:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 10:38:51 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 10:38:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2GXGS+w01WCzht9DZkB+rE+MlGoLl52RHO1LdIfxAMqXJILM4aIU1jHE/DAb/S0JYQgXlsiguFO64xUIStFKFeQus5JWf0MIWUCaj61R6wVaoEbisirVPOszlHYF11gLfVWlGZPlyGE/N+GMrn6f8m2wBuVh8q5OCvcM7tqX/3q7qTTp0tVc248yr8rUaLhnihhq4qKLp36xCkeWDjE08S3ZIgFXFChbDaMg1XXlJgHChtpAHRfttRnv1DTbG3uWmqO0BTqcZmiAXmMM3yvNFYKAM+TJYL2EQQYfVTJzWxB0dbIlnvi3gm0Il7lclvO+ZROEotdbt8Bmkbu0Hzihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Zx/3tYBngP/HPVe9Erpt5xDygvYLwjMF+DCks4p6ac=;
 b=McZ14v8SVvoL1K6xN/Y55PLQQUHaU95Xyj5+KstHvVdrfbwfHiYxFheLpcMxrsBulTwcu/QIv+Csg/EAC8/70vm7zG0CWskrB/qDzCn99PV+esNt9O2QsRY0AaKkFxsii3PRpn0evUm2xkdCqgizolUkud3MMpNzfCFTAHjdIYJucKPmgA4SRGq+7C6VeGx2bKYVP7ZuUbTEt5+FhrviLI8/Ge/p+XhTv2pRKd6FlIdiqPJ8TNzbenXoAtGNcyTVAqLUzlybaxy9VwyspM8IOp1qUF1UTR3l4bxGi80BxR07+YM4ZHMbOJOe6+sUnYnNukJwBuBsRRiD0FHoUIgJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB5016.namprd11.prod.outlook.com (2603:10b6:510:32::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Mon, 22 Jan 2024 18:38:48 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 18:38:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza, 
 Jose" <jose.souza@intel.com>
Subject: Re: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Topic: [PATCH 3/9] drm/xe: Add functions to convert regular address to
 canonical address and back
Thread-Index: AQHaTVU0tUhabWgp9kKY5rfrtsqlPbDmKcwA
Date: Mon, 22 Jan 2024 18:38:47 +0000
Message-ID: <ac8c0487457d8f6b7085f7fe9aec23472aff8587.camel@intel.com>
References: <20240122170445.108856-1-jose.souza@intel.com>
 <20240122170445.108856-3-jose.souza@intel.com>
In-Reply-To: <20240122170445.108856-3-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB5016:EE_
x-ms-office365-filtering-correlation-id: a345838a-cbcd-4d32-89d2-08dc1b795f0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HBum/UHKKkcBQkTERKd9zGS6eEWFCZDPqVcQJaJK9aczm2PCYQH2k/qXmYSIX8rVP4LxB0OIBk4471JaMi41OmbPzDlz+KqZDo2sm/XDv48lRr47kKhNXlr+Uq8KYzyftnvH5eqnRVjPCOvkWMnnLu4yK1DjBwHvQgEoMV9JF3lJ5SMv5HxaUMeSaUeIKkOsHGiPSOtaJzdhtEc2YHSbPdpbKrJZYlvwTlHX3PC0YtyV4UH8Fhyep6+dwu4+hWQ4Kk0ujoToilEdsTDlwbdoqK/4uZBOt/Z0VBgl9u9lK64VbwGrUq9mN2LKIIM7LsM3mt1899KUKis2xv2OoLo/fZxHSPBx8hjXk6fux6mKknJnbXLB46Br8axUYf2CjAcGpQu1s5ESls+xQy5u5wWC114XbXVCTqhSy8pGAhomltyrZe6FFLqRMctbQi3n0cEk0FndJGdHxuMxpFYtGS4vFGiE78NG0nCtEDXscoJK1K4WZ+xZ0JOdLtHEmARiAY+ancXwbnDVV3jx1gGv2NAlq1ZFJNlp9ZuIUr3VS7m/FsBQbCDbNkXdVA0hBQVjnMB7NDzVY2TlaCmiEqiReDvXWBZ+O6hDF3WfxSGoTjfewVkD0X044Hm244LqEXP6xZVt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(366004)(396003)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6506007)(26005)(107886003)(2616005)(71200400001)(6512007)(83380400001)(5660300002)(2906002)(41300700001)(478600001)(110136005)(6486002)(66476007)(6636002)(66556008)(66446008)(8936002)(91956017)(76116006)(66946007)(54906003)(316002)(64756008)(4326008)(8676002)(82960400001)(38100700002)(86362001)(36756003)(122000001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVNNZVM5SmMxM05vMmo5VnJFdnEvMkYwMFFETkFUc0RONzQ0MW1RZmNoMVla?=
 =?utf-8?B?OXpuRVBMQitDWTZ3bGJOKzNQSmYwWWlkRW8xRUhHWUtxbUlxWHludlRwczUy?=
 =?utf-8?B?OEFPY041aHF3dUZ5b1gyV0l4elUzWFFDa1IxY2lWNCtEaWZWWDg5ajRpWDZM?=
 =?utf-8?B?SUxRVHNJNkY4VjVZZnZrdFRHbXRUMDBjVkpjSTl0S1ltMU9nb2IwUmRMeldn?=
 =?utf-8?B?ZXVWQU1TMmV1anpPY3VhS0xNdmczQXBuVnFQMy9NTzN3VWM0NkVXOFp1N1lK?=
 =?utf-8?B?ZG5EYVNwMU9ZdmdGTmlYUE5ieVpTbVFHVkF5QkN0a0lGM05sMkxJZ3F2TW9x?=
 =?utf-8?B?N1lEQlh5azFNQ1ZNOWE5Q0xqQ3ZZNmZPejhDVTNiU012Y0N1SWRwK2lWSzR5?=
 =?utf-8?B?QndSODNjV3BxTWNacnZvaE56RXV3eXdhYlRETGlDckg0K3VybDI3eWk1bUk3?=
 =?utf-8?B?Tk1lUXc1Yk4wRm02WmNsenZvS0xxQWMyaGwyZS9hNjB0ckpNTU9mbjlER2Rr?=
 =?utf-8?B?b2pmSzBDRkJZQVdSVnR6R3p5QnE2SHpUZTEvand2SVdWRm9oaExpemtBdHVB?=
 =?utf-8?B?WGkxVUJMUDY3aFpvNDRIdnprQjdVNGxXNlMvUFdEUHA3K2Z5dDB2cUJEcUdz?=
 =?utf-8?B?N3ZtTTIyT1o2MzFlSjhFdzVMeE1PR1hZVjJ1bG0yb1E4L0tucDJYYjBCUkpD?=
 =?utf-8?B?STA5V3VQRVhrUDZINGpJVHZsT1kyd1l5VldiMm9XWnBiZGVDYUhyR0o5Rkt5?=
 =?utf-8?B?eUViU0VRcFFSTlkzOG43aENvRWRNNGVmbWJENGdPV1RZZ3hpS09PSWo1TEpl?=
 =?utf-8?B?S2xJcEVWSkowNWVEeFdaanRLU1VIWkdlb2U3Zjd2U01pYmVzYWRtOG5Xclda?=
 =?utf-8?B?N3oxN2FBV1dldmliVmpYbGMxT0Urb0ZqcWRPTm5KVE5ud1M4OHBtL0ZZODRS?=
 =?utf-8?B?YUFrWVpiU3VYZUExZzF3ZlBBK1o2YVc4bkJGRUdoeDAzOC9OemhzaGZlM2Mr?=
 =?utf-8?B?T1c1TjJ5ZFRnbU40dHRFc1FGWEFiL0RPVnBPY3pHb2wydGVEL28yMGZOamty?=
 =?utf-8?B?WW9tZmdIVnpBbzdlaEc4T1lYeEhKZmVxWEw1Q3VjRGlkMlFtNXhBWGgzTzZD?=
 =?utf-8?B?djUwZnFEaGFzSmlsT1BiRUkwa1ZlYzlEbjFRbmIxd2NxR3ZSaE9jdFd1Q280?=
 =?utf-8?B?ZzNvTnVMekFDWjVYR1czR1lNUGxxNjdyWTBRSHpTUXJpQjBnSVVMNU1EQStt?=
 =?utf-8?B?TkZLMlI1cDdacFE3V2FaWmwwUWZ3V2tnbENZdFJMOTNiUjRDbk5NSHJ2QUVL?=
 =?utf-8?B?WVB4M1Rwd3ZTSlovcjBSWS92V0ovdXozaDdCc20rSWlwR0dsZlQxV1RRQlpv?=
 =?utf-8?B?bGQzb2FxWDA3dERSSU1hOVAvRU5Ca3FtUFp3NVlhaEw3OVJ3R0hRdSs1ZGFt?=
 =?utf-8?B?c0svUUdBVkNwQ2kvZ0dpSlp2eE1EbUFlaHlTS1pRQ2Q3cTlFeGVmazJBMVJD?=
 =?utf-8?B?QnNzYUFUZko2UVVvdExzRUZ3RVlIWkNvVUxvb05kSHQ5eG1uZTBMOXVwQWsy?=
 =?utf-8?B?TEVOeExIOUdrWFV5UDh4Mm9ucmdoTUhZL0xldDNEQXo3ZmQzNm1ML2U5MUcw?=
 =?utf-8?B?TTJQWU8zTFRzQnkzWHBSclNESlFKZTg0NU80alJaL0U4ZnBXRnVZRUExaHJo?=
 =?utf-8?B?ZVRDcklPaUFQQ0VZWVFMeUFuZUx6eW1saVpYQS9vTVJrcHJnVnhxRUJYOEth?=
 =?utf-8?B?ZG4yVGl6aUNER0MyMVgwMnZGa3ZwSm8zNzBnVEFxV0xGNGNjb283RUJmNzk4?=
 =?utf-8?B?dU1ZYlkrdkNtM2VhZmo4TjJPTVRta1lHTHR4dTRiL3dyTTNhUWNCZENoWXFj?=
 =?utf-8?B?bDZGVXpWM1dVYTFsK1BCaGlsdVN3V0M0WTVMSjYzSTVXQ0tNc0NVaXZnT1FB?=
 =?utf-8?B?SlZaZW1kZkNGdVJteWQyOUNCdlVaVDFoUkdwR3g5WTc0ZGtreTc2eGVtR3lU?=
 =?utf-8?B?VWpIcTVxbk9sc0Z0U2luOHlhR1dWVGhmV1dkSlQ4SENjN05QWkwrOHBBWEo0?=
 =?utf-8?B?S2g3UWpmZ1dvL0h6MWx1eTR6UnVBZE9Ma3QraGlRRlBQbUFzRDlhMUZCTFJq?=
 =?utf-8?B?bnFkMWZ0cVhkdWlnVFJHRUxGaHN2Znh1SWltQkllTVVTQ3VxR2VrQmJpWjZi?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEC76F81B3E47F4190F8C5842C2F9C07@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a345838a-cbcd-4d32-89d2-08dc1b795f0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 18:38:47.8846 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LfZWravkbdc5ZZvzgtUBiYZsC+3MuggNcequiUl1QjsPWOtmKVc6V12MOMlMuoYALvzuWrd8/+ZkVbVEoQg6aB/z18p/p/NjvNMVxfNzDbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5016
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDI0LTAxLTIyIGF0IDA5OjA0IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBTb21lIGluc3RydWN0aW9ucyByZXF1aXJlcyBjYW5vbmljYWwgYWRkcmVzcyBs
aWtlDQo+IE1JX0JBVENIX0JVRkZFUl9TVEFSVChVTURzIG11c3QgY2FsbCB4ZV9leGVjIHdpdGgg
YSBjYW5vbmljYWwgYWRkcmVzcw0KPiBmb3IgWGUyKykuDQo+IA0KPiBTbyBoZXJlIGFkZGluZyBm
dW5jdGlvbnMgdG8gY29udmVydCByZWd1bGFyIGFkZHJlc3MgdG8gY2Fub25pY2FsDQo+IGFkZHJl
c3MgYW5kIGJhY2ssIHRoZSBmaXJzdCB1c2VyIG9mIHRoaXMgZnVuY3Rpb25zIHdpbGwgYmUgYWRk
ZWQNCj4gaW4gdGhlIG5leHQgcGF0Y2hlcy4NCj4gDQo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJp
Z28udml2aUBpbnRlbC5jb20+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3Jz
dC5zZT4NCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyB8
IDE1ICsrKysrKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCB8
wqAgMyArKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfZGV2aWNlLmMNCj4gaW5kZXggYWI0MTdmNGY3ZDJhNy4uYjRjZGNmMWIyMDgx
YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYw0KPiBAQCAtNzI3LDMgKzcyNywxOCBAQCB2
b2lkIHhlX2RldmljZV9tZW1fYWNjZXNzX3B1dChzdHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSkNCj4g
wqANCj4gwqDCoMKgwqDCoMKgwqDCoHhlX2Fzc2VydCh4ZSwgcmVmID49IDApOw0KPiDCoH0NCj4g
Kw0KPiArc3RhdGljIGlubGluZSBpbnQgaGlnaGVzdF9hZGRyZXNzX2JpdF9nZXQoc3RydWN0IHhl
X2RldmljZSAqeGUpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiB4ZS0+aW5mby5kbWFf
bWFza19zaXplID4gNDggPyA1NyA6IDQ3Ow0KDQpXaHkgbm90IGp1c3QgeGUtPmluZm8uZG1hX21h
c2tfc2l6ZSAtIDE/DQoNClRoYW5rcywNClN0dWFydA0KDQo+ICt9DQo+ICsNCj4gK3U2NCB4ZV9k
ZXZpY2VfY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNz
KQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gc2lnbl9leHRlbmQ2NChhZGRyZXNzLCBo
aWdoZXN0X2FkZHJlc3NfYml0X2dldCh4ZSkpOw0KPiArfQ0KPiArDQo+ICt1NjQgeGVfZGV2aWNl
X3VuY2Fub25pY2FsaXplX2FkZHIoc3RydWN0IHhlX2RldmljZSAqeGUsIHU2NCBhZGRyZXNzKQ0K
PiArew0KPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gYWRkcmVzcyAmIEdFTk1BU0tfVUxMKGhpZ2hl
c3RfYWRkcmVzc19iaXRfZ2V0KHhlKSwgMCk7DQo+ICt9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNl
LmgNCj4gaW5kZXggYWY4YWMyZTllMjcwOS4uY2UyMGY2ZmU2MjE5YSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuaA0KPiBAQCAtMTc1LDQgKzE3NSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB4
ZV9kZXZpY2VfaGFzX21lbWlycShzdHJ1Y3QNCj4geGVfZGV2aWNlICp4ZSkNCj4gwqANCj4gwqB1
MzIgeGVfZGV2aWNlX2Njc19ieXRlcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTY0IHNpemUpOw0K
PiDCoA0KPiArdTY0IHhlX2RldmljZV9jYW5vbmljYWxpemVfYWRkcihzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSwgdTY0IGFkZHJlc3MpOw0KPiArdTY0IHhlX2RldmljZV91bmNhbm9uaWNhbGl6ZV9hZGRy
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQNCj4gYWRkcmVzcyk7DQo+ICsNCj4gwqAjZW5kaWYN
Cg0K
