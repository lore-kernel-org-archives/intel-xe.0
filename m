Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5C6CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 02:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182B10E0A0;
	Tue,  7 Oct 2025 02:26:45 +0000 (UTC)
X-Greylist: delayed 330 seconds by postgrey-1.36 at gabe;
 Tue, 07 Oct 2025 02:26:44 UTC
Received: from smtp96.ord1d.emailsrvr.com (smtp96.ord1d.emailsrvr.com
 [184.106.54.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8273110E0A0
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 02:26:44 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp5.relay.ord1d.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 89359A02F5; 
 Mon,  6 Oct 2025 22:21:13 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: intel-xe@lists.freedesktop.org, Maarten Lankhorst <dev@lankhorst.se>
Subject: Re: [PATCH] drm/xe: Increase global invalidation timeout to 1000us
Date: Mon, 06 Oct 2025 19:21:22 -0700
Message-ID: <12755240.O9o76ZdvQC@imeretto>
In-Reply-To: <20250912223254.147940-1-kenneth@whitecape.org>
References: <20250912223254.147940-1-kenneth@whitecape.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Classification-ID: 53bf9b2b-4432-4d88-be45-d2d8de27d6e0-1-1
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

Humble ping - would love to see this land.  Even if there's additional work=
 to=20
do here or someone finds a better solution, it's no harder to use this as a=
=20
starting point than where we're at now.  And, it would help me, and others.

6.17 is out now and my display has been locking up since 6.15.  Would love =
to=20
stop having to remember to boot up custom kernels to work around this.

(Also... I am not a kernel committer.  Would need someone to review/push.)

=2D-Ken

On Friday, September 12, 2025 3:31:45=E2=80=AFPM Pacific Daylight Time Kenn=
eth Graunke=20
wrote:
> The previous timeout of 500us seems to be too small; panning the map in
> the Roll20 VTT in Firefox on a KDE/Wayland desktop reliably triggered
> timeouts within a few seconds of usage, causing the monitor to freeze
> and the following to be printed to dmesg:
>=20
> [Jul30 13:44] xe 0000:03:00.0: [drm] *ERROR* GT0: Global invalidation
> timeout [Jul30 13:48] xe 0000:03:00.0: [drm] *ERROR* [CRTC:82:pipe A]
> flip_done timed out
>=20
> I haven't hit a single timeout since increasing it to 1000us even after
> several multi-hour testing sessions.
>=20
> Fixes: c0114fdf6d4a ("drm/xe: Move DSB l2 flush to a more sensible place")
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5710
> Signed-off-by: Kenneth Graunke <kenneth@whitecape.org>
> Cc: stable@vger.kernel.org
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> This fixes my desktop which has been broken since 6.15.  Given that
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6097 was recently
> filed and they seem to need a timeout of 2000 (and are having somewhat
> different issues), maybe more work's needed here...but I figured I'd
> send out the fix for my system and let xe folks figure out what they'd
> like to do.  Thanks :)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index a4d12ee7d575..6339b8800914 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1064,7 +1064,7 @@ void xe_device_l2_flush(struct xe_device *xe)
>  	spin_lock(&gt->global_invl_lock);
>=20
>  	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
> -	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 500,=20
NULL,
> true)) +	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 1000,
> NULL, true)) xe_gt_err_once(gt, "Global invalidation timeout\n");
>=20
>  	spin_unlock(&gt->global_invl_lock);




