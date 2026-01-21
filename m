Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D033ED26296
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 14:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF4810E7F1;
	Wed, 21 Jan 2026 14:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5lUUbXh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698B610E7F5;
 Wed, 21 Jan 2026 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769005286; x=1800541286;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+Qo+QQsHczHs9cLFHKvwVhnwVQbU2MrgM/vXLXGr2L4=;
 b=M5lUUbXhKOQf/MEbPe0iFOCuAAaWLfdcZ43uZyoyrWkLH58fwczjT7q+
 WlZ521MTvo6117PyxuKDdBPAO/ch/bKEPYA/OvTwdS4+QGkCjT8xls0VG
 4gTyuJFZRwTuYSCeSTUknyyZfh9e4FAzvwGTpzAEBZQopdkZtskdQAVqb
 LFIfB2wmWhFM1vZ8dB3HuTbP9Fy1Q0p8I40osByrcbdvyeSsJ3ExzAjT1
 77kQqgLSMsvEfik/iYgnn2sizEX05thKlcbfZaSwf9H4cPMkycvALbbz+
 ZEqvuMcet2kcwDLlhMYR0GD11v7MKb42SNRJ+9XihnZN0iUTPUcLC6kh2 w==;
X-CSE-ConnectionGUID: aEUt8iGIREC9hA8OetsX+g==
X-CSE-MsgGUID: dvaMkLLnSuik7c1JjhM7Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70136667"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70136667"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:21:26 -0800
X-CSE-ConnectionGUID: 6T8dwqyrTHiOdG7Y8Rm3tw==
X-CSE-MsgGUID: e6Yx7h3yQ6yABaog0N7GGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="237122043"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.119])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 06:21:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Juasheem Sultan <jdsultan@google.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Juasheem Sultan <jdsultan@google.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Manasi Navare <navaremanasi@google.com>, Drew
 Davenport <ddavenport@google.com>, Sean Paul <seanpaul@google.com>
Subject: Re: [RFC PATCH v2 0/2]  Enable seamless boot (fastboot) for PTL
In-Reply-To: <20260120161539.3161533-1-jdsultan@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260120161539.3161533-1-jdsultan@google.com>
Date: Wed, 21 Jan 2026 16:21:19 +0200
Message-ID: <c9f8bef6ee6f2b78072d6919bd6854ad24ce0c7a@intel.com>
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

On Tue, 20 Jan 2026, Juasheem Sultan <jdsultan@google.com> wrote:
> This patch series is the second revision of a series of patches meant
> to add support for seamless framebuffer handoff within the Xe driver.

We've only received this cover letter.

BR,
Jani.


-- 
Jani Nikula, Intel
