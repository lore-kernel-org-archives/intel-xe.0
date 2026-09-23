Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9ADCC98317
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 14:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBF710F0BC;
	Wed, 23 Sep 2026 14:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="EbJlCfu1";
	dkim-atps=neutral
Received: from mail-vs2-f26.google.com (mail-vs2-f26.google.com
 [74.125.227.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3965510E052
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 04:14:15 +0000 (UTC)
Received: by mail-vs2-f26.google.com with SMTP id
 71dfb90a1353d-5c67e529da9so234210e0c.2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 21:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1790136854;
 x=1790741654; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bOPldxKk7+mRW3zFHHInuzu1Tjp600CWMyEZdszoKso=;
 b=EbJlCfu1hgMTgVfzqFxBNCTQ2qdzwQwVdqi7UAewGB+w0oaxKlory0DdvqkGZ+bcye
 4r4bXp4cfKl9c7nosRkEaHRnXETDtn504zwwUxEV5ErFOtiKm+uzHspJgIQiw3G36v62
 oZ0VN+P20jA/iDJr8qNaw572UwpFU7gChP+wtzfecvh2dmwE8/h/fkQJqs53qUsop8ZU
 T/a3MZ8Yz8wZZzNVJSMtA8H24omrWQynLNv88kGOU37xijJ+cY+Zc20Z3tzifhxz2C+J
 ERju67sxu2Ky/WX15nbyf6FZP8dksxY6MORPrp90xyJJUm1GK8zyBUWnePUxsb8BZDeG
 dJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790136854; x=1790741654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bOPldxKk7+mRW3zFHHInuzu1Tjp600CWMyEZdszoKso=;
 b=VKqkWnsu8WNHeYAbV7fw9lQ7/erJt2CGXe8BTaCW73YLVZIjin3IoZuz/sBsiIczQ1
 BsIj1za/iXHXOPjPy61DkpkaSsR5tFEkFP3HjIrz3H7R5ER4IwBdOrs47HH/YhqYC90A
 UQ98ZRySNty2Ze08OaMqocvH9ykDT93hM5wCedwhoifBBlPz0YHaGkjBpNF8LaWpwNsW
 xN9nTJIhrsfgSci7P+41fbSfciUMWI24zMkuszIA/U7qQsom4H3pNL6U3xki0nJZ2Ni0
 9tKV66V74iHB4m7p9MNJRlyz5Mjst1C01DGeUsGuH95AhYsJPz0k14RBk/O6e5XeaBqZ
 GU2A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxjc4H65fKAGYPJPnxMB1U9ZiPbkxe55I4Tki53nJHPHWyiDYPyBN0VGvOWWmsZalYm8lgw1tRXg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++ms99LPXeMTv/N7UDgBqkohCasvLaz4o1Qzicrs3RJ7pE6cjSeX
 MrrtWVM15XN69mq2Ed/Ej1xh31sZjph4uVhayVcvigpJWzob2vo0pdWc+Xina1GAyB4=
X-Gm-Gg: AYBFou0WI0b99ZQw0nR6HTJ1cjcKrfG/gVKzLdGaTmacAPr6zMIQHlQGIwJQX7t8C2s
 LM3SF/uhli0nNYzC9CTaAfwOodKw///6j7ZOiAR+mot61oakOQ/BjwsKrl9zcddrDYw7EfIozJW
 E22MiQFePIFccj8z4NTQGbcOb1h1eonE/LI0gLCweIZWB59fPtFKHSSvbXY+8329qwTBswBcVuF
 yfT7sr3GgTQW5O81fRAgXnl+UKMyjryRKOrAWe3dAmNUm6xXWSi9aJDMUzVT4xee+5Z5Z14nisU
 4RH/JrVhAJWoTypk0QFbmfd0PfGa1Oo2YQtC2fhFjwtyWLK1vV7U8kUIhix6ujzo2zeofFxGoNV
 Sp64MJTQvK0n3EmszB0WkRUaC7rWdc1HzPg7s7dz5VXLz2/qdPF+yVpYs4I5XB4Qb0q/k+KneER
 aY1nFDpq0PzQpwUvEYxSdCZ+ew1rSOrLmtGwyqWillunVBahJRpXc2I6bFOy571DIYKYGRBsY+q
 elLuQIRa21WU+NQccGYScJzKScdeHcbQX7qS1QUzwpHSJ0g498Df+FicaP4hsyO6jNKpfWpWicG
 zeF2r179sHxFkFfb1dw6KVRJY7T34WGIbgHNBZTvZ3pF57ZQK87n
X-Received: by 2002:a05:6102:3ec3:b0:7a1:f7d2:e839 with SMTP id
 ada2fe7eead31-7ac1da2381bmr1499378137.25.1790136854075; 
 Tue, 22 Sep 2026 21:14:14 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::12ac])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7abf5c6d7b2sm2564818137.8.2026.09.22.21.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 21:14:13 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, animesh.manna@intel.com,
 ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Wed, 23 Sep 2026 00:14:11 -0400
Message-ID: <20260923041411.2147282-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907202337.152269-1-j@metarealtyinc.ca>
References: <20260907202337.152269-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Sep 2026 14:17:53 +0000
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

This thread did not age well. I spent a week chasing a freeze that my
own patch created, so please file most of what I wrote above under
"learning experience". Here is what holds up.

Short version: PSR2 works here at stock, and Panel Replay works too
once one bit is fixed (patch below).

PSR2: the SU_STANDBY park was self-inflicted. My fast wake patch (fast
wake 12 lines, above the IO buffer wake of 11) stops every selective
update after entry. Jouni was right that io >= fast is required. An
unpatched CachyOS 7.3-rc4 kernel with xe.enable_psr=2 works fine here:
after each update the sink goes 2 -> 3 -> 2 with last SDP 0x29
(SU_VALID), a damage band at y=600..799 gets per-frame selective
updates at ~120 and ~24 fps (one Link CRC flag and one SU per update),
the sink test CRC is deterministic per image, and 15 s of desktop use
gave 291 captures and no resync. The fast wake series is withdrawn in
its own thread.

Panel Replay: my early "PR freezes in every variant" came from turning
PR on through a psr_debug fastset, which never programs PORT_ALPM_CTL,
so the sink was never woken. That was my test method, not the driver.

Also retracted: "PR is the same failed-wake resync loop". The Link CRC
flag does not mean a failed wake: the sink stays in PR active (0x2022
= 0x02 in every poll) and never resyncs.

With the DA16260 quirk removed locally and PR entered by a full
modeset, PR SU with Early Transport delivers every update: sink test
CRC at ~120/s, CRCs identical to PSR2 for the same 125 images. The
desktop stutters though. Not a freeze, just a low-framerate feel much
like the original quirk reports, while the source flips at a steady
8.33 ms (1434 of 1437 intervals over 12 s).

The cause is one bit that source and sink disagree on. The sink
supports async video timing in PR (0xb1 = 0x20), so the driver sets
PR_ALPM_CTL[AS SDP Transmission in Active Disable] (PR_ALPM_CTL =
0x11) and stops sending the AS SDP in PR Active. Link training still
sets FIXED_VTOTAL_AS_SDP_EN_IN_PR_ACTIVE (DPCD 0x107 = 0xc0; bit 7 is
MSA_TIMING_PAR_IGNORE_EN, set because I run an EDID override with a
20-120 Hz range). So the sink is promised AS SDPs that never arrive.
As far as I can tell nobody had spotted it: Panel Replay on these
machines was quirked off before that bit was ever set (38a7e9bf69bd,
v7.2), so the combination never ran here. It also means I can't say
it explains the original quirk reports, only that today's symptom
looks the same.

I tested both ways of making them agree, with a local debug switch
and a full modeset each time:

- keep the AS SDP on (0x01 / 0xc0): smooth, but 0 DC5 entries in 30 s
  on a static VT (no compositor, 1 update/s)
- stop promising it (0x11 / 0x80): smooth (but see the PR entry
  issue below), 550 DC5 entries in the same test

On the KDE desktop neither mode reached DC5, because the compositor
keeps vblank interrupts enabled; that is a separate issue.

The patch does the second, rebased on drm-tip including the AS SDP
skip frames case:
https://lore.kernel.org/r/20260923041342.2146450-1-j@metarealtyinc.ca

What is left on PTL: with the AS SDP off, the sink can come out of a
PR enable locked to a bad phase. Here it showed up after the screen
blanked on idle and came back (DPMS off/on, so a fresh PR enable):
straight from smooth to stuttery, no gradual drift. A manual 1 s AS
SDP burst (PR_ALPM_CTL 0x11 -> 0x01 -> 0x11, written live) made it
smooth again right away, and it stayed smooth with the AS SDP off
again. My guess (not proven) is that without any AS SDP in PR Active
the sink picks its refresh phase at entry and never re-aligns.

Xe3p_LPD (display version 35, Nova Lake) has a hardware way to keep a
periodic AS SDP going: AS SDP skip frames, PR_ALPM_CTL bits 27:16, one
AS SDP then N skipped frames. Upstream added it to reach the panel's
minimum refresh, and it is behind a debugfs switch for now. It would
also cover this case. My manual burst is a hand-rolled version of the
same idea, and it worked. I also checked whether PTL has the field:
writing 0x0fff0001 and 0x00050001 to PR_ALPM_CTL both read back
0x00000001, so those bits appear not to be implemented on display
version 30.

So a question for Intel: how would you like PTL handled? A short
software AS SDP burst after each PR enable (and optionally now and
then while PR is active), keeping the AS SDP on for such sinks (which
costs DC5/DC6), or something else? Locally I'm about to test a burst
about 2 s after every PR enable. I'm happy to implement and test
whichever you prefer. The DA16260 quirk removal will follow once that
is settled and tested.

One thing I still can't explain: in PSR2 and PR (never in PSR1), the
sink sets the Link CRC error bit once per update (DP_PSR_ERROR_STATUS
in PSR2, DP_PANEL_REPLAY_ERROR_STATUS in PR). Under PSR2 it latches
even with no AUX traffic from me for 10 s. PSR stays enabled, so the
driver evidently gets no IRQ_HPD for it, the sink never resyncs, and
nothing is visible on screen. Is that expected for this TCON?

The gitlab issue has the same summary:
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119

Thanks Jouni for the patience and the reference trace.

Jake
