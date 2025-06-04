Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0614CC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 17:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CED110E0D7;
	Wed,  4 Jun 2025 17:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GVYjfYr3";
	dkim-atps=neutral
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E3710E0D7
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 17:30:46 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ad8a6c202ffso18326466b.3
 for <intel-xe@lists.freedesktop.org>; Wed, 04 Jun 2025 10:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749058245; x=1749663045; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VTP8yObExwFLrSuZsJ8d0cIpVtNnBIjCqJ6qq7uMBQI=;
 b=GVYjfYr327pL/cVqf0dz6tcTZ2DrM0f19nzHGXrvo1q/32zjv61u7iEHt2o0nB3sSt
 cFWlTdNEKvHpQ+RlTacroMJiy8eLlVeqeD7498KKDEp98kFrjFaa8ZgwRbzCqf95kFwK
 3LPSPbBlzvqus6homUc6/YOy8BdqGtRm2UaOOx9fXaBLNR7OnJpi7Zn46OctrwgBFhEq
 RiTvmH/lWOjkSJtxdt0i5y0wYVOiXdCn/w8Rf7S2AWA4KgaYAQTDKOkbSQmgH8NcJPEg
 IPyJuwwwNtKa4WYGVQD7bjSFuLZmKZ85qKAfMC+38yHyMQd5DlIkOqC0S4ydgI0BNqxN
 LzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749058245; x=1749663045;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTP8yObExwFLrSuZsJ8d0cIpVtNnBIjCqJ6qq7uMBQI=;
 b=vmG3/BxIsn0umNnyBL/RqggYAI8OoZmkLkeFl5eNIvDYRZYUFJ9kuoveZ4mRVbfEdc
 M2fuXvpbuRTOo+HMZcfx9Lu/ViuaJkLasQA7isHwGWX3vD173IarYi6t4ZiBF+Ow1pom
 69Kv06mnCC8SFafpdqwTAjXVo10GCOPaHH234XjMq5rwtJgxt6pwdTGQOY2LS46s4VmS
 yUYuxSsKJ/u5/3/SP82L/RAncaT5EA9l9EUowQgFE+BcRak1Cz7gfDxHI37AzRcySj8o
 YnfJ+1nMOPMB5B73dL3y49LfSWUfflyXpieVxVDhdQuQOgvh4PcQ5QfEYuSDjykRCHoA
 Hvrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjTOK8DFg3bpbB9NqcunrnnfRR2IJuEeed6CUfjCJCRiMVqKQuTFkOSCc4+bjQ1dG1dEhj+aLYaQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx+4halOfhTfWYqlfXkl5Xp+yarQcfDu20s9RPJjIH+EpZmzq/
 D8FBLSkcqqPTBKRuz7erVGa7PCRq3YCDPS52ED57UVsuuSW+eN/OBpaak3srayWTNeo=
X-Gm-Gg: ASbGncsANdxEHboCvVvWBuA80k+Tc76NclPDo+YHFg48Vin5ziHA55FqphoTg3tiBB0
 NnYQR8KWU9/o7EV1hyf9M9OXlaYhMEjqvzfYv+CVThRMhmNWvKY82qz1EC44QO3tzBeXiEM0zNn
 R3o3ROQbd6Cls1/wtlxZBN9AqATnWAWXK9Yrzmn2CjOINrsa+HWSGX5KEJ0eu5QAs5miMJzXhiW
 dl8fUkWaO4w/FvzgjOjJ6Ak2O7YfH2naSXRsjFeIqSUouD5U5JNuUAt0+EByrnz71Z0xii7f/Vh
 o325HaSuVoJZ8WyJWajHcrTsMV26ewRWVvGpkvMmGqCGDPxYG0mQM6Y=
X-Google-Smtp-Source: AGHT+IHMbpNobcGhf8u1NkCYsfc6cgq22A6GsdCftAQGwTdTJIr3/4zn42Qxn/bHns6QSssKDLwTKQ==
X-Received: by 2002:a17:907:6d0d:b0:ad1:fa48:da0a with SMTP id
 a640c23a62f3a-addf8ea6c55mr326456166b.35.1749058245497; 
 Wed, 04 Jun 2025 10:30:45 -0700 (PDT)
Received: from localhost ([41.210.155.222])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ada6ad3a6b6sm1144489066b.142.2025.06.04.10.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 10:30:45 -0700 (PDT)
Date: Wed, 4 Jun 2025 20:30:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [bug report] drm/xe/svm: Implement prefetch support for SVM ranges
Message-ID: <aECCvh--XuQYFdAU@stanley.mountain>
References: <aDSDfusiM8QGQwFS@stanley.mountain>
 <0183ca8d-4347-48d9-a783-361c6543db14@intel.com>
 <20250603222952.GD407166@ziepe.ca>
 <aEBeM1sWuSNWNij6@phenom.ffwll.local>
 <20250604145657.GB17991@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604145657.GB17991@ziepe.ca>
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

On Wed, Jun 04, 2025 at 11:56:57AM -0300, Jason Gunthorpe wrote:
> 
> A WARN_ON would be reasonable

Or we could add a WARN_ON().  That's also fine.

regards,
dan carpenter
