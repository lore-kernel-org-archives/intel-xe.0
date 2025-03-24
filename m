Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4660AC36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 15:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AFA10E3BD;
	Mon, 24 Mar 2025 15:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fVf955H8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD96810E3BD
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 15:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742828542; x=1774364542;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dfxcVF3gAk9D8Ag13l3Lq48TGpGP1H/imwmDwQBRwE8=;
 b=fVf955H88DoHZUSXlOhovOXufhGNJ32caV8czR9306FZkPeBXglnij0T
 N1JY3jczzwDFaMEBqTpnyzBJiifj3lqcIxTbSVxRw3phQv1xgv3yMz+Vj
 NHLJdUapWVsQkFCrMWqEhvamov2I/5BlIV8rxE4iggt/zRs/rICh/NxUs
 g5KiFVT5gyg6U9pio3tBgVXPOT57bMbkOUc9VF0QW5xX5f4m4y8u7o1wO
 qGfxECK1W2BNFI3bFwrFIYdm1T1zU4ARqPLpnmQU0Yfgu3FT4mLXogwJ/
 b82T+STdm6SDS9se4hRiEjI8c7Am6w7OAnPjbcNRSLYAJOMNODaHDXhMR w==;
X-CSE-ConnectionGUID: 9JorPSVpToy4PA88OYlQzw==
X-CSE-MsgGUID: HyAqF2wpSRmfBbDl17aEwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55409833"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55409833"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 08:02:20 -0700
X-CSE-ConnectionGUID: 0QKozOt+SxKmmHkUsaBjyA==
X-CSE-MsgGUID: j7MuStBzTCyfYhadKlx4Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124236167"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Mar 2025 08:02:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Mar 2025 08:02:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 08:02:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 08:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd1EbmEvMc4PWE3ayOFoiJ6NrLvnBFIx+feNn5dw0aqCLrT1Mtp07HeJS+KeezkucdknnbSTs+rGdwaQUEUPqy2i7KunuapLtVGNCMAqbHdpHnNcOVpGWMCcrR+oS4evoGjbobwouGElgjcsYwA+rYH/2MzVXlwUa40R10e/2CtWkCtKjvpIS4iK/vfFxJJAzXEot/cdrqbJ3PA82XTsKZ23ndRGIe0IDjQfsiUn8pYReGSzMm5u8vrXTteEd+xt51zxcVQ9z/yFoxKDR+QiJYcvoYHm690wzz2K8Mv5yP/QhgK93f8TLi32Q8Ly7G0bWlB94YRrgYQIkUtjGOUVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZE99kwSRwqrC8QO+KeLmrffTn+QCfFfWzfJuySrxvsQ=;
 b=hBWBcaREu4fqSID6Vh5zKZNaNYmR4LOZcWoXmI6t56LvOm9JrNKw/kAYlhRcxaUg7PznrpLkW08G/SaJdUf5T7RxYmyw/h3nMJIuqvdmQI7FckN244FiTUsyxFEw/wztuwCwKNRVwgQJHf7AM2B1HuqMg54zdiMovNh2EYpwoJiE0JoLRG9hpxI4wXokABCsNsTqskQIp0XEX1SdsE1drClAW7uUhgyKQpq8VhrORxMYezxkS4zpBUHJp44H1Wu7VQ6Bh1MJqAzbx7Ece7CBD4i0GAyira9bvf5tQYMdBC96ACH+W6d2Br/n6wveKkoeWUcp/0aOivUw9umQfpMkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 15:02:01 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 15:01:59 +0000
Date: Mon, 24 Mar 2025 11:01:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] drm/xe/debugfs: add local forcewake_get/put funcs
Message-ID: <Z-Fz45Dj08sHWrUk@intel.com>
References: <20250324110730.2521805-1-dafna.hirschfeld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250324110730.2521805-1-dafna.hirschfeld@intel.com>
X-ClientProxiedBy: MW4PR04CA0205.namprd04.prod.outlook.com
 (2603:10b6:303:86::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a84571-a615-42ba-7066-08dd6ae4d382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aO7VdPO08OcD+B9NqSoE6mtROuxO+lda34q4l5hwP6h/nPe9cbRBk93qH/Ko?=
 =?us-ascii?Q?Gw3NlaHpg/HsOBVgX9MCjJJ7iR1T6XbksSCFf/nEtAaqSdYiHVDFSr7I/ST2?=
 =?us-ascii?Q?D0jylGhnkePJtH+y3+wkS7s0VqA95DWWhywrDOeOiANa2YONfUScwy43VL3/?=
 =?us-ascii?Q?DNF4uAp/D3/jlaocppIpA2NHd8ZYEsqo23DiMNc4dTpELEjZE7Cyb4UYzGuA?=
 =?us-ascii?Q?acF3pWgyK4kM70Z6DqOtT3Jsia7SgqoSjbU7WjNGApN1FFQi0GApPq90uS8Q?=
 =?us-ascii?Q?kTZp1m7qje8acmvXa4b01JNGzhF0ZsC6hmARHSthqHb/ylTdMJACQZBZLBeZ?=
 =?us-ascii?Q?jMtWElUpMFJPHyIwyl77U9wrAleHF8Qe+bP8B1wXHjX3j+TIAWAmbSQI4r2U?=
 =?us-ascii?Q?+HlyQOfcEOc9g7TTROiyeD7MUGsmWnCzwlRj6hrnxyde76dfUG5w+43z7adn?=
 =?us-ascii?Q?+j4ipZUBAvx19MRsWzTTpi9KOlxE5QUPgcnMomJmgP3L3+SwBNXwd7Q6xGP5?=
 =?us-ascii?Q?i+rN3TL6eJ+wCWFfvSSYT5zcVnenMzl+PVkCz3O72UVJZJETECybyfrmqhz3?=
 =?us-ascii?Q?GZ+kgAcCsufnp6WZd20OZmR9Gl8ziwYZkzh5a8zMehxOtmoeVcD+eZSg4qWe?=
 =?us-ascii?Q?zdFy8oRD79uFBlhDPGYuzfZBBwuAH97dnpEUBZYwBaIrWUPm+8m2HjQysUXN?=
 =?us-ascii?Q?+hG63qolF/EVucIxexzwH6gTex0qD6y42CdnL8i0gEpkhw5E7MCUnqoqMau1?=
 =?us-ascii?Q?FgaT/NNh/zKyJqy/u0OfXMzZ4zHgn5VQ9wg9QIPBrhkJkQO0clGgmNusjDiV?=
 =?us-ascii?Q?J0i9XFbVuA05FaQYusXBxUmBWr3ltMn9Qw77gYWP5R0xyP7INCMsXBrB8XCR?=
 =?us-ascii?Q?7McP2G8PtslmgjY5+5NdO0J77qMm7C6lPah3BNgZRcIUQwKj06bVM/rLQ/5Z?=
 =?us-ascii?Q?bRjP20EGBc+bxWq1jq7lGMzDv4pCApZIKJvb1CvwhTwpBAz7kXntAo7FWB6L?=
 =?us-ascii?Q?pV4v/KhZePAragtun9c0/eMU4wJ4eIMuZnPOhTqJmGR8XJZGDaL79GzE5J5g?=
 =?us-ascii?Q?0fMONgFKBKJEDizw3kd2wz8PyVVHnkCMLqcqTzzAqDAVNL0rj2cf/+AhOnZb?=
 =?us-ascii?Q?VmvwoJT35JQiNJRGQLYLAjO5zg8UCQHvXWLByWB7F/t8VrC43YxXHrQMPzw0?=
 =?us-ascii?Q?PjE0VZ++jrZsQEYepIAiENIbegaTZAHcbbSNldcdlUiXX0AxBiPRAfH2mdn3?=
 =?us-ascii?Q?2BX56r18DUumQ72zr8INcNxz/F2f4sU4lRF7uX115VX/VixRCvhBBoctum3D?=
 =?us-ascii?Q?W/vWYYmhzBnjme+1CEotReHYSk5z8dXCfdGgBT/8misLlCoiGbR8rgy1ixRd?=
 =?us-ascii?Q?J2NvbCRLt2fnr2ctxUmQQcgB70Hj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DJ4FJwMyaZJOZLi0OpFkzfayarGdFbvfCgTQek86BwtopZIABOLzEv/xfFJP?=
 =?us-ascii?Q?SUcfq3BiP6xfInWQFqWNw0SN79cyxaMRMuqTTe1rS2q/Jq+awK3W/ZOn1qfq?=
 =?us-ascii?Q?Y70j0/f+LTVT4LVEIDZl+R7G6Jr45X0Inq5Jr5KKxxt1Cuvpx1PMz6Z5ab6w?=
 =?us-ascii?Q?k9FjEZawWUyUEmyFABo9aldZMJR3dnJ9Po2qH58YvwgoFiv3NFrbNgaDGPaI?=
 =?us-ascii?Q?DgiMrL8TUL+0OkIoDRCchkNm40GzMwBb/6asLc8kUHAChi3BTKi5uLyJ9NZr?=
 =?us-ascii?Q?cW6/U1jsOUa8M8jTRK+uPGSJIkQMz74/CuLNznRbEwdV+XZjywbrsVAveqar?=
 =?us-ascii?Q?TaItrImyofJV/FwF6WtCfi6VYg/Sduik1RoF/cZxgc2LHro1VS3vFvtsyvHs?=
 =?us-ascii?Q?4ygkNiht8rsmy0eBAM0wWjdvmJhWV2ImvuX7ENx713o0AzoqibBRPwYIwSHK?=
 =?us-ascii?Q?o/6pnv0G4ABhRB81Xyn5+Fs0gp7hUJvRSAs+1SZaBa+Lj2iTXzE4bCzLXT0x?=
 =?us-ascii?Q?euZDJ/XJp0VOzIxfqoL1DhUhbZ3rm11Syvz2maf+BI42Chl29B94b2CPDp9i?=
 =?us-ascii?Q?o6CEyIwji+YLd10G9umfk/SGoTxN5wNB3Avt+qAuOr4uLHYLcO3CPAOfzncx?=
 =?us-ascii?Q?dgBxZP85PmFMvQaWFZFDUKiEdSmvWzDX9yWS+fL/rwwAo5l8y9VNo1EllPMc?=
 =?us-ascii?Q?r3e6BWrO0fzZq9rrwrCjqYwwnoL2YMpAKb1UBqUXZhE6KashCOWQOUTFRZ9j?=
 =?us-ascii?Q?8baTRk63wx95LBk/I1cs6JTfdkjjl3fou6+NejyQB+28tiRbutUIGRtE439k?=
 =?us-ascii?Q?3oP/k0xS2tiQCOKmliJYqOMQW2m+x2lOzBH3tmDlmaXyBZUtATq09O8c2DYT?=
 =?us-ascii?Q?HqKvtIULoNdbVQx0ZIdGihQbZyP51pPQ+KZkdTRVEAijalMww5n+cFZeaBX4?=
 =?us-ascii?Q?pA5nHf3Vuj30VgbYd3auuL9c9/htJmuOeON5YVD6NGcRpS+/QXElw3z6C8E3?=
 =?us-ascii?Q?hclv+tVkS7Lzv2viguwfgMH8QvgMGeWzE9Ii5yrN93wVO2ANwjztmdzbYjiu?=
 =?us-ascii?Q?U3scnwHfQASc5+kA6Ba2+9MT3z6umbq+VhwJEyaXtPAbwFqegiE8g7wv2ZQN?=
 =?us-ascii?Q?HFwqbPj/pV5PK0FRVSq7qrNyezYMH4wd9lMFXuVfiPlPZDitqcM0h1P7K7wz?=
 =?us-ascii?Q?uIbcnWDLVA5NRJlE2KT7pO//Ff3zdO0QaPkEiSUyDNccxahzxmJDnnXnVa0O?=
 =?us-ascii?Q?EQfsJbLve7bl2EfUbdkilndNBPsVHZpAkMR5eUQC/Hm9mR/kpO+ZiVvXxSku?=
 =?us-ascii?Q?zIfPiOKfXYdMj7p6ac9Mz8J32KAJ5sdmcYt03JG9r3sIVf0jLnjgcnYYpa9c?=
 =?us-ascii?Q?rF+8iKerdJz6Ail/nQFeAHIsdsjkgryGXynb7yOSa1lGOGZ7IBavL1TNGr1n?=
 =?us-ascii?Q?zjFKkG70nRyEl2DD/m+fSJe5bfLdW0dC/glWBPpXlxgZCcoc8lfd+FKBPTQ7?=
 =?us-ascii?Q?x7uAVlCizgWR+Q3nuUvAmh0zguI1QcmLn3JNLIuTDbDVeBRMtIMymTnRs/MI?=
 =?us-ascii?Q?SsdsfZDAuw8OTe/8xdmCRUaY+3yvu/pYo2a4evyeP3V7pq7t47pubYwo1/Qe?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a84571-a615-42ba-7066-08dd6ae4d382
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 15:01:59.3552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEXEogkS9b6dL9Bsdk5cpbwRi4qcXJgLAX05h7J7I9jniM5hdirVEVRPf4u8vvrAsl9NpXfDkIr/amRhAIzPHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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

On Mon, Mar 24, 2025 at 01:07:29PM +0200, Dafna Hirschfeld wrote:
> add the function forcewake_get, forcewake_put. They will be
> used in laters commits.

Why?

Why can't the later commits use directly xe_force_wake_get instead?

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> ---
> changes from v1:
> 1. fix according to comments,
> 2. support steering for mcr registers.
> 
>  drivers/gpu/drm/xe/xe_debugfs.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..e60eaefdd4a5 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -87,9 +87,8 @@ static const struct drm_info_list debugfs_list[] = {
>  	{ .name = "sriov_info", .show = sriov_info, },
>  };
>  
> -static int forcewake_open(struct inode *inode, struct file *file)
> +static int forcewake_get(struct xe_device *xe)
>  {
> -	struct xe_device *xe = inode->i_private;
>  	struct xe_gt *gt;
>  	u8 id, last_gt;
>  	unsigned int fw_ref;
> @@ -119,15 +118,28 @@ static int forcewake_open(struct inode *inode, struct file *file)
>  	return -ETIMEDOUT;
>  }
>  
> -static int forcewake_release(struct inode *inode, struct file *file)
> +static int forcewake_open(struct inode *inode, struct file *file)
>  {
>  	struct xe_device *xe = inode->i_private;
> +
> +	return forcewake_get(xe);
> +}
> +
> +static void forcewake_put(struct xe_device *xe)
> +{
>  	struct xe_gt *gt;
>  	u8 id;
>  
>  	for_each_gt(gt, xe, id)
>  		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	xe_pm_runtime_put(xe);
> +}
> +
> +static int forcewake_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_device *xe = inode->i_private;
> +
> +	forcewake_put(xe);
>  
>  	return 0;
>  }
> -- 
> 2.34.1
> 
