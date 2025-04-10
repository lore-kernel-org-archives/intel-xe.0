Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3DAC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 11:30:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA0F10E963;
	Thu, 10 Apr 2025 11:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSGSCUDH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02B110E963
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744284627; x=1775820627;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vp0Pjp+a0oHGam1kMCpy5eh6pxuKPSS/gOzgN3g1McQ=;
 b=dSGSCUDHofc1TjFFc487rdpspS7/JVy/u+DHcvoJTKFWcvqNSSdh5zxs
 upxOtRUJe7efpkUX7mvkkQnbHhS01zX04ph2gryxUFXelE4tBLbZFYi2F
 eBhdv1al+gF8IbCeOtdlJslBuovsXSaHGUn6sB96uFmFPe/LdjEzDGibw
 FqioTENo4whcJ33CJgKCq8mBx5wqzV/f062EBtG0Ee4x3SESnV99bubvr
 9GJiAD+lQ/iLlaIb9zVGhedOeTtSCi3zOFJTfoKvPCcW0d7elut7TwT94
 TPz9hQ31FoYrbCafBAjuoWQ/JmSLVobkke6xdx/4ow3iFhL9IdD2Bc9ic A==;
X-CSE-ConnectionGUID: xm23+vB5QlWZ4E6VvozBRQ==
X-CSE-MsgGUID: uh4CIQj9S5aDwxObbPdgJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45685241"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="45685241"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 04:30:26 -0700
X-CSE-ConnectionGUID: IbMEkZ4GR7qgyS/ixEi5Ig==
X-CSE-MsgGUID: cLASrW94Ri6z1cuqpD4oXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129421560"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 04:30:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 04:30:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 04:30:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 04:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB0t8O0/D84aoEONLm8jPr7r4S2gYeh2dXd2inwrKII44jsVja9O7MBY++CqL+ecjbZbVGLNnDpXntsdbFTK7A+ff7caiP5hs20KWGJ3IH2NOZyQgJ6KOPQf+Ku/rgGFEoTgOUJlhXDnmFFwWdNA6vrqFl5s8iqY7pqOSMvJo32OpZMG4V9fyA2N6+fxJ4hCi4UfIBQ7fisF403VjUK4VgPEFS53qeFy/4cZyyzbIjoLAZLqhYAzljnavreosb5GUcWkmbE3kasNpVDmT7ReSsFRy9h0KPQF56whjBnjUZobsce+Wu7vK0AvzXChhusWqW0xX1gKLdnN3xlM4RgraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6SEvOCYXio6lpAZkj+1NumlCr9yqZ6EH0FtQePqTEg=;
 b=eLx41KoAOES/e7UKvoQiJPhT9zyEmeJcUTEl5mGBbL/NTknOemDJ0Do2FsHCvZiEtAgN5haGGKXvHgsmJbzgRscfz5ehTqtZ0CHAJp9ox4CxD8sBBH5pnPKn1tHBma/ewZEO0DsUKkd6Fu7aptfCQO15fYIIWC1rtMS0yWhlvbCerQ6ZGzOAyYdY+Byz0y/JcGt97S0D/F/mvjyvz9QJwgf932bfR7H7RWTeb9SZcBCUvwHbfEeOms/QAWC7BCxZobpA1DboMC1ilS3lrhcSQVnllG6dg0i3U+m6+oNRAEByZZ5NwzfOFg/ESgs/+jT8BsT+P/sO+YVU/HWx9sgNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4962.namprd11.prod.outlook.com (2603:10b6:303:99::23)
 by CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 11:29:51 +0000
Received: from CO1PR11MB4962.namprd11.prod.outlook.com
 ([fe80::4780:a2c:ce17:e160]) by CO1PR11MB4962.namprd11.prod.outlook.com
 ([fe80::4780:a2c:ce17:e160%6]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 11:29:51 +0000
Message-ID: <155c40ad-7f44-4186-bafc-e7f0f64928b0@intel.com>
Date: Thu, 10 Apr 2025 19:29:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Set LRC addresses before guc load
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: John Harrison <john.c.harrison@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
Content-Language: en-US
From: "Wong, Chee Yin" <chee.yin.wong@intel.com>
In-Reply-To: <20250409-fix-guc-ads-v1-1-494135f7a5d0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To CO1PR11MB4962.namprd11.prod.outlook.com
 (2603:10b6:303:99::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4962:EE_|CY5PR11MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 3028ae0a-d67c-478e-9829-08dd782301ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUp5QXpyaEo1ZFU1YmdqRWNqSVpaY0tENTBaMlprMFIyL3ZVRTMzVXp0OVdU?=
 =?utf-8?B?Vmg3YzZIOE9SdlFLTi9ZdU5uZjRYcWVSb0E4WTdJNVpCZEh0RXRtc0tFelBY?=
 =?utf-8?B?TGlwbGRTcVBkNk52Q2htTlpvUjl6NmpFdUJ4MG5sWU5wWnUrUWtaK0UvdlFz?=
 =?utf-8?B?L29DcGlORDdHK2VMNFpPdkdRUVdWSEZpWmQwVkFSYTg1NGdWTnVnUlE4aENH?=
 =?utf-8?B?NlhlU1k4VlNDQVdGM3dnMU04QjEyZjZ6ZEJuSnlHVVNMT3FtZlRFMy9STUZX?=
 =?utf-8?B?WE5kSHZUalNqR1NvMmNrVHFmWmFxTGQwOU5HYzJyS3AxUmhmSE5oelZXa1Fr?=
 =?utf-8?B?ZjZFSGRuUjN6VDkrK0JXcE9yV0RBam5vQW9ZeTUvcFVlT21QQkR6ZDJiR0hh?=
 =?utf-8?B?L2xBbDhjeUlmcTIzQjliMzhHcHltR0F4ejFnZUQxSUk4Ui9Hbi9mN0xCOFJF?=
 =?utf-8?B?SUZIVmErZVhTOUREMFZVa2lCNUlJdk9vMzlDN01saGszb0Y2MjF0MktRMEFJ?=
 =?utf-8?B?Y2M1WjhXRkVaYkMyajY0SXpqSFZaR0p4bm0wM2xjb2tIWnhXU2d2bUdoVDA0?=
 =?utf-8?B?YlBVbnVUNmRVMlNSbnBRb0g2VjR5RTlmOG5JajdTQmVSeVc4NlFVWHR1SmxJ?=
 =?utf-8?B?MGgwMTdXdWNHcExBdmFCSG95Z3I0dDNNWEdtWCtrMGplazUyb1RtSGlTMTlD?=
 =?utf-8?B?ZzJCYmJXTmliVG9pU2tGT2ZnN2EydDl6cDkvT1dINUlxbHI3dGg5QlZXbDJG?=
 =?utf-8?B?OVE0c2IwcXpHK2luako4Nnk4eGc1a2FJdnowSXFOQ1lkSUFtTjIrcTlIbVkr?=
 =?utf-8?B?RW1UbjFrTUU0ZEN5RWhRWUZVOHZPUndyKzdGM1VjMVdtNEY5YlJNREo4N0Jn?=
 =?utf-8?B?SjVhWjlHR1BqK1F1TWdHSFB5elc5eERVTDVORlpMMyt2bUF6MWd1YiszNC95?=
 =?utf-8?B?ZVJ0RndtSFFacm9YL3lEZ0xNKzRoUkpMYmRNRmJPM0pmc2lTUjgwdmFsT2dN?=
 =?utf-8?B?QUdwU05tV2huOUlDKytaZENOUU9ici9vbjRBNmFGTytIa3VuUGZZL2laVFBk?=
 =?utf-8?B?aHVsNDNRMDR2TTRGLzN3R0NtWjlveXZuMU9Td3VMOVdSTGx0bVdaNXkvZjZD?=
 =?utf-8?B?YWtkamlUR0tLbWVCR0p0NlhXUGp1aURGSm5KRWxRc0c0MEVla0tOUzYycHpX?=
 =?utf-8?B?a1krMm5jWlZJeE54SXZUblk4QXNSTFdaNGtaQmJEZnlXSzJMRTNiWm9mK0tr?=
 =?utf-8?B?ZzBxQ2NSMVZUM0YxVDVnM01mVVhzV3g1eDVqMnNnaDRLVGJxdnQ2NDVFZUVm?=
 =?utf-8?B?L2YxNlY4N2VOMk1JMTE0UVh6c2pteVI0ZDhnMDBpcDQ3bDZvaE83TnJ3bDVm?=
 =?utf-8?B?QVdnOGR2Yzg2UTY4V2E1QUVMYXJlV0FreHRoaHdzYi9CUFkxVWJuZXdHcVQw?=
 =?utf-8?B?Y0NxUm5qdlZORVAyaHNRSTQ1VmV5RTZxYTVpbVV4TzB5cXpuSGdEN0d0emRt?=
 =?utf-8?B?d2ZRQ0NTTWRPREx5Y3c3N1lFYWMyMEdFVmdzRkdia1YvSVJRakk5TlhQdkVk?=
 =?utf-8?B?RHdhNUZwWXVQeWRNUGFLMFZlK21McUViL21zZW1RUHhPaWtKamhpcnJwWkN4?=
 =?utf-8?B?VEZ0dmlyZXF3ZTVmQmd4bHNua3cxVlcrbTVxSGZ4ZzZNMmwzcnd0MDVGakZv?=
 =?utf-8?B?MVZ4cUZOZUVIY1ZsZE9QZUZxSEYzWHFPa0R4MHNJRnVOOWxHTmJ1U0Rqem9v?=
 =?utf-8?B?ZGRwdDIrb1h5bGlqbGp1aTVpTkJnRGJFUnovV0o4R0h2Yk9mNlUwd0gxR2RP?=
 =?utf-8?B?WUJLTUpFN3RWNUE5anlkRlJmY1pWYXo3NGdqVHBXNTE5V1A1bHNrSk1sKzJ1?=
 =?utf-8?B?TG1ldmQ4MytmKzN3aGZzNlhmWFhUUHlWN3ZDemUrQnFGSm9IN0JSOEdDWGE1?=
 =?utf-8?Q?MIpi0mC34eU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4962.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVFxSjdKcm1QeTFtR0crT3pqV1I1L0hGQ2ZrdTQ1QXdYWThPajdHb2lJcnRu?=
 =?utf-8?B?bklSSVZTK1NmeHhhS2lGSFoyeFArbTBHNGRMMm84VXhoWkl0b01JMzdwL1BE?=
 =?utf-8?B?N0M1NDg3VTBOcnFrV1RqWjZ0dC9uOEdtZTZ5UCtUUlQydGJXSFFGSzdORmdm?=
 =?utf-8?B?emtJRTZXTGFrUGRhNmw3N0pPQXNlMU94TmJ5TGZPdmV3c2dySjVNV2o3elho?=
 =?utf-8?B?SVJndXlNeXZKdWZnaTZ4TEUyTzJMVWJSOXZNZjlRTVM2T2V3S2pxbFllNlJC?=
 =?utf-8?B?Z2Y2ak9nZDl4TDNRb1JFV0ZxMmd1RWxnaDJvendNQmpsSlh2eGkxdVFRdVlE?=
 =?utf-8?B?ZTlUZlFWdFNpTnQ5TmZnS1JTQjlHTDJOOFJYcWxHck5JRjhMWUM1QkV4QmZC?=
 =?utf-8?B?L3MvZ0JzOWo1NlcwbGtzRnR1andWNFRHUTlzblFzdGh5NUFFWEtLb1NiVGRE?=
 =?utf-8?B?SzJ1SzZ2V1piMkgrTWpoNHpvekFXVTBzSWNreEJoT1dqVHMxbWVNLy9NVWVU?=
 =?utf-8?B?cHY3MEduVWcrUzlZS2Z6VkgrMktIZk9oaHp4bEhjbDN2aTVRY2QrLzFuaDMv?=
 =?utf-8?B?UFNnejlJTmZJNERpWEZDcnQwSFlWajhLN0p5dEE0OGFtSGJtNWdLdTkzSFVs?=
 =?utf-8?B?V25FeXE4cDBVZFlzM29EU2NNbG11YUwwL2RVaWJzdSs2WDRqZEF1aE01T1ZF?=
 =?utf-8?B?Yzh1c3VpSTloS25IRlJhQ1FGaXgvZklsZytqNG9pc2pRY3VSaHZ4bWkrdCsx?=
 =?utf-8?B?c0ZYQno4d0JyU2V2RFgrTk1HM2h5b1ZtUHBmRllDVFBsUldLQVRCcFpHazdp?=
 =?utf-8?B?V2E0Ti82SGdhV1dvVmtwME9SMXBLdThYVXo1UTJjbGZDeW9BZkxvZkg0cWt1?=
 =?utf-8?B?cjhjTTM4MHJnNDltVWNZUnlhYiswb0FpeXdFRU9KdWo2eGw5TFR1akZ3Q3ZC?=
 =?utf-8?B?aFFMZEx2cTVwWjl3dGpyYlpxcm5vNlF4alp4QlVIQkFZZklPUU1xS1h4QStB?=
 =?utf-8?B?ZStRM29BcHdnRHBPR3BqcHlCbjZ0eDRZUnIxWkdHUWxqaFBxNk9FWm9VSCtx?=
 =?utf-8?B?MnZHNVdQdTd2L2tLcEgwQnZiVEZLbGtVNFRvQXJvNFdMblNJZ2FsQlJIWDRv?=
 =?utf-8?B?dlZQR1lTUjhKNjIwU1hEaE95ZUhLK0QrdzlRbXhVN2R4ZDA1OWZnaXlnYXlw?=
 =?utf-8?B?Rkg0anNFbVJ6Mk11NHFIN1FoQ1hpTy9jdnhaakVPZXQwS3JKYXhYSDB4Tksr?=
 =?utf-8?B?UlFwdWtiL0Jlb1pLWFdzU3NYdWRyRjRucmpOT004N3NTa2oxczR3R1pjVWxG?=
 =?utf-8?B?SEZrRG44YlpWY3lsL09rVXdMb1djbXV6cnkrYnlnd2tKbG51UEhmcjZQa2VI?=
 =?utf-8?B?dVdldm9CZllKKzM5ZlRCOWpmcmcvUlViR1JUR3JKQUJaWUNsQm9vK0pkOGdq?=
 =?utf-8?B?SXNBRkJyOVkwSEp1OTQwUE0yL21qbUs5N0gzalFETkdob0h6T1Rqdk5lWTZP?=
 =?utf-8?B?clNTMVd6RHdMaldRcWx4ekcvMnNLVHJPM3ZqQm1XdFU4N25UclA1a1NtSExj?=
 =?utf-8?B?K2N4UG8wRnByallPNmk3WnRHbGF1ZVBIeXFVVFNFMms5ckI0QmVzSklzOFE4?=
 =?utf-8?B?dEl1ZURhS0x0TytCMEhGQmVaR2UvcFVlblFwcVRXTGVzZS9hMFpqQVRsK0tJ?=
 =?utf-8?B?N1Z4M1BlYUJCb0E5NDQ5OHpwWkEra09HOG5DR0JIYVhjcENhUUxFWXVlSHhX?=
 =?utf-8?B?UmlpS0NkQmQ1SmRPQndYQjJRbytvRnNUZi8wSVFDbjdKS0V6aUlLMVl3MU96?=
 =?utf-8?B?cGFYUzV4SkFtR3lzR2tqWUNhYmJjUlQvc1Rtb0ZNL3J2c2o4QW90Z1pJTTlP?=
 =?utf-8?B?eSt6Q0xLYjVUMkxMcHo4ekNxN1JRL1pJM0FSVUFOeWxLQlU2N1FOeU9YOXdz?=
 =?utf-8?B?VTFTb1Q4eGRBYVFXODR1ZGtqdGZhTlJxOWoyL0p5R25FTlFwQlVySmx1OXYx?=
 =?utf-8?B?RkdrNXdVcWgzZTFTN0JTaHZiMnl0cjgxeklwK1dnT1RnV1c2VzRtZHh1cWFS?=
 =?utf-8?B?ZXZwNElGQ2dVZzRnZXBPVEdrMVdHREpMcitZRWg4QkQvekN4MXltMGQ4K1la?=
 =?utf-8?B?NW5XbElvRFFkRkxCNEptc3g1K0tuUW5nR1RySFNkekZ6SVhadDVOL0d3RzBm?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3028ae0a-d67c-478e-9829-08dd782301ba
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4962.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 11:29:50.9689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bCyqEmZaZOY0TUjjYfOaa6zUX2uzunxFhiCmBbCKuycWpPo2GH0D339OWaIDrNhZBHdfj/GKMeHVSx5DNjWCBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
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

Hi,

I have tested this patch, no Yellow Bang observed in Windows VM. Able to 
run 3D and media workloads in Windows VM.

Tested-by: Wong, Chee Yin <chee.yin.wong@intel.com>

Best regards,
Chee Yin

On 10/4/2025 12:59 pm, Lucas De Marchi wrote:
> The metadata saved in the ADS is read by GuC when it's initialized.
>
> Saving the addresses to the LRCs when they are populated is too late as
>
> GuC will keep using the old ones.
>
>
>
> This was causing GuC to use the RCS LRC for any engine class. It's not a
>
> big problem on a Linux-only scenario since the they are used by GuC only
>
> on media engines when the watchdog is triggered. However, in a
>
> virtualization scenario with Windows as the VF, it causes the wrong LRCs
>
> to be loaded as the watchdog is used for all engines.
>
>
>
> Fix it by letting guc_golden_lrc_init() initialize the metadata, like
>
> other *_init() functions, and later guc_golden_lrc_populate() to copy
>
> the LRCs to the right places. The former is called before the second GuC
>
> load, while the latter is called after LRCs have been recorded.
>
>
>
> Cc: Chee Yin Wong <chee.yin.wong@intel.com>
>
> Cc: John Harrison <john.c.harrison@intel.com>
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
>
> Cc: Matthew Brost <matthew.brost@intel.com>
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
> ---
>
>   drivers/gpu/drm/xe/xe_guc_ads.c | 75 ++++++++++++++++++++++++-----------------
>
>   1 file changed, 45 insertions(+), 30 deletions(-)
>
>
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>
> index 88400f249e614..2a227213c37ff 100644
>
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>
> @@ -491,24 +491,52 @@ static void fill_engine_enable_masks(struct xe_gt *gt,
>
>   		       engine_enable_mask(gt, XE_ENGINE_CLASS_OTHER));
>
>   }
>
>   
>
> -static void guc_prep_golden_lrc_null(struct xe_guc_ads *ads)
>
> +/*
>
> + * Write the offsets corresponding to the golden LRCs. The actual data is
>
> + * populated later by guc_golden_lrc_populate()
>
> + */
>
> +static void guc_golden_lrc_init(struct xe_guc_ads *ads)
>
>   {
>
>   	struct xe_device *xe = ads_to_xe(ads);
>
> +	struct xe_gt *gt = ads_to_gt(ads);
>
>   	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>
>   			offsetof(struct __guc_ads_blob, system_info));
>
> -	u8 guc_class;
>
> +	size_t alloc_size, real_size;
>
> +	u32 addr_ggtt, offset;
>
> +	int class;
>
> +
>
> +	offset = guc_ads_golden_lrc_offset(ads);
>
> +	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>
> +
>
> +	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>
> +		u8 guc_class;
>
> +
>
> +		guc_class = xe_engine_class_to_guc_class(class);
>
>   
>
> -	for (guc_class = 0; guc_class <= GUC_MAX_ENGINE_CLASSES; ++guc_class) {
>
>   		if (!info_map_read(xe, &info_map,
>
>   				   engine_enabled_masks[guc_class]))
>
>   			continue;
>
>   
>
> +		real_size = xe_gt_lrc_size(gt, class);
>
> +		alloc_size = PAGE_ALIGN(real_size);
>
> +
>
> +		/*
>
> +		 * This interface is slightly confusing. We need to pass the
>
> +		 * base address of the full golden context and the size of just
>
> +		 * the engine state, which is the section of the context image
>
> +		 * that starts after the execlists LRC registers. This is
>
> +		 * required to allow the GuC to restore just the engine state
>
> +		 * when a watchdog reset occurs.
>
> +		 * We calculate the engine state size by removing the size of
>
> +		 * what comes before it in the context image (which is identical
>
> +		 * on all engines).
>
> +		 */
>
>   		ads_blob_write(ads, ads.eng_state_size[guc_class],
>
> -			       guc_ads_golden_lrc_size(ads) -
>
> -			       xe_lrc_skip_size(xe));
>
> +			       real_size - xe_lrc_skip_size(xe));
>
>   		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
>
> -			       xe_bo_ggtt_addr(ads->bo) +
>
> -			       guc_ads_golden_lrc_offset(ads));
>
> +			       addr_ggtt);
>
> +
>
> +		addr_ggtt += alloc_size;
>
>   	}
>
>   }
>
>   
>
> @@ -858,7 +886,7 @@ void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads)
>
>   
>
>   	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
>
>   	guc_policies_init(ads);
>
> -	guc_prep_golden_lrc_null(ads);
>
> +	guc_golden_lrc_init(ads);
>
>   	guc_mapping_table_init_invalid(gt, &info_map);
>
>   	guc_doorbell_init(ads);
>
>   
>
> @@ -884,7 +912,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>
>   	guc_policies_init(ads);
>
>   	fill_engine_enable_masks(gt, &info_map);
>
>   	guc_mmio_reg_state_init(ads);
>
> -	guc_prep_golden_lrc_null(ads);
>
> +	guc_golden_lrc_init(ads);
>
>   	guc_mapping_table_init(gt, &info_map);
>
>   	guc_capture_prep_lists(ads);
>
>   	guc_doorbell_init(ads);
>
> @@ -904,18 +932,22 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
>
>   		       guc_ads_private_data_offset(ads));
>
>   }
>
>   
>
> -static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>
> +/*
>
> + * After the golden LRC's are recorded for each engine class by the first
>
> + * submission, copy them to the ADS, as initialized earlier by
>
> + * guc_golden_lrc_init().
>
> + */
>
> +static void guc_golden_lrc_populate(struct xe_guc_ads *ads)
>
>   {
>
>   	struct xe_device *xe = ads_to_xe(ads);
>
>   	struct xe_gt *gt = ads_to_gt(ads);
>
>   	struct iosys_map info_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
>
>   			offsetof(struct __guc_ads_blob, system_info));
>
>   	size_t total_size = 0, alloc_size, real_size;
>
> -	u32 addr_ggtt, offset;
>
> +	u32 offset;
>
>   	int class;
>
>   
>
>   	offset = guc_ads_golden_lrc_offset(ads);
>
> -	addr_ggtt = xe_bo_ggtt_addr(ads->bo) + offset;
>
>   
>
>   	for (class = 0; class < XE_ENGINE_CLASS_MAX; ++class) {
>
>   		u8 guc_class;
>
> @@ -932,26 +964,9 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>
>   		alloc_size = PAGE_ALIGN(real_size);
>
>   		total_size += alloc_size;
>
>   
>
> -		/*
>
> -		 * This interface is slightly confusing. We need to pass the
>
> -		 * base address of the full golden context and the size of just
>
> -		 * the engine state, which is the section of the context image
>
> -		 * that starts after the execlists LRC registers. This is
>
> -		 * required to allow the GuC to restore just the engine state
>
> -		 * when a watchdog reset occurs.
>
> -		 * We calculate the engine state size by removing the size of
>
> -		 * what comes before it in the context image (which is identical
>
> -		 * on all engines).
>
> -		 */
>
> -		ads_blob_write(ads, ads.eng_state_size[guc_class],
>
> -			       real_size - xe_lrc_skip_size(xe));
>
> -		ads_blob_write(ads, ads.golden_context_lrca[guc_class],
>
> -			       addr_ggtt);
>
> -
>
>   		xe_map_memcpy_to(xe, ads_to_map(ads), offset,
>
>   				 gt->default_lrc[class], real_size);
>
>   
>
> -		addr_ggtt += alloc_size;
>
>   		offset += alloc_size;
>
>   	}
>
>   
>
> @@ -960,7 +975,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
>
>   
>
>   void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
>
>   {
>
> -	guc_populate_golden_lrc(ads);
>
> +	guc_golden_lrc_populate(ads);
>
>   }
>
>   
>
>   static int guc_ads_action_update_policies(struct xe_guc_ads *ads, u32 policy_offset)
>
>
>
>
>
>
>
