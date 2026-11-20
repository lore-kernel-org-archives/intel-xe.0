Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEA2606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=U/ofSVul
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE28610EF2A;
	Mon, 23 Nov 2026 15:18:10 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E71D10E074
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 16:34:20 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-55d360ca878so9351151cf.2
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 08:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795192459; x=1795797259;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D0Jp0cSCJcyhhcCdpXe0VkRCpAsJ4OZndwM93HMMgIU=;
 b=U/ofSVulv5Q2AVt92x+jtMF68YgQFxSudJOOUwXAOdv/VlmbhMAUZPXpdf7g9giIxR
 oCHiEYvjB4HOUVljuQXdMdFea7ohnqSPfrEFJ5wKf7bCcerrKLt6H05ZMnkMVA+Zwfj6
 cUyld60n0xtHUOEOh86SUQSVvpsE92JLB8FgScy0nq5jaeC8fXObZRR96Vwx125OTifL
 a8he0uL51235AaHYdnqQ+DCgCRZ527Rpm+bgYzDNPLjswfdonS6vuGO3VkK/cacZBU0b
 AyDuF8BCu1d+hhKcPnGzYvL7aQz6GIihu6OJqweQp2baNgB+YbyN8aOqDGefnG8lWt2P
 gxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795192459; x=1795797259;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D0Jp0cSCJcyhhcCdpXe0VkRCpAsJ4OZndwM93HMMgIU=;
 b=CLtakuz+gjl/gTL5Usrb4N/P7Yh+OW5q2RIKNKRUYS3DVLMOl2iJstFD51XhEzhkN2
 QsMu1in85CkhdxfrHyqOpJYP0hknv0SgfP0OFbiXXZmr9z2EDlko/od9/A2b3OPmmy/N
 BUflNEcFY76RoptzLS4gufbETSlWfcJpoem4SmyI8IogiGugE4YEjL8unCYtTO9Ot5Gi
 /lvxiFu5G78Be0MQLAIqGzEKRFO+o1iz4PUJinMVvF67UPcEOzEz/vJ4DABhx3cUcrAe
 JHIv2azRQxG38MuKOZ9HfnHa9YpcesgUX661T2E+4p8amf5fRYaTBO5Qg7jWSrZFK/xo
 XTFQ==
X-Gm-Message-State: APuU4Z8LlKAm5ZZhAWWl6omz+FG9QszcRB6ViCEcORrU67I2zxMb/LPJ
 9U/RUIqmVFPxkfL6tNjuBFG1ahm3nAtUAhELMlIRfrZ7cIBNaPJ4PhxGEs8VRSL04GQ=
X-Gm-Gg: AYBFou2cIOVk04PrarBoDWLPdk7WR0RvNR8hRuNfmvG9UVLrkcUG3L3R+1jGfYsXhwp
 YrdTkEfNRaZN/AaRk196GkCk3J8rumF9yaLSMC2OYWvO/0Sbg2/Yc60jfzwgT4U8RvB0ktfizsI
 4qAONAuJUIDuSTXyiK9QQm3b8Ldnnn6CpG+iL2xB5uWWsGjzdw8T2D5j7pagNtR5HXw0yQbYe2N
 K6uFxx5umI7tXnPp3fEbzQ6b6dDYGMZHsLhhzw2M54oklsKAiNS8S900RNpCwhTpUQAFeRfobOX
 RWWX5dbmlq67jDuypEDRcpZ/1k3tMGSidmWYHovSIfF1ZksO8+AEIhB/41Pe2atnzCdcuTXSDJA
 k2TWrPjU+KUeijnym08r8jJFJYNQHM5yJtpD3JJFqM/BGVd6B0iF22/nEcjn9oNG5Btd2AQ9g92
 5soVFmDXxJ6EQCAJ0f9q+rV5c8w3/JAokzsSItuKy8PhqOwQsXMEAPVgktQ0ddO4VfhLePOA7++
 PWMOf+lDrLClkMF66VSAl7o+/nxFRJYF3EtnAwhjlQ4EMth0DPr4FcEcVCp6gdVRR62KxYXDnBI
 3glF/3NGVeMZz7unHWtSfHKRH4W6CFjMkK2tIbOpqHa4PtwNgBtdF5NuF4645b725d5cBDo2An7
 KpaTk6ZPgS7bIrB2cUEbzPAw9XG94dubnWkGHMnykbyJKb8cfQe3IT0bEBnEfw52e5rkeM1+Oi2
 zamLAlkOXF0Os+0g/v+6lcRdtLpZX4CXWhVwxtR0t7VpkacQri4lP7VmHLVSyb7Xny4MFzgIYzQ
 BmQw8pqN305ISqG65gB+3RQJN67DylkakqzSy4QMCQTPjyiwNfY6f9Pg3rLvu5AV7h/QxhwbBOa
 GtVYTY+M
X-Received: by 2002:a05:622a:1b29:b0:535:24f8:fe3c with SMTP id
 d75a77b69052e-55d7699410amr69341751cf.5.1795192459570; 
 Fri, 20 Nov 2026 08:34:19 -0800 (PST)
Received: from jake-laptop (pool-99-229-241-217.cpe.net.cable.rogers.com.
 [99.229.241.217]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-92134a08552sm28757536d6.34.2026.11.20.08.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 08:34:19 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: ville.syrjala@linux.intel.com,
	jouni.hogander@intel.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, rodrigo.vivi@intel.com,
 animesh.manna@intel.com, uma.shankar@intel.com, jani.nikula@linux.intel.com
Subject: Re: [RFC PATCH] drm/i915/psr: Send the AS SDP in PR Active while
 vblank is enabled
Date: Fri, 20 Nov 2026 11:34:16 -0500
Message-ID: <20261120163416.66175-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <awBhLKnEiGt69Vr7@intel.com>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
 <20261006220500.3417572-1-j@metarealtyinc.ca>
 <76935065478d9f4ab9ee42e36b541101bad34423.camel@intel.com>
 <awBhLKnEiGt69Vr7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ville,

On Fri, Nov 20, 2026 at 05:03:08PM +0200, Ville Syrjälä wrote:
> Is this some weird hardware quirk of ours? I don't see what vblank
> interrupts (purely an internal thing to the display engine) have to
> do with the external panel receiving SDPs.

The panel doesn't care about vblank interrupts. What it needs is the AS
SDP while frames are being updated. With the AS SDP suspended in PR
Active it judders, and with it sent all the time it's smooth but
DC5/DC6 is blocked.

Vblank enable is only used as the "frames are being updated" signal.
Userspace holds a vblank reference while it flips, and Panel Replay
already holds DC_OFF for that window, so sending the AS SDP then costs
no DC residency. It is suspended again before DC_OFF is dropped.

Jouni can say whether the internal confirmation explains why the panel
needs it. From my side I only know it's this sink (LG, OUI 00:22:b9)
on two Dell models.

Thanks,
Jake
