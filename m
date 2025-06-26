Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1050C7EE32
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 11:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992DD10E03E;
	Thu, 26 Jun 2025 11:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZZ3wue1A";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392E210E03E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 11:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TRlrKBRKyKwFYtq/yfgFraVGArgfwXAf0WWell36Fr0=; b=ZZ3wue1A2Agy8FQ6ML/x05abuZ
 AskNaZyLMv5ltlsP3+ujOqu/shyM0oOGz/Rr8g5bTeKCPowfyfVeC7jRSvh5/c2zVg4kuHzPP4mNA
 042xwiKGhsjLQ9qBJJrvTknhm4QbjDLBawVwQ8LhFGRx7PLhJS0CJzF8VhAlPFmbo8oSFLRI+IeY1
 ypnB+RusTO39oBddkLMRUxPVm9qAFhMRVGvDhEUwVhHoBgzauC/TdZHeV1LwfPYcJ97aeOISsEd9S
 +kSYf7uMB5qrzSVkjFJp9yUG6OkKEA4SJGAW5N8bkgnlZPvFOxcWGHe0CgeLiFCmLzy99Xtmt9x0X
 98/7Geag==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uUkSH-008x2f-HD
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 13:07:45 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/5] indirect ctx testing
Date: Thu, 26 Jun 2025 12:07:39 +0100
Message-ID: <20250626110744.34745-1-tvrtko.ursulin@igalia.com>
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

Poor man's trybot ie. nothing to see here move along please. :)

Tvrtko Ursulin (5):
  drm/xe: Consolidate LRC offset calculations
  drm/xe: Generalize wa bb emission code
  drm/xe: Return number of written dwords from workaround batch buffer
    emission
  drm/xe: Allow specifying number of extra dwords at the end of wa bb
    emission
  drm/xe: Add plumbing for indirect context workarounds

 drivers/gpu/drm/xe/regs/xe_lrc_layout.h |   4 +
 drivers/gpu/drm/xe/xe_lrc.c             | 199 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_lrc_types.h       |   5 +-
 3 files changed, 159 insertions(+), 49 deletions(-)

-- 
2.48.0

