Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D6C4453B
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 13:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BA210E802;
	Wed, 21 Jan 2026 13:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="dKpl6QC2";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3C310E800
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 13:58:47 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 595F133FB69
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 13:58:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1769003926; bh=t+WAegLd0O2DA7u4H3Ymm5GHutH0tSda5Ue+u5MqbKo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dKpl6QC24aDxNbPcdRMGR67Strq0xoxamUE44MsHf8qW24/6jfsk4hD79rR/KSLmX
 JyOEGNp8XxtIl0EtKhAfDYI75UzVsmodkNXNfPxbY06ZGqQOh0YfRuuByKC65B3OVE
 GpNKmoNRC30JLnQItNBFwIqnO5SV1ZRzsezq8s8AXJ1PV2iU3uKC3Stfw68FpuczZM
 zEwwLePy2yBMeFis8UycwhbijsCBDnhRnK+Fp22+U0tMGdgb0BHPhzC5uMAYdnJkt0
 NEclQY/D3vvbM66rYdXZUV/pLqIOzIdo4r11nKgrooylgzDI9yE8jSCLexyKm6JBK1
 FAYidJud3+dng==
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-649166a96a9so6056243d50.3
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 05:58:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQMjG8HXeMr+YQdoxSCAbsWZlnuDi60obNDhJ2rKZLwLs9FOJJEVzwYqNr4rsUJtUGx+TrtH2Dcg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxv612AcE1F1H8M0VwqksqRPue4TccrzR0yN7wqcsYVGamrUWMF
 PVQgdnE8boTiGedngq0/1BtEfXH5jTEeQXKR+KMZUFyLnpmRWJhl2fXJH2ofUPgLUfv4GQpsYSK
 DJgr94eRT57/yNHZVmWkMQ/0u2gbDsWc=
X-Received: by 2002:a05:690e:c43:b0:649:4640:f8ee with SMTP id
 956f58d0204a3-6494640f9f8mr1693053d50.6.1769003924752; Wed, 21 Jan 2026
 05:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-1-d51d9a351684@intel.com>
 <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
In-Reply-To: <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Wed, 21 Jan 2026 14:58:33 +0100
X-Gmail-Original-Message-ID: <CAFZQkGwdpfEzv=210AQxBhqauj4NmSQCb1m1xfD1+e6rsTrwow@mail.gmail.com>
X-Gm-Features: AZwV_QgPlPv5DCiiKJt6RSzHn6CFCSx25NGw-cD-v0VCaFqpNEWAu8UUQuVEVMU
Message-ID: <CAFZQkGwdpfEzv=210AQxBhqauj4NmSQCb1m1xfD1+e6rsTrwow@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

Oh, I just noticed: It would help if we had a CAP for this, so the
compositor knows if the new API is supported before doing atomic tests
with it.

- Xaver
