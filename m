Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E656CDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 16:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1103C10EFC9;
	Wed, 24 Jun 2026 16:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gC/TlNxg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932F110EFB3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jun 2026 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782317005; x=1813853005;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UJPNIerB8h/7Y8Ey86plfJCRvk0EQ7q6p3tFjfeMcck=;
 b=gC/TlNxgWppsRExYXSQ66FtDuVVNL2RrcgMou1lXqE4Ez1G6bp1fKoI6
 rCLOh9ANKxNb3V4Ns5ZTryh8QdvyCdSS0S/ddCFurkfJtvU5hxOf1ayPW
 nTq+TSnUtW01Xk8tsTFp5dJgIW2z+N5qZa5mVhGr9EkfwpkrR4RWxl6zo
 1mGAWg2IznW/ZEWnYX9yGFIiy7iWxj4FBDJ2ESpboYPWVLo6bU5LzNKY/
 GScdyoej6MUAflkg5g6xKKWvrUtpc1TVim/w+FCviDJ2f2f0ct/9+ybSH
 WJ2FRBj9QMHMeUqNDoIKKDzb67IXwBkPxEuOv4quNv15xYZ+6mScOlgO7 A==;
X-CSE-ConnectionGUID: 7PHnZkk2SraV8Vbc5SRWfQ==
X-CSE-MsgGUID: WACJtd0FRk2opWz3bVkzLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="86988729"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="86988729"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 09:03:24 -0700
X-CSE-ConnectionGUID: KPOHGbb9S7aFFKeJLJSOuA==
X-CSE-MsgGUID: s6GVtZ2YRmO1ICQAaTY0dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="249748758"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 09:03:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 09:03:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 24 Jun 2026 09:03:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 24 Jun 2026 09:03:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7kC+4QxJlbyQdYqTvAJWgdEyJzbaMV31QeHrfg76FP/owQO8xEgHjolCyk/kBerBV2a/C6l2R6KAQ94vU4fm5pCjbHF2f7gvx84J0zdv7D9ydVLqCbCDyrbh42UYA/CLPrjl5Hhm3kIZVUKw/fDLaa1dNkbhagsM/JqWpK5xaxf2s2rtDDlYm7q+CVSjBGlKrLG7En4sAcectdm7iitUlWGwEawNCN+B6YjxY7Z9eBPvHWaVUSmys/ZusFUdVJfH+ugmapzUHMkJLFuGutVNBYEwXdaS3yCJdxzQ+4OdNLEGL/K55/iBN8wEEzfxbmMVBYh0bSNv/nYT4oA4tjeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2290LH9e0kCYwQgRQv7LNCyTncA0FKh2xFWLA4HL33U=;
 b=dwxB4iEjlAC/Q2V6Hf2wdHqPVevaOO3FjCVaJpob+PV06uRtZK0p7crePdxwSZrrg7fTnoraWn0Ukw5quHIzkjHpF8B/WpOG8NR1Nck8oVvmVa2kaRWxh8XfrSkKA9dSjwibm2Ah/SRVSsSpkAPg7oQIwf25WRwJdqsnGmJ6foyTIWWcQhrHaECJEeeNkVJnLOhWx6h6T0/IsS0nFNyWVvBeCA88R92jO6N4XGFx0nSG9OBmUc1uFhBoscvO1Lmq4MORW/s4nE2qWg55fRzngC0qFekRA+8fOFbsyxx3h8esNPhmo6lO9EYH2Fg0odZ7M1KR6doanhrAeZ1fDgK4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA1PR11MB7061.namprd11.prod.outlook.com (2603:10b6:806:2ba::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Wed, 24 Jun
 2026 16:03:19 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0159.012; Wed, 24 Jun 2026
 16:03:18 +0000
Message-ID: <0ddec0f7-4230-4548-b20d-4128b15c9a4e@intel.com>
Date: Wed, 24 Jun 2026 21:33:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] drm/xe: Add RAS logging helpers
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-7-mallesh.koujalagi@intel.com>
 <6a1dbfd1-9fce-4f02-85bd-7d6038f41ff8@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <6a1dbfd1-9fce-4f02-85bd-7d6038f41ff8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0075.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA1PR11MB7061:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c16fe87-a59b-4377-13fe-08ded20a1b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|18002099003|22082099003|4143699003|11063799006|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: PfmDfiY/1XYF4209gVHZmb83fiCPelok60+8H5dzL6Z0BdGvw2nc7sPoi6QRvLxTPbRg7CdXRCTra6R8m+i/3UUjWYxlUHaaecdouNYFc8EOSmiPOvzKgp6wVmPPoCpO/rB9lWt8PTOa7pJuCJOmkO/t9QYp2pGO43JTUtGWBb+tYATok1oTy6UEzp2yYXSNz4bggkn3sdmzRKKsGDxj8lzAWeebqitzedaHtde88mdMI+kDS4OOXOfpQPIdiVj9ZoU+Mfm3fC68sifaD4+NjL8gHHxTMjMwTpiJTcBxyUxa//vLPOrFe0dpjiJ+ixIKsIOgIIITE9trkkPLEt7CGn8LAj7PY/7Oc/TcKBda1j4BEdEH6aRrXCZPKiYiryRaksd3RwGPw1E46q4FYRSPK0Ejw4hLhNlUIWELeHCCR/1fytfS8XMYGtdkOKd3N3/m46GPnozfsQ2fyBgN+/3Smv3zlirQC+4YhAerP6MdioB9Fig2smfqC9BzD4pNMGihSFsZGKszJIjfz3QSvFyxaqSM1/nGdGgDlaQKWsYIGptuKxJf1UbjoI5z/AGcYN0imwL007KVJzfHIKPGXEmvYl6UBaxgE3yK1M4X9EhPMoga6yhI/YVndIFkbdYdf3peDQ3c1uVsFElOlQeNpFKx/pYpVyTCbOsDsbJ+t1FjI1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDNNZUpLR3RzQXFPR28xQ250ZWIza2F5cTJBUGI2d05XNVkvaWZYUFdjempX?=
 =?utf-8?B?dWRidWFYSG5mTmhmMFhwUmZET0NsRU00UXlscEVhZUhEd2FOd1ZBTWhJTlow?=
 =?utf-8?B?aWU1VUY0eFA4Q0RNaHdNWnJpOEJadlBDWnFPdkdBeTAxaW4rRkd6VkVzRGJV?=
 =?utf-8?B?c25vS1BDUTdsOHRUQSs2YXgyQUZLMVlpN010N1RZcFdIWE5Zek1nQUQ4S1ZO?=
 =?utf-8?B?ZTVMZjlRbG1YVUdZamt1UVFqTWhabkwxV0hOMis3a3FzazhyUUt2bFRCNTZC?=
 =?utf-8?B?eC8ySXFZNWMxSGFiRE0rLzdubnROY0FNeFpLSmpWYXlaVHNCdnlCbzVsTnlG?=
 =?utf-8?B?TExSTXh6YVdKUXN0cHduVW5KcXQ5cCtjNUZTNTBLUkw5S2grZkppRy85RklZ?=
 =?utf-8?B?YkxkS2twMDhzYVA4eVFwanRSYVpxNVltRVphZzF6T294dGd1cUs4K3BUZEh1?=
 =?utf-8?B?eEJ0THpPbU1lNEUxUUZHc3VTUnljSFAxUzVKMUFZeSs5YzJvRTFvWlNRMkdz?=
 =?utf-8?B?c2tubXV2bmpPMjV6ZUQ3aWVRczNxUjBMVTJsT2lZQy9RT3N1NjlhQkJyaE95?=
 =?utf-8?B?Q3NaM2tCTSsvWEVmM2ErQlRxWU1EUGhscmxxdk1lV0t2NlIrWUMxcDhKM3dG?=
 =?utf-8?B?ZGhsdUZNeXI0NzZ6dDU3QU1FbThQczJkVUVMT2NaUVZIUTJlVE5hSitvYnh6?=
 =?utf-8?B?UzF5K1VyUnF1YXZqbDBxeDJzMExlVTZKRDhzV3hoM1IxKzlucURTVVBOUU1i?=
 =?utf-8?B?cDFjVFpwdmRzOVB3dFp2bWpZbXBkaVRQNEd6WlUydUlHVGhtdXpxTzJzU1Nn?=
 =?utf-8?B?MFk1bzBtaERXK2NRREhmTTFVRjVwcXFlamxXMWxwcXY3SjNid1RSM2Q3Wi9F?=
 =?utf-8?B?K2RoN2g2V0hBeHI5RzdZSEdhOW4weVlJYXQzVERsYUFSWXZldFEyRWFadnIv?=
 =?utf-8?B?S01wc0haRkhteTFRWjhPMlFEd09SQllMdHgyQmVtWkRYMjN2SG4wZkpKVjVL?=
 =?utf-8?B?YkRjRDZROHpJalN6Vy94MUc5Qy80Ujc5dDAzL0Z1dkxTR2NSeXZRaks4Myt3?=
 =?utf-8?B?aDFBT1MxWkd1ZVlKb3pIOXNjZGQrVmdDeUc3YzVWZjRxSU4yNVV1OGJaVlo5?=
 =?utf-8?B?L21oVVNaYXI4elMxUVF0VjY3eHVUZ0xzNzV3QVpZeHFqNTEvZ1hrekY3eEdv?=
 =?utf-8?B?TEl4a21KaUhpSHM1MjZwNEdDdWhMdXpnT0xvQ1Mxb3BacWQ1ZkdzZ25RZzkz?=
 =?utf-8?B?VzNGdGlRdXY0UkljOG9CQUhJdzlMWm14Yy9hREpOKzVCR0FOdTdydGV6ZktO?=
 =?utf-8?B?VlFqMEdtdkU5cXdmN0lpemtuQTQwNHFEVGF2QnNweStQekhIcVhBeWFXTlE2?=
 =?utf-8?B?U0hPRkdxYktzTkdTd2FCUldEZmxDNkVBSWRjRXNkV1FqbHBvRU51QVdUSUYx?=
 =?utf-8?B?U0dwVUl6UnRjQ0lDQzhXSFNZMEh4VnRWZnZMM2l1cXRVekg3Mk1yUjhIbGs3?=
 =?utf-8?B?YzJmSUNGc3NtSWFKN0NZbjczWjhMVnNId3dGUWw3MWd0QXpqMCttSzBJVWc0?=
 =?utf-8?B?Tm52K1J3MGdZM1d3WkJwUFo0U1B4ZjJDMTRDV1VHcUZKbXpNTTUzUk5sYzZN?=
 =?utf-8?B?YmxXbUZGVStFaFJZRi9MMlVPVXh3RDZLWE5JdnVOb0RMZDlJbmJHQm9WclZm?=
 =?utf-8?B?M0RkdndZaGJsNmFCOUxvcnRpZm04SjBEQVU1L29aNDZ5aWE2bHRMWTEwVXhS?=
 =?utf-8?B?NlhHVjRsOXlMMkxrTWRpODRMb3B3ZFk4WjkxOElVcjVyTXZiTTVRdEhLa1VT?=
 =?utf-8?B?YTZiRFVrV3dkcytqc3dGQkVLRlBLdFpYTkpCMjNCQ0dTc2xnUDZYK3ovNjZ2?=
 =?utf-8?B?ajZXUmgvWWNVQ29GZlVaZmxRMzkxanloRkFDeUxFbHBjT0FGNC9NYjRXQmd5?=
 =?utf-8?B?Um55ZTJNencwTEV1WEVBRUY1ZXRnZi9RL1dUMlJYQWlwc3NteXgrcFY4UGZM?=
 =?utf-8?B?NlJiRXRGYzFqOXNjVVJoeFhCemVZMUVESHQ2ZjIwd1dpNzlGaTVUcnpsSlpJ?=
 =?utf-8?B?RWxCNnZkdTR0eHBueXJyNmRrZ1JQVU1odnpMclA2WHRyNUordFpMV3o3THJu?=
 =?utf-8?B?ZDF1Znc4OGllVG9JZjNtTWJlYVQ0eVFTNFhtYnRURnIyUENvblFsNFRPSERi?=
 =?utf-8?B?aEJJSTVLbjlYTHBwVlllS1g5ZlNwSFZ4VEg0Qm4veExrNG4wM0k0a0dxWlE0?=
 =?utf-8?B?ckJTL0dpbDM1c0NsQ2lUa1FYR0pYdjNaVUJzUFpyZjZ0TWpZeFVSTitnZ0N0?=
 =?utf-8?B?aVl3TktVOTdDV0ZaSWJ4a2FMSTlPQ04xaHlvTG1sOERBZ1dSK1Rsd3h3K2s0?=
 =?utf-8?Q?WLcyMK5jWfRAB7Ko=3D?=
X-Exchange-RoutingPolicyChecked: OLXe7W759ZSqSgoKe/DPgBbHvch7iNXLwB/j2hCCMyvKBMIEpu5ogmsngOji6v4KtcQjdZD5jzU4odTXKSt7x23plV4Bd57rieQrjd1gmW7bYUXP5kYL79Tjs3c/dJ+ZZVSS5/m23MjdjZ00Xe7Y44Pwx4nH8H5nkB4IvaRgrp3UPFQpOENQDkc5znnVAg8EolSgIM7AsEuQre51e5MxcadIv9vp/7UkpJ3/NDJDTWJSdxaZDfRfroYhI1Gb9aMhslGNkcfnUOpbG+fuZWIrmW+w+yXt52Hz1sPmnL5w00EZfdTW/TW7/mYyyGU332G0sBledtu7i5BoL8fa/TLSDA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c16fe87-a59b-4377-13fe-08ded20a1b45
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 16:03:18.7059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcdTaQGLef21xaVUS/z3pH0Xwhc0ptNTJv/+VexOmzAsN69kSwiaF+pjcRrv9QyTt9VrCkiujR62FaETo6Xi6brP3XRRtkY2mEfB7ksDEOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7061
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


On 21-06-2026 12:59 am, Michal Wajdeczko wrote:
>
> On 6/17/2026 12:47 PM, Mallesh Koujalagi wrote:
>> Add xe_ras_log.c and xe_ras_log.h so the driver can report
>> faults in a structured, machine-readable way.
> hmm, but the dmesg logs are mostly for the human admins, no?

You are right, dmesg is mostly for humans. The machine-readable 
interface appears to be the CPER

payload exposed  through xe_error_cper/tracefs, while dmesg is a human 
friendly rendering of the

same event.

>> The core is __xe_ras_log(), which emits a single log line with:
>> SIG_ID, severity, location (device or tile/GT), errno, and message.
> our dmesg logs are already to some extend structured as they contain:
>
> 	severity:	<3>
> 	driver name: 	xe
> 	device name:	0000:00:02.0
> 	subsystem name:	[drm]
> 	error tag:	*ERROR*
> 	location:	Tile0:
> 			Tile0: GT0:
> 	message:	GuC mmio request ...
This patch add is a more uniform fault-event format plus the 
CPER/tracepoint path for machine consumption.
>> Fatal faults go to drm_err(); recoverable ones to drm_warn().
> note that we already have xe_err() and xe_warn() wrappers
Good catch.
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
>> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
>> - Move __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
>> - Make macro function properly.
>> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
>> - Add sig id documents. (Riana)
>> - Change macro function same prefix as the file.
>> - Handle __xe_ras_log() function with variable format.
>> ---
>>   drivers/gpu/drm/xe/Makefile     |   1 +
>>   drivers/gpu/drm/xe/xe_ras_log.c |  63 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_log.h | 108 ++++++++++++++++++++++++++++++++
>>   3 files changed, 172 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 8e7b146880f4..607c9b099d03 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>>   	xe_query.o \
>>   	xe_range_fence.o \
>>   	xe_ras.o \
>> +	xe_ras_log.o \
>>   	xe_reg_sr.o \
>>   	xe_reg_whitelist.o \
>>   	xe_ring_ops.o \
>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c b/drivers/gpu/drm/xe/xe_ras_log.c
>> new file mode 100644
>> index 000000000000..0e836ef5dcf6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_ras_log.h"
>> +
>> +/**
>> + * __xe_ras_log - Emit a structured RAS log entry
>> + * @xe: xe device instance
>> + * @gt: GT instance where the error occurred, or NULL if device-wide
>> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
>> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, etc.)
>> + * @errno_val: negative errno describing the error condition
>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Formats the message and emits a kernel log line via drm_err() for fatal
>> + * events or drm_warn() for all others. CPER record generation and hex dump
>> + * are planned as follow-ups.
>> + *
>> + * Format:
>> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno = <n> Message = "<msg>"
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +		  u16 sig_id, u32 cper_sev, int errno_val,
>> +		  const char *fmt, ...)
>> +{
>> +	char loc[32];
>> +	struct va_format vaf;
>> +	va_list ap;
>> +
>> +	if (gt)
>> +		snprintf(loc, sizeof(loc), "tile%u/gt%u",
>> +			 gt->tile->id, gt->info.id);
>> +	else
>> +		snprintf(loc, sizeof(loc), "device");
>> +
>> +	va_start(ap, fmt);
>> +	vaf.fmt = fmt;
>> +	vaf.va = &ap;
>> +
>> +	if (cper_sev == CPER_SEV_FATAL)
>> +		drm_err(&xe->drm,
>> +			"[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
>> +			sig_id, cper_severity_str(cper_sev), loc,
>> +			errno_val, &vaf);
>> +	else
>> +		drm_warn(&xe->drm,
>> +			 "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno = %d Message = \"%pV\"",
>> +			 sig_id, cper_severity_str(cper_sev), loc,
>> +			 errno_val, &vaf);
> again, this is not a very friendly message for the human admin
>
> can't we just add severity/id pair to our updated xe_printk macros, like
>
> 	xe_err_fatal(xe, id, fmt, ...)
> 	xe_err_recoverable(xe, id, fmt, ...)
>
> 	xe_gt_err_fatal(gt, id, fmt, ...)
> 	xe_gt_err_recoverable(gt, id, fmt, ...)
>
> and print sev/id pair within single tag:
>
> 	0000:02.0 xe [drm] *ERROR* [ID=123456] *FATAL* format ...
Agreed, however we've per file macro reference.
>> +
>> +	va_end(ap);
>> +
>> +	/* TODO: Add CPER record driver handler */
>> +	/* TODO: Add RAS dump cper hex handler */
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h b/drivers/gpu/drm/xe/xe_ras_log.h
>> new file mode 100644
>> index 000000000000..08318dea75a9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
>> @@ -0,0 +1,108 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_LOG_H_
>> +#define _XE_RAS_LOG_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +#include "xe_sig_ids.h"
>> +
>> +struct xe_device;
>> +struct xe_gt;
>> +
>> +/**
>> + * DOC: RAS structured logging and SIG_IDs
>> + *
>> + * What this file is for
>> + * ---------------------
>> + * Use the xe_ras_log_*() macros to report faults in a
>> + * machine-readable way.
>> + *
>> + * What is a SIG_ID?
>> + * -----------------
>> + * A SIG_ID (defined in xe_sig_ids.h) is a stable numeric error class.
> hmm, so a SIG is now a CLASS ?
> in the prev patch it was described as 'GPU fault signature'
Sure, i'll make it consistence.
> and this kernel-doc for SIG_IDs should be in .h file where we define those IDs
Sure, I'll move to header.
>> + * It tells tooling what kind of fault happened, independent of message text.
>> + *
>> + * Driver SIG_ID classes:
>> + *   XE_SIG_PROBE         - probe/init failure
>> + *   XE_SIG_WEDGED        - device unrecoverable
> hmm, in drm_dev_wedged_event() we can specify recovery method
> so what unrecoverable means here?
Good point, I'll fix the comment.
>> + *   XE_SIG_SURVIVABILITY - degraded/safe mode
>> + *   XE_SIG_FW            - firmware fault (GuC/HuC/GSC/CSC/PCODE)
>> + *   XE_SIG_GT_TDR        - engine hang or GT reset (TDR)
>> + *   XE_SIG_MEM_FAULT     - VM/page-fault/GTT error
>> + *   XE_SIG_IO_BUS        - PCIe/IOMMU/MMIO bus error
>> + *
>> + * HW SIG_ID classes are hardware-defined categories, reported by firmware via
>> + * CPER records (for example XE_SIG_HW_DEVICE_MEMORY). Driver code does not
>> + * emit HW SIG_IDs directly.
> if HW SIGs are HW defined, are below IDs also defined by the HW
> or HW just defines different components, and we define IDs for them?
No, the numeric values are not defined by the HW. HW defines the 
categories; we define the IDs for them.
>> + *   XE_SIG_HW_DEVICE_MEMORY  - device memory errors (e.g. ECC)
>> + *   XE_SIG_HW_CORE_COMPUTE   - compute/shader core errors
>> + *   XE_SIG_HW_PCIE           - PCIe interface errors
>> + *   XE_SIG_HW_FABRIC         - on-package fabric errors
>> + *   XE_SIG_HW_SOC_INTERNAL   - SoC-internal errors
>> + *
>> + * Why this exists
>> + * ---------------
>> + * SIG_IDs let RAS tools parse logs reliably, correlate CPER events, and apply
> dmesg is not reliable

dmesg is explicitly not a stable API, it is emitted “for logging purpose,”

while the machine-consumable path is the CPER record

via the existing xe_error_cper tracepoint.

>> + * policy/thresholding without depending on fragile string matching.
> if the whole idea is to group our errors per fault class,
> then maybe our macros should be used like:
>
> 	xe_err_fatal(xe, CLASS, fmt, ...)
> 	xe_err_recoverable(xe, CLASS, fmt, ...)
>
> and output should be:
>
> 	0000:02.0 xe [drm] *ERROR* [PROBE] *FATAL* format ...
> 	0000:02.0 xe [drm] *ERROR* [TDR] *RECOVERABLE* format ...
>
> as printing magic ID numbers is not very friendly
>
> and any 'machine structured output' should be exposed elsewhere?
> maybe as sysfs file on the xe module level (to catch probe errors)
>
> and maybe start with that alternate method first,
> and use dmesg logging only as a best-effort informational step?

We need component based helper, not based on severity.

>> + *
>> + * When to use xe_ras_log_*()
>> + * --------------------------
>> + * Use these macros when the event is:
>> + *   1) a real hardware/firmware fault,
>> + *   2) relevant to production monitoring, and
>> + *   3) clearly mapped to one SIG_ID class.
>> + *
>> + * Do not use for all logs
>> + * -----------------------
>> + * Keep regular debug/info/driver-state messages on standard logging helpers
>> + * (xe_gt_dbg(), xe_gt_info(), xe_gt_warn(), xe_gt_err(), drm_dbg(), drm_info()).
>> + * RAS macros are for structured fault reporting only.
>> + */
>> +
>> +/*
>> + * Common backend helper
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +		  u16 sig_id, u32 cper_sev, int errno_val,
>> +		  const char *fmt, ...);
>> +
>> +/*
>> + * Driver-facing reporting macros
>> + */
>> +
>> +/* FATAL */
>> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
>> +	__xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
>> +	__xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
>> +	__xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +/* RECOVERABLE */
>> +#define xe_ras_log_fw(xe, gt, errno, fmt, ...) \
>> +	__xe_ras_log((xe), (gt), XE_SIG_FW, CPER_SEV_RECOVERABLE, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
>> +	__xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
>> +	__xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
>> +		     (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
>> +	__xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
>> +		     (errno), fmt, ##__VA_ARGS__)
> IMO those RAS customized macros, should be per severity and take
> a CLASS as a param since there is much less severity levels than
> your new SIG_IDs fault classes, so it scales better
>
> 	xe_err_fatal(xe, PROBE, fmt, ...)
> 	xe_err_recoverable(xe, IO_BUS, fmt, ...)
>
> and I'm not sure that there is 1:1 relation between CLASS and severity

ditto

Thanks,

-/Mallesh

>> +
>> +#endif /* _XE_RAS_LOG_H_ */
