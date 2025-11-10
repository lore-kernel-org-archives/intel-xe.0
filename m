Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68ED5CED243
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 13:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5104C10E3BA;
	Mon, 17 Nov 2025 13:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IBcG7+Ek";
	dkim-atps=neutral
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03AD10E0F5
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 18:43:26 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-7afd7789ccdso3169069b3a.2
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 10:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762800206; x=1763405006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qTyxgohfMyFm4qb2O3+6usfTAZwsXPA5PRmH04j0Qmo=;
 b=IBcG7+EkFMbDd0gppNbMC8/E5KEROm5I2pI75nTjadrOKS68AVIVjJb0omvcyAPyY4
 qa/PbvLezPh+4opsxGNAhFd9y72Vd8l8eFQefzFDLtvVbIDY3UPJemifiJ64Gg462zjW
 KJOJhvKbjWwqgLHKzHVtL0njTibA50tjjkwXihIpeXy/U+R6LF0eYxYGWkhn6T2ZnaHT
 bWNgP8lfJpqwWbDOhA2hS76j9znkidEotA9lvDWxTTDkxadgNrCdODs7qb0aeJ2fRbgC
 +k2QB09NrB57BH7mVgGCVGYH9x23XZwhCGF+TsPZ+TvdIwMh45sZdXZEsm1tuH0h/FjV
 Zxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762800206; x=1763405006;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qTyxgohfMyFm4qb2O3+6usfTAZwsXPA5PRmH04j0Qmo=;
 b=mr1DdP5x+edvqqntJOF4pgKnAaIcdkio3xRKvuJ5q1BEF7eV7cnPe4XU9VlmJuyK3n
 hblunuquwvqAiF3QS52i41k/R+sDbkLih/SJrvD3y7xFKOJX4dgtHIsp3LqyVNigCyRy
 toGAgZi5siKi5yTbqn/yID/Uzz+mecoR52l3w4v9R2BDeCVVrFloenYVgkZ1qpsv7v7x
 p7ztDMa1G+mzdDuTJmI3QG/FBD6vJNdI21sQ4tjbrrxesB7ATWsl7zyM/d0Hz7N5/LRx
 /yRtCqS4hf5ng5c8xVPHSsewEsxdT8PQI881vBLmO6Lf1qhGnBD9HiH93SOLNVnsXCZ1
 eM+A==
X-Gm-Message-State: AOJu0YzRU0KbTIX22ZwQJpzrldxjPtu5D0Vnf2QsMK0IHy00/pVMO0mM
 bQP4ZpFtuHiYz+dGppwwax8gEiOmw9MUvJXSyEG/VKzj1OYcbIslFeZY
X-Gm-Gg: ASbGncvDmUBIct6EFGULevJyOMn5hl5HDUHJtBbqEjZuIgL5vm/FejcVb8EpZW8DXAZ
 vQTEGNwYP15t5hy+yvcri63XhlSFJfl5NOHPkOC/K3PnpnIYkUBCUxYCKNZfXsBG9UncfbbAenV
 e+/UEwOfnrgN3ZLOHwj1RVTFzprHStil/dhfUpsCI9kfS31GT3sEjXclHsQgI/ZJ0m02P+hxKqR
 Sv1TXIefs4T5VX+Bujvi/KKjQijnsbxrTnN+5/O1pyHTK5FtIzrCFm7esxWdwd0JXXTWCA87Pvo
 1cWOhtyNvxZ4niHjqZhRJLc5fZiDHIA5g7UnOb/4xJ56pRgWl0TWNnAtmuAHRAVXf3o4+mRuDAb
 BYAouorNxMieJRf5IY1UrXHZ9xDQeDaFksTc4lGJEB9BIOAEiixwQCEz4/XRxEnmCOMxpmrFfzv
 hqnmRm0slj6J9HzXlR
X-Google-Smtp-Source: AGHT+IF4fMPiC1+hZjj42Db+3of7c2CrTI3c2MCrSQNXvPFvgkM/x/aKN8kmrrpZocQqP6cAFKLHxw==
X-Received: by 2002:a17:90b:4a10:b0:340:9d52:44c1 with SMTP id
 98e67ed59e1d1-3436cd0bd74mr12391588a91.35.1762800206045; 
 Mon, 10 Nov 2025 10:43:26 -0800 (PST)
Received: from crl-3.node2.local ([125.63.65.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-343bf922ef8sm65515a91.0.2025.11.10.10.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 10:43:25 -0800 (PST)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kriish Sharma <kriish.sharma2006@gmail.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/xe: fix kernel-doc function name mismatch in xe_pm.c
Date: Mon, 10 Nov 2025 18:42:06 +0000
Message-Id: <20251110184206.2113830-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Nov 2025 13:22:47 +0000
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

Documentation build reported:

   WARNING: ./drivers/gpu/drm/xe/xe_pm.c:131 expecting prototype for xe_pm_might_block_on_suspend(). Prototype was for xe_pm_block_on_suspend() instead

The kernel-doc comment for xe_pm_block_on_suspend() incorrectly used
the function name xe_pm_might_block_on_suspend(). Fix the header to
match the actual function prototype.

No functional changes.

Fixes: f73f6dd312a5 ("drm/xe/pm: Add lockdep annotation for the pm_block completion")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202511061736.CiuroL7H-lkp@intel.com/
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 7b089e6fb63f..44924512830f 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -112,7 +112,7 @@ void xe_pm_might_block_on_suspend(void)
 }
 
 /**
- * xe_pm_might_block_on_suspend() - Block pending suspend.
+ * xe_pm_block_on_suspend() - Block pending suspend.
  * @xe: The xe device about to be suspended.
  *
  * Block if the pm notifier has start evicting bos, to avoid
-- 
2.34.1

