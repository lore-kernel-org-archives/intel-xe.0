Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00554C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 20:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A722410E6E5;
	Thu, 16 Nov 2023 20:44:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503410E6E5
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 20:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700167472; x=1731703472;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wfBvQlO7ZvSInMi7MIJ+glKXEy2ulUpxtx/M6yHf6DE=;
 b=je1s6TMp/wHF/Pa2GVnwrUI8mDlUlzVr+FGfAYcd33tdrrHWNWKGc04P
 8rtSHohnHe0jExgNft4DM5dRZYNm8nrzl6FoO0INF9P8yZH3IxvGiIVMz
 kFQ/AgFZyfiT4ba2W6AFQuF6kWOFQVaZib6QR15o2Orxv7BNqj6ut9WIw
 AdambcWkrTz/MLpC/Y+Qi1jlGkWiGzLUkpS/SNEiihxOyk6ah5fgtra3B
 xRvarBZqV8FNAasrXsU0kmxKPWMO/9p6kURq8Dn9Qej+b65gAWjNAqgKy
 3KxCUBfTZvST/+OySl+kWdlFhuQfYnyaY6DOcqZL/qOg7GyIBx8saDJ4h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477399733"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="477399733"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 12:44:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1096900384"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="1096900384"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 12:44:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:44:32 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 12:44:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 12:44:31 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 12:44:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KofedTe7oR/bpZ7wuPJvJlrJcR7Sl29PFEbRecgrq/ENEBsDXSt5Jgx/AsBokt/zwWQUplFu+87L8kQ2bEjmz562c8gz2GRxxXuAoE+jCfvLlXof50OUribRWMsOtGHyCgepG/Nw4XnxKMMNBreEKQCuBCgmRi4kLheGd2HlAoWj9vegl1lXgUmzf2Zbj5qI+REAdcfHjxP1YrZlzdEnoNvKN7z1gPLbBAsD6DraPxtpHZNE+A4muD4+Z9b+mGWXE8LOFAKWz/aZYYs18XNYi6nYGuydYEkBYQodwlTjv/j1gcKvKiB3uv5Mp7t48lYDpeoV7o0t9OXHcJ8I8ILlpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfBvQlO7ZvSInMi7MIJ+glKXEy2ulUpxtx/M6yHf6DE=;
 b=kRGFEUJ/vJA4O5gQxjlLBv3dcCp1ZB5iMAN1fVuRT/wzpBKxrcezcBQGT6zJ6khK381LyT+AYHTpbVI22yT0K58LtyGYkWYXOHth+dwpqABiai9FHhUUipHHZtXLJPHEChn1fOLwOzB2TmUXi2bi1Jo+8M3R2dd8E1SEM5RBtmCsjAEAigOakY3Ae9vMmtpCypXEnw2cRjsaICBpQPkKBu8kHn0Upv7OSNaowOwO/CxFjq0o9fHsBoUJsIx+i9vUfuyCqx3BZMaO4RhCDgeMjykl+6ejxjjgcSHwgDcfKaDtWjTjDD3chtyjYiCZZ/n96sKKqW2Cf37jR9HCZOFvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 20:44:29 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8076:c5fe:e0fc:cfaf%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 20:44:29 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Thread-Topic: [PATCH v1 8/8] drm/xe/uapi: Add Tile ID information to the GT
 info query
Thread-Index: AQHaGJtVUlpE4vaXb0m8R/Ou4Bm+LbB9aikA
Date: Thu, 16 Nov 2023 20:44:29 +0000
Message-ID: <e15046e7999170bb0012b519ef994487d1823f5d.camel@intel.com>
References: <20231116144316.7-1-francois.dugast@intel.com>
 <20231116144316.7-9-francois.dugast@intel.com>
In-Reply-To: <20231116144316.7-9-francois.dugast@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM4PR11MB7303:EE_
x-ms-office365-filtering-correlation-id: 44d2ea3f-e92a-4b83-54b8-08dbe6e4d457
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NPLAzl2RsuVK690QxZ6B08oBGHTliP7qcFIgos2kpif6kTB2chqWRVNhDtu/jJ3+aaxLNF+oSIogFaWy6nt5PgKqR9P76ubJ5WOIrL7tUYk+tslceiAtHW6CYpYjzG+W/nybfV0iLvQo3VmlKrUeNPnQEDHOMzAEWnGqzaecDdfMk+wmhtb9OsA4xEEjsbGi1IjmMRv0CxKe5C/flpbl2DnONTgdrVCAtGGi+rix4jEx8oV52qUMYCFlVWC4DdodzyCXB3mimcmhJwIe4NOUzjNqXmMCdzC284Xg1cg3JPTp1CJAHOHsuHpf9cQVL2dIAuQ/f+iQmOh+Qhwfen63wSgyVexRmSIaGNmO7icdCORJwLqKJdmnCyo1lp+e1Y+cX30Yovcf4OWtkrkXA9nJ7L9hppxK5PVoUbDLwrhigDJHyJnZIgE18IN20rRY99y/txMo0EarZ42JLkUmdjHItpdUg9A5aSOcro30g6irrA0Pb/TMq/F4RqXDhE4IXJpJZeVzd35C4YoUzK5Eef6pqxbUI1UbnAkxxg0Z2jD0LJbsCumtRYx+C5lheW/z0NEmUg35T5ku5KFstpXCZzPhLPntdoLSkS0fYeAtp+yGPgdVfh0oxKlDPCCjGgUMjbbb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(6506007)(316002)(4326008)(6636002)(107886003)(2616005)(91956017)(5660300002)(38100700002)(478600001)(66446008)(110136005)(71200400001)(86362001)(2906002)(6486002)(6512007)(66476007)(26005)(64756008)(66946007)(76116006)(8676002)(66556008)(83380400001)(4001150100001)(122000001)(82960400001)(8936002)(41300700001)(36756003)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGRqNlNVcUcwTXdXcTc2bTh2dGRwWjRSQnRob0FDbjdnYVVTcXMrb3Jqbnpx?=
 =?utf-8?B?ZUhDK1dSdTJieElvdGZFVkFQUjBTelk2L24yWWNjWCtEYmpFeksvd1lwdEdW?=
 =?utf-8?B?cWs2YlJQZkI1eHgzSEFxcE5zTzFBeTFLMTBPMXRBZkQyUERiSW5mUVlvKzdv?=
 =?utf-8?B?eFJkcW1WWHEvK2J0UGRmYkZ6SjJPZWZ6RzQ4QmpMM0luTkRMakZWUkdLOHUw?=
 =?utf-8?B?d3hnYTJvenlGZDZiVDhIMkI2dUZFMXhHWWIyN05sNU1mSk9waDkwR2pITno0?=
 =?utf-8?B?WTRHSmlrdkdQT1MvS09heWFrVWJGZkxiVTMzWnlmQUZNc0UvVjVEYUZKV1Ri?=
 =?utf-8?B?cUUvUEk1RHNudThEbHkxZGJ3Y2hjbFh0K0Nhb3g0R0Z2OHNDRGJxMVQwZE9D?=
 =?utf-8?B?OU8xbFVKdm9pcGtiMVlnVStRbFNnTFhZcEp5ZE9ZZFFJWFBjSUtIbTFpa3hJ?=
 =?utf-8?B?dGpKM211MG1IQUFtc3BSdVhnNGRyMHFMcEl0Nzl3cTY2RVhNTU0rbU5seTFL?=
 =?utf-8?B?b1QrK1BVRFJkYkU5OVRHVjIvdmgyQ2NNZ1F5eXpKcDFsc2ExN2FHaXUwWTJF?=
 =?utf-8?B?eW5remNCeTg2Mkd2U1hCUHlyVTAxMXVzK0R1dEJYNGZXTmdzWnpCcWNmRE8y?=
 =?utf-8?B?endnYnRCQzJhNlBjMi9PbWdTZWFMdkxuL1psS0NTTW5aWVF2eUczWnBmUmdF?=
 =?utf-8?B?aUJ3VTlWbUI1RjErTmRSMk9nd1N6cFY2Tm9IV0tLQU05NHZZUHhQN2g3Umk3?=
 =?utf-8?B?cjNLcCtpZGczVEFNTDkwc2JzbUwzMWltQUlhQXZCSjZ6bTB4azNCWEN6L201?=
 =?utf-8?B?aHVCazFuTHNzdUNPYytqMzF0eGdUUzZaTmtSS1Y4R3pLRk5DSDJidkRFSHVo?=
 =?utf-8?B?VzZaMEsrNzhyN0hoN0MvcUFTQVN3RnVnRlZlcEYweEIrbm5UbVhTMjlySE5W?=
 =?utf-8?B?emUyOHM0clNKcTJlNnpxdWtkU3E3clc0WWRNUldxZEFyb0JhV1JXcU9jcldF?=
 =?utf-8?B?ZGt3dVcwc3NnbGtKMDNzOTE0eWUrWXZ5enJSUXdVaFNtVXdGbWhiY1c2N2VD?=
 =?utf-8?B?YmtIK0RNNzFyOFVpdnpkaDN1SThmMnBEZGl5WHBjYis4WUhuWVA5K082YzdB?=
 =?utf-8?B?N21qY1BUN1hnQlFDdWh6bS9waE5NK0pOS2Z6bGZmZXBrUVM4SDF2RnVhUUNt?=
 =?utf-8?B?WFhwMVdaQlhxbE9rYTM3bUFDdXlJbmRieUg3MU9zR3UyR3kvOW9kNGZ0ZFRB?=
 =?utf-8?B?RVowQ0ZoeFpzWlRHTnFJdDhYVmw1aEd0R3BKZUJuRGE0V1E2SzIwL0lmZkkz?=
 =?utf-8?B?Y0RyV21EL0E1aVFLVzJxYzV6RG8zbWp3UTlaNHRKZ3FvQklpcm1xd2xlUHB0?=
 =?utf-8?B?SlJZUkZJdGRrc3hHNnYrT3hZRENsejhhQ3JtZ0VzSFFjeW8yT2FocGJYVEFT?=
 =?utf-8?B?c21SdEFZdEowZm0vNkNRV1VFdUZ1eGZGNlJpZU1kZ2Qwcm5tQVdUMENXdGNz?=
 =?utf-8?B?NmgvUXBSVnNOd1hSUitsYlpnUHdLNUZSWTdjbzUwWWIwVGNyVkRrTUNsajhK?=
 =?utf-8?B?eXhGM2VkYmdmSUlkNjhyOEdGb2NTcU1qbjAwK2lSL1JERnM1bWZ3VURqdW5G?=
 =?utf-8?B?a3d2K1czdFNyOXhjaDQweXNLUU9mcXV1QSs4K2ZXalhFL3hlT2taUlVVY29Y?=
 =?utf-8?B?R0VQNkdBTXJaK09aenRubTVJYWtBKzJJYWxUMkV5a3dVUGE5UXFqb2dwaXFp?=
 =?utf-8?B?OXhTeFpVU0tOY3JmNEg4VW5ZOVNlK05hWnd3VWlRVlMvNXlKbE5RV0hzZkRY?=
 =?utf-8?B?bnJDMGxQK0tmWGU1RXNSWVBzNzVGNVZ6TWZQdWRYZ1hyeTArQk5kU0w2QUxo?=
 =?utf-8?B?clN0YjFKVUJ3bW4zK2t6YzlXMGNaamo4dTRCWXZFdTVyekwzdnNFbUIvckRU?=
 =?utf-8?B?UFVIVWZOa1lEZEowY3FGemNIS1Mvc2ZFb2tBby9mMFJSNDlPNWdTV2VLakly?=
 =?utf-8?B?ODJHMFQ4RDFUdFY0dzFUVHpZZU9ZKytZV1czMTBZYTl5RGhIT0RWNHpPZ1Qr?=
 =?utf-8?B?dW9xS0FWZDMyTGRXVTF4S1I4YWhzTkp2RDBsM2ZSV29NR1BEaXk5VDVyNWxy?=
 =?utf-8?B?N0xzMUNFUU5PK2sweEkvSHdWT09scEVubTRDRXZqcXdDbTQ0Q2JCbFNoSUVw?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26382676D1240C4583844615E004C8CB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d2ea3f-e92a-4b83-54b8-08dbe6e4d457
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 20:44:29.2110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ry5oYEqgxaeXWkTHuSg0AzhpRYf3sRDw0TIrVn8U1aS0rShlNGCXMkh0Ed7/ASY2APXyW4S3Cg6AYDxD4kDziA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v1 8/8] drm/xe/uapi: Add Tile ID information
 to the GT info query
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

T24gVGh1LCAyMDIzLTExLTE2IGF0IDE0OjQzICswMDAwLCBGcmFuY29pcyBEdWdhc3Qgd3JvdGU6
DQo+IEZyb206IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gDQo+IEFz
IGFuIGluZm9ybWF0aW9uIG9ubHkuIFNvIFVzZXJzcGFjZSBjYW4gdXNlIHRoaXMgaW5mb3JtYXRp
b24NCj4gYW5kIGJlIGFibGUgdG8gY29ycmVsYXRlIGRpZmZlcmVudCBHVHMuDQo+IA0KPiBNYWtl
IEFQSSBzeW1tZXRyaWMgYmV0d2VlbiBFbmdpbmUgYW5kIEdUIGluZm8uDQo+IA0KPiBUaGVyZSdz
IG5vIG5lZWQgcmlnaHQgbm93IHRvIGluY2x1ZGUgYSB0aWxlX3F1ZXJ5IGVudHJ5DQo+IHNpbmNl
IHRoZXJlJ3Mgbm8gb3RoZXIgaW5mb3JtYXRpb24gdGhhdCB3ZSBuZWVkIGZyb20gdGlsZQ0KPiB0
aGF0IGlzIG5vdCBhbHJlYWR5IGV4cG9zZWQgdGhyb3VnaCBkaWZmZXJlbnQgcXVlcmllcy4NCj4g
DQo+IEhvd2V2ZXIsIHRoaXMgY291bGQgYmUgYWRkZWQgbGF0ZXIgaWYgd2UgaGF2ZSBkaWZmZXJl
bnQgVGlsZQ0KPiBpbmZvcm1hdGlvbiB0aGF0IGNvdWxkIG1hdHRlciB0byB1c2Vyc3BhY2UuIEJ1
dCBsZXQncyBrZWVwDQo+IHRoZSBBUEkgcmVhZHkgZm9yIGEgZGlyZWN0IHJlZmVyZW5jZSB0byBU
aWxlIElEIGJhc2VkIG9uDQo+IHRoZSBHVCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJv
ZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9xdWVyeS5jIHwgMSArDQo+ICBpbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oICAgICB8IDIgKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfcXVlcnkuYw0KPiBpbmRleCA4NzM0NWVkOTkxNTEuLjgzOGYwMzc5NTg0MSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3F1ZXJ5LmMNCj4gQEAgLTM4Miw2ICszODIsNyBAQCBzdGF0aWMg
aW50IHF1ZXJ5X2d0X2xpc3Qoc3RydWN0IHhlX2RldmljZSAqeGUsIHN0cnVjdCBkcm1feGVfZGV2
aWNlX3F1ZXJ5ICpxdWVyeQ0KPiAgCQkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0udHlwZSA9IERSTV9Y
RV9RVUVSWV9HVF9UWVBFX01FRElBOw0KPiAgCQllbHNlDQo+ICAJCQlndF9saXN0LT5ndF9saXN0
W2lkXS50eXBlID0gRFJNX1hFX1FVRVJZX0dUX1RZUEVfTUFJTjsNCj4gKwkJZ3RfbGlzdC0+Z3Rf
bGlzdFtpZF0udGlsZV9pZCA9IGd0X3RvX3RpbGUoZ3QpLT5pZDsNCj4gIAkJZ3RfbGlzdC0+Z3Rf
bGlzdFtpZF0uZ3RfaWQgPSBndC0+aW5mby5pZDsNCj4gIAkJZ3RfbGlzdC0+Z3RfbGlzdFtpZF0u
Y2xvY2tfZnJlcSA9IGd0LT5pbmZvLmNsb2NrX2ZyZXE7DQo+ICAJCWlmICghSVNfREdGWCh4ZSkp
DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBp
L2RybS94ZV9kcm0uaA0KPiBpbmRleCBiNmQzZDRkNTJkYTkuLjg2MTBhYzQ2MTYxOSAxMDA2NDQN
Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiArKysgYi9pbmNsdWRlL3VhcGkv
ZHJtL3hlX2RybS5oDQo+IEBAIC0zODAsNiArMzgwLDggQEAgc3RydWN0IGRybV94ZV9ndCB7DQo+
ICAjZGVmaW5lIERSTV9YRV9RVUVSWV9HVF9UWVBFX01FRElBCQkxDQo+ICAJLyoqIEB0eXBlOiBH
VCB0eXBlOiBNYWluIG9yIE1lZGlhICovDQo+ICAJX191MTYgdHlwZTsNCj4gKwkvKiogQHRpbGVf
aWQ6IFRpbGUgSUQgd2hlcmUgdGhpcyBHVCBsaXZlcyAoSW5mb3JtYXRpb24gb25seSkgKi8NCj4g
KwlfX3UxNiB0aWxlX2lkOw0KDQphY2sgb24gYWRkaW5nIGl0IGJ1dCBqdXN0IGFkZGluZyBpdCBi
cmVha3MgdGhlIHN0cnVjdCBhbGlnbm1lbnQgZm9yIDMyLzY0Yml0cyB1c2VyLXNwYWNlLg0KDQo+
ICAJLyoqIEBndF9pZDogVW5pcXVlIElEIG9mIHRoaXMgR1Qgd2l0aGluIHRoZSBQQ0kgRGV2aWNl
ICovDQo+ICAJX191MTYgZ3RfaWQ7DQo+ICAJLyoqIEBjbG9ja19mcmVxOiBBIGNsb2NrIGZyZXF1
ZW5jeSBmb3IgdGltZXN0YW1wICovDQoNCg==
