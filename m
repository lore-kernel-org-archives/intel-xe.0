Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7570C636D4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Feb 2023 10:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D7210E0C8;
	Wed, 15 Feb 2023 10:54:10 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E64A10E0C8
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Feb 2023 10:54:09 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x40so27048164lfu.12
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Feb 2023 02:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8rqAqsAXzp0ZoFoNhZMyoX1fCju2U2R4REMtvJFvBbQ=;
 b=mn+wd9/O2/H3+d208nLtoJbY6EJm+ra1E0tfFg4tBniAu4YwIMn4l17zFecN6uArf7
 rp4fVWnme1pJmJ+R8Gzvdp5U+W/nUyQKc4oXkvEOQDiaiLbxwZVoIhGI4Hwu+4QDKjOl
 RzE3KXamwgthMNTEmN03GZ9iR2AGC4AZcNrvoK4YEwrM6mWGh2adIftydlFeuXn/FIy6
 bBRaTy7W6Wh7q7LMJePqacpa9fRtdJf8QJS8PQmlBFlm8LIqZkaC0K3nTL7aj0lBsFDN
 +Wqk7JO9tX52wD7o5M2WN7DEj/sK7ld5aDVGIhvOhg5L3vFaJFAJVTp+58zST2UlQMg+
 N+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8rqAqsAXzp0ZoFoNhZMyoX1fCju2U2R4REMtvJFvBbQ=;
 b=tbmYNAhuDZc6Y7J+rptgpr2e2mLiJ8Gu6gsGtmqb9C8RO0em6swNJNXOmdB96EnN/0
 6K7EkCErtacnSHLOSuSmkszx0SjNBjeqpWlXwxCJa6BArFRSqxBEDXKJsFnMYbCQ5heJ
 2+Pt8+8Zy1fU/GZxszVtBSSA05kD+OvIFOKlHm3+YsvIV/cj1nbFR2yHOlf/z0GyVnoD
 UouRJCxldgDqRm8LeI70EE43/3pKlCLGcCcV8WW05nEB+Bn+dnKblQoyud3DKSGUidgx
 ZSn/s3nat4ujMkWRlS3ZxtSEKOtJhl6YL1Wnlz1to0qTf9G3JIRhymlIAycUaS6CREzm
 jPyQ==
X-Gm-Message-State: AO0yUKVbm6KN6aJ5dTUu9xCcqtClag85jBGLawKspZ+VhAMreGPPFdl4
 W4HUiuxkRdqA0RgDYbcRjtqfMqEbpvZdgHojWNYJ9UiyrB4=
X-Google-Smtp-Source: AK7set8oAC9vnvWm2CC55ylQ3vPiyG2cPn72oFB/hWNYtRwtsbIZW/PLRXDgotiQkGV67G7hlUNhFlsDrmGP3RYslfI=
X-Received: by 2002:ac2:530e:0:b0:4db:1999:67a4 with SMTP id
 c14-20020ac2530e000000b004db199967a4mr420502lfh.5.1676458447701; Wed, 15 Feb
 2023 02:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20230214083320.2199178-1-lucas.demarchi@intel.com>
 <20230214083320.2199178-2-lucas.demarchi@intel.com>
In-Reply-To: <20230214083320.2199178-2-lucas.demarchi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 15 Feb 2023 10:53:40 +0000
Message-ID: <CAM0jSHM=3Bg57sDTKzqobGRCpiDVAnmpaOLOXdc667a7=NJqfw@mail.gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/guc: Remove i915_regs.h include
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 14 Feb 2023 at 08:34, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> i915_regs.h is not needed, particularly in a header file. What is needed
> is i915_reg_defs.h for use of _MMIO() and similar macros.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
