Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FE5C83F22
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 14:27:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF8710E7AD;
	Wed, 16 Jul 2025 14:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b12vNQjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AF7310E7AD
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 14:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752676052; x=1784212052;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VaSflxqnB59+sQb2+zMRN9FOWJXp/ayzwkGG4gRhaLM=;
 b=b12vNQjhzeR40gpLsiM+lAUJztmLxLlGo7L3H8eeF8bvDlkUfoVojMTQ
 Rpq6zoCiYkReqLh+mB8MJiUVzk+sVILcLwoildeynkFNoQ5yxyOKE2fUq
 vCC/PWTZaBiwH3+pdYo6XRaOJv9uwPFUqXBQ5HtG+cpbo8J6fpTi5kML7
 XJnSj5I5u5QZZuRLWeQAMGFAminviwPYwY2o+odgywMSjSDOPGUzVyP8N
 5zdWe8FpapLmWt6HecMVzujRqKhNEbWCc0HjlEHjqtjGDFW2w5I+yGGSg
 Ri3z9BgI/PN/Uu2dmmk6PL+WiQTeHCdgk20in83xXkY+AZiwve/TM3HWl w==;
X-CSE-ConnectionGUID: t3Fwoc7vRkmKJUeXKpODOg==
X-CSE-MsgGUID: A1cQJmM1Qvue22ALdcwbvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="57533739"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="57533739"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 07:27:31 -0700
X-CSE-ConnectionGUID: Vj3UmMUeRSaNsrRp5h7EpQ==
X-CSE-MsgGUID: Vq1SQlHRTHy6BPWuzHfNLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="194662965"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 07:27:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 07:27:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 07:27:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 07:27:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXke9qFLSh4rJaJTbw7g6Dop1sjM52baQwRq01d9FSuQXOgAmC5tPoHfxuZnL9tNSXIAO/4lfj0AA7cPSLeth2gSKviBwj1X9Zsu9a6WLwr+RralnhzgkurlD7LjhHeg7DUoI/BIRr8cbOGtUxFLTKWrOH5PykpvzhWsOXOWwNuWHJqDbCGPwiGQuxQEVVG1dFruOasGGlHb1g5A77yg74ZtwsWhMf0ILrhvkJLKaScm1J1bCaJT+wcJ12s/efAskMUayUUvOnytnvAqA7JdvsCqgPP0KHwdONQwY5ECPoQFta758lKKRrdHw0V76KitwFxOPFaW6kDavDDviEiBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3YQ4OhnL9m4BDmbdymwxHLYlaQen753+kknQI1Exgw=;
 b=bLoYB+6ZUqoUYOyih+rC2MXNSVU2lBz9aAkzx2fo5VVftRN56xnmkIYrCpiud+D0fX9dLz76LV1kLBmL6E9bSW4LP8WT9GMMU8nsmEvWVkoD+GPvWfMcYDPtAlrBVL/pwVQ8aNflTzKASu1Q/N5+pi3ZvweGsvh5SQ4gomHuev9eKicFRklMp02ZUqqvNG+YezUuVEy1TdohSEa7tXXw7t9f1yBP/Nax9q4kRLfrsuKzKxoHHNv024gh0xRn+qf3yGTuouYKL+dYkzP2/3LMizQ9ZVCextYpvwk9SRG7f+lB1B72o5PvMRwlQGCW/qJ8qNw4s68MQJZ9M8DRgfnkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Wed, 16 Jul 2025 14:27:26 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 14:27:26 +0000
Date: Wed, 16 Jul 2025 16:27:22 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v6 9/9] drm/xe/vf: Rebase exec queue parallel commands
 during migration recovery
Message-ID: <w73h3uqwdrobsx2pveedl4qzp3idwr62ochkrwljzhvhwbpajk@2l2b2coedvyr>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-10-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704210228.825843-10-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR10CA0094.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS7PR11MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b2ed21-7769-4a5b-038f-08ddc474e313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXNaWFJML1Bqdi8zSWREcDZudGhYcUVuSWpPVlZ5WUpYL1V3U3NNdUJDNkIx?=
 =?utf-8?B?R2M2c1I4eTkwRFl1TTZrU0V3RkhNUG4ydmJrUG03R3NSZG9FcWQ1K1NtTmxj?=
 =?utf-8?B?T1VYdnRIemx0OVExakVaa05maWltdUp5TUhzQkpQSkNIaWhkOW9FZGwwSVFl?=
 =?utf-8?B?ZU4yZW1vaHFaQ0ZwTGs4TnptcmsyMk02ZkduOWhkay9HRHk2STRTb3ptNkJC?=
 =?utf-8?B?RklSMUd2V3UycU92WXplSmw2am4zYlFUSms0RXBBS3AzQ2FhY3lxblZzRjhl?=
 =?utf-8?B?Q0NQTityUnYzb2pZQjN1ZUxGb3hhM1dYN2JJUHlaeWRIbGllUGw0STlwdGN1?=
 =?utf-8?B?a1lwWUxnQnhkSnJxa2h3Z1pKUlFTUVpUZE1mSS91Y3VkMFM3cXg3MlZuQ0l6?=
 =?utf-8?B?WW1JTENVTjVyQk1SV2d1aVBSdWt6czZ3ZTRwc3l2RUpuZUxkUHk3RnlzdFZz?=
 =?utf-8?B?R1gyTG13dEZ2Sk9URFdVWDFCY2I5bFFDU2crM1c0bUh6M2RObUxOcU9Pbldo?=
 =?utf-8?B?a1VnNzIwZDRucFhXRiszcjUxMTVkQVhiQmNSUEd0YlVpSXhPU2NGcDhPblpD?=
 =?utf-8?B?MG41MEx0NzN2VjNnSm14S013SktUYWVHaHY3ZWZwRGprQ0pHU09OOW8xTys2?=
 =?utf-8?B?TmRTVmxGeldLZVp1c1JYUzViOVB6NS9zYlpuQ1RXbTNpd0ppOEpwMUpjMUEx?=
 =?utf-8?B?WnF6SlgzUFJ0cWRhQjhERVNjWHBUOTU4WnE1V1dnTEpnRjBpc0NZWFlxU3Fs?=
 =?utf-8?B?aXhkSmxaMEdhcDl2bmR1NTU3SEd2VmdrNWhrQnQ1NHpScGdLR1VsUG5JQ1Q3?=
 =?utf-8?B?OWtLdytLODduNzJwMGQ4aCtuS3dJY0ZOSzJsdDQzMlN0cWV4T2RicFVtRjVo?=
 =?utf-8?B?K1RtL2lRd1ZBTWROeW4rUzgrWGQrMlkvSFB6RC9yUEJmdEd5TFVBeEdMREow?=
 =?utf-8?B?cE5lUmtyMGRmSHBoZmdCL1gxK2hBalV5eWxKWG41RFdldEUrTm9TTXRKMVgy?=
 =?utf-8?B?K0hlY0duSThjb3RUbXlyNHBlV01aWDFDRDJHYVRFaU9MUU8yWWJ2REZvcjly?=
 =?utf-8?B?WWRzcll3YXJHc0gxNndndnphem1zdkVpRmMyZStnb0xHSUtiM1dUT0tmY05i?=
 =?utf-8?B?N29INGNDdEtwUks2VE9HaTFodDRTMjlRZ1lNQ3kyWDVCaHZaeEMwSWgrMkhR?=
 =?utf-8?B?dFYxT0pTS2REaTRPVmhQQTlvTXZ3amZYRGsrR1BGS3liSVhxVnZwQVJSeGVE?=
 =?utf-8?B?bUxMM2VJR3ZuOEY3S1VnUXdGRVVIT0ZFNFJ5bkJ4ZlVkSHhtc1hqTkpud0kv?=
 =?utf-8?B?ZWJyL3JEYkkzWHR6R25Vbi9OSmFkOERsSjNUbHhlSi9oeVIyRXlxRyt3NHlG?=
 =?utf-8?B?R21YWm1MamQ3bWpTZit1QmVESXE2bVVNT2dyR2w4MzZsSnRJaXNEbXRGV21T?=
 =?utf-8?B?eVVGUnhDRWhrZjcvMEZZZlBCOU1aOWhyUzcxYkxrN013cElPZE1VbUMyZnNh?=
 =?utf-8?B?eVlIUkx3dkpXUkJ2MXhDMk8xODJ6Tm9SUTlJekVpNnVEbWFXSjAwUVlvc3BH?=
 =?utf-8?B?Y0ROb2FjUGV3dGpTU0Q5Ti83bEtFVGJkNWhybVFuTU12blNSL3V0akY3QWc4?=
 =?utf-8?B?NXJnWmpwM3B3UFZnTExxYzQ1NnA5TDZ6Sksxd2JUNXlJYzBXNFI3aHdPOFhK?=
 =?utf-8?B?TkVDUmtwUFdMQ0M2aktkWHVYQ0QwaFZwdVV6NkxYZk0ybEhaQ0hJVWVDMTA0?=
 =?utf-8?B?Zm8xV2lvV1Q3c0tmeFRqa3A0cmlPMG9uRDM3U1dZSW0vcWl2T2Y4RlAvUmVq?=
 =?utf-8?B?eGkxTmRmWUtzU2VoU1NPVG5NU3NqN0tYUTFwcEtjOThjd29QZXR3Q09velhx?=
 =?utf-8?B?Q2Fsa3JNczdHdERDa2VESmpiNHFicGVCaXdiUUIraHBSMVhhcHBESHBoMlcz?=
 =?utf-8?Q?kdLcP3K4d8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzVUeEhiWDZSdktaQ0hnU2Y2UjdKaGl1UnhjUzdsYkZUV2w4VWVXMUlBdFpR?=
 =?utf-8?B?SDlxeG5pZTQyMmZQSWdyMWYrV2orcVpyQmdZajArQ21xMnBoOCszQjRBM0V6?=
 =?utf-8?B?U2poUy9FejJrdmVmenA5RTFqVnhFYXhXejUyemNERjcxMmk0WFdqZno1TXg1?=
 =?utf-8?B?ZzNTRVlGdCtEQnY1cDI2YVhTbjVFRzFMZHFKVmxTQ1FkQmNuYkdnNDIwckww?=
 =?utf-8?B?OEcrTytlVldScjhVbzFEMytTcDVDMEtyV1JmOTFOY0FLbUpjWXBIcnByTjBo?=
 =?utf-8?B?YTlTTDV3RXNPeFNxTEIvQjFVQTNBcHpSQllyRGxsOWdqbCtJNUJ5RjBPNk03?=
 =?utf-8?B?YzdRa3ZLdkw4bGtMVExzU3BlNkxHQitFeThoZk5kNHdjdk9GN0xZNDkwOXdt?=
 =?utf-8?B?WncxQ1oyRGVrMUNIM3l2WkVYQnJNWHNmOHpocTIwZkxpQUFpUTRUeW5QQjlv?=
 =?utf-8?B?bjNQQXFDdnZSOHRjaHRONFRLRTkvOEV6TjB2dkFNVHRKZThSZzN5RS9zU3Bz?=
 =?utf-8?B?d0s3bytCQnJJMWpQMnp5dWUvVWdkWExtbDUvejEyaUw3QVAxSHR5YUlSQ1dV?=
 =?utf-8?B?T1FzWCtCNURTeTh1blhsY210NkFsU25jOUgwWFdkckRwakdlS28xc1I2b0Q4?=
 =?utf-8?B?NnJUWk5uREloajlickRObWxlREMxQ3hYVlpBcjZib2RnNHNIQ2FUVmZveVQ1?=
 =?utf-8?B?bC96TGVNN0lhUFV1R0hMaGFTRFVmU2JESS9DQ1VzRi9NcEFIMzlMcWNXU2Fj?=
 =?utf-8?B?eHBra1luVVFETWRkSHl1Y0N2bXowQmc2ZGJNMTlmYkE1eUJBUXlJZThHalpx?=
 =?utf-8?B?VnI0bjdoZlJEcnFzd1l5RUdiN3dQRnE0akcxV1BhNDFYQzhOME8wSDN3aWNR?=
 =?utf-8?B?b0xOMjd6Ylk3Wng4WnRoMkJ3NjgrSWliSWY3aS9RWWMrdGhRUnRmZjBzZDZX?=
 =?utf-8?B?WXZCOUhBaGhZT0VIYThSSVZ5WENPa09Ia1FUZzdtRSsrWDFabDZQK1RDRXI1?=
 =?utf-8?B?SmNiclpyNjdNQXZRUnJ5MEx1LzhkYUFOcHkzcHhFditFSU5jaktjdGNrbDQ1?=
 =?utf-8?B?NVczWWZTVjRjTVJ0Tm1LWEUzVGZoMCtGbHpaelh0b1lNU0dDQytBZWZzUmUr?=
 =?utf-8?B?dTJmTjVYUGxlc2p0YzR2TGUwYmhKenJqRW5uaVRMS0NpTUJPWmIwYXl0Rms1?=
 =?utf-8?B?QzI5UE5oYnliRFQ2R2xDSUU2RVdueXNWMzBac3UzTUErdGtaaEE5MkZtQjd6?=
 =?utf-8?B?QXFsRytmdm41NDAxalJ2TzlpdXNuKzZkcGNmeWJmQUpGem5PTnUzK1RjcDZz?=
 =?utf-8?B?bWVuOWR0alhVa1JMYnF1WlRVOU1DRHVTMEZBcDJVYVFSNGFhSXZTZE41TXpY?=
 =?utf-8?B?VTZYclhtTm9ycHlYdFFvbFJNaUlGQkhUWWZSbis1bHVqaTc2VUYzbys2YmMr?=
 =?utf-8?B?QzJxNkR3eFcxTnd0QndsQzI5Q3F0OUtJdUV0S0ZheHFrWTZBQ1pRSGZDU1k4?=
 =?utf-8?B?MUtxaDJ6ZGtiaTBxalVWOU9vNXVSbFhySHlnUVpCUWloeWxhQUJaU2VhZFZ4?=
 =?utf-8?B?THJpTlJuUWpRSXpub0M5cVlZa3k0VEgyV0YwRTRsMTlVZENEaW9jZ0U4TTQr?=
 =?utf-8?B?RWI1WERmKzJtQ1FOTndxQUFJd1cveEMzNmEwdlNKWnVOVUd6THo0REt2b0lH?=
 =?utf-8?B?UlZ3Q0ZiQ2tHWHhzSEtldk5Kcmp3eGVPd0NMTFY3YmZrcEhsVmRkSjRBZDUr?=
 =?utf-8?B?bVpsOVo2QnJ4VzV0cVJSSkIxU3V2aERnOWhuQUIrMEZuMmVzakU3bzM0b28x?=
 =?utf-8?B?VVBENGlkSEhGaEM0UWs0UUlvUk1XZDhGdjhmdFFMa1MwZytobnVOSTlvRGFK?=
 =?utf-8?B?YzVYRFhmNEdKTFQ2bTlVNjFZWHorMXIveXBMc1cxOXVnME5mQ3pjeFQxSGZ3?=
 =?utf-8?B?NEZOOEVLSmtpdEJrYVJHMGdwdmovSUtTRWxDcnZ3bGF4dkg5RG1kUTEzck1z?=
 =?utf-8?B?U3krWjYycXhnbDBFWTN5U092VEF0c3ZIbTBxWkRQU1VlVDBhMDJxOHBQb1Bi?=
 =?utf-8?B?Y2dDc2VDaEpIYVVlaGtkYnZOUzlXTlJQTGpoN25ndTVVOVlObWY5UTNQTnBl?=
 =?utf-8?B?UEZmVGJNVEdlWENablRmZDlNcWUwcytTU0QxTFdzYTRDMFhaNjM3Z0Z2ZWVk?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b2ed21-7769-4a5b-038f-08ddc474e313
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 14:27:26.3355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fzu1gY9I8rDWo3urflcJkpJm0Db6ZsH1OOmblq77zGAn9U7HXxg0996DTD0IXSGVF8/oK2pE1c0Ey9KPbxHHqQsBZdfP5uUWYnyZrxqttMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
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

On Fri, Jul 04, 2025 at 11:02:28PM +0200, Tomasz Lis wrote:
> Parallel exec queues have an additional command streamer buffer which holds
> a GGTT reference to data within context status. The GGTT references have to
> be fixed after VF migration.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 37584a064574..96b94f7fcc31 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -693,6 +693,27 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>  }
>  
> +static void wq_items_rebase(struct xe_exec_queue *q)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> +	int i = q->guc->wqi_head;
> +
> +	/* the ring starts after a header struct */
> +	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch, wq[0]));
> +
> +	while (i != q->guc->wqi_tail) {
> +		u32 len_dw, val;
> +
> +		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) + 0, WQ_SIZE / sizeof(u32));
> +		len_dw = FIELD_GET(WQ_LEN_MASK, val);
> +		val = xe_lrc_descriptor(q->lrc[0]);
> +		xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) + 1, WQ_SIZE / sizeof(u32), val);
> +		i += len_dw * sizeof(u32);
> +	}

This type of constructs make me anxious, as it's relatively easy to turn
it into infinite loop. Can we rewrite it as a for loop? Or at least
something with a fixed number of iterations as a condition? (instead of
!= tail)
Or at the very least - add some asserts...

Thanks,
-Michał

> +}
> +
>  #define RESUME_PENDING	~0x0ull
>  static void submit_exec_queue(struct xe_exec_queue *q)
>  {
> @@ -2511,7 +2532,10 @@ void xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
>  	unsigned long index;
>  
>  	mutex_lock(&guc->submission_state.lock);
> -	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		xe_exec_queue_contexts_hwsp_rebase(q, scratch);
> +		if (xe_exec_queue_is_parallel(q))
> +			wq_items_rebase(q);
> +	}
>  	mutex_unlock(&guc->submission_state.lock);
>  }
> -- 
> 2.25.1
> 
