Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757C6C6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 13:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EBF10EA9E;
	Thu, 23 Mar 2023 13:53:16 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDB810EA9E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679579594; x=1711115594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NyHQcWwv5JEuCe/hh3Hn6nJ/xM2z6ygp6OemsQxK1wc=;
 b=SHGpyjN/0R3LtO9E9BniJ0UyNwKzUfWh/UdfUbmw72YAJcDat71gvXN0
 PO12ZM/ui/GOh9pb88PWcx00iyqhVaGTEBVRDZeqNQcawYqfFhu4dv8HG
 RChul3aP1nvoIYJ0IOlZNFkjrazGWhXyXTVHSAFPaEIlC6UIqyW5jBl8i
 AejOjT00JAYcj76KEpaKAnAONkf/XaNxCBAZChNI0IT4jM7y8TGEowFNa
 XQSMOayloDiC03EUj7FBtLTSJLv2rjEKOjiPSAKxKo/ma33n43hHBSpG3
 KSYf+SmO5oOVozt/vYwYronWLCHESwRHpvYo6PObQFx+1oBmpZjawftiH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="402070811"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="402070811"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 06:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="825825357"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="825825357"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 06:41:43 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 06:41:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 06:41:42 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 06:41:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoFyMq73172f8cJ2W2E/cO16ayGJk2QCSS95yoQBnnWGnV1Y8YqMGvhVRv9rOtsdpmr96Jrc7xYWlF3eunTutwket8oM+geahJaXhfGrCs8LRxyIkyR96UM25CFnQrg1WlokA5NZmWRYEjqqFjWVJNVLB3inyNQ60e6d8spaHo39FHSzaAqQ5SoYISFtv9oniprCOxec3O9N0QG7eiVLWAP0AovLY2vA9m5kYj8M52T3reUcsj+twGVqlQGaiLgFi7QUvCZHyy0mD/06Do2yKqBYU2RR5uo/8OKLasrXAQP/e8b3QfjTZYyDxzm7mj4tM6yaZAAf+sjyGWBuwrCjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyHQcWwv5JEuCe/hh3Hn6nJ/xM2z6ygp6OemsQxK1wc=;
 b=eNShwFTQml98lkroKJbOsqUvyy0AwAc7WLwrEyGlL7DCATOwLwArxR3W7ec6eMQirr9nB6QdY8gUxcr+qVJTSc1lHblyS2r4sH3Eg71TOGptdqzD4UxhPcPhT09XkFZFduhB1vdC83dc2HxCRU2fh5t6XWuqgVMNM3FtMbRJ7kKOpXnuwHAnHnIJCDpUpPtOqsKhHWCeWI86MFlaFoOjO6gNNqr46Q7xdUhUklwbTltJe/X5VCuLsBn5wsf1bNq9Z98es8BzL4DfkwNe/x8L6cpgaowivlZ6ln5KBVwGf+XeQ2i4OK+gvmKw+13aLXHWhPvcSMr37oKVT96+7sg0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY4PR11MB2054.namprd11.prod.outlook.com (2603:10b6:903:2d::9)
 by BL1PR11MB6052.namprd11.prod.outlook.com (2603:10b6:208:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:41:40 +0000
Received: from CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b]) by CY4PR11MB2054.namprd11.prod.outlook.com
 ([fe80::ecb6:23da:cb6c:683b%10]) with mapi id 15.20.6178.038; Thu, 23 Mar
 2023 13:41:40 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH 1/1] drm/xe/uapi: Add query engines uAPI
Thread-Index: AQHZXGbsAjQA9H08+0qQM9pldiqpl68G+xMAgAA3j4CAABXJgIAAHAQAgAD9E4A=
Date: Thu, 23 Mar 2023 13:41:39 +0000
Message-ID: <165ec23878222eb2afc1f5210af7bafa96679bc6.camel@intel.com>
References: <20230322023450.797598-1-matthew.brost@intel.com>
 <20230322023450.797598-2-matthew.brost@intel.com>
 <105d0e79d27c445b99a2ef04193f36e7c66f9d42.camel@intel.com>
 <ZBtY8d6H8khAdPZR@DUT025-TGLU.fm.intel.com>
 <45226fbbc940eafc218bc2cc4a3798b41bad90d3.camel@intel.com>
 <ZBuCuOMEGC2XGyqZ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZBuCuOMEGC2XGyqZ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR11MB2054:EE_|BL1PR11MB6052:EE_
x-ms-office365-filtering-correlation-id: e9778492-f89b-42e7-0dbd-08db2ba454ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sqOw5t2Nn9mL3OupiX6fvZxDUvBrQU8dgSfoU6kjxfZx5voEZv9kbLu2Xxr5XAazDMldYV9ZM9ZhwyqCKtRRhjE379r/jwHTZgywdOh3mlTjCwx4vtoinZKa0CZbfuEdeXJDsxh+aAke7pg9VHmmJfARKTloGpoJoJL+Ulai228hQLGJ2Hz6Ba3cD/feHA6jrc0M9p3NsDnVgV11LAPgvk5G83twVAFipUtM4FV+a4kfDv/DPU48vezPCXVecwjW+Zq+vqhF5VFxxAYLAIVZ1p8bkCcPQERgwOca3GrNJAchiyzVacO6R8ee5AWHlP2Xn0pDAUOEOiu+xLxpw8MmDwlEtHXFla5MMI18yyye44HbBY6Nw39Cyl0TesefLhtWmyjrNL1YpNXwICti4/ZG42GCxBVy6d54KS611wDs2eDbKCoH38xp0lQmi4dTu01ug//6MjRxa26ytcsx0OiaZf1lZmbJuTd4wnBi0zzvNZLJBoJrHdjhKST/ECkYUo6gENiuQZ6wBQOkKXIvk9Gv2W/EaVhh/awCVCIh6G5KygpiG4vjyt9/dp6ZIlbJcC+66w5h2Vqx476gCQQkMb2bXpT9ZlSmP+ZDlgFXrLd5Zh9MpI/Bke16f7TGI3JRVNoW9LN+4nuT97m/aRCT4UYuqvyddCDDliRnVAVbJ1wZVpzy0YJJ/7HyrOk9FnU6lIzEFrzykB4ze6UIzEI0cb5VeA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB2054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199018)(41300700001)(66556008)(66446008)(5660300002)(64756008)(4326008)(66476007)(2906002)(8676002)(38070700005)(86362001)(82960400001)(36756003)(38100700002)(122000001)(71200400001)(6486002)(26005)(37006003)(91956017)(478600001)(76116006)(316002)(6862004)(8936002)(66946007)(83380400001)(6512007)(6506007)(6636002)(2616005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0hETUJTM0QwMWs1MW5qSVR6NGhjTmZjQzJYYjBLdkE3S1NjczlvMDRQR3du?=
 =?utf-8?B?b2RScW9NQXdWSXN5a09jV3d3eE54REVsN1NXd0FxbkFWT2NQQVZkWHllK1pk?=
 =?utf-8?B?YUNudERtNjFReGZFdHNHejRiRjU0VkpCUkV5TTl1TEgzVTlXUkxjTDYxZVJt?=
 =?utf-8?B?NGNVdTRkUEpsOFJkb0hxNVcvSE1tUTRRaWJuZHI4WTIrbWpZbjVhU3pJVlIx?=
 =?utf-8?B?WGE1aUVvWUd0Y0dTa1VqdHlsZjZtcHpPUnYrVjNiTmF2ZXpUTW5KVkI1SXov?=
 =?utf-8?B?U3IzOXJmSHdVTUl3L1pUTGNQRTVwb2lZZ05vRk1sekZINjdOaFJPU1NtYnQ2?=
 =?utf-8?B?SWNxK2hjQVd2L1hwMU5mTXVoQUZtUUJuOGREUmNYOXowM2FBcWJGcWRFd2t6?=
 =?utf-8?B?TWwvemJKS0c4R2tNRTdUYngxY0ZXdEE4SUxLeGlmUU5CNnRqdVhCT3cxUU1y?=
 =?utf-8?B?MHpKdGc0WFZ3aXBjcE8zUzN4T0gzcTd0ZWZXVG5KbGRya2YrcDVubU5kekh6?=
 =?utf-8?B?TEsrZVdHdkZ5ek1WN203Z1o4NjV2bmQxOUJ4TzFOSVpLQmdEWWRvZkVLZnN4?=
 =?utf-8?B?b3hKS3BqSndkaG1BRkVSTTM3dHBYdnI0V3VFamJ3NnhjZGczYmVyRTZ1REZh?=
 =?utf-8?B?VWIwbGxuNmRseHdXN0x0TXdzWHlQUG1jM1h6V2lzbzlTTFhiM0lBanp0QzIr?=
 =?utf-8?B?dFhkT1RTYXIzNFk4KytVbFNyclMzNzVETTM4UHNXNU9tVlhSWEVBTk84S2NP?=
 =?utf-8?B?SVNsclZPejFNa0EwYnhhZys5OHFaQ0M0djhlS00xTXR3YUFXM05RR0diMUVz?=
 =?utf-8?B?THJUczE5dkVNbTc3b0grNUJkUmNxZ05IcWlrc3F3ZmVxU3E3RG9PL1ExdkpW?=
 =?utf-8?B?d2lDVWk5anhJOUlCSzBvNzloK2xnNVRSVEMvc1F0aUUwNXBlQzNPd0RvVndG?=
 =?utf-8?B?RjEyU2RpcDNOVUVZbEw3SGpuZ1gwSm5LeHlJWmprVmJRUG5wRkxMdzRUUFNG?=
 =?utf-8?B?ZW5EQnlNUzFnVnI1ZHFrZUdsWlVzRjltVzg4cnNERVBDUzBIZFFmcVpWZ0I0?=
 =?utf-8?B?LzE3VTlVdUtIdUlCOGRuWGs5YlV2Y3pyVGk0dTkvaWN4L3pGYnJ3R2tkZURq?=
 =?utf-8?B?T2ZFa1VCMUY3V3NZbUliUmZxQ2RkR29sejltN3VSK3JBV0tQN04xTXVNRzVx?=
 =?utf-8?B?a1RtNkpSUHBET2k5Q05tZVdHc3BIbDFpWFhIeUY1SE5BQ1I0YUpvQUN0VWlS?=
 =?utf-8?B?Lzl5Tkt0eXhlUjNjTGtBeUt6ZGVMdFZ4K1ZaS1AyNmgxbkRUODJlMDZIdmxY?=
 =?utf-8?B?ZUlZZ2FOV052UXJzWDFjNjMraGoxY0p5Q3JPblNqY1NEMStYMGJmM1h3dGM1?=
 =?utf-8?B?OE5rMHVtQ2EySTZOd3hRSjQ3SzZwQWtEUytUaTlkRlhOZW9xVWNrQzU2emIv?=
 =?utf-8?B?MXplMjQ1RDZKS2I1VGN5U0VQSEQ2cWZBUkJENEN1Vk4zS0dZZmJBVTYwcU5m?=
 =?utf-8?B?T1RVSFZKT09GMTZ0QUlCeHhWUkYvUkttZDNjTUNpaVRkdW9yN0xPZnBwN0sx?=
 =?utf-8?B?c0xBd0h3a3dPTFM5VGFRaFBsTndLTzlVVkxySW5yZnYwN0NuM2tPdEtCWE5V?=
 =?utf-8?B?MGhhZmJHWXdtRWcvd1RHSVJhYWk0QThrZU9POWQ1dzVyR3grYVZtc0ZONy8w?=
 =?utf-8?B?R2ZRMUlPWi9acjVTNG45dkkrdU5ZcHBJOXVhQW00dTZKZEJDUHVyb0cvMG93?=
 =?utf-8?B?bzF1WEE1QnYvelVCR2xzUzV0ZjY5dWRHeXRENWNaNXZESU9VZEdVR05CSkpa?=
 =?utf-8?B?NEJPaFF4Qmg0eDlVbUhoL3RLQzREVzZQSThXT3hyN2Y0UkRNSXV5WktKMWxN?=
 =?utf-8?B?cnhuVk82V0R1N1d1QVA3KzRNRUliNTl1S25iVTNJbXRiZ0R4SE5QT0ltQ2RI?=
 =?utf-8?B?dHpKWlVWeWJCelN3NER2aWxLR0xndkdmbm11UTFEN1lxZ0lUbHNwTGo4SjBN?=
 =?utf-8?B?Wmc0Y0ZJTEhCampZZlpVSVFCVFBBNkF6QmxHYXhVajNHd3hmZm9ZdzBzV0ta?=
 =?utf-8?B?ekJTbDRtRlV1QWRVYWlGb3lBZUU0RklabFczZVM4b0FxdGdOUVBXZEI5UjFZ?=
 =?utf-8?B?RFVHUnZsQUhCMHZneGZuK09kUXlRSHR4QUNEbVBIdDZPZ05yMUlQMFdJT2Ru?=
 =?utf-8?B?RlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DF3B29B3F8D4A4C8A70206DA34896B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB2054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9778492-f89b-42e7-0dbd-08db2ba454ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 13:41:39.7715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OkKbzIpwa0cOp4QHnVQllyz/1EwvSK4X1+A2DPI5sPFitgmeTdFgMrELH4fYPQ2067Z5PhD/ikvUKTIvcW61Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6052
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 1/1] drm/xe/uapi: Add query engines uAPI
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

T24gV2VkLCAyMDIzLTAzLTIyIGF0IDIyOjM1ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIE1hciAyMiwgMjAyMyBhdCAwMjo1NToyMlBNIC0wNjAwLCBTb3V6YSwgSm9zZSB3
cm90ZToNCj4gPiBPbiBXZWQsIDIwMjMtMDMtMjIgYXQgMTk6MzcgKzAwMDAsIE1hdHRoZXcgQnJv
c3Qgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE1hciAyMiwgMjAyMyBhdCAxMDoxODozM0FNIC0wNjAw
LCBTb3V6YSwgSm9zZSB3cm90ZToNCj4gPiA+ID4gT24gVHVlLCAyMDIzLTAzLTIxIGF0IDE5OjM0
IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0KPiA+ID4gPiA+IE5vdCBhbGwgaGFyZHdhcmUg
ZW5naW5lcyBhcmUgY3JlYXRlZCBlcXVhbGx5LCBjZXJ0YWluIGluc3RhbmNlIGhhdmUNCj4gPiA+
ID4gPiB1bmlxdWUgY2FwYWJpbGl0aWVzIG9yIHByb3BlcnRpZXMuIEludHJvZHVjZSBhIHVBUEkg
dG8gcXVlcnkgZm9yIGJvdGgNCj4gPiA+ID4gPiBjYXBhYmlsaXRpZXMgYW5kIHByb3BlcnRpZXMu
IFRoZSBjYXBhYmlsaXRpZXMgYXJlIHJlcHJlc2VudGVkIGJ5IGEgYml0DQo+ID4gPiA+ID4gbWFz
ayB3aGljaCBpcyB1bmlxdWUgdG8gZWFjaCBjbGFzcy4gVGhlIHByb3BlcnRpZXMgYXJlIHJlcHJl
c2VudGVkIGJ5IGENCj4gPiA+ID4gPiBuYW1lIGFuZCB2YWx1ZSByZXR1cm4gaW4gYW4gYXJyYXkg
dG8gdGhlIHVzZXIuDQo+ID4gPiA+IA0KPiA+ID4gPiBXaGVuIHJlLXNlbmRpbmcgdGhlIHNhbWUg
cGF0Y2ggc2VyaWVzIHdpdGggZml4ZXMsIHBsZWFzZSBpbmNsdWRlICJ2WCIgaW4gdGhlIHN1Ympl
Y3Qgd2Uga25vdyB3aGF0IGlzIHRoZSBsYXRlc3QgdmVyc2lvbiB0byByZXZpZXcuDQo+ID4gPiA+
IA0KPiA+ID4gDQo+ID4gPiBXaWxsIGRvLg0KPiA+ID4gDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+
ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gIGluY2x1ZGUvdWFwaS9kcm0veGVfZHJtLmggfCA0NCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0veGVfZHJt
LmgNCj4gPiA+ID4gPiBpbmRleCA2NjFkNzkyOTIxMGMuLjU1N2M5YWU2ZjM2NCAxMDA2NDQNCj4g
PiA+ID4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oDQo+ID4gPiA+ID4gKysrIGIv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ID4gPiA+IEBAIC0xMTksNiArMTE5LDcgQEAg
c3RydWN0IHhlX3VzZXJfZXh0ZW5zaW9uIHsNCj4gPiA+ID4gPiAgI2RlZmluZSBEUk1fWEVfV0FJ
VF9VU0VSX0ZFTkNFCQkweDBiDQo+ID4gPiA+ID4gICNkZWZpbmUgRFJNX1hFX1ZNX01BRFZJU0UJ
CTB4MGMNCj4gPiA+ID4gPiAgI2RlZmluZSBEUk1fWEVfRU5HSU5FX0dFVF9QUk9QRVJUWQkweDBk
DQo+ID4gPiA+ID4gKyNkZWZpbmUgRFJNX1hFX0VOR0lORV9RVUVSWQkJMHgwZg0KPiA+ID4gPiAN
Cj4gPiA+ID4gcy8weDBmLzB4MGUNCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IFllcC4NCj4gPiA+
IA0KPiA+ID4gPiBUbyBhdm9pZCBjb25mdXNpb24gd2l0aCBEUk1fWEVfRU5HSU5FX0dFVF9QUk9Q
RVJUWSwgd291bGQgYmUgYmV0dGVyIHRvIG5hbWUgdGhpcyBhbmQgcmVsYXRlZCBzdHVmZiBhcyBE
Uk1fWEVfRU5HSU5FX0NMQVNTX1FVRVJZLg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gSSBkb24n
dCBsb3ZlIERSTV9YRV9FTkdJTkVfQ0xBU1NfUVVFUlkgYXMgdGhlIHF1ZXJ5IGlzIGZvciB0aGUg
Y2xhc3MsDQo+ID4gPiBpZCwgZ3QgdHVwbGUuDQo+ID4gPiANCj4gPiA+IFdlIGRlZmluaXRlbHkg
bmVlZCB0byBkbyB3b3JrIGluIGdlbmVyYWwgb24gdGhlIG5hbWluZyB0byBhdm9pZA0KPiA+ID4g
Y29uZnVzaW9uIGJldHdlZW4gYSBoYXJkd2FyZSBlbmdpbmUgYW5kIGEgdXNlciBlbmdpbmUuIFBl
cmhhcHMganVzdCBkbyBhDQo+ID4gPiBsYXJnZSBmaW5kIHJlcGxhY2UgYWNyb3NzIFhlIHdoZXJl
IGEgdXNlciBlbmdpbmUgLT4gY29udGV4dD8NCj4gPiA+IA0KPiA+ID4gQW5vdGhlciBvcHRpb24g
d291bGQgYmUgdGhlIHVBUEkgd2l0aCBIVyBlbmdpbmUgbmFtaW5nIGFzIG5lZWRlZC4gZS5nLg0K
PiA+ID4gDQo+ID4gPiBzL0RSTV9YRV9FTkdJTkVfQ0xBU1NfUVVFUlkvRFJNX1hFX0hXX0VOR0lO
RV9DTEFTU19RVUVSWQ0KPiA+ID4gcy9kcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlL2RybV94
ZV9od19lbmdpbmVfY2xhc3NfaW5zdGFuY2UNCj4gPiA+IHMvRFJNX1hFX0RFVklDRV9RVUVSWV9F
TkdJTkVTL0RSTV9YRV9ERVZJQ0VfUVVFUllfSFdfRU5HSU5FUw0KPiA+IA0KPiA+IEkgbGlrZWQg
b3B0aW9uIDIgdG9vLg0KPiA+IA0KPiANCj4gQ29vbCwgaW4gbmV4dCByZXYgSSB3aWxsIGFsc28g
aW5jbHVkZSB0aGVzZSBjaGFuZ2VzLg0KPiANCj4gPiBBYm91dCB0aGUgbmV3IFVBUEksIHdoYXQg
dXNhZ2UgZG8geW91IGhhdmUgaW4gbWluZD8NCj4gPiBJIGNhbid0IHRoaW5rIGFueSBpbmZvcm1h
dGlvbiB0aGF0IE1lc2Egd291bGQgbmVlZCBmcm9tIGh3X2VuZ2luZSBhdCB0aGlzIG1vbWVudC4N
Cj4gPiBNYXliZSBhZGQgc29tZSBjb21tZW50cyBhYm91dCB0aGlzIGluIHhlX2RybS5oLg0KPiA+
IA0KPiANCj4gVGhpcyBhIGFzayBmcm9tIG1lZGlhLCBJIGd1ZXNzIG5vdCBhbGwgVmlkZW8gZGVj
b2RlIGhhcmR3YXJlIGVuZ2luZXMNCj4gaGF2ZSB0aGUgc2FtZSBmZWF0dXJlcyB0aHVzIHdlIG5l
ZWQgYSB3YXkgY29tbXVuaWNhdGUgdGhpcyB0byB0aGUgbWVkaWENCj4gVU1ELiBXaG8ga25vd3Mg
d2hhdCBlbHNlIHdlIHdpbGwgbmVlZCB0byByZXBvcnQgYWJvdXQgaGFyZHdhcmUgZW5naW5lcw0K
PiBpbiB0aGUgZnV0dXJlIHNvIHRyaWVkIHRvIG1ha2UgdGhpcyBpbnRlcmZhY2UgYXMgZmxleGFi
bGUgYXMgcG9zc2libGUuDQoNCk9oIG1lZGlhLCBtYWtlcyBzZW5zZS4NCg0KPiANCj4gTWF0dA0K
PiANCj4gPiA+IA0KPiA+ID4gSSdkIGxlYW4gdG93YXJkcyBvcHRpb24gIzIgYnV0IG9wZW4gdG8g
ZWl0aGVyLg0KPiA+ID4gDQo+ID4gPiBNYXR0DQo+ID4gPiANCj4gPiA+ID4gPiAgDQo+ID4gPiA+
ID4gIC8qIE11c3QgYmUga2VwdCBjb21wYWN0IC0tIG5vIGhvbGVzICovDQo+ID4gPiA+ID4gICNk
ZWZpbmUgRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVSWQkJRFJNX0lPV1IoRFJNX0NPTU1BTkRfQkFT
RSArIERSTV9YRV9ERVZJQ0VfUVVFUlksIHN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5KQ0KPiA+
ID4gPiA+IEBAIC0xMzUsNiArMTM2LDcgQEAgc3RydWN0IHhlX3VzZXJfZXh0ZW5zaW9uIHsNCj4g
PiA+ID4gPiAgI2RlZmluZSBEUk1fSU9DVExfWEVfRU5HSU5FX1NFVF9QUk9QRVJUWQlEUk1fSU9X
KCBEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX0VOR0lORV9TRVRfUFJPUEVSVFksIHN0cnVjdCBk
cm1feGVfZW5naW5lX3NldF9wcm9wZXJ0eSkNCj4gPiA+ID4gPiAgI2RlZmluZSBEUk1fSU9DVExf
WEVfV0FJVF9VU0VSX0ZFTkNFCQlEUk1fSU9XUihEUk1fQ09NTUFORF9CQVNFICsgRFJNX1hFX1dB
SVRfVVNFUl9GRU5DRSwgc3RydWN0IGRybV94ZV93YWl0X3VzZXJfZmVuY2UpDQo+ID4gPiA+ID4g
ICNkZWZpbmUgRFJNX0lPQ1RMX1hFX1ZNX01BRFZJU0UJCQlEUk1fSU9XKCBEUk1fQ09NTUFORF9C
QVNFICsgRFJNX1hFX1ZNX01BRFZJU0UsIHN0cnVjdCBkcm1feGVfdm1fbWFkdmlzZSkNCj4gPiA+
ID4gPiArI2RlZmluZSBEUk1fSU9DVExfWEVfRU5HSU5FX1FVRVJZCQlEUk1fSU9XUihEUk1fQ09N
TUFORF9CQVNFICsgRFJNX1hFX0VOR0lORV9RVUVSWSwgc3RydWN0IGRybV94ZV9lbmdpbmVfcXVl
cnkpDQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+ID4gIA0KPiA+ID4gPiA+
ICBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSB7DQo+ID4gPiA+ID4gIAlfX3Ux
NiBlbmdpbmVfY2xhc3M7DQo+ID4gPiA+ID4gQEAgLTI1Myw2ICsyNTUsNDggQEAgc3RydWN0IGRy
bV94ZV9kZXZpY2VfcXVlcnkgew0KPiA+ID4gPiA+ICAJX191NjQgcmVzZXJ2ZWRbMl07DQo+ID4g
PiA+ID4gIH07DQo+ID4gPiA+ID4gIA0KPiA+ID4gPiA+ICtzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9x
dWVyeV9wcm9wZXJ0eSB7DQo+ID4gPiA+ID4gKwkvKiogQHByb3BlcnR5OiBwb2ludGVyIHRvIHRo
ZSBmaXJzdCBwcm9wZXJ0eSBzdHJ1Y3QsIGlmIGFueSAqLw0KPiA+ID4gPiA+ICsJX191NjQgcHJv
cGVydHk7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJLyoqIEBuYW1lOiBuYW1lIG9mIHRoZSBw
cm9wZXJ0eSAqLw0KPiA+ID4gPiA+ICsJX191NjQgbmFtZTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gKwkvKiogQHZhbHVlOiB2YWx1ZSBwcm9wZXJ0eSAqLw0KPiA+ID4gPiA+ICsJX191NjQgdmFs
dWU7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJLyoqIEByZXNlcnZlZDogcmVzZXJ2ZWQgKi8N
Cj4gPiA+ID4gPiArCV9fdTY0IHJlc2VydmVkWzJdOw0KPiA+ID4gPiA+ICt9Ow0KPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiArc3RydWN0IGRybV94ZV9lbmdpbmVfcXVlcnkgew0KPiA+ID4gPiA+ICsJ
LyoqIEBleHRlbnNpb25zOiBwb2ludGVyIHRvIHRoZSBmaXJzdCBleHRlbnNpb24gc3RydWN0LCBp
ZiBhbnkgKi8NCj4gPiA+ID4gPiArCV9fdTY0IGV4dGVuc2lvbnM7DQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICsJLyoqIEBlY2k6IGVuZ2luZSBjbGFzcyBpbnN0YW5jZSB0byBxdWVyeSAqLw0KPiA+
ID4gPiA+ICsJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgZWNpOw0KPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiArCS8qKiBAY2FwYWJpbGl0aWVzOiBiaXQgbWFzayBvZiBjYXBhYmls
aXRpZXMsIHNwZWNpZmljIHRvIGVhY2ggY2xhc3MgKi8NCj4gPiA+ID4gPiArCV9fdTY0IGNhcGFi
aWxpdGllczsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwkvKioNCj4gPiA+ID4gPiArCSAqIEBz
aXplOiBTaXplIG9mIHRoZSBxdWVyaWVkIHByb3BlcnRpZXMsIGlmIHVzZXIgcGFzc2VzIGluIHpl
cm8gdGhlIEtNRA0KPiA+ID4gPiA+ICsJICogcmV0dXJucyB0aGUgc2l6ZSBvZiB0aGUgcHJvcGVy
dGllcyBhcnJheSwgaWYgdXNlciBwYXNzZXMgaW4gdGhlIHNpemUNCj4gPiA+ID4gPiArCSAqIG9m
IHRoZSBwcm9wZXJ0aWVzIGFycmF5IHRoZSBLTUQgY29waWVzIHRoZSBwcm9wZXJ0aWVzIHRvIHRo
ZSB1c2VyDQo+ID4gPiA+ID4gKwkgKiBwb2ludGVyLg0KPiA+ID4gPiA+ICsJICovDQo+ID4gPiA+
ID4gKwlfX3UzMiBzaXplOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCS8qKg0KPiA+ID4gPiA+
ICsJICogQHByb3BlcnRpZXM6IHVzZXIgcG9pbnRlciB0byB3aGljaCBhbiBhcnJheSBvZiAgc3Ry
dWN0DQo+ID4gPiA+ID4gKwkgKiBkcm1feGVfZW5naW5lX3F1ZXJ5X3Byb3BlcnR5IGFyZSBjb3Bp
ZWQgdG8gaWYgc2l6ZSBpcyBub24temVybw0KPiA+ID4gPiA+ICsJICovDQo+ID4gPiA+ID4gKwlf
X3U2NCBwcm9wZXJ0aWVzOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCS8qKiBAcmVzZXJ2ZWQ6
IHJlc2VydmVkICovDQo+ID4gPiA+ID4gKwlfX3U2NCByZXNlcnZlZFsyXTsNCj4gPiA+ID4gPiAr
fTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gIHN0cnVjdCBkcm1feGVfZ2VtX2NyZWF0ZSB7DQo+
ID4gPiA+ID4gIAkvKiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZpcnN0IGV4dGVuc2lv
biBzdHJ1Y3QsIGlmIGFueSAqLw0KPiA+ID4gPiA+ICAJX191NjQgZXh0ZW5zaW9uczsNCj4gPiA+
ID4gDQo+ID4gDQoNCg==
