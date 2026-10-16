Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FBBCCF2E3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 11:42:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD12F10EC6F;
	Mon, 19 Oct 2026 11:42:46 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C6010E39B
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 19:05:00 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3a5a26c8412so1613701fa.3
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 12:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792177499; cv=none;
 d=google.com; s=arc-20260327;
 b=OCcmFSuMvZnlMiKWCJCQfej7dISVbGsoTvOEsumJwUSyHyacyg0eUIP0GkMEMCoWc9
 byG7eq4cXIW+otHqO8WPRnd6IruS47g0Yvap8JZPFc5/kCx/tutIYXkUrmPehuaij1Ba
 xMVoiRUdCYUcSvWIV6+LqfgGtXnmZpa1JdAKNeE6Uf8U4JtzzEsRB53FhQYqyvfRiIuO
 ykleBL5NDp7evypLCBFHCYs17Y6NYkaq9hmt1KVzs4pBA7MBoa+lAFPut4Lzfo+A/mz8
 pxMx2feEOmXVz/DtGtIPTkOTfdOMiLQUHBjt0vRPkQ0YK9VWuIKGT+kqzsgzgOb+pPbr
 WZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:dkim-signature;
 bh=hCVnPtqFe9PPLGclN/Sfiz1pW+NWRfIeY6a06sFRlb0=;
 fh=OK5W32kx3H9VO2XMYbN3RU3l+Y/m/BQNik6CJv4eAfg=;
 b=htQCT/txqumOUu+mVaJWabU1fbuLypeGs5NVQjYGuoGNJj90LB9M9BVMjFSCcItFae
 uCM/BhHgiW33kP+cqQ1Vu/I1KKKqk1rsAGhVFpkaZeAweBB4j8pggMtj+5Ha059PY349
 OO1d23x+x1bQIWE7j0t8G/t7/BY5CL0mww0oKgL/HgLEy7OpITICIBfAK4FhAlAiykbz
 p2Wq4OT4y4Kvq2Yw1IkvsiPv7UoWjBznPjF3pUKh9LSG0bO0j1cnU43Q660xbUVBwexh
 nMmObehcksEdskEpPtxG2twyx+cTRqg4EpSdsQrbPWeeE7gjVz0eZuJGAYk4qkWXgP6B
 cn2Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792177499; x=1792782299; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=hCVnPtqFe9PPLGclN/Sfiz1pW+NWRfIeY6a06sFRlb0=;
 b=hoQ4t8bQflssOd7Rr+pcVtFtjgdlheXlPB2W88bqvx2Nf64/JsSDYCUFHj22zFNZIG
 XG7zr5fmmXSdc0Ii3qqDjlJUJg34fsiafBIAdbEUZXqeaAAHXBAEc9S3nc2E+Ai+6APZ
 nQQyCW2YgP8zuQ0IiiEa/u0DYyBdNRe5STjzMdM3dXGrpL7v//zFDZGBMiE8gOWSszJX
 H+aueac/0M8GCdPLcdTAop3buIffJsRrushoFQbMq9Mqp1/KbsrGucRB4uwZ1utrl6zi
 nt6H11z0gvV7gmi5RXRu5wMMCgVRngmv5Ker1KZxbCRUIxTrYbwJs8A/XtTaOXybTS6x
 LLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792177499; x=1792782299;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=hCVnPtqFe9PPLGclN/Sfiz1pW+NWRfIeY6a06sFRlb0=;
 b=gRLHLjM6U5rDGCXS8bwypKziuvnlhpi6/Uc3sYYCv4Gr9TSyQAA4OKtwLeYlJ5Ofm1
 jUPZmqb6sMkQ4AIt+WXuvnyDLoNf44xbyHCHxhkzeBtbJ4E8fsH0kpwiPhRwTRPxBYVS
 gTLaQ9UVyWrp8mFzOqkYCPitA5AhKaWMRC1OZ7TtAx3j3uQ5kY76pZUnQHTqzCoRyyWj
 9bYnU8GCTk29g2O7jdQ/tIYh7flOTC4VWGgDTJaCbfo2H6cMBOJAemk+CRjkBqQ4EOG1
 NQDjERNT5E3TF97023c25yX9mry85Mw4lO8+4dLd+FOFPxH0hV61Gaba4AkxDsFIDes5
 PUfA==
X-Gm-Message-State: AFq9FYIjtul6FweRCrPS6294nnjBjc4NQIGlMU8sWJjw0jE+5R+BmjUp
 nShe5qwYDNDNhszzYxqXO//6tFSpIN20QlLOs+zcL5ZN3JVl6gDDeswWksa5QEo+UPFXTg1KnQZ
 /L2xGOQOnAV5vdxZx7LsRIRjPLONtTMOPq02asIw=
X-Gm-Gg: AYBFou2QQYbz4vfHgpcypju9jcSZYAhFbrtRp9zYWdFbA4NbRgIeMw8586pS/DtYpm9
 DdJHS7ibbfNUDnSq4mF4ojheQxHwZtBOU1GP4VKkvzynKP6t3qQ5gF91Tpl77lhKx8zZXKwM5rR
 lwCpPa9s5v69zIPjkyCy7mGO7FbT5q3LiD07HaHyVwZwsmnVbP6xSRsZQSdQVVpoa2xgSuBoDYF
 BdeQ61pNc1kqM2CzUCrkLRibA7qyVaNHeXdJKgA9bw9V3nI0AGR5rm5Qo9bXnxoMEB9WEfDvqAz
 e7cVIBZcc6m6TVm76B93tZGSwmYp4zpUC/5v57wzsgvJTFqBRy4IrcuToCHgdtWNHA==
X-Received: by 2002:a05:6512:33c7:b0:5ba:cdbb:41af with SMTP id
 2adb3069b0e04-5be5099764cmr189189e87.0.1792177498937; Fri, 16 Oct 2026
 12:04:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 22:04:57 +0300
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 22:04:57 +0300
MIME-Version: 1.0
In-Reply-To: <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
References: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
 <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
From: Jame Jao <jaojame6@gmail.com>
Date: Fri, 16 Oct 2026 22:04:57 +0300
X-Gm-Features: AclHuK9Q9k_W0_l4F3dNiy0XIQ0Kg9TzCTZ1PdBZ584Iuo1XtWhcgL1kK4uJmt4
Message-ID: <CAN52AYvQvbPAjpsq9GJDP0QNKKM=H02AVjp9r9TcKSxfnz5VSw@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support, Xiaomi Book Pro 14 2026 - filed as drm/xe #9602
To: jani.nikula@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:42:17 +0000
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

Hi Jani,

The bug is filed:

  https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9602

Attachments on the issue:

  vbt.bin.gz            1460 bytes, 7680 bytes after gunzip, first bytes
                        "$VBT PANTHERLAKE", read from
                        /sys/kernel/debug/dri/0/i915_vbt on 2026-10-17,
                        sha256 (vbt.bin) 1a0a08b81c48977efbf3f4ea0cc547d6
                        bdf44569f95d88662c5593f24a5e2e4d
  kernel-boot-log.txt.gz  full kernel journal of that boot, from boot to
                        the moment it was captured, with storage UUIDs, MAC
                        addresses and serial numbers removed and nothing else
                        edited

Worth knowing when you triage it: the kernel in that log is a downstream
Arch linux-zen build carrying one local change that touches only
bitland-mifs-wmi suspend/resume error handling. Graphics and input code are
unmodified, but it is not an upstream kernel, and the journal was collected
without drm.debug=0xe log_buf_len=4M ignore_loglevel. I have not reproduced
this on mainline or drm-tip yet. I will add a mainline/drm-tip run with the
requested debug options to the issue and reply here once it exists.

One limitation on my side: the account is new, so I could not apply labels
to the issue ("BUG", "platform: PTL"). If you want them set, they need to
come from someone with the right permissions on drm/xe/kernel.

Thanks,
Eason


On Wed, 07 Oct 2026 15:19:13 +0300, Jani Nikula
<jani.nikula@linux.intel.com> wrote:
> On Wed, 07 Oct 2026, Jame Jao <jaojame6@gmail.com> wrote:
> > I would like to report a WARNING that appears on every boot on a Panther
> > Lake laptop, and that is also visible on screen (before the desktop comes
> > up) when resuming from hibernation.
>
> Please file a bug as described at [1]. Please include the VBT.
>
> Thanks,
> Jani.
>
> [1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html
>
> --
> Jani Nikula, Intel
