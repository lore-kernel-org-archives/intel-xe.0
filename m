Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0009C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 17:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4700810E002;
	Tue, 25 Jun 2024 17:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMx7BGKP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1893F10E002
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 17:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337094; x=1750873094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dgbD2j6aiMo2f8uxvM4+diXqcF6NPRJBzjtIvj4JvUE=;
 b=jMx7BGKP8i22e/qpTb2sslOOYoj8rO6GpoM9NhyB4G/+BRXxJ17dhbaD
 QdFhmAuc5EjQmveEb9sZ9T9HbW4iD5PPuo7WVhaF1EqW8ZxWVjg8LE6sQ
 PYESDTfySljaHgo632DdqirMsLLUskhjeIM8b567dxz9mlASfxUUI71qL
 u38R20HeGBGA1AsBAEKKmOxppSdA/7hA3hb4biphpcY8poTxmWk82aFwD
 duMVaFLnyC5321J9AQJgx2YK9Zn39knUtrkZ4hHTv2Sh7q9fElSVv0qYZ
 a4EcnWYj/3aAn25cwcc8AoUKhXNUG0ZcpAW//tZ3Nd00fw1gOWnP8e0pA Q==;
X-CSE-ConnectionGUID: OO/q8Y+4SOmS3Esh2nArPg==
X-CSE-MsgGUID: pl7iq9SUROa0wscLiKrAHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16199419"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16199419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:38:13 -0700
X-CSE-ConnectionGUID: WW6lNZA8RWmrb4LArZ0uYQ==
X-CSE-MsgGUID: GpWVqII8T7WqmlUdXktALg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="48170282"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 10:38:13 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 10:38:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 10:38:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 10:38:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoGL6/W+aJcv+HoY3kuVgTacEx4FwezMOBZBt63O5LzuFw3hqhTsslbOOznniG2M3owFd29HxrTFpNQg6gGO7VtcXOpYWFGVk8fVM5Vs6onWxnFRoudyHev/6lJ9ncix5UO/uIVqeUkFSNurY9xpcuAOltWI0zrdBklGwobYKoIGr7ttwzEXGqYkoDXBiJF3eM3SnzLoC0048gk0n0SF+0j6JHWthdZrIc+Hk/9mpINYCwrQYbT9mTwbyj3Zs4HN70GNcs5GSk8t8FAXsO+Hz+3tsaykybWZVV9udAqREKX2lDSVCQ92QHS/2khmOtH6EU+w2GR923hcxM1sHQhkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgbD2j6aiMo2f8uxvM4+diXqcF6NPRJBzjtIvj4JvUE=;
 b=HWPij7DemQkYLAlwISQjK/B8si/MDxo+sR/kLL0MnMr9DwsfSA86GOK9zo1SBdAXyLLv5DJ5dZLq+ob15uqpVDCGMipBprkdcicgnsC9f8ZwjdwMLXOPrubpcx15dQYj2fBYhVtI5TVNo+zg+YJr5tSZCli1JH5esTzABwrDFt2chyBZxlkL4KgVynqP06HZy/zbTal2jbGU+V29NfFVFmpZLdgYW7w5usrLpPmtRiiQz+Oa/qpnnZdxKzu2PEJt9kYz/oZnAceCQyn9IXSu7VLN1E1cLCbiGWe9KcKRsPeuCWYEoqKD9rPt9pKGqJu3YTLgLAgFJYlzH61YQDVvVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Tue, 25 Jun 2024 17:38:09 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 17:38:09 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Welty, 
 Brian" <brian.welty@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Topic: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
Thread-Index: AQHau3V1h9PTcFzSSEOyoig8QlMBu7HBlVUAgBdAoIA=
Date: Tue, 25 Jun 2024 17:38:09 +0000
Message-ID: <d8b47c4c3d11b9492b05a43b5b1d51f144b29a62.camel@intel.com>
References: <20240610203300.182615-1-stuart.summers@intel.com>
 <20240610203300.182615-2-stuart.summers@intel.com>
 <Zmd/EtqiksBLq6Cz@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zmd/EtqiksBLq6Cz@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB5043:EE_
x-ms-office365-filtering-correlation-id: 9aa09455-ebd6-4deb-e3eb-08dc953d944d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230038|1800799022|366014|376012|38070700016;
x-microsoft-antispam-message-info: =?utf-8?B?dXhPZDVNMDFMTlkxRDQ1UlVpTSsvZXh3OFRqTlZrZ0UyeEt3QjFndGtWWEM1?=
 =?utf-8?B?RUpJZFcxVk5nMThxVzBoZmNIUVdBVDRkRzFuaS9pSkZFWEsxRGtIMlBxNk8r?=
 =?utf-8?B?WWdFdStoNHE0dzhHbkZudlZSbGZHUXBzVlFRbXBsR2lFUHpmYXVqdmVIQXFu?=
 =?utf-8?B?b0lJaS93eFJaQkNsOWVQVlJRKzhjMy9YWHF6M2pTY0U4czY4RjhqOVJwbGJY?=
 =?utf-8?B?TUNzeGh2MC9MWjNDcWRLd20rVnhHcEZVWEZmdWNYU2dXRXhydFdDd2pVRGM3?=
 =?utf-8?B?TElDUWFCTVRqdXRFZWpPK2JhcHhJV3NtWkxOQUN5UGYrbHozY3RyMG5BeERp?=
 =?utf-8?B?QUdHc1doWnJOS1kvOWhINlJGNEdVWjdHSTEvbTZtYXUrQ0xQZkNtVUxWZm90?=
 =?utf-8?B?TnZ1UmwvR2tPK21NNjgxWjhQZmdJSEdDU0dSdTV5RnZMaXZ2UHlrc1RSaExU?=
 =?utf-8?B?ajlmUDM0M2c4U3R0YVV0T0QrOWZyc2dSeHB5Vit3RVhVVHJma2hFWUNSNFBO?=
 =?utf-8?B?UkFVVm9jK1JHRXZqYzZvMGNYbWZjMzFXWGNCVFN0OXpIeHl5TFl5QUtMQ0dQ?=
 =?utf-8?B?aUN6MmxjQUtzaWNzcXlwd1JKYktFbVlIbzJvT2Z0M3NHTFZ4Q1JQNXVCTDNE?=
 =?utf-8?B?a09rcHlGZGh1bU9Jb0Vla1NyK0NTL3dUdmJhZXRDeFlaUHZtQWdzMXkvOTB5?=
 =?utf-8?B?SWVpTkg1T3pMdzBRbVAyZFZaM0cwVjBjditKMVpOYXAvWmZjamNYWVRjV2k4?=
 =?utf-8?B?elhSSTRYVTVXUy9xcUhnaWpUd0VrRHVXZTd3Z0pkeWF6dWIvYmlSN09LMU5M?=
 =?utf-8?B?LzBveFhpZnpEekxCcGk2VWp3a1B6M1VURzRjY1k0aDdtcit5R2xXVVJYVzNG?=
 =?utf-8?B?dGVPb1hBTTZ5SndpV0ZHRjkxMTNiQWgvbExXQkN4cVM0REc4T2hLNW1BVjdm?=
 =?utf-8?B?cjJ2TlZkVG13allRV1VKeTNxbzNOaS9YRGVQMjNWRFllWU5EVFQyMzB0Zlli?=
 =?utf-8?B?UmovbDdSN0hjUVlLRFlGNkRENmpjWWt4azZ6cnBLdnBqb2tXUVl1NmNLaitM?=
 =?utf-8?B?czVVc1F3Mm40N3g3dEJ4RUZVMmhBaWp0VDFiTjMzTVVWNFR1VGExR296WGsx?=
 =?utf-8?B?NzVpOTNwYjNQeURqYkZ0SitWVC9FbS9EUVlraHNISXVyT0J4WGpjRXVPMjc0?=
 =?utf-8?B?V0hnTnEyUWcyanhQenZQOGhsZXBiQ2hac0loYU1XeUxrUVB5b2tmRyt1WnRO?=
 =?utf-8?B?SmVlWlZYQjYvNXJPQ3JsVHV3MnpwUW9tME0rQ3Rza1ZZUG1Gb01ZeGlham1W?=
 =?utf-8?B?YVdGUmRFS2tPYllzZ1cyZzJnOGVoRXhhMlduNThvRU9lSjhoZWdzTzc4QktE?=
 =?utf-8?B?dlVaYkFGZExtYkxFTzhGNmEvRHNaTDBZSEsrVUY1d0NvajcxcVF2a2tGTjVZ?=
 =?utf-8?B?d24xbVVMRjViWThJdXFvblVSWlJrZ1k5TCtTZTFraHlScTFseTMxNlM2cU44?=
 =?utf-8?B?cHdtSjhhcExxMzdIcnRudjJyVFhCQ0ZNL2ZVL2tmRHlzRExZNmNQV1JsV3hs?=
 =?utf-8?B?NmVOVWVKcUlqU0RPMDI5YkF5NStYWDkxOXJKK3N6ekNnS3BPdlJUdGlmQXI3?=
 =?utf-8?B?dlo1THFub2FUbzEwaWU4eUNNN1FWTGJYdkJYVmh0amI5a0VScTluSXZHcWMw?=
 =?utf-8?B?elRadE5YSEZONEwwdk9rTkpCZW9lZnE0T3h3RlcxUTJqQTl6UEtWY3pFdDFq?=
 =?utf-8?B?dGY2TWc2NlNQbS9Bb096Zm44TkVOYWxNV1htbjF5RDZxVTRhYXYvOWZoSzlR?=
 =?utf-8?Q?jarxAr17OOyer/yaRc4t5u8HYoVyH8cXIhyS0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012)(38070700016); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ekpQMjBGNi91RytxRDR6VkFPUTBCMHJYRUVnWmpRek0vQzFBVDhaTGhBYzJU?=
 =?utf-8?B?cmNOeFk3M3ZySlAvY3h3RmU5bVZMQk95ejJ1NG9nZmtZTG1FVTYzZ2dic0Nx?=
 =?utf-8?B?R1Z5QzZqOEtGWXlGVGdtaXBKRXlzQU15MTN6N2cyaEJITTZ3R3c0cW5NdEsz?=
 =?utf-8?B?VFlTTlhpOWpFbnllLzdSdGFXcjBQd1U5L2EwanVwa2E5K2ZBdHh6YjdXOGJJ?=
 =?utf-8?B?R0RBWDlXRjMydlVMMkR5S1JqaFVzdVhRVDcwMlF1dmFudis4SUxCeEJhZDBJ?=
 =?utf-8?B?N1Fad2RyakNCbTRNcTBXNzNFdUw5U3dtNDQ4M3NtOTF5N1FQWjFZMGp2R0pI?=
 =?utf-8?B?WVd4bWE3WXdMa1M2L2V1S1IzV1J4am1zS3hNdWVMTHB6dzE5M3ZBblRsV2I0?=
 =?utf-8?B?SGxvelozTjBRZyszM1NJZWppeitIcEZWdllOd2pjOEFmUGtzRVE2M3A1b2Ix?=
 =?utf-8?B?ZXc3a0lBYmttb09GZHBFSldDRjBQaWgzZktoaFhtUlFXNGFTUWNmMU9PYlVm?=
 =?utf-8?B?WGhqTExXMHd6ZDZ0dFBZWVorQTJ4c3BHZUZjVWx0TlVqMk5rQmRBY05zenFQ?=
 =?utf-8?B?WkdySUhWbEgyb1RaUDFmOHhvUEpSaEdoeHNGUUZ0Y1cwZDU2cDlrTmlQb1h0?=
 =?utf-8?B?SmdIb1JpMmlqMTZxR3hMdmFxTnA1Q1d4WjBzWU9ESzQvNDByd3pLOXh3Wmcw?=
 =?utf-8?B?L29nT0xwbW1FbkVITzlEeUVtYkdWcjRQalREWHJGemlkUzN4TWNGWGtNR0Er?=
 =?utf-8?B?SjZHNXNGay9zUWlvSWVoZTB5OVA5OG9UYTJuaEtVS3lnR1F1K2svcHBaNTc1?=
 =?utf-8?B?RTkxMXdoT2pqa1ZUbkk5RGJvVGV4Z3gzWjhLZjNRL2tlSmNncnJEdVF1Vmdy?=
 =?utf-8?B?cXdVNVFPTm5NVGdlU0ZXL0swMDlQZVh6SC9xVFNpLzRtWGsySnBzbnhibndN?=
 =?utf-8?B?ZjFFajZHY3FleTl4WlYxbDdUSnBiRU81YW5XZ1lCT3ludXJnd0VWb1pPc1d3?=
 =?utf-8?B?dU5VMjB6UWUvdzE2dUVKQ2l0dHFweVdqaUpvSnEyYVlnbXF4c3lleFJBWUl4?=
 =?utf-8?B?YkpHUCtFc2pJOFF5cXhsQU0rZWhHVTVIT0hiOTYxcGpOUFcxQ2VLMmovN0kz?=
 =?utf-8?B?RVVjL1RrbUVRTjRSeEw4RnVZTW1CU1FoVVU1YlQrWWhpTUpZY0JKMjBEVE1H?=
 =?utf-8?B?S2NLSGxaamR2amxFeEh2RE1xRjhlQ0IwaG1rUnh6MHlhK3VMNVY3Z3BOa1My?=
 =?utf-8?B?bXE3SDkvbGpBeWdUcXNOb2hZMUdUSkdZSDkvWWluamVQelB2K2dWRkRITTlU?=
 =?utf-8?B?STlZandyd3dsMTZhSlpCQXZkNk5BclVxamozWmpQU1VRN0Jua2NqY3o2RmRY?=
 =?utf-8?B?ek9KTUkwQmozcEFpdkhVQTdlenhQK1Q3NmMrb0hsR1FmS1Nzc3p0aUFER29n?=
 =?utf-8?B?RUJ2b0N1MkNhcE5zdkwzc0VTTWRoNHlhbEN4ZXEySjRyb1NMelNRbU5aZ3JN?=
 =?utf-8?B?M1I3YWlzM0NrMEdqV3U3OCtJNEZNYzhjczJJalZ5bzNUOW1LeGMxR05vdGJL?=
 =?utf-8?B?ZmRVNEpZYU00NG1HeTQ1bENSTnl3QlVnNVNHQTlyVFdTcG10RExtRnBZREh2?=
 =?utf-8?B?Q2l4RVJKNlpiTzYwbmdIY25MY1FZR3pXakc0ZzlmYVBjYXNZRUY1c1RORyts?=
 =?utf-8?B?VUZKc1paa1NIOVVOYkFQWlpNa210a0dhbHVOMkN2MzdUQ0p0QktEVzhobGNn?=
 =?utf-8?B?WWV2VHFoQjZxZHY0V1BidUJYSy9qVkc5S08vcE94ZEhJZW4vdjVRWlpTZHdP?=
 =?utf-8?B?NHJIYnZabjJoc3l1OWhrNTcyUHppamE0TXc5UWVGQitBdkpwbW82NUswd1l4?=
 =?utf-8?B?VjZ0TVVIWGovUWhNRlNqY1hqZzh2d2ZVR1RvTjFaQ1owcHBqMlJkZU5jczlB?=
 =?utf-8?B?bXphbXJOUWNKL0REbzZTQVlMaXJQSkxuKzJjWHBmTG12WE5YQ3VOdUpJbVk1?=
 =?utf-8?B?aTB1SkxOcm10YmdyZVFSMzlpeG93anc1aitHaTgvcEthN2xvck9JQTVSSDVw?=
 =?utf-8?B?NGhtTFY2Y2lXUThzczNFSHZISWJKNk1FMTUyYWdZSngvWmI0ejVGeUJBYTlS?=
 =?utf-8?B?QWd3Z0lac05OcEFRYXZHRDhrWUtCcytVU21Ed1NWNUFlMmFjTzVUSUxTUEZp?=
 =?utf-8?B?WGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B57FE300889124C96EA110BDFD2E11A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa09455-ebd6-4deb-e3eb-08dc953d944d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 17:38:09.2919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Ipg61irU53DrrrhI5zZL9A+TVodYf+zIcQUEOAz1x5mtXBAYgsn/hKbu9pNjMd6LQbgvBOnyGz5dRDx3kbSJMxQ7vStJpWT+z81iRQzo6E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
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

T24gTW9uLCAyMDI0LTA2LTEwIGF0IDIyOjMyICswMDAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIE1vbiwgSnVuIDEwLCAyMDI0IGF0IDA4OjMzOjAwUE0gKzAwMDAsIFN0dWFydCBTdW1tZXJz
IHdyb3RlOgo+ID4gQ3VycmVudGx5IHRoZSBwYWdlIGZhdWx0IHF1ZXVlIHNpemUgaXMgaGFyZCBj
b2RlZC4gSG93ZXZlcgo+ID4gdGhlIGhhcmR3YXJlIHN1cHBvcnRzIGZhdWx0aW5nIGZvciBlYWNo
IEVVIGFuZCBlYWNoIENTLgo+ID4gRm9yIHNvbWUgYXBwbGljYXRpb25zIHJ1bm5pbmcgb24gaGFy
ZHdhcmUgd2l0aCBhIGxhcmdlCj4gPiBudW1iZXIgb2YgRVVzIGFuZCBDU3MsIHRoaXMgY2FuIHJl
c3VsdCBpbiBhbiBvdmVyZmxvdyBvZgo+ID4gdGhlIHBhZ2UgZmF1bHQgcXVldWUuCj4gPiAKPiA+
IEFkZCBhIHNtYWxsIGNhbGN1bGF0aW9uIHRvIGRldGVybWluZSB0aGUgcGFnZSBmYXVsdCBxdWV1
ZQo+ID4gc2l6ZSBiYXNlZCBvbiB0aGUgbnVtYmVyIG9mIEVVcyBhbmQgQ1NzIGluIHRoZSBwbGF0
Zm9ybSBhcwo+ID4gZGV0bWluZWQgYnkgZnVzZXMuCj4gPiAKPiAKPiBUaGlzIG1hdGggd2lsbCBh
bHNvIGJlIG5lZWRlZCB3aGVuIGRldGVybWluaW5nIHRoZSBHMkggcXVldWUgc2l6ZSBhcwo+IHBh
Z2UgZmF1bHRzIGdldCBzdW5rIHRvIHRoYXQgcXVldWUgZmlyc3QgYmVmb3JlIGJlaW5nIGNvcGll
ZCB0byB0aGlzCj4gc2Vjb25kYXJ5IHF1ZXVlLiAKCk9rIGxldCBtZSBsb29rLi4KCj4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPgo+
ID4gLS0tCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYyB8IDQ5ICsr
KysrKysrKysrKysrKysrKysrKy0tLQo+ID4gLS0tLQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3RfdHlwZXMuaMKgwqDCoMKgIHzCoCA0ICstLQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDM5
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3BhZ2VmYXVsdC5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF9wYWdlZmF1bHQuYwo+ID4gaW5kZXggMzg1OGM4ZTBiNzA3Li41NTY1NzMyZTc5ZTkg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfcGFnZWZhdWx0LmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9wYWdlZmF1bHQuYwo+ID4gQEAgLTI4Nyw3
ICsyODcsNyBAQCBzdGF0aWMgYm9vbCBnZXRfcGFnZWZhdWx0KHN0cnVjdCBwZl9xdWV1ZQo+ID4g
KnBmX3F1ZXVlLCBzdHJ1Y3QgcGFnZWZhdWx0ICpwZikKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFBGRF9WSVJUVUFMX0FERFJfTE9fU0hJRlQ7Cj4g
PiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+dGFpbCA9
IChwZl9xdWV1ZS0+dGFpbCArIFBGX01TR19MRU5fRFcpICUKPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgUEZfUVVFVUVfTlVNX0RXOwo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+cGZfcXVl
dWVfbnVtX2R3Owo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB0cnVl
Owo+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgwqDCoMKgwqDCoMKgwqBzcGluX3VubG9ja19p
cnEoJnBmX3F1ZXVlLT5sb2NrKTsKPiA+IEBAIC0yOTksNyArMjk5LDggQEAgc3RhdGljIGJvb2wg
cGZfcXVldWVfZnVsbChzdHJ1Y3QgcGZfcXVldWUKPiA+ICpwZl9xdWV1ZSkKPiA+IMKgewo+ID4g
wqDCoMKgwqDCoMKgwqDCoGxvY2tkZXBfYXNzZXJ0X2hlbGQoJnBmX3F1ZXVlLT5sb2NrKTsKPiA+
IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gQ0lSQ19TUEFDRShwZl9xdWV1ZS0+aGVhZCwg
cGZfcXVldWUtPnRhaWwsCj4gPiBQRl9RVUVVRV9OVU1fRFcpIDw9Cj4gPiArwqDCoMKgwqDCoMKg
wqByZXR1cm4gQ0lSQ19TUEFDRShwZl9xdWV1ZS0+aGVhZCwgcGZfcXVldWUtPnRhaWwsCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBmX3F1ZXVl
LT5wZl9xdWV1ZV9udW1fZHcpIDw9Cj4gCj4gSSBkb24ndCB0aGluayB0aGUgPD0gUEZfTVNHX0xF
Tl9EVyBpcyBuZWVkZWQuCgpJIHRob3VnaHQgdGhlIGlkZWEgaGVyZSB3YXMgdG8gbWFrZSBzdXJl
IHRoZSBtYXggc3BhY2Ugd2UgbWlnaHQKcG9zc2libHkgbmVlZCAoUEZfTVNHX0xFTl9EVykgaXMg
YXZhaWxhYmxlIGluIHRoZSByZXN0IG9mIHRoZSBxdWV1ZQooQ0lSQ19TUEFDRS4uLikuIElzbid0
IHRoaXMgZXhhY3RseSB3aGF0IHdlIHdhbnQgdG8gY2hlY2s/Cgo+IAo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBQRl9NU0dfTEVOX0RXOwo+ID4gwqB9Cj4gPiDCoAo+ID4gQEAg
LTMxMiwxMSArMzEzLDYgQEAgaW50IHhlX2d1Y19wYWdlZmF1bHRfaGFuZGxlcihzdHJ1Y3QgeGVf
Z3VjCj4gPiAqZ3VjLCB1MzIgKm1zZywgdTMyIGxlbikKPiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIg
YXNpZDsKPiA+IMKgwqDCoMKgwqDCoMKgwqBib29sIGZ1bGw7Cj4gPiDCoAo+ID4gLcKgwqDCoMKg
wqDCoMKgLyoKPiA+IC3CoMKgwqDCoMKgwqDCoCAqIFRoZSBiZWxvdyBsb2dpYyBkb2Vzbid0IHdv
cmsgdW5sZXNzIFBGX1FVRVVFX05VTV9EVyAlCj4gPiBQRl9NU0dfTEVOX0RXID09IDAKPiA+IC3C
oMKgwqDCoMKgwqDCoCAqLwo+ID4gLcKgwqDCoMKgwqDCoMKgQlVJTERfQlVHX09OKFBGX1FVRVVF
X05VTV9EVyAlIFBGX01TR19MRU5fRFcpOwo+ID4gLQo+IAo+IFNvIGhlcmUgSSdkIGFkZDoKPiB4
ZV9ndF9hc3NlcnQoZ3QsICEocGZfcXVldWUtPnBmX3F1ZXVlX251bV9kdyAlUEZfUVVFVUVfTlVN
X0RXKTsKCk1ha2VzIHNlbnNlLgoKPiAKPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAodW5saWtlbHko
bGVuICE9IFBGX01TR19MRU5fRFcpKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gLUVQUk9UTzsKPiA+IMKgCj4gPiBAQCAtMzI3LDcgKzMyMyw4IEBAIGludCB4ZV9n
dWNfcGFnZWZhdWx0X2hhbmRsZXIoc3RydWN0IHhlX2d1Ywo+ID4gKmd1YywgdTMyICptc2csIHUz
MiBsZW4pCj4gPiDCoMKgwqDCoMKgwqDCoMKgZnVsbCA9IHBmX3F1ZXVlX2Z1bGwocGZfcXVldWUp
Owo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICghZnVsbCkgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBtZW1jcHkocGZfcXVldWUtPmRhdGEgKyBwZl9xdWV1ZS0+aGVhZCwgbXNn
LCBsZW4gKgo+ID4gc2l6ZW9mKHUzMikpOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHBmX3F1ZXVlLT5oZWFkID0gKHBmX3F1ZXVlLT5oZWFkICsgbGVuKSAlCj4gPiBQRl9RVUVV
RV9OVU1fRFc7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPmhl
YWQgPSAocGZfcXVldWUtPmhlYWQgKyBsZW4pICUKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGZfcXVldWUtPnBmX3F1ZXVlX251bV9kdzsKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcXVldWVfd29yayhndC0+dXNtLnBmX3dxLCAm
cGZfcXVldWUtPndvcmtlcik7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZHJtX3dhcm4oJnhlLT5kcm0sICJQRiBRdWV1ZSBm
dWxsLCBzaG91bGRuJ3QgYmUKPiA+IHBvc3NpYmxlIik7Cj4gPiBAQCAtMzgyLDE4ICszNzksNDIg
QEAgc3RhdGljIHZvaWQgcGZfcXVldWVfd29ya19mdW5jKHN0cnVjdAo+ID4gd29ya19zdHJ1Y3Qg
KncpCj4gPiDCoAo+ID4gwqBzdGF0aWMgdm9pZCBhY2NfcXVldWVfd29ya19mdW5jKHN0cnVjdCB3
b3JrX3N0cnVjdCAqdyk7Cj4gPiDCoAo+ID4gK3N0YXRpYyBpbnQgeGVfYWxsb2NfcGZfcXVldWUo
c3RydWN0IHhlX2d0ICpndCwgc3RydWN0IHBmX3F1ZXVlCj4gPiAqcGZfcXVldWUpCj4gPiArewo+
ID4gK8KgwqDCoMKgwqDCoMKgeGVfZHNzX21hc2tfdCBhbGxfZHNzOwo+ID4gK8KgwqDCoMKgwqDC
oMKgaW50IG51bV9kc3MsIG51bV9ldXM7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBiaXRtYXBf
b3IoYWxsX2RzcywgZ3QtPmZ1c2VfdG9wby5nX2Rzc19tYXNrLCBndC0KPiA+ID5mdXNlX3RvcG8u
Y19kc3NfbWFzaywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRV9NQVhf
RFNTX0ZVU0VfQklUUyk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBudW1fZHNzID0gYml0bWFw
X3dlaWdodChhbGxfZHNzLCBYRV9NQVhfRFNTX0ZVU0VfQklUUyk7Cj4gPiArwqDCoMKgwqDCoMKg
wqBudW1fZXVzID0gYml0bWFwX3dlaWdodChndC0+ZnVzZV90b3BvLmV1X21hc2tfcGVyX2RzcywK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoFhFX01BWF9FVV9GVVNFX0JJVFMpICogbnVtX2RzczsKPiA+ICsKPiA+ICvCoMKg
wqDCoMKgwqDCoC8qIHVzZXIgY2FuIGlzc3VlIHNlcGFyYXRlIHBhZ2UgZmF1bHRzIHBlciBFVSBh
bmQgcGVyIENTICovCj4gPiArwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+cGZfcXVldWVfbnVtX2R3
ID0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBBTElHTihudW1fZXVzICsgWEVf
TlVNX0hXX0VOR0lORVMsIFBGX01TR19MRU5fRFcpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKg
cGZfcXVldWUtPmd0ID0gZ3Q7Cj4gPiArwqDCoMKgwqDCoMKgwqBwZl9xdWV1ZS0+ZGF0YSA9IGt6
YWxsb2MocGZfcXVldWUtPnBmX3F1ZXVlX251bV9kdywKPiA+IEdGUF9LRVJORUwpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2luaXQoJnBmX3F1ZXVlLT5sb2NrKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoElOSVRfV09SSygmcGZfcXVldWUtPndvcmtlciwgcGZfcXVldWVfd29ya19mdW5jKTsK
PiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+IMKgaW50
IHhlX2d0X3BhZ2VmYXVsdF9pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpCj4gPiDCoHsKPiA+IMKgwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKGd0KTsKPiA+IC3CoMKg
wqDCoMKgwqDCoGludCBpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IGksIHJldCA9IDA7Cj4gPiDC
oAo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmICgheGUtPmluZm8uaGFzX3VzbSkKPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKg
wqDCoGZvciAoaSA9IDA7IGkgPCBOVU1fUEZfUVVFVUU7ICsraSkgewo+ID4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGd0LT51c20ucGZfcXVldWVbaV0uZ3QgPSBndDsKPiA+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaW5pdCgmZ3QtPnVzbS5wZl9xdWV1
ZVtpXS5sb2NrKTsKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBJTklUX1dPUkso
Jmd0LT51c20ucGZfcXVldWVbaV0ud29ya2VyLAo+ID4gcGZfcXVldWVfd29ya19mdW5jKTsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9hbGxvY19wZl9xdWV1ZShn
dCwgJmd0LT51c20ucGZfcXVldWVbaV0pOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGlmIChyZXQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiByZXQ7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gwqDCoMKgwqDCoMKg
wqDCoGZvciAoaSA9IDA7IGkgPCBOVU1fQUNDX1FVRVVFOyArK2kpIHsKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3QtPnVzbS5hY2NfcXVldWVbaV0uZ3QgPSBndDsKPiA+IEBA
IC00MTgsMTIgKzQzOSwxNiBAQCBpbnQgeGVfZ3RfcGFnZWZhdWx0X2luaXQoc3RydWN0IHhlX2d0
ICpndCkKPiA+IMKgdm9pZCB4ZV9ndF9wYWdlZmF1bHRfZmluaShzdHJ1Y3QgeGVfZ3QgKmd0KQo+
ID4gwqB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194
ZShndCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpbnQgaTsKPiA+IMKgCj4gPiDCoMKgwqDCoMKgwqDC
oMKgaWYgKCF4ZS0+aW5mby5oYXNfdXNtKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm47Cj4gPiDCoAo+ID4gwqDCoMKgwqDCoMKgwqDCoGRlc3Ryb3lfd29ya3F1ZXVl
KGd0LT51c20uYWNjX3dxKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBkZXN0cm95X3dvcmtxdWV1ZShn
dC0+dXNtLnBmX3dxKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaSA9IDA7IGkgPCBO
VU1fUEZfUVVFVUU7ICsraSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrZnJl
ZShndC0+dXNtLnBmX3F1ZXVlW2ldLmRhdGEpOwo+ID4gwqB9Cj4gPiDCoAo+ID4gwqB2b2lkIHhl
X2d0X3BhZ2VmYXVsdF9yZXNldChzdHJ1Y3QgeGVfZ3QgKmd0KQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ndF90eXBlcy5oCj4gPiBpbmRleCAxMGE5YTk1MjkzNzcuLmM0MGI5YzFiNWZlYyAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaAo+ID4gQEAgLTIzMiw5ICsyMzIsOSBAQCBzdHJ1
Y3QgeGVfZ3Qgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGZf
cXVldWUgewo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLyoqIEB1c20ucGZfcXVldWUuZ3Q6IGJhY2sgcG9pbnRlciB0byBHVCAqLwo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHhlX2d0ICpn
dDsKPiA+IC0jZGVmaW5lIFBGX1FVRVVFX05VTV9EV8KgwqDCoMKgwqDCoMKgwqAxMjgKPiA+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAdXNtLnBm
X3F1ZXVlLmRhdGE6IGRhdGEgaW4gdGhlIHBhZ2UKPiA+IGZhdWx0IHF1ZXVlICovCj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHUzMiBkYXRhW1BGX1FV
RVVFX05VTV9EV107Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHUzMiAqZGF0YTsKPiAKPiBLZXJuZWwgZG9jLgoKT2suCgpUaGFua3MsClN0dWFydAoK
PiAKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTMy
IHBmX3F1ZXVlX251bV9kdzsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoC8qKgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogQHVzbS5wZl9xdWV1ZS50YWlsOiB0YWlsIHBvaW50ZXIgaW4gRFdzCj4g
PiBmb3IgcGFnZSBmYXVsdCBxdWV1ZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIG1vdmVkIGJ5IHdvcmtlciB3aGljaCBwcm9jZXNzZXMgZmF1
bHRzCj4gPiAoY29uc3VtZXIpLgo+ID4gLS0gCj4gPiAyLjM0LjEKPiA+IAoK
