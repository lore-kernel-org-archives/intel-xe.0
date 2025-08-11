Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61ECCA0EC0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 08:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994C910E39B;
	Mon, 11 Aug 2025 08:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="ZD/Fk5qd";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFC310E39B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 08:41:32 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so37630895e9.2
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1754901691; x=1755506491;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r/wusZtdGAORqKISVNMJ/sCPX6+7dHhITUcsfuA7BDU=;
 b=ZD/Fk5qddmEEJC4EvszOZ92NSpPqT4OWw1/Id3sJ4oZNAgMV8AbI1Htudn1I0E8V5e
 8iNbGZXuKGk7O+XknjgMibw91RumIsf8ASGhzjBJ4qo7S/uBzqazadegur7UJLYr4DBC
 l+8O1FJINfzuJjfHbPe9NMlqHpYs0NVNXdO2KwdWTK2OC6/fTLOub9rgp3HzY9ivuFtm
 Y2ydmccVxVMr2q9Z1HqWzPqenqujIbgcxyQHg+ZjxAZCTfMCtyWdXCeSnA1aCgyTXDIm
 tAcmG0RTg/zMQIW4OZ07HFGS2HqO906lQu9HGs5/jQxb0ID6FZtzDDQoTtLoh36wQpKv
 md8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754901691; x=1755506491;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r/wusZtdGAORqKISVNMJ/sCPX6+7dHhITUcsfuA7BDU=;
 b=MA1s9Fopza2W//fOs6bBYY1FEtzTmwOtQ7qzzR3psIaDBpxeKGhg54wNnN3b9ei9Vk
 6AZDQZNeCH1c4qCCs5fhoMCWnBInUccepoulSPchSvmlQc4mnhUUTkaQd3inuLJ2fWLs
 CWvb9wvyVbTRVQxDp0hcTWvOgX/Ft5CuDC6JXIwQ+5RVaoS8dNy2IiyNBLXHMXsP0UnP
 jg1l500kxonYZIlzfqH00tMfXtJRpSL0NU1UYDbeoIe9i12IPebSWYt09EWGe1zRD2Zx
 /kcMW+ljbx9CUMd7FwZIwMftzAY+5c4fzStGW5EZfWltoBy5j2P4Bp/udJQ0ykNOG1pV
 yP/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYrHzzrBHI0/b/lydxwe0cimLKR82nrKae75h5VjNQaGTpWiNcaum7Gg7vXeXIgoleyUFv16c1bw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywb+FY7pi5VASW2TjF105btpwYYjbE7I24pmfqNM6bD/U+LdwHs
 3rkK/gH0/fBPHnMteFzXsvfNMRr1J9AM6w2KqH4FdEGYeo49e+OOCjZGGplLlkUUQKaZz1wfj5o
 77H48
X-Gm-Gg: ASbGnctm5lzpA2+hWB95c6haSNQzjwnjj1TmG2ExIhXHQIwuR9Pzn4e9U2Jdv8mqV4K
 F7kZ505LHMv4Bvhu+Hib6AIocY9R1NmrXUNPNJ8CsYczWsKutFs83Prn4c4bUU0ik314yDrgNyY
 5qyO8cXvu5BbfEYGB6bR9gEEwIMvxHfI7CCKcNEARVkd329SNQR/eXXE/rp6cWDe+UQWXE6l02F
 G97dyMH+pmUuUvgktkTzgjrHKGCuSYU+YWL+gGpb+9sYycHVhXAqSK2CIhlKVDmsCEh6N/4VYmt
 3eJsJ0D8qz8a2TNriYFiTysELT95+SjxAWUnRJyRlDB16ZO/NQ0df3qzJoW3vJ0EzHR76ZzMwxz
 UI3o+t/GoRPNa8S73HSVx12XRx/azK3iQV/8=
X-Google-Smtp-Source: AGHT+IEXM7loHKzx5ekCRIS3LUQYkSANI/odPOktRhWCSDVdwewXDTSpPeRQEqUrPysUGwtk/1pjFQ==
X-Received: by 2002:a05:600c:a06:b0:459:4441:1c07 with SMTP id
 5b1f17b1804b1-459f4f9b5c6mr83161575e9.20.1754901690849; 
 Mon, 11 Aug 2025 01:41:30 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm39897366f8f.27.2025.08.11.01.41.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:41:30 -0700 (PDT)
Message-ID: <a10d7662-5635-4a73-88b9-0de6e2e28dfb@ursulin.net>
Date: Mon, 11 Aug 2025 09:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/12] AuxCCS handling and render compression modifiers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250725200349.99038-1-tvrtko.ursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250725200349.99038-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 25/07/2025 21:03, Tvrtko Ursulin wrote:
> A series to fix and add xe support for AuxCSS framebuffers via DPT.
> 
> Currently the auxiliary buffer data isn't mapped into the page tables at all so
> cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
> had to disable the support.
> 
> On top of that there are missing flushes, invalidations and similar.
> 
> Tested with KDE Wayland, on Lenovo Carbon X1 ADL-P:
> 
>    [PLANE:32:plane 1A]: type=PRI
>            uapi: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=visible, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
>            hw: [FB:242] AR30 little-endian (0x30335241),0x100000000000008,2880x1800, visible=yes, src=2880.000000x1800.000000+0.000000+0.000000, dst=2880x1800+0+0, rotation=0 (0x00000001)
> 
> Display working fine - no artefacts, no DMAR/PIPE faults.
> 
> All IGTs pass for me locally. But note that for the ones which "blit" using the
> VEBOX engine, so where media compression is the target surface, this fix for IGT
> not setting MOCS is also needed: https://patchwork.freedesktop.org/series/151928/
> 
> I have included the Test-with: tag below although I am not sure that works with
> the xe CI.
> 
> Test-with: 20250722073906.99759-1-tvrtko.ursulin@igalia.com

CI looks good - all RC flavoured tests passed, and I believe all MC 
flavoured ones would too with the IGT fix 
(20250722073906.99759-1-tvrtko.ursulin@igalia.com).

Any interest on the Intel side to review this and let it in for 
improving the ADL support?

Regards,

Tvrtko

> 
> v2:
>   * More patches added to fix kms_flip_tiling.
> 
> v3:
>   * Rebased after some cleanup patches from v2 were merged.
>   * Added people to Cc as suggested by Rodrigo.
>   * Adjusted last patch title. (Rodrigo)
>   * Apply GGTT flushing only to iomapped system memory buffers.
> 
> v4:
>   * Added patch for potentially misplaced Wa_14016712196.
>   * Fixed (hopefully) MAX_JOB_SIZE_DW on Meteorlake.
> 
> v5:
>   * Split out ring emission changes to smaller patches.
>   * Fixed MAX_JOB_SIZE_DW even more.
>   * Don't emit MI_FLUSH_DW_CCS on !BCS. This should fix Meteorlake.
> 
>   v6:
>   * Added AuxCCS invalidation to indirect context workarounds.
>   * Also added the indirect context handling and some other workarounds. They are
>     unrelated but the series depends on it.
>   * Dropped DPT pin alignment reduction since BMG appears not to be liking it for
>     some reason.
> 
> v7:
>   * Rebased on top of recent xe_fb_pin.c refactoring and also the indirect
>     context workarounds series.
> 
> v8:
>   * Rebased for bo->size removal.
>   * Corrected PIPE_CONTROL_FLUSH_L3 to bit 30. (Jose)
> 
> v9:
>   * Fixed fb remapping changes.
>   * Dropped two not required patches from the series.
>   * Fixed criteria for GGTT flushing.
>   * Limit clflush to the compression metadata area.
>   * Rebased for indirect context workarounds landing upstream.
> 
> Tvrtko Ursulin (12):
>    drm/xe/xelpg: Flush CCS when flushing caches
>    drm/xe/xelp: Quiesce memory traffic before invalidating auxccs
>    drm/xe/xelp: Support auxccs invalidation on blitter
>    drm/xe/xelp: Use MI_FLUSH_DW_CCS on auxccs platforms
>    drm/xe/xelp: Wait for AuxCCS invalidation to complete
>    drm/xe: Export xe_emit_aux_table_inv
>    drm/xe/xelp: Add AuxCCS invalidation to the indirect context
>      workarounds
>    drm/xe: Flush GGTT writes after populating DPT
>    drm/xe: Handle DPT in system memory
>    drm/xe/display: Add support for AuxCCS
>    drm/xe: Force flush system memory AuxCCS data before scan out
>    drm/i915/display: Expose AuxCCS frame buffer modifiers for Xe
> 
>   .../drm/i915/display/skl_universal_plane.c    |   6 -
>   drivers/gpu/drm/xe/display/xe_fb_pin.c        | 210 +++++++++++++++---
>   .../gpu/drm/xe/instructions/xe_gpu_commands.h |   1 +
>   .../gpu/drm/xe/instructions/xe_mi_commands.h  |   6 +
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   1 +
>   drivers/gpu/drm/xe/xe_bo_types.h              |  14 +-
>   drivers/gpu/drm/xe/xe_lrc.c                   |  47 ++++
>   drivers/gpu/drm/xe/xe_ring_ops.c              | 161 +++++++-------
>   drivers/gpu/drm/xe/xe_ring_ops.h              |   3 +
>   drivers/gpu/drm/xe/xe_ring_ops_types.h        |   2 +-
>   10 files changed, 334 insertions(+), 117 deletions(-)
> 

