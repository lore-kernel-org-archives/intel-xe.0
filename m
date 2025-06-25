Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CDBC7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 20:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A2C10E239;
	Wed, 25 Jun 2025 20:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eocrO8IX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B428E10E00D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 20:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750882156; x=1782418156;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gaeWitSVnfWt50oNUZdDeL4sClswG6WpRCSaVeKeAnc=;
 b=eocrO8IXyiBnMvgVu/accOabY2O9MGTR2VHi8hnt3IxfJqbLtVYwaaxH
 oj5irTaxAyv/M8zn6kjp+BCFLuB/roqvorTQObpszZdLrhVkz2E4QoLCv
 +3XJPDHChxV1sBDrnbwwPJqygEj7+jDSvZRVgD3TTh5Jj5qu3YW32sceA
 BJPlwLcy53PS84f6Cht5VmO3MIODmP4zy8IOhC7Fm/ugAd/b9rIiuR5ec
 N/Z4mRaIZhqX80Kg0WmEZAgD894moljOfZavlv3oPdk8cNe1VUyqCWi6T
 jKeZLaMeqj5Aacz48VtrSItSHmoL4OXvDH2HoBAKUnbPVXSWCKI9pDdrV w==;
X-CSE-ConnectionGUID: de0MGI0BRg+Iw7eWPvJoGg==
X-CSE-MsgGUID: 2xqIy60DQdKASFkUbkFO2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53233459"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="53233459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:09:15 -0700
X-CSE-ConnectionGUID: FNrPbKpPR9a3UYyg72j2uw==
X-CSE-MsgGUID: 1zR1P+A0R/u9TxpJLcxSuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="156878584"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 13:09:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:09:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 13:09:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.60)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:09:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hj94nZznm+BSMdo397BAvncccKNS+FDpQjQ/+0nNFsPQQVkSlLzPqjYnmEFmafGDYNpL2zqjNhbVQjzMiePwpxttMNCV3W9+iBFn7HMNo7rcE6q2TKjXlJZgDDLjWw/GXHgy+NvabmFxdC3E/NuMtQYHqu5bzN9p//37ok7T2oTSgAKc9nsdRfocFl5fUYljZB0GAlBfC7SFjhYGuA4iACYKQ0cojx5OHHTuuwvkqBGbDBQZomK+g7BaJTwYqe+RVz2rAJJI7N2NFY5QUPO3a5D03O0HEB75HPs1dLM35aZGPDpUKFMjlRGnhsSmCYtBZcDDYNJC89aOeON+2j8+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGh6Fo/dAb1b5pFE44NO82sBHEid0a9DnzTRYf3iRIM=;
 b=cafwY6GRfK2yGB27UWi/CREu48wpj24YXRCm9uHR7iNLP8bAS/0NMz/xl7A4sUol+xzbqKSspO+0KAu8I3bCfxAZajk2RlhfC7qDw9NNP3nFMWKhCwjeScA+j4HT/S2g/0y5Myv7yom83PbGMeuX07UtTuhk0XTUUr8XDK1Kd8DbIA/f0tloyPxhGE0lHNvOZNYefqIJlmIVeBjQTJjnsMBHMMq1lCdcaXhI4oiPWNcTuvC/6JgCjRPFbJgSGvmASdT3Elz+rST4uxFlfYkP2qDWYzn7aM6sgcONqk0j9+7WQd0qf+0O7sdyITkh/6eOQmsBeyaKNV0eiIe/YetsCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by CO1PR11MB5042.namprd11.prod.outlook.com
 (2603:10b6:303:99::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 20:08:59 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::7ac3:745d:bc52:83e8]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::7ac3:745d:bc52:83e8%4]) with mapi id 15.20.8835.023; Wed, 25 Jun 2025
 20:08:59 +0000
Date: Wed, 25 Jun 2025 13:08:56 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe: Move Wa_15015404425 to use the new
 EX_DEVICE_WA macro
Message-ID: <aFxXWMZfp-_KpmoS@msatwood-mobl>
References: <20250625193340.38971-1-matthew.s.atwood@intel.com>
 <20250625193340.38971-4-matthew.s.atwood@intel.com>
 <20250625195716.GG4868@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250625195716.GG4868@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:303:8d::6) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|CO1PR11MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6f2189-6e89-4eb7-da48-08ddb4241eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0VHS1N4NlVXaGsyWHlFWDQycG5XRGlkbE9RR1BMdnNZaW9HNGxWQzBmbGxR?=
 =?utf-8?B?SXQ2aXJhQzc5SE0rVUIrbXpwVmljU2hHSXlFdWlkVWZsUjVNT1M1VzNXZ2dO?=
 =?utf-8?B?c0U2YW4xRWJpTlg2YVk0bVo0VmViWERiUlpwdnFUV05CRmdRT0hBRGwxRkdG?=
 =?utf-8?B?TUpDL0lNL2lIMkNML2tneWN0RGZhakh0c2F5V1h4WXRMUnhFRGZyTktGY2ZG?=
 =?utf-8?B?QnZ6dVlWYTk3aDdwQ2c3MkhvUFgwQW0rMlVNQjFrYUZyMjFTUFNPRm10b0FM?=
 =?utf-8?B?V3Q3UzZPWHJEbTVydG5CMTBEZGJiRkpRYjd1dkZQYnI1QVdvSlJXSG90UWZZ?=
 =?utf-8?B?Y1BCNGUydnhISmZNc29RZzJheUxpSEJ0YTV6N0s0Q0hLR25peW40NW04Mm1q?=
 =?utf-8?B?eXFFaFE0by9FUGtSMTZLeW9JQ2gzWkhxZG55R3ZmbTdjam1lVk12dTFNNWpv?=
 =?utf-8?B?RGtKaVlwcm9pODlramw2WWhhUG1mYnhoanZrcC9nVTBiMS8wR0l5MnFTSi82?=
 =?utf-8?B?WW9SQ3RsQjlGYUlCTFMwVHR4ZlZOYlVhbS9IWU9pQzNmMXZxdTNmRXVpa3gw?=
 =?utf-8?B?QzVGLzVuM3pVMm43NWZqU3JaYW1jQ28rejFtUld5anRxcmhSQWd3RlZiQ3dJ?=
 =?utf-8?B?YThzbDZsU1hvNTd0K2M5OE5YQ2NHS1BOQnlDM3JqY1IxY0pxalQ1R3dkRWxL?=
 =?utf-8?B?ZythRUV2K2Q1SEFqb0daZFpudjV2cDZma05TcW9TYU9pbTk0N1d4YlJFbU9V?=
 =?utf-8?B?UmdlSHI3YytRL3ZUK1NBQXJLRDN3VGIrV2RiTE8wRzNMclJ0bWUzc1lBL2g1?=
 =?utf-8?B?c293MCtPNll1d21iN0FHZWlZSW50Ly9BeE5Wak5kRXFoQUhubUVMZEtXS2Nt?=
 =?utf-8?B?b3drSHlVampJUkR2eXFZemxwTFpnUDM2WHRjelRjaDNaczFFK3RzZUNyVWdt?=
 =?utf-8?B?NzdqMGE3VllGWTNhOUZkWkUxSlNhdmkvS1dBNnZhZkJ2MEs1NVExdWhPbHJU?=
 =?utf-8?B?a0pwUURXUVQxOG5KRGRFR21yTmhVTlRTZW84TkZhSXE0bVc4V0wvSzh1NWtV?=
 =?utf-8?B?QmhtZXZydXZLcVlYWUE0UitoOVF2MTRGaVArS0MvYzNrSk80NWVEWDV2VzAz?=
 =?utf-8?B?eXY3aE9ycGVaT3kyMmJtc0dNd3RtQmpZYjlQVG5pUVUrdjNIS01Sc0w0ZlZx?=
 =?utf-8?B?eEYyaUFJVDk5aDcwOHI5SG5WbUIwZ0lNNkdSWXovOURGK1BZNGRIN0lBMTFF?=
 =?utf-8?B?WTZ1YmFFTUU5c1I0NzBOZ3dGOFBwbzBmWEF3emtSUDh4VVBBSVlFMllMUUg3?=
 =?utf-8?B?NDRkZ1JKNGg2OHB4V0k5bWRSRmVsRTBZL09OVnBlRmt2T0ZPaWxyWDdhL2dr?=
 =?utf-8?B?OUlNMmNjMlBIMko0ckdUNTZHanF5SExCMi84VjN1dDRGSDRJdFdDb3VjZDdN?=
 =?utf-8?B?OXZjUmFuZnRrQUlIbXRyTjhveVhCTlhZMkwwTnpYa1FMK3R2aGMxcnJZQ2tt?=
 =?utf-8?B?eUhlNDcwR240MGxEbnh3cVBGcTIwV05UR1pkMWJVRkVhdGZkeHdUK2Y3UkI4?=
 =?utf-8?B?TmUxcXZOOVFNNWdoeS8vQXNOZ1RITjhDejJJMU41WExPN1JZRk5ZRTVHcGNU?=
 =?utf-8?B?bWJTakF0QUh0ODQ4Q3B3N1o0SGNHT1BQZzJyWGtiNFpHQ1p5cjFNSUhDNHVP?=
 =?utf-8?B?ZmU4OGFGWWxuMVpiblFHdWtOUXB5UDdFVFZIZ214Tlc4ZmJEMVYvQzVkN2ZY?=
 =?utf-8?B?MHhVN2dOejFxZ3kxbUJkc3oyN3RTSUlQVzM4SUo1VWllVmNGWXJmU0VsdlZB?=
 =?utf-8?B?alhYVTlZdEdqdjRodVJDTk1MTXFITnBTUGtLM1FJdHNxV2hpSENSNk8wQnZL?=
 =?utf-8?B?aXhQQU8wSldrOUtGT3FXSk85STZFZVRzTlhTOEpxNmRBTnUyRXlIVE1KSjlN?=
 =?utf-8?Q?xgHvvSFwTLI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWxDekJhV2lNTldxdzByZDl3YVJETTRYQnRRaGVhaEtHRmFGTkwzUlZrRWNk?=
 =?utf-8?B?ck91S0JJSVovS2J6a3dxc1lrSUZEdVo4SEQzMXVlWEoydzFvSlFhUW54aU5z?=
 =?utf-8?B?MEhaSEgxQXFycHdvWHNyTC91T1dOUkszSEc3V1pvMitNdXRJVEhFUHJseTVh?=
 =?utf-8?B?Vm9BbnlYVUZjQ3o0SUlOYmN0UkhFYWhtVHZ6MzRpc01zWWZEbnh1dmVHQ09y?=
 =?utf-8?B?MWFmY293dG44TWpBbVRncnRvUXFUK2tTWC9ucmRXR2xOeGlxNVVjeUwzem9H?=
 =?utf-8?B?THA4bW9Yb095em5xdjU1Snc0b2NqR1ZqWmpFc1N1U2RueDlXclU1OWNBQkdS?=
 =?utf-8?B?bm1FaHlpQTNVVWl6bVhDNlZ2TXFhNDNyMlk1dVVJdnZWN0RtSEFwTGZnRTVY?=
 =?utf-8?B?WWM4M3A1bnhnN3Ntd0dHdzd2TUlBSjFLd2h0amVpRzFyV1dBTktqekNpTnVS?=
 =?utf-8?B?cXE0RGVxRjdjSFg5L3RrRmRQOXA0N3JFMzU0SW9DTDdlZTQ1alVWNlFRN0JZ?=
 =?utf-8?B?alpqRnBxT1R3aGkvQzhLV016ZGF0R1FaWC9GYjUwT0VDQVorWWRidmdiYWd4?=
 =?utf-8?B?QW4ydm91enR0cVBQMGh0VFBrZWo0MjV5VWFBc2FJVlFuSFU5QTN1YUdNVTNn?=
 =?utf-8?B?OEJzcURycys0cjFyUUN3bzh3eHErNVY5bVlGL1FubWcwQUU4TU5OQThUaHdF?=
 =?utf-8?B?NUswSUdhYlhSWGtEYXBGMVNuVnpFcnFTWmVHajQzdm92ZHBLSzhvdFRnNmhx?=
 =?utf-8?B?cUNJWGxicFBrR29FN0R2NkhaRzdQSDVDUzZ5SW5XbDFtVGRJRVpWTUNXVldZ?=
 =?utf-8?B?c0FWeVJwSlB3NU1rN2dUd0ZCT2tMelRkVWFOSEJjY3drckQ0dFJpc0lXeW94?=
 =?utf-8?B?eGZXSFNOd1c0SkIvTC9rUyt1SGFlWDhXaUx4UmhNTGZYOHdjdTRxdy91dU1Q?=
 =?utf-8?B?TGZXc1ZiM3BxanV0V2toVVNodTVOQ3NndGRHSThJZW9RM2g2WGhBZm1KNFhY?=
 =?utf-8?B?bk9HbWYxbmpOZ2x3ZXVVeE0zUGRTVWNtWmVpUGlESXUyUCs0bkpQQ2ZVVVpy?=
 =?utf-8?B?bkw5Uk4zQXhlQ2ErQzd5UUFqdWhZZVFmK0phaGs1ZUd3aHlhQTY1VkNZS0tV?=
 =?utf-8?B?d2RIYi9WSVhUQjQyM0FxdlA3OXkrUk1teVBkT1dab2x1T0pmZHF4UDArZHZq?=
 =?utf-8?B?VHNkanlHMG1YTWNHd0dlb2g5OWtrRFpFNGY0em92Z0FoaGxWVW91aUhON2pX?=
 =?utf-8?B?VzYxRXJlR3Q1VGE2YzVXYzA2azQ0dlJZSWxrT3RiZ09qakQvVy95ZzBmTEQ5?=
 =?utf-8?B?Szc5NEsvSGFtRDFmY0NPU3JaVGZDVDh3OVhHTUtXcnNRWDV2b3VwZU1jbWhC?=
 =?utf-8?B?UFZzam1MNEp1dEYzRXhqdGcyRHdFS1FVRWZCeHI3alpKdEE3dnMwV3N6eThG?=
 =?utf-8?B?Q1EwRWY2ZytSSDhrdGs1blVZR3J3WUJXQTQ1dXBoVzJSREIxRDcwTXdWblFu?=
 =?utf-8?B?LzdrSHBLVVlEQ2l1OHNuL1piQk1VT2hlRWhGdE02VDJDalV3cmdqd0ROZ2FK?=
 =?utf-8?B?ZGQvbEs2eVZ4WmU4aTFKVkQyVTBRdlRhNHBIaHRkREdtcW5DKzJMTEVHblZm?=
 =?utf-8?B?NHgzZWZUc0FCUDhnczJTUklYUTQ5OUorcHQ1b2pnSXE4dkdnOWhHa0hsRUhv?=
 =?utf-8?B?YnBQSTVkUjhlV1NoUFRML1lEM3F2WUEycEV4MHEwSVErYTNrZmJINGNrcS9P?=
 =?utf-8?B?bE5QZGlCMEd1Z3p5UkhSSDNyTXIvTDF2bTlZSEk2K0pUUE5IZVIxNytKS3Mz?=
 =?utf-8?B?UXMvc3lTUmU3L3lTUGdQQTBjTTQvazZvMnRiWll2Q3kvcXJndjhMbENoRGhM?=
 =?utf-8?B?ZStENUpNa2k1S0tsUmRxU0dXYWltakZSVW9iaVpvd0h5bVI2VGRNMGdHRWdI?=
 =?utf-8?B?N0dyN1A2ZlQ5WEErLzgyTXZKWTZYZkVtKzQ3eWNLbGpQeTlxZ2NqN3FlcUdl?=
 =?utf-8?B?a1pjcTROSnA2SjRXSUxZcU0wOHZwSXNNWnI3RnNKTzhiK3ZRWlczY0FxbUMr?=
 =?utf-8?B?YlBJZnNTOEdBcmU3UmhpbURIcTNiSWxYM2IxRVFlZWRGSmJLWlRWenY0RWJh?=
 =?utf-8?B?R0UvTlYxS1NTVFUvNHhTcFBnM0pPc1ZreS9iMkJ5U0puUmJtUUY1M29yTXY5?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6f2189-6e89-4eb7-da48-08ddb4241eff
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:08:59.0229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KbJgiFHHGUjilMSYV5d7pNzx61hWNC6D4mUnkX+9DUS08+Gp0+//CMFaiXrCPPlIp//MrhhRussFJZ1giz8Mk5GfjIv2LRguN8ZKshOGQ+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
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

On Wed, Jun 25, 2025 at 12:57:16PM -0700, Matt Roper wrote:
> On Wed, Jun 25, 2025 at 12:33:38PM -0700, Matt Atwood wrote:
> > Move Wa_15015404425 to use the new implemented OOB macro XE_DEVICE_WA()
> > 
> > v2: rename from SoC to Device
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
> >  drivers/gpu/drm/xe/xe_mmio.c              | 10 +++++-----
> >  2 files changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > index e69de29bb2d1..b7d12ea4d65c 100644
> > --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > @@ -0,0 +1 @@
> > +15015404425     PLATFORM(LUNARLAKE)
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 7357458bc0d2..4990b3a47afd 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -22,6 +22,9 @@
> >  #include "xe_macros.h"
> >  #include "xe_sriov.h"
> >  #include "xe_trace.h"
> > +#include "xe_wa.h"
> > +
> > +#include "generated/xe_soc_wa_oob.h"
> 
> Isn't this the wrong header name?
Yes
> 
> >  
> >  static void tiles_fini(void *arg)
> >  {
> > @@ -163,9 +166,6 @@ static void mmio_flush_pending_writes(struct xe_mmio *mmio)
> >  #define DUMMY_REG_OFFSET	0x130030
> >  	int i;
> >  
> > -	if (mmio->tile->xe->info.platform != XE_LUNARLAKE)
> > -		return;
> > -
> >  	/* 4 dummy writes */
> >  	for (i = 0; i < 4; i++)
> >  		writel(0, mmio->regs + DUMMY_REG_OFFSET);
> > @@ -176,8 +176,8 @@ u8 xe_mmio_read8(struct xe_mmio *mmio, struct xe_reg reg)
> >  	u32 addr = xe_mmio_adjusted_addr(mmio, reg.addr);
> >  	u8 val;
> >  
> > -	/* Wa_15015404425 */
> > -	mmio_flush_pending_writes(mmio);
> > +	if (XE_DEVICE_WA(mmio->tile->xe, 15015404425))
> > +		mmio_flush_pending_writes(mmio);
> 
> Moving the check out of the function to the callsite seems fine to me,
> but we need to do it at all the callsites, not just read8.
> 
> Also, you have a typo in the patch subject line (s/EX/XE/).
> 
> 
> Matt
> 
> >  
> >  	val = readb(mmio->regs + addr);
> >  	trace_xe_reg_rw(mmio, false, addr, val, sizeof(val));
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
