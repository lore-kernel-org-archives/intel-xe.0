Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA0CEB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 22:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F0010E69A;
	Fri, 16 Jun 2023 22:18:15 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B44E710E69A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 22:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686953893; x=1718489893;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=w+O2XdqrA01OyNEOhPnYAcqdpZ0r5DibJ3XDbRCz+kA=;
 b=Aw2u/PWeHfFK7rY1YI47UtPh3WPgs+6OnEvZa0BH/5ROQc892bjN+T8Z
 b+1YMYFXVb0Ex25QcSm86A6uKhNhWIGJ6T1mNLgYVk+9NxbV8qolzskyJ
 cOy14rdISpLdijVHuF1hUk0RoOYRcEeUf7le9SnZmMwurZqfO2c9sLQ3Q
 /zVq5iiM4yRJPaAG10xUMw6WAEVbyqaTDWvkmyt8LYHSdNUCUEqIvry2P
 pEFURMk3UNMP+ccxqC0lGD4f9KWE9rSwCFx9iyk1DZHwWfnhN+5znse3M
 zbvB3l0AjY8wssh8GjFFW++r6yX8QguAUOqHIt1PoVeLTGq+nELLGLumh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="361859851"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="361859851"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 15:18:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="1043230392"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="1043230392"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2023 15:18:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 15:18:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 15:18:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 15:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2jzSOBXIgMOD6LTASEfj2hW9hVJkunt4xuaoqN+kpnyriR+mSUg3tANEc2AwIkTZqvy9ErtYV4yTKqCUMtj/0vt8SSiBhyQ+mn5I8BmclspcjhiOAdTByeJLn71VnpACN2GotwGn3nqMxbUdoAwaog3nbad6XpSZuYVtLVbmYbZVEJ//lWCwfz68p+Og0PZegst5J+hGeeCa9xj5jRbasEfjsL5Cl+X2U4zzoyHkhraM2HG837gHOLVQyDS0FVttaxohWUq0DlCDT5vckgMEq31HRDtzBxFp66oUqVd+gZyPEGF0x+w4Pp4zKxzPZOxyJu7+3TdrhQrOH6yYlO0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+O2XdqrA01OyNEOhPnYAcqdpZ0r5DibJ3XDbRCz+kA=;
 b=X10ON8lSGFeDqfX0bapOnJreJo6WRn27/9U+gI2KZD9VLsyRB92lM6oquniFzuTXocRVq3Mh0ZwtTZjZmtMUW2KnieoL3loGk0oEjxP0n8qq4cEe3dBcIlpZZ80FRus3IS4GB1cIEWKH6+aICUDECH9Q7dGHtnenQZ2AW2u1rRQR3gCAMDnPfuJOEkqUfNrF2hUyqlxWoIRVCbPHkWffGwI+eg4jyQgQ0x08jAAhEqNVqwRrYDlS/Rr3us0A0BGLmU+UpUtEGvtx4ID+w0a3zsoh8h3u/Z8YXRcY8Hgn/rC+fmdFfTDnp0x+dQTwjoq/5Rfg77mCpRmFx5031mHOVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 22:18:08 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::5cab:9ad8:a5ad:6e0%7]) with mapi id 15.20.6500.025; Fri, 16 Jun 2023
 22:18:09 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/6] drm/xe/bo: Don't limit the TT manager to
 half of system memory
Thread-Index: AQHZoDi/QbJRSYw4SUCIE6wISmVO4K+NiKuAgAB3vgA=
Date: Fri, 16 Jun 2023 22:18:09 +0000
Message-ID: <92736b6c652a83090ee93fff43d744689d47ea29.camel@intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-2-thomas.hellstrom@linux.intel.com>
 <ZIx7LTnLvPm83uR1@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZIx7LTnLvPm83uR1@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5135:EE_
x-ms-office365-filtering-correlation-id: 3839dac8-a492-4435-eb00-08db6eb790da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FiaIqpCawbJMFq6uYfZfTT/w2pTcC/UEivL5S/ojXuWIvQ3vCs2EAJQ8NoU5iRL/YftwOWfL2NqJWk3TxT7FrWF+3GvWCPAzfD/IeErFc7NKRF0Ogmlh6EtckNq8+HpgH5zTQNbWhS66OAJq/WUnJR3libUDtUkXq6ChyfC3DHq4zFFb/xbnHoJd21dIjvPzQ+mPAe9mcbc0BGT5gn5u7W3+RmBg6/niZIksrZIZlrIEY+5029jkeWUzuJX+g7ZC9EqRZ6scrXc5irnjp8+1JbBKbs3vmGxl/X9j1gg6Y9TtD86pnNWK6lY7v2HWRQkusb1JXfs0qVcGUxINng8qe1UF7n2xonwrJYs9bu44ggko1PFeU5hWfIZhBh5iYdvapT2pggCbZtvs2BEUR2aG6syvF70l65/9xrwrwGvmnKvUlRowpCV46PHl2R3rJsdLqo3Fg4M4q+JqpePjgmLB1Puf0m/vYwp1y28nCpIF0v56dV01xYWWs8fkqYg2mXFj0UX0P74rRgFiFhPBVAZCLsybFv1svtGZYjX/f2ud8Ek4C3mMfBKsFCxHDdTj4mmfNcaeqxAxNxmmURcHq6YCNdQ1K8UNc6TyCkbPINFdC6MrhQG+F+I1jyeEZ8002hkh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(376002)(396003)(136003)(451199021)(5660300002)(76116006)(110136005)(41300700001)(6486002)(8676002)(8936002)(316002)(71200400001)(6506007)(6512007)(26005)(186003)(86362001)(4326008)(91956017)(66556008)(66446008)(64756008)(66476007)(66946007)(478600001)(38070700005)(83380400001)(2906002)(2616005)(66574015)(36756003)(82960400001)(122000001)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czBPMDFZTlpjd3JJKythclpVUzFKUG9aVWRtV2lqMjI3dngzSUk2dTNDRERy?=
 =?utf-8?B?aGFZQjJ2cDUzN0FWejZDdGxoQyt4Y0lkN0kwOGFWZVpaNVNnMEtuYWlJZUhL?=
 =?utf-8?B?ZXpOOTl2RWsrRmptOTlZUldFbDBKMVlrdW1IMkEycUhibzAzTGV3K3d4UklK?=
 =?utf-8?B?UTRnNC9QWGVKY2JnTjU5c3VBbHVpbkxicjE0cFZSdHdXOGIzK0UzakJoSUVK?=
 =?utf-8?B?ZE16NU1TZHBiNGhtYnVrSW43SXhlUGxNVVFyL091S3g3QXJwckJuSzdqNE90?=
 =?utf-8?B?bUh3UnYzejZDUzV6T1VmbHIxWWk5MVFZQlhYQ1Foc2xNWlhzYUVQbnZabkRo?=
 =?utf-8?B?N1RBZFMrRjM2UnpyclNvcGM3VFc4ak1ZeVRCaVJieVk0NHZ0WXBlSzZCYytw?=
 =?utf-8?B?R1BDSVloQ2V5bFhuM3RJS0l2VVFNc2ZMMEpSbG9GU2s5RXcxY0lIWGRWeWx2?=
 =?utf-8?B?aWVLSUJYR2dEQmI2dkFwdlJ6OEZDRUFSVk5nY2xpR0FGcE1hdTdLSkNPTnVu?=
 =?utf-8?B?T0dmQjlTUjhhb0xDei9OVW5NQ0hPVGlCRWN3OElxMHFmRXpFelR3UXZySVUz?=
 =?utf-8?B?bGZFTWx1NjFBR3phTFFkY1IzQ0lpZkNMMXMzblJlVEpJV1FWMVBHbEhHVTh6?=
 =?utf-8?B?a0x0dEJ4K25lUlFRT0lwditRR2pPK2MvWnhEN295U0JELzJCSC9KYVVOOENq?=
 =?utf-8?B?eDVGc2hjSTdkY0lSaUVKa3VGTWJ1SGZ4Z013T3k4YTVXbk1IUUtLUTFka0Zw?=
 =?utf-8?B?Qk9CLzllYWVtQWk1d0JSYjRxd3d5d2x5eVlkNWpQTEkxd0RYeVdDQUNiMVNE?=
 =?utf-8?B?ektvUkhpM0R3aGZCRjRTQlhscDFuVVhLUDJKNThrZVZuWUd3RzlEczljdVFJ?=
 =?utf-8?B?UldnaHhMN3p2U1JERnQ5NzUvdllYcXU0OEgzZE53TWdrN1F1QmgxVytiQ2hN?=
 =?utf-8?B?czN5UnE2VmhvanpwaHhMWmYzdEduenJ4cHVKZzFoSmtEU0dkTFAzejlLcHVs?=
 =?utf-8?B?bVFpb2F3RjhZY0VxWmtVdFArV1ZvMzdienh2VHB1VjZtUHlPUHJ3REgwQXJ4?=
 =?utf-8?B?SjdQaDRrWmpHSDdwcWZCVGUxNklvR3NEV3dtVEJmdUszMWczQmRxMjVFL0FR?=
 =?utf-8?B?RXp3MVF5eks3cFJLUGQrcDBjV2t6cHZscVZoYkt6czd2aHdkS042ZjJBbS8x?=
 =?utf-8?B?Q29YU1F4UTdYaEhnUnYyWk1CTU9GWjZYaUIzR0taM3ovUXZBNmVrdlkya3FI?=
 =?utf-8?B?dW5rcWpqOGNITkpnS1IzUEJ0L0lVOEZYV3l3MW1wQ0RLTllyVkphejlUbk9G?=
 =?utf-8?B?YllDTTI3ZnVOV3JXZk15ZWRCT25CaVhkc2Ewc2s2Nkt5WlNoTjNrVVQyZGtr?=
 =?utf-8?B?RGtGeElndHpMbkFMVWZFOEJ2Z2lFZDVpWTd1RHRMcmhSTnZ5alVGbVI5aytP?=
 =?utf-8?B?VkFKUHlwZytyTzhyVisxcTJCRXUxSW8vVS9LUFZ6R3poRnFoUzNPSmdLK0J0?=
 =?utf-8?B?NnNzN1dkUEdRWFR3Z1ltMUI5cXY3cHgrdEt0bHZBaW04KzgzeCtTS0Q4V01i?=
 =?utf-8?B?UkNEZktJMHE3UDN3dUEzWDQ4TkxCNUdLWnp6a2hPWEpZR2FmVEwrdkpZWW1M?=
 =?utf-8?B?MlVzM1d4QzkzV1NqNWlxTmt5ZVFraGhNYUM4eGFzMWpmUkNnMk16QXo1MUtD?=
 =?utf-8?B?a28rK1dZaVFjcFk1U3MvSlk3ZWVSOU9UaDRpZnhSZTZMQ0RmQVgrVFVXMEFs?=
 =?utf-8?B?ZloxcUFrd21YUGppcGlGWCtOWHVvYW5ZWWZyd0dIVy9JQTBWZUp3dG11RUdU?=
 =?utf-8?B?eDhwQXVLQkhWRWJmNlY1b3ZkZ25hWXpIVXphREljaWlSc2dKdnN2NS9KTnpF?=
 =?utf-8?B?eWpYai9IUHhzNzZvMit3VDJEUWFTb2syTFIxRlVYblZoREVPOHhqejVpdDRv?=
 =?utf-8?B?MDBlaitqeFk0TjBpc2tXclAzZlExVHBEQ2plNk5UYjArV1k1eFNqbWZuRWwv?=
 =?utf-8?B?R2RkeVh0VUNKTk5IWkVjVEVlNGFZcXBOdWlycTMyMDRMT3ZGVU9mNyszZzls?=
 =?utf-8?B?Yzd5UFUvVkdBQXVzMDFxN2JnaE51ZlZMZkYwY3FYWXZDQTN1K2prMVI1Wkc5?=
 =?utf-8?B?NkpvVTlQR3RReEZXajM1RjZHZXQzaE9UQWdFeUkyZlJmNDJqVWQ0elFhdjJt?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EFF025B942C434B8AB2978262911C2C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3839dac8-a492-4435-eb00-08db6eb790da
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2023 22:18:09.0903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3BtpE6jMtUxAnEqFTCSmi0UDYXAzgOjSng0YRWrsmmvj2QEYmQ5zZLaLS0YsMwxsfyhe1S/RyWVMbPXLTwtrXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/6] drm/xe/bo: Don't limit the TT manager to
 half of system memory
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

T24gRnJpLCAyMDIzLTA2LTE2IGF0IDE1OjA5ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBGcmksIEp1biAxNiwgMjAyMyBhdCAxMTo1NDo1OUFNICswMjAwLCBUaG9tYXMgSGVsbHN0
csO2bSB3cm90ZToNCj4gPiBUVE0gZW5mb3JjZXMgdGhpcyBsaW1pdCBhIHBhZ2UtYWxsb2NhdGlv
biB0aW1lLCBzd2FwcGluZyBvdXQgVFQgbWVtb3J5DQo+ID4gaWYgbmVlZGVkLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4
LmludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV9zeXNf
bWdyLmMgfCAyIC0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3N5c19tZ3IuYyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fc3lzX21nci5jDQo+ID4gaW5kZXggM2UxZmEwYzgzMmNh
Li45NjFiYmMyOWRjZGYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0
bV9zeXNfbWdyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3N5c19tZ3Iu
Yw0KPiA+IEBAIC0xMDYsOCArMTA2LDYgQEAgaW50IHhlX3R0bV9zeXNfbWdyX2luaXQoc3RydWN0
IHhlX2RldmljZSAqeGUpDQo+ID4gIA0KPiA+ICAJc2lfbWVtaW5mbygmc2kpOw0KPiA+ICAJZ3R0
X3NpemUgPSAodTY0KXNpLnRvdGFscmFtICogc2kubWVtX3VuaXQ7DQo+ID4gLQkvKiBUVE0gbGlt
aXRzIGFsbG9jYXRpb24gb2YgYWxsIFRUTSBkZXZpY2VzIGJ5IDUwJSBvZiBzeXN0ZW0gbWVtb3J5
ICovDQo+ID4gLQlndHRfc2l6ZSAvPSAyOw0KDQpUaGlzIGlzIGdvaW5nIHRvIGNhdXNlIHJlZ3Jl
c3Npb25zIG9uIE1lc2EuDQoNCkkgcmVtZW1iZXIgZ2V0dGluZyBPT00ga2lsbGVyIHdoZW4gdHJ5
aW5nIHRvIGFsbG9jYXRlIG1vcmUgdGhhbiBoYWxmIG9mIGF2YWlsYWJsZSBSQU0uDQpXaXRoIHRo
aXMgbGltaXQgc29tZXRoaW5nIGluIFRUTSB3b3VsZCBqdXN0IHJlamVjdCB0aGUgYWxsb2NhdGlv
biBhbmQgd2UgZG9uJ3QgZ2V0IE9PTSBraWxsZXIuDQoNCg0KPiANCj4gV2hpbGUgd2UgYXJlIGhl
cmUsIHMvZ3R0X3NpemUvc3lzX3NpemU/IENhbiBiZSBkb25lIGluIGZvbGxvdyB1cCAvDQo+IGRp
ZmZlcmVudCBwYXRjaC4NCj4gDQo+IFRoaXMgcGF0Y2ggTEdUTS4gV2l0aCB0aGF0Og0KPiBSZXZp
ZXdlZC1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+IA0KPiA+
ICANCj4gPiAgCW1hbi0+dXNlX3R0ID0gdHJ1ZTsNCj4gPiAgCW1hbi0+ZnVuYyA9ICZ4ZV90dG1f
c3lzX21ncl9mdW5jOw0KPiA+IC0tIA0KPiA+IDIuNDAuMQ0KPiA+IA0KDQo=
