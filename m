Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFEDEDEBF7
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 23:28:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5E10E094;
	Tue,  3 Mar 2026 23:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ol5BnelC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A3F10E094
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 23:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772580501; x=1804116501;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gVTlcmDBxoC32XxJBsdUeSDGbGJukS9wQwVTy8P9vb8=;
 b=Ol5BnelC8QCCJbOlgfSQsa3gioLb4/YtA16LAYrWgRhSuWlR5x84+9cK
 FT0fiCXJa9ItV0MnBTQn5OVzkC1QUrJUJIe14yCfidz7zwcQtXtYVN9ZD
 nUaXd+qBjwZ+2BVuI8X8XojwY12eXUqZItYhu1uSqZfxE5iymPASDGNlS
 F2JTh2V/1zHhJh4ydXucdb7/sVx5/wbSbS22SsOOp6bPScv+hV5sS+DT8
 FDZrpA5Grf6GNH93rtUt+gnlxEJ8KHS21G8QOZgdI/+dETGl6d84FaVqi
 bD0I9fEJvOp596EOKa8LfREYgq+LWYxYZoLRrIMfoWNd7MT0ViF9C5Del w==;
X-CSE-ConnectionGUID: rzLUM8d6Q4qQGrlRtrepFw==
X-CSE-MsgGUID: D55ehyxeReeDMw94MP1xTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="83971831"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="83971831"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:28:21 -0800
X-CSE-ConnectionGUID: hXIQeVgoQpKjLoYMmuhQmQ==
X-CSE-MsgGUID: HyGshKHlTee4ztbWgE54XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218125551"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 15:28:21 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:28:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 15:28:20 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 15:28:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2ZFpzfF2FSdS5ZGkv+pGSm1huLzATHIeXJ0+WsDrH3Vp5pN2tAcjge10R5r3P07oToDI8ZHBGt6HHrCTw4PlmVKmTFmXn7bXobK5wOYbl3lazptGyCthvAMv1hHRxltqDZbYGv23YdhftBFwppP5FU/yWE+rTnJ2PgQvISdcdQfeLdQOlaUkVzUsf4o1JLg6x8OEvxjcxYFTu2N3lgxqvMMkYDc6qSPCPqE6LYTPJOmfIcSQCfsslMKsMImDwEQjoyb9XztZKUFKRehzgd+L0IChZLkmM0qFhLLLKy+vhFD3Jan4/fPLRLaRN/YgzauHWvtz4EaUwwEd8o9bZcdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keqDwoAqrxWUfZP6+/heWDiL+9LZIsXtQf6pks/IKNU=;
 b=qgejqEXBE3s486sOHBFjmmGROlGFCcIQOxPoC7f1MUJHRUI5kd4phPRXTcWf5zpPh5szN8tjyHpz6fBswghFdHnxJNEoe5ny1LIiAS8ZzQRUDeT0kSatctZtpQNcrijPSt+FYIgERJbXw1l09wEmhNlIIa27wt995+1cKam1TZKvyADKcCBTiB6yOujnALbFiYP8WPfyiXU5PCIrpKWCNOCKWvSCXo/qlxDiuDavSJnbCag11jSojSGHTbO71qIuxY3nYuNjqYAZqpIY6YPtYJS2OlWJd4V4AbRst4X7Y8n2hfRQRmB3ioMewxy+jIismmLfgfM3i+5p1RHghtKOJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB9599.namprd11.prod.outlook.com (2603:10b6:408:379::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Tue, 3 Mar
 2026 23:28:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:28:18 +0000
Date: Tue, 3 Mar 2026 15:28:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH v3 09/25] drm/xe: Add struct xe_pt_job_ops
Message-ID: <aadukHCYIPthpwrg@lstrano-desk.jf.intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
 <20260228013501.106680-10-matthew.brost@intel.com>
 <15113d16313e71e158e39c8db7dbc83ae8bcc76c.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15113d16313e71e158e39c8db7dbc83ae8bcc76c.camel@intel.com>
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: 448825a2-910a-4213-7114-08de797c8d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: cI/HZ406cQj6t7hjAyn3HfzntBwt5U/ShWek1jM+UKi1+1SiZn407saU0QOSU3unB1oFXtYcmevMBfugq3tD6CJzIOTKOJgBoBr39mFF6NJ1vI6N6AMaAmTetE2AUM9Cwfx6/a7hC/6P08o5mnWKqkdAx5LbrvuhVghkMEflUIvPSvasQ/jEUJbDYyrxiRmVx4sGGNy6aL5ktKe9Q3JDt/p2D7YjpGuu+y/pFRHiLJIbZMKfjgM6614fCrPZfP6kIbrTwAXuSuMxPrDWApqk3+dSTx9ywoeQcBEh0qHxLFtiHaqZYUMGydO5bK3L0lGsIdo3LtQfZ7d/LuedsXsX5v9aW6393Zm500uzmGB3Tf8DKf99A9UiNFWMTHksq6hk4zB3OFXw0VArsoKb+qjFXtKhUX6P8OI52v1lNHvr4syGGMPcC9KZ1kV+DY7oCxNg5edS9iBwedP6BavZ9ICVAuvCAeZyPGNRTGr93Z3/yx/45gXFn5p0Me9p9LxewIvJF1m2M4ugTXdJyCCKtGbGetOLTxzD1T43EfJCrCemkNxkfKUspz43pwdE60bXzpbOmxwZdmJKvEj0cJ9OSygw4UvTEL5b62rAwHWx+dbjKprdJiYtNu36BoaCRjwva/n9B6hAL81n54gUTAxiHLUb+AasYtijvCMRbgTRQ58izJdgBW9sKKmk6Cc5MfsDls2zbKoocCMmN36ZNEuDDgJAR0BhagEt2FlcjlHZubpv7YY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9LJCn73YMJfSXAwyr4GvKfUQ50I7YTk3r/UN7EUaiWWMHUZE2HNBde8mDD?=
 =?iso-8859-1?Q?j3SBNIvNELAX9dyPWUEDMP0Z2JJ4ZTRyApMo6nIc2JNPkl9ZqKv+B7/WtO?=
 =?iso-8859-1?Q?OOpA5ILlE9GKyrXv3IMwOTpYAKbQJ3PwnBNhSuAIim4QsOeFT+NPHwQodl?=
 =?iso-8859-1?Q?XX7VZ0qW2pmtdg+1ZrUg3d1aiD11k1HUU0xH0FDSaiSIFbMQs7GviXPiMj?=
 =?iso-8859-1?Q?WrADPewllaT9bDmrOd9J6oCp/Qh1DydueoNpiEImp8jeiTodcJW4akPYy5?=
 =?iso-8859-1?Q?6S1ZPlJ8OXFCgW5YMywJjdTEr0u/ff8Nv/1uXd45SdtqpnbWugrziryCkB?=
 =?iso-8859-1?Q?XFoUpCYxCd+A+7E5Jj901AsQ3/NGhqTAXykd+0nVBjPOPmXxt3JnJ63RR6?=
 =?iso-8859-1?Q?MiPwIXTxytrbnPl4ZEEv41jodZGlQm7fExkkvxTnoPQYcb5Z1baeYhCIKV?=
 =?iso-8859-1?Q?2AKku2GQZx2EgPgn9KcCR8ffeFK2kCcX9Lhom3sHX97N8pKdXjYWF01g09?=
 =?iso-8859-1?Q?5bEOrrN9Az8Ii4vhjWIJxwEEoef9ofyBr+ia/1sJd7BopC5JeioUf+nSmu?=
 =?iso-8859-1?Q?/7mzJUCcuRUY/j18dQ1IWOe2LPYT5q1pNHqoMQqnD8PAxDLu45AGyAcCaH?=
 =?iso-8859-1?Q?ZbysZLa9UYGgkQs5BuGjbZrAEYg28fyDC+i7/z3s3H92gKCRT5GhGPz+E3?=
 =?iso-8859-1?Q?mYm5TovG1G4PSqpBBzIxpSho1lQSyUkH4kLtjRs6FwfCZJAua8K4gjVPR7?=
 =?iso-8859-1?Q?oIzV32C4YGFMJ0Rc8Nn85LHhVn8wNQHiSkC6oamVFj9smpeiFbain3y8ZM?=
 =?iso-8859-1?Q?0YIF9sxjoJyPIDycUZSph18o2C7wtbL6z3C71cEFdzBajtt3oqa+sp0BSw?=
 =?iso-8859-1?Q?sMW2k1Jtmv1UcBOyPejdjn5mBpNIOOUoeGJt8jPD8xjIFoNTg5JuMaKcTs?=
 =?iso-8859-1?Q?DuChcdQAzRxs06J9Yk6t5eUxTd+NPTT7ObLl5nduSScpwZdQVj/mzNE8Zd?=
 =?iso-8859-1?Q?3okJLCucJV7O2r3fFLbzyTHs1joz9zzsNVexTKs5YPSmYVkumnuk41G9tl?=
 =?iso-8859-1?Q?NsHQl7Uc54VyifNNZELVnOV0TAfxgPHcfLRXZUXhlEzQ6+1f4uxGojbnGA?=
 =?iso-8859-1?Q?wjZK1bLaxgIPMmmPFCJkoJGKMtLZM1rRa76zWyG0M8dBVhCD6r5ynzTyNi?=
 =?iso-8859-1?Q?XzbsPM8d8xDpJY+CmLKSHipXVv0fOA7hSvpK5aV98536MqVexOcOlJ1ynt?=
 =?iso-8859-1?Q?v0SA19ZO7hcuSUbcTJb0Qas9F5yEk0UNGD9F67z0eSfntedPDu4Xq47hsO?=
 =?iso-8859-1?Q?ItRrX9tw0+Rg5EWlUkJNihWW0CYRpAFxeDcEs6C9xN2NoCCwRQbjTAcjy/?=
 =?iso-8859-1?Q?8/TwsPvAbHqiRTT/Zl/omJHGcmt94lB8obci2NLkQSgoIvNhDSqE5uw1vi?=
 =?iso-8859-1?Q?8dVpCKH6RAa9EQ/sPnnUM+qdIjfedEX+aCXH4j6NMr+4CeBz/nGxzEvV3A?=
 =?iso-8859-1?Q?xx6+ef8U0o4DMVx/DTspuba/3VqfB4s9erzxvNZYZ8xey2M+B0FmStFPyC?=
 =?iso-8859-1?Q?nQyPFtATxYE+bgnoGIWplmGnYXARiUcQNnCgZYufjGIgm7sAL+nehBsyjN?=
 =?iso-8859-1?Q?9Qh+xbm0oXqJp94EgMUHlICDt9KOtTCoZqTjESdcVv1gtGg7uscbPxDJOa?=
 =?iso-8859-1?Q?qvBn3oOHRm3KN6MC1s/6iCnSaMkBtbSRrDxoFAAf+m6znpdIuwSfq/x7KS?=
 =?iso-8859-1?Q?KugAR6lrTYL9isiEqo0NT/EdGyFSWNkhjMiY/lkHzzAtbS+EVVialcE/tM?=
 =?iso-8859-1?Q?shmANUGtflh2jmvY6jHC3AewyDJppxg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 448825a2-910a-4213-7114-08de797c8d30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:28:18.6304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Av6M9WIK34J9t7ale/DWSCNOhXQlnFb/UC3hraw/PfJvripsOmR/h67BQwUPrag2QLkh4lY9XtYyZL1Ewie1rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9599
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

On Tue, Mar 03, 2026 at 04:26:01PM -0700, Summers, Stuart wrote:
> On Fri, 2026-02-27 at 17:34 -0800, Matthew Brost wrote:
> > Add struct xe_pt_job_ops, a dynamically refcounted object that
> > contains
> > the information required to issue a CPU bind via a job after the
> > initial
> > bind IOCTL returns.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c  |  10 +--
> >  drivers/gpu/drm/xe/xe_pt.c       | 132 +++++++++++++++++++++++++++--
> > --
> >  drivers/gpu/drm/xe/xe_pt.h       |   4 +
> >  drivers/gpu/drm/xe/xe_pt_types.h |  27 +++++--
> >  drivers/gpu/drm/xe/xe_vm.c       |  10 +--
> >  5 files changed, 149 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 69e6e3135ec6..cd6802642ef3 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1771,7 +1771,7 @@ xe_migrate_update_pgtables_cpu(struct
> > xe_migrate *m,
> >         }
> >  
> >         xe_migrate_update_pgtables_cpu_execute(vm, m->tile, ops,
> > -                                              pt_update_ops->ops,
> > +                                              pt_update_ops-
> > >pt_job_ops->ops,
> >                                                pt_update_ops-
> > >num_ops);
> >  
> >         return dma_fence_get_stub();
> > @@ -1798,7 +1798,7 @@ __xe_migrate_update_pgtables(struct xe_migrate
> > *m,
> >         bool usm = is_migrate && xe->info.has_usm;
> >  
> >         for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > -               struct xe_vm_pgtable_update_op *pt_op =
> > &pt_update_ops->ops[i];
> > +               struct xe_vm_pgtable_update_op *pt_op =
> > &pt_update_ops->pt_job_ops->ops[i];
> >                 struct xe_vm_pgtable_update *updates = pt_op-
> > >entries;
> >  
> >                 num_updates += pt_op->num_entries;
> > @@ -1867,7 +1867,7 @@ __xe_migrate_update_pgtables(struct xe_migrate
> > *m,
> >  
> >                         for (; i < pt_update_ops->num_ops; ++i) {
> >                                 struct xe_vm_pgtable_update_op *pt_op
> > =
> > -                                       &pt_update_ops->ops[i];
> > +                                       &pt_update_ops->pt_job_ops-
> > >ops[i];
> >                                 struct xe_vm_pgtable_update *updates
> > = pt_op->entries;
> >  
> >                                 for (; j < pt_op->num_entries; ++j,
> > ++current_update, ++idx) {
> > @@ -1904,7 +1904,7 @@ __xe_migrate_update_pgtables(struct xe_migrate
> > *m,
> >                         (page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> >                 for (i = 0; i < pt_update_ops->num_ops; ++i) {
> >                         struct xe_vm_pgtable_update_op *pt_op =
> > -                               &pt_update_ops->ops[i];
> > +                               &pt_update_ops->pt_job_ops->ops[i];
> >                         struct xe_vm_pgtable_update *updates = pt_op-
> > >entries;
> >  
> >                         for (j = 0; j < pt_op->num_entries; ++j) {
> > @@ -1922,7 +1922,7 @@ __xe_migrate_update_pgtables(struct xe_migrate
> > *m,
> >  
> >                 for (i = 0; i < pt_update_ops->num_ops; ++i) {
> >                         struct xe_vm_pgtable_update_op *pt_op =
> > -                               &pt_update_ops->ops[i];
> > +                               &pt_update_ops->pt_job_ops->ops[i];
> >                         struct xe_vm_pgtable_update *updates = pt_op-
> > >entries;
> >  
> >                         for (j = 0; j < pt_op->num_entries; ++j)
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 1f24eff75185..6b56e62a35c1 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -204,7 +204,9 @@ unsigned int xe_pt_shift(unsigned int level)
> >   * and finally frees @pt. TODO: Can we remove the @flags argument?
> >   */
> >  void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head
> > *deferred)
> > +
> 
> Extra line..
> 

+1

> >  {
> > +       bool added = false;
> >         int i;
> >  
> >         if (!pt)
> > @@ -212,7 +214,20 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags,
> > struct llist_head *deferred)
> >  
> >         XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
> >         xe_bo_unpin(pt->bo);
> > -       xe_bo_put_deferred(pt->bo, deferred, NULL);
> > +       xe_bo_put_deferred(pt->bo, deferred, &added);
> > +       if (added) {
> > +               xe_assert(pt->bo->vm->xe, !kref_read(&pt->bo-
> > >ttm.base.refcount));
> > +
> > +               /*
> > +                * We need the VM present until the BO is destroyed
> > as it shares
> > +                * a dma-resv and BO destroy is async. Reinit BO
> > refcount so
> > +                * xe_bo_put_async can be used when the PT job ops
> > refcount goes
> > +                * to zero.
> > +                */
> > +               xe_vm_get(pt->bo->vm);
> > +               pt->bo->flags |= XE_BO_FLAG_PUT_VM_ASYNC;
> > +               kref_init(&pt->bo->ttm.base.refcount);
> > +       }
> >  
> >         if (pt->level > 0 && pt->num_live) {
> >                 struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
> > @@ -1884,13 +1899,13 @@ xe_pt_commit_prepare_unbind(struct xe_vma
> > *vma,
> >  static struct xe_vm_pgtable_update_op *
> >  to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 op_idx)
> >  {
> > -       return &pt_update_ops->ops[op_idx];
> > +       return &pt_update_ops->pt_job_ops->ops[op_idx];
> >  }
> >  
> >  static u32
> >  get_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
> >  {
> > -       return pt_update_ops->current_op;
> > +       return pt_update_ops->pt_job_ops->current_op;
> >  }
> >  
> >  static struct xe_vm_pgtable_update_op *
> > @@ -1902,7 +1917,7 @@ to_current_pt_op(struct
> > xe_vm_pgtable_update_ops *pt_update_ops)
> >  static void
> >  incr_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
> >  {
> > -       ++pt_update_ops->current_op;
> > +       ++pt_update_ops->pt_job_ops->current_op;
> >  }
> >  
> >  static void
> > @@ -2264,7 +2279,6 @@ static int op_prepare(struct xe_vm *vm,
> >  static void
> >  xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops
> > *pt_update_ops)
> >  {
> > -       init_llist_head(&pt_update_ops->deferred);
> >         pt_update_ops->start = ~0x0ull;
> >         pt_update_ops->last = 0x0ull;
> >         xe_page_reclaim_list_init(&pt_update_ops->prl);
> > @@ -2612,7 +2626,8 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> >                         to_pt_op(pt_update_ops, i);
> >  
> >                 xe_pt_commit(pt_op->vma, pt_op->entries,
> > -                            pt_op->num_entries, &pt_update_ops-
> > >deferred);
> > +                            pt_op->num_entries,
> > +                            &pt_update_ops->pt_job_ops->deferred);
> >                 pt_op->vma = NULL;      /* skip in
> > xe_pt_update_ops_abort */
> >         }
> >  
> > @@ -2700,19 +2715,8 @@ void xe_pt_update_ops_fini(struct xe_tile
> > *tile, struct xe_vma_ops *vops)
> >  {
> >         struct xe_vm_pgtable_update_ops *pt_update_ops =
> >                 &vops->pt_update_ops[tile->id];
> > -       int i;
> >  
> >         xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > -
> > -       lockdep_assert_held(&vops->vm->lock);
> > -       xe_vm_assert_held(vops->vm);
> > -
> > -       for (i = 0; i < pt_update_ops->current_op; ++i) {
> > -               struct xe_vm_pgtable_update_op *pt_op =
> > &pt_update_ops->ops[i];
> > -
> > -               xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> > -       }
> > -       xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
> >  }
> >  
> >  /**
> > @@ -2749,3 +2753,97 @@ void xe_pt_update_ops_abort(struct xe_tile
> > *tile, struct xe_vma_ops *vops)
> >  
> >         xe_pt_update_ops_fini(tile, vops);
> >  }
> > +
> > +/**
> > + * xe_pt_job_ops_alloc() - Allocate PT job ops
> > + * @num_ops: Number of VM PT update ops
> > + *
> > + * Allocate PT job ops and internal array of VM PT update ops.
> > + *
> > + * Return: Pointer to PT job ops or NULL
> > + */
> > +struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops)
> > +{
> > +       struct xe_pt_job_ops *pt_job_ops;
> > +
> > +       pt_job_ops = kmalloc(sizeof(*pt_job_ops), GFP_KERNEL);
> > +       if (!pt_job_ops)
> > +               return NULL;
> > +
> > +       pt_job_ops->ops = kvmalloc_array(num_ops, sizeof(*pt_job_ops-
> > >ops),
> > +                                        GFP_KERNEL);
> > +       if (!pt_job_ops->ops) {
> > +               kvfree(pt_job_ops);
> 
> This should be kfree right?
> 

Yes, will fix.

Matt


> Thanks,
> Stuart
> 
> > +               return NULL;
> > +       }
> > +
> > +       pt_job_ops->current_op = 0;
> > +       kref_init(&pt_job_ops->refcount);
> > +       init_llist_head(&pt_job_ops->deferred);
> > +
> > +       return pt_job_ops;
> > +}
> > +
> > +/**
> > + * xe_pt_job_ops_get() - Get PT job ops
> > + * @pt_job_ops: PT job ops to get
> > + *
> > + * Take a reference to PT job ops
> > + *
> > + * Return: Pointer to PT job ops or NULL
> > + */
> > +struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops
> > *pt_job_ops)
> > +{
> > +       if (pt_job_ops)
> > +               kref_get(&pt_job_ops->refcount);
> > +
> > +       return pt_job_ops;
> > +}
> > +
> > +static void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op
> > *pt_op,
> > +                                 u32 num_ops)
> > +{
> > +       u32 i;
> > +
> > +       for (i = 0; i < num_ops; ++i, ++pt_op)
> > +               xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
> > +}
> > +
> > +static void xe_pt_job_ops_destroy(struct kref *ref)
> > +{
> > +       struct xe_pt_job_ops *pt_job_ops =
> > +               container_of(ref, struct xe_pt_job_ops, refcount);
> > +       struct llist_node *freed;
> > +       struct xe_bo *bo, *next;
> > +
> > +       xe_pt_update_ops_free(pt_job_ops->ops,
> > +                             pt_job_ops->current_op);
> > +
> > +       freed = llist_del_all(&pt_job_ops->deferred);
> > +       if (freed) {
> > +               llist_for_each_entry_safe(bo, next, freed, freed)
> > +                       /*
> > +                        * If called from run_job, we are in the dma-
> > fencing
> > +                        * path and cannot take dma-resv locks so use
> > an async
> > +                        * put.
> > +                        */
> > +                       xe_bo_put_async(bo);
> > +       }
> > +
> > +       kvfree(pt_job_ops->ops);
> > +       kfree(pt_job_ops);
> > +}
> > +
> > +/**
> > + * xe_pt_job_ops_put() - Put PT job ops
> > + * @pt_job_ops: PT job ops to put
> > + *
> > + * Drop a reference to PT job ops
> > + */
> > +void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops)
> > +{
> > +       if (!pt_job_ops)
> > +               return;
> > +
> > +       kref_put(&pt_job_ops->refcount, xe_pt_job_ops_destroy);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > index 4daeebaab5a1..5faddb8e700c 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -49,4 +49,8 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct
> > xe_vma *vma);
> >  bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
> >                           struct xe_svm_range *range);
> >  
> > +struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops);
> > +struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops
> > *pt_job_ops);
> > +void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > index 84b51d3762a4..92d50573ed1d 100644
> > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > @@ -91,12 +91,29 @@ struct xe_vm_pgtable_update_op {
> >         bool rebind;
> >  };
> >  
> > +/**
> > + * struct xe_pt_job_ops - Page-table update operations (dynamically
> > allocated)
> > + *
> > + * This is the portion of &struct xe_vma_ops and
> > + * &struct xe_vm_pgtable_update_ops that is dynamically allocated,
> > as it
> > + * must remain valid until the associated bind job completes. A
> > reference
> > + * count controls its lifetime.
> > + */
> > +struct xe_pt_job_ops {
> > +       /** @current_op: current page-table update operation */
> > +       u32 current_op;
> > +       /** @refcount: reference count */
> > +       struct kref refcount;
> > +       /** @deferred: list of deferred PT entries to destroy */
> > +       struct llist_head deferred;
> > +       /** @ops: page-table update operations */
> > +       struct xe_vm_pgtable_update_op *ops;
> > +};
> > +
> >  /** struct xe_vm_pgtable_update_ops: page table update operations */
> >  struct xe_vm_pgtable_update_ops {
> > -       /** @ops: operations */
> > -       struct xe_vm_pgtable_update_op *ops;
> > -       /** @deferred: deferred list to destroy PT entries */
> > -       struct llist_head deferred;
> > +       /** @pt_job_ops: PT update operations dynamic allocation*/
> > +       struct xe_pt_job_ops *pt_job_ops;
> >         /** @q: exec queue for PT operations */
> >         struct xe_exec_queue *q;
> >         /** @prl: embedded page reclaim list */
> > @@ -107,8 +124,6 @@ struct xe_vm_pgtable_update_ops {
> >         u64 last;
> >         /** @num_ops: number of operations */
> >         u32 num_ops;
> > -       /** @current_op: current operations */
> > -       u32 current_op;
> >         /** @needs_svm_lock: Needs SVM lock */
> >         bool needs_svm_lock;
> >         /** @needs_invalidation: Needs invalidation */
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 548b0769b3ef..3e2d2191b78c 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -585,11 +585,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops
> > *vops, bool array_of_binds)
> >                 if (!vops->pt_update_ops[i].num_ops)
> >                         continue;
> >  
> > -               vops->pt_update_ops[i].ops =
> > -                       kmalloc_objs(*vops->pt_update_ops[i].ops,
> > -                                    vops->pt_update_ops[i].num_ops,
> > -                                    GFP_KERNEL | __GFP_RETRY_MAYFAIL
> > | __GFP_NOWARN);
> > -               if (!vops->pt_update_ops[i].ops)
> > +               vops->pt_update_ops[i].pt_job_ops =
> > +                       xe_pt_job_ops_alloc(vops-
> > >pt_update_ops[i].num_ops);
> > +               if (!vops->pt_update_ops[i].pt_job_ops)
> >                         return array_of_binds ? -ENOBUFS : -ENOMEM;
> >         }
> >  
> > @@ -625,7 +623,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops
> > *vops)
> >         xe_vma_svm_prefetch_ops_fini(vops);
> >  
> >         for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
> > -               kfree(vops->pt_update_ops[i].ops);
> > +               xe_pt_job_ops_put(vops->pt_update_ops[i].pt_job_ops);
> >  }
> >  
> >  static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops,
> > u8 tile_mask, int inc_val)
> 
