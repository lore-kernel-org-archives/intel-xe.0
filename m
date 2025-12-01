Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC678D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 12:00:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F2910E3AB;
	Mon,  1 Dec 2025 12:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WgoxtD3O";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F83C10E3AB
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 12:00:29 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2984dfae043so34482275ad.0
 for <intel-xe@lists.freedesktop.org>; Mon, 01 Dec 2025 04:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764590429; x=1765195229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6yqxq/Eo7orQOpG1SgVb5eJDDwz7vM469bb8qAnY+v4=;
 b=WgoxtD3Onjb1i1Cc0gIzLz32JATxsQvMdrt2pyOhqKkP+cMs+SlEk03qdioF6P/LOc
 G0M4A6OJDFDI80CT8vAFtXBj8koZ4yZ6N6PfUGTvm4GmJh9Z4AdqzNT5563XmBjPuF0P
 zz8ZQd1DXscBrNfQS22Uu9ybSJpZFrwbBugixTUytZd1Djq2w4orv6SkqLP4yy74283d
 wraezSwiwCqoXfndRzPg61oLt+tSx1IQGXxHioqSAEm9WjEbOhjzrl0H7PQrYQ0lmRVv
 APRng5Ic9blhW2Nxd9jt/rxjCzK6Kj7/bVIfOcLIGmkZ4klTyRZbhFgjr+j0GKEXasyY
 P7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764590429; x=1765195229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yqxq/Eo7orQOpG1SgVb5eJDDwz7vM469bb8qAnY+v4=;
 b=Wgy37ZusIUIs6i1OzAnas0quYXOIuY4aY3fL9GxSVcky/TjyX5TwvDvHiQp+EOSw1o
 D/O7z+Ya4aTcUYnaibY5jRkAZvqo/7fy8otK181I4yWmH5sJPOsvzzUJWP71m7xHKUHQ
 Qr0WcAkiU8na0wJb9qhhbQWoPbeyxFcQkP+Wv4yU+NEoV0JQWjDXOYNTIdHLGGN/G9q7
 9Mwt2E/LkUJFJEd0o0359tum/kspfZAuO41UQ0WWj1h2qbCdkrNcgXj8+AqcV+QJ90l/
 wPMk81IZfwb1s19aMHCLUAZvkDe5e1aadD2dD/rhR5BfqxdZ+EYCG6bhb7zu4Tm7YLwF
 W3Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSQepG64V/WZgPx9UkX1nzVgdQ+ZKjSmCGn4VfGXgFjwvD2Gd3lEAvh3dssXGS3Ptw4QlQCSHEAA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKqeYBPwxdEy1wV/VTg0ak59Brc7p+a5rrh6XnEVYFPuf1sIcx
 Ka9Bx/zoAkgG10I/uSln1yhUxx+eZQe1zeXzH51oDfB98bdRYjrUNs+V
X-Gm-Gg: ASbGncvRnwD2yEHmidDgau7S0xQDSGyWh6vIN3cTt5sPQ7731slZJ1uV/T+QnpVW9Sr
 YwuaUc5EsfYNrRCAnAyfckou9eHNMNxYSfMTrQyHOA4fAYx0o+dexeclGoHQpluYFeEPBQpl82H
 u41px9B1zpXrU+MlpHYnLopL/bQ4D4u0LsvliUalGHazqjD6ND+KnfSzpDxPOD6z/Bg/CGSRAy4
 bD8ieSgLXjKbAbfhkJxcpX1yhvwXfgKpSJYXl4uKne0iTkA4OADuxIaQW+oJkKY95t6bnIQ9u/w
 0gcy1WiEqTcrHcFjkndfh/P8gv5PRMLAdWH3lcEhPljetdZ8DWaU7E0+J6vameytcvgqwN5Ut3O
 g49BHrtX+DqXNBLbbFrleCz9ZmPR9C2V5MrOnhY+4rCVaAVEzyl7tibGBI2WdC/dkLu8pWDUkJL
 zxuz1BZeErcrki+JI5tIoxgsMcDYSEykX6RS0x9KZfjSuq7mYqyCqncwyzfmPu
X-Google-Smtp-Source: AGHT+IFDaZK49izvcppRUL/j1Vz46S/Jx4PlhK6C6Iu1BHW6XeMPMUnv+tUu8y5I1Cck8ZL8GAhYhA==
X-Received: by 2002:a17:90b:17d2:b0:32e:1b1c:f8b8 with SMTP id
 98e67ed59e1d1-34733f49b25mr41680127a91.26.1764590427107; 
 Mon, 01 Dec 2025 04:00:27 -0800 (PST)
Received: from localhost ([134.134.137.78]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3477b7341d2sm12954257a91.11.2025.12.01.04.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 04:00:26 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 0/2] witch to use kernel standard fault injection in i915
Date: Mon,  1 Dec 2025 14:00:02 +0200
Message-ID: <20251201120004.690290-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Here taken out calls to i915_inject_probe_failure and changed to use
ALLOW_ERROR_INJECTION for the same functions.

Below functions are dropped from testing since I couldn't hit those
at module bind time, testing these would just fail the tests.
To include these in test would need to find way to cause resetting in i915
which would trigger these:

intel_gvt_init
intel_wopcm_init
intel_uc_fw_upload
intel_gt_init with expected -EIO (-EINVAL is tested)
lrc_init_wa_ctx
intel_huc_auth
guc_check_version_range
intel_uc_fw_fetch
uc_fw_xfer
__intel_uc_reset_hw
guc_enable_communication
uc_init_wopcm
..and all stages of __force_fw_fetch_failures


Also here added intel_gvt_driver_remove to error recovery path.

/Juha-Pekka

Test-with: 20251118143301.510707-1-juhapekka.heikkila@gmail.com

Juha-Pekka Heikkila (2):
  drm/i915: switch to use kernel standard error injection
  drm/i915: Add intel_gvt_driver_remove() onto error cleanup path

 .../gpu/drm/i915/display/intel_connector.c    | 14 +----
 .../drm/i915/display/intel_display_driver.c   |  5 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  9 +--
 drivers/gpu/drm/i915/gt/intel_gt_print.h      |  5 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 --
 drivers/gpu/drm/i915/gt/intel_wopcm.c         |  3 -
 drivers/gpu/drm/i915/gt/intel_wopcm.h         |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  8 +--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  4 --
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 17 +-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 60 +------------------
 drivers/gpu/drm/i915/i915_driver.c            | 13 ++--
 drivers/gpu/drm/i915/i915_params.c            |  5 --
 drivers/gpu/drm/i915/i915_params.h            |  1 -
 drivers/gpu/drm/i915/i915_pci.c               |  6 +-
 drivers/gpu/drm/i915/i915_utils.c             | 30 +---------
 drivers/gpu/drm/i915/i915_utils.h             | 22 +------
 drivers/gpu/drm/i915/intel_gvt.c              |  3 -
 drivers/gpu/drm/i915/intel_uncore.c           |  4 +-
 20 files changed, 19 insertions(+), 199 deletions(-)

-- 
2.43.0

