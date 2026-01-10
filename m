Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E19DD277C9
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 00:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B39210E23C;
	Sat, 10 Jan 2026 00:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1D0xXNN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE0810E23C
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 00:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768004213; x=1799540213;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hk+CvMdSkKadm3AI6fu0iQUQpUZV9A7MMd8obrSy4J0=;
 b=f1D0xXNNCOnc4JPxlsEnEmo1hsoYa1Rd6Ybt58RZjgSKdiHVweJ7XoJc
 5RseEt307XgpC9fXYU2IBvorC5wq/WETSg2/7DPoKEURJrIml+RIpFCZF
 muSH1sKJPLKEAZO8sbJVHclcBnjf2YP3p95CHGwMBde/s/JZZ77zJmMCO
 dGYCbzBxu8eK0wryHBpl/BeWtli0/ZnW9OBaz0t6XSc41VJ6z1o9FpQAK
 iEe3FYymBud0ZM3jdw5yDD5r7b751wRnPvcYXdqM/C90y4gTpVdHhZQoy
 l5S8tOzIz2vrl9/cBXKvNu6cfT0cAp0/UznQDxA5GicIdF5TpO63fWSbT Q==;
X-CSE-ConnectionGUID: obHBLs65QSyYroG4aSE3lg==
X-CSE-MsgGUID: jE6QIB0USP65b2iF8+XD9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68587111"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="68587111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:16:53 -0800
X-CSE-ConnectionGUID: Zl+nDZkaROCdVvAkhriuOA==
X-CSE-MsgGUID: 92OzLzTSRKKHpcpESuhyig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="203601865"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 16:16:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:16:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 16:16:52 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 16:16:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hn4IFXWy7Pm+jUYnnfHkrlSm1eFBdQDNdqKNiG7Bw8FOyXe88jO6nRz67jihB1T8AmOci46GU8HeexE2irg5z3qRKOaYyqRPIsm9PxChtb/XEBlJgsZwdgwzGqpg9i3YEI2fOrN7z8zYgsR9Scwk5htlu9GWXq6PHvrgagrXs4oh2gUEEkJ7afmgwfvnrKPXMrztpeAPSjeNtC8C2Nm36OmH+1h/ZkE0UbpJf9BVqEfxUthXcmb9u6WS3aMmN1hmF9M/RzClfw43HnUSh29EkkqFPsqewCGTnpwg7TQVpT01Px0Tz6sCVSIMKAWIYJ2umpd+caJIa0i7OzxMB0VN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79awY366DVlXgaiZGCMsot7/NyWGnZga83eyN2qraw4=;
 b=vIk5ARfRESBTc/jV6lunB4846h1gndzuqAsavNtZMws7H1mRZ+AIBbLDaHqzc7lng7qRlP/FetE4t7APpuorB6dcOs0NeJuivQ43+KWy/FEJFH6VXKh5mqlhk6CaeScKlS6KoJYIb/JhI/LvmXM4s9Jr34Knqr+hfjmZoHuU24RKe7RrIy2gB8rL216f0RhNuSurEYkYSlhRuxPeFghk8KufNJSxupXTJBoI0HR/u2WT9pkvrMvQabTqeLeNBT9Pkb5J/XU4kF1Gh/s/bAPv/OLRKgzOUdZ0/fVh/obCFxhorXjge8vtatDFsuipJWRpoUEPksxaXyvtXkydFNMz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 00:16:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9499.003; Sat, 10 Jan 2026
 00:16:47 +0000
Date: Fri, 9 Jan 2026 16:16:43 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 6/6] drm/xe/sysctrl: Enable System Controller for Xe3p
Message-ID: <aWGaa3Xr5gXOomBR@soc-5CG1426VCC.clients.intel.com>
References: <20260108120548.1015154-8-anoop.c.vijay@intel.com>
 <20260108120548.1015154-14-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260108120548.1015154-14-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e37565-828a-4476-6ffc-08de4fdd8af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djc0VjJmWGNNUDhFd0Q5dlR3ZFR6aFk4TFdyakV6eWF2cmF2YkZDNGlUaVov?=
 =?utf-8?B?Wm5Ld0haQXV4d2VyZzNPT2d1TlNNTnVIV3N3V1pyTm9zeGovZkhGbTVlRHJp?=
 =?utf-8?B?RmRCYllYR3R4bFFDdUpGUmt1T1N4SWRjVlcrR0ttVGN6L3BkZzR1U2I2QjZM?=
 =?utf-8?B?WnF6QS9zaEtuL081VWk4NU5odjI1dUNFQ1pZSy8wbFNyMUQ5WjRGMnJEREI5?=
 =?utf-8?B?VmpiSzEybk1UNWZWUlFEOGMxcUVsT0xvRlQxY01ZV1EwNDMwV3d6cWZHeWg1?=
 =?utf-8?B?elNidWZ4QUFTNHZJUGZMS0Q5YWpubWFYbWNEczBWcmliZFZ1UzEybG9QLytn?=
 =?utf-8?B?THNucU42OFlCbEpZd0FUdzJXZkl1YWE1Rlh0Wm91U0QwMnE1ME1HaW5MV2Rx?=
 =?utf-8?B?ZDlNZ05EdkZoODVzeHo2eDh3RThFVzNOZ0Q2N2ozbzlQT1MwbG83VlFEVmxM?=
 =?utf-8?B?NjRGOFlic1l2ODNNNGZqbURHUnE1ZTRubmZLN0V4blJ4S2ZtdXFQYi9RaldK?=
 =?utf-8?B?bUZqbHdRNVFKQ3BveE5TOUIzcXZTd25iaU02R1pDbDlqWk54dXVBRkFmdXNr?=
 =?utf-8?B?TXpZZWNCNkxNZjYydWk4eHNaWlRjcVhSRld4L25PODhLUW1wa2xoc0VQMmNk?=
 =?utf-8?B?czI4d0lZNnNSdndVb0xkMmhTQ09BK29oY3I0QkFRaFhPOC9HZXhYSjVOcm9X?=
 =?utf-8?B?RFpQUEFpTGZ1S005SGRWb2FvUEtPUGxocUI3ak1WWkpMa09MUy8rOXRJUzZB?=
 =?utf-8?B?YWdxVHVmR2lYOVFERUtZNFVhR2N1VVhwZSsvOFRUR1FSR3FhNU9tQjRqTWhF?=
 =?utf-8?B?RmJQVUE5em1ZRXRSd1hLU1M5ZE9mb0xNZ3BYMmFJM04zcFZXTUtRSVYrd1Nr?=
 =?utf-8?B?V2lxRzFQc3pyejNEbFc1cWJLN1lsRG5mSlh6UDQvTU9YVkdySldmM2w4TU1q?=
 =?utf-8?B?SGZUTmNqSzFlVVpwSUlKZDVaZVFQSEdrZk1CSHRLQis0T1VlNnFXSWxFMnpF?=
 =?utf-8?B?SnBZT0g3OFBZWEMxaFBTeWk5MjYvUzRUNGJpOC91ZWp6clVNQTZTZ2xqV3JD?=
 =?utf-8?B?cVhWVEdwNTdwOFJlR0R5bkprbmFkTnlZbkZaRFY2YkdxbVNZYklUYTBsSmNI?=
 =?utf-8?B?bG9FWm9LQWNJd1lzRTdyaUVDMTZBSko2NFYwbVZIN3lnVFl5S0JTcEs0L3gz?=
 =?utf-8?B?bWVRNWcybVlTZUNsdjhxaVIxbWpYM3dSRHlUdm5xUFFNNHpiN0xQdDMxVEVt?=
 =?utf-8?B?dnoxV0psNS8yTzRKdHo0L09aaUNEaEVCVDNnOEh1aEIxRlQvTkRBWEp6dGY5?=
 =?utf-8?B?WDM1QnJBVWVxa3hmUGE3WVllMVNxSSt1Q0pTMWlRNUR4bVo4emdxZENzRk5Y?=
 =?utf-8?B?Wk9BaUgrYStIRC9NSG0zVzU3bWVhcnRwelNmTGlZc05Bd3FrK1ltUzVHVWJ4?=
 =?utf-8?B?NThNMGtFSnJVM3RZUFYzamNBTHhLa3gwbmN0bEczVGJUQnA1NVArM2sybm1i?=
 =?utf-8?B?QjUyM1p4cTB6S0xQbTNOcXorNTg3RjhKcUJScFR4NG1MSzdGS2xRemFuSjhH?=
 =?utf-8?B?djRXcXdlZnZWdUFERldPcjU2SStzaEFNTGtNZll4U2FCZE1zUmw1SXE1Z0l5?=
 =?utf-8?B?SGg2RWtFZ3Rnd2JVUy9vQy9lcXVqajYyQWhnTzhWZ2txWHN6WnRqMmZESlpO?=
 =?utf-8?B?YUpsb21ESkNqeGkvejlMemJ2TW5JTzMrU28xL2FIOGd2Y29USm84cWlxazRD?=
 =?utf-8?B?NTZVb3BERkw2cFl5T2NORzEwKzZ1SUdxMWRPQkJ5eURURmYybkNhVEtGOE1W?=
 =?utf-8?B?OWdTR0hwZGVjYnVoNy8xeTRPc09GVVpKMFdnUUNJSmYvdlRxYUh2MS9CWXpv?=
 =?utf-8?B?cEJwOFBiZHRGZUVnQmhFRUMzenBDQXhGUUEvdFdqYlBwbUJUZ2lNdEVDeDR2?=
 =?utf-8?Q?UuPC8p7b9JdWKlKgTJ1ECNlqhAlwnPen?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk52aXRkUXFqNENQVUlBUFhJTE5LYUVyZ3l6eXVMMHJLYzJGbkZ5OWdNWTlm?=
 =?utf-8?B?MmNtUDF4dGlyQlNBUGduYjg2OHFMUHhSMFgzY2RybGkvbzhEN3d3MGQ0Mm1S?=
 =?utf-8?B?aDVVY3MrNi9pYzNJeEppV0lhNnJvbW1FcWR3WXhyOGp3a1BZSDJ2SkNxdnE3?=
 =?utf-8?B?aDc2eWdCQTlCakRPTnFCQVpmdUgxUXpPanF6V1JXa1Y3S0tZbDlKYmVjdDI0?=
 =?utf-8?B?N0FHTytZZWhjTWlPZFdGVzFDTk9rSHlUdmNYZ3N6bk9PSFlnWFByQ1orR1NX?=
 =?utf-8?B?UUY2U09laVMxNURTZGhWa1hjenUzU0NkOWxqc0pIcU9qd0ZrWEY4TlBhb3Ns?=
 =?utf-8?B?aVA5V0NMVjZSQWU0bkM2WHJmaGV4czNGZzZmWTdRZlhFeWQrd1o3dDdKaWpG?=
 =?utf-8?B?OG5rN3V0d0g0NGtHS2dSMVh2aUJlblo3MUJRRVRZS2ZhNFhmZmltRGtNeXJz?=
 =?utf-8?B?d0t4d2xXNzZKWDFFbzZLOWVyMG1kMEZscXFKTkJIemVNU0lxOEN3aDYzb2JK?=
 =?utf-8?B?SXdZc25rVUdrR3NOcHZOUDFldDlCN3lQMGJjLzQxRnZkdUhBNkZ1WUJOSGJP?=
 =?utf-8?B?UEZXT1Qyd1lBenAzK3RzRE9iLzJkaFB6UkdpZ1p0M0k2T1lhNnN2SENOWDdV?=
 =?utf-8?B?VkUyS21FSVBjMWxpNktvSHVkRytmc1RDQWRFK3d5VXNWd2FmTkVWMk1yK3pw?=
 =?utf-8?B?NUNEUE9VcnNFRlpKeXNhNklBOGNpbGRKMVBJOGh5MWl6WXBXOXUzM2pNK1Mz?=
 =?utf-8?B?R1E5ZlREdGNpd0FQNk9DNExkbXdYUmc1Qk1nZVZ5QkZnTEpYR3Y3Y2JYWHNX?=
 =?utf-8?B?SmJYOEJlNXpLZGNzNTdKY3JLVWhRcisyOEpSSlAySEhlVVM5SVdibGREZU9v?=
 =?utf-8?B?K24raUJxY1YvTW1nb1dFTzZIQmU1VUNoOXB0ZHdzNUNoeFBIKzh2UlorWWRv?=
 =?utf-8?B?M2xkdlF1MTJ0dGw2U2twTzdyM0xDUjhZV2NadXZEd2d3QXlyVkFHV0p6ZnB5?=
 =?utf-8?B?Qzd5YVRGYnJUWnZKc0plM1h1d1UwVzNvcm1nQnBIN0E4dXVGUmE0RVQwcEx1?=
 =?utf-8?B?c2F3SVU0b09FS2gxU3c3ZktkOXA2a2tza0k1MzgvOVA4aTNYNHRJaDdOWSsx?=
 =?utf-8?B?eGZuR2FjQ0gzTWR1bjdKc2hwc1RjdzlMNmk0Q0ZzbXY2MDR6dnNtSkE1SDJl?=
 =?utf-8?B?eEZ1cE5qV2J5M0gwWTdSRWxDVU1VSEdYbE9FRjZYeXlNK2NZU01vRitJUmFC?=
 =?utf-8?B?RGVrZUh5SmhaUTdyOVJGODZuY1cxRDh2cVNWd2dwT25mL09HWTRHQWsydmlo?=
 =?utf-8?B?UkhMeTFLaVNEcVpxMW9QVDZPaGtYaW56TEhpSFNSbUgrL1RLd0JoNUIxb0J1?=
 =?utf-8?B?d2U0Si9CMHhBOGxFMUhqTWZ1eDZQY1ZneG9ieTIzbjBOdEJlNTl3eDZxWnRN?=
 =?utf-8?B?OEpMbFdabE5QL1dFc0dkMysyK0ozeHk3NEdJZFBwSWQ4NGJCR0dNQjZ6RW1o?=
 =?utf-8?B?SlQzTEM4VFhJbmQ0QTFRbGdpemkzZ0lyWGRrSTRwOUd4eUFtOXhZc1U5cEFJ?=
 =?utf-8?B?bzg4U0ZHRkRiUEl2Smd1NDdPcnJYYmZFN0p2VGoyTkRLWGpkanEyTjR1QTRl?=
 =?utf-8?B?Vis0QlNjMnQ4Y2JQdFNiVWdUR1AvdmpVVHUvSXB2cjA1a0VKQ2hrNjFkakhW?=
 =?utf-8?B?VUJNQXZPOXYvdjJjd1dkZDNNbmJVcHFvRmxESFlabmFMVU90aXd0c3BjRHBE?=
 =?utf-8?B?VkcwYmFWNnhpOWxsSEdTdWdkODdwRE15RnJ6V0QwSjQ1U0JzMkVPNHVYZ0ZQ?=
 =?utf-8?B?aDVyR3J6TCtlaWxPcjdWSU53M1RWa2xIb09DWXQ2enFPS0tVNU8rRXVVR3N5?=
 =?utf-8?B?Qi9qamJJVVlSSTE4b2NRc3Z5enBEeGJnb2dleG4veEVzQXV6dlhUU1RzQnpL?=
 =?utf-8?B?TExyUndhV29PT1BDaG5OOWp2MjVGdUd4OFhnTi82MWRBdHR0MHRkNzFvUkd1?=
 =?utf-8?B?cWlCK3V5aytkNk9MZnBiQ1Boc09LM1hIK3MrS0d5d3J0SFpwZmQ5b3JBU0tD?=
 =?utf-8?B?UHFDVjRhdUVLN3ROVGhjWk9jV3hKSVNSV3ZlNEFNcm9jc0VrM2xCRFl3b2pY?=
 =?utf-8?B?YnRYUW5zc3hBb1BIdER3NnVxSUFHck4rVUliaWxmRnVtbjM1WFNVRVd2cndS?=
 =?utf-8?B?dmNkdTE5VzkwdTRFWjIyTEp6ZVMvK0RaRGFKeTM5SFlPdzhWTWJjQTNzTkR1?=
 =?utf-8?B?eW1lRjEyejVHZ1J3WmtVT0hIOWxISWlPTUUxRXBkVTh2VHdwbHNBQ0NmcG5k?=
 =?utf-8?B?Z0pMV3JGZk9ZRllyWmJ2UDFlSWpEUm4vWk5RQUpGZnNDWmZvT3dVQkVMaWZi?=
 =?utf-8?Q?6HUXO18C+RUVWgoYcGv8oJ7m6aDOlErnooxUJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e37565-828a-4476-6ffc-08de4fdd8af7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 00:16:47.2449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvcidzuZlj3oiTgBBwymnisVpKuOvKEpzI+CM+J/S3qY2t0AJ5HwkPo1dwr2gPzjfiid+sLO+O6d3Fy4sxoA3Nz5nc99A/X/hpG1C3ajsZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Thu, Jan 08, 2026 at 04:05:54AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add PCI device detection for System Controller capability
>and update build system to include System Controller
>components.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

>---
> drivers/gpu/drm/xe/Makefile       | 2 ++
> drivers/gpu/drm/xe/xe_pci.c       | 2 ++
> drivers/gpu/drm/xe/xe_pci_types.h | 1 +
> 3 files changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 2b20c79d7ec9..947fbcac65d5 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -121,6 +121,8 @@ xe-y += xe_bb.o \
> 	xe_step.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
>+	xe_sysctrl.o \
>+	xe_sysctrl_mailbox.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
> 	xe_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 91e0553a8163..b6dc3030b673 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
> 	.has_soc_remapper_sysctrl = true,
> 	.has_soc_remapper_telem = true,
> 	.has_sriov = true,
>+	.has_sysctrl = true,
> 	.max_gt_per_tile = 2,
> 	.require_force_probe = true,
> 	.va_bits = 57,
>@@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
> 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
> 		desc->has_sriov;
>+	xe->info.has_sysctrl = desc->has_sysctrl;
> 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
> 	xe->info.skip_guc_pc = desc->skip_guc_pc;
> 	xe->info.skip_mtcfg = desc->skip_mtcfg;
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 5f20f56571d1..53e44a32883d 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -56,6 +56,7 @@ struct xe_device_desc {
> 	u8 has_soc_remapper_sysctrl:1;
> 	u8 has_soc_remapper_telem:1;
> 	u8 has_sriov:1;
>+	u8 has_sysctrl:1;
> 	u8 needs_scratch:1;
> 	u8 skip_guc_pc:1;
> 	u8 skip_mtcfg:1;
>-- 
>2.43.0
>
