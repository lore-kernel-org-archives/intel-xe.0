Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69495C369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 13:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF0910E7A4;
	Wed, 30 Apr 2025 13:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rgaw3S6r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4155710E7A4;
 Wed, 30 Apr 2025 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746021073; x=1777557073;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+ldYEvqb+hwZaur+5ZU3Vf/BQL2XMqQNtO4hKxG/Pr4=;
 b=Rgaw3S6ruQ6YXXhgYCye3qq+w2+4LYd4c1nF3ZRRRBesQkTM1/n2oU3S
 arZKSi7shHLJJiLVzlkFsxe6ADMQyk3GITU+STqjmgmPz9weUeabbEKPB
 kI8V7pMPkailpJHphFZpDYJKFYvkO/THPhz62qKCxFMUBjYT2kj6iwDlM
 oqFeUknB/Rl7ZysAyeObiQAjmMIpunK6ssbhM+VQjMNmLAuxZEmkspVKf
 trOdkefZpja9VstvJg8iPzUlRoIW0hSS9anUtJGIS8VFjcDWHXsayiE0h
 4hokNPqzLDuzGJGWD7pEbrPlZnWqd2QBGGuv4e3fGU1IeojxH9CdmFQns w==;
X-CSE-ConnectionGUID: bH2aGuYGRu+p43mN4DURww==
X-CSE-MsgGUID: jH3xx1oXTmuKmkyzyb/c2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="35297143"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="35297143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 06:51:12 -0700
X-CSE-ConnectionGUID: CjlYMQdcRBuDr657SkmKVA==
X-CSE-MsgGUID: abKzfZaSRlqglQ9CjqbPUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="133844232"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 06:51:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Harry Austen <hpausten@protonmail.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3] drm/xe: Allow building as kernel built-in
In-Reply-To: <47kdwkkmejb7ot6qbfvto6heunnosggyn5o76gaaqcjdiviqt7@4h6u3hdxy3jb>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250425115148.12815-1-hpausten@protonmail.com>
 <874iy7w58c.fsf@intel.com>
 <47kdwkkmejb7ot6qbfvto6heunnosggyn5o76gaaqcjdiviqt7@4h6u3hdxy3jb>
Date: Wed, 30 Apr 2025 16:51:06 +0300
Message-ID: <87ecx9vjud.fsf@intel.com>
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

On Wed, 30 Apr 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> I think we really need to start spliting the module and move the
> conflicting symbols.

Start? I've been working on it for more than a year now.

BR,
Jani.

-- 
Jani Nikula, Intel
