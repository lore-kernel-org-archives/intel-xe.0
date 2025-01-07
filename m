Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA6FE77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 14:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E81610EAD8;
	Tue,  7 Jan 2025 14:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQBhocKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F24A10EAD8
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736260872; x=1767796872;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i4yCzRFAm1JB8ylyDPFK+HZtQY6LZ2nwBpyJp2Pyag4=;
 b=lQBhocKpQvHW8D49bOTAkaHpXSpIc3ERAuIe+DK35mZgdjhWHe5A0+Zd
 LgyrtiX+sB4/+ZE+hrHEfwcEy07lPBEndkcgXLlUXqxI491b5QJg/HMg/
 tTF0Pz44IdQvaqBlfGpJfWfonwH0k0oN0KgLdaKEnlyGqLeR2/BOUPZzs
 e1RP09W9Y0Od4T3TJEl20lLdvuZij6H3t1JC/K/UKtXpcqPQ+QKGW7EUV
 TvCQbQNFfnr+LckoXYnHlXPeZqeXOCiA0nhBhQXT6dJN8QPRKrwRSUCmF
 mY1NFojGKAl44E9ff25+8AjMMdhYEyERQRZt0SH890ul1/SUrqJz4kOiB Q==;
X-CSE-ConnectionGUID: eIIjXfz3Q+eAmdhTPYRw4g==
X-CSE-MsgGUID: 1sCyrZF8T/uVNImryNe6lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36326774"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36326774"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:41:12 -0800
X-CSE-ConnectionGUID: 12x4JhYBTduIuDnypvja4Q==
X-CSE-MsgGUID: LiO/sbzCRDi2ogTJpAWI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103640685"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.112])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:41:11 -0800
Date: Tue, 7 Jan 2025 15:41:07 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org, nirmoy.das@intel.com
Subject: Re: [PATCH v1 1/1] drm/xe: Fix all typos in xe
Message-ID: <Z309A3L3cb1xrroB@ashyti-mobl2.lan>
References: <20250106102646.1400146-1-nitin.r.gote@intel.com>
 <20250106102646.1400146-2-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106102646.1400146-2-nitin.r.gote@intel.com>
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

Hi Nitin,

On Mon, Jan 06, 2025 at 03:56:46PM +0530, Nitin Gote wrote:
> fix all typos in files of xe, reported by codespell tool.
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
