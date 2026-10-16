Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FF1CCF2E6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 11:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA76510EC46;
	Mon, 19 Oct 2026 11:42:18 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F3110E354
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:45:51 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5ba3ec92031so313881e87.2
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 11:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176349; cv=none;
 d=google.com; s=arc-20260327;
 b=ETkunaAy248VPjxzbSzwT1gDdY0EI4r3YyaByBvm0M0C9GOaR8k9YwlxD9ySO49QyG
 aanDGK3be8r95ORWVWtIOJ3gItNgcyFyQaBHA+EwmMIvCTLwG2NZiVY77xoK22k3LaGK
 UuinuK6yhh8Af52St6WWT7Q8p/D1OsWK9yO0bu10DGtMP/4Cmfoa7IBFSC9Gws+lmWjO
 vlrXFS0iAHDsGwHZb7N4F5trqu+2yctX3PbN6kV+vxjxOPmJA7lUms8uWx+9eJuVAR2P
 GedVpVE0ni1sSaBOT0mrutPji4W+QDEuB1pB3UHGBS6MMEdYPOkWd61J5JSxO3HUo/GG
 0cxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:dkim-signature;
 bh=k5fWdKR4KH1xJNhfX2EOMzlFvYwX5hK5uF++6d/eYyg=;
 fh=OK5W32kx3H9VO2XMYbN3RU3l+Y/m/BQNik6CJv4eAfg=;
 b=fTrABJRqH/qAAd5PetFhTaW/g7fIiEUPGKHj7hVMKCo6Bd6p7JEgFf3ns7muYoMdqL
 lNgjyiN7C5K3xMKgTzaBNqdiQfYqn2f2rFkpM/SNBGa7a9/H/FkC8NgutdenK2gJ2S/B
 I0ywgwggBy6vuVyxNdLEF6xTXAL/uyECu790NQMxzSmkMBzgdld+Weu9ZT6U+oaSX88i
 rTdOxdiHB6P0VHubXscPOXKltB4bIvLdPocaGq+vD9CYJ0ONbSzqIeCWWsqD5FQ4lwAc
 IBphTb8UlUm3mentUsDXKvYycO/i7zsq5RdEKeO7JkQpq05YxvzLyjc57rNaw7v4trJX
 FOoQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792176349; x=1792781149; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=k5fWdKR4KH1xJNhfX2EOMzlFvYwX5hK5uF++6d/eYyg=;
 b=Qdlg+0poJecree0ibpGXs05txzVcHbPQHLWd2jVoKqCthPZj63Aqu1vX1rRcxH3tjW
 S55ZEPUrc/LIzA4tk7vV/z6T0vI4bPXACsldigGM7yRush5lNUS+i6nfjZMC9k72G/AP
 qAncxIoMre8O/QArOK7AmQf8frEwhf+Ux/vBk/9mX3RCPdd53By/vbEQR8CwZb/IWVb6
 ju3gcCpXrOQqRvseKsEWYUyC8zpLgG5Ia+OiBgFAuVxndsF97FEZ8L5X9zGWvGZxH9L3
 gHVzgtdd17A5Y6Ck4xskK3tWS7MI8p/rr+An5JCVwc6plc/ZRcYpQg1Hk/mokABlKRaK
 gvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792176349; x=1792781149;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=k5fWdKR4KH1xJNhfX2EOMzlFvYwX5hK5uF++6d/eYyg=;
 b=RtORwJOxy9zp/R7G1O5pMyMpAeq77ePDPRy8NCoInzk5V87WR+JoQhgOdbkxLKLI5c
 wwnKkIGNBTmDTQzhAlHPQHLvQImbrjghcTaG8CKPTFmXk+IXnVJRd/orlaJ8o/2pnmzY
 OKbWVm9SooGUYxNkjkc+XsK4JfmnLyCkQHC5AgTJX5xYh27ywlSLmoRK403i2J7W1Cvf
 Yjc3Qva3fCOukU76w0eTOkM8GryNstHRtws3vqdV4KwEzJjrHcV1Fu+wnlrSyHZt4hTP
 hzX5WoZ9NF+LMyccOWtUGFS4J7X7WLRU5OIzWqAz3943hfVi11v++AqifLP5aaRhhAyX
 rJNw==
X-Gm-Message-State: AFq9FYLJfgpywWGqbOHRXKjC9ZycthLM+6Fg4oU+zZgo6KP7PgiNjnlP
 7aRkNH27yXyKYiKwDqyaX0aexgFxzLb/QMmDnx7LS94gDJ5Gdi4HgQqvtXngyTjFpyvfJ/UplSq
 eRe8I0OGHl2x5jUskpgQBIZpibB9zVU8=
X-Gm-Gg: AYBFou0KEQc8Zo6azoBThDazALVmTUcCmhbHirsnmMZx2K35qwutyVaJYKm14z0b8jS
 LnDUXIKjlR8+qdfHqPEpVXB+hFwzngqSbehsm+qhXnUtJzj/UZwrE9FwrpcIpd3N3RsKfiuDBM7
 iZyK3JdmcaOBTW5BeQoNSOJ2K9BRU1EY7KvUIfFeYBLr0ApoeWAxDjLhJVlIMDQmcwjul+hJusR
 ixmfvG6KyZc+PWysIlSUFqPJ//lQFWmSQVEVP5GfUxRNN/LJx8CqmhK86LM4JKerMP/FPjppvjd
 75/9Svr92fnYTGWVJ7Yk39/dAEL14uwb/uE7yksMU3sXjA0CJs9R3RS3b/A1jYfSUQ==
X-Received: by 2002:a05:6512:3186:b0:5ba:3c60:b875 with SMTP id
 2adb3069b0e04-5be50a6a815mr115374e87.43.1792176348595; Fri, 16 Oct 2026
 11:45:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 14:45:47 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 14:45:47 -0400
MIME-Version: 1.0
In-Reply-To: <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
References: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
 <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
From: Jame Jao <jaojame6@gmail.com>
Date: Fri, 16 Oct 2026 14:45:47 -0400
X-Gm-Features: AclHuK-OtA8zd8ZD6yhVY0T3x9G8mkTyhTueDHPQ63C0vT3FG7zdrTKBiWs99JE
Message-ID: <CAN52AYsR-SbHWKjnMP-ssTR6UfGHxqtP620MSH=SSw_=SWYW6w@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support, Xiaomi Book Pro 14 2026
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

The VBT is attached, as you asked. I have not been able to file the bug
yet: gitlab.freedesktop.org needs an account that is manually approved and
I do not have one at the moment, so I cannot open the issue. As soon as the
account is usable I will file it against drm/xe with the attachments and
post the link in this thread.

What the attached dump is:

  Source      /sys/kernel/debug/dri/0/i915_vbt (raw dump, read today)
  Size        7680 bytes
  First bytes "$VBT PANTHERLAKE"
  sha256      1a0a08b81c48977efbf3f4ea0cc547d6bdf44569f95d88662c5593f24a5e2e4d

Status of the report itself, so the issue can be assessed:

  - The warning is present in the boot journal collected today:

      xe 0000:00:02.0: [drm] Port A asks to use VBT vswing/preemph tables
      WARNING: drivers/gpu/drm/i915/display/intel_bios.c:2813 at
      intel_bios_init+0x17fd/0x1f60 [xe]

  - Machine: XIAOMI REDMI Book Pro 14 2026, board TM2426, BIOS
    RMAPT4B0P0909 (2026-05-21), Panther Lake / Arc B370,
    PCI 8086:b081 rev 04.

  - Kernel: 7.2.9-zen1-1.1-zen, Arch linux-zen package. It carries one
    local downstream change that touches only bitland-mifs-wmi
    suspend/resume error handling; graphics and input code are unmodified.
    Please treat it as a downstream kernel. I have not reproduced on
    mainline or drm-tip yet.

  - Boot options in use: xe.enable_psr=0 xe.enable_panel_replay=0
    i8042.dumbkbd=1.

  - I have not collected the DRM debug journal (drm.debug=0xe
    log_buf_len=4M ignore_loglevel) yet. I will collect it together with
    the mainline test and add both to the issue.

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
