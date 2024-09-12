Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEBFEED601
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 13:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424010EA8F;
	Thu, 12 Sep 2024 13:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hx28dttP";
	dkim-atps=neutral
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71F310EA8F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 13:05:49 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53653ee23adso883728e87.3
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726146348; x=1726751148; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PFy83Xo4HRlT4VMw6aQLtndBYeuj205BcBDL+FukQos=;
 b=hx28dttPFHILrMAGorqGE+/Wi86Lw3acl1TJqmiK+SOyGFSrvXegFsFM28wg8y9sda
 yOn4jN2kz9wSWHbbOi7IIO9FB3HKvNvn6KRhnPoxY/VVthRFsA/jA7gfhFnwiyv9qbbj
 rlt1uQEcUlxtyRpRcH1ut8daNEpUYqO00gSt88/B6vnioNBCsqgHZJzdHTkedaJG6VJl
 g7RHpM2LT9EI7LZ5b3k5tN2tzUz0tgBSwSFSsVM8x8JpqGhgLvaO47ynweUdxN4xCWkh
 8iUbWuQMPybG4BMef07NFU5IetKjEKI0jKs3ZLCpxpmC6ewVGG6ZYfm9cV5wecUbIs7Y
 9+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726146348; x=1726751148;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PFy83Xo4HRlT4VMw6aQLtndBYeuj205BcBDL+FukQos=;
 b=Mxy0S0k71AW4M8CBtzizSU6u/LeDM+aDvB20XMI4Wy9UwIi3RKT011B0HsP89N5JRf
 a0WGBujaVSCwVy9Yj/+qsjqQkc6pFj68E+QXkKVUW92ePXvlQhUaJml70cPwpOwUAqD4
 IvdrkZ4xbwgdtUh3Wkbd/Lu9eXLKrmkZ4DGCXxCC6Bm+Zx5+fr5OjC0azhXQz8gM7nDV
 leIJv4r6LTusAOBUC9zTqEHVeTpf97vEndysrpAhLS6afKNy2cVVv53wdcpatwxSNzsp
 j/VUztPtCySiMRU4HYT1U53XL6ZHXUj+W3DylCJMLG4Lz+2QPYr1ikBEbe8Mz/xb4m51
 vxcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWFQHU6gMrnW8CXvtIMCPh4f/UGWw/BDwPxpZNKstVJASzbOXRApmW0jDyLnJsRz4hKuL4cZaRyg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSjfawuZfdcBff75Oji93ckB9/Gg0aY1mI36KEq7ULFloKUhjX
 BIV3ooYZO/tOIvpaUYsmTIOToLOq0WPkl6Hk4/eULuGmeiajrFD2JQtQVIwcq+U=
X-Google-Smtp-Source: AGHT+IG9ZSiURirjUXz2mT5qhibORJ4JRGAIyTsfUR/UAuymDe2P71ZfmKMRfdgOKZSIFaKeDErLAQ==
X-Received: by 2002:a05:6512:3990:b0:533:3223:df91 with SMTP id
 2adb3069b0e04-53678fbab40mr1562276e87.24.1726146346365; 
 Thu, 12 Sep 2024 06:05:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f903bebsm1882080e87.204.2024.09.12.06.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 06:05:45 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:05:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jani Nikula <jani.nikula@intel.com>, Arnaud Vrac <avrac@freebox.fr>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 Nathan Chancellor <nathan@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
Message-ID: <ki27iun7ar6nmwpkzykwjvkrn5jpadirbz6fy2c25akh2sbgpj@etbg4uo3hixr>
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
 <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
 <878qvyjxpg.fsf@intel.com>
 <9028f858-8c6d-4292-a6aa-27eedff3ac8b@freebox.fr>
 <87ed5pgm2i.fsf@intel.com>
 <c2ed3380-82c3-43a3-9c01-534b08333f95@freebox.fr>
 <uosenmxvixug7yfakpbynbltryvvxqc2hxtagby362c2lvps22@kce4vsbi7xql>
 <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <535df4a8-2d4b-4c52-851d-b4306a28b07f@freebox.fr>
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

On Thu, Sep 12, 2024 at 02:50:04PM GMT, Marc Gonzalez wrote:
> On 12/09/2024 14:28, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 02:14:10PM GMT, Marc Gonzalez wrote:
> >> On 12/09/2024 13:15, Jani Nikula wrote:
> >>> On Thu, 12 Sep 2024, Marc Gonzalez wrote:
> >>>> On 11/09/2024 12:23, Jani Nikula wrote:
> >>>>> On Tue, 10 Sep 2024, Marc Gonzalez wrote:
> >>>>>> On 10/09/2024 16:51, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
> >>>>>>>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> >>>>>>>> inline functions for W=1 build").
> >>>
> >>> [snip]
> >>>
> >>>>> GCC doesn't catch unused static inlines, while Clang does.
> >>>>
> >>>> It makes no sense to me that adding "inline" would prevent
> >>>> GCC from diagnosing the issue... GCC should simply ignore
> >>>> the "inline" keyword when definition is not in a header file
> >>>> (maybe they don't store "origin").
> >>>
> >>> Please just read the commit message for the commit I reference above for
> >>> details. There's not much more I could say about it.
> >>
> >> OK, I read 6863f5643dd7.
> >>
> >> My remark still stands.
> >>
> >> GCC's decision to not warn for unused static inline functions
> >> in source files (not headers) is questionable at best.
> > 
> > What's the difference between source file and a header after the CPP
> > run?
> 
> That question is moot, since the source file / header file
> convention exists only _before_ the preprocessor runs.
> 
> If you meant to ask
> "How is the implementation supposed to track the origin",
> then I would hand wave and say "internal annotations".

No, I asked what I meant. #include doesn't have any semantics. You can
#include "source.c" in the same way. So asking the compiler to make a
difference between source file and the header isn't going to work (Note,
gcc has some notion of system header files and I think a pragma that
changes the behaviour a bit, but we are not talking about such cases,
are we?).

-- 
With best wishes
Dmitry
