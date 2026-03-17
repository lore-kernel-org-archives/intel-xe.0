Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6699EF3381B
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 08:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2940210E48A;
	Tue, 17 Mar 2026 08:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYFE4z3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D151110E1DB;
 Tue, 17 Mar 2026 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773737415; x=1805273415;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M/tg8ETMO0y2h5V5BalWYa+gSuZeec7rD+93Dy31668=;
 b=nYFE4z3oVHsZ7vxFjaVwa4ue3RAP96kwD3jlXIOddYZ+uB9b5Hg4PaeA
 x7yipqWEl3pCLpxuJq6bTep2IPk1m/3Oy+nP15IaNYfS+V+MpBcNuO4TK
 nBRwCdEaVgKDQcnpjw0qsORjzwgQAV0YxhGy+4fRWw5Z/I2yDTgcxf59N
 Z16xX2z754hzI3oFky21STExCzVJ7X1LzIKbHXWLgxT/BLMPy3Nz92sDh
 +/zd9NxNarkDPD+gLrdpNPuVu+zVkoRWeNQ/a6u1lkRC6BF0rs8iz6uXY
 Itg0AwGV/0NTF6W1LlRdklS8Ht7M1S/dhoau3Ps472Oul78cxIDkmQyXH w==;
X-CSE-ConnectionGUID: BmpJOpCeR3eFD/cZqDhApQ==
X-CSE-MsgGUID: 50RwIGPeQcyhRS5zW2Diyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="92334506"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="92334506"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 01:50:14 -0700
X-CSE-ConnectionGUID: jVYItRAqQn6yaNB+gOTvsQ==
X-CSE-MsgGUID: DQ5iXdSDQjWhz+6FHxRIkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="218363684"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 01:50:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: samasth.norway.ananda@oracle.com, ville.syrjala@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH v2 0/2] drm/i915/gmbus: fix bugs
In-Reply-To: <20260316231920.135438-1-samasth.norway.ananda@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260316231920.135438-1-samasth.norway.ananda@oracle.com>
Date: Tue, 17 Mar 2026 10:50:09 +0200
Message-ID: <98b08a93d554455ea7db69f148d2928e1ee728c1@intel.com>
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

On Mon, 16 Mar 2026, Samasth Norway Ananda <samasth.norway.ananda@oracle.com> wrote:
> v1 -> v2
> v1 just included both changes, the bug fix and typo change in same patch.
> Separated them to two different patches for clarity.

Thanks for the patches.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Samasth Norway Ananda (2):
>   drm/i915/gmbus: fix spurious timeout on 512-byte burst reads
>   drm/i915/gmbus: fix a typo in comment message
>
>  drivers/gpu/drm/i915/display/intel_gmbus.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

-- 
Jani Nikula, Intel
