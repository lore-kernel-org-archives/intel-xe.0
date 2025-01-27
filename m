Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54993C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 12:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166CC10E510;
	Mon, 27 Jan 2025 12:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyaIRBGH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF3610E4F5;
 Mon, 27 Jan 2025 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737981679; x=1769517679;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=B10AgA0ql0hoyP/D99EzTmUd4tm6xjzgRWrxK38DVOs=;
 b=QyaIRBGH+jByFfmsmPKJn+D8CtfzOnwdRkOKAIlVmmWRPByOkhwDQ8p/
 BFSNCpEQFyyuLIJz87Z6+YlGqN/UcZE6bE5wD7Mbds73Ud1QE6RzQXDfC
 N0vx4QRRfofvroVCCdjTECzUBn1AEJBOMgxO+9/D9+OzNMTrfLnUxAJi+
 xVWy7eHyZkO4iSdG1YhFog69JARL44rLCID+9Cx8UG+Tapm1tOETplna7
 7sLgGs05hNXLbLrPUYQW8mbAR4CK16cVxxh5oh0AhW98vp6UHrxa710Nk
 cDZXB9DbRVFPdSIJtM5Eodb+mNbbqPc7pOnytEMx+2N4JAqki5fBuTbHV A==;
X-CSE-ConnectionGUID: iCPOjMymQgqSr236RyoRUw==
X-CSE-MsgGUID: I/uLB2l2S/yAt+zMhgakEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38348433"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="38348433"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 04:41:08 -0800
X-CSE-ConnectionGUID: 8IH8a8J4TuqK6wi5vpd/1w==
X-CSE-MsgGUID: pSaqVJZATrKPm3mYVhjhqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113567715"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 04:41:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 04:41:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 04:41:07 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 04:41:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAvuv6q3Z4aQWzsUYCOYcSw+LM9wfPnIB+4H/vTXhq2MNcPTdNz/H6FQ2kmMRD6NACZmkEly5CZf1/Q5T3gVNr0wPh2OMCRzPbYLCEOZklM2jomVGM7K2F4InX3HCv4SrWnGNBoRO1Yxroj7Tg8kucKIko4PVT8F2TcANdtVkAr+yzcdbSGiNE9xrjEkmUTGXgfnnsyZ+ebnr5aeP8zXI0Ku+IGmEfs3YveIRy+EkziSbUtCe9r3o3Mhd6DbN4fGFkb5GPKKXZl2ubwW5No7XvIgCKZY+dtqa/P9yX1Exu/X9H8CQsnEoZO6c5vJMQ+MtBcbckrZ5Xqgmz8nu5ugIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlquSW4s6VInE4Jk8ykefq/QQke9T7soSX3kw8XEkag=;
 b=Kpup6iAP8/d+ac5WE9Qn8kZtRfob4Kzn+bLQGXrrqpyvv4MV8bKQhlX4vP5TaKk2tBxFsdZIzKTpX4oKMiVyl6ouPoRBIc4eKtlsVelxf7KZlgW9tXnysagNTqR3rAVfxQk3Tmz4buopr7SgiLO94dDTId/C7pP5yyQOE8T4EUJa5EK0owQPT4EUel3s2mOAME63mAn71rgFKkzdr4JtYbYriVhre4YgOG6RfV600ZMiMs9p/yaN4QN9tvgiYwe5GRdVMa5g58Z7yd4fPJl9THYlI4rUKKCK4tj1cnFQkNNEYxBg+xXjSK+m5kMY137C3GUkewspi4bHO2tG+d/S8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN2PR11MB4615.namprd11.prod.outlook.com (2603:10b6:208:263::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 12:40:24 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 12:40:24 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173777420102.99963.14298772761339187449@b555e5b46a47>
References: <20250124173956.46534-1-gustavo.sousa@intel.com>
 <173777420102.99963.14298772761339187449@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/cmtg: Disable
 the CMTG (rev8)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Mon, 27 Jan 2025 09:40:18 -0300
Message-ID: <173798161841.2736.15863543915128976339@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW2PR16CA0003.namprd16.prod.outlook.com (2603:10b6:907::16)
 To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN2PR11MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: d142ec20-9da1-4e4c-86cc-08dd3ecfc4cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkpWZ1k5Q2ovVGpNQzU3QlpZWUpXQnBwWXBTL3JIRzBwejFPdWV5OFFneGNE?=
 =?utf-8?B?OWYzd0lIbkZXbnBWK3VBMmQ3M2NPTlRMMEhYcTZxSm1YV0dac0FreExLMjJa?=
 =?utf-8?B?aTlhdE9vR1BiVnFtNFFHYkRKZitGMmlVeTZ4My9zUmpRVjJxQTF1UzEwUTdt?=
 =?utf-8?B?bUw5RmhwZmplNGFkUW8rWlhXQ211RDhwQUN2Vm1aVnVOV3ozZStxNXJVSjg4?=
 =?utf-8?B?dnhEZjNQS01JN0R0bWI1c0VHZWoxaEZGOFdTSVNDM1E3MUxvczl6U1ZmSnQy?=
 =?utf-8?B?bTdHMHhYYzUwanJLUWVWWllqYlVQUitWNitaWmsyL0V4UWFJUGVPSGllUCsr?=
 =?utf-8?B?T2t0YlROdnVMTkMxY0I3ZWczWENSNTNtaG1UYVJMTVM0UjJ3RTZ0ZG5rOEh3?=
 =?utf-8?B?ZWpaRlBySXhxZjgzWS93Y0ZncTc3MzNWYUVUQVgrdXRaYXFqcDZyOVBzb01m?=
 =?utf-8?B?a3duQ2RoaXFxbkZyUmdDOW9MekpFbk1zOUJUbWtxU0NDUzJHbkxTdVJMWTl2?=
 =?utf-8?B?QVE2dmxidkpmK01QYTl3T2pRZWlpbmZwSms3aDhqSitGaDhnYW90dmJXV0JM?=
 =?utf-8?B?TGYzY3FYWGVBMDRkYkFCWTZzWjJHci93RWx2T3BmRVpzSmV5WVkyNnVZK1hp?=
 =?utf-8?B?UmlBZ0hjLzEwL2pHWnVuZEs1WEhKMmR6cnI1RklmRnNBUmNBQVFkZTBhVjlS?=
 =?utf-8?B?Y0NsRlUwbGt2eUJsR1FaZzIyQ3ZyMHZwNjdJbk04Vm41cWFKRzBva1lCN21t?=
 =?utf-8?B?MnFzaVkwdGJVZm1IYkhlQlNCQVZpQVpra1kyZVB2Rjlnb0crMnV3Y0xHdXFS?=
 =?utf-8?B?ZGdKejNhVVpoVUZjQzd4OHVhUXpJSVVuWm9jTHE5elhZWW5aTVVsZWNWVDNU?=
 =?utf-8?B?UU50QWdQZ1J1MmZuVGluOTFRSHdTV3BKNEFRVzRsK0p4dkxKeHUrNFB5dmxv?=
 =?utf-8?B?ZXhXTGRLN0l6Ky9EOFNkRzNHMHhaSTEyQ3loMmlsNzdLRWUzUnRPbEthcXRv?=
 =?utf-8?B?TkZuOWZycUFma1VsaU5yc0NNNVErYjVZN0t2cHZ3RUp4ZGpEL1FaSFFpWkFE?=
 =?utf-8?B?UFdrSUVmN1grbklKblQzSVJoUmQzM25xcXcvcE5Rd2RET3BGNWV6dUtNOHRy?=
 =?utf-8?B?RDM1K0dpOFJ5M1dGazBWRm9jbWJSaFhUblN5dlN2M3ZxbGdEMGJjOXdRWWVX?=
 =?utf-8?B?VUxGbnhtOS82cmRhenB0N3NGTjRQQzRMakw2Z29KZFVGMFpxOUNuVEJzOWhr?=
 =?utf-8?B?clJzeUJGUzBSYno5T2gzWE55c3grdnk2U0NnRDNTeUFPSENJUWkzV2c3VDAy?=
 =?utf-8?B?UWxLeG9aNFhhTlY4WkxvcDZhN1N0SGtnYlp5Y1N4Y1ZteGtTQmVld2xFZnpJ?=
 =?utf-8?B?cTJkRUtGeUl5L3AwMHNseHNBRTBqTldTd0dmcVpldUV0Tkc5aDc2Q2pTaGww?=
 =?utf-8?B?Y201RWRNUFNhZzJHMEErN2huY2tiSXp0Skw2dVlDYjkyUXJkeENoWjVnOWJy?=
 =?utf-8?B?dHlyUDF0S3ZHb0hSTUR4MWd4c0ZBOTg2YWtGR3AwZlJtZ3EwNVBxMUtBc0U2?=
 =?utf-8?B?UlpZSHNKaThQbndLdlZ3ei9yajg4REh3QVlNMi9nSTExcEFWYjJvVGd6cWhE?=
 =?utf-8?B?VXVDa1RraUdTQVVQMkYvREo1cVhPbjJKQW1mQTEvUjdUdnVQQ1RQWnh6by9W?=
 =?utf-8?B?N3d4VytYME9hb2taR0Q5b2l0cFNDQzBacC9RNkdXMjliVWhHWUw2OTZBZEho?=
 =?utf-8?B?a1lQL3ZlTytMc09CcVZlOVZRS2l2N1F2ZzFKZy9VSzRFWWlXY0czbi9wc1Na?=
 =?utf-8?B?KzBXN1FZbklYVWo2emIwUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlVBci9SUUNNa3FzVkhteExQZjJTOENqSGVWemNwSnd5TnkrVURTSlQzd1dU?=
 =?utf-8?B?eG1sNWJPYjAyTVgzTldMSXpoMk4zemQwMzBRdWJQSDA4RjlHd0RnWHhJZDdG?=
 =?utf-8?B?OUU2SDZKMzNSTXZ5UVlEcHh3VGtDb3hiR1V6QnNhWHJ0cWRBNmsydVVwM0du?=
 =?utf-8?B?emdqRW1nQkM0aWx6NWs4cXkybFpvejhmWHFiWHlkSE9EZkM1VTVycVFvVjFn?=
 =?utf-8?B?WHMrc0xQT0VOMi85NHU0MmFnTW1iaWUrWlNYdFdJTjR3NmFSTEFEb3FyQ0x5?=
 =?utf-8?B?amxHN0J1d0Q3SGdxOVlBRWYzL1IwaFpscVdPeEVON1QwQTNXbzVQZ0ZQVFR5?=
 =?utf-8?B?TWlkeUNxOEthMjBqVTlyK1R3c0xDdzA1eVJBdDc4YytGaXdEQWlDTzNuYnVs?=
 =?utf-8?B?Tk11ejJFRmpPN1VGRWxFY3REVUZuRFp4TFd6eGxBaTlRRUIxVFNQQ016ejZ0?=
 =?utf-8?B?akxFZk1IT3BxcUYxMEsyTXNQN0dYdVg5YzRwZk0zSEdjZTk4aWo0ZEx1ZVdl?=
 =?utf-8?B?ZGJZVHdxZG13bHkvekZKZDJCeUp3ZGtvVzJ0a0dtTkRmOS8zaGFVUE9LNDNV?=
 =?utf-8?B?Rm9BVzZZVjhyaVd3RFJNRDRNV1ltcGt1UjBiL3NDVVVTT2dMRlA4cCs0UkEv?=
 =?utf-8?B?RTBIQWhlMDgyc01xTWxtamR6ZGR6QjRIWWpDVGo0S0pCNDJSVlBhVjlCM3hV?=
 =?utf-8?B?Zjk1SnhFK0IyM0F4YTN4V0JBQmExYWRUcnU4N1hxbTNCVHFwY1lrUDBRNHlR?=
 =?utf-8?B?UEkyUE9jR1p5VG9IU1lydldLMGF3VHowOUNKYkV0empJU3JuYnMxWldlOHVC?=
 =?utf-8?B?cW53TkNnWnZvcEFzdlhsZ0RSbTNkMTNmOFVLbGczVlRvVDAxQWcvWmJPei80?=
 =?utf-8?B?TW1MWG9LYmllVGpkVVZxN2hIMkQ1Wjg4WWVwYVdUTFplWXd6SWw2TVpFUmFV?=
 =?utf-8?B?Wm5yV01vRUV4UVN0WUpPa2lIRkJ1Ui90aXltMENyWVRKZGlZbC9qbmhLbnlk?=
 =?utf-8?B?NEtsLzEzWExlc0UzdkoxS1M4S0dzNFRYd3ZNUnRNMXdLeDRGdzlmYjdzUVdP?=
 =?utf-8?B?djlHVEp4TitqUFk2eXZ3azNlbU4wZlQ3bFB4ZGgrWVNlWlBzSXlmMU9YWHp3?=
 =?utf-8?B?NEY0SFE3WjhjWkJYZDBwWmlWektwamc0SVJVM1lPZEhJNkVHZS9OK08rd2JG?=
 =?utf-8?B?djlhenVqUkR5ZllLNTlkVkR5RWEvRWc3eHBUaXdXRGVtQmFFMGpESndZc3N1?=
 =?utf-8?B?b0pvQVlhNVhQeVdJWHJLYWRmSDdPRUt5WGlWN2M3MTBYeG8vWFdjelhmd1hV?=
 =?utf-8?B?UGh6N0tvNkNKanoyVDFlUGdkNEtiQVgxRjJXeGxQekdmTGRYdTZVbnIxMzhU?=
 =?utf-8?B?QmhheHd3NXRSS3NSV1hKWU1kaDRScmlUOU5xTVBPVTdWSHZjdzdZZkJNOTFS?=
 =?utf-8?B?UU0vdlJrazdYY2JHdDNaaTZGUnE2eDJVdFBHVU83dUFia2ZpUnBIT1BsVkMw?=
 =?utf-8?B?ODI0WjdrVHY1NDNUQVVmMXovYmE2THZQcy9Qc0FIZFlUNmZuNWlKRHdvcmxq?=
 =?utf-8?B?SmtWY08xMnhueVdRbTBIUktOdkhTdnhTcEh1RGhjamIvejB4cXE2YTJSRE9z?=
 =?utf-8?B?cStnMlBFbXpLaGEyMWYwMFVOd1huWTZsMllMVzdwNkg0RWZ2clo4bjdJakJO?=
 =?utf-8?B?UnEvMWxMY2dYWkpvSXFPdDhUYTRFeGlrNUNKamcrZkN5R2tzTTIvTUJubTFt?=
 =?utf-8?B?U3RWNmhScTBqZG4rbm5PL0RoaHAxWS96TEtsaHR2UFoyQWZRSlFQVm9nRHlo?=
 =?utf-8?B?Tm5NazRzSENSR1drbWxYV2ZiVEt3RWloVWU5dVBnc2FSenZtUHBKeTdGKy9J?=
 =?utf-8?B?L2VHVXpMaFJVVmdBeXNWOEN2SW50M3VnTTlWNENhYUFMOGgrT2V1aDFoQVQ0?=
 =?utf-8?B?WTNaR3NHejA2T1N6emJjd0pzNU1pUXArcjZoVnhQUndJZkZ6bTZQN09nNzFz?=
 =?utf-8?B?RGYwcUc4NHZ2d0IxZmxyZFp1bHlIMzNtMnZzWENxMzRvRCs5anhVV0hBZyt6?=
 =?utf-8?B?VlMwNTJQdXpRQWQ5RnBqRGhrV0w0UnBrRHVvVFVIOEsxYm1EalhYUSthQk5k?=
 =?utf-8?B?bnhCTnVIRnZySzRVbHNZdlN1QmRyNm4vMzdjeXd1bXZTUGlaTzNmTmdLbnQ4?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d142ec20-9da1-4e4c-86cc-08dd3ecfc4cf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 12:40:24.0399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xMLRz2pc9qLVuFKT/U/m6jYdKihE9KT1r0zMFCpcfE7euvk54W8xHJHlvPatm2zyWMUeE2XsPt5/74zLrqx0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4615
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

Quoting Patchwork (2025-01-25 00:03:21-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/cmtg: Disable the CMTG (rev8)
>URL   : https://patchwork.freedesktop.org/series/142946/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2549-b36df02c99e3246ba2a90e951c71797327374db7=
_full -> xe-pw-142946v8_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-142946v8_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-142946v8_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1429=
46v8_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-edp-1:
>    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incom=
plete
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246b=
a2a90e951c71797327374db7/shard-lnl-3/igt@kms_ccs@crc-primary-basic-4-tiled-=
lnl-ccs@pipe-a-edp-1.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-lnl=
-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-a-edp-1.html

Not sure how this test could be related to the CMTG getting disabled at
module load. I would expect more issues to pop up for LNL if disabling
the CMTG would cause problems.

>
>  * igt@kms_color@deep-color:
>    - shard-bmg:          NOTRUN -> [INCOMPLETE][3] +1 other test incomple=
te
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-bmg=
-1/igt@kms_color@deep-color.html

If we look at
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-bmg-1/boot12=
.txt,
we will see that CMTG was not being used, so this patch did not cause
any functional change to the hardware state. So this incomplete should
be related to this.

>
>  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
>    - shard-adlp:         NOTRUN -> [INCOMPLETE][4] +1 other test incomple=
te
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-adl=
p-3/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

We only read the CMTG state for ADL, but we do not disable it. This
incomplete should not be related to this patch.

>
>  * igt@kms_force_connector_basic@force-edid:
>    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] +5 other tests dmes=
g-warn
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246b=
a2a90e951c71797327374db7/shard-adlp-6/igt@kms_force_connector_basic@force-e=
did.html
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-adl=
p-3/igt@kms_force_connector_basic@force-edid.html

Possibly related to
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2953 .

>
>  * igt@kms_pm_rpm@basic-pci-d3-state:
>    - shard-bmg:          [PASS][7] -> [FAIL][8] +2 other tests fail
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246b=
a2a90e951c71797327374db7/shard-bmg-7/igt@kms_pm_rpm@basic-pci-d3-state.html
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/shard-bmg=
-4/igt@kms_pm_rpm@basic-pci-d3-state.html

This seems to have already happened before:

   https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8193/shard-bmg-4/igt@kms_p=
m_rpm@basic-pci-d3-state.html

This does not seem related to this patch.

--
Gustavo Sousa
