Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB61CAC592
	for <intel-xe@archiver.kernel.org>; Fri, 19 Sep 2025 21:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAAD10E25C;
	Fri, 19 Sep 2025 21:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y5RyTExN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FE010E25C
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Sep 2025 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758316963; x=1789852963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+6jTpgfsVeFthzZgFdJLadHd1uIbiuxXPtpQeQiIqp4=;
 b=Y5RyTExNJ5Dr5J7WjZ2s/jkVjRDN8uPQVPsnguNt4luCAukshPNJQj97
 o4Kp2UZzLQE3ud6Xdf+Qb0yPjJs7fgSF+XQZ7M0Tcq3Ps3xK9Rp59V+9x
 eqHHbPWh8CYBBAVprJMkOIjxOOu01aWoP27wvlNbG3G24cuNlqXcfeVxH
 3P2eKH2VK+7Bl8jqw/XsfeKgvyVVE/ixzyuppAkqhtY0QTHNeaxTkXJiZ
 a7HYbEQwFvC+JkZxCFIalEufQmVLZq6/eemEA+12QhO5DuBTuvwH5+mEQ
 hjW+wYMiKPwbuvaUSusNnCwzkIGjIKMwOzIc27O7r7uQnWfEYAWx0pkbC A==;
X-CSE-ConnectionGUID: TaZD9uSMSM+yHdvX88d04Q==
X-CSE-MsgGUID: vq6STHJ1QtWf+/tQgXvxUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="63300891"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="63300891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 14:22:42 -0700
X-CSE-ConnectionGUID: bO3wjYn+SVic9gfUL7GbWg==
X-CSE-MsgGUID: qzzVPz/OS66cF3L5z67UGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="206680231"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 14:22:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 14:22:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 14:22:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 14:22:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehXDyT677nuQAUNgUpeqsSHITyWEkIUf3LLRR7uEcJTsm02A2x/eozYBxqloq12qB3g2KIiTu5P0kNUm/ZfUHM1vP3V2WpeYUwfcROs+G/nakWWDN19LeaLgmxjXE7ApgKeDf09P678sioCm6gqP6HaqsoGtNrpNQbFxYTEAcRoK9EcdUbsGGe7hFIHUVpmY5UHeVuZind6GmL9KrgGhAgvlSsq+ia+e5mmvWcwj1Kv2rmXfEDSiTSAaQLat58cJb4cLZMXX3AJJDT7gY7gi5RDk4uXfDkfnD0fr0ViIxShkHAym7yMzl+/R+7A5qb1qMP+iaUI34QSeOe0aHGOwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvl3tVWsoig5Gv/yn9mUHbKIrxntflBggey68GGVxDU=;
 b=sHC+pyuu8BkE3UDPHHi4j/QtdVRX7pXcUGwo0QEpGS98AoX062NVUVatqeKaJUpLaJGeobR7z59RbCKDQLwWl//e8AIOLLzA3X7hOPqgjjoW3db5VP8GLeXKjHROl8LvRhuGkG6teiloWvUNigk6O+dS8MH2rWQZgRnSWolsILM3tDKY1GX+1Ad9iJBDHZvRsIN+0VRzQI3gQ88DatU86rmeRUAdx9djqua2U5issVSzcy0wnnvOA0p49spaQbUR4vGcuZhg3Cu40E+EhL7eAJ8EjX8tXQkFJxbw/IUhXmIzHu8pqFDmbqhcFYgdE1+M+Ll9qXD61Sits+DueWUerg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 21:22:37 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 21:22:37 +0000
Date: Fri, 19 Sep 2025 17:22:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/debugfs: Make ggtt file per-tile
Message-ID: <aM3JmVNTYkQ4HRGb@intel.com>
References: <20250919160430.573-1-michal.wajdeczko@intel.com>
 <20250919160430.573-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250919160430.573-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d6925e-46f3-499e-d63a-08ddf7c2a824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fV15iuh0D8R/VLMul7QEq0gcE1kplLdGUnx1dc5s8yVpW/8j5gO3JRk44rTS?=
 =?us-ascii?Q?IG6USJWwIIB/jHnWjztG0POKoD4E2a4CJK1CgBqV2vwcHu849xbsV3Bsz225?=
 =?us-ascii?Q?+XCGFJgvyNlz2yPc3aeNDlf9JYgBesCDVS8Bir5AoPdsennGNt8xXoKpI/gt?=
 =?us-ascii?Q?aCzjOq5NLxHrsANRYIpOMJmB5FmMcaaT72hnLkSjw5Egk+1IAvAifXeuM9BY?=
 =?us-ascii?Q?6BU75iWtY03LrbTitAE9KCeyCvRZcXVzKvZ5gynPS5cRxEnPqlkdMKim3Hfp?=
 =?us-ascii?Q?WEEMfsuGuUuh2B+TxB8PvfXBw1qZ21C0W2asmk6dmF2k0YKBR8jWs8ya0MAj?=
 =?us-ascii?Q?KZU3lFtAFIbkUPJR+mWKSHRiKHIgSc7C/Z7SwC4ZeCRYaOBku4e6T5nv7ytQ?=
 =?us-ascii?Q?98ZWXflFWlzUfbO60yvnoEUrfFnoR9loVgcAa2m//zRJGTn9qaqKybnjWkfL?=
 =?us-ascii?Q?LQVHHU5Q/eao9BgTntd5rViQhc9YmLLE1TH296tzUBgEMpCBL6q/Rbgqqv8c?=
 =?us-ascii?Q?d1gH0PXScSRgE8OsR5VvnCqai14lt1DhPwDhot8faRuFty6rhKI/0aRyZvD9?=
 =?us-ascii?Q?BFusUaOjfepEMR6zfA8DdSNdS8GjE5TUNaLZbQaq3rHA48Tikml5wEDSbYjB?=
 =?us-ascii?Q?jFJg5LF6CQIu1Y+Nv+r6NQ+9QQlgZpTzMuqQR4tC5dUAuxcPx/d8Dni27V7D?=
 =?us-ascii?Q?cX9CNKFUdad3+HwP6VWMeEAVixJpFmgGP91rKy39LkX8Dez+S9+IZatVs6Mi?=
 =?us-ascii?Q?r0WsECHQIagj5GVkLFHrHTTsqQr094eOY9jmoEdhwimZf1LcbejKXoZd3Lc1?=
 =?us-ascii?Q?/OOZ7KxkIgkj2zpqNVptgLwW+RdN5HEuCFpOpdaLXwOf4pGO//3qhYhecTYK?=
 =?us-ascii?Q?COTRC1/dDD8vrS3pg9ObJ04jdz79MOuDar5WnclMO5Yisj8V1xWqcJJe/NBm?=
 =?us-ascii?Q?VOAaxeFO6dG1pNgmJMov70tR06SETQH3KxMOoLZ812d/7r6ws91JK9ttEW71?=
 =?us-ascii?Q?xWmM96G4y6bXvQ0zswNApcPr5T/2Uiia09r6Xp7mB9m61KoDMzsqW9BvuhT8?=
 =?us-ascii?Q?YId2ya91hyc03TIPBMvEz8cgSeiE+Q4ZBSJv5GtJBkee74w7WU1OukZCmx2c?=
 =?us-ascii?Q?chANIOD2uB7qJD9a2Uj4LLPwrLC38ncMTS/6ACxxetEprqsA0MwaBYI/rp3j?=
 =?us-ascii?Q?Mhrp+kRJSZOsgst8ggZLs6CVPIBvHBLMi87hHaIA+h9L1pgTmKWoRYpwPmOg?=
 =?us-ascii?Q?RY4E9fH0R0skEEa6rFo5sux6/vrE3lOKcGILzPM6U9CFyXgFS47951N874lP?=
 =?us-ascii?Q?YkJUr8HpyBc68i+nEBFL1yIEozyguwkKtkzYQZ5r9DRjWnfMDMNqfMZfR5ZI?=
 =?us-ascii?Q?qxrLM94QyiC5Us6/vv6837489YG6Bt+y8Q4z1XJEJPcCYNjfhu+/oy5tRi08?=
 =?us-ascii?Q?ac3+3hkl0GA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qAUxjKKIiMXGbHnMaq2UOFhtSLopAJ6Y0nC5UV5jxQ5vWv9rbRnTVXYvwvcy?=
 =?us-ascii?Q?BwnIDufG1O+xGXRAfoJn+8RHKEBqj8nBewR9X9XVyjc1vugfCGJbbL6Wpf+b?=
 =?us-ascii?Q?qZDnC9FHmD3iy6j0yl1ZXmt2IOiRYQ0SXmpHqyqc2b/yAizenFBpVrJ8ubm+?=
 =?us-ascii?Q?jjgYOyaPH/tYhGOoDHz2SK+R6CpveeG8mkWEQQ9eLHo2Uwk9cZyvIU/ISzVu?=
 =?us-ascii?Q?vbVCBOw89hM27GpL5ERyh+dqmJ7pGuJmpNzbf1Ba0TXnN7l04JH8V9r17TGf?=
 =?us-ascii?Q?dH0BZkkSgaEuxVWlA1NjePQ7AgoqdqISWG6hbPJpkebBN1HoVbXyHaNKwbBY?=
 =?us-ascii?Q?BtJcifQLG21ZNotsjTJsb2bfBiw4RZ0EiknqXNn+b35lo9aEy3QNwfWcspW1?=
 =?us-ascii?Q?KKtat+1x/XsPE+HwOJVusRb6Y4BTAhEd8L6j5Je6J/+VjnrxZhtmN6YiF0Hd?=
 =?us-ascii?Q?3UVVeFIN/aw4rAtTMQe/QNZ1Z71H4rvmZ7h2b2A44Hdm/W0FAlml8l2SQlzr?=
 =?us-ascii?Q?YhO4EEAuIfTo+JKYfpe7g2DiI8N3PHMJv1rnOgXR3HM+Ek72/Kbom0nTU6tk?=
 =?us-ascii?Q?SgsdJwkH7QhmZl4Imy9SI+xvgzsQkOY0Dyudab5Ufgf1kbU+OsHsY9qzUfXm?=
 =?us-ascii?Q?tHSq8sk+gsaP61AsCHJ5nhMsgVIPmaW6OhB9fYEBxMLH6WFV76aqELS7Her0?=
 =?us-ascii?Q?Y8Xs3T5Nat05JY1OB8SgzOdZAQZgbfBYVpFNM50LdvlTGh5aQJ2AoxyKMrQ3?=
 =?us-ascii?Q?Y6BPzYq+roA619NPyT7n7QfJKKdJ5C3cD7sw5KKyA9wFKbFv44ixJQ4rHTry?=
 =?us-ascii?Q?rleyYCxEPiINk4G0bnVsQmN551uz110ZyFxdoGnQtAVpybl+sAq6lJxTWa2K?=
 =?us-ascii?Q?kWtGQ03F6j3IXd3YNlI12DcP9plfx5/0ERi2MMpDLRPwsIPL7pAIPhu5hUzY?=
 =?us-ascii?Q?uS4Stz774jVzx4dGFBa2oa5kCcMoMnP9x89ILtC3/bAF2NU2IIiS7xu+NlAM?=
 =?us-ascii?Q?ycoWRb+IqhyOZFlEF2snxrOFKDyBZYrjypkdsWeDbRgB15/znUJNiu8pN2zA?=
 =?us-ascii?Q?Gi8FMTotVR+51Cu4d4vcy0zNMvZr1RaYVZg5Ql21RW3ibZ187T+Mf7SP7Qqa?=
 =?us-ascii?Q?9ERc9NHodm6O+EiWmxDS6twQF6eDpqu11uC5ws7Ya7Pa5ujxs8Mi+PsPGYEl?=
 =?us-ascii?Q?xVxApXfZAMaHGB48iDW5x6qS5xk0479DzwJ8gxJ5CbANtXxKsU2aRDIOfxzH?=
 =?us-ascii?Q?7TbxY1+Mxa4darZvRWKSHzX3BAlxNcBGC167ERD56bamODa4AYkCTeMQ7Mfh?=
 =?us-ascii?Q?XFWVsGy5hZMs22TtrFL33y7WgF5qCGHyYsT24cs6Kt0zIsdkVoExldZZsp7i?=
 =?us-ascii?Q?s+8HTyQMESv/B2p6Q5Hqzs9g7y9gsCdKbh51Vq/jprBHtdpAOKBPvrCof6mP?=
 =?us-ascii?Q?tUgW09AxTBbW/8Kc5F822cvCLZArWz4LiEIcCNnxA2z/XIXSDAgWOmuny/Eb?=
 =?us-ascii?Q?EEqV94nEDKfuEHmLijUKiTtou/9r6acK6jK19+htzBBYkWogq8uFyuR4t2ei?=
 =?us-ascii?Q?andkbE+DkE6O32V5zTEio1XY7ipY7WJOV6RrT2fqr46/xOYlH/f54wbQVZlR?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d6925e-46f3-499e-d63a-08ddf7c2a824
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 21:22:37.5187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHPbzTh7WzRzFN8PnBxKNhqCIz67+xAwAZHeOqNhAe6iYNuUoRopGErkkifmUuiq8Dx4RwKf2HZ77N6mh299Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
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

On Fri, Sep 19, 2025 at 06:04:29PM +0200, Michal Wajdeczko wrote:
> Due to initial lack of per-tile debugfs directories, the ggtt file
> attribute was created as per-GT file. Fix that since now we have
> proper per-tile directories.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 -------------
>  drivers/gpu/drm/xe/xe_tile_debugfs.c |  7 +++++++
>  2 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index f253e2df4907..e4eba91cb83d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -12,7 +12,6 @@
>  
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> -#include "xe_ggtt.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
>  #include "xe_gt_idle.h"
> @@ -142,17 +141,6 @@ static int steering(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> -static int ggtt(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	int ret;
> -
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	ret = xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, p);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
> -	return ret;
> -}
> -
>  static int register_save_restore(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_hw_engine *hwe;
> @@ -279,7 +267,6 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>   */
>  static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
> -	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>  	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
>  	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
>  	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
> diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
> index 5523874cba7b..a3f437d38f86 100644
> --- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
> @@ -6,6 +6,7 @@
>  #include <linux/debugfs.h>
>  #include <drm/drm_debugfs.h>
>  
> +#include "xe_ggtt.h"
>  #include "xe_pm.h"
>  #include "xe_sa.h"
>  #include "xe_tile_debugfs.h"
> @@ -90,6 +91,11 @@ static int tile_debugfs_show_with_rpm(struct seq_file *m, void *data)
>  	return ret;
>  }
>  
> +static int ggtt(struct xe_tile *tile, struct drm_printer *p)
> +{
> +	return xe_ggtt_dump(tile->mem.ggtt, p);
> +}
> +
>  static int sa_info(struct xe_tile *tile, struct drm_printer *p)
>  {
>  	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
> @@ -100,6 +106,7 @@ static int sa_info(struct xe_tile *tile, struct drm_printer *p)
>  
>  /* only for debugfs files which can be safely used on the VF */
>  static const struct drm_info_list vf_safe_debugfs_list[] = {
> +	{ "ggtt", .show = tile_debugfs_show_with_rpm, .data = ggtt },
>  	{ "sa_info", .show = tile_debugfs_show_with_rpm, .data = sa_info },
>  };
>  
> -- 
> 2.47.1
> 
