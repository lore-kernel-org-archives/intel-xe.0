Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F80CED249
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 13:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1C210E3BD;
	Mon, 17 Nov 2025 13:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QXt6OgYv";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F08D10EA84
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 14:35:12 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42b32900c8bso1227887f8f.0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 06:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763130911; x=1763735711; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dWXLhPsJovH76m+UWdSFM19WXCf+smwi4mOSlHBAWM0=;
 b=QXt6OgYvB0GrccRY4O/EVcLjkMbn+DlDWyNkAUdiOnNwqvKk92sOwFWTezHXn58Q9S
 mw1siUfJL0+hkSKLuRo3si3NdEbU14tElEK/Y4WAxVUwSsHAt0dpNxiQLhr71+eh8Wgs
 7Epk38xAJNLQwkeGlqvJZs+ZfPC3TTfugHMmiSeJAzD9S5CPadte7p/kZ3E1QjHhjjd1
 X6RQiGLmC+HFNJnemHOkeOkpaIZ3Umoj91TEf1AQgq1uernXrN9JmTuWSEOVWSMGMSop
 fVU9elwaWX7QI5HDzGTVOFQuajEfhrZyZ9MGcuYRAJG1bi1bwrLc1Vt+5+r02/7urLQl
 V8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130911; x=1763735711;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dWXLhPsJovH76m+UWdSFM19WXCf+smwi4mOSlHBAWM0=;
 b=AlfdOroYVmXsZuOq77h/e0vlnfPUh0AJSxgK3DMoiComC0FfPfDwEJqV79dnfL2e+7
 yLxP2fqyMtqEAKqBIEXZNh4jaWWluNlRK4+nGr4VhnEvicfC1BAbiZKJLWiUjVxndaib
 szAS7c2y7D4/EEbGRJcyYbw2Jjqg1uSTFTeiV1mGn/t5wMSzkjXI+IqlWyVB4Ai3L2it
 vRVm5rV8IZF6Ht5b22im6EVXvHi9KHHibNMypHkAbrN7snXQUKEUZcs0lIhJQnEpFnHu
 06UIFkcHHhZhGbQC1MxbX2ZNLjGH+XVka6rNB+mGwRGca0KjpAjO0gm/p7b1IfdwM71g
 DQfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0JrbG0Yho+adghEh/uMZZwEjRzK8d8jVBZ45ThRBXG/Pl7ryaFUo6XxSL9ydB7EBO/fV7j3oBFw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw33vq4BGrJ+iKF5pP/r2AI28TS0xCc3mwwCwlcEABpt0ujq6Kh
 yRawcf8+d1jkWtvGEYIdqGoUlDTdqUTzT7y+f6N17xn/VbS6Z7xTwG83XGbW3t0tqA8=
X-Gm-Gg: ASbGnctfAFgrXkqHRTiFCkUVEctyfu7Lor8YTM+I2DeAEq0JvboHGklFzowxxFEqM9J
 BtwiSsk3m/nxmRhCu50CcQJc9ZjBOYFFN3YN8L7x/48+vHf/M/zavI5E0XfpxVmEco55bCCf5VT
 yt38TRsDviz3nIdvH0Vo/tEzZ5zPKw/OXEQRBjs0xEm116fMDnm3/xh7B8NJbQ52IokBsIwTGZq
 F/Gij+7zi7rqcyLxOkAy1iIu7ulIpU6UbMz4PD5K78uQhaUxnwr4INvxqMXinInsa3+ndA+RDcd
 YN/nCBcew1sfascslXj7NNHPvFqkjrg+LKuW+4l0dGAQFnazX6yezZSknui1QiV18ytma4HDmc+
 g9V8RB6iE+b8y6iWfhzPyePqh0HpnTnYCb/f7pVTZbV+GWUfi8LdhEBJrUxe9DA50tQwhZ8hJ8W
 rr
X-Google-Smtp-Source: AGHT+IHw5DY+d3JMXj0ehkwCi00kh1fcOQgwNxL358oZwa3xTlItactqY9kSp562T/u4HnhssT9g/A==
X-Received: by 2002:a05:6000:230b:b0:42b:40b5:e681 with SMTP id
 ffacd0b85a97d-42b593450f3mr3355692f8f.26.1763130910639; 
 Fri, 14 Nov 2025 06:35:10 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b8a0sm10330771f8f.25.2025.11.14.06.35.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:35:09 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CCE895F820;
 Fri, 14 Nov 2025 14:35:08 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>,  Lucas De Marchi
 <lucas.demarchi@intel.com>,  Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org,  Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>,  dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,  Jani
 Nikula <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  linux-pci@vger.kernel.org,  Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Simona Vetter <simona@ffwll.ch>,  Tvrtko
 Ursulin <tursulin@ursulin.net>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/11] PCI: Change pci_dev variable from 'bridge' to
 'dev'
In-Reply-To: <20251113162628.5946-4-ilpo.jarvinen@linux.intel.com> ("Ilpo
 =?utf-8?Q?J=C3=A4rvinen=22's?= message of "Thu, 13 Nov 2025 18:26:20
 +0200")
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <20251113162628.5946-4-ilpo.jarvinen@linux.intel.com>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Fri, 14 Nov 2025 14:35:08 +0000
Message-ID: <87346gptr7.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 Nov 2025 13:22:47 +0000
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

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:

> Upcoming fix to BAR resize will store also device BAR resource in the
> saved list. Change the pci_dev variable in the loop from 'bridge' to
> 'dev' as the former would be misleading with non-bridges in the list.
>
> This is in a separate change to reduce churn in the upcoming BAR resize
> fix.
>
> While it appears that the logic in the loop doing pci_setup_bridge() is
> altered as 'bridge' variable is no longer updated, a bridge should
> never appear more than once in the saved list so the if check can only
> match to the first entry. As such, the code with two distinct pci_dev
> variables better represents the intention of the check compared with the
> old code where bridge variable was reused for a different purpose.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
