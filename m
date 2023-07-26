Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5426AC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 19:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2780F10E4B3;
	Wed, 26 Jul 2023 19:36:49 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF5C10E4B3
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 19:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690400206; x=1721936206;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uc9Mz7h9gricQcliStVrY4ZP0fG7MH5w84vKKtrt7J0=;
 b=lqgzg/3oWidoCD6snjQq1yaGBKK+jwPH996cmrQ6jFd5lxIFER2NnuuM
 8LK+If42ppaUqj3r8JcWjl56bVhAJdppneWj/lz1WVYDB+D5C7V74puQ/
 y27GiEN5nqEsUt+hGPJIzHyq0k5HMQJH4P5idY85uDDClXEi/n34HaPPg
 MY0Z+aot0mNLAfIRZPU7qtKXHAvh2mpLEhhglOOYlV/SGZJUTQv8Wi6Dc
 lhQTz7PmznH2rXI/mxUtd5JaMDz5avD1+8Hgjmga1M7bcESt1N0VB27av
 csbexKiv6e2BGZRd69uANf8bNy6njykO5eCw2hXqE7QMd45NGlXfZo933 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="370789594"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="370789594"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 12:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="676825489"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="676825489"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2023 12:36:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:36:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:36:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 12:36:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 12:36:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BzVWNyvcd8dPZ99jxcForgUDLzUdQeq9efwSycfB8IyyTRsF8p6ETrqtBYUlqTE9viLWFerlCiQ7+ZFud2PY3T2SNE66aiTSnUalAPwXPDMQXNM4FiRkRNsMxqpiKeMRaDh71W+/w1bkyBZMXlj7CpHTBoLlkeBG4BuX32IZDLU6DnqR6VxFwqEmJYulrbd2XpMxRGBXn7jWi67Gfn88dwV3KkIuZchV0auqDgL5z0kuev2wuVr4aXJ9eb4gKQ/5+f+Ql0IdBM0p/T+m4ZYmugxQ15yqn973r+xFGHru2ZA+vrY2Y2069/DG2WP34JCzkkuSNCxVK3NOEfYwcI+mJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uc9Mz7h9gricQcliStVrY4ZP0fG7MH5w84vKKtrt7J0=;
 b=HHmeCZKgVo80FPe97hX692Xj+VAJb6xEkoMwud5n85e0Gh5W3N95Dx/IXpjC3oPhEdsbhS7YoiYlrSDlw3gZRwq+s9eiUuabLfUkEhaHh0Q13R890ZxQTFbEN20FMHLvMOEZmFxZ8yecR3rkOYC/acrEGr2lyiFAzH7k6rcgR8QJDG6jfUyprKA3NeAbAOCU/ISEYJ18HM97jpLeLxby259jwgdaRbtYy3A/Y92Wr3kD1AgoXkKmaEAaADc3kuIVzXuf8iUai0KR8luvYQKp2cQtMl/1WGFXKOwgGFAZx/4v2qEpTFg9IRoZLIaEMO1ASYoVGCHNf2MmVRt2RUs9lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5411.namprd11.prod.outlook.com (2603:10b6:610:d2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 19:36:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 19:36:43 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 2/2] drm/xe: Update DRIVER_DATE to 20230726
Thread-Index: AQHZv/bwJ9XZen34qk2LJbzSZXYxV6/Mb+iAgAABKoA=
Date: Wed, 26 Jul 2023 19:36:43 +0000
Message-ID: <8595a7795831223e9a47f9480273a964b235c5fc.camel@intel.com>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <20230726192520.383531-2-rodrigo.vivi@intel.com>
 <ZMF0z80EUoiZ/xeC@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZMF0z80EUoiZ/xeC@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|CH0PR11MB5411:EE_
x-ms-office365-filtering-correlation-id: 943c7090-2301-4e4d-32df-08db8e0fa472
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1r09GU7dz8gn9QTV97La/+aj2F0vN9T+xZwwdb5opiY25kiJnPoOSX8dxuzpMhWJSrz2jKiyWMIGu/3He7sdVc7nOQ6k0BZ/3aYhCXsyC6Yua5zIRJHzQRvxq4vgTjvv8C7gVj042sfgQRESKarvSQzNyQWSc4XbklWxTtbLZVEF8yeBv7ovyGgVwZrYeRa2LXHNLZ75AkU9VUYBQg883suRD0B0Gf7A4LLkD9PFsBpF/lqUklg5ORRxjksOP7qLqLLLx5rmljFZZ1LT+YysmH52jMv1LQ5vcFcQBLdjQC3koJqdnCssEDg503KbVLAl29Zo/07rduqW3CREKNETL8T1fBkHPRmxD3XZNJrfmC7IQur5JXU93EUxinwzONF/g1iYWvaLaugsgcE/lIXEykC6iNWfSH+CNFtAXOmvVY4Y38fVPEkAk6FhKHvgsuIs+da0IpkG9XKT8FjIVkrPUgbBi+Ux1BUO9pRQlvsrKyaS2u6IteJcbzK5da+NtJQehAwo9e7eDDILhUW1CqivXo3gmRzqSUF5I4zQGSYkgygIfrgDEljRnsa4A37yMsZy5WL2XNgCTtJ4sII1Y+o269aItdjK3DSgQHVrseR1ciLE2TftAW3fJDP5Kv632XKs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(71200400001)(26005)(186003)(6506007)(2906002)(15650500001)(86362001)(6636002)(64756008)(38070700005)(82960400001)(36756003)(8936002)(8676002)(110136005)(478600001)(6512007)(6486002)(4326008)(38100700002)(122000001)(41300700001)(83380400001)(91956017)(76116006)(66446008)(66476007)(66556008)(66946007)(5660300002)(2616005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eDhhQUZVMzRtaC9ZUnczQ3BoelBEZkwyaFdUMEVPQ09GZUQ2MVYwSDlTQXF1?=
 =?utf-8?B?T0NXd1FtdlVGODRYSnM3WTFxYW1xaWc3NER1Q2JkK0V3NUpib3RNL0d0RVRD?=
 =?utf-8?B?QnErMHphdmQ1SzRQM1JYZzIrVnJNQnhzbnJDS2V4Rmx6b09TYmM5VnRYVFFz?=
 =?utf-8?B?OGx1d2E5WHRXMWdaZytndTlNMnJaQnprVWxRbTNWL0gyblZCcEFQU2JsZ3Qx?=
 =?utf-8?B?RzlqSlZqbnAyQWJXTnhMSDgxc01iTVY0VzJpdTNDcDRWbEZhR0doL0gyUXRD?=
 =?utf-8?B?N25oNHJMM2oramIzQURQQ1JFYVdJeVljcFRMUDErSUhkZlJaQ25tZFlBdkZ2?=
 =?utf-8?B?bnRhd1QxVDZONDdiazZyRVVzVFY5Q1k4bSsxVUkzZXpUVWo0VHJhbnlqODRD?=
 =?utf-8?B?a0xScDZyUU9kS2EzK1o4cUY1bGlEN1dYQkowbXF2M0hvT1FOUGdoR2dId2Rz?=
 =?utf-8?B?dlF1OS9rQ3Zxbi9YMHdTMlpIQ1ordUpYQ0UyNGNJV0dUREVWUGREM1M1aUtO?=
 =?utf-8?B?YlR1WDBHTlJCYktiS3pkcExwTDRkQlU1bnZ3MmNtWEFuckQxMXYvRlltcGZ3?=
 =?utf-8?B?Q1ROQTdUaVV1dS8rcWx4TjU0bzVsak0vMGxDQ1duNU9nTHNRMUxxdTh1aWlw?=
 =?utf-8?B?T2J0bnlHaU9qZVpKdVdpWWViT2tuTnhYcWhLRmY5SzZOeXJ5OW9pY25WakZx?=
 =?utf-8?B?emJxM0xpT3luVHd3WENXb2ZHLzRiak56N2Fva3F6UzNkVVZaOGVsRnRwS2Fj?=
 =?utf-8?B?cjlpeERMMWltTHErWmd1RkFqZlozWFhxWDBtMHd1eUF1QkM3dExhT1YrLzNk?=
 =?utf-8?B?RTJZbjJ1dFNOQnF6MjBkaGNwNWpnQ2dLS0RmL1lQSzAvdnVib2dlekZld05M?=
 =?utf-8?B?RnhkbXV2a3NscWcyNWpFbzBHWm94eEY2MUxKZDliMU5YQTBxVGRYY2FmLzZK?=
 =?utf-8?B?RjAvWDZRaDJlWHA5MnJBRVUvUmtPM3JocHVkemFLV1F5c1lqai9xVW5qZUFN?=
 =?utf-8?B?U05vOUp2dEE0L0xudEljZWRremxVRmdyYnFaNUk3WlpNZDhDOUVyV21WRFA2?=
 =?utf-8?B?SnQwUE42K0VmdUprd2NwTWZibzYzOHlyOEh0bWpWNUJFNy9nS2FmOW90Skx2?=
 =?utf-8?B?c1FGMkFHeS9XWTZHall0cG5qcEJtVU81ckx1cEk1d3F1RlowdDV6Y05MalFa?=
 =?utf-8?B?OFJ2Q1kxbVVqRWc5dUFhTWhoZFpGZFdrWTNaZXlURzQzWU53RVBzTi8vRUFC?=
 =?utf-8?B?SXlXVW8vNkJLMTZHNFk0SGJ0Vzlza0hvMy9DLzlsVURDRi9ycHQ5NEt1UVNw?=
 =?utf-8?B?aTNKT2E4SXpKTVE5OXFIZCtTcTU3bzFnMXBBemprYXRpSUhJaW5LN3Ewcmx5?=
 =?utf-8?B?UC84SlNyUTZwZDl4VUx0VWttdXRnRFRndmZadUFnVnVrQ3h2Wllma29tejZ1?=
 =?utf-8?B?a2tFMTNKd3pWY1IrRm1MV1lUTnJzbTNXc0krYUd2RHJvTWRIa21QeFRLUlhr?=
 =?utf-8?B?bUROUHE5cWVZV1h2VnQrN01XS3VydzhablU3ZG13M24zTW9TRzFKYnByMXg3?=
 =?utf-8?B?RE9rU2Y2aytJbGF2RDl2anNMWXZFT1ZNRWdheEpEVXk0UmtIc2d4cWwza3p5?=
 =?utf-8?B?dG1hdTFuT1ZFM2M2R1pseHRwNnk4aW1zbVFEUmlLeVZkRU1GTjQ2Rk5XY21j?=
 =?utf-8?B?YXFDOEsySE5JelNJK1ZOZjcxZmVKSlJ4Y25BSXN6VWpKWkhYQTFTV3NQSHJR?=
 =?utf-8?B?QXU1QXVoTnEzWTNMM1dGTmFleXN6aWZKbDgvRC9MUlFLT1FmMndJQlBDYVJ5?=
 =?utf-8?B?Ym95aEhjUzl4b1hQYmxoTTNMZDh3NzhPcUx1eFQ5NjllMnFsbVA4SWtkWHdF?=
 =?utf-8?B?WnFzd0l5ZE9vT2pabDBBMS9SN3NGRGRVTjFqK3FHNzRJaVBkOXpXSkJmR1Zz?=
 =?utf-8?B?QWVMaGxRcFhGcjdBN3AwVkRyMjF3YzY1RGxZRjVjQVBkMkRoVk9mL0pPUE9p?=
 =?utf-8?B?N2dhcGhMQ0dRaVY2VlVnUTFyZlljQUlhSmFhT2loTEdSUUVKcW9iK2x3cnph?=
 =?utf-8?B?WFNJSDNiODJhU2d4WkxuVlc3MDNadGhVOGRWT3R1NFBsMm9CSGdSSU8wdE10?=
 =?utf-8?B?eE9vUXVpdTlhK2s0SzJFRXNmbm9Va3Ewa3Q3SkI1aDl6c0tsUU9sV2NlcENp?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <329F477F6A440E4BA1B066BE06F16E6B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943c7090-2301-4e4d-32df-08db8e0fa472
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 19:36:43.7333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: widm9V8sjz/X4YqQpmy4e++CmwtebtRAMzfuh+vCSCjwbpEr58V7Kd3+nVGs3EsTKsCov77tkeaGU/mJvA9Ymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5411
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Update DRIVER_DATE to 20230726
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

T24gV2VkLCAyMDIzLTA3LTI2IGF0IDE5OjMyICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEp1bCAyNiwgMjAyMyBhdCAwMzoyNToyMFBNIC0wNDAwLCBSb2RyaWdvIFZpdmkg
d3JvdGU6DQo+ID4gSXQgaXMgdGltZSB0byB1cGRhdGUgdGhlIGxvbmcgYW5kIGZvcmdvdHRlbiBp
bml0aWFsIGRyaXZlciBkYXRlLg0KPiA+IA0KPiANCj4gVGhhdCBvbGQgZGF0ZSBpcyB3YXkgb2Zm
LCBBRkFJSyB0aGlzIGRhdGUgaXMgbG9uZyBwcmlvciB0byBYZQ0KPiBkZXZlbG9wbWVudCBzdGFy
dGluZy4NCg0KaW5kZWVkLCB0aGF0IHdhcyBwcm9iYWJseSBhIGNvcHkgYW5kIHBhc3RlIGZyb20g
c29tZXRoaW5nIG9sZGVyDQp0aGF0IHJlbWFpbmVkLg0KDQp3ZSBzaG91bGQgcHJvYmFibHkgbWFr
ZSB0aGlzIGludG8gYSBmaXggdXAgb3IgbGF0ZXIgc3F1YXNoIGluDQp0aGUgb3JpZ2luYWwgcGF0
Y2ggYmVmb3JlIHRoZSBmaXJzdCBwdWxsIHJlcXVlc3QuLi4NCg0KPiANCj4gQW55d2F5czoNCj4g
UmV2aWV3ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiAN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+
DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZHJ2LmggfCAyICstDQo+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rydi5oDQo+ID4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZHJ2LmgNCj4gPiBpbmRleCBkNDViNzE0MjZjYzguLmRkMWE0MjFjZDRm
MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZHJ2LmgNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZHJ2LmgNCj4gPiBAQCAtMTAsNyArMTAsNyBAQA0KPiA+
IMKgDQo+ID4gwqAjZGVmaW5lIERSSVZFUl9OQU1FwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgInhl
Ig0KPiA+IMKgI2RlZmluZSBEUklWRVJfREVTQ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCJJbnRl
bCBYZSBHcmFwaGljcyINCj4gPiAtI2RlZmluZSBEUklWRVJfREFURcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCIyMDIwMTEwMyINCj4gPiArI2RlZmluZSBEUklWRVJfREFURcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCIyMDIzMDcyNiINCj4gPiDCoA0KPiA+IMKgLyogSW50ZXJmYWNlIGhpc3Rvcnk6
DQo+ID4gwqAgKg0KPiA+IC0tIA0KPiA+IDIuNDEuMA0KPiA+IA0KDQo=
