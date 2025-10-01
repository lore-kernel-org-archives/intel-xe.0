Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587BFCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 08:21:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACD510E33C;
	Wed,  1 Oct 2025 08:21:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsVH1v4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C5C10E33C
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759306886; x=1790842886;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/KP0SEv6magdDXrmA7KqBVxTO45A/M4jy02fulnFsQM=;
 b=DsVH1v4UiKwZtX2E3cvC92SCOr2MpRx2nGk+Q/1/lrQNxp96e2hXQaUf
 6vuKEefCFJOsnKNjDuWDRqjvrRh4ynsrjpYrXv1Xe5KAqs/JNl3idj1gr
 s6smQw2XECAv+WAFtJUGjK57p3m2+j/p7zwJyJCkB+UyduhQSOzs+48JL
 t4XT3ae6FIKHe3RxYX4DKHjey0u2oXtx3T2l63RIRk8kBGK29bYWA16Mz
 e/9OTdv8VCLk7uMMu0sMmkpbrmR4jR7kps/3vh+N4XPM+BG8kUsFrVWv/
 HTwyjjFtTGlqalGDqqMcIcMCbYItngfMfj/0Vjc83kEHujobsr2joKVee w==;
X-CSE-ConnectionGUID: EI5+lxuHTiu7K3u8dq2odQ==
X-CSE-MsgGUID: 1rSGdGRATp+5Tq/o4ZAVNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="72188342"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="72188342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:21:26 -0700
X-CSE-ConnectionGUID: fCDV/Q2cRheWvpYoiPZbRQ==
X-CSE-MsgGUID: w4n8B9XEQVuc4tXMMNDvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="183142799"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 01:21:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 01:21:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 01:21:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 01:21:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHJd5ljsNgDDByTyYOWGOn3iHDv7WCLSMQ7gYoafvV7NEfroPSDri4rWQiJIVPUip8FpffB5jup45UcN3HcDAvD/o7QUPeO8Xh++k5pRDBxw90EXFTGvu4Vym8tTxMIHvZUVbOTGjIgLcaqwJdJ1TB69C1r3evkG/g3K+EOkl6e+RmHBQ4BxZ7JD1gKmOUVzC0LnU2Or2ZUCsTuWV4gvp4PX2RnfZe+IXDNHkrHUURPpnQNTyxUtR++6GEMClOuZ3rfDfuXWv3F+Rc1ujHnum9HUwcwSQYDOzfq/w4jl0L09FG6QIJ4ZQwWVADpXhy99BNFSNbXUhj5RLPUoxGz3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IXnyZECvpcHLbBmqlQhKebjaLW9OsCsoMssxwS7waU=;
 b=eTBCwo8j0yemUlSYzBFhaRIopyYh9+lGYsq/RfGpxz2e2C7JaXDzGweKMAf8ring4Od9BrjS/xCOjOfTjzipqLVXsoho1rTZkQaAJKSBwY2EcbEvhk0y/fAFzaWb1IUrsDYH6C5FC5cP6GLoJEydqnkZU4rTRr9W8RQhg1IRxyALAzlP70Ts26EdG+rsGTXyFQPOFShrFeGShCeEtihvmZPbKa++eJxtVO+mRQJRFONbhiy6cTamy0jOVA6/H0fUabl34D6sR2UCQQf3dk2Yi0CMPNZAjV4E0gM1SkhF5QvO2yMyhMN2QNGTxf5qHzxozDceYkcPGXXZxkC5qzpZRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 08:21:23 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 08:21:23 +0000
Message-ID: <a22f0373-9d22-4315-b329-6021f8470da1@intel.com>
Date: Wed, 1 Oct 2025 10:21:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/xe/pf: Expose VF control operations over debugfs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-4-michal.wajdeczko@intel.com>
 <aNzYeJpKdi8+6iIb@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aNzYeJpKdi8+6iIb@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0032.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::21) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: a19f5e6f-b069-402c-ece5-08de00c381f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cStydDI3cEIxNmpxaU9mTENydHliV0MxZmJNQlQyTmUvM0ZzTVNnOHA1MW93?=
 =?utf-8?B?emdQYVFDMzlWc1VhT1h2aENjcFJtUzZLVU5UUndwQ1d3b0MrbUVpRmhiVTlN?=
 =?utf-8?B?TXl1dlBMQ1JLcUtpMlhHU3VqS3NDY2x0aE5yRXRzcDBLSytvL2dhYkVXVjVQ?=
 =?utf-8?B?bElsdWZMTEVKbDQ5Z2pqT2VFdWc5ZXIvcUM4VHQyVVdsMEY1Qytaa2xHWkxo?=
 =?utf-8?B?bmloRk8zK2txeXgxd3pBYTQ5Y08zL1h4SXc0QmtxYWhyMWYzaGx4YmFyWnZY?=
 =?utf-8?B?cmZyakFmcVdSNmZHOC9HUmhWRldXUzY1dWZUang4dmZBU2lwQVVVNml1VHRZ?=
 =?utf-8?B?M1YxdEhXL1Vrcm55azRMWFhNQkxva0UvUmxjT3FJeng1MmFENmxFVll2cTl4?=
 =?utf-8?B?RW8xMkNGTHdWcFlIdkgrQ003STFWQ2JZQXJxc1NvNVlycFJLeURZMFVHNFFY?=
 =?utf-8?B?TEV4TmR1VFFwc1dCaVZ0MGxtc2IwS1hadWc3NGpwY0FVQlNXb28yeGZQcnl6?=
 =?utf-8?B?QURabnp4U0VPU2VacWFBUnB4alpYdXFuaEU4M3J4bytXejlwdHpOMFhRUFJ1?=
 =?utf-8?B?amRsQnJUdDZhMGUyV0tCVnQ4UzhaNXR6UnRTakY2c2ZFQWZjbVY3SWlwbUVl?=
 =?utf-8?B?cFRnaHRLQ25sU1Q2NG96ZEZTMEpUSm1hc3NlS2xDNGZMakRxR25YSlFueW1m?=
 =?utf-8?B?alRTLzE4N1h2NG1KV3BuN3NwWHk0dDFSWlZpYUltaDd6cHNGcllhOUtWZGk1?=
 =?utf-8?B?Z1czR1JUUUhacUloVjZ0L21RRDRSdG94OW55K0FCcmpnOVNZU0luVUZlNkZm?=
 =?utf-8?B?ZmswYk1JaE1haVd6ZnMreHhteTFyUERFUnZMQkJySnBObW83UmF3Z1ZWeXFS?=
 =?utf-8?B?ZVlTWk53SFVPeDRPb1pNU1RHckhLQmE2NWMzR2RSRXcwcnNBbmd2RnZCN2xU?=
 =?utf-8?B?dFhuK1F6WEZzRVJITnBWZEhvcFlyVlhaanNHTjVPS25paG5ENElWTENrbTYv?=
 =?utf-8?B?S0ZJRHR4VWs5Yy9DOGEyM3ovUmRGUHB0MzZKZEIrUmQzekhmV0RxNHhPZHlB?=
 =?utf-8?B?VFRsQ0NGckhUeWV3OXJ6MUk0RER4ODM0R0NYMVBWWTJHNlNuOWVnYTRZaUlR?=
 =?utf-8?B?TVRGN1RBVkxkTUVJS0lFS0JaQThqWm9aVUZpdGg0ZlE3Mm5Wa1BVSkRyNENa?=
 =?utf-8?B?ZXlycVFPRzJKclNRVFArdTR5SHZMSlJhS0N4NElUd0hnZjB5YW9JTFJjQnBV?=
 =?utf-8?B?YVZNQ09DNXRUazg5M2xKcjJPeEZLOHErc0xZNU1UbmttR2hJMWE3NDJWc2Q2?=
 =?utf-8?B?S3ZIbVNqUnZRNTJ3d3N6UERST1dUNXhTSFpnaXBjWmhsMHprOGlkdkNqMXAz?=
 =?utf-8?B?WjgzdUQvblNScUtmWVNrWGZmRSs2cFdZVlI5TGpQYThGOEFHM01NU2VuRkdB?=
 =?utf-8?B?bXJyVExFemd1K2UzSHZWZ1M3QSs5VXo2bXFreHJxWTRkK3ZVRjJ4N3RhOGI3?=
 =?utf-8?B?UDg4bWxWRERINUc0YjQ3VmRQcE5UdDRLazJXUXQ1a1o5VU1hemgxZWpoWFRP?=
 =?utf-8?B?alc4QmswS2R3N3ZCNExqMkZraHlad21QTEdiRFNyU3lqSzcxVGhGdlF0UXZT?=
 =?utf-8?B?TldjaUtiVGpxVng5eTd2eFh5TjZFOU4rMEN5UU5ObytUa2RrSkpCVmt0NkQ4?=
 =?utf-8?B?THRKM3krK3ZYd29rRS9MZEc1OFBKMVMrZUpuYVhPQ3I2UG5QMG04SUlhV3Aw?=
 =?utf-8?B?NGxIODIwUWcwWGRNRm1oNVN0aVRpQ1dQcXdHMkdTVzU2RnR0R0JHdjVFQnVo?=
 =?utf-8?B?MkF2cCtHREptWUNZT1FBK2N2eFJDcTVEZ1FYWkRxMmlab2taSThKWEpGbm1F?=
 =?utf-8?B?MThEaFdyY0RuMitXQ1JxQmF5Z1oxWm51bTF5T1UwNjZLZ292RkdxcDZJMlpI?=
 =?utf-8?Q?/BqGPRt2QV/GYEB9Ib7W94/Xq6I8EAgV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1pNaXN5Vk9DZE5aZE1oS2VHUXZYdnhFVU1OSUxFVndkcmxlV29zVGgvdGhF?=
 =?utf-8?B?ZjlHZWxwdGF2eWxrSmJnRUtCMHQwelUvc0pmblAvQWMyZXk2eTRYZzk2ZU5u?=
 =?utf-8?B?NndlTzJXS0JOQUQyZVNtdWlNY0gwa1FoaXBuU25YK0Z2RmpXMFRLY1pQY3FS?=
 =?utf-8?B?TCtqSmp4aTl3dFlqVkFna1RkVVN1VVNyWTQvdzJBZmFyajhBbTc0dHlSVWFh?=
 =?utf-8?B?UmdkZnpuVHNZN0VOTjZDbXNaYjJXcWkrOEQ4aWNQTnRDK0dxUS9Canh3eXc4?=
 =?utf-8?B?Z1E4REVtQjNiRXhWSkQ0Zm55NmhiS2dlR2Z1NXR4VjdCNS9DNEZ3ak56Yisx?=
 =?utf-8?B?N1Viem5Kd1VtdVdGL0x3ZitMamxYYkZXbmM2eEkxMlNJK1ExendRR2s2d0px?=
 =?utf-8?B?Nng3LzdSdzQwS25EUGZCR01qY21NTzJ6T1oyUHpuQXZ6M09TNEkzMnhqL3dw?=
 =?utf-8?B?a1AwRnYwcnRYclVHVnA3bTB6M054dTFYQVJXREVEUmNuL2hoaTVIT3ZmSWpB?=
 =?utf-8?B?N2IweUJyWXBvMEZBZUN1UnR4b0l4dDFvamRYYUV1M3pOU0FTU0R3b0poYzVN?=
 =?utf-8?B?M3dyOXBraGU2Z29yQUl0bGZHZ2ZQU3lCTVpoRHdlU0wrclh2cGJwNlk1amZp?=
 =?utf-8?B?clllUUdHZE1SNHdEQ3g4TW1xdkx3NUhubXNOMHQwc3hHdCszbXl1WmR6L0xO?=
 =?utf-8?B?Z0N2L0w4TE9pNU9vNUxYL0x0SXBoaFFnWFc2OXNkVlJ4NDQxbjZsOEJuUVVC?=
 =?utf-8?B?L3hWNHRIYWd0SXBrdFB6aTcxZ1E0V2VTT2dGS3NjZVJpWi8rQWFHdlU5N3VN?=
 =?utf-8?B?OXBkWGYzYlJBWkRaeUVGUmZNTlVGOEtQQTYzQ0VxUFpCMS9YTkQxKzQ2SWts?=
 =?utf-8?B?aWZsRURtR29rbGtJODJqOVc5L21NVnl6TmRqZnVvK0phS0hVWFNyVExlMW1C?=
 =?utf-8?B?Ry9BaWMxWHg5dmp1NXJPZW01dTQ2UW1yZTJnR2VRNm93aW83aUtRNHFRdzFC?=
 =?utf-8?B?NVpLRWZmaEVOcnR2SmdSbFlUeWVhVjJHemp1K01pOW1yVm1DTHozRWg0Nmxp?=
 =?utf-8?B?NW9CL25GbWE0WDBic2ZCS3IzRW42MTIveWNmSzd4YXBhaGRhMDhaYjhVVDZ4?=
 =?utf-8?B?Y0JLUkExeWNBeTcwYkNDMjE1ZHppZ2tZby9tR1pFd3VvOVVId0lXQ0IzaTRn?=
 =?utf-8?B?NFJXYVVMekFZZjZ0c2FDZFVRT3NzQmxiU3dRZ0dwYnBKSE1COEtxZTdSYThG?=
 =?utf-8?B?NjM4TE5ZUnh4V2xqTzcvOVdSN0wxdDN0ZjJmbnNER0Zyd0lQR0FsQVBjYVp5?=
 =?utf-8?B?ZFFIUStMeG9yazVyZTZZRVU0NXVVSXNxc095NWprbDNVRFBaNGl1bXlWUjla?=
 =?utf-8?B?Vk1ZbWtFNGlyc3VSOVNDVlRRbFZ0b2E1R1dKUHVVWnJ5TFRtUzhzZklTakt0?=
 =?utf-8?B?YjdENGF5ZWNyVzNraFVGRm45MGp4eTYyTyt3RUM3dmR6R1dQZEFneDVSclIy?=
 =?utf-8?B?ajJGMVJtMmlxYWxRdCtUV1YwbkdOM0toS0hoeTZsdHZOcXRZcnZ1NHNibFVC?=
 =?utf-8?B?RmRSSzJ6RGMxZEJLRW9uZk50WWRwbmZLNU5SL2hUcUlZenladjA3dEVWNkcv?=
 =?utf-8?B?ckw5K0h0d3FQL05pVWM0V2NzRjAzRk9jalIxZ3VXa1JkWW81YkZ5R2RUNHhX?=
 =?utf-8?B?ZjRhQ0ZqSkx0TzNwOVVHNzR6QmNWSjBDY3ZjdTFQZHR2ZW1mREZPcExXUFYy?=
 =?utf-8?B?RytEaTYvWkhUbCtwcmcwNzhhUUVsN1Z0UU5CSDRDVkdvZVh6WlFmS3VyeGpu?=
 =?utf-8?B?NlB4cmlqTmppRGtoRFNuVnJiTXZHRldWaEZCeDUvT2dpemhYeEIvK21WTSs1?=
 =?utf-8?B?YjMrazJIMDBvWWdEem1TK3BhM2FCTkt6TVVkZVpvMEYrNER4THlVaS9IdG9w?=
 =?utf-8?B?eURkYTQ4TmZYSFZQRHpURFpjRnByNzVhSVU4N1N1UHpuWHAyUWJoY0tjSmpR?=
 =?utf-8?B?cFJwMWx6WW10Nm4vOWpSem50ZVFvcGZGWmo5azJNVXJjZzUxc2dLTnBNbXMw?=
 =?utf-8?B?TjE3aVJWYXZXeTZnTGxRS1p5NktEcmlONnc5TnpVNnlEbE5GdzJBR204NVk4?=
 =?utf-8?B?TGlVU3pHdnIyTittcW5DeXpMOWVQSFAxbElKVExkeTZHQTh6WnIyRStmVWRh?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a19f5e6f-b069-402c-ece5-08de00c381f3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 08:21:23.4402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fEQffInoZ0HNUzizm9mxHDV1u2JehxRdunsQs2TczwUEvupnOw53/VN/WHTKV8vjgfT7IgV+xhgED/3jFv5Hlo3DYUJ+B/+I44REMVjPlPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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



On 10/1/2025 9:30 AM, Matthew Brost wrote:
> On Wed, Oct 01, 2025 at 01:35:21AM +0200, Michal Wajdeczko wrote:
>> To allow the user to control the activity of individual VFs,
>> expose basic VF control operations (pause, resume, stop, reset)
>> over the debugfs as write-only files:
>>
> 
> What is the reasoning for adding these? Once we have VFIO driver will
> these ever be used? Are there posted IGTs which use these?

direct exposure of the VF PAUSE/RESUME/STOP operations to the user is
a part of the VF adverse events handling, where after triggering uevent
(this is also WIP) the admin should be able to temporary silence the VF
which does not meet thresholds

and the long term goal is to expose all these operations mainly over
sysfs, but for early hardening, it's added to debugfs first

the IGT(s) to exercise that new attributes will follow, but probably
after adding full state tracking of the VF (similar to what was done
on GT-level) to protect against unsupported flows (like trying to
pause already stopped VF) without triggering GuC errors
