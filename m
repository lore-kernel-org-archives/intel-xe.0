Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636D3CCD199
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:53:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD5C10E150;
	Wed, 15 Oct 2025 18:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNR0OSIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1459710E150
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760554416; x=1792090416;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=y/Nr/xXJehv82j5yfjb3GvcM9b/mlbMv2sjTCMAFu+I=;
 b=SNR0OSIAny3CwWFq13EAZKFfE5ILLVJq+W83I/sSFoFwkhi0nPrYi2fD
 xF5JhRYydSsucRkSr9SoLB6bYvZYA9VeERKoW7r1Z4M1QsMh+NPwqrX3r
 wQHV30EsfRBJnkURKDHd2EltD6eKVRJuOXYDolL5GxivGzt+vZdwwxdr1
 Kq2G5i8Uqk3du+8V4FMi1YRnMKNWVbE8GfUs7XBHAZbCcym/5TOxY082i
 lrAZndWWYz8y9hc8Nqz/AivEBw1GV2I+bqPtt8zzdpIlL0rMgxB5k13Es
 3pdLIPrx8kTuPKnO08lTFttFao/0jnDkY1V9bpDgQWSJuAAlBNEBFaAgG A==;
X-CSE-ConnectionGUID: bDZ4wq/LTiqJdd4DjHjJog==
X-CSE-MsgGUID: Sn6vrFStQgS63mbzJRyNmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62649033"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62649033"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:53:36 -0700
X-CSE-ConnectionGUID: uqwcuK9BS0G9hu7JWdiA7w==
X-CSE-MsgGUID: f0kyHtEdSTGe3pjKFcMN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="187538136"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:53:32 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:53:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:53:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKnHNwKmCLEmmdzrhkrWenbRVM6D/EAiBRUVRMZplx7eS4zK26H5+wvCJNKX+I2+6JaCuipONkFqkoCQogjb1+17UUpTFRsPh2ZHACOlDGIvxb+BofsLjNGdus7U1YPkXQFVvhUZzzjaBMW26B+0SEv4BVIAqNV0Jqmt8y0P9XsUNfxFE8OKXZDeZaaFaQX/xqYnuUL1m/ACD2yF5pBcREAFDmU7xX6p5adsbZ1RyEzHEzxtuutvv1glgeuKist0UL1KQp9MDFrlTjOpXeGYoUjVs0IHq0Lp0l/6ZVX4c+VMZ5mPgMt+XJBSzSOHLEFjzmmAI5GuPwP5LBfbSrBp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKujzvSJeTHfqSyv0Z3bAax3PkTPdiqjZCi3dMUG3O8=;
 b=gW/xMshPuEixQCCgJ5CDqgB/5RSe0jU68a2I6jAjP5vM0aqq401CRjcTtbqnUNg7kyoVmRqACFMZ5GrPj+e5O4v8oZnvh9eKDg+AZwLE5zjSe1LCj34zxRKgssySRIfWzKw+tXd/ZCb7PuoJoPsQ5rHyJ54ESJWsWbQ1pqL2ppXCN2qOxQ1UysHJKdgYeKSNXb7dENbB2vWZJO9knnZab9ERVerUPA0iQcGxrkLUuc9Se7lRg+P80Q0szARhJiH3hEhRE9P2FUZl69xJNXx8uaIZvnRlnapCWNfyYA7RytNpzkxYwWQ5IAKhyZ9e0ntjYcvTrGcJLI/M3UIebt+WEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH3PPFE60A892D7.namprd11.prod.outlook.com (2603:10b6:518:1::d59)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 18:53:29 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 18:53:28 +0000
Message-ID: <aad00c02-ab6a-42f1-affa-0775a006858d@intel.com>
Date: Wed, 15 Oct 2025 20:53:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/12] drm/xe: Improve xe_gt_sriov_pf_config GGTT
 handling
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
References: <20251014211956.1607561-14-dev@lankhorst.se>
 <20251014211956.1607561-20-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251014211956.1607561-20-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH3PPFE60A892D7:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cdc5b2f-657e-4194-7c47-08de0c1c20fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVB2d2VEMUJEZkJMd0svS1IrRGxLQ1NZczRZTnh6bDQ2RG12WXAxZEZuVjlY?=
 =?utf-8?B?SUxKQmNxcFEwSEkvbHMzQW9rY2F3SW8xOHgwaU9GMEZaYzRTRnBLT20rOFJl?=
 =?utf-8?B?bm5nSWUvZ3RrUksvY2ptVmJ5RzRxREdLd0NOdmlaUEYrNnZTRlFNb0ErdXNz?=
 =?utf-8?B?V3dXRW1KVnVvUm5TYytqR2tFNE9heGcvK3BXU0x1TitIam9ycXgxZk95Z0NB?=
 =?utf-8?B?Z0lrTkRnZnBWUkhGb3dXVUUwRk5ZQldGbmdFVlpYR1EvbjJuZUpYVk4rNVdy?=
 =?utf-8?B?NzJRN2xwSHRXbjliTDBIWC9SbFRoZDkzVXB1bDRHV2QreGRzeEpUYVhaTnE2?=
 =?utf-8?B?SmtVZllxV2pKNVlYMk5WOUNOWkp6Y0dVK3U3eXpvUmpzNktHeDJXSFgyaFY4?=
 =?utf-8?B?TlYxaGNjYnFRYkFUNGQrZFQ1Y0JCSmtTbHZLMzlKQTVBVWQyNW9zcTEzYWRW?=
 =?utf-8?B?Q3VLU1FNTFV4L0ovbTdPTXBBdFR5bCtONnpZejBHdS9wampoSlpLSkoraFpS?=
 =?utf-8?B?MGtteWJGNGIyWlpKcjZIYlhHNkZpMHdtMUhKbVBpdFFhdGVXS0pyQkNNVnEy?=
 =?utf-8?B?OVRzSG1LVlpMTmlFVHMrTmhCTnNKOE9SRmNpOWYwUHpqci9QZ2kzdE92V1Vj?=
 =?utf-8?B?dDIreEZnaUYwQU5vUEZHR2VodXlKSzM3RXIzTFRXbnh5QTZuZWF4YU5acHJr?=
 =?utf-8?B?ZGNsckdydVY4d3AvYjU1bGxYK3VpekVvZmJIb0U5Z1g4dGhzaUp6cjluSldC?=
 =?utf-8?B?M1VuRmtnbGtoSnRtR0dwVjZzSWllb1B5K0IvaFQ5dHBLZ0NCY29NNGEzY2hL?=
 =?utf-8?B?Zm1XVFlZSHY5bUlGR05aRkdHT1JjTGozMmF1WmlQRlUwK3VHU3VvRmZhQzhU?=
 =?utf-8?B?bnZ2V0J4ZXlIc2pTWUkzRGwzUUxQR0hWcGRRTXlsL1Z3RFZvN2hWTzdyMnRo?=
 =?utf-8?B?SEs4YmxXRW52NjJIbDRQK2NxRkVucFZScjIrMG5Xa0Y0amtjNXdvRWxWaGJw?=
 =?utf-8?B?RkkvalhBWmJORzdMcXBCSmZVSVhQZENlZE50aTlSazlYTUVSYXYvVktPQUxs?=
 =?utf-8?B?bUNvUFZ0VzNOL0ZPWEVndlJpQ0J3WG5TV2gvMm5wa1A0cWxNREpET25xSHlZ?=
 =?utf-8?B?UFZsc2grY3RTcnR3NzgrOW5EODJhSlQ4dmZjMzMvc2NxbDhIRlIybTU0dFBH?=
 =?utf-8?B?akdTZkVGanZTcFdZYmxlMjVZdERwL3lsZGZiQmhDTHJoNGJYTUhHUHZCMDd1?=
 =?utf-8?B?ckQrRGhBSVJaVkdYMHJYVEVnbmVRdUlnVHYxWk5WSzdOV09wSWxjemR4OXph?=
 =?utf-8?B?Z1lBYWFaelc2Tm1JRUpsRzJ6MHZYa2tUSTc3emRMZHVja1N0djZGTVhmWisy?=
 =?utf-8?B?bk1kUDFKL1R0dS9hWmtOYUlDckwyakRxYW1MazV4ZUdHdHlja2w5aitjbUtl?=
 =?utf-8?B?bTBjTGNySjF6K1RSRHR4bEVrT3o4ZldHdkhieTZ1MXdHNTk5V0hqSUNrcWhC?=
 =?utf-8?B?bUxicnppMDViTUFpc0g3Vkp4eW1uNWhTWlA2N3RQMklqRERlY3JZSWZjMVpR?=
 =?utf-8?B?UkZCODlXM3BhZFcyRUw4NWdackpxUjM3M2JwbldrUG1PblNoUW1EOUdhS3ow?=
 =?utf-8?B?ZkFGSUZwc3ltUlEwUXo0TXhEL2x1c0F1aVpBY3IxNm0wQnRtWW1HcDZ5dkps?=
 =?utf-8?B?TytxUU1tZWtxRTVmZ3FweHNtZFJiMU93SHNVMlhRTk16Z2ltbEFvWXpHbHQv?=
 =?utf-8?B?bkZLTDE2TkplcUFhVlE1dHY4Q3RuTmF1RnRqczJwQ1FXRmExNU1mUlc0ZE1x?=
 =?utf-8?B?WGtaaFZIR0FUTk1WalVMWmFnRzVHMk1KNWV5eGhYbXNXNzhQV0srY1NhTlRC?=
 =?utf-8?B?U29FQkVRc3lEdUczR0grU1BUdkZUV29MUElWNWxiM0hrNGR1cWRrUlBXV1l5?=
 =?utf-8?Q?JOAs1wYp6TmqWnMJoW5GAD5cFO4DFzIj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzNKbytQeENjU2xqWXFRZ3VxaHFtYVhSOHVocFNPSnMwTWtVL3JjRW83c2hn?=
 =?utf-8?B?eVQyNkdydHZWNjM0YVJDNUVIQ0IyWWpDMUVKUWdKRzdtVUFQa3krbU5BMVlY?=
 =?utf-8?B?WkxqN09QOWhmaFlWQnNyOCtEdjZ3TmppM3ZkSzhHdUd0RHptaFR2RGY4UXZZ?=
 =?utf-8?B?dUI5RFh3WWlHemZKcnpmNjJDazZadTlhVHcrUExodjF6RGlHalFvZ05PVTk1?=
 =?utf-8?B?bnFma0dtMm0xRFBQZW5Vd1ovU0krUXJjRmhkcm9JQkZSZDQ1UENza2E1REpa?=
 =?utf-8?B?bUFpVzdVZjNSb0dUWHlSamlQTHdXOFRqSjFlQ0dIRlRVSFZhUWhrTXRQbjRW?=
 =?utf-8?B?cTNwam9ZVTZxUkJCRWc4dTdTU3VlZ1JSWUR1Y0ZRTU92Zkp3MW4xdnArdEY2?=
 =?utf-8?B?R3NJLzQrdkNqQWhGcE5QUGs3bHBubENya2phcmdPQ2tQOU5Oa2gxSm0rMkow?=
 =?utf-8?B?d3lqV0tHZnRMS28wdWhBd1hva01mL2lzbGVsaFZaTFMwU3BQTGdmT0hiak1j?=
 =?utf-8?B?eENQaGxKZlRBSHdtNks1SytGalZuZjgyd1dGaDRCeUEwUEV0RzhLU2N0RnU5?=
 =?utf-8?B?SkxaWTNpUjZYRUFRSVFEd2VSbDNWMXdNRCtBRWNaU3lrRjJBNkxrdmpORXhE?=
 =?utf-8?B?N1lMWHdTRFhkd1NkeThoVXgyNTFUa3RlZ0FRSW5teENvajE2Wmk5ampneEtl?=
 =?utf-8?B?UjBwNm9WRlZlU21Xc3NIelBvVU9yN3FmNzRFWndlWDJMaEg1OERpaVJYM3F5?=
 =?utf-8?B?U01SMlU3QVZtOE5OclMyM2prcFExUHd6ZFFmN3Y3aDhqc0hVbE1sQVF6VGFH?=
 =?utf-8?B?TTVYQzluRjlsdTdJRVBubmE5Z2VPR2thbEpkcEtId21qQ1lBR2ZNbFBXbUdw?=
 =?utf-8?B?SDJQZlc0cDZSZ1h4UUpxV3BFdW1oVit0NGNTWHVJMlYxclJIenVrQkZUU2FH?=
 =?utf-8?B?Ujd3YUxBdjF0QUlRdnFRemd6bjRhakNSU3M2VVIxUGxORGIvNUx0RzYzSzVv?=
 =?utf-8?B?L0NYSVNqMXFaaDhuTnFxUEpuUXNhTGRwcVkvaUhaaHJzVHhwK25SSVkwc1FQ?=
 =?utf-8?B?c2Fhdmhuc25IM2xZeVVocmlxbHJnYjRzNG5ZNXMwcmE4NW9WVi9ObW4ydHIy?=
 =?utf-8?B?ZlZZbnA0UFhTM0pjVjVMZkpzT3kwWEZucUt1b01EN3lJVkNIMFhFeDNzTkNz?=
 =?utf-8?B?Ti9TVi81d1JSQkVBMkVwcThxR2plK3pkY3F1bHZZVzBmRDEzZjJ1alFHZmxO?=
 =?utf-8?B?Vy9qTlZWYW84VzdocWcvM3JQZUp5K0lrQ2pKaStwRHN3QlFJTHphNjEyU3BM?=
 =?utf-8?B?YWFMWENwOTNKbEhZRnJPQWg2dVZNVUgzMjFqQU4vbjlnb2dVR2hMYlV3TEJR?=
 =?utf-8?B?NGxncUdvMzFFVE5halJqN0JjanR1N1gyalgxTStYSndvdkNYSmt3Wm1WMldZ?=
 =?utf-8?B?b0lRaHd2cUswZWN3aFNtVWFsdUYzbHZhUzgvNFZEUkFLT2VHeVg0Q1FEZjhy?=
 =?utf-8?B?RHJtcGxscUJuUFhFeWVXWXhoRFNZQUJUSENmTTk2dFQ4R3M3aDUxeHdXK2Nw?=
 =?utf-8?B?QXNITUhCbEJSclY1SWF3SXJPVXFTYmRScS9pQzc1azBESms1Ti85Y25DNDhq?=
 =?utf-8?B?bkZ4ZHRSa01qeFBIMUtyZFdmUzZ2bG1mZzF6RmVjWEM2ZmJiTnRjQTdtK0hn?=
 =?utf-8?B?Ukc1UklhS3g1UjU4bGNoc09sUWx2b0laZWdaNGc1dEtEcHpSRERoYzJxRlVv?=
 =?utf-8?B?bGZ2ZnRBLzZyWDYvS3ZJWGpnbFhzYno1T2FYajlyc2tLeTBsb25lMHVDSTlE?=
 =?utf-8?B?U2dZdVRBZ2RySkZFaGxmVzAvZjE3NXBoZ05wYTQ5NGF5RWlHbVA3Y0lLV3hl?=
 =?utf-8?B?S0R0ZVRoVVhvOUVmeFlISC9pdFZ1QWZlaDJtK0RnbXV1clZERmVOQzVhWUcv?=
 =?utf-8?B?elJSaVlycG11bENFRWI2aGlLTThPSnRVa25wRXdtb0F4WTNBbGZ4WlhxVWRU?=
 =?utf-8?B?QWJNZzljUmhPNC9hcG1DdEZJOWc1ZWRadmJzdVd5V0JVUjA3UUN2VXJ6Z2dx?=
 =?utf-8?B?SmFXSmc1REdFNUdtUWE5d1RlTVFOZEt5bHBYemxzcTdEQ0JVVWJGMzY1UUxI?=
 =?utf-8?B?c2txK2x0dTlIYTN5RG8rbUYycGNneEYxQjZENFFJZmxZcXBkZkZiTU9leFYx?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdc5b2f-657e-4194-7c47-08de0c1c20fd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:53:28.7582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSZn9Vy/O9/6J636jmtAj1qewi+5GYjxcGLQ3kbhsZZMSZ+nNzPZ/z65fjizRaB4bcwqQnoGpOaHCRrUUIW81e9q78fu1MLFlyBXsn3GKLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE60A892D7
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



On 10/14/2025 11:20 PM, Maarten Lankhorst wrote:
> Do not directly dereference xe_ggtt_node, and add
> a member to store the GGTT size.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c       | 15 ++++++++-------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h |  8 ++++++--
>  2 files changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 2289756761636..c0dfffd5c553b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -264,7 +264,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
>  	if (!xe_ggtt_node_allocated(node))
>  		return 0;
>  
> -	return encode_ggtt(cfg, node->base.start, node->base.size, details);
> +	return encode_ggtt(cfg, xe_ggtt_node_addr(node), config->ggtt_size, details);
>  }
>  
>  /* Return: number of configuration dwords written */
> @@ -495,13 +495,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	xe_ggtt_assign(node, vfid);
>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
> -				vfid, node->base.start, node->base.start + node->base.size - 1);
> +				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
>  
> -	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
> +	err = pf_distribute_config_ggtt(gt->tile, vfid, xe_ggtt_node_addr(node), size);
>  	if (unlikely(err))
>  		goto err;
>  
>  	config->ggtt_region = node;
> +	config->ggtt_size = size;
>  	return 0;
>  err:
>  	pf_release_ggtt(tile, node);
> @@ -514,7 +515,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>  	struct xe_ggtt_node *node = config->ggtt_region;
>  
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> -	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
> +	return xe_ggtt_node_allocated(node) ? config->ggtt_size : 0;
>  }
>  
>  /**
> @@ -2516,11 +2517,11 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
>  		if (!xe_ggtt_node_allocated(config->ggtt_region))
>  			continue;
>  
> -		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
> +		string_get_size(config->ggtt_size, 1, STRING_UNITS_2,
>  				buf, sizeof(buf));
>  		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
> -			   n, config->ggtt_region->base.start,
> -			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
> +			   n, xe_ggtt_node_addr(config->ggtt_region),
> +			   xe_ggtt_node_addr(config->ggtt_region) + config->ggtt_size - 1,
>  			   buf);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> index 686c7b3b6d7a5..9a8e66c8b539f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> @@ -17,10 +17,14 @@ struct xe_bo;
>   * Used by the PF driver to maintain per-VF provisioning data.
>   */
>  struct xe_gt_sriov_config {
> -	/** @ggtt_region: GGTT region assigned to the VF. */
> -	struct xe_ggtt_node *ggtt_region;
>  	/** @lmem_obj: LMEM allocation for use by the VF. */
>  	struct xe_bo *lmem_obj;
> +
> +	/** @ggtt_region: GGTT region assigned to the VF. */
> +	struct xe_ggtt_node *ggtt_region;
> +	/** @ggtt_size: Size of GGTT region */
> +	u64 ggtt_size;

can't we just add another helper on GGTT side to get the size of the node?

	u64 xe_ggtt_node_size(node);

there is one for xe_bo, why can't we have another for xe_ggtt_node ?
> +
>  	/** @num_ctxs: number of GuC contexts IDs.  */
>  	u16 num_ctxs;
>  	/** @begin_ctx: start index of GuC context ID range. */

