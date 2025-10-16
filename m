Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B8DCCD19A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 07:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A72E10E02B;
	Thu, 16 Oct 2025 07:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LVBPDd9b";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E39C10E02B
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 07:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760601433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8uJq1+mbd0Eu6wZtPg1VPcwNGlZLkg6XwSfxKx35dwM=;
 b=LVBPDd9bYP9m4YgkG43cwoD6om3GCHaq1/L/sEUQr/Ui2XplBzJKDhacy6YUxylwS3taA7
 Z6M+4S8r7+VbJxDfEc8gY8pOr6Ec8306TZbCsbUWUPKzNpbc+H+YgR3ptDR4DLZX0Wz9zD
 vUerICNmb9jmmfBSbC4gxtWtfdTZkRI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-TqN6ilhvPImZTTuHKWHoug-1; Thu,
 16 Oct 2025 03:57:09 -0400
X-MC-Unique: TqN6ilhvPImZTTuHKWHoug-1
X-Mimecast-MFC-AGG-ID: TqN6ilhvPImZTTuHKWHoug_1760601428
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 744C81800654; Thu, 16 Oct 2025 07:57:08 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.133])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 795A1300019F; Thu, 16 Oct 2025 07:57:06 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v3 0/2] drm/xe/display: Make panic support work on vram.
Date: Thu, 16 Oct 2025 09:52:29 +0200
Message-ID: <20251016075701.379023-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cX37xuoaELfsnWEMAhvroyyWYATLWagLpufQOGj01Oc_1760601428
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

With panic support merged, enable on vram too.
I've only rebased the v2 on top of intel-drm-next.

v2:
- Add kerneldoc to xe_bo_is_visible_vram,
- reduce amount of members in xe_panic_data to minimum.

v3:
- Rebase, and take care of the code moved from intel_bo.c to
  xe_panic.c

Maarten Lankhorst (2):
  drm/xe: Extract xe_bo_is_visible_vram
  drm/xe/display: Make panic support work on vram.

 drivers/gpu/drm/xe/display/xe_panic.c | 50 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.c            | 19 +++++++++-
 drivers/gpu/drm/xe/xe_bo.h            |  1 +
 3 files changed, 55 insertions(+), 15 deletions(-)


base-commit: 56d9d03450f065fd31e56de5fafa7d498b318531
-- 
2.51.0

