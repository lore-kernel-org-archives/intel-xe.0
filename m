Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C89E81BDA
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 15:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692B810E414;
	Mon,  9 Feb 2026 15:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="KWmwNECQ";
	dkim-atps=neutral
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CD710E2A9
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Feb 2026 23:26:03 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8c6aaf3cd62so326538885a.3
 for <intel-xe@lists.freedesktop.org>; Sat, 07 Feb 2026 15:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770506762;
 x=1771111562; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AkFXjU38A5sw4srZ4rRr/u08i5+VyD7JO4xylQ4ub84=;
 b=KWmwNECQ2pWj+PQngTeMWFvJUqfxkRbtuBM272yjJE1CoNbzcCLh2GFKZfkoIzvnUd
 71dAF5hj038dUOjbynJxskbGcrMm7oQSGHrnhza2GQndN0MUKrJuZq85gXSNpYXauaRi
 z3o/BfunxSQoTdGR3EgBP4LCXRaWzYWHWK8RVwVTM5Sesdt9yiYtuwEkzdQACXngX/si
 lgBAA9cCDoIU4kVofoSsVDCdY/oY86cza9exaTCmrvfxjsyyCZA1SrsfJkJ74Tjssrgm
 nb6JszC8K4hYq+ZPdVOYhFAh1ynUaV8N//G/eVo5Dm4545/KMX8BAtnJYEAH6AuDsqUz
 NInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770506762; x=1771111562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkFXjU38A5sw4srZ4rRr/u08i5+VyD7JO4xylQ4ub84=;
 b=hxCsDf5SRHmLGs5/mAxRXytZ8WEI1+2BqyHD91oE5w9h38e2TZnepPhwydrP6IGYq2
 8QRRN7qUwkibk+HbXs8AMNJDFXidCJMPasdwHaZJJqrBdb4O4jn+6cZWKbPq2exKbgSd
 ffP61dXVFJrq9IGr/8qjPrSGylRco302/a40vFdr0/0fzvBeMGC93PLW94lq+SUM+iAQ
 lxva6ep7KaU4rONWSyJro8QxZGDrF0EjwXR86DfTT0ZZdZAqnLyhMLFdnOl1vGlaDmG7
 Czsy8xNAMgPSP/HeXx5Zsdq8cmJ0xmZKExWw91JhwzdVp0PR+HC5QVCnz+2MqUDQwdO2
 InFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBhJfZLJJwVzA30Sj7++CVq7KfvG5R12OfudNd+jqoFVXi8T7O5UjZQ/Nm6XWjBaJmpgv63vSCbA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgkM3Pr8vfoIBydz/I4nI2q+J3phjL1GGZBuSpZzACgUDb0oO5
 u5xpVdp0IOqIY1RQcwpU1ijqeXrR8THDBi8ODblR13rHduzsXTNOS/IG9g901zEGDsw=
X-Gm-Gg: AZuq6aLx69TqeSCUDc88QStiBuwXbvoogrsNiA5qmUpZPhnOkmfo3qPF6I8FxSI1WSO
 mX749MHEvwJNrLBlpqaD4bqIpnsQq5jiDJ43dVesT44wLOVnE3TN9SpCPvYSNEQVrtJGD9mpl7M
 UxK0zEQBUqKv+RhkYIS1x0OXnaiHqoZd7kQwKx9shsVtRafjM3+1Rv9ScVka2V9hHq82cYtF7qb
 cwmqFtG8GTaEHaBE5NLOFdFIz4hRx/We5+F8x4kMZA9UCtF2zfpcb0apACMe37JyubZXUqc+fwu
 Dv4pLCQOFcVIr25DEgv1pET4Bdf/duXdnbcB4YLXz/dxXzQ7qT2yQ1KWnCEWLIBTuxWj/8QYu1v
 IbFU4t/SppeG42zL8QCX/P0BxCwulFqCGNR7B4NXWeNbzodq/kZYfyxtB03sQS+iVRY0wRZ8gdT
 1Hxar3+DfbJpBxzPZw1yDon90Eq6UVT9nAJo6CQT+GdFTAeU6pJfySXJT3dn0b9Ce5VXl4Kx04K
 aHJW6rd3DuxSZaoiA3w/sfdwPysvXw=
X-Received: by 2002:a05:620a:1990:b0:8c6:de6f:89a2 with SMTP id
 af79cd13be357-8caf2789759mr914848785a.85.1770506762357; 
 Sat, 07 Feb 2026 15:26:02 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu.
 [165.124.184.136]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8953bf3b6b2sm47190196d6.6.2026.02.07.15.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 15:26:02 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH] drm/xe/sriov: add size validation in packet init
Date: Sat,  7 Feb 2026 23:25:59 +0000
Message-Id: <20260207232559.4037731-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 15:22:58 +0000
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

pkt_init() passes data->hdr.size directly to kvzalloc() without any
upper bound check. The size field is a u64 sourced from userspace via
copy_from_user() in pkt_hdr_write(), and the only validation performed
by xe_sriov_packet_init_from_hdr() is a version check.

When a VFIO migration manager or debugfs writer supplies a packet header
with size > INT_MAX, kvzalloc() reaches the size WARNING
in __kvmalloc_node_noprof() which triggers:

  WARN_ON_ONCE(!(flags & __GFP_NOWARN))

This fires a kernel WARNING, taints the kernel with TAINT_WARN, and
causes a panic on CONFIG_PANIC_ON_WARN=y systems.

Add a size bounds check in pkt_init() before the kvzalloc() call to
reject oversized packets early with -EINVAL.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
 drivers/gpu/drm/xe/xe_sriov_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
index bab994696896..04483eeba11b 100644
--- a/drivers/gpu/drm/xe/xe_sriov_packet.c
+++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
@@ -127,6 +127,9 @@ static int pkt_init(struct xe_sriov_packet *data)
 	if (data->hdr.size == 0)
 		return 0;
 
+	if (data->hdr.size > INT_MAX)
+		return -EINVAL;
+
 	if (pkt_needs_bo(data)) {
 		struct xe_bo *bo;
 
-- 
2.34.1

