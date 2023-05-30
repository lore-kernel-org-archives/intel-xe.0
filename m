Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15148C77B73
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 07:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A2F10E34E;
	Tue, 30 May 2023 07:05:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0900610E34E
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 07:05:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDEA561CE8
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 07:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530CDC433EF
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685430309;
 bh=L9/cPexMNK/t9/RkDOs9DfamZBhll7X8exbGUgHNd38=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rQGrFxi3IFAVHtAfSsxPkhtl+f6dwfoIOTC54l8EPgMiBX42D5ry/zlOdMyktS8HH
 +VHJ0mIxxD2Bcay6t1z9FrEFPzPN5H1IxUZSwl+nTuC3ZXaksugxv0cMpYaU86zfjJ
 hl5ajAvVAYlDUFghikF8L3war6+RiaO9bx1Z2xddixM4TLXMPjocxi72Y8TYqxaz7x
 GTWxoRugWR+bUY7JIXO/BwOcsccnX06KWePzAcHAWJfQrLeTFDQHKhYZ+c4PfLnTQB
 XhKG6bayBu3LAAUezc8XcwoUmoQkh2RwihA1DOfap3V6O+dE0Xi7mQeW7GE/Lla1Fg
 VMx28mIr2wM/Q==
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-565bd368e19so46481457b3.1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 00:05:09 -0700 (PDT)
X-Gm-Message-State: AC+VfDwz0kVDNlNknLype0nsJ6UN4W6MUWQpF6Wo9pYhDNWWlIQSnM70
 GVJquSKNuodxi8f1H51HZ1PXENXPZecsWOYpyXI=
X-Google-Smtp-Source: ACHHUZ60D7r/HCemHARjwVQmsnho1e53XFBmbonlGyUBJeuwKdaLeEpi9oRna4vYi2RmCQ5ns2phoWCO+qTpD2BHwvU=
X-Received: by 2002:a81:a186:0:b0:55a:5021:5de7 with SMTP id
 y128-20020a81a186000000b0055a50215de7mr1276056ywg.1.1685430308276; Tue, 30
 May 2023 00:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf131PfA=QoLWykFqTbfH7Bmgn+aOYSdhdEhhbYZcMjf4qw@mail.gmail.com>
 <cuaudqi76ujyo6reb6tfpotuxo5bwxp5u2afd4f4d7qfpjbnda@kqtqdcn2jsxq>
In-Reply-To: <cuaudqi76ujyo6reb6tfpotuxo5bwxp5u2afd4f4d7qfpjbnda@kqtqdcn2jsxq>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 30 May 2023 10:04:41 +0300
X-Gmail-Original-Message-ID: <CAFCwf124UMR3VQ=Tr6mT_eTRQi9ssqZqEH4jys1bGggHJjboLw@mail.gmail.com>
Message-ID: <CAFCwf124UMR3VQ=Tr6mT_eTRQi9ssqZqEH4jys1bGggHJjboLw@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] Code review for Xe driver - First batch of comments
 (24/5)
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
Cc: intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 8:49=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Wed, May 24, 2023 at 05:53:36PM +0300, Oded Gabbay wrote:
> >Hi,
> >I finally got to start the code review of the Xe driver and I want to
> >send the first batch of CR comments, but before I paste them here, I'd
> >like to do some alignment.
> >
> >First, I'm reviewing the code in gitlab, and I tagged the HEAD of the
> >branch I reviewed so when you go over the comments, please do it vs.
> >that tag. The tag name is xe-rev1-2023-05-02.
> >
> >Secondly, I'm putting all the comments in a text file (cr.txt) I added
> >to my review branch (xe-rev1) on gitlab. What I'll do is every
> >Thursday, I'll copy the new comments I've added and start a new mail
> >thread here and then we can discuss it here. I'm sending the first
> >batch today as tomorrow is a holiday here.
> >
> >Third, when you are doing fixes according to the code review, please
> >take the above tag as the base. Don't fix it in your latest branch
> >(drm-xe-next). Before doing rev2 we will probably rebase the commits
> >on some more updated upstream HEAD, but I don't want to see any new
> >code (except for a select few commits that got my approval).
> >Otherwise, I will lose my hands and feet.
>
> not sure about the process here... there are things that already changed
> in drm-xe-next, it got even a new base. The current process for fixing
> things in an old commits is to merge a patch done by
> `git commit --fixup` which is appropriately squashed on next cleanup
> rebase
>
> $ git range-diff $(git log -n1 --merges --format=3D%H xe-rev1-2023-05-02)=
..xe-rev1-2023-05-02 \
>                  $(git log -n1 --merges --format=3D%H xe/drm-xe-next)..xe=
/drm-xe-next
>
> this shows things that changed on the "xe commit range" due to the
> rebase and additional cleanups that happened.
Because this is a very large driver, we decided it is better to just
go over the driver and give comments
instead of requesting that the driver should be separated into patches
and sent as a patch-set, which
is what happens in 99% of the cases when upstreaming a driver.

The advantage of doing a patch-set is that in the next iteration I
would have received in every commit
a detailed list of what changed vs. the previous version. Because we
don't do a patch-set here, I want
to try to imitate that by requesting you won't add any code that is
unrelated to the comments I have
sent. i.e. I'm assuming all the changes are in direct response to my
comments and therefore, for code
I haven't commented on it, I won't need to review it again.

Because otherwise, that means in every iteration I will need to go
over the entire codebase again...
I'm not ready to do that.

Having said that, if you feel strongly about specific, contained,
changes that are unrelated to my comments,
we can add them as well to the rev2 but I will need to understand
exactly what code they changed.
>
>
> >
> >That's it for alignment. Here is the first batch of comments, grouped
> >by filename:
> >
> >General:
> >- Multiple checkpatch issues for many files. Please make sure no
> >warnings/errors appear.
>
> some are really impossible to deal with. Yes, there are some that slip,
> but they should be analyzed on a case by case.
No problem, but currently I run it randomly on some files and saw trivial
stuff. We need to clear that out first and then go case by case.
>
> >
> >- Multiple BUG_ON (over 200), and I believe 99% of them have no
> >justification to do it.
> >  It's not justified to crash the host if you got a bad pointer from
> >the calling function, or
> >  if some other parameter is not between the valid values. Just do
> >drm_* and return -EINVAL.
> >
> >- Same thing for WARN_ON. I would *strongly* request that you convert
> >many of them to drm_* and
> >  just return error because in the data center, WARN_ON is often
> >defined to behave the same as BUG_ON.
> >
> >xe_macros.h:
> >- XE_IOCTL_ERR is defined to call drm_info. This is not allowed as you
> >enable a user to spam the
> >  kernel log. Please change that macro to use drm_dbg.
> >
> >- Also, please remove the FILE+LINE print. The drm_dbg macro will
> >print the function and that tends
> >  to be enough. If you want to print FILE+LINE, use ftrace.
> >
> >xe_drv.h:
> >- DRIVER_TIMESTAMP never used
> >- DRIVER_DATE looks a bit old...
>
> probably carryover from i915? Historically they were updated by
> maintainers. Should probably be removed altogether.
>
> >
> >xe_module.c:
> >- Do we still need to keep the enable_guc param ? Isn't the exec list
> >path broken ?
>
> in the last (of multiple) discussions about this, the outcome was to
> remove the fallback to execlist when GuC is not found. However it was
> decided not to remove it completely as it helps to layer the driver
> appropriately for future backend
>
> maybe time to revisit that and simply remove the enable_guc together
> with the execlist code.
>
>
> >xe_drm.h:
> >- Use short format in license, no need to copy entire license text.
> >
> >- Engine ioctls - why is it called an engine ? You are not creating an
> >engine, you are creating
> >                  an LRC which is assigned to some engine class. Isn't
> >a context a more
> >                  appropriate name ? (I don't refer to the
> >engine_class struct which is fine)
>
> This comes from the vulkan world. You are creating an engine containing
> an LRC object and you can schedule it on an *hw* engine. From the API
> point of view for vulkan this all makes sense. From an Intel GPU pov,
> particularly looking at the bspec, it's very confusing.
>
> I raised this some time ago at
> https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/206#note_16=
32304
I agree with your comments.
As this driver is going to be used for the HPC/AI platform, I think we
should not
be automatically aligned to Vulkan, especially in the case where the terms =
are
confusing and/or not aligned to HPC/AI worlds.

I think most Intel devs I talked with find the engine name confusing and
I would like to request we should replace it before upstreaming.

Thanks,
Oded
>
> (...)
>
> >xe_mmio.h:
> >- xe_mmio_wait32 reg & val arguments are not in the same order as
> >intel_wait_for_register in i915.
> >  We are setting ourselves up to fail when copying stuff from i915.
> >(comment from Jani)
>
> there were big refactors in this area already, not only related to the
> order of the fields, but it covers that too
>
> Lucas De Marchi
>
> >
> >xe_bo.h:
> >- PPAT_CACHED_PDE is defined as 0. Is this correct or it should be BIT_U=
LL(0) ?
> >  If it is 0, the code in gen8_pde_encode is confusing.
> >
> >xe_vm.c:
> >- Line 3301: remove extra ;
> >
> >- xe_vm_lookup() - the locking pattern here looks wrong. Usually it shou=
ld be:
> >  1. lock
> >  2. load/find object
> >  3. if found -> get (increase refcnt of object)
> >  4. unlock
> >  When you do the get after the unlock, you are open to a race where
> >that object was already
> >  deleted by another thread and therefore, you are holding a garbage poi=
nter
> >
> >- xe_vm_destroy_ioctl() - I think this is not protected against
> >concurrency. Two threads that
> >will call it to destroy the same vm object might result in a race.
> >assuming we have thread A & B, both threads can reach up to the call to
> >xe_vm_close_and_put (line 1935) having a valid vm pointer. Then, let's
> >say Thread A
> >executes that function, which will make that vm object invalid. Then
> >Thread B will try
> >to execute that function and that will cause a crash.
> >
> >- Line 1124: I can understand you are exiting D3 state, but WHY are
> >you doing this here ?
> >
> >That's it for this week.
> >Thanks,
> >Oded
