Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DBEC79F80
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACF710E433;
	Thu,  3 Sep 2026 15:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="YfpRaaIZ";
	dkim-atps=neutral
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF6610F5F8
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 13:52:31 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-90e7c71f86eso17554526d6.1
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Sep 2026 06:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788443550;
 x=1789048350; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hUjAEmmSy6PFRBv/7ZCD6slvlXW7y/fGRjA/z0SrhjQ=;
 b=YfpRaaIZbbHSG40zJlc9R71ZgqdfwdC2fwn13qo7xPS9DVtf5PNFu9jOiqtaClgFMx
 gyPnhombgl2DMHW8i3CMMP00yA8eTft1wPIEbr5A5iP6X2LRYgNp5UIKj+JzPqfuyfC0
 vECiQ1eQa+55M8ubif9aXUfv3wukdZYojoWOgQ7Q03bi6FXg2y0FWAtXVvYxKJhethbS
 VHJKkMcHBuEdEQay8WFXMKNfF7yUHlAa+06tcEpe49LcMnLkurbXU+ER0eOMruF6pslK
 ZM+ac9LW3RPsRM1GZ9rd0VhfQjr8wGHAAQRSRZL0UCTFlDjW9HQmZRiHsXkA4w78J3N8
 EFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788443550; x=1789048350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hUjAEmmSy6PFRBv/7ZCD6slvlXW7y/fGRjA/z0SrhjQ=;
 b=MTBSRj3W11OAiEJ/NbnxE2p7y9OAJl9JHuEgM9Bk0NZM8eynzYJ40wJXxQJDC8ZBvv
 rkf61zVMlfajkp29dapCqYbdEiYP9T4Kdd1/wgXRnLhmrT6awoTY16zDUmzzvnVdNMt6
 hh1IrL7RQVjpGaIaSXGHSeajXjjxbVJ/QQaEZ8Md7PlX96tliyTWQADj3I8zgUKgZMJp
 ULCe5R4dAYjT3Te4lWx0WHQckg8xfq1Y4VOKQJY8Z4h4DZOAqaBGlNFSvSWvcGE7Envg
 M0bRdYT7KFSQmNEbDUOTbeOQXsOwtLH4bWLvYYM2F9UkTRNT0kr3KhKXMagP7YMGMYsb
 VIXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByRpeO4QvprcGGQHa41fviMSEc4RcmdCRUy/8jBTcIDMTCQI+3nrwTlkEnbRnVVI1Gk5jlScJQRJQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++ngESvQIh5YfJ/+Z6lawR7iglReVX1lKaGw8H5Sy9yw0C/PU/Yq
 vKxjnWbqVfN1OwGz88UWozOTQlfqMqcMg8QHp6KAc8u5SkjcfE7pLwu+42Gg3PMnZy0=
X-Gm-Gg: AYBFou2y7TBAN3sLK+9SrdVkDZuWraD6+8/mS3mKzkyHIIyEa1b/j8pSTjBZ3VoCp+E
 hUEmJds9+5LSRnhdLly/UMcMU23g1EeH1WxwX7bkwWzHd8C0ZM+qv18lPpOypgH3ltNlJkCfhfy
 olaljxnhze8omLPtvMeijw2zpNAVS64qluKUyWZ2h6vu5/BAJ56ikoydjyQKCriiBkFmLMihHIQ
 XwmDuHRW3u4wu8n4+ydkG7OPt8mlYBj7KJPANHr1VzOBo+tsCILDm+NYmI8vOwHlJaLK944b/x9
 pb8hfsn0RR5btE/OjfF5SpBmP85OxYNaV8zQColzJtu9A49laVlfrRmDQkY4q4DbRNSDxU8pMyN
 6CP5CMkXa/T4RDZsfvAV9MuHVk4aNrihzkJylWYoCkxQVnFP+krZyi+Zb7715qDwzSZ2rpAU/Kw
 nXw0cg3AZ1jM8meh9IMo2PvLtyceRHV+Pa9i4rnCdLmA3hleLiMohL9b3jMzTa6RuwjawpXLNay
 wJrS0nI2msl9TkWlqUS5E8UKJeH3CMnCjbkYviIpMY1OmSirvpKR7w/jVTJOium5KeauwuV27mn
 JexIQ3w0X3cUnM6i3gzYPvSgcrqNG61iuvYRcpTNQ5R6/5VJRSFu75qxbbw=
X-Received: by 2002:a05:6214:4346:b0:910:3455:53bd with SMTP id
 6a1803df08f44-9103ddf1bd5mr6386546d6.35.1788443549957; 
 Thu, 03 Sep 2026 06:52:29 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9eef4f2fsm42933836d6.40.2026.09.03.06.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:52:29 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Thu,  3 Sep 2026 09:52:27 -0400
Message-ID: <20260903135227.105232-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903131432.44250-1-j@metarealtyinc.ca>
References: <20260902162150.58778-1-j@metarealtyinc.ca>
 <20260902192531.44003-1-j@metarealtyinc.ca>
 <20260903131432.44250-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 15:59:47 +0000
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

Filed: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9119

dmesg from boot to the reproduction (drm.debug=0xe), VBT, EDID, debugfs
state and the run logs are attached there.

Jake
