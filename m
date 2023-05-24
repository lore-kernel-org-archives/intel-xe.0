Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7251AC77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 14:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4089E10E1BA;
	Wed, 24 May 2023 14:54:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F059310E1BA
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 14:54:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18FD16151F
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 14:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DDAC433D2
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684940043;
 bh=nau1olSGuHQ+Gvd/U9bNog0aS9h1SjNoAy1HaUjqpks=;
 h=From:Date:Subject:To:Cc:From;
 b=XJWdapu0MBt0Xq77u77ouTkAzB3WrCKE549xjWioX6r3Ube5gdGQhXNHYhHfjrMXi
 Rxy3nwMnpVha1LiugSfXs7yXEnPaK38N2dVFMCMBrWYPDpEr8+2W4TxdvCTBH/z+Y1
 PY+rHKiSTdx+jDIQOHKoajFUvIwzJ01dujLx6VaEwOtWz74V7ZtwWUfFH8Rdw54Muj
 MGpfLb51VGBTZ35xnu5PXB0a/DvV8KC8xPX577sVZjmJPmrIcjyRCHNlwhJ2KsTOd6
 gw7PzbpRnMkJNoC1c2bmMb9tEpTsR6udQVID1jYzlQAzx+W5YlCi49XxAD4w1IDbps
 DdTXn8/YmWwwA==
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-bacbc7a2998so271374276.3
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 07:54:03 -0700 (PDT)
X-Gm-Message-State: AC+VfDxKZ7i8np6F464rFqv2DXg19CAHknDb2N4z9+mMlaqmJFggT6BM
 bF48HLObRgnIfEY/UnjsULLUWRTrGOMjxf0XpKc=
X-Google-Smtp-Source: ACHHUZ6WDoPKzfjikuIMU1qoM8A4gOFPk4zgVeKLqREYN+c5MLE0Weq4S9WD2mDscAxfPSp2NlLTynMynP4Xj+vuVZI=
X-Received: by 2002:a81:4a08:0:b0:54f:b433:333a with SMTP id
 x8-20020a814a08000000b0054fb433333amr18973521ywa.1.1684940042468; Wed, 24 May
 2023 07:54:02 -0700 (PDT)
MIME-Version: 1.0
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 24 May 2023 17:53:36 +0300
X-Gmail-Original-Message-ID: <CAFCwf131PfA=QoLWykFqTbfH7Bmgn+aOYSdhdEhhbYZcMjf4qw@mail.gmail.com>
Message-ID: <CAFCwf131PfA=QoLWykFqTbfH7Bmgn+aOYSdhdEhhbYZcMjf4qw@mail.gmail.com>
To: intel-xe@lists.freedesktop.org, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [Intel-xe] Code review for Xe driver - First batch of comments
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
Cc: Daniel Vetter <daniel@ffwll.ch>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,
I finally got to start the code review of the Xe driver and I want to
send the first batch of CR comments, but before I paste them here, I'd
like to do some alignment.

First, I'm reviewing the code in gitlab, and I tagged the HEAD of the
branch I reviewed so when you go over the comments, please do it vs.
that tag. The tag name is xe-rev1-2023-05-02.

Secondly, I'm putting all the comments in a text file (cr.txt) I added
to my review branch (xe-rev1) on gitlab. What I'll do is every
Thursday, I'll copy the new comments I've added and start a new mail
thread here and then we can discuss it here. I'm sending the first
batch today as tomorrow is a holiday here.

Third, when you are doing fixes according to the code review, please
take the above tag as the base. Don't fix it in your latest branch
(drm-xe-next). Before doing rev2 we will probably rebase the commits
on some more updated upstream HEAD, but I don't want to see any new
code (except for a select few commits that got my approval).
Otherwise, I will lose my hands and feet.

That's it for alignment. Here is the first batch of comments, grouped
by filename:

General:
- Multiple checkpatch issues for many files. Please make sure no
warnings/errors appear.

- Multiple BUG_ON (over 200), and I believe 99% of them have no
justification to do it.
  It's not justified to crash the host if you got a bad pointer from
the calling function, or
  if some other parameter is not between the valid values. Just do
drm_* and return -EINVAL.

- Same thing for WARN_ON. I would *strongly* request that you convert
many of them to drm_* and
  just return error because in the data center, WARN_ON is often
defined to behave the same as BUG_ON.

xe_macros.h:
- XE_IOCTL_ERR is defined to call drm_info. This is not allowed as you
enable a user to spam the
  kernel log. Please change that macro to use drm_dbg.

- Also, please remove the FILE+LINE print. The drm_dbg macro will
print the function and that tends
  to be enough. If you want to print FILE+LINE, use ftrace.

xe_drv.h:
- DRIVER_TIMESTAMP never used
- DRIVER_DATE looks a bit old...

xe_module.c:
- Do we still need to keep the enable_guc param ? Isn't the exec list
path broken ?

xe_drm.h:
- Use short format in license, no need to copy entire license text.

- Engine ioctls - why is it called an engine ? You are not creating an
engine, you are creating
                  an LRC which is assigned to some engine class. Isn't
a context a more
                  appropriate name ? (I don't refer to the
engine_class struct which is fine)

- The file is organized in a way all structs appear at the order of
the respective ioctls.
  However, the first struct is out of place
(drm_xe_engine_class_instance). Please move it
  below to the engine part.

- Some structures have full documentation, some lack it (e.g.
drm_xe_query_mem_usage).
  Please complete structure and field documentation. This is critical
in the uapi file.

- In drm_xe_device_query, the size field is used to pass the size to
be copied from user to driver.
  However if it is 0, the driver just returns the required size. This
should be documented in that
  that field as it is a uapi behavior (and in all other places in
xe_drm.h this mechanism appears).

- Line 272: In most places, defines appear after the relevant field,
but in this case the defines
            appear before which can be confusing. Please try to align
all the places in this file
            to one method.

xe_device.c:
- Line 114: Why keep this line ?

xe_query.c:
- Line 68: No need to print error/info on kmalloc failure. You will
see a big kernel log dump.
           And anyway, it is not a parameter check, so using
XE_IOCTL_ERR is misleading.
           Please apply this to everywhere you do kmalloc (and its variants).

- Line 85: Here we return -EFAULT but on Line 156 we return -ENOSPC on
the exact same error.
           Please make sure this is aligned on all ioctls to -EFAULT.

- Line 384: Isn't this redundant ? You already check the correctness
of index to array.

xe_mmio.h:
- xe_mmio_wait32 reg & val arguments are not in the same order as
intel_wait_for_register in i915.
  We are setting ourselves up to fail when copying stuff from i915.
(comment from Jani)

xe_bo.h:
- PPAT_CACHED_PDE is defined as 0. Is this correct or it should be BIT_ULL(0) ?
  If it is 0, the code in gen8_pde_encode is confusing.

xe_vm.c:
- Line 3301: remove extra ;

- xe_vm_lookup() - the locking pattern here looks wrong. Usually it should be:
  1. lock
  2. load/find object
  3. if found -> get (increase refcnt of object)
  4. unlock
  When you do the get after the unlock, you are open to a race where
that object was already
  deleted by another thread and therefore, you are holding a garbage pointer

- xe_vm_destroy_ioctl() - I think this is not protected against
concurrency. Two threads that
will call it to destroy the same vm object might result in a race.
assuming we have thread A & B, both threads can reach up to the call to
xe_vm_close_and_put (line 1935) having a valid vm pointer. Then, let's
say Thread A
executes that function, which will make that vm object invalid. Then
Thread B will try
to execute that function and that will cause a crash.

- Line 1124: I can understand you are exiting D3 state, but WHY are
you doing this here ?

That's it for this week.
Thanks,
Oded
