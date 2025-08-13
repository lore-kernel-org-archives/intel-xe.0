Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57C3C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 21:24:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994A910E02E;
	Wed, 13 Aug 2025 21:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMWLs9sq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C492910E02E
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 21:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755120290; x=1786656290;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mi2qZ2xh+gOdIK1qT2rSCVJPEo8gco9W+jwJoWoiEFk=;
 b=BMWLs9sqlcjKbTMnSOGpVqcvjrWcw0QWlrcP88lATFg3DW0a5fPVsUad
 myvx+5dcIjbi/ROR5sol2rvcdqKpdZoR/LrwRlXIWjf+3D2QcWgKlSr9i
 y+fJp4fxeM9Noyg+NqPYt0ir22O6oN6652QNAzYn8o+PpNqqr+x3yniBn
 7cSGfy2gHhqu88vBH4Fgjq971B1MVRaD4BM1nL/DsIrwjG+vLx4AvuJrw
 ggTICR95hM8FVl6ZSnSmxMtuvIchS9hUmwOYUNh0peXHa97ZNu5Ci6QMV
 py6nSYSaVM6tJ5n48EueFUgf1MlSzoXdfKeE76TcXp0PXLh4cqSgpsfqF g==;
X-CSE-ConnectionGUID: vWnAfveeSna17VaFzbA8cg==
X-CSE-MsgGUID: IyWarH3QQm2CK3gjaFewUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57298143"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="57298143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:24:38 -0700
X-CSE-ConnectionGUID: VkVeyaU8QJuIiYUCYdnd5A==
X-CSE-MsgGUID: wqBmhMbTTXSpRR2jxJAATw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166224806"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 14:24:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 14:24:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 14:24:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 14:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TAqWBbQqRuQu7+9WbbFFL7JIFUL7CRdgc0rW0hDc+a6rEaldgXFSemC6WmXkUM9z086rZFdYKYG79QQI3zhX84fipY9Pk4gf0qRGCBfasPMm9lShCdDB5itof+pfiizCQVqWhyO1yhXge5LVLW9cAorghMULVZRoaDreSo3eQeiqTMAil2rzBuHVocQoCh4BkW7ImeW74DvIjHNb1fk7GiOlZdfEpw5RKsseAtJtIvL7i2IIo+rqr48MAVMEMTh+SgQVEwUpkEHwLSDfegbz9WQo8PCRV4T5y2vNiZk8Fb3HenJsufkpw4rWXbBJvB4pxhmGScQPWQe1N/5b6vwyiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6wVDH0HRg4PPXlChRANuBQeJ/VRWmo3w3g2zbBCPRk=;
 b=I8EYwl8IhVwnuhhV1hnJVEy8RBQDiDiLJVLXdDtNYcQxKKZ2GlTDxW2flbMgCdmpD+luzixd8/rugGjNgGK1ICyRZMPkTn/LC+j8VdlXZiuupfeOSLfL1Pzu/kW97bKIztUb42obinqYFBREA5ggx5ba9ZOqhhzU4Q5AZZ4oduW75fjx3lckSlUgwdUA6/lUXOLKadJF/zcXGVWlWrF+PR+2UNgpom/QHH+4Bdo+o5PXa2z/yd013DaH4aSdDBNIgUBuVIQdTmJAcnO2KmYIdW9jZv/7dNoruLFKjFbQVpI27j8CB9w442L02bh3L3816nr6FRS1KvgcU3HKMviv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 21:24:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 21:24:24 +0000
Date: Wed, 13 Aug 2025 14:24:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: stuartsummers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <farah.kassabri@intel.com>
Subject: Re: [PATCH 2/9] drm/xe: Stop the TLB fence timer on driver teardown
Message-ID: <aJ0ChtKtA9O8vcVv@lstrano-desk.jf.intel.com>
References: <20250813194806.140500-1-stuart.summers@intel.com>
 <20250813194806.140500-3-stuart.summers@intel.com>
 <aJ0BWL5lxyIOjHvj@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aJ0BWL5lxyIOjHvj@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 64924a94-e047-4daa-84b6-08dddaafc6ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?q98DVw523Yj3gPZ+y9uYeHxDqJE1PS/kE9UrI6VTCaJjSQSINTAExe6LcaVU?=
 =?us-ascii?Q?JcHjSUiQxqQxL9JO1WxvFS1XyyFss+RbKS51DlMM5h6ZKuU6mFAzk88MmPOZ?=
 =?us-ascii?Q?/u6LliDd20y+jTvkPmKfH+I5HhvUGNpZVGvdjnaD55BA0yGfPkq8pwYzL72b?=
 =?us-ascii?Q?RFRTF4GHbKT2bC+hfc9dAddh5dMl1Ds4/oppxeA8hPlkfYoC2a6o8lINTBiW?=
 =?us-ascii?Q?PDCx0DHykyTTuS3JKlryVXVIxv2Wpar0HCCOVxwi/yCxTGmz685+hTyRd7R2?=
 =?us-ascii?Q?GzXT2VoOj7UbxvhLmLK8P3vuAXC/rGcQtnbDSNyzjKkEphNQ7lRDHEXcRlTk?=
 =?us-ascii?Q?bG1i3Crwoe9ijJ7epf5Kc4BVGe94iP1BsRbg8v/iybIc937l1F9UfWRvMVA3?=
 =?us-ascii?Q?VZWc4AdiHxYlcC4pXZP48efd6rCZjejucqqzzMdWMfhVuT9ypFnt6Ao4HliL?=
 =?us-ascii?Q?00ydfcawqgMaFk+CItONT4gRio1jhwm+IeqDCCq2NIOScRE6jSOGBoJz8Fb7?=
 =?us-ascii?Q?BH8eM0ABuAOi1VCHTM6bXqrzWXNBTrGoL53iVIFXduGxck339Z5h+5xdmvar?=
 =?us-ascii?Q?3ZQ8QqtWQaEJfypCXDHvpJYY3EDUjBZwk3MBYAUZw2XIEExLLr/qUXX59IoQ?=
 =?us-ascii?Q?6q3TXRrzanfZCifyJL2yNHyh2lYc57z2mV6y0JzEfSX/CcPEcFBC/1deYWxS?=
 =?us-ascii?Q?xzGHUkzN4Hx6zChBw/ZTxxaYrG1bj3/5D2YXRGHChla6OMO6T80kploBAtSx?=
 =?us-ascii?Q?gJfcaD7T4jb+SlfZOUgIbUK5FpmZ0c91h/HnhqTybr19AWlogMN0BJd5qQoH?=
 =?us-ascii?Q?8czatFxJcn782hmgsBQbbMmHidvCNEnA0mBQZJPiVt3lxrZqmvAGf2XGZiHN?=
 =?us-ascii?Q?G45s7RFS/HDQ8uCv32+GaH2Iix6ZFN7bCB5YeW5KNGehYjA/kQSEAERUF2Pq?=
 =?us-ascii?Q?1D8cvAhVPRLSYbPO4x6UYkEBQfGQKSTptU/vbsxGxREAgJTuymrHMtfaGpnb?=
 =?us-ascii?Q?VJFTSjwnaSGVI5Fzj35pkU9Ul+7SVq039e2fAmhpC0U3QcyUiWxXVdLeqb3T?=
 =?us-ascii?Q?HYip8Fa0k425a6+FfUM0PsQoBLGSaJnUjQSch/mpSbYuY4XxzLnahDRodaeu?=
 =?us-ascii?Q?EE7kd3pTXDxFnN+l65SQerK9Dn+vB8kvZtalxzHJ0fUA+33yaxBJ/lrmy5bb?=
 =?us-ascii?Q?ePAJIuF/uVF9e7MMEL72QTE/BmxSC2GpxpstEjf/+6lVrHneBBlPxjqoqnzW?=
 =?us-ascii?Q?AN/caZDuCq0FRRJCny73fH9UBmO6Yb820dERLcVei4RRZ/e3ZaTQHc8/mjGe?=
 =?us-ascii?Q?dBvO4hek3P86k0nw80k/J7tcV0QEwdWo0zsnQWRdJ5nPsZrvgC8z+xblsOCy?=
 =?us-ascii?Q?gUqQLTAo59fs5VjTfUUUi1xjwo76S4+JyQVygJNFpBxcSEBBSFBApnLJO/5G?=
 =?us-ascii?Q?TWfQ+hv/kGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mFjIQrGRTCKWK4ZVTCk3huJJuCnELwTkYQfI7PhbUCLn1RHKuoiowYArYYqd?=
 =?us-ascii?Q?rAMb7Y4QcFKD8kIwab6rgWFVV6dlSzG5BXiuLeP1Xi+LgGPFz7vP9MskvzjI?=
 =?us-ascii?Q?hIVSOjFq9QzBw3LZ5B+L9a82IQ0sfC+gVAVY6vVj5l+tRYztyA7tP3tD5E5f?=
 =?us-ascii?Q?ZtPwPdsPewMx5AKYB6h8YODHKwTDiBQGuSXvh0rDTEM++zGvflHuUk4LflMF?=
 =?us-ascii?Q?3JlG3Z9sJ627uzY7u96BPylE34B/l9HbGoELcPmlNXI/o202D7kmSaKETudi?=
 =?us-ascii?Q?hRbnvL+VATazEtIVmSSg3nNndzEtjsfj6j/E4nAYL0JGH2nXcZYTWC+uXcxg?=
 =?us-ascii?Q?E+wxQf540VNGENLAg1YzPaJKxUnCk7e8vDFMYobHlKJtCZxmiqapeAVPp+fr?=
 =?us-ascii?Q?yblyVci777aVjGYHM43A2lo52gta4uDvRW6b2zDo2TlSf4X28wF33GwDa4e1?=
 =?us-ascii?Q?KQ4eE+jnw+UO8cqqLzjGA9o7LSFIWY8ByNJYS++FuOZZHBZUpnABUR/dC57J?=
 =?us-ascii?Q?nDoSYeKgp6+ZbzdYaeU4D9Py5DtDaMhHctYNL0xTf2+CJhbfPv9z6S8INGXh?=
 =?us-ascii?Q?mrS2p88d3lcJk6JuNQSm6PM7aqwyw0IowaeBvzOqbd++Wsn0/V8nsgCjfRHe?=
 =?us-ascii?Q?uH8YHQ8BZBFTxnQVswNXca9lPClXmytEhiuBKz4vN072wGpDfxiMg8gAYUkY?=
 =?us-ascii?Q?YJG2jJWPHQR5H3dBP+7N28t/hHVsBSA2Npujjn/gzViOL7EhZ75oOayFlGqz?=
 =?us-ascii?Q?5m42VR+CRqt6XwVo8Ffbq09c9IErLpqIEPoiTewOPNa7OjgWTmqWllc8BDo3?=
 =?us-ascii?Q?rMK++BhBpl/yuRbTQvqselM9mRGqysjjUoKop7Lnpa+s/SZ3GJuCe+z//Tnf?=
 =?us-ascii?Q?NEsFylnmVLxmUFU18NRN2e2k/AfUvRzhwrAzEVQ7Zv2Hem5IgjCMgLQztmhj?=
 =?us-ascii?Q?0rbvgY0SJ1Sl8U5ejdPI50TJ04wWsBQuB+HltYUphBzaHk1HkcdpZpArI1FC?=
 =?us-ascii?Q?TyH1jFOyxi4yodFODMkzMw93hMp4zIsQuXxvJdPXp0LE+ZE6gTne655O1dfg?=
 =?us-ascii?Q?Hev7/F+P4brTlZrStD3HWct0gS6WLP1nkC+/o2++B6uXyuUN31oBHbQaw4pP?=
 =?us-ascii?Q?BpMs0R2+A0LpqF8skiAQishStbvLx51NAjYnZ3ll2M1yapOi6OsrnAmTwtot?=
 =?us-ascii?Q?F2Et89EdVlvn0h1iJeWyVLd0DJBMYtPFP1qAgYQGRFJk2jLtlpZgOIWO1CEV?=
 =?us-ascii?Q?PnTwtIYybxtHrZhiJXJQ2nd68SKuF4zGFsx6sSKAmlFDYeJGPR/5llUbyfEi?=
 =?us-ascii?Q?SGQ9I3WjPnMwsOeWjXBMyBphEhXCNX+Kw54Awz9mEseC+g9d1kbvzXY2uvJ2?=
 =?us-ascii?Q?iW/+Hi/M4PpxyubMMrAtpbvkRiTLgtQGPdBbs7E5y7WoZrb7gyM/VSXPak1Q?=
 =?us-ascii?Q?8wj4bESQVlFxmby33bDpTDM5cuC7XFAk/W75+EU+WTHvHBPBY2BfgELkMhyQ?=
 =?us-ascii?Q?DX7pg+X0r8DUbKp+zkkr9LZ6/wuzlbOOLpBm+fPZb84mHbXdayTh4jNwcU9C?=
 =?us-ascii?Q?08Bhfi0aAxgVZVYFp/sA6XhYcLQxzIFbsyTV2BpPZnsuMQ3ZQLb7Fo2Iebhg?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64924a94-e047-4daa-84b6-08dddaafc6ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 21:24:24.4976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhXHtZ4V9jHWupAI5TXFdkc9xUT8JubWJE1/xSiy6FujQFGeMhkc3z45dEX+ldOZ5VGq1Olfu8h9itQDFaEv8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
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

On Wed, Aug 13, 2025 at 02:19:20PM -0700, Matthew Brost wrote:
> On Wed, Aug 13, 2025 at 07:47:59PM +0000, stuartsummers wrote:
> > There is a small window of time during the driver teardown where
> > the TLB invalidation fence->gt is set to NULL but an invalidation
> > worker is still alive. This won't cause an issue currently because
> > the tlb_invalidation structure itself is still present. However as
> > part of a future refactor, we are looking to split that structure
> > out. To be safe, go ahead and cancel any outstanding TLB invalidation
> > fence worker thread on _fini() since at that time we are already
> > tearing down the driverworker thread on _fini() since at that time we
> > are already tearing down the driver and don't need to continue
> > monitoring this.
> > 
> > Signed-off-by: stuartsummers <stuart.summers@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > index 75854b963d66..08e882433b13 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -44,6 +44,8 @@ static void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fenc
> >  	if (WARN_ON_ONCE(!fence->gt))
> >  		return;
> >  
> > +	cancel_delayed_work(&fence->gt->tlb_invalidation.fence_tdr);
> 
> I think cancel_delayed_work_sync is what we want here.
> 
> Matt

Wait, I was thinking this was the fini handler called from drmm.

Would it work add drmm handler for driver teardown that
calls cancel_delayed_work_sync and signals any pending TLB invalidation
fences?

Matt

> 
> > +
> >  	xe_pm_runtime_put(gt_to_xe(fence->gt));
> >  	fence->gt = NULL; /* fini() should be called once */
> >  }
> > -- 
> > 2.34.1
> > 
