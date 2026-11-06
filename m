Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604CC606A31B
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 05:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fy763ARJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23FAF10E197;
	Fri,  6 Nov 2026 05:08:11 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D181A10E0C4
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 05:08:04 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-5364042eecfso3084361cf.2
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Nov 2026 21:08:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793941684; cv=none;
 d=google.com; s=arc-20260327;
 b=BMSnuP0xbl6ljW7Yv3R/MxWhYYwAsNfm+pL8eMJdYEFfsRsCBhwk8euzjdfrKdOiuJ
 bCiZ23MX6pagZQXnKrVu5rP4D4phFUe1fSw3oOPURhV2Rf/5AYfGubo/5YdSkfntpeXx
 Ya2d1GLZpMEvXphqry2ZPSV0MWe3Y1YcQ3sktATX/ZbnAtOHHgNca93kG3Y59O7ytgcj
 579r9kyw2Gn/sB2VhmfKaJLryiDzwzKJVvkxwVt98p0PGLVkZHpCdHq4DFkjIl5lN4a5
 +wnljutNDVqu9S5x9aA1Ka4HKfTAfPqRuoa9TyV0QQTvxAcRi+S/tLqWb8IQcdSNp12i
 wlbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=huVl+IlIYSdVDEO2gdFrs3mcLTIebTCw/xfvvqFw3UI=;
 fh=RhOnCGrCyWrYX32gH7BgKdSVm+n4BcfIKOEjoHdsNfo=;
 b=tA+W4guHpCUybMWGbK8pRlQ1QkODylsMRqp9N2c2iZNdZLUkkCSAdE+z+g1CumkdTL
 QsBSLaKHzzUjk3nI72MJCmpR8Mv+YE/nvdVLhfmlCNAMyrGvqHli8oLR6oXmWb41tXsK
 JZaqN9W6pHarWz0fTpVvqpd9oKnquVOUq6UxKECNLNlMNsAKdw3R3ZTFfPFCLdkZPuD7
 WAwUngKA/zN+njSY/bYgeCgN96ZWJAkFedmpLPy2PnX4jAX09dsuK3N9+0MGOr6E2bkk
 z4LPfswJ7hfz99va3LsR3e6LH35GNy9LXo7kkgXf16XaZytV7OJPnX/RrrGFAQzvEghE
 xsfg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793941684; x=1794546484; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=huVl+IlIYSdVDEO2gdFrs3mcLTIebTCw/xfvvqFw3UI=;
 b=Fy763ARJpbLOLHMl9HpFCdXWCmexPCeSvdFcvqZYv49dk/4hjpsNCGOrnKeZvLvqQP
 fPxV7GaqVybRb6l/j0Id8nKK1ro2pOr4zl4CDI9FDrvztY58oJHikBgl4ERt2hGF43Bo
 eZ49vv1IbxnzejRS/1ZD8LmUbQpt50N7VUvAF26OP1IQNv/q1NhEPLLbGCJey5Pa590z
 v1MaTiU7QvXOIfPFDNinQBPHy4VtPCHuvqP569O3ZkztQ6R+fb7UWH1+1XCaY25OlSQB
 6Bs4tWQUZ4mZ4kXh9ih4BtDdntIHzj/hTZ/IWNRwZkgYlgCCKLF4buBwYXLaLPDiuZaj
 +Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793941684; x=1794546484;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=huVl+IlIYSdVDEO2gdFrs3mcLTIebTCw/xfvvqFw3UI=;
 b=DPG7R/8sTpYlETOxrLIht3nJU86SaddnjuIc9oA6R5e1ZxUv/JFP/r8opVB100r20q
 gvAhu+b6+l/XUnwy0wOvevO6XsA9B8vj+7cjcGIMaqE823hRL7DHJsBBW1r8rb4fOBLB
 QOF6Q+TOy+NqRk3BsTpq7D7xa/WD/VDTThSlVxpax1bf1jjYgkai+3sqScVweLlmnbUu
 njYAJZFU++xm/cN9+J51Q8tQ5Znh3nvu+VSCcckpG0UsS2Wq3pILEacFVPBMcmMuW01p
 HhJEQ+SuKO0uUcQMvNM4ojorPVXaKMr33tUtbChSZM/9UBsQztKojS12B04hybc8OkcZ
 6F9w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxYl4/wRugvOI3630CXgiLbXgGYpNFGyeXcADdk1Pc1KTFCfO+dnBCzi45JPllEl+sfT8V6AiyamQ==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/ZNEOFhPgnB6NBJ/dYXwS7V/8HRMqDikLPeJyLr6Jr7daJeg7B
 TfsWLFD0Jx4S2h88uJwXCRD7fD5Yj7RtyFQbxzKdA01J4fXJrw6rHvsPZFAh4Z3yQRXPaHXCeIE
 zydGG0dnlyWTYmW/VJWptP2NituoT/cw=
X-Gm-Gg: AYBFou3/j2GCU4sy2TN65vscziEzsPcVur9tWKhFp1OUFcOZIuITidKqnEObQPRQvuA
 HB5jo+d+KDFRNCsBQ/K/hxIjd4sSgDZcoCjFr7/iyc8Cz6z+OGukIfI3r/NsUSHzNXMfHD6xyiE
 Zx5iajHanx2UbHghDy385fcUKi2aWuA6QmVglHb2x5+JcFeXUpf0G+fv0/tIuu6J0i/jIdeGXCT
 cR0Fw2GlaKacBxCFNBM0WBQivqFBxkcLQmcFC4xi167cwMjEK+iUwKO3xUIbSMccC9peo2jjW+I
 7tpkKwJlz0qWlKMdaPSkkRVPTPKa7zMLds0dsLVxsM6HtJ8Lzt6SqZ6IO6oGO5WIKXCBTT4IfTN
 9QgVmJoI6W7bVwMIUZLonJx4z1vn6/krU0+BP8UuiVwKQLTIPzHz5jl3DhQqE3BVUPrgxCuNsOY
 aLa5zs6jVgu5jxSMtZ+YFhsg==
X-Received: by 2002:a05:622a:114b:b0:54d:6b3a:d22f with SMTP id
 d75a77b69052e-54e1309deb9mr23285741cf.22.1793941683728; Thu, 05 Nov 2026
 21:08:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <au06WTroGBQ/Gqbt@gsse-cloud1.jf.intel.com>
 <au09iOI78yeru3BK@gsse-cloud1.jf.intel.com>
In-Reply-To: <au09iOI78yeru3BK@gsse-cloud1.jf.intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Nov 2026 15:07:51 +1000
X-Gm-Features: AclHuK-Tzf2viDf_stMcddnJZaRm6-IN9felbic9bp3B876AGg3rzgiWvizNEeY
Message-ID: <CAPM=9twYRmFoaibBZQA2+-qRe=dTc8z9fC0WjgudM=HD+QzDGQ@mail.gmail.com>
Subject: Re: [PULL] drm-xe-fixes
To: Matthew Brost <matthew.brost@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>
> I'm not sure why patches below bac6deafcd2b are in this PR?
>
> I did have to force-push drm-xe-fixes today, likewise had to force the
> PR generation as patches which were not Xe's complained about a missing
> SoB.
>
> Not sure what is going here. If you need to drop this PR, I can sync
> with my fellow Intel maintainers and try again after rc2. Again apologie.
>

Something is very messed up, you don't have v7.4-rc1 so it seems like
somebody rebased back too far and screwed up the tree history.

Please rebase onto Linus v7.4-rc1 tag

commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4 (tag: v7.4-rc1)

In your tree

commit 8f26dd9c8361a9428cad2ffa40bad672577be6c6
Author: Linus Torvalds <torvalds@linux-foundation.org>
Commit: Matthew Brost <matthew.brost@intel.com>

    Linux 7.4-rc1

Something went wrong in a rebase land, force pushing was probably not
the right answer.

Dave.
