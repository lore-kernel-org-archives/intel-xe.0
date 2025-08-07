Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ED0C87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 08:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B61210E0E1;
	Thu,  7 Aug 2025 08:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqEHQ8hQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9F610E0E1;
 Thu,  7 Aug 2025 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754556046; x=1786092046;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=cPK+KeqNlMElItwTlpxqBksWArIL8fiRx+uLQWzh7Xs=;
 b=MqEHQ8hQGNR77xfauTQQqeE3Bx8LwlaTZN3D7hWD22pbA74bS40WLqSB
 VGiPqzi28aVILO/WNIgIyU/ti+hYg+/KysGrkmaSfrvzA1kh4Kk+l5+c9
 EMtb1g2r0A8VI6WxHDd09HQ5PSCBylNyTyiSXGQbkXec3rKrKDP3IfQRx
 FsYOPn51YeIrmHUbZPtx/QZvsnczp/Zwdht8wapMPfG4oOegXBjHRYFMU
 rAOhKVX7bNpaIujpa9D85kJp8uJqSw82/kyC9PjBPCWfjhPjvCLe2Po2k
 6YVNRjx/NU35UU8s2Ja/Bq4O4CLsicI6Ef4t+FlhPNYMHJR0+Q10PXnWY w==;
X-CSE-ConnectionGUID: b3nL2c0YReaw28IV5PQlQw==
X-CSE-MsgGUID: xvLIBvjwRBy7n8A035RVrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82330666"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="82330666"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 01:40:46 -0700
X-CSE-ConnectionGUID: XDC1rueBT3676U3ALIjTyQ==
X-CSE-MsgGUID: a89BaW9RSp2q7/tH/dk/cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="165367825"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.96])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 01:40:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Luca Coelho <luca@coelho.fi>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [RESEND 3/3] drm/i915: use drm->debugfs_root for creating
 debugfs files
In-Reply-To: <148f401ac6b2d0ec2ccf0713185d2e23d5967ac7.camel@coelho.fi>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1753782998.git.jani.nikula@intel.com>
 <ba8a2a7ec10e54b4d0a96926ef20c96e268c0b94.1753782998.git.jani.nikula@intel.com>
 <148f401ac6b2d0ec2ccf0713185d2e23d5967ac7.camel@coelho.fi>
Date: Thu, 07 Aug 2025 11:40:41 +0300
Message-ID: <d432213f29c57c38ce5f40602b08408149446275@intel.com>
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

On Thu, 07 Aug 2025, Luca Coelho <luca@coelho.fi> wrote:
> On Tue, 2025-07-29 at 12:57 +0300, Jani Nikula wrote:
>> Since commit 0b30d57acafc ("drm/debugfs: rework debugfs directory
>> creation v5") we should be using drm->debugfs_root instead of
>> minor->debugfs_root for creating debugfs files.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>
> Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

Thanks Luca, pushed the lot to din.

BR,
Jani.


-- 
Jani Nikula, Intel
