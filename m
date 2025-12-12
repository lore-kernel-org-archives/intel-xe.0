Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA418D43369
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 03:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4342710E1D8;
	Fri, 12 Dec 2025 03:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihy5dwpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E218910E1D8
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 03:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765510981; x=1797046981;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lu6zHm8e3kyNUlN4EHAYHr22VVh243Hbd1yppVZcicA=;
 b=ihy5dwpz2RwmbyhXrkDhhDpSx1QkSpRhV54M91262Mgrgqvbnv2uZ6c0
 LgwpbpIKaC9z7rpV0wJIviB/PZ7ZyB6o8ai5la09/6mN7XCsCvbNyY5Wi
 V963AN8rmQfOVGD7ft1LR2Hwvr7grSrAyI3FOUVIJfyHZtmycDhL/Adgc
 GVKfOon2174L5CMJmCkW1ekNU+ReiLQEfcNBHgWeIMZUeH8MO9EgRJ+cg
 Hy9ZKq6QlQlxJTTDvSZuRrN6VFr2Rc9/oVyrAvd2u0IgzOuaDVEqfos4l
 mOboRNzqFfU28q2nUNumUj7bX1wcRb0L80GGCjwVe70+NVga7ifGxL+h/ w==;
X-CSE-ConnectionGUID: hED0Rx6WT5e/zbaOPgLzhw==
X-CSE-MsgGUID: TwU+XeRiSK2xDxvlMFb6Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67432691"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67432691"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 19:43:01 -0800
X-CSE-ConnectionGUID: 2Qa32f06RQKoGU8a+rD/IA==
X-CSE-MsgGUID: xBqVYtCqTx+OPMYiEvj8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="197025828"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 19:43:01 -0800
Date: Fri, 12 Dec 2025 04:42:57 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: Re: [PATCH v1] drm/xe/cri: Enable I2C controller
Message-ID: <aTuPQSvnBN7MAE25@black.igk.intel.com>
References: <20251128084414.306265-1-raag.jadav@intel.com>
 <aS36G51_xMA1nvBo@intel.com> <aTFzpOHWRm1Dvmr5@black.igk.intel.com>
 <aTHth3B0MOEpnay4@intel.com> <aTJwlzgmpwERtOxQ@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTJwlzgmpwERtOxQ@black.igk.intel.com>
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

On Fri, Dec 05, 2025 at 06:41:47AM +0100, Raag Jadav wrote:
> On Thu, Dec 04, 2025 at 03:22:31PM -0500, Rodrigo Vivi wrote:
> > On Thu, Dec 04, 2025 at 12:42:28PM +0100, Raag Jadav wrote:
> > > On Mon, Dec 01, 2025 at 03:27:07PM -0500, Rodrigo Vivi wrote:
> > > > On Fri, Nov 28, 2025 at 02:14:14PM +0530, Raag Jadav wrote:
> > > > > Enable I2C controller for Crescent Island and while at it, rely on
> > > > > has_i2c flag instead of manual platform checks.
> > > > > 
> > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > 
> > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > Anything else I can do here?
> > 
> > Have you inspected the CI failures?
> 
> I triggered a new run. Hope this helps.

Ping.

Raag
