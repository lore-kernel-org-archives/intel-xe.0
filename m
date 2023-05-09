Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F27C77B75
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 05:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3831A10E327;
	Tue,  9 May 2023 05:51:58 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE6110E327
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 05:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683611516; x=1715147516;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RxCfVfD7p7/kFy+7rkr6p6oM34R8mI46pdjZYjrnNc0=;
 b=bxr/pNZfeAIMJO2rE4NV3YDEfoN86EqzuS3stDyJsapN6nkSrw0z3sHx
 +jRUq7nxqEl0965HLME6axWyE7rb9FLoCgZLhezaGALkMUXNck3ttIkTb
 eEZz/XNeTqOkI06I/DgXoqQYtyLG+udg9NH/zWVwiWPCGVKPIf/aI/bEw
 IA4vEJXGIzgiblAFZZ0iUOkYfxtO2cm00a6iemiRJxXPWp7np59DXIRcA
 cvOzLgl0f3kWuLHeNLR3c2CyvG8KTWBu4C48nZhC02B5u5vrh3IsHxH/J
 RzeZoNGsHKVHdZr9JEj29t9sYUcmkijobObg5+YOrusg5kVJ37LptkytE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348643993"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="348643993"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 22:51:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649157147"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="649157147"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 22:51:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:51:55 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 22:51:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 22:51:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 22:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke4q2frhIdl5QAOQA9Kwa75ToG/I1J9KjdEqVksndLnwGS30rKEXm3vNQRRYqZF8K94CEK5G9T+YZraL/w/QNKGltNGkgmcB2NdJkWXnUTIMTl0z0iIjuRytIhuY3WbQgHI0zdcABQ6LQPRQlu4/cqVA7PRyR9okd5mlPpLUAwMQvA5EYQmOsSONj/LCGcqRFyu5HR3x6Cc5apq8Wl3Dt00xgkdbLQnZPYZpC4P40bBMYOC1SV54I3TgWmxwyXia6f/6DH19jtUqBfxcaVusqcVjSaVBltC8rb0tL0MMTAzX2qdVv9aBKF2S47tN4NN4j0FA22TTqgpPt71oEntE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxCfVfD7p7/kFy+7rkr6p6oM34R8mI46pdjZYjrnNc0=;
 b=TVPP3Z9OswYw/tjeTKKNsZwkn9F/Xt9I1PF/49xSgOcO7uUIvz7sPB9FLRodYHJZm0nKx2uZxpv1tl2/2JWriIWxYEy4tMmTlSi4Tqo3GDfswF7DSKyT7/JGho++26XfH9/wohlRHpVYUO4EUda0WRPbaxt+6W+L9tSR3uxHNWca6VBdRIh6dV5Vqfmfa24jQk3qMofutxADfGnpmaclKXVZh4ujwr5RsPCMf4pJeJiEE1bdaLgIcuJa4842OCcKVtABAIoRt9U6Ybs2MmQzNmeeDx+lR622oBAapSvXEUVmQ5yACxw6Rq6gfZj/x9/hGDAERA5tO2kSNZ/+WIUK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Tue, 9 May 2023 05:51:53 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::9f1b:8dde:50b2:1b4f]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::9f1b:8dde:50b2:1b4f%4]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 05:51:53 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH 2/2] drm/xe: Handle -EDEADLK case in exec ioctl
Thread-Index: AQHZgjaIAZXN9GVHXU2u+aVdNWeMba9RcESA
Date: Tue, 9 May 2023 05:51:53 +0000
Message-ID: <0e6c7903d095553a7f39aac2f5aae13a4af92af1.camel@intel.com>
References: <20230509052419.28430-1-niranjana.vishwanathapura@intel.com>
 <20230509052419.28430-3-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230509052419.28430-3-niranjana.vishwanathapura@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3114:EE_|DM4PR11MB5261:EE_
x-ms-office365-filtering-correlation-id: d988139d-f7a0-4377-0dbe-08db50517dc8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MCqOUM8ovZOeBqaqEelTQ1qAJhiIUL6owXwCfxGSCP6SHUixLMw1sIVSzIVTLTmc5t4mr1Qyq1nHwplMt6E2d5+uZrgzbTHRyWwgN50oYmjQwBokjCpTIPl4z0hOR8fw8EQEAEKbUTz0WB4IwYfah4IZmJyGi+yMn2N2pMWZSTMrnvCz2S7x4GOZwkJ91WxVs3Zfnji5HzBSz4DA4yWD8Hf/AOorAsWcKjfB3ZK/X/ObLFU3Og1AHa7VdCe0jD3WcRIPsHU5zjP0I42XwRJlgeBUaEb3DL3Dyat6wr+beFUbIuvKUgKCLKgQG0keLd8MzI63b/le7PXrmmdQgdo64WtrMIVSiZb+mBblirXfdusKA3SyX+B8gA+fvWZsfuGGSF4vddpdwelOFoE2SxU1D5LH77nGD8qFGLpLwFrgN+f2nsPxrmiknKUsA1MnzQr1sOF6Ls3CLBPfJnFNsJP7b2WyWNNaLyJEXHJ/PFDfa5wdsy/ARjweOZwVutdJjkM7OIP+sG9685DrWVuN6h7OICY0nPwLtCggjlY2t+ajjaRAr4/4gZOBOzif6JPNYrwFrj2kNJE1lHsYY+XNeR77VRFq65Z6bS87InmIfzNhk5YndjywXce2nps/6mHGgUdD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(36756003)(66556008)(38100700002)(2906002)(316002)(86362001)(8676002)(66446008)(6636002)(64756008)(76116006)(82960400001)(66946007)(5660300002)(66476007)(38070700005)(4326008)(8936002)(41300700001)(122000001)(66574015)(83380400001)(91956017)(186003)(6506007)(26005)(6512007)(478600001)(110136005)(2616005)(71200400001)(6486002)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THFCaW5sbzJ2ekQySXV1cnl0VC80QXQzR2kzWUk0ckF1cE1uMVVDSHhnLzE3?=
 =?utf-8?B?bzhiWHdHV0hOQWNJeHU1V2NkUjdrVVUwSWVhY0NVY0JkSHJTMFJ4dzN1SHV5?=
 =?utf-8?B?b3UrSjljS0xvN3dWdGRiS2RFT3NhVmQzWkd0S0JncERMME9udXJybGtwcUds?=
 =?utf-8?B?cXh0bWdhaGIrdmdnYThHdURDL3ZPeGJoVmdaM2xNaUV6a1FHWXRDMS9ydmJT?=
 =?utf-8?B?T2Z2b1VTQlZFdWhZelNya2FHeVZMcU1zNUtzSHZldFB0czZVTkpVbG0rdFJm?=
 =?utf-8?B?YjZoS2p6emhtODdVb2FOUXhEcmZ3SzJMdTZ3N2VHR2hRUDI2TzBQblJYaHFx?=
 =?utf-8?B?VnI4UkxPRGdUdGlEZUVJSjJtQjlSNjE3QnR5QWhRb3Z3KzR0SlhWRE5Sd21X?=
 =?utf-8?B?N2ViWHlBZzJUOUtwQ3laRVFhMzRsK1NnUVJydmw5a3ZKUWV2Q2ZqYXM3Y0tB?=
 =?utf-8?B?Nkhack5ZMDQ1bGdiajZhU1NGbDMyRHd2eHRGVURiTjhLNWIwVmNtTVM4OGZL?=
 =?utf-8?B?cklPdVBwcXlHR2J4RjFUS1Z5ZnZFaWxSbThleVQ3VktXVjNmZEM5UTcrVWs0?=
 =?utf-8?B?VHdZTDV3VWVla0ZoZUgzcUJ0RXI4RnJMeFAyUkFpMnFoQ0wwYWJTK2l2UTVy?=
 =?utf-8?B?cWR0NWovYXJpNVhzczBFVEJYNkdtOVlEUVRvOTBIM1NOak9NT29TMnZOd1Rz?=
 =?utf-8?B?V1VMTndhYkJ3U3dKd2JUaDh3dG9ndTN6ODdZZThKODI1THVXNXBXVnZPQ0VY?=
 =?utf-8?B?UDN2R0Z6cyttWHVjWGVBNStYWEtYNHN3ekdJSm9QcllRSDhCbk16YTJJZzZt?=
 =?utf-8?B?eG52ZnNnTWQzeFFmT3BlV2F6Z2tIeEY2ZnhPZE1PMUNZdUpSSmFiRDJJMndN?=
 =?utf-8?B?aWlRbXVueXBwVWFrMnMxNk1taDhBU1YzMGVtV0xhTXBseWU3bjAvcXoyR0JW?=
 =?utf-8?B?UlVIQ0RhUE5KaHVvK3FBRm9sQktRZFlIdXN6VjI5c2ZpNUxZbDhOUHk4RVp2?=
 =?utf-8?B?TXV1Ujkzam1mUVlZa0YzVTBpNjcxNnRrcEhYcFdZVk92WjFoTWJLMFRNcXZK?=
 =?utf-8?B?b2ZJWEZkZjBRY2VVVU0ySEN3T3cwa1oyeFgyWmFza1JjUC8rdzAzallNbVlx?=
 =?utf-8?B?TVlhT0tmQlpWTndyZmQwT1orZmdqOERsZ2J1MDFzSjV1VTZ6OGdVa1BTTXdh?=
 =?utf-8?B?TmRKL1Z6ektKKy9KNHFPVEtWelZRTVhRbWE2Z1d2NExaSVdUcmlLNkpFeGda?=
 =?utf-8?B?Vm0wWDJLMlRKNkZsbE5TbTJGYlNuYXhzekpTakpGQWlVWVFOUzkwaExNUm43?=
 =?utf-8?B?OHVUNXpRUGp6NzI1eWpBMEY1SDU4NXBXSEZVKzFEK2dXV2ZwWTRxaW8wVzFF?=
 =?utf-8?B?eFJzeG11c2FSd3NhSW0zM05WT0pYeGRPcmhxTmUyek83TVF3RytJUGdvQTdx?=
 =?utf-8?B?WjVMa0FRQ1Q0eUhuQWtEWHQ0VzFHUkI5NzJPVVMvTTRhd1p4bGtOeGhHUkxC?=
 =?utf-8?B?WXZoQ3VvK05rT0c3RStaaEZJNzZ0Yjc5aEt1UEZIV2hmZmYwcGppS2JKVFpZ?=
 =?utf-8?B?OU5tcXdYTUp3RzhhRTB3ZnVpWEJhR1BJNEN4c0lHd2xmMXNPcXMxYVNUWkcv?=
 =?utf-8?B?azU3QVJ6cUtxSkJ5dEY3czRRd1FUUUdUL1NIZXJNSkppVHBpOStxcm00RWl3?=
 =?utf-8?B?Y25IL1VlZkxRK3ZOSW5PSXRZUG5OMmxVaEltRlZ5V2trOW1yamxIaEt4Qnoy?=
 =?utf-8?B?aG9SRExXdHZkc1pGd3ZhajBuQ215RXZFbmhGME9tUVZleDEva1FONTR1c1dY?=
 =?utf-8?B?MkQweGVrN1dORjh6OFNGRisxcXNvdEtibFpkVERSZzFySkk0emdTRWxXRkFa?=
 =?utf-8?B?L2tZWWYyQnRLdUw5MlczR2c5c2o5dDk2YS9yUEVXMTIvdXJqUzFQWS9HcmxP?=
 =?utf-8?B?UFI0Zy9oMDF6ektWUkY4RkpaVjhMTWNDSE9Fd1dtRk4yTTlwdnRIR1VRVjdn?=
 =?utf-8?B?WVIyS2Q3aSt2bElaRGZIaDlkcWQ4Q3RwSFNLWkg4QmhJSThndHlOTFYrVThP?=
 =?utf-8?B?QStYNks2UmUzMnFXb1NtbEFybFNZbWlOMHphcEJ1ckNXNkRXUHlVNGJ1ZnN5?=
 =?utf-8?B?Y1N1WTVtbjMvSDh6SUIzTUE5R0hTVCtZanVua2JiZGpIYlVoSWpaWUVrWWFD?=
 =?utf-8?B?enc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9AA4294E307647468A9F967796D7840E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d988139d-f7a0-4377-0dbe-08db50517dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 05:51:53.5641 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lu6XYetZ3q4yQq89v8ZhzQus3xk7u3h3EeZg4CdM85JudeSlY8vMwNmNe6eK7UWWQ6h3HouVvOBwZmSoapn5oer/qvvo2FZSpymasWc7dBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Handle -EDEADLK case in exec
 ioctl
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
Cc: "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTA1LTA4IGF0IDIyOjI0IC0wNzAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IFdpdGggbXVsdGlwbGUgYWN0aXZlIFZNcywgdW5kZXIgbWVtb3J5IHByZXNz
dXJlLCBpdCBpcyBwb3NzaWJsZSB0aGF0Cj4gdHRtX2JvX3ZhbGlkYXRlKCkgcnVuIGludG8gLUVE
RUFETEsgaW4gdHRtX21lbV9ldmljdF93YWl0X2J1c3koKSBhbmQKPiByZXR1cm4gLUVOT01FTS4K
PiAKPiBVbnRpbCB0dG0gcHJvcGVybHkgaGFuZGxlcyBsb2NraW5nIGluIHN1Y2ggc2NlbmFyaW9z
LCBiZXN0IHRoaW5nIHRoZQo+IGRyaXZlciBjYW4gZG8gaXMgdW53aW5kIHRoZSBsb2NrIGFuZCBy
ZXRyeS4KPiAKPiBVcGRhdGUgeGVfZXhlY19iZWdpbiB0byByZXRyeSB2YWxpZGF0aW5nIEJPcyB3
aXRoIGEgdGltZW91dCB1cG9uCj4gLUVOT01FTS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmph
bmEgVmlzaHdhbmF0aGFwdXJhCj4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29t
Pgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYyB8IDI3ICsrKysrKysrKysr
KysrKysrKysrKysrKy0tLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb20+Cgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZXhlYy5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jCj4gaW5kZXggZWE4
NjlmMjQ1MmVmLi4zZGIxYjE1OTU4NmUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2V4ZWMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMKPiBAQCAtOCw2
ICs4LDcgQEAKPiDCoCNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgo+IMKgI2luY2x1ZGUgPGRy
bS9kcm1fZmlsZS5oPgo+IMKgI2luY2x1ZGUgPGRybS94ZV9kcm0uaD4KPiArI2luY2x1ZGUgPGxp
bnV4L2RlbGF5Lmg+Cj4gwqAKPiDCoCNpbmNsdWRlICJ4ZV9iby5oIgo+IMKgI2luY2x1ZGUgInhl
X2RldmljZS5oIgo+IEBAIC05MSw2ICs5Miw4IEBACj4gwqAgKsKgwqDCoMKgwqBVbmxvY2sgYWxs
Cj4gwqAgKi8KPiDCoAo+ICsjZGVmaW5lIFhFX0VYRUNfQklORF9SRVRSWV9USU1FT1VUX01TIDEw
MDAKPiArCj4gwqBzdGF0aWMgaW50IHhlX2V4ZWNfYmVnaW4oc3RydWN0IHhlX2VuZ2luZSAqZSwg
c3RydWN0IHd3X2FjcXVpcmVfY3R4Cj4gKnd3LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciB0dl9vbnN0
YWNrW10sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCB0dG1fdmFsaWRhdGVfYnVmZmVyICoqdHYsCj4gQEAgLTk5LDEyICsxMDIsMTQgQEAg
c3RhdGljIGludCB4ZV9leGVjX2JlZ2luKHN0cnVjdCB4ZV9lbmdpbmUgKmUsCj4gc3RydWN0IHd3
X2FjcXVpcmVfY3R4ICp3dywKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX3ZtICp2bSA9IGUt
PnZtOwo+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgeGVfdm1hICp2bWE7Cj4gwqDCoMKgwqDCoMKg
wqDCoExJU1RfSEVBRChkdXBzKTsKPiAtwqDCoMKgwqDCoMKgwqBpbnQgZXJyOwo+ICvCoMKgwqDC
oMKgwqDCoGt0aW1lX3QgZW5kID0gMDsKPiArwqDCoMKgwqDCoMKgwqBpbnQgZXJyID0gMDsKPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqAqdHYgPSBOVUxMOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVf
dm1fbm9fZG1hX2ZlbmNlcyhlLT52bSkpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gMDsKPiDCoAo+ICtyZXRyeToKPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0geGVfdm1f
bG9ja19kbWFfcmVzdih2bSwgd3csIHR2X29uc3RhY2ssIHR2LCBvYmpzLCB0cnVlLAo+IDEpOwo+
IMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIGVycjsKPiBAQCAtMTIyLDExICsxMjcsMjcgQEAgc3RhdGljIGludCB4ZV9leGVj
X2JlZ2luKHN0cnVjdCB4ZV9lbmdpbmUgKmUsCj4gc3RydWN0IHd3X2FjcXVpcmVfY3R4ICp3dywK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV92bV91bmxvY2tfZG1hX3Jl
c3Yodm0sIHR2X29uc3RhY2ssICp0diwKPiB3dywgb2Jqcyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKnR2ID0gTlVMTDsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDCoH0KPiArCj4gK8KgwqDCoMKg
wqDCoMKgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiBXaXRoIG11bHRpcGxlIGFjdGl2ZSBWTXMsIHVu
ZGVyIG1lbW9yeSBwcmVzc3VyZSwgaXQgaXMKPiBwb3NzaWJsZSB0aGF0Cj4gK8KgwqDCoMKgwqDC
oMKgICogdHRtX2JvX3ZhbGlkYXRlKCkgcnVuIGludG8gLUVERUFETEsgYW5kIGluIHN1Y2ggY2Fz
ZQo+IHJldHVybnMgLUVOT01FTS4KPiArwqDCoMKgwqDCoMKgwqAgKiBVbnRpbCB0dG0gcHJvcGVy
bHkgaGFuZGxlcyBsb2NraW5nIGluIHN1Y2ggc2NlbmFyaW9zLCBiZXN0Cj4gdGhpbmcgdGhlCj4g
K8KgwqDCoMKgwqDCoMKgICogZHJpdmVyIGNhbiBkbyBpcyByZXRyeSB3aXRoIGEgdGltZW91dC4K
PiArwqDCoMKgwqDCoMKgwqAgKi8KPiArwqDCoMKgwqDCoMKgwqBpZiAoZXJyID09IC1FTk9NRU0p
IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKga3RpbWVfdCBjdXIgPSBrdGltZV9n
ZXQoKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVuZCA9IGVuZCA/IDog
a3RpbWVfYWRkX21zKGN1ciwKPiBYRV9FWEVDX0JJTkRfUkVUUllfVElNRU9VVF9NUyk7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChrdGltZV9iZWZvcmUoY3VyLCBlbmQpKSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtc2xlZXAo
MjApOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byByZXRyeTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKg
wqDCoMKgfQo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gK8KgwqDCoMKgwqDCoMKg
cmV0dXJuIGVycjsKPiDCoH0KPiDCoAo+IMKgc3RhdGljIHZvaWQgeGVfZXhlY19lbmQoc3RydWN0
IHhlX2VuZ2luZSAqZSwKCg==
