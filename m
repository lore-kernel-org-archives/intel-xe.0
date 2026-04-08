Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4556F10FC454
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 22:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F6F10E03A;
	Wed,  8 Apr 2026 22:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyZwKkGZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1929110E03A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Apr 2026 22:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775687281; x=1807223281;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=QVhgIFxTR85V9yHZY0HJ/zv5Bx9BUdVeWBMToe5Ucjk=;
 b=YyZwKkGZz3FCxlFzgykxy9IEdHd0aqzZGCGVKKN/5US2CkZLPXOBC+cU
 Fk37G2FMM1lXAqdmrPKWy2Dvqu3/JDqRmJirZB8WDLfgektaXdNzTJxAk
 QkQ1+pucXQouCy36Fqk2TmGt3hYGzhLxoun7fifYuWUMEEkY6Si65agFr
 rCKT9hEh6Ab292VCuTmSIDJ0pjOK1rc9gRe3oD7zxOkToYJMqeTPXuETC
 hhmH+EINzksdw3DcpmdngtgJrKi39EnfRdDVoFJjI7v7tNacpQaKJyPdw
 pPqgGb1ba0BDW/fcJvW/PC95e/ptdZJuEN5QEzE2Ro+0qKegmPufbBGBp w==;
X-CSE-ConnectionGUID: qQ7UXAr5RBOsJrylDFHG5w==
X-CSE-MsgGUID: daYcvkBKSXuuEBFjQu5n+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87384527"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="87384527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 15:28:01 -0700
X-CSE-ConnectionGUID: 9pSqT88gRPuAAHfSV13mRw==
X-CSE-MsgGUID: oexkxLGbS0myTHhjLt5PiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="230260280"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.39.133])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 15:28:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 08 Apr 2026 15:27:44 -0700
Subject: [PATCH] drm/xe/debugfs: Correct printing of register whitelist ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-regsr_wl_range-v1-1-e9a28c8b4264@intel.com>
X-B4-Tracking: v=1; b=H4sIAGDW1mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwML3aLU9OKi+PKc+CKwrHGqiUWaqZFhkqmBmRJQU0FRalpmBdjA6Nj
 aWgByA6BDYAAAAA==
X-Change-ID: 20260408-regsr_wl_range-3e48f521b506
To: intel-xe@lists.freedesktop.org
Cc: Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=matthew.d.roper@intel.com; h=from:subject:message-id;
 bh=QVhgIFxTR85V9yHZY0HJ/zv5Bx9BUdVeWBMToe5Ucjk=;
 b=owEBbQKS/ZANAwAKAU15JAXIcpAEAcsmYgBp1tZweGRelViZHaUFKlPUNIZsYoInBXNWtxpde
 NEqcA8lIXqJAjMEAAEKAB0WIQTCZ8MJRH/rTz8hbaxNeSQFyHKQBAUCadbWcAAKCRBNeSQFyHKQ
 BAugD/9Rmu4KjYyhePbSn8GQxHk4pmdXJW8yhUNmBSA0iUenodIVSM3O2lkKNL8SmI1TeGQgiK4
 Ss74B9ykXjaGPKYqop8f9L5t+ktk57oFPH89qD/oOKNDXjrU1GDKlkxlb4WLrcmvdf2QxB7s6KX
 MzklGY2OvDqcoiyVaK9cYFxDCjEkD7MAxrnbQvnin2baWrnto/7nkZyBVuvlcmNeUgOFXwAaEOw
 1QjromuG4C1RMnIJ/l32o1uILewXn2RgFpvhTnrHq/zO+3XqpUn9rJbVuXkuis+FEToQTdz3oyU
 e8wiA4Y5hgswgPFN9mPpaBnJO+99FLp7yJ2fM4fkNT7Mcx7V8hOriJ6eEbtMki2IayWnqfupcKR
 CZPIQkWBpixm6STU9h+tpxx+F/GimVDhHpL3AH4TXBHpaPV0lRFF9dEAua2okosBxrXiHtiq/TX
 ESzUusSufUp6Z1fqqRwKUG/E0TZjtHhc1QpERRSw3OVDnOX7lhEqOALrNQ+RBY7Vt76swsQDe87
 XrAfI2m6XzABiVPtUd8iigmksesB1Qpg0tYR4f/w30cW4QqZ/SwDYID65a/LP5KBxDXKTJ6JdKy
 eNEiLepzcIDhJAyeubud5SHJSa16cfSn1iHT0Dvj55hpaFHrFfGar44ZShvIXJKDMCBR96drqx5
 8yfujFvecm+bbDw==
X-Developer-Key: i=matthew.d.roper@intel.com; a=openpgp;
 fpr=C267C309447FEB4F3F216DAC4D792405C8729004
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

The register-save-restore debugfs prints whitelist entries as offset
ranges.  E.g.,

        REG[0x39319c-0x39319f]: allow read access

for a single dword-sized register.  However the GENMASK value used to
set the lower bits to '1' for the upper bound of the whitelist range
incorrectly included one more bit than it should have, causing the
whitelist ranges to sometimes appear twice as large as they really were.
For example,

        REG[0x6210-0x6217]: allow rw access

was also intended to be a single dword-sized register whitelist (with a
range 0x6210-0x6213) but was printed incorrectly as a qword-sized range
because one too many bits was flipped on.  Similar 'off by one' logic
was applied when printing 4-dword register ranges and 64-dword register
ranges as well.

Correct the GENMASK logic to print these ranges in debugfs correctly.
No impact outside of correcting the misleading debugfs output.

Fixes: d855d2246ea6 ("drm/xe: Print whitelist while applying")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_reg_whitelist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
index 80577e4b7437..8cc313182968 100644
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@ -226,7 +226,7 @@ void xe_reg_whitelist_print_entry(struct drm_printer *p, unsigned int indent,
 	}
 
 	range_start = reg & REG_GENMASK(25, range_bit);
-	range_end = range_start | REG_GENMASK(range_bit, 0);
+	range_end = range_start | REG_GENMASK(range_bit - 1, 0);
 
 	switch (val & RING_FORCE_TO_NONPRIV_ACCESS_MASK) {
 	case RING_FORCE_TO_NONPRIV_ACCESS_RW:

---
base-commit: 08037efa91c349ee17b62ddd1908a846d7abd917
change-id: 20260408-regsr_wl_range-3e48f521b506

Best regards,
-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation

