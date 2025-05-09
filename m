Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13197C3ABC5
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 00:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF1A10E227;
	Fri,  9 May 2025 00:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KQaFZo8w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C3E10E227
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 00:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746748910; x=1778284910;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E5YHRduzhxJERjV4wHNlQs9wy7iG2O+t68w+hhP2fIQ=;
 b=KQaFZo8wD+jSzN/zOaNZgbuHpTJ0lJ5PXjIvQ7RBW/SNZicY8JCZLtsn
 mQoeqhP1cRcRSm0waLkneXBmxr1ExOX3PZUumi7RokQ7ev70pvHMShmNZ
 e6L02/oR3JoYqD3vjRf3fINZLdD47JAmEZ56rBGUocEeQCSIcCZzDwsx/
 e9fpakzGVvdNy++5Y8mLg2m4dKmvOK/blduJXPV1N2DSoIsmNoHdixO8i
 Khox4evAmIWMSSOg25OG44sQtSXtcAAV1I05TQ1Q5tUBGEviIQdaTksjA
 9meruak64H8CHeGnic5TgiGephIjUa4ydnBg6/rajk7EUJQ3f4j1eyvzx w==;
X-CSE-ConnectionGUID: Lbw58NdeRrOZa9ZLEtuCJA==
X-CSE-MsgGUID: +ShyqqO3SaqAk6rwTb7jZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52374381"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="52374381"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 17:01:50 -0700
X-CSE-ConnectionGUID: 2bD3qFRFQge1fcMEJaccVQ==
X-CSE-MsgGUID: SIudgMlISqaRntda7vA9QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; d="scan'208";a="136968463"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2025 17:01:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 17:01:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 17:01:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 17:01:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+i/2pjuqEzhg0OJoX8NaSigKOMDKLsEi9kHGyTgDAGQ4EmUGJIjJohictjhfgRbc3n0Lf751Kdm4yZLcudS6S0SxEu95VXwQ4aQyHUsXBIuZfWd3j7o8ApX66n7Ex7M9YJ7d5M/ZJo6qr7E+2DN+BO0Dtdv/V9lIFJDVpMVKAI7n0ETjORoi+vS8sREZ34BaML9UQ6K01U87BsVVKuCmTpYtkOExd1MGdiCnlqQKs81XHp291tj4b3XuON0J+oWtGSrKTMAttZW0nwRXUaRo/ttFiXIsG1EIwcfVTaRg3nYlNL7Wiq4QJtrK0MobUuyfCjK9fcZS4M9i4wKWtkBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hIEpeUNI+bs0Xnqr67S/59BF5LDDUy5XqAF1ipKfjo=;
 b=j2oLHtYAl9VyxjsApLj4Z0THu/qhNc69thAlyWIQh63nxliw3/nad9v8ab3DcfyhrwJk304/IYu7/wm8ZdKORSxSDO1qOx7XtGxo5uKax3EYy6xQSGKmshAIhr3qk1feBcrTScaVbGkQvq2z1ZHqPl9IeIIt3G1MIHXMlYsSG9bGzky/P6Hq6r0nxoMqnEd5OpkGtKh3cyTnkmwFMb110LSZrzFG/ijXCtwBQ4fwvE39ti5HN6ZmM6YIcrcAJIdrsgrAgpzvE4zZW15FtHB5xfojKQ15IDaCuTeVnIowtaHAFQwBPdWh2jtdTwyohNPc9plDa2NyGEM3+X83eeKIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SJ5PPFC15A51B16.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::851) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Fri, 9 May
 2025 00:01:27 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%6]) with mapi id 15.20.8699.024; Fri, 9 May 2025
 00:01:27 +0000
Message-ID: <7badc6af-1d3c-430f-a024-17630e9f29f7@intel.com>
Date: Fri, 9 May 2025 02:01:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/4] drm/xe/guc: Introduce enum with offsets for
 context register H2Gs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250418141035.3841296-1-tomasz.lis@intel.com>
 <20250418141035.3841296-4-tomasz.lis@intel.com>
 <d0d6d5e4-ffa3-4290-bf61-89f71ce9e04a@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <d0d6d5e4-ffa3-4290-bf61-89f71ce9e04a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0306.eurprd07.prod.outlook.com
 (2603:10a6:800:130::34) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SJ5PPFC15A51B16:EE_
X-MS-Office365-Filtering-Correlation-Id: 72604101-f348-44fd-36b8-08dd8e8ca4c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEJwRk5VVWdZY3JHRFd6czRrU1QzU29iZ3dVNzBlTHl0Ukc1QmR0R1lka1Vm?=
 =?utf-8?B?djZNbGk1aUc4K1pmWUlCOUdLVFFSSGw1bkhQT3dValRiT0NISnRkelI5TzhK?=
 =?utf-8?B?MFA4YWhscC9RRWJ1Qnc3bTNSNy80cHVpQm9kM3ZCVXVJTkhwMlRKNHovRDJj?=
 =?utf-8?B?WkZxWmlaa0E5ODBJZlFQbmtkTGZPUktLcURhSHQ0S09lakJMQnRrZnVaYWRa?=
 =?utf-8?B?WmdLQjNqaTZLbUhjYmN1bmxEdytzakJMdkpHdkE4N0dsN0t5NFpvS2o5SXZT?=
 =?utf-8?B?WDU2UU15YS9JejJ2MHNKYUg3OCtqeXpQV0JVd3BHcldxaU9aVEkrWFEyN3cw?=
 =?utf-8?B?c1NGVVA3NEJhMnJQcE1leFBobUVxTUlCdEFjMm90Z3JoVTJ2ekU2QU11Smkw?=
 =?utf-8?B?Sm9OMEdvRlRnN3RxdWp1MHNuNjZETXBlNktVRS9QanBoKzBQMHlNKzk1UXk2?=
 =?utf-8?B?cFVTbDdIYTRuY3V0UmtHTjMybHBjb2cwcGoyOFhxdmdTTlFibklRa2hEbWJT?=
 =?utf-8?B?MjI3YkFuYzNkd0w2dk5JT3oxT29BcDdIQWg4YWovZEVWd081bGNZTVZYSjM1?=
 =?utf-8?B?NUJFT3VpN0tHL0JPTWE5SUhSN0ovRHNWN3U2YWsxdlhBeG9sZ3BpQlVra1Vm?=
 =?utf-8?B?dExnQ1dVVTBYYmxqVUYzY0RUbExDbU9oaWpDSGtuNjBsTCt6Y3pyRWxGc0l2?=
 =?utf-8?B?bkZzaVVOU0Vhc0REcjhoKzBRNmJ0cFRIY0w3V2w0dlZVcDVjYUxudWlKQzB0?=
 =?utf-8?B?dkpSYmMrd2VXdHVUcVVRQ1E2NG9mamlXREpReE9kTnF2b09oeDNGS0F4dXpu?=
 =?utf-8?B?NXY5REVlbFFWenJheGJkK0Q1czJMeXQvUktNZGRSVEJEdTFIclBGb0E4eS9y?=
 =?utf-8?B?S3lwM01iNEZGOFFwUFdvdElucDR3RHErNEMzdi9PRjZ2RDcyenpXa0VybjRB?=
 =?utf-8?B?ZEtwVTQrMVQyaEtPYTB2L0c0ZVdxTkU4TXRmdjd1OUloR3dUN2ZDNjFBR2Vr?=
 =?utf-8?B?cVpmbHFMV2lHUzRzaStjWW56SERZdGZlYnV5MXptT2VYbEV4OG1BL3JXWWhz?=
 =?utf-8?B?cU5FdERLaUNUbWFHcUJab1FIQlNjZnB0U3JLVk1rUWlWRnY4aWJSV0dkK2pi?=
 =?utf-8?B?ZXlPZXhTUW16aU9zWC9EaWVtRXpWQStjN1Zzc2RxY3l3YjVpYWtVRUJ0TkFZ?=
 =?utf-8?B?TEJjQWROK1I4cXl4dnBldnFEWStzZUh3UDhOOXhKVXRNOHdFd2NUMHd1L2Z0?=
 =?utf-8?B?Z1BHTnJFWk4xYkdvMEh3SHFBQ1BxMEtSNWZESHNvRVQ5YVpQM3lyZzdDKytJ?=
 =?utf-8?B?WHM4bk8vbm9STVg2RjBxVm1HQ2N1VWwyaGVNcjIxbjZIRnlFeHJ4UTdvOFNN?=
 =?utf-8?B?U2xBWjhHU1MyaDdKVFJkNE83Z0dtNmgyN0xxUU5tbmx6UU9WdVF6Uld0TWpo?=
 =?utf-8?B?UTA3SExaK0N0Z1VVZGVlT1d1c2VhRnlUaDdaeVg2K1BCUGh1aG1YcHBTYWxV?=
 =?utf-8?B?eG9GSFVOeFFrU1MvTFlFeC9idkxva3F0QW5ZNncvTWdIaW5QK3hzVWtvTU5N?=
 =?utf-8?B?Tm03a2E4cjBNdDJvK3ZObHdTeU5sVjVkR1NMY3ZWOFNRMGlwNVdZbHBCWEhC?=
 =?utf-8?B?VE82NTF5L2QwM1NqQ092WlRteTZaSmlVcTgvZHA5L0V0R01IWE85aCtkNEJU?=
 =?utf-8?B?bHBiUzB2RjBFRzY0bDhZaGkrcmVONG4rZ2FYN3lGeTVURkNjem9uaTR4b3BI?=
 =?utf-8?B?ODRZYW1JcDFMWGVFM0lzaWR0N2lER3huTEZGL1BEemFJcE1Tc3hiSGFvSEhF?=
 =?utf-8?B?VWl1dTJFcEwzdDJ1SktpYm0vd3BhREVVc281M0x1TkVWUXY1OXd2NTUrdTgz?=
 =?utf-8?B?Y1lzOHl3QlRISzM0SDdqdEx4cElEV1RTbFc2SGh0Zk5vQkZnTW9tby9zWUpM?=
 =?utf-8?Q?fxns0Fqhzck=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajFaOFVOcEdjdHdQQ1prWTVKenQ4VDRUZmw5dllHTXFHRE00cDZxMTZreURW?=
 =?utf-8?B?ZzhUSU1JSWsxS25lY2c5YUhWc1RQeHVSZGZLMDU4cE5EWGhxR2N6UW9ERFZS?=
 =?utf-8?B?KzZLaFJYRFE2WGhvclh0aTQvSXZMRFRBcW12RHNzdmZwL3ZIQ2RRR0VhSGNK?=
 =?utf-8?B?dUpDbzFJSE9nTXpHVUNvSllKcisvQ0lha2RoRisydFYzdTFNcjBlSnBVYWl6?=
 =?utf-8?B?WDJ5MFIzUlNGdURkOG5USHBLL0w1cXRtNk1YSExISithMkcwYk56Tkh1cW14?=
 =?utf-8?B?R3d1SXZRWUlmRU1MdytqZ09JUjNEaXR6alZXdmlrR0d3NjVJNW1wVmw1Qzl2?=
 =?utf-8?B?Q3VNYnhlMy9pMnZ2TWFaTjRUU0xYZVRNRnhmZHA2Z0VXdkMreW9DWE55VU5j?=
 =?utf-8?B?SlpCSm9NNy9kdHZSWXFWUzFLdXVrV3BWT0FjVHBXaXpMSGhVWlFubXFpR09O?=
 =?utf-8?B?SzFIakowaW4ySDJtS3FHSE13MDBndU40MkZmK1dCV3VZbDM1aU4vNFNZRktI?=
 =?utf-8?B?THZCS2JWZysyL3VkcnYvVnU0cU5WWHhuNWk3UTdmbzFmMTlmVU13eHNQazJt?=
 =?utf-8?B?ZksxTy8rWjRtMG5nWGVaYk1WMk5ocFFhbUpDbGNWSEprMnRWcVVEblB1TWo2?=
 =?utf-8?B?d1RaSWM1WWRpZkJ4MGkxTUNkT1dBa2FldnZ3R0lNMDIzZ3JVa2dHMlF6QWgz?=
 =?utf-8?B?dmhJOFRUNldtYVdyT0EzcjIzVXJMV2prNEY2STk0cDB0OFcrMGQ5ckdsbVQw?=
 =?utf-8?B?Qjk3Z1hZeHZrbGZJNG1nTVpMWXpFUDBEekNOQW51Um56VlpYNkpYcHplenBz?=
 =?utf-8?B?dTRMMzQ1QXlNMHBROStEZnhsTlZWTm1MRFI3N1RhMEMzRW9JOG90aklZNFNx?=
 =?utf-8?B?T3dFRWVxdGhGTjJPRWJpU2RISlJvTnlBYTJoTVYyL2Q3S3MySlJwLzlRS2hz?=
 =?utf-8?B?c0tlZ2JacC9FMnJnSWRrNk9aNHFiZWo1eTYyeFJIWW55NzFGWXQxZlhwUEEw?=
 =?utf-8?B?ZngvczRSaE15dlpYSU5QcjVKdEZzdFlkaFZBdzJTOUx5K2h5RlVtY1huNFJs?=
 =?utf-8?B?VHpRSitZRm1JTWNUMGk1YXpPNnY5UHd4NGh6dEpCRmI5M2FtQmd4Y2I4WmRl?=
 =?utf-8?B?ZVplcFJCcnJxODZrUjZOa1ZSZWh1V2hncWVUWXI1Rm1xRnRZY3BrdUVKR3dh?=
 =?utf-8?B?am83MTlwbWdZbXd2cUdUak1pbGp1RjYzMXRaTWJITXJ0QmhRQnlhUlhqc3RF?=
 =?utf-8?B?czdqdEFCVmMxS2ZpSHBPRUY0eitoSWg5L3VZYnZVWHZIakJUdFNCc2UzV0N0?=
 =?utf-8?B?Zm5GeWVKL1VUb2RMaS92bVJtakdMOW5jdmhNaUd4UytNb1dRYXQyMkZZd0J0?=
 =?utf-8?B?T3ZPdjZrenRVT3B1UzVaOHZlUzkwZUxBV1VjSm1QVEI3Z3VHK0t4czlKZXBt?=
 =?utf-8?B?M25uc28vbGtwYmlDZm5lNTdNc0NaNlJ1Lys5Rm9SbWRFN0REa0xOeHBTSlZ4?=
 =?utf-8?B?bUh5N0xIZjlYeHljNllPb25panJCdFIxejY2YmdZMUEycnpIVE9YYm04UjJw?=
 =?utf-8?B?WUR2WU1aQ3c3RmE1ZTBMWFlDVldaZHB0SGhIQ1dGaFBZZFg3dHB0SHVwdnZZ?=
 =?utf-8?B?YnJCNmQyd0ZtVDBHOHhpQWROUUZoRG9WZ1RLU2NVLzhpM2pQaWJNMU9Xd05F?=
 =?utf-8?B?dFdjN1c0TG90a1ZQa2x4ZndEMFJ1MnhjQzhXSkRDSHZydG9ZRmdsWjJyRlJq?=
 =?utf-8?B?ZGNYZm1qNFlNeWdTSExjTTlqTndFa3QvREgwMzUzKzdXVVNKdjdxczg3NWxw?=
 =?utf-8?B?T21wLzJKOVdwdzZVMGprdlRtNU02Z2dOaFRUM0hibnpxc0hoRlJHL2VtK3p6?=
 =?utf-8?B?RStVZGUvQ2FwNHE0YWFJRkN5SlAvaW1RZWhCM3AwQnN5ejI0VzJ5QmhuZFFM?=
 =?utf-8?B?S1RwN3A2Ri9GWVBTT0p6QVNadmE3OHh1WDlTMWY2R2tjWW1TM0Z5cGN0MFBj?=
 =?utf-8?B?ZFdIVlJwU3FtYkovaVBkejBaWk9uRDVLZzEwZEgvem1hdVF5WEpkS2Nrellq?=
 =?utf-8?B?VjhpdnpNTURsZ01kejBQeWtqdVFQWEJoRW04Zk8wdWQvbFlkS0JTdGVRQXN0?=
 =?utf-8?Q?8ZHAwbJbOxFZUlrUg1hv2u8df?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72604101-f348-44fd-36b8-08dd8e8ca4c0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 00:01:26.9861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16wsFRq6dtQ30TEfD6oLH1HsKI7K3LzpNIBlAyuFj85Ad3HPjdI8x02XdIpFBR3uapxmZIqkRjDzbiZyCe68ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC15A51B16
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


On 23.04.2025 10:35, Michal Wajdeczko wrote:
>
> On 18.04.2025 16:10, Tomasz Lis wrote:
>> Some GuC messages are constructed with incrementing dword counter
>> rather than referencing specific DWORDs, as described in GuC interface
>> specification.
>>
>> This change introduces the definitions of DWORD numbers for parameters
>> which will need to be referenced in a CTB parser to be added in a
>> following patch. To ensure correctness of these DWORDs, verification
>> in form of asserts was added to the message construction code.
>>
>> v2: Renamed enum members, added ones for single context registration,
>>    modified asserts to check values rather than indexes.
>> v3: Reordered assert args to take less lines
>> v4: Added lengths
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com> (v3)
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h | 31 ++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 17 +++++++++++++
>>   2 files changed, 48 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index 448afb86e05c..3c2808fabc6a 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -161,6 +161,37 @@ enum xe_guc_preempt_options {
>>   	XE_GUC_PREEMPT_OPTION_DROP_SUBMIT_Q = 0x8,
>>   };
>>   
>> +enum xe_guc_register_context_param_offsets {
>> +	XE_GUC_REGISTER_CONTEXT_DATA_0_MBZ = 0,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_1_FLAGS,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_2_CONTEXT_INDEX,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_3_ENGINE_CLASS,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_4_ENGINE_SUBMIT_MASK,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_6_WQ_DESC_ADDR_UPPER,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_8_WQ_BUF_BASE_UPPER,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_9_WQ_BUF_SIZE,
>> +	XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR,
>> +	XE_GUC_REGISTER_CONTEXT_MSG_LEN,
> didn't notice this earlier...
>
> this enum, as it's name says, was about param offsets, so adding here
> MSG_LEN is not the best fit, likely should be a separate #define, unless
> we want to say that this enum is just a placeholder for random defines
> related to this H2G action ... it's just sad that we don't have (and
> don't want) unified way how to describe GuC ABI messages consts

Using last enum entry to get length is a commonly used trope. This is 
not random, enums by design invite the opportunity for such define.

Will leave as is.

Though I won't have an issue with this changing, if we ever reach that 
unified way and we decide to keep the MAX_LEN outside of the enum.

>> +};
>> +
>> +enum xe_guc_register_context_multi_lrc_param_offsets {
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_0_MBZ = 0,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_1_FLAGS,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_2_PARENT_CONTEXT,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_3_ENGINE_CLASS,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_4_ENGINE_SUBMIT_MASK,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_6_WQ_DESC_ADDR_UPPER,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_8_WQ_BUF_BASE_UPPER,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_9_WQ_BUF_SIZE,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR,
>> +	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_LEN = 11,
> same here and also this one should be named, as already suggested, as
> "MSG_MIN_LEN" since this message has a flexible length and we can be
> only sure about its min size (or max if we consider max CTB msg len)
Will rename.
>
>> +};
>> +
>>   enum xe_guc_report_status {
>>   	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>>   	XE_GUC_REPORT_STATUS_ACKED = 0x1,
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 813c3c0bb250..cfc65f21b2f7 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -487,6 +487,15 @@ static void __register_mlrc_exec_queue(struct xe_guc *guc,
>>   		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
>>   	}
>>   
>> +	/* explicitly checks some fields that we might fixup later */
>> +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_5_WQ_DESC_ADDR_LOWER]);
>> +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_7_WQ_BUF_BASE_LOWER]);
>> +	xe_gt_assert(guc_to_gt(guc), q->width ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_10_NUM_CTXS]);
>> +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_MULTI_LRC_DATA_11_HW_LRC_ADDR]);
>>   	xe_gt_assert(guc_to_gt(guc), len <= MAX_MLRC_REG_SIZE);
>>   #undef MAX_MLRC_REG_SIZE
>>   
>> @@ -511,6 +520,14 @@ static void __register_exec_queue(struct xe_guc *guc,
>>   		info->hwlrca_hi,
>>   	};
> nit: since v4 we also have MSG_LEN so we can use it in action[]

You mean assert for ARRAY_SIZE(action)?  Makes sense, but the 
initialization within declaration will get removed anyway.

Why - because we will add GGTT address locking in one of upcoming 
series, and we will have to lock before the action[] is filled.

No need to pretty a code which can't stay.

>>   
>> +	/* explicitly checks some fields that we might fixup later */
>> +	xe_gt_assert(guc_to_gt(guc), info->wq_desc_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_5_WQ_DESC_ADDR_LOWER]);
>> +	xe_gt_assert(guc_to_gt(guc), info->wq_base_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_7_WQ_BUF_BASE_LOWER]);
>> +	xe_gt_assert(guc_to_gt(guc), info->hwlrca_lo ==
>> +		     action[XE_GUC_REGISTER_CONTEXT_DATA_10_HW_LRC_ADDR]);
>> +
>>   	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>   }
>>   
> as above comments are just about enum names, which could be updated once
> we decide on how to unify all GuC ABI definitions, this is not worth
> blocking the whole series, so let it be,
>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks.

-Tomasz


