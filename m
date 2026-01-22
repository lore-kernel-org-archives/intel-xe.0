Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BC7C44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 00:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0DE10E0B6;
	Thu, 22 Jan 2026 00:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pj/6bTFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A726E10E0B6
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 00:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769041239; x=1800577239;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+VU4Uw6hyYXJjB4Po37Ce6c8Cf7VVycFA/4OM/lha/g=;
 b=Pj/6bTFgY9ocFTgVdHsNpiBUydUZ4MdWuo7UYQ/heTlc13BhGmJUb4nE
 eN9uYp7gCUlVPvF6Ttp3Z0wtXCDgxDUZoDHo52fqutTsLguSYDa5sHg5B
 6wMfIpuPk4eMDLAwhfUBEYHtSfMECvm+MV46fP8cOZJ2wXGj2yLV9j4oc
 3oyjNT3uT8V2xPOijxmkefcagRdcAZi69UCCM3BUDeVhCCovqLEtBjdVw
 17tc5UfvgOmz9XRjXOJu2jufaB6NFc+Sx8xDKDUmq+2C61IioSWk40Jxb
 nWeOSdnRChx2cvGGQaTgXPcSOBHh/UFNumRnAp1hYH5OR+rbWx017HiY4 g==;
X-CSE-ConnectionGUID: gUAnWW3mTxm5CBhvmESCKA==
X-CSE-MsgGUID: YLS89/39Soumxdb0gUvTzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80580950"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="80580950"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 16:20:39 -0800
X-CSE-ConnectionGUID: tTnwLOf7St6vFjvggTH9Kg==
X-CSE-MsgGUID: QNGiJFr8TtCeDtjIf4OasA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="206642105"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 16:20:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 16:20:36 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 16:20:36 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 16:20:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2TgU7rKW9dJAJn5mdBcv+O4MsK+FdCY0MHwBPX/XQIddqhbRJDBRMNiHm6On2l5H3xD0CAAzW+GLgLlsJZQ3FAWtINBJMechpkJN+lQfxlcnrLAw1JqGJMI2+Dc7wiWwobN8DI/QHygVXgLmOGxZNTClgJJzB+emDYuoafbtKzQStlkK9uCEAqNi+AH+AO7T7cuorUHhA1cc7n9h9Cbmqc1ecBeSDztcT//2KlYGZMZ7xrXmnf/DDYMyWD2q502FfaeQ+HVYGLN98k7x6PvzQ9C2Mah06R1c+qoOKuM6+ColsIu/BzwevSLhrXUlsSXqSPzmgSFRegL5pskG7W06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9d48dU11Bhf0j+fcbZT9omwN+MKsmUugsSv+5Zm/Iso=;
 b=Ga2FtwM09QQTtnL8shcdMTBVHt6PeItIIruu4V5EqCQ+mjTCB5VgxdCuzYM72H+eB6KznPA6D+3NUAElvErGW2vCefqU1Etd9LYHwFnecBLbXVc6HclpToIQ8lPfCAf6Nj8AxvFqiZEkZsP5mFJYueuzj3BaB80V2q7WLZ8ZCV+ZVKwW1rxa0hE3nPTbHTA7oIqllkkBQPpyjY1GmUD0vZ/G0cVZjXVKu1Y33ntaRQE7vT5hXD33nWIA1vpodP5M4zRQnJCblGa/Odbn9SovTnEv0Z7yCtc1JIf355F7QJzVyU6bqiaYt57ku3SP+7ona3vZKgHZ4ajeZKMwx6kMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6176.namprd11.prod.outlook.com (2603:10b6:8:98::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Thu, 22 Jan 2026 00:20:29 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 00:20:29 +0000
Message-ID: <84622a42-64c8-4712-bfe9-374e32cdd4b4@intel.com>
Date: Wed, 21 Jan 2026 16:20:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/tests: Fix g2g_test_array indexing
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <niranjana.vishwanathapura@intel.com>, <stuart.summers@intel.com>
References: <20260116002529.951176-1-pallavi.mishra@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260116002529.951176-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 89010f77-ab67-421d-d730-08de594c0c69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE43NlByZno0cDl2Zy9oZUZZMmllaDZVU0ovbGNDYzBDb1g0dDBFSWx0Zjlz?=
 =?utf-8?B?anVycTg0c3R4Uk42QzlHelVObWpLYXYrYmhBUEhQdFhBL2JSVlB6Y3ZDRFJo?=
 =?utf-8?B?bjRZbzI0YmZGbk15dG9BN2FvMElMOXZWaHlxTEFGUks3aEdrUWtNbHBUbFpF?=
 =?utf-8?B?STgvZ2FWVHFIWHNJVU8ranROZW1Tc1ZlM0hhVjFFanlrRWcwTnpBbm5Hckhv?=
 =?utf-8?B?anMzMSt0cEswTkVzLzVhWEZjcENLZmx2SWlhV05xU3ZySVlXRjdIL3ltL2Zt?=
 =?utf-8?B?VVQ1ZWRyQWRKd2Y5MFRndnJUYUFXS2Z5cEh3WmZMakdpM0N4RXhjOVJyOE5L?=
 =?utf-8?B?blNUSitZbWVpMGhkQWJMQzgxYmloNS9sVXhmV01CcnplRGlsL3VLenNRQUlp?=
 =?utf-8?B?a0xac1V6SmdVZGhXaEZQS1FJMGU1MGZrUlFQOHNVRXMybFFWMjdNeUE3OS81?=
 =?utf-8?B?UkY5cjNhb1hsWW5YYWlmaWZjcWkxK3BYdGJ6VFZIUDZpVWZoRVZhNk1hd2Zy?=
 =?utf-8?B?UDdWQXRWd0JiQm5VOFViSUJuRjBrM0lvT2NNWDV6V21ScllkVmdaSHFhbVQr?=
 =?utf-8?B?Rm1TVlhQRWZ5YWtqS2ZrdVIyVjNhV1R0WHJUL2c5ZEFOdkNPS1lhV2hkYUZX?=
 =?utf-8?B?VEVGRmRmYmpBN3YrSWxRMjRuVjgrK1h4ZHBIbHVOdExPc1J5UHk0NEZEeENS?=
 =?utf-8?B?UDAzT1hhR1JrdlFPMVJtd0lKL0hYWGxYU295ck01RUNsK2tOclBDUWJTVmZy?=
 =?utf-8?B?WlJON2dYSGZTUTlOSXBCZW52bkpBcUhZRTZ4SVpOQXZrUHp1Zk5YWHp2bkJO?=
 =?utf-8?B?a1JMNng0YklZSjRQWUd1NDZkcjRlcFJaa1ZxRVE5MGlsVlJkZ1Y0WE1ld1Nu?=
 =?utf-8?B?ZHZWS0lwOHZlbWJjZWNmd1pvY3UydFFaeTlUL0xhSno4K3JxRGJaUHU1WTVE?=
 =?utf-8?B?NFV3eTRyREJQRnNCMnkrak5BQXlHN2RpQ293NHd3d2NQWTBITGh6YWpuOUZm?=
 =?utf-8?B?TGpFZU9nM1BnV1FHVk1PWFV6eG5tUUluMFB5cjJDRzZyU0tpS0RjZFNtblpi?=
 =?utf-8?B?VnZCVDY5SXdNeGhGbkFXR21Sd3doaGJ3b05VQjkrdjFwY3k5N1dTZWpqeExo?=
 =?utf-8?B?WVFjZWkyVDBRVGU0WXpKQi9BZmtzTzZHN1NYZUxVSEFBd1g0NVFHS3BvcFAz?=
 =?utf-8?B?OXlJdC9qSXZGaDQwbzRGazNyWjZ4cnV0eDRFbEMvZFBrcUhLb2s1MnllcVk0?=
 =?utf-8?B?RGxwbU5LY2k1Um1tWkdsOVpoSk1tZ1RibWExb2orSjNtRU11Y3JoaDR1bTNV?=
 =?utf-8?B?RUh3bnl4SmwvdXo3c3p3L081dHFlQ2lyWEUzWWV6S1Q3cnJWUnM1SzA0RklC?=
 =?utf-8?B?WGFIQ1FZWUIvVzZDMnJaSGl6bEZrUkxUUnBpQzlvdXNOM0psM1pCQTU4Y3F0?=
 =?utf-8?B?Mk9CeW53ZEhrQm5BTGQ2ZkhGRDYzTklhS1dNenJ1bGt0R3UzbU1HTlBBblZY?=
 =?utf-8?B?YjV0Y3lBV1lUMnF1Nk5MOGpRaWVkVlpMWVJzMkIxVmpBbFErTzdqMHJ0QWhr?=
 =?utf-8?B?d0FyOVVUY2cvMjNIVlU1bWxvWEMvdHVFZlV6a2ZVTldpTnI1aUhaUnRnU294?=
 =?utf-8?B?a3VoRFpFUDl0OS9JK0VoSG1NTkQyS0ovRkpYNG5hallubzcvSm1sQ2Rscndi?=
 =?utf-8?B?cmljelZyd1dGSFJQWHNjV0ZNNUJ6akpKdUlreDJLZUlPWUZwQ2pXcHhoZFJw?=
 =?utf-8?B?YTg3d2hUdlVUUkZhUGovR0lKd0pwVllIdUxvR3lIdUlUUXJQWU9HWTZwbGV4?=
 =?utf-8?B?ejR6bXhkVlZFaWM2MVFkN083YW9GZVBBMUFvalVwT0NDOHQrVjhhV3BMSjUr?=
 =?utf-8?B?K1M3eTFWbkF2R1FvbGEzZ0I5WUdhK1MrbmJjbk1WVU8rQUdmNUJkN1c1V1VD?=
 =?utf-8?B?eDBNemlBaDd1RURlSHVhWFJPL1lhczNTLzlIQVlZaDlQc0w1YWdQOWp5L1No?=
 =?utf-8?B?eG5uaVFnYWNjR0dSQzlzMXRYU3Q4OXd0SWdwTU9ZY3RRODI5TGdBWVB3YjBJ?=
 =?utf-8?B?UW5PQnE3U0tXSzhkZkw5OENsWk9ab1JRajl4MnBNYUpBVGxnWjJmR3EzenpX?=
 =?utf-8?Q?5mAw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlZwOTBaKzBFb2Q3RmZ5eG44bFY2V2xsR2UyYXdHa3VwNmJjczVmcTRJaVpi?=
 =?utf-8?B?M3BTbzM4MHk2ZUYyN0xMaWwzUHVlMURMOUw2S0owV2JyT1lBeW5vcSszN3pz?=
 =?utf-8?B?ZnBwZ2tEMjlMWmx4Tm1vM1crK1Fub09PVTRXYmR3bDF2QnQ0a2ZHcE5wOHBh?=
 =?utf-8?B?MDc2cTAxbU1ZbFprdnlFQU5ockhLREpiVWNwNXlJYnNWTlFQQ3BhWnVwNlBP?=
 =?utf-8?B?cWZSbyt3UDdLdmV1QWlsL0ZSYmQwc1lvbGZncnlSNTNpYTdkd2g4WW96MkhG?=
 =?utf-8?B?KzlMMjZlZnBjeEx6UzF0ei9PTzBNWXdZa3l3R0tScXhCcnpZVzFlREJYZnJB?=
 =?utf-8?B?ZmMzTlYzdkNtYTBQVDA2VGM0dGpIaE5adHAzZ25vVzBiWDlXcnJyQXJpVEo3?=
 =?utf-8?B?OW9oaVFEaUJmZjFOSUxCMnh2ek5kTFMvbUpFYUFhTk01ZmMzOUZmZEdrUE5E?=
 =?utf-8?B?bG1XWjUzZ045R3VIbVphWmI5eUtzTDYyV2FiZlN5akdKTWkvd3UvTVFnRGVW?=
 =?utf-8?B?ZCtJSjRSdGkwN0ZvcGlFNkVSVTFDaHgyL2crZWlvRHlqTFd1SEM3ajNtNjRM?=
 =?utf-8?B?RW0yV3NPdDMwR0NzeTRicFl3OGo4OTJUY25Kd2lULzNXYXJHZkl2ZmljeGZG?=
 =?utf-8?B?dW1HbUwwQ2pDYVdCUUV3TU1lYlVEQStZaWdxcnZOa3E0TEZIOHBlcHVFVkgw?=
 =?utf-8?B?STluelhRckl6UE5NZWdjVjgyb0xUVE1xbTNCTDZPM1p2dUFuOU9EZDhRdnY0?=
 =?utf-8?B?cjBhMFJicFRqeDZ5bmJicWxxY0ZLK2hrRDZYdzZmaHJzMHlpbVU4VmVqd1BZ?=
 =?utf-8?B?NkwvNmZ2dWxnaytBOEVrcGl2eGZ2RDlLQm5uc2M5ZUpwbzlBOGJuY2NXRndr?=
 =?utf-8?B?L0llQ0VhWXpFa3BVU3VINGhuNmZxa1FxMTh1S3VGRUtwRmFNWml5cnZRbzJC?=
 =?utf-8?B?dzR1cDFkaVljb2Erc0NvbjR4UGJ6VktmZm9WMmZaem16Uklnc2ZLelBiaW41?=
 =?utf-8?B?NjZzZVp6aXpxYjNhM1c2OGFYMTZvRFRrMVlmczZwN25uV3BIa1dHcGZZOWRH?=
 =?utf-8?B?U2ZOY0VCQVFYRURZOWZGWVZJaFVrTktmMDRIVUZqcm5Tam9kWUl1TU9QZGRm?=
 =?utf-8?B?b1Jyb1hWVTFtWVRXNTVmZVdueERnYVM4ZG9OUFBYUWE5QTVCMkFvNitBaDlI?=
 =?utf-8?B?ZEoydWhKbzNiZCtOWDFaZkJaOUQzYW1Bb0ZGUm1LSHhvOVAwcmd1YjQvYUdj?=
 =?utf-8?B?UFVkQUNJR1V5eVRORGltMUNYOWlWYXBaL243Ym5lOGRzc0l5Z1Ixa3RhZUx4?=
 =?utf-8?B?djJ2Q3RrV3FSd1pxNHpRcG90NjlwUktEc05BV1FsdjVNcHZSdFJEVzEzSEQx?=
 =?utf-8?B?aTVvdW5xWDhhVEFlczhWV0kvak5JbGw2R0pLcjJDdHkyejc2MkJmSFV3V3lm?=
 =?utf-8?B?ZU51OFpuRnhTWlo5dlF1VEVraTZwWHJ3Um5jdk51cGVRbi85dllJWjI0WGp3?=
 =?utf-8?B?MUY1cjcvbWFHTnBKS2lINk5CbGlmQytSSlFnM21VbXd1dDVFSWdIN2xQTmJt?=
 =?utf-8?B?dm1TRUZPVmYwc3pjcERoQU9OWTJkcjVuVjExdzFscFpOR0dma0JtdDUzV3Y3?=
 =?utf-8?B?cjZ4WGVaZlVVMTEyY2JBTTZMWXRNdTVlWnRWQnBUTk1pNkR3cVU0QzhIV1Rm?=
 =?utf-8?B?NkE2eGhkKy93czVUREkxMWppRFFhanZvUFdVa3QrclBIN1hHbWF0clBOQ2Y3?=
 =?utf-8?B?MUFsbzZadVZoSVVwTXc1bzk1ekhiOGUxV0lSU2xaK1pQYnh2Ly9lVUg5K1Vz?=
 =?utf-8?B?R1NIKzFucVpyTnNVSUltUjFUUU8xR1J4MUJCbzJEc0gvb1dsRnhQVU5kaFpv?=
 =?utf-8?B?K0huV0srWDdlSjRPaXp5VEpCcjUvd0FVdTk1R1dlVEh3K0RSaVpWbDMwdzVL?=
 =?utf-8?B?WFEwVE0vMGFBY05wZVdkQlJrdnMwWVkzODVRQjkvMlZzWnNSdTJmRTJyL1JM?=
 =?utf-8?B?d1JsUUxocWhJMTMxSmE2Q09yTnB5VG5HTThsNG1sZkdodlFJdkwyV0hzK1hv?=
 =?utf-8?B?dmlWSDJJWUFhUTFVZkJGMGZQK2VzdE95Mnc2QmE1by9wTVJMS2FtcWhGZFVE?=
 =?utf-8?B?NTJnM3VvRW81NFFEd0xvdkRlMEtPV1ErK3dML2k3a2NLeTJ6ajUzV2hzYU1t?=
 =?utf-8?B?TTd6U1gxeTlVY2FnRUJqWHdXWkdZVmRRVWo4emVQanBwSllPNm9Xbmk5Wm1s?=
 =?utf-8?B?Q2I0dG5RYk8wY080QUJITDIrSGxWM1o0eTdZM3g2a1llTWJUYWVuVGxaWklh?=
 =?utf-8?B?OWpMVzdKbTUxYVN5YW5sNUJyMFk5c0svODVSSG5pWmZabmhVbVp4dy9Jc1ZF?=
 =?utf-8?Q?VXJCy6rub5nFuz4w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89010f77-ab67-421d-d730-08de594c0c69
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 00:20:29.6232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndjExunpLhIAXVQqy3I9PjP8pJRUk4Huou/ZfXqki6jTR7eETeZFv8+jdEmIhJ36H2c2/obnuz3dGkMU5PQ17f5I9TdYU4A/Lq5OAUq0RkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6176
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



On 1/15/2026 4:25 PM, Pallavi Mishra wrote:
> The G2G KUnit test allocates a compact N×N
> matrix sized by gt_count and verifies entries
> using dense indices: idx = (j * gt_count) + i
>
> The producer path currently computes idx using
> gt->info.id. However, gt->info.id values
> are not guaranteed to be contiguous.
> For example, with gt_count=2 and IDs {0,3},
> this formula produces indices beyond the
> allocated range, causing mismatches and
> potential out-of-bounds access.
>
> Update the producer to map each GT to a dense
> index in [0..gt_count-1] and compute:
>      idx = (tx_dense * gt_count) + rx_dense
>
> Additionally, introduce an event-based delay
> in g2g_test_in_order() to ensure ordering
> between sends.
>
> v2: Add single helper function (Daniele)
>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 56 +++++++++++++++++++++-
>   1 file changed, 54 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> index 3b213fcae916..ec18086b98d8 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -48,6 +48,38 @@ struct g2g_test_payload  {
>   	u32 seqno;
>   };
>   
> +static int slot_index_from_gts(struct xe_gt *tx_gt, struct xe_gt *rx_gt)
> +{
> +	struct xe_device *xe = gt_to_xe(tx_gt);
> +	int idx = 0, found = 0, id, tx_idx, rx_idx;
> +	struct xe_gt *gt;
> +	struct kunit *test = kunit_get_current_test();
> +
> +	for (id = 0; id < xe->info.tile_count * xe->info.max_gt_per_tile; id++) {
> +		gt = xe_device_get_gt(xe, id);
> +		if (!gt)
> +			continue;
> +		if (gt == tx_gt) {
> +			tx_idx = idx;
> +			found++;
> +		}
> +		if (gt == rx_gt) {
> +			rx_idx = idx;
> +			found++;
> +		}
> +
> +		if (found == 2)
> +			break;
> +
> +		idx++;
> +	}
> +
> +	if (found != 2)
> +		KUNIT_FAIL(test, "GT index not found");
> +
> +	return (tx_idx * xe->info.gt_count) + rx_idx;
> +}
> +
>   static void g2g_test_send(struct kunit *test, struct xe_guc *guc,
>   			  u32 far_tile, u32 far_dev,
>   			  struct g2g_test_payload *payload)
> @@ -163,7 +195,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>   		goto done;
>   	}
>   
> -	idx = (tx_gt->info.id * xe->info.gt_count) + rx_gt->info.id;
> +	idx = slot_index_from_gts(tx_gt, rx_gt);
>   
>   	if (xe->g2g_test_array[idx] != payload->seqno - 1) {
>   		xe_gt_err(rx_gt, "G2G: Seqno mismatch %d vs %d for %d:%d -> %d:%d!\n",
> @@ -180,13 +212,17 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>   	return ret;
>   }
>   
> +#define G2G_WAIT_TIMEOUT_MS 100
> +#define G2G_WAIT_POLL_MS 1
> +
>   /*
>    * Send the given seqno from all GuCs to all other GuCs in tile/GT order
>    */
>   static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqno)
>   {
>   	struct xe_gt *near_gt, *far_gt;
> -	int i, j;
> +	int i, j, waited;
> +	u32 idx;
>   
>   	for_each_gt(near_gt, xe, i) {
>   		u32 near_tile = gt_to_tile(near_gt)->id;
> @@ -205,6 +241,22 @@ static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqn
>   			payload.rx_dev = far_dev;
>   			payload.rx_tile = far_tile;
>   			payload.seqno = seqno;
> +
> +			/* Calculate idx for event-based wait */
> +			idx = slot_index_from_gts(near_gt, far_gt);
> +			waited = 0;
> +
> +			/* Wait for previous seqno to be acknowledged before sending */
> +			while (xe->g2g_test_array[idx] != (seqno - 1)) {
> +				msleep(G2G_WAIT_POLL_MS);
> +				waited += G2G_WAIT_POLL_MS;
> +				if (waited >= G2G_WAIT_TIMEOUT_MS) {
> +					kunit_info(test, "Timeout waiting! tx gt: %d, rx gt: %d\n",
> +						   near_gt->info.id, far_gt->info.id);

Sorry I missed this on the previous rev, but shouldn't this be a 
failure? If we don't get one of the previous messages then something has 
gone wrong.
The patch looks good to me apart from this.

Daniele

> +					break;
> +				}
> +			}
> +
>   			g2g_test_send(test, &near_gt->uc.guc, far_tile, far_dev, &payload);
>   		}
>   	}

