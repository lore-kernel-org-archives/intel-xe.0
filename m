Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1141D2629F
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 22:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B23F10E139;
	Tue, 20 Jan 2026 22:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="REnY17O7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3191D10E139
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 22:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768949491; x=1800485491;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2R9AM7WB93IhTPUrzQdy54v96DJ4ttKfOM+UyIM6q1E=;
 b=REnY17O7RXd4rNBWTjpSrx4oKOm8xproIXFS9rtb/YyxY6jJ6KGxuBX6
 MJdDrU2D7GjdYbrYIFhqJVE8Vyr3JuMpx8OqVtvH7z2GPdD6PdUatvP2y
 L4Xm7OfdbUu0df3s0b5KGFNzH6VrkClsSEFi16VxXlfM/nsuqmLuE3EP7
 HfZ2AGBcd/L2LO6DfSZiH1JgyzxeR9uonm70hkzyf/ccOzGx8FFV8XCBy
 fQ5x5HiLCMsmvhyFsAXmfd5zwIv8noBam1ZUHy6RWaqb+uyfc9Gzt4X+T
 x/oIhN5BthQcXycgOPCX7dWNc5y254nci8fkVxiMelM8vXutu3EgzeWJy Q==;
X-CSE-ConnectionGUID: L05QnK+vTQyxnXkRJokzrQ==
X-CSE-MsgGUID: QAEAcn8QS6iC5hC4Qv2row==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="57733297"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="57733297"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:51:31 -0800
X-CSE-ConnectionGUID: 4zKcssjnQRyD33JKgbVw+Q==
X-CSE-MsgGUID: xbc4IzSKQNq2HKdDPEgQ+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210705233"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 14:51:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:51:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 14:51:30 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 14:51:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scAFClhx/vFlSq1NlvQ90puyucUllfdKUOJAiKzkIPL+tiYslQHdwwEbPFfW19Kvy9Nc7NyHjZELpj9IXcZq5/PyJFuO0E8sTZ2CgfMW28d1RSyEKVCNMvI2hQX2dP4HQs3j2ngeMevmHbdr9VijaO6+ysPtuGAGhqOiF9yhH7ENOeMFD5ZSyufYg8HpO2KLzq+u0qJH/Mhr4r7g2eO4CrBBXMaWYNgtljAoDxNgJUMxA3xjRaYDkF/N576sxeGjvv87meTlAW/3tGbjHEIzv/ypOA1d0/+Qqt690imIFd9I35SbM6LhQ3fh8wGW2ACxWpA5IjKug7Lz3P9Ejq4EBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4540TmquHXfxQz88T4KBEoclMnPW+QhACs8EpBXmafw=;
 b=LE4Hd3c5raskPvz6/AwVVtS/10camGWSY8QXTq9/K6uTx9jGCGudwRB6gM8liJUF66cNBwGc10OiyJO7gzqgPvlN4TBGU2NBzfuQPFtubKAnc51iSXUzgMYrsQxg0xR+zskC7NaxwdfD+QYb7FrV747PO9pGSJZwr1G97/Kz5d8NYjyV1b/mvb+eqIxTxzVJHABYtej+nGWEpNQDvfz4MlDdvC7EC5pC5LTes7IeA+BvKRK9QQYDY7q56t8fsFdWAoC4O0sKrKydtwpKk3HpP/Vh2lDJHiZ35e/1fm3uM7NV08nhF+zY+H+eF0WC1Q9nH9lxbarQbeWe6RqbVFA2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 22:51:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 22:51:27 +0000
Date: Tue, 20 Jan 2026 14:51:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Farah Kassabri <farah.kassabri@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ilia.levi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: s/xe_vm_bind_kernel_bo/xe_kernel_vm_bind_bo
Message-ID: <aXAG7D+thRBlHSk3@lstrano-desk.jf.intel.com>
References: <20260119150330.6537-1-farah.kassabri@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260119150330.6537-1-farah.kassabri@intel.com>
X-ClientProxiedBy: MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: aef5b8bf-47de-451f-1e08-08de587671e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0otpj2HzXX+jZFW+3ZId7laK3kvT6zH/Vgoo8W756VtD53/gdwVJz3Sr13Uk?=
 =?us-ascii?Q?Qi+EpVSBprT7T7Ci875Z/xv7sEE8pcbPsgYoLUwgiSaP2Ln0V3j9FWuxx6+9?=
 =?us-ascii?Q?6tkBrYasJLGlC2Rh2cA1R0tllKy3ZVnObtu0+VNoeYz7wct/tDvxpTS5kQBc?=
 =?us-ascii?Q?hqmJHHMAa3dMwjNiPYi6HoPF8X1jeVwufWJyelLVlAn4ys4DYHtt0FraHUvZ?=
 =?us-ascii?Q?E45ugJrStTFTiEdBOp2Z3Tggi1HUNsVz2V5EZ/QVEe+0zgqgbgWBwVKen9QI?=
 =?us-ascii?Q?x8SrsIjgTsznPw3XCci0Ex+DQ0EfVr39iK7s7I01DSPqfJ3jTSNvvL8ed4ku?=
 =?us-ascii?Q?cADEn3IO+Vmujf6BwNUd+ZV3LE99dOd+VHdx1/Akx0B+UQGZa/2Q5RTVCrkF?=
 =?us-ascii?Q?mHJvIPGXXlDpm0uwYj5cv1m4x4Gyfol8Dn+dFS2DSkia+x2LaWQBqk+ViFtW?=
 =?us-ascii?Q?svWNhB0GhdeVgrxb0xSuwLpmGR44yzRldG34n5b4ki+y7865lB+D7OCmAiCU?=
 =?us-ascii?Q?t22BKFb+NH1rFC5KlQknCxBm+pyHn3bjgh8IqaZhcY6Jwu3Dv5iMFgLR1MMz?=
 =?us-ascii?Q?ghFaIDPDX4wjQhnd6y0S+iTx+Qq5qlzk633AuE2HYM0VtV/PvnjnSkLxuuaY?=
 =?us-ascii?Q?bEipJEobXp/QU1iMBhequusnb78oYfl12VyrV3/ysAiDQDLRVwJABap5EBuL?=
 =?us-ascii?Q?T78HGasEvg3udk5nSSlb0bD8y8blplkjCJIauwBLNlUeaSIKJqWUQFpC3Ydn?=
 =?us-ascii?Q?4yXJBgnmxs1k9cOXEuyCY7G1jZdK647yN8oGTQBX8JMRKxxJmoFd1pBu5M52?=
 =?us-ascii?Q?AlapRxq7UTg59nQQ8iBiqJVIbE6e+GB7m05wZ+1vroHs0UrcKds7EJPrvHXo?=
 =?us-ascii?Q?O0Wm4O3SDRzbPzjrdsYCq5+H1WxjP9r+a+GFQk4bU3AJzEIWpxsipPiBmm6c?=
 =?us-ascii?Q?HEpPuAwdb5IdwyvJwPpOAe6L5/HmVe4dLljQ4G5WH5e0prm0uUedPF//5CIA?=
 =?us-ascii?Q?v/N6MTSYWxp36L3CbgmE3hc6BFs/bPeLPrC+RVyqBSg1DhvxUeX+tvhw5wlM?=
 =?us-ascii?Q?DxVpns+6BVZHGl30DHUCDeN4Apldnm7fXovumGtVKOds7rFmuRAAfhYrmwPu?=
 =?us-ascii?Q?2kDz4rPC42qWjBsMHMOFNIXMfC8KidBoA18wIwF+TyqYZCZFXl7qL3C0gniS?=
 =?us-ascii?Q?30ap8c3oAZWFglebTJdnrYbmuhSBlUi4zkV0ilQiqSF8lk7K50Gl5ZDPsHlE?=
 =?us-ascii?Q?p4JihXPq32x9x6k+zWowabGXgVA5AZfpVjqJl9hVc4B4Sy1m6Nko2cw6jvD7?=
 =?us-ascii?Q?no3n+gt7ctg0MhFtAZs4sQRtjbg6+rejHO3C5runmn8dn0cny8io9qkP+WAL?=
 =?us-ascii?Q?OWcpyla2dEfK8HwkBftLpT4VQymBeTXnfLXIRRiX90j7HIFMT2LmR+hNc/PD?=
 =?us-ascii?Q?Jd89mrJKUISEKqqv/vZiI2iqa4UxEZSRIcqIdtP30L4JO6XDB3M8VaisnaS+?=
 =?us-ascii?Q?RS47pTLnjBGKwsUdR21CdUu+/C7lEhiZdN5WFRRomIo0263SykRoYCMu2Nux?=
 =?us-ascii?Q?vmtFIdoZpYsRkILjEQ/jYPGm+NbmvTzzIuCLWWSp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BQkra49evuRSga7M2FSNpy2RjIxbvQh0gqsr0iW5v3Kbcz1QwN0rX/uaBUsB?=
 =?us-ascii?Q?W0bdu6gDbIyVy+UVRb4/22Z31DhR3PcovvZoi7+07LzwIAdXCsZXyvwDPTzg?=
 =?us-ascii?Q?h9zkTabNaUt47QCfY0BsF42EY0/lkWmbfXuwjk0rFTrfQbi/aG3ssEnQq52s?=
 =?us-ascii?Q?3j9lA6XECMXMVD0El74jjNfwl5VFQPpXTbAfQTKvARd4G6TrzBMWw8uydbH8?=
 =?us-ascii?Q?CR0wgm7v+gZVdGJ0zlDWpY9opJC+qcaAwxI78e1bR+une6yq1OswphqXKgx6?=
 =?us-ascii?Q?EBT6hbjL92G/c0CV/vEGyviZkigZ3PXm0roG87mtlfxnbhuj3eCJcPhN/Erd?=
 =?us-ascii?Q?MItIE15kMumpk7W7PXTIhfPV4ILT61u6Mx24uK9mT5elTt+/rvU0EO3/S6eO?=
 =?us-ascii?Q?JtfmKk1fcdYiAYVaiQ5O/3X8UPUueDa+d0chBm+rfROXp1KjmIAFZTy3PHVM?=
 =?us-ascii?Q?9JvBWBUHR3mpa34I9XfMHoJxIXJZbcgCEFRG0ITws9INhPU4h7yZcREiCfOR?=
 =?us-ascii?Q?FrTkx4gJYVy1vhStT3+EDbJAt+IvCQuxFUdpjNvJLl05cj2KnWgBHkU3hkN6?=
 =?us-ascii?Q?y/a6cxQJS2w+f0PvFcOz11nGL4aLsHMUbaLAQsV5t4vFv8DFi/hzL9gJn10p?=
 =?us-ascii?Q?K+xVb5JA2BJSDXvi1QWHc8CM/doPq38+gz5dAWXQXb/EJ9VW+4wp4hilrS4M?=
 =?us-ascii?Q?jvnKIMnnoliEP2Dbhx6ve1pnC6MDocdZCunzrEO0z/NE5Kq3b0TQt1GRTgQC?=
 =?us-ascii?Q?9KeAoxKaChtdOhp8gPeyKOXrDksb9iBDW6R49Dz9QCbb0Fkn+9xLawjKqmAd?=
 =?us-ascii?Q?62sSsmKOf2l466msIgFpvEiA2qhehP3cz84Tl527/zTbHeYWI9wGMtgNKdKE?=
 =?us-ascii?Q?VkjQNKkbvjC1SdN2rd/iSFsx88vzPxPZAh+3gL1RDaNoaJFQpf8Y4B0StJTV?=
 =?us-ascii?Q?8IhYMXwDkxlf44vYwPMrqPO6iHrBsRs3ekg6XPbTTsfRqHPxkG1trdpbF7Ut?=
 =?us-ascii?Q?SuuSfC0lki0VTMDuGF7YDyHjY1V7+T2w8ifD5v6KZdmIXl7ZuKbhVWF/fGRM?=
 =?us-ascii?Q?+aD+zeX5HGFBDvwVKZESSMYfmxO7cg4IF/IMxyc28Ewm5wMrJZ6a23eCDqI8?=
 =?us-ascii?Q?JS13y7w3qL4K0jT4dX9mYHr3sPQvIXQ3t4U5ldmRcuhTIdjusAGzzw4xzlFS?=
 =?us-ascii?Q?SJifpbEiUgfej7E33J4DlJG6nLB7wPhT4H0xhzxNh6njh9fbT3v5rDpDUqdJ?=
 =?us-ascii?Q?UBLyn4I/D5fid3KnNiT4RMOIDqwxA35YaboPn7AUodVN1X3/NWpyFrNlzTsZ?=
 =?us-ascii?Q?ksfxAAgP/o+QZaJEgKNXkwjmzEBxEELuru5kaA3JZ4zOwcG9XKcb9CcucPIg?=
 =?us-ascii?Q?gUElG5eDrcoXAQcGzL495Yyk+000gGf4t+O0xsbZTVvZyEcbbv+m05IgOWjC?=
 =?us-ascii?Q?ht7mDhnvA8IsgYm19/TepY+R4WrBNXtelaH3GUvB1sFRVlxqmhmSlCWoGhwL?=
 =?us-ascii?Q?CA6Fe2t3Ous6lg+kZpw6LQVYgQN8XJNCAuCxlwYDRzy62ibUi1/RnIFfcaY7?=
 =?us-ascii?Q?UUBSjsMwtIX1DIOTdGhC3YGVnLlr2LLe+9RUML+JZ39D4OKs3/3UaM7fu49R?=
 =?us-ascii?Q?jfZ+v+7oJ7Gg/9G8KRfhqQiAHxfUZMx8+x8C+p/tOaRts8yz8oJfZdJlYO3d?=
 =?us-ascii?Q?ixQ0vpQAX1CLZDuWwiddWM0pQ31pX/raQeJY4VE6b3IyTwiLpBAAflLebaSG?=
 =?us-ascii?Q?vx5lKS3HvMNCzFxdJRVC7dQzq1m/yMM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aef5b8bf-47de-451f-1e08-08de587671e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 22:51:27.4388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szUVPSARcTRULYnTeiSIgmoBKlvIaK8CiOtD+oQxtBULrddAfSf4ceiurBeg+LtpH59Wv5z156InmquHmMWk1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
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

On Mon, Jan 19, 2026 at 05:03:29PM +0200, Farah Kassabri wrote:
> The existing function `xe_vm_bind_kernel_bo` was originally used to bind
> a buffer object to the kernel VM, but the name implies it only works for
> kernel BOs. To clarify its purpose, the function is renamed to
> `xe_kernel_vm_bind_bo`.
> 
> Signed-off-by: Farah Kassabri <farah.kassabri@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pxp_submit.c | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c         | 7 +++----
>  drivers/gpu/drm/xe/xe_vm.h         | 2 +-
>  3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index e60526e30030..e23ee12d8e1d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -130,7 +130,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
>  	if (err)
>  		goto vm_out;
>  
> -	fence = xe_vm_bind_kernel_bo(vm, bo, NULL, 0, XE_CACHE_WB);
> +	fence = xe_vm_kernel_bind_bo(vm, bo, NULL, 0, XE_CACHE_WB);
>  	if (IS_ERR(fence)) {
>  		err = PTR_ERR(fence);
>  		goto bo_out;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 694f592a0f01..a27145a4137e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3830,20 +3830,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  }
>  
>  /**
> - * xe_vm_bind_kernel_bo - bind a kernel BO to a VM
> + * xe_vm_kernel_bind_bo - bind a BO to a kernel owned VM

While you are here - s/xe_vm_kernel_bind_bo/xe_vm_kernel_bind_bo()

foo() is the prefered style [1], we are going to fixup all of Xe shortly.

Anyways I can fix that when merging this one, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

[1] https://docs.kernel.org/doc-guide/kernel-doc.html

>   * @vm: VM to bind the BO to
>   * @bo: BO to bind
>   * @q: exec queue to use for the bind (optional)
>   * @addr: address at which to bind the BO
>   * @cache_lvl: PAT cache level to use
>   *
> - * Execute a VM bind map operation on a kernel-owned BO to bind it into a
> - * kernel-owned VM.
> + * Execute a VM bind map operation on a BO to bind it into a kernel-owned VM.
>   *
>   * Returns a dma_fence to track the binding completion if the job to do so was
>   * successfully submitted, an error pointer otherwise.
>   */
> -struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> +struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  				       struct xe_exec_queue *q, u64 addr,
>  				       enum xe_cache_level cache_lvl)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 6cc98df47291..ff32f43aa1d8 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -268,7 +268,7 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>  int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
>  			  unsigned int num_fences);
>  
> -struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
> +struct dma_fence *xe_vm_kernel_bind_bo(struct xe_vm *vm, struct xe_bo *bo,
>  				       struct xe_exec_queue *q, u64 addr,
>  				       enum xe_cache_level cache_lvl);
>  
> -- 
> 2.43.0
> 
> ---------------------------------------------------------------------
> Intel Israel (74) Limited
> 
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 
