Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD52C27C5F
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 14:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D989710E0AE;
	Sat,  8 Jun 2024 14:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qmt9/+I0";
	dkim-atps=neutral
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95FE10E0AE
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 14:21:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-356c4e926a3so2837507f8f.1
 for <intel-xe@lists.freedesktop.org>; Sat, 08 Jun 2024 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717856514; x=1718461314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKU5If9EmsnT+JAyXQn/aWhyAmFTmp2tnpmiCmiQInA=;
 b=Qmt9/+I06QxJI9PNi1MavyBWHNpJe4BHk44RjHQch9AxWS1Dw3MOoz1MBOE/e6kLGL
 wFkHyHdi7r+MzMx6oXjKt47Bi/FjlJ/sFt9JSa5VpDWP+5oNmU7hGYNq4YE1VBLh3X3N
 GUm0V2/qOoz10rlsLfY/DdEY5OYMNFMdqJcC0IWgPyzi9AKKY5vdfdRYO4zLdcMVew/v
 TyOeP7S9dj7w9X8yw7nJ8dhd8+Ndx82QUYQbH9KN+R21OS7+Gb7i3OvwUVTbtox3KJgX
 vvuxCdW4PQBfXbrkGaMviaW64JEm55KsWWMXsAPHZAzOTJ+dxwyQx+WnEyTfjFnvuBfm
 oqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717856514; x=1718461314;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qKU5If9EmsnT+JAyXQn/aWhyAmFTmp2tnpmiCmiQInA=;
 b=ZyKpbpsy51boZeUEeJE84E/s+iGKhH4oTkQ46iX7ZyLMwOp7Qm8DPwb7VdzzUOa0Eq
 7m0wxb9U1+q8We3xmDI9xxAULinvlOSFdj9FZrCi5YQZ4U4wHECpXBUGW8vVxewSaj+c
 Y+F5wq2KnwYH+bJmeJZCZHiy9bQV67xpxENxmnUur62usNURRnMYX64DosbNokqB7vCb
 mbkHEeHSpbZtA+6lyG3iWEsy8CCsI6ROPx7LXxFFHKY8w63RHSawAbdbQZwlePidqFxJ
 goV3gEvbiT6XYvt4LRLb0CEXs4ZfzQEvchJlL9Qcdd3ky/D7okPOljriDR6KQmed2aWI
 31dA==
X-Gm-Message-State: AOJu0YxOoSUgjIQqe1ymh8wA4xx6Z7Bb6hTE8GPB/orn669A+tSRy2B4
 JUHQNEZSOdOlBSxMKMLq1LGH0RpjZTpQe3Dv8vqD6+Cgl+guvOcm/+mqryVkpk0=
X-Google-Smtp-Source: AGHT+IGeiyqUVrlQ4+snsuZt1ABT8QRRgExC/NdvJ5o2TOKTSYqDaSPQcSMi9eb+0ngE7mxIwHfkxw==
X-Received: by 2002:a5d:64c9:0:b0:354:fd51:45fe with SMTP id
 ffacd0b85a97d-35efedc9ec0mr4104546f8f.47.1717856513998; 
 Sat, 08 Jun 2024 07:21:53 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f1d3d7b11sm224626f8f.28.2024.06.08.07.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jun 2024 07:21:53 -0700 (PDT)
Date: Sat, 8 Jun 2024 17:21:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Perform dma_map when moving system buffer
 objects to TT
Message-ID: <0134f66e-2fb2-4938-a513-daa80365ace0@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hello Thomas Hellström,

Commit 75521e8b56e8 ("drm/xe: Perform dma_map when moving system
buffer objects to TT") from May 2, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/xe/xe_bo.c:672 xe_bo_move()
	error: we previously assumed 'ttm' could be null (see line 669)

drivers/gpu/drm/xe/xe_bo.c
    627 static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
    628                       struct ttm_operation_ctx *ctx,
    629                       struct ttm_resource *new_mem,
    630                       struct ttm_place *hop)
    631 {
    632         struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
    633         struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
    634         struct ttm_resource *old_mem = ttm_bo->resource;
    635         u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
    636         struct ttm_tt *ttm = ttm_bo->ttm;
    637         struct xe_migrate *migrate = NULL;
    638         struct dma_fence *fence;
    639         bool move_lacks_source;
    640         bool tt_has_data;
    641         bool needs_clear;
    642         bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
    643                                   ttm && ttm_tt_is_populated(ttm)) ? true : false;
    644         int ret = 0;
    645 
    646         /* Bo creation path, moving to system or TT. */
    647         if ((!old_mem && ttm) && !handle_system_ccs) {
    648                 if (new_mem->mem_type == XE_PL_TT)
    649                         ret = xe_tt_map_sg(ttm);
    650                 if (!ret)
    651                         ttm_bo_move_null(ttm_bo, new_mem);
    652                 goto out;
    653         }
    654 
    655         if (ttm_bo->type == ttm_bo_type_sg) {
    656                 ret = xe_bo_move_notify(bo, ctx);
    657                 if (!ret)
    658                         ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
    659                 return ret;
    660         }
    661 
    662         tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
    663                               (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
    664 
    665         move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
    666                                                 (!mem_type_is_vram(old_mem_type) && !tt_has_data);
    667 
    668         needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
    669                 (!ttm && ttm_bo->type == ttm_bo_type_device);
                         ^^^^
Can ttm be NULL?

    670 
    671         if (new_mem->mem_type == XE_PL_TT) {
--> 672                 ret = xe_tt_map_sg(ttm);
                                           ^^^
The patch adds an unchecked dereference.  I suspect the NULL check can
be removed but I don't know.

    673                 if (ret)
    674                         goto out;
    675         }
    676 
    677         if ((move_lacks_source && !needs_clear)) {
    678                 ttm_bo_move_null(ttm_bo, new_mem);
    679                 goto out;
    680         }
    681 
    682         if (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT && !handle_system_ccs) {
    683                 ttm_bo_move_null(ttm_bo, new_mem);
    684                 goto out;
    685         }
    686 
    687         /*

regards,
dan carpenter
