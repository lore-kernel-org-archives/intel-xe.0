Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05F1C7EE29
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 00:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AB910E00F;
	Fri, 26 May 2023 00:32:31 +0000 (UTC)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F72310E00F
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 00:32:28 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-64d44b198baso268453b3a.0
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 17:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685061148; x=1687653148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8X2BH67M9+us96NConorXZph5DNHrP5YDllY5ElhmIY=;
 b=RQd1+37z8uicx7sOq7L2LXEcd5n7SMpwoyK5e/YAuwshmZrjDJhfq50AjdFxdFoho8
 0MVtz4OoSHauDQXgpftNJrdg6PtJhmwk5i6TBDAg61CL3J85PQ68fCnP1DKiwmDAkY9m
 DaaiT5Z9TOeKfGFNqDW4Pfh/e7CXL5SkvT6rL2EpbAHwtrnXaQItGi7Qu1MvLrOFdv5H
 DDOtitkwLBQd4q291m3GZHnlgYxsdDhcCsuhw+t43jQiS7CLqIVLfwsvA73PJsqZx4cU
 TbfkN4r2VihybOdQ8MgTG+3ih8qEEIBCmGQ7t9i/c2lySwDTBQzeNtV1scDaiWlIL31c
 wUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685061148; x=1687653148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8X2BH67M9+us96NConorXZph5DNHrP5YDllY5ElhmIY=;
 b=ATeZM4XZ5fePTH01yxzY/OQyhAR+sTz1/NjnOgPsPatfvUTt3TA480YLKtV8zkx7Sb
 TSXfw8pXSDYJIfe42W/Q4wUrQljk5eqOSYOCy+H0hGyvawA0VY+WmtPwRdHd1UBVLTCR
 ELtqEj/rtouVb/Gyefm1sU9M7fMjJ2GO02tL5Nusk38CAVXwu0+BK7Yilq0cWOUsthd6
 bFrLYYGk+FTkCvhiW4qGV/WO+eC8q5xgW+YLpJN9u6dVPrTR4Qf+t/OErJrkB+oyIEfE
 Cu8MCk90Vd81mSa8556HkBIOiUWkK9dVBvGoNLvpz9m5fIpB6GOErOjWkxBR3cxxxzDb
 u/zw==
X-Gm-Message-State: AC+VfDxT5RheObUKE14edzUhGrKdn1EdokoUIXLsMrpvPwI4lCgAlzPk
 TMdCsNS8pSzEHWiBOkhUZ2MUEAxlcq6c/+Yz
X-Google-Smtp-Source: ACHHUZ743LaweL6ENLuPKP8FkkirLZxF1jz4HkYCY+eWve1FW9FOY9/OrdXcECthIlpIu/yDCYZNWQ==
X-Received: by 2002:a05:6a00:2d23:b0:64d:2a87:2596 with SMTP id
 fa35-20020a056a002d2300b0064d2a872596mr5825822pfb.10.1685061147533; 
 Thu, 25 May 2023 17:32:27 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a62ed0f000000b00634b91326a9sm1710156pfh.143.2023.05.25.17.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:32:27 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 17:32:19 -0700
Message-Id: <20230526003221.3874899-1-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/2] Draft: Update Xe uAPI for 32-bit compat,
 invasively
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
Cc: Ryan Houdek <sonicadvance1@gmail.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This attempt brings in Maarten Lankhorst's original uAPI update, with
suggested changes made to make up the difference. As long as we're
attempting to bring up 32-bit compat capability, we may as well go
whole hog and just break things. Better that way than to deal with the
mess later.

Also introduces field validation against all of the padding and
reserved fields, which must be zero, in a separate commit.

This is the invasive update, as a draft, for comment and examination.
It's probably not going to be applied any time soon, but it's here,
and it's been updated based on the comments against the original
invasive attempt.

v3:
  Redid everything, maybe this one will be a little more permanent.
v2:
  Removed extensions checks where there were none originally. (José)
  Moved extraneous parentheses to the correct places. (Lucas)

Suggested-by: Ryan Houdek <sonicadvance1@gmail.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Christopher Snowhill <kode54@gmail.com>

Christopher Snowhill (2):
  drm/xe: Reshuffle all of the uAPI structs
  drm/xe: Validate uAPI padding and reserved fields

 drivers/gpu/drm/xe/xe_bo.c              |  6 ++-
 drivers/gpu/drm/xe/xe_engine.c          | 18 +++++--
 drivers/gpu/drm/xe/xe_exec.c            |  4 +-
 drivers/gpu/drm/xe/xe_mmio.c            |  3 +-
 drivers/gpu/drm/xe/xe_query.c           |  3 +-
 drivers/gpu/drm/xe/xe_sync.c            |  4 +-
 drivers/gpu/drm/xe/xe_vm.c              | 21 ++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c      |  3 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c |  3 +-
 include/uapi/drm/xe_drm.h               | 64 +++++++++++++++++--------
 10 files changed, 95 insertions(+), 34 deletions(-)

-- 
2.40.1

