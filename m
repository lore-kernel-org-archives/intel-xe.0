Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D0ECCFA05
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 04:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7914010E078;
	Sat,  8 Nov 2025 04:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgoZGUeJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C7910E078
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 04:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762574807; x=1794110807;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Bq+LWQpMQY0Sam5OgmnC9a2Dy43jet3fVUjtIGENY+w=;
 b=JgoZGUeJQ5bOFyAosQa7kVCA0m8rqRwUUtVs7WRP1VEQ3/YPjTJ6lwbF
 +Ff+pvRM03e4wMkKuKS9pPQwkX3BiilLmR755P2GsUs+CwTmDabQnQlWQ
 yd4Fnn1ETfYCHjsrP7Nxej9voB3dFdheqAbWFpxnny1Uawz+AEgYnZc7Y
 Mub20jlnGWo0XswiZXDnRijTxq+V/vt2ZevGK7D+W5HTum3vygrRhNyDo
 hBkFP8wCnJsULTJTSoj54M1TUjS6gE2wG951JcKDwSA//YYyXZ9cXXF5Z
 MzWDPEKYSmFdA2MO8O3TWwfyBQ3UQ8YfbKToRGs6gvXGqZpXstc+uL2Og Q==;
X-CSE-ConnectionGUID: luH5ROr2RnOrdcbbLOaWEQ==
X-CSE-MsgGUID: ZyvD7y0ySNiB4MHZalNEnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="52286104"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="52286104"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 20:06:47 -0800
X-CSE-ConnectionGUID: fzhgYljJRdOczJ1EiWWSRA==
X-CSE-MsgGUID: vqYrCyXRRJi7RDGY+qsvzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="193230172"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 20:06:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 20:06:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 20:06:46 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 20:06:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGvyIJ4XXgLDhrd8Ki7R+E9WNymfwD94CAdCSSVKamqElpLISApySx/12P+C7uEzjxt+ylWil24ob0EatLmuKIqKiqfyv+nDJDJ3OgwV8OsBP2lGg+l/2FMrgHD+PrEio9iSHoS2O9WpFJZcsHnltYpHLdPRvg+xBCVLexfYUdaxLT+i1c0cpr8vcDDDzMz39xos9xpbHPa5ZJKb2vJifvO1BZn2VAdxfuqicVRYIZ8Z3618KBepyuE1VM2n09rrEijJKazXh3nu2TPrvj415Uy5Dk92ZNzqCO74y34plNHvsdPIqyvVHNv+li/yc2FsXtsCCVQgD58UMFgiXU6ziw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qIgGN9lX57RDlluo97bjRgxoFPD+xedxEU21zZ2eg8=;
 b=UPhIcaYk7bwiKkLd4RiReLgeCrrJY4UsBAwRV8xC+5jn4ixJcJ+nLyN+xE1ZA68Nx05phZGgOWX6WkqnnffAwczXTgcSIr/qJmpnkfkE59iVSaWPkrr+1Jn+rjYApTtR1M6yIdn6e9mGzTDxEHzW6XTa2RdVaQPeglpXdJkvog+9m4xhgz1DjjO2vSlxS8MIkFgodfj/nDAoCHqyz3D/xyUNrV7NPKC2tcSBqzPYuUSbVfEXvUSuAOgK23iLWhK8RgJeKtJu6KDiSd3sjlxj3sOSkNB44lJNfCTYH7Y5+W8cbmd+YhF1BtqZ4be8wveYkplYDRA3DLclNet9aDq+Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 04:06:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 04:06:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Gustavo Sousa <gustavo.sousa@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Fix MTL vm_max_level
Date: Fri, 7 Nov 2025 23:06:35 -0500
Message-ID: <20251108040634.6376-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA0PR11MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc6b214-ff12-405a-11bd-08de1e7c3721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3vcrK/ZGN9C0oCKTnMvL0AIVzVn91XE3KJZiM6QXfhB1J0fSBuRDb9GQMDWA?=
 =?us-ascii?Q?1h0SPxpJ0mTELXv3H3N/Hsdm1pAsvx50DiVSaHNObqe88N4lG5ojQZ1htRCT?=
 =?us-ascii?Q?FkoerujGtyhYOc6x0cZjtrWo0CQIh5BJRvolMLtzuO33aY0gL193XX9Bu9nb?=
 =?us-ascii?Q?GE5EfR8aV2qMXLg1gef8EgE48gMEAdIU1n65offtSCbZzZzNvQD+si2QdRzO?=
 =?us-ascii?Q?JvUY5sjYWPvyVgUt+WNlbprsMsbRFOHNqUPyrUQo6BAm8bDdhxNey6h7FrsH?=
 =?us-ascii?Q?61dizciRY1K1z9o7ks+JM6aA+1h3nVXGo3OOZKRiin3Aner8V87sj6spq8OU?=
 =?us-ascii?Q?fgOYnwUR56F/vXI1K8DiFhc53Ces/4JK1nXHj6BBNoYQcIono2/xJ3SHMB85?=
 =?us-ascii?Q?+0+H899vBuw5wzn1ZoQRLKLb2TIRQfqI6hZeT6txNSUtVijU04Nst+kMSeV8?=
 =?us-ascii?Q?5xcxgZKJC6QKJr5zBLPUo2tbvceUtB6195rZsIACbXrRU4cLyvd+6S6mLMna?=
 =?us-ascii?Q?20UYeKS4bml1mNp9MNcHv84vpP7kWfO+2mKvmHfnUzubcB+VxPq++O3glFCs?=
 =?us-ascii?Q?/xn8Z67C9TtZWPi/SRZ2OTqLj/IKsjQoSnowrE8Uvh2gLvHbIoImQrqH73EQ?=
 =?us-ascii?Q?9t84bnhJK9/T5ifY0roKNT3eLHXf3lULSFybzHn81XBwZdFbaiNIMIeBJaQ5?=
 =?us-ascii?Q?3Rlpai4ZoejKtC2OICxohnInxj+m+nouCFNSKmZysrhXgXG5U7hum/pe9O4Y?=
 =?us-ascii?Q?k9aelFT2FmSh5x6eSrBn19RN3Ud7aSYy4ENHchvKDB2gaAfxMrjZRvGo25cw?=
 =?us-ascii?Q?NiTGmer3woto54h0u8EZBzl3BOHnUn35H2DcuEcnsyGUDWnddEVFGu4xE/UE?=
 =?us-ascii?Q?M06AoUMc1R9MN06NeL6QsgIFYNq4S3Se1otqpfaiK15ECmjyrIR6r6PwTLG7?=
 =?us-ascii?Q?VgCxX2bshxQdnDVruGkIUbVUdfIedvB2m1UxLRZQsQ9ReI7V2qZbvA0goG/Z?=
 =?us-ascii?Q?Em3bXOhJp3k8J83uPAkQgBRS7TiTiloAJGeGLrC3e5MP3m8E4z5at3stDmTv?=
 =?us-ascii?Q?W0OV8wJGXLSHOiCVWF+Ghm5x+MJx5cuvpGxm96rPvKmKxIt0ZMICzzIpKLs8?=
 =?us-ascii?Q?OgPc1hQZPmx+n54P3WTZbxGINCWqcxiRWO/2rG0VMYH2rPo0SrkDI8oEtM4h?=
 =?us-ascii?Q?c42EuEbaH5jb8hFY/JLyg3iYWZyCnD6fPZZpehgyH3U33TxG4yc79ESLGwYL?=
 =?us-ascii?Q?s+lEzBKQi8QsFgU2eqpeX4eLGx7/Fu1N4bUu6n/jDt+BNuVS22/Lye6HeuX/?=
 =?us-ascii?Q?orpt3Eqo/JTOTBMIrMRaXHfIGisW+jyJahyYLKWjqH3oXiUyXTHjyUxM27Yg?=
 =?us-ascii?Q?vnz4ACX3iXXRDS++bCpkiS9h3oGMd9fS0F+ClZLUlro7uAA8czwQ8ATTa07C?=
 =?us-ascii?Q?Ya5eKOjM/S96cIgTM+XZ4GRvs6L48efi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qcVvECanmWC96mMhBZ4HenhhUt2AyGmX3s5CY2bwrY1SQLwPDzj2h8PsRUYu?=
 =?us-ascii?Q?3NZcQfPUUtCS/wDU8gehKw8PPX6ps8qL65D/ruDr7X+Zn3Q+71PhPofuXgDK?=
 =?us-ascii?Q?27uLcbVb8WaWeM+/jpgVcHz/qEJ8BdLWws+IVDgQzsHYu46QfZ1taaGKa/ko?=
 =?us-ascii?Q?2IvFunuV7AjgFXp9nT5lgA4juz2gLZTtuQMM7XTAMLOCsoCHt6qgJj0QuLSc?=
 =?us-ascii?Q?M0d2rTM35WnVkE0FyEHLFM+623TTHLKiemrkVAM5y6SPYVF4W0GL46/+gCsj?=
 =?us-ascii?Q?azl8lEia2Xcl4Mi+CqFAjCe1sH7KgH3rNGLnTDzDqTjPUxe1V7JzGcTKPMfc?=
 =?us-ascii?Q?Cv8ItlqJaVHCKT8d2FPV3s5m7EkzC7+ouPDcSvKhnTbmMYMcS3rI7ypPgUWR?=
 =?us-ascii?Q?q2oxHrX4hI1+bmKI7xNXuKdJIAA39ZFgkO5nX76/YGdCKbG/h2Nc376cKRtS?=
 =?us-ascii?Q?pJYa7NvCFPGnoXvKUNrraCzdFix6NxmAebje6OvlcOgpfMasY7wvBrlEQjzS?=
 =?us-ascii?Q?n9mhqCtQ7biZ1Gj28CEPnEPwc+kT4EBFY21b0+XSgPYu+o+QCpCYRpVGRx3P?=
 =?us-ascii?Q?5ex9JM9rB2Fiq+X+waal1g5EHguKixbK9ulyDWPK2RaeEY/9FVJlB1LZIkFV?=
 =?us-ascii?Q?yl3IcZF0FvQgM2soz4Ln3fx2140gz2xi8qyn3WvjCj5Oc43YNVQCOx/2JKit?=
 =?us-ascii?Q?5CNWGVbCu4jlR5Lf2P9e+E5yJCqjxLcO7I3jMIgWfZ4nz2QE0pG4NavbAere?=
 =?us-ascii?Q?VVF2tgipsZnIWurkK2Fvm/PqnB0QQGV1vy1SWEv8mkfD+chmXNXmVb9SBWhw?=
 =?us-ascii?Q?+S4AjyhXMVTZSESNlfNBFmToJATmaS1/6prOqfWBhZ7HHFL5kBvE+YZ41GQX?=
 =?us-ascii?Q?qFWHOLwyMdyIYZH7KBMIOJIW4+qeEidX4h8r3MSsvofO2gOLyI/NejbMxsBt?=
 =?us-ascii?Q?4WE7cLa+qocb36WpAm6VUaww4q2ioYfIKVvHmOA2kaScqPMxwKiNVdwqX25W?=
 =?us-ascii?Q?0Vpj90pL0uiSdW3zdO012xkXqP3PabZgSYsZ7RMJc+mRHTZpQPGk2vsAfwUt?=
 =?us-ascii?Q?kUsRTZ0aIOPfnSFabHkHuBtc+S23oMJYVtmk7/G94rxOBRik4RWD7/cKtbAI?=
 =?us-ascii?Q?XgBvf8xu+Mn+yQgwP0wt2JzK/fg3TFb9UoCWvJiKNezT5nNPL9465b4ls/I+?=
 =?us-ascii?Q?IIIpMhEQ6K4sGA7xio8ZAtqya9g3bquJ1sl8YdjnnwRgzPnycFwSXKEsFtgp?=
 =?us-ascii?Q?irbmRESmVoHXhlV4aw2B4t4f5JRF/jbigF7C87JqGsl0XX5tT2gsi+9+hJ87?=
 =?us-ascii?Q?jq/eob7qJfc+XqT+rzjd99ZNVVXVd5W3ASwYAr2RaUL4GzjUDHIZgBAimNWg?=
 =?us-ascii?Q?SpwOgLO/qmjz0KIWklmm96OwvpxPY88quMuzLpARbvcRaXUqfZIBTArZU0MQ?=
 =?us-ascii?Q?8R2Ygv+gM+WuvfkhvY4wUCXJ1oIbcNrgAwd51mB/VhAxvTCZ2+/jwkp16bSB?=
 =?us-ascii?Q?ZWdnMKRmYY0yr/zhwWKyNOF+fFLZbNhLQAioqA2cv1Bjzxq59M+OWsHb/vVE?=
 =?us-ascii?Q?Dt4nO5D5/lAqiDH+I+xRzv/zMx55w+s1grk1u6CdBy7+XAcgq4HPeMFTIFN/?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc6b214-ff12-405a-11bd-08de1e7c3721
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 04:06:38.5948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjyzLXW16IQIZWExrbrWOwVnrzOhHl1nfE9cprRsIQBJD4a7W8km12zuKuJOCUWQpnTCGqvO9yxg7E9SKOLwTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
X-OriginatorOrg: intel.com
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

MTL was broken after the vm_max_level movement. Get it back to a
working value.

[   37.722413] xe 0000:00:02.0: [drm] Tile0: GT0: VM job timed out on non-killed execqueue
[   37.722465] WARNING: CPU: 0 PID: 12 at drivers/gpu/drm/xe/xe_guc_submit.c:1379 guc_exec_queue_timedout_job+0x2f3/0xe00 [xe]
[   37.722559] Modules linked in: xt_REDIRECT nft_compat nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables qrtr sunrpc bnep snd_ctl_led snd_soc_s\
of_sdw snd_soc_intel_hda_dsp_common snd_soc_sdw_utils snd_sof_probes snd_soc_rt712_sdca regmap_sdw_mbq snd_hda_codec_intelhdmi regmap_sdw snd_soc_dmic snd_hda_intel snd_sof_pci_intel_mtl iwlmvm snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda_mlink\
 snd_sof_intel_hda snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp binfmt_misc snd_sof mac80211 vfat snd_sof_utils fat snd_hda_ext_core snd_hda_codec snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi snd_hwdep \
crc8 soundwire_bus libarc4 snd_soc_sdca snd_soc_core
[   37.722584]  snd_compress ac97_bus uvcvideo snd_pcm_dmaengine iwlwifi snd_seq uvc videobuf2_vmalloc snd_seq_device videobuf2_memops videobuf2_v4l2 snd_pcm processor_thermal_device_pci videobuf2_common processor_thermal_device btusb intel_uncore_frequency processor_thermal_wt_hint intel_uncore_frequency_common platform_temp\
erature_control videodev btmtk spi_nor processor_thermal_soc_slider x86_pkg_temp_thermal btrtl snd_timer iTCO_wdt processor_thermal_rfim intel_powerclamp btbcm intel_pmc_bxt snd intel_rapl_msr processor_thermal_rapl coretemp iTCO_vendor_support mei_gsc_proxy btintel intel_rapl_common rapl intel_cstate cfg80211 bluetooth mc in\
tel_pmc_core mtd soundcore acer_wmi mei_me intel_uncore processor_thermal_wt_req i2c_i801 spi_intel_pci pmt_telemetry platform_profile mei processor_thermal_power_floor spi_intel i2c_smbus pmt_discovery igen6_edac pcspkr rfkill wmi_bmof idma64 processor_thermal_mbox intel_hid pmt_class int3403_thermal int3400_thermal joydev i\
nt340x_thermal_zone acpi_pad sparse_keymap
[   37.722611]  intel_pmc_ssram_telemetry acpi_thermal_rel acer_wireless loop nfnetlink zram lz4hc_compress lz4_compress dm_crypt xe drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_exec drm_gpusvm_helper i915 nvme i2c_algo_bit nvme_core drm_buddy ucsi_acpi ttm typec_ucsi typec nvme_keyring nvme_auth hkdf drm_displa\
y_helper hid_multitouch polyval_clmulni thunderbolt intel_vpu ghash_clmulni_intel cec vmd i2c_hid_acpi video intel_vsec i2c_hid wmi pinctrl_meteorlake serio_raw i2c_dev fuse
[   37.722638] CPU: 0 UID: 0 PID: 12 Comm: kworker/u88:0 Not tainted 6.18.0-rc2+ #37 PREEMPT(voluntary)
[   37.722641] Hardware name: Acer Swift SFG14-72/Coral_MTH, BIOS V1.01 11/06/2023
[   37.722643] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
[   37.722649] RIP: 0010:guc_exec_queue_timedout_job+0x2f3/0xe00 [xe]
[   37.722722] Code: 4c 24 10 44 89 44 24 08 e8 5a 95 f1 d4 44 8b 44 24 08 8b 4c 24 10 48 c7 c7 00 b7 25 c1 48 8b 54 24 18 48 89 c6 e8 4d 59 37 d4 <0f> 0b 80 3c 24 00 0f 85 55 03 00 00 49 8b 47 58 a8 01 75 1a 49 8b
[   37.722723] RSP: 0018:ffffd468000f7d80 EFLAGS: 00010246
[   37.722725] RAX: 0000000000000000 RBX: ffff8e3d4e215c00 RCX: 0000000000000027
[   37.722726] RDX: ffff8e40ae61cfc8 RSI: 0000000000000001 RDI: ffff8e40ae61cfc0
[   37.722727] RBP: 00000000fffffffb R08: 0000000000000000 R09: ffffd468000f7c20
[   37.722727] R10: ffff8e40c09fffa8 R11: 00000000fffbffff R12: ffff8e3d44c00028
[   37.722728] R13: ffff8e3d807d4000 R14: ffff8e3d807d4018 R15: ffff8e3d95c9d600
[   37.722729] FS:  0000000000000000(0000) GS:ffff8e4116110000(0000) knlGS:0000000000000000
[   37.722729] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   37.722730] CR2: 00007ff1f3e02720 CR3: 0000000113c8d005 CR4: 0000000000f70ef0
[   37.722731] PKRU: 55555554
[   37.722731] Call Trace:
[   37.722734]  <TASK>
[   37.722735]  ? __pfx_autoremove_wake_function+0x10/0x10
[   37.722740]  drm_sched_job_timedout+0x81/0x170 [gpu_sched]

Fixes: 50292f9af8ec ("drm/xe: Move 'vm_max_level' flag back to platform descriptor")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---

This was a very painful bisect today that took me the entire day. :(
The -rc1 was not working for me due to the disk-encrypt so I had
to get an -rc2 reverting everything and run a reverse bisect on the
reverts until I found this commit:

50292f9af8ec ("drm/xe: Move 'vm_max_level' flag back to platform descriptor") 

I reviewed it and I was convinced that MTL is xelpg and that '4' was also
the right value for that. But then I boot old working kernel on my MTL and
I  could see '3' there from the debugfs/info.

So, this patch here fixed it for me.

Looking to the CI page for the drm-xe-next I'm now wondering if we have
more busted platforms there.

Also perhaps even some mismatch in the GT version with the platforms? :/

Thoughts?

Please help me to get this figured out and fix before 6.18!

Thanks,
Rodrigo.

 drivers/gpu/drm/xe/xe_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1959de3f7a27..cd03b4b3ebdb 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -333,7 +333,7 @@ static const struct xe_device_desc mtl_desc = {
 	.has_pxp = true,
 	.max_gt_per_tile = 2,
 	.va_bits = 48,
-	.vm_max_level = 4,
+	.vm_max_level = 3,
 };
 
 static const struct xe_device_desc lnl_desc = {
-- 
2.51.1

