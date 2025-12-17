Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E3FD6406D
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 03:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F41C10E9B4;
	Wed, 17 Dec 2025 03:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1B88yEf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBB710E9B4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 03:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765942028; x=1797478028;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6dRV1fraRwEk9dD21ZxUh8GcEfd+B/UILLydLTqo5gQ=;
 b=U1B88yEfRPyDDeGNnnk4z10Ddd+1EYPLjbWYT8eRz/67xXeR7KlqV2a2
 gB3y3v3HFU/ALD5kb58sjk86qUFjH4g/K1rNyv22YmdFUaF0PKamgMCP/
 FcTP6TsnU55IA3w8IwF+Wu/yQX1gu4GpdspXzVTkQRqaCDlHlyxTmujM4
 MIghyMxnnxbqiWTAo0KOkf2enAIKwIcWLFNRWcR7Hrc5pQJPCig4Zvczb
 kUaOYnaKII9xgxlmhxGzjheJvrOcj1sGNnZSnGaG+g6h0UuaSne1OKbgw
 vOP3FtugdkN6ar8Nlo/pEMwxkoy6vIWm8hVxedY8YDqyL7Zjxn+XOyo97 g==;
X-CSE-ConnectionGUID: nxePBEwyQPS/Xc9KAoJNLA==
X-CSE-MsgGUID: SasXd6o6Q+aRCzlRfvlvpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67942291"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67942291"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 19:27:08 -0800
X-CSE-ConnectionGUID: VQIXiAJLTOCoYVk0VajwRg==
X-CSE-MsgGUID: JaDaoDBwTGWVl/rerI/50w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="197281226"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 19:27:08 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 19:27:06 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 19:27:06 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 19:27:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZEw/8H88gGVcbgXPH3XHePN3AB61fHGvQBO/k/YETdp7XRE8nzI4HZo70+lFU4PEDFDKXc3vaNqNU99vQ6A9ittQRB/gyji6aNbphE0pbtVk0FDOVd7SIJB98vm4qbhc6xedxAexdCV8SgS+ENqqLVHV5YxMWFOqJkh/hQ4sZEQMqQh1ZZh8CCCCcNQX9lRhxk7ODcwSHUt5rGf3OojLTLVBmiFOQatZmzjlL1ckaSEt5Qa0O3tax4ojp4e2Ee4S66VUozbmLWLqAbhAzcJ8r3vjZRI7JeGD2JhrQnsHZOnxkPHF6gCyJ/DPRtQ9EprZ3GLEt+nDQhV6kRXbJVozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0K6mLmcQMADgZwDZfGZWX8oS052tHRxSXcTqrP/YoOo=;
 b=j5o15E8gsVQrCXDIKpT3ntYoJvrx5Sv5YjyUZD4zBTgSpPUa1C+ic4OynuFD+rTDC90mAy4nR07WiJURewbC399xrtKEosYBejl8JTYc+3Q2zJ/KuV23A/oh6PdQgJGmpY04Ru/jmFRiVyMZiuTntSJFbnxRtFaRKZkINwT6dFEhO1gDHvmST2fT3t7t4JP+S+1Ola14FfdeVw+czzs65OTvyiysqhrBGS/YZfdbUGZxFsdizRjHmuE1x8fucKfn/N5pfWZcyU6lrmXHzxRp0kGAAUPzezfTl3tbR1NkdJpFZVcEw7I97s6rMizNxOU4W0DuZEVbz3qIIAsgByDERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6738.namprd11.prod.outlook.com (2603:10b6:303:20c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 03:27:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 03:27:04 +0000
Date: Tue, 16 Dec 2025 19:27:02 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, <g@lstrano-desk.jf.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <peter.senna@intel.com>, <ayaz.siddiqui@intel.com>,
 <varun.gupta@intel.com>
Subject: Re: [PATCH] drm/xe/xe_svm: Only count unique pagefaults
Message-ID: <aUIjBkFDG0763fPa@lstrano-desk.jf.intel.com>
References: <20251216170200.8714-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251216170200.8714-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6738:EE_
X-MS-Office365-Filtering-Correlation-Id: e9195329-020f-4f23-1543-08de3d1c2678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TNOGX+Z2wx84nRoV4VEHRrQ2GePUbMuel5bgq3fPhtG7KttCtPYUxPYqSOQ3?=
 =?us-ascii?Q?1bO8V9t4/08p79E4CYSBFViZwzYFjGqyYBbWCD8gibPBmsJ4IPVzroumX8+s?=
 =?us-ascii?Q?vvzcVKQlPLJh9dKcPfyrzsbUGcX9JQYonwfrb4+BHQ8H3H7hGyY/lnDB4BIc?=
 =?us-ascii?Q?Dwp9TZ1TMw5dLP+2+8JMhdtPBO9MCLNaKU6rPkY4UBiVAjBKuBET7XNxSwcU?=
 =?us-ascii?Q?2S8bnWK2yD0kVEnk6ecD1SYrGei3VLj6/l+Ndc9PyOL/WZ6vifTwKuJKIZpv?=
 =?us-ascii?Q?kXlZ4/QAf1WJd2pYU6mfDa1/f5cVTir9xMqYq5mtkgm30d9eQpBUe7pXcVVc?=
 =?us-ascii?Q?sVU0FlEqJ8/6CHzboSfrjw8CDF3eurmBRK7L2OlqgVv0BahN8iJmX9R4MRqO?=
 =?us-ascii?Q?fKo6V7L2V0gN88WYQj5aJvSHnc7aPi4htAkh7AKLVWs6COmgXBNBX0AVQdkN?=
 =?us-ascii?Q?MYixGKSSU9CQcY2ehjbYQoKaMKYC9qqGWyKCm7qs6s2tGN8PW0a2UohxuQsj?=
 =?us-ascii?Q?2O5jlA2Tsgw3O1sCiJabmDy1QNE+jKhwbfBcuTTlmAFlr8WKY0E5iovm9Mtu?=
 =?us-ascii?Q?DPhAEq3itFkY8jfRTYIKDtKckr6Zcd5X1fAtRNLyF/3zqOqavjotu0/ZWG2w?=
 =?us-ascii?Q?NsphoxojFiWH5x0aq9tN/7hHPQeczfY8QY+KvIGmer8njLnh4qGgJQU/ynyg?=
 =?us-ascii?Q?M7hdG9JRV3zYIz3QChZU5be26Kodz9jBNdfnlUp7HNwUTXj9txkOOrVnNxoQ?=
 =?us-ascii?Q?tgvM848EQZtgMxCVPhYgFvUEhjA86meIXPEsGomnadjFFYh3H2nnIkfynYTz?=
 =?us-ascii?Q?qAOEwaMco0Kpfmy/F2lfUyTTEpcW80SnAA1QKZf+VcjM3R0gjvrwebNWuPsu?=
 =?us-ascii?Q?dTR913aWL9f4cS72s8XPBCcvJC8hNOnMtag/HJ3Sd/dF2qJdJoP0lzXNzqp2?=
 =?us-ascii?Q?SyYzxSAmIL0JE+s6Lt1cfQHIRToy7RE4I1SVsYPbEYFuZKhawDlhXTgYb2nV?=
 =?us-ascii?Q?MGNqXxCvc/HJF0xsSgWoQv64xdLmR5n8YCEgMM4cIXYHGMWnQ4lzFQqHq6D6?=
 =?us-ascii?Q?XnGc31uqggMFe8+YFPk+fgSvdyNDrbkrinIBufZXtRciPSkMg0XZVJd69hIF?=
 =?us-ascii?Q?XQkC4q/S/Adv0BwGp47nmZULtDORDCffa4KWY4dnMVsp01bGztD2E9wlt1ox?=
 =?us-ascii?Q?H7CKzV1lNYsNu7PXFRwxVDLv7yFxuXdHJIhVgVXjzRlurHfVrLL1nrXgMlnr?=
 =?us-ascii?Q?OSIgbqFjKtPCt4j//5KPvZTiRbWo3rWH8pNoiG9StX1K1U+o2aBzy9Mq4oxC?=
 =?us-ascii?Q?IFUTOKvNjJLLUioSJTYrCLCvrXhjop+2maMZHvYPDl+2lmUTc72ewmA+0WVs?=
 =?us-ascii?Q?LCDl7VRIs4I5aEeCOSLdg8Bf6xo4+DjDQfwpFM+juDbRKHlVMUf2IVdM0fmI?=
 =?us-ascii?Q?ztV8E+1sF2QRfFpPI/RzRVhnI+qnCByG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gM8W2zen+SzH+fdNGTFWnC9DQr920SKUDN/oAHeqjTSKkMeO1WVU6eEqHew4?=
 =?us-ascii?Q?/FQCq7AzSbYoJSg6OGwiquLd69DYFiWguX8JgAVERG8RVliL5FfeCXP0mkG0?=
 =?us-ascii?Q?77E91hqOoKrr7zL50GW7B5TqAYR8jTsS7+6vrtDG7XGRxDG/GSCi7cPVy2+H?=
 =?us-ascii?Q?n6uTQOpMPE4vrYFqXd5XNCyC/0Yczn+Q/lyAcX+B6UI3N/pe5qQjQG64DFWd?=
 =?us-ascii?Q?EtkDD7QMOFFJJ8p5eoGr/Hgq9jLs3wEPsIwM3IpwKAwdlexGctmJc5JV14FG?=
 =?us-ascii?Q?2t8di3UYVSsGIxgOSt4qO8WfiGQQmJtlMJVkv0GLn+qfejWGVD7KIpT0iCf3?=
 =?us-ascii?Q?5VeiHVdZwXO7j1z8CcAhxsexweIKXwIrwheitXu0Eid5zMiEN3Uie7IwtQCU?=
 =?us-ascii?Q?TKAneHHV8h4npxaRmhZQdQmdGR1dSXYAztaB/TYk2LNYZ8HSNq37m0ifCpas?=
 =?us-ascii?Q?sOxxvAun7ViFsmbqpJ4caoi4d/Kx+UsKdR4J3lopff4uf/grys8VbmVIdz0t?=
 =?us-ascii?Q?DiUvuBk1y1DVODUFtFdK/YTsab8hDT8VEGZaO+LLHA+vv2AFRTZ+p44WqWQm?=
 =?us-ascii?Q?g1PPkOlYMfiNY0jmYtyYS3OeVmozt6MQUPFlsFbmfc0j4lbG/xFAXts8pkoq?=
 =?us-ascii?Q?RfJaGCZxxb0kVMbnZE/dovf7Xe4Ytu54KqjZPIoFuvgd+Mtubtyp0ux9HnFB?=
 =?us-ascii?Q?MVRAoJHmNN+5AHfSX42INhP5yflEtCtvMCFBT8d1EDObBJIyayQKTMhe5ReD?=
 =?us-ascii?Q?dM80KQXMvgkElAj6qH9YA9zCgH45WimG+inihNLsbDbYDd4RZP7T+XJVOlZu?=
 =?us-ascii?Q?fd3wzFmnf7gH6smZvZQJptuphZImaadhKk0wkP49i6Pgz5DxSJgP/iJudPQV?=
 =?us-ascii?Q?KNN4ZFsZDCvKTvb3t35faxmZXthDOVQf1JeSkR20S8KM7dP/yEhem/UcWvWv?=
 =?us-ascii?Q?0Iu87VgqqUmVffRPc3VqaihEFAU74UO3n/7PyNWJTNQ4wnt1o19buo4fKNOo?=
 =?us-ascii?Q?zHC+c4yyWB27CxwURhBJxeeHa7dPcl3/nVJwV85qfyfbP4EMhvOwYOhkT7kY?=
 =?us-ascii?Q?ghe/jv6kbrsp5fHumbs+viFRjeyFHJkpTyjjMd0EdGqeYEjTQ5rut9xDZrIS?=
 =?us-ascii?Q?UGc+V5axFWtaHxC9A5RJbrnO3jegfzQm1RbQo+ziFkwI62lcKA6qmYuBHXg8?=
 =?us-ascii?Q?GadYXmiwi8D6/yfVxRbWZvmLUzxarjC9vI+aw3OfUvoJy/rYqPG3SS2cp838?=
 =?us-ascii?Q?1S24f5xu69kPpJdhCoOhvy46+ydKEVM6gYPgL4pB2GED0bkNiwz4J0ApYSwl?=
 =?us-ascii?Q?TGSaE+zVRJcrYLJWabtIMQ8+gKrHDWzbgp6QtFlRdlxNrb89f3IAL3jaORf1?=
 =?us-ascii?Q?VUf1Jl+FcYe7aCgNzO2OCNfnmBt4ia9ugkuqWxLxBVd7ZCCl9n7UjGqryASL?=
 =?us-ascii?Q?Xa8dEnPKGAyfu/NSiTZEP/nN4h3BSqRTFffBsJVzQ9qHOdTGxa09RwqnWJKK?=
 =?us-ascii?Q?pDSpz5PAgpoUaPATjPElsYONGcw0hrfwQFfWT2geNEgxXXFJKEvzfpYLd9id?=
 =?us-ascii?Q?Z1t6S41efwOT4Zs505ZrdnqPaDE7pvF+R6oI4x9/FhrGKQms1RPY1YygSwAj?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9195329-020f-4f23-1543-08de3d1c2678
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 03:27:04.8599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgqYUw9I/sUrKRcRXIBCHQJiMm1DPuG76S4DsTWsvVZtwEN9HK0s0WHTRjPUp3cQggy8IGUgN2XPPxuC5k3oGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6738
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

On Tue, Dec 16, 2025 at 05:02:01PM +0000, Jonathan Cavitt wrote:
> The function __xe_svm_handle_pagefault increments the value of
> XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT every time it is called by
> xe_svm_handle_pagefault.  However, if __xe_svm_handle_pagefault returns
> -EAGAIN, it can be called again in a loop, resulting in
> XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT being incremented multiple times for
> the same pagefault instance.  This can occur if, for example,
> xe_svm_garbage_collector return -EAGAIN.
> 
> It does not make sense to increment the SVM pagefault count more than
> once per pagefault, so only increment it once per call to
> xe_svm_handle_pagefault.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

This makes sense:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

But also let's in counter for every retry. This will show us quickly if
apps are doing things they shouldn't (e.g., parallel access) trigerring
retries.

Matt

> Cc: Peter Senna <peter.senna@intel.com>
> Cc: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> Cc: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 93550c7c84ac..245ffa6330bb 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -1026,8 +1026,6 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	lockdep_assert_held_write(&vm->lock);
>  	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
>  
> -	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
> -
>  retry:
>  	/* Always process UNMAPs first so view SVM ranges is current */
>  	err = xe_svm_garbage_collector(vm);
> @@ -1178,6 +1176,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			    bool atomic)
>  {
>  	int need_vram, ret;
> +
> +	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>  retry:
>  	need_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>  	if (need_vram < 0)
> -- 
> 2.43.0
> 
