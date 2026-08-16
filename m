Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC801C5B572
	for <intel-xe@archiver.kernel.org>; Mon, 17 Aug 2026 12:39:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A426610E795;
	Mon, 17 Aug 2026 12:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kb6kVHWk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8466A10E785
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Aug 2026 12:12:39 +0000 (UTC)
X-CSE-ConnectionGUID: WK4DYGRlT/GGNuVLZYYEMA==
X-CSE-MsgGUID: jwuqld12QaiZUwjJJb8J1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87297888"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="87297888"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:12:39 -0700
X-CSE-ConnectionGUID: ejCgqMgjQGGRtAs+b5mMoA==
X-CSE-MsgGUID: zmITgrNBRUKYjCiq+Q2VFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; d="scan'208";a="258694870"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 05:12:38 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business
 Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Resent-To: intel-xe@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Mon, 17 Aug 2026 15:12:35 +0300
Resent-Message-ID: <a17c1af219bd034a8e28bab8cbdf6f029e40604b@intel.com>
Received: from fmviesa004.fm.intel.com (fmviesa004.fm.intel.com
 [10.60.135.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5894020BF393
 for <jani.nikula@linux.intel.com>; Sat, 15 Aug 2026 23:24:03 -0700 (PDT)
X-CSE-ConnectionGUID: 1cCWnlLGQ5GHsZ/yTdDVmA==
X-CSE-MsgGUID: 2pj2PG0nRsaL7b9GfoK5+g==
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; d="scan'208";a="266605278"
Received: from fmvoesa104.fm.intel.com ([10.64.2.14])
 by fmviesa004-1.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2026 23:24:03 -0700
X-CSE-ConnectionGUID: gRielQvYTzqVZ+haVi7flA==
X-CSE-MsgGUID: XI3p9hYTSFqo5P67ypF5Jw==
Authentication-Results: mtab.intel.com; spf=None
 smtp.pra=xspeed1989@gmail.com; spf=Pass
 smtp.mailfrom=xspeed1989@gmail.com; spf=None
 smtp.helo=postmaster@mail-pl1-f172.google.com; dkim=pass (signature
 verified) header.i=@gmail.com; dmarc=pass (p=none dis=none) d=gmail.com
IronPort-SDR: 6a815782_XtVTxSlVyPOOz6xuX6TMuh1Elb6+Y0VVs+ktcQJ1qbpze+B
 atuXNXXaOPCyX7i79RVUYY+12izHegd7JqcszQg==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A0FyBgAYVoFqfKzWVdFaHgEBCxIMggULAoFsUxZlbjMEV?=
 =?us-ascii?q?IRYj1KCIYtKMAKMRIVegT89Ag8BAQEBAQEBAQEHAQFPAgQBAQMEOA+ENwKNa?=
 =?us-ascii?q?gIeBwEEMAkNAQECAQIBAwIBAgEBAQEBAQEBAQEBCwEBAQICAQEBAgEBAgQDA?=
 =?us-ascii?q?QEBAQIQAQEiGQcOEimGTw1JAQEBAwcEBQGCAgGBJGECBQM7AQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBBQIsXwIBAyMPAQ0BGx0BAwwGA?=
 =?us-ascii?q?w0PAiYCAiACEQEFARwZgwKCIwEGEAEDNwMBBKgukCuLcYEVBQIWgQGCDQYFA?=
 =?us-ascii?q?wIB2l8KGSgNDWhCgSEBAgIHCQEKAQGBCS4BhHcqXYI/IAGFAnaEAnongiiBF?=
 =?us-ascii?q?YNpgh+COTiDDoJqBIMugkiQTgEHBx8SCAEcBggCAkgLChIDBAMEBAECCxMJA?=
 =?us-ascii?q?wMCDgIIAwIIBhkBPxIEEwIIAwYECwcFHwoCDBQKKCISKwoDNRIPEAYFFQEIB?=
 =?us-ascii?q?gICBAQCBAwCAwYCAgUDBAIEDQMEAQEIAgItAwEDGQgJCAILBREYDAsHMQMQC?=
 =?us-ascii?q?QMfAxQIFAgRNAgGAxMBGgYFBgs3FQUMEQECGwIgBB0RCAMBGwQCAQkDBBYEA?=
 =?us-ascii?q?hQKKAsDAgwCBggMFwICAgYCAwMDCgECCAMDAwIDGQcGAwQEAQQEAwMCAwUBA?=
 =?us-ascii?q?wMDBQICCgYJAQEBAQMCAggDBwMKCQIFAxsDGwUBAgIDAgECCAMHCAMNAwQCA?=
 =?us-ascii?q?wMDBAECAgEBAQIDAQMDBAMBAwMCAQMHAgIDAwMLAQIDAwUDAwUFAgIFBQMFA?=
 =?us-ascii?q?gIKAgMDAwIBAwIcCAMGAxABEAMDBgEDBwMHAgQDCQIIAwMICAMXAwMFAQICB?=
 =?us-ascii?q?AMDCAgEAwMEAgIDDAUDAgMDBQMDBwIEAgQDAwEFAQIHAgMHAgEYAwIECAcHB?=
 =?us-ascii?q?QILBAIIBA0JBAIEAgIPBAYDAwcBAQIBBwUGAwICEQEICgUGAgICHQMdAQMPB?=
 =?us-ascii?q?gEJBQIBBQ4HBQICGAMGAgMGBQEDAQoLAQECAwoBAgQCBQMDAQMCAwIGAwMCB?=
 =?us-ascii?q?QUFAwkHBQ4JAQMDBgUCAgMCAwECCAQGBQMCAgMFAQQDBAMKAwMCCAMDCAMLA?=
 =?us-ascii?q?gIgAgUDAwMDBgMHAwMEAwMDBwcCAwIDBwMCBQIHBQMDBQMGAQMCAQMDCAsVJ?=
 =?us-ascii?q?QMBBQMDAgEDAgUDAxgCAgQFAwMDAwMDCAQCAgEHBgQCAgIBBQUFBAUGAgQDC?=
 =?us-ascii?q?AEBBQMDCw0BAgcMAwwGAwcDAwQEAwIFDAICBAEHBgcHCQcDAgMIAQELBAEDA?=
 =?us-ascii?q?woDAwUCAQEHBQMGAwcCAwMDBQQFAwILAwkCCwkIBwwBPAwHCiQEBAwqARQUB?=
 =?us-ascii?q?QQlGAFnBwcCjhgggkcBWDUKg3ABAQGRbINRAY8QoCFKHQkBBgJhgWeBChUKL?=
 =?us-ascii?q?5tfhXwaM5dTjGmGMC6HZpB0khOXBQIKBwcRJBKBMjqBXDM9gQFtgUkTPQMZD?=
 =?us-ascii?q?1eNSgwWHINEzCY3NT0BAQcCBw4DC4Fog1uCHiGIJoF0gUwBAQ?=
IronPort-PHdr: A9a23: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
 D+6zw==
IronPort-Data: A9a23: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
 wRAKETSyKhIxI69FVFWJcg0F0pNb08x
IronPort-HdrOrdr: A9a23:7uvMAqP9hAjrLsBcTgSjsMiBIKoaSvp037Dk7TEUdfUzSL3mqy
 nOpoVm6faQslwssR4b6La90cW7MBHhHNtOkPIs1NSZLXTbUQmTXfhfBOLZqlWKak7DH6xmpN
 1dmsBFaOEYZmIK6voSjjPIduoI8Z2p9ru3jfzSw3ooYQZhcLF48gt1Yzz2LmRGACdDQbQ2fa
 Dz2iOFnVWdkLYsA/hTfkN1J9QrbuerqK7b
X-Talos-CUID: 9a23:zhOisWyyHPiApheaz45rBgUbIMEodkTD/UvCOnGKSmZgdrzKR1u5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AF5NrMg1miD8lMskpC3pl/Z3KVzUj04X1EBENoKk?=
 =?us-ascii?q?9ldCDaBQuZCaFommVXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="98735740"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; d="scan'208";a="98735740"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by mtab.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026
 23:24:02 -0700
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2cacf197759so34177665ad.2
 for <jani.nikula@linux.intel.com>; Sat, 15 Aug 2026 23:24:02 -0700
 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786861441; x=1787466241;
 darn=linux.intel.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=2+VXnP47ytTguI11i1PKxSzDAJacSIz5jyC8KDUI+I4=;
 b=Kb6kVHWkpgB4vJmO1mYxQpe9KjkZy8OWwy3UPZ8botOXe4h+arJaY6HDCV3KbwATTb
 s6kyZHc6zRdxQHqEUq0EQkArPo2t+LHWoW4Wj3YBe5qQcNI3wMIyCxTqAEtJTUJPZ+/U
 VTfFA1kL/VryuXUEvXl3ebKRJah56eWMaU9M1Y72vFt/7hGO5KgZgy8vLp94fgbXgqxt
 H0PF3OZVo27nszuuqJMw3lmKwphgpcIae3HWxagoqTa8h93psOqb25nL0lwM37ezdHpo
 53tLep1OImTMinvVqp39mvFhqS6R9m1btWPx4hVvOTchGTp/37bo5mxAlbqNnfurCdEE
 DZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786861441; x=1787466241;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=2+VXnP47ytTguI11i1PKxSzDAJacSIz5jyC8KDUI+I4=;
 b=U7z0N9Nl+I1a1MJfitHUP1kWKkroJJ6g5oGWtFeqg+XFYdGIHLvXGEXRW0k29k5Hqf
 LT+b7ganuUKiFTInCzikUEz+uxKFk51mafLhRgYcNWKJnL/Qn11VDu6SIfTxrdvDHfFh
 zvKHE/sw6DzeYUxnwkFGRb9DG2QdefNUMMOmt8ZWHaFQAvz7ro5y0o3ojz4xMd6n0UFh
 fj+Phg8OLXMX2PlqT9v1buLE/Y53QEDqxiNy/QTOhsu4hmV2I3b7vUUHjxfG+ultLsWc
 dJs6kc2JkfwwHfqddeglrWgr3p4Xzt/i7gez6R7qsyJYmhNtRxMDEp2bKSchoHyx666X
 QowA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpZebNoIw63QSqYBlgvm1aV8xLHWmK5JnoAoZV0UfM/QnJz2sDYrSwAQMt9k/Ybr5JrjIZoaIyWKEA4oA==@linux.intel.com
X-Gm-Message-State: AOJu0YyWGdKEb57jSA78dmcrMWt0fS3eq0u2agQ91V5b2ISwvIDmFAB3
 dZEQ2YdDoXCieJB9S5cyonMSsbXYdYQJYe0BxFbi4wUUgdGOX3ReGT49
X-Gm-Gg: AR+sD12x2iyXpGjEnWTRS82Js84bJUKUItSOG/5zVZVTP61CJj/1llkZWHtl0GLcKop
 QA8WmkVuwMc/CEPbf25ekm4wAii29eubW9dPPn8JD1O6764qfP1W5Mh3iNcDJBeKs41v8NpUOtt
 JKTR+0CRq1o9Rfjk5/mpJVKxNxieW4hGpTaIbar0no85IgGt1BHj1avJTp2VaRy26N4eI1ZkWmE
 LhikAbNtdVJEPF0MMX4LYKQoDWQgNcgj1ql8PiR0Oi32Tylv0qjB9zquVem0cyBd/a9quZZY9Tz
 bbPYxpjIu05UvFBP/qs+tLdgIYYSkr7N4bw4i+QZuD1L04xtRzU0qhUnkoMs6w7s+l3hDlZSDf1
 4GvxyCTpNuw7d90HhEcG60e3QPBT0Kd9eapZnA3+nCvmDMwGp34EXKD18I9Kz+91n0iRvxIyTVw
 K3+Lel/riXCEYimHRUUNY+1UAMRLgpK6vsTptXXOkDMJttDrjyy+TgVlHmUqZVzvbUgOTRR91Xv
 bDcrvZItZ3BzMH6sIlCi7JDbRI/eT2mrw==
X-Received: by 2002:a17:90b:5450:b0:38e:655c:6516 with SMTP id
 98e67ed59e1d1-3933b4f3238mr18629232a91.0.1786861441487;
 Sat, 15 Aug 2026 23:24:01 -0700 (PDT)
Received: from allen-xiaomibookpro14.lan ([2600:1900:4030:ad65:0:1::])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39531e14346sm686330a91.4.2026.08.15.23.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 23:24:00 -0700 (PDT)
From: =?UTF-8?q?Chang=20Jiong=28=E5=B8=B8=E7=82=AF=29?= <xspeed1989@gmail.com>
To: intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Chang=20Jiong=28=E5=B8=B8=E7=82=AF=29?= <xspeed1989@gmail.com>, 
 stable@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/i915/cdclk: Don't force cd2x pipe select on Xe3 in
 bxt_sanitize_cdclk()
Date: Sun, 16 Aug 2026 14:23:44 +0800
Message-ID: <20260816062344.796615-1-xspeed1989@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <tencent_6CC00E822A788776C8F6E2D6B24C5FE4A909@qq.com>
References: <tencent_6CC00E822A788776C8F6E2D6B24C5FE4A909@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CNbYImbfTVsp
X-Mailman-Approved-At: Mon, 17 Aug 2026 12:39:07 +0000
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

Since commit 2ee8dbd880b1 ("drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL
without a full PLL re-enable") bxt_sanitize_cdclk() normalizes the
CD2X pipe select field of the CDCLK_CTL readback to PIPE_NONE before
comparing against the expected value.

However bxt_cdclk_ctl() does not include the CD2X pipe select field
at all on DISPLAY_VER() >= 30, so on Xe3 (PTL) the normalized
readback (pipe field forced to the PIPE_NONE encoding, 0b111) can
never match the expected value (pipe field 0). The comparison now
fails on every boot and we always take the full CDCLK PLL
disable+re-enable path with the BIOS framebuffer actively scanning
out - exactly what this code was trying to avoid. On a Panther Lake
laptop (Arc B390, 8086:b080, eDP 3120x2080@120) this causes
"CPU pipe A FIFO underrun" during probe and persistent full-screen
scanout corruption for the first KMS client (the SDDM greeter);
the corruption lasts until the next full modeset.

Only normalize the CD2X pipe select field on platforms where
bxt_cdclk_ctl() actually programs it, mirroring its DISPLAY_VER()
check.

Fixes: 2ee8dbd880b1 ("drm/i915/cdclk: Fix up CDCLK_FREQ_DECIMAL without a full PLL re-enable")
Cc: stable@vger.kernel.org
Signed-off-by: Chang Jiong(常炯) <xspeed1989@gmail.com>
---
v2: No code changes. Resent with From matching Signed-off-by
    (v1 was sent from 304750714@qq.com, which is not on the
    Intel CI allowlist).

 drivers/gpu/drm/i915/display/intel_cdclk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index 7bc9b956554b..0438f5ac78c0 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -2366,8 +2366,10 @@ static void bxt_sanitize_cdclk(struct intel_display *display)
 	 * dividers both syncing to an active pipe, or asynchronously
 	 * (PIPE_NONE).
 	 */
-	cdctl &= ~bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
-	cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+	if (DISPLAY_VER(display) < 30) {
+		cdctl &= ~bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+		cdctl |= bxt_cdclk_cd2x_pipe(display, INVALID_PIPE);
+	}
 
 	if (cdctl != expected) {
 		if (DISPLAY_VER(display) < 20) {
-- 
2.55.0

