Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D536CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 14:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC9510E400;
	Mon, 10 Nov 2025 14:45:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a7VNbnAc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999BA10E400
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 14:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762785904; x=1794321904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IZ1rpeZq59gc8fwH1sCQ7f/a+NhSgZUUXQM3tNS2S6w=;
 b=a7VNbnAcuK9GXlao7NPOhc8TlcjokaumgmYK9v/AsiolyzGbQYO+uwUM
 Pn0rp4iqEK+rhloslGNY/0DmrPUwTBHXRINJmOvYGk9Fu2BdqE0RD0ATG
 vgMagqrPZwz9VqMuuRvUo8rokfCQfkQ3Tf79+QR8IVRByhhOvR4EfVYs8
 DOdNCihI43XrCMsW8K23V7+ukLbLWfoS+zcUkgwU6JKqVOIqZB++W2PV/
 pqPhUs1qaOis4jCi2FUVD556cRsiA844dRY5n6h8ZhI4P9dTPGHdzebr2
 ApUbtkC9gdXZJwTE/njVK5Anqa/d0qRl43D2+w5+keJq8px+oiRFoHL7+ g==;
X-CSE-ConnectionGUID: yJj2mqwbTJmsm8T1GNK2wQ==
X-CSE-MsgGUID: Ii4n4SlaQUCDZeRDWJNnbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="68694068"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="68694068"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 06:45:03 -0800
X-CSE-ConnectionGUID: Y+EjTSYlS1mEg0zYogBwdA==
X-CSE-MsgGUID: fPE/bIVATQ2SeNzl17MOIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="225947960"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 06:45:03 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:45:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 06:45:02 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:45:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciJuybgaqAMxawdbtXiXrghmzSZGb4WPOZobH24gcaTs2LDh+yFcRAF/E9NhI8U/lAunyvxigo96aU/JBz+rQiIzFVcBulPvi/uq8jgEVpiqReYvRN0/y6AtjFkmhDYx/JESjd4HG2UIEOipH3rA61WbKrH0x+gnigQe4prd8zelg+vErLWju54ZunduEL2KhMrp1UEAEqQLtihnaggEszLgF4/7GzO4Pbej112j0H5Zj6NsHIcbX/iNRdDXWRwOuHiUF0yFHORp6u0nGvm6M+Jb1k9a0RHoX1KYTmPTJaXaw4cSOPsP+loisg0FEqKlQoj+dYc1vD6SztzhVb/hYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+33StDoOOL6SijqLnbttJBuXnZzkwV2qLQwrT6O9Xw=;
 b=tMn6eaOFZ/Wq76ElzXfZSpC/7GbDJhjDIPuED4AAzHuRTGUPxpUnLV116+CkVZFMcRPUJST4lh6UWwN6BNWllJu6pfWK5X0ebK1XqfRZ4P/Kit7QdM8ZXP1Fa3V4UB9tdsvX8KQEgGn5vZcqWXIatq//MVdJ5aXZOOpBl90hWzhhlJE2uOsum18uxKbZzSwLLZX/STGEtWcYJD1gIpx/s6+phjydHF+ChPYOnqqUSbPj9ihap2GV98c3HvKrVVNcpuKmS9ynN26Me3rl4llX5uMfTi3cpYV+SIP2sqIzP2sRcTecjHJA3+CAGM4Brs6I+I+vLaLcf31kaOS6+y4i2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 14:44:54 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 14:44:54 +0000
Date: Mon, 10 Nov 2025 08:44:52 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Fix MTL vm_max_level
Message-ID: <ngvudjhai4u2ccrlaacv5dbvudbpvqkwrm66yeyjmhzevrt34v@j4qzkvtqsx4m>
References: <20251108040634.6376-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251108040634.6376-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3d88ad-e6b1-4267-01cc-08de2067b64b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cu35MkOZ7gN66rvqPWmVaov9Ofw/3/ThFSFc9qtbwE76nN8hE342fozHOjVA?=
 =?us-ascii?Q?J6/BvN78et0ZE9qIaYODlmPkt4oFeu45pIcA6Hl1CIgl0p4GszFIy82qgsrf?=
 =?us-ascii?Q?ZLsMxtA4SP6/EdNXD+3NG+ayFOasB+fR6BfkWUOp/R0UDDh3GqjmTlQBtGNu?=
 =?us-ascii?Q?njcmotge+Y3jGFN0w/9Lw0asujc/teQ/VrwJAM0xMU3HsvzBMzxHuCGQV5ff?=
 =?us-ascii?Q?SdimP4zcSp7zJOI4ZFpx65R5l4Sq2U3wFKKfNs9+UcmyYAf4RvkuylNSYpR+?=
 =?us-ascii?Q?lncYJEsDuxaTYb8R8All90CrpO/cATmPQ53OZTQ10LthgAa2mUpx9QZ32yo7?=
 =?us-ascii?Q?Y7KkUAGZaJxPT0ipsUTco4WpyzqA4/0wlbvhvIbesKbspbvk2E6zButUOwmw?=
 =?us-ascii?Q?N9QoVe4s+giGjdGZTzR4Q4d1XPoD32PUmof+aYL0BFfrE9PFt0KsTo3Zsz+L?=
 =?us-ascii?Q?HHwGsBDXSsEnINgPk/rnOy0ZAT0Gx7opaALVe6RT5PGh9IWvk42cJQNRIFE6?=
 =?us-ascii?Q?yV1K1M7Rg04e8lEKLiQJhxOt/J0CJZi0O8qe3aDDg3LdtPA+rKESUmaGe3Ar?=
 =?us-ascii?Q?DO6vhCmWJN33Du8zFJHtWwABYmNNB3tqwo7c+WqyhEoA26INJu2D6GCvSlau?=
 =?us-ascii?Q?Rc0FLPirBc19L9sFFpCVfIrviG51827YbRXIs1/F8vl6aO0HwTfKoouezvdh?=
 =?us-ascii?Q?2CPzJJClLCrP7yf0RWuKEjH0ZavTcu7G98Veoeva76pjmzQmIsN6EeWh32gf?=
 =?us-ascii?Q?W7sh/+7UMC4dSQM99vyMNS7d2nSBUbOCiWH6bCR+6pMXWuD7UQzj0T+Qh3Bb?=
 =?us-ascii?Q?2Z6iRR3PGp4wDg+NlUOrVBSXW1OGyuSA1OSp2C55i7++ui9qmU7DaGQm36ls?=
 =?us-ascii?Q?VPcgQyZn2ndhlujcojsB6FHMuHJrgiijc3jkr/nOS7VdXo5anvWhUhi2EMEw?=
 =?us-ascii?Q?cjNIF3XzxdPCjZjj6A6pHGpkkFPN2ASVEfRgVAWz1dq6lEzHHNnUjo2cNNV8?=
 =?us-ascii?Q?jxRWsoZRnZHovm1HYWNTWCGy0TmjicluUMzfJy/9XhAOGSQa8xNJPvQq+qDt?=
 =?us-ascii?Q?55ExAxx3/3KPMmoEwD6DYvGBDlYpdQAoyLOfFc6ykDjO2SPOliiM3ASBiCun?=
 =?us-ascii?Q?Wo4j0/gsoCAbLBU/5A2OHdjSG/+Nct1f+aDZzSP1J5DSc3SADN4YXZWnwyGE?=
 =?us-ascii?Q?AzVqAZivgiRxYHw7djYt8TxPAXIbC2HmbH/6u+xW8R32jDjyfu48ZzAHYrzL?=
 =?us-ascii?Q?5PLvEea8YO51Z2KcZw4RXAtNzD4xOYzLdLIrwNpzAEFsqANq3ALT+cwzTaEh?=
 =?us-ascii?Q?0A0xnlnOk/9lg3hd9YR6lvSDteK+z9gOii/hEbmmiXc4QvdSVJ/O4fiCgNhA?=
 =?us-ascii?Q?TNPLgCpcUsaXizuPeNSwpXRokHUdAltVSq6FgNa+JlQ+aoUGuB3VtKbWbrQB?=
 =?us-ascii?Q?DD+Oc9pCEd7a7aI8pFv1Xc797vJMBI1t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oqee47PhldNG5+rz6KtEHBIMO+ZAKqkM10PaPzUFTmaBoUIDY795tQe0fsJ0?=
 =?us-ascii?Q?mLOHcC4Ku8YAx/npgQWeOhrGrLzmUX9s4grk5uJ35VCcoOF5e3WUmH15JZHQ?=
 =?us-ascii?Q?9bL98YGg0XoNQ6L+H9iM2qFOzEIgEkrrt8AhAanFnpEw9llNmjGbzwfGr0Rg?=
 =?us-ascii?Q?0uCy30DHSXUMAw4mUkVk7QeW6mOADYIPRqkejuvATuLf1LyK71gsBDB/aMf+?=
 =?us-ascii?Q?YpV7IHakke2PQoluPTc8E9AFC5v6ohKQrWyedbxdGnFmrZvvsi30R0UicD6K?=
 =?us-ascii?Q?JMoIMMg1G78BZA0b88WQklNxDDQpIwNyCG7KsoZL0WOcDJ1PO5ZLx07YxVqR?=
 =?us-ascii?Q?0SEAzaJykzcdi9yxuSgvDOESoMrOcs7DYRVnGsCRempQYMmE9VwlKopqYH3M?=
 =?us-ascii?Q?7FsSLWvxg7UvIVv5Eto9OYbsBL/emsbBrpzTiyE3aTm1o48Y5CnEkGSuZaiR?=
 =?us-ascii?Q?OGNVSwffsgKWZBwRxIpFoJfcu0yeKMdfL6R0hh9sVvZBu8QW3lmMJjunYY3a?=
 =?us-ascii?Q?c3fFUYG0PAdxyMaTOiQAsUkMscqybM9uYKJhCelHRhytJ6evXhRGKGEEY8f1?=
 =?us-ascii?Q?bQWLX/E8HuNBdMdvnUUy9BnZ+uvG0xGMFz1Xrm6tUYu8ezf5AJm5fM9iA7JO?=
 =?us-ascii?Q?q0ic7KFhpXnpHP3p8mGdVYZSJ2DvIbInySXJ0RvgE/Na2DsRrl2O1ubdxamW?=
 =?us-ascii?Q?BEXy7rF2cEos/JpdC8t2I73tWQZweSOkHmP9LLr6ShESUW5rcm/tHbgt5Jgk?=
 =?us-ascii?Q?vC7UJX99+2UkRDnVXGLb0WA41Eue5lHp5fUVmsGHEeyusLg4urK/yl+McLW0?=
 =?us-ascii?Q?1FLjP0LnnI7QMGTOLIcSG2yk5bx+SDJtvrMnlqs1uC3vKNdPvXfbyQZKOB39?=
 =?us-ascii?Q?bvOa37YXP+iu7dRTwndP97cp9rAXyMRuahiYCSnQf+K0kdDUCB42t+sXU0XN?=
 =?us-ascii?Q?fkGHwHg8fosAT0WEt54kjI2ReFUAY4y1sivSureBBLgIkBZiUF5R35mFO6aZ?=
 =?us-ascii?Q?rQQTN1n4QrE6He7ABXd0XyNWkwC2oILY33urcFxSumfmVm1SwT5/N1LFps8M?=
 =?us-ascii?Q?81S/bdQuVpyYzK6OWcYW4X8Dwo6aeX89Rbsrs6bZUJAwC7wTNgxnJYeQrmLk?=
 =?us-ascii?Q?Kk6CXqaFMv9d+AFJXDqioNnEu5ORY0t54PP/FBSYRCIQJ2IF1YlVJFRQsW8R?=
 =?us-ascii?Q?4ve7mPLEWT2EMjl4/KzJ1L66YIpeR62Ncld0a0uGU+MRmsRGmh2J5BQcnZTn?=
 =?us-ascii?Q?a2QX7QFn4wnfxrjnUcx03ITxEXQLD1IeSMSg+nb4icRjlJC8+mu20NV5Ahk5?=
 =?us-ascii?Q?/QRvIJ71M2ujaO0dpRnbXdaG+oB+9+yJ6UEfecHFILLL5+O3k27YgJwztlvY?=
 =?us-ascii?Q?jqMtdEExgTLIhJjQUHBAX8CCxxbUiYKLIbkou7fp9C8ZxkdSwzmsDHfJ31Un?=
 =?us-ascii?Q?Ux/r1aJLJ0mtuBGGzPVeStFPtzAM3USRIP+mtUO2cJu3E+HMLVZJG2SYp2nY?=
 =?us-ascii?Q?JXEtJsGE7AcNn6bjUAtYUWIUcxFBEGc58XKd24dDmLedyHzDGaH7Im5YaXs/?=
 =?us-ascii?Q?K1WTPTdWz8gNiUpKBXOBdVaD/cNagDYU62ydr/5a/Pe/Xs1niXbDCxYu+OqH?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3d88ad-e6b1-4267-01cc-08de2067b64b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 14:44:54.7371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nAAFA3HizjnWJy6DCDEGwRy1WZC9xulxMuoGeZZB/gKZZMjH71HLpoFOrWvYiiurrOVPqdNrxcvWDpvMylmy/kr8UaJw0UZnKu1UzKUzM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
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

On Fri, Nov 07, 2025 at 11:06:35PM -0500, Rodrigo Vivi wrote:
>MTL was broken after the vm_max_level movement. Get it back to a
>working value.
>
>[   37.722413] xe 0000:00:02.0: [drm] Tile0: GT0: VM job timed out on non-killed execqueue
>[   37.722465] WARNING: CPU: 0 PID: 12 at drivers/gpu/drm/xe/xe_guc_submit.c:1379 guc_exec_queue_timedout_job+0x2f3/0xe00 [xe]
>[   37.722559] Modules linked in: xt_REDIRECT nft_compat nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables qrtr sunrpc bnep snd_ctl_led snd_soc_s\
>of_sdw snd_soc_intel_hda_dsp_common snd_soc_sdw_utils snd_sof_probes snd_soc_rt712_sdca regmap_sdw_mbq snd_hda_codec_intelhdmi regmap_sdw snd_soc_dmic snd_hda_intel snd_sof_pci_intel_mtl iwlmvm snd_sof_intel_hda_generic soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common snd_soc_hdac_hda snd_sof_intel_hda_mlink\
> snd_sof_intel_hda snd_hda_codec_hdmi soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp binfmt_misc snd_sof mac80211 vfat snd_sof_utils fat snd_hda_ext_core snd_hda_codec snd_hda_core snd_intel_dspcfg snd_intel_sdw_acpi snd_soc_acpi_intel_match snd_soc_acpi_intel_sdca_quirks soundwire_generic_allocation snd_soc_acpi snd_hwdep \
>crc8 soundwire_bus libarc4 snd_soc_sdca snd_soc_core
>[   37.722584]  snd_compress ac97_bus uvcvideo snd_pcm_dmaengine iwlwifi snd_seq uvc videobuf2_vmalloc snd_seq_device videobuf2_memops videobuf2_v4l2 snd_pcm processor_thermal_device_pci videobuf2_common processor_thermal_device btusb intel_uncore_frequency processor_thermal_wt_hint intel_uncore_frequency_common platform_temp\
>erature_control videodev btmtk spi_nor processor_thermal_soc_slider x86_pkg_temp_thermal btrtl snd_timer iTCO_wdt processor_thermal_rfim intel_powerclamp btbcm intel_pmc_bxt snd intel_rapl_msr processor_thermal_rapl coretemp iTCO_vendor_support mei_gsc_proxy btintel intel_rapl_common rapl intel_cstate cfg80211 bluetooth mc in\
>tel_pmc_core mtd soundcore acer_wmi mei_me intel_uncore processor_thermal_wt_req i2c_i801 spi_intel_pci pmt_telemetry platform_profile mei processor_thermal_power_floor spi_intel i2c_smbus pmt_discovery igen6_edac pcspkr rfkill wmi_bmof idma64 processor_thermal_mbox intel_hid pmt_class int3403_thermal int3400_thermal joydev i\
>nt340x_thermal_zone acpi_pad sparse_keymap
>[   37.722611]  intel_pmc_ssram_telemetry acpi_thermal_rel acer_wireless loop nfnetlink zram lz4hc_compress lz4_compress dm_crypt xe drm_ttm_helper drm_suballoc_helper gpu_sched drm_gpuvm drm_exec drm_gpusvm_helper i915 nvme i2c_algo_bit nvme_core drm_buddy ucsi_acpi ttm typec_ucsi typec nvme_keyring nvme_auth hkdf drm_displa\
>y_helper hid_multitouch polyval_clmulni thunderbolt intel_vpu ghash_clmulni_intel cec vmd i2c_hid_acpi video intel_vsec i2c_hid wmi pinctrl_meteorlake serio_raw i2c_dev fuse
>[   37.722638] CPU: 0 UID: 0 PID: 12 Comm: kworker/u88:0 Not tainted 6.18.0-rc2+ #37 PREEMPT(voluntary)
>[   37.722641] Hardware name: Acer Swift SFG14-72/Coral_MTH, BIOS V1.01 11/06/2023
>[   37.722643] Workqueue: gt-ordered-wq drm_sched_job_timedout [gpu_sched]
>[   37.722649] RIP: 0010:guc_exec_queue_timedout_job+0x2f3/0xe00 [xe]
>[   37.722722] Code: 4c 24 10 44 89 44 24 08 e8 5a 95 f1 d4 44 8b 44 24 08 8b 4c 24 10 48 c7 c7 00 b7 25 c1 48 8b 54 24 18 48 89 c6 e8 4d 59 37 d4 <0f> 0b 80 3c 24 00 0f 85 55 03 00 00 49 8b 47 58 a8 01 75 1a 49 8b
>[   37.722723] RSP: 0018:ffffd468000f7d80 EFLAGS: 00010246
>[   37.722725] RAX: 0000000000000000 RBX: ffff8e3d4e215c00 RCX: 0000000000000027
>[   37.722726] RDX: ffff8e40ae61cfc8 RSI: 0000000000000001 RDI: ffff8e40ae61cfc0
>[   37.722727] RBP: 00000000fffffffb R08: 0000000000000000 R09: ffffd468000f7c20
>[   37.722727] R10: ffff8e40c09fffa8 R11: 00000000fffbffff R12: ffff8e3d44c00028
>[   37.722728] R13: ffff8e3d807d4000 R14: ffff8e3d807d4018 R15: ffff8e3d95c9d600
>[   37.722729] FS:  0000000000000000(0000) GS:ffff8e4116110000(0000) knlGS:0000000000000000
>[   37.722729] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[   37.722730] CR2: 00007ff1f3e02720 CR3: 0000000113c8d005 CR4: 0000000000f70ef0
>[   37.722731] PKRU: 55555554
>[   37.722731] Call Trace:
>[   37.722734]  <TASK>
>[   37.722735]  ? __pfx_autoremove_wake_function+0x10/0x10
>[   37.722740]  drm_sched_job_timedout+0x81/0x170 [gpu_sched]
>
>Fixes: 50292f9af8ec ("drm/xe: Move 'vm_max_level' flag back to platform descriptor")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
>
>This was a very painful bisect today that took me the entire day. :(
>The -rc1 was not working for me due to the disk-encrypt so I had
>to get an -rc2 reverting everything and run a reverse bisect on the
>reverts until I found this commit:
>
>50292f9af8ec ("drm/xe: Move 'vm_max_level' flag back to platform descriptor")
>
>I reviewed it and I was convinced that MTL is xelpg and that '4' was also
>the right value for that. But then I boot old working kernel on my MTL and
>I  could see '3' there from the debugfs/info.
>
>So, this patch here fixed it for me.
>
>Looking to the CI page for the drm-xe-next I'm now wondering if we have
>more busted platforms there.

we don't have MTL in CI. I'd expect some eventual regressions like this
to happen on not-officially-supported platforms due to that.

This matches what we had in v6.17:

	#define XE_HP_FEATURES \
		.has_range_tlb_invalidation = true, \
		.va_bits = 48, \
		.vm_max_level = 3


	static const struct xe_graphics_desc graphics_xelpg = {
		.hw_engine_mask =
			BIT(XE_HW_ENGINE_RCS0) | BIT(XE_HW_ENGINE_BCS0) |
			BIT(XE_HW_ENGINE_CCS0),

		XE_HP_FEATURES,
	};


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

>
>Also perhaps even some mismatch in the GT version with the platforms? :/
>
>Thoughts?

I went back to check and... from the xe1 platforms, the only with
max_vm_level=4 we should have is PVC. And that looks correct now.

thanks
Lucas De Marchi

>
>Please help me to get this figured out and fix before 6.18!
>
>Thanks,
>Rodrigo.
>
> drivers/gpu/drm/xe/xe_pci.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 1959de3f7a27..cd03b4b3ebdb 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -333,7 +333,7 @@ static const struct xe_device_desc mtl_desc = {
> 	.has_pxp = true,
> 	.max_gt_per_tile = 2,
> 	.va_bits = 48,
>-	.vm_max_level = 4,
>+	.vm_max_level = 3,
> };
>
> static const struct xe_device_desc lnl_desc = {
>-- 
>2.51.1
>
