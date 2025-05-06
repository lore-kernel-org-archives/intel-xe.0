Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9947C3ABBC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 20:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4790B89F08;
	Tue,  6 May 2025 20:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZuflTGbz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7467489F08
 for <intel-xe@lists.freedesktop.org>; Tue,  6 May 2025 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746563076; x=1778099076;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9feKb6RD+IF7h5gleOhjoO0XR6zqJt2oM4ravZT8qgA=;
 b=ZuflTGbz0tIv+Q9BZ4i2Zpf1KCWIaTdqUA69VleU18AoQI4cHXzsURZJ
 2LgdzVbHbb5qyvMHujTn36o2CPqrt+0VlLfc5xUimcKPqUni6K33+Ah6D
 uhAWlaaXqOK2q92YTkoJwwiVPOYGQ0iwb9opYIYfj/5cEZ2CgwXlqd1r6
 CDOPc06xH87z1SOy2qz4m8htQ1uH+lSoHxo03NayfS6KlB11xjGBtgfMZ
 8DZFYPzOerDVmbPYWcOrA5qsdWgvKN2tNrq/UhxHNNzs1Igf1TcNvCloW
 8MGR3dxK6ZPvlQoZrHMvj9cpuXe/cappxCG2kkiyQp/J8/bnsQomJq4pj g==;
X-CSE-ConnectionGUID: /BptUIh1RwyaVdPeasY/uA==
X-CSE-MsgGUID: YqLZPuoEQ+KG7oPDXrbs/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47359157"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="47359157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 13:24:32 -0700
X-CSE-ConnectionGUID: 3dVHEj7kQU2OYozptjL8ZQ==
X-CSE-MsgGUID: VWe91avrTEStukXq/nMv6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="140683858"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 13:24:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 13:24:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 13:24:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 13:24:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVTYuUUWI5bOOZx0K9SUgrP/F2pbBJurR8+SBTdI620leiZHk5eorzh1x+wpWjW/+uUoFfQOVv6LmzLcMuBQwp77mFcQVetCJ+H5PYk0Gu0jl6MxnMibR8EK9u5UBYyyxSrA8ppIcVTk/ihPZWrAi5rqGAAuYGcPgQApMpUBt/s7oNx2Bf13M0OWAu8MlnQazVthkWvT3uTkmvf9cosDFGav5k/GkokWzgcKd7+UsgP7iZuR3f5GyXFppP4uhNaJTo1owuOgwdKQus4f8pSUrDnM37qUTc8lmkA6bIotu13Pqmx8pKHWF9163YwTVqMp67NpeoiUg56os6U8TrO31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/MNTp6nMlzgbjVJxnWAT2HaVqxw8vIqSObZTtc13iA=;
 b=OTPBmioMCT/Upkm9FBVNzxosjbm68lbkBFMfoO+3kSTnEheUba8sTITm7JigiofNKGI0wY1U00T02Yt2URGPN8IRujkBPpilo0CrXUuwP4U9vCDoPZ1j5ntp8oR1i28j7O1vxLGorOgq82cyGUzq7YjgbVGb761uNJjPy969GRi9qkV/nMhkZT4yFh1cLTNe4/+DcBbfqCHAil+OK37Ei6wPAeH7BbidkbX1iXGDFMoKVoOnXyj+34deoXjvgt7v6eMq9uveFAbPHzJqh8hk/cmBwmhP6Worx/p3k/8HrYHHa661H3ZiVaRPHCavyPpfXvtdmXxenegt7xVRv6yeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6762.namprd11.prod.outlook.com (2603:10b6:303:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 6 May
 2025 20:23:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 20:23:52 +0000
Date: Tue, 6 May 2025 13:23:43 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Support active context utilization (rev2)
Message-ID: <aBpvz8V6OfnR0YNZ@unerlige-desk.amr.corp.intel.com>
References: <20250505225852.1994431-6-umesh.nerlige.ramappa@intel.com>
 <174649015077.49740.6203793500643244684@c664b1dc75d1>
 <aBpOBcSwtUbaEbut@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBpOBcSwtUbaEbut@unerlige-desk.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0332.namprd04.prod.outlook.com
 (2603:10b6:303:8a::7) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c180ed7-11bf-4dc9-b2fe-08dd8cdbead3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3hlTjM3T2hXTER1TXhHa1pnWTFrVi9FRitnSGpTbUs1b05RYW9sNlFtN0Za?=
 =?utf-8?B?Ukg3Q2VSZ2tIUU5md0NiV1pvWjhhVjZvL3VLYkkrYkxCTHBQS1RIcFlNQXFP?=
 =?utf-8?B?SFdQNTkxZGxZMG5CUHdDaEgxcUh0WkwrL1dsV1VxV1B3dmtDYUpoa3J5ZlBt?=
 =?utf-8?B?Y0ZncjJmYi9wbGk4QkJDUTl0Ly8wYy9FdlBMVjRzenBHMkhqbVdIdGZxeElI?=
 =?utf-8?B?R0JNeWNqdDJPcDM4UTlreG9YdUVId3cxUjBGQi9TTGVFRDVVSXRUd0xTbDQv?=
 =?utf-8?B?S1dzL1dnUTJ5anZrVzZtUkY0Ti9XM2g5bmJPRzhEK1l3K0tuZWt5Mzd0Lzhx?=
 =?utf-8?B?QWxyaTVMUkFFSzJaN0tVd1FsbFU1Wm9QbVBDN1g0MzBCNzNBZWFwZzVXWU51?=
 =?utf-8?B?QVpGbndMTzU2WnRoSmhCcWV1eTNqZlo0QmE1dFdMcytKY2MrbE0zUWJaZFpv?=
 =?utf-8?B?TUFrcEZ4QVNtc0l6YTlBUUNleFdtN3JwelBtSkFGVVE3YU1yeDV5TGs0QnJR?=
 =?utf-8?B?YjVMRGNYTDVrbUtmcHlLUmdGR1hxbStDU3pjMmxOWnFRTElqVjljNGIxK0dB?=
 =?utf-8?B?Q0N2WTROU1BiWlN5UlFGbVNpMjFPM2pjRkNPaE9Ib1hvdHgvcmFva3VxT3Zp?=
 =?utf-8?B?Z21NRGpQOVA4cDU3SzZGdU1ERzFjYTdDZTRJWXUrN1pUb211RGNocGpkYU1h?=
 =?utf-8?B?cjgrR3RxYzQwYWsyLzN5MGczSHNleWVlTHc5cWlPalEyVmZDc3dGYWwreUtv?=
 =?utf-8?B?eFBHSER4bUVwOWZNNmdDdzVQS1hPcXdOTDVDM3E5ak85eitoWk9zTDQ0K2xr?=
 =?utf-8?B?TzMzVDUvTkhYdXFYWjNMRFphT29SYllXSjEvWjJoeVU2YXFDM21ETVZkWXJL?=
 =?utf-8?B?eUxFWUlQaTVVUmF2c2hFRkxpVzF2S2l5cUxod1JMQWtJTXh6TkxjV3hMaEg3?=
 =?utf-8?B?OWNqYllUdURrTmR5RFBWVHBOMnQrQ25YMDAvQ1ZBMlRzUHRhcnZrUitPeERK?=
 =?utf-8?B?YkUwcENGNkxzM1Z4Zjhwa0JEcjZTdlZKT1hIUFdONW5mSzRSZlVyV0VsWDYr?=
 =?utf-8?B?REZRcDBnQk0vaEY4RWxGZHNFN2hFVnRrNTk0a3JsMXdDTjhIcE1mbHJkQWtj?=
 =?utf-8?B?VDA0WE1hbEFUd2dKSkpIY3puN1VyYyt0TWZkYTNHK2xCbFpIZXlzaEZKcFll?=
 =?utf-8?B?S2tWbWdrc1VNSFJFbUtKVlZrRERSZTE4dkF3dXFlbkFKOXlTdGkvcDJtWFpD?=
 =?utf-8?B?RnpxdVk5Wk9oY0dSanFrSGRXclpMaG9DZGtCbmthZXUwdUNxZGpLdHJYaVUy?=
 =?utf-8?B?N0dVbWFlZzEwUjB0cFg1aTR5Y0FtdjRLblRZb3V4dldEN2hiazdmZjJKQmJp?=
 =?utf-8?B?cjl2RkxlenRrSkNoOG1kdFNiUEwvSHVMek1TS1F4cDF0N2w4UUcrelNZcnBy?=
 =?utf-8?B?REhGVmJCVS9SL2U5MEFVVXFLS2R1N2x2UEVHWFQ4dlZFVnE2NXBGQ3NERlRD?=
 =?utf-8?B?VjFIYjdUZGhmS0JudU1vNjNhMEhrMFFXejlhSThXL0NENTROY2FZd3JGVW9O?=
 =?utf-8?B?SHFnYmpqYUdlVGVCdmRKUzZwaXZGb2lOcmJhaWtiZHpRMlM4OU1MdnRFN2lt?=
 =?utf-8?B?ZWhUTVhkZXhiTGNxaGtpb0Y0cmxxNEN1TGEwbkNPTkxvcTRSdXZxdUFKa0Ix?=
 =?utf-8?B?Q01ndzJjN0hNVEVyZmZCRXB3am51QmthU1JZMi9CZzByWW91Rkhvb3pUNndZ?=
 =?utf-8?B?VXFYU1o5eFF3am44OSttWmJ3U3E5Tm9jVUJJVGIzMGNSMzFOWXdhVXNJbTZG?=
 =?utf-8?Q?l4OzECju7cpbF7o7DYrWK7PjX+cB4mC2DU3Yo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE9qRzR4QUMvb1pmTkpyQXowQmMxeGhQWlVsUm9lRDg1RHZvWWgybHlxMGt3?=
 =?utf-8?B?MEdLZXBnaDc4cEF1MTRMOFBqS3U0dFl1bWlYSUo3YUFoUnhQK3p1NFZUZ3Rz?=
 =?utf-8?B?eWxaTTNvaXQwVld4SGV2TGF4TGhBMHc1ang1SzY0SmNjcW9ZeExSOC9rUkZV?=
 =?utf-8?B?NE84VEd5UzJTK3U0NEJMMUhScFhleTNaTVdLVmZnbEFKVU9NUHRJdkoxTnNr?=
 =?utf-8?B?VzRUSUs3Yk9JMHdCVGNUU01taFViV2RRQUp1VHFROWFOb3JwcSt4dXVaSWJ3?=
 =?utf-8?B?bE5ZcGRFckVacVo0VmcvTEFPV09GOW1URTlCTzdKUUtERTVqclVOU01vbTU5?=
 =?utf-8?B?OG1ITU45dzc4REpHN0RJZEdTQVBKdGxDc3ExODBYRHdQT3BDWW16ZWFBaWIr?=
 =?utf-8?B?eVd4SDB1KzhBQUh0TUxQN1RyWU5nU2dpVmU4Tlpsc01kWEFvRVBtR1lTc3hT?=
 =?utf-8?B?cUFmbXdWUTVlMjVoMkdubFBMRGZ5Vm1paTJGSnB6SHZKVWo0QlF1d1VqcnIx?=
 =?utf-8?B?WVpNaTBRVElkYmc4VnBDdTVjR0tic1pWUERkdExuaWRKREZkS1ptTWVzQVNI?=
 =?utf-8?B?V3ZRYU51K2U4T29KT0FkdEMzVFF1cnpBeW9MRXBOajVWZlVGL1o2eFZNWFgr?=
 =?utf-8?B?ejRleHR5U1RLeWhmOGVKRUttZXEyeTgvVFcyQ3BxZURQL3RpVTl2elFYZEJJ?=
 =?utf-8?B?WGNrUEQyUGU5MnB1WFdaQmpqcjdlOHpDNDg3VDQ1cUJBNVJHMXZ2citQaXVX?=
 =?utf-8?B?QUZGUng5Qnl2ZkQ4R0lyVjBCZ3pWd0F2ejB0NFJiQkUrTjk1cjhFUDl4TGFU?=
 =?utf-8?B?cXpUczBJNkYyb0V5NytmNFNMM0RXa1N3M080S3M0ODRrVFhCQkRpeVVaSEZ0?=
 =?utf-8?B?Y2JWNVR1ZmV6UGtJM1JXRGQwWEY3NFJhelc0K0hxU3QwTGUrV1Nnbk9BWkRY?=
 =?utf-8?B?Z0s4VFdCR0JoMFZGTC9kTkwzYXpUZTJUWUxXOFJBQmp5WDBmeFBSNG1IM25O?=
 =?utf-8?B?aVhYcFNySUd4SmdUWWdzMWpDM2hybTh0ZFJraEFKNWtjRy9pQk10dEUva2dZ?=
 =?utf-8?B?ZmRnVXhybGg3b1NMU0JTbUFQbWF1Z29Xd04zd2FYRzhIT05aQlY0S2REdHV6?=
 =?utf-8?B?TmFwN0dHMTFqQi9qVFFqeTdFVTVTQTluQkMrdHJwT3duWFJpR3BBQXFKZHp5?=
 =?utf-8?B?bzhXL0RzUGJPem9xNTl5bzlJbmhkYzNFaHdJSlgvdXluNXJ0bjRjeStlQjRB?=
 =?utf-8?B?Vm5QQUt0QzNEYWNRREFhUzFwR3FIR1ZrdnozVm13QXlHVUcvNnpHNkZzb0JT?=
 =?utf-8?B?cC9KZXhpV0NmOEg4dUdsYlA5YkFnTlBYUTU5V2hXWUxvL2FaaEVzTkZYY2lw?=
 =?utf-8?B?bUVXaVFpQVVHRjNoZlorZHhzQVZWa005QkFVSkh5b1B2OXhFc0JTMEcydXNK?=
 =?utf-8?B?UWljK0xZWWJ2NXBvR3lQZnpCS0dkUHFKRGIzUnpibWxMV1dCYTJnZkorZC9j?=
 =?utf-8?B?SXd4eDdDQzFFam54UUJSOEJFR3hXSjgxT1ZEaUw1OThoaVNmOG0vcXo0VVFs?=
 =?utf-8?B?bnlJcThmdFJ1NUd4OHVtNWJsd1BNaVI5L0lnVDJ4VTJWWE9rUnc3VGxVd0JJ?=
 =?utf-8?B?RTgxTEwwbnRtblk2SGRMRFR2V21sYk9nRUhGdVM2STNFK2tIWjAwamVNY2FI?=
 =?utf-8?B?ZndETEp6Z2JQTmh5ckpHTTk2d2ZESFYxWlJMTUVOYUN0T2FMZmxDTGxkN1Zw?=
 =?utf-8?B?S1krR3AvdCtHUFdFdzMrNXpRWUFSZ3NrbWJFWklaRUxwZStDMEZGZnNPKzRF?=
 =?utf-8?B?YXpheTBQaUc5MFl6QXZRNHkzSG16RGh4Mkt3cWR3S1VQaFNXMlh2WnltV0Vt?=
 =?utf-8?B?aDkvYUtpR0tncFBLdzh0M0twSDh0QStBaVN1MmxaVHBvbTlWV3FpMEFodHZt?=
 =?utf-8?B?MHJxam1OLzNIaGZZcHViVkRvZVBXT0t1VlQ0cXNzQTlCQ0o2NXk2ekFGT053?=
 =?utf-8?B?b3JSYmtTdC9zUVFOZmpxZnNoMXdUV05oVnV0S3d6YVN0UnMweThUYmFicklH?=
 =?utf-8?B?OXd6THJ2ZXUyNXpBT2d4WDBML3NJVi84aHQ4YXRLSTBwdVNPYis2R2ZoUks4?=
 =?utf-8?B?a1NZSFFjT1J0RWxqTGo1Y2oxdWZhT1libHBNdW1LYTB1eE11WnRKV05mZjNK?=
 =?utf-8?Q?vPUKJyxZt+D9Z8kw1vQ5/lE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c180ed7-11bf-4dc9-b2fe-08dd8cdbead3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 20:23:52.3663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9ADRkVtfxuREc+xZXxpMvfKbTEsxPviMuqyWNKTDu4C+HGRcMjIO+zj5OG/4bz7tRVle6FmudVr5CNx9byr21jBAWRHAFKKwVuseL6EAlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6762
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

On Tue, May 06, 2025 at 10:59:33AM -0700, Umesh Nerlige Ramappa wrote:
>On Tue, May 06, 2025 at 12:09:10AM +0000, Patchwork wrote:
>>  Patch Details
>>
>>Series:  Support active context utilization (rev2)
>>URL:     [1]https://patchwork.freedesktop.org/series/148302/
>>State:   failure
>>Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/index.html
>>
>>CI Bug Log - changes from xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179_BAT
>>                            -> xe-pw-148302v2_BAT
>>
>>Summary
>>
>>  FAILURE
>>
>>  Serious unknown changes coming with xe-pw-148302v2_BAT absolutely need to
>>  be
>>  verified manually.
>>
>>  If you think the reported changes have nothing to do with the changes
>>  introduced in xe-pw-148302v2_BAT, please notify your bug team
>>  (I915-ci-infra@lists.freedesktop.org) to allow them
>>  to document this new failure mode, which will reduce false positives in
>>  CI.
>>
>>Participating hosts (9 -> 8)
>>
>>  Missing (1): bat-adlp-vm
>>
>>Possible new issues
>>
>>  Here are the unknown changes that may have been introduced in
>>  xe-pw-148302v2_BAT:
>>
>> IGT changes
>>
>>   Possible regressions
>>
>>    • igt@xe_create@create-execqueues-noleak:
>>         • bat-adlp-vf: [3]PASS -> [4]ABORT

>
>Regression from this patch series. Needs fix.
>
>The CTX_TIMESTAMP register is not accessible from SRIOV, so we need to 
>block that in a VF and fallback to using the LRC value for both 
>utilization and TDR.


>>         • bat-lnl-1: [5]PASS -> [6]ABORT
>>         • bat-bmg-2: [7]PASS -> [8]ABORT
>>         • bat-bmg-1: [9]PASS -> [10]ABORT
>>         • bat-lnl-2: [11]PASS -> [12]ABORT

The above 4 are failing due to a regression in my patch. The LRC value 
should be set to 0 in xe_lrc_init but my patch hass wrongly changed it 
to CONTEXT ACTIVE.

>
>Will post a fix in next revision.
>
>Umesh
>>
>>Build changes
>>
>>    • Linux: xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179 ->
>>      xe-pw-148302v2
>>
>>  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @
>>  https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>>  xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179:
>>  47bf2b0a07ce766d4e893762e02be4a2646e0179
>>  xe-pw-148302v2: 148302v2
>>
>>References
>>
>>  Visible links
>>  1. https://patchwork.freedesktop.org/series/148302/
>>  2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/index.html
>>  3. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-adlp-vf/igt@xe_create@create-execqueues-noleak.html
>>  4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-adlp-vf/igt@xe_create@create-execqueues-noleak.html
>>  5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-lnl-1/igt@xe_create@create-execqueues-noleak.html
>>  6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-lnl-1/igt@xe_create@create-execqueues-noleak.html
>>  7. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
>>  8. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
>>  9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-bmg-1/igt@xe_create@create-execqueues-noleak.html
>> 10. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-bmg-1/igt@xe_create@create-execqueues-noleak.html
>> 11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3038-47bf2b0a07ce766d4e893762e02be4a2646e0179/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
>> 12. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148302v2/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
