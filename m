Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F58C55ABA
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 14:56:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A3310E20D;
	Wed,  5 Aug 2026 14:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LA1x0ySd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E00910E20D
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785941809; x=1817477809;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=H/iJg2eHdOklMzdfI0oaj/u1jQWeU2959gtTGZx+WDs=;
 b=LA1x0ySdT84vmWdPXss0nlINFcf4uXNSYFVmj3RRI8urNmC6WQAa5UQ8
 TEo9jrx/5kxATMiXznfs6VmdNeXlUecdBw9AkMLy3tFAWeQX2xilUZWrT
 MIw9sI3Bkct10qxQgDjQG/a+Q6fcxh0hDtawC7MytiA3AHVajKicxqQBc
 LFciKKXvwHXFNbiouVcLcBItO021FYkAHKN5297LIf5jPqoGY2vzsLqhn
 7Ji98jzncK9Wk12AVeiElz41VA/tSVdASUEmrSKTRZahfvtYPEiebip3M
 9WJK8KYj6FKfM7TIqC9CrZQ7QC3ZBRVzhLYaPgXn07E0/NbOCRz4kWDvN A==;
X-CSE-ConnectionGUID: OvroHTm3Qoi+D3j/p4xJkg==
X-CSE-MsgGUID: CZIp1wBqT/OdHZInBH6/TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97165975"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="97165975"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 07:56:48 -0700
X-CSE-ConnectionGUID: FI9SpGpIRwuFmZxSVWNWSg==
X-CSE-MsgGUID: JyoE7P8VTlOR7y1zKG6SSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="291765723"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 07:56:46 -0700
Date: Wed, 5 Aug 2026 16:56:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com
Subject: Re: [RFC PATCH 0/7] Add CPER logging support for CRI
Message-ID: <anNPKzA7GXJBla5Z@black.igk.intel.com>
References: <20260702111401.3680214-9-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702111401.3680214-9-badal.nilawar@intel.com>
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

On Thu, Jul 02, 2026 at 04:44:02PM +0530, Badal Nilawar wrote:
> This patch series adds CPER (Common Platform Error Record) logging support
> for Correctable errors reported by Intel Xe GPUs. CPER logging is done
> through trace event.

I had a rough glance and I think this needs to be structured a bit.

1. Introduce a bare minimum emit_cper() which hooks to both correctable and
   uncorrectable error cases.
2. Refactor get_counter() to have a response as its argument and hook it up
   to emit_cper().
3. Introduce Intel CPER structs and all that jazz.
4. Introduce info queue (which is optional, right?) and hook it up to
   emit_cper().
5. Finally introduce trace event for the end user.

Split the patches cleanly if the diff starts to get out of hand and
don't add functions, structs or defines that are not used in that
specific patch.

Raag
