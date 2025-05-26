Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9CC5AD49
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 15:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC5010E39E;
	Mon, 26 May 2025 15:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K01z/23h";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1557C10E389
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 15:06:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso18184195e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 26 May 2025 08:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748272005; x=1748876805; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AsxP/yrbCPSbZ83V0+fVOhQsYXVYOwthunL0kF0vIsw=;
 b=K01z/23hJSu66V/yO+ePf873jyGV7St/fjtE6fkxBOEickyREkeGiSuRAsBYT0sM0s
 8Uh9Chx8x1/ieZ/h5n9gcWsuaFKYhdYBFopzdvYaQTJ7ovICiwQHCCVj3WiOpA8vzB6D
 OtLdCOTGG6zQ/0SxkIElgxvB7veKu78N/YIMyeHf4VZfhHH/vpUPjJuiSUdazvpsNfyW
 r0YqAg9wLbl8FXXpDpbFgCxXQse1bM8wS2qW4HUXdez8LyYlfiMHm64D6esG64LVphKt
 l3Y1GLrUUQ6RXzl3D8YZtRmzJFNIN8Z6jMOt7t88+j5LcBV6AZp4g5RnC8XoalQsnWOs
 j5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748272005; x=1748876805;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AsxP/yrbCPSbZ83V0+fVOhQsYXVYOwthunL0kF0vIsw=;
 b=Oxivl0Dtj4DZ5nHrtdDKkkKb/5fypz2EIPkynA4rr9uYUeAkYDpBDfSvRiP0SbwulO
 Y80jgjy+zCZ74ErQ0WaFDah5YgPwNHTv94TuI7BcbeOxlr9PccwIupLR0qJGP4NVVOfu
 DP84VeGCQOgSDZOTerGSaNKTm7C37aJB8wSA75Jc66nWmRBQbd0kl3mn12XVzYNoWMvL
 opdGHnmDmEZj7BbsWQZjY+jVbWBAZPmZrpryqjR1cZ9BcnwnBkYgA0L3GASP7K/mTWcC
 xMjYRgZsuYsm646VfXfRxJxtiERzokG6Vq8zdMqm72PiZ/YxdKJZInZFjcXAsrL6PZTQ
 QITg==
X-Gm-Message-State: AOJu0Yw/MSTPJyaExzsrCG4ZtV2jB7rb6yUrbI65u9/oAnxrq1y3pD0R
 5wprbn7SWYPpVN+gTNmEypkAKEeDwFsHnUNK2yqECPIkocSot+VYn32idwe3JhFu2xU=
X-Gm-Gg: ASbGncvWOa9DWQBqUPfWMFi72WgQOZnYl00A1FLSGGjBuBwOiOd5/DUYp2oRcbvW67x
 r1K2BDmNGv5D3o696d/lbMKBQBnf9Q/dwxRqdVsuwtwopvhUw3AouCVgW98wKTbh+FrVs6xSh7c
 DmOQ7mLWgyDGpZkea7DK3S5hUFjIRp0MA8w7ps/BKDeTH6zF0fcBOC47gY1ByNQmSe0rhuATDjc
 +6lSJsetqUlgccYSXMRXKm6QaMq2KcQ9TUuAfIGphb8G2jScXAG6AJk6raa4jo04veni5wjBiNB
 HUSVbZ+vz3K56eUj3mkZNqAmUFDvbekM2Hg7sT78TLSgpbKE6pKhNC4H
X-Google-Smtp-Source: AGHT+IEmpGGfCTizmw750bW2UHXz8nV74n5esSCo0a+sMC/xgp1YN+TIDC/fQbCXlSt4LUEblX/RAQ==
X-Received: by 2002:a05:600c:a08b:b0:43c:fe15:41dd with SMTP id
 5b1f17b1804b1-44c932023e7mr83381235e9.6.1748272004714; 
 Mon, 26 May 2025 08:06:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a4d1ed8740sm5658629f8f.83.2025.05.26.08.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 08:06:44 -0700 (PDT)
Date: Mon, 26 May 2025 18:06:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
Message-ID: <aDSDfusiM8QGQwFS@stanley.mountain>
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

Commit 09ba0a8f06cd ("drm/xe/svm: Implement prefetch support for SVM
ranges") from May 13, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/gpu/drm/xe/xe_vm.c:2922 prefetch_ranges()
	warn: passing positive error code 's32min-(-96),(-94)-(-15),(-13)-(-12),(-10)-(-2),1' to 'ERR_PTR'

drivers/gpu/drm/xe/xe_vm.c
    2917 
    2918                 err = xe_svm_range_get_pages(vm, svm_range, &ctx);
    2919                 if (err) {
    2920                         if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
    2921                                 err = -ENODATA;
--> 2922                         drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
    2923                                 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));

The comments on walk_page_range() say it can return > 0 on success but
the comments on hmm_range_fault() say it can never return > 0.  Smatch
does a naive reading of the code and thinks that it can return > 0.

Presumably the comments are correct but the code is too tricky for me.

I can easily silence this in Smatch by adding deleting the positive
returns from hmm_range_fault() from the cross function DB.  Can someone
confirm that's the correct thing to do?

    2924                         return err;
    2925                 }
    2926                 xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
    2927         }
    2928 
    2929         return err;
    2930 }

regards,
dan carpenter
