Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70182C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 19:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E62D10E226;
	Fri, 10 Jul 2026 19:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wl5mKIJW";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB7F10E227
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 19:07:57 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-493f25d47dcso9960385e9.1
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 12:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783710475; x=1784315275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=v2c8ve1eOpm9ZGAfxSFM+Y9p3YLh5Tuis6XJ274g65g=;
 b=Wl5mKIJW+gypC41Qjfq43vp55ugRxhTI/puXySzvb/UBy6Wf0sZECZSiC7IpFaBlon
 dajsrN0KwFoTRqJPqaURB+TTNIK4bN7W1eOGU8+cN/An0tuG0wSf0tNXeR0x3JiEFi2o
 slHVuOs9ii291pEWAYcO5D9+TwntJYRI15kngmOoWgaQGgMyOMx5/GwihIu+i9cEBtx3
 8HXXDDWmB3uqcUNmlCrlLCP0RF6jSCLaXyK9SR3lovO7yRTxifZ79TkL2ZEuujv2C/aG
 /TR+AMSfqiR3yWoA64BoVfdY3OGr+jjE9u4Pqar6WzLysjaFNDdL5JB5viGWzyWAzc8t
 /8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783710475; x=1784315275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=v2c8ve1eOpm9ZGAfxSFM+Y9p3YLh5Tuis6XJ274g65g=;
 b=grEamh4QZXxncxptq0RZPpRpm+LEeA0rsGRXPFXsuwSiCtC/PjESqCRDLMWOAMwgBI
 HLLH8EnG4LWOco9hHePjPAzQm1lENbjxGcdSJoCJ6OSPDD0w1SA6jF1qHBMpAGMJ9R71
 nxqDNUWkeqs5ga0xaLs56LpgwD1s5JRyUSbUHUjqvzP24DWBB8z9STTxFAuhX5jTeIAM
 WICwKreVJIcP2AFz1gdjD+gTXmF2Hngbzilhaud0P3l2gJUtNuNbw/5Mn45Zbtz0hOTr
 1Cmsxwf2U1Re6V8lSil+Iz4dqd1MKYvJ8B2/XTaX07tU2me6YfIua9Tedf/P4TEPE1Uf
 1kqg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rogh+5TN1TVoy1tLJWeSU4mwr/ewMyLTEpkgE8MFzJcexzw2PjSPOmFq3dedJ8aistO0dr/9VNuCQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJqzopq+b/odRpTlE5GMFyxT63VJ2R6CawMuyNAUhGGt06SR9i
 4rbHUxjtu5mQZawRYL9VsKucwwcK4LEvj87q5YObbfbDUKj6R9G+siHQ
X-Gm-Gg: AfdE7clrgSHxuD4K1z2MvmQEakH+ncSukSsIIrnnZpsWa8iKPadUL6v69soiny2Ae+4
 oFFLRggYwxlti3Ne3giajtqjh+G0HfLDKD34xu3sMPaUyMNRscnbbftOzrLJldrU1B5afkdaKv6
 YA4u8JauSyG/S0TtEaJGomYW6NT5wf+qfIND00O1vN/qxI1UfLgIPcHwd//jsCGXehTG3ovUVW6
 3GQ58ZYTuhP6G5QrSiS3eRF8N9eInx3Kr7LmO0wqLGdR56mSyDCwr1wOrN9ufrXZoNqVSvKkrnd
 /rsqbvtY3OqNsGeic7vP6Ad+TG8huH+7GyGYyW6nBtVAyTgaNCJlW6muatxT81MSWBLDcy7nWHR
 x1lSgOoy+7bjCaojgFkOLPFnZ8VU98hNARf6kCoPWfT0qnMeCJscWeDvi0n5VnzvWRbVL9NEWPg
 ePCyRdEhy/yh3IgOzEcEiqTX3Wlw==
X-Received: by 2002:a05:600c:5489:b0:493:e97c:216e with SMTP id
 5b1f17b1804b1-493f8851d4emr810365e9.39.1783710475270; 
 Fri, 10 Jul 2026 12:07:55 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154f:ec00:aa08:de24:db33:4496])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f567eadfsm55000755e9.6.2026.07.10.12.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 12:07:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 simona@ffwll.ch, matthew.brost@intel.com, nat@pixelcluster.dev,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Refcounting dma_resv and using that for drm_exec support in TTM
Date: Fri, 10 Jul 2026 20:52:40 +0200
Message-ID: <20260710190752.2355-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Hi everybody,

The idea of ref-counting dma_resv or ww_mutex came up multiple times from
different people, but so far at least I have abandoned that as to
complicated to implement considering how widely used that object is.

Thanks to AI I gave the task to refcount dma_resv to Claude Sonet 4 just
to check how horrible it would look like.

Well turns out that this is actually a cleanup we should most likely aim
for and I'm really wondering why we haven't done it like this in the
first place.

Not only resolves it a bunch of issues with dma_resv instances shared by
multiple GEM objects (we just recently had a bunch of patches for that on
the mailing list), but also allows TTM to implement it's delayed delete
handling without any zombie resurrection or similar hacks.

The patch set is totally work in progress and only survives a smoke test
with amdgpu, but I still wanted to check if the idea is valuable and
should be looked in further.

Please comment and/or tear apart :)

Cheers,
Christian.

