Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D76ECF34A1
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 13:11:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC16D10E5FC;
	Wed, 19 Nov 2025 13:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="LaPCcjZi";
	dkim-atps=neutral
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F0D10E5FE
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 13:11:19 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-640ca678745so10992573a12.2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 05:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1763557878; x=1764162678; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2hIjgqXWXn3Sbfto+9OWapsp1QwhUBtS+kZIjBq+Tlw=;
 b=LaPCcjZi7EVwyffkNGTptbk31UK2L0vpseElImv0p33uRVtxFANzoySZPLut/lSTnh
 0RwZhx5JuQZ2F9J9GhQz885vlDp2b1MrO66zr0nMiOHxnpNJHWNcDodxEyvLAWom6LW0
 zKDlJ4WyYHm3vDCqipnQrYKPZlUpafMPumOkVd5nCtgRire8Kc3/ELpTUl4jl0GjMcX6
 Y1Goyj7/sr8it5NxXI/4PDrkvUucomknvpoHDoy9jLXP+Jk6lzdjPCuTBKgNr4iZHm6y
 a33VbQz/XgmSqnMpVfABkVlIWkEe2xNXwJrfn4hEbT35BVAunmj6eEoBpsdkULIUeVmX
 1Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763557878; x=1764162678;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hIjgqXWXn3Sbfto+9OWapsp1QwhUBtS+kZIjBq+Tlw=;
 b=RIEcdTme+unfpKH5Xmsw897qirjc9h6BQuo1QBaDQUg2W2kb7aw6aCeYHkHBYS3Txn
 TJACdA/ZpOHwePgAB1SgIl5WrmE+3dyp0CGopnJITEOYldSWtC2OrK08c6BO5X7BbBL7
 N4Cm+asdN5q/RVEZzWKSPT1/OnJ4j3+utrYljCaQsPpRWCmA41I3sIQoR52bm74k5rMS
 iuVgWfwzSiLjmXXPqKgkMtoveYRgfYPqZc63XMKUOLrRE7diTmr1n9zTeKY9LCGsrGLJ
 xzlW2I9cBWTQ8JVPGRFfUVO/tyNNR1tlh9CwsBL7TJ9c/P7Alb50nmA/1GZSWOD5WtWI
 N+kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5KE61FQpZKHPikHvxzETDy2pNaMYl5P0+b0M3fMSqVUCxUPNT3Jame2pNmnpxsD70rvQorqQ4Hg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywxsur7DWJhFkpfLUfZOStsKcOMSVF9JdfYzhfCVCQtWR581MJC
 pbQdmFxYfDOD1SteTuEpkRc5gcwRcrXHWbpSQiVuTXF2j4sV7njSHNALg7wXtDopY3o=
X-Gm-Gg: ASbGnctdaPh7aYGvueXivajSTNZyFxGnzdH9rLsQ5gwX3gwxMWHYyubkhP/1jIGzxvR
 8q1XbXTQB1ypWScyJomIjuCTTfn6d1btCeDBonTxXxc1DRxF4pkXrtkcGu96l7DHok62HoBpbrr
 3d1sTDHcCX9KZjz0/3hXVJu17S9EaNHLYXT6/ckVRMEGGlz2v6y6cbjN9x3069BaYIATwZ9wC+u
 /I06Dfs1dHrH7gJkPpHVz2mI3nfFoJBwbtnr2nTefU7tHYH/g5zcS/EhZuUmz+92MRCNNolnyEy
 DcDFwOU5cYB/QX6uj7AzyeyvbuS/mhOezF1otpWOmuWCGtj88RkbZq2tctwG9zaVvbcTU4ITAUB
 mzfNlRaO+CuaDfJ15JvyvB4tY3VzA1+vQsXuj1sJ3U2zNjJHnBtiDMTmshnPo+M0PmAGHTrtINO
 GhBOWhLjLndC/9GQ==
X-Google-Smtp-Source: AGHT+IHh/9HSY9QxYY7JWRlsHkQE77dEey/TQadLHho4kIFH9l0Cnuj5X98H1aD+vZkw9c2t87Tcgg==
X-Received: by 2002:a17:907:96a7:b0:b6d:50f7:a805 with SMTP id
 a640c23a62f3a-b7367c02586mr2099815666b.59.1763557878059; 
 Wed, 19 Nov 2025 05:11:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d8775sm15093392a12.5.2025.11.19.05.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 05:11:17 -0800 (PST)
Date: Wed, 19 Nov 2025 14:11:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>,
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>,
 Sesidhar Baddela <sebaddel@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 00/21] treewide: Introduce %ptS for struct timespec64
 and convert users
Message-ID: <aR3B8ECx9W6F0BV_@pathway.suse.cz>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
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

On Thu 2025-11-13 15:32:14, Andy Shevchenko wrote:
> Here is the third part of the unification time printing in the kernel.
> This time for struct timespec64. The first patch brings a support
> into printf() implementation (test cases and documentation update
> included) followed by the treewide conversion of the current users.
> 
> Petr, we got like more than a half being Acked, I think if you are okay
> with this, the patches that have been tagged can be applied.
> 
> Note, not everything was compile-tested. Kunit test has been passed, though.

JFYI, the patchset has been committed into printk/linux.git,
branch for-6.19-vsprintf-timespec64.

Note, that I have:

   + fixed the 19th patch as proposed, see
     https://lore.kernel.org/all/aR2XAYWTEgMZu_Mx@pathway.suse.cz/

   + reviewed all patches but I triple checked 7th patch which
     did not have any ack yet. And I added my Reviewed-by tag
     there. ;-)

   + I tried build with allyesconfig. It succeeded. I am not 100%
     sure that it built all modified sources but...

Best Regards,
Petr
