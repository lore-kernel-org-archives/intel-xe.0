Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF033C55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 16:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6590110E109;
	Tue,  4 Aug 2026 16:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="oBbaOA2c";
	dkim-atps=neutral
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0097310E109
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 16:34:32 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-6688a2dceb8so3115376d50.3
 for <intel-xe@lists.freedesktop.org>; Tue, 04 Aug 2026 09:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785861271; cv=none;
 d=google.com; s=arc-20260327;
 b=APe8dPZ3LN66Wi9WWDQ27MqAT2855kRBkXb8OWaORh2nxPQFxn6DjM0MZzliseiLNt
 lKJgO7RZ5dP6UTtMvYyINJevdLIRWEPBbD7B6hj1zN0xDWXoLGb0hvJlWRv7kxowjh8z
 mQnTwEeU8+z+m04LFvWbft0WNNnNiK5cqrBiuMogx023gZ7PPmfoObegLEKKGL4RFtWh
 S2qu1V/9NPH89ICYBLZ2FRlMIdPPCl/lrRyXfiaZdtYuFIRB744U9AxyybVT+SbC98Ei
 VTh8kZofwe3ymJ8Jk9Qz7FDDvHPUJ4L5JcwjgvmcvKJVEBA1OStgpDUpDRq8IqCB87Wx
 DgtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Hd/HrJIAJRgbvjsGqLhSe0FGOQYBV2Xuk+fFwAyumqc=;
 fh=JX3ZOW/Osg/jVlYYxqDKnwaX2xyJsEW3toWMigsA43s=;
 b=OoWUGnGDTFcpDYhQJkBjFxLmVoR1LYzwzT5rbH9SlBlW+rovBFwYnfZp9XDqAOJT0e
 T8QX0hg3K+a7kgItUbm1WZJ6k3NgsI9/Pv/N1R2bB+HuaZM4eEn+n5+n6Ns/xml2S51M
 6VNIOAIRHUzN7gvzFauKChx7Opi+KuUbmWvpUuQ4PsO09aEDuEcpo4PruY8AKhvqZmu8
 s4DYPHXGsBGBvBz1CvtDIrOutgwe2UHjPmA4qgYUQWP9/QrsZtDX9Y2e5oWTIB3SK64r
 pAdXqzE12+469y+vXSLlAkScwgfN0cUoOuiFj+AncpxSh1hVSj2rRTRFRM+COvqXqrTk
 +ZUQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785861271; x=1786466071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Hd/HrJIAJRgbvjsGqLhSe0FGOQYBV2Xuk+fFwAyumqc=;
 b=oBbaOA2cuA1XhrnKUkoHCovKyadIQx9/r1ugxGtfLu2B5SgzBxRLamkDygOgh9fvjZ
 7G7prHI8+lN/RxE+Unp9CXeQwQWo4CD2fVpRuBpxJ/VWf7LOOVmnMJzjQAJT7/wuBUEk
 u54zXT7mS9ssB/q4oLUIGSsJXr0EF2jSxmQ+EYw1hiXzxcTnDhI59BDjxlfH0Y8mOJ0B
 t53f70Z64/3lav+7MTqNuzb5Uv4pgaBaVDAO0v4ItiT4GHCJPvuTTaF5SZjRQN8jPblk
 ZPh/4SXyAIkh/B9vsocy0YbZLoVGY+guGYM1Xg3iAdiZwSLG6/rIMMoTEZ2lUBh9YWox
 89+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785861271; x=1786466071;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hd/HrJIAJRgbvjsGqLhSe0FGOQYBV2Xuk+fFwAyumqc=;
 b=muX30hPHRhzOMdeaO7FRGfT4hFQ0vH9lm8cwng4LcXyeBiDK2so0jj0AipOqjUQt4r
 o4BTfvoACfNxn/1/yORFDOBcq4sHeh0w6nue+nK2BaIX5JfPC4fpg94apFc8WZY2hJDD
 zOe2nBhXMsoJaGmw9NPzQXVUHvJDPodITspMzV2FA+iTu0oH9srjS7jRgct6cM4RZf80
 chWWvOKYjpraSStYCenD+aAB4UL257f0uwVYXM3whJroVWfDgu7TeWRlGo9MuPXMmoui
 sQPB53D1W/bivmOBnXh98npwNAr5Tb7lLZGThRLAdqixrFpUIfbuVnUSmfmkdjwXvmvT
 ghuA==
X-Gm-Message-State: AOJu0YxPBJcjDYFrGcisQ4gzGYOmcPNmWLaMA8dde2jFgXCxJbjZ6Fs4
 jfJjMfSCrHU7cQ0v+hyhcdW29H1NDICWyNRiUlMVDbqcmgkItCwDsVsv3VpvojFdEyZr14bbVo5
 N5vyw53sd7o595itWF5wvHQk6vjkPKfVorY21
X-Gm-Gg: AR+sD13hmBx7Rxy4LDEDp5ps2XoH8bAAfT8ggL8PzeK0qnskFXiGXg3ZPoXn+dGAFSx
 YLQVZchXvehXPrzVinXg/eslCE2VE7nNWKX1pHh8LG8xRkhdHh+X+RG6zDTUFzfK3798ir6ye1H
 b7sgQVKYJxTrOj4BiWhcvSn0nM9X4JB0ph8MZcC2KOt4paRLim8UG76kcoNVdY4PgrUCWTPIwq2
 cJlRpdTsHhFj6SAuRAnmoMquho4QqPLWkvg5NY9y0OtNZosJweXgRFmuAJoYHfKLkZxsm7yKoMb
 qU7G1RMYo6eS3P7BGkkZECLs9rI70awEjyR4n9YzqD9FHbyUS8o3yO7+KDlSghgmUydmDLI0P9v
 THZx97ypvCTDssLB0vXefrS2/SRzzMw==
X-Received: by 2002:a05:690e:21d1:b0:669:7a69:38d0 with SMTP id
 956f58d0204a3-6699a9a62bamr45130d50.3.1785861271186; Tue, 04 Aug 2026
 09:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260804021441.3054424-1-talesam@gmail.com>
In-Reply-To: <20260804021441.3054424-1-talesam@gmail.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Tue, 4 Aug 2026 13:34:19 -0300
X-Gm-Features: AUfX_myMA5DJ-TljhiuGTXuwlJM4IDbgiSgTM3Xo7ebSAXx22lyWaypKnlbNFo4
Message-ID: <CAHBRX4GYEKniGb8jw-h=QYPi=FpbWRKwHHnfw-K5wYiy6AWfJA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] drm/xe: diagnostics and workaround for GuC TLB
 invalidation ack stalls on ARL
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, 
 rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Patchwork reports my address is not on the CI allowlist, so CI was not
triggered for this series:

    Series author address 'talesam@gmail.com' is not on the allowlist,
which prevents CI from being automatically triggered.

  Could one of the project owners click 'retest' on the series (and/or
add me to the allowlist)? Series URL:

    https://patchwork.freedesktop.org/series/171539/

  Thanks!
  Tales


Em seg., 3 de ago. de 2026 =C3=A0s 23:14, Tales A. Mendon=C3=A7a
<talesam@gmail.com> escreveu:
>
> Hi,
>
> This series is a follow-up to the TLB invalidation ack stall I have
> been debugging on ARL, tracked in:
>
>   https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8678
>
> Summary of the issue: with GuC 70.53.0 on ARL (reproduced on 7d51 and
> 7dd1 machines here, plus an independent Arc Pro 130T report on the
> issue above), TLB invalidation acks intermittently stall for ~2.3s.
> The H2G request is consumed from the CTB immediately and the G2H CTB
> is empty the whole time - the firmware simply does not send the ack
> until much later. The fence timeout fires at 2.25s and the ack lands
> tens of ms after it. Userspace blocked on the invalidation (compositor
> buffer unmaps etc.) hitches for the full window.
>
> Patch 1 adds xe_devcoredump_gt() so this kind of hang - which has no
> exec queue or job to blame - leaves a devcoredump with the GuC log and
> CT state behind (Matt suggested capturing devcoredumps when we
> discussed the issue; devcoredumps from both machines are attached to
> the issue above).
>
> Patch 2 logs when the ack for a timed out invalidation finally
> arrives. This is what established that the acks are late rather than
> lost.
>
> Patch 3 is the RFC part: a delayed work that pokes the GuC (status
> register read, CT flush, doorbell ring) every 250ms while an ack is
> overdue. On my machines this converts the guaranteed 2.3s stall into a
> sub-500ms hiccup for the majority of occurrences; a minority of severe
> episodes ignore 8-9 consecutive doorbells, which points at the GuC
> firmware being internally blocked for the whole window. Full data on
> the issue. I am happy to rework the approach (different delay,
> tying it to the G2H handler, dropping the status read, etc.) - mainly
> I would like the firmware side investigated, since no host-side poke
> can fix the severe cases.
>
> Based on drm-tip. Tested for several days on both ARL machines under
> desktop and VM-heavy workloads.
>
> Thanks,
> Tales
>
> Tales A. Mendon=C3=A7a (3):
>   drm/xe: Capture devcoredump on TLB invalidation timeout
>   drm/xe: Log when a timed out TLB invalidation ack finally arrives
>   drm/xe: Kick GuC while TLB invalidation acks are overdue
>
>  drivers/gpu/drm/xe/xe_devcoredump.c     |  68 ++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump.h     |   6 ++
>  drivers/gpu/drm/xe/xe_tlb_inval.c       | 131 +++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  42 ++++++++
>  4 files changed, 243 insertions(+), 4 deletions(-)
>
> --
> 2.55.0
>


--=20
Com os cumprimentos,

Tales A. Mendon=C3=A7a
talesam.org
communitybig.org
