Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C426EC0015E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 19:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7859E10E4B3;
	Wed, 26 Jul 2023 19:38:08 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7471610E4B3
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690400286; x=1721936286;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=z3lWQxUX/a21kQE3uHRqFxcqtqGuxFkfQpJchhG3QKE=;
 b=iZ9xNd5gfumuUfJri7ncRmLApfxXFQErTmq0jihiGinQXeASxHD65oWo
 Uil5y45qieZW3kDuS8OE98dfmO1BaUmGUS68Ku8VyOm6m/XSYJKY+D5j3
 XJP/EPsedWD9yFmBZby9Dl1r1yOaUmjXkoYKpqEdpdY7wRtqIESj41H6b
 qV/qZyKMejBPIZWhx88Jq31h8LgNkAg0OIsLWB8VAiskCGGIYMSEHFA8h
 Z5v61e8yzzYQhk5+wpRQXZIOCkxg4ySKGenHbGTM8WUcVwo2gcCDCILy1
 KtQf+1kMHjib2VF7u13pW3AUDepysgGNuwEtJKOK9l4a3Ky3OY4EenXrz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="358111966"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
 d="scan'208,217";a="358111966"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 12:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="726663148"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
 d="scan'208,217";a="726663148"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 26 Jul 2023 12:37:46 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:37:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 12:37:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 12:37:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 12:37:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naKg6kwkM2GpPIDhqtvuh+2mIksD+yc7g3Tvhpe7bv++LPAEvoniz70GSns+l8BB8SFTM++4VCQC1X7NJSc6TaenJBwyQP8eb7iBqs1qzTlEzlj14RA6ZTs7B0jWN2bd74sFAfBHsEF7xRtHuieJvQAhV84gYOyN7kkp8wuyNBCrl1YPFOT5fvYlris7bKl6Ch+17UMLQSV2y8BMDHgaKzzxZ6lXd46PIzPMYfwAp2OiIctsLg1nH2kiAtiw8sL99sHzrbDNiUJ/kRz3X797597tcwZEVOH08TLymWD7fKdb4HkzOfFH46as63E98ymL2g0loUliEoyedGlVAJEvzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3lWQxUX/a21kQE3uHRqFxcqtqGuxFkfQpJchhG3QKE=;
 b=FypuLQ9YxGqzM5S906BepGU6Lj4cCppk80C3G290WCIsnCTIPqST7+0xbKL1Xe6E76jqRS1XIssGWD5RwrWhFY+wphvxpe5GEwYyueguZFNaFZ8VR7e35rDtbFtuIJm+prYJzR1i9ba9DZD2n9cnh4TYsqiZS9+xNcPU1jLkNV/3O1LldlPRabaTJZbML8muIJ8FjlT7+BHV5qorOXjamLWcHj6qnE/B+cULienWpy4SmTNGKvTUcnOce/9mNrftj7t1IlxEFzg9DsjNoUjVOTTe4+mDQ04fvAvYL5mdEsYfVVIHlyEb7Qqwy3gIYzYNV8N5aiNaudvS5BSZMApBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7601.namprd11.prod.outlook.com (2603:10b6:806:34a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 19:37:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 19:37:43 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH 1/2] drm/xe: Add DRIVER_DATE to coredump error.
Thread-Index: AQHZv/btGwp3yku9aUeMnW9aQLZnAq/MbyYAgAACMYA=
Date: Wed, 26 Jul 2023 19:37:43 +0000
Message-ID: <01fad5a237f5018521cf426342fc2bac975e09f1.camel@intel.com>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|SN7PR11MB7601:EE_
x-ms-office365-filtering-correlation-id: 1e9ffdbe-fda1-4d8f-b346-08db8e0fc82c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CIarayxZbHysO0cYdKGZMWOa/V5OBHpS6RZoO28DGYaJJ3SGytrWb6ct/xU0miJ6mFdZNs4lmqxDqPHvOqhibW6H+ebnztZT+zJImGUC6suLxEE7oxa17/LN/pKDTakXAN2CqbWhZzsiaadr18HUxU8W2XNBI90XCyU+5XbKt9mYE/uNW4Z9ZihZts8rVdcwU0a5L5PafsPy7M1d+msXQEX+U7OhNkVxIjv8v4WzRj6SMhvB0Qa3t/scJvZR3TbnbIUb+tNJv/HRie0UxoZIhrx47yb198FBayW5nADi87ujlUhP2njeLPH3EC3KjmHuyzpm86Oau9XqVVWWwbYQrJdQdnxzO2RpZ6dhU0Lcv39d/Y4coNxNYA1E9HUhQq9N99NjgFDb5k9NZJM4pvMFu+Pow+pq1hDdD0p+O3QMZjVcsEMmHgeG5c4lpa+7sHu6Pdj3FMIw816wpYRgs4zPK+cz9dltfMrx8fNp+DB4VTET8iThK+tso79FhbkCyM8+KF5wjKpS+wqVDHUK+2poXwoE0rUvate5a7aQLndRsoqkPMRwn5UG5GtnHchcbJ4PJ7slfeeTg6BktmC8emCXAWz6bIV8LhuQ1AA9g7UvkABz/0Q8VbK5PTjnbo2DQuWC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(71200400001)(26005)(186003)(6506007)(2616005)(83380400001)(91956017)(8676002)(4326008)(6636002)(8936002)(66556008)(66446008)(316002)(76116006)(41300700001)(5660300002)(64756008)(66476007)(6486002)(6512007)(66946007)(2906002)(478600001)(110136005)(38100700002)(122000001)(86362001)(38070700005)(36756003)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTJnbGhMM0k0UFZtSW5rZnlIeHZyNDRibzhxMmxZMzVPZzVFWjdpbzc1SGNV?=
 =?utf-8?B?ckVHOXlSenA1TzVVSG80bURFQzZ1VCsrZmlDczRORHU5SUlsWWdGaG5PTU9C?=
 =?utf-8?B?cDMxZXJoVk5KQlBxM0xnWExsVkpZMFRHNW5jdGZLTVVkbUxyRUxyMHZEVjhM?=
 =?utf-8?B?V1Q5VDhFZklwMm1VZ3VjSk1QRU15V29UaW1JMEN3MDViRy9Dc2s2MkJxL0g5?=
 =?utf-8?B?dnRkMERoN3VHV3N5bFUwc2VxSUxyOFpuZWx6RFNhS1ZVeG5ZWTllQW9ITHY5?=
 =?utf-8?B?N3RjM21KOUdIMVExTUN5SEMzZDAyUGhybW85b3RyOHNhQ2xRS1pxTk4wUzVS?=
 =?utf-8?B?RXJheXdJcXBubkFFTjRNUnNCMHNRVDkvUkNaRmdkY1M1R0RCTWF4eTc3bTRj?=
 =?utf-8?B?VDh6dUM4TTQwRmY1NU9aZ0NYWW1RbTRMaEVnVWtaL0RhcWxvSll4TFZsV2ZC?=
 =?utf-8?B?aXM2MzBKaDhLLytEck1mS2xDREM4N1BJRDl6T1NVNkZZOEhPNDA2Y2VqNkJH?=
 =?utf-8?B?V3F1N3hrMUpCbXgvaWpaRFNsUWp2d2FJUmRuMFNmR0N2cW5POGVPMStMcnU1?=
 =?utf-8?B?QTVGVlFGUmd3MlNyWjgwTEllUnZjbVB3ekVDOEFKc2tNS0Y2VHQ3NmxoYTdx?=
 =?utf-8?B?TVJRSDZqT0FUaitZcmhxRTVidEYzSFVBanNORk5XTjYvTGVvdW1yczRROWQ5?=
 =?utf-8?B?QlFoUUxzK2tqNTIxSEZ2NThDN2NOZThjNW9MWWx5M1piRmZIdUdyRlNIMXdj?=
 =?utf-8?B?c3FkL2lBdnJuM0NseWJHVFRYQmNyOGNMSEhQRkFta1ZTZ2tIeGxEWS9rTlF5?=
 =?utf-8?B?ank1TnJ3WkNxc3FqT243RzNqd2t2bXpXQXpSeC9VSUQ3QXI5b2JyNkxUV2lF?=
 =?utf-8?B?MkZ1aVQ5RXE1ZEhQZG96MVlWSUtqZktmS1djWUNTd3p6enRkVnNQNGtIbVVI?=
 =?utf-8?B?NjFIYi9XWkR1ODFWUXFlZFRqYWw0c2VhTnJqSHU1bEx6NDNZWUNLNWw1d0Z5?=
 =?utf-8?B?RTduVFNpZk92UWFNeTNKU2IyelNxa2tBRlpxM1RGNUdzYTdxVlYrYS9lUEFT?=
 =?utf-8?B?TEsyc3F4QS9iVDIxUGxoWXBROW03cVZLLzNEREo3NCtIOG1xWllreUlCclo0?=
 =?utf-8?B?UitjTnNSR1VvSnRZUmtiU0JVWE5YaG1XZDB0MTFnM3Q1SHA2eWIxQlcrSGJP?=
 =?utf-8?B?WGROdzRDRG16YU9waHVCM21Jcy8rNmNvQXE1V0NuOXVCWE1mTXZuM29jNEV2?=
 =?utf-8?B?cHdmdWFLUzZSMDUvak5FdVhrcUQ2MzNMVkYvd1Y4bTk4ZlE1dEl0MDJ1dzgv?=
 =?utf-8?B?TVM1MzU1TXZWbDR5OUY5M3RHNXBZNWZkQUR4L0dEZUkxdU1sMHNFQUx5aGw3?=
 =?utf-8?B?R3Q1MitXL1RLbTVHc0xLc1F1M2ZQRGFiVlZ4VGNLMVlwMjlWcENRczdIbVJR?=
 =?utf-8?B?ZjR5eEZ6NkhsYjJ0U0hzMU5id3NtaWRMVlBld3VJU0M2TkRaMmRmeEM1OGlz?=
 =?utf-8?B?eGh5SDdUL0tGQnBjYUh5NmkwOVRURlFGYm5nRHlZZURPV3lTZUszWkx5NUtu?=
 =?utf-8?B?dGx0UlphTXVuVGRYK0VUYUxtcDEvN1lNSUoyRXpLNVZ2eUlLOHdQVnRnV21Z?=
 =?utf-8?B?bXU1Wjh3dTFzNEpnMTFjbE9KRllsVVMrN2dRY00xWGQ5TERoQXBUbGZsa2lz?=
 =?utf-8?B?R2dTN1ZUQ1FoeWxoUURuNmNseFFBR0c1Qk5ZeFNoa2lLV1d4VmpFUTBFbTlm?=
 =?utf-8?B?YUxWbVF3YzZzcVF5eDJOWC9pa2p5SHVwSFUzMllkaWRpNE5jditMNGoxM2Q4?=
 =?utf-8?B?dm9jSHEweU9WVElJSHRhU2gvTGJxSXVjRlZVd0xEZURmV1pUVEI3bXVTekZj?=
 =?utf-8?B?MkRRcTg5TFpGcE40UDFrNFBwQ0tGZHZUL1REVVRZU1ZhWk45bUZIMVM5ZzBT?=
 =?utf-8?B?Umt0TnZXMUF3YXlRSWNvWG5ldXIzNXFuVk5lVkd0SE5UNHhzVGNOT0xRajRD?=
 =?utf-8?B?amxVZGhtaERoVjBIU3dNKzRzVFJqYWh4ZXFtMC9BZkNCc0dvaUdBcnJ3cnVk?=
 =?utf-8?B?N2tyWnZHM3d0Rk5ZMUd4Rll1U3Fzdlp2d29sYXRJcllMWlRLL2RtdHFabjFI?=
 =?utf-8?B?VHI5WnAveXkzT20zVjNlT1Y1ZmlCTGZCdlRvV2grU0VYWGVEaU5iZzIwdmlq?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: multipart/alternative;
 boundary="_000_01fad5a237f5018521cf426342fc2bac975e09f1camelintelcom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9ffdbe-fda1-4d8f-b346-08db8e0fc82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 19:37:43.6915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVzp63hpf8iC9GbbRcsTHXPIyNBtwtkiGkodm3hbB1eRqad7GICL7D+eg3dIDQBuq4f0lXkG7tTPCeoFgV7N1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7601
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add DRIVER_DATE to coredump
 error.
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

--_000_01fad5a237f5018521cf426342fc2bac975e09f1camelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDIzLTA3LTI2IGF0IDE5OjI5ICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
T24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMDM6MjU6MTlQTSAtMDQwMCwgUm9kcmlnbyBWaXZpIHdy
b3RlOg0KVGhpcyBtaWdodCBiZSBhbiB1c2VmdWwgZGVidWdnaW5nIGluZm9ybWF0aW9uIGlmIHRo
ZSBkcml2ZXINCmRhdGUgaXMgcHJvcGVybHkgdXBkYXRlZCB3aXRoIGEgY2VydGFpbiBjYWRlbmNl
LiBXaXRoIHRoaXMNCndlIGtub3cgZnJvbSB3aGljaCBwb2ludCBpbiB0aW1lIGluIG91ciBkZXZl
bG9wbWVudCB0aGUNCmRyaXZlciB3YXMgZnJvbS4NCg0KDQpNYWtlIHNlbnNlIHRvIGhhdmUgdGhp
cywgd29uZGVyaW5nIHdoYXQgdGhlIGNhZGVuY2Ugc2hvdWxkIGJlLi4uDQoNCmJlZm9yZSB3ZSBh
cmUgbWVyZ2VkIHdlIHNob3VsZCBwcm9iYWJseSBjaGFuZ2UgdGhlIGRhdGUgYWxvbmcgd2l0aCBv
dXIgcmViYXNlcy4NCg0KYWZ0ZXIgd2UgYXJlIGluIHRyZWUgcHJvYmFibHkgYWZ0ZXIgdGhlIGxh
dGVzdCBwdWxsIHJlcXVlc3QgdG93YXJkcyB0aGUgbmV4dCB2ZXJzaW9uLg0KDQoNCkFueXdheXM6
DQpSZXZpZXdlZC1ieTogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb208bWFp
bHRvOm1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPj4NCg0KU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBW
aXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPG1haWx0bzpyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pj4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIHwgMiArKw0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVk
dW1wLmMNCmluZGV4IGY1M2Y0YjUxMjMzYS4uNzliNTA2ZGMyNjIyIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmNvcmVkdW1wLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZjb3JlZHVtcC5jDQpAQCAtMTAsNiArMTAsNyBAQA0KICNpbmNsdWRlIDxnZW5lcmF0
ZWQvdXRzcmVsZWFzZS5oPg0KDQogI2luY2x1ZGUgInhlX2RldmljZS5oIg0KKyNpbmNsdWRlICJ4
ZV9kcnYuaCINCiAjaW5jbHVkZSAieGVfZW5naW5lLmgiDQogI2luY2x1ZGUgInhlX2ZvcmNlX3dh
a2UuaCINCiAjaW5jbHVkZSAieGVfZ3QuaCINCkBAIC04Myw2ICs4NCw3IEBAIHN0YXRpYyBzc2l6
ZV90IHhlX2RldmNvcmVkdW1wX3JlYWQoY2hhciAqYnVmZmVyLCBsb2ZmX3Qgb2Zmc2V0LA0KICAg
ICAgICBkcm1fcHJpbnRmKCZwLCAiKioqKiBYZSBEZXZpY2UgQ29yZWR1bXAgKioqKlxuIik7DQog
ICAgICAgIGRybV9wcmludGYoJnAsICJrZXJuZWw6ICIgVVRTX1JFTEVBU0UgIlxuIik7DQogICAg
ICAgIGRybV9wcmludGYoJnAsICJtb2R1bGU6ICIgS0JVSUxEX01PRE5BTUUgIlxuIik7DQorICAg
ICAgIGRybV9wcmludGYoJnAsICJkcml2ZXIgZGF0ZTogIiBEUklWRVJfREFURSAiXG4iKTsNCg0K
ICAgICAgICB0cyA9IGt0aW1lX3RvX3RpbWVzcGVjNjQoc3MtPnNuYXBzaG90X3RpbWUpOw0KICAg
ICAgICBkcm1fcHJpbnRmKCZwLCAiU25hcHNob3QgdGltZTogJWxsZC4lMDlsZFxuIiwgdHMudHZf
c2VjLCB0cy50dl9uc2VjKTsNCi0tDQoyLjQxLjANCg0KDQo=

--_000_01fad5a237f5018521cf426342fc2bac975e09f1camelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <EBDFA9880F9AED40A225A0A1D25A4168@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZT5wcmUsY29kZSxhZGRyZXNzIHsNCiAg
bWFyZ2luOiAwcHg7DQp9DQpoMSxoMixoMyxoNCxoNSxoNiB7DQogIG1hcmdpbi10b3A6IDAuMmVt
Ow0KICBtYXJnaW4tYm90dG9tOiAwLjJlbTsNCn0NCm9sLHVsIHsNCiAgbWFyZ2luLXRvcDogMGVt
Ow0KICBtYXJnaW4tYm90dG9tOiAwZW07DQp9DQpibG9ja3F1b3RlIHsNCiAgbWFyZ2luLXRvcDog
MGVtOw0KICBtYXJnaW4tYm90dG9tOiAwZW07DQp9DQo8L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHk+
DQo8ZGl2Pk9uIFdlZCwgMjAyMy0wNy0yNiBhdCAxOToyOSArMDAwMCwgTWF0dGhldyBCcm9zdCB3
cm90ZTo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAg
LjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8
ZGl2Pk9uIFdlZCwgSnVsIDI2LCAyMDIzIGF0IDAzOjI1OjE5UE0gLTA0MDAsIFJvZHJpZ28gVml2
aSB3cm90ZTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIHN0eWxlPSJtYXJn
aW46MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3MjlmY2Ygc29saWQ7cGFkZGluZy1sZWZ0
OjFleCI+DQo8ZGl2PlRoaXMgbWlnaHQgYmUgYW4gdXNlZnVsIGRlYnVnZ2luZyBpbmZvcm1hdGlv
biBpZiB0aGUgZHJpdmVyPGJyPg0KPC9kaXY+DQo8ZGl2PmRhdGUgaXMgcHJvcGVybHkgdXBkYXRl
ZCB3aXRoIGEgY2VydGFpbiBjYWRlbmNlLiBXaXRoIHRoaXM8YnI+DQo8L2Rpdj4NCjxkaXY+d2Ug
a25vdyBmcm9tIHdoaWNoIHBvaW50IGluIHRpbWUgaW4gb3VyIGRldmVsb3BtZW50IHRoZTxicj4N
CjwvZGl2Pg0KPGRpdj5kcml2ZXIgd2FzIGZyb20uPGJyPg0KPC9kaXY+DQo8ZGl2Pjxicj4NCjwv
ZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+TWFrZSBzZW5zZSB0
byBoYXZlIHRoaXMsIHdvbmRlcmluZyB3aGF0IHRoZSBjYWRlbmNlIHNob3VsZCBiZS4uLjxicj4N
CjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+YmVmb3JlIHdl
IGFyZSBtZXJnZWQgd2Ugc2hvdWxkIHByb2JhYmx5IGNoYW5nZSB0aGUgZGF0ZSBhbG9uZyB3aXRo
IG91ciByZWJhc2VzLjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+YWZ0ZXIgd2UgYXJl
IGluIHRyZWUgcHJvYmFibHkgYWZ0ZXIgdGhlIGxhdGVzdCBwdWxsIHJlcXVlc3QgdG93YXJkcyB0
aGUgbmV4dCB2ZXJzaW9uLjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5
cGU9ImNpdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDsgYm9yZGVyLWxlZnQ6MnB4ICM3Mjlm
Y2Ygc29saWQ7cGFkZGluZy1sZWZ0OjFleCI+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5Bbnl3
YXlzOjxicj4NCjwvZGl2Pg0KPGRpdj5SZXZpZXdlZC1ieTogTWF0dGhldyBCcm9zdCAmbHQ7PGEg
aHJlZj0ibWFpbHRvOm1hdHRoZXcuYnJvc3RAaW50ZWwuY29tIj5tYXR0aGV3LmJyb3N0QGludGVs
LmNvbTwvYT4mZ3Q7PGJyPg0KPC9kaXY+DQo8ZGl2PiZuYnNwOzxicj4NCjwvZGl2Pg0KPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4OyBib3JkZXItbGVmdDoy
cHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxkaXY+U2lnbmVkLW9mZi1ieTog
Um9kcmlnbyBWaXZpICZsdDs8YSBocmVmPSJtYWlsdG86cm9kcmlnby52aXZpQGludGVsLmNvbSI+
cm9kcmlnby52aXZpQGludGVsLmNvbTwvYT4mZ3Q7PGJyPg0KPC9kaXY+DQo8ZGl2Pi0tLTxicj4N
CjwvZGl2Pg0KPGRpdj4mbmJzcDtkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2Y29yZWR1bXAuYyB8
IDIgKys8YnI+DQo8L2Rpdj4NCjxkaXY+Jm5ic3A7MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKTxicj4NCjwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+ZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZjb3JlZHVtcC5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmNvcmVkdW1wLmM8YnI+DQo8L2Rpdj4NCjxkaXY+aW5kZXggZjUzZjRiNTEyMzNhLi43OWI1
MDZkYzI2MjIgMTAwNjQ0PGJyPg0KPC9kaXY+DQo8ZGl2Pi0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9kZXZjb3JlZHVtcC5jPGJyPg0KPC9kaXY+DQo8ZGl2PisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9kZXZjb3JlZHVtcC5jPGJyPg0KPC9kaXY+DQo8ZGl2PkBAIC0xMCw2ICsxMCw3IEBA
PGJyPg0KPC9kaXY+DQo8ZGl2PiZuYnNwOyNpbmNsdWRlICZsdDtnZW5lcmF0ZWQvdXRzcmVsZWFz
ZS5oJmd0Ozxicj4NCjwvZGl2Pg0KPGRpdj4mbmJzcDs8YnI+DQo8L2Rpdj4NCjxkaXY+Jm5ic3A7
I2luY2x1ZGUgJnF1b3Q7eGVfZGV2aWNlLmgmcXVvdDs8YnI+DQo8L2Rpdj4NCjxkaXY+KyNpbmNs
dWRlICZxdW90O3hlX2Rydi5oJnF1b3Q7PGJyPg0KPC9kaXY+DQo8ZGl2PiZuYnNwOyNpbmNsdWRl
ICZxdW90O3hlX2VuZ2luZS5oJnF1b3Q7PGJyPg0KPC9kaXY+DQo8ZGl2PiZuYnNwOyNpbmNsdWRl
ICZxdW90O3hlX2ZvcmNlX3dha2UuaCZxdW90Ozxicj4NCjwvZGl2Pg0KPGRpdj4mbmJzcDsjaW5j
bHVkZSAmcXVvdDt4ZV9ndC5oJnF1b3Q7PGJyPg0KPC9kaXY+DQo8ZGl2PkBAIC04Myw2ICs4NCw3
IEBAIHN0YXRpYyBzc2l6ZV90IHhlX2RldmNvcmVkdW1wX3JlYWQoY2hhciAqYnVmZmVyLCBsb2Zm
X3Qgb2Zmc2V0LDxicj4NCjwvZGl2Pg0KPGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDtkcm1fcHJpbnRmKCZhbXA7cCwgJnF1b3Q7KioqKiBYZSBEZXZp
Y2UgQ29yZWR1bXAgKioqKlxuJnF1b3Q7KTs8YnI+DQo8L2Rpdj4NCjxkaXY+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7ZHJtX3ByaW50ZigmYW1wO3AsICZx
dW90O2tlcm5lbDogJnF1b3Q7IFVUU19SRUxFQVNFICZxdW90O1xuJnF1b3Q7KTs8YnI+DQo8L2Rp
dj4NCjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
ZHJtX3ByaW50ZigmYW1wO3AsICZxdW90O21vZHVsZTogJnF1b3Q7IEtCVUlMRF9NT0ROQU1FICZx
dW90O1xuJnF1b3Q7KTs8YnI+DQo8L2Rpdj4NCjxkaXY+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwO2RybV9wcmludGYoJmFtcDtwLCAmcXVvdDtkcml2ZXIgZGF0ZTog
JnF1b3Q7IERSSVZFUl9EQVRFICZxdW90O1xuJnF1b3Q7KTs8YnI+DQo8L2Rpdj4NCjxkaXY+Jm5i
c3A7PGJyPg0KPC9kaXY+DQo8ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwO3RzID0ga3RpbWVfdG9fdGltZXNwZWM2NChzcy0mZ3Q7c25hcHNob3RfdGlt
ZSk7PGJyPg0KPC9kaXY+DQo8ZGl2PiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwO2RybV9wcmludGYoJmFtcDtwLCAmcXVvdDtTbmFwc2hvdCB0aW1lOiAlbGxk
LiUwOWxkXG4mcXVvdDssIHRzLnR2X3NlYywgdHMudHZfbnNlYyk7PGJyPg0KPC9kaXY+DQo8ZGl2
Pi0tIDxicj4NCjwvZGl2Pg0KPGRpdj4yLjQxLjA8YnI+DQo8L2Rpdj4NCjxkaXY+PGJyPg0KPC9k
aXY+DQo8L2Jsb2NrcXVvdGU+DQo8L2Jsb2NrcXVvdGU+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRp
dj48c3Bhbj48L3NwYW4+PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_01fad5a237f5018521cf426342fc2bac975e09f1camelintelcom_--
