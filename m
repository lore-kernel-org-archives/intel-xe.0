Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3159CDB483
	for <intel-xe@archiver.kernel.org>; Wed, 18 Oct 2023 08:24:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16F810E3BF;
	Wed, 18 Oct 2023 08:24:34 +0000 (UTC)
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F8D10E3BD
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 08:24:32 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-406aaccb41dso20335155e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Oct 2023 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1697617471; x=1698222271; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YI2n2/kdV9gZtnXpvHYirQtkHxP4ZQY6jpEljQ4a4q4=;
 b=ksP7hT1RQeR+QA4oTo0YdysHp3xfezUdrqEfdcXo2KWwtA5go2z0uhBDqPN2mcBCGN
 SdkLx3cqA8KLNQ7ilO71s5LmFUeRN1Kw8XnI56j7vu2iTIr2s5C0I8hErGEwruxKvxhe
 3IYMJyq3rl7czvt4QfDHT8WOn+bbFUJO0OI54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697617471; x=1698222271;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YI2n2/kdV9gZtnXpvHYirQtkHxP4ZQY6jpEljQ4a4q4=;
 b=AViatqE2HHVoSCZcFH9uR23AXvkUzPuqYCE491qC3ZwOt+8pEbHuRqzSHQlvr+5C1n
 cBUBCYN/eG99TdCFJJ0Fn5i4NtfO38OeYnyYRXYwoAM2IcYSvNKJLbXqngrH4a0vJEfc
 EhLeH9ohgn2HTgZHvyFHt1UKp64ig49gp8nY1mKxV5sfixzqeRJjCapkOn/Ko1pMCYuA
 2HXVKZ8zu9T+zq1QcdGSsJir7cghPqqMPptc7o4fPNcK41WgymOo1r3B7YkqHYta9u4V
 CgCz3hR+s3bGOPd5U7YYrXp6n0VrRdii4cQE7/Xd9Mfw81/knxHGoPTO0I1HoxjNwbGk
 R1tw==
X-Gm-Message-State: AOJu0YwqcrqCs+Uwmd5ApVwSCjj9gAEOOSyXRGHKrXdbyNwZtZRLI/RZ
 jDk5Z76jniRd68KT5roChaWpBgK+Y9RtBxX5CgPTV5DocLAsZxpDtXo=
X-Google-Smtp-Source: AGHT+IHTXvx3gn++LC22QzXLjrbpxz35c0lViOcFQz/ItbvQke/glv9xI+MZ239tskIcePKCWsV7vw==
X-Received: by 2002:a05:6000:1284:b0:32d:c312:49af with SMTP id
 f4-20020a056000128400b0032dc31249afmr3464276wrx.6.1697617471183; 
 Wed, 18 Oct 2023 01:24:31 -0700 (PDT)
Received: from dvetter-linux.ger.corp.intel.com
 (210.red-80-36-22.staticip.rima-tde.net. [80.36.22.210])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a5d4712000000b0031984b370f2sm1544779wrq.47.2023.10.18.01.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 01:24:30 -0700 (PDT)
Date: Wed, 18 Oct 2023 10:24:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZS+WPAxgPlwj/Hug@dvetter-linux.ger.corp.intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017150958.838613-1-matthew.brost@intel.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 6.3.8-200.fc38.x86_64 
Subject: Re: [Intel-xe] [PATCH v6 0/7] DRM scheduler changes for Xe
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
Cc: robdclark@chromium.org, lina@asahilina.net, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, Liviu.Dudau@arm.com, mcanal@igalia.com,
 frank.binns@imgtec.com, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, daniel@ffwll.ch, boris.brezillon@collabora.com,
 airlied@gmail.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 08:09:51AM -0700, Matthew Brost wrote:
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first.
> 
> This a continuation of a RFC [3] with all comments addressed, ready for
> a full review, and hopefully in state which can merged in the near
> future. More details of this series can found in the cover letter of the
> RFC [3].
> 
> These changes have been tested with the Xe driver. Based on drm-tip branch.
> 
> A follow up series will be posted to address some of dakr requets for
> kernel doc changes.

I think it'd be really good to include the doc improved in this series.
drm/sched is one of the least documented parts of drm, and has some of the
trickiest sharp corners. We really should be documenting these as
consensus around how things work and as features get added.

I think it would also be really awesome if someone goes through all the
interfaces and adds docs for what we already have. That's probably for
later, but I think really needed to make sure the docs are somewhat
consistent (things like the api includ scaffolding, or having the code
related pieces all pushed to the .c files as DOC: comments and all these
things otherwise tend to end up a bit more chaotic than needed).

Cheers, Sima

> 
> v2:
>  - Break run job, free job, and process message in own work items
>  - This might break other drivers as run job and free job now can run in
>    parallel, can fix up if needed
> 
> v3:
>  - Include missing patch 'drm/sched: Add drm_sched_submit_* helpers'
>  - Fix issue with setting timestamp to early
>  - Don't dequeue jobs for single entity after calling entity fini
>  - Flush pending jobs on entity fini
>  - Add documentation for entity teardown
>  - Add Matthew Brost to maintainers of DRM scheduler
> 
> v4:
>  - Drop message interface
>  - Drop 'Flush pending jobs on entity fini'
>  - Drop 'Add documentation for entity teardown'
>  - Address all feedback
> 
> v5:
>  - Address Luben's feedback
>  - Drop starting TDR after calling run_job()
>  - Drop adding Matthew Brost to maintainers of DRM scheduler
> 
> v6:
>  - Address Luben's feedback
>  - Include base commit
> 
> Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> [2] https://patchwork.freedesktop.org/series/112188/
> [3] https://patchwork.freedesktop.org/series/116055/
> 
> 
> Matthew Brost (7):
>   drm/sched: Add drm_sched_wqueue_* helpers
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Move schedule policy to scheduler
>   drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>   drm/sched: Split free_job into own work item
>   drm/sched: Add drm_sched_start_timeout_unlocked helper
>   drm/sched: Add a helper to queue TDR immediately
> 
>  .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  15 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  15 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c       |   5 +-
>  drivers/gpu/drm/lima/lima_sched.c             |   5 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c    |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c          |   7 +-
>  drivers/gpu/drm/nouveau/nouveau_sched.c       |   5 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |   5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c      |  85 ++-
>  drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c        | 507 ++++++++++++------
>  drivers/gpu/drm/v3d/v3d_sched.c               |  25 +-
>  include/drm/gpu_scheduler.h                   |  48 +-
>  14 files changed, 498 insertions(+), 234 deletions(-)
> 
> 
> base-commit: 201c8a7bd1f3f415920a2df4b8a8817e973f42fe
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
