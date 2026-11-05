Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B7606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUxOmdGN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BC610E95F;
	Thu,  5 Nov 2026 18:39:40 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC9E10E95F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 18:39:34 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 1438940647;
 Thu,  5 Nov 2026 18:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46BC11F0093A;
 Thu,  5 Nov 2026 18:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1793903974;
 bh=/vmTha+/NBgXWyoBJFSSnlMTejShcEZUjZERBZZ4wT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DUxOmdGNLBHj39kAt6sRM53ZreT22ldFtpEVpMELymJfS8swfeNkFX1+UOQy7h4Zx
 8079mWR2/+a/w6mQINhHyNywPQmKsEM+wmiWwCaTdkrfHJ65Fbbcyo65U82ai/FxQL
 oN6u2MAq7GQZlI9/t/tC/qUk6jvavu3lpCZdG7NFycbKgkE1y4CNKCV/Nz0Nwee/YC
 KqcrfipOSvjwz6saAleM9+BJO6TTO6BuLXIjKHH99DWTrC+pdG5Ha6/M9tduT4R0Uk
 qRt2Rhq03Jr3PFzjEHNmS38uy4xKQnV+S9lSNUoqgsXSQ0HSQeRnXpsiQCZTBuNV52
 yYlll3q6YOghw==
From: Sasha Levin <sashal@kernel.org>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
 =?utf-8?q?Tales_A=2E_Mendon=C3=A7a?= <talesam@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Kjell Arne Rekaa <kjell.arne.rekaa@sparebank1.no>
Subject: Re: [stable request] drm/xe: Implement Wa_22016122933 (d5b0bf3f37f1)
 for 7.2.y and 7.3.y
Date: Thu,  5 Nov 2026 13:39:16 -0500
Message-ID: <2026-11-05-1-daily-reply-0011-xe-wa-22016122933@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <OLAP279MB00864A857672EED0E6BF554997772@OLAP279MB0086.NORP279.PROD.OUTLOOK.COM>
References: None<OLAP279MB00864A857672EED0E6BF554997772@OLAP279MB0086.NORP279.PROD.OUTLOOK.COM>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> please consider backporting the following upstream commit to the 7.2.y and 7.3.y stable trees:
>
> d5b0bf3f37f1 ("drm/xe: Implement Wa_22016122933")

Queued for 7.3, thanks. 7.2.y is no longer an active stable tree.

-- 
Thanks,
Sasha
