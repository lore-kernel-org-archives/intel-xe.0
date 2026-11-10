Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211C0606A325
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PkGrlggs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB2210F2ED;
	Tue, 10 Nov 2026 18:49:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE06910F488
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 18:49:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D29C863B08;
 Tue, 10 Nov 2026 18:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667E41F008A2;
 Tue, 10 Nov 2026 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794336592;
 bh=40JU5pW7tEYUIGspwlcZKywA/YBmi0P2EnfEt72aIvU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=PkGrlggsJw2Kkl56m5h3l5//UvwGDD4u/YxVflANT1dvwyEW7eCeXAr9kCBOqk7VJ
 y9DGEAf0aykSpYEtAbCB4+Ll+RCK5/xaRVUsLxLpJwMAfOroOi3JgwwAsNm8ZvoIUZ
 PzNxmVoDLYELub3IDr2hPqfVJ/29AwxW++6WTvt8W5MgEHGUuEhAtSqjk/qngzP3eI
 H1EArSb10wWBI+jEuAmopoqVw6/j3VZNzc95CIhgP4RxQ9p6Ty6crLDoY1ZvtxqS98
 LjtM8lZO9SWLcoZFx2hVnSmnKjZZVAnhDUaERPvl4szvU00XX3R8zin308/13t0Y5b
 Ui42YUBO/Y2iw==
Message-ID: <sashiko-outbox-207609@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 04/17] drm/xe/vsec: Use correct pm state get
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261110183505.694124-23-michael.j.ruhl@intel.com>
References: <20261110183505.694124-19-michael.j.ruhl@intel.com>
 <20261110183505.694124-23-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 18:49:51 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe/vsec: inaccurate Fixes trailer in commit message
--

commit 59b127daa577716636b93aac167c1f0b67e5c795
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

> drm/xe/vsec: Use correct pm state get
>
> Crashlog needs to be collected at all times.  The current pm check
> assumes telemetry only.
>
> Update read path to enable device for crashlog instances.
>
> Include check of the WATCHER CAP_TYPE for completeness.
> WATCHER is a possible type and needs to be accounted for, but is not
> supported.
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Fixes: 2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog")
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

[Severity: Low]
2c402a801c19 ("platform/x86/intel/pmt: support BMG crashlog") only modified
drivers/platform/x86/intel/pmt/crashlog.c, while the unconditional
xe_pm_runtime_get_if_active() check and capability decoding in
xe_pmt_telem_read() were introduced in drivers/gpu/drm/xe/xe_vsec.c by
0c45e76fcc62 ("drm/xe/vsec: Support BMG devices").  Should the Fixes: tag
reference that commit instead:

  Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110183505.6941=
24-19-michael.j.ruhl@intel.com?part=3D4
