Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9967BC7618E
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 16:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA0310E195;
	Wed, 26 Apr 2023 16:50:56 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0093F10E195
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682527854; x=1714063854;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HIanewNudCvi8/x3JkTE9GJ6jfS2vJ6BqRGPZWpQOVI=;
 b=SOmTkQ/HZneW8LFOMx5eqE/v4L3ZXGTwH/DXNj6CM5d6cxxiOunBS88M
 fE0yXm/V/E6s4OP1xuiE+JWqvCN4xMTfUrGS4PdiOkoMsVMK+YcKY1hvu
 j7cph7aAaGYHNm0vhg3igBSNQyhuMGBhB4mWN91TaEsO5U7uKdg/4Iuji
 0F/6yGGMW46IZ80pZNw6j0dpAudONlSw3WRVdQWrYyFBj5jGJOhRlcILW
 St/lXvYoY9X5WaJuzxhitBR5/tvf38mFAHadHhA5wD74gQP3wC/LEtqYb
 9uM81QlE2jcMcgX3nADEQ0e9IFrzuHCk62QySTvsvlXxvw/I0B5s+OXgQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="344620641"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="344620641"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 09:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868356259"
X-IronPort-AV: E=Sophos;i="5.99,228,1677571200"; d="scan'208";a="868356259"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 09:50:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 09:50:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 09:50:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 09:50:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 09:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfLeZbFvdei1cOPbNzzHAmEm5ihXZJlWnvXaNLq9BqZw5q4wJo5A0FznCe8IveLYVT6qBjfwPlS6+6uID413+m9QlsJxoDPVr1486FWv0AhKqzU/A4cmXTt7VY1eHG8m7qEGbOvJ65+/uu2Oj4zRdV3JlcgD7GCvDYSLSed1Qk8ztDSV2FllZnUQT2qHfgyBsxyO3jtWbAWOFxB8Ccihg5rapUmBl7e2788NJxtCCAIUQ85IenFm23AX9nK2XWLvqPyrcBpsUJxtYM7aS7K96K37qLgzxoTomIMV4CQH6UpSQth+OWpflJ7UE/aCwraFLEQaVGzUuk1sMq37J8Ip4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIanewNudCvi8/x3JkTE9GJ6jfS2vJ6BqRGPZWpQOVI=;
 b=FBMOnxSCjWUjrGja6j069pXIrg0rn4E+CCHY1KWp835pEQ95XuSJjCBvMsnn7274CcKwzjv/vNMwMEfOGQrMuuLvYBDRW/oBc2XC4cu1iiRljfYeWhCH/H98OlztsN/yhhtUzOcGc6jW5Nu4vyWUWsvIOSjobAdxDl7FnS3uRxypppGm2C4lbTamXFPMMm3BefgAeNSS/WsfWNLgwTonGKJWmM+oZTZ6S4eorV9ja0DEqcJf2auqTMiScU2Gqkqjmp6F3f9w4k4Y8UF+gc6/BkrYfgycaFXJx0Q/99EmYr8JUmYT2jqFmIQPtLSrG29B8Gu+AS91UFT3QcJk7/UyKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 16:50:50 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::3fa1:b97c:a5bb:651%3]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 16:50:49 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH] drm/xe: Limit system memory size of half of system memory
Thread-Index: AQHZeF5iJk6JKBLmckWDLJhWBC6ghK89zcCA
Date: Wed, 26 Apr 2023 16:50:48 +0000
Message-ID: <7633135411e0733215d91db64249e401d1909aea.camel@intel.com>
References: <20230426164410.48171-1-jose.souza@intel.com>
In-Reply-To: <20230426164410.48171-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB7467:EE_
x-ms-office365-filtering-correlation-id: 9991740a-d415-4be0-8d86-08db46766358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IIV+ZMpCDL7hX8HKN7ZdjZItGMTzBSJE607QLEnw3XePgz5E/0rJikjYsn1EUghf/gn26aEZOrpEQJHZuC7Rnq8RgmJm/dOjRgeWtQqhnwOg44h+7imeXNjzCzGSN886HJZvFF1KUslG9RVg0LbcFdTbyoPnZmnIrj/1DBIu6DsJm9FLHqzbGducece4lcgguFXCoIIuQ1mR2XZU4f7N4siah7kkJhFkXSOqw0KMbGwb7G1p0jrecyyYolVY4BUEWm+qGicwv5aL27sERe294z0oSLoVLCVbaMy587UZcDRwp7I/IHnyY6MWDWocEgartj4VfVohG7de1/Fna9mJ4ruxbne266KJPBr+gg6S3KO1D2mC9Lm1HAWcYWD1JJwbeqmEBBQrQ2VZ2MoTmRR3gUSOGTRgNX6R16bMBbT2tEnKC9yw1EcOnZgIRaozTB06w6feV4SnJ3YvS4iRV1kdQkylQ1vx0zwIUOlddbFhx1SlcdNN8qepDIiJuwzvMqr9067a5vcKGhSGL6f8yA1NjY2XCSVrIH6MRoYAjY6vg3ThNSgEKAOGjFbB0YpT8UxHFSXBFzuF4Jk42ZFQYbwr3btHxmClelRHCB4dZKB8Gzp9/xFcDJjbbna5IFXPXqhA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(86362001)(36756003)(2906002)(38070700005)(71200400001)(6486002)(186003)(83380400001)(2616005)(6512007)(6506007)(26005)(66446008)(6916009)(91956017)(76116006)(66946007)(66556008)(66476007)(64756008)(478600001)(122000001)(316002)(82960400001)(41300700001)(5660300002)(38100700002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjFzK1R0Y3ZMT1NSKytFcjNiZTBaaC8xL3JPa09rbjFhWFdnRXpqY3NnRkVL?=
 =?utf-8?B?MHRZcmFMUnVlVkFQdndRcGR1L3d6R2tIZVYyc1J6OFFyRWQwQ2xJR1ZORGsv?=
 =?utf-8?B?aUV3eVBSWjB5bTBneFdkeUVCZEhXMU5seElDNzVuZmJnRXMxQm5FdEQ2dkZM?=
 =?utf-8?B?Yk93T0NxSGdvTm5meHlINTJJWE5aM2RNUkgySmVmOWtBdnRVdmZYZGx0cGxS?=
 =?utf-8?B?N2dVSEI5QVRKSTlVRWNIbU92RGsvYlcvVjBQMUZXVVl3VDhQRGNKeFViZnZI?=
 =?utf-8?B?dEJjNjFmZlVhcTQ2alVlc1BBaGpzUVlLUmVuNWczUTd2YitkNGxnWGM0YTgx?=
 =?utf-8?B?RTJnV0Q1SzV2RXBrMDh0RldXcVhvZS9IVlFpZHlxT01uS28zWDBUZ1hXN204?=
 =?utf-8?B?STJiYzBvS0NHNWxtZFMzb0c5dzNTbnhCL2ttc1VPTmw2OU5XYU9uVnhKS3BU?=
 =?utf-8?B?NXpPT3gxcUNtRE82MmhzYmFSemFoNjQxYzRYL2VKS1JydjdUbWdTUjRxU1l4?=
 =?utf-8?B?VERlU0FQcFRRTGpLVzVlbW0xeUNDZWprNmZ4VVdnVDBwVW9vaVJYaWE0MXY3?=
 =?utf-8?B?N1EwYXUxK3hFczhLa3E3cDFPUU1QNm9maVdLRjZ6TEg3T3FKbUI1dFJHSHAv?=
 =?utf-8?B?ZUV1VWl4aHhQYlVUb2U2Y3JGbzFBdWNrakJWUjNYVHBrNElhVUw5NGZqY3kz?=
 =?utf-8?B?NWlmRFhDZzNVdUc4Yk4yWXc3ZzZCY3o3TlhueHZmTEsrWTlhVTJndUhKbGp0?=
 =?utf-8?B?MWx5Z1VHOFF3TmdLM1dmckRzYWV5eStrTG4xdlExR0Y2MEFYSytRN2hOQVlX?=
 =?utf-8?B?ME1Nb21wajdiWGc0YmZWY3pCNEZuQ01zMS9RV0V1ckIxTHFOYkJXS01KWW5Q?=
 =?utf-8?B?clBqTGRrd1F3c2kxVnQrb0srbWZDbWJPU1hRZ2JraEUxdDhsbDBoOWxPczRO?=
 =?utf-8?B?ZHRBV2F6R3RjL2MyVkJYdE9EMkQ0a2o4eW1XQVBZUXlWYkFUbldWRFYxVE5L?=
 =?utf-8?B?ZmZMS2VQK1QvMDFQaVN5dUl1UFdrYkNDbnFIUklQMHNDL3h3bU9wVnlhc0VP?=
 =?utf-8?B?YTB4NE4rMUgyU2NTUkJkRWxjYmE4U1pyUmJIbjEvM3NyZy9QNi9NWkV5d3Ev?=
 =?utf-8?B?WXVBVVpuVTFLVFNmVG5FNFQ5VkdTTWR4dmZXdlgxaHFNczdscURJcDdLNDZn?=
 =?utf-8?B?Z2F5Mm9Mc2U0UU9ZSlYyckdnQlNlTVNpbEdwMmR5Q29TVm5MdmFvRVpMalNz?=
 =?utf-8?B?VHpzcExnMTZURmcvQlhDOGZsRjJxOStDS2t4RzNrYW13RTRWaUVpVDdsc2Yr?=
 =?utf-8?B?SWsxRDYvSlRUTkdEMU45Q2ZtTlMvdERxTUZ0czUvdThIRUU0Ujk4NEdvSUJa?=
 =?utf-8?B?bVFUVi9PZ0VTUm14QXBsQ1Ftc1R0eWVDb3dzLys2Vm1CSzJuK01ZZEV2K0s2?=
 =?utf-8?B?YUdEc3JTTUtzNkFkWEZOZXpTTnpzQnpjVS92TFY4VXlGZWhUS2Y1d0F5Z0h3?=
 =?utf-8?B?UEY5VyswbDl3MEhkRGcrZ0VFb0RBSjdIbEFpTjRISEM4czdDMFVZcmZvZUZW?=
 =?utf-8?B?bGdyays5Rk40SkFoVlVDaGVNMXRRblNnd25nM25RekR5aytPb3EvcnZZS0c5?=
 =?utf-8?B?ZUZPN1RsOXMzcjZScDFmVkQ3YTRFVjdtZDJmVm92QVp2ci9wOER0eXBsY0hp?=
 =?utf-8?B?UW9YRGpYT2thN3ovRjVFZkkrNmVLUXQyeDBibUJLL0NuaDF3RFYwd3RQUmlP?=
 =?utf-8?B?VjR0WkJibU9NNTRGNDhkMFpUOTUvVVI4TVlORDBaNDhoM3hvNVFsVzY1OVN5?=
 =?utf-8?B?dXZiN3lrQjNjUjVYeFM2amZ2dm5Lc0hCbk9hejMwUzFwWnpHL3k0cU1rckVo?=
 =?utf-8?B?RVVJSVplQk9yTnhjMUhlVmVvcURYUXNPeWM1Zzh6U2VvTjdvbE9rUjgyZStP?=
 =?utf-8?B?SXV5UXhlSHRZWXdIQnNhSHNVNkJrSDZScXVGVTYxZGFTQzMzUk5tRTAyT3N2?=
 =?utf-8?B?ZTZpamlUdk14eEU4elR0N1g3SG1jeWFPYWY5ZjZDb2d4Z3lpL0Y3R2wxakJO?=
 =?utf-8?B?dE5nN2FwRmk4M2dWVDBGNVJLQ2o5RlBNbGRiUTRKOTAxelJBRSsxaklkOStV?=
 =?utf-8?Q?AlruKPn0n4aVLfMMsJ0PpgtvA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <20751411B9BD904AB408FEED07AC14B6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9991740a-d415-4be0-8d86-08db46766358
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 16:50:48.9457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVYgaMaTVuM1SNAatIyUUwWtKEGliXgu947c0AZoOxVplRQc0Zt/lvINWdpvr5hvL3eMW8VQnvpoATc8/XOvMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Limit system memory size of half of
 system memory
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

U2hvdWxkIGJlICdkcm0veGU6IExpbWl0IHRoZSBzeXN0ZW0gbWVtb3J5IHNpemUgdG8gaGFsZiBv
ZiB0aGUgc3lzdGVtIG1lbW9yeScNCg0KT24gV2VkLCAyMDIzLTA0LTI2IGF0IDA5OjQ0IC0wNzAw
LCBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIHdyb3RlOg0KPiB0dG1fZ2xvYmFsX2luaXQoKSBpbXBv
c2VzIHRoaXMgbGltaXRhdGlvbi4NCj4gDQo+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVs
ZEBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpv
c2Uuc291emFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1f
c3lzX21nci5jIHwgNSArKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90
dG1fc3lzX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV9zeXNfbWdyLmMNCj4gaW5k
ZXggNWIwNjc0YmJiOGVkMC4uM2UxZmEwYzgzMmNhYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3R0bV9zeXNfbWdyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3R0bV9zeXNfbWdyLmMNCj4gQEAgLTEwNSw3ICsxMDUsMTAgQEAgaW50IHhlX3R0bV9zeXNfbWdy
X2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAJdTY0IGd0dF9zaXplOw0KPiAgDQo+ICAJ
c2lfbWVtaW5mbygmc2kpOw0KPiAtCWd0dF9zaXplID0gKHU2NClzaS50b3RhbHJhbSAqIHNpLm1l
bV91bml0ICogMy80Ow0KPiArCWd0dF9zaXplID0gKHU2NClzaS50b3RhbHJhbSAqIHNpLm1lbV91
bml0Ow0KPiArCS8qIFRUTSBsaW1pdHMgYWxsb2NhdGlvbiBvZiBhbGwgVFRNIGRldmljZXMgYnkg
NTAlIG9mIHN5c3RlbSBtZW1vcnkgKi8NCj4gKwlndHRfc2l6ZSAvPSAyOw0KPiArDQo+ICAJbWFu
LT51c2VfdHQgPSB0cnVlOw0KPiAgCW1hbi0+ZnVuYyA9ICZ4ZV90dG1fc3lzX21ncl9mdW5jOw0K
PiAgCXR0bV9yZXNvdXJjZV9tYW5hZ2VyX2luaXQobWFuLCAmeGUtPnR0bSwgZ3R0X3NpemUgPj4g
UEFHRV9TSElGVCk7DQoNCg==
