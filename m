Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B6FCA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 15:56:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD15410E03C;
	Tue, 12 Aug 2025 15:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7qTrIEM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BA510E03C
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Aug 2025 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755014200; x=1786550200;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vLam3siyQBnfQTRgySA4WqCCdN804RSLf9oIQDj/n18=;
 b=c7qTrIEMl/IyM7Ut/I+4kWdHO+b4JOlw4R9xZ1KkUQu4gCZX7pZ1EHTc
 pJrXMmavznhrZa/7M/BhhzzNy9bVZqlqHTgpfEgQcGb2BU7nS3ejQwS9z
 IXMXsiTHPmC7Tr7WlK7tFEvwc2GHNFIjOFUf9hvmeWI5a1v3/O5I5U1wd
 XnhHSVLO7r8gPFs5jwTbrg/rVg418mugAUCNNbD0mj4F4PFy4WkB848JD
 fLi5iXPK+xvIulNsyZzTj7etCrduX90TWBdmUjfwqbBslIVAgBGr8QUuq
 hLTcFLpA3Bho0Tj+DXEtLQFCFykzFGa/D0hTyzVu/vAL0A+ZwSHevC3MH Q==;
X-CSE-ConnectionGUID: gXlPSBYbR9Whox3LPklE+w==
X-CSE-MsgGUID: O6b6Z/ZURzO90nUofRcpGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57356951"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="57356951"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 08:55:59 -0700
X-CSE-ConnectionGUID: tVx3ix4bRdmC870BCb+zDw==
X-CSE-MsgGUID: 6s6Wc5MIT9CXLkjUUVaM8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165729424"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.68])
 ([10.245.245.68])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2025 08:55:55 -0700
Message-ID: <55abb33a338eebc4dfecead75545315f0b0b721b.camel@linux.intel.com>
Subject: Re: [PATCH v8 0/8] drm/xe/vf: Post-migration recovery of queues and
 jobs
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org, =?UTF-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?ISO-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 rodrigo.vivi@intel.com, daniele.ceraolospurio@intel.com, 
 john.c.harrison@intel.com, jon.ewins@intel.com, kimmo.nikkanen@intel.com, 
 luis.strano@intel.com
Date: Tue, 12 Aug 2025 17:55:53 +0200
In-Reply-To: <aJrHY+xO+01Fd4gm@lstrano-desk.jf.intel.com>
References: <20250801015045.957609-1-tomasz.lis@intel.com>
 <aJrHY+xO+01Fd4gm@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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

On Mon, 2025-08-11 at 21:47 -0700, Matthew Brost wrote:
> On Fri, Aug 01, 2025 at 03:50:37AM +0200, Tomasz Lis wrote:
>=20
> +Maintainers, public, consolidating threads.
>=20
> IMO this needs to be fully reverted or at minimum a subset of
> problematic patches, along with [1].
>=20
> To start, it was brought to my attention that this code was not
> tested
> due to a lack of internal infrastructure. I believe it is completely
> unacceptable for untested code to be merged, especially for a complex
> feature like this. After spending some time reviewing the feature, I
> found clear bugs, and the overall software architecture appears
> ill-conceived.
>=20

Tomasz Lis, Micha=C5=82 Wajdeczko, what type of testing is missing here? Is
the code not tested at all, not even internally or do we lack igts for
this specific functionality?

/Thomas


