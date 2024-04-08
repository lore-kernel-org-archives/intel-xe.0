Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763EACD1296
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 19:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E191C10EE26;
	Mon,  8 Apr 2024 19:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tn/4tZlC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB77C10EE26
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 19:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712605033; x=1744141033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4GYdEl83W3VmkPo+PBQdPl+pVE+z6f7cLIMvpaIkZbo=;
 b=Tn/4tZlC2HCZaARvwSVFgE2NG1GPzHjCYYRUvh8HxOaGMK5dWEQ16RQk
 TpMS01duaC8sF2nlcl3Lw6G0H8eDz4BLzjlpvltf3HNZ9BsUscQg6KKo4
 +9+N+pav0Ut1pipydVFehISUQHFALJXeSGAoHcbVcDzEsy00xz+0qE2/w
 jUmEro0MFdrqKeDzbpyiwPS/h7yxQ6O9YfVtdmQJbGWnCJbRPW69GVxJN
 0pdv7irUjgp+fYpWtOd2/Os+tCT1EMC6MhrBqMeh29Q+ojC7H/bEgJeAw
 Sg+j2aeZiCSMt+HhJvYPxBbKA8caxyqCs/Le7DjFTP4ZsYzI7giVaN5IJ A==;
X-CSE-ConnectionGUID: 6a/9NmlXRdeLMyVyAi0DEg==
X-CSE-MsgGUID: ofED4vOvQDWhO322WjgZyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33305696"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="33305696"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:37:13 -0700
X-CSE-ConnectionGUID: aP2TUdoPSryulPxcIPIpeA==
X-CSE-MsgGUID: YzUV0H8mT4+94qKMSQewFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="20113380"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:37:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Mateusz Jablonski <mateusz.jablonski@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3] drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and
 VM_BIND_FLAG_IMMEDIATE
Date: Mon,  8 Apr 2024 12:37:54 -0700
Message-ID: <171260506207.2541887.13829057815631662337.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124403.7-1-francois.dugast@intel.com>
References: <20240329124403.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 29 Mar 2024 12:44:03 +0000, Francois Dugast wrote:
> The commit 84a1ed5e6756 ("drm/xe/uapi: Remove unused flags") is partially
> reverted. At the time, flags not used by user space were removed during
> cleanup. Some flags now needed by the compute runtime are brought back in
> this commit:
> - DRM_XE_VM_BIND_FLAG_READONLY is used to write protect kernel ISA thus
> preventing accidental overwrites.
> - DRM_XE_VM_BIND_FLAG_IMMEDIATE is used to trigger mapping at the time of
> binding in order to prevent faulting at execution time.
> 
> [...]

Applied, thanks!

[1/1] drm/xe/uapi: Restore flags VM_BIND_FLAG_READONLY and VM_BIND_FLAG_IMMEDIATE
      commit: 31ced035ecde7b24aef57c3c4b85bbc3283c81f2

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
