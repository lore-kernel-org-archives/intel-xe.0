Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093FCC44501
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 13:49:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C2410E5FE;
	Wed,  8 Jul 2026 13:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VugtrEs3";
	dkim-atps=neutral
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDF010E579
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 07:17:25 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-c998fd549a8so232526a12.2
 for <intel-xe@lists.freedesktop.org>; Wed, 08 Jul 2026 00:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783495044; x=1784099844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h0Biz5zAntBoijadNrUEvs1mg/mB9KZLbipw/JNpHMQ=;
 b=VugtrEs38mHoIi2A9Jc/qzq7UuIyFZ5BLtdCPZHJaUqY9Qiua6v7iDPxg+2GiZK75P
 kzhw3Ae4ak4t6LlLk8bOLGSt3IT0yM0yMKEA3xDBOttH6QanFSsHBycEJomZYWZz4ge8
 2iCzYTadNj4RCx6xje2jhQ004y8ew9yJHX8NyZodfjJIhh4w8K9oS3qJtqS5rn5Fwj6T
 8/kjaA2CypmXAyYfC4odwZX5q1NifdH1oYNQDZqRYIshRNPLyXDgm214ug1l9MYrOiTd
 0LT2v2flDMPHolUOMuuptLkWh/eDMLZIDHQaJuGyobbNyS/mQ19EKEGYvawbV8Fv2VGm
 3yrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783495044; x=1784099844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h0Biz5zAntBoijadNrUEvs1mg/mB9KZLbipw/JNpHMQ=;
 b=TGKdR3pDZmhN0nvEwRR4qReJ98DlEckFY1TxW/KOb15+vQ8k+0zan+RfVMPexkDxMq
 GkmAsSfXBKcWBzd0KK9wQYeEERVEIpn/Nj3ujwUqzCABZvAKrjK1qwmzgedfQQAa2LDl
 EOivzBJsS+BL3YLjvSrtU2YLBpWLdAKBmSQecxv9/5QJuMFlOLsB6BsL661OsP29mqlh
 z5G8jGVIFP40B7WBWBWqpDYyt2mYelFyPguPQuRiBd/zh9gtrbSXb23Lhjh7IG3An40S
 RDoFLb47tbwPmsJwUJNKVQkCR73qa6Hye80w0nC6gLxWUZWk28745vmag6SG+oHCAGzD
 Si2A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDo6tnjXZcjvKcwSGlIJzbZRjU6tcadsXk9XtoBOK0BvuTDRlcy0Rc/dqg4WLj1hgRkyMBBw32xw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZICqv4n18IrmhE8aIh8ShWawht22QnOvqAPottCFtZwXQoXde
 nc4OXmOm5zlhu/XrJvarOKtt/CF05nj16O0T/ZMKQtDIiNWtaXVD2ETC
X-Gm-Gg: AfdE7clX5sF4HaowhznOGKBzCZ+eOSGLW75OzD2XA67nHM9JLwCAQxcdGD1YVBtE6ao
 Eh4d29kunfZyI0xd8DlA5hogvxsHNmmd+cXVMF5ew38lfKeRVo3eIJygmh//DPXVuKwp3aVektC
 FV/K6M/O8PThCbJlJL3rOqVw+bUg4jrGTR0pbUjKA+uUhGNeYzte8C4AfR8ZPr81RFgp8ZAFYQT
 zFDzqPR69JEdO4sqwPyL0SA4tiGncrf5Cous4CRxT8JM2CzrXPPvhSUrz+jt6+QE/DCv2NIm2Pt
 jrslIlcIBsylutGtSdl7+OHV8Qm0tDP6LK3hPCriKFCdzKvDMU1aH1nbb5DMRA4qxBJBovRPkI8
 OukE9cMbd/Hitu3vSQ/kslKW36nSA3hCn3+DPCbI3u79LnbE/NB1Ci6zf/xRkj8uMYUy77V4=
X-Received: by 2002:a05:6a20:748a:b0:3bf:ab02:439e with SMTP id
 adf61e73a8af0-3c0bd0420b3mr1543741637.27.1783495044471; 
 Wed, 08 Jul 2026 00:17:24 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3b25204sm1972985a12.28.2026.07.08.00.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 00:17:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/xe/pf: clear pending packet on header init failure
Date: Wed,  8 Jul 2026 15:15:02 +0800
Message-ID: <20260708071502.722393-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Jul 2026 13:49:02 +0000
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

xe_sriov_packet_write_single() keeps a partially written restore packet
in the per-VF pending slot across write() calls.

When the header becomes complete, xe_sriov_packet_init_from_hdr() sets
data->remaining from the user supplied header before initializing the
packet backing storage. If that initialization fails, for example because
the header contains an invalid gt_id, pkt_hdr_write() returns an error
but the pending slot is left pointing at the partially initialized packet.

A later write then reuses that packet, skips the header path because
hdr_remaining is already zero, and reaches pkt_data_write() without
backing storage installed. This can dereference data->vaddr while it is
still NULL.

Drop the pending packet when header initialization fails after the header
has been fully consumed, so the next write starts from a fresh packet.

Fixes: 1ed30397c0b9 ("drm/xe/pf: Add support for encap/decap of bitstream to/from packet")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index 2ae9eff2a7c0..e9c92019862e 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -323,8 +323,9 @@ ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 				     const char __user *buf, size_t len)
 {
 	struct xe_sriov_packet **data = pf_pick_pending(xe, vfid);
-	int ret;
 	ssize_t copied;
+	bool writing_hdr;
+	int ret;
 
 	if (IS_ERR_OR_NULL(*data)) {
 		*data = xe_sriov_packet_alloc(xe);
@@ -332,11 +333,21 @@ ssize_t xe_sriov_packet_write_single(struct xe_device *xe, unsigned int vfid,
 			return -ENOMEM;
 	}
 
-	if ((*data)->hdr_remaining)
+	writing_hdr = (*data)->hdr_remaining;
+	if (writing_hdr)
 		copied = pkt_hdr_write(*data, buf, len);
 	else
 		copied = pkt_data_write(*data, buf, len);
 
+	if (copied < 0) {
+		if (writing_hdr && !(*data)->hdr_remaining) {
+			kfree(*data);
+			*data = NULL;
+		}
+
+		rturn copied;
+	}
+
 	if ((*data)->hdr_remaining == 0 && (*data)->remaining == 0) {
 		ret = xe_sriov_pf_migration_restore_produce(xe, vfid, *data);
 		if (ret) {
-- 
2.43.0

