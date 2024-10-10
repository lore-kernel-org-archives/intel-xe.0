Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F321CF11C3
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 10:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB2B10E8BA;
	Thu, 10 Oct 2024 10:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0gcRGuv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D957410E8BB
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 10:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728554624; x=1760090624;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Eyvt8/U62SDywvYUifP/sXy9Wu5Z7xfEqTmabDY00ek=;
 b=f0gcRGuvspYxYsrjFoxU1R/ADVTRP1wSq9ari6AVW+f7LRgedbPstEW+
 dML7+67w7F9tupCzQgsGp/IepUFsnIFzfFbQYq4PkooKTy2vM8S7dqkiX
 EUiUCgSXHIRn8X7OheH/sgi3witBw1ZHBbp0Y4yY9yB6so+PZ30/kdbJL
 6ihqgryIVw4BokEyRboDJv2YlzTR9tcyPmd0/z2qkSX7PjLWpJPnDx8oS
 QLuxmzmsVXE31MB+xf35VH26op3MQtWHrv2obUdiZ+1Mrc3nFE8JBVQrc
 LtYJTztFiJpuZ04KZ201xi5Pc8uEo1CfdoZLRvQqL5XXFVo8OpWBPtIS7 Q==;
X-CSE-ConnectionGUID: +CjKhVvlRv+wYENlHIcKNA==
X-CSE-MsgGUID: aCt9ApSMTHq9XQJo5lB92g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28057957"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="28057957"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 03:03:41 -0700
X-CSE-ConnectionGUID: HWAIG4LqTQ2wMwntIRcS5Q==
X-CSE-MsgGUID: /2I1rN+ETxaORhBo8EtCQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="81354009"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 03:03:41 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:03:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 03:03:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 03:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aytNO56c1YNNEelZKsiqaC2ZoPeCAPYZXVkrCq+dVTxUhrmsthQQGmvz1D1WAOKvGzF7uvac4ZeGErjriQggWzh0A7KIP2kLb4ZldciE5xDNd8SrFody5qwzYT9gVKhoSNyc2zVJPscEI8roLoYmNnMZo3C4IM5F1ADqrU9g89nLAtV48ITAqLlTtN6gd3aUoAyUucGcu6kdNAqnFY3JhgHgiN1hIZVSLxPx9Dp35NOh/wzA/pRQmwzq5nvUFuJI8pIdBruLdXBb63TdPq3wEWrmRMxebuO+SpO592/RVKeeBmSHL6Ddb6gk8uw14Lunnn0fH97VQ1G2DbmE6Vddhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsR38fFsFyfe0ehwl9+VO5e+/LTQksN1bHbqIak083U=;
 b=iezrNMT8Uu/a+uMIN/HNIiwY1Ch5P56b1JXpCJ5qOM+lMWFVNzDxMmvs4rsNUR0z0pSnTMkaCuCdxP6rdbPgZ28romKgz+bLcQNvuZNHJbcsMgUdez8Qs6Ed4uHAsCXwKHtprAGnBfBbt8irSRscc0z23rPvEca1x21gin8FGAI8KbrH7TY3MKdCTedtJaa8paBzTzVft2+J4gdjfPsBUjQTAUIz9JXAcEf9XGcXvlbRldv6WqAz26DCCIBBXE0Tq3gPLJKNmP5ShZ4M73jOT7C3Jzg0vYrLFOufXpXwr/PZME1pFW8S3YqQHUI5RryoJ/EYpC0sy/Sa+0K87Qsp4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by CH3PR11MB8517.namprd11.prod.outlook.com (2603:10b6:610:1ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 10:03:38 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 10:03:38 +0000
Message-ID: <88778cd7-c165-41bd-b892-e9f8e3dde8b5@intel.com>
Date: Thu, 10 Oct 2024 15:33:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/query: Move timestamp reg to
 hwe_read_timestamp()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, Szymon Morek
 <szymon.morek@intel.com>, <sai.teja.pottumuttu@intel.com>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
 <20241010034847.389734-2-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241010034847.389734-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::8) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|CH3PR11MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c54f53-3015-4383-9de5-08dce912cf7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1hMMlRVZDB5MWw0aUhDZXZFbFNOR3dxdGloaGt4RWtLeTMwTWNxUEU3Qkkw?=
 =?utf-8?B?R0tLUUxGM0xHckdkQ2J2N2x4VkJsUkpISUxYNnN1QXhMTGgwaXJIMCtlQ1ZD?=
 =?utf-8?B?MG1iQXdydTA2ZnBGL3VueWdtMDBDcHFPai9nUHFCN2FFdXB0OHR4dVRHdS8x?=
 =?utf-8?B?UCt0Q1FISEgyUitTYVkwd1k5a1pvQWVhc2VKSlBHbXYwVnNYQldSQjZib0Er?=
 =?utf-8?B?cmpsL3BrSlBrRGd1bWw1NmhjVGhsQnp1T1VjTkpuWHN2c3YxMlY0ZGlmbmdI?=
 =?utf-8?B?QWF5ZDBZQlVEUTZwUGd5bFNWV0szZmtpbGRVaHBMTUdQTHgwRGdweGJ4U1py?=
 =?utf-8?B?QWVMNGZxbFVNdDZEcTZVWVdIekZ0Z2pYa09QdFNxNnNxbkZZbThzL0ZvUEZV?=
 =?utf-8?B?VGVsUERzY1B5L3BoUFBqYTRYamordTJNVXJiSmFHK2VUOWFkaW90SVZTR0Jl?=
 =?utf-8?B?b1RGelViaFlZTWpYTkRGZE5EQTNKaWplMnR5R3RXd2ZVY0pHQ3UxbTlxNTE3?=
 =?utf-8?B?UUpySnBpNUJSZGh1NjFjVlZXZ3N0VWlmemNvbGNlcjJzcHNOZEk5UjRnbTVw?=
 =?utf-8?B?TksydGo2WDNNOUNFaklVOVU3K1E0bmlWbTZEWFdiTlZjNExhUDAvaU9zaS9E?=
 =?utf-8?B?RktVd1Zxekp2VkU0Zy9mRlRuTml2V1ZtYlhicW5yajlyYUJ2dHFGUWZsU1M3?=
 =?utf-8?B?cGsvb2FKdlQ4cTVuaktXZEpuMFdhdnBVb0JwOUlYcHpXeTZRT25IbjU2SXZz?=
 =?utf-8?B?eGF6d245Rm1PZUg1YmpocXN4cFhCeG4zSWw1UkNYdnNWVTdtV0FEWXdWbzVt?=
 =?utf-8?B?YndQalkvMmdvbHp5SllxaG01b0VVYmIzMVh4K3I3RjFybFhTUHRJRW43b0VY?=
 =?utf-8?B?YzliYmlzSzByV0J6cVFNY1hlbWxoQ1h5bTkvWERwSmg1a2VRR25RbGRkdXVE?=
 =?utf-8?B?cUMwQkpDWklZUHdyQXM5ck1WVktMbjczRm1xMmRYUzdnNHZTaFhBbjJ4aGNO?=
 =?utf-8?B?Y1N1OVRBTHNzNjRsQVJma0luK1d2OXpEVnlWM0VYaGhmSzVyZUlhN0RGWDhQ?=
 =?utf-8?B?Nnh5ZjArbmh6ZVd6bjNqQk5GOVlmZHhsRmp3c2Jpc1k5VzY4MzhRM1NRUTlR?=
 =?utf-8?B?UUFZTk03b3dnbWJzZURPek5DZGNETy8ra0pvRms3RXVqRVNHdWtUaFAxbkpZ?=
 =?utf-8?B?b0FwenhzVXFXbCtRemsvUGNxUXJ0SVpyenhVdjhuYUl1dUUvejcyRktpM2RG?=
 =?utf-8?B?N2hVeUVNVXBBbThLRzdpZzlhOXlsT2xxL0Q1QnZhZXpodFU3VWtUYUZuNlRs?=
 =?utf-8?B?VGFkRVhVV1lvU01IQ2wycldCTVhVeUFSVTNnWUFxZGRwS1kvclkvUUt4T3Vk?=
 =?utf-8?B?ZkFrd2VMU0dCbG9aalFkQTQwNnFHTnBYcEQwMVVMdzNkK0E1bldlTCtXaGJS?=
 =?utf-8?B?dms3MmR5ZHVQcU1GRnM0dWRlSTV2SGhEMW91Z3gya2lPdlRPRjI2UExpMDVk?=
 =?utf-8?B?OGVZTmh1VjUwWDdHWm1IbzEwVTFqZ3BWQnFQU09kZVRHem5qeUxzNHNlQlRo?=
 =?utf-8?B?cHdKbjBuQXJqcXFsTmYvVHA1VkZrTVZlY0E3V1hpRlVkbkhhc296RnVzTXgz?=
 =?utf-8?B?NnVvMEVDdXFyYWJpUDR4elJSd243bDlXa2p4dE1iUkFYZEVHQXhDY2FHa04w?=
 =?utf-8?B?UFRxNDgvaVdCQW1KNWhsWWVFYkVVSWY4OTdoN3FtcGpSbU02b3p3TXR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUx5ZlpCang3cUg1V1QrZTVPbXdRVTlvb0ptV0FsbUdBbEd3emk2V1dYS2dV?=
 =?utf-8?B?UnF6blIyU0c1bWJOMW8yVzcvU1pVWjZ6V0R6UHp1THhzOGFwMXlTUFlvbkIz?=
 =?utf-8?B?c0I0SnZTMWN0SnVHNGF5UUJmb2hNQzlRaWNyeFJQY1g2QTVjS1ZKUG5ZSEEz?=
 =?utf-8?B?VmpLenFsM2JQQ1N6QytZWFZaSkZpRkFQT0ptZXJJZ1h5dXA0Q2d1SERodFJH?=
 =?utf-8?B?bDU2LzQwdENyT3VybWdZNVdmWXFOS2hNbmlSL2RVNVUzZFR5d1dMVnhBOE1L?=
 =?utf-8?B?QVVadGJlYXlXU1czQUl3c1pvcFlhMHBrb0VqVGVDSCtiMG9GaElTdFYrTVFF?=
 =?utf-8?B?dzBVU0JtanpiR21qZkE0SzMyeE5rUmo4Z20zQ1BWVGNmdWRxVzFJWGVOSXdw?=
 =?utf-8?B?Z09NbEF4aFVzZUpUS2VIcFREdW9jL3FleXg5dHhlT3ZkNlQ3OHdRMmRXcGlS?=
 =?utf-8?B?bm5NaHljajBTRVEvaTRDdkxWVEl4TDBYWlBRY2U5SzcvbTNIWlp1VDJMQTlN?=
 =?utf-8?B?dlZxUTErVmp3cWFPNFl6WVI5ZkxLRS9pOGs5anlrOHVLUlhTQVd4cjZWY0hp?=
 =?utf-8?B?Q1EvOVZYVTZiSXFobHU4L3RqdTZMZHJuU3JQSnlIYjR5cHdZS0o0NGc1U0sy?=
 =?utf-8?B?ckNDMjBWbU0rSnExSzdJNG05N1RRb0NTU3RDbitQZXUzSU5rWk9wakFNWnhS?=
 =?utf-8?B?cVhHNFFZMkZyRGlHbnh3djZxeXppakVBOHN5U3JCayttVEd0ai8zYW1RemN0?=
 =?utf-8?B?Qkd6Vy94TUsvWGJLYjNhTUpwR0FWbmtMbXpnbjVtZ1VNOHp3TXNLRlFKMmRB?=
 =?utf-8?B?QVlJOUNPZkJOM05xNE1NZDQyTTVkc3V4UWRuWHpmWTZIWGtoNm0xbTFsT1pz?=
 =?utf-8?B?cURwWi92T3FES2dCeHBBOFJ6WUsxUmpWalhsTTN3cnBJZHNrL296ME4ycG5v?=
 =?utf-8?B?dmR1VEc1U0VGeDQ4NUZoWmJNVUJ1Zk1xY2tWOTUvSWl6YThScnlrWkRhUkY1?=
 =?utf-8?B?OGJ1Q21zWm9rZnBZTDhLQkRacVdwRXhtYjcvTXRPblR1VW8xTSt3VHpIWjNW?=
 =?utf-8?B?eUM1ZDhnRDlrb2tNTHFxekowbWtPd2JDTmpOWkI2LzdLSzVudThmaXYzOE56?=
 =?utf-8?B?aS83aGFjb3NDbXEvcU4zVGxVNnBVSjhZZkVRNHZ4dU1EdU1kOTBZU2JZOHVG?=
 =?utf-8?B?cUFFREY4djUwbXF5T2NKMXBNZFdqVi9CNDl4Y0FDUG0zYklWcWFjM0FIY1dW?=
 =?utf-8?B?dGpyWU5mL1IxZTN3c1RuODdwK2pnaHlna2dxbGZoTndYUGpSWko1UHNGaHdu?=
 =?utf-8?B?NUhQaDlRVnJDUWUwMUR2VWg1TTRlNERLMFVnbmJ2RlpXUjc5Z0lPSURJMVBr?=
 =?utf-8?B?emRvYW5ERCtZL0pmTzhqK2FMZUNXWXUxQ1dUbVZvclpLWDBsc1NMU3hjdHY4?=
 =?utf-8?B?WFJCS2JrNWVaSmUwUW1hdVhkNm5oeFltZmJXVmJPNkt3Sy8rejl6Y2d3aUtH?=
 =?utf-8?B?R3oxeVN0ZHdDc1FkTlR6RFlNS2tlS3lqUmZvajRjQmVobWZHT0lxWnV4d2Yv?=
 =?utf-8?B?eHpGVnpNN1NXQmN1NXhUMHBIQjh2dExWSHpGMlc4T2ZRQjBxa1M4Z3NUY0FJ?=
 =?utf-8?B?azdoRzFMakJwTFFyUHhGd2NObEV1eENUUXVieVR1SU90SkJTeXpnUkY3ZVIv?=
 =?utf-8?B?SW1UaXJHai84RWpkVkVOMWdRbi9vdWxyVEJqcm4reEZzaldDRFFNaWFDU3dv?=
 =?utf-8?B?Yy9JUE96OVJxNEk5aWh5aHVMQ2JUcDhJYjZxWWNFR1RqSG5TbWJpby9tdzVv?=
 =?utf-8?B?NDZxcjVHSERIRG5wWFVPc3QzR2tMYjRDTnE1ZGRXakNPWTBncWRncFFMU3E1?=
 =?utf-8?B?OHBHNFd5citZeS9jWDNZZWJFaldoNjJHdGxnZU81NUFzRkJHOXd0cmRURkdL?=
 =?utf-8?B?WEZKYTlERlAwVkFQdUFJOWppYTBtMkl1SWhvTGp5UldZckt4c1pCMTlEYjZt?=
 =?utf-8?B?YnZjaWV0YnlrRTlwR1NsbDVjb0ZJSTdlVnBWWjQzM3hZS2hXWWtRUjBWbkRs?=
 =?utf-8?B?N1ZVRHI0bzFMOCtkSEl0VXRiTUtUSzVuQUpGM0IrbzVQTXhKZSt2Y1BFRC9v?=
 =?utf-8?B?MHdVcnYwaW4xSjg3Q3huS1FJK3NkSXJLVFV4WC9pSmorTzdYTzB0cTBucUg4?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c54f53-3015-4383-9de5-08dce912cf7a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:03:38.0092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZilNrS873YR1RQ61v5T+gg7yGpAO7XMk92FyfbsBGvIeIcN6odmPAM7JsglbRt6jbbZrBQpcxBihPpUKTKFvcuL8u490UrLMYYZ0zOI06g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8517
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


On 10-10-2024 09:18, Lucas De Marchi wrote:
> __read_timestamps() is actually reading the timestamp from a certain
> hwe. Use it as parameter, move register declarations to be inside that
> function and rename it.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index a1f4cc25bea68..d86959076b078 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -85,16 +85,13 @@ static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>   }
>   
>   static void
> -__read_timestamps(struct xe_gt *gt,
> -		  struct xe_reg lower_reg,
> -		  struct xe_reg upper_reg,
> -		  u64 *engine_ts,
> -		  u64 *cpu_ts,
> -		  u64 *cpu_delta,
> -		  __ktime_func_t cpu_clock)
> +hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,

Nit: Probably the function name should be hwe_read_timestamps (s at 
last), just like the previous name and also as its reads multiple 
timestamps I believe.

With that LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> +		   u64 *cpu_delta, __ktime_func_t cpu_clock)
>   {
> -	struct xe_mmio *mmio = &gt->mmio;
> +	struct xe_mmio *mmio = &hwe->gt->mmio;
>   	u32 upper, lower, old_upper, loop = 0;
> +	struct xe_reg upper_reg = RING_TIMESTAMP_UDW(hwe->mmio_base),
> +		      lower_reg = RING_TIMESTAMP(hwe->mmio_base);
>   
>   	upper = xe_mmio_read32(mmio, upper_reg);
>   	do {
> @@ -155,13 +152,8 @@ query_engine_cycles(struct xe_device *xe,
>   	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
>   		return -EIO;
>   
> -	__read_timestamps(gt,
> -			  RING_TIMESTAMP(hwe->mmio_base),
> -			  RING_TIMESTAMP_UDW(hwe->mmio_base),
> -			  &resp.engine_cycles,
> -			  &resp.cpu_timestamp,
> -			  &resp.cpu_delta,
> -			  cpu_clock);
> +	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
> +			   &resp.cpu_delta, cpu_clock);
>   
>   	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   
