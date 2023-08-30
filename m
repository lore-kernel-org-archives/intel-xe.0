Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284F5C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 23:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E667D10E632;
	Wed, 30 Aug 2023 23:48:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE7210E632
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 23:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693439315; x=1724975315;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SVTBON/TiWVPflygng6Vkqmf4mtgSv+l4f4PgJx7Pgc=;
 b=Xm2fmxwxlhH41Y1objAK2BI+XeTdJsTnpR+ghQx0ujfC2G9FDxAoJQyZ
 uoko8/hHpl9h1rAVTYmPmH7YUrlUzM1olmgP0ShLNm38f+RjnhjSWcq9k
 NTB986NlUwj8DYABsvjQfs39RiPQgoS3QDCU1BDDdixTtXfovzBV1JVtF
 KXeivAkeKyxWlqQPu6Qgd1QSmF9fOVQa0Uzrmd9F4BZnheW4Ah3SBveWG
 AmZ/Xyr4NQCev6gHXMFeUd9ofYOJaub0D1f0pMdbTjuZ3D4eGxdAEFrw1
 oQBz5tpFwa95w9gGBFVH4IrjyaBVMO4tYgwcg5El3cC05aD6UJZHMs0B9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="462153818"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="462153818"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 16:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="809327764"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="809327764"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 30 Aug 2023 16:48:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 16:48:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 16:48:33 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 16:48:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 16:48:33 -0700
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com (2603:10b6:a03:4f4::20)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 23:48:29 +0000
Received: from SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::ec0a:6c6e:1cd3:d622]) by SJ2PR11MB7715.namprd11.prod.outlook.com
 ([fe80::ec0a:6c6e:1cd3:d622%7]) with mapi id 15.20.6699.034; Wed, 30 Aug 2023
 23:48:29 +0000
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Thread-Topic: [igt-dev] [PATCH igt 3/4] lib/intel_device_info: Add blitter cmd
 info for Lunar Lake
Thread-Index: AQHZ2oMA3S8XNekpQkSGbKmL08n/17ADg9Yg
Date: Wed, 30 Aug 2023 23:48:29 +0000
Message-ID: <SJ2PR11MB77158DFD848475DC3051005BF8E6A@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-4-lucas.demarchi@intel.com>
In-Reply-To: <20230829141107.1505705-4-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7715:EE_|CO1PR11MB5090:EE_
x-ms-office365-filtering-correlation-id: cb4a7b23-9111-40cf-d89f-08dba9b39cb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AxYnqXN3+S+BzmSqRi6b14DYiph+O82Ug1zUgXSKZsiK2H6tI0Fcc3evE4Q3jRmWIewOYOIX/rbKX/fC+lJg5kQLedX5gY5tpIIJ7+J+g7Rv2wckapQnEpZ4lEhWAR/GfEjoh2L1scxamv08PGrlZVJvnChA9LM+XVxfIad0Q+ABVeVCTG2wxLyraqe0p7CPRoy5T9srkCBOfbbZiSDg8YWlTHoG2H9Je3mWbU4KY78Rc75PmnZl/Uh5ePvyDsj96xG+0mV/XcfP6mwrB8S8+3S/Zg4DIesNVuuwFOI8eC6q/ri4+F7ZuqhLEtI+Veq8VammWUhJuo3U3p1zHgFf3hOYKdLUyxXV7ceeaIq1iraVi4r2bC/SAhPqdtV3UpkCWE3o61eDSH4MbDusnyGMRLA2ILaUGi70kkEeLmDgvOPQvDbq99n/c1CNC/N+9fKkZyvNTfVIVyKW2tIFlfgr5WlRv7Ey8TsJwkyjhdaEGl3eHdC7RQGWhFXHr6OUnYSpbQPNURuATcel2LsvPmaM4STj0Takh8iP5kpDH+ouRycx4wgCFX0WXH33WLmViIALLPNq+9Ae8j3883pk+azIImyL+ysqWq08SiBG8mLd5XvxqzzVk+daRw6C7Dg10dkd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7715.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199024)(1800799009)(186009)(38070700005)(122000001)(71200400001)(6506007)(9686003)(7696005)(33656002)(82960400001)(86362001)(55016003)(38100700002)(2906002)(478600001)(26005)(110136005)(83380400001)(53546011)(66574015)(64756008)(8676002)(66556008)(52536014)(5660300002)(4326008)(66946007)(450100002)(76116006)(66476007)(41300700001)(54906003)(66446008)(316002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHFMbStUTC9qQTdiSHE3cFJMMkhNcmdFdVNycVZaeDlaYkQ4L3ozcDF6L3V0?=
 =?utf-8?B?c1VpeDhEU2g1U0xmRWxMYnlGVWVvMkdncVd2RTJOTm5mTksxVTN5ejljdWtE?=
 =?utf-8?B?YkNCSHpiZzd1MURGZWdRMXo1cmZqVko5bC9CRmxTLzVIM2tmYTZuM3NLbXNi?=
 =?utf-8?B?RnY3OG1CcDhEdjNKdzgrV1pIR0Y3TzhzSEJFenVkMFEwT09pTktOWjVGMWNR?=
 =?utf-8?B?dGJLMC81VGZlNk1JWGJQYWJRV0lCMEhwVUpEclNDa3Y1WU1MeDkzOE9CWnpZ?=
 =?utf-8?B?aWZkMmJkNzRacTRpUWZGTXhTMUpOQXRaY0ZhM3BzeXVsVXdkVVNyMDN6UHZB?=
 =?utf-8?B?cC9XSFEyb2JGSG51eGs0SzA0aVVXQlNGZExPVTEzS3Uya2QwaFJYcW54TENF?=
 =?utf-8?B?RnRzQ3hXTzBzQmowY05mRldsWkJ5SkpvU3Z4Znh3ZXFRSDZBV1FhajdqUGZD?=
 =?utf-8?B?RDFxNU5ha1pRZTV2Q3ZycVlnN3R2VlRBL0tiS29qY0J1RVNxY1VvUzN0MUFs?=
 =?utf-8?B?cWVpWGl0NUV2YUtwUFJnNmc0VW1jbWd0aWM1MHlwcklUc2JBWVd2M2hCWURU?=
 =?utf-8?B?dVdWdWwwVHlJR243M3h1YTM5UGEwcmgvWkhLc2dPbm9PY0t2ZW5VWUhlMGt3?=
 =?utf-8?B?ZDdzeUdUejhKZjVPRy9YanZXQ0l2MFNEbURpckhSUmswR0FKeThFeWxxbExm?=
 =?utf-8?B?TmlOQnlHN2VQY1VFWmpyZGVUU0x5S3Z1RHZMejBpbkl5UTBRZHJWSEJndnVm?=
 =?utf-8?B?c3pudUs3cFVscFRnbk51VjVBZXVwM0ovUTR3bTdJNS9EYWgyczhtazk4dXll?=
 =?utf-8?B?dk55WHhYL2ZnczBOSDdmRm9aS284d05qZWZJSWI1QlU1enM2NVFhTjRjMkdT?=
 =?utf-8?B?M1JRNHFlOUhxcWNhZjVNZ1QydUxQd1RwSTJMQkg1Ui82S1lLS2tHYjk3YXgv?=
 =?utf-8?B?UHRVVkFKak12TkVaNlVaOXF4aGJnV0FEUmZGcjFqVCsvS3UremlIb1hHVTZ4?=
 =?utf-8?B?VXRnWjBuUlFtK0NjZ3ltWGFxenA5eG43L2pxWERRQmtJYWxIcmZ4MER3dnNq?=
 =?utf-8?B?YURlZTVTYk5KZ2h3L1I5aGpwTWF2NjJ0bkdrWkVEN1dXYTZHb2drU3Y3UVhN?=
 =?utf-8?B?OURlUXJia2lOVlNLSHpGL1l4RVdaRnNNbDFFVVVUcHNDNXZqWHNaTFAyM1kr?=
 =?utf-8?B?SVFoWFIrVGtMUXFzOWM5MXFWaStER2ZmS1N0RTI0a2F4TklZUzV1Rk1iTzBW?=
 =?utf-8?B?Y0tZcWxLVjZ4aFNvelJ4aXp6WW1tQUp6RE9oMnlBNWpibUtxL3BIQm9OaGcr?=
 =?utf-8?B?YWVNdHJIeCtVNlVKN0ZkTzVaald2MW10dmhBRE5wT1BhVzBmYy8xQXhnLzNa?=
 =?utf-8?B?TmxlVHd4b1Z1dHZiWEQ1dW03bXFrSmo3bERNZ01LZkFISERGeCswNXYvZjRr?=
 =?utf-8?B?M1BZbWN3QzVWL2Z4RVdyMGlCK1k2ZVBLWkhFek1LUkZWWjZQbmJvN0MwczJq?=
 =?utf-8?B?eG4vdXFFTG9pYnBqVzRwTnh1UEk1a1JrVE84dzROOHFmTkhHZ21HZUd1RTI1?=
 =?utf-8?B?Z2wwTStOY2hyS0hXMHZlZzY2VzdnOEVNU2pPeTFtRXRiWk1DODFyRVc0WmRR?=
 =?utf-8?B?N3FnNlZGNVFOQjNoVEZtOFZkNUFpM1YrMVNlQ1ZRazdWbkpZWVRQUHErUnQ1?=
 =?utf-8?B?OVFIVlNJem9lZnRjMGlRbzhNaXFZcEQ5Yk9Wei91d0ZJYTRFVE9jaHdpdjJN?=
 =?utf-8?B?ZkN5cC9RdG9hNmVOa0laYUU2dzBIZ0QxeSsraW9qUTR1cy9SOEluTWcwSGE2?=
 =?utf-8?B?cTYwVnY5anNUNVJBd0FVcW9OOVVTWHd4WEp0WW9QbUJld1ZrMFE0QXBqZGJa?=
 =?utf-8?B?eGNvZHpFSDZwKzVCWlVDbmFDSWlCd3o1MWphSnIzcW9NWmh1T0YvaFBpSUpQ?=
 =?utf-8?B?T0pDN1lLT3lJZFZwVFJkZ25laGx5VVpUZ2VOaFJqUkVNcTJzK0ZvdXB2RzhS?=
 =?utf-8?B?RCtONlZpclE4YWlhSG5UWURhQ1hFbEVaSTdlbFpLeWw3MUlRSHY4eFo5K1V2?=
 =?utf-8?B?WnUxeWZSZ0hyeXkrM0R4Ukc4T1crMnlhMUNjOFVCRGdKZkdabGRtMEpLM1ND?=
 =?utf-8?Q?bzchFgzaxlhz0fdlArKZag4qM?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N85+vL8nP/gfYoc7c2cQD3H1NFQU3Lj9YNulRGOB7hURgFuUBu/lhe32jz3mY4v9vu6sCM41valtW1pmes2/YpQmToPDL+07bDiVpub+xZ7bxk5WqP9O1Ey3lXAHqxAJ85nWqEMTH50cFoTkhV3U6mbX0ApY0MfgAax3z7FFPFw0JHG1gz7V/dbgugMKylPI2bAJ2WwjXrK3K8vttk28gaKXARG+u6SI79WxHlHspXjc9nYFsAYfxBzd4MpMC1Kvwg7KPrJyw1guUsPWKO29wNYFSjFnhSWwBZq4XA5bROElq+Zcgi0VpCq+tdothGfsezqkPoVUYHwcv7mZV7T4Ow==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvpfDLIpUXtSttnrFZP7uJXxK2btmRaDVVmxWe1tIWU=;
 b=ZBcHYoGWMgw3PbflIpgitLhOfCTWbHIX+7cvEjrtB2tAL1Y4hmdTbDRKIOuEOujSI1xN0guG1jY6hntwjjGK2+U4dlpPwvU1UHuY5mwrJRERATd8Q6XMhdxXYQA9Jc+EujSePQ6ePUfu4t5ev3LM+50OZfiSGNBrgZabTYGoRwuJLxaLnb5rBi0OI2esrfX3LgBvVA56BegrDvvElG1Xv7gmXM8x2qI8NRedUGN6shtmBU3ubW1SgYV72qX1aXnPtPZTmwltbyP3S8RF/tn74oDRpR34khhFRh/4Et2ChfDLILDLZgnvljlOc/5qu1kX/GUt4DcbquAGS6ODFBuyZA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SJ2PR11MB7715.namprd11.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: cb4a7b23-9111-40cf-d89f-08dba9b39cb2
x-ms-exchange-crosstenant-originalarrivaltime: 30 Aug 2023 23:48:29.6015 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: p5K/PjO8O7+g7S4CLegnaoLCsaV2MSboeNdIQ3BdzYCyVefroBj0gDHIrbI0mmrxiQa0lRPctaS6S/AvCLkeqZy+2cboR9tNkFJDyC2z9GY=
x-ms-exchange-transport-crosstenantheadersstamped: CO1PR11MB5090
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [igt-dev] [PATCH igt 3/4] lib/intel_device_info: Add
 blitter cmd info for Lunar Lake
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFudXNoYSBTcml2YXRzYSA8YW51c2hhLnNyaXZhdHNhQGludGVsLmNvbT4N
Cg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1kZXYgPGlndC1k
ZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBMdWNhcyBEZQ0K
PiBNYXJjaGkNCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDI5LCAyMDIzIDc6MTEgQU0NCj4gVG86
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBEZSBNYXJjaGksIEx1Y2FzIDxs
dWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IFN1YmplY3Q6IFtpZ3QtZGV2XSBbUEFUQ0ggaWd0IDMvNF0gbGliL2ludGVsX2Rldmlj
ZV9pbmZvOiBBZGQgYmxpdHRlciBjbWQgaW5mbyBmb3INCj4gTHVuYXIgTGFrZQ0KPg0KPiBGcm9t
OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4N
Cj4NCj4gQWRkIHNlcGFyYXRlIGNtZCBpbmZvIGZvciBMdW5hckxha2UuIFRoaXMgcmUtdXNlcyB0
aGUgY29tbWFuZHMgZm9yIFBWQyBzaW5jZSBhbGwNCj4gdGhlIGNvbW1hbmRzIGJlaW5nIHVzZWQg
aW4gSUdUIG1hdGNoIHRoZSBvbmVzIGZvciBQVkMuDQo+DQo+IENjOiBTd2F0aSBTaGFybWEgPHN3
YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5
xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgbGli
L2ludGVsX2RldmljZV9pbmZvLmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2Rldmlj
ZV9pbmZvLmMgYi9saWIvaW50ZWxfZGV2aWNlX2luZm8uYyBpbmRleA0KPiA4NmE4YjM2NTAuLmQx
YzI2ODQ4MiAxMDA2NDQNCj4gLS0tIGEvbGliL2ludGVsX2RldmljZV9pbmZvLmMNCj4gKysrIGIv
bGliL2ludGVsX2RldmljZV9pbmZvLmMNCj4gQEAgLTUxMSw3ICs1MTEsOCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGludGVsX2RldmljZV9pbmZvIGludGVsX2x1bmFybGFrZV9pbmZvDQo+ID0gew0K
PiAgICAgICAuaGFzXzR0aWxlID0gdHJ1ZSwNCj4gICAgICAgLmhhc19nbWRpZCA9IHRydWUsDQo+
ICAgICAgIC5pc19sdW5hcmxha2UgPSB0cnVlLA0KPiAtICAgICAuY29kZW5hbWUgPSAibHVuYXJs
YWtlIg0KPiArICAgICAuY29kZW5hbWUgPSAibHVuYXJsYWtlIiwNCj4gKyAgICAgLmNtZHNfaW5m
byA9ICZnZW4xMl9wdmNfY21kc19pbmZvLA0KPiAgfTsNCj4NCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcGNpX2lkX21hdGNoIGludGVsX2RldmljZV9tYXRjaFtdID0gew0KPiAtLQ0KPiAyLjQwLjEN
Cg0K
