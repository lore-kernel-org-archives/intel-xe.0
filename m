Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06353CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 15:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE42B10E1D4;
	Fri, 12 Sep 2025 15:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJzLCdNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56F510E1D4
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757690001; x=1789226001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rIU6BLZwJpiX6qXVmWftzI6Bw/fUyI1PgHIFWWGmpXI=;
 b=CJzLCdNEPX6YhiqRXavOhUfBg/KzV/fZpulfyzY00VKCep7GIOT8WUs0
 LxNhhZdCZHwj64cncSRMOnRX2dabFqdAeGAlK+POo0JicTmMV0zCvFfU/
 POiGHZ5kvJB4tbrb+urKW6gU2u3c3vbnpiyxgkvN6lQ6OBhlhPs77aQbw
 Y5Ct2NH3cB3loyzVOYNq0g72UbLOWQknDpOvbCWKJS9vP0HodslSeOqvt
 XvnxC6k1vexRj49TltP49kw9nEmQ7DqU2pEfX/0p+vYrLkOfCNVQMUc2U
 hwhyGvsUjyIPNrsTXAvPgPXwAre3cjhr+m894CFbrhqfcqpmgJYMtBFyR Q==;
X-CSE-ConnectionGUID: CYTCAuYhQqKSfsZq8WELDQ==
X-CSE-MsgGUID: ArzjrzDcQqmMndey6cJVyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77647971"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="77647971"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:13:20 -0700
X-CSE-ConnectionGUID: LkZKAqjxTsu+YDNzM0cH9w==
X-CSE-MsgGUID: nHgdEktPTqSy9ugc1IUVIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="173150561"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 08:13:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 mallesh.koujalagi@intel.com
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com, karthik.poosa@intel.com,
 sk.anirban@intel.com, raag.jadav@intel.com
Subject: Re: [v5] drm/xe/hwmon: Remove type casting
Date: Fri, 12 Sep 2025 08:13:04 -0700
Message-ID: <175768905900.551092.240692548563823424.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250912113458.2815172-1-mallesh.koujalagi@intel.com>
References: <20250912113458.2815172-1-mallesh.koujalagi@intel.com>
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


On Fri, 12 Sep 2025 17:04:58 +0530, mallesh.koujalagi@intel.com wrote:
> Refactor: eliminate type casts by using proper u32
> declarations.
> 
> v2:
> - Address review comments. (Karthik)
> 
> v3:
> - Use the proper u32 type and drop cast. (Lucas De Marchi)
> - Modify variable when actually using u64 value.
> - Change r value to reg_value with u32 type.
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe/hwmon: Remove type casting
      commit: 4e1d3b5e6423dc841acd8691d75626b3d3b2b6a8

Best regards,
-- 
Lucas De Marchi

