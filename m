Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37E4F47CA9
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 18:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738C510E2DC;
	Thu,  5 Mar 2026 18:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9hBmJUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9E310E2DC
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 18:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772736559; x=1804272559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/OTSNafsMISqv1DnHTctO+Bllh6vTh6uCg/fUpq8Xcc=;
 b=Z9hBmJUVm0gAhtMs2H3Gzsm5DNOR+cACCeTiwmsAwY3x8w370Pwitkas
 LcKl5FIK0ANyzL0KgZbGsLSdqONut0ir0m+y87Y77+DQtpY7L5+TIXzcp
 dK296OwYz45vszLeDCvN3aS86Ywu0c6rH/GmclN4ck82lCpxIhFryKLCf
 V9m08tlOZ6iGkywrMT4BwyWOhm3+LgqWpyjF4Mn8LUkR/sWnYt4+5tcTF
 szbPhD2vHIi4vrks5GEgR35JV4d3/SIu2/mR6nFG9xDAPOmZsTpXlTZuI
 OnWhYjw9c5dAI7fR7s2tGelBkNvoOhlph6HCZl4VPZU7siUn+eKvyp+E9 A==;
X-CSE-ConnectionGUID: y3LOs0l7TFebJG8VPeg8pQ==
X-CSE-MsgGUID: YMXsrqBhTESXpP3p1Z+/gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84471817"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="84471817"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 10:49:18 -0800
X-CSE-ConnectionGUID: rTmK0snuQXeqbQ5Vsf5d3Q==
X-CSE-MsgGUID: UaQyKkNOQmuz7Cz8I/+RoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="222915132"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 10:49:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 10:49:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 10:49:17 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 10:49:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA0TVmTGgm+0gaqnXBE+6CEMb6oXGSzZjbMNXFdf6bF6ddoIkpdxwawXwX0gFy4yOu16/8KJNw5U0pJk03eiZGeTLt1wifRUKvOy611j0c7wacqEAkVjgJ2jf1eRVnVj+P/up8eRyJg+qIrBKzCJzJWsLnWhzOAw93o369linxb5AV40Icc3zVYjnWLFlJQTBUnDPLmb+w3H75iMd4i5N1bbmb6EKYVl4xcm95IhXJvYVsctY9c7eBTXE2q4XrHL5FfNbOscjdirC0I8IeB6BMdYBlXPktB3tRVV9Xu0zrj4mIly1amXJotyUnn8L0DotEqgB0KHPiQCVMflgpusew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqfSRaviofwT4aKVqxioDUVudEcQ5eWc35pChTV6z3A=;
 b=jHgiJ7bfRyqehW5EHCVcCmxuqZrVP+K32JiW2FnS6RFOL/LXlYTVELm1j4PDQYYaypWNALW5uTnV47bCLQecq85aCqdBDnhiLME5xMN3OseJ1SKukStsv5AbmNC1Nqs9DbVaBWdjdxMkBjbAgQkcCG2R+2lO/gdEA9aJvjNFn0V+3C6nLswpQWSl4jHUaISyPePxRiG+JmrhxeB91MlPXhLCzbckll7IquBa4hDPyOSdsOZhOP0Bp1glDJNulMxVsgvTac5xNcB2leBBGiGuYFS+xzzrZ5TcLgxeJ3zWSTcSQv0PZHJryvgbhVNoYKlSxg8+RQDZe4EHOzAMcWUQpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5002.namprd11.prod.outlook.com (2603:10b6:806:fb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 18:49:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 18:49:14 +0000
Date: Thu, 5 Mar 2026 10:49:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH] drm/xe/lrc: Fix IS_ERR check on wrong pointer in
 xe_lrc_init()
Message-ID: <aanQKDKnKGxhDmtR@lstrano-desk.jf.intel.com>
References: <20260305184519.155060-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305184519.155060-1-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5002:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ab089b-5dc4-460f-5f3c-08de7ae7e5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: pTCZyO7T83QuBuTt9z3b6JhWqoqw1Rz2GxgjyKocFHgKjI3Oty01cwN1mk0EuV6R06OfvmM/qpfqld7nOCtYaVw+Zfs72FydDSHMD5/eLfiNVF1yxDX60fOPYDV4C+XyoYAdyQi/2EC9G6/XZ86ROChPB+jvuGtmWZc6Ng3VxH3OWlKFm0p0+qY4NAOisQ92SDUHqYLzbtj92049K1ueKLszYy3viDX/pPumq5eurL4vkR4KyDWbL/wdOp3vIm6NuKXPn6xjw1MdRTasxrvfVBsreBJqMJMOa/mX396FzuhykQUB/kTJx4TXsV6rw10INBRo/bTGVEl4mZwjA5dlfI6UQqSQr5HfAMauHvt+5+/adNcQ7Usr3b3XtD8nvYm968VpCcUw/BZy6o7jxBOaBYmpNzy78Dk2/H6I9/RcxXlYtiZkRL+k0j9i1fkCtoC1STrF1Gz6AZH2m4x/jGzrpaxAnwdwUTt6ISMXdcKRAfRC8byRgddPoUlJU717UJAsceH78mBjlucN4GQQeGt1ZbxcBnqVl+L4V4LT6D/Enx5rF/b/mEDL3Hab2bpVvKAFswamHVMYhXk11zSwxMWGx3GEescmRKYOoXfNLk0HPB0Fi0ADlzxvRmhq258HQypCY/7tcF/Ifs9YnVScdbJbY0OGCx0HiIidOnoPKc4PGqlBiiiHF6t5qjx5Beeg0hV13nn6CQQmEMEnemHH7StCUEATU8obghClxYC3AAIZfcQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KvuHYuIXYJipFHhm6angh96EZ05NJ9jR/hpyRzVIrkGQ/SOo8AYmP7MH5wcd?=
 =?us-ascii?Q?yicyRJQLselRt/dNy7n/vqarmoQjEoDl8HaZfOV/jLooFlQPyNI0O6aA2K/D?=
 =?us-ascii?Q?8vYSovHP19hTmRQ3nf4aiaYpd2/Ytowx/qSLX9+LN3gzGV2WJTzJwpkoH4L2?=
 =?us-ascii?Q?3WoB867GmSoHQs9/zEODG3XEnD0cRsfjNcTzdFzxTfFJ4BH8bNT4dwK9es2C?=
 =?us-ascii?Q?mArLpjQ+U88ZwEg1FPAowx4bEADaX89O6DbS3AiohlmeNzSXzvfZBdednmQ+?=
 =?us-ascii?Q?6lFqaE4usy4sQtxXdsRNAi0af4zh//EUbzo4KEwUtxJ1omY7RWfObPN7eXbt?=
 =?us-ascii?Q?84P7X39+WLOEe+cXXwF+ZWEXCbquwXxSeoWhgQo1GgpOUPABb0Mrgt4jFo1G?=
 =?us-ascii?Q?gGx4zzYdiX0DqyrKu9snAPDpcFIBD185yiQeJxVetUtY25VaLFDD8Won129n?=
 =?us-ascii?Q?GaVqmmrYKIuBEj1Ahcbq2+AJYNlS6/Q1lUlgHzp9GkO+OXoA0cHE5MYXV2Ad?=
 =?us-ascii?Q?4j4sDnnbcQm/TvBD87ffRbTMysmu/BA13A2Ow41fXYanwsWZx9wLEJQr5PVT?=
 =?us-ascii?Q?ZkEvhGFjzN83miqiRpTggvtGG9IoDxiuz0pfmSzqrwWum7jrpP8S/lu3Kts/?=
 =?us-ascii?Q?Q2Vp/9Wg9cC3fKKO+fPvsjtsfKXH8a4V/VRNj0goHDRQcaVff9m/pRKZiFLY?=
 =?us-ascii?Q?UYdhY/0JDXWif2W0DJTFemXURR+a5BKfskoSfCJmvDneBsF4hPhrGoXcWLK8?=
 =?us-ascii?Q?Fb4rZYgY7CYb9Gjm6h1/DfweW0HkFDjGY1ZiP+uOVLMnYaaPFn7r5wpwPKoq?=
 =?us-ascii?Q?axQZojeuL6Y6jA9Rjk9Yb2c8TrRyD6MD0q8Oy2g3sAqKIU/c1mFV9y8irqfE?=
 =?us-ascii?Q?8p1euWs9/hf/tYT+DV+B5sXmOWqK5KR4N8LZMJOfKgrKTE7HfJPukls31yF0?=
 =?us-ascii?Q?s+e2OeQ/WXs3/tCAgjalweX/2f6aiirFTqQ7FvjnxyRhlN2q/r+ljSwb6mwo?=
 =?us-ascii?Q?z8IBuf1kdPKBAgZZxZuE0HqZQZvH934pXWUVit6rI5SsjnTt6p8RN8slAPxW?=
 =?us-ascii?Q?cQVQx7EC1MhE+Ix7xrTIwxpVR4eWxPcbA7ugf2kKve6fGuGY+e9xnCVcQWnL?=
 =?us-ascii?Q?+mrDYtcxiwv48wundfyugfz1a6RBsWGNJ3bhSuxoOtXJWDfJ7VSdxBvQ5Grp?=
 =?us-ascii?Q?YAAeBkseXVQaN3IQxqLfAcIFP39Bcs0ADJwmqhWQj5IWBaKouNJ8zv1fBisS?=
 =?us-ascii?Q?6CBXKO9TNJMA+LlHEX7FeSGVPfN5NCxdca7V3RHaWrr/kh0MmafP+0BwxlN8?=
 =?us-ascii?Q?OvCU+HXhTzymqqujq767lgXDuQbTrV4mKl3D8gGNC0rkAD2X+bCAi8PKGGMX?=
 =?us-ascii?Q?yy+W+rIKS9OENNPNdjW6hbcJy8h9vXnoNKrqFG0EWGtsnfhpEjdAojSS1hJg?=
 =?us-ascii?Q?gsiy43gxgOGumuva0N3W54TV9wvlw9jgSYaKnCMBsmbAiY+lxlMEZKcRq5pQ?=
 =?us-ascii?Q?X/iWm9fY0n8jt0sLXryA75iGCz44ImU/1zsftRoRHBsGtgIX+f6Szd1HvDFH?=
 =?us-ascii?Q?A+tjmm3x5NcRXF6U2zR3BjyGiy3b2UfB6mwAd2Jh1b3eZyqldkbLOUgj7DmG?=
 =?us-ascii?Q?cD8303miHDyrurNL0JqfleN1D9eChvayJtsuG6Nqa4OQHWAjL7URMhtUXO98?=
 =?us-ascii?Q?tjPi6rFI5wM7/siYhmkyG7sd5Eefyj/DAtm26bpCcud7J0qig8O4nOSWyb35?=
 =?us-ascii?Q?EbHIRnD9Ag=3D=3D?=
X-Exchange-RoutingPolicyChecked: lyzbloA1GIjwhIQZfokmWCXW7JP500CH2cVjTgnMXES70c1WrW2QwbAtbVWpu4D48u0UYQ5U9K7fNmWG5W6Jr2UYzVvCqORevQrxrcDdSp84eN7lgliOdN99eXJC6AMZC6JYbTOXh2PW2WiLrx5GgjEM9m/4o7pFd0qha2bewVLUeIZtFMe/uF9MXPgcwLimE4771ugn7C2rf4sASpSrezEKjp/AXgMDKLkCxx4qB9QM0DcfCgH1q2Yb3IBTjiR8M80JhqAojaDNORjqu9UPQMemaF4UgZNMglkabUYfzeXP2su/0VAtzPKUNLaBT1jAeXmbFirvOh7d5fVA5mRVdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ab089b-5dc4-460f-5f3c-08de7ae7e5c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 18:49:14.5273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GVlnzz/giRhVpfUHRMLkrNlCNk3YH7/F15+DB98Rz05X1XbI9SYcIM6FuMBCfryerixvNCNXpnQLGOsGcppskQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5002
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

On Thu, Mar 05, 2026 at 06:45:19PM +0000, Shuicheng Lin wrote:
> The result of xe_bo_create_pin_map_novm() is stored in local variable
> 'bo', but the error check mistakenly used IS_ERR(lrc->bo) instead of
> IS_ERR(bo).
> Fix by checking and dereferencing 'bo' directly.
> 
> Fixes: 89340099c6a4 ("drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()")
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index ebab5d78f7cc..4ac566d4234d 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1598,8 +1598,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
>  	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
>  				       ttm_bo_type_kernel,
>  				       bo_flags, false);
> -	if (IS_ERR(lrc->bo))
> -		return PTR_ERR(lrc->bo);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
>  
>  	lrc->bo = bo;
>  
> -- 
> 2.34.1
> 
