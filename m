Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC077C369C2
	for <intel-xe@archiver.kernel.org>; Sun, 20 Apr 2025 14:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3435110E104;
	Sun, 20 Apr 2025 14:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDlQkmdq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F3010E104
 for <intel-xe@lists.freedesktop.org>; Sun, 20 Apr 2025 14:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745160575; x=1776696575;
 h=message-id:subject:from:to:in-reply-to:references:
 content-transfer-encoding:mime-version:date;
 bh=wOQjm8fDi0gixBGdLtf5VgMh6MfyJekWFrd7yjgx3bg=;
 b=gDlQkmdqilAhva0pmNdJqEMPnrYxU9sslsII1nON3cY1JM9LvdhjjBCs
 IVsXqMMNjaMCUq7LbhxnMpcrQSUgVXDXHWKgQPWSyqKSIe5Oy7PzqqXJM
 fffBHjcEhzKuFXFs0DhP1dj84h91a7JB64EP35JOXHSqShVvzc8ltrMf5
 HsjfOvbCVXDBCVw1xDWsSCTsNDysX42D5kc5dWGiwU09wc/521HljK0+g
 VCQaGkIZJvPuRZckUkUcUd90MiMght5UUKZiEZUPZkqHrxlk6w3qWk94p
 hDjaEW42cgY1En1eedoIlI2APvqJNwWQzlmOU3UeIK3KItEskzOM7p/xK A==;
X-CSE-ConnectionGUID: gudIzHIVQj+a96BOjAofbw==
X-CSE-MsgGUID: V2QDZZVkQP+scd7BGUTKJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50510798"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; d="scan'208";a="50510798"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 07:49:24 -0700
X-CSE-ConnectionGUID: s43Tj4+zQ0yLhRCNZkrqRg==
X-CSE-MsgGUID: 6g3s0/D2RMiXz+iaLFEXJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; d="scan'208";a="131262177"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.246.47])
 ([10.245.246.47])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 07:49:23 -0700
Message-ID: <0f48e3d3562d1f22d4d353a2ac6ee2de091f2382.camel@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/xe: handle pinned memory in PM notifier
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <255d999f-1411-4a33-9934-04894f1690ed@intel.com>
References: <20250410162016.158474-5-matthew.auld@intel.com>
 <20250410162016.158474-8-matthew.auld@intel.com>
 <d376f20fa198489ce11e740ff52f8b2bedf5eff3.camel@linux.intel.com>
 <255d999f-1411-4a33-9934-04894f1690ed@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 14:19:17 +0200
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Tue, 2025-04-15 at 11:27 +0100, Matthew Auld wrote:
> > > @@ -1120,13 +1192,16 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
> > > =C2=A0 =C2=A0	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> > > =C2=A0 =C2=A0		goto out_unlock_bo
> >=20
> > Should we drop the pinning of the backup object at this point,
> > thinking
> > that on memory pressure we might want to shrink it. Or perhaps
> > reclaim
> > is already turned off at this point?
>=20
> Yeah, __GFP_IO | __GFP_FS are both restricted here, so I guess we
> can't=20
> really shrink stuff at this point?

Indeed we can't shrink without those.

/Thomas

