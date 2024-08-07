Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B01C52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 09:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AC710E093;
	Wed,  7 Aug 2024 09:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NspMn6dr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEEE10E093
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723023279; x=1754559279;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fuHsjJKg+ovWvavZu5Y93h/ml1lz2r2VGZ2uhytyapo=;
 b=NspMn6drlg8g9uUx13AluB5eF5PBjtPx0/vfvpyVSJmQoMntbnp1/umB
 q0QqDH+Te3TQ4s3ZGKQY55iXvcv7ZlsAM9Kgut0KoGwO3JwGkasYgs3dp
 EvMecnJ5EcLnRYq/Aen9QXRdT+TaYI7EagFfEQwm94a64q3y7VUlsmPDJ
 OjUqdKSWjCFbT3y+r4RFtCP4s3kqG3xc3IxLuZJ+h/uLKdTtT/owmBDTf
 r2HcEp5GAyFSQM36VYFAE3LmeK6jKianQD56f68eb3dYgm5leNmfEwWaT
 4AqXwXT2QE33CGi2QgywicstDYFvQRzAEENkZ/ymjHdxvvzNbfmE2CR/3 A==;
X-CSE-ConnectionGUID: 5XB5NNPCRYuj43Un1EMz+w==
X-CSE-MsgGUID: 9kSJWjJ4QuCvJRRNPVpT9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21224894"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="21224894"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 02:34:39 -0700
X-CSE-ConnectionGUID: teLpK8mBSWOkK6gobxV42Q==
X-CSE-MsgGUID: gbqJS73gQo+4sHVJQy8o2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; d="scan'208";a="56763886"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.66])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 02:34:36 -0700
Date: Wed, 7 Aug 2024 11:34:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/21] drm/xe/eudebug: Introduce eudebug support
Message-ID: <20240807093433.rlvwfsp57qczf4yh@zkempczy-mobl2>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
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

On Fri, Jul 26, 2024 at 05:08:00PM +0300, Mika Kuoppala wrote:

<cut>

> +
> +static int
> +xe_eudebug_attach(struct xe_device *xe, struct xe_eudebug *d,
> +		  const pid_t pid_nr)
> +{
> +	struct task_struct *target;
> +	struct xe_eudebug *iter;
> +	kuid_t uid = current_uid();
> +	int ret = 0;
> +
> +	target = find_get_target(pid_nr);
> +	if (!target)
> +		return -ENOENT;

This goes outside and is returned via ioctl() what reminds me some LKML
thread this code is reserved for file operations only.

--
Zbigniew

