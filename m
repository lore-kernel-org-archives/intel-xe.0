Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F15C44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 22:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49B410E1C6;
	Wed, 15 Jul 2026 22:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7xZqei4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFC310E1C6
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 22:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784153471; x=1815689471;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zRdo+iWgE3FtJJPcA26UvkitxUQDzgC0NyuLEbQ3kD8=;
 b=R7xZqei4GDjmLw6d6uGHNy/WR8vlIKdZEQNhg1nLYD5U/zkROBleo71f
 W9ql303ymYmHk+HPPoZMOCFiSPReKxYFk+gCAqD50sOGSTYaEzUIalQZ2
 FgqPbVECZbTMTadEjpf5pcU6gHXx9iGvMvrSZ9zS17TO9xi3M4GOOAP5t
 miuuXpRV3hahk/zr0o3ahcU0IpQOo8T6tdVyGQHH7OO7ahwmT7V1/nQUe
 qxTaohnzZnWJuqq7r6ShP2X23mucz4GH0BsO3F2SbJ/ual5YSZW3UxeLx
 w7cn+AxAlyx7pbAfjFaDkohWGIz3c+qTpJIbGYCLZ6jk2vcjIKxmDh/CL Q==;
X-CSE-ConnectionGUID: FsMNrPnOTNaDOCZgOuE+kg==
X-CSE-MsgGUID: BkWnEtBaRjm3EIBHzuMirA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102233400"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="102233400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 15:11:10 -0700
X-CSE-ConnectionGUID: /dTml4FWQB+wsRVx/a7dRQ==
X-CSE-MsgGUID: /zF4dSMKSg+dupjpdi9/Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="253693675"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 15:11:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 15:11:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 15:11:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 15:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfxHNcKg32ESXvDho/RRiUvRYF2A6RrrNz3NYfVxPDOg0T1Uy5a1yOdwjZsueiwQM9pQTdDPyJtC3Xtke+DY63Jvsbqoj4DYzZKAUx+r+Ukh8m1kB45T1i5S4ThtTjZhD2yA0VYCWs8SRVldyEIsGYMpCj/I5hqjmO5yQ7R36m/kwf61bQpr0/idAyPeBur2XBOlb7F0QJzj3MdDA2UpjMv/ApSZovc3iKi3CbGBX95UqJNlJohOEuX+L1aYSlUjVGCvxkkRHT58y4yfGI5SoSpxMJDtr0K9VCVI04ywN7+3horiF8A9f8x1pZHSDeplguFmtwP2s3kjcKFMuDFiyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXyNYEqyg0fHzPm2VKs1ooXuw2jUsQtHU+jfjUeCUnQ=;
 b=oyIfVfB+Qrpgse14Q8L7XgOXXWvw3ySNjIC4VCvNogNqMiu4nbNqA29NMUDBqdMShXpSkR55q4aQmiHGyOjHczDgb78XkofpY5ykxKoluXgx+n/Zcly9+98JjcE0Sz/IEfodJTG8sXMNXwWHSoDkPeJkQunSO9G8ABefiacA2pvjX/1gRxLugMiRcEpNc+/9rk83a/cfaZCh3bnA3+pVthQigwQFeNsUMN2YPOFss2GUWXHIdGHIfWMhsRYIhS64HBivaatF0vBjeqmIVyF5fN6GiD2uIHFK6A2uMa8EZShCJceVM/JiyPo5+hmFDkyw1g6ftavMQ1z4aEdG3Jm7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4660.namprd11.prod.outlook.com (2603:10b6:5:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 22:11:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 22:11:04 +0000
Date: Wed, 15 Jul 2026 15:11:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] xe/userptr: TLB invalidation new pm_runtime ref before
 submit
Message-ID: <algFdkgrDdGGsjS/@gsse-cloud1.jf.intel.com>
References: <20260715140133.1811959-1-dnyaneshwar.bhadane@intel.com>
 <b32d3a0f-e0d8-4aed-9a39-f3c317c33c3c@intel.com>
 <alfmLCNnyyXZgOo0@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <alfmLCNnyyXZgOo0@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4660:EE_
X-MS-Office365-Filtering-Correlation-Id: 61720c83-78b4-4970-fcbd-08dee2bdf661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|4143699003|6133799003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3ruKfXHmb7CBPonNcgNdZxqoU13l7PUFvMs+qSqUjG/che2uhO7+y+rq5Dn5oeV2tGnDQKaXCrIntZ2rYQ8dpCv5ElwOpkm54Mx0Ff3X6E+l4YXVanYh9snkSa6l3iXD0lFDw6gClJaMKVqEIeuE954wOUG3LWkJ/mnLoRHqlB9obD+4g/72QubTWx5S+ByC3UsSXAcb7P1avkuU4T8SAW1bqxsNT+ZXTrXT64/LSpv7+XkmAhZdIFdDpdhaeBmwuSGrZz+IIbTIyUZx6rnewZ0PsvNfsvxLOBsEQ4SfdyAmnqCAWkEexHbo+HhC/pd9qlUd9qdDuChsTIGamnldxeo4fMCIV7/7sTV75SORKJRmhuNBZoK8Loitg+yoAY/ZMYrg0QWshYTuZJE7XZxgzPBAbY/M5PThgSHxRyKyU8ZzqKOwRaUN+s30m2hWZOPsdFb4nbvu5LVaMV+HwFZbsufRUnlpBmt3hdtYCI2PA601cEhJHDvmifu1wwkIlR4KomJcw2985gHoner0MeHHKJpXqecWQdOYmOlOs9VxEnxa2Mg0XA5aLv0GA6hBddz7dGKSFLTLdVLrHBBGjuTzQgIaGvA4whB/V/DlRwomqL7HUBktRQjzzzA5jNsHVy80eRJ60kjnjG6cMMv74b6R7N17iblj730QfyjgB3XSUC0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8SKUpPWYPLOlHmYwB93WFHWcYF8eQwcCTNQvjBlP1eWdRIkZ5MB9yXjAyUSU?=
 =?us-ascii?Q?/rzU6RBHQg86ZFFiwZbAqRmS6lZLMkOGkqlZ30DYFqU5eyl7drdKdfMjlh4C?=
 =?us-ascii?Q?0RqMN8F5QwCjSxM6Pirp/DN1SL5niux14VzpdJhRz/OKzRevLqr0J1eqq7//?=
 =?us-ascii?Q?S5lq4LkQ5L44q2puaEWS91awqkyS43PYrXiCvyvTMj/7z5j7+ZOEseOeI/Ds?=
 =?us-ascii?Q?KzgbkvPMpFd/TL0xeVDQK2/bEC2UxlYchj3sGO5+2ip8CxS9a5CqY8KWO/nd?=
 =?us-ascii?Q?+/egw7L16kLfaXjKfdGxsoYPvTpoNgnYdmUW+Bzx48Xvv0Jo2pRzLdQWDfOH?=
 =?us-ascii?Q?zIzhQTj8XxF4LFpa8B3jOTyAd6NVb1w6ozhHtjK1sQKdn85+pCHsEKggEfWh?=
 =?us-ascii?Q?of+FLXpf6e26EmTeWm9X6xLwrJTFdMZaoT0I/IrtfnK6PvUU14yl9Sl+O86m?=
 =?us-ascii?Q?qcU63eErvAImCXU2NKFiXdP79UONax/cD5qhY4OyeZlxtl2NeHWTYL5A+vWK?=
 =?us-ascii?Q?ggjCuoaf5RLETftNi7ej2xleVlxw30Axd8fF8WPSgW1nqNaywg+wdnQ2qhii?=
 =?us-ascii?Q?jXR12T7P2wXNuGK5RF+oGxXTv5PAFVvIXXdqvNz3Fd4XtNJYny6B4oHZD4SM?=
 =?us-ascii?Q?CI+tLsgg/sQuXC4VrgL6ubM7lC94cOfUAoFtoCpAuMzfRwF8DcsgzHZlxiMm?=
 =?us-ascii?Q?a3DfXAES1SEKmRN3n/VMEcQifroAQS3yTGkCfHy73GWExRVR6sv9iqtbUQN1?=
 =?us-ascii?Q?QDvIrMGsBQgFudCwokM7Yf/3PLlds59h8IcOdiEIUxVdfidtltkjmjAuY1jD?=
 =?us-ascii?Q?N+a2p2gS9bl21vQ0VFwyj2jqUC2REjS20QOGR7OSJb9N6rrqimeMyQ6EqLu9?=
 =?us-ascii?Q?TykkFHYyNyEpMrOGKjNk7SxGfSj+X5RglYM5A1uKZOpM3OaUKSCCDX7VIyUS?=
 =?us-ascii?Q?6p4WUYYrkg+qqsAyfV5w2C70DvrLwm1ClUkKISRnDP32gqf/n0JrVsHLBlqr?=
 =?us-ascii?Q?b1b0rNZT5FSI1KjcfBRfe+1byMc1eLcIzrNohyC0I78BjnFEzlthS6zOBT3H?=
 =?us-ascii?Q?3DqHtcg5fVRVeKsnVkACuCF3l+LlTrq5cdgoLtQiOtE0ovyfL1areKpCIxPn?=
 =?us-ascii?Q?cFunwrprAziWJUPChBgQP7pSf6iWuZNoLrvqyPDQKUmGphYkUGJm4SgkBtXF?=
 =?us-ascii?Q?cQOE5nxo5hMrKO2/EQvEsgIMDshAc/eVveoZc4H/DLkCa3K9ci53H5NRiRpA?=
 =?us-ascii?Q?YFSFRmUr5lj0ltgJTqkzVlo5yWoN/NMfX/Y3MCwY7yZbrSyGTYAdWZKuphPX?=
 =?us-ascii?Q?GzBuIG+DfUiP4w/8omUTADLWFL7/iJ33AKl1YoltJqMd3B3WwnJJbs6P6nmG?=
 =?us-ascii?Q?zqkyJ8kMPIhw6U//aAun3WIuybkA8s8DKXKe5nFTMUf+IDZ4w9BsTKBkqCyy?=
 =?us-ascii?Q?9bZ4d2YoSr/XhZYzo19/ET4mxtKE1tJR+aCdAsPkPTAzuRhb1qF+AW6/Oiu9?=
 =?us-ascii?Q?hhj/Jz+hEC0vkSTnqVPn8pe1KuBTaW/93rCadphctu9PIhdTqr0qXwPmeC91?=
 =?us-ascii?Q?3brcfjyPtgJAV8t/VxkE2H6CBDkJysZICysrp/fU9541Oi4nY6MWG/ZH35pL?=
 =?us-ascii?Q?WUz437wU1Yht+8BRFnojXWosft97jid8mYSeKtU5nfREGMbISUpPw0p6bWr1?=
 =?us-ascii?Q?KlKH3B98o/R87uNDtbbaEiBEXz0OanKIEz8OIMUNWffMYwQeitslz7C6ruvj?=
 =?us-ascii?Q?Kd2mcrG/ig=3D=3D?=
X-Exchange-RoutingPolicyChecked: gsegO1SHWw20XHe4U3qcaifE3vfNBLlXIzh2XKv0SQ+/T9De0nNKwwC73qPLdXI385P2jWKOYdSI5HRz20i7XKjGfElP2ccMeZcIaK8y44UQfgVXjcpw4/Q4RWecV2M4RoW+L3LSC+rEtdvMaoaAN/3mvE9Uxck4WqAWuZ3Ov+hgjJZ5jvn1Pt8JnzKHlURo4/DnD4a2D5Y03UlNX0SuyiglUhdch4d01naDV1DLE2m4Y5ev6apdeBJKJo0jmOtlJAavA+YkcwNLZvM3zfVIoONZeSWC35Z05Ng7IZnZLNpd2vlON/0O1JqJTyPLGKzb6oml4Xa8+gcFEfKFvL7a1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61720c83-78b4-4970-fcbd-08dee2bdf661
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 22:11:04.4690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qO3rAAVYO/ZE31crBrODd34KNVAAHtlJWpaS8MSyRbRnKUt2hlMaETCtXs7RlIacgVUmVz5P4cqqmZmNu4vEkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4660
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

On Wed, Jul 15, 2026 at 12:57:32PM -0700, Matthew Brost wrote:
> On Wed, Jul 15, 2026 at 04:02:58PM +0100, Matthew Auld wrote:
> > On 15/07/2026 15:01, Dnyaneshwar Bhadane wrote:
> > > Take a proper runtime PM reference before TLB invalidation.
> > > The MMU notifier path has no outer xe_pm_runtime_get()
> > > protection, but xe_tlb_inval_fence_init() called from
> > > xe_vm_invalidate_vma_submit() uses xe_pm_runtime_get_noresume()
> > > which requires an existing reference. The fence itself will
> > > hold its own noresume ref until it signals.
> > 
> > Is this fixing a real issue? Do you have a link to a bug report or a splat?
> > 
> > I think fault_mode implies LR, and LR vm is always holding an RPM ref until
> > destroyed?
> 
> Yes, we should a PM reference if a LR VM is open.
> 
> > 
> > > 
> > > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_userptr.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
> > > index 1d2ab678faf5..fc7e4b00fe17 100644
> > > --- a/drivers/gpu/drm/xe/xe_userptr.c
> > > +++ b/drivers/gpu/drm/xe/xe_userptr.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/mm.h>
> > > +#include "xe_pm.h"
> > >   #include "xe_tlb_inval.h"
> > >   #include "xe_trace_bo.h"
> > > @@ -103,6 +104,7 @@ xe_vma_userptr_do_inval(struct xe_vm *vm, struct xe_userptr_vma *uvma, bool is_d
> > >   	XE_WARN_ON(err <= 0);
> > >   	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
> > > +		guard(xe_pm_runtime)(vm->xe);
> 
> Also, this is illegal as far as I know. If taking a PM reference wakes
> the device, we may allocate memory and acquire a number of locks that
> are not permitted in this path, since we are in the reclaim path here.
> Lockdep should complain about this, but CI is passing, which suggests
> to me that we have an issue somewhere in the lockdep annotations. We
> should probably investigate why this is not triggering failures in CI.
> 

I quickly checked, and this patch does trigger a lockdep splat on my
BMG system (pasted below).

The only explanation I can think of is that CI does not have any
devices that support D3cold. If that's the case, we should look into
adding such devices to CI.

Matt

[  117.955089] [IGT] xe_exec_fault_mode: starting subtest twice-userptr-invalidate-imm
[  117.966389] ======================================================
[  117.966392] WARNING: possible circular locking dependency detected
[  117.966394] 7.2.0-rc3-xe+ #1223 Tainted: G        W
[  117.966397] ------------------------------------------------------
[  117.966400] xe_exec_fault_m/3038 is trying to acquire lock:
[  117.966402] ffffffffa04dd940 (xe_rpm_d3cold_map){+.+.}-{0:0}, at: xe_pm_runtime_get+0x6d/0x150 [xe]
[  117.966545]
               but task is already holding lock:
[  117.966548] ffff888110b11238 (&gpusvm->notifier_lock){++++}-{3:3}, at: xe_vma_userptr_invalidate_start+0x101/0x5f0 [xe]
[  117.966642]
               which lock already depends on the new lock.

[  117.966646]
               the existing dependency chain (in reverse order) is:
[  117.966649]
               -> #2 (&gpusvm->notifier_lock){++++}-{3:3}:
[  117.966655]        down_read+0x2c/0x140
[  117.966661]        xe_pt_svm_userptr_pre_commit+0xa0/0x2b0 [xe]
[  117.966777]        xe_migrate_update_pgtables+0x53/0x9b0 [xe]
[  117.966889]        xe_pt_update_ops_run+0x242/0x880 [xe]
[  117.966996]        ops_execute+0x291/0x8d0 [xe]
[  117.967119]        vm_bind_ioctl_ops_execute+0x2c5/0x5a0 [xe]
[  117.967245]        xe_vm_bind_ioctl+0x19ec/0x1af0 [xe]
[  117.967368]        drm_ioctl_kernel+0xa6/0x100
[  117.967373]        drm_ioctl+0x219/0x450
[  117.967377]        xe_drm_ioctl+0x5d/0xa0 [xe]
[  117.967466]        __x64_sys_ioctl+0x7f/0xd0
[  117.967471]        do_syscall_64+0xca/0x530
[  117.967476]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  117.967481]
               -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
[  117.967487]        __ww_mutex_lock.constprop.0+0xc3/0x1900
[  117.967492]        ww_mutex_lock+0x26/0x90
[  117.967496]        xe_pm_runtime_lockdep_prime+0x51/0xe0 [xe]
[  117.967610]        match_bound_vga+0x19/0x40 [snd_hda_codec_hdmi]
[  117.967616]        __pfx_is_hdmi_pcm_attached+0xb/0x10 [snd_hda_codec_hdmi]
[  117.967621]        do_one_initcall+0x59/0x2b0
[  117.967626]        do_init_module+0x5f/0x240
[  117.967631]        init_module_from_file+0xc7/0xe0
[  117.967636]        idempotent_init_module+0x176/0x270
[  117.967641]        __x64_sys_finit_module+0x61/0xb0
[  117.967646]        do_syscall_64+0xca/0x530
[  117.967651]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  117.967655]
               -> #0 (xe_rpm_d3cold_map){+.+.}-{0:0}:
[  117.967660]        __lock_acquire+0x139d/0x23b0
[  117.967665]        lock_acquire+0xbd/0x2e0
[  117.967668]        xe_pm_runtime_get+0x8b/0x150 [xe]
[  117.967783]        xe_vma_userptr_do_inval+0xaa/0x170 [xe]
[  117.967873]        xe_vma_userptr_invalidate_start+0x30e/0x5f0 [xe]
[  117.967959]        __mmu_notifier_invalidate_range_start+0x21f/0x2f0
[  117.967966]        unmap_vmas+0x1a8/0x1c0
[  117.967971]        unmap_region+0x82/0xe0
[  117.967975]        __mmap_region+0xcb1/0x1000
[  117.967980]        do_mmap+0x4fb/0x660
[  117.967983]        vm_mmap_pgoff+0xae/0x190
[  117.967989]        do_syscall_64+0xca/0x530
[  117.967994]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  117.967998]
               other info that might help us debug this:

[  117.968002] Chain exists of:
                 xe_rpm_d3cold_map --> reservation_ww_class_mutex --> &gpusvm->notifier_lock

[  117.968011]  Possible unsafe locking scenario:

[  117.968014]        CPU0                    CPU1
[  117.968017]        ----                    ----
[  117.968019]   lock(&gpusvm->notifier_lock);
[  117.968022]                                lock(reservation_ww_class_mutex);
[  117.968027]                                lock(&gpusvm->notifier_lock);
[  117.968031]   lock(xe_rpm_d3cold_map);
[  117.968035]
                *** DEADLOCK ***

[  117.968038] 3 locks held by xe_exec_fault_m/3038:
[  117.968041]  #0: ffff8881119f8fb8 (&mm->mmap_lock){++++}-{3:3}, at: vm_mmap_pgoff+0x6a/0x190
[  117.968051]  #1: ffffffff82baade0 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}, at: unmap_vmas+0x75/0x1c0
[  117.968059]  #2: ffff888110b11238 (&gpusvm->notifier_lock){++++}-{3:3}, at: xe_vma_userptr_invalidate_start+0x101/0x5f0 [xe]
[  117.968147]
               stack backtrace:
[  117.968150] CPU: 8 UID: 0 PID: 3038 Comm: xe_exec_fault_m Tainted: G        W           7.2.0-rc3-xe+ #1223 PREEMPT(full)
[  117.968153] Tainted: [W]=WARN
[  117.968153] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.5045.A00.2401260733 01/26/2024
[  117.968154] Call Trace:
[  117.968155]  <TASK>
[  117.968156]  dump_stack_lvl+0x68/0xa0
[  117.968160]  print_circular_bug+0x2c6/0x3f0
[  117.968163]  check_noncircular+0x12d/0x150
[  117.968167]  __lock_acquire+0x139d/0x23b0
[  117.968169]  lock_acquire+0xbd/0x2e0
[  117.968171]  ? xe_pm_runtime_get+0x6d/0x150 [xe]
[  117.968275]  ? dma_resv_iter_first_unlocked+0x189/0x230
[  117.968278]  ? xe_pm_runtime_get+0x6d/0x150 [xe]
[  117.968376]  xe_pm_runtime_get+0x8b/0x150 [xe]
[  117.968475]  ? xe_pm_runtime_get+0x6d/0x150 [xe]
[  117.968574]  xe_vma_userptr_do_inval+0xaa/0x170 [xe]
[  117.968648]  xe_vma_userptr_invalidate_start+0x30e/0x5f0 [xe]
[  117.968718]  __mmu_notifier_invalidate_range_start+0x21f/0x2f0
[  117.968720]  ? lock_acquire+0xbd/0x2e0
[  117.968722]  unmap_vmas+0x1a8/0x1c0
[  117.968725]  unmap_region+0x82/0xe0
[  117.968727]  ? vms_gather_munmap_vmas+0x2f0/0x340
[  117.968729]  __mmap_region+0xcb1/0x1000
[  117.968739]  do_mmap+0x4fb/0x660
[  117.968741]  vm_mmap_pgoff+0xae/0x190
[  117.968745]  do_syscall_64+0xca/0x530
[  117.968748]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  117.968749] RIP: 0033:0x7f0fdf5331ec
[  117.968750] Code: 1e fa 41 f7 c1 ff 0f 00 00 75 33 55 48 89 e5 41 54 41 89 cc 53 48 89 fb 48 85 ff 74 41 45 89 e2 48 89 df b8 09 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 7c 5b 41 5c 5d c3 0f 1f 80 00 00 00 00 48 8b
[  117.968752] RSP: 002b:00007ffc9e966020 EFLAGS: 00000206 ORIG_RAX: 0000000000000009
[  117.968753] RAX: ffffffffffffffda RBX: 00007fadeadbe000 RCX: 00007f0fdf5331ec
[  117.968754] RDX: 0000000000000003 RSI: 0000000000002000 RDI: 00007fadeadbe000
[  117.968755] RBP: 00007ffc9e966030 R08: 00000000ffffffff R09: 0000000000000000
[  117.968756] R10: 0000000000000031 R11: 0000000000000206 R12: 0000000000000031
[  117.968756] R13: 0000000000000025 R14: 00007fadeadbe000 R15: 0000000000000000
[  117.968759]  </TASK>

> If we need a PM reference here, xe_pm_runtime_get_noresume() has the
> correct semantics. In the TLB invalidation code paths, we do exactly
> this when arming the TLB invalidation fence; see
> xe_tlb_inval_fence_init(), if that is failing then we have problem
> somewhere else in the code that this code path can be reached without a
> PM reference.
> 
> Matt
> 
> > >   		if (!userptr->finish_inuse) {
> > >   			/*
> > >   			 * Defer the TLB wait to an extra pass so the caller
> > 
