Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C87CA9ED6
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 05:51:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9427910ECBC;
	Mon, 12 Oct 2026 05:51:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAD710ECD6
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Oct 2026 05:51:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A568B60AA1;
 Mon, 12 Oct 2026 05:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311061F0089B;
 Mon, 12 Oct 2026 05:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791784306;
 bh=lsBlTjET0U9GYksHlU2uX09X7+kX5U4ropUsZWg3mD8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PwFobBlziPup2YZG/7RPl1gQUl4Wm58Szf7BbikpmAu2sDFB8msodoaVtv7GmFCep
 Ob+woZZnBi5paIXjF+bS3FA04Hfjfy3rvptCgsXEveZNK/SpaU7FYOETjgYLJyPFLM
 +mcIA0dV9dw6SNPpZO2ZKmrTsSRpV66QqgvI706SBym0DfBUIX7EPRl9g1SIcnepbm
 7SmM8KGSdS1GHEyLDnKTfE2eMZ91bo3cxmafhsvHHmCC7eimmoZvYWoiFdMmJw2Swc
 ml+1VzHdp9wLX9MCY+97emc9yxaH/38CRpCFNdjdHKJ4m4IffzB6rSP10meLNkv5lb
 6/H7+g48WG2kQ==
Message-ID: <sashiko-outbox-167692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] drm/xe/xe_ras: Add support to query page offline
 queue and list
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261012054056.2272869-11-riana.tauro@intel.com>
References: <20261012054056.2272869-8-riana.tauro@intel.com>
 <20261012054056.2272869-11-riana.tauro@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 05:51:45 +0000
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
- [Medium] xe: pages silently skipped if firmware returns pages_returned > =
XE_RAS_NUM_PAGES
--

commit 9d21f3b18f4dc78f0d5de890ccb72a1c2ba87da4
Author: Riana Tauro <riana.tauro@intel.com>

drm/xe/xe_ras: Add support to query page offline queue and list

This commit adds support to query the page offline list and queue from
firmware during module load. The page offline list command retrieves pages
already offlined by the firmware, while the queue command retrieves pages
pending to be offlined.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index a3464857e84cc..de97e5341f944 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
[ ... ]
> @@ -343,6 +343,89 @@ static bool ras_counter_is_valid(struct xe_device *x=
e, struct xe_ras_error_class
> +static void process_offline_pages(struct xe_device *xe, u32 cmd, void *r=
eq, size_t req_size,
> +				  void *resp, size_t resp_size,
> +				  struct xe_ras_offline_common *common, bool notify_fw)
> +{
[ ... ]
> +	do {
> +		memset(resp, 0, resp_size);
> +
> +		if (list_req)
> +			list_req->index =3D count;
> +
> +		ret =3D xe_sysctrl_send_command(&xe->sc, &command, &rlen);
[ ... ]
> +		if (rlen !=3D resp_size) {
> +			xe_log_err(xe, SYSCTRL, -EINVAL,
> +				   "unexpected page offline response length %zu (expected %zu), cmd=
=3D%#x\n",
> +				   rlen, resp_size, cmd);
> +			return;
> +		}
> +
> +		for (i =3D 0; i < common->pages_returned && i < XE_RAS_NUM_PAGES; i++)
> +			handle_page_offline(xe, common->page_addresses[i], notify_fw);
> +
> +		count +=3D common->pages_returned;

[Severity: Medium]
Will this silently skip pages if the firmware returns a value for
common->pages_returned that is greater than XE_RAS_NUM_PAGES?

The driver correctly bounds the for loop array access with i < XE_RAS_NUM_P=
AGES
to avoid out-of-bounds reads if the firmware provides a maliciously or
erroneously high pages_returned value.

However, the driver then unconditionally adds the unbounded pages_returned
value to count. For list commands, the next iteration requests
list_req->index =3D count.

If pages_returned was greater than XE_RAS_NUM_PAGES, count advances too far,
silently skipping the pages that were omitted by the array bound check. Sho=
uld
the driver either reject the response entirely with -EINVAL, or cap the cou=
nt
increment to XE_RAS_NUM_PAGES?

> +		if (!common->pages_returned)
> +			break;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012054056.2272=
869-8-riana.tauro@intel.com?part=3D3
