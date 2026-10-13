Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28F3CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 10:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDE110F70E;
	Tue, 13 Oct 2026 10:16:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C37510F6F5
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 10:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791886572; x=1823422572;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V3EpZ/04oj4GmhPmwX+sCNLkGGRQP/pXyVpcF2mj68E=;
 b=Vy1ygkVnY8sn6GncNhS1GwUJHqrs3ghG6ArQIJN6uKJVPr+PFi8ozLNw
 Xu3PU568Et6f7EacsU1r9fydtbFQAeGnozIccHRyDY42M5JpRJzFAjUy6
 5ldu4Eg0mNoKdZsMxNJCkBJ9tNhK6R9vjvZ1rhe/qEnw3VTFLTj4ReRTh
 nQrLGudRtRgfHvH6Wpc2sfsLMLY9dVNxTLcVRxO9iE9ZWHLzUWcy9Z9U5
 e5dbD9vS2v1JGN5MQg8ixhPwzYtpJo+uNWEgrMahp4Yjmfy6I9Jw63ok8
 x60cOyHAVRQvOHqAZnyDeFIwq0TESR+OL6Y87+9Lb4LIAd9Eu07syxQ1I g==;
X-CSE-ConnectionGUID: R5TR+XW6T6eOw+vnT0t8pw==
X-CSE-MsgGUID: qfjmwsMXSg2VKQymLecALw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="491491"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="491491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 03:16:11 -0700
X-CSE-ConnectionGUID: WDOH4GnXS3uP60r2zH8InA==
X-CSE-MsgGUID: 1PzACqbWQKWUBgpwspYajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1136956"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.84])
 ([10.245.245.84])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 03:16:09 -0700
Message-ID: <9ba9558a85e3df1bf50db7a2265ecb99d746cf9c.camel@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe: skip p2p for suspected display buffers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthew
 Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Date: Tue, 13 Oct 2026 12:16:06 +0200
In-Reply-To: <f570087d-9d67-4199-b5db-959741379835@amd.com>
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
 <8d0eb215394e7a285813fe87def6bee358063431.camel@linux.intel.com>
 <f570087d-9d67-4199-b5db-959741379835@amd.com>
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

On Tue, 2026-10-13 at 11:55 +0200, Christian K=C3=B6nig wrote:
> On 10/13/26 11:18, Thomas Hellstr=C3=B6m wrote:
> ...
> > > > > > > > > > Ideas on how do that? Could we do something like
> > > > > > > > > > allow_peer2peer =3D false in
> > > > > > > > > > amdgpu_gem_prime_import() if
> > > > > > > > > > this is an APU device, or further check if the
> > > > > > > > > > exporter
> > > > > > > > > > side is not amdgpu, like APU + Xe?
> > > > > > > > >=20
> > > > > > > > > For example:
> > > > > > > > > https://gitlab.freedesktop.org/mwa/kernel/-/=C2=A0commit/=
7
> > > > > > > > > ec86
> > > > > > > > > c68b42655b4bb85ee90af434a617e7bec8c
> > > > > > > > >=20
> > > > > > > > > Is that something you would accept?
> > > > > > > >=20
> > > > > > > > No, you misunderstood me. Enabling P2P is perfectly
> > > > > > > > fine
> > > > > > > > for APUs and mandatory for a couple of customer
> > > > > > > > projects.
> > > > > > > >=20
> > > > > > > > The buffer should just be rejected from scanout in the
> > > > > > > > display code and on the AMDGPU side we already do that
> > > > > > > > if
> > > > > > > > I'm not completely mistaken.
> > > > > > >=20
> > > > > > > Reporter confirmed seeing the issue in windowed mode
> > > > > > > also. So
> > > > > > > I don't think it's just a case of rejecting from scanout?
> > > > > >=20
> > > > > > Then I don't understand what the problem is.
> > > > > >=20
> > > > > > When the dGPU renders and the iGPU displays you have only
> > > > > > two
> > > > > > possibilities, either the dGPU pushes the frames over the
> > > > > > bus
> > > > > > or the iGPU pulls the frames over the bus. Both should be
> > > > > > equaly slow or fast, so what exactly is the expectation
> > > > > > here?
> > > > >=20
> > > > > I assume the AMD APU/iGPU is sampling/reading from the p2p
> > > > > window
> > > > > buffer every frame.
> > >=20
> > > That is not possible. The HW can't do this and because of this we
> > > should have a check for that in the DAL/DC code.
> > >=20
> > Couldn't the issue be that the compositor, running on the amd iGPU
> > blits from the dma-buf rather than scans out from it? And the
> > scanout
> > is not the shared buffer at all?
>=20
> Yeah that is possible, but that should only happen when there is some
> change.
>=20
> When the iGPU reads the buffer only once then that isn't really
> problematic, it's actually exactly what should happen.
>=20
> It only becomes problematic when the buffer is read multiple times to
> construct multiple frames, either because the compositor does
> something unexpected or we really start to scanout from the buffer.

But in windowed mode (and perhaps even fullscreen?) the compositor
blits repeatedly over PCI each frame from the dma-buf?=20

/Thomas



>=20
> Regards,
> Christian.
>=20
> >=20
> > /Thomas
> >=20
> >=20
