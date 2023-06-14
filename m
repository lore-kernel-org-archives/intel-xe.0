Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9F1EB64DB
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 10:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E01D10E438;
	Wed, 14 Jun 2023 10:07:05 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C0910E438
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 10:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686737222; x=1718273222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9e91b5E6uynwWaDcN4eNaN06VfGRCwfw3Dl3stDd9YM=;
 b=OCJEENlhXnLj/vPD5fUMD/dp67Tl8lojuR9nYjgPAGfdi5c6l3d58ygc
 K/IivEExtoxfl32XsvgzLB4QwtX+9sonccxwjkSSDXEu9CkxJd+mQXALg
 Lh/IKJaDEnCFhW8e5dc8e/p4Zu8QtsiLM91DAf+GQQuOW2Nz/pPF7a7+j
 UwP/qFU5Cqj2E9NxSsHXR5kIv3S2fHt93kROwQrh3diLVTSNHzgM9fXCM
 CsJxu5nllrczM8nCcC4n/6q+TfNXLQ2EDugCeyhmvYnzNFfiFlkUayLh+
 x1A3JIbc0mWj68pD6Y+FDpK9e79BQPBRitoh2afev/Ze1RBVIuFUIm9lt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="444943831"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="444943831"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 03:07:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="715132504"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="715132504"
Received: from jrowe2-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.44.185])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 03:06:58 -0700
Date: Wed, 14 Jun 2023 12:06:56 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Message-ID: <ZImRQGUD3ECseBqN@ashyti-mobl2.lan>
References: <20230613084721.3698818-1-riana.tauro@intel.com>
 <20230613084721.3698818-2-riana.tauro@intel.com>
 <ZImQSlvLphPOU5RW@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZImQSlvLphPOU5RW@ashyti-mobl2.lan>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: add a new sysfs directory for
 gtidle properties
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
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Riana,

[...]

> > +	sprintf(gtidle->name, "gt%d-rc\n", gt->info.id);
> > +	/* Multiplier for  RC6 Residency counter in units of 1.28us */
> > +	gtidle->residency_multiplier = 1280;
> > +	gtidle->idle_residency = xe_guc_pc_rc6_residency;
> > +	gtidle->idle_status = xe_guc_pc_rc_status;
> 
> why are we saving "xe_guc_pc_rc_status" and
> "xe_guc_pc_rc6_residency" inside gtidle? What are the
> alternatives? Why can't we call them directly?

OK... I see in the next patch that you have added Meteor Lake
specific functions.

Andi
