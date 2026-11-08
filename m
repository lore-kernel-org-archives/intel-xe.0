Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BECA606A321
	for <intel-xe@archiver.kernel.org>; Mon,  9 Nov 2026 13:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvSMr85Z
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D198C10F328;
	Mon,  9 Nov 2026 13:57:07 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F0110E0C8
 for <intel-xe@lists.freedesktop.org>; Sun,  8 Nov 2026 04:07:30 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-36dc4797082so17947eec.2
 for <intel-xe@lists.freedesktop.org>; Sat, 07 Nov 2026 20:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794110849; x=1794715649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GRtN9zT+RI+2mfrHlzv7j/45DTS+Jv89S927Nei8sc0=;
 b=BvSMr85ZiFbeV6aeZoNyisTVaFfhqP961QGrTYXpdWervsufytSsPrwnCuRD2XmOi7
 QpbGyrlDWLU3TblY5mvHy/4WLTcDpuD4UbLDd84j/eTMucBvOaWNlcp6HTYS0OP82qmJ
 CC1uQ9/Wg80fWO8jtu8dbxjPhiZjDpXwqm/wgl0jGla79YCtF20mgcle92Pa+AJ1+STE
 T03JQxn3pllE+9tozTqZmG/T37U915A3H52X1nRCBJZ7Jk28ffC/IQkK2UqQndCz81qz
 Q5Z2HYWeJGPbI8OzGtrrYstbVss0XYx7+dkKYIPvLDfxpG2WpKDMZGcD3bGl7fwEm7Vy
 nAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794110849; x=1794715649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GRtN9zT+RI+2mfrHlzv7j/45DTS+Jv89S927Nei8sc0=;
 b=pAhjxcYlFsNmXcXvPBwdbbfYklu4FygOVCms7dCP103+U/CTqNI+nndLbdvUAddiWu
 nQuig2VJ7tMywscWsnw/yOF1gGqm69PkkmVX8bDCzhOm4wtVPMlh/8b+msZjkWhL+h7l
 0NHkr34+IvH6SZINm3HHECev61glQAR0XSnZLwd8VurCM22nnesxTKr1Dy2y9aCdtBXJ
 JHeBYRaOytmC2WK+phqIMybdhEfO3uXNPTvFk0+fLjCxrPE932yEE5q5jC/473vYXYWt
 VlkOyW/IwGRj4pNtMVj1sKjb7Bv/EGadvV2lT5lKG4QzguClHIRylG6/M9LmhctVl2gN
 b0bw==
X-Forwarded-Encrypted: i=1;
 AL+hErE7ej1/O9Nv4ReE6Zcro5t4dc/HV8XZcYiHqfeQjSrAsh9letz+PmPUopOa36lyNhX2HS5ufjf/hA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/TT/MFALVRJwdpNBUlU8UGkgubhC/7DBKTkwi5FlloZwsTFGP1
 XsiqJA7MAYkwAlgmNJmXHzsdHhGY4MEzbkKwldGkGDZj4ZoynXsqFYwu
X-Gm-Gg: AYBFou2/Jw5R2PAEONiOe5FdmXZN2Fz6KMbJzk2JN/uMV0uC1ZCz8WvWjYqHZ7HOwGS
 BqjpUdJT8qnLmlRGaaIpXoYTNgLVoZm6isDk6EGG6uv68Qd0ED7r0Mk3zbzfUNA9tZ51m8I53xm
 Nj3etnTiCFoVoDpC9D7pM2BuRwnqkzs489LJKbRwGaLWsTUMeWUaBNStuyqu6p908EfKBPZHeb4
 qzddzHELvpIKyyj01CyUSzhYzycjy7td+Ku1UBoXoN1fOeJphiroIDUVyz0r3mcXPtxlGaMyQgu
 HHNyZH8KMEKPsGrQBhnqzQqg/xjLmzw+M3pAhqQXiGY7EBT2dG5IjNAk3vrikmA0nJYZgxMAFmJ
 E4cHuAgeswpBzc/jfj3VfFBXXSwyH0h/aB1bbmagfcek3zxZ8su3nNiJu56VjkMdvZO6/mkOruc
 7eDNwOUBef7p5mZDk+vUZMVoRNEjbr77D9QsR05I+99VnycmDD5wqqMgs5VvRGH6nyi7kzIvWoX
 BW1Ps5jzCNd718SNvz5sqo3uMeWrbr9ZknenPxBMeAXiowutW20Lr0XUz3RqTJ+E6TIUCJWliNz
 uYT0tMPfLoE8d+HucSO0MEhmMmuFGp67lxbw8QcJfv6gSotBZhVqMlTej7FLpxHy42HHffc7dE4
 gFAxie74GNm/iiwF1DbsxP/PPFoUfetF3oOztQy8td4unEiA404C2XQS0PDqJdLWxkqg6RMdvbT
 ju5/rG4uJ0yg==
X-Received: by 2002:a05:693c:62cc:b0:36e:66d8:1424 with SMTP id
 5a478bee46e88-3725024039amr2449285eec.0.1794110848938; 
 Sat, 07 Nov 2026 20:07:28 -0800 (PST)
Received: from cachyos-aura ([45.112.151.150])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-37265a16f9csm2291812eec.12.2026.11.07.20.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 20:07:28 -0800 (PST)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?q?Tales=20A=2E=20Mendon=C3=A7a?= <talesam@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 7.3 0001/1257] drm/xe: Implement Wa_22016122933
Date: Sun,  8 Nov 2026 09:37:21 +0530
Message-ID: <20261108040721.203040-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107134939.482764241@linuxfoundation.org>
References: <20261107134939.482764241@linuxfoundation.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Nov 2026 13:57:00 +0000
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On ARL-H at least, this commit adds about 3 s to xe probe and 2.5 s to
every s2idle resume, because the GuC buffers are now mapped UC on the CPU
side. A follow-up maps them WC and keeps the TLB fix. It has Tales's
Reviewed-by and Tested-by and a Fixes: tag for this commit, but is not
merged yet:

https://lore.kernel.org/intel-xe/20261003222145.67240-1-navonjohnlukose@gmail.com/

Whether to take this now or wait for the follow-up is up to you and the
xe maintainers (added to Cc).

Thanks,
Navon
