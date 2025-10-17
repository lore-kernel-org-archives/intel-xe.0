Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD09CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 13:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E84A10EBE3;
	Fri, 17 Oct 2025 13:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l3YGOxz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0343210EBE3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760706343; x=1792242343;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=p9Ll74KmHHc5uMv1U4YbafMKqCwcmKu4Z+BOEpSeA8E=;
 b=l3YGOxz4satwb2nEiJJ2bApXgkRXZEh8Ky91+zI+H/dglwGGEJBzBoiR
 HTclSs9YIvP39CUVldOvGoHrmCTaiSlG5KZg8m8B8GOIHgcu2EVrXkrcv
 eCta5qCr0qrIV+Kna15blLzlAjpJLiubRGzCrMwy+pUvkBIG+mkXpwDgV
 gTZsyiUMPxsZ4AQ8RYm8NxWetX+obGzacu5UOpqSROLVo3GyvtHkGk6iQ
 8DwoItBKfSVejv7SvSkNJmLgHaOGowKpZZBhAGpnGIjgRcu03maHeB4fB
 SPCJVaU0l0x/lW0ofeUpGRD1cXoscI4vKDas/HUDXbJbRZl2pAmz02jJ+ g==;
X-CSE-ConnectionGUID: dqvI+IW4QRSWLIKggZJTFw==
X-CSE-MsgGUID: fNtJTw1UThi1OFkuqV1ZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74358746"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="74358746"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 06:05:43 -0700
X-CSE-ConnectionGUID: +hUgQtrQQH6EK8oFefgr0A==
X-CSE-MsgGUID: wbvS+jVASl6We2iEz+Exjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="182732500"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 06:05:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 06:05:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 06:05:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 06:05:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKmXyuHoJ26q1U8ol91aw/klsCGPZh7g4eBYpjgcjfSvunfvxcO47Bo3f1/snQWIphIGwXU1Qn5nOITZWJ4HZaaub14nKWKBKJ5MYqaKt+aPGaoHFUgj+AMlib2BMgGa/zb82/Tn1xQiE0sbdkj4JoPH+fpRyv4ASZphhYZEL3Fb1vURIcBRkaJJrX/AicOfEAkPtU0GJTUq2WZfuz0LMwPXSPXi9V/xt1yjzjxGV6dzS6dm5y1SompOpxkrhY201JdWJvw6JEJaVS7nZaTPalH2r8lmsTFc9lggOnQok4VEuMAvuwfZRMUkpPibyuQ8OxpDkTHhkesqGa8BY8NZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq1VE0ICpQUS/SDSVllmtpcN2ZikAQH3wOqn/5CTTGc=;
 b=u9Zhmn9Motv4XStrv5IiWl4Cxo+lw438X8P5hApRGHew1fUyKYFlMNHrRwC0ExXArT10i5FZhtjQlrrO+brwAdcWQwknTQ/xTUtLVUoO0ZkS1y7FwovIpCsHb+wFugf06JHajOKXSEVMg91wq4qelYLwNtu4AaHUXLR7vaiADJX1yaA5VhXcIbuMNZuvheDkIzAAI3XosJAOYGpD6VYBkeppFVcvyFwTc3iHa4SpibEMllmVnmYP46Pydum3S0+1JKL/NY5BKVinheWbZC0mFYCEeDDIvvtQPPXbEXoNNR/9UScGeuDr9jh9lK5DUMMEUVCF98u//LsywK02XDsQ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 13:05:35 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 13:05:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251016-xe3p-v3-11-3dd173a3097a@intel.com>
References: <20251016-xe3p-v3-0-3dd173a3097a@intel.com>
 <20251016-xe3p-v3-11-3dd173a3097a@intel.com>
Subject: Re: [PATCH v3 11/24] drm/xe/nvl: Define NVL-S platform
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 17 Oct 2025 10:05:31 -0300
Message-ID: <176070633159.2362.9590401061780734808@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0014.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 15518470-7e5d-41a6-5387-08de0d7ddc20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE5iTlFlcXJjL1RJV3krdTFjdTdvZlV2S0huYTNVSXRDVTdjeVl1dEtERGRR?=
 =?utf-8?B?OFBuZXVWQ1d5TkZCZEUrS1lueTFubDdhZ3ZZSUlJVDZCQnQ4VmZWNndHVTVZ?=
 =?utf-8?B?VE4wdTA4VCthbHVwT3VNUnpkbWpaRXVqeTk2NStqUVRhNWZBczRJUnVpWksy?=
 =?utf-8?B?TVFpbnJmZWVRSDg4OU1sQmFQYndzRk51M2lzOWRVem9VUVgxNGordVlINXJ5?=
 =?utf-8?B?bjI3eTBoWGpmT3FNK2trZmV5VVJ5Rm91RC8wQVQ4ZnpFVE9iR3ZEcHRXaGFx?=
 =?utf-8?B?ajBudjVKN2psSVBQb1JHSy8zWi85RW92UWs2Zmp6RnY5NTNCcERKQUlGNlZV?=
 =?utf-8?B?ejVSMzdRNkp5WEl6YkZCQ3VlSWsrTUEvTjB5K1d1ZmJQRXVCSGI4Z1F0V2JY?=
 =?utf-8?B?OWt2TkN0TVNuMlJXb2lubldNWk1IZFh6NXdmeU9WUEtGdWlQbFErR0Zzak9a?=
 =?utf-8?B?RVNiWVczQTAvMmhYM3hoVUNmVWdWZkliL3FoR3JBNThkUkIrUlo1bjlKSGhQ?=
 =?utf-8?B?dXJLcHM4RzJKZnRnUk91QVJqRWRWd1ZpTjdaRmxyak15QzArZmdZNHlxMzI3?=
 =?utf-8?B?TGY1a3pPbHJCQUdGVmtkaENuSktRWi9xbkl6RnV5T0xnZFFjWi9FVnBCallI?=
 =?utf-8?B?eW4wZTJKNGVjbFF2Wk54bjdBRk5lYmVRUDNCeTFRcTlTNE1xM2ViQ0QwVnc3?=
 =?utf-8?B?L1l0SnlxZXZxd3BKMnZ3WmdpQUluMVU3YVdETGUwdUdYcmluSXBONERxYlQ5?=
 =?utf-8?B?a21PR2JyMTZseFpla2R6NEozNW0yc3pjQ0Q3MTFIRjdrQWxJeVVtVW5ZYU91?=
 =?utf-8?B?b3I5Qm1uN3pFT0I1QkNYYXMvU01lMm5NQ3gvUFdwQlM3L1FSYmR1TW1HdXRx?=
 =?utf-8?B?cXpPaGdYQXhKU1ZaVVIzM0JTR0ljWXJEdEx3WlMyM2hxcUxGOWduNjdsWm84?=
 =?utf-8?B?NTdNYXJKK3FJRGlsUnhTRjBjbnVKWGNqSyt3R3RWNjJIQW1QeUNuSlhWaHZw?=
 =?utf-8?B?UElNTmJ1MkdEU2J2ZzJPeWl5cHBZa2hRU1VlL3pYdWJ3bERaTVZRY3BxSUN0?=
 =?utf-8?B?V1NFRkZZRFJFNFQyc2VJT2dSMVpMbzVSek1GS2YzK1FiVlQrQXdYUytGWWtF?=
 =?utf-8?B?SlBNUkRnT1lxNU81MnBYQUNCTlRmemIwaDgwSmtaRVgrMlFkNXVFQmVtbW9S?=
 =?utf-8?B?TnVLdXpYb20wcVZ6VmRaUUlqcGdDNDRmOEwwdDJXbmdsdUtEaXF5MVF4Sndp?=
 =?utf-8?B?czdCYi95ZWJrSllkTE1qSC93Ti9tWldSc2xia0Y0cEdJTWI2RGhxc085MUtj?=
 =?utf-8?B?NkpDbGt3RDRFTS9pSTZURllxWEc2YkROaDduZzZ0ZDhQSWFpaU02MXFHL2lT?=
 =?utf-8?B?TUYrM0ljOW8zZ0hIL1g3RlQycUJQREFpdlZFSHJld1RWK3BRMlRxa0V2SG0w?=
 =?utf-8?B?cXRpL09mOVYyL2RydmFqTnIxUHlibFJYZ1BvS2xtWXZQRU1naGZnOHliTXdM?=
 =?utf-8?B?OEQ3VzZmZkpQQ2pwQ2tNbnFWemNyU0dQaDhFUWdlMlhaNmNZMnRxNjBWdjA5?=
 =?utf-8?B?TDRENXY2SUk1TktkR3FxenFVb3lJaXZiWEhFZGhVR0lJeDVWeFZ3eFA4Y3dB?=
 =?utf-8?B?a0ZuRm9VSG4yaXRsSkpIR0JrNk8waUJmQmJBNmJvRkw2TmlXTUY2RG5aR1dF?=
 =?utf-8?B?U1ZNcUFjZm1Yc1BvV2VGSlAvMTFxUW5wMGNvbDBiQXh4dmhwcGU1L3NLTXgz?=
 =?utf-8?B?aFpUZUU2YlFQT3FYTmMwdUhFZG05c255STNSc3FZbm9SeWtoUzFCdjhPc1N2?=
 =?utf-8?B?VlFCQ0REaGNLaTlPclByMU9vQUw2T2lhem5sclU3cGJDQktCN2hEaUs3RWhU?=
 =?utf-8?B?dGorcjBTeXE1dTc0d2VORHdlaFZYMkhCV2ZzelN0bjJTV2tDL2tSWXVVcVNl?=
 =?utf-8?Q?+BdU3YJnLnvvj4tWBpoMHAzYtoVSNQHz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pieVJFU20zSkdvWlVqNUs1N0VuSEUyQXM2MHBIUldkM0NsZ1pzTnNabmxr?=
 =?utf-8?B?cExubWpYNFc4amdUMUIrZmdQNFNRM3ovSkxKNFc1TFhoTzBZdzJGalpacHdr?=
 =?utf-8?B?VjNaaC9XdFVlc0gvQlNvOTlvdEhrazJOOCs2NUNaWFRLZkU5TVB6MUtPUzZk?=
 =?utf-8?B?bjJubjBOeTlRSFJJYU5pSUdFMTVtcDB0dG52K3Y1SUlhN291OFRjb083SW51?=
 =?utf-8?B?eFhScGVPZnR1dC9nTk9zaS8vbmEwTHVQOUFzcGhoeDVOaVpOWXRXMTJOQlFi?=
 =?utf-8?B?ZFpSZUdyQm9ZaXA1VHVMdGp2VVJDR1phaHdVSmFpWTN2WWtLK2k0SzNUK2ow?=
 =?utf-8?B?NUwxNUhwYzRWRGpqQU9SZFFTajlFS0N3NE0xSEtGbFBTOU44Y1FlYUFkb1ZX?=
 =?utf-8?B?L202Q25RZlZVSllPTEtpbVVHT3krYXovNy9VaURNSUZsRWFDamxwU29CTkdi?=
 =?utf-8?B?bDB5ekpSZGttZ3ZobG5mcHlhOHdzQUxHUXg5d084YmF1bXhUUnR0L21wa0tp?=
 =?utf-8?B?eXB0eEdyVStsaEVzQmhoTldDVHFqSEU2UWJZTTE2WWZxeEYrZjgybFhyS2Uy?=
 =?utf-8?B?bUVTSXJvNWpHK3BudzRORDU3WGZteHB1RG1haWU3Z1I0YjZ1ZERJZmZ2d0di?=
 =?utf-8?B?WURTR1dJR3lMNDhVVk55ZExlYS9teXk2bkh3SnZLQVkvQUhFNVVtMzlPcEww?=
 =?utf-8?B?NGk3UDJyL0ZuSGcrZ1ova2E0Sk1UZTRZVllvTFBPQkNES0JpdVN2WFBUOXE0?=
 =?utf-8?B?Y0NUNnZXUlZGYnAxd3dYWk0xTkc4N2FXV3dveE92dUFWQyt2SzVaZlY1bk96?=
 =?utf-8?B?YmlvNXFodGZsWVlvSGVvaTduQ0dwYkJnZEhpeGY2QmVYUUFwNERkellMemp2?=
 =?utf-8?B?b0lIbEcrZ0s1OTdNZzU0UnMzWHY2OFNrOXdYTFVrVThmMFVqVUVBZmZobFJU?=
 =?utf-8?B?Wk81MCtTYVpxQWhKT0pWc2NYZ1RVYWNoOXR2NXNWLzNOcDlhM0pSNkpCdytn?=
 =?utf-8?B?d055RGp3dk1EWVJzbk5icDh2NEtGbUxaQ0p4TEMxSDNQQWtycUtWNDVvdHFv?=
 =?utf-8?B?SThkS0pVR1RPdEtOaE1GbGQyY09wZmQ2K1VoQnI5OURkcXdKMmRjUlcvNWZU?=
 =?utf-8?B?VHJNd2xOMkZKZ2JBU2JCaEx6VjRzUng4NnV4MSt2YmtkNnBONE00YkVOOWJQ?=
 =?utf-8?B?M3Y0ZXEzZm1xd0RwaURJZEhISnR5cWhaSWlsMHZhRTdjQkF4cmtodXhsaStn?=
 =?utf-8?B?UE5nbXVQWHpKYUZoNEV3RS9jdWwreEQ4OWw4WmxRQXdzK0F1WEIxa1BOb0hE?=
 =?utf-8?B?Z1YwbENhMzJTV3h1RkpETW12cUJ1MUpmREloS3Jsby8yeE5qY1BpeG1tOEFV?=
 =?utf-8?B?eG5OWmdRSmUrcWV3RFlTYUc3QVJTMGxXYm5BYkdnSzNtV3VueFMyR3pXa0JZ?=
 =?utf-8?B?bkdza3h0Z1NYWng3eWRoY09vZisrUFMvMzdWVnJqNWFBMmFseGNxVlYrTlRu?=
 =?utf-8?B?dktNekI0R0t5S1ZzanlZSXludmwyb2I1dU5nVlFSN2l4amdpZ2IrVzNWMHN6?=
 =?utf-8?B?T21acndaYks4VGlmcnhPTFlHTk1aVWdGVldZRVJFQWRCUzBUUnh2elRFTkV2?=
 =?utf-8?B?eDRTbFRpaTRTa0prSGJxWTJWa3NsOWh5eXF2ZWErM0xpWHgvMEVJOVFlVmFS?=
 =?utf-8?B?SEpMdnFBcUtIalE5eU8zc3ZkZ2duaDVoNU1IdlcyOERLN3ArZEJJVkpkV2dW?=
 =?utf-8?B?clowejJ3dU02M1RGU2tSY0FrcmluSnpNeVRDZzVMaUVxcXk5TTZmazFVNkh5?=
 =?utf-8?B?Nms1dGVKNFVlREg3dnFSeE9jeGRpcUFmTTJsdVRNMksvQkd2Z01uWk42Vmph?=
 =?utf-8?B?YnVIMllmY3NKSS81QVVWdDB3QkFXTGhIK3A2M3lPNm0zLzVOcTk3emZTVE9I?=
 =?utf-8?B?UFJsNXJsMkZDVyt0ZHg1Z0UyL2VyRCttMHE1WXdXVGNETVhKMlNZVzIyVlhw?=
 =?utf-8?B?YmNrbHlWRE9FUmdoM0UwcHl3MDVyaU1PVG15SXdkSHQzditqOTBZcmJQVHRy?=
 =?utf-8?B?NlhxSGhtN1V5LzJOb01rYkdITDhnMy8yRE5PTUZkaHE0dC83YWdNYzYvTGF2?=
 =?utf-8?B?anhzb1NGMHYyZ3N4ZC9wSFd0S0NZMXlONVpRZWkwR1dubGtMWEY2THRQWDhL?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15518470-7e5d-41a6-5387-08de0d7ddc20
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 13:05:35.0263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2cBoSuCkrAhAD+/KFOKEPcT7TsK/9v0p4h3mL2KMxf9MGlrHzL75NJjgFXe3xRao8n9vaPka1Cey9UMvnZKZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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

Quoting Lucas De Marchi (2025-10-16 23:26:30-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Provide the basic platform definitions and PCI IDs for NVL-S.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
>v2: Fix rebase on flags moving to the device descriptor (Gustavo)
>---
> drivers/gpu/drm/xe/xe_pci.c            | 12 ++++++++++++
> drivers/gpu/drm/xe/xe_platform_types.h |  1 +
> include/drm/intel/pciids.h             |  9 +++++++++
> 3 files changed, 22 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index fac46178cebba..0546442e2a631 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -377,6 +377,17 @@ static const struct xe_device_desc ptl_desc =3D {
>         .vm_max_level =3D 4,
> };
>=20
>+static const struct xe_device_desc nvls_desc =3D {
>+        PLATFORM(NOVALAKE_S),
>+        .dma_mask_size =3D 46,
>+        .has_display =3D true,
>+        .has_flat_ccs =3D 1,
>+        .max_gt_per_tile =3D 2,
>+        .require_force_probe =3D true,
>+        .va_bits =3D 48,
>+        .vm_max_level =3D 4,
>+};
>+
> #undef PLATFORM
> __diag_pop();
>=20
>@@ -405,6 +416,7 @@ static const struct pci_device_id pciidlist[] =3D {
>         INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
>         INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>         INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>+        INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
>         { }
> };
> MODULE_DEVICE_TABLE(pci, pciidlist);
>diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/x=
e_platform_types.h
>index 3e332214c7bb4..78286285c2495 100644
>--- a/drivers/gpu/drm/xe/xe_platform_types.h
>+++ b/drivers/gpu/drm/xe/xe_platform_types.h
>@@ -24,6 +24,7 @@ enum xe_platform {
>         XE_LUNARLAKE,
>         XE_BATTLEMAGE,
>         XE_PANTHERLAKE,
>+        XE_NOVALAKE_S,
> };
>=20
> enum xe_subplatform {
>diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>index 452c1de606ff2..13c592e1a28c7 100644
>--- a/include/drm/intel/pciids.h
>+++ b/include/drm/intel/pciids.h
>@@ -887,4 +887,13 @@
>         MACRO__(0xFD80, ## __VA_ARGS__), \
>         MACRO__(0xFD81, ## __VA_ARGS__)
>=20
>+/* NVL-S */
>+#define INTEL_NVLS_IDS(MACRO__, ...) \
>+        MACRO__(0xD740, ## __VA_ARGS__), \
>+        MACRO__(0xD741, ## __VA_ARGS__), \
>+        MACRO__(0xD742, ## __VA_ARGS__), \
>+        MACRO__(0xD743, ## __VA_ARGS__), \
>+        MACRO__(0xD744, ## __VA_ARGS__), \
>+        MACRO__(0xD745, ## __VA_ARGS__)
>+
> #endif /* __PCIIDS_H__ */
>
>--=20
>2.51.0
>
