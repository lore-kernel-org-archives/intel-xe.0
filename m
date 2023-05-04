Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2060C77B7C
	for <intel-xe@archiver.kernel.org>; Thu,  4 May 2023 12:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6D510E392;
	Thu,  4 May 2023 12:15:30 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFC210E392
 for <intel-xe@lists.freedesktop.org>; Thu,  4 May 2023 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683202529; x=1714738529;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iqyGg9o/+QjxFEdR4w+QNxItjg60iJv7aB+LtfYk8i8=;
 b=VZtE0JK1GyKe0FORD70F2Gy/CI8aK9X7I63Kd3FBk59064ffZdJ4FSL3
 tFSaXepsE5dDek2o4hfRQzX+SsUh/f3sQF/9JJQm8SbEm37bdbnRF4A91
 HKiHVg+VDqQ727CKm6yu/L0Nr0CcT0IyLImZc/xx0K21nhqVcYQZdgqmR
 S8EhXRLdSWhLrlf8ZHdxFKNjfWHy4mYQ6R3iHnej/Ew9bAZMwOkwXKRLm
 btHcxob8NGP82JahteWkkDAgTDaIl6Iuru6wvEIn5WZO6ItJI/N9fzgKb
 v8qr2PIacWXs1t/PY4u2/Mmg7ngZiG47tBndNViqSoU7mDB3ZoQtz4eBU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="347734195"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="347734195"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2023 05:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="786513913"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; d="scan'208";a="786513913"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 04 May 2023 05:15:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 4 May 2023 05:15:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 4 May 2023 05:15:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 4 May 2023 05:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhPqOe6f/ZmCIfu4E1dPhvSPnJ4vUw6+5VjvTrCVKbn9zUVMaW1l0u8t248C3oJZ0qpYfRlJkG0/Ha/eFh0sJ9bYlSB/LnHnxs7wc+4z3brnJ2IQGMVUmO+dJgB3Cx9VvCRv86PE+2S0nOZGGbjG1boOhhsou9g1aEi8LSX38vcQBLDVRjlvxprhazutEsuUqdeNmgwpaoqW+Il6ZVBjb/fJZmzWoFq094D7cL+V6oMWcyWm5Qc1X0wFgOnES05CFkh7p29KqPOmgiuqxzB+l5TPXKOkreW4uMdHJtNHx6I9CC7cjucBa1SlJXK9kHaufkdFlh2kCr0ZN+fdNpVgPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqyGg9o/+QjxFEdR4w+QNxItjg60iJv7aB+LtfYk8i8=;
 b=i32S7pDQCKINCqR/SOqsXaMDF2K4aKw3pxhwNwXwz28m/8PiL3P9njFYcQf7xCbMrMlPHsv9jsjFUA2Gw60LDwdkNdAmwM9g9jjPgfVAoZvecVrxMHkg4JM/bVoRXKVNQjAcNyUCRanIY5KbdnHHmXTee0EK8DJMtGqIUwGsXs8lN1NLLm1MBhG6L1zhyhSlLHxwa7czhnZN9hdyL36dAlylL6EwRZRDIW5KlUIqKCTNn0o3zbXEHtt8VgmjUbh7VggSR56uTI897q8OE9rhSl31uVgSi51YM1YFUkwCCaTe+liiiPhnj0YN1aAbiU7iw1BbAg7HfV5aZ5f0ZfQtPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SJ2PR11MB7600.namprd11.prod.outlook.com (2603:10b6:a03:4cd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 12:15:22 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43%7]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 12:15:22 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnAmtsopt9dbk62RKm6nfbCWq9KBB+AgAAB2BA=
Date: Thu, 4 May 2023 12:15:21 +0000
Message-ID: <SJ1PR11MB6204F717F0BBA1502364898D816D9@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <b2e385b8-d476-a544-602e-4dbd953fbcb0@intel.com>
In-Reply-To: <b2e385b8-d476-a544-602e-4dbd953fbcb0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SJ2PR11MB7600:EE_
x-ms-office365-filtering-correlation-id: 636fc000-271c-4c1c-1cc7-08db4c993bcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+SgYzemyIz/IK4A/pzxnAk9ppcEe3scivmVHGk3oUjoQ0VT3ajXWxVQVth7q7C6wpKzoHskW+94viGeOV7JSdsZlfrGL7pSg4YtpliFX0NRpTq3rdF3dPyyPs7lLDcKwgZmQVq6sjhzL8qZPmplXc1424AzRZ1FZeLnHge+kcl7m5QM0EsyCyHl0TAsWpd8VPQ7MTfI7dpRAhLUAH+29K52fR2m13yKQb0UukWnA90lhnnhDxYJnl3Sdvdp0ATH8loqtd9lE6YgDq77f78S1Enn6moDJQgzxYO3CL6Ud3iQ7JM367aLc+PVmOHy6Qdix0ETNFcf3LKxdQJ1R8dfxHTgnUKcxnKELIWkSxxCIrt/w0E3abIQOvliQFLX/gymxGDcvLXqwNF0gN4wOFODOFDYe7grr6cr2hiyBvHiFhMLfXe0wEqYy9p/XWBWgoudnmuJkp/8kpKGvGgfqJegNKfIQfS5KNCSI9R9J+QvkMSO/1a451BDm394pxeL37G1K3rMsl9WcMzSnPCOltt+xjmt2fKSsdU4XNxf8JzfNWW1TjILROfyyl7AUww7krvj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199021)(9686003)(6506007)(82960400001)(122000001)(186003)(53546011)(38100700002)(83380400001)(8936002)(8676002)(41300700001)(52536014)(5660300002)(33656002)(55016003)(38070700005)(2906002)(7696005)(110136005)(71200400001)(316002)(478600001)(966005)(86362001)(66476007)(66556008)(66446008)(64756008)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QldybDBlOEZ4dTY0a3hTT0xhS1NaK2o5a01HTHFuRkhsa3FQUFArZUJGSXcw?=
 =?utf-8?B?ZXkrc293RklFVWVhZ1JML0JieTRkYjVCbGFkQlM2K3BpV0JtVkdPbDllUVFL?=
 =?utf-8?B?NVVTUTRWMmxKWGdrTW9BQkNpQWpKckRMY1IyYmgrN0NJZVJVTWIvZG9XeGRl?=
 =?utf-8?B?R3hvQ2g2ejA3WlZyOUhnMEp1VXhkZVhFNjNvU3RLYllYYjhPMFk5NVdmWUFQ?=
 =?utf-8?B?UlZmT1lML3hHMjVMZTJSUnBmNkpkOFZ0UnZHL0VGd2tXYWM1UDhJL29ZMUtm?=
 =?utf-8?B?Q2RsbVcycFJJaU95TDlvcVdwd3duM3JsaC9NSzNDRnROVWNFNytxay83RTUy?=
 =?utf-8?B?c1NDS3R1UjAwNVVBSzdPTHc0TTFqRk1ScXphdnEzME5EUy91c2Z6MkU3cHoz?=
 =?utf-8?B?cGxYRVA5WGl0TGFVVVoxMUhJdzlPbU9DLzhyelVhb2doWVNSaHJNb2VwRU5z?=
 =?utf-8?B?a0dscW1GWVFUbHB1Rk5kTGVuVXRTZ0hUMitCUlRLbG1RSjFmdUhFS2xZY1d1?=
 =?utf-8?B?d3YyVnpPV29MWG5UMjY0OVlYNysrQW1wbmtZZW1XbW1rN2NiclJpZzJhRUQv?=
 =?utf-8?B?WHpEOFFFN2NneURaRnUzQS9seGN5c1lwaUF1QWlGdzNWdzVGelB3aVA4cEtJ?=
 =?utf-8?B?MEsrMC8zbmhhRVg5bCtKbkwvY2xCVG1iNVdsSTJlTy85cXJHbE5zR1ZVeVpi?=
 =?utf-8?B?dmNFUXNzT1hUTUJ2N0hjTW9pLzJnNWZuQTJCU2pwcStmMitKQi9aYzNVVzBS?=
 =?utf-8?B?dnpYQlNTSGlaVXZ1V25ralh5RG1qVWxab2w0QjVHSjZPR2hEMVJuVzVzamhn?=
 =?utf-8?B?cGtuelZRM1VkVERXbUlhaElHZlV0OExEUndnK1hCdENlRGpRaUNGZ0RZNlB2?=
 =?utf-8?B?STA1bWprZHEvaFVNQ1U2VDUzT3kreEhtbVNTTFl4RktsRExBV3Exemw4WXNt?=
 =?utf-8?B?ZU5CMzExSlZuYW1QMEdtTVVadno3L3RXTmZOQTNFWWFuSm5OMkxmVXlGaWhs?=
 =?utf-8?B?TVM0RWd4TFM0UXBJZGFDZ3pBMTJrUmZRaThDSHZ5RHFVQWw5RFBtVnFhN0hv?=
 =?utf-8?B?Z2FNY1Q2bGw1ellUUW1DWFlFMmFIYjBVYTUxS0xBSG9tNi9RQ01Ja0laeE5u?=
 =?utf-8?B?dXRRdVBvV0daMDZJSENxWWRGamhlOHh2VHdUZW1qaFQ5cnl3ZGFkTFhlU2Rl?=
 =?utf-8?B?QlE0VGlJeHZVSkZYWExrVkVWVDJ0TkQ1a2dkZ0k5NVoxR2tJWG9VNkxrSWdU?=
 =?utf-8?B?dGlwNjFCU0o1Q0F4QVBnWXBiNk1uT0tYSDBjZlhiYWVVZHQ5ZnQrN2tFaERl?=
 =?utf-8?B?dGQ2K0NDMDZ6YnJ6S3FONXFvZUtlckhHajZzMHFKS29kWTU1TFRoNm1iTGdY?=
 =?utf-8?B?eGVoVzgxb2JVREVVQWtZMW5YTGZicndFd01OVlpORy9wVS80VFliV1VqSVUx?=
 =?utf-8?B?TXl2RzlicW5XZHBDd1BBVUMzOW9DcFdMVlh5bUUxRmRpYW5PaEZHdGZlVCtQ?=
 =?utf-8?B?Q3JKa3dEeDdCSzZhTEJ4a1NzZmpWZWJGaFNtbkg3WEtkd3RvQ1Qwc0VuK3hm?=
 =?utf-8?B?anhNRnRrZEdmUnY4U2w2elNEaCtnRXBhS0pMZnZVK3VDTXJYUWd1YWNEdUlI?=
 =?utf-8?B?T0QvVDhmWVpLUzgwMXF4cERQaWJ5ZUU3NEJCV3dSOFd4ZHV5OEpkZzNvZEll?=
 =?utf-8?B?WjVlMnpucGg3K2o3WjV3NzdIWDNoT1F6TnFNR01qWEt6SjFJNm5aUEtBRExo?=
 =?utf-8?B?V2VkaHBFM2xaVnBiWWJvZXE3eU5oZm43WlhRNzFQdGFrY2pEV1JJSnViMzR2?=
 =?utf-8?B?aXJVbEJ1K1dibU8rOGRRZmlCeFFFNHZVUDBQd3hxYXRNeXBwM3lMUFFHS0p3?=
 =?utf-8?B?Z0JHdktPdGZucHhSdHJNMHBRMVVuWVd5R0t6Kzh3ZjBKTWFkK2lBeUNTYi9G?=
 =?utf-8?B?WG9GVytjaTBpMUlWb0dnSlRpVUxodEdVVWJVZzBCZ1JqU2dQeHROTXZFNktX?=
 =?utf-8?B?cU5zZU1INHBJbkVNMlJKZjBlWWhWajZaQ21FR2JvWnAvS3RKZlFrbTFDZFBT?=
 =?utf-8?B?enNDN1dTaW1EOEltd282cDU2SllRdjhNajFiSGZQTi9hRDNmU2VKNTFuQ2RC?=
 =?utf-8?B?NkVJL3ZuVktCR00xWXlNV3FnTGFJU1pNandJRmthMHlmZ3RkU09FSHRobXdi?=
 =?utf-8?Q?DmmRn3uxSJdPpKdVboYy5O4osF6tcZFKdWzjyXeynLI2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636fc000-271c-4c1c-1cc7-08db4c993bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 12:15:21.9949 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6WunOLG99b7bHC0w4F8KI2btEbcWdep3msnJ90yPTGPLYRwIEuLDyqu0xb5gDh6LvCSYoQL3kF2MChXRpyuQNEK0szV3tRdkmNbe1b1GAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7600
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
 memory size
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWRkYW1zZXR0eSwgQXJh
dmluZCA8YXJhdmluZC5pZGRhbXNldHR5QGludGVsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1h
eSA0LCAyMDIzIDU6MzQgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPjsgaW50ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDAvM10gZHJtL3hlOiBBZGQgc3lzZnMgZW50cnkgdG8gcmVwb3J0IHBlciBn
dCBtZW1vcnkNCj4gc2l6ZQ0KPiANCj4gDQo+IA0KPiBPbiAwNC0wNS0yMDIzIDE2OjUwLCBUZWph
cyBVcGFkaHlheSB3cm90ZToNCj4gPiBBZGQgc3lzZnMgZW50cnkgdG8gcmVhZCBwZXIgZ3QgcGh5
c2ljYWwgbWVtb3J5IGluIHRvdGFsIGluY2x1ZGluZw0KPiA+IHN0b2xlbiBtZW1vcnkuDQo+ID4N
Cj4gPiBUaGUgc3lzZnMgZW50cnkgYWRkZWQgY2FuIGJlIHJlYWQgdXNpbmc6DQo+ID4gY2F0IC9z
eXMvY2xhc3MvZHJtL2NhcmQxL2d0L2d0MC9hZGRyX3JhbmdlDQo+ID4gY2F0IC9zeXMvY2xhc3Mv
ZHJtL2NhcmQxL2d0L2d0MS9hZGRyX3JhbmdlDQo+IGlzIHRoaXMgdGhlIHJpZ2h0IHN5c2ZzIHBh
dGg/IGkgZG8gbm90IHRoaW5rIGd0IGlzIGVudW1lcmF0ZWQgdW5kZXIgY2FyZCBmb2xkZXINCj4g
YW5kIGFsc28gdGhlcmUgaXMgbm8gdG9wIGxldmVsIGd0IGZvbGRlciBhcyBpbiBpOTE1Lg0KDQpU
aGlzIGlzIHdoZXJlIHdlIHVzZWQgdG8gY3JlYXRlIHRoZW0gdXNpbmcgZHJtX2NsYXNzIGluIGk5
MTUuIFdoYXQgc2hvdWxkIGJlIHJpZ2h0IHBhdGggYXMgcGVyIHlvdSwgYXMgdGhlcmUgaXMgbm8g
bWVudGlvbiBpbiByZWxhdGVkIEpJUkEuIA0KDQpHdCBmb2xkZXIgd2FzIG5vdCB0aGVyZSwgSSBj
cmVhdGVkIGl0IHRvIGhhdmUgcGFyaXR5IHdpdGggaTkxNS4gQXMgd2UgaGF2ZSByZXF1aXJlbWVu
dCBvZiAiZ3QvZ3Q8Tj4iIG1lbnRpb25lZCBpbiBKSVJBLg0KDQpUaGFua3MsDQpUZWphcyANCg0K
PiANCj4gVGhhbmtzLA0KPiBBcmF2aW5kLg0KPiA+DQo+ID4gQXMgaXQgaW52b2x2ZXMgZHJtX2Ns
YXNzLCBpdCByZXF1aXJlZCBtb3ZlbWVudCBpbiB4ZV9kZXZpY2UgaW5pdCBmbG93LA0KPiA+IHBh
dGNoIGZvciBzYW1lIGlzIHBhcnQgb2YgdGhpcyBzZXJpZXMuDQo+ID4NCj4gPiBBY3R1YWwgcGh5
c2ljYWwgbWVtb3J5IHBlciBHVCB3YXMgZGVwZW5kZW50IG9uIGluZnJhIHBhdGNoIGZyb20gUnVo
bCwNCj4gPiBNaWNoYWVsIEosIHNvIEkgaGF2ZSBhZGRlZCBpdCBhcyBwYXJ0IG9mIHRoaXMgc2Vy
aWVzIHRvIHBhc3MgdGhyb3VnaA0KPiA+IHByZS1tZXJnZS4NCj4gPiBQYXRjaHdvcms6IGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTE3MTI2LyNyZXYzDQo+ID4NCj4g
PiBDYzogQXJhdmluZCBJZGRhbXNldHR5IDxhcmF2aW5kLmlkZGFtc2V0dHlAaW50ZWwuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5j
b20+DQo+ID4NCj4gPiBUZWphcyBVcGFkaHlheSAoMyk6DQo+ID4gICBkcm0veGU6IFJld29yayBt
dWx0aSB0aWxlIGRldmljZSBtZW1vcnkgaW5pdGlhbGl6YXRpb24NCj4gPiAgIGRybS94ZTogUmVn
aXN0ZXIgZHJtIGRldmljZSBwcmlvciB0byBndCBpbml0DQo+ID4gICBkcm0veGU6IEFkZCBzeXNm
cyBlbnRyeSB0byByZXBvcnQgcGVyIGd0IG1lbW9yeSBzaXplDQo+ID4NCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3JlZ3MveGVfZ3RfcmVncy5oICAgfCAgIDIgKy0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2JvLmMgICAgICAgICAgICAgfCAgIDggKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2JvLmggICAgICAgICAgICAgfCAgIDIgKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jICAgICAgICAgfCAgIDggKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZV90eXBlcy5oICAgfCAgMjAgKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3N5c2ZzLmMgICAgICAgfCAgNzQgKysrKysrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3Rfc3lzZnMuaCAgICAgICB8ICAgMSAtDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90
eXBlcy5oICAgICAgIHwgIDIxICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRl
LmMgICAgICAgIHwgICA2ICstDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tbWlvLmMgICAg
ICAgICAgIHwgMjc5ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21taW8uaCAgICAgICAgICAgfCAgIDQgKy0NCj4gPiAgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3R0bV9zdG9sZW5fbWdyLmMgfCAgMzAgKy0tDQo+ID4gIDEyIGZpbGVzIGNoYW5nZWQs
IDI5MSBpbnNlcnRpb25zKCspLCAxNjQgZGVsZXRpb25zKC0pDQo+ID4NCg==
