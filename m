Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ED6CD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 14:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8606110F551;
	Fri, 15 May 2026 14:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.b="Qmqj3uWK";
	dkim-atps=neutral
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC2C10F551
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 14:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 16C05410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1778856139; bh=eLCsVAMGqk1U7q51Akbtvr3X5ibRmVt2uWXhRXhFtPo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Qmqj3uWKKo9R1BtTyzT3TELCwi9u+qiDWVP40YonRVnSFSgY+vl898/UjHm3bioPR
 BMYThWqq/p5Pd9x944lBEcsSVTFvCI55gwohRXE1lRmGJAbkn+Tr3pN5JySZUMv2mW
 IMpQ2EULLtzhQTeO2Vbyz67AVNN/JuVvmDwARtz7BSzwBF6zR+gRf9v670XOVdDlET
 DSwYGsXr/Y5wKUk1GgTEQs+sOvSK7rz/+Db3KLwpzwh7oEOeBBsNysU6GxvGnNITG+
 n2nSICM/KaAFKddHX6kXEYMKzblTWnkk3guTqYvj4W1cu4JimnEyp2D96JTAUyFy5Q
 Tnr5pUELptAIw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1)
 server-digest SHA256) (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 16C05410B5;
 Fri, 15 May 2026 14:42:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shuicheng Lin <shuicheng.lin@intel.com>, linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v4] scripts/kernel-doc: Detect mismatched inline member
 documentation tags
In-Reply-To: <20260507023232.4108680-1-shuicheng.lin@intel.com>
References: <20260507023232.4108680-1-shuicheng.lin@intel.com>
Date: Fri, 15 May 2026 08:42:18 -0600
Message-ID: <87o6igpwdx.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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

Shuicheng Lin <shuicheng.lin@intel.com> writes:

> Add validation in check_sections() to verify that inline member
> documentation tags (/** @member: description */) match actual struct/union
> member names. Previously, kernel-doc only validated section headers against
> the parameter list, but inline doc tags stored in parameterdescs were never
> cross-checked, allowing stale or mistyped member names to go undetected.
>
> The new check iterates over parameterdescs keys and warns about any that
> don't appear in the parameter list, catching issues like renamed struct
> members where the documentation tag was not updated to match.
>
> This catches real issues such as:
>   - xe_bo_types.h: @atomic_access (missing struct prefix, should be
>     @attr.atomic_access)
>   - xe_device_types.h: @usm.asid (member is actually asid_to_vm)

Sigh ... naturally this adds a number of docs-build warnings, but they
do seem to be legit.  So I've applied it, thanks.

In the future, please copy the maintainer(s) on your patches;
scripts/get_maintainer.pl should have told you to do that.  I almost
missed this one entirely.

jon
