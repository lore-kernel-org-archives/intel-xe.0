Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B84CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 07:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C2E10E0CA;
	Tue, 23 Sep 2025 07:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q2hx31Aw";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4004710E0CA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 07:22:12 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so2628224f8f.3
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 00:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758612131; x=1759216931; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gyYukkjaftD5tJSp8FnxyTV6uHTe7r8DqTyYnezLZDA=;
 b=Q2hx31AwlMU0TOYj7ztnkkpPtkae6pPbGp+Mi+sZSktrj1GP6FWYlt9DSYsbCvxkto
 tCBGVVC+5RpmPn3eyP2K2ReLRYH8nAW27uYbewICgmhLk+bgAE9wiLnY8fFax8klwZha
 ASKMreLR7+WUrxRpaPlM3GCrdM2MPL17YFojGF7l492KEGwV7KvkiaW4+SCy5P7cHJ57
 6fXI5/nU+qioUil+JjoAqpRroeU+X4Nl/ze9Id0UiGAjkEkwtlY372DyX4Lm7PfAXwOc
 6JZQDGPfRLyMIvDhBNvT2FZJLe4R+4aYUHqsu+IDZcMYCIfQpUerpZ9RpeZ5rZeA9U0T
 2FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758612131; x=1759216931;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gyYukkjaftD5tJSp8FnxyTV6uHTe7r8DqTyYnezLZDA=;
 b=BgL7HeBzFfI1k+9cK12kqEOaHH9wzlXqiTO7cED1JLhBef0Uu0L/KJWsBJzN4jYdOv
 1Dk4pju4/3tiJJeQWGzMwHZ3dMs+C9KWWwVKGoAY1AUvEM0GbczUBjCq1emv4Vf4J54E
 jqtCdvywLxjPIRsx7shzu6P5fOj1cG0DIQnknDy8fkQFEeA2IeqZqnXUSv2ee3CPBmuM
 L3P4bQKbM5mW99gZxb1u3UMle2iIR/zQEVAmfmjnUHk8rGvVGCx0s4/Gtp0Q2VG/Fbgz
 Zeze2umuXlTP6iGKa+owN0sjNvu62/cGiG5G0+x9IJWhCfU8xKTt0iYFuJa5pGcFQ/3B
 EXWg==
X-Gm-Message-State: AOJu0Ywq9QMUPn0mordBM7HRkz7dhTWPuGHGTuVBLOYVgD7mMuBfklW9
 SdirJeWfsc9oJEUqNkzK/1L1ooRl6IdhIubPBb3iq9q0nF9Gu4kMS0qd7DiYW/lcXHwW+YmeNn7
 Ie1mO
X-Gm-Gg: ASbGncvmJKkQX6MkmFhKZggdOF1SDbZ7uhcOeAoSgUmTcyb8KNt/D+RugKgruE2Qj+p
 O/cK0z/3MwQQs43Sq8bSviqa6/tKtvBwnBnzXPfXufyfnDT3Rl0cqJ/nCjjFd3J1esANQjOxFsC
 QaKQcqZyqS59MMqLytOIsIdrsDtlOjzIzG5GnkQvl1Eo8hoKpMx15phuobuYoNv4iGH1SaOvTgM
 bvv4CydegSnJg+FOCjpO+No6FdU8ZvFxDaWn9npEIgHzwcjsb+HFNsFjUBl1SlJWIpWVAKbQqXS
 HpZ6E462YPzhBUoSsUNZ2v1lkX57XuoSEzVAYhg/SalNKq/+F2DLTzLaxRaT8ulQhV8A/CjfNZg
 x6+xggDGOX2LXZel/tuga1lHUUn6Q
X-Google-Smtp-Source: AGHT+IEvLChr8h7cVSAsjq5LyFebOG2vi9XiLZyVAXXytSn6g5gtfv0NDYdxQx+Qw+wALK799UyJsg==
X-Received: by 2002:a05:6000:1849:b0:3ec:ea73:a94d with SMTP id
 ffacd0b85a97d-405c9a01b6bmr868799f8f.37.1758612130721; 
 Tue, 23 Sep 2025 00:22:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3f61703b206sm12515334f8f.6.2025.09.23.00.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 00:22:09 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:22:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/configfs: Allow to select by class only
Message-ID: <aNJKnrCQmL9xS9Gv@stanley.mountain>
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

Hello Lucas De Marchi,

Commit e2a9854d806e ("drm/xe/configfs: Allow to select by class
only") from Sep 16, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/xe/xe_configfs.c:331 lookup_engine_info()
	error: we previously assumed 'mask' could be null (see line 327)

drivers/gpu/drm/xe/xe_configfs.c
    317 static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
    318 {
    319         for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
    320                 u8 instance;
    321                 u16 bit;
    322 
    323                 if (!str_has_prefix(pattern, engine_info[i].cls))
    324                         continue;
    325 
    326                 pattern += strlen(engine_info[i].cls);
    327                 if (!mask && !*pattern)
                                  ^^
Presumably this should be || instead of &&.  If mask is NULL the
function can't succeed.

    328                         return &engine_info[i];
    329 
    330                 if (!strcmp(pattern, "*")) {
--> 331                         *mask = engine_info[i].mask;
    332                         return &engine_info[i];
    333                 }
    334 
    335                 if (kstrtou8(pattern, 10, &instance))
    336                         return NULL;
    337 
    338                 bit = __ffs64(engine_info[i].mask) + instance;
    339                 if (bit >= fls64(engine_info[i].mask))
    340                         return NULL;
    341 
    342                 *mask = BIT_ULL(bit);
    343                 return &engine_info[i];
    344         }
    345 
    346         return NULL;
    347 }

regards,
dan carpenter
