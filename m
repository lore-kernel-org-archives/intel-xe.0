Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0026CCF9E3
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 08:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D2510E4F8;
	Tue, 11 Nov 2025 08:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Nm2HOhJA";
	dkim-atps=neutral
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F7A10E4FE
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 08:08:43 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso2308760a12.3
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 00:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1762848523; x=1763453323;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0w05K6KxFo07worIjxTlWcgaX/lcLwwSdDEeFRVch6g=;
 b=Nm2HOhJABgyYNtOeExcuooKzH7xxpIibBJCSCkvNuFo2+1uSjOgv9AEP1Kd1uFRA/y
 JFdyRBt5SUa7ZczlcUUjBJt8YEjzxgf1spJ/fcf044hHaqqzAIE5919G3puVXofL4Nba
 QSWhumhpIMdWqlToeHV1GWTmsye2y9BGmVIc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762848523; x=1763453323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0w05K6KxFo07worIjxTlWcgaX/lcLwwSdDEeFRVch6g=;
 b=ELXNS2bnEfwtjC1zdmrnoBJH25y1RLuUJXMyuaFi/1Iyv6GbDh2hVxopeGRWS67U5i
 xmqmxW4ZTw2N55zdKmuf6w1Oca61TviqB6djKrNQKiOlX2Q2uiNtpEIdQIbH8rG1EVI5
 w6TfmC1ZqDfzxh6zlgmFVy9odFHRIvO+j/7RszU54kw6u3C/czNaR4pDjX6FgTU+tvEh
 BEzxC3ITWkUBgeoTY49Upw19WcndW37USMTupc3P9m3LJzCGPhpMD0RxnRczcqwGNx7g
 ONgh9exB+HpKo4GzhIu2v8i5YU8egOwAruvuc96WgFLHGPSm5fh9QeS2qc3mtnZmj9IC
 lSLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBpL+Z3FZ2Gy3WQlv4KMgelSSgpcE376NAOhafcCjWLwlSKpZxTI+hCdDbfepoHNbdbilwt/ZLlA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGIoHAOb/cDGu4lkFfimm0loygYG8do6OPGQSKc9QMkqd6yQfZ
 p5l6fSnelufzwhsrGVQxKVw9+SC/gvqHscrzvYQ0esJ3niHs3n1jw/5h1H8zWPywMA==
X-Gm-Gg: ASbGncu3N6zP6PKUkx3ca2mRmR87dK264Zd4GB0/6kQbDWpCG4sA75XmxGnxJCqnt2o
 XwYTgfbWjQp7iic0iU5Z6RRInmeW2xmt38WeFblK9gYdmVEX2VRcdrxj5C4rYDzOS8wmjZelNxW
 E8txF5Y3x4YH/g4m77k6BIB5h5ZltTvb3etaaH3ox4d2NTD6vzTvruK7diqw1F+GQs1DEB12UTo
 N6FEmHFQzCTNi0HSbbQoe3Sv1GZEI8nbmE/eJXIPngA8W379inT4X5r1/bl7NukPwdD9+FyNIWC
 BWjVg6vjskeGGvHvRN7JbWpWw12SsUZ5rAZ9KlF3M9WmLg/GdyMtsF23iNS72geCI+EVmnlsRwp
 UkJ0/eQhLS06TkAdHI0pTZ1mx8kXVVXlxdhNe816TnGkOmsM4A0LzGxYgD+IHg2GPo5oeyk8I1x
 Zbq6gU
X-Google-Smtp-Source: AGHT+IHC6xuDhDXvZKC9hTiDPjxDoSsReKjYtkLbxL1ziXkP+RR6tEjoFAFy33iKv0lQXU9dzXWwTw==
X-Received: by 2002:a17:903:2c06:b0:295:62d:503c with SMTP id
 d9443c01a7336-297e5627aecmr142808835ad.16.1762848523256; 
 Tue, 11 Nov 2025 00:08:43 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:4557:54b2:676a:c304])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651ca4262sm173807695ad.86.2025.11.11.00.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 00:08:42 -0800 (PST)
Date: Tue, 11 Nov 2025 17:08:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Matthew Brost <matthew.brost@intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>, 
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Karan Tilak Kumar <kartilak@cisco.com>,
 Casey Schaufler <casey@schaufler-ca.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai <tiwai@suse.de>,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org,
 linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>, 
 Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>, 
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 12/23] ipmi: Switch to use %ptSp
Message-ID: <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
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

On (25/11/10 19:40), Andy Shevchenko wrote:
[..]
> +	dev_dbg(smi_info->io.dev, "**%s: %ptSp\n", msg, &t);

Strictly speaking, this is not exactly equivalent to %lld.%9.9ld
or %lld.%6.6ld but I don't know if that's of any importance.

