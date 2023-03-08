Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0ADC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 08:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A776C10E5B0;
	Wed,  8 Mar 2023 08:31:34 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB1E10E5B0
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678264293; x=1709800293;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YRYjtjWcrY77F3MMwX0+hlvj0964VWNU8WYHp1mQAik=;
 b=lmb40NpRSpbtwLgHL/uc5MvpFUPVsOsmKlMM29kR+I17LbOoWKI+sKWa
 jtlr0mnuX+1eFCb4/829/i2UOglSycHSEiHcjc6Jj1/jxZIcVCA2Ok7kV
 XcYIww0dKkyAIFVGxl9la+u6FzygcP6ayrSh4CIfEpN1aEfffkLDcJtuZ
 3vzDZLcAdSTFVSezM8gvFL0vmeqX16VCAVSBz7unLQmGaeHdoyTY62zoA
 zuAoYESQVX258la3njnpWZbUpfqsJSw2hO6oeoEAhi3rEtA1V2+ARaUCk
 mk87lwa0EKQSCek3xLHvU5zIVHzJch01ijcOmSx8TZw1UqTxlOD9FfdFv g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333571607"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="333571607"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 00:31:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820110593"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; d="scan'208";a="820110593"
Received: from rgoettsc-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.172])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 00:31:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230307214003.zwcgwgxkasm6cmzb@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230306133459.7803-1-niranjana.vishwanathapura@intel.com>
 <20230307214003.zwcgwgxkasm6cmzb@ldmartin-desk2.lan>
Date: Wed, 08 Mar 2023 10:31:28 +0200
Message-ID: <878rg7d4pr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2] drm/xe/migrate: Fix number of PT structs
 in docbook
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
Cc: dev@mblankhorst.nl, thomas.hellstrom@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 07 Mar 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Mon, Mar 06, 2023 at 05:34:59AM -0800, Niranjana Vishwanathapura wrote:
>>Update xe_migrate_doc.h with 32 page table structs (not 48)
>>
>>v2: minor typo fix
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> unrelated fail in CI... it seems CI is applying series to the wrong
> head.

Unrelated to the patch, why isn't the documentation in xe_migrate.c?
Having a separate xe_migrate_doc.h with just a documentation comment
seems like a weird new pattern.

IMO the documentation should be placed either as a comment in the
relevant .c file or in an rst file under Documentation/gpu/xe.


BR,
Jani.

>
> applied, thanks
>
> Lucas De Marchi
>
>>---
>> drivers/gpu/drm/xe/xe_migrate_doc.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_migrate_doc.h b/drivers/gpu/drm/xe/xe_migrate_doc.h
>>index 6a68fdff08dc..63c7d67b5b62 100644
>>--- a/drivers/gpu/drm/xe/xe_migrate_doc.h
>>+++ b/drivers/gpu/drm/xe/xe_migrate_doc.h
>>@@ -21,7 +21,7 @@
>>  * table BOs for updates, and identity map the entire device's VRAM with 1 GB
>>  * pages.
>>  *
>>- * Currently the page structure consists of 48 phyiscal pages with 16 being
>>+ * Currently the page structure consists of 32 physical pages with 16 being
>>  * reserved for BO mapping during copies and clear, 1 reserved for kernel binds,
>>  * several pages are needed to setup the identity mappings (exact number based
>>  * on how many bits of address space the device has), and the rest are reserved
>>-- 
>>2.21.0.rc0.32.g243a4c7e27
>>

-- 
Jani Nikula, Intel Open Source Graphics Center
