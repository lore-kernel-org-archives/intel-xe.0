Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64626FB3CED
	for <intel-xe@archiver.kernel.org>; Mon, 30 Mar 2026 10:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269A110E0D2;
	Mon, 30 Mar 2026 10:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRVB75LX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC38810E0D2
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Mar 2026 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774865876; x=1806401876;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=LfSCOw9qS5dzpBaqx7b0I6BPvalcLQfqNBs7oV4xPCs=;
 b=JRVB75LXaHcpyOS6s2udpstIEAn2EXneb65kvlLjuRim/WI5NcDXPkle
 7AS1UWd1BXrMRr9+2Jq9NecJgyQMML8y0AKVSwzugKCjXJ3Hft6h9xexu
 pIjzalQzFrahJPR4IUq/VPOI3uHuD/rfVUTyVN/+pGUo3S0weUj9AA/5E
 WgWSwbHxf9TP5UiaP80sTyT4dGjTcWcJah8ymdpB8uRnpVYymEMOyyNxO
 7/rWLp8u2uM9VOZrAu2iI59OzcG6S4JNRmweehSFG49TAZiZyiJ8TCJ1d
 gWUCbY8EWXX/AXWdjt3EUQB820qhiGr2UzO0gBGwf197Z02Xgou5Vdazr g==;
X-CSE-ConnectionGUID: Xk3AyKcgRX2x3OUtzt9X7Q==
X-CSE-MsgGUID: 4gN9pWLfS56aKfARUsnd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75750602"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75750602"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 03:17:56 -0700
X-CSE-ConnectionGUID: yXAGxcH9RJuViFXdtHTqhw==
X-CSE-MsgGUID: YjFLwE8yQdKB6IVV6MgUww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="263952973"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 03:17:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/xe: Normalize double-underscore include guards
 to single-underscore
In-Reply-To: <e8dc2c15-e11b-4e2c-a645-04650cda218b@hogyros.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260317215732.2208976-7-shuicheng.lin@intel.com>
 <20260317215732.2208976-12-shuicheng.lin@intel.com>
 <SA3PR11MB81183F59A452BF482C3338C9D052A@SA3PR11MB8118.namprd11.prod.outlook.com>
 <e8dc2c15-e11b-4e2c-a645-04650cda218b@hogyros.de>
Date: Mon, 30 Mar 2026 13:17:50 +0300
Message-ID: <38244de644bab2d58ffd80f2f5d4b3d16940ac98@intel.com>
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

On Mon, 30 Mar 2026, Simon Richter <Simon.Richter@hogyros.de> wrote:
> Hi,
>
>>> Six headers use __XE_<NAME>_H__ (double-underscore prefix and suffix) as
>>> their include guards. Normalize them to the single-underscore _XE_<NAME>_H_
>>> convention used by the rest of the xe codebase.
>
> Single underscore followed by capital letter are reserved identifiers in C.

Well, ackshually...

"All identifiers that begin with an underscore and either an uppercase
letter or another underscore are always reserved for any use."

Even so:

$ git grep "#define __" | wc -l
21278

$ git grep "#define _[A-Z]" | wc -l
17886

The only question here is whether to be consistent or not about the
reserved identifier usage. ;)


BR,
Jani.

-- 
Jani Nikula, Intel
