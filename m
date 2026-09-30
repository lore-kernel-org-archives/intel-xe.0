Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E45CA5FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 13:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E5210F411;
	Wed, 30 Sep 2026 13:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="Gms8TNCE";
	dkim-atps=neutral
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com
 [74.125.229.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD6C10E930
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 01:03:34 +0000 (UTC)
Received: by mail-dy2-f43.google.com with SMTP id
 5a478bee46e88-34b3e517e6dso658755eec.1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790730214; x=1791335014;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=k02DnUfueq2SXs3UXLyiifb3Iga2OW/KGZeFQEVs3F0=;
 b=Gms8TNCE2XMQs1rpfPQDMDNSl4FU5LIhmB1wyXJZS3pqxas3taX7xei8zvLelk5Z2n
 ImksXDgNCU6mUYzZ2swnJ39wMAiTEQ+D90EM5XUiFZKXtyJGsXIG7CCjsuXktHbK+k4c
 eaps5FcLR7qjBJydEFuwT3nFCQe7hQV+9CvAntOo6PZC8JNG7TMVDYYXvP9o5NUwxrCT
 YiWcNAn2nUa0d9XzTaubhoR27ybyvcWZqB7R8qeU/rl2/B91kGY2/zPMvkX0FTgCPEUW
 4H+XGl+iKM6K12aMDfPVQz7kr9emNm896VYwXarhs+S7J6EPVeliiiwLJOoffWs9YR9/
 /srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790730214; x=1791335014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=k02DnUfueq2SXs3UXLyiifb3Iga2OW/KGZeFQEVs3F0=;
 b=VLOk3HLlBO5RFaXTCuIxFppFDc2YXXbRz3nDXIuzJ1IFkPIXUrwZTRT0vFo8fRzTg9
 Nrf93cx99k9xHGzE4agINR2dFJYfvfj3lzhs5rPYHYwLilumPnWtQy+3rqHCb0BPK8f3
 uxT6FGTgDYeFx48iwVqR6DBLDTRsdLHIB6rNG1ZGQmTtNZWjLHb79CxohEHmA1qOdwv6
 z7nUpGpBWpNg3jGaED8H1KfA5YS0F+7qWkeeKAL+7zBG4ewpCsFhFPXfBQ6dWslmxjel
 MlgyKxPENfSc/A8rynG2qggoedbAZO3cylOHUGnYjpMD0F4jGfQpt3bK8I49JsIr3qFr
 07eg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw9Xkv4+wTYcLrUXYZNLq1MtAxl9a6/WxXteyfDE8YFNMLjW0JPB41LguXRykyjrkIzcFSURYb+qw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mU0DRPb/WC0X1w9u1EKwhiLipbVyVd1+mfgQQ1wEf32MQldQVN
 JAYRDLomDCML41npkOpOpjMmav2/eEopDKjqlYd4bTOKRpiPJ4WHl6j8OZVdQeubOwU=
X-Gm-Gg: AYBFou07Tirfg/ycmOqJBsHkebIXLD9bsVgVe7o0rDaygvv0sQwE3F+fSu6bp2BP1KL
 5EO0pSPh4NUIfQGHUX6beqrRXfSpiMB4BGhiZzbjtmTD9R2LRqCSqcKrAdgIUOWrTZG7JyfIOcL
 1mjQ54er9HD+6J4pqnbJ1TSWUQrmjyJMzYcwInCfKsn5l5Q3R0YUUzF5eLYJmxpVNcrY2f72Yik
 6gbFAwrGDm0jmKtpOvVd8Np+mPcgDDZnUupG88wII1D0JtHTkPR3qEC7r8s7qJRHFYesKskzKYU
 2oEz7ADl6D9pIelE3vOoHCl2RseGks9KMrk7t6XuETfTUdNhqDeQZoiegY36cMNt1BTVc81fCVC
 LpBELoTLBur9BPkvTiozhP8ZubUz4m9LJtnVYPzfdlPCr3v4MBqEiiIzFWt2XPeok+6YMWYQOHf
 njqpZZ/N7J1M7h3qJvXbT7E02R3/sop/pW5Ka0vtFnZEHrT+U9wIR0U4Do/gM/Xqc/VsgravjBY
 vRROW8tN5yCl9KC6dA4+Vzmpi1pupBp4bjMeC+qIKpISBgZSXNKqv2E0gocz11RD/AyL+I=
X-Received: by 2002:a05:7301:4e46:b0:33b:f5b7:f4b3 with SMTP id
 5a478bee46e88-34c646ce08emr1028241eec.27.1790730213667; 
 Tue, 29 Sep 2026 18:03:33 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34c386c2723sm2179993eec.18.2026.09.29.18.03.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Sep 2026 18:03:28 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y v2 0/2] drm/i915/hdcp: guard both capability checks
Date: Tue, 29 Sep 2026 21:03:19 -0400
Message-ID: <20260930010323.93999-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 30 Sep 2026 13:48:38 +0000
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

Hi Greg, Sasha, and i915 maintainers,

Thanks for catching the second dereference.

The code in patch 1 is unchanged from v1.
As Sasha pointed out, on 6.6.y, however, intel_hdcp_info()
calls intel_hdcp_capable() and then intel_hdcp2_capable(). Guarding only
the first helper therefore moves the debugfs NULL dereference to the next
call.

Patch 2 adapts upstream commit d34f4f058edf ("drm/i915/hdcp: Add encoder
check in hdcp2_get_capability") to the older layout. The 6.6.y tree
predates commit 130849f8ec14 ("drm/i915/hdcp: Use intel_connector as
argument for hdcp_2_2_capable"), so its dereference is still in the common
intel_hdcp2_capable() helper rather than the DP and HDMI shims. The
adaptation puts the encoder guard before that dereference and returns
false through the older bool interface.

The CNA record for CVE-2024-53050 starts its affected range at 6.7, but
that range follows the later shim layout. The same unsafe conversion is
already present in the common helper in 6.6.y.

Together, the two patches make both debugfs capability checks return
false before converting the missing encoder to a digital port. Both fixes
entered mainline before v6.12, so every newer supported stable tree
already contains them. The same common HDCP2 dereference is present in
6.1.y and needs separate handling; this series is only for 6.6.y.

Could you please queue both patches for 6.6.y?

An LLM helped adapt and validate both patches; I reviewed the resulting code
and validation evidence.

Changes in v2:
- add the adapted HDCP2 guard identified during review;
- send the two guards as one series because both are required for the
  debugfs path.

v1: https://lore.kernel.org/r/20260929031728.88004-1-artem@trailofbits.com
Review: https://lore.kernel.org/r/2026-09-29-daily-reply-0012-re-i915-hdcp-encoder-check-v2-6-6@kernel.org

Thanks,
Artem Dinaburg

Suraj Kandpal (2):
  drm/i915/hdcp: Add encoder check in intel_hdcp_get_capability
  drm/i915/hdcp: Add encoder check in hdcp2_get_capability

 drivers/gpu/drm/i915/display/intel_hdcp.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)


base-commit: 79643295eba17affbd16ca97f3ef04c90266b28c
-- 
2.39.5
