Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E9EC19F4F
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 12:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D9010F099;
	Wed,  8 May 2024 12:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtdY1wxk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5810F099
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715173192; x=1746709192;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zGhRcw1Pff69NBjMUJ5YJCb639JLBQjVJ+BO3t6DFaE=;
 b=CtdY1wxkYwUWt6rbqTi0uPvEohS2qCUkAV1VWhATwuWh5rRkzyVG6arm
 06I7b8+kVG0lG/Z5HsxRUE1bQFf8BL4RsjKU3kKyK0J2Pk8eQhiYi2hTI
 bXJA0y8CYlc/8x7d8xT9jGmzNHKP5mCC/GDISuEIvha6mm2u1Nn8qNVqe
 B3bUv0r82OyLwNmzn0bAXN5d4W0s3wJG1pyvyU+kCeLoBiOzruhC4dbJe
 NBAJDYozUHe+X7GOUxUgHoBgZpZx/9n1qU+kuiHoXGkVMYZDCgNVwH2Oh
 QS5yYVepzWE9XdHGMCGMrFLOx/ImF3jNIZEERyuCc3BPsLjU5FtoF+2mv A==;
X-CSE-ConnectionGUID: veh+nPXRQY6oGQ0Gcx6dWw==
X-CSE-MsgGUID: WnX2W0doS+yUclhc+LoRqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22422255"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22422255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:59:49 -0700
X-CSE-ConnectionGUID: JH/nCcGqTySsZz7IrVyRYg==
X-CSE-MsgGUID: 6ZgJY4goSTaNnXnDhSvviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28968932"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 05:59:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 05:59:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 05:59:48 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 05:59:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB4Ns5GSzx5L4vzDMNSm8KaITATWCEypGz4n6ZxT2hrJwgSRmMl5/bqaQxMMDW6jv4dzDETl6Y3tkqDgcnjjS7KGKNsX/Ras7p0INmpRnu3Q8Y0X9sVAWp8yUymGWNM6JTDfqOhfkGg/gV22x5tfMClxAjpqG4rOpCTuD5CKba14sk+/nK5WcNSX/9vBH6DbxQG9SiLlM5zhOZxm9P9kqOgQ6CC84YXdUeFE9TwWdggQuneCJOdfyYmoWzsSjH8AKzZsB5sSCsBjsywXpkbM3MxRO65VEkKJsiOjFB9HA9MXp9BVHQGUYWvwi03KNZ7o/QSd+g8lVTp66E/u3U+ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAgaGlxRxlD3e4hyn1rU0Z3eULL2Fa/Mfs1XIH+cYR8=;
 b=lmKQGDeucWCec//vZ6BYKEnmQh8wrskQ1dzMxuXVKTis5xZpgk8v037HKkDge0js/NG+LoOd7pWwY4AlMvflB4nIgg417SmBCTsIUVXXDqF5mki2a5scdFplNgRfc5rHEirvfbekjgdB0M4UWIqyuUOXjAb1vrW3L2wNKQrdZUpMehXKHl+on03f8nZBVz4lJ2etx2K+LO0i0c6eLkhBweYOxRwc+u3EWayE6Qy1u0GwPybvlS9gPNxQw6k0Pg3W49idYauLOlGCsUwF6AYeKpuSVbzoUta3NO4WRRN8mLRK+EkbMBsTqDtTgtDmc42uN2PhNrkZIo70SER6ysxeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4599.namprd11.prod.outlook.com (2603:10b6:208:26d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Wed, 8 May
 2024 12:59:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 12:59:46 +0000
Date: Wed, 8 May 2024 08:59:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Change pcode timeout to 50msec while polling
 again
Message-ID: <Zjt3P84Fn5mMDn9w@intel.com>
References: <20240508034328.3233072-1-himal.prasad.ghimiray@intel.com>
 <wqypeux2mnfci7vunszwywbjnvb6t7bmva4egb2u2kcbb4oe3g@244w2z3fnogz>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wqypeux2mnfci7vunszwywbjnvb6t7bmva4egb2u2kcbb4oe3g@244w2z3fnogz>
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 980713af-53e3-4863-f67d-08dc6f5ebce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YjPA4P23oPwoByIkBphTHS3ZnCCP7Iz0xGbBBuk0EBCc35OHzPdZF1nlEuw4?=
 =?us-ascii?Q?SGm1Fj0qIPm1AfidawcZnprEv7Ih5m8Avj+ba6TvCph7FIRLcQC1QBbpnZnI?=
 =?us-ascii?Q?5/G1nz4HUOqGnUvybThxoDM6x6Y4AJad6iKzpXfPfy4SV/HnE1PoEEJX4pKz?=
 =?us-ascii?Q?IuodiX9iy5DFWri86A5FdfvOSfP9XE+6xmsxmKRux0lWiIMvnF2UTTufGY50?=
 =?us-ascii?Q?UN6bzBfuO5BqDLIYBJhioTkcM3E6D+4juNxUs2FXvA4hwLQkKwLKRAMknjz8?=
 =?us-ascii?Q?VO/cnZot91nEiT4VIR7YYbFJGJ9nFhLcNAQY9zH9z0Nsc3qm21Wb3sz7PjZU?=
 =?us-ascii?Q?l7WtKzBJ4szaqWQe7e++WPQYdbxu7+hdIRhk59FFGa1glasKKC+5AsUM/ajS?=
 =?us-ascii?Q?3kDGVDuCNJiXdic/9dbGiSRmqgOZFuPe+9s7ZmlsGG98mfouD3hY7/E9F2AC?=
 =?us-ascii?Q?0HF656J0dbfJ4//4hZabu/eS35hxiWbEyoUY6W0kFxmJ/rGLzscCQwjSrR36?=
 =?us-ascii?Q?AQJRDLePtf+qJCH41ot4C8VpeRhBI8djXvXPjvE1wnegTccpT71geH9OKNcl?=
 =?us-ascii?Q?J2Zdcg63pHr5fhBswUU2+2wh8WLaAnVpdgi9d4yjvfPBnSRz1bWFVZ5YlCNL?=
 =?us-ascii?Q?cBQ6i4GEIiqfuJvZhCgdQv37fDeBsH3WIpbZmfIoSCFveZ0JmzBC9Yqwg/tv?=
 =?us-ascii?Q?W8kICI2CSJh72ol8JJVBs6il+VWN1WcMJ2vdipzkH899ZVEClSwP9rVnsLfa?=
 =?us-ascii?Q?3ZOmaiHqbZHuJZRbX569oEAQdr/Qs4mpNQu7Q9QduNtp0dwG7z0xUr5VPdVy?=
 =?us-ascii?Q?TN3WBTx7z3Ct4/+Q88MnW9Vqz9p/7G7uJTnP4GhJql6NEtW96+VS5u45nf6r?=
 =?us-ascii?Q?kkiKESkYceFu+sIiy0T955QpkygxiJgT+JXy+q8W09n+9PD+lp/EOQar+zsR?=
 =?us-ascii?Q?32uDk8yR+M4hk9P4GYfnc/NAzkc9afeX5X1GMYoxHc8rnbdrrgium2hpIxwJ?=
 =?us-ascii?Q?1d7v+bgROx2YYUCTerNVV7Cr3+eGUDmwebHR1lHVNF/U6q48SyMGZm/OpdxZ?=
 =?us-ascii?Q?RiRAzgz6t+S2MHQx0Wyzw+kwNq8Z2xFQxphj9diSBA9+N+LwKVZjr+0c1VjE?=
 =?us-ascii?Q?04wiyjykXZFH1spl+yoEBmdp9/8lwgDMUCk800m3y4fjrPqe6Q89njpBc2Zz?=
 =?us-ascii?Q?vVkLcX4F3rE5JyTNP8jci0DO31aC87Rkf222Qcr/ZoapDki8pbkiLIFpSn+1?=
 =?us-ascii?Q?QSeCVhMapl5zW2zDWuUjmnh04M2B6Kk2Jq0ikDob8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ALtiBhps+iQKQwmYA+5UK8+l6byyKSaP/xxXQ24t/xi08O5mp8qgHHgq7n7m?=
 =?us-ascii?Q?sPCWI9y7hiB6r0v19ymc59qA3rptST7aFBmHEoftHn4/KdlSSEcm3DNPP/bp?=
 =?us-ascii?Q?xHcMC6FSusZu8WeKqPN9cd4XyMwdpObvPiiU95g105HpHZDpKiSYcHuKe/g1?=
 =?us-ascii?Q?eqF6kz9u+bKdCbf5o1aAQKkDL8zvIS0pvlB3rLnlvKs1o/23qsmSthVY9dER?=
 =?us-ascii?Q?KrzeIAn1htM36dAeCdsFvWBrgJjdhhgumLqwZhpynXXlRyIaY/BolMEgSkq1?=
 =?us-ascii?Q?RyjND9dqn+EVPJfVq8D8FJnys3Tdzd520iac04DSSTHBwf3P6G++qt9s8yuS?=
 =?us-ascii?Q?OtwQLirkIzGgZBhln45ZGyWcTPK/e2kdjIyEj0PtO80/r2g7mBankCmFz/Oc?=
 =?us-ascii?Q?SqhnJGrNb1Sj2zSzGDZtaX5E90wm/MU8SlKminsJfkug3Jyr9REy1ME0B67S?=
 =?us-ascii?Q?z4gAntJ1JpmbrslXJ40wfAtF8qae8dfC57r1MDjQZsvZKwGmHI+PG7J26cFd?=
 =?us-ascii?Q?C2VNFgBTroFwErvfBrxYqXQF8KI2MDViQGb7Sz0voSPZ2qkvSou+h1RChDju?=
 =?us-ascii?Q?qeGDGJehNpsdV0TecWkgZxhbrOtkoRfMyIC7B6zv5nkUjai2utjWgCVK4IKZ?=
 =?us-ascii?Q?HI8Sd+gBdUO/7Mgztd13Vxs6NwDipxonrjR/6/mjNtDaeAx6DzAC3hnwoerC?=
 =?us-ascii?Q?4zUd2qykt3hGidCFKM8NoSPOvy2mUvDk91NUwSVvdPtcbbcn9Auo1hgfpFnC?=
 =?us-ascii?Q?j+havTr26uie0jizu+HbcVjec9tCfbTB3IfzuBixLkEk1/ThfgpN3HWgSIJt?=
 =?us-ascii?Q?cCtTNgK57RBgt4lcPfG+tbKnIjZn9Q9JNEERzFUyUheI3sA61Y06FkaGp9oy?=
 =?us-ascii?Q?baFKYt/d/LnEjr+6/H9K5kLr2ZpemQTH/rRA0Cy+E33KRgd3P9ec8DHzf1bt?=
 =?us-ascii?Q?4/CwpHm6OYsZo9MVkf14EtqgpWnTmj8pQPVHSW/YR2BfqBsdeBiRjb6AihKt?=
 =?us-ascii?Q?I/lB0ljqZ9rLdLCIyqQ5jFj8rJWLTPIaaOLEDBYQVw+11zqO5q4EDNCapRb2?=
 =?us-ascii?Q?SqoazkDEFbCVUfyIwOXCszPD2bCYl970ztE+xudl63d6guPcNLzDnlRAHTax?=
 =?us-ascii?Q?HxgP3581hKnnMclAbVvZTsXnR0eKc+xzEEmriCWOSbhbhrqbybHssCpIu65u?=
 =?us-ascii?Q?jgz/crKNjuuy+x5+a6Gd7H3AQlnlNrrgWHTlrIGrdRx/vjMFeMWseuFECZmt?=
 =?us-ascii?Q?woBuNEBUIStrZIp67EWErZgqpVqTyB0JpKHCb+yAhOjw7UDpgm7GpbAn09YZ?=
 =?us-ascii?Q?+zdn/0fzznGdXjQJLbD3w3DjMTIvYLZaKyc9cYHwvRFv3M9y3YfTHtSGpbhN?=
 =?us-ascii?Q?d53TCDfgsBQPJDV+uj7po/injVnrcfi4CSHFBv4O52QnraJtAgOUkGOv220H?=
 =?us-ascii?Q?Ht4TkCmjGlPmH2OP2eL4ge6Uw+orO3KpgDsTnVP9jypWjiKxL8xo14sG88iv?=
 =?us-ascii?Q?+YW027xV0q/G6bFAi/RPMelIjyqp2KhFld4TGgzu7XLxaI/ymN9pEXPhnm7w?=
 =?us-ascii?Q?4ngHJZJO55r6gLZsrCFyzcAYSMZdkCuqHxJGE6ESY1rbNnyflxfj6xHWP/pN?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 980713af-53e3-4863-f67d-08dc6f5ebce1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 12:59:46.9009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g65j+K1fDy3j/1xjy6Alwt/emLhI8/GWW7Qh44xFA41joVvl+EANvRxVCr98k7dKIYA5I6de9HVFIjA8VcuVeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4599
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

On Wed, May 08, 2024 at 07:55:10AM -0500, Lucas De Marchi wrote:
> On Wed, May 08, 2024 at 09:13:28AM GMT, Himal Prasad Ghimiray wrote:
> > Polling is initially attempted with timeout_base_ms enabled for
> > preemption, and if it exceeds this timeframe, another attempt is made
> > without preemption, allowing an additional 50 ms before timing out.
> > 
> > Display driver can request for timeout of 3 msec, hence modify the
> > warning condition.
> 
> this seems like a separate fix?
> 
> afaics below we have:
> 
> 1) fix the warning to consider the display case ... and shouldn't the
>    warning be before the first pcode_try_request()? Why do we want to
>    warn before a fixed-duration rather than before the variable duration
>    passed as argument?
> 
> 2) change the second timeout to be a fixed 50 msec rather than 1msec so
>    it follows what was actually documented in that comment.

(for the 1 and 2 I was okay with having the squashed patch tbh, but
yeap, probably better a separate one)

3) status = 0;
(this was not even mentioned in the commit message, and I noticed
after the fact when I was about to merge it. Sorry about that.)

> 
> or maybe I'm missing something here... could you clarify?
> 
> Lucas De Marchi
> 
> > 
> > v2
> > - Rebase
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pcode.c | 9 ++++++---
> > 1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > index c010ef16fbf5..2771eed1e45f 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > @@ -10,6 +10,7 @@
> > 
> > #include <drm/drm_managed.h>
> > 
> > +#include "xe_assert.h"
> > #include "xe_device.h"
> > #include "xe_gt.h"
> > #include "xe_mmio.h"
> > @@ -124,6 +125,8 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
> > {
> > 	int slept, wait = 10;
> > 
> > +	xe_gt_assert(gt, timeout_us > 0);
> > +
> > 	for (slept = 0; slept < timeout_us; slept += wait) {
> > 		if (locked)
> > 			*status = pcode_mailbox_rw(gt, mbox, &request, NULL, 1, true,
> > @@ -166,7 +169,7 @@ static int pcode_try_request(struct xe_gt *gt, u32 mbox,
> > int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> > 		      u32 reply_mask, u32 reply, int timeout_base_ms)
> > {
> > -	u32 status;
> > +	u32 status = 0;
> > 	int ret;
> > 
> > 	mutex_lock(&gt->pcode.lock);
> > @@ -188,10 +191,10 @@ int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> > 	 */
> > 	drm_err(&gt_to_xe(gt)->drm,
> > 		"PCODE timeout, retrying with preemption disabled\n");
> > -	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 1);
> > +	drm_WARN_ON_ONCE(&gt_to_xe(gt)->drm, timeout_base_ms > 3);
> > 	preempt_disable();
> > 	ret = pcode_try_request(gt, mbox, request, reply_mask, reply, &status,
> > -				true, timeout_base_ms * 1000, true);
> > +				true, 50 * 1000, true);
> > 	preempt_enable();
> > 
> > out:
> > -- 
> > 2.25.1
> > 
