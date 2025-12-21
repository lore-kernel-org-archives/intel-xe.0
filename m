Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7568E674B2
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 13:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B4B10E116;
	Mon, 22 Dec 2025 13:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.b="FIhQbnix";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC5010E046
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Dec 2025 19:53:05 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2a0834769f0so32057355ad.2
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Dec 2025 11:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wbinvd.org; s=wbinvd; t=1766346785; x=1766951585; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jEjmW7sBy/OhukW+TepC17drhf54qbJ+YmqntK5sJBo=;
 b=FIhQbnixyfzDFgVhl/qOXG4fWndLgwgHQ3k2LwTKmlTlNBMxeXnegDK8SLPRyiyTGc
 EEXdaFRo2JY+RuSJeOqGVAl/OSS9q2E2LsrbY4Q7xPDsX4wa4Qg4SUGhOiTugTUEwBXE
 0UmvYYYaulzAXNhUtbyGn0srP7yBlym433oVusjp+H7BPOoZQP4DWUJOVZDVbz+oW0LR
 B8U9sWM38cJUlWFGenUidADYHuJp2AY9ePfPdZuX73jZalTkbOOtLW7HjsmQCeGmhifU
 adQ2Hqj3TBwXdYT8Kh1Hyocw7abbn268GUkKT08BBrYfWfpt2xlWGYGLxH6IRBsnU9ve
 Ldkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766346785; x=1766951585;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEjmW7sBy/OhukW+TepC17drhf54qbJ+YmqntK5sJBo=;
 b=UPSbjfbOL3h1XikRY4d/wWY6vq0w6MuDcJzMwg9BbQdYG+iOjg40ArFxkDvoWdT9u5
 h7n476oJ9qb4WK6kBjn9+b/xERbIv8we3D30reVKJpHvGJ1v4k2rlst8wTYq4BJfcej5
 nGAq30dhEXrbaTyzw8EU2gkiHRxY4oQY2UNFZpHdF4h4J1VGpHMfRBtcJAo0Ljgou1qo
 YWOz2yzQ54O6bQHIa+fq82hrXNHz8GkdiDDx1oQ9DuIBzIcNs+i+8ndvcaIzCgsE+dGX
 KpLKXX2bAZze4ngWQJAzMQCezrAY8AhUG6JHZaoIC+vRrG8zYJSzfIaIrZJ61EDJfFw+
 tebw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaLG8erOLFCCalF1nCQw1E/0O8sFgM6NIswFMKUyDP2h25bqlt7isoP/DuUJszTb5IvTgLjcVlbw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJjsg9/Q50X2U+wKDGvarvWYba3dyzizoUZO3/ft3t6wvywY7x
 092fRaomFAeFGVA0bjTaWotWshBKneJVdOuae9JzaYbO7j3ReCWaDhpwlF+a7NpP67o=
X-Gm-Gg: AY/fxX5bkpfMzLc3jRjFCGGZVPuMhc/4f9Qv85mJD2Y+sdQIwcY2GWVsBNLp6nO4Nab
 dzpSqB/ltiAuhM89jQBmv3Z5PKLqAPUMIEs8oWAh8TdzdUR4/L/8yftA0cJPVNnY9vercVPGE2p
 SkaEWvYHmJNPF/APxPeJcNO0S10F5TrJETtgFPDkVcXKnEFkEKlOxWr9a9GpQYdJgYBcvvnleZg
 ktuJ/rEFNBeNNucztZ+ztwflG9ddn07WXorbehfb8CYFuq/kuqw2EQRpz1vF30m5DLSVloUgOK5
 2kmhWMRG4GqQPDRKIC3qXr5/xDJp84kM74F8k2eNeD+5z92p828tmHhGsOF24GjiqNPVITP04tq
 SM8EWx2SxgNR79k+Y3W2HB/Va2J1FU4IKW4HaS2EGbN1C1q0csHDOEUzzG3/dbKSreWhufjHwFu
 47QLSpeX5V07N4Dmlr274hwmoeIcjsxxRkKtwGNkMWjFHLLjtZHK+ApoRlcUSp
X-Google-Smtp-Source: AGHT+IG3LOjpIDH/sz7EDarLNDTzoIzs5U677C/74YpF2B/xSOI5PQdoQPisXzHRvY3GmbzjU8Wf5g==
X-Received: by 2002:a05:701b:230a:b0:11b:9386:8254 with SMTP id
 a92af1059eb24-121722ec414mr10109138c88.41.1766346785115; 
 Sun, 21 Dec 2025 11:53:05 -0800 (PST)
Received: from mozart.vkv.me (syn-076-081-111-208.biz.spectrum.com.
 [76.81.111.208]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1217253bfe2sm26739123c88.10.2025.12.21.11.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Dec 2025 11:53:04 -0800 (PST)
Date: Sun, 21 Dec 2025 11:53:01 -0800
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 thomas.hellstrom@linux.intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Don't use absolute path in generated header
 comment
Message-ID: <aUhQHcgL4U-HgSv6@mozart.vkv.me>
References: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
X-Mailman-Approved-At: Mon, 22 Dec 2025 13:59:40 +0000
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

On Friday 10/31 at 07:48 -0700, Calvin Owens wrote:
> Building the XE driver through Yocto throws this QA warning:
> 
>     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
>     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
> 
> ...because the comment at the top of the generated header contains the
> absolute path to the rules file at build time:
> 
>     * This file was generated from rules: /home/calvinow/git/meta-house/build/tmp-house/work-shared/nuc14rvhu7/kernel-source/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> 
> Fix this minor annoyance by putting the basename of the rules file in
> the generated comment instead of the absolute path, so the generated
> header contents no longer depend on the location of the kernel source.

Hi all,

This is about as trivial as it gets: it's been a couple months, can I
get some eyes on this please?

This is the only place in the entire kernel source where the content of
a generated header depends on the absolute path to the kernel tree. It
makes kernel source packages non-reproducible.

Thanks
Calvin

> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  drivers/gpu/drm/xe/xe_gen_wa_oob.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> index 247e41c1c48d..e7a50b1348b7 100644
> --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> @@ -195,7 +195,8 @@ int main(int argc, const char *argv[])
>  		}
>  	}
>  
> -	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
> +	fprintf(args[ARGS_CHEADER].f, HEADER, xbasename(args[ARGS_INPUT].fn),
> +		prefix, prefix);
>  
>  	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
>  		    args[ARGS_CHEADER].f, prefix);
> -- 
> 2.47.3
> 
