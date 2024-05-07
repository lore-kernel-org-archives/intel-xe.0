Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B96C10F1A
	for <intel-xe@archiver.kernel.org>; Tue,  7 May 2024 12:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AEF10EFA5;
	Tue,  7 May 2024 12:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4oDmtZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2338F10EFA5
 for <intel-xe@lists.freedesktop.org>; Tue,  7 May 2024 12:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715085076; x=1746621076;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3UiFtKixEsJedaajXI/0rLr5H7quQKMo9M1DF3p4kJ4=;
 b=U4oDmtZearWSPLhZeiBM40wjOiutGBf3n4aOr8rep49JxtpK/8Y9HcSy
 /ycJ8CCkUdpwkgfWr7mS/ge+AG+XPQ9ZNzIfFE/SoPXICwiUEgEklBkVK
 nMnkBagp3cQzKUciZ3xreNVYGYYRlOxCpMAkBYW+zucw1BQVoDYKlmLCQ
 YbBViw9aBeylh0SB+rF+/3ZBJO8+uamNanboBT1sI15gBVBN7vsPxXsaB
 teVDhjmBuRBI8zRpNZ4MtexBwU9nlsdrJ5jhtSTVNsa2zbrfefTqera46
 krXs9MYZVD98725ld2YNhYSHWAqBFEBx4lH3zLKbMzf6FN6a9zs9YHXTI A==;
X-CSE-ConnectionGUID: 7u8zq2cIRhS45UzL1BB8Bg==
X-CSE-MsgGUID: naM6VvQjQCeS9sxsJp42dQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10742585"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="10742585"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 05:31:16 -0700
X-CSE-ConnectionGUID: qTqQLbGGQtSRJ5Etv0D4HQ==
X-CSE-MsgGUID: 2aX7UPGkRteE7VUgMBS/Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="28474713"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 05:31:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 05:31:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 05:31:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 05:31:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfVLLW32pfyMqmVlHz6tZQrhlupybxyGQfBOV1zfsPhHp1Q6vL64trs7ElBvrRLImgE65S5+rLZsb4qvEi5v5XWQs++spw+cugd8m081+Cmx1bT0AVs5nFRrMusTpH8PGti0TMScCnGPYvWQN/eFQ5nvWmiceHT6TWKx6kBeQKsVzdVHlk22h4h+sTdTH0B6IvVRQr1YG5yhVqqLW4DN9rEemwi/iuFQcVkJCkJmrea81hFyEiAyTUplr2ih73ssgzNkpm3ZcYM+0Sx0M+xedW9wa8GGlkhMtpRzJjMM/wqjYRYUTEongGjmWl4DqBXU+dNA0bcs7bBXG/DXUYou5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQrZNJXcd0zGjmxFIKAZWTwD98wlw316sqO1ypIGuEc=;
 b=mFk4OuKfm2E4Xo4dvof4wVwapFIKnS3BAPQ6Ndu32gkAXntLrCTey/fupLRbWX6hqYEkT789xi10d5UAObnknc7Nb+7dVLbjQSWDUQ5OkiEcrOAgdcJPKuua6oF739FNf6mHiDR87Y528+gStRF7c1MXFU224hQckRvVhsgzdCVvke2cLdW3x94icslUx3/otg9aceqhOLGBNwOf65Q8VlfpRpOPZY/0BkzubFLZKtz2pq8pCGWvTxCHjTASYtTFrhk0HWsQ07dJaL8nncFB3xRQP/7jZFTvEky3OaS5RAmgpKV8pYUjrSCUCx8GlL4cJMWrryEu8fft8EEBm56Afg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 12:31:08 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::9461:3f2e:134a:9506%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 12:31:08 +0000
Date: Tue, 7 May 2024 08:31:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Fix xe_device.h
Message-ID: <ZjofCeC-0U-xVyAx@intel.com>
References: <20240507110959.2747-1-michal.wajdeczko@intel.com>
 <20240507110959.2747-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240507110959.2747-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY3PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::32) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: d2387f37-fb8e-49df-17d6-08dc6e919213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BbDvumzi/HqtU9srZOC3bLq12RxBOl6p5ph1LwP/EEa34XHp9gxa+7+nEJyU?=
 =?us-ascii?Q?KX2sY3tXuZ1LoB1N9FM56NvS2xcsOHH4CvYrPo+E+5Gb2wPt4lnkDRm3SNFe?=
 =?us-ascii?Q?lO6OutgMb+AgidcNQoXoHx6uMCrWbvBiz6j9VyDO+qCSo2rtBcs6C5lCavBU?=
 =?us-ascii?Q?rwIfK/slWFcixkKHlWrRVwjCsmBSdttyNSNvizySMl7mTJh2K/vy8NrOYxsq?=
 =?us-ascii?Q?iYv2zHzhCjy7+oAmr1Jh1lhLt7chM7hMT2qInPm4xbf5uC9O93qKBvkf2c40?=
 =?us-ascii?Q?sHQpAX3eE7Xp6lEd9b6n71c+lexzyD1W/d9+ve4d0wxBr0zHvSnPyQJs3OhK?=
 =?us-ascii?Q?Gdk2TzeMRhdA2Z3kx1nHls/sDFkef1zG/7HbdDOnd65RXrawrVFNa2yWWYGc?=
 =?us-ascii?Q?LUUq9pV2m/6R47ccmcgOeUgMIBnJWW/8Qhcpgy6L3iEseQdr81gzgV/o5O1w?=
 =?us-ascii?Q?j59f1hLVaV/dsVJdBjSeyIZYXS1BWIm2rlf2/Be+CplWCPFM+8Ih42IBf8ay?=
 =?us-ascii?Q?zhchK7/hUDCUjQwVHBuNLlKbCXJVZQYJBcKjk38l2/J5nR8Pp0jLS2qtAcyR?=
 =?us-ascii?Q?qRe9sDAjhRNEdxOyKj96kKbo4EKP7qqUx7NbuuBpgaBn2TqLphZ7LS+BAaiI?=
 =?us-ascii?Q?+OEKUlw9oqVwIlx9aKFW9kHTOH6S4Go9HNWo3QxS2zjVsxbbMPiztQB6RrLF?=
 =?us-ascii?Q?pdDfi4cmstj9No9moJ2khHAmr22P4A440WdQqxYh2Ou2vseLemGiJMEGOV7c?=
 =?us-ascii?Q?wu005f4Op5FPQfJK7HBW27VjEeoVJYBUG10BGfDLc+fpgYX9mzAl73t1nkhx?=
 =?us-ascii?Q?MANiuOL/O1bmSreLrEoCWiu7tmrqImn7mSDaEf27RqGp/645TEk1XG/W93hh?=
 =?us-ascii?Q?nxjzedTr4INAxEiLr34i3odaAeVmqfvjzCQfvEOu9YM0/oHY5NCxjDl11YXS?=
 =?us-ascii?Q?+wulJz+Hk5pfDAb5XeSSVhRl/IC8eNYF9Sjdfq5GO+5YD/Ul986KtlvJSRLJ?=
 =?us-ascii?Q?L+P9z61DO5oWoM4Xpo2k8wRXyctguM1CRMjLAz8EFew3nsIbopZ+YKbOjU1C?=
 =?us-ascii?Q?LY/viAPiXNq14kpmdMVsSg5P67LFojoHQjmNmoJFnlHrnkPMmJKPoJW9h/53?=
 =?us-ascii?Q?4YIIISf7Z5w8PeWyO0RHJhUQiMXa6MSrZ4SR7oSLwjblANZsfe6KEfrYj73q?=
 =?us-ascii?Q?6Wl751xdt6h+sE6NktsmL+Y8MgYjGWH217HPiKsy4uaJPFH6UMYFP32704VR?=
 =?us-ascii?Q?sjI49JAUqmkCUp5yFnUE6i2g6psIZszQvc0+hmootA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4gdZkLFSFOgrFtnGiD3bVWcMTvI+yZJZ5BYy+jBSCQXVR5ijk6N3vT+8RVnZ?=
 =?us-ascii?Q?8pPuGW2Hth0eP8OiGlP7dEk3sdcPOW11epe2h3KApjmhPZrjIxVfcdFYO5MG?=
 =?us-ascii?Q?hR8GQvpR9HrIib5WWOu7dAvkDdX4RDtJOoY7BaCCG340zb4bhFnpO7fvU9C2?=
 =?us-ascii?Q?TejMlP6I7+Aj6vojhIKySBfsGi1HLftN2eu2swt11eoQNnatjXBlFcN0UE4u?=
 =?us-ascii?Q?KipTN8Gb0To1F2bjEMhmxnQJo5un92lYWvMm+XLNzfvbqtxxx0ZtJQXVc8eB?=
 =?us-ascii?Q?laYpqimmBOiriIKZOyGIBZbolgsA0LwL/ttnLcPObKtNNu3R5PAVD9Prmyap?=
 =?us-ascii?Q?h+AvesAxTf0s3O5nbQ7d0Xp94lQ8Ymfk16gzvupE3Q3dXZtM0ODdunv+a3GZ?=
 =?us-ascii?Q?Wa9BbcjeaFC98/oF9xfiFYBPRQ3I1j24KjWjhLa985y8vST6nkGbc2Rzvavv?=
 =?us-ascii?Q?t+Kq39kkxTEPjbrbYjcS5zt7ssOGxAFSjwY8CVA96D3Aj6+tgHpCl6u8IDNK?=
 =?us-ascii?Q?M+u3nCQ1eQlBL5dCbLTeeeNE5W3LDI7asmPW0SOL61L4kRTXPgg4uIq/rpI5?=
 =?us-ascii?Q?i5+B3jyZEtZZqfyKGWFkRB6IRoU7cUDUkIvG3TplCKMF1c0P0494oTAf7dWK?=
 =?us-ascii?Q?5k0W749bh92gitrAUNBcUeJRgW1+tQ0NtKpZM+tilZcc+K+bFFcOIwV2QSjY?=
 =?us-ascii?Q?W2BA+LxMQCXZe0DIqNQApqZ4+/udAWcfSUuE7iKZLofKz1q41B5uYXzctPdp?=
 =?us-ascii?Q?SQe/9qwbXpjKGedXNahkA6dXEhuN127+BOK+7a1jiYTxueGFZHQqURJn42Qy?=
 =?us-ascii?Q?JRXEaqyj0OiCrn1KmAgVbZM+NPeYwOF1cn+Amj9QgFJcVjOESVwMxvtMNRKI?=
 =?us-ascii?Q?aNizkPi91RZWvHrs6dupH93UScMTLsud4BG+9tNM4kbpDC5F7BuFDcPcPyB0?=
 =?us-ascii?Q?hTw4fioe/kn6dVuKf0/Mm0g3vCnNjhR5DMZLoZ2PjMmSe/8qLkGjNUU92p+8?=
 =?us-ascii?Q?BiUwOqpF2snE2sJdMIlPfLVp5gVYGRkOQ2L9DnFjq/dLWhR6xo0ums2flWCw?=
 =?us-ascii?Q?EpUHP6eXdHdq7azI1y3Sr/F8rXUlv9Mc3nOMlC3C4NAlOtctsxU1nx+uDQ3I?=
 =?us-ascii?Q?7Ol0aIprmqYpEHixzIe7bGA065675ujGXF6SMvpVqPk9a84udCxOZTrO1ix3?=
 =?us-ascii?Q?b8JxgPgb2f7jW93u79HtvPbuixoSXftOGWXgk+Yz55fjASy4zWqepK1kTPGR?=
 =?us-ascii?Q?TtvZo8v0IsuZJj79ewTh2isXbyE9bg1nLYDYbnWlN/hTlSuf0wbb8bS6IqMf?=
 =?us-ascii?Q?QAKqWJ0zGEqPxXWS9SgmM66SJ+GJ2ealS63f8BGVk5Bks3o+xpgbXNIQf8y/?=
 =?us-ascii?Q?E85ZbhcYge9pNNdXrMJFA/+92RiGBaFU7EN5uq4V3gSeWYThyDwB5ZBIks/v?=
 =?us-ascii?Q?lSszM0NkZT+08NjyDKRKvAvWlyIicn/b1PGf+kjFWgJ017aWNaQykNnGOacd?=
 =?us-ascii?Q?/pAKRrRG+3xxtJmXTEy7gHQW/jlkFHlV/OGjAEMwWPMfjvMaPYaBaCoTcTfl?=
 =?us-ascii?Q?5c95FE3jIPcB+5aeL8NAbS9TzFrDmTijK9NVV7Xb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2387f37-fb8e-49df-17d6-08dc6e919213
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 12:31:08.2211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++uHRXIa7bjSIwKJqpyQJ7kqo9LlWdBLcSdkw0VdTuranrAuSJiYSFfhKbdukQ+HvBagr9V1nXMUaeiv21xFLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
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

On Tue, May 07, 2024 at 01:09:59PM +0200, Michal Wajdeczko wrote:
> Some explicit includes are needed only from the xe_device.c.
> And there is no need for redundant forward declarations.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 ++
>  drivers/gpu/drm/xe/xe_device.h | 6 ------
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 05c28314b748..b63d98872a41 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -17,6 +17,7 @@
>  #include <drm/xe_drm.h>
>  
>  #include "display/xe_display.h"
> +#include "regs/xe_gpu_commands.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
> @@ -27,6 +28,7 @@
>  #include "xe_drv.h"
>  #include "xe_exec.h"
>  #include "xe_exec_queue.h"
> +#include "xe_force_wake.h"
>  #include "xe_ggtt.h"
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0940ade6a352..bb07f5669dbb 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -6,15 +6,9 @@
>  #ifndef _XE_DEVICE_H_
>  #define _XE_DEVICE_H_
>  
> -struct xe_exec_queue;
> -struct xe_file;
> -
>  #include <drm/drm_util.h>
>  
> -#include "regs/xe_gpu_commands.h"
>  #include "xe_device_types.h"
> -#include "xe_force_wake.h"
> -#include "xe_macros.h"
>  
>  static inline struct xe_device *to_xe_device(const struct drm_device *dev)
>  {
> -- 
> 2.43.0
> 
