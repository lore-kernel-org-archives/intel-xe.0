Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED81CDB474
	for <intel-xe@archiver.kernel.org>; Tue, 17 Oct 2023 11:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05E10E03E;
	Tue, 17 Oct 2023 11:38:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E896810E03E
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Oct 2023 11:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697542690; x=1729078690;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=af/3WoeuogxyMGk4dvAFRjgmitFfVPBx72TpokA9sSo=;
 b=Sy+48PPehpqjJF/rjeaDlK/lZEBXbRqPsec+c/AOY98+5C2yCVwfyPJt
 OqDFKVRvQihtfpdPv9bQ5zaHVd0kX8rlFLQ6oqOdSHKPiE6BX5K+aBLpX
 qkswPI9yW91hbe+qrYvh3XpBOakuxNFxQJJZeh0JdVIkbbbAUpRg6jUef
 p0IRygaUiT4XUM+PHeu8Eb5RefupZft1A2A6wrNXL62pywuLSz/1UvoED
 aNB7kSRXnx4t1C9OavApYCfk3lnnGNr10MQePL0PcUWmyiSmlaR7Rk6az
 Ma1CUCITVSogY2jeGzFbnTC24gYTQ6+9eQuuHZcOGmvHB1tdKolSFdAwt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7318462"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="7318462"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 04:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="732686111"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="732686111"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 04:38:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 04:38:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 04:38:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 04:38:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 04:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0xMKIRfQ7ebZlFKnK0VPP06P+Y1oZcQniIM9JCEMXXCH9+n1WAjHHySoDWrhLyOosYDtYLvjtehYofuoDa8y6q+QIJtHWwZrwFyQvTmUjX7iVqWVXhtAULfcJ9rjc1Yut0qy3rioMqBHwehPe1a2XbA1XssH3+qTMk0sDUlxz1E9trVgRgGZU/m4Y67sF3v1bDZzL/UiKfOdyUQNEk1600uinu+XNU0oxBgev5/Yc2XIAYqhypWtRWOPl9xoosLhzc7kh92uMhsTtu24hb4qUfSG9TGLyilvY448MxuPwoztKPnWfAL3m0Z6p6iK6EEEntckjlGjcmoRqKOLeVdtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af/3WoeuogxyMGk4dvAFRjgmitFfVPBx72TpokA9sSo=;
 b=jqMMwAqRl/UtBuMyK+UD8zRoGaYuGOMdDLJ++4khwy2FDnGihIwkIrW/9jvCBEaA2mVSmTSGKaA2Fu95wX65YUsJ7NhEpOEJS25gboo7xue3/zCEl+J+jrLh0vwH9XgEkXnFk9fzsITzAfyuOCxroU+2R7D3obzVy76PGtzPQr09WOTA3OxMGS+GmL2X7PF96yC9w2MdbadkWs46ppgsrzqg/QZdcrGy1Ti0bb/BZ3GCeZzJvV8b7n7XNQCIobT6aVuEgjB3zdP2Z5R65oBe8CKRIuAWq7+pEtis8yegvvkIPc0fOyIvILlNSUmHDNAQ+WrVcqSc6o4YBGCmuTM6/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 11:38:05 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 11:38:05 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH v6 1/2] drm/xe/display: Don't try to use vram if not
 available
Thread-Index: AQHaAECfvlSVLgqIQE+ZTBfUwbQturBMgVNQgAFUAwCAAAZZQA==
Date: Tue, 17 Oct 2023 11:38:04 +0000
Message-ID: <IA1PR11MB641823F87ED59A4E4D2DC04CC1D6A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231012135209.403827-2-juhapekka.heikkila@gmail.com>
 <a3b00b7b-266f-4c46-1af3-401aabce2134@gmail.com>
 <IA1PR11MB64181E4AB368B7C1B2F92C93C1D7A@IA1PR11MB6418.namprd11.prod.outlook.com>
 <0172bc2f-fab4-4141-9012-fc8c3085f38e@gmail.com>
In-Reply-To: <0172bc2f-fab4-4141-9012-fc8c3085f38e@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CY8PR11MB6818:EE_
x-ms-office365-filtering-correlation-id: d0307a6f-8899-42c9-3ad9-08dbcf0586fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VLeFp5vhzI+E8zCEThtmL9DzBoKZ2lX2LsF+0McYpYferfvn9wmNcOW0Kuc9L1pB6LJbPDDEhzQkuXlNS/nMTfoqYEgPvXJwbBYthBlJuXrgK5T1CICcXRW4BqfYp+KO9eCsVp5BGyeD9PodBG4peycKmRT00E7NZPpLW8fVxs4N/zpn4oUum/YW81hsI4JWvtUv2Wfzi6DazveJoKoE+pGbIJoOaS1rtNbgQiQb9OUrDOhVFeUjfiBlP8D5YKlKYAvcryB8RH2j9mFI7DX/6H9jxbRpnwfmpVOi8eVkstE5YbQs6cFhfeMtspz8YvosqsyAABW1ZJla4I0AutMzP3HbSpjAEOvGidGzghbhMXtEl8fBzxDDzVFpqsH2nHON+X0oRhinP40LQNRq6ubqUkEy+09G39QoHN63v6m+oPYtMT87uveVBp15Sc/KElMtNEqPllNOjZ5VI81/I3+Rgc054x5/O7SVLlQIGDjJnht7whRk3Yrcf40aKgZLlOO/cNYBjCuAvNrOBxnkUdSblcAgsS7+hin5JLOGwVyVLUYfK4X8g+5Rmg9CxfTzWanGiyXSZLUOF0gVGFEDB0FFtd/6F6L0PPUhttErc1CIZd9Xxds/eu1H8+1dX0LJMhb+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(136003)(366004)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66556008)(76116006)(66946007)(110136005)(478600001)(66476007)(66446008)(64756008)(71200400001)(7696005)(26005)(6506007)(9686003)(86362001)(38070700005)(8936002)(52536014)(8676002)(2906002)(41300700001)(122000001)(33656002)(316002)(5660300002)(83380400001)(38100700002)(82960400001)(53546011)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHh1QjlLM1daT0c0b1hGRFFhTy9zNzJaOFBvcncyTCtaQU5nRmhxeHdMTlVk?=
 =?utf-8?B?Rkg5UFIrL0FFSXpCcGRCVUtwajFWT1pFcTkwSFU1N1dEVkQvc0lPUGtpNFYz?=
 =?utf-8?B?N1lreFdFblpwZzd6ZjIra29mV0JWT1lDTWM1NDNaclBUSHh5Yk93ZGFXSjN6?=
 =?utf-8?B?Rk11NGZUcGxrUDg4MjVVQ040SStzV0FscFdnS0xQeG1UTk5uNFZMQVl6WXJs?=
 =?utf-8?B?UEpWWldySHRYYjNJYjNQd20weUcwN0w3MjQ0SWVZRDIwWWs5RDV5Y0JaS3hi?=
 =?utf-8?B?dmQ0blFlNkF0Zjk5cGJmdzErTnZsWEtJeDEzbGs3SEVFQi81NDVNWlIyVUs2?=
 =?utf-8?B?QytIVDNNdW0zczRveVZWciszcE5BTmpjVk9NVmR3aWMwWlgzTXJaa084K2Jp?=
 =?utf-8?B?bTFkNzRwNUdrdUlIR1ZQbThhSlIzMUVuUTRUK1k4NmhURWhPdjNDb0lEREdE?=
 =?utf-8?B?NmFodk55L1pFSHlIQnFnTFVjNzNQKzlqUU85NGdnSHlWcmhEWlUvNytVRHAv?=
 =?utf-8?B?VmtRMlpydWhnU2MwNVZzbkY2eVhCTTFoQ3NDVDIzRWZIY0VmTFM3V29Bd2Yr?=
 =?utf-8?B?UFlMeVcwK0FVWGpTTXM1OEhjYmFNbkdDSHgyL0I5SVFmTEp1ZVdGbER4Q3hj?=
 =?utf-8?B?RHQvUGRPZnFINytWeXQ1VUhNLzZZaXBMNzNBcmFuTVh3L3NRellkRlVHVGkv?=
 =?utf-8?B?K2pBdDIvY1M3eEhFUkg3TXE2VVpHa3RCa20xYVF0ZGV0eWlZNDAzTUFpdU9w?=
 =?utf-8?B?Z0R5UWJ1VWdUV2FxdlVaVk5qK3RKTXBmOGhtTXJPWmY4ZXdzZ0xENStqbUFp?=
 =?utf-8?B?ZUVuRWR5T0Z6aThmUkxHQVV2R25WRzRYQUw1czFNK0tzVU55bEZSS21LZFM0?=
 =?utf-8?B?STk0c0hLWE52NGh3SlBXb3hFZVk4NjJFWGhnUDhiY3RMWGxybHdmbnZoNlFG?=
 =?utf-8?B?VjRhSjYxOTZLTzJYOFdUTDJUY295bG9raTU3U2I2SUhNVWhvOE9uQU5rUmFN?=
 =?utf-8?B?UFkwbGdsbGdNRU0za3o2b05RUEVwLzBiMk0vZGYvSS80OTlKQnZ6YloxZFp6?=
 =?utf-8?B?Qk5NekIxTjNQdDFBMUcyTkVPbGRjbHFSc3RmMWFic0tFRWFQWnpnU2U4UEhM?=
 =?utf-8?B?UU9TWGtUVTR1cWVXSnRLZWpybTF2TFdzby94MnNFOGRzVis0eWJJTW5seXow?=
 =?utf-8?B?Y3lQRTZpaEJLbThZWTJQZHJCL1JCVFpOb0tBdmdEdEdIVjdkejgybGoxbVFX?=
 =?utf-8?B?bU1QK0VDeUNJQ3FtSDN4dVlCendkMml1bDdXNlNpMkpwTVlFdmh3R2h5NXZ1?=
 =?utf-8?B?Q2hhUTNDNHUxN1ZrWi9sWlBLQnhJTjNtNmVrQzZ6aUxXQWlGT3ZVMjhQVk5W?=
 =?utf-8?B?UEhpeUE1Tm50VVZyZFZCZjJMcFByTmMzd2owTzhSUmxGTjd2cHNYY0dsekYv?=
 =?utf-8?B?NE9pZE9YVTh0RlNWWkpVelhqUUltcHZtQkl4Z1BaUVUxVUpZWW56UGV1dito?=
 =?utf-8?B?Zm1mekVSaGszU0J5UnphNWhTUmZNNGRTOHBXcjYycXIxRTZYRjE2RytuamJD?=
 =?utf-8?B?ek9iRTVzWEV2TmlKZm5mc3VoL080TloxZ1pkWFkwZm00OFZVRVlMK1ZiS1VC?=
 =?utf-8?B?TzMzME15dHNoSUNFVHlWRFRYVUxYL25uRDRuT295UHFJVXpCYUV4dW9RTUtn?=
 =?utf-8?B?L0VDZlBSNzV4aW5zMUQ1NExiZlRUL1NhODZWNGlmSE1tOVAxd1hiSk1Ccm81?=
 =?utf-8?B?MExSZWVaUGVPOXNYc1I1MjRuMGFZU2hkcmw2QmVuV3h4a040cUFtbEV5aWdX?=
 =?utf-8?B?RXRka1VGODRnWVVBZDFZam1rZVFLVlFJZDZtVzFhajJyYzF2NVMrOWRVakNL?=
 =?utf-8?B?WUZJSEhBODM4MXMwSm5hTTRpK3J2VmhuQTBRSTNDR1dLWnJXQ2RWamcyUnRL?=
 =?utf-8?B?Sm9VMnhCNHVyME15eWhibG9tbTNxMW5HbUtmZDdMN3k2c1U4djFMemt2dlBP?=
 =?utf-8?B?N2cwcEQ1WkovQzhmM1N2dkRZNkY1REM5VkRnMlhFZHdsQWZGYlA2OHdOeGgw?=
 =?utf-8?B?VHlTYXRuWmkyT1c5VFZ6dkd1S0Y1SGlwY0ZLTGRZb1Q5SlAzQzVNTVBMTXNL?=
 =?utf-8?Q?CV8nEyHeYrIqS9syaFgZHFDay?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0307a6f-8899-42c9-3ad9-08dbcf0586fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 11:38:04.9575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mbhlvBPgRgUahqkddU/RBgamis/sZqhslwIPXUQfl1hMmV5rL2akCYEwiD9oVc9jburAVDLYP0eMWYby2oFJ7Ri5RJQ0Op/zTxpWEY9dJ+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6818
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v6 1/2] drm/xe/display: Don't try to use vram
 if not available
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

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj5TZW50OiBUdWVzZGF5LCBPY3RvYmVyIDE3
LCAyMDIzIDc6MTMgQU0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmoucnVobEBpbnRl
bC5jb20+OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5TdWJqZWN0OiBSZTogW1BB
VENIIHY2IDEvMl0gZHJtL3hlL2Rpc3BsYXk6IERvbid0IHRyeSB0byB1c2UgdnJhbSBpZiBub3QN
Cj5hdmFpbGFibGUNCj4NCj5PbiAxNi4xMC4yMDIzIDE4LjAzLCBSdWhsLCBNaWNoYWVsIEogd3Jv
dGU6DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBKdWhhLVBla2th
IEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPj4+IFNlbnQ6IE1vbmRh
eSwgT2N0b2JlciAxNiwgMjAyMyAxMDo1NCBBTQ0KPj4+IFRvOiBSdWhsLCBNaWNoYWVsIEogPG1p
Y2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj4+PiBTdWJqZWN0OiBGd2Q6IFtQQVRDSCB2NiAxLzJd
IGRybS94ZS9kaXNwbGF5OiBEb24ndCB0cnkgdG8gdXNlIHZyYW0gaWYgbm90DQo+Pj4gYXZhaWxh
YmxlDQo+Pj4NCj4+PiBUcnlpbmcgdG8gZ2V0IGJvIGZyb20gdnJhbSB3aGVuIHZyYW0gbm90IGF2
YWlsYWJsZSB3aWxsIGNhdXNlDQo+Pj4gV0FSTl9PTigpIGhlbmNlIGF2b2lkIHRvdWNoaW5nIHZy
YW0gaWYgbm90IGF2YWlsYWJsZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEp1aGEtUGVra2Eg
SGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+Pj4gLS0tDQo+Pj4gICBk
cml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYyB8IDExICsrKysrKy0tLS0tDQo+
Pj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4+
DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5j
DQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPj4+IGluZGV4
IDJjMzZlNTAzMjQzMy4uODljZjY1YzU4MTkxIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS9kaXNwbGF5L3hlX2ZiX3Bpbi5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L2Rpc3BsYXkveGVfZmJfcGluLmMNCj4+PiBAQCAtNjIsMTEgKzYyLDEyIEBAIHN0YXRpYyBpbnQg
X194ZV9waW5fZmJfdm1hX2RwdChzdHJ1Y3QNCj4+PiBpbnRlbF9mcmFtZWJ1ZmZlciAqZmIsDQo+
Pj4gICAJCWRwdF9zaXplID0gQUxJR04oaW50ZWxfcm90YXRpb25faW5mb19zaXplKCZ2aWV3LT5y
b3RhdGVkKSAqIDgsDQo+Pj4gICAJCQkJIFhFX1BBR0VfU0laRSk7DQo+Pj4gICAtCWRwdCA9IHhl
X2JvX2NyZWF0ZV9waW5fbWFwKHhlLCB0aWxlMCwgTlVMTCwgZHB0X3NpemUsDQo+Pj4gLQkJCQkg
IHR0bV9ib190eXBlX2tlcm5lbCwNCj4+PiAtCQkJCSAgWEVfQk9fQ1JFQVRFX1ZSQU0wX0JJVCB8
DQo+Pj4gLQkJCQkgIFhFX0JPX0NSRUFURV9HR1RUX0JJVCk7DQo+Pj4gLQlpZiAoSVNfRVJSKGRw
dCkpDQo+Pj4gKwlpZiAoSVNfREdGWCh4ZSkpDQo+Pj4gKwkJZHB0ID0geGVfYm9fY3JlYXRlX3Bp
bl9tYXAoeGUsIHRpbGUwLCBOVUxMLCBkcHRfc2l6ZSwNCj4+PiArCQkJCQkgICB0dG1fYm9fdHlw
ZV9rZXJuZWwsDQo+Pj4gKwkJCQkJICAgWEVfQk9fQ1JFQVRFX1ZSQU0wX0JJVCB8DQo+Pj4gKwkJ
CQkJICAgWEVfQk9fQ1JFQVRFX0dHVFRfQklUKTsNCj4+PiArCWVsc2UNCj4+PiAgIAkJZHB0ID0g
eGVfYm9fY3JlYXRlX3Bpbl9tYXAoeGUsIHRpbGUwLCBOVUxMLCBkcHRfc2l6ZSwNCj4+PiAgIAkJ
CQkJICAgdHRtX2JvX3R5cGVfa2VybmVsLA0KPj4+ICAgCQkJCQkgICBYRV9CT19DUkVBVEVfU1RP
TEVOX0JJVCB8DQo+Pg0KPj4gSGkgSnVoYSwNCj4+DQo+PiBZb3UgaGF2ZSBjaGFuZ2VkIHRoaXMg
Y29kZSBmcm9tOg0KPj4NCj4+ICJCZXN0IGVmZm9ydCBhbGxvY2F0aW9uIiAodHJ5IHZyYW0sIGFu
ZCB0aGVuIGZhbGxiYWNrIHRvIHN0b2xlbiksIHRvICJEaXNjcmV0ZQ0KPmdldHMgdnJhbSwgIWRp
c2NyZXRlIGdldHMNCj4+IHN0b2xlbiIuDQo+DQo+SGkgTWljaGFlbCwNCj4NCj50aGlzIGlzIGNv
cnJlY3QuIHZyYW0gaXMgZm9yIGRpc2NyZXRlIGFuZCBzdG9sZW4gaXMgZm91bmQgb24gaW50ZWdy
YXRlZC4NCj5FYXJsaWVyIHBhdHRlcm4gd2FzIGNvcGllZCBmcm9tIGk5MTUgd2F5IG9mIHNldHRp
bmcgdXAgZGlzcGxheSBwYWdlDQo+dGFibGUgYnV0IGl0IGhhZCB0byBiZSBjaGFuZ2VkIGJlY2F1
c2UgYXNraW5nIGZvciB2cmFtIG9uIFhlIHdoaWxlIG9uDQo+ZGlzY3JldGUgd2lsbCBjYXVzZSBX
QVJOX09OKCkgaGVuY2UgZXhhY3Qgc2FtZSBwYXR0ZXJuIGZyb20gaTkxNQ0KPmNvdWxkbid0IGJl
IHVzZWQuDQoNCk9rLCB0aGF0IG1ha2VzIHNlbnNlLiAgSWYgdGhlcmUgaXMgc3RpbGwgdGltZSwg
SSB3b3VsZCBzdWdnZXN0IHVwZGF0aW5nIHRoZSBjb21taXQNCm1lc3NhZ2UgdG8gc2F5IHNvbWV0
aGluZyBsaWtlOg0KDQotLQ0KRGlzY3JldGUgc2hvdWxkIHVzIHZyYW0gb25seS4gIEN1cnJlbnQg
YWxsb2NhdGlvbiBhbGxvd3MgYSBmYWxsYmFjay4NClVwZGF0ZSBkaXNwbGF5IGFsbG9jYXRpb24g
dG8gcmVxdWlyZSB2cmFtIGZvciBkaXNjcmV0ZS4NCi0tDQoNCk9yIHNvbWV0aGluZyBsaWtlIHRo
YXQgc28gdGhlIGNvbW1pdCBtZXNzYWdlIHRlbGxzIHVzIHdoeSB0aGUgY2hhbmdlIGlzIGhhcHBl
bmluZy4NCg0KVGhhbmtzLA0KDQpNDQoNCj4vSnVoYS1QZWtrYQ0KPg0KPj4NCj4+IElmIHRoaXMg
aXMgY29ycmVjdDoNCj4+DQo+PiBSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVs
LmoucnVobEBpbnRlbC5jb20+DQo+Pg0KPj4gSXMgdGhpcyBuZXcgc2VtYXRpYyB0aGUgImNvcnJl
Y3QiIGFsbG9jYXRpb24gbWV0aG9kPw0KPj4NCj4+IFRoYW5rcywNCj4+DQo+PiBNaWtlDQo+Pg0K
Pj4NCj4+PiAtLQ0KPj4+IDIuMjUuMQ0KPj4NCg0K
