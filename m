Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED118C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 06:20:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C85610E22A;
	Thu,  5 Jun 2025 06:20:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OyXXzf6t";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FFD10E22A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 06:20:01 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so6251195e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Jun 2025 23:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749104400; x=1749709200; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iWz4XeUZSdEB2MuaxhCApjkxt/0k7Jmf123pY5UIQeA=;
 b=OyXXzf6tegAb+l5kWQENKVBkSufGb8To5wXtHnX3SUrBBL/J3LKtlGLCqixDy2tGV/
 FudsEYOqiQ+rfTOWIjS5yWV+jitltb46qMSJlobCFzlUwmjhdCgxWrtl9wlyNY03Fv01
 b22D2LE7I3cnhzgyt4cRII4Lqhp960tKeM0KHQgZiRQGTwfGvJ5uFzM0YS2O+bLQ6qmG
 lks8cbHCP/VhSpJ3P7xRxKKPB20ciEgm3MVUe1aaWCZg9UiMyOVbo+yTWrn8GPSZQWvT
 FIKtzkx0ZDb8L8tSK6KbzgyY1DDV70upwuSwevhgzQy22YmW/wtt2PyGxM8D3iBUd5hC
 5XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749104400; x=1749709200;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iWz4XeUZSdEB2MuaxhCApjkxt/0k7Jmf123pY5UIQeA=;
 b=GNlt+91U+Ocz86q3f/fr6ZSVBui3XBgZKmr0+Tk3dDO4VONXInaB5BQWYie1sSa2iW
 jYEnDHTnSDUfYNkQTrz0f86GZ3FAAEPJIY3ZGGlX19hXVn4WZkcKxaUTaAkVmEoZGaB6
 Z/FAjELI5Hr5pdnfmyg1E1kz3YnsswKbZDO1EgJCiGvwB+7Q7yuyxajYboOZCmUMSj2I
 3KtJO7VQ73ZuXUVoHLKlkuJH0MWtJtxqK0XT/Hbiy/37uanLFt/6hAl0kSrWI+dM+Jk3
 PEAz4mkHcOUzj4MiHsm+IUPwV8QiP5plwa0/r4C30yP4Z/1NC8p5axvKqfPYeAjcF0Xj
 diYA==
X-Gm-Message-State: AOJu0Yx1u+J5c2a7BZXzpAn9EtgKARp+JwMpbQc4Afbgx6XWaQUerDhd
 XjlwlO4z52ec03z619jWtBCze2Hu0EwkoPlGdAVnfCnFDkElscWM3ITyOy7XokqPQVXRqRK6L2d
 LGful
X-Gm-Gg: ASbGncvMNMRUX/Ycbi6EnuCwmsOI+ygr6J0BeUhG/TYkxMuQsigXvfgBxPkjMhbcvjA
 PWEkIifxsGbWw0TZsTHheH3mja3BYTZd4Q//5rmFPB3X0CVTt0YsfEH8b/kAaLtUHKrQoasj035
 C7nZM+3RoNBfMx6f0wXL2ZWdQ/q1iUcY49kKqJSAiBznST0q6E3qo2gxE9sSE062Q6bDfLgigml
 DCtBdY6mqcGwUrPk7ZFXwfnlJ0Pw4CBd1U77ZcOc+iFAbKzTtF7wTfIGAcn3QTphQdC0LRvnw8i
 9YE4lSGwNNL5naC3mNw+z8WEjgZTsGL4pdcF3EVI/650DpEX+k3MimFf
X-Google-Smtp-Source: AGHT+IEK90yslGn9fmcirPm/1QFVVOfKPXgvY6B34rUmNs3qGMb9jUi6MVSJbY2WDqiR4R7/a0O/eQ==
X-Received: by 2002:a05:600c:870b:b0:441:a715:664a with SMTP id
 5b1f17b1804b1-451f0b13f0fmr41607865e9.20.1749104399746; 
 Wed, 04 Jun 2025 23:19:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe5b8b3sm23549284f8f.20.2025.06.04.23.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 23:19:59 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:19:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/hwmon: expose fan speed
Message-ID: <aEE3C2DpYkmbTPMA@stanley.mountain>
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

Hello Raag Jadav,

Commit 28f79ac609de ("drm/xe/hwmon: expose fan speed") from Mar 12,
2025 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpu/drm/xe/xe_hwmon.c:1008 xe_hwmon_fan_is_visible()
	error: uninitialized symbol 'uval'.

drivers/gpu/drm/xe/xe_hwmon.c
    995 static umode_t
    996 xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
    997 {
    998         u32 uval;
    999 
    1000         if (!hwmon->xe->info.has_fan_control)
    1001                 return 0;
    1002 
    1003         switch (attr) {
    1004         case hwmon_fan_input:
    1005                 if (xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_NUM_FANS, &uval))
    1006                         return 0;
    1007 
--> 1008                 return channel < uval ? 0444 : 0;
    1009         default:
    1010                 return 0;
    1011         }
    1012 }

The problem is in pcode_mailbox_rw() where we return success without
writing to *uval.

    89  static int pcode_mailbox_rw(struct xe_tile *tile, u32 mbox, u32 *data0, u32 *data1,
    90                              unsigned int timeout_ms, bool return_data,
    91                              bool atomic)
    92  {
    93          if (tile_to_xe(tile)->info.skip_pcode)
    94                  return 0;
                        ^^^^^^^^^
data0 is *uval.

    95  
    96          lockdep_assert_held(&tile->pcode.lock);
    97  
    98          return __pcode_mailbox_rw(tile, mbox, data0, data1, timeout_ms, return_data, atomic);
    99  }

regards,
dan carpenter
