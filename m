Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BB6CA9EC5
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:32:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04A210E564;
	Mon, 12 Oct 2026 12:32:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FF210EF66
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 12:31:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7D5D84361D;
 Mon, 12 Oct 2026 12:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB491F0089B;
 Mon, 12 Oct 2026 12:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791808318;
 bh=qSN22V+LH9GV432m5qkQetk0fb0phH7JbfAfPf4kZg4=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=HWRUPV0sjzGdL0kCy7ivkax5DWHSCErswa+nSql/X8szPdhoAZqB1FlG8d3hZCKqe
 Ny51kNoVg5VV2Z5/QDW6iaOvaJya5ok+OYJCFsxXniub9w+WY0vmmxqUlN0eFXuKJ8
 9f8RDxW+4pHQfs19ZH4zzg0lo9za81J36cPc3t0DlTUx9ayZekKqtM68iercngXvvj
 DCyHiMsC2DhKIppJcboH3Ya5G3Awb5UGi0qaXXcD7r6Y98oT+hHXVhWt78Udpma5Kz
 zG7yw2AO0MU9MXzSESu4M3nNIQn9KGl0/mPDzqPT3fKgXlEuwuxz8GPnf7AEm87o5j
 XtZ/7BtjNbuJg==
Message-ID: <sashiko-outbox-168106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012122522.2307625-6-dnyaneshwar.bhadane@intel.com>
References: <20261012122522.2307625-1-dnyaneshwar.bhadane@intel.com>
 <20261012122522.2307625-6-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:31:57 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] deadcode: unused memirq_err macro left in file
--

commit c32c066b460938805d748f9376a0c96a69f7328b
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

    drm/xe/memirq: Report errors using structured xe_log API

This commit replaces memirq_err calls with xe_log_err to report errors using
the structured xe_log API. It updates the error logging in memirq_alloc_pag=
es
and xe_memirq_init_guc to use the new format.

> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index 9dfe965cb46ec..32b9f87a10ecf 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c

[ ... ]

> @@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memir=
q)
>  	return 0;
> =20
>  out:
> -	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(er=
r));
> +	xe_log_err(tile, MEMIRQ, err, "Failed to allocate memirq page\n");

[Severity: Low]
Since this patch completely replaces all invocations of memirq_err with
xe_log_err, could we also remove the memirq_err macro definition from
drivers/gpu/drm/xe/xe_memirq.c to avoid leaving unused code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012122522.2307=
625-1-dnyaneshwar.bhadane@intel.com?part=3D5
