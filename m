Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6B0606A329
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=WEjOfnom
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4337810FCE0;
	Wed, 25 Nov 2026 14:58:47 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE2F10F699
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 15:37:03 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-55d03bfd477so53898731cf.1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795534622; x=1796139422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZfJPa8uUh2EsffvwpmDril+FeS3X90n3oLx7atj56Zs=;
 b=WEjOfnomNHjQOjx3P/PxEqb/dlFspbhU39mLb0Lw1veC7C5O00GVQN8ve5fJkizXuw
 mTSo/eL36JIQrspIRQ7psOJf0NtYpun8qYc2c0T2IeWaxIF/xHtG/yRYZCtObfjQGRcr
 MvFOqql3sMsbTTtf25LK5JSUKl1X+FMe9ZD90Vg5GU6WZsVKZP3WzbfYKdXKWfBVlLQW
 kojbm3t4edzoTWmPewVtWjlMBMR+A4qPYNjow1L20RXg5y5BvMlfSasRg+VWbGkub944
 D1m9C/1+oQJ7GjJYWYKva8HjpisLCa2cI/wQiVUQzcJkXOqelztcOcyq1en/6QL+BRgz
 5G6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795534622; x=1796139422;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZfJPa8uUh2EsffvwpmDril+FeS3X90n3oLx7atj56Zs=;
 b=OHmxCUQR9jGvkDAZghxv57nDReVC5mrGcN8ywD+CCWJNlvGSqTdJ47uuSM+VVNzv3U
 dbUcsS2a6RycdpHB5hzQtj35tpzAxRHfMPyhAb/4kfWeTyIQTQBgIaXlE7cKDei1rFID
 HiYWKGsLBcFhL524Hjx8gg1BqFM7suW9GRQzM/4SD9ZLpiE6MSJcF0EZKhYoECCcytvv
 enBG5irzUljjdprN7vLncRp2TsOw5VhQ2RrsD/dkx5f+sva4l6x9zGWfvrJykYK+Fx/k
 s8lXw4J2jhEBaGjLniBtE8AZ5moK/W6diejn/HWx6jMBShSlBWL2GkmHxZmC/B+EU2fH
 MbZg==
X-Forwarded-Encrypted: i=1;
 AL+hErGTD2AxT5CyaW27rBCLf0bdetGZ3Ngemmpy2QdL3O5E0iGDRczR+YkF6d5AiQ4JI53/biym2nRkRA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+AXzHta9gfxrxtlxrihIFhoLe62OdykfnOFqttrMpoSvZW20ha
 /FqPc4hzoVFayyjuBqJQgNnc2lKl5Dk73O+tf5lcj6LLQ3VYWs/93Dzn53Jx2zbUiLA=
X-Gm-Gg: AZFdTZcQDGXhdVCfEj79LTdTV1r9a7Jzj1SXLelTl9BSTRv1TUTJgPKfqaaKQyFORM6
 hfPrqYahATKZ3jI7ebH16DjgBgIa8zxmdLSC2EigBI2dzKWU/7IGQFMrZKVf+G29IjyFMG8CKu5
 Epo3f6AiaTRq8i+XVaTG3++xSnINdGTxG2BeFDH3ROf2KpewA+trBdeK8FmJmhhGDYTThY5GLwj
 GRTMs2Sf2XpfXMcivS2MlB0+ztiAkWATM6BKnX2g9o+AlKyr+UR9/lDrUPvP19NjL9/goaFWzfs
 /k0RRe05xJ1kx/7Cl+G1jFsIrmplDdyo/fwon3trxdIYm5OLq/ZT3WQCe613EdU0HiKaqHEHClb
 3C75084pTCb/l66g8cO1WX2VmFC7ZOgKgJqBkM0IMUhQniZ2NtllQPQP4gnNcsRlezrA8WfAuHE
 77YH3p4eUn/x94lZKSCPpZo/SwxDsEAdA8jxSW4c4HMCNKtkg2rC/LksWkbb4BFGTMrC3tPLHtw
 oe/6fkDyO3hYv0kuPqer7mVXVsz6toYLriUdihnEPxEICNTJBCQ6P/CZ5VcNnMptTiCuvvDv0kK
 vWxHEL9kg3XCmXLdu0rPUqjK5PR9GbrAwuP/powLKzUVwUAcIINhkPWBohl/5L14s/yIXj+QEGK
 hH5p+rAPXwjVBTCKQDFsYYj6i3dsLQ4rCchKwDqst/NlItndnjGG8b67AMK328P6+BPf8DiTzvu
 iPk6E2qSg2fuMM6q5K1mPrraGcOB/H2S9bq9byD/AfGhHXRCi2wXFBzqGkBnQN0DWLwGKL2F42i
 PAHyug1px+BpQ==
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id
 af79cd13be357-949ba9e882fmr2493492185a.56.1795534621955; 
 Tue, 24 Nov 2026 07:37:01 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94a0175c67fsm26215985a.31.2026.11.24.07.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 07:37:01 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 4/4] drm/i915/display: Remove the Panel Replay quirk for
 Dell XPS 16 DA16260
Date: Tue, 24 Nov 2026 10:36:55 -0500
Message-ID: <3a76c676f2d4a1785dcaa42ebb76bc8fd9bba405.1795527921.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795527921.git.j@metarealtyinc.ca>
References: <3077ed0636a6c98e919934d2c860461f98222537.camel@intel.com>
 <cover.1795527921.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Nov 2026 14:58:40 +0000
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Panel Replay was disabled on the Dell XPS 16 DA16260 because the panel
judders with it. The judder comes from the AS SDP being suspended in PR
Active, which the previous patches fix by sending it while frames are
being updated. Panel Replay Selective Update works on this
laptop now, so remove the quirk.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9119
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 96eb9a40d..6070440f8 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -289,14 +289,6 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
 		.hook = quirk_disable_edp_panel_replay,
 	},
-	/* Dell XPS 16 DA16260 */
-	{
-		.device = DEVICE_ID_ANY,
-		.subsystem_vendor = 0x1028,
-		.subsystem_device = 0x0dba,
-		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
-		.hook = quirk_disable_edp_panel_replay,
-	},
 	/* TUXEDO InsanityBook 15 v1 */
 	{
 		.device = 0x591b,
-- 
2.56.1

