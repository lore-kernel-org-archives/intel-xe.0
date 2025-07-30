Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD836C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 14:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9119510E7AF;
	Thu, 31 Jul 2025 14:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VOLzCjRs";
	dkim-atps=neutral
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD7810E21B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 16:16:48 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-71840959355so12228997b3.1
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 09:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753892207; x=1754497007; darn=lists.freedesktop.org;
 h=message-id:subject:to:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dvq1MPvNC+UUn6WXzOeHefYShSdkA00farn93A4MAZU=;
 b=VOLzCjRsZSuK1ArlicxkbYZX6EQaIpydILK1RjnOwpc5FpRskde8SVO5utZqZqo4sn
 QI8rUkGkKVndWcHBr3J7NiGg9/RmfWK2npHIp78y8ms3v8RiW87RvVNZPwl5dxUt/aa5
 4R2PFiO2jdRfP+rHYSfAjqPIS+wVDMUrlz/cEasN3do7OcxKq095SPkGWyd0h0VgUF7C
 MorAm/SjtGk/xT7Xb9FEBujL6S22hLgQOg4CypWNeXTGksWGaJbxP5iAKnwvlQAMcAU6
 bxUKs9quT8ODTdLLnaCqPC8G9rdwOYgR81aenJzNPAGvqHTy5mVhQ8C8L94VQmQpX8so
 qJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753892207; x=1754497007;
 h=message-id:subject:to:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvq1MPvNC+UUn6WXzOeHefYShSdkA00farn93A4MAZU=;
 b=n/qUEmEkmlo1Yt1IOD5HrPyOoNPbxEiuk7fU8obaTRE3fKjZtTwvk9U3oC2R7u2Fx/
 PNecnIiEjRvb4bQjdXZ+/+oXZC9BF0UuwM+H9VJ494yR9FX9EYkco6ivpL9AHLxd3wcf
 bPlnkoCUDjqVGcf7/y2+rJ0h+svJnPprz34bvTbof2riDCMQ/S/5SeXx518VupyvQcFY
 RGImlp4pAH+ceBLrQtgNxTiCTszr+X+Un+voD7bqsh7nc4sARp9hnfPcZL3FAXTO396t
 P7cgPD3H4z1aLhHMc8RwEuzAo5iCVN+x9PGiTrBCS1R6tGM67/TljHQOEvk8JJxma1Sx
 BcWQ==
X-Gm-Message-State: AOJu0YwRs4C2W749deo44SLDi0G/xnfBnVERafTWrz4TN8jUEZsyVo5S
 lgnr8s9mru0pzTvWW6IYNkxPHxWbha95JqtR4VA0j2oTR1evxKAwWCY7f6h3ZCpv
X-Gm-Gg: ASbGncvYZYamq6TtdAS3/cJELDli5WX1Af1aVAT+AdFuB6+iauNDf30fL0VhKzhPv5f
 E2rLuYCcqHb9mHj7U+VMcNErAIA6JWEUSsCuI5UANmtOFqTvEsYwsmd8r5aL2fi7uF4cOLkRnET
 Zt29k9ZhUI3xwVA9y4y1n3QnQKjChPsl8RB/J8OSuVVC91rgIgP4Zc/s/e+ntKPPhSjxuYWst9J
 iTLD5j64Dj0/6BCGKQbWbb9Wi0yb/AtyAZK7aef7Gxo+IFAxt+1LyWYBksd/xQG6kO5CdBNjA4U
 SAKATpDCXiebc3D2l5TeXk7oltjqOab54vkqhQ/GgOW17pyKJyI18MrZ7loi0SB9GH+NilL1HSR
 RG95dMndIayMfPkk=
X-Google-Smtp-Source: AGHT+IGNW2mqHIpT6kS1AoOhNJk9VM4ANaRkapxVhkZUt53dKtPQy2ZQwxGVzDxdEzejrgHUWBPQyQ==
X-Received: by 2002:a05:690c:6d84:b0:712:cc11:b02 with SMTP id
 00721157ae682-71a3485b2aamr102843877b3.4.1753892205934; 
 Wed, 30 Jul 2025 09:16:45 -0700 (PDT)
Received: from ptt-vm1 ([40.112.185.190]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-719f1fcd9c4sm25015037b3.0.2025.07.30.09.16.45
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 09:16:45 -0700 (PDT)
From: pttfuser4@gmail.com
X-Google-Original-From: testuser@intel.com
Date: Wed, 30 Jul 2025 16:16:44 +0000
To: intel-xe@lists.freedesktop.org
Subject: [v3,1/6] drm/pagemap: test email 
Message-Id: <20250730161644.001932@ptt-vm1>
X-Mailer: swaks v20240103.0 jetmore.org/john/code/swaks/
X-Mailman-Approved-At: Thu, 31 Jul 2025 14:41:59 +0000
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

Hello there!


