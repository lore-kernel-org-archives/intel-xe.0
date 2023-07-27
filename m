Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607DEC001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3BD10E593;
	Thu, 27 Jul 2023 14:29:32 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0E010E58F
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690468169; x=1722004169;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AhniQdCYchIZIVLS8bP9R4gx6S/zrhlL4ViteoOwICk=;
 b=khgWTqwpgFehjliqvqHXkksG2tXj7zjMUc0Y8LsuA1xdV17WmccVUhLs
 EK+U0xWO13X8rhr5xvwNRD2kg+truOvJhu0r4sRWDhADAv0qUYeA34oT3
 kT6/PvCKmw+as49uI9btVVDMMHlnBHHPFOunIfSEW6VI14CFhtXBGPVhk
 jpGiP4N3M+nM0dvMAHtbWA6Vo36qOklze4J0UJgNZj+tID4DdXbolbgR9
 H6iR5l0ldw0gshLdUhi9291JOPTwZldfToKUEr7SK9bAWiPU8Q6vJGdKp
 5WmP3R/p1pbya1faHkigBNwpD22Siw1XxQLNqRLgvQGUvLx1X0Ky5kUaE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365785953"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="365785953"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:28:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="840820776"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="840820776"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2023 07:28:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:28:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:28:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oR+i09qwOajGYGLMnRKOMsAKZP1T3DgEYHv6dtjAkMRIySOxezNcvqQTj/ZzMTvrLAWpapdIZtFeiyQsnUOgnH+El7FXqRXhKeaARDbz32Ga5lx52fmtBwMCHfPf7Z+DAF/G0sLi0U2RnophdNNDjRuSfoIPx1XvmlpXi02oUQrK9BftCGbcyHhOLwvHjl+FdULm/b4yuWfYY8qyYRg4RPlbh3Jn63adcAcBIJG5mW1UbeLWrL13WIbOvjsmgUmmuGurdyPx4eaGfaT8MxLgQ1540WEc4gtfbo2nn9bsulplbB7sPTDEQxW0jodmWs2LkE5dfuz9qhepXvDhbXOu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJfW+1SRdVby5++VXgpy2gQRBZjRuT/6YR07JSlNjqI=;
 b=HnttZLpugEW7TH/EgnyXj4Rju7/sCLvtWc8EwnAtogVvDhtQP14gKbOmOVYy7ol5+BIHMEutUKJTrE2pvUQYple4bw3Rnlmnxo2sA1bkVOy35L0sEQ8J3NSMAxpwsa8hYg2pwqRHPl2suRBL6jbgliLBnhgUBOhlnDgBjAw3qTUr6PVK1nTvb5tmWMDSRmDTn+PQDYON/Q38Syrzn6aJX5/QOMlGk0rJYXJhQfBCtrB6By+sexwOWCqAl/28q/3O0bxN0Og6deUNYCrnkBjEa0IJYYdIgyC0W1+IDz77R+ya6M8liXmptgouWn7qGlFT+g6ZlJSThEIZZgycOg0Ktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7894.namprd11.prod.outlook.com (2603:10b6:610:12c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:28:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:28:37 +0000
Date: Thu, 27 Jul 2023 14:27:51 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZMJ+59JTkoanHTfl@DUT025-TGLU.fm.intel.com>
References: <20230726160708.3967790-1-lucas.demarchi@intel.com>
 <20230726160708.3967790-5-lucas.demarchi@intel.com>
 <20230726173046.GV138014@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726173046.GV138014@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0282.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7894:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c7e1e3-cfb7-4019-459f-08db8eadc446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9S4Y/yrepG8LTnOlHlCb8GU3JS2o7QSfVepKDNyv5bsfD+CYrwluXL/6Y1oZ9PIFaZJTI1BgHMh08SfKSggMrwf6V71tTEgxr/xVrQF0MyeYTktitbAgNo4/CoKLmcTI9jYReK2BV2ZQokJWA+szhB8jnrfFt0Ti8JdUgG11p7J0heNDR5ef3q65R3NwS5z0U5ejLBrtPdCNQ2v3mU64QMuC5QviLh70Kut1WMoKQ9l3jy+j/mo6sEqH/9RZrQVv1ZRr7Q+HwALPyLiuPn1UslRDrsPsAi/NEd99RiXBlJyvZ46KCxHBR8UuEx59bI8/JItMDl2gt+FfVkCAFk/MtVm8VpadgZHloaUtcp2aDbQWOsWrtkIL3ctvErVQX6PLx68ACYy/9+ZVpKIVMIFV+QL5NUw/RnHlymxgZH6QCdYJpkzOnerlFIqUZZs/Tmway/oDxNH9viBJrVXqhalNJWPFAbFebnKD+qidOMlNh/0afeaZpvTBw1oSy5A/83mP//LbnsmASdBupLE+0VhatkfcHut881PlvrVsNOqDIHuZuAXC0tSUyOlbmvLVvMrjYls3dLpkEuUCgXxnSemNqvY4fcYpnRUCPSdLLH00gkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(316002)(41300700001)(8676002)(8936002)(26005)(6862004)(6506007)(66899021)(54906003)(82960400001)(6636002)(4326008)(66946007)(66476007)(6512007)(478600001)(66556008)(6666004)(6486002)(38100700002)(2906002)(83380400001)(86362001)(186003)(44832011)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nuWXa5NpefZjJr12FyRcR1vxTPd6vsxEyxxX/fb/Rn1CfrC3I6rFDXHwaomZ?=
 =?us-ascii?Q?ercAfM0vaug//KYl/PiVQUFZSTlEEczSm35ektFVbQTZnliHZRT27fDyiNoy?=
 =?us-ascii?Q?NyigPMARcYFf4fKS0D7a48qgm/BC6K5522/Vo1uyvio5Pkn4B3QrqhqMXS8z?=
 =?us-ascii?Q?co8WfC4yCxV/Xfd0+p30aixoRv1ChhJYYZ9U2EWpUBxIgfCLc4lCJGIgzCIK?=
 =?us-ascii?Q?+/DzEv5iauz59Iw/yLodjFH1q0Y5uRm1HizPj+7dOHHMa3wlKNoYFi0NuH5H?=
 =?us-ascii?Q?kg6LAgKyNFLhs9WwR/36z+v+QDhZmuVwgXKbXF5e8E7lu7V3KDnjCJKsW+Jc?=
 =?us-ascii?Q?TNoALvZTIfvUzaO/YItoPmuX4idfmKjzXQfJLK2/vV0NBY0wwnjs0/Or78CZ?=
 =?us-ascii?Q?nfvgoNOHe+aON6gCGX275cWnzccnFd22kroA0naEpDnsyoGIwb0Ovp3C1kxk?=
 =?us-ascii?Q?3mvxLV/o9Ov1SENh0UipVDYlKKNumYkdpCIWCQu5+ULITgvywhQH41A+rPCO?=
 =?us-ascii?Q?FKvP5N2IZzzGNeQcV9OEx6HR2b4M594cSdcLJnPD0tVPALATWqgBilkOhabV?=
 =?us-ascii?Q?C+lLNtTlQFkNInHwCrKubnvXzNsfVCGQtqRSxSikbEVzXw/IsPRyACCLfFz9?=
 =?us-ascii?Q?CKIhbXdjUPczo3iPUpN6lIatJ03SFhvJch6zgqiXXAj/UtiG3BzHwjRPOPJR?=
 =?us-ascii?Q?XPsqAft/LTF547TF8aP33JuMO9facBnb+At7Fuk7DLlS1TmjwqwFaSssZAIv?=
 =?us-ascii?Q?muVLHvv57m/sY3mybXFVKQ9wgWnplbDjS9/sS/HXGtsSyaU4gFtJWjFSF8LV?=
 =?us-ascii?Q?IAaMCqM+9HIpUGizde+DqCHVrbzAX1BVn7fZV9v7bPA/SJyDHp+Uq781J/dw?=
 =?us-ascii?Q?GQ/S5iFBFWlXJnRY8MGwcWz3H53udFc80yJ/G5kdFTtCxEH8xR6W8EkLi6Kz?=
 =?us-ascii?Q?X+bGK7lejnPrUTzngdodKpkY7aAq1LZN+Dd/UJfq4bXafXbiKVlMzb93p4Aj?=
 =?us-ascii?Q?1O5Dxapk2z7yvlNKQCtpdkYrEcClME5ZjpEg7ttRO6LM5YRr91NbDMA8dS3E?=
 =?us-ascii?Q?AHYmHEIgqUvKz7U3ESPTdb5VCkt4Y8I5nX2pYekpnYtlY1aPEsi7fTwVd5NU?=
 =?us-ascii?Q?rmamL/0KzK/l5TjvnM2ACAHTNbd/RhZ4nZdARY0E0C3WVPIocD/eqHQHrOD9?=
 =?us-ascii?Q?V/nivIFISfd5xxqIjWYHiQa6Ef76NHnQNMIWYhfAhRhWkdJm9WaaH/6VaLNE?=
 =?us-ascii?Q?pa2N+0AYc+ZrERdCIm6rA3R8/3BwgIfZwSAAKEP5clcWm7bOPWlI+UI+KS8C?=
 =?us-ascii?Q?b84lMHLm5xJCvANYezj6heXBJWZG5H0sXZvXlG2Lw4nzx63Pk8RbKagvWIXS?=
 =?us-ascii?Q?+uDJjV/tXcU9gtDJVicBwpUIhCJpw/RYdlXHjXfs0psoCIb8IJSswDYYrTvd?=
 =?us-ascii?Q?WEWbNPqBLqA9T8i6DZCTKHm4dB5/DB1ZMFuROD5laOZTOMVCCEN2abaWpCqR?=
 =?us-ascii?Q?AYRyiWBlhd6ZB37EwbvyUhO/7KTBmrsAco3BOHubkFQ4a7ceYagaS4jF1MZA?=
 =?us-ascii?Q?tML58lhRNpOJ/gi38eODi80/Cs+dPVh6dL3aYHWKnLtMbd/qMCI86F/jQDdq?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c7e1e3-cfb7-4019-459f-08db8eadc446
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:28:37.8287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QAaKkpXm3KhIc0dJwKCceTayRS/m0AH50AUDxGiZpLU40mCelO2VYxlJl8Gy/KjQ9qJEaaBzK7kGuwLkpTrDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7894
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 04/10] drm/xe: Remove vma arg from
 xe_pte_encode()
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 10:30:46AM -0700, Matt Roper wrote:
> On Wed, Jul 26, 2023 at 09:07:02AM -0700, Lucas De Marchi wrote:
> > All the callers pass a NULL vma, so the buffer is always the BO. Remove
> > the argument and the side effects of dealing with it.
> 
> You're right that it's only ever called with a NULL vma, but the vma
> parameter was added for userptr support (null bo, vma only) in
> 
>         commit b01fd49ada0fa88c88aaa86529461c2feae09eed
>         Author:     Matthew Brost <matthew.brost@intel.com>
>         AuthorDate: Mon Apr 4 11:18:22 2022 -0700
>         Commit:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>         CommitDate: Thu Oct 20 14:21:59 2022 +0200
> 
>             drm/xe: Update VM PTE write code to accept a VMA argument
>             
>             This will help to implement userptr within the VMA.
>             
>             Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Did something change with how userptr is handled somewhere along the
> line?  Is userptr working today?
> 

Yes, I think at some point we switched over to using xe_res_cursors to
generate addresses for PTEs when programming the PPGTT rather than
calling xe_pte_encode for each entry as a res cursors is an iterator
which is much more efficient.

This change left only the xe_migrate code to encode PTE entries direct
and the xe_migrate code always operates on BOs.

And finally, yes userptr is working today. Quite a few tests use
userptr, the simplest being xe_exec_basic.once-userptr.

With that, this patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> Matt
> 
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
> >  drivers/gpu/drm/xe/xe_migrate.c       |  8 ++---
> >  drivers/gpu/drm/xe/xe_pt.c            | 47 ++++-----------------------
> >  drivers/gpu/drm/xe/xe_pt.h            |  4 +--
> >  4 files changed, 13 insertions(+), 48 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > index c332dc54cb70..9e9b228fe315 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> > @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> >  	/* First part of the test, are we updating our pagetable bo with a new entry? */
> >  	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
> >  		  0xdeaddeadbeefbeef);
> > -	expected = xe_pte_encode(NULL, pt, 0, XE_CACHE_WB, 0);
> > +	expected = xe_pte_encode(pt, 0, XE_CACHE_WB, 0);
> >  	if (m->eng->vm->flags & XE_VM_FLAG_64K)
> >  		expected |= XE_PTE_PS64;
> >  	if (xe_bo_is_vram(pt))
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index bc7dac4e2086..3c7d5cfd30bc 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -196,8 +196,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >  
> >  	/* Map the entire BO in our level 0 pt */
> >  	for (i = 0, level = 0; i < num_entries; level++) {
> > -		entry = xe_pte_encode(NULL, bo, i * XE_PAGE_SIZE,
> > -				      XE_CACHE_WB, 0);
> > +		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
> >  
> >  		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
> >  
> > @@ -215,8 +214,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >  		for (i = 0; i < batch->size;
> >  		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
> >  		     XE_PAGE_SIZE) {
> > -			entry = xe_pte_encode(NULL, batch, i,
> > -					      XE_CACHE_WB, 0);
> > +			entry = xe_pte_encode(batch, i, XE_CACHE_WB, 0);
> >  
> >  			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
> >  				  entry);
> > @@ -1235,7 +1233,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >  
> >  			BUG_ON(pt_bo->size != SZ_4K);
> >  
> > -			addr = xe_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB, 0);
> > +			addr = xe_pte_encode(pt_bo, 0, XE_CACHE_WB, 0);
> >  			bb->cs[bb->len++] = lower_32_bits(addr);
> >  			bb->cs[bb->len++] = upper_32_bits(addr);
> >  		}
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index d5a237b7c883..ac01bc42e54f 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -78,30 +78,6 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> >  	return pde;
> >  }
> >  
> > -static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
> > -			   size_t page_size, bool *is_vram)
> > -{
> > -	if (xe_vma_is_null(vma)) {
> > -		*is_vram = 0;
> > -		return 0;
> > -	}
> > -
> > -	if (xe_vma_is_userptr(vma)) {
> > -		struct xe_res_cursor cur;
> > -		u64 page;
> > -
> > -		*is_vram = false;
> > -		page = offset >> PAGE_SHIFT;
> > -		offset &= (PAGE_SIZE - 1);
> > -
> > -		xe_res_first_sg(vma->userptr.sg, page << PAGE_SHIFT, page_size,
> > -				&cur);
> > -		return xe_res_dma(&cur) + offset;
> > -	} else {
> > -		return xe_bo_addr(xe_vma_bo(vma), offset, page_size, is_vram);
> > -	}
> > -}
> > -
> >  static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> >  			struct xe_vma *vma, u32 pt_level)
> >  {
> > @@ -140,34 +116,25 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
> >  
> >  /**
> >   * xe_pte_encode() - Encode a page-table entry pointing to memory.
> > - * @vma: The vma representing the memory to point to.
> > - * @bo: If @vma is NULL, representing the memory to point to.
> > - * @offset: The offset into @vma or @bo.
> > + * @bo: The BO representing the memory to point to.
> > + * @offset: The offset into @bo.
> >   * @cache: The cache level indicating
> >   * @pt_level: The page-table level of the page-table into which the entry
> >   * is to be inserted.
> >   *
> >   * Return: An encoded page-table entry. No errors.
> >   */
> > -u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> > -		  u64 offset, enum xe_cache_level cache,
> > +u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> >  		  u32 pt_level)
> >  {
> >  	u64 pte;
> >  	bool is_vram;
> >  
> > -	if (vma)
> > -		pte = vma_addr(vma, offset, XE_PAGE_SIZE, &is_vram);
> > -	else
> > -		pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
> > -
> > -	if (is_vram) {
> > +	pte = xe_bo_addr(bo, offset, XE_PAGE_SIZE, &is_vram);
> > +	if (is_vram)
> >  		pte |= XE_PPGTT_PTE_LM;
> > -		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
> > -			pte |= XE_USM_PPGTT_PTE_AE;
> > -	}
> >  
> > -	return __pte_encode(pte, cache, vma, pt_level);
> > +	return __pte_encode(pte, cache, NULL, pt_level);
> >  }
> >  
> >  static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> > @@ -179,7 +146,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> >  		return 0;
> >  
> >  	if (level == 0) {
> > -		u64 empty = xe_pte_encode(NULL, vm->scratch_bo[id], 0,
> > +		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
> >  					  XE_CACHE_WB, 0);
> >  
> >  		return empty;
> > diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
> > index aaf4b7b851e2..bbb00d6461ff 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.h
> > +++ b/drivers/gpu/drm/xe/xe_pt.h
> > @@ -48,7 +48,7 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
> >  u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
> >  		  const enum xe_cache_level level);
> >  
> > -u64 xe_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
> > -		  u64 offset, enum xe_cache_level cache,
> > +u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
> >  		  u32 pt_level);
> > +
> >  #endif
> > -- 
> > 2.40.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
