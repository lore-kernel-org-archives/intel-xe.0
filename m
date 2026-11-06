Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B4606A31B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 04:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PNO9/+S+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858DE10E009;
	Fri,  6 Nov 2026 04:17:05 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A90C89A5D
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 04:16:58 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-93e503815adso19225585a.1
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Nov 2026 20:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793938617; cv=none;
 d=google.com; s=arc-20260327;
 b=AD90YUM14vV0NkK6NolyZMyVMZ4rklVWpmySRNMPzVeIKEoQovOs21USbx0xtgObN2
 A2Jl21M8YoPC+B5HxN/xaYlo9qqcy5zpNgYAKuj4Dbv/y1eRp2Q7O7kQI1SmmRydm83v
 jqvIr58XJJgjLcamxG4mH4di2q/eFWTb4wX5Cr3NcELSj1IkSNzKGTwWWo6NgKItte8R
 AWNFwr3gHmVe52fKkyTMrO8PXJL/3qdMz+4duf2ZmgsKg3RQhj7ulBdkSLmeGYZtJLsr
 qkS0cCDcr2qndsQTvDAiqXMOFgoncY6oEx/FIX4r27f9t4D/4Rv/pOxlbiq/4Te4A14I
 i69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YAf7ONLuccQ4q1QaxEgb694d9s8wkHRNm7XCVYSS7qc=;
 fh=zGX0Igv/an6jGn1NNHpiVq/s1IMKFT00BzJv9icSbpo=;
 b=oNNqJRz1saO/0jb5Vb/oy+kXAZUXkIVPjG4Xn6Tt2tYPDV57GVUDmpmDkFDndqJ1KR
 2Lg4WWtUdt44FGQY1/cWJqfJJvoUibJOvu3PxMeOX7YfSMzG4oFAl24Vp72EvYRITME0
 rt9CBa9VQRoH0HfuWCrTED69H/IQMtdz4fDf82PA0LqyTdA3QHU6atnfrrknYq5beU4J
 xJHrCVgj3lk7shBFb2i/auEbOHYIB3cB0XoPUyr0gScQ+y3RYyqxiZeRcCjNV6AgEhSW
 U81DfCLxMHBWmJgfm3P0WwMXptkH/SyMk/zxg2PuXvbDSpMT8JHY5M7yludZ/yQBHJFV
 Pl3Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793938617; x=1794543417; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YAf7ONLuccQ4q1QaxEgb694d9s8wkHRNm7XCVYSS7qc=;
 b=PNO9/+S+W5J8vjWjh/QYG7cDT1y4gzLc2hYUEtX3dml1r+p34MqzG1mLT14+UOUDH6
 RI/cyg+KUp4jMWSxOOlsPU9hap+o4YQX/wtsx1XeDljQ/W5ZNNNRpBx7EtP0T/d81IE2
 eU35PDzycPdGu3YG4VOwBhTguC+iPr/jfXQXo2Y207Co49Zhsne9cQVUt1lsQ52dS9w9
 k/mpmjFnoaEzkUkSxSIfFjs++ChQnO5yl3mwITGFk7XsFMwW/J1HyxOyFIe23u2+zPbu
 bSoEPKyswwpOSFWHVoymXkWXr65mEBfKqv7DjqyZkCB4ADBZGOeLM0h/ahs4gx3IK0fQ
 XqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793938617; x=1794543417;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YAf7ONLuccQ4q1QaxEgb694d9s8wkHRNm7XCVYSS7qc=;
 b=KXEXlcMh/EyJ1tnIsi1NfCDkUAh9tKudo8Dn3Lc4+CnB6hrRYg6AyENiwoAtDHSCKp
 bAZ3FLjyYvy6/vI1a5aYD5iDKsMxHCs8qBqYNZAn6egsfLiKe4ZhaTHPTjceXZeUSoIS
 JZXT+2YWdRNLjTt8qtobqrHb0X3aBu/QTa8UQ5x39lYN/dSYpqZV/ip5sCUBKZOPcl9l
 Y8Ha/A3ZKh60knLP3Zog4xn3uEcibS6C+H3cJ+vnhLD/P5n+oQtGh89Eyv6OkK4dxplm
 cV8Rz0iS39iHI7as1hd6GOu2SNSdSYa9d14qcsMGj3CenXTlezySNYaz9kgGLYvIeulw
 g/1w==
X-Forwarded-Encrypted: i=1;
 AKwUvByV28O0Dz+8bSNcTzOwoVPyRDm/E52O6O6IAUPWSpXGuKJEA4Vm9jwDAY++5Qv/m27zBIxAccCHLA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+Q4QysltDaAW3hMlAnhcVpg5bZET2X6+fQ3KIOoduR94H745j1
 m+mMCO3Dsq/mgmOo740tuYcInhIFRfwnuloFY7W/awMNRMlr/aI990HSAF1pR/0dzaFy809v0in
 KjLBXAb0mmSM8lWYXVKTG9fKA/taLe9I=
X-Gm-Gg: AYBFou1Ah1nEO5gyb/wGBizqTZKbjklFNwQhCI19gC4Yg4royzgroBfOjKoTuA+1cQq
 vCttv+QPbAB+cIFt4zbLR6G6y4PFBrZ1/xHFFr280OgZe6VuHBxrayXnOb+lOMyocMzMRJZVFbn
 vu8lIhkMQ6wov6nAGsqoowGJnnYOyDAQfR3PjQkXRPGCBKTFnk9YxmKHmyhKXEB5zBRMbiDtjH8
 +jU+yMrFlCXwNOVxtWovqqLIrw7Zjo/zLKukzqTQkDCUzD3xtJt/W+EFdVDgYQLq9LrrIkXajIY
 x1LP83jwuUEj0sxZzsa3JG74d+1KQMZzs+vJY5Skzt42AE8LmLE/Mt81XCU5KUsreK43/hOoAhV
 MCDd50AdqK739aWmw2NbwWVrf3nrAHg9SOUyUTU+YNQuMRZQfFi7lzpp6PgGL5a0cSNX/xJiKvO
 MFjCucReZOyVorfLvyFBbInqgSBQgSvb8TUcmRViC4mRg=
X-Received: by 2002:a05:620a:29c2:b0:945:f099:8776 with SMTP id
 af79cd13be357-945f335489dmr188413185a.4.1793938617395; Thu, 05 Nov 2026
 20:16:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <5e79d3c0-5b2c-4e6c-ba38-3b723daf7109@intel.com>
 <atDXDlI-EhrA791a@intel.com> <d4d5302f-9768-4122-bbab-4384ef7aa9fe@intel.com>
 <atD66da36wMZ0gie@intel.com> <3dc05c1e-fe02-475b-a525-7c53081e816a@intel.com>
In-Reply-To: <3dc05c1e-fe02-475b-a525-7c53081e816a@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Nov 2026 14:16:45 +1000
X-Gm-Features: AclHuK_qVk_mk86S6JfIT1gnFSXBmrgpYGJ58tw6bXoxtZb1T0y3DgnX0AzFe1M
Message-ID: <CAPM=9tzc6QxVvz+QBYGGtkp=2Mo7W27Mm0togp_LfKspgtoL3w@mail.gmail.com>
Subject: Re: Nasty console and xe driver interactions
To: Dave Hansen <dave.hansen@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zack Rusin <zack.rusin@broadcom.com>,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 at 10:16, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 10/15/26 09:10, Rodrigo Vivi wrote:
> >> BTW, "xe.force_probe=!*" on the command-line also gets the output back
> >> to normal.
> > the force probe proves that we can still probe safely, but apparently
> > on my first attempt I missed the fact that pcim_enable_device will
> > touch the device and register a pci_disable_device that might
> > clear stuff and mess with the VGA fb...
> >
> > Perhaps if we move just one step over:
> >
> > https://github.com/rodrigovivi/linux/
> > commit/616cd8c1b4d4414cd1f7ad56fa5d8abd36d7968d
>
> So I gave this exact commit a go. It still seems to have the same basic
> problems. I put the missing "ptl_guc_70.bin" file in place, but it just
> moved over to needing the "huc" and went back to the no console
> behavior. I added the "huc" and the "gsc", which seems to make the
> driver happier, but the screen has garbage. Looks like I may be missing
> one of those MEI drivers.
>
> But, still, the driver seems to be rather aggressive about killing the
> console even before it is working itself:
>
> > [    0.672748] xe 0000:00:02.0: vgaarb: deactivate vga console
> > [    0.673227] xe 0000:00:02.0: [drm] Running in SR-IOV PF mode
> > [    0.676750] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/ptl_guc_70.bin version 70.72.1
> > [    0.914206] xe 0000:00:02.0: [drm] Tile0: GT0: ccs1 fused off
> > [    0.914213] xe 0000:00:02.0: [drm] Tile0: GT0: ccs2 fused off
> > [    0.914214] xe 0000:00:02.0: [drm] Tile0: GT0: ccs3 fused off
> > [    0.935645] xe 0000:00:02.0: [drm] Tile0: GT1: Using GuC firmware from xe/ptl_guc_70.bin version 70.72.1
> > [    0.937939] xe 0000:00:02.0: [drm] Tile0: GT1: Using HuC firmware from xe/ptl_huc.bin version 10.3.3
> > [    0.938382] xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware from xe/ptl_gsc_1.bin version 105.0.2.1397
> > [    0.938855] xe 0000:00:02.0: [drm] Tile0: GT1: can't init GSC proxy due to missing mei component
> > [    0.959120] xe 0000:00:02.0: [drm] Tile0: GT1: vcs1 fused off
> > [    0.959139] xe 0000:00:02.0: [drm] Tile0: GT1: vcs2 fused off
> > [    0.959150] xe 0000:00:02.0: [drm] Tile0: GT1: vcs3 fused off
> > [    0.959159] xe 0000:00:02.0: [drm] Tile0: GT1: vcs4 fused off
> > [    0.959168] xe 0000:00:02.0: [drm] Tile0: GT1: vcs5 fused off
> > [    0.959177] xe 0000:00:02.0: [drm] Tile0: GT1: vcs6 fused off
> > [    0.959186] xe 0000:00:02.0: [drm] Tile0: GT1: vcs7 fused off
> > [    0.959195] xe 0000:00:02.0: [drm] Tile0: GT1: vecs1 fused off
> > [    0.959205] xe 0000:00:02.0: [drm] Tile0: GT1: vecs2 fused off
> > [    0.959214] xe 0000:00:02.0: [drm] Tile0: GT1: vecs3 fused off
> > [    1.024100] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on minor 0
>
> BTW, I am building the "xe" driver in. It's causing all kinds of fun
> problems, like needing to manually add xe firmware to my initrd.
>
> Maybe the:
>
>         config DRM_XE_DISPLAY
>                 bool "Enable display support"
>                 depends on DRM_XE && DRM_XE=m && HAS_IOPORT
>
> DRM_XE=m dependency is biting me. Is it stealing the console before it
> knows it can actually display something?

It's chicken and egg, you can't init the GPU properly until you steal
the console, you can't unsteal the console once you fail to init the
GPU properly.

Restoring text or efifb is quite difficult depending on how far into
init you get before you have to. You unfortunately don't have a kick
off efifb now option.

Though we could probably do better, it's hard to validate.

Dave.
