Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45ECC47DDB
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 11:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7414210E478;
	Thu,  1 Feb 2024 11:46:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N15v72JJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED4410E478
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 11:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706787960; x=1738323960;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=Rl1vmQ3hJs1SQH0V8DNb9rSO+hdfzalOmNwc1Bztz4A=;
 b=N15v72JJ8yJNMZAqESfJsQL1IlkX6CCRfc7BbtgTH3VHyjoheorh5tR/
 2VfNfheZffBROrvxnYGFaDBZYoed7oi/2eZj9a+TDQCtYFP3K0DaJsHpt
 knFl90nLekcOymoutft46KeUoS3wGDNxSWyxbi+ztvIGnOVfKSTqzgwFO
 K1U7r/o1pnAzxwhsalEQ3bPP367zjARr5Eyu7zOYbem0KsKRNKLOgbngr
 I47Cd0QWqJfjFKhewDCq7fC81q+WB94cLk+GGOGfUY0dxJoG6pKR9ZXal
 6lfqLw3QGIKhPLb+apzYdBH9FEg/cLDNmE7XchVZy99AIszozMSnIe1qD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3709115"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3709115"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="859130538"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="859130538"
Received: from sbint17x-mobl.gar.corp.intel.com (HELO [10.249.254.18])
 ([10.249.254.18])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 03:45:55 -0800
Message-ID: <6b748f1ce0296dccde0f804b2f02468e54660044.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove persistent queue support
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Date: Thu, 01 Feb 2024 12:45:53 +0100
In-Reply-To: <20240201114601.2431375-1-tejas.upadhyay@intel.com>
References: <20240201114601.2431375-1-tejas.upadhyay@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
MIME-Version: 1.0
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

Hi Tejas,




On Thu, 2024-02-01 at 17:16 +0530, Tejas Upadhyay wrote:
> Multiqueue support will be added in near future which
> needs removal of persistent queue feature as it can
> work without queues being persistent.
>=20
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

https://patchwork.freedesktop.org/patch/576411/?series=3D129311&rev=3D1


/Thomas

