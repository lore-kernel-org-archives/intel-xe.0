Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB83ACCF9F8
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 14:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB3010E74B;
	Wed, 12 Nov 2025 14:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TApafrum";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2925310E74B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762956307; x=1794492307;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=nNmUzi8QYDekJWYNRKXkXesiqK2+LNXthkfovfy5lEc=;
 b=TApafrumJJKdca8MiYB43PxC92bVmunpovVrRrUDV43QUUerHjdIIztX
 PfvDoJ0W8sDRxLp7JysSKligCJmSshsWCJBvx4xiJE/r+a5IhGT/LUfiy
 zUr+6z5oNAKcMr1qK+s75buNvrUnGXk+BmTYUlRcRecU+bjTqU9zmYrBr
 8TvdBlQPipcvy63QveBbWOXf8qYcO2vGxwxjzDBsxMzcTO3i/3ezRGTlr
 MalMhCLL/Tu/ULoIHnh/KTpnttyISMg1cGU9q3+RRVPoOYF0pU64hdDSj
 lYhU8b5za4FZ8jFrKr70RMmTIgI7xYanC4cCPoNB6BuKzy6n63QeC3+Ot g==;
X-CSE-ConnectionGUID: JFt/zbhATuOa9y6f7d8o5A==
X-CSE-MsgGUID: ZOSXGuFlRfO11rqhBZx0ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="68653048"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="68653048"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 06:05:06 -0800
X-CSE-ConnectionGUID: KZhuBpGcSTOQcp/DmrJSGg==
X-CSE-MsgGUID: aG42510lRb6yNQ7jCWP7lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188998955"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 06:05:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 06:05:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 06:05:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 06:05:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8KxF9RFhvF4u1xPxSF0pGHkcfjWWMTFxHK5VdfCuRPXFvnKlEZ6GBByjId9rEnpf7+FcMg4h4gyYgvAxKlOeDzjb1f6tDiRZJHq+dxxCK0OteN6QyCyf+VSdbk9tLcL+NSZpUisncOU9Zz4yOHV2PvzNFEEL91GGeENwbKYumBXAyPA5j3Frd52ocnI7R6qcpYy+23cTSd6ursgeaCAe9KTX+cl23Cun5KxF7IdtGfOs9IQkv+4vDdKYM47h8JpPHdO3XAGJGbOkDliILV9qz43Behf3UEaCAevh2Ma4mehmM5yAGnvo5VMfGbGWR1Hsylw87zJLjIiwt1sCqehWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuDwucB/DemSuChPmZwHv4fpDROrnd/wcL1DC+/ysSI=;
 b=O2ia80QID0E+3okshcTSFmd/C+xDoDSS67OrTjWLF2NF8xZd9WeFoX59uR0OlqYN5Vko7HXZcOnmQ5nWCyPth41yRrFDSPKoRwtAlKOHQvOURweRkPr9TSwvvGU0aSPdxq8j1b5fObQCJKDv3hTjyheIIh7wGyEJ4QbyGrK1ww6MeWAP1oKfLfEXtw2KqJ4JpM/XD5zC3Kn6YGwNqRm0Flv28yDiMYtiFo0WOn9wPPBkqjjI3D50HzaR3rDI/TDIdYASa1AgXVpr244JxAoCThqqJLfwa+0r2nFgbLTBL4w9ngKmUfqCovo2arOdDS0Vp9hxbQMgQA3gAk/YH2WaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by CH3PR11MB8138.namprd11.prod.outlook.com (2603:10b6:610:158::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:05:04 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:05:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-33-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-33-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 01/30] drm/xe/forcewake: Improve kerneldoc
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 12 Nov 2025 11:04:56 -0300
Message-ID: <176295629634.3698.10901331213006835187@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|CH3PR11MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: f3afd7f1-e15c-4f18-14bc-08de21f479b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWNPT0JhZTBDa0IrT0k5ak1FVGFVNVBxVHdULzVpZFFhZWRqRUxiREpoQWdx?=
 =?utf-8?B?UTZwWlB6Y0RaNk43ZWRydi9zMjgwTVJvdVJlMVBjSkVGT2QxWi8rYUs4V1Uy?=
 =?utf-8?B?S2NrY1R4ZnIvdCtJWStaRnJFcE1QamZGTE1vRXYyU1M1Z3JFR0xGdElnMytB?=
 =?utf-8?B?cTZlalRWWTNXRFplRnJMT3NhbW5OSkQ5MFN3dzZ5b3Z0L1JVaHhLOHFVMUVZ?=
 =?utf-8?B?WExDdmw0dC9HYmdlaVMvTWdDRXNhRlJKeUgxdE9kdnBPeExpSFRpY2xUdCtC?=
 =?utf-8?B?UXhZUG5FQjlCcWg0a21ENnRYZHJsVDJjYmRKMkRYaVYrU2ErYmk3QjRoVTVs?=
 =?utf-8?B?TklYV2l1MjcvUERvcU5VNHNINnhKa1dISXFTaW50WDdacTh0MXFCeEU5RzlN?=
 =?utf-8?B?djF2bWtzOERFZWtFVkNhRXdmbmErM1N0c3NSb2Mrdnh1TUl1Wk5XZHBZakg5?=
 =?utf-8?B?MnZGcHB5YkdmV252UlVNNGtoWE5td1QyMG9mQkdXdGZ0MnV3cXBIczVWcmZT?=
 =?utf-8?B?V2R0QUFTZ3RZVUY3WTY0c3VFTW9uV2ZPWWtkdmNQaVNPRitmZnlxeVlFUnZn?=
 =?utf-8?B?emRacUNPZUNvVzVTSUNUblVoby9oREY4OW9TTWowQzdVVDZoNHNkcllXaHhO?=
 =?utf-8?B?TFUwWmI0SWhWQWRUbW9mVDhwTjZNZEpNdVk5NnM2TU0yQVVtVHJEM0lXNXpr?=
 =?utf-8?B?YWN1RHlMV0RiT0M4ajdYMDNhd2JsbjhsMnE0T201eVp3NUVDaFRpMnhacFhx?=
 =?utf-8?B?b0xITzNxai8xTlV1TFlDMklHZ3ZFQlRlYVpabW5Cbkh5TitNcmJKbE9PN1Jz?=
 =?utf-8?B?bTMxVVdVMG4wU09zTGRsY1dVSzE0Z3N6UTlDUml0M1JhZnhSTmhJZVZnWjNE?=
 =?utf-8?B?ZGhhemFlUU9wZ2FPZ21TK1lXRjFCNkovSWtrOGFKeXdpcUZwR1BUSkxQclBD?=
 =?utf-8?B?c05GeGZqRXVGaHBBNlV1SGEwbkpCTFZGMW51M2hoU3VSQlM4OG1ocXBDVnVC?=
 =?utf-8?B?UndjeXpyVDRRblJNZE5wdDRJSUE4Y25oQlAyUDZ2bXdicGg4UlFGeGNRNGxW?=
 =?utf-8?B?T1dmWjdtNEsrcnRaaU8yeDVCdWJyTkJreHgwK2FRK3FYbFQzYTFPUDQ4cGYy?=
 =?utf-8?B?UmlvMlJZYXhUSTN6ajdvdU5WOGpXRXFjbGdTbHlpa2pXVGVIQ09VVW0vZURz?=
 =?utf-8?B?enBlemtDOXZuaTB1eGlVQm16WEJXak1RK3RiemlwbjlYVkI5MkRsMm9FWjNi?=
 =?utf-8?B?Q0M3OXMyNElpUUNCVHRyaGtYMTk1K2JjUU5mdGwvak1ZOXhqUmRkaGtYbDd4?=
 =?utf-8?B?YnRPdm5hdUZLS0RtYW9FekhkelJzbHVnUXh1M05wTHUzQjRIdlZ6SkRnSWFK?=
 =?utf-8?B?Y3dITVpPT0pQSWRod3M0RUtCd0dLRXFUNk9RbW1lbm9sUVJsU0hNeHhLdkxu?=
 =?utf-8?B?WWxzcEFjRjduK09rWitheXBoWm9RZFh1Z285b0FVekQ3Tjd4S2pYOVRGV1Ey?=
 =?utf-8?B?eU9OZnI4NmpxcnZJUzg4eHh6UmdkZVNCK0crM0pTelpKYWVWMC9KYWR0NFZo?=
 =?utf-8?B?c2Y4VHlybU9KWGZIMWFhUDVHbGZxL09WVWRhUUxaTEVJZTNFeXpNcTRpRDNN?=
 =?utf-8?B?SW1rNTJvRHdIM3cyaEFsSldtTFVUbzQwOEp1d2pUL3FDQ0Z6czd0SC9nM3dF?=
 =?utf-8?B?RTVnTlZrV2RPSkZvK1NwcWtPVkVFRGRjZEpNUDYzQWVOemZBQkRhVlQzVG9M?=
 =?utf-8?B?akNkRlM2c3BFclhCaTlSZSsvY0pEb3FCSTE0QXhLSjFNcjMxcFNsTXArQzRQ?=
 =?utf-8?B?TUpSZTBSZUVGSUJISUVFejh2RVV5MWdOTjlsN1dJb3dDMlFDSHJUVTgyT1Nt?=
 =?utf-8?B?bGhodUFYUHlRMkcvYUZmeEVLeEpZeTdkT2gxbFpUalQvZ2pTWGRhODN3dmlP?=
 =?utf-8?Q?TTzGib99l3YLOUfVrXxeSohiiUsCnLOs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUJvNXRLR2x1Vmp5TUNuTzlPTWkvdERCOUZ1MVYrcExURWFBV3gvQ2c2RTQr?=
 =?utf-8?B?czcya3F4ZnBzNW12NTAwOWxqOXBRR0Jjd1g1Q0ZiS01xc3RDY2ZKNnhpY0kr?=
 =?utf-8?B?V2lrNUFUOG9XakVhNlVUNzR3amhQdGhobXBDNFhlc0pxYnV4dC94eldobkVW?=
 =?utf-8?B?VWxsMGlmTE1lb2dUdnJ1Wk91cWVxTHo4Zk12YUtFb2FMdE9ybFNQbk5BcEJk?=
 =?utf-8?B?K0pZUDFrZ1AyV1BtZVJqendCanh2WTl0KzUzNWhucUNaNjJvR0E2a1JYcytO?=
 =?utf-8?B?WnVjbUxBREV0SlNoUmFuclFlUzYxaVd6SE5DSEtOWnRnQ3VRNDFEei9UVktL?=
 =?utf-8?B?N1B2TlVZWmZCRWV3VUJzZm9Oc2RzL3lYQTFIazlFRlJ0Qjk3dkJaTGZJaldM?=
 =?utf-8?B?YWZSUkp0QWNPUHNXVi9CcEUxeEMrWHpnNVpNVVdDZG4wVXIzbmJlMXJYSzFv?=
 =?utf-8?B?ZHkrZU9pZGdrMlFhUTMweFVnS3NzdlN5WGJHeUZvZE9JNHErUXF2a0I1Z0Qr?=
 =?utf-8?B?cDZTOTNPOWdDZVZ3MEV6K0lPVkJvQk4vYm83NXdiYzFodHduaXVyRmcyeFpX?=
 =?utf-8?B?eStpd0F4cVMybFNpK1A4RTNLMHRVVjhubzdKSnJZakZYdEtmZTZLRDNoVEh1?=
 =?utf-8?B?S1dMb1pGYndGRHVXZS9Dam4vVnl1endCM0tIVWhrMUgzYkhic0JZN3YzUHk3?=
 =?utf-8?B?b3BuTzFhRmxOckd4WDF2c0JjYVk4YndpZVdsUXowSlhHNDVQdGdna0Q1VVVY?=
 =?utf-8?B?a3EvaGF6RjlTY2xWQU5jU1JOdFYyYjBUUGNDQXNVZU90aEhjUkNreG9wVExC?=
 =?utf-8?B?SDYzU0FNcXFuZjJOYjRnZVlmeENoZHRNVGVaMWNYQTBZYk1nbGNQdEVuSTBq?=
 =?utf-8?B?V1kwUkxIS0s0WXFqR1E2RmNtQ3Ira0phbTdsSUNKbzU1dEZPZU9HUTF0QmVF?=
 =?utf-8?B?LzdJSlA4TGZPUUJjSDhwTmZVbmhRTmR4dXRyejVja01EVFp4R3o0N0UrdFB4?=
 =?utf-8?B?ZmdHcWxwemZtMmRiUi9jdWxQdDVCSHcrZVA0Z0lraXQyVUsyUnlqRy9tVkRQ?=
 =?utf-8?B?bUd0eTBIRzJZVUlqNlVkWVlDWTF1WDMralhhT2ZuWmdUTGJHY0RuRVBpREtX?=
 =?utf-8?B?MkJjbGJ1aUt2dWNscHFZeHppZm5McDJ6OU9IVU1EZmpSUnBmcUZwYmFNVklj?=
 =?utf-8?B?YmhDbUlDUDRxbTBSdEg1aHdpUkQwS2szT2pBRFAvMnYrS0U4U2djaEl5QzRR?=
 =?utf-8?B?dTdBZWwrRWRiNmhmZmt6N0ZMR3lLd0N4eHl6VWR2aUJmYUxqWS9JdXl3bWFV?=
 =?utf-8?B?cGd2KzY2aDZTRE5Wc2ZCazh1bzZXdUtyUSswYXM2MFA1alpFbVBCMDVjeGI2?=
 =?utf-8?B?SDNnbXJ4ejJpWGJ6akZlT2ltVGFneE5DdGFUNHgvc0JXak5HR3gwa3VtYUxW?=
 =?utf-8?B?TWxyWmtYVTlLaXBZVCtPQ1pnMGZkTXZnWVBKL01QajdpYzVrTy91TWdCdjBk?=
 =?utf-8?B?c0hTNzVMQzlYY2ZvbGlIMkxVZFluUld1Nm13d2I4clp6SzZ2bWdtQzJwbEpx?=
 =?utf-8?B?aGt4bVlBY29wQkJhMHBWWU0xWWNVT241eFRBNVFhQXhUV2s1QzUwa3pFc0dW?=
 =?utf-8?B?U0FjV0l4cXBTRjJBQzJTeGhVcnZpTjJyY3lZOHYyMnJVV2xuc0VEYjc5Uy9R?=
 =?utf-8?B?Z1ArWHE1RmRJN0R3c0l4Uk5BKys5Rk9Mc1Q2cjlQY250WExFYkhhRWo4bWdF?=
 =?utf-8?B?aTA0bU5jSTRUYjhUM2xVQzV4dnFtNEd6U28yRXdmaVpUMnZ5bXF5dWkrUjd2?=
 =?utf-8?B?dzhGOUszSVI1bFNuaUUyNVM0Q1g2Z1llQy9DNHUrSDlJNWZBOFhJUmFtSlV6?=
 =?utf-8?B?WDZGT2NNUkkxalgwY2xmU3ZGYlMzckFiVEZHZUxscW9pNVBYRTZCcUdsMHln?=
 =?utf-8?B?dnRtTk9VSFMwRFBEMEhhL1l3RUJ6eTJDWDZHMXJDdDVrdGR6RTRvYTFuMStF?=
 =?utf-8?B?YTRpY3RRN1I3c05MckhDZzdLUjJISm94ajRNUDB2TncwU2dyQ05QWE1Ba29t?=
 =?utf-8?B?aHIwQWtlY2pYcWNmYi9menZIUFkzNEtjNnZ4NnFROEgvWmgxMy8wbm15aEk1?=
 =?utf-8?B?cU1wN3Z2ZXJwTFhQUGRxcXJzcEFSYkp3bFlEVHdXZzgvdDdNOWdXSHhLVE1X?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3afd7f1-e15c-4f18-14bc-08de21f479b3
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:05:03.7049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qKhcGOPLNBbA+Ezbt7Jgv9KZCS0cXjzfKtLnGbZI7eUE9BC30YncFYq44SpOMJUJkjGXH/HJNF3FxtuFj8woA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8138
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

Quoting Matt Roper (2025-11-10 20:20:19-03:00)
>Improve the kerneldoc for forcewake a bit to give more detail about what
>the structures represent.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_force_wake_types.h | 26 ++++++++++++++++++++++--
> 1 file changed, 24 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe=
/xe_force_wake_types.h
>index 12d6e2367455..9cfa28faf7bc 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake_types.h
>+++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
>@@ -52,7 +52,22 @@ enum xe_force_wake_domains {
> };
>=20
> /**
>- * struct xe_force_wake_domain - Xe force wake domains
>+ * struct xe_force_wake_domain - Xe force wake power domain
>+ *
>+ * Represents a individual device-internal power domain.  The driver must

s/a individual/an individual/

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+ * ensure the power domain is awake before accessing registers or other
>+ * hardware functionality that is part of the power domain.  Since differ=
ent
>+ * driver threads may access hardware units simultaneously, a reference c=
ount
>+ * is used to ensure that the domain remains awake as long as any softwar=
e
>+ * is using the part of the hardware covered by the power domain.
>+ *
>+ * Hardware provides a register interface to allow the driver to request
>+ * wake/sleep of power domains, although in most cases the actual action =
of
>+ * powering the hardware up/down is handled by firmware (and may be subje=
ct to
>+ * requirements and constraints outside of the driver's visibility) so th=
e
>+ * driver needs to wait for an acknowledgment that a wake request has bee=
n
>+ * acted upon before accessing the parts of the hardware that reside with=
in the
>+ * power domain.
>  */
> struct xe_force_wake_domain {
>         /** @id: domain force wake id */
>@@ -70,7 +85,14 @@ struct xe_force_wake_domain {
> };
>=20
> /**
>- * struct xe_force_wake - Xe force wake
>+ * struct xe_force_wake - Xe force wake collection
>+ *
>+ * Represents a collection of related power domains (struct
>+ * xe_force_wake_domain) associated with a subunit of the device.
>+ *
>+ * Currently only used for GT power domains (where the term "forcewake" i=
s used
>+ * in the hardware documentation), although the interface could be extend=
ed to
>+ * power wells in other parts of the hardware in the future.
>  */
> struct xe_force_wake {
>         /** @gt: back pointers to GT */
>--=20
>2.51.1
>
