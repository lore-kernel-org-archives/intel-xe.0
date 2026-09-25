Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97130C9831E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 01:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D7410E216;
	Fri, 25 Sep 2026 01:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZsbR5AWy";
	dkim-atps=neutral
Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com
 [74.125.224.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE2810E9D1
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 01:06:42 +0000 (UTC)
Received: by mail-yx2-f41.google.com with SMTP id
 00721157ae682-8a860e532bbso3366597b3.1
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 18:06:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790298401; cv=none;
 d=google.com; s=arc-20260327;
 b=dJsFcdbFthK7EqykUcNb8aIutfC20SU8aztTNKjWJ/QsAfb5W/vrtSfY8UrtAeh20d
 +q89V+WXrJ8kHFK0q2tZc1vS2/BgZAcNsIvsMY0YPuMFo1aBI8VyJ0W+68j6/95k5qzM
 8iUXrgRZlTUW+UawS/iBOHSpBuAGu32enhnRou46lco6bQhCxuHYfFySqwxzXTkx7mI+
 UIay8mikW1z6Clh5B0bsjGULrLzhO9VYSid+y1+H3q3H0m1Z+dbs2d45Vh+mXi+ltyQ+
 SydiF+cbsxvd51PRLWSiMQKHhwMFaW9vWnl3+Z8/FWD+dsWKrqvMwYpvrmCE87mQ4QJI
 cP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=0UWWegM3zaySSImGAmVuG25fiwQNAAHUhoXGTbOrN78=;
 fh=/oe6XVzzJWJTH1XBcpaK4Yrtk3Moj7rEq3xAprf0tR0=;
 b=cvQOjeB4zNHtanIhq0Y828Nybr4q226BrGIg73G7SY9Ld3T3fe/u4FK5owCoOSzTVX
 qI3dE2VhMonCq73cAb3qUKcafJ5HKaV++DOxnptNWX+szJdDixy9sZ7LesYd5r5UXwic
 WnWfoHuaN2n4ryajq7JtQeg02jnFpR3l7ualB6GGNAptoAKC35O0kxgB1+Efs43CLQlG
 iG9tzHUDG8ZAhpHsE+Iy6xflj9k7UkrsBWSSZO1WMS5ie/T/T0JO8sPtWBnjUxQVQoxL
 1t4BsQxk37s1Iz7FJoGCmnn+lurJdRnhIV1HyjRsXh/Jel3Xi51Ii387GLt1RazdiYDl
 +T6g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790298401; x=1790903201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=0UWWegM3zaySSImGAmVuG25fiwQNAAHUhoXGTbOrN78=;
 b=ZsbR5AWygCEQGHUEa6qAtQM1Nj+Ihv0dvo5lgZOLp8KqY+v4HQEdyY/dMN1tuYOyf+
 D5EIKU6M6v+SRw9MMPfTmx0HZ6/mx2d0tvs0OYAEasg95DLIRyurVhQnlPV9FaLiJk6i
 OIUK7WH8LKC3tlOrZmET/95gb/FNsEOmSoyTMdvKvX6BsQUY3PrP3svcb8c9aUMtjkEq
 AgbuOeH3+aPnUo7FQbLjMJqQX+ywGBcsA6QJjT6bEodNTjNEGu4s7yN1KNK3+6WYPcBA
 j5af4634hyBgG+4Qf7m5whRT7Fa1t6+vMxz3+K+ZTHaHW7IyN3qSy8SYAsLpxD8XAdC+
 zymQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790298401; x=1790903201;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=0UWWegM3zaySSImGAmVuG25fiwQNAAHUhoXGTbOrN78=;
 b=Qzn4wdhhlAMffjUlICK9EplDZA3cVPQoEnp+IvVDZSTnS7Wz9t68Klmj9j5D9Uu02d
 jKWG2XgMd+lU339DtGVxIXoMDTHDohw82X/6s/nrGI0FmMHg814v3pSrpR11QgiGZ+wb
 +VQJQC4kJfUMu4q3omKvVXAnD/DUn19WlUrUSjpQ7goVhu7DBCxPyi3cnj9XDvqVSJmM
 KtAYx8TCbStHBRQG9keB9XvuyLXI+7QgZZhw1yyrSTZX6vs1SSGwXQbT+w6am3Ru5NDv
 vatE7aciabJ08TXkgVMTOoZvcKNCaGUekYSMKjEfx40MwG+oa9TzSuXr5P6K8O5PICQe
 IuIw==
X-Gm-Message-State: AFuF++mOgh2Yylsfas4y0D7WbR2uxmsThmjWe2E1DkFad8VuEg6y9VaX
 UPXE2hdw7aBjmMwZ0Yi6eA2n3f+bzZEpdHC85J5LZzdDDyBmmyWazhVd2zZiSFN37csaC7ij4UC
 E/IUYmK2QEJruP25vQJ6W5ChLLZJBr88=
X-Gm-Gg: AYBFou1e1pkVzry4hgvu6AfACrLCHETLPSrvFpztKQoZf+RrRcZkyjInukdnVAzjBTe
 jZT7e8NFdJ6FE7DNqs5zHjmdrWSBiFJVyUgUmTvTNioPkXqNY7zu3x3y9XKSSdVUzlCrZA1/wWE
 TtxaMLDjOEKO9Kd13sq7ilhLlvr4r37Rlj4/KxlN3xv+kL86ymjFseC/Uq6UqoHaNfkKp6B/E5+
 inA8dvv/H0o+jD5gCFGBTzLLgPLIU7ANo46Il0gVeoVEAwIBNXdW4LOgkmW8q5TRu8Ap0E+QAPE
 KS5hsv9KSrVFgyhzifahB9VVKVKXpObZT/1OKe2+MLJ9xe6w0YXfhXFR9k7wtOWWjkFFoIqBQda
 VrAFPDwfFEc+I+h9wIgFNMajd+0dLdmeEFgIsGTAOEKc=
X-Received: by 2002:a05:690e:1343:b0:672:99e1:11f4 with SMTP id
 956f58d0204a3-672ed523ab0mr1807170d50.145.1790298401392; Thu, 24 Sep 2026
 18:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260922144634.55130-1-talesam@gmail.com>
 <arWenmbBkCZ4m7I8@gsse-cloud1.jf.intel.com>
In-Reply-To: <arWenmbBkCZ4m7I8@gsse-cloud1.jf.intel.com>
From: =?UTF-8?B?VGFsZXMgQS4gTWVuZG9uw6dh?= <talesam@gmail.com>
Date: Thu, 24 Sep 2026 22:06:30 -0300
X-Gm-Features: AclHuK-r4LLIiBiR1RGrRY3Sys7ZN1PZp4qyLo2evLQzPzAw5UlLUytrsT3CmrE
Message-ID: <CAHBRX4EnQ2W1XxzZjnqZfQS0cG7V4PNB_47s5dHnX6T8N5CiCA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] drm/xe: fix GuC TLB invalidation ack stalls on ARL
 (Wa_22016122933)
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, daniele.ceraolospurio@intel.com, 
 stuart.summers@intel.com, julia.filipchuk@intel.com, 
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 jani.nikula@intel.com, navonjohnlukose@gmail.com, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Thanks Matt, and thanks everyone for the reviews and the testing.

Tales

--=20
Tales A. Mendon=C3=A7a
talesam.org | communitybig.org
