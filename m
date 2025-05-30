Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F29C5AE59
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 01:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035510E0CF;
	Fri, 30 May 2025 01:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExXua+wv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165AD10E0CF
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 01:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748567390; x=1780103390;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TKt3LOifToXVBtqOAsO6Ri1Ttp5MoJpO3bKGRrcR0Aw=;
 b=ExXua+wvfu3wfA6VTQTBjl9GjU9zRVvAYPfWAAMMCv07UPtCCemrpAv5
 7uq07n57d93Z0c9psgPVu305QhDWVY6NZb4nBUGULrWjlX0HYs7HyJWM9
 opjNeplIHO0ZiprDehOFfG8I9TFR7r0uIS1SAYMLxu/Rbzv3NQOY3rVwu
 vGKUpHczmr7PbsuvfBKwfbM74NCHlYGdV8BcXOycAQ5aHDCc8557nq8nQ
 5j3TSXOyB1wgcPbLkphRnqF7WdsEgx6nqZH7onAH5MJckQ7WQrLdYHzL3
 YJTCeQrtu+GOFridVdQFv9PGMSNTPoYEsjTOu3C9NUCD67IeoUmi5e9cY w==;
X-CSE-ConnectionGUID: zNbrxZXdSbKfCel3UI8vtA==
X-CSE-MsgGUID: AvnsRzisQIO6nim/FwM63Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="68074969"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="68074969"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 18:09:49 -0700
X-CSE-ConnectionGUID: ZQAYYwMpQHaa8NlkMEGzEA==
X-CSE-MsgGUID: JQXck1JfToe8D/TgU2sBPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; d="scan'208";a="144056599"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 18:09:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 18:09:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 18:09:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 18:09:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuQaK4AeG68aX59qaX+IiPlTpD+wd7NWizwG0ImUwjUH8Uw9WUhoWmaikMNwyKlyTYw9t7BVtSgVK6UhUEFr3qcl6NZjcWvPOLihJLqiGbSGLAdlaNF7MgiSs+G/u9P5w/MQQhiCq04HkuODzCtUXhcXbeqdDXUfvoKfcvHUJxoRpWJcdCC8TVUx3nKfgWm8857FQNmZmVh1oUFCnzSGvuCRGZAGSg9bWVusD34VaLbuMp4ooIMtNMYEwUxok0GEFN8u+Zn6YOxWH4AJWV/D9kZozrY9JDpala337qNVLtPUyLp0ys6gtmJZG4m7Hy1qGmFlcL/R/6E7d+vinD5ANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5L84HJYz/vOLkQHjB4rULuqzU9kaF8F7iT3SB3wFdrA=;
 b=YdXYX3YbUff7FBYYBTb9ATlBNAT193ibvrWN2hEwRm418wQTYJR1l44ySEwDQQyuGQKCde0EHWTVQL3OyxiG8SJip9qTAs59M/3sE7yHpQQL59ltHGyDk8h1R0h+zdYOqIdAfRZwquoo/O3o2SulYZqqF6DPQVtRt5tnq4wwyIelW9i/n778y3x9fndcVTEKn5f5YzAstDwjpuDhbD0dkbGO77+dR16GYZLgOwryd93saPERbaV4HyxcWwpMeSbuN71g+bkyKLlthR1FysXUn9TSYc8UIDAAn8tkrY3jybdEvxc/HMYuTajfkMpOrOG/H8HALZPUq8W8DGkeZShBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS7PR11MB7886.namprd11.prod.outlook.com (2603:10b6:8:d8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 01:09:02 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 01:09:01 +0000
Message-ID: <012981f3-6716-4ac1-a749-1714618f60f8@intel.com>
Date: Thu, 29 May 2025 18:08:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe/pxp: Decouple queue addition from PXP start
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
 <20250522225401.3953243-8-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250522225401.3953243-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:303:b5::11) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS7PR11MB7886:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f16d35e-fd59-4bbd-bf5a-08dd9f169057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1ZJR3lha1NrSFQ0TElyeEUwQnExRno5KzgrN2MxNklHK2dnN2FDTFhkMlFL?=
 =?utf-8?B?ZitpaWNQRGwweTlPUXprQ0xVQVEzVXZYL01sbEJISnY2UzdWK1EyYnlaVGhN?=
 =?utf-8?B?K0gxZllxZy9mL29mcnZyQnhoYklkTkFUL2ZWWFZzQjNqdTVtQ0hiYWdoZmRq?=
 =?utf-8?B?QmdEQjhWekJaWEgrNC9wVTU2V2p6aDVuY2FhVEtucmJtZTF0SXJMcHRCRFI3?=
 =?utf-8?B?SzVMdUQ0L0t2RmxUbjRIZThCeXE2cUJTL205QzE4c2w1L3hOZjhuY0EvY2E4?=
 =?utf-8?B?eFhoSjlUVEp5SUljVm5XZmtrQ002ZHlWUWpXSHQ4SmN5MStNYitsMC83U2Y1?=
 =?utf-8?B?b0pOWW9iYVRkMHJCaGVJT3VpTThBL3hvd1psNmozTExhK2FCT1JBNDFkNkJl?=
 =?utf-8?B?WjU2ZWt4WmFkdUwvY0J6NmpDTENuZktZRDYvNFhDYW53MitNaFgvUWhQR3pC?=
 =?utf-8?B?bW4zTUQ0RDh4ajhlTGxWRGFCNnN3NXJVbjBoL0ZqRy9BVEtSVG9OR1ZLY0dO?=
 =?utf-8?B?bzlkU2JZZm9QY0h4M0J6T0VNZ3pmWXVWWmR6NFBKQ2hjaHpCN0U5S3o0N082?=
 =?utf-8?B?UmkzT09IRmU4RER3SXpmbEtLblYxR2tnODl4cGRjTU1yU1dMT1k4UUtKNy8y?=
 =?utf-8?B?TVVxU0djallBS0hKRE0wcWZlZSszVWVZQ2V3RHp2OXNscThMRmc4Z013YmFh?=
 =?utf-8?B?VkxnQzlRc24yM0hMZDA1bUJINzYrOWFRQ2tJMVMvY3Zwb3NQNVNpVFhEWlNs?=
 =?utf-8?B?WmtpZmM2QjUvOW9hbmo2dmRFbEZFSXdlSm9QZklUQlc3TWdnWkxTSEZycjZ4?=
 =?utf-8?B?a2lEVFYvUGZ3M29rblRlV2lYMVFiUmJnd1ZkQ2E2a1JaRFd5R0RQTGYwSkZS?=
 =?utf-8?B?WXdEZ2lXVzZTK2hNandYcE1rNkMrL2pwMGFYNFNjQjd2bC9YbGdOaXdoWG1W?=
 =?utf-8?B?aTRDdTNUQmNjMTdIVGMyUkxjYTY0T0Q5c2QybEhqWmtNa1BUd2pDZDNrV2Nv?=
 =?utf-8?B?cmNRNXRqUHA0dUQ4NnBWOWRWa2h2RXJXSi9NazdyL2toajVTZG1RNHhoeXJS?=
 =?utf-8?B?QStpcXRyTTdyZlpjbjE5NWNRWG1HVG9LYzNSM0NRTTVHbEprdFZzL1VkRWhB?=
 =?utf-8?B?NEhNVmlyaCtNTDB0cWNHS1hwdDI1LzVoRm1MbHp2a3daYzB6S0NWTVRqNDhF?=
 =?utf-8?B?ZU8xaGhLN0xzRitsVWJjK3ByRWdKK3RWSEFGU014djl2Sjl4YkVFNk91MWND?=
 =?utf-8?B?RXl5citiTmduSVR3YzYrYUVISUYrZmdmQzRSbXE0N2xFelducFZ4bnNhSWxQ?=
 =?utf-8?B?UWRNem9hS3l5T241eEpwbGFkQmNqekZsQWZ3L3VmV3NUU09kMUhyN0FtWnRt?=
 =?utf-8?B?QVo3ODBpaFpCNUhaSjh2dGluQk1INnZKdkFQVlFEbVhlNjJoa0Y1bHc5RUMz?=
 =?utf-8?B?NlF3WFBhY2tCd1Z0L1E5d1o3VEpCL0tLVmRvTXdRclloN0N5clh5ZjFjY2k2?=
 =?utf-8?B?NmhSTFlHUmthSHNYNHV1TWRKUGJrQ3gyNGxxOEo0bWp0WDd6WEVJMWJ5Rit5?=
 =?utf-8?B?Y016aFlPMjRrVTlyRWExREIrU2JscnVUYytsMGR1bkV4ZExjTFRzRDZoMWd0?=
 =?utf-8?B?cVljdGUzaWMvV0ZSVkl6RnNlZ0YwRXUyaENCaTcwWDZNU0d4Y2o3ZjJpVUpC?=
 =?utf-8?B?T2ljb051eG1JTGt4dll6SUtNcTV4L2FqUnJoSkdnQ200M2ZoUFQrRVhCUmJF?=
 =?utf-8?B?NjRYNzJlWXlPSFUvZTFCOTZvY2Nhdm5oaEhpSWU4d1Q1b2E5QWZZeklEU2tV?=
 =?utf-8?B?WDhFbDZnbkVrbStBWkcvMTBXd3RhWUI0anp2UTFqUzRtSVJkdkErOThCMjRV?=
 =?utf-8?B?VTdIeWtEa28zaXBzcW16VERWTXRya3VCT0lMQy9DMytCUTBRc0U5U0l1ZHZo?=
 =?utf-8?Q?fS/RKc2XG6U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWdHTWhtV1FZK1ZLTktGbjZhdjR3UVdPTC91bmo3R0szdkY2ZlN2dzRXVFRN?=
 =?utf-8?B?ZWhBVU1JZzJJU2JrbnlialZKWnNzcUU5aTFvUW1MWUdsc2s4RnY4SG84RFJX?=
 =?utf-8?B?WWkxNDNiOFQzN0laZ05MMm5zdWl1R1gzRGt0ZktYY0FaL0lMVVFYUUhqWThq?=
 =?utf-8?B?Q2tOS2VjL2FEVXYxNW5YTU83UW10VU1DVUxjLzdRTzRxeDBKQm9SMk4xNGxT?=
 =?utf-8?B?VWdiK0RLSW05QUYyMXZka1M4bHNnQ0p0Ly9vWVFSRG05dU9nSGFBa3orNzlP?=
 =?utf-8?B?L1hBZ2wva2xrYnNNN2VvVWpBM1ZLMFZhWmQ1blNla2dNQ1RvaVo2L3FFOFZu?=
 =?utf-8?B?KzkySWdsbHBSaHBHQWFBYjBSeEdCZXlZTC9LNkJCZTZxMitueWR2ck9rSkxV?=
 =?utf-8?B?bStDclVFajR0cnp3REdqVDdmMGVOS2V2MGNESFRWa0wrZmRFQ0k5MWYvVFhK?=
 =?utf-8?B?UXJQWVlpbm5OeGRpczlhQmRQcGphNlRPZXExbE54Y1VZZ00rMDNNekhlRlUz?=
 =?utf-8?B?Zjl4ZGg4eU9CeDBJRlRXZGpZUlVHdGdGVjJtY2dUS21ZRVRQQ2ExNFJCZk5Y?=
 =?utf-8?B?VmxjRkozWFhvU0Mxd3NkRXVhVVMyWVptYlpGdDhNVVRza2dmODlEUFNwQnoz?=
 =?utf-8?B?eTVlMkFieWcyWEZVUm93dDQ5QmRIV3VML1JVZ3hIajNocXcvaWFDNTZNUFcz?=
 =?utf-8?B?UnJnNE5tcWdWMjhSNExwTnJsMFBZcmdnS2s0R2dWZnlPeTBtMjJKa2dNUjcv?=
 =?utf-8?B?dUVON2d2eHVSRkFIMVBJdTlnbGVxZHpHcTVCVW5OQVJaeVVtbnFTRFJXT2FF?=
 =?utf-8?B?UXFTZ3JnMEl6MTFkbHh0NVkvcS9CN29hRjJrVjRxcWZwQkx0R1pUN2Q2M1A5?=
 =?utf-8?B?UlFlQlB0eEkxVjhRY09TeklubGUyTjBTdkJTdWo1YkJaeXpjYUFkTTROeE1S?=
 =?utf-8?B?N2xkbUJId0pLdllDbGdQNTg4RW9pQWhGY0JQZXlrRVdDb0pKbVJPUHpkVnhn?=
 =?utf-8?B?K3BvWTNKWldiMkR0YVZuYm1rMUV0V2Nkc21LMURmZEExZUZvWFdEbXY1S2h0?=
 =?utf-8?B?Ym5aenRacWpGTnBoTXJ5ZUdZSEx6L1FTTFg2a2I4d08rb09OR1RxMkoxTldx?=
 =?utf-8?B?NmNFdEZSYWhFcUZYMCtDRGNBK0Y0aHBJRkJlVjh3OTkxU0tUczlZdlY3VHZB?=
 =?utf-8?B?TXV2eUF1NUpQZ1NLcERDQUJiR29vd1owSFVwZW5LckhvUTcrblhad08xd3pK?=
 =?utf-8?B?RFdtK3BQK2ZkengyNG81NmYwQkp1RURkZ0hRSTJIK3R1RlJiRUxobHFEc2Jj?=
 =?utf-8?B?bmdHUWs4TERieHJab29GcDBlUzRNU3llOGZsOWhGL1FWS3dwelM2RWxodFFi?=
 =?utf-8?B?THFqSUlhWEllNDlFNTNQWnoycy8yY3FQdVR4cmpqRlp4VEt6RTVHakNFQjZz?=
 =?utf-8?B?MmR3M0V1cHRKcldORXNmYzdNSVB4YlZyRDVISHJ5T21BZXpwMThUZGV3eFNW?=
 =?utf-8?B?VzFtYjRhZk9rY3dnZzRaVDFSa0JLRUpQcXlSNFprVzBkcFFEdHVYbG8vRGMy?=
 =?utf-8?B?ejlxRXVtaC9WQk91VGRxamVqN29QVmkwbkRTTTI4eFJHUlloU1RBZ3VsQTlk?=
 =?utf-8?B?RVE1TWNVbEt0dFJzQU9pUG9JZkIrc2VzUTB4K1ZuVmMrc2dKdkFWbmozaEhH?=
 =?utf-8?B?OStleTVEQ09sdTVGdXA0UnBiT0VvOTNwUWxEMHlIbUYyZGwzSDhQY3JKbkti?=
 =?utf-8?B?VzlYeVRsUWdFQVh4N0hHR2taa3lVSEZhRWRDcGxNTmhYa0pEblFKdXJuL3gz?=
 =?utf-8?B?aXdZam1WZkI0dHRDNWNZRDJQRnZ2ZlE2MmJNVmNydTdjWkxkQlB2aE8xWCtx?=
 =?utf-8?B?ZkdSUGpsTnYycTZwR0d4UFg4bEsvU3piN1F2ZzZhRjZiT2EzN2sremwyd1lZ?=
 =?utf-8?B?K0kybFZOUHZiWDFxRFZqOHdMeXp2REg5UEFBZHI0eXBVakp5b0lNMVd2QUxl?=
 =?utf-8?B?S1VBQnQrWE80dXI4Qm9xdnFvRHZpUmtqREI5ZlRhMHpVcU5XZUU1eWRjdGJl?=
 =?utf-8?B?NVI1K3Z5NXZ3YWhqWWl1MW1nVnpUQzB4WVhtMXdzWWY2UitmS0ZwUjBXQTNX?=
 =?utf-8?B?RERLNHk0Y1M5WmM0ckFVT29BaWZvTm92NmJCU1hjM1FlM0FIbUpvcmhOTTBx?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f16d35e-fd59-4bbd-bf5a-08dd9f169057
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 01:09:01.8381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGgr+BYF4ijBnmvNTfc18K1htJ6k3vgoYmPBsrcoi4x7zDzhwOtu5oZhWN/hXaDFvJGwuwzPdik+w0b1tDbTHZFaaZtxw8ba0b8IHvATSTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7886
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

On 5/22/2025 3:54 PM, Daniele Ceraolo Spurio wrote:
> Starting PXP and adding a queue to the PXP queue list are separate
> actions. Given that a queue can only be added to the list if PXP is
> active, the 2 actions were bundled together to avoid having to
> re-lock and re-check the status to perform the queue addition after
> having done so during the PXP start. However, we don't save a lot of
> complexity by doing so and we lose in clarity of code, so overall it's
> cleaner to just keep the 2 actions separate.
>
> v2: remove leftover rpm_get (John), fix rpm_put in error case
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pxp.c | 147 +++++++++++++++++++++---------------
>   1 file changed, 86 insertions(+), 61 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index b5bc15f436fa..3d62008c99f1 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -504,69 +504,62 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 t
>   	return 0;
>   }
>   
> -static void __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +static int __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   {
> -	spin_lock_irq(&pxp->queues.lock);
> -	list_add_tail(&q->pxp.link, &pxp->queues.list);
> -	spin_unlock_irq(&pxp->queues.lock);
> +	int ret = 0;
> +
> +	/*
> +	 * A queue can be added to the list only if the PXP is in active status,
> +	 * otherwise the termination might not handle it correctly.
> +	 */
> +	mutex_lock(&pxp->mutex);
> +
> +	if (pxp->status == XE_PXP_ACTIVE) {
> +		spin_lock_irq(&pxp->queues.lock);
> +		list_add_tail(&q->pxp.link, &pxp->queues.list);
> +		spin_unlock_irq(&pxp->queues.lock);
> +	} else if (pxp->status == XE_PXP_ERROR || pxp->status == XE_PXP_SUSPENDED) {
> +		ret = -EIO;
> +	} else {
> +		ret = -EBUSY; /* try again later */
> +	}
> +
> +	mutex_unlock(&pxp->mutex);
> +
> +	return ret;
>   }
>   
> -/**
> - * xe_pxp_exec_queue_add - add a queue to the PXP list
> - * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> - * @q: the queue to add to the list
> - *
> - * If PXP is enabled and the prerequisites are done, start the PXP ARB
> - * session (if not already running) and add the queue to the PXP list. Note
> - * that the queue must have previously been marked as using PXP with
> - * xe_pxp_exec_queue_set_type.
> - *
> - * Returns 0 if the PXP ARB session is running and the queue is in the list,
> - * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> - * other errno value if something goes wrong during the session start.
> - */
> -int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +static int pxp_start(struct xe_pxp *pxp, u8 type)
>   {
>   	int ret = 0;
> +	bool restart = false;
>   
>   	if (!xe_pxp_is_enabled(pxp))
>   		return -ENODEV;
>   
>   	/* we only support HWDRM sessions right now */
> -	xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
> -
> -	/*
> -	 * Runtime suspend kills PXP, so we take a reference to prevent it from
> -	 * happening while we have active queues that use PXP
> -	 */
> -	xe_pm_runtime_get(pxp->xe);
> +	xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
>   
>   	/* get_readiness_status() returns 0 for in-progress and 1 for done */
>   	ret = xe_pxp_get_readiness_status(pxp);
> -	if (ret <= 0) {
> -		if (!ret)
> -			ret = -EBUSY;
> -		goto out;
> -	}
> +	if (ret <= 0)
> +		return ret ?: -EBUSY;
> +
>   	ret = 0;
>   
>   wait_for_idle:
>   	/*
>   	 * if there is an action in progress, wait for it. We need to wait
>   	 * outside the lock because the completion is done from within the lock.
> -	 * Note that the two action should never be pending at the same time.
> +	 * Note that the two actions should never be pending at the same time.
>   	 */
>   	if (!wait_for_completion_timeout(&pxp->termination,
> -					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS))) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
> +					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
>   
>   	if (!wait_for_completion_timeout(&pxp->activation,
> -					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS))) {
> -		ret = -ETIMEDOUT;
> -		goto out;
> -	}
> +					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
>   
>   	mutex_lock(&pxp->mutex);
>   
> @@ -574,11 +567,9 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	switch (pxp->status) {
>   	case XE_PXP_ERROR:
>   		ret = -EIO;
> -		break;
> +		goto out_unlock;
>   	case XE_PXP_ACTIVE:
> -		__exec_queue_add(pxp, q);
> -		mutex_unlock(&pxp->mutex);
> -		goto out;
> +		goto out_unlock;
>   	case XE_PXP_READY_TO_START:
>   		pxp->status = XE_PXP_START_IN_PROGRESS;
>   		reinit_completion(&pxp->activation);
> @@ -586,8 +577,8 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	case XE_PXP_START_IN_PROGRESS:
>   		/* If a start is in progress then the completion must not be done */
>   		XE_WARN_ON(completion_done(&pxp->activation));
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	case XE_PXP_NEEDS_TERMINATION:
>   		mark_termination_in_progress(pxp);
>   		break;
> @@ -595,29 +586,25 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
>   		/* If a termination is in progress then the completion must not be done */
>   		XE_WARN_ON(completion_done(&pxp->termination));
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	case XE_PXP_SUSPENDED:
>   	default:
>   		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u\n", pxp->status);
>   		ret = -EIO;
> -		break;
> +		goto out_unlock;
>   	}
>   
>   	mutex_unlock(&pxp->mutex);
>   
> -	if (ret)
> -		goto out;
> -
>   	if (!completion_done(&pxp->termination)) {
>   		ret = pxp_terminate_hw(pxp);
>   		if (ret) {
>   			drm_err(&pxp->xe->drm, "PXP termination failed before start\n");
>   			mutex_lock(&pxp->mutex);
>   			pxp->status = XE_PXP_ERROR;
> -			mutex_unlock(&pxp->mutex);
>   
> -			goto out;
> +			goto out_unlock;
>   		}
>   
>   		goto wait_for_idle;
> @@ -639,21 +626,59 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>   	if (pxp->status != XE_PXP_START_IN_PROGRESS) {
>   		drm_err(&pxp->xe->drm, "unexpected state after PXP start: %u\n", pxp->status);
>   		pxp->status = XE_PXP_NEEDS_TERMINATION;
> -		mutex_unlock(&pxp->mutex);
> -		goto wait_for_idle;
> +		restart = true;
> +		goto out_unlock;
>   	}
>   
>   	/* If everything went ok, update the status and add the queue to the list */
> -	if (!ret) {
> +	if (!ret)
>   		pxp->status = XE_PXP_ACTIVE;
> -		__exec_queue_add(pxp, q);
> -	} else {
> +	else
>   		pxp->status = XE_PXP_ERROR;
> -	}
>   
> +out_unlock:
>   	mutex_unlock(&pxp->mutex);
>   
> -out:
> +	if (restart)
> +		goto wait_for_idle;
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_pxp_exec_queue_add - add a queue to the PXP list
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @q: the queue to add to the list
> + *
> + * If PXP is enabled and the prerequisites are done, start the PXP default
> + * session (if not already running) and add the queue to the PXP list.
> + *
> + * Returns 0 if the PXP session is running and the queue is in the list,
> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
> + * other errno value if something goes wrong during the session start.
> + */
> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
> +{
> +	int ret;
> +
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	/*
> +	 * Runtime suspend kills PXP, so we take a reference to prevent it from
> +	 * happening while we have active queues that use PXP
> +	 */
> +	xe_pm_runtime_get(pxp->xe);
> +
> +start:
> +	ret = pxp_start(pxp, q->pxp.type);
> +
> +	if (!ret) {
> +		ret = __exec_queue_add(pxp, q);
> +		if (ret == -EBUSY)
> +			goto start;
> +	}
> +
>   	/*
>   	 * in the successful case the PM ref is released from
>   	 * xe_pxp_exec_queue_remove

