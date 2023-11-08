Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A14C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 13:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617D710E75A;
	Wed,  8 Nov 2023 13:55:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B805510E75A
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699451730; x=1730987730;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=HFUnoECNBS/8a6pAamYXU+/saylxiAlwIv1k4UR6+7s=;
 b=d1Ls42s+ZDX+mqZFM49c1btX91O4ZukvLH+AX3re0uW8P4+kc+ct6Z9R
 /bqd297WgSbUKA8S2HSX4eJ6m7yqasnhUG5FOepPt0zGNsDnwn3+zcDGe
 blUPeRRbCz7KYvBjk2XuyWJW69A1buZmm1GcZ0FIbSgsUUfeMzSbhJeMX
 V78F9weaZGmuPm+dUgOsnHkQVL12x8o6LKWouJHKoif16p73AW5OMzyWg
 /XgRtvn0SylydpNvlt5X25EmVvp4W2lcNsXIBqwJl4wZSpOQXHG/2f4Kf
 +XNL4DzruzwV+EOCGN3v8iJ/0tBG8U6dS1Ij1bSFC5OElLSHTA3r6egZM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="456260241"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="456260241"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:55:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="1010265002"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="1010265002"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.82])
 ([10.249.254.82])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 05:55:28 -0800
Message-ID: <eec61b1375b25610c714abaaf34fa265deae18d4.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 08 Nov 2023 14:55:26 +0100
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH v2 00/27] Refactor VM bind code
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

On Mon, 2023-11-06 at 21:25 -0800, Matthew Brost wrote:
> WIP on refactoring VM bind to final error handling solution.
>=20
> Major changes are:
> 1. Allow bind / exec IOCTLs with zero binds / batches
> 2. Convert multiple binds from IOCTL into single job
> 3. CPU binds in jobs
> 4. Sync vs async bind per IOCTL rather than per queue
>=20
> Error handling still not 100% correct but this this series structures
> the code to make it possible.
>=20
> This series shouldn't break any uAPI compatibility until the last
> patch
> in the series.
>=20
> v2: Rebase, Take in-syncs into account when num_execs or num_binds =3D=3D
> 0

I see a compliation failure in tests/xe_migrate.c. Looks like the Xe
kunit tests were not in the config?

/Thomas

