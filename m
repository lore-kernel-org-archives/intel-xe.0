Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8969C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 09:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0BE10E5BB;
	Wed, 28 May 2025 09:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="YJe7Ng9H";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAB710E5BB
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 09:24:28 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-450caff6336so1412895e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 02:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1748424267; x=1749029067; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eTrQh9g5BCCMkWrTK1ykKREPEZGbfPx4fWWA5+zWO+g=;
 b=YJe7Ng9HfAWkjCLAG8/nDZNta9Y917L3B6lCL4pAP8vfjUthiCJJT+nUQa5CrqBVWg
 7OViiJSDSu55f+CYgMYuXDvv39po4RiiUyMCUs3lDCd0ACakmhktXPc2jNLOhrB/NJ6H
 AWpyu4BG1WSsc58i2QNuFDGktmIfe4wTzlEfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748424267; x=1749029067;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eTrQh9g5BCCMkWrTK1ykKREPEZGbfPx4fWWA5+zWO+g=;
 b=u7UbylpstIHgr1N7fj6FwvtgMB7eGbABSGqcKc6S35tLqxmf3IvcNg5XiNC9p4LWOf
 UDm+JyqmkwXf+exZHeWt0t/CXik3MV22Eyuy8fRjJJNV7jZriMq4ufl6VKG6pzAujUbX
 Qq3aqQ7KA9ZSb+so0jJ7rrzFfEhv1tvq8d3fv/p1SqisuD5JR5B/YB4HOCJqL3fTtasN
 n5Mmkhf7/0Lgc+Vw0YFP8izVcLcJ5GzCgMx5KuoaOq8stabs65Sp9MjUMT86+IaNaR+6
 h8Hg8tslbjvo0mcBAj0iik9Rfk3tGUBq59vTvzUAf5vMZaVxaQT1uuSIjZln+loIw949
 GkQA==
X-Gm-Message-State: AOJu0Ywpsnm0PlC6rVzovZtb4snTkXqEO5cAvhxFxZptAKOjVJgpLM8K
 gWQxpVEwTJjL89HETXWQUHxRK03VL6vAdhqDR1KhBDONlY6d9T+w/LBgjuDWZ9wEZAo=
X-Gm-Gg: ASbGncsc5thVE/KRQCaGPfwVr1VHah83XU9ydiUX8xnFivmtSVd4ufAfjlVSP7jZgHT
 QXp6Z8J4GkCMFIrYaFlngQDXGyh+9PY5Ybqz78YFUPnkbPRda0eEw03/9h3GB4v6RRpeka8P+7M
 OK54XeRFDlebXuoEtbUg6eNj6tyZSKqKzBVbQhMy+VyPn8grOdh4qeevVRA7REWj2FQDK0mChL6
 aA0Z9/2fB8DEaxt07kAKRWTOMEx941Q8oVGm8eZnZY7qzdzcAUbjCgp1wGKTlipRt8ZExickwWz
 1S8RTeGzJCzKeiHfcXGqq4ejlPRPXlcx+nQeLucZm/06VBWi4sLZK946iaD/PBI=
X-Google-Smtp-Source: AGHT+IEeduBJMqQLdTJjiJSw02+TAnnvGs6wApk3JX5opMeqkdwXgt5TrvlQeENkiE/Dkg3wcdtZ/A==
X-Received: by 2002:a05:600c:6296:b0:440:6a79:6df0 with SMTP id
 5b1f17b1804b1-44c9493e347mr129041885e9.22.1748424267530; 
 Wed, 28 May 2025 02:24:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45006499b3dsm15355915e9.8.2025.05.28.02.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 02:24:27 -0700 (PDT)
Date: Wed, 28 May 2025 11:24:25 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 8/8] drm/xe: Add comments about drm_file.object_idr issues
Message-ID: <aDbWSawqZfOonYer@phenom.ffwll.local>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-9-simona.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528091307.1894940-9-simona.vetter@ffwll.ch>
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

On Wed, May 28, 2025 at 11:13:06AM +0200, Simona Vetter wrote:
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
> 
> On top of that this code also drops the drm_file.table_lock lock while
> iterating, which can mess up the iterator state. And that's actually
> bad.

So I re-read idr_get_next and all that, and I think it should be all fine
- it handles both NULL entries and I think does recover from simply the
most recent id. Might miss some that have been concurrently added, but
that should be fine.

Sorry for the noise.
-Sima

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 31f688e953d7..2542f265a221 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -205,6 +205,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  
>  	/* Public objects. */
>  	spin_lock(&file->table_lock);
> +	/* FIXME: Use idr_for_each to handle transient NULL pointers */
>  	idr_for_each_entry(&file->object_idr, obj, id) {
>  		struct xe_bo *bo = gem_to_xe_bo(obj);
>  
> @@ -213,6 +214,8 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>  			xe_bo_unlock(bo);
>  		} else {
>  			xe_bo_get(bo);
> +			/* FIXME: dropping the lock can mess the idr iterator
> +			 * state up */
>  			spin_unlock(&file->table_lock);
>  
>  			xe_bo_lock(bo, false);
> -- 
> 2.49.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
