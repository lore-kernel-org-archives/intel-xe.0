Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DC1C02187
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 13:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D228D10E961;
	Thu, 16 Jan 2025 13:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZx7btnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F9010E961
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737034121; x=1768570121;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s9DlBp6SPnvR5iyEU3RjaSaSAqsIgQixW92n6VsVI7E=;
 b=VZx7btnJmKlF61LsE3aCPkVQ4ARRjQj4YbstG79ljrEAwTKYQPoq5ZUv
 D/1tX+am2FtGZWATeq3pR4yur8qf9QW7fYirjF8pQZxUa1EGyA08ZUXt/
 OsZTdbgKknmhjNgzTr2TraRgjvVyEpT+HtUtaXDtP5x4XXbBHR1y6wLou
 6TEHxMQIQjxx5eavdnYlrZbLBxPVi+/T2ppG2n3bhRatw1h36UP48OW4E
 O2POJ8MG07HIiCtMlRqoCtRKSbR3AaAS3sXaHoLWOMKQVI7ZSts17fYGb
 +4eZSKrosrBhoi0ODBz39GieK4yBC2h9ZFhgTvPvEpn8bFcpq5PPbzg39 g==;
X-CSE-ConnectionGUID: qK1c9NloRRalC/Nn21bC0A==
X-CSE-MsgGUID: HbT7Y20CRbucxsxBs2zjfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37574288"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="37574288"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:28:40 -0800
X-CSE-ConnectionGUID: Ypj6R5ogTJaKiArSkxWNxA==
X-CSE-MsgGUID: GSdQ4r1KRVK5Yi2VF+rtiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="110472847"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 05:28:39 -0800
Date: Thu, 16 Jan 2025 15:28:36 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.d.roper@intel.com
Subject: Re: [PATCH 1/2] drm/xe: Refactor dma_mask_size
Message-ID: <Z4kJhOH5Pp_LqTk8@black.fi.intel.com>
References: <20250116125447.4025927-1-sai.teja.pottumuttu@intel.com>
 <20250116125447.4025927-2-sai.teja.pottumuttu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116125447.4025927-2-sai.teja.pottumuttu@intel.com>
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

On Thu, Jan 16, 2025 at 06:24:46PM +0530, Sai Teja Pottumuttu wrote:
> dma_mask_size is more related to the platform than the GT IP.

Nit: Unless there's uncertainty intended here, I'd drop 'more' and
make it definitive.

Raag
