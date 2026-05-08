Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353DACD3436
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 10:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E690610E0C5;
	Fri,  8 May 2026 10:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9s5ZkHs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA1B510E0C5
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778237612; x=1809773612;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fyjMF7aeOsSXEWXU0RPJU+NDAGeZ7nKt9J/EZXyePx8=;
 b=P9s5ZkHs/dLadEq8KKZyxpigK+Ca6mnLj36EqDC/8PXYj6KHRcHSXBLV
 p9i8FVAG6sd2io3ETn4RbWEks/shlR5l2dHT1Fabn7z5CsVPB643YhP8q
 V6jLjUn9njJGsUZH/X4b21qIv4DqPsgYR/benPT9znUlWXikdQL8VcIli
 Qjy7Jv4FDjVxwiNH6IEYzX18eeHW6jAUvI02+OoHmbpi+iSJM5rmw4Qgg
 Y7l64wDNYDINKCNEvmoZig8sT8S56YSPpP5FJPZgZ0ba9OfSA1bbUhsD8
 mmUe2j+3EKUqqejsCWSmw4R+UsxNOKVjPLjtlzTRW1nka07l3M29jU8j1 g==;
X-CSE-ConnectionGUID: KlHQ90JpSaCNZvaL3I1dcw==
X-CSE-MsgGUID: ITV466R+QsiSpuvDtlF1dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96772432"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="96772432"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 03:53:31 -0700
X-CSE-ConnectionGUID: CkH7+pWgTJC395Z/cpyFTA==
X-CSE-MsgGUID: d65L3lriQ2eLyv8h5kQ8Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="236980994"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 03:53:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 03:53:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 03:53:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 03:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6SZ+Zf26sfNRHi46LNbVs76GZ6HMkgIpKRjuODOHXc1FM1a4CS6MppK/O7uGUP3IYj2UjnZjcpgueI7QCxb1UnVDH9Sd25X+nrzCgsR16BiPlVVHvpA2epmDpj6vMqowxWNekgolQOpE2KxuW8b4sYdKVxSyZVmpDQBI48sGi02cIY6rGT94yfd6tsohwXy74HOhdrr+DbxRMkaIDqsKrei48Pr95D3owlB87ll9nf2it1dBCXL3G4KZURY9C9+EKwMcF/8QZlsc14kgLCM7IsNusJaTkkPPRfg/qCvHz/CB8WtO/9Sw8qgvmwnpzNsuFd27Ze8p0RIpRO+DQ9a6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7aZgAXtaXGnx3SIm99ULN5UZyyqn39jJLzBWn8bgSA=;
 b=BduVlQVyIy8xTP8I90tX8KVZh+OQJ4RYG74NTSae44cAhR7BhshxdaKjlnYqXVJkkFA0ie3vjUHWOr1f8SDA7Bs34KIverLggLB2eq/roqAfJ3B/3aO3GU7mvDI9yexN9Vf9N2TGQxkcrNoDmtBPOduSxpROykrpjFSKZ4fvVwGowFrxf/iY5OypGDxLp+nwv6G36Sxm9c+2g4TXjqw7MwiyLJVFgh1lNqmCW2TcJ5tdUic7HUun9+v19un9NAtsoKrembpcMnDLVLbBT4RwrZBXvQ7g8uX30fpttVYjhVvfu8QIwWWmtSY0gEcWylRIuA2RQQ0NZrRpn04mJ5tMTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by PH0PR11MB4967.namprd11.prod.outlook.com (2603:10b6:510:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 10:53:25 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%6]) with mapi id 15.20.9891.015; Fri, 8 May 2026
 10:53:24 +0000
Message-ID: <f642453c-f657-41c7-a01b-5a0baf886cd3@intel.com>
Date: Fri, 8 May 2026 12:53:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] drm/xe/pci: Introduce PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <zhanjun.dong@intel.com>,
 <lukas@wunner.de>, <daniele.ceraolospurio@intel.com>,
 <badal.nilawar@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
 <20260423100017.1051587-9-raag.jadav@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260423100017.1051587-9-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0070.eurprd03.prod.outlook.com
 (2603:10a6:803:50::41) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|PH0PR11MB4967:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4a2368-89c9-46e2-ad01-08deacf006bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: koGosJriOpIYpbgwxXAkCHAee22GU+AyK91Eb609NUl+uhRbghZ77eccHgnmT4kw7mie5d3LoxpUDPFO3mkyd0jcjHstZQUxGOw9wJ2Ig6ij5JblmCzDWN/5PVaryu/U/+YBR3zWHW7F9SzI/2FfNPCJeteaJUVjr2VxG01P1T4v3IjqC6yiX/dUp73tO5HnPWsvMvkLvdOS8YMnJjNMuCNPXOgCc2pOEAWn0yXyEsdFZagnsMHcjWakB9AleRT8cZ7z+491x3T8+84CjG9dsIPxWDGLieaPgfQ8Tni7LfSj8u2mZuROe0s2o20KVtXfhV5xy+YJnTAyTjH3DBcwZUESlOVyZqfFr4/xK7v9c01dkOldJ5Q/n+Us/rYWz0EqeyuX4UHudF63JHWqqqgMO7CZJv9U4tyoXI+zmayfmod9DF5fkFCkcZP/irYS8PMc7GT4jH4BiuG1AeH74YUsAyGo3o0tHnScbKoVo1+M80yin9XfMPAWVR63syza5LMsqXgUPhhx0ZeMRixPwdvYUQvHB+Y9NHF98v+FaqCYTEs8jSZ5eC1/ehFrAIpa6czITSuHg9/YW7Sth5sb/rYJ8Pdiqes24CiwNWTL3hswBW2heK/41QfP6979w3sykXktuBTthpNE9JDPV9ZVdz077eTbKs3wUjRXorrI4ZP9WWBH5uXHx3olav/O7xFAT2VM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkY1SGpMTmxsbGtRTWx6UVBkdnZiTXk1clpUb3hMd2VYWk40S3BMalM0RUl3?=
 =?utf-8?B?a1dvNTdjSDJadXhqbDVLcW1QcHBISnRXUjZqUzZScVV5QjJHOGNIR2xjOFdv?=
 =?utf-8?B?dXc2ZmlhQVZabVZWNlBWdys1dGoxYzVIN3crZUJmTnVBREF5amFUdGpDOUpK?=
 =?utf-8?B?N0w4dUliUW5WeVkyM3dEb2ZUNTZCMitMaTUrcC9QK3p0L09OMmVId0JwclBQ?=
 =?utf-8?B?eThDRnhGZWJYYkxva3RhS3FUa2Nldk1kcllFT3dyRzY3clJpUERPVHlNeEtU?=
 =?utf-8?B?TEQxYWV0U0RSdVVXUEtJZVg0VlVwbUdmaWhPM3g3QTNEdDZ3dFVNaEFqZVBv?=
 =?utf-8?B?TXVaNm9JVTdTNjdad0k0WkIzWWVLaVZHZ1RIOEVEbHI1MmRQL1RseFpEek1D?=
 =?utf-8?B?cjNoYVRlc1NVNjQ3S2hSS1pzOFNQeTZNK01SL0h4ZXlUK0ttMy9iMFV1Sko3?=
 =?utf-8?B?WkhUWmpZU09teVBKUTFBcnpkNXkwTVlBblBLcEgyT0NEakZwdVBmVUZ4U3VK?=
 =?utf-8?B?dFRiSkxONEhQZVhxTFlKQ1VRTFVGanVlZGVtZWtHR2tFYUNUcko2Tm9sSzIy?=
 =?utf-8?B?N1M1bm5NRzV4Y3ZIMXF3NFk1SGVjaWo1Q243c0piNGdTU3dRb1dwbWJ2MHlH?=
 =?utf-8?B?elBKRkxaWmVNWC9kdTBzeGtDRXQxVUt1dU0zMStYeHFJQUJmZnRJelVWdTZx?=
 =?utf-8?B?dmw1QjlzZGo1RTNqZzUyV0J6anVXcExWUGFhRjVBN01WcXlmd2c1T0dNRU41?=
 =?utf-8?B?dVROOHZRSjUrM05oYUdtbDFiZE1xbDBxNmEwRmJpQlZPQ3pxMU9xR3J5TlJX?=
 =?utf-8?B?cDNqSFpzUlNSN0VNVllFOWQ3OGtPY1RVdnFZVVd4bGN3VlczOVo2aXBYY1dD?=
 =?utf-8?B?dlZ6UExYMnhnWXNnSC84M0RLYVdFMHV0MytQcEhzNFZrT29tSE1LSjhZT2hY?=
 =?utf-8?B?TnlVczhVN3dFcGc4OG1vdHNFdzNLWWl1WUlZY29aUVhmLzBuUjhCWHI2cXNZ?=
 =?utf-8?B?cTV2N0F5SWQ3QzdZbE10emNHQkQ2M1g1MUVIeit1enNJVEhQQjFFZTlKaUdL?=
 =?utf-8?B?NE9iN0J2V0NVRzVYS3NnTGNCdG91a3h6ZldTbkQyUjJNRk9PaENGOXZueW1Z?=
 =?utf-8?B?Q1dydWQzanpCS0xZcHc4UW5zTDNNdXpPdGVFNFJHMzVVSHVqRHFaTVBMWUtY?=
 =?utf-8?B?Z0pMSTBHUWdEVTZJQklxblRNQ1RxUUJhZlpEdjl0ZmM3OWR1WXlOdlNxZHNJ?=
 =?utf-8?B?eSt6Q3BhemZCcFluTXNoRFM0TnpOcHA0ckZtSFRhMHJsVnVGY2F3elZ5bWJr?=
 =?utf-8?B?UmdDdGVVeGF1ci9BQmpqVGxNUkRPRmVvaWJ3UUJzbTlRK0dZSWJ1MytCLzkx?=
 =?utf-8?B?ZTZXRmVjYTdHUEs2eTVaUzYvc2l1VklWVU14andrc2YvbW5UVXQvb2RXR1Jq?=
 =?utf-8?B?U0FRR0J3bVZuMGpPWTI1TXJJWFJQb2ZCY0FkVVlsREtacWZVMlJqOHpFN0xi?=
 =?utf-8?B?TE41MlhpU3drSVRZNmcxSys1TUdpY1paS0V2b2V2bkY3UGVwNXFMVzVkRHVT?=
 =?utf-8?B?ZVJvamxlUnlWWUdWTEFYbDU2U1M0U2Y4YzhrWElRNDZKUlMyNTlNYk82RmFl?=
 =?utf-8?B?dklKN3BsTmhURzQwbmNtbTBVeFZvWDZ1S0tVQ2thU2owQ2FmWllvWTRuWFdm?=
 =?utf-8?B?dG1GZWJvVnBTa0pmckJ6NjBUYkZyU1VUYnE5dWk5U2dZTHg3NDZFVWpyK1ht?=
 =?utf-8?B?SEhLdk1BSVFPbjNTcjNqbGlmWWdscHhlY0xZMld1SEhWanB6SkpnT0JRYVho?=
 =?utf-8?B?YUpid3pMNElMWlUydFBOTmJmcmwyOC9LNTVnSlcxVzMrT1hwUURRbW4vNGFu?=
 =?utf-8?B?djlFMDdEV1NGa0N0ak1Mam1zc2E1TkxhUkRtb2tqanZzLzVwYkRPR2VYRURz?=
 =?utf-8?B?Yi9IVVNuV0dCYnpTdGFLbFh1OVJHN1dtS00yUVpiVGpjZWpWendpYTF3NmVx?=
 =?utf-8?B?YjZWUjlIV2swNnRTdTRVNU1WbVlrVVZNaDhsNGY3OTF5ZWhYUHJNdU8rTjRh?=
 =?utf-8?B?U3hONWRGckZNT3NxWTJWTFQzME5xSWNwakJoeXVWdkdLMEFZbVMzM1RLWkt6?=
 =?utf-8?B?eldJNjBZUVFkS3YrdW5Oa2dLODRSNFNkLzJaR2I3TVhmSU9haHhVeTlzazZK?=
 =?utf-8?B?S2hheE9ucVhtYXliOVhzZ3ZMVmVhdHpCcUgwNXRXcjI1SWtkcnJWcFZ3bnhl?=
 =?utf-8?B?U3VtZUtSbVFVQnpIM21rMVRUSUZpOVZFTVh5TXlOSnBjOHM1dG51S2hrMG1j?=
 =?utf-8?B?N0NCZ0Z6MEl0S3V3TXh6R1UzcmVVdHF2STI1cTdqbm9Yc1BZNkxXdz09?=
X-Exchange-RoutingPolicyChecked: avAhhyrZX1LlIvtFOSvYFRBOZzsNndJM1U6CVgr5eXtugEMD4GnLMhWutCG+/A0hwdS7T/ae3srHiY6Fy72khOI0Trd4j2a97Cfthde+sOkjMZCYfsZecUV4sEWObfltqO0Wcq5rfGheqAGmEGq08QOFFxmwUAwCABMI9gWtBvjifdPsJSSupMfb1y7JTtCj7SF7vaenrfEqrh/GzACyyuXoMVsra2L13N99e4PrIYqlPK5J/i1883G7QeCeGQYzfbh3cNjp9X2VVf/RRv0gPo792rK6kDGbyCZ7yZpHOJejBqVM3qsOkXwRzZ/gF/AdGURT0e+9vM8gFyqunmja6Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4a2368-89c9-46e2-ad01-08deacf006bf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 10:53:24.0399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doDxk0dmZJhpQ2eJ4tZAJfBC/aRbc4qWFjADOi7kxc/EGsEsodhQCNhhmGq28iOnuqAxvkaEY8300nRH5ZAxAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4967
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

On 4/23/2026 12:00, Raag Jadav wrote:
> With bare minimum pieces in place, we can finally introduce PCIe Function
> Level Reset (FLR) support which re-initializes hardware state without the
> need for reloading the driver from userspace. All VRAM contents are lost
> along with hardware state and driver takes care of recreating the required
> kernel bos as part of re-initialization, but user still needs to recreate
> user bos and reload context after PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v2: Spell out Function Level Reset (Jani)
> v5: Prevent PM ref leak for wedged device (Matthew Brost)
> v6: Add PCIe FLR documentation (Daniele)
> ---
>   drivers/gpu/drm/xe/Makefile          |   1 +
>   drivers/gpu/drm/xe/xe_device_types.h |   3 +
>   drivers/gpu/drm/xe/xe_pci.c          |   1 +
>   drivers/gpu/drm/xe/xe_pci.h          |   2 +
>   drivers/gpu/drm/xe/xe_pci_error.c    | 113 +++++++++++++++++++++++++++
>   5 files changed, 120 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8e31b14239ec..3fceda259834 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -101,6 +101,7 @@ xe-y += xe_bb.o \
>   	xe_page_reclaim.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_error.o \
>   	xe_pci_rebar.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 89437de3001a..cbd5682ab833 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -477,6 +477,9 @@ struct xe_device {
>   	/** @pxp: Encapsulate Protected Xe Path support */
>   	struct xe_pxp *pxp;
>   
> +	/** @flr_prepared: Prepared for function-reset */
> +	bool flr_prepared;
> +
>   	/** @needs_flr_on_fini: requests function-reset on fini */
>   	bool needs_flr_on_fini;
>   
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 41435f84aeb2..278c2860a4f6 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1329,6 +1329,7 @@ static struct pci_driver xe_pci_driver = {
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> +	.err_handler = &xe_pci_err_handlers,
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> index 11bcc5fe2c5b..85e85e8508c3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.h
> +++ b/drivers/gpu/drm/xe/xe_pci.h
> @@ -8,6 +8,8 @@
>   
>   struct pci_dev;
>   
> +extern const struct pci_error_handlers xe_pci_err_handlers;
> +
>   int xe_register_pci_driver(void);
>   void xe_unregister_pci_driver(void);
>   struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..a53d5873ae83
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_printk.h"
> +
> +/**
> + * DOC: PCI Error Handling
> + *
> + * Xe driver registers PCI callbacks which are called by PCI core in case of
> + * bus errors or resets.
> + *
> + * Currently only PCI Function Level Reset (FLR) callbacks are supported. Since
> + * most of the Endpoint Function state is lost on PCIe FLR, the flow is pretty
> + * much similar to system suspend/resume flow with a few notable exceptions.
> + *
> + * Prepare phase:
> + * - Temporarily wedge the device to prevent userspace access
> + * - Stop accepting new submissions
> + * - Kill exec queues which signals all fences and frees in-flight jobs
> + * - Skip memory eviction due to untrustworthy VRAM contents
> + * - Remove all memory mappings since VRAM contents will be lost
> + *
> + * Re-initialization phase:
> + * - Recreate kernel bos due to skipped eviction in prepare phase
> + * - Restore kernel queues which were killed in prepare phase
> + * - Reload all uC firmwares
> + * - Bring up GT and unwedge to allow userspace access
> + *
> + * Since VRAM contents are lost, the user is expected to recreate user memory
> + * and reload context.
> + *
> + * TODO: Add PCIe error handling callbacks using similar flow.
> + *
> + * Current implementation is only limited to re-initializing GT.
> + * This needs to be extended for a lot of components listed below.
> + *
> + * - Proper re-initialization of GSC and PXP for integrated platforms
> + * - SRIOV cases which need synchronization between PF and VF
> + * - Re-initialization of all child devices of Xe
> + * - User memory handling and MM corner cases
> + * - Display
> + */
> +
> +#define XE_FLR_SKIP(xe_, pdev_)		(!IS_DGFX(xe_) || IS_SRIOV_VF(xe_) || pci_num_vf(pdev_) || \

You can use xe_sriov_pf_num_vfs() to avoid pdev_ param.
And perhaps it would be better to prepare helper instead of a macro?

Lukasz

> +					 xe_->info.probe_display)
> +
> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (XE_FLR_SKIP(xe, pdev)) {
> +		xe_err(xe, "PCIe FLR not supported\n");
> +		return;
> +	}
> +
> +	if (xe_device_wedged(xe)) {
> +		xe_err(xe, "PCIe FLR aborted, device in unexpected state\n");
> +		return;
> +	}
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	atomic_set(&xe->wedged.flag, 1);
> +
> +	/*
> +	 * The hardware could be in corrupted state and access unreliable, but we try to
> +	 * update data structures and cleanup any pending work to avoid side effects during
> +	 * PCIe FLR. This will be similar to system suspend flow but without eviction.
> +	 */
> +	if (xe_device_suspend(xe, true)) {
> +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> +		return;
> +	}
> +
> +	xe->flr_prepared = true;
> +	xe_info(xe, "Prepared for PCIe FLR\n");
> +}
> +
> +static void xe_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (XE_FLR_SKIP(xe, pdev))
> +		return;
> +
> +	if (!xe_device_wedged(xe) || !xe->flr_prepared)
> +		return;
> +
> +	/* Unprepare early in case we fail */
> +	xe->flr_prepared = false;
> +
> +	/*
> +	 * We already have the data structures intact, so try to re-initialize the device.
> +	 * This will be similar to system resume flow, except we'll also need to recreate
> +	 * kernel bos and restore kernel queues.
> +	 */
> +	if (xe_device_resume(xe, true)) {
> +		xe_err(xe, "Re-initialization failed\n");
> +		return;
> +	}
> +
> +	/* Unwedge to allow userspace access */
> +	atomic_set(&xe->wedged.flag, 0);
> +
> +	xe_info(xe, "Re-initialization success\n");
> +}
> +
> +const struct pci_error_handlers xe_pci_err_handlers = {
> +	.reset_prepare = xe_pci_reset_prepare,
> +	.reset_done = xe_pci_reset_done,
> +};
