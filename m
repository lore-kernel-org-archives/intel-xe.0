Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B7C28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 09:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7158910E73D;
	Wed, 12 Mar 2025 09:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMJwRAAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151710E73D
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Mar 2025 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741772993; x=1773308993;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=8MGj3FCz2BI2ypuk2bNsEtxj69Ig2vL96CkYNRljeig=;
 b=eMJwRAAr4WBkQr80vgqaEjwfk9DeT8T+t/USTy6yaivOQQN9YXmBDd5T
 rGtyH54rB/3zG+l7QkzLdBhNKnBhm8heCd5+aq4j88jMiT5kfJnB66/Cs
 uxc707x6LMMxRtrRug8mmZHwMIinVGKhfkrCjeWLBZU/lqbgbvq7BUWXF
 8zciWSDPA4DCxUI2uevZvSzLI5FsFRtcRlGLTmm12MQm/bSD14F3F6qfx
 dGv0s7IHaitCC8iqJ8AtH6phcrRnrf4X7tchtC4fxiiBcQ+bFw0dCX21y
 +PyprVZCTBhbFaLD1ths2qAXGDsw7RzCRew4BwJbEe4RX/kXLV5QnSOs6 Q==;
X-CSE-ConnectionGUID: 6h6YJ5K/R6S8b4XHfKzW5Q==
X-CSE-MsgGUID: GG7VMZ7zSKyt927Gn1b+dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42951200"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42951200"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:49:53 -0700
X-CSE-ConnectionGUID: 98oKKBEcQm+PygTBNYGR2Q==
X-CSE-MsgGUID: H6dY9onHTJSZQby93Ck6hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125651085"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.75])
 ([10.245.245.75])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:49:51 -0700
Message-ID: <c65c1209-7a1b-4a83-a299-856db2617e3d@intel.com>
Date: Wed, 12 Mar 2025 09:49:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use local fence in error path of xe_migrate_clear
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20250311182915.3606291-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250311182915.3606291-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11/03/2025 18:29, Matthew Brost wrote:
> The intent of the error path in xe_migrate_clear is to wait on locally
> generated fence and then return. The code is waiting on m->fence which
> could be the local fence but this is only stable under the job mutex
> leading to a possible UAF. Fix code to wait on local fence.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>Reviewed-by: Matthew Auld <matthew.auld@intel.com>

