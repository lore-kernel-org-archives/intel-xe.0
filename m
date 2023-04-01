Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6943AC76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 18:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D770510E0C8;
	Sat,  1 Apr 2023 18:26:35 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA00B10E0C8
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 18:26:29 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id q16so32975645lfe.10
 for <intel-xe@lists.freedesktop.org>; Sat, 01 Apr 2023 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hardline-pl.20210112.gappssmtp.com; s=20210112; t=1680373586;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Cf9ip4XWoUcU+u0A+QKwm6VHq9oGf4FD8dBhUPDpmi4=;
 b=UyfXk8FoP3NGhfD1qWmx63mIOiDgo/tmb0e28qKaxFDuK+hz9OeRSJxVmWdS6IFIZ2
 vCLT4RLgk5ps6ROvVDsYNuxVRY7T+UF7K1zmwL6Hy/qvB7SITxCte9FuHMIb6nX8iC3i
 yN2JJy+GBIx60kXEv9V0Rw9aoHtrGMHZxF+8yLlayc3UmR8BjM4KI8b0OWLepkZK//zP
 T7IFmPC/zITF1r74BAea43nMEKxZTRmwDANpb1tkp7N3BdbSd/+rOGpzRrMU5whphWMH
 sXTvX7h0djy5ImstTNXnpNu8BjIlTKP4k7ikcHLhqXiTL5+UM3JAB78SlnNAf8ghbhJk
 vvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680373586;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cf9ip4XWoUcU+u0A+QKwm6VHq9oGf4FD8dBhUPDpmi4=;
 b=7VKgNEW/b0UEmeF2C45mtmGQCVuhiCdBljCgk+Jk6v2hkQDsnPX00AdM8nKHkHh4hZ
 446jwbwBKTWDJWdJsBC3X/TOpfRuFqBOh7rYH3kIUMARW0SZ1qkdaK57+ymPbsQtipCE
 HOfnEGOay4M1Ryzozabh3xQLKGP/KxVJNLBjjMtJUDJBqa2z2O6dFbBsxL5ED73S5w7e
 YEaTp98YSp+TU1+fDeQpJAnEjweB7oRLVwZk+G6xb0iVknVAO1L0k6kJXxeElJYJjoew
 OKMhl9rwu9BXyK/WL4zUOVhY0FFNxpQKJVIokJrseM7KxAOJtywtDSc1h1ZAw/zOe0UF
 YeCw==
X-Gm-Message-State: AAQBX9ffbqZ9KAQmmNoNo284us5JaTxk6GmSd8Ijsuq2APkHiZrVaHhA
 SNETV3I3fbuJPNUERLBD1voLmQ==
X-Google-Smtp-Source: AKy350a9kkUTHtO8dNKw83OQ05BAtMsFqGZqfgWOW9tEYuBcg6Nk2uJIl5SUWV17ieb/t0uPBHEbEg==
X-Received: by 2002:a19:f51a:0:b0:4bb:9415:38a2 with SMTP id
 j26-20020a19f51a000000b004bb941538a2mr8394188lfb.51.1680373585735; 
 Sat, 01 Apr 2023 11:26:25 -0700 (PDT)
Received: from localhost (83.8.67.91.ipv4.supernova.orange.pl. [83.8.67.91])
 by smtp.gmail.com with ESMTPSA id
 u22-20020ac24c36000000b004a91df49508sm911031lfq.177.2023.04.01.11.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 11:26:25 -0700 (PDT)
Date: Sat, 1 Apr 2023 20:26:24 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <epatz7qx73i3kzxa4fzn7xcizmdiesgqei62ixvjvhi64i5z36@qz6l54vqdsp7>
References: <20230321220527.595462-1-lucas.demarchi@intel.com>
 <20230321220527.595462-2-lucas.demarchi@intel.com>
 <adnojpupaqnivif7aqblxkuiwyiexskk4h3b36bsktbpifoip3@b7xazecr7exv>
 <20230331143337.vtlyhttwwqfv2tad@ldmartin-desk2>
 <20230401085459.ub2rgeiqbi225n42@ldmartin-desk2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230401085459.ub2rgeiqbi225n42@ldmartin-desk2.lan>
Subject: Re: [Intel-xe] [PATCH 1/7] drm/xe: Add basic unit tests for rtp
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
Cc: intel-xe@lists.freedesktop.org, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Apr 01, 2023 at 01:54:59AM -0700, Lucas De Marchi wrote:
> On Fri, Mar 31, 2023 at 08:34:21AM -0600, Lucas De Marchi wrote:
> > On Mon, Mar 27, 2023 at 07:56:01PM +0200, Michał Winiarski wrote:
> > > On Tue, Mar 21, 2023 at 03:05:21PM -0700, Lucas De Marchi wrote:
> > > > +EXPORT_SYMBOL(xe_rtp_process_incompat_types);
> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > > > new file mode 100644
> > > > index 000000000000..4a12aad3f759
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
> > > 
> > > There's no need to have this as a separate file.
> > > We can move the contents of tests/xe_rtp.c into tests/xe_rtp_test.c and
> > > include tests/xe_rtp_test.c directly in xe_rtp.c
> > 
> > this is not how the tests are currently structured.
> > 
> > xe_rtp.c includes tests/xe_rtp.c. The latter can be seen as "an
> > extension of the that file, exporting whatever entrypoint is needed
> > for the real test". They are then part of the xe.ko module.
> > 
> > tests/xe_rtp_test.c is the one in the separate test module, and contains
> > the integration with kunit.
> 
> but it's possible to keep everythin in the separate module and not need
> the include of tests/xe_rtp.c. I did that on v2.
> 
> Lucas De Marchi

From my perspective - the way that the test is implemented carries an
additional information.
1) Test is a separate module:
Means that we're testing the API exported by the module (that's used by
other modules).
2) Test is a file that's a part of a module:
Means that we're testing non-static API used internally by the module.
3) Test is a file that's included at the end of a file:
Means that we're testing static functions.

Forcing everything to be a module doesn't really serve any purpose.
It just makes things harder to follow, as it removes this useful
additional bit of information.

-Michał

> 
> > 
> > For some of the tests, when they don't export the required interface,
> > this unfortunately means writing most of the test inside tests/xe_rtp.c,
> > which ends up bloating xe.ko.  This is not true for all, however. See
> > the xe_wa tests where we don't even have tests/xe_wa.c.
> > 
> > Lucas De Marchi
