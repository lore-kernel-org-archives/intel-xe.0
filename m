Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E3606A883
	for <intel-xe@archiver.kernel.org>; Fri, 13 Nov 2026 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KkKOnno6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DD21126CF;
	Fri, 13 Nov 2026 16:41:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7E61126CF;
 Fri, 13 Nov 2026 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794588069; x=1826124069;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=szokGNCf3usRr/2R9fUspBWmWj1YM4rwxd+C5M/9CoI=;
 b=KkKOnno6wfk49wi0toAWXo9X20URlLEuYlYwTj/kk0vYHBnsgjZce5/N
 kSLMx/TuWevBuWGJPD1C0gYUwwaO6F3EXn5VukjtfgHeRxiPTTE0aILlR
 YPMbMTJSx7VEzYj9nqd95CtYhAZzl46+y9V9wMSbRnXxFF/wu5VY90bAg
 vVJ1+uQPptrv1qW+jIoryDrvZ4ayvaORvGdDGv6qWejOoyalA6uxtktJ8
 RlMLekH/enDc6oxIWwxQIqtG1u+lztXkRBnpA7VSsBXJmuLxUcpwytEzr
 72E56o0tTl6ansgtamVLbtADJ1f5velnaaRqQZLQUtatEtN1pNZLF0UBy g==;
X-CSE-ConnectionGUID: H9Ib5flrSg2hUATot2towQ==
X-CSE-MsgGUID: D1CEIxIMRdyiUcc91GAxxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3430046"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3430046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:41:09 -0800
X-CSE-ConnectionGUID: Qqi+LrMXScuMAnutWdgE5A==
X-CSE-MsgGUID: HjrgxenLSZ+EPyTZsJ6n4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9503329"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:41:06 -0800
Date: Fri, 13 Nov 2026 18:41:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?=
 =?utf-8?Q?e_for_drm=2F{i915=2C_xe}?= =?utf-8?Q?=3A?= Make unclaimed mmio
 detection lockless and enable it for xe
Message-ID: <avc9nyu-ovaH3LuG@intel.com>
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <179458245157.20639.5243522719041784725@9ac1b63fe3ea>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <179458245157.20639.5243522719041784725@9ac1b63fe3ea>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 03:07:31PM -0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/{i915, xe}: Make unclaimed mmio detection lockless and enable=
 it for xe
> URL   : https://patchwork.freedesktop.org/series/178490/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4=
d_BAT -> xe-pw-178490v1_BAT
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **FAILURE**
>=20
>   Serious unknown changes coming with xe-pw-178490v1_BAT absolutely need =
to be
>   verified manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-178490v1_BAT, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>=20
>  =20
>=20
> Participating hosts (13 -> 13)
> ------------------------------
>=20
>   No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
>   Here are the unknown changes that may have been introduced in xe-pw-178=
490v1_BAT:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
>   * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
>     - bat-ptl-2:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb2=
4eb941e5ba916e42784af6f4d/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.=
html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178490v1/bat-ptl-=
2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html

xe is very borked. Looks like intel_alpm_disable() is one main culprit:

<7> [78.666940] xe 0000:00:02.0: [drm:intel_psr_disable_locked [xe]] Disabl=
ing PSR1
<6> [78.673547] ------------[ cut here ]------------
<4> [78.673558] xe 0000:00:02.0: [drm] Unclaimed read from register 0x62950
<4> [78.673565] WARNING: drivers/gpu/drm/i915/display/intel_de.c:263 at che=
ck_unclaimed_mmio_post+0x77/0xb0 [xe], CPU#2: kms_flip/1657
<4> [78.673992] Modules linked in: snd_hda_codec_intelhdmi snd_hda_codec_hd=
mi xe drm_gpuvm drm_gpusvm_helper drm_buddy gpu_sched drm_ttm_helper ttm dr=
m_suballoc_helper drm_exec drm_display_helper cec rc_core drm_kunit_helpers=
 kunit i2c_algo_bit hid_sensor_custom overlay hid_sensor_hub hid_generic in=
tel_ishtp_hid hid intel_rapl_msr intel_uncore_frequency intel_uncore_freque=
ncy_common x86_pkg_temp_thermal intel_powerclamp cmdlinepart spi_nor corete=
mp mtd mei_gsc_proxy snd_hda_intel snd_intel_dspcfg snd_hda_codec ucsi_acpi=
 typec_ucsi typec snd_hda_core wmi_bmof kvm_intel snd_hwdep snd_pcm kvm r81=
69 irqbypass snd_timer binfmt_misc aesni_intel gf128mul i2c_i801 snd intel_=
cstate spi_intel_pci intel_skl_int3472_tps68470 tps68470_regulator i2c_mux =
realtek i2c_smbus spi_intel e1000e soundcore clk_tps68470 video mei_me phy_=
package phylink idma64 mei intel_pmc_core int3403_thermal nls_iso8859_1 pro=
cessor_thermal_device_pci processor_thermal_device processor_thermal_wt_hin=
t platform_temperature_control pmt_telemetry
<4> [78.674373]  processor_thermal_soc_slider pmt_discovery pmt_class proce=
ssor_thermal_rfim acpi_tad intel_skl_int3472_discrete wmi intel_hid process=
or_thermal_rapl intel_pmc_ssram_telemetry intel_rapl_common int3400_thermal=
 sparse_keymap pinctrl_intel_platform intel_pmc_pwrm_telemetry acpi_thermal=
_rel acpi_pad intel_skl_int3472_common intel_ish_ipc processor_thermal_wt_r=
eq processor_thermal_power_floor intel_vpu intel_ishtp thunderbolt processo=
r_thermal_mbox igen6_edac int340x_thermal_zone intel_vsec dm_multipath msr =
nvme_fabrics fuse fsdev_dax efi_pstore autofs4
<4> [78.674512] CPU: 2 UID: 0 PID: 1657 Comm: kms_flip Tainted: G S   U  W =
          7.4.0-rc2-lgci-xe-xe-pw-178490v1-debug+ #1 PREEMPT(lazy)=20
<4> [78.674524] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER, [W]=3DWARN
<4> [78.674530] Hardware name: Intel Corporation Panther Lake Client Platfo=
rm/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3514.D01.2512291130 12/29/2025
<4> [78.674536] RIP: 0010:check_unclaimed_mmio_post+0x80/0xb0 [xe]
<4> [78.674917] Code: 48 85 ff 74 04 48 8b 7f 08 4c 8b 77 50 4d 85 f6 74 3e=
 e8 73 67 2e e1 48 89 c6 48 8d 3d 69 bd 21 00 45 89 e0 4c 89 e9 4c 89 f2 <6=
7> 48 0f b9 3a c6 83 38 07 00 00 00 5b 41 5c 41 5d 41 5e 5d 31 c0
<4> [78.674924] RSP: 0018:ffffc9000bea7498 EFLAGS: 00010246
<4> [78.674934] RAX: ffffffffa1420138 RBX: ffff88812c48a000 RCX: ffffffffa1=
427a46
<4> [78.674940] RDX: ffff8881067ecf10 RSI: ffffffffa1420138 RDI: ffffffffa1=
20c820
<4> [78.674944] RBP: ffffc9000bea74b8 R08: 0000000000062950 R09: 0000000000=
000000
<4> [78.674950] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000=
062950
<4> [78.674955] R13: ffffffffa1427a46 R14: ffff8881067ecf10 R15: 0000000000=
000000
<4> [78.674960] FS:  0000766c5546a2c0(0000) GS:ffff8884e5d42000(0000) knlGS=
:0000000000000000
<4> [78.674966] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [78.674972] CR2: 00007546fc3dbb68 CR3: 0000000129117004 CR4: 0000000108=
f72ef0
<4> [78.674977] PKRU: 55555554
<4> [78.674982] Call Trace:
<4> [78.674987]  <TASK>
<4> [78.675000]  lnl_mmio_read+0xd1/0xe0 [xe]
<4> [78.675406]  intel_alpm_disable+0xad/0x120 [xe]
<4> [78.675829]  intel_ddi_disable+0x15a/0x230 [xe]
<4> [78.676215]  intel_encoders_disable+0x9c/0xd0 [xe]
<4> [78.676557]  hsw_crtc_disable+0x5b/0x160 [xe]

Cc:ing some people.

>     - bat-lnl-1:          [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb2=
4eb941e5ba916e42784af6f4d/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.=
html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178490v1/bat-lnl-=
1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
>=20
>   * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
>     - bat-ptl-2:          [PASS][5] -> [DMESG-WARN][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb2=
4eb941e5ba916e42784af6f4d/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@d-edp1.=
html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178490v1/bat-ptl-=
2/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
>=20
>   * igt@kms_force_connector_basic@force-connector-state:
>     - bat-wcl-2:          [PASS][7] -> [ABORT][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb2=
4eb941e5ba916e42784af6f4d/bat-wcl-2/igt@kms_force_connector_basic@force-con=
nector-state.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178490v1/bat-wcl-=
2/igt@kms_force_connector_basic@force-connector-state.html
>=20
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-bmg-2:          [PASS][9] -> [ABORT][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb2=
4eb941e5ba916e42784af6f4d/bat-bmg-2/igt@kms_force_connector_basic@prune-sta=
le-modes.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178490v1/bat-bmg=
-2/igt@kms_force_connector_basic@prune-stale-modes.html
>=20
>   * igt@xe_module_load@load:
>     - bat-wcl-1:          [PASS][11] -> [ABORT][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb=
24eb941e5ba916e42784af6f4d/bat-wcl-1/igt@xe_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178490v1/bat-wcl=
-1/igt@xe_module_load@load.html
>=20
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - bat-bmg-3:          [PASS][13] -> [ABORT][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6136-d41695c479e8bb=
24eb941e5ba916e42784af6f4d/bat-bmg-3/igt@xe_query@multigpu-query-topology-l=
3-bank-mask.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178490v1/bat-bmg=
-3/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
>=20
>  =20
>=20
>=20
> Build changes
> -------------
>=20
>   * IGT: IGT_9190 -> IGT_9191
>   * Linux: xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d -> xe-pw-1784=
90v1
>=20
>   IGT_9190: 9190
>   IGT_9191: 9191
>   xe-6136-d41695c479e8bb24eb941e5ba916e42784af6f4d: d41695c479e8bb24eb941=
e5ba916e42784af6f4d
>   xe-pw-178490v1: 178490v1
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178=
490v1/index.html

--=20
Ville Syrj=E4l=E4
Intel
