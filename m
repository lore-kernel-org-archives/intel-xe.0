Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD64C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 10:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AAB10E99B;
	Wed, 15 Mar 2023 10:21:30 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C1510E99B
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 10:21:27 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b10so18906556ljr.0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678875686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5ReTkBWoIRpFqLmnprhBZM3CKKUMxgq4QL02a21EDGw=;
 b=XnhOnCmlDNHCMrzv+FrxuqkFqcZJoPU+S53JHU0ihUFegagtQS2rwTJymsrJ8D/+vh
 de/nIizwB5C/u2EeKj3ecv67T0p0Th94IUi+4fO0IcWRgg6Ob5/lAwLeD3zQbD8dfKkk
 8QzCb5rK0i1bUwLuzZV+22gXAOSgtxPBjxVZj/lKShPuX6FYUiUA4NoDp2+hjIrsZoJD
 oImQIxMjjF9tkDejOtXPHACnXWfFIqBSIYDUx3p5j29BgDFpdbcq86sfKa+keOTz3HA+
 U5PikEiHC8WYDSKQ8GsrdLbQb2rxhuJos3EyhTICtZyVqWzleBtGhNLn60BMtJ7xBQCu
 Xbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678875686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5ReTkBWoIRpFqLmnprhBZM3CKKUMxgq4QL02a21EDGw=;
 b=YatN/CN4uzyDLLRR42xEmzNPbthfHldI/h6NblRhg5hN+DXN3j7ZfodcYb9+N5Fc3f
 iC0j2qSuPLbh4LUUnjVV+HX2jK2nwd/2M0EkPJSLDn9skM4TsqH6Hy5tydoS68Kamhgm
 LENJev4u0gsJTDKJhaI7cxhUwseQaTek27BQ+vawByfOqkCHKZeUiWk7aF1PzmywFCzV
 RhSZK22S4XsdHx5wp1smHxnfc8hBTEsVH2sKjZbGOj+609CHc6XbqxZ3uAfl44B8xnbC
 rvA57yZ28geMgEEvgYdvge1TpXoukSrz3B19vwFOj10Lu0Cp2ugnWLCNbHkD1flbkKrG
 hL2g==
X-Gm-Message-State: AO0yUKXGgpPdj8Ov42OHNeF+IJO6OgxwH+nAXWLk7lxiuA3icNH/z88k
 gfobHSAdi/1K91yEvl5Ml0BHGgnUwZ+j53RZmGk=
X-Google-Smtp-Source: AK7set+Di/iVyv911FnCJKZEwgXeu6clMSk4su7ga8YYpsqs7NRAMr39r8SKA0IdqUdiJJ0iono5Q4Qw45+OFXcxie8=
X-Received: by 2002:a2e:a9a4:0:b0:295:acea:5884 with SMTP id
 x36-20020a2ea9a4000000b00295acea5884mr887966ljq.3.1678875685933; Wed, 15 Mar
 2023 03:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230312155953.1566-1-michal.wajdeczko@intel.com>
In-Reply-To: <20230312155953.1566-1-michal.wajdeczko@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 15 Mar 2023 10:20:57 +0000
Message-ID: <CAM0jSHMfH+x3qPGgVpPBb_rU-et6uug2zhV8xEBWs4bSgW0DKw@mail.gmail.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Intel-xe] [PATCH] drm/xe: Promote guc_to_gt/xe helpers to .h
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

On Tue, 14 Mar 2023 at 22:33, Michal Wajdeczko
<michal.wajdeczko@intel.com> wrote:
>
> Duplicating these helpers in almost every .c file was a bad idea.
> Define them as inlines in .h file to allow proper reuse.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
