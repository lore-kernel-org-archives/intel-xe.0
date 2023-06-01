Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BA0C77B7E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 13:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F72410E111;
	Thu,  1 Jun 2023 13:45:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A11F10E111
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 13:45:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2149B64546
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 13:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A049C433A4
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 13:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685627111;
 bh=4+aLwgerO+eT+T1qnQqWkVlsLC/Wxze1bPGXJfb7ULg=;
 h=From:Date:Subject:To:From;
 b=KcSKbxAfoh8rRV6cU3Ru2G/9Ym0f6Sg5xfdtpKrkWmHM3F7wxrwMxFIPkD41yyNz1
 IH1D1uY92aLGoR3nCIRPZf2+Jz1+cMwtOKudqK8kZd0iOInHV47Symv+R7y9/IK7nR
 btV8Q4AOBHrU3IW1/15mfp9ISuQ8ghpWea+e9k0m5zkLP1/npc9b1pMJytt1X4Qeyp
 QAKVJrX6MOgI6rhR8pcERyA73iw24B+HhSJGyg+1apbpAX4uZ5k0qxXUloUGGIKSgQ
 U6AHuESO2wZZH0I2rn8lZJwZ7AvX2VOWydo42A9nR2cjtWhmOCnly6RhL0vDT5qsPH
 OWccF7RnqeRjg==
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-bad041bf313so893590276.0
 for <intel-xe@lists.freedesktop.org>; Thu, 01 Jun 2023 06:45:11 -0700 (PDT)
X-Gm-Message-State: AC+VfDxaLC8dckItI4gemfxJ63t1sM1GNJ4yKn2dUW/6JYF5BKeztcFA
 NA+74RMIof54gdWpw0b8g2EBgwRyjyE5UzwdagI=
X-Google-Smtp-Source: ACHHUZ64sKuVVbGvtLSABoX8Zl61IjEeZxQ3nSUXWsLsCIxmfETzQJSM6W/7mzFRjGNkrMKTCr8DMAsptndSUXfkRg0=
X-Received: by 2002:a81:6d52:0:b0:567:6787:5c26 with SMTP id
 i79-20020a816d52000000b0056767875c26mr9065430ywc.19.1685627110372; Thu, 01
 Jun 2023 06:45:10 -0700 (PDT)
MIME-Version: 1.0
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 1 Jun 2023 16:44:44 +0300
X-Gmail-Original-Message-ID: <CAFCwf11ysbb2J8E9=T8F4V9pQgHMUhQzsjmvX43ZFiTCBGXfsw@mail.gmail.com>
Message-ID: <CAFCwf11ysbb2J8E9=T8F4V9pQgHMUhQzsjmvX43ZFiTCBGXfsw@mail.gmail.com>
To: intel-xe@lists.freedesktop.org, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: [Intel-xe] Code review for Xe driver - Second batch of comments
 (1/6)
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

Hi All,
Here is the second batch of comments, grouped by filename:

General: Use of defines in the middle of functions is really making it
hard to read the code. And it is a very uncommon practice. I can
understand definitions of flags inside structure, and even definitions
before functions, but just in the middle of the function makes the
reader lose track of the code. I would like to request to modify only
those parts.

xe_vm_types.h:
- Line 175: Either XE_VM_FLAGS_64K should be XE_VM_FLAG_64K or all
other XE_VM_FLAG_* should be XE_VM_FLAGS_*
    I would also love to have some documentation on what each flag
means. It's not trivial to understand that from the code.

xe_bo.h:
- Line 23: Where is the STOLEN define being used? I only found code
that checks if that flag is set

xe_bo.c:
- __xe_bo_create_locked(): Are you sure the bo will always be
destroyed (kfree) if a failure happens during this function ? AFAICS,
the bo can either be destroyed by a direct call to xe_bo_free(), or
through callback from ttm called
   xe_ttm_bo_destroy(). However, xe_ttm_bo_destroy is assigned only
when calling ttm_bo_init_reserved(). However, you can exit
__xe_bo_create_locked in line 1009 (which is before
ttm_bo_init_reserved). In addition, what
   happens if the call to ttm_bo_init_reserved fails ?

- Line 1096: after returning from __xe_bo_create_locked, if there was
an error and the bo was allocated in xe_bo_create_locked_range(),
don't we need to make sure it is freed ?

xe_vm.c:
- Line 1182: I have no idea what this comment means... Could you
please explain what the migrate vm code is doing there and WHY do we
need it in case the migration flag is not set ?

- number_gts: This local variable appears in 3 different functions in
this file and each time is calculated in a different manner :) Why not
keep this number in the device data structure and set it once during
init ? (Maybe it also happens in other files, idk)

- Line 1888: what is this asid ? Is it related to PASID when using ATS
or is this something else ?

xe_drm.h:
- Line 356: You need to add a comment for the flags, in case there is
some dependency or limitation. e.g. afaics, you can't create two vms,
one with DRM_XE_VM_CREATE_FAULT_MODE and the other without. Either all
vms are in fault mode or not. This should be written here explicitly
in the uapi file.

xe_guc_ads.c:
- No need for guc_ads_regset_size function, use field directly.
- Use define instead of guc_ads_capture_size.
- calculate_golden_lrc_size() - you are calculating golden ring size
for all possible engine types but not taking into account if engines
have several hw instances. Is it ok ?
- Line 452: not all struct fields (which are used later) are initialized.

xe_guc_ct_types.h:
- Line 17: XE_GUC_CT_SELFTEST is always defined, why do we need it?
- mutex lock in xe_guc_ct: same lock used for G2H and H2G actions so
these CTs can't work in parallel. Is there a reason why this can't be
separated into two different locks ? If so, I think it is worth
commenting somewhere in the code.

xe_guc_pc.c
- pc_gucrc_disable(): disabling registers which were never enabled
(lines 748-750).
- Line 896: Add mutex destroy for pc->freq_lock.

xe_guc_ct.c
- Line 45, 50: Please use define for uninitialized fence.
- Line 139: need to add mutex_destroy for ct->lock.
- Line 142: It appears that ct->fence_context is initialized but never
used. If so, please remove
- Although it's explained at the top, please add defines for offsets
in the CT buffer:
  H2G_CTB_DESC_OFFSET, G2H_CTB_DESC_OFFSET, H2G_CTB_BUF_OFFSET and
G2H_CTB_BUF_OFFSET.
- parse_g2h_event(): add default handling to switch.
- parse_g2h_msg(): header variable is unused.
- Lines 927: can't you use CIRC_SPACE instead of doing this manually ?
- xe_guc_ct_fast_path(): problematic use of ct->fast_lock spinlock.
g2h_read() can take some time to execute. Same for dequeue_one_g2h
which also calls to g2h_read(). spinlock protected code should execute
fast. Must we have a spinlock here ?
- xe_guc_tlb_invalidation_done_handler(): it asserts that the ct mutex
is locked, but I didn't see anywhere in the call stack of this
function that the mutex is locked

xe_guc_submit.c
- Line 230: mutex_init(&guc->submission_state.lock); without mutex_destroy.
- Lines 387, 396(!) and 399: please add defines which hold the
calculations and use them in the structure definitions.
- wq_wait_for_space(), Line 526: no handling in case there is no
available space. Actually, it looks like this if statement is
redundant since you check it again two lines after. This code is very
confusing, I recommend refactoring this.
- wq_item_append(): Lines 571 - 572 - Please add define instead of 3.
Leaving it to the user to understand where this +3 came from is not
helpful. Also there is no indication on success/fail, need to add
return code.
- submit_engine(): There is no indication of success/failure, need to
add return code.
- guc_engine_run_job(): maybe it's possible to merge assertions? There
are 7 assertions before emitting the job. Maybe add
engine_operational() which takes care of these assertions?
  Also, if job is not submitted to the engine, I think this function
should return ERR_VALUE to the drm scheduler.

xe_pci.c:
- Line 462: Consider using pcim_enable_device ? I see other drm
drivers (drivers/gpu/drm/tiny/bochs.c for example) using it.

xe_force_wake.c
- Line 44: mutex_init(&fw->lock); without mutex_destroy.

xe_pcode.c:
- Line 278: mutex_init(&gt->pcode.lock); without mutex_destroy.

xe_ttm_vram_mgr.c:
- Line 342: mutex_init(&mgr->lock); without mutex_destroy.

Thanks,
Oded
