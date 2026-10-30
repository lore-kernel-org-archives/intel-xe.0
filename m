Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC772606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8/XYg2x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6544112828;
	Fri, 30 Oct 2026 13:54:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D991510E83A
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 13:54:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso8410995e9.1
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793368461; x=1793973261; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
 b=y8/XYg2xUsFzZJeiIUK2kOuxCuovRezJyDy5MRQqV+ZO1CSFf/le4ISeYndJXeTeDX
 sH8sF6o7ka4bP31pvuGOnb7Dmu2o+NdiAt6+t2/MUo7ibyEdTwzQ4xavF+0OO0u1LT2u
 Gcv7LT2+CnBGLN+T4Uq0zYb6aJC9J4ujndfNqxi20Aww4CHgXDh9hNw62TMik6XBOltd
 efVix6+iH5tvM+LylC6l+1++SeDszfQAU/UTioipzrqpV7ubxsO5hUqo+eq0+TbP4L6G
 U475JaNiomIEjwLaV/ZpRihoPqgyok1z6fm3T4ubJjrxyDLiRW2lClk6nwp1S0W7a86p
 ZjoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793368461; x=1793973261;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
 b=kb3JCVIMWHGZy6k7tWLo4S4TQpA4qPdMUai++CQxrqlSbXGb57MtyMgFqH6dUbE53T
 CrZGJokVAM899Uo3xRLwh+ZcK6d2q8bIdHzNqCdw8GbM7nPjUdYEQ8qgjfkp4g/a3Et5
 P+xm84l1k+XGnz3O/GAoQPMMgnUAGxWMCIfLTy8D9FZOiBmB3SloeFy7nE9LPscfDlGA
 Ai+ZOKshQj+6ounGVDSRmZ5eiRZ6jswBKIPb8/2VGXHCmXDAbGP6sHK+yESUl/hu40YS
 ViEb52nBd+84W6qJ0cqeM4xehGwIivQPInNLAIAppJScpPSwE1qBRvR9DDaUUa/51ZXi
 DcQA==
X-Forwarded-Encrypted: i=1;
 AKwUvByYAgv5T0dfxGLpdS++rFSLSP8ae1JpXhyz7K37M6SMm8xEYIYHLeFmQmwidqevc0bnGZxDUb3TyQ==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLKl1GCx6tXralMCk8xg2TN2JjzI9YNkOURVxQPW0EoYdOHs1sp
 HfoQwGOWhdBTfM2sfV0r3mnT3leeA8u78ksMoSw0+G6oeVYBRINAPBf1
X-Gm-Gg: AYBFou1hcaiH/GVM/r3X4SYuyl5eth64CbCSoeQNGiQ26FH9eb9JooDA514tEUWAHJd
 emCfTp08kmVL6rM3DF4F/a8DbVzVuwjvRcHxZUbXAZqlPLYdpsuJH+de6crcjo10j10bIAYA8kV
 PtOf7RhQvNirSLsdtfYV+bBVor8gfRrMoTNtoPGXqQfV345vMqGxVr8o0vJv3+euGTGzTrJcTw+
 b8TRIjoNeKUGMNef7nZQh8e+ibh+CptzRisqP6tdyyTJM4FCI9gnfoQdXzMg94TQLPiefrKqH2O
 1lDk91gGX032U7RuGV8t2qYAKAS1cX1wLyjtoHLflN6yu3Ce4hz+yfl6YTfo7/M5AsT/3vHoieK
 ZB5c6ajPEPdt0f2yMGrOwFeAywAivoPXn64QWSfmFZRE/S3ChMk7mccd9b1N0u/zx5ZC6gQILMb
 kdrpSPLiVGAcO9SsxLnFAHKrfj2Uk27dbpLF/WoA+DgxpS1rNygKgPDSAc0vQili5AwqgJFc5Ml
 g0RsWR8obNpgZ3ErF1SFw8Xmi+iDj7H7QaxvIItpeOAkMQij8uk4EdhLDZqlki1JHu29GPY4ADj
 Qhh47bfbpsNQ6Gvkh7Bl9Ld8+w0Wv7XxWZpAGkAlmoPpZNpelBLqmR/gjspwXNQByPMyZ3n4VO4
 KrL0OYZ7sttLdl5pgHg1w/1aWifk3MthMjLiMPZ6+CDG12wtYlnXLGbs+uRQgvq/ZL0Q=
X-Received: by 2002:a05:600c:608c:b0:4a1:6c0c:ab93 with SMTP id
 5b1f17b1804b1-4ac190497bamr46672575e9.28.1793368460933; 
 Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac0950d533sm34613455e9.3.2026.10.30.06.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:54:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com,
 Frank Li <Frank.Li@nxp.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Guan-Yu Lin <guanyulin@google.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, netdev@vger.kernel.org,
 imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auShiOI6Hmla6XxR@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
 <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:46:07AM -0500, Alex Elder wrote:
> On 10/30/26 3:57 AM, Sakari Ailus wrote:
> > Hi Frank,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > When CONFIG_PM is not enabled, all devices runtime PM state should be
> > > treated as active.
> > > 
> > > __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> > > pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> > > stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> > > should return the same value as the stub pm_runtime_get(), which is 1.
> > 
> > Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> > otherwise the same, except that it requires also the use count to be
> > non-zero.
> I think "yes."
> 
> I think the logic for !CONFIG_PM should basically pretend runtime
> PM is enabled for all devices, and they're all ACTIVE and effectively
> in use.
> 
> That implies:
> - disable_depth == 0, so usage accounting would (if enabled) be done
> - runtime_status == RPM_ACTIVE (power is on, no delay)
> - usage_count > 0
> - runtime_error == 0
> - Maybe ignore_children is false?
> 
> This might not be complete (and could be wrong!).
> 

We could add this kind of information as a comment somewhere?

regards,
dan carpenter

