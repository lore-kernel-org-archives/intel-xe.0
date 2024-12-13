Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4BFE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 00:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70810E096;
	Fri, 13 Dec 2024 00:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TuZIfFvJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178A10E096
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 00:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734050215; x=1765586215;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lJQ6vFwpVNTShkHN7DfQvbRFAkdD68o7JtS55gULPWc=;
 b=TuZIfFvJ9YIPTMAZrDdSN5dI6VAnlFKqs7R+4ZqQw5DHz20HgK9pm7Eq
 QcCzlMO1mItftTxQU2RH4PqQkdEmBsdgLyV0Ca+wJTBvhFGXV5SzeY/6v
 e74QPd28Ve39ayoaZVzv5EZpnX+rvSKq7WHXGe9pjePfmARnWHLZNYNjz
 6l1MvwLtZwyS/1Cte5JQ3vJkwPbyYGdrSbH5LeoPticuZAiV11btxgSgg
 ImUIzzw9DnBhXZXH7hgjY8hY4UB7a6m7bmszVp/w5PhfnAlAtXgokb8Yr
 cvSJXzGDaDSCGouOm9i8g4IF4OaDfEfFegVLIiyL0yOCamOvbw3DWZcgc w==;
X-CSE-ConnectionGUID: tXNjWVCjR6257J9YnVnCsA==
X-CSE-MsgGUID: CWduRCa/Tb6DVHRilP5IDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38430465"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38430465"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 16:36:54 -0800
X-CSE-ConnectionGUID: mJB0JmCEThOEgf3SOd37sQ==
X-CSE-MsgGUID: iax6vco/Sd6N4rE4rQfhbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133764224"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.169])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 16:36:54 -0800
Date: Thu, 12 Dec 2024 18:36:45 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 10/11] drm/xe: Split init of xe_gt_init_hwconfig to
 xe_gt_init and *_early
Message-ID: <mpijgwdx3y3akmextu6ujwpodg3wkefitrpjj4i7s7c5wz35za@yyou6ytiajnu>
References: <20241210083111.230484-1-dev@lankhorst.se>
 <20241210083111.230484-11-dev@lankhorst.se>
 <cfyy7aff2eavdf4wisztvev6vkuuajngxe53ekh2pkcoa36gtf@3xzilixxu5qm>
 <c93091af-6337-4e0e-a83c-18e2fea6988b@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c93091af-6337-4e0e-a83c-18e2fea6988b@lankhorst.se>
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

On Wed, Dec 11, 2024 at 07:52:49PM +0100, Maarten Lankhorst wrote:
>Hey,
>
>Den 2024-12-10 kl. 16:25, skrev Lucas De Marchi:
>>On Tue, Dec 10, 2024 at 09:31:10AM +0100, Maarten Lankhorst wrote:
>>>static void dump_pat_on_error(struct xe_gt *gt)
>>>@@ -419,6 +438,18 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>>        goto err_hw_fence_irq;
>>>    }
>>>
>>>+    err = xe_uc_init(&gt->uc);
>>
>>what does this have to do with gt_fw_domain_init()?  We should look at
>>removing unrelated stuff from this function rather than stashing more.
>>
>>Lucas De Marchi
>
>It just needs to be called with FW and during that point of init, can 
>perhaps create separate functions all called with fw instead?

splitting that up seems ok to me.

Lucas De Marchi

>
>Cheers,
>Maarten
>
