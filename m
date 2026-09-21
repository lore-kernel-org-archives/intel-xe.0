Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B01C982F8
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 12:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDE410E6EF;
	Mon, 21 Sep 2026 12:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="RBnr4hao";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="L5RwNwcs";
	dkim-atps=neutral
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3192510E0CA;
 Mon, 21 Sep 2026 10:07:34 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 6E438140004C;
 Mon, 21 Sep 2026 06:07:33 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Mon, 21 Sep 2026 06:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1789985253; x=1790071653; bh=0y/pEMxHkS
 CgbLKfpVsH94u2MI+wDts1pM/AG8nNU28=; b=RBnr4haoABPwT7P/l0K0SoAsNH
 IupDGr6OBOrnE874taRAmMVlSquH5mnfPArBwPX4nWQ0eHtC036Ghl3Ca4iVkWXG
 d8H15u92ULe2/enmllnQ8wGB8DFPvTykCHeoymRHnJG/ioMPToPfoXn/hDzgiQYp
 c/9aYlSZXMC9TmrgYakWjzGVO72uTaxw0wFlEIpTxPd+iOlrI9fpmJlAM7ZOlAsO
 b4kD9WGSNtzQyDoVYcxkpWMk69OveDYjpWf8hl1vSF923J9P1g6v4XZBGy1ELA6X
 63lgtHqy7KOUK2oSPD/99Q4S6NaptAHL9PKQxw3F/qNuv/RrUKsHDgVz84ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789985253; x=
 1790071653; bh=0y/pEMxHkSCgbLKfpVsH94u2MI+wDts1pM/AG8nNU28=; b=L
 5RwNwcsqQN8ygVxB3ejLjNHhsTF61ZERE/bfoVMcubaN1BuNOZdjVclz3KnfElqp
 F/BpyhFf0AcNKnvPHM0Gz1k507A0hOVeECqREn0lociVtOiRbqVS/eqSsklR2Aps
 cQxi8xRLxSxH2vqN2D4qDaKJwyHQSIVJe92E7Ign2t2gt66zhvuLVXYI6DbxZWAF
 WV2ft5mGD/pryFIk5/glS3sg/Ab3bTvA0jU7ax0ev0HFaxGxVBX5TGj5ppuZ1UgQ
 0MX7cojmUxAzfOdoogvZHvVAOPT8g8qPy7UL38phQ11CYR0NGjrjdc4tsPVGB1hP
 +z/MajiDR4xw1SlcC1LFg==
X-ME-Sender: <xms:5QGxanl7tkHoPR1UY01BdoDnAIZiSRRoEYvN1BLqNoLcwdQNbWwEDg>
 <xme:5QGxajyiKbNF1s5tFtG9vcITKcnRnMPHKnwNvoPqvMgd6QaJyYLPFolnmofz86wJu
 oqeK7XMkkg6lRzsNFRISmH6OfaLBBNB5xZG8jWFygyblo6cusPX>
X-ME-Received: <xmr:5QGxapNDBZ7mJwbrwYWnVqPLmHyC8RpYMa_ZAeUnNE_VSSXC9MjPC2bVZ1r3_nO7sD_zHVxnamaY>
X-ME-Proxy-Cause: dmFkZTErFm0rAFyIJ4sVSgltzNCIihd7pNjoeOTpcyA7NBiwdLLgLOEd/J50tgysN+Ae1A
 BQvmXJuDjIBKtV/rlvoCzKm1JKZG7g87cGbMOzFFeuya9EJNXJMyM8nt+Mm8e6qc+ciL4k
 XlxMKsxkyKqY00bRjTjAzapyFl7SPwRa6z6O4entU9MQogwSgP/U/SlRvLyIhBDxBSqsLc
 L12p8CwWPw9X3YTfeLUINm9AvLAdjqtArSCVotHUiK3c+psDTH7K9Yfq73i7ow01ZXfmwM
 EZpBeqQ14AbxiUL43HQEalcDInASO9VoHKMgdk/GAglTo8IAiM4VWlNllnNGOWSNO9IZPl
 9mkTM2bN3R94N5mUYOOCukTprUgMCL0zxCxYbMI5iccHgzgpZP+vZrf/MjCKjrGRhaeZx7
 BSOCHuAGZUp4Tzx/hlfyA723AB+TPEgbTBuwYBjTRb9p1QMb5Z6M0eS4c57hh5uyWIjtMR
 uck+Xv6y4rXcbAQOAzurA07KCsbdh+R2SFkWKzGmTLfkuvkTnwwzfr1kz6U2ImMbjaFu1f
 J+pRGir1upHAgnx4QGpQnLgGJe2Nu/7mayIg2yTWMkIXQYmL1Zz5BQEHVGzLv2pwT3CGOR
 19XWajSKcQxQcdPRq2IjekQ8DrPklLty2/6UU/OE88HSFsd/WXoFcs4/bUdA
X-ME-Proxy: <xmx:5QGxavoY6b_7hF9zbsUMu968p0eNJd_jacaxHZyGo0SCDcFoDADAdQ>
 <xmx:5QGxaiGZ6z2ykkXg58Fldw6VI5IOHfSgtzd-PxD4rXYAgR-m71Ltuw>
 <xmx:5QGxaspIPbXdDdnp4RVee2b7O9hB3Kdn5D8S96gk5z0AxclN0jigXg>
 <xmx:5QGxajZJK-fpl8arzEGWHwBVoNOxZwU-o1MlDkyQagSElixIVXWglg>
 <xmx:5QGxaqGmcF31R4ieRvTmjBSB3Inai1_Wnh0JMW6PGA7yANaf79zyOxEz>
Feedback-ID: i792e4853:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Sep 2026 06:07:32 -0400 (EDT)
From: =?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>
To: intel-xe@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com
Subject: =?UTF-8?q?Re=3A=20=E2=9C=97=20Xe=2ECI=2EFULL=3A=20failure=20for=20drm/xe=3A=20Limit=20sg=20segment=20size=20to=20PAGE=5FSIZE=20on=20Xen=20PV=20=28rev3=29?=
Date: Mon, 21 Sep 2026 12:07:27 +0200
Message-ID: <20260921100728.72370-1-accek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <178998407678.185576.6713809856683852020@61270ab9df2a>
References: <178998407678.185576.6713809856683852020@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Sep 2026 12:56:16 +0000
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

This one also cannot have been caused by this series
(xe-pw-172525v3):

 * This patch cannot affect CI machines, because the only functional
   change is gated behind xen_pv_domain()

The reported issues seem to be tracked here:

 * XE#9331 (https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9331)
   for DMESG-WARNs
 * XE#7096 (https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7096)
   for igt@xe_module_load@force-load FAIL and the resulting 304 SKIPs

Could the bug team please document this too? KUnit is green.

Thanks,
Szymon
