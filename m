Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1FFC30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 16:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCD110E643;
	Tue,  2 Jul 2024 16:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XNXSylSJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9096510E643
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 16:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719936131; x=1751472131;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UGjXrwp/N8OxHpQWUJbaHzTdEzfuyLscWce7LBZDtI0=;
 b=XNXSylSJFi7qscg0dIW9ahTeYhmGvLkDqG2J0OrdPAQziEaIjwAjLUKb
 JAleeHPKHEXr7Fx7chkXJ/sSYj8evTLbGmfccnlmT1ZYXOHuVtqYL13ZV
 7gD0uDFSTQOk1AFknP4g/TgqGmGRjrvsdi3ibxXGyykRM3/Pm84QR7U8p
 GcApRhqS36UeLXRk/jMnHGAMuznwdViHxU6aHJDnsaTTG/96VTc2i6H0o
 pXBBpkXYMemDyvsZWmea0BwhQlEeMZMw3KgDLbXHm5kjajv21owaYLbnD
 dCmn/1Ki6AQkTNwjv9zVLyftamDeZV5jh75HbTEw2trbrNviUnJK+1n4+ g==;
X-CSE-ConnectionGUID: Haq1idcySAS9p1lODfpWgQ==
X-CSE-MsgGUID: L8vlZ02USsKZYfTtTQftKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27799847"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="27799847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:02:11 -0700
X-CSE-ConnectionGUID: jKJCvUenRDKvUqn2scZrHg==
X-CSE-MsgGUID: 8zsAdl1CRgOAAeseJr/KSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="50803957"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.131])
 ([10.245.244.131])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:02:10 -0700
Message-ID: <27f4477316bd0e466ea9dba8e2cb2ac337645941.camel@linux.intel.com>
Subject: Re: [CI] HAX: Try SR-IOV on ADLP/ATSM
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?=C5=81ukasz_=C5=81aguna?=
 <lukasz.laguna@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Date: Tue, 02 Jul 2024 18:02:07 +0200
In-Reply-To: <fb0e3f23-f4c0-46f7-a7fe-53df450cbe3d@intel.com>
References: <20240624120203.1169-1-michal.wajdeczko@intel.com>
 <Zn8GQZo5Qh8oHvIn@intel.com>
 <61ccf2a7-290e-4eec-86eb-bada852e1e6d@intel.com>
 <tnfd4uxownbmvetljuqvc3lipnpotramxiuqktxipke5hpdfop@xxk4pdlgzcy6>
 <fb0e3f23-f4c0-46f7-a7fe-53df450cbe3d@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Mon, 2024-07-01 at 13:00 +0200, Michal Wajdeczko wrote:
>=20
>=20
> On 28.06.2024 22:58, Lucas De Marchi wrote:
> > On Fri, Jun 28, 2024 at 10:22:07PM GMT, Michal Wajdeczko wrote:
> > >=20
> > >=20
> > > On 28.06.2024 20:51, Rodrigo Vivi wrote:
> > > > On Mon, Jun 24, 2024 at 02:02:03PM +0200, Michal Wajdeczko
> > > > wrote:
> > > > > This is for CI only. DO NOT REVIEW. DO NOT MERGE.
> > > >=20
> > > > how are these tests looking like at this moment?
> > >=20
> > > IMO quite good
> > `
> > can you list all the tests are covering the sriov enabling?
>=20
> from what I can see from the results [1] below, we have:
>=20
> * sriov_basic@enable-vfs-autoprobe-off, see [5]
>=20
> test will validate whether the PF is able to configure VFs (in
> auto-provisioning mode) and then enable any number of supported VFs,
> from 1 VF to 7 or more VFs, without actually loading the VF drivers
>=20
> * sriov_basic@enable-vfs-autoprobe-on, see [6]
>=20
> like above, but all VF drivers will be loaded automatically by the
> PCI
> subsystem (could be treated as stress-test)
>=20
> * sriov_basic@bind-unbind-vf, see [7]
>=20
> like above, but each VF driver will be loaded separately by the test
>=20
> * igt@sriov_basic@enable-vfs-bind-unbind-each
>=20
> like above, but each VF driver will be loaded and then unloaded
> separately by the test (it should be less stress-full)
>=20
>=20
> + Lukasz who can tell more about the plans for full SR-IOV validation
>=20
>=20
> [5]
> https://intel-gfx-ci.01.org/tree/intel-xe/igt@sriov_basic@enable-vfs-auto=
probe-off.html
>=20
> [6]
> https://intel-gfx-ci.01.org/tree/intel-xe/igt@sriov_basic@enable-vfs-auto=
probe-on.html
>=20
> [7]
> https://intel-gfx-ci.01.org/tree/intel-xe/igt@sriov_basic@bind-unbind-vf.=
html
>=20
> [8]
> https://intel-gfx-ci.01.org/tree/intel-xe/igt@sriov_basic@enable-vfs-bind=
-unbind-each.html
>=20
> >=20
> > Also it'd be good to have an "admin guide" to use it.
>=20
> at the moment we would like to rely only on the default VFs
> configurations, aka auto-provisioning, so to enable or disable the
> VFs
> we should only use existing mechanism exposed by the PCI subsystem
> attribute 'sriov_numvfs', described in [9]
>=20
> once we have VF devices enabled, we can use them almost as any other
> PCI
> device, including running IGT tests, where we can specify target
> device:
>=20
> 	--device pci:slot=3D0000:4d:00.1
>=20
> where 0000:4d:00.1 is BDF of the VF1
>=20
> our experimental/advanced knobs to prepare custom VF configurations,
> exposed by the PF driver over debugfs [10], should be used with care
> and
> currently are only aimed for debug/tuning purposes
>=20
> [9]
> https://elixir.bootlin.com/linux/latest/source/Documentation/ABI/testing/=
sysfs-bus-pci#L302
>=20
> [10]
> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/xe/xe_gt_sr=
iov_pf_debugfs.c
>=20
> >=20
> > >=20
> > > recent run [1] just uncovered two existing issues that actually
> > > are not
> > > related to the Xe SR-IOV code:
> > >=20
> > > first problem [2]:
> > >=20
> > > Starting dynamic subtest: vf-2
> > > (sriov_basic:1395) igt_device-WARNING: Couldn't find PCI device
> > > 0000:00:02:02
> > >=20
> > > was due to a test bug, attempt to fix that is under review [3]
> > >=20
> > >=20
> > > second problem [4]:
> > >=20
> > > <7> [259.552619] BUG: MAX_LOCKDEP_KEYS too low!
> > > <7> [259.552626] turning off the locking correctness validator.
> > >=20
> > > was reproduced on driver running in non-SRIOV mode (native), not
> > > sure
> > > whether public bug was created for it, though
> > >=20
> > >=20
> > > [1]
> > > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/index.html?t=
estfilter=3Diov
> > >=20
> > > [2]
> > > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2=
/igt@sriov_basic@bind-unbind-vf.html
> > >=20
> > > [3] https://patchwork.freedesktop.org/series/135476/
> > >=20
> > > [4]
> > > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-1=
/igt@sriov_basic@enable-vfs-autoprobe-on.html#dmesg-warnings1677
> > >=20
> > >=20
> > > > I'm wondering if it is already time to add this patch to
> > > > topic/xe-for-CI
> > >=20
> > > it would be great, as this patch allows running few basic SR-IOV
> > > tests
> > > (including VF driver probe) on the existing BAT/FULL CI runs, so
> > > with
> > > minimal effort we will be able to catch regressions/breaks that
> > > impacts
> > > the VF driver.
> > >=20
> > > note that being a PF driver by default shouldn't impact any
> > > existing
> > > results or functionality, as any resources needed for VFs are
> > > reserved
> > > only when VFs are enable during the SR-IOV tests.
> > >=20
> > > additional resources used by the PF until VF are enabled are
> > > negligible
> > >=20
> > > >=20
> > > > Thomas? Lucas? thoughts

Acked-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>


> > //=C2=A0 Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >=20
> > on merging to topic/xe-for-CI branch.
> >=20
> > thanks
> > Lucas De Marchi

