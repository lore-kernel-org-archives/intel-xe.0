Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B34C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 16:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F7010EA06;
	Thu,  6 Jun 2024 16:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnHUNHr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A60610EA06
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 16:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717690523; x=1749226523;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3DS0L2zrs0RpHvyzDpJV+Qba5BVapPwSgldjvqCdXYY=;
 b=hnHUNHr0c+bCljgO4Bu1czixcUe5Y/TSyaItHWL/J4n2LuffEWSvlmNX
 Jsn5DxJv4zBQcV3WGOLL4jQg2Y5zehZ+sx4WP7WeQ5Stm1X3RoiCwQVOz
 WeaKmSLCV718vlM3wPF93nsRoodbt16BkXz8J2N3ManVESYeSSonkvoOC
 j5LLzf/BR95x/70/Swsfih/HdicUyTD1kM2t37Jod7uEAnf2xq5Lu4BYr
 JdwD3ZOSqgRoU1fwdk5GDnExQ04TMiA933jYOexaSafr6x48jkFyYYBjO
 0r+U7iandHW1RQPHuq4gTnlED2+Zx5AO61wI6Qcb4mVcXOxPD0CHJsp/A w==;
X-CSE-ConnectionGUID: 3/lW/ndUS969mZBsspnmiw==
X-CSE-MsgGUID: FLd+C5VhSbeGK98eC8NzqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14526293"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14526293"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 09:15:16 -0700
X-CSE-ConnectionGUID: 196b3ClETDG1OiryVjjzhA==
X-CSE-MsgGUID: T71q47SKQu+QsV93qCADMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="38697703"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 09:15:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 09:15:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 09:15:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 09:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJ6dPbkHll/3yqrEFEKUt4GxRXqHXbxa7fBsbXukDC0g+CbFRNGSgIcTcmgUb3fMqtUFn1I2MoJ85Eb044ETj4nP3qI6hrl3/fvrSXmxa5XNQc68gqAqGDk6ajcTJs6JnuQAvlmaVr8PwwJwMCB31u0AjFitAiKSSLb3qsFPyRLQ3dTMkUP6OXS6o6+pp3w5wyoj4a0uMkVTm+8BNDRp77J97WU5qA/Di+V7MqrrcUoIkIeKHkSb3wrgzxq3ZLOIf469UPqXlhsfYFAXfYEyPF+vVT2uyAKZQQq7chj2SzKqJl0qaPCZwNaFxSObJ6ueAS2sxdQFfhJm+LdLjERgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWQisISxV2NSLPhRSsPZv1b39qjPIMbdWTM0wxxvs6Y=;
 b=eoaq15Mq+62TblVoUUbkQqm2yLE5W4DZ+/89FFQGh13eivOnAzi6L74WVZkBnz73eQ3Fxr1gXehZHEZcdeBceMpNJmB+lQtUobQDxdLSehip0QdUrYy6MtauixWUGjyidaWJHqgd0ip6vorvLNPahKkHIGl6NDH5+tTJNKWDgUS+rsm2C810Hdt0MBXPITQCc5TzQnmEhOGncvQjXzdSf5HzpNC0pQgVBVDPEa6QJPYpnnio7GnBcwbEGxKNOriZjKLEJilJAfbRsqGKv+LhnF+R/MxHSpEL1EjeewTpHUsVh/XBGQ5l13bvUYYICDxUdjvSes1rCwgmwst5N6B+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 CH3PR11MB7764.namprd11.prod.outlook.com (2603:10b6:610:145::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 16:15:11 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 16:15:10 +0000
Date: Thu, 6 Jun 2024 16:14:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe/guc: Allow CTB G2H processing without G2H
 IRQ
Message-ID: <ZmHgWKujsXIGcR7K@DUT025-TGLU.fm.intel.com>
References: <20240606130639.1504-1-michal.wajdeczko@intel.com>
 <20240606130639.1504-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606130639.1504-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::22) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|CH3PR11MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 225b0dab-46a4-48a8-e4b4-08dc8643d6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gnuEtTE5ZG4U1lE7spwYvSZNtSBD/Otfe8pQ1b/dzuE9K/rENfNCp6UBn9v0?=
 =?us-ascii?Q?L+bqKDMJO4stqpl9SwjbFgZizD/5TD/Q66VtAlkMKwwZOquCN7aNu23uq3Oi?=
 =?us-ascii?Q?dj8tyvpdsAgtdPmwpyblLW+GBjIJ73OoJ0u8st9NkfcoQoPnW/U8/xMNPAD7?=
 =?us-ascii?Q?nMnY9142UYNgcB+bIjQaATsQzichFmgn5XVH9UAVE9hwX7bnUwXWk2tXxCe1?=
 =?us-ascii?Q?3/6lpE9/1+wTNcxq/SFsvb2BseKFhomEHqgi1SyI39onwib+kgsi8F+ozS+1?=
 =?us-ascii?Q?8mwTs92pNjNankt2GQmf1g9mBnVAGwo1IMFlPHpn3KzV3+rZludJ/b/IgMPd?=
 =?us-ascii?Q?ylurmuaE6s0jfIDz6AzTMhdbC5PgjEVQcmIGi7tHb8/vqDR04sZSrLVY9Cj9?=
 =?us-ascii?Q?tbkluxqVq5J84sF9qy+7yEwgaOUR05A7p+IKsaIAeoFGAfZbTHHpraiSZJa+?=
 =?us-ascii?Q?t+PZo3pv5G0YoR7WZ5QhR5lVfnBZC/SScSKlF5RDIIidw2vkzAMIOGxs28r0?=
 =?us-ascii?Q?GODpUWyWteArLFkibJJ+r7Vw3h48XkEoiavKbIBZdYJkEDAoXislKs2E9QFG?=
 =?us-ascii?Q?h98LB9Ovy5+sY8/mr8MZh1jHCs4+7ZVDyJ7toLB57qH/N0l4UCa5G+y55mCE?=
 =?us-ascii?Q?rBUq3oeXFSPzkLxX6dbkCaKCWmrLtdClnYBQEJIT+2b3mxU21ra/Z5yvNbUs?=
 =?us-ascii?Q?n5/izINgH8RSPZ1JOGtZAlmbShsGXE3pMlRJBGMwoyLnZMHjwEF2bQgZQBzL?=
 =?us-ascii?Q?ObzwOuzUQ4EtxE9GGw3fLvraVL+LNNx+FO4FcFfQPFWlpmFk0yZeOJazFsak?=
 =?us-ascii?Q?4mkOdFSm7d0+lq4Gj/KcEJIanA/2SYy/V1W63TqiaTfUdP8bsvhSS7sL4+Rv?=
 =?us-ascii?Q?6m6W7PQTwA/NgNiQMbpWPFL9A5kk7ztFDRvxrxKwtBGOHVc1qro9uLW3omnJ?=
 =?us-ascii?Q?Q+aL3Ro8A6H4Sta2LbE0QLvuB1iJUgWke+Rupd3Lx/DHBCRvBGFgL6NfNWhU?=
 =?us-ascii?Q?PcQxcuRPaYBTa2uvuTf6rZlFHbjYhNAczZtpoPZbUL9owTiI3J+zcTUpL2UH?=
 =?us-ascii?Q?Y03cDrnCOSNxN+SJ0vtWPK3ExA33d0BqdPr6zcRvbhrgVWIEB/lPKrZc+2Lj?=
 =?us-ascii?Q?tgTMBurJhUdmDrf3hgRsEeW3WPvtngVWokS42M9UeMd34DT62EhpNQcanBT9?=
 =?us-ascii?Q?eB2eaS2OPWKO5sam1vJ0o4LUzC+a4+qqdFdmDBJ8GQQpayMLcW8BjOIwbJtG?=
 =?us-ascii?Q?gZe0gVPMsQxiztxEj+6p1alywr667RVrfHGJxJsAVf03iAgsXtBUKbd8ey3O?=
 =?us-ascii?Q?Jmya3jQKFGm7JbKX6YgkINu3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?74DZp6ZcR+G41NqrqPujH0gzWCZy/v34L+ew2Sv6/M5y9v1tpWkKmZzhPYH1?=
 =?us-ascii?Q?VbM1c+33b2BQp+KlI6oOI6Vmf49U19GMKSnFQa1tuOezzp/eDWg9lFRhU0KB?=
 =?us-ascii?Q?/SXqN6q3IyJf0TP/GnrfMOfp2YlEXFOciviv2CxTCx4iW30JLHgeZEmPPaLu?=
 =?us-ascii?Q?BWCrh/tCl1/LSsKoR5lZVmhhigl/vkLV1v5HgGbKILwVbcV03edFS3sK3+BB?=
 =?us-ascii?Q?cskiXciHetdjo0wfRCqUcFj1Y05J01cZueGYT1CXW/mLjTTWTS813igzcYhv?=
 =?us-ascii?Q?0hfaBuNmfcOlcE0Mzr4fGWtiTqYchqiZs3grzUz2/FiwPoiBbFN12PgrbMia?=
 =?us-ascii?Q?fD9YcxD8f5WqD6a9CbISAXDqNyPgjVrj9rKVqFEn0X9bu/gyw9bjOSkHsjke?=
 =?us-ascii?Q?8WSOHvCe2HWmYmGiq90ElRyXa8JN8BvbACD3+eu32BJdvUmLYoEvGAzwWHLV?=
 =?us-ascii?Q?tlFI4VDk9LcmnyeOs1bd6aa2enehYiZAntITbSbZwpWW1yh2xAyvYo0LL7tq?=
 =?us-ascii?Q?9v0+g25C/4UeSnk3+ajYj6SrNx4/pqDxjGhnIVpzKGs2VTUFFnRrlzeUoZRf?=
 =?us-ascii?Q?x3jzk7hUzUnmGQfUUef36h1NztR4+Bqx/ycXPXDedRapObX2wS4pln7Sonrm?=
 =?us-ascii?Q?OtSbWwJ+SXe5Bed10OEn0eN9UzuJ4ZvBBfUyAU+LRIGknFkUpmqhAVxxKJmd?=
 =?us-ascii?Q?y94+UHbjNNDHIs/9dc8nqlJLbjna/SWIg5FWqJmxv4x2y8t5PQ2WQSexn/hH?=
 =?us-ascii?Q?zmkitp/ONBO9qQfVluNtqCBI0HUUPf2IKNix6+DIrXpl55a5pRfVvFIg6PwS?=
 =?us-ascii?Q?WeG/pEdaQLTAxGjTZuaf13sS0DPm6MHS/ddZ/HX3sQG3hIvAyBpOjZBld/0n?=
 =?us-ascii?Q?y6A4Gh3Q5KHYyj2ODJnYYUkPOLZS1L5wicFQ9lhbZr7pYYX+bx8PdziZmG8r?=
 =?us-ascii?Q?/eoh5WVuxmd1TDBgYZHucZ7GQ0eRlM25hOf8h5SSqfiR4yH8BBcuzMCkeiMD?=
 =?us-ascii?Q?FLfIEFmvIP/Rrxx+YAwq+hpzu5w9xY9rPlFgGLQdbz0y2cpTSqKLLuWssZNc?=
 =?us-ascii?Q?a8874DECtYwiysp3T88cR90Qe/SYEpEcTb3xFVTScFJ+gFqaVgJkzLPePkOt?=
 =?us-ascii?Q?0wxE1IdPxk7zX8LkEzd8a2xBHK8vngXLaQW/AkmpX2ia5Q1nmgfvH8tqHAg3?=
 =?us-ascii?Q?PylQxlgB8JQPyYaoNbsjfR5doEtDnSR2M/SCd/K5f98oUpqolW0tfpJs5QAv?=
 =?us-ascii?Q?ffQN48TY4+nvYqNbwklwByrVI3pVIM4BaWEQzBbroXWyChPEeLLRrOjyWl3n?=
 =?us-ascii?Q?PtB3NQ35+ohOKWqjgTYr8auKuRkvID6z53z5ME2UttLXanH6YnvDToiFCTVM?=
 =?us-ascii?Q?KoHKcs+grfIMLeHM3sSPNwTPVSocasAvE511T7MM06a1lmf7qnCPvcNgqjs0?=
 =?us-ascii?Q?91Ndo9qs5ybx2W+zBs5PTMm8qA7bcr5DR617bzSU4eTiFZLWFZUhD/1Qw2Nw?=
 =?us-ascii?Q?HcrrarK8+PgvO0k3BAFfp5hhr3/3cYp37mranIvTm66Fkr3hb8G5qdCrtd13?=
 =?us-ascii?Q?/Tcm+zKYfEycFgh93dLiowMvlr8Qbh4B+9De4OvXuCAaEo5LC8WFNkLGctmv?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 225b0dab-46a4-48a8-e4b4-08dc8643d6b8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 16:15:10.4792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMUyu6IMRBv2/crneN4sdY1/XCMiQgylFMLp+5Orwjv9JTZOKrZqZJPPIB2Gv2CUCrfFh+z+jfr6WHQ2YC9hRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7764
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

On Thu, Jun 06, 2024 at 03:06:39PM +0200, Michal Wajdeczko wrote:
> During early initialization, in the xe_guc_min_load_for_hwconfig()
> function, we are successfully enabling CTB communication, but it
> will only allow us to send non-blocking H2G messages, as due to
> not yet enabled IRQs, including G2H IRQs, we will not notice any
> new G2H message sent by the GuC, including replies to our blocking
> H2G request messages. And those successful replies are mandatory
> for the VF drivers to continue normal operations.
> 
> As attempt to workaround this driver initialization ordering issue,
> introduce special safe-mode CTB worker, that will periodically
> trigger G2H processing, like original IRQ handler, in case no
> MSI/MSIX IRQs were enabled on the driver yet. Once we detect that
> IRQ were enabled, we will stop this worker.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

This seems like a fairly reasonable workaround to carry until if / when
we can get the driver load ordering correct. Also it has potential use
on platform bringup if IRQs are broken.

With all of this:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: use code from g2h worker instead of g2h irq handler (Matt)
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c       | 43 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 ++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 08cf355e2e56..936b63483e96 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -126,7 +126,9 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
>  	xa_destroy(&ct->fence_lookup);
>  }
>  
> +static void receive_g2h(struct xe_guc_ct *ct);
>  static void g2h_worker_func(struct work_struct *w);
> +static void safe_mode_worker_func(struct work_struct *w);
>  
>  static void primelockdep(struct xe_guc_ct *ct)
>  {
> @@ -155,6 +157,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	spin_lock_init(&ct->fast_lock);
>  	xa_init(&ct->fence_lookup);
>  	INIT_WORK(&ct->g2h_worker, g2h_worker_func);
> +	INIT_DELAYED_WORK(&ct->safe_mode_worker,  safe_mode_worker_func);
>  	init_waitqueue_head(&ct->wq);
>  	init_waitqueue_head(&ct->g2h_fence_wq);
>  
> @@ -321,6 +324,42 @@ static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
>  	mutex_unlock(&ct->lock);
>  }
>  
> +static bool ct_needs_safe_mode(struct xe_guc_ct *ct)
> +{
> +	return !pci_dev_msi_enabled(to_pci_dev(ct_to_xe(ct)->drm.dev));
> +}
> +
> +static bool ct_restart_safe_mode_worker(struct xe_guc_ct *ct)
> +{
> +	if (!ct_needs_safe_mode(ct))
> +		return false;
> +
> +	queue_delayed_work(ct->g2h_wq, &ct->safe_mode_worker, HZ / 10);
> +	return true;
> +}
> +
> +static void safe_mode_worker_func(struct work_struct *w)
> +{
> +	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, safe_mode_worker.work);
> +
> +	receive_g2h(ct);
> +
> +	if (!ct_restart_safe_mode_worker(ct))
> +		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode canceled\n");
> +}
> +
> +static void ct_enter_safe_mode(struct xe_guc_ct *ct)
> +{
> +	if (ct_restart_safe_mode_worker(ct))
> +		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode enabled\n");
> +}
> +
> +static void ct_exit_safe_mode(struct xe_guc_ct *ct)
> +{
> +	if (cancel_delayed_work_sync(&ct->safe_mode_worker))
> +		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
> +}
> +
>  int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> @@ -350,6 +389,9 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	wake_up_all(&ct->wq);
>  	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
>  
> +	if (ct_needs_safe_mode(ct))
> +		ct_enter_safe_mode(ct);
> +
>  	return 0;
>  
>  err_out:
> @@ -373,6 +415,7 @@ static void stop_g2h_handler(struct xe_guc_ct *ct)
>  void xe_guc_ct_disable(struct xe_guc_ct *ct)
>  {
>  	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_DISABLED);
> +	ct_exit_safe_mode(ct);
>  	stop_g2h_handler(ct);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index fede4c6e93cb..761cb9031298 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -110,6 +110,8 @@ struct xe_guc_ct {
>  	u32 g2h_outstanding;
>  	/** @g2h_worker: worker to process G2H messages */
>  	struct work_struct g2h_worker;
> +	/** @safe_mode_worker: worker to check G2H messages with IRQ disabled */
> +	struct delayed_work safe_mode_worker;
>  	/** @state: CT state */
>  	enum xe_guc_ct_state state;
>  	/** @fence_seqno: G2H fence seqno - 16 bits used by CT */
> -- 
> 2.43.0
> 
