Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0034EC02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 14:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67A510E81D;
	Thu, 23 Jan 2025 14:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmvLkWtC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0815110E81D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 14:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737642653; x=1769178653;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aGzr0nYYncve+lVcVzpJtw55rqjEZPGAnHedIkj+Nzg=;
 b=ZmvLkWtCrz0kXJojqwAPH4hT0gmU0sYEUZcgzdvwSmXtPZRVSbQdFC7N
 ruUw4e6r7wKz4RDw0Tw/KXASGv8HPfZfKH1WABddWSwcVvSY6bh8Y/Ke4
 Ca9/UG3PVoFRdpnAfE9eX5aITdTm4PZMR5ASWK7+CporIR6YQ+ct9Px+x
 wMe54grTNnzY+SAgp2LjnuM5YYJilGwcW9fDzXAkREixG0yr+INNfnU3Y
 Ksj/S2/OsKEd+1yiKEZ4PmeCRnvAOhmbKyBDVJkEqTAJJu+wedoHCkjlv
 xKP9HH8VrvQT6M0hXtu495P8/Johlpw54XXMhA59yEnhPr8/dtOFS1hRe w==;
X-CSE-ConnectionGUID: VXhTm23VRQiNXifd71vfNA==
X-CSE-MsgGUID: 2gtNxqabQfiN/GwQ91CdUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48731985"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="48731985"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 06:30:52 -0800
X-CSE-ConnectionGUID: 50uUyjreST675jxa1UQ3zA==
X-CSE-MsgGUID: pPYKQuyQQ+iSe0ahwHkFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112115812"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 06:30:52 -0800
Date: Thu, 23 Jan 2025 08:30:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Filipchuk,
 Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/devcoredump: Move exec queue snapshot to
 Contexts section
Message-ID: <kw4rrdedc3ye5elnis6bjz2xg34ttrul2d6qye5lm3ixeee36l@ncfk65fdvb4s>
References: <20250123051112.1938193-1-lucas.demarchi@intel.com>
 <20250123051112.1938193-2-lucas.demarchi@intel.com>
 <f16aac40a9ea1ab40d1083228cd0b460e1d217e3.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f16aac40a9ea1ab40d1083228cd0b460e1d217e3.camel@intel.com>
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

On Thu, Jan 23, 2025 at 08:14:11AM -0600, Jose Souza wrote:
>On Wed, 2025-01-22 at 21:11 -0800, Lucas De Marchi wrote:
>> Having the exec queue snapshot inside a "GuC CT" section was always
>> wrong.  Commit c28fd6c358db ("drm/xe/devcoredump: Improve section
>> headings and add tile info") tried to fix that bug, but with that also
>> broke the mesa tool that parses the devcoredump, hence it was reverted
>> in commit 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa
>> debug tool").
>>
>> With the mesa tool also fixed, this can propagate as a fix on both
>> kernel and userspace side to avoid unnecessary headache for a debug
>> feature.
>
>This will break older versions of the Mesa parser. Is this really necessary?

See cover letter with the mesa MR that would fix the tool to follow the
kernel fix and work with both newer and older format. Linking it here
anyway: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33177

It's a fix so simple that IMO it's better than carrying the cruft ad
infinitum on all the tools that may possibly parse the devcoredump.


>Is it worth breaking the tool? In my opinion, it is not.
>
>Also, do we need to discuss this now? Wouldn't it be better to focus on bringing the GuC log in first?

That's what the second patch does. We need to discuss both now and
decide, otherwise we can't re-enable it and have either the guc log
parser or mesa's aubinator_error_decode_xe broken.

Lucas De Marchi

>
>>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: stable@vger.kernel.org
>> Fixes: 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa debug tool")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_devcoredump.c | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> index 81dc7795c0651..a7946a76777e7 100644
>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> @@ -119,11 +119,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>>  	drm_puts(&p, "\n**** GuC CT ****\n");
>>  	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
>>
>> -	/*
>> -	 * Don't add a new section header here because the mesa debug decoder
>> -	 * tool expects the context information to be in the 'GuC CT' section.
>> -	 */
>> -	/* drm_puts(&p, "\n**** Contexts ****\n"); */
>> +	drm_puts(&p, "\n**** Contexts ****\n");
>>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>>
>>  	drm_puts(&p, "\n**** Job ****\n");
>
