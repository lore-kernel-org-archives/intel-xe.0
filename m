Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6000DC56205
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 19:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E4010F28A;
	Thu,  6 Aug 2026 19:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GKdNg4GT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EFD10E35A
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 19:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786043741; x=1817579741;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ur2SVbHb4DzHTwzCd2GSpI5eJNT/KzlqlsBdRZEenhU=;
 b=GKdNg4GTue36aRkD652lY6NpPtWRjjFvs0kKLCi+VMehlTqYA3s64iq8
 aaw6duzWtin8uPSFXNe7rX54auGd0/uzAPUlJ+kKzyOnit7Kx1zVvTWFQ
 PjxM6unOm/grSFnGvrba5L2XrBgp83oxWpOXu+UwgeK66mzsp3Md1XWv6
 YePTEjKky0dDopP/E4WXls3pqnsB9ni24vIBa+CzVAVyy4AHFzwPkx10m
 taTE0NxXr+S9YPtHIpTYOtWWmJPALJQj6J45iD3Tbk3sFQby1e6C4tlFv
 EQiWYgyYII0nD1Ntxx/ra1sd5MvUi3++QG9/7pJ6p7SISThlt4YzLk9BO g==;
X-CSE-ConnectionGUID: EXfOyTADTHuXBehkZ0WoMA==
X-CSE-MsgGUID: KufRlFYCQZi2XFVZyb9mDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104053442"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="104053442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:15:39 -0700
X-CSE-ConnectionGUID: YDjY0H1QTlGIwzyJfoocSA==
X-CSE-MsgGUID: v/vGQaZ5SN+31vSf0nk7rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="255942806"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:14:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:14:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 12:14:47 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:14:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csbmYShKanKIqW7hJJnjJp/um9LtjdJc9hx8L9JBwrPZYVQmFNPgFy8EM/jZ+lN2vTV/v8/+FqC8GNuTCSEwzW14YT+0VJZ+YY6/qM0gyR1VsSuh9PoHRaIZwAQFc0+bip8+lnpAwoL01ET8QZ34B7j/rHyYm78J7N8pc7wllXr4SCz8al3kxEE8a/TIKUgGjjzihUUb47pFRCFCDV6ILYGnWgeIRgYFYutPpqcQWxSd1hkuMcvG0ZXYfhttyXNVYf6BllwvcuQafiiR0uREBn95VdGyhIeMd/Mb7v2qYr+4ESsuxD/nN41T0tpVaT6BiakYeVbwCANdNLC9m1LEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LReS8Gm/U4aZmDLOiZebdeQHpqj91yPX+6tUy86klSY=;
 b=yNCQiHnJrPjeTi7oUrJI2BCurRwvqh4YqL2tandLKFHsGnZ5MaNiHM3PiLk4xUlWLcx/juO52bYXcqhKKIAZp4kpYxJNrp5nLusU6QVhrv3hjAIoqZ2aMTMiNrM8g7RL6OrpB0SkfmY76kV9ECkQg9BBAmlFHVcONXdZU9FDsHxbX0rDL+f64VaROVB0q36dLpQMFkF2GnCmiJmDxFmzKrf904yvAn08FNq8JfW4OU1VlVHm9WZfxMrsCObCol37pUGOcfryM39gcV+Zpl55xPoeSzeqb3F8wqG5vl/JfgpaQLNgNl+h2cj11S+GpiTkFh9FAEeWqIiMT4OmG3sDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6061.namprd11.prod.outlook.com (2603:10b6:8:74::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.16; Thu, 6 Aug 2026 19:14:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 19:14:39 +0000
Date: Thu, 6 Aug 2026 12:14:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Skip GT TLB invalidation when VM has no queues
 mapped
Message-ID: <anTdHVUUQ+P86IrR@gsse-cloud1.jf.intel.com>
References: <20260806033205.3858054-1-matthew.brost@intel.com>
 <68a4c12e90c7f3fc08a62a6de41c9bb26b38fc23.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68a4c12e90c7f3fc08a62a6de41c9bb26b38fc23.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:303:83::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: ed034c44-ee8a-4f0d-8902-08def3eef645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HxpiAsdpXFxBJA2Zxe6D0fr8Xcaiwi/jjaEnNimhTs7jlRIhxNr0E6ihe1Dzb5rIlGws9xhIorNpN5Md/40MOFnMMYfON6AGI/KTxBnCTMAe5TKiOAZ9U/hqp7h9rCe1bcO1T5XKp8riWMwwCOerKXaDVas7X6gA5DfRngfiY6xK29ECqfVSQBWXwZRQu+nOG58+sPUhEVmbyW4wPR1YAs5uwAORGu30iGCn7Ul12ndv8HfKQXhW5wFIQd6b+SOlph/OMeC60s9ROYd7N3d+FwI/2NTGR+v1eeX8EkKqWOoZOtNthLQvuRAuCs8gjUhoUIlvVBDY2z0InSQsE1vWARzzGP/LMb9hPBd4xS8n2YqZiS7jlqgNqLXDy6ijjp68tNkt+t7Uz5ZLBwLd0JfyN38q35mDDjxRqeo5ns8YkANF0wx/3060trPbqKQanKD3iH7r6pTUe1eq25eEPd/oPKsZmai4gpitP/edb9bM1Ay4lVivSppkL96kK0Lhq8xIPU4lkVOrx7jr9l1uHdxRM3hyS5oCLr4/gq88fmN1Mlx4+D34qkQoRqn/XkUtYJOX7V5CVvsQyTycFS3latv5orrgXIlAp5GWLnQKrGiScmkSJeyyEFXyqKrg77qPdtdHDTarOMlZMKtuCV/aJbR4spZ2k/WKe3Aya3GLAbYYSIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D0JFYybK4SKYZstEih6cWS0N/GNyny8oXvTLXjmkNw2Ph/DJyL6G64moDU?=
 =?iso-8859-1?Q?1d/R9MQJXBYHXu3HPhqeP+Rky4y2EgGkHOMEhg997X/hjXJ6rhCW5GstX4?=
 =?iso-8859-1?Q?07r2umf82YWY0YpsS7GJU+3zlYJeERLMlp9Z35+IlJk/GAOfFA2K+LyGwZ?=
 =?iso-8859-1?Q?9b3Ohov+YmD2hWRIc6VjmQi8G5UUJVx8+G4O4cSY23v6EVkXmjptNuw3P9?=
 =?iso-8859-1?Q?CAXbT4MBmVHkSu2qO1XlnZwD/sB+X1aI5CkGvnTIqbgSeuSpop5GErzHIB?=
 =?iso-8859-1?Q?9hNmDo2WiJJ83O/3zJ9nLy4ojazyrzMHMz1kF8gOz237ptAm56RFiJfg6j?=
 =?iso-8859-1?Q?iTBkCqrBD7ggAs8hjx+VgVA8bUkQM1eTdMWcKM2vdeo9DT62u8umNFK3sf?=
 =?iso-8859-1?Q?o5dfa1ZG4YeGxqgRfWvGESEV02VESg5eVNMmNlYk3VJEaokb5YhPDbrdyi?=
 =?iso-8859-1?Q?Pv/TzmQmGyqmBeeBSjaKTLpseCgaMGRPf/Nau6+52T5AoqZLASZYDnIBBL?=
 =?iso-8859-1?Q?gQ0UFgBr/qfUpRs1alim0UrhNHL23U3jWSYZeNN7qIG2MjfLbxoyJxst9t?=
 =?iso-8859-1?Q?RQj7UAfO/0lERc/E5M/4W5nroF+b7JOovXC59ohOWtk3khWq6D7K2LTqU4?=
 =?iso-8859-1?Q?aRq75JsG9ycMwrXh5KaFYdCUXcGJx8C/Yqr4y7OViKLShR3pyEuxti2j+c?=
 =?iso-8859-1?Q?8nj28zRhocQ4ojN7nAUlZB9dkBTsNaVqRu7l5gbhkzMbK4M0LD6L0YL0WL?=
 =?iso-8859-1?Q?/GVTXjQCDxYH5Mox3ZC0u+e+8ZdULtUiPh5r3pR+8N1bj1F4YJbYfGT+WB?=
 =?iso-8859-1?Q?hnan2IPV/4a5dRXIyDJSjW6MG/MHDVs/O7ZDrpLWKnkvaDMc/PYqKaf1ot?=
 =?iso-8859-1?Q?z6zQMl1x/hiV1l1Q1HRuCmzJyX66RrL47CDrLHKrmrX423dagxMiuxOkl9?=
 =?iso-8859-1?Q?CyHzUHhHd5wQgXxeFzFP5m7WnW3dJO7b30VF5JN4abg31q0jsjN3iUnaV5?=
 =?iso-8859-1?Q?YdjERASpurPSso1zmuA6y8acbFYfk4Z2yplPDh7FivpfljWYI5tuQtnkuj?=
 =?iso-8859-1?Q?vasyakpCceZHmdgmU3Hav9tPxyUdiKd1vAOxEsGyWkHAhhPfyiRdrmghmq?=
 =?iso-8859-1?Q?6IFdXG+ytxOcpquuD+Ou6JowIKarBWwadRoijrsSD1alkUuegfPMtlLbx3?=
 =?iso-8859-1?Q?W5jUbuaQnknG30C5DVMvQLm79wADkGELvEShUkwM73R5FnT77A7jeAbfb6?=
 =?iso-8859-1?Q?7F4S3H0MacXvY3xSHh0s2ZMGXVPD8Tck8dWMVMaaSpG/Z5IUzGiiszXcvE?=
 =?iso-8859-1?Q?vLlL5l1jx+lMsBULy+jP8Wafk5wsyO3sNMWppz8TPhTQavDaZucSgpFoVj?=
 =?iso-8859-1?Q?/CS6q0L5XXupot8vLEBTYGkF9p8aQRF0o4zPtk9wOLRabRtsx0/14NnSNi?=
 =?iso-8859-1?Q?8ieoBftYzLf8S+/JFCY69REstS+0lmaYbfcICNlXKq4ioCTiZpHX2Nz8QL?=
 =?iso-8859-1?Q?kBWogs/89bzMdJVlE2geD4pssUpNah5bACXry2nFZfeMFJaa+CEYdXKg1/?=
 =?iso-8859-1?Q?kz1NdeWpaVpah+JLDMadRsAiZq8IUuv+k0goj/3AjgOxun+O1Gso/u+4uL?=
 =?iso-8859-1?Q?ICT7aY3W9k9MCZ0AJHGAL0YAx1tSKyj/i0eOzCQZdbfl9FqBztU2Wx65aL?=
 =?iso-8859-1?Q?ZJHS/g9ixFsmk2QGa0/AkcFQq7xtAUUUwyK2vCA+gNPRNXFQKDl94kcrs9?=
 =?iso-8859-1?Q?sdXdgSDUze/ebxKUhCwJ2f6mSb5JkXfuAdO0MHZIss2n45eHP0TKPZjmVD?=
 =?iso-8859-1?Q?6e/OC7G/rHgl+kXQxjaW7QCj21aNZ2s=3D?=
X-Exchange-RoutingPolicyChecked: mOM5HZiPTtn3tCJF2jwPFYLrp40dkX08NYurhfEDCKedNa0sfxFdlJpJRj4Zdqi6muBIk3MuzJKrW2QXTQF9f/+boN7TyCp7x5MF20daG4BTyq2PXXxv43u0sjhSx7vPFSAeqKa/9vw/Z/pw6LWv/0ee/Hw59EPAxM1++0QkAAzDwjuelhcHPuxNJvt7X/Y5zcF0kcz0j17kUroS7uaAdSAil0a/l5n67vPJtl7u3CGwdO1KBd+kzA+feV7Km5CMZWN1WFYuuPHsUZvOMz69zi5Rw1R/fi57LPLEqMoNVj4Ybxdp2LJf+QRQ3PE2Fy/IYKRTHmW2m+Wb5apemHDWJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed034c44-ee8a-4f0d-8902-08def3eef645
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:14:39.4347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ya5o3FDQtOzr2gApLZdu2VumtS8GGmW/eRAATs14e/Ezds5XCAoIK1bR26GuuxWIvhJJGwdRD/QLzSYuLjFcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6061
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

On Thu, Aug 06, 2026 at 01:04:28PM -0600, Summers, Stuart wrote:
> On Wed, 2026-08-05 at 20:32 -0700, Matthew Brost wrote:
> > If no exec queues from a VM are mapped on a GT, issuing a PPGTT TLB
> > invalidation for that GT can require an rc6 wake which is expensive.
> > 
> > Skip the media TLB invalidation when the VM has no exec queues
> > mapped on it. If TLB invalidations are already in-flight on that GT
> > we can't break fence ordering, so issue a dummy GGTT invalidation
> > instead to maintain seqno ordering.
> > 
> > This optimization is particularly impactful for SVM workloads which
> > may or may not use the media GT. Average TLB invalidation time drops
> > from ~75us to ~18us in such benchmarks on certain BMG parts - the
> > improvement varies based on platform.
> 
> Still going through the code changes, but is there a chance we could
> deregister a context (so no queues exist), then mmap to invalidate,
> then register a new context and read stale data here? I think in the
> context invalidation case where we don't have queues we would normally
> send a full invalidation instead rather than just skipping it. That
> seems risky...

We don't call `xe_vm_remove_exec_queue()` until
`__xe_exec_queue_free()`. The latter is only called after all GuC
references are gone (i.e., deregistration has completed, or GuC state
has otherwise been torn down due to PM events or a GT reset). Therefore,
there is no race where we accidentally fail to send a required TLB
invalidation. If anything, the opposite can happen: we may send an
unnecessary TLB invalidation.

We don't need to use the queue reference-counting trick here to prevent
deregistration, because whether a queue is registered is immaterial to
successful TLB invalidation. The interface invalidates an ASID rather
than the CTXID that the GuC tracks and requires a valid queue.

So all of this is safe.

Matt 

> 
> Thanks,
> Stuart
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > ---
> > v2:
> >  - Make GT generic rather than just media GT (Thomas)
> >  - Fix accounting bug in empty vs non-empty (CI)
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 20 ++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_vm.c            | 12 ++----------
> >  2 files changed, 20 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index 046d0655122f..ab04b87cf1c3 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -205,11 +205,27 @@ static int send_tlb_inval_asid_ppgtt(struct
> > xe_tlb_inval *tlb_inval, u32 seqno,
> >                                      struct drm_suballoc *prl_sa)
> >  {
> >         struct xe_guc *guc = tlb_inval->private;
> > +       struct xe_device *xe = guc_to_xe(guc);
> > +       struct xe_vm *vm;
> > +       int err, id = guc_to_gt(guc)->info.id;
> >  
> >         lockdep_assert_held(&tlb_inval->seqno_lock);
> >  
> > -       return send_tlb_inval_ppgtt(guc, seqno, start, end, asid,
> > -                                   XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > prl_sa);
> > +       vm = xe_device_asid_to_vm(xe, asid);
> > +       if (IS_ERR(vm))
> > +               return PTR_ERR(vm);
> > +
> > +       down_read(&vm->exec_queues.lock);
> > +       if (!vm->exec_queues.count[id] &&
> > xe_tlb_inval_idle(tlb_inval))
> > +               err = -ECANCELED;
> > +       else
> > +               err = send_tlb_inval_ppgtt(guc, seqno, start, end,
> > asid,
> > +                                         
> > XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > +                                          prl_sa);
> > +       up_read(&vm->exec_queues.lock);
> > +       xe_vm_put(vm);
> > +
> > +       return err;
> >  }
> >  
> >  static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval *tlb_inval,
> > u32 seqno,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 9e0176861cb6..e2667200462c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -4946,8 +4946,7 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct
> > xe_vm *vm, uint64_t start, uint64_t r
> >   * @vm: The VM.
> >   * @q: The exec_queue
> >   *
> > - * Add exec queue to VM, skipped if the device does not have context
> > based TLB
> > - * invalidations.
> > + * Add exec queue to VM.
> >   */
> >  void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
> >  {
> > @@ -4961,9 +4960,6 @@ void xe_vm_add_exec_queue(struct xe_vm *vm,
> > struct xe_exec_queue *q)
> >         xe_assert(xe, vm->xef);
> >         xe_assert(xe, vm == q->vm);
> >  
> > -       if (!xe->info.has_ctx_tlb_inval)
> > -               return;
> > -
> >         down_write(&vm->exec_queues.lock);
> >         list_add(&q->vm_exec_queue_link, &vm->exec_queues.list[q->gt-
> > >info.id]);
> >         ++vm->exec_queues.count[q->gt->info.id];
> > @@ -4975,14 +4971,10 @@ void xe_vm_add_exec_queue(struct xe_vm *vm,
> > struct xe_exec_queue *q)
> >   * @vm: The VM.
> >   * @q: The exec_queue
> >   *
> > - * Remove exec queue from VM, skipped if the device does not have
> > context based
> > - * TLB invalidations.
> > + * Remove exec queue from VM.
> >   */
> >  void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue
> > *q)
> >  {
> > -       if (!vm->xe->info.has_ctx_tlb_inval)
> > -               return;
> > -
> >         down_write(&vm->exec_queues.lock);
> >         if (!list_empty(&q->vm_exec_queue_link)) {
> >                 list_del(&q->vm_exec_queue_link);
> 
