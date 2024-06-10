Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09269C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 19:45:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E55D10E134;
	Mon, 10 Jun 2024 19:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/MzhNGG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C3610E134
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718048707; x=1749584707;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=85EPffs2jUFgk8AIloLybr//QPkQUVDWPx3NltR1MGo=;
 b=L/MzhNGGMH+YgedA1Fa7OWqOaDKECrW9dSce4KSB6h40vuqgLODbz2i9
 x5RQF2f9VBdwsns3OAGypkqfA3rk6u/aHktyXcpqFQHqwjJdelQAdGqqZ
 9gND7vKDHk/9SBXPtCSzfCgIyunehS/ICkD87BSEX4ziKs4k5r2csfurv
 rs2Mu9QrcK7b98s2NZ8/631Pb12TVs/rA/w/w3DB5Z7Ne7Meb/SAr2T4U
 99U55X/5Se+yR/kmq4Gi9TD3DQCAYxO8HVeLylhrWkOxKXaWQu7ipdTdp
 fNFTCd3Wuq01ngkBjPWg/PLjKGUXcnijXmC7+7LcWWS5AiSre/4aRxQV+ w==;
X-CSE-ConnectionGUID: 3h3GgnyKSZqrtppD38poBQ==
X-CSE-MsgGUID: upVfDL/1SMqwo2u7t/ndgg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14882219"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14882219"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 12:45:03 -0700
X-CSE-ConnectionGUID: lAGy/Lp/SnKpmHkY5L4mrA==
X-CSE-MsgGUID: CfJJeAlTSIevqe0xEpzJLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39282612"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 12:45:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 12:45:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 12:45:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 12:45:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJTe3YSDn3MyKIjpGoYg2bSnU9humWXEL8SA6udNaqXUJMDHoeKaOTNr1SU93ZtNvST7fpqQ5QjIGkEwGBrJUC85kEYA9ankBX6ftv501Rg8JkpCQipDusEXYOmMNvAW3ZWylocopRCwBHnf5CQcU2AMSvdLhylSYfO8blZEhC1g/FiMTvTxRbR8eR7gcd8Cf8wuuGP/LRAu/yCYEGlfVSYIXReenbT5k/IaTiQ725yNBW83SZjCi08EOd4Mt3zAZVRno0Fh8EEjUREIQNmW1fBq85MGNSdKJW13+daLJGRnzaX39PVe68hENuBPCCh33q4XSZaWGxz2rBU4p9U8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScJtVjUVTSp1qTTnU66zf/9LyccxYMv1byrVv57S7HI=;
 b=EYr2DiMddSTn+DkRofzlJ65Wdu4o5XFz8Ph1mDGJgZIkhgGFjuRJti6Qx8qbjc4gCdQV5ntlk1M3E7Dnd3FXd9fFSXhfN97lZH22CRR2QHwtvSzam0jTWMom/WpmuuFFXQwr62l2GtBqKvTwuwKLAcYkrPAiB3O9OuvGeEfxXZgkUTt1VD2508fH2pQM9HIAOkf0IlEN9CCr8zBzsoy+6hC97SLuQHyRABkopJvDb4BB+lRF+dA+MmoRXFWOh5OEOTATJmJgyStZMjRaOx7o7G4BX2hf6uPi9zelPuXGaQj1srEAb9TGWwNf/FCQZLreGA7Nb/V/n2oonhxbVTiaMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7961.namprd11.prod.outlook.com (2603:10b6:510:244::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 19:44:54 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 19:44:54 +0000
Date: Mon, 10 Jun 2024 15:44:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe: Prefer GT oriented messages in xe_force_wake.c
Message-ID: <ZmdXsxWLR4YFYJRN@intel.com>
References: <20240610183757.1812-1-michal.wajdeczko@intel.com>
 <20240610183757.1812-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240610183757.1812-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0073.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: ad2d07ec-a9b1-40be-4d4d-08dc8985cce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TjvsogftyzmANWXCxMoy0/O30eZ7dNx4yyhBWZXfD1jOBu7y7a+/TRY4cC12?=
 =?us-ascii?Q?58aNnMs2HBany+mOcEiaRUvSuGbxMUDAR4ZCfVJ99qGGcTM5E3idFxbiSxya?=
 =?us-ascii?Q?9i9Ct5p4PVTjP1HRETDK/dyNWlOAiZPHHeWjKZ/NRgn7n6x4Eefazfxbh/Mn?=
 =?us-ascii?Q?cbCBe0GKGA+s4DectcpyHNaHz6wdaCIFEH6ayWCvKEE2h14TZBSWc7xs6WKa?=
 =?us-ascii?Q?NIPRSidZyfxHuXwEK8vhPja938i4YUl1iEfl9D8VbnRMzdJbCMGONSOb51WQ?=
 =?us-ascii?Q?pptjrIhGwprFMojAruc6U4Lbb0hgcFBgZ+ve4ZCHrol9Cw1nhqn2dhPBFLVK?=
 =?us-ascii?Q?bR9zqBK8DoZS7Noq5dfU+zUpJsS8Jy9mXotwPQAANNgS1r8WEnHeNlI5ReCH?=
 =?us-ascii?Q?u08qwtSoijsLXaNGh1aYlM8uzOJGNHjv9dmd17T0bGPunqSfdrGMJFEYE4Zv?=
 =?us-ascii?Q?sWuu2eqUjsYitYcMTmn+z2H6fxxQkKLjMkgyGbvheCCq2yiwvUCm9nD+mdjd?=
 =?us-ascii?Q?gnJwoWCQV9hR92oJrvrt3cZYvW/eAI8hZDkDVeIyRWpty9d0BPEJBfOz+vsU?=
 =?us-ascii?Q?CxBFk74lIsJDV2i8xcFzA7gvn9Lolrmoe2FzJfkJP2Yo4okCOvrLEu8JlMIW?=
 =?us-ascii?Q?R0BRmUsWAEEww3FX4nlVAbZ3OFn6Ir0V5ZnzL7gyrO0sJL7dP47bXu1RYVLw?=
 =?us-ascii?Q?yfILxXB9/Kq1it426Rm7BHOAUwURHIwip/pLMx47R56QYZzSNl8VdpgFIoqy?=
 =?us-ascii?Q?I2bZJASRcZCSsy3qz+TbhwEQ3Br0DpFYougmUXtevatJyLVNQHkUDrflCpRA?=
 =?us-ascii?Q?G2a0DNlBIlDo4C9uDwkvmJ9ZuJOi/jSjEyvwW/jP1IGda6HZRH9ottkM/eVv?=
 =?us-ascii?Q?f/C2nDeyV8rJEFOS8HpPZO9rlEhQFc1splqvtLbH3Vq1D2FmF1zXmtqknyD7?=
 =?us-ascii?Q?NAjzN/Vf4PRx+aFTsQc8H5vfLf1WiQtQqswKXzftvPHYOR+IlqxHYblPHlkn?=
 =?us-ascii?Q?AV03R3cXaU8wAxhmgm1kyj5v1At3WeAO9s7syBBw62DCcvQlpeVe6BAuChzj?=
 =?us-ascii?Q?4ldRZCv6QPJHnfzj/ejv9+onFi2vupqjPOnVkN0wTtXFxTN1p7yVOzPqoKPu?=
 =?us-ascii?Q?b87QWOPitJ5YdK50UeTUR9SCvkWlGaKq1/NRk2kyDBYvhXfOjvU/hcFtOpT1?=
 =?us-ascii?Q?sw0XaBitFtymDxM3K4dtVQQMAY45IOK2ic4ADW3IfSAxv2qGh/V+KF2nlzye?=
 =?us-ascii?Q?7lcHJ4M/O/IU44ExfX2rmrqX4jV0Rr6pq76X7hYVTVJt8zWERYewyMtAsMUY?=
 =?us-ascii?Q?L9MIzKiBVjEQ0arc3WrLRIUh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ifH41XtafAqVjFhAEcT/Nh218tWG6IpnzxWKeO0IsOgPX73fqjJmJa0Bacyv?=
 =?us-ascii?Q?6hxJbFeAeOezfAur5BVqegcoBnaK7UtQ0wMya06Cy2uKzvFRpXHszcM9n7ec?=
 =?us-ascii?Q?C+hyLYeM3dQtnlS0u923O/2cojlAQV0Lk+tZL/nzG9n6XQgRXe8cV9bBY5+I?=
 =?us-ascii?Q?/nme7strLMQhRrBEXJ9I4d5il6geY/Z2zpXuizMOAUXViT6z7uXk1ArSpNQ5?=
 =?us-ascii?Q?hAmh8yh4REqWqF51ODmyRQw2z7/6QopSlPWUl025H3pYd+mTz1QG+9OYKwy0?=
 =?us-ascii?Q?LUTz9P4eJeefaFuASgNHroxynVY2VmidsH2U3L/Ct/Ylmu/PU5U1oFIysipf?=
 =?us-ascii?Q?aHlrIv6osYqecKK9MuuwdKNteRogSEhxRRXH5I7ksyk2bIjqd69POl/YLry6?=
 =?us-ascii?Q?b1RdGKsG0wDBa00n674N3C+eSa2V13ZdOpRQjipg+FIFyMdepo7EYh0luRRk?=
 =?us-ascii?Q?fQLB4sJdlB2ZqbQhcESZlwtYjHtFjU12YtzoPr1KS0KHJs4MvIsnELem+pYh?=
 =?us-ascii?Q?4mqZgh+vfJWzFiaKaEdFxQLLz+EH4pTutDxKHmWn8i6y9+BO8VqcLq7uKRII?=
 =?us-ascii?Q?Y3FjD8KvA1/qjsWV1yiOHdm5fGCREIrspwBtrFAJ2DKt+QgWLE0G6NSvWjaj?=
 =?us-ascii?Q?bBb+ycn5iZsjMxcncuOVvTS+QIDLPdo9lpQrwelIXw128KbuOKFpRSzG3API?=
 =?us-ascii?Q?FMD9d042JfMwkM0kyfVuJgeBvHnnjmaUbhE3fSn4JgRiRePwGZFc7QvtMUJI?=
 =?us-ascii?Q?+yJUGtjAATqMEEEgY9OVO9JzpzCH2+kfISVK++xa22DPYVHPu3qVddIeqWZG?=
 =?us-ascii?Q?Nbrpn5yG/q5DTeH/bReGcl+aMYEAiJXlEYIw38VjXbD3S8bjTBU+hp1vyI2T?=
 =?us-ascii?Q?/9sNHAASOFPc6dt2GVnxHmZmLrWcFWaSQe5zkBPoOQj0eJYl6kCBln/psFA6?=
 =?us-ascii?Q?riIKYP2y9Y3uucVzf97bAMzz/Et01L+KgdwO2q8WLcuX7DPcAAwEowWhO9Ov?=
 =?us-ascii?Q?ZG5BkqRIrJZccGzMUDVz+uhOyO4N++X4THvwahwcLDdC8Lk8kmkzDuG5LRAN?=
 =?us-ascii?Q?KboviGNNCwr1bUSc8/DiLv112Gh5yvzcDXD6CZIlUj6E3JZ10aaQAcs1gArH?=
 =?us-ascii?Q?QTlLWJZTSu3rxnJ0CbIekZwSiWv/v1+fP9/gp2+kfRhAABJb3vHAI6nV71px?=
 =?us-ascii?Q?bnppWqfQhGIXuQpK5jUxm5R4WN6eiAM/ZNEKpCOIdL5o7CawyRqdqaW23A60?=
 =?us-ascii?Q?KKuaF0nP7Pfcdv8i6UVPOpI2qafUKflsRi3243zMqh6HDraBPQX9sjyxo9mI?=
 =?us-ascii?Q?VCUYMw+598nVye5KROzWfeteYX9n+aWNb1L6MdhFAsUvtJ8/ohYqkemFXlwi?=
 =?us-ascii?Q?rpFaFUZsg2NX/xewQWNYy7dcFwoqsDssFQ1xrxIxKzdVLX28cjIT1mUVtJB+?=
 =?us-ascii?Q?WF1CBdVOPWbRdEPf1Gpu809JmKrK/Vq46rUKi9cNPDu6WIBIZ+P7IKsbEOJ3?=
 =?us-ascii?Q?dAWNKifhj2Zcig9gPgP7zpyMnwYUjW+WFen49RRMMgsNIW4IhfZ/QwYWJUEW?=
 =?us-ascii?Q?K1ZuUfPV/uD0/HbWgcY/Nmsx4duDVdK3f9qlrs0I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2d07ec-a9b1-40be-4d4d-08dc8985cce3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 19:44:54.2768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOUS8SeuJo8H4lIQLsrfc7ZMQOtnxxBhwgo1iAtSb/d6u4z8F+37Oef7sI1HuYo/SelRzurzpuuOY5QKqpWiEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7961
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

On Mon, Jun 10, 2024 at 08:37:54PM +0200, Michal Wajdeczko wrote:
> If possible, we should prefer xe_gt_notice() over drm_notice().
> While at it, undo line split of fw_to_gt() function signature.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_force_wake.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index b2d385daff4b..2497f0f65aa0 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -10,22 +10,16 @@
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_mmio.h"
>  
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
>  
> -static struct xe_gt *
> -fw_to_gt(struct xe_force_wake *fw)
> +static struct xe_gt *fw_to_gt(struct xe_force_wake *fw)
>  {
>  	return fw->gt;
>  }
>  
> -static struct xe_device *
> -fw_to_xe(struct xe_force_wake *fw)
> -{
> -	return gt_to_xe(fw_to_gt(fw));
> -}
> -
>  static void domain_init(struct xe_force_wake_domain *domain,
>  			enum xe_force_wake_domain_id id,
>  			struct xe_reg reg, struct xe_reg ack)
> @@ -135,7 +129,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  int xe_force_wake_get(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {
> -	struct xe_device *xe = fw_to_xe(fw);
>  	struct xe_gt *gt = fw_to_gt(fw);
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, woken = 0;
> @@ -153,8 +146,8 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  		ret = domain_wake_wait(gt, domain);
>  		ret2 |= ret;
>  		if (ret)
> -			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> -				   domain->id, ret);
> +			xe_gt_notice(gt, "Force wake domain (%d) failed to ack wake, ret=%d\n",
> +				     domain->id, ret);
>  	}
>  	fw->awake_domains |= woken;
>  	spin_unlock_irqrestore(&fw->lock, flags);
> @@ -165,7 +158,6 @@ int xe_force_wake_get(struct xe_force_wake *fw,
>  int xe_force_wake_put(struct xe_force_wake *fw,
>  		      enum xe_force_wake_domains domains)
>  {
> -	struct xe_device *xe = fw_to_xe(fw);
>  	struct xe_gt *gt = fw_to_gt(fw);
>  	struct xe_force_wake_domain *domain;
>  	enum xe_force_wake_domains tmp, sleep = 0;
> @@ -183,8 +175,8 @@ int xe_force_wake_put(struct xe_force_wake *fw,
>  		ret = domain_sleep_wait(gt, domain);
>  		ret2 |= ret;
>  		if (ret)
> -			drm_notice(&xe->drm, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> -				   domain->id, ret);
> +			xe_gt_notice(gt, "Force wake domain (%d) failed to ack sleep, ret=%d\n",
> +				     domain->id, ret);
>  	}
>  	fw->awake_domains &= ~sleep;
>  	spin_unlock_irqrestore(&fw->lock, flags);
> -- 
> 2.43.0
> 
