Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D58CC55179
	for <intel-xe@archiver.kernel.org>; Sun,  2 Aug 2026 16:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD3410E42C;
	Sun,  2 Aug 2026 16:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="skqZ7gVk";
	dkim-atps=neutral
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E293310E316
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Aug 2026 12:12:20 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2cf52d15d88so15467785ad.2
 for <intel-xe@lists.freedesktop.org>; Sat, 01 Aug 2026 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785586340; x=1786191140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Qq/DwZH7YAlYucV7P0m7oCNJvs6xdClz/fo5aunqV0U=;
 b=skqZ7gVkEXyJWOjVr9rvOYL9sOUqHctaP2ClveoXy8kVdM0grrXIqHnDT4OxiAio0v
 7ENLUjauR2F/H9PVRbQPGWpjuOpzAhAuVOTL0qPP0uc5CQ2UczKb3zX3g/GGlCeAP5A1
 iQOa/bh+VxsFssmZvfeIOztmUThxg7UKqcYGat5S6wmI+oVW7YpJkQQ6qnjnt63gcaB+
 mHw5EhdkLo6I81bY8sBEo68RsQXmrjqwivug1MD9YEfRXrUnub6tsPrUVsLgDHNMDzFa
 ncwsUJ3QFbCEPII9NzLBnkzJEgIVPtsy3COcpQSeyg/15Ww3fYUQmUBq30+24ngO6AGo
 VOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785586340; x=1786191140;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Qq/DwZH7YAlYucV7P0m7oCNJvs6xdClz/fo5aunqV0U=;
 b=DK5II2O76VHNkgQsFZG36xT2zsbS4uAVPx7sXtrLuHSjFtrmOJX0CY7UuLwO8wcRdY
 V3Q4bPouA3r3DiqGPjdrUu4xR6i9wWO4i2w8fk6dCCd9b4QxO2JHtlIaNM9n8fBlJDbu
 Fs1K2bcqwDt8RSuLPyTEFJsV+aLqF1kqdvlUQ/xNoSGbzV98PVxBv9RdXjGHyz5pqT36
 I0i18MPMuhl+54tbMBCq/EeFsqjCcUxmjmmOz6KT8zCjAdLkxQgcyaUGV6Dxm7wYrCgx
 dc0RoWPlCZ+Q9tLnl1AA34ii+F+qVeuHH/evRigSCF7lDN3pNGaqCvwuGRzLIAs2n/ok
 7gCg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpd7Z64QMFE2JFa9BvYqXsi2YvzWgSIdQacWJibyAPINygJGu3m2J9ulBvBK47dTc9qN6Kxn7XNaA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTkt0M1qlWacb7sFuVguRZ2rn7WXajl0EClp+8zJCkKYDu4nXQ
 ZOSMlRHJZeF6wMW8bf2puhjy2AejegUaxwnJWcS9n6ZAP/xzAwcOFw66
X-Gm-Gg: AR+sD11Bd3EIeYVyEL7ie0X8FxhiUqXTFd0+jjnQeVLDa2Xi7mMqqzsNnB2AbeePXRR
 qx4bNLfIrCyUy4b1Lk3o/dyfY9pyBrPL2NWpXcFuzv3sEPpmiU204F+SDaozcP5NH6bg8WhP9LM
 H9Iac25uCiAdd2pS6IRL89oGpmVQ5/xN5TAw6xECQkIN0VR1QHKI1iObVMh2IcYMAq/CWBsXTKl
 6eZq65BDkpEDlubEjehwRUKpvAYmBJllgLhb5ybsFkS5/EM4soVxpdLOalOh3D2FQCFr3ZqIYwq
 p5bSTXSeNcdHIaBVhxNXFbNke6RjpM8soCXZQo6ArRhR2ZWJ5czXgtRLSmU75gttCzGjloD+cnb
 uJqoPgASXWriwIhkvX0sGs0I5tJUJLQxYrHsG7Yjg2byNl4kxG8qQYBI4B89P5rTxxADFhUD7He
 WuFLLb3XMMrU+KG5k7jyVMOZ7LzwJ4v3Ktd9G1YOZnOiiRiIUmc27+fBjjW85rCqxEh55Ww1Yh/
 3TIQfkc+jk5ol0048dKHWX4aaYzUbwCNg==
X-Received: by 2002:a17:903:1b43:b0:2ce:d957:59c4 with SMTP id
 d9443c01a7336-2d052188a6bmr33458805ad.6.1785586340353; 
 Sat, 01 Aug 2026 05:12:20 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d04b15d26esm16948215ad.76.2026.08.01.05.12.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Aug 2026 05:12:17 -0700 (PDT)
Message-ID: <ff702136-839e-4d3e-957f-92573182df0e@gmail.com>
Date: Sat, 1 Aug 2026 21:12:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/kernel-doc: Fix kdoc for Python 3.9-3.11
To: Ryszard Knop <ryszard.knop@intel.com>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org, Akira Yokosawa <akiyks@gmail.com>
References: <20260731144508.912049-1-ryszard.knop@intel.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260731144508.912049-1-ryszard.knop@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 02 Aug 2026 16:38:39 +0000
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

Hi,

On Fri, 31 Jul 2026 16:45:08 +0200, Ryszard Knop wrote:
> The syntax used by the excess description suggestion change works on
> Python 3.12+, while we need to support 3.9+.
> 
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>

Tested-by: Akira Yokosawa <akiyks@gmail.com>

And here are needed tags for helping Jon (supposed to go ahead of Sob):

Fixes: d7758384ccb4 ("scripts/kernel-doc: Suggest possible names for excess descriptions")
Reported-by: Akira Yokosawa <akiyks@gmail.com>
Closes: https://lore.kernel.org/22a9276d-c103-4306-a617-7f34abcd5c29@gmail.com/

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
>      def check_sections(self, ln, decl_name, decl_type):
>          """

Thanks, Akira
