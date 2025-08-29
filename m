Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34256CA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 09:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010D610EB71;
	Fri, 29 Aug 2025 09:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Eh7iE29K";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BEF10E12E
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 09:05:52 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso11098875e9.2
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756458350; x=1757063150; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=c6ZNJSi0kfqHsdZb92HLlSdkGzCV/Xy2kQ2Qoz7Iom8=;
 b=Eh7iE29KGJnhUfMmu4xvNIm8XCZPOq1wjm8kPjEwXcw6XKNY2oLDkOYl+4kWpHW9F8
 4hZpq3QWBAoZJtdKRnh3uTsc0b4/bUT6a24Kg8hMVMMNEwZOv+TDTBS5X/BJhmIOHKwN
 enV2WOyE4KdADk9Z8VU7RaUWSEiUV+wVEreOMdvTXwz81/7TNjI5GooyRnpSUuW1zX5f
 ITCw5PEVbBNeRXmNy1EJEMU3OkNUE7qD9SzH37ojJngdYARZ3HYpVU68/Cr588t4xjnp
 Dfje4ffcKl1DFJ/Wd+vzOIiEJ4JgfbZ80rSUjWFbQwuz2y/3eh80DwFn4BtMrB+qOgJ7
 tCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756458350; x=1757063150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6ZNJSi0kfqHsdZb92HLlSdkGzCV/Xy2kQ2Qoz7Iom8=;
 b=TktBkHhlk0pJnmtrid2+dv3sBBpV4oFABO1qwwBFkCJQWb6ASyHIdNY6abGC+3ubjH
 b6mhKzQYKJlc7Wt8TaJbZv90JmVqwJyrxqJtB/QMr6sKJo8MMnpP2ZffOpRnF+SaTzWn
 7Eainv2qTdrVkz4jRV7dUvk3tMXMkaXjDPRZqx0ct99jc2n8y8DIl9ocOSBlDpThFmNw
 IhFAiWud34xhq3gUzej2j6Y4jHIMPb+JhRUc77Nz3U4aYMuTvzOPHHSXbBiJhaOXcq+e
 4cUkAUrJlrdPKIW+hxjjqdDKlQzIAFyteQRDosWPNgXvP9Wkob/cYCjBVcOgSxzuiRc9
 GZDQ==
X-Gm-Message-State: AOJu0Yzy7aA8rP/3v/rl+YfxADRRUC7aNKJJWd+ShemTOl1/T1S+WsLV
 SkOa9gHsWkmvRhF9Pybt+3fiEOkcSmTyNfM/a9Fe/Xff9dz1ObiX9OeLxmSnOpHHS+4=
X-Gm-Gg: ASbGncv6MDQ8qjBYIhwyxQDyIAZ6pxSVbX3mb2Sx7A258Kbun0t0q+ejQq9MaLPa2qn
 kjHVKdlobNwlxAsMQF/E13zlFPz9DBcMzJbLSynBL72n4AMn0eBCW54oEQwclThz8vRDkpMiZdS
 RWkSYPTByYA5Xc1xKSgAczdo/BATuNPor2fALrN2igC5xesvyOU4/xkuCLgwthZ3t7Z3672+cV6
 YAc9QdfIqPhI7Il02B8SniOzXiONvkNPdXu5strndMsls2yhPrYVeL/ZFuAiLk5y3B5NFs3hRbj
 XtX+G+2dkrCqUgcEettw+7qLmhjjojYqRdGdYplJn37lXBNRY49sVUfO/MjU4r4AM3t7C1SmFvn
 Pp/E3TPGRzUvK3ihfX0s3LvVtoOlFkQ3QCrIYqw==
X-Google-Smtp-Source: AGHT+IGJbSS11uG3flaAMdLLbbhDEWWbLj1nFd6/UOjC2Y7nu5kx239wlnbb7k6qZhoogLALjXsZ5Q==
X-Received: by 2002:a05:600c:4687:b0:45b:47e1:ef71 with SMTP id
 5b1f17b1804b1-45b517f8e7fmr230758415e9.36.1756458350135; 
 Fri, 29 Aug 2025 02:05:50 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b7e8876c9sm29342225e9.11.2025.08.29.02.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 02:05:49 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:05:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [bug report] drm/xe/uapi: Add UAPI for querying VMA count and
 memory attributes
Message-ID: <aLFtanR2J8-uPKuZ@stanley.mountain>
References: <aLAa0ZEWi5mGed2S@stanley.mountain>
 <37b7ff75-8931-4244-add9-02cb0e30e02b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37b7ff75-8931-4244-add9-02cb0e30e02b@intel.com>
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

On Thu, Aug 28, 2025 at 03:10:40PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 28-08-2025 14:31, Dan Carpenter wrote:
> > Hello Himal Prasad Ghimiray,
> > 
> > Commit 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count
> > and memory attributes") from Aug 21, 2025 (linux-next), leads to the
> > following Smatch static checker warning:
> > 
> > 	drivers/gpu/drm/xe/xe_vm.c:2298 xe_vm_query_vmas_attrs_ioctl()
> > 	warn: maybe return -EFAULT instead of the bytes remaining?
> > 
> > drivers/gpu/drm/xe/xe_vm.c
> >      2240 int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >      2241 {
> >      2242         struct xe_device *xe = to_xe_device(dev);
> >      2243         struct xe_file *xef = to_xe_file(file);
> >      2244         struct drm_xe_mem_range_attr *mem_attrs;
> >      2245         struct drm_xe_vm_query_mem_range_attr *args = data;
> >      2246         u64 __user *attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
> >      2247         struct xe_vm *vm;
> >      2248         int err = 0;
> >      2249
> >      2250         if (XE_IOCTL_DBG(xe,
> >      2251                          ((args->num_mem_ranges == 0 &&
> >      2252                           (attrs_user || args->sizeof_mem_range_attr != 0)) ||
> >      2253                          (args->num_mem_ranges > 0 &&
> >      2254                           (!attrs_user ||
> >      2255                            args->sizeof_mem_range_attr !=
> >      2256                            sizeof(struct drm_xe_mem_range_attr))))))
> >      2257                 return -EINVAL;
> >      2258
> >      2259         vm = xe_vm_lookup(xef, args->vm_id);
> >      2260         if (XE_IOCTL_DBG(xe, !vm))
> >      2261                 return -EINVAL;
> >      2262
> >      2263         err = down_read_interruptible(&vm->lock);
> >      2264         if (err)
> >      2265                 goto put_vm;
> >      2266
> >      2267         attrs_user = u64_to_user_ptr(args->vector_of_mem_attr);
> >      2268
> >      2269         if (args->num_mem_ranges == 0 && !attrs_user) {
> >      2270                 args->num_mem_ranges = xe_vm_query_vmas(vm, args->start, args->start + args->range);
> >      2271                 args->sizeof_mem_range_attr = sizeof(struct drm_xe_mem_range_attr);
> >      2272                 goto unlock_vm;
> >      2273         }
> >      2274
> >      2275         mem_attrs = kvmalloc_array(args->num_mem_ranges, args->sizeof_mem_range_attr,
> >      2276                                    GFP_KERNEL | __GFP_ACCOUNT |
> >      2277                                    __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> >      2278         if (!mem_attrs) {
> >      2279                 err = args->num_mem_ranges > 1 ? -ENOBUFS : -ENOMEM;
> >                                 ^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > This is a weird check.  If args->num_mem_ranges is zero, then kmalloc()
> > will succeed with the ZERO_SIZE_PTR.  If it's 1, then
> > args->sizeof_mem_range_attr is quite small.  64 bytes.  The allocation will
> > succeed as well.  In real life err will never be set to -ENOBUFS.
> 
> This is false error.

This wasn't from static analysis it was just from observation.  At the
start of the function we ensure that if args->num_mem_ranges is > 0 then
args->sizeof_mem_range_attr must be == sizeof(struct drm_xe_mem_range_attr).

> >      2250         if (XE_IOCTL_DBG(xe,
> >      2251                          ((args->num_mem_ranges == 0 &&
> >      2252                           (attrs_user || args->sizeof_mem_range_attr != 0)) ||
> >      2253                          (args->num_mem_ranges > 0 &&
                                        ^^^^^^^^^^^^^^^^^^^^^^^^
> >      2254                           (!attrs_user ||
> >      2255                            args->sizeof_mem_range_attr !=
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >      2256                            sizeof(struct drm_xe_mem_range_attr))))))
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >      2257                 return -EINVAL;
>

I guess maybe the thing I didn't explain well enough is that in the
kernel small allocations always succeed.  Otherwise I'm so puzzled by how
my analysis could be wrong.

regards,
dan carpenter

