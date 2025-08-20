Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC54CA0EF8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 13:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAF310E379;
	Thu, 21 Aug 2025 13:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JUHZlj7p";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCE910E0A1
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 23:05:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-242d3be5bdfso31525ad.1
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 16:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755731154; x=1756335954;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EvRXBj16l2lFtX1Fgv2CXPi4lSLryaOac8dNXUMfY34=;
 b=JUHZlj7p/pUUu9SipKmSJVWrmvvRUCF2k4IH4c5jattWraqvaOc0m0Fh503UQuHkJe
 E8rAuS8Z7vXL1yfsq0Sqfcliy17od4AM9Xl3GbvYaKN7+/KvO16UJioOFStusgWT+In0
 r6dJf6M4gr4MfX6kXDBQg7TYvNV33IcTViLuAkCqpws6nm8tpz2LYcDC1uqgltpr+HQC
 sXzpaVklYe0likioApv/qG0GpwlGuprL+ad/gEltSNht68slrxNoxUgSEoP65cnDSmJn
 YHDr1zNIxFn7uwvjCke8BVm4PIAGQlQTKEo0u1YvGg10hkQSHYdXzRx02MTCeId0saWP
 FNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755731154; x=1756335954;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EvRXBj16l2lFtX1Fgv2CXPi4lSLryaOac8dNXUMfY34=;
 b=HpEpqelMyerWARy22ArCiW97xQLxMagxWoyBeBzdt5Hw6OTiZpU8DF90ujWqmiUK2Z
 r+ZRabYBej21ZMe6n7+a6GscNTfjGrukwqWyZGeTeVhIZ3YQO6PWWU9YJLa8igAZCgq+
 ywUjzapUit0/V4slN95Qz5pT0YLwHTHjLzpUTDvz2PBm/E4jyfr+ObP56Zzbmw8lpPNH
 egMLseQsqUXq+H/UALHn5DzRlZ+SO+UIJh8j9sNLWg6hd9987M0+o99G1s66mzvJejRl
 0FHVb39h3+DxtuVMEgZJGvg3z9cBkb04AvnUWb32aqBFViZggln3ZTGPZQDm9YcautNw
 g2Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6cC8vry2we7Xxid3lBrySx4rCuAKwFpI8wpejabOM/GNob23pUb+x5SLasg5FKNBj0m8GVciyOQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYcLMY42I7wBjDfUTtcRGtXB+4FVI5Dt1guQbUCfTYf6GXMwMu
 aXV+LuWGfi5NFQ7lIg+klN/s4m4pimXJAXwmzPzNxPX9GMppBYiXgEBW8AIF0oIfNg==
X-Gm-Gg: ASbGncs17DYc3kjP1pQqkSu2wogvRom53YguVETphO6rHXSag6Vr/qONU64hMJRaWdR
 r60de+d1emc9L738kj2gK/NjQDMchJJkpkqEE7s/zDMrfU+h//EA9+AL0u7pSN0QHrh7zRdf3vs
 pjyNkMoRZoL2hJTJjSTkVLNhGMRRt71sZ0rldyhAae5QiuDAOAv83mkLdaDRQipUsWa6jZUntnN
 boUnBObwKIF7MA0Tuhg0j8BO6BksDuZlzijoGW5Tp206ooLFTn2KueT13Ue+r/RLWKbi9mjLpAT
 0p+ZE6v7XDkFk5nF5/+Fx8Mb1Sx/JUTOT8faE24+AIhWfsuxayjUbH9hFyLOyjPCY0uVEicaO0i
 w0cYOJTXKStlANG9tbHfnX5keZQFeFGT7Vx0xy09ObnTrKBLg2HKRCkFdRr89VKDWlr9xNSRefw
 Da7F9tWqc=
X-Google-Smtp-Source: AGHT+IFvkzWLi+5u8K5l7RVeBnffe0urg17dz2IANRHLwSGsPtlIsg6h/lQqrYlNKOX+8CuI2OtkaQ==
X-Received: by 2002:a17:903:1a08:b0:240:2939:361c with SMTP id
 d9443c01a7336-245ff98e26fmr752685ad.4.1755731153531; 
 Wed, 20 Aug 2025 16:05:53 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4cc26dsm36830535ad.75.2025.08.20.16.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 16:05:52 -0700 (PDT)
Date: Wed, 20 Aug 2025 23:05:47 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matt Atwood <matthew.s.atwood@intel.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org,
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: replace basename() with portable strrchr()
Message-ID: <aKZUy_XZxHKLQUAS@google.com>
References: <20250820201612.2549797-1-cmllamas@google.com>
 <peqczm4644mskitmvsq5b2t4r4rs3beei7li3p7uw2nhjne6h6@a3mztccaxfey>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <peqczm4644mskitmvsq5b2t4r4rs3beei7li3p7uw2nhjne6h6@a3mztccaxfey>
X-Mailman-Approved-At: Thu, 21 Aug 2025 13:06:33 +0000
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

On Wed, Aug 20, 2025 at 04:15:47PM -0500, Lucas De Marchi wrote:
> On Wed, Aug 20, 2025 at 08:16:11PM +0000, Carlos Llamas wrote:
> > Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
> > introduced a call to basename(). The GNU version of this function is not
> > portable and fails to build with alternative libc implementations like
> > musl or bionic. This causes the following build error:
> > 
> >  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to ‘const char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
> >    130 |         fn = basename(fn);
> >        |            ^
> > 
> > While a POSIX version of basename() could be used, it would require a
> > separate header plus the behavior differs from GNU version in that it
> > might modify its argument. Not great.
> > 
> > Instead replace basename() with a strrchr() based implementation which
> > provides the same functionality and avoid portability issues.
> > 
> > Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
> > Signed-off-by: Carlos Llamas <cmllamas@google.com>
> > ---
> > drivers/gpu/drm/xe/xe_gen_wa_oob.c | 4 +++-
> > 1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > index 6581cb0f0e59..0a94a045bcea 100644
> > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > @@ -125,9 +125,11 @@ static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
> > 
> > static int fn_to_prefix(const char *fn, char *prefix, size_t size)
> > {
> > +	const char *base;
> > 	size_t len;
> > 
> > -	fn = basename(fn);
> > +	base = strrchr(fn, '/');
> > +	fn = base ? base + 1 : fn;
> 
> I think just a xbasename() helper like we've added in kmod would be
> preferred:
> https://github.com/kmod-project/kmod/commit/11eb9bc67c319900ab00523997323a97d2d08ad2
> 
> Alternativelly add it somewhere that can be shared across the userspace
> tools in the kernel tree to fix the mess that we have here:
> 
> 	git grep basename -- tools/**.c
> 

This sounds like a nice idea. However, there is no "centralized" shared
includes/ across the userspace tools that I'm aware of?

> Some dup the arg simply to be able to use the libgen.h version, some use
> one or the other on purpose, etc etc.
> 

Yeah, and I can force the POSIX version if you prefer. I just personally
think the strrchr() alternative ends up being simpler.

--
Carlos Llamas
