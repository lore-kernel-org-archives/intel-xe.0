Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7B0C61DBC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 07:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876E410E8F0;
	Tue, 25 Aug 2026 07:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B0XQpMjr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3C010E8F0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787643693; x=1819179693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pqrup3IFBPNsy52D6KGNlh2U2xD769wP546ycJAeeiw=;
 b=B0XQpMjrn8nXxbD2k5Z69JLP9yeSbZdKFFZeJQWNx28HbufOTx/UcbU0
 bZLsiD5Wj2kU4KhA/o/TEa4DoG3m+xQaOh+2GjfhxIK3c/+tjv77Ihxpc
 2s4SRWg1oOc10Pq7rRlI8hlQGHj4vUsvA4Ow8Xm+VusEMGX9AUx+NGPRV
 qLn2KMksSZpqchA34tNfpzyNikKKccet9vN4NsCZe//nVg4EEERooIa7P
 RobOnzZPWX1ysZt1IYofHFtxhUWY5wc+bPp5rJygCels4gPVqifGHDLv8
 NLSsjnxWFLjPijBPCKrB0ybdiSE5Ejwd01qd8bVpUL/hv1ynnhDktWvQs Q==;
X-CSE-ConnectionGUID: ZmoWuDyQT5CBjUZ992rUdQ==
X-CSE-MsgGUID: vmqF38dnTJKarSmQH1mmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88306543"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88306543"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:41:32 -0700
X-CSE-ConnectionGUID: dRyIzPsrS9azPB3OjlEZLg==
X-CSE-MsgGUID: gmfhvveFTiCbOKNVsb5U9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263479748"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 00:41:31 -0700
Date: Tue, 25 Aug 2026 09:41:28 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
Message-ID: <ao1HKIZjbV8Z6rZR@black.igk.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-9-raag.jadav@intel.com>
 <20260821113758.006681F000E9@smtp.kernel.org>
 <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>
 <aoyNk9wmOpdyUXgY@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyNk9wmOpdyUXgY@intel.com>
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

On Mon, Aug 24, 2026 at 02:29:39PM -0400, Rodrigo Vivi wrote:
> On Mon, Aug 24, 2026 at 04:30:25PM +0200, Laguna, Lukasz wrote:
> > On 8/21/2026 13:37, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > > - [Critical] Sleeping in atomic context due to `mutex_lock()` in `xe_device_declare_wedged()`.
> > 
> > Already discussed, can be addressed in a follow-up series.
> 
> Why can't this be addressed in this series? I believe this is worse then the
> below case. But I really dislike that we are going further with the mutex
> inside an atomic context only with a promise of fixing this later without
> seeing the code...

Because this is pre-existing issue and we don't sneak in fixes as part of
unrelated features. They need to be sent separately so that they are easier
to backport.

Raag
