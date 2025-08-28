Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F50C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 09:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF7910E89C;
	Thu, 28 Aug 2025 09:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R4Ru3bqJ";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B13710E89E
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 09:01:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45a1abf5466so3979025e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756371670; x=1756976470; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n/0wsX6JOSe6WhWPIuvmGXcHJZpQ5QPwMT80CvAhkmY=;
 b=R4Ru3bqJaJXPU1Z6cljc/r+26t5ZYn1dnjTXH42EsT3rWrt6gnvMdAzM8WO4i0F8GA
 DHBgw1c0239cOp0boa875cRWlK2zBPhKh7sCrHL9Fy/lkLdjJAkSQTbxWRRdK/5PWPQW
 7YW3YGIApdXZti9C5s90x3ATq01k75BUstDISwTgXU9uhjZbIpHAueXN7GOistv/j2Ok
 fnFU96F2Pp0/qKzIXJzXhOyIamFeFl/f7AG2VMMKiyaW4vnKMZjUeC67KPFPW+odpyTt
 rdoW1IbP5vv+WogLVYl0Q41W0x3nL9tC2oxqMOwnmIa1Y527cBlG224p3l/8U4ux/4v4
 UXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756371670; x=1756976470;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n/0wsX6JOSe6WhWPIuvmGXcHJZpQ5QPwMT80CvAhkmY=;
 b=BXvBUTT3wjpATTjyqNiAch4ctKSh5OTuTFSntJtlGNIG28pQrjSPevMsHNMesm27Q3
 1cbwhg+xi02hjBVUnTxGEjME4OcI0O+6SDd2nsgAgY4wzHIGqdY4d94u7wL93TN0Zkqs
 bgRbDNa0+DEKSkFqVzBEXicuQNhLA5RO165zdCjpDmh1xiDin/0UvQ52EelJ2zota7eD
 hIZVZBPQJi9dNbqHdW+gHCZBVP72kw0NvcpQC2PkKu5MPFbhyXmzAK33EAOBoy1xwqbL
 oWyq41ixDfKp20hARymKUKSK6K1TjaBFZqssEe6vtjk6yrgWQ/r2UXc81h3F8CQBNUeM
 HThA==
X-Gm-Message-State: AOJu0YwtRXrCw4TlO/uuqcIv4LFmiV1RQtF88/QT4dMmykZNG/wqb6Qm
 wQkobtew/Qg59KcbKUs4yztxOpImBozeREhztY09O9yJcg6Qa5B85t+wXQO4AZpdNKw=
X-Gm-Gg: ASbGnctFCFW4qYR3742VdzZbBmwj8/4puwy3Cq4+e53SNay6Glgc1MnhunG7yBb52QV
 ssgbyXrCXniqpFXrKjMPRfHCTaukAWnFRvTFndkgfe6TFiuNjF7I/Op1II5SdXEfP/Y7owaVLCS
 2Et5QLzH6LkpjJGU6dJ1drvbar0NYGgktJpUsGZyceZGer1oELKEv5aMrj0KwW/R3NfEtKvTIN0
 wMYN96ATrhl2vSJvxtYwz7lgWV42H8CNE4TqeU26PjZTiIScazUhAL0yjMFb1KrYEpZ/ofzLC4L
 vcyiHH/EIM20LiOT7dnLyySj82QTGCl1zZJ+bWMtz/8Hj9NaJteJZdmOIoEF9zqcen+N6o1MkVZ
 4ZPJ7r9A7889xQoI5sBCOsuowzgz+l3W/UWfoTg==
X-Google-Smtp-Source: AGHT+IEe+KSlpe7Fg0LObOjT2qxyjx2hcS5W/eyJaOvy82xxAvG/V5rgFT6BcVe/UVF0Tgcnw2mxjQ==
X-Received: by 2002:a05:600c:4588:b0:45b:47e1:ef7c with SMTP id
 5b1f17b1804b1-45b68714514mr74476895e9.18.1756371669659; 
 Thu, 28 Aug 2025 02:01:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c70ef55aabsm23373364f8f.23.2025.08.28.02.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 02:01:08 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:01:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/uapi: Add UAPI for querying VMA count and memory
 attributes
Message-ID: <aLAa0ZEWi5mGed2S@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Himal Prasad Ghimiray,

Commit 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count
and memory attributes") from Aug 21, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/xe/xe_vm.c:2298 xe_vm_query_vmas_attrs_ioctl()
	warn: maybe return -EFAULT instead of the bytes remaining?

drivers/gpu/drm/xe/xe_vm.c
    2240 int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
    2241 {
    2242         struct xe_device *xe = to_xe_device(dev);
    2243         struct xe_file *xef = to_xe_file(file);
    2244         struct drm_xe_mem_range_attr *mem_attrs;
    2245         struct drm_xe_vm_query_mem_range_attr *args = data;
    2246         u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
    2247         struct xe_vm *vm;
    2248         int err = 0;
    2249 
    2250         if (XE_IOCTL_DBG(xe,
    2251                          ((args->num_mem_ranges == 0 &&
    2252                           (attrs_user || args->sizeof_mem_range_attr != 0)) ||
    2253                          (args->num_mem_ranges > 0 &&
    2254                           (!attrs_user ||
    2255                            args->sizeof_mem_range_attr !=
    2256                            sizeof(struct drm_xe_mem_range_attr))))))
    2257                 return -EINVAL;
    2258 
    2259         vm = xe_vm_lookup(xef, args->vm_id);
    2260         if (XE_IOCTL_DBG(xe, !vm))
    2261                 return -EINVAL;
    2262 
    2263         err = down_read_interruptible(&vm->lock);
    2264         if (err)
    2265                 goto put_vm;
    2266 
    2267         attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
    2268 
    2269         if (args->num_mem_ranges == 0 && !attrs_user) {
    2270                 args->num_mem_ranges = xe_vm_query_vmas(vm, args->start, args->start + args->range);
    2271                 args->sizeof_mem_range_attr = sizeof(struct drm_xe_mem_range_attr);
    2272                 goto unlock_vm;
    2273         }
    2274 
    2275         mem_attrs = kvmalloc_array(args->num_mem_ranges, args->sizeof_mem_range_attr,
    2276                                    GFP_KERNEL | __GFP_ACCOUNT |
    2277                                    __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
    2278         if (!mem_attrs) {
    2279                 err = args->num_mem_ranges > 1 ? -ENOBUFS : -ENOMEM;
                               ^^^^^^^^^^^^^^^^^^^^^^^^

This is a weird check.  If args->num_mem_ranges is zero, then kmalloc()
will succeed with the ZERO_SIZE_PTR.  If it's 1, then
args->sizeof_mem_range_attr is quite small.  64 bytes.  The allocation will
succeed as well.  In real life err will never be set to -ENOBUFS.

    2280                 goto unlock_vm;
    2281         }
    2282 
    2283         memset(mem_attrs, 0, args->num_mem_ranges * args->sizeof_mem_range_attr);
    2284         err = get_mem_attrs(vm, &args->num_mem_ranges, args->start,
    2285                             args->start + args->range, mem_attrs);
    2286         if (err)
    2287                 goto free_mem_attrs;
    2288 
    2289         err = copy_to_user(attrs_user, mem_attrs,
    2290                            args->sizeof_mem_range_attr * args->num_mem_ranges);

copy_to_user() returns the number of bytes it failed to copy.  It should
be:

	if (copy_to_user(...))
		err = -EFAULT;

    2291 
    2292 free_mem_attrs:
    2293         kvfree(mem_attrs);
    2294 unlock_vm:
    2295         up_read(&vm->lock);
    2296 put_vm:
    2297         xe_vm_put(vm);
--> 2298         return err;
    2299 }

regards,
dan carpenter
