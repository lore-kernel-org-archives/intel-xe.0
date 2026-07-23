Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43F8C531F9
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9476310E5C7;
	Thu, 23 Jul 2026 16:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zs/+pdZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E1710E5C0;
 Thu, 23 Jul 2026 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784823334; x=1816359334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aqH/4af5sdGZiTGofbgqItXHYpa6WbvKLGgfpreFjYI=;
 b=Zs/+pdZ51UbEnxrllx1FxkioMmTxUNWg+6jUhkVnzVD7bTWlMwLiKgBX
 GfCQnorkGJsvAWkVUuAWWd7TpYyJXYidTv90DeiSQhGn2GQ+y44V8+teR
 RyUZNOCg+42uI6Ns6zgktL1iVMpHEuDU3N93RhRt6q++IA3WJye/L1ZKy
 QNUZBXsAy/hWEMx1M+23EcIJ7jLYWF3jQ1zdULYs7Bchm+r+0NE2iFBKC
 pI2ysN46MN5NSuB+euPjvef6ISRMmBJgP4K1WS+z4FYJ76gd35lmxTmzh
 +u1MAUMRRh3+6zAbV1SoYoFYDa7yXgyXBfKU0w5jUjPQoduOJBJFQleNo A==;
X-CSE-ConnectionGUID: OpyLU2CuQyqheSHo3KoFbA==
X-CSE-MsgGUID: UgO8b8J8QKK1SNd4uEKW6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85601778"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="85601778"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:15:33 -0700
X-CSE-ConnectionGUID: Y1gZ+VRwQDmh8JupTgFjYA==
X-CSE-MsgGUID: FXKtlMqNSGOISXKZx2m2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="282960026"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:15:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:15:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 09:15:32 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 09:15:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrIjxkwBcx+uuMhF4KJGKx9lFMaOtfS/zg1qnBbLLWkxq7oz4ZsLfSIuzuQlwbe9/5j0iJ1wUvQ1RDOSkON/nRxT/4jv22cXQ4L5ES+MaJr1sQVnlDU5ueGLd0ge/IXahpR07f5qomdbRetM0SjnBB9j3uzDhT6SFnJSx1FwPe0zyCJDf5Tjb6ajZAEvcVl6MyiSIJYPEkxrm1/qbhX2kdN5CiFCEQRRq2H89gFJ7quTz5ruESzI/iFtGjbxbjUrG63WSaHX15eE0X7SG8gSuhc+mm5+5zlrQUqZyHUtAF6uAt4D5ISUE54GlRUBiuy3bx7hYztXXW5QeIKP437gag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4+c9AIhTX+Sl3M/CoVSsYpK5e9q+Hvk0uKLXwAWeuw=;
 b=y0LtirRS3kF1jHhUKaSFYfy9XR8XM8aumr9IgFOxCUZez25aT5V8QbpESeI0oFvdONnJIqXPcsIWMTEAu9YOYVcoXK3C39fooAK0MKZeNqdjNTdpEAFxNO0lPSC+t8KWeAh365fhlE4fHVNBSYIbRtjaQmML3opLt8RMxAy+AtvdinmnHt6T8uMuTNQl18fLrf9sWQwqBE2O38EKHzRbfZBKQyKrP9ttONQj571rT8Bxqot4BOddJ+0f70++9BCDesoG5RMen7uKxgojQuryycSQg1lTA3S7KOhr0tlmi4MEx3m+uo46DCScCnuqKJCoDyin45nMcap6T+bzVh0Mkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:15:29 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:15:29 +0000
Message-ID: <1a0e6afe-56fb-4fd9-b618-eedc2fb0167a@intel.com>
Date: Thu, 23 Jul 2026 21:45:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] drm/i915/vrr: Return from PSR2 compute config in
 case of CMRR enabled
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260722043923.3241977-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260722043923.3241977-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260722043923.3241977-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 97372ca5-1eb8-4c63-ca6d-08dee8d59cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: CvQ0/lpkr1xQ0gpwEnvNPnddPNfLMiMZvILpJYZurF6qLtMiAPACmbhJQBJhEukNo25kc4/AHsNpwrs6RKuTbBJ8orkngUalJxk3JpQajQHegrJQx2Q279LVxAfOWF4NAmKylPDcr4wkLKH85CWsdvhS5j3nnDGcNjZsHlyDxB/0coURnYreNBZZ7Elyj1ZMzsxMHqrKmy88voMIaBDZQXu5A+mZPQlwPDiCG528VTq4Y5V/8tDAavEZDNioVXJ35DLeGicJdzcYmG7ABxSeAAMsEUzRbpdbyhXsGcgZr5KhfgMbyPggyjGfI98GZyk1MPMF7lqgC2C2707qrrFYS0dGQ2GDYHvgF6CAEynmgXLLGemyQ9WEtY0UgICjHi4jBxKHFV6m6rIVUan01LkZVaw6+qhy+sqNc+EHjGrYgX0gbU1Ym7e/8nNo5+HiJo7ZhYudo9D2kDtKeMJDTfI93U63Ahrtkm1CDmH87rK1r+IzK3YQdacywvkcNg6LxZFqIPUxO58uKvbI52JNKm9NqyJ4vu6Lq1X6RfvGHs6ksvSFlvmWFyAHpxpXeFXKco5WjCXc8CRYvSAFqe4reo65A3atevqkZy6pjyMbwbn+D8tEzJScBO24ZAOk5N2egGTC6i3EZbUpTVsRAmBLm4DAkAz45ajfdrfFeohg5ptjgCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVR6V2lyTTEwSGVaRTRpYnlRMjBkREpaSk5VelhPYTc2bUpwVnIxL0NhRjFo?=
 =?utf-8?B?UWlQLzhpdEJLUUJkQnpXazI1NUliRlQ4ekhJOVoveWV3ZXBWYVVPK3QvYzRh?=
 =?utf-8?B?KzRYS2tzR2tKTTlPQWJLWVRXL01WRmdKY0F0UFhseWVHcTVVMi9TSFRHbEhU?=
 =?utf-8?B?Rm1VcFA1bnloalQ2UkZLTzBwZGljZ3RuZlltRDN6N2VXSFRwd0xlcTRIWVY2?=
 =?utf-8?B?bWlyT04vQzVzZnJrVUZSZDhVTVl4eFdIWFRmZjNYZE8rdmFKN1ozWGF0QWtO?=
 =?utf-8?B?VEZxRXQ2bkhDRzdxRGQ1OVVaSTRSTUdoQ3E3dmZ4VUpjZjZSa2lrUlY5TEdh?=
 =?utf-8?B?aEJ3N3QzR2pCajloZEI3UFNYK2VjRHlyM1FtbnRUaFo5RDV4S3I5ak5kTWUw?=
 =?utf-8?B?S0JOcDJSR1RRWjBtT2lSM0xoekI4MGRJdm4zVjB0YVg3bXE3cUVkMGI3aG9W?=
 =?utf-8?B?bnFMUGRHTzV0bzhKcUFQOE50ejBlOG04cjdxakM3dk44SWU1VWpCYmxsYlRS?=
 =?utf-8?B?dkNqYkNvbVY3QUo5T3JScUJqTWUvSG5IL3krbjVMY0EvelNWZHN5VFJhenVM?=
 =?utf-8?B?d0o2a1FpNVQ2OTBHd2Y0SVVYVkF3OGMwOCs1QmNQb3JmUGtnYzFlSGtYV1g5?=
 =?utf-8?B?bmpWK2Z2a2M2Q3o4ZTF0ZFpvbi9IazlPSU9iWi83V25SVVE1b0l6NHFYWVZV?=
 =?utf-8?B?bjg2VU5TRzI0cXhsdWZHQUtvcTlncGlHQVpOV1ZOekxzNEZ2TExFZHQ2UHlD?=
 =?utf-8?B?cWMyUHNoNEw0cWhJb2N2RXZqQmZOUDR3clY0WklyRlhqWFBoT29DdmROTkYz?=
 =?utf-8?B?SjFZZmtLd2RRcU1LN2Y3b3VjS2lERDN2QllKVnE4RDhrUFgzZnZCNTZ4OEox?=
 =?utf-8?B?N2pET2ZTZTZjdU9wNFFmK0VMUlk1SUJnTm5JUllHL2Uzc3g0dElobjZ1OWp5?=
 =?utf-8?B?Nzd2Tk0zNFVFYVp4UnpDNUNvdzNsYmJzOWVFWEp1aG1EZG1UMjBGSzQ1TkNM?=
 =?utf-8?B?SW9YcUxvTDZONC9ycndQbjNKMTdIU1lNK0pBUHpCaENkYm1EMXF0WkRwWE9t?=
 =?utf-8?B?VTJpZ3BoRnU5Ylk1VUtRVk9OY0pYR2lndEN2aTRjMkcrM09lTGY5TzkyS1N6?=
 =?utf-8?B?ZDFkNWY3Y1JPM2RqQW9PeXJ2dEhtZ2ZFSFI0MEp4ZCtmQkxVWXdycDQxRDUr?=
 =?utf-8?B?b2tvdDJLelpVaWE1MnhKaG5ZeTMvenRsUFZtaElOc3BadnpuNmt0S3F5VGFx?=
 =?utf-8?B?ejRET1AvRWFlZndWNDFWSUFTcWpPU3h6YU1aTktGbzdhcDBrMThFbVBaVWIv?=
 =?utf-8?B?a2pjekVaZGxya2lpUkpaRWE5T2hWbjRVSUx5UERxcHFWYUppYktDc213czB3?=
 =?utf-8?B?RDNBOXhWOWtId214QTVnclBLS3FCWWJWdjFmU0YrYTByRHRGeU1Zdk1JejJ0?=
 =?utf-8?B?cFNsVGtUM09PWkI3SFhNUzN2RjZZcFpmcFlLSkJnRzdCckEzY0IxREU5dmY1?=
 =?utf-8?B?ZmRXVFM0eW5XYm9SUXdDVUg5VldHaFY5TUNaWUNhd1Nxb0l6OEp3blNCZkZ2?=
 =?utf-8?B?eXFLWkxRelY0dUVVOUJvQzl0cjI4QWF5MFlVRkNPaVlRZDdtWFdKY1hVWVJ1?=
 =?utf-8?B?L0hIbjlnT3FPNmxvbnB4S0xjNDN1K3BSbWlOUVhReDF2ZGYwdlFFUDRWVTNF?=
 =?utf-8?B?U3BkVGZNUFZrY2R5NDBPcENwUm4vTXFHNkNCTU1heTFFMERQVk04UVdWUG5W?=
 =?utf-8?B?eGZ5bVM3RllaVUlMYVRYaDFESGVUWDV2ZGlkRGltelQ1VHRzU3lwSVloTlJ0?=
 =?utf-8?B?Rzlnc3k3cllWODEvUWRwc2N0a2VGS2VHT1NJakdtOU1rQzNOZDZYQVJzRjBN?=
 =?utf-8?B?Z2N3REwwT1hIeURuZ3FWMHJ4RVR2WmNSaWFuM2V2QVA5c1NMZTBVSmU1eGMv?=
 =?utf-8?B?VzZyNzZOdDR4TWJINWY1V2dBUS9hL1VwNTlTWjV1ZjNkUk1BbDRuSXdtRUFF?=
 =?utf-8?B?ZGJ2Sk9IT2dCNmZKamt5cmd6dFB5WnhJaEZBQUdicnFKV0xGUVNhUFd5ak9M?=
 =?utf-8?B?Vm1rQ2swMUhaS3NnZG9UQ2RNczhwaHJwblpaNkVVRXMwdXp1Mzg3OXBhSXZh?=
 =?utf-8?B?RDlJNHdocVcyU0owQ29qZ24zUXlraGphM2RDekR4VW5rZ2RvMzBMN0pkeEdM?=
 =?utf-8?B?azRLemlRY0NaNU9kcytpcFk1RERLdDZCcFB5YmRwUytMNS9Db3NvVFkrOTV3?=
 =?utf-8?B?WlNnckVZc3l5eFpubTVzMGZxVmEwQTcwZ1NBSS9PbW1hdXVobGdZQzJQbXJp?=
 =?utf-8?B?dG5uS2w3YWhzakt1SkU5UENLc1BwSnVCMG9GR2FXanFDMXg4UnFoUWVxWHJH?=
 =?utf-8?Q?RM0w46tMKuz3gjpHthpxrBsTEchfpFmlGy4Wm?=
X-Exchange-RoutingPolicyChecked: L+dV8yxiukp0KlXSdLiFR7NrZuGDzlSPZcc7BX0aSoOn9tadsNlhQHE6VTX4FU5YpkZhx2xHkRM98cHAQYxfYvsEHOMuZjPnRydgJ/xaXafMl5GmZj8M0aBV07mMFO8A7byc934So9grjOhbD58j6vhLrahf2J7VdgPhVabuyHu5Bwh0Sy5AWZUcOZjWJM1CzZRX1BkWGXtJSq23dIs6z0AxJkjxsIjiFtmjRVkgbtfu92RrgbrnFy3u/c+bZnQjakMFHHmbQCsuodQevBsnUFLNpL92DESDkWNglT/xuBj/pc9sG6UdsoqPwmJTQsv6TtPuLPmdGAH142xpQmgYRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97372ca5-1eb8-4c63-ca6d-08dee8d59cc1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:15:29.2865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75gMRiluk2iR82xw/uBZNZjJuqxJ8JMW/0bd0l8FT7IdoCiOyJafWPX0sDplW4C8IdtbABrFbDtd3X/5wYDE21bjdOwzpfmN3cGsACReZDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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



On 7/22/2026 10:09 AM, Mitul Golani wrote:
> CMRR is mutually exclusive to PSR2, do not enable PSR2 when CMRR is
> enabled.
> 
> --v2:
> - Restrict selective update config check (Ankit)
> - Commit message change
> 
> --v3:
> - Commit changes
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 40e3d7095996..6a90ded5d1fa 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -1587,6 +1587,12 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
>   	struct intel_dp *intel_dp = intel_attached_dp(connector);
>   	struct intel_display *display = to_intel_display(intel_dp);
>   
> +	if (crtc_state->cmrr.enable) {
> +		drm_dbg_kms(display->drm,
> +			    "Selective update cannot be enabled when CMRR is enabled\n");
> +		goto unsupported;
> +	}

This also disables panel replay, please make sure that this is desired. 
If so, add it in commit message.

> +
>   	if (HAS_PSR2_SEL_FETCH(display) &&
>   	    !intel_psr2_sel_fetch_config_valid(intel_dp, crtc_state) &&
>   	    !HAS_PSR_HW_TRACKING(display)) {

