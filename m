Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34152C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 23:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADB310E7E1;
	Wed,  4 Jun 2025 23:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcqTI/R5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A85D10E7EB
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 23:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749081266; x=1780617266;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y2vN2W0bAAi/p7ESzw2TUdxivZzgMuoe1jJh/J/cTTI=;
 b=mcqTI/R5NY0nMhFjywONgQLgi5VI0yMy8KfxWetqR7kQlEL1rYeQr3kS
 G/xJybDCJ30IYcPaLJmharUFo4BFs+1ZKShWPJxXST6qGkdW3myFUDCvT
 T1sBckQ7VdAbs8SD+zd/54PffrMMcD1PisoKTv6QMEG8s4loGtSEPzHSo
 DFYePAQm6u5sjWml2tJHe/ZLTbybDZzVP56kkxb2gy9uZVy8AuxatuNJl
 emi/2zUeWCVErf8pp5zFxvoFy21N7++RnPBbiUsvjUIHibFB7J6Hmuc8n
 k0f0ez81izzFzbs8E9SzHxGry6EaMTM6QaHgLjpimCm33C8eB0H8HFD2+ g==;
X-CSE-ConnectionGUID: ZgKCHV/8SN2ulhGpR3UCsA==
X-CSE-MsgGUID: 3KOe77HSReSInkNOJggqNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61853396"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="61853396"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:54:22 -0700
X-CSE-ConnectionGUID: 12xF8v8ZQYmlfRtTHINP2A==
X-CSE-MsgGUID: iSl/15LvR7uBiVGuloMAow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="182545002"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:54:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 16:54:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 16:54:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.73) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 16:54:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/NIjLvGW0l5d6gtdm1rsoybKa43FmPQcmnkrUYC6kQvOyz+Y9oARcGQSoxcg2gE0HQq0ZSULk9Qg2UJ6000kE5IX1dWzOMu3kPTyx6XzK7uLy1mugFDRdg+X7AWDxMnSCoTHa+05N1ANcPhqv0GBWAb/scja9SKBW59ZAS68tik/VMg3H0NOv4ugXzyxZuogUz1X6jmzT6/LAjEjtSdOaRaA9SepJLsEJlSFohCNBIUUlzNbg+7sBzPJAJ2ufj5T8DHrgyFMgnuVXUIDMsbpnEcwTnTTiPbXMdXfrGvghFt/V/6s2/U1ziyRZrVEAJtrpA83kR+CyihzCj0Mp8eXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AanZAj0JqfU6Pvd6wg7QrLw0SiRC1h+AGA0hnrTlTuo=;
 b=DxPhTbBhJtEZtGoSLcY9X3r7YAqlS6BIJ5lB+IKVDRCC1/PzxcyjHWqjsvfz2mlmBj0OrlYKPsYAmRKLpTWfQy7sR6FTXhKcxFaPdnNG9gBgqwbqQuAhUYk1DTpqnusVKcK5lKHRFdC0OvDJXCAxz750PPMChNF4C9sLdIaw3m/ZDiloG2MXKX2xoiqJGGoylLQzX98YIbnZ9CX/HyfhsKzSYNKfaEhDBlC2Zl0+VAfDzR+aEdkmjRy4qeHqjddF35ag2qB/H74IOz3RhhHovCUnxcsZQTLr/HPeF3gHAxma6sWnVCggWmhQy36t5jFI8/RPfs+x2SV3qq3AhHSYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 23:54:17 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Wed, 4 Jun 2025
 23:54:17 +0000
Date: Wed, 4 Jun 2025 16:54:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/5] drm/xe/oa: Introduce stream->oa_unit
Message-ID: <aEDcqLv34bwtOG6P@unerlige-desk.amr.corp.intel.com>
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
 <20250603202133.2713863-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250603202133.2713863-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: fac0328a-fb6c-4c70-539d-08dda3c31e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVdrTUtPN3lYNXQrMlUxQmFNR1pDbTh4L3BjbHdwZkpDM2hIMFJpYzdMSXpI?=
 =?utf-8?B?ZTU3M0VMNEJ2ZTlVMys4UTh3eDhGVVNhMGovVXU4aU9ucFFYNFYwNEhwV1VV?=
 =?utf-8?B?VWczc2R0SENmbDFMRnBFZTNzZVBFbTJPOXRYSkYySml5UTJ2ZlFxM0RUMi9R?=
 =?utf-8?B?VG1Ka1lzRnBxRnNidUh3anpGSjM5a3VrVHMwUWgxTm96TG8vbkF3Nk9jUzJ3?=
 =?utf-8?B?TFkva0xKemk1bXByTDJYdFZZVk9FbDU5Unc5V0VPaWl1VU5YaGxpTWQrOVJk?=
 =?utf-8?B?Z1czZzRmMkUwVWQyOWI5TzlNSW9SZU5pOFlTNnl6YzQ4NzljaURnVEhheTJp?=
 =?utf-8?B?OFArMFVlWjNmQUNUTUpXMHFkVXRWQXJRN2Ezc3RYeGJoR1pPZFkwTEZlbEZt?=
 =?utf-8?B?NEFZNHhDcFpzSmNmUlkvb0UrelFNa1hwaklyUVlPMk80c3RVYXJjb3V5ZTk1?=
 =?utf-8?B?Q0R4ZERxc0VrU2laZmZBQUtwcmdYK0IwZkZGNGZ4QzlOYy9KRGhGTGI2WFBM?=
 =?utf-8?B?NmVUOWJMdTEzT1lBSno0QjlXWTN3bDN0c1E0eHJ6Z29YS3M5TG9oYmdxbnFT?=
 =?utf-8?B?QS9Hb29QSkJCdjViQ1lwR21leVROQ1huOFBnbS9Wemh1NVFnbDd2VEZxY1Bz?=
 =?utf-8?B?Q2MwY0xrQi9QNGhJK1dybmk3RmxuN1IwbStibWNiaEYzbmUwbERzYUQ3MERl?=
 =?utf-8?B?bFFXZlBCUUNkWDI0MVNRQnU2bmNOanVzZXJ1dHM1UjFvNXVuUXZTNFZtd2tl?=
 =?utf-8?B?SDBJSWdCNUp6UlBNd3RIcVNFakozL2RjTEFuOGZ4elY4WnI2OWpYU0NHUWYv?=
 =?utf-8?B?Q3BYNEZIU3QyWm1LdExFbjNOTENqZkhQWHZmWEFtclBacjArWUVZM01FUGNU?=
 =?utf-8?B?SFlVWDVXQWpDOUliTk8yQkt3UWpVMGtOSnFkMnh5T3lKUWtGbmtPVjJYYmRa?=
 =?utf-8?B?bkJ6SUNSbEpmd1lOMUVyWkhaKzNqSEdWWEd6bU9BWDNGbUFlNCtISkNaWDl3?=
 =?utf-8?B?SE93dVVzQlNuajFLMFhRUVdsaXNwb0ZEYkQvUDZ5U1pmdytsb2IzZC85dlRx?=
 =?utf-8?B?d0pNYTAwZ3lIZFc0THh5WHAvVGV4aWxFdVdJUFo2R2YxalNCaDZxZDZGQ21K?=
 =?utf-8?B?ZmltcnNKOHV2S3NxUTFzOW11UmpuQ0t3WFQxMWFxOW15aUxQU1lFb1pvWVNa?=
 =?utf-8?B?L1h1eUllYXFsNDVQUHVaRnJRdzBxNUhaRk1XSTV2TmxyRXBUNTFpM25rVkFn?=
 =?utf-8?B?Nkh4djAwR3FBc1c3TDZFUVo3TnhOQ3pJYktXdjFBVVZZd1NzeWNHc3dKOHMz?=
 =?utf-8?B?eUdUL1BZR1VYdHJNK1UySGFzUUE0MWhFS1ZVS1grZU5PRTFlN3NUbWwySDJQ?=
 =?utf-8?B?V2NqT0ZsTGllN2N6eGZhTUtiRXdBUndicnprZkFaME4zV1RmY0VUOGRFS1Jt?=
 =?utf-8?B?WWxZZVRQbjZtc2hpMkZCajF2aGM1TFo1VkowQTUvSHRYNXdGa2JlWnRVeTgy?=
 =?utf-8?B?c0puT1BGUThqWXc4RTF1eUo2Y21ROHpUTE5zWXlIdWRzQ1YxRE0xSDIzYXQ3?=
 =?utf-8?B?V0pCOGhtMGZrN3RVRU8yOUZWNXN2L3dURjMrK29KT1IvNWlxa1p6NjFVNmVU?=
 =?utf-8?B?cXpXSTI0YUxmYllpRzJ0c2pUSkJLTkJKYVFzMld3emRyQ3VBb1M5YlREZG85?=
 =?utf-8?B?V2JSQlpJWkd0MitLSUVMSXFxbEcxdFYxYVdmai9heXUzdWNqN2J6cnl3d3NB?=
 =?utf-8?B?dkxNVDlyeE40UVgwa3MrWTJHSmhFcDhadk1iRHI1blVSU3AzT29OSjdpOWZG?=
 =?utf-8?B?ZS9rWWNiN0E3Z3ZJSjF1ZGJRNllKLysxc1pRaXhpNHdkdzhtT3pIYkJjd1RK?=
 =?utf-8?B?aVhiTkNEZDdYWlRCd2pJRXg2Ny92YjUzUlVvRnhTL2ppZmlJakdGWEhXc1pC?=
 =?utf-8?Q?OVzQvwIRtc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWJ5TThiWEw2akRrNEhJeEpiYklwWmkwdElzbWh3NDdrWG1uVnloUzRRS1ZJ?=
 =?utf-8?B?WFNxbnRPR0NXM1FidFU4SHZVZWJhcnNPeExkeDFWR1RKSzVJRUk3dTczYVlx?=
 =?utf-8?B?NTFPcEs2a3lRSndBaC9IQjVhNFBHdzhENWVob0t4Sjc2VWszMStaWFcyZmpM?=
 =?utf-8?B?NDZBMDJTR2R3Y3NZS1UrNVdpblZERE5BWHNad3F1N2Y0YjhNT3NVeE9NN0Z3?=
 =?utf-8?B?ckNqengzcWVHMHdYdEl4SE9sSTlwY3FpSHBpajdaVTNTRU01dUJJY2FhNEQz?=
 =?utf-8?B?TVVMRmU3UWFTK0RKaHBvanBHZTJUVnpsZy9uZXlrbXd0aGMra2FLR0lQdkVk?=
 =?utf-8?B?aWowUGxML1kwSDdNMzlDVnRRb1VLbDBpbzdRZUMxa3N4cWJmd0d2Q01jTHNj?=
 =?utf-8?B?UFZUMW1FM0dJSVY1NzNxa2k2aUp2Y09ualRyY3JiN0FvR2NZZ0hWNUx1UTVh?=
 =?utf-8?B?MkFsNDR2SW1EYitSL1BFM2djMERrYkI0aVRZMlRhVlJBYW9XUXBTRFU0TDJF?=
 =?utf-8?B?RlhoRWpPM1piM2x2cDQ0c3FEcVR1c2hLL2czdHkrSlJWN3loUEFCSHRldkgw?=
 =?utf-8?B?QnFMTnR5OVY4TjVDYmp3ZWxUb21KK3dsRTlZME8xUmxvTGMzUjc2aThXSCts?=
 =?utf-8?B?Qmw1bGxvTDVrM3k0YUxWSHVJdkNFS0RzNTBSdkxNVUJSOGVjeVJPU3U4aHov?=
 =?utf-8?B?bEVVcXNIOVd5WnNxVWZLVGRxWEcyNnB1M01ITHp0c1h3Nk4xME9XVnZlb25S?=
 =?utf-8?B?ay9mQTZmd2hxYUxzMEYvd0lOdTlzRTlvVVJJMzRwSTFIZzI5YmVCUHplNWc4?=
 =?utf-8?B?QTNienBOWUF6dXNwdEo1MnI1K3hOSjVoK292VUpJb1E3WmF6YngzdDY0Y2g4?=
 =?utf-8?B?R3hJc09SUnUxU2dJZTRJSkV4eUpWbUVXbVU1YUZiVXZrRXJJTUhZdDRDWUxr?=
 =?utf-8?B?TFRPTWNCdGNjRFFibFpSM2Y3OXAwVUdSY1p5c1d2YlRTY2wranY3Szd6S01p?=
 =?utf-8?B?blFjYkEyQTVtbmdRVWYwR1lidEdPeEpNWHhrc3N5VG0xOUFQY2haNDRDZk5B?=
 =?utf-8?B?OXJXTjRPbTVlcS9wZUE2OGdKMFBxbHdRRjdQZHVVOFBDeHNQS2ZuTHAwQWw0?=
 =?utf-8?B?Tm9IbnJBemFkOHFST3VvcmNPTnZGL28wN0VFMEYxSVI3dGtmeUxOUDFSbUVM?=
 =?utf-8?B?TWVaaVdqNVkycXJNQi9pelRHdGUyaHMyNXVXN3dxWEF3UVUxNzN1ZkFsc1Jp?=
 =?utf-8?B?UHJENUZvbzZ3bHlpK0NTVjFaUng1UWgxaE50eDR6SEdOcnFmMkpiR3pxU3VS?=
 =?utf-8?B?dE9SWXRCY1hMZm43UnkyQTBLeVd6SkJINUIwOWRJTENWa2UrWlpoV281aENx?=
 =?utf-8?B?cmtBTkN0SXFFUTkwVGpMMm1wR0JkTUNMN2l4UEpocUIzSUJ0cVRBa1pKcWNQ?=
 =?utf-8?B?MWN6WFoyclEzancrdmtrb0FWSzgzSGF1MyswRytzNDFWVVMzcTlZNHl5bXhN?=
 =?utf-8?B?YXRGdVAyblR0RENGM0dtR251WFd2RUJiTWhPV2VvbW13RHZXU0VXVHY1c0pD?=
 =?utf-8?B?aE84VjY2QU9OTXQ0Mmh4MnQyLzh1VG1JdkhEV25HUkV4eHBwZG4wQ29KUEpx?=
 =?utf-8?B?UlBmZ29aWEwwTytjdERjUTduMVRXY1JPQThiem1ET2FGWGZkUmVqVXlqVmI2?=
 =?utf-8?B?VUt5Rml1b3RpM2x0dVJjV2RCa3RkU3ZjcVZPMktaeVlKK2JUSXNjYU1kanNl?=
 =?utf-8?B?K1NLSjZjMU1XNXRzaVZUM3ZpUnM2SEhlaHptYWl6ZXFhL0ZETlN2Q1ZpMldP?=
 =?utf-8?B?TVNhcEpiM0xRWHpnK0NaeFdmTmVqdEJsZDNma296MDZtNzFrSkJXOTZkaW1w?=
 =?utf-8?B?dTVKUDFSc2hIa0Y0UVB2K3hucGpiaU5Fa2FZdUFYRzNIeExZbXpzczQvaVdK?=
 =?utf-8?B?OWtvSWJTVEdjcm9iM3FEdjdQSWJkbCtaZU1wMExyc21pdHhXWUtvTHBRb2d1?=
 =?utf-8?B?VkNlZFIvdmszS0ZCOE5ja3J1Yjhpell0dmhXMmg1VVBOaU9XWVVLU0Q1OEJE?=
 =?utf-8?B?ODNqMzNDcVJjbFMzdWJkWUlSQUxEaHd0ZHN6dEpvQTNwNDkyWXpGdFNVV3RP?=
 =?utf-8?B?Rmg0MlRZNUpORFI5a29yVVNTeWJyL00rRnJ6RzcvaGJYMTcyREJRT2I5eTBw?=
 =?utf-8?Q?FPTqbuGzG2uZAkomjBODAe0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fac0328a-fb6c-4c70-539d-08dda3c31e17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:54:17.6724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmpLBL/JQzICWq9QYAQWKYD/E1AgLQlTy+zTr4WKfzaqHvyh8ZkFscdUbeywG8Gi+tmYXU2MZmJYSE2/vTG9PH3FhDIOTS2TXEWu81uhvlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
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

On Tue, Jun 03, 2025 at 01:21:31PM -0700, Ashutosh Dixit wrote:
>Previously, the oa_unit associated with an OA stream was derived from hwe
>associated with the stream (stream->hwe->oa_unit). This breaks with OAM_SAG
>since OAM_SAG does not have any attached hardware engines. Resolve this by
>introducing stream->oa_unit and stop depending on stream->hwe.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c       | 51 +++++++++++++++++++++-----------
> drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
> 2 files changed, 37 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 94faa4ed2012f..4d6d9f0189a83 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -83,7 +83,7 @@ struct xe_oa_config {
>
> struct xe_oa_open_param {
> 	struct xe_file *xef;
>-	u32 oa_unit_id;
>+	struct xe_oa_unit *oa_unit;
> 	bool sample;
> 	u32 metric_set;
> 	enum xe_oa_format_name oa_format;
>@@ -200,7 +200,7 @@ static void free_oa_config_bo(struct xe_oa_config_bo *oa_bo, struct dma_fence *l
>
> static const struct xe_oa_regs *__oa_regs(struct xe_oa_stream *stream)
> {
>-	return &stream->hwe->oa_unit->regs;
>+	return &stream->oa_unit->regs;
> }
>
> static u32 xe_oa_hw_tail_read(struct xe_oa_stream *stream)
>@@ -460,7 +460,7 @@ static u32 __oa_ccs_select(struct xe_oa_stream *stream)
>
> static u32 __oactrl_used_bits(struct xe_oa_stream *stream)
> {
>-	return stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG ?
>+	return stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG ?
> 		OAG_OACONTROL_USED_BITS : OAM_OACONTROL_USED_BITS;
> }
>
>@@ -481,7 +481,7 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
> 		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
>
> 	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>-	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
>+	    stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
> 		val |= OAG_OACONTROL_OA_PES_DISAG_EN;
>
> 	xe_mmio_rmw32(&stream->gt->mmio, regs->oa_ctrl, __oactrl_used_bits(stream), val);
>@@ -848,7 +848,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>
> static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
> {
>-	struct xe_oa_unit *u = stream->hwe->oa_unit;
>+	struct xe_oa_unit *u = stream->oa_unit;
> 	struct xe_gt *gt = stream->hwe->gt;
>
> 	if (WARN_ON(stream != u->exclusive_stream))
>@@ -1145,14 +1145,31 @@ static int decode_oa_format(struct xe_oa *oa, u64 fmt, enum xe_oa_format_name *n
> 	return -EINVAL;
> }
>
>+static struct xe_oa_unit *xe_oa_lookup_oa_unit(struct xe_oa *oa, u32 oa_unit_id)
>+{
>+	struct xe_gt *gt;
>+	int gt_id, i;
>+
>+	for_each_gt(gt, oa->xe, gt_id) {
>+		for (i = 0; i < gt->oa.num_oa_units; i++) {
>+			struct xe_oa_unit *u = &gt->oa.oa_unit[i];
>+
>+			if (u->oa_unit_id == oa_unit_id)
>+				return u;
>+		}
>+	}
>+
>+	return NULL;
>+}
>+
> static int xe_oa_set_prop_oa_unit_id(struct xe_oa *oa, u64 value,
> 				     struct xe_oa_open_param *param)
> {
>-	if (value >= oa->oa_unit_ids) {
>+	param->oa_unit = xe_oa_lookup_oa_unit(oa, value);
>+	if (!param->oa_unit) {
> 		drm_dbg(&oa->xe->drm, "OA unit ID out of range %lld\n", value);
> 		return -EINVAL;
> 	}
>-	param->oa_unit_id = value;
> 	return 0;
> }
>
>@@ -1683,13 +1700,13 @@ static const struct file_operations xe_oa_fops = {
> static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 			     struct xe_oa_open_param *param)
> {
>-	struct xe_oa_unit *u = param->hwe->oa_unit;
> 	struct xe_gt *gt = param->hwe->gt;
> 	unsigned int fw_ref;
> 	int ret;
>
> 	stream->exec_q = param->exec_q;
> 	stream->poll_period_ns = DEFAULT_POLL_PERIOD_NS;
>+	stream->oa_unit = param->oa_unit;
> 	stream->hwe = param->hwe;
> 	stream->gt = stream->hwe->gt;
> 	stream->oa_buffer.format = &stream->oa->oa_formats[param->oa_format];
>@@ -1710,7 +1727,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	 * buffer whose size, circ_size, is a multiple of the report size
> 	 */
> 	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>-	    stream->hwe->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
>+	    stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
> 		stream->oa_buffer.circ_size =
> 			param->oa_buffer_size -
> 			param->oa_buffer_size % stream->oa_buffer.format->size;
>@@ -1768,7 +1785,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	drm_dbg(&stream->oa->xe->drm, "opening stream oa config uuid=%s\n",
> 		stream->oa_config->uuid);
>
>-	WRITE_ONCE(u->exclusive_stream, stream);
>+	WRITE_ONCE(stream->oa_unit->exclusive_stream, stream);
>
> 	hrtimer_setup(&stream->poll_check_timer, xe_oa_poll_check_timer_cb, CLOCK_MONOTONIC,
> 		      HRTIMER_MODE_REL);
>@@ -1804,7 +1821,7 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 	int ret;
>
> 	/* We currently only allow exclusive access */
>-	if (param->hwe->oa_unit->exclusive_stream) {
>+	if (param->oa_unit->exclusive_stream) {
> 		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
> 		ret = -EBUSY;
> 		goto exit;
>@@ -1880,9 +1897,9 @@ static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
> 	return div_u64(nom + den - 1, den);
> }
>
>-static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
>+static bool oa_unit_supports_oa_format(struct xe_oa_open_param *param, int type)
> {
>-	switch (hwe->oa_unit->type) {
>+	switch (param->oa_unit->type) {
> 	case DRM_XE_OA_UNIT_TYPE_OAG:
> 		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
> 			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
>@@ -1922,7 +1939,7 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
> 		/* Else just get the first hwe attached to the oa unit */
> 		for_each_gt(gt, oa->xe, i) {
> 			for_each_hw_engine(hwe, gt, id) {
>-				if (xe_oa_unit_id(hwe) == param->oa_unit_id) {
>+				if (hwe->oa_unit == param->oa_unit) {
> 					param->hwe = hwe;
> 					goto out;
> 				}
>@@ -1930,10 +1947,10 @@ static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
> 		}
> 	}
> out:
>-	if (!param->hwe || xe_oa_unit_id(param->hwe) != param->oa_unit_id) {
>+	if (!param->hwe || param->hwe->oa_unit != param->oa_unit) {
> 		drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
> 			param->exec_q ? param->exec_q->class : -1,
>-			param->engine_instance, param->oa_unit_id);
>+			param->engine_instance, param->oa_unit->oa_unit_id);
> 		ret = -EINVAL;
> 	}
>
>@@ -2014,7 +2031,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>
> 	f = &oa->oa_formats[param.oa_format];
> 	if (!param.oa_format || !f->size ||
>-	    !engine_supports_oa_format(param.hwe, f->type)) {
>+	    !oa_unit_supports_oa_format(&param, f->type)) {
> 		drm_dbg(&oa->xe->drm, "Invalid OA format %d type %d size %d for class %d\n",
> 			param.oa_format, f->type, f->size, param.hwe->class);
> 		ret = -EINVAL;
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 52e33c37d5ee8..a01c85931e2a5 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -182,6 +182,9 @@ struct xe_oa_stream {
> 	/** @gt: gt associated with the oa stream */
> 	struct xe_gt *gt;
>
>+	/** @oa_unit: oa unit for this stream */
>+	struct xe_oa_unit *oa_unit;
>+
> 	/** @hwe: hardware engine associated with this oa stream */
> 	struct xe_hw_engine *hwe;
>
>-- 
>2.48.1
>
