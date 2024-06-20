Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9795C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 10:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852F310E2D1;
	Thu, 20 Jun 2024 10:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akLadoU7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78BC10E2D1
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718878036; x=1750414036;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RYrNEdsGoY6IrlGIOEwwRVyRPxXwu/QjmeDiDWIOtPI=;
 b=akLadoU7Y4Xb0+5qSyygqY2hQ/BY2mgPoEIJtK74xKlJ3oHs7ps0w2rP
 qKqUQh+nuynHocqqTEnHDT0/0qnHS5jMGY6HFNk12ZNpR8loqfJ7Rrw2O
 H4thR5tvP5Qv1J5fI10UaQ8VUwI0OIToCPpf2BHObEe923Ja60iE48SbC
 YooYULRCDDJ/zSvuodVGkpbjU5W/cG/W2H9BWRL9OoUHFc2xrmFTJJ/4j
 nMizZHzNRF2y+T7+DO9i3zJB5mTb5++sDr/7bnaQ0RW/OAgRroYwbG8jJ
 LVutHHZNGYJqHXC2nUfkmxX3fRid88VFgkEq+au/txyl7O8wpgTWqv6bx Q==;
X-CSE-ConnectionGUID: ZvZOn8B4RLugihUhk0dXdg==
X-CSE-MsgGUID: RsSjyxfzTNmKMr7WpRf2cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19619823"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="19619823"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 03:07:16 -0700
X-CSE-ConnectionGUID: w6H91HUKRUyq3S8x/RPNaA==
X-CSE-MsgGUID: zp6DoK4/SlKh13osg7nJ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="42051470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 03:07:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:07:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:07:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 03:07:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 03:07:14 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 03:07:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kyu1JlRV1Tp1Q/tuUMLrxcH0lmxWy+a8NyTFTQhlyoLBMUP2lebnZIK++PJS3g6Ac/BvdVfdRQE0GB6qWjt9e4DTylrHWJi6a2gRpLbDF/fAYFzHiQfLHai+nYFsgs1jtDx7kwQMyo34oGRWDJfuN1BIYTF9IzIonuGlBug3tuHo1ge6Idgdx3a64NNf0gzayZZGftI7lFG9zDMrVa1qSSgwi4HZ2b5HF6LXu5g5ffsvbcXePR1lW5r0zsXSEwYMauFuv46gdI3X5IBjnNt2gEZFR9VWJl7OVRlAnScb3B36F9czhpzlFqibhPJbGtn83p0EEt9p0KmmUS6ipW020Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYF6DfrbgtGGJ/b9RbloKLy5e/UO4+6lyPJUsk9Ih8I=;
 b=jN6/4ldS6G8F5cA3yuEifofEk3SkmOfvueRBEcJSqlWYpozGiwhjMA8oXPcK2ANqTFXuOZYCHi05qJOKV314HOPvIECcUVvnCBn8ZrIpAUKkdNM6JhH+0wFnJgkwbqJHgKRWthqlYfHjGRrP0Voo/2uuxmSl7wIakqU3f4NoW0XsOA1rExUEIM6qj2Mue8WbEmwQ3OHzgjT7jUe2BbfE1UAiSLSfa4gAlXAFqREblr+lBP7oc5q1mKflxrwSDiNvcxRqLdWaGmV33KEri5kNINo2CqJjRiZ3ZS1YmF02tmiQms/2Gso5Cz30uzujK42aBVBTm2ncB56yLK2V6qLysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 10:07:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 10:07:13 +0000
Date: Thu, 20 Jun 2024 12:07:09 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] drm/xe/vf: Don't use register based TLB invalidation
 if VF
Message-ID: <20240620100709.pecoygx6aezbhlcn@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619214557.905-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR07CA0271.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::38) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bce6c06-36ea-47b8-30a0-08dc9110c15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nmxad1psaU13cEoxOVhGRStCREpnT01uRCswMTlCUGtlb3lPNzM1cDFYbm9Z?=
 =?utf-8?B?d01xazhwQnZ2QXZIQlMybVJ5b2haQk02MGRVME16V1RvZUFPYld5WE1wcXVz?=
 =?utf-8?B?UWllOUlkT3MxQ3VOOEYxeGg4dkxIcGg3ZEJtV1dxVkhVWC9zWmthZFBvRVZz?=
 =?utf-8?B?cklWUVpQT2ZqcFdZMjRjYk0vOTZJdlR6MkdNK25WaU50ckYwMUwrZkQyNUdj?=
 =?utf-8?B?ZDF4UXhXaXpPaWg5ZmxGU2dxZytBcmkrYWtIM2tocStSU1kwbDIrak9UZk5L?=
 =?utf-8?B?V3RZbFBRS2ZXMUljRnpOajdvL1B0NUc3SlUxOUJlZTQxMTVpYlliWnR6MWNT?=
 =?utf-8?B?RFRpWGx1MHZJVWxFQ1k0QXdBSy8vdVlJbEUrckZnRExsU3RVbXhRVlBqQWYy?=
 =?utf-8?B?emVJQnF2QjhsWFFBR1VYaVk3V1A2bXhNeFVETDZuZWg2b2ZkTHVtTE8rWTFa?=
 =?utf-8?B?UWV0QUNrVmtBdFVQWjcyUktiYmxHaGd1QUtNNnFDdUMrQ2pFWU9hWEp4NCtS?=
 =?utf-8?B?dkFZZXVkTCtCSnJ2dlRocVJkTVUyUDRjb0dnSVk4T3JBYk05WlB3Wk5NVUFM?=
 =?utf-8?B?Tm9BUDQxZEZYN1h2Ui9JMm9aWEJ0QkdITUpVUSt6V2R6cjYxOEl0L1J4M3lR?=
 =?utf-8?B?WURnYXAvcHVUM1lNc0IyWitsYllNVWtNVUdwTzBjTXN4clFVK05BZTlabWlt?=
 =?utf-8?B?UWE2aUlqSCt4QjZET3VaczZ3dHpyT2h4eVlscGxqOVZ0aGNXa2I0NkpoK293?=
 =?utf-8?B?MGsvZ2Q5a3o3Q1p2R09xU3FoeEI1V0NQcE4vaWhOZTNZVmo4cEtyL0Qwd1Qr?=
 =?utf-8?B?RUxLWnNuZ0c1WkVuUEY1S3pkaS9PKzhVMmxBTzJITXcwdEg4MHBYSG1jSGgr?=
 =?utf-8?B?ajdJNkRxM0FpM1lZN0xNT0R5bERrZ0JSNVR4MjlYV1d3cUtzczEvTDYwZHVH?=
 =?utf-8?B?bmowYVZ1OUpYUEM5dHhZMklCbTZHWjRqdXBzT0h4ZVY3Q3dNRDdEZnE3Yzh2?=
 =?utf-8?B?bGdrcjBKbkVOSGtFbEFQWm9vZWpsODVNdVM5TktnTFBiT1d4aktlbFVIeHhI?=
 =?utf-8?B?MUJXMVpNSXJsV1pnVC9vaFFua3kyZ0loc0Y1Wjc5YWtubTFKMzRJaElzQVlW?=
 =?utf-8?B?S0ZDY3hsdVhvUXN5bm9sSUhPWTYrb09IYXRWL2lBSjNXRXlOcUVyZzZwV3JN?=
 =?utf-8?B?c256VG84bkNyc0N4eGF1Sng3Rkt5VFdBcUprbWVDVEFSZmw2clk2MlI1YlNB?=
 =?utf-8?B?cVRFV2hMZXVGSVZaeHFENU5CSGFCNnVRWWVlbDF6VDJlSnE2VzJJVCtHNWR3?=
 =?utf-8?B?T0RNcUc1ZmdqbWxvaDJsZHJUTmgvazJycW1zWTRnS1J3T3RuN2pPWmNIOUZm?=
 =?utf-8?B?MVJ2bW1BSXlXUkkwazVPWWEzUTdVUVBqS0J1NTdPa2VPYUltQTRRMmZLOGVm?=
 =?utf-8?B?d3ljUHpGdWIvQ2FJWjV2MmF3UUNKeWRIUWxEZzg2QTNJL00zVUZOTEtlL2hO?=
 =?utf-8?B?OHVSWloxZll6VkJqM1FVbENGdndzcC81NzlVeWZXakhRcnIrQlFIYm1GOWln?=
 =?utf-8?B?ekpJb0ZJK243Q2hmZ09vNzIwNjg3UTVlU2VVNnV3UFFwdFRlRUhBNFREdFpq?=
 =?utf-8?B?TTdKNlEzSTJyVXhmYlNWYjJjazd2YmE0NmNsQ0VUVitBN2FvQ1Y3S1hmY2dT?=
 =?utf-8?B?VlVBdFdRdWw4VGlDUTNDa3FFR1Z2NW1NM0IxY3B6WUoyQVlZUTVXdk5LZ05M?=
 =?utf-8?Q?mvXejtuoyAwSQgNi0awM5x35sUXIPi1ZNkffjF8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG13ZTRQcEtaODF3UHFseG55YmxJVjR5Q3lDTDhEK1JzN1dMTlJNWm1CMG5x?=
 =?utf-8?B?Z3VQY2hpV0dvVGdxWk5lRmY3cWNUNGpYdU5HeElaNXNtT2tqdkhvNkNCZlFs?=
 =?utf-8?B?ViszblJTVk5LeE85MUtWOWx6eDQwa1NSK2tGMHcvUVhBb3ZNdlNsY1BncXRV?=
 =?utf-8?B?N0ZUcFBYTEs4bTcwNlczYllnREc0OVhBaVdmRTE5Ukh0Ulg1RDlhZzdpYmZT?=
 =?utf-8?B?UUZKSXEzaWpJNEVIV3NmSXYvTi9waE5SUW02RzdRSzBFV1JhRkRuL2VmQ3py?=
 =?utf-8?B?UUdhVWEyM24xdDVRMHlyS2ZVS1ppOUZ3S1gxTXBoL0FVUG9xd1Zob0kzenM5?=
 =?utf-8?B?N3VIeGZIdmJzY01GdktBUGplblpjM3h0QnovTDNGc0hxcU5obDJZY3FUbXBk?=
 =?utf-8?B?a003d25OK3puNlB6YkR2MHQyQWc2WkYwRmxrSFBSeitabHVtNHA3TVdRMCsz?=
 =?utf-8?B?cG1FSW1pTmRyeGdxbXFmRGJncDlQQWMwRUlRZmJsc1pSMm13NW9QNnJxTHNk?=
 =?utf-8?B?RjR4ZkhyNHcwZ2lLeDFrZ2tRSllZUG0vMTNzVC9xZTZCcnZOeWU4R2FpQldU?=
 =?utf-8?B?UzNmeWc5SnFEVUhwdUR5VTd1Y3RRTWpnWkd5bmxkaUUrbEZERmZEdlBwa0U5?=
 =?utf-8?B?dmlRelgyTURQNTFIaHRrUlBCUXR5Q05Pd0dmOVpQN0UxQnNUTEtseUlyS2F1?=
 =?utf-8?B?MklUSmNqM0lrNk5HTENPTjFnWWMwSXhGbCs0V0EzVHNGWHR4MS9LY0NFL2ll?=
 =?utf-8?B?WjNrbUZhMDdMQWwzZkVNU21SQ29WVHNvYXZTZzJJaC9HSEhmNzR5Y3Rmc2Vu?=
 =?utf-8?B?UlZubVAwOHZjSHRmUzNuanJBdlU3dGhQVjhYYUdzSFQyakxMU3FMT0JJbHhE?=
 =?utf-8?B?T0p1Tmc0aThWRVlNektuNWcvQ0lUaWxJMUJmTEF0RTIyWW1Ed1Nwck1zTXFq?=
 =?utf-8?B?NEF5ZmlZNWtHMGdSZ2xIQXBIVjlYM1Nwc2djRGN1MFViZ1ZocDQ1SXpyNnVz?=
 =?utf-8?B?QjAxOTdtWEc3N2c4c05RZEtNMVdTWmUwTUMvN3BzUDZYcklyY3VialpPME1n?=
 =?utf-8?B?cms2Z2R6UHRsb2FSYXV3Um9DbkduUVB0N3d2ZHV6S2NHNyt2d0dRUGFUQnBH?=
 =?utf-8?B?cDEzSWpERDdYSlJzT2VrSlBueit6dk1VNkQvRC9ETjNVZ2gvUlFUc0xyM0NO?=
 =?utf-8?B?Ylh1bkdnRE0zc1dPQjI0RzB3QlJhVFVjUGx4S0tJVlhKZitweEM0eGF0SmxF?=
 =?utf-8?B?NjFlejczb25EL1VKQTVScXBXZE8vZUxoMGhsRlVpVTdDMWdqc05YOXlUQWRR?=
 =?utf-8?B?b3FGVUUwbjEzTFZ2cHY4d1dKZEZCQ3M1cFVmMlQzZmxGL1Y5WW5CcWNSc1Fz?=
 =?utf-8?B?SzdGTUNmdnRGTVBmNGlkaGExbmNJLzA2bTNMb2hIanExdHJiR0QrTWdmY2dr?=
 =?utf-8?B?SWtENGwzZGl1Z3pDQ0oveFIwNHhndExhN1pPcy9BcWNyT2VnMTgycG9JMUg2?=
 =?utf-8?B?UmpkQWVoMFJ5ckpQK1EzVzk3U3VHckR0ZUNLUjcrZmI2aUJ1OEV5ejl5aFRa?=
 =?utf-8?B?QUI3cDUwRTV6WlQ0QlFsYWMyQXBlQzRBSDlNZEFtUWllWVB1djhoMjhDbzRS?=
 =?utf-8?B?S0ZsZnpyb2ZCNkJpVVMyOUxCYldONmtrQ3lGQXF1SmRjSWFKRzA1MElBWXBX?=
 =?utf-8?B?T3hDUEY3aHN5d0c3QjdwYkUzREJOSm5rd0VZVzkwcUMrRG1FRlJZSzdhb1Ry?=
 =?utf-8?B?YWNCbTJFd0pCQVliU2UxZUJZNS94TDNTYUgrcUJISXR5UVhjaDFid29UbHps?=
 =?utf-8?B?Z2lQWjNLQ1RzM0cwNGxKTjB1OG9oOG1QMmcra2VlUnRaKzhsMCtDZ2dzVnZs?=
 =?utf-8?B?cVJoMHY1dXdXWXJ0UWE1UFJ4bHJLbE54K2hjVjliMGQvQ2xUVUgrVE1vRFhh?=
 =?utf-8?B?U3ZwQzJQbTZVeHNNZ3F3T3YvRWQxN2J5UjA3Z2k0VnBkL2hLRWVyRHhxU1RF?=
 =?utf-8?B?aXExK2dUL1pHc0dOZG9RS2czc01IWjNtOTZWUWZVanVkTFgrWWtkekQ1aTV6?=
 =?utf-8?B?Ti9ZbGlMaWFuVkl5Umx1bWpMSVdRSlZ2amtrU0tnVC8xdXlQWFYwUzBnMnJh?=
 =?utf-8?B?cWhwRG9CTWx5ZGxyVDlYaG9kdG5KOVV4R3o4OHFYVlNhVnRxdWNNTStGYXpC?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bce6c06-36ea-47b8-30a0-08dc9110c15a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 10:07:13.0134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ncw3YVg/1snbudGhK4K8ZGhS3MIdrR1zHeuWZ5s351H+qyyWidIeytxSMzXqaQIu47vUH+qgz+dfFK+QLZ7EHavCIiw2ajBHpbvN3z/3b1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-19 23:45:55 +0200]:
> VF drivers can only use GuC-based TLB invalidation, as they don't
> have access to the related registers. However, VFs shouldn't need
> any explicit TLB invalidation before enabling CTB communication,
> as there will be an implicit GGTT TLB invalidation issued by the
> GuC itself as part of MMIO-based action handling.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 23d397a246a8..e1f1ccb01143 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -13,6 +13,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  #include "xe_trace.h"
>  #include "regs/xe_guc_regs.h"
>  
> @@ -249,6 +250,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  
>  		xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> +		if (IS_SRIOV_VF(xe))
> +			return 0;
> +
>  		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
