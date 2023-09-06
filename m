Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7EBEE14B1
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 16:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2097B10E1B7;
	Wed,  6 Sep 2023 16:46:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B360410E1B7
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694018770; x=1725554770;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6whiUinB294TJasnyviIBOY0ZdaIZpW8c/LLTQmWoTs=;
 b=cqdgsdKFG4+zTT87EivFe3P0LHvhpmLKslqoljZkOWt0rzQeKAPUYJ4g
 ZOBxfZQ0TQ2IyB+IdGsjT53xMd4jrhWCinHxEcUxEynyrQylubuNe3a4l
 TLmORxc1In0GNhiv9Dd6U/872Y58bMoOK4K+sKJD/a3AwBdOgt+M/W21V
 h8tKwzazbgy9k0X6yeO7yrCNA5pqMWVih+HSeHUbiDD/teAJrSPFU+UPw
 KpD2yXXH0mfCzTzWyGQWUJ8xbc2ate1fw1DxwPKJePJMtk88mU0an3EFv
 6WC4uxQaZy82Qx5QbRwpTgmq7r94GXyspCtM8qNcJ6/UZPQtc/hHQloQ6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="376020576"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="376020576"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 09:46:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="1072450742"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="1072450742"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 09:46:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 09:46:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 09:46:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 09:46:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 09:46:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFfdhMpl7D4hyM1RtCc4mtbBGJMGqEv0ECsctMYKNcE2OCkc3ABZ2k4sXpKQ+nWOFmk1Tk3c5NXOA9qnVDKEVY4oFsLZZKpEXfud+L9Zo91hTz67fzefo0qV+1loYLrqvHf1H/1yENO44v6dKPyLRaC7/vuPrMRDcLaSBpq34lg9RYfd77RN0A2Ib7/XpAVZ9CtWtnGLMh/wdjI25vwWeN9osH3nAM1zVNJuYzF6ZyBLkzg0QRUpZcHe7Yidu7w407I6DQVvLKLnj/CE98gC3o/dAhrgOqxQmNehRzOsH3qeLIlwdC1kbXXg8EBANi91rnl3wnc3EbyLTkAOfMJVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6whiUinB294TJasnyviIBOY0ZdaIZpW8c/LLTQmWoTs=;
 b=FDSL/nKk1bpYgZ9dOV5fn1LT3HxclPI5eSpNA8jOnOSRzOPrbWTzka00ioucG7ghiIbh//OfNgs6DXPg7LTY4aBYjG0Rgx0uQ9RQRKcb8n8Mxx5DOAKrQpXJ3Y8WeveOZMztgbfPt7If7WJiPQix6cnlMu+5XM+8ZoVJPzgMA3QSjoq0UPCDXVtXlsYnhf6mDmABnCCFzApGBcAr6w6UaBqUQEv1mox15DSzZ8f3+UaEhfcjV0HE7NFBlCApTSd7CWSBwGVqNOvW8rqxYm5VeRIKcCTjn4WOQuFib7cKA/eFowY4OLXB4zhMAh1oO8oqHLOHZc7Ux/nBWNXESfNEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 16:46:03 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 16:46:02 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 4/4] drm/xe: Fix LRC workarounds
Thread-Index: AQHZ4GBvI72HGv1ZdUe1kLe0Tly+xbAOAnoA
Date: Wed, 6 Sep 2023 16:46:02 +0000
Message-ID: <52792f8588ccb9e6dd05e79174c74ca1cb88e91f.camel@intel.com>
References: <20230906012053.1733755-1-lucas.demarchi@intel.com>
 <20230906012053.1733755-5-lucas.demarchi@intel.com>
In-Reply-To: <20230906012053.1733755-5-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SA2PR11MB4954:EE_
x-ms-office365-filtering-correlation-id: f736c826-ae52-4793-42bf-08dbaef8c1c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: icBDaB43xLoEiERzm1GME9uuQwyRMnlXHs1kq5OEM6BRPj5g2/2rnNfyGWjt7ghlRqKjp1dUhXHbFgPZ1CH5gqcgnQ+EIlR57/y3DA0xz28l+7y6tIM0EMEdxOX9qVuKpok3kn7q0iTC1ZpHEJmYAv7zXOkBoJ1aFG49kOm14jKICHxKLrj67dWtracMH/xu4WrxETSmUs5g/fNK9bvgEnfzkAmZaH0ksZ/7skCY5Bfyqj8l/NEUnoPBl4Rqn/yC5SZWXGvTfbxbw6MFZ8uyAqkMVBXYP+hbQbpbq03jeuyHLwUzHNWLuWu4BliPG2KM04qIfbaz/jdWhp4enIsKP3mt1e9D/lz14n9nn9get2QY23zx64uV7XCJ8GmueFNrgNEhJp14ZuF1SBuZP7h74wkQxvdFnqEslCQF2xdddFByXGr4wMZqHijnojSEVycNFECo4Fwx6lPFiHwRlpi9JWoR3kHzQKEv0BujAu7stbuksLk1hDTew/DfhxtxSbzfJ8t5t9d+y02/hqFLE4WslGKgPMWXzJS6pjBr8aEkEyLCiHTdvLpMPY486DM76pdbLjrAYJLLb27mFqPYvbR94+Y1tWuFTQSp/p8bqR+g8g3O+603Y7uOyN05zazZcBZU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(186009)(1800799009)(451199024)(6512007)(2616005)(83380400001)(26005)(6486002)(4326008)(6506007)(5660300002)(8936002)(8676002)(38100700002)(38070700005)(122000001)(107886003)(71200400001)(82960400001)(478600001)(86362001)(41300700001)(36756003)(91956017)(2906002)(76116006)(110136005)(66446008)(66946007)(64756008)(66476007)(316002)(66556008)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXZIZk9ZOFVIR043bEZCcHhTY2FVSHkrUUZtUmIzSGl0SFFBZ1gxUnIzZXRm?=
 =?utf-8?B?VlUzZ3E4ZGVqZGRGKzJDdnYxU0Mzb0R1cTU4TjIzQjVZdXZJd2JqSnVRS2Yv?=
 =?utf-8?B?K210T3pJMmhuUXlONkVsTHJwaTdnbFQxcFZCRUE1Q3pxYzViVm1BMTVseUNZ?=
 =?utf-8?B?cVppNTl4MlUrTVp2cTV0V25PVCt4TnV6eTh0N1VkMDdLSlUwdUVNL20rd3hJ?=
 =?utf-8?B?L3RkRlJrbkNsV2JJOEtyaWEyaDNBWmM0MWlzVE5DVkJBQmM1YmNVbCtBZnV3?=
 =?utf-8?B?Ym1xSUJLY0o2akR4cXRoSFZtR2Jnd1N6b3ZwdS9PcXAvZ0s0SS9CeUNtc2ov?=
 =?utf-8?B?aFB1V05RemlMU250eGh4dm42OVFCRVlHNTFlek05SHNGTUc2d2hIRTRTbURz?=
 =?utf-8?B?djdHNU1BVW1GVkZNZU5tS2I2RFF2TGljN3UveFBKTVJYUkx1NWlsVGJDWGxp?=
 =?utf-8?B?VWR6MDFOKzBRWmhPOERyd2MzRXN3RXZSWlE4dHFoSDRxeTZQRXNlTVg5RWhT?=
 =?utf-8?B?T0tNOXAzSzhmalA0bFR4TjdmZ1VZWENENUo4Yi9QSHU4RDFueXpPZmdTREdq?=
 =?utf-8?B?NlZ1MkVlbDZHMVVJMjRrM2NtQlJIdGpKUFBSanhNNzJLanBySlNGQ2ZpTGhQ?=
 =?utf-8?B?ZzRlN1RXUTdlYXkzQjVMM1N1dzRvYnhNbnVSb1o0TGVESHZsdWJLRFVnQnA2?=
 =?utf-8?B?M1Y0TWs4WjVOL0lGU1RTTC9NS3RUSFNXYllVU3g4VXVuU3doQ2hpRWo3MmVp?=
 =?utf-8?B?TjNxdk5zK2h3SUs5L2JPeFUwdzE2QTRzZjdaZ2xkYW5HeStXNUs0akFVZ05V?=
 =?utf-8?B?elNhZU5jV3VKc1lkSW9weHBFdi9hU3pxVGZDVXFDY0xleE9udU54SE5DMkor?=
 =?utf-8?B?V21ER09MdW4yTGl2Tlg4Q0VTK2F4aDdPNUV4ZzNZQnA1ZHJRY2gxSFk0TlpE?=
 =?utf-8?B?SFArT0xpWENScG5ZVG9BQkhxbFNlVmlLa2RVQ3JORlNablcxcWFSYmFuN2lG?=
 =?utf-8?B?c2VGMUc2UUJHNzlhSGIrYzFUSXVoMTBpcUxBbGZnMTBIc2FJeW1HeHRSZS9n?=
 =?utf-8?B?Z1lWZytRcmxnLy9MRkZhU2I0akJYenR4SlRFc2tWMW9sZ0RxQjJacFZOd3Ft?=
 =?utf-8?B?c2VvVjBlSE9jWEJHcFJmdHhxeEFtUHlRbjB3aFRCUlRKN0VzYVM2eVJhTTRE?=
 =?utf-8?B?V2hSR05uc0lwdlYwRlJna1Y5YWgzQk54NzUwaUxvV3NKdXFTa3JqYks1cS9M?=
 =?utf-8?B?QW14Qm9BU3RHSlVjSUIvMW9OQW53dzIzL3M4NFd0dkJRRDl1T052YVFzeVZt?=
 =?utf-8?B?aGkybWoxTUFoUU45a3Z2VnBnb3JMOTMwRnNxalE5TGQ3RGJxL0xTL1BkN1JD?=
 =?utf-8?B?TUtaeHU5cWlPZ2RxUWU3YlR2dXFQSXMzeFplWlg1SzhwcGo2QzRlTUNOQWc2?=
 =?utf-8?B?dUVlNTRpQmZLNERiRW9hdXNsQjc1WTFGak5oOGgrM0FYVmNxZWsrd3RDTjlR?=
 =?utf-8?B?cjFyZlozbkN1VUJ5ZS96eWYrb3A4QjRkMHE4SjZBZUIwZG5DWWNFNVNvZWVp?=
 =?utf-8?B?SExVOVViTDByMTNld0xIY0hWQWlFa1JsWENaU01RTGdhWXVtdWZRY05wVW0z?=
 =?utf-8?B?WnhVNEtSS2pTZkRIUGk5bS9TbzM1b0tZejMwSVNpakZPelc3NFVNS2hremUz?=
 =?utf-8?B?cDl4ZUhqcTRsRENiZFVSTlVpbWlNS0g0T2h5b2tOdTdLb0xlK0F4YTF2WHF3?=
 =?utf-8?B?dUFVWWtzUW5LYWxNRU1pb0pxb3hpYUVGNUtFTEJIRXRybzZJcG85bFJUU0Vm?=
 =?utf-8?B?eDNzM0ZkZFJ2OVQwVkIyYTJreGszUDdlTnpXYlhNblRlK09JVEVqN1A2VkJC?=
 =?utf-8?B?SUNHQXV0Wkx1c2ZobW1jZllKVmpKYWpTbnJjZXpmTStjNHQ1VmVWZ3lrNzgr?=
 =?utf-8?B?SVIyd3BxUXRRRkU2anYwS1grdjFHR055QytVQlAvRTZrWmNlcWhESE11MVNi?=
 =?utf-8?B?VTNvYkJVbWp0WnJuS1NjU0R3TlF1OVQ3dTU4c2FCVWRQYkFWa3F6NzVvcERr?=
 =?utf-8?B?cmtONVVqL1hXNVZIWElySGtYT2taemdMTEl6WC9FTzVYTkZiNU9tSFRWMURz?=
 =?utf-8?B?ZEdDdFBrVzc4Wm1tSXhuRHF1UW1KOU5XZFdRZEpUdVVuQkZIYWZBR0pQV2w4?=
 =?utf-8?B?dkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B060F8C760A3F418EAB66036C1D4FE9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f736c826-ae52-4793-42bf-08dbaef8c1c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 16:46:02.8965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Vgkx1Tw+RMo0Xdb6I6ZniAmnJvrtSJz9ZEqg6oe7iXWNHY5cwXgtZhlzSwspmQwdNaI9ikT66oGaWh0F1ms1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/4] drm/xe: Fix LRC workarounds
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTA1IGF0IDE4OjIwIC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IEZpeCAyIGlzc3VlcyB3aGVuIHdyaXRpbmcgTFJDIHdvcmthcm91bmRzIGJ5IGNvcHlpbmcg
dGhlIHNhbWUgaGFuZGxpbmcNCj4gZG9uZSB3aGVuIHByb2Nlc3Npbmcgb3RoZXIgUlRQIGVudHJp
ZXM6DQo+IA0KPiBGb3IgbWFza2VkIHJlZ2lzdGVycywgaXQgd2FzIG5vdCBjb3JyZWN0bHkgc2V0
dGluZyB0aGUgdXBwZXIgMTZiaXRzLg0KPiBEaWZmZXJlbnRseSB0aGFuIGk5MTUsIHRoZSBlbnRy
eSBpdHNlbGYgZG9lc24ndCBzZXQgdGhlIHVwcGVyIGJpdHMNCj4gZm9yIG1hc2tlZCByZWdpc3Rl
cnM6IHRoaXMgaXMgZG9uZSB3aGVuIGFwcGx5aW5nIHRoZW0uIFRlc3Rpbmcgb24gQURMLVA6DQo+
IA0KPiBCZWZvcmU6DQo+IAlbZHJtOnhlX2d0X3JlY29yZF9kZWZhdWx0X2xyY3MgW3hlXV0gTFJD
IFdBIHJjczAgc2F2ZS1yZXN0b3JlIE1NSU9zDQo+IAlbZHJtOnhlX2d0X3JlY29yZF9kZWZhdWx0
X2xyY3MgW3hlXV0gUkVHWzB4MjU4MF0gPSAweDAwMDAwMDAyDQo+IAkuLi4NCj4gCVtkcm06eGVf
Z3RfcmVjb3JkX2RlZmF1bHRfbHJjcyBbeGVdXSBSRUdbMHg3MDE4XSA9IDB4MDAwMDIwMDANCj4g
CVtkcm06eGVfZ3RfcmVjb3JkX2RlZmF1bHRfbHJjcyBbeGVdXSBSRUdbMHg3MzAwXSA9IDB4MDAw
MDAwNDANCj4gCVtkcm06eGVfZ3RfcmVjb3JkX2RlZmF1bHRfbHJjcyBbeGVdXSBSRUdbMHg3MzA0
XSA9IDB4MDAwMDAyMDANCj4gDQo+IEFmdGVyOg0KPiAJW2RybTp4ZV9ndF9yZWNvcmRfZGVmYXVs
dF9scmNzIFt4ZV1dIExSQyBXQSByY3MwIHNhdmUtcmVzdG9yZSBNTUlPcw0KPiAJW2RybTp4ZV9n
dF9yZWNvcmRfZGVmYXVsdF9scmNzIFt4ZV1dIFJFR1sweDI1ODBdID0gMHgwMDA2MDAwMg0KPiAJ
Li4uDQo+IAlbZHJtOnhlX2d0X3JlY29yZF9kZWZhdWx0X2xyY3MgW3hlXV0gUkVHWzB4NzAxOF0g
PSAweDIwMDAyMDAwDQo+IAlbZHJtOnhlX2d0X3JlY29yZF9kZWZhdWx0X2xyY3MgW3hlXV0gUkVH
WzB4NzMwMF0gPSAweDAwNDAwMDQwDQo+IAlbZHJtOnhlX2d0X3JlY29yZF9kZWZhdWx0X2xyY3Mg
W3hlXV0gUkVHWzB4NzMwNF0gPSAweDAyMDAwMjAwDQoNCldvdWxkIGl0IGJlIHRvbyBoYXJkIHRv
IHRlc3QgaWYgTFJDIHdvcmthcm91bmRzIHdlcmUgYXBwbGllZCBjb3JyZWN0bHk/DQoNCj4gDQo+
IEFsbCBvZiB0aGVzZSByZWdpc3RlcnMgYXJlIG1hc2tlZCByZWdpc3RlcnMsIHNvIHdyaXRpbmcg
dG8gdGhlbSB3aXRob3V0DQo+IHRoZSByZWxldmFudCBiaXRzIGluIHRoZSB1cHBlciAxNmIgZG9l
c24ndCBoYXZlIGFueSBlZmZlY3QuDQo+IA0KPiBBbHNvLCB0aGlzIGFkZHMgc3VwcG9ydCB0byBy
ZWd1bGFyIHJlZ2lzdGVyczsgcHJldmlvdXNseSBpdCB3YXMgYXNzdW1lZA0KPiB0aGF0IExSQyBl
bnRyaWVzIHdvdWxkIG9ubHkgY29udGFpbiBtYXNrZWQgcmVnaXN0ZXJzLiBIb3dldmVyIHRoaXMg
aXMNCj4gbm90IHRydWUuIDB4NjYwNCBpcyBub3QgYSBtYXNrZWQgcmVnaXN0ZXIsIGJ1dCB1c2Vk
IGluIHdvcmthcm91bmRzIGZvcg0KPiBlLmcuICBBREwtUC4gU2VlIGNvbW1pdCAyOGNmMjQzYTM0
MWEgKCJkcm0vaTkxNS9ndDogRml4IGNvbnRleHQNCj4gd29ya2Fyb3VuZHMgd2l0aCBub24tbWFz
a2VkIHJlZ3MiKS4gSW4gdGhlIHNhbWUgdGVzdCB3aXRoIEFETC1QIGFzDQo+IGFib3ZlOg0KPiAN
Cj4gQmVmb3JlOg0KPiAJW2RybTp4ZV9ndF9yZWNvcmRfZGVmYXVsdF9scmNzIFt4ZV1dIFJFR1sw
eDY2MDRdID0gMHhlMDAwMDAwMA0KPiBBZnRlcjoNCj4gCVtkcm06eGVfZ3RfcmVjb3JkX2RlZmF1
bHRfbHJjcyBbeGVdXSBSRUdbMHg2NjA0XSA9IDB4ZTBlZmVmNmYNCj4gDQo+IEFzIGNhbiBiZSBz
ZWVuLCBub3cgaXQgd2lsbCByZWFkIHdoYXQgd2FzIGluIHRoZSByZWdpc3RlciByYXRoZXIgdGhh
bg0KPiBjb21wbGV0ZWx5IG92ZXJ3cml0ZSB0aGUgb3RoZXIgYml0cy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBSZXZp
ZXdlZC1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Qu
YyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndC5jDQo+IGluZGV4IDllMjI2YjhhMDA1YS4uNjc4
YTI3NmEyNWRjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYw0KPiBAQCAtMTE0LDExICsxMTQsMjAgQEAg
c3RhdGljIGludCBlbWl0X25vcF9qb2Ioc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHhlX2V4ZWNf
cXVldWUgKnEpDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gKy8qDQo+ICsgKiBDb252ZXJ0
IGJhY2sgZnJvbSBlbmNvZGVkIHZhbHVlIHRvIHR5cGUtc2FmZSwgb25seSB0byBiZSB1c2VkIHdo
ZW4gcmVnLm1jcg0KPiArICogaXMgdHJ1ZQ0KPiArICovDQo+ICtzdGF0aWMgc3RydWN0IHhlX3Jl
Z19tY3IgdG9feGVfcmVnX21jcihjb25zdCBzdHJ1Y3QgeGVfcmVnIHJlZykNCj4gK3sNCj4gKwly
ZXR1cm4gKGNvbnN0IHN0cnVjdCB4ZV9yZWdfbWNyKXsuX19yZWcucmF3ID0gcmVnLnJhdyB9Ow0K
PiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IGVtaXRfd2Ffam9iKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0
cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQ0KPiAgew0KPiAgCXN0cnVjdCB4ZV9yZWdfc3IgKnNyID0g
JnEtPmh3ZS0+cmVnX2xyYzsNCj4gIAlzdHJ1Y3QgeGVfcmVnX3NyX2VudHJ5ICplbnRyeTsNCj4g
LQl1bnNpZ25lZCBsb25nIHJlZzsNCj4gKwl1bnNpZ25lZCBsb25nIGlkeDsNCj4gIAlzdHJ1Y3Qg
eGVfc2NoZWRfam9iICpqb2I7DQo+ICAJc3RydWN0IHhlX2JiICpiYjsNCj4gIAlzdHJ1Y3QgZG1h
X2ZlbmNlICpmZW5jZTsNCj4gQEAgLTEyOSwxOCArMTM4LDM2IEBAIHN0YXRpYyBpbnQgZW1pdF93
YV9qb2Ioc3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHhlX2V4ZWNfcXVldWUgKnEpDQo+ICAJaWYg
KElTX0VSUihiYikpDQo+ICAJCXJldHVybiBQVFJfRVJSKGJiKTsNCj4gIA0KPiAtCXhhX2Zvcl9l
YWNoKCZzci0+eGEsIHJlZywgZW50cnkpDQo+ICsJeGFfZm9yX2VhY2goJnNyLT54YSwgaWR4LCBl
bnRyeSkNCj4gIAkJKytjb3VudDsNCj4gIA0KPiAgCWlmIChjb3VudCkgew0KPiAgCQl4ZV9ndF9k
YmcoZ3QsICJMUkMgV0EgJXMgc2F2ZS1yZXN0b3JlIGJhdGNoXG4iLCBzci0+bmFtZSk7DQo+ICAN
Cj4gIAkJYmItPmNzW2JiLT5sZW4rK10gPSBNSV9MT0FEX1JFR0lTVEVSX0lNTShjb3VudCk7DQo+
IC0JCXhhX2Zvcl9lYWNoKCZzci0+eGEsIHJlZywgZW50cnkpIHsNCj4gLQkJCWJiLT5jc1tiYi0+
bGVuKytdID0gcmVnOw0KPiAtCQkJYmItPmNzW2JiLT5sZW4rK10gPSBlbnRyeS0+c2V0X2JpdHM7
DQo+IC0JCQl4ZV9ndF9kYmcoZ3QsICJSRUdbMHglbHhdID0gMHglMDh4IiwgcmVnLA0KPiAtCQkJ
CSAgZW50cnktPnNldF9iaXRzKTsNCj4gKw0KPiArCQl4YV9mb3JfZWFjaCgmc3ItPnhhLCBpZHgs
IGVudHJ5KSB7DQo+ICsJCQlzdHJ1Y3QgeGVfcmVnIHJlZyA9IGVudHJ5LT5yZWc7DQo+ICsJCQlz
dHJ1Y3QgeGVfcmVnX21jciByZWdfbWNyID0gdG9feGVfcmVnX21jcihyZWcpOw0KPiArCQkJdTMy
IHZhbDsNCj4gKw0KPiArCQkJLyoNCj4gKwkJCSAqIFNraXAgcmVhZGluZyB0aGUgcmVnaXN0ZXIg
aWYgaXQncyBub3QgcmVhbGx5IG5lZWRlZA0KPiArCQkJICovDQo+ICsJCQlpZiAocmVnLm1hc2tl
ZCkNCj4gKwkJCQl2YWwgPSBlbnRyeS0+Y2xyX2JpdHMgPDwgMTY7DQo+ICsJCQllbHNlIGlmIChl
bnRyeS0+Y2xyX2JpdHMgKyAxKQ0KPiArCQkJCXZhbCA9IChyZWcubWNyID8NCj4gKwkJCQkgICAg
ICAgeGVfZ3RfbWNyX3VuaWNhc3RfcmVhZF9hbnkoZ3QsIHJlZ19tY3IpIDoNCj4gKwkJCQkgICAg
ICAgeGVfbW1pb19yZWFkMzIoZ3QsIHJlZykpICYgKH5lbnRyeS0+Y2xyX2JpdHMpOw0KPiArCQkJ
ZWxzZQ0KPiArCQkJCXZhbCA9IDA7DQo+ICsNCj4gKwkJCXZhbCB8PSBlbnRyeS0+c2V0X2JpdHM7
DQo+ICsNCj4gKwkJCWJiLT5jc1tiYi0+bGVuKytdID0gcmVnLmFkZHI7DQo+ICsJCQliYi0+Y3Nb
YmItPmxlbisrXSA9IHZhbDsNCj4gKwkJCXhlX2d0X2RiZyhndCwgIlJFR1sweCV4XSA9IDB4JTA4
eCIsIHJlZy5hZGRyLCB2YWwpOw0KPiAgCQl9DQo+ICAJfQ0KPiAgDQoNCg==
