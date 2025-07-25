Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1283BC87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 16:50:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3D610E37B;
	Fri, 25 Jul 2025 16:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fiki74pe";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7236A10E225
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NLdaX8ML38VxBjXeFBokOj64IkoQhZtZK2qOJKFfEVU=; b=fiki74peudNfplJT18sLgIzPRa
 P4aEd36udbLFHXdmjvedgaTdOsNntmXQbFzDJall3AT29cHdfp/FdPhGo5RVTI0amf+5NTcWJ54Vt
 mbS6Qpa4Qiw+bq1yNqHUpBdGv0hFUzqM3R0P2mnBhsBoqGehlQrQc3hw4YfVGM8ak9wqYZWVeEQDo
 Ghpfbqk+RenZSDhBP1/YDiRm00DGEYHXw3/qDYKkZI32gBYXTp4PdYUbfK+kuD/x0g4b95LnXWi+L
 yyWC7Qu5M4UhhaW3aOsWoJAlAY2VfHBSI19d3AA+aG1U16L1ySAIjBuDnNT3WiiDz/aAcTPYZrTUs
 UPe0NdTA==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufLcu-003ngb-OE
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 18:50:32 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 0/1] remapped fb view test
Date: Fri, 25 Jul 2025 17:50:31 +0100
Message-ID: <20250725165032.96395-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250725070305.87218-2-tvrtko.ursulin@igalia.com>
References: <20250725070305.87218-2-tvrtko.ursulin@igalia.com>
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

trybot

Tvrtko Ursulin (1):
  drm/xe/display: Add support for AuxCCS

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 111 ++++++++++++++++++-------
 1 file changed, 81 insertions(+), 30 deletions(-)

-- 
2.48.0

