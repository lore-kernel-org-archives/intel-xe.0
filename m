Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C67E7D259
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 08:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D644610E372;
	Tue, 26 Sep 2023 08:25:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7D110E372
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695716749; x=1727252749;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KfdfJet6M+Mj+plXIcwOh38P3zL9ck+SyrfOB25sRi4=;
 b=HL3FqZqdqyFVzq6Rh+hiCAAW89i7a24qhRHdo8AZz8jB6O6YW/Ww2VRC
 gpJ0ts+BDhqP3NXUVZVv6HnnlRuABCUSDNg8rrgYH9xJRq4ZMp2dkMeZG
 G/iokG5du+esZLQWPr4fHJswLH83CA/69j1vSPL5TkJSMt6U1XxjW3X06
 3L5eHjOgAs4nac0Y2+H6PZDIb7p+SJkY2BdN4vY+HjbCye/LiLXMjWEwL
 oxWnEHmVYzSAi/hiupxYrrp5JOXvn3taoMSvRUHM2BA4vCfagt9CM1Sdo
 IE7W05nb6w03OaL4B4Hu+D9gMIpBwEJD9MBr9CgJ0ySS54pLGi6bpQe3n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385363371"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="385363371"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:25:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="698373467"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="698373467"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 01:25:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 01:25:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 01:25:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 01:25:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDAnhlDG/+BVzke5Z51a9+M1dpTGrANYDQbQQDf+2Q9ER98tgzuhtmSzp01WqVr0BY+m4OsqKjDKlNMcIKSOp/j/R1o+BqoJQCCJ9VcD58mX0MlRFFX1/v4yva5GnW66EEJuRWToxyhAgncKjpGvmH17bJp92medwahEV9MY82ZBAzBhdduaQi3+eCbZFrGu/zwYqKqTVyMxihYygolJry3b6m7RNJ1FuXnMoJNp1seECo/J8OfYLoZP6PGNBJ3kNR38QDgDp2B0bxts1Wn0dkVJlPn+KuNWdychl6AYwWS94hHLJau1GAH3+yQ5XYXN38fWlZc368gaPdQlcnJ2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfdfJet6M+Mj+plXIcwOh38P3zL9ck+SyrfOB25sRi4=;
 b=B3PdL080+T31k/Wvo5bUDgnCa8kuP7Ueovp8XKoTqALT/cJRRQeJWOVN+WxdabwgsJs3n3os03SMxMrkni4z/e1nnpvz7HlUINXQrNRrgzslkVY40uYzU44nBlkCvgANZS00WHr7t0plT3ncDNHFMhX9gDkbIf43Bk1Dwfcfvox0VrfXtQjXinWp34xbyZPhIZUDIkiKFYnf6ef0t2zM+yGYb6Y6lpaOOMpUaXbFXp/8bIoRg6SmcGpKjRkOmboYU7GOtOzXW2MVhJjdC0raRfAIX00imsZuKlrK3z7aRcmriTE9pXKF86brHEQ/KavYV169m74oX6YD2h/06H7OZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB5093.namprd11.prod.outlook.com (2603:10b6:510:3e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 26 Sep
 2023 08:25:41 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::ed57:a908:f0ad:13cd%7]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 08:25:41 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 1/1] drm/xe: timeout needs to be a signed value
Thread-Index: AQHZ8C939CGAjrLNI0i4mLyVAbZ0d7AsxS6w
Date: Tue, 26 Sep 2023 08:25:40 +0000
Message-ID: <SJ1PR11MB6204A6B33645E0F5C57AA21481C3A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230926041259.1102823-1-fei.yang@intel.com>
 <20230926041259.1102823-2-fei.yang@intel.com>
In-Reply-To: <20230926041259.1102823-2-fei.yang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB5093:EE_
x-ms-office365-filtering-correlation-id: daa14e50-8aa3-4201-7b98-08dbbe6a2b99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QvyPpX9/YF1obg0MX5jUEORICRcggbyLEzQFL202INvylS9+ikAYSU9BUUjR3N6ZBBZ1W31oY98gNcbF8B6TVU8LAxIoRoArFh31dQpJFTUdkyB2qUyeHnJZup48iXeHsF9E+7IbEoCFboWUSwGoXPtsFVQ6iia5igDrl6jB8vxFQV0FDEqz8n4Xt4W57hSOxArZr88i7dzrjSFowvbL8u6hmayUyoM47jwsvkrlSPoQc+0FanCGRrz5ae/U4zTUN+Dt8GoxWOSMbMIMwHatQxZx7tK0/JzsuLym0F7B/nj6ixdn5ckUbH36rkTBn8jr2A5nQGwd8jKmy859CJUAjar/IIZc70Si5Da2R5cBJNXtHa3Gpf7E8EAhBFYfOe2wvoBUTyragm3S69f5uzfhY7gntYdKSSkhJlMq8Ex4b+9GtFvIz5UtyIREwZ9JU+VZHAvQ3XrdsbvHiaIB9q2CJq952PjnrZogHtqOODWaPHMrp6aOhTiOtSROTqkJhOtJ4LfpkxsiuwjjFAxV7NQvWi6WrUI3EqWY5z4QkhvI+NwjQGz1q9PPWchYO7juuecL3wiw4C9PwDtVfxGChGs4ozlJ5ZEpza1ZONNxA/Ctib8d6m3p0Y1o/1RPolVOYjqT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(451199024)(186009)(1800799009)(478600001)(38070700005)(71200400001)(38100700002)(66574015)(83380400001)(107886003)(26005)(55016003)(122000001)(9686003)(6506007)(7696005)(53546011)(82960400001)(5660300002)(2906002)(8676002)(52536014)(4326008)(33656002)(76116006)(41300700001)(66446008)(86362001)(8936002)(66946007)(66556008)(64756008)(54906003)(110136005)(66476007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlhuU1Y2NGRvY0Q0cjEzbHNDSCtvU0RsWUJwaXlaa0JHRkZuSSsvWU5IZzMr?=
 =?utf-8?B?VW1JZmVmeFM3aUFoVkdxaCtZUk85ZjlBbjFuYU13S1dXY2hhdlJiVDl2S2l5?=
 =?utf-8?B?ZGd6YnQ4dmthcXpadkpQc0p6b3dCTnFUelBWa3FJYjR6VFJibkZNQ0VmWm9m?=
 =?utf-8?B?L2J3T2FkT1BQNk1BeENVdlhncGlNRUh1T2tuUnRGRml4RDJjV1JyUWtib3I2?=
 =?utf-8?B?bFNRVWNGaVdiM2pOUGwxR0JaKzBzNEVpZCtEbUxLUGJiTDZZNTRIaVBmK3Fn?=
 =?utf-8?B?ZnFFL1o0RVIvL1BmRDhna2d5bU9zREdiMWx2UWdjTTk5a2JGR2tNTThJakc2?=
 =?utf-8?B?NkY0UFlKZnc0Z29jL2h2K0ZYbkRBbmlnTWhvbC94VnpGU0g0VENQNXNCWGIx?=
 =?utf-8?B?cEQxTVp0TXNscXRzamZDT0o2N2h4MDVxeVNIeW83Z0grVUk4QUdFbWlVT2VW?=
 =?utf-8?B?bTFOS2pwQ2VpdUlXK0JvTnBGN1NTOGdaNFpyL3M2Q2hjR1R6MjlILzcyV2VK?=
 =?utf-8?B?dzFpZllCOG9VOUp2bGhDSmdOMmNSNnFJMlp4U0EyaFZWaml3dFExV2g5M2tn?=
 =?utf-8?B?alVJTzhoQ2FpcEF6aWd1aXdwcXFJdFlrajMyZmxIV1JmTE9zMHpnOFk2Y0p0?=
 =?utf-8?B?VjlQMWpsKy9MblROTTFXZVVaYjI3amp3clBLZnB5MndocS9XbTB5RUpsaFUv?=
 =?utf-8?B?NjR4TnhiMHZEMzBZVUhKRy83UEhjVlZpOTN6U01Oai9mSUlETy9KVElSNEo3?=
 =?utf-8?B?Wi9CWVRXb0NMaHY4K09NdUVoM2ZLTHNsczlrVWlkOUYyOEFOTDZGN09PdHBC?=
 =?utf-8?B?ZlBEMTkvOFhwM2psdXRTSDB3OWxITDdVYXhNaHRKSXNHZnZFL2RmUmJDTlJi?=
 =?utf-8?B?aU83MUtreEo5YTRtUXhRSmVkaEo5bmNQTE1UaUUvWng1Wk8wVzhiZUhCRzVF?=
 =?utf-8?B?NGx0cnFpTzRKNit2VHZzelh1ZVZoU2dEUTNjTW1SL1Z1K3g0RHltbXZyVHJG?=
 =?utf-8?B?d2RsY1JLdTI0eHF3U2dMWm1mMk0yZmRqUVd6NDQxYmYwLzA0Mno3OVhTeFhv?=
 =?utf-8?B?bkNDQ3NMTFp2UEhJSDBxd3NxajBNT2w2Sm5YL3lUaVBWYkFodmd6blE1OTRP?=
 =?utf-8?B?cmF1L01tb2hlMDdydkhrNFVSN3FLZDlna0pEdlord2N6T1ozcVdEMnNZVjFj?=
 =?utf-8?B?VTRRSmd2azhwcUpvTlRDQzNwZE9JS3NYYkpvcTkxTU52ejRFYjdQaEtSbFlm?=
 =?utf-8?B?MUkrZ2pDNEJZZGVoT2JVSUVyUnBvNFZLeUJhUUMrQnEwRFFDNXlmZHFpT1Q4?=
 =?utf-8?B?U2dxZmpkenN4YnJ4TUowNGhPNklPdmgrM2piaFpsWDkvallyMHZxN2d6VjUw?=
 =?utf-8?B?VVd1dW42NDNSMEdKRXFYMWNlL3l0RUE5b0RTL3NMN0RJQUdqWUdlVUdERElN?=
 =?utf-8?B?aENGTEpvdkt4UVIzTFQzN1ZQaTlGZXZTZzlzNDljcE4rQ0w4YkMvY2JodGJs?=
 =?utf-8?B?ZFhWY094NnU2NmJrRThjZWhpVmxwUmY1citNUC9MaUhWbDlzeURUcXZ1Rlhi?=
 =?utf-8?B?cmhvVnREUkw4Nk9aMktMbzk5eGpuQm1XRUNWQUpuZUg1TVMvS1lGdHJjVEoz?=
 =?utf-8?B?S1R1cWQzbTJzK012SU02dnMwNEtPQWhOYzhzQzFkZFkydGFxek9VQ1p2Z0xl?=
 =?utf-8?B?S1U4TExhT0FOWmt1U2l5UTdUWnBlYnJwSGhycmN1QjJ0VUNrUzdyRDJEd21h?=
 =?utf-8?B?aVpuTjQ5emFPRFlOZVhDV0JoaGhDTTM4dTZjcng2bW1iQk1hL01kVzRsUE5l?=
 =?utf-8?B?QXZwVjk4amNMQ2o1dHlhSUJSV0dDeE9LTTJRaVNSNlFkQXdrN093RXFqVkdD?=
 =?utf-8?B?V3RFMkxHVjFOQytxcUMzUm0veG11YzVQcjJOV3Z3ak8rbDJ0VnZtdVFaUldh?=
 =?utf-8?B?RTFUR0piSG5pSG9xcUlDQnVhTUNUQVdNL0dsK0pPWU4rMTJ6RldNdDg0WmNa?=
 =?utf-8?B?bGk4czhXbXgxdHdvYkh6RjZmUVRUb0NSQW5zUkxIL2h2VU1XUG03a29OLy9P?=
 =?utf-8?B?LzBQd3UzRGxNRDRuK05sQzh5LzBnR21qZzNKc3JPeGlMZno0WnlyU3RabU5a?=
 =?utf-8?Q?1ZgoMKfcVHdc9NTrjxTv3Sqb/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa14e50-8aa3-4201-7b98-08dbbe6a2b99
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 08:25:40.9854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5nksUOeTJSKzCQzc6F7RMaYlFibSkxvNyB+MSJG9/AWzkbVIoXBJehR8MzeCa+WtGmOuW1sbNcmXW0ZNfyI++NEN/ZkNEl4WUXcjglnMgpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5093
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: timeout needs to be a signed
 value
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gZmVpLnlh
bmdAaW50ZWwuY29tDQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyNiwgMjAyMyA5OjQzIEFN
DQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFJvcGVyLCBNYXR0
aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzDQo+IDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtJbnRlbC14ZV0gW1BBVENIIDEv
MV0gZHJtL3hlOiB0aW1lb3V0IG5lZWRzIHRvIGJlIGEgc2lnbmVkIHZhbHVlDQo+IA0KPiBGcm9t
OiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPiANCj4gSW4geGVfd2FpdF91c2VyX2Zl
bmNlX2lvY3RsLCB0aGUgdGltZW91dCBpcyBjdXJyZW50bHkgZGVmaW5lZCBhcyB1bnNpZ25lZA0K
PiBsb25nLiBUaGF0IGNvdWxkIHBvdGVudGlhbGx5IHBhc3MgYSBuZWdhdGl2ZSB2YWx1ZSB0byB0
aGUgc2NoZWR1bGVfdGltZW91dCgpDQo+IGNhbGwgYmVjYXVzZSBuc2Vjc190b19qaWZmaWVzKCkg
cmV0dXJucyBhbiB1bnNpZ25lZCBsb25nIHdoaWNoIGdldHMgdXNlZCBhcw0KPiBzaWduZWQgbG9u
Zy4NCj4gDQo+IFsgMTg3LjczMjIzOF0gc2NoZWR1bGVfdGltZW91dDogd3JvbmcgdGltZW91dCB2
YWx1ZSBmZmZmZmZmZmZmZmZmYzE4IFsNCj4gMTg3LjczMzE4MF0gQ1BVOiAwIFBJRDogNzkyIENv
bW06IHRlc3RfdGhyZWFkX2RpbSBUYWludGVkOiBHIFUgNi40LjAteGUgIzENCj4gWyAxODcuNzM1
MDE5XSBDYWxsIFRyYWNlOg0KPiBbIDE4Ny43MzUzNzNdIDxUQVNLPg0KPiBbIDE4Ny43MzU2ODdd
IGR1bXBfc3RhY2tfbHZsKzB4OTIvMHhiMA0KPiBbIDE4Ny43MzYxOTNdIHNjaGVkdWxlX3RpbWVv
dXQrMHgzNDgvMHg0MzAgWyAxODcuNzM2NzM5XSA/DQo+IF9fbWlnaHRfZmF1bHQrMHg2Ny8weGQw
IFsgMTg3LjczNzI1NV0gPyBjaGVja19jaGFpbl9rZXkrMHgyMjQvMHgyZDAgWw0KPiAxODcuNzM3
ODEyXSA/IF9fcGZ4X3NjaGVkdWxlX3RpbWVvdXQrMHgxMC8weDEwIFsgMTg3LjczODQyOV0gPw0K
PiBfX21pZ2h0X2ZhdWx0KzB4NmIvMHhkMCBbIDE4Ny43Mzg5NDZdID8gX19wZnhfbG9ja19yZWxl
YXNlKzB4MTAvMHgxMCBbDQo+IDE4Ny43Mzk1MTJdID8gX19wZnhfbG9ja19yZWxlYXNlKzB4MTAv
MHgxMCBbIDE4Ny43NDAwODBdDQo+IHdhaXRfd29rZW4rMHg4Ni8weDEwMCBbIDE4Ny43NDA1NTZd
DQo+IHhlX3dhaXRfdXNlcl9mZW5jZV9pb2N0bCsweDM0Yi8weGUwMCBbeGVdIFsgMTg3Ljc0MTI4
MV0gPw0KPiBfX3BmeF94ZV93YWl0X3VzZXJfZmVuY2VfaW9jdGwrMHgxMC8weDEwIFt4ZV0gWyAx
ODcuNzQyMDc1XSA/DQo+IGxvY2tfYWNxdWlyZSsweDE2OS8weDNkMCBbIDE4Ny43NDI2MDFdID8g
Y2hlY2tfY2hhaW5fa2V5KzB4MjI0LzB4MmQwIFsNCj4gMTg3Ljc0MzE1OF0gPyBkcm1fZGV2X2Vu
dGVyKzB4OS8weGUwIFtkcm1dIFsgMTg3Ljc0Mzc0MF0gPw0KPiBfX3BmeF93b2tlbl93YWtlX2Z1
bmN0aW9uKzB4MTAvMHgxMA0KPiBbIDE4Ny43NDQzODhdID8gZHJtX2Rldl9leGl0KzB4MTEvMHg1
MCBbZHJtXSBbIDE4Ny43NDQ5NjldID8NCj4gX19wZnhfbG9ja19yZWxlYXNlKzB4MTAvMHgxMCBb
IDE4Ny43NDU1MzZdID8gX19taWdodF9mYXVsdCsweDY3LzB4ZDAgWw0KPiAxODcuNzQ2MDUyXSA/
IGNoZWNrX2NoYWluX2tleSsweDIyNC8weDJkMCBbIDE4Ny43NDY2MTBdDQo+IGRybV9pb2N0bF9r
ZXJuZWwrMHgxNzIvMHgyNTAgW2RybV0gWyAxODcuNzQ3MjQyXSA/DQo+IF9fcGZ4X3hlX3dhaXRf
dXNlcl9mZW5jZV9pb2N0bCsweDEwLzB4MTAgW3hlXSBbIDE4Ny43NDgwMzddID8NCj4gX19wZnhf
ZHJtX2lvY3RsX2tlcm5lbCsweDEwLzB4MTAgW2RybV0gWyAxODcuNzQ4NzI5XSA/DQo+IF9fcGZ4
X3hlX3dhaXRfdXNlcl9mZW5jZV9pb2N0bCsweDEwLzB4MTAgW3hlXSBbIDE4Ny43NDk1MjRdID8N
Cj4gX19wZnhfeGVfd2FpdF91c2VyX2ZlbmNlX2lvY3RsKzB4MTAvMHgxMCBbeGVdIFsgMTg3Ljc1
MDMxOV0NCj4gZHJtX2lvY3RsKzB4MzVlLzB4NjIwIFtkcm1dIFsgMTg3Ljc1MDg3MV0gPyBfX3Bm
eF9kcm1faW9jdGwrMHgxMC8weDEwDQo+IFtkcm1dIFsgMTg3Ljc1MTQ5NV0gPyByZXN0b3JlX2Zw
cmVnc19mcm9tX2Zwc3RhdGUrMHg5OS8weDE0MA0KPiBbIDE4Ny43NTIxNzJdID8gX19wZnhfcmVz
dG9yZV9mcHJlZ3NfZnJvbV9mcHN0YXRlKzB4MTAvMHgxMA0KPiBbIDE4Ny43NTI5MDFdID8gbWFy
a19oZWxkX2xvY2tzKzB4MjQvMHg5MCBbIDE4Ny43NTM0MzhdDQo+IF9feDY0X3N5c19pb2N0bCsw
eGI0LzB4ZjAgWyAxODcuNzUzOTU0XSBkb19zeXNjYWxsXzY0KzB4M2YvMHg5MCBbDQo+IDE4Ny43
NTQ0NTBdIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDcyLzB4ZGMNCj4gWyAxODcu
NzU1MTI3XSBSSVA6IDAwMzM6MHg3ZjRlNjY1MWFhZmYNCj4gWyAxODcuNzU1NjIzXSBDb2RlOiAw
MCA0OCA4OSA0NCAyNCAxOCAzMSBjMCA0OCA4ZCA0NCAyNCA2MCBjNyAwNCAyNCAxMCAwMCAwMA0K
PiAwMCA0OCA4OSA0NCAyNCAwOCA0OCA4ZCA0NCAyNCAyMCA0OCA4OSA0NCAyNCAxMCBiOCAxMCAw
MCAwMCAwMCAwZiAwNSA8NDE+IDg5DQo+IGMwIDNkIDAwIGYwIGZmIGZmIDc3IDFmIDQ4IDhiIDQ0
IDI0IDE4IDY0IDQ4IDJiIDA0IDI1IDI4IDAwIFsgMTg3Ljc1Nzk5NV0gUlNQOg0KPiAwMDJiOjAw
MDA3ZmZmMDVmMzdhNTAgRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDAx
MCBbDQo+IDE4Ny43NTg5OTVdIFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDA1NWVjYTQ3
YzgxMzAgUkNYOg0KPiAwMDAwN2Y0ZTY2NTFhYWZmIFsgMTg3Ljc1OTkzNV0gUkRYOiAwMDAwN2Zm
ZjA1ZjM3YjYwIFJTSToNCj4gMDAwMDAwMDBjMDUwNjQ0YiBSREk6IDAwMDAwMDAwMDAwMDAwMDQg
WyAxODcuNzYwODc0XSBSQlA6DQo+IDAwMDAwMDAwMDAwMDAwMTcgUjA4OiAwMDAwMDAwMDAwMDAw
MDE3IFIwOTogN2ZmZmZmZmZmZmZmZmZmZiBbIDE4Ny43NjE4MTRdDQo+IFIxMDogMDAwMDAwMDAw
MDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOiAwMDAwMDAwMDAwMDAwMDAwIFsNCj4g
MTg3Ljc2Mjc1M10gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBS
MTU6DQo+IDAwMDA3ZjRlNjVkMTljZTAgWyAxODcuNzYzNjk0XSA8L1RBU0s+DQo+IA0KPiBGaXhl
czogOWY4MDFmMTBjMGQ2ICgiZHJtL3hlOiBVc2UgbmFub3NlY29uZHMgaW5zdGVhZCBvZiBqaWZm
aWVzIGluIHVhcGkgZm9yDQo+IHVzZXIgZmVuY2UiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBGZWkgWWFu
ZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPiBSZXZpZXdlZC1ieTogQW5kaSBTaHl0aSA8YW5kaS5z
aHl0aUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWdu
aWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfd2FpdF91c2VyX2ZlbmNlLmMgfCA1NSArKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNlcl9mZW5jZS5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNlcl9mZW5jZS5jDQo+IGluZGV4IDc2MWVlZDNh
MDIyZi4uM2FjNGNkMjRkNWI0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
d2FpdF91c2VyX2ZlbmNlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNl
cl9mZW5jZS5jDQo+IEBAIC04NSwxNyArODUsNDUgQEAgc3RhdGljIGludCBjaGVja19od19lbmdp
bmVzKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCQkJIERSTV9YRV9VRkVOQ0VfV0FJVF9WTV9F
UlJPUikNCj4gICNkZWZpbmUgTUFYX09QCQlEUk1fWEVfVUZFTkNFX1dBSVRfTFRFDQo+IA0KPiAt
c3RhdGljIHVuc2lnbmVkIGxvbmcgdG9famlmZmllc190aW1lb3V0KHN0cnVjdCBkcm1feGVfd2Fp
dF91c2VyX2ZlbmNlICphcmdzKQ0KPiArc3RhdGljIGxvbmcgdG9famlmZmllc190aW1lb3V0KHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiArCQkJICAgICAgIHN0cnVjdCBkcm1feGVfd2FpdF91c2Vy
X2ZlbmNlICphcmdzKQ0KDQpXaGF0IGlzIHRoZSB1c2Ugb2YgInhlIiBwYXNzZWQgaGVyZSBpbiBw
YXJhbT8NCiANCj4gIHsNCj4gLQl1bnNpZ25lZCBsb25nIHRpbWVvdXQ7DQo+ICsJdW5zaWduZWQg
bG9uZyBsb25nIHQ7DQo+ICsJbG9uZyB0aW1lb3V0Ow0KPiANCj4gLQlpZiAoYXJncy0+ZmxhZ3Mg
JiBEUk1fWEVfVUZFTkNFX1dBSVRfQUJTVElNRSkNCj4gLQkJcmV0dXJuIGRybV90aW1lb3V0X2Fi
c190b19qaWZmaWVzKGFyZ3MtPnRpbWVvdXQpOw0KPiArCS8qDQo+ICsJICogRm9yIG5lZ2F0aXZl
IHRpbWVvdXQgd2Ugd2FudCB0byB3YWl0ICJmb3JldmVyIiBieSBzZXR0aW5nDQo+ICsJICogTUFY
X1NDSEVEVUxFX1RJTUVPVVQuIEJ1dCB3ZSBoYXZlIHRvIGFzc2lnbiB0aGlzIHZhbHVlIGFsc28N
Cj4gKwkgKiB0byBhcmdzLT50aW1lb3V0IHRvIGF2b2lkIGJlaW5nIHplcm9lZCBvbiB0aGUgc2ln
bmFsIGRlbGl2ZXJ5DQo+ICsJICogKHNlZSBhcml0aG1ldGljcyBhZnRlciB3YWl0KS4NCj4gKwkg
Ki8NCj4gKwlpZiAoYXJncy0+dGltZW91dCA8IDApIHsNCj4gKwkJYXJncy0+dGltZW91dCA9IE1B
WF9TQ0hFRFVMRV9USU1FT1VUOw0KPiArCQlyZXR1cm4gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7DQo+
ICsJfQ0KPiANCj4gLQlpZiAoYXJncy0+dGltZW91dCA9PSBNQVhfU0NIRURVTEVfVElNRU9VVCB8
fCBhcmdzLT50aW1lb3V0ID09DQo+IDApDQo+IC0JCXJldHVybiBhcmdzLT50aW1lb3V0Ow0KPiAr
CWlmIChhcmdzLT50aW1lb3V0ID09IDApDQo+ICsJCXJldHVybiAwOw0KPiANCj4gLQl0aW1lb3V0
ID0gbnNlY3NfdG9famlmZmllcyhhcmdzLT50aW1lb3V0KTsNCj4gKwkvKg0KPiArCSAqIFNhdmUg
dGhlIHRpbWVvdXQgdG8gYW4gdTY0IHZhcmlhYmxlIGJlY2F1c2UgbnNlY3NfdG9famlmZmllcw0K
PiArCSAqIG1pZ2h0IHJldHVybiBhIHZhbHVlIHRoYXQgb3ZlcmZsb3dzIHMzMiB2YXJpYWJsZS4N
Cj4gKwkgKi8NCj4gKwlpZiAoYXJncy0+ZmxhZ3MgJiBEUk1fWEVfVUZFTkNFX1dBSVRfQUJTVElN
RSkNCj4gKwkJdCA9IGRybV90aW1lb3V0X2Fic190b19qaWZmaWVzKGFyZ3MtPnRpbWVvdXQpOw0K
PiArCWVsc2UNCj4gKwkJdCA9IG5zZWNzX3RvX2ppZmZpZXMoYXJncy0+dGltZW91dCk7DQo+ICsN
Cj4gKwkvKg0KPiArCSAqIEFueXRoaW5nIGdyZWF0ZXIgdGhlbiBNQVhfU0NIRURVTEVfVElNRU9V
VCBpcyBtZWFuaW5nbGVzcywNCj4gKwkgKiBhbHNvIHdlIGRvbid0IHdhbnQgdG8gY2FwIGl0IGF0
IE1BWF9TQ0hFRFVMRV9USU1FT1VUIGJlY2F1c2UNCj4gKwkgKiBhcHBhcmVudGx5IHVzZXIgZG9l
c24ndCBtZWFuIHRvIHdhaXQgZm9yZXZlciwgb3RoZXJ3aXNlIHRoZQ0KPiArCSAqIGFyZ3MtPnRp
bWVvdXQgc2hvdWxkIGhhdmUgYmVlbiBzZXQgdG8gYSBuZWdhdGl2ZSB2YWx1ZS4NCj4gKwkgKi8N
Cj4gKwlpZiAodCA+IE1BWF9TQ0hFRFVMRV9USU1FT1VUKQ0KPiArCQl0aW1lb3V0ID0gTUFYX1ND
SEVEVUxFX1RJTUVPVVQgLSAxOw0KDQpEb2VzIExPTkdfTUFYIGhpdCBvdmVyZmxvdyBoZXJlPw0K
DQpUaGFua3MsDQpUZWphcw0KDQo+ICsJZWxzZQ0KPiArCQl0aW1lb3V0ID0gdDsNCj4gDQo+ICAJ
cmV0dXJuIHRpbWVvdXQgPzogMTsNCj4gIH0NCj4gQEAgLTExNCw3ICsxNDIsNyBAQCBpbnQgeGVf
d2FpdF91c2VyX2ZlbmNlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IHZvaWQgKmRh
dGEsDQo+ICAJaW50IGVycjsNCj4gIAlib29sIG5vX2VuZ2luZXMgPSBhcmdzLT5mbGFncyAmIERS
TV9YRV9VRkVOQ0VfV0FJVF9TT0ZUX09QDQo+IHx8DQo+ICAJCWFyZ3MtPmZsYWdzICYgRFJNX1hF
X1VGRU5DRV9XQUlUX1ZNX0VSUk9SOw0KPiAtCXVuc2lnbmVkIGxvbmcgdGltZW91dDsNCj4gKwls
b25nIHRpbWVvdXQ7DQo+ICAJa3RpbWVfdCBzdGFydDsNCj4gDQo+ICAJaWYgKFhFX0lPQ1RMX0RC
Ryh4ZSwgYXJncy0+ZXh0ZW5zaW9ucykgfHwgWEVfSU9DVExfREJHKHhlLCBhcmdzLQ0KPiA+cGFk
KSB8fCBAQCAtMTY5LDE2ICsxOTcsNyBAQCBpbnQgeGVfd2FpdF91c2VyX2ZlbmNlX2lvY3RsKHN0
cnVjdA0KPiBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAJCWFkZHIgPSB2bS0+YXN5
bmNfb3BzLmVycm9yX2NhcHR1cmUuYWRkcjsNCj4gIAl9DQo+IA0KPiAtCS8qDQo+IC0JICogRm9y
IG5lZ2F0aXZlIHRpbWVvdXQgd2Ugd2FudCB0byB3YWl0ICJmb3JldmVyIiBieSBzZXR0aW5nDQo+
IC0JICogTUFYX1NDSEVEVUxFX1RJTUVPVVQuIEJ1dCB3ZSBoYXZlIHRvIGFzc2lnbiB0aGlzIHZh
bHVlIGFsc28NCj4gLQkgKiB0byBhcmdzLT50aW1lb3V0IHRvIGF2b2lkIGJlaW5nIHplcm9lZCBv
biB0aGUgc2lnbmFsIGRlbGl2ZXJ5DQo+IC0JICogKHNlZSBhcml0aG1ldGljcyBhZnRlciB3YWl0
KS4NCj4gLQkgKi8NCj4gLQlpZiAoYXJncy0+dGltZW91dCA8IDApDQo+IC0JCWFyZ3MtPnRpbWVv
dXQgPSBNQVhfU0NIRURVTEVfVElNRU9VVDsNCj4gLQ0KPiAtCXRpbWVvdXQgPSB0b19qaWZmaWVz
X3RpbWVvdXQoYXJncyk7DQo+ICsJdGltZW91dCA9IHRvX2ppZmZpZXNfdGltZW91dCh4ZSwgYXJn
cyk7DQo+IA0KPiAgCXN0YXJ0ID0ga3RpbWVfZ2V0KCk7DQo+IA0KPiAtLQ0KPiAyLjI1LjENCg0K
