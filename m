Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B85606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=PvCcriax
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D428310E131;
	Tue, 20 Oct 2026 12:53:37 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B248010E524
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 12:26:12 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-53634b8328eso23253831cf.0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 05:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1792499172;
 x=1793103972; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YVgIUoqL9XbQ9jhWO6BKDxkXvvi2AxiprGJLNOZ4iOE=;
 b=PvCcriaxOSRydvR09CxP6VMLj7C4RR25kgfjmPntCt7Z8+jepA6pWa2xrOklBET2BV
 +6d1PP/T3VjuEjSLVjghpKUsggUh+EwIHTCDr15e4wo1JkmpToe9x1OZViOIN7nrW8aX
 yNIAYZ2uEdV2NeZbEKmrKZUaGI1YSfdxPd69ohHjX/HcgKbAcT3bPWoqKPLqTS4NsIKB
 iZf34AUhlzus6Og2MPbOjTB40n0s8K5+EYj8qdlu443cGLpvMHOlrQO1taE/eZGUVOwK
 bSzweYS2WRwRTU4BxXla3KDFGdG2hPk6ja/vGVWkJn9rbcURbiFMZqO66LqY6xSuaSGw
 Sl+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792499172; x=1793103972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YVgIUoqL9XbQ9jhWO6BKDxkXvvi2AxiprGJLNOZ4iOE=;
 b=hlqpDHEUptNqXgYK+/U1n/kIzDZElSIOpswi7rczGSuy+uscqV29y21tqQmToGMCCS
 Fx1U13rJTkkoGir4i/6n0G9ajAKlOAZXQH3fPaNGWhz91WG35RswMWLSxnuIs3dzSvqk
 sVNf5pM8s/TAH1z2mgMW38S+zJSVSN73tQv4nTI0L4g1rsVDiraLVb1lugpdnKCQPcwT
 JY108whHAJz52djezqTQnof9heVhnaBBBYnzsOhDX2CqNXWgK4I+0WgKbWQloE3EK9qN
 BO5FT+3FccuZnfUS1strYnQR6ZPSBlO+Tyr4NjtEwMrA2DcY6zVQF54HyTLkkCxUZ5y6
 VZyw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx57sLQD+/RCjyMcNXTtyVdQD5wfOZa1U/achqRw9RX2jt8DvjSrx7oz/9ue2IsVZQOJaXwT/E0UQ==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJ0YG8YxYyuhsTAWcSrJpk3n9B1EarLDIwSAWjd8O5bbrqBrEll
 lUq92AcHwo0lW9Qn1+2stgJESsN7+m+i9H49cMl/JzJitgUL8R+xanyB+X7WZ+EnmSE=
X-Gm-Gg: AYBFou0IPNWwrjERy7CsYSSLLYf9xwKV1dEAEw7u05HWvHUxt3JYD0sBRr+i7QXtAqh
 nALT2niFJzePJanIrtgezopThYHU9KtUxbX7YUvJ7k0q9RC1O4/zv4XmynGzF8hPxQeiANHwrgY
 1ZWkICcy2fxFWoZ5hBqhdb4+594SEIJ2yUbKPrj06dZWJTUHQA0DdIcl4iVdE5b3fffoWhbA1BJ
 n3mFshWxD/4L23I2MvQs+ccET8X+Cv9joJOFANdyCmGLiJ+80qk1RgaMHAyQDH+yJuwekIm+wFl
 STFQyRQMS9I1F2vWO5nPTt2aLtCeLKCfGBBTgI2XHfVt1Av51bXdgThiPLXlBz+HiIfIYzH7LQL
 pZI70yqlTED6GS4RzRQvmyGpJzGUqkUN+ydY6PIAPxYYZpGyXInhTM7FO0yf3NgsHWkU55HzDYK
 emYW0Tz2H6kFpRPhDKKJkObkQMhfFBpscOiq1FDbaGbugFVg1+QObVVbn0GZCjo5eRGRyGqUG0q
 YQwKeaNWCG7bwP9+ZMyL9UPgWiu3BZRnfpbwvIbPwK51DTzzNdQVLmDhPK5Z7R6wzCq2vP1ShFG
 GsMYCTSWh/4tjQkGe0z8HAAt9r+lTSWgsGe0mkr0r2oV+cUT01gWp+ZZjDxNQt84WhwiHFUjXx1
 1daofmFNSNjnwKoKhd9ucaiFFw/erIi2r
X-Received: by 2002:a05:622a:50f:b0:530:fbd1:6094 with SMTP id
 d75a77b69052e-53646097a4amr164462231cf.53.1792499171659; 
 Tue, 20 Oct 2026 05:26:11 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5362a98e071sm123258551cf.16.2026.10.20.05.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 05:26:10 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/psr: ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR not
 valid for eDP
Date: Tue, 20 Oct 2026 08:26:07 -0400
Message-ID: <20261020122607.925427-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007083443.647649-1-jouni.hogander@intel.com>
References: <20261007083443.647649-1-jouni.hogander@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:16 +0000
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jouni,

Sorry, my last mails made that unclear. Your patch alone does fix it:
with the AS SDP kept on in PR Active, Panel Replay is smooth here,
including after screen off/on. My Tested-by stands.

The RFC was only about power: with the AS SDP always on in PR Active
I see no DC5 entries on a static screen. Fair enough that it is not
understood, so please drop it. If I can show a real battery cost I
will come back with numbers.

Could your patch go in as is?

Jake
