Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD6EC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 19:09:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031F710E3CB;
	Mon, 27 Nov 2023 19:09:50 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F203510E3CB
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 19:09:48 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50aa8c0af41so5684544e87.1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 11:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701112186; x=1701716986; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xBnFsoc/Ws6fBQizRfz+6MJ8Kn/4IFPbm03qaKSmf6I=;
 b=PxFyBGFVVPtYw/T1JVviZ7C4TD9xIn2shKBV9kDzXmMpJlSbZ9sVQ9M5/ye2+Z2bKG
 FSEfYJeAjri24qQpmDaVZfihjru3+nsRpj/rtykOIx/5R/iMTr4RuJSg1VEOpfnqFjXH
 PdS/2RggcE5aKfNRX8Y7D9nVQe8yNYDdjh6AIOCBFdk3oGjyUDkeDWx0uCBblMdF5ce6
 EJ0bH9ZvA6KmiplvmnyeqysUdqSmzJ8NFgpaUOqy+BH6Aq76YqXtRWXhVrUbB/4V7Jvm
 OaIh6X+peUxVFVfo3DtbfxcF0h1a9VJ7sM/sv/ZY10OO9BZZVWgs0/1MM3fnyP7X5km4
 nUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701112186; x=1701716986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xBnFsoc/Ws6fBQizRfz+6MJ8Kn/4IFPbm03qaKSmf6I=;
 b=E5xO7g/o73c//kgxHzGUOudYxTuqDvG40W0AUuPqvfLA53Bnn1PMaTeIOTkv06jnNI
 uXoe1yi6GEadaW6PvwAWxSEfAsyl00O8JPs6MmpNi2CNaIfBas+9F56sYai62nRlvnga
 MoN0YvKCXTgPu7etSHvgYWECKCmPSpPbaXa1oVYrBbik84zCCRkKuBUw+Ca/2IvbZO8L
 JkKSwoZo8OR4trEYDYpWrhq0VmYf4B97opLDOoLDLVuj2iokToyhsum3wTJ46J5s2gr3
 wVyYgn6yYcyVDRSglGLJf7q8iQJhUxu0RdsUkBHedryoOUuwKrnLLLzsOil9/U/dUhB5
 VCPQ==
X-Gm-Message-State: AOJu0YxlFB4UuaVkqQwmvDzPqY2ogw7NP8SGaLTMvS1xxMbQ4crIvvXN
 dnYEPCdiCwgJsKBShcflXGOQf6Ml8u2umEo2
X-Google-Smtp-Source: AGHT+IGnX71i9sFlOxZJKhUBoeCxrV4IXtm4jz9sEW1OJvQkuHsafdxcQBnArW5TD4XRYWk2Tn1jRQ==
X-Received: by 2002:ac2:5a04:0:b0:500:acae:30c5 with SMTP id
 q4-20020ac25a04000000b00500acae30c5mr4743570lfn.15.1701112186241; 
 Mon, 27 Nov 2023 11:09:46 -0800 (PST)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 eo27-20020a056512481b00b00507a0098424sm1573810lfb.109.2023.11.27.11.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:09:45 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Nov 2023 21:09:29 +0200
Message-Id: <20231127190935.3150610-1-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/6] revert local patches and cherrypick same
 patches from drm-tip
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

Here reverted local
* 1c7037778222 - drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo (12 days ago) <Juha-Pekka Heikkila>
* d192a479c592 - drm/i915/display: in skl_surf_address check for dpt-vma (12 days ago) <Juha-Pekka Heikkila>
* c87774bd9237 - drm/i915/display: Separate xe and i915 common dpt code into own file (12 days ago) <Juha-Pekka Heikkila>

and cherrypicked from drm-tip
| | * | | | | 12b7142e679f - drm/i915/display: In intel_framebuffer_init switch to use intel_bo_to_drm_bo (4 days ago) <Juha-Pekka Heikkila>
| | * | | | | 185b24883e27 - drm/i915/display: in skl_surf_address check for dpt-vma (4 days ago) <Juha-Pekka Heikkila>
| | * | | | | 1aba67132cbc - drm/i915/display: Separate xe and i915 common dpt code into own file (4 days ago) <Juha-Pekka Heikkila>


Juha-Pekka Heikkila (6):
  Revert "drm/i915/display: In intel_framebuffer_init switch to use
    intel_bo_to_drm_bo"
  Revert "drm/i915/display: in skl_surf_address check for dpt-vma"
  Revert "drm/i915/display: Separate xe and i915 common dpt code into
    own file"
  drm/i915/display: In intel_framebuffer_init switch to use
    intel_bo_to_drm_bo
  drm/i915/display: in skl_surf_address check for dpt-vma
  drm/i915/display: Separate xe and i915 common dpt code into own file


-- 
2.25.1

