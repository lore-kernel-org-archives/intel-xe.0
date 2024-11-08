Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD6AD5C0C1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 12:15:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8325510E325;
	Fri,  8 Nov 2024 12:15:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gGlxumHX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4D010E252;
 Fri,  8 Nov 2024 12:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731068147; x=1762604147;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/rQj33moDKOXP/4JzhjseWODcIQ6uC8/mXTOkGZbCGs=;
 b=gGlxumHXQtPSgvHO2BycWntAAqZD1CpGaYlvsPrLypkm6a+36SLZUBc/
 Ru9HQhqvCpk1LPQ/4vSJh8Gg6e/4cNanmostgT/g39MvwUPxKiljx4qQP
 aGiKeBeLRJN4UOlVAWfP5fdffdYb9uN0C+zdSrGpXS/o8Ekx6PI+V/oNp
 cJtw6I5/uJXRhltLgQ90hU2AtoAG+jswAhlLAkx4bC7CbP+kL29c7oWhY
 zI3ZI/IEtG64Rsqr5smG7rskIfxn/i46RomYKwJy3zkZOKaHqOA2gCIMl
 Fbv39RiuFXOPduvpngdN2Q041juHpsgy2h3FVJjKASgxgZKGWf4NRcDZz Q==;
X-CSE-ConnectionGUID: 80sxXTY7QruI8nhQMyYDdw==
X-CSE-MsgGUID: JVRig688Q/mCqLOWGjDNNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30346836"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="30346836"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 04:15:47 -0800
X-CSE-ConnectionGUID: vO2zUSfHRgyNHRKMqhb4gg==
X-CSE-MsgGUID: oPCST9wpTN+amta7LpthEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; d="scan'208";a="116364798"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 04:15:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>,
 "i915-ci-infra@lists.freedesktop.org" <i915-ci-infra@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: =?utf-8?Q?=E2=9C=97?= CI.BAT: failure for drm/i915/dp: demote
 source OUI read/write failure logging to debug
In-Reply-To: <PH8PR11MB675316C59512CFFF4185190BF25D2@PH8PR11MB6753.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241106162325.4065078-1-jani.nikula@intel.com>
 <173091449754.1418203.1419511222388016206@2413ebb6fbb6>
 <87bjyqf5uk.fsf@intel.com>
 <PH8PR11MB675316C59512CFFF4185190BF25D2@PH8PR11MB6753.namprd11.prod.outlook.com>
Date: Fri, 08 Nov 2024 14:15:41 +0200
Message-ID: <87zfm9exaq.fsf@intel.com>
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

On Fri, 08 Nov 2024, "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com> wrote:
> Addressed failures, Xe PW cannot be re-reported.

Fine, whatever. I just hit re-test in the patchwork UI for both.

BR,
Jani.


-- 
Jani Nikula, Intel
