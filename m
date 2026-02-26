Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D28FC5915
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 12:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A9710E906;
	Thu, 26 Feb 2026 12:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiHqX+rh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1FF10E906
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772107730; x=1803643730;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O7SmXYcJn1laFbGSfTVdjafeFKdbTnF1G4+cs/GMPK4=;
 b=EiHqX+rhEDCJicdMI7yOgppaYCdIY3lV4KbG6agbw5Aw3FYomCFuZZHI
 6y2GHOycwXnGx1Dbvjrn1Wsy75OQU9NuzSir+zj2njwCuZQcvDfucb1f6
 +uh+IcvpMwst0YBO+Lk1k+miXAQo9ETi12m+6VcDZRXbwO2v7RUKU9QHy
 R2TPtZEWpe1Y0HPoCqHnGPww0NxWGZkQel8qpkrSbnSCedZPFgDzISsJX
 pPz5Gw8EX7ui+ds4OAUKvl0mSRyIY0OVUaC7hTLIx9wj26l8d8gTy3Xe5
 juuFvgDTFbBpX3piqO4opPa5hes1/qml5dy5ovZ0aE943OiocwA6dZqRO A==;
X-CSE-ConnectionGUID: /HDLWC/XTgebq/+uFjU++g==
X-CSE-MsgGUID: yOcPmsc1QVuM1TuZePEwKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84520930"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84520930"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:08:50 -0800
X-CSE-ConnectionGUID: PkgouyVtRiOLL+G2nBB+1w==
X-CSE-MsgGUID: AH8bwBwdSUKlmkkbKq4iPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="239537850"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.215])
 ([10.245.244.215])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 04:08:48 -0800
Message-ID: <cc0958e96c7204931c06aac064b29afa0d589d02.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/3] drm/xe: Split H2G and G2H into separate buffer
 objects
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, stuart.summers@intel.com, 
 francois.dugast@intel.com, daniele.ceraolospurio@intel.com, 
 michal.wajdeczko@intel.com
Date: Thu, 26 Feb 2026 13:08:45 +0100
In-Reply-To: <aZ3N+CwyKRARMW6m@lstrano-desk.jf.intel.com>
References: <20260218043319.809548-1-matthew.brost@intel.com>
 <20260218043319.809548-2-matthew.brost@intel.com>
 <3033abb2dfe6755ff3559a480e0d21b5665436d5.camel@linux.intel.com>
 <aZ3N+CwyKRARMW6m@lstrano-desk.jf.intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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

On Tue, 2026-02-24 at 08:12 -0800, Matthew Brost wrote:
> On Tue, Feb 24, 2026 at 04:58:35PM +0100, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2026-02-17 at 20:33 -0800, Matthew Brost wrote:
> > > H2G and G2H buffers have different access patterns (H2G is CPU-
> > > write,
> > > GuC-read, while G2H is GPU-write, CPU-read). On dGPU, these
> > > patterns
> > > benefit from different memory placements: H2G in VRAM and G2H in
> > > system
> > > memory. Split the CT buffer into two separate buffers=E2=80=94one for=
 H2G
> > > and
> > > one for G2H=E2=80=94and select the optimal placement for each.
> > >=20
> > > This provides a significant performance improvement on the G2H
> > > read
> > > path, reducing a single read from ~20 =C2=B5s to under 1 =C2=B5s on B=
MG.
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >=20
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > Perhaps one could experiment with reading the data from the g2h bo
> > using MOVNTDQA, like the write-combining memcopy. That would avoid
> > caching the data and the GuC having to invalidate the cache line
> > while
> > snooping on the next write.
>=20
> We can try that, but G2H messages are variable-sized, so I believe it
> will get a little tricky. Once these are system-memory reads, I
> recall
> G2H handling being something like 15 per =C2=B5s of page faults (maybe
> that
> isn=E2=80=99t correct =E2=80=94 I=E2=80=99ll double-check), and that incl=
uded my not-yet-
> posted
> caching implementation, which also takes a spinlock, examines the
> page-fault cache, and chains the fault onto a list. So I don=E2=80=99t th=
ink
> this will end up in the critical path.

Actually DOCs say MOVNTDQA only has an effect on write-combining
mappings, so probably a dead end experimenting with that.
There's also PREFETCHNTA though, which may or may not have an effect.

/Thomas
