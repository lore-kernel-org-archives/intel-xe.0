Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C70EC47DA9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 19:28:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA8311349E;
	Tue, 30 Jan 2024 19:28:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4E51134AB
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 19:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706642905; x=1738178905;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=rRrWwbSkTEpXchDmstC4jSIqtDrBksSDpfA+mguhoVU=;
 b=ZCNZ3keogQS1iw4YcaeQGrvkaFFuZ0JVv/asFp5lHRIah3h2HsvJL5Za
 RyfGns2wmbW64cpTQ/AwktGaNxMrKgfottmTgrzcKNEus2+SCcXOLOGLi
 Zv7xIHr3SSXGpIclYdhhD1U0PZ9yniYu8uHQKhn8Rn+uAfP2JNf4/P758
 iEBDlVl5dhKkb5PtvHoX+w3FsJxntq3InEkkyWtU7gSqu5kfOlvbvkSmG
 6TE8S2AYXeu4TA8TTqes1aXKfemHx28V9nAJuBJTtWOVXDkQRDXrmd0Ff
 LlTWJyxjUpZIFPMVHy8rn6zgvlFvY/qpI7iYUiJcEgJ+jNh0acmeakRrE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10025743"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="10025743"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 11:28:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="822302205"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="822302205"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 11:28:24 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 11:28:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 11:28:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 11:28:23 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 11:28:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZN1r8dbZKezU96FaC5H0w5zbN1GHNthrk33KIHxH60TukssUj+pSXICpvK+DrxcmH/XuPas/Y53AAO5iJj2esM7Q3A1eQPPEMgvDvMylGAii9wNAuCfJqy1GA5TPP5gD001sZTD0laYxwF0pxr62wRUA0GO2DhHR00SbmucwU0OKEw1ERU1EeiVF5ZT0hWWbfrPdtIwGcnl/k6CFSSOsaahZXTXjhpXjg4DTxSfyjYJjguvQ1kc3/RDhWBfm7McYgJkddBIc0LRGHnVIZgOdcjvYPTLMDB76e2U5axhIJYinmE1miqs4UG9glSKc03idWPlbTH2wqUy9C2ijHMExQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRrWwbSkTEpXchDmstC4jSIqtDrBksSDpfA+mguhoVU=;
 b=e8DPfOKM5Yib7CH7VH8dmkY/5bEU8k2nI19ybCrcN2sChap70IsOod9UvPhPH0WGgz8AwQKK8PvVZ+e0M/0hBTTqisT4wiscPEDKEgEwJF/1tfkU+TUi5pfw9sTHnRE1IKr6TXRTuKcO/9fWT5QyZRTsiDDQb9Wfzis3RL+PlwQKS2xr4fq4BamXxik8Oli4IYygR30YUENOThJeF7++b8E4Q0WdC7y/IOgWx+bP77DMA0SifhDOfrGczy89sIZfU8ATc5CV8KhaGDwgklacR5+wbY/KTA16Cr5jkFt0BnJCWu/oV2MYeWCne78NJTH+8AsQF/z5Bp8Bq2n8iSA20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN6PR11MB8242.namprd11.prod.outlook.com (2603:10b6:208:474::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 19:28:15 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 19:28:15 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/1] drm/xe: Expose number of dss per group and helpers
Thread-Topic: [PATCH v4 1/1] drm/xe: Expose number of dss per group and helpers
Thread-Index: AQHaU65Z055q0YSCUkCabdXSVy9XdLDyvZIA
Date: Tue, 30 Jan 2024 19:28:15 +0000
Message-ID: <2f311ebe657e8dc9a23fef829d749d1e7f74d4a7.camel@intel.com>
References: <20240130185744.209647-1-zhanjun.dong@intel.com>
 <20240130185744.209647-2-zhanjun.dong@intel.com>
In-Reply-To: <20240130185744.209647-2-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN6PR11MB8242:EE_
x-ms-office365-filtering-correlation-id: 19f3d559-a978-45d8-d579-08dc21c99b1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jy6v8D8ykHpE6mXMXWrnGiXV6hq/H/Fwt0VlXcsPy2j0+71/Q8hYnvMcErA3xMVyyt0ofEJjlh2lYgt8Iq9RF5lDxKprTNpa9gQMgEFxDnNmNI2oi+nrOzgRb/FZx2Xer5ODTuGqxS3Ho8TEyVab7UGMa708gj5c3Cj81WbcZq4giC/cYpa7USuxvshuaig5ef/jveWhwRQT5Z6mfMiX106/N+1McTU0P+VRwNa21dBMSGGjkm0R6J5Uo871BwBBHwbtl19Qb+zAJExRGBkiJX5cIT6DgWmMir4c7FwHHJOF1dU3d4So1z1VpBwXdVAIWWg6S16mebQVcPqkk5bFiwqlHYHudHOf37bHHxiYUbTMwxVl5SJFOk9OCAjuOj64diMjfXv9H3dmcO6cnEsXHlD3/62jDdYZanMgDzc96J6X0zXmCUD0RZQTAhxmbJeAMWeN6ba4CeOldXrI9q3dIw1jgc9u6x7J02dHF19eikaa/PkWUTAEUEeAdyM1SBCXT5JN++BOB+vmmupc7DoGRps1i000u7Igfmx++FqEzGw8HR5OsmxHyWt0OjALm9RJYNWgtsUiTc6QckyNlMZQKGe8yyO5+MTcTzIM4KHtIVMwRaplgi6GmGpXoMBSM3E3rYwRWLewztL+U+UsYItqyiBdMbeWxM0RjoiGmRV9XT8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(376002)(39860400002)(136003)(230273577357003)(230922051799003)(230173577357003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(82960400001)(38100700002)(122000001)(66946007)(66446008)(76116006)(316002)(110136005)(8676002)(6506007)(66476007)(6486002)(8936002)(64756008)(26005)(86362001)(5660300002)(2616005)(6512007)(478600001)(2906002)(71200400001)(36756003)(66556008)(83380400001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWtCS1ZYcTNvdEVQMk1hdVd6UXprdFNSZE1oL1JtVThjN1BkMGRvUWdlMzM2?=
 =?utf-8?B?c1Fjamd2STlGMEc0UXAxRFhRMU83cTRzYks4Nm9zSUUzYkQ0QTFTcWZOZFRI?=
 =?utf-8?B?Y3h2VjZUSm1HcXI0VE43NkcrR1RCRExUTVRMNzRKZ0hvMGhNMVlPb1grKzN2?=
 =?utf-8?B?QXE0dmphYTBhMElXVTlVSi9EbVZzeVE2MWhMQmVFWWlGdzQ3R0h5M2l3OFFV?=
 =?utf-8?B?NGdYOC9LaEo5WWgxaDZ1TjVPNy8ySWpaY0NFdEUrWHhUS20yaXg0dURKc2kv?=
 =?utf-8?B?eFEwdEN3QjNESHFuNko0K1ZiOHI5STFIQjlEZXZKdXlaMzFUWDEzNmwzZlEr?=
 =?utf-8?B?MFZTM3piWnM3V2QvdUxKSVV2TW5HYkcyLzd0Y3VVSUlxN0VXaWlNQTJGN0ln?=
 =?utf-8?B?UThDOG9HVDc5Vm9xN2wyYVNYcEczT0NHVXpPdXB1ZVpEWG84TGdFYmIvK1ZQ?=
 =?utf-8?B?VVNWN2h2cjhmRy9kcEhMNGI4STZxVDYvM21hQ0Nwb25kTUFMWDdxbk9tb21q?=
 =?utf-8?B?QXdyak5KQzdlbVZFT2RSUHpER2xHNER0Tk5tVnk2YTc1RllNVHZMME9ZMC82?=
 =?utf-8?B?a05UdGhUS29ZRFowQ09GaXZLOU5OTldpeDVnV0lTSHJOV05RUWhmbUVDZHJH?=
 =?utf-8?B?Ky9mQlA2QjRYVEdySmluNEI5WUV0Qk5UQktVcHRIYlhwZlBMV0tZYzZsZlBG?=
 =?utf-8?B?UUFGa21SL2FFaFFzRzFDZHdaVnhhODV0VVU4NUt6MEg5aWlWY0ZDRXpzNWIz?=
 =?utf-8?B?Y3VYeVZtKzEwSnF2TEY3YndaUEV2NTNLdWg4MW04VjA3alFmWnlTTC9PK1ZZ?=
 =?utf-8?B?Uy9YdVhrV0Z4ajR0eVQ1eHo5ZWtzSXNkdFdSYk94ckh2U1RaRWFCaVowdkRU?=
 =?utf-8?B?bXZEU2J0TjUzTk0wUThNWCtMSWZ0M09mVUgyOXBoM0dwcWVQVjlnek1LRk9S?=
 =?utf-8?B?ZjZHT2NyL1VPclJsdnBDQkNtdVMwVmlBbzlLUjR5QTVaTFk2SEJtdm1sTFhJ?=
 =?utf-8?B?KzdGMkFqYkxRT1V6a0g4YzJNbjE0S0ZhbWtwcUdwSHErMDJkUkVGTGR5eVJk?=
 =?utf-8?B?WkJuTGxoR0ZLelFlbElkVHFtTCtCR1U0Y1B1bDhUR1U2S1pMakQxSm9WVWdo?=
 =?utf-8?B?bExhN3k1MW1VMFlXb0tUZ0ppaWdmUHdFWThBVkFXTS9QYmdwV29lS1Q1SUFF?=
 =?utf-8?B?L3FweDQyR2N2MVdadEsxdkpmb0RaM2kzUnI0OXRXQkwxZS9pRmFFMWkwTzht?=
 =?utf-8?B?VVBzYmhrNFhxUGFXNGRGNVViY0dSaGp6S00zano5ejlxNTN5d0xMbUFQUndH?=
 =?utf-8?B?aTBSMlFFaDhEMHZZT2MrTTNzZHI0QWJtNEpuU2NSRGFKbDZ4TFZUUDNZMVI5?=
 =?utf-8?B?WCtmVFV6V1QxUTN6SnBadWlBWmNCQkpqSmxKeFpXR2c2b0lTNC9SaU5CZVJs?=
 =?utf-8?B?SDBGc0VzUjNxeVVsV1RFRlF5VVczZ0RGSittOU1oZi9XL2x4UHo2aVhKK1pT?=
 =?utf-8?B?dGtoZVRIaHcrUXBOODA3UklwelBXVU9aaGxtMllMVFpsTE9kakdKMG5sTWl6?=
 =?utf-8?B?ZWxFK3puMW5QQThpWCtlWEpZL1NNL3Y5TmxJRzhVekRjakd3bTh0SHZzQW93?=
 =?utf-8?B?K01KS3lKUFk1V2tqTVhGZ25XR3hmQ25NTkJsOEgxZFRjRWtkWGl6U0wzVFNT?=
 =?utf-8?B?dytGa1loUjRtNHM0Zk9TQk81MW5qU3pzd0NOS0RCWXZPZkN1SWxuSDFIVTEz?=
 =?utf-8?B?NVZTd3hLcHd0V1RMcU84dnBINDI3MnRLaUhRc2ZDeVAzN3RyZTRhbGlCNVBI?=
 =?utf-8?B?aFdIY241VWhHb1dDMWxYdWpHUTNHT1l1ZktBeU1nSlhwclNtakZZaCtwUHBH?=
 =?utf-8?B?L0dOVFpSeXp1MUVpWXdra2VXb2NkZlNEQjN0a0I3TWE1OUt4aFU4UzdKMkxj?=
 =?utf-8?B?cGcxZ3ZZckFaVFArTm1xL1NucTF0Sk1mRHlvdSs4citCeGREQW90eXBXNnhp?=
 =?utf-8?B?U25laFhMUGwvajgyaTZkQ0c3NS9NcSthRHV2VWJ3UFFZRXNXTHYweU1UNzJi?=
 =?utf-8?B?QndaaW1xemtvSmc3WW04UWkxRkJkQTJwWUJOTHFiSytZajJRSGo1QTFoWVJH?=
 =?utf-8?B?d1dDaHh1cU81WDV5YkJualhaUXpzb0FPK0ZkVFo4QkZScExwZW9WU0FqeVI0?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <468B6D3A949B8E46AEC84D92CC9FADA5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f3d559-a978-45d8-d579-08dc21c99b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 19:28:15.4312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sajSCt4aDalSXivwlu1X5WoiD1ySM/mLMTTNrh06y1H+UNzqf7QHACubzPWw2TOKeQ/lXGmYLkM5glJcxpgK2KOH1BqwLjW5jOguFqlyoEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8242
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI0LTAxLTMwIGF0IDEwOjU3IC0wODAwLCBaaGFuanVuIERvbmcgd3JvdGU6DQo+
IEV4cG9zZSBoZWxwZXIgZm9yIGRzcyBwZXIgZ3JvdXAuIFRoaXMgaXMgYSBwcmVjdXJzb3IgcGF0
Y2ggdG8gYWxsb3cNCj4gZm9yIGVhc2llciBpdGVyYXRpb24gdGhyb3VnaCBNQ1IgcmVnaXN0ZXJz
IGFuZCBvdGhlciBwZXItRFNTIHVzZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERv
bmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF9tY3IuY8KgwqDCoMKgwqAgfCA0MA0KPiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaMKgwqDCoMKgwqAgfCAxNyAr
KysrKysrKysrKysNCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9wb2xvZ3kuYyB8wqAg
MSAtDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmjCoMKgwqAgfMKgIDEgKw0K
PiDCoDQgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmMNCj4gYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmMNCj4gaW5kZXggNzc5MjViMzVjZjhkLi43Y2Q5M2Jj
YjgxMWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmMNCj4gQEAgLTI5MSwxMSArMjkxLDE2
IEBAIHN0YXRpYyB2b2lkIGluaXRfc3RlZXJpbmdfbXNsaWNlKHN0cnVjdCB4ZV9ndA0KPiAqZ3Qp
DQo+IMKgwqDCoMKgwqDCoMKgwqBndC0+c3RlZXJpbmdbTE5DRl0uaW5zdGFuY2VfdGFyZ2V0ID0g
MDvCoMKgwqDCoMKgwqDCoMKgwqAvKiB1bnVzZWQgKi8NCj4gwqB9DQo+IMKgDQo+ICtpbnQgeGVf
Z3RfbWNyX2dldF9kc3NfcGVyX2dyb3VwKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ICt7DQo+ICvCoMKg
wqDCoMKgwqDCoHJldHVybiBndF90b194ZShndCktPmluZm8ucGxhdGZvcm0gPT0gWEVfUFZDID8g
OCA6IDQ7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgdm9pZCBpbml0X3N0ZWVyaW5nX2RzcyhzdHJ1
Y3QgeGVfZ3QgKmd0KQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBkc3Mg
PSBtaW4oeGVfZHNzX21hc2tfZ3JvdXBfZmZzKGd0LQ0KPiA+ZnVzZV90b3BvLmdfZHNzX21hc2ss
IDAsIDApLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGVfZHNzX21hc2tfZ3JvdXBfZmZzKGd0LQ0KPiA+ZnVzZV90b3BvLmNf
ZHNzX21hc2ssIDAsIDApKTsNCj4gLcKgwqDCoMKgwqDCoMKgdW5zaWduZWQgaW50IGRzc19wZXJf
Z3JwID0gZ3RfdG9feGUoZ3QpLT5pbmZvLnBsYXRmb3JtID09DQo+IFhFX1BWQyA/IDggOiA0Ow0K
PiArwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgZHNzX3Blcl9ncnAgPSB4ZV9ndF9tY3JfZ2V0
X2Rzc19wZXJfZ3JvdXAoZ3QpOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgZ3QtPnN0ZWVyaW5n
W0RTU10uZ3JvdXBfdGFyZ2V0ID0gZHNzIC8gZHNzX3Blcl9ncnA7DQo+IMKgwqDCoMKgwqDCoMKg
wqBndC0+c3RlZXJpbmdbRFNTXS5pbnN0YW5jZV90YXJnZXQgPSBkc3MgJSBkc3NfcGVyX2dycDsN
Cj4gQEAgLTY4MywzICs2ODgsMzYgQEAgdm9pZCB4ZV9ndF9tY3Jfc3RlZXJpbmdfZHVtcChzdHJ1
Y3QgeGVfZ3QgKmd0LA0KPiBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoH0NCj4gKw0KPiAr
LyoqDQo+ICsgKiB4ZV9ndF9tY3JfZ2V0X2Rzc19zdGVlcmluZyAtIHJldHVybnMgdGhlIGdyb3Vw
L2luc3RhbmNlIHN0ZWVyaW5nDQo+IGZvciBhIFNTDQo+ICsgKiBAZ3Q6IEdUIHN0cnVjdHVyZQ0K
PiArICogQGRzczogRFNTIElEIHRvIG9idGFpbiBzdGVlcmluZyBmb3INCj4gKyAqIEBncm91cDog
cG9pbnRlciB0byBzdG9yYWdlIGZvciBzdGVlcmluZyBncm91cCBJRA0KPiArICogQGluc3RhbmNl
OiBwb2ludGVyIHRvIHN0b3JhZ2UgZm9yIHN0ZWVyaW5nIGluc3RhbmNlIElEDQo+ICsgKg0KPiAr
ICogUmV0dXJucyB0aGUgc3RlZXJpbmcgSURzICh2aWEgdGhlIEBncm91cCBhbmQgQGluc3RhbmNl
DQo+IHBhcmFtZXRlcnMpIHRoYXQNCj4gKyAqIGNvcnJlc3BvbmQgdG8gYSBzcGVjaWZpYyBzdWJz
bGljZS9EU1MgSUQuDQo+ICsgKi8NCj4gK3ZvaWQgeGVfZ3RfbWNyX2dldF9kc3Nfc3RlZXJpbmco
c3RydWN0IHhlX2d0ICpndCwgdW5zaWduZWQgaW50IGRzcywNCj4gdW5zaWduZWQgaW50ICpncm91
cCwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgdW5zaWduZWQgaW50ICppbnN0YW5jZSkNCj4gK3sNCj4gK8KgwqDCoMKgwqDC
oMKgaW50IGRzc19wZXJfZ3JwID0geGVfZ3RfbWNyX2dldF9kc3NfcGVyX2dyb3VwKGd0KTsNCj4g
Kw0KPiArwqDCoMKgwqDCoMKgwqAqZ3JvdXAgPSBkc3MgLyBkc3NfcGVyX2dycDsNCj4gK8KgwqDC
oMKgwqDCoMKgKmluc3RhbmNlID0gZHNzICUgZHNzX3Blcl9ncnA7DQo+ICt9DQo+ICsNCj4gK2Jv
b2wgeGVfZ3RfbWNyX2Rzc19oYXNfc3Vic2xpY2Uoc3RydWN0IHhlX2d0ICpndCwgaW50IHNsaWNl
LCBpbnQNCj4gc3Vic2xpY2UpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoGludCBkc3NfcGVyX2dy
cCA9IHhlX2d0X21jcl9nZXRfZHNzX3Blcl9ncm91cChndCk7DQo+ICvCoMKgwqDCoMKgwqDCoGlu
dCBpbmRleCA9IHNsaWNlICogZHNzX3Blcl9ncnAgKyBzdWJzbGljZTsNCj4gKw0KPiArwqDCoMKg
wqDCoMKgwqBpZiAoaW5kZXggPj0gWEVfTUFYX0RTU19GVVNFX0JJVFMpIHsNCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX2d0X2RiZyhndCwgIkRTUyBpZCBvdXQgb2YgcmFuZ2U6
IHNsaWNlOiVkDQo+IHN1YnNsaWNlOiVkXG4iLCBzbGljZSwgc3Vic2xpY2UpOw0KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOw0KPiArwqDCoMKgwqDCoMKgwqB9
DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHRlc3RfYml0KGluZGV4LCBndC0+ZnVzZV90
b3BvLmdfZHNzX21hc2spIHx8DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0ZXN0X2Jp
dChpbmRleCwgZ3QtPmZ1c2VfdG9wby5jX2Rzc19tYXNrKTsNCj4gK30NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF9tY3IuaA0KPiBpbmRleCAyN2NhMWJjODgwYTAuLjdkMWViMTgwYmVmZCAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X21jci5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9tY3IuaA0KPiBAQCAtNyw2ICs3LDcgQEANCj4gwqAjZGVmaW5lIF9YRV9H
VF9NQ1JfSF8NCj4gwqANCj4gwqAjaW5jbHVkZSAicmVncy94ZV9yZWdfZGVmcy5oIg0KPiArI2lu
Y2x1ZGUgInhlX2d0X3R5cGVzLmgiDQo+IMKgDQo+IMKgc3RydWN0IGRybV9wcmludGVyOw0KPiDC
oHN0cnVjdCB4ZV9ndDsNCj4gQEAgLTI1LDUgKzI2LDIxIEBAIHZvaWQgeGVfZ3RfbWNyX211bHRp
Y2FzdF93cml0ZShzdHJ1Y3QgeGVfZ3QgKmd0LA0KPiBzdHJ1Y3QgeGVfcmVnX21jciBtY3JfcmVn
LA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdTMyIHZhbHVlKTsNCj4gwqANCj4gwqB2b2lkIHhlX2d0X21jcl9zdGVlcmluZ19k
dW1wKHN0cnVjdCB4ZV9ndCAqZ3QsIHN0cnVjdCBkcm1fcHJpbnRlcg0KPiAqcCk7DQo+ICtpbnQg
eGVfZ3RfbWNyX2dldF9kc3NfcGVyX2dyb3VwKHN0cnVjdCB4ZV9ndCAqZ3QpOw0KPiArdm9pZCB4
ZV9ndF9tY3JfZ2V0X2Rzc19zdGVlcmluZyhzdHJ1Y3QgeGVfZ3QgKmd0LCB1bnNpZ25lZCBpbnQg
ZHNzLA0KPiB1bnNpZ25lZCBpbnQgKmdyb3VwLA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBpbnQgKmluc3Rh
bmNlKTsNCj4gK2Jvb2wgeGVfZ3RfbWNyX2Rzc19oYXNfc3Vic2xpY2Uoc3RydWN0IHhlX2d0ICpn
dCwgaW50IHNsaWNlLCBpbnQNCj4gc3Vic2xpY2UpOw0KPiArDQo+ICsjZGVmaW5lIF9IQVNfU1Mo
Z3RfLCBncm91cF8sIGluc3RhbmNlXykNCg0KTWF5YmUgZ3RfXywgZ3JvdXBfXywgaW5zdGFuY2Vf
Xw0KDQo+IHhlX2d0X21jcl9kc3NfaGFzX3N1YnNsaWNlKGd0XywgZ3JvdXBfLCBpbnN0YW5jZV8p
DQo+ICsNCj4gKy8qDQo+ICsgKiBMb29wIG92ZXIgZWFjaCBzdWJzbGljZS9EU1MgYW5kIGRldGVy
bWluZSB0aGUgZ3JvdXAgYW5kIGluc3RhbmNlDQo+IElEcyB0aGF0DQo+ICsgKiBzaG91bGQgYmUg
dXNlZCB0byBzdGVlciBNQ1IgYWNjZXNzZXMgdG93YXJkIHRoaXMgRFNTLg0KPiArICovDQo+ICsj
ZGVmaW5lIGZvcl9lYWNoX2Rzc19zdGVlcmluZyhkc3NfLCBndF8sIGdyb3VwXywgaW5zdGFuY2Vf
KSBcDQo+ICvCoMKgwqDCoMKgwqDCoGZvciAoZHNzXyA9IDAsIHhlX2d0X21jcl9nZXRfZHNzX3N0
ZWVyaW5nKGd0XywgMCwgJmdyb3VwXywNCj4gJmluc3RhbmNlXyk7IFwNCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZHNzXyA8IFhFX01BWF9EU1NfRlVTRV9CSVRTOyBcDQo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRzc18rKywgeGVfZ3RfbWNyX2dldF9kc3Nfc3RlZXJpbmcoZ3RfLCBkc3Nf
LCAmZ3JvdXBfLA0KPiAmaW5zdGFuY2VfKSkgXA0KDQpJIHRoaW5rIHlvdSdyZSBzdGlsbCBnb2lu
ZyB0byBnZXQgdGhvc2UgY2hlY2twYXRjaCB3YXJuaW5ncyBoZXJlLg0KDQpBcmUgeW91IHBsYW5u
aW5nIG9uIGFkZHJlc3NpbmcgdGhhdD8NCg0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZm9yX2VhY2hfaWYoX0hBU19TUyhndF8sIGdyb3VwXywgaW5zdGFuY2VfKSkNCj4gwqANCj4g
wqAjZW5kaWYgLyogX1hFX0dUX01DUl9IXyAqLw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdG9w
b2xvZ3kuYw0KPiBpbmRleCBhOGQ3ZjI3MmMzMGEuLmM0OTQyZjJiMzc3NSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2d0X3RvcG9sb2d5LmMNCj4gQEAgLTExLDcgKzExLDYgQEANCj4gwqAjaW5j
bHVkZSAieGVfZ3QuaCINCj4gwqAjaW5jbHVkZSAieGVfbW1pby5oIg0KPiDCoA0KPiAtI2RlZmlu
ZSBYRV9NQVhfRFNTX0ZVU0VfQklUUyAoMzIgKiBYRV9NQVhfRFNTX0ZVU0VfUkVHUykNCj4gwqAj
ZGVmaW5lIFhFX01BWF9FVV9GVVNFX0JJVFMgKDMyICogWEVfTUFYX0VVX0ZVU0VfUkVHUykNCg0K
SG9uZXN0bHkgSSBkbyB0aGluayB0aGVzZSBzaG91bGQgYmUgaW4gdGhlIHNhbWUgZmlsZSBhdCBs
ZWFzdC4gQ2FuIHlvdQ0KbW92ZSB0aGUgRVUgRlVTRSBCSVRTIHRvIHhlX2d0X3R5cGVzLmggdG9v
Pw0KDQpUaGFua3MsDQpTdHVhcnQNCg0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90eXBlcy5oDQo+IGluZGV4IDcwYzYxNWRkMTQ5OC4uYjRkZjdkMzVkZWM3IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaA0KPiBAQCAtMjUsNiArMjUsNyBAQCBlbnVt
IHhlX2d0X3R5cGUgew0KPiDCoH07DQo+IMKgDQo+IMKgI2RlZmluZSBYRV9NQVhfRFNTX0ZVU0Vf
UkVHU8KgwqDCoDMNCj4gKyNkZWZpbmUgWEVfTUFYX0RTU19GVVNFX0JJVFPCoMKgwqAoMzIgKiBY
RV9NQVhfRFNTX0ZVU0VfUkVHUykNCj4gwqAjZGVmaW5lIFhFX01BWF9FVV9GVVNFX1JFR1PCoMKg
wqDCoDENCj4gwqANCj4gwqB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgeGVfZHNzX21hc2tfdFtCSVRT
X1RPX0xPTkdTKDMyICoNCj4gWEVfTUFYX0RTU19GVVNFX1JFR1MpXTsNCg0K
