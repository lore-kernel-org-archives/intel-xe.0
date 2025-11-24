Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC513CFA466
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 11:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1F110E21C;
	Mon, 24 Nov 2025 11:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/9Ga7US";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BEB10E21C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 11:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763983158; x=1795519158;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=U/EZhSigQJ8qfHqrYefm5817TwSMqZW27+TdS7Bxda0=;
 b=e/9Ga7USAEjcxMsDpV/JZV/Tr/bL9BvKe5rOR/+rCOpcurJ6GDctQiw+
 f/BqgtioYlxXbHwKaz3ssEqeSd5PHHOHab+mYekhvJmgdUXq8r6Eb/Iwl
 kUI0EIN6Qulozf+7wSmUKSYiCEGhXm4NaJ9oQb5+55n4b/7+87qCq3Ucj
 OCmYDPLghtBnmNSQ8oU1sPGoK8UCjzcMYjtMBNwf66XpxOBp9Zm+hT5SJ
 WWn+/BS2TefQZbpiTM0craiGXJ7Bp9pdWdfZ4X1sd2pn1l2KMYqecqlao
 RXg8rQ0Xiq8KVBIGzsxAjCJLJXkssak3V9bGxs1w2w5CTfuAddWnEAigY A==;
X-CSE-ConnectionGUID: 7imqPOmkSm+AmOXtVrwNvQ==
X-CSE-MsgGUID: RwJM+WMMQIKnhP8vpClaGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65161499"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="65161499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 03:19:18 -0800
X-CSE-ConnectionGUID: A91mk0U/Qe+H4RAssKQe2Q==
X-CSE-MsgGUID: GCmP0emdTVCWbtkZE1jM9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="193091456"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.61])
 ([10.245.244.61])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 03:19:16 -0800
Message-ID: <f3a9603475e70d85368e5083046365eb507da502.camel@linux.intel.com>
Subject: Re: [PATCH 0/2] Silence allocation warnings for sync arrays
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Date: Mon, 24 Nov 2025 12:19:14 +0100
In-Reply-To: <20251120234254.427452-4-shuicheng.lin@intel.com>
References: <20251120234254.427452-4-shuicheng.lin@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

On Thu, 2025-11-20 at 23:42 +0000, Shuicheng Lin wrote:
> Suppress allocation warning as driver already return -ENOMEM safely.

Even if the driver returns -ENOMEM, in practice a malicious user could
allocate most or all of system memory.=20

So IMO we need to restrict num_syncs to some reasonable number, and if
the allocation is persistent we should add __GFP_ACCOUNT.

/Thomas


>=20
> Shuicheng Lin (2):
> =C2=A0 drm/xe: Silence allocation warnings for sync arrays
> =C2=A0 drm/xe/oa: Silence allocation warnings for sync arrays
>=20
> =C2=A0drivers/gpu/drm/xe/xe_exec.c | 3 ++-
> =C2=A0drivers/gpu/drm/xe/xe_oa.c=C2=A0=C2=A0 | 3 ++-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0 | 3 ++-
> =C2=A03 files changed, 6 insertions(+), 3 deletions(-)
>=20

