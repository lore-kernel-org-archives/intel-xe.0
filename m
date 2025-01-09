Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8ACE7719A
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 09:24:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DFD10E0D3;
	Thu,  9 Jan 2025 09:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OqmcfNNA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B464110E0D3
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 09:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736414638; x=1767950638;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MSSE30Gi3EjQVh0q9zRM8Ljwb3EEVcB99u59pRqNMO0=;
 b=OqmcfNNAwjY7ptI0u3sCMjvvc6UGUhzyszeY29qUBbP4YU8aYSRJcYqj
 trD+FAVp43TCTEZDLiy03yuIksSGj4tBUaxMXIPqr29a6dA2yWL9EKP1P
 QBYiGJdS14eXD/yTRQlniT6Ff/qpp+RPe9rmexKFdDEqWMXthXnjNQtBw
 73Tkw2Z0fdk7QshYssqI/ycQj9A8g6J2s5ZufQYbq5nocQoPWofKdHAma
 b97pP7dCbLhNoFy7N04aoBwgQMX/JQnA+xkfTgGAiU3loYepXI+oTo3vI
 VR0sK21FYoyc3w/Evzu7bq3XvNGLexHQre84AO6+cz1wSWDQDYQgID9oI A==;
X-CSE-ConnectionGUID: bJTDKjYQRoaYpdf8r3AFDw==
X-CSE-MsgGUID: BnfchHVoTyOyKPy+1s3J8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36686068"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36686068"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 01:23:58 -0800
X-CSE-ConnectionGUID: HY3qip85T6qCov63NvfQyw==
X-CSE-MsgGUID: oO5Q2mqfTdiMGapnS+oD1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="103162212"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 01:23:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 01:23:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 01:23:58 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 01:23:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVpXRxn1etNozvxsKv3dx1cv/JeNSfZQSBVWdid8GphwO3/r3Uukbe53DZCk6sUzXL/SSvjty4afjfom5y3n/lMzHY2btEgBRKV8iTgd5PJ4Ov0Rm9F12HV0R4zzVTvng148UXq/0wkVij00wszWMqOoL1M0QvKsvN4G/t1RUU51yTwJAIYKOntfWTHUrVCsjIfp8N8GXB8DufwsQlRVmxdpcuxc9I+tb/1G1HaEKzf/lugOvThtG2Hhjc36wWwInfCP77F5elUxEwpS58guRD1Jl1X73nDoZHfGiEEzHyaH3r1rk3ePNkWSgpMV6Hol0fbFsyl8SbHBUBis7UkSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQuh6pgL4DTBxIhuJHziHMGXRVhMFN0PA6CKs6eVjbg=;
 b=uagcgGz8PesqmSun0ncjZNKqXUj2e3BIm/fznvgOuNJ0XVlrQfqh8nkN2XwBS9Wm3uGfQCscyQp/n5ekTSi3juUHI2cWGOctNuPneW38awInN5YC/JoaJ0zhBrRqueqLF7iOcNWRMNGAydSF6WP03JPhynBhngl5rqmdmfK1POvHQ0GuhVusnshN6uVMB4MZAWwmClEi+gESfqIr+pFxNlr56iLb00tciCHCnQLlpD2fVc/TzyWyzurc4EMxvKqH52I4IAdK3yEfA1159j8HXOKHrdn27kASfV93mvtEqLLGnvqnc04nCHKT1OEIUqMKB8hbg4+dUelbfIBMGSYHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 09:23:55 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 09:23:55 +0000
Message-ID: <c2135329-715a-400d-a834-c8ca797cab6e@intel.com>
Date: Thu, 9 Jan 2025 10:23:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Fix GuC log/ct output via debugfs
To: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250107181017.2639339-1-julia.filipchuk@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20250107181017.2639339-1-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0346.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::33) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|MW4PR11MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: c9284a56-e6dc-493b-fd88-08dd308f5690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RndEa3ZUeWgraVZ0Qk53QStwTjNRTFdKeTRqV2t6NVRJcFI0U1Vra3F3NWNs?=
 =?utf-8?B?dmVpQkRzYjE2VEFmbTE1aWlueWQ2dGptOUwzOXVTaEtLSEE0TUpZU0xLRm05?=
 =?utf-8?B?dUJ6NCtvaC9pMU1DRWZraFFpeHRlSkNLVFZvVUFwbkNLRldNMlViTHFVZE9V?=
 =?utf-8?B?UkRBbjYrVHREMW5uWG9TNjdVcDhxMnM1SXNoMTJid0NwV0NIbmhTYzRoK0Yv?=
 =?utf-8?B?STlVOFp1b3JhTi84WFlhYnl6K0NXMDd3d2R4c3pNdTgzWkI0aUhSdEtSZnY1?=
 =?utf-8?B?dVdma1FieGs0L2NvM3hkaGZ6R29zSFJQZWN6ZW84OXM4T3NLTGgxVGxKZ1BR?=
 =?utf-8?B?RC9uOGc4OUZNS1RPL2ZjOXM1d1NKc0pFcHRkelVqRkJjaDN2NExKUDZqWi9N?=
 =?utf-8?B?eThFc3R0MFdsSlFGeVNhY1Z2eldrWWlCbUpPMk92VXZzMnROUEs4Q3IxTjJG?=
 =?utf-8?B?Y1BUTDBZc0xjalNPeU9UTUt3Nmw4a1A1YTh3b1hXbExYQjVLZDNPMjZJTDc1?=
 =?utf-8?B?dVoyWUh3YVBUWmJJRVlMVkJHVlpqb015VlFFYTBUb2NwL0l0ekxNeGpoUGVN?=
 =?utf-8?B?K0JsNWw5Zlg5K29MenF5dVpWTi9rWVVXeHdUTnRmV3Nrd0Y4RWdUUzZxVW1w?=
 =?utf-8?B?N1c1b0pqS2gxcWpIS2dmR3lFRlZBekVWOEpJQXNwRFF2Y3pBdWNDR0Z2ekpy?=
 =?utf-8?B?b0FPSHRuQ1pPcG5pUTBmT3J1ZlJIZzlHaVkxcWtnekM1N1ZLRnJnbXF2RnNy?=
 =?utf-8?B?eWYwRnk4SjF5VEI0ZXpET1dieXAzcWlrZGU1aW8reVowUzNvUXpNalcyOWQ5?=
 =?utf-8?B?QUE5RGFvNjRaL3lxSHlYR3BCa000Wm1kemZPZ0V6SWxFL1JjL29SdGU5SFNs?=
 =?utf-8?B?NGJ5VTlVdkFiZnE5VzVJM1dlbkVmaVBhN1JLUnFpVldZSmhzUzc3ZG9Celp2?=
 =?utf-8?B?NzZsRkY1NEpxRHNGN2Nhc3BPNTAwNFRyV2J0ZEdhU2xXaDBWTW1iUUJkYTdY?=
 =?utf-8?B?eEFsM1NZeXAxRDNyeEZORnNBTEk1ZlRiUThUOFBSVlBWTm5EcmJCdWxTMjlh?=
 =?utf-8?B?ZkozZ0tvN1VERW1zMGFtejc0WlhmZTBKY1lBc2ZBb3NDcDhIMWl3cllUTHFE?=
 =?utf-8?B?aGtpZFAzdm1QTXk3ZGJ6UjFyMkM4bEpLbVVXZjJNKzdjdnFzRkI5S3BMUjhi?=
 =?utf-8?B?VkhQTHF4ZHJ6a3IrMy9CMnMrUHlqakFBdG1qaDk0MU03VFIyS0dTaXhzd0xF?=
 =?utf-8?B?NGVXa2J0R21jeitDMVhZR2tHaGtEeUdmTDcwTXkra0NUcjJoM0xDeHlNN0RH?=
 =?utf-8?B?OFd2NDUyeXUyYUZwdmhHWTMxTFNHYWJ1Tkt5ZmxpTGpRQS9MQzhDY3Qxc0li?=
 =?utf-8?B?NmNRVlJYREM1K0xBK3JBbmpqSHpNallhcCs5QWtHeGs3ck9RaGdiODd4M2k5?=
 =?utf-8?B?eUQ4Q05XNHQvSkRqTlc1dlNkT2xXNkxoUU9JeWJReGNFQURWSHFHQkxXbm15?=
 =?utf-8?B?aXVkRGhiMmdKV3RNbXc5Q3hXSGF0TjJTL0FsNXF6bjJMNlViSHpNSHE2WFVy?=
 =?utf-8?B?WXRDQUljSUpyNU1CTk5qWVdVOUdYa1FMWGZ5ZzZ5QnZxMG5CNTJpT2VwcWgy?=
 =?utf-8?B?TFpqOHY4bG1JY01zZHRQWHptWWhqeml1OXorWjNDVm93OXhRdHpUclZTS2VV?=
 =?utf-8?B?YzZyTmJxczBUbHlGMWIwUlM0UmVVeERLZmlzTlpTUmIxZmtrNi9IaDNaemdk?=
 =?utf-8?B?bm5DU2FaQXZmMGhHTHFJNlhFUmlibXhkd2VxREI5ZnlwT0VaNmVLREp6aDNx?=
 =?utf-8?B?ektpcldPcForNElUV1ZUYkFZMnZvSEtjOUhkQ3JxbmZjOXVaaThmNnduZlpk?=
 =?utf-8?Q?FhhiwlK9YCrUz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TktaVTJqM09TVURCZnFYZENtdW50QjUxeUlZR1o0QXgrOXk1UmVXaUVDZlBD?=
 =?utf-8?B?Zko3NGdxZjBYVE9mVmU2SUpITWRlR2ZaSG9qNUR5VVFXNDNCanRlbHBTam85?=
 =?utf-8?B?ZGlSb1B1RnpKMTFKS2ZrNGVqMDl1a1VRb1BNNC81dWRmT0hmWDFMRCt6aVFN?=
 =?utf-8?B?VFZQd2NJbTVZdkVOTG5kY1RXUmRpNGtCc3g5MVpiL2lCaEpXRTJOa2k1TlNC?=
 =?utf-8?B?Q25yWmhtRWxQVk45dzdGQUNneGY5ajlkcENIZDF3MlM4L0FFcFFHKzBPa1lV?=
 =?utf-8?B?WWNJb28rTmJtRjRRNmJoZnc0eVcyVEFSQkt6NjVUK3NCd000Y1NXSllMVnV5?=
 =?utf-8?B?dWY4SWVab2k3WlN4YjdsVGpmNjRqNG5uS3U4UHpxRFlWNjU5L0t1SHRGT25M?=
 =?utf-8?B?OGRsL0ZyMHRHR3NEUFFTSjBVN2RkQXVEais0ZC9FdGFobkxKcmpjZVhEQkp4?=
 =?utf-8?B?ZmtwNXpwRkpVdi9oTjZUYzlmYWdKbjdIb1loaFYyK2QvSWFKS1UvVWgzQjhP?=
 =?utf-8?B?NWtiTHhWWkRjNkF2bzZpd3lFWklOaEI3dWV4TVM2cnVnVmFlV2JmVk1mSTN6?=
 =?utf-8?B?d29zNGdxTmNXakNrdTBXTEU1NW5US09NV0JyUUVtRVYvU2NvY1FNNlBqY2pD?=
 =?utf-8?B?QUJCVUlET0RCMjk2UjZ3b3p4YlBQZnEzTkxsYk13eHA5eGxWYVhYcXltQlVn?=
 =?utf-8?B?UzBmS2FLUFdneUdiT0k5STFLamk1MHNMbWVnTEdtRFpxNG9BZDVHTDVyMDN5?=
 =?utf-8?B?OEY1SXVSaHhydk9qbzlrWGtIaTkyZzB3KzhLR3ZCb1QyTzNYTVFScHdHNkFr?=
 =?utf-8?B?dGlNd2FEeFlCTG9xdlZiMmExdjIvQUVaR3NLcGhPOEhPbUJFcmNOSDIwSDJM?=
 =?utf-8?B?MnZsc082STE3aXVUZm5GbHJWbDJ5R1ZLYUlFWTBLRVk3OTB2dkZtMVNNUGh1?=
 =?utf-8?B?RmszQS9IdExBSnBTRlBlMGltbVJYblBsU3lCWXlmOGE1cDc1d2EzbjRFU2ZX?=
 =?utf-8?B?cWtGdG0wd2NPdmJHbHNmZUZ4WURyK05PK0dsTStpb3dlak9NUm11bXc5MHQr?=
 =?utf-8?B?SU1XbFYwNGJxNy9BYmVzcU9mMWlwVmVydnBvRzB5VmpKOHhPOTcyb0JTL3ZY?=
 =?utf-8?B?M2E1NnBJWEN3NzFqOFVuQUhFNDlrVDlBVVBmNDZlakhlK3ZrQ3cwNkdDeVVk?=
 =?utf-8?B?bjBxLzFWRnZ4QTZ2bkg1NFNEV0FycndKV3F1UzFKa1lCYUoyOC9EN1JYcHkz?=
 =?utf-8?B?b05zVHAwZE9JTmJEdFRaUm9JcTJrRSt1VGc0VnNRUlppVjE0dytCVUZENVVq?=
 =?utf-8?B?ZXpkMEthOVE2Q05CTndNbkpYWlhZS0F5NUdQL2o4SGkvT0QzdjBhOGNtS29V?=
 =?utf-8?B?TFpONStyU1c0YXFCeFVrT3IyZlZYYmY3MVJtN1VyK0ZubTM5L0lUSGlleEhZ?=
 =?utf-8?B?Qm1XVGZ2Vi9Uc3ozT1ZFNURMcE9uNUpoYlkrMXR3WjVUOVNrVmkwcitqT0lY?=
 =?utf-8?B?bXEvTDFJT2NESW91VXh2SUpickVBaCtUdWVHSi9mVk52NUUrWGtoemwrZGxB?=
 =?utf-8?B?bDZ3SkJtWExXdlpXM0FPZ2hSbld3NUNWLzJGTmsrZmNyV3ViZU5OTzNpY3Vt?=
 =?utf-8?B?U1pFTktMVEF1YXQvMUxMWHdhQ0IxSnk1aWNzZ0laQkUyajdPUGlaa292VGxI?=
 =?utf-8?B?YzVOK1BsRmp6blVFSHBSRDFpN1hGcUxLTTJUcUtOUFZjVFhRZ2gzT2M5alJM?=
 =?utf-8?B?YS9WTi9zbXpUdE9aWkFlT0tCSUViTm0xVUlaY0x0MkhpYll0by9JSWw3Tnd6?=
 =?utf-8?B?VkQ5WWRYbDFWMUtZdElGSU9zL2JDK1lGZGF2MU54RW1KeTZvNEJJM01iNzBp?=
 =?utf-8?B?bDVsem9mSlNLSnMyUDRKZ012NnBRRmpDeTVzTEJuRFJ0YkxZbkxjNUM2RW1P?=
 =?utf-8?B?Tit3VVlOMGJIWE45LzF1bnZSUGNQNkdKc29EZ251Qk1yRjkzT1kxZjc1NUlx?=
 =?utf-8?B?dndrcnNkS0Nod1hpSENOOHlXRHhhQUdWdVlNQmdxUWg4RDQ3MUF0b00zcFR4?=
 =?utf-8?B?di9pOG9vS2NVTDQxZHVsdzlvTnBLZzh2OXpJS3NHNy8rVll4OTNiM1BEeFFs?=
 =?utf-8?B?VVlQWS9XVDQyN1Ivdi9jV04yVUhIMThzZGw4ZlVjT3YzNGNtSVd5YW0zekhD?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9284a56-e6dc-493b-fd88-08dd308f5690
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 09:23:54.9933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4KfzS13AUClKpb2oL0XEkJMqczCkW/3n/VHfOarg01XRKxRavrXUgtsY3I7rpqvoiJkWAjbl6J4PVUAwl7wKpvCzPWgWDZOTxSR950Emwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
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

On 7.01.2025 19:10, Julia Filipchuk wrote:

> Change to disable asci85 GuC logging only when output to devcoredump (was temporarily
> disabled for all code paths).
>
> v2: Ignore only for devcoredump case (not dmsg output). (feedback by Lucas)
>
> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

So for dmesg there will be a GuC Log.


> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
>   include/drm/drm_print.h             | 2 ++
>   2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 6980304c8903..8e5d1f9866a7 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct drm_printer *p, const char *prefix,
>   	 * Splitting blobs across multiple lines is not compatible with the mesa
>   	 * debug decoder tool. Note that even dropping the explicit '\n' below
>   	 * doesn't help because the GuC log is so big some underlying implementation
> -	 * still splits the lines at 512K characters. So just bail completely for
> -	 * the moment.
> +	 * still splits the lines at 512K characters.
> +	 *
> +	 * Only disable from devcoredump output.
>   	 */
> -	return;
> +	if (p->coredump)
> +		return;
>   
>   #define DMESG_MAX_LINE_LEN	800
>   #define MIN_SPACE		(ASCII85_BUFSZ + 2)		/* 85 + "\n\0" */
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index f77fe1531cf8..f5ea7f38ba09 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -182,6 +182,7 @@ struct drm_printer {
>   		unsigned int counter;
>   	} line;
>   	enum drm_debug_category category;
> +	bool coredump;
>   };
>   
>   void __drm_printfn_coredump(struct drm_printer *p, struct va_format *vaf);
> @@ -335,6 +336,7 @@ drm_coredump_printer(struct drm_print_iterator *iter)
>   		.printfn = __drm_printfn_coredump,
>   		.puts = __drm_puts_coredump,
>   		.arg = iter,
> +		.coredump = true,
>   	};
>   
>   	/* Set the internal offset of the iterator to zero */

LGTM,

Acked-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

Regards,

Maciej

