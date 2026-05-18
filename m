Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14632CD4F49
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 08:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4910E706;
	Mon, 18 May 2026 08:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dInmSJ5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0885610E706
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779092400; x=1810628400;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=FhDBCjkaW2WicHdrSLRFManOqlaa/JCj86CCHcErcto=;
 b=dInmSJ5ZXZHijJ/VssOA/9f+CAN9IldDC0JQdHLEEQW+pE6fSsbZI284
 QEm78un3GYBS6pyvARCh8o6KGoO3p+9Iu364oE0mQ+aBMJZRbOgZMYO9p
 afZdOk7I9O8zXQ6M7oSfaQcG5K44xahfkez+mJdhO5I8/aSc8pchcnzdM
 9wHSs7yJg5Mo6TctB8dtq/3QfEgJzrRj8XvGSzriT1CFkvVZLferojjWn
 YVyY3JqPRgYJi2BF6DxOwu0lbN447qynVtqceWBLx6bWC3QfiT2fy/hQ6
 EsRWSVmIT4CwFSlF9B5tYdOaIV62ea24XwF9LLZp3MeztLdHbzkCaefPi Q==;
X-CSE-ConnectionGUID: sQNgBnJkStSU4Bc6dXgBMA==
X-CSE-MsgGUID: subz0Aw5SPWwlNiR6dyHjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90636089"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="90636089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 01:20:00 -0700
X-CSE-ConnectionGUID: iHU/U6G4SK2TCe33aMFhRw==
X-CSE-MsgGUID: e5w9qcPySEOoD32zm6F40w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243651585"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 01:20:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 01:19:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 01:19:58 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 01:19:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhqwajWWH9cvnXSBbmYQ0vBIQdswt//ydfJf0lofAvb9hnzI0CY0AC5qcW1er1scvgp/Z/qQUB2/wbL7B58i8mBZEh7SvogyXaOVustzBJ4nyD8tiaBD+2Nt24JWVqGKoZVMN258pAN5GGxI23fFSuEwx1PAWW9gdOGyj3ZrOL/59TiD4829qG6iGtQempyJd22a/3UuWV64fsr4O/6ZfxG3uvXRaTIRKhJSzvmwxqHbZI9piK7YmI0eCGS4hY0c2HBvom+WxM6dzPhi8ktIZYj17K8ty3OWdb7WA9Al+ZBh2j0RlbA7xhjSPwmdV3ddzqGVB9Jbmxb5lLZnun5BaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydVuoXP0bzELKqr9cQyG07Oh7JUBWbPM2LjF31iMslU=;
 b=Q7URIq0uPONKEyRo8nu36Uti9uHKWOTYmYIpXJk+VjqYJ9tMaT8x2AERNcOrkk0AJPWw2vVGHPvxDaBfy8kRywaKah5gApLoZHdMnmRwpgJ/NCiXlioeBeEdJMRM1LHeb5/ZIQxTvCSFap/em/Kir8FkxAkh+LxCkCNXf1ogX307IYoDBJ9Mg0FDyOf/9eUYpqT9+yAAtfo+BFDqHb+TkEIN8txct/ESHdtiGQeCEfsgUPXvUKbPVsrUOhNi19edr1PErabi4Ic3luymUgxHOpRiaO/aDYYJEuQIsqcclFgUTf/52hGxsqE9t9mPMuWOWKfO8wYeZQwH1samhH1gJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by IA3PR11MB8896.namprd11.prod.outlook.com (2603:10b6:208:57d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 08:19:51 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 08:19:51 +0000
Message-ID: <e0479a19-adcc-4a86-9b3c-8736fac907da@intel.com>
Date: Mon, 18 May 2026 11:19:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Revoke drm_vma_node on xe_mmio_gem destroy
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260517172408.1083275-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260517172408.1083275-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL0P290CA0002.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::10) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|IA3PR11MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f727ff-e58f-4e45-e797-08deb4b63bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 03W0x+F8gPf1jyhpjPQZ72Q2fBIFk95BBFnaJVfyouzTWE04c+GV88KB55vfbAym3+wjxZX54S3Zg0vqRxxfHjU77PLoHTDdCEutomOKKKayf1D8oMXiI+xq4NUplABJefSx345BSuqb1Vni8ANKceiC41ck+YBqTcY+d4DqVrQEEJsvm/l4foNJlbNiPrkxKRg3ik/IrhxnjMCACIoov88weLsxAZgSVqq+T8wVZ/sHS1MZ8zA+wSoLtwtB8l597GSx/lzDH/lmfwu0/5G0LYJweGT/PDo1BVzi2mYZ8pHhGzb/8rxSpPj5pfwa3EaM4QAjF44MKm+qfuJyjce4cTvULPV5jVMcOgVbrLCU2QAQzQABsNW6eGLZZDKU9dfE7uOZyJlz44c8IZIhvgWmmZf+kYv/+3n5Tqf6wQZa4UYQXRndbws9335mMl6V2KPWcOKMSTRrTAfnFSS170iXCaTmw1gq1NHa9wioaZ0sOas4QCAYdNF6FZqmm1PjErwx40F20Sz5zp69qO4lthuKyccucJxUAKYaU6DNCVTrvn0XGOfhTgDt+DA9c6yfjoa0+j+L7+ZOGBnevU+rJWlZizZqh3mII2LOCbVzAxQPGfkrSoQYJwxPddAhRRUwCykXAg31q6ekGCp37jBpz+kTf+4YI80qbm/LVhAX9l1FgK45mPYzmt46JLWhTacMEtnu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVk2K2REYVdRdFlFKzZwK2pQN0pRT21OVGtoUkhLNjFPZEpyakx5ZWtSd1dD?=
 =?utf-8?B?T2tML0grTEd0NDJURXJyY2dZaGpCOVQvOERDazlBZStGOFh3UlZvUDNNU3B3?=
 =?utf-8?B?S2w4elZHNEhPZFNwR2hSTlRta0R4V3JJajR3RENRM1M0VmNlTS81QnB5SVRa?=
 =?utf-8?B?eTlyN08xSjFzTXNlbzB4N3VNT1AwSHlpdVVYRytncmNRcnJrRDhhVDhpaUNy?=
 =?utf-8?B?cUpXbnBhOGt5dFRtYXZiemxsNDlDZnoyT2NEVyttQUlsQ3hMajdRVkpvMi9Z?=
 =?utf-8?B?ekdSQ0MxVlJ1VmZTay90VzhJVkxKVzZpVU4xSk4rYVh4TDkxclJjYzNZM3M4?=
 =?utf-8?B?R2doa29IMlZYWFpSZm84Y1ozejA2RTZvalpPbytoS2VqMTU2RkpVdU0ybWVR?=
 =?utf-8?B?Q2hzY2ROdWtLNGV0NWQvOFhiSUhTNld2SmZBK1V2Unh3aU96SkUwVXlobld2?=
 =?utf-8?B?NXlyNVkwWlREU1dnRURobXBwSFhtMTA4VXUyM0FoS2tDN0FqUXhFL0tWTC9Q?=
 =?utf-8?B?WFRROU5JS2dMMHc2ais1c3ppbFNzcjlETk5lbVppRDlKUW5TbmtZU1RzekxB?=
 =?utf-8?B?MFU1S3hYMmc5RGE1RjhXbjZLNkNkOG5tVExYSlNFa0srUlZiTndkZ0djZWZz?=
 =?utf-8?B?SEdEKzI5R0dJYTdJZW43ZkdEeDRrK2xIQkN4MFgwSHZib1NBcjVKRTJPblJ1?=
 =?utf-8?B?eG1OUXZoQnlTbUpPWUdKMitNYk0yN1cvRUpOUWhqM1RDeGlTcXBUcGdZMkgv?=
 =?utf-8?B?RGQzRmJjQlREQ3N5aHZxaXZMdnJQRWFuRTlhcHJoRVNOWktJZ01Sd2dXRWVP?=
 =?utf-8?B?N0tXL2tjbDJlWFFCcUs5cXphZUJRbDcxTGtnRFJBQjZzUmt4MnJ6VnFkK09R?=
 =?utf-8?B?NEFGSFJDaTB4M1hmYTBvZzRKOUF4SkJSODZqVjVkTmhvQXoyMm5HTDFkWW1p?=
 =?utf-8?B?eHRCVGZtajdKQXU4Q2xmcHdhQzBmSmVUQ0xGQk51V0VYQ09TM2RhRlFOdVVV?=
 =?utf-8?B?WG9WWFc2aG9zVnU4VmtPT2ZzQzRXdnRlM1Fabm1jczZ2dzNXcXZhOERrZm5t?=
 =?utf-8?B?bG1pOTRPdHpGSjJNdEpwTUdrNWtBbzU3eUkrWm5TTEt6S1hsRGpXcXBJY1dh?=
 =?utf-8?B?WmxzOVBmNXNXKzJKREdsbGVoOHpCaWVwVzNpMEdFSWJBL09TQXFCQmgyTkty?=
 =?utf-8?B?MG1pMVluNTNLdTA4TURxMzYzcndGM1pjMVUwYk13WjQxL1EwdUtncFg5K01L?=
 =?utf-8?B?OVpMUGsyNDRXazFPMWh3UldhTS9iakNaeGtZVmEzRDlQL3JMa1NjcGRvQXVC?=
 =?utf-8?B?QkVCdWhLVUZ2QnFFN3U3M0diTHIzQlNxaEdubDlGK3lLZzBrRHV1SjBsRkp2?=
 =?utf-8?B?V1dJMmZPczRGaGZUdDI2dGdVQkZCeTJjZHExODJxYitWMkg5VDNwNFN6RU90?=
 =?utf-8?B?UEFUWitNL2kzbldjWU43SDJyN2ozYTdpbE5aaDc0bU12TEpoTHFqd1c4M2RU?=
 =?utf-8?B?S3hSUmdrWllka1h1NFdQWnRuRHBSVEw3R3ZiY2Z5cTBnTWV5VEhYUUZ5MU5i?=
 =?utf-8?B?bjNIVTk4N2M3dzNwVFhGb1JiOGQ4WGxCRWF5TUU2ZDRkb1BDdk1xOTg3Vmlk?=
 =?utf-8?B?R291TEtTNjIyNm5ZNUQrc0ZmcHd4SFRrUzE3OEhrbEtFSHo2dldvN1BWeG0v?=
 =?utf-8?B?MFJ2UTZjUVhjVXJSRE5vWS9JMG05YUFZcXl5ZHlGc1dTcUxRY0dzOFBKMHAw?=
 =?utf-8?B?anFkYVBhWDRROEJkRXFYdG00bnVJQXJKbUVRZis3QzliUE1wR1d4Y0x4SURI?=
 =?utf-8?B?ditwYXlOeEp4UzFyTE1SU0hybW8xNUdZZll0QlIySi8ybC9uSUZnbkRJWVVT?=
 =?utf-8?B?Zm5JS2hxTUNKRk9nbTgxdE80UWkzcW9nUmNKZTdrN0JqOGVWdnZOelJwL251?=
 =?utf-8?B?V1NEdWFCV2pONVRkRFBOTVVhYlUwcXlmcm5MTWREenBMdkE5Y2ZDSXdZSWhJ?=
 =?utf-8?B?K2x6OEtKeGYxakRtdnozekt6dnFqb1VweFR3c1R5Sm1mam9nNDZPdFVMazl5?=
 =?utf-8?B?QXQ0WngvNWpxZFJmbzNqUzVzSXdITjZJVElod1BXclE3a0Q0dmRjZXRxcXRF?=
 =?utf-8?B?c3FIT1k3QVVRdTJiVkZzd2dEcnJWOEhUdGFsKzZ2UWwyaUF3bTVhQXpmVS80?=
 =?utf-8?B?WTV4dHcvbGdRODR4RTlUUWxFc011blRocXVCSmp0K3ppOUF5N2MxbmRUdnNK?=
 =?utf-8?B?MzJqQzdjZU1TN3NTUFEza0RKVExjajhhTGJqRm9aQVpGMDRaWTh1RDEwRUQx?=
 =?utf-8?B?OUFpSWNjRiswckhJd1hKSGdUQmpWWkt3cjVuWlRHYXg3YTdtUXhxQT09?=
X-Exchange-RoutingPolicyChecked: Fi+hPf/zDtIBSrrwP7mzln38mDpVXMAzunZ3+u2+wiwTBcveZs3vVXlHDvg8J0S7oNkBzJbkrVkxmCEL3T1KGHTbAWfMdK0iYld5l1nGYIz1JovW3V0PUs2qV96mfsHB3aEUQqF4B9kNRS7qwqV85TXWfBHF14yYDo9Ea8B+8u5ThtE+hDphk9zU+faTfYKQHOgfbBB+st1x/7EjOdHXfee973kIJ3q4nMCIlm4gAhUxXXAUFuQo1jOUvwlb6NAn2zXD89D6ms7jpqKZY+wd0M/Qk0fCrnIwqZzKHIR+nZYchxgXbwNtp4fZ6/Hd4oLSvj3wPy3wQ7qpPPgreZzl4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f727ff-e58f-4e45-e797-08deb4b63bda
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 08:19:51.7654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kal26p32q9ad4IE8DzWMQeopZV6SfP0ZtQ7PizZ+3RWgcUCHiLFb42R6HtZedpA47e9htG0fp37rZMbGxvMj9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8896
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

On 5/17/2026 8:24 PM, Shuicheng Lin wrote:
> xe_mmio_gem_create() calls drm_vma_node_allow() but nothing ever calls
> drm_vma_node_revoke(). The drm_vma_offset_file rb-tree entry allocated
> by drm_vma_node_allow() is not freed by drm_gem_object_release(), so
> it is leaked on every create/destroy cycle.
>
> Add a struct drm_file * parameter to xe_mmio_gem_destroy() and call
> drm_vma_node_revoke() from there, mirroring the drm_vma_node_allow()
> call in xe_mmio_gem_create().
>
> The xe_mmio_gem helpers currently have no in-tree users; this prevents
> a latent leak once they are used.
>
> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
> Suggested-by: Ilia Levi <ilia.levi@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>


Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_mmio_gem.c | 4 +++-
>  drivers/gpu/drm/xe/xe_mmio_gem.h | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> index 8c803ef233cc..b7dcc2cc572d 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> @@ -128,14 +128,16 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
>  /**
>   * xe_mmio_gem_destroy - Destroy the GEM object that exposes an MMIO region
>   * @gem: the GEM object to destroy
> + * @file: DRM file descriptor previously passed to xe_mmio_gem_create()
>   *
>   * This function releases resources associated with the GEM object created by
>   * xe_mmio_gem_create().
>   *
>   * See: "Exposing MMIO regions to userspace"
>   */
> -void xe_mmio_gem_destroy(struct xe_mmio_gem *gem)
> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem, struct drm_file *file)
>  {
> +	drm_vma_node_revoke(&gem->base.vma_node, file);
>  	xe_mmio_gem_free(&gem->base);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.h b/drivers/gpu/drm/xe/xe_mmio_gem.h
> index 4b76d5586ebb..80d7795f07c8 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.h
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.h
> @@ -15,6 +15,6 @@ struct xe_mmio_gem;
>  struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *file,
>  				       phys_addr_t phys_addr, size_t size);
>  u64 xe_mmio_gem_mmap_offset(struct xe_mmio_gem *gem);
> -void xe_mmio_gem_destroy(struct xe_mmio_gem *gem);
> +void xe_mmio_gem_destroy(struct xe_mmio_gem *gem, struct drm_file *file);
>  
>  #endif /* _XE_MMIO_GEM_H_ */


