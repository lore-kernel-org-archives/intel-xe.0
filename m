Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F449C5478C
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 16:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C280C10E499;
	Wed, 28 Feb 2024 16:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXFAwoOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC97D10E5C0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709139107; x=1740675107;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MjNBMPBQUZUCif6Or6Sh8xANmf13SBNsURDWdPp20M8=;
 b=VXFAwoOvXc9rN5ojll8UUab0u/sc2bc7yVY8lsuNexOWkoUoK1bBQYn9
 tVZ3It/mBEjR0WfYOTU5pYORyXOo8pDYA9lIrMpwCi/VjYHY8YNag/qvT
 TYR0pRZaoG2w5wqUQTnKBJm5N6BxUy6rWZli0P+jaKsnpfol+0OPkWz5m
 7al3+YgwqxvoWp3jl13XG5zQViSSle/SdASxR6w+ZfoMqDRSJ7Af2Qz5m
 p20hLH69n3Tg/Cvgcs2s28n81ncpyaAO0snU/KflY4MNBQmNmFfe5yu9/
 /c0iy4ajH3poagnHNNtWD+dzSRApa4k2QQuTPp7Ou07xr8bcVpFIb5Hb4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3716614"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3716614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:51:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="8052034"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 08:51:46 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 08:51:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 08:51:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 08:51:44 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 08:51:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSE79nMkpHpcxoipQdU12wDBRXOBljWQL0O3jewIwoyzuH4GlDxwOtwqVrpSPnpfyaD9Zr8lQJ+ev6xl3tpmTe90GlpywGxvHuwvv6q48W75Y7Xtl6d0+5liPQsrOZ8eQYEsMd29SnAOkFlPRlCY8Ek8pgJitCOetkmbnb2POWxbveODdinPKKtU1B2PNL4JLpWMGhtd7cJCW5IglQlCkHt0Od8N95wQ1lZMal7WYrrYhhPsXwpL6PZVYa6ufD1BnIrPYpZHCClMjtzWuvB7mcNZrxhDQGNlqQwkPctqxwieKmYxiuvFjwwuGRM6roN4U86ymfGRbgASr1QR7eNY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zomXELEsJWORzf6DJmKT1kIbbBqk4Meg+VrsAnKnMvI=;
 b=aGmN/lad2+w7pNTOX8oCETslsHwICr0Nt6KtfdBvxNdCCrqaWodmlYe+BaTTVSKKw/Z7cFkdeJ1UrYykOUElqePK1PXfkZg7q/dytnzIB/yGqYcSJtyO7MYAnWtVST1jMHAbWfHs3IwNoJU1O3NTR+ux4+GI2ngTYkzikPnQaBSt1ZhXdnx5W6yIAWgpGtLiRYXrEBrdSYSJpp/kD15XmLGFJ56hoi+xsiIahTaNmt/TnDqvsYiFdWn+0gFci75gktJkcQYhgTDUTRPpqzdd734F4XxT8YbSEmV1QLMHN03YsGDwAVTZkeDNVRMHh0aUjdnQ8nh/eFPtYwQ+iFfsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Wed, 28 Feb
 2024 16:51:40 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 16:51:34 +0000
Date: Wed, 28 Feb 2024 11:51:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC 21/34] drm/xe: Convert GuC CT paths from mem_access to
 xe_pm_runtime
Message-ID: <Zd9kkxpCZ174GzwF@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-22-rodrigo.vivi@intel.com>
 <1460e9d5-fb69-43a1-8be7-ae08152bb15b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1460e9d5-fb69-43a1-8be7-ae08152bb15b@intel.com>
X-ClientProxiedBy: BYAPR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:40::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ed3146-d64a-4bad-6fd0-08dc387d85ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1bjH3O3TTbAhlenK5FjvOmqYK64wkAimBXjBTgM+Q8ioxfMZnD6lu1vwv+/UxFtmdqqoAJ2+VM6WROyLRPPR7ebMMN0uzybgeVV/MjqsSnbqR4swg5ZMkK6uciWaYMVDO+AlvS+b04QGyUlz2khNyDpbJo8h56E6G3+d2gtD9A6PxS8KWn0R1MFtrqXZSU9y9A4/9tuqmRyz6huKkV7ak2mcd4MKKzbLPI4dZZEyha/3L7/NkcOlVzbFPiFFILAJp38/upNyyjS/9ScWqxJ+65uGMTOBLkZcJ72ZHGptFb496U1U1kH9jE242gsw1uXdM26J2vds8o7VrafGNXaM116O/I1RVYbcUh6upqn7eK/1VGR2SiFLJQLeSgOrU9D9u8vNTJkto/nazqmuBfqDYiJobZP1wUWMcLhMaYF5Vd7kG8bE3//Adf9QYEwIGJf2YYL2YQm2gFK0jBe0kPyaq5MAEPrw6VKhIzXJEXqTHr5dmrGYFLuNIiaPWDWLB835LnISDEWndub0ItaMpg1kBNjuTH9n/odePxit0PlAuBQ+5PlLwFbXuR4t84gRM+O2NwwsCF9wysHeYLC2/nfnYpD62jX2qkvEyVnLvdbs7VI6Pj7xaO1dTYJSSSFbsqXeg5rIk59MFR/qQyMeT2S61A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?acGGr6XghtClCwlbzJlDCNTJKhhRt+LsFU5lC2zMs0+rS0awKEvZxI+iitIW?=
 =?us-ascii?Q?i9u51eES5pnUEz1JExqlIx8N4ABmG0MwXZLyE+r2Pazg9rd4TacxURSJQoCK?=
 =?us-ascii?Q?MwlgsXinfG5HtDuYYUp5VmkgOUGmmYdk+7bvfhw2vKWKtDrRD6TlbgKSKkEp?=
 =?us-ascii?Q?QV9mpWKHp52tbLJpcWF/c48Lkne00I2K7m+TBiWD3Tk3cGTVWG2arAp7+gkz?=
 =?us-ascii?Q?v5Ga2yBx6mPSADyL0C3swA/yHCen+FX2MxgSBR6Jz5Z3PxyW4k/dhqn3aALK?=
 =?us-ascii?Q?kn5/M/Ys6VM9ZyTFzxD+JQKDP4Ab7F46mCGvZCX8F1UNJyzS5U1b2KhCmfn2?=
 =?us-ascii?Q?6dTBNPwZitbZLQcaW4d/Ti0LpoK/uHMbHA1imk/vXXfS070oo+igq02r3Y4e?=
 =?us-ascii?Q?MRBJ3M68iroqaQB0k73/WkcknWLfQqJtBX0Gx8pZQj0XAauksL/imBD4lKCL?=
 =?us-ascii?Q?pU3fV+btsIKbecxO5eDKBMXeDZxXtDcgaO3jaz9+tESDx9jYBQP8L76ihy/h?=
 =?us-ascii?Q?tXl8Hg720vn3I+/RjJqvf9ax1YZrSq5A8fcOYrgAkis7aSwQR32/WftT5pBd?=
 =?us-ascii?Q?NCXy5eaC1y9DxCFO6q1wO/FVkfQjwpssIFQd6o2hBRJlGQchmBZzLKH591oP?=
 =?us-ascii?Q?OeoKjaK+XNzC6G0n+4PvJBVNif8NUzowdHUtLQfI0n0ZG6ZZl3+o7Kepih/D?=
 =?us-ascii?Q?57sD8yOG8U5s8fGB5+xQ/EVhnC9NXRLj6+tEQymezbhRfO2eLXOKF7C0RjAy?=
 =?us-ascii?Q?kMy4wfVZ/x8NKT0Wx5/ckz7dL3BksiPPKGNu3B9MtJnnjbSIcTo1vy7Gbb1a?=
 =?us-ascii?Q?D4is49AomPUdFcfXgAZFyAbD2bUhde5nNNNSg/lj8I6XZ1s5kl/NbIBCnbOF?=
 =?us-ascii?Q?KvUqSh1TbxYHYfioO0G4dRaSd+PHAxaZSJOqF5J+Kr/MBBDlFneYrluAb/5/?=
 =?us-ascii?Q?9bRKD8p7j3vOEUzn96F7NzUdaH/svHVc+yFKNCqwD2w5oQc1X7P304Jq50zJ?=
 =?us-ascii?Q?WdlkMGdNmAwpbMf0wIA0hFAWE4YB0JRyC+4SzvEGT/Lx75V24dNZFRaAyOpl?=
 =?us-ascii?Q?khUr2ESFUX2bDhbnY0fD0PN++R34gz6w3YU9p/aMuX5vHnNR0ph0zjcuqDOC?=
 =?us-ascii?Q?eYxMhVSxA8ITLn7LsHd/E1AMd34/3eGGxiiz0qCvHt4zdvHBZIx+CatMFO8Y?=
 =?us-ascii?Q?it9I8HavqjAJYk82LfdjwWvkMMzPNXfmtMJjqtqQIIOjPfD3KsaZ6Dx9yL0H?=
 =?us-ascii?Q?K5JZd8ni736NYpxmkA4YdkitQgbcbxhTcPKzMXO/NUjvQSXjDRd4mJW8++TO?=
 =?us-ascii?Q?mtCfABPeYP+SvGP7sRxbqlvIY5241MDO9CbEnqKUGoFST1wr/dpLjG63dUaC?=
 =?us-ascii?Q?E1TFh/toqTmsFB9fa2Yfbe6GSB3e6jLGVBHlX8VJYpf2ACJIguWJ+JtGJHgz?=
 =?us-ascii?Q?3FRm/npNoMBoZQhy/0qVnEmi69A3IBW50VZHrZYsSK8Vg0xov9okFzsGR81M?=
 =?us-ascii?Q?G80AQVjRVd5aSUvisQC7qRfNICK0EE/Fy+l9UMsrTd5ZkqN+dg4N622hy8aX?=
 =?us-ascii?Q?J3FvLMpbgHU+bIJ2+pu2CBPy8bGbvubG9j31xdD4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ed3146-d64a-4bad-6fd0-08dc387d85ad
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 16:51:34.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l27BG7pSOCHNoeDAy1CQFF0pyW6gWTcElPvC4lCjb98ofs2F1yMIyEqZqJP5Rwelq9BB4BixkzVojMyE+iMHVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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

On Mon, Feb 05, 2024 at 12:23:41PM +0000, Matthew Auld wrote:
> On 26/01/2024 20:30, Rodrigo Vivi wrote:
> > For the G2H and TLB invalidation cases, the outer bounds
> > protection of the pm_runtime are not going to work. So
> > we need to have the inner side protections here.
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_debugfs.c      |  3 ++
> >   drivers/gpu/drm/xe/xe_guc_ct.c       | 79 +++++++++++++---------------
> >   drivers/gpu/drm/xe/xe_guc_ct_types.h |  2 +
> >   3 files changed, 41 insertions(+), 43 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 8abdf3c17e1d..b3669eac23c9 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -64,6 +64,9 @@ static int info(struct seq_file *m, void *data)
> >   			   xe_force_wake_ref(gt_to_fw(gt), XE_FW_GT));
> >   		drm_printf(&p, "gt%d engine_mask 0x%llx\n", id,
> >   			   gt->info.engine_mask);
> > +		drm_printf(&p, "gt%d g2h_outstanding %d g2h_pm_refs %d\n", id,
> > +			   gt->uc.guc.ct.g2h_outstanding,
> > +			   gt->uc.guc.ct.g2h_pm_refs);
> >   	}
> >   	xe_pm_runtime_put(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index f3d356383ced..139cfe733661 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -287,16 +287,49 @@ static int guc_ct_control_toggle(struct xe_guc_ct *ct, bool enable)
> >   	return ret > 0 ? -EPROTO : ret;
> >   }
> > +static void guc_ct_g2h_outstanding_clear(struct xe_guc_ct *ct)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < ct->g2h_pm_refs; i++)
> > +		xe_pm_runtime_put(ct_to_xe(ct));
> > +	ct->g2h_outstanding = 0;
> > +	ct->g2h_pm_refs = 0;
> > +}
> > +
> > +static void guc_ct_g2h_outstanding_dec(struct xe_guc_ct *ct)
> > +{
> > +	if (ct->g2h_pm_refs > 0)
> > +		xe_pm_runtime_put(ct_to_xe(ct));
> > +	ct->g2h_pm_refs--;
> > +	ct->g2h_outstanding--;
> > +}
> > +
> > +static void guc_ct_g2h_outstanding_add(struct xe_guc_ct *ct, int num_g2h)
> > +{
> > +	struct xe_device *xe = ct_to_xe(ct);
> > +	int i;
> > +
> > +	for (i = 0; i < num_g2h; i++) {
> > +		if (xe_pm_runtime_get_if_in_use(xe))
> > +			ct->g2h_pm_refs++;
> > +		else
> > +			drm_err(&xe->drm, "Failed to grab RPM ref for outstanding g2h\n");
> > +	}
> 
> I guess we could maybe drop the g2h_pm_refs, and rather just track single
> rpm ref for entire ct when g2h_outstanding 0 -> 1, and likewise drop the rpm
> ref when g2h_outstanding reaches zero?

I thought about that, but I was afraid of some unbalanced case when the
get_if_in_use fails.

> 
> > +	ct->g2h_outstanding += num_g2h;
> > +}
> > +
> >   static void xe_guc_ct_set_state(struct xe_guc_ct *ct,
> >   				enum xe_guc_ct_state state)
> >   {
> >   	mutex_lock(&ct->lock);		/* Serialise dequeue_one_g2h() */
> >   	spin_lock_irq(&ct->fast_lock);	/* Serialise CT fast-path */
> > +
> >   	xe_gt_assert(ct_to_gt(ct), ct->g2h_outstanding == 0 ||
> >   		     state == XE_GUC_CT_STATE_STOPPED);
> > -	ct->g2h_outstanding = 0;
> > +	guc_ct_g2h_outstanding_clear(ct);
> >   	ct->state = state;
> >   	spin_unlock_irq(&ct->fast_lock);
> > @@ -428,7 +461,7 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
> >   		lockdep_assert_held(&ct->fast_lock);
> >   		ct->ctbs.g2h.info.space -= g2h_len;
> > -		ct->g2h_outstanding += num_g2h;
> > +		guc_ct_g2h_outstanding_add(ct, num_g2h);
> >   	}
> >   }
> > @@ -439,7 +472,7 @@ static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
> >   		  ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
> >   	ct->ctbs.g2h.info.space += g2h_len;
> > -	--ct->g2h_outstanding;
> > +	guc_ct_g2h_outstanding_dec(ct);
> >   }
> >   static void g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
> > @@ -1199,14 +1232,8 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
> >    */
> >   void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
> >   {
> > -	struct xe_device *xe = ct_to_xe(ct);
> > -	bool ongoing;
> >   	int len;
> > -	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> > -	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> > -		return;
> > -
> >   	spin_lock(&ct->fast_lock);
> >   	do {
> >   		len = g2h_read(ct, ct->fast_msg, true);
> > @@ -1214,9 +1241,6 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
> >   			g2h_fast_path(ct, ct->fast_msg, len);
> >   	} while (len > 0);
> >   	spin_unlock(&ct->fast_lock);
> > -
> > -	if (ongoing)
> > -		xe_device_mem_access_put(xe);
> >   }
> >   /* Returns less than zero on error, 0 on done, 1 on more available */
> > @@ -1247,36 +1271,8 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
> >   static void g2h_worker_func(struct work_struct *w)
> >   {
> >   	struct xe_guc_ct *ct = container_of(w, struct xe_guc_ct, g2h_worker);
> > -	bool ongoing;
> >   	int ret;
> > -	/*
> > -	 * Normal users must always hold mem_access.ref around CT calls. However
> > -	 * during the runtime pm callbacks we rely on CT to talk to the GuC, but
> > -	 * at this stage we can't rely on mem_access.ref and even the
> > -	 * callback_task will be different than current.  For such cases we just
> > -	 * need to ensure we always process the responses from any blocking
> > -	 * ct_send requests or where we otherwise expect some response when
> > -	 * initiated from those callbacks (which will need to wait for the below
> > -	 * dequeue_one_g2h()).  The dequeue_one_g2h() will gracefully fail if
> > -	 * the device has suspended to the point that the CT communication has
> > -	 * been disabled.
> > -	 *
> > -	 * If we are inside the runtime pm callback, we can be the only task
> > -	 * still issuing CT requests (since that requires having the
> > -	 * mem_access.ref).  It seems like it might in theory be possible to
> > -	 * receive unsolicited events from the GuC just as we are
> > -	 * suspending-resuming, but those will currently anyway be lost when
> > -	 * eventually exiting from suspend, hence no need to wake up the device
> > -	 * here. If we ever need something stronger than get_if_ongoing() then
> > -	 * we need to be careful with blocking the pm callbacks from getting CT
> > -	 * responses, if the worker here is blocked on those callbacks
> > -	 * completing, creating a deadlock.
> > -	 */
> > -	ongoing = xe_device_mem_access_get_if_ongoing(ct_to_xe(ct));
> > -	if (!ongoing && xe_pm_read_callback_task(ct_to_xe(ct)) == NULL)
> > -		return;
> > -
> >   	do {
> >   		mutex_lock(&ct->lock);
> >   		ret = dequeue_one_g2h(ct);
> > @@ -1290,9 +1286,6 @@ static void g2h_worker_func(struct work_struct *w)
> >   			kick_reset(ct);
> >   		}
> >   	} while (ret == 1);
> > -
> > -	if (ongoing)
> > -		xe_device_mem_access_put(ct_to_xe(ct));
> >   }
> >   static void guc_ctb_snapshot_capture(struct xe_device *xe, struct guc_ctb *ctb,
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > index d29144c9f20b..4220230e7be4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> > @@ -108,6 +108,8 @@ struct xe_guc_ct {
> >   	} ctbs;
> >   	/** @g2h_outstanding: number of outstanding G2H */
> >   	u32 g2h_outstanding;
> > +	/** @g2h_pm_refs: number of pm_refs for pending G2H */
> > +	u32 g2h_pm_refs;
> >   	/** @g2h_worker: worker to process G2H messages */
> >   	struct work_struct g2h_worker;
> >   	/** @state: CT state */
