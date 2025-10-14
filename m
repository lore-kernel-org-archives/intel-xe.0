Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF53CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 21:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BA510E241;
	Tue, 14 Oct 2025 21:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ffe78ov3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BC210E241
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 21:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760476503; x=1792012503;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=/rLlEYkSSMP6frgvdL+b5u3xmShC7mJYg4EtqHN1q/I=;
 b=Ffe78ov3UF3LuDnYAis4OXwgqmhd13WGSCz6VaaEJcX2R64gKC125y2M
 4bzuhcH5cAtUD8tLhLxiVwuTpMpBtEUlFww43V4Np0xcYUc88JjcnQ5LK
 bALb3ZMfrDvT/8pefnHZbXRLDOtmmjgBLTDZUh++0h3FGrzaxDn4Ci+Vj
 GE0I8bAdjlkeB8+z5Hr9p7xnI1AcVhAcBYfpa8k7jgKK4Lg70R/r+fbHq
 opzPjDK0hTP5ZP4ALapdf66aGuRU+cUeUFkTvXvEtS9KheN5PxNpXeHVG
 MABLyTnCM+dk+vg9xWmN2c1UIpW5rtG6aE9l/Vn495SvXnNHAlFtPjmic Q==;
X-CSE-ConnectionGUID: p8K+OH5ZRPCAtrJJZz9mlw==
X-CSE-MsgGUID: X52iSBS1RQ2RN4kF1nqRFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73323155"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="73323155"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 14:15:03 -0700
X-CSE-ConnectionGUID: g3JAwS0aRleHaOe4N6rEog==
X-CSE-MsgGUID: IEnanA7STJeaZWigAiHGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; d="scan'208";a="186238034"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 14:15:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 14:15:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 14:15:01 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 14:15:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZ82ufdx+iS7o8b0GlLLeQDvU+Z1VMnr5tvbeweznelzndkJ+h7XHE3ScSdRNPOLKcj6kph1NV6ZGzpXrZHBYXsYw7UJc/bJZicNreBxiQUNcXdz/9/cDMZ8Nb2QnZvtq7QzvpVpvvCO1zBeyhy9AyKNkV7k/ASIHu2dIPG4+RwMKhZPdKkHz5nLDB+Qbd7XIq+Ynqulm30SDkvYo0EAce58h2h1iZI27jOwa+vYz0kdiPxgTYomhheo/wmeqW3ZOENGN5i1FiFDb4hDQCIAbndhau3nKehFfmL2apDD1bNQCNn7v5VKpfuz1zSM91jQV4WWhNpAOB8Vd0te/0ijOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rLlEYkSSMP6frgvdL+b5u3xmShC7mJYg4EtqHN1q/I=;
 b=SzLLJD7jJPgnCHQi9ndutrPkH4JZw4XKFpZS+NPRwmAFt+BjCgm9nQqwDd/L9AWPwi6bb2M5E2itr2M1X5Eknwd2AOxgq+G8+OJMFtlM0z1cOr+OlCrw6LMHwDjQf6+d4+vy+aCa25PwzshQazs9N+wVT64oaTXgl7SewCbtY/FTCOyEUL2+SVMDiBsmxcKkul6NW2CypVTOGoz1sbOFbqNKwKr48PHh5Z5l8UpxhOf1X3+ghQFaUD2G4qspyl892euTETUEsGQ7ZKaztGMXxfFevsI5hgr+MUV41Q+lxdxqMIupw4ivYghvEEzGJKuW4tfmVUEcQ6pOgU1lA4YyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 21:14:54 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 21:14:54 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Xe.CI.BAT: failure for Fix a couple of wedge corner-case memory
 leaks (rev4)
Thread-Topic: Xe.CI.BAT: failure for Fix a couple of wedge corner-case memory
 leaks (rev4)
Thread-Index: AQHcPU+V0UGGUdj/UUqHxgEiI/JdtA==
Date: Tue, 14 Oct 2025 21:14:54 +0000
Message-ID: <a1b9e5b9f6402be37eb8593450f5731282b69047.camel@intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
 <176046920292.12561.3412450757967118718@97596180aaec>
In-Reply-To: <176046920292.12561.3412450757967118718@97596180aaec>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SJ2PR11MB8514:EE_
x-ms-office365-filtering-correlation-id: f0c6c1fd-dc55-4d22-1fca-08de0b66b85b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aG9pWkVxcDVNRXIvc2xxUnZjc2pRVWdPelRxelhTek11TWx0K3Y5YkR2TXNJ?=
 =?utf-8?B?cVowZWNOUVZhWUNnWmNoc2NGbTBxd1ZKaGpBM3hzVkNrd0lhclFuVTQvdGN6?=
 =?utf-8?B?SnlhU3FQdUxNdE5vSUZxcGRTbUI0OTgxdVdGaGM0SXR2cXZwUlVRZXVEZmpq?=
 =?utf-8?B?VTA2c2pXU2h2VjVMVU9JMHBOVkgzTW1CSS9tdUM0R3Erem1zTFRva1BWaGgr?=
 =?utf-8?B?YUVrNEt4czJqOW9wSzJDS0pvZ1lVZTJTN21CWDhBaytDWTNKRVdtencxd3NC?=
 =?utf-8?B?dUhGNjFIMzk3Q1IvaDZnNmhISW9oaE90OHRDTGQxOHRJSERDS2oxdmgxMjVR?=
 =?utf-8?B?RGJuVnk3V0gvSGNzcjgvTFoyZlUwaitUQ2c4RXhuMHREVWI0WlJmbFArdGl3?=
 =?utf-8?B?bTVGQjFKTkFYalFaQmNockg1bm55bllwSWhMT25YWVFGei8wWWU0dUkxZWFj?=
 =?utf-8?B?d1B2NWk0UkhudldIVTdYTHlUcW1wQVNDS2hDOENYRlI2cG1QTWI2USszdjlR?=
 =?utf-8?B?aTRSUlB0dzVKM05Ub1Zwc1VHQklhb2xvc3VnbnUzMmJjdDBaYXZQUEFBOExZ?=
 =?utf-8?B?alVQUzA2UGF1aW1SVTg3UC8ranl3ekZKTWI3UTdUejJiRTFKRUltOVVjMkFk?=
 =?utf-8?B?SzhqWmlwREtmd3BZTndPcWJOdWIzTXQzajJXNHJJcnc0Ry9PNFd3WFdlZTlB?=
 =?utf-8?B?clViVHNrbDQ0aEV2TXBldzJjSW5MK2V3UGFqN09aNWw2NjBVMkJ5N2RrN1NV?=
 =?utf-8?B?Ynh1WDJzMy9TUjg2WEdQMERtWHFsWU5TckNVQkdCSm54Zno1YjRETk1PbGdR?=
 =?utf-8?B?TUdwTjFTUCt4T2hXT3dJeWV1OVd2ME9OUzdWMXpTK01HTGhjMjFqUGdBWFF4?=
 =?utf-8?B?ZXhhUWdhTlVpdm40a2hCVGxmRjJzM0xKQW9jTDB1RXhCWU8wV2gzaFAyZFNG?=
 =?utf-8?B?ajlYdHdXaW5sRitwV3gwV0VqeVhuaVFXT2hiYjVPMFpMU1JoWGc0K3lic1FK?=
 =?utf-8?B?T0RMbFhyODVTOENiYXhsOStjWTl6WXJRMVFnWklxYWlSVUV5N2dNcktxRWFS?=
 =?utf-8?B?UXhYK3huRFIrZzlwd0RRdGxWOVNGZE5yS2YrdUNtaGFabFBmT3VIU1dvSDU2?=
 =?utf-8?B?a3pqdVNXWk5wMk5SVXRjVGJvbDNtNlBBNVpPNDhtZ21PZWZUU3lWMXJUWkgv?=
 =?utf-8?B?YjRyUHR2WC9HWjVaSGJnTWJuYWJ6c0l6ZUhhSVZET1pnZEJQWFFwNWpwRWht?=
 =?utf-8?B?d1YxbkdaSjJ1djNmYXF3VG91eUJ4ZmxBTWMwSDNlcS9adHJUdFVua3N4Um5K?=
 =?utf-8?B?c3ZpR3lTWExCYmE5MktqaEl6Lzg2RWRzalpMeFMzZzRUK0NvbEJYQ0JXdFEw?=
 =?utf-8?B?cFNLMlBNdzRvdTQ2T2pXcUJxbGwwa09TdjhhdzViSG80bjJFQ1ZFb2Zrd2tO?=
 =?utf-8?B?NHl0ZVNBVDlpVk9abUlrZFRSRkw3SUFiM2JnYnNqdHVTZHp2WlY2UFNib1BN?=
 =?utf-8?B?QVc2WXNtZWJLTHlGM3h1eFpLRUJBancrOEZsWk1aZnhTVzYyOTY0STNDUGVB?=
 =?utf-8?B?UXVVZW1hYU1oWlZneENhd1R6T2R5TnRZRm9lRDZnUVVaMFhaQVpGUnVLKzdx?=
 =?utf-8?B?WE4vWGg4UWNYOUR5LzltaEZYNlBIMHovTllXYkZmYko4YnU1UGlxYlBWdEli?=
 =?utf-8?B?a2FEd1VhREVSTTAreEpWOWlQellreDZjdkYzczJLYnlUV3ZYVzArRVBoM2du?=
 =?utf-8?B?a2x1ZVdoYVVSdUVkWW04SE9mbWFNdXFyelJnV2xTdXFuN3orOHB5REl3cXI3?=
 =?utf-8?B?bXJlVVppSTQzL3hnYzU0SFFlM2wxaG5PM2E1VHFsTVJjdVVEN0cxSXUwSXFx?=
 =?utf-8?B?RTVsN25ZS2RXMFRISTNTSktZeDgvMlM4Qk5GeUgwdlFNcEZvWlUwckMzNjd1?=
 =?utf-8?Q?Ogvrhl0/IRa0YuWzlm7UDL1quzdsa7+c?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UUR4dVYyb1N2Zm5WclVGcXFXWlZOUjFJZHo5R0VqSWUzQzVnNjVSMmF6YzdN?=
 =?utf-8?B?Q1F3SjR4bmdic0hKWFhRYkNjRXQxSnNMYkU5ZDE2Yk83MTVvRndNY1FwOFV1?=
 =?utf-8?B?OTg1Uk1qZGVFdHZZeWh6MU9VeHZzUmFuVGRZSnZwS1MyR05zMTNJS1Mwd1hC?=
 =?utf-8?B?aFFzb2VjZ2dqa04xQlN0TEJuK0xrNzd6b29qaW1jcmxSVVBUem4zZlorT0FZ?=
 =?utf-8?B?RmRiYzRqTUkySlhPL1BsODhLUmQyUXdldnBYcW44OThTQnNJcDlQUjdCZTRt?=
 =?utf-8?B?SzF0SldrMUM4MEVBLzlNUmxFSitOcCt1NmhVSU04OXIwellrUWpBOHNIampC?=
 =?utf-8?B?Q2VOSE55QS9jL0trUGZWWWEwZjVDOFY0NmNuYzJ4MGd6Rkx4Ris2YzBQOXJV?=
 =?utf-8?B?Z2lzN0JHdUlEdGlNN0RCNVBRU1loRWdSYkhXMXR1YUI5S3kydDhMZ2ttNmE2?=
 =?utf-8?B?ZXl4WEFEQmhidmZGdkRmeTJLR2VROXFoTFlFaXVteklUSjdXUGNOS1owUHhW?=
 =?utf-8?B?VlByZ2NWOStXM0g2UXB4cFZDOG9COHZBbHFpVTJuc1R0ZldhTzNOQ1pYM1N2?=
 =?utf-8?B?QjdNcHpkRGpUL3VmaXAxKzZIOFUzOExRemdWKzBjUG96ampRK3YvWnNxZDdE?=
 =?utf-8?B?Vk80M3pTODdOUFNZcS9idEo0UXd2ay9SL0NKWmNqTmRENHlSWDlXZ0ZkWW9H?=
 =?utf-8?B?aVV4dEtEOFlQWjMwZFFpclBCNy9sdVoreTFsT2tyZjJ6a2RmY1dCbjZxNE1I?=
 =?utf-8?B?dkNzMW5jQk5xNUZ3dWpWUmgzd2tOZlo1R0hYNWtGK3RkeE5GVWJQendFSnhj?=
 =?utf-8?B?NWdtQnlhcFgrOU9ZQTM1Um5way9WZldHbHdWTERka0UyNUtKUzRCUFlDQ3RX?=
 =?utf-8?B?dVpzQjFTZm9JZDZBWE1xWXpPOGs0ZDhsc1VKK2pHL0l1Z1RpdnBqcGMvTHlC?=
 =?utf-8?B?Y3hyZjhiTXczQjliUVpmc2IzUkVIVHNHRnZzQStSN1lnNXd6WGgydVhYWjJn?=
 =?utf-8?B?dFBIMW95bFdjWlFpUFYrK1Ryd2V2N2tkVzBENjM3dlNOZVNWZ2Y1L3pueGxu?=
 =?utf-8?B?MUpZU1dZQmFsU3pYZDNDb0xkV0FuaHFIb3I3bEdYNlQrcW1qR1ZJTWNHRHZY?=
 =?utf-8?B?b2YrQVdZZnNPM3h2bjlCclduek9RVjJrUVV6ZmpOT2xMNlhRKzRrVWljZ0Nn?=
 =?utf-8?B?MWRFZHE4UUJEK0dxTTlmbWR1UmkwZW1LbHFneXlLMXl0K3hYbkFLekJxcXJ3?=
 =?utf-8?B?UUszeGJQZEs0Q1RrOHY1RG9uVXI3ck0yM213cjRXZ2FlYzFWTzYxVStSblZW?=
 =?utf-8?B?TFVmZjRkSkp6ZVMyazhnM2w1d0VTeXo3TnM3Z2dwTHFralR0ZGw0Nnl5Q1Q4?=
 =?utf-8?B?SEpFR2l0aHFvTWtZeHl6bEw1R3FwUEJyWkJ1dHMyclVVcHROUFpqQWNMUDh6?=
 =?utf-8?B?S2QzY2Y3cmRsbThCYkc4SkI1d2hmZGZvVEpJeDBiY2ZFWCtTdkt2a2NNZTJv?=
 =?utf-8?B?dmp0QlQwUkFhbjhZejBJdXdxeEN4SnJ4a1A0aEcvVEd2Tmd3WU9ZMlQvUDRD?=
 =?utf-8?B?NTM1UlN0SFhUNHRVU1p1N1NGdUszSEZMaGFTTjRRN0NxRHI1NXNlMWlUcWxE?=
 =?utf-8?B?SFlRN3E1R1RkaGlhZWx1N0Y4a1dFN3ZPcXg2VVk2UEVIZEZWUFdkcFlqMHFJ?=
 =?utf-8?B?clMxaitzd0w1RzFKelBWcGtuK2hYWVRuUWJmTzlmUWQ2T2JjZFhJdFdBK04w?=
 =?utf-8?B?eHpxZnI2M0IvNzM2MENmQmhjNzB4NXdrT3poaHdhTVM4RWZIT2FVTG5lWmFa?=
 =?utf-8?B?cDhsTnd2V1RpU0I1bmczUUl2c3RWNzNCOVM2bVpRWHMzSUJRZTdlTHNoUi9y?=
 =?utf-8?B?QVJ3TWhpQkdjNCtoVHUyU2lTZzg0VXJPaDdPdU5RRnd1V1l1Z2J1VUVCdVpv?=
 =?utf-8?B?WUYxQS9VQ0JyTkJQdDZoZkRJa1FRWEVqems1UEkyM2QwZTAvS2xOWU1xUVVO?=
 =?utf-8?B?dFcySHh6dGkxWFRTVHM0VXpaWU9jbGJNV3ZHWE11OHVHQTRDUDJ2dHB1K3ov?=
 =?utf-8?B?UkQzZ1ZRVnIzcFdmYzFGeFZXL3gweCtXQU5NRGJveWRGRHNzdndRQ0RNWUxP?=
 =?utf-8?B?MWZhT3dmQnB6eDlCRFl6RDRiRFdpeDVFZi9DazlkTEpuTXg3UVlSQ1JveGRo?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37670626EE89CA4198573DEAF7BCBC3F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c6c1fd-dc55-4d22-1fca-08de0b66b85b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 21:14:54.0582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fpuY26UgAxd5kyoTErbGV1CCJtPGI9makU4jgmnvkUA5s/2bqLSKQGxEbUi1TL+3jzpjLApq1/xpl26Q3E3bKBPzYo64qAkPES7xLTEiYXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
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

T24gVHVlLCAyMDI1LTEwLTE0IGF0IDE5OjEzICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+IFBh
dGNoIERldGFpbHMNCj4gU2VyaWVzOiBGaXggYSBjb3VwbGUgb2Ygd2VkZ2UgY29ybmVyLWNhc2Ug
bWVtb3J5IGxlYWtzIChyZXY0KSBVUkw6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9w
Lm9yZy9zZXJpZXMvMTU1MzUyLyBTdGF0ZTogZmFpbHVyZQ0KPiBEZXRhaWxzOg0KPiBodHRwczov
L2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNTUzNTJ2NC9pbmRleC5o
dG1sIA0KPiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIHhlLTM5MjAtDQo+IGIxNzJmNGU3YThi
ZWIwYmFlMmZlZGE3ZjdlZGZiNDllNjYxZmQzYmVfQkFUIC0+IHhlLXB3LQ0KPiAxNTUzNTJ2NF9C
QVRTdW1tYXJ5RkFJTFVSRQ0KPiBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4
ZS1wdy0xNTUzNTJ2NF9CQVQgYWJzb2x1dGVseQ0KPiBuZWVkIHRvIGJlDQo+IMKgdmVyaWZpZWQg
bWFudWFsbHkuDQo+IElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhp
bmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiDCoGludHJvZHVjZWQgaW4geGUtcHctMTU1MzUy
djRfQkFULCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0NCj4gKEk5MTUtY2ktaW5mcmFAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+IMKgdG8gZG9jdW1lbnQgdGhpcyBu
ZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMNCj4gaW4g
Q0kuDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDEwIC0+IDEwKU5vIGNoYW5nZXMgaW4gcGFydGlj
aXBhdGluZyBob3N0cw0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzSGVyZSBhcmUgdGhlIHVua25vd24g
Y2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4NCj4gaW50cm9kdWNlZCBpbiB4ZS1wdy0xNTUzNTJ2
NF9CQVQ6DQo+IElHVCBjaGFuZ2VzUG9zc2libGUgcmVncmVzc2lvbnMgKg0KPiBpZ3RAY29yZV9o
b3R1bnBsdWdAdW5iaW5kLXJlYmluZDpiYXQtbG5sLTI6IFBBU1MgLT4gQUJPUlRiYXQtZGcyLQ0K
PiBvZW0yOiBQQVNTIC0+IEFCT1JUYmF0LWFkbHAtdm06IFBBU1MgLT4gQUJPUlRiYXQtbG5sLTE6
IFBBU1MgLT4gQUJPUlQNCj4gwqAqIGlndEBzcmlvdl9iYXNpY0BlbmFibGUtdmZzLWF1dG9wcm9i
ZS1vbjpiYXQtYm1nLTI6IFBBU1MgLT4gQUJPUlQNCj4gKzEgb3RoZXIgdGVzdCBhYm9ydGJhdC1h
ZGxwLTc6IFBBU1MgLT4gQUJPUlQgKzEgb3RoZXIgdGVzdCBhYm9ydA0KPiDCoCogaWd0QHNyaW92
X2Jhc2ljQGVuYWJsZS12ZnMtYXV0b3Byb2JlLW9uQG51bXZmcy0xOmJhdC1ibWctMTogUEFTUyAt
DQo+ID4gQUJPUlQgKzEgb3RoZXIgdGVzdCBhYm9ydGJhdC1hdHNtLTI6IFBBU1MgLT4gQUJPUlQg
KzEgb3RoZXIgdGVzdA0KDQpJJ20gbm90IHN1cmUgd2hhdCdzIGdvaW5nIG9uIGhlcmUgZXhhY3Rs
eSAoc3BlYWtpbmcgZm9yIGFsbCBvZiB0aGUNCmFib3ZlKS4gSSByYW4gZWFjaCBvZiB0aGVzZSBv
biBhIFBUTCBhdCBsZWFzdCBhbmQgdGhleSBhbGwgbG9vayBvay4gSSdtDQp3b3JraW5nIG9uIGNo
ZWNraW5nIHRoaXMgb3V0IG9uIGF0IGxlYXN0IGEgQk1HLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0K
PiBhYm9ydA0KPiBLbm93biBpc3N1ZXNIZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiB4ZS1w
dy0xNTUzNTJ2NF9CQVQgdGhhdA0KPiBjb21lIGZyb20ga25vd24gaXNzdWVzOg0KPiBJR1QgY2hh
bmdlc1Bvc3NpYmxlIGZpeGVzICogaWd0QGttc19mbGlwQGJhc2ljLXBsYWluLWZsaXBAYS1lZHAx
OmJhdC0NCj4gYWRscC03OiBETUVTRy1XQVJOIChJbnRlbCBYRSM0NTQzKSAtPiBQQVNTICsxIG90
aGVyIHRlc3QgcGFzcw0KPiBCdWlsZCBjaGFuZ2VzICogTGludXg6IHhlLTM5MjAtDQo+IGIxNzJm
NGU3YThiZWIwYmFlMmZlZGE3ZjdlZGZiNDllNjYxZmQzYmUgLT4geGUtcHctMTU1MzUydjQNCj4g
SUdUXzg1ODI6IDg1ODINCj4gwqB4ZS0zOTIwLWIxNzJmNGU3YThiZWIwYmFlMmZlZGE3ZjdlZGZi
NDllNjYxZmQzYmU6DQo+IGIxNzJmNGU3YThiZWIwYmFlMmZlZGE3ZjdlZGZiNDllNjYxZmQzYmUN
Cj4gwqB4ZS1wdy0xNTUzNTJ2NDogMTU1MzUydjQNCg0K
