Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FEBCCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 16:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1151410E886;
	Wed, 15 Oct 2025 16:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJ1aTiWl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318BF10E884
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 16:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760545840; x=1792081840;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y5Gx1/ECQQUmo+HlK8QkQUN2GlObsZwAoWiTz0f6LwY=;
 b=lJ1aTiWl1n8P+5Rd6f/e2j4wsPvDBaRWReOwCqU1IzEEs+FSLAm3tYWS
 JzlCl4LUPDeuyTnmSkJ0LkaGOExjWZhmz3riztE5VvXSXfn+70v++rioh
 OE+QYhWUkJsTtcj72I9WMhvDtPhJDoH6XhM+4QqDtAKLHktv5YLAu3tX6
 g6r4RBVOEICBX4BDtFvBsELBXODL26ZkZyHpgXs8swQWXW6tUWqAmEY8a
 Y0cEKPoHAu2RdZ+CP0Dj6BpPVHLPMNM9HhET+nUexnPZajrDT80QwnGDl
 GiUp8/ZfY/bAwqfWKVWQ4hWYXHQsyB8AFl6I5AFLuZKKFYPX+Tqz9ssT9 Q==;
X-CSE-ConnectionGUID: aoQEoLZzS7ajc4nGDuRv6A==
X-CSE-MsgGUID: QAXwv7gVTtacDuKH48oHxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73003807"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="73003807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 09:30:39 -0700
X-CSE-ConnectionGUID: 0g19wb4pT8Sg06aDUpsTMw==
X-CSE-MsgGUID: Mi/elpn4TvOKl+BM9Jc9YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182678904"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 09:30:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 09:30:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 09:30:38 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 09:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hS5nbae9NtDPafPf4sReVrHjTq92RBjLPmttDc9lRUpBQgnFi2E1aI+1vU6kO4+xodGMMpofqisCgew0Qf7VL5erLXNGp3FDStxdwTY1vKag7DcFbl0/0IGV/cJi9qQaOZqOig8uuOuRivriw5OF5ek+1XD6Oj6ND0xDaltpcp4l03xw9iJV8nFjYygtOEHZ9p3JemHN44JLeDOCY22mCL/6L+kU9AvLq9Z3yhEJrT8k4rzT6VNmZVj8yr17qmzrp6+X3Rdo6F/PfXQzDzAwsDwZLUn5UWcIJoXatzVZe9iBQ9+X2IoaylaCJeWJtoO5bFTAQ3K0Jbj54l/rkBhM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCm6PAUuWehucRQFB9iygflBeHZVAjahvslhNV1Nppo=;
 b=nQEX35to/y0X5ehK8mwxxgsUB+35BiXy7iGmzt2FpbhyuiuKwVBGmr0qIoehZ8AdFWb7jwdZ6/WkHxdhJKOkUWJF7jOvlrTBknwEkbfrcqC938YT+OOkgVF/9e8sh/9RXK7NnEWOM8PVB6asQpiMNkr8NKfW53KCm7QHUw191SLTaqF2pQF85rEhKEu0U31Bdep9mYAwhhzc7k8VRNqsvUZP4GEehRvgnl0VjT6c+HUAdwNVq4QxgG+Rhsw/Bs98IzoDkuSRlP4UR/P48jyTWvyBR2QLeSY2fYxBbJbwPjutlcmKatC3T9dU/vyKaBQlCEHcqaH2x3J2h19Uy0DbOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7435.namprd11.prod.outlook.com (2603:10b6:806:305::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 16:30:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 16:30:28 +0000
Date: Wed, 15 Oct 2025 18:30:25 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe/pf: Automatically provision VFs only in
 auto-mode
Message-ID: <20251015163025.ld5k7ymigxmq5zad@intel.com>
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
 <20251015091211.592-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015091211.592-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1P194CA0036.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: c44f2c6e-5b4b-4f16-2a31-08de0c0826e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDNDMFpqYzZGWUVSc2FidEYwQUJCd0tCTExqSnlDRm5ia0x2c0cvcTBFbDIy?=
 =?utf-8?B?NFRCQnJFMTdVclppNHFsaHVKcXZnQVIwTmdYL0hlVFRZZGlDcHBuRVRaR3dZ?=
 =?utf-8?B?dlhVR3QwNGNkc3RXemlZMHJvS1YrbWllN1BneHFRZ0ZwVWluUVV5dTlTU0dt?=
 =?utf-8?B?RlFJdUlTNjcyUDhTM0pKOXdnd3Axb24rUTBHOTgwLzJWeTVyQmRKVFhTZDJu?=
 =?utf-8?B?S0hHSjFHYmJpb05MS3lzY3lWYlJ1Sk4vcVJKWlB1MHVkVDFwUEVnUW0wU2FO?=
 =?utf-8?B?cVgxelhWRGc3eTg4MWpETnJ3N2dJVDlPT2RFUmVWM2FYVjhPOGJaME1NQlYy?=
 =?utf-8?B?Z3JXK0Y1SVFCZTJzT2MycWtHWnFiMzNZUmV3NlZwTFNCSk5TVGM2U2E5UTNk?=
 =?utf-8?B?V0xnOE9LWFp4Y1p4U2g0NEYzS0E0YnhZeG5XazEzanR3UVczQVVQSmo2czZP?=
 =?utf-8?B?enlxRUJGc3dmd1cveFd4NFNNQVFrZkdqOWQ2VUpkdEhaM0dIQk9QK3hOdXdn?=
 =?utf-8?B?S29BMDdrNnM5Z1Q5TnRkc0xLMVUwVWkvTktMSEVRZGlHdzUxMno5b3hqT1Yv?=
 =?utf-8?B?bmVwZDdIOXdvTEFBTHhPNGttUzNuK3JoOE5ZYWM5Y1VjSVM0dVM2dDlSR2FX?=
 =?utf-8?B?TmQ0VVNFTFIyeFoxd0Q4OEN3bGhnWUl1cEd6Ri9OcjdUbjQwak5TcER6ZDNF?=
 =?utf-8?B?YnhCeVc5M0hmMjIvenVvb3puYkdzOXcreEpoeU1pamZDd2xyY2V3bi9SWUVP?=
 =?utf-8?B?dTYrNXoxQWlCR2MwMUtZcmNadXBiT2thUkYwR3U0Y1J0NEVFMUtXOXV5MkZo?=
 =?utf-8?B?dWVJQlIyVnJHeUVPWURRSzNrQXlRTFdCemFVTXhQQmhRSjRXOGdUQ0NlbFZl?=
 =?utf-8?B?K0V0RG9BcWNKZGY1L1BseHpVWnVDU3Q3R3o1QysyVHpQSm9hT1MvRGxIWkNn?=
 =?utf-8?B?NTdsbUFmc2IzQWk4eXVrcW1DYXZ6U3dPbkMxaFRLeEtkRlVZS3k0S1JpenRL?=
 =?utf-8?B?bjQ3K3hnSWQ5YkpnQytsbUlQMHlFeStIOVRqcWxEbWRuRWNpbHhoMElPeHRP?=
 =?utf-8?B?Y1ptTkN1Vk1ONGVINDFBQTkwN2tNK05yVkNBSE9Ocis2bk8xaGxjL2FUUlA5?=
 =?utf-8?B?dkZ4Q25raWVwZFI1KzdaUDN5ZldTZTZuNDZBdjNyRkw4RWlIY1ptTmNNRFhW?=
 =?utf-8?B?U3pzY3IvS1krLzdUbUFXcVI5VFNIUE9iS3g3SENKYTZ6NU9EL1NHZitsTUty?=
 =?utf-8?B?RUdUdW11WHpHcnQ2cmlTNHdjbHJpZ25Xb3BnaVZuVm5ZSHJuallXMGVSNmJh?=
 =?utf-8?B?ZVdsN0s1Yzd3V2NoYkpwS3ZVUUxhRXBNSlJJS2RicUhCNWtOZkp4ODV4bURB?=
 =?utf-8?B?aXVPRE95RFB5c0M3bGlIOWFuVWxabHJVUVNWTUwvNU13NzU1MGdkeVVvTElM?=
 =?utf-8?B?bVVreXZJYjYyekpIOHlndk1CSnJRTklUOUIvZVZHck9JQXBiQWhyQW5XRG5D?=
 =?utf-8?B?OUNVajNDNUN5azd2bFByVEJuY0FhSVlLUzcxV2dFZjBNRTE5ZHM1MmJ0dVpX?=
 =?utf-8?B?THNRUlRSTDEweG9nVTg2cTRJdlRsUmpJRDgwQ2xGSzJwMXQ4UjE2Sjd2OUNp?=
 =?utf-8?B?QloxckVrOW45T3Nac3lrSHB6bkdsbmxPRUN0VDNHdkREbWNzUWtBTW50N0dN?=
 =?utf-8?B?Szg3VlBzRUZnTC9PVThKd3ZCd3hZbitJWTZJVC9ybW9vM0dOWmpIUno2Umt0?=
 =?utf-8?B?Q2JXUmZTTFVzTEpMWDBlNHVnMzZZYlBhM2tMVmVPbDhEaURHcW81R1k3S0g5?=
 =?utf-8?B?bUFiWFh4V0VxSzVJQTZlblp2M0ZGSHQ3TUJhby9IZjcrN1VUS1Z1bXBBenRh?=
 =?utf-8?B?ZXZ0Q21KM2V1N2hEMTlNQk1PUnRGTGwyVGh3azVhQmQydGRsN2cwZXZzdEt2?=
 =?utf-8?Q?RAvQ4LdvUPXUKtYLAAmoITEyN3xZiBO2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmhjbFB3eFMra3BOM04wTXZiemRMdjVQOVpjaWtyVUZQM08vbFhhVTdFR2Ex?=
 =?utf-8?B?YnFQajVVcnRZZHVobE1IcmtWNklsZnp6R1d5ZERJV3RDbm11WGdNaDdCT0Va?=
 =?utf-8?B?V2xHV3B3bDc5TnZSK2hZK3hNbDJmSGxSVStERGRNUG1tRDVLZm9KbnJSTURZ?=
 =?utf-8?B?VDgvU2FyVTBOSVlhOFVKUnhibW9KSVRITElpNUU5UWRMMVp6UTlYanViZG5G?=
 =?utf-8?B?UmppYlpaQzFONTV0ZVZZNVBEalQyVnRuKzFOOXdwL3hiYzdrR3B3MlhsYXU4?=
 =?utf-8?B?bHVVa1pBVEwwbkVUUFdZNmNEY3labnB0MSt3SmF6eFcxYTVnRkVIdjhVOVpY?=
 =?utf-8?B?SjU0OUFCeFZKTWNCT2w0MDBERDRxMFgvWUI4WW1JTFErTTFZbVBrSXBwajc0?=
 =?utf-8?B?S2pERzRvTXRIOHlETjZOeXFLZWczNUpYN3dYT1dMemdGNGYrci95TDQwZ0Q4?=
 =?utf-8?B?SG56eVRqb1pIKzZ1bC9MSDM5aWh5RUFFWUE2SXo0TmFxTy9TOVhVZFVwaFJJ?=
 =?utf-8?B?ZkNJS1MySDVEalh1QmM5dzZzbXg4VUFVZmZ2R3c1QWNDWUhTL1lpaTVxT3M3?=
 =?utf-8?B?dFNRR1ZUV0JwN0JnV0pyZGpzSmI5NDdHZDRCNlM0Zy94M1pnOUVBSlZmUGZS?=
 =?utf-8?B?UWN3S2Q4SGFvZEhXdm5leHAxQWJCZFBBTmFjM3AxUlBuSDBWOGFsUEhVMmxu?=
 =?utf-8?B?THJDYll0ejB6UlVRbDgwVWs1VFBDZVVKbWwxUHZZZi9uSm5GbGROTkIvSW8w?=
 =?utf-8?B?NHBWWCtjZmZpMVBhVTh2VXhGaHhoU2l0QmhPdjhTNjBobmVKbUY5ei9jWVZL?=
 =?utf-8?B?cTF2SnVPZ0d2YWFMRDltd2U4SzVtN3lTS3I4bVFEK3pjZ3VpaGtnc0FIWDRp?=
 =?utf-8?B?eXJjTDhudmJtZnl6dmo2UnV2Tmg1OFE1Tml0N1U3c3FNWFdEdVNIRFRwVy85?=
 =?utf-8?B?SlFESERRNkFSa0lLY1UrODQ0SmdKdXhIcERjVlNkWUF2bTJwM0VxZ2l2emNH?=
 =?utf-8?B?S3YreFpzWTMwMzhuK2pzcVNNMXM5QlJDWnBaa0RNNVZrY3J0a3FsdDFEYVM2?=
 =?utf-8?B?bk03S3U3dlhTTGNQSXpWOUU5NTBCSDNrRHlHNDRTemFmcXNMTkpEemVKTzBN?=
 =?utf-8?B?Tk9YZWp2TU5VQ1NRSk8vc0Y0bVJ3bTlkbkNEdE1waXdkbmhDZjRLUmVZTW9P?=
 =?utf-8?B?K2pVMFcvZHJRQlVLREZpVXFXT29XUHdwdFNBV1pvdlNMOERVb1JEcGpvWjBV?=
 =?utf-8?B?MkYrY1BKbnRKM0lYWlFlR3VXN08rRTRFSS9ORUFueWtucVBXd0lJQjVpYk12?=
 =?utf-8?B?Yk50a2xEb05XcEQrcGN2NFJSMVNkUURNRlV6ZGFSZ0JtcmMwSW1xWHFVc1VS?=
 =?utf-8?B?L0VOZmpPVXFuMVAzc1J1a2RXdTVXUW40SDU5ZW9iUEU5WE1sOVdOdzcrRFV1?=
 =?utf-8?B?S1p1T0xSbU9zTEt4MzlNU3FseE5LSW5BdlRDQXNETHYvRmFrbzNrMGpRU3Zk?=
 =?utf-8?B?NWNOSUNTbHlGdUxZVlZNc2xEbytXSTJGZksrbmcvZFk1RHcrbHQ0OFNieGxM?=
 =?utf-8?B?Wnh1TStMMjVvUVoycHVjVDltemVhaWs3c0VpNERVS21RamlSdTh5d3lxcVZz?=
 =?utf-8?B?YnVVb2h5cEFBc3RMcHJXODg3VDhCajRiYzBBb1dTRDBHQ1VDemFPOXM1dmdO?=
 =?utf-8?B?dlp3dHdOUTlFVTNmSGFPN2ZkNXpsNFRsRmpZS3JrUE9zck4vcXZieDY2NDdU?=
 =?utf-8?B?REF4ODRqWmxQbkFqdXdXeWVyMmttV2dZZmdRWGdtbGxwSDRBZFZZdlh5Ky9O?=
 =?utf-8?B?dSt2VFI0cjNIZ0M2NVFQTnBuZUV3SlBWOXBMNjMxWXoxemluNlNEUFJ2M0ZU?=
 =?utf-8?B?VlBoNSszdE1rNG9KaDhNZ3FOYytnN0oyeFNNdFBHMEVuTEorVVBxeWRKVFNU?=
 =?utf-8?B?b0pOVG5uTzB1TXBtbFBVWlBpVDdxTVBEOWxSVUV3cHVlVVRCVHpqbVZSSS82?=
 =?utf-8?B?dEhuN1AyTHcvVE04QXZEcFVqSEdNQVYzUHhqQXpvdUV2UXpyWllaR2Y5cUE0?=
 =?utf-8?B?RytmVU42Q2prV0ZmYjlrR3p6b0NaU3dDeEVFTnhUeFcybGMwYlluMCsvTjJH?=
 =?utf-8?B?dFZvM1lEU2VoSDhCMldieFpGZjRrdk1DaDhKWm5RbXczQjdEa0wrZ2lCSW5Y?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c44f2c6e-5b4b-4f16-2a31-08de0c0826e4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 16:30:28.7244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z9Y/uhmI1v4+Rv2U7wUuuJP2ga/RnDVziMAQgnFiMS5fM28thFAJ06PHgldpkCaasokm8SLdDJ1wH1RL9CUvzorKGy2jXbYMVst7VuO4/KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7435
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-paź-15 11:12:07 +0200]:
> We shouldn't attempt to auto-provision VFs once we allow other
> provisioning methods. Make the code aware of the new condition.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c    | 16 +++++++++-
>  .../gpu/drm/xe/xe_sriov_pf_provision_types.h  | 32 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  4 +++
>  3 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index c24803312231..de7d925a110d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -9,6 +9,14 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_provision.h"
> +#include "xe_sriov_pf_provision_types.h"
> +
> +static bool pf_auto_provisioning_mode(struct xe_device *xe)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	return xe->sriov.pf.provision.mode == XE_SRIOV_PROVISIONING_MODE_AUTO;
> +}
>  
>  static int pf_needs_provisioning(struct xe_gt *gt, unsigned int num_vfs)
>  {
> @@ -30,7 +38,7 @@ static int pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  
>  	for_each_gt(gt, xe, id) {
>  		if (!pf_needs_provisioning(gt, num_vfs))
> -			continue;
> +			return -EUCLEAN;
>  		err = xe_gt_sriov_pf_config_set_fair(gt, VFID(1), num_vfs);
>  		result = result ?: err;
>  	}
> @@ -62,6 +70,9 @@ int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> +	if (!pf_auto_provisioning_mode(xe))
> +		return 0;
> +
>  	return pf_provision_vfs(xe, num_vfs);
>  }
>  
> @@ -78,6 +89,9 @@ int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs)
>  {
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> +	if (!pf_auto_provisioning_mode(xe))
> +		return 0;
> +
>  	pf_unprovision_vfs(xe, num_vfs);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
> new file mode 100644
> index 000000000000..f72bc5db3a60
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision_types.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_PROVISION_TYPES_H_
> +#define _XE_SRIOV_PF_PROVISION_TYPES_H_
> +
> +#include <linux/build_bug.h>
> +
> +/**
> + * enum xe_sriov_provisioning_mode - SR-IOV provisioning mode.
> + *
> + * @XE_SRIOV_PROVISIONING_MODE_AUTO: VFs are provisioned during VFs enabling.
> + *                                   Any allocated resources to the VFs will be
> + *                                   automatically released when disabling VFs.
> + *                                   This is a default mode.
> + */
> +enum xe_sriov_provisioning_mode {
> +	XE_SRIOV_PROVISIONING_MODE_AUTO,
> +};
> +static_assert(XE_SRIOV_PROVISIONING_MODE_AUTO == 0);
> +
> +/**
> + * struct xe_sriov_pf_provision - Data used by the PF provisioning.
> + */
> +struct xe_sriov_pf_provision {
> +	/** @mode: selected provisioning mode. */
> +	enum xe_sriov_provisioning_mode mode;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 956a88f9f213..c753cd59aed2 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +#include "xe_sriov_pf_provision_types.h"
>  #include "xe_sriov_pf_service_types.h"
>  
>  /**
> @@ -35,6 +36,9 @@ struct xe_device_pf {
>  	/** @master_lock: protects all VFs configurations across GTs */
>  	struct mutex master_lock;
>  
> +	/** @provision: device level provisioning data. */
> +	struct xe_sriov_pf_provision provision;
> +
>  	/** @service: device level service data. */
>  	struct xe_sriov_pf_service service;

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.47.1
> 

-- 
