Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DEBC02183
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 14:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD69C10E6ED;
	Wed, 15 Jan 2025 14:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVhd1PsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B99910E6ED
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736951844; x=1768487844;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ang6N3nmtBPdm/3OUz5quBwADULbJNx7WEJJZT5mFbU=;
 b=YVhd1PsWeB8wKVsSCjLN7K0B+/1Ncg+b0TlMiB2V1kROe2iZLJnQj244
 KknFEO/RvTkG+YFqlQhePfkBE8KOjQNMw4gKAcmZBkfZXq4ObTjQvnnwP
 1m94ccsRn7irSkBzbIZyLVJ771Bd0bXi6JHVNw85zEU6KCMX/itKdFEzg
 EdevvG13otGSnWHKaN2br18MQpTWOeQERIUPq2Gdk1ItdnhtDai3zv5zi
 AxNYtyiic6POXa9+7DI5IORGB6ps1mJ8QMInH6/3JFU6YUp+nThdsGZN1
 FkCJ4mUbynpWIzdB2iX2dPz2rCg2AmCAQPxMDv2Net7Q0lfmApeSA0B8U A==;
X-CSE-ConnectionGUID: BeEwvkO1RhOS731HboCWhA==
X-CSE-MsgGUID: lvEReOkQTg+6pA2U/dhaHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37208326"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="37208326"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:37:23 -0800
X-CSE-ConnectionGUID: CET3ntIJRzKrjw+TUXnr2g==
X-CSE-MsgGUID: WtEzDumvSH+9z6X7CS6tpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136010147"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.108.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:37:23 -0800
Date: Wed, 15 Jan 2025 08:37:23 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/xe: Fix sort order of .o lists in Makefile
Message-ID: <stzjlllg3qf5htqh7atli2olbvq2obymzn2sm2ebe4up26mseg@6ju42h5pqoeg>
References: <20250115140812.20799-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250115140812.20799-1-gustavo.sousa@intel.com>
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

On Wed, Jan 15, 2025 at 11:08:04AM -0300, Gustavo Sousa wrote:
>The Makefile for xe asks us to keep the lists of object files sorted:
>
>  # Please keep these build lists sorted!
>
>Reshuffle the lists into the correct sort order. That was done by
>filtering each unsorted list through 'LC_ALL=C sort'.
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
