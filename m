Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31528D116EA
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 16:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91BE10E20A;
	Sat, 29 Nov 2025 16:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ARMJq38y";
	dkim-atps=neutral
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1808F10E03E
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 16:54:07 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-5599688d574so773614e0c.2
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 08:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764435246; x=1765040046; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SUdMDrZomFUZbbZgdh9LwkvsujEbVnk82m9l5aFdt8o=;
 b=ARMJq38yiJdBdisA62+a+4w73VEbp0P07apHAsT4kGRdVfjSf+yHiYAcmOkqvV96zv
 osV3fNBbnMK7STJqGYd6DZo80RR8gUjr/7CL0TNkns3bZj6I87rlkS2ror96bODxvWWL
 jycEqnMybq8AzOF7upyFYBsMLEnS/x8vzn/gkE7jTyXydKZXcAGysoovzCBvqigI8lv8
 BiBziyUY3m3V916Wxqt/89Co64a0pJpk2DHzUzgRdndC03hBS0H/M5GCnYcXXPL0nub7
 bDcR2iA6dP+u8QBff1z0QcPvIi6jvlJlVLk6V2nsHvxEBEssbBgdsnmgyzOB5722KuWw
 0RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764435246; x=1765040046;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUdMDrZomFUZbbZgdh9LwkvsujEbVnk82m9l5aFdt8o=;
 b=r+Kldrb7poRo0Lt0FjhbJ1I4+nyTMoSZ5dTxCRRRvZz9COcwsC9JJs6vV/plqAjIKy
 ayBLSugeYtgibPBjNChwLwRNOt36Pa70RmZ/fhUatRBV7VbWJSj/ox4kEbjQuu/yHMvM
 /U9HDiPksYltufSiatHlXxWOmFjNmw3a7S/ognlKVh0CQBNw2qJJ83EYykEGIc1KO110
 qN8ayhEggmezY2zm1+kWadDjuVtr/O0DOm7NGQFRUx6sNX01EEW955Ub6tCwI/vQGcIZ
 QJ1Yx9sik5fiSdCDnyeaR+Y4aODxSiv3ybzrzFGmnoUVGVPKOY8i9eeetCaPfv47aYgr
 rJqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Afp59DvTqOtynveGg1og8kV3rpEEymcN9UtfkA1q6mKjXc9GkUsMMKgFgFCcP4LhjRzJmYqahw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLPLSi1yJppLUszrGmU8hj5Maa6d7tKkzPTwfZ+w/iDUsXdM0X
 6N7B0Lnxqwg9nqYdPf5UTvbssprDuV+OT5M2skpQ8UAvnBmN0mvU35QNh1lyEeiLqXA=
X-Gm-Gg: ASbGncszBK883txfMZQkURKwL2SLYnEjKXhX8RnxN07TQZTJiYi3l4ey2c2+GxwLzMP
 VtNIlAnVsktPBBol5bHWL69GoE+xRiS9R4t9SppZ9/LRWpFgS/Eurm/xNuxCO7wTjqOYLRZLEtd
 jfBSVcSFzJ962QxyspD/qc0Ad//kSL6CsrwLOwN21znS0Wijr4AfW0V7Db99eDL3F0Cn+2bObnM
 tEz1q1mjtGJJK0G4naXfL3+qJHoy2fFyjVgfb/u6vGYtyRbuSD+TcVCmJnYkYI+/Y/6exeFlym8
 HQKfYml/FDapzpZZpIRVvMil9TNXZtJynSjT9sSgosS/+wYPD5Heo2l6udtudG1M2EXnFk/F1Sn
 Gt41DZLRlx3jlZ6yxleLe5WEKHVwb9ruORkcAFW6v40bW7xj7bCjalsSUROnljSnLsZBvqHqhJ6
 cvw1FX2QMm0IdGbaPf
X-Google-Smtp-Source: AGHT+IG5tajmTfYoc3lFMiwar57/U6inDiuyMwTKKDkv9l56SNQgQ4HUSlYelexgYFZ7UMzNqqfw7Q==
X-Received: by 2002:a05:6122:202a:b0:55b:305b:4e3c with SMTP id
 71dfb90a1353d-55b8f00fd2cmr10936851e0c.18.1764435245594; 
 Sat, 29 Nov 2025 08:54:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 71dfb90a1353d-55cf516c50dsm3256156e0c.19.2025.11.29.08.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 08:54:04 -0800 (PST)
Date: Sat, 29 Nov 2025 19:53:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Matthew Brost <matthew.brost@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <202511291102.jnnKP6IB-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126214748.650107-9-matthew.brost@intel.com>
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

Hi Matthew,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-several-job-helpers-to-avoid-drivers-touching-scheduler-state/20251127-054955
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251126214748.650107-9-matthew.brost%40intel.com
patch subject: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20251129/202511291102.jnnKP6IB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511291102.jnnKP6IB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_lrc.c:2392 xe_lrc_timestamp() error: uninitialized symbol 'new_ts'.

vim +/new_ts +2392 drivers/gpu/drm/xe/xe_lrc.c

94c0c481e1bd20 Matthew Brost         2025-11-26  2363  u64 xe_lrc_timestamp(struct xe_lrc *lrc)
9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2364  {
94c0c481e1bd20 Matthew Brost         2025-11-26  2365  	u64 lrc_ts, reg_ts, new_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2366  	u32 engine_id;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2367  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2368  	lrc_ts = xe_lrc_ctx_timestamp(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2369  	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2370  	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
94c0c481e1bd20 Matthew Brost         2025-11-26  2371  		new_ts = lrc_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2372  		goto done;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2373  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2374  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2375  	if (lrc_ts == CONTEXT_ACTIVE) {
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2376  		engine_id = xe_lrc_engine_id(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2377  		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
94c0c481e1bd20 Matthew Brost         2025-11-26  2378  			new_ts = reg_ts;

uninitialized on else path.

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2379  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2380  		/* read lrc again to ensure context is still active */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2381  		lrc_ts = xe_lrc_ctx_timestamp(lrc);

lrc_ts is re-assigned here.

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2382  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2383  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2384  	/*
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2385  	 * If context switched out, just use the lrc_ts. Note that this needs to
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2386  	 * be a separate if condition.
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2387  	 */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2388  	if (lrc_ts != CONTEXT_ACTIVE)
94c0c481e1bd20 Matthew Brost         2025-11-26  2389  		new_ts = lrc_ts;

uninitialized on else path.

9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2390  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2391  done:
94c0c481e1bd20 Matthew Brost         2025-11-26 @2392  	return new_ts;
94c0c481e1bd20 Matthew Brost         2025-11-26  2393  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

