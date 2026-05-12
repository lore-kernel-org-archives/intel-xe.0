Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50833CD4F24
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 18:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095D610EBCE;
	Tue, 12 May 2026 18:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eFmlmYCA";
	dkim-atps=neutral
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB1810EBCE
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 18:15:38 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2ef2a1cc06dso10858239eec.0
 for <intel-xe@lists.freedesktop.org>; Tue, 12 May 2026 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778609738; x=1779214538; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TqTMATn1TJBwDzhvgfdwIn2iY4blCTuTwL1WgCFtdYE=;
 b=eFmlmYCA0U1BZ8Tm9o4uPEX8BoM1Szt1KfvoRzmmNYdyqMvS8eKUTZ4CjT7GrCDeVY
 3sM7n+TrnDElLGOohEHIFPnEwmoLhJ6ZfSVbuUDgJLpkdXjsVKxGDMO6AywRZv7su+l3
 TAu+tNJu4yMwAZ8/orkcd+TlKBNBH5r2iNSZL/NbyJOXCocFhlitBSC5iZd1SLOLjB6E
 pVaFULq9e7rRpVScXd5ivtj3b6ElFuB29mnS1l8RTVfskiSSPgJ3lN/X6KMaqIqVsrXg
 SctFE6PkQ7Ryx60/Qnk92apPT9DvXJktNauRIu3V0cQJcljH8wrRboRi+z70ThE7TQqr
 MZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778609738; x=1779214538;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TqTMATn1TJBwDzhvgfdwIn2iY4blCTuTwL1WgCFtdYE=;
 b=IGn51j+EyJ0OkDFMH3GM/aQWgy66gZQzqigORg1QZiLA5SQl0K0vU88VAKJYe0aCmx
 J9w0zT9dGKbtQwUtPZN23RMBV9QfroAMCLGUvjA6I+Sm/irjf/AvGb/apr4ZhQBprAf1
 +MJeMcSPk6EPbDNy2WZhdrgUfb270zJzloGapku1sjKhewQMWImtNjfYydzN0YLgPFkQ
 HGVa/cE/CI7SZATf91WmgpQLELb5pzLAgz5dOav+Xzcb3vpZk0pwM77jW41isnTGWJoN
 YShgqEfxtIXK5/VHlvGfgDKF8mY9JMpyRQxfjS2nZ9ROWdtARYC9otwgm7YIgeZWLM/T
 1Ukg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8e85R3DDlieaWayWBG4lebGrOYXPnBGCBzNbAPgJ2cCZFx6/1EdQK4m++VUnnGAQRd11QwPkr0Ow==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk8TdPTnl1kcjLn7nJRCI/qSrimrnCaaT+8dSa2gX71ukT+5oB
 O7MwEQt1XkxkGqWF73H9xILQ+sbBQaAt+ofoqJQ9SV3QmB+KYRk4w3nF
X-Gm-Gg: Acq92OE9/J9etK++Kl5ukfNnzCrAC1KNKasDLa+I4DYoI07v8VISZlMdQ5i7IpRwxyg
 4+PJqqe0JFi1cT/qtr9C1kELl51zu6VE8mAmWYBj7807EZViQUv04G2jcYSGYNj/8iWmjkg0WNg
 QK/r4W5iHdLzBL9YAkbHllZtGeUV20VMBuKbtBUVwZkTxVyt5B9vaGZpWiXSuE4Fbl6hVzdNDj6
 cUZ1iGCRB4ae/Wp1JQPRxsB3pSKCaVgihVbHM0d3BiksNzYNVO7TVk2bX1pSHDyF8yO/1Q5gYmF
 PVMdI+z7T/wKg5ZUivlkTRoSMYwss055oBWl6XrGnlIqTr4iEWbfSuJNfe+AnvAlEh0X0bNn4FT
 Ck2ffEs0heZE+dUP8GnqhN8YVvYGgGEe0y4CKS19UGAyFX8fB+TlOUKL2tNjQgfiNRhowqE61jv
 WF9ujmFlnxOA77g9FNDHTZd6ERh3iYr1WTrFh6diAEr2XdrHXm+JTOOuFVR+DwFZd4
X-Received: by 2002:a05:7301:22a9:b0:2f5:6dfc:cb6d with SMTP id
 5a478bee46e88-301187bab75mr130655eec.11.1778609737694; 
 Tue, 12 May 2026 11:15:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:84ac:d22c:b037:1a93])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2f88847502fsm22940594eec.14.2026.05.12.11.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 11:15:37 -0700 (PDT)
Date: Tue, 12 May 2026 11:15:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>,
 Rae Moar <raemoar63@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 brgl@kernel.org, 
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 
 kunit-dev@googlegroups.com, platform-driver-x86@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 3/7] driver core: platform: provide
 platform_device_add_software_node()
Message-ID: <agNrB3BeIgFlZimz@google.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-3-0035eff63812@oss.qualcomm.com>
 <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>
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

On Tue, May 12, 2026 at 06:31:44PM +0200, Danilo Krummrich wrote:
> On Tue May 12, 2026 at 1:59 PM CEST, Bartosz Golaszewski wrote:
> > +int platform_device_add_software_node(struct platform_device *pdev,
> > +				      const struct software_node *swnode)
> > +{
> > +	return device_add_software_node(&pdev->dev, swnode);
> 
> I think this should be device_create_managed_software_node(), see also [1].

The main issue is that we do not know if the software node is registered
or not when platform device is registered, and are trying to use
heuristic to figure it out and decide if we need to clean it up or not.

You need a new variant of device_add_software_node()
(device_set_software_node ?) that would bump up reference of already
registered software nodes but if node is not registered yet created it
as managed.

Thanks.

-- 
Dmitry
