Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A69107760E
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 19:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC1D10E091;
	Wed, 18 Mar 2026 19:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBfOWTfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6D510E091
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 19:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773863699; x=1805399699;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Ata7KE+0A8gyvlBTZA4DXWPYLryFRo2obHMbadUG0WM=;
 b=HBfOWTfwwRgFNQhfqFIGUR852CjulwPRWqGzlwzqcmwPS1j6fMJI2sW7
 +HWV/HU/0Z8cOP8EtRc8VCs3UvKbDkqosazuSqUDONDPaHu4PeEiiRC6N
 e1d3Ch+q3Fg/wc8pzYnRU6BlfuMLndy7f+1ORMY1934/cArAK78uY3uTL
 hcKJP5Ro+NeYjmYWW/8g6BpMXslyDIbyTDbrXd35uparsvwtwrSX5htsi
 wHMtyiaFm3MSA+g4yNX6N+CMM8seL+Pg4NsnyT9hs2po2MIycNW3upNRn
 lTn6DnfUROhHt8mIvbgIYPzd31MnyboaH/qpDPKzDnFPs+saIxnSfWnpt g==;
X-CSE-ConnectionGUID: rkUq2gbETe2DfytDEVsO5Q==
X-CSE-MsgGUID: zZOdXU/2RHuasjC+YpXVjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74817781"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="74817781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:54:58 -0700
X-CSE-ConnectionGUID: y5AUlanmTPSD597j+lf+jw==
X-CSE-MsgGUID: iD/AzhE7TGSZuDA2ucCtVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; d="scan'208";a="253228955"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.19])
 ([10.245.244.19])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 12:54:57 -0700
Message-ID: <749015b83d776d38329034a8e639ef2daa3a3a2a.camel@linux.intel.com>
Subject: Watch queue maintainer? WAS:[RFC PATCH RESEND 1/2] watch_queue: Add
 a DRM_XE_NOTIFY watch type and export init_watch()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: intel-xe@lists.freedesktop.org, LMKL <linux-kernel@vger.kernel.org>
Date: Wed, 18 Mar 2026 20:54:54 +0100
In-Reply-To: <20260310155741.87191-2-thomas.hellstrom@linux.intel.com>
References: <20260310155741.87191-1-thomas.hellstrom@linux.intel.com>
 <20260310155741.87191-2-thomas.hellstrom@linux.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Christian,

I saw you relatively recently commited some patches to the
watch_queue implementation. We're drafting the below change that
probably is going to use it but at this time it's only RFC.

Do you think the below would be acceptable? If so could you help acking
for merge once the series as a whole is ready to go?

Any feedback appreciated,

Thanks,
Thomas


On Tue, 2026-03-10 at 16:57 +0100, Thomas Hellstr=C3=B6m wrote:
> Add a DRM_XE_NOTIFY watch type for asynchronous error notifications
> from the DRM_XE kernel module.
>=20
> Also export the init_watch() function for use from kernel drivers.
> Use EXPORT_SYMBOL() to align with other exports from the same file.
>=20
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
> =C2=A0include/uapi/linux/watch_queue.h |=C2=A0 3 ++-
> =C2=A0kernel/watch_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 ++++++++++---
> =C2=A02 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/uapi/linux/watch_queue.h
> b/include/uapi/linux/watch_queue.h
> index c3d8320b5d3a..c800c153989d 100644
> --- a/include/uapi/linux/watch_queue.h
> +++ b/include/uapi/linux/watch_queue.h
> @@ -14,7 +14,8 @@
> =C2=A0enum watch_notification_type {
> =C2=A0	WATCH_TYPE_META		=3D 0,	/* Special record */
> =C2=A0	WATCH_TYPE_KEY_NOTIFY	=3D 1,	/* Key change event
> notification */
> -	WATCH_TYPE__NR		=3D 2
> +	WATCH_TYPE_DRM_XE_NOTIFY	=3D 2,	/* DRM device event
> notification */
> +	WATCH_TYPE__NR		=3D 3
> =C2=A0};
> =C2=A0
> =C2=A0enum watch_meta_notification_subtype {
> diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
> index 538520861e8b..701b5c388808 100644
> --- a/kernel/watch_queue.c
> +++ b/kernel/watch_queue.c
> @@ -445,11 +445,17 @@ static void put_watch(struct watch *watch)
> =C2=A0}
> =C2=A0
> =C2=A0/**
> - * init_watch - Initialise a watch
> + * init_watch() - Initialise a watch subscription
> =C2=A0 * @watch: The watch to initialise.
> - * @wqueue: The queue to assign.
> + * @wqueue: The watch queue (notification pipe) to associate with
> the watch.
> =C2=A0 *
> - * Initialise a watch and set the watch queue.
> + * Initialise a newly allocated watch object and associate it with
> @wqueue.
> + * The caller must subsequently set @watch->id and @watch->info_id
> before
> + * calling add_watch_to_object() to subscribe the watch to a
> notification
> + * source.
> + *
> + * The watch queue reference is held internally; call
> put_watch_queue() if
> + * the watch is not successfully passed to add_watch_to_object().
> =C2=A0 */
> =C2=A0void init_watch(struct watch *watch, struct watch_queue *wqueue)
> =C2=A0{
> @@ -458,6 +464,7 @@ void init_watch(struct watch *watch, struct
> watch_queue *wqueue)
> =C2=A0	INIT_HLIST_NODE(&watch->queue_node);
> =C2=A0	rcu_assign_pointer(watch->queue, wqueue);
> =C2=A0}
> +EXPORT_SYMBOL(init_watch);
> =C2=A0
> =C2=A0static int add_one_watch(struct watch *watch, struct watch_list
> *wlist, struct watch_queue *wqueue)
> =C2=A0{
