Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4DAE92723
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 18:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCDD10E480;
	Thu,  5 Oct 2023 18:34:11 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5758510E480
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 18:34:09 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-503397ee920so1658351e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Oct 2023 11:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696530847; x=1697135647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o4koiAzGsUs6RAmUWCIqKrxdBtQyNbi1TFq/iN7h1mY=;
 b=ZONsqMoqEwBK5VGdylb0UiGNyRzpl5naS/RoaPdf6t9lBdhTaIHR3+uajXGXJCtfb9
 BiopzvLzCfo2Xc+xGm8AkxM0aZIi3QNKipFsjSz7sIyiJEZdOCIF+hPANMMY7xCfe+X/
 4eMkKThxld3USdIbDaE+L1m3WF1pZPLVlRsPJoGXVTI1VUNEl+RP+BGBBRZsZoDQQOZt
 J/2i5y5StcCFYZsBtqWBsoCmS7fwOJ0vg4/nkUjk9pQr0v/MmO5aelPh0/77PEinM2nH
 XHKXyN56icc5mbRA0EwiMEyNmo0TQiMvegmghHbXwFzU2ia0LWQKpwaLd5/pbrmOgmGS
 Vtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696530847; x=1697135647;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4koiAzGsUs6RAmUWCIqKrxdBtQyNbi1TFq/iN7h1mY=;
 b=nmFIz1SlnFLlk1/DVqd54gZmupYlE9umYJmSeLhmxYacLZbibs2/+gJevu0vyXtfoa
 dWgIigXesxSQi3DbfKCspmTbGjN5uhZiAitgCiv/wAK5BY9hOfdakMTE973HrLa4wFnd
 +Z1MedGpuoP4qSXPwP12N+O+OCJWXUho8J8iJW0dUqqLtTxPBv9BM3MOgkdu/zpNyBHS
 /A2hki5AEQyUpubXiU41kldXrszDa/G7HM7/HcqZAHbYjCMRGnFGJ0mCFM2T9Y4/3Okt
 Oiq4ms6pEMt3qitrwYfj7EYaZqxmiItIuwB7bniYhFg561Nl9qS5dUDLFMnRYZl0lexP
 UoSg==
X-Gm-Message-State: AOJu0Yxi3nsatYGn2256kmxvKNILoPQ95yq3ZPdXMYL727k0Yr2aLYZB
 GYV9e4wfaEuPPEi8N6nsfJtbxa/1woJO6OmQ
X-Google-Smtp-Source: AGHT+IHunnZMbTiX1uRXaEV9bqjTe/URxXIGYO+BwZAxqAN8YXu5PrbYkhE9Z1EncoNyQzEEYI6NJg==
X-Received: by 2002:a05:6512:250c:b0:503:1b83:e352 with SMTP id
 be12-20020a056512250c00b005031b83e352mr6709122lfb.52.1696530846796; 
 Thu, 05 Oct 2023 11:34:06 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 k14-20020ac2456e000000b004fe0ab60530sm393967lfm.49.2023.10.05.11.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 11:34:06 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  5 Oct 2023 21:34:01 +0300
Message-Id: <20231005183404.324835-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/3] Enable remapped display page table on Xe
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

Here added writing of remapped display page table and taken into use
where needed.

v2. couple of things fixed after forgot to run checkpatch

v3. rebase

/Juha-Pekka

Juha-Pekka Heikkila (3):
  drm/xe/display: Add writing of remapped dpt
  drm/xe/display: Enable remapped display page tables
  drm/xe/display: Don't try to use vram if not available

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 63 +++++++++++++++++++++-----
 1 file changed, 52 insertions(+), 11 deletions(-)

-- 
2.25.1

