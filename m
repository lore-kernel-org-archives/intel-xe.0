Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF42C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 19:01:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F3110EB1F;
	Thu, 27 Jun 2024 19:01:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3SzRgDE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C85010EB1F
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 19:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719514892; x=1751050892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vO7hwD5C7Vc3XtIcqLXsJ91maVqmJz36/HOt1K8SPek=;
 b=R3SzRgDEIvFm+ZrP3Lmr1e0A9RAFpCd6x31qKl4TNSt707F+sTm1hv+l
 r93OS1t5jcGvcm4OcvBxs6rPegZ+Uc8WsA/1EAA1Dda1uW/8YZxZhicLN
 OninF3J4q/SREF0TWUmCd9roZDsI8aiHryRw3rdPy/aJZ69wfkuuqJ9Lg
 nrSI96/3lb7aBpSZc7C3nnUt+be0yd/89nX9cogXK7A9AJ0V8fHpAsl8j
 Lc6+fDHwLf5fk0VGmv/E913lcWqc9kZv+py33PgSO31s1VG+pFxLCx62+
 UQO1APzvIASU/3wHx5K5oFPkXUc0RIET4vTKWbrBus2LBEF3iivPyK6us g==;
X-CSE-ConnectionGUID: 41+uh2N5RWmz3sVX0nfGPg==
X-CSE-MsgGUID: vLAfw+6WT2uork6GZwNQqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="20490318"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="20490318"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 12:01:31 -0700
X-CSE-ConnectionGUID: +NZVsnSKRyK/AGTyfJpJ6Q==
X-CSE-MsgGUID: HiouvEYQQYWgx7S0/VT1IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; d="scan'208";a="45130517"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2024 12:01:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Nirmoy Das <nirmoy.das@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH RESEND] drm/xe/client: Check return value of
 xe_force_wake_get
Date: Thu, 27 Jun 2024 12:00:49 -0700
Message-ID: <171951484029.775393.10885902747621916498.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625094228.5327-1-nirmoy.das@intel.com>
References: <20240625094228.5327-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 25 Jun 2024 11:42:28 +0200, Nirmoy Das wrote:
> xe_force_wake_get() can return error so check it's return value
> before reading gpu_timestamp value.
> 
> v2: set HWE to NULL instead of setting timestamp to 0(Lucas)
>     Add a warn on for xe_force_wake_put(Himal)
> 
> 
> [...]

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and applied to drm-xe-next, thanks!

[1/1] drm/xe/client: Check return value of xe_force_wake_get
      commit: e71cf19e3119de446cc37ddabb2e161ebbf7357c

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
