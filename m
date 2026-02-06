Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BB8EE20A3
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 13:40:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688D210E74B;
	Fri,  6 Feb 2026 13:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FhA9Hu+6";
	dkim-atps=neutral
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CB110E746
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 13:40:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4832701b9b7so3090875e9.2
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Feb 2026 05:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770385212; x=1770990012; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GPiWcT/oJWu1HMdei+am/uID5ljtBm8TxUG5R2Ik1AI=;
 b=FhA9Hu+6BwGpWUwbsNeIcNj214CMppFaV1PAH+lZUS9PB7yl8pkMKLyxr+ypr3UJOf
 1CgoG257GHYoxIr9n/CkVPezZ8EXXFzJPYyFWKb3FMSHrxOGzWuoECbtDvgtuxpItGK2
 9LZG646fNNRZNZ+r5/uHImdPGqU52nZVyZsR4qkzVOJ/qo/aa8K3NhhMfxogj1yW+DTT
 5HPocMgYLK0VU7Sg0ILIvM2QWzRZFjY1VAhGa2XoXG31C/H9DyoO2xvs+6Z4G8PHYKYG
 nfKeIeKixJubIUR5Ww5ShhQYy0lNA4hJwxeRH/+M67371/KIUhq2Suhobj+TbvOnTfvU
 hSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770385212; x=1770990012;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPiWcT/oJWu1HMdei+am/uID5ljtBm8TxUG5R2Ik1AI=;
 b=NAIyVcBaxHGU2p2Ngc8LrlxEqoSU9EayNwsWWWL9X125OUy0Nf076qxobTDRcEMKKC
 J5rTQUuA4ckQnZ0n4epuNBTvEqgR+nXQTm3lfP1wwIrY9GffvkNljykYeLpFLioJJPu9
 xFafVrZfT+b3X47bB6aLjJtnt4p/QOijJlHjjM85AFxdasysgCRxivqxmz0FUD3pkztE
 y7y7c34DXRGsBlID5C1xvel9lGjE3APsa0hFPstJxoV5UVhbjmY21I6T7gcUvyq2dncz
 6RobpMt117YOmQ5GTr8DCNCeaGBHIlGi3i4gArOwUSsmw4m9bDxqp5IfzpqqrbdoHsir
 m1Lw==
X-Gm-Message-State: AOJu0Ywh3Sz+1U5yhK3Z5mSHnoxiLSN1qW5cwkDpCTkjXApozXNiOb1a
 LpF3smSpGUTRXwzSg9OJ6eENrRLrLU1gGPBgLouwM9b4AOlftJU+boUeloMsVovzBw0=
X-Gm-Gg: AZuq6aLaqt+8X+nxV/k4W+wORc9mG7C7dmkUmAe7bxhNiYzV8QKNXwmf3u6fqZNAzRL
 bbbVZAbX+80pqK2iPHB2w2xVDpiM+mHEoGpb7NSlNuXQpMM3mLp0EB0EZ9rggBMo8EkXJ1R/Kzd
 A/CyRM1bGvN22Sc8f1PAQhLc2JfdTXVn44rNpBYc5DX+R4pMeJ3gxEikeCYQJZHReIC/0pJyjI0
 RuzuIr2/U5NwFnUllSs4VBd/r+aQFPYi/kAvtG98cw2G+6I8ZeRglTfbkgFXNBZQ14Ea/VbEixt
 wml+yms/g0WL0U5HQToFcVIUaY6f6GrNCFEHS3MNjmeYS55++9FEnTW88wbuwxK3j0Uu9ICy5NR
 hCQi0Jl7N7UcpAv3iYG2l1E7mVfJvo1uj7pHGTrDXjViesTIcHmOCiCcorudfNeUFUQlHg+wiD1
 KXT8bfHZH5Xy782qp6IO88gD/oBzg=
X-Received: by 2002:a05:600c:1f16:b0:47a:814c:eea1 with SMTP id
 5b1f17b1804b1-48320227d98mr41961805e9.35.1770385211873; 
 Fri, 06 Feb 2026 05:40:11 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d345c2sm171490355e9.6.2026.02.06.05.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 05:40:11 -0800 (PST)
Date: Fri, 6 Feb 2026 16:40:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] drm/xe: Avoid toggling schedule state to check LRC
 timestamp in TDR
Message-ID: <aYXvON-q4xpkubRu@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
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

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Matthew Brost,

Commit bb63e7257e63 ("drm/xe: Avoid toggling schedule state to check
LRC timestamp in TDR") from Jan 9, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/xe/xe_lrc.c:2450 xe_lrc_timestamp()
	error: uninitialized symbol 'new_ts'.

drivers/gpu/drm/xe/xe_lrc.c
    2421 u64 xe_lrc_timestamp(struct xe_lrc *lrc)
    2422 {
    2423         u64 lrc_ts, reg_ts, new_ts;
    2424         u32 engine_id;
    2425 
    2426         lrc_ts = xe_lrc_ctx_timestamp(lrc);
    2427         /* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
    2428         if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
    2429                 new_ts = lrc_ts;
    2430                 goto done;
    2431         }
    2432 
    2433         if (lrc_ts == CONTEXT_ACTIVE) {
    2434                 engine_id = xe_lrc_engine_id(lrc);
    2435                 if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
    2436                         new_ts = reg_ts;

Imagine lrc_ts is active but get_ctx_timestamp() returns -1. 

    2437 
    2438                 /* read lrc again to ensure context is still active */
    2439                 lrc_ts = xe_lrc_ctx_timestamp(lrc);
    2440         }
    2441 
    2442         /*
    2443          * If context switched out, just use the lrc_ts. Note that this needs to
    2444          * be a separate if condition.
    2445          */
    2446         if (lrc_ts != CONTEXT_ACTIVE)
    2447                 new_ts = lrc_ts;
    2448 
    2449 done:
--> 2450         return new_ts;

Then new_ts could be uninitialized.

    2451 }

regards,
dan carpenter
