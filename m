Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DD8C677C4
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 11:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983EE10E61F;
	Wed, 11 Jun 2025 11:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDRyYQ7T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D0D10E635
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749639754; x=1781175754;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3OyV5WY4Hk7eNtm+MdB/+B8SJ279BQsSyfrm09iazgk=;
 b=EDRyYQ7TuhLVjSQjSXWma2lOl71xTSMZeJKGc6FhlCoyvj7raVtALbwf
 TRKEK6lva8k66pE7TYXp+8TPrO9cJMca805/eQPTYHF526v/RY0qLM11K
 RM25lpu5OymKFPrtYikZanNdo0i5Ok5lHgqV377ZhFp+LwGDht3SdszJx
 oyQjUk9TSL6EOvb/oPDCW4e+g7IaK36HYKO02IgGF7bCLGNYTykRAslQI
 j7DMfuipcqDUltugd+FhQxDLNBoSBsorENY9DwHns0f2q/TzrR0Ce8+cL
 hHCcbfx3lfgdd13rSM1gWvoj51d4FVMItscSXjYlUvoDao4vlARMvxNXt A==;
X-CSE-ConnectionGUID: PHSU2bbhR7Kvbc+/S4YmDg==
X-CSE-MsgGUID: VYo3qdmlQoC1vgQsQFMa0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62815372"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="62815372"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:02:34 -0700
X-CSE-ConnectionGUID: kYlS5Z8TS+WaKEO7dNgmGw==
X-CSE-MsgGUID: beXAJlVRQeWWE7oyiL2dEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="178071975"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.209])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 04:02:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH] Revert "drm/xe/display: use xe->display to decide
 whether to do anything"
In-Reply-To: <IA0PR11MB718568265F56A8EC2FC009B1F875A@IA0PR11MB7185.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250605054247.386633-1-vivek.kasireddy@intel.com>
 <fc535785263b34ee08802dba3a451fb99469ca58@intel.com>
 <27e47fe60426f4ae41e405cc9eb9ac059ddfb79f@intel.com>
 <IA0PR11MB718568265F56A8EC2FC009B1F875A@IA0PR11MB7185.namprd11.prod.outlook.com>
Date: Wed, 11 Jun 2025 14:02:28 +0300
Message-ID: <5f874ab8a2469bfd08addeb441e98e4462b67111@intel.com>
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

On Wed, 11 Jun 2025, "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote:
> I do not have commit access to drm-intel-next. So, I guess either you
> or Matt would need to merge it.

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.


-- 
Jani Nikula, Intel
