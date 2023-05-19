Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2723AC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 07:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C2710E5D7;
	Fri, 19 May 2023 07:43:26 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F25910E5D7
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 07:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684482205; x=1716018205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5qhv4vPdrKTuxr87TBwZDpMFobuUUtHHMGUlchgMgno=;
 b=ggcnS3QdmSBssg24Orob5uoGYf7JMmt0qd8rsZ8fPgTdIHZHPKveXOmy
 uxvIpS90Pi/R6+mTLJHcTShuBuEJ1wQCT5pSxZwX0Zj1RGFIGiUdBHCnQ
 PEURS2VrwlOjza10iQpLKxM/Fhgwdr9ttoVsPmFkri+ezIEZuG0xMkUiT
 Zo5/28wkAVaj9AXaVVsYfJ33yGGBmVmAbTCkUOTGOesIuzkNnf1d6rtmf
 xYaAqFULSbXVWAwwKDN9YyNADkzFGQAPHdFg1QGpYFxRa5caqJGAkHIL8
 AdVUFDz9diWVB487VRX/k4e1W3iJEmbjOB5q/JKOqFIiHzhkF5FR7aOYy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354661548"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="354661548"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 00:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846797584"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="846797584"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 19 May 2023 00:43:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 00:43:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 00:43:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 00:43:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 00:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Esx9S8zoIgVpyk0KhDHrTJdWHnkLAdBm1+4tspcqQT1+rc0EZZy5LOipczREG9KWU+pNpxq010O5nusqBivMlJCIwJEs2L3g1vbeMgv46OiXwvggYSmSgzkPzFlRPQrI3RjAUjMoLJoIr3nlsR332W/lLITkkvI6gumhfSLsogCyy6ekogrxqyvaoTaL7Hu4ugRxPLpte1ujyjqKJDZi5kGud0VQxkd0LxcvYlTsObF++p8k8e+UxCQnC7E8oh+9OeLNn+fomsblqqw1QtlqKXwworwIrf0XiDzMhdurNNj1ITR2DlefSu4SLPtr8IhRtbuEnzmvyU5voCfBGNvXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qhv4vPdrKTuxr87TBwZDpMFobuUUtHHMGUlchgMgno=;
 b=PJcUY+f8XUNZt6NDFv1JhmWLfI9+r/CcEhGBOaiqp72OS/mdRakRqt6fdvKS8t7O1c14iC5q5AcSDHEfKDEPKv6a1b4LO0P/FyMLxlzXI3Lnc0FoPCTZyZg78r18HUrpHf/bxpks9c3EpKgmsYMqRz7W0L1qo0rOHgy+GQT8hCl00ldgY8GgFu8UzBlbmGL7M9WVoCz7DPEtTyjnzzy4ubctV8zhZqkA8LvwbP9KxkBKBq0W7SQf2ip3gcP6RWZvvuLu5a2ZXe63PdaEq8JciGHnhIdtOkCHk3LC60b8lr2OHzkOkzWuMJjyYrLnm+DDdEJ9uAeO6OJblBt8KPOCJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS0PR11MB7190.namprd11.prod.outlook.com (2603:10b6:8:132::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Fri, 19 May 2023 07:43:16 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::2796:34e3:dbb9:fe97%6]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 07:43:16 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "rodrigo.vivi@kernel.org" <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH 0/4] Revert frontbuffer tracking removal
Thread-Index: AQHZhxIuMrtsMVU73UGtAvnLAOof169gdn0AgADGgoA=
Date: Fri, 19 May 2023 07:43:16 +0000
Message-ID: <981b59f8bf3676173f535eacebed881afc6f34c2.camel@intel.com>
References: <20230515094614.1850878-1-jouni.hogander@intel.com>
 <ZGaCDuMYN5Mt47tI@rdvivi-mobl4>
In-Reply-To: <ZGaCDuMYN5Mt47tI@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS0PR11MB7190:EE_
x-ms-office365-filtering-correlation-id: b51263b6-baf9-4269-5c8a-08db583cb507
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2snITTH7esPgV4FRwL/7oHrWaHfk9m6EHFNnQf1SbN50pzwQb8xvIl/Sb8fx4yV5hS2RgGJQsmu+vbcBcKw7nWD0dki7PMrfUqk9ISitFDwv1Vfg5iVG7htjI0oSD0brCNIEFuXdZ60XXp0wIPCd50Hp8jSBcXDcj3Fj8pYWYaFbI1bu5WYTVQgIIU/Mw199EjnXRyY+ybY4Xwr2hiUE+SHMKqXr2rDSJhkEgfoJzdY6GldNR21lJlxWVWUdwDIDWXZkxAHktr+32ju46GvBfg58ZEUpWfD8p1jOm9JTOpCuoJW3KfiXhERPf3+CyeMZmREMVJMP6Q1AISCU1KQAvP/+5xAJZeE8yUz9fbE37gLY1OOTUuNwlLQmbpHFxM47J7h5ASzfLn9hmTN+LdrM72ZLVA3pz+cnniqdG2PH0SdKRQdMRGl6iPIYOVdBzS2dyhBLF68/1mdSM7L/wooTgiDm4+mwZPcR56r5kWwlfwi8o5ypH2z/Sit5YCR4g395HDzYpXSHtky8YGtm1aDTysczO64dPkQwq+ll2pfMWWmXCglK08gZ526i2O/oPN3zh7LZFw/VrCl25vaxnSDBX03rCOJp6eT062IYv4sA7HL8yvr0Wh4p6AyaylZdwqWg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199021)(83380400001)(186003)(91956017)(71200400001)(66446008)(2616005)(54906003)(478600001)(6486002)(6512007)(6506007)(26005)(8936002)(5660300002)(36756003)(82960400001)(122000001)(6916009)(38100700002)(41300700001)(66556008)(66946007)(8676002)(66476007)(64756008)(76116006)(4326008)(2906002)(316002)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXlkTS9uekpQbndLeUlwVVBuWjF6OXBLR3FOV2NDS203NUhwUHQvb2JwN09w?=
 =?utf-8?B?NkpqOHlIdnJXdVRVTUNCQ1NxOWx6MlcrZGoyay96cU5qN0JWR1VoT1VIakor?=
 =?utf-8?B?NmZuL2U0U01Pd1VYbEE2VUQxblN3ZlBGb3ArUTBJQTZ6Z2JRTmFsMkdhTnZI?=
 =?utf-8?B?Y09QYVBvOWZHdTZNRjNhRjJtSW9MVnRDV2ZXVTBFbEtGT3ZtN29UQkY1ejFz?=
 =?utf-8?B?QWtzWVV2NHpXaHBNMnVzYnlEZjRUMzhTMHJ6cVM5c0puYkNtbTRiNi8xR0Nm?=
 =?utf-8?B?UmN4M0NLU25pSEZVcENXMTZBMjVVUHFvTjExNHBwNkFsa1A3VkRkRUNIMlQ1?=
 =?utf-8?B?S243Y0ZNZFRQUGdvSWo4YnNUY0JLaVZKMGtzenJyNVVVbUl3djhNeStJYzdU?=
 =?utf-8?B?R2JldUJtaVFoVTA0R3VvYU5scGxUK2p4YlpPeTJ4VHNHKzdBaXJrdlhBa0g0?=
 =?utf-8?B?b3ZCdlJSWGl4ajM0Tmd6Rlh2WVlsYUlraGRJQnVDZkZDODdJUURiMGdRQ3ZP?=
 =?utf-8?B?ZmVIU3N6TE9UUzJjUFA4NWduZEVIYzRGZk1uZms3QVI1WTZzanFON1ZKUjNs?=
 =?utf-8?B?RTdlQzlQTzIxZWcwSlM4bDZWV1BNa2FFUjNtUXA2UHl4VkNlSWxBVFVlMi83?=
 =?utf-8?B?V0FaZUl1OCsvckptZmI2cW03b0xLL2RCSkRud29qWjArdmh5dGZ0SmU4bTlY?=
 =?utf-8?B?ajZHSTNWdml3eXBGaVgvazJwVGN3Q0h6YVIwUjl0cjR0bUg5a2drY0ViS3J4?=
 =?utf-8?B?M3dvUXRKUC9HbTl6L2drZ3ZXL3BMT3FNZUV5RC9IYklOenBCU2RESDdWMkRm?=
 =?utf-8?B?b2tpcVZCWmtvSlRhMEZZTXJocHhnMlVMc0E5S0dmNHI0TTFtclVqMGgvdUY3?=
 =?utf-8?B?MkExRmoyZHlOQ1QwSjRycHl2L2oyemZWL240QjcxV2dOS2lraXlsTzBSYzl6?=
 =?utf-8?B?TDJBS2JJakt2MnZRSzBpWE1kZG03VHRnZHZmOWhOdnNoTWpvYXdJY3lhQkZs?=
 =?utf-8?B?TTVYRDMwU29zZFJzVkNjODZ6ZlI2M1ZvS3E2bVRucGwwTUFvTkJIUytNbFQ5?=
 =?utf-8?B?L1hwK0l0SFVzcEhSbFFiT0lHS1pRWkRzWHM3MzJJTXZlUndGZTVNZzVxZmp6?=
 =?utf-8?B?bk9nRldBQm9ZWjNZN0JEVGFQMEF4RUJ6WjFVZkl3TWlmMy81UWtkUHFxWWNm?=
 =?utf-8?B?cnBkakNYbFphRkt4b3YrU2wvcTVva2ZIVFNQZ3hKQ3F0Tmg2NXVpdm1hQmc4?=
 =?utf-8?B?R3E5enBodDFLNzQ1SERlbDAyUllEV3FRVURhcWN4cG5qY3AyU3hIdmY1TWRr?=
 =?utf-8?B?SjJwZDFhUS93R3RYekhteUgwazFzZHlabW1hZkJ0blJENCs1SWpTSjlVUDN1?=
 =?utf-8?B?cjNZaGFkdzJQcndhZ25YMDVRY2xaNlNDYXczcDQ2TWs5ek1lcDgvdVFoZmhG?=
 =?utf-8?B?U2dBcTFKdXgvWEJHRjN6MGVoa1dnQTE0RFdsWkkyRmVFTnhHS05Yc1lqdGx5?=
 =?utf-8?B?YkVnTVV3T3pGMWV6MHhKbExnTGcrMHE3amFJQ05SV1YvcUM2NVcraGRmVnd2?=
 =?utf-8?B?K1g5dUQxV0R5N3NGSkZrZUR5c2JjNkN4Y0Y4eVBUT21YLzV2c0p4dHliMDRo?=
 =?utf-8?B?Z2V4b0pjU0M2dFlkTTErNU9kM25tWmdCSHdoOXdxbFQvVlRJTmRFR3RXMld0?=
 =?utf-8?B?S3BCZUs5VkhQV2dYZ1lhcCtCNi9yQTZWTG1ZcTJSNzN3T0ZCSHlETnU3L2hY?=
 =?utf-8?B?WnZERTQvVzlTM1VValdVZkJGMnhOSWxmN2JzZmUxRGIvclljMVUvL2k1QUlN?=
 =?utf-8?B?bDkwcy9McFJMQVZhbWhUVmI2UkVQRFdyZGlxWWlXeHhUc1NuM1h3QXFSeUF3?=
 =?utf-8?B?YnVVZ01MOVdCOGxRRm05K0NLeWduckVjK3NVQ3owZldmWW9LVUlpMmk4N203?=
 =?utf-8?B?b3VUSzJ4dVJJK0o1Y0k2WUhjb25tcVRnL01DSTUyMTBmSWpXZVJIKzNETEs3?=
 =?utf-8?B?MThwZVI1bmh4U3RxWFhMWkdzVEk2cDV1cVNLRWVkK2lPNHhwSytHNVR0MWt5?=
 =?utf-8?B?d0FaWUt5ZVRLWUVXSDBjT1JuMExIOU8wakh0RHA3WDFpUXVHVHp0SUFHZzc2?=
 =?utf-8?B?TGpqRTlobjU0ancrc0dRQld1dGFmZlQxRUUvWG1abjRXRVdIeTBFN2xNcXJn?=
 =?utf-8?B?SlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75C13C9D9FD4D949ADD2191B04BECA2D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51263b6-baf9-4269-5c8a-08db583cb507
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 07:43:16.1155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZcgeuB1chywTY9mQHx3O38DzhmhYji6vjpuiUuvF6SI2GsdzLBpt8tHAGR1pYv43Uod8iyZEs0Bq7TYsx1uJP9TdsVdke8Rv716O0gttZJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7190
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] Revert frontbuffer tracking removal
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIzLTA1LTE4IGF0IDE1OjUyIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+
IE9uIE1vbiwgTWF5IDE1LCAyMDIzIGF0IDEyOjQ2OjEwUE0gKzAzMDAsIEpvdW5pIEjDtmdhbmRl
ciB3cm90ZToNCj4gPiBFdmVuIGlmIGZyb250YnVmZmVyIHRyYWNraW5nIGlzIHRhcmdldGVkIGJl
aW5nIGRpc2NvbnRpbnVlZCBpdCBpcw0KPiA+IHNlZW4gYXMNCj4gPiB0b28gcmlza3kgdG8gcmVt
b3ZlIGl0IGNvbXBsZXRlbHkgYXQgdGhpcyBwb2ludCAtPiBSZXZlcnQNCj4gPiBmcm9udGJ1ZmZl
cg0KPiA+IHRyYWNraW5nIHJlbW92YWwgcGF0Y2hlcy4gQWxzbyBhZGQgZml4dXAgcGF0Y2hlcyB0
byBoYW5kbGUgYnVpbGQNCj4gPiBicmVha2FnZQ0KPiA+IGNhdXNlZCBieSB0aGVzZSByZXZlcnRz
Lg0KPiA+IA0KPiA+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tPg0KPiA+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPg0KPiA+IENjOiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
Pg0KPiA+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiA+IENjOiBS
b2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+ID4gQ2M6IEx1Y2FzIERlIE1h
cmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiANCj4gDQo+IFJldmlld2VkLWJ5OiBS
b2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IGZvciB0aGUgc2VyaWVzLCBi
dXQgSSdtIGFmcmFpZCB0aGF0IHlvdSB3aWxsIG5lZWQgdG8gcmViYXNlDQo+IHRvIGdldCB0aGUg
cGF0Y2ggMiBhcHBseWluZyBhZ2Fpbi4NCg0KVGhhbmsgeW91IFJvZHJpZ28gZm9yIHRoZSByZXZp
ZXcuIEkgaGF2ZSBzZW50IHJlYmFzZWQgc2V0Lg0KPiANCg0KPiA+IA0KPiA+IEpvdW5pIEjDtmdh
bmRlciAoNCk6DQo+ID4gwqAgUmV2ZXJ0ICJkcm0vaTkxNS9kaXNwbGF5OiBOZXV0ZXIgZnJvbnRi
dWZmZXIgdHJhY2tpbmcgaGFyZGVyIg0KPiA+IMKgIFJldmVydCAiZHJtL2k5MTU6IFJlbW92ZSBn
ZW0gYW5kIG92ZXJsYXkgZnJvbnRidWZmZXIgdHJhY2tpbmciDQo+ID4gwqAgZml4dXAhIGRybS9p
OTE1L2Rpc3BsYXk6IFJlbWFpbmluZyBjaGFuZ2VzIHRvIG1ha2UgeGUgY29tcGlsZQ0KPiA+IMKg
IGZpeHVwISBkcm0veGUvZGlzcGxheTogSW1wbGVtZW50IGRpc3BsYXkgc3VwcG9ydA0KPiA+IA0K
PiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pOXh4X3BsYW5lLmPCoMKgwqDCoCB8
wqDCoCAxIC0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY3Vyc29y
LmPCoMKgIHzCoMKgIDYgKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheS5jwqAgfMKgwqAgNCArLQ0KPiA+IMKgLi4uL2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV90eXBlcy5owqDCoMKgIHzCoMKgIDggKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuY8KgwqDCoMKgwqDCoCB8wqAgMTkgKystDQo+ID4gwqBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiX3Bpbi5jwqDCoCB8wqDCoCA2ICsN
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYuY8KgwqDCoCB8
wqDCoCA3ICstDQo+ID4gwqAuLi4vZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZm
ZXIuY8KgIHwgMTI4DQo+ID4gKysrKysrKysrKysrKysrKy0tDQo+ID4gwqAuLi4vZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZnJvbnRidWZmZXIuaMKgIHzCoCA3NiArKysrKysrKystLQ0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9vdmVybGF5LmPCoCB8wqAgMTQg
KysNCj4gPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3BsYW5lX2luaXRpYWwuY8KgwqDC
oCB8wqDCoCAzICstDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nw
cml0ZS5jwqDCoCB8wqDCoCAxIC0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9jbGZsdXNoLmPCoMKgIHzCoMKgIDQgKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX2RvbWFpbi5jwqDCoMKgIHzCoMKgIDcgKw0KPiA+IMKgLi4uL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jwqDCoMKgIHzCoMKgIDIgKw0KPiA+IMKgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX29iamVjdC5jwqDCoMKgIHzCoCAyNSArKysr
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fb2JqZWN0LmjCoMKgwqAg
fMKgIDIyICsrKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3BoeXMu
Y8KgwqDCoMKgwqAgfMKgwqAgNCArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Ry
aXZlci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxIC0NCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfZ2VtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDgg
KysNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMSArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3ZtYS5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTIgKysNCj4gPiDCoGRyaXZlcnMvZ3B1
L2RybS94ZS9kaXNwbGF5L3hlX3BsYW5lX2luaXRpYWwuYyB8wqDCoCAyICstDQo+ID4gwqAyMyBm
aWxlcyBjaGFuZ2VkLCAzMjEgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+ID4gDQo+
ID4gLS0gDQo+ID4gMi4zNC4xDQo+ID4gDQoNCg==
