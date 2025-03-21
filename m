Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E97C36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 12:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8736E10E7B4;
	Fri, 21 Mar 2025 12:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VseY452S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8881110E7B4
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 12:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742560125; x=1774096125;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=gNsRE2V/SU1r89AO09oycjbIjwT5VftFnHe4IkNS0lM=;
 b=VseY452S+LSv6RVM3djiMRxjbBZ2lSDEgwOW86xGZlwDotoNrLos9IJY
 y0EconnwjC4OiDei+DHyiGqc6AkHe0EO3Ulp+9Qi4UHQeC86oBkS1e48+
 rBcbhgYbTIL4c8tr/1DiuputCbOrSfayoZtuNgLfp+oYJkoF9SFWo67yB
 GGlL153aRr2fIFRABE/HwXeDoFSFlP/739Zy1ObBNhFWp+G8NTERp9KQA
 E8HWXzgh/DrV4CCHDLnMMWlYOxIXfLCq05AoplGBodoXtrQ9ValtPkkT1
 Q2jGVoxf7iZR2A4IxRFxMfggvi+5cxW4IM3WbIEkW7UEr7l1vNujOLC5J Q==;
X-CSE-ConnectionGUID: ILSGI7rqQZyvzOLwvRiDCw==
X-CSE-MsgGUID: W6XJEY3eSriCA0EqKUXARA==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54459017"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="54459017"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:28:45 -0700
X-CSE-ConnectionGUID: DBJNK3fvSpS3WjBs/BVSUg==
X-CSE-MsgGUID: ZtKgWNYBTkadH6ixgrCf8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123848686"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.56])
 ([10.245.245.56])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 05:28:45 -0700
Message-ID: <3fa25f8b-c723-445c-9d05-73059cbbab67@intel.com>
Date: Fri, 21 Mar 2025 12:28:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Simplify pinned bo iteration
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250321112959.13037-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250321112959.13037-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 21/03/2025 11:29, Thomas Hellström wrote:
> Introduce and use a helper to iterate over the various pinned bo lists.
> There are a couple of slight functional changes:
> 
> 1) GGTT maps are now performed with the bo locked.
> 2) If the per-bo callback fails, keep the bo on the original list.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Ignoring the external_vram hunk,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
