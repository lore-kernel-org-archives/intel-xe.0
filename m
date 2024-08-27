Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56ABC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 07:49:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830A210E18F;
	Tue, 27 Aug 2024 07:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7hlfHvQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7993410E18F
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 07:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724744959; x=1756280959;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vETJGvzhIemX45AVLbMpjUie8bOGcKzLItIWP0WWdkU=;
 b=b7hlfHvQnKZN5wN4go5L9MLf6NQYwgtTsdIcotPzyRYCb+PvdIceRrmp
 Yb5282OoelQsXeU/EuZE+cEvDTaRE51+o+PbULLui1acCkd/EJjPpjgXV
 mL5GaKr16aewq7rhacnky+R/3a4ZtbrucxlsBBANcDePMR5v2ra7MYNH9
 e1BqiLfP39L9KvCLwT4ZOwPfRpJbmayDb/KeauGH2B3i2lfmtX5YvaFiW
 eJmDpGok1uTxROtvmTj3qwqLcuUQdLIfVKNJb1z8lrBx9LzLqrOiDusce
 7OInmuS6LJX6rZWa0YQrLVkbmTOGa9VuzoPRdjehPhFWZQkpsCz4zOo6V w==;
X-CSE-ConnectionGUID: GPQv35fEQuSaSBYyM7Ni4Q==
X-CSE-MsgGUID: psiqEirjRMyz9n//DzUZIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26105258"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="26105258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 00:49:18 -0700
X-CSE-ConnectionGUID: 9/r1IN+4RiCE+KDaCrK0Ig==
X-CSE-MsgGUID: RnWFq8PPSHSXpIE+dNyxKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="67116596"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 00:49:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/lnl: Drop force_probe requirement
In-Reply-To: <172473996201.1677393.11744348549360173487.b4-ty@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240822224615.793540-1-lucas.demarchi@intel.com>
 <172473996201.1677393.11744348549360173487.b4-ty@intel.com>
Date: Tue, 27 Aug 2024 10:49:13 +0300
Message-ID: <877cc21k3q.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 26 Aug 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, 22 Aug 2024 15:46:15 -0700, Lucas De Marchi wrote:
>> Lunar Lake has been usable for a while in a desktop setup. Bugs are
>> sporadically showing up in CI, but being promptly fixed. Nothing very
>> concerning.
>> 
>> All the uapi changes related to fundamental platform usage have been
>> finalized.
>> 
>> [...]
>
> Applied, thanks for the reviews.

The patch and commit message are all business, but this does mark the
first platform actually supported by the xe driver! Yay!

BR,
Jani.


-- 
Jani Nikula, Intel
