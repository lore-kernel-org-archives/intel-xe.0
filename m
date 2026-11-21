Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC7606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=Jql1qct1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9C910EEE5;
	Mon, 23 Nov 2026 15:17:45 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEDF10E9A5
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 12:25:59 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-9495f083657so222548685a.0
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 04:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795263959; x=1795868759;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZfJPa8uUh2EsffvwpmDril+FeS3X90n3oLx7atj56Zs=;
 b=Jql1qct1KY3Qjq8zVZcZWlIV7ggU2P104henqNtHstg39seHOlLx4mOuZAXYPinhvQ
 2Stv75+MbGW7Mz29T5bkTEcWEtD0KcJI6etoJdJuDuBocUl4+yt4EQBmo8S0Yr9zCjfB
 0yJwUa06ey8yQGCQwYLRcT0u2Odi81oGk1tX48ujkK98GbxweQXH18x5uS6faOEk2gCw
 y5bJr8hqz0mZ+yDGSeUqnP5OAZBlBvLx9bOi9pl5XeZjhiT7iZyzwOOACekSkD4aGZNQ
 xoDallDOXsQrPakHTiXWbKybRcBQcPg5Q9/65iYKV7sDDE0oyPWTEhbmgqHY0pdgKnSf
 7RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795263959; x=1795868759;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZfJPa8uUh2EsffvwpmDril+FeS3X90n3oLx7atj56Zs=;
 b=aPN66hZ9b08s7MRG48ZLKWm1+kd9VF0NUWFc5y7GVKt7Mv4Zoc/JZip9n4aLQ1/cgO
 kD/jT5AzZTSI/ovpp2H8Er+M4xftgtKPAX2P8r8icp9xEJpsp65sNOb4HdTiC6UOoenE
 k1XV67ywh8vyVTiA36O8I1YJPJEnGzMaPHU1zgEOSuvRGzJy87PWaCsGzA11WfQJXE9B
 tk1pVfilLS6p+jvKdXE8LGM35k/tJEyVy3p3Jn1PxYGXgQTMyGkxE/0D4tYAwca6O45v
 D1Kuia/xJfyb/zDb0SjM3IxTB6sozH6A1PsLtL69saHVZXBQHJkE3yoLNnI1dGKvHh5q
 NE4g==
X-Forwarded-Encrypted: i=1;
 AL+hErHrMAhFuxT8MMhmrs5IawCOx8QhVAp5qr0tIgng2oP4IfQU338rzA9gSa3YWxfqCr9EXwI8MlWNtw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+zmgDVj5ir7YXVXnM6K5ogP7FeqxE1FZ3+dwWJrADNVvoUeQo7
 Qd9E0Yjfn5dAwg9JeShKxkZWBxmgSxyidiB2nZBWXaPC1EYYK/7vIRDS/0ePAYsvdjw=
X-Gm-Gg: AZFdTZezFyjTSoWB2bz35BxTNmOWhoVnAGpYCy16rUUlW65mhrzoPnki89GeLbh7Ieb
 XKvIK+ULvMra5khGzDAuLnoygGaAotAwReEFMV4Em3CZAXlJjBA+OxNC9GfPv7plFJfZqTHkk9v
 5FkeB0rGO8ZUe5gSNigP7oqdxrpggOLPRiJhtNJMIHJJ9hwRzLfnaeT0d1OKjhcn4fh5zj+gUlE
 QjNCKKiHBTljigrxspYywk3OvGCFTdP3lo+WWSP5ydiIk/Gi0r0u/g+fMnDU05+kqdmywKPLDMm
 65opzNilK5aNKWbL9YjTZNX5v2FqJftw1eVi8yIzf6lH7Iwi336wfSg4dyTSMgjkmJdUfwU2xmp
 kIDe3GNaCr0nVbgNRQv2D7yIdQTaqsDcdMiT+X0CvKA2hpzWcqJ5cRN64w0dH6MIKT+IVwIocWL
 tdKivpo13tpYEzz3h7M+ZxheYWyTBwX/O0ri2wh5Mh99mD6DIKUBLxrJkeZkPsGlvs3Rip5LG8s
 3ipZrgNb3Edk2igG7o3GDMb0lIGyE3Eb8230tIIuAQGOqZScjLUWvgeH4ZJUhtes0K7mCglD86f
 6fQbh04GaiV9XGCDsgO52DCGGh2eq2Noi7Jd8Pem2Kbe09LYYP5Hc/Lvz7F5K6ikhsYUF/MUnK4
 WIONLE72qSf95kERC73df5Oub1VZifwcxoOUdUJ91dK7qyToViFh72sn7JpdhsuACLAt5XHxMVA
 9TE9/Yvn4SH+LAKMOpYL5r6wfiNE4wjNv+K0uDN+ReWBSeM4/QUnlmupWAhl02Y3XLOhmhuYtvL
 A0p4kB6
X-Received: by 2002:a05:620a:700e:b0:93b:db80:e0cf with SMTP id
 af79cd13be357-949bab5101emr917995085a.60.1795263958848; 
 Sat, 21 Nov 2026 04:25:58 -0800 (PST)
Received: from jake-laptop ([153.67.1.15]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb4004e8sm407029185a.33.2026.11.21.04.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 04:25:58 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v2 4/4] drm/i915/display: Remove the Panel Replay quirk for
 Dell XPS 16 DA16260
Date: Sat, 21 Nov 2026 07:25:50 -0500
Message-ID: <8f1f576d6f816654a9c24f0bd00f9fde469da061.1795263689.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795263689.git.j@metarealtyinc.ca>
References: <awCCGeCxHToY8tsI@intel.com>
 <cover.1795263689.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
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

