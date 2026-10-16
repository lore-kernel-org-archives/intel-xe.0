Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C96CCF2E3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 11:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C01010EC6E;
	Mon, 19 Oct 2026 11:42:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D93710E19A
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:48:51 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5bcb1f1358aso194744e87.1
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 11:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792176529; cv=none;
 d=google.com; s=arc-20260327;
 b=qPlaN8BXIHzQCPa0qzmfws8an3MbvHFyIaezQkFFCaJV72fvlTkMSaAmzUMkfrT0pT
 A6srgR80UTw4W1En4GAeTZ/a/YzN/hSnFglCGwf+tgFEbsCzYSuVdvsZFjdmxRQ8uNXc
 TMJUB56ujAWf6dAhjjp8GWstsSehjFQFp+CGaO8UBa7zmBOaTYEee2H7DbwACoEgal1A
 H4vmpuAIVRry5pimCbKtuXjoayqwt9n+6tCOdPdLPkkvcpTIM46XZsPo/dGxM/qKIRYt
 eD6AX4LC5gIkat7Nmrp2/f4JeTUzXTZRwAhhMcLvKjbiuItnIBJ50Bl4sYfHNH8qGAx8
 8UPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:dkim-signature;
 bh=F4RWuNr5W5PsG0VuigujYRtp419u9Kx7CCWlu/1r5Rg=;
 fh=OK5W32kx3H9VO2XMYbN3RU3l+Y/m/BQNik6CJv4eAfg=;
 b=m5XyAY63NJy5S3qiqYcNK/c6E2l8N57jBmq9xYB5fVUY+S6kS/eyyhWA6odY7CvUen
 aBBP7+9wpNlrzx6FsjB8H6imVUnQ9xMjg/hG68fpc0AsDP8uLJDa3mlOlX1t92uA5o6q
 MrUJdGMWYekWeVpJylYtcKmxBEBAo17z7fre9y1lTOX4nGQCJ6v45+pnvSZ6wPC/AUGf
 xVjsqua2zrhZKeEw8KOCOoWQym8SrPHhwMqer1u06zastgsFScpwQtPg6arhL+uT+uUR
 gbt+eQUSj1J/cfAbSJGPv6m/7RMUJFMU32A7pft0SdMDkV0Xw/PfBH+Ov42/9/J5uV8O
 qijw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792176529; x=1792781329; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=F4RWuNr5W5PsG0VuigujYRtp419u9Kx7CCWlu/1r5Rg=;
 b=mdx4jw/zDg06DTSm9e+x7dP70VTOWwHteozTLR2rt1xqUFwhgT/QQIetXncB9T2DNn
 hxbtBCHHsTG52b5/UU5XeuS1l8uj9brzB08S/uZVQdLbPS0XeAob1r/ejDe5g9bhEtlT
 0nMkR8y0le1+zw8z1OiqlfiIHicb3qoWZkl3fj97TpwSnUJyxStD0rZGcWVg17cg+Ehf
 4NMwzDSdbP3A7lv3yM6Nhy/Xw0/2NqnSe+Sv7dcyAMMXinoqDDtWy4r4JXCE1LeU5/B0
 WP0gkmuLbFCu+l8u/JIXoPXOThCe1X/AAyGDrODy5hiRbZBMoHOYNDHofV4xBBxvr05y
 fq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792176529; x=1792781329;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=F4RWuNr5W5PsG0VuigujYRtp419u9Kx7CCWlu/1r5Rg=;
 b=SoaOkXf4kl7w3edX/9Pl/WqUfi6BaIkxuAdio25WP+TMckJMgMnZmwtIePhaMUxiCs
 ffVIQ/ws15zBt5g2EiP4mZ34h0r+Uq5UNZG70dS4v8u0jXEb839gYNjfAerIy3VKzVe5
 YximLqTt2wYFK2Qkdte3ad5jkioIpT+K5SJExQ5WKycbV0LVPfsrrS7QZPrjAsTZ8QnB
 Me5b6I68lFngcA3CQOGZNLTySUPsf9zXYiICxK2giHtuItOrNEKh65n+GSpahkujxMfZ
 TbEsP9eiN3WRompTMXKBJgsdNsXwdSspp/Bz0NpmGBuyG+MpvxM4TKXP9EafqYB6xJXZ
 Cetw==
X-Gm-Message-State: AFq9FYIFsIanXzkfKXeR32IKngmtpFyuUw3p4e+R+5vbDfc18I8IiQOZ
 15LCvJndi1uo0vyiZPslSjP4PE9JF5T1EyGDE/R+XfVYDEqTt9NFCDYf1yzRqhvUaUOiHVIUGvM
 A6Kc4wC7V6J8EzRneJUUubjdNrtlDKjXBjBAf
X-Gm-Gg: AYBFou35I6ybdKMNQpcDBM0MaphHsUuMbmQN9YDL8GEXM4xDdpsvG7DcRGm4uvpu7KL
 M+kAqIt6ge544Nk8JAJDFLSsXJWN5a5PMaVxBLPUhvGZ/8+jbk8hSTTTWF+eLBYkWZCrNX9Wetw
 NeFZEp7M7HU2oL6jzD/cYjV9zGH1r80D05/uDO3DYoMWS+kNFvFw2VZdH9UegaWD7Tf4v78oAG9
 g+l4EbPcLA6N2iTDaXFgD4zBNsXlcMH17fdo2Huz5uyvUfKSaXBTNor1KWyxQyKQBL9Hn/j3YIC
 /2Gk1pAnngMTRY3/Xvlbjo9JDaNhUWAQvhTZqWFSM5Q5mbFdgZeoiRCIGEnredrQqA==
X-Received: by 2002:ac2:5692:0:b0:5b8:ed66:2f64 with SMTP id
 2adb3069b0e04-5be509ef7e5mr155409e87.3.1792176529086; Fri, 16 Oct 2026
 11:48:49 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 11:48:47 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Fri, 16 Oct 2026 11:48:47 -0700
MIME-Version: 1.0
In-Reply-To: <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
References: <CAN52AYstOLqaX_=_HBLEGKvcEmY+VGwKSbRRRyQbG4ytr6FD_A@mail.gmail.com>
 <abc82e7191da4638c75ab87605fbe24e2667391d@intel.com>
From: Jame Jao <jaojame6@gmail.com>
Date: Fri, 16 Oct 2026 11:48:47 -0700
X-Gm-Features: AclHuK_fBFcxzRDjFwxpgJbPh6ddKnaWA-C-HdLMMpWx9wPgrwaz-Yg2a-k26RI
Message-ID: <CAN52AYtRd+W65SqWysLtwEtX23GJyGx5bKj5sZMGczKqL8bOsA@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support, Xiaomi Book Pro 14 2026 - VBT (corrected, now complete)
To: jani.nikula@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
Content-Type: multipart/mixed; boundary="000000000000643d45065df99d93"
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

--000000000000643d45065df99d93
Content-Type: text/plain; charset="UTF-8"

Hi Jani,

Correction to my previous message: the raw VBT attachment went out truncated.
I checked the copy in my sent folder and it decodes to 7134 bytes, not the
7680 bytes of the real dump. Please ignore that file.

Here it is again, gzip-compressed to keep it small enough to survive the
mail path.

  vbt.bin.gz             1460 bytes
  sha256 (vbt.bin.gz)
f5c8c1da0b30fe05d117a5264dc6ece64d29d404ba509c44a672ec86beee1bb5

After decompression it must be:

  7680 bytes, first bytes "$VBT PANTHERLAKE"
  sha256 (vbt.bin)
1a0a08b81c48977efbf3f4ea0cc547d6bdf44569f95d88662c5593f24a5e2e4d

  $ gunzip vbt.bin.gz
  $ sha256sum vbt.bin

Source of the dump: /sys/kernel/debug/dri/0/i915_vbt, read 2026-10-17 on the
machine below.

  XIAOMI REDMI Book Pro 14 2026, board TM2426,
  BIOS RMAPT4B0P0909 (2026-05-21),
  Panther Lake / Arc B370, PCI 8086:b081 rev 04,
  kernel 7.2.9-zen1-1.1-zen with one local bitland-mifs-wmi suspend/resume
  change only.

Everything else in my previous message stands. I will file the drm/xe issue
with the full journal once I have a usable freedesktop.org account.

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

--000000000000643d45065df99d93
Content-Type: application/gzip; name="vbt.bin.gz"
Content-Disposition: attachment; filename="vbt.bin.gz"
Content-Transfer-Encoding: base64
X-Attachment-Id: c762cfa4b50e8931_0.1

H4sICCBw0moCA3ZidC5iaW4A7VlfTFtVGP/O/dfSteNuRelYh0dYsOCA27J1jDTZbQu4bvxpgZEu
MdKxdo7YDWTMoDGhGh54MblPypYlVhMTg4nhxUcjTwbjSzMT44PGvrksvpjsbX/wu3+8bWmkJYbN
Lf01X8/p+b7zO9/5zmm/c26PToYmaDQ4MnFmYGwoeG6AIpIgwe9uCd/LEYqMjk/1ByeCU6Gh0fA5
aiMvwtfux/cAkoQcskuS3xu5tpBKe8ba6fDs9Ew61d2fuv7WwuwcjYYjNHjpUiqdmr+4kErS8cnX
glTlc9hCN2bSSTpy4+p0ar6PeiVJQmvqPd7Vc5xS38luqafbJ3lPoKbP6+87ccph6x8Ijw5HI0PB
icjoCB0do/2R8eD4+MBwaOgCjY6NnomEIhMD/Q5biffh2bl352fevLJAPeF26sNxOjVezWUanp2f
66LBdJqOqTbX6Vjqemr+nVSyy2FTiTbAyhEAYoN6GYhHY3wUAhGsWOFQZBSKIqIwUD2YbwmD/Y9Z
QXAVt+OYLBZ5JKZmI4XHapHZxmHRiw0cvMyWg++vgCjC1mFRa3bovBuQIJSoDazWrNnKcCeh2h52
67aiPrUNnLduCwVbavCeNGwPAPCabaacVzRsxw1bJ4Cg2Srltlrs0HbWsMU4EM1WLvehSuyVrYaH
74HuoVYQFQAvELnM8BG7Wdb2EW+DT1A+Q/kK5RuU71B+QPkJ5TeUP1D+QnmAwgu4/1AOobSi1CVx
UEaN2Z69byFsP4L5XdraetZrdiecxX3NWgPLbq3xPLZ/2rAGglsAeZ/VAoHyZV78pxLYYS88Md3h
N9icxQY5y32y4vx/1kxfxUrfoMLq1FDDXoCrwqawC9UU6mkBhu0pUawZKHTpuMxnmDzJHNivZTDr
vB33fpyxa+V9ImLJ17+CBD/XZRSaPyJaEy16z2b/EtGThp2ycaYyQ7aegjfupp5Mg8nA6LnSrv5k
VWZIHgI5CG2Sa8WvM7j8S6yeeNEEOJUhsCOD1AGrMZBkac5p+sDrsbUv8k1VMSzSWJMoi0UMROF3
wfBl92I+1tQmx1eLGQQ9DsJ6FQxnTsvS9LpPljcKDIJ+grJP8sBWjuTllyfXYtAsDSoNhUgqVu0A
oAjVzOL9LiWbaGqWJeo3feCUOs2HjKWaWXgCmezceisydBTWQtGStD3LL1cxi1vt2VxsuUWK3mw0
GVjYZ0SyGgapQ95MLCclV4wrYrDrO4qrJpJle1JjcBh7klbBcK8JslHaKNmlcIFB2W9EsperzMD0
ZVxv93bK8c5iH+p1H/BQXnkt2mVIZMCZEMUDRQxa2rMPDUanohevpdIjF6+mnoMPT+LXuvw88KqX
CGc3QYiv7d371jYwDHOQKYLqlCpLRrlbEQxhi+q7Ees2VIrisRX4cxDLCB7dz0MUknCMfAx3WdCn
92ALQC8PbsN/OZCpPae3AaBLIrBi4tmoGvN5WmVPXSGox/24ZxQR9J/Wsoif1qLeaPTOWQpHnvql
l0434PIP7nS9CIDVN9M26CfQOnPNh1fUKU8AfGouI/qttjZybeS9HPk+0V8rzt3X/m1MQUPvHf0s
8Vzh1IecwNaudDXUUMPTQt/njBtex6NdhlHwkpSAPDkCxvMI9e8CkG8DUFb9oyQDcbQlxjMYVXf3
kZo9ZOICPGaxbXgi1u7v2r8a+S8wJfCrRII5tJGwH2v2U3WLPCUi6po4sUSn/Krq8iQOq6hrK9Hl
FhmQBYmR8dM65yvRPRwmMMmvkUFQ0Jdm00/Vl19yBBQhCxJQ5Gw2/dTGu8BAxqLr1rlWnLnN1HFZ
Alk+R6JwE5bZFuS0lMxBFjbBBTHUJc1nUzvFRdUddahxyWKCxhHZRvV6beoa+lVfXDj3TujlOkv6
3foA18SawNsoZnfBCcZTJ0230/o9D7oaKuBv+r1qUAAeAAA=
--000000000000643d45065df99d93--
