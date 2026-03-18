Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53B1F483C3
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7287A10E585;
	Mon, 23 Mar 2026 16:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oq93M5Yp";
	dkim-atps=neutral
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD44510E5D7
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 01:53:47 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-41708f6aa5fso3784955fac.2
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 18:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773798827; cv=none;
 d=google.com; s=arc-20240605;
 b=R2jRRVSzcK9cBjAhAvHvctB43YNredx7J4YAf0YipagWcZqb2TIQnPq8YAyBhNZLC/
 FwoOknh4T6TwkyPhrhxMy34emDnvRG66vJaFtfQmSQ5K0F6qMva2Dk52ob2xtYywi6HU
 b0RFl9TnPTDnbtMArCGsQXHN+q8At+Puh6sDB1tcUEPRt7ZuF9ym5gDWMpUpDlHf/cQB
 cHtzPv6GMXgLL0CxgASC0Hgb1R4BVjfIZcdFOHJ92aY04+18UMgx3LNuFVfPSJ1CkBpx
 ozKaa8NBZqMz3nxJfNxF4bpBNPDkJYroXQ1o8HT3kMP+cvU+XLIXY+kL4srhqX3nK5t3
 iG3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
 fh=AeEfgVR4Ra62bEC/U2nv4mcug8WuXiWEb+q+MScDkXY=;
 b=jAx5cDUmPoiTybfnYrVeGLNYm7BGflxajsmsPEF/PPjrWfxtGM2QSs5Rg8PhBVkiSu
 cUONIqFRCG3M7yucl+RZtoK6RtZZ68cseH90+FLdMZwwKBbvm+DaAGBHpiJ6ux9xhl/m
 c9PDJlQ7uBOT1w65FPdtsRKe1qbT3W36KY8Uh8XBdeBikmWL6R7sqn2ClbDNGP1hTsdb
 S6s7Q+si6DqYfKCPrqBQNcytAA87xeYcrggJ/t4/vQek4ZYhbudht9vZQSmUBUvbBb22
 S8X/Gx9MZTT2JtkvCWcz7gdzH5E3XnVHTNB1GbM7P+bWVuYLYLgTe9qqnt9T/h7c6x7W
 oK4w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773798827; x=1774403627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
 b=Oq93M5Ypo1IoM7uJy+2vr0sn4ZxZhrqkYVsw6Nv47twXCyOnHMbw0DJVvMuRhPQ3//
 pfuyJ6URGsE3NZlha0G4+APHPdgH2bpqylpDdS1IKs/e385IL70aSCuIiePA+8VDE6xw
 H/dzbAQGlxFfrnA/L/Kj5Wwn6m7myDpJIqMg4GPJ74ZHHaVe1vKLWskvo1HNZWyB0Z8s
 ZpsAyZTkGqltxWOKPUgrMQxbVsbb/f/ShP85qOHeTz7suMqNgkmXAIzakfWQXUmMmsm+
 5hVvGi/BtvRaJl0W7EzLNOwZ7xDaV7OGet7LwWeykxsyy5TAqpJPgRpi7mqvX5OIeuq5
 eFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773798827; x=1774403627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
 b=ptWJ6h8n3fK43XgveUnaz6J7w/0cjrwgEj0CK6PXG7tA5wamv+PqYZDQ4NFj5DAGFN
 KaxlzU297PN0vr8hyp1DcvnsdQg4aeNTG/0GYB/Bvlzquy5D9XZgK/H/NxDcoemg/h2h
 evVK0dHnkJYczF73n+MCMg2FgGggUrJ1aabRPLLdWqXfxECNd/XdobS/wpsxxGGPOM5x
 ygIIWZ6EQ1NEjs2MUIdxLJ1kaygihaj8Du1G1xNIdNwLZgFDT11zm6STgNI7Eaz2XaK4
 DAdNctlGjbeVIdv6FpKmFu0ZRDIn43WPAXwKdmiGWwf5rnCWouNqCUpVaEK2WK1yOeP0
 TLQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ1opFug/Mbd3GKD+wJlShIFMJTz7vbg+UR8damTzBk2XqRVzZyBjenv+jGHyPtnMPKw0/B5uXpQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOalEtOWZaYiRXFM8Uc67Jyza/I4rGF9JZ6LvoQlBN6WiA7NB1
 VLZbTxUq4gBMNbp/C+oBMI1WnexVg2i2S35PTTka5/gMsRSKmeqBtCmt83vqO79HmCtujiOscRQ
 E81T4bOzm2kJcK+KjIaerCyJuMiVCGLk=
X-Gm-Gg: ATEYQzw641Bxh4binI3LlPs/o84yirJOiOVbIw3VoBD5nKfrVjXVAU4lFr2imZP/aft
 5jeuJ3uPFsXoz5HqHOOMsvVGFf944OdH5jDufsXD6H4yIn9RVnPjTDz/ryVuUtKznf2rhr1Q7OQ
 j/jz51r15IYUbAj0sy/Eg8r0t6FKhCJ7mdRCMtdiGKtBv3sE2KfZrjQkMkKxIxN937tM3EE+gat
 vfgCl/zdeduqUhP+BE7VeBwbRDTk+uDM13orb6qInDfS1ACYx2BPMb1qr9MTewmlW3/6xQxJa94
 es0Oq4bEuBVFom/jPOk4VXuF6/tReRHXBG4yNZyquaDLlm9QQ59ZIV/tFusf14XsqOWsuwwQ51U
 0t0G1PiMeHw==
X-Received: by 2002:a05:6870:ebcb:b0:417:1ba0:7320 with SMTP id
 586e51a60fabf-41bd41cda0bmr1126217fac.33.1773798826608; Tue, 17 Mar 2026
 18:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260317185920.43387-1-hanguidong02@gmail.com>
 <20260317191538.43535-1-hanguidong02@gmail.com>
 <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
In-Reply-To: <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 09:53:36 +0800
X-Gm-Features: AaiRm52nR_v9OD3YNBiYZ0KMPL0_wApDenMFnYnmDk762NDAGBxD5i0lDEEX0xA
Message-ID: <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com>
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

On Wed, Mar 18, 2026 at 4:12=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> > Passing NULL to debugfs_create_str() causes a NULL pointer dereference
> > upon reading, and is no longer permitted. Change the default values of
> > dmc_firmware_path and vbt_firmware to empty strings ("").
> >
> > Existing code that consumes these parameters already verifies both
> > pointer validity and string length, so empty strings are handled
> > correctly. Furthermore, heap allocation is not required here: these
> > debugfs parameters are created with strictly read-only permissions
> > (0400). As a result, the debugfs write operation is never invoked,
> > meaning the static empty string will not be erroneously freed by
> > kfree().
> >
> > Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to displ=
ay params")
> > Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module parame=
ter under display")
> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/driv=
ers/gpu/drm/i915/display/intel_display_params.h
> > index b95ecf728daa..0a8cad98d480 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> > @@ -23,8 +23,8 @@ struct drm_printer;
> >   *       debugfs file
> >   */
> >  #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
> > -     param(char *, dmc_firmware_path, NULL, 0400) \
> > -     param(char *, vbt_firmware, NULL, 0400) \
> > +     param(char *, dmc_firmware_path, "", 0400) \
> > +     param(char *, vbt_firmware, "", 0400) \
>
> Admittedly this is all very convoluted, but these NULL pointers (or
> pointers to them) are never passed to debugfs_create_str().

Hi Jani,

Thanks for your review.

Could you elaborate on why they are never passed? Looking at
intel_display_debugfs_params.c, the intel_display_debugfs_params()
function iterates over INTEL_DISPLAY_PARAMS_FOR_EACH using the
REGISTER macro. This eventually calls
_intel_display_param_create_file(), which uses _Generic to dispatch
char ** types to debugfs_create_str().

Thanks.
