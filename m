Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43106EDF055
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 08:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F246710E6FA;
	Thu, 12 Feb 2026 08:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NMWKXDMD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE3910E6EF
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Feb 2026 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770884200; x=1802420200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yg2M0GeLbS0GZQMjG3TzHOZ8E6vVIfIso8A6bZ8mO6M=;
 b=NMWKXDMDIIqJwKXWx5/RfaivNIYYlPS+qgd8nGDWnytZzc28bbpULIjI
 WyVs+DaalgYiA/tYINnPaPSUlfqb7ZdNPxklbmAc9JqVe36uT0B9m+p3d
 SLu99NZGExDsYkrsP5g4Hcb/aQCF7Dxu0a8gWXLjBM30XWIclAjX9L5y4
 +yRZFyJkk9eG5xZlSNR7bJLUAkQ8elkpg33X1f7MLXqREEc7HBJEsNAM0
 efiJAd2IN2ooIajRZajFBe7MrbP3oUQc12xvnzKJ0MVtXv+IICxzj0ETv
 YL1SJpSpa9Dkmb2iZ92qDQPkfiRs2YS5UB9wWRi46Vsutx7QuYbb4dLZO A==;
X-CSE-ConnectionGUID: cAQbojGMTCaAKfFvYugd9Q==
X-CSE-MsgGUID: nxUu6lxWRIm0geunRYFAjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="94691325"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="94691325"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 00:16:39 -0800
X-CSE-ConnectionGUID: bcYed5fNRNesQE09mVbcuw==
X-CSE-MsgGUID: Bzc0sDqGRdGX2+DIH/SYEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="211365500"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 00:16:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 00:16:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 12 Feb 2026 00:16:38 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 12 Feb 2026 00:16:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAmAOrNc5o+kE4bgrOmz+JWDGbX7n7t7vUSgr9yNoMDJVWxIszhogZ0RhQaLfXNGjP15amFMbZYiozoHFSZtn5zv+EgjUxk+G4YonR25lSAcujsf4UZ9eJuWTmu/tegZ7w3NeljUBBvmQQnQTwnh4fNeQOjy1TF7p16MIMUeBme9pdQtgVy5DPL4KgjB8HBHJEvNVwJCK8WuJKhfTTrOsAFecIlF29ucm/s7Ms7CW3ZjdX2KaiLnkY3p9HSo/6Kfdbdw+llNPPK/l6GBSacjCx9KQaP+tXQJULDrs2EPx3oNcXSV+RufEq9Mv+zIs35PZWSp/JHaKJUz8pf7QJfVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSYqf2fWLGKy9YOGkGmduYg/ABkdx38GIhCzbgOCUOo=;
 b=PoDG04liBzB4V0opNU/DBTzu6rAvBzP40F1alOProgFRa06s1GbR2k9qm1gnowi0CSn9sNrJuo+luljTi955JcADGUXZQKsXqLplJiz68c6yHPh/mlNtrx1vmkQQplhHJONH/kC2bzWTFH15q7pfxmc01dpcUdqskCUD5yCZOh8WMVd8J4Mo3oLGix0+D4CmArxopu45x2ZZMz5NO642WQDl1ccQpQbquASs3I9NC6VzdilsvLjG1s9rd92m3XzPt9Q1IjgdXoWLypkR26mTotO3C73sVIq7UICBOZ2wCYU5PZie2OJrsJqeo8YOikoV4u5b9DNwGP4+U0rymB3WdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CH3PR11MB8341.namprd11.prod.outlook.com (2603:10b6:610:178::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:16:34 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:16:34 +0000
Message-ID: <fde05d02-4eb8-4caa-a871-b3ee9205d747@intel.com>
Date: Thu, 12 Feb 2026 13:46:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Decouple devcoredump from accessing core driver structures
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
References: <20260210072942.1864182-1-shekhar.chauhan@intel.com>
 <43de4a96-2aaa-4dc3-8c8d-0bce63385536@intel.com>
 <aYvKt64AeBC6Nvj6@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <aYvKt64AeBC6Nvj6@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0253.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::7) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CH3PR11MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ff5d63-e384-41c8-e8ab-08de6a0f08cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1g1bE9SWnJHUE84TEpBdVVFMUNVTkgrNWdWTHhETTR5K1ZxQmIxYnZOZWJt?=
 =?utf-8?B?NzJWMWZ0cUNJTE5nWVc5RCtlUE5RbEJpeFBQKzlYVnRPVjhIejBhWUMvUTNm?=
 =?utf-8?B?eHlEdHROVWpiYjcwMkpkbHdGQ3N6U21wcjNvUGp1VzNDZE9aYW1mTHR6STFD?=
 =?utf-8?B?RG1iNlRBSzYwUitmTXBETFgxUWlPZkhEQ1BDUk94amUvVGxKbVVnazdaS3Bh?=
 =?utf-8?B?MytPOEExd2dveTRuaGpyY3ZIcDZDUHdrZzNsVm1HYVZZcWhJZC80MU9FRHB3?=
 =?utf-8?B?RGRkOVU0M0Z2OVd5eFdlTW5RbGdxQUNVRTd2ZW5nYXJyZDR1RU5WVE9iMWNp?=
 =?utf-8?B?N3gzTzJPc1hhYjVJcFIxMDRtZFI4cUlUalhpNWRTc1hUVW9zVUZ6VGxVQVFk?=
 =?utf-8?B?bUcycCtxVFc1U0s1eUIzMkpXTytackdiMFplYnF0SUdCSjlTREJFSTR2cEJz?=
 =?utf-8?B?RkFjZXlVRi9TclVZVTVnNEhmTmk0bmNSOTM1RHV6Ympjd3hScHpHQ3ZjUzBG?=
 =?utf-8?B?VU5LR1RVMlhvMW9wYVNuVXZ1OUhZbklkWEFldEFCejl3LzRNRGUzZ2dUa3pH?=
 =?utf-8?B?NnBlUXRJdjYwUWJiYlVMTk5Pc2VWQW9JbDhBbEw3VmZ6YVFEWDZJUjRaN0ZP?=
 =?utf-8?B?ZitPbzBKLzhwUTNRcjVIUGRYRlk0eFBEd2s0eHRJRUdEMXI4Q2xEUjBCcXN2?=
 =?utf-8?B?QjRhZnQzbmtSUEVyaks0TDkxaklJSStQb1JtNkR2ZkVZK250MGx0eW1ma1Zi?=
 =?utf-8?B?YjlrMjZKU3REOFJLKzU1QlIzSzV2YTdSZ2RLZW9iV1ZuVUU5d3FMRmJzMHFB?=
 =?utf-8?B?R25pRGJwbUk0blBtbVFuSmx5anRsSXYxUVgxZEdTVGNqcmJrejA5cEc3RXpC?=
 =?utf-8?B?NEM2WEZaZ2pKT3NIZm9lMFBzYTNGVzI5VC9qT3FUczZyZU1qa2JFaDFHNTdz?=
 =?utf-8?B?VmJlWmozU3o1U2p4Q2pldnAvcUthZDNXZlRWc05tUGxlTzBmTmVvemJlNUFF?=
 =?utf-8?B?QWhWWER6eEJUV1V1OG1GdDJrNTV5LzRnWkNKV1RoUk1LMmVnR0hORUJJWXcy?=
 =?utf-8?B?YmdlUUR0QjYrZU9RZENqbHF5U3R5Z1IyYk9jRzdITkNUak53Q1B0K29lVkJ5?=
 =?utf-8?B?MGdGTVU0eTFCdzhRa0l4dm9LdnlkMTZ3ZjVLRm5uZ2RyRzJVL0lTOVZiSGZw?=
 =?utf-8?B?UG5UekNvWk5wVlZuWE1Cc1BDSDhiVTNZVWFOb24wMnRhOHdoV2IzY3N0VzVv?=
 =?utf-8?B?K1padUc0dS96RFhXWVZ2blplZ3dvTmtLTG1TTWxqemJ3VU5URGx3d2JnR2Nz?=
 =?utf-8?B?THFmdmF6STBzS3U5akp1MlBnUUtXeVpXQ1REalNnamRnTHpiT3FDRHQzRDlE?=
 =?utf-8?B?U2lpZVV6YTJYajNGT1RrMnlyYXJSRnJiQ3YxMjlzL0hsNUQyVmpWTXA5ZnNh?=
 =?utf-8?B?U1JRWDZBYXJVOERHamFpQklsazdTcHVTVCswR0xpOWZDU1VETUFkZ0M5aVpF?=
 =?utf-8?B?UWJGdTRwd0hXWnkxcEI5aStMZlpEaS9KRUFIWjM5S1ZLYkpsZ3ZJVVlGZ1NF?=
 =?utf-8?B?RTRTdk5OTTBLaE5QOGRkR0tUbi9BODZKNnR0UW5KQS95OEFDRHFsR1BCL0E0?=
 =?utf-8?B?MDE1WFRkOXhpT0huMVBqYXQ1SVZIbGhyOTFTNzNsbTNWcjVwNTVOK2VHMWJj?=
 =?utf-8?B?c3VmNXQ5Ym5RYzRFb290LzdyL3ZFbnp5WGNKSENQaWVFeUdTZjJOWmFqMkRI?=
 =?utf-8?B?R3NSa2hkVzdZYWlkNlh5algycFZ5MFdTeldKQ1d3aUd3YnI0QTZudndUTWJD?=
 =?utf-8?B?cjhtQXBPV3Z6TGVCNkpPNFhiMVpoWkFLS28vZ3E1bWxKVW1XeWlZcCt2QWhX?=
 =?utf-8?B?RWhqV2hRTjZlWUd2cDBQay9QWWpKZjRZbDFTQ1piNG9lakNucHlEa1pOL0R4?=
 =?utf-8?B?VXJxaU5sYmNOYkM3V1o0Q3JqSkdRQ0hpMW5iMTNJVDV6dDhqNXljVldqWnpB?=
 =?utf-8?B?Mm9SbmhxZ3E5S1NLYlMybW5LUWtvT0grSHI1OHZCL3BxQ2RyVzYySW9oajBv?=
 =?utf-8?B?eTFoUDM3YzlGRW9QRzQxVkt5RzY3dE04QTZXK1pJc2ViandBZTBkTTlKYnZO?=
 =?utf-8?Q?/TeQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVV4dmhGNmNwcTNFbjQ0WFhBYmV0Z0RTeTVCdk9wUnZCcDQvWWU3OHJObi9V?=
 =?utf-8?B?MXVCeHJTbVFsTXJEUlRDNlF5WjNySnF3QUU4VXhXeUk1aUpVOVlZNy80eU10?=
 =?utf-8?B?cVJ3RFZxNWhDNGpXT2ZvUnpPOERmS25XRUtYTWdxeWZCQngzSDg1SnBaOW5o?=
 =?utf-8?B?dEp3cnl6Qy9ObEJjYzNLdGRTdEx4VEtlV2huK3l1WUlFbjlxRlVzS1F5TUNo?=
 =?utf-8?B?WWpjR2QxVjJOVFJwRXhUSUt3d3NyOFFBdFFoOThaWVBLTGlZdkNYdlBxM3kr?=
 =?utf-8?B?Y0piMStlTUZvOTg3Q0tKMG5yQ3dqRDR0UmRFR3JqRGVyb2kzVTc3c2t0ZU1W?=
 =?utf-8?B?OStlY2JuQzJLSExOaTNub3B4OUVjRUhNN1IveHpwcjJSMzVlemNCRzkzKzJu?=
 =?utf-8?B?QkR2bk5STldKY0wydE9tTkN0RkxtWWJrVEtVblkzMVBYUEdGZFhxVGZBK2tC?=
 =?utf-8?B?c1RvK2xHVUUzcFRjK01lcGF1b1FWb1poYTFBTnppSW5OWGIrTmhrQVgrelNJ?=
 =?utf-8?B?dnZESXJOQXlYNzlEUWVKQkE4TlNUVGNvenpHTzRJamRENzQ0bHdkMlAzdVNE?=
 =?utf-8?B?eWNXWlEzNlkwTDFabG5uNTBEc0w5Y2JsZG5UbXltSHM4cU5PODFpc09CbldU?=
 =?utf-8?B?OXJtNjJpMUhRSTY5NHNLOUtxbmhWakZWUGJxVk1EVmgvT3dBdk0wN0RRM3ho?=
 =?utf-8?B?WW1tT2lndjdXSWFHalBzcVk2L1NkQ2tzb2NqYXJ4ejAwbUlZU2d6UDJ2WE4z?=
 =?utf-8?B?aDIwSTVxUHhZZTFvc29jTkJGRUZhSTJpWE11UlVkWGF4UU1iZFROTHNVY2Y5?=
 =?utf-8?B?Qnh3QnNrcWRidUFmY1NIdGdXMDF0dDJNNWdtUmgydy95bDJtVjY1dHpUbmc4?=
 =?utf-8?B?NEQxWkV3SkdxMnZHY0d4SUlqeFMrWTRqYVdNQWtiVUJldkxoeVdnRjVsQi9N?=
 =?utf-8?B?djNsU2RnaFNCaDBPZXE5aWpaRzVWSkoyWWdYZ0FRZlJXNFNkN0p2MlFxQk5B?=
 =?utf-8?B?U2NRZTFveG50SzlDQlhWeDZyRFZJWlY0azUraWJTdzFPTXlLWUp5dE9SL2xY?=
 =?utf-8?B?Mk1UMjhPc3NnV29wSUsvT01EUGNELzJKcDQ3VG5MRS9PbmVENktFdUtheWNp?=
 =?utf-8?B?c1BBSDZEdHRRcVd1M09QYktsNXJtTU81cnNqUmxBQjZFUUdvRVJYSXJuNUxC?=
 =?utf-8?B?QWk1SkliSlYvL21YRlhBdG9Hc2Qxa011cENQRkVmMmNRcDNxSC9uQS93UmRw?=
 =?utf-8?B?UTFrTXV5cEZOUTlmVUx0bi8zY3FqQzNrdFhkc252TURETjNDVnF0S0hBekR6?=
 =?utf-8?B?YjZlcE1hay9PVCtFK0dLOHFXS0dMNm4xajRPNlpjU2NTKzRKRnpTQTZLUWZa?=
 =?utf-8?B?R20rc0kvRHQvbGp0U0p2THM3VGxEdUI3QlpTWlJQanZMWW9IeHpacCtaWTg4?=
 =?utf-8?B?NDYrSzJvcmNxSk5qK1FtL0gyRTI5cGpFWWRPdGlhWCt6VjBMcTJQL0c2SENH?=
 =?utf-8?B?QkRoWHd4bThJNTlwT3B5TUVOQUxkdWpZR21xOEpoMmFBbmU1L2x3NUNFeElI?=
 =?utf-8?B?K2FlMVNidFZPMjBwS0wxdkxBczJiNkFTYWNmYzE3dUtLK3I2aDQ3aWZzOFdz?=
 =?utf-8?B?VVVUVmJtUXZFZGtCMnVwemNPeWNWaTlkR3R4TjNoSnJvL3BQeVhDZjJXUDVL?=
 =?utf-8?B?S2pTVi9CRlhIM3JvMmJYSEdueG5uTXlFbEJrNitsN29QdEFFRVpodEtobmR1?=
 =?utf-8?B?Tk9McjBnVk9QWVNjcEF4WHIrWkJpeDBCaEI1MXI1UEZFdHpHWWF6a2xMYk5U?=
 =?utf-8?B?ZTlhUnU0aVczOWNBQ1IvcnRPOUIwMmdwMGVTV1BVQnYrL3dpWVBvMlU5RUFU?=
 =?utf-8?B?eXptbWhZb3hGdUxWZTVpdktUZXBYWUlhMTZ2YmNmNlNnY1phMisvbFFyNVRa?=
 =?utf-8?B?TUtCNytiQm1KZ0JFQ056NkJxYUtIZmhHN1VLQmYzWEJBOFRIZ0dwb1BkY3E0?=
 =?utf-8?B?WCtPWFFSejJ6OWQvSVJYbjRvejFEV1pLeWdWTkdTQmVlZUxKZWoyZWJpY3Iz?=
 =?utf-8?B?Vk5GMlpaNUNwdXRiUVZsM3ZNT1hNSHphalB2bmxoZ1hkYWR2bjVjaW5RN2Jm?=
 =?utf-8?B?Q0x4QzBlTzRWWmoxSXVvbGxESHdSQThHM2NwRnhYcjcwd2wrUkx6ZjEzRkpF?=
 =?utf-8?B?OS85OGl4OGt3VUZuQURqUkNXUklqZ0F2V3JGaDd1bGZUMnJtT0lpUFBKM2Na?=
 =?utf-8?B?SmlvQllkSHNCQW9BQzhOVnRrT1JqY0NYeVZ4M0wyNTNOTkhodjRFN0RocU1V?=
 =?utf-8?B?ZkhYd0h1NnJSWmxRV1RHL05GK2p1U0E2TjZNYml3OTIwT0dLRG9HMkZkY2tG?=
 =?utf-8?Q?NqUqddG3xZztKrWs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ff5d63-e384-41c8-e8ab-08de6a0f08cb
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:16:34.1849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqIllJ8OuJ97ULxtVS4TUayhZoXzHpgJpMZzpRfAIxM/6RYRzHALjyzSFu5QFWB6y9N605GARycBcIHIasXHnadqdHch1REYY6M0Wnn7ZXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8341
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


On 2/11/2026 5:47, Matthew Brost wrote:
> On Tue, Feb 10, 2026 at 10:48:09PM +0530, Shekhar Chauhan wrote:
>> The patch should have a 'drm/xe' prefix, missed it somehow. Will add it in
>> the next revision other feedback for the patch is provided!
>>
>> -shekhar
>>
>> On 2/10/2026 12:59, Shekhar Chauhan wrote:
>>> During devcoredump, print should not access any live gt pointers.
> Can you explain 'why'?
My thought process was, if we're accessing the live gt pointer while 
printing (and if the device has already crashed) we might face into 
issues since the gt pointer would be freed.
>
>>> Decouple the snapshot_print from accessing gt pointer by storing the
>>> captured data in a separate list and then print data from that list.
>>>
>>> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_capture.c     | 25 +++++++------------------
>>>    drivers/gpu/drm/xe/xe_hw_engine.c       | 20 ++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_hw_engine_types.h |  7 +++++++
>>>    3 files changed, 34 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
>>> index 2f5816c78fba..0555fb07c499 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
>>> @@ -1695,8 +1695,7 @@ static void
>>>    snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
>>>    			     u32 type, const struct __guc_mmio_reg_descr_group *list)
>>>    {
>>> -	struct xe_gt *gt = snapshot->hwe->gt;
>>> -	struct xe_device *xe = gt_to_xe(gt);
>>> +	struct xe_device *xe = snapshot->xe;
> If an Xe object is available - so is a 'hwe' and 'gt'. All of these
> persistent objects created during driver load and the memory is free'd
> upin driver unload. i.e., It is not possible for a GT or HWE to invalid
> but to have a valid Xe object unless I'm missing something.
Yeah, I just realised that my change doesn't make sense here.
>
>>>    	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>>>    	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
>>>    	struct gcap_reg_list_info *reginfo = NULL;
>>> @@ -1806,7 +1805,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>>>    	};
>>>    	int type;
>>>    	const struct __guc_mmio_reg_descr_group *list;
>>> -	enum guc_capture_list_class_type capture_class;
>>>    	struct xe_gt *gt;
>>>    	struct xe_device *xe;
>>> @@ -1826,8 +1824,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>>>    	xe_gt_assert(gt, snapshot->hwe);
>>> -	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
>>> -
>>>    	drm_printf(p, "%s (physical), logical instance=%d\n",
>>>    		   snapshot->name ? snapshot->name : "",
>>>    		   snapshot->logical_instance);
>>> @@ -1841,23 +1837,16 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>>>    		   str_yes_no(snapshot->kernel_reserved));
>>>    	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
>>> -		/*
>>> -		 * FIXME: During devcoredump print we should avoid accessing the
>>> -		 * driver pointers for gt or engine. Printing should be done only
>>> -		 * using the snapshot captured. Here we are accessing the gt
>>> -		 * pointer. It should be fixed.
>>> -		 */
>>> -		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
>>> -							capture_class, false);
> Again unless I'm completely missing something this is accessing driver
> persistent data which seems fine to access during
> xe_engine_snapshot_print... What we shouldn't do during print is access
> the hardware which is not what this is doing.
>
> Matt

I was under the impression that xe_guc_capture_get_reg_desc_list is 
accessing the hw, so better to store the data while capturing and then 
print it later with that list. If that is not the case, then I think the 
FIXME which is present above is wrong.

-shekhar

>>> +
>>> +		list = snapshot->list[type];
>>> +
>>>    		snapshot_print_by_list_order(snapshot, p, type, list);
>>>    	}
>>> -	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
>>> -		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
>>> -							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>>> -							capture_class, true);
>>> +	if (snapshot->render_compute_list) {
>>> +
>>>    		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>>> -					     list);
>>> +					     snapshot->render_compute_list);
>>>    	}
>>>    	drm_puts(p, "\n");
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> index 4d3ee5226e3a..a246b4f860e6 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>> @@ -923,6 +923,8 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>>>    {
>>>    	struct xe_hw_engine_snapshot *snapshot;
>>>    	struct __guc_capture_parsed_output *node;
>>> +	enum guc_capture_list_class_type capture_class;
>>> +	int type;
>>>    	if (!xe_hw_engine_is_valid(hwe))
>>>    		return NULL;
>>> @@ -941,6 +943,24 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>>>    	snapshot->mmio_base = hwe->mmio_base;
>>>    	snapshot->kernel_reserved = xe_hw_engine_is_reserved(hwe);
>>> +	snapshot->xe = gt_to_xe(hwe->gt);
>>> +
>>> +	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
>>> +
>>> +	/* Capture the register list */
>>> +	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
>>> +		snapshot->list[type] = xe_guc_capture_get_reg_desc_list(hwe->gt,
>>> +				GUC_CAPTURE_LIST_INDEX_PF, type, capture_class, false);
>>> +	}
>>> +
>>> +	/* Capture the register list from RENDER / COMPUTE */
>>> +	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
>>> +		snapshot->render_compute_list = xe_guc_capture_get_reg_desc_list(hwe->gt,
>>> +				GUC_CAPTURE_LIST_INDEX_PF, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
>>> +				capture_class, true);
>>> +	}
>>> +
>>> +
>>>    	/* no more VF accessible data below this point */
>>>    	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
>>>    		return snapshot;
>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>> index e4191a7a2c31..87ad1e68fb47 100644
>>> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>>> @@ -6,6 +6,7 @@
>>>    #ifndef _XE_HW_ENGINE_TYPES_H_
>>>    #define _XE_HW_ENGINE_TYPES_H_
>>> +#include "abi/guc_capture_abi.h"
>>>    #include "xe_force_wake_types.h"
>>>    #include "xe_lrc_types.h"
>>>    #include "xe_reg_sr_types.h"
>>> @@ -167,6 +168,12 @@ struct xe_hw_engine_snapshot {
>>>    	char *name;
>>>    	/** @hwe: hw engine */
>>>    	struct xe_hw_engine *hwe;
>>> +	/** @xe: device pointer */
>>> +	struct xe_device *xe;
>>> +	/** @list: register list */
>>> +	const struct __guc_mmio_reg_descr_group *list[GUC_STATE_CAPTURE_TYPE_MAX];
>>> +	/** @render_compute_list: render/compute list */
>>> +	const struct __guc_mmio_reg_descr_group *render_compute_list;
>>>    	/** @logical_instance: logical instance of this hw engine */
>>>    	u16 logical_instance;
>>>    	/** @forcewake: Force Wake information snapshot */
