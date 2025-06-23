Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048E7C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 16:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78710E2C0;
	Mon, 23 Jun 2025 16:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QllJq1/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0957C10E42D
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750695584; x=1782231584;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=amWtY/MK5RDSoSTCyQgYrYVoOBrqQuTc0/DfQ7+2LcM=;
 b=QllJq1/UAGaykUPQF1Gn6BXpr3up21xw3IYY7J1XA0d5lkQX0SjsDovr
 w3v0n5NAv3PeJOJaqBVC/TGh2OgZfc+xwoC36DokmC0vqRnW7UFjD7HAe
 IU632QwrjP6S5k1NHWohNIGZpbmu41jWarvlEUQpbmEIcbSfn+T2sGKiC
 es1m8bddFiWY3olG4KsNVedT9vq0RIVcCk5L6SOODgd0uXOu4gUaa3m/Q
 BemNr/RjjVfHdYxuaChCQoxIxfFG1MAoNbZfED55vQ9au/+eB4wg6nDoI
 Oon8i3c+Pt5VP8xpQC8NuOo7wpE0XpWnPu4BqGQT339rUn1aT7eh2JXbb w==;
X-CSE-ConnectionGUID: GOKMSNAdTnO0Ci6oPWIXRw==
X-CSE-MsgGUID: mbCzZlRZTbObLzqHxYsHNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="75446816"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="75446816"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:19:44 -0700
X-CSE-ConnectionGUID: 0fpYbqHUQC6xcwGvSznlOA==
X-CSE-MsgGUID: St/51F3HQFS6rDIE/2WAvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="151229089"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:19:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:19:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:19:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:19:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7/5pPi8tvncyfAN4mi4c2+fxgT60yWDyCVJUwtDuw3Yua3kML3vG8v23CWe2Mc6cLCUZalO+vnNHR8t5f7Z5aM9qK6ffz6Od3ddVD6HFjUtnrdy8qCx1z0z7Z6yOXOJmz0RPiRPzzsqRTN+IGw43ygKT8vJyEqnpGuU/gjNdAmvqrZdnLB+/z5weI685jJtFqw+Jjji/vz9WH76GHNjt6aCD93iAgwfHkFtbfeulDI59WKZfQPOM3gup+sV4K0Rq7VwzrMuG89YmNIrzi7HglLhUIe/xmm2P+vQPmzo7KDdx92v6ZoPwE40PoiwNMv+jaFmtLErBfX3VvfpwQN0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeCdYpQbN1FbfrwocT2KnSW+uF0VEPElKCiOv2QEtbA=;
 b=m6krYbexRbWb/gGoq3tCVdeVOR1l4T+lo7MTzrqHb96MnkOa2ZoHn8ZaxzjyFjePoQnjqIJMDiTG2t0QdfbGUc9WIcA0MhgkwfJRabUNaQXuZKM0A6I4gg9jPj5FYQg7hwnn1ZOejJXiNYMYBuvB0Z7uyBk/DWzHX1FEFtqndacqQOjWQRSXJGMdbWORGNwJ1M3mxCasOVt+wCXx4zoSHWo6BZnOHd8rI87hWIRdIxXZbaLR/aMehPjbqaHji+bsqlKxRpaj24oEZWCyRannesPIbgfhAY7ovpSCXYmPHgwxwVrupY/ajQ2XTQ6GBRD9IqTV7YZQv2z5n34mrXkglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 16:19:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 16:19:24 +0000
Date: Mon, 23 Jun 2025 09:21:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 05/20] drm/xe/vma: Modify new_vma to accept struct
 xe_vma_mem_attr as parameter
Message-ID: <aFl+7wLHrocJ8tZV@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-6-himal.prasad.ghimiray@intel.com>
 <aFjaRqbVpAAtoSVd@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFjaRqbVpAAtoSVd@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW2PR16CA0068.namprd16.prod.outlook.com
 (2603:10b6:907:1::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: f481b6f0-ab77-4763-ff45-08ddb271b7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnNUZGpKbmxvTVl3ay9nQVZIVWZoZy93SHBhZTQvd1NBZjM4NEgyWkhVYndZ?=
 =?utf-8?B?bkJoajN3NmVVakQ5NlU0U3pGTXZWT1MvMW5NaUhPNkhHd0M2K2NlcG5MSmRs?=
 =?utf-8?B?YlNEZllZeUZleFAwdjhTMEx6OUxEWktLSkhrTlJ6WmVLWk1UVDk2YUJaRDRC?=
 =?utf-8?B?bXEyeEFDT2dQd1dEc1lDMUdvdXNMUzlJTkpVL2lycmgrU2tzZlhsa3V1Smk1?=
 =?utf-8?B?OTVvZEwwZCs4KzBwS3YvaFlhT1A4eFNiNnBUN1BYY2pjdWRUU2JOaTFPNCtU?=
 =?utf-8?B?eEFVYXR4M2dVOWFGYTYzcklkRVFnTGxJWkdEQ0RsTGZSclNxRnhFRnc2OGwz?=
 =?utf-8?B?SFRrdlRVTkNibzhvSVhUelJnakkySnJFSXVycG93WE55RFA0bGowMFczc0Rj?=
 =?utf-8?B?QWY1aVM2c1JqUmYyRm4xY1lWY1k4cFFOOVRNUVFWUDc1RCs4d2NJY04wNHNF?=
 =?utf-8?B?QVNkSWZ0RVdBYzVOeG12cGp4c2wvVzVnVDN3cVB1ZWxqSnhwOXhuL3d5MzdB?=
 =?utf-8?B?T2Ywd2dFSGFUOHRaSU9BcjB2NUVIcldtMUdCaFBhcjlTUGt5RkJjTDdRbGxS?=
 =?utf-8?B?Z1VnMzFNN283Z1F4b054YTY3SHY1Sk1YYWIxU2tISjRmQnFWd3JVWU00dmpN?=
 =?utf-8?B?VWJ5bmtUQ080SjRjSnpNZTB1WXExRVhQaTJZTlZJZW9pSEV1TTJRYXhjdllX?=
 =?utf-8?B?RE8ybEpNT1MxeExldHd2Vktsa0FwYXNQbTUySm1uTEQ2azBuMWp0Mi9yNXhl?=
 =?utf-8?B?RFhVYXJWanN3bWlQTkRJWXgxOXRGYjRWUVBZSmNLbnFFdDB2MUs4dGhVMXQw?=
 =?utf-8?B?Qk92bXFOR2l2b1lLOUVyMGdic01yUHB2Ukdzazk1NVRUenVDTzVRSTRDU2x1?=
 =?utf-8?B?dlA2OFFLY2cvWDVheVZ2dHVhTzcxMFRkVGRuRzlmOXFvOUVqY3c3SVQ4b2VR?=
 =?utf-8?B?YVFWU0pJa1B2cGpLbWxBTEdXd1h3aVFmemQwVDZEZDI3Si91eGFJMU12WDM1?=
 =?utf-8?B?MWdWdnl5b0hxUCtkZXg3eWczTDMrbEJVR2RSL1hsUEJCeEJ1YXpKNzZkQmRS?=
 =?utf-8?B?cElnUExSVkFGbllBSlFqdVlFL0ZHYkVtK05VbHR6WUJHQmFqMGpQMWR1V3NP?=
 =?utf-8?B?dFRlMzlpalhJVEpXbXo3Tzc2OWEvM040TTRKdGYyUDF1ZURYbkVUSXV2V2dG?=
 =?utf-8?B?TGNXbkQ3QkEzOHhnQmRYNytoL1VmSTFjOXlqSDE2dlhFczlHQmxoUm5TUmE2?=
 =?utf-8?B?V0txY052cXhkZVkrZGpLb3dadkVBWXdMVktFUHB4ZUU1bFNmSWZwOW0wTXMx?=
 =?utf-8?B?L2tqYnBoN2VLNXE0VHJMRXJmUlNHb0RYSjl3YmFQVE9NQWFKUUdTekhUQ2pW?=
 =?utf-8?B?bGdoUHJLMGVYUHNhWlVoSlVtSDB6RWdiSW9PTlAvNmRYMkhXR1JET3hQSDFK?=
 =?utf-8?B?TDRieXl5Z29kakNFL2hyUUR4V0hlOG05OVVyeFVyc2NEM1hMc3ExVitzclM3?=
 =?utf-8?B?aUQ0T3RhdENZV1YwV0VkbTJJdkR6MVBybnBPSVVHY0RuWlpYOEVtekhDWlZM?=
 =?utf-8?B?L2FGQTJtYk94dEpLQVNHQ2hFeEN3aUplOVpkN0NUVnNCZmhKaS9DTDlVVGlr?=
 =?utf-8?B?MzNEaTZDdWZQdTBBZklheXMvcWRyK3ljTklNamVvWFBVYlZSTjR5TjBSQmIw?=
 =?utf-8?B?Z1RqNE9OM2dNVjRoMXdPTHVYaVpUamtpUFg3dVp6eHlTNmZwWGgyOStBRDl4?=
 =?utf-8?B?NnRnRGdLalBMQVlwVlp0dGV1dGZMd3R6T2VnWU9qZTdhWkFIK01PbEo0YjYx?=
 =?utf-8?B?Y1hQN3o4eWN5cFQxcDVmNysxVlUwV011VEwxM3p0eng0Wi9zRGx2TVhDOHpN?=
 =?utf-8?B?VHRKWTRyUUNCc08wNlNOZW81bkZFaUR1M0VRa2U0blJlTkpoaFV1em80anZN?=
 =?utf-8?Q?YwB1/pA5ps8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEx2dEoyRWxpdVdybmF6eUNPamJ4dXp6azA0NzdzUW5XYU5mQW5GbzVONGNC?=
 =?utf-8?B?QjRqbVREeDhyQ0d2MUJ3V2dVMkhKTDh5VDRpSmpJNlRkRS9XV21zSnk4TVUz?=
 =?utf-8?B?bkNJS1paYTFTeTBUamE3VHBSdkdQT0J4S00zL1lMTVRGTFlTaGpFbkovQ1Zz?=
 =?utf-8?B?RVdpZkZ0NjVHeVAwclJwT3ZUODY0YjVpVm5LVzhJMWtUejdLd1JreFgvajRQ?=
 =?utf-8?B?NGNOSUtJVVBnVkNsYXdzZUg0L3FYVHYrdlVGQ2Jkc3dFam5CbGhDUnZRZmRo?=
 =?utf-8?B?eEdqUUFvRUlWU25PeW9lWTlJTWdUSzk1S2NVVXNwbkZiRGZELzBBUlFFZUor?=
 =?utf-8?B?WStaSFhFL1RZY1lWc3BlYXZ4UXhNSi8zMmtJbzRya0c3eFh2ak9xSXBLZG5j?=
 =?utf-8?B?THN4YkxnQmx2c0p4eUF1R1M2OWpWSkF5MWtDRTRTL3Irc29yTS9xZ0pjeHJI?=
 =?utf-8?B?NkkvWnNvUjkvVmdlUUZvRkFZWk9ZM0tqeVNRTC9qN3JKQ25KR0RhemFjUHBt?=
 =?utf-8?B?NFY2bUxHc3VpN0F5enlEU0xpM01FOTh4d011bTNESjlVaFlqTlNHRU9kc2R6?=
 =?utf-8?B?TGg0bm1TNkxyVUUzeDhoUzlGSmNyL01IYkdWdzNtcGVRWmhUT1NOSkN6eisw?=
 =?utf-8?B?YzQyL2lVMEZ5cmFlMHE1aTQzeGthbHlhQVBBWnJiOXhiemw5RkNsMDJFRnYx?=
 =?utf-8?B?aEZHN2xqS0UyazV1YzErQnRycVBVN00vVGtmQUoyR3FFZUhhQmd5NXNISlpu?=
 =?utf-8?B?aUduaVVMeEdMUi9pZ3ZXWjU0djBlM3dNczZiSURtT3RZQUtIdWt3VzY2WHNY?=
 =?utf-8?B?UFpjaENqMll0aUtsWEVCaHljdGVZUWJ4UXkxOFFXNml6eHB4MnRDZUJodjJO?=
 =?utf-8?B?Nmt0dVZ6R2pSSmtEMW1ydmsybEtTL0E3M2JWckhtanoxWEdoNis0N1NlV2pu?=
 =?utf-8?B?L0NiRVkzRDluMVBYK0IyT2RFNjhibVdTZGtEaFJlNGZtc0drbUp3Tm9FNWVp?=
 =?utf-8?B?Sy93MzlZR3FQM3g5a3hQcVBYalMzY2YxbGJMaUw4NXYvWTAzRXV4K1NOTlls?=
 =?utf-8?B?ZGZSK1ZkL25RL0tCdUVwdTM2R2w0SUtKR0s0dnFhUTJldStNMjFRbmhiMWpt?=
 =?utf-8?B?T1JYWkpEWXlJNVdOTGZHRlJna1pDYU5ERFVmNGg0WUhDaHFZVWx2NGc0N1Fi?=
 =?utf-8?B?VDJUZFZjNXFSbHJkbC9QZmFudzZZQ2tTeUgxSWUzSU5jWXlub3FXQnBxOEJH?=
 =?utf-8?B?U3NmTHhwNTM0a2MxdTRxT0ZSS0ZoUW94YVpiY0VLeGx4NmIzRTdDSGpFUVht?=
 =?utf-8?B?UWJZdWJLSHVjNE1TUERBWGxRQ3lWL21NeWlQSitMWE9tRHJGcXRpTXBORHdo?=
 =?utf-8?B?ZlRsdlBoWjJaK0QwOTA4YXVCVkJmMHdCZ2pmMXdWY1pEOGNTK3I1RkYvRlNh?=
 =?utf-8?B?RFN4dWEyOC8xZEthTko2RGtmaEZqdWVvb2xpWmdyc2NBS0ZiMkF0RmVWeStV?=
 =?utf-8?B?ZE5RaEJZbkJpYnFnT28zc2FxWEFPYnpUOFF2U3Z4RXJpa3BsaFlQRWYvQnF4?=
 =?utf-8?B?SDAyOWZDdEkva0NaR3FFSkwzN2pGRDVyMnp0K1k3a014U3VnTm5HNkVLY0pI?=
 =?utf-8?B?Ky9LeStSVnR1anlZUkphSFlUODJkMnlBV1gyckNMWFNJV2oyWWs1MTYzWDVP?=
 =?utf-8?B?MUN5bmp1MkdrSXAzZDJueVRySkFuZGE3TTcwbG1ZejdWcDU0NitBWU5DTGN5?=
 =?utf-8?B?N0FTcGRIWHFIdTIyaTg4OERLck5oaTJ5WjkxdTkwN3A3Q0RzaFVWUDVSTzFM?=
 =?utf-8?B?d3VDS0pqNG0wYUVJOU5SU1FuTXhLTFNZaVh6VFN2dDBPNTB6bURTL25YSUNh?=
 =?utf-8?B?cXdsTVFEQWVFTXM3ZS9lZHRIWWhXS3Z5Q3V1Y0FUU3hZSXFRSFV0d1ZqYmFl?=
 =?utf-8?B?bXlYNXE3WjR1ZENLbjVLNGo5VkxxYTl6NzNLM3lDTkgwcUF1Z3lwd2lMUmhC?=
 =?utf-8?B?ajRMU05IVzVqRHgxbjRJTEhRcXpBbExpUkt1anQ3TVNrK2JRbHJaOVZsZ0ZL?=
 =?utf-8?B?V2p1T0ZvbkRzSjhNS2ZSZmJlMWJWZnNoazQvbzdsSys3RS9HakFScVg2dEow?=
 =?utf-8?B?TEN0clN2OE8yT3h3akY5bWwzMmU3bW5MM2JnbWE0VDVHamx5OENYRkYvN09Y?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f481b6f0-ab77-4763-ff45-08ddb271b7f4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:19:24.4899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nms1AktWflGD5MyO2WZF59BFCja32Egg7oh8G6IejTbvvKY1NDS3wGU+2Y7/USEqdfiD3/o3vemQ0zrbv3koPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
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

On Sun, Jun 22, 2025 at 09:38:30PM -0700, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:43PM +0530, Himal Prasad Ghimiray wrote:
> > This change simplifies the logic by ensuring that remapped previous or
> > next VMAs are created with the same memory attributes as the original VMA.
> > By passing struct xe_vma_mem_attr as a parameter, we maintain consistency
> > in memory attributes.
> > 
> > -v2
> >  *dst = *src (Matthew Brost)
> > 
> > -v3 (Matthew Brost)
> >  Drop unnecessary helper
> >  pass attr ptr as input to new_vma and vma_create
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 24 +++++++++++++++++-------
> >  1 file changed, 17 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 9b705526a3e3..4849d4cc806a 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1168,7 +1168,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  				    struct xe_bo *bo,
> >  				    u64 bo_offset_or_userptr,
> >  				    u64 start, u64 end,
> > -				    u16 pat_index, unsigned int flags)
> > +				    struct xe_vma_mem_attr *attr,
> > +				    unsigned int flags)
> >  {
> >  	struct xe_vma *vma;
> >  	struct xe_tile *tile;
> > @@ -1223,7 +1224,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
> >  	if (vm->xe->info.has_atomic_enable_pte_bit)
> >  		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
> >  
> > -	vma->attr.pat_index = pat_index;
> > +	vma->attr = *attr;
> >  
> >  	if (bo) {
> >  		struct drm_gpuvm_bo *vm_bo;
> > @@ -2444,7 +2445,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
> >  
> >  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> > -			      u16 pat_index, unsigned int flags)
> > +			      struct xe_vma_mem_attr *attr, unsigned int flags)
> >  {
> >  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> >  	struct drm_exec exec;
> > @@ -2473,7 +2474,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> >  	}
> >  	vma = xe_vma_create(vm, bo, op->gem.offset,
> >  			    op->va.addr, op->va.addr +
> > -			    op->va.range - 1, pat_index, flags);
> > +			    op->va.range - 1, attr, flags);
> >  	if (IS_ERR(vma))
> >  		goto err_unlock;
> >  
> > @@ -2616,6 +2617,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> >  		switch (op->base.op) {
> >  		case DRM_GPUVA_OP_MAP:
> >  		{
> > +			struct xe_vma_mem_attr default_attr = {
> > +				.preferred_loc = {
> > +					.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
> > +					.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
> > +				},
> > +				.atomic_access = DRM_XE_VMA_ATOMIC_UNDEFINED,
> 
> We need to double-check with the UMD team here — there are ongoing discussions
> in our internal repo where we might need to set the default behavior for BOs to
> enable global/CPU atomics on BOs with SRAM/VRAM placements. If that is the case,
> then if this is a faulting VM, I believe the default should be
> DRM_XE_VMA_ATOMIC_GLOBAL. See VLK-66541.
> 
> This would be behavior change too, so perhaps the maintainers can comment if
> this is allowed or if we need add a query indicating the behavior change.
> 
> Let’s close on this before I put an RB here. Everything else LGTM.
> 

We resolved this question after some internal discussion. Patch is good as is.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Matt
> 
> > +				.pat_index = op->map.pat_index,
> > +			};
> > +
> >  			flags |= op->map.read_only ?
> >  				VMA_CREATE_FLAG_READ_ONLY : 0;
> >  			flags |= op->map.is_null ?
> > @@ -2625,7 +2635,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> >  			flags |= op->map.is_cpu_addr_mirror ?
> >  				VMA_CREATE_FLAG_IS_SYSTEM_ALLOCATOR : 0;
> >  
> > -			vma = new_vma(vm, &op->base.map, op->map.pat_index,
> > +			vma = new_vma(vm, &op->base.map, &default_attr,
> >  				      flags);
> >  			if (IS_ERR(vma))
> >  				return PTR_ERR(vma);
> > @@ -2673,7 +2683,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> >  
> >  			if (op->base.remap.prev) {
> >  				vma = new_vma(vm, op->base.remap.prev,
> > -					      old->attr.pat_index, flags);
> > +					      &old->attr, flags);
> >  				if (IS_ERR(vma))
> >  					return PTR_ERR(vma);
> >  
> > @@ -2703,7 +2713,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> >  
> >  			if (op->base.remap.next) {
> >  				vma = new_vma(vm, op->base.remap.next,
> > -					      old->attr.pat_index, flags);
> > +					      &old->attr, flags);
> >  				if (IS_ERR(vma))
> >  					return PTR_ERR(vma);
> >  
> > -- 
> > 2.34.1
> > 
