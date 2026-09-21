Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29A6C982F7
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 12:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B4110E6E2;
	Mon, 21 Sep 2026 12:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="tHa69OY8";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="F6VHZ5sh";
	dkim-atps=neutral
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7395E89CF6
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Sep 2026 09:31:47 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id AB7C3EC0073;
 Mon, 21 Sep 2026 05:31:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 21 Sep 2026 05:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1789983106; x=1790069506; bh=JlIEX3y/Vx
 LlvnGNyrLMtyzoXElMVoP34kNDk/6qgeY=; b=tHa69OY822X9SVo7C90L0iLi1L
 fip/FoSeSZH9acGOt2Rxh9M1ZyhOpUBo36wvvY8mQ+zy+8GbpFlfPPTW7O2EjRUe
 J1g+BK7BjXEHWy9myzr66hl8X6fuFwTAdYBfw0JZMZ61r/dnAQPrwsdtrYSi0+Cs
 T+Ia03vqaE+NQ3H7MT5bxFjYoBeaiLoe+8VS0zCS/BYk9w4Yk/Y3QiEMvYgZOMHv
 lldl7m24Oyfw6hwn0WpwYPc2FAocElUFEqKXsEWB6IPeqFbyTii5vo4khLluRFNB
 +pAeg7il69l6sWZO979r+Cb6SlszkmD15TCNV6SPSq3SOZs7Rt3N/APhxhRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789983106; x=
 1790069506; bh=JlIEX3y/VxLlvnGNyrLMtyzoXElMVoP34kNDk/6qgeY=; b=F
 6VHZ5shaYc2tD04pSGOVO7SykPuqvWxwMOVz/TX/g7IhpE1vrkFOdYnsAKQyH+Sp
 It2r4Ok232LWWiS97fMTdB3np1rbr4q6r7Qp1nD0RoblnD4SC5UfNdU/FZqcCbI+
 FYFgBrDiaK3YxB6/aeyRZThK8JrNXf8JnTZBv3ismrQ7H6n2nsML8A1ewzoBFPhq
 7jfG8EwlpPyqJ9rZsMxBeQYJAeuyq8K4EsJK6SRecIIF4md+CHpsAx1m2mI6rdn6
 1CNb1Y73I8duBwmGoFDQuia8R6OWq5xmtQVqGMYYpuGjmH1dGaSxZUGuyeQwkAXP
 V1BkgYlAVeOcgHm/gTEDA==
X-ME-Sender: <xms:gvmwantnnd6nyy85FIb87UJxfU90I8tiI0UVzfZgZjMr3Fn5eW78qA>
 <xme:gvmwahbrXUfBYD_aM8xbZoZQOSCprmgEaBHY8DxsuPpadIUno5fqyMHuxZ_pIg6HQ
 ZaiCxQzNBlgBGQRY260l2xBEhYiZgrT1iVJ7tlgT2GYblqdVugT>
X-ME-Received: <xmr:gvmwamUktOb3Drybi47AG34oSlRWiJ0IU7WHSOpguzR1jzriMcy2tLc71XEDXAC9Ypm8VuhUGw1b>
X-ME-Proxy-Cause: dmFkZTG2+AwCH3wk2nwFhQ22undpALoNprun/szLEhPDp/3PpdaIuLEzsL+VJKbiFoW1HB
 oeJuO1XI8Ok7mGXpfNWnXireROBqjypMAjBK+Vby188JqARo4/ESHdfjdIP4CR3oWQ3kAK
 +lXqazPtafa6V5+b9cJMfH+VPri7KdFy6vY3ta5521ks+It0Aiku+t2/NlR+9+71M9ORTz
 wCkTUIM+rz+IJS1cHfswTeq1v4vewD0WIDqxPeSTUeM/8M4HY6NWqLy9X6Ih5svKR7qycO
 yH2xmOqRTs7XTD8KPaTaDf8AUgQgNmsBTU2S4Yw1vHOV5n8MFZEEve05l/dF2gWJHJCPgA
 YMOadS1oISUpAlEfbj8nW96HCyldiNOaJMMpXEpog7IAc92EiDapNwvg0fhAzsw7n8YVZR
 Tuk4Dzr1HGnaLk9x03io7Gi0lIODZlw0hWkVRNQ4j+hWWcWKvDs21+aIvJVcUhr2QVDEXV
 TkqSGklf36D7gUG428FZKhT4E97jf1XIxDvG+gncmPdKZVXK/kxaEBzfCQkPists1vMZWe
 pgPYxRqFAfUmEM1KT1HiUFe2bqiRnobAWRkqRlOYnmtw6CGj4cd6mFP+XsFc3rhQdW2nkN
 UYLfTmcOVnP3cSzyLzGw/kyfvdZt5dHD8n/NArpPJmBXfSoMJhKcVTMCDMNQ
X-ME-Proxy: <xmx:gvmwamR-8y0GftZUPYU4-YxR5mdEXYUwBLR7Rbg6fh4_qP4l8y0aOw>
 <xmx:gvmwakMDLtnuB5z7qInrY-A_y6eTgeHfoYoj3j_jL_HtgtREJMP2CA>
 <xmx:gvmwakQFN8_yIFSIsj6Bx7FVyMKH_zwxYOBfgxZneNMGd0dbVhyjNg>
 <xmx:gvmwaiglTuL4v7OhB1EfA8WhtyyYld_oViws30B_-yFzKfDU5IPVeQ>
 <xmx:gvmwagsJvCefLRUolRRMIXXXBJ9Rj2f-pg1fp5FB8GiiOPj1F2g1U-GH>
Feedback-ID: i792e4853:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Sep 2026 05:31:45 -0400 (EDT)
From: =?UTF-8?q?Szymon=20Aceda=C5=84ski?= <accek@invisiblethingslab.com>
To: intel-xe@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com
Subject: =?UTF-8?q?Re=3A=20=E2=9C=97=20Xe=2ECI=2EBAT=3A=20failure=20for=20drm/xe=3A=20Limit=20sg=20segment=20size=20to=20PAGE=5FSIZE=20on=20Xen=20PV=20=28rev3=29?=
Date: Mon, 21 Sep 2026 11:30:55 +0200
Message-ID: <20260921093130.47166-1-accek@invisiblethingslab.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <178997698493.185576.10649793262630223782@61270ab9df2a>
References: <178997698493.185576.10649793262630223782@61270ab9df2a>
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

The reported changes cannot have been caused by this series
(xe-pw-172525v3):

 * This patch cannot affect CI machines, because the only functional
   change is gated behind xen_pv_domain()

I think this is a false positive tracked by XE#9331
(https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/9331).

Could the bug team please document this as XE#9331 so the series
can proceed? KUnit is green.

Thanks,
Szymon
