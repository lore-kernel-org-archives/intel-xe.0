Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F604E7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 19:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ECD10E2AE;
	Mon,  9 Dec 2024 19:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ex/lBGJ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0501B10E2AE
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 19:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733773474; x=1765309474;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LaK+qEY3LFXBux35oB4TgK3uPXBWiJk2kE8JIdhpt6I=;
 b=Ex/lBGJ2gzKEnymoziMC7B/99YvoOogYrjud1BLFrk/L6TXhexJ/HjZQ
 7bBRv1lnq2OXk95MVj7Vh9C4jf7VdO09KSBZPbwptSvgFgfpHxmMbxPVe
 +GeZADxPwponNsuIY8HJHLZsaNn3hvQl+JmTOmhJ9qB4C8uW/1j7wQ5rj
 RAq4HsPjGuPypLoPOTSzsXYmZ+y5VCdiPWN7XY5HUz5tUtBL3rg0hCK24
 PDSDTqIJukSOPngOmBN3byqPba4G4wAoa7yKcJz1I6e16iggyyHTVwZnK
 OZPkOz84SVVLfvEsXWgccl9+wDahAvfFxV5Sz5YaZXH3+a5nJi+mpopyw w==;
X-CSE-ConnectionGUID: Qdl5fkIGShadUYs5LzTtMQ==
X-CSE-MsgGUID: Azgyh8bnQRmGRDFV0I/gPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="45104221"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="45104221"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 11:44:33 -0800
X-CSE-ConnectionGUID: IxWZsignTeiyc/vxGB7FYg==
X-CSE-MsgGUID: Za0vFJ0GSfebgQpx1ca8lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95036732"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 11:44:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 11:44:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 11:44:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 11:44:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYREGsupq1ry7JG41kiD634A13soUnUYooSJpOKs4KRN4lcz85nluruAvHKny2iuKhKTkGfNXFJ3F/zLm61SK+BzNDUJtSYCDbsjf4IRxwrRvO0qBbtV2vGOscglthLwmlp8j595PGlci0E+o797toqndPT4vddtUpu25VhwrW7Qj5rawcoW1QxtngPo6r9D1bO41VgpNYexzM/YdXk8Pl8kDN0pQggVeq9gAjwr3Yv5GDmEEXl2W9HAJITlr24RiIXi4h0ZUim7/ja8gf/BEruorW9b7lCCi2tC5BBEeCZ6JAZ2umBaiJwrJlr0FlKrxRuXoOeeirdNXLOjvw2bTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMaeasQyAIKU/10Hy48b6W6FmkMNEgJ/59lHn/bASKM=;
 b=Vx5ePXILcV4EQRaYnO+4a28tMm9STidl4SHhjxcn39DU+homILQs1DwsssL1iw2LriWyHSPMNnbEoEs0NKv208zWglJDnFrWRyDOTxciXhN4c8AWRLSkbheeftqT1QANyifH49OWaQESOxIo18vsn6VtCsm0w3nVYkNOZIpIYhbxp8xgA4nylcQLh6x2OC1i3eyHtJC6+pl7MGYLysryx2/w5mwcAGvx5U4OYSBLJ+GRA/DXjOz9H3RlhEx6CunCSdHeaO7V62hhutxg7CzdOROre0IQEbp9d1e23mqfi3TfAz39C8d5wUOfg+PvisCHTW0bqZvLMoBDZeihdKfxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.25; Mon, 9 Dec
 2024 19:44:24 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 19:44:24 +0000
Message-ID: <6928e780-6182-4cf2-85af-db10da927ba5@intel.com>
Date: Mon, 9 Dec 2024 11:44:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] drm/xe/pxp: Add PXP debugfs support
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
 <20241120234353.1037180-12-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20241120234353.1037180-12-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cfcd8d-a8c6-4667-cf26-08dd1889e23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm95WDJQR3p3OHU4Q1JuY1ZTTlBrRFlYVG9Vd0l5OHd6S0pkUGtMVWxyNldO?=
 =?utf-8?B?RFNVY2ovOERldVQwMGRmTG9oSDBwalcrd1lHdDhIYVlUekNEMm5Jc2xDWFZ3?=
 =?utf-8?B?YmdyR0tyTWJUaFRJNUhad3U4OXJQK2tLM0Q5bFZhRENvbGVZOEVJMlQ5QUdJ?=
 =?utf-8?B?aW11NjNBYkkyT1VFNU5kWlpSS2Z5MkdjVExFSVRlbUpEZTVRdTdZN3VmeDJt?=
 =?utf-8?B?aFIvWFBURFc3d3YxeVFUVFBFenFJM2tzN2JFK3JHZTNXV00rWm5yNGkxVVFI?=
 =?utf-8?B?d205OUhZZ1diRFNaVEYxKzVKc2tsQjVXK0pPZm1iaEFJL3pvN2NuZ0srMGJ0?=
 =?utf-8?B?aVVhYUNOVXpSMDN3SGRjUFB0Mk44dE9iZlFFY3hqZkttcCtXQzJmdkpzQkRq?=
 =?utf-8?B?SGtwYmt4V3p5UzZ3YURLNmtXYXBJbFk1VjhiNnhqTFp2aTVvM0NIUUZNYURz?=
 =?utf-8?B?Q0VkWnY5QTRDY3lMYTlyL3lrbzBKUk5Iam9uYndadEJTQjlMOS9VR0h3UE50?=
 =?utf-8?B?V0xiNEs2SFlrTHFpOUNhSXZmaFRud011dkgyOW1qR1ZQLzFxcXRjRWhEOEJu?=
 =?utf-8?B?MlNRbjdIRU1nK1hlTGV1S3pKakV0cEhJRmdQR1VCUmpCLzFtV2xHejdwVCtY?=
 =?utf-8?B?TFpENE5UOGJ1V24rbW1nZU9rejIyaGtIcDVrMUVkR1Z4OEp1Rmtjckd6OGNt?=
 =?utf-8?B?R3J2Y0lXR2FMTXVaZHZTd3hBUjNyRkhLNUtQK1dCbjBwSzZ1NXBMbEVNKzFI?=
 =?utf-8?B?eDdGNnBrNENmNFNvRWZtM2FUM21iNDVHeFJkMTIxUGFJQ2NSdWt5OXF5Tit3?=
 =?utf-8?B?cTk4RFVlZTEwZ3VuV0Z3eWVrU2U5a1JMeEM0YjZlQmYxUk5rM0Q3K3lPL2Fs?=
 =?utf-8?B?UlVQK3d3UTNzMDhuVzJBdHVmUzczUnk3cEZDbEVweGwwbU1hS2RoVnVZekp5?=
 =?utf-8?B?cm0xWTErS0huOHBYZXVYUnArcm5jeW1raHJRVWg0QnBZZC9GNm56dzVjcDR4?=
 =?utf-8?B?SytRczZWLzVoM2ZnMFFHM2tOR1pWNHQ4K2NBdkVFMTVJMEtUYW1sMlJKMG1p?=
 =?utf-8?B?bnRNZzNvekwxVk9sQlhyTHRZUXIvR0lrWFZuZmpaWkR1MmRJR3AzZGxPVnpt?=
 =?utf-8?B?eGorc1YyQ3pHa2V5VVhBdnEyMXlCNkVsSVpjeDBmeDVleTJqYkVWWmNYMzk3?=
 =?utf-8?B?Q3pCNW4rNWZqd25YMVZQRk9RVjBKODkxTmM0UVE4QWp4NDBqLzdUeUZPTzFh?=
 =?utf-8?B?UVV5R2J0V0E1K3JRT0dleW10RHFONGFNWUdvK2ZaUGdBT21ta2VhaFFiN1Az?=
 =?utf-8?B?d1ZUTzNSQ2htaGdTSGZSblZQYzFQV3hLUWNaeElab0NNVDRJdksrYVdIVS9t?=
 =?utf-8?B?WlFhOTdjdEp5ZWNyUkVBajJHOUdRMHNqbzJiaGt6T1NWSnRQYjBybGZOS2pt?=
 =?utf-8?B?bCs2ZEttQm1SNjJtdlNQNXZ2ZHB2bFdJVklPQWJ5T2UzZ0hPaHJvZk0vZHgw?=
 =?utf-8?B?Q3pJOHhoL3pIdW9Hc01PSnhGOUZyVEQrWEJhVFhTU2JwQk9WOWhZVXJmWWZ2?=
 =?utf-8?B?VGtZV1Y3YVR5dGFMdFdtQkszT0U2S2d2ZjB3UURTd3doVEsrUDRBWGJISjlT?=
 =?utf-8?B?bWRyUDkwYUpKSDUvQWxGSXN6SGx6YXJ6bFMzZnlxc2U1WW0vc1BzUU1WTWVo?=
 =?utf-8?B?di9sTWlkc29DVjVrQW9uZWMzM1lwbGdKNmFKdTVwM0RIV0tXYnFDYXR4NEFC?=
 =?utf-8?B?c2hqUlFQdlFtb29xVE5TYnpoTTFTQjlGd0pDcXI2VW9JaDV1YjVnRkJOWVNq?=
 =?utf-8?B?RnZhZjdZOStNalc4U280QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDg3RmZyTDJxcWZxMzRpSUJqakRDRFZIR05XbEs3bGFGM3l6ZnlZaVZOQVJE?=
 =?utf-8?B?MmF2cnU5Vkt3QU5lK2hiZUZ1OUVWUk5LSStCK0JqcGphWUo0eWZTZGVxa0VM?=
 =?utf-8?B?MUlTWWNzTDJXMUl4eGI2dDRtZVYwOGdRbGI2YkM5UkwvSm1ZQk1nWk5qblVE?=
 =?utf-8?B?MUx6eitLWGhyRGplVEVXak5zc0hrYVg3UGRHMjNDZWlvMTFSRmxnMVIwTjg0?=
 =?utf-8?B?NmNYMFE3QUxJMGVUSUE3SzNXcVQ3aG1vNUNLNFRnVlQ3Qis4SEZ2ZGduUXdJ?=
 =?utf-8?B?TzFWYjczc3RuZDVSTUNsWVFISkYxa3VURDd5amN5NDhUZVRNcWdCZWFFUTBm?=
 =?utf-8?B?c2xUNnd1QTd6OHlMWk45bGllTmY5dEV4Y0xpRk5heFk2aDM4YkRoYU9jaENR?=
 =?utf-8?B?RDBQL2JFWjc1RVlGU1RDNVdiUEFwRTZuMVRjcGVlcnI1aS80aUkzQlpweGVW?=
 =?utf-8?B?SE8zdkU1WGpRSy9mbERCUkZYWERWbjdEeHJSTktWQzZrNmw3VVVmemxzOTM1?=
 =?utf-8?B?bGRXRmFQaUxMREx5d2JmQWZXVktZVTBoUlM0WFNYZXNxV0t3b2dqSFJldEw2?=
 =?utf-8?B?dmFGcmE5ckh6cGxoY3JrUUthbllzWGVVVTVUYjZlaWJYQnNHd2lZSE8zbTFz?=
 =?utf-8?B?bnNuL0ljRlA0UXpyeEw2MHgyeWZpV2pnajNZVDVSVUxsaVNZV0h1MVhyMW85?=
 =?utf-8?B?eXNOMm1QQ2JVRkFYeW5CUVN4NjVVMldVdk0wVWU5dnJ3UWNoekdpaG85b1NE?=
 =?utf-8?B?eElPZis3SVl1dVdHcGR1Zjl6bUo2U3lFYTN1dElVYVFob0ZGaURXLzJiQlRJ?=
 =?utf-8?B?eVl1b0U5UnZoNmNnVml3eGc1UkVFQ2VlcytBQlg4MXdScW5XeDlyZThNc0RF?=
 =?utf-8?B?VUVYWG9oenhUT05qUVliQlFUaFRDOTkwTk9VWk1NS0JpdFg0STZUY3ZwYjJI?=
 =?utf-8?B?QndrQmNUT3pDNWZzdVc1ODVhMlJBS204RlZFTkFmYVlKdzhLamRXcGJ0eGps?=
 =?utf-8?B?V1ZOS2VKb0VxU3RyQkgybDBDOGN5MVRBS0ExSCtBZGY1NGJIMHFDTi8vcGoy?=
 =?utf-8?B?QkU5NkI4VjRFSC9iZUVLRnBBV1dnRmJCZVh6KzdjSzB2NkpUQ3hBOGRCV08w?=
 =?utf-8?B?WERPd0ZMVGQramIxbXE1Z1FBWVJMc1FGa0VxSkl3U1V0bm5DbXY3LytDbHlQ?=
 =?utf-8?B?dkNSTUFhbU5CaFVmMElTYnhURW9DK2lpSTNvNllINVZhQ1dzQmFhYzNsRTBZ?=
 =?utf-8?B?NGsyVmFCWUpIQmwyaWlralB4WjAxWDIvaXVZSW10clFkZldPOTJRMUNnSiti?=
 =?utf-8?B?Q3FXY2xoM3FOMSthNVNXMlIvK0JKMmR4WFJTcElvdTN3R2RTWjFmT2MxcUJ5?=
 =?utf-8?B?QVloNjJ2bmNWRmRyd2E2UXhsUEMyZjg3YlJ4LzgzRGVzTy91UkhJK0VSdlg2?=
 =?utf-8?B?SmhTOXQ3TVNpK2xJbnNqMDNWVTVtK2h3N1k0Z0dacWQwcVQzKzQyYUZ0bDRx?=
 =?utf-8?B?UXV5UkdtRVNkTGZneGJGZWNIL1Z0QWxUZnNZRjVHMkx4THBrTFhmNmltT0NW?=
 =?utf-8?B?TEdPbW96K2szQ3JESzZwQ01MMWFaekNJRmJkbXVJVmgybnJoMGpJTWZUZHhT?=
 =?utf-8?B?RXAvd1hCdVpzZG4yK2M2NXliRGRRN04zWkk0bTNiY05xZFpFeklqTk1BeURP?=
 =?utf-8?B?bWt1RUFRT2ozZDM3QTN6dUxCaXZjdkdSOUVselhwUjhtWkJIVU1XLzZhZTkw?=
 =?utf-8?B?RFV4ank3a1RhT3RNTlNLbFhZb21rSDk4ck5URmFEY2xHV1pIdVdtQUdoQXc3?=
 =?utf-8?B?VVpYS2UrQ3g4bXh4SkNEcDRvQ1lyWFR6Qnd4YzFwOFNRVElCVW1pcjlFSnBs?=
 =?utf-8?B?UkJqeE5EUVVpN05jbTI5VWZHajVZYno1SVNuZ1cwSTlRKzFFZitLVTBuNTdj?=
 =?utf-8?B?VlFTdVF5UVBqRUIrMEpWWCtiZ1NUNElWcThuRXc3N1QxNGhRQXdOWGYrUUFE?=
 =?utf-8?B?LzhjUkRMSUxrbDBnNENXaEliL2d3QTUyOG9uS09ZVzlvSng0Rmx4dlNWMDdJ?=
 =?utf-8?B?UGl0QWRVR1Nwc2FXdEo2OGFrSCtXZ1k3d2pBNXFSOXBDRFYrZkQ4NzB5RFFN?=
 =?utf-8?B?c2VKekVZaUpna09iVHV4ZER1UkNvVlljL1BMbXdmbXYzMEd5dXFKdW5HYkx3?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cfcd8d-a8c6-4667-cf26-08dd1889e23c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 19:44:24.3673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3oq9pyc2rzEmuAN2mz6dUPondsHX3NzNQsavD1DaGKUYNBAnZfWUA92rBUqfT8b5HZN8cSNiYqLZLEL97T2h59dFA9PzCfLjPS1rjDDGJVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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

On 11/20/2024 15:43, Daniele Ceraolo Spurio wrote:
> This patch introduces 2 PXP debugfs entries:
>
> - info: prints the current PXP status and key instance
> - terminate: simulate a termination interrupt
>
> The first one is useful for debug, while the second one can be used for
> testing the termination flow.
>
> v2: move the info prints inside the lock (John)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/Makefile         |   1 +
>   drivers/gpu/drm/xe/xe_debugfs.c     |   3 +
>   drivers/gpu/drm/xe/xe_pxp_debugfs.c | 120 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp_debugfs.h |  13 +++
>   4 files changed, 137 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pxp_debugfs.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 126c8f1ab673..28b5c9e6379c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_pt.o \
>   	xe_pt_walk.o \
>   	xe_pxp.o \
> +	xe_pxp_debugfs.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
>   	xe_range_fence.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 492b4877433f..56cb3788e752 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -18,6 +18,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
>   #include "xe_pm.h"
> +#include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
>   
> @@ -230,5 +231,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   	for_each_gt(gt, xe, id)
>   		xe_gt_debugfs_register(gt);
>   
> +	xe_pxp_debugfs_register(xe->pxp);
> +
>   	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.c b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> new file mode 100644
> index 000000000000..ccfbacf08efc
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include "xe_pxp_debugfs.h"
> +
> +#include <linux/debugfs.h>
> +
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +
> +#include "xe_device.h"
> +#include "xe_pxp.h"
> +#include "xe_pxp_types.h"
> +#include "regs/xe_irq_regs.h"
> +
> +static struct xe_pxp *node_to_pxp(struct drm_info_node *node)
> +{
> +	return node->info_ent->data;
> +}
> +
> +static const char *pxp_status_to_str(struct xe_pxp *pxp)
> +{
> +	lockdep_assert_held(&pxp->mutex);
> +
> +	switch (pxp->status) {
> +	case XE_PXP_ERROR:
> +		return "error";
> +	case XE_PXP_NEEDS_TERMINATION:
> +		return "needs termination";
> +	case XE_PXP_TERMINATION_IN_PROGRESS:
> +		return "termination in progress";
> +	case XE_PXP_READY_TO_START:
> +		return "ready to start";
> +	case XE_PXP_ACTIVE:
> +		return "active";
> +	case XE_PXP_SUSPENDED:
> +		return "suspended";
> +	default:
> +		return "unknown";
> +	}
> +};
> +
> +static int pxp_info(struct seq_file *m, void *data)
> +{
> +	struct xe_pxp *pxp = node_to_pxp(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +	const char *status;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	mutex_lock(&pxp->mutex);
> +	status = pxp_status_to_str(pxp);
> +
> +	drm_printf(&p, "status: %s\n", status);
> +	drm_printf(&p, "instance counter: %u\n", pxp->key_instance);
> +	mutex_unlock(&pxp->mutex);
> +
> +	return 0;
> +}
> +
> +static int pxp_terminate(struct seq_file *m, void *data)
> +{
> +	struct xe_pxp *pxp = node_to_pxp(m->private);
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/* simulate a termination interrupt */
> +	spin_lock_irq(&pxp->xe->irq.lock);
> +	xe_pxp_irq_handler(pxp->xe, KCR_PXP_STATE_TERMINATED_INTERRUPT);
> +	spin_unlock_irq(&pxp->xe->irq.lock);
> +
> +	drm_printf(&p, "PXP termination queued\n");
> +
> +	return 0;
> +}
> +
> +static const struct drm_info_list debugfs_list[] = {
> +	{"info", pxp_info, 0},
> +	{"terminate", pxp_terminate, 0},
> +};
> +
> +void xe_pxp_debugfs_register(struct xe_pxp *pxp)
> +{
> +	struct drm_minor *minor;
> +	struct drm_info_list *local;
> +	struct dentry *root;
> +	int i;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return;
> +
> +	minor = pxp->xe->drm.primary;
> +	if (!minor->debugfs_root)
> +		return;
> +
> +#define DEBUGFS_SIZE	(ARRAY_SIZE(debugfs_list) * sizeof(struct drm_info_list))
> +	local = drmm_kmalloc(&pxp->xe->drm, DEBUGFS_SIZE, GFP_KERNEL);
> +	if (!local)
> +		return;
> +
> +	memcpy(local, debugfs_list, DEBUGFS_SIZE);
> +#undef DEBUGFS_SIZE
> +
> +	for (i = 0; i < ARRAY_SIZE(debugfs_list); ++i)
> +		local[i].data = pxp;
> +
> +	root = debugfs_create_dir("pxp", minor->debugfs_root);
> +	if (IS_ERR(root))
> +		return;
> +
> +	drm_debugfs_create_files(local,
> +				 ARRAY_SIZE(debugfs_list),
> +				 root, minor);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp_debugfs.h b/drivers/gpu/drm/xe/xe_pxp_debugfs.h
> new file mode 100644
> index 000000000000..988466aad50b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pxp_debugfs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef __XE_PXP_DEBUGFS_H__
> +#define __XE_PXP_DEBUGFS_H__
> +
> +struct xe_pxp;
> +
> +void xe_pxp_debugfs_register(struct xe_pxp *pxp);
> +
> +#endif /* __XE_PXP_DEBUGFS_H__ */

