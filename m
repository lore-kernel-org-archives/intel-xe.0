Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DB1C36001
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 05:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD9310E20A;
	Mon, 24 Mar 2025 05:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tMlGCjvX";
	dkim-atps=neutral
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7B310E20A
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 05:58:31 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso43331605e9.3
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Mar 2025 22:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742795907; x=1743400707; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=K8xlcuEIxJivxRfeLiEVKTBTLzbQUtLbKH23ujGL7u8=;
 b=tMlGCjvXfs5tBMwucXFX2ku5Gza3mWhEuncQnsVyTC6SM/pm7njSV4A1ctGNx4M65Q
 mRxrSmb2Gmsv52wC8elVq0oGu0jzDGFMVnO4C5zYn8xuoYrmfGPB/TIze1+vNzlnt4lU
 jarw1pNs6UIdeCWKxVmwDN1H9og+403fwcQ38RN4wl/mh3/Ig/vI9hzEiLISOJV4hruj
 HCPC8H/rsjsYnbMjphn2iHyOraiPc/moUjrLr2PxzsQ+T34eZQek/HBNJ0rA1GG+WMp+
 5SF0qvH+zkBeMUeVcrQ5gLGpYWfwzFQ2S17E5chhToPu+hImKV23XsYXhiw2uWv6hKwP
 Xn3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742795907; x=1743400707;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K8xlcuEIxJivxRfeLiEVKTBTLzbQUtLbKH23ujGL7u8=;
 b=SUts3znZTit0tx+kwYXtMbo3FC72lGGDJ868whsl6q42gpoNFtFJeOvLaXcqMqNAgC
 z+Uceae0YGKUedohERBOJReyGbceW/HoN6P47kf5WhrmJKeeqpNKnV/sjZusoIIVFTlR
 l/tX6S3bRxjT+5jYOgOgxGwIqA9OCvwJHkwdXVXWhf9lBt4bi7OMk7490c2YdW1tsN+L
 7NZ8215+OUUmDzebZ2udRYHMbYAiIFAQdzdmKX7ZBoQqo/rX06lfgzVPfK9BDPzozBsA
 QMhC/cRdeaTy4ecjWLG02q92A8XBOktjRAb4MR7T/dNLgMamBXEDuw/MJWBjtWUNwU9K
 XAlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhIIBkc8kDkNVcNrxAF5ewnK+D38TKzcptFnD2O/WxCUzETHbGs5rFNqMJrZNVk0YJawoHUWnGiA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi4NqkRJNft4dnmfugCfOGE3SG1j1qAK2My9C+WPuSGDfvAm+4
 VA5MXXVigE3DuLizgEdLDM+ApcHkzWR0pUcJzTsLQQzFJ7VMo3b2jQGS+qFK4+I=
X-Gm-Gg: ASbGncv60+Io31h7ciNfGyyjOqJdXpEnmaLwerVuSQYADxBLgT9hT9FvRsO3zBa2tWP
 PpR2BRVrKlC35mGSjhEAdYlLi6YfcRtNJKHBgNX04AwH5d+80dumJPAuIcYifVTMhHkgzny8lcZ
 +zRH9t8eS7EwhyM9CwmIBrwX47+LRClO+MNDEm7dpBO2j6vv12w/tKZtZlt7dNVIv45bZ0Md7OU
 NrzP5dsSmGmEAUcyM0aY5Bh2Go4gHZcBiVLStBjWC1h6qSFNYF1yiSXfStBR4tubTMyymxy2o35
 yE/WVIlDTZGHyzgZjVwwqur9RAwsg0bBJzP0amSJG7zcGoVmmA==
X-Google-Smtp-Source: AGHT+IEYCDGg3jXqt5Yod2eTSaSNqRti/PGIBrxXvgqe4swkYucOlNorgl+9aHFa/LpSmyufPn6xuA==
X-Received: by 2002:a05:600c:1e0d:b0:43c:f689:88ce with SMTP id
 5b1f17b1804b1-43d50a1d1b4mr110427565e9.20.1742795906839; 
 Sun, 23 Mar 2025 22:58:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3997f9955c0sm9752903f8f.3.2025.03.23.22.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 22:58:26 -0700 (PDT)
Date: Mon, 24 Mar 2025 08:58:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tomasz Lis <tomasz.lis@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>,
 Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: Re: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
Message-ID: <71bb454a-e61a-43d7-9eba-646ebf9e16da@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306222126.3382322-3-tomasz.lis@intel.com>
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

Hi Tomasz,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomasz-Lis/drm-drm_mm-Safe-macro-for-iterating-through-nodes-in-range/20250307-102511
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250306222126.3382322-3-tomasz.lis%40intel.com
patch subject: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250323/202503231159.himCw1Ch-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503231159.himCw1Ch-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_sriov_vf.c:191 vf_post_migration_fixup_ggtt_nodes() error: uninitialized symbol 'err'.

vim +/err +191 drivers/gpu/drm/xe/xe_sriov_vf.c

253478de2cb134 Tomasz Lis 2025-03-06  174  static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
253478de2cb134 Tomasz Lis 2025-03-06  175  {
253478de2cb134 Tomasz Lis 2025-03-06  176  	struct xe_tile *tile;
253478de2cb134 Tomasz Lis 2025-03-06  177  	unsigned int id;
253478de2cb134 Tomasz Lis 2025-03-06  178  	int err;
253478de2cb134 Tomasz Lis 2025-03-06  179  
253478de2cb134 Tomasz Lis 2025-03-06  180  	for_each_tile(tile, xe, id) {
253478de2cb134 Tomasz Lis 2025-03-06  181  		struct xe_gt *gt = tile->primary_gt;
253478de2cb134 Tomasz Lis 2025-03-06  182  		int ret;
253478de2cb134 Tomasz Lis 2025-03-06  183  
253478de2cb134 Tomasz Lis 2025-03-06  184  		/* media doesn't have its own ggtt */
253478de2cb134 Tomasz Lis 2025-03-06  185  		if (xe_gt_is_media_type(gt))
253478de2cb134 Tomasz Lis 2025-03-06  186  			continue;
253478de2cb134 Tomasz Lis 2025-03-06  187  		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
253478de2cb134 Tomasz Lis 2025-03-06  188  		if (ret != ENODATA)
253478de2cb134 Tomasz Lis 2025-03-06  189  			err = ret;

err isn't initialized on else path.

253478de2cb134 Tomasz Lis 2025-03-06  190  	}
253478de2cb134 Tomasz Lis 2025-03-06 @191  	return err;
253478de2cb134 Tomasz Lis 2025-03-06  192  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

