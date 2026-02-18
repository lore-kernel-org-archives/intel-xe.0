Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1988E9A047
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 02:35:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815B310E129;
	Wed, 18 Feb 2026 02:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWqq1Kg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A7010E129
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 02:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771382122; x=1802918122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uwRbIDo1Jd3cmqzYhKQuJyS0R9WnaaBpubGZvCFGmVQ=;
 b=WWqq1Kg6utnAYIvuKf4G7QljRrwz6EjlipXP4y6xilQC4ISy5Zg/HrrJ
 va/Tq7Gqzco0nB1y3qBqqLotVf6sSWmYcfAJmT5V2e4Ty1lKXJUlBGANQ
 q69ytvkdvtI1xrRcKmnp3I0TDh8AeTJ5btvmvHcuJCXISM9SUhRoVKlpL
 vjjPiBtBdhXswRg/5Q6F3WIWo8KBOlCS1jCxyfjZBCg3npzQfN2Evmo6M
 8tXDHUKdefvFqtjms05Bh+0KqiY3+ZZtaqRE1Ie5Yml/ov+UX8Hdhkd+L
 WqIzmjeZvw5l2bRU6tUi9rPTC/JnNLcumpLSiLsx4bOaqA7o1E7itONso Q==;
X-CSE-ConnectionGUID: tnHj3B6mSCK4K+3Ns5kqJQ==
X-CSE-MsgGUID: KNYQXyNATHaUJgQ+GveoQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="97923069"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="97923069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 18:35:21 -0800
X-CSE-ConnectionGUID: MviWDQpYSICsYfrUmZiRzw==
X-CSE-MsgGUID: JtPsgcdGRbegziboYi4v6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="214069249"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 18:35:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 18:35:21 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 18:35:21 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 18:35:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YihXX6qsHPbpeWKgYZ9ZiH4/tHcO/KFt+U+FqVgHGxoKkTr/xDzPqlPqAFa2CrorXykxSbnXfOHQEAXVDOmyvf1zrVPsh0NR0E25OYb1ao7A7RjXnOPoyUBD4lfg8GDi14keZv0PmcbvVja5xflstYNVSQWYBUattrT5+jnQ78ujhFmXnBTbvtYFa0Kqy/Lw8Apx1/FVaUfNVv7+qOsT1w+SATwk7BZ6Ed3TSPcoygGUSGcXVprvPntT7s68HpdZfY6mzm7uRsCEsXXn/IcIumDpTvoIz/XyhgjgZUekOh4Z+Rd/VL5DIFoiAV9JhbrpEaRBdGGAfZgmx6b6eLr/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1hlnc1Rl0K9MJqYsA7qpiKKiqWBGR1rjekOAki9TA4=;
 b=Dfb6bXiaktt1SSe8vTLLRvrHjRiFXsq5oRBta9TmkxaCTLvQjEgvUFGyQJ5yBu37fcM14ZZct8KBchNff8owlXJfzXQ1BcMMZplkjGO9EcCz1JyS6mVFa28APRmZJljCXYLx2/Acu4Envi6x5RF2ZgnNVIgaqEJaThtOT5DQjxCVt5JLLQwiNISr1rfepGWnjnaKbWUpfg0ghSZxHP0Ig9pCUGrNw/cywIFhFtPxKkl4BraU+Xo4gt9mfuJLzT3antB1MH+p2Xs2u4Vv2WjAU3fcha02XwhTjRdSdlpqLn6I0PQOFlSfgZVUFXM3inH30DH9xB4eBYXsb+MzMpAnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS7PR11MB9476.namprd11.prod.outlook.com (2603:10b6:8:266::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 02:35:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 02:35:18 +0000
Date: Tue, 17 Feb 2026 18:35:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Remove H2G reads in CT send path in
 non-debug builds
Message-ID: <aZUlY866PShQPdLg@lstrano-desk.jf.intel.com>
References: <20260213211625.3117729-1-matthew.brost@intel.com>
 <20260213211625.3117729-3-matthew.brost@intel.com>
 <aZMS7Qg5AvFRE_Zb@fdugast-desk>
 <aZNWg8PTJ7vYl6oK@lstrano-desk.jf.intel.com>
 <aZROunEO_59GOECh@fdugast-desk>
 <4920f526ed76e3e80cbb4bea3ae5523252221fa8.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4920f526ed76e3e80cbb4bea3ae5523252221fa8.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0150.namprd03.prod.outlook.com
 (2603:10b6:303:8c::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS7PR11MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: c03b4923-87e9-4b7d-4458-08de6e965ac8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azh3alRpOWZJVCtKenE2akN6VFVwNjVCOVQ1ZU0rb0F0Y3M0WGhTNnBGYnVK?=
 =?utf-8?B?blhMQmV6UC9OL0FFaVErUFpKYk5RZDE4akdxNGlMbGM0UFBNL3FpV2taQVd4?=
 =?utf-8?B?MEM5eDJzRE9mU1c5dnpEdm9oWWVHUUM3d1BhSDVUaDQ1WDV2ZzYvdkQ4RUpj?=
 =?utf-8?B?ZmFwQ1psaHhQM0lXN2RzMGZEZ2RKdmxsQnlJME1QRktGU1daUm9leXl2QWpw?=
 =?utf-8?B?Y2kvRnFxUFBraEhoYVlObzJlaW9KNDg1bUQ4amlaKzRHa3VoZjFFWFZYL0lU?=
 =?utf-8?B?UmFqUTRNSExwek1OS3VhQlFkYlN4WmZtNjVxOEZCdHRQejVCcnU2dnVPazli?=
 =?utf-8?B?UkVoaWV2SDNOZTJySXh0WFJZb0ZuUjBvUmVkaGdqWDlibXdGRGk4d0FSR2RI?=
 =?utf-8?B?aTZhSVdHSTJNMllTWVJ6KzFxek9FcUlVZDNXa1piOTZhZTZSSGxVR0pESE5L?=
 =?utf-8?B?N2x6REN1Q3A5QXczOUoxSHBsWVE1aUFvMGQ4Qi9zSmk5b2FoVGNzQkNSR051?=
 =?utf-8?B?UEJQd0pUc0tjRHY0b252QzFTRURXZ3MvRFF0QkZYSTE5d212QmFaUzB1REd5?=
 =?utf-8?B?Q2h4aE1EdE5wQ1I4L1FqcmtlZlpSMFh0eXgyYVVaeGxIengwVnpHUHc0SmFx?=
 =?utf-8?B?YVp5dGxKZnNveGY1ekhjMnd0aDh0SzRlR0JFZGl2anZlTy84YmJBQ3ZmSUx6?=
 =?utf-8?B?V3NTM0VPMThwaUVlb2RGWVlteWhrTzNTakJxdXJHYVdFNWhVYWdtN2l2dVhh?=
 =?utf-8?B?RjVaN05IU2hNNmdqOUdJWUFVL0Fqb3F0R0RNYWlmY2RlOFJGOEFsRVR1ajI0?=
 =?utf-8?B?dkgwM2gzSUhIVzN1MUFBRmxIN0VRYmZmQUwrK2FRWkVSRmEzZmYxZjR2WUpw?=
 =?utf-8?B?d1pvYjVlUHNiQWU4ODM5MmZZTzhSNjBnM0JOc09EbVM5eG10V09Vc0x5dGRU?=
 =?utf-8?B?TVpJcFhvQ1QzYnJTcldldHdsOTUrVWNVVmVZcUU4cnJVS1JxOG9rdmpsUWU3?=
 =?utf-8?B?T2djZDI4b3p6Z2lJSko1WTRHT2ZJditYRmE2bmd1bnhTZzU4cmhldDkybzBy?=
 =?utf-8?B?NmxvazlFR2kvbmpMaHJNdHRHeTM0amR4SE1OWXFzUjhlUWNBVGZSL3JqU0RX?=
 =?utf-8?B?RWY0elZ4QmFlOW1mOVl3OTR1N0ZlbG9qTFdpRWJTZXdqa1NqTHAwL3JTRjZH?=
 =?utf-8?B?aXR4M1dYZms5ckNiazVhaXVXZTlRRDlteXlzU1Fsd3pzZGtHVllVeTlCMTNx?=
 =?utf-8?B?S216Y010Rk94R1VybGxWY2h2VC85bTB3NG12bldqZDNZT0tEZVpLU3ExZ1h2?=
 =?utf-8?B?T2p3MlRDOUdLeW5kblhLNHFtRmlwVSthazJoTk5IUmMxUWl3SzBxcUpXdHhB?=
 =?utf-8?B?cmFJcWFtRzBPUVhKQmtlaU5vZU5aNksyVDJCVjJvcDRQM0o4SGs4MXh0WUxz?=
 =?utf-8?B?R3owdnAxRnhsYnJZZ0lDZ3NJUS8xUTAzZndVM1g1Yjhpa0tzcmlSdG9OL2tP?=
 =?utf-8?B?WEFIQ2hLU2JSTENmcDZBS2xaZmhnN3ljMkNvVzlDd1lzeldkc0phMFh2N3Yv?=
 =?utf-8?B?TXF2YkR0eWRyVUoyc25YL1Z0ZjM2NnlVZ1ZjVjd6bjRFVVJpNkVOVjBNNmVV?=
 =?utf-8?B?bnZUOU9OTHQ5MkV3WDAxV3hXTG9OOHhubWNVNFg0MjZvenlaUjFDRzY3NVM5?=
 =?utf-8?B?aDgrdnVvWUpCRE1YcWF6YjhRNUNVVElLVlZob2FTZmtlajZiZlpVREo4Yks3?=
 =?utf-8?B?UjB3amd0NVdKa0twSk9pczZzbTJxZDhiSW9PWDBybkJ6Y1NWY2pXWVJLZ09Q?=
 =?utf-8?B?eTE0OXRDOEpGZ3prT2l4cmFFbFRoTWhFb1hwa2tHeUZsYWJRMmRzWHpWMXpp?=
 =?utf-8?B?ZkxJSUlja2FVeDkwSEFYNkdTRkVYblVnRGpCeWlTQ3dHeU5OdU5vMTFmL0J6?=
 =?utf-8?B?dG9oeHVCS29WcUF1TTRYdnhkSSsyWTRNTHJ3R1hkRzBQS0VsNEZ5blc2ZDZl?=
 =?utf-8?B?S05iMzdxNkZKZTdyUitUZmVZZy9PYXp2UDkxVEt5YnFjUGU4ZjhCaWE2Nk5a?=
 =?utf-8?B?cVJHVExUWHRHSkFLQXNqVDFqa3pXSCtZTTJNRVY5ajE2VTUxdGVkWHJVa09u?=
 =?utf-8?Q?XZsc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtjZGQwZFREcDU3Zk9BMFVtbldNc3QvTStZaWRrZ0tVL28rNlU3dXo3eXZz?=
 =?utf-8?B?aTAyM3MvRS9QaDd3VlU3T2pWZk41MHhGS3QrSXU3Znk4NDhoTHp3NXlsT2h6?=
 =?utf-8?B?SlFRMmZ4cGZhSjhMM3NKaTZJaXhsYkhQaVYzS25BTWhSMFlNWDIwTDJYMDV0?=
 =?utf-8?B?b3V4NlRacU9kbzI3VWxxTmxWY1QyNWN5Nmdsa2RRWTNodEtPckpHR1ZiOW85?=
 =?utf-8?B?L1VLVXJkeUkwT2NmQUVDNGU3dnZ2MGJrTmhUTThFaUNmTUNZaGdKcjlmU2Mw?=
 =?utf-8?B?Sk1IVWdVamllNlQrSjgySUI1ZHNUdnhQcWFLUHl5aTdxeEEycVBDcXRIOTFv?=
 =?utf-8?B?Rm9VcXBmL2hGR2wwZk1tSnpHUngzcGR5WXZsdVlmMklIOS8vWElGTnNVM3RP?=
 =?utf-8?B?ajdjVmFJdHhadThLczJKSmthMWdITiszVEloLzg5K1NpUHEzbXlJbGdxcHJ3?=
 =?utf-8?B?eFF0MnhnV1ZLeWNPMG8rUHBGcVN5alZqUXQ0cURvb2t0MS9YT0RuUlRPTVF6?=
 =?utf-8?B?T3pWVUxDdVFld1E4bVRYcmtwUmZTeXl1TFFydSt6ak42cTB0eDFtdzl2ZXFD?=
 =?utf-8?B?MVUyblVnSXRldjVxdjZKSG9WbEgwSkdZc2tsTFRMUjlNSk4wYXhlSE1OelRL?=
 =?utf-8?B?VXJxR0JORWJrL0RFTm40cXhrWnRBbzQ2VkxKMDJJZkdwZVBiS1ZGWHdJcmpq?=
 =?utf-8?B?N0dDeXJicW1TTXFRT3JzWHZpNDJlK2VuU0RVMVowNUtBUUlITWJLdnFlc3dI?=
 =?utf-8?B?SzBxOXRxbm45VHVxN080YjBKU0ZRZkRGZUFnTEhQbVRvVTFXMXlKcHNpbW9s?=
 =?utf-8?B?b3BiZzZhWnp6dU1zZEM5azZCWkJURUJQN09NOEZPamxDZW9sZHZQNnhxMis1?=
 =?utf-8?B?M0t2dklhWm1JKzlhSUZPU2xEeHQ3L291Uks1anVTbVg4bUxUTnB4c1VuK2d4?=
 =?utf-8?B?MXEzTzFzTjdIZmR4WVlLejVGUWk0U3k2aXNPeEpueHNMeWdpOFVlTVU1K2c4?=
 =?utf-8?B?WmthTmN0K1hPZzg5RWZHVUYxUWprbkxlSzBMV0dPYzhzTzlrZUx2T1NWNjFH?=
 =?utf-8?B?S1FBeXB2V3JJcXVxRSsvRFB3KzJNaUJIaHRvOWlwTzlaTjhHbm5RWTArbWpo?=
 =?utf-8?B?cFE2VGcrbEVTSTdHdDRteHFaVmVJS2g5TzkwWnZ5YWFwUjdiSWFCeWVpTVZ1?=
 =?utf-8?B?Wm90WWJXdUx3OU1hVVVSODZRdzZyY1phSTd3cWJwZTJMVUUvR2d5cUtQSlR4?=
 =?utf-8?B?ejBtRzkvTGV5UHcyanlsQWY2eXFKSXJNNzUzUnBYSENCVFFhcjdFSitYbVEz?=
 =?utf-8?B?b2J2UzFTN0llMTVEWnplVXdzZXRDZEtaRnNXc1ZGVCt5NDF3MGV6VWovSThi?=
 =?utf-8?B?emYrR0VxTFdRRjdCK0FnNUdpZVRXUnRVUXg3dWl3NUxwYllqdnhhRXkvYUFw?=
 =?utf-8?B?VlgyZ0s5cFdTMGl1SWpENEtWcEFoM3pKU2VMenA1NnpadWg4ZjdNeU1NYWxF?=
 =?utf-8?B?ei9zUWRUaUM2dzZGQWM4cm5nbXFnSmNGNnY4MldhQk82OS93SXYwcmxuYkIr?=
 =?utf-8?B?OUowc21CUHNFT2lDSWZXaHF3TEFiMHdxb0JMVU9jcWNtRENHVnUzcjVqMTVk?=
 =?utf-8?B?U2w1bVJnZWpmRnNVcFNINVBON0pTS3M3d2htMjltdlF6TGliTHh5aXdzaHR1?=
 =?utf-8?B?VU1YRlI4RkpDeDQ2S1ovZi9oV0lhQnRTYzJxMXIzQUFmUmlEQVMrV0lnUlMz?=
 =?utf-8?B?S2Y3a0doYnJHc0xmUkJsVHpiOGFyUXlNZ3RyOFNPRUxEcDAzOEYyQlBURVFF?=
 =?utf-8?B?Q3hVcjBLRjVmeDV5Q2ZvcjNaTVNjbG9lWHJqV2hBWmN5NHFVWWZhUG5vNndR?=
 =?utf-8?B?NEk1WTRwMG93dUJHaElCejhMSEJ2bmNmSW1CejhCd24vZHg2VTNSNzdqU1Yr?=
 =?utf-8?B?czVOd2JUdWFHZEZwM3crVzVMZnhHbmtuaG5TZ1VMeDhuOWlGZUZGaUg2YnhY?=
 =?utf-8?B?U0VXT0lJTlorMFJpQ2RKRjVsS0toMzMvaVdvQmtsaDQwaWhObk9uaFVQeEox?=
 =?utf-8?B?aTZod1NSNFJYWE40VDIveWVSL1I4MTkzZUQrODM3Myt2Y0QvQ1ZpZG12YjhV?=
 =?utf-8?B?M2EzWE4ycHMzazlvcVhNRk96V3YxK2dFN0E1dzRmZWpLK29Lb3lTUW1rVnpu?=
 =?utf-8?B?K2pjOVluemowb3FRZlFWdEhNK01VWTZFOVFFeGhLQkV4UUdvSWtac3lyR3NM?=
 =?utf-8?B?M2dsMEluWEhTODArcWhZU1NiWHlNYUlnRWdsSDZtMWZsd1h4azlHNkhYOVRV?=
 =?utf-8?B?MzhXTTdsNmlFMTdsUDZRN1VHYWxYc2ZmdTN2cmp0dGZBclJpc3FrR2Y2WXUx?=
 =?utf-8?Q?tsAQwcJbpa5kTLy4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c03b4923-87e9-4b7d-4458-08de6e965ac8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 02:35:18.2050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: somMS18qmjELN086aRiROl58OPG5ycnX9Mzqu4HUjsHhKoya8AXZtqD7mJT0AXcoucOpIijunfqdbqplGe2gcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9476
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

On Tue, Feb 17, 2026 at 05:24:07PM -0700, Summers, Stuart wrote:
> On Tue, 2026-02-17 at 12:19 +0100, Francois Dugast wrote:
> > On Mon, Feb 16, 2026 at 09:40:19AM -0800, Matthew Brost wrote:
> > > On Mon, Feb 16, 2026 at 01:51:57PM +0100, Francois Dugast wrote:
> > > > mOn Fri, Feb 13, 2026 at 01:16:25PM -0800, Matthew Brost wrote:
> > > > > A single VRAM read on BMG can take over 1µs. While small, this
> > > > > is a
> > > > > non-trivial amount of time in a hot path. Remove the descriptor
> > > > > H2G read
> > > > > (potentially a VRAM access) from non-debug builds, as this
> > > > > error-checking code is not needed outside of debug
> > > > > configurations.
> > > > 
> > > > About the change itself: I understand the performance benefit and
> > > > this would
> > > > make the code consistent with the 2 other reads.
> > > > 
> > > 
> > > Yes.
> > > 
> > > > But the existing block under "if
> > > > (IS_ENABLED(CONFIG_DRM_XE_DEBUG))" seems wrong
> > > > because it is not just about optionally printing some debug
> > > > statements, in case
> > > > of error the function actually returns a different value if
> > > > CONFIG_DRM_XE_DEBUG
> > > > is enabled or not (goto), and this return value is used in
> > > > __guc_ct_send_locked.
> > > > 
> > > 
> > > I can't realy argue with this logic but I also see the benefits of
> > > verbose checking of GuC state in CI configs. fwiw, this logic was
> > > added
> > > here:
> > > 
> > > git format-patch -1 d2c5a5a926f43
> > > 
> > > The cost of reads are actually huge here - this patch by itself is
> > > incomplete as a tracepoint below does a desc_read in the argument
> > > list
> > > and this is uncoditionally executed even if ftrace is disabled. On
> > > BMG H2G
> > > before this patch / fixing ftrace are 3-4us, after ~300ns. So I'd
> > > suggest we move forward with with a couple of fixes patches first,
> > > then
> > > in a follow up either:
> > > 
> > > The cost of reads is actually huge here — this patch by itself is
> > > incomplete, as a tracepoint below performs a desc_read in the
> > > argument
> > > list, and that is unconditionally executed even if ftrace is
> > > disabled.
> > > On BMG, H2G reads before this patch / fixing ftrace are 3–4-µs;
> > > after,
> > > they’re ~300ns. So I’d suggest we move forward with a couple of
> > > fixes
> > > patches first, and then in a follow-up:
> > > 
> > > - Move all really expensive things in GuC CT layer under
> > >   CONFIG_DRM_XE_DEBUG_GUC, enable this Kconfig some CI run
> > > - Perhaps just assert if GuC state is corrupted in the path
> > > mentioned
> > >   above
> 
> So is the suggestion here to enable this DEBUG_GUC parameter for all
> CI? We do rely on these error messages for baseline debug and sometimes
> things coming out of CI (or even a customer) are hard to reproduce. I'm

Customers would never turn this (CONFIG_DRM_XE_DEBUG) on unless we
explicitly ask them to rebuild their kernel and reproduce an issue.

> a little worried removing this will drag out debug for these types of
> problems.

I think we should basically leave this as is for now and focus on
getting the non-debug paths performing optimally in the smallest patch
we can. I’m planning for my next rev (which also fixes the tracepoint)
to be a fixes patch, since that alone gives a 10× speedup in H2G on BMG.
This starts to show up throughout the driver as performance improvements
(e.g., I’m seeing TLB invalidations get faster) because it reduces
contention on the CT locks.

We can debate DEBUG vs. DEBUG_GUC in a follow up, along with any
intended behavior changes tied to the debug knobs. FWIW, I really doubt
this has ever caught anything — this type of failure would be a
catastrophic GuC bug and would surface quickly in other ways.

Matt

> 
> -Stuart
> 
> > 
> > Sounds good.
> > 
> > > 
> > > Matt
> > > 
> > > > Francois
> > > > 
> > > > > 
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_guc_ct.c | 14 +++++++-------
> > > > >  1 file changed, 7 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > index 6a96bea40720..f200d3ee9d22 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > @@ -939,22 +939,22 @@ static int h2g_write(struct xe_guc_ct
> > > > > *ct, const u32 *action, u32 len,
> > > > >         u32 full_len;
> > > > >         struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g-
> > > > > >cmds,
> > > > >                                                          tail *
> > > > > sizeof(u32));
> > > > > -       u32 desc_status;
> > > > >  
> > > > >         full_len = len + GUC_CTB_HDR_LEN;
> > > > >  
> > > > >         lockdep_assert_held(&ct->lock);
> > > > >         xe_gt_assert(gt, full_len <= GUC_CTB_MSG_MAX_LEN);
> > > > >  
> > > > > -       desc_status = desc_read(xe, h2g, status);
> > > > > -       if (desc_status) {
> > > > > -               xe_gt_err(gt, "CT write: non-zero status:
> > > > > %u\n", desc_status);
> > > > > -               goto corrupted;
> > > > > -       }
> > > > > -
> > > > >         if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> > > > >                 u32 desc_tail = desc_read(xe, h2g, tail);
> > > > >                 u32 desc_head = desc_read(xe, h2g, head);
> > > > > +               u32 desc_status;
> > > > > +
> > > > > +               desc_status = desc_read(xe, h2g, status);
> > > > > +               if (desc_status) {
> > > > > +                       xe_gt_err(gt, "CT write: non-zero
> > > > > status: %u\n", desc_status);
> > > > > +                       goto corrupted;
> > > > > +               }
> > > > >  
> > > > >                 if (tail != desc_tail) {
> > > > >                         desc_write(xe, h2g, status, desc_status
> > > > > | GUC_CTB_STATUS_MISMATCH);
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> 
