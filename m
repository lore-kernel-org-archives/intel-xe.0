Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7D6CD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 17:46:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1DE10E0EE;
	Fri, 19 Jun 2026 17:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jbuUuPGN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A6310E0EE
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781891163; x=1813427163;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9m0LBIoq8xKdoYl/oJpi6OmgQwxKsvBl4I6UovzYUKE=;
 b=jbuUuPGNUCozsYEArA7olGB0hZTSc10LqruK1fHFiGbODkrD8Q0T/5nS
 yRkcsOq5Idh0EzVrEA16pkckmOZqGc9BdW9XUR6rD4AT5zKy+KQY2sBeB
 gg2OsI781qCjDX9iUs5/6nNbK2mHLhWxQOlFjnqen0u/D7NO1hUGZPQNd
 GOHEBNekLym3ntefIgItWWql/p0u6rU906UCmX5ULRwMuV17jwgbJsV06
 Vv91F/+OZo9xaziISAmpuiAiaLfWQGyDYZT5z+r5qqkVPFl0OF2kBTlq/
 hHNnQkyjKpLpUOuNN1Jl75TGZ/r52g4WCzjb9tvna5ZuA1Jw8ldC2LTdT w==;
X-CSE-ConnectionGUID: mYo1SGd+SQ+iFoFkfKmbXw==
X-CSE-MsgGUID: nje27WUBSfe4G783rkyTjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82744800"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="82744800"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 10:46:02 -0700
X-CSE-ConnectionGUID: jKz4TyViSjGMjfmgbWfcPg==
X-CSE-MsgGUID: YVqLQ7pWT1CqrF/rcxjw2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="253667088"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 10:46:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 10:46:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 10:46:01 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.24) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 10:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3G/TvVImgqrMHVD9PCSTnc5zCU2KL/O6dJzOAnOraYDK7U7N8gmDY0cR3ATtGJiEDnhX1QKxl6yHNl1Az5r38zBpixJRzEXA4Yhntv6XtNcYLI1AGIlDhJL97HCBPwE9cXEOHLiARbl3ObyRP8peU3B/dH0gFL9M6GoiGPJAEMZnY0WoM+lFfYLJkzd8xSX/TZlN8PHoO7ToPSIsOvJDtadCFToD9d0RiePZi2DsnOqKHv4c14TU3wAYL+e9Q/eMh589H70YMJ3wNPd9QgjUIDk1LIHhhyO/UIeAzAZXTSCO9Qdcs/Sao6tp4oq02xwmUq2NaFlctBuFy32XIgBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9m0LBIoq8xKdoYl/oJpi6OmgQwxKsvBl4I6UovzYUKE=;
 b=HMMyfooTG9+RvDAnUyUO+CEIEH929NbKhLLFvu5pbEZohaO2NBp4hbdvVJaaG1XdXFhBERDRBu3/Xc3PhFNdvdOlCs+hv62KseL5pgLiFc1eGgL/ggtnQguxB9PAZA7E3Y0M9rTCEId08FBK/A/XZUZjq2R/yoFwRmMpZ8dPQmmxUf4G3N2OyblY1S7ddcRoNt2IJJZjo2ZyFkESchJPRFwco4TOK5+6XEA7+IaGFNUHaKVohajjNAZqbNmhZ8mzzI+8lzIzu7IySbNjf5/DpAAI1Kj/fYSN/h2HRhhys4y340ISRuL2OhwOf3FSLEvniq+y9q8NM2QXG4sJXpM7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by SA0PR11MB7158.namprd11.prod.outlook.com (2603:10b6:806:24b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Fri, 19 Jun
 2026 17:45:58 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::eda2:e570:4314:8720%5]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 17:45:57 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>
Subject: RE: [PATCH 1/9] drm/xe: Add framework for info probing
Thread-Topic: [PATCH 1/9] drm/xe: Add framework for info probing
Thread-Index: AQHc+E0Zk2xvXYCJ30OdUAfc2WWfubZGNjHQ
Date: Fri, 19 Jun 2026 17:45:57 +0000
Message-ID: <IA1PR11MB62666AF35378FEB3E05FF1B7E2E22@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
 <20260609-xe-probe-info-v1-1-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-1-21e83e188e60@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|SA0PR11MB7158:EE_
x-ms-office365-filtering-correlation-id: 782696fd-df1c-4561-9117-08dece2a9e74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|38070700021|4143699003|56012099006|6133799003|22082099003|18002099003|5023799004|11063799006;
x-microsoft-antispam-message-info: HGVck13WjoknoIvonjR/Xc4LMtBjRqvVQnWEieHo0cFGyQ2ZCqmx5gaC//EliTu0qMGux63BbTcuCbzQ1qft5ovhnm+7awhf6NH3DB4Yj+XrmichVP0/d2DSIqWbMFDZOlWSq7AGFhKZNdUeo7bNVa1uVaXxKP+9CkO9XNv/tRkhLRsM4xDKw5TzR+1nw3rLtMRhJizXkzuzhTruVOyvhCUPjcYyYRipBhbh9aHgNEmaD3WLrNgjjQDTj9Q+gKZ4BNuAVFlNvdTQEk1p+7MOdmQ4pGJj8uFlZJJ8XcH6TVkzlfS4Dzeue/W+AIj2kPvKtC1RXSCH0/8nufv1AlcvxHQXagohOfC0bs/xONeUVGSc55bfv3fwNO/kYySzo58cRQ3VHLnnQXzNNM/awkDBSVnGFPHQgRVf165S/gdDHuFnXCeCSVpeWsV3X2c+E3zulT9INgtmTbou2uxqldR7Ife2jUHqsVFWHXhPveBTMb6XEOe/70wnrQg6QY2gjIQCns/GpLXsLYgsd0ig1viCdsHSXPU9UfXU+5elpRiEcZYOjCwItP8mC1XCLUhl/ydie/gPi41mnaoWP2U/upAi1jjz6YP09qh//044FbZqiim2lbINCzQ/XDocrzarC8ajwDIA3Vq9t9NWoplzxsHrZSi37HMbqOT8TglL203mjU2OF57xoRnYwpHJ/uvB6Cy6ThCU4JVTvluzYhYhKtQckcawCi14p3U4Zmgwbvpxx8M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDN1Vld5cmVOSnQ3eTJVRTNBelk3WnhmT2ZpSEpka2UzWUJydEtoSFNxd05o?=
 =?utf-8?B?QUxjcFJ3VE44cUtVNzNzRlROdFROMG1QS0l6VTJTdEV0OGVRcnU0bXltU3Ey?=
 =?utf-8?B?TERmTXdneFVhVkVkTktESmhYZEF4TjQ0Rng5NlVOb1dVR0NZYXhYSzB4QzBI?=
 =?utf-8?B?OUpqWHV6c0VldnRYYU5DRFpBN2hYQTkxc1pSSFFWZjh6RzM5Wkdwd09DbkhF?=
 =?utf-8?B?dmRtbjNYVCtTcVZXeFQvWmM3T0NYbDlNc2NQam9NRG8wWEI2eEg0c0w5ZDdw?=
 =?utf-8?B?RWg2clk3S2ZYUktXbUJnRFlTVi8zSlhzMW1jamZmZzFpSW9aV0c1c3F5MU56?=
 =?utf-8?B?NDNsWXZzZHJsakducUQ4Y2p1c0hid0ZLZHhzTXVXZDJiRjI4Z3VOSHB4bTR4?=
 =?utf-8?B?Q3Z2R1h0aDJYcC9oV2MvR3Z5SHlleUpVdHpkUWlvQTdHMHlld3Jya1dZcDlH?=
 =?utf-8?B?azU0ZTI3WC9PUDh0am9STVFzQTBWRDBNUU00VHF1akN5MW0zK05ZaHFKbFMv?=
 =?utf-8?B?N3kwQmdvclRydXNudmV5ckJtY1J6RWZ0MXdvM3JnVXQwbW8vQUNURit4dS9u?=
 =?utf-8?B?eWRJb1gxRDlsNWQ0ZUpYdEhiOW15aFkrNmVYOVNYQy9aK0JNTXdLTk5OYThI?=
 =?utf-8?B?Rmg0SEZ3VWc3UmdBU0Y1UzVCdng2L2xpZmN5cjFvQ1dhZjFvL2xaSHpaSFlx?=
 =?utf-8?B?WUFSbVdWMHl2TENRbTByakhGSjdEVFRtSkxqVXZaMHEwdWhBY3NrUTVCMURa?=
 =?utf-8?B?aHd4RDhkMlBHVGk2UFlPNGFWbDY4ZDlzNzFuS2lYa0N3R1NTazI4S3pDcms3?=
 =?utf-8?B?aHM4ZTlUVkpKQkplQTZhVVlDOXp3SFU2allxbVFOaDJNWmg0U2pBbGFNS1FI?=
 =?utf-8?B?OGNNV1BEZEFzRURacmxXSVZkNW5mVEIzZGlOcy9xd2xCYmwxSjRjaFFiK2c4?=
 =?utf-8?B?YkZQQnNTbHZhTmwxaVJrNUxFVVc3ZlNKWW94TTJuTmFORElYbmE4dHdkeVNR?=
 =?utf-8?B?amFDc2tOL1hxdnJHQVlQSitOS2VGcFpkTmFCNEJyODBuT2ZLbkhUV21oSDJV?=
 =?utf-8?B?ZVAzbkhqSnRneS9sYWlScTEyRnFwTmxQeS80RDkwb05neklQc3RKT1Z5U1FR?=
 =?utf-8?B?dlB6MGhySmo1SXRnblBFMUNiRmVkNVE0SWtsUWtEL2VmQUxLdmcxb2FhQitp?=
 =?utf-8?B?K2ZzQWg5QjdXeXJkZjhrendsQmRpMmR2Nk1sU3FlbEJxdG13VmtQNFVEUHRu?=
 =?utf-8?B?TjQwT2JwZXhpTXQrWkdHRzB2ZnBWN0RkaTFudGc4UmRPcVM3dkJKQVhHMVB0?=
 =?utf-8?B?QzJrMDNVZE5JTlBIR1FvK0YzL05PUVR5eVJTdms2aUhONkpCY2MvZmlLaGZC?=
 =?utf-8?B?TmVkemh0aEJQVE1rOHB1ZUdQdzdiSWVXZHZNTXB5MjZxajFuOHk4b2poNHR1?=
 =?utf-8?B?V1VZV01sc1paUnA3N01CSW1XMlRFaUVYMEhlM3pQODF0RXVzS0Z6d1IrSExx?=
 =?utf-8?B?L0w2SUtYNWx6QkZpNjlRSVBUYmlFdTc4c3h5MzNJT2dTK3lNakVCRktuTWM1?=
 =?utf-8?B?Y3V1bnNPVldLUmhOMzNra2FqYTBoUlpSWGliSllzNVd5a3ZuM2NvcGlidkdo?=
 =?utf-8?B?dFpMSTNIbG1PY3Vqb0hKMmM2SUw1aEx5K05UbXF1WE52Ri8vYXZNS1laSW8x?=
 =?utf-8?B?Tm9lMWxpMm5MU1BPdU1sUHpkUHdxejVyNmZVa0FsMWJrU3lQdkxWeW8rSHlm?=
 =?utf-8?B?OHBMSE5lSlM1UDNPK2cyZmR5cW9tZlNIMEpWdHBITVh2dFpCcWsvdTZaMXFG?=
 =?utf-8?B?R3VFa2tLenZDMThMTWJYdnZQWnhISXJ6Q2tHcmxvdVVXSHZhUHNwRGJOWnc1?=
 =?utf-8?B?UXlKdHNiazlwZ3FhczlEajhyU0xDb3RTZXhxN1JWU2dHTy9yOWp6VncwWTl4?=
 =?utf-8?B?YWI1SmJ4d1R0RXp4UURCOFA3Ukh0bTA2QTVxemhiUzd0RlJ4WFd6SEkzd1ds?=
 =?utf-8?B?SFlTanRtLzBOMjhvNG9aeHZ3K0h5ZzJ5NUdkbUF1NTlVU1VpQ1FlcVhPVEh3?=
 =?utf-8?B?eTZHb293czhIRk92QTBUWmJ6UVNSOC9xWlpTNEZQeThTazNEWTUvM1RPVmtQ?=
 =?utf-8?B?UWhGZy9lczN1Nlc3TnFzbGltOWJlY0dpTEgvczFIckdwdkxvVXo3bWVEYkxV?=
 =?utf-8?B?b1RHYzB3NXg4dkdXaUozMUhVcE00U3QyaklYRmJQbVpsM2p2L2xDTjNncjcx?=
 =?utf-8?B?c05Oa1FCZVlyZXpuSmg2RkxIUzYxYmdBcHNneUpyNXVpOWd4N1VBSmZSSld3?=
 =?utf-8?B?MXVsRWthOHM1MFhaa3Y0SE5kUW9YY21na2p4emdCcUlGbFRqWHpFblYvRVRQ?=
 =?utf-8?Q?+XWV1zTusc3dK/J8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kM0xCrpmQynEaPM3RJ56FGm7CYJbp8PzL4LG4b8ps2UIJZChu6qGAPqAX612lNHzdBeIB7UH5QyGqcrQWlC5M6ilTY9H+cPJAnvR/TYFj3S5jiibwQUH3t033P6JAbe2e4PZPnvTSnug/Nu9ORPHXhGmRh0TCR68fi7OFYqS+HAKee0UHODcMnZcGQut2quFJ3RlWkeWkdF1dqF1t4uvDtqNm9Xs9OUCVmhoGF1vgoFZ1Q2Emne72MozBP0Y8B2+yvQb8cOWK3GzPGgrOIrA4Ot2Cx9kcegJMSYftWhA0Gel/brbyO2HmubcglWYjKIqQFFY+sRDUILAYjyAmqykXQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782696fd-df1c-4561-9117-08dece2a9e74
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 17:45:57.5251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9DJG3h+NOQOpmZTfBInQwOUw+XwP0tYc21wPXzbpg2znQG2Yv77MXhYdp5TIaCYLNrWmUyObCOwNNLY5/JpMdupr6ehMkxlK93Cc4RpJPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7158
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgR3VzdGF2bw0K
PiBTb3VzYQ0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTAsIDIwMjYgMTo0OCBBTQ0KPiBUbzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBTb3VzYSwgR3VzdGF2byA8Z3Vz
dGF2by5zb3VzYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAxLzldIGRybS94ZTogQWRk
IGZyYW1ld29yayBmb3IgaW5mbyBwcm9iaW5nDQo+IA0KPiBGdW5jdGlvbnMgeGVfaW5mb19pbml0
X2Vhcmx5KCkgYW5kIHhlX2luZm9faW5pdCgpIGN1cnJlbnRseSBwcm9iZSBzb21lDQo+IGluZm9y
bWF0aW9uIGZyb20gdGhlIGhhcmR3YXJlIHdoaWxlIGRvaW5nIGluaXRpYWxpemF0aW9uIG9mIGlu
Zm8gZmllbGRzLiAgQmVzaWRlcw0KPiBtaXhpbmcgcmVzcG9uc2liaWxpdGllcywgYW5vdGhlciBp
c3N1ZSBmcm9tIHRoaXMgYXBwcm9hY2ggaXMgdGhhdCBrdW5pdCB0ZXN0cw0KPiBuZWVkIHRvIGlt
cGxlbWVudCBzdGF0aWMgc3R1YnMgZm9yIHRoZSBwcm9iaW5nIHBhcnQuDQo+IA0KPiBMZXQncyBw
cmVwYXJlIHRoZSBncm91bmQgdG8gZW5zdXJpbmcgdGhhdCB0aG9zZSBmdW5jdGlvbnMgc3RvcCBw
cm9iaW5nIHRoZQ0KPiBpbmZvcm1hdGlvbiBmcm9tIHRoZSBoYXJkd2FyZSBieSBjcmVhdGluZyB0
aGUgbmVjZXNzYXJ5IGZyYW1ld29yayBmb3INCj4gZXh0cmFjdGluZyB0aGUgcHJvYmluZyBiaXRz
IG91dCBvZiB0aGVtLiAgRG8gdGhhdCBieSBjcmVhdGluZyBhIG5ldyBzdHJ1Y3QgdHlwZQ0KPiBj
YWxsZWQgeGVfcHJvYmVkX2luZm8gYW5kIHRoZSBmdW5jdGlvbnMgcmVzcG9uc2libGUgZm9yIHBv
cHVsYXRpbmcgaXQuDQo+IA0KPiBJbiB1cGNvbWluZyBjaGFuZ2VzLCB3ZSB3aWxsIGdyYWR1YWxs
eSByZWZhY3RvciB0aGUgY29kZSBzbyB0aGF0IGFsbCBpbmZvDQo+IG5lZWRlZCBieSB4ZV9pbmZv
X2luaXRfZWFybHkoKSBhbmQgeGVfaW5mb19pbml0KCkgdGhhdCBpcyBwcm9iZWQgZnJvbSB0aGUN
Cj4gaGFyZHdhcmUgaXMgcGFzc2VkIHRvIHRoZW0gdmlhIHN0cnVjdCB4ZV9wcm9iZWRfaW5mby4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8gU291c2EgPGd1c3Rhdm8uc291c2FAaW50ZWwu
Y29tPg0KDQpMR1RNLA0KUmV2aWV3ZWQtYnk6IERueWFuZXNod2FyIEJoYWRhbmUgPGRueWFuZXNo
d2FyLmJoYWRhbmVAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3Rl
c3RzL3hlX3BjaS5jIHwgMTYgKysrKysrKysrKysrKy0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfcGNpLmMgICAgICAgfCA0MQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfcGNpLmMN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfcGNpLmMNCj4gaW5kZXggOTI0MGFmZjc3
OWRhLi41MWQwMzJhOWUwMWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS90ZXN0
cy94ZV9wY2kuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUvdGVzdHMveGVfcGNpLmMNCj4g
QEAgLTMzOCwxMyArMzM4LDIxIEBAIHN0YXRpYyB2b2lkIGZha2VfeGVfaW5mb19wcm9iZV90aWxl
X2NvdW50KHN0cnVjdA0KPiB4ZV9kZXZpY2UgKnhlKQ0KPiAgCS8qIE5vdGhpbmcgdG8gZG8sIGp1
c3QgdXNlIHRoZSBzdGF0aWNhbGx5IGRlZmluZWQgdmFsdWUuICovICB9DQo+IA0KPiArc3RhdGlj
IGludCBmYWtlX3Byb2JlX2luZm8oc3RydWN0IHhlX2RldmljZSAqeGUsDQo+ICsJCQkgICBzdHJ1
Y3QgeGVfcHJvYmVkX2luZm8gKnByb2JlZF9pbmZvKSB7DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+
ICsNCj4gIGludCB4ZV9wY2lfZmFrZV9kZXZpY2VfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkg
IHsNCj4gIAlzdHJ1Y3Qga3VuaXQgKnRlc3QgPSBrdW5pdF9nZXRfY3VycmVudF90ZXN0KCk7DQo+
ICAJc3RydWN0IHhlX3BjaV9mYWtlX2RhdGEgKmRhdGEgPSB0ZXN0LT5wcml2Ow0KPiArCXN0cnVj
dCB4ZV9wcm9iZWRfaW5mbyBwcm9iZWRfaW5mbyA9IHt9Ow0KPiAgCWNvbnN0IHN0cnVjdCBwY2lf
ZGV2aWNlX2lkICplbnQgPSBwY2lpZGxpc3Q7DQo+ICAJY29uc3Qgc3RydWN0IHhlX2RldmljZV9k
ZXNjICpkZXNjOw0KPiAgCWNvbnN0IHN0cnVjdCB4ZV9zdWJwbGF0Zm9ybV9kZXNjICpzdWJwbGF0
Zm9ybV9kZXNjOw0KPiArCWludCBlcnI7DQo+IA0KPiAgCWlmICghZGF0YSkgew0KPiAgCQlkZXNj
ID0gKGNvbnN0IHZvaWQgKillbnQtPmRyaXZlcl9kYXRhOyBAQCAtMzc5LDggKzM4NywxMg0KPiBA
QCBpbnQgeGVfcGNpX2Zha2VfZGV2aWNlX2luaXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAJ
a3VuaXRfYWN0aXZhdGVfc3RhdGljX3N0dWIodGVzdCwgeGVfaW5mb19wcm9iZV90aWxlX2NvdW50
LA0KPiAgCQkJCSAgIGZha2VfeGVfaW5mb19wcm9iZV90aWxlX2NvdW50KTsNCj4gDQo+IC0JeGVf
aW5mb19pbml0X2Vhcmx5KHhlLCBkZXNjLCBzdWJwbGF0Zm9ybV9kZXNjKTsNCj4gLQl4ZV9pbmZv
X2luaXQoeGUsIGRlc2MpOw0KPiArCWVyciA9IGZha2VfcHJvYmVfaW5mbyh4ZSwgJnByb2JlZF9p
bmZvKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4gZXJyOw0KPiArDQo+ICsJeGVfaW5mb19p
bml0X2Vhcmx5KHhlLCBkZXNjLCBzdWJwbGF0Zm9ybV9kZXNjLCAmcHJvYmVkX2luZm8pOw0KPiAr
CXhlX2luZm9faW5pdCh4ZSwgZGVzYywgJnByb2JlZF9pbmZvKTsNCj4gDQo+ICAJcmV0dXJuIDA7
DQo+ICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMgaW5kZXgNCj4gNzhmYzJlNGRjZmM2Li43ZjFkYTZkMjUw
MTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gQEAgLTczNywxMyArNzM3LDI3IEBAIHN0YXRp
YyB2b2lkIGluaXRfZGV2aWQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ICAJeGUtPmluZm8ucmV2
aWQgPSBwZGV2LT5yZXZpc2lvbjsNCj4gIH0NCj4gDQo+ICtzdHJ1Y3QgeGVfcHJvYmVkX2luZm8g
ew0KPiArCS8qIE5vdGhpbmcgZm9yIG5vdy4gKi8NCj4gK307DQo+ICsNCj4gKy8qDQo+ICsgKiBQ
cm9iZSBmcm9tIHRoZSBoYXJkd2FyZSB0aGUgaW5mbyByZXF1aXJlZCBieSB4ZV9pbmZvX2luaXRf
ZWFybHkoKS4NCj4gKyAqLw0KPiArc3RhdGljIGludCB4ZV9wcm9iZV9pbmZvX2Vhcmx5KHN0cnVj
dCB4ZV9kZXZpY2UgKnhlLA0KPiArCQkJICAgICAgIHN0cnVjdCB4ZV9wcm9iZWRfaW5mbyAqcHJv
YmVkX2luZm8pIHsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4gKw0KPiAgLyoNCj4gICAqIEluaXRp
YWxpemUgZGV2aWNlIGluZm8gY29udGVudCB0aGF0IG9ubHkgZGVwZW5kcyBvbiBzdGF0aWMgZHJp
dmVyX2RhdGENCj4gICAqIHBhc3NlZCB0byB0aGUgZHJpdmVyIGF0IHByb2JlIHRpbWUgZnJvbSBQ
Q0kgSUQgdGFibGUuDQo+ICAgKi8NCj4gIHN0YXRpYyBpbnQgeGVfaW5mb19pbml0X2Vhcmx5KHN0
cnVjdCB4ZV9kZXZpY2UgKnhlLA0KPiAgCQkJICAgICAgY29uc3Qgc3RydWN0IHhlX2RldmljZV9k
ZXNjICpkZXNjLA0KPiAtCQkJICAgICAgY29uc3Qgc3RydWN0IHhlX3N1YnBsYXRmb3JtX2Rlc2MN
Cj4gKnN1YnBsYXRmb3JtX2Rlc2MpDQo+ICsJCQkgICAgICBjb25zdCBzdHJ1Y3QgeGVfc3VicGxh
dGZvcm1fZGVzYw0KPiAqc3VicGxhdGZvcm1fZGVzYywNCj4gKwkJCSAgICAgIHN0cnVjdCB4ZV9w
cm9iZWRfaW5mbyAqcHJvYmVkX2luZm8pDQo+ICB7DQo+ICAJaW50IGVycjsNCj4gDQo+IEBAIC05
MTAsNiArOTI0LDE1IEBAIHN0YXRpYyBzdHJ1Y3QgeGVfZ3QgKmFsbG9jX21lZGlhX2d0KHN0cnVj
dCB4ZV90aWxlDQo+ICp0aWxlLA0KPiAgCXJldHVybiBndDsNCj4gIH0NCj4gDQo+ICsvKg0KPiAr
ICogUHJvYmUgZnJvbSB0aGUgaGFyZHdhcmUgdGhlIGluZm8gcmVxdWlyZWQgYnkgeGVfaW5mb19p
bml0KCkuDQo+ICsgKi8NCj4gK3N0YXRpYyBpbnQgeGVfcHJvYmVfaW5mbyhzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwNCj4gKwkJCSBzdHJ1Y3QgeGVfcHJvYmVkX2luZm8gKnByb2JlZF9pbmZvKSB7DQo+
ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gIC8qDQo+ICAgKiBJbml0aWFsaXplIGRldmljZSBp
bmZvIGNvbnRlbnQgdGhhdCBkb2VzIHJlcXVpcmUga25vd2xlZGdlIGFib3V0DQo+ICAgKiBncmFw
aGljcyAvIG1lZGlhIElQIHZlcnNpb24uDQo+IEBAIC05MTcsNyArOTQwLDggQEAgc3RhdGljIHN0
cnVjdCB4ZV9ndCAqYWxsb2NfbWVkaWFfZ3Qoc3RydWN0IHhlX3RpbGUgKnRpbGUsDQo+ICAgKiBw
cmVzZW50IGluIGRldmljZSBpbmZvLg0KPiAgICovDQo+ICBzdGF0aWMgaW50IHhlX2luZm9faW5p
dChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwNCj4gLQkJCWNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVz
YyAqZGVzYykNCj4gKwkJCWNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyAqZGVzYywNCj4gKwkJ
CXN0cnVjdCB4ZV9wcm9iZWRfaW5mbyAqcHJvYmVkX2luZm8pDQo+ICB7DQo+ICAJdTMyIGdyYXBo
aWNzX2dtZGlkX3JldmlkID0gMCwgbWVkaWFfZ21kaWRfcmV2aWQgPSAwOw0KPiAgCWNvbnN0IHN0
cnVjdCB4ZV9pcCAqZ3JhcGhpY3NfaXA7DQo+IEBAIC0xMDczLDYgKzEwOTcsNyBAQCBzdGF0aWMg
dm9pZCB4ZV9wY2lfcmVtb3ZlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPiAgICovDQo+ICBzdGF0
aWMgaW50IHhlX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBj
aV9kZXZpY2VfaWQgKmVudCkNCj4gew0KPiArCXN0cnVjdCB4ZV9wcm9iZWRfaW5mbyBwcm9iZWRf
aW5mbyA9IHt9Ow0KPiAgCWNvbnN0IHN0cnVjdCB4ZV9kZXZpY2VfZGVzYyAqZGVzYyA9IChjb25z
dCB2b2lkICopZW50LT5kcml2ZXJfZGF0YTsNCj4gIAljb25zdCBzdHJ1Y3QgeGVfc3VicGxhdGZv
cm1fZGVzYyAqc3VicGxhdGZvcm1fZGVzYzsNCj4gIAlzdHJ1Y3QgeGVfZGV2aWNlICp4ZTsNCj4g
QEAgLTExMTcsNyArMTE0MiwxMSBAQCBzdGF0aWMgaW50IHhlX3BjaV9wcm9iZShzdHJ1Y3QgcGNp
X2RldiAqcGRldiwNCj4gY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmVudCkNCj4gDQo+ICAJ
cGNpX3NldF9tYXN0ZXIocGRldik7DQo+IA0KPiAtCWVyciA9IHhlX2luZm9faW5pdF9lYXJseSh4
ZSwgZGVzYywgc3VicGxhdGZvcm1fZGVzYyk7DQo+ICsJZXJyID0geGVfcHJvYmVfaW5mb19lYXJs
eSh4ZSwgJnByb2JlZF9pbmZvKTsNCj4gKwlpZiAoZXJyKQ0KPiArCQlyZXR1cm4gZXJyOw0KPiAr
DQo+ICsJZXJyID0geGVfaW5mb19pbml0X2Vhcmx5KHhlLCBkZXNjLCBzdWJwbGF0Zm9ybV9kZXNj
LCAmcHJvYmVkX2luZm8pOw0KPiAgCWlmIChlcnIpDQo+ICAJCXJldHVybiBlcnI7DQo+IA0KPiBA
QCAtMTEzNiw3ICsxMTY1LDExIEBAIHN0YXRpYyBpbnQgeGVfcGNpX3Byb2JlKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LA0KPiBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPiAgCWlmIChl
cnIpDQo+ICAJCXJldHVybiBlcnI7DQo+IA0KPiAtCWVyciA9IHhlX2luZm9faW5pdCh4ZSwgZGVz
Yyk7DQo+ICsJZXJyID0geGVfcHJvYmVfaW5mbyh4ZSwgJnByb2JlZF9pbmZvKTsNCj4gKwlpZiAo
ZXJyKQ0KPiArCQlyZXR1cm4gZXJyOw0KPiArDQo+ICsJZXJyID0geGVfaW5mb19pbml0KHhlLCBk
ZXNjLCAmcHJvYmVkX2luZm8pOw0KPiAgCWlmIChlcnIpDQo+ICAJCXJldHVybiBlcnI7DQo+IA0K
PiANCj4gLS0NCj4gMi41My4wDQoNCg==
