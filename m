Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2184CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 13:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1D10E4D3;
	Tue, 26 May 2026 13:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FRGkHE9j";
	dkim-atps=neutral
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BD510E34F
 for <intel-xe@lists.freedesktop.org>; Sun, 24 May 2026 21:33:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso75458855e9.0
 for <intel-xe@lists.freedesktop.org>; Sun, 24 May 2026 14:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779658400; cv=none;
 d=google.com; s=arc-20240605;
 b=AGs89G7KmI1N2nyWjXvqlowKdPfjQU4QLWohPgifOvtLNUJ78h9dRoWRfPHTE/q/2x
 K8c09V9LiyvGA664UG1NlId5LSnBJGJqfUS+yUDSVMENtW3Ho2USyDknVZd34Q8p/DgX
 qfatqrNPDu+P1U1gcgyW5FQ68WuLqt12IISovNUVuEDe5Sj+pVkCKPyWAelnxeW3Is0y
 5kxZpNuUSsvncen/H14/0SK/TLV2CiGGQdlct7qYXsEEO31453FXXY+gNAkEPrV/bReC
 tQwydFVptZ3CALDpZqjO8vAGNSIBs6eQKHoDfZsccTyv0Qt+OGaVotwD+3yAzdqpOBZ1
 p8iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=RfBHHtWh1E5iPfg08hDGPxdg+iSUq3Vo7ZICvTuwHxk=;
 fh=X0Cfb3ty7YRhoQKtGP5iD18irW1KszGnifJSnVBLr/Y=;
 b=AvIcpSionPnLMhO//UALwRcZ2JtNNhs15EJ/9BxQTknB6UFucTVda83sID/g7lD+HJ
 J+uNLXXADlpj28TGDq1QYiZMK2+ghB40DO3PZiYrhTekDbBTbyMhi77pLn+1bbe9oxgr
 3veJcWClSSQT8+vnHYhRG83g80JMUkaEJksShsyXlVrasfoarekXHfTJ+AzUZYs99Y9D
 uz74XR8+hIptPIlyF814ZSW4jsmUFeSyob6CBmXaFuRCTUJD4fN/6/3B7UM7mBRflZt3
 WkqBumXamPc/cHlDKFOamAwGoc3+1xtEifsGdpiO3jb6FOmWPaGe/SQcHBmk+PafpS54
 +LIg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779658400; x=1780263200; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RfBHHtWh1E5iPfg08hDGPxdg+iSUq3Vo7ZICvTuwHxk=;
 b=FRGkHE9jAhuLY7lflKPlQcu98V+coRIiYtVFdgNep5JC9N/ZznUw6FrVr00qPB9klt
 9VxoNF1Y2m0bhaqs0yk3LuQkI01ChzmYiOkiiOsavveRredKXc+RoMAozcYyNkD8KVLs
 chvgxwM0HKqd1qhS8d9xIdZxUbHh1T0sq/9fFlZCv3b6OB4SjH48h5Fbx/KsfrbVsDTg
 T4ouxZ3SYp/hz+X/gaKTKE0ajn5Fse36U/aBkeSGU20SqQMwb8Rtp72mD19TA7Jp7RA/
 3V26W+Wja3fItUJG4UB7LJKT8JnM3jsV1BE9i//1m9AfopopnqMlqu1FHfjSrVnNHNjz
 RdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779658400; x=1780263200;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RfBHHtWh1E5iPfg08hDGPxdg+iSUq3Vo7ZICvTuwHxk=;
 b=fmeIZY4tpq/kQVdPjhy2PsMJ7EhqO/7jDuGiUGFmgHpzmquY+0cBVCmjEg4HPfQz5A
 qvdKwE7D+et0kLe4PRrG95lW6qKldZkqV42xyqDMZCFWsfyAWr/JdHNtO2JaRmX8Fbe+
 CCN5metdsa1089xdJIB1m3kiRGruUvRFDNlLq+R8G7878HDcCITVlVb6ZmzHTPExOMvr
 /G3t8lIy+B3zEKOoeLHmpCrtHhotqYVBMCdkeEqpjxI+4Byv+nbPI2NYNppGH5sCXq2o
 Ts/Hv7NxUWxw0zwmLiBAhe9elEh64v/dUJH9qrf4NpeD1fh9YvV1bPtVI8gLG3r6hk/4
 iKVg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8bkuQQgPF81AgWxSAdGNjrxJKWoZ+aATgyFfySPweVRw0Eq5m1D184gs9iSLQ3zi2PVzTYqWgIrw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfQZHLlIlHVuKkRTdtVgVExwds1VGde1zXcVGbRsqceEk4KLoW
 pMundVCY82nDbYnDuew87GxT2nhUh5QR6FHBd9Ca8EWE29EK9hTydbXu48k3LE6fHTNYLEmLy3F
 xiOFr7wzOhEjq/3yaeiNXrUOXk4kRwjc=
X-Gm-Gg: Acq92OFklY60D+EML3NPKbAUoKe9fraW3Y3FEe1phpI4fd9KK+5knRP53lnyB7zdoyt
 5VZbBGMsgH9QpDyrINTgx2/qkzI34uXfy2q0qXojavUzGO8xfwY8hP5jDkN+RM5WP5H8FqACqIv
 3sLBoqxStJ9cFPkyM66DWokEArbVzaJdauTY+1ob4rRqpIjspUlFviY8HmANI3hL4zpB4IyiQHE
 u2Qw9KpyyAfKiTm42qWktJtcB93dujihkSzZYMdjI1OHM3DXwbM3ttzXDEPKnaTtGPLD3h4SuIt
 gp5s6MqzwG53sgoU11gozgt6ony7kONJzzgcQDSMrADx6vYQTD7H
X-Received: by 2002:a05:600c:19cb:b0:490:507c:bdb1 with SMTP id
 5b1f17b1804b1-490507cbed4mr133267705e9.15.1779658399829; Sun, 24 May 2026
 14:33:19 -0700 (PDT)
MIME-Version: 1.0
From: Misty Robinson <11111577m@gmail.com>
Date: Sun, 24 May 2026 17:33:09 -0400
X-Gm-Features: AVHnY4LYUQ0Tyb2yqL4DCU3LkzUo1pVpr98xcI4oG9pyvGMAS9XPi4QkbHlPExg
Message-ID: <CAFufjN0cNAx9=xfNOTVZzm9wi8TjWGCRd0Bu_7P_QQUHj_BYNw@mail.gmail.com>
Subject: Re: [PATCH v5 05/19] drm/mode-config: Document drm_private_obj
 exclusion from drm_mode_config_reset()
To: mripard@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, alex.hung@amd.com, 
 andrzej.hajda@intel.com, contact@emersion.fr, corbet@lwn.net, 
 daniels@collabora.com, dave.stevenson@raspberrypi.com, 
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com, 
 jernej.skrabec@gmail.com, jonas@kwiboo.se, joonas.lahtinen@linux.intel.com, 
 jyri.sarha@iki.fi, kernel-list@raspberrypi.com, 
 laurent.pinchart+renesas@ideasonboard.com, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 maarten.lankhorst@linux.intel.com, mcanal@igalia.com, mwen@igalia.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, rodrigo.vivi@intel.com, 
 samuel@sholland.org, sebastian.wick@redhat.com, simona@ffwll.ch, 
 skhan@linuxfoundation.org, tomi.valkeinen@ideasonboard.com, 
 tursulin@ursulin.net, tzimmermann@suse.de, wens@kernel.org
Content-Type: multipart/alternative; boundary="000000000000be51920652970205"
X-Mailman-Approved-At: Tue, 26 May 2026 13:01:58 +0000
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

--000000000000be51920652970205
Content-Type: text/plain; charset="UTF-8"



--000000000000be51920652970205
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--000000000000be51920652970205--
