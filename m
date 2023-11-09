Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A778C4167B
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 15:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BF310E036;
	Thu,  9 Nov 2023 15:24:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E0410E036
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699543489; x=1731079489;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iU0bfAsRBcw2GGIUaU/lSbJ2ioVJR+Om/+01ryOSdXw=;
 b=dVd5Yw88IS5r6jxR2dG4Epb+SIBZ2OFf7q0yDlhUqLeP0VlsPw0Q15fr
 IEpnx52UAn7Js8HbUeiZpg1hKrVWs96L4x/GBj+bAKwB0xUwx1Tz9pRge
 Ck1geGcEGvlMjHqR+uEsI1OJoILBNZGTdFozg3VrIBrZqlsXsLpJoJ1Ra
 ta6Lr7mYQ3licP9xP6ypql7J5BeRvIzIAcOBXFHVC/f8rHeBhrOUgiSnH
 LQA5xp5iBriVSwy+nQrvqEWqvN3VuuFdnFpBrWYksdsDQvdT6nHixaHEO
 Ofg9Ov23ihsgTeGSbWeS82n9XqdsGSkX06Hi6o70676fYg26pyaeiAWSD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="387166189"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="387166189"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 07:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="767029419"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="767029419"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 07:24:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 07:24:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 07:24:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 07:24:22 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 07:24:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC/G6WfNs3qQPanwbMKXKjE+Z1z6IOgi2iGOiLf+lVmOMUwS5Pt84OBh1H7nulduRLDhepm0Ll03Q8KAB2XNw+CcvlF/6Ql8Di4K8QI1AcLU2hwSeaQ0JPlTPq2p3vtqu56owSkoCqvIkkQduRSbHh9dQjhuvT6APuQ09E3GfT3HH44T/n0TG7Sat0c78cY3wYInnNxBGUOsu6LWIpVRoE/wxB5CSA6WsJQ0nQkff3piHS/AbOtydwori9HIl8wlX245iGuPYrX0ISMb5jHkV3k0gYQLjqh4oHtWiiyYYmZxeUc0Vk7quqUlnZxeSIkE8GPznpFMGD1WJzRC/jIPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iU0bfAsRBcw2GGIUaU/lSbJ2ioVJR+Om/+01ryOSdXw=;
 b=MwIGc7XAjPiEKDNYBU5jpAHAYQLB2j9g3q/KQQTZGRr+veM24rGoX0s+Z9vit34HB+Q6Thb18go6TyLWuvfALU2VEEhIopYuPSFI0ef7qwuEetNfOOaRRX/WiUJ6oJEkY+pgh88Dp9bb+wa/qUQt236hiVjZM1CYeiHspBALbNuNhDvlCJrnOnN/tr1c0iXzVCUEyU7RXGhfH5fEx8OkacxRnNvfg6XJgZhiHIs2No+3ifkNl0Cx579miBHgbWyJlupGyzqvFEBTaExMiS5iJvKt09Fd1ay78X4ge3hnwVE5vReF3N6xyzX2VlhKOs0KCXaPTnPwtCA7UyPwgpPiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 15:24:19 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::c112:9cb2:ff33:b512]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::c112:9cb2:ff33:b512%3]) with mapi id 15.20.6954.029; Thu, 9 Nov 2023
 15:24:19 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "Milczarek, Slawomir"
 <slawomir.milczarek@intel.com>, Tomasz Mistat
 <tomasz.mistat@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Arteaga Molina, Jaime A"
 <jaime.a.arteaga.molina@intel.com>, "Cetnerowski, Adam"
 <adam.cetnerowski@intel.com>, "Chodor, Jaroslaw" <jaroslaw.chodor@intel.com>, 
 "Dunajski, Bartosz" <bartosz.dunajski@intel.com>, "Harasimiuk, Artur"
 <artur.harasimiuk@intel.com>, "Hoppe, Mateusz" <mateusz.hoppe@intel.com>,
 "Jablonski, Mateusz" <mateusz.jablonski@intel.com>, "Jobczyk, Lukasz"
 <lukasz.jobczyk@intel.com>, "Kasper, Kacper K" <kacper.k.kasper@intel.com>,
 "Rozenfeld, Piotr" <piotr.rozenfeld@intel.com>, "Wilma, Pawel"
 <pawel.wilma@intel.com>, "Wolny, Bartlomiej" <bartlomiej.wolny@intel.com>,
 "Yates, Brandon" <brandon.yates@intel.com>, "Zdanowicz, Zbigniew"
 <zbigniew.zdanowicz@intel.com>
Thread-Topic: FW: [Intel-xe] [PATCH v9 0/3] PAT and cache coherency support
Thread-Index: AQHaEjcC8KkdjP8z1kGuapkljd5tCrBwUtkAgAHDNoCAAAHXAIAABSDg
Date: Thu, 9 Nov 2023 15:24:18 +0000
Message-ID: <BN9PR11MB527557220C41FFD53AE7A425E7AFA@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <ZUtv1eH5uiHl3j9N@tmistat-desk>
 <0c8104df-3c51-95a4-aec1-392b4b92efb9@intel.com>
 <CH3PR11MB8494CC467BA08CA3D00B7EE59DAFA@CH3PR11MB8494.namprd11.prod.outlook.com>
 <d71fbd17-72ae-796c-7c7c-964f7926ea26@intel.com>
In-Reply-To: <d71fbd17-72ae-796c-7c7c-964f7926ea26@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|DM4PR11MB5549:EE_
x-ms-office365-filtering-correlation-id: f47e46db-4881-4f24-882d-08dbe137f13e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XJQQ5soSA3hvILoCPrLseTqgOnoO1ZraprIcsMdosifBbz+lqp9V6ZA++hJFU2/JsemgRFNOVNrWCw8FqUQYo/wZmZiW8uMmvhv+/JoPFNBlPXa18d2g7cCzcyXJ9vQssXX4dUNraxZob/ul9CM6DxO71XDjG2UrfXOHtTPRDS1JR1p8znyU3VkmVeVsAvho5JV0mduZMJegOcJWu1YzbD80Xj8MxribOEou4CafTESJNiTCsoC3tKC8hjQSI9zzxCeo+LrHWMAU9rPhGdzwoZ1Zib/FIBisBvjAMpImgDm8Znm/kJz9miRiIlFQbZ9+d8df2G2VlRNN4jOTTi/YEy3ADy5y9UBPZ0wqpUoc1U9XF2VrzRNW0D1M1iurmfKEfHTrpocYiIG+9HXoQzUBWMxbWyRaGBRydcrGpzuLD3uhBlxXeXw4KjleIOZsf5DghvRyudSJ8kOpZgY9njw0UK4RURxLOAeZnULLjfcG4lvpAGW//8L5PVJeGcWUHVDLAWiKYWZaSBT11j3votVKb/wy94FCvkLU4AMJsNXDPTdTAZsGzw0GtO9/Urid+rpE8L/VytEnFi089lv0yR9+bGdUOlpKaXUYkKH8G/6yzNgDHU3SLiBI1w6pAHPAgqtjGRu8YHgST+OCcZkLDF+/5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(9686003)(53546011)(83380400001)(110136005)(66946007)(76116006)(26005)(478600001)(66476007)(7696005)(71200400001)(6506007)(52536014)(55016003)(8936002)(8676002)(6636002)(64756008)(66556008)(316002)(66446008)(966005)(41300700001)(5660300002)(38100700002)(86362001)(82960400001)(122000001)(2906002)(38070700009)(33656002)(921008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkhNa2MvUkpaSkEwSG1XWit1QXBVa2o3dm0yYUFWWHdSTjZKNUM5VVF3RmVz?=
 =?utf-8?B?b1ZrTVFGNmFXOFl5MGtZUyt5V1c4SU5sTjZJRWxCa2ZwdzhCYVltNjFXTFVo?=
 =?utf-8?B?WWs4UFI0TnN4MGpPSmdrdHRTTHI4bHpGTTZKTjlTN0FsNnpMN2VYMzZoTjUx?=
 =?utf-8?B?ZmdpaGtKR2NHMm5VdDAzdlJkSnQ1Vjh4NDhuRlpmYytxVHJyUGV0czBGcEV4?=
 =?utf-8?B?Tk1SSDRHTUx1QzYxOUtQamh2WW95NTRJN0wvaU9lblN1allaRlNUc2V2LzND?=
 =?utf-8?B?M0VYSWJjVXBpVUcyTk9seS9xY1hqeUc3OHdjT0V4cElzSmhtUjdLNTVFeDd2?=
 =?utf-8?B?a3h6K1pJT0NJU2lyUXlsTTM2a0pObG5paDhJWFp5aEE2SGM5UnNVeFpqUzdS?=
 =?utf-8?B?NHN5MHRqdlRrSjNNZUpVcjFQSnNBcUI4VUJBRUZ3Ykx1cU1HaW1CaVE1L0Rx?=
 =?utf-8?B?dXNHb0JRYThjM0lySkwyRWxudFpRQSsxWm1KaVJSaXBVNVVlTjBhOWo2U2li?=
 =?utf-8?B?QkZFREdnKzNoT2RIYk5HNnI4eDlrWnFNakhWY3JrNURBNnBkZk11M2hjNzZj?=
 =?utf-8?B?clp4bnFxM25SK1JwTEcvYXFiVjd5OE80SlRpUUNGSTVGb0dQaHhvVUF5UzRs?=
 =?utf-8?B?QzM0VVdGdWlrdThEdUF3dWpVZmVROS9MYUs0UGZ2eUtRcFFrRXVhdlY3SElN?=
 =?utf-8?B?dmdPakVVYVFxZ0FwMHZOeGY1UFY0NmtBOXArWG92eFZkVFRORzlPY3J4VnVK?=
 =?utf-8?B?Y1BMMElWNkM4bmh2cWxvMVRkOGlNbjBrUk1mNlE1OGc3VkNTaGxMeFZhZ3N0?=
 =?utf-8?B?OVdTb1ZOaVM2eHhDcVpDcm5XbUxVbTF3VFh3VzZGWFlLajBwcEY0dW03RUly?=
 =?utf-8?B?YnA4Y3NLRStkcmREbGRFejQ5eXNvSkRqUWpCUzFQYzQyNytrbTJleHBwUUFR?=
 =?utf-8?B?QUMwb2lqSXc4aXgycVY5T2dhS1BHKzlqMnB1UlhnS1hkTWJ4TGZEaU52SUcy?=
 =?utf-8?B?VzFIS3QxakR2MTl2REFoS1QrWmV2ZjlCN2Q0WXZMaEZ2aEp6TXlKbVJzaHlW?=
 =?utf-8?B?alZWS0hVc1RxWWtWQzN0NjRVSXNiaUlieFU2aENzMjI5ZExIN3A5S2cwdy9P?=
 =?utf-8?B?RXMydllqUi9QaG5xMml2NUJWSjgwMWYxc2Z4NDlHQlVKYm1JVXdjaUJtMk5M?=
 =?utf-8?B?RE9zdHpwangzaFVoSXMvb1B4RVhXZlU3akJyWTJSMTFvblFUb1NEdTRxNTlM?=
 =?utf-8?B?OGF2Wld1MzhGRFdnNCtRcm5KRkEwQTJLczhsTnZqVVBqc0R6VmszY2h6aTMw?=
 =?utf-8?B?OTcwZ2k4VFhVWTN6R3lJVUJjRDZJWERtTzdJQmtYbkRreXpOdXVrY1ZCenFD?=
 =?utf-8?B?Z1NVSTUwaFJWamgvRllyZk03MlYyOWRkRDZ1S1AwUXE0SzZuWDc5aTloWVFv?=
 =?utf-8?B?VkRpd1EwMnlDWmhQRTZUWHNidjhEaFhUT3VJbzJEMlFNeTdNR3lwZENkSUIr?=
 =?utf-8?B?TzFRcVRhUGFDQnlhbjMyR3pyLzhmUUF4UHFQRE9NSnAwTlU3QS9rLy9OV21Z?=
 =?utf-8?B?Qmd0ZmdaL001NlNQK0ppd3k0SlA2dHhJMldUTG53cnh1TzViOWYvTSs4K21O?=
 =?utf-8?B?NWVqSFBSZDZNSXUybU90aHBVM05ybnVjUVQ0djVSTDFTVlFtcUxGbWk2WkEy?=
 =?utf-8?B?eXZXSkNIL01oNTBLc1d0NXBxMUxJb3pTK3lZNUZrQ0lyeTNySUpPREpSQks4?=
 =?utf-8?B?N2RkUGhEbmV3QTZtZUFTb0gvK2FvNWFnMENJTzVhRlhLbllETzFRMnJaMFVu?=
 =?utf-8?B?ck4ySHJPK3ZlZWtEbWo2TktXR1ZmbndnRUdLSm9KSUJjb0w5aHlrZUJ2SHds?=
 =?utf-8?B?OER4U3c3WHFFUCs1eERKTjRwYVpNZFFzZ3dHN3BGZkRwYldLdHlBalY5YVUx?=
 =?utf-8?B?UFdyRER0Y09WUnBIcjZwTzdJdkR1N3VXZjZLN2J6SkRQcEpITWMzQ0QwZ0dP?=
 =?utf-8?B?R21JZ2Jldkw0RVFaVGl0ZDhVSU95b0Z1d21uNkg3RUZEcFpMa2R2enlVanll?=
 =?utf-8?B?OXpkbFhkZDVNc0dTS0dpbzdpZCt1d1hJVng4WXhLaWYxem13ZHhJV0IzL1BI?=
 =?utf-8?Q?uol9Y06p4yY92rvrR4nZJTQVy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47e46db-4881-4f24-882d-08dbe137f13e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 15:24:18.9774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQ3jvQl59+gv3tC5GIbXMqWomF/KJeHSYx66uX2vNa8UO6ppz3TfXH4Mb8b5Sdcl0pOXH2bHt8mYNYO2cjxb9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5549
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] FW:  [PATCH v9 0/3] PAT and cache coherency support
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

V2lsbCBLTUQgZmFpbCB0aGUgbW1hcCBjYWxsIGlmIHdlIHByb3ZpZGUgaW5jb3JyZWN0IG1hcHBp
bmcgPw0KSS5lLiBXQiBtbWFwIG9uIG5vbi1jb2hlcmVudCBHUFUgcmVzb3VyY2U/DQoNCk1pY2hh
bA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQXVsZCwgTWF0dGhldyA8bWF0
dGhldy5hdWxkQGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIgOSwgMjAyMyA0
OjA1IFBNDQpUbzogTWlsY3phcmVrLCBTbGF3b21pciA8c2xhd29taXIubWlsY3phcmVrQGludGVs
LmNvbT47IFRvbWFzeiBNaXN0YXQgPHRvbWFzei5taXN0YXRAbGludXguaW50ZWwuY29tPjsgaW50
ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBBcnRlYWdhIE1vbGluYSwgSmFpbWUgQSA8amFp
bWUuYS5hcnRlYWdhLm1vbGluYUBpbnRlbC5jb20+OyBDZXRuZXJvd3NraSwgQWRhbSA8YWRhbS5j
ZXRuZXJvd3NraUBpbnRlbC5jb20+OyBDaG9kb3IsIEphcm9zbGF3IDxqYXJvc2xhdy5jaG9kb3JA
aW50ZWwuY29tPjsgRHVuYWpza2ksIEJhcnRvc3ogPGJhcnRvc3ouZHVuYWpza2lAaW50ZWwuY29t
PjsgSGFyYXNpbWl1aywgQXJ0dXIgPGFydHVyLmhhcmFzaW1pdWtAaW50ZWwuY29tPjsgSG9wcGUs
IE1hdGV1c3ogPG1hdGV1c3ouaG9wcGVAaW50ZWwuY29tPjsgSmFibG9uc2tpLCBNYXRldXN6IDxt
YXRldXN6LmphYmxvbnNraUBpbnRlbC5jb20+OyBKb2JjenlrLCBMdWthc3ogPGx1a2Fzei5qb2Jj
enlrQGludGVsLmNvbT47IEthc3BlciwgS2FjcGVyIEsgPGthY3Blci5rLmthc3BlckBpbnRlbC5j
b20+OyBNcm96ZWssIE1pY2hhbCA8bWljaGFsLm1yb3pla0BpbnRlbC5jb20+OyBSb3plbmZlbGQs
IFBpb3RyIDxwaW90ci5yb3plbmZlbGRAaW50ZWwuY29tPjsgV2lsbWEsIFBhd2VsIDxwYXdlbC53
aWxtYUBpbnRlbC5jb20+OyBXb2xueSwgQmFydGxvbWllaiA8YmFydGxvbWllai53b2xueUBpbnRl
bC5jb20+OyBZYXRlcywgQnJhbmRvbiA8YnJhbmRvbi55YXRlc0BpbnRlbC5jb20+OyBaZGFub3dp
Y3osIFpiaWduaWV3IDx6Ymlnbmlldy56ZGFub3dpY3pAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6
IEZXOiBbSW50ZWwteGVdIFtQQVRDSCB2OSAwLzNdIFBBVCBhbmQgY2FjaGUgY29oZXJlbmN5IHN1
cHBvcnQNCg0KT24gMDkvMTEvMjAyMyAxNDo1OCwgTWlsY3phcmVrLCBTbGF3b21pciB3cm90ZToN
Cj4gSGkgTWF0dGhldywNCj4gDQo+IEluIHRoZSBjb21wdXRlIGRyaXZlciB3ZSBjYWxsIEdFTV9N
TUFQX09GRlNFVCB3aXRoIGZsYWdzIHRvIHNwZWNpZnkgY3B1IGNhY2hlIG1vZGUgKHdiL3djKToN
Cj4gR0VNX0NSRUFURV9FWFQoKSBhbmQgbW1hcCgpICsgR0VNX01NQVBfT0ZGU0VUKGZsYWdzPXdi
L3djKQ0KPiANCj4gU3RhcnRpbmcgZnJvbSBYZSBLTUQgd2Ugc2hvdWxkIGJlIGFibGUgdG8gYWNo
aWV2ZSB0aGUgc2FtZSBDUFUgY2FjaGluZyBwb2xpY2llcyB3aXRoIEdFTV9DUkVBVEVfRVhUOg0K
PiBHRU1fQ1JFQVRFX0VYVChmbGFncz13Yi93YykgYW5kIG1tYXAoKSArIEdFTV9NTUFQX09GRlNF
VChmbGFncz0wKSBBbSBJIA0KPiBjb3JyZWN0Pw0KDQpZZXMsIHRoYXQncyBjb3JyZWN0Lg0KDQo+
IA0KPiBUaGFua3MsDQo+IFNsYXdlaw0KPiANCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogQXVsZCwgTWF0dGhldyA8bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBOb3ZlbWJlciA4LCAyMDIzIDE6MDQgUE0NCj4gVG86IFRvbWFzeiBNaXN0YXQg
PHRvbWFzei5taXN0YXRAbGludXguaW50ZWwuY29tPjsgDQo+IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgQXJ0ZWFnYSBNb2xpbmEsIEphaW1lIEEgDQo+IDxKYWltZS5BLkFydGVhZ2Eu
TW9saW5hQGludGVsLmNvbT47IENldG5lcm93c2tpLCBBZGFtIA0KPiA8YWRhbS5jZXRuZXJvd3Nr
aUBpbnRlbC5jb20+OyBDaG9kb3IsIEphcm9zbGF3IA0KPiA8amFyb3NsYXcuY2hvZG9yQGludGVs
LmNvbT47IER1bmFqc2tpLCBCYXJ0b3N6IA0KPiA8YmFydG9zei5kdW5hanNraUBpbnRlbC5jb20+
OyBIYXJhc2ltaXVrLCBBcnR1ciANCj4gPGFydHVyLmhhcmFzaW1pdWtAaW50ZWwuY29tPjsgSG9w
cGUsIE1hdGV1c3ogDQo+IDxtYXRldXN6LmhvcHBlQGludGVsLmNvbT47IEphYmxvbnNraSwgTWF0
ZXVzeiANCj4gPE1hdGV1c3ouSmFibG9uc2tpQGludGVsLmNvbT47IEpvYmN6eWssIEx1a2FzeiAN
Cj4gPGx1a2Fzei5qb2JjenlrQGludGVsLmNvbT47IEthc3BlciwgS2FjcGVyIEsgDQo+IDxrYWNw
ZXIuay5rYXNwZXJAaW50ZWwuY29tPjsgTWlsY3phcmVrLCBTbGF3b21pciANCj4gPHNsYXdvbWly
Lm1pbGN6YXJla0BpbnRlbC5jb20+OyBNcm96ZWssIE1pY2hhbCANCj4gPG1pY2hhbC5tcm96ZWtA
aW50ZWwuY29tPjsgUm96ZW5mZWxkLCBQaW90ciANCj4gPHBpb3RyLnJvemVuZmVsZEBpbnRlbC5j
b20+OyBXaWxtYSwgUGF3ZWwgPHBhd2VsLndpbG1hQGludGVsLmNvbT47IA0KPiBXb2xueSwgQmFy
dGxvbWllaiA8YmFydGxvbWllai53b2xueUBpbnRlbC5jb20+OyBZYXRlcywgQnJhbmRvbiANCj4g
PGJyYW5kb24ueWF0ZXNAaW50ZWwuY29tPjsgWmRhbm93aWN6LCBaYmlnbmlldyANCj4gPHpiaWdu
aWV3LnpkYW5vd2ljekBpbnRlbC5jb20+OyBEdW5hanNraSwgQmFydG9zeiANCj4gPGJhcnRvc3ou
ZHVuYWpza2lAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogRlc6IFtJbnRlbC14ZV0gW1BBVENI
IHY5IDAvM10gUEFUIGFuZCBjYWNoZSBjb2hlcmVuY3kgDQo+IHN1cHBvcnQNCj4gDQo+IE9uIDA4
LzExLzIwMjMgMTE6MzAsIFRvbWFzeiBNaXN0YXQgd3JvdGU6DQo+PiBjb21wdXRlLXVtZF91YXBp
X3Jldmlld190ZWFtQGludGVsLmNvbSxiYXJ0b3N6LmR1bmFqc2tpQGludGVsLmNvbSxzYXUNCj4+
IHIgDQo+PiBhYmhnLmd1cHRhQGludGVsLmNvbSx1bGlzc2VzLmZ1cnF1aW1AaW50ZWwuY29tLG1p
Y2hhbC5tcm96ZWtAaW50ZWwuY28NCj4+IG0gDQo+PiAsdG9tYXN6Lm1pc3RhdEBpbnRlbC5jb20s
cGlvdHIucm96ZW5mZWxkQGludGVsLmNvbSxheWF6LnNpZGRpcXVpQGludGUNCj4+IGwgDQo+PiAu
Y29tLGx1aXMuc3RyYW5vQGludGVsLmNvbSxmaWxpcC5oYXp1YnNraUBpbnRlbC5jb20sZmlsaXAu
aGF6dWJza2lAaW4NCj4+IHQgZWwuY29tLG1hdGV1c3oubmFrbGlja2lAaW50ZWwuY29tLGthbWls
LmtvcHJ5a0BpbnRlbC5jb20NCj4+IEJjYzoNCj4+IFN1YmplY3Q6IFJlOiBbSW50ZWwteGVdIFtQ
QVRDSCB2OSAwLzNdIFBBVCBhbmQgY2FjaGUgY29oZXJlbmN5IA0KPj4gc3VwcG9ydA0KPj4gUmVw
bHktVG86DQo+PiBJbi1SZXBseS1UbzogPDIwMjMxMTAzMTU0MzA5LjQwMjE1OS01LW1hdHRoZXcu
YXVsZEBpbnRlbC5jb20+DQo+Pg0KPj4gT24gMjAyMy0xMS0wMyBhdCAxNTo0MzoxMCArMDAwMCwg
TWF0dGhldyBBdWxkIHdyb3RlOg0KPj4+IEJyYW5jaCBhdmFpbGFibGUgaGVyZToNCj4+PiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbXdhL2tlcm5lbC8tL3RyZWUveGUtcGF0LWluZGV4
P3JlZl90eQ0KPj4+IHANCj4+PiBlPWhlYWRzDQo+Pj4NCj4+PiBJR1QgY2hhbmdlczoNCj4+PiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEyNDY2Ny8NCj4+Pg0KPj4+
IE1lc2E6DQo+Pj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL21l
cmdlX3JlcXVlc3RzLzI1NDYyDQo+Pj4NCj4+PiBHb2FsIGhlcmUgaXMgdG8gYWxsb3cgdXNlcnNw
YWNlIHRvIGRpcmVjdGx5IGNvbnRyb2wgdGhlIHBhdF9pbmRleCANCj4+PiB3aGVuIG1hcHBpbmcg
bWVtb3J5IHZpYSB0aGUgcHBHVFQsIGluIGFkZHRpb24gdG8gdGhlIENQVSBjYWNoaW5nIA0KPj4+
IG1vZGUuIFRoaXMgaXMgdmVyeSBtdWNoIG5lZWRlZCBvbiBuZXdlciBpZ3B1IHBsYXRmb3JtcyB3
aGljaCBhbGxvdyANCj4+PiBpbmNvaGVyZW50IEdUIGFjY2Vzcywgd2hlcmUgdGhlIGNob2ljZSBv
dmVyIHRoZSBjYWNoZSBsZXZlbCBhbmQgDQo+Pj4gZXhwZWN0ZWQgY29oZXJlbmN5IGlzIGJlc3Qg
bGVmdCB0byB1c2Vyc3BhY2UgZGVwZW5kaW5nIG9uIHRoZWlyIA0KPj4+IHVzZWNhc2UuICBJbiB0
aGUgZnV0dXJlIHRoZXJlIG1heSBhbHNvIGJlIG90aGVyIHN0dWZmIGVuY29kZWQgaW4gdGhlIHBh
dF9pbmRleCwgc28gZ2l2aW5nIHVzZXJzcGFjZSBkaXJlY3QgY29udHJvbCB3aWxsIGFsc28gYmUg
bmVlZGVkIHRoZXJlLg0KPj4+DQo+Pj4gVG8gc3VwcG9ydCB0aGlzIHdlIGFkZGVkIG5ldyBnZW1f
Y3JlYXRlIHVBUEkgZm9yIHNlbGVjdGluZyB0aGUgQ1BVIA0KPj4+IGNhY2hlIG1vZGUgdG8gdXNl
IGZvciBzeXN0ZW0gbWVtb3J5LCBpbmNsdWRpbmcgdGhlIGV4cGVjdGVkIEdQVSANCj4+PiBjb2hl
cmVuY3kgbW9kZS4gVGhlcmUgYXJlIHZhcmlvdXMgcmVzdHJpY3Rpb25zIGhlcmUgZm9yIHRoZSBz
ZWxlY3RlZCANCj4+PiBjb2hlcmVuY3kgbW9kZSBhbmQgY29tcGF0aWJsZSBDUFUgY2FjaGUgbW9k
ZXMuICBXaXRoIHRoYXQgaW4gcGxhY2UgDQo+Pj4gdGhlIGFjdHVhbCBwYXRfaW5kZXggY2FuIG5v
dyBiZSBwcm92aWRlZCBhcyBwYXJ0IG9mIHZtX2JpbmQuIFRoZSANCj4+PiBvbmx5IHJlc3RyaWN0
aW9uIGlzIHRoYXQgdGhlIGNvaGVyZW5jeSBtb2RlIG9mIHRoZSBwYXRfaW5kZXggbXVzdCBiZSAN
Cj4+PiBhdCBsZWFzdCBhcyBjb2hlcmVudCBhcyB0aGUgZ2VtX2NyZWF0ZSBjb2hlcmVuY3kgbW9k
ZS4gVGhlcmUgYXJlIGFsc28gc29tZSBzcGVjaWFsIGNhc2VzIGxpa2Ugd2l0aCB1c2VycHRyIGFu
ZCBkbWEtYnVmLg0KPj4+DQo+Pj4gdjI6DQo+Pj4gICAgIC0gTG9hZHMgb2YgaW1wcm92ZW1lbnRz
L3R3ZWFrcy4gTWFpbiBjaGFuZ2VzIGFyZSB0byBub3cgYWxsb3cNCj4+PiAgICAgICBnZW1fY3Jl
YXRlLmNvaF9tb2RlIDw9IGNvaF9tb2RlKHBhdF9pbmRleCksIHJhdGhlciB0aGFuIGl0IG5lZWRp
bmcgdG8gbWF0Y2gNCj4+PiAgICAgICBleGFjdGx5LiBUaGlzIHNpbXBsaWZpZXMgdGhlIGRtYS1i
dWYgcG9saWN5IGZyb20gdXNlcnNwYWNlIHBvdi4gQWxzbyB3ZSBub3cNCj4+PiAgICAgICBvbmx5
IGNvbnNpZGVyIENPSF9OT05FIGFuZCBDT0hfQVRfTEVBU1RfMVdBWS4NCj4+PiB2MzoNCj4+PiAg
ICAgLSBSZWJhc2UuIFNwbGl0IHRoZSBwdGVfZW5jb2RlKCkgcmVmYWN0b3JpbmcsIHBsdXMgdmFy
aW91cyBzbWFsbGVyIHR3ZWFrcyBhbmQNCj4+PiAgICAgICBmaXhlcy4NCj4+PiB2NDoNCj4+PiAg
ICAgLSBSZWJhc2Ugb24gTHVjYXMnIG5ldyBzZXJpZXMuDQo+Pj4gICAgIC0gRHJvcCBVQyBjYWNo
ZSBtb2RlLg0KPj4+ICAgICAtIHMvc21lbV9jcHVfY2FjaGluZy9jcHVfY2FjaGluZy8uIElkZWEg
aXMgdG8gbWFrZSBWUkFNIFdDIGV4cGxpY2l0IGluIHRoZQ0KPj4+ICAgICAgIHVhcGksIHBsdXMg
bWFrZSBpdCBtb3JlIGZ1dHVyZSBwcm9vZi4NCj4+PiB2NToNCj4+PiAgICAgLSBSZWJhc2UsIHBs
dXMgc29tZSBzbWFsbCB0d2Vha3MgYW5kIGZpeGVzLg0KPj4+IHY2Og0KPj4+ICAgICAtIENJIGhv
b2tzIGZpeGVzICsgY2hlY2twYXRjaC4NCj4+PiB2NzoNCj4+PiAgICAgLSBTb21lIHNtYWxsIHR3
ZWFrcw0KPj4+IHY4Og0KPj4+ICAgICAtIFJlYmFzZSBvbiBYZTIgUEFUIHRhYmxlIGFkZGl0aW9u
cy4NCj4+PiB2OToNCj4+PiAgICAgLSBEcm9wIGNvaF9tb2RlLg0KPj4+DQo+Pj4gLS0NCj4+PiAy
LjQxLjANCj4+Pg0KPj4NCj4+IEknbSBzaGFyaW5nIGRvd24gaGVyZSBxdWVzdGlvbnMgcGFzc2Vk
IGJ5IGJhcnRvc3ouZHVuYWpza2lAaW50ZWwuY29tIA0KPj4gbGV0cyBjb250aW51ZSByZXZpZXcg
aGVyZSBhdCByZXNwZWN0aXZlIE1MDQo+Pg0KPj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciA4
LCAyMDIzIDA5OjA1DQo+PiBTdWJqZWN0OiBSRTogW0ludGVsLXhlXSBbUEFUQ0ggdjkgMC8zXSBQ
QVQgYW5kIGNhY2hlIGNvaGVyZW5jeSANCj4+IHN1cHBvcnQNCj4+DQo+PiBKdXN0IHRvIGNvbmZp
cm0gbXkgdW5kZXJzdGFuZGluZy4gV2Ugd2lsbCBoYXZlIDIgc2VwYXJhdGUgQVBJcz8NCj4+IDEu
CUZvciBnZW1fY3JlYXRlIHRvIGV4cGxpY2l0bHkgc2V0IGNvaGVyZW5jeS9jYWNoaW5nIGFjY29y
ZGluZyB0byBBUEkgZW51bXMNCj4gDQo+IFllYWgsIHlvdSBqdXN0IG5lZWQgdG8gcHJvdmlkZSB0
aGUgY3B1X2NhY2hpbmcgbW9kZSAod2Mgb3Igd2IpLiBJZiB5b3UgbGF0ZXIgbW1hcCgpIHRoZSBv
YmplY3QgdGhpcyBzYW1lIGNhY2hpbmcgbW9kZSBpcyB1c2VkLiBBbHNvIGFueSBLTUQgaW50ZXJu
YWwgdGhpbmdzIGxpa2Ugc3dhcC1pbiB3aWxsIGFsc28gcmVzcGVjdCB0aGlzIGNhY2hpbmcgbW9k
ZS4gVGhlIGNvaF9tb2RlIGlzIG5vdyByZW1vdmVkLg0KPiANCj4+IDIuCUZvciB2bV9iaW5kIHRv
IHNldCBQQVQgaW5kZXggdGhhdCBpcyBhbGlnbmVkIHdpdGggQnNwZWMgYW5kIGNvbnRyb2xzIG1v
cmUgdGhhbiAjMS4gSXQgY2FuIGFsc28gb3ZlcnJpZGUgY29oZXJlbmN5L2NhY2hpbmcgdGhhdCB3
YXMgcHJldmlvdXNseSBzZXQ/DQo+IA0KPiBSaWdodCwgYXMgcGFydCBvZiB2bV9iaW5kIHlvdSBw
cm92aWRlIHdoYXRldmVyIFBBVCBpbmRleCBjb250cm9sIChhcyANCj4gcGVyDQo+IEJzcGVjKSB5
b3Ugd2FudCBmb3IgZWFjaCBtYXBwaW5nIG9mIHRoZSBvYmplY3QgKHlvdSBjb3VsZCBtYXAgaXQg
bXVsdGlwbGUgdGltZXMpLg0KPiANCj4gV2hlbiBjaG9vc2luZyBhIFBBVCBpbmRleCB0aGUgY3B1
X2NhY2hpbmcgb25seSBtYXR0ZXJzIGlmIHlvdSBjaG9vc2UgYW4gaW5jb2hlcmVudCBQQVQgaW5k
ZXggKGNvaF9ub25lIGluIEJzcGVjKSwgc2luY2Ugd2UgZG9uJ3Qgd2FudCB0byBhbGxvdyBjcHVf
Y2FjaGluZz13YiBhbmQgY29oX25vbmUsIHNpbmNlIHRoYXQgbGVhZHMgdG8gc29tZSBjb21wbGlj
YXRpb25zIGluIHRoZSBLTUQuDQo+IA0KPj4NCj4+DQo=
