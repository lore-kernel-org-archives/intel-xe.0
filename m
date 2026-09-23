Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D231C9832C
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 19:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86D310FC38;
	Fri, 25 Sep 2026 19:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="ftGXLmD9";
	dkim-atps=neutral
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com
 [74.125.227.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4E010E924
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 15:25:10 +0000 (UTC)
Received: by mail-vs2-f12.google.com with SMTP id
 71dfb90a1353d-5c67e5059f9so648498e0c.2
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1790177109;
 x=1790781909; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EZh4tpz1qULZcD5BqOExpc6yQOG+i8+o67CAd0o+69Q=;
 b=ftGXLmD9xN9lUiptXMstP1nNnqfo1QYjFjR3HqSF/fxSGIhARpjgvqpb3Xaoq7bC9J
 OlgVOQFVKyI0BgCpNL+7KNNbugcKddxQ1nMr4XmtkGds+RMG6RR6N97dq8q+VVN82sxp
 rfk1DwrNPp5HfpHz9LlNWPLw7qwuOasWjh2ty0ZdwG0vIuIZclSUF709XDTbxS6EZgro
 loIeDKyp5Sg7XUqj1E3Dwd/h4gplp3hserraetTwXejfnAoGkM7dmXjSOTVteMy330jd
 1FgSgZRDdSsTSkF9CEUwsg4vXOWJBqNLbUtXm2YTNqVasJ1MUink7FbFMXnSYO/Nk7jl
 lT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790177109; x=1790781909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EZh4tpz1qULZcD5BqOExpc6yQOG+i8+o67CAd0o+69Q=;
 b=ukn+mw6ay3PhoQhQmXZpVpRakBZxBxWvgh2W778X0t8NHu0NIj8PvaRpe/EyYjw9io
 cIrDYQFx2+vz3uzrpG8yvw9QKOMeYezvAvl/jq/0D5Vu/eqpeyFOQXvxQBlfgMMm61J6
 g9upghEkUxIE9njF6J7yCO0eqU8dKHkFLrNYSKkj9R4Y+wknRQPi+nAkyuM6vcRBNcuf
 2qgr2ZE+j8m/InUnB1tmU8lDyPJbX7tuLuSjKwsw405FewR8qALpN1qUJr9dCFNdZvBN
 aek16sH+0hScrQ4Dto+nOqz2nqfKW0qPBiHlP1mgyDgxg7ZNzWM/uLQ7myMQeIQHzHa5
 KOvA==
X-Forwarded-Encrypted: i=1;
 AKwUvByQ370Wp5rMMQ42D/L4tHZldMymXmDeRvPq28S0pQtDTC5AihHdni0CD4qOLl69f3WHFPxAflDyRQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++l2XLtX+HcILrEsFn2FaetRqArWwNVT5Pb7MfOBhiquVbmG1Gnb
 jaCmAKKJqLvaGTXfzKbqlk7VMcv7lxmTnbfMOGHrtgjaIGNVQcFAqFdzr8A0MH3HYyc=
X-Gm-Gg: AYBFou0s2aS+bpkWovu8GY0DGQAtzvWrQojl7vTkN23rZlv9H2zQZ666mjexKImb9a8
 9DR/5pyRV/geELBRzZpL1fl/1MXH033FIAbQoOuvwQjVLBwyMEMo5gk9AQgOv4iwMPbqTS1E/uK
 M0KZBcc3Jx0ZYOUNAs4BfpAmyWLQMDV3OHD6Gs+rej1DXfkqS/1SLLgjYDEMOkMg7qveOQoYKsP
 ksFfmomVKYMftwSuT8cyEtan8zqkFSk+PmR7RgvpIGEbuAuJIrnxkloxLbEBvFWuzHj+P9M01BT
 cBUtpMkacD7E3KSDg6WlLzGSN7XkGnIMmIl2DhHHzeOx1KGoEuTJfk0h2YpVgrw6ewTai3QRrKD
 Gj9f4ybKBmwWDhbRrz4UBGdkX4pu99PWQ6d1A7wwWgBhrj4lJKj9WJgw1U/TrZHvL7w/YOf58IA
 WFd1cINAdgdgzZ11oDno0Pq04D3IQaarOTD6o4tJ81cREr9yhLMviUoU40liRu7uq6H7APeZqDO
 mlDsnaivWhQwZ8XcV1f4QAxcodkXcbWxEUhI49wBFnt4ToOD5g5dUl3SDEeC7cIZbIdUpsbzyjo
 BZIf32ERalScn0HxPf1cpPFGRUYddnifKKfp52ut9A4gPuwmwBERSvljlPHkRRI=
X-Received: by 2002:a05:6122:d9c:b0:5c9:a617:580f with SMTP id
 71dfb90a1353d-5c9f16563c0mr3488766e0c.12.1790177109089; 
 Wed, 23 Sep 2026 08:25:09 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::12ac])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c9f053f9b2sm3347672e0c.14.2026.09.23.08.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 08:25:08 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com, jouni.hogander@intel.com,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/dp: Don't promise AS SDPs in PR Active when they
 are disabled
Date: Wed, 23 Sep 2026 11:25:06 -0400
Message-ID: <20260923152506.1546922-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923142721.183E61F000FF@smtp.kernel.org>
References: <20260923142721.183E61F000FF@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Sep 2026 19:10:48 +0000
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

On Wed, 23 Sep 2026 sashiko-bot wrote:
> Is intel_alpm_pr_as_sdp_skip_frames_enabled() defined anywhere in this tree?

The patch is based on drm-intel-next / drm-tip, which have the AS SDP
skip frames series (8dbe5c47ca42, dc0fd724e13a, eddf77ff1a23,
9ed39b7d74b4). intel_alpm_configure_pr_as_sdp() and
intel_alpm_pr_as_sdp_skip_frames_enabled() come from that series, and
the patch builds there with W=1 for both i915 and xe. The tree used for
the review predates it. I'll add a base-commit line next time.

Jake
