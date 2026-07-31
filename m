Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02EFC55167
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jul 2026 16:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADF010F355;
	Fri, 31 Jul 2026 16:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="rpmROwGW";
	dkim-atps=neutral
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09A910F355
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 16:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1029B408BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1785516321; bh=MgQjTxKQch4gpOEu0R2yNHL+E8DkWmfYh/+coEXZuSo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rpmROwGWat/xUa0dhLMWBONfi4GIDApZVB4/9LLjseaIbzyeb0Mx0udNASPCGPmPi
 oy9jH6sYQgrg8VWslHfLtbXf9Zodmgh9AH5ODWvPTkHvEpKC5mnuMIuyfqQVvrdUCo
 US/FCnvMYIo6aqY+67njz0LgL40mi1lPEzYO2d6r9hd8QT9776Qm7FB18nUKz44qN2
 wejXvM6GQW57JFBgLMKH9ZtywveQMRNcnamJuiESJ5Hf6p5IcoFzIQv3CJN4W4Zntb
 8PfLg4lSQTKtlph6syIaqmtRtIGBSXGPUYso415FXDUlcWmSZl9vM/hH891UZ0KZ1q
 AQkijH8TPtlFA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 1029B408BB;
 Fri, 31 Jul 2026 16:45:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ryszard Knop <ryszard.knop@intel.com>, Akira Yokosawa
 <akiyks@gmail.com>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuicheng Lin
 <shuicheng.lin@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] scripts/kernel-doc: Fix kdoc for Python 3.9-3.11
In-Reply-To: <20260731144508.912049-1-ryszard.knop@intel.com>
References: <20260731144508.912049-1-ryszard.knop@intel.com>
Date: Fri, 31 Jul 2026 10:45:20 -0600
Message-ID: <87qzkj3y73.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Ryszard Knop <ryszard.knop@intel.com> writes:

> The syntax used by the excess description suggestion change works on
> Python 3.12+, while we need to support 3.9+.
>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 884f42584667..9cba20f827c4 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -601,7 +601,8 @@ class KernelDoc:
>          if not suggestions:
>              return ""
>  
> -        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> +        joined_suggestions = "', '".join(suggestions)
> +        return f"(did you mean one of: '{joined_suggestions}')"
>  

Thanks, I'll get this applied shortly.

For future reference, it needs both Fixes and Reported-by tags; I'll add
those when I apply it.

jon
