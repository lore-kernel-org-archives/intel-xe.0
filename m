Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0773BC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 17:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C0B10E209;
	Wed, 29 Nov 2023 17:10:07 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Wed, 29 Nov 2023 17:10:05 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECFF10E209
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701277805; x=1732813805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XDVubcx5bLfN7iI1jaRaxDAfqOwN8ly6ZV/ontYQ3Bg=;
 b=RG7uXCWexbpZwU2pgDYIRKCK9laTan/nbrR4WgNkLqwl04SfmH+LMZZ6
 S3xDhXvOJyc1rgMS7G9qmGvckcYEt+HwWyiFOajiOwLLLrgCuh9xynjE/
 lWWaGFS5bm2jeywyVaRyv9Ij2Bh+pIIMNHKpKYGpw0rGURfWcg1nJM9gK
 RzCOJQ4i7u/NIHJvNMHlaimpwU1lJRtMHpPsyZqWF2ecs+lIu/VI38MTp
 VjWkzN/KTzFA/a7eow0ax4Ozq/srIS7Ex/1JYRY3bBxmZ9K6MUwFFo/Bt
 1jauabfpll+SfdWlfNb0nVCrKDxBT+gZvRt5w9A71EPonZuEZcbkySr51 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="65190"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="65190"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 09:03:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="10406268"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 09:02:59 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 09:02:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 09:02:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 09:02:58 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 09:02:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SI9J+sd4Tr6d9xlQizDElMJGaCUPrEXJtaxrWE5Y7GOSVyXBrQf/0L74pf6uujSDEhjUqtkeVk2HprcvrGHGB+ON8G3+2Kn1Z/3tuUngiZECFU/sklBjE7DKxnmPC/4ahe9V60csPjj72dstL0DvXmUto4ex3zmKLjpb0+8ypXm3FxWpx+QwVYQnNVzfy+2YuQOCBhyu+Lz+NUH+JX97rbpcm4BoPvJKrA0RE3P05Qfd5mQz1uBvLh9xa/MKl/KlHaKQkrD5eyt/lgfSAEw5qSvIUpwz4YosIskIcArExIP3C0VTS1QY/GnT6FYkeMfCdlUiYXTk1z+IiA8vNVhDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDVubcx5bLfN7iI1jaRaxDAfqOwN8ly6ZV/ontYQ3Bg=;
 b=Bh1R7fidnwEkhlCU9Vnzu/tDnZ3fFjejzs3HH8OHDD8/m2Vdol1lTpXlTCOY5bG/3QjM4g7KRGMadpwDNOJyEEl9HCiWo7GkiOpXDx2T3SKMWs+VSufHlWAutisb1hMhVkqt34F3rtM5Xbc3FrRQZZZB30I294bSYLrdXSWoahU36/UfEU+ZBjpxO7XeelAoIRj6klf1gG6O25B/Z65ddcE/c75uBaxmX4Ln+JS5IoNDeZfRHbtFEhC5vMJcDcK2J15dfsNqX+lad2z0iD+DcIHZadKzVyJTuMSvibYC02UixhvQr5v3jq9PAQ2RIeYiv7MzMQ69X76mcitx5SwUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by PH0PR11MB4982.namprd11.prod.outlook.com (2603:10b6:510:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 17:02:55 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 17:02:55 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v2 13/14] drm/xe/uapi: Fix various struct padding for 64b
 alignment
Thread-Index: AQHaHVGoi5SiCvGWAUWUPV39rQGTHLCRkSMA
Date: Wed, 29 Nov 2023 17:02:54 +0000
Message-ID: <cce23fbe34b769dc27a4f70f62b04c1c0f4850bd.camel@intel.com>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-14-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-14-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|PH0PR11MB4982:EE_
x-ms-office365-filtering-correlation-id: acb498fd-424d-4897-34e1-08dbf0fd07c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iODKGARfn/5iQFzwJgABtpPG7e/NR3JWsfcknXHrkJD2EXCETsESkHOzClaZJbo0CQkP17WNLx8ZhkDEZKv/t0r/We18zubytBD28dYcYTLq0nBIGESF2uHt/x1ewOu0hdJJOs/7aINq8Z6kjxaYIiQFM5i5GhhINOv7P2qgyEddHBRReyQ9GmDfUbUCaWQ4rHMmmFdaIuOLNcp1JYf3YXanvmpxTWaXsWitnKYVpilHlpKtxh0rVNOmL9KaxqAYskn4VlVO+C2bYKzlAcC/mNlUnpE037SxP6wU1O3xCemp39XoF4lOJeCOUeQ9T3pBO2MYLf7+L+gA5Lf5vbGjMGDrBBys5NgHjMNKAkm8OqZXzAGb1GYOUjWZXRIo18e8kq/Ti862Uuyx/3mmNTQ56bpilDcyecEr04CEACSr82wZpOa5mLI8FkfghidKjmeUg4EjF2v2iz+XbwZmOX5DQ0S45fkOqEwqHce0RzH1iO2PmvERZsqwXeHcLBR8KERpwzRGbyzP3TgBVf1L+ZcxJVJ6YrnTB1OqXvr6oYf+BA9+0VA0sXXzvzMFPRGTstIXJriLXtpg58z7iBASupeFXJIWzXUnLNKFIJsJeIg7CtklazVevCXlRE/GffW0i0/A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(376002)(396003)(346002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(4001150100001)(41300700001)(66946007)(110136005)(66446008)(6512007)(91956017)(6636002)(64756008)(8676002)(316002)(76116006)(66476007)(5660300002)(6506007)(478600001)(4326008)(6486002)(71200400001)(2616005)(107886003)(26005)(83380400001)(66556008)(8936002)(38100700002)(86362001)(82960400001)(122000001)(38070700009)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTZjQkg0K2tNMWEvK2JFN3FNWE1WWnlnS1pxdVNDWkl5c0lMVG11enlQaGg1?=
 =?utf-8?B?ZzllVFFkVjdzaXg4MVBBd1FLSWxGSGRSa1lxVWp5WURlQjU0L3pDTEFKSFFT?=
 =?utf-8?B?VUlwU0k1TWk1R1N6cW1WejNuTjBvQU00ZGlWZ1hSNTNYUmpLR1hyeWJqU3JZ?=
 =?utf-8?B?elIwM3RqMERNRUx0RGgyejNQYmJYUHRyMHRpbFhPRmIyK1BienVoMmh0TFhU?=
 =?utf-8?B?ZmdkVTJHR1NabCsxUEVsZVR6dFkwWEpqaEdpUmxRUDNacHFSNkFnR096cTQ5?=
 =?utf-8?B?ZityeTdKUEFMMHd6NlZzWDVyQU5xaHFiakVKNVcvSzZYY2xpd0E5UnYzSXZR?=
 =?utf-8?B?Kys0MlhibS9lalJCYkJ3UlpkU3BsZnB5YzA2YzZ4NFQrTHpvNWlmN1V2d0pU?=
 =?utf-8?B?cDVVYVVzRmVxUTh0SXhUUEp5YlNUYmhrZE1IMVVmR2c5VXpORVJqU2haODJ3?=
 =?utf-8?B?Y2JmWVJLSVpKaCtXVEVWa2o2SlFjU3cxSVF0V1ZGZEU5b2lVUzJIeUd0K1BO?=
 =?utf-8?B?VFBZZDN5QnViRHJEUlEzODA0b2hnZjFtSmpqbEgxZ2Y5dkV0dXIvQkRtRDNn?=
 =?utf-8?B?aXluVUtBajc1cTFkVlo3TXp1Mjc4MG01TkJPUWdRb010RFdHb1l6bmxJbjRO?=
 =?utf-8?B?OFExeHljV1NlalBPbnM5QVFyNmErMXY1QUt4d1JETjRuZ0V3a0RuSGtnVmJS?=
 =?utf-8?B?T21CcHV0cnVzcSttUHZMdVBZNzZjUFNadVlqTWZwRjRMZStnMS9QUWE1Vk91?=
 =?utf-8?B?M2x4am9ScGZIZ3NSOGtVOURPYXB3TjVMQVJGTTBQaDhpUm1xK1RGa3J1M3o1?=
 =?utf-8?B?RWdvMDR5cCtFbXBQWDZacGRHNGFZTDVKSlh4RDR3TUFuSHhmUmRGMGZFQzIz?=
 =?utf-8?B?dHViUUtYVVVKVkcxUXMyOHRjb0J5YkpVaWU4YjdSZWtMNGsvSUQxVEM1THZ2?=
 =?utf-8?B?cjYvOXlVUHhNa3R5RlovMHNFMjRiMkdDSXRZL2NQTldPMlNkcWhGZXIvdkpD?=
 =?utf-8?B?ZlF0M1dQS0hiTWM0NUZ2d3ZuVS9RWGNWMXl5Z1FQK1JtK2JyYzJJNDBKRjlZ?=
 =?utf-8?B?Q2tLeTYyeUMxZWNudHZ6dU5oMk5oWUl2SklXbDViNzRCRUIxZnRBS2tQdlYv?=
 =?utf-8?B?UUlzZmVoSENtUzd5cU5lWUE3YUx1aUd0SmdpM2pFbVF0VUF5dlFNdStjTEJp?=
 =?utf-8?B?N3RkTmNKYU5yUzFDY3NGMkJUbk1LNVAxNTNSMHdYNTFSL1hIeXVhVXd5K0RG?=
 =?utf-8?B?aWl2MkZoaVltYzhjTGhxc3pOaWlUcjd6bURTS2VZcjNMa1p6b2l0Zm5rSVNU?=
 =?utf-8?B?QUNtNE4xR1hoUDI2TnkwZ0VKcWorRUtkSEFqa0VyM05mbGE0M0IxVGMzUkti?=
 =?utf-8?B?Qjd0bUtraHpWcFBYWEJoL1pmL0VqSi9hU1hTQXJoRkQ0REl4cTFtWGlDMGlB?=
 =?utf-8?B?SkpQYjZzdW5JZG9VOCs1N3B0dUc1SUgwSUhHMWFDNkNqWlZ4S21zdXBqWW1r?=
 =?utf-8?B?bFBFQ2I0eEQyY1BSQXVCV0ZnOFZTaUdRSGN1YzlXTDl2Y1V1TldyQWRsU1RB?=
 =?utf-8?B?OHUxNW53ZGVka2U3Vk5VT2QxazVGRURCeDR0UkJreUVUdEhaTFZ1NTVGd3d1?=
 =?utf-8?B?N2lPNnMzb3pTTnVZaGRHblI2SS9wZVZndnBRYTBqZTFWOHdVRXBYdFRpeXFE?=
 =?utf-8?B?NGxoSU9yUFBqdm5nZldlNWthTFVzN1B5RDltd09zcnJSd1Rtbmo1K3lqMlZt?=
 =?utf-8?B?SklVc2p2STBDSHRqNUNSc2Mxd2ZoSWxuWWdqbFNYb3hYS2lPdVZZcmNmQWNJ?=
 =?utf-8?B?K2s0WHIxL1ZmL1VPTExhUlBqdW5LeW1jQTBTTXNWVUdYaUNHUTVLMVI0ZGZv?=
 =?utf-8?B?Z2hLQWlHTVQ0Y3J1NitWTC9vbHJxQXU5d2l0blRudkRnaUhHUEtQbHZwNWhW?=
 =?utf-8?B?V1owdmdvTmZ5dVJPNUo1Y0ZobHdySSthbkROTS9MR2gzM1Y0K2tpSC9tbDBJ?=
 =?utf-8?B?NEc2aU9JM3dNcllIbk1SUmRlMFFjd1MrdHBvMU5EbUhUdjlvM0ZUUEZLUUJQ?=
 =?utf-8?B?b2RnSHJ4UVZoeHRzK1RqTzhTWnZCOEJ1NUdscmswZjdzOUhveFlIZkFwbmxz?=
 =?utf-8?B?U0NrK1k3SVcyR1hIYnBNUUVWbGkwa1ZQVDYvbGRIYXB6MjRZSDdpaVNyZHpj?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBC0B7CBCBAE2F43A8D741A3AA058473@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb498fd-424d-4897-34e1-08dbf0fd07c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 17:02:54.9933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uq3LFHGk+iuNbomILeREbE8ozOPqKPr+eQdedpl0PZzu/k5pmBpqKZrMi4ADV7Zebb8zD/skYixOh+5Hie8lYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4982
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 13/14] drm/xe/uapi: Fix various struct
 padding for 64b alignment
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTIyIGF0IDE0OjM4ICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IExl
dCdzIHJlc3BlY3QgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2JvdGNoaW5nLXVwLWlvY3Rscy5yc3QN
Cj4gYW5kIGFkZCB0aGUgcHJvcGVyIHBhZGRpbmcgZm9yIGEgNjRiIGFsaWdubWVudCB3aXRoIGFs
bCBhcw0KPiB3ZWxsIGFzIGFsbCB0aGUgcmVxdWlyZWQgY2hlY2tzIGFuZCBzZXR0aW5ncyBmb3Ig
dGhlIHBhZHMNCj4gYW5kIHRoZSByZXNlcnZlZCBlbnRyaWVzLg0KDQpOb3cgdGhhdCB0aGUgUEFU
IHVBUEkgbGFuZGVkIHRoaXMgcGF0Y2ggbmVlZHMgYWxpZ25tZW50IGZpeGVzIGluIGRybV94ZV9n
ZW1fY3JlYXRlLg0KDQo+IA0KPiB2MjogRml4IHJlbWFpbmluZyB3aG9sZXMgYW5kIGRvdWJsZSBj
aGVjayB3aXRoIHBhaG9sZSAoSm9zZSkNCj4gICAgIEVuc3VyZSB3aXRoIHBhaG9sZSB0aGF0IGJv
dGggMzJiIGFuZCA2NGIgaGF2ZSBleGFjdCBzYW1lDQo+ICAgICBsYXlvdXQgKFRob21hcykNCj4g
ICAgIERvIG5vdCBzZXQgcXVlcnkncyBwYWQgYW5kIHJlc2VydmVkIGJpdHMgdG8gemVybyBzaW5j
ZSBpdA0KPiAgICAgaXMgcmVkdW5kYW50IGFuZCBhbHJlYWR5IGRvbmUgYnkga3phbGxvYyAoTWF0
dCkNCj4gDQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+DQo+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5j
b20+DQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4N
Cj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogRnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBSZXZp
ZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+
IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgfCAgMSArDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfdm0uYyAgICB8ICA4ICsrKysrKysrDQo+ICBpbmNsdWRlL3VhcGkvZHJt
L3hlX2RybS5oICAgICB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMjAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9xdWVy
eS5jDQo+IGluZGV4IDA5NWYxYjhjMjI5MC4uZDA1MjNkZmM0ODhmIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcXVlcnkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfcXVlcnkuYw0KPiBAQCAtMzcxLDYgKzM3MSw3IEBAIHN0YXRpYyBpbnQgcXVlcnlfZ3RfbGlz
dChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgc3RydWN0IGRybV94ZV9kZXZpY2VfcXVlcnkgKnF1ZXJ5
DQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgDQo+ICAJZ3RfbGlzdC0+bnVtX2d0ID0geGUtPmlu
Zm8uZ3RfY291bnQ7DQo+ICsNCj4gIAlmb3JfZWFjaF9ndChndCwgeGUsIGlkKSB7DQo+ICAJCWlm
ICh4ZV9ndF9pc19tZWRpYV90eXBlKGd0KSkNCj4gIAkJCWd0X2xpc3QtPmd0X2xpc3RbaWRdLnR5
cGUgPSBEUk1fWEVfUVVFUllfR1RfVFlQRV9NRURJQTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gaW5kZXgg
Y2NkMjgyMWU2MWY4Li4xZGJkNmU5NDg3NDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC0y
ODE3LDYgKzI4MTcsMTAgQEAgc3RhdGljIGludCB2bV9iaW5kX2lvY3RsX2NoZWNrX2FyZ3Moc3Ry
dWN0IHhlX2RldmljZSAqeGUsDQo+ICAJaW50IGVycjsNCj4gIAlpbnQgaTsNCj4gIA0KPiArCWlm
IChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnBhZCB8fCBhcmdzLT5wYWQyKSB8fA0KPiArCSAgICBY
RV9JT0NUTF9EQkcoeGUsIGFyZ3MtPnJlc2VydmVkWzBdIHx8IGFyZ3MtPnJlc2VydmVkWzFdKSkN
Cj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gIAlpZiAoWEVfSU9DVExfREJHKHhlLCBhcmdz
LT5leHRlbnNpb25zKSB8fA0KPiAgCSAgICBYRV9JT0NUTF9EQkcoeGUsICFhcmdzLT5udW1fYmlu
ZHMpIHx8DQo+ICAJICAgIFhFX0lPQ1RMX0RCRyh4ZSwgYXJncy0+bnVtX2JpbmRzID4gTUFYX0JJ
TkRTKSkNCj4gQEAgLTI5MzMsNiArMjkzNywxMCBAQCBpbnQgeGVfdm1fYmluZF9pb2N0bChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpDQo+
ICAJaWYgKGVycikNCj4gIAkJcmV0dXJuIGVycjsNCj4gIA0KPiArCWlmIChYRV9JT0NUTF9EQkco
eGUsIGFyZ3MtPnBhZCB8fCBhcmdzLT5wYWQyKSB8fA0KPiArCSAgICBYRV9JT0NUTF9EQkcoeGUs
IGFyZ3MtPnJlc2VydmVkWzBdIHx8IGFyZ3MtPnJlc2VydmVkWzFdKSkNCj4gKwkJcmV0dXJuIC1F
SU5WQUw7DQo+ICsNCj4gIAlpZiAoYXJncy0+ZXhlY19xdWV1ZV9pZCkgew0KPiAgCQlxID0geGVf
ZXhlY19xdWV1ZV9sb29rdXAoeGVmLCBhcmdzLT5leGVjX3F1ZXVlX2lkKTsNCj4gIAkJaWYgKFhF
X0lPQ1RMX0RCRyh4ZSwgIXEpKSB7DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hl
X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiBpbmRleCBiMGVmMWY2MmZkOTku
LjRjMTc1OTQ2NTQ3YyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0K
PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+IEBAIC0yMTEsOCArMjExLDYgQEAg
c3RydWN0IGRybV94ZV9tZW1fcmVnaW9uIHsNCj4gIAkgKiBhIHVuaXF1ZSBwYWlyLg0KPiAgCSAq
Lw0KPiAgCV9fdTE2IGluc3RhbmNlOw0KPiAtCS8qKiBAcGFkOiBNQlogKi8NCj4gLQlfX3UzMiBw
YWQ7DQo+ICAJLyoqDQo+ICAJICogQG1pbl9wYWdlX3NpemU6IE1pbiBwYWdlLXNpemUgaW4gYnl0
ZXMgZm9yIHRoaXMgcmVnaW9uLg0KPiAgCSAqDQo+IEBAIC0zODEsNiArMzc5LDggQEAgc3RydWN0
IGRybV94ZV9ndCB7DQo+ICAJX191MTYgdGlsZV9pZDsNCj4gIAkvKiogQGd0X2lkOiBVbmlxdWUg
SUQgb2YgdGhpcyBHVCB3aXRoaW4gdGhlIFBDSSBEZXZpY2UgKi8NCj4gIAlfX3UxNiBndF9pZDsN
Cj4gKwkvKiogQHBhZDogTUJaICovDQo+ICsJX191MTYgcGFkWzNdOw0KPiAgCS8qKiBAcmVmZXJl
bmNlX2Nsb2NrOiBBIGNsb2NrIGZyZXF1ZW5jeSBmb3IgdGltZXN0YW1wICovDQo+ICAJX191MzIg
cmVmZXJlbmNlX2Nsb2NrOw0KPiAgCS8qKg0KPiBAQCAtNzE1LDYgKzcxNSw5IEBAIHN0cnVjdCBk
cm1feGVfdm1fYmluZF9vcCB7DQo+ICAJICovDQo+ICAJX191MzIgcHJlZmV0Y2hfbWVtX3JlZ2lv
bl9pbnN0YW5jZTsNCj4gIA0KPiArCS8qKiBAcGFkOiBNQlogKi8NCj4gKwlfX3UzMiBwYWQyOw0K
PiArDQo+ICAJLyoqIEByZXNlcnZlZDogUmVzZXJ2ZWQgKi8NCj4gIAlfX3U2NCByZXNlcnZlZFsz
XTsNCj4gIH07DQo+IEBAIC03MzMsMTIgKzczNiwxMiBAQCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmQg
ew0KPiAgCSAqLw0KPiAgCV9fdTMyIGV4ZWNfcXVldWVfaWQ7DQo+ICANCj4gLQkvKiogQG51bV9i
aW5kczogbnVtYmVyIG9mIGJpbmRzIGluIHRoaXMgSU9DVEwgKi8NCj4gLQlfX3UzMiBudW1fYmlu
ZHM7DQo+IC0NCj4gIAkvKiogQHBhZDogTUJaICovDQo+ICAJX191MzIgcGFkOw0KPiAgDQo+ICsJ
LyoqIEBudW1fYmluZHM6IG51bWJlciBvZiBiaW5kcyBpbiB0aGlzIElPQ1RMICovDQo+ICsJX191
MzIgbnVtX2JpbmRzOw0KPiArDQo+ICAJdW5pb24gew0KPiAgCQkvKiogQGJpbmQ6IHVzZWQgaWYg
bnVtX2JpbmRzID09IDEgKi8NCj4gIAkJc3RydWN0IGRybV94ZV92bV9iaW5kX29wIGJpbmQ7DQo+
IEBAIC03NTAsMTIgKzc1MywxMiBAQCBzdHJ1Y3QgZHJtX3hlX3ZtX2JpbmQgew0KPiAgCQlfX3U2
NCB2ZWN0b3Jfb2ZfYmluZHM7DQo+ICAJfTsNCj4gIA0KPiArCS8qKiBAcGFkOiBNQlogKi8NCj4g
KwlfX3UzMiBwYWQyOw0KPiArDQo+ICAJLyoqIEBudW1fc3luY3M6IGFtb3VudCBvZiBzeW5jcyB0
byB3YWl0IG9uICovDQo+ICAJX191MzIgbnVtX3N5bmNzOw0KPiAgDQo+IC0JLyoqIEBwYWQyOiBN
QlogKi8NCj4gLQlfX3UzMiBwYWQyOw0KPiAtDQo+ICAJLyoqIEBzeW5jczogcG9pbnRlciB0byBz
dHJ1Y3QgZHJtX3hlX3N5bmMgYXJyYXkgKi8NCj4gIAlfX3U2NCBzeW5jczsNCj4gIA0KDQo=
