Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E361BCFA749
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 06:49:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2C510E84C;
	Fri,  4 Oct 2024 06:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="ZdrmEM93";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EcI/VHP0";
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C6810E246;
 Fri,  4 Oct 2024 06:49:55 +0000 (UTC)
Date: Fri, 4 Oct 2024 08:49:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1728024593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dq1TgVDHWXNn6/NO62mgaZz0wH4NS8DnE+Kca0Vo1sk=;
 b=ZdrmEM939Rmvm3zI7yAhGpx7w8VseFnbpw6n4qexy89FFbnjttKgkGtSK2DIndCMyDjogx
 jq7zFkT2No03YuFvlveqBP/6krJ4H7toQ9pBXjFYaanaMibUA93CewC4VPwxnp+6T6gOaf
 EkeForzLbwjdBoR9to4BNfhWKCnwcjCI1zR5x1lZYv3M1TedyDp+PqEGovxzGvcsSuJwaQ
 EKBGuSRghZRsjUqhJM8jcBDMz1jijoiGHpdfJxL3zjJcjkS//Y4O7wVaCPR2wQNMGXfvnc
 HqPbH3bRR5dpJEghbMMHWeI6aq8MVYrimFORAaB4mgDcAtk0tbdeuWCbFNkhRA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1728024593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dq1TgVDHWXNn6/NO62mgaZz0wH4NS8DnE+Kca0Vo1sk=;
 b=EcI/VHP0ZeKhHI5sAv4gzQlAVKD7NB/I2J5zkU/XqLXEI/DrAivD7LA1KP177Pm00tyBlb
 cQbFJcWbqy6b48Bw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH v3 0/8] drm/i915: PREEMPT_RT related fixups.
Message-ID: <20241004064951.XLw7TFbS@linutronix.de>
References: <20240628130601.1772849-1-bigeasy@linutronix.de>
 <20241002162543.TKbd-8g0@linutronix.de>
 <Zv17oKlIImyfg_KI@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Zv17oKlIImyfg_KI@intel.com>
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

On 2024-10-02 19:58:08 [+0300], Ville Syrj=C3=A4l=C3=A4 wrote:
> > These patches were not picked. Did I forget something or was this just
> > overseen?
>=20
> This looks quite poorly justified. Eg. you seem to be now
> leaving interrupts enabled (and even preemption enabled I
> guess) when we're racing against the raster beam. On first
> blush that seems like a recipe for failure.

I can't really parse this. I may leave interrupts enabled in vblanc code
(the first two patches).

> First step would be to set CONFIG_DRM_I915_DEBUG_VBLANK_EVADE=3Dy,
> run a bunch of tests that stress the display stuff (eg.
> kms_atomic_transitions and other stuff from igt, and also
> some real workloads) and probably throw in a bunch of
> other load/perturbance at the system to make life hard.
> After the system has been sufficiently hammered one can
> compare sys/kernel/debug/dri/0/crtc-*/i915_update_info
> against a baseline. Bonus points for doing it on a potato.

So you have a specific test for me to run?
=20
Sebastian
