Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD69C55177
	for <intel-xe@archiver.kernel.org>; Sun,  2 Aug 2026 16:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C8810E370;
	Sun,  2 Aug 2026 16:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pE+cRh1/";
	dkim-atps=neutral
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5B110F140
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jul 2026 03:19:49 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-383b4a3755fso569052a91.3
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 20:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785467989; x=1786072789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:subject:references:cc:to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=NzX+hRkU5KWllIWfAvWaKY5U9ZRh7FwCTJ1V1rzbgvU=;
 b=pE+cRh1/CEMnnYKgFWY+A0/iEzYfOPRd5jFnJHG9RGHcAl6xm82/9PYoHw4Io5ahAW
 jQJL0ShvVUV95ag92eSBMNugFfzfOM9UgVozPyiELr6qDYIXZobqNtzuGBo1MlM2KSFj
 ReWoxox5oL0gfQqApFoAmMGn+oVz6MMgzPEXH272YpCEpctHqYlRms6yVt1zic2v1/7U
 vbOi7SojGSiCejPXnlj+WwEFl9x3Y0v0V1PMJDNosITKqIZnG1WzQGQ4afXHjx9wUKFt
 RChmdXy9iR/TA4r15NwJpePwGd6SDk7lQrgb6ZAmhqOvbbObO1yJ+3HZY8uCxH21wIkY
 /A5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785467989; x=1786072789;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:subject:references:cc:to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NzX+hRkU5KWllIWfAvWaKY5U9ZRh7FwCTJ1V1rzbgvU=;
 b=Wya8+ZoR0YclACya8fOpVbBd2cMrhZwkkdI0Nn4He7QO8EcU1rByslr33x6GT5MWdg
 s/a81lIqnFmOAu2yLSURqeUAcpysjj5WsANkOb3XavzZ6dU+Iwk2N64E5oeKfJLQ+7Ta
 R74Lo7OGG2Ra/Fw0sb/9XJ4GCUFfoNXg8nEI84qKiHeCjBJlvoTh49ySjMa7EIbp6Uom
 tiTx2fFNVPEXK7iXIrOmaM9S8cjux+IUFkyWzjJ4DVUh4TpdLFSxScv+1Vg/6D5hbjLV
 LlJnqN7V/VKx15tNK9YRHOV787hGMlfWnrPPkVt5U1rJL7+JY+yGPsNq8aOsId47zC+f
 fFuQ==
X-Gm-Message-State: AOJu0Ywhm2k12BsLQ5hXnhRMdJY3U/yUD1TGYAclNRIGcl6z9TZDvqRw
 swxkn7ucXNV3QQ1y66WvNYEJDYYCZ1/mh1YXHwN4Zpl3hZ0O54YwvJwz
X-Gm-Gg: AR+sD11n/2gIOFngeaf7scLEYvzJ2GIz6qZMVAlnp/DzP9KE7OfcI9aI0/AmD6wASh2
 876OvvV6B0HMbrbySO3e2PMz1ANKng66bWQnblGmuzHyKhLsxpKF8CyV1qRHF8hL+Xlig2/KOhA
 YOq3Ubk6Dswc7JsqCZ0NMTd1ked6GWCcsZZOFIR0USqm2iYVusUDLo7F/RLN1oi2o3ntIGWkJdv
 2iYQ+nBKE6tzrxQwAKc3cBHPg4CN4lsYdQ8rsBVzI64igfCglyJTCJ4WagJSfSsHr9iBsB+8xmh
 f1pJ+klGNI5fEih0laHJeqUc8Qdgp/hGVBNhsIcMbFTXJa0GRPd9E6JbVq7WrL4hOyoeWrCZb5T
 ShVBfMnTnZc0a67dLTGaZncGmWWq8lB48cAJe356TMu8md4JdZHSfGl7mNe4+0gPqKPFAbnn+CN
 B32sprrOgPCeXFKJPJFNHKqXO9iFhu0hMSiBZFhi9f3CyfCt+jbv+U6o/pNMz2A2sBimhfrfeft
 Cw84dAeG/QVE0kAsQ/z6brhMqCChuTOXA==
X-Received: by 2002:a17:90b:3804:b0:38d:f096:a1dc with SMTP id
 98e67ed59e1d1-38fb112ea70mr350173a91.11.1785467989242; 
 Thu, 30 Jul 2026 20:19:49 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp.
 [106.167.137.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38fb2e10549sm42623a91.2.2026.07.30.20.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 20:19:48 -0700 (PDT)
Message-ID: <22a9276d-c103-4306-a617-7f34abcd5c29@gmail.com>
Date: Fri, 31 Jul 2026 12:19:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ryszard.knop@intel.com
Cc: intel-xe@lists.freedesktop.org, jani.nikula@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, shuicheng.lin@intel.com, corbet@lwn.net
References: <20260717125753.634550-1-ryszard.knop@intel.com>
Subject: Re: [PATCH v3] scripts/kernel-doc: Suggest possible names for excess
 descriptions
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260717125753.634550-1-ryszard.knop@intel.com>
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

Daily linux-next documentation build at https://www.kernel.org/doc/html/next/
has stopped working since July 23.

In my bisection using a debian bookworm container (python 3.11.2 +
sphinx 5.3.0), this patch, which is now commit d7758384ccb4
("scripts/kernel-doc: Suggest possible names for excess descriptions"),
is blamed as the first bad commit.  Reverting it resolves the build
error.

Error message from "make htmldocs" looks like this:

--------------------------------------------------------
Exception occurred:
  File "/linux/tools/lib/python/kdoc/kdoc_files.py", line 16, in <module>
    from kdoc.kdoc_parser import KernelDoc
  File "/linux/tools/lib/python/kdoc/kdoc_parser.py", line 604
    return f"(did you mean one of: '{"', '".join(suggestions)}')"
                                                                 ^
SyntaxError: f-string: expecting '}'
--------------------------------------------------------

I think this needs python3 3.12 or better.

Can you make this script compatible with python3 3.9, which is the
minimal version listed in Documentation/process/changes.rst?

Thanks, Akira
