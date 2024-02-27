Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7759DC54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 07:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D40F10EFE1;
	Tue, 27 Feb 2024 07:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="huz0W0dt";
	dkim-atps=neutral
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB3A10EFE1
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 07:20:36 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-412a38e2adaso14397785e9.1
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 23:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709018435; x=1709623235; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=blaeUpy8gxjTga9gUCj3GidhBSJ+UFSTW5YnzmorQqQ=;
 b=huz0W0dt3L65/SSIWgp43Z5bYBe8bebsvhrUJplXwnFV4A8VbeZ9o8kufiafkHFg1m
 Ge6y+d4HEatgaFjbOtc2h2G6BY4iBZjyrPDNjZ/qOKP0yCTVtAHvazQ4Y+aiz8SGn6+U
 +osbuDQXY+0BEWoF2XRG7NwFsED/PJtDk3UNGmrNk/8KaPlhQS3JhlWp9TW3snYF2kOP
 EbrcTEsSWF/xzOcRyLCDeDkGsX51vKwsNWW3WI+3n4Ynz1gzPuu9HV+1mHJ/Quh1dYuG
 jSZAOtqRqeRhLhsf95V0KiCbShJILByDSIMkpwD76lEHA4duZcvSal71X/eAVlvbddRF
 jSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709018435; x=1709623235;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=blaeUpy8gxjTga9gUCj3GidhBSJ+UFSTW5YnzmorQqQ=;
 b=V+4M3nO3FBRxktg0Kh3QYwTcioqZfs60bwZF3icfoLZ5G6cwKULRHvRISZAV+xbuT2
 8VJF8NYkFKLoDHbF/R0i/1oDKkqnY4kOK/f3pJ2XtB6kcHdGorMeU9Hzbf+gsjhDQWt1
 /Go6TqEZ22YsNBS7YNIKxJpDZBsTw2rmeSkOXrDwuduDFofxPgqkeXZvrlgrBxTpgUoA
 zNIrKM7NlW5Y8F+Es1h+KL6RG30gIvk9RErF44WPhRe2RDpmHX6ns9KOCfogvHzyjEsP
 DtRQv4EpodhkNByz2X3aY5WOKQAQDEPe6nQcefE0zDlwfB3MpFVpL5OGfYp+PxmD1Iub
 8r7g==
X-Gm-Message-State: AOJu0Yw4XJqgB9EQUsnl9ZS+0l5oATzDdyhs9ZE8f1Ooo6uWCtTJZpzf
 /SvcYdSsPbc+nYjt5FTnHzHO49a0Mz6/Bi+MiM6i3qtep8HbteYdb6hdmoUbOc4=
X-Google-Smtp-Source: AGHT+IEUw6+96t/K3Xu5ryZ1LapfnfJ2zwgbNvCdoCZ42+JLLXwW3p56WXZvoGHXsf8oBc1HT0G8vQ==
X-Received: by 2002:adf:e284:0:b0:33d:3098:c1f with SMTP id
 v4-20020adfe284000000b0033d30980c1fmr6389400wri.44.1709018434693; 
 Mon, 26 Feb 2024 23:20:34 -0800 (PST)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 bs19-20020a056000071300b0033df49c9d00sm167009wrb.17.2024.02.26.23.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 23:20:34 -0800 (PST)
Date: Tue, 27 Feb 2024 10:20:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Cleanup some layering in GGTT
Message-ID: <9f1ac4f0-a13e-4b12-95e8-1b43e4766b4b@moroto.mountain>
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

This is a semi-automatic email about new static checker warnings.

The patch 3121fed0c51b: "drm/xe: Cleanup some layering in GGTT" from
Feb 22, 2024, leads to the following Smatch complaint:

    drivers/gpu/drm/xe/xe_ggtt.c:256 ggtt_invalidate_gt_tlb()
    warn: variable dereferenced before check 'gt' (see line 253)

drivers/gpu/drm/xe/xe_ggtt.c
   252	{
   253		struct xe_device *xe = gt_to_xe(gt);
                                                ^^
The patch adds an unchecked dereference

   254		int err;
   255	
   256		if (!gt)
                    ^^^
Checked too late

   257			return;
   258	

regards,
dan carpenter
