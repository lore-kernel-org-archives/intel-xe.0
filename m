Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4C7C47258
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 18:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F19B10FBF4;
	Wed, 31 Jan 2024 18:30:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A7510FBF1
 for <intel-xe@lists.freedesktop.org>; Wed, 31 Jan 2024 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706725833; x=1738261833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ga8qIKMGUI8dOF6EPR8EDfEMd6ZjHr2D9/L17esWzKc=;
 b=MAnSnQVeFuSz1U0id6dAJvxg1dDTQtHQXNzUkvbWy3Ey3r+kuAG2OxUs
 N1yqHr34Pdb+vtHk9c88TPswld4NGzLr0VjHcXUYM1yUUue1KN2Bslc82
 A0W8f3mID5ugwWbTItZUSwVBy/Y6ZtiIb5rywNOE3n+x+Sxu40GD8Nxgz
 osyr/nrTVh+iaRWVmlwtk472/qCsV8sFpQNF7pOB7WYVP4osCz7jPuEDO
 a96mZ3fzV7HFCztTN6eUsTQ0VlXhukXhoKWGm/A5MOGgyHNyfy+F1Yjin
 rm5wVc8fV/L0M8BwNX4GoVyMSRHUTXEfSRJMxNrJt5jWzFPGyvzQUX9+r Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402532269"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="402532269"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:30:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="907977482"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="907977482"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 10:30:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 10:30:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 10:30:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 10:30:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 10:30:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cH/gE2F989lWScy8SZsBQTC1aJaJ03vfmNhUTwloaUiu1w8y8pwTmWCFm8+A4EjYXljUPxyPHha132fyVtKCh7fsGueTF13e1yekyecCSCNjEasoPREcMvb1kSTxVwzANKd2Xc2fTrpp27bkZGEeDcN+GQ/3UUDUVolDXToUcywTt3rK7yy752duqNj/qXw7xYfYiSADxInIAeNwzDr0li2GDFwLOJI8pUjjdamLpfZU9LL07STP/2TY4aJjLjV+Z1I0RZWmIvExEe1AXu85hqta04q6wdkizGAA6vSzXEzay7JLRXRaP3xbPKgun6PTxZ0y4YoMKxUIp5IxRl02DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOUUOKxJhII/nNKjTUTRvdNOTEn7fqkhcH3GIHpzTX0=;
 b=DoJo6VmqWsbL3S6j26pwsn2/cYdvBUvHO+tPW4FOv9NWTxqtCvzjLrEUrH27oFhavuyPP3ps1PHNzRYXcwo3D90MOMXs+O4ML4STFBKpT93J7RxVRyApzoQfHruOuECMyzBNRXnQZD6734iwzs3x16rCQBpsQP0fc9FjClQzeU2HIb3eQvJaKcwTJc4IVYyRBtQ49oQJJce+xGJpIAjxtBwre5RVfHrbxRXx9fJc0W17tUxpBBgo1GRRsP7nKyZP+ktjpDGoH8bEH+JOcQT+eQc6kzkvcxoSL/wM93PLbQALzmZ5TrY7V5Bw8fZAvV/NJrnxReZ3YBArKktJYviEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH3PR11MB8153.namprd11.prod.outlook.com (2603:10b6:610:163::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 18:30:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::2157:7433:d32c:a8e3%4]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 18:30:21 +0000
Date: Wed, 31 Jan 2024 10:30:18 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v5 1/1] drm/xe: Expose number of dss per group and helpers
Message-ID: <20240131183018.GB8089@mdroper-desk1.amr.corp.intel.com>
References: <20240130212208.235448-1-zhanjun.dong@intel.com>
 <20240130212208.235448-2-zhanjun.dong@intel.com>
 <20240131000941.GA8089@mdroper-desk1.amr.corp.intel.com>
 <3bb9f8ee-b797-4dde-b228-7590bd3dd0ad@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3bb9f8ee-b797-4dde-b228-7590bd3dd0ad@intel.com>
X-ClientProxiedBy: BYAPR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::42) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH3PR11MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: 41514a90-4e89-4dfd-fa51-08dc228aaf0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7C9u/od4aePcbdDH5SLO3B57prt43DKlj061+96FdULYwlwMz2DpFsHgTwnxBOn3LfVM/b/bAv/BFWCSBzNc6JQEmGWPy8yN4Tho6sxEKW8KH9i/QKmCAmaRb479uOBYA+HmYLXtduE0t54GpuLvx8MLssX0u9EoO5LZj595hM3TWB6VPrgNIIKnS+46PdcylUd2MEUvFHMbIpm94Mecl7MDee9YpVnNPmuPutkmUyw6VaE8dImJSPkyCMTGih6vE/bf9cCiqGtjYU0EsclykwCb+mJpWaReRk6XZ3ZyKhBah8LsgFFUkPH2Lmi547XCskxHWLfoI2lc3Gtwubvvk7jqNe1dWCTZUECEu5f/vrlKvyRQE0hXi4B986bUEhybHGJN6qsqxHpyVcGYBkOP63BzYT9p1QheZBNzpk6AjVnLRGEHbX5Di4AhdjCbRNKFRZ/0Epms/+BVZXs+vpgfhxHAIHh8uRtK8Ydtu0rOkBnlwTtn0KU/wo40YfEHRlBIC8L0sJRYk+BoJukogccR4bQrvbkMeEEY71P3H8lpR6gNni/7oM/U5L8YBSdDkJve
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(66899024)(4326008)(86362001)(33656002)(41300700001)(38100700002)(82960400001)(6666004)(6506007)(53546011)(8936002)(8676002)(6636002)(316002)(66556008)(6486002)(478600001)(66946007)(66476007)(5660300002)(26005)(83380400001)(6862004)(2906002)(6512007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UnShxwunV3uOrswIXLl0toebdRr2a7EYro4nvlQvsdBScsX8nOXJYCy6FoVY?=
 =?us-ascii?Q?tbre8rwzKGnJ3klNFaDvftqqrQuTJQHDGoLLju8qDal84jb7H8WALxbfLl2t?=
 =?us-ascii?Q?FRMkjpyJU5sGXhoDQpWLbW6dyQyamxKxh3S91Q/o6TXv2ms7HtFSt7b8dgnL?=
 =?us-ascii?Q?ZpgO6oiDffV4veS9rttRQz1+F8m/Ij2U0ce2orMHwxvvAL8L1xRjy6BEyK0I?=
 =?us-ascii?Q?K2QzaL/DZxJCAQWetC4c6IAZBJTUxWwVvaDvHX4mcRgPy9X6fPtgPIEdEQP2?=
 =?us-ascii?Q?pcxPTDI0bvN4E46Uh5ob3VZficKgUm9QN4Wnwct4PKvIY1gpcPJTeF2fcYRO?=
 =?us-ascii?Q?MgFK0SShPmoOhTEkAzhQoosK/eCz4Z0YNReW1THlFeLOldDq0VEfD0kxn/tC?=
 =?us-ascii?Q?EM2+zDdyQpFeW4DdoyTg1rdqGC6uaJgbQXdPZO/nj7O/CK/mUSUza4qOTHAf?=
 =?us-ascii?Q?XSWi3nhfQzc/SqonfleFwLzcpcRnAVojdrm2UiKmZw98mLlE+45vVHE35t7d?=
 =?us-ascii?Q?3qEvkRFBZFkf6Nd5ETJCbB/HwAIMVC0rsJ0sRRSQgsgHNlhisMjcZTKF/Zuc?=
 =?us-ascii?Q?ofNUHNvO9X1sDwYqwEKbw8fsyd93dR8I3uxGz0is0xBED/ScUG39YdWXfUGD?=
 =?us-ascii?Q?EXj43s/6sO3m4Ai8/p/TM7tcT8PEQ7qHZS8dyCKAUHT2eYSJDQSMQrJLTWBr?=
 =?us-ascii?Q?bQUspp+CZ6ZpAuFT3gApFB9PXaOxGl9GCCH3JfUQeW7xcyZ6U4pL7pAcQ1Gq?=
 =?us-ascii?Q?dJMxIpas6ZfrzDg6sWdKzT+k9Optpna1N18DRnt49wSESAoMXKSXU7VYGenu?=
 =?us-ascii?Q?vZ0BHjJaNyu5PQvZjN2ZT/aJmvTMmnAZRG3EEqMTeleBRmXWMCqV8+5hqYiI?=
 =?us-ascii?Q?gvr+iNinbRN3rX4edtn0mYL1pZUGKJGtynx+0ZVXoNWpsTeR5gDxFPv/HFcH?=
 =?us-ascii?Q?cVnQSoZnuxJyPgaSaX21IOfzeb0cHbsqTCZVq5BUt5w4bLSjggX00s2LCF+6?=
 =?us-ascii?Q?2twVqg0+hbQUdHQb0uquDSq4TDrPVBnCA76SoXOtN6kPHHIsKtBtmimnm9q1?=
 =?us-ascii?Q?s2vSsgRT1VCYTS9N3B6lK8M8JJhzf8DCXDsBMyYSkfPyJ7ezVhybZGeBin7V?=
 =?us-ascii?Q?agcNo/90ZOJkeCtKqhwvbal7+us5a4B6FYgV08VyXQEbSak33Catp800b3eY?=
 =?us-ascii?Q?6M5Et08bF3l28R2qoKx+1ZCEt08Yg1DgBXwz6ykGj2miyu8nv4JmfE0j19kT?=
 =?us-ascii?Q?5doL+fDXUYw7ICFyeG3zTIMI3lW0NJuuVZIYua9VGhklEIRTEIlE8cH1CBSV?=
 =?us-ascii?Q?1Zt4dqH92tcYf/CIXoXrEe7AoLS3AFmgxi7ExTpXrWJj8fK3ooZ4y+TZMahP?=
 =?us-ascii?Q?kstyaPaNGM9pFRf7cEVcllteaUxKtxFpgylr6oOPFzZreeZAMXsm0tqbPM6+?=
 =?us-ascii?Q?OkTwIRzP6WgAQmme1IrsJdj9uSUNaxvWG1PgQS5gqvSsFa76C3/1aSH5ns4m?=
 =?us-ascii?Q?+dm2vW3uPLjObHldEsr0tYQ1Sa0HIEsqae/AgmBZ35L4/qjMRwY7VFZwasQU?=
 =?us-ascii?Q?VJDojYRXmw8ZR8Ut0ATH+nMjot4Pow/rPZkNjEF8jjJDFidj4m4t5ktbSUtH?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41514a90-4e89-4dfd-fa51-08dc228aaf0b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 18:30:21.8850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/DnzOg4ziYcrwDvkQEe9YDjA/1moxk0kAayseskww4KZFFn1Ykve7EQ7loUA6YC7+27dROSPRTAfQMiJCBin3NtW4Ja8DAh6D3OxaxpZeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8153
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 10:47:32AM -0500, Dong, Zhanjun wrote:
> 
> 
> On 2024-01-30 7:09 p.m., Matt Roper wrote:
> > On Tue, Jan 30, 2024 at 01:22:08PM -0800, Zhanjun Dong wrote:
> > > Expose helper for dss per group. This is a precursor patch to allow
> > > for easier iteration through MCR registers and other per-DSS uses.
> > > 
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_mcr.c      | 40 ++++++++++++++++++++++++++++-
> > >   drivers/gpu/drm/xe/xe_gt_mcr.h      | 17 ++++++++++++
> > >   drivers/gpu/drm/xe/xe_gt_topology.c |  3 ---
> > >   drivers/gpu/drm/xe/xe_gt_types.h    |  2 ++
> > >   4 files changed, 58 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > index 77925b35cf8d..ad2e42dc2218 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> > > @@ -291,11 +291,16 @@ static void init_steering_mslice(struct xe_gt *gt)
> > >   	gt->steering[LNCF].instance_target = 0;		/* unused */
> > >   }
> > > +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
> > > +{
> > > +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> > > +}
> > > +
> > >   static void init_steering_dss(struct xe_gt *gt)
> > >   {
> > >   	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
> > >   			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
> > > -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
> > > +	unsigned int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
> > >   	gt->steering[DSS].group_target = dss / dss_per_grp;
> > >   	gt->steering[DSS].instance_target = dss % dss_per_grp;
> > 
> > To avoid duplicating the logic, we could just replace these lines with a
> > call to your new xe_gt_mcr_get_dss_steering() function as well.  Then we
> > don't even need the dss_per_grp local variable.
> 
> There are pointer type mismatch issue, both gt->steering[DSS].group_target
> and gt->steering[DSS].instance_target are u16, while
> xe_gt_mcr_get_dss_steering take uint*, which called by the macro and get the
> pointer from macro. I would prefer leave int type as macro argument type as
> it is easy and safe way to avoid write 4/8 bytes to 2 bytes data.
> Let's leave the part as is to avoid u16* vs uint* type issue.
> 
> > 
> > > @@ -683,3 +688,36 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
> > >   		}
> > >   	}
> > >   }
> > > +
> > > +/**
> > > + * xe_gt_mcr_get_dss_steering - returns the group/instance steering for a DSS
> > > + * @gt: GT structure
> > > + * @dss: DSS ID to obtain steering for
> > > + * @group: pointer to storage for steering group ID
> > > + * @instance: pointer to storage for steering instance ID
> > > + *
> > > + * Returns the steering IDs (via the @group and @instance parameters) that
> > > + * correspond to a specific DSS ID.
> > > + */
> > > +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
> > > +				unsigned int *instance)
> > > +{
> > > +	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
> > > +
> > > +	*group = dss / dss_per_grp;
> > > +	*instance = dss % dss_per_grp;
> > > +}
> > > +
> > > +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice)
> > 
> > "dss" and "subslice" are basically two terms for the same thing so this
> > name is a bit redundant.  Something like "xe_gt_mcr_has_dss" would
> > probably be fine?
> > 
> > Although this should probably be in xe_gt_topology rather than xe_gt_mcr
> > since it deals more with the hardware topology than with steering.  So
> > moving it over to that file, the name would become
> > "xe_gt_topology_has_dss."
> Moved to xe_gt_topology is fine, because the function need dss per group to
> do calculation, then it requires xe_gt_mcr_get_dss_per_group exposed.
> 
> > 
> > > +{
> > > +	int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
> > > +	int index = slice * dss_per_grp + subslice;
> > > +
> > > +	if (index >= XE_MAX_DSS_FUSE_BITS) {
> > > +		xe_gt_dbg(gt, "DSS id out of range: slice:%d subslice:%d\n", slice, subslice);
> > > +		return false;
> > > +	}
> > > +
> > > +	return test_bit(index, gt->fuse_topo.g_dss_mask) ||
> > > +	       test_bit(index, gt->fuse_topo.c_dss_mask);
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
> > > index 27ca1bc880a0..356f21978eb8 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
> > > @@ -7,6 +7,7 @@
> > >   #define _XE_GT_MCR_H_
> > >   #include "regs/xe_reg_defs.h"
> > > +#include "xe_gt_types.h"
> > >   struct drm_printer;
> > >   struct xe_gt;
> > > @@ -25,5 +26,21 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
> > >   			       u32 value);
> > >   void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
> > > +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt);
> > 
> > It doesn't look like you actually use this outside of xe_gt_mcr.c
> > anymore so we probably don't need to export it.  It can remain a static
> > function for now.
> Same to above, move xe_gt_mcr_has_dss to xe_gt_topology.c conflicts with
> this static prototype definition.
> 
> > 
> > > +void xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, unsigned int *group,
> > > +				unsigned int *instance);
> > > +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int subslice);
> > > +
> > > +#define _HAS_DSS(gt__, group__, instance__) xe_gt_mcr_dss_has_subslice(gt__, group__, instance__)
> > 
> > I don't think we need this macro which is just a pure alias for the real
> > function.
> Sure, will take it off.
> 
> > 
> > > +
> > > +/*
> > > + * Loop over each subslice/DSS and determine the group and instance IDs that
> > > + * should be used to steer MCR accesses toward this DSS.
> > > + */
> > > +#define for_each_dss_steering(dss_, gt_, group_, instance_) \
> > > +	for (dss_ = 0, xe_gt_mcr_get_dss_steering(gt_, 0, &(group_), &(instance_)); \
> > > +	     dss_ < XE_MAX_DSS_FUSE_BITS; \
> > > +	     dss_++, xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_))) \
> > > +		for_each_if(_HAS_DSS(gt_, (group_), (instance_)))
> > 
> > We could also probably implement this more efficiently if we had a
> > topology helper like this (untested):
> > 
> >      int xe_gt_topology_get_next_dss(struct xe_gt *gt, int from) {
> >              xe_dss_mask_t all_dss;
> >              unsigned long next;
> >              bitmap_or(all_dss,
> >                        gt->fuse_topo.g_dss_mask,
> >                        gt->fuse_topo.c_dss_mask,
> >                        XE_MAX_DSS_FUSE_BITS);
> > 
> >              next = find_next_bit(all_dss, XE_MAX_DSS_FUSE_BITS, from);
> >              if (next == XE_MAX_DSS_FUSE_BITS)
> >                      return -1;
> >              return next;
> >      }
> > 
> > Then you could write these loops as something like:
> > 
> >     #define for_each_dss_steering(dss_, gt_, group_, instance_) \
> >             for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
> >                  dss_ >= 0; \
> >                  dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
> > 
> The macro above actually not set group_ and instance_, while the macro
> for_each_dss_steering designed is to iterate all dss id, call a code block,
> with group_ and instance_ already set. In my review comments to Jose's
> patch, I have similar optimization, but revert back because of the same
> group_ and instance_ not set reason.

Sorry, typed it up too fast.  Something like this should work I think?

     #define for_each_dss_steering(dss_, gt_, group_, instance_) \
             for (dss_ = xe_gt_topology_get_next_dss(gt, 0),
                  xe_gt_mcr_get_dss_steering(gt_, 0, &(group_), &(instance_)); \
                  dss_ >= 0; \
                  dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1), \
                  xe_gt_mcr_get_dss_steering(gt_, dss_, &(group_), &(instance_))) \

Or if the commas are too ugly, you can make xe_gt_mcr_get_dss_steering()
return an int and do something like

     #define for_each_dss_steering(dss_, gt_, group_, instance_) \
         for (dss_ = xe_gt_topology_get_next_dss(gt, 0); \
              dss_ >= 0; \
              dss_ = xe_gt_topology_get_next_dss(gt, dss_ + 1)) \
                 for_each_if(xe_gt_mcr_get_dss_steering(gt_, dss, &(group_), &(instance_)))

so that the for_each_if assigns the group/instance.


Matt

> 
> > That also avoids leaking the XE_MAX_DSS_FUSE_BITS internal detail
> > outside the topology files.
> > 
> > >   #endif /* _XE_GT_MCR_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > index a8d7f272c30a..e973eeaac7f1 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > > @@ -11,9 +11,6 @@
> > >   #include "xe_gt.h"
> > >   #include "xe_mmio.h"
> > > -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
> > > -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> > > -
> > >   static void
> > >   load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
> > >   {
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 70c615dd1498..b926606edb38 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -25,7 +25,9 @@ enum xe_gt_type {
> > >   };
> > >   #define XE_MAX_DSS_FUSE_REGS	3
> > > +#define XE_MAX_DSS_FUSE_BITS	(32 * XE_MAX_DSS_FUSE_REGS)
> > 
> > Based on the suggestions above, I don't think moving these will actually
> > be necessary.
> This bind with for_each_dss_steering macro define.
> > 
> > 
> > Matt
> > 
> > >   #define XE_MAX_EU_FUSE_REGS	1
> > > +#define XE_MAX_EU_FUSE_BITS	(32 * XE_MAX_EU_FUSE_REGS)
> > >   typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> > >   typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
> > > -- 
> > > 2.34.1
> > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
