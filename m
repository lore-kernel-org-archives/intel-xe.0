Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388FFF8E49E
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 01:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCF410E1D3;
	Fri, 17 Apr 2026 01:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ELiMBRzi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF99110E1D3
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Apr 2026 01:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776391064; x=1807927064;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jw30AeboPkW+h7zevxzphXpvXL8B2+Lbcf8B4INU46M=;
 b=ELiMBRziEPCMFPSBld9MwSmClhite5weWqY+EDjoXmUn9ylZ0XxVZHJH
 gvOqrVaaf0XPCaBZifip18eiOsfKkwes/qMog64SrtlibzUe+BnwbQZ+f
 xQDuyXYae+yI6ixsQPYd1MzJzo74IULqWNN9SC01I+UblxI9Ch5XPgf0x
 4+p4auj+zcXAD6ka3r2KaYyDJ74IR4HE2zi1FoyL8Dcss2Vp9BOutTFXV
 OkCrnsgf2w2a35Ulonp/Gdkfh8GdxHkCb2lrTCwXPxnlFmzFLdxU2HABm
 f55turapDabM/PqfuduaniMpAUQY+j5pKuY8FqQqUfOp9SAfGCnoTZDcM w==;
X-CSE-ConnectionGUID: HeKlsB3tQFuWPwTMJ0ULYA==
X-CSE-MsgGUID: JiuBwWCHSDqVN8G8Up7w4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="76435922"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="76435922"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 18:57:44 -0700
X-CSE-ConnectionGUID: IKaOlIg8SM6HX8XnNfdDYg==
X-CSE-MsgGUID: TMW8t5dTSDaRssOpWIcjTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="224388814"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 18:57:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 18:57:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 18:57:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 18:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U93ajdOTVktof36cnNM4OrwkBZV3BrIvH1VimeItzX8mVNXkwcnV2aQSJgKxWhYJ3x4Al+DCUI9y7fHTF26z7nzOm63Ut33eDQsuUFjKaYdZxQhYcbfTXItv/J5olfxZYKnEBIc111LVmqgwKGfytlm6r/u3W2+s3/Gv+nevdNm9p4Yo4+HCabHoZqmudKTq7OUQ6YcZ39koeSJuXHe2mT2qPU4Q4vGTMjTemgCV5aOM/PWSNjxvR9TP0bc4ZArkoOe4IcY8ElTb9mXMmGeXEjV8Nir/ZHqVyQe5sAqmoyZ7R6N+YUDAPhwIfJ51zKGvPq2hnM6+eKwLKK7IU0ltrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxgn6t/drvC75Nc+PxAUkoQLRe1xIZkOd8WqqNzGxrA=;
 b=OnOFvdsKeX1Xb5uYO+6ti7BH2AArIC2yFBpC88lInLS+I22QMe/m2DoZaoYLP01ycNtYvbkZqGXlnKFrFi/0rtb3WpmEPqFUVZ0LYWyJJwVXJcwxEk3DIrLLs5Iy2yafQCUm5ePDxiBfqozjtq0LjLXinY6aLWRH34C6UJK+2S3hsLmz0wGQx18hiKgJdX4vQCiQPBiYQbvqcTmvL5VMfeHB33GoTSHt1s1ChSwvrRx5GQ0eqO4dDmrsG3rpSVj0gH50cDJ+16BH6nqrAi2oSelTkRn9M/JplPAQ2mK1e+yK865gfUzRSknoVJM+63S00uN1nr9RfsVRgJ/iuVRhUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 by MN6PR11MB8194.namprd11.prod.outlook.com (2603:10b6:208:477::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 01:57:38 +0000
Received: from PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc]) by PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc%4]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 01:57:38 +0000
Message-ID: <507647b9-d3e8-4e35-8c7e-c6486f31d338@intel.com>
Date: Thu, 16 Apr 2026 18:57:36 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/pat?=
 =?UTF-8?Q?=3A_Type_cleanup_and_invalid_index_hardening?=
To: <intel-xe@lists.freedesktop.org>
References: <20260416045526.536497-1-x.wang@intel.com>
 <177633179823.468249.10860743612396239124@a3b018990fe9>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <177633179823.468249.10860743612396239124@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::33) To PH7PR11MB8033.namprd11.prod.outlook.com
 (2603:10b6:510:246::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8033:EE_|MN6PR11MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6d9f0a-fa2b-42e8-0b8e-08de9c24b385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|366016|376014|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: j/Ow/ToxI+qfxs5b7xViLbK+Qe6ctTrdCavMKp4fvCcX3Gl6KUFncBaggjZ6UbggngcGn6g/EvYb4Mfe/geSlwxcr1ef7wpatwa5yzy4cXhgunt2L+XHWAJm/ZEzRyfCRLcb4DJh7jWnXXkIs9nRHK0fGIUQnGsiaHyLqPADw3OQIwjDU5si35gfoAwvzYC7FsrEQJV6Nw/coYIDqj/noYjm8YrL2wnhJrKK1NZc63MPmAjwAbEZxTTzWjRakhnMYoz9NiOoSjUPy+b19LcgHgv//E0iz1bFkyoO14/yVfblPFm0go6YzbVeTl5aWgzxzdDqmCufIT0A5NrZWs8qtQgDjm6dQw9iImxaqKfZnlZTRhSLgWupBRv1jfB9Cf6RripbJh7LbWBU6G/poLM2vYp7uW5NT4OaGwbTL6AIvj204jHKUpKXT2ARX2idUzieDTlnKC9oaa39HdvYK+neXD48dVEJ9LuxzgjnVg1Xn6oJHm35lXd0v6skawU2Ye9gyvaSRCvxLXIAgQSMW8wNqF3oHW35po0WERHGPU+ozXjEPzrZfVJ13KQgZLOGmFc+Yp/jB9WsHeKIkRGLj5flAl7DgJnjMqO2/FtjDpqRW/C3+vAA859tJFQK8wTVreyWjyca7iBiSlen0450KBdiCuXHrY5iami3Q39DLo/+fnds57XOOL82pvbWonrMjUX7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8033.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(13003099007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmlXVEZJTi82bElqM3hXSzZSWkZhVWE5Y0JrZTl6dmZIUTNtdWxLeXJ0NUVy?=
 =?utf-8?B?d1NjVXQ0bm5UdTJ4QSsxZ2Q0Z3JDZy9Sc3NpUGM0TjdvYmdTdHdoS3pBaTh3?=
 =?utf-8?B?RXhnekx4bFZJdHhRcXVLcWtHR3dTRnZRV25DRnZBeEdpRG9jODlTcWZqVVAr?=
 =?utf-8?B?dUFFMkhUSmZxM3lwREwzaFhFSFdUSjl3Z1ZzWXZ0TG9IVnJUcGlzRlA3WHJT?=
 =?utf-8?B?d3FiVnNLRFB1K3lXNVVPRlhOdHE2OUhDaGc2YWpOaFk1SCtreDRkbVJnMlhU?=
 =?utf-8?B?Tk1ZVTJTRHRjWHlvaUZlWXJKZ0JIUlo0TjNVQXJTTTNCNlNTeXMrMFZvY1RO?=
 =?utf-8?B?ekowUUp1aUhJVngvN3NLVGpCWC95VzlFeEU1L1UwaW9TNW0rRXNKOFZLNGY4?=
 =?utf-8?B?ZllXZURpSWtGekszajAzMzllS3ZvVEtUSWYvYWVTeVlGVEtCMXQ2aGtKakJt?=
 =?utf-8?B?eUtTamJCcU91M1BEanhtTzdtbXF4UTVVVkc0eDNpaUV5aWN6cGVwSXJpOVZZ?=
 =?utf-8?B?K0JjVmN2UUhEMjFjVE9kd3BlRWFXYnczSDBScFduVzlaaVY2Y0RUdExQN2FJ?=
 =?utf-8?B?NXZjN2xmTkJIcll2eDJpL0tuVnR4YUY3L2FMa2l6YUFnZW5tRzFUZGxZMVVa?=
 =?utf-8?B?WjBxZWhsNDJDTDdSMTY1My8xbUdaU0Jjc005YVg0WVREVzZQV1diRDdrQjFm?=
 =?utf-8?B?OTVSb2ttYVBGblQ2ZDBnV0tzREtFZWc2OExqWUx5LzJhV2syenl6VkFyVXBm?=
 =?utf-8?B?WXJQOHViZXlveUtVdkVHSTdpdTJKZWtkeTgrdExwTnZWdnhrcVRDaU1sQlo0?=
 =?utf-8?B?eHpoZmFtbFBaT2RTZU5BNFFzYnVkMU1LZXZQb0ZUZW1wVEd0b3VRZHdINmkw?=
 =?utf-8?B?OC9UQklCNnVhMjhuc0hDR1hPWXIxR0tSZWZJMHZnVDR4Rlk1a3N2MTJrcDVJ?=
 =?utf-8?B?cDZnZkQ0d3prdi9vSW16Z0tON0o4NEZPNVd2Mnd2SElDZzY2REpPa2crbTF5?=
 =?utf-8?B?SWNFM3ZIa01qZEtydzJHMnd3WU9DZmFXL1h3YlZqa2V5ZWNnNjdSTyt3RFRL?=
 =?utf-8?B?bTdJaWp3dnRiemhleVk1cTZqOWpMTTYzMzdqak9PbnEzbWZ1Rkl2YzJYNnYz?=
 =?utf-8?B?ZnN1U0toZTI1aUF6T3FycURaeW5JOGFUVEZaVmdPNWVXUFdyd1dhMkp1bGRH?=
 =?utf-8?B?ejVwRTQ4anN1RFJrS1FxaW5oL0hpWnRxM2NLcGdFc1NLUVF1LzRZcTdkWEFD?=
 =?utf-8?B?N25kUDhkWEFRSmZURDZJWnYwck1aQS81c3B0ZUlMeHd1NGdBbHdEbFp5NFFa?=
 =?utf-8?B?Qmx5Z1dRRU1pM2pveHV6Rmdya0pNdzhPWmU3SzFwOEJNUnZpelN1aDgyVHIy?=
 =?utf-8?B?L0FqcEw3L1JZdVRSQy9CM25tOFBOcy9WUlErVHVCdEdxVDNXY3pybVNZZzZ6?=
 =?utf-8?B?TUhLVFg3Ry9lSGdDRUYwMHJuVDJ3dVJubmxVamg0WGJMWEJzNHU0TkZ5YWJy?=
 =?utf-8?B?NEFxd3JMQm5kNndrTVRhWjZ6K2NQTDFIajRmR3NEZW5PeDBaWTNzdTZlZGJ4?=
 =?utf-8?B?TnpEeDBaQTVjUVp6elVsbmtLK21lS0hLdXlHUHY3aXhPbzZ2blcvdFNKN2JQ?=
 =?utf-8?B?anB5Rkw0OU53eGpTOVg2TmFxQ2EvaHFaaE9maDluTGJwb3ppVmdZekZwNzVQ?=
 =?utf-8?B?TGthT2RCNGhzU3lnbDBEMnFEWkM2VVU4cU1Tb1NscCtROXZIODc0S2FNc2hO?=
 =?utf-8?B?aldaejFBM0xtVkxucUVJK0l3STdNMTVMYnNEbnZGdC91UFl5dmU2Y3IxOVZY?=
 =?utf-8?B?S0lRT1R4ZDg0UlA0aTl2MkxWSG92RHI4VjZFZGg2OTQ4TFZDTkdPU0wvTkQ4?=
 =?utf-8?B?Qy94WTNhT010UEtrRStPU2VNZldoT3VXRjZNYnNsUk1Sd1EvV0ZpbWNtMkVK?=
 =?utf-8?B?eVZ0MVRacWoraWNOd2E4ZHo1VE4vMlRUZnBiMDlMYlFrdTF5aHVBa1BMS1pP?=
 =?utf-8?B?czA1bWVuVVJrYTNiYjVncDh6OHZLaStjMjM5RXl1S1ZYcEo1Qlc3aDMvOXVp?=
 =?utf-8?B?RVBTS0VvU1pqV0hzWW41RzBFb3ZKY1NlbFRSdUtPcGk0cXNZQVdkK1I1c09x?=
 =?utf-8?B?ZlhUWmhRT2syaWJxL0tFWHBnQXlHRnNxcXF5TFlBMkdQMExzNWhsUUM4OWhq?=
 =?utf-8?B?Zk53am9nTDR4VmtDbFZMSUREaUEwWVJvbi81VFRqSk8xd3ZhcUhwdm9ZZk55?=
 =?utf-8?B?MnRGMk5YanRPM1FydEc5ZjRFTHY0c29JS2wrVzZrY3I5bmlkYjM3Z0Faamhj?=
 =?utf-8?B?Yms0NHR5SVptdklvZmxUdEdvc1h5UXBEWDFFZm9nYXFKRGxqbUJkUT09?=
X-Exchange-RoutingPolicyChecked: v3vpTF6VQxTXc6aOadtrgKPcQA3qqBGLTVMNfVXP9ss8hGwqQDYOFwmhNmPmtctPTXNT71bQan7e8PX5VFTfzFKK+v+nLHdU6KZRyH3fw9ac9s66UpnuAwNKFMBk6FL/WaAYsQctKNd1fKfnEX8oqdcdlLMH4p0PzCGGAZvGb/3Ls8bLzA3U3DaStU1FMdZ1fD876g3taqRxvIa4wKLuxpypkoajKxB+SsIzr4mLbTxgPYC/b3LroNr9056dzeAUAy1yIcNAGOQcTQuP0AODZz7czgUmAw7mnmJOAbnq9zDrbk9SRNyY+b7nWENYs4bqISbH9NmeOTiy1wr1FgbDEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6d9f0a-fa2b-42e8-0b8e-08de9c24b385
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 01:57:37.9917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAobKGEhvM+QIXgd0vpJWKYLGFkEikY+0ijUGamNgtFJbG9ZYtplGt4NJGAi6wTbH/QUiazqpbiJtN5I3lOU6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8194
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



On 4/16/2026 02:29, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/pat: Type cleanup and invalid index hardening
> *URL:* 	https://patchwork.freedesktop.org/series/164971/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/index.html
>
>
>   CI Bug Log - changes from
>   xe-4909-137513b61b4f187957d0c0f44c63c8549893f970_FULL ->
>   xe-pw-164971v1_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-164971v1_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-164971v1_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-164971v1_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         +1 other test fail
>
This failure is not related to my patch

Thanks
Xin
>
>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-164971v1_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#7084
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084>) +1
>         other test incomplete
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#7571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#4459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>         (Intel XE#6321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
>
>
>         Warnings
>
>   * igt@kms_hdr@brightness-with-hdr:
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4909-137513b61b4f187957d0c0f44c63c8549893f970/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164971v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>
>
>     Build changes
>
>   * Linux: xe-4909-137513b61b4f187957d0c0f44c63c8549893f970 ->
>     xe-pw-164971v1
>
> IGT_8861: 63a08403d58b652dcab80da02d6078386da78c17 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4909-137513b61b4f187957d0c0f44c63c8549893f970: 
> 137513b61b4f187957d0c0f44c63c8549893f970
> xe-pw-164971v1: 164971v1
>

