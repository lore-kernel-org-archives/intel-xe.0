Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B86C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 15:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F24C10EA5C;
	Fri, 27 Jun 2025 15:13:25 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3603C10EA5C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 15:13:19 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 0/2] drm/xe/display: Make panic support  work on vram.
Date: Fri, 27 Jun 2025 17:13:08 +0200
Message-ID: <20250627151307.23001-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
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

With panic support merged, enable on vram too.

Maarten Lankhorst (2):
  drm/xe: Extract xe_bo_is_visible_vram
  drm/xe/display: Make panic support work on vram.

 drivers/gpu/drm/xe/display/intel_bo.c | 36 +++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo.c            | 10 +++++++-
 drivers/gpu/drm/xe/xe_bo.h            |  1 +
 3 files changed, 39 insertions(+), 8 deletions(-)

-- 
2.45.2

