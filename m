Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3619BCFD313
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 14:42:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6D810E2DB;
	Mon, 24 Nov 2025 14:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BdxTKsp1";
	dkim-atps=neutral
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B67510E2E8
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 14:42:30 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so28690635e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 06:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763995348; x=1764600148; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EV8DYul7mBzDMPH+60MmrdvXP0RiXOiCALt1um7SoO8=;
 b=BdxTKsp1rOSFLQvuk1FOu02urvdn0KG77o3TqdPM3fPpghAY6+129cEQneEQkZcamh
 k+3m8LjNDxpOd7t397gXJptDu7YvT4FmaQZY+YLONp5HRu5M7ucbkg12/oNzsx/zpNG1
 C7tMu3jKn9rEC7SKFMP9/isH72AyzBQu8HI5flv1ttD0zm9SxFVi+T+i2GSuEt3pAgeq
 UtgyiKHNkNS3IYu96vWqU171hIAkOavOYJpLO0lMUnuEdGnh9bUjm1R4T4+75fesI2Hp
 xFTiOjf18UJfTjdcUJBnpx8oG7OSIoQ1UEoYpXviY1AwfB6d7OyEiJgEV9QaEhZ8PWn4
 PqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763995348; x=1764600148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EV8DYul7mBzDMPH+60MmrdvXP0RiXOiCALt1um7SoO8=;
 b=wXh8n/wWnego1TImIpMQslE7gCg+zRSjbKjyepHXdyrzlcsUcaSIIZAJfHDqU3kL/a
 IV2ajYOO96V8f8WAXZxRq6bLjYAGtMbIjpj6TBlUZ/73qmkH7GHq/l6fEMsvF1rhKaUT
 aCCZzq8liO5+jJ/Y16XFDZFhTnZEFO+DdIY3aKabk4aH5X6t77jTFq7dTVdpFetA0V97
 e1DvVINSpvFPs/FtaORDI3owwgq9C1JMVGutHa/nTw2GQQHYCuXBjKJ6zdxYQbmQmv8f
 9/j6AY29bXHIJhInHbDw164kJhEVhUKE9g0aKn81zHQGDLr72Jh/mf1RiIms6jppsl9+
 TgMA==
X-Gm-Message-State: AOJu0Yw21Ua9QkjeolxD0hpfrrxAo5IqEXwA0zqrjv8kXFEGxTf1Wzfx
 HvouIJO3N9+GkzQWDY+J1Lf911c43uQBDqIyAUKCOz1pSGXpbf5dUfZDfaXZELkaz2s=
X-Gm-Gg: ASbGncsRpS8WMA61C5WjESUiWmm3OMwgGtJHK4dPs377OeJCEaXGWyzPAzjymZG5zxM
 q46KxfPk+Oai0JsOMBxdzwAC3D47M5kZTvr3Nl3a/F4UR2JOVW7I/wifdO+oEy0fq9vhmchrmZk
 c5sibvE8sVxb9eKtxj300DT+ClAbTXgHQUmBqMGvdnyl6eG2/jreyRgCnh8N4aUjVLSbigmjZx5
 k7yLSvHvhbx+qRh/09bS4jPil2kscxu2giIUyMyaZMdp+NQfaA3XNUJQbe7QVV18Ka69I80QL52
 G0NyQK7va/n1vTnPfpJPMZOnfKoZFiqIsmvjBZX8LFIxKshA/v3BwGocqZW+eCUuXozdHbNIRDI
 JY7X/+FkVd3rCpitHZ/GIO8x2+dVb+1Tp6iBk2S50lUFbG4eFtD90w9TycZoO9v8yFlVA/YHf/+
 foFBGNonXX3vbSpgTF
X-Google-Smtp-Source: AGHT+IGhHvZS1EoYKpFgisC9wiD5yeSMDzE24VfTytXsLV58bsyDlRR+S/0v6V9gnx1IwmMI+fwEgw==
X-Received: by 2002:a05:600c:1d0e:b0:477:89d5:fdb2 with SMTP id
 5b1f17b1804b1-477c017d9damr120760485e9.14.1763995348224; 
 Mon, 24 Nov 2025 06:42:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-477bf3af0ecsm201472145e9.9.2025.11.24.06.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 06:42:27 -0800 (PST)
Date: Mon, 24 Nov 2025 17:42:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [bug report] drm/xe: Enforce correct user fence signaling order
 using
Message-ID: <aSRuz7C77FFp17NI@stanley.mountain>
References: <aRyNbk3D91Hzb9Cy@stanley.mountain>
 <aRynS3MfRj0V0VGh@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRynS3MfRj0V0VGh@lstrano-desk.jf.intel.com>
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

On Tue, Nov 18, 2025 at 09:05:15AM -0800, Matthew Brost wrote:
> On Tue, Nov 18, 2025 at 06:14:54PM +0300, Dan Carpenter wrote:
> > Hello Matthew Brost,
> > 
> > Commit adda4e855ab6 ("drm/xe: Enforce correct user fence signaling
> > order using") from Oct 31, 2025 (linux-next), leads to the following
> > Smatch static checker warning:
> > 
> > 	drivers/gpu/drm/xe/xe_oa.c:1867 xe_oa_stream_open_ioctl_locked()
> > 	error: double free of 'param->syncs' (line 1863)
> > 
> > drivers/gpu/drm/xe/xe_oa.c
> >     1831 static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> >     1832                                           struct xe_oa_open_param *param)
> >     1833 {
> >     1834         struct xe_oa_stream *stream;
> >     1835         struct drm_syncobj *ufence_syncobj;
> >     1836         int stream_fd;
> >     1837         int ret;
> >     1838 
> >     1839         /* We currently only allow exclusive access */
> >     1840         if (param->oa_unit->exclusive_stream) {
> >     1841                 drm_dbg(&oa->xe->drm, "OA unit already in use\n");
> >     1842                 ret = -EBUSY;
> >     1843                 goto exit;
> >     1844         }
> >     1845 
> >     1846         ret = drm_syncobj_create(&ufence_syncobj, DRM_SYNCOBJ_CREATE_SIGNALED,
> >     1847                                  NULL);
> >     1848         if (ret)
> >     1849                 goto exit;
> >     1850 
> >     1851         stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> >     1852         if (!stream) {
> >     1853                 ret = -ENOMEM;
> >     1854                 goto err_syncobj;
> >     1855         }
> >     1856         stream->ufence_syncobj = ufence_syncobj;
> >     1857         stream->oa = oa;
> >     1858 
> >     1859         ret = xe_oa_parse_syncs(oa, stream, param);
> >     1860         if (ret)
> >     1861                 goto err_free;
> >     1862 
> >     1863         ret = xe_oa_stream_init(stream, param);
> >     1864         if (ret) {
> >     1865                 while (param->num_syncs--)
> >     1866                         xe_sync_entry_cleanup(&param->syncs[param->num_syncs]);
> > --> 1867                 kfree(param->syncs);
> >                          ^^^^^^^^^^^^^^^^^^^^
> > 
> > xe_oa_stream_init() already frees param->syncs when it calls
> > xe_oa_emit_oa_config().
> > 
> 
> Admittedly this coded poorly but I think this a false positive.
> param->syncs is only freed when xe_oa_stream_init returns success.
> 
> That said this should probably be refactored a bit for clarity.
> 

Sorry for this.  It's a bug in Smatch, yes.  I'm testing a fix for this.

Thanks for looking into it.

regards,
dan carpenter


> Matt
> 
> >     1868                 goto err_free;
> >     1869         }
> >     1870 
> >     1871         if (!param->disabled) {
> >     1872                 ret = xe_oa_enable_locked(stream);
> >     1873                 if (ret)
> >     1874                         goto err_destroy;
> >     1875         }
> >     1876 
> >     1877         stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
> >     1878         if (stream_fd < 0) {
> >     1879                 ret = stream_fd;
> >     1880                 goto err_disable;
> >     1881         }
> >     1882 
> >     1883         /* Hold a reference on the drm device till stream_fd is released */
> >     1884         drm_dev_get(&stream->oa->xe->drm);
> >     1885 
> >     1886         return stream_fd;
> >     1887 err_disable:
> >     1888         if (!param->disabled)
> >     1889                 xe_oa_disable_locked(stream);
> >     1890 err_destroy:
> >     1891         xe_oa_stream_destroy(stream);
> >     1892 err_free:
> >     1893         kfree(stream);
> >     1894 err_syncobj:
> >     1895         drm_syncobj_put(ufence_syncobj);
> >     1896 exit:
> >     1897         return ret;
> >     1898 }
> > 
> > regards,
> > dan carpenter
