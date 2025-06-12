Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2501C7115F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 13:59:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2389610E9C5;
	Fri, 13 Jun 2025 13:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4tbrhifN";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1F110E0A6
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 18:54:12 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-235e389599fso38775ad.0
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749754451; x=1750359251;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/ujh3/5vqQQHx/k29tdx2BhG8SWtHTOJrjeipzmEsQ=;
 b=4tbrhifNDSym2RlzkygP8RnL5uhh35a5101i4JZROCfd5kdbMVShrO7nWKp18YQPKf
 6s17AHk6ZAC09twY2qjvpad637Pm5I7dgvt18j1+9Snhz3jCE59uvy5PfmA+ILJdbL4V
 eguUjLH7FZequ9Nmq/QoqbHbIl0xsnk56HYOmleP3hMGygugLuv1tPtwzMQ4nrSOH9fu
 G9bS9d64UL6UNZ9jE42RMa/4OQa6Cj/cWXOjk/XHI0Zc9MEAvKGwHGLKwCi5o5BGkhhD
 hsWluMQrmyrDSe8e5gj0X1AjmP7vfnZOiHQzDo+6Ei/j0FeQ+izBmjUhHqNzgCbU8vZ5
 AZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749754451; x=1750359251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q/ujh3/5vqQQHx/k29tdx2BhG8SWtHTOJrjeipzmEsQ=;
 b=RmfEk88pZc3MXJdFDzrmyWN+6lWHVeMXUtRL7oOqkM+PZwi0Za1xPAGnPebSsbDgkJ
 8Jd6RsGgVXM17420fMR4Rp7HyozKcG0//rsVpgsbQaPy0vPhWe5b0lCJuouMxTeWlsZ7
 WvGIpbFPXXZJ9bHomDbh3jd7sU5tTEjFZ+83enqdS3y1TU7fVBCePmw1xJYmxRGWD+Zx
 jS6YSJUcq/nfoToJFf7lkwNDwFIFmbY3bTNDWY4URmh3dOkxO9UDDgIAJCJbBKwOE+rT
 Sg083GssoCSaI8AqBYQNk6UmiF4/w/zbAiC+vYjjbDuf9EFlGHf4oL6LCY+UOYVsLnfb
 KLEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP/E87ebqSw0Q+ICy04NEUG6+F4UFVkPL9BJ3vryKRBk7uboEJSuY+Ft9ktZj5g7rFASQt+07gHQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeRWpzzFXO37N6L05gGOKPNyMeQOt8m+wdiXPqTQcxeY2XRcwN
 Z+PPZZHZVwRfSiso9kctXwPdVCr//ijvSepXB5WmmfR6/bjfD2M4rqbM1x2tiEW58ZJOxxKbEN4
 Om3u9u+u7goqIaaM55yfsbFv/A2b7RRL7COgodko=
X-Gm-Gg: ASbGncu4nMbenITBVTwVAjvDwo9x6cSpNxogRdjJSUu/WBk+qcYsC/DYfzGzFIQl2w0
 d6Nx/+YbrA2erozPUPDUZN6oPgPfiu9uFwjRIQSY86D/3HqqqGtXtNiCV3dkYIAdvGWZqngU6LI
 cViNoA56r0VDucC8UicPE2RwK9D3lTixanch0tsrh8pytqufs+D67wn5ug6mbFv9Q0VgI2pqGDp
 RwebY8BB6Z8wQ==
X-Google-Smtp-Source: AGHT+IFLMwOTtUYsAx6xAij+1Syo8iAX108mf5Ye5v+C5MuLx8msp2e28vZFe59t+Yq/+NR+QxacAWLZ9CtRVdtiGHs=
X-Received: by 2002:a17:902:f68e:b0:235:e8da:8e1 with SMTP id
 d9443c01a7336-2365e958b9bmr91225ad.18.1749754450607; Thu, 12 Jun 2025
 11:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
 <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
 <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
In-Reply-To: <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Thu, 12 Jun 2025 11:53:58 -0700
X-Gm-Features: AX0GCFv7aYTTGhbOvIbhtXDVsf05e4kPRfikE7NBXIYQpZHKE4ONyE8LXGXfYDY
Message-ID: <CAKT=dDkjYQUSwtYwFTvWppn-2sTdwYu_FE2jfhGXd6vWkQHvgg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Juston Li <justonli@chromium.org>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 13 Jun 2025 13:59:01 +0000
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

On Thu, Jun 12, 2025 at 11:02=E2=80=AFAM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Thu, Jun 12, 2025 at 05:46:52PM +0100, Tvrtko Ursulin wrote:
> >
> >On 12/06/2025 06:40, Lucas De Marchi wrote:
> >>On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
> >>>Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
> >>>memory usage.
> >>>
> >>>These are required by VSR on Android 12+ for reporting GPU driver memo=
ry
> >>>allocations.
> >>>
> >>>v3:
> >>>- Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
> >>>  per-driver Kconfig (Lucas)
> >>>
> >>>v2:
> >>>- Use u64 as preferred by checkpatch (Tvrtko)
> >>>- Fix errors in comments/Kconfig description (Tvrtko)
> >>>- drop redundant "CONFIG" in Kconfig
> >>>
> >>>Signed-off-by: Juston Li <justonli@chromium.org>
> >>>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>---
> >>>drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
> >>>drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
> >>>2 files changed, 63 insertions(+)
> >>>
> >>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> >>>index 4e39188a021ab..89a3d23e3b800 100644
> >>>--- a/drivers/gpu/drm/xe/xe_bo.c
> >>>+++ b/drivers/gpu/drm/xe/xe_bo.c
> >>>@@ -19,6 +19,8 @@
> >>>
> >>>#include <kunit/static_stub.h>
> >>>
> >>>+#include <trace/events/gpu_mem.h>
> >>>+
> >>>#include "xe_device.h"
> >>>#include "xe_dma_buf.h"
> >>>#include "xe_drm_client.h"
> >>>@@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct
> >>>xe_device *xe, struct ttm_tt *tt)
> >>>        xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, =
0);
> >>>}
> >>>
> >>>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> >>>+static void update_global_total_pages(struct ttm_device *ttm_dev,
> >>>long num_pages)
> >>>+{
> >>>+    struct xe_device *xe =3D ttm_to_xe_device(ttm_dev);
> >>>+    u64 global_total_pages =3D
> >>>+        atomic64_add_return(num_pages, &xe->global_total_pages);
> >>>+
> >>>+    trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
> >>>+}
> >>>+
> >>>+static void update_process_mem(struct drm_file *file, ssize_t size)
> >>>+{
> >>>+    struct xe_file *xef =3D to_xe_file(file);
> >>>+    u64 process_mem =3D atomic64_add_return(size, &xef->process_mem);
> >>>+
> >>>+    rcu_read_lock(); /* Locks file->pid! */
> >>>+    trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)),
> >>>process_mem);
> >>
> >>Isn't the first arg supposed to be the gpu id? Doesn't this become
> >>invalid when I have e.g. LNL + BMG and the trace is enabled?
> >
> >Good point.
> >
> >u32 gpu_id does not seem possible to map to anything useful.
>
> maybe minor_id? although I'm not sure if the intention is to share this
> outside drm as seems the case.

Yes, that was for render minor in the case of drm.

>
> >
> >Shall we replace it with a string obtained from dev_name(struct device
> >*) ? As only Android parses them I think we can get still away with
> >changing the tracepoints ABI.
>
> works for me too. Is Android actually parsing it or just ignoring?
> Because afaics it's always 0 in msm.

Android has used it as part of the bpf map key:
https://cs.android.com/android/platform/superproject/main/+/main:frameworks=
/native/services/gpuservice/bpfprogs/gpuMem.c

>
> Lucas De Marchi
