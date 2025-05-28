Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D64C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97C210E5BC;
	Wed, 28 May 2025 09:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="MFR8chq7";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D705610E5B2
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:13:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-442d146a1aaso49367285e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748423605; x=1749028405; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vl0E6L90fgTENWugUTMsplySmcFxWM2gmN43z3TdcP4=;
 b=MFR8chq7XtniTUYwQT3lNadkeGJoL0kpkiXvPeD77hULbJxK9le2w+K6kyDCQLQ67U
 uUztyWLo+HOzjyciedIXHm12VcJ6u2Zyfl3hMRrLK2WbNmkNyqqd4SGZeIxNYrD3AvFL
 3ui9LiYX3VbTK6ljG9WQwIyTR21IKyaTfyaws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748423605; x=1749028405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vl0E6L90fgTENWugUTMsplySmcFxWM2gmN43z3TdcP4=;
 b=P+CuhgiWxT5rvojNXLDnaG8919MLsb4r3BvjzgbyqARgaWN170YDtr+H2eJOxsK2jH
 1WGXfGfyNAsTg63EwrT80xbhT9vAwrjCgxFvhKlhpQ66EtDt8sS+kcDAuvsg3QopmzJS
 MkzTNv/9K3yPSlm7FUNgPjDWHeAPI9q19Ase2VC2HNbmgZhigHABqgb89DFawY0i3Ja7
 uKzsebQObQ4iyqIYHB719zujXQsN9U2+8A7qXkA8/PASHHJ8Q8fyhnBAcFvJW1mFV9nr
 Kd2pRNnNRUGyLX0iT+8QL+QmmAmDj71aL98zUx9eLbf6hIxFFj9oTO8/OCJuCfVzau0/
 Ng+g==
X-Gm-Message-State: AOJu0YwKECEzy25R2x0u5YUnt2yNBlTzue3Cmnm2Xitm2hmZ8UJgdDxF
 cy5OjXpa9FuqqAZQ/peAR86rMMA4PtF+Jb7/cLDSVBZ5HEGei1BQvL8zQvD0zA4w+ck=
X-Gm-Gg: ASbGncuUdrQgrsSLdg6Q0b8dLkKDMHjbZfDls12TfW+HWD2ZHsqfREKm8B8NYjJJa6c
 04FSDppwJpCangpPFhWfxGYnMCr+mU131erSySuHpP+VSDcY1BpdwZgXx7VBaDVlQ4X0iit46D0
 jxwjfC/YrdkTDlckkIm1SJ1Jh0J/pjv/40INjWqGPIyHd4H8+a91MQ+AL91SfQw4Mglj3hfwFys
 I+3Mg3LT7TXW5bx38frCcqlDf08oKOpA8EBd5Hun+E6nlrUjJf8IkHWOd4ykmI7oKaDUhzAhKfg
 0fagFvS6RgZGonKmTT6znSvPXfOr8Qz2QOX8JrsW4NxxmLGwwAz6xUFeVwpgWKk=
X-Google-Smtp-Source: AGHT+IEwqo/MnS0aQ1FQk70Au4Q6zCxZWX+X6CVhx/QeCCqSpZKjEsbMFcnDOYZ0Oz+zWYv5qcZ8wA==
X-Received: by 2002:a05:600c:4e14:b0:444:34c7:3ed9 with SMTP id
 5b1f17b1804b1-44c955da4f7mr144470815e9.26.1748423605456; 
 Wed, 28 May 2025 02:13:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:13:25 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, Frank Min <Frank.Min@amd.com>,
 Kent Russell <kent.russell@amd.com>,
 Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 6/8] drm/amdgpu: Add comments about drm_file.object_idr issues
Date: Wed, 28 May 2025 11:13:04 +0200
Message-ID: <20250528091307.1894940-7-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

idr_for_each_entry() is fine, but will prematurely terminate on
transient NULL entries. It should be switched over to idr_for_each,
which allows you to handle this explicitly.

Note that transient NULL pointers in drm_file.object_idr have been a
thing since f6cd7daecff5 ("drm: Release driver references to handle
before making it available again"), this is a really old issue.

Since it's just a premature loop terminate the impact should be fairly
benign, at least for any debugfs or fdinfo code.

Aside: amdgpu_gem_force_release() looks questionable and should
probably be revisited in the light of the revised hotunplug design
we're aiming for. But that's an entirely separate can of worms.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Yunxiang Li <Yunxiang.Li@amd.com>
Cc: Frank Min <Frank.Min@amd.com>
Cc: Kent Russell <kent.russell@amd.com>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 2c68118fe9fd..90723b13fa7d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -249,6 +249,7 @@ void amdgpu_gem_force_release(struct amdgpu_device *adev)
 
 		WARN_ONCE(1, "Still active user space clients!\n");
 		spin_lock(&file->table_lock);
+		/* FIXME: Use idr_for_each to handle transient NULL pointers */
 		idr_for_each_entry(&file->object_idr, gobj, handle) {
 			WARN_ONCE(1, "And also active allocations!\n");
 			drm_gem_object_put(gobj);
@@ -1167,6 +1168,7 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
 		rcu_read_unlock();
 
 		spin_lock(&file->table_lock);
+		/* FIXME: Use idr_for_each to handle transient NULL pointers */
 		idr_for_each_entry(&file->object_idr, gobj, id) {
 			struct amdgpu_bo *bo = gem_to_amdgpu_bo(gobj);
 
-- 
2.49.0

