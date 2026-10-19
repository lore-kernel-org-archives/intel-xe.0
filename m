Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E4ACCF2E4
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 11:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B98410EC6A;
	Mon, 19 Oct 2026 11:42:18 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D0DB10E79D
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Oct 2026 06:36:59 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-6af9a9451daso2466274a12.0
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Oct 2026 23:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792391818; x=1792996618; darn=lists.freedesktop.org;
 h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
 :content-type:mime-version:message-id:date:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g2KeYWsG+wFaGgc+7I3C8q1Tb9M91ngHA9b+lWINLtQ=;
 b=dE1rGGe5cI6oNHzUJusUIInawbeD5WrD3zjI+xsCcZc6UZ3fwi5ATns3IwfSk0yGQV
 7thI3P+srZ9vf/UIaLT96GvGoeCEJUwcKUPa0rM0L27OwK3dcq3IqvhJOi68QCwKMQXO
 h8aVAe61YuOLHeRzoi3bbLAx/4e1nRIe/Q7JWUNDLklMlaSgWdnPVAkX9IuMCgSO9ZWZ
 McFQaDBUXLrgHaoX+799Vle15ARcgI3CIiK9oxLr2kXlrZ12UetH8av8FAOK1Hfx1InO
 b+Lt2MeRWZL76NQAJTdqlUW9jT5DPtYQLRM9NFS5kIr5x6WzY9oDagFPQvgE22z7lU0Y
 9ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792391818; x=1792996618;
 h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
 :content-type:mime-version:message-id:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=g2KeYWsG+wFaGgc+7I3C8q1Tb9M91ngHA9b+lWINLtQ=;
 b=gKT6IOUUT0UMIrQohcs3m3a4TEs8lhgO8l9OMKgnWwyXCp4l4jTrL59fdxBFF81G1V
 7Ku6QXA5KHhkjo+WSW9HfbsjUl957a+Mb0pZ1MAMfXtcwBWeYteL4tb5AcbfyEWqh8QG
 cGURyFMbI9EX2ztL+1PqocO/kX/oAeqF7hQTEuDtHkv1G7SmCH4NI+pNs7MkKNKLdrIW
 rkPXqgcm97wU61FeXDhsb4khjhzC4Mm4FMqY3rOkMG0Vjb9y/XeixA75QW4Y5iNmGHL5
 bZD8fyqP49IwZhHywCZmBI7j3jF4A/5P8Gf1RSPnDI9tSAI5xt0IJjL13rRDcDR41qp7
 qOKA==
X-Forwarded-Encrypted: i=1;
 AKwUvByf+RGwbEENfxkMPGLnWPlyL0zN4DIOhvctz9B2mQBaA5/3XT+mURkc76qFbSY6wxCJv3MiQSVeEA==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIvq3OHbAM4LavTiVGmxpqP+SLMJK+KBzntV8wrTM2l0PiEPtMP
 XcAr6c0lpiFEoMlUGdhrgeCXqQXX1Zd1d0PhZSxlbwgWp0onhLz1aXpN
X-Gm-Gg: AYBFou3bo3cdCQ/cmXO83tqBAtAnHftPubXkKdjft0hi61m5smRg1AUT0pXr5Y80tqH
 BnviY/6X9T3OdAaSgnz6gJJUCK09Z6D8XjCqlNcWy1C8NobVulGZixhce5A3FTbwowd+cogIR5Q
 ZiUBGJCQlrfUMnJMSi4hS5JVXMXoX3fAHfjHPNxBQNM6LDH5nJytNVE2BaHXjhrHFsYdyNaNoyq
 3ZNU8fq4c/s2FdeTy/LSCS9n6rM9eWqziBKHQwiubFI+3jJJ895AJyEMNdYrRSy+F6HCl+zoM9J
 GcUg0zDBUUNaJTg4+qWUSYlf2WFW2xASL1FIQ/eDqdfbI+LShD6/l8mdOIfepRInvLBMLtNFD6C
 SoMQsFfQziNHuXzBnR7uNMw4ie78+xxrB0wQ9cDQVvoqiO9VZhYToeUkdcD/3rwitfeXiJQJZ+/
 t1Ib2A4uEkDre4ZQMDv1hdk7qvRHrCzZRb62fp7XVR47uT2SPmQrDAxeqshK2pe+5g8ggF
X-Received: by 2002:a05:6402:e87:b0:6b1:abe7:825c with SMTP id
 4fb4d7f45d1cf-6b3a8175611mr3870204a12.8.1792391817776; 
 Sun, 18 Oct 2026 23:36:57 -0700 (PDT)
Received: from localhost ([2a05:d016:6cf:a600:dca7:6eb5:c61c:2b8a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1b1347sm3628086a12.12.2026.10.18.23.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 23:36:57 -0700 (PDT)
Date: Mon, 19 Oct 2026 09:36:55 +0300
Message-ID: <1792391815.ae0036ac0925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Ioann Komarov <kivan1337@gmail.com>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/i915/mst: let the branch-sink check uncompressed with
 18bpp
In-Reply-To: <20260804094450.125307-1-arun.r.murthy@intel.com>
References: <20260804094450.125307-1-arun.r.murthy@intel.com>
X-Mailman-Approved-At: Mon, 19 Oct 2026 11:42:17 +0000
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

On Tue, Aug 04, 2026 at 03:14:50PM +0530, Arun R Murthy wrote:
> mst_connector_mode_valid_ctx() uses a single 18bpp floor for both

Tested on ADL-P (ThinkPad T14 Gen 3, 8086:46a6) with a Lenovo 40AY
USB-C dock (Synaptics MST branch, fw 5.6) and a 2560x1440@180 monitor
without DSC, so the dock decompresses. The link is 2 lanes of HBR3.

Without the patch the 180Hz mode is pruned with CLOCK_HIGH. With it
(backported to 7.2.8, which still has intel_dp_max_link_rate()) the
mode is listed and runs with DSC at compressed-bpp 16, port_clock
810000, lane_count 2. Logs are in
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/17207

The same dock and failure on MTL are reported in issue 17207, and on
RPL-P in issue 16640.

Tested-by: Ioann Komarov <ioannkomarov@proton.me>

Adding Imre and Ankit, since the patch went out without reviewers on
Cc. Could one of you take a look?
