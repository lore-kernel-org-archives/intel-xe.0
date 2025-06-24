Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C56C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:21:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0637310E55C;
	Tue, 24 Jun 2025 09:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TQDV/S7p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30C810E55C
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750756910; x=1782292910;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=UxIuoSZLQSJ5JPcPzmmueWOUXpI3IxJbp3NdxN/DtTg=;
 b=TQDV/S7pz8nIrcyxfd3CXpRP3AIUWlbrqrTh/jq7KD0xWjCiIayGvLnz
 9bsFMxC8AIpaIwLStgcNOv0Ka0jNyBdblItrGHO6+BEYUpIGU0+ELuXSB
 85/P8OtSZP3FF5eC+A4JBseDFYGU5YzAz8eBB3NJyxY5MqMjFgrJxUVSg
 KcNQSADX3zqJkseXdi7JmwmX1csBhPJ8JQbiSDoKaXQGAqOXTRBd6mG+F
 wgKbeipKUwlatP2usfgciMQrONEinNvoOTv/kEq1HEWdx25itRbhJhdn0
 jDrSPoLPlIF0NjEBZeFkOWrTHH6tUSW1u6tHQVhR1YpfoCKe6Rf0JWRz6 w==;
X-CSE-ConnectionGUID: Z0eJu41dTs6WtINejoFMvA==
X-CSE-MsgGUID: oXL9UjyNTBaIfw4Q6M0C7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52859959"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208,217";a="52859959"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:21:50 -0700
X-CSE-ConnectionGUID: WhnZ5mwRTwGJP/WzzFaCOA==
X-CSE-MsgGUID: LNVjYjF+R3upM6erJjPBQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
 d="scan'208,217";a="155890374"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:21:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:21:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:21:49 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.60) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:21:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6Y/FGFN8N1bsUM0txxk8kVGOPt3GYjdUbvs7D1xPwDwlDTOXoE03rJCWsQGXsRVtvgS/VFf+3WSrEHkBT87w3QMl5aBaJa0XlxCFKCw2U/dVlE1TfHZrN1WhnY2KKFEE374f4mgMdggSxoAsXgX0mYlVbykVgkDiUrOi/OtRMpNdJQDdJeJMYrYVVVtKWAeGx48Ce5qHWK8Ad4OR/u185YGqBtbQw4DufWuF68YkTmQe8TQ7ItvPYxmdQJgZlRF3/Lvyr15j//KlfREPtGJf3WOJUi2/FmvMpoJeRkx7t943o5URD/CH/BEnFEqaUwpWAuIkkRkaTQCnk1I0a0IxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMYt1qQXqZW4T1q09lnxwgV4kB0TrrNxVbSB+l7mPYE=;
 b=Ebue/lKFqEy5K5O094JA7+SpXhZiuWi3tH4/QCnnEUUuyNxFEfcA2CFoOHGPs9yaqv9SnacdSvNCtYKmBjvVN1pndydRGlte9rhJlTg7LpRfkp6pz9wlscrHAGnCe3VdaiVbBGf9ZsD0ibSPd3hn0yguuMd1BoC6mjJKDILorsUiiSkSS/rfAmoGe2f03L/OqgUKX2Z5ZbHMc3L1WN10e6inJ9d0vqKQirhwe7e2hFY0n6oW8TJO83OkDabV6lp+BDM4ko+5jxnCBkzNGXnEQ2jjHGv6I9fVuK5w4Z9oIFk0RQY8vo7n08dhzcMweyycU2cp7SoiQ72wk3m7X50dog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 09:21:46 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:21:46 +0000
Content-Type: multipart/alternative;
 boundary="------------S6upyOhOcQjobriXvVEuA4Jb"
Message-ID: <850d69fe-2306-40fc-8f18-bb038af87bb8@intel.com>
Date: Tue, 24 Jun 2025 14:51:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] drm/xe/vf: Create contexts for CCS read write
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20250619080459.27731-1-satyanarayana.k.v.p@intel.com>
 <20250619080459.27731-2-satyanarayana.k.v.p@intel.com>
 <aFWKTx9PVgs4v/ZX@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aFWKTx9PVgs4v/ZX@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MA0PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::15) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 60248237-b5c9-467a-55d0-08ddb3008a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0hoQ3pYYXpjejFDRk1EdXRsOVJ6eW9XQkZLUkJUb2hWYnl2YnlZSjM2SHc2?=
 =?utf-8?B?b3B4YkNUVktKVW9VUFJBa3haSVVyWWNHNEl2TWdtNnNTUzRSV1hCRnZDalhR?=
 =?utf-8?B?ZElRTmdNa1Y0UUdLRWg1UzVCS1BGYWdETCtzb093UU1SQ1ExTzlZbHdGN2ht?=
 =?utf-8?B?enpUdDlWVllMb1VLU1l5Zy9oRWplNWxrdWtHbmJRaFRqZnNsaDUvK3I3aGFU?=
 =?utf-8?B?Mk5kZWNMQ25qelRsNU5ob1hDZ25oaWVZdlpmYVdJNy9LNkd5Z0NzcmVERkJN?=
 =?utf-8?B?YkRmWmdpVWk0TldmbG1vT3o1UVpzQVJvS1FxYnFLejZqMGpPdFhBUjZ6REhx?=
 =?utf-8?B?MUxzcUFwUlRPVWM3Ui9BQk5wSDFqZnErdVdtR1RtbGdESUNqdTZwTmtjTVEr?=
 =?utf-8?B?enRTdGNvdXJTSG5ZaXJwNENsTm9KU01FUVNKOWtoSGRDbmlUNUFhSko0enRX?=
 =?utf-8?B?NVRoWXF3V2RQeHJaeFQ4bFRhR0ZHSk1sb2RnR3RqVFBBYUtjcFFCdjhVM0dQ?=
 =?utf-8?B?cXJ0OWhyU3FmaUhJQnlCWnRpWHB6VGF1RUovY25WVG9qWk10dEtQQXdOSFA3?=
 =?utf-8?B?Nll1Z2UwQnhMblBPcmQvQS9DOHBjQWhoemxuMEU1OHNmY0I0U2Zkc1BrT21a?=
 =?utf-8?B?RlNFTWplTjRDaVVFM1Ird0Vtd21aSkMvL1ZOM2M1cTNJV2lENG5KbmlYSE9j?=
 =?utf-8?B?bnNKYVpXcTNCa3pGMkNaTFY2Z1pveXNTVFFDL2ZmOVVqbUJFRnRTTCtYbVZu?=
 =?utf-8?B?VjYwS1FPMDNyMmt6U2VUU2NDOWI1VC92TDRPcTZDMjJNQWN0bzRmUWdWRnJT?=
 =?utf-8?B?d3IzaTlnS1Z0VXlrbVhQbldaMFFQRDFZTEVnNTFsZmlwY1N4UlBuczhSOTVn?=
 =?utf-8?B?S3k2UzVsZkhRZmtuWVlrTTVjeUlFbTZMZUJSSEJvckRKWDZib0lBd1BiWEFV?=
 =?utf-8?B?dmtHM1RudVFkUkdCY3FYbVRGWkhQQnBKZWM3NXdQelRNQldwMm1NSGtaZXVD?=
 =?utf-8?B?TFBmcktmOEgxUnJRb25vWnBtTDVpU2t6QkFWOTM4QUZ0d05veVQyNUpsZ3lv?=
 =?utf-8?B?bE45WURHL29aNjhLZTFXbFdZSHF2ZHJub3JTYkRWZVRkcWFJd29EQmdDMzBj?=
 =?utf-8?B?MFRoZllsZGh5emVpZmZoeUkwODcyS2JnUHRBcHc1Y0hXa3FiTHhzaFgwV2wy?=
 =?utf-8?B?RVAzZHNvS0xCMVEwdUNsVkxOTTgzdlhORjlIb05VNElqTHcrc1VjeU05SVA0?=
 =?utf-8?B?THBKY3NUVm9MSk5TbCtVeWQyWlZDYVlsQ0ZyVldESmt0dDFvbXB6N0lLVCt1?=
 =?utf-8?B?K2xNazkrTmlsa0RLa0p6V3l0c1R0NjAyVlFZU21kUmdBUnhqRTJ2NDY5OTB5?=
 =?utf-8?B?MVZ4MFdJZkExMkJaUFNkSHp2QUxxSytaUllXL1NLUG1FczdvVkRiYmlTU2lF?=
 =?utf-8?B?TDVubWlLTWNlejZEdGtzeTBlSE5QWTgvVXZpOGtpcEllZ3VnRUw5cHQ0NXVB?=
 =?utf-8?B?MHprUDlyMGozbE9PREZ3TkVZQWp3NEIzdHpEcDBLY1pOdlRQenpqS2t2cE51?=
 =?utf-8?B?Z3lub0YyNXd3VXg1TVNHV000MDJpTXdoQ3VpcUJxeExseFJsd1ZJZ1pkQUFx?=
 =?utf-8?B?czYzZmlxTkZaZTZod0VwR3BjZCs5blRQK1ZpelJFL0MzMGlHY3FmdkYyVFBS?=
 =?utf-8?B?VzluRHdMaXJXVjVoek1MNUQ5R3hxUmsrZWxsNHQyS29JSUs4aDlUS0c2QlhF?=
 =?utf-8?B?TC85T1ZTOHZkVG5wa1R4Y3IySWgwaFhrQmpuSjYzYkFIRkxEUlpKb09SVUJ6?=
 =?utf-8?B?Q0J2UUpianpKUEo2ZzdqaVJkS3QybDBVZjB1OFQrMjVjbWFtU3kzaC83OG0y?=
 =?utf-8?B?TU41QnhqcHdUbEZxbEZydWJkeWZqWEdBcGtEd0NpVlYybFYyODdkSXJWTGFM?=
 =?utf-8?Q?NmeSzsgdfgo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1BURlBFRnFoL2ZOeThkWWdvQzRGS3BFRE5KMkg4elJMZW01aFJZcW5PU203?=
 =?utf-8?B?UFRhYkRuYTVnRjlzR1piSWJCa3gySjZ2cDlEOWU5MFFBU2JLZkhMYkR5VStL?=
 =?utf-8?B?cXh1QVdKNHQ4YTVCdXh5NXRRRmdsK2dtM0YrZkMzWWE4cHVSL3VxQWFsTmFz?=
 =?utf-8?B?bVcxN0VxcEJnS1psQ1FNWlUvT1hzeVA0dEtZanFMUmdOcWdiWUJSR254M1cz?=
 =?utf-8?B?R1g4ZlNWMDVrcUtadWJZMTJybHFiaUpmOXpvVjBMS212MzNHTHFHNy9GWXpn?=
 =?utf-8?B?MkpUL2VaTnpSdjB4MmU0aDZTV0pWNU82ZFJFbXNLc1gydDAvNmJSSGg4RnVY?=
 =?utf-8?B?UXByNThBSFpabVQyMTk1RE56QzlyM0xvempaY0VrSW0wYVBmMFJiVDlOaDda?=
 =?utf-8?B?bzVnSWRsNUtzOVArdnlDc1VVcndKcStQWENzZWhTTGV1aHRveHhsQ0dKcm9O?=
 =?utf-8?B?Sk1kV0lXNEY4WndkMkExUkE3STB6ZHROdnI1cjFURmZsZ3JRRnErTWhYand1?=
 =?utf-8?B?dzhRVWJsZ3F0V20wZjJXQ0MzSzdDbG9HRmhPYmJtcGVvRlRLODd0K0VIT2F6?=
 =?utf-8?B?cFpiaTQwbG9RM2JWc3FTUFhjdUlUQVBaWWUwTmNKWjhmZWRyNWZrdE9ZQ1Q1?=
 =?utf-8?B?S2xmSEN6Sm0zUG04cWlmVWNPdVlVU1FyZVFCUzJhSlJ1V0JNQjFTdGNFSzdJ?=
 =?utf-8?B?VWptZ1J0SlVlLzZjb3R0MU1IcC9IamF2OWxaclg1Z280SWhRdkNnRlZBUVZX?=
 =?utf-8?B?ZFVnbnRsdjN2SEkvdkxFTVBuY2dHbnF0bnB2NjZVVzN3L2NNRmthUnFuek9z?=
 =?utf-8?B?NXhDWnBpNU5CRG9YYzkzNHY2clZPS1pScExDWFQ1VENEcEQ5NGozUmM5UE9u?=
 =?utf-8?B?T1pLTFRaMkd2TW5jZVZSS0VYMVJUa2d1SDlaMGZQdHk3TTJxSitQSHZRUFk0?=
 =?utf-8?B?eHUyL3lxaTUyNERKTGMvdG9BL0E0OUFBRTFlTFViNk1iYVpKczFtOVZTVzE2?=
 =?utf-8?B?T283eFBMYm9JRlhPcFZDOWI5M3Y5Ni96NUFVUk5GTjBaNVJYUjBrMFBzK3dH?=
 =?utf-8?B?dVlkSVExYUNncmhHcTAvVDBZNlF1aWdWQkhHZVdIQ2hJR2MxdGN0d2ZSMTIw?=
 =?utf-8?B?UkpGeWE5cGtJWGRESGVQNTlSSVFBblZ6cHNOUnZxSDBHSWxYd01oRkNXUGZD?=
 =?utf-8?B?WEZpQzZsNUc2TURKUk00ejNDZjlMR2NrMDBNcEVzSURqNHNMTDhxaXBGZU9O?=
 =?utf-8?B?T0ljN0IyYkJINzI2Tk04TTFzYWhCdGNBNGtNVk1QM0hBLzJuNmlzc0tRcWJz?=
 =?utf-8?B?ZjhKOE9GelAyV0Q1VlFDcmRwVTlBb2pyMU1BMStkOG13em1vNWt3bFFrYm5a?=
 =?utf-8?B?Z1czMEhRQUtpS3ZBM3JtWkduSExlY1lpVUhvdzRhSHhBMm15K1ZiaVJXMHNu?=
 =?utf-8?B?NDBRa3czZm5OWERLcFU4eFJadUZtU01KVERuVXYwNWFQSDJLMFQ5ZGxXdWNC?=
 =?utf-8?B?cXZvQXdseDhoSjhGWUliVjJjWlBNYXF4YVlpTmJBWXk1YWo5aE9OYlhTaTR2?=
 =?utf-8?B?eXVVUTJ2SlRPVE9rVnZWMlBGU0Fwek1QSEMyYnVvTTNuYVg3WWVNK2JLS0Nm?=
 =?utf-8?B?K2taaXdISVBLT0tXSll2YUNjc3RoODd2WFVIdC81R2JJOFBGNkw1b1duTVpJ?=
 =?utf-8?B?WGpnSjd6U2ZtcnlieDhIV1kzZ2hTNEVvY3dkc2s2RHhJK0IvdkxvRUxvSndr?=
 =?utf-8?B?amZZOFN1UEo1MmlxcXd0R2puMDU5R0RHdFlCNnREMGxiNmhXM0U0M2lTWFUx?=
 =?utf-8?B?bHBRVnQrMlJyYTRmYXQrMVMyYlB6Z0g1aHZPeTViSHZ0ME11bWdTeVYzRlZj?=
 =?utf-8?B?SUNTOHozTGdXamJCRDRRN2xIOFRrTXZuRkdXN0gvbVd1Q3lJSlA2UENCZG5Z?=
 =?utf-8?B?Z3crckMzRzBnZnRzWDBIeVhUbDIwYTR2S2M0clRaK2p4UHQwWUZkZ042MTha?=
 =?utf-8?B?SnloMm1JZk9wcnlMQnZJc1h6OWw5OUVraWZ3cms1UVVvSXgwdVBTVmNDOG1k?=
 =?utf-8?B?emNmUXdKZ1JEK3lCWHYwaVdJc0JQZVBOZXNhZlkwTUwxU3lKWHdsZVBUK1pH?=
 =?utf-8?B?WDJjZUF5aXZrUWZ2TS9SODhJT0dLS09EajJsbGF2M3B3a0dMYlRRQ2p1dkow?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60248237-b5c9-467a-55d0-08ddb3008a3f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:21:46.2113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: de5CzzDGZOYVdTe99Dy6cWfeLUVahCvpd3l1nRs4vptjOE8uRse49WywO3V0u5jK0RK+OYEii730D/iACQRj82A6MHyqrw96DgH9ECnHpm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
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

--------------S6upyOhOcQjobriXvVEuA4Jb
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi.

On 20-06-2025 21:50, Matthew Brost wrote:
> On Thu, Jun 19, 2025 at 01:34:57PM +0530, Satyanarayana K V P wrote:
>> Create two LRCs to handle CCS meta data read / write from CCS pool in the
>> VM. Read context is used to hold GPU instructions to be executed at save
>> time and write context is used to hold GPU instructions to be executed at
>> the restore time.
>>
>> Allocate batch buffer pool using suballocator for both read and write
>> contexts.
>>
>> Migration framework is reused to create LRCAs for read and write.
>>
>> Signed-off-by: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
>> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Michał Winiarski<michal.winiarski@intel.com>
>> ---
>> Cc: Tomasz Lis<tomasz.lis@intel.com>
>> Cc: Matthew Auld<matthew.auld@intel.com>
>>
>> V7 -> V8:
>> - None.
>>
>> V6 -> V7:
>> - Fixed review comments (Michal Wajdeczko & Matthew Brost).
>>
>> V5 -> V6:
>> - Added id field in the xe_tile_vf_ccs structure for self identification.
>>
>> V4 -> V5:
>> - Modified read/write contexts to enums from #defines (Matthew Brost).
>> - The CCS BB pool size is calculated based on the system memory size (Michal
>> Wajdeczko & Matthew Brost).
>>
>> V3 -> V4:
>> - Fixed issues reported by patchworks.
>>
>> V2 -> V3:
>> - Added new variable which denotes the initialization of contexts.
>>
>> V1 -> V2:
>> - Fixed review comments.
>> ---
>>   drivers/gpu/drm/xe/Makefile                |   1 +
>>   drivers/gpu/drm/xe/xe_device.c             |   4 +
>>   drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
>>   drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
>>   drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>>   drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 210 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  45 +++++
>>   10 files changed, 338 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index f5f5775acdc0..3b5241937742 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -140,6 +140,7 @@ xe-y += \
>>   	xe_memirq.o \
>>   	xe_sriov.o \
>>   	xe_sriov_vf.o \
>> +	xe_sriov_vf_ccs.o \
>>   	xe_tile_sriov_vf.o
>>   
>>   xe-$(CONFIG_PCI_IOV) += \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 8cfcfff250ca..f1335c1d0183 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -926,6 +926,10 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_vsec_init(xe);
>>   
>> +	err = xe_sriov_late_init(xe);
>> +	if (err)
>> +		goto err_unregister_display;
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>   
>>   err_unregister_display:
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 003afb279a5e..5d2d87cc1c20 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -22,6 +22,7 @@
>>   #include "xe_pmu_types.h"
>>   #include "xe_pt_types.h"
>>   #include "xe_sriov_types.h"
>> +#include "xe_sriov_vf_ccs_types.h"
>>   #include "xe_step_types.h"
>>   #include "xe_survivability_mode_types.h"
>>   #include "xe_ttm_vram_mgr_types.h"
>> @@ -234,6 +235,9 @@ struct xe_tile {
>>   		struct {
>>   			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>>   			struct xe_ggtt_node *ggtt_balloon[2];
>> +
>> +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
>> +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>>   		} vf;
>>   	} sriov;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 848618acdca8..404844515523 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>>   	return 0;
>>   }
>>   
>> +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	struct xe_tile *tile = gt_to_tile(gt);
>> +	struct xe_sa_manager *bb_pool;
>> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> +
>> +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
>> +		return 0;
>> +
>> +	xe_pm_runtime_get(gt_to_xe(gt));
>> +
>> +	for_each_ccs_rw_ctx(ctx_id) {
>> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
>> +		drm_printf(p, "-------------------------\n");
>> +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
>> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
>> +		drm_puts(p, "\n");
>> +	}
>> +
>> +	xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +	return 0;
>> +}
>> +
>>   static int topology(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>   	xe_pm_runtime_get(gt_to_xe(gt));
>> @@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>>   	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>>   };
>>   
>> +/*
>> + * only for GT debugfs files which are valid on VF. Not valid on PF.
>> + */
>> +static const struct drm_info_list vf_only_debugfs_list[] = {
>> +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
>> +};
>> +
>>   /* everything else should be added here */
>>   static const struct drm_info_list pf_only_debugfs_list[] = {
>>   	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>> @@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>>   		drm_debugfs_create_files(pf_only_debugfs_list,
>>   					 ARRAY_SIZE(pf_only_debugfs_list),
>>   					 root, minor);
>> +	else
>> +		drm_debugfs_create_files(vf_only_debugfs_list,
>> +					 ARRAY_SIZE(vf_only_debugfs_list),
>> +					 root, minor);
>> +
>>   
>>   	xe_uc_debugfs_register(&gt->uc, root);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> index a0eab44c0e76..87911fb4eea7 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -15,6 +15,7 @@
>>   #include "xe_sriov.h"
>>   #include "xe_sriov_pf.h"
>>   #include "xe_sriov_vf.h"
>> +#include "xe_sriov_vf_ccs.h"
>>   
>>   /**
>>    * xe_sriov_mode_to_string - Convert enum value to string.
>> @@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>>   		strscpy(buf, "PF", size);
>>   	return buf;
>>   }
>> +
>> +/**
>> + * xe_sriov_late_init() - SR-IOV late initialization functions.
>> + * @xe: the &xe_device to initialize
>> + *
>> + * On VF this function will initialize code for CCS migration.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_sriov_late_init(struct xe_device *xe)
>> +{
>> +	int err = 0;
>> +
>> +	if (IS_VF_CCS_INIT_NEEDED(xe))
>> +		err = xe_sriov_vf_ccs_init(xe);
>> +
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
>> index 688fbabf08f1..0e0c1abf2d14 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov.h
>> @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>>   void xe_sriov_probe_early(struct xe_device *xe);
>>   void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>>   int xe_sriov_init(struct xe_device *xe);
>> +int xe_sriov_late_init(struct xe_device *xe);
>>   
>>   static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
>> index ca94382a721e..8abfdb2c5ead 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
>> @@ -71,6 +71,11 @@ struct xe_device_vf {
>>   		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>>   		unsigned long gt_flags;
>>   	} migration;
>> +
>> +	struct {
>> +		/** @initialized: Initilalization of vf ccs is completed or not */
>> +		bool initialized;
>> +	} ccs;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> new file mode 100644
>> index 000000000000..ff5ad472eb96
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -0,0 +1,210 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "instructions/xe_mi_commands.h"
>> +#include "instructions/xe_gpu_commands.h"
>> +#include "xe_bo.h"
>> +#include "xe_device.h"
>> +#include "xe_migrate.h"
>> +#include "xe_sa.h"
>> +#include "xe_sriov_printk.h"
>> +#include "xe_sriov_vf_ccs.h"
>> +#include "xe_sriov_vf_ccs_types.h"
>> +
>> +/**
>> + * DOC: VF save/restore of compression Meta Data
>> + *
>> + * VF KMD registers two special contexts/LRCAs.
>> + *
>> + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
>> + * compression control surface (Aka CCS) save in regular System memory in VM.
>> + *
>> + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
>> + * compression control surface (Aka CCS) Restore from regular System memory in
>> + * VM to corresponding CCS pool.
>> + *
>> + * Below diagram explain steps needed for VF save/Restore of compression Meta Data::
>> + *
>> + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
>> + *     LRCA        LRCA
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |     Create Save LRCA            |                              |         |
>> + *     [ ]<----------------------------- [ ]                             |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |       Register save LRCA     |         |
>> + *      |           |                     |           with Guc           |         |
>> + *      |           |                    [ ]--------------------------->[ ]        |
>> + *      |           |                     |                              |         |
>> + *      |           | Create restore LRCA |                              |         |
>> + *      |          [ ]<------------------[ ]                             |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |       Register restore LRCA  |         |
>> + *      |           |                     |           with Guc           |         |
>> + *      |           |                    [ ]--------------------------->[ ]        |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                    [ ]-------------------------    |         |
>> + *      |           |                    [ ]  Allocate main memory.  |   |         |
>> + *      |           |                    [ ]  Allocate CCS memory.   |   |         |
>> + *      |           |                    [ ]  Update Main memory &   |   |         |
>> + *     [ ]<------------------------------[ ]  CCS pages PPGTT + BB   |   |         |
>> + *      |          [ ]<------------------[ ]  cmds to save & restore.|   |         |
>> + *      |           |                    [ ]<------------------------    |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      :           :                     :                              :         :
>> + *      ---------------------------- VF Paused -------------------------------------
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |Schedule |
>> + *      |           |                     |                              |CCS Save |
>> + *      |           |                     |                              | LRCA    |
>> + *      |           |                     |                             [ ]------>[ ]
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |CCS save |
>> + *      |           |                     |                              |completed|
>> + *      |           |                     |                             [ ]<------[ ]
>> + *      |           |                     |                              |         |
>> + *      :           :                     :                              :         :
>> + *      ---------------------------- VM Migrated -----------------------------------
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      :           :                     :                              :         :
>> + *      ---------------------------- VF Resumed ------------------------------------
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                    [ ]--------------               |         |
>> + *      |           |                    [ ] Fix up GGTT  |              |         |
>> + *      |           |                    [ ]<-------------               |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |  Notify VF_RESFIX_DONE       |         |
>> + *      |           |                    [ ]--------------------------->[ ]        |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |Schedule |
>> + *      |           |                     |                              |CCS      |
>> + *      |           |                     |                              |Restore  |
>> + *      |           |                     |                              |LRCA     |
>> + *      |           |                     |                             [ ]------>[ ]
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |CCS      |
>> + *      |           |                     |                              |restore  |
>> + *      |           |                     |                              |completed|
>> + *      |           |                     |                             [ ]<------[ ]
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |  VF_RESFIX_DONE complete     |         |
>> + *      |           |                     |       notification           |         |
>> + *      |           |                    [ ]<---------------------------[ ]        |
>> + *      |           |                     |                              |         |
>> + *      |           |                     |                              |         |
>> + *      :           :                     :                              :         :
>> + *      ------------------------- Continue VM restore ------------------------------
>> + */
>> +
>> +static u64 get_ccs_bb_pool_size(struct xe_device *xe)
>> +{
>> +	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
>> +	struct sysinfo si;
>> +
>> +	si_meminfo(&si);
>> +	sys_mem_size = si.totalram * si.mem_unit;
>> +	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
>> +	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
>> +
>> +	/**
>> +	 * We need below BB size to hold PTE mappings and some DWs for copy
>> +	 * command. In reality, we need space for many copy commands. So, let
>> +	 * us allocate double the calculated size which is enough to holds GPU
>> +	 * instructions for the whole region.
>> +	 */
>> +	bb_pool_size = ptes * sizeof(u32);
>> +
>> +	return round_up(bb_pool_size * 2, SZ_1M);
>> +}
>> +
>> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>> +{
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_sa_manager *sa_manager;
>> +	u64 bb_pool_size;
>> +	int offset, err;
>> +
>> +	bb_pool_size = get_ccs_bb_pool_size(xe);
>> +	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>> +		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>> +
>> +	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
>> +
>> +	if (IS_ERR(sa_manager)) {
>> +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
>> +			     sa_manager);
>> +		err = PTR_ERR(sa_manager);
>> +		return err;
>> +	}
>> +
>> +	offset = 0;
>> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
>> +		      bb_pool_size);
>> +
>> +	offset = bb_pool_size - sizeof(u32);
>> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
>> +
>> +	ctx->mem.ccs_bb_pool = sa_manager;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
>> + * @xe: the &xe_device to start recovery on
>> + *
>> + * This function shall be called only by VF. It initializes
>> + * LRCA and suballocator needed for CCS save & restore.
>> + *
>> + * Return: 0 on success. Negative error code on failure.
>> + */
>> +int xe_sriov_vf_ccs_init(struct xe_device *xe)
>> +{
>> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> +	struct xe_migrate *migrate;
>> +	struct xe_tile_vf_ccs *ctx;
>> +	struct xe_tile *tile;
>> +	int tile_id, err;
>> +
>> +	xe_assert(xe, IS_SRIOV_VF(xe));
>> +	xe_assert(xe, !IS_DGFX(xe));
>> +	xe_assert(xe, xe_device_has_flat_ccs(xe));
>> +
>> +	for_each_tile(tile, xe, tile_id) {
> Nit: This only needs to be done for 1 tile. All iGPU are 1 tile, so this
> works but you could rewrite this entire series to avoid loops and rather
> use xe_device_get_root_tile(). That might be better a bit more future
> proof.
>
> Nit aside, this LGTM and you can keep my previous:
> Acked-by: Matthew Brost<matthew.brost@intel.com>

Fixed in the new version.
-Satya.

>> +		for_each_ccs_rw_ctx(ctx_id) {
>> +			ctx = &tile->sriov.vf.ccs[ctx_id];
>> +			ctx->ctx_id = ctx_id;
>> +
>> +			migrate = xe_migrate_init(tile);
>> +			if (IS_ERR(migrate)) {
>> +				err = PTR_ERR(migrate);
>> +				goto err_ret;
>> +			}
>> +			ctx->migrate = migrate;
>> +
>> +			err = alloc_bb_pool(tile, ctx);
>> +			if (err)
>> +				goto err_ret;
>> +		}
>> +	}
>> +
>> +	xe->sriov.vf.ccs.initialized = 1;
>> +
>> +	return 0;
>> +
>> +err_ret:
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> new file mode 100644
>> index 000000000000..5df9ba028d14
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SRIOV_VF_CCS_H_
>> +#define _XE_SRIOV_VF_CCS_H_
>> +
>> +struct xe_device;
>> +
>> +int xe_sriov_vf_ccs_init(struct xe_device *xe);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>> new file mode 100644
>> index 000000000000..6dc279d206ec
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>> @@ -0,0 +1,45 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SRIOV_VF_CCS_TYPES_H_
>> +#define _XE_SRIOV_VF_CCS_TYPES_H_
>> +
>> +#define for_each_ccs_rw_ctx(id__) \
>> +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
>> +
>> +#define IS_VF_CCS_READY(xe) ({ \
>> +		struct xe_device *___xe = (xe); \
>> +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
>> +		___xe->sriov.vf.ccs.initialized; \
>> +		})
>> +
>> +#define IS_VF_CCS_INIT_NEEDED(xe) ({\
>> +		struct xe_device *___xe = (xe); \
>> +		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
>> +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
>> +		})
>> +
>> +enum xe_sriov_vf_ccs_rw_ctxs {
>> +	XE_SRIOV_VF_CCS_READ_CTX,
>> +	XE_SRIOV_VF_CCS_WRITE_CTX,
>> +	XE_SRIOV_VF_CCS_CTX_COUNT
>> +};
>> +
>> +struct xe_migrate;
>> +struct xe_sa_manager;
>> +
>> +struct xe_tile_vf_ccs {
>> +	/** @id: Id to which context it belongs to */
>> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>> +	/** @migrate: Migration helper for save/restore of CCS data */
>> +	struct xe_migrate *migrate;
>> +
>> +	struct {
>> +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
>> +		struct xe_sa_manager *ccs_bb_pool;
>> +	} mem;
>> +};
>> +
>> +#endif
>> -- 
>> 2.43.0
>>
--------------S6upyOhOcQjobriXvVEuA4Jb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi.</p>
    <div class="moz-cite-prefix">On 20-06-2025 21:50, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aFWKTx9PVgs4v%2FZX@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Thu, Jun 19, 2025 at 01:34:57PM +0530, Satyanarayana K V P wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Create two LRCs to handle CCS meta data read / write from CCS pool in the
VM. Read context is used to hold GPU instructions to be executed at save
time and write context is used to hold GPU instructions to be executed at
the restore time.

Allocate batch buffer pool using suballocator for both read and write
contexts.

Migration framework is reused to create LRCAs for read and write.

Signed-off-by: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
---
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>

V7 -&gt; V8:
- None.

V6 -&gt; V7:
- Fixed review comments (Michal Wajdeczko &amp; Matthew Brost).

V5 -&gt; V6:
- Added id field in the xe_tile_vf_ccs structure for self identification.

V4 -&gt; V5:
- Modified read/write contexts to enums from #defines (Matthew Brost).
- The CCS BB pool size is calculated based on the system memory size (Michal
Wajdeczko &amp; Matthew Brost).

V3 -&gt; V4:
- Fixed issues reported by patchworks.

V2 -&gt; V3:
- Added new variable which denotes the initialization of contexts.

V1 -&gt; V2:
- Fixed review comments.
---
 drivers/gpu/drm/xe/Makefile                |   1 +
 drivers/gpu/drm/xe/xe_device.c             |   4 +
 drivers/gpu/drm/xe/xe_device_types.h       |   4 +
 drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
 drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
 drivers/gpu/drm/xe/xe_sriov.h              |   1 +
 drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 210 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  45 +++++
 10 files changed, 338 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index f5f5775acdc0..3b5241937742 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -140,6 +140,7 @@ xe-y += \
 	xe_memirq.o \
 	xe_sriov.o \
 	xe_sriov_vf.o \
+	xe_sriov_vf_ccs.o \
 	xe_tile_sriov_vf.o
 
 xe-$(CONFIG_PCI_IOV) += \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8cfcfff250ca..f1335c1d0183 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -926,6 +926,10 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_vsec_init(xe);
 
+	err = xe_sriov_late_init(xe);
+	if (err)
+		goto err_unregister_display;
+
 	return devm_add_action_or_reset(xe-&gt;drm.dev, xe_device_sanitize, xe);
 
 err_unregister_display:
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 003afb279a5e..5d2d87cc1c20 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -22,6 +22,7 @@
 #include &quot;xe_pmu_types.h&quot;
 #include &quot;xe_pt_types.h&quot;
 #include &quot;xe_sriov_types.h&quot;
+#include &quot;xe_sriov_vf_ccs_types.h&quot;
 #include &quot;xe_step_types.h&quot;
 #include &quot;xe_survivability_mode_types.h&quot;
 #include &quot;xe_ttm_vram_mgr_types.h&quot;
@@ -234,6 +235,9 @@ struct xe_tile {
 		struct {
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
 			struct xe_ggtt_node *ggtt_balloon[2];
+
+			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
+			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 848618acdca8..404844515523 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
 	return 0;
 }
 
+static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_sa_manager *bb_pool;
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+
+	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
+		return 0;
+
+	xe_pm_runtime_get(gt_to_xe(gt));
+
+	for_each_ccs_rw_ctx(ctx_id) {
+		drm_printf(p, &quot;ccs %s bb suballoc info\n&quot;, ctx_id ? &quot;write&quot; : &quot;read&quot;);
+		drm_printf(p, &quot;-------------------------\n&quot;);
+		bb_pool = tile-&gt;sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
+		drm_suballoc_dump_debug_info(&amp;bb_pool-&gt;base, p, bb_pool-&gt;gpu_addr);
+		drm_puts(p, &quot;\n&quot;);
+	}
+
+	xe_pm_runtime_put(gt_to_xe(gt));
+
+	return 0;
+}
+
 static int topology(struct xe_gt *gt, struct drm_printer *p)
 {
 	xe_pm_runtime_get(gt_to_xe(gt));
@@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{&quot;hwconfig&quot;, .show = xe_gt_debugfs_simple_show, .data = hwconfig},
 };
 
+/*
+ * only for GT debugfs files which are valid on VF. Not valid on PF.
+ */
+static const struct drm_info_list vf_only_debugfs_list[] = {
+	{&quot;sa_info_vf_ccs&quot;, .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
+};
+
 /* everything else should be added here */
 static const struct drm_info_list pf_only_debugfs_list[] = {
 	{&quot;hw_engines&quot;, .show = xe_gt_debugfs_simple_show, .data = hw_engines},
@@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 		drm_debugfs_create_files(pf_only_debugfs_list,
 					 ARRAY_SIZE(pf_only_debugfs_list),
 					 root, minor);
+	else
+		drm_debugfs_create_files(vf_only_debugfs_list,
+					 ARRAY_SIZE(vf_only_debugfs_list),
+					 root, minor);
+
 
 	xe_uc_debugfs_register(&amp;gt-&gt;uc, root);
 
diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
index a0eab44c0e76..87911fb4eea7 100644
--- a/drivers/gpu/drm/xe/xe_sriov.c
+++ b/drivers/gpu/drm/xe/xe_sriov.c
@@ -15,6 +15,7 @@
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_sriov_pf.h&quot;
 #include &quot;xe_sriov_vf.h&quot;
+#include &quot;xe_sriov_vf_ccs.h&quot;
 
 /**
  * xe_sriov_mode_to_string - Convert enum value to string.
@@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
 		strscpy(buf, &quot;PF&quot;, size);
 	return buf;
 }
+
+/**
+ * xe_sriov_late_init() - SR-IOV late initialization functions.
+ * @xe: the &amp;xe_device to initialize
+ *
+ * On VF this function will initialize code for CCS migration.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_late_init(struct xe_device *xe)
+{
+	int err = 0;
+
+	if (IS_VF_CCS_INIT_NEEDED(xe))
+		err = xe_sriov_vf_ccs_init(xe);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
index 688fbabf08f1..0e0c1abf2d14 100644
--- a/drivers/gpu/drm/xe/xe_sriov.h
+++ b/drivers/gpu/drm/xe/xe_sriov.h
@@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
 void xe_sriov_probe_early(struct xe_device *xe);
 void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
 int xe_sriov_init(struct xe_device *xe);
+int xe_sriov_late_init(struct xe_device *xe);
 
 static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
index ca94382a721e..8abfdb2c5ead 100644
--- a/drivers/gpu/drm/xe/xe_sriov_types.h
+++ b/drivers/gpu/drm/xe/xe_sriov_types.h
@@ -71,6 +71,11 @@ struct xe_device_vf {
 		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
 		unsigned long gt_flags;
 	} migration;
+
+	struct {
+		/** @initialized: Initilalization of vf ccs is completed or not */
+		bool initialized;
+	} ccs;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
new file mode 100644
index 000000000000..ff5ad472eb96
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include &quot;instructions/xe_mi_commands.h&quot;
+#include &quot;instructions/xe_gpu_commands.h&quot;
+#include &quot;xe_bo.h&quot;
+#include &quot;xe_device.h&quot;
+#include &quot;xe_migrate.h&quot;
+#include &quot;xe_sa.h&quot;
+#include &quot;xe_sriov_printk.h&quot;
+#include &quot;xe_sriov_vf_ccs.h&quot;
+#include &quot;xe_sriov_vf_ccs_types.h&quot;
+
+/**
+ * DOC: VF save/restore of compression Meta Data
+ *
+ * VF KMD registers two special contexts/LRCAs.
+ *
+ * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
+ * compression control surface (Aka CCS) save in regular System memory in VM.
+ *
+ * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
+ * compression control surface (Aka CCS) Restore from regular System memory in
+ * VM to corresponding CCS pool.
+ *
+ * Below diagram explain steps needed for VF save/Restore of compression Meta Data::
+ *
+ *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
+ *     LRCA        LRCA
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |     Create Save LRCA            |                              |         |
+ *     [ ]&lt;----------------------------- [ ]                             |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |       Register save LRCA     |         |
+ *      |           |                     |           with Guc           |         |
+ *      |           |                    [ ]---------------------------&gt;[ ]        |
+ *      |           |                     |                              |         |
+ *      |           | Create restore LRCA |                              |         |
+ *      |          [ ]&lt;------------------[ ]                             |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |       Register restore LRCA  |         |
+ *      |           |                     |           with Guc           |         |
+ *      |           |                    [ ]---------------------------&gt;[ ]        |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                    [ ]-------------------------    |         |
+ *      |           |                    [ ]  Allocate main memory.  |   |         |
+ *      |           |                    [ ]  Allocate CCS memory.   |   |         |
+ *      |           |                    [ ]  Update Main memory &amp;   |   |         |
+ *     [ ]&lt;------------------------------[ ]  CCS pages PPGTT + BB   |   |         |
+ *      |          [ ]&lt;------------------[ ]  cmds to save &amp; restore.|   |         |
+ *      |           |                    [ ]&lt;------------------------    |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      :           :                     :                              :         :
+ *      ---------------------------- VF Paused -------------------------------------
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |Schedule |
+ *      |           |                     |                              |CCS Save |
+ *      |           |                     |                              | LRCA    |
+ *      |           |                     |                             [ ]------&gt;[ ]
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |CCS save |
+ *      |           |                     |                              |completed|
+ *      |           |                     |                             [ ]&lt;------[ ]
+ *      |           |                     |                              |         |
+ *      :           :                     :                              :         :
+ *      ---------------------------- VM Migrated -----------------------------------
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      :           :                     :                              :         :
+ *      ---------------------------- VF Resumed ------------------------------------
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                    [ ]--------------               |         |
+ *      |           |                    [ ] Fix up GGTT  |              |         |
+ *      |           |                    [ ]&lt;-------------               |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |  Notify VF_RESFIX_DONE       |         |
+ *      |           |                    [ ]---------------------------&gt;[ ]        |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |Schedule |
+ *      |           |                     |                              |CCS      |
+ *      |           |                     |                              |Restore  |
+ *      |           |                     |                              |LRCA     |
+ *      |           |                     |                             [ ]------&gt;[ ]
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |CCS      |
+ *      |           |                     |                              |restore  |
+ *      |           |                     |                              |completed|
+ *      |           |                     |                             [ ]&lt;------[ ]
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      |           |                     |  VF_RESFIX_DONE complete     |         |
+ *      |           |                     |       notification           |         |
+ *      |           |                    [ ]&lt;---------------------------[ ]        |
+ *      |           |                     |                              |         |
+ *      |           |                     |                              |         |
+ *      :           :                     :                              :         :
+ *      ------------------------- Continue VM restore ------------------------------
+ */
+
+static u64 get_ccs_bb_pool_size(struct xe_device *xe)
+{
+	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
+	struct sysinfo si;
+
+	si_meminfo(&amp;si);
+	sys_mem_size = si.totalram * si.mem_unit;
+	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
+	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
+
+	/**
+	 * We need below BB size to hold PTE mappings and some DWs for copy
+	 * command. In reality, we need space for many copy commands. So, let
+	 * us allocate double the calculated size which is enough to holds GPU
+	 * instructions for the whole region.
+	 */
+	bb_pool_size = ptes * sizeof(u32);
+
+	return round_up(bb_pool_size * 2, SZ_1M);
+}
+
+static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_sa_manager *sa_manager;
+	u64 bb_pool_size;
+	int offset, err;
+
+	bb_pool_size = get_ccs_bb_pool_size(xe);
+	xe_sriov_info(xe, &quot;Allocating %s CCS BB pool size = %lldMB\n&quot;,
+		      ctx-&gt;ctx_id ? &quot;Restore&quot; : &quot;Save&quot;, bb_pool_size / SZ_1M);
+
+	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
+
+	if (IS_ERR(sa_manager)) {
+		xe_sriov_err(xe, &quot;Suballocator init failed with error: %pe\n&quot;,
+			     sa_manager);
+		err = PTR_ERR(sa_manager);
+		return err;
+	}
+
+	offset = 0;
+	xe_map_memset(xe, &amp;sa_manager-&gt;bo-&gt;vmap, offset, MI_NOOP,
+		      bb_pool_size);
+
+	offset = bb_pool_size - sizeof(u32);
+	xe_map_wr(xe, &amp;sa_manager-&gt;bo-&gt;vmap, offset, u32, MI_BATCH_BUFFER_END);
+
+	ctx-&gt;mem.ccs_bb_pool = sa_manager;
+
+	return 0;
+}
+
+/**
+ * xe_sriov_vf_ccs_init - Setup LRCA for save &amp; restore.
+ * @xe: the &amp;xe_device to start recovery on
+ *
+ * This function shall be called only by VF. It initializes
+ * LRCA and suballocator needed for CCS save &amp; restore.
+ *
+ * Return: 0 on success. Negative error code on failure.
+ */
+int xe_sriov_vf_ccs_init(struct xe_device *xe)
+{
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	struct xe_migrate *migrate;
+	struct xe_tile_vf_ccs *ctx;
+	struct xe_tile *tile;
+	int tile_id, err;
+
+	xe_assert(xe, IS_SRIOV_VF(xe));
+	xe_assert(xe, !IS_DGFX(xe));
+	xe_assert(xe, xe_device_has_flat_ccs(xe));
+
+	for_each_tile(tile, xe, tile_id) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: This only needs to be done for 1 tile. All iGPU are 1 tile, so this
works but you could rewrite this entire series to avoid loops and rather
use xe_device_get_root_tile(). That might be better a bit more future
proof. 

Nit aside, this LGTM and you can keep my previous:
Acked-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
</pre>
    </blockquote>
    <pre>Fixed in the new version.
-Satya.</pre>
    <blockquote type="cite" cite="mid:aFWKTx9PVgs4v%2FZX@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		for_each_ccs_rw_ctx(ctx_id) {
+			ctx = &amp;tile-&gt;sriov.vf.ccs[ctx_id];
+			ctx-&gt;ctx_id = ctx_id;
+
+			migrate = xe_migrate_init(tile);
+			if (IS_ERR(migrate)) {
+				err = PTR_ERR(migrate);
+				goto err_ret;
+			}
+			ctx-&gt;migrate = migrate;
+
+			err = alloc_bb_pool(tile, ctx);
+			if (err)
+				goto err_ret;
+		}
+	}
+
+	xe-&gt;sriov.vf.ccs.initialized = 1;
+
+	return 0;
+
+err_ret:
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
new file mode 100644
index 000000000000..5df9ba028d14
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VF_CCS_H_
+#define _XE_SRIOV_VF_CCS_H_
+
+struct xe_device;
+
+int xe_sriov_vf_ccs_init(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
new file mode 100644
index 000000000000..6dc279d206ec
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_SRIOV_VF_CCS_TYPES_H_
+#define _XE_SRIOV_VF_CCS_TYPES_H_
+
+#define for_each_ccs_rw_ctx(id__) \
+	for ((id__) = 0; (id__) &lt; XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
+
+#define IS_VF_CCS_READY(xe) ({ \
+		struct xe_device *___xe = (xe); \
+		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
+		___xe-&gt;sriov.vf.ccs.initialized; \
+		})
+
+#define IS_VF_CCS_INIT_NEEDED(xe) ({\
+		struct xe_device *___xe = (xe); \
+		IS_SRIOV_VF(___xe) &amp;&amp; !IS_DGFX(___xe) &amp;&amp; \
+		xe_device_has_flat_ccs(___xe) &amp;&amp; GRAPHICS_VER(___xe) &gt;= 20; \
+		})
+
+enum xe_sriov_vf_ccs_rw_ctxs {
+	XE_SRIOV_VF_CCS_READ_CTX,
+	XE_SRIOV_VF_CCS_WRITE_CTX,
+	XE_SRIOV_VF_CCS_CTX_COUNT
+};
+
+struct xe_migrate;
+struct xe_sa_manager;
+
+struct xe_tile_vf_ccs {
+	/** @id: Id to which context it belongs to */
+	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
+	/** @migrate: Migration helper for save/restore of CCS data */
+	struct xe_migrate *migrate;
+
+	struct {
+		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
+		struct xe_sa_manager *ccs_bb_pool;
+	} mem;
+};
+
+#endif
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------S6upyOhOcQjobriXvVEuA4Jb--
