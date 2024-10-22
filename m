Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059B9D1CDA1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 07:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96B010E5EE;
	Tue, 22 Oct 2024 07:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xi0Uf3rA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C9010E5EE
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729581789; x=1761117789;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=aLCntN0azo1CY1YSUV0AY5MMVgwG0F9QqTnddGMrVtw=;
 b=Xi0Uf3rAVA8tAtNS6P4u3uGQB3uWkupa7l1hwhKU2AW2DlaVYqLhRbuc
 R3nb1r7iHzazX3T/Nbo34uEe/AZm611UW2/JRaZUbCMEqFc/KeRplXy6x
 Au1T0Zfn0CBPZdHcuywIvVlT+tEj4SEg2wMsSuiQBQU7kZMhLIe+a4YFq
 X3e/qHn2OH/finU/fFIcxvJd78D51xtECUonfBFFO4fN85pJgWHnvGM+H
 qC78aqD6pV588VRcbSlbzpGbQXQDHumya1ScN5mU8ymFrCbYa32vtxtiD
 Z4e+1BOMFluM9Z0Th8jR1PiWRWlvbIUw7HkeYWP8yLPk5RzUO/MAT73ba Q==;
X-CSE-ConnectionGUID: L3WhpjiJTjGptgCkYSrfiA==
X-CSE-MsgGUID: 7fAtI18wTIOnkPQzDQrr/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28975505"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="28975505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 00:23:09 -0700
X-CSE-ConnectionGUID: cgk9CFD6T++1nqz8UE6laQ==
X-CSE-MsgGUID: oh2bSzGBSoSEwHyPArW4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208,217";a="80133099"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 00:23:08 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 00:23:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 00:23:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 00:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4xnfKfCNsS7myHUsebnLkUqEN7QjdD/f9uFwZbkLWpzNvWgAQPNV8kQPLcjduKjYj50JNWxzkcDwneG9s/VBXfeRByogU5ynXnq2QM9GOJblqjolVy+rmQAPtnspdqy7yy2VpzVWY4wpfnpQ+NGfQxUlvgREnjMVpCgf5wOkDQTXEn+r1p70vfxFDe3RLvEcQDugRJt/5DngThhbfeJ/2Wv/dVfJXtdxZ9JeJ62rww9iLmuk2EIBT0hwpeFUmhZtyhRtGCVb8sUJmybF7P1++CnVcs4Y50LU7xCo12HqGQFo3yG0Csr1aYLUzqPojLhy1NEwZ9H7uyUXpEo3Y5gxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eninbo9mIy1m6Bh150g0FEutHZNvzivAwBx/n/P6WFE=;
 b=WCE/OHH37c/Jl5+MmoynL47iLC25uB9WBp6GgyNsfCZAmvaUFYqm7QxH7IPfQrBaAbRAaCnhu+s3EyC8ac2E8cgKWZiGAxonY2zI4ybfuJSLF7jXTFavBGBqVZxFh5tnyr296ihNGED+yBtbiypbozggd9Ln4pDbuWlC/4bG9IzZrcdtzTzpSSYCgCNdT9e3XIB8EC+j0tDkMoz+Q19BxslP6XfeleKQ5ukVkuoeZogwGUnyOBdSyPJ42NDDav4uQ9XRtCwP2ViFfhRe7y1XL1UX/kQVYN5vXVbCJ8ms0tyMEwmZ9Soznh61ZJglYYwDh92+XqmN8aq37RSW3g2Cqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.29; Tue, 22 Oct 2024 07:23:05 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 07:23:05 +0000
Content-Type: multipart/alternative;
 boundary="------------ctPTaHtfsQeoPfHH52730Ywh"
Message-ID: <fc9aca26-1f4e-49cb-b11b-cd51e03d493a@intel.com>
Date: Tue, 22 Oct 2024 09:22:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't restart parallel queues multiple times on
 GT reset
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
References: <20241021211146.3842483-1-nirmoy.das@intel.com>
 <CH0PR11MB5444BB63F191EACB8572EBDBE5432@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <CH0PR11MB5444BB63F191EACB8572EBDBE5432@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|LV3PR11MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 09e60632-4cf8-4866-4553-08dcf26a5eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzBERDVWSTV6WG41L1JIa3krUnFybGYrVksvT1ZtbDM4dzA3emVncCtubUY2?=
 =?utf-8?B?MkUvNXoxL3RaWUkwUG9rSGpYRVZsa1N0b29zbndYekI2bTIrQ1FZZTR2UHJs?=
 =?utf-8?B?eENMbjVuZy9uUXRGWUh0RVlhc1JpK2dnclZVd2ZKYUJSTVBINHZERHZiMW16?=
 =?utf-8?B?cTJQb0lLTWwvOFBMcUgvUk8zQ29BREM0WWVXN0V5OEpMY25pZ1M4K1lRUEZ3?=
 =?utf-8?B?MEZ0NEd6R0ZjU3NBaHRxNmYzWXhNQjJKeGZ0TWI1QlIyZmlYM1RlV05Zdzht?=
 =?utf-8?B?V2I4Ni9keVVRRER0Z3R6bVFaSG15OWI4NFlGWGxnNHRyWG9CRWFzMzdOMEM2?=
 =?utf-8?B?M0wzajBPcG9XT3NpMDZhUmxybmRJY2E1SnJuNlJIelFrMzZBeFFyUWtObDVp?=
 =?utf-8?B?N0dtK3hJQW1WZmNXVDI1WEI4UC90UEVKTWEyZHRIMUFWb2QybHdDazk3VmtE?=
 =?utf-8?B?ZEdsdmY0YWVZTUcyRGREc1VNUWVSYjNoaGtSR1FKR3JwWW9UVnM2MXdjaG0w?=
 =?utf-8?B?cDhoZUhzUUo0c3ZZS2d3ajRJUEJSTU9wT2NLNExKYUV6bytoQnR0VEs0U2Jr?=
 =?utf-8?B?WWdaWjhIRzd5NTY5VFNhL04ySUo1RHZxNmFYS0lxMzFIZmJCU1p3UktQQTJz?=
 =?utf-8?B?Yk5MSG9jaFF0WkJGbC9USFJYa2dVNnhxOEIyVTZTVlpVcFdhVnhpMW8xcVpR?=
 =?utf-8?B?ZnZQcmlHczJHbGRmZm5TWkd6LzFFMERTSms3YkRlRlBTcWFwOXZQTFBNQUVr?=
 =?utf-8?B?UnFaWjdmcG94WWNsb1JaemkrbUFJUkdtcnNZRTkrR2Q1Z3poVExZSm1hbEwv?=
 =?utf-8?B?ZXhKNE9tblhDUFFEcXBrenV4WVk0K2hQaWJJN3ljQitETWZWRjFiaVJvT1hJ?=
 =?utf-8?B?TjNBa2Nxc3Vnd3Bhb0pXV0dnZGlBcTFsMGpHMGlVTVhqS1M3amZoM1k4cVdO?=
 =?utf-8?B?Vy84OUh3OFFLZHl2ZVZDOWFxSWpLY0lIaHd2L2xXQlhTZUhBWXBsbnpXcmZN?=
 =?utf-8?B?VzQ3bWdTNEtuTUNySlk4QlAyNDJJWk1GSUg3NTh3TENhS25PNVNtN1ZFajJY?=
 =?utf-8?B?cmppTVpHQnpnZkN2UTJXN2JiUk1Qb0Q5N3VkeERSekdIQXhzWjNCSHhVTjNm?=
 =?utf-8?B?MDBNWHpFbWNhSGhXeWh2dFlJZ01ybFdBNlh1eXFTQkZrWHBZOHMxNVNMc0Uy?=
 =?utf-8?B?OVNqRFA4SE0zNW1TM1RkNTdMMmNnU2ZZNWpSY1YxZjhYazdOcHJXMlIyMldm?=
 =?utf-8?B?Ykkzc0NZM3BBZkhCbTdyS2V4clVWTGtHRld0ZDgzTDhFdVdEUS8za1hORXpu?=
 =?utf-8?B?OTZTT2JYdjYzUGVraWxuTkQ3bFBuMk53TWxtdW5SSDRCd3YvU1lzTDlYODk4?=
 =?utf-8?B?bmdXRVZSRThwU1ZOdmxrbFRMRnZvVjRDQ0NSbEdJVGEwME93N1I1OHQrcjlo?=
 =?utf-8?B?RGRxWkE2TExISHpyVWMvZURwYlhrc29zY2pYTGFEQW11ZldrVy9YRVJGeHVO?=
 =?utf-8?B?ak5qVGRwOHl1RzB1bXNDd1dUNDQwTjdwaC9UQUNaYlFTL1BKMnU1UlVocnVW?=
 =?utf-8?B?NFgvd01wZTZzNSt5THBUWUtmM0NPRmFrRjFJOVFTQkhvYkRHZ1BFSzhwa3Yz?=
 =?utf-8?B?VTNrWUUwWUNMV3g2QzhQcnZhaE9HWGRYTnp5TDhuRVZxUkc1VFFNbzlLUkpH?=
 =?utf-8?Q?KKho6YpI8kSw1GLwVffP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHorNVJMR3dEVlpKZlArT212WnMyaGluemNSSEVmZlUxZ0c5R3pzUmZVakVm?=
 =?utf-8?B?L2pUcnIycUsvNENOb2RQZmZiZUJtTlVOZk1qMEJVZXRqUm5weDdzVDZXT1Vu?=
 =?utf-8?B?cmZWV1J5TWlUdnBxZ3NQUFhvMEsyTDZVTjZuZFBwUVAyVG0wWU1WZGpaa0Ja?=
 =?utf-8?B?Und6TEllM0dzb0FTaFFWUXlnMVBzVy9RQkQ1UjN3UlVmRFBDbG9QRnljSXVo?=
 =?utf-8?B?WFlLUUh1bVVYaUpwdldxcXVSQXpIOUVrRVNEeTVWSEJNUDZQVFZPMVJUTWpL?=
 =?utf-8?B?eHNYeVJ0SG5NU25aSEd0R2N4WXBqb1pacnE2aStZeXIyMHdsSlRuVjFEUjdz?=
 =?utf-8?B?ODB3WGI2TzhLR2xtdWJ1eUg4QTNBSzA1M2NLaXdQVG8wKzlZcE9xZW5Jbi94?=
 =?utf-8?B?SXJaVXkwSmlmemxCZG9yYjlqU2pmS2IyUUk3YVM4TUM4bVRndWdlM2ZIeDln?=
 =?utf-8?B?bTI4c1NCOXcrbHEvbll5YUZFS2JjcUVqQ1dKZDI0bG5wZzV0UDViYnR2UTF5?=
 =?utf-8?B?cDE3RDFaMjlqdWVEajdFVm1qajloNlh2c0FLRy8wZkh3a3lKTGM0R2o2NGEy?=
 =?utf-8?B?SzF2YlRFT0pnNEt0TEFUNzhGOE1ObVIreUo2VWpPc3VCUmVJczJieDM3K09z?=
 =?utf-8?B?dzAvUE1BOUh4VmJhNis5WnR0U3kxMklGbDkwMkVYcXg5NzRPTDc2Ykd2c3J5?=
 =?utf-8?B?VEozUTBhemRLSUhCMVZydWRzSy9lRzBsdTg0VXV1bURIRm1QbW8yQkxwMEFZ?=
 =?utf-8?B?UzBXL0VrZnVNMkJUSWxPdFRremh1dWIyRU5jYkhPaFE4TVp5Z2VRT042VG5T?=
 =?utf-8?B?Q3JIUjg5ZGNnZUR5WlYvTGdsM3FFT3BPaG9pcTEzeHFJRTBpT0xUd3g0YVRX?=
 =?utf-8?B?ZlpVOHZSeitiTEl6bzc2TWJiMW93SzdFUUlKQXF2RGM3VThrd1ZzMUpzODN6?=
 =?utf-8?B?V2dybllVVUhkT0hKTm9RQ2FBT0tKRXhFZ2tuRlcvanFEN2JoKytwVXdHcU5I?=
 =?utf-8?B?VVkxd3hVRHY0STVhYW9yeWdIUXYzWDVwUTZJdlJaQnA0MG45N0FCNndiN01j?=
 =?utf-8?B?R3h2TE0vV0toY2creXMxMU53RVBCVjIzNERtM3JqUDZnR1RLajdqZTJhdVpu?=
 =?utf-8?B?OER1bGdLZ1FDYmZqeUtDNWIrK1RsY2xRTmNJM0NpVlV3dUFXNGZoKzRzRHhZ?=
 =?utf-8?B?dnNrNXdzdEFiWDJDYW5PUGRIQktyaXpNYjQwbGpuWGR4dlpVYmI3aVpOeWhm?=
 =?utf-8?B?Sjh6dzNHTE56NkxxSHBCWlljdk9haXY5ODJ0MFlOUnM5SlRleTBOYWlsSVBD?=
 =?utf-8?B?anFwclVaZUp4Wll3amQ2ekV5QmQ4alhLSnh0LzlsZWNUMnQ1SXdRUkxxOWM0?=
 =?utf-8?B?U2JqTWpoUnFaSXlTVmRucnNUVGdnbWFieDVMMG0rRVhEN0hNU2VuU0xxYXF0?=
 =?utf-8?B?cTlQcE93TmxtK0JWZ2Z4TlBhOGNMU3RSa1R6S1ZCejR5ZldkMnBLWnhSUm43?=
 =?utf-8?B?cnJhMTJ3TFZUb3l6UEw0bVN1SG90QnpCZHg0b2ZIQ0J0Y3RMWEtjWm1KVDB1?=
 =?utf-8?B?Mnd6VWxWa3lnV21qQ2xPUVFBQkh4M1U3KzNoT3VIbWNsQm9XWk56TnVFWUVT?=
 =?utf-8?B?VVBPT1kweHVqYm42a3dDUjJSSUZhSm5xNUx6b1ZQTmFaVTlvU0V2NmZrS1FU?=
 =?utf-8?B?OUJoVEtlTVVEdFRUQXZNWko3YlNkckUwRElYaTljSTd2d2k4V3NyUmdOZ0ho?=
 =?utf-8?B?Y2N1ZGl5OEhyMmtvSm5GeWNDWk5UaUpoR3hjYTk2ZEhpdCs4aXoyU2U5TUFx?=
 =?utf-8?B?TVZqb1dLNkdyamEzWGtzc2Y5Y3doeHdSU3lzNDlRVDUvUmdvMlV4allCc0Rq?=
 =?utf-8?B?Qk1aVVdoaTZoWGxhT1BJemtyNW1PS3NKcUNtZEhMZ1BBV05UdkM1K1BNdVlM?=
 =?utf-8?B?VGs0a2ZiREk0TXQyTWQ3MUJ6TVM0UUhOZVc5MjlNVmpJV0F0ckRrSG1tVlJ0?=
 =?utf-8?B?eFU4Q3FENUNPaW9wK0dWby9UaDBEbUIyc3hzTkkrTTZDYXk2SmJYdHZZYjFO?=
 =?utf-8?B?SmRHZnpiN2xkZGQ0RDZoMGtkTUhHb0lIbHNVMVFiTmhWMUlYWFpwSjVLN0k0?=
 =?utf-8?Q?Guhs+JG1RnbLv14QsPstO0fQX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e60632-4cf8-4866-4553-08dcf26a5eec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 07:23:05.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: defQmz/mv4tqYl1Q3yL1JXR29WdBltXhDMFjZZmlEoLCKeYdFV6qPPE2/RBdM4SeEfxqvg01hwEnVmqNrnfsdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
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

--------------ctPTaHtfsQeoPfHH52730Ywh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


On 10/22/2024 12:28 AM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Nirmoy Das
> Sent: Monday, October 21, 2024 2:12 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Auld, Matthew <matthew.auld@intel.com>; Brost, Matthew <matthew.brost@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Don't restart parallel queues multiple times on GT reset
>> In case of parallel submissions multiple GuC id will point to the
>> same exec queue and on GT reset such exec queues will get restarted
>> multiple times which is not desirable.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> This makes sense, though I'd assume we'd want at least one of
> the GuC IDs to restart the exec queue during a GT reset.  Is that
> what exec_queue_enabled helps allow?

Yes exec_queue_enabled() should be false for the 1st one but as Matt pointed out this is racy. So I will resend this with

Matt suggested check.

Regards,

Nirmoy

>
> I won't block on it presently, just was curious if that case was being
> handled, or if we didn't need to worry about it.
>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 0b81972ff651..6aeb007eaf06 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1784,8 +1784,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
>>  
>>  	mutex_lock(&guc->submission_state.lock);
>>  	atomic_dec(&guc->submission_state.stopped);
>> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>> +		/* Skip restarting parallel queues */
>> +		if (exec_queue_enabled(q) && xe_exec_queue_is_parallel(q))
>> +			continue;
>> +
>>  		guc_exec_queue_start(q);
>> +	}
>>  	mutex_unlock(&guc->submission_state.lock);
>>  
>>  	wake_up_all(&guc->ct.wq);
>> -- 
>> 2.46.0
>>
>>
--------------ctPTaHtfsQeoPfHH52730Ywh
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/22/2024 12:28 AM, Cavitt,
      Jonathan wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CH0PR11MB5444BB63F191EACB8572EBDBE5432@CH0PR11MB5444.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Intel-xe <a class="moz-txt-link-rfc2396E" href="mailto:intel-xe-bounces@lists.freedesktop.org">&lt;intel-xe-bounces@lists.freedesktop.org&gt;</a> On Behalf Of Nirmoy Das
Sent: Monday, October 21, 2024 2:12 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
Cc: Das, Nirmoy <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>; Ghimiray, Himal Prasad <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>; Auld, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>; Brost, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>; Upadhyay, Tejas <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Subject: [PATCH] drm/xe: Don't restart parallel queues multiple times on GT reset
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
In case of parallel submissions multiple GuC id will point to the
same exec queue and on GT reset such exec queues will get restarted
multiple times which is not desirable.

Link: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2295</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This makes sense, though I'd assume we'd want at least one of
the GuC IDs to restart the exec queue during a GT reset.  Is that
what exec_queue_enabled helps allow?</pre>
    </blockquote>
    <p>Yes <span style="white-space: pre-wrap">exec_queue_enabled() should be false for the 1st one but as Matt pointed out this is racy. So I will resend this with  </span></p>
    <p><span style="white-space: pre-wrap">Matt suggested check.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <blockquote type="cite" cite="mid:CH0PR11MB5444BB63F191EACB8572EBDBE5432@CH0PR11MB5444.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

I won't block on it presently, just was curious if that case was being
handled, or if we didn't need to worry about it.

Reviewed-by: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
-Jonathan Cavitt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0b81972ff651..6aeb007eaf06 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1784,8 +1784,13 @@ int xe_guc_submit_start(struct xe_guc *guc)
 
 	mutex_lock(&amp;guc-&gt;submission_state.lock);
 	atomic_dec(&amp;guc-&gt;submission_state.stopped);
-	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q)
+	xa_for_each(&amp;guc-&gt;submission_state.exec_queue_lookup, index, q) {
+		/* Skip restarting parallel queues */
+		if (exec_queue_enabled(q) &amp;&amp; xe_exec_queue_is_parallel(q))
+			continue;
+
 		guc_exec_queue_start(q);
+	}
 	mutex_unlock(&amp;guc-&gt;submission_state.lock);
 
 	wake_up_all(&amp;guc-&gt;ct.wq);
-- 
2.46.0


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------ctPTaHtfsQeoPfHH52730Ywh--
