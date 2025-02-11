Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70F4C021A4
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 15:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6039810E6E7;
	Tue, 11 Feb 2025 15:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Fi+OpqTj";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EE410E6E0
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739286225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
 b=Fi+OpqTjbNOKytE7YWYT64tMTnx+YARvZucQQxsn/igxR4Psu08lZim2s27FFBo93bdb3z
 FyVwtC5JFEzSv/AOF2CndEwrHWd+EZgKK1n16/shrwNJr35z9jAvK7Z/NbphQUmB/n7I+F
 AB5C5e5IcTeNDpPxqhyfMyz9KdGYGYk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-4p0YeWTZOMWdPsJVyBkr7w-1; Tue, 11 Feb 2025 10:03:42 -0500
X-MC-Unique: 4p0YeWTZOMWdPsJVyBkr7w-1
X-Mimecast-MFC-AGG-ID: 4p0YeWTZOMWdPsJVyBkr7w_1739286220
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4393b6763a3so14801605e9.2
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 07:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739286220; x=1739891020;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
 b=nCmd+eFt6n+A3R6fw50cvdWRy8FvvuGCINyAbOhh8lpeWZj/UikwIAGsfP9W3wRAso
 vjqb8lN6Zz1fESOytW6vAF/iUQZDAATq/gUdJCfundigk26gLDpugaBTrf8Md3BPa6uj
 vLvsyuxvQ/e8gsfNhAnCHbpyaiWVQlNATl/EZsfyOhAnEqzuxJ+XEPuA4TBpSUyixrHL
 fYkaScw8gc4eVuQDUak0uhiIltTElYt0hV4YizHkmgUPACVE25Vl0EsbR5ozUXLxvZ1h
 CQGt2jFzwEt6+iev9ULOc1hMJLUKNUwYXTf6wI0IO7uMRAG3h1Yg+SX8uPHo8hGwBa7p
 c+1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTKEZEyEAxV372Mdf7c3df38ZSfyCAy92YDwYbZijNkOaq8KqI4QLrT+UQVbttIe14FUvT6Lin4A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznsmuu5ax/9fTqMZ2XxOlQIPPM/+yzEFwTMDuyo0Y5HZG0YsD/
 3ASy2x3VoI0zz0jAyZw/qeOJhq1WCVPRPYlAHYda0DYsxIE0E6CSv/l9yXO0CWZc7eOLFA26hMe
 GS5bd3s0BDYfkqBrI96m3Gst70PNGcemBSmx5BOeo+UzIYaIyudR0ZXzs34RMikql
X-Gm-Gg: ASbGncuyq8Fi7OCNhPCpJvBMsTQCAXmZ7ZIpgoDbhdSAbe+IUmf5POAC5GwqmCsdkNY
 ywQsW3MTdl4jZcAlnq1Hwx8EZqFtHKTCxPv99URpYPxTWmtkJGbi5TtBwXI/SoAvNtHA8LXqChY
 YvLka83hbWwixPSsXiQ/8H1F31egUK2iyqWgvAk1mWev/fCpP9WeNscD/rf2oFlmCcBZpoGBPU8
 XndaVLfEPxQELCzedf3yPFw3kOw/5ZLx8U/+jQCVpyZ0c/HrS4FsuzKa3yMeLDUr+qlIw==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id
 5b1f17b1804b1-4394c853a2dmr42858215e9.29.1739286220091; 
 Tue, 11 Feb 2025 07:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN7+RaFI8Q1DlET/AqPOd5Q7ETC0Cm6eLK5eh5/vnngjAmjHCWD7Z20lqQzfUQw3dEBz+m0g==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id
 5b1f17b1804b1-4394c853a2dmr42856745e9.29.1739286219388; 
 Tue, 11 Feb 2025 07:03:39 -0800 (PST)
Received: from pollux ([2a00:79c0:65c:c300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dc5c8c37esm13267156f8f.2.2025.02.11.07.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 07:03:38 -0800 (PST)
Date: Tue, 11 Feb 2025 16:03:36 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Christian Gmeiner <cgmeiner@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z6tmyHpqnpkP2gKq@pollux>
References: <20250211111422.21235-2-phasta@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LsEy8xmgzKib0zP36iz2H8xESflBas9R7y8Vy3qP0DU_1739286220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

On Tue, Feb 11, 2025 at 12:14:23PM +0100, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for Panfrost and Panthor
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> Reviewed-by: Maíra Canal <mcanal@igalia.com> # for v3d

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

