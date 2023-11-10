Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43575C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 11:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4E410E94C;
	Fri, 10 Nov 2023 11:33:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E684E10E94C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699616009; x=1731152009;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E9DYV+lijGVf6OZwAttGSo8ctOH+cDqzaEnQJTOmiP4=;
 b=KyRWnQVR2UGx6VM5KormkeJLdNiRJW/x4VkYemX0AvPTGiKkz+0nJS/M
 vMYnQanX2A8uRLCgOwddq+fFN2F/o+7MRydYz2J/k25shY7KHXGwyklBV
 3zdWNJVicB9+CZxGGYc23C3p2NCO0uk7maM1lpy4bks9CuKQzsnlr+/R7
 /SR7bcfWu8CTbliaboGCe/IIR0CzVcOSAuIElkoQFLqQxgzIrdWlpdsay
 AOfXz3zIHbGJ8lVClIkRRNlffV5FyyaWddsUgyUfl85fUTIu72C7b4rUE
 A8F0+WgbxpRAgTxdhz4EAFJodB7HqjSn9ZzvEglj+areP/jG1bTFWugPx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="456671241"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="456671241"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 03:33:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829632555"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="829632555"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Nov 2023 03:33:16 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 03:33:15 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 03:33:15 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 03:33:15 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 03:33:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQJjdnoZ7GUlxZPCjot3723kr78HTplAormjpjc4Xfu+X4tD2Aq4dY1Y3PSR5BHnyq+ZKAbNdia11+/iKCzndbEsojGYM27b1BwUhNluPZSwuiNQu4jUTepc93jc/J0AOZZDx2U+Dpv/DsAbmDTXMtK73CCGfv68SfuYjdZSygyQ+6L9z/marJoeXf+u2XNT6RBpoQgqDT3ubBFabbWILyh3vtRFFnRSITlR0pTEqLiGE9l+k3WPjhoXZvIZntP8lrQHaZi587mre7bMm8QZTsnoLMgnBVj1hESZmV73Q4kI/+61BoPIMJTaJ/lq3gad+0swOl87bnoSFRzoeLu+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9DYV+lijGVf6OZwAttGSo8ctOH+cDqzaEnQJTOmiP4=;
 b=Oz2vZ/EyOr1WmVxc3kF9L/wdr7IIZG1NVWdVTgHBaXDMbTAONYqKMWZwmOpHzVrbeRb/vDuYPnF05XZeDvtIyRaQ7VJuWmcpQ35pQVmkMpaIlt/CHUwrSUJbsEgx80LMev39re+ZWUXR3qprkVJ8OnZNhOu7kXN/j8K6qiO7A7HA2pT2dNhqoNqWQ+1Hq3wSpdmjepSZrwBVQ4jMeUJhLF/2YhIJgi9bsEy216E5z3MURR3+QVMUpT4aFWP8DhNxdX1KrGOWSqXpymOl/51o/cJXrYuvIrfDqPK1QZT1E8p0e+Jy1bHDZZt4SpKWno4n/TfJT88raA2ylogdtiP/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 11:33:13 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6954.029; Fri, 10 Nov 2023
 11:33:12 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [1/9] drm/i915: Use drm_atomic_helper_wait_for_fences helper.
Thread-Index: AQHaE8mwhFhkiARFJESI0L7yi7n1hw==
Date: Fri, 10 Nov 2023 11:33:12 +0000
Message-ID: <a1fedfb30b23584d9e0b8c2c9a84ea4517ab5df2.camel@intel.com>
References: <20231109150759.44549-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231109150759.44549-2-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CH3PR11MB8774:EE_
x-ms-office365-filtering-correlation-id: 5f16c506-21e9-4311-6765-08dbe1e0d2d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uH9qjdnTztX8nJgcdCnwaM5Ykje2qdV3HuUqIbm0IxKvFDu/hQku3p452DaERs2TaFcOYbPS+pjdPTcpxVe3tPj98G56EmcRiJf7nIDUPMcnAX261LwbYailexaIyUfrsigYaYprbjOwedJGclwAD1iDo8j3AqaKFeMT7us97RDXiXCmJpSktTTCCiTTPzWs1dDp8iF0HJxfEO7c0zdZ05qtkl5R1y7oLKJ5ZNIK8Gl9xYD9xPUtCpwQNPhu3ucTyM3Q83oXDgvP8AgdpgfQ6yiyEEdFeCqRZ9V+UG8zHp0Q9CdZ4fj6jVV5iFWVmouLKISColmWB9fztpLFfl5TW4gpzX7jIdJKRncedezYRkIXKXLWtLjucLHTrYgjAvvIdrlMZyBwG2m9+uIKLyoHgV60OzOjJiSsjfjgDlpT+Gg7He3iurxcXCBJ+DO2s3IUaFXj0TTmOQbXXwqeRN04dheoohZXBX3G83qi7HBqskO98lEQFR3d5CjhpX42/QyBCCQ1iPh6WIMcVOb1cQogPvDNOIgjaOYrtpcLjxbmr+sZT/r5Za+89vQniS55NXI6T7b6tx1yOyBkSkTuBpaCn5U56gKY45Gb9gOqDFoGVtYHuGKEIAXN4tKmnygZz8a6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(39860400002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(5660300002)(41300700001)(2616005)(26005)(86362001)(2906002)(122000001)(82960400001)(66574015)(6512007)(38070700009)(6506007)(4326008)(71200400001)(8676002)(83380400001)(8936002)(478600001)(36756003)(66946007)(6486002)(76116006)(110136005)(66446008)(91956017)(64756008)(316002)(66476007)(66556008)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZWN2N3lPZ2M2UWJ0cDIyb05JRGR2azB5UDZ6VXBJdXNFVERvckVnS3Nibkli?=
 =?utf-8?B?WmtSSCtXb2cxQldnV05oQ2lUa0ZLejhMdS9DRCt0YnFaa0xEdStXSWE3ZFhE?=
 =?utf-8?B?aXdURnc1VnZtMEVMVVdHcUp2RWNDWnJIc05UMGlBQ3RsQmFoU1d3akVPMWI3?=
 =?utf-8?B?ZVduUURrT0J4cmVVVFlkT29xbUhhb0l5aStrREIzYzgwdkJxcHAzcGhsOW11?=
 =?utf-8?B?WGhRRjZKbFYrdytUdjIza29MMWpKWmVYTlpRSk40NVZvMDF0M2dCbFdEeDcw?=
 =?utf-8?B?b3pNTTVBSWc5Wm11bStKdjJuTzdiMUh2dXVUS3RyR2RXa3lNVEU3QXJ4cjN4?=
 =?utf-8?B?d1dCZVRpOFVDZmRQQ3kzRXI5TXk4QjZTWkViZkhVUDhoSS90a0xUUUpiUjl3?=
 =?utf-8?B?U0FvMkVNM1ErUmVYaDNTVzBXQTM4SHlpbnd2ZGx1eVNHdVhhYytobmNvNU1J?=
 =?utf-8?B?VzNnY3NFaHZ5U1JJT05iUGsrMndsaGpJdkw1VGdPeUdNdEdPd3Q5b1l0cUdY?=
 =?utf-8?B?cnl6VEpxRUpUMXBYdlBnU3h2VGhoRE1pYlFLQWtWUGsrTWQ5Z2lHRHdKMWI4?=
 =?utf-8?B?Wlo3cVoxc1kxcmJZVS8wNHBabFpGV21GMWhtcmhVYnZWVlJjTm5HUElaSHZQ?=
 =?utf-8?B?aEQraStlYmNYSWV5VW5kOGl5dTFKaDJPV2kxZGU2d0VkTVUzNFpVa0I0WmxQ?=
 =?utf-8?B?Ri90Um1SRVNjNkkrbzZ4c1JiWkdSREY1VGdvUFpBS3RCSEFWZmtWR0M2Sjg3?=
 =?utf-8?B?d0pxZndmMFVKV04vTHptNmRER2dCaU1SR08zSm5oWHo0TDhmL3d5blVBN1pm?=
 =?utf-8?B?WitlUzVGMUNvNXdWVWpiOEpyaCtPYjl3cWJjeUNvTm05bDdjZ3U0NGNrNkNQ?=
 =?utf-8?B?WHdiaGFNRk1WaWllb1ZGcHhweTI5RjlGTVRhMEFUOW5pYVZEaGhEMGZkUzVQ?=
 =?utf-8?B?Y1A5eXNMU0hvY3N4NmdydlFRemxUdCtGOEFNT04vM3BDL2dyWnA2ajhCQXJz?=
 =?utf-8?B?YnFOODF5UTNDd2ZxbzgrbjRiSUZ0ZG1GQTVIUTk3UzYzYTJKR0txU284U3Q4?=
 =?utf-8?B?OUMrczlJaGV6Q0lrUHNHZmxtOU1yQjdMTFFVRlFtNkNWeHE2ZVZnU2U1RGFw?=
 =?utf-8?B?OWhFRk4zYlRIMWxsSWM0bTBBS25mOHZEVVM3QzBZZGt0c1VIM3g4WVM4b0kr?=
 =?utf-8?B?bFR5YnBvV09ZQ0dIbldUVUpicjRoQzZXdVZKL3ZOd290eUE0NTRmbUdEYXYz?=
 =?utf-8?B?M29zUVQxdndpNXZHTEtjbElXT1dWQWVvUTJFTm5HRkpIK1dXZ3pmYWR2WjJy?=
 =?utf-8?B?OVc3all3Rmp2TWlQK1NNbzBnY3VTQmh0UnFaWjBRYkNMWGFDNG1YM0hmdjFx?=
 =?utf-8?B?Y0M5VGtPOUlHekUvK1pXekRNY05SUEdnZnJhMDlsdXpaZllSNjcyVmxQTTlx?=
 =?utf-8?B?Q0trbTU3aGlkV2xSR1Y0UU55dzhmeVZjVC9tTFpVVXZJU01aY0toS1NJQkFu?=
 =?utf-8?B?Sit0akp0Y3FhYS9sTk11cHc1b0N5M2I1dkNZbmEyU0NxdHMwK2I4TGpMc3pQ?=
 =?utf-8?B?aThkMUFqdDl0ZllLQ2VWYXBFdmJ4UEFPWE85KytRZTF0SkZOK3ZLUi9IWGF4?=
 =?utf-8?B?enhpbmUvUE5DU3ZRUGIrT0ROVnNPRGxwRzI3amJIZFhPMUszNy9ZTGppcFcw?=
 =?utf-8?B?OW9DSkxsTXlNTnpoMzdFM3VHeFBvQXJqWEVicTJPTlJrRkcvVzdjeGs2QXZk?=
 =?utf-8?B?WGliRk53eDI5Nlp0bHhUKy9SbG94dGNubUZmNkQ5d2Z1dXdNcDIzc3RSLzdG?=
 =?utf-8?B?VXpydmh0WXJUN0FtNUFwQ2sxak1pLzkrWG95ZXh6THFQOTMxd3BlSU85Qjhl?=
 =?utf-8?B?cXEyVmt0ZDhSY3R0S09sd0lHUXFnN0xGaHZvRFFvT0UwZ3hPZ3NTRWdMK0Vu?=
 =?utf-8?B?ODJGNng4TGFQOUt6ZXhnZUgveDZRNjFuVFJwTWFQcis1QkR0SlM3RmlxMkRu?=
 =?utf-8?B?dTNlNzZBa2IrNW4wU1ZzZlA1aG5YcTg1ZHhQSmtqMTBMUFA3V095c0FKZmJU?=
 =?utf-8?B?Sk5LMTltNUwzaXJUR25mNjJIQnUwVllaVTliZnJuS1J3Q3VONWs4dFN1WE52?=
 =?utf-8?B?U2hCa0tQbWdxV1dZeXdmNGNCdjZKWmRLMFc1QTRsc0VJandlZURnaERFaTdC?=
 =?utf-8?B?OEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB4796164CA1254392EFD46F3662034E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f16c506-21e9-4311-6765-08dbe1e0d2d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 11:33:12.9103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BdUew7xpPyXaCRbR0YKSDnsCQTLD+DAyS6js0aqQRdqxS+VWL9TH4WbxzdM7jwDtLh0NNbdVF8B3AFp1dIJ15e4JDUmwLn2S1oRoZpy5Qfs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [1/9] drm/i915: Use
 drm_atomic_helper_wait_for_fences helper.
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
Cc: "dev@lankhorst.se" <dev@lankhorst.se>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTExLTA5IGF0IDE2OjA3ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToKPiBGcm9tOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4KPiAKPiBUaGUg
ZmVuY2UgYXBpIHNwZWNpZmllcyB5b3Ugc2hvdWxkIHdhaXQgZm9yIGZlbmNlIHRvIGNvbXBsZXRp
b24sIG5vdAo+IGdpdmUgdXAgYWZ0ZXIgd2hhdGV2ZXIgdGltZW91dCB3YXMgb3JpZ2luYWxseSBj
b25maWd1cmVkLiBUaGUgZmVuY2VzCj4gdGhlbXNlbHZlcyBzaG91bGQgcHJldmVudCB0aGUgdGlt
ZW91dCBmcm9tIGJlaW5nIGluZGVmaW5pdGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBM
YW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+CgpUaGlzIGlzIG5vdCBibG9ja2luZyBhbnl0aGlu
ZyBpbiBkcm0teGUtbmV4dCBhbmQgbm90IHJlYWxseSByZWxhdGVkIHRvCnRoaXMgcGF0Y2ggc2V0
IGVpdGhlci4gSSB0aGluayB3ZSBjYW4ganVzdCBmaW5lIGdvIHRocm91Z2ggdGhlIHJldmlldwph
bmQgY2kgdGVzdGluZyBpbiBpbnRlbC1nZnggbWFpbGluZyBsaXN0IGFuZCBiYWNrcG9ydCBmcm9t
IHRoZXJlL29yIGdldAppdCB2aWEgcmViYXNlLgoKQlIsCgpKb3VuaSBIw7ZnYW5kZXIKCj4gLS0t
Cj4gwqAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYXRvbWljX3BsYW5lLmMgfMKgIDEg
LQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmPCoCB8IDIz
ICstLS0tLS0tLS0tLS0tLS0tCj4gLS0KPiDCoDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2F0b21pY19wbGFuZS5jCj4gaW5kZXggNzdlMjgxYmY0Y2I1Zi4uMTRlZWI0
MmM5ZTJhMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2F0b21pY19wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9hdG9taWNfcGxhbmUuYwo+IEBAIC0zOCw3ICszOCw2IEBACj4gwqAjaW5jbHVkZSA8ZHJtL2Ry
bV9ibGVuZC5oPgo+IMKgI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+Cj4gwqAKPiAtI2luY2x1
ZGUgImk5MTVfY29uZmlnLmgiCj4gwqAjaW5jbHVkZSAiaTkxNV9yZWcuaCIKPiDCoCNpbmNsdWRl
ICJpbnRlbF9hdG9taWNfcGxhbmUuaCIKPiDCoCNpbmNsdWRlICJpbnRlbF9jZGNsay5oIgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwo+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPiBpbmRleCBi
MjdiNTMzZjAzZDZlLi44MmZmNTMwOWEwNjI5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPiBAQCAtNTAsNyArNTAsNiBAQAo+IMKgI2luY2x1
ZGUgImc0eF9kcC5oIgo+IMKgI2luY2x1ZGUgImc0eF9oZG1pLmgiCj4gwqAjaW5jbHVkZSAiaHN3
X2lwcy5oIgo+IC0jaW5jbHVkZSAiaTkxNV9jb25maWcuaCIKPiDCoCNpbmNsdWRlICJpOTE1X2Ry
di5oIgo+IMKgI2luY2x1ZGUgImk5MTVfcmVnLmgiCj4gwqAjaW5jbHVkZSAiaTkxNV91dGlscy5o
Igo+IEBAIC03MDU1LDI2ICs3MDU0LDYgQEAgdm9pZAo+IGludGVsX2F0b21pY19oZWxwZXJfZnJl
ZV9zdGF0ZV93b3JrZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+IMKgwqDCoMKgwqDCoMKg
wqBpbnRlbF9hdG9taWNfaGVscGVyX2ZyZWVfc3RhdGUoZGV2X3ByaXYpOwo+IMKgfQo+IMKgCj4g
LXN0YXRpYyB2b2lkIGludGVsX2F0b21pY19jb21taXRfZmVuY2Vfd2FpdChzdHJ1Y3QgaW50ZWxf
YXRvbWljX3N0YXRlCj4gKmludGVsX3N0YXRlKQo+IC17Cj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KGludGVsX3N0YXRlLQo+ID5iYXNlLmRl
dik7Cj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7Cj4gLcKgwqDCoMKg
wqDCoMKgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqbmV3X3BsYW5lX3N0YXRlOwo+IC3CoMKgwqDC
oMKgwqDCoGludCByZXQsIGk7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGZvcl9lYWNoX25ld19wbGFu
ZV9pbl9zdGF0ZSgmaW50ZWxfc3RhdGUtPmJhc2UsIHBsYW5lLAo+IG5ld19wbGFuZV9zdGF0ZSwg
aSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAobmV3X3BsYW5lX3N0YXRl
LT5mZW5jZSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0ID0gZG1hX2ZlbmNlX3dhaXRfdGltZW91dChuZXdfcGxhbmVfc3RhdGUtCj4gPmZlbmNl
LCBmYWxzZSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Cj4gaTkxNV9mZW5jZV90aW1lb3V0KGk5MTUpKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgPD0gMCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiAtCj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkbWFfZmVuY2Vf
cHV0KG5ld19wbGFuZV9zdGF0ZS0+ZmVuY2UpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgbmV3X3BsYW5lX3N0YXRlLT5mZW5jZSA9IE5VTEw7Cj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiAtwqDCoMKgwqDCoMKgwqB9Cj4gLX0KPiAt
Cj4gwqBzdGF0aWMgdm9pZCBpbnRlbF9hdG9taWNfY2xlYW51cF93b3JrKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykKPiDCoHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2F0b21pY19z
dGF0ZSAqc3RhdGUgPQo+IEBAIC03MTgwLDcgKzcxNTksNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9h
dG9taWNfY29tbWl0X3RhaWwoc3RydWN0Cj4gaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSkKPiDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfd2FrZXJlZl90IHdha2VyZWYgPSAwOwo+IMKgwqDCoMKgwqDC
oMKgwqBpbnQgaTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoGludGVsX2F0b21pY19jb21taXRfZmVu
Y2Vfd2FpdChzdGF0ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9m
b3JfZmVuY2VzKGRldiwgJnN0YXRlLT5iYXNlLCBmYWxzZSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDC
oMKgZHJtX2F0b21pY19oZWxwZXJfd2FpdF9mb3JfZGVwZW5kZW5jaWVzKCZzdGF0ZS0+YmFzZSk7
Cj4gwqDCoMKgwqDCoMKgwqDCoGRybV9kcF9tc3RfYXRvbWljX3dhaXRfZm9yX2RlcGVuZGVuY2ll
cygmc3RhdGUtPmJhc2UpOwoK
