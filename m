Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A370C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 06:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FCB10E96F;
	Thu,  5 Jun 2025 06:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K1D6QdRV";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038D910E982
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 06:25:27 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso402450f8f.3
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Jun 2025 23:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749104726; x=1749709526; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tKSJlAXqVBS5EZYeNWv52AXyFIISSOzkdzQT6zEe6J8=;
 b=K1D6QdRVDiJS+Hmj+4ELVz4avEMuvGa4LOnm9ZziutU06ruzsMmvvmLeJGIjwsMmFa
 +8GAIr0VCYUuf25k2tGG5ZPeVbiV7SmnnH7/EuuUzGaqaNQe3B4JkLivBm4RZUEbwN8U
 I5qebfk22Z3Wk78G9ZbbbpOUX36LK/RG8R3xPhCK3Wr+R1DvZzhgPaZXQbqj6Lx7POtn
 44NsYwPNmIek9RDBgp6ifC64rKDNwRHqOpA3LHpWt20ziBV8gEqH2IvnaXlZVJH+Gqki
 hceggMy9DgbY9aFUgyTAQaeeyHYm6CvB6s4ROE6ujKtJJzKtvoOlqT5yGKZIDwZr1Ccy
 F3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749104726; x=1749709526;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tKSJlAXqVBS5EZYeNWv52AXyFIISSOzkdzQT6zEe6J8=;
 b=aNYt+vsxbP6KZi01RCHhI2kzwsF6Ep8kHeCW5eSDwbAkm9H+gYQLjp+dZ4mRx7jdO4
 XzVgT/VcIevNIZYNU+46g9u0Xs8UHYniEbTPFOtBZHBnxN89ZS1dGRa/PCh//+jBx7Jw
 W/k5B3vWkbjfj3Vdafr/dCY5DnPmcy6EA2XU02KmaU/biRIHVS6C2GH5nEFChRE4Lg8f
 swMYdlnstkXpQhbr7k2TUQOQ0JrMtnpBN814EiSKnOdJ8PBhifwWq+/C03SAwi89vSaX
 wBxXL3zugu4RSg0mDoppXXUOLWw6scu9N4MYV+MezwV+cMvI9KRdLvhqDosQ0xOxQdMU
 UtOA==
X-Gm-Message-State: AOJu0Yw9pQ7UKbJo7qlr5Z1Gh4dsk91EHz+e0zJoUcqrjVnE71EVq+tF
 SPIj4ImJrosJtF05SCIo/EnZ+tNd/X8JvVcBIRUCM1QaNcCJhBzJV/hxdMwn1abPj1M=
X-Gm-Gg: ASbGnctULN+4JuN9Sz/7ZZwURbhEUL/ffy7jyGHSCTKLe2gevnYBAceCt/5JGXyInQS
 wj2pQMEX1qOyP7PeAxxsKW/wi4Ni4zAW1BxG+5aluiXfeRwu9Aztfxlq6pgdQOCKZ60nkyKU09B
 9MTgy+pxFF5N5z7jT5/eadkK07VZZp3R0xuoCmRSm7k+63GhQ8BW8TNVa4KiengbZinrkE1Zour
 iWyqQ0YH+pTLSjD7oqkLL5Rf7nvK6gLvB9li6yr+/DcX3JxlOAg3z1c2k+L3QwXtnIaLaD3BVhH
 3sX7l73YrCuDmOTfEDCP4RFEr8S6J9bKjjKridIA1HhsWPOze2Yy3/TN
X-Google-Smtp-Source: AGHT+IGg0Rnk6EPGcq4dKiyo99vS4G7EtZUCdEjgbpJWWWhj99zeHnhVDtQTcCg2l0dlRcQyHAbOJg==
X-Received: by 2002:a05:6000:250c:b0:3a0:b84c:7c64 with SMTP id
 ffacd0b85a97d-3a51d8ff9e2mr4085288f8f.13.1749104725599; 
 Wed, 04 Jun 2025 23:25:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4efe755b2sm24008394f8f.60.2025.06.04.23.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 23:25:25 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:25:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/hwmon: Add support to manage power limits though
 mailbox
Message-ID: <aEE4UcbjDxekxXv_@stanley.mountain>
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

Hello Karthik Poosa,

Commit 7596d839f622 ("drm/xe/hwmon: Add support to manage power
limits though mailbox") from May 29, 2025 (linux-next), leads to the
following Smatch static checker warning:

drivers/gpu/drm/xe/xe_hwmon.c:297 xe_hwmon_power_max_read() warn: passing casted pointer '&reg_val' to 'xe_hwmon_pcode_read_power_limit()' 64 vs 32.
drivers/gpu/drm/xe/xe_hwmon.c:494 xe_hwmon_power_max_interval_show() warn: passing casted pointer '&r' to 'xe_hwmon_pcode_read_power_limit()' 64 vs 32.
drivers/gpu/drm/xe/xe_hwmon.c:595 xe_hwmon_power_max_interval_store() warn: passing casted pointer '&r' to 'xe_hwmon_pcode_read_power_limit()' 64 vs 32.

drivers/gpu/drm/xe/xe_hwmon.c
    476 static ssize_t
    477 xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *attr,
    478                                  char *buf)
    479 {
    480         struct xe_hwmon *hwmon = dev_get_drvdata(dev);
    481         struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
    482         u32 x, y, x_w = 2; /* 2 bits */
    483         u64 r, tau4, out;
                ^^^^^

    484         int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
    485         u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
    486 
    487         int ret = 0;
    488 
    489         xe_pm_runtime_get(hwmon->xe);
    490 
    491         mutex_lock(&hwmon->hwmon_lock);
    492 
    493         if (hwmon->xe->info.has_mbx_power_limits) {
--> 494                 ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);

r is a u64 but this only sets 32 bits of the variable.  The other 32 bits
are uninitialized.

    495                 if (ret) {
    496                         drm_err(&hwmon->xe->drm,
    497                                 "power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
    498                                 channel, power_attr, r, ret);
    499                         r = 0;
    500                 }
    501         } else {
    502                 r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
    503         }
    504 
    505         mutex_unlock(&hwmon->hwmon_lock);
    506 
    507         xe_pm_runtime_put(hwmon->xe);
    508 
    509         x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
    510         y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);

It turns out it's fine because Intel is little endian and we eventually
mask away the uninitialized bits.  I haven't looked at the C standard on
this but I wouldn't be surprised if it were undefined behavior and I bet
that UBSan will detect this as a read of uninitialized data at runtime.

    511 
    512         /*
    513          * tau = (1 + (x / 4)) * power(2,y), x = bits(23:22), y = bits(21:17)
    514          *     = (4 | x) << (y - 2)
    515          *
    516          * Here (y - 2) ensures a 1.x fixed point representation of 1.x
    517          * As x is 2 bits so 1.x can be 1.0, 1.25, 1.50, 1.75
    518          *
    519          * As y can be < 2, we compute tau4 = (4 | x) << y
    520          * and then add 2 when doing the final right shift to account for units
    521          */
    522         tau4 = (u64)((1 << x_w) | x) << y;
    523 
    524         /* val in hwmon interface units (millisec) */
    525         out = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
    526 
    527         return sysfs_emit(buf, "%llu\n", out);
    528 }

regards,
dan carpenter
