Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC35DCF07B6
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 06:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620A910E879;
	Thu, 10 Oct 2024 06:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LGQ45/Pi";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D16B10E87A
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 06:54:23 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43115b31366so4424355e9.3
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Oct 2024 23:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728543261; x=1729148061; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4m5R0JtPpfaojQZL3OlH+ec0WCCRm/TpTjzYrE2iFl4=;
 b=LGQ45/PiJmVTcPE7ngy5wWGos52rk5vfedWpMiYQ1pvOupWkd8wwJNVxE/D12u5ddR
 UExv3kPwN8RL5IzLlmDQWc7DgT3rasU+4Qu7Fwa6/Xdh6jWXPiQH9uHRcrTF7IPTCmJT
 bpiEIQ7N7jFcj1OCKmrvls9N81XwXKrzHmE1eD0A7LPMHl9WcIb35hYlbkbmxCiD63Vs
 x+n1xEYQJ65wbFY3zrkltoi7m4m5H3oa1mPNmPFxxe3DFeqAgr8eupG9wpaI+To/zCmX
 URTZ5+NWe0O2n2Hw81i+RR0NcKzCWp14MiopWL9Qfk0sqEO5UaGPcSLlfRxPapK8b1tJ
 +Kfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728543261; x=1729148061;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4m5R0JtPpfaojQZL3OlH+ec0WCCRm/TpTjzYrE2iFl4=;
 b=VxAQxA8oGCQ/toZ++ANzTjbaCjEtf69PvzWiK/8FzNjO1/smNx7YGhxFMUNQWYtnC7
 OmtHjXHEyZxX/B5xwYQUfCp00V0zzX3snUCkRi1V9Ah7jlpCukeupChL3R4ZW2AW7iGP
 2QS10mYv+SwKzzV/8r7dEj5lPmECNv2DBszo4GldMH0GJDCPUL2lmkOqjy+1vAKxEfoa
 wiYYuwPkE3VcHs9xvvbeChLHcfDy1gENv4M6SBur9F969VwkheBu2qoMJVARrxOHjzl3
 5iLqXm3VhLqXF5byQXMfX6sjkPHYX0dmKV0RHCcHpTtppjATN3uLaxxeV9k0ro1LH6/N
 1JIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5gPNo24Y/EHiIqN+to5Se6D2rWJTa4KCq6mhtqx9zEHU7N8WDv5zmMlOH0jaxF/3NQ39kTL0BSw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIKjfiR2545wKKdcMk7zyf+dP3HhfU5mCNz2yB8rNw/Xkp6AXL
 EcyZtuJpZSkVExiggHerCc08HDkEfbcTPlUStRAGUW/rT6HwfNMRoHg4RdZPWfI=
X-Google-Smtp-Source: AGHT+IHT9IlJQF0bRhontqJBDQWsf+MVObv5bUTBsaOIzFmxsVdQfGzrmTIzPD0VfNHeePPUMsSx3Q==
X-Received: by 2002:a05:600c:358d:b0:42c:b9c8:2bb0 with SMTP id
 5b1f17b1804b1-430ccf03b0amr37644685e9.4.1728543261409; 
 Wed, 09 Oct 2024 23:54:21 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b9190dfsm640951f8f.116.2024.10.09.23.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 23:54:20 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:54:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, skhan@linuxfoundation.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] drm/xe/guc: Fix dereference before NULL check
Message-ID: <1a5407c4-3b0f-48a1-940a-cc6b3ff3fb12@stanley.mountain>
References: <20241010064636.3970-1-everestkc@everestkc.com.np>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010064636.3970-1-everestkc@everestkc.com.np>
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

On Thu, Oct 10, 2024 at 12:46:34AM -0600, Everest K.C. wrote:
> The pointer list->list is dereferenced before the NULL check.
> Fix this by moving the NULL check outside the for loop, so that
> the check is performed before the dereferencing.
> The list->list pointer cannot be NULL so this has no effect on runtime.
> It's just a correctness issue.
> 
> This issue was reported by Coverity Scan.
> https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600335
> 
> Fixes: a18c696fa5cb ("drm/xe/guc: Fix dereference before Null check")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---

Perfect!  Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

