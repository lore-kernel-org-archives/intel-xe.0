Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308D2C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 20:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB05710E845;
	Thu,  5 Jun 2025 20:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ti3n2uOx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114FB10E354
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749153850; x=1780689850;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sJVcT5U39r38S2z/1bo9jZmspvGK3GMXey0OGP6f56w=;
 b=Ti3n2uOx0gw1K3lGNwoq8bURtZbGGQm5yplmjv2ZMuClpkMOC/8Q9Mor
 ec8Fhwlw/EV9qplt5Q7JH1CSnIUC/pB+oNg2lFXGUbp41Oblhg+AwIlgw
 NaOYxAp2dmn9YZgh9roaWhQSosj6q9mPh/wQEoyyjnI780JaaXtpuB3T3
 GSbMM6NA/aoNgYNNAoksckvrTxNLU7x8dW1/Hs3cpIcGSk6bV7YM3PcaA
 AJVaC9m64Dc9KQwz+XWdWb0D7ZK+9/xgxtYcW/TfHUdDleEKOqf3JvjRu
 oKTi8x6oWliEVwWzq+WqGz/86996RjroDwhUwZ1NoSKXft4ip4Lk+/nf2 g==;
X-CSE-ConnectionGUID: WoKbiY+TS4qIyd4Py6rZag==
X-CSE-MsgGUID: MkKVymAxQnKoxDXyMtVo9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51291491"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="51291491"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:04:09 -0700
X-CSE-ConnectionGUID: 1Mpx5yGLR7eTudd0UcUgwg==
X-CSE-MsgGUID: ULq0aFJfRjGbbZYFrZBPBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150869898"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:04:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 13:04:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 13:04:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.84)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 13:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5Odgjjc0dQ4eP5SkXzFMkGXpBfn3QhFvNrnt4Z3Bf5LFYQ9F3XAEXljfjd9AeYtTDhlT6dKnFa4ecNDH9krDTAetHJ1dc4B8WZIv+bMncVcXdpR8eCh3YM9V+uYrCI48zsquZa/BNxopmcBAdVB9lNw/luf1yc/Q0OE4fa7yldyvjkpEsMBX9qO+iOXGlJhgaw+ruCZ0O/t2jhBALFtHVfy3Fnn2i6/ZxypGJ2lvGCEO0yskoBYrEngcAlvPPbYMt/uVc7Yqr8/s8TIso4MrhwAxZvAXkevLObykVqGF8eUPLJsMKzCQkN7B1OF1r4wLwU9toqPm7yB6BHdRx2r8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGQ62IGkBdnJ1b9Dx75p4QzQD0Q+OhKMb0vCdIVkoT8=;
 b=YZDs0fbt5sOsj3lXZdL/debNQqfkVUMCZkHNccSluNIm/R/SO5ZSpq6ujB0xaKPQcNrmLvbWNV8NeD7Lvvy/eTLJawvLlqiJw22iBN9Y7BxpcYI6GITiEe8WY7AeemRzGqxFmBM/Hwiy/fDC/TEHfAFVIqV5hrUPdTxmqwOM+F/+4/RqD2bjHqwjxY8hiMstL0vEp3I+Vj729I3z9MAVEwsgz30ywbqgzRpwhNaSn19EQq5vI62rSZIbDNYcxvLn5bzxuQ6aBjLgxQBCxTYHWBLMJowBJ/fPVcy2anJPte6C1cFc93Ubp0zEhBtnWLNv8R+3zm9GDIuRqgPoZFo9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB5230.namprd11.prod.outlook.com (2603:10b6:5:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 20:04:07 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8769.037; Thu, 5 Jun 2025
 20:04:06 +0000
Message-ID: <a0c92aa2-ed7d-41f0-8d7c-b66b36be3fa7@intel.com>
Date: Thu, 5 Jun 2025 13:04:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] drm/xe: Add helper function to inject fault into
 ct_dead_capture()
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Jani Nikula
 <jani.nikula@intel.com>
References: <20250524144613.11970-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250524144613.11970-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::12) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB5230:EE_
X-MS-Office365-Filtering-Correlation-Id: 47957515-9853-403b-5da1-08dda46c205e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGhjcnRrczJtNmRVbEhRNE51UkxrZnpjcEc0c0o1aXpQN0xZN1pwUGQ4SlRL?=
 =?utf-8?B?b2x1dUJRQ1hONlJmU3ZZdmd3dTNsYkNDOWdXMm11ZGJOejhveitDcEtsRXJT?=
 =?utf-8?B?TjFSVkVzUVFIb2Zvc3NnSEdKdnB6cWNGdEFEcjNpM0NqTGF0cUJoNEhLZGhu?=
 =?utf-8?B?NE12alhDTytqdms2UkRkRmpKVGlERGR3amdkVjBDdU14L25kcEhKQWxFY2w3?=
 =?utf-8?B?V1lESlV0ZC8rUTc2QmxyaldGSU1GeS9TK3BWVEk4Rkg2RmNYcmtkWG9IaDRx?=
 =?utf-8?B?RHJCSXFROVIwT0dWeW5uM1dTdm9aay8wMjVlRmhpcENDdEdUZnBBSGNjTS9B?=
 =?utf-8?B?VEFSamplK1ZDNTVQZUxmQkM1SWNtc2xsdHUwSjVVbUtOYlF1OGhhRU1vZ0ZB?=
 =?utf-8?B?RWFiWmFSOHVwUnkzTnNhY2dRNmM1YXdOMVNnZW0yVFhMQ2pBbmpLdTZ0d1Fy?=
 =?utf-8?B?WUV5cjFlSWpGVDJ1cGFKS2NDbEZhZjFZQTFraFRVSUZEWVhQVXdTamJFb0pW?=
 =?utf-8?B?NWgrSWdhdFJXK1dOQUJhVTNmeDlnMEhXQ3VPa0NVM3c5WWdXeG53aW55ZmhZ?=
 =?utf-8?B?NXIvR093MlUwSUVuYWYrcXN1OFAzRXUrd0dDM3BtdXRVYlZmV0pMd2JKbkkr?=
 =?utf-8?B?K2taTldlRVY2N2o5TGdqRWwveVAxeHdNSElWNHh4ZWtlWTM0dlVLc08rYzBV?=
 =?utf-8?B?bUV6VnZVRjF4V2lNSnlrZFJVZllXdUd1cUxPZSs2NVNsaVZMSW1sOHJha1lZ?=
 =?utf-8?B?OUZyTG1PVDFBb3dkMXEyK0x2cHJjalFqWVpMTVo3aG8wdUs2OS82dmM2YWJp?=
 =?utf-8?B?L2RISXhVdFY0Sk1ZWkpFQng0ZFNtZUplM0d5d1g1eXRXNkJoaTRNWjJ3Ymh1?=
 =?utf-8?B?UW4vZzlJREdrQnhxOWxrdXh3NE40NGFPODQxU3d1b0ZtekMzK0NNb2lMVmZC?=
 =?utf-8?B?WTJsNW1NTzNzSHVneEJvWWZwUjZucWxobkp6RnljVXRja24rNHNha0Q2OFdh?=
 =?utf-8?B?Y2Q0UFVmelRUVjdOcUhxV2NWbWl1RmhienBtL1RRRjQ3U0dZUmFSejhwL1Bm?=
 =?utf-8?B?RE5WaVhac2tYbjc5a0ZyeDhVWE9raWNGRVNWbzcrc25NNHNSOVhOUGd6T2xq?=
 =?utf-8?B?c1oxYkdybWl2ZVlZbFA4OEd0ZVZvSkl6UlJoSDVhTHZ0clpxRUw5SGNWekZY?=
 =?utf-8?B?N0lNSUZmN3hWVU40VGVvdWVvZ2dnSVFpb2dBSFJRS2dmTWZFYlhVdWY2QmdB?=
 =?utf-8?B?a1B6M1kzKytZNWZRVC9jYXR6b0UzK2VLVktUMW5ENk9ub1YvWkJmdFMwcnNU?=
 =?utf-8?B?M2ZQUCtMUFpubjBBZnNCVFFVV1dCUnZaM04zbEVxaTVVa2xlVzFjb2VodEtm?=
 =?utf-8?B?U3ZDMGtQVjV2RE1TN0YxbktEZDhoUXNGbVlHVTU0aVpHTEZ3dUJJa24vMHZN?=
 =?utf-8?B?ZGpWdWxuaDNWVlVIb3o0c1ZNZ2xmbDllK1Y5ZXpFL2tUY2RtRUNYS0prRmVp?=
 =?utf-8?B?N3RNeUxrS1ZsOC9Yb2xZSDhuQmhIU0F3VDRtSmwxOTYzOFR4aERnZW0zSjFS?=
 =?utf-8?B?ZCt3YWlhMmswejk0RDJZYUVZbjI2eGtpVng0dDVaLzlJRnRxUUR1SHg2U0Ja?=
 =?utf-8?B?VFB1Y2xZK0ZZZC84UVpQRlRMdXdBelBjZ3NSNHJUZ2NPMW0rZ1JYVGhLek9u?=
 =?utf-8?B?dFErTzF6NkZnMzhsT0gxVVhYbUdkSlQxYk12d1dtN2FBSFhEczhnR3NhbjBn?=
 =?utf-8?B?TEhvR2oyOVZhajJvU3gvdTN2VURvTlBKcktsV1o0TXAxcUQzTmxKWjViZ1lU?=
 =?utf-8?B?VTV1S2g5akRsMzVnWm5tVGovTVJzaERxbzhtY2tweFdjeFdWZEFuTEk0Y2RU?=
 =?utf-8?B?SVVDemhmalYwU0Q4T2JNRStIRWgxNkYvem15WDNsUkhUVVlRMFJjNjFFbjJh?=
 =?utf-8?Q?Bu3N5Hecu3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnZHY1lhTW9yTUVYbWJsKzZub0lSWlJHWllXK2V2RDkxWTdjVkxuZFkvREpI?=
 =?utf-8?B?eHZDSkZvZzFoNThIaUhpNUVEcENaSFd1NjNPalVqVW5tWFRkUWNDY3lXZzY0?=
 =?utf-8?B?UWdZQ29EKzJuMWIzMTFCTVIzdVpLb25INElPSnNBY1haWVpuMUJjdnZNb0RN?=
 =?utf-8?B?dnowdnNkbGlzb3hFS0lPV0I2S0FqUi9lbHpXV3BxMVR1aUFRL3J2VDY0QkxU?=
 =?utf-8?B?endKaWcreGs5RG96clppS1lHRDI4anRWekNJQ1lXSm8xTythaHljZ2prQXph?=
 =?utf-8?B?dmxzZTJnemlUNmd2NWpBS2RleGRxUHFoc21VUXlCSzhLM3Q5Y0dkbjFIR1Vy?=
 =?utf-8?B?TGpidFZSV1FFSzJkRlpHSWhnQ0ZsVGpVejd2K3hFWWJCMTRKaSt0cFdpd2ha?=
 =?utf-8?B?Q2ZubHBHWjJOMnpsQXJZKzV2SjR4c2NtUFk2bWtMdGVKQmljbnZhOGZzdHBx?=
 =?utf-8?B?elRXRE4vY2JTemhWQ2JiMWdXVWJheDl4Qi9uQmQzNHg4MG1RZVMrV3JhaTZr?=
 =?utf-8?B?a1ZoMmprdnhYa3BQeVliUWRtUkVISksvVU1wb1lRbmVEbGx6dEZnRDVLMmFR?=
 =?utf-8?B?MU9WbkdENWZIMlFMSXRGMWF6azRLS2o4NXJGMEM1NENQOWdVVGlRL292RnQv?=
 =?utf-8?B?eEIwV1l2WWJyS3l6OXlPRndWSEhWaUpUMGlsMHF3UUx1SzluSjN2eThjaUh6?=
 =?utf-8?B?WUVhVTZCSGJnSTI0YWxGT1BvNmROZHNRZER6Nk9SYlVUUENTa3ZwRzYxcGp4?=
 =?utf-8?B?N2oreGlCZzFHR2kxQkZyVG95a2VGNlI2R2VWMUpnRW1LWUFLUnNzM1NHYkc5?=
 =?utf-8?B?MlpVVWJ1aS9FdVZMaDZvWGJUdHR6UXlZRTlsK2xCdGJIMzMzdWNNQmt6NE5H?=
 =?utf-8?B?UXFyTnBYTlEyd3huMjlCZFJOV1oram9BcEgwRzJ0MG00NDB5cjN6QjBqaThM?=
 =?utf-8?B?UHF5eFI1MHlzeVE1RmdrR2NtbHJZU0ZnbzZMaE9STHBUbnVwbnFvcUVOUjBz?=
 =?utf-8?B?dS9jbmJmZ3B0M3lrTkYxSkJ0dXBiZE5kSCtUbWhGQi8xYUVxY2EzdGFidEEr?=
 =?utf-8?B?ZGN0Q2dzYVlZc3pYNzY2VmcxMG1mYWtIUGhvQ2xGUU5GVFA0Qlh1OExrZUNO?=
 =?utf-8?B?c3NtYmlERFhDSFpsTFcvWFRaRWlQcldWeE1Qam4wN2tmVkswVnpMQ1prdkxM?=
 =?utf-8?B?WUFhOGNGaDg0c3ZKMUFsSzdDQUh0cnJNeXFhT01MVzZ0SDQ4dUlmbmRSNytY?=
 =?utf-8?B?dDR6M2xOZjNPSTdYY1RnS1ROMXlLWE9Tbm1NbnI2NDZodStDYlJKNW9xeXBJ?=
 =?utf-8?B?MDExdDA5UnozMVg3NmpQMHpGai9ZWWc3QWxONDBmU2tZV3p2T1h1dll2Mzdy?=
 =?utf-8?B?a1o3LytoTGRsam9EZFBrcnJxSXgySFdhdit4SWtPeWpCblYrN1VjeUJ3eTFx?=
 =?utf-8?B?N1ZUTkh4ZDZ3cmRSVjRNYzZzMkg5WnE5VHJyaWN3UWt3UWNIRk5OaHJLNnlX?=
 =?utf-8?B?eUJFYXdpNm1wZkVZNE9iS3FTbFJ3dG9BNllRbU9UWmRXL3h4UFBRSVZtTXI0?=
 =?utf-8?B?VlMrRlI3R3FQWGJVMEpWRU1mdGRudnk5cStkYXhTZ04vT0ZSK04zazZtaDZB?=
 =?utf-8?B?aExFOWg4NnY3SXhGcmlreDBnbjZmUGQxYUpjdW44cXBwS3NtZy9kMlFubWJp?=
 =?utf-8?B?cEJFZzlNcjcvWkp1SHdDZ3Q2aHB2bTY2aVVLVVAxcjNOTjBLMG5mZmc4QlVL?=
 =?utf-8?B?VURsYjA0V2xDOSt4VnF2RVhVM2Z2cjQrMEVnQ2ZYeVB4SVBMUlZRcmw0Q0kv?=
 =?utf-8?B?aERJM3hDNUxTbjdEelJPMXZKNHNXa0ZnamoxaWg5UlpSTk55aS9VUDJ4cHIr?=
 =?utf-8?B?SU4rRUJQbTNXQWlTMWl4WUJrTmRZNkJWM0tSSjlsbm9EVmJVRWtaYVRlZzU3?=
 =?utf-8?B?dStEREpTbDdoNUx1RzlqaDY4dDZ3cUtVSjFQbngzUDQ3VitQTTBTSVdjcWF2?=
 =?utf-8?B?V3AzaFA4TEpRMC9LbUtIOXZDanhLOHl2cWk4ZHk3dDc1NnB1WWZkS2Fnb1I1?=
 =?utf-8?B?QlFRcXd4R1dXeXhqTGJROTNqOGt1RE9ER1U5OFlEOGxuSk9vekd5OGMvVlNi?=
 =?utf-8?B?UjNZclNHNFlZUFFRajJlc3d5NWFwRWFiZTF2L1pjZkZnNGdZempMNXZ6ZGZF?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47957515-9853-403b-5da1-08dda46c205e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 20:04:06.7345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RhNfYQw85zAKujc990JGXyM/ahE2mTSKklxfEb8h2THgwtHKCKYiPltbV2+YOt+jnAqbG9rU9mVWzdASMt46oXNqJHiy+eY5Xu+mUZb9jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5230
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

On 5/24/2025 7:46 AM, Satyanarayana K V P wrote:
> When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
> functions, the CI test systems are going out of space and crashing. To
> avoid this issue, a new helper function is created and when fault is
> injected into this xe_inject_fault() helper function, ct dead capture
> is avoided which suppresses ct dumps in the log.
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

This seems like the simplest and cleanest solution to me (for both the 
KMD and the IGT sides). I don't know if Jani or Michal still have 
objections to it.

John.


> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
>
> V5 -> V6:
> - Fixed review comments.
> - Updated helper function description.
>
> V4 -> V5:
> - Fixed review comments.
>
> V3 -> V4:
> - Updated the name of helper function and moved to xe_device.h file.
>
> V2 -> V3:
> - Added inline function to avoid compilation error in the absence of
> CONFIG_FUNCTION_ERROR_INJECTION.
>
> V1 -> V2:
> - Fixed review comments.
> ---
>   drivers/gpu/drm/xe/xe_device.h | 17 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc_ct.c |  6 ++++++
>   2 files changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..9dd31facc9d8 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -195,6 +195,23 @@ void xe_device_declare_wedged(struct xe_device *xe);
>   struct xe_file *xe_file_get(struct xe_file *xef);
>   void xe_file_put(struct xe_file *xef);
>   
> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> +/*
> + * This is a helper function which assists the driver in identifying if a fault
> + * injection test is currently active, allowing it to reduce unnecessary debug
> + * output. Typically, the function returns zero, but the fault injection
> + * framework can alter this to return an error. Since faults are injected
> + * through this function, it's important to ensure the compiler doesn't optimize
> + * it into an inline function. To avoid such optimization, the 'noinline'
> + * attribute is applied.
> + */
> +
> +static noinline int xe_is_injection_active(void) { return 0; }
> +ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
> +#else
> +static inline int xe_is_injection_active(void) { return 0; }
> +#endif
> +
>   /*
>    * Occasionally it is seen that the G2H worker starts running after a delay of more than
>    * a second even after being queued and activated by the Linux workqueue subsystem. This
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 822f4c33f730..89f992feba31 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -2040,6 +2040,12 @@ static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb, u32 reaso
>   
>   	if (ctb)
>   		ctb->info.broken = true;
> +	/*
> +	 * Huge dump is getting generated when injecting error for guc CT/MMIO
> +	 * functions. So, let us suppress the dump when fault is injected.
> +	 */
> +	if (xe_is_injection_active())
> +		return;
>   
>   	/* Ignore further errors after the first dump until a reset */
>   	if (ct->dead.reported)

