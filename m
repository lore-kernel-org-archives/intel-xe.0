Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46BAC46CA1
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 07:06:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD4610E423;
	Thu, 12 Oct 2023 07:06:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3247D10E422
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 07:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697094408; x=1728630408;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jo8UIT1KAzCHHCiRFI+tRV2/mtw4MV6wG2VzPKfW+3I=;
 b=V3JPHlcRJjd1IAUCJUBRxBOnru5iavBlYj1sdvnGiMVjtIQj4vnGrI26
 axYz1bYbiHbazli+bXYAMGHyEv68gGv9PQgNBwUDINWAB9wQW811gg9KN
 eyu2ZO5JwYHCmNt4rmc48aWWKgKtBjwUOyvVr4vItiFh5Xzl9YwS09+gF
 tD6O0lSn6hMeY8+TiRb7Ar+R2Kon0HHq6V66/lm8RPi0ZIpIQg+6t7kbw
 Y1zGliOBFtuU1Tb6zGuh+bobel63thMRgjM0bxxE75+ThL6pvuRHgmWsD
 letHPQUyJfacHR6lYryqep+jwQUifnNEn4VFQFu4f2s3eN7zYhyCQaWV2 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="3440906"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="3440906"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 00:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730812415"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="730812415"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 00:06:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 00:06:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 00:06:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 00:06:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkPbv6nkcyjSrnflJSjN4SmuTzC7XK62zKpUeFNhnF4JBXMJM7ABvyhZnnooiYWi7IXb5ty46zmSsHtx54HfslQfC+Hq1f7ZTcquOllfXakhpBDYZA5/V27RyahZM6t+RJVvy7+2c+YPwXZ2BEhpxn2AbEzrCVptidVsp2fsQC5vo8kCC1T1PXXsdlHJvTZHQlO5LQCcBGd4yLrc3bwlLiHfNKYC3TgBaHSgx5Dp33GX/YXpC2b6a7akODhP8U0E2KV5nmlt+8bIGsV/4wBBtAJ9O7ML8phoKroeCDsOWZrYMM0S6Z/Y6CW9QOSLmjiGRcwGlgC8flr2T3F0dQCaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jo8UIT1KAzCHHCiRFI+tRV2/mtw4MV6wG2VzPKfW+3I=;
 b=ly4UPnyDRNCfU8jKVQCPS268Jsz9mITGdhMpbbeGxG9JQq8jwiWCvOpS1KjDFvknMAY18NeVKtQJitwZ2HSP0suA277FJv0/vXldsY6JGzzNtKXyXwZj+zLSKQgc5Rk8T2MhH1b/LHgJScIlyFnC8iOQKTtixsCJ4iGt+C7T0F3GFsd0c4WsVEXQ3W0H3dIF+OEDxO4PjEpDMEOKcBNGo38WlTmXjemCEMcu1xrQj4foKTFycIDTSeUZeQdUlc9vwjnjPwTPLEuRvyYTplAb3bdKEG+bn3qWwuxhycv0LPPXomxURhv29jHyd5gHH0RwXM5rpeCVcO9ePPpOcfMMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ2PR11MB7504.namprd11.prod.outlook.com (2603:10b6:a03:4c5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Thu, 12 Oct 2023 07:06:44 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::3c89:fe31:95fd:c2cf%5]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 07:06:43 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [PATCH 0/2] Backport including i915_active.h in
 intel_frontbuffer.c
Thread-Index: AQHZ9P3dXvhtkTjE60q6YI0l6NQl6LA2E10AgAA6YACADkuuAIABMeaA
Date: Thu, 12 Oct 2023 07:06:43 +0000
Message-ID: <399e847fe364b9b97ae9a5f681710b66044e30b7.camel@intel.com>
References: <20231002065802.3609656-1-jouni.hogander@intel.com>
 <87cyxxijyf.fsf@intel.com>
 <69012691aecbdb459d37451827900f7b415ba3d8.camel@intel.com>
 <878r894909.fsf@intel.com>
In-Reply-To: <878r894909.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ2PR11MB7504:EE_
x-ms-office365-filtering-correlation-id: d892aaa1-294b-4c91-baea-08dbcaf1caa1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pb1jaKGSw3YJCy8b6Ci4uNAPZz9/pKuS3xmcCElGsQSxfzVlf1TdikCLDHLY8so3MJtHMtI/P46blP/93SXv3WQwKYePukeOQPW/mK6lrvSdCTyfFG66/+dANJtERwJkWwAEp3dBd6mM8ZiRVqOfbh5MRmI56Rrv8RfTC2rdngMfqUxb6YVoOrpyJeLI4mWttLYangd++tSTyTqZqCBlbsTc3RizNelf386h3dTGKlf3ox2AeoczzX/KK8TxmBEaxinjlpLeBCjPPkZkc7fbpJTws5tMWc0ecrYPgEa5/afT20gZlmkcYiKuiFgfshcM7I6FLsC0scJdUEIFzaOuxQZy2fd1oogdOkddQ9G60v+pfZgsV6fsImFwp6J8irFomxWwq0oP9fByI/g+lh+METZKa+h10xzIqdAGpkKe3aO42dtnSxbApcJo8ti8QthT0Mo8i22j8kj6rCncm2D3aZlgZgLA02EBnBDS0YzNWF21h29fbdgj/kOY/bX8DmG1kq11xQ1iKU5wOt8CRwgrFbmxIkkqe07G+GaBRKMzdStXMBpt1IeT+2eCfUWPrInHTYgfjrnd7cYb+/BQln15GjKQbq7rLIAaaIlbGa9XkVQVNs0keJ8GYGQZ4kX3H2Fp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(376002)(366004)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(26005)(86362001)(36756003)(122000001)(6512007)(107886003)(82960400001)(38100700002)(2906002)(2616005)(4326008)(8936002)(5660300002)(6486002)(478600001)(8676002)(71200400001)(66946007)(66446008)(6636002)(64756008)(76116006)(110136005)(41300700001)(66556008)(66476007)(91956017)(316002)(38070700005)(6506007)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFRDczZ1STBwSjl4ZHN1bTlBQVEwK2doRzQyU0N2Z1hPVEFOUmhZcmJRNzF4?=
 =?utf-8?B?cHg4NXJzMGNkSGxFdzR5dEwrRG9Ld1d3N0pWa25lNk83RUllRFNJS2NUbE9C?=
 =?utf-8?B?MHdDMWN1c3AvVGFvamtyQjlyNzNwRDdSUmxZRG5MR0ViWldOdDNxQ1RDWkRN?=
 =?utf-8?B?SVAxWk1id2VBU1B4VW4vVTAxcXlWRVVab0xjMlFVRmVhSU9Jak96cStVdU9r?=
 =?utf-8?B?MGZ6N0JjRVk0djJLamdkSktCRlN5bFBEY1VxN0xHR1lhZjI5d1hyb3h1V2lv?=
 =?utf-8?B?cGEwQzd6dVZIVGY0bWVFTkVQcncyRnVLR0NTSFRjUVBpVTlqbFhMbzloU29Y?=
 =?utf-8?B?WVp1Um5PRkhKbzhSVkZMenU4cHdVWit1M3hIdThpSWErV1A3d0tVSTNOMVZx?=
 =?utf-8?B?UlAvb3BHU2tadVpGNCswM1pEWXp2OE1POFFWZzUyUW9seWdvemVTa1VTRDN5?=
 =?utf-8?B?MkMxSGxXcHZjNjFldTVSNTZoaGVJalNkclVSbmVPSENjR2JiWGo0ZDV1aXpr?=
 =?utf-8?B?UWpTMDNCS3NiRTlWZWVDNkx6ZDFFYnp1TUs3aUtHNmpwT0tkMG9OK2hlMXNC?=
 =?utf-8?B?enZ4eWU5UnRRS3BscVN3QnR4a0Ryc3FVSmpFcFVTNTBnUWlRNGcwNWFkNXA1?=
 =?utf-8?B?RGE1VW5VeTE3MUh0ZktIMXdjemhzbkVQVDZUZ2haNHRlNlJSWmFmZi81dUJC?=
 =?utf-8?B?TlBSVjBsaWdoQ1VmSmdBR1pRUmpUQnZQdUZlR3l4UDRFYi9DeG8yUnk1ZVZr?=
 =?utf-8?B?UWZvWWN5dmYwdG56Y2xPM0lCcll3enhOeVl1VDhVckhWc1BxVUFwYWppTklG?=
 =?utf-8?B?S3NJb044cyt0UENPN0Z2eVRtQ05RWlRkMWQwM01td0kzVjFPdW54ckpwQi82?=
 =?utf-8?B?ZnVXV1Y1RUl0dnh5ZTlPK0hzUVI5cHBJT2w2cEdjUSsyQTlwU1YrWjhKUW5U?=
 =?utf-8?B?QU1zdWdyV3hKVnF4SFljSFBJaUxJSWJldXBLVDJhVm9IMGczSjg1MkFYYVFj?=
 =?utf-8?B?UEVRWWNlaEc5TEtvVEFLaGlhNGlaZ1dPRjM5czBxbmNHT1RuV0t6SkZ4NUxW?=
 =?utf-8?B?bXN4RkdENm5VK05Qb24vcWpPNCtIU1lsaU1XeC94YkRCdk9hVWRUKzhrNFhI?=
 =?utf-8?B?cDRmNDVtYnZyL1Y1ZXQwSkcvTEZnaFd2dHBGVTZqRXJHOVJYL25WbHBORFBE?=
 =?utf-8?B?cGZKd2xWUmg3T0VOaFZsMUZjWmpjUis1dEs3d2lGb2hScFp2ZnR5MzJDdG91?=
 =?utf-8?B?bDBPOEJ6TlRBR0JqMW4ydTNQSFZpaE1uczhTYW5CbG9QdEduNGRWWkg2NkVu?=
 =?utf-8?B?MDlTczRuUkZnL1lQTkZFeFRMRy9zRzQ1ODhYbGlmV29RYmhBN1ZwZWJ1SWVz?=
 =?utf-8?B?NU9md2lHM0s0R0M0N1JOd1pwRXkwN25BM09kdUI2OEVRWXY2a3o0ZUtLSXQr?=
 =?utf-8?B?MGZycGNVbU5nVjRCcmhKcncyWEVhRHRydXRiQnp6Y2xNQ2wybzByQzZQakxI?=
 =?utf-8?B?SEJ2QTl3SmUxVjJmZWdrN1IwTnpnVHVOQXBpaUlMdHV2Y0xaUFVhZFJCNW8v?=
 =?utf-8?B?MkVlaVcxWm1tWFhvdzRWbWFUZkY0clZUcWZDUGUvVmxGZE1HSWRDcjd5eGNM?=
 =?utf-8?B?YjBjUFEzKzhOSkFaK3BWYklHWDJHU0RhMXROS3JUT3Q1RDVCY0U1bWg3bG1h?=
 =?utf-8?B?ZnAyMW5qeUJIWXhtSUZmRGxDU2xaWElVaDZtcjdPTldJQ1M2WERUUlBGTFk5?=
 =?utf-8?B?RHltZGsxNG5jbVB3ZUhxa2o4QnB6OGNUellhVFlWdzhxYU84NGQ4S0RPeVpp?=
 =?utf-8?B?eSszZmRESFU1NDVuY1RsOVovTjNNVDd4UWE5dDNXeEFLeEw1V2c0N3lVb0hu?=
 =?utf-8?B?bDZiMGdPd2Z6TFRROGhORC9rS3NDZktRT2MzZEx6WmhGZmwwUjNKZm0venEz?=
 =?utf-8?B?RFNUZ0pMNFFWOURTVkthOURhRzdaN2Z0dS9GejNHdkttOU5zbHNtVmN0U3Bv?=
 =?utf-8?B?aXlqN0d0MXFRcjFsZG15ajB0VnRTRjFDZU1UZ28zY0RReUFHSzhrN3hJMnp4?=
 =?utf-8?B?ZnZxODE0YWhkdGpDRzR0TlBvZVlramxFeDRUMEtra2xpR3JRem5ndVlxNWtz?=
 =?utf-8?B?NUk4NUpMa0RCYjhGTk9CL1hIellxM0Q2ZXZ4VUhZWmc2TkJzZFZMNlp1aTRM?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A6EE028E63003844805851AF256920A8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d892aaa1-294b-4c91-baea-08dbcaf1caa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 07:06:43.8316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f4h3K9xJiBwOab23lO/Z+7fFm+YpjwcJ/YUjFkAnHX1JFaKZansyOf6TsI5/5mw6SUN7v8zL7e6seHznTDgLHWrzrfZb3wC+OBEr1k6z4g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7504
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/2] Backport including i915_active.h in
 intel_frontbuffer.c
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

T24gV2VkLCAyMDIzLTEwLTExIGF0IDE1OjUxICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
T24gTW9uLCAwMiBPY3QgMjAyMywgIkhvZ2FuZGVyLCBKb3VuaSIgPGpvdW5pLmhvZ2FuZGVyQGlu
dGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gT24gTW9uLCAyMDIzLTEwLTAyIGF0IDEwOjA0ICswMzAw
LCBKYW5pIE5pa3VsYSB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMDIgT2N0IDIwMjMsIEpvdW5pIEjD
tmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiA+ID4gd3JvdGU6DQo+ID4gPiA+
IEluY2x1ZGluZyBpOTE1X2FjdGl2ZS5oIGluIGludGVsX2Zyb250YnVmZmVyLmggaXMgbm93IG1l
cmdlZA0KPiA+ID4gPiBpbnRvDQo+ID4gPiA+IHVwc3RyZWFtLiBMZXQncyByZXZlcnQgc2ltaWxh
ciBwYXRjaCBmcm9tIGRybS14ZS1uZXh0IGFuZA0KPiA+ID4gPiBiYWNrcG9ydA0KPiA+ID4gPiBm
cm9tIHVwc3RyZWFtLg0KPiA+ID4gDQo+ID4gPiBBY2tlZC1ieTogSmFuaSBOaWt1bGEgPGphbmku
bmlrdWxhQGludGVsLmNvbT4NCj4gPiANCj4gPiBUaGFuayB5b3UgSmFuaS4gVGhlc2UgYXJlIG5v
dyBtZXJnZWQuDQo+IA0KPiBJIGRvbid0IGtub3cgd2hhdCBoYXBwZW5lZCwgYnV0IHRoZXkgd2Vy
ZSBub3doZXJlIHRvIGJlIGZvdW5kLiBNYXliZQ0KPiBsb3N0IGluIGEgcmViYXNlLCB3aXRoIHRo
ZSB3cm9uZyBvbmUgbGVmdCBpbiB0aGUgdHJlZT8NCj4gDQo+IEFueXdheSwgcHVzaGVkIGFnYWlu
Lg0KDQpUaGFuayB5b3UgSmFuaS4gSSBoYXZlIG5vIGlkZWEgZWl0aGVyIHdoYXQgd2VudCB3cm9u
ZyB3aXRoIHRoZXNlLg0KDQpCUiwNCg0KSm91bmkgSMO2Z2FuZGVyDQoNCj4gDQo+IEJSLA0KPiBK
YW5pLg0KPiANCj4gDQo+ID4gDQo+ID4gQlIsDQo+ID4gDQo+ID4gSm91bmkgSMO2Z2FuZGVyDQo+
ID4gDQo+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPg0KPiA+ID4gPiANCj4gPiA+ID4gSm91bmkgSMO2Z2FuZGVyICgyKToNCj4g
PiA+ID4gwqAgUmV2ZXJ0ICJkcm0vaTkxNS9kaXNwbGF5OiBJbmNsdWRlIGk5MTVfYWN0aXZlIGhl
YWRlciINCj4gPiA+ID4gwqAgZHJtL2k5MTUvZGlzcGxheTogSW5jbHVkZSBpOTE1X2FjdGl2ZSBo
ZWFkZXIgaW4gZnJvbnRidWZmZXINCj4gPiA+ID4gdHJhY2tpbmcNCj4gPiA+ID4gwqDCoMKgIGNv
ZGUNCj4gPiA+IA0KPiA+IA0KPiANCg0K
