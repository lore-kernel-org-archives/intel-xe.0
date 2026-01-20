Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC1D262B1
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 23:03:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1367F10E668;
	Tue, 20 Jan 2026 23:03:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtP9fO99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4A010E666;
 Tue, 20 Jan 2026 23:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768950225; x=1800486225;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=QZQaYwj7FhXwbQqqQMTaUztAW7O0XyXrUEf4/Zd98NM=;
 b=gtP9fO99t3B0UzP0HUX27794b4zgJz7rdO2ATOMDI6wZL/dC6OvlX4nX
 vAuyhUHBPjk+h38cXOGlXsTDA65YVyo+mxEIbYr1R9DFvQcW06t0mbT1x
 GNNyqI/kjKvaZqnOxOOsZ8miWtZ4WprG4bDPiPz+mGEW7viHHuBL3sQz8
 ZECoRvamNGnF9I2nz5spGRJ16SJjCmrgxOi4hn6HJjhSGqqaOIZBDRWA3
 lEkYVEL50zY6PoSqOBTRFnWDo4TOAemtnRAM8ZFun76Ovs2fqV/XOVhsQ
 C3cAQeUv1Mn4kZUnP+NEXs6yFPvyKkWoMSiWhxRPbhFPpE7bdRWmlvZg8 A==;
X-CSE-ConnectionGUID: n45p382lTkW+zQkfqVVxhQ==
X-CSE-MsgGUID: 9NnnRwfiRu+sOdchrOwmFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92839049"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="92839049"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:03:44 -0800
X-CSE-ConnectionGUID: z5IG6DFbTs+vs1yy0Ij6NA==
X-CSE-MsgGUID: vKXUI7c7RAedgJcRdPZcFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="243828066"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:03:34 -0800
Date: Wed, 21 Jan 2026 00:03:32 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/i915/dsb: move i915 specific DSB buffer
 implementation to i915
In-Reply-To: <a01b3e69a3f79713eacf437af00dbe23d2f9c8dd.1768923917.git.jani.nikula@intel.com>
Message-ID: <2f08a298-5ae2-7594-6e76-200179733c28@intel.com>
References: <cover.1768923917.git.jani.nikula@intel.com>
 <a01b3e69a3f79713eacf437af00dbe23d2f9c8dd.1768923917.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-352309005-1768924376=:3959841"
Content-ID: <d17a03f0-89fd-2f99-70e1-e60c106bb50d@intel.com>
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

--8323329-352309005-1768924376=:3959841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <756f8d85-d842-73d7-3d89-f2afd0cc2fa1@intel.com>

On Tue, 20 Jan 2026, Jani Nikula wrote:
> The DSB buffer implementation is different for both i915 and xe. Move
> the i915 specific implementation from display to i915 core.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-352309005-1768924376=:3959841--
