Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41E1C52D7C
	for <intel-xe@archiver.kernel.org>; Mon, 12 Aug 2024 16:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8E910E165;
	Mon, 12 Aug 2024 16:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRBacyIy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D1710E165
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Aug 2024 16:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723480746; x=1755016746;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5lFy1OYkoAc+YbjJLJutUT2eO6jiKxGU9EA/NrMM5BI=;
 b=YRBacyIyqLyk0vUJrKt/w12gIfgxfSW5JAqpXDZt64X5Z6jvNB8X7Lw9
 seeDM443dzonMyXRW1dyj7LJ30ztpJgvF5lYZUXUN6M1sYVvlYo2gwA6/
 17wpxD6YN6DtuIA8LxhWI/olf3KB7nV8iRPpQgZUa47GjYI6zD3k2vQfd
 SJTdBFNGruiIiXScCmi2OCHiwDsavwntGaIjnVO3CUnLcYy1N8Bco+FlW
 CzfCEYag0Ia9hWo+ALyqUPb54P9s/j7KEPhETZ1+UiBhH4SPutiu11HyR
 alIPFQXB54qrIf/yobfv8d1cZLKHw/mKWXFm9BA1u84VuHaLM7mzdcYJY A==;
X-CSE-ConnectionGUID: M8lH4sQ1Ro2GAtR1R5ENHQ==
X-CSE-MsgGUID: AeG7f0ysTrqmim38sJvGxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32755430"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="32755430"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 09:39:05 -0700
X-CSE-ConnectionGUID: pstBmx5QSbamGMJr9Jm9WQ==
X-CSE-MsgGUID: 8kaDU5lxSHSOH3bEHA07WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="58267944"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 09:39:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 09:39:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 09:39:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 09:39:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 09:39:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoznI5ZBPWE7ZlOxCIOybytOSi7A7NMEyZa0X69DKUBpny4zTIFde+8TbwnoKImDzN4H0P9DiZ5J2pGz7RWmDshW+NkbLH2mHUEsvAqvrYWp7mci/1bk6zfey8ROSRwA6mYrQKjvpTXae8aK4Z2EHvcUmfMJnGgIrt5/8Kjt4GlZ2B+8Gha3ERdMaL4k1GpVkBE3fsFdEUa+u8K6pApuAdvz4DE78hEBoZcN+QtHLuBKQeqqf4oL5XRxANfAmiMYqInC6yDBKo9xqhvncsHiO9fKJe84ogLkcN2nLHc/koT0LzRq6A1NktNGs8WxbAQ2G2exjsuoWYl+nOxKZTK6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUHED5jlVh3CvWDYMT2szWO5IJpvaSOVS01qb2CyhAA=;
 b=N9rVjXUIti+hlgzsetsFoWnHqb4c0Rvox8b1egl1lDIYRtbWVvJztaWXD/7npq+5hK30Cj2r80316FgvPNfJni6r2nCf3Fd1ruF/OCO/sU6DxgqzoNVjz8cAjteBSHE9wKXqK2aoIb3MzUbJUVbWhWDP+r0W+DBC5K+xs+kqSrBI7j6hFSqJ2K0wZDQUI4jrxD+g+3MrgBYoNRllfSD9KNFKIX4iDCJwv0t+dA70TAUaJKRV638RSf2yFDeWUSRLZNDrBqcQBYzAa0vTXWuiIZlATpLsArZb0leROzNSqb2Xjog7l5S/ObPlNrRhC/RmqPCAin+YYhaRpat3kw9yDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by MW4PR11MB6570.namprd11.prod.outlook.com (2603:10b6:303:1e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 12 Aug
 2024 16:39:01 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 16:39:01 +0000
Message-ID: <33aaf2aa-c8d8-48f5-a234-dd3358a872f0@intel.com>
Date: Mon, 12 Aug 2024 09:38:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: use devm instead of drmm for managed bo
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20240809231237.1503796-1-daniele.ceraolospurio@intel.com>
 <20240809231237.1503796-2-daniele.ceraolospurio@intel.com>
 <d1758683-cc9f-4a6f-96dd-6180e91133a8@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <d1758683-cc9f-4a6f-96dd-6180e91133a8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|MW4PR11MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 15767e61-f088-4cb9-04c8-08dcbaed4553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEVBVVN2MEtSSkx2Mkx5RTZEQVNhR2Z5VXlLcFltMDMwclFCNi8vWkNkS1J6?=
 =?utf-8?B?ejFtamt4U1B0Z0FjOHVuWjVmRnVxRkorWThFbTlGTlFmQTh3U1IyYkYwNGNJ?=
 =?utf-8?B?U212YlJjOW1xUlQ1YWMxS1dkQ3k1TkZ6eEV3OVpSWFozaXJjYVd5VGRiUzBD?=
 =?utf-8?B?Zzk2NVRMWnBYWmpVemhEYm82MlVLVldqaWdOVTZPNk1hWHRCbDk0NHBnMmxt?=
 =?utf-8?B?Y0M3alcwNmc2WXgrM3FrUUdLYzUzdWtjcmp5MnYxTUVqUlp3bW5xSHp4WlZn?=
 =?utf-8?B?U0ZETVZFbXdOUWt5c0VMTERuNGZTR0s5NGZkbEREVlZxWjQrb3RRZHNqUzNB?=
 =?utf-8?B?S1Zib2xCc05JQk5PdlJneXlkczhJa3NjT1FHb0tsMnFiT2laNFB3Y0tKVUNq?=
 =?utf-8?B?alowckpHZUN2UTJPdHd1Zk1VNlF4eCtxbW1acThaR1Z6ZW1iVWhvUWJvRUFh?=
 =?utf-8?B?MzhPVi83N2R2TjA1UFJobTB5cnUzYjM2TW5kbzRtc09jRDFmTElFRlNFeitJ?=
 =?utf-8?B?WGNuQ1Bid0lZamFlVUNsRkZFRDl4RHRDblo3WFlUMUF0U0N1cUdZSE9rbFhh?=
 =?utf-8?B?ODZJMXU5a2pxa2p1R040VWdpNTlveFVCSG1pK1VhK2QrZWZoT3g2enl2Vm5l?=
 =?utf-8?B?aE1qR3JwQVIraWRnTWdFckFzbUpIdU5CN3ZFV043cFV0ZlZkdmN0Tm0wSy8z?=
 =?utf-8?B?bGYwdUprOFJuWlNRaWxiaFp1QzQ3Y0ZvSFhMRGoybzJvY0hsSnJUSVhIMVVl?=
 =?utf-8?B?OThCZ1p6cU95V25URmdkclpYaGdQWURKazRxT2J3aUowNTR0UUlBR3pKQ25s?=
 =?utf-8?B?TzdxMGlhUDBsRGRoYytFVENVM0JseVNIUGxnL2pzbnBSdEZUSGRET2dRZ1RN?=
 =?utf-8?B?M2hEdTJXSUJxd0h0VVRZZEhrOFNLTFBBVE1uaGZ4OVZ2VGxFbGlKUnFvU01N?=
 =?utf-8?B?SlBvMnJVcVZrQUZtWkF4S0lIM2xNVG8wTk1VdGNnaFdwYlZrb3RqdWVrMEtL?=
 =?utf-8?B?NFFmWG84NEZJMmhDNXdzYkVDc2w4cmJTZWdWcVBiOFpFaXk4dm8zR2ZIR3R2?=
 =?utf-8?B?Q3hSK21YU0ZZOTg3QmhjQnBSRCt6bnVtcGpQWHdCMkxVUVVtc29uaWRqdEVU?=
 =?utf-8?B?UVV4S2pUemdGR09VTHRZRndVTndkQllKQW9MaEkvZHhOL214N1RoRFhYQzRY?=
 =?utf-8?B?QlNISmxQRmRtT0g4OXBGYXpyNlExK1dWa090VDhmckV5WmlGSEJGblV3YlhV?=
 =?utf-8?B?L3VST3drbG0wdXpZamE2NHpuMXpoVDFmUk5RZHh1VTlKaGRyeWxYVjlXMmpv?=
 =?utf-8?B?aE9OVlMrRDhzVWF1dlFibXRyRTV4K1cvSWNiSDRsZDZxQTdUcDN6dDVVM2FK?=
 =?utf-8?B?SEZXT2RXQXh5ZUdOYjNFRWRsR2tma3k3djNhY0tuWm0xRUp5NkhNbEZvYXRq?=
 =?utf-8?B?VUl3Wm9zYS9iQ2Q4bk1qRTg5NlhpWjF5eVluTlNpN2RjcmxqMDVEY0lES05G?=
 =?utf-8?B?TzMwS3BKOWdYa1drU3VaNjRNTFAxMFhyeHozYktQTWQ2d0hjcmhJbHJxMDFq?=
 =?utf-8?B?WFp3SUpGSmMvNjhWNmUrQ01wd2s1NWVacS9Ma2R1Tm9RVDVuTjU3cUpkbWxP?=
 =?utf-8?B?K05SbHBxSzRBWDA0S0Q1bDV0L0FRelpVb1lsbzBSMHhzcy9HTlBCREJ5S0Zk?=
 =?utf-8?B?U2hDSGtNdEpEOXlySFlOQWFXZkZ3dE5VTnZ3LzBxem15YkFjSkxqNDJoQm5P?=
 =?utf-8?Q?WfgL5eB0oDHVVVf2Iw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1pmaElLazYyODFVekt3ZEtheXlFVFkzekVLaGlDMlMxeEtldVVHQWxGYi9z?=
 =?utf-8?B?ejh3TTFPb0FtbWY4cFJhYzdxMUdTYWdJSU9KeGtPeTV4SnFrWlgycU9tUFNr?=
 =?utf-8?B?Z3UyTWI1QTBuRDdtMlorRFBLWS9JU3hHZlB5UWYxVjQ3S2M3OElwSU8yN2dt?=
 =?utf-8?B?OGluSnlPdGNER242VlBaYW04Tlc2U2JzSzJIckdsbHJUZzBTNU5JU0FZdjgw?=
 =?utf-8?B?WmppL0ZpenN3UDRoY2ZOanA4MkMzemNVbExjck9DTVZNdzNEK042ai9HdzBR?=
 =?utf-8?B?V2xSK09LQ2VoTFFTZUdEa2FDcDJyS1N3bWJkZm9qWktic1F6S1BlWFBvZG9K?=
 =?utf-8?B?b1Fyb0V3WUtxckZGK3lMcFRqM24zU1JqL2VUOHZMZDg0RnM1Vk5UNjRRUnBO?=
 =?utf-8?B?QWt3Sllwbk1yYitZTnBBbFpVdWFkclZVclh2M28wK09PSzRCOGdmSG9xQUI4?=
 =?utf-8?B?NDVCQTZCL2hJSWdxSHJNVzlHNS9PWTllWDdSOGJuM1o0U2lNMWRJL1Z5Z0lZ?=
 =?utf-8?B?QmJOdUJnaWg2Zzd2NHRmZllvUzlVL2RjeUJKeG51YUJreUtqY1VOUDJodUNt?=
 =?utf-8?B?cTk4S0NrR00xN1BZYkVkZTRHOUl1QXVhVTRKTU9IWkhldkc4N0tvTWp4ZkR5?=
 =?utf-8?B?UVA3OUFhUWo1SDlzQzU0VERLTVdIKzZIRDc1Yk81aHdZWU1ONzdYSXMrQjVm?=
 =?utf-8?B?c1l6WjdORkZNSENIYXNiYmc3U1BUOUhUZ3JzUS9mOWlVRlB6d1dOK215cjk0?=
 =?utf-8?B?djFSU1ZtKzA0TlhYZm5GQ1A1K0FHUlFBbjJLS3NNWWpPeUdxVUo3MjZvOXhN?=
 =?utf-8?B?R0JybU1OTkdmbTR0MVAxTDNMVjBhTHV1aWkrcFBnak16S01weTJUTFMvNHdk?=
 =?utf-8?B?cDJMU2NGSldVRFpXRFdhSk84ZVd6SFdYL3BTa3p1cUxDbXRkWklqMU1BU1Q0?=
 =?utf-8?B?eVphb0VuTTQ2NEpOMnBUZnQwWVZUbVNMWmtRcXkwQ2J3MTFCTzJmOGVSak0r?=
 =?utf-8?B?ZEEyTERRWXlkSks5RVFLMmRuT05EZHVwanBPMUovaTdmNkhZRm54V0NPelZD?=
 =?utf-8?B?UTBtYVpwSmovaVl2NE9MdkxrQkZyU3dueVUrV0ROYTZHWnVDcmFrenBmTzA5?=
 =?utf-8?B?cnNSeWVzdUJkUjFOL3AzcU1PampPYjZZSjdsVWdvREpuaWFPdDlnd2NNWnRY?=
 =?utf-8?B?UGxsNUF4NkVNalVMei9lRGZnZDhJaGNjckpvQ3IremFPY3A0WWo1MUJ6Vm9O?=
 =?utf-8?B?cFdXMG9ITlBROXZXRisrWWdsem9UOWMwRDMwUlFvOXR0T3lQdENoSzJUZlBm?=
 =?utf-8?B?TDU2VU8vM3dZUUEyM08ya1J1YkVJTnpPdDhQRDd6QVF1SUVTc05Zb2ErK05H?=
 =?utf-8?B?MzRDemlpc1ZSNEpCL2tHY0hza2g2OFB0ZS9uRTZrbDQzOUprSjVybnFBWVc3?=
 =?utf-8?B?aXpPTVhkZEtFYmpNVWFUWHdaY1dYRDlaOENiZUZxcnlBQlFRZHUwcWR1SnY2?=
 =?utf-8?B?UksxS0tTOE01dUJjeVZxYlNiam4xb1pqcXp6MlRkOFJjYkE1eENORWRIZVND?=
 =?utf-8?B?YnFwcG53WnIrT3pPa3oySmNyMXBoZlErZ1VPZ204ZHJKeG50REx4Yng0b2Qy?=
 =?utf-8?B?aGVDYjE4Sjl6UTFmYmxPRENQMHViV0t0K1JYd3V1WW95V2k3NkpLdW9uNFJG?=
 =?utf-8?B?dEdRbnhYR2xTME9iWmJKK3l1RW1CYktWdXg1Ny9DL25mWnk3VlYxc0pXaUZ2?=
 =?utf-8?B?QXZLTHRNbHJHK1V6eTJ6S09Mb0ppMGpRZ3hBRnkrMllUQ1ZueHJYb3dla2Ft?=
 =?utf-8?B?UWw3cFJHVHJBYU1STWRReGxtamRHNHQxaUtRcW4za3BaRmRyMXJXTXhKekJ5?=
 =?utf-8?B?Q1JRdm45WkFvUGk0djRhRmw1elB0amFoeDUzU0o4UDRUaFNKU3k0czZoNEpk?=
 =?utf-8?B?bGxKK1NWU0xzSU9JYzl3YWRad1IvRlJqeXNCVWU4d20rOTZvWko2UG5OOGZ6?=
 =?utf-8?B?ak9QdmQ2dUx5OVYwcmpXOWxvNjRPbDlzYUc4b05GaVpDOTVkbmcxUFYyQkp0?=
 =?utf-8?B?K0dYVUtTUWw3QjRDWWRiMWJHL2daVXFOVVpIR1loOEg5L2tVc0c3MkNrNlNV?=
 =?utf-8?B?dTQ2SXBseTd3MWdjSThoRU1TOEF3R1NNR0NwVHJxZHJiKzVmV1h6eUk4SWZX?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15767e61-f088-4cb9-04c8-08dcbaed4553
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 16:39:01.4341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSTe51Wpyr9j8kgKLAmtrZOiVjwp4Q04whGikSuWI1pXrmJI+eySk7gbI1k2209OntF2Wr/LEfHBFwS9l+jMiYzzp8Nhs0VzCdo20fExKa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6570
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



On 8/12/2024 3:41 AM, Matthew Auld wrote:
> On 10/08/2024 00:12, Daniele Ceraolo Spurio wrote:
>> The BO cleanup touches the GGTT and therefore requires the HW to be
>> available, so we need to use devm instead of drmm.
>
> In the BO ggtt cleanup we have drm_dev_enter() to mark the critical 
> sections that needs HW interaction vs the bits that just touch SW 
> stuff, but looks like this only works once we have marked the device 
> as unplugged. If something blows up during the probe, then the mmio 
> stuff is still unmapped and set to NULL (mmio_fini or something IIRC), 
> but the dev_enter() still sees the device as attached as part of the 
> later drmm and we blow up.
>
> It might make sense to tweak the driver to call the dev unplug() in 
> the error unwind during the probe sequence, that way the 
> drm_dev_enter() will catch this (I think). If we error out during 
> probe, then device can be considered unplugged at the end. Or perhaps 
> we should anyway make this change regardless of this patch?
>
> My thinking with not converting xe_managed_* over to drmm was that we 
> anyway have to deal with userspace objects existing after the HW is 
> removed, and there we might also have to consider ggtt, like with 
> display surfaces. Also the BO is largely just software state and can 
> be tied to life cycle of the driver state, but I guess here this is 
> internal and closely tied to the operation of the HW.
>
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1160
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>
> If calling unplug doesn't make sense, or is considered orthogonal and 
> only makes sense for other drmm users:

I'm not familiar enough with this code to know what's the better choice 
here. I didn't even know drm_dev_enter() existed before you mentioned 
it, but that explains why we only see this problem on probe abort and 
not on driver remove, because we only call drm_dev_unplug in the latter 
case. Weirdly, drm_dev_unplug is called as part of 
xe_device_remove_display(), which makes it look like part of the display 
cleanup instead of the more general one.

IMO, using drmm for HW-accessing functions and relying on the fact that 
we correctly mark the HW-touching blocks with drm_dev_enter/exit seems 
more error prone than just using devm, so switching seems safer; is 
there any advantage to sticking with drmm instead of switching to devm?

If we decide to stick to drmm, we'll need to review all callbacks to 
make sure they have the enter/exit calls where needed. E.g, the 
permanent exec_queue cleanup (being called from both the migration and 
the GSC drmm callbacks) does an unconditional xe_pm_runtime_get/put, 
which seems wrong if this can be called after the HW has been detached 
(and implies that the function can end up accessing HW).

Thoughts?

Daniele

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 3295bc92d7aa..45652d7e6fa6 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1576,7 +1576,7 @@ struct xe_bo *xe_bo_create_from_data(struct 
>> xe_device *xe, struct xe_tile *tile,
>>       return bo;
>>   }
>>   -static void __xe_bo_unpin_map_no_vm(struct drm_device *drm, void 
>> *arg)
>> +static void __xe_bo_unpin_map_no_vm(void *arg)
>>   {
>>       xe_bo_unpin_map_no_vm(arg);
>>   }
>> @@ -1591,7 +1591,7 @@ struct xe_bo 
>> *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
>>       if (IS_ERR(bo))
>>           return bo;
>>   -    ret = drmm_add_action_or_reset(&xe->drm, 
>> __xe_bo_unpin_map_no_vm, bo);
>> +    ret = devm_add_action_or_reset(xe->drm.dev, 
>> __xe_bo_unpin_map_no_vm, bo);
>>       if (ret)
>>           return ERR_PTR(ret);
>>   @@ -1639,7 +1639,7 @@ int xe_managed_bo_reinit_in_vram(struct 
>> xe_device *xe, struct xe_tile *tile, str
>>       if (IS_ERR(bo))
>>           return PTR_ERR(bo);
>>   -    drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
>> +    devm_release_action(xe->drm.dev, __xe_bo_unpin_map_no_vm, *src);
>>       *src = bo;
>>         return 0;

