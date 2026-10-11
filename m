Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A25CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B0810E5F0;
	Mon, 12 Oct 2026 14:36:25 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D997C10E096
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Oct 2026 12:26:06 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-cbedd5aece4so1477973a12.0
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Oct 2026 05:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791721566; cv=none;
 d=google.com; s=arc-20260327;
 b=lJvQwg/QtRvHYOpAM4LFDAUHI10YFN8WzZdy986og1Sh9Nwqgkrk21+2lkNbVQcRm5
 LzKxvo7zzahTLlCTHeVH6kCh4DprFTaADbQ2GHkTEKiDTlhp4K+IwzidiX+ggFvQHZAs
 rEEzgXUKPb4fdUUJHF+N+9r7sAWI5PqCXY6Wq/8SlJUF2EEE+a9hLKhalmK7dbu5xkGL
 lI/WsEyDtwvJ0uEs6/Jp8vHVMEGtkfmezSTmYLmn+bBeypRR2DxkXSAE4up0lkmi7h2E
 9D/k6vbqDHqNHdvrZvZu+2iN9bdakOvHtep0Pbyfb3kJrlExvKKmdigvGMFITHQmfCNb
 zOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TMQJrEs50uHxmH5jNYUVoTh6YrurDltIENM9WcFXON4=;
 fh=mOU6hZHFnqMHDln5OOw7aJ0Vzc2vwQSNWCYKzx01Wys=;
 b=s+XX5a9HiXMW872YVSFXd8+pmZu6ZTiDAqJTT836eMwN4sL0vEMIiNodVrPYyiAB2O
 F26UCKPdsWA3wrga6jlQw4DwpkmM3MtuwQN+DCYHPc3U8l6YSu5GPgfBqupUO7RapzPe
 l2arFqZVxdP6Rox5QL+NHp897f0Bfa8g2GulOMYvstzk8m77/9NNTcUQqIV/GK9xgaHk
 iydelcy6DgPylqScBZhoL1eTek/xqL5sSsxLJYXi3uakeI5GWc0Is2vqWBrvSzn0nrHN
 9mBdg1Q4x60x2HMI5Kq4D9yZcMDM/eSFMU7AKCwOuqUFB7rZK2JF2OF+OMVnLqcSYnl2
 Iy9w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791721566; x=1792326366; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=TMQJrEs50uHxmH5jNYUVoTh6YrurDltIENM9WcFXON4=;
 b=aY0QTbpu4BPLgzzRJNWLOZONHhKsJQHUrpEqLrNSMemLKBQ+o4/SChho9vsHwA3dMf
 hRVVDkIfWBTHlZhe4EH++oxURWTLn8LlOCQUnKvbES2ml1I9vYDxfY7k4+Pm2vC6Wqa4
 R8hDO5kJZ0+kVIQiyjaVrOCUutOaRRs7huDlH6jSiGQyRsfYiXaTbtrTvaEegOWp0Pkf
 qWQQ9pzT2vZp5tOnni2aFPZx4Ic6bN/r3CxBvBW6jpwP0MY7xABoloMwo6QB7cW8OCVb
 QfI4yQkgLUx3uAUXT4xIb7eOHIGikfYZ3dqWhAdIinXzw2La334qs10nhCnj9Y1RO7Wf
 +11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791721566; x=1792326366;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=TMQJrEs50uHxmH5jNYUVoTh6YrurDltIENM9WcFXON4=;
 b=LSssMJqrlX0cB+yWYOsCVxW4Q0DE40fEE1sKWUb5LF2W+T9+wHW6a2rH5DnnPC1NA/
 qLVS64CJwtxARjmlQuuyWaMMa7MA5gAxMXeexKYXzvyR9iLvjM5E/GPRVjvkT9S/1W3o
 tmwNJwGvo2NV9nL/ViF7lbhoT53F4m6QrlhAtJ/zoDVvXvw2I8RnFC9j3WHWevF4TwFa
 376EFhk579Hq1dirk4wdB43wRwcsLPzASwyGQt/jgBmzhaVcl/fyRNZM0mIX7qic9iFt
 +NloblRg/GUE8dergNLIzWTL5i3rpiAjk8Z0Kk7o6jiIOrcUL2EjTPx/NEUOoLZMB6Je
 ok/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAvI79+IdH5/C+rcJA4QUaLIuzBpj+r+btjQlFbpXQ24Le6Svg464f5qxjL3Sb0iuFSP8PkVr8Ug==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYK6/it//tFPlaDyIFLRRw4TkzkxR/g5UpsT67JiIVzPy9PQ4Gh/
 hshxdHuGC0F2VRGg/uGzlwFHTekau4/VDot6WztO6JacxEPaYh+Qpr8OQfAE/6igtVb9yBP/da2
 /A4sXY4FGJ84i1/bJ9uRHoENgLVBHJtY=
X-Gm-Gg: AYBFou1WrzBiosxSy6Q7eICuFtax9JcK9EpB5X7V5X8En7uX3nwrtNH4m5JFVLDjDnt
 tX8ow6LaRcip92Su6z1YveWijFUoYAm6B8jEf8pIRC/+cVSWAL5d1inFb1jawMJoR/YwjhEkXYG
 md0lflpKMkycFRKQosyH7N2hzPWT3ztKFi4x3XcvTq81cCnC9DAmHpv5ssMaBJbWCOdmXqvAv4l
 FWqBSswbDHgbGbvInWk4I3SL9vldqXiqEBjEGjCjvqmj5TeIadKm2AJNF8tn4mQYtjp5AR+UUqF
 ibA0wSDR34DZCRcJQpKHAJ5JFsDaub5XxSXeKyfana5bO1/H7N2s4g==
X-Received: by 2002:a17:90b:2b48:b0:3aa:412f:b0a7 with SMTP id
 98e67ed59e1d1-3ab3a3687c7mr3848020a91.5.1791721566176; Sun, 11 Oct 2026
 05:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260917185235.23792-1-andersen.theo@gmail.com>
In-Reply-To: <20260917185235.23792-1-andersen.theo@gmail.com>
From: Theo Andersen Carton <andersen.theo@gmail.com>
Date: Sun, 11 Oct 2026 14:25:54 +0200
X-Gm-Features: AclHuK-8yQsEoQZb7XBZEYKYmzxZwaG7_AHzyz8sYrBgwykehmJlXlezwbpfNXM
Message-ID: <CANFnrsrMZoRatJJ_iJ=c9zW4uiZZUhM8KnVq_NF3XNW2_yQ0SA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/i915/ddi: add DDI A force 4 lanes quirk for Apple
 MacBookPro11, 5
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com
Cc: joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com, 
 simona@ffwll.ch, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 12 Oct 2026 14:36:24 +0000
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

Gentle ping on v3. Patchwork says CI won't trigger automatically because
my address isn't on the allowlist:

  https://patchwork.freedesktop.org/series/174000/

Could someone with access click retest on rev4? For reference, BAT on the
earlier identical posting (rev3) passed. The shard failures from that run
were on MTL and DG1, which never reach this code since the quirk is gated
on a DMI match for MacBookPro11,5.

The bug with the logs and the VBT dump is still at
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17087

Thanks,
Theo

Den tors. 17. sep. 2026 kl. 20.52 skrev Theo Andersen Carton
<andersen.theo@gmail.com>:
>
> On dual-GPU Retina MacBooks the internal panel is muxed to the discrete
> GPU at boot, so Apple's firmware never lights up eDP on the Intel side.
> As a result it never sets DDI_A_4_LANES, and intel_ddi_max_lanes() reads
> back a source maximum of two lanes for port A.
>
> intel_dp_max_common_lane_count() then takes min3(source_max = 2,
> sink_max = 4, ...) = 2, giving 2 x 2.7 Gbps x 8/10 = 4.32 Gbps of link
> bandwidth. The panel's native 2880x1800@60 8bpc mode needs 8.1 Gbps, so
> every mode is rejected with MODE_CLOCK_HIGH and the connector comes up
> with no usable modes at all -- the panel stays dark whenever i915 is
> made to drive it, which looks like a hardware limitation but is not.
>
> The lanes are physically there. Reading the panel's DPCD from the AMD
> side, where amdgpu drives it correctly, reports MAX_LANE_COUNT = 0x84,
> i.e. 4 lanes, and amdgpu's own link_settings shows it running the panel
> at 4 lanes / HBR. macOS likewise drives this panel from the iGPU at its
> native resolution, so all four lanes are routed through the gmux to
> DDI A. Only the register bit is unset.
>
> intel_ddi_a_force_4_lanes() already exists for exactly this situation --
> its neighbouring comment notes that "Some BIOS might fail to set this
> bit on port A if eDP wasn't lit up at boot" -- but it only covers
> Broxton and Geminilake. Extend it with a DMI quirk so affected Macs get
> the correct lane count too.
>
> The DMI match is deliberately narrow. Other dual-GPU models in the same
> family are very likely affected identically, but they are untested, so
> widen the match only as reports come in.
>
> Tested on a MacBookPro11,5 (Haswell Crystal Well, Iris Pro 5200 +
> Radeon R9 M370X): with the quirk, DDI A comes up as 4 lanes, link
> training passes at link rate 270000 / lane count 4, and i915 drives the
> internal panel at its native 2880x1800.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17087
> Signed-off-by: Theo Andersen Carton <andersen.theo@gmail.com>
> ---
> Numbering note: neither earlier posting was labelled, so to match the
> numbering already used on the list this is v3. v1 [1] was pasted into a
> mail client by hand, which hard-wrapped the diff and detabbed it, leaving
> it unapplicable. v2 [2] was the same patch resent with git send-email,
> unlabelled.
>
> v3:
> - No functional change since v2.
> - Commit message: the machine is Haswell (Crystal Well), not Broadwell as
>   v1/v2 claimed. The DMI match was always by model, so no code change.
> - Added Closes: tag for the bug report, which carries the failing-case
>   logs, the VBT dump and the EDID.
>
> [1] https://lore.kernel.org/r/CANFnrspHiK7ii28XPdLkOMyhSZcJ9xz6CT-kNX+oiiF+8N-2Fg@mail.gmail.com
> [2] https://lore.kernel.org/lkml/20260912091805.531666-1-andersen.theo@gmail.com/
>  drivers/gpu/drm/i915/display/intel_ddi.c    |  7 +++++
>  drivers/gpu/drm/i915/display/intel_quirks.c | 34 +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_quirks.h |  1 +
>  3 files changed, 42 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 02a53c9848e1..f746287830b3 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -4976,6 +4976,13 @@ static bool intel_ddi_a_force_4_lanes(struct intel_digital_port *dig_port)
>         if (display->platform.geminilake || display->platform.broxton)
>                 return true;
>
> +       /*
> +        * Machines whose firmware leaves eDP dark on the Intel side never set
> +        * the bit, so trust the quirk rather than the register.
> +        */
> +       if (intel_has_quirk(display, QUIRK_DDI_A_FORCE_4_LANES))
> +               return true;
> +
>         return false;
>  }
>
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
> index 33245f44c0d5..feb28956a013 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> @@ -100,6 +100,20 @@ static void quirk_disable_psr2(struct intel_display *display)
>         drm_info(display->drm, "PSR2 support not currently available for this setup, applying disable PSR2 quirk\n");
>  }
>
> +/*
> + * Dual-GPU Macs boot with the internal panel muxed to the discrete GPU, so
> + * the firmware never lights up eDP on the Intel side and consequently never
> + * sets DDI_A_4_LANES -- even though all four lanes are wired through the gmux
> + * to DDI A. Without the bit, port A is capped at two lanes, which is not
> + * enough bandwidth for the panel's native mode, leaving the connector with no
> + * usable modes at all.
> + */
> +static void quirk_ddi_a_force_4_lanes(struct intel_display *display)
> +{
> +       intel_set_quirk(display, QUIRK_DDI_A_FORCE_4_LANES);
> +       drm_info(display->drm, "Applying DDI A force 4 lanes quirk\n");
> +}
> +
>  struct intel_quirk {
>         int device;
>         int subsystem_vendor;
> @@ -142,6 +156,13 @@ static int intel_dmi_no_pps_backlight(const struct dmi_system_id *id)
>         return 1;
>  }
>
> +static int intel_dmi_ddi_a_force_4_lanes(const struct dmi_system_id *id)
> +{
> +       DRM_INFO("DDI A is 4 lanes despite firmware on %s\n", id->ident);
> +
> +       return 1;
> +}
> +
>  static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>         {
>                 .dmi_id_list = &(const struct dmi_system_id[]) {
> @@ -188,6 +209,19 @@ static const struct intel_dmi_quirk intel_dmi_quirks[] = {
>                 },
>                 .hook = quirk_no_pps_backlight_power_hook,
>         },
> +       {
> +               .dmi_id_list = &(const struct dmi_system_id[]) {
> +                       {
> +                               .callback = intel_dmi_ddi_a_force_4_lanes,
> +                               .ident = "Apple MacBookPro11,5",
> +                               .matches = {DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
> +                                           DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MacBookPro11,5"),
> +                               },
> +                       },
> +                       { }
> +               },
> +               .hook = quirk_ddi_a_force_4_lanes,
> +       },
>  };
>
>  static struct intel_quirk intel_quirks[] = {
> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
> index 970a4fe52faf..d2b8e9183c62 100644
> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
> @@ -23,6 +23,7 @@ enum intel_quirk_id {
>         QUIRK_EDP_LIMIT_RATE_HBR2,
>         QUIRK_DISABLE_EDP_PANEL_REPLAY,
>         QUIRK_DISABLE_PSR2,
> +       QUIRK_DDI_A_FORCE_4_LANES,
>  };
>
>  void intel_init_quirks(struct intel_display *display);
>
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> --
> 2.55.0
>
