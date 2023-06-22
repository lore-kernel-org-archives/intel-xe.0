Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3168EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 22:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893F410E5BB;
	Thu, 22 Jun 2023 22:56:52 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2731F10E37D
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 22:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687474611; x=1719010611;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ujMRm395Qb3s0ng6c4/JE5hWaV9iNrkOd0yGjq5UWEM=;
 b=knT3brcEo/SubrrcsBiPannieoUORC7zANZcuah3OmEJOZDdYv4ND5PJ
 3bZt8gqxwpkynfS1TEYv3G4ZWaI1anFyd8slQUDe07YHFgIu+qYSpWSys
 x3DojquYV2+5sKfZWrcPai4Xes+UtkJmgE41LtC1urxRRd6G/ygWNDlEr
 lsD8BL0PIDs2VcH3t4r9B1ObkuSbrirkdTRIrfbvLPdn6bOiTbBEeLhgu
 3LiVp0gWPQGxIQpY/khntVbqESETOQ9zn3UMxaEXptJVrXOjkCndP4OE5
 zyTKo+wUqSoN0oqcOOoAYaEhGEtbM6OSkkbN7yudOoa7q3nlQN/kLClWZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340235115"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="340235115"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 15:56:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="715112168"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; d="scan'208";a="715112168"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 22 Jun 2023 15:56:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 15:56:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 15:56:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 15:56:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpLi5YAGaK+U65txGRlTS3hLCrRxzr1OmLYMXvmd6vOBlTxyt51JVWwXS6yojiKb3vYYzG0/DjYs5mxbcEjqpwpeu9tZJP60FW/pCF18nXx0o9BgwSspyExMikDH/GdLalQyJQ694B7fakonnO/k5dXQSJypGjCIof01nrg3EsbOg/Jm0cYjdsNPBwZwSKTX3eB2R/k0n+kLqyL1wq6jUOG6pRec3XTmt5MrLtCGQpdShlDpn5OUu4M73CTkv4i+vIWMWzW/kF4lJDDMm5Kx09hYHPVndDEvZ7i1FBSzopyMWRqQ80faD9F+JrzML8aXOxDws9feqs5CqHJPDcqDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujMRm395Qb3s0ng6c4/JE5hWaV9iNrkOd0yGjq5UWEM=;
 b=ni8GH6n/zFEfvJMdUDLWPiI03VLW/INt/xkXSDS+ZHgU4Hi/juzSObcRBnhzeky9sHwQhndPsH0/bp3h1oDJKbRw/hF4KJplvCcBHpXwsy1l8HYYxqMscdQFPHRhcGRe7MwtGg/6XP0vOrUvb04/6X27fyORuy3BEKgbUOIjGdNpaaaeJaFgihj3oLHb//Ww20lUShiDMBvKzVEgsUcu/VIDIoc4A16AP3pAu62WilJxZ3lDP92drrseEpndD95ehcW+qEUr6krJ0zBI7mE6e+GINy/PcEOIIqeuLlHULgDkO4AbuwGtT7dkOZBMN1OtwZ6nOU2qG/7tV1eG8bea1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 22:56:46 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::84ff:c1a7:f884:4523]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::84ff:c1a7:f884:4523%7]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 22:56:46 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: properly check bounds for
 xe_wait_user_fence_ioctl()
Thread-Index: AQHZpVscZB4eO26qvU+V8WJyq+rVn6+XbuyA
Date: Thu, 22 Jun 2023 22:56:46 +0000
Message-ID: <446e49414fdec8ef613f46835a45c47395b8b7ac.camel@intel.com>
References: <20230622224255.760156-1-paulo.r.zanoni@intel.com>
 <20230622224255.760156-2-paulo.r.zanoni@intel.com>
In-Reply-To: <20230622224255.760156-2-paulo.r.zanoni@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8185:EE_|SN7PR11MB6560:EE_
x-ms-office365-filtering-correlation-id: 6320b0e1-f536-43a9-969c-08db7373f47b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X7yWhlkBOUhoIGUpk4mLtVx3T17X3TF2hzvRzJLxlQjL5V/HD+0v0HfStOjDn0KMJsCTakLM+M1ofMoVNAGcDljgCL6+uqspQe83NYcXO+iR1U3E3M5+4euOqhPA0cl5AqplHrLgFC1uBUsqPUHCchzs3uokN1ARoXt73Kx6Za7QUNpsI8Tw0SzW4UfEikxyKx49cpJGGEwsmbEnJeRHqldN41XzZ5CGGbezsBspn943YaEul+mBtEvsoEB4epBMoQNfyQdML29NcCiQloZVniV0I12rImjf/Vf5i/oLE7cuxE7J5tenZZLXbtuEPH7YvMBY+W2EctlxGr9+3IKAGVtQMPBlpMvgEKmghUEsAGH6tWHxhzGsaOh1HVTUYFMonHGa5QPgmtfZeU4aFQWqrxhV1mEWw/5SGgVAADbTXSRM7M+PY/TxXVbaHrr8j4iX75TAJ/OTnRjMedJlCxW+1KPajghUssPNI3rglOwEue5xW6iVuMy1kFF0hhKPm0UF/PYqwVbA/wP4gnWJHLMnFG+E4S1+d6W/jGwHkshPLMQbQR+LOzq78uPnioV8dR5h36HUs11KReVejiOmMZBqwsBM9qsKJGvdAlqbae487wk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199021)(6512007)(82960400001)(5660300002)(186003)(71200400001)(26005)(6506007)(478600001)(122000001)(38070700005)(2906002)(38100700002)(8936002)(2616005)(6486002)(41300700001)(8676002)(66476007)(66556008)(110136005)(66946007)(83380400001)(966005)(316002)(36756003)(64756008)(6636002)(66446008)(86362001)(76116006)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0lVS0ZVeEZ6OXdEVlRQS3pOcUFtQUxrYThkMkFPZWVHdDgwRnJGVUlqMWIx?=
 =?utf-8?B?cFhSMGo3WXU1WUFnZWdlU1ZUNE5UTm5raWpSa0RYZk1XelBPNUNOVUdiVXZu?=
 =?utf-8?B?cGFOZmhmbTVSanZtU1lGb3pWQ0ozQkUwY2JHdXRXazFlbFNEZlBGeC9wcjlC?=
 =?utf-8?B?a2RzS0VtVTNFeGhOWTg4NGRqSVFtTEdoWWZTdTA3TEhZMm16VS9UZm5hMDNI?=
 =?utf-8?B?ek9tSkltWFRFKzBmUUFQOFJySmVQSWx3MzBqT3AvS0RjazZUV0dEWFVXdnlt?=
 =?utf-8?B?TFIzUGJlT3ZRTkdEWmFjNE9adVp3U0I1SUQwUWtxTDNEcmZPN2c2UStmQUdr?=
 =?utf-8?B?elIwZ1RaYWR5K0FKYncwT280NVN4UGkwalR0MTRVZTN1MzdpbVZDN2hnV3VJ?=
 =?utf-8?B?VndUbm5mTmRUdFRUNzlmQUkyVXFwTXRWR3dyOHBLYVl3M1NVbGFUU0taQVA5?=
 =?utf-8?B?OG4zWTFRd09QcGFLdW5vS05CUGJhR201RXVZSEZnYXY2UDNrcFZQMURKSDY3?=
 =?utf-8?B?ODdYRkwwTmFRd3RaSi9MWUVqaE1YcThUMXM3L1NNaU1QQVRUNzZ6UC8vVmow?=
 =?utf-8?B?N002WVFYaU9qWmVGU1JUM2R6NSsvT2RvT1A0akxhQjZoUmNnY1U3NlFwRFJ1?=
 =?utf-8?B?VG1IM2xyUGZzZmdYZitFSkpOYldNTCs1L3B2a3drVXJtUDJnaGxVQXNWT211?=
 =?utf-8?B?TDBoSndCMDFYSzVIZkhHLzhNOUdDV0ZCdHd2ei85VE1KRTFVRlVJZHZHRlRQ?=
 =?utf-8?B?L1pKUmZnVDRvQ1VGeEZTd2VGQ2FCZGlzQkZtak9zb0VPamhhVk9rMktVVjJH?=
 =?utf-8?B?Z2szZzBZNGo4WXgyWnR3RWMrdkV0aVB6NFRVMERGRlYyZDJJM0F1cGxpT3Rl?=
 =?utf-8?B?OHVGaUhnOG5HZHdqUVN2TFF4WG5XYzVQZjlvS3Z1RlhDUHlKeThIRnU3N3Jz?=
 =?utf-8?B?R1ZiREphc3FyZE5Db0NIQnhacVJkeDJSMCtmVFJ5VFBnV3E2WmNzMG4xRFFt?=
 =?utf-8?B?SC9nWXpDTnhINUlnR2VFVW1RcjZHR253c1duUUl0TzNtSHl1ZCtqUGNVdkZQ?=
 =?utf-8?B?amFISko5ZU9Rdk84OEU4MkFRa3MzVHp5a3ZKMk42UVA1djlzaHdrOTdoMnlq?=
 =?utf-8?B?dC9JbjQyYmV5MHd6SnZGMXVTZ0h4NHhFdkJ2a3M5Y0p5VUlWYU03YVFSM3dF?=
 =?utf-8?B?VkhCZU52dm0yZzRhNHhpVEV1bjFUeWc4K2Y0NEwyOHMzTGw4SFZHdHlmQmFs?=
 =?utf-8?B?VFRGTDQ2eUhkbjFCZU1Pd21UOTVjd25mSmdOWmxWZk80SGc4cUcvMnkvdkMr?=
 =?utf-8?B?SGNWczlJVGR4a3ZGUHFxc251cUhTYmlWTURkYWRabUU2TjQ1UXhBOERzeEdJ?=
 =?utf-8?B?dzlrdW9CcHBzUnUyN051QWVEWU54TWVQR052UjBRdGxqQTkyNk01L0FaSVBO?=
 =?utf-8?B?VnAyRFdvMGJETDE0d3hndlVMU2pVWmhPaThaT0NvRk5KbUVWbnpnTDg5OFNV?=
 =?utf-8?B?OTBHOE1lZGxCME0xZVRzYWhsR292bEwxMzNrODlXZS85YXp6ZzFuUi9VdDVW?=
 =?utf-8?B?ajZMcDdsZlVlaXhKZ0JqUXVuTEdYTUNGeldCR1prUkFWQWdFYnppdUkyM3R6?=
 =?utf-8?B?VzZGcnNZK2RoOVpPUUpUVjVDaWVpcU1JVS9tT2YvMFBPSlZFZUVHZUc3Smdq?=
 =?utf-8?B?R0VPMFoxMXptemw0bXBmZVp3QlVvWmZhYmVzZllrR2pHMXo4ZE03NFpFUi90?=
 =?utf-8?B?WnpibmdJdHZtWDdnZm1xRlB2b2VQN2ZOWXgyOTl2ZFhPS0ZpSWZKY0prbytE?=
 =?utf-8?B?YVZacEhaZFAzaS9WSjA2cHZlZHNiTjBhaFg1eSthdnhiZlhHOGM2bUpOajhN?=
 =?utf-8?B?N0g3bGt5RS94R3VSSXRrcTFwcU82ZUc3aTJ4aElDZmFVd0VtRy9IREJnNFRn?=
 =?utf-8?B?QVB2NFRPT21XVTFlTkR3YXA2MWxBUkVISk1iU05iM2UyTzZUSVVQQ1FOcjhn?=
 =?utf-8?B?aVhpL2taYVlvRkIreVBIenlpem5JWXJrSDBWMTN6VE1taTRrYitsaVlHem9x?=
 =?utf-8?B?U2RvUEhmbEJLZVhqVitaRGNlWEhzNXlWZFlDd0xXb1ZLcXlIK1dDYS9YYUQv?=
 =?utf-8?B?aXdFcFQxeDdvaFNTSS9Ja0crYWpuU1dvbVArVitJZXpmQ0VmWlZ5cFUvUS9w?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E98CACBF4E18347870DF7D951F5C302@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6320b0e1-f536-43a9-969c-08db7373f47b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 22:56:46.2870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zaXn9BoVJy9znVHh7TuFxQiAKYEyzmQyYxbe/hpF+OeHPdAoDQ/zOxwD5X4vHwygb68V364eJpnIjMUxUYmjIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6560
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: properly check bounds for
 xe_wait_user_fence_ioctl()
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

T24gVGh1LCAyMDIzLTA2LTIyIGF0IDE1OjQyIC0wNzAwLCBQYXVsbyBaYW5vbmkgd3JvdGU6DQo+
IElmICFub19lbmdpbmVzLCB0aGVuIHdlIHVzZSBjb3B5X2Zyb21fdXNlciB0byBjb3B5IHRvIHRo
ZSAnZWNpJyBhcnJheSwNCj4gd2hpY2ggaGFzIFhFX0hXX0VOR0lORV9NQVhfSU5TVEFOQ0UgbWVt
YmVycy4gVGhlIGFtb3VudCBvZiBtZW1iZXJzDQo+IGNvcGllZCBpcyBnaXZlbiBieSB0aGUgdXNl
ciBpbiBhcmdzLT5udW1fZW5naW5lcywgc28gYWRkIGNvZGUgdG8gY2hlY2sNCj4gdGhhdCBhcmdz
LT5udW1fZW5naW5lcyBkb2VzIG5vdCBleGNlZWQgWEVfSFdfRU5HSU5FX01BWF9JTlNUQU5DRS4g
SXQncw0KPiBhbiB1bnNpZ25lZCB2YWx1ZSBzbyB0aGVyZSdzIG5vIG5lZWQgdG8gY2hlY2sgZm9y
IG5lZ2F0aXZlIHZhbHVlcy4NCj4gDQo+IEZpeGVzIGVycm9yIG1lc3NhZ2VzIHN1Y2ggYXM6DQo+
IA0KPiAgICAgQnVmZmVyIG92ZXJmbG93IGRldGVjdGVkICg1NCA8IDE4NDQ2NzQ0MDczNzA5NTUx
NTIwKSENCj4gDQo+IFZlcnkgc2ltcGxlIHJlcHJvZHVjZXI6DQo+IA0KPiAgICAgaHR0cHM6Ly9w
ZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35wemFub25pL3dhaXQtdXNlci1mZW5jZS1idWcvDQoNClJl
dmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4N
Cg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGF1bG8gWmFub25pIDxwYXVsby5yLnphbm9uaUBpbnRl
bC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNlcl9mZW5jZS5j
IHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IA0KPiBP
biBhIHNpZGUgbm90ZSwgSSBub3RpY2VkIHRoZSB0aW1lb3V0IGlzIGluIGppZmZpZXMuIFRoYXQg
aXMgYSB2ZXJ5IHdlaXJkIHRoaW5nDQo+IHRvIGFzayBmcm9tIHVzZXIgc3BhY2UuDQoNClRoZXJl
IGlzIHVuZGVyIHJldmlldyBwYXRjaGVzIHRvIGNoYW5nZSB0aGF0IHRvIG5zZWMuDQoNCj4gDQo+
IEFsc28sIHNob3VsZG4ndCB3ZSBiZSB1c2luZyBtb3N0bHkgY29weV9mcm9tX3VzZXIoKSBpbnN0
ZWFkIG9mDQo+IF9fY29weV9mcm9tX3VzZXIoKT8NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfd2FpdF91c2VyX2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
d2FpdF91c2VyX2ZlbmNlLmMNCj4gaW5kZXggMzEyMjM3NDM0MWQ2Li4wOThlMmE0Y2ZmM2YgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YWl0X3VzZXJfZmVuY2UuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2FpdF91c2VyX2ZlbmNlLmMNCj4gQEAgLTEyMSw2
ICsxMjEsOSBAQCBpbnQgeGVfd2FpdF91c2VyX2ZlbmNlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEsDQo+ICAJCQkgYWRkciAmIDB4NykpDQo+ICAJCXJldHVybiAtRUlO
VkFMOw0KPiAgDQo+ICsJaWYgKFhFX0lPQ1RMX0VSUih4ZSwgYXJncy0+bnVtX2VuZ2luZXMgPiBY
RV9IV19FTkdJTkVfTUFYX0lOU1RBTkNFKSkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4g
IAlpZiAoIW5vX2VuZ2luZXMpIHsNCj4gIAkJZXJyID0gY29weV9mcm9tX3VzZXIoZWNpLCB1c2Vy
X2VjaSwNCj4gIAkJCQkgICAgIHNpemVvZihzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0
YW5jZSkgKg0KDQo=
