Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CBBC4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 357DE10E0FE;
	Fri, 12 Jan 2024 10:22:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9620410E054
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jan 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705054957; x=1736590957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GkBkNZcSGA5w6NEMNkKW/nwLKw6pyy9aw0SXbtFzT78=;
 b=eNPgO9vPjWNaa3yQHIURoeCFt/ZhUhR60nMyyMFj8fKj2GXLlMVbRR71
 hyU4d2DQvEL8y6VNlDqaCyCVMATo6bvkY2PR4XBtc4mG5DxslNVGXZGUV
 /LBnFF1qJokNvI8VGDODJ44997+wbd5pHXRnyjXoUG8OIh9ZboZPxVCUT
 13SwBuHVxqYrDu35mp+hqqd7hFk0xiNLpGYtvHwqIKWwoSGsW2eH7ykCR
 eh1TTEYEviFp2SKU7KbnP4jmZgB0IqBhtZy1C6QnJuJXTUR+sTvjcLCJa
 K1/SzZKOi0kgMpIP06JrcrYpI84FHb5LSOKLMBraKdDByPO86r9hQt1Mu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="17743907"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="17743907"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 02:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; d="scan'208";a="17356715"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2024 02:22:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 02:22:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Jan 2024 02:22:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Jan 2024 02:22:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Jan 2024 02:22:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm/S46kg4b07Sq+PLS801EcuG/igi9y7Q3rVJiuQ9A8smi4xqxL0rwyUr2AIGuQENA0v33FCmZmVgVaLu0NWaNuONvFDDvLXz0AooLkL8yXcnpOm9LUHkXCdlzAfMeS147rFvfMnCOBxAsas9UW4EsCbJE4mMPaVJZ4mNLzkwLBDTl/S9rfVCjBH/9Ms780IufY7lDJcGDYLaqR6fVzn+GX4iHEeJB1pyOBW95HVa7Mlpy2TOJKeAfDMrJlqYO+735Q8zBJBUYJFyDTVIfdjKsQlSStiQreQiUBBfFnTZloSZUVVdsqXDbMLG18LlZAZOejduYerKuU2aNsU2LQ8gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkBkNZcSGA5w6NEMNkKW/nwLKw6pyy9aw0SXbtFzT78=;
 b=iGbx+B4dAGkcsLtYzkKOKxJ4Ulu+4YggoHjUnYLxNL1LGdgWMNzPTbRE4UZQVQTuXFPe4goDLF5Trib9E9hmKmtK00aXNissR3van3G77uTTEN34WFjLaMVkXuF1zy0RkW2+eydua7RD4ieouOQIBZzFBGg1K7tBHfu+iYHWfc8fjL8omDe/YF3I+3FZqivmszXMwlkWY8yYz7VDSf2bwRP+rUptJxWAys5ZLUDqquBFT9MJAy8F5Qgon3XTMKgOB7qsmqCe+eSYGCTYKW3V3u1egBXlzzQNJJcaPT55LFXzjlL3nssz61XRmYG8TZHSPFZOuh2TNgmePPj5ob/N5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 BY1PR11MB7984.namprd11.prod.outlook.com (2603:10b6:a03:531::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 10:22:33 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::dde1:91ce:98c6:d737%7]) with mapi id 15.20.7159.020; Fri, 12 Jan 2024
 10:22:33 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe: Modify the cfb size to be page size
 aligned for FBC
Thread-Topic: [PATCH v1 1/1] drm/xe: Modify the cfb size to be page size
 aligned for FBC
Thread-Index: AQHaRTnEvqGAR6eCE06Gcv8EPHQKZrDV+A0A
Date: Fri, 12 Jan 2024 10:22:33 +0000
Message-ID: <77dc8e26d480bd64703189102069f40723142592.camel@intel.com>
References: <20240112092803.61664-1-vinod.govindapillai@intel.com>
 <20240112092803.61664-2-vinod.govindapillai@intel.com>
In-Reply-To: <20240112092803.61664-2-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|BY1PR11MB7984:EE_
x-ms-office365-filtering-correlation-id: 9fe4fb73-0f22-4868-b681-08dc135863fa
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: So1saXk/bpXSsNYGbbhqVHiBGbPIIjkAt12O6uoTUfUNBK7qvqEdKdPWfja77MCYMlEwyIfZe4yh3fm2zVWZ2g/2DW5skr4+NHhEwqFmETaFfGfzYXm6ZrQpJknNBNnfitMuMauOr8hVmeFTcZgY4pjhtrEQQ/1JhnbYdtFgOGxYPGpkDGyFkarilPyKgIDQrX34fLYriZwuxG5tHP/x9HdUBSRd3tjd39Vs8DTrdSW2E3smCGE7YECtahNZeeRpUM6Yr6S09N8pNVd6tKPNPzOMBZLStDfoOZ9n3JMppWWzRJ5TFhh8nZNF336IDz9SY+9US0iBolIJkKMr2pwPVhJaV/chb3bIunvV7np0yBrQGZsnGIi54aX6ODQ5mgYvqzq359CsYww0G9W7okk2K0QDVZecXDKK2l+nglkviRrUnDxzzwrYaKVpHnoxAK1y+LrmngRyDS8fFIqxNPnTnrT8jL6K4hFRKY51EYziyoK7K6tKAAsi3dCpN7rGKKW6L/+WuROHvOpxkfQLkAVdXS71sHV8XqHUbBLrHIT5ddkkD+mV3aDX78wqVO41ZgTzYOKaqNLyR015nsK6F2gfakvsxqKxJnLKxVXeMunkYTs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(2906002)(26005)(64756008)(107886003)(2616005)(122000001)(38100700002)(82960400001)(4326008)(71200400001)(110136005)(83380400001)(8936002)(8676002)(41300700001)(6636002)(5660300002)(316002)(38070700009)(66946007)(6506007)(91956017)(6512007)(66476007)(86362001)(66556008)(478600001)(66446008)(76116006)(66574015)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RklDVUltclpyS2ZDSENTNzNBMlhTV0p1SUt4Nkx0Z29XdzhsVWtmalJyL043?=
 =?utf-8?B?RTc1eGcvTTdoeURkTjJUNmhFVWJ6Ly9kWDZoV1BsL0liN0trdktUbTlZcmIr?=
 =?utf-8?B?VGw1NDA1aVVhQkk1WkVkbG1OQytqOEZKQnpKbmNaazZUVHdyb1pIbDRha0g3?=
 =?utf-8?B?T0tNWG13elY3aHVZMk5jTG9FNnlQakFBanpRM1V4eWlSTmNadlp3U1N4SCtk?=
 =?utf-8?B?VjNveXZCMGpySXhoQWdDUUtkVDBJTHdDeCt5elRjQU5ZZm1kS2d1V1c3Y1NC?=
 =?utf-8?B?R1haOUdwZ0tpbnJlbzJJRkZkdExPUWxBNEpzZzVhTVJVNjBHUEE1bWU1N1BB?=
 =?utf-8?B?d0ovU05zOFpuMmtnTENSQmRGWVdVUXFBd0xoSStNUlQ3U0xWRmlxMUhGRmVU?=
 =?utf-8?B?TWdFZTJpVXY1eWxLMUpObFU4RkRWNVpQWTR2YzFJZzNBS1JsUXduUi95c1hL?=
 =?utf-8?B?WTU4ajJPZ3ZIcUN1enJoQ3kxbWUza1NjbmgvY3pVaGJKR0tjRmVGR0pIdTdC?=
 =?utf-8?B?cDdoZ2xCMnFEeWZTRFBNVjEwZDNUZTNoYkFMQ2tHWWliSTI5VHA2SXpvTjVm?=
 =?utf-8?B?bGlpSVRSV3RGOFU4WExyY3FoRjE1YWFyaFRZdkR3Qk8ydEJqNUR3T3FJaGNK?=
 =?utf-8?B?QTYvZFRzcEEyTUlJd2NxVU1kRmJqbFEyRjlNdUtpNGFSdnV0QUs2WlhRM0Fm?=
 =?utf-8?B?V0IvaU90Ui8rOFVsV3JKUCtBTEUyK3dXL0VqQkRZbjQ2bDV6WDBkeC9FYUNy?=
 =?utf-8?B?ZGEzOVQzTitYd3pFcFA5aExzVVZBMi93OEs3N2kvZ2w3cmpQMStLaEVYNnFZ?=
 =?utf-8?B?WHV5aDROQXhEK3R5ZVNZNmFsYURiRyt2UVRRS01Na25RMzM2eW5CVnZDMVNy?=
 =?utf-8?B?VUNwdzczeTREVGQ4cTk3WTNhQ0p4Y1prRDVFWGtMWHBEbTBQYVYvOVBydWxS?=
 =?utf-8?B?ZmRBNEpraG5KVit5c3ZReFBKbktMSnhNV21jcnE2VXNlOWJNeTZhZ0Ywa1ZC?=
 =?utf-8?B?c2ZoSDVPcmtMNG5FMWdzZlp0bjF2ZHBrTDhqSzdEdVp2ZmZhSGJSblVCeWhN?=
 =?utf-8?B?R1RDRUpoQ1NSaDdCYisweVQ1VUVZZjh6cDJFUUtNa2U5SmlFTnUwM2VxU2pS?=
 =?utf-8?B?R1QyMjBYOXZkOWVBSnd5Wk8xMmQzbUp3S2RLYzJKRkRTWUEwclBOT3ljeXZi?=
 =?utf-8?B?WE13Zi9EdGsraFJpcVIwYkRObHArNzVVVzRLTzhsaUs1TDR6OTZJSmZjUUo5?=
 =?utf-8?B?SFdLS1YrbGRwM3ovS3VBcDBMZmFxN1M3MVVrZHd6MjRMRjdua0l2aVJxZkpQ?=
 =?utf-8?B?b3VQV0cxYmtDV0ZQR2NqVEZ1TEtHc2NWaUZBMkk5L3lVMFh0dkdKYlIzdW14?=
 =?utf-8?B?aFJML1ZlbVdnU3M4Q3VrR1hkMC9tTDFnU1NRemROWGJNbnRFdG83SkllTjB6?=
 =?utf-8?B?K01wZEdiNUhSVTRld1VHYWR1MUZ5V29MdTJPeTE4Q2cydmx3RUtKc1hia3Z6?=
 =?utf-8?B?RkNJS2NESERmRStLV1VLTS81Q1RITDdVLzYrQVNNKzZ2SG1WbGhPakFwNUdN?=
 =?utf-8?B?Um43ZFNrcXFMbWRnc25tSWNxYkxFampqUEFkd1QwMGpVZFdDbTg2SVRvZ1NU?=
 =?utf-8?B?NlJobVdHVjhmZEx0ckZMOUI4clJMbHZwdGI4eGc0cnpVWEd4VElqQy9qR0Ji?=
 =?utf-8?B?VGlKTlE1WllOWUI0RzhPVUVqM1JZam4wUHorSTREdHV5NFI2QU15YmVPUWZL?=
 =?utf-8?B?RW1uVVZGejNUbGY3NjdOUTlQS3pDeWFBN215SE5JVFNYelNCdGFHdmRTZXFW?=
 =?utf-8?B?SXBoYTBqRkVLOUtReGNYdkNUUWZBYmUwbzVhbER2TzQvcjdZWHU0NXdqNzdk?=
 =?utf-8?B?OFBXTjZrR2Y2UlZveVZwQkwzcGlWd21QbW5iR0JibkVMcDN6RTh5K3NTdFVk?=
 =?utf-8?B?OG1tYmdyMjBrWWsvRDZsdVY5bzFtRUpLQ21qajgrSnRXZmJFdjVxdjlBL2Q5?=
 =?utf-8?B?ZEJPVFlrejZIM0tkZW5ONnZwVWgrZUtyeDU3TjJ4L0hpY3AzUnVvZndqc2lM?=
 =?utf-8?B?MUVxT3lWQ0NuK1BFd3ZVZVNEcXRDWFhnaWxRMzIweng4NGU4RVpSYTNuRHJQ?=
 =?utf-8?B?OVhRbGVsTXZ6TnVmN3JiZnNNVGVjQVNHYlpXTEJQN1p3RkxkT0JtcU9HcENG?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <64E9835A3060574AAEB6B40672B4A6B7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe4fb73-0f22-4868-b681-08dc135863fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2024 10:22:33.5142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5t52cV68iYRz/KDk2QMn7pZbRXsXHYuEoAiUCPAtcRM7dvZ3r8q50DXZetjHRyZ+lXFiZS6k0V1zhf2IPB94XDR/UayIT1A09dg7mRm+Y+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7984
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
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDI0LTAxLTEyIGF0IDExOjI4ICswMjAwLCBWaW5vZCBHb3ZpbmRhcGlsbGFpIHdy
b3RlOgo+IGRybV9nZW1fcHJpdmF0ZV9vYmplY3RfaW5pdCBleHBlY3QgdGhlIG9iamVjdCBzaXpl
IGJlIHBhZ2Ugc2l6ZQo+IGFsaWduZWQuIFRoZSB4ZV9ibyBjcmVhdGUgZnVuY3Rpb25zIGRvIG5v
dCB1cGRhdGUgdGhlIHNpemUgZm9yCj4gYW55IGFsaWdubWVudCByZXF1aXJlbWVudHMuIFNvIGFs
aWduIGNmYiBzaXplIHRvIGJlIHBhZ2Ugc2l6ZQo+IGFsaWduZWQgaW4geGUgc3RvbGVuIG1lbW9y
eSBoYW5kbGluZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaW5vZCBHb3ZpbmRhcGlsbGFpIDx2aW5v
ZC5nb3ZpbmRhcGlsbGFpQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBKb3VuaSBIw7ZnYW5kZXIg
PGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4KCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
Y29tcGF0LWk5MTUtaGVhZGVycy9pOTE1X2dlbV9zdG9sZW4uaCB8IDMgKysrCj4gwqAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZ2VtX3N0b2xlbi5oCj4gYi9kcml2ZXJzL2dw
dS9kcm0veGUvY29tcGF0LWk5MTUtaGVhZGVycy9pOTE1X2dlbV9zdG9sZW4uaAo+IGluZGV4IDg4
OGU3YTg3YTkyNS4uYmQyMzMwMDdjMWI3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS9jb21wYXQtaTkxNS1oZWFkZXJzL2k5MTVfZ2VtX3N0b2xlbi5oCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL2NvbXBhdC1pOTE1LWhlYWRlcnMvaTkxNV9nZW1fc3RvbGVuLmgKPiBAQCAtMTks
NiArMTksOSBAQCBzdGF0aWMgaW5saW5lIGludAo+IGk5MTVfZ2VtX3N0b2xlbl9pbnNlcnRfbm9k
ZV9pbl9yYW5nZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwKPiDCoMKgwqDCoMKgwqDCoMKgaW50IGVy
cjsKPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGZsYWdzID0gWEVfQk9fQ1JFQVRFX1BJTk5FRF9CSVQg
fAo+IFhFX0JPX0NSRUFURV9TVE9MRU5fQklUOwo+IMKgCj4gK8KgwqDCoMKgwqDCoMKgaWYgKGFs
aWduKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzaXplID0gQUxJR04oc2l6ZSwg
YWxpZ24pOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgYm8gPSB4ZV9ib19jcmVhdGVfbG9ja2VkX3Jh
bmdlKHhlLAo+IHhlX2RldmljZV9nZXRfcm9vdF90aWxlKHhlKSwKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIE5VTEwsIHNpemUsIHN0YXJ0LCBlbmQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fYm9f
dHlwZV9rZXJuZWwsIGZsYWdzKTsKCg==
