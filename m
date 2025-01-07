Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104C5E77198
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 14:35:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D102510E709;
	Tue,  7 Jan 2025 14:35:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EPBLTZzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF8910E709
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736260557; x=1767796557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=skWouy9mEv9fCVxBdreln0zmHq7ZL+AQmbz3qxzgCp0=;
 b=EPBLTZzFiApRSi0tA9ELlswYEgIdHctbb8G1yO2nu3c/OvMcWIrZSfy6
 2GnjMuuYjt6Xvs5WkDP6z/a9rnXjmd8SpPKB2lcnIQu/6XT4HM0NUyVVS
 sIn3Eiee1l+J/lQHDwfxGLVIWgj+SL5kQ52QGSGFfOP+c5LqREepdi/We
 EYmSxYkwnb0nb5vr9bx0lQfqrXpxEawQHJO8BUuurnten4PYzZUdYenw6
 rDfceUajlad/TSQusVV9jgur4ZZUBM7GNCFwqrx8kzMqEvbiTYj4KUGe/
 4berWRqoM0UZ7hVMa604wLpnpMfwCfwNZ6YLSK+25Lm/Gr/csBy4TXpOw g==;
X-CSE-ConnectionGUID: uW+PipgtR6CfML8stAsY8w==
X-CSE-MsgGUID: rd4bOy+FQqCwkwpSXEgy1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36326258"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36326258"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:35:57 -0800
X-CSE-ConnectionGUID: I0gQU6pMTrup+RsdyI/g8w==
X-CSE-MsgGUID: c5HexrupSa2xFc+btoC03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107873934"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.112])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 06:35:55 -0800
Date: Tue, 7 Jan 2025 15:35:52 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org, nirmoy.das@intel.com
Subject: Re: [PATCH v1 0/1] drm/xe: Fix all typos in xe
Message-ID: <Z307yNqQoz7ZCM2K@ashyti-mobl2.lan>
References: <20250106102646.1400146-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106102646.1400146-1-nitin.r.gote@intel.com>
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

On Mon, Jan 06, 2025 at 03:56:45PM +0530, Nitin Gote wrote:
> fix all typos in files of xe, reported by codespell tool.
> 
> Nitin Gote (1):
>   drm/xe: Fix all typos under xe

for a single patch you don't really need a cover letter, but it's
not forbidden, though. Up to you.

Andi
