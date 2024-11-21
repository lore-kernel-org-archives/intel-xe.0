Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB44D743FA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 01:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB7710E03D;
	Thu, 21 Nov 2024 01:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpG2g7Bq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A101C10E03D
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Nov 2024 01:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732151134; x=1763687134;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ytO6TKi11MzM7raqSy0yPeMUahVBtm43Q49Wa2KkWbk=;
 b=EpG2g7BqFO6Fv+c9qsbkrU4d0qUnj4iXsnxUwYW1TNi/aMUa0aJO12w/
 j67OonMucHQgrlGfIdZjUUa+Rx81MU/yapofyvgEEY7VS89YNq438H7Y+
 DkO3xmvfaE8iSWN8EK9rXxAz/372qKFjtujHNonqhA68vmtJfPsYaw9J1
 eeJGj/aaHCGpnorQE5VLDyR//9R/eOqOCWgDpVbR642uiHECDjTBuiJe+
 Yiikzlk43rIdyLbBl59Yc03Dy0vRQWWZpzhjToG5NpvxpwUYv1fEUrgSz
 KYz8LR5w+moxhDkb06ku3h43nj2VD8NjE1pBJ+nP9HVCCwXPObb7vIoej g==;
X-CSE-ConnectionGUID: +i9kgi1dQgO4GS+chQa8Bw==
X-CSE-MsgGUID: OCZrsUAVQiqE/4bL7JuWMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="49665772"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="49665772"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 17:05:33 -0800
X-CSE-ConnectionGUID: ddUwKd1TR2GfEcaKnN7l6Q==
X-CSE-MsgGUID: 4E4xt97wSQGWQCZDo5lYyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="89671879"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 17:05:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 17:05:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 17:05:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 17:05:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf9KGTXGFfnVeG0JG3KiMN6rurw4dMXULaTbRxH5VcAarOJoxdwL7l/Clk1LxICaTZOeJg1tLCSUItvx1nyCkMZZXHK3pD0yMVwOGUeY45cMYt/lvqZhid1Xr+fdMkw4zNhGfMmwSjoUh3Dk3n/fJU95kqDBU0gyavrNSELg2CtmnFw2p6XN8rFU1lJENvIpG4+hen5GSMIK2Av/yDPuWPEeLlvmozje6xS+6Yg9yBOlCjyLwD0tiEkwFZLsGhyyJYLAAInv4UVAf1CHfWhlmvqCjwUflkd1TmQzMGlcb8FeGYQM1yYzgmbGaTPoklVKPOXBtCxclb7QNa0b5++t4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMJCZa5gFefQCC1mYdp5DwaW8DiMidjRikub+N8129E=;
 b=fnYTcGN+1aP6TY61PfacfJ0+L7Ku3JPHVtokq0OGF0zpzJ92+LLv+Enu48N1pDvJsG3RC4QXf4IuWxWx6PcR0Z3yGAgrBG5zILoK+asIz4+ooKk55KIZbxcpUWLePSF7CuTrPghiqm0XMx6MxDF/vyeBdvJ/lExEYrTHYIoEbzK92qOwOOjrmSgL3c8sJIFiCcGEzpnGS0QVAjf1kcuY6a5pkbGEdZwLPQD/5UlwukcmoI+SYUKLLPAlNUxvrG/pBAVqK5xwZ/DvcSIcoqrVfoMn1+66m0auEiF8+n6yRbUUXruPS9pn43bhRIg5N7RkAly9uP1VcSaIiXSSTkirIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6307.namprd11.prod.outlook.com (2603:10b6:930:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 01:05:30 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 01:05:30 +0000
Date: Wed, 20 Nov 2024 17:05:27 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Harish Chegondi <harish.chegondi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <james.ausmus@intel.com>,
 <felix.j.degrood@intel.com>, <jose.souza@intel.com>,
 <matias.a.cabral@intel.com>, <joshua.santosh.ranjan@intel.com>,
 <shubham.kumar@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe/eustall: Introduce API for EU stall sampling
Message-ID: <Zz6HV+/Ya1nOReZE@orsosgc001>
References: <cover.1728884074.git.harish.chegondi@intel.com>
 <a4ca443e9dc0e25ff4d77908f785cdfdf6c80f7f.1728884074.git.harish.chegondi@intel.com>
 <ZzYj53waEWwK/5za@orsosgc001> <Zz0mUGCKzLXI5Y13@intel.com>
 <851pz5loar.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <851pz5loar.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0103.namprd03.prod.outlook.com
 (2603:10b6:303:b7::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3316c0-e1a2-4001-233a-08dd09c89781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1lQa3lLSnhFVHRnRVptMzZBQ1ZhZDA0TkJ3Uk1yMDE1MS9ETTQxK3BQOFFI?=
 =?utf-8?B?YnlyVUVhZlk3S2UrMXVVZkllakN4RWlENWUzcUNrUlREemRaM085S2tRUjVT?=
 =?utf-8?B?SHQ2eDQyVWdZMzFvTjhLNVM1QVkrbi9kNnNoMDZKYkhPbUZTNlJVMENnOUhO?=
 =?utf-8?B?TDZTaW9SVGprSlVqVGZuY3ZYRTB5Rm1KR1JKU0tzRFpYVFN3WENFdmprd1Bw?=
 =?utf-8?B?dTNIZ0h1UWRNVXpOQkVISHo3Ujd3NjVHdzFPenZTS0xlcTFUQUloS3A0RTBN?=
 =?utf-8?B?SU9tRGswZ1Eya0lYTGM4c0hBR1FWSUJFMjBwL1l1NVloTDhTVEQ1dlI5TC91?=
 =?utf-8?B?Nmdac1R6eFNpcDY5bCtuZ3pMVGJjY3k4bHpvRHZRckNlMGUwN01NaVN1aWw5?=
 =?utf-8?B?dllwZ0oyaFppYWxxM0dzM211Unlia2RkTzNWQSs1Y2JFaTRMdUp4T0JnY2pT?=
 =?utf-8?B?UVRJUnBvNzRNc3NDaFozZitFK2EwYzdTNzArbXllZW9XSUsrOGtmRGROWlJZ?=
 =?utf-8?B?MFhXTUZsWkZKVUhlQXkyWDlZRE50dFFoYmtkRHc5ZW0rRlY3VGZtNm5CNzlX?=
 =?utf-8?B?L0NNS1hoWWdEamxneldLdEM3ckNhRzdtV0hrSlJRY1crVjRJWEFEVXdrMVA2?=
 =?utf-8?B?OHlLTU5ReExSYzR2MlhVSE5sdDNhYWt4WFcwN2ZRMk1QVzdLWFhLVFFmMXJD?=
 =?utf-8?B?NGRYT1RTbkNpYUdmMzg0aEttbStBb0VSckwyc0hMOGZubWFHY0VUeVpOUThn?=
 =?utf-8?B?WTJwZ0c5a3FyakJzRTJ1WDhYeVBWQWs0Qit2N1dIMmNLblFQVmI2cS80dzZ1?=
 =?utf-8?B?YlJIcDdrcTdXRkt3ODRnTTRhMEdTNks0STI1QW9pb3RWSURQSjVPNDFVdFBj?=
 =?utf-8?B?NXh2YzlxTEpXYzBmTjBCVUVib3EwRjUvUW0rMFVBRmx1S2NJdVEwTkRYSFZq?=
 =?utf-8?B?ZTZUUmFQc29qUE41ekUzOFA5UEtYQ0gvV3QxYldubnhlNkhkNWJPOWdQUHpB?=
 =?utf-8?B?aDh5WndocllrTlZqR1V6aDRISllGclRKcU5NVVJQWXIzMldQODVhSFZNWTJF?=
 =?utf-8?B?bk5DMnd1K21FMlZGdVhTdXluUmFZeStsenB4ZEFhSnlyUzBuOXhzL0NKUDdK?=
 =?utf-8?B?dGo0aEJ0NXE4eTU0NUdoSTNDaGE3MGdGTVl0eHQ0ckc1ZG94TUhZeEVzYUZW?=
 =?utf-8?B?NnN5cXBTWWp0cWdwcEpuQjhMcGxobUlRZEJ4YWlsRVc5T1Q0Rlk5WUJkK3Ja?=
 =?utf-8?B?ZlJGamRWaXlneStlVWRwTWVNdFVOZkd4NXpIUDFhSFdSZ1dvL0VMWVEwV0Z3?=
 =?utf-8?B?dmZSUXhkWUc3MlRhQ0EyaHVQcHhuSm9PMEM4Qll2M05nbkZvRlpVS3N2VHJt?=
 =?utf-8?B?S25tZWJyNEQ2SWU1SDNYYUNxOVM3REUvYlZDVGxSSE1Ib2NjZGJkVmNIVVFq?=
 =?utf-8?B?R1lONDZ2R3dEQTZ5bWN6STczZlIrUlhONDBtaTg3cGp6NUI3Vy9LRWQ3dVdF?=
 =?utf-8?B?Zy9oenNoWlZ2ZUE0ME1OSkQ1WWQ2cXRPZzlOODZDTUJtbGpzazJQajFqcDVO?=
 =?utf-8?B?TFRMV21HMnQwTFExVDFXSzNnVEpzZWxHV0tVMzNhS1pZSkRTd1crSDhBcCtO?=
 =?utf-8?B?aXNMZFYzTkdMcUxqL2dQUDR1QUhHRWdzV0wyNlFjdFY3djJ1aW01R0tudUpj?=
 =?utf-8?B?YlVmOUlMU1RCa01IMCswZ0FWbG8zOEMrMG5CeDFocU9PcnhkZGw4RWx0bUpO?=
 =?utf-8?Q?t8q7YWhptLyJOxnFmQyVO8HY98/0RI7kRGpkrxp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTAyTGtiR2hXL295ZWlyaDdsV1VmeHBSeWM0OHJiVnRvOXRKNFF4d1VzQ2tJ?=
 =?utf-8?B?a0hJT041M3RoWjhsckt4UWQyMHdZaWJ3M0t0Uk9CWllmemNqREhDVno1T2R4?=
 =?utf-8?B?NHl0VXNnZGFIRVEyNDdiWHU4VGJRMUN1REgvcUlTV2RHb3o1SWtiTG13TStZ?=
 =?utf-8?B?K0F4ZTI4MDNRQlJnTXY1ZXFNMmljVkJhbUNYMVllNEYyVXFxeEpBRHA1MjV6?=
 =?utf-8?B?ZEtET2JBeFBmNExCRU55SWoyZmtBMFA4S2pWc2ZLdkxadlVIS0o4MnE2enBl?=
 =?utf-8?B?NjJCanRiR0VRbkRsaFBTQWVpeVd1MEdXVDJhOVp0YVA3bWNiRC9tQU5zaUlK?=
 =?utf-8?B?WW5uZEdVWEtuMEY3VGpTUG4vUkpQR1ZjZGw3K01sOE00SmlRNCttN01hbTJT?=
 =?utf-8?B?VW5laUhPcUh4M1FVK00wL2ZUTkc0TVFuUW5uTU96YUpqOGgyQXJ0dlZJR2tK?=
 =?utf-8?B?ZWxRYVV6VzJaYm1Fby9ZSmxRQ2xudFdhUzFqM2xlc2o1N3JNR3hLVU9CZHd4?=
 =?utf-8?B?TEVpVkQ3S2lPMnMvK29ZVi8wZzZrZWcrVlZoR0RrRS9NMkxKVnZUNEZremhh?=
 =?utf-8?B?Qm4zVlZ6Y05jTHVRUmdNOVdHOGI2UU9zYkcrb1VyYXk4Q1dVS3dpTFBrTmpV?=
 =?utf-8?B?SUlVenBicjJhdXF6WCtjNUhVeElCUkp2T3BMUFFNMVNBN2I3TlBXYmFaSWZM?=
 =?utf-8?B?bWY4UjlkeXp4SC8zVUFmTTlNbVpNSk02eXk4cmFSNDhiN0RhNm5HN013Qkhz?=
 =?utf-8?B?ajVtOGUrZEY3Z1htWDcyYWcvWVdyNjNXWmZDbnQzU0hsOG1OZGRPTWZFYlBE?=
 =?utf-8?B?RFZxYXdvOG9PbU1IYWIrVXlXWlVtSm8vMlZVbjdiM2FUWE5DUnQ2Q01CUGFN?=
 =?utf-8?B?SHdtd2t5OGNkUjBLR1VrNzY5Y29UQU1HdmltWCs0aEpzT1BOeW9TUkQwVzJy?=
 =?utf-8?B?OXJ3QUplVWlIY0FBZVh6UEk4V2k0VGUyL2lpNWpyVjNWYzcvVlE2WFFhNkk1?=
 =?utf-8?B?b1NNdE9TRCs4dFozZitjcGhvME9MRGhLNE0zK2NOSUF3cUFlV3FVMWtGMVNL?=
 =?utf-8?B?bWhVUjdqRW95dnpRRjg3NFVvLzdKbG44QnhteHVvZUlhTXhaMHNvNzQ4ZExx?=
 =?utf-8?B?WUpaZ3lhWmZPWTdZN1J5V1loRFg0WS9tU2VOOEx0K1V1S1l0c2RZdUlncGUv?=
 =?utf-8?B?S21aR0J1NTB4a3RqdVlEWlFUUnhtcktEdlFEdVI2aGwrZWJQUUJ2OWptdW5s?=
 =?utf-8?B?ZGZkdk9RejkzVVFOUnh3K0llZXhVZ1gwQW9ISDVveHN0aVhrNFlYWE1QZGtK?=
 =?utf-8?B?dDg4VkhaRSt3UkhmMjhyZWsyK3c5dmkwR0J6V1g1ZXRGVzMra2x2b2drbU0w?=
 =?utf-8?B?Z1RDWDd2RlpwMld2Y2lFVU80cnlSa1M1T1NDWXRCYXhOOGZDOC81bEtYSTl2?=
 =?utf-8?B?TzdNR3RvQlpJU25paUcrK1lhSitReVE3dmtSdGRSRDhJMGZtaUdSTVUrSDRL?=
 =?utf-8?B?b2dGWTF6VjdTQkRsaVIzUE5vRFR5TVZDSEhCYVFVWDlyVmlhek5oeHE3eHM5?=
 =?utf-8?B?bm1STlN1M2Y1ajJJM1JmQjVmTmJUT1B3WEljU3FUYm9qZENNMmJuWHJ1Rjcz?=
 =?utf-8?B?RUxTSklQK0hYSlhpZVUzbjlseHZxbjVzcFJ6VGROQ3o5NTNPcnBmeVd2MW82?=
 =?utf-8?B?S0NPU1h6Rzk3QzRDTWhkVjZwbHN5UExkeG1ENTc4UlA1czFNdDh3RncwVkF4?=
 =?utf-8?B?cHdLcGhvVmJMWnF6MkRKSU5DeS9OK3hxcmQ5TllEbm8yNnJHbVBPWGkwQWpq?=
 =?utf-8?B?dnFIVlgyQ0tkcXp2eElpODNFWTVvM0NCY3JMWENPY09GK0wrWXBJbW5DSzNE?=
 =?utf-8?B?QitxdStNMm0zQzNLWkNUSmR5aUpBWUVrTHVhd1I4elVuY3ZzeVFtdXlSVGpn?=
 =?utf-8?B?U1FBVFhiL1plYU1oR2kwc2xsaTNCYnV5VVAyUmxlVnkzdlFrNi9SZGYyWVBo?=
 =?utf-8?B?elFFVDZvUnpsTXpNNXg2TWZTWXRUZ2g3MFZ0S0ZLVHEwL2lHNVJ0eFdzWGY4?=
 =?utf-8?B?blI5aHRzMzVJMzZOeXowU1lsa2w4V2J4SkZsM3RpK3EwWDY2MUloVG5mZXd1?=
 =?utf-8?B?OFNITktNQnVMcmM4d3lkbDlYUXp6amdsUVFVb2NvZER1Tnd1Skg2RGJVK3lm?=
 =?utf-8?Q?v9Zrw3pVWAhQc+POz//Mtwo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3316c0-e1a2-4001-233a-08dd09c89781
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 01:05:29.9291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bqMRuacYhNZIEiqPKcTfjIRZFaT9SrPp2i0ZyEWJkCW1xrrr75k8Mc1IJ6uTnHEYv+hiHWUeATrbq0UrNNVPvruzTtbmkS9oCAF3AEM/0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6307
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

On Wed, Nov 20, 2024 at 11:04:28AM -0800, Dixit, Ashutosh wrote:
>On Tue, 19 Nov 2024 15:59:12 -0800, Harish Chegondi wrote:
>>
>> > > +/**
>> > > + * enum drm_xe_eu_stall_property_id - EU stall sampling input property ids.
>> > > + *
>> > > + * These properties are passed to the driver as a chain of
>> > > + * @drm_xe_ext_set_property structures with @property set to these
>> > > + * properties' enums and @value set to the corresponding values of these
>> > > + * properties. @drm_xe_user_extension base.name should be set to
>> > > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
>> > > + */
>> > > +enum drm_xe_eu_stall_property_id {
>> > > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
>> > > +	/**
>> > > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
>> > > +	 * in multiples of 251 cycles. Valid values are 1 to 7.
>> > > +	 * If the value is 1, sampling interval is 251 cycles.
>> > > +	 * If the value is 7, sampling interval is 7 x 251 cycles.
>> > > +	 */
>> > > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE = 1,
>> >
>> > What is the rate of 251 cycles? If that can be clearly defined, then at
>> > first glance, I would think it's better to define this in terms of
>> > frequency. The implementation can decide how to translate that to HW
>> > configuration.
>> >
>> Since the duration of a cycle depends on the GPU clock, it can very from
>> GPU to GPU. So, if there is any translation in the driver, it will have
>> to be different for each GPU. I think keeping this input as a multiplier
>> of cycles may be more future proof for the uAPI. I am trying to get more
>> information and feedback from the user space regarding your suggestion.
>> If it is feasible, I will implement in v6.
>
>Umesh has a point but I sort of agree with Harish because this value is
>directly fed into a register. But we do need some changes:
>
>1. This 251 value showing up here doesn't make any sense and needs to go.
>2. According to Bspec 64036, HW supports "127 * N" sampling rates
>   (in terms of cycles), so we should support those too.
>3. Even higher sampling rates (say 10x) are being proposed for the
>   future. So these should also be supported.
>
>So my proposal is simple, but let's see if it can be made to work. The uapi
>will directly input the sampling rate in number of cycles (so the value
>coming in is what the GPU freq is divided by). So e.g. if "3 * 251" is
>required "3 * 251" will come in through the uapi. If UMD wants "7 * 127",
>they will send in "7 * 127". The driver will internally map this value into
>the "closest" sampling rate supported by HW.
>
>I am assuming that UMD's already know what sampling rates are supported by
>a particular HW platform so they can send in the exact value they
>need. Otherwise the driver can always map the value sent by userspace. Say
>UMD sends a value 10, this will be mapped into "1 * 127" which is the
>closest sampling rate supported to 10.
>
>So this way all sampling rates can be supported. UMD just says I want a
>sampling rate of "GPU_freq divided by 10" and they automatically get
>whatever is the closest available. They probably do need to have an idea of
>what rates are supported on a particular HW platform, I am assuming they
>have this information from Bspec, so they can send in exact values if they
>know and driver will be able to set the exact value UMD has specified.

I am okay with whatever makes sense from a UMD perspective and whatever 
can be extended easily in future. Just the cycles as you are suggesting 
should be good as well.

Just curious, since the gpu frequency is may vary, any idea how the UMDs 
map this data to their timeline?

Thanks,
Umesh

>
>Ashutosh
