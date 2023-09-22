Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09614CD4F49
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 11:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC64A10E652;
	Fri, 22 Sep 2023 11:17:28 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC2310E652
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 11:17:27 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-502a4f33440so3442480e87.1
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695381445; x=1695986245; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s710j4cYVU4477XH/TqwH7PhyGa/qyI3aPrMgxsfN+k=;
 b=NJBgXGD1H4Rws24WJgoR3OfOLVZknZotmPSXKGHBnucy3Eu3XU63pl6JoL+SHysW/K
 hGVu8AiUAlrUWkideWgCoLCs1YRevUyRmEBA9nxif/NDOt7JneDcfQ7qVZbtOKA8+eCJ
 JnoPqAIbEwWGqLecDXnGE+3jGR6gRSXZkGgQh2n+3yMOzCcJoLb12M/fhEJk8FBKU27p
 hYJ3jx/uib8QLj/QfzYITaFsL2nlawfjb2tZs2vtLASjuYVm34ojVOgTxwo7Lz1CmJSJ
 gIjgHcKorAyoWM8sExclLQLBEu/TXZuO+JBjjecBye2Tec8AWLHDqtB9YaCu0z/pVcbw
 15Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695381445; x=1695986245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s710j4cYVU4477XH/TqwH7PhyGa/qyI3aPrMgxsfN+k=;
 b=tItxnujKiKB1MBY+QuL1D3RvNNBFyi2O39zVE42NjJd4vlgOydRf+eip7TLZnQeuLY
 R8q/zgO5krjNYEeFeITZcqjuTeWqZc1ky6qCY5+l+xDggwf8AXjO2NLdmm788fQRaXdz
 0RBDICAGA6/KiUkzoE/ZQzmc0l66VYrlmUCBL8TF+7utHWguTpdQikH9m2Ou6bVVXoFO
 SgFfvub/y+4I+n1gUSFeBt6URG424ub50A0SptOlkD9ZAc/4KiV09AzjD3kfKXEKmWZh
 NLJ3u+LtCMRmc2WIq8hdMGUBsXsu/4jmU+oz7tPINM5fzXiAFDEe1Ncf+lq4iCdVUoD8
 RLUg==
X-Gm-Message-State: AOJu0Yz0ooaKONiQXGz93HPgTZUaKEuKnK/Q0+h3tZeJSlRT/Le6oX+f
 seOocvx2814xkwMTkQ37fCLqFjlcs3AI4HgJ
X-Google-Smtp-Source: AGHT+IEyqUbHwaZdvj37zDLzs1gAJBKYy7HTtsWejQv1vNpZzX6YghXYz0TOxYShgnkNBx/w/vhyfg==
X-Received: by 2002:a05:6512:328c:b0:4ff:8f71:9713 with SMTP id
 p12-20020a056512328c00b004ff8f719713mr7870921lfe.42.1695381444824; 
 Fri, 22 Sep 2023 04:17:24 -0700 (PDT)
Received: from jheikkil-mobl1.. ([2001:998:22:0:1488:375a:eebd:d2f0])
 by smtp.gmail.com with ESMTPSA id
 r20-20020ac252b4000000b004fea1a2231dsm686502lfm.263.2023.09.22.04.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:17:24 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:17:18 +0300
Message-Id: <20230922111721.302657-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Enable remapped display page table on Xe
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

/Juha-Pekka

Juha-Pekka Heikkila (3):
  drm/xe/display: Add writing of remapped dpt
  drm/xe/display: Enable remapped display page tables
  drm/xe/display: Don't try to use vram if not available

 drivers/gpu/drm/xe/display/xe_fb_pin.c | 57 +++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 11 deletions(-)

-- 
2.25.1

