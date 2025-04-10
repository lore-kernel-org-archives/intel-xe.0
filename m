Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1724C3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 21:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64AC810E1AA;
	Thu, 10 Apr 2025 21:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQ80mk7S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB0010E1AA
 for <Intel-Xe@lists.freedesktop.org>; Thu, 10 Apr 2025 21:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744322008; x=1775858008;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NYYYr6+Z9vuGgZm75n+Nvxbc7r529ti9/P3vmz2df1Y=;
 b=OQ80mk7SwuCd9b7usvWhCuuybhKm86lYSQdUibNA1tRlbr9+Zlbiny3j
 bCv7LUBW7QD9hVh6Vrf0ysq8o7BYVmrO16smt/WZtFmLVgEx0JJyM/7pG
 mgco0UMsN1Bn8TcQGAzZMVj6rUQjZunN0GDKJ76TEMV1vr9Q0S5zoQHO8
 J3sDHKSFLAd73St14ZS6awoUH1iX5VG35kWIkDt+5HzEsAd4Q4qBqiZmE
 w7KT7R9rlBN8lVv3LRFtWxAzlqFXUzmYWKyMfgE0giCBVP9hKew5u7k0X
 fpVQJD23Y0i6fEP0nAUczTBz0gjpTXA3slpDm0GYqtMWlYMqycehUgX83 Q==;
X-CSE-ConnectionGUID: J1izS+S7TfWPXWP6A2TZwA==
X-CSE-MsgGUID: PXiRSGAyRKGlTiD5p75MxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="46029785"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="46029785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 14:53:28 -0700
X-CSE-ConnectionGUID: mOpa+Y5pSW2ny8GEeCAnvA==
X-CSE-MsgGUID: O7Bhms4FRPGFgOqU+7Tdyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="129857210"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 14:53:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 14:53:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 14:53:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 14:53:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwBAfndyEoNg/pzMfE/qfi4nnMRDSBziE877hdVZ/wasrpCbJpIE822naqJXNJhR/TSRMw9uytB7Qh3/Hl2w+IeIRPhsR4QOc+6DOOyaM4el2BR+ektyqU8765QkWSxXXvQWp6DodvnDu1hi1NYJMjy5Q6iId9coEbci6PT8G2u72Jl/LjpXe5kEVNnXOkBFVM7G2f9gM5lzxH/eG5ki41Zpfh1hagqfdqXTjbbsqbI+oL4IoLgBCZp4fO898A27e0z3PqHxSfmA3dZJbAZIKdGNgsuPFF61gVNx9dFvfmPWyv5qe+iUVqpI3kltDtKRZWsuRrarfFCwGYv78UTrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3RYbljOFmRTCVWsbenhIMysfuzRKrY7OoisJhLXSCk=;
 b=a6VXiT9UHsfTn6ypjW5tzl5kC6ghkpAFe39J0qIFU6l8PY0J6BzS7Kkm7pwimsIL+a3cTSsQ4PY6U3z2UPtCibXWvc8i1dRm8jUDRDdmtWJY3UycW0ljWAMNnNw5ucAWzYbxmDqyNkwD9UFzbo/6Xzk5OyFGZ2VISgFskYtmTXPuYOjxMnn5FXJg/3WrFBXDiit8Nm4LM5tS9rphsCbp1FOmbKJQOPa3iYUJhAzi4YdwT0UYZdwcDRqOYEZrtj3SDnCQ2EEpzZeMPEidu67dWwGiTK2o1Y0vi7FBA8ezU0KxiG+a42kJ+Jn5gqc3eH/c8G7fcy7vizSMEvQBSVOo4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9)
 by DS0PR11MB7959.namprd11.prod.outlook.com (2603:10b6:8:fd::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.31; Thu, 10 Apr 2025 21:52:44 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB8303.namprd11.prod.outlook.com (2603:10b6:208:487::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 21:25:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 21:25:15 +0000
Date: Thu, 10 Apr 2025 16:25:13 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 0/8] Enable w/a 16026508708
Message-ID: <hz4aphth73wrlqdamgcdzdudkgmubhxsdg2twkglgcl7s6ge7c@22eolqhdswyf>
References: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250403185619.1555853-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:303:16d::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB8303:EE_|DS0PR11MB7959:EE_
X-MS-Office365-Filtering-Correlation-Id: 59db2df2-e085-4f51-81a6-08dd78762f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hL/qZcnI1uANJLJA1u63yptICDuWVN7W+nvpMIMAhyyt1k+cmCqK1BVwmGXB?=
 =?us-ascii?Q?kj83VdcQxBRIbouucMM1R2NL/N/kG11i2zLpCXQs52OK2Oas9j5504pHY/gW?=
 =?us-ascii?Q?5Ocar0DUUFcZg8JDBVnldJNTpsr5chaSnPLNs6WToqLUGnMQzUmTeYKdw252?=
 =?us-ascii?Q?AaLzwgKPZ0HLjW7L8+L6vUz5kj2XnExF7AULBrBveWgqt8ceFHWIoyzDm+Tn?=
 =?us-ascii?Q?X8r0R6xdnbkrsu0gStonLLFqusDGBOlgD2gHDBk26plstuyacArbXvBT3hpr?=
 =?us-ascii?Q?pUADQbXKOgm0rhGkz69tiXYFj3cvdavkdTWBCl9r0CeV1cTpgFcZiUxtaBLZ?=
 =?us-ascii?Q?D+2ha8G8qTyGXoW6s2UIidsxVqc3YdLMFT7RxrJCMrkEgDJtAO3L+ejCGyMm?=
 =?us-ascii?Q?8gY+0Fivtwz66zu4CK9AIqON0RP9DVY0znZf0xVihKQIWlIbqiUhakTMpy7p?=
 =?us-ascii?Q?5vvoV0Erxw1Yncsp5Q9gFhiLoYB0/njHfCRnBM8QS6fGla7+fqYQtmVb+zC3?=
 =?us-ascii?Q?YxMEsqpZ6iQB6H5WHIBmEC9x/VyJ82HO2scsolf6NDmZ2jHrBAb8frdx/rL6?=
 =?us-ascii?Q?uM5rpD+e1pNE955xIVV2I+//AtM8yjt8GAfaU0BxWXzFqsUiyQ/2IkEDKjUH?=
 =?us-ascii?Q?AacbEqMf2xISr3aAAHey/KTwDOYbuCOrc9n+Q5Pue0shegZyp2C2ClIKqrLf?=
 =?us-ascii?Q?d6yMTeJ2YYlVp40h0jQhUqtpLCctPuv6hEY+RtvKkSNk4QVKKfIWMJh3D9fs?=
 =?us-ascii?Q?/1KWy4wBp+gZCDAi79ucN/TDvLUdz775bWkQZCGDUKx2Ao+k2Bkdj786UV30?=
 =?us-ascii?Q?IyOvX0md4WMe+48NRqHru8dALQR0Ouy29CexAZGfhAq9MACW5GI6PF8jax6i?=
 =?us-ascii?Q?wBFEqETte4wO1q1e2H7erzeP76aQGX1rYnwLZR59BeuxqqNvpSkukiZujtoc?=
 =?us-ascii?Q?2xfRxrAZcA6HwR1RrOrASeQjroH41IdyuLGW1UnUN/0gZUyAZI375dVof/kL?=
 =?us-ascii?Q?nqpkLzw6Wo/XzsA38jCmqj0WwVoXYmVkB4Gxm2k5B/stGviCvdBTiWChu3xB?=
 =?us-ascii?Q?LqdtAyUTvAO2a8WP3bdH3lmqU9ZfCrtgBlM0/JTGZ1eicKKfK6buBBXNhMAu?=
 =?us-ascii?Q?D57ZWfrItxP6N434II4aPQGXVj6/Rt2uyHYCGorvabdH/xTW6cUGsSSMh1xB?=
 =?us-ascii?Q?us2gDBZ/NVGoC//OWS/oJubohRg1K68P7nnPNtfuWD5xHyDti9a/Z3EeuWIU?=
 =?us-ascii?Q?PUOknb9x6umPuuWPWeT9HGpxoRU7HSegZ7KefKQcwaOLMeatA5V4bdvPzd7S?=
 =?us-ascii?Q?JI/RJFKrCRDtMCTv9L8E9nE6OGxdB27acuGPfT2T/4os2qXFLDQVhxZy1YDP?=
 =?us-ascii?Q?su5n0N7S3/iuvNFQg5d0Nc0TMb4+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB8303.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qpRg2m0LMXQEp2EhexKsVhWYNcx42Utn6F8bcphfnhGWKyZnXIn9eIHbDzPV?=
 =?us-ascii?Q?HrJKMWOa8rBiE7iLvS+ph7a3kS20ubZk21Zr5J4f4QT4z14Xon289OV8vSyu?=
 =?us-ascii?Q?sSPHB6T5GV64KpfaYFgwIQMVM4cFaEJ+pbOOc0XQrhEjR3cooKyM5G/HFIZN?=
 =?us-ascii?Q?knox4BrODT/+dRZKJRzdLAMg09DrEnQToPSB3xvNL2LDSQsAYDIaCbfsuERa?=
 =?us-ascii?Q?Dy/u9rd8rms3vSYRdjT2n9q3r9uk9ZWOT2/zO1t5gx4bIQh0aA4OT3vnj6DP?=
 =?us-ascii?Q?78+3R8PwfLAG8BSYKjJSBAJ5i/6ELVoAaRDIgJzlPV59iOo8e8C3v/cc/Yix?=
 =?us-ascii?Q?xVu31MQZVabOwxiMfUlCOyOxixg1Zz/BBWbHA4Zvq1US+ICx1norPAsrYoLN?=
 =?us-ascii?Q?+XfbqIPb8SyrHFzKxaR7panKM9O6JlTWDkRoe6gK3G7fPT6TGT3JTxtwagtJ?=
 =?us-ascii?Q?6GLSpoCMQQCdsn3fpbm1+Z5PKnZfn5FOTdPkc2U+/vJziijQb5EivvVtrVCt?=
 =?us-ascii?Q?X+eWPNxBqSymMyCNDXoCpTrTFIxzWdIo+znFHDJM/upoilqFW6uE5C/mCWAG?=
 =?us-ascii?Q?4zetoAUCL0w+gZvyGemIcCpWCSLQIxss8L7J4P/HiuQZF7oZOUkFXpSnOt8V?=
 =?us-ascii?Q?IAF1DNQDFjjM30I0vvg+68PesfMiBftPyV52xJBI6/xOcj4jJwPu9KbZUVgH?=
 =?us-ascii?Q?HGOBB79ZDWkJowOd8vXzgb+OC+STnX8H9rDeyHa3xGPS3rpl5jCSFvDktlwZ?=
 =?us-ascii?Q?8A3xpCLwmmX7GueAGtDS0cIU4Wv1swJRqAmBY3F73ZCKdqY9uWdPyJGEXhYK?=
 =?us-ascii?Q?BfEVaBG/19elI5vcIbRKDD1i3skG2y2eu/glGDipb8EfIvD5QdrohjtYxE0I?=
 =?us-ascii?Q?THsrIfqEq3urKEcDvKpvgIs/lioTW8635pcV6aJ4hFY6pkPTyucq4xqHGZo/?=
 =?us-ascii?Q?wN0sazPl/kbdkN2LMD1X87Qct8qqFqCMnsKc7qc0XQV/CrfHBLtVKSYWFHSW?=
 =?us-ascii?Q?fXw/pzrjSiUhIn+0HFWYfDuMmJ1l3cP4MpSkonEulJ9BI8upHNb+fjYOnOCY?=
 =?us-ascii?Q?3emmsy63Ij94FY3rg+i2ZxSagpQO1ORDlq3hn5jhnClBYEtv42YN7DgC8FST?=
 =?us-ascii?Q?KlfRNyHcSihhfBbJlhoe1f5zFKiCM//5SBzrsElGPMzU/tvUbLzmn3U9BA9F?=
 =?us-ascii?Q?kOkEMZWtP7NP8QvcJR/Ut96wuoEv7uGgSng00Yf6HECL4v/sQWw12nxIWFZc?=
 =?us-ascii?Q?3XkwxrQQGIKfox2E/Uc4O+RI3W0UF/GDOgOfMBCR4MHP4g1bTV3FUKCAztVO?=
 =?us-ascii?Q?n3wl8CjuBB9g6/MFe4ST3cOATxj0lvt023m8eEWIc1tVrH5AoyTfXMlW14Di?=
 =?us-ascii?Q?E8AytmSpfeUQIQLxOeqbug+9lRge4j2TS1fIUnJehYB+9jgIDG4LgB32ERnZ?=
 =?us-ascii?Q?Yx/ygkG7n9svBFeIF/spkqv8cnxIEKXdpCoQbkJQFFM1ShX8SvrEwA5tInCP?=
 =?us-ascii?Q?QQMYPO0cBg77h3I16Lrf6NmlrdZXPeZhLtBhBSmi4WOjAXrWYyH0Vhc7/i5g?=
 =?us-ascii?Q?auQcI9sTtBcD1R7C8pA6gyKFw2Yu7onl9TSqQHENzHa41dx0vxP9u6kqTtVC?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59db2df2-e085-4f51-81a6-08dd78762f9c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 21:25:15.8454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xHHAKGmxynwJHO9OgeF++L+zwFEa68SylxQShJDHt1IByec035SohOX+kzCou5phaqFzCoukiTxAWVvRKTB+sgtN6Ztqm5xfKhS4uGY5Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7959
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

On Thu, Apr 03, 2025 at 11:56:10AM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Enable workaround 16026508708, which is relevant when SRIOV is enabled.
>
>The w/a is implemented in GuC, so also bump the recommended GuC
>version to match. Note that PVC and PTL are not merged to upstream at
>present, the GuC definitions for those only exist in the for-ci topic
>branch. So this patch set reverts those patches, then adds the bump
>for the fully upstream platforms, then re-adds the CI only platforms.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>
>
>Clint Taylor (1):
>  drm/xe/ptl: Add GuC firmware definition
>
>Daniele Ceraolo Spurio (1):
>  drm/xe/ptl: Define HuC FW version for PTL
>
>John Harrison (5):
>  drm/xe/guc: Enable w/a 16026508708
>  Revert "drm/xe/ptl: Define HuC FW version for PTL"
>  Revert "drm/xe/ptl: Add GuC firmware definition"
>  Revert "drm/xe/pvc: Add GuC firmware definition"
>  drm/xe/guc: Bump the recommended GuC version to 70.44.1
>
>Julia Filipchuk (1):
>  drm/xe/pvc: Add GuC firmware definition

Patches spread through drm-xe-next and topic/xe-for-CI as needed and
pushed. Thanks.

Lucas De Marchi
