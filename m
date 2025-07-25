Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ACCC87FCA
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 06:59:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522EA10E146;
	Fri, 25 Jul 2025 06:59:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SPo87leO";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A0E10E146
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 06:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dioTJO6gjxybhbUJHWDbldd2kTNuT+eT6eEJFx/XYnk=; b=SPo87leOxe8hfiikqpdACWjacN
 K4TzA5+DK4FX32087T3PivkfrqgztTfyoloj6Abvpx/+8sHwJA5yvRmwHAVTGE70vvLpmWtcVMHbS
 l6Y1Qc9XK6X/yj4XxLaHLdivH60tNYk4UYLMhM0qWqIScA1EZ19VCF8AKCOpzjELpO5aOixH8y/MM
 gci5VzMmBUOueBYglz63THARRCyPkH24uvYGO2Pv65DzDTz7OOUXlNsIZhyy8cVBud/gvYbHkGzmG
 8QFYzmvk30fnHqdhCpkPe4g7mXaZSWfFfAkZ4kN7Q/xeAU064GKiRvnCSMQhYiC3j/Kf+aziwBikQ
 O8kNMjvQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufCOS-003a1o-VP
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 08:59:01 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 0/2] dpt flushing test run
Date: Fri, 25 Jul 2025 07:58:57 +0100
Message-ID: <20250725065900.87131-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Tvrtko Ursulin (2):
  drm/xe: Flush GGTT writes after populating DPT
  drm/xe: Handle DPT in system memory

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

-- 
2.48.0

