Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBE2E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 15:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE0310E3B4;
	Tue, 10 Dec 2024 15:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bub01TV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238D110E908
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 15:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733846228; x=1765382228;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sWOFRjPW8QXYbvamBFzs/unUXnD2C3ltWD5ISgOZAD8=;
 b=Bub01TV6x13xV+qsB1DtpYUorUjMHdDhkEbnFeXm4Gh6fKuUimDIxzyb
 cQGiEZOBMqjsi2rqltwlVoIX6caG3UmLZjgfi3YbueGP/YTAUJNBjADkH
 XxT7vrY8TUoXWvdhf13aFJFzT/6ADlZ/gXkXBcBdYUjmWjZ/E1r+x1Spf
 GtDiTAYwabGCE3vN+o/vFuZL6FYLQEfH4Ca5i+QzBojLZcRC48IvyA/oE
 5MkEejFDNDm2WWdAU2JSXk6xD5/eRe7R6wmgmt29om0VaLxn89YGGMIEX
 C4ecuGnnH83R3OU87bTkb9n7QwlJE9ec8fFVkH72hHuuCfK2Po3evr86i w==;
X-CSE-ConnectionGUID: q0dIVen4TN2qBa2MTFdvdQ==
X-CSE-MsgGUID: D7gm296QT0KQTkqNfh36pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44869341"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="44869341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:57:07 -0800
X-CSE-ConnectionGUID: uZ0XZ2NGS8O9suuVwW7ANw==
X-CSE-MsgGUID: Mi2UjCvETSWmNbL5nyik9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; d="scan'208";a="95920554"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.171])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 07:57:07 -0800
Date: Tue, 10 Dec 2024 07:57:02 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maciej Patelczyk <maciej.patelczyk@intel.com>
Cc: intel-xe@lists.freedesktop.org, niranjana.vishwanathapura@intel.com, 
 raag.jadav@intel.com
Subject: Re: [PATCH v2 2/2] drm/xe: make change ccs_mode a synchronous action
Message-ID: <7qhfvfkurgmx4kkr2obhzoly2vedqurgtgwlp7wutlsqkcbrmb@eyasvrxog6uw>
References: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
 <20241210143748.1417098-3-maciej.patelczyk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20241210143748.1417098-3-maciej.patelczyk@intel.com>
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

On Tue, Dec 10, 2024 at 03:37:48PM +0100, Maciej Patelczyk wrote:
>If ccs_mode is being modified via
>   /sys/class/drm/cardX/device/tileY/gtY/ccs_mode
>the asynchronous reset is triggered and the write returns immediately.
>
>With that some test receive false information about number of CCS engines
>or even fail if they proceed without delay after changing the ccs_mode.
>
>Changing the ccs_mode change from async to sync to prevent failures in
>tests.
>
>Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
