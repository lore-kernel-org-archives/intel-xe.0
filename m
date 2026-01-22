Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680B6D3EE8A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 16:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EE110E9F8;
	Thu, 22 Jan 2026 16:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kde.org header.i=@kde.org header.b="Hu+gkBS7";
	dkim-atps=neutral
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236B210E9F8
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 16:23:21 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41]) (Authenticated sender: zamundaaa)
 by letterbox.kde.org (Postfix) with ESMTPSA id 4DAAA33FA77
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 16:23:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1769098999; bh=PgfXXowprx8l1j4KQrAvUuzHf57GYkyHDe6d/fX5x5Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Hu+gkBS7+hqSMbieEZ3sqcsdXksXTOo7O0gIWWNFNnPDnZVsCXgtQEGTa0eFOir65
 QWGNHAwrVcio4AtF7IkXMBZMobsuX3rFjwtzesCH+r7I/DHMpc9RRmJgb9sDzxmITF
 ppgC671hyLztnNo0iwwKCfzlzs4wXCc4FanzDMz9MeQRPWYu+ZyUzMvPbFR43ZDEtz
 Q5EHkrsQg5AgIpTK037zHQuQDHX4YuXb76gwdQ8TWDoBCuAUMPQIjpgL/r096VCfm4
 AvLi0sY6vYIPol6cR0fFg+v2k8ia/fimHlJWHqBCy/6RzgDG7N9QtiTRWqKd/Nrliz
 ixoSGMOaVijXA==
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-6447743ce90so1036331d50.2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 08:23:19 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUv2kwmGvZVzBxntc2Cbj0ACZ8SkxEIytKBX18LInisliKvNkSPRD3MfQSBrGSv28lhBWWZDG1O8g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcw+iMa7E8kDylrQ4kv2OKyRN2dcNPe3kTVkNIuXhaHzVAtEnk
 PvX0DlIhmE1NSzEYF+mmPqmCUiC4p9jyVYO4mTN9SkxqLTpsM3B+YWg/mSXKDLwEJMyyGnBGAku
 cC3O/u9KZ5jFr/+doRcb5goITe+Ckp4I=
X-Received: by 2002:a05:690c:6809:b0:793:c8ab:8bc5 with SMTP id
 00721157ae682-794399dbb62mr329177b3.46.1769098997747; Thu, 22 Jan 2026
 08:23:17 -0800 (PST)
MIME-Version: 1.0
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
 <20260106-atomic-v7-1-d51d9a351684@intel.com>
 <CAFZQkGzQ3GmUHibTJS2xCWsya2=Bh_Uo8zjqN5f_K4HMdfpHCA@mail.gmail.com>
 <CAFZQkGwdpfEzv=210AQxBhqauj4NmSQCb1m1xfD1+e6rsTrwow@mail.gmail.com>
 <d481788c-227f-479f-bc2a-7e30d55832bd@intel.com>
In-Reply-To: <d481788c-227f-479f-bc2a-7e30d55832bd@intel.com>
From: Xaver Hugl <xaver.hugl@kde.org>
Date: Thu, 22 Jan 2026 17:23:06 +0100
X-Gmail-Original-Message-ID: <CAFZQkGwi4rDETVto2gStr0faNWNVzdhzoR4Akj1MVNYoDVw4XA@mail.gmail.com>
X-Gm-Features: AZwV_QhCWBDUaUJYmXroAnhWrWZ0nTSaaqnzjcJ_2ageBiz7Z4TcmlXq9iapCgA
Message-ID: <CAFZQkGwi4rDETVto2gStr0faNWNVzdhzoR4Akj1MVNYoDVw4XA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] drm: Define user readable error codes for atomic
 ioctl
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
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

> No new UAPI is added for this and would be enabled by default with
> atomic ioctl.
I didn't mean a client cap, but a driver one. The compositor needs to
know that it can set the reserved field to a non-zero value without
the kernel rejecting that commit.
