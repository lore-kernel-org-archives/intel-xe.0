Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E2CC5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D42410E5BB;
	Wed, 28 May 2025 09:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GuD5QBgx";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778C810E5BB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:22:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so29691725e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748424168; x=1749028968; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JHaaGmjPUQxk+4uMo8wv5Wuk18Qr79/20T/yVeyPV2A=;
 b=GuD5QBgxktFpXC91QqMV/7aoCMwkvTgU6LjenHIAM5Cn58yxpEIXWa0VcBRRfwqGud
 I4ioL4rZg6hpEMN6Ha5xCWGpqn32PvD46wDNG5YlCeabRvmG9W6L21b6bcalGk+1gsYv
 uO6JZImpRiPcwVH1C5s4Nm0h4VUAONLsRvO9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748424168; x=1749028968;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JHaaGmjPUQxk+4uMo8wv5Wuk18Qr79/20T/yVeyPV2A=;
 b=YHd1xr/kIeJMICij/V8PkgIQ+83C7P3ewqhz9m2X3waMOcdkWAEnKjSvCU2pogSI4N
 vBP2z6WA5/YBc9O1+oYoFY5z0znzdcsmX+BZUJW3m1+AA1IibZiqLtZZFNsa/bUkCBka
 cyzf6O4VF+QQF+Mix7TvgIAnsgpoxZRmKLo/rHQPdQyq2glZFsLCJZD4h+EwcplnSMz6
 6/uxlDIf2xq9SeYMNIFgOCsbnT6LSemcK7Xzh488ihBln4aWZEm9dpZbydX1LXBPwN+o
 BT9Cz6AaRUvKT/nctSYnlnbxDQL9rSJ0Hk1xrccBwLHNngWRzS0SD0qx8PNtIZoFCVdX
 DKug==
X-Gm-Message-State: AOJu0Yza2AJ5LEPegU4TFU7J/MbFV0RYC2r4Xu0bmD9Fo7qwn2beFBx9
 k/zitYUxoGKQm5CuB4OxpSlgzx7oS2YzTorsJPkv0L4shsRpk5gwDE1euY7fbcjif/0=
X-Gm-Gg: ASbGnctJB9+3bkhZhVGKR3UCVSGr7IbjI+4bIvG+Kw/5P/gTIiBWjtgAszhY+kiMnJU
 awDxcFtFNA3ZtlX1pJVo0fC2G7qjWJq74EK2D0xvlpA7hmU2QOVn/auGgBQwjTOp/GyQtT00hiM
 wbK6+Lh+aP/r+2nqZTmb4yEPr1G1rX7qk44G9+I9E+8UrWa+iiz5qb9xKI6S+XfWNFQlvvz9Mq1
 pEr4wLtmP8NsEiDbIXOnARFYJiB2vG6n0+v3ja0aHpk1gt8g5ox/01mJu54OzT3kqS+fEDAE8w+
 r/6PlfgDjYIFDM23qKJ4KUjcuIM/Ss8ybpBNUbyhpsNrZikq0cIvqsXhR9Xw+TZZ3nRgbzbBxg=
 =
X-Google-Smtp-Source: AGHT+IFwsctj0py8YOJiG22VOXIUNJUZTaCnjKHN1KQGMhbKocksVyqtSww8b97N8UmjhzaDKloNbw==
X-Received: by 2002:a05:600c:1d84:b0:43c:eea9:f45d with SMTP id
 5b1f17b1804b1-44c939c11bdmr162259025e9.18.1748424167960; 
 Wed, 28 May 2025 02:22:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450787d418dsm11425455e9.40.2025.05.28.02.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:22:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:22:45 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Frank Min <Frank.Min@amd.com>,
 Kent Russell <kent.russell@amd.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: Re: [PATCH 6/8] drm/amdgpu: Add comments about drm_file.object_idr
 issues
Message-ID: <aDbV5QEuEsYOxBQa@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-7-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528091307.1894940-7-simona.vetter@ffwll.ch>
X-Operating-System: Linux phenom 6.12.25-amd64 
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

On Wed, May 28, 2025 at 11:13:04AM +0200, Simona Vetter wrote:
> idr_for_each_entry() is fine, but will prematurely terminate on
> transient NULL entries. It should be switched over to idr_for_each,
> which allows you to handle this explicitly.
> 
> Note that transient NULL pointers in drm_file.object_idr have been a
> thing since f6cd7daecff5 ("drm: Release driver references to handle
> before making it available again"), this is a really old issue.
> 
> Since it's just a premature loop terminate the impact should be fairly
> benign, at least for any debugfs or fdinfo code.

Misread idr_get_next and I now think it should be fine as-is. Please
disregard this one.
-Sima

> 
> Aside: amdgpu_gem_force_release() looks questionable and should
> probably be revisited in the light of the revised hotunplug design
> we're aiming for. But that's an entirely separate can of worms.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Arvind Yadav <Arvind.Yadav@amd.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Yunxiang Li <Yunxiang.Li@amd.com>
> Cc: Frank Min <Frank.Min@amd.com>
> Cc: Kent Russell <kent.russell@amd.com>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 2c68118fe9fd..90723b13fa7d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -249,6 +249,7 @@ void amdgpu_gem_force_release(struct amdgpu_device *adev)
>  
>  		WARN_ONCE(1, "Still active user space clients!\n");
>  		spin_lock(&file->table_lock);
> +		/* FIXME: Use idr_for_each to handle transient NULL pointers */
>  		idr_for_each_entry(&file->object_idr, gobj, handle) {
>  			WARN_ONCE(1, "And also active allocations!\n");
>  			drm_gem_object_put(gobj);
> @@ -1167,6 +1168,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>  		rcu_read_unlock();
>  
>  		spin_lock(&file->table_lock);
> +		/* FIXME: Use idr_for_each to handle transient NULL pointers */
>  		idr_for_each_entry(&file->object_idr, gobj, id) {
>  			struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
>  
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
