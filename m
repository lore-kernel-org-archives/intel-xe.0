Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25460C53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 15:34:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1DA10ECAC;
	Wed, 29 Jul 2026 15:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+KAafDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48C710ECAC
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785339272; x=1816875272;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DcXiM0YjfvTd8FCo+yjKRVGvxoViQMnPMrkLHYDFAQg=;
 b=J+KAafDNqNbp9QIS/KtVonzYPdkPh1qozUEfCYKwTVSsEVotz3cCszQT
 dzDNVaO6b7znr3JPNNRsxkNfNppcmYGd/k5oGz369BpARE6CPjFOX418h
 r9Xeft1tUdM/e8XKDtXP2nbrX81DDFlUkrmm7zO8fDez53tesfe+Hp5Qq
 Vs3n9Sdk77VkzAX4tHjEKo5kbIQFoHaGrCHk517yp/8fV6L1purtMOUVa
 YPcNBODOTXmqBSOETXPwai2IND9/SumWqjrJ9VM3FSd/QuLFyC4zodeZt
 xRPDbKQnwjJ9W83ruSMfD9Z4LYXX4cy0NT+9NUNFLm0pAD0rpYEVHCkub Q==;
X-CSE-ConnectionGUID: nxPfIukLR2q1OGUtFEVorg==
X-CSE-MsgGUID: aQcExwj2QBOswuRDVkNfWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85985050"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85985050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:34:31 -0700
X-CSE-ConnectionGUID: MfVhvtpfR+6oenkZMr0WSA==
X-CSE-MsgGUID: F3eBR584QHSAkKEn1S9pPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263851686"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:34:29 -0700
Date: Wed, 29 Jul 2026 17:34:26 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Ramesh Babu B <ramesh.babu.b@intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v6 3/3] drm/xe/i2c: Keep the i2c controller always enabled
Message-ID: <amodgov-jMqxPiwV@black.igk.intel.com>
References: <20260722133554.2079612-1-heikki.krogerus@linux.intel.com>
 <20260722133554.2079612-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722133554.2079612-4-heikki.krogerus@linux.intel.com>
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

On Wed, Jul 22, 2026 at 03:35:54PM +0200, Heikki Krogerus wrote:
> Some platforms make an assumption that the i2c controller's
> enabled state indicates also the power state of the
> controller. This can create a problem when the controller is
> in disabled state, because the hardware may assume
> incorrectly that it is then also in low-power state.
> 
> To fix this, the controller is kept enabled by taking over
> the IC_ENABLE register. The controller has to be disabled
> when the configuration is updated and when the target
> address or the slave address are assigned, so disabling it
> when IC_CON, IC_TAR or IC_SAR registers are programmed, and
> then re-enabling it again.
> 
> Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

I'll rely on Andy and Mika's disposition on this one.

Raag
