Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6454D606A326
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdE4RXLQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC3410E28D;
	Mon,  2 Nov 2026 12:42:14 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com
 [74.125.224.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CCF310EAD4
 for <intel-xe@lists.freedesktop.org>; Sun,  1 Nov 2026 22:53:27 +0000 (UTC)
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-67990a45e02so1984691d50.3
 for <intel-xe@lists.freedesktop.org>; Sun, 01 Nov 2026 14:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793573606; x=1794178406; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=s7+GOe5TlTu09tPuJuAXaS5FmzeWJcxHvWMkwG9Tvkg=;
 b=YdE4RXLQB7p3MOkDNcvS0xwLFcxn7qDh8oDiE0owbEY8xTJUaa47yl7MpOPqClCU6T
 YRK59p5tckkXIXFMIbcVg6vHOlWyDmyJx+fPZA9aaC8hv/sR5FFgtlQQteb1SwIkYTaj
 Z8AKAA1T80TwTLu+OCv9NRdM2mth2kUajkw4loyCRqXO3WPshxlRbk+MkS0ty22wgN3Y
 MIbbzniIzdJq9wUvD6BJ4bpmxkfAduejeL97ta81f1KYo7X9gpM2DtNF663q96rhLrqX
 stmIiWSt4Z1qyDUyu9RjWr9m6qSRgIlNjAmVRaPq+daP6WnZW2vA3LGm/UTYyfFXWHUT
 qWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793573606; x=1794178406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=s7+GOe5TlTu09tPuJuAXaS5FmzeWJcxHvWMkwG9Tvkg=;
 b=dfErB9M/t+yXjNYiOJgklt4y7bWrFlHS3RqCqfIkGioAdSMAUAyQBE/+M64OJ4xO6g
 NJ4MKt8H2CpInsfgG/F+Wo9r32veLuOLU3Spo2voqpT3UENL5ghb2coXsyqZDFy+UYoD
 o+uTk7gBCWNH/0Ma/ac1TYpwkswLowgd8+7kDyFBDUA/A8eOKt9+jBtaHEwBgT3xvgYb
 Z69Z3CLHEVhcciDZ1s49IWKTsqMEwDjYc51wTCRwX7BK3ItA/ZIuBtGsgQ0Oh9FIoRGx
 XIfsFMwRHpPFq2bdwaxwwFuDE6p2xzxCJqlhldyhOKkrm6lkQiMQvSEVCUmJqpQJLkW4
 YcMQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByW5qb3sKzJyYNJFG7jqf0iorw9wVZyKIwrIMTWPCk/3EhC05Ch/FlPZY1y9EKWEJzfi3R3oDac+g==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKxqB8ZxOCSs6Blv4XOvtW2KnyNKBdFnEvnVlC4aDpbRryXargK
 gJ6yh+ZYYQvOnlT5Lx7CjdRTCCol4JqYKpMcBsSabJGQBSQXCk6pu/Ah
X-Gm-Gg: AYBFou2NrE4ZmHJZTenZ+sv0VHzpDkTPsqPTMRqz6totj8UcUd8fquAhJhVvnlD5j7a
 3BJf+83b40Btfq0Qo1m/JIpbpveh3Yg1sJWerfNqmrw+sWX6+AAizVkvr50qzDpSKe0hLfBeF5l
 bHsB9F/aZegZhbG2jzYdZn9ExXbytHVQ0rd6QTubbJ3tn1ApbjmkabjT1Y/7S7lOaQTw28Qvv8R
 FORynLKun3Gz1OL2+NTWv3oCgCJ9KF3E6rhZooB8eFSJYNTFPcRzsnoUxRf7PkebvX6GVu8Gz+Y
 d4mb5pHBsIchT10mTuotp2u5Dgkp0lpe1vhQbdw4vleJcIdfaUmB7BQqdcUZ3Y0UeYuC3ABcsQT
 +VLYSEl0/pUsU7hG9uuGYwrdDsGv9CjfbzH7C3dG7Pqz7p/9h2ODtST3Dmx3daz9h6Fvpe0uP8X
 GkVsk8FmWtOSJMeeU4DlKomtmgX+vQU372BEr0GQe5GF13O1tXgbaaVhwpOvtZ78gYf5Yypvwhk
 XsC5P3I9r6+x81GZ/wFtJZvNm/+PJJfTOnV+ckvDftSl/Thy7Hl3rkX10bo0gu+2Vb4OSdi7cDB
 btN+DQgoO687QawwS4Qjtv86OyDhWa58KmQT9yDQCHiTQF0tWc1/HOrckFInqeCISsVPTlgNOzr
 ooBTTlTHd3N2GXdEXD1BjgDC3EQ==
X-Received: by 2002:a05:690e:13c9:b0:677:b7a7:ba38 with SMTP id
 956f58d0204a3-67ba4c806b6mr7372011d50.14.1793573605653; 
 Sun, 01 Nov 2026 14:53:25 -0800 (PST)
Received: from tux ([2601:7c0:c37c:135::5a87])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b2b71b70fdsm41846847b3.43.2026.11.01.14.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2026 14:53:25 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Riana Tauro <riana.tauro@intel.com>,
	intel-xe@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH] drm/xe/xe_ras: Use xe_log_info to avoid passing zero as error
 code
Date: Sun,  1 Nov 2026 16:52:52 -0600
Message-ID: <20261101225252.556741-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Nov 2026 12:42:13 +0000
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
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_log_err() expects an error code, but in the case 0 branch of
handle_page_offline(), 'ret' is zero. Passing zero to a function
expecting an error code is incorrect.

Switch to xe_log_info() instead so that an error code is not
expected and zero is not passed.

Fixes: 12b427cf8bb0 ("drm/xe/xe_ras: Handle page offline requests for device memory ecc errors")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpu/drm/xe/xe_ras.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index db3cbc186a51..7942a2a48887 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -304,9 +304,9 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
 	switch (ret) {
 	case 0:
 		action = XE_RAS_PAGE_ACTION_REMOVE;
-		xe_log_err(xe, DEVICE_MEMORY, ret,
-			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
-			   page_address);
+		xe_log_info(xe, DEVICE_MEMORY,
+			    "Poison detected at physical address 0x%llx, page soft-offlined\n",
+			    page_address);
 		break;
 	case -EIO:
 		xe_log_err(xe, DEVICE_MEMORY, ret,
-- 
Thanks,
ET
https://github.com/sponsors/ethantidmore

