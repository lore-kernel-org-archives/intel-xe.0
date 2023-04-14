Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7460BC77B72
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 15:12:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DCD10E19B;
	Fri, 14 Apr 2023 15:12:20 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E78A10E19B
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681485138; x=1713021138;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=r76wk/rAXejOE9ePjouZlJrTlbu5R19Z6VY3NTwGIrY=;
 b=cYzQkObl7qjgskCsFE5dEU3X1B4f199pBKia6fW5sY0hdO2tGPr2vCDz
 hui3nTEtt1G7CSFPh0EhS2I32a1k8TWOjnquCFpFh4J+v1cDUZZYAGs3w
 7wsc1ml5LLMu9P7p0uIfHNqZUvxBQgxuqsJgFV0k29T9a5LzmE8MXkNrw
 5GlSEXJYrK9/tN3w8yhAyK0aXgWf8oYv/RHolTdy8160l2cKEhfWrZmrH
 ib/lWuXl5QJMip3aOor4AJ5uOz7h5LKyD36rtFYpn78JXEsCT8eNWB1Oj
 NEewqWXgslEHKGeL9OCoFR4L7YKer09fVOcLyMYuaq+JB8bZ2QLLRDAWA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="347205285"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="347205285"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 08:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="689834081"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="689834081"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 14 Apr 2023 08:12:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 08:12:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 08:12:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 08:12:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 08:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvYCuyQ2sh8yfich1AjIRPVaaVHK2FORQyeplQn9RCnPbyI4exz1HP/HKl+OM819dUlnBJoO69IcaGxCmCewNtDVPXcE9g2nIUcXUcLuXm4YL5pxDQPJvChVD2IdjB6xS4/yFLQegSDk62OEy15xndDnmEHWFD3/+pc03D6mFOldG9Be3ri0IPEcZWzZHqjgUTK5ECZnXuXweKfig8Tvqjz0bVs+P/xhV0YNCJXAPDHx0vSMSx4Ss/II4U8RyltF9Jcd1bEVBwxjh2Oi9z5gYscpbBPBYG9KL6Njgwp3+6F9k8lCpRDKob3n4qzQG7unnCc9XWvkldOUQWlHXxENNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r76wk/rAXejOE9ePjouZlJrTlbu5R19Z6VY3NTwGIrY=;
 b=bdE7phWUVAcZ5Xt8blQNVL4kdOJ1sVNCtEx/MxkOtO8CdOZEHd+ETLR3zgr3VGtRBkLFPUwFg/IByl2QmFl1TJzeUU8S4AxwqWkLAZrAqLLrLAbeZIe1laE/eWNz5vD9x0twpGviMt6XaCMQNYoPbbRrlh01gbf2GWDlwWGtZGbq7+b3WNiGatXLFYH09EzqhPEkVY7gzyKeqwZOpt+ENeGp7vNaLpHplT+BznsuaA8E9eANjVbZO5CLIreznEH2r6/EiGVfWpwuEFYLwMqthFJejCjtMNV1s0ms6r3Xu5cE7GioD62fcYuwmfGMeQrwiGl4fwDtmLHeVcfhD8l4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by CO1PR11MB4817.namprd11.prod.outlook.com (2603:10b6:303:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 15:12:06 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 15:12:06 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Add missing spin_lock_inits for
 display
Thread-Index: AQHZbuIkU/cTT4K1YkWzr6JmLgE3xK8q6SuA
Date: Fri, 14 Apr 2023 15:12:06 +0000
Message-ID: <198de1fd70483b1e15d2bf448af5244350cc711f.camel@intel.com>
References: <20230414150025.492558-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230414150025.492558-1-maarten.lankhorst@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|CO1PR11MB4817:EE_
x-ms-office365-filtering-correlation-id: c4f7ab3b-d48f-487c-cb4b-08db3cfa9c41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W1ax+evRcgKWAyteVqu7FmCgF7lBQgtBNM8vGt2Q0qDhImO7xvuaT+FHiWD2T61Enxef8kJNH3juAdn0wAVdcZjQPdvEtZnWf2RMASyW280XEo0Yz4Z8nOtt4/6jHaHGCLeAsRTjiEe5g8vrqZEGDuot4N2SeXc9qb9Cn+7dYGXsqkxRQc3g4BfUIqEUXfs6DtiYI6KwEXvWi56BHqZf0cPI+5DFger+QvF/6Z1YoNY1fC4cltIDaa9oTN0g10SklURd4HLQleO8QaizO32nHS6XTI+lbIv8uAB27HrRI9HYFVSiUyNybBate6DAZJxP8aDgMGZVRSwAJYYtLxM/imQoE70KxdL6btVLDMCSX6gX1Oiw58T8N3suFX6No1PKlAqFOVPU2apSTkRBmS+9n732Q2dVmCe/PfHqmVoElGApIZq6kk5di/rXl0a3yx6iycMHt1Nu/2w4EU/RmbqyWbSU9PwhRROlGq+OalDaq663skhUfdMriSBaRZ1Ux/58AT9Xtaxcqbv419doxGG3CN+V6PUrxaDxM9jgqsCuSNHmgAIqty9cJ8p1v5FSKpAS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199021)(71200400001)(6486002)(966005)(5660300002)(4744005)(66556008)(66476007)(66946007)(36756003)(66446008)(76116006)(91956017)(64756008)(2906002)(38070700005)(86362001)(38100700002)(122000001)(41300700001)(82960400001)(8676002)(8936002)(316002)(478600001)(110136005)(6512007)(6506007)(26005)(2616005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWtvSWMzQkpCRUhpS0RpOGZpK2FRMm1Ib01yWmNSbVI5bFJVaWtmTDkvVEVN?=
 =?utf-8?B?STJ4MDNFUndTRlhUL3Q2S2d4R3Bxa2tFYzNJSjZkNG1BY1VDQ2lLdFh5VFd5?=
 =?utf-8?B?Z2Z6emwySFNkMmtBdm45RzR3S2RKU3VHaTZWQTVoYVdqYzJLV1V1RkxCdGFz?=
 =?utf-8?B?T3BPQjIzN1paSm5ONDRRODBMYmY4SDhQYjUvbzNnSm9nc2Y5UUpyanNhdHhi?=
 =?utf-8?B?cnJwNnRySW1DMUNINGNINDlRZlhwYkE1VnNqT25zWHhVeU54QTc1eVBnNUZH?=
 =?utf-8?B?akh6UVNZRUlOVDVadkZxcUxzVy9VSFF1Q1hHRi9ZZVlUNGRuS0ZoTjhwT04z?=
 =?utf-8?B?b0VZb1NPUjZNVjVjRXIzNHRHZ3Z2YVREQ2pWSEJ6NHdkdXVnZzRpNnBDa0Qy?=
 =?utf-8?B?Sml3Y0hKYVdQSlA5T2hXNFpqSTVZZkozNGVFaWRkdklEdytveDlIeFJ4ZUVa?=
 =?utf-8?B?L2JQd3EwQUIxMDNJVDhycnZEVkxoc0JIaW1tdnRvcTRXTVNnQTZwS3g4TFJ4?=
 =?utf-8?B?WGhVMnQxSHVVajhZUWJtRG1BcnUzSnZYSHlpMlJ0VjNabnBjdmx6MXU3bTJE?=
 =?utf-8?B?YjljLzkxcS9WRkJ5SEYxSG1zeEtHZGZIdEtyd0RNUjc3UHBZU3dsYkVnUVd0?=
 =?utf-8?B?VVQvWkpZSjk4VHB5RUNIN2tGMnMwbG5iZXZ4Q2FzUzZ2V0VtN21iYjdBOWI3?=
 =?utf-8?B?QndVQlRDRzI5ei9raXJEaGRUNUJMTG14c2ZWMVQ1OVVKcGhKTGFWcUMvMjhX?=
 =?utf-8?B?WWVUTGs2UmNVV0VjY0ZBaURwY2lxdEpFcmhJU0NPMFg0a0Y2b0xoT2JJajdD?=
 =?utf-8?B?aTJUcnNNSS8yNTY0UGl0VWpBajRJNUFMbk1rTkpSUkNnVUl5K0d3V01tTWkw?=
 =?utf-8?B?S2l6bDdRVTB3eWlJVDl2YlJ2N1d2ejV4enQ5emN3d1E5MFJOU1Flay9CL1ds?=
 =?utf-8?B?R0tBTFp1b25zTXBBNGw2dlNjdEpxVkM1TVdJcWhsbFFlRlRDWEtTeU9Qdklh?=
 =?utf-8?B?aWQ5RkNla2YrQmx2MFZtMGk2Ymcxc3hVVnRrZlgwZ3dzYURDUkRJOE82VXhx?=
 =?utf-8?B?VFRBYm84NUxNeVh1QnJJR09oU0xIdHJTd3A2WWhxT1V6SkpCTVErQms1dGNv?=
 =?utf-8?B?ZGFaMFZpWW9WWkJaaFlBbEJocmNWemUvcSthblVNMGEvN0dFUzNEdk91Yzc5?=
 =?utf-8?B?Tk0xWXlraUxtZURiT3V3MWYrSVpmOTV5NEtIM0JlTlpNeHcyQWFkOVNQU0Vo?=
 =?utf-8?B?NzRrbHlySW55dG9scUxmYzcrUnp1SVlUYVNuVS8yVVFNUitSWllhOHh5Wko4?=
 =?utf-8?B?cEI1TmRTYmtJY3poeHFsbSt2YUY0RkVjcnI5ZDA4VDIveUlZcDNqY3FNcldk?=
 =?utf-8?B?cnc5dVRyUGtMWmtqNGpqV2Z1ci9PTnA1MXkzNXdSS0J6SllnU0szWDFqODFU?=
 =?utf-8?B?TEkwTWVVM3FQVWpEL3Z6a29NMmNvVmVHdGd1czVmVGRaM3RibHNyZjl5TGZP?=
 =?utf-8?B?eExTMjI3MW9jZnB3bmcxYTdhMGt5SzVsN1RWZE1lcXVQS2JQVEZScVdnNWRi?=
 =?utf-8?B?c0EvVmRLTzVGRmNNalBPdWhqOERyd09oK0hiYWdoV204UGxGS284TjNlbzRn?=
 =?utf-8?B?QkVDcSt1Q1VHdFdPa2lZUDhpTG4yeWpjWi9vN2RYeDUrTFNYVHdnT1B3dWJK?=
 =?utf-8?B?bnBlVkFEdkZRd0JPQVZScHhnWlJ0UmIzdVdYL2Q2YkxXUDJZQUoxMHppcXFH?=
 =?utf-8?B?elA3MmM5amRDa3BjMUkyaG8rUXIweXJHMjgrdENldGxxQ2NrNERTY0t2Qnoz?=
 =?utf-8?B?TjE1eTRPcmR4ZHBBK0RUdmsvZitnTkVobEJQQzdGeU1NaWxFNW5rUFU2RTV3?=
 =?utf-8?B?N0dRSk5JZ00rRHE4dzNyN21NMk9NWHE5NlRIU2FkalVyY3N3N2kxZmtDdHNV?=
 =?utf-8?B?N3V0M25DMnRONEdWUzJuNEg3cWNKOHd6akc0UjM5bnFmYUd4L1BBY09FRm91?=
 =?utf-8?B?Z2xQeWwzdEhqbWZIcjNCNUJHMTFValRhazlUMTFVRFJqYnVCSVJTMXkrczF1?=
 =?utf-8?B?M0greHd0Rlp6ejh2Rk55RHFFVloyZGYrUjNyQnc3Y1JMeTI3ZkpYdDJLWWFL?=
 =?utf-8?Q?phsmzovJgB0B6c38cMhK9njx+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5133F4395E95D04D9488BC18FD94C6FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f7ab3b-d48f-487c-cb4b-08db3cfa9c41
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 15:12:06.3720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8iIuCb0rTYYezYavAWPSpvVHeeDgBtJBgIdaHu6YJ4tPnVsHsT1JhbmtLXRo4DSUNut/J7D1LdvL+4xRWMUDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4817
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add missing spin_lock_inits for
 display
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

T24gRnJpLCAyMDIzLTA0LTE0IGF0IDE3OjAwICswMjAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gV2UgaGF2ZSBnYWluZWQgMiBsb2NrcywgYmV0dGVyIGluaXQgdGhvc2UuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kaXNwbGF5LmMgfCAy
ICsrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9kaXNwbGF5LmMNCj4gaW5kZXggYWFlMzYyZjI3Yzc3Li43MTlhNjQwMDVlMjkgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kaXNwbGF5LmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2Rpc3BsYXkuYw0KPiBAQCAtOTEsNiArOTEsOCBAQCBpbnQgeGVfZGlzcGxh
eV9jcmVhdGUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAJaW50IGVycjsNCj4gIA0KPiAgCXNw
aW5fbG9ja19pbml0KCZ4ZS0+ZGlzcGxheS5mYl90cmFja2luZy5sb2NrKTsNCj4gKwlzcGluX2xv
Y2tfaW5pdCgmeGUtPmRpc3BsYXkuZGtsLnBoeV9sb2NrKTsNCj4gKwlzcGluX2xvY2tfaW5pdCgm
eGUtPmRpc3BsYXkud20uZHNwYXJiX2xvY2spOw0KDQoNCkFscmVhZHkgaGFuZGxpbmcgaXQ6DQpp
OTE1IHBhdGNoZXM6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTE2
MjcyLw0KeGUgcGF0Y2hlczogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmll
cy8xMTYyNzUvDQoNCg0KPiAgDQo+ICAJeGUtPmRpc3BsYXkuaG90cGx1Zy5kcF93cSA9IGFsbG9j
X29yZGVyZWRfd29ya3F1ZXVlKCJ4ZS1kcCIsIDApOw0KPiAgDQoNCg==
