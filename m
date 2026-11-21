Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D6F606A32A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=FfmB5qsl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227EC10EF14;
	Mon, 23 Nov 2026 15:17:45 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9185110E3D8
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:54 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-93f269e335eso229320385a.3
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263953; x=1795868753;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=88WlhqINmeA19hZX0Kkh5qux5XPACGYh+siXk+w/DT8=;
 b=FfmB5qslI7lR5JT53IQbM7oYgX6wqbjb1OMCNuWY+yiiVQC5gvgFJto9bxLTyu8TYv
 ubB09+n+tUsqkLCVSm14M7rV5NWHImKHSG+8TV7JiP3MTSCFFnMfEE20Ea3As/Z/hwYU
 phDDtEp725wISLqL6hvAn9nUIj2z/rrKU5cx5i3myC4IVoXNYR+ubnLjuiwz88C0AYm7
 Ece8mys3aflAFLR1p2ZYlCEvR+fSBQ/pF2bOUjju/V6Pc0Mqn7hSwbB8HOTR9SPjDyUo
 UHMLxOSIL4YlGTH2AUm85uyspDwTnQKzORVWG0AFVLaHayMWQgKZlyXSZ+knwh5kQ2uY
 oyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263953; x=1795868753;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=88WlhqINmeA19hZX0Kkh5qux5XPACGYh+siXk+w/DT8=;
 b=yRTiprSILNXe69z3ZEzS1bIkelqNj8vtCOT+39ibZflWxIix1hnCp46r4E7kO1Uqiz
 BNt+/BR8bFnANVkaw8HSlUa23gT+Vmnwz0bQcaxlahFzfyBFKGz1KYG600BEQUug+hm5
 KM8uQtH6ToXJt5RJe6fLILv8eBpRQkeaDKHg0O2Pf/gt1NbJI21q/UUzyd+NuFmf4A88
 WFIgPEXTimdkXNVXGW7HkRvhPWRDh9GridwDE41W3sUY14WjdCbkrnr5EfTlcbZkUi7Z
 bDJ6gH1MGFyahAD5VduIO3t+i5viIOOFMiNt9h7L9GNMOKHb0to4XHpPInRlsBgsyeBK
 q5xg==
X-Forwarded-Encrypted: i=1;
 AL+hErFbzSGknWO5n2veu8GAIG2t5myZ/wGrCcYvywrm9cEnbvKHKNV+hfPM7mDSJ+pZfKhk6yMD7C5e1Q==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/Og1XA3G7miiaIVkfWlLPA/Leg6DluM9w6rnFIpknFvtPDTqIw
 YVoll81NGhbEgfcbn+hbxnEGSMmsEk1c/tJmVKyPY6LWXL1SNNT2syyTMG7XDHqmpJ8=
X-Gm-Gg: AZFdTZfCY9XQAn0GE36dE3CyI7ZA210dPuzhxdGz5hP3s0NXn5pW7+Xka4QfjPnODDh
 QXUZ55T72qwMlAfZxrjnr7WXqga/tC1yINA/G+Y9hHZ5shvZWaVuhdNYWe5JAozbQk0DhBL8cCd
 k9+kOAfutjXjzUlqXBzgjbJKNZg5oZIwlwagtwcP4vz2IPnoKyZedXHodfwCImIorDoCUVinBSc
 suPbEljX0oaD1FnBvPh0vMY8LZaddIOVPmox397TheHXgESXHbBBjSKHYi51ZYuJezlcDqihe4a
 hUgMyvQITSdj/jWMk6tuc5MjwdY1gKdXzUlc0OoDmg8DXilGwlL+RqywnTwdeoFquLWq2C3mOiN
 iV6GheKeEu8pZF26NmB+W3QEaRzA6NwHEozDZsVLAjZnV5d8ORoo4opF+Jf30TXXLulZg4IJdIJ
 I+qE7iD6XIvp04Kr+FgEyr/sZZfEQ5zN+67Ws99IA3b7JB8dV28Z8PgZq1ZJ0Fr07LtYKI5Sopv
 aqOuYNpF2cEZgq+UlbqMLkSzOBZeRF7myX802Vmm289D1IDJ4xWQNjeqgQ7X9vFP6VxiKEsLqy9
 0cfr+mJ4e2UKGxljonO5eqOaEx/dsIxB6VwrRjFxJKyPZx5dGUQggGYTZOTWCo9DO5vkHsPlw/N
 BiGHOLDTzvv8PH/qy/YHeyrZ0+NBHVXRP0+ln95D5u/dZo56kCv9u/Zf1R40VQkImm+ks0tCy41
 04+c/rWDc5jRZ16HiXywOPWKmnl4YSFqfshIsQlDVzFcaN+pyMHcUcAJf8HnJe55sTUshmb4gke
 RNexXvc
X-Received: by 2002:a05:620a:710d:b0:93e:c12c:fbc4 with SMTP id
 af79cd13be357-949bab6939amr1001886485a.81.1795263953266; 
 Sat, 21 Nov 2026 04:25:53 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:52 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 0/4] drm/i915/psr: Send the AS SDP in PR Active while
 frames are updating
Date: Sat, 21 Nov 2026 07:25:46 -0500
Message-ID: <cover.1795263689.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <awCCGeCxHToY8tsI@intel.com>
References: <awCCGeCxHToY8tsI@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jouni, Ville,

v2 of the RFC, split the way Jouni asked. Following Ville's comment it no
longer depends on vblank interrupts. A frontbuffer flush (flips, cursor
updates, frontbuffer rendering) clears AS SDP Transmission in Active
Disable, and a delayed work sets it again after 6 idle frames, the same
idle time DC3CO and DC5/DC6 use.

Tested on 7.4-rc3 on the Dell XPS 16 DA16260 (PTL, xe): Panel Replay SU
with Early Transport stays enabled, scrolling is smooth, including after
a lid close/open, which judders without this. DC5/DC6 is still entered
when idle. Rebased on drm-tip and build tested there (W=1, i915 and xe).

Changes since the RFC:
- Trigger on frame updates instead of vblank enable/disable (Ville)
- New intel_alpm_pr_as_sdp_in_active_disable() helper (Jouni)
- Drop pr_as_sdp_follow_vblank, do the checks in
  compute_disable_as_sdp_when_pr_active() (Jouni)
- Stop setting the bit in intel_alpm_configure_pr_as_sdp(), which also
  covers the seamless VRR toggle case from the RFC (Jouni)
- Remove the DA16260 quirk, add Fixes and stable tags (Jouni)

Jake Steinman (4):
  drm/i915/alpm: Add a helper to suspend the AS SDP in PR Active
  drm/i915/psr: Send the AS SDP in PR Active while frames are updating
  drm/i915/alpm: Leave AS SDP Transmission in Active Disable to PSR code
  drm/i915/display: Remove the Panel Replay quirk for Dell XPS 16
    DA16260

 drivers/gpu/drm/i915/display/intel_alpm.c     | 30 ++++++-
 drivers/gpu/drm/i915/display/intel_alpm.h     |  4 +
 .../drm/i915/display/intel_display_types.h    |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  1 +
 drivers/gpu/drm/i915/display/intel_psr.c      | 90 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_psr.h      |  2 +
 drivers/gpu/drm/i915/display/intel_quirks.c   |  8 --
 7 files changed, 126 insertions(+), 14 deletions(-)

-- 
2.56.1

