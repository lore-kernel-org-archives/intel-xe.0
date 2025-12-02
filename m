Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE0AD12663
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 17:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7264A10E694;
	Tue,  2 Dec 2025 17:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6lV3fsM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F9110E694
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 17:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764698236; x=1796234236;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fHv3Dk0peVR2R2nzhCGuwiUUP2sQCJuZqKTtCKi+pps=;
 b=a6lV3fsMn2NesCm8lc5PKzNrFRT5YULIumIw420sYHZv+WVqslWCL8x8
 EYedkkpXnkXX0rLahCh/R3tKNLp/tG2MMhTQOrjkhsaNnLCfdPwVtS+0B
 i8nZVHedGjguzIHpImy65P6HdmOmcTs8u8tGXDQhjNDYWSKha0WHSE2Vl
 nqH1AdAfdNCk7im8w0FPlOuFnPX6lFeX+zVAjGoyysEyq7r12wiKxFjYd
 hg+6GP1bNmRGFuExqwwEbo+g3ud1c5xKMCYOZ2zEAtUKzSqe0xw8jzRee
 oJFOiN43iDhtZmS10PoKU5K0rtdMIOq6dmR9ETjh20OroGgx8AMpS3xXW Q==;
X-CSE-ConnectionGUID: cMFkqnxqSNey97kpnoLjLg==
X-CSE-MsgGUID: 5qRvKQwBQOemLgapqFnipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66750239"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66750239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:57:16 -0800
X-CSE-ConnectionGUID: Kuwpp6gGTq+F5GvkPqlCgQ==
X-CSE-MsgGUID: fcB5ROfoR/ufb26NrVrQ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198622274"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:57:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:57:14 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 09:57:14 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:57:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ogt7t8xslU1AbIdPAMFGav1FeLB5uiFkUN8WviOozz3Q4jZfMnfxfp9q+yIbgY/3ECqUBQSuDTHap08SDIfifn8soab/OgHe3iYe5aniXoxq+02/7D1QFFIXfxt7Y6SLWMC1Bn2uqToexR9RMyg2C2pZaQtk/BipoeTJri7UPlDQ+BGPZKUVJQKimwUnu+3FQqbBp0wJ6APvXb2RnQS04+54e+w+TGJlj7uPEFpXmwVE8Hv5obGTINpsQSQLc4mQpOaPNDP9Wt4rmxNxXWJbvAfgFqAt3pjG8ggD05RBi1vl3RthcreYxtKA9D6uUEbKz71JacsEtu2YSEkcbV67Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BPBOay+hOQKeUKMBZZg9SDXtEkON/2oGYN6h3NyuZg=;
 b=Z6pOKNCRspgkSi4lctPRora6iCtUCmtEAWCF2m6gIa4iw6jLFCpdAXN5g8V0tsuGC2VI3yIzvdH9ess2u6CAf5/35GkaDwN+nEsH3MZ8lQTdnlgo2H/727HXfGatTRFRQIonyKhpjLEVWGAV3bI45QlG2r5lBEYjR2CCPp3IM4k1SVpU0ulHX1cI5dOynYy5qNcPi/QuR3NqaoZ9V2OSLzgwxvHddLEQtdZyQaRDYF3C3C6AFDAnQHi4G6qEER+odUYeBwJB/mi8tjifbW/gC1+7EwWuxVx2zgY9dUMoCRhpyDx/Utl04WB2ucsuksDJBjnHR8I1laRkZwQh2phkFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 17:57:08 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 17:57:07 +0000
Message-ID: <f14a6c48-fe8b-46d7-974b-0fa475b3b521@intel.com>
Date: Tue, 2 Dec 2025 09:57:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-16-daniele.ceraolospurio@intel.com>
 <f9690fe0-a3b0-4ecd-a488-72457440a8c8@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <f9690fe0-a3b0-4ecd-a488-72457440a8c8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:a03:505::18) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CH3PR11MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 85368770-0352-4b4a-bcfe-08de31cc35bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWpYNnhZR3N2bjNFRGpvQVJod1ZGM1V0MFFDQ3FVbUFJTGovVmNHYm54NHEy?=
 =?utf-8?B?VWRhMDdJemJyNzJHS3JmUHhYeWZFVkVYUUxpZzd6SnlodkF1ZGx4eTlDWERl?=
 =?utf-8?B?STg1QWR2a2dJTzQzeGFRTlU2a09HNTBadlc1MTlHMVdiOHhwQjZPanFmUFZS?=
 =?utf-8?B?cDZtR2dmSWRydXljTkZBWFR3RS9lcGl5Y2VNSS9VL1VrbDByekRkRXdabE1p?=
 =?utf-8?B?QWxOc3VxSlg5bWtUaHpJcU05VGZYdlpZVExBWERKL0pSZlI1TEd6M2o5ZG8y?=
 =?utf-8?B?M3N3c2JLMnRHL2hvYi9OalYvdjZ2dWtJUEdORWxkWG45cVZ1Ulc0MnRnSXNn?=
 =?utf-8?B?OEtadGxuQ2QzVENuTEU5VFJqMXMzK3RsdTNxWTNySzhkYm13aXdZR1Bkd1Rz?=
 =?utf-8?B?WE9MSG00Yk40SFpzQVViTml5b1d5Y0t3b2xwYVlyVUxwNk9iTjQ2dnNkRGts?=
 =?utf-8?B?NE1qS2NYUHB6M2p5NTFiNVBvSkxrdUltdXpNaFFzS1pqYnVKOG5KcHhESTJ4?=
 =?utf-8?B?cEVzdE5pTzB2MEYyYjByU05FYnBzU2JqN3o0aDY4UnRnekJBM1k4Rm1rZ3hi?=
 =?utf-8?B?c2h3MTE4c3U2Y2ZweU5FaEpiZGxUcGU1Qko1U0hUWktXMGxFaVVHNkNSeDU2?=
 =?utf-8?B?OHRodkNmcjdyUnpOdGpPU2piVWZMRW13c3NjZ093aUNzb0dRYTUvWXE2UzVB?=
 =?utf-8?B?ZFdPNW5wUm40cmllbWJjajBTMGdESmREcjlDMzY4WWZ3NGdFdStRQVNhRFp4?=
 =?utf-8?B?UFFidkt3R3RNTTZ0dDVBRTVOQXhpRGxiSytKWDhqS1dNcGJtcHduZldFaDdS?=
 =?utf-8?B?NGlvamtOMUJjdUEzSHp5M2gzeUU3ck50VmFSNzdBejZ1a3g3c2JBc0ZBSDlG?=
 =?utf-8?B?enBkSmxBSlVvd0VBQlNYdjY0L2dVeFFXQVEzbVZteUVxT2VCanZ1dVNsSEVk?=
 =?utf-8?B?d0Z1ZW9FbWtlaTRNZEFSRFJjV29mTVRVTGJ4NlFudkVPQ3dGTFVSRUVmcWh3?=
 =?utf-8?B?WDgvU3VxL3hZNjBaSGFkRHFqb2ZhRWlYOEFqWnJkdzUycHlyb3B1SUYrWDgr?=
 =?utf-8?B?Z0NBMmMzWTh2dG1EUzZJZ0pTRWNWVkIvdnFIdS9HekNiOHdua2NFZzV4eEth?=
 =?utf-8?B?Qzd2dktkeWRUQnBDM1JoV05UWkpFWUdwU2J3Rzk4Rm80Rm1raUhsZllFa0dG?=
 =?utf-8?B?bVV5Wk55TkZ3REFLdVZERzJ3N3pNMzNQdkJyT2VYeGlEQWxHd3o0RmhCaGJr?=
 =?utf-8?B?R3EyRVRLQitXb3YrSUJWblFpREllbllnbHhGU3NzVlpKVkVQdHVCL3JTL1NY?=
 =?utf-8?B?UGc0Y09BdlJRZjlRUkQ0RlRpYi9zMWowam01WjJvOFU1WXltOTYvcHI4SGVX?=
 =?utf-8?B?citCTUJFbm5wY0lwME1YL3pnZjZhWFA4Mk45STdzcTJhaW1FckNoTjVjWkpD?=
 =?utf-8?B?SSs3YjZ6YjU3anRjVmVHa3hSMDBCK1ZtaFY3SUlNSmkzM0VneG1xUW1kTm1U?=
 =?utf-8?B?YlpWWjNHM0dmNUNNdWVIYkNIWFdXMi9iTlBGc1cvUCtrNTJXaVd4NGVSNEtD?=
 =?utf-8?B?bTlJNXJYeHVVbzFKNi9SUG1pZngrTGZEWWNDMlcvVEZsU2lsWmRJTFRrZGdL?=
 =?utf-8?B?SmViWlNSeUVFV2ZuOXBLalYrTHZLa2xLYmRjSGs4MFBBZ3BhVDQxdjhvQXgr?=
 =?utf-8?B?RnY2blg2NXlPa2Z3NkNFZG5GNnUvMThjelRPaU9KVGEyNEc3WTVWVUJSTm5M?=
 =?utf-8?B?eUZTZCszUFJEeWNhaCtnZWloUTlLbEV0UDB5diszZXQ3TXFxdngvTzVQd0FU?=
 =?utf-8?B?bkFPU3J6NFVQREVUNE45eUZTZG5CQTFubVF4bXNYNDBOVk0zU0JzbkJWaGh4?=
 =?utf-8?B?b0djNWVHNW9qemJ3NEZGQ1dMOUIvdUQ0WXAwbDdoeEdtZkE3bTBBT0RFUzRi?=
 =?utf-8?Q?r9PhSu5ux8qy9oB7br/GP8RXUAdADo7S?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXVMY0IvdkZRTUNabUlGblV1T2xDRTl5b3haTVpOSzhFL0pQVXArOVVaeFVZ?=
 =?utf-8?B?eG56dWZOVlRVdEhrOU5heTAzd3gzVGs5YjhqclAvanVBejFPWksrMWdqaEow?=
 =?utf-8?B?Z0dTMlBUblFWOGRxYjBFTFRkSVZ2enBzeVpGeWVkZzJYakd5RFd5dkhKaENF?=
 =?utf-8?B?R0VsV1BWRG5iMklZVjNNMkdTRW54WXFiV1FEM3dJbWVGT2hEWVRxbW9KYTJJ?=
 =?utf-8?B?RnVyOUVmTktOMmtmMmxjL1dXZ3ljYlNxSXM4dTRWOHIwcXJLOFRFeVhyUFh3?=
 =?utf-8?B?dzhEMDVDeGh4VGlHKzlTNldFOEFCYnpjV3Z5Rk5QeExVRStHdXFpRmNVdDlS?=
 =?utf-8?B?NUZNeFE4c1Z0Q3dYNHRteW5XTnpuVmNoRkFJRkg2bkhZbzNrY3RhczJhNW1O?=
 =?utf-8?B?T2d3V3ZOMUJPSkliZm82M3BJY05jeDNONDcxMVFVU01HNG90TnJjYkpSdXpl?=
 =?utf-8?B?MFpURk53eU82aVNYL3ZyTGVZZ1hsemNOZ2h3ejRvQ1BqUnJhVU93TnMvQjVR?=
 =?utf-8?B?WGRMbERZWjBNZms0SlRPT2dRWEZqdy81SFFjUmNxWXU0YiszQUhZRUFJcUZD?=
 =?utf-8?B?cytJODdwYlpFOVdhUnpYcmdQMEk4WTlaelB4S01XcGpTck8zOWkyNXprMmps?=
 =?utf-8?B?SDFHT3hKcXhkblFRM0RvSE1UOVhuc2dCKzNQbTZIQ1JXRmhpeVBQYUllYlln?=
 =?utf-8?B?WjF6ZmdldFAxZ2pkN3Y5K0ROYndzTEZpbTZrTFFIUk96TEdac1hqVFVHUXJL?=
 =?utf-8?B?VGZ6eWNFQXZxOGxYZFRnd3lvbkJVcVdrb00vci9QSWN0eVZwWFVtaFJsazcz?=
 =?utf-8?B?R3gzMGRpWmE2djNnN3ppbC9DQTVBUXZrdGtrY3VzTGNxemlnei9JOEN5ZXht?=
 =?utf-8?B?b2dnbUpSbDU2RzJJdElscDV0OVRyU1lCUVVvVXRTZElwTEkwSVlYNmVOMW92?=
 =?utf-8?B?a3NjK09FN1RKZjlJQm4wMHZpSkU5ZDZDRFVRQUVXN1UrcWw3USt4RFpySzl5?=
 =?utf-8?B?RGRoSUJEUEhlSlp1Wno3MUw5NXJkbW9zQWJVdWhBd3N2ZDdNaU5iVkpuMzZV?=
 =?utf-8?B?eGZLNks0encyQ1oyaVR1YzJmS1NiK2wvc0xRWHRZUVQ1VXlNbHRpOTNobFpv?=
 =?utf-8?B?SG9sb0pKMDhHR2t1SmsrMGJ5YUxkTGp3U0V3ZEJVeGQ1Vk5GRHJRS25JMVVq?=
 =?utf-8?B?NkJlazQxLzhUbmFPRnZhaUZkd01rTG1vTTg1TzhtMTYrWnVvOG9vNXdkdVpX?=
 =?utf-8?B?d3crbGlyK0RQS1dVOXRrMWc1YWZ5L3BvNHgyNk9KVDdzVjVHYnJOeW5LOGFJ?=
 =?utf-8?B?VFAwVUJCOVVFdTdzeXdHd1gvNTRIUmpTcXQyWVJiUnMrNmd0VVRrbTBVM3Bs?=
 =?utf-8?B?YWJTeEEyUURkL3d3dnZJblRydjBOQmRTVXlMbTRyUnJMRS9YejgyR0FpT1A5?=
 =?utf-8?B?aWJUZVZIRi9hM0taNkJ4bms1Vk03UlFGbDdlUHg2aFZweUwvVVZDZS9PRm9O?=
 =?utf-8?B?S2tnaUtsaC9WZGFPbEpjRGxDV3BBZEdhRmlQQnpNOSsrZGJyM3lidXppZGp2?=
 =?utf-8?B?K0p6YzJpcGdoaG96QjUxaW9tK3kxWUtVTDBHRWR3a2FkQ3NmWjEzS0V1TS9Q?=
 =?utf-8?B?aGx4VmUxWWxNbjNuZHdqaWdabTJQaTh0RE8yNk1jUnBkNGZCVENGVmNKQnEy?=
 =?utf-8?B?UE0yLzg1OUdWRGY1cWxFeTRldWNrZmIvYXhPOFZ5dXJaZEJQRm9RekpWbDho?=
 =?utf-8?B?MmdEODVTamtnVTFNSUI3dmhLRFVPSTVHMnYrcjJkbHoyWHhRSXF2Wk1TMjlo?=
 =?utf-8?B?WDRDNGNSeVFJUDNvd29PZVJtelo0ZjVMNGFXM285T1FZU25CL2RHUnlWendp?=
 =?utf-8?B?WnB5ODNtZWIvRDFpcEFHVG9JWDRWWEFHWHBwOWNyMWRPdG9oODlPT1dmaVhE?=
 =?utf-8?B?dXlCUnp1dGJMY1RxUyttN2F6RkpBNHltSnBlTk1FYTBxMzJ4V1paRGFUU3E5?=
 =?utf-8?B?Ky83NytEY3NMbWpNc3AvZ1hhTVhBVGViM1o4ek1WUnB3cW9abW5GbWppT1RX?=
 =?utf-8?B?Y2ZOSkdvM0sxNEVMRWNieXY1V3JTY244d1ZLY1dTODI0QVd5RzluSWZJZVda?=
 =?utf-8?B?d1lobmRKam5JODZYOWsrdW81anZhRmJWakZOQnkrek0wTzgwc0JyMFNXOEo0?=
 =?utf-8?Q?5H2RcPczMgnKljgDZcUIJmw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85368770-0352-4b4a-bcfe-08de31cc35bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 17:57:07.8891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQphikISd4S4/clgdQwpO332e6mC42kny0fyJCPUIAhOzzNCDD1+hTjUJtibM59QvnyzXWCcAookmQ2tGZRwfok/rcd4z/pkFhvULaGwRYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
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



On 12/2/2025 5:32 AM, Michal Wajdeczko wrote:
>
> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>> Since engines in the same class can be divided across multiple groups,
>> the GuC does not allow scheduler groups to be active if there are
>> multi-lrc contexts. This means that:
>>
>> 1) if a mlrc context is registered when we enable scheduler groups, the
>>     GuC will silently ignore the configuration
>> 2) if a mlrc context is registered after scheduler groups are enabled,
>>     the GuC will disable the groups and generate an adverse event.
>>
>> We therefore need to block mlrc context creation when scheduler groups
>> are enabled.
> s/mlrc/MLRC
>
>> An adverse event threshold is available for the new adverse event.
> changes related to introduction of new threshold deserves separate patch
> (as we need to handle GuC FW version checks)

ok

>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         | 14 +++++
>>   drivers/gpu/drm/xe/xe_exec_queue.c            | 19 ++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 30 ++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |  1 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 59 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h           |  3 +
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  2 +
>>   .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  1 +
>>   8 files changed, 129 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 274f1b1ec37f..a6dce9da339f 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -46,11 +46,18 @@
>>    *      Refers to 32 bit architecture version as reported by the HW IP.
>>    *      This key is supported on MTL+ platforms only.
>>    *      Requires GuC ABI 1.2+.
>> + *
>> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>> + *      Tells the driver whether scheduler groups are enabled or not.
>> + *      Requres GuC ABI 1.26+
> typo: Requires
>
> and don't forget to update xe_guc_klv_key_to_string() with new KEY

ok

>
>>    */
>>   
>>   #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
>>   #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
>>   
>> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
>> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
>> +
>>   /**
>>    * DOC: GuC Self Config KLVs
>>    *
>> @@ -369,6 +376,10 @@ enum  {
>>    *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
>>    *      :2: HIGH = schedule VF in the next time-slice after current active
>>    *          time-slice completes if it has active work
>> + *
>> + * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
>> + *      This config sets the threshold for LRCA context registration when SRIOV
> ... threshold for _Multi_ LRCA context registrations ...

ooops :)

>
>> + *      scheduler groups are enabled.
> "This is allows PF to monitor VFs' behavior when EGS is enabled."
>
>>    */
>>   
>>   #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
>> @@ -427,6 +438,9 @@ enum  {
>>   #define   GUC_SCHED_PRIORITY_NORMAL		1u
>>   #define   GUC_SCHED_PRIORITY_HIGH		2u
>>   
>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
>> +#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
>> +
>>   /*
>>    * Workaround keys:
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 8724f8de67e2..e59c41c913b4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -16,6 +16,7 @@
>>   #include "xe_dep_scheduler.h"
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_gt_sriov_pf_policy.h"
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_hw_engine_class_sysfs.h"
>>   #include "xe_hw_engine_group.h"
>> @@ -698,6 +699,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>>   	return return_mask;
>>   }
>>   
>> +static bool has_sched_groups(struct xe_gt *gt)
>> +{
>> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_policy_sched_groups_enabled(gt))
> hmm, usually we don't want core code to look so deeply into PF subcomponent

I thought about that, but I didn't know which sriov file would be the 
right one, since almost all of them are either pf-only or vf-only. 
should I just move it to xe_sriov.c?

> also, do we want to work in hybrid mode where one GT is using MLRC and other is not?

The GuCs allow it. I didn't want to block it in case we do get a 
scenario later where this is needed (e.g. we might get a split primary 
GT but still want to do mlrc on media)

>
>> +		return true;
>> +> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>>   int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   			       struct drm_file *file)
>>   {
>> @@ -790,6 +802,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>   			return -ENOENT;
>>   		}
>>   
>> +		/* SRIOV sched groups are not compatible with multi-lrc */
>> +		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
>> +			up_read(&vm->lock);
>> +			xe_vm_put(vm);
>> +			return -EINVAL;
>> +		}
>> +
>>   		q = xe_exec_queue_create(xe, vm, logical_mask,
>>   					 args->width, hwe, flags,
>>   					 args->extensions);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 48f250ae0d0d..c7f1ea8eb9c5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -8,6 +8,7 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "xe_bo.h"
>> +#include "xe_exec_queue_types.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_sriov_pf_helpers.h"
>>   #include "xe_gt_sriov_pf_policy.h"
>> @@ -527,6 +528,24 @@ static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>   				      masks, num_masks);
>>   }
>>   
>> +static bool guc_has_mlrc_queue(struct xe_guc *guc)
> this is all GuC stuff, so export it from xe_guc_submission.c

ok

>
>> +{
>> +	struct xe_exec_queue *q;
>> +	unsigned long index;
>> +	bool found = false;
>> +
>> +	mutex_lock(&guc->submission_state.lock);
> guard(mutex) ?
>
>> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>> +		if (q->width > 1) {
>> +			found = true;
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&guc->submission_state.lock);
>> +
>> +	return found;
> what if new MLRC is created right now?
>
> maybe we should use xe_guard to lockdown one feature or the other?

The idea is that the admin is responsible for enabling EGS when the 
system is in the correct state, which is why the GuC doesn't return an 
error and just ignore the KLV if the system is not in the correct state. 
This check is there to catch the case where the admin has closed all 
apps in preparation to enabling EGS but the driver still hasn't 
processed all the context de-registrations. Therefore, I don't really 
want to over-complicate it with extra locking. I'll add a comment to 
better explain.

>
>> +}
>> +
>>   static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>   {
>>   	int err;
>> @@ -548,6 +567,12 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>>   	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>>   		return -EPERM;
>>   
>> +	/* The GuC silently ignores the setting if any mlrc contexts are registered */
>> +	if ((mode != XE_SRIOV_SCHED_GROUPS_NONE) && guc_has_mlrc_queue(&gt->uc.guc)) {
>> +		xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");
>> +		return -EPERM;
>> +	}
>> +
>>   	err = __pf_provision_sched_groups(gt, mode);
>>   	if (err)
>>   		return err;
>> @@ -600,6 +625,11 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>>   	return err;
>>   }
>>   
> every public function needs to have kernel-doc

ok

>
>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
>> +{
>> +	return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
>> +}
>> +
>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>   {
>>   	pf_sanitize_sched_if_idle(gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index 36680996f2bd..89aa3af6cc7d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -18,6 +18,7 @@ bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>>   
>>   int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 4c73a077d314..7a180c947032 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>>   	return value;
>>   }
>>   
>> +static int query_vf_sched_groups(struct xe_gt *gt)
>> +{
>> +	struct xe_guc *guc = &gt->uc.guc;
>> +	u32 value = 0;
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
>> +		return 0;
>> +
>> +	err = guc_action_query_single_klv32(guc,
>> +					    GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
>> +					    &value);
>> +	if (unlikely(err)) {
>> +		xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
>> +				ERR_PTR(err));
>> +		return err;
>> +	}
>> +
>> +	xe_gt_sriov_dbg(gt, "sched groups %s\n", value ? "enabled" : "disabled");
> str_enabled_disabled(value)
>
>> +	return value;
>> +}
>> +
>>   static int vf_get_ggtt_info(struct xe_gt *gt)
>>   {
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> @@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>>   	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>>   }
>>   
>> +static int vf_cache_sched_groups_status(struct xe_gt *gt)
>> +{
>> +	int ret;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +
>> +	ret = query_vf_sched_groups(gt);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	gt->sriov.vf.runtime.uses_sched_groups = ret;
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>>    * @gt: the &xe_gt
>> @@ -593,12 +632,32 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>>   	if (unlikely(err))
>>   		return err;
>>   
>> +	err = vf_cache_sched_groups_status(gt);
>> +	if (unlikely(err))
>> +		return err;
>> +
>>   	if (has_gmdid(xe))
>>   		vf_cache_gmdid(gt);
>>   
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_gt_sriov_vf_sched_groups_enabled - Check if PF has enabled sched groups
>      * xe_gt_sriov_vf_sched_groups_enabled() - Check ...
>
>
>> + * @gt: the &xe_gt
>> + *
>> + * This function is for VF use only.
>> + *
>> + * Return: true if shed groups were enabled, false otherwise.
> typo: s/shed/scheduler
>
>> + */
>> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>> +
>> +	return gt->sriov.vf.runtime.uses_sched_groups;
>> +}
>> +
>>   /**
>>    * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>>    * @gt: the &xe_gt
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index af40276790fa..2e1d34c0397f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -23,11 +23,14 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>   
>> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
> move it there [1]
>
>> +
>>   int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>>   int xe_gt_sriov_vf_init(struct xe_gt *gt);
>>   bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>>   
>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>> +u32 xe_gt_sriov_vf_sched_groups(struct xe_gt *gt);
> unused ?

oops, old function name that I forgot to remove.

>
>>   u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>   u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> [1] here
>
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index 420b0e6089de..5267c097ecd0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>>   struct xe_gt_sriov_vf_runtime {
>>   	/** @gmdid: cached value of the GDMID register. */
>>   	u32 gmdid;
>> +	/** @uses_sched_groups: whether PF enabled sched groups or not. */
>> +	bool uses_sched_groups;
>>   	/** @regs_size: size of runtime register array. */
>>   	u32 regs_size;
>>   	/** @num_regs: number of runtime registers in the array. */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> index 0a028c94756d..3e55d9302855 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
>> @@ -32,6 +32,7 @@
>>   	define(H2G_STORM, guc_time_us)			\
>>   	define(IRQ_STORM, irq_time_us)			\
>>   	define(DOORBELL_STORM, doorbell_time_us)	\
>> +	define(MULTI_LRC_COUNT, multi_lrc_count)	\
> this needs to be defined with some version info, maybe:
>
> 	define(MULTI_LRC_COUNT, multi_lrc_count, (70, 53, 0))	\
>
> and then in encode_config() have two variants of code generators:
>
> #define encode_threshold_config2(TAG, ...) ({					\
> 	cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_THRESHOLD_##TAG);			\
> 	cfg[n++] = config->thresholds[MAKE_XE_GUC_KLV_THRESHOLD_INDEX(TAG)];	\
> });
> #define encode_threshold_config3(TAG, NAME, VERSION) ({				\
> 	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER VERSION) {		\
> 		encode_threshold_config2(TAG, NAME);				\
> 	}									\
> });
> #define encode_threshold_config(ARGS...) \
> 	CALL_ARGS(CONCATENATE(encode_threshold_config, COUNT_ARGS(ARGS)), ARGS)
>
> this should fix the issues already spotted by the CI on ADLP:
>
> <6> [133.603624] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x8a0d : 32b value 0 } # multi_lrc_count
> <6> [133.603625] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0001 : 64b value 0x200000 } # ggtt_start
> <6> [133.603626] xe 0000:00:02.0: [drm] Tile0: GT0: { key 0x0002 : 64b value 0xfec00000 } # ggtt_size
> <3> [133.603653] xe 0000:00:02.0: [drm] *ERROR* PF: Tile0: GT0: Failed to push self configuration (-ENOKEY)

I think it works better if we add the version for all thresholds, so we 
don't have to define multiple macros every time we need to check the GuC 
version (which I believe needs to also be done at least in 
register_threshold_attribute() and define_threshold_key_to_provision_case().
I can just use 70.29.2 (which is the minimum supported version for the 
Xe driver) for all the older defines.

Daniele

>
>
>>   	/* end */
>>   
>>   /**

