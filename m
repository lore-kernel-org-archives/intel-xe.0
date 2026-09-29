Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D20CA5FAC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 12:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF30F10E96F;
	Tue, 29 Sep 2026 12:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=trailofbits.com header.i=@trailofbits.com header.b="cyuIbM5N";
	dkim-atps=neutral
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com
 [74.125.229.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32E610EC69
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 03:17:33 +0000 (UTC)
Received: by mail-dl2-f12.google.com with SMTP id
 a92af1059eb24-142dd046b87so2675275c88.2
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=trailofbits.com; s=google; t=1790651853; x=1791256653;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FsP2Z39yDHYgidPq7LJCuoklm/2VErUU9c6HnTD+Pa0=;
 b=cyuIbM5N25lc9nM9XWo+Qir6olmu9J8Kd/pL2X1BOfgpPkX4JguOF5xlXFWRz2mWzs
 U4HfxsG9Nc6BQ1OGyzty0DOnP7o2qha7yxC6z2voepWEHdGXcGj5wq5iwcSHuO+nonk4
 pdKFfMD+4WNgLVPY+GeTKIbDEyHYTxyK8OILFjpE3RY9r995195lPT/mcAqafvffwdOm
 oSTLR5ejfIUoDBnJc4Tzdd1jaUCuWlhBWLQBDwQ3/te0zV0Wpd91+FuiDwKI4AjunXoQ
 Oqjx3cvMGhT+APKkbTAFVOIELB0lOKGOvg16gejUOd6qXQTsTrIF+ecfec2kxqX2hm3P
 ax5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790651853; x=1791256653;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FsP2Z39yDHYgidPq7LJCuoklm/2VErUU9c6HnTD+Pa0=;
 b=Dr50sscpwS2OsInWUwdpys2jqWsolGZQpp2y+22YCv/qaDcQKDLbRoaytcL+YfahCc
 CkFwObW4J8N1tvZpNyGzonw8ays9Fjvg3JJTj9GUxT2by9NSBnw+5EGciJPU7pdlvqnf
 aG8sFaNnhREgZPBbQctLUSEOSgLCKLtoRYrdyaYzRClkcmVPpfOjjvD/MpvNdK4m5Mac
 V/GgYt3kM7WaPJrZOXznyBc3gWbN23Doy3qo6c3+oqfc5aR/ajSgr/TSz/1EZBgt9Ub8
 5dpDtui5nzllgkrDzyHOtHZ4wYGOdXNUgpV2+UQ3nk0TYmgmXqu3wyfLflrwsvQjS2sF
 H4jQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzawAbn+Rk6mqPVpnnWJe3kwmvSkalXyqShfWkELShX12WH5ov7B60VFgL9YkSqO6fdoo0qJD30NA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kAqJSWUCX7hcHwW3HWN516vctkenvk4T++aUmZKGIDh6l1CVq5
 9eI/e+IPD855dqxCHtZyvLA821BPcPpTYjvHnT7mSEaEeQ3/f5CuB8NVdWZ9rOKM794=
X-Gm-Gg: AYBFou3BhUpYr31TLvKYLMRSrIW6PltzvvyUZtBVVVGh58w8Of5KmvSBYttfiaOwElO
 6ALQ/Dzu9mGCM2DSLWZLVR6QBUs5ft64GBOT4n33L+C1xa+SRG91mtpAvaxp+3ECQiSmBgL9V6d
 pe5A2RNpDcvXPQ8suUatBB1kM25vs1HVmkfqGeozEq1Jzkp/s2EynvpWXPns5iYmK+OXtcHdVA7
 fYaMOXvKKNUsiDEfFo+ke/YD+jXF7QomV92vGzWX5MRTMCE2A9X11FjON73Avzes6BLkzfCF7Rt
 1hq5EhJOwd2uBDfoUrrR5qqXMbH9BAMdvaTTfmEwcwJIYbGTLN5xANfgV/OZ+6npG/RV8dkTy6c
 LrXGU5sI3sEojF9cKpU4g8T8Hvr4vEnobxg2HiM+teV795BdK7Lx81LytpO0LUGllA6kT7dgcQh
 D9znjK0UZFawD86NXdDyGCpaAecoM5LdzH0s6y8VXtPYMNzbWmzjQEv7GAUgY3ZydX9wkFVI13E
 sGo/47u/JedWYLcL6DrsakKs1MFZVPY3PfBaA/wk8XK9POoUUAHSLdWFLqOYWEZ5oo/aoxq/CRR
 AcAK4Q==
X-Received: by 2002:a05:701b:21c7:b0:143:46a6:b01f with SMTP id
 a92af1059eb24-146cfec8e21mr13180519c88.31.1790651852851; 
 Mon, 28 Sep 2026 20:17:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2603:8001:5f01:8bab:3481:cbb6:f339:9e4e])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-145ad9e097fsm31321186c88.13.2026.09.28.20.17.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Sep 2026 20:17:32 -0700 (PDT)
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
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tursulin@ursulin.net>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org
Subject: [PATCH 6.6.y] drm/i915/hdcp: Add encoder check in
 intel_hdcp_get_capability
Date: Mon, 28 Sep 2026 23:17:26 -0400
Message-ID: <20260929031728.88004-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 29 Sep 2026 12:54:01 +0000
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

From: Suraj Kandpal <suraj.kandpal@intel.com>

[ Upstream commit 31b42af516afa1e184d1a9f9dd4096c54044269a ]

Sometimes during hotplug scenario or suspend/resume scenario encoder is
not always initialized when intel_hdcp_get_capability add
a check to avoid kernel null pointer dereference.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240722064451.3610512-2-suraj.kandpal@intel.com
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
Hi Greg, Sasha, and drm i915 maintainers,

I am working through the small CVE backports still missing from 6.6.y.
This one addresses CVE-2024-53051. It rejects the HDCP capability query
when hotplug or resume left the encoder unset.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.
The code change is identical to upstream.

Could you please queue it for 6.6.y?

CVE: CVE-2024-53051
Upstream: 31b42af516afa1e184d1a9f9dd4096c54044269a

AI assistance: An LLM helped identify, adapt, and validate this backport; I
reviewed the resulting code and validation evidence.

Thanks,
Artem Dinaburg

 drivers/gpu/drm/i915/display/intel_hdcp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index f377c4484e1857..f7987fb90bb1ac 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -142,11 +142,16 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
 /* Is HDCP1.4 capable on Platform and Sink */
 bool intel_hdcp_capable(struct intel_connector *connector)
 {
-	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct intel_digital_port *dig_port;
 	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
 	bool capable = false;
 	u8 bksv[5];
 
+	if (!intel_attached_encoder(connector))
+		return capable;
+
+	dig_port = intel_attached_dig_port(connector);
+
 	if (!shim)
 		return capable;
 
-- 
2.39.5

