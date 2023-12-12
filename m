Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFD5C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 09:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C3B10E181;
	Tue, 12 Dec 2023 09:00:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AE610E181
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702371617; x=1733907617;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Mesn3geDvel/aLNrx8EW/vNpJK5f9yOh4ZfnnzTlCKY=;
 b=RlObMvRBejPeV2rPU7otsY4wo2m0fbV+uQ/SVpEHcaRoVExJ61vQltD5
 oauQNO2FZN+PHAbLLW1hzRW38sHO0/WI3Y5siQhW0UKA7qSgFIO+YPpeV
 dhedgLLvP8AOHCE6KlODwdNvg9sEaBsG+N+e2V9qHT64Y5bMsOuBv5SGF
 O8knMLrptm4sko7My1K5+aD5PZCUA8IVk5CbCyA5QvPjbiX6fLhgzTgD5
 VnY/m2XWS80NwxStk+j8hgq1gcRKK3CCgXX/d5qymS03/j4276/gdFc02
 9ebZPldbOi9AtuZQ2594IfwJdTU23mUMQ/TSOn99JilUSpXdFoHhlD/kP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379770385"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="379770385"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 01:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766742791"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="766742791"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 01:00:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/2] fixup! fixup! drm/xe: Introduce a new DRM driver
 for Intel GPUs
In-Reply-To: <3dquhvnxk5xlmyei6374qmxnveshc62mh5vdemx62krqlqpacq@jrvgdlh6qzdc>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
 <3dquhvnxk5xlmyei6374qmxnveshc62mh5vdemx62krqlqpacq@jrvgdlh6qzdc>
Date: Tue, 12 Dec 2023 11:00:12 +0200
Message-ID: <871qbryew3.fsf@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 12 Dec 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Dec 11, 2023 at 10:19:06PM -0500, Rodrigo Vivi wrote:
> Since you are removing the only user, you will need a __maybe_unused in
> pvc_desc, otherwise it fails to build with W=1. With that added (and
> removed in the next fixup patch),

The xe Makefile should enable W=1 warnings locally; have they fallen
behind?

BR,
Jani.


-- 
Jani Nikula, Intel
