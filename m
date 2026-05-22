Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663FECD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 23:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1302D10E579;
	Fri, 22 May 2026 23:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7iv88fZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117E510E579;
 Fri, 22 May 2026 23:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779491393; x=1811027393;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=bHOzWjmnns4DSlJkzVhdZR7TXbpwauIL/1xHcPW5hX8=;
 b=Z7iv88fZ0Hpvr5hVNF0ml81L/y5JYn5UYF+Nt/dvUydvhJ1jfsFUxrky
 +u7XZO0KXFric8VknsDjeNjKxRJFODoBd8SMsKwDWWwU6WzVdai1nZMEg
 KMU9uvWWPXyW/e42NVtUT9ryu6pdeufRGX6azH3a7rFL6aA8pUVQDTXzZ
 0vw5upzafZ7wNKMeWPss9SUCDND/rW/xoI9EiJKoN+nfyHW2PwxXXBOaZ
 2ZdBPA0U3jS2+udZFSCTs5ThsZCE6vIGi9cZsnwT1wD1w+7/mE78jGy27
 lZbLMywx4o+1Zwy3f8O4mdsp4CPosWoPxNb/ibKSyEi1Xhw60CF4QWDYv g==;
X-CSE-ConnectionGUID: MtyMRETnRgeH25D3/8XPzw==
X-CSE-MsgGUID: NhdERFtyQTm2SgUrPbZJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91812259"
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="91812259"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 16:09:52 -0700
X-CSE-ConnectionGUID: JKWuOpjdR/mF902Y8G9KsQ==
X-CSE-MsgGUID: AcfXSgr/TCiwWiqNHMFEtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,163,1774335600"; d="scan'208";a="242846738"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 16:09:51 -0700
Date: Sat, 23 May 2026 01:09:49 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Subject: Re: [PATCH] drm/i915: Add the blend mode property to all planes that
 support alpha blending
In-Reply-To: <20260522194935.27411-1-ville.syrjala@linux.intel.com>
Message-ID: <49b74707-e537-a96a-856c-119106a0697d@intel.com>
References: <20260522194935.27411-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-818621189-1779490872=:1544314"
Content-ID: <ccabacc6-c6ad-0b71-242d-b13efd54d166@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-818621189-1779490872=:1544314
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <be373144-1671-335c-ef1f-005dd3a1d4a0@intel.com>

On Fri, 22 May 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Currently only SKL+ universal planes have the blend mode property.
> Assuming it now becomes mandatory for all planes that support
> alpha blending we need to add it to cursors on all platforms,
> and VLV/CHV primary/sprite planes.
>
> TODO: For VLV/CHV primary/sprite planes we could fairly easily
> implement DRM_MODE_BLEND_PIXEL_NONE by remapping the A format
> to the corresponding X format, and on CHV pipe B (but not pipes
> A/C) we could probably even implement DRM_MODE_BLEND_COVERAGE.
>
> Cc: Leandro Ribeiro <leandro.ribeiro@collabora.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-818621189-1779490872=:1544314--
