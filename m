Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CE2C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1883E10F28C;
	Fri, 22 Mar 2024 09:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n51m+FcF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D681510F234
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711101387; x=1742637387;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=sxJ7fBrhwWeuLbfDqql0AwNpaECIV38i0uznO3dF5bY=;
 b=n51m+FcFoZwbN0E0yPCrkUCEaxEVNhX3cUaDkAjSy+iPSpwACocmv4f7
 h5nZLC1kfuiYrjp/+kruarc5K8jDAZwdm12jwdTUOrXPQWfHTwFyZsKsP
 5FoSSKIsXpzGpfi1VmHHqD2ZNeHhEfLI1CD+e41X/ufLwrkZuyVRBvULW
 eIV9Oylb/Q7I+HHBcTsOaYuaiYC3KA/70FTubzR8UV85x9rEKB40t5RB/
 vGx/kzSsLlUbce1OeUGP6sFitp6RnRb3K02U2s59LTheyDcA+V3kR1pA2
 XHCKGV6D32WKd78xe9fkpvMII8GuwDqc4C18KOoIpqxK6e0+qed7FpLYX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9092905"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9092905"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="14821636"
Received: from ghoshsu1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.6])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:56:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v3 0/2] drm/xe : avoid the risky function sprintf
In-Reply-To: <20231207012840.48432-1-krishnaiah.bommu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231207012840.48432-1-krishnaiah.bommu@intel.com>
Date: Fri, 22 Mar 2024 11:56:20 +0200
Message-ID: <87il1elhdn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 07 Dec 2023, Bommu Krishnaiah <krishnaiah.bommu@intel.com> wrote:
> These errors were highlighted by Static analyzer. Used snprintf instead o=
f sprint.
> Static analyzer Reported "Calling risky function (DC.STRING_BUFFER)=E2=80=
=9D

Date: Thu, 07 Dec 2023 06:58:38 +0530

Please fix the clock on your machine.

BR,
Jani.

c
--=20
Jani Nikula, Intel
