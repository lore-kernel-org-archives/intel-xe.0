Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EEEF483C1
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516B110E58A;
	Mon, 23 Mar 2026 16:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I0mA7yLA";
	dkim-atps=neutral
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C9210E75A
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 08:47:13 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-415b23dd6e5so2243720fac.3
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 01:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773823633; cv=none;
 d=google.com; s=arc-20240605;
 b=TiQaT3t27ljMa5Y9KXmsEwYof32ajVrIE2FC7RZz5xlbLlk829zOX2MYMq2084LAC5
 XP9SlhDZGgA3tXW6N3ebV6PbGoCZvmYMHzuLe08tdyP3NH6shABdhYbQE+tupPCy9bCP
 dOIfEP8XILLp1N3ZEvQ+Pzcu84W+QME6AXLNwmNXjH/9dXaXTh1aa9KIKojTSWYdj/gY
 GjlUkbuj+GDm3401Tyn+5cdIBNpS8/cl+DBjSR4kUWfyWOYaliwjImNWViSRaUW0hxyM
 0dXMCTqsUY2CmdxXlaUgIIbTwCGfbRD6jsa0jVmC1tvOk0LtREwGxw1sJxxZLKGS5RI0
 Rimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
 fh=43B4gojF6c9r9Kg+QfD5KJOdROBQv0wgud1oIyWB+YQ=;
 b=DwlfQn/zFHTcLOt2zdtKdX7A8k1R4OpATqY7qkx5JF1AliCsNn8W6P9jmTn7QukcFC
 DTq9qjqZmEO/hgRAIAniBHPEsbjJhn7tJySgjvpSgxs0xIu7PtJQu3wPvQfMybEFnIyd
 kFwbRdlXhkjxjHP3PP5f69OrQJyhmF9O+3oDRP+KtPXddyL/IudAwurKgyF7XmDcBsJW
 jij3BFfwy/WvEd4sa9StaRr23gKMTutDN+lPu7NAzCOQf1D2JGVVJZAwAXDEhCmtqr0s
 gSsMGLhnAxobpzHRwy96P1Pqj8ODx/wFfutxbh/cUASh6j37K7QUbYzviXGJQvULykKB
 gsHA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773823633; x=1774428433; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
 b=I0mA7yLA3KBwkAvsqMFVbMDHUQ7b4fRlSN/82xbjecPUG3WzdO5X4+cUC3wYEG1hx2
 jopygxH8EnOVP7LM7Z6ZAtaW+XH3DGLqhmxjBRPaoIidYSk+d1zXoyJl7QR+knY7f0ry
 +2Y2lEp2j+6jXuteWvznJb5h+p3QAslzsOkXitGnA1bZy/iZ2k2XnmB1E5FCldY6oiBh
 pvjkd7FBncX0qhsEihH1ukYzzy1/WC8rlTIb8s6kvQKFb00yf5qKhf12Y+ENtti4WFZs
 jMFevygx2yAaPa5VcDMid9zu4CukEUUI9t14S0Of19uAe+utS15jkeMQq+xmDxqPeYLm
 g5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773823633; x=1774428433;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=83jPdky0qKJSRYzsoaPc+e5EHJzCiyWfR0yebjpaYT4=;
 b=gOm7Inq8MbekeYaH5q5JZ874vzE5ymjVcxtFY0Kf/oecIXFpwnIPbhzhnskOcvtORG
 Cb1wpaorNPia28WhPkbA1P4Y6B+bmMN7b4r0VontGyPsYbPxsi34+uFeTKgZ9a2f+w4f
 3JOp3rBMSGOTwclCHUozA/J5A2xxHLErkyoMz+Pby+DJdYbLj0by9M6fHWsCzPT1jB8V
 IOS9GPMIMNGF1013wCeD4y0B1iHYQZcQqpPcgHITyW4n2HTSWT+ustmFe5RPhsuzgAKy
 w0lHYO6Ba127981Xx8fYTLDscO6V9ocrV1Dac+X5VLPX/G+N5dhdRm+KR4f5Bkgp0wgt
 1ADg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAemIANg6qcFd4DmU/Fcx0cDQIJD6eOVPYvq93nUk/uzGHzqA+Qo9JzNL4PeRlsmfOXJy0hx1iug==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybTyBUZbBxo4GN6nMw4XsWrTm6Nj6x4g+OoWMNvop+qgRQRSCr
 24z7zGtAUbymcTqTCwalvYfQzK5sIXuatx4PvLqg9d7MRD3Q1e+sO9ejIv015MXOIhacW7W6rw2
 D8JuC5m2sQLiVHAqUXBJgACdtOPwvJFc=
X-Gm-Gg: ATEYQzwdrQlOYK9k5lOc8XWF+MEvfTiHG5Qw1rMJVuyJpS+ISIolmeX0sR1bp7lRwvI
 7KeLgwLZfdEOXOXnH2febvgOPG/PkyAlmF7YEs9Mp0MpsZaeVDnGInNSkTc2i1F7cyGE1OZtuzk
 0BON5D70Qn4Uhe8M7RfkqzCESzKjBnLrJwV8F4nrT4Y0L4ny+z1i86mh4qpw630HsA7W/1SEbUc
 EWn/PUtu3lXLqJp5g8MviMDG98VPs6OCdv+rDyN1R/Wy4UpqBxRHO2dnvBEPCCUxDd9weN0L5BZ
 iWXOb13YRCa/D2eFFMCz7qjQHSH7qSJ7g9iM9+Nec9ygPPzFldsI7V78G9zJpbFEGX7ZSf7EUCc
 =
X-Received: by 2002:a05:6871:286:b0:417:64ba:82cc with SMTP id
 586e51a60fabf-41bd421a82cmr1862712fac.43.1773823632659; Wed, 18 Mar 2026
 01:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260317185920.43387-1-hanguidong02@gmail.com>
 <20260317191538.43535-1-hanguidong02@gmail.com>
 <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
 <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com>
 <8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com>
In-Reply-To: <8ac4b6ef2dfbc1dce0047dee55f2df609287a3ec@intel.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 16:47:00 +0800
X-Gm-Features: AaiRm51Yf9dm9cacIuRM_2DJNr3deiXg0cux6KcppyZN1nJwEpt6FR9vmcrqdC8
Message-ID: <CALbr=LboxkVoFrRmZoq7LN=LTL+-ZgoUiTi6utSDEw7M_qX8bA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/i915/display: initialize string params to empty
 strings
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, rafael@kernel.org, 
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, 
 airlied@gmail.com, simona@ffwll.ch, gustavo.sousa@intel.com, 
 demarchi@kernel.org, jouni.hogander@intel.com, luciano.coelho@intel.com, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
 akaieurus@gmail.com, me@ziyao.cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:04:08 +0000
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

On Wed, Mar 18, 2026 at 4:32=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> > On Wed, Mar 18, 2026 at 4:12=E2=80=AFAM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> >>
> >> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> >> > Passing NULL to debugfs_create_str() causes a NULL pointer dereferen=
ce
> >> > upon reading, and is no longer permitted. Change the default values =
of
> >> > dmc_firmware_path and vbt_firmware to empty strings ("").
> >> >
> >> > Existing code that consumes these parameters already verifies both
> >> > pointer validity and string length, so empty strings are handled
> >> > correctly. Furthermore, heap allocation is not required here: these
> >> > debugfs parameters are created with strictly read-only permissions
> >> > (0400). As a result, the debugfs write operation is never invoked,
> >> > meaning the static empty string will not be erroneously freed by
> >> > kfree().
> >> >
> >> > Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to di=
splay params")
> >> > Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module par=
ameter under display")
> >> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/d=
rivers/gpu/drm/i915/display/intel_display_params.h
> >> > index b95ecf728daa..0a8cad98d480 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > @@ -23,8 +23,8 @@ struct drm_printer;
> >> >   *       debugfs file
> >> >   */
> >> >  #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
> >> > -     param(char *, dmc_firmware_path, NULL, 0400) \
> >> > -     param(char *, vbt_firmware, NULL, 0400) \
> >> > +     param(char *, dmc_firmware_path, "", 0400) \
> >> > +     param(char *, vbt_firmware, "", 0400) \
> >>
> >> Admittedly this is all very convoluted, but these NULL pointers (or
> >> pointers to them) are never passed to debugfs_create_str().
> >
> > Hi Jani,
> >
> > Thanks for your review.
> >
> > Could you elaborate on why they are never passed? Looking at
> > intel_display_debugfs_params.c, the intel_display_debugfs_params()
> > function iterates over INTEL_DISPLAY_PARAMS_FOR_EACH using the
> > REGISTER macro. This eventually calls
> > _intel_display_param_create_file(), which uses _Generic to dispatch
> > char ** types to debugfs_create_str().
>
> In _intel_display_param_create_file(), valp is &display->params.x, where
> x is dmc_firmware_path or vbt_firmware.
>
> display->params gets initialized using intel_display_params_copy() when
> struct intel_display is allocated in intel_display_device_probe(). In
> intel_display_params_copy(), _param_dup_charp() handles the NULL
> initializer.
>
> Granted, if the kstrdup() fails, you could end up having NULL there, but
> at that point it's fine if your debugfs_create_str() change barfs and
> bails out.
>
> Like I said, it's convoluted. ;)

Ah, that makes perfect sense.

Thanks for taking the time to explain this in detail! Then we could
drop this patch from the series.

Thanks.
