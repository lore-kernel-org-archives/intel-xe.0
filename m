Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCC9CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D35B10EB7B;
	Wed, 10 Jun 2026 17:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sms-medipool.de header.i=@sms-medipool.de header.b="B9i/Gdfw";
	dkim-atps=neutral
Received: from mail.sms-medipool.de (mail.sms-medipool.de [178.63.14.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240F210EB72;
 Wed, 10 Jun 2026 17:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sms-medipool.de;
 s=mail; t=1781113780;
 bh=SobVMaaOZ4bAiwKbe1akFUaGQ92+eLF2QbU9ACda2/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B9i/Gdfwpxqr2AfBOjhtZFOR8kjeR5TFtiHj1dFGh4DHfBKY/p3IYSo/JeE2vND2+
 DBmfkaArAsleaeK/rScZCRST6Ao4gIS956PiOQdBEQ2WB1+xVO925ygkN6XzIIoY1s
 t0lpYzH7Sb6pnMdaW6k2Ai7vzT/8eaLM9+Vq4ZcmPBEpbQJLuAs1inrHiFAIg7zhhi
 CLvsKghHWtCDhNqLoMVpy5wBz6k0v3Lhn6hOtteGRsihiUMqFoyMdyhljxioRBuv+t
 zJtqtZWoiF3/khHrQHqGt5hl33blhV9IMjZgsXxyRPCa13yegOU92B57TmFoZuorgi
 EaF5+hATcbuvg==
Received: from mail.stoss-medica.de (mail.stoss-medica.de [213.147.17.40])
 by mail.sms-medipool.de (Postfix) with ESMTPS id D0CEC11D55;
 Wed, 10 Jun 2026 19:49:39 +0200 (CEST)
Received: from NUC16-Linux.sb.golima.de ([95.88.98.111])
 by mail.stoss-medica.de (Kerio Connect 10.0.8 patch 2) with ESMTP;
 Wed, 10 Jun 2026 19:49:39 +0200
From: Alexander Kaplan <alexander.kaplan@sms-medipool.de>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, alexander.kaplan@sms-medipool.de
Subject: Re: [PATCH 0/3] drm/i915/dp: Fix FRL rate selection and deep color
 for HDMI sinks behind FRL PCONs
Date: Wed, 10 Jun 2026 19:49:38 +0200
Message-ID: <20260610174938.6335-1-alexander.kaplan@sms-medipool.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610174413.5881-1-alexander.kaplan@sms-medipool.de>
References: <20260610174413.5881-1-alexander.kaplan@sms-medipool.de>
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

All parts of this fix set are now on the lists, for reference:

[1] this series
[2] drm/dp: Avoid RBR on Synaptics VMM7100 PCONs failing channel EQ
    https://lore.kernel.org/r/20260610174807.6231-1-alexander.kaplan@sms-medipool.de
[3] drm/dp: Read the PCON max FRL bandwidth only for HDMI DFPs
    https://lore.kernel.org/r/20260610174819.6258-1-alexander.kaplan@sms-medipool.de
[4] drm/dp: Service the CEC tunneling IRQ flags without CEC_IRQ in ESI1
    https://lore.kernel.org/r/20260610174833.6284-1-alexander.kaplan@sms-medipool.de

Each part can be merged independently.

Alexander

