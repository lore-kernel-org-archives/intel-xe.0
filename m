Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56923C87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 07:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2038510E43A;
	Fri, 25 Jul 2025 07:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qD6HXcez";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DF910E43A
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 07:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mzn9jd2GMJdt4B8SpRsuZOx4RD5vOSifIV8A4IH1PdE=; b=qD6HXcez0R+37/of8yYHUHDN/F
 eEAwLJ3bX+FQw/HfGVRBvyeQ+Lv6SFm4Q7m297WskgeXDykQ0tFSOcG9rm0sELUAoM7AhfxTPeoHF
 ahSfI4LSAeMMRfv7PQQFPPmOY7PVJx/qDLlK+ebAx8cTDbwANMjHySd5CMEnqmNvF6LSVn23/wWMk
 uWcEQtqf1iXFkLjLTXTPrgmrkdYOjlJ7efTQgIV+ReuwRbnR11thgJP+phn5REbB4lLOtQuWAnaK+
 PGXT23Qlsi8v9eE1lCZVW1/6FKp/InD8LyxrStkSJeD7Fwl6QhtgY1/Nbr3HlVN5n6e2h4w5+v57D
 nvX6c86w==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufCSQ-003a8P-7I
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 09:03:06 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/1] remapped fb view test
Date: Fri, 25 Jul 2025 08:03:04 +0100
Message-ID: <20250725070305.87218-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 106 ++++++++++++++++++-------
 1 file changed, 79 insertions(+), 27 deletions(-)

-- 
2.48.0

