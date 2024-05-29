Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72349C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 18:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285211134D8;
	Wed, 29 May 2024 18:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrMJ46s4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE9A1134D8
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 18:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717005705; x=1748541705;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GH1IlaAqV9WUnNmQnbhacoxtJ2wcscO0oLcNkE7pGtw=;
 b=IrMJ46s4ct79rUxLlfN7l1IluntZ1q7VKy/JY5VKK7+ZogRAWAY42fNv
 YMOr5vOZWYzX9P0RgEN/F/cxpmSgoO3ZXWcwozZXzNJeQkLeVypVbOVgm
 PfgyfM19M2/77G6gnmhbK/yVQot1ew0ZSVaJ/le33X1NkrrS2tFSO0uY2
 QAZsOXzWXCeVrN+Kv7zlNta/qjQgUQgmmj6Mc3aGmpqkwu9/K8xAFfPDB
 SgPD83P3LBG/oTA7axgl1RjD7t+ET+VTHpArH1A9f867wCCwdLj8tsFjA
 HKE2oxrXxJODw3XWghT6CPQz/D9WtVv5/MyCkc5LSyNou+M07QGNXhGP8 Q==;
X-CSE-ConnectionGUID: irLHVxNxRbmH/+vqk2IPqA==
X-CSE-MsgGUID: V/3cjSQFQ4aCyUVzdykh6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13276790"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="13276790"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:01:45 -0700
X-CSE-ConnectionGUID: EZj9sWizTUeAP6CehgjXig==
X-CSE-MsgGUID: 8KFNhxiWRYaqz/xq+mgeCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40378833"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.86])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 11:01:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Matt Roper <matthew.d.roper@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/xe: Rename internal vram helper function
In-Reply-To: <ejic5jiiimzbx4f6at2tjin2n4evdpvh6lk4afefgw7vo5vqim@57k4spcjrhpq>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
 <20240527173554.1108-5-michal.wajdeczko@intel.com>
 <20240528213515.GI4990@mdroper-desk1.amr.corp.intel.com>
 <ZlZXaouXdtj852Aq@DUT025-TGLU.fm.intel.com>
 <46164a96-f72c-4991-a41d-eea299540d75@intel.com>
 <87bk4okfb4.fsf@intel.com>
 <c368cc90-2d0f-4e6e-9cdb-8ccef42e2d0d@intel.com>
 <875xuwkcg1.fsf@intel.com>
 <ejic5jiiimzbx4f6at2tjin2n4evdpvh6lk4afefgw7vo5vqim@57k4spcjrhpq>
Date: Wed, 29 May 2024 21:01:57 +0300
Message-ID: <87le3sijje.fsf@intel.com>
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

On Wed, 29 May 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> I very much prefer dropping the prefix for static functions.  If there's
> a clash with a global one, either a) you're including too much b) you
> should use a better name or c) the global one could use a better
> name....

I think all of the a), b), and c) evaluate to true. ;D

But sadly a) and c) are often out of your control, a) due to recursively
transitive includes that end up including the world, and c) simply
because you can't fix the world.

Case in point, commit 35b22649eb41 ("drm/xe: Fix END redefinition").

But then you just fix it, and move on.

> IMO platform prefixes and double underscores that i915 uses are also
> bad:  a compilation unit should abstract it with proper layer of
> separation, otherwise it made a bad abstraction.

No argument there. It's just a lot of legacy.


BR,
Jani.


-- 
Jani Nikula, Intel
