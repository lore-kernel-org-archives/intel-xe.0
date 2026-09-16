Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B54C982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 20:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F40510E3C2;
	Wed, 16 Sep 2026 20:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TSMEEfRp";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FCD10E3C2
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 20:20:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 09E0940852;
 Wed, 16 Sep 2026 20:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5C91F00893;
 Wed, 16 Sep 2026 20:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789590039;
 bh=OSooBgnbfAo5lsibOWWKQMcgiOSK/G7PEizSQJ8Pm8s=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=TSMEEfRp2ArtQF4dhK65K4hT+CX9B60xOmynHNuEIF8q5pWVpBETKdxGmwG26gJMz
 sarxaS/dlXTEUC5OvcKnxdsdAkQwawwIDjJh+yayktj7bgkUU5zrMRqv4FyuawqZy8
 By/nyPj9Pp8KoB//CoFWXp3+YCw/RO9XIg+avuZykurFEHSgvaA/w+d11J0Ej2Ltip
 Fy/khEJ9HUbj0obEeZ77KeFn8ps4itbKCQKuC0oo5Wn6Fuju6V6CQvh5foP46CVK/q
 AD6FiGB2IguJkGFDP3ZzezIKYr5qswjTesHb7nU0OasisMDnUMo1HrqRAFHWccvjlJ
 h3IuyhO7iYtCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 03/20] platform/x86/intel/pmt: refactor rc with a
 return value
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260916201139.2374531-25-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
 <20260916201139.2374531-25-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 20:20:39 +0000
Message-Id: <20260916202039.BF5C91F00893@smtp.kernel.org>
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
- [Low] pmt: incomplete refactoring of pmt_crashlog_supported return type
--

commit 6d60cc557787aac9b9d1c6b547f8f188b34dd10b
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: refactor rc with a return value

Upcoming changes will include possible failures from HW accesses.
Refactor pmt_crashlog_rw() with a return value.
Update all necessary usage to use the return code.

> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 831cff743803e..b6540f3a9a17c 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
[ ... ]
> @@ -144,27 +144,29 @@ static int pmt_crashlog_rmw(struct crashlog_entry *=
crashlog, u32 bit, bool set)
[ ... ]
> -static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *c=
rash_type, u32 *version)
> +static int pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *cr=
ash_type, u32 *version)
>  {
>  	u32 discovery_header =3D readl(entry->disc_table + CONTROL_OFFSET);
> =20

[Severity: Low]
Does this code leave pmt_crashlog_supported() returning boolean values
despite the return type change?

Looking at pmt_crashlog_supported(), it still returns true or false
instead of an error code:

    if (*crash_type =3D=3D CRASH_TYPE_OOBMSM && (*version =3D=3D 0 || *vers=
ion =3D=3D 2))
        return true;

    return false;

If hardware access error codes like -EIO are later added as mentioned
in the commit message, will callers using !pmt_crashlog_supported()
incorrectly evaluate negative error codes as truthy and mask the error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916201139.2374=
531-22-michael.j.ruhl@intel.com?part=3D3
