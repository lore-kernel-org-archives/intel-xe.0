Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8196BC04FFE
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 00:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E919310E0AC;
	Thu,  9 May 2024 00:25:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzYLEqmu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522BF10E0AC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 00:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715214343; x=1746750343;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LLZN2b9vUo6LZdAUrDUBLth33YDEmT7ZoRvrnXHiBJE=;
 b=lzYLEqmunXUJ8V3PU6YiXEmdawi6QrWdi9vOaJ4lHMsGdwDTMrGpRUjE
 iOGTGCfDw8jUUMjDuXkk9E7BTPZ94QVVAtimm7z/0F7plyE2SxO3t1AUB
 yGJFiW0cePtBcoZyzVNonGtXj1JJSOADXyyS/LT4EhQ2hAYqMlSVNKvF9
 fsh5kmaOW8ViyCyHpP17F2BDB2WAlEm6q9Czm4oRbKPqDMegLgFu4QYmJ
 ViMvq/NIe0VA15GlQ4q/AyFxTpXiwa5IbjT/4C2lyD/K9tayBbDfIpQ4Y
 UaV2mGbBmY9vW6aP0jaVrI4fkbeOvkRCKMSELAjYtsbnoYVqGkSmYJNHZ g==;
X-CSE-ConnectionGUID: PWNLrcbQRp+EpOGEltKsHQ==
X-CSE-MsgGUID: L7r2fPRMT6KLUwYJFPV1cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="22502367"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="22502367"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 17:25:43 -0700
X-CSE-ConnectionGUID: AYsrivQFRLijVDRXlP7XDQ==
X-CSE-MsgGUID: ITtJvlS6THG1ttpoeKjJmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="29588699"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 17:25:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:25:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 17:25:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 17:25:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 17:25:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ewf2gBhf7O6ZNfGkCiSeDa6QH/owMWC1jmjUVLijroxqXyxCIL+QuQwbUofzkVMzREAKEEoRitv8zTP6QiVixSuqC/RAGk4esqCeWb3ETCN7N4euIXaPrci+0yxeT5fgfcGBWYhDXrvwITkEWMpEL2gq+DQt5tKIR2DTl/hvns0pKQE0REUAP94khaJxunqEMGp57NZAXbIAsg/1AcekTJX9Czb5AWlysInXxiRJKq/85KKBaC2C2btQagHTSfXkiKQjNtGuQnOqi/3Dn14qqnNpKEVneduf78F3aoWwHm/xywnJ7b0Bdcoe65RhTt6DS5VPVn0FTMoJF0PhRhHskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLZN2b9vUo6LZdAUrDUBLth33YDEmT7ZoRvrnXHiBJE=;
 b=ZNLWnn6u2uLkvp73f1JZooxCvNh0iV5iJpJ9a1ACA/xO9qjoo886N3uTx7msf87QEn22tLgNBex9/Wn8UX3yR+sxIuuZGQFO0PTRrEANgM7mj6R0wXAdF419a51iOxpSEdbZlnIM+NJTt3MwQxtgvFlipER/pXtRkYkxXHngqYbpKdBOHTz0xC3H5/zc5VUaLvoveJiDthyybCMRqE10qqte96TTtVPkPcG9Fs505wRUlOtVawp4onXKLD4i0EfFa5bZo4+miIxIygyPdeYLg1FhSMOgDt9b821X4phU8afjlRroSiJX5R0jHznyuLi7mLjRi6MVos9wptPTaGJYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SJ0PR11MB6672.namprd11.prod.outlook.com (2603:10b6:a03:44c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Thu, 9 May
 2024 00:25:39 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::513:c8a5:7031:dc2c]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::513:c8a5:7031:dc2c%7]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 00:25:39 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Thread-Topic: [PATCH] drm/xe: Fix UBSAN shift-out-of-bounds failure
Thread-Index: AQHaoFaqzr0e9d5gtk2DaEVVv7JPSrGLvW2AgAAkHICAAiwGkA==
Date: Thu, 9 May 2024 00:25:39 +0000
Message-ID: <DM4PR11MB5456DE457A372789DE992861EAE62@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20240507080456.613786-1-shuicheng.lin@intel.com>
 <20240507130411.630361-1-shuicheng.lin@intel.com>
 <8e7aa310-25f3-4318-aa99-20b39c6e438e@linux.intel.com>
In-Reply-To: <8e7aa310-25f3-4318-aa99-20b39c6e438e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SJ0PR11MB6672:EE_
x-ms-office365-filtering-correlation-id: 8bd4cbd4-b86b-4ae6-ebd8-08dc6fbe8de2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?R1l4S043aU13a1VKZVVGeWNkbVU4WGdZWURKM3V3K3JvL01ESlNMQmkzakMz?=
 =?utf-8?B?bmFCU3JGZUY5YnBlc2pyZDEyeThtZlVDMmtqK2xuQ0pUT3JKbWh1aUpXcFVu?=
 =?utf-8?B?aEI5YWJhZWhnVWVJa3NpYmNaMGE0YmNZNVdsT0lScmpLUjVEMThCOVhmUGpU?=
 =?utf-8?B?Q2o5aEtvS0ZJakcyZFdsRVlPY1FQTHdIaWxwcGlteWlac3hmV1FlVVFoSFpX?=
 =?utf-8?B?TWdpMlNoSSsxV3BTdlV0eXNDSGRpRWdkd1I2d01iTC9mdCtLY213ekpJUHBh?=
 =?utf-8?B?WTlhRlU5NzQ0OUhPWFhjUlgzcFN1MWRHK29nUHhaQ0taTDNOZnhXZHBmK2ZR?=
 =?utf-8?B?SW43OGRTa1FGMm1vSmx1dFhCTkxncTNmNjJOMlI4dCs3MVM1bGJEbHppTEtG?=
 =?utf-8?B?dW12YkNHbUlxK2xSTllVbGZtZmxXV2tJS1p2Z1hlbnBTU3RWaDZVV3lNUUhx?=
 =?utf-8?B?T1RnSTBCZnZqUGYwQy9yc01la21yRzRHTm1RT3FWZ2lVNFp1RWtTb1hyTmJH?=
 =?utf-8?B?Z1Q3a3ZIaFpsWHh5N2NxaXlEVWhOQ3lrWUFqazdVQnhYY2ZVUGxoK3cxQTgr?=
 =?utf-8?B?ZEh6VkdMUDFKK0VySjl3bDdHREl5UEJ1N2ZZQkZnOEhpQmdyZHlwY2F1aGYx?=
 =?utf-8?B?UFJxZjI0NnhQRXNsUFR3Mk9sWnhDZHNjNXZaZGdBclU1VW1kcjk1UEhHemty?=
 =?utf-8?B?N1RKK0hsVHJ3QVk5VXNsMUl5KzdlSTNwTzdMN21yQlZxMWdTSnRDbTV4RGNk?=
 =?utf-8?B?V0l3eHpOM3J1bnRoNnFWaTJUTEpEMHJDL0I0Z0xxQWZMekI2TGtHYlVLVVZT?=
 =?utf-8?B?Mm53bnFhK2FPVTF3TlNQeHlNMHh4MllLOTRRZk5pOFAvZnhoUE8wTXFZUCtO?=
 =?utf-8?B?OVB6ekhhQ3dWMU1jV25TdU0weTFqODJPaS9mNk02M040b0U4Z2ZSQkpMY0N6?=
 =?utf-8?B?NjJRQ1BpeHRPb1hEdEdJZjM1aysvK0xLL1FYdVJWT01GdUJkMnI4Szc3RHhM?=
 =?utf-8?B?Q3VZaVloVksrWEFOZ1R2M0Q3ajZ4aXJpeUxKUGZCay9tVWxVNUdkcldYckZ3?=
 =?utf-8?B?TS9JVm9aaVYrYUtoeDhSNVVQRFhibkhGSVR2ZkU2UmJaZ2J2RWtRS1U1VXdK?=
 =?utf-8?B?S3MrSGpMTyttQTdHTW14SFBXTDVlaWdqaG9lUzBMUW1IYVk1ZmRPQUxMTFBs?=
 =?utf-8?B?dEwxOCtxM2xYUExOcHFYOSsrcGYyTjQweURsVXpNRU9lSFptZnh6WC9HY1Zy?=
 =?utf-8?B?WTdkdGhIZHg5a3lFQWROTERBSkNDSi9BQ21XaDdGTWlBSjBIYWZ0QkR0TXZF?=
 =?utf-8?B?aU8rNDQ2UUFoeDBTR08wd3MvSFRzN0pnUjVoZGZ4VUI0anRmS1FXWUZhNjlx?=
 =?utf-8?B?ZEdmT3R6cUpmVk1jWWQwUEw5Z1VDZUtvUncybXVSdG5TejgxU0hWMDQzT2Q1?=
 =?utf-8?B?RWZIWkZ4azVDUDBmUWNJVDIxV09UeFIxOU5EbVRHN3NxSjZrN01haVpTVFJ0?=
 =?utf-8?B?Q2JyZlY3b2tlaFR5UldpcE82TU1ZNTJlOGJsbjA2QWsrcGlXS0dTTmRoOHJu?=
 =?utf-8?B?cWE1RDNwMmp1UmpNSUkyV25kZ0NiQUlCWjZ6R2g3NkRFM1gwN1REMnlHL3E2?=
 =?utf-8?B?VWgwbFU5bW4zY3VTTEd6N0NxNFFkWUR2SnljaGt6bE9jL3ZBUkI4bWU3UGJC?=
 =?utf-8?B?RjFjTWRLdC82TlM3Qm92eFVMV0hlai9kcGVxcU5JcDJ5T0RxZG00aGNveEJQ?=
 =?utf-8?B?OG9PY04rMVQwL1BybTVxYjFoQk8wcjFhN3JBQUJoMXB2R2pFVk5zK0lxN2do?=
 =?utf-8?B?MG9HNS9LS1NxZ00xd0N2QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUhsZHhvbmQ0c0pUa3dubVVNbThkUU10em92ei9iZXBsR1V5LzJ4UDJPNEsv?=
 =?utf-8?B?NGp0TFZwM3BmWWtER0FFNnVnSDU3cTNTUlNCVGhYM01PTm9EaWNDeVpINHhX?=
 =?utf-8?B?V2YwaGMxbnA3aVV2QkF6UUJSNXJDNFlzSi9EM2dOOTJSV3RKclRJM3I3MkNC?=
 =?utf-8?B?RzhSai9Qb00yUmxIaktGNTJKSDc3VGRxWlZKSXcwaFExSWNWSXlPM1QwMHNl?=
 =?utf-8?B?d01Zd2U4eVVoMHljUzAxTjFaSDZQb0tKNk5qL3A2U2VVTVZxcmEvVHJPemwv?=
 =?utf-8?B?OGc3aWhyR09OL2V6Z0tMMFZKQi9hQ0p1TU1pNHRPV1hTMENZdE5NZEJkRHZl?=
 =?utf-8?B?ZGdjR1l4eEwwTWZOdUhhTVo0VU1FcFg3ZmdEM2QrWEcxUFEyR3RTengwcWp0?=
 =?utf-8?B?UkxKQjg2Y1paS3M4WE1GYkNjVGs3Y3czUjBudDd6Wkt2UUZZK1FzL0llUjBW?=
 =?utf-8?B?L0NuU21IUjhtR0NZdnN3OXdoWWIyaDV3Z3ZZYm4vZ0tML0RhV1NYQVpqTDdQ?=
 =?utf-8?B?aER3L29UNG5VRkhSZTJYbXArUzZCUEJkRlcwQnJIZCtlcjBYbFptVXMrbEJ2?=
 =?utf-8?B?OTZhbmh2NndDaVZ0L2dsS0NjSlUwaFlRcmVtbjFGYzBvRjMzS2NpYXpxbURs?=
 =?utf-8?B?bDJ5WnpFUC8yODY5RkdCMGRFaGM3ZVJ1RDZtZ2Y0UVBaZDB3TU9nWlNjSDRW?=
 =?utf-8?B?TDRzbXhsZFU0TnY5MkNSbEtCWjFlUEtNL2ZLSHZaekZpRDFtcytVUHQzajJz?=
 =?utf-8?B?Q1pGbUR3dFMzamVOZjlPaXdCMFNVZkpNQkdMWThidE01MGNPQUszbGZWd3pk?=
 =?utf-8?B?M2k0VXBsVndZM2NQR2hva1JwRnEreExQS0ZHNUU1dlNKWjVkWDhoVGhmV29z?=
 =?utf-8?B?eXR0UlI5c0l3L3BjdG00WTVjamI1SmlJZGUyeVVucElYMXRuT0FyU1Z1cDdn?=
 =?utf-8?B?cmdGQjZkZUhVeUIxUUhpdThZVjJsZklwNzVHdjh6RlFMNnZOcUM0MDBFcEdz?=
 =?utf-8?B?RUUxWENuQi94b1hBa3pnWm5vblZ6c0RGSUtwRENsdVF1d2NkU3JBSkFmYkJZ?=
 =?utf-8?B?VlVLRjMxK0xvSDFxbDArRGhOeUQ2cWlFMXdZbEhyUUE2QUR6aTlVKzRhRFJI?=
 =?utf-8?B?UkxBVUt2RVRoaXZGMnhxK1Y5b3RzNlQwUkppL2Fyc0RaQlBiTnl6ZDRHMU1B?=
 =?utf-8?B?SWd3UGRlZnNERXFWK0puNkkzcVlqdFpaS1p2aTQyZnhqUmRmcHhwSE8wUnlS?=
 =?utf-8?B?ZVdTMXZiQjBwdGFrd2w3UmtOZ0RhMHI1NXZQZDlrMG1pWk1rZCt3MFdtcGJt?=
 =?utf-8?B?aGRBRlBhUWVkY0xtay84Wng2WGFTMEhma1l1R0E5UGZOczVacTB5dDI2UFpD?=
 =?utf-8?B?V2dtRjNOZ2xZdXNUc1JsWDRuTk9vZjhwZm5seGdnaUc2bE1GOGV3VGNBbFYx?=
 =?utf-8?B?ZXJEdjJuY1NzZHR5TlhXS0NyYmNHMyt0cjdxRTNTVWtYWVFwTFp2dGNkQm5P?=
 =?utf-8?B?WXM0cjErR3JpZHlPbFAwWlRmOTNJY3g0VFV1SlZjTG55NVJsWDcxQ2J2N2VN?=
 =?utf-8?B?eVV6S1BsRzFjUTNxRGhVN1hRdnhZT05CWTR5NGM0OEpHK2YwZERjTzZFbGdx?=
 =?utf-8?B?NHJHcEk5U01CSVJPakdndHgwMmVIOVlqeWhib3ZPb3JKRVRHM2s5WTJHS0RK?=
 =?utf-8?B?RFkzV1IyMW8yY3JsaVhCcE9kVzZZV0RJemFGcUhsd2JJSkQ3bE5QVG9nVXVh?=
 =?utf-8?B?eFNZcnNWUElQVUtjeXVOQmUybXlabTNTRGJzVkllTURLWWFQNVpMcmt5c014?=
 =?utf-8?B?VThvczlmSVBhKzBkdy9QZ0x6bzlLWjRRRnJ5aXAyY3hKRVJxVWJWV1hyU2R5?=
 =?utf-8?B?ODdUSS8zb2tpNFVTaUV1Zm1UeTVZeUgyRDVEY2JiMGx5em9CeEZ6UzU5RWh0?=
 =?utf-8?B?QkU4WlhFZmFmeXpCb1FoNkF4QTFlRWpLWXlGM1I5dGJwbXdLWmc0WExudG5w?=
 =?utf-8?B?QnZZSzc3cjV3aHExVklna1pqbGJHbTFZa1RYVmhZYmh6YkpwUDFzZ2FVWnBE?=
 =?utf-8?B?QkY1OWxPYW9yZDREbUtPbmg2U3JHVGRwVkZEb1Z2ekJISjIwZkJQN1IwNkVh?=
 =?utf-8?Q?YlOguOiEBda+5+OW3qAXXn6Sb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd4cbd4-b86b-4ae6-ebd8-08dc6fbe8de2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 00:25:39.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPKxneWfgc3/+cr+uB+IB1ADrfCTE7tOO4UZluiZySMS69vMp/RBQQ6rD0DB8+sUQQoaIT4O6qh1kfdFisN05Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6672
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

VGhhbmtzIE5pcm1veSBmb3IgdGhlIHJldmlldy4NCg0KSGkgYWxsLA0KQW55dGhpbmcgc2hvdWxk
IEkgZG8gaW4gb3JkZXIgdG8gZ2V0IGl0IG1lcmdlZD8NClRoYW5rcy4NCg0KQmVzdCBSZWdhcmRz
DQpTaHVpY2hlbmcNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOaXJt
b3kgRGFzIDxuaXJtb3kuZGFzQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWF5
IDcsIDIwMjQgMTE6MTMgUE0NCj4gVG86IExpbiwgU2h1aWNoZW5nIDxzaHVpY2hlbmcubGluQGlu
dGVsLmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGFzLCBOaXJt
b3kgPG5pcm1veS5kYXNAaW50ZWwuY29tPjsgQnJvc3QsIE1hdHRoZXcNCj4gPG1hdHRoZXcuYnJv
c3RAaW50ZWwuY29tPjsgRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGU6IEZpeCBVQlNBTiBzaGlmdC1vdXQtb2Yt
Ym91bmRzIGZhaWx1cmUNCj4gDQo+ICtMdWNhcw0KPiANCj4gT24gNS83LzIwMjQgMzowNCBQTSwg
U2h1aWNoZW5nIExpbiB3cm90ZToNCj4gPiBIZXJlIGlzIHRoZSBmYWlsdXJlIHN0YWNrOg0KPiA+
IFsgICAxMi45ODgyMDldIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiA+
IFsgICAxMi45ODgyMTZdIFVCU0FOOiBzaGlmdC1vdXQtb2YtYm91bmRzIGluIC4vaW5jbHVkZS9s
aW51eC9sb2cyLmg6NTc6MTMNCj4gPiBbICAgMTIuOTg4MjMyXSBzaGlmdCBleHBvbmVudCA2NCBp
cyB0b28gbGFyZ2UgZm9yIDY0LWJpdCB0eXBlICdsb25nIHVuc2lnbmVkDQo+IGludCcNCj4gPiBb
ICAgMTIuOTg4MjM1XSBDUFU6IDQgUElEOiAxMzEwIENvbW06IGdub21lLXNoZWxsIFRhaW50ZWQ6
IEcgICAgIFUNCj4gNi45LjAtcmM2K3ByZXJlbGVhc2UxMTU4KyAjMTkNCj4gPiBbICAgMTIuOTg4
MjM3XSBIYXJkd2FyZSBuYW1lOiBJbnRlbCBDb3Jwb3JhdGlvbiBSYXB0b3IgTGFrZSBDbGllbnQN
Cj4gUGxhdGZvcm0vUlBMLVMgQURQLVMgRERSNSBVRElNTSBDUkIsIEJJT1MNCj4gUlBMU0ZXSTEu
UjAwLjMzMDEuQTAyLjIyMDgwNTA3MTIgMDgvMDUvMjAyMg0KPiA+IFsgICAxMi45ODgyMzldIENh
bGwgVHJhY2U6DQo+ID4gWyAgIDEyLjk4ODI0MF0gIDxUQVNLPg0KPiA+IFsgICAxMi45ODgyNDJd
ICBkdW1wX3N0YWNrX2x2bCsweGQ3LzB4ZjANCj4gPiBbICAgMTIuOTg4MjQ4XSAgZHVtcF9zdGFj
aysweDEwLzB4MjANCj4gPiBbICAgMTIuOTg4MjUwXSAgdWJzYW5fZXBpbG9ndWUrMHg5LzB4NDAN
Cj4gPiBbICAgMTIuOTg4MjUzXSAgX191YnNhbl9oYW5kbGVfc2hpZnRfb3V0X29mX2JvdW5kcysw
eDEwZS8weDE3MA0KPiA+IFsgICAxMi45ODgyNjBdICBkbWFfcmVzdl9yZXNlcnZlX2ZlbmNlcy5j
b2xkKzB4MmIvMHg0OA0KPiA+IFsgICAxMi45ODgyNjJdICA/IHd3X211dGV4X2xvY2tfaW50ZXJy
dXB0aWJsZSsweDNjLzB4MTEwDQo+ID4gWyAgIDEyLjk4ODI2N10gIGRybV9leGVjX3ByZXBhcmVf
b2JqKzB4NDUvMHg2MCBbZHJtX2V4ZWNdDQo+ID4gWyAgIDEyLjk4ODI3MV0gID8gdm1fYmluZF9p
b2N0bF9vcHNfZXhlY3V0ZSsweDViLzB4NzQwIFt4ZV0NCj4gPiBbICAgMTIuOTg4MzQ1XSAgdm1f
YmluZF9pb2N0bF9vcHNfZXhlY3V0ZSsweDc4LzB4NzQwIFt4ZV0NCj4gPg0KPiA+IEl0IGlzIGNh
dXNlZCBieSB0aGUgdmFsdWUgMCBvZiBwYXJhbWV0ZXIgbnVtX2ZlbmNlcyBpbiBmdW5jdGlvbg0K
PiBkcm1fZXhlY19wcmVwYXJlX29iai4NCj4gPiBBbmQgbGVhZCB0byBpbiBmdW5jdGlvbiBfX3Jv
dW5kZG93bl9wb3dfb2ZfdHdvLCAiMCAtIDEiIGNhdXNlcyB0aGUgc2hpZnQtDQo+IG91dC1vZi1i
b3VuZHMuDQo+ID4gRm9yIG51bV9mZW5jZXMgPT0gMCBjYXNlLCBkcm1fZXhlY19wcmVwYXJlX29i
aiBpcyB0aGUgc2FtZSBhcw0KPiA+IGRybV9leGVjX2xvY2tfb2JqIGluIGZ1bmN0aW9uLCBzbyBj
YWxsIGRybV9leGVjX2xvY2tfb2JqIGluc3RlYWQgdG8gc29sdmUgaXQuDQo+ID4NCj4gPiBDYzog
TmlybW95IERhcyA8bmlybW95LmRhc0BpbnRlbC5jb20+DQo+ID4gQ2M6IE1hdHRoZXcgQnJvc3Qg
PG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBM
aW4gPHNodWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IE5pcm1veSBE
YXMgPG5pcm1veS5kYXNAaW50ZWwuY29tPg0KPiANCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfdm0uYyB8IDQgKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0veGUveGVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+ID4gaW5k
ZXggZDE3MTkyYzhiN2RlLi5jNWIxNjk0YjI5MmYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0K
PiA+IEBAIC0yNjkyLDcgKzI2OTIsNyBAQCBzdGF0aWMgaW50IHZtYV9sb2NrX2FuZF92YWxpZGF0
ZShzdHJ1Y3QgZHJtX2V4ZWMNCj4gPiAqZXhlYywgc3RydWN0IHhlX3ZtYSAqdm1hLA0KPiA+DQo+
ID4gICAJaWYgKGJvKSB7DQo+ID4gICAJCWlmICghYm8tPnZtKQ0KPiA+IC0JCQllcnIgPSBkcm1f
ZXhlY19wcmVwYXJlX29iaihleGVjLCAmYm8tPnR0bS5iYXNlLCAwKTsNCj4gPiArCQkJZXJyID0g
ZHJtX2V4ZWNfbG9ja19vYmooZXhlYywgJmJvLT50dG0uYmFzZSk7DQo+ID4gICAJCWlmICghZXJy
ICYmIHZhbGlkYXRlKQ0KPiA+ICAgCQkJZXJyID0geGVfYm9fdmFsaWRhdGUoYm8sIHhlX3ZtYV92
bSh2bWEpLCB0cnVlKTsNCj4gPiAgIAl9DQo+ID4gQEAgLTI3NzcsNyArMjc3Nyw3IEBAIHN0YXRp
YyBpbnQNCj4gdm1fYmluZF9pb2N0bF9vcHNfbG9ja19hbmRfcHJlcChzdHJ1Y3QgZHJtX2V4ZWMg
KmV4ZWMsDQo+ID4gICAJc3RydWN0IHhlX3ZtYV9vcCAqb3A7DQo+ID4gICAJaW50IGVycjsNCj4g
Pg0KPiA+IC0JZXJyID0gZHJtX2V4ZWNfcHJlcGFyZV9vYmooZXhlYywgeGVfdm1fb2JqKHZtKSwg
MCk7DQo+ID4gKwllcnIgPSBkcm1fZXhlY19sb2NrX29iaihleGVjLCB4ZV92bV9vYmoodm0pKTsN
Cj4gPiAgIAlpZiAoZXJyKQ0KPiA+ICAgCQlyZXR1cm4gZXJyOw0KPiA+DQo=
