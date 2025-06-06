Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BD6C61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 21:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AA010EB69;
	Fri,  6 Jun 2025 21:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1tksr5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A2D10EB69
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 21:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749247051; x=1780783051;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VmWmQGkpGJwF49gWvSr+Aop9Tn7t9eEVnsHUOHKygHs=;
 b=g1tksr5z3UWGx4TWpwKwcxqD1h6wyabZpkzIWcXlP5GsM6N+71Yl8qO8
 8CoeucSBx5PHSiyB2x4OXHkM2qk3ciYar2L+8IWEYdapoJUJKmjlQG8vo
 gUPafe1QSm+LSPHCr8bivfM/JNTzA/wjEcNtwKJ1H5bHp1sfNsyNAx6/h
 zKN7YV4PrUNa7z5O1MsNekxnASXT+g+C/jJu+Vc/6tpijKWj0cXdYf8s8
 EGo35jqeV5aDeSnnHFH5EPuU26bGRNNBr99HaGRn67bFxFW1fimnGhIC1
 Z6iM5mqHS7+mLRDXGpJ+SQa/dowcisD5ftk6niqzToC3IbNfroi+LDPzQ A==;
X-CSE-ConnectionGUID: 88LOV/0XQE2Ucislj346XA==
X-CSE-MsgGUID: EODNSBIXQAO9WWxDH1qYAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62065604"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="62065604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:57:28 -0700
X-CSE-ConnectionGUID: 0Q1MPo7/TI+8YYKIwL0+nQ==
X-CSE-MsgGUID: sin1q7woTSiYjPHR+CsUYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="176818580"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:57:27 -0700
Message-ID: <3b2efd54a826d4e561803220d556619d22784cab.camel@linux.intel.com>
Subject: Re: [PATCH v3 07/11] platform/x86/intel/pmt: correct types
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:57:27 -0700
In-Reply-To: <20250605184444.515556-8-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
 <20250605184444.515556-8-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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
Reply-To: david.e.box@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> A couple of auto variables do not match the return types of some of
> the functions.
>=20
> Update the mismatched types to match.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index aa3f57fbe018..a51923d0be72 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -136,7 +136,7 @@ static ssize_t
> =C2=A0enable_show(struct device *dev, struct device_attribute *attr, char=
 *buf)
> =C2=A0{
> =C2=A0	struct intel_pmt_entry *entry =3D dev_get_drvdata(dev);
> -	int enabled =3D !pmt_crashlog_disabled(entry);
> +	bool enabled =3D !pmt_crashlog_disabled(entry);
> =C2=A0
> =C2=A0	return sprintf(buf, "%d\n", enabled);
> =C2=A0}
> @@ -167,7 +167,7 @@ static ssize_t
> =C2=A0trigger_show(struct device *dev, struct device_attribute *attr, cha=
r *buf)
> =C2=A0{
> =C2=A0	struct intel_pmt_entry *entry;
> -	int trigger;
> +	bool trigger;
> =C2=A0
> =C2=A0	entry =3D dev_get_drvdata(dev);
> =C2=A0	trigger =3D pmt_crashlog_complete(entry);

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
