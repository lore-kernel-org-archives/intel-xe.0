Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CD5C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 12:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EA410E6E4;
	Tue, 21 May 2024 12:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igbUZ/Ig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D75B10E6E4
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 12:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716295486; x=1747831486;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gvjC6Q/Evi8vFMXd5GM1q/MQB+mf5vUnv43UJJZoC04=;
 b=igbUZ/Ig20Fxm94lyshDaqQYeJ+yBeaL28+K4hd9e6TTCc+vN2EONY/t
 4eRiSj1jOaJ8rxDBww77TeOlXDoPvnHNEIzPb6TyKfglP7AOop0kTpT0j
 nNd+dPxIYn5hse00hBNdc6y4og/yNEhCk6xIsihFm+vwShzGbfbfwiCn4
 iMOmAHnIggbv9uy3TOWXQHdB+BhHI5OmyFF4Q65LxdC5PymxUM1bwcETB
 7nd4h0OT0Zic5PFmJwWhpqxSnXWH7qFX5OyfeBqemv/RQwybhNPICXQl0
 rY1Kx4y3nVXPqFgqUJGowo9wbV02pOgQ6Z1/n5Nn2VXfXBvO17z+hsNqa A==;
X-CSE-ConnectionGUID: hWP+rSP+TuiurP5GCYxsGA==
X-CSE-MsgGUID: ilw1JbNjQAaGrZLPG5ekUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23621428"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23621428"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 05:44:44 -0700
X-CSE-ConnectionGUID: Xoc6z3XCQLy0JmpZxQw27g==
X-CSE-MsgGUID: fxfjGIU4S8WYlAKLMIWqhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="70329224"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 05:44:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 05:44:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 05:44:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 05:44:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 05:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy8kPJfycGIGd+c1l8LxOgd7orMhMzxTQvT75edSS40eRSm+IT1WTsVlkNElXgh4Po9S0vPjwqo93Ge7JyiqqJ43Lf0N/WR5gAO4LUHD7+JY2ldTf2zv+PKrxStaAw1Y+ay++jrshwNnHD93lwnQxbJnzLO3UezZmq930T9slaHYImMq0bEZ1B5FLwldpx/wSnu6n1ewFypLp7mFkcG75Hf8VLa3VJ5q05q/dVGu/oHpngQEwBydYnyqAxZ/tGAWvnFChBNYcyr5m6TBZSrZaaCE9Lo6dsA43E+NtimbhPmv0J/hF7QNgXRN+LHh2eydqN8UC3ftxMS5Mk/35HUT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=up+nOqqNeoHlegiv78XTKHJNOoR6EA5en3gOyie0z5Y=;
 b=WL1hadOdBRSoEr809qhPvzhyUfGXUn6kdXCOGiYm78kKXLFkkVe8hwPZuDBLp85I9vIL3iy4Wc9fpUNR2/TlW7qJN3bQggDEOJHQRJjrrw9XqllkCDHvH2jKZziZEiNskDV65+BMx376bv89pzgFCxCo9LPTyhTZiNUWSnwLN2PLC16Vnkw+hQHbtU92YIvSQkU7//u1iyTLrIAepEosJ1CoRXNHcxojEYCPqbf/Azxlo+g7jmfJ+5Jprxhh4tMmLzvXXyC2Od/sH7ghaV65rDUVkWNpsDcIbeVHTplAvgggYKXh3FhoKhESUqbydtcUWYgOOoMItX49VfVFWV/ixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ2PR11MB7455.namprd11.prod.outlook.com (2603:10b6:a03:4cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 21 May
 2024 12:44:40 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 12:44:40 +0000
Date: Tue, 21 May 2024 14:44:38 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@Intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/vf: Custom GuC initialization if VF
Message-ID: <20240521124438.zdoewruk3im2emz4@intel.com>
References: <20240521092518.624-1-michal.wajdeczko@intel.com>
 <20240521092518.624-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240521092518.624-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ2PR11MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: 4efc3935-c110-4e1c-dd49-08dc7993c809
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2RxVmR0U3U0R0pIM0xJWDhSa2YzNDlhNlZCVDVGODY0bnVzc1A0MzZCSmdW?=
 =?utf-8?B?d1ZMMTZyeENsTGN2cDc2VGJWZTQ5VFBCQzFiUTdkc21wdi9BWlNibSttaHVt?=
 =?utf-8?B?WnloWUlpcG9zc1pTKzVQZUxsaXExV3hPeThjT2JBZnUxUlBMYzAyVngzN2JE?=
 =?utf-8?B?MlJXVGZOWCt0YW82ZUFIbjdJRFc0cThJTjVLRllHcklmVlNsVnRpLzYyZUZC?=
 =?utf-8?B?VyttUkxNam5vQXFVYzR3ZUlkNy9tMHRXVFdhYzRUQkJ4S0hrdUNQS1B0VFRB?=
 =?utf-8?B?UTFFZUdIYk5md0V1N1ZObWZIV3U5ZVlFV3pqeVVsNUJkUmw0TmpMQkxuaGRk?=
 =?utf-8?B?eGllM09Cc2I0ZVhzZDdrWURMRXFxc3pSVUNvWHVlWktIeDFJdkRoY2Y1ejlD?=
 =?utf-8?B?eVdycUxpOExkeDByaVZ2V1lFbzBscVVtZ1pka0VFVEl3R1YyMkFzb2ExMVhZ?=
 =?utf-8?B?RkxaQ0pQSjNCbE5uYUNVdlNaRXVUYWRGM2UyRlRRZXZqYUhzNzJLbTd5NU5m?=
 =?utf-8?B?NGs1bkFuZHFBSUZmTm56WHlDV1pIRW9OSndsSUdqd0xNVVlQdGF2NUdUeVhC?=
 =?utf-8?B?bWYzYXNqZVl1R0VvbFVKSnBJRklidTZGNGZNUWVRRENHaUhkdldtUXRFdVJS?=
 =?utf-8?B?QlMzaDlkbWpTNENIR0F0YkxaVmljVDBKcEd4WkVuZlBFd04xR2dXUGxTM3Jp?=
 =?utf-8?B?eEMvY05xZzBKWDFGUFNlT3R5M2c3WFY5ZEdYWmxERGVWNHg5R1M2NVpIWFBQ?=
 =?utf-8?B?bUxIb09SdmphaUxyS3A1NTJ1NHZRNDI5enArQXZmbXJ6anlnc1BXM3QxY0FD?=
 =?utf-8?B?eThuY2ltK3hzUFFNMVBHaGUwa1Q5aE9qNVhNRVNUTnZ6Sno3dlMyK0VKYTNi?=
 =?utf-8?B?T0Y1KzQ3T1NvRmdKSXMybEp4MnFRYWVOUmdPL3h2ZWJLMUpaVjF1eE1vcUpK?=
 =?utf-8?B?U3d4WkQ1aEJXd1oxeGluNENwbkQvOW9DZzdSRXgxeVQ2bTJuWkJ4VWYwVjZ1?=
 =?utf-8?B?ZDVFZmV1ekQzaGZRQmZJNXpyeTNxbm51a0lMRHU4UnJUQmtWZ1dFb1lXVWU0?=
 =?utf-8?B?WXI4SEhqcXd3a1didkQ3Zk1YLzNwaXRkWTFXenlrR09TL2FyZThrWkRSR1VG?=
 =?utf-8?B?YmlHd0VZeGhXREVKMzdtRkY2cmREaHZrZ2FIUitxTkJseDhwbVB0b1VDR2J1?=
 =?utf-8?B?bmpxUmFlU2pKQk9UN1QzRm9UOUFjZkRDU3diaXZSUksyOVc5YjZwNG9FOC9S?=
 =?utf-8?B?WFZiNmFubVB5ZWZUZHExNFpNcGoxZEVIMFJNR3phSXZnU2h5VEUwQThoa2pG?=
 =?utf-8?B?K1JTTytnVEg5Z3VuL3R2TTRaMmtiblA1YWY5NExGTXo4Z3VWaVdKQWpIenIx?=
 =?utf-8?B?dXJNNWRIc1ZsU0J5aUlaTnJ3VE9VUHd4MDBrT1BzMHErQVZHZkxWTGJudWRx?=
 =?utf-8?B?SmZOZHNNazZvWjdvN0ljOHlvOFp2dlVZNFk2emUra3luYkNoMkd0ODlnQW9y?=
 =?utf-8?B?c0plbmM0empQWlNmZ1o4dWoxbVVPOG5tNEdRUm5PMisyME1TVUx3TE9Wb0hs?=
 =?utf-8?B?NFVaVTVicVF2eE9sdHBMRFNyY3BqbUxCUzBoODBLSTJ4YW9MZFl3d0x5S01B?=
 =?utf-8?B?VFhDSnRaVzdMUW1pSWl3WlYzWnFRQ2xRNTJJTTByUDdzdVBhV2JiTUw0R0gr?=
 =?utf-8?B?TEdVR2Yxcjc2OEs5QjVQZkNORnZ4Wjg1THBiY0ptVlU1SDQwU1BNSVZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUhoRTFhb20venFNZU1ZTEpUOWVzQXI0R1oyby9sVFR5RXJBc1UrOXRGNEtZ?=
 =?utf-8?B?bzZ1SG1ZUjZpZXJ0VkR6ajRKdmExOHRwT3lhVXdKNGhZTzJ3V0t3cXg3cmJV?=
 =?utf-8?B?UXgvT3FhYm9Kb25mWEdaNFJuRVRCZUFtRE40cThCdmlYcmNHVUFsdjdmSnFy?=
 =?utf-8?B?MXh4TTMvdm1uZ1o4VC9YV2FKQyt0ZVkwUWxnK3hBekM0L2JmbE5LelU0WTcv?=
 =?utf-8?B?SU4zRGVQdGlYT3JxZ253NkpueG9sempsYnBNcHAzT1IzT0lJUUxhUDFyWXhw?=
 =?utf-8?B?Q3Zwdy9EN2hQZFJRcFpKZEhjRVNUNmc5REhXTWRhWlI5QVMzc0pBMUtaczFO?=
 =?utf-8?B?cmhEUWd3MkY4UHpMTTFUTGY2RERONEF1dFQ3aEM3SHFPSEQ3aGFmQXdYVlRU?=
 =?utf-8?B?bDJaNlJ1eUlDN2R4NXBHZUF6OWdXdHMzcjZZOVc0TGduL21oMU5HQ2xFb05V?=
 =?utf-8?B?NUFJT2Y4Yk51aEt1WUZUR0ZPMXNwbm5lNGJ4a0sxYzRCOVJqMFMyRy9yajZL?=
 =?utf-8?B?T1FObS8xU1IyL3pqV0hkWWFndzhpZHdvWk5OR0JOc2dPZnZpcUJ0Q1M2YU1I?=
 =?utf-8?B?RUQzSStlUmNieHlDRTV0Z0VPaW5oNVVmYlRQV2w1TzNta2J5ems1bHlvaGlZ?=
 =?utf-8?B?TXp6SDRzb1Q0Rm5GWXlVTU5vZ3UwSkdJZ1JIVW9MRUtkTWhJRkJERG5pcEZt?=
 =?utf-8?B?RlpaNGZ5UUZHMnc0dWxEbGdySW9FK3llbno3ai9LTlIrcFBOcDZpakExNm5a?=
 =?utf-8?B?cVFPT1kvcmxpZmRWd3RXSEo3MTBhVFZmczlpMVJ4R09XRnhLSFZxVC9NYXph?=
 =?utf-8?B?ZXBtTEJ3TzZVVEgxR0pCWjIvRGw1UHpuUFBaOG56Wi9VV0JMZWVDN3paa0FK?=
 =?utf-8?B?UG15RmxOdVhnSnBydEd1cTZmQndXMXE2a1dTdHBnT2F1Q1R1OC9XQWs4Tkcx?=
 =?utf-8?B?VzZhdHpDclBONmUrUEl4bDBNOUpMYU9DMEJobkFnb0U5YmFuaWFRdzErYXpY?=
 =?utf-8?B?bUpFeExxcXB4V2xZZ2pLT2cwMWZQaHZ4NjBBMFJscWxETFljZFRQSkZzUUN1?=
 =?utf-8?B?YmFELzhIWDhQZWgranV6bW52Y205RjlDMUgycHdhSHhLSXUwNFoxZU9QZGZH?=
 =?utf-8?B?VkR5VWpjNStJZjNlL1BGVE1KTHRudlBPeEhOQ2oxMjdtUWQwN1VXSTZFR3lq?=
 =?utf-8?B?cjdjTi9MdmEwaFpKZm8wQWFQNDJRVnJSdXNzUk5RWmFBYWVyUjlaeVBkUUtk?=
 =?utf-8?B?N2xaWExySmJhRzlVV1FEd2cwcU5WRVlnbXIvSGRCR3YxSFpiemtQcWFjQUNF?=
 =?utf-8?B?VGVNU1hvRTV4V3JXeG04TFBZdUVRcC9wcDNvTzFHbHY3K08vU2hSRmhLajhX?=
 =?utf-8?B?ZHhhcnl4T0xYU013MFZqQ1E1VlNBcmE5Y2lUWkloN3hHZEdpdmtsOGFjNkl6?=
 =?utf-8?B?cDRWNmY5S1pwVE1pQ2xvc1ZWbEQzOW5iTE1QbDBlUjVtN2syQkp1dVJSVGVo?=
 =?utf-8?B?clk0cGdHa0ZwR1phbEN0WnJheU50bE9NeVRMWE42UUd4U1ZFcjhEYnR1VmJz?=
 =?utf-8?B?VERPazRrcWM4TVRNNWozN203NWpHbEFSQTMzTERrZTB1WTAydVhsRVcrSzRl?=
 =?utf-8?B?UjJOT05QRDllSStxSlFDbjk1RCtENlN4TU4zSERqSEs0dFBuU0NTQzR0UGhl?=
 =?utf-8?B?WER4YVp5ZTdQdUtlcFNoSXZVYUpZVUU0K3AyMDI3VUU2RDVyNFB3K2xkRUJM?=
 =?utf-8?B?V1BHR096a1NSdXJwVUo2VXo5bm9PbHptK2dEckdjUldhMjJQUklsWXorM1ho?=
 =?utf-8?B?aEFidjNPMWRKRGMzbkhYZ3RpampibksxUitkbVhxQjhicE1DNit0eTZkNGdm?=
 =?utf-8?B?RXhzZkQxRFZiaG5Oa3FNeTFhcWdhY2F2c1R3ckVreWsrdXJPWkRWZFQxR2lr?=
 =?utf-8?B?N0NOVWRQMFBiNTJRNjF6cVNVR2U3S0dTc0xwWjJzKzRVTFQycEVJUURJVmw2?=
 =?utf-8?B?YnhLMDd6QkdFZnQ2MWtNNTBWdUxOb0lOY0FIOWZKM0c1Z1Q0WTNONTRxY1l5?=
 =?utf-8?B?Q3hYaFF4MnpGSXdTNmozVGlSSXl2Z0lWM2NoMXZqc2ZtRytlVzhHanoraGl2?=
 =?utf-8?B?L1lGYzJERXBYOWduZVJ1eVhzWGYwU0M1dG14SFpVejVMdFRnUGVlbmdnYWRH?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efc3935-c110-4e1c-dd49-08dc7993c809
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:44:40.4288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD/1PGlgJh/6GFbcZJfx9FVGbN+OZDrihIbMu5VTAeofGqDLhmEFxtkIPI89xW50taltXLX6uKplORr6IL7khap097xeP03cDhLaV4G1xRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7455
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-maj-21 11:25:18 +0200]:
> The GuC firmware is loaded and initialized by the PF driver. Make
> sure VF drivers only perform permitted operations. For submission
> initialization, use number of GuC context IDs from self config.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
> v2: only assert guc.major version (John)
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 17 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c         | 40 +++++++++++++++++++++++++++++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 378dde5ad4f9..bab3858b423e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -408,6 +408,23 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: number of GuC context IDs assigned to VF.
> + */
> +u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +	xe_gt_assert(gt, gt->sriov.vf.self_config.num_ctxs);
> +
> +	return gt->sriov.vf.self_config.num_ctxs;
> +}
> +
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>  {
>  	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 997cb7541036..d6d37b193d17 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -16,6 +16,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  
> +u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> +
>  void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 807ad53449e4..cec709a908c3 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -295,6 +295,23 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +static int vf_guc_init(struct xe_guc *guc)
> +{
> +	int err;
> +
> +	xe_guc_comm_init_early(guc);
> +
> +	err = xe_guc_ct_init(&guc->ct);
> +	if (err)
> +		return err;
> +
> +	err = xe_guc_relay_init(&guc->relay);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  int xe_guc_init(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -309,6 +326,13 @@ int xe_guc_init(struct xe_guc *guc)
>  	if (!xe_uc_fw_is_enabled(&guc->fw))
>  		return 0;
>  
> +	if (IS_SRIOV_VF(xe)) {
> +		ret = vf_guc_init(guc);
> +		if (ret)
> +			goto out;
> +		return 0;
> +	}
> +
>  	ret = xe_guc_log_init(&guc->log);
>  	if (ret)
>  		goto out;
> @@ -342,6 +366,19 @@ int xe_guc_init(struct xe_guc *guc)
>  	return ret;
>  }
>  
> +static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
> +{
> +	int err;
> +
> +	err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
> +	if (err)
> +		return err;
> +
> +	/* XXX xe_guc_db_mgr_init not needed for now */
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
>   * @guc: The GuC object
> @@ -352,6 +389,9 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  {
>  	int ret;
>  
> +	if (IS_SRIOV_VF(guc_to_xe(guc)))
> +		return vf_guc_init_post_hwconfig(guc);
> +
>  	ret = xe_guc_realloc_post_hwconfig(guc);
>  	if (ret)
>  		return ret;

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
