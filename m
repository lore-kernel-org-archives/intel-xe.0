Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0109BE6F098
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 14:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BB310E237;
	Tue, 23 Dec 2025 14:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="ApEwevB5";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1462010E12B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 20:26:17 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2a0c09bb78cso31293645ad.0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 12:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1766435177; x=1767039977; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+DxzbqKFHsT4b/4uUhTmGkgX6zZO5THXjLNxNVuEr44=;
 b=ApEwevB5q41iquHu53coO9vs70NWdAAP6ZoW6VgML1InicmQjxVGm8VAKt/B/hfbQN
 SlVGAEymjGVLzMUtwS6eagYSsrAxz+QUyhN9y1A+u3zBWsVl1u8TEOcidc2eqkaQOaaP
 UzcCDVqRFxJ9lHc6cWTh4LhygG6EhmjHwPREdAiZqicW4hBnQEMemHBSruY1MicHYJWu
 qk1xEiIlBpV3QZ+qxrqbQ7K9YlYinpJktNVB065f5bh3Y4PCtQe711IL6BL//fkjhzCv
 ZD/JRxXO2B/hBL53m6vT8+oG+NXulatGbMi9oeuWz5jNoT5g61jG+SruQ++qEsAJZHFt
 DWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766435177; x=1767039977;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+DxzbqKFHsT4b/4uUhTmGkgX6zZO5THXjLNxNVuEr44=;
 b=cuQzM0pOYazUOuyqCnO9cmRj5H1u8nEhgI2KEzkgXCSAssk639gibPPs4ioEFwmwIo
 Wj/0cdRAp/iEuDxwYUkeBYOv3XCXjr0KVhxjY3pPsB02XTX5wQQMRjUrJRcG5O0w/oUz
 kqT9J+RdnABsW9o5RYbOzDa6nxJ0qQC/7quWoymFY0PqwuapaX7Kf52Zyva1ieo9BdzW
 x2rdcBULnKC7BanjvSsqW1/7WakmiK0GJ3VkvvXB3LFfUgIFQiw6K32OyqwutpyYbKqV
 DFGCcF8Qvq9jTGX1Jqf6HlXAVlizzDAl724aQflXZeYaavTEoRloHqIEcoC3MtaxybIT
 cmBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVD5uZCgL25mzZsLXPxxRF500Gq1CjS6pDyVJs1SnQGu6tyc+FJoM9Y/3sjVkbG0360siY7tvFqEw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr8TWpDXsgX2ino7ZpcbrkjsSie9RTVGQIp7I6N1J7pEzIb5Co
 9ABwUb5TJW0NIPpPaGv7VwvTLYbqrnigdkgKxhQtJ46XQoBhqgdFp2UBbY65dF044eA=
X-Gm-Gg: AY/fxX7ANSaf2b7rta/afnyep6ZQWrpoF61ayXg40l8PdUIN5+92p8tKWBPKwEZFko7
 VvhS+HZqZeC2nHh8174t6OMAr/Iu7EusC6zrWgu+cxT1SESALw8tVMX5GdYv9j/DxDpCsD86/go
 SQI6RbiBXnsM8K46IuBwItBUrGJQtf8d2ZHl/I7j5Gy1mZi4IuGzE9DDhhlP7eOknidHwV/oAmk
 L/tuoTSWYchevlfFUHeZ50t9xgggq98APr3vWFimzYkjS15OxsJb5Wtx45BHrdQ2wG24VCrzgDy
 yPOzNlAYAw5RGMRgvev4P3mMakqJjHk2Cuvslfy84IfeyXIxZJbvc2Uhv+8VUZTBmD+/D046Hsf
 bkAxGzKGd80G0IN5Rz/5WDyirzIti5P/eoRJKKWsqzLX7+KBvDPzBeu0ZS4k2iod+8wT5heRRkw
 fkmY6sAWiXABC2bQ==
X-Google-Smtp-Source: AGHT+IEef3h4w4xy+0//cSAXBXPqJ6FpxI5XKGCOhkF8d53cw2jZ45moHevagz8DR3MnmSRpzd0mAw==
X-Received: by 2002:a17:902:d48e:b0:29e:fc06:b8a5 with SMTP id
 d9443c01a7336-2a2cab16368mr168301475ad.18.1766435177388; 
 Mon, 22 Dec 2025 12:26:17 -0800 (PST)
Received: from mozart.vkv.me ([2001:5a8:468b:d007:f7c3:5e3f:f742:635e])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c666d5sm104099455ad.21.2025.12.22.12.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 12:26:17 -0800 (PST)
Date: Mon, 22 Dec 2025 12:26:15 -0800
From: Calvin Owens <calvin@wbinvd.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
Subject: Re: [PATCH] drm/xe: Don't use absolute path in generated header
 comment
Message-ID: <aUmpZzD_5RauueUo@mozart.vkv.me>
References: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
 <aUhQHcgL4U-HgSv6@mozart.vkv.me>
 <40b24664850c231b1a2fd80a084d4a7f32b8148e.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40b24664850c231b1a2fd80a084d4a7f32b8148e.camel@intel.com>
X-Mailman-Approved-At: Tue, 23 Dec 2025 14:57:33 +0000
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

On Monday 12/22 at 16:56 +0000, Vivi, Rodrigo wrote:
> On Sun, 2025-12-21 at 11:53 -0800, Calvin Owens wrote:
> > On Friday 10/31 at 07:48 -0700, Calvin Owens wrote:
> > > Building the XE driver through Yocto throws this QA warning:
> > > 
> > >     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue:
> > > File /usr/src/debug/linux-
> > > stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in
> > > package linux-stable-src contains reference to TMPDIR [buildpaths]
> > >     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue:
> > > File /usr/src/debug/linux-
> > > stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package
> > > linux-stable-src contains reference to TMPDIR [buildpaths]
> > > 
> > > ...because the comment at the top of the generated header contains
> > > the
> > > absolute path to the rules file at build time:
> > > 
> > >     * This file was generated from rules: /home/calvinow/git/meta-
> > > house/build/tmp-house/work-shared/nuc14rvhu7/kernel-
> > > source/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > > 
> > > Fix this minor annoyance by putting the basename of the rules file
> > > in
> > > the generated comment instead of the absolute path, so the
> > > generated
> > > header contents no longer depend on the location of the kernel
> > > source.
> > 
> > Hi all,
> > 
> > This is about as trivial as it gets: it's been a couple months, can I
> > get some eyes on this please?
> > 
> > This is the only place in the entire kernel source where the content
> > of
> > a generated header depends on the absolute path to the kernel tree.
> > It
> > makes kernel source packages non-reproducible.
> 
> Sorry about that and for the delay.
> 
> I just resent the patch for CI:
> https://lore.kernel.org/intel-xe/20251222165441.516102-2-rodrigo.vivi@intel.com/
> 
> We can push after passing it.

No apology necessary, thanks for kicking it for me :)

Calvin

> Thanks,
> Rodrigo.
> 
> > 
> > Thanks
> > Calvin
> > 
> > > Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gen_wa_oob.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > index 247e41c1c48d..e7a50b1348b7 100644
> > > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > @@ -195,7 +195,8 @@ int main(int argc, const char *argv[])
> > >  		}
> > >  	}
> > >  
> > > -	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn,
> > > prefix, prefix);
> > > +	fprintf(args[ARGS_CHEADER].f, HEADER,
> > > xbasename(args[ARGS_INPUT].fn),
> > > +		prefix, prefix);
> > >  
> > >  	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
> > >  		    args[ARGS_CHEADER].f, prefix);
> > > -- 
> > > 2.47.3
> > > 
