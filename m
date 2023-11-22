Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC15C61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 12:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1CB10E602;
	Wed, 22 Nov 2023 12:21:43 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E4C10E602
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 12:21:41 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507962561adso9841029e87.0
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Nov 2023 04:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700655700; x=1701260500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfjzjiJTHveEt9UL1qff4xGvsOBmjq9uJEDmLqhn/c0=;
 b=Pg1/+mLt6Xt8RfFkCS2U9zSqS8AIsP/QaBvivffMPIcv7PkV8OMVXuvIiKRmH3v7X7
 WM9OsfUTmPFZlWImaZKX9H8EgERLgk2J06o/2uKpx11Kazl/SxAFFAw51fnabZPy5kAm
 It8lCSX8H31BG8BikJ++0Dsv3txNWEtA7IGVVEXF3RoF+L2UfPjcV/EWdecNSShv2yUL
 DDWZDh6jF15CoiD5iVaQA8d7yNo+AGe2+n8uJldquAs5dFk8c1dEfngSnOlABUfJ1Fjr
 xXZpzhIzEXMdIQsOdf49L2QxnfGClhkYg+FXrmbXsts1Wt00kkdSSRZuZWSAsA6IYa3g
 JCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700655700; x=1701260500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfjzjiJTHveEt9UL1qff4xGvsOBmjq9uJEDmLqhn/c0=;
 b=oL0wjZ2xJ98KC2VKyIGhFGgB1ClhXMu6t27exYcl/z7Z3A3hPyQBAV664eb/dqbbrO
 AW2YajXfilJ3HdmQeTMiwTq+octS5UihziMSoJanEjlCNK3GMvwU4tbSBJhCLF2n0vlc
 vBc58gR3xVBABOFj3HPPVx0E9jcTWbclWsFFXSRTDmfwvBLFft4BqsFDsWgYF1VHH4VC
 7DyupezbP6umXB61IRiwem9xBZLp6PtR+X55+T6mXLs90myRW8y1jzGBPymuSdkbp8Sl
 8JPSVT00JI4YsFVvxSSP2RMPnqhy54OH3pj0uBJLtL/C9JPGHhQ2jo8k+mLhXEgVSPQn
 9xHg==
X-Gm-Message-State: AOJu0Yz5nrfxTty+gVCbkMLBHNDMvqfFlngm7JMfEWZk+6TXdqMrdFk9
 EHk7YsRS9l/HGK/fbD+UmbpA5hH0ev5KIwE8WA2CKTvzSrk=
X-Google-Smtp-Source: AGHT+IEjLTvIL8P1LRGcZkTj8mTN4BcvNs0Zxein7s1BGqlxnH2ZF2fS030gDm1qJvn+03xAO+J/wlszRb8EYu0GdBc=
X-Received: by 2002:a05:6512:158b:b0:507:99d6:95fc with SMTP id
 bp11-20020a056512158b00b0050799d695fcmr206561lfb.45.1700655699365; Wed, 22
 Nov 2023 04:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20231122110359.4087-1-thomas.hellstrom@linux.intel.com>
 <20231122110359.4087-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231122110359.4087-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 22 Nov 2023 12:21:12 +0000
Message-ID: <CAM0jSHMPw+5CNOVMsEAQchNo15qS3BiJMnXqjUuRM1m1fGATQw@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/bo: Rename xe_bo_get_sg() to
 xe_bo_sg()
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

On Wed, 22 Nov 2023 at 11:04, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Using "get" typically refers to obtaining a refcount, which we don't do
> here so rename to xe_bo_sg().
>
> Suggested-by: Ohad Sharabi <osharabi@habana.ai>
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/946
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
