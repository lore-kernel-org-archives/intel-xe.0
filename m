Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADFECC6B0F
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 09:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336E810E776;
	Tue, 13 Oct 2026 09:18:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF0010E776
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791883105; x=1823419105;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zirvr5Z+/G/FU1YxpxLmJnWlCOLWHK3ANrDWkR1xQQA=;
 b=X0dGZrgAglw5tJ5vFbLzs71eL/Oo2eHQEPiXa3soUAiJ7VfBqxezU0Wt
 xQnbQhKwy3SGEizOqRP0XUNiw5PF4Ffuv1XNG6gQKRO+jGETJGoMs6NSi
 Nv9e4YAn9G5wtsfdCbML/PYO7O9NV/tTKdk7ujKy0qSuxB6mkTADdmWun
 3YuIIe29e4CarkxxvU82jjOKde+NAtjhWdSmRtL1QL8rFDzbQ60cv8Qtx
 5lDxwRaRyzKKce41trf5+XbHQOJvMzozbffBrcwEcv/sRBDDE0B7t8en/
 i8dPr1tA1oto2gSMNAEaGdb6QR1+N2gSf2oquC9rowUZGhd8fIK6VStth w==;
X-CSE-ConnectionGUID: zeSBPOFCQSSMjUbAWOpOgQ==
X-CSE-MsgGUID: zaKF6swsS5ql2aPa0aRPdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="610619"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="610619"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 02:18:25 -0700
X-CSE-ConnectionGUID: 0Saa6EbsQx2XGqYomowfDg==
X-CSE-MsgGUID: Sbz+hzmJQqiSYOec6g9pdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1214506"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.84])
 ([10.245.245.84])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 02:18:23 -0700
Message-ID: <8d0eb215394e7a285813fe87def6bee358063431.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: skip p2p for suspected display buffers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Date: Tue, 13 Oct 2026 11:18:21 +0200
In-Reply-To: <2fcd10d5-c1f9-47be-9a68-422f9bbd6837@amd.com>
References: <20261007153605.1743626-5-matthew.auld@intel.com>
 <20261007153605.1743626-8-matthew.auld@intel.com>
 <2c6a97ac21c5ef161dbac279f9b971f383b6b944.camel@linux.intel.com>
 <dbabed4e-468d-4ecf-b295-f5d8c9c4b263@intel.com>
 <bc2f4d82-5a8e-4d1b-a921-ee819ca5cac2@amd.com>
 <992d57f0-7327-4c36-adf7-6dd72137fe73@intel.com>
 <31f7eb68-6dfa-4ea7-93a4-d4897fbe6a74@intel.com>
 <3579864a-0283-4f92-b895-5cf399c2ee69@amd.com>
 <16cfde6b-8881-4ffe-8068-9530286da72a@intel.com>
 <1a852df2-c2a4-48bb-84de-cdd4b98b95bb@amd.com>
 <d493d4d1-96d5-4194-bbae-5c1e5d54d91a@intel.com>
 <5545db90-3365-4d75-9fc0-77dda42b7000@intel.com>
 <2fcd10d5-c1f9-47be-9a68-422f9bbd6837@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
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

On Tue, 2026-10-13 at 11:10 +0200, Christian K=C3=B6nig wrote:
> On 10/13/26 10:51, Matthew Auld wrote:
> > On 09/10/2026 14:02, Matthew Auld wrote:
> > > On 09/10/2026 12:38, Christian K=C3=B6nig wrote:
> > > > On 10/9/26 12:29, Matthew Auld wrote:
> > > > > On 09/10/2026 10:26, Christian K=C3=B6nig wrote:
> > > > > > On 10/9/26 11:16, Matthew Auld wrote:
> > > > > > > On 08/10/2026 12:17, Matthew Auld wrote:
> > > > > > > > On 08/10/2026 10:55, Christian K=C3=B6nig wrote:
> > > > > > > > > On 10/8/26 11:46, Matthew Auld wrote:
> > > > > > > > > > On 07/10/2026 19:11, Thomas Hellstr=C3=B6m wrote:
> > > > > > > > > > > On Wed, 2026-10-07 at 16:36 +0100, Matthew Auld
> > > > > > > > > > > wrote:
> ....
> > > > > > > > > > Perhaps Intel Mesa side should use tt-only for this
> > > > > > > > > > type buffer (?), but since this is a kernel
> > > > > > > > > > regression I was hoping we could fix this on the
> > > > > > > > > > kernel side.
> > > > > > > > > >=20
> > > > > > > > > > Some questions:
> > > > > > > > > >=20
> > > > > > > > > > 1. Do you know what is the general story with p2p
> > > > > > > > > > between igpu and dgpu? Is this a legit thing? For
> > > > > > > > > > igpus/APUs, advertising p2p can't be dropped? It
> > > > > > > > > > clearly seems to work though.
> > > > > > > > > >=20
> > > > > > > > > > 2. If this is legit, do you guys then also prevent
> > > > > > > > > > p2p with display buffers? Are you just doing that
> > > > > > > > > > at the Mesa level, or is there some magic in the
> > > > > > > > > > kernel also?
> > > > > > > > >=20
> > > > > > > > > If I understand that correctly that the igpu is the
> > > > > > > > > importer and the dgpu is the exporter then yeah
> > > > > > > > > Thomas is right that definately needs to be fixed on
> > > > > > > > > the importer side.
> > > > > > > >=20
> > > > > > > > Ideas on how do that? Could we do something like
> > > > > > > > allow_peer2peer =3D false in amdgpu_gem_prime_import() if
> > > > > > > > this is an APU device, or further check if the exporter
> > > > > > > > side is not amdgpu, like APU + Xe?
> > > > > > >=20
> > > > > > > For example:
> > > > > > > https://gitlab.freedesktop.org/mwa/kernel/-/=C2=A0commit/7ec8=
6
> > > > > > > c68b42655b4bb85ee90af434a617e7bec8c
> > > > > > >=20
> > > > > > > Is that something you would accept?
> > > > > >=20
> > > > > > No, you misunderstood me. Enabling P2P is perfectly fine
> > > > > > for APUs and mandatory for a couple of customer projects.
> > > > > >=20
> > > > > > The buffer should just be rejected from scanout in the
> > > > > > display code and on the AMDGPU side we already do that if
> > > > > > I'm not completely mistaken.
> > > > >=20
> > > > > Reporter confirmed seeing the issue in windowed mode also. So
> > > > > I don't think it's just a case of rejecting from scanout?
> > > >=20
> > > > Then I don't understand what the problem is.
> > > >=20
> > > > When the dGPU renders and the iGPU displays you have only two
> > > > possibilities, either the dGPU pushes the frames over the bus
> > > > or the iGPU pulls the frames over the bus. Both should be
> > > > equaly slow or fast, so what exactly is the expectation here?
> > >=20
> > > I assume the AMD APU/iGPU is sampling/reading from the p2p window
> > > buffer every frame.
>=20
> That is not possible. The HW can't do this and because of this we
> should have a check for that in the DAL/DC code.
>=20
Couldn't the issue be that the compositor, running on the amd iGPU
blits from the dma-buf rather than scans out from it? And the scanout
is not the shared buffer at all?

/Thomas


