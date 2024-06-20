Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284D3C2BA18
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 06:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA6010E4E7;
	Thu, 20 Jun 2024 06:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HYUs+8xi";
	dkim-atps=neutral
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B2E10E4E7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 06:59:41 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a6f85f82ffeso51597466b.0
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718866779; x=1719471579; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MtJ+4uZ4ex28J7QDbOD0QW1xHtMVQdZ4DZULYABGcYk=;
 b=HYUs+8xii90AhThSOrH/zWrlO9hC8JQ2IsaOqKZrW08Rq8HTdONiEgLn6xek/eFXgx
 2/DIlhIx7a9wwdGUjBFCZDbn6OodkGHQdGk9zDRSmX0Tc7N9LtV1cY/b7wXVpTT6X1s+
 bMn3ovoxCISdlA97jvC2/d9Zcoyskx/uK1EmY0fJwBbtOx+ffWXk45+cYKEVtHUJ2w0w
 jvreZNb+4RmnKUuegDzeQQ+91vRNl+lj3/oo8cV+5HTzwAt6hHbmcqqoBThq1hRLWfdk
 XMH4IcGoffUsT8AC32vBNnDPk4C6Jkwjgtx+r/bsu6x/pnjVv9b0UY9AFGlGrVG71FaB
 GTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718866779; x=1719471579;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MtJ+4uZ4ex28J7QDbOD0QW1xHtMVQdZ4DZULYABGcYk=;
 b=OQn6DkzpMsnVC3AKmV0jI3nekTY6KZAwAe4zdaKjOCvmWw2M4PDJIo4jbOp5Q1l7cO
 /G6i5Pgs2Q+EI9Mr4QwajS2Iv5zbg3zmoKDavQB15LDBotGovzlvQ0+xDnGtuvzRlLsN
 37o/tUhxZ6YwUupuk9q4EWVwXbHdnSQefKzXUU1vXNsv/puQ2/L1RZ5zCuzb/C7orPlZ
 LT/0Ezj5OkliLwQ1X8uc9GcW2JHKKi3SdNpgJow0Vo/tm+62zITOC4PANoN5Va6BtGRc
 CAHUxEFLGiStw7bQ1Uw3uK1dDzBmu/5kGefcBRhwkG1JGS1UFzyG2Uvh+DJGCmHNUM/j
 +t1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBV43M3kvF4J/ugoVi3A4xqoaUtz437/I3WsvcFbgJu3fsdp0gdr+AZJCNwhW3rDoOnnrLiid+CDo44drZnP1cBVEUeXr2XQAmmtXYXr0=
X-Gm-Message-State: AOJu0Yw/4AxrPRBYA5LT5WCNqKil4z1/+U69t4QmIzC9Q5vH+ENdIRir
 CRc6y2ANw+IQU54RZ9yBymfIfz1oXQ0M9G6QEqrf+1mqWsMMxocJEq2sEri9vuI=
X-Google-Smtp-Source: AGHT+IEkQfMdgFs4EyViq7lxUzgdDauft1xfkm2E5tn+NuLIIZcUS+h/rShjUs3nwktfPjSOIQCqKg==
X-Received: by 2002:a17:906:3b0a:b0:a6f:6150:3f5c with SMTP id
 a640c23a62f3a-a6fab7d6addmr249144166b.76.1718866779386; 
 Wed, 19 Jun 2024 23:59:39 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdd2asm747267766b.141.2024.06.19.23.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 23:59:38 -0700 (PDT)
Date: Thu, 20 Jun 2024 09:59:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [linux-next:master 6397/7105] drivers/gpu/drm/xe/xe_oa.c:293
 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null
 (see line 292)
Message-ID: <1275c783-1fc4-4706-add8-3bc5d27b09fc@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: cdf02fe1a94a768cbcd20f5c4e1a1d805f4a06c0 [6397/7105] drm/xe/oa/uapi: Add/remove OA config perf ops
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240620/202406200703.72WIWhEJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406200703.72WIWhEJ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_oa.c:293 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 292)
drivers/gpu/drm/xe/xe_oa.c:392 xe_oa_remove_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 391)

vim +293 drivers/gpu/drm/xe/xe_oa.c

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  283  int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  284  {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  285  	struct xe_oa *oa = &to_xe_device(dev)->oa;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  286  	struct drm_xe_oa_config param;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  287  	struct drm_xe_oa_config *arg = &param;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  288  	struct xe_oa_config *oa_config, *tmp;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  289  	struct xe_oa_reg *regs;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  290  	int err, id;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  291  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @292  	if (!oa->xe) {
                                                     ^^^^^^
Pointer is NULL

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @293  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
                                                                ^^^^^^^^^^^^
Dereferenced.

"Real Fact": This is drm_dbg() but the dev_dbg() macro has magic sanity
checking where instead of checking for if the device is NULL, it checks
for if the (drm < (void *)PAGE_SIZE).  That catches this sort of bug.
Hyrum’s Law applies here where people have taken advantage of this to
deliberately pass garbage pointers to dev_dbg().

I feel like in a different life I could have had a career writing facts
for Snapple bottle caps.  My talents are wasted.

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  294  		return -ENODEV;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  295  	}

[ snip ]

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  384  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  385  {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  386  	struct xe_oa *oa = &to_xe_device(dev)->oa;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  387  	struct xe_oa_config *oa_config;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  388  	u64 arg, *ptr = u64_to_user_ptr(data);
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  389  	int ret;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  390  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @391  	if (!oa->xe) {
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17 @392  		drm_dbg(&oa->xe->drm, "xe oa interface not available for this system\n");
                                                                ^^^^^^^^^^^^
Same.

cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  393  		return -ENODEV;
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  394  	}
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  395  
cdf02fe1a94a76 Ashutosh Dixit 2024-06-17  396  	if (xe_perf_stream_paranoid && !perfmon_capable()) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

