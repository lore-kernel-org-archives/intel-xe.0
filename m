Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5507CC5DF94
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 12:27:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F3D10E547;
	Mon, 24 Aug 2026 12:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6jhiM03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE6D10E547
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787574424; x=1819110424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e73JJEMgN01xynAVyI2SaM28LIhD7rkYcvryALEf0Xo=;
 b=I6jhiM03jZdjAyR8h0jU5P/jvRQSXRik/48D92gwuWg8o3MLOLPyd0OO
 ADwZY/CwIBgLyuVRhtNJGTLv77zhkaactuUn5zKWYwotPQxdCigKgMumQ
 SB0SEUy1YFkxe2f+Se46rIEBzTU+zhSMlGn9c3G9k4KsFqe3tFv9Jmm7Z
 Ish4YvRdcQOvBVt+FmqrHZobrG82lI87G5vw1BIFmjAzDgdjwyUL+W/FM
 znp/6m+B/Y5bH8C8UZPNa+ghHvFfL0MBsUd+l7dv98/rlPdaGqYkjZtH/
 YQgFVpWm+MeADRF1PycKKveI8bn3r11tGKPS5qwk+rvsAmGrhpLVllGw/ w==;
X-CSE-ConnectionGUID: PgajaMyZR7KiGEOfOPgxsw==
X-CSE-MsgGUID: 7KmC64GGRsCBENLFcczKNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="105558952"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="105558952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 05:27:03 -0700
X-CSE-ConnectionGUID: 1tsVHvaiRoeN/uLU3ZfZFQ==
X-CSE-MsgGUID: iM59ddnXTWOC+jIGQrVRpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="271204300"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP; 24 Aug 2026 05:27:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
 id 7F21199; Mon, 24 Aug 2026 14:27:00 +0200 (CEST)
Date: Mon, 24 Aug 2026 14:27:00 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, riana.tauro@intel.com,
 mallesh.koujalagi@intel.com, aravind.iddamsetty@intel.com,
 himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH 1/2] drm/xe/i2c: Not for review, Squash of I2C/AMC series
Message-ID: <aow4lOTbMenEkOE6@black.igk.intel.com>
References: <20260823103523.554184-4-badal.nilawar@intel.com>
 <20260823103523.554184-5-badal.nilawar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260823103523.554184-5-badal.nilawar@intel.com>
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

On Sun, Aug 23, 2026 at 04:05:25PM +0530, Badal Nilawar wrote:
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

This patch is not from me.

> Squash of https://patchwork.freedesktop.org/series/168930/

Why? What are you trying to achieve with this patch??????

> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Do not use my signature!

It does not matter that the code originates from me - you can express
that in a different way in the commit message. You don't use other
peoples' signature even if the patch was intended for development
purposes only.

Thanks,

-- 
heikki
