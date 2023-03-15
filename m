Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E7BC6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 06:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0097910E917;
	Wed, 15 Mar 2023 06:11:52 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9203810E917
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 06:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678860709; x=1710396709;
 h=date:from:to:subject:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=sJhCmAWf8px2i2uwZUFNvZft3MG7XjNbOeNlGAVmbHs=;
 b=ICHY+bwk8tijtYG5aduvJFQ0NG9m16JQlFZ8YYdlwuSR299nW1fBRA/e
 WQVPeoLHd2QoNS+A4h7CiWXpHvsnjY35TSYL2swqthTqKA39G0pZtKDqZ
 xqhD21uCa5dPfuwYGh+oxXHPtvyaFtSIT16fuH7AXGcmx6qFBLE+RaAEj
 WReFZylFC/9NAHwAxSYgkZoSa2KamMOmHQWwLb5uExh5s4u332mpKB7Xv
 LM7aL3haTnjnzCoQVwbHo3cdLSUTRCuOJOvy45s7/qAcds1NF2YlyspFr
 QyKot5MH8rui94xFufFJKb0YftMEmdC5Hluva0N/Fx9R3HWjBWVfuj+qV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="325985468"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="325985468"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 23:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="711804412"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="711804412"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 14 Mar 2023 23:11:49 -0700
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5FB97580C1F
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 23:11:48 -0700 (PDT)
Date: Wed, 15 Mar 2023 07:11:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Message-ID: <20230315071145.27b77c86@maurocar-mobl2>
In-Reply-To: <20230310081338.3275583-1-mauro.chehab@linux.intel.com>
References: <20230310081338.3275583-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_uc_fw: Use firmware files from
 standard locations
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

On Fri, 10 Mar 2023 09:13:39 +0100
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
> The GuC/HuC firmware files used by Xe drivers are the same as
> used by i915. Use the already-known location to find those
> firmware files, for a couple of reasons:
>=20
> 1. Avoid having the same firmware placed on two different
>    places on MODULE_FIRMWARE(), if both 915 and xe drivers
>    are compiled;
>=20
> 2. Having firmware files located on different locations may end
>    creating bigger initramfs, as the same files will be copied
>    twice my mkinitrd/dracut/...;

Heh, it turns that it may not even be placing the firmware at the right
place, if someone does a symlink for /lib/firmware/xe pointing to=20
/lib/firmware/i915 (or vice versa), depending on what's implemented
at the mkinitrd logic.

I found this on /usr/share/initramfs-tools/hook-functions:

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # We don't need to replicate a c=
hain of links completely;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # just link directly to the ulti=
mate target
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link_target=3D"$(readlink -f "${=
src}")" || return $(($? + 1))

So, basically, using Ubuntu's default mkinitrd package, if=20
/lib/firmware/xe is a symlink, instead of storing
/lib/firmware/xe/bxt_dmc_ver1_07.bin, it will actually store
/lib/firmware/i915/bxt_dmc_ver1_07.bin at the initramfs, which
will cause crashes if the Xe driver is not blacklisted.

Regards,
Mauro
