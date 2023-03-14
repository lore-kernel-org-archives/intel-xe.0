Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC092C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 15:54:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F0E10E81A;
	Tue, 14 Mar 2023 15:54:00 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7B010E81A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 15:53:59 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id s22so20617992lfi.9
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 08:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678809237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GouO4fNbeKiMqdwpS+YaX0l7cDcMLPgAFdX3fjLddaE=;
 b=ZyP0FXOLoCmw+5TPXOW+RY4clUqAmZdOxFmp5SWGb2QUtMUuvUmaP08dYi41uff+9i
 R3e6mQpcFs2SE9jhu2AxscC/FkfeD/EfowP4u6VJlx3HUgogJKJcKrskaFd3pcI+ZiPb
 l4F7UWTiX0uujgabH8pWBRlvSVunH43eT1U3qgyG5dWvqNmBi7QRp4wAs0xR6vBfR++g
 On2fwDtjcBt1LlnlqewT4QXHKy8Te28tiZ5miJhvJmUVFmGCgJ47/ZI1kZA2W6lnGQF/
 n4nOS8M3gFnDxZMPrMhn5eMzClo5PBU3JuSFwQlf0cV4tl/1QXrA5oKQRLGiIBKjZlk4
 6saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678809237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GouO4fNbeKiMqdwpS+YaX0l7cDcMLPgAFdX3fjLddaE=;
 b=FkrvXBh+ctWzmG5Cs7BClOqSUKhGKRUffNx21wxIEGt5pU5gEp2cCmTznOHUzBCmZl
 FKcMqYW8GvCWzJZS9O+ItFg/uPwgu1dhyH0HKn0o7nsqi6OMnJ2Gfwx0xDsQaC39A7DP
 FzN+IYQCabAvcgpPGAiDPRHGG5sjmJ3DAD68BjW6umIWNpAGbdL1zpyF5LWIj+VYv3h7
 xCJvu797Cck/3DI4lmxYfSGtBDCJIq/HFSGJKVgGHVIue6FEbHguqL5T1sVQHmGuU+0H
 /nAgpvtW6CjKqqeVG8UuNCeQnL8hqOTLz+jJaqeKWiLaJwbNqFRPYxj929ZSt17jL0aa
 nnNA==
X-Gm-Message-State: AO0yUKXFyqqgQ0at8fafxGfDYvHiUZH2jfzkzSzgZaNcqgrveQJw7QmY
 61vkT8gZufZwVboQHTTOEUa8gDbaoQrLkWR8mbrlVcI4aJA=
X-Google-Smtp-Source: AK7set+b6Ie6BWQys7bENVfC9GZl10Jx5TZRsGicDMl42YTezH/TyYaYPjrvkpmOnPRGby97vmpgavT/fEf0rr2o/k4=
X-Received: by 2002:ac2:5446:0:b0:4d5:ca43:7047 with SMTP id
 d6-20020ac25446000000b004d5ca437047mr901836lfn.10.1678809237321; Tue, 14 Mar
 2023 08:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-7-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230313204519.158888-7-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Mar 2023 15:53:29 +0000
Message-ID: <CAM0jSHPaDe+1kZK4o5txv4+tGTX0s+yYGxmQ_F7-h6eFhCpapQ@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 6/6] drm/xe/tests: Test both CPU- and GPU
 page-table updates with the migrate test
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

On Mon, 13 Mar 2023 at 20:46, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Add a test parameter to force GPU page-table updates with the migrate
> test and test both CPU- and GPU updates. Also provide some timing
> results.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
