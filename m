Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F765CD8C90
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D239310EB84;
	Wed, 10 Jun 2026 17:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="oU0yDmQp";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FFDA10EB80;
 Wed, 10 Jun 2026 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1781113805;
 bh=EMMDHhskv1+L9gE5Bz3TLUe7zsR5V4Dwz/Pv0wgUmvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oU0yDmQpRgo8WHZNCJ41k893Y913oOhYJEh2g02dVvfhmkCeHCorNzDBpGxSkn6QN
 YAis46RYZiyzfRbMHDH/+7XnqI5PgBksBwy3VYqFQpoKqDTaIxMVknVJ6lJfmuvkdl
 NvsiroieoAiTdpmevkqbLVq4t44xhtdet/2vSK8krME9DG4ucasYbemHnPnV0iwM3Y
 UCtAF9+0ijDxQturApRXdSqjExPWeW6MejuRvAakeoYRaklXnnot6zOUOhX39Qvzkw
 A7t1RX3uEVP+ensGFkYIpcs7a4W0vDftbBhUtBEWOSBqrdd1GbZHrs6mwSbFb4HWTE
 0HqoYkwT9XoIw==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id C802711D57;
 Wed, 10 Jun 2026 19:50:05 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Wed, 10 Jun 2026 19:50:04 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 alexander.kaplan@sms-medipool.de
Subject: Re: [PATCH] drm/i915/tc: Disable outputs instead of modesetting them
 on link reset
Date: Wed, 10 Jun 2026 19:50:03 +0200
Message-ID: <20260610175003.6352-1-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b912629b7fc5844a9e9d3262308835ec3745854e@intel.com>
References: <b912629b7fc5844a9e9d3262308835ec3745854e@intel.com>
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

On Wed, 10 Jun 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> If you're referring to [1], please just send the patches. We can let the
> individual patches through CI.

Hi Jani,

thanks for the offer :-)

[1] is solved in the meantime and it turned out not to be a kernel bug
at all, my patch was aiming at the wrong layer.
Imre was right from the beginning and pointed me in the right
direction.
The real bug is in KWin: on a sink disconnect it keeps the output
enabled and never commits the disable, which is what left the TC PHY
wedged (the no-signal state with all the VMM7100 dongles and the TB4
dock).
I have a KWin fix running here that I can confirm resolves the issue
entirely, verified across all the scenarios that used to trigger the
wedge, and I will submit it as a merge request to KWin.
So please consider [1] withdrawn.

The patches you meant are now on the lists:

[2] drm/i915/dp: Fix FRL rate selection and deep color for HDMI sinks
    behind FRL PCONs
    https://lore.kernel.org/r/20260610174413.5881-1-alexander.kaplan@sms-medipool.de
[3] drm/dp: Avoid RBR on Synaptics VMM7100 PCONs failing channel EQ
    https://lore.kernel.org/r/20260610174807.6231-1-alexander.kaplan@sms-medipool.de
[4] drm/dp: Read the PCON max FRL bandwidth only for HDMI DFPs
    https://lore.kernel.org/r/20260610174819.6258-1-alexander.kaplan@sms-medipool.de
[5] drm/dp: Service the CEC tunneling IRQ flags without CEC_IRQ in ESI1
    https://lore.kernel.org/r/20260610174833.6284-1-alexander.kaplan@sms-medipool.de

There is also an unrelated ALSA fix from the same machine:

[6] ALSA: hda/hdmi: disable KAE for Intel Panther Lake
    https://lore.kernel.org/r/20260610174834.6301-1-alexander.kaplan@sms-medipool.de

If something in there is not correct to spec, I am glad about a
pointer in the right direction.
Which ones you let through CI I leave to you.

Thanks a lot!

Alexander

[1] https://lore.kernel.org/r/20260605212837.4265-1-alexander.kaplan@sms-medipool.de

