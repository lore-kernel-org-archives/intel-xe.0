Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960A0CD8CA7
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 22:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CFD10F9EA;
	Mon,  8 Jun 2026 22:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="HUGQByq+";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD64010F9E9;
 Mon,  8 Jun 2026 22:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1780958149;
 bh=qnS2Rl0CqNQ+Lqtu7CcV+DZOMbWi9Dtj9JXbo93dy58=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HUGQByq+dTMHqoMEiRhml6VVtJAGaMzDl+NQBaD3kMnr+EbDNG1IKyynMuCNmZ+ln
 Zks6Rnz9qi9oIn/k+AK3lJ2QXtGerWzbsKsu8VL94CB+1cXK2SEt4sgoKLEb4Sdp0A
 Z4tkabSqt9+lkAjii4a/Z9r/8rzCvK8/xV4HvsAY5WxBo6RP0dLH8owNAHeJhTfy+a
 rfuo71OJOUbRfoz1yS3vasCspbxLl9h2RrHbzqSngeLH0vYo4UhGfFBAFZLfmycQeU
 5cchIjn6nARf5t/PnjFbEK1ZqPJUTc4TJm69bCNNmSz1wcW2vzVi28f9c1Q7VLhvAp
 TngcDaeILrg1A==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id ED680978C;
 Tue,  9 Jun 2026 00:35:48 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Tue, 9 Jun 2026 00:35:48 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: Imre Deak <imre.deak@intel.com>
Cc: Alexander Kaplan <alexander.kaplan@sms-medipool.de>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915/tc: Disable outputs instead of modesetting them
 on link reset
Date: Tue,  9 Jun 2026 00:35:48 +0200
Message-ID: <20260608223548.2574-1-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aia3UtOtXD65T8Eq@ideak-desk.lan>
References: <20260605212837.4265-1-alexander.kaplan@sms-medipool.de>
 <aia3UtOtXD65T8Eq@ideak-desk.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Imre,

first of all, thanks a lot for taking the time to look into this.
I really appreciate it.
This isn't really a niche case, just an early one.
I'm one of the first with Panther Lake, and setups like this will be
common once these machines are out there.

I'm afraid your patch is for a different issue, though.
For some background: this is Panther Lake (NUC 16 Pro) driving an LG OLED
TV through Synaptics VMM7100 based USB-C to HDMI 2.1 PCON adapters.
I have two such dongles and a TB4 dock here, all VMM7100 based, and all
three needed a series of fixes to work at all on this machine (DSC, FRL,
link training quirks).
This wedge is just the nastiest one, because almost every sink disconnect
on these adapters loses the signal until a reboot.
A few more fixes for the same path are on their way.

I did the test you asked for.
I rebooted latest drm-tip with your patch applied and drm.debug=0x15e,
and reproduced the problem by power-cycling the TV while the output was
active.
The full boot log up to the wedge is on the first ticket [1], with the
reproduction steps.

On PTL this never reaches the -EINVAL / WARN you get on the ADL/MTL
reports.
The recovery modeset computes a valid (degraded) config and commits it
against the dead link, link training fails, and the pipe is re-enabled
regardless, leaving the output enabled on a disconnected port.
After that the TC PHY ownership stays held, intel_tc_port_connected()
returns false and AUX is rejected, so the reconnect HPD never produces a
successful detect.
Keeping the DSC caps doesn't help here.
The caps we lose are dfp.*/EDID (the PCON FRL bandwidth) via
intel_dp_unset_edid(), not dsc_dpcd, and the second failure mode above is
independent of the sink caps anyway.

Same trigger, your patch vs. this one:

  with your patch (wedge):
  link_reset_work: TypeC DP-alt sink disconnected, resetting link
      connectors_changed=1
      disabling pipe A
      [DPRX] Link Training failed at link rate = 810000, lane count = 2
      enabling pipe A
  TV back on:
      DP-1 hotplug event (retry 0..5), detect never succeeds, wedged

  with this patch (recovers):
  link_reset_work: TypeC DP-alt sink disconnected, resetting link
      disabling pipe A
      TC port mode reset (dp-alt -> disconnected), PHY released
  TV back on:
      DP-1 status disconnected -> connected, detect works
      enabling pipe A, output back, no reboot

> The driver cannot disable an output that userspace has enabled. The TC
> port reset above should also result in a hotplug notification, which
> userspace should handle reconfiguring and re-enabling the output as
> needed.

I'd argue that's effectively what this ends up doing.
reset_link_commit() already re-drives the output today (the
connectors_changed modeset above), it isn't only a notification, and that
re-commit is what leaves the zombie behind.
Disabling instead releases the PHY, and as the second snippet shows, the
reconnect HPD then leads to a normal detect and userspace re-enables the
output the usual way.
With the re-commit the zombie keeps connected() false and every detect
fails, so userspace never gets the chance.

That said, if disabling from the reset work is the wrong layer for you,
I'm happy to rework it.
For example not re-enabling the pipe when link training fails in this
path, or whichever direction you prefer.
Just let me know.

Also, the patch you have here isn't quite current anymore.
I've since extended the same approach to also cover the TB4 dock (the
tbt-alt case), so I'd like to send a v2 that's almost identical plus that
small follow-up once we've settled the direction.

One side note: the original submission didn't get CI coverage, my address
isn't on the allowlist yet. I've asked i915-ci-infra@ to add it.

[1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14807

Thanks again,
Alexander

