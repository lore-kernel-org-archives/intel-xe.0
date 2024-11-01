Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B514CE674A7
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 05:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1EF10E0D1;
	Fri,  1 Nov 2024 05:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ggrr6arG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C88D10E0D1
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 05:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730440080; x=1761976080;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=leqz/2BPRu2JPcJMFHPwDhrsvb3qLo+LuENHV00WYdE=;
 b=Ggrr6arGYo5GJeuuSm78R6zcd9k6RLajSFAq0kunrvEYy3Xtu5RxNAGf
 VFlat0BgdbTC6MzjUKjyqZL6xUAoDLKfunsy4W0wmBZSZl2IhsvjhYE6l
 bLKW94lmFrEOOkRg8y4C4ZSieU0vqj29iLtXSyMZ+PXKlLklcN7T2gYUP
 yURfuBqciA5bNh//aiM4uotZp9EKBka9djJ3CttJawuZRGiBaCpksp9t1
 NVjkMEyREI1Z6aDolGL1jWyGgaR9q/Cqb6WiixSfnoQWOi3zw5cfkAyQH
 3lDLZHpZeSZH29FZvZI45tEufTVxNEq5m+v1zY4hWq2Poq/QR4H+YkJSC A==;
X-CSE-ConnectionGUID: NT2GcNhfT+S6O/xnIeNttA==
X-CSE-MsgGUID: YI6efiiKR5KoBjHZSH5EmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30063457"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30063457"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 22:47:59 -0700
X-CSE-ConnectionGUID: hboW6i6qQb2id+hVEKhPRA==
X-CSE-MsgGUID: M8KnILKZSEqkoiOVZURBnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; d="scan'208";a="87993291"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 22:47:57 -0700
Date: Fri, 1 Nov 2024 07:47:54 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Improve devcoredump documentation
Message-ID: <ZyRrisQfc_59rrK-@black.fi.intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031182916.1441987-2-lucas.demarchi@intel.com>
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

On Thu, Oct 31, 2024 at 11:29:15AM -0700, Lucas De Marchi wrote:

...

> - * Snapshot at hang:
> - * The 'data' file is printed with a drm_printer pointer at devcoredump read
> - * time. For this reason, we need to take snapshots from when the hang has
> - * happened, and not only when the user is reading the file. Otherwise the
> - * information is outdated since the resets might have happened in between.
> + * The following characteristics are observed by xe when creating a device
> + * coredump:
>   *
> - * 'First' failure snapshot:
> - * In general, the first hang is the most critical one since the following hangs
> - * can be a consequence of the initial hang. For this reason we only take the
> - * snapshot of the 'first' failure and ignore subsequent calls of this function,
> - * at least while the coredump device is alive. Dev_coredump has a delayed work
> - * queue that will eventually delete the device and free all the dump
> - * information.
> + * **Snapshot at hang**:
> + *   The 'data' file contains a snapshot of the HW state at the time the hang
> + *   happened. Due to the driver recovering from resets/crashes, it may not
> + *   correspond to the state of when the file is read by userspace.

Does that mean the devcoredump will be present even after a successful recovery?
Perhaps moving the 'release' part to above paragraph will add required context.

> + * **First failure only**:
> + *   In general, the first hang is the most critical one since the following
> + *   hangs can be a consequence of the initial hang. For this reason a snapshot
> + *   is taken only for the first failure. Until the devcoredump is released by
> + *   userspace or kernel, all subsequent hangs do not override the snapshot nor
> + *   create new ones. Devcoredump has a delayed work queue that will eventually
> + *   delete the file node and free all the dump information.

Raag
