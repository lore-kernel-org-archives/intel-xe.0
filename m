Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A80C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 17:05:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E10510EFAB;
	Fri,  2 Feb 2024 17:05:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C/BCoHnL";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 17:05:41 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727FB10EFAB
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706893542; x=1738429542;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=sO+cOQpfkqAgcHLFxZwpMmh/DjaJqhGEMglK3kbfE+M=;
 b=C/BCoHnLbQlCW6NjAVKjhyYjNpf//8qSvUPgUdRJ8sODjtCjmsi//NsI
 S9ypB4u6JjFCDaNerQlJX6/saRFWkfhkqQtzwHdRjSalwPLapqKq3avGU
 Qo/9qmxZHWoCVwon1Jq7c106zMAiBnUNB6MKL8neQfe++BGzsly8O0Ed+
 RDVHOdJLm3WdtvYXHYQkqTMcdBKF7W9YapfSYjzMb9T7NsQbPXnfZIb1O
 RwBTaET85FfN++pGJkvH4sKfTbN2hRk+zYcgGTh6f5r3rOD7tfLsA9UHW
 q9gP0kCDR0pD+ivoYVFDSexVZOz5s4RUct9pRmp8IKWeTSQL393zJic1K w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="354630"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="354630"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 08:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="120659"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 08:58:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 08:58:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 08:58:34 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 08:58:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GH6BFUlnDuUyaNsxvgluJY7/Lfrb763K345gaGRECAdf3qTbFxwUUBc0DVnrU/0rDzn8PQfGf4QVtEp7+MgFOCpAcAAB3j/xgT57EKOdH7PRcH4x50BEzAPooUBxInkD3LQ0GpDznSIOWtEcj7H1MT0S1u3jA3H04H+MvIJoOga3bBLvVeveW/4k9jcEnGQmbF3dNGYiIdFTyYnD04D44dKZJedmVdvK7/wB5ZKLMar9Izhvb+GtVa02M6PklkQ72NXO+I7CixDWNrB3ScWpwnli+Kzhl4km8oMVPir4+lZKkqYFuz07529wt6Ol/8khIY4BZKYiLyv8uHMET2Rciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO+cOQpfkqAgcHLFxZwpMmh/DjaJqhGEMglK3kbfE+M=;
 b=n1mLDu+9/ZcPg4tlWpS3wOxwL2MgNK/C4V+Mqgrw9xfp7ADqBTrd9pn/0tpg5ZhE1YLcB2lkqkS13doGa+YduWrnZNxeERFYnv9rq18dk47pESuXWvCbJMp+Y78W5wvSztenNFfT4gSpQTW/xIJ7XKsFc56ikc28eBQReAdW0SR8pcAzGL+QJBM6+y/wdrdGoqFoqeDMpV2uSXdKK6wWszBr3vI9oibBSwFwW4VaMG5xE+DII+OCjrGHhQ/sS7EqS9zus7WD/5mEbyzlWJCHkuceB2OZeF+IWl6165h9pOIlCstzDRvMHsjxMLFhwe2Xm1yUj4sAOZjAMwYG2TJ5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DS0PR11MB7309.namprd11.prod.outlook.com (2603:10b6:8:13e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.30; Fri, 2 Feb 2024 16:58:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::cc1f:3742:ac61:448f%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 16:58:32 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
Thread-Topic: [PATCH] drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
Thread-Index: AQHaVYiv2Huzzl1ZxUiH8ejP7kDd6bD3RwkA
Date: Fri, 2 Feb 2024 16:58:32 +0000
Message-ID: <d7537d1996d822493036d10a8be4d90a7bb4244f.camel@intel.com>
References: <20240202033440.2351862-1-matthew.brost@intel.com>
In-Reply-To: <20240202033440.2351862-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DS0PR11MB7309:EE_
x-ms-office365-filtering-correlation-id: 1ca2146e-096e-4b1d-023e-08dc24103062
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xr1PA4uUdrGVcRoF6ARjHbaMn+ysoBi8s/U5gdu62sFU3Qdc5Wr/qldoxSyvkCdptU5qknFy2fdCH14GhnhyuS5UkbC5Yppdpb4/MXRRy/NMvrgDwVLeMNt8ct5IbBTikiXObiZGixj5NiabfB99mnepsTWxu2JuB1KcGjuqxxQ3XgVr+lDjG8DlfGIKN8ZVcCn3Ndnq2aCtlzS0H41qk0eUygrNa6oLRADEJ8pQYaSlYZtd9Eg4G0AKFs/CA3/1Rm/K8kf1Ryum4DnpcROvSmsAwG44Cxt271W/5qpF/guA9Cd/HPYDXPHPd5Wh6Y1Es+5qUIa6B5hh9tF7kyEx5QrwrUjYiHKCQpm3pA4wVsYbGFfBoqlGNalAwKMf+idT4ne3MANQ6vjREuGYIzpfdFe4eOqq3kzrgvcUq2CHLoyZObVPOIHeJcmDgi+ML4JbrGOyugWsnyZYPEJJwrsndpF3NvfXhkE04BdGvCll+Dx6iWM404g01cJTS0BvYxw7kODqp81zOjq0sWY3e5b92jEMCUpkfkYPKJs+wkG2HGb7JYODB/hw4oSz8qHLgTsyYlSOdR1dOemLKt1XWYJU+Szb60B4bIuwtvDbEJsgcmqRwUUFHvsy+ZSilE/bF2ar
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(8676002)(8936002)(5660300002)(6636002)(110136005)(316002)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(38070700009)(26005)(478600001)(6486002)(71200400001)(6506007)(6512007)(38100700002)(122000001)(2616005)(36756003)(82960400001)(41300700001)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QVc4VTc5S3lKa0lJazhoVFB5Q3Bhb1Y1bWhNTFQvMVo0Zy9Cck5SeERrbG1S?=
 =?utf-8?B?VWZ4cXUrMGJyUndpQlRBOTV4blMyaElWczFhK24vcTRNL3Z2eVFLeG5pcFB6?=
 =?utf-8?B?Uzc0ZXpjQ1poY29RaDVBZzR3Ti9ZdVJ2YVdjVTN5Y1Ixb0VBUnBHYVN6YWRz?=
 =?utf-8?B?ZXdyNzBBQ2VHOVVWNlhHai9oNkcwaVpWMCtwSkZxelIvU0hBQUgyVzU3Z2t3?=
 =?utf-8?B?ZkJYblErKzhFVEJHSVBJTUFtTjMyWjJENUNIUjYyQ0gwWmVLQzMrakJwbmoz?=
 =?utf-8?B?NktpYm5LU2plaXBHV2Q0QnJjclA2a2xkL1g1V3gzQjBxY0ZJa053a3V6WFg3?=
 =?utf-8?B?cUpoZ1dJd29lc1N6SzBkaTV0SG42bjh5NVhYMEI0VjVSeEI5ekpxdDU5ZkRV?=
 =?utf-8?B?Rk1Hb3k2VTJzdHFINS9nSWRBRXd3UjI0eFFhMEcyL3ZINU41YW80VFVERTA2?=
 =?utf-8?B?QjhQRGlzWDBYUmI3aHErWTBnUk5WRlpjU010bGdPOXRhY3YxODBXRXVZVUc5?=
 =?utf-8?B?L2FuTDYyaUJBR0NBditibnd6Z0Jza2hnRVFTVlp3MHhHTXR5R3ZKdUU2c2tI?=
 =?utf-8?B?K3pJcVBvSW5OUXBiYTBsZzdKamtaVnJMM0NUZS8vRUxEVUliSkFDTDZkR0g5?=
 =?utf-8?B?OEl3YldtdEhlNmplMFVXMlgzU0NsVFFjYWMzYXJuM3U2VVVvbllSVHpEcGdh?=
 =?utf-8?B?QWFxaytyZjBYcmZFYU1Xb1l0a012Y3NIODgxODhiTmtJZnN0Smx3Y0lFYlF1?=
 =?utf-8?B?VlVCdXdCcEFmNjhrbW4wZjhyb1QyekVzWHFJUGV0TzZjS0E3czlsa0RjdkpJ?=
 =?utf-8?B?aVJTVWV5cXBxUWV1cnE1TXZFZjQzWlEzNVVyVzZQUzJOWjhRdHpkVE5aQkZx?=
 =?utf-8?B?azZBanl3V0FDNzg3emNObkdMZ2ZkT1dEZGhQYXdnb05lV2EyZHVsWEJiSDZN?=
 =?utf-8?B?WVFPUWJkeEpmZWZoV0pjRFo3RE5FSzVpcGJBV3liSzZDYW5URDh3clJZdWFD?=
 =?utf-8?B?TGhvMUpJVlZqUlRUVk83RUROVzBLeXZ3VS8zRms5anNGRUw5OHhkV3dSYXlx?=
 =?utf-8?B?QmVBOG0xVGY5Qyt3VWZGK3QxNzA2dGhyOW9ZR2FJdEZiL2YwWHFFei8yNmVX?=
 =?utf-8?B?Z1JzOHJPMGVhSkxveVBZRzhwZUU1RG5ZMHk4ZDNyUHhWUUZ1Wk9Eczg0TG1G?=
 =?utf-8?B?VkkxMGZ4ek5kcUMxVFp3U3BQWjM1cUtQMFl6ZWo4Y09EcFhJQ2I5WVoyMFZq?=
 =?utf-8?B?a2dMWDNPRzFvZ3dkdDhDc1ZpQUJacDFzalZORFQvaFJxUkEvNFRnTGwyZ1pr?=
 =?utf-8?B?T2hGc29mSUI2WUczeWk3TTB5UG5lK3BUa2ZFYkdTdEdCdzAzYTZ3MFhxUUVO?=
 =?utf-8?B?QlNuZit1Y2tkVjY3YUd3cDRHOVJQdUhWUzdzUENvdS9DbVdHVkl2eDZObExa?=
 =?utf-8?B?UzVRVlhqd0ZFZllnbjFKWUQ4cXM0b2R3U0dkazczUmoxMmJuWjFRKzA5MS9O?=
 =?utf-8?B?dWVYYUx1b001bFB3aVE3U0xlbGVWTVFQOEwrbVp2aGlLbFJvbHRtcDV2Q3FW?=
 =?utf-8?B?WUVZZURac0FRcHgveXJqL0NiMXl6UExIeEpCZEphS1RaQnlyTmxncWgvUXBH?=
 =?utf-8?B?c2JmRzl5ZXErN2hKcllTZVUwQldZRW94RFMyRmV2SzQrS3N0czQ0VE5qcVNC?=
 =?utf-8?B?My9td0N0ZEk3QXRlVnk2bE9kMEtrdjcvTWNoZTFlTnlEOVBUZjlVUWVYMmQr?=
 =?utf-8?B?SnFrZUQxZnZtYXJESGtxcXdOV2gwQWFoUXpqOWhLeFppaHdJcUxPNWYxVUlZ?=
 =?utf-8?B?MnJ2WUZHS0dSb3gwTDJLTVdmaE9zRGlpazZXdHhWbENkNUhuNC9BcDBDTmxX?=
 =?utf-8?B?NFlVRmxKaGJxMk9XSm9QamkwSkUwUm42TTEvdmhCTDBEdzlaeHBkc0VSUzhM?=
 =?utf-8?B?VnNPRDFxSDlUaVg4VE41Vk4xRFdnSFpoS3dyL3pJN0VRSDc1eHVUU3hZb1Jo?=
 =?utf-8?B?WUlNMWcyTTM4Rkx1SFNnYXZaTUkyZFBrd0ZjNmRONTg2SlhVMC9OakdmTENX?=
 =?utf-8?B?Q01GWVNsNC85cmxrQWUzVWM0bnIvUG5pOEFjVGlzYVE0RWppUFgvbC9ycXBR?=
 =?utf-8?B?aVI4R2Q1Wis2Vy9DNHZVNndUUWJwQm5mNGtDZVQzcnlqRmNKUmttNzlqN2po?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4118254A79999468801773C8AE2BCDB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca2146e-096e-4b1d-023e-08dc24103062
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2024 16:58:32.9322 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GDggpFFiCOIz3ciZMHnIDBNpUDfIPf3CIRmR0YjbGr+WVjLbsbynI9/S13iyNM11qnJ8hARkYtOMLnxH2PRrUXejUzxmihpTPt+uw93+F4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7309
X-OriginatorOrg: intel.com
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

T24gVGh1LCAyMDI0LTAyLTAxIGF0IDE5OjM0IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEZvciBpbnRlZ3JhdGVkIGRldmljZXMgd2UgbmVlZCB0byBtYXAgYm90aCBtZW0ua2VybmVsX2Ji
X3Bvb2wgYW5kCj4gdXNtLmJiX3Bvb2wgdG8gYmUgYWJsZSB0byBydW4gYmF0Y2hlcyBmcm9tIGJv
dGggcG9vbHMuCj4gCj4gRml4ZXM6IGE2ODJiNmE0MmQ0ZCAoImRybS94ZTogU3VwcG9ydCBkZXZp
Y2UgcGFnZSBmYXVsdHMgb24KPiBpbnRlZ3JhdGVkIHBsYXRmb3JtcyIpCj4gU2lnbmVkLW9mZi1i
eTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gLS0tCj4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3QuY8KgwqDCoMKgwqAgfMKgIDUgKysrKy0KPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9taWdyYXRlLmMgfCAyMyArKysrKysrKysrKysrKysrKystLS0tLQo+IMKg
MiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3QuYyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndC5jCj4gaW5kZXggNjc1YTI5MjdhMTllLi4yOTVjYmExYzY4OGYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3QuYwo+IEBAIC00NTYsNyArNDU2LDEwIEBAIHN0YXRpYyBpbnQgYWxsX2Z3X2RvbWFpbl9p
bml0KHN0cnVjdCB4ZV9ndCAqZ3QpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBVU00gaGFzIGl0cyBvbmx5IFNBIHBvb2wgdG8gbm9uLWJsb2NrIGJlaGluZCB1c2VyCj4gb3Bl
cmF0aW9ucwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZ3RfdG9feGUoZ3QpLT5pbmZvLmhhc191c20pIHsK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd0LT51c20u
YmJfcG9vbCA9Cj4geGVfc2FfYm9fbWFuYWdlcl9pbml0KGd0X3RvX3RpbGUoZ3QpLCBTWl8xTSwg
MTYpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3Ry
dWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3QtPnVzbS5iYl9wb29sID0KPiB4ZV9zYV9i
b19tYW5hZ2VyX2luaXQoZ3RfdG9fdGlsZShndCksCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoElTX0RHCj4gRlgo
eGUpID8gU1pfMU0gOiBTWl81MTIsIDE2KTsKCldvdWxkIGl0IGJlIGJldHRlciB0byB1c2UgYSBt
b2RwYXJhbSBmb3IgdGhpcyBzaXplL29mZnNldD8gV2hhdCBpZiB3ZQpkZWNpZGUgdG8gY2hhbmdl
IGl0IGF0IHNvbWUgcG9pbnQ/CgpBbHNvIGlzIHRoaXMgc3VwcG9zZWQgdG8gYmUgU1pfNTEySz8K
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKElT
X0VSUihndC0+dXNtLmJiX3Bvb2wpKSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVyciA9IFBUUl9FUlIoZ3QtPnVzbS5i
Yl9wb29sKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfZm9yY2Vfd2FrZTsKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21p
Z3JhdGUuYwo+IGluZGV4IDlhYjAwNDg3MWY5YS4uNzQ2NWY4ZDE0MDI4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfbWlncmF0ZS5jCj4gQEAgLTE4MCwxMSArMTgwLDYgQEAgc3RhdGljIGludCB4ZV9taWdy
YXRlX3ByZXBhcmVfdm0oc3RydWN0IHhlX3RpbGUKPiAqdGlsZSwgc3RydWN0IHhlX21pZ3JhdGUg
Km0sCj4gwqDCoMKgwqDCoMKgwqDCoGlmICghSVNfREdGWCh4ZSkpIHsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC8qIFdyaXRlIG91dCBiYXRjaCB0b28gKi8KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoG0tPmJhdGNoX2Jhc2Vfb2ZzID0gTlVNX1BUX1NMT1RTICog
WEVfUEFHRV9TSVpFOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmlu
Zm8uaGFzX3VzbSkgewo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgYmF0Y2ggPSB0aWxlLT5wcmltYXJ5X2d0LT51c20uYmJfcG9vbC0+Ym87Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtLT51c21fYmF0Y2hfYmFz
ZV9vZnMgPSBtLT5iYXRjaF9iYXNlX29mczsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgfQo+IC0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkg
PCBiYXRjaC0+c2l6ZTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGkgKz0gdm0tPmZsYWdzICYgWEVfVk1fRkxBR182NEsgPwo+IFhFXzY0S19QQUdFX1NJWkUgOgo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVfUEFHRV9TSVpFKSB7
Cj4gQEAgLTE5NSw2ICsxOTAsMjQgQEAgc3RhdGljIGludCB4ZV9taWdyYXRlX3ByZXBhcmVfdm0o
c3RydWN0IHhlX3RpbGUKPiAqdGlsZSwgc3RydWN0IHhlX21pZ3JhdGUgKm0sCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGVudHJ5KTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBsZXZlbCsrOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoeGUtPmluZm8uaGFzX3VzbSkgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfdGlsZV9hc3NlcnQodGls
ZSwgYmF0Y2gtPnNpemUgPT0gU1pfMU0pOwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJhdGNoID0gdGlsZS0+cHJpbWFyeV9ndC0+dXNtLmJiX3Bv
b2wtPmJvOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
bS0+dXNtX2JhdGNoX2Jhc2Vfb2ZzID0gbS0+YmF0Y2hfYmFzZV9vZnMgKwo+IFNaXzFNOwoKU2Ft
ZSBoZXJlLgoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHhlX3RpbGVfYXNzZXJ0KHRpbGUsIGJhdGNoLT5zaXplID09IFNaXzUxMik7CgpBbmQgaGVyZS4K
ClRoYW5rcywKU3R1YXJ0Cgo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBiYXRjaC0+c2l6ZTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGkgKz0gdm0tPmZsYWdz
ICYgWEVfVk1fRkxBR182NEsgPwo+IFhFXzY0S19QQUdFX1NJWkUgOgo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVfUEFHRV9TSVpFKSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZW50cnkgPSB2bS0+cHRfb3BzLQo+ID5wdGVfZW5jb2RlX2JvKGJhdGNoLCBpLAo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoAo+IHBhdF9pbmRleCwgMCk7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhlX21hcF93cih4
ZSwgJmJvLT52bWFwLCBtYXBfb2ZzICsKPiBsZXZlbCAqIDgsIHU2NCwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZW50cnkpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGxldmVsKys7Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHU2NCBiYXRjaF9hZGRyID0geGVfYm9fYWRkcihiYXRjaCwgMCwgWEVfUEFH
RV9TSVpFKTsKPiDCoAoK
