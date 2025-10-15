Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3C7CCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 04:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7810E038;
	Wed, 15 Oct 2025 04:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P2aAgVbd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587FA10E038
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 04:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760501259; x=1792037259;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8S+vRSJKR5DtDOMn5nWJuUYF9HucOomCZNlOJyz43x8=;
 b=P2aAgVbdivKMGm5RWgfMQ7Y41UG+xpraYIiG44QdYVAUH+3tI2SQSxyM
 UXXuTCIjBKiHwvcssCPQbPrEtwZH6LhvpkCydKB7zKoDLKNV9NvNMwb7X
 HPqU5enfj6JvqWgcUhrSr8TjXj0SJ2uV93MjtxvAcIMMYfbXXb4tdUP9q
 Tz4Ok4UGg3RQTggw0v0A4ALjO/FnLU2IG37WBYbi7fSi1ZBa+TYjKUeru
 MIC7ptxuAsa02H51QgHzaT2iDk/Neex5CSq0d7uNmahNpsr1yGtgYmwwC
 GkSu7EbU9Z7EZGKA7hZdYa1h755OUVWg4iuOV0hion14IXJKYcOKeDlgP w==;
X-CSE-ConnectionGUID: C/L7a49XRtyTQD4rd2rZOw==
X-CSE-MsgGUID: Ah1a4CGzSDSAhhBcTSPnEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="88134497"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="88134497"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 21:07:39 -0700
X-CSE-ConnectionGUID: oFrEM2BpQ8eYPaQbaTwDMw==
X-CSE-MsgGUID: l03hpBMtTNCJb41KIf6fXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="187366655"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 21:07:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 21:07:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 21:07:38 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 21:07:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsrfN/ry7o16lX1oEUy0e8L5FViUd+PnHeMvAL20l1IjtnMbUaAGHaZyijt6w/SbapTR3dYIR/F1XTSpvAjkGxark1W56F2IEXtyZw+Yh2dMBFicpxFj/D3uaF7t7NN+oqUSaiMWVNTL8w6X1zzZs42u2Rby8uMRfkJdGRAe40NnyGsc2AA6T9l8sSp5FUcoKLI2jd5iAD1d5B4QDTv8MS3p3eolLhqOPL2PGbr2nmPVnA9Gs86dYyPK8MSkHdxF6/Zo+2W1AnigZMjzMx8eubVtt6aha2sTlkM+vo8zsfXSFG+UnbQon33i+CGoiuIGMN0qsIiOC1hPQgv9IAsbmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnXY05NTgoKtt+SFAV4neaOm72wNY0q+DwR8xZ0R/c0=;
 b=pgxRQ2EQSt4e+N41JXsbvLqdW5omniUEyz2zprVZQMm0URx1Y16iKhoyD+asrZ9Ku8TX4XU6z6iW9RhtwPTTFr7775XKX0lDErxzrUEulhwMMP4l14hZLpeccDkXBoVID2rE+CuoroUrlC0ClLBucMs2kF2PId2FUMI2J9vL77IvtHj9dOVeod1HjbpN6NtjNYjbDT2gUEOFRCWGeXCVXwxd2ysx3k0bnaXUefZv3VxdUcp9vUu76BRHSezCU/A25CDQSFF4guAOec0xGGFjLoGh4rfTrvWp88pv/RXBRM8f5m9socY6cygkUOlt7lhAP1gL7i8O8EDlhpiFJw21TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 04:07:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 04:07:36 +0000
Date: Tue, 14 Oct 2025 23:07:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Wang Xin <x.wang@intel.com>, "Niranjana
 Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 13/23] drm/xe: Dump CURRENT_LRCA and CSMQDEBUG registers
Message-ID: <5we7sv3g43cuzf4lddxye3fhhmxvwo47eiy6clupbsxwteotn5@p42q47sup3ub>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-13-bfb74f038215@intel.com>
 <20251014172445.GU5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251014172445.GU5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 15573b5d-ec9a-4ae4-91c0-08de0ba05fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z9GE472F157LFI/34laKsVkKkDMcA4KlkpAfvhEVYBAedAYGHSXdymHVTtFu?=
 =?us-ascii?Q?8ofO8QryeJh2tRLn/PKJCNrvfYvldSHCAYnz85BEmjhMXfCaprROMUHTi7D2?=
 =?us-ascii?Q?NzlJBfeTOA80ahIMhCJByzzxefADRGd3nRbqZOJiB0LAPMrA4fNUxo8haBP1?=
 =?us-ascii?Q?k6PStdBoV4GJMp/D8AxP7J3R55+OOPwRCuPf1pYvPMRAMH/ISYTl7k/TT1JJ?=
 =?us-ascii?Q?8JSzpa3eGqOxW1I1b4S5ve8U4H4PDPztaJSOfzogWIv8hqTwznUXjsH9125C?=
 =?us-ascii?Q?foZpNvmXPwM0wPLxkqLgbMdNSuBWKT2izjz2TuK0vCByZ3YisudhVEW6pHqd?=
 =?us-ascii?Q?GEZ1MhkQUlSAGuf7xMtVeqcGfg+Qd8yDQgqLQUcZmfq/69B/Fkt1RsJhATzJ?=
 =?us-ascii?Q?VMsa76wFsB8kTNXW60pPAlYXpX68OCDJqdqXd6dvK+MH/L2S1xeycyFHHr9i?=
 =?us-ascii?Q?QTKssLda+HDygW6Hxr9FHEfm15NHlPR+1OV+AMn7R95VxnBf44GfmC+P9RsV?=
 =?us-ascii?Q?v7mJBZRCOuajuP1hellU9IgjpDGXyRga2fxa1VQmzo/7Le384OVTVDShNwwb?=
 =?us-ascii?Q?B7j+rk8f/RWuSJ5rFMw/DcnDZ49Lbzoca03gohQtq7HNFxuSGHuJ/UM4cnKP?=
 =?us-ascii?Q?/kQV8Uib2kNBYPrKEiBC05jDGYYsIQOfae66fg4FSIbB6vxQ2xgPSXqVa45a?=
 =?us-ascii?Q?htSdpP5cD9tvOk9JcO2UyFR9NLrXk2mAitac8TBR/93G1tpTGZh/3uKCYczl?=
 =?us-ascii?Q?vl6LH2KAPWWxD6I+IAL1bFepTCn5fWvRLDeub9Y8W5rGJPFdja81QJE65vsv?=
 =?us-ascii?Q?tMh4ezNOPmQHvAkR8ELysuZi2lPc5ADc48zRp79gGfxLGMZG5YnIL3GzLcDV?=
 =?us-ascii?Q?nqN8a4FQpHg14CLN0Oj90oMPoCIuselNLRaOmxgOukaj3wsFboDNNPJ1e6/L?=
 =?us-ascii?Q?Pt2c8Zt3gWT9b150e0WFFiWwtotS/zB2TZUhQboDdSA4f4Bb79iFGXN9DpCZ?=
 =?us-ascii?Q?FlJ/S436AidCiEJESQ+9ROrCX/ke3g3TFvuD1gY3omelP6qBVQZE57iFZrIJ?=
 =?us-ascii?Q?jYXeQz5ccXdNNtkdL0A618p9A5HxRCPPOAFJa/Uks+9ueuvkzuxGgkGFWjyN?=
 =?us-ascii?Q?Lk7BrmJ9J9SSFphJ7xsfLqQriZJje/wxjh4EDlndywh6xad3Ohk6CSgIX3YN?=
 =?us-ascii?Q?aoFBBejM0t5q0EusDF3GSxiM4PiAYc8q5IZMARdduX7YSUIoBokPY8l/dK2X?=
 =?us-ascii?Q?NRtlImihHv4QmwOq48aG96SMF8weIMmvzrxbEMUfoM4Sr9KL775ScPy6votx?=
 =?us-ascii?Q?Tox4DZ6yGJ/31w1XHG9HsjbqDaBGhl5KIo7wc+fa0hyQFBJARR62xeYbDx38?=
 =?us-ascii?Q?CExcAG9enfZKDh0nxgLa/vUcxpFlpBG9DPv3zvbH5YSSStidaGg+VDmpmSE+?=
 =?us-ascii?Q?EgPDO4Sqe2G6P2IwvZxvNwmsLsZBo/7r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7i/PusspR8hZ7yD6YQgloAnQWHVp5obmNBHQpJiQZxcpHwolhtz5/h/Y0CHN?=
 =?us-ascii?Q?GEhbg4NSihGXvkhgaQACwqDaTRoISGGangnM3Wv9DAs4p1qX61G3ebttHR5k?=
 =?us-ascii?Q?2wpT1Uj8xeh4oP+NdHjykqbhxgPjwfT9zWPpLhYzqBXO4Qcra5zoqBNZ83Qz?=
 =?us-ascii?Q?VwmzCELa2BIXbWjvglaYW8Z+K7bLzelkh1VNbS1fNZt5iPwk1ph+N4d8UaWZ?=
 =?us-ascii?Q?/qTzZHMdxCK1QeyT9d14mkprDVwKLSzjPSYZHBKsHTwmTAPMKoKysGKl8qS6?=
 =?us-ascii?Q?Hz6I5mkeHgLOh3NIJqiHIqa9S/s9Ldsxk7QtB96Tha5lGdRABtj84rQOxFxn?=
 =?us-ascii?Q?XpJOdkr32jNnSwP1gozlYsEsWyFUXuTjLa/L3nma88z8QFy+xz/01LMXWZh9?=
 =?us-ascii?Q?kMr7p00I2PpFz5TIhpsEAs5nVtOnxnuHE0RrJU1ZeSEtcMytD0h5kZf4q5zf?=
 =?us-ascii?Q?o4P7VmFeoaI57ow128c39nShKSQd9aLsS0gMyG3w2H28R5POhqHQ46CElkx5?=
 =?us-ascii?Q?kiGVvu8K1nYnHhV7CkQXDmjoyrkiYsF76quqQcumn849YK3s67ZWKiuXhFjf?=
 =?us-ascii?Q?5qAOgg9x2bGZjumJHXz2TczFCxY3eC0ua/He0lN7rgquyqyegCS1cR183p9b?=
 =?us-ascii?Q?Bs05psQlA04r0edcQWhsORvjNfOTCNLKud0ks2e2h1ZS2XyDoZ7X1X99Y2KV?=
 =?us-ascii?Q?i3cOQXUls5h1y83Glp30x175eXLX8exiV91tVzT3jYOTxG2BM7EOjaxrKHb7?=
 =?us-ascii?Q?9NNOMsCgg+x56JQdge0UQs5RHox3ko1N0IQD008lGNmyWL+eCyi424lS9nBj?=
 =?us-ascii?Q?MBy1P8IYZjuyQuAje/J7/M+OqRt80h2fkAgRuLP0VMho8Y5pIQLVHLWEyhfM?=
 =?us-ascii?Q?siHm2AgXksdGhQ8jCfCcev8DgtFt3s+bLqeXv7X4Fa5SkdMbE03FC4HMaQ4t?=
 =?us-ascii?Q?/TYNdObBrArRj2Dldqaq3wdPy79xr43x3tMAfRe14Q4BO/jpRIIbh+tfkvfx?=
 =?us-ascii?Q?sR2wUZ6c1qIqoCq27uJuv3wFI+DsUK6Vu1Fmc0h2dvUbTOfUvy9Cpf3NgAOw?=
 =?us-ascii?Q?nzQqGzlcZCUIFT+TyvoGADa5KTJFxSHlleLaPu6okcfA20F9wcSfKjzUlJOm?=
 =?us-ascii?Q?XpmRdTJkm6mSV3SjjmDeJMBw8Yp9vEbyJ+NmYOeR6nNp/u16tuafWK1bE6Nz?=
 =?us-ascii?Q?3zwvVl0HiXGG0V6KFHB9RN6U7Mw78YdXc4yslO/Z96sj93bcT5WLEBFRWICJ?=
 =?us-ascii?Q?XVNHfWEcO8J6/KH7xqePTHUb6RhAjA9m3Wy2OEmXYlkPDOsKG+zQRCYa+sQA?=
 =?us-ascii?Q?wY5UhwqQeyfM6nwdfU98JfzzsvzKwQL+BXXuLYRVq+9MHU9eFM2nH7wltvcq?=
 =?us-ascii?Q?E/Lpc/CTVr1x7jlFqx1VxT8i296P5+RaIcSXGB6pyc7fPgvFwMt+DiYqLbN9?=
 =?us-ascii?Q?GMsFOAI0UcJJ5pMPaKFCdZUXSFxOKeFfzlKN+2K8V1PLSg8FadkPHPPH+1jR?=
 =?us-ascii?Q?b69K4N0bLGvd98OdHV8piejBdMkJYrpKh04lqBBGYMeQerPIL7lvZv03nyto?=
 =?us-ascii?Q?uUKUvbKe+oWqRv0rYphFe8dE/TBmNS8wkYu6mQUItKlUuHVwZ62TGg1AWTIP?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15573b5d-ec9a-4ae4-91c0-08de0ba05fd8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 04:07:36.5348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhgHvSiIOKPwAg0ylhAkBmwWC3/zbt+KZtDvmiI3RFtjmlB7oOFIalVfnJoBdMPsqIYTuq19mVBkbOJrEgMClfWZaXRSTZQKXkHe1Z0VfRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
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

On Tue, Oct 14, 2025 at 10:24:45AM -0700, Matt Roper wrote:
>On Mon, Oct 13, 2025 at 08:24:45PM -0700, Lucas De Marchi wrote:
>> From: Wang Xin <x.wang@intel.com>
>>
>> Add CURRENT_LRCA and CSMQDEBUG to register dump to help debugging.
>
>It might be worth splitting this into two patches since CURRENT_LRCA is
>something that's been around forever and can already be dumped
>unconditionally on existing platforms, whereas CSMQDEBUG is a new Xe3p
>register.
>
>Also, I think CSMQDEBUG dumping would probably make more sense to be
>included as part of the MQ patch series that Niranjana will be sending
>later; dumping this register doesn't really have any value outside the
>context of that other work.

ack on splitting. I will do it, but also send the CSMQDEBUG support on
next rev. My thought was that have that in would actually help getting
the MQ changes. But we can also decide not to pick that patch now, in
which case Niranjana can add it to his series.

>
>A couple more comments farther down...
>
>>
>> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Wang Xin <x.wang@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  5 +++
>>  drivers/gpu/drm/xe/xe_guc_capture.c      | 53 +++++++++++++++++++++++++++++++-
>>  2 files changed, 57 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> index f4c3e1187a00a..7b6ec0cf78c85 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> @@ -141,6 +141,9 @@
>>  #define   INHIBIT_SWITCH_UNTIL_PREEMPTED	REG_BIT(31)
>>  #define   IDLE_DELAY				REG_GENMASK(20, 0)
>>
>> +#define RING_CURRENT_LRCA(base)			XE_REG((base) + 0x240)
>> +#define   CURRENT_LRCA_VALID			REG_BIT(0)
>> +
>>  #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
>>  #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
>>  #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>> @@ -153,6 +156,8 @@
>>  #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>>  #define   GFX_MSIX_INTERRUPT_ENABLE		REG_BIT(13)
>>
>> +#define RING_CSMQDEBUG(base)			XE_REG((base) + 0x2b0)
>> +
>>  #define RING_TIMESTAMP(base)			XE_REG((base) + 0x358)
>>
>>  #define RING_TIMESTAMP_UDW(base)		XE_REG((base) + 0x358 + 4)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>> index 243dad3e24185..265aa7b7614ce 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>> @@ -122,6 +122,7 @@ struct __guc_capture_parsed_output {
>>  	{ RING_IPEHR(0),		REG_32BIT,	0,	0,	0,	"IPEHR"}, \
>>  	{ RING_INSTDONE(0),		REG_32BIT,	0,	0,	0,	"RING_INSTDONE"}, \
>>  	{ INDIRECT_RING_STATE(0),	REG_32BIT,	0,	0,	0,	"INDIRECT_RING_STATE"}, \
>> +	{ RING_CURRENT_LRCA(0),		REG_32BIT,	0,	0,	0,	"CURRENT_LRCA"}, \
>>  	{ RING_ACTHD(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>>  	{ RING_ACTHD_UDW(0),		REG_64BIT_HI_DW, 0,	0,	0,	"ACTHD"}, \
>>  	{ RING_BBADDR(0),		REG_64BIT_LOW_DW, 0,	0,	0,	NULL}, \
>> @@ -149,6 +150,9 @@ struct __guc_capture_parsed_output {
>>  	{ SFC_DONE(2),			0,	0,	0,	0,	"SFC_DONE[2]"}, \
>>  	{ SFC_DONE(3),			0,	0,	0,	0,	"SFC_DONE[3]"}
>>
>> +#define XE3P_BASE_ENGINE_INSTANCE \
>> +	{ RING_CSMQDEBUG(0),		REG_32BIT,	0,	0,	0,	"CSMQDEBUG"}
>> +
>>  /* XE_LP Global */
>>  static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
>>  	COMMON_XELP_BASE_GLOBAL,
>> @@ -195,6 +199,36 @@ static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
>>  	COMMON_BASE_ENGINE_INSTANCE,
>>  };
>>
>> +/* Render / Compute Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe3p_rc_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +	XE3P_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Media Decode/Encode Per-Engine-Instance */
>
>I'm also wondering if we really need to dump it for the vcs/vecs/gsc
>engines; although the register technically exists there, those engines
>don't actually support MQ so maybe it's only worth dumping on the CCS
>and BCS engines?
>
>> +static const struct __guc_mmio_reg_descr xe3p_vd_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +	XE3P_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Video Enhancement Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe3p_vec_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +	XE3P_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* Blitter Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe3p_blt_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +	XE3P_BASE_ENGINE_INSTANCE,
>> +};
>> +
>> +/* XE3P - GSC Per-Engine-Instance */
>> +static const struct __guc_mmio_reg_descr xe3p_gsc_inst_regs[] = {
>> +	COMMON_BASE_ENGINE_INSTANCE,
>> +	XE3P_BASE_ENGINE_INSTANCE,
>> +};
>> +
>>  /*
>>   * Empty list to prevent warnings about unknown class/instance types
>>   * as not all class/instance types have entries on all platforms.
>> @@ -245,6 +279,21 @@ static const struct __guc_mmio_reg_descr_group xe_hpg_lists[] = {
>>  	{}
>>  };
>>
>> + /* List of lists for graphic product version >= 3500 */
>> +static const struct __guc_mmio_reg_descr_group xe3p_lists[] = {
>> +	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
>> +	MAKE_REGLIST(xe_hpg_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
>> +	MAKE_REGLIST(xe3p_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
>> +	MAKE_REGLIST(xe3p_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
>> +	MAKE_REGLIST(xe_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>> +	MAKE_REGLIST(xe3p_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
>> +	MAKE_REGLIST(xe3p_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
>> +	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>> +	MAKE_REGLIST(xe3p_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
>> +	{}
>> +};
>>  static const char * const capture_list_type_names[] = {
>>  	"Global",
>>  	"Class",
>> @@ -292,7 +341,9 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>>  static const struct __guc_mmio_reg_descr_group *
>>  guc_capture_get_device_reglist(struct xe_device *xe)
>>  {
>> -	if (GRAPHICS_VERx100(xe) >= 1255)
>> +	if (GRAPHICS_VERx100(xe) >= 3500)
>
>Since there's no IP with a version of exactly 35.00, I'd just do
>"GRAPHICS_VER(xe) >= 35" to avoid any confusion.  Also in the comment a
>little bit farther up, I'd replace the "graphic product version >= 3500"
>with "Xe3p and beyond."

thanks
Lucas De Marchi

>
>
>Matt
>
>> +		return xe3p_lists;
>> +	else if (GRAPHICS_VERx100(xe) >= 1255)
>>  		return xe_hpg_lists;
>>  	else
>>  		return xe_lp_lists;
>>
>> --
>> 2.51.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
