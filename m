Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72107EE57DB
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 22:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294CF10E1BB;
	Wed, 11 Sep 2024 22:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLgncRUG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F1710E1BB
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Sep 2024 22:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726092382; x=1757628382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dl4VLICwcxe3mCTPKRRrC6xyKLidO0g5R96mBKiepH0=;
 b=PLgncRUGoAff83tH6Zno4d+QcF/nhQBw094vpR6BXoazBud0PZlLbl07
 Pn6HaKrjw111OFkBMYD2duaWq+9LrUauXWaIguRprUNc6jD5nKFL5iMrn
 8W0zbimM5ymOUXW0DUV/+lH3EQRTasZEDSzNx0H52m3eHZqzJ7JEPMFQk
 W099QKbl4jm1thRdzmz82epW6sYzeR7PrnAM5dh4R3X9QlpHs2nAvhRwM
 vSIO4BvtVLEFR+uoynqCPCkOSi5jMEu5EsT68Zr9/r+AplST8Ez26pcjl
 20aDPYrlgFsJUnEn4cAg2z0bQaR7xW/lscrY2z/wuZgfbKL9KW0YyBWZJ Q==;
X-CSE-ConnectionGUID: tujjaBB5SSi5SPcmxE4rsA==
X-CSE-MsgGUID: W8zwUEJmTWCHBKBtvPjYwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28656741"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="28656741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 15:06:22 -0700
X-CSE-ConnectionGUID: hokJwN2pT0SPdtjv4N2SAw==
X-CSE-MsgGUID: h8UNJDkNSSup2scJztQ9gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; d="scan'208";a="71627667"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO imeretto.localnet)
 ([10.125.108.6])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 15:06:22 -0700
From: Kenneth Graunke <kenneth.w.graunke@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH] drm/xe: Use bookkeep slots for external BO's in exec IOCTL
Date: Wed, 11 Sep 2024 15:06:40 -0700
Message-ID: <5030690.31r3eYUQgx@imeretto>
In-Reply-To: <7199ce6364bc4ae5d66600e49acb288fa58a585e.camel@intel.com>
References: <20240911152622.903058-1-matthew.brost@intel.com>
 <7199ce6364bc4ae5d66600e49acb288fa58a585e.camel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Wednesday, September 11, 2024 8:37:11=E2=80=AFAM PDT Souza, Jose wrote:
> On Wed, 2024-09-11 at 08:26 -0700, Matthew Brost wrote:
>=20
> > Fix external BO's dma-resv usage in exec IOCTL using bookkeep slots
> > rather than write slots. This leaves syncing to user space rather than
> > the KMD blindly enforcing write semantics on every external BO.
> >=20
>=20
>=20
> Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Kenneth Graunke <kenneth@whitecape.org>


