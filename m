Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609FBC77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 14:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0473E10E338;
	Mon, 22 May 2023 14:07:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C654110E338
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 14:07:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F357612D1;
 Mon, 22 May 2023 14:07:57 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.54.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 09235C433D2;
 Mon, 22 May 2023 14:07:54 +0000 (UTC)
Date: Mon, 22 May 2023 10:07:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZGt3NGdHGrZx4Xt2@rdvivi-mobl4>
References: <20230522110133.25968-1-matthew.auld@intel.com>
 <90a44499-610f-1efc-9154-855bd22aed73@linux.intel.com>
 <bd8edff9-9892-d118-f1c8-2e88ca27c375@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd8edff9-9892-d118-f1c8-2e88ca27c375@intel.com>
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix kernel-doc issues
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 12:39:31PM +0100, Matthew Auld wrote:
> On 22/05/2023 12:07, Das, Nirmoy wrote:
> > 
> > On 5/22/2023 1:01 PM, Matthew Auld wrote:
> > > drivers/gpu/drm/xe/xe_guc_submit_types.h:47: warning: cannot understand
> > > function prototype: 'struct guc_submit_parallel_scratch '
> > > 
> > > drivers/gpu/drm/xe/xe_devcoredump_types.h:38: warning: Function
> > > parameter or member 'ct' not described in 'xe_devcoredump_snapshot'
> > > 
> > > CI doesn't appear to be running BAT anymore, assuming this is caused by
> > > the CI.Hooks now failing due to above warnings.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> 
> Thanks. Looks like CI is now reporting BAT results again with this.

It looks like there's an actual hang that happened there, but not
caused by this patch nor devcoredump. [1]

Thanks for fixing this.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

[1] - https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-118106v1/bat-adlp-7/igt@xe_intel_bb@full-batch.html

> 
> > > ---
> > >   drivers/gpu/drm/xe/xe_devcoredump_types.h | 2 +-
> > >   drivers/gpu/drm/xe/xe_guc_submit_types.h  | 2 +-
> > >   2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > index 350b905d1797..c0d711eb6ab3 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > @@ -27,7 +27,7 @@ struct xe_devcoredump_snapshot {
> > >       ktime_t boot_time;
> > >       /* GuC snapshots */
> > > -    /** @ct_snapshot: GuC CT snapshot */
> > > +    /** @ct: GuC CT snapshot */
> > >       struct xe_guc_ct_snapshot *ct;
> > >       /** @ge: Guc Engine snapshot */
> > >       struct xe_guc_submit_engine_snapshot *ge;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > > b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > > index 88e855dae056..6765b2c6eab1 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > > @@ -41,7 +41,7 @@ struct sync_semaphore {
> > >   };
> > >   /**
> > > - * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
> > > + * struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
> > >    */
> > >   struct guc_submit_parallel_scratch {
> > >       /** @wq_desc: Guc scheduler workqueue descriptor */
