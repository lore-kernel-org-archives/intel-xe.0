Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD57E77188
	for <intel-xe@archiver.kernel.org>; Sat,  4 Jan 2025 05:54:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6069910E0BB;
	Sat,  4 Jan 2025 05:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7iH0pZ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1410E0BB
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Jan 2025 05:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735970094; x=1767506094;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mU6Y/tvZmresrDNOutVUrivD2Q6a+EnL4mT4GWB41hE=;
 b=M7iH0pZ9IhVQt8EygbPAb4ocav7+DVHUEoWywgsZD67Z9H5pKqyBa1Lx
 F+COD+BkfA3/gviLPJyJcYvDrxlW6lD+ZnByezjieIgtoGwRTNLPEfooB
 cfdynSLZfxBaqBCL05fcp8x6gpHi6XR7jnbJZ0/0Tmlj9ajCfe+wZgbDL
 Y/5BYxIEGTZkFSbOvmUjJTJX7Di0YPnFo0JOEfEl32bP+Y/6EALf2CzlS
 FOd6hrAhUBLVAIg7TVHrTJePhnC7DYLXyxJsXDG4cQDMEahaVmcA9/M3h
 k2u35nWbeKbCyfzL6UlM9kKPKejRnf9/NxMoeJGTNql90jQsatxkaL+eu w==;
X-CSE-ConnectionGUID: jPiwlvR8TlqFxrx5nS9mcw==
X-CSE-MsgGUID: vduYBN71SbCXTXhLLXra4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="53620198"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="53620198"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 21:54:53 -0800
X-CSE-ConnectionGUID: l71yKT5HQByxgxNXszgwUw==
X-CSE-MsgGUID: lgYfuBXpSG6Q7YcE8MxMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; d="scan'208";a="106921710"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.22])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 21:54:53 -0800
Date: Fri, 3 Jan 2025 23:54:44 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Remove "graphics tile" from kernel doc
Message-ID: <ce35ttjkdsbo7txlx76pd3ya52as7fc6kqei53ynzlay4bmfvr@7n73xpkz3jqp>
References: <20250103001111.331684-1-lucas.demarchi@intel.com>
 <20250103001111.331684-3-lucas.demarchi@intel.com>
 <Z3c3V5xeqsFoIfTy@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z3c3V5xeqsFoIfTy@lstrano-desk.jf.intel.com>
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

On Thu, Jan 02, 2025 at 05:03:19PM -0800, Matthew Brost wrote:
>On Thu, Jan 02, 2025 at 04:11:11PM -0800, Lucas De Marchi wrote:
>> Avoid using "graphics tile" to refer to GT since it's ambiguous: it's
>> **part** of a tile and there's also "media gt". In several places it's
>> documented as "GT structure", so just follow it.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

both patches applied to drm-xe-next. Thanks for reviewing.

Lucas De Marchi
