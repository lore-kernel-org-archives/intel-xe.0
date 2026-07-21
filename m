Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBDBC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 16:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4816210E030;
	Tue, 21 Jul 2026 16:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTzJ5OmZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25F510E030
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784651394; x=1816187394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hcskrszLIpAJGBgUN/LoDYipUMd9M3VYoBW5F+CundA=;
 b=hTzJ5OmZSBBTCq7TKzHVj4s519aMDX9/58Tgfe1q5Z36z3kaYLhssWP2
 sXZ5T4NAOSUiQ4SL5gv3JR8ioYyYVeTFGvJuMXXU2PUQBG4D2BdE+jvv8
 nwmY9g9Msx9tnWEOXACM5V/ZA3dyevH72Z6es9mxf1iGeeSi5sluJWj0M
 sGiWN2NrQNe/4AaaphT6zk9xf5dteivyRpcU8zuWDWOqIsexi5RZjxozd
 FKMSKiw6Lt3DpWjZAuIGFS9v8Coxw5NpVKByoyI6Pl7T4X5By1gI/yHpp
 ECa6uXhR1uHNOekKdN+bASxDo9pf404NovF1be1bNQq1QQRFrV4yAeYkZ A==;
X-CSE-ConnectionGUID: R9wS0fr3RCCh9DZsbUYFKw==
X-CSE-MsgGUID: KCptC+KPRzejhqVsHk4dEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85203743"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85203743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:29:53 -0700
X-CSE-ConnectionGUID: xzBoSkfLSDSQtdKKlwMIcg==
X-CSE-MsgGUID: 9RXu3Ba8TRWGaOri5UPp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262094112"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:29:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 09:29:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 09:29:53 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 09:29:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+PXQv6JINaF0dfvyKJF68S6tEFbNSxz+pTlg8D31rUiG6RASgVldBmkbhf4ejq/9uA2BGtMmnMtdd2gVUlnV2O6MtrYjR67QWtgdjPKhXdhpV6/2Knjc8aj4KNOLFrasfH5Ty1ySTqpaW+DIKgb9eUwjoe71A7i2MZyd6NfFEUZSqdYmwbRf+IT/Z6qYQ6ZI1I9sQZhgNrh6hZl1YB9tqhRShzTVhzhMpKPmdSAoD4Bnt5BDtbi0/wdytKsJvBwzv37NS3Erk+FJuBmtIS8wDHQKPTNLA7gvVfZf5EAy18WPqpmVo3CjeBp+mwC5lJHqzS8Rf6E1oDNPKYh6B69bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUSnboq2DODYhoy9p38kEwYupRPe0YrZwWhmjDSAX1s=;
 b=xRUvIuf+VW8IyjaXN0l0uK8idfEpH1A81gd8g0RsH082PmVzsOVWg2rbM/qkUJeQMuEjdr+3ocm5D/r0Zi9DRsucS6PXLZYZFLqT99fIr3yYna7+kc2d1v1sZUpGQwcCdADhwPvfrGnYlGgUaYj1SocW5eg0pX4EpiVjaO2sHcN1TGneZYzLHESr9gdySB60ukFRZh99zrT6uuRMoi89CDmioaicBplW9+dtn9DOMV8hNFH181v2/jMfJC/1FQOdZzzJGj5BJs8p6B2NoHi0P0Zn/5brlJXq36kP1GKuYLuu85uam5FTh9+tXKFyBPLfa6E+bmbijpl5A9lujUwQtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH0PR11MB9750.namprd11.prod.outlook.com (2603:10b6:510:397::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 16:29:50 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 16:29:50 +0000
Message-ID: <37a77d86-16eb-4319-a4c7-7e448d6c7d9e@intel.com>
Date: Tue, 21 Jul 2026 09:29:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
References: <20260716155114.1427366-1-zhanjun.dong@intel.com>
 <20260716155114.1427366-3-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260716155114.1427366-3-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0268.namprd04.prod.outlook.com
 (2603:10b6:303:88::33) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH0PR11MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b01bd9a-fe2e-4ff0-65d2-08dee7454913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|3023799007|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bnnwhq2VhP3uWNR9M2MOrXCH+hc/gbeVi2kaYlsiffi+ND9Xeejg7w5glzon4zWKJXR7zbl2cZhM5QXiqizZVuem1tihqcuaH5eJjbachXBMVjb2G+K2E4OiM+kdZ0OUHph64hYiSHAaYQTZzso23H8PS0XZbi0N6PLhsJikkuOHlXDQeUqZZs/89J0D36UtjSedlfntrJ/mq2AKyjA/vUHMl0sxkzi03z4+MwWMUEN9iAlHc7ZRuTj4noMgce3oq2Y38vsOaLVwFqJVaNaNVZlp4cMrIOVVbsa0kP7Qo+j3zB3emBRbEYbMdar3LLR0kGVKkdQFn6C2FSaIGw7EOevOQA2ZHis0uGUK5xtu0U29ACbKaSvpFgk0PAPHpwnWpseOO1eFHRkRpGlw9w16xue8C7/Z9iIbIKsLRVB3HEA2d6ImdpVwnkmRa5LTEIlhJA+pze64epgnbGNpH/w3uFBUzhWnImtqb2anfEEGJzf1kUg1bqkFK6pPosxna+vWT7FE8UUgtpPrrHODaRcNZleB/itNuti964qYrfJFZbJWSKSD+s8ddYr5CBV21nfJCOfJDY6B3i4DgZwfxeIXzgn54BpcYdW68bOTTQnjq1ZuBNxesbxfts5KO3Tefg//REJBlS/rxYz7iMh3NdV1l7VwDxvS0G8/f78ZkFEIwIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2dhc2dkZ3RXN1JMTFI5OGJQZFJjdU11K0xkVTdmVTkzQ2lmRmpoTVdZcmY2?=
 =?utf-8?B?QUlBN21CbkNHZU1ldGJXWmUvanpseVhrTUJvc2kzL25uSVEvMnc2NVM2cnht?=
 =?utf-8?B?anhIcTcwMEtIckRieXN1bnlCWlE5MVR3UjRta0FjRGp0TUFlbkUyN01rYlZq?=
 =?utf-8?B?a3VSdStoY0xyUVFvV0F2Q2N1WnhqMXNoOVh5cHU2MjQ4d0dTajcxRDBneTRD?=
 =?utf-8?B?U3dOdU9KS1dweEY2MmlvVm9zclV2Tkl2V0REVzIwenBaMHMvK0IrWUVTMXhG?=
 =?utf-8?B?RlpwYXg4Z1JleEc1eVZtOHQwaUttMXBHYnlqdmNLcjIvNFk5cVlscHJndzNY?=
 =?utf-8?B?MXNLY3A2MVlZalVrK045dFRxeDZucXhkSHlTWDdBVEVjalZMVkhpVGFJTTdO?=
 =?utf-8?B?Sy94SDZxUFYxdTdEYU9XOXZRZ2MrRGxEenovUDdYZG96YWxQYmRqZUU0aldC?=
 =?utf-8?B?UHRTNkZnakVmdUovSkhWUWdwSnN5RGtqZnMvMDdQL2ZNQjJLTS9OVjZpWUFB?=
 =?utf-8?B?d3o5RVNqWVB1K1MxSk16OFNTVUFnRlBPeUFjVUJ6eW9Ec0NlTjY4WWhUdG84?=
 =?utf-8?B?T09xQXhzZWxtWnZKaWNnYzhHTXluOTNUN08yY1ZZb0hzU1FsYTRNem1RWXM0?=
 =?utf-8?B?Qk5DUnpGN1QrMi9PMzRtWE9PQWlCRDBLZ3RaU0RsbmFnb2l5VXVvQ0tZbDNI?=
 =?utf-8?B?T25mYWNsMGlYa3JqTVhuVGdkMVkrMnhPbS9DOWxySkVPVTN0dnJBdmtBY0lC?=
 =?utf-8?B?UnJDSFMyRVJvMmo1dGxxMEkzcTNkc0FPNVQ2Q0M2T1I0dVZlUEhGazFKNzho?=
 =?utf-8?B?ZkVURTBSL1Q2UXpoVmM1b09qK0J2Q1J2ZHc5MzVkOXRiSGhWckFFeTJFTUFL?=
 =?utf-8?B?SjBrQVZqcFZFaDFleVZHN2swbjg5ZGRpZVNJVmJoVEQ0RGRJSzFXNjNVM21N?=
 =?utf-8?B?ZDA2SHpWSVk2WThIdGUveWtUZTlNbmg4eEdQS3FqVE9aaU5YQUFzNkdyLzhk?=
 =?utf-8?B?U2FWclZTSlc5TjVPOUZyS3N0Y2ZiYjhKYnFrT2hkVXl6TTllMUJmNC9vYVF3?=
 =?utf-8?B?dk9yOFplUmJtTk8rRWJWRGcxL2h2SFQ3ckliakJ6QitDbEhFYmt2SGhGbHlY?=
 =?utf-8?B?bVNJbXBlcEVPNFpWWHZDZGVVeWdtcUx3WGswNnFTY1RRWit0eGtJRmZvaWhM?=
 =?utf-8?B?V3F3MjdoVmMwWXJ4dVM0WTFMZHYxOXBCYXFKVG5CT1BYTVNnVXgyWU5nbXcw?=
 =?utf-8?B?RXpNcDA0SFJyTWU0SWFiK2F1eTc1bnFJdVJqWkVUZ3dsVVp4WnBlQUVMOVFl?=
 =?utf-8?B?MFo2elVSZGJPOXFQVXJoSk50SHZVNDlTY2llRXdDVjkzbGhyb2dQK1M1WmZJ?=
 =?utf-8?B?SFBrOGtYNVV4VnpIM25tNWM4czF3THAxNk5NL1Jjd0sxbXpEYlRHSkR2RE1T?=
 =?utf-8?B?RFRubmVGWDg2Skg4eWZCc2g1aFQweVAyUUFybWZaOUZqY0Y2V0tJbEYwNDl0?=
 =?utf-8?B?RlVtdUJWNndWOXVGOUVTMTNIbVVZZm9NRFdqaEJuUnRkSzF3RG9pekk2TnBq?=
 =?utf-8?B?anRXa1VmNXBjZldUOVFVSVR1Qi8xdk5ZSE1wWmZpcmo3eVNvakN0MkhtdTEr?=
 =?utf-8?B?RktlWGJ5NHJtUVR0UUVTRkl0Zkd2WnVPcDE4eFJwR2E1dlQ3ZU5Zc2xSK0I0?=
 =?utf-8?B?enlQRitqcUQxcWRrTDNyaXF4d0gxdU03anBvMFlJYUljUEN0U3VPbm9MbHpV?=
 =?utf-8?B?VkNIaEM3WHI3eGRUdmt5R2trcjEwMURud21VZ2NNYXpJa0VvaTBLSUtkb3Rv?=
 =?utf-8?B?dkFyVU1nUWgrK1pJMGtmaE1OUU9LcVFKYUJtb1ltRjlTWHpEaVFWbUhCZ3Uz?=
 =?utf-8?B?MFZkVHFKcldlMGpDdzB2TDJFSy9VWjZYNkhKUktuZWo3Mk8yVUY0Y09uTmcw?=
 =?utf-8?B?VWYrZ0U3RkFTZVdmZ0VMWEI2Z1dmblpDckN1WWovRW12S3BvaHBqaHpNdE56?=
 =?utf-8?B?UDdkWW45a1FUY1k1OVVWNytBRWxzK28rWXBFZXBiUmV5eVlzanBhb1NJTHJU?=
 =?utf-8?B?bysrcTc3TWJGWUtpdE1ZSmF3dmkvSzdJMmo5ZERGQi9zSmlCaFhjdmRQSGdu?=
 =?utf-8?B?cWZEc2duZDRhKzJCS29iV09HU01RWWtXd2FJbzcrdW4wekEzSTVDZlo1L0xq?=
 =?utf-8?B?cUVpR05IUFhURVdFM1JPMWV4QzdzY081WkVWSkFDT1ZUSjBqTkNUbzdXNnZM?=
 =?utf-8?B?YUxEWGtMOE0wUFd2QnRZOHFWOEhBQ3FJdEhTN1E1elp4Z2kwY2h0bWF6TzJl?=
 =?utf-8?B?NmdGQVpOZ0xwcG9jOVJUSWxSWVBQYURndU9PalNjZzVrdmhtTHVDRUpKTFZm?=
 =?utf-8?Q?95Yds9pcKTPwFZLQ=3D?=
X-Exchange-RoutingPolicyChecked: fZpLsUsjAGJPA7AyGobwtR8NQ2mt/0LVy6g75v6X8pznmNaL4OzfkNS/6cseJyTPuRpnDrEqjWaEGJ2ffku9Rj5aLJ7pUGSmqhHjtJR9umDIXPIQh4I0Kg6ru3Y+fKcHST8yQLPJqdEx3RFJDIfgqV/vnoeNXtKfgz/Cyunqy7ynTs8gNOvlDmB2G+jR2VZv8TW8AOu1f/WknrlsNVTMutpvMMgMv18MGK8JHFqeb5Uo+o9UhqfULHwEZwxQhhVBdZYCTFKPLQtsrh8M8MwCddhrSJnD4iAm/UtttyaQQ2ykWnbq+gRJUaP5tHQlgNJn24om9gnATtCf+6VTTab7Pg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b01bd9a-fe2e-4ff0-65d2-08dee7454913
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 16:29:50.0223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dVNbcjqFcBpwdHVcUame9hIuzARqtQDc5EpjZHaB7Pf9jv2k8Jw0jKLjZ/St3gWHmp2TwVMHtOdmH4a79ln+L+UuYpJtSGTF1WiM6ZIXXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9750
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

Patch looks generally good.

Please check deallocation in xe_guc_print_blob_compressed().

Please remove added build files.
>  kernel/build64-debug/Makefile             |   3 +
>  kernel/build64-debug/scripts/basic/fixdep | Bin 0 -> 16936 bytes



On 7/16/2026 8:51 AM, Dong, Zhanjun wrote:
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 538d4df0f7aa..d0325c4f7b86 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -225,16 +228,149 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  	return snapshot;
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
> +					 const char *length_label, const char *data_label,
> +					 void **chunks, int num_chunks,
> +					 size_t chunk_size, size_t total_size)
> +{
> +	zstd_parameters params;
> +	zstd_cstream *cstream;
> +	zstd_out_buffer outbuf;
> +	size_t wksp_size, dst_size;
> +	size_t remain, ret;
> +	void *wksp = NULL;
> +	char *dst = NULL;
> +	int i;
> +
> +	/*
> +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
> +	 * (windowLog=18, 256KB window). Passing the full total_size would
> +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
> +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
> +	 * workspace stays ~1.5MB, well within kmalloc limits.
> +	 */
> +	params = zstd_get_params(3, 0);
> +
> +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
> +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
> +	if (!wksp)
> +		goto err;
> +
> +	dst_size = zstd_compress_bound(total_size);
> +	dst = kvzalloc(dst_size, GFP_KERNEL);
> +	if (!dst)> +		goto err;
> +
> +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
> +	if (!cstream) {
> +		xe_gt_err(gt, "failed to init zstd cstream\n");
> +		goto err;
> +	}
> +
> +	outbuf.dst = dst;
> +	outbuf.size = dst_size;
> +	outbuf.pos = 0;
> +
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
> +
> +		while (inbuf.pos < inbuf.size) {
> +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
> +			if (ZSTD_isError(ret)) {
> +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> +					  ZSTD_getErrorName(ret));
> +				goto err;
> +			}
> +		}
> +		remain -= size;
> +	}
> +
> +	do {
> +		ret = zstd_end_stream(cstream, &outbuf);
> +		if (ZSTD_isError(ret)) {
> +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
> +				  ZSTD_getErrorName(ret));
> +			goto err;
> +		}
> +	} while (ret > 0 && outbuf.pos < outbuf.size);
> +
> +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> +		   length_label, total_size, outbuf.pos);
> +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));
> +	goto out;
> +
> +err:
> +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> +		   length_label, total_size);
> +out:
> +	kvfree(dst);> +	kvfree(wksp);

Possible free of unallocated pointer? I don't think kvfree checks for null.

Maybe add checks before free. Or implement full error unroll via gotos.

	if (dst)
		kvfree(dst);
	if (wksp)
		kvfree(wksp);

> +}
> +#endif
> +




>  /**
> - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> - * @snapshot: a snapshot of the GuC log
> - * @p: the printer object to output to
> + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
> + * @gt: GT structure for error reporting
> + * @p: drm_printer for output
> + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
> + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
> + * @chunks: array of pointers to source data chunks
> + * @num_chunks: number of elements in @chunks
> + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
> + * @total_size: total uncompressed byte count across all chunks
> + *
> + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
> + * zstd level-3 streaming compression and prints the result via @p using ascii85
> + * encoding. Otherwise, directly prints the uncompressed data.
> + * On failure the function returns without printing the data blob.
>   */
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
> +		       const char *length_label, const char *data_label,
> +		       void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size)
>  {
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
> +				     chunks, num_chunks, chunk_size, total_size);
> +#else
> +	/* Compression disabled, output uncompressed data directly */

Minor nit. Above comment line seems unneeded with funciton description already
covering the topic.
>  	size_t remain;
>  	int i;
>  
> +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
> +
> +	/*
> +	 * Print each chunk directly without merging into a single buffer.
> +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
> +	 * for all but the last chunk to omit the newline between chunks.
> +	 */
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		const char *prefix = i ? NULL : data_label;
> +		/* Add suffix only on the last chunk */
> +		char suffix = (remain == size) ? '\n' : 0;
> +
> +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
> +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
> +		remain -= size;
> +	}
> +#endif
> +}




> @@ -248,16 +384,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
>  
> -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
> -	remain = snapshot->size;
> -	for (i = 0; i < snapshot->num_chunks; i++) {
> -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> -		const char *prefix = i ? NULL : "[LOG].data";
> -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
> -
> -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
> -		remain -= size;
> -	}

Variable remain may now unused with this block removed.

> +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
> +			  snapshot->copy, snapshot->num_chunks,
> +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
>  }
>  
>  static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)




