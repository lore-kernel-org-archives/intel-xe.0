Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD2CE7B1E
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 19:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2024210E0AE;
	Thu, 28 Sep 2023 19:41:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496DB10E0AE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695930061; x=1727466061;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=0gcegjbN27XBtqYMyq3KGcrFdlsFOj3ZFhEpLoc14hw=;
 b=T08BtNLnybTSpsh087u44eG+dS42LUcGVNKucrM46Q24UGrJ9qPD7iTT
 HbWhi7WJKtFfCIAjRcyMApr93oty6peuQsCxBDx/Q1zNiBkOpbjJAvyy5
 q9n0pw+HijuPUb1sK+JnOw0VS9sq4+F8xK2mT+xFoQNsWgH92gA1A1Ugw
 BO6ly6sVeXJYSUOeyMsEBf/dts9YQyserimOgkbiH/QpHyB4M9859IVVq
 WMK1DJ5kvSVkVOu0AhtvEeXgHUTqS53ntUYmJMCHiAiV8wlGVWzQyi1tJ
 +Q6MqkJTPTcGJeZbgWLI5qDFeFPXQPNIzeGud1G7xxm8DtZDcKKZDUyxO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413070057"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="413070057"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 12:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="743191459"
X-IronPort-AV: E=Sophos;i="6.03,185,1694761200"; d="scan'208";a="743191459"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 12:40:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 12:40:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 12:40:55 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 12:40:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 12:40:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WssPbrbCRd3Cr5P+KayTR9BtVP4E950KMjrMIpewmcINKwENB/9vW6FRw0alIgOoNl4YWrkUBAEuacTAuYhC6lie6YZMzHy9GdhbO0vAt+9N+kfymlZfdi4oBdCfs4FkFDQxbJzvnmiJ1reMPHWN/hOdk3pkJh8Uy9U6bA7SKpGtsINP7T05k5fr7gNiWY86a9xx4tNNOd94J2xPIWmV2gq9L035xPsigH0VBuG/lvNvTeI+djAg71el3+mnQC7YfYJg8UpKRIS6/cVkQeUYKkRGhSZeSmfl5OJG1BAEmmFp9vBdanT4sgSeZo5xfRxWeoc+CwKztG5qr7hlBGRShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gcegjbN27XBtqYMyq3KGcrFdlsFOj3ZFhEpLoc14hw=;
 b=nlZRmXvXb0VzmHUWjsQ5mqPUxnnBuN7LHezuFLqYKkcGw8GxfDA2hm9o2lx+s7Jpi64DQFnA7Ac6VXVS4M029FovANuWjKcxeRHGH6bIuyb8R+L/R3rDvku/FUD1PJVsA7NaBBeHk6FS6dapYVcBXsA6AE6Vp8qJ4k0dXXm1KBUnBNkyT4CTZH0zb8MLH/EwHg3dXmLaE3PIJwiWE3FV0hgvVvrias4YIIKG00GN84vdYFXgd+JwToQGYf9+IpZRD7ghi06aLjuydCfYmvQlc+FbNvFFoT19dUSUHwNUo8k/W88DJocjKDZD1Vj5mGr1Uhp5oSNeDjeGfGHgrJKb7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SJ0PR11MB5582.namprd11.prod.outlook.com (2603:10b6:a03:3aa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Thu, 28 Sep
 2023 19:40:47 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::d6ef:5aaf:ef8f:5d47%7]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 19:40:47 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Thread-Topic: [Intel-xe] [PATCH v6 0/5] PAT and cache coherency support
Thread-Index: AQHZ8fNnV1Vj2nKJaUeYB0ZRPvsdzbAwo3GA
Date: Thu, 28 Sep 2023 19:40:47 +0000
Message-ID: <b70464b0c79eb96f4dea3b7dcd232feffd48804f.camel@intel.com>
References: <20230928100537.392675-7-matthew.auld@intel.com>
In-Reply-To: <20230928100537.392675-7-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SJ0PR11MB5582:EE_
x-ms-office365-filtering-correlation-id: 1c7a3d6c-3c21-4e97-19a3-08dbc05ad038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Pp1GHsMz+XMQenrWUUwbTIM2mAA+VgL3AXX4uP6TCv34D47+yFqTqFev0eNAg606hOFIGNP3bmYlR9pZJMs+saZXyKX737OR5OIR0Rs35V5p087sLbsnKbPTodob4tZphQyp+QMqzA797bEKlemhX8qjYbv2ZKFY7FBWdRa3QFb+jEjwJeD9L+2I2l/ong+atMK99fE1XWkrKTmBlqXCyZKUhWHV98FU+7k36QpPNJktMRf/hFicrTSMuSMja6Y2IppG6V0oBrH15hjb4Ehkn74cXeljYy1322Jn7+Su09+DHXIAbwaV0b4bCA7KXN4pWzdFJaXU6UgylTwpJ0FQUQMsgqFoUPkYwFdmKyrku0ZQiCVCsRWUiMEY0m2dCI5zWCIvDwsxKBzDRfITD7FQCvmjr5/8CHuMGQXAp9bMNoElrh/xczAPnK+jiSlB39yE6gCEMRzJ9lSufu068vIHnCK7P7h04vThk8AqVxn7c6zw8eIGEtmOFf76htlJYWWyKTfb0HWKvYK06kqnuAp+WGuAAZ4FhxdxpxbAKRU0LoddMTgZm1HOMB6FBLI2eLaQxaXf4wmdbhNyp72KExzI5TvvGKepFGccG3HyPVn0x4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2906002)(8936002)(5660300002)(8676002)(6636002)(316002)(6506007)(41300700001)(64756008)(91956017)(66946007)(966005)(66446008)(66556008)(110136005)(26005)(66476007)(76116006)(6512007)(38100700002)(2616005)(71200400001)(38070700005)(86362001)(82960400001)(83380400001)(478600001)(122000001)(36756003)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDZBZnpIM2JjYzBwZWVCOFUweW1lMkEydEpVWUI4bEhjbFhuai9sK0lyeEFq?=
 =?utf-8?B?bDVtSVMybzZDWmdwRUxqMFZIZk1hK3Z3Qy85VGordDdGb1cycXUyeC9KNGVK?=
 =?utf-8?B?U0ZEVXZkTmRlbENsMGtMM2ZCWFhSN2R2OHVqcm1laFh2eDJhK25YTzlaVHdV?=
 =?utf-8?B?OUJWNmxmNjd6aUtOWUJkdElsS09ydzFweGZ0WndpQUJwSE1kcGpIcFFoK2Nq?=
 =?utf-8?B?NlNvYi9mRW1mR0FkcjkzeGFNYnV3bWFUdVdkTE1LaUpIWHo4cFRmelp6Q3Zi?=
 =?utf-8?B?V284eS9Eb1BzTmg3NnBWcjJrQktwYnRKbnh1dnFkcTBMcnJhd3h6QUI5UVhR?=
 =?utf-8?B?UkJzTDRwMW1uT2F0ZUw3QzZxYVVscS9vdjdZRXBUTk9SZzZEdDNKSG4zUmN0?=
 =?utf-8?B?U0kvNnhhTktPRWhiaE93aEJjZk12L3pkaGIwTExUZUZ3QVVTYzhqbUFUbC9s?=
 =?utf-8?B?RjFCRHhPMlNRd0tSclN6R0RLZnhoS05lSUZvREpGZ1N6bU5mRjkrNzZKajdG?=
 =?utf-8?B?ZlF1ZDMxVE9VUnBQTVd3NXQ3cGtVbWIzT0xCaTYrdFB3a09tRWpSZWNpZVRM?=
 =?utf-8?B?ZmNHbUVVbXkxSTZuc09tMjNCQzRSVFJPbktLS1U3cU82b2ZOZ2JMQmVwbU9Y?=
 =?utf-8?B?ZFlWb04rRGwyMzlqeS9LcjlSZVBzVGhmOWVockV5VUM0dmVWZUhKZDlmcEJj?=
 =?utf-8?B?aURWMldTUXBxVDVTWjZybi9sRjJVRER2bE9GOG5kUlhPck9Cb3A4V3p5Vk9O?=
 =?utf-8?B?WENPenZIaFNBZ0VwTnZyZ2lQaGtaZnVwTitaTkIwMWF2czcySG40VnpsVFZh?=
 =?utf-8?B?ZEVHZnJWSjFjeUZTUXpRSlc2T0lPUEZPTTNoLzZqSFAyVHRtWHBrSjFGWjRY?=
 =?utf-8?B?WFVDUm95VXZGNDJiYXFzQUd3c1JxNTdTRjkvWFg1QXdmeFpWQWx3R2J5VnZR?=
 =?utf-8?B?LzArVGs1YWV0Sm5DM0wrcE1vQmR3SkVsb2FzNnFYRFluQkE2cW1BOVNhMGhY?=
 =?utf-8?B?WTRsMzY0Z3FjR0R3ZDZZZ1ltZlFMZS9xbmlwcnZDRjQzbEl3MDZkbXBLamYz?=
 =?utf-8?B?TFU4dVg4blVjNy9qd1Y1ZkJZWkZYRXRrWHhWcFpoS3IreDE0VVpSTlJoMWVZ?=
 =?utf-8?B?T3JPaG9KNHZHak15U2lnNmFvbHNXL3lKMFhuVmp5NUZqMkIxUUI5QzJYU0hT?=
 =?utf-8?B?RnpscFRDYzFSYnRBNkQwa01acGlodG9mY3RWdHBxemhocVJxMkE0SDQvUnJw?=
 =?utf-8?B?UWVyeWFQV1RHN01oRkxxcnlQa3h0LzJ1YXFxeHliYklyRERWV3VURHJoMHUw?=
 =?utf-8?B?QmorSUVzbGlzS0Jnb3R4bkRWMkNzZFRQUGRTYmNuLzNUM2ZwZzl1azYzZTN3?=
 =?utf-8?B?WnloRGs5cGdTQ3hVZ1psNVFZNHJKVHdpV2t5OXRQWmQ2YWF3eGFsOEc2TWNH?=
 =?utf-8?B?SDJBMUlZWlJwSlA2Wk1hZkY5bTJjZ3lhSFBSRDY5K1JGZ2RNUjVrcktxQVoz?=
 =?utf-8?B?TWhJQXRyRU1UNGlDM1MxTFpuZldMaWlGdDZGeVRmM1BlKzhRSTBEYm9RcDFt?=
 =?utf-8?B?a3U5aDBpdkY2WXVzbnNQbGh2WmoxOTNyTjJ1Q0J3WDNndHdIR0hXVkpyYjNh?=
 =?utf-8?B?V0VmazRnckwzU25EWWVwamN2dWR4UVhsKzdVKzhiTyt2ZDE0VnBKaDJMSTJO?=
 =?utf-8?B?ei92eVVwLzQyODA5ZDh6R3VJaW9kd0xudDl4NGlScERvd2NhcFZZeHJRSC9j?=
 =?utf-8?B?ckVIcFpFUDNFL01FelcwNGVHRklFMFdUdHdsZEMra3FoYUozMCt3L2JYbEQ3?=
 =?utf-8?B?QnNrRnZNb2FiZjg4cUJ2a0VmZ1U2WFJ2blBKMytid2V6U2lad1JpSFZkQVpT?=
 =?utf-8?B?bTloUUVHTFo2NVd6VHpaUHlpUlIxNXZjK1pjOEt5RThjSkltWFp3K2RyOEha?=
 =?utf-8?B?L0pqbTRjY2lPOXBKSkRqWTZFalowaCt0elV4eG1NanBwcVBrQnpWSmhxczJJ?=
 =?utf-8?B?Q0JNY1JncXhoL0R3czV4dXlTQTNvRFl3d21KN3BCY3BTbWF3aWE5d0ZwSjA1?=
 =?utf-8?B?bVRwdDVBdDkxc1IxNTR6d3lDR2NVZTU2MERHWmRSVUVrSGViVk5Ld2gxbnBn?=
 =?utf-8?B?T3ZTSTM3VGV2aUljVkhTL0hMMnA3aUg3WENwU0VGbHF1MDRBTFlqa3dtT1lz?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83D3F12677DEC44A893CA4C83498479D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7a3d6c-3c21-4e97-19a3-08dbc05ad038
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 19:40:47.5466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /g85BwdVvZo2oMYze8iIYNvJe5hAqyT5gN2cLS4oxyrsrqjOoTs3CiJCdEdYHl8PH5XEVymM0CQTXjbh/jBAmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5582
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 0/5] PAT and cache coherency support
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

T24gVGh1LCAyMDIzLTA5LTI4IGF0IDExOjA1ICswMTAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEJyYW5jaCBhdmFpbGFibGUgaGVyZToNCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L213YS9rZXJuZWwvLS90cmVlL3hlLXBhdC1pbmRleD9yZWZfdHlwZT1oZWFkcw0KPiANCj4gR29h
bCBoZXJlIGlzIHRvIGFsbG93IHVzZXJzcGFjZSB0byBkaXJlY3RseSBjb250cm9sIHRoZSBwYXRf
aW5kZXggd2hlbiBtYXBwaW5nDQo+IG1lbW9yeSB2aWEgdGhlIHBwR1RULCBpbiBhZGR0aW9uIHRv
IHRoZSBDUFUgY2FjaGluZyBtb2RlLiBUaGlzIGlzIHZlcnkgbXVjaA0KPiBuZWVkZWQgb24gbmV3
ZXIgaWdwdSBwbGF0Zm9ybXMgd2hpY2ggYWxsb3cgaW5jb2hlcmVudCBHVCBhY2Nlc3MsIHdoZXJl
IHRoZQ0KPiBjaG9pY2Ugb3ZlciB0aGUgY2FjaGUgbGV2ZWwgYW5kIGV4cGVjdGVkIGNvaGVyZW5j
eSBpcyBiZXN0IGxlZnQgdG8gdXNlcnNwYWNlDQo+IGRlcGVuZGluZyBvbiB0aGVpciB1c2VjYXNl
LiAgSW4gdGhlIGZ1dHVyZSB0aGVyZSBtYXkgYWxzbyBiZSBvdGhlciBzdHVmZiBlbmNvZGVkDQo+
IGluIHRoZSBwYXRfaW5kZXgsIHNvIGdpdmluZyB1c2Vyc3BhY2UgZGlyZWN0IGNvbnRyb2wgd2ls
bCBhbHNvIGJlIG5lZWRlZCB0aGVyZS4NCj4gDQo+IFRvIHN1cHBvcnQgdGhpcyB3ZSBhZGRlZCBu
ZXcgZ2VtX2NyZWF0ZSB1QVBJIGZvciBzZWxlY3RpbmcgdGhlIENQVSBjYWNoZQ0KPiBtb2RlIHRv
IHVzZSBmb3Igc3lzdGVtIG1lbW9yeSwgaW5jbHVkaW5nIHRoZSBleHBlY3RlZCBHUFUgY29oZXJl
bmN5IG1vZGUuIFRoZXJlDQo+IGFyZSB2YXJpb3VzIHJlc3RyaWN0aW9ucyBoZXJlIGZvciB0aGUg
c2VsZWN0ZWQgY29oZXJlbmN5IG1vZGUgYW5kIGNvbXBhdGlibGUgQ1BVDQo+IGNhY2hlIG1vZGVz
LiAgV2l0aCB0aGF0IGluIHBsYWNlIHRoZSBhY3R1YWwgcGF0X2luZGV4IGNhbiBub3cgYmUgcHJv
dmlkZWQgYXMNCj4gcGFydCBvZiB2bV9iaW5kLiBUaGUgb25seSByZXN0cmljdGlvbiBpcyB0aGF0
IHRoZSBjb2hlcmVuY3kgbW9kZSBvZiB0aGUNCj4gcGF0X2luZGV4IG11c3QgYmUgYXQgbGVhc3Qg
YXMgY29oZXJlbnQgYXMgdGhlIGdlbV9jcmVhdGUgY29oZXJlbmN5IG1vZGUuIFRoZXJlDQo+IGFy
ZSBhbHNvIHNvbWUgc3BlY2lhbCBjYXNlcyBsaWtlIHdpdGggdXNlcnB0ciBhbmQgZG1hLWJ1Zi4N
Cj4gDQo+IHYyOg0KPiAgIC0gTG9hZHMgb2YgaW1wcm92ZW1lbnRzL3R3ZWFrcy4gTWFpbiBjaGFu
Z2VzIGFyZSB0byBub3cgYWxsb3cNCj4gICAgIGdlbV9jcmVhdGUuY29oX21vZGUgPD0gY29oX21v
ZGUocGF0X2luZGV4KSwgcmF0aGVyIHRoYW4gaXQgbmVlZGluZyB0byBtYXRjaA0KPiAgICAgZXhh
Y3RseS4gVGhpcyBzaW1wbGlmaWVzIHRoZSBkbWEtYnVmIHBvbGljeSBmcm9tIHVzZXJzcGFjZSBw
b3YuIEFsc28gd2Ugbm93DQo+ICAgICBvbmx5IGNvbnNpZGVyIENPSF9OT05FIGFuZCBDT0hfQVRf
TEVBU1RfMVdBWS4NCj4gdjM6DQo+ICAgLSBSZWJhc2UuIFNwbGl0IHRoZSBwdGVfZW5jb2RlKCkg
cmVmYWN0b3JpbmcsIHBsdXMgdmFyaW91cyBzbWFsbGVyIHR3ZWFrcyBhbmQNCj4gICAgIGZpeGVz
Lg0KPiB2NDoNCj4gICAtIFJlYmFzZSBvbiBMdWNhcycgbmV3IHNlcmllcy4NCj4gICAtIERyb3Ag
VUMgY2FjaGUgbW9kZS4NCj4gICAtIHMvc21lbV9jcHVfY2FjaGluZy9jcHVfY2FjaGluZy8uIElk
ZWEgaXMgdG8gbWFrZSBWUkFNIFdDIGV4cGxpY2l0IGluIHRoZQ0KPiAgICAgdWFwaSwgcGx1cyBt
YWtlIGl0IG1vcmUgZnV0dXJlIHByb29mLg0KPiB2NToNCj4gICAtIFJlYmFzZSwgcGx1cyBzb21l
IHNtYWxsIHR3ZWFrcyBhbmQgZml4ZXMuDQo+IHY2Og0KPiAgIC0gQ0kgaG9va3MgZml4ZXMgKyBj
aGVja3BhdGNoLg0KPiANCg0KV2l0aCBjb21tZW50IGluIHBhdGNoIDMvNiBmaXhlZCB0aGlzIHNl
cmllcyBpczoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXph
QGludGVsLmNvbT4NClRlc3RlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+DQoNClRoYW5rIHlvdQ0K
