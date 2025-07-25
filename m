Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ADAC87FCD
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 08:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D40910E14C;
	Fri, 25 Jul 2025 08:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lBu/K/R6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B03510E14C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 08:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753430919; x=1784966919;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x8YG/TK5eb7tRllvn5jCHyO4cxQqHFhymFGnQigKoOs=;
 b=lBu/K/R6Q5sZJPmQVu3hoxipWr64GNTcAL/cZVGhJ7arDY8gN+VViI7F
 4BpNy8FjWBV5quJArmRYAp6cKNNQWAKLqbT5U4LRfeFC14n9/dyAuUYo9
 TrgRYIJwskjhXGL8Y8JUEw1K4RK4iU4OH8AmP7rTcwn4n8TV7z/bPFW5f
 2Q8YbFUqsm0BepCS4tAPSoVPwvzi9Wm4MZMBXMjkTnqmIS3mxtgFKbWOp
 y9p/ElAwjFX8ZEyt5dDmltscClK+hQ78jKfl+GNBTnrPyWmPhkYS0hbMm
 cCwlySFv39nlEiY4TjB1kXq8MJ6bK+Hd5YVnm5J8HVIfR/Gr7+fzd1wLZ g==;
X-CSE-ConnectionGUID: r7eKlvHUQ9GjLJ6gF8kHag==
X-CSE-MsgGUID: l969+yA5TGaWYiZqjA8I/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55861792"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="55861792"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 01:08:38 -0700
X-CSE-ConnectionGUID: 8o18r2YRRnCV/ANqQtU1zw==
X-CSE-MsgGUID: OPP7DfNRTOi3jPS0vmWmUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160767715"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 01:08:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 01:08:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 01:08:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 01:08:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMcGefoTJcu91m0IiW0INbRnGX/AeV0+iM0kD2l12Y4JeccH1z69hwyYhAWUXBQTnErDCJeuwTdFmZmqdvlJ5QoxttANW5/ofEZLhCF9D8U2LUPKUVeDHSaN36bHpVR5kP124cEAXSCzu36Ftt+pgRdOIXLsFw35R9NgSS8Z2XhFcZ6BOTKDG3mOfI3Ad2yMZLGjx5PIqKSUCwoIPgINDxY9Ouzd32PdvsS5DISBRT1w0t30GkJ+T/NyAovK463jfcyoLV/09pp2GaeHb6pYPQxKy+aj8mQpV1vS7jZ4tx0lTJnOwp2ScuZPP6eb3XFtOacqElVO6Elfg8Z5HF+74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kmnz6AekMLJlvUiSP9E6DUUjwj4uz11G/mxdMwYL21g=;
 b=Hoe0CNX/XMKhbKG8CvSNiEIJzL1SRu7qn/6zC1IblkXiDJXiadKe31/cugZ6yjbeaVLu9mzOpBAo7DaL712AycqG9SYjD6UiFKE074nfNgzFRgq2/Nuv6DMYqfKfkrn8Zmj2Et6YqumKDQwbbjqgYMcqtVrtqhwB8gWew+RFn13nZI/CgxdrZGInecWjYF7J0Nbwjkrqjtm2ei+rW5pXfQ1CDR8zdfkttoTpe9y9HoMRlX6JrYrbXCqeBm8NX556ynl1YTi48sogmdocjIS95jg0F/fR5GUmQ/yoELA8LGVrwBiPFeQ0StIWnYGXpjbLZWeM7BG+NyCdVfSRsqY/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH3PPFF2B8F6C64.namprd11.prod.outlook.com (2603:10b6:518:1::d60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 08:08:31 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.8943.029; Fri, 25 Jul 2025
 08:08:30 +0000
Message-ID: <89f6c8b4-9b2e-48aa-b00a-2c15c3062b97@intel.com>
Date: Fri, 25 Jul 2025 10:08:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hw_engine_group: Avoid call kfree() for
 drmm_kzalloc()
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20250724193854.1124510-2-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250724193854.1124510-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH3PPFF2B8F6C64:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f76e0b-23e3-4be2-ec88-08ddcb52712d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1l2V0g3OHkxakNZd3BYeW1MUFpJQWJGanNDVENDeC9aRUlWa25jNGFkenB0?=
 =?utf-8?B?MGNxTjdrMnVsYmhkOEhxcCt1YTFsVkhLSFoxUWVqU3cwWk9Md2pjd08xK3Z0?=
 =?utf-8?B?UXNoekg3NHMyYUdMQVY3c1BQVFRSaFRVd1l0YWF4YmYzZnNPbUdsOWM3YnRR?=
 =?utf-8?B?aTNQUjE3bWVpWDhCRFN6UFNXclFVcFNKZVRnNHhrSWtqSzdhOVpGaUk3bkZq?=
 =?utf-8?B?Q01MMVZOaWNOckNZWlBpa1RDUjlDU01vNUV3MTg0NjBidU1LMzBuMFI4SGdC?=
 =?utf-8?B?Q3FSMWx5K2xxQ3FLaGxFNElTMm9qaW1qMFdqQUI4VVNjN1ZEQlVDcmNhWWhD?=
 =?utf-8?B?cnhJR1BUWWdOMVUrbmd4ZVVtOEc1ZVhQck54b0xwTWJCbmV6a0VRUUxmaks1?=
 =?utf-8?B?bVhXRm93RnYzN25zYmVjaVd0NDZ3OFArTEM3Q0IvUUJieWlFTUYyUnhsYTdK?=
 =?utf-8?B?Qkd3cFV2dy9jTnkwWDg5U1VhSnFFSDdnSXJ5Z1R5WXpoQ3FjR3F5ZTRtKzZQ?=
 =?utf-8?B?TUJuUFFXeGhDeFRqMDJCcGVLVVd1MUF6NU5za1lGSnYzdXhLUVhBZEtnTlF1?=
 =?utf-8?B?TExSWHNNemRSNEc2MGdNb0thWWtRNnZYMXZBZnJtM2NUK1B4c0Y5eHczWTAy?=
 =?utf-8?B?Yk1HTS9vUnZlRzFJRkVBaVdJT1dmc2cwNXFVbW1QWGNkNCtpV281eHhydHQr?=
 =?utf-8?B?aWc0ekw2cWNFY0FTeGRXWmdoNjFXZzVrc2FnUDdOdDRzNkQ2OEZuS1hsYjk5?=
 =?utf-8?B?MjFPamJBQTRudDNTdzZRN2FTUlNWdzlVdEpxRERRWHpYazJGUzdGTnFXMnRn?=
 =?utf-8?B?djNlcEhUek1CY0VuazdaSlE5WDd6bzJvaGFwM1F5anZ0d1Zpait5Ti9oWjl4?=
 =?utf-8?B?cVo5RjdXWGc2VExuL2YweFFvQ3FyYzNJaVk4K3VEVi9jT1crbkdSU0RhY3I3?=
 =?utf-8?B?K3dUKzgwei9oY0E0T3J0OTBHeGpYN1JRVGlCbks1K0JzaUpSenYrZUZpUGxM?=
 =?utf-8?B?d0k2NG9ZWTdXaUpHZXNPcmQyVCs3dUlKYm1YRVFLamNwaisvSjBMV0doTVFL?=
 =?utf-8?B?clUyd0Z3enNFcTVZUWJuSzN3TnFqc1Fuc1grYW1hak1QanlTN1FSRklnUnRZ?=
 =?utf-8?B?Q2xDTjVaSkpiamZRbUl0VTlsVElhU2h6L1d5bDN1NzhMOGd0dTdlWFY4QkVo?=
 =?utf-8?B?V3NFZmNyN3laemh1NmZXelh5VVh4OFNYRGpoZ2lWYURZcENRblJRWnlPSGtq?=
 =?utf-8?B?WVMyYzJvZFlEMWx2MFFDY0swcVJSVjJZU2FzVkJ5SHFMdURqTDZkV2ZYbmNh?=
 =?utf-8?B?MVlPalROWktLU2RDblE0QklraHJ2aWpmTXkwZzFCenJvSWM2L05TNkZGMFZZ?=
 =?utf-8?B?NDNSNldRY1RnLy9OdTNEMWZRY2ZEL0xUU01oTHRiUkwvL093NlRJbWt3YnFt?=
 =?utf-8?B?eElRZ0dpVDlVSFlBNlVlaU9FMVBzYVZNTXo3czBxeUVmN1ZPQW1pMUFkekVk?=
 =?utf-8?B?Misrb3lHM3RlOVRPQWNVMVdxSzZqQzRvUTl2OE5UUEFqcGhlRVl4SXVzdGNa?=
 =?utf-8?B?RWxCR09TMnJqWXVVMnNYQ0NUZ1M0VXM5SlhHdjlVWFhLVGF5cEFuQzFnTTJ4?=
 =?utf-8?B?N3NoUlh0TWdRVWJiTEFFMSswdUNIL3JqY1dWOFVLTERsUG9lcVJxNHM1dXI3?=
 =?utf-8?B?VCtmdzdWSkxuYTNoU3Q3TnVIdUZ6Y2dZeTF0ckVsNFI0aEpUVkVNcktxRUo4?=
 =?utf-8?B?d0dwcVZHV0FiYUNKbnFoSjk3OGExZVFFK1RJZHJDeGd4YnhJeFpkcXJQOWJq?=
 =?utf-8?B?Smh1amVyVGxvaEF3aVVxL00reFZiR3BmbE5rV25FaDB0N0JDTUtlVms2TnN1?=
 =?utf-8?B?K3JKN2hsSGlTakNzOElCWlhRcHRTRm5DeFd1TWNMc1NmTVdMeWQvbnNNdTFn?=
 =?utf-8?Q?VD5jba5ielg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2xqK3dOMkRiaXVYakI0di9lWjJJMWlZWjFGeUJaakFhZVhKajdrWjZDY2dY?=
 =?utf-8?B?UkprQWRFbEdlNG01RHF0SCt0Z1FjZkdDOGxzOEtXQ29sdURIVmc5d3BVQkNa?=
 =?utf-8?B?RVNZaUNvU282OGQzTVRTZUU1TmVqSVpNMURIeW92bjlQaDJKT01pb2tleFhG?=
 =?utf-8?B?dXFzaVAvUVB5eWZoNERwQkt5RlNmMjcyVEJLZ2lycFhrVlZNM1NDMDdhdER3?=
 =?utf-8?B?L1ZlQWlZb3N6Y3VFWU1yTngxNm8rSStxbkI4MklPNFh5YU55Zlp1djJJWW50?=
 =?utf-8?B?WUc3ZDZKWTVNaXNVaVlJQ05sVzZwdWJFL1Vmak5LMldBc1U1NmMrTDNORlRz?=
 =?utf-8?B?RERiQmJ5SHIvSUkvNUNuWTBxeDVPdllNZmlYUjR3QkxNb3Fad3BSMlFpbllQ?=
 =?utf-8?B?VzQ3Y240ZWtwd3dKNUlNNHVCeUpNbkVJMTY5TmZGWWkrVVVydzdGWXUxS3Vy?=
 =?utf-8?B?S0ZLemV5am02UEF6SWhySmlGak9DZERCM1AvU0xOaHpuZWh1WVRnelpsUFJC?=
 =?utf-8?B?SnJTOWJOZ280SHBXS29TUXQ0UTg1czMxbnRNa01oaUZKTXl2T2x4UHZCa3ZV?=
 =?utf-8?B?aE8vcTY1QjRyd0RzMmtKWm5JdUJpd2h4OW5jLzQyQWxHZ2xaTVJUejFsV0Fu?=
 =?utf-8?B?RGh5cVdzcG9YbW5CUkZSZERpTXB3NjVNRXdudXB4NzhST3NpREhNMHhGUW1z?=
 =?utf-8?B?WmgzbUFuT0U3MnRlaWlXT1M5MHp0T0xHRnpPcHFnTmVncnp6MVhWMm4vUFJW?=
 =?utf-8?B?UFB3cDNzUy91amFyNWR1UU5BbE9DUHMzejhIcFFPY0lIYkV6eFpCbnBNbmdP?=
 =?utf-8?B?d0w3SWlsV3ZraHNVQzlPODNrbEZMU3V1SGtrRFQrdDlwalN2bUZNb1JNbTRa?=
 =?utf-8?B?bUsvK0prc2tQTUdnUmlvM1VkVEdzckJ6ME5veHNDL3NWVklkOXd6dDBCbzhX?=
 =?utf-8?B?T1JCVzlQQU5GZVdtdDhzL0V1Nk1yWG1SdEczTFh6TDdSODRNQSszQmdqUWV6?=
 =?utf-8?B?ZVM3SGhKVmVEY21UaW0xVE1LVW1BNWNJRS83ZExLN2FyaldGN1ZpM3RJTXJw?=
 =?utf-8?B?S0NRT0FuRGk1ZVcvUXA5SXNqbDBFTnVXNktiZWo1aTI2dUVyNm5tamVLUjRJ?=
 =?utf-8?B?bWozR1JLa2phdXg3WmRzRzE2RklaN1lGQnpxdEVhQ25DVHphSG5wUlVtUzZn?=
 =?utf-8?B?REtvWjJyUjR6NWNJZ2pTb01wSXVsUWg0R21QNndqcitDQXpBSytJbkp6YTRS?=
 =?utf-8?B?c1RZaEJIZTBESmFCeEZISjh5aUtHcVlDc0hnTzV2RFoxQzkwdi9BVW9Bbnox?=
 =?utf-8?B?T0NlSkozc0ZOcHZMVi9McHdRSm1GZ0ZEbTEySXVVWDNRaG9OZE1WVmZwOEVs?=
 =?utf-8?B?U2pyb0ZyVkNyWEhpaTd1c3UwZEtMRENYdklGMTlGWHBTUUlQUGd4cHExbkd0?=
 =?utf-8?B?WjJTV1lBOXlpQ1krSlBBR0ZnbFh3ZjZ1N2J4LzBTOTA0dkQ0NWtka20wam5X?=
 =?utf-8?B?dUJTL1BGWENhVVJ0RVF3dWtOZVZpRUlHQzNkNGRyNlVXOG9NT3h2Q1pJcm1B?=
 =?utf-8?B?Q3BnejUxbjI3Z09NNjJVNGZoVllMUXNCNE90TE9qMkI0QWp1ZTVxa0Y0dGxm?=
 =?utf-8?B?VTBVMHp0VW42OEt6amFHTWRDUm1kWlhUK0ZZeSs5bnBVRXhTaTY3T1d0Ulor?=
 =?utf-8?B?dlRmTzU0RFduaCtDWEVEWVkvaWg3STZ5Z2lsR2toNTBucTcrQW8yNk5ndUR5?=
 =?utf-8?B?UzBWbTh6aUtsZUNvVVRUNG9XZTdXblBJQ0Y4SHA4cFBDU09ENlk1R0wrRFhG?=
 =?utf-8?B?UnJER2o3Q3FocVgyaEYvWlZMMUxabjdsbDhSYXg2dHAwbnJhVWRmS0tkRHc2?=
 =?utf-8?B?OXY3Z01OMlJZOGpJQ0FYVjJFRHNrc1d4eUZDMlEvbkpBYk83QjE3TjhqdG5u?=
 =?utf-8?B?T0pZdjVvMTFDQmhaL0c3V3VvRWV3ZDAzeUJwRVB5K0VwWVdydTdaQ2RqdWc2?=
 =?utf-8?B?M0JsK2l5RVlMbGxvL25hRDJhVFdYK0RKRnpQS3Q5eFQzQ1k0cEZqN1I2Ti9k?=
 =?utf-8?B?ZUxuR3hxNjFEbXlkVUpOSThobWU5OHhHSkpGSWlJMzlob0NRdEhqTGptSmR5?=
 =?utf-8?B?Vi9oNlJsR0pDRDhjWUsyay9MZkxISkRtS21sbVJKVWRjRXlncFk4V2R1R2hY?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f76e0b-23e3-4be2-ec88-08ddcb52712d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 08:08:30.5789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktK8TDnNLPKbru4+ofnLsLOPOA2NOZSEqbYERQW6lkveQMZ/2z6CFPRceTWUITR3jIgrUSYKEsXRNt0gxpsPgDj28QVqYRz8P3ovqWQsFEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFF2B8F6C64
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



On 7/24/2025 9:38 PM, Shuicheng Lin wrote:
> Memory allocated with drmm_kzalloc() should not be freed using kfree(), as it
> is managed by the DRM subsystem. The memory will be automatically freed when
> the associated drm_device is released.
> These 3 group pointers are allocated using drmm_kzalloc() in hw_engine_group_alloc(),
> so they don't require manual deallocation.
> 
> Fixes: 67979060740f ("drm/xe/hw_engine_group: Fix potential leak")
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---

fixed commit description per checkpatch complain and pushed

thanks for the fix!

Michal
