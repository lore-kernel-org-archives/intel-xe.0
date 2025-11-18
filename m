Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C85CEDDB0
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 15:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C3A10E4DD;
	Tue, 18 Nov 2025 15:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GhkGaeMk";
	dkim-atps=neutral
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B7C10E4DD
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 15:15:00 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-42b32900c8bso3222191f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 07:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763478899; x=1764083699; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9Ujeunaq6zF7cjto7cDy780LpcifWXCwtiqkuQKpU0=;
 b=GhkGaeMkF3wvuPC9qatX1dGjpYO5pbKvSU+fr8vzhDNoU8+VBRwElykcFjK7llHKfG
 edwopu2yN/U6+0tnf/dtKyBz1sVdcFpSm06q9ByBeneZLDzJiziaxUS3y0TysyXO+uTA
 bxyVptXSwp1VNQ+C0g/ECipoJZIYYNereyqDUQIVJEFohoB6RCatSyTiUr2CtyP7tUQF
 wWlLIuu4JyikZ9tjt402hL3Goqe5VN+eprBuxm+Hiv9bSPbYALhHT4ujnDF7ONqfUXbH
 t3tDznD2cbFM8GGbakskauZ3ELh5TMWNZGmRx4QVlii2ATg4nIXMJDlvXC6UjodGt2iv
 qTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763478899; x=1764083699;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d9Ujeunaq6zF7cjto7cDy780LpcifWXCwtiqkuQKpU0=;
 b=C5JLFonqf+xBxyWoM+NvcytMRymSl2QEt4mgGeJrA2X5p6Y3yxQoLOG6wu9Mm1RGdJ
 e054fsdmwYah75cx7F7Z6kGi+Hb2sIWC6rhhp+dYna8LuSPNY4T62Nbzx/ssZpFooEyF
 eJqUmMwW3k0qQHaCYzDOgWf2e6Gpr5Oz1ETbWAQIk/5wHoRsgkifPl0Ng1UJF2zPkav5
 S5U5APgwdMwRLzl+lQR+HQIdCiSBfQO89PCgfPNj4cT/MhVGQV3FgX0cCHnycBWqXfzF
 TcKdBKG4PZAFpjSNoXi26CuGcj/v14gnG7PJwvGkZ0ZpDpA1enAzE2k/K7gvlsFWjcKp
 fQdg==
X-Gm-Message-State: AOJu0YwVYu1sR+dsaOjBgsGZqiW9OWMxqqcMiKCYeaqZujlUULFEXijn
 akdo2oaqTSXnXFNqXuKaKEr0h4HyGVgERxcMGowdQM0SuXwfGx8IzrswFCrw/rvqxrk=
X-Gm-Gg: ASbGncvB8CmHIs16JYabsFCTJn9snUqzmGosmpaumZpnDCR4a2DRGL4i7TNV4zpEIZC
 r1SqextBpvbSwhHRq9s1A0gL/JtN+ZBQeN3WDkD7y4+xpHY1qq81xO9A0bfmU0Q2zN0Jr9HY7IB
 neCr1OSk5W/AutroG3kIi5z4EB5u4HnVO3iqrn84W42vfvfPtCMoi7UC8e3ddpkElQuEaNNYwQn
 evgiFsYI12q+5CHphO1u/K/T3IfhW4SEzGtr0MmTUZhPYfFPqT0a0ksnXSGpEE8Ni/fKOD14Ept
 XeQmVVzwE7Rb2WnZaRieOXL+X+VEURRqdker4OOK5FD8JMjJZgjmeoqMv8c6vJ1vMf70A4tDqbA
 kj+nlUPUO7LJvy9Nm3fg0OkCU/EaSIzQOdXAvNjDfhWpZXKUN2KxpR6KqujFGw9ToEzvkVaoetj
 XCAbBUqg==
X-Google-Smtp-Source: AGHT+IFcxMlGQGL3I+uzbPIfpKUZ+PGFRIdgxw8wTzMqM44nEwg94EyO7o7SrdDfnb+hiLen0h7ACQ==
X-Received: by 2002:a5d:584e:0:b0:42b:2e94:5a90 with SMTP id
 ffacd0b85a97d-42b5936c3bamr17872450f8f.36.1763478898941; 
 Tue, 18 Nov 2025 07:14:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42ca01b074csm12076976f8f.34.2025.11.18.07.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:14:58 -0800 (PST)
Date: Tue, 18 Nov 2025 18:14:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Enforce correct user fence signaling order using
Message-ID: <aRyNbk3D91Hzb9Cy@stanley.mountain>
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

Hello Matthew Brost,

Commit adda4e855ab6 ("drm/xe: Enforce correct user fence signaling
order using") from Oct 31, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/gpu/drm/xe/xe_oa.c:1867 xe_oa_stream_open_ioctl_locked()
	error: double free of 'param->syncs' (line 1863)

drivers/gpu/drm/xe/xe_oa.c
    1831 static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
    1832                                           struct xe_oa_open_param *param)
    1833 {
    1834         struct xe_oa_stream *stream;
    1835         struct drm_syncobj *ufence_syncobj;
    1836         int stream_fd;
    1837         int ret;
    1838 
    1839         /* We currently only allow exclusive access */
    1840         if (param->oa_unit->exclusive_stream) {
    1841                 drm_dbg(&oa->xe->drm, "OA unit already in use\n");
    1842                 ret = -EBUSY;
    1843                 goto exit;
    1844         }
    1845 
    1846         ret = drm_syncobj_create(&ufence_syncobj, DRM_SYNCOBJ_CREATE_SIGNALED,
    1847                                  NULL);
    1848         if (ret)
    1849                 goto exit;
    1850 
    1851         stream = kzalloc(sizeof(*stream), GFP_KERNEL);
    1852         if (!stream) {
    1853                 ret = -ENOMEM;
    1854                 goto err_syncobj;
    1855         }
    1856         stream->ufence_syncobj = ufence_syncobj;
    1857         stream->oa = oa;
    1858 
    1859         ret = xe_oa_parse_syncs(oa, stream, param);
    1860         if (ret)
    1861                 goto err_free;
    1862 
    1863         ret = xe_oa_stream_init(stream, param);
    1864         if (ret) {
    1865                 while (param->num_syncs--)
    1866                         xe_sync_entry_cleanup(&param->syncs[param->num_syncs]);
--> 1867                 kfree(param->syncs);
                         ^^^^^^^^^^^^^^^^^^^^

xe_oa_stream_init() already frees param->syncs when it calls
xe_oa_emit_oa_config().

    1868                 goto err_free;
    1869         }
    1870 
    1871         if (!param->disabled) {
    1872                 ret = xe_oa_enable_locked(stream);
    1873                 if (ret)
    1874                         goto err_destroy;
    1875         }
    1876 
    1877         stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
    1878         if (stream_fd < 0) {
    1879                 ret = stream_fd;
    1880                 goto err_disable;
    1881         }
    1882 
    1883         /* Hold a reference on the drm device till stream_fd is released */
    1884         drm_dev_get(&stream->oa->xe->drm);
    1885 
    1886         return stream_fd;
    1887 err_disable:
    1888         if (!param->disabled)
    1889                 xe_oa_disable_locked(stream);
    1890 err_destroy:
    1891         xe_oa_stream_destroy(stream);
    1892 err_free:
    1893         kfree(stream);
    1894 err_syncobj:
    1895         drm_syncobj_put(ufence_syncobj);
    1896 exit:
    1897         return ret;
    1898 }

regards,
dan carpenter
