Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CED109C033
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 15:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA7810E7C1;
	Wed, 25 Mar 2026 15:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jthdPb7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91AAB10E7C1;
 Wed, 25 Mar 2026 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453606; x=1805989606;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=yMvWYi80qu0jWBnSn49KWzEyIW/rVQPuvai6weXSKxU=;
 b=jthdPb7fdbDeD6aj7vg4qJdzlnviip27VcG4ypatnN50KPa8sreo83gm
 t89Q/ctsMCZGIVhEaZffcbdcKnEiPOTsWaYY5SAPEYGDg06I26wda+Y+o
 9pWy0pH5fsTx/IldSlqgRZ1ijVf8YkxEe1BH+RYmWViOQ8Brzosc9jH6D
 ytlHacpzYezXlRuPlxH3xF4GUIQCmIrISA6qD8ltsydQJrEktBzS/0s/g
 0CLlwg2nKp9Kna8aIR7iglduv8ZU9izpLHvaJXRWKJfcmq5ImR65SYxb/
 ToZqndjYxRsDVy6T1jHO2nlOlguPWggpr3HD6b/K5xDuBrLQCzTJupG/M g==;
X-CSE-ConnectionGUID: 5jApHTW0QyyxoBVKTt6Hgg==
X-CSE-MsgGUID: EtADa5XSQ0WWeJaBgWGGeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86574531"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="86574531"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:46:45 -0700
X-CSE-ConnectionGUID: B6VFsWMoTVu/OlWmRZzTWA==
X-CSE-MsgGUID: JRScee0ORNC8UYW+zGhnIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="255220331"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:46:44 -0700
Date: Wed, 25 Mar 2026 16:46:42 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/i915: Move the sharness filter dump next to pfit
In-Reply-To: <20260325135849.12603-7-ville.syrjala@linux.intel.com>
Message-ID: <e831d86f-5c0a-d882-6328-0845d5230bcf@intel.com>
References: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
 <20260325135849.12603-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-117299265-1774452281=:294612"
Content-ID: <1919e83e-8117-2f72-b0c4-9dcc4bc32bd5@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-117299265-1774452281=:294612
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <3aeacfab-e0b3-eab6-29fd-c161b0ec53c9@intel.com>

On Wed, 25 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Group the sharpness filter parameters next to all the other pfit
> stuff in the state dump.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-117299265-1774452281=:294612--
