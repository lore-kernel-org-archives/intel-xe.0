Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99188FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 10:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F38410EA55;
	Tue,  5 May 2026 10:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.b="a385YqAj";
	dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7916910EA55
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 10:11:47 +0000 (UTC)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D33DB3F7D7
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 10:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20251003; t=1777975904;
 bh=wmyBBZx1noIWM5Co3iOdFkKMWhcQoU3Z9pf+K7tso4s=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=a385YqAjGbiYpGPFsgOi1yJck49e5P1fSdqsCDGq6jGWjm71S+QY6s/bqRBnrVdZ9
 8qozG2wZaWLgeKxBH+8B4Vy2c4qYxxqGNKh9jOq5+EjucY0kjM4WerlCe0oAHWYmiC
 UQ7Ci7QLmaLflCg0wUceGZQ03eM/jQ7NnX41kTtHdUknTyjO38y17VoM0O3qjWu+7e
 q4c19BT7fZq7NHgnQlnMOsQrS2v02QyrkpJ5o8uEyWBtLnyU+tPtsHDmk9G6OzPzmP
 /PqennlpwmwlH6nkiSLdBcBDW2ciqQNl+Z6TgICRy5E/tgWo4pNkSza8xtTyMoy4hE
 /70luMf+tOt2t7Q/DFBFLeczym/xCFZB4/BnOCpW//FlI3MUU4YfBqFkKC6dsGB2nx
 GWwo632t4hp8IcOPkWrKSPr+cyRA1AMZPu6JymJfqN+M2ZGVTijjEe5IuNdb/0DiC+
 /cfF3Q4YsMSOtBmQRuoGZZrizVRZOxbThbNjSZnph5TZQhnCOzL/5esy23past/bHc
 lE2c1/siKixfSLcBpuxnQaY65txfyhVonz+XiRfCre7tCjVCnPHK7JbqAzU76imm2D
 7YbQEWtO0I5vQRZhTPDie8THKUn4ocYShRtxk8Z7hiDdCc1+3VKdO7CZT7NfHgDV5x
 I0gSw870npa4GZ0myo2sRJlY=
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7dcc8ea2bb7so1595123a34.1
 for <intel-xe@lists.freedesktop.org>; Tue, 05 May 2026 03:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777975904; cv=none;
 d=google.com; s=arc-20240605;
 b=aOl6w5vGduuPcPAvcxm6/yC0QBHa9/HLyxUhCIdAhO+JwZzYM4kEjQwNUpEZ5jE656
 hjjQkGRJiGNDhWeDPNCe3+CC8PRos5Lo57zyKDg3PZ1bdSgC5a51JcBpMVScB9qgYxQn
 3gWKS2LhuukXd7vcvMHFJT0ufSjKAFGH3p17i0Zy411CfAlkpF0lWxWSr9t2IHCbKudO
 I5gqzIWNYXGkqmf2LHGwlnLNM4SnEwuge27Jolh9ZeyDELpGhVIhgelAudSMEMNyUOM8
 lGmqLdiSOOd8xekeIna7y+Iq0Jbd8THCaReXYZ/aDqBBbvSeWCu49HnOYo8R08P7etip
 b1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version;
 bh=wmyBBZx1noIWM5Co3iOdFkKMWhcQoU3Z9pf+K7tso4s=;
 fh=6pUqviTJek0sLcnoQy/OjNgQRoiKCA1GvJTzHAB6sf4=;
 b=Bt3A77s9k3rtSZpraZX4gfxwWC/JK4aVbQIphkg2ZNubUtVJA+Sdw0at0h3WrFCEuq
 /kHAlTiZTRmgkTHyKjeGP5oLdRdps0W1OCrnGyv68TVhTUZg6IcyTAb0RXNuhwGKCq6D
 QUmrULZCfxagova2xW/cPU/06EuQYPwcvXbJtlN9+BKUQ2PQ3BSyOLm7xuTL506P/u0K
 WfBoKBCD6JrRuV6MQdi+jLpPor9tawFaG/8y+zrVlt/JE8E2I9Q1Lxcuwb6pB6ZFEzzF
 Vkfs94138KkSmMgrUTOyY7DG8dLIHvdIeLONq/JBBtJu9y2E6RG8JKrXmtBBt73BhgFk
 z88g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777975904; x=1778580704;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmyBBZx1noIWM5Co3iOdFkKMWhcQoU3Z9pf+K7tso4s=;
 b=Vsc1MhsmnyPrqREUO/yEpMbGbFv8cUafwDiZ/eTt34wglSdD5Ujt0abfUvy4kgi1gh
 PTCD+RFNTYTrkaLfe6P9DzIcL/bH70YeTgq9uKoERhMXKrt0WHXB0mkOytOUJ7SbfFTV
 AeU7dJecIKMSQwhXehsWwKVxtTz2556aNmJO4R78RJT7juNrz1+h99safFKGMYzRXV3x
 XOKTdYXePe+YA+Yv/lM1ifa5C8P9JbD3oInw/zSgxKRWACfWysldFN6lhPEhR5k9MXuV
 9XX/VJ8VS10bWbT22lkjZBb0YQpaE6ESSKVkktJOE0rYQbzVeEGWX7Y+tdbg2MDDgbbK
 QIfw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pukNdt92o60TNFcljI9medQd6M7nJJElzNzTWkPxLZL+0ydXjU6ZNpTLeeHIInsinQQKd5RlYUw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8rxGVHahaVxpZwVcmvv4FlPS8iepjHabQFnmuAGhkeiGlqyHz
 MBbbrfKz6bM5pQUq96ll2ops1+87x77RnTDbt8pJpZWQD7HV6DMz34U3AMy3gkndkWOuICyls8H
 QLNr6MZU1G/dm52qRv+FOIyBf3bRzjdmLCF2GAyZZfaQmprmmeMXSglj2ms+gRk0hvMlJuHwPYO
 zTjkKoIo4srGYu5yPajuRK+RRw/6WI14HrYBzR9L9ye9G9RymuHm5vLPXPG14=
X-Gm-Gg: AeBDieuxu7cWj7L5q/i7QynVaZhu1XvW1v4QWSYDXs7vqRs4L7b5MbVNUvWB6E3Lagg
 zp4ovWa/2AZFSkAV//yXlaGcWr08casZHMy81hK3rd0mCd5X16Un+M+3EcaO2j+xFqvJwo5aaZe
 /wnUeyVNXJT/FQ7JLeoEBp2L5A9VDhyzXaq+qOvEkTlb/Tz+fIyPCQ7ysDmPGAs9ZoOpmvleL4O
 KKCAOtSSPuT2yFhlhOOTGmpqIsdB/xkU7a/EIMNa7RXvPLGb09Zbj/Vk2D/rZKhhA==
X-Received: by 2002:a05:6808:118c:b0:459:f0c5:781d with SMTP id
 5614622812f47-47c892a718dmr3674438b6e.5.1777975903670; 
 Tue, 05 May 2026 03:11:43 -0700 (PDT)
X-Received: by 2002:a05:6808:118c:b0:459:f0c5:781d with SMTP id
 5614622812f47-47c892a718dmr3674427b6e.5.1777975903248; Tue, 05 May 2026
 03:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260505033558.157604-1-an.wu@canonical.com>
 <afmroyG15GjNRJUM@ideak-desk.lan>
In-Reply-To: <afmroyG15GjNRJUM@ideak-desk.lan>
From: An Wu <an.wu@canonical.com>
Date: Tue, 5 May 2026 18:11:31 +0800
X-Gm-Features: AVHnY4Jmcv4S74EFHJsXikAUjqyBICTvJXsw0OqIBUQKju729GyNIwgwHUkhi7s
Message-ID: <CAO4Mv0a-kXUDNAVXV5UaVUGVLSEwGJYPw9OHnxisnhVgmJWK1A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915/tc: Recover AUX channel after external TC
 port mode change
To: imre.deak@intel.com
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000021f47106510f4680"
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

--00000000000021f47106510f4680
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Imre
Thank you for pointing out my mistake and kindly providing clear guidance.
I=E2=80=99ll fix the issue, run some tests, and update the commit descripti=
on
accordingly.
Thank you.

BR
    An

On Tue, May 5, 2026 at 4:35=E2=80=AFPM Imre Deak <imre.deak@intel.com> wrot=
e:

> On Tue, May 05, 2026 at 11:35:57AM +0800, ChunAn Wu wrote:
> > When Fn+F4 triggers mirror mode, the BIOS/EC reconfigures a TC port
> > mode (e.g. DP-Alt to TBT-Alt via UCSI) without generating HPD. The
> > driver's cached TC mode becomes stale, so intel_dp_aux_xfer() uses
> > the wrong power domain and IO routing, and AUX transactions fail.
> >
> > This occurs when the USB-C-to-HDMI dongle does not support TBT, so
> > the mode switch creates a mismatch. It also occurs with slow monitors
> > whose delayed HPD/DDC/EDID recovery causes the Type-C layer to settle
> > on a stale tbt-alt state before the dongle finishes re-negotiation.
> >
> > Add intel_tc_port_aux_recover() to detect hardware/cached TC mode
> > divergence and reset the PHY. Wrap it with
> > intel_dp_aux_xfer_with_recovery() to retry with corrected settings.
> >
> > Tested on Panther Lake and Lunar Lake with a BenQ HDMI monitor via
> > USB-C-to-HDMI dongle.
> >
> > Signed-off-by: ChunAn Wu <an.wu@canonical.com>
> > ---
> >
> > [...]
> >
> > +/**
> > + * intel_tc_port_aux_recover - Recover AUX channel after external TC
> mode change
> > + * @dig_port: digital port
> > + *
> > + * When firmware causes a TC port mode change (e.g., dp-alt ->
> disconnect ->
> > + * tbt-alt) during a hotkey-triggered display mode switch, AUX
> transactions
> > + * using the stale power domain and IO flags will fail with timeouts o=
r
> errors.
> > + * This happens because:
> > + *
> > + *   1. The display driver holds the TC link in dp-alt mode
> (link_refcount > 0)
> > + *   2. Firmware (e.g., via HP WMI hotkey BIOS action) reconfigures th=
e
> TC port
> > + *      mode externally without notifying the display driver
> > + *   3. tc->mode stays as TC_PORT_DP_ALT while HW transitions to a
> different
> > + *      mode, invalidating the AUX power domain and IO flags used by
> > + *      intel_dp_aux_xfer()
> > + *
> > + * This function detects the discrepancy between tc->mode and actual H=
W
> state,
> > + * and re-synchronizes them via a TC PHY reset. After recovery, AUX
> retries
> > + * will use the correct power domain and control flags.
> > + *
> > + * The link_refcount is temporarily cleared to allow
> intel_tc_port_reset_mode()
> > + * to proceed without the PHY-ownership assertion that fires when
> link_refcount
> > + * is non-zero and firmware has already released PHY ownership.
> > + *
> > + * Must be called outside the TC port lock (tc->lock).
> > + *
> > + * Returns: %true if recovery was performed and AUX can be retried,
> > + *          %false if recovery was not needed or not possible.
> > + */
> > +bool intel_tc_port_aux_recover(struct intel_digital_port *dig_port)
> > +{
> > +     struct intel_tc_port *tc;
> > +     struct intel_display *display;
> > +     bool recovered =3D false;
> > +
> > +     if (!intel_encoder_is_tc(&dig_port->base))
> > +             return false;
> > +
> > +     tc =3D to_tc_port(dig_port);
> > +     display =3D to_intel_display(dig_port);
> > +
> > +     mutex_lock(&tc->lock);
> > +
> > +     /*
> > +      * Recovery is only needed when the link is actively held AND the
> HW
> > +      * TC mode has diverged from the driver's cached state.
> > +      */
> > +     if (!tc->link_refcount || !intel_tc_port_needs_reset(tc))
> > +             goto out;
> > +
> > +     drm_dbg_kms(display->drm,
> > +                 "Port %s: AUX recover: external TC mode change
> detected (%s -> HW), reconnecting TC PHY\n",
> > +                 tc->port_name, tc_port_mode_name(tc->mode));
> > +
> > +     /*
> > +      * Temporarily clear link_refcount so intel_tc_port_reset_mode()
> can
> > +      * run the PHY disconnect/connect cycle without the ownership
> assertion
> > +      * that fires when link_refcount > 0 and firmware has already
> released
> > +      * PHY ownership externally.
> > +      */
> > +     tc->link_refcount =3D 0;
>
> This looks wrong, NAK from my side:
>
> A non-zero link_refcount guards an active output, which must maintain
> the TypeC mode with which the output was enabled. So that TypeC mode
> cannot be reset from under the active output as done in this patch.
>
> The commit message fails to mention how the display driver is supposed
> to notice that the user have pressed F4 and the firmware has
> reconfigured things in the background. Assuming that the FW's
> reconfiguration in the background is actually a valid thing to do, i.e.
> doesn't result in getting the active TypeC port into a broken state, the
> transition to the new TypeC mode should happen in the regular way: via
> an HPD event, if neecessary using the
> drm_connector_funcs::oob_hotplug_event interface, disabling any active
> outputs and _then_ switching the driver's idea of the TypeC mode to
> reflect the HW state.
>
> > +     intel_tc_port_reset_mode(tc, 1, false);
> > +     tc->link_refcount =3D 1;
> > +
> > +     recovered =3D tc->mode !=3D TC_PORT_DISCONNECTED;
> > +     if (!recovered)
> > +             drm_warn(display->drm,
> > +                      "Port %s: AUX recover: failed to restore TC port
> mode\n",
> > +                      tc->port_name);
> > +
> > +out:
> > +     mutex_unlock(&tc->lock);
> > +     return recovered;
> > +}
> > +
> >  static void __intel_tc_port_lock(struct intel_tc_port *tc,
> >                                int required_lanes)
> >  {
> > diff --git a/drivers/gpu/drm/i915/display/intel_tc.h
> b/drivers/gpu/drm/i915/display/intel_tc.h
> > index 6719aea5bd58..d44998a3081a 100644
> > --- a/drivers/gpu/drm/i915/display/intel_tc.h
> > +++ b/drivers/gpu/drm/i915/display/intel_tc.h
> > @@ -108,6 +108,7 @@ bool intel_tc_port_ref_held(struct
> intel_digital_port *dig_port);
> >  bool intel_tc_port_link_needs_reset(struct intel_digital_port
> *dig_port);
> >  bool intel_tc_port_link_reset(struct intel_digital_port *dig_port);
> >  void intel_tc_port_link_cancel_reset_work(struct intel_digital_port
> *dig_port);
> > +bool intel_tc_port_aux_recover(struct intel_digital_port *dig_port);
> >
> >  int intel_tc_port_init(struct intel_digital_port *dig_port, bool
> is_legacy);
> >  void intel_tc_port_cleanup(struct intel_digital_port *dig_port);
> > --
> > 2.34.1
> >
>

--00000000000021f47106510f4680
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Imre<div>Thank you for pointing out my mistake and kind=
ly providing clear guidance.=C2=A0</div><div>I=E2=80=99ll fix the issue, ru=
n some tests, and update the commit description accordingly.</div><div>Than=
k you.</div><div><br></div><div>BR</div><div>=C2=A0 =C2=A0 An</div></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 5, 2026 at 4:35=E2=80=AFPM Imre Deak &lt;<a hre=
f=3D"mailto:imre.deak@intel.com">imre.deak@intel.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, May 05, 2026 at=
 11:35:57AM +0800, ChunAn Wu wrote:<br>
&gt; When Fn+F4 triggers mirror mode, the BIOS/EC reconfigures a TC port<br=
>
&gt; mode (e.g. DP-Alt to TBT-Alt via UCSI) without generating HPD. The<br>
&gt; driver&#39;s cached TC mode becomes stale, so intel_dp_aux_xfer() uses=
<br>
&gt; the wrong power domain and IO routing, and AUX transactions fail.<br>
&gt; <br>
&gt; This occurs when the USB-C-to-HDMI dongle does not support TBT, so<br>
&gt; the mode switch creates a mismatch. It also occurs with slow monitors<=
br>
&gt; whose delayed HPD/DDC/EDID recovery causes the Type-C layer to settle<=
br>
&gt; on a stale tbt-alt state before the dongle finishes re-negotiation.<br=
>
&gt; <br>
&gt; Add intel_tc_port_aux_recover() to detect hardware/cached TC mode<br>
&gt; divergence and reset the PHY. Wrap it with<br>
&gt; intel_dp_aux_xfer_with_recovery() to retry with corrected settings.<br=
>
&gt; <br>
&gt; Tested on Panther Lake and Lunar Lake with a BenQ HDMI monitor via<br>
&gt; USB-C-to-HDMI dongle.<br>
&gt; <br>
&gt; Signed-off-by: ChunAn Wu &lt;<a href=3D"mailto:an.wu@canonical.com" ta=
rget=3D"_blank">an.wu@canonical.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; [...]<br>
&gt;<br>
&gt; +/**<br>
&gt; + * intel_tc_port_aux_recover - Recover AUX channel after external TC =
mode change<br>
&gt; + * @dig_port: digital port<br>
&gt; + *<br>
&gt; + * When firmware causes a TC port mode change (e.g., dp-alt -&gt; dis=
connect -&gt;<br>
&gt; + * tbt-alt) during a hotkey-triggered display mode switch, AUX transa=
ctions<br>
&gt; + * using the stale power domain and IO flags will fail with timeouts =
or errors.<br>
&gt; + * This happens because:<br>
&gt; + *<br>
&gt; + *=C2=A0 =C2=A01. The display driver holds the TC link in dp-alt mode=
 (link_refcount &gt; 0)<br>
&gt; + *=C2=A0 =C2=A02. Firmware (e.g., via HP WMI hotkey BIOS action) reco=
nfigures the TC port<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 mode externally without notifying the display =
driver<br>
&gt; + *=C2=A0 =C2=A03. tc-&gt;mode stays as TC_PORT_DP_ALT while HW transi=
tions to a different<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 mode, invalidating the AUX power domain and IO=
 flags used by<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 intel_dp_aux_xfer()<br>
&gt; + *<br>
&gt; + * This function detects the discrepancy between tc-&gt;mode and actu=
al HW state,<br>
&gt; + * and re-synchronizes them via a TC PHY reset. After recovery, AUX r=
etries<br>
&gt; + * will use the correct power domain and control flags.<br>
&gt; + *<br>
&gt; + * The link_refcount is temporarily cleared to allow intel_tc_port_re=
set_mode()<br>
&gt; + * to proceed without the PHY-ownership assertion that fires when lin=
k_refcount<br>
&gt; + * is non-zero and firmware has already released PHY ownership.<br>
&gt; + *<br>
&gt; + * Must be called outside the TC port lock (tc-&gt;lock).<br>
&gt; + *<br>
&gt; + * Returns: %true if recovery was performed and AUX can be retried,<b=
r>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 %false if recovery was not neede=
d or not possible.<br>
&gt; + */<br>
&gt; +bool intel_tc_port_aux_recover(struct intel_digital_port *dig_port)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct intel_tc_port *tc;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct intel_display *display;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool recovered =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!intel_encoder_is_tc(&amp;dig_port-&gt;base))=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc =3D to_tc_port(dig_port);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0display =3D to_intel_display(dig_port);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;tc-&gt;lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Recovery is only needed when the link is activ=
ely held AND the HW<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * TC mode has diverged from the driver&#39;s cac=
hed state.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!tc-&gt;link_refcount || !intel_tc_port_needs=
_reset(tc))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0drm_dbg_kms(display-&gt;drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;P=
ort %s: AUX recover: external TC mode change detected (%s -&gt; HW), reconn=
ecting TC PHY\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;=
port_name, tc_port_mode_name(tc-&gt;mode));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Temporarily clear link_refcount so intel_tc_po=
rt_reset_mode() can<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * run the PHY disconnect/connect cycle without t=
he ownership assertion<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * that fires when link_refcount &gt; 0 and firmw=
are has already released<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * PHY ownership externally.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;link_refcount =3D 0;<br>
<br>
This looks wrong, NAK from my side:<br>
<br>
A non-zero link_refcount guards an active output, which must maintain<br>
the TypeC mode with which the output was enabled. So that TypeC mode<br>
cannot be reset from under the active output as done in this patch.<br>
<br>
The commit message fails to mention how the display driver is supposed<br>
to notice that the user have pressed F4 and the firmware has<br>
reconfigured things in the background. Assuming that the FW&#39;s<br>
reconfiguration in the background is actually a valid thing to do, i.e.<br>
doesn&#39;t result in getting the active TypeC port into a broken state, th=
e<br>
transition to the new TypeC mode should happen in the regular way: via<br>
an HPD event, if neecessary using the<br>
drm_connector_funcs::oob_hotplug_event interface, disabling any active<br>
outputs and _then_ switching the driver&#39;s idea of the TypeC mode to<br>
reflect the HW state.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0intel_tc_port_reset_mode(tc, 1, false);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tc-&gt;link_refcount =3D 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0recovered =3D tc-&gt;mode !=3D TC_PORT_DISCONNECT=
ED;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!recovered)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_warn(display-&gt;=
drm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;Port %s: AUX recover: failed to restore TC port mode\n&quot;,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 tc-&gt;port_name);<br>
&gt; +<br>
&gt; +out:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;tc-&gt;lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return recovered;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void __intel_tc_port_lock(struct intel_tc_port *tc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int required_lanes)<br>
&gt;=C2=A0 {<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_tc.h b/drivers/gpu/drm=
/i915/display/intel_tc.h<br>
&gt; index 6719aea5bd58..d44998a3081a 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_tc.h<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_tc.h<br>
&gt; @@ -108,6 +108,7 @@ bool intel_tc_port_ref_held(struct intel_digital_p=
ort *dig_port);<br>
&gt;=C2=A0 bool intel_tc_port_link_needs_reset(struct intel_digital_port *d=
ig_port);<br>
&gt;=C2=A0 bool intel_tc_port_link_reset(struct intel_digital_port *dig_por=
t);<br>
&gt;=C2=A0 void intel_tc_port_link_cancel_reset_work(struct intel_digital_p=
ort *dig_port);<br>
&gt; +bool intel_tc_port_aux_recover(struct intel_digital_port *dig_port);<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int intel_tc_port_init(struct intel_digital_port *dig_port, bool=
 is_legacy);<br>
&gt;=C2=A0 void intel_tc_port_cleanup(struct intel_digital_port *dig_port);=
<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
</blockquote></div>

--00000000000021f47106510f4680--
