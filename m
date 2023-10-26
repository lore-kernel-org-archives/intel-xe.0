Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A66C25B48
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 14:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B696510E7FF;
	Thu, 26 Oct 2023 14:38:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9007910E7FF
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698331123; x=1729867123;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=B8RfJ/q3wAcCeEOp2asa6m7PSM+qRhHUnOCyBRIlo4k=;
 b=gbVf+xiMS0+AKnALm4xLUESABFgHjxYGpoqUIpf7qlwXydbbvAmiMG5K
 LO5nbC9GtsxsrQIlaaPWwECmQ7UyoU82hmmMGEbvDT20R27OFJ7cT4W0O
 RU2nh7VekLMhB7FeqeNcvHsjRAnk8Mu8jnW13TIB1OAyg86bhf66YlWTa
 GDaQ2DkzsDWWYPE8CSYWmR42sNbI7w5gBNXVD2o2+LKHi4IqPWxV1JYRC
 msyb99aawbhCJcmxWuRPgkfLJkEHOlAXdyb8JZlHS1fU615zBt6nX8kRw
 n0e261HoTN2wINCQh0e7Up9c2ach8x8VLPQ1HKtVUB3DBzYdgyLHZfgfH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="9115435"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="9115435"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2023 07:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="475237"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Oct 2023 07:38:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 26 Oct 2023 07:38:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 26 Oct 2023 07:38:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 26 Oct 2023 07:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldYBJfffH5b4GBWrE/bwbLY0+RNUWXgnQfFEhM1kWVHgfkgUglJJ6MRFeiX2/iBkdSGq9sLF4kOCZ6B0iH67RZ8oW2hUuCWpolH/lnloaSIshw8xANKVPd8E7sAe2A7JtRDPKkYFQkBJRjRcxrYQGtdqU8jk5Hf9Zr22LVPZxdl0D4MZR6xTeF47UWEt7QLHaUsOcmAB29QAcaA2PDGGjsVgHBAWu+QxSQB4zw0qKQhyif6XuJBklWHZ4JTIbN/IyB/1EOLZIsfNXqMsuYWwAkY6h25jJzMY3vk55SLCWGfu845K33mzbZxBvbJ63Z1sXcHRgHEWiMcA0Jw2eErP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8RfJ/q3wAcCeEOp2asa6m7PSM+qRhHUnOCyBRIlo4k=;
 b=art+7v3+Pgbf4yo6Ct8FInFMbyOlAI7Hz9Q3TkBZ1Cd6TFouoEVY7ZMMdFKe9c0zNGISLbXnFj2BsGvMiHkfaqyP4icEYVzFvdpaFiSjKphcH9VBa4hw9t+HlGzJsgkUCDsRKXv0q/9otsX7TuUojqPNBItA96vfJbwEtlHI2s6W/WDD8/om7v8n9wX54Fec7FvW7f+GzK6y3F56EEq3qxOJKqDt3moy8AiP+h5JfyfTigL7dkQscTBhlSA71SqdDlYBQWLzthWD7gjJa75E5ZFQptYuoiGNZkxLkUk9ayR/BCNtFLgFst2E5iFUziNTS2CBB1gdLgQyikgb7dYwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.22; Thu, 26 Oct
 2023 14:38:38 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::ea97:f0a2:fffc:b892%3]) with mapi id 15.20.6907.028; Thu, 26 Oct 2023
 14:38:38 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Thread-Topic: [Intel-xe] Replace "drm/i915: Abstract display info away during
 probe" with upstream version
Thread-Index: AQHaCBobwkPXjSz2nU2ANxDXIc+hUA==
Date: Thu, 26 Oct 2023 14:38:38 +0000
Message-ID: <33cff30cdf4415f794df18463c7a62545dd5c5a6.camel@intel.com>
References: <20231025172836.770398-1-jani.nikula@intel.com>
In-Reply-To: <20231025172836.770398-1-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|LV3PR11MB8531:EE_
x-ms-office365-filtering-correlation-id: 109bffae-1066-480f-b706-08dbd6313e2d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pt28zsI0heJk/gXXpIYth4y9bkjuyov0hGEhTTMDD9Q3vcijQXe13byZFY8H94Gf37lBjNUdBpweJ727UbbiL/zO26gxvkOP5G9Kgzl7CYCY+IzBs33Lh16oN/UYlBwldHxXsbCY99cNwCnVIhzNObgsBRBIyh6wDFr79i5YORWRiPuBoFNreJVWzqScXyRzZnErOaw3F7kqor7+W2b2YgQlXo6GfDGbALFJR1HYTOx0yonarDmnquIecXMs/kHIdwsMV1k9v5UBNUF4P5vBvZaZsbMcyk+iusgsAQsF45HiWEnP7MvE5O0jl231oGp6f4Cqm+ER7SWF7t/HWuXUnXTDpXXu/Xa4vC4gn6MbWHdo56TWhdeviLyN+Ydsngk+uW5b8ZV3XsewLX06P11mzyshUwlq/Q4TxnNvnOC3O7uWHEKOeipmJ1LVnz3OC7iH2RQmZuGxVDjg/TyzDD3J0ec2QwW5yxhvpUhfwPhI7hR6jUYIcmGpPyUhoX9vhm75MsMddGn4mYVsF/AJScK2B+pQehYqmTYlCsu5c9gi6QUwqHqhvxVrvyI74J96TbHk18L+EEyTAmTdIno8pftDQA7ctgnC/UIIL9EkMMPbB+gZas3yLTCf7p/9O6LWLsQ2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(82960400001)(2616005)(6512007)(41300700001)(122000001)(66574015)(5660300002)(26005)(6486002)(8676002)(8936002)(478600001)(66556008)(316002)(66946007)(6636002)(64756008)(66446008)(66476007)(76116006)(36756003)(91956017)(110136005)(38070700009)(6506007)(71200400001)(86362001)(38100700002)(2906002)(558084003)(4001150100001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnJ6bDh1bVdpMUlGL2t5SStUM2VqWnNsVWwvMG92eHpoNHVBUnZkRC9TdWNp?=
 =?utf-8?B?Y0luZTdjZW9yeVhkVjZJOWJtT1RWQnN3eUZObU1jVGJOQU9lR09nd3YvSFB0?=
 =?utf-8?B?Z3NmN1BteXVpc3orWnA0K3dtMitoclZDdDNaWXUxdmh6cnlYN244cnJxSzY5?=
 =?utf-8?B?NDdMNFpiOWMvZnB0ZWdnZFdZbzhlQ004VlcraWUzSlBDcExnaFNLdFB5TW80?=
 =?utf-8?B?cE9jZmp1YTVMWUJ4SHd1eVA4VVZrSGVyOGlzSXNxUTRKRG01TThuY2xwcTlt?=
 =?utf-8?B?c3BNMHcwRk1CZkZmc1R1cGJFTHZTTjM2MThERDBOQzhKM054QU5pWGFVMGpO?=
 =?utf-8?B?clFWU251SnVldkRhMURaZVdLRWMwZ0EzK3lNZ1UvNjEwQldFZWhyZ2lSZGI4?=
 =?utf-8?B?UkRPK2pmNjlkSmhMLzhZenNFV3dYSk0yVXFmYndSOHFzb2kyNmF5OERaUTRT?=
 =?utf-8?B?b1ZuVS8zZC9jZ2tLcnJzYlRuVlZjU09FbEFqb0t0UHNZL1NsUnpzcWpoRGxw?=
 =?utf-8?B?SDZkaWRNbzBLS1dMenlRTmMvVmZ3cFdKa3JiR0RscHl6NysrTXphelFIeVNW?=
 =?utf-8?B?YU1yYVR0NmtuTHNuelJxb1FFN2N0SlM4QlFnRUxEWUZoWUVwY3VSejBwc3B6?=
 =?utf-8?B?VVN6czYzQ0hSbGlkTEwyVmxsMzFiRmw0YTFFRTZUSWpNa3Y5RE90d2lRNUZ5?=
 =?utf-8?B?cDcrVWpFRVBEc2JmbFZHbERxL0pidjhYSkNxRG5TWHI3bUg1UmtHVHh6QzNt?=
 =?utf-8?B?VTloLzFSZnJTbXR6ZDEzb2lsd2w0d3FVLzc5UlljTlBJZ1I1VldWM3Y1T2Ex?=
 =?utf-8?B?SXA2ajFqM3V3Nmo0QzdyOWNrdHl2T0hsR1EwZW1RUW85TEhJYTdQSXgxenNO?=
 =?utf-8?B?NXZJcG9BOGRvRUF2SnJGL3BnUjR2ZXVtbnM2RGoxZ2lVRkRkSkpocDROcDND?=
 =?utf-8?B?SHAxUlRXeW1MUEY4cWhLQlVyTnFSSnBtKzUrRHNyczEvcDNTbkhVMVJCcnM0?=
 =?utf-8?B?Z2Qvc2M5YUhuNTJIZmJjeDBQZlVlTUd4TEIrZVo1T3V1QXpSYUU1N1hDL0J6?=
 =?utf-8?B?SlNVbmJnUFpFQlFvZisrVWNZQXhkRXpxbU9pN09ZaFB6NUtzT3l3bFZvaC94?=
 =?utf-8?B?bmxMQllOQWhXUHhpdS8wemsrNEZ6dExaUVZabHVOMkJSMWNueDVabElROXd6?=
 =?utf-8?B?UVNRRUh3Vy9DY2lIUERMRFozdzFmOW8xVUpzVGlnWTZWN2NwTlFEUWhOOW4x?=
 =?utf-8?B?bjJubDduV2NuWkw2QTV3M2ttTjFVc1FwUjRtaHZrTXVSVVRodVhiWndmN0dw?=
 =?utf-8?B?bC85VWhFVXNCQm92SHlnTElDNGI5enBpK2pXQk5QWjJ0TlRTcTFpb3pqT211?=
 =?utf-8?B?SzNiSEtmL2k1ZnFRNk9HQnV3T2hPYkszeG5wc1Y1cWZaNHVUVmw1ak9yQkNx?=
 =?utf-8?B?QjBJVnZOYVFUN2dXL0FjNmVRN0htK0xXTmFyLzdjM3AvdVNtS1l6TER5Z09p?=
 =?utf-8?B?UmZzUmtibUhKVG1NR0FpUVkwUHhTNjBYaUFGVHB0WjljLzVqc3FRbnNDWGkx?=
 =?utf-8?B?dHlaYkRzZ3YrNEJQK3BueVJtQWlrMDZqbG9oeFA3cEZ1ZEJkRlJoWUl6VWs0?=
 =?utf-8?B?TjcwdnhpZUdrU0JNdW1KNTFuVUxOTWd0R1BSVmx5Y2lQZVRLcnY0RzZzWS9n?=
 =?utf-8?B?ZHRnZ3F1TFNEREFZSFkya29rdWRURllsZmVCWXJUcXNySm5oNXdZSzFVRUZM?=
 =?utf-8?B?ZzlpQkV4eVlXODdPdG0xcVord3J4Rmg3ZEQ5VmplUkxXR1M4MTlLcFA0OEpH?=
 =?utf-8?B?K25iR0tnTlhKTlltMUdKZUtGQmxvakd0WEw1RlFJbjdvWVA5aHBEYjlKMi83?=
 =?utf-8?B?bGdZeWdCQ1cxS1lCTWJDMnZsS01Qc3FvNzVHLzl2R1ErQ1huYkIyazE5eE1Y?=
 =?utf-8?B?S3BxV3d5a1hSbVZVQ3FCZWo5Mm90amx2b0Nqd0VVa0NrWTY2WnhvcVBsaW9E?=
 =?utf-8?B?QmJIaUNtSnpVSFZhamEzYUpsYzNlQzU1aWovY1Z2eFhvQlJtZHdJSXViN1lZ?=
 =?utf-8?B?dnJ2UzlpS3ltTkRJTGpBK2pLV2s0NWR4Wk84V2VjbEg0Qm9rOGE2eDF0Rkh5?=
 =?utf-8?B?TzlYcEVaZXU2b0RnbVkyY0UvU2xWZnRrQ25LSEpSeXcweTZpeXQ0WDJma1FH?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <602C4C593CFF16418D731332CB4D8E41@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 109bffae-1066-480f-b706-08dbd6313e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 14:38:38.7383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +OAC4RHI75xtnIM3uqOnr54S5le6nU3sIWXpvU0A2WPMNEdRgvaIzxREoiWGVH2qLXlQORlgqO3khCxvZFGMyLEuIy9KzzrUR8NRzWAUAds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8531
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] Replace "drm/i915: Abstract display info away during
 probe" with upstream version
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

T24gV2VkLCAyMDIzLTEwLTI1IGF0IDIwOjI4ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
VGhpcyBpcyBhIGJpdCBzaWxseSwgYnV0IGdldHMgdGhlIGpvYiBvZiBhbm5vdGF0aW5nIHRoZSBj
b21taXQgZG9uZS4NCj4gDQo+IA0KDQpBY2tlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQo=
