Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA9CFA3723
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 07:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D069710E8E2;
	Fri, 13 Sep 2024 07:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgbQVL86";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2187810E0BF
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Sep 2024 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726212387; x=1757748387;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=M18O+TAJcVGQ1qQwsJPU3N7SIrBUQQN9REN1uQLo2rQ=;
 b=KgbQVL86Dz3eVyWtWpEdeSMC7oiPykZ978fCXBWFNxrac34JEACKFWCT
 ZkDCnBCGx9MKgZ+blqqw88ArmVZ84hnyW4eO+5a8n7R1Gce2OY1TaOG/e
 gqj8olnWamAGLHJ1zM6A8qIGOeDNiQFMGH17AN5GoRG5qmyQ6VyXuhzQP
 KejWJUKBlkDrqoNbvfznaTPbgTA3D1QIMGvdo2hKozBzWzaPADVzziMAo
 vqCR+pMQop7bNHd6pg5lzYwmsbsY7OTimugydDkwZQXsZfRrpW6lbSHXN
 BM++YnX1jBpUcIOFGL9PGO6yxW90Dx1ESkgtI4Q3Jroq013hQofQ2KigT A==;
X-CSE-ConnectionGUID: qohC9QqrQVS9e4cLHWXJZA==
X-CSE-MsgGUID: PTUwus/TRyiCjLRQlXCmLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28844490"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="28844490"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 00:26:27 -0700
X-CSE-ConnectionGUID: Gi26oyY3Rv64Iz1wPmAWQw==
X-CSE-MsgGUID: lL0AU1XPRc6KGcQtpSA6uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="68275903"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.64])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 00:26:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>, Intel-Xe@Lists.FreeDesktop.Org
Subject: Re: [PATCH v7 00/10] drm/xe/guc: Improve GuC log dumping and add to
 devcoredump
In-Reply-To: <b292e3a5-9291-41f2-bba1-ae87b17bd5a7@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <877cbhi64e.fsf@intel.com>
 <b292e3a5-9291-41f2-bba1-ae87b17bd5a7@intel.com>
Date: Fri, 13 Sep 2024 10:26:21 +0300
Message-ID: <87wmjgdnfm.fsf@intel.com>
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

On Thu, 12 Sep 2024, John Harrison <john.c.harrison@intel.com> wrote:
> On 9/12/2024 02:16, Jani Nikula wrote:
>> On Thu, 05 Sep 2024, John.C.Harrison@Intel.com wrote:
>>> Michal Wajdeczko (1):
>>>    drm/print: Introduce drm_line_printer
>> Given the discussion around other parts, it might be prudent to just
>> upstream this separately via drm-misc.
> For what purpose? Without the rest of this patch set that one patch is 
> pointless - it has no other users and it has no other purpose.

I'm just trying to make it easier to upstream this stuff. You'll need to
Cc: it to dri-devel and get acks from drm-misc maintainers anyway to
merge it via drm-xe-next. Or you could just get it merged via
drm-misc-next, in parallel, and just reference this series.

BR,
Jani.


-- 
Jani Nikula, Intel
