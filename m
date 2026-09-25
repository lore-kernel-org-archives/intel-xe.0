Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61828C98328
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 19:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AED892D3;
	Fri, 25 Sep 2026 19:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="GgtfJyaw";
	dkim-atps=neutral
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8985B10E267;
 Fri, 25 Sep 2026 11:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Type; bh=z4hkkRRKW1E7uVGUfwXwJj7pLLu1TwVC34LiVs2V4kI=;
 b=GgtfJyawQb+1M5k+6hIY2Jexr1dS65c3E8uR/oAFEcDqX1iOVzkXwUF9Gt/4VH
 8ahZJJqNgpltPpPdNg67U7KAjYA9Q3M9H9n+ddVaFfkSKXLFQ07AkFOyqVi9HdcA
 Da8TurJ5nN66TPDe0w6q2F4/F2j93PlJ20esMSW0sh1XM=
Received: from fedora.localnet (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wD3X5wWWrZq6g4MAw--.51223S2; 
 Fri, 25 Sep 2026 19:25:11 +0800 (CST)
From: "xizheTang2005@163.com" <xizheTang2005@163.com>
To: intel-gfx@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/vrr: Use vrr.in_range to determine if we
 need the AS SDP
Date: Sat, 26 Sep 2026 03:23:32 +0800
Message-ID: <RxSA9gIRRBSaKwxlF7t96Q@163.com>
In-Reply-To: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
References: <20260923164321.9230-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CM-TRANSID: _____wD3X5wWWrZq6g4MAw--.51223S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4fXrWkGF17AryfJFy7Wrg_yoW8uF17pr
 W7Gwn5ta1UX3yku3yxZr12gF1F9wsrXw48Wwn8GrWIvFyDJ3sxtryfAr4aga4UCr1xAF10
 van7X3srXay0grJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j54SOUUUUU=
X-Originating-IP: [2001:250:20f:1:a533:cf01:13a0:45f8]
X-CM-SenderInfo: x0l2xvpwdqwjqqqvqiywtou0bp/xtbCwRnkPGq2WhlwJAAA3L
X-Mailman-Approved-At: Fri, 25 Sep 2026 19:10:48 +0000
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

I tested this series against #9252 (applied by semantics on Fedora
7.2.7-200.fc44 xe; the distro tree did not take a clean git-am).

Machine: Lenovo ThinkBook 14 G8+ IPH (21VG), Panther Lake
8086:b080, eDP.

The boot / resume full modeset still shows vertical corruption.
With Adaptive Sync = Always, a lid s2idle resume is sometimes
clean and sometimes leaves a persistent streak (same policy,
repeated resumes). With Never or Automatic the streak appears
and then recovers on its own. Userspace fastsets on an
already-lit panel do not show it.

intel_dp_needs_as_sdp() now returns crtc_state->vrr.in_range.
That flag is set from intel_vrr_is_in_range():

  intel_vrr_is_capable(connector) &&
  vrefresh >= monitor_range.min_vfreq &&
  vrefresh <= monitor_range.max_vfreq

It does not look at uapi.vrr_enabled / crtc_state->vrr.enable.
This panel's EDID range descriptor is 30-120 Hz, so both 60 Hz
and 120 Hz stay in_range while userspace has VRR off. The VRR
TG is still programmed (fixed_rr, flipline set).

drm.debug=0xe intel_crtc_state_dump:

1) Adaptive Sync Never, userspace modeset 3072x1920@60:

   vrr: no, fixed rr: yes, vmin: 2016, vmax: 2016, flipline: 2016,
        pipeline full: 0, guardband: 91 vsync start: 90, vsync end: 84
   DP SDP: Adaptive-Sync, revision 2, length 9
   operation mode: 1 (AVT_FIXED_VTOTAL)
   requested mode: "3072x1920": 60 390950 ... 2016

2) Same, Never, 3072x1920@120: identical vrr/flipline/AS SDP lines,
   requested mode 120 781886.

3) Never, s2idle resume (lid), 3072x1920@120: same dump, full
   [modeset] on pipe A. Not an in_range readout mismatch on resume.

4) Always, s2idle resume (lid), 3072x1920@120, full [modeset]:

   vrr: yes, fixed rr: no, vmin: 2016, vmax: 8064, flipline: 2016
   DP SDP: Adaptive-Sync, revision 2, length 9
   operation mode: 0 (AVT_DYNAMIC_VTOTAL)
   this captured resume was corrupt and stayed that way;
   later Always resumes on the same setup were sometimes clean

https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9252
https://patchwork.freedesktop.org/series/174831/

Thanks,
Xizhe Tang




