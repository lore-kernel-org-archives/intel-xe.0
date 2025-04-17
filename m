Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10852C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB2310E3BF;
	Thu, 17 Apr 2025 20:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2gy9vZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9987110E3BF
 for <Intel-Xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744923329; x=1776459329;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IuaE936UFLc+s8W+HxEkiWWzypGKRkkyAOvIZx9bOzQ=;
 b=i2gy9vZDFa25KalYc848IXcxxGy2ywVsPQoXeqTRiV1Rd9SQgVJZVau4
 oy3NC7UXSKcO7LfMTDmm6Pk88ukZN/XCAPQGHbhm3uVToSNQpKxS3GIxU
 NIyn9cuUPn2vudg27ISGR5oyoGpQHKxYvvVddQKtlL3B7K9tW21JcLsRB
 Qve1zFrsEXGL/Gdaen0KPngKCOu2YE6Yhk9ayB4YwFuqOthW7peBVTsw/
 LJhbDxycKEMvURsV2wNbUse1gIiimPKDrxbNThLl+oZ9a+06IHKVd4Brm
 IV+AhRYYjGZhZzjcl1YCL+xToUvDakQE7HMNulnB0t2S+fk81u34hSMSs Q==;
X-CSE-ConnectionGUID: JAG9U90JSoGAViAQLLRx9w==
X-CSE-MsgGUID: c46fpM7FSZGBMXsnsZqxZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46662375"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="46662375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:55:29 -0700
X-CSE-ConnectionGUID: 6kLlJ5HXTAa652wXpxtpGA==
X-CSE-MsgGUID: oAF5dl0QTqWEz3WrMxzGdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="131461968"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:55:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 13:55:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 13:55:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 13:55:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=husIfgNqMD05mv4Vocv1KbUktWlt7IClK4Dxp7uPGR3kCK0amABcB7aJw/XfiZgjQCzA1l0904bRqjUsb16RFcQ4KcvGwGqvn2om7z0ynxUqzvSEwK6aJ11GFWyUirp+uHU8Ar6+YuYEBY9WZXjdyGwNqwfIdQORVYNL2kx2zYfLBJimo6BTiewcwaDLIlIbqWmo5lO8RgSSRuWa5iFlrEGiB6EjbvObbU2tbHUIR9CSCtOOGQ1F3VQW/Ynodr7zN0rtTf7VRFVMR7rZOHHjfshmCWeILQoM0zuEMVoFCLWM2UWwaEITZXl1K2U39ZAAUNKGmUiU9i8tjIoAx9Lbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq1Fq0qtsQ90ssp6IA3NV0cE+mjv6w8JqpjFhRynCL8=;
 b=HnF8DuskBJt89NAV01DUaubTp7yrsJJk2omKenNH4gK3fLyDHObXecKNq/+9lHgmYKu6HHKIBj0LVJxLizbKsYE8fXCMzAyjYlGPYc2xB2G7dzVfQ/k+ssIEC3/GIr3gnNOGG/B4psgQfW9dkALuA/XGQkon+Z43ISnsC60Yi2hzfcw5LRppue1RyDOXJTsvXEbMb3iSSHdd40yWLYWwH5dDNutoHbGtiB8b3G6u11GXsMHzOKBJ7Zn5tjnC5BPbTMA5kztCZHIgpCjVFJlYrIuYuoiYryP0j1phyNuJ8E9M3WsCK4k51kF2vumBDlb/g94dDVWpfotK+O+gWIwPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS7PR11MB6200.namprd11.prod.outlook.com (2603:10b6:8:98::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 20:55:21 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 20:55:21 +0000
Message-ID: <3b805c51-7f83-4174-8637-954d708d6808@intel.com>
Date: Thu, 17 Apr 2025 16:55:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/guc: Fix capture of steering registers
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
CC: Alan Previn <alan.previn.teres.alexis@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>
References: <20250417195215.3002210-1-John.C.Harrison@Intel.com>
 <20250417195215.3002210-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250417195215.3002210-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0331.namprd04.prod.outlook.com
 (2603:10b6:303:8a::6) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS7PR11MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c52060-d583-401b-2875-08dd7df22ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2FHQ0hDWlpZWnI1RWtmNWFqd21FQUpoc2QzZU9sREUxdm00cndTdU9oRy9j?=
 =?utf-8?B?N3ZBYVhNUkk2L0xzSXE3cy9zTC9oZjFBN20wd3crcDRTQUdaSzFqZ2hmeUQ5?=
 =?utf-8?B?NnJQcHhVcWl2RUprb014YllMWXdWWkhpSW9ZTnFhMzBHT0E5dHlwa2hoK25y?=
 =?utf-8?B?WXdBZ1liVlEyNHU1T1dFWXZiR2c2VEdvM3hDSWJva2F3N1F1VHpUeXRZY1h6?=
 =?utf-8?B?aks4QVhtNTdBdzNyZmFaYzg3L2F5V2FaR0JHeGRscDljeGp5NkVEa0hQUXR3?=
 =?utf-8?B?RUk5b0c3b2pOcjM1NlRLcWUwT1hMVkpuNllrMzV5b2pjU09CQXVLQzhMSE4v?=
 =?utf-8?B?Z3Ywc1VqQ2dCMW9KQWI1RXVPcituZjBDNzg3TXJLeW53Z0Znc201YzZ4bzNI?=
 =?utf-8?B?ZG9JL0FOVThnVkJaajJpNlBEVHo4YWwvMW5xNm1DMEE4eDhORXlFWlZPUjhH?=
 =?utf-8?B?aG5IV3AvaVBzRmdjRjBNZWdNL3N5aWVCUGNCU2F2am8wMVRmdTF5TGREaERn?=
 =?utf-8?B?bUdSL1VqR0IwZDZRVG9uSWhQZVhJUzRpSXEyMjQxZmpFdW5ORWlxTE91MWNy?=
 =?utf-8?B?Tk8ydW9XT0lUMnBDK0k0TnFVdFkzaWNPQlFON0VsdkpoMGg2N3daY0FYakln?=
 =?utf-8?B?Y290VzdDQ1grMkVZSm83cVpvYU1xUXkxc2ZoamZhODFTaHNWZWNVZ0dyZFRG?=
 =?utf-8?B?TFhKalJPU2ZQS2N4WmVVYVp0S0pmWEdoTG1pRzNSSk1rL1JaT1p1cTRGMGti?=
 =?utf-8?B?T3c1a3diQWhKL3dQS09tMjVPQjVXWHp5M2RUNVZKMWlpZTYxNjdjSlE0NUI1?=
 =?utf-8?B?OVVqVzMvTXZzcVZVVnJtRURJdFd2VCtpVW0vR1BKNVB0eDdkRk5KazUwTzE2?=
 =?utf-8?B?cHAvVUJlM0NTeTNCUXNuVU5hTG4rTnB3OHNGWENlamNFZkJ2RHREdWRwL0tB?=
 =?utf-8?B?UzY0VGhQVnpSUkNWOU02cStnR3phdmNJTjJnTUhXYzVCbFltaC9TTHFaYnB0?=
 =?utf-8?B?dDQ1c0hjV0R5ODROZzRxT0kyb0ZZSUVmYWtGODQ3UXV1ejJJemJZRytXY245?=
 =?utf-8?B?VHhSZHU3UVQxN2JiMEJoMVFqSlFHNzlJbWE0TEhSV1VZTXdQRmYwTkZDWkEv?=
 =?utf-8?B?NDZNazdHckdQTFp0ZVpRaE9RaG96ZnJ1WEtJRGlWeW5FUWZaNS9jU2x4bXZD?=
 =?utf-8?B?aHhtaFFRTENXTlV1NGN6Uk1RMTg3KzZ5YjJIVjBRcVhxV0dzTmJUOERSRGht?=
 =?utf-8?B?d1FNbXAveGpDUitMTHEra1NPZmh6RklnUDEvY09QRkd2NXZacEdyUE9tbWVj?=
 =?utf-8?B?dG55MTdRK0FmVkpjNndxbGJhRlIwdnY2SU9RN0M2MWdWRU0yeHJoZGRnWWt6?=
 =?utf-8?B?c1JNRkgzTlZqV0hITGVvZ1VqM1VBVHdlT3gybkJ3aUpnMHlMd2xkdDBuWFp0?=
 =?utf-8?B?WXNXbVB1NGZmUlN5ZklnNFpCMzNBYVFhKzNWSGVXb09sYXJVbDh2LzIrSHBX?=
 =?utf-8?B?S1ZxZkZUeStPSTVlTkpRVGs5UUdpbks3S1hIRjRacExMNEVkc3VsQlF0eUIy?=
 =?utf-8?B?N1NPdFN6UWR2bnpvLzZ0Y0ozZUNMNmNQWktaeW10V0FKN21PZDNYVUMxYzBW?=
 =?utf-8?B?NElQeFFEYk9RekJOM0pNQ3NVZk5TQWgxbHVrbktTc2xBeFFtOHkxc3M5SmJV?=
 =?utf-8?B?ZlgxTjQyemlpeDcrS1k1cWxsNG4vR1lHTVlOaTFuc2N6Q2Vyb2xDZ3ZLY3Qw?=
 =?utf-8?B?dXF5ZXpwNDZEN1NHNWlqUDVFaXZvY0laaElsYU9FYkVpbzhGVU5NY0JEaFcx?=
 =?utf-8?B?MUlHSG04V3lybGFjanVZQkZYMkRpakVWanB0dFZMdU9XWmtnUnZwcGxnazJF?=
 =?utf-8?B?VFMwaExQUk1wRHBobUxoRmF5dTZwWWVERmgxVG1FVUJZK1loY3VqajZnNUJq?=
 =?utf-8?Q?v7N2ZQEffN8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlhXMVFuNnExOVRmSFlQYmRqZU5YL2JWbWU2M1FZalZac3NXVm9oQ0FzOEtB?=
 =?utf-8?B?enk0N2RsWmlyVVM3WkZhWmd3RHJMYXlHSE9tRjd3QmdWSVArdnBjTEJ5QjVF?=
 =?utf-8?B?cHR4bE42ZCtJMmNIYnhGbU53ME1MRUo1Qi9XdlJKbG5wWlZpaGVOcG0yOEZn?=
 =?utf-8?B?RFVIVmpyL1MyMGtVaCs5NThpOWVibjdEVXBDL0Q5ZDFuR3RuZC84RzB3OFY2?=
 =?utf-8?B?THArSmIrS0tZb3JHd0k3azBoSXVmbFkzeE5nZUVmVFdvV3ZveGpZeHo5SWUw?=
 =?utf-8?B?TjNVUHdUSVJjbHY0bjdwZEpvVjA3SWxBRmZmbGJ2T1gvWjZ2bHoxYzRhZ0Vj?=
 =?utf-8?B?bEtQVHZSdytYSDBSSUhzZE4xbDY1czRZZHA3SUVDNll5ckNWc0gyR1BPRjFN?=
 =?utf-8?B?eC9kRlFDQnRtWjhEaXpvODBsbHdEbkJnK3BuWk1lVGRJbko2bC9tMmtiQkRn?=
 =?utf-8?B?d2Z1M3Q5dnVnVzlPZWZtcG8rUFo0a0I0VTlOWU0wUG84VTgwa0RSSmhGN0h2?=
 =?utf-8?B?bGJKTVdMUys2MXRmRHNHbE5zTGloUkhIODRPY3RKc1VaMjBqVXJsU2hGRnVV?=
 =?utf-8?B?SjBoK2J3T2N1eWgvUXVtMGNXSUFXRW1QbXl6VWNkdFIwWmk0RW5RQkRrVFly?=
 =?utf-8?B?cm1pTEJFNTVBcFFNQTJYQmRHNzA0Y0lndTJRSkMrT3FiSlMyQ2daRnVCK2ps?=
 =?utf-8?B?TlJuLzRjUmV2QVF1UTVrYUtOSFNFTmtsdE1td1Vxcnl4ZURqUWNqbHg5MjJH?=
 =?utf-8?B?M21JTHZORHNKQ2RzODVsNjZJUjdVN3pXVXNRdEg5MlY2ZkY2em90QmdDSXIw?=
 =?utf-8?B?eWJZcktWZ05GZlB0WlZSNDZUSWJGeUlGSmhlc1FQOUZIZ0w0djlQMGd1Nndp?=
 =?utf-8?B?VmU4WlhoTG1nbHRrWUZzSW5xZ3hnMU9zQXpBem92c25IWU03UHpkekhGS1Ry?=
 =?utf-8?B?ZjNPSWlKRTcwQjJyMEhsaVRwdWVoSXE0STdFQWZDcmpWRE9OK3JRMDdFdndK?=
 =?utf-8?B?dis5dlJWSTZOczVlSE1TL285Vk9MaFJNTHRkRGdzbG8vWnlZai9XNGxYazZt?=
 =?utf-8?B?bGE0VHZ4bnJBV0FkajQzcVhLNnRzd2RiYzBERDFCa0FIKzREb01USm9Fb2Ix?=
 =?utf-8?B?bERKVlJXekFYNWh5amdtODhsbjRSU2JIRGVQWUJQVzJ4bmtnQkg5bVNSMmhL?=
 =?utf-8?B?Z0NYUUYvci9kYzNUSURJL1FIRUxCMmF2MFEyU0t4L3cwRkUxdWhhV0NQVUxj?=
 =?utf-8?B?dWQyS1hZZFdzS0c3cnBXeDBIbm5KV3p5eG5pSEtHdk1NUENJcUFFYUIrQmlz?=
 =?utf-8?B?MUJmbUtpZWtvNEcyV0tGWlo5QlI5dUcvTUdSZ1pVa2tDcHovUlphNFdDU0tT?=
 =?utf-8?B?bVdnTGk0bWpMYmZZYjgzMGVjY2hzY3BDRUxwditrWXZHLytuVlNMS3c1ZEpZ?=
 =?utf-8?B?UXo3a0JXOVR4UDRNekYxMDJuZUtrOHIyL0VKSzkxaDN5MGQwR0t1NjF0bzFD?=
 =?utf-8?B?NUdmNTMzQk0xVFYrSWpLQUVEaC8wTGJKRjQrTmtMb0VpRFU4Q2VNcWl2TTZa?=
 =?utf-8?B?ZFFyQ0d5OEtZdGI4ZEk5d0FSMkVaOThKTkM2Znh1ZmROT1VXMnkwc0FIdFNS?=
 =?utf-8?B?RnM4U1JLRGpFMUNrbndnWURBY0N4OWlac05ZTHhzVE5zSzJjdXhScFZva0Yr?=
 =?utf-8?B?MTBLVkxLRUNWTVg3dkN2d3BTQXIvenAzT3dhZWR1ME9xSGJ1RHZIclZ3OGJa?=
 =?utf-8?B?eVFwOXFBbk42QjVRTVkrSE9QVjIvYmJFYTNoaDFnd05PdkNlb0JtaVF2M0dn?=
 =?utf-8?B?ZjAvbHJ1UHZ0Q1F1OWFabUprWWpiNFl1WWV6a2pna1ZKM1J5RFkzbTZhVmcx?=
 =?utf-8?B?ZUxWRndTNDkyYXNiSkR1R21ycm1VZWZtUG1CRnd2bUtwUUU5QUh6cHZyUUcz?=
 =?utf-8?B?NEVBZW9pOFA3ZkVZQzFJTzI0UWVWK0NLaDhiZlFEZ0d1MjRYMElkN2pOdEpZ?=
 =?utf-8?B?QjlxNVRXc2RIZk9MdVlwa0k0eW5obmhtbXY0ZTd3NU9vNlFUdVJyVnV5bTRN?=
 =?utf-8?B?Y3ozeVZITUR1c2Z1YWxkMWxRNngvcmlXVDFOZTJScGQ3QkwrYmZjUTgwYXU0?=
 =?utf-8?Q?dOCxAANPpkilcnI2Qjhq2tYNM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c52060-d583-401b-2875-08dd7df22ac0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 20:55:21.1497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nX6wOJB67YZjIO6UM06u2XCQDkBYPC0wsN0L122cijFnaS03Is3vhQ+SFUEQKHopyj/cJYnUKaHjEf3V5accew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
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

LGTM
Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

On 2025-04-17 3:52 p.m., John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The list of registers to capture on a GPU hang includes some that
> require steering. Unfortunately, the flag to say this was being wiped
> to due a missing OR on the assignment of the next flag field.
> 
> Fix that.
> 
> Fixes: b170d696c1e2 ("drm/xe/guc: Add XE_LP steered register lists")
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_capture.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f6d523e4c5fe..9095618648bc 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -359,7 +359,7 @@ static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
>   
>   	ext->reg = XE_REG(extlist->reg.__reg.addr);
>   	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_NEEDED, 1);
> -	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
> +	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
>   	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
>   	ext->regname = extlist->name;
>   }

