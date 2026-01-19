Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFD0D29C36
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 15:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9386A10E215;
	Mon, 19 Jan 2026 15:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSV8jNPF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8425010E215
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 15:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768835384; x=1800371384;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Q2N42fg4ImBjgiXXBeBlf0z5loLMhudAfvLVUNFNSFA=;
 b=MSV8jNPFa06+jbsyzwxBzaU/qoiwhOdXTb4aDUzeHxcAfMgENA+RAxUe
 daJSnV5rD3OzvuHUXSY7GpHdzl//t1dF5LUJc2EuCzzviRaGZMCJlS+1s
 RiV1K6iA74AYGN9hV62ePhW6cYdxtaDXohg0DjcHPI+xDaprj2TIl5jFg
 GhOqrdKgidiDVeZJDCFKsc8ru77Mua+XdlP3Hd6G+bbM2LQBybuHkk+gl
 RxdRhdYf6lXcpQj3AjufbRC3nuMWDXFU/hec3bLqp1FZfyDt3UIDMDZTn
 P92aBR5LIVSdr7b2XE5ZfmI5xsKCkMUtTLNvTJ8BLxE+6A0y52qOGL5oS A==;
X-CSE-ConnectionGUID: cXvlov/oQNu+t5PgpZ2d2Q==
X-CSE-MsgGUID: T1KucwmLT5u+wqxgEttexg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73676047"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="73676047"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:09:44 -0800
X-CSE-ConnectionGUID: 4jnATGR3QkWYFcs4qy22Fg==
X-CSE-MsgGUID: 4UyngVnkSh+FG3AmTxDqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="236562101"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.99])
 ([10.245.244.99])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 07:09:30 -0800
Message-ID: <8932c16e-ab31-493f-bc1a-c540f0ae5d6f@intel.com>
Date: Mon, 19 Jan 2026 15:09:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/uapi: disallow bind queue sharing
To: "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Zhang, Carl" <carl.zhang@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Souza, Jose" <jose.souza@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20251120132727.575986-4-matthew.auld@intel.com>
 <20251120132727.575986-5-matthew.auld@intel.com>
 <fh6dgogrt3ibrod7qkguejy4bj3cmvlbnxksmedhvfx3ejglk2@nu3h6doh7sdx>
 <cc27ae58-b579-4332-9653-c62b38f32add@intel.com>
 <aURm1LgtNPYNxRCP@lstrano-desk.jf.intel.com>
 <PH0PR11MB55798387B824D4101E19545E87A9A@PH0PR11MB5579.namprd11.prod.outlook.com>
 <598d3899-5942-485b-8e76-61bcbdfa5cbe@intel.com>
 <DS7PR11MB6271DDAE76295D9280AB5CD7E788A@DS7PR11MB6271.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <DS7PR11MB6271DDAE76295D9280AB5CD7E788A@DS7PR11MB6271.namprd11.prod.outlook.com>
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

On 19/01/2026 14:14, Mrozek, Michal wrote:
>>> Michal, ping on this from compute POV?
> 
> Compute is not using bind queues.
> PR is ok from compute perspective, even if we started to use those queues we would create a single queue per VM.
> 
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>

Thanks.

