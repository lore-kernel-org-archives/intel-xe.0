Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3170CC47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 10:06:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BCA10E40F;
	Fri, 22 Mar 2024 10:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axYy5TEy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7E710E40F
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711101959; x=1742637959;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=crcMipWkR4uwceJImraOA8NikGUc/x5euKJv6vKPw5M=;
 b=axYy5TEyjyG8AJimNfD3CIrYRQybZjJTe3Wwzlx4GGf85fjBe+WhE97Z
 hx9XfWnr0HF6RVqNl+0gMXIJrXWHlpRRMJmRgMMgGcM00c9VTLIhzZJKh
 Jna8v3AdNwyKXPk+5li+HLjuiLEXqE58xrs1gwebGMVz80n3tKB31cjZa
 TkYcRK+zMu+5tyeajhMRBpuEWnteKFvjIjOIEL/eYyuEd4CD4S9aeyd2L
 AiI9TC2Dsq/SBT8HZSzMpyuE4WApyCYQyZZk7F9JFRSyM9E6aM8XiGx0U
 fR6j/bP/a7CUD0AljO5hUO2RxZH+Zz2/JkYSE26bQn8Sc2B/0HPfxEESg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16870579"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="16870579"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 03:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208";a="19521705"
Received: from ghoshsu1-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.6])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 03:05:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: remove unused struct xe_device members
In-Reply-To: <e8feb9d32ad698a111acd6ee475ee304b5893db4.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240321161548.3509672-1-jani.nikula@intel.com>
 <e8feb9d32ad698a111acd6ee475ee304b5893db4.camel@intel.com>
Date: Fri, 22 Mar 2024 12:05:52 +0200
Message-ID: <87frwilgxr.fsf@intel.com>
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

On Thu, 21 Mar 2024, "Souza, Jose" <jose.souza@intel.com> wrote:
> On Thu, 2024-03-21 at 18:15 +0200, Jani Nikula wrote:
>> modeset_restore_state has been unused since commit 6af0ffc0db93
>> ("drm/i915/display: move restore state and ctx under display
>> sub-struct").
>>
>> member global_obj_list has been unused since commit e2925e19c006
>> ("drm/i915/display: move global_obj_list under display sub-struct").
>>
>> hti_state has been unused since commit 62749912540b ("drm/i915/display:
>> move hti under display sub-struct").
>>
>> snps_phy_failed_calibration has been unused since commit 3a7e2d58f800
>> ("drm/i915: move snps_phy_failed_calibration to display sub-struct under
>> snps").
>>
>
> Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

Thanks, pushed to drm-xe-next.

BR,
Jani.


--=20
Jani Nikula, Intel
