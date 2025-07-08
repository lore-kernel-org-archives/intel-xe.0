Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB47C8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 20:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8715110E1BD;
	Tue,  8 Jul 2025 20:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kSICUmha";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3822310E1BD
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 20:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752005322; x=1783541322;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+djq07KsegrX/oULhjFX2AMETf2HyrN318yuD/mM3eU=;
 b=kSICUmhaFrwRghEiTGBM7s/ZNhOjOmBG6VfQbcdM0YqhekKvzNoksetI
 in9+qoNh9/w3NRV07PXXXJr5GbGdYZ0steE8Er27x3tZH51Aq9F6buzMv
 566tP5SFgp8pNyUNEdoZmir3S0L1+97//ZA8jhrM7QumYzmSqarQaXJzx
 e1W+wEDzjJJru5XKWkrvAo++Qb500tn3Gg7ljU6HqrE+Z6nHb2BpKn0g1
 SbyEX2QnW7fcEAZNsF+JC3NQkp5fdyaGl5QR2egFxKrOwzoAeuBMcfnHI
 vN6RKK14S5B7Djli30MR2gDPTsafrZ1L45ykcfpZaccMIR72Am5xETm6m A==;
X-CSE-ConnectionGUID: HeifoDSUSEyUWkot0tKtew==
X-CSE-MsgGUID: X9K+MMpaRriOEAxXVFKmJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54186446"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54186446"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 13:08:42 -0700
X-CSE-ConnectionGUID: IURf3GXRRRWFjw24oTrPdw==
X-CSE-MsgGUID: +RcbigjWQpqbjtfXwtOGXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156163353"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 13:08:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 13:08:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 13:08:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 13:08:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3cfwRhPW5iL4PdFltni0qbVczPMu1JFCeL0YSu87Yfk2I83EKTb3bS/lfJr7SnYc/F+DgoEArLdZGleWV5YAo/Y9gG5AdDqfPNspxAe4zaay1COIXxZfSP7qw20YsT/IGnOAgeLTrKgVihln5hSbnY4AP7cBQg6E7my+UtjXesX8mQLLdEYQl9zeHiZmlbU4bgihLhZUMfIlEhBAIh63NLNZgwtLMoEHF3uhBFErlaMI2gtrszBBSIdR7C4QKI4xI3TCAHouHwY+Lyk29LbEP7Gq08OLcPachd7UUADri+uJ0Bi5zEbSvHVu8IzXUZ4TRUW4DifgLJDW8abnE0/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CTFNC79gUOfxxaI5un2nIox3D0/gj5SWxobCtCkwvs=;
 b=qqUIYtY0z6NhlIU65fjwcziYny8qRM/TxJCDmi/v0xJo7YNzu8Fr7MoUr3nNNXx+FPtEtErJepSXBCwvRF20LYX1aIYyWZsVonGhaG+8KYhAQ9n+Drgn9mkaYIGjbLSb2tonkvuATr5lGMCBf4vML3tTA3iuz5urWGrApc7BZ1bfj5MgebENoYkx51LWshbkzjLXBz52oGeLGLopjqldNYVug98FAmUpdTsmi4MYkm0qs+DYUgWu4EKuZsAMmsElQfbyJ54lD/3p3gr6O6PhO4vUhQoS6B/sywwBerCQcW075ey5F3LsebWs9/NLqr+paIIZ2QDWz0AiNvfw7DWV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL1PR11MB5320.namprd11.prod.outlook.com (2603:10b6:208:316::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 20:08:23 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 20:08:22 +0000
Date: Tue, 8 Jul 2025 16:08:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>, 
 John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/pm: Restore display pm if there is error after
 display suspend
Message-ID: <aG16s9ngmKE4xR0t@intel.com>
References: <20250707015825.3522467-2-shuicheng.lin@intel.com>
 <1094c4f1-3273-4832-b282-7489d938eb25@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1094c4f1-3273-4832-b282-7489d938eb25@intel.com>
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL1PR11MB5320:EE_
X-MS-Office365-Filtering-Correlation-Id: 00833d45-e3d1-4539-80df-08ddbe5b30a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0qOZ9/pr+w868wszHaLVwtpUBpyO44PmYvAaPVF5SDA0kxDcd8AD1JPTDW5p?=
 =?us-ascii?Q?+O3LwtzKHOkAg1Obhy3ea7ykJ2rElQ8EJ959yEso8SZypUA5taLhAbpnJ54A?=
 =?us-ascii?Q?gQDxrWCEzt3wgZ8oulosp+t8eMGgPFlH9/kp8YHwbqbIaWeLdB1MrkCJB9rU?=
 =?us-ascii?Q?prx9gesZ6xhj9KepuYLuZX1VWAd3r6B5HaZipzVeRWyIMcOjaHSGVcloFBTu?=
 =?us-ascii?Q?V2VOgfmzdQ0XBMv19pStLEf4c+j5EngOgoyi9YgeKTLt7iLoSAyqh6XAwd+n?=
 =?us-ascii?Q?3TBgSUVHrPFuLZpy7relXutn7o3IM3o2i+f3WUKK4EiLiUzW485pgqCof+Hs?=
 =?us-ascii?Q?h4Y/CPrk0KPaF7uMxCY8rRRNTkVXVYpc0a5QQBQ5SId4yi8LR5tTet94O4qY?=
 =?us-ascii?Q?bDvVZqDvMMnffh0GXEoiIoh2S/4LwgZSBrPdcqx7S7dRE3QZPTb7fjV0u2Ns?=
 =?us-ascii?Q?xT8bbpRZufTiM2UPICL8gbpc7nRx2b4RYXEvE7EODH82BLY2VVCy9dFh5xM2?=
 =?us-ascii?Q?7HvSu8mu4oR6K13iZsaFRo36o6EaA+PpB7ZUTZRo3GRYzS45dHfyOs1oWukv?=
 =?us-ascii?Q?Ci3Z4hZHUjTVMTOT/L0XxNUBQbePPGjUkI/c5gmXqIvyvfxnJwxenz8ewdEG?=
 =?us-ascii?Q?/AlfM8D1mgM9lonf2wbSW8Ax17D0ONAFICeasdu1I1865UlmYZ+9O4i89F1O?=
 =?us-ascii?Q?SxxVvsA3oLrq6pk57mqNJ/aj2VuGkGw/opqbYTwxGPFd2ijQIxe1PbCLOVjv?=
 =?us-ascii?Q?T2Bc79nGj3fBWy/ywtloa8c8OjfAwlJM07Hubx+hM3MkNhPwljlc3X07+qS+?=
 =?us-ascii?Q?iLKLUNS6DrNbewjsoRngHV8ado+luWQuGuS5BU00yIS1EA9jf7SYvvrd69Ee?=
 =?us-ascii?Q?qWMFG43nv83g+eOnAmiBUa59hXInzqUCFCu3TLfuf8JJpXQz775/UuOmRGvL?=
 =?us-ascii?Q?iFrV7t6ImDYVySYvo2iEYTOPZrsggQJujNesWTYHqWHRsriyX4tlO0xWCDb3?=
 =?us-ascii?Q?m1cz6wyw1YlXenI45x3Fs9aYMd9bU6BeqfcwY/P56aJP+qObAjRuBfRkADnk?=
 =?us-ascii?Q?wyJ4sIKaSsuRY8RaeFMjWVdkZmMGcyZe6U1jkQ0DZR3lanax7u693W7Quw8x?=
 =?us-ascii?Q?FM/uWhCARvKfBw4Ng3oyazI9w1/wzCcqRjQWI8pwkgcAFnzqaw5cELvn/tiW?=
 =?us-ascii?Q?j1+IqeJ6inuFz+Ly0XOWvmbkGdQpdNcK6aExkdRA2Z40+9TSXepadZsYc+an?=
 =?us-ascii?Q?wjxQumRrFZ9O5wez6Om3ljqoefCfb266nxJAWYwNrgmawXm1BUQ15Ulos6DT?=
 =?us-ascii?Q?8k2FIv0Q0zQgxICXZC+cLnXpP4cMPLH/7zZzpTdE+u60hdf/ajvaJBCio5Xe?=
 =?us-ascii?Q?VSLmGCc63lFpmsTYzNJ9cJ7QF7h0thOC3VuY00SF3UJKGBsIRiKl9YXMRmKh?=
 =?us-ascii?Q?pFgn1vFF8TE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GvxQkcLmmYRo71XBwgrVF4Rr9HhokUkM6bPb0izgynHWba1IIdKz9bX0NQC/?=
 =?us-ascii?Q?IKyFPGXO38H54pTH+xt5ssANqYL9yih4mgNurONJwFz9wDxhHBgsZdHJZS2V?=
 =?us-ascii?Q?U/2YwvpgEpV8f0ufr/VUtY2ZgrGvVhsYFkncg+cIXGXgl7Rv3EXOheibiun6?=
 =?us-ascii?Q?Dur6si0p+Ap2W4/rfe8276JkN/YrEW/miFchS2LDLKoYilk/QqcpKhnHP0NI?=
 =?us-ascii?Q?M6pNprmUMSPQCaCY76C36B0SWWxElYIfJdCWVgZHr2j3bHdtI8eH3SprTJMz?=
 =?us-ascii?Q?ZPVKXpahpT+chZk81xdlbKOKHXkYaJJ/iycnRqllGbnGrBDRH7zAIIgh+1lR?=
 =?us-ascii?Q?RmmpijvPUQpAl4UBjzoHgSRlJrPGKW2UN0Q/0YbmY76IuLJB+SV6UZDZpM58?=
 =?us-ascii?Q?69KyTRySUcRwM3D9yQXXGJJ5D75NsjSfzACXgbRnV1hI/pbAY2KV1BSMZ3+4?=
 =?us-ascii?Q?PVTr7UuDvij3nfrXmZNxJVblie8v3kUGmj3QUx/LcvMjaWNjIAFebwHS411L?=
 =?us-ascii?Q?lBgaucU+9iGD20oYNF3Qwe226+MsjXaK7LaggFaoZ75ofZ4gwr67SfU4myAd?=
 =?us-ascii?Q?1y5J/1q/+o1JC6r08hu1UdJNRJSDYmwFOaGZWMUZodUzDnlHR/8ssnzvteZc?=
 =?us-ascii?Q?vnzC2Hw4BhiP4vKDqIWy/fnqlhlP8P7+C7zuZWjrOQ+UJMaoggqEvKfrjiSc?=
 =?us-ascii?Q?0ZOpOs39hraoIiLHz/c8fr2YhJ9bV37ShEDJ65tClwpRsGTf8u07QNFk7BZJ?=
 =?us-ascii?Q?zQe7s4uFbZYJHLBmRP+m19z1P5vhEI8OwSYhGaXhEIjxo3pRS7a1UMMVJvBq?=
 =?us-ascii?Q?q1i9L7xmghJbRilVK4nbwRZ8CILNznWNJGhFRBGQYFl1iO9cdKzIU6EBIwL1?=
 =?us-ascii?Q?2ObR7bSawTgStvv6B07lBSnoGvP8+W7CxjIvYrMXeBuYaLZx3yP8ZwPZEvCd?=
 =?us-ascii?Q?cgMJdiJIzxZ5D57/iKS5v6uT6HERVF5nKGBngUdBvEYf0wqYUflaWnmiiGns?=
 =?us-ascii?Q?yb2t6hwYqRIRjJuWD7Mqdl5CwKrRFEDjDqeXzZYJ26WUsw16gCDajcvWZsgj?=
 =?us-ascii?Q?KhFnAJbzVGxtzF8AnzbZOUFQB0U6Zq3b+DaT/BlEe8KNGVYc6c7ezB+5FjTE?=
 =?us-ascii?Q?0C8An5R4DN/nSWyjfOZQ+WVW9wq4rAfdyz2qOmBPJ4ER/Uat072fbTzNuY9T?=
 =?us-ascii?Q?ShMSj8F//Ee7dJiSJ6D/Hv7ZnAoykEvfSudCtnoEaTus7hgH2SW08FRqLt4f?=
 =?us-ascii?Q?VrJE3RObTMVCwopBq90u74V76zHfIpylfT4XW+4mmP1+E039lEh8qeUK4piu?=
 =?us-ascii?Q?X0fzh9n7Kd8zeB5wAkOvHjC7sokJYD/WND1paJlkaVYCqz3eyPAEKgDxBL4F?=
 =?us-ascii?Q?ZbrV/1bWDCa4fT9etMEi0zMuwjZQYDI7up+riA4I46e814Fch5q0msVDuEb0?=
 =?us-ascii?Q?95GiDsGZTgCsaclZVg07x9r2AdcwOlBE0PkReShVQFDOK0v0DhUme75B/fRn?=
 =?us-ascii?Q?vuABd19qPNEpiX3YzCR2aRk9cINm6h5hVgslZVgwacf16uq+/cIaGtN8mOfK?=
 =?us-ascii?Q?g7cLBZRpzRhCjP0rxPwY+EdxJMYRWBQnhegiVD5GFH21GMUODXyOb+ydHtWV?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00833d45-e3d1-4539-80df-08ddbe5b30a4
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 20:08:22.5931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKl4ZjwPUGDl43ebPCRJzYQdwFiV7E8RgIWcYkw6MTOE53mQwVJqWKQijXPWPJB6czG2GmNkh3/8I1/9r2/HmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5320
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

On Mon, Jul 07, 2025 at 09:11:41AM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 7/6/2025 6:58 PM, Shuicheng Lin wrote:
> > xe_bo_evict_all() is called after xe_display_pm_suspend(). So if there
> > is error with xe_bo_evict_all(), display pm should be restored.
> > 
> > Fixes: 51462211f4a9 ("drm/xe/pxp: add PXP PM support")
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> If you look at 51462211f4a9, you'll see that before the PXP changes were
> added xe_display_pm_resume was only called from the error path of
> xe_gt_suspend (even though xe_bo_evict_all was already there), so I've kept
> that behavior when I added the PXP changes.
> That pre-PXP behavior is still present in the 6.12 LTS kernel, so if that's
> wrong it needs to be fixed there as well.
> 
> Looking at the history, it looks like the patch that moved the call to
> xe_display_pm_resume to before the evict_all without adjusting the error
> management was this one:
> cb8f81c17531 ("drm/xe/display: Make display suspend/resume work on
> discrete")
> 
> Given how different the code is, I don't know if it is better to send a
> separate patch for that to the stable tree, or to update the fixes tag on
> this one and send the separate patch when it fails to apply.
> 
> If you want to go with the former, this is:
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> 
> But please also get an ack from someone on the display side to make sure
> this was not intentional.

not intentional. definitely a bug.

Instead of removing the fixes tag, I added an extra one. And pushed to
drm-xe-next.

Shuicheng whenever you receive a notification that the patch failed to apply
in some stable branch, please follow up sending a backported version directly
to the stable mailing list.

Thanks for the patch and review.

> 
> Daniele
> 
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index ff749edc005b..bcfda545e74f 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -134,7 +134,7 @@ int xe_pm_suspend(struct xe_device *xe)
> >   	/* FIXME: Super racey... */
> >   	err = xe_bo_evict_all(xe);
> >   	if (err)
> > -		goto err_pxp;
> > +		goto err_display;
> >   	for_each_gt(gt, xe, id) {
> >   		err = xe_gt_suspend(gt);
> > @@ -151,7 +151,6 @@ int xe_pm_suspend(struct xe_device *xe)
> >   err_display:
> >   	xe_display_pm_resume(xe);
> > -err_pxp:
> >   	xe_pxp_pm_resume(xe->pxp);
> >   err:
> >   	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
> 
