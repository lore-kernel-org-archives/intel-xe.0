Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 449CDEB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Aug 2023 18:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343510E0E5;
	Thu,  3 Aug 2023 18:46:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB79710E0E5
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Aug 2023 18:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691088418; x=1722624418;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E6eck9ldTH29GCmDVSEnj78bnJqBVnaSiDEjzLhIH8k=;
 b=QNvQMXYVZxomCf4kFh/8YeNlxWQpxmSDu2EiggQ2wxhjob8O4GNLKzSC
 0G12XR9f5KEFBIsstx1EjcVscUgVVdgZ7a2gpxGagBFVEzv2UMKxHD2f3
 dHfQprpq4wfSAQxYFm7+evxvzAD3+0uiCtNYEc18PnXCk96mYKeqHlO4u
 8sCeNw2DL8TP7Yu2KbPGAvlwn8kV40hgDcmvV73Gw2vrBzoGMBvKWGKpN
 xRC4JcbnG0DvgbMzxFRLcqkkb95kfnC3XMaBo/cGMGKqXLnxocF2RsSFZ
 QczxioFDRr8fcZe3O9skLp5CzdCvvPoIMkUe/XfQvPJsJkOi3KWhTxRer w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="354903474"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="354903474"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 11:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="795091546"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="795091546"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 03 Aug 2023 11:46:34 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 11:46:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 3 Aug 2023 11:46:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 3 Aug 2023 11:46:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 3 Aug 2023 11:46:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJmpFxVQQclN6QRJZKY6GXRzQsO+474XORwFzaag2CC3yP+kTngMvG29mnwJTviA0wvwgV3Vd9px+UiW+BK50YhlhaMZ9SsT1zgZB+lffiT3Ncu99MXT3nnBB+GTZYk48srja20QeCffvxvh0yls0Jj0Iex0hVvMqjrR0+Q4tHKO8R8VXJ3j045lOSpPw42QoWo+Xe+6szXg7RYVYk4k81O/6JgwRaZ7VCI73/H6YOrA/QFIcUndlxBH0K7yMapef2EfjTryvvs7g90gcqNC7ZUX1m/VmmdvR0H19Vi8niqRpkwIF0oY61XMcFDyhjmskNMnnHGi9nRUrLKwr6NLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6eck9ldTH29GCmDVSEnj78bnJqBVnaSiDEjzLhIH8k=;
 b=cpWwfGp/EgDj65tpc8i0g8/MSg0MyPm1IIXSgw/ubXQ9/lqhQZvldubs8CGOSD+h9AMY7wW94mrPWxtHK+7XLkLZ1ozKHKQJTT29Ogu/ehY0nTY2Ing1SV7j+HwOw2hGavK7e/pEdjGo+HT8LXzFomHX9ifCNzmzBJ6S/GFc4f3XDxiUlM7wBNK8NqpXvo0uXDYHas9tJdQ5MDxPR0aLfO2SUfRm3AF2fX1BOXm+/wI8xJW6Z9hu71A6/GXosFyGIlgFRq4JpO7Hf3YyWGvkc2yYDufPEVmmAKVtPXAHds3ICyxEWNNvGxXF+XpsWpu4gKCzXHJ3dy+2x38DdEUoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CY5PR11MB6317.namprd11.prod.outlook.com (2603:10b6:930:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 18:46:32 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::8e21:274a:64d1:5de%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 18:46:32 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [PATCH v4] drm/xe: Make explicit that exec uAPI expects
 canonical addresses
Thread-Index: AQHZxh92bPdwDQ4jdkqNBO/7McFcDK/Y444AgAAF04A=
Date: Thu, 3 Aug 2023 18:46:31 +0000
Message-ID: <6a0927734e6cd5ab48d5f5ee447076834bf2f87b.camel@intel.com>
References: <20230803153016.94282-1-jose.souza@intel.com>
 <ZMvxIju06O/DNRel@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZMvxIju06O/DNRel@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CY5PR11MB6317:EE_
x-ms-office365-filtering-correlation-id: 70d19296-ab57-4741-9c1c-08db9451f497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LfzteZ3Jlz94uB0kGdN7JqjzxU93Ns5eGUKaluHeEUBzhW4xvwSJ61ii1mXWswHLyk6GBAx02QRYz64V/jgJq8v+JPcWHurXSvZPzZVC9Zo/s+SJjJNwRTHq4fQd9a5W53gv6WfcBA//hM0QIPYb8I+YKVyKLSXVAznBXecUGKZOPX1M+snQZVtzvoHLLWrlLN/AoRQVvwzpf6cctoBiOAokq+8uPWav0dUyRe5oN5Hj/u59cOCLWVc+lS1RK1e/LdGAglG7kFGDp0ahbbS4bb3QB6qDNLhbYnezbNfxTigv7B94Z7UJu8+zCavdson8QUcjCYvKVZOSofrrSvghLwtXprvB2ZPLugSdCbZxwBu1qMfu2dBALAjGuCqcXH4dXSbdnuuW9wevrVePRs4UmZREXzBugoqndn74WUJDbql+xHZ+gPPj2HWCE+Q48PKnIdkA8QKobFmhCyml7P2X1H4l2zXXPxFWcbrWzLwrumYXkfEJdojhlEyB1R1tWj6XHpz8LJfFhwX6gmO5/WpTLb/uablrHEFXptm2/NlseQ0XpGAV3a+MPYtRQnMpCBWLnYSR2GTPoW5obX+K8pdU0rH/oBTebcDtniMka5jiD26r3WKl2yvfsG3sxbglrwXF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(36756003)(38070700005)(86362001)(37006003)(54906003)(478600001)(38100700002)(82960400001)(122000001)(66574015)(2616005)(6506007)(186003)(83380400001)(26005)(6862004)(41300700001)(8936002)(8676002)(6512007)(6486002)(71200400001)(316002)(66476007)(4326008)(66446008)(64756008)(5660300002)(6636002)(66946007)(66556008)(76116006)(91956017)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVd4L01lamtBTU9TWkw3OGpjR0ZaT3B3MXRMVmZYMnhabGV4bEZpeGg4L1ZT?=
 =?utf-8?B?cEZkbnVuTWdRc0kyOVg4QWRtMzFFUVFZNFlzdHdhaFl4OXZBOWVDQm9ObXhF?=
 =?utf-8?B?R2tPeUt3NGFaY1dwa2plUUtidWptZkUzNEJJalY4OXFtVXowSytrenR6VzBQ?=
 =?utf-8?B?VjUxbDNkYTFaeTRNWGlWT21HK3dxQ3JmcWphOTRGb1AvVzBIRGd1L1JDSWZQ?=
 =?utf-8?B?Vjhrc0RoZHl3SytCbkxwN2ovb3ZSZm5HK2I2WktzU0ZWYjJXcmxnU2NKU3I3?=
 =?utf-8?B?Nmd0V2QxTTJQQTNSc3pka3g3MjBIOFdVbWFtWFN4cGl2dGRUdUFmb280eUd3?=
 =?utf-8?B?dnFpeU9mUGNiYThDS1V5a0NSU2FnclNIQ05ZS012SlNoczZaLzdCRE5XcExB?=
 =?utf-8?B?aHAxWE9kOUNCelJQZUoyYnJqZVFCU0FYN2ZabGZLWkhQMTVia2FoUE45eVdt?=
 =?utf-8?B?dkdZaSttKy84UEhHNU5KOHo0NHpxa0JQcXlEVUI4K0lOcXVncUcwb3NXZnZ1?=
 =?utf-8?B?Sy9RUEdDQmVDUkZHZWxscXhXYU5UZFRWZkZhQ01VdDA4TFFZU1l3UXNwb2lY?=
 =?utf-8?B?S1BteGRjY0NvYld0OGFZaEdZQUp4U3hzZlZUYWxKY0RpTjZLbU5TTTVmcFFM?=
 =?utf-8?B?ZllUSlhlRzNQY2JtOHc5cVdqQmhhKzBxRFNFMGFyeExBTFVQNC9uaVhIZVdp?=
 =?utf-8?B?SzllR1k5Q1gwMzg3KzJ2TTR1Y3E0TVpvTTZ5ZFNrVjZTdzdDclo0UElTY24v?=
 =?utf-8?B?bnNuT2FzWDFnU0ltSEhBTUU2T0ppWU9vQ1BjTVcxTFVYZURJZFRjSlN1TDE3?=
 =?utf-8?B?NERQTGFhR3JzR1lmR3F0RjV3bE1QKzYzL3lWcGdBcGV2S2laWnkrcTRYYmlk?=
 =?utf-8?B?N3BRbkFnNkF4QUVCRGw5dmxzRWJ3aEpuSVd2VTRaMklKdThCei9GVWppTjcv?=
 =?utf-8?B?dU1PZElqOVM1bGgyNnBSYjQvTUN4ZGNBWkFjMk02aExVdmVDWGs3SmVWbWlU?=
 =?utf-8?B?Wlh4b3pURlBmT1h4RGlnakR0Q0d6YTFDNmo0akx2SENLQ0NJYVJMdWlCVDVo?=
 =?utf-8?B?amp4emhWd3Z1dWtRU1I2MGVSeGU0d3JkS1dxRmU0bjBGYXMrZDEyWlQ3dGZa?=
 =?utf-8?B?RnYrZjdyUFhEc3djd2Jva3ZGbGw3aU5wUXdQWWNHU201dk0rY2FWazZuaUdz?=
 =?utf-8?B?ZnFwajQvWlFBYWxOL1JEY3NRazF5R29jZFhibkVJa1BkcnNIMXU5ekRxZzhO?=
 =?utf-8?B?NDV2ejNPanZsdkNLTFBzYzZLUUpZRzhzV1FaQzZ4cVBha2JNVlhUZzlYaHNY?=
 =?utf-8?B?UDJDK0dUUCs1SjF0dkhDRVlVWTVPNVRVWU4xMDQ5ZjBDSDhNL2txYmRzTWt6?=
 =?utf-8?B?eEt1dFoyRE9ZZlA5bmhRVU9UOHFUL2o2OUFBZEl4VVl0UEdkZDE2WGNsZHVF?=
 =?utf-8?B?TmxWS0xCT29vSGViVnRmalVVNXFSMVNuQWJDVW9rakpoK3Q4QnVrVzl0TytO?=
 =?utf-8?B?SG1CeCtGaGRZWlAwNVdVVU1JK3ZMMW9nekxSSUtxVkFqUW9uNkhXRHhKMjNP?=
 =?utf-8?B?UXdSb01ZazQ5MFo1UDlPdlJZSVcrTHppbDRweEhia2Z6R2c3ejlLUWw0NzJV?=
 =?utf-8?B?cDZtdndZWjlQUzdsZkkxbXdkSVJsWjNDemZLWkhpek5zMndrOHRWQ3hKdDEx?=
 =?utf-8?B?Z1BLMUFxZkZYcUdSODcxSDZVdklqdDNEWDFJMFpQOXFhcGdQZnJ4YlNSM1pm?=
 =?utf-8?B?S0ZybmZrTmo1emdYaEVMUnM3RjdtME9JdUVSNE9vUDBBN0lXR1Z5WHBKQVJj?=
 =?utf-8?B?TUdSRkJLaWFUbGdReTdjZnNBM2hVTnpvOTNweFpGaVFhNGNLem55OHFxUEdy?=
 =?utf-8?B?alRUc004NFdDRzBQMG1FK1hXcDhLRm9ocXVIVFJTU2ZwK012eFVSVDB3Y1VR?=
 =?utf-8?B?ZEgxdUV2blBRMHFCNVhiNnYxc2hxbStCdkNqTXBpODRodjNlTmN6OVNOODlV?=
 =?utf-8?B?RDZQL2FhMEFlNEhFRDdla05zNjVrV3V3SUZyYWJKbzFuWkEvODhPTWswWDZW?=
 =?utf-8?B?eVhFeW90VzZJdXJkeEVtcGF5OHFnek1lbHFBd0RVSDkrSWY3YmhpdlJRUTdV?=
 =?utf-8?B?N2RHV0JXdlhkNEEwTGpqdE95YnJiM1RQQ09MbHpiTlNGbFFQNlE0bTczbHlm?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <813AFDF08A286748BC56BD7FBEED4452@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d19296-ab57-4741-9c1c-08db9451f497
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 18:46:31.9550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UWBVbGss2EBgAdSGT4Qvad7vgh4MQxBcf+UTClSCAXnDQTp5lWcKwWndmeBp6L0VnvYEIV/XWhrNqPI1GxA+Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6317
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4] drm/xe: Make explicit that exec uAPI
 expects canonical addresses
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

T24gVGh1LCAyMDIzLTA4LTAzIGF0IDE4OjI1ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUaHUsIEF1ZyAwMywgMjAyMyBhdCAwODozMDoxNkFNIC0wNzAwLCBKb3PDqSBSb2JlcnRv
IGRlIFNvdXphIHdyb3RlOg0KPiA+IFRoZSBiYXRjaCBidWZmZXIgYWRkcmVzcyBpbiBleGVjIHVB
UEkgaXMgdXNlZCB3aGVuIGVtaXR0aW5nDQo+ID4gTUlfQkFUQ0hfQlVGRkVSX1NUQVJUIHRoYXQg
ZXhwZWN0IGNhbm9uaWNhbCBhZGRyZXNzZXMgaW4gZnV0dXJlDQo+ID4gcGxhdGZvcm1zLCBmb3Ig
Y3VycmVudCBvbmVzIHRoZSBiaXRzIGFib3ZlIDU3IGZvciBQVkMgYW5kIDQ3IGZvcg0KPiA+IG90
aGVyIHBsYXRmb3JtcyBhcmUgaWdub3JlZC4NCj4gPiANCj4gPiBTbyB0aGUgc2FmZXN0IGFwcHJv
YWNoIGlzIHRvIHJlcXVpcmUgY2Fub25pY2FsIGFkZHJlc3MgZm9yIGFsbA0KPiA+IHBsYXRmb3Jt
cyBzdXBwb3J0ZWQgYnkgWGUgdG8gYXZvaWQgdUFQSSBicmVha3MuDQo+ID4gDQo+ID4gdjI6DQo+
ID4gLSBmaXggY2hlY2sgZm9yIG5vbiBwYXJhbGxlbCBlbmdpbmVzDQo+ID4gDQo+ID4gdjM6DQo+
ID4gLSBmaXggc3R5bGUNCj4gPiANCj4gPiB2NDoNCj4gPiAtIHJlcGxhY2UgWEVfSU9DVExfRVJS
IGJ5IFhFX0lPQ1RMX0RCRw0KPiA+IA0KPiA+IEJTcGVjOiA2MDIyMyA1OTQ3NSA0NTcxOA0KPiA+
IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiBDYzogVGhv
bWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgfCAgNyArKysr
KysrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaCB8ICAyICsrDQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMgICB8IDE2ICsrKysrKysrKysrKysrKysNCj4gPiAg
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCAgICAgIHwgIDQgKystLQ0KPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZpY2UuYw0KPiA+IGluZGV4IDc2NmRmMDdkZTk3OWMuLjlhNDk5NTMwNDMyOGUgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+ID4gQEAgLTUwMCwzICs1MDAsMTAgQEAg
dm9pZCB4ZV9kZXZpY2VfbWVtX2FjY2Vzc19wdXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4g
IA0KPiA+ICAJWEVfV0FSTl9PTihyZWYgPCAwKTsNCj4gPiAgfQ0KPiA+ICsNCj4gPiArdTY0IHhl
X2RldmljZV9jYW5vbmljYWxfYWRkcihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTY0IGFkZHJlc3Mp
DQo+ID4gK3sNCj4gPiArCWNvbnN0IGludCBoaWdoX2FkZHJlc3NfYml0ID0geGUtPmluZm8uZG1h
X21hc2tfc2l6ZSA+IDQ3ID8gNTcgOiA0NzsNCj4gDQo+IERvIHdlIGhhdmUgZGVmaW5lcyBmb3Ig
dGhpcyBzb21ld2hlcmUgaW4gWGU/IFdlIHByb2JhYmx5IGRvLg0KDQpDYW4ndCBmaW5kIGFueS4N
Cg0KVXBzdHJlYW0gaTkxNSBkb24ndCBoYXZlIGFueXRoaW5nIGhhbmRsaW5nIDU2Yml0cyBjYW5v
bmljYWwgYWRkcmVzcywgQWdhbWEgdmVyc2lvbiBoYXMgcHBndHRfbXNiIGluIHRoZSBpbnRlbF9k
ZXZpY2VfaW5mby4NCkkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBzdG9yZSBpdCBpbiB4ZV9ncmFw
aGljc19kZXNjLi4uDQoNCj4gDQo+IEFsc28gaXQgc2hvdWxkIGJlIDU2LCByaWdodD8NCg0KeWVh
aCBtaXNzZWQgdGhhdCwgd2lsbCBzZW5kIGFub3RoZXIgdmVyc2lvbiBhZnRlciBnZXQgZmVlZGJh
Y2sgZnJvbSB0aGUgZmlyc3QgY29tbWVudC4NCg0KPiANCj4gTWF0dA0KPiANCj4gPiArDQo+ID4g
KwlyZXR1cm4gc2lnbl9leHRlbmQ2NChhZGRyZXNzLCBoaWdoX2FkZHJlc3NfYml0KTsNCj4gPiAr
fQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmggYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gPiBpbmRleCA3MTU4MjA5NDgzNGM2Li5hMDYx
YjM0OGYyNWUyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Uu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiA+IEBAIC0xNDMs
NiArMTQzLDggQEAgdm9pZCB4ZV9kZXZpY2VfbWVtX2FjY2Vzc19wdXQoc3RydWN0IHhlX2Rldmlj
ZSAqeGUpOw0KPiA+ICB2b2lkIHhlX2RldmljZV9hc3NlcnRfbWVtX2FjY2VzcyhzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSk7DQo+ID4gIGJvb2wgeGVfZGV2aWNlX21lbV9hY2Nlc3Nfb25nb2luZyhzdHJ1
Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ID4gIA0KPiA+ICt1NjQgeGVfZGV2aWNlX2Nhbm9uaWNhbF9h
ZGRyKHN0cnVjdCB4ZV9kZXZpY2UgKnhlLCB1NjQgYWRkcmVzcyk7DQo+ID4gKw0KPiA+ICBzdGF0
aWMgaW5saW5lIGJvb2wgeGVfZGV2aWNlX2luX2ZhdWx0X21vZGUoc3RydWN0IHhlX2RldmljZSAq
eGUpDQo+ID4gIHsNCj4gPiAgCXJldHVybiB4ZS0+dXNtLm51bV92bV9pbl9mYXVsdF9tb2RlICE9
IDA7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jDQo+ID4gaW5kZXggOGE1YjYxNGRmMDkwMC4uNGY2NTFh
MDQyZTU2MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jDQo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYw0KPiA+IEBAIC0yMjksNiArMjI5
LDIyIEBAIGludCB4ZV9leGVjX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkNCj4gPiAgCQkJZXJyID0gLUVGQVVMVDsNCj4gPiAg
CQkJZ290byBlcnJfc3luY3M7DQo+ID4gIAkJfQ0KPiA+ICsNCj4gPiArCQlmb3IgKGkgPSAwOyBp
IDwgcS0+d2lkdGg7IGkrKykgew0KPiA+ICsJCQljb25zdCB1NjQgY2Fub25pY2FsX2FkZHIgPSB4
ZV9kZXZpY2VfY2Fub25pY2FsX2FkZHIoeGUsIGFkZHJlc3Nlc1tpXSk7DQo+ID4gKw0KPiA+ICsJ
CQlpZiAoWEVfSU9DVExfREJHKHhlLCBhZGRyZXNzZXNbaV0gIT0gY2Fub25pY2FsX2FkZHIpKSB7
DQo+ID4gKwkJCQllcnIgPSAtRUlOVkFMOw0KPiA+ICsJCQkJZ290byBlcnJfc3luY3M7DQo+ID4g
KwkJCX0NCj4gPiArCQl9DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCWNvbnN0IHU2NCBjYW5vbmlj
YWxfYWRkciA9IHhlX2RldmljZV9jYW5vbmljYWxfYWRkcih4ZSwgYXJncy0+YWRkcmVzcyk7DQo+
ID4gKw0KPiA+ICsJCWlmIChYRV9JT0NUTF9EQkcoeGUsIGFyZ3MtPmFkZHJlc3MgIT0gY2Fub25p
Y2FsX2FkZHIpKSB7DQo+ID4gKwkJCWVyciA9IC1FSU5WQUw7DQo+ID4gKwkJCWdvdG8gZXJyX3N5
bmNzOw0KPiA+ICsJCX0NCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAkvKg0KPiA+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3VhcGkvZHJtL3hlX2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0K
PiA+IGluZGV4IDg2ZjE2ZDUwZTljY2MuLjQ3NzA3MmZkNmMyMDcgMTAwNjQ0DQo+ID4gLS0tIGEv
aW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0veGVf
ZHJtLmgNCj4gPiBAQCAtODY1LDggKzg2NSw4IEBAIHN0cnVjdCBkcm1feGVfZXhlYyB7DQo+ID4g
IAlfX3U2NCBzeW5jczsNCj4gPiAgDQo+ID4gIAkvKioNCj4gPiAtCSAqIEBhZGRyZXNzOiBhZGRy
ZXNzIG9mIGJhdGNoIGJ1ZmZlciBpZiBudW1fYmF0Y2hfYnVmZmVyID09IDEgb3IgYW4NCj4gPiAt
CSAqIGFycmF5IG9mIGJhdGNoIGJ1ZmZlciBhZGRyZXNzZXMNCj4gPiArCSAqIEBhZGRyZXNzOiBj
YW5vbmljYWwgYWRkcmVzcyBvZiBiYXRjaCBidWZmZXIgaWYgbnVtX2JhdGNoX2J1ZmZlciA9PSAx
DQo+ID4gKwkgKiBvciBhbiBhcnJheSBvZiBiYXRjaCBidWZmZXIgY2Fub25pY2FsIGFkZHJlc3Nl
cw0KPiA+ICAJICovDQo+ID4gIAlfX3U2NCBhZGRyZXNzOw0KPiA+ICANCj4gPiAtLSANCj4gPiAy
LjQxLjANCj4gPiANCg0K
