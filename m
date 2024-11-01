Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC8CE674A6
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 05:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C4810E0D1;
	Fri,  1 Nov 2024 05:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BYhtyIWh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B20110E0D1
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 05:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730440203; x=1761976203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1io0Y0XACQ6ydQ0JR+SsZ9P297QJL86pU7ZJiylAzXs=;
 b=BYhtyIWha4k+otIgJ/M7v1YfPivrqC8WOurWC77dEVXcTfCL4hovY6f9
 L99bEQjjoIcFetesuxHFZcGKPRbUNWwDuKYjcaFrq32ytuhauEoPe8KCP
 f8vBdgs9xbzRSlVPtth9tNYNlMOXNg1w6/8A5nEIvaFbolTYh859M+2GR
 DLFtPLebT3t1Sekzgnu6220/oJ7Q2rmohl7MjgyI1s4hAUC1ruvI/eeCw
 mDDRvnbU8P3rbEeI0a4cEEfihqV+i+xkHrGWPKYhpmOzzYsO0q8AOGmUD
 eRyXxMR5cL+BGEI9YsFjol+h3erqpslLPjaRq3UsRhJnq1CJnIyzuXKOT A==;
X-CSE-ConnectionGUID: 0ntnKRmFQjavG/yC0Mtl2Q==
X-CSE-MsgGUID: C4iFzG3aQySX9p8v0v2QoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="30316276"
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; d="scan'208";a="30316276"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 22:50:03 -0700
X-CSE-ConnectionGUID: OzY2CfrqREODIMLltA8fxQ==
X-CSE-MsgGUID: wwc1YxR5QnuY/oEBRh8+wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,248,1725346800"; d="scan'208";a="83297660"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 22:50:00 -0700
Date: Fri, 1 Nov 2024 07:49:57 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH 0/2] drm/xe: devcoredump documentation
Message-ID: <ZyRsBZ1hl8zg2voX@black.fi.intel.com>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031182916.1441987-1-lucas.demarchi@intel.com>
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

On Thu, Oct 31, 2024 at 11:29:14AM -0700, Lucas De Marchi wrote:
> Improve our kernel-doc and wire it up to the documentation.
> 
> Lucas De Marchi (2):
>   drm/xe: Improve devcoredump documentation
>   drm/xe: Wire up devcoredump in documentation

For the series,

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
