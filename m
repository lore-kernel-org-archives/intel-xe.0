Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826A7D11715
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 16:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9F510E49C;
	Tue,  2 Dec 2025 16:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RfEpgcle";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3CF310E49C
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 16:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764693774; x=1796229774;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=U7VYnniKoWIOJPGqWt2DyVzEOqFjBeuKuKHYUODc5+w=;
 b=RfEpgcle20psopEqmKR4UXT0meUItrFIhsQXmyxllQ+Uh23aBl56SxLB
 ibB5szi036kjw8U9mYuoTBjGTxIpU3A9mE102KwKBFDNhzZOalG26OpFW
 7iilABBd+fxZL+4SlenfIEFttQKcKauhS3VliHCDSYUZvZQI6oOlJDofq
 0yXpuP5bGIVab3CwQZEXUh8oD6GBFSOVWThA3/louAkBxh1i9V6vNGBr0
 OOse2urxJA9SgujKfawHWS5TL22ykNF5A0Dp7X+ai8qoRyIDOqOT2qFGq
 ZIlTl3kMG5y/C+VEM6JNt/p2ep1U6wUZ5JiZ0M/bUf0p9bZSu0VgqLEjx g==;
X-CSE-ConnectionGUID: GW9+UThvQF+P6Vy217IZ5Q==
X-CSE-MsgGUID: oDckhgn1SvCvqedg8pEOLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77774461"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="77774461"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:42:53 -0800
X-CSE-ConnectionGUID: IAfjaxZPTqGN2lj1TsxtqQ==
X-CSE-MsgGUID: 4B6+zDS7RFesX3ZBdvAtDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="194260205"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 08:42:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:42:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 08:42:52 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 08:42:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aN0x/PCZpEcbcCBUeP+OBL9hBZVTriunuDyY7O7O9Syqq10e2zx8Fjy0y6zUlKPo38+6V9brxjps1TZ+YH+3b/3j91LHTuWhrqTWxQDTmXk+h3OCnvFTQhWZeLlauBC2SRwulHCFnSLjqco0WD8Zcuz/Yib8ZcKG8DyLFR34Onwkea7oyvLPu9uPm6BiCciwB9EZmZHc2B33JdMO3mlSnwm8vD0sLC5EuLGw+iOAJNqlRH1LTD5vLP3CXTL8KK9flp+V8aMhSt57zN+UwxZhQWQJc4WOTxZgM4AtW8fg8sWI7iGMngvYqfttkFdfnAnBL+49BCHB9sk7c0Km7Q3CLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AY+MYRLHY1qDbvDj828QSHRsjwklTlmsDAb1zlSQeQ=;
 b=GcTcioq4dp/Wbd2nFiYu0vfSSt0ZUsr4o+haeMq2ZD5sI7Z1KBcyVidJLZb3mx/61wTztZGa97dFH6A8S1PqAq3cwgMms+1PPd8QQ25XbhADvQvDC6DgkEkAtRxtCqwJxSGH3uCiu9Nz8b4RctCBVgFILBAJ4ATCwc91KYKbNpX0MrxJr2TMCWeqhftyW1FwW9VL1NZQ3MKqSiRZ57UM+Dp92O2rPdoCkTU3fjERa1vIEvBICv1s6nZatwFiomFQIKiQpCDBVIsTQpfEJkqsfkAmW0YyIPUxmRZvT3uR7bGpAFAqoYMx3CB+NMVqbcnYXoucQ6A9cn8fAN6hciOvIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV2PR11MB6022.namprd11.prod.outlook.com (2603:10b6:408:17c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:42:48 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:42:48 +0000
Message-ID: <bd74d348-a8bc-4723-8148-31641be1b012@intel.com>
Date: Tue, 2 Dec 2025 17:42:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/xe/sriov: Prep for multiple exec quantums and
 preemption timeouts
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-19-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251127014507.2323746-19-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0012.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV2PR11MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: 39aa065e-2344-4c70-21b7-08de31c1d392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHZyTStwY2NwWS9GenU4R2Z0SU5pdnlzUzJtN2laKzdwb0NCbTMyc0pvNzNs?=
 =?utf-8?B?ZXh2Qm5zM3BUYVowU1ljZVZ3UEZ2WGo1TCtTVE9jZFlMckNiNWJId3NnSEp5?=
 =?utf-8?B?a2wzRytWVXRIVEllS3hKY1EwWnpyWng3RllOY3pEZU5ST0xHVDAvUkQvanFp?=
 =?utf-8?B?QXBPazJJclpPa2p0K1RTQ2tTaGQ1TnhGZGVqaUpQZHRidm5jc2VBbEF6ZUtw?=
 =?utf-8?B?Zk5tcDdKVS9QZHR2bTM4YXY4elA2S0VJVTVqOHIzZko5UG1FUjBJQ2hBbU44?=
 =?utf-8?B?dkk1akR4U25yQ0QzeXJzdVlGcnZCcHFNdEJPZGlhWkpOZStobnJhUHg5VS9U?=
 =?utf-8?B?N0dHUnp5SWtvUDZMNVhJTTlHeFk3U2ZmRC80UXNwcVVVSkt3WThmTVc3a3U2?=
 =?utf-8?B?cU05YXl4UUcybE1qRGdDdWpVa29ubHowM3BIaDNIZlZMUStneS8vbVlJSFN5?=
 =?utf-8?B?bFdwZHo4RjJRdE1yb1lhRmtnUWJKdUFlTjJSMmM3MUVVejlKSlFUbG4zRWFD?=
 =?utf-8?B?R3lNVUN5dTZUbGNNekxtRWJhT2NIMlE5Y1lsN2NSbjFHWldGNG1iVWxQakJo?=
 =?utf-8?B?VjZ2UlJyQXBoT3pYdmZsTUlyYSs3eDdndmdFWVh5eVNRcE5QakJmcDVLU0h1?=
 =?utf-8?B?bW5HMTVmbmtmTi9qUytsU1B1UFV4ZVJ4d1czRnVrYUZsWHk0Q3lkeC9FbXRE?=
 =?utf-8?B?bWlhbTQ4RVFKdFAvQzMwejJpV1o0MjNpNjRuZCtscXZYamt5NEYzM1dnQkJ0?=
 =?utf-8?B?RGF6Q3NhZENEaXNuNjFkTGcrYThKbnIxMWxndGFmMlBPTytHeklLRmRFdCtS?=
 =?utf-8?B?TVlUNUwvakE1UmVwZ1BvbzlhR2tya1EyQW1WTjh3SlpwV0F3Sy9WRHBmTm1C?=
 =?utf-8?B?dkZzOXlGNk9ZdU1JNFNDQ2RLYVhuQVhvbzd0WEdRZXgxZzJhSCtVNUswSXZO?=
 =?utf-8?B?bkZxRWY5L3FhcDE1S0NxZ2c5SUtpR1ByNEVyU1RoZ2JmWmRhR1FXUUJkTHZG?=
 =?utf-8?B?YUY5NU5MOGZ3RkhpN3ZxL1pZdUdLaVdRTnNNOHRPaXgzK3dpOTJFRU00aGFo?=
 =?utf-8?B?RFhYcHFQdXUwTzFjYWE3S3VzRkZMTktYcU1EcUdnK2t0OG1LcWxoMjNiWmtC?=
 =?utf-8?B?M1Z6VEcxNE02Wk9lUUlqRVQzZk5xWGpRSmcwZDJCWmhPVlBOTzUxVTNXZWdx?=
 =?utf-8?B?am42Zmk3ZHpLWjFZRjdOOWI1MUFRVkpiVzVhd0hETDlYSVA5QzFVZng0UW13?=
 =?utf-8?B?R3BOcUNXSkN1NmJub0NNWkxoblpTNVNaSEhzSnBuSWZFeGlKWk52L1VnRkRJ?=
 =?utf-8?B?QWlDcXJaa2xxM1ZTaEw1SE1ac1lpVVB1bVpmSkJlMDNWMGRZRzB6SThlby9Z?=
 =?utf-8?B?WTU0Q3FiQkZqNmlDaGwrNnBqMnc2QzEzMTc4dElodWZDaEhKVnQvN1h0RXpr?=
 =?utf-8?B?YUREWVh3NVpwdXVpZmsvdlc1ektFZWFxNFROQit1WVZaQTlETUh2bHdIQjRL?=
 =?utf-8?B?ajV6YUtONkR0VDYvREhSTm9zU05yZEhVT3d0VVJsTzdSNDFSWVA1SEJsYmtN?=
 =?utf-8?B?R3E0QVNENkZWWG1zeEN5MEZ6TUQ1ZStWZ0xZVU8wQ0psSWlsZWs4OCt2U243?=
 =?utf-8?B?YXhpdlJwYWZGNlZ5ZDRUNGNCR2RpUS9LN3BjbHgrZ1Z5UW5LYnZTMWUrUEJ0?=
 =?utf-8?B?S0lwbDBwQmc3MUNLVlRaK2F5azRqdU91NkdmNG9BMjcvNzlXWm1Vc0VDRW5j?=
 =?utf-8?B?a0RUM1N6R3VVbElkNlhkMWw0RDFmSGFUVUIwZWRBK3hvQlB1L1JCaFpHWkN4?=
 =?utf-8?B?em9qVUdtaTdNY2FqOHpVd1Y3SVNOazZWTmF0QXJiUjUySExBbWVENGdmQ3dB?=
 =?utf-8?B?bHZrOW5IOW4xSk1weEpaa0JOVHBydTRMMVVrdGxHbjFkcXJTbEl5YnpwYmtk?=
 =?utf-8?Q?9UeTkSbSHwMdyfFnYssEU7k3CVpDIHrV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0dFNk5hUkFNS2hsUGltYlppRFY2V1FhR0FhZnAzVERiM2hnbThQRTdhVXBj?=
 =?utf-8?B?N2RxMDF3STFvZGFNUWJ3cGN5bmtWeDBzQlNBNStYcmszd1pFek0wRzJKVWE3?=
 =?utf-8?B?aVliL3pwR2FXV2duYXJLaG1tWkdDVGR2U3ZvcXhVNHRPZks3ZUxhekpJM01r?=
 =?utf-8?B?RW9iYm80Zi9tM25qZDQ5elp2a2dwQU0yQlRvU3hYWEp2RkhoVytvU2VYTkxH?=
 =?utf-8?B?SWJacGpsNEJ2a2xuVkpNQTlFUmt1VDZKd1UveVF4blNhYWtGZ21valNQTGhR?=
 =?utf-8?B?UVRpaHpVSEpiUzdZOFB3dks0NytWaFNLWXRVOHUzTUpIZEZFeHZFcFZxbndQ?=
 =?utf-8?B?Q1R0LzczWjNnZmJaQ0loYS9vK3l4clNWSER2RGRMcmFGVTFFZWJxSzRpb2Rp?=
 =?utf-8?B?VzkvL0ErZ1BvVUg2d2cwTTBNa21CRmp5ckRzMkpZZk1PNkx2SzEvczVGVTZD?=
 =?utf-8?B?RkpyRE1uVVNmVU0zcHp5VWdmV1JlZytzb2ZmVSs5YThQWXY3MVU1R3Bpa1hM?=
 =?utf-8?B?VEdEaHkvTWNrWWQ5cVRMK3gydFFyc1I3RXhYRVBHdnNZSEJGTmZ2T3RPc2Fq?=
 =?utf-8?B?NWFqdXEzMERiQ2tSMFN5aG0yRDgrQTh1VTlyWiszOUFRMGdDbThqQXByaGNZ?=
 =?utf-8?B?S2J5Y0FSZktNSUJzQ0lHeU1YNFdOQ1BhMGdkWkYwU0lyeDdFMnhWdWJRL1FJ?=
 =?utf-8?B?RlJWazZqeldWbWxZNEJ2Rjg2Z3RmUkZyZmdnd29MMzcxYm1odnlmU3VxUk9K?=
 =?utf-8?B?WklZUCthYVlwUnEzK3V0b2V6dTQ5MGZVR2Jaam5YL0V3ZGNyc0tlVmR0Z2Fv?=
 =?utf-8?B?U3NUdm94ZUtZNThKcVR0VDhVb0M4WkE2bnYxSzZqa3NsNUhiUFFYNXpIdHJl?=
 =?utf-8?B?TU9DeDlsTFdyS3FCN2ZXOTNKcG4vRW5RMm5QN2M3Q1Z5YXJaU0dycFdsSHAw?=
 =?utf-8?B?UDBzQkYvQmJSL0JTb2k4RXh0SjBOM2ZZeUh3WnI0VGEzUHNlRWhEeW9XWkg3?=
 =?utf-8?B?QkhDRUkrYjNhdGZzcDlDSXNONHRYK1BWRDZDbnpoMjZhdTYybWpXcTVMRVpF?=
 =?utf-8?B?dnZoMkJLclRVd01hN0JNekRZd1BMR2tNdldmZjlMVkN5dnluYmFINVlDaUQ2?=
 =?utf-8?B?MjVZZnByU005US8wYTZpUHBseURvbHlkNHhReFJ1eDQzVGdNL1IzRE82RHpo?=
 =?utf-8?B?cTFobjN2SmxzREx5WSt3L0FvTFR1ZWsvWGx6LzFGdS9zN1pKR2hCM1hRcnZM?=
 =?utf-8?B?ZzhnbEh5YnFjNDVYa0xYZ1VXQVFwYWJWN0VJQjJ3MTd4REp0aWtCT1JCeUtT?=
 =?utf-8?B?QmZBaEJ3Vnd5M3l6YjM4Y0s5UzFUZjU5SEw0V0laVGFWWFRvR2s1U0wzNUo3?=
 =?utf-8?B?di9NY0xzbGtmdTkzM2xXc2ljVFh3Vk9hMWRrbUc0VW5jYlJYUnRmYmM2MlFR?=
 =?utf-8?B?UXZkanhpay9xWFZ6cURSOGd1R1VYQnZGL1FFUitxeHlYOVdrcXB0dkRuM2Za?=
 =?utf-8?B?U2RKTWZNUm12ZEdoQzA1T3h4aVc2RHhtKzJYMDBEU3U4dCt2QzBoOVRoN2R2?=
 =?utf-8?B?ZmNhU1gyazg3aXhSMTdFaTRLdG14RGZGbm0wOFNIaGhoRzdvei9OMW9mamxo?=
 =?utf-8?B?V2E1YXRqRjViUnZQdmt3a3YvUDZZY0F5TkVwZnZxajdtNlNKbThYYldWVUJI?=
 =?utf-8?B?b1duMlgwbmFzNmZKUWR2T1F1MitNTjlZRTNiTmdZbFZ3NU4zRXpIYU9tRkdm?=
 =?utf-8?B?MDFocEJUS2RvblJra1g2YU40OVlHQzF4ektCNVBCR2V6dWJxcTFtalQ0MW9V?=
 =?utf-8?B?d3g1dkxwTnBnT2hCYlBSR2JwU2pJTDdSMytSWDBuYThSZDMvZkp4WTE3YTlS?=
 =?utf-8?B?MWFORWtCdFVYTlJVS09IczR4WjFOakcvYkxkNmJ3VURRSEdUaUZDWWE1VWpj?=
 =?utf-8?B?L3lKNE5XZEJRZ3dXQlB5YWV2OHZZYVNzSVREVlJUaVEwZWtFeXJURUdCR2tr?=
 =?utf-8?B?Z0Z4SngzejQzV2pBOHBSc0NDRnFxQy9FZjNxR040ay9hMTVOQnVVenE4eWo1?=
 =?utf-8?B?WjJqNEExenpSNmRsdzFhTnBhSWlxNW5EajE1SVZ1TDRneDBwdkxjUHcybUlB?=
 =?utf-8?B?U3czLzlxZWtNa2o4aHNFbzJKS0ZhOEZNOFNqa3U3VS9FY0h1dG9UdnVpc2ht?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39aa065e-2344-4c70-21b7-08de31c1d392
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:42:48.3135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ImdMxItdE6pduA0roFF0HbF0zQob7EHlGJX09D0NYiVyiMiJQjCwKyMtHiHmBNLC5ryRZhSq7N8o/K2u02+PDdGUTwDoqZjmhV+uB+vL7kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6022
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



On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
> Each scheduler group can be independently configured with its own exec
> quantum and preemption timeouts. The existing KLVs to configure those
> parameter will apply the value to all groups (even if they're not

typo: parameters

> enabled at the moment).
> 
> When scheduler groups are disable the GuC used the values from Group 0.

typo: ... disabled then GuC uses ... ?

> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  7 ++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 25 +++++++++++++------
>  .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |  5 ++--
>  3 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index a6dce9da339f..48f47e26132d 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -290,7 +290,9 @@ enum  {
>   *      infinitely long compute or shader kernel. In such a scenario, the
>   *      PF would need to trigger a VM PAUSE and then change the KLV to force
>   *      it to take effect. Such cases might typically happen on a 1PF+1VF
> - *      Virtualization config enabled for heavier workloads like AI/ML.
> + *      Virtualization config enabled for heavier workloads like AI/ML. If

start with new empty line so it will rendered as separate paragraph

> + *      scheduling groups are supported, the provided value is applied to all
> + *      groups (even if they've not yet been enabled).

should we document also here that "The scheduling groups are available starting from GuC 70.53" ?

>   *
>   *      The max value for this KLV is 100 seconds, anything exceeding that
>   *      will be clamped to the max.
> @@ -312,7 +314,8 @@ enum  {
>   *      In this case, the PF would need to trigger a VM PAUSE and then change
>   *      the KLV to force it to take effect. Such cases might typically happen
>   *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
> - *      AI/ML.
> + *      AI/ML. If scheduling groups are supported, the provided value is applied
> + *      to all groups (even if they've not yet been enabled).

ditto

>   *
>   *      The max value for this KLV is 100 seconds, anything exceeding that
>   *      will be clamped to the max.
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 59c5c6b4d994..eb547fedb6da 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -298,10 +298,10 @@ static u32 encode_config(u32 *cfg, const struct xe_gt_sriov_config *config, bool
>  	}
>  
>  	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_EXEC_QUANTUM);
> -	cfg[n++] = config->exec_quantum;
> +	cfg[n++] = config->exec_quantum[0];
>  
>  	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_PREEMPT_TIMEOUT);
> -	cfg[n++] = config->preempt_timeout;
> +	cfg[n++] = config->preempt_timeout[0];
>  
>  #define encode_threshold_config(TAG, ...) ({					\
>  	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> @@ -1857,12 +1857,15 @@ static int pf_provision_exec_quantum(struct xe_gt *gt, unsigned int vfid,
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  	int err;
> +	int i;
>  
>  	err = pf_push_vf_cfg_exec_quantum(gt, vfid, &exec_quantum);
>  	if (unlikely(err))
>  		return err;
>  
> -	config->exec_quantum = exec_quantum;
> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)

maybe:

	for (i = 0; i < ARRAY_SIZE(config->exec_quantum); i++)

> +		config->exec_quantum[i] = exec_quantum;
> +
>  	return 0;
>  }
>  
> @@ -1870,7 +1873,7 @@ static u32 pf_get_exec_quantum(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  
> -	return config->exec_quantum;
> +	return config->exec_quantum[0];
>  }
>  
>  /**
> @@ -1987,12 +1990,14 @@ static int pf_provision_preempt_timeout(struct xe_gt *gt, unsigned int vfid,
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  	int err;
> +	int i;
>  
>  	err = pf_push_vf_cfg_preempt_timeout(gt, vfid, &preempt_timeout);
>  	if (unlikely(err))
>  		return err;
>  
> -	config->preempt_timeout = preempt_timeout;
> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++)

ditto

> +		config->preempt_timeout[i] = preempt_timeout;
>  
>  	return 0;
>  }
> @@ -2001,7 +2006,7 @@ static u32 pf_get_preempt_timeout(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  
> -	return config->preempt_timeout;
> +	return config->preempt_timeout[0];
>  }
>  
>  /**
> @@ -2180,10 +2185,14 @@ u32 xe_gt_sriov_pf_config_get_sched_priority(struct xe_gt *gt, unsigned int vfid
>  
>  static void pf_reset_config_sched(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>  {
> +	int i;
> +
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> -	config->exec_quantum = 0;
> -	config->preempt_timeout = 0;
> +	for (i = 0; i < GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT; i++) {
> +		config->exec_quantum[i] = 0;
> +		config->preempt_timeout[i] = 0;
> +	}
>  }
>  
>  static int pf_provision_threshold(struct xe_gt *gt, unsigned int vfid,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> index 686c7b3b6d7a..abf003946242 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
>  #define _XE_GT_SRIOV_PF_CONFIG_TYPES_H_
>  
> +#include "abi/guc_klvs_abi.h"
>  #include "xe_ggtt_types.h"
>  #include "xe_guc_klv_thresholds_set_types.h"
>  
> @@ -30,9 +31,9 @@ struct xe_gt_sriov_config {
>  	/** @begin_db: start index of GuC doorbell ID range. */
>  	u16 begin_db;
>  	/** @exec_quantum: execution-quantum in milliseconds. */
> -	u32 exec_quantum;
> +	u32 exec_quantum[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];
>  	/** @preempt_timeout: preemption timeout in microseconds. */
> -	u32 preempt_timeout;
> +	u32 preempt_timeout[GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT];

maybe we should rename

	GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT
to
	GUC_MAX_ENGINE_GROUPS

and make it independent from KLVs and define like we have

	GUC_MAX_ENGINE_CLASSES


>  	/** @sched_priority: scheduling priority. */
>  	u32 sched_priority;
>  	/** @thresholds: GuC thresholds for adverse events notifications. */

