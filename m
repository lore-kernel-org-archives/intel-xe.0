Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B010C61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 07:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225B510E79E;
	Thu,  9 Mar 2023 07:22:41 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F20210E79E
 for <intel-xe@freedesktop.org>; Thu,  9 Mar 2023 07:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678346559; x=1709882559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7U1Px5x/MudJ4r0kiJH56cDwi+jI0UkLKrq0rqdLCSo=;
 b=lOlLvfQP0g1r2KzxhKCaArAFeACIQr3zA+cyX/Q2IFlF1Y1i3+DuX7rR
 AQJEnRAoFuYsRqbBYsJqGDzPzN94oPwvUwgx1QzmqH+sf+YyHHwAq/c7W
 Xn2f44fGETow8P5eLmLzQ4DCOFg6IoPvumETEDhtLcIY8Mx3D1CSlBV3G
 /lG4gtj8fUsoEaEY8Ez4QRXCT+lnjxJ/igbY00OuwpRicx54SzbhhmhXg
 5rkKtZWWEWCJatgrCsAUvzHnTjy/HPXrn1zdogQ6fNLq4tGIwFAKMp0SO
 rcr8Wt3RpGGKFhU6MBhF5oOTwVYXF70aVum50H201aYCMPvVzxwe1nPw0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320203825"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="320203825"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 23:22:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="1006630487"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="1006630487"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 08 Mar 2023 23:22:38 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 23:22:37 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 23:22:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 23:22:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jje9Cf0H/9u3C/ehb0qMJLyCK6iHo7SZ1Z1S1DaGsT6+s8FqIMKVRpNb0AF7hELK/a0zEYRL6/q15Kpn6A7dRe8ftCWXftXR19G666Iem/WYLBHYBzYYDlM+VDAUK6xD8xm7bQsmaFBK73Z8Ilek9W0GtUsZuTkRJubuzjwpi27vo43NhOSgHEcW1yapa+vdVv0H1XZX0cQHPG7rxhtOfs3hvPjbPjUalnr0BF7X83hTAUYzY3YTfV/5P5rTqsWb5o2kcVKTzndd3da7PNffr8nun/ssOTd9C1qjb3HMVmbX+QS6ktnABipU5nD6h2Qu81btJJJ+52w/BUTDWv7sLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5j/BWLU9S+SoWQMbOJblPHGQGDQyOw2MFC9dB0mVL0=;
 b=WBI2FPc09Z5AERDexYqJxQWkneAWpwWRep/+/yYJhGlj55VY+KnBi8myVeq+JAbZmfPDJ9TbsIT+V5ADZ04yjdY2wSKFjRrHtBtQOqVRsRMbr1g7s9sp/BU+Jm9Lv7Rc8D3mpIPPIa7hN0GQ+I5ai0Qvylist3A6veVusoMsNUhoQVZYgRCY6Bu9glIjhoKoVxTPRKriQnaq+cFL/hIhJvkIANiACMNBYJQb7Yb4Uv3p1grR5l5CejzOBVrBedHMQ8EQCz6sm345+10tYajTF/SW4F70uW9p/UlHyFVCNMFfg/MpRimR9k1W1RqAVengosL0e9miB3qSqc+ckbnkwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 07:22:35 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::2c5a:9a41:c5e2:185f]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::2c5a:9a41:c5e2:185f%6]) with mapi id 15.20.6178.018; Thu, 9 Mar 2023
 07:22:34 +0000
Date: Wed, 8 Mar 2023 23:22:03 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZAmJG/mzIwXT6y+k@nvishwa1-DESK>
References: <20230308191013.40431-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230308191013.40431-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:a03:100::33) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BN9PR11MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: c31b5ae2-00ed-4054-d3f1-08db206f0d85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6qZ6NSgZY9NJxeiR5mNEgb+4cSlsMTGWXlFciKgZBFe8H7Zta/jQovRDYlDktFDJexMdWUpHHMmHI/KhVdnPGjTvX1FeHnP5SXn3e9iIhn03K24dL37562CLr8DrNrPT/szV2yo7uWw7zeXb6iDY3sTl9yHJDQyqGBF2mdrSl8qCOajmi80C+lWGE7NqsZ1vO2qY2U72KusHQ3ir7uL8jCZ51bVsvCE3meZ3812oIH0J2cNsqZQfmELx6BABU0B9M0SNyUKa27nobBPmdUttAFOvjh18fZvxAaPnL3DuD/zrXDp5NOz2sip01kKWHFoKcQDYRflYm/4FS2NhzCH5HGrC9a5ARG+2b7M3HfnjeJBCVw9h2RBdsSSVg+hBeeUxaK0Je4jamP9QYMrFhYFmCdEk/njknFc/bxTwnnC7W9iGeUNNqXIFrCC9z1bSoy5g+1Xxo2F9mhIBJYSSVR7KhPqLpWQYRl3RTOdSy754JlMITVTBZjcS1Fc9Bl4qkLUkj+bnvbIhNODDURwp6Ci/sHB/o3CBs5rlIjhxgmaQUrRhnoB745fWagydh1ZRebcGgZVA9QQS1B3YhqXcFrZlPV9+DnedGHd8JQ2FmBWFdOE+Z64X6zQOVNWaS/sLuTp2FR63FP5kYIWClMRY4b0Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199018)(66574015)(38100700002)(86362001)(82960400001)(6512007)(6506007)(26005)(83380400001)(9686003)(186003)(6666004)(33716001)(45080400002)(316002)(5660300002)(478600001)(6486002)(6916009)(4326008)(41300700001)(44832011)(2906002)(8936002)(66946007)(66556008)(8676002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WUv281tsAE/8H+d90nVo7Gf6ZfqrV/7mXXtBUkJEQQpTvhViYAK0maLaOb?=
 =?iso-8859-1?Q?kAG60VqdlQLMdrlZjWJVL+x6KbTyoCsTIbqcx6+lH6CtWjNxWNwuuNBeaz?=
 =?iso-8859-1?Q?kYliLIAPQ3AtcAuGRTIrtsCRC4V6owKcBRbJwxxGeaguhajELBUZwzffip?=
 =?iso-8859-1?Q?Sltb2Luq0rET0Rd50LuvmP9+aio4z6i0Hsm4TQdEbgelLpVDdwCcioxPbt?=
 =?iso-8859-1?Q?Pwi+YF9dRYASG0cV9jfaESMQHNPXNEMgdW//lVmIyJQ2JRlsjo1FTufBs6?=
 =?iso-8859-1?Q?Pn1mfl7e1qkQ8f/o09l4PQ7+p0U0VQaJyTxOtFhZei97DtSXhNjQ+OFp6O?=
 =?iso-8859-1?Q?CmUg+Y7XUvGoHzRxiJ7Nirc//l4mXUZs71IKVIYBuDvYIGmj/FHj6s7xpB?=
 =?iso-8859-1?Q?fmXIMxZCIaX0g57BcFjDfnpyucolwdOaq1lDxNYBguCCZAG1RGz2UIPJwH?=
 =?iso-8859-1?Q?QQxmD2buz7FeK+Tjs6NSwl5Ev/7gLb9RGPAuOdl1/QBenFUO+NRqedd/ZD?=
 =?iso-8859-1?Q?6KqXP1eAoZNJPhsDt76z86GrsgfqW25ON+lrkLA2R6eHddF0DHIVLVOlmj?=
 =?iso-8859-1?Q?pgsO1dBtDs+C8zFsPUpVaM/Hq3r4dbvUksxZxAHbr6LSG05WVfx3bsPFZC?=
 =?iso-8859-1?Q?lPWkxdB32hzKfoCw0OreYVsBx9yogW8MD/2OOeX1pu2ob35nc3j/Fwio1Q?=
 =?iso-8859-1?Q?jBpI2oDv7bA6mW4CeC096qsesCzv05FtrrR/U4PRi9rQKnufFtSttwCFJI?=
 =?iso-8859-1?Q?kGKUqXnOrDFxnzbqPTWdFbWy4EBTOjYD24U2oHKXGRz0ZDPU66h3tM0CNb?=
 =?iso-8859-1?Q?SxjctwGv0kF+XPL1kwtVudM+hHCyhXNjObQThZ1oM3wgwZIJcy/bYQD51Y?=
 =?iso-8859-1?Q?BAExtjwg6QbhM398HVEwZnMpiUvJBx/oO7h4sO3Ce7kVkTFkX/QBPyRr51?=
 =?iso-8859-1?Q?rPPhKcxQl24/R7FNZMT7V4PR1k3sEBTwMIYelR9Msm8slACEetvCy56T3Q?=
 =?iso-8859-1?Q?/1Qt/WrwTGzZUTe+wA5NwynneuGVT0RWypdsIL6/GBObQYlE9LkvRd21hp?=
 =?iso-8859-1?Q?TTbniPpPy2EMK2KsZrehXMYMEycxD7o/K/WRcbONRUzwr+LK6NepRv1tTO?=
 =?iso-8859-1?Q?tog4iMkBghbh9zdPSfSBJARI7TvVHxXXbfaFcm6unHpa4t5TEsO3qTSK+8?=
 =?iso-8859-1?Q?rP5tMxBvhPat0TabxC3uD/N9nuNrQVmq92DoqWaTmDKyZQNXvRBIa05K9z?=
 =?iso-8859-1?Q?WOUbsUa6T9f8WcDHXr3V70aAzHW9O/C94NPwXrFcfO0+Tup52KEn+qVuhA?=
 =?iso-8859-1?Q?xGPOF1CwdP8fZueBZbwnIl0zlX4ybmvf4BUJAhVUN9fe9TA9Af3L6oFmje?=
 =?iso-8859-1?Q?UaMlBAqzzlMHHaMnWf28Zpkzv8YsQI7hXuuxrmnAqKG9A/u+eM5rNg8/Rg?=
 =?iso-8859-1?Q?ZdVMm62Xo8K8kyTgXrLsD+68SeITnekD8hrk16xA67bQwBrB01iM3V0xtq?=
 =?iso-8859-1?Q?7hoHFtfVRFbnZlcxMMvTLWB53JbpEmgHR0SWCcbsd5q/D1GFRrIl2uazGE?=
 =?iso-8859-1?Q?cp5RFFNTEGaYezNMFDQS5EG5xtwRNnkmLQ8UYGagCbV96rt5RDuE2SRSs2?=
 =?iso-8859-1?Q?DpgXuzJ+haDUav2adaoSAevzI4JK5UaVHMX/U3KaY2L5ToFOkt+qa7wFEr?=
 =?iso-8859-1?Q?ylsL93nrWHEzekPBGTQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c31b5ae2-00ed-4054-d3f1-08db206f0d85
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 07:22:34.4952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+41nAcb6ZU5FkCgPcBklxCixcETQcD2qwjUxfJ+UCZRxObfj+tfCrdtlaS7s1vGT/mvQgIjqw0SDDqXP6LtYDOPJIzVxMBcdy7a55rU9Q3Hnh2KezSRD1Fg7kR7XmN8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/vm: Use the correct vma destroy
 sequence on userptr failure
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
Cc: intel-xe@freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 08:10:13PM +0100, Thomas Hellstr=F6m wrote:
>Fix the below warning by using the correct vma destroy sequence:
>
>[   92.204921] ------------[ cut here ]------------
>[   92.204954] WARNING: CPU: 3 PID: 2449 at drivers/gpu/drm/xe/xe_vm.c:933=
 xe_vma_destroy+0x280/0x290 [xe]

Unrelated to this patch...not sure why this warning is only there for
userptr BOs whereas prep_vma_destroy() is required for all BOs.

This patch looks good to me.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com=
>

>[   92.205002] Modules linked in: ccm nft_objref cmac nf_conntrack_netbios=
_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib n=
ft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_na=
t ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat n=
f_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw=
 iptable_security ip_set nf_tables nfnetlink ip6table_filter iptable_filter=
 bnep sunrpc vfat fat iwlmvm mac80211 intel_rapl_msr ee1004 ppdev intel_rap=
l_common snd_hda_codec_realtek libarc4 iTCO_wdt snd_hda_codec_generic intel=
_pmc_bxt x86_pkg_temp_thermal iTCO_vendor_support intel_powerclamp coretemp=
 intel_cstate iwlwifi btusb btrtl btbcm snd_hda_intel btintel snd_intel_dsp=
cfg eeepc_wmi snd_hda_codec asus_wmi bluetooth snd_hwdep snd_seq ledtrig_au=
dio snd_hda_core snd_seq_device sparse_keymap cfg80211 snd_pcm intel_uncore=
 joydev platform_profile mei_me wmi_bmof intel_wmi_thunderbolt snd_timer pc=
spkr ecdh_generic i2c_i801 snd
>[   92.205060]  ecc mei rfkill soundcore idma64 i2c_smbus parport_pc parpo=
rt acpi_pad acpi_tad xe drm_ttm_helper ttm i2c_algo_bit drm_suballoc_helper=
 kunit drm_buddy gpu_sched drm_display_helper drm_kms_helper drm crct10dif_=
pclmul crc32_pclmul crc32c_intel nvme nvme_core e1000e ghash_clmulni_intel =
drm_panel_orientation_quirks video wmi pinctrl_tigerlake usb_storage ip6_ta=
bles ip_tables fuse
>[   92.205242] CPU: 3 PID: 2449 Comm: xe_vm Tainted: G     U             6=
.1.0+ #120
>[   92.205254] Hardware name: ASUS System Product Name/PRIME B560M-A AC, B=
IOS 0403 01/26/2021
>[   92.205266] RIP: 0010:xe_vma_destroy+0x280/0x290 [xe]
>[   92.205299] Code: 74 15 48 8b 93 a0 01 00 00 48 8b 83 a8 01 00 00 48 89=
 42 08 48 89 10 4c 89 ab a0 01 00 00 4c 89 ab a8 01 00 00 e9 1b fe ff ff <0=
f> 0b e9 a3 fe ff ff 0f 0b e9 82 fe ff ff 66 90 0f 1f 44 00 00 48
>[   92.205322] RSP: 0018:ffffaadd465c3a58 EFLAGS: 00010246
>[   92.205331] RAX: 0000000000000000 RBX: ffff9706d53ed400 RCX: 0000000000=
000001
>[   92.205341] RDX: ffff9706d53ed480 RSI: ffffffffa756dc2b RDI: ffffffffa7=
60a05e
>[   92.205351] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000002c=
5370a2
>[   92.205361] R10: ffff9706ca520000 R11: 0000000022c5370a R12: ffff9706ca=
d03800
>[   92.205370] R13: 000000000004ffff R14: fffffffffffffff2 R15: 0000000000=
000000
>[   92.205380] FS:  00007fe98203a940(0000) GS:ffff970dffac0000(0000) knlGS=
:0000000000000000
>[   92.205392] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[   92.205400] CR2: 00007fe982ccb000 CR3: 000000010d6e6003 CR4: 0000000000=
770ee0
>[   92.205410] PKRU: 55555554
>[   92.205415] Call Trace:
>[   92.205419]  <TASK>
>[   92.205426]  vm_bind_ioctl_lookup_vma+0x9bb/0xbf0 [xe]
>[   92.205461]  ? lock_is_held_type+0xe3/0x140
>[   92.205472]  ? xe_vm_find_overlapping_vma+0x77/0x90 [xe]
>[   92.205503]  ? __vm_bind_ioctl_lookup_vma.constprop.0+0x9e/0xe0 [xe]
>[   92.205533]  ? __lock_acquire+0x3a3/0x1fb0
>[   92.205543]  ? register_lock_class+0x38/0x480
>[   92.205550]  ? __lock_acquire+0x3a3/0x1fb0
>[   92.205558]  ? __lock_acquire+0x3a3/0x1fb0
>[   92.205567]  ? __lock_acquire+0x3a3/0x1fb0
>[   92.205579]  ? lock_acquire+0xbf/0x2b0
>[   92.205586]  ? lock_acquire+0xcf/0x2b0
>[   92.205597]  xe_vm_bind_ioctl+0x977/0x1c30 [xe]
>[   92.205630]  ? find_held_lock+0x2b/0x80
>[   92.205640]  ? lock_release+0x131/0x2c0
>[   92.205648]  ? xe_vm_ttm_bo+0x40/0x40 [xe]
>[   92.205677]  drm_ioctl_kernel+0xa1/0x150 [drm]
>[   92.205706]  drm_ioctl+0x221/0x420 [drm]
>[   92.205727]  ? xe_vm_ttm_bo+0x40/0x40 [xe]
>[   92.205764]  __x64_sys_ioctl+0x8d/0xd0
>[   92.205774]  do_syscall_64+0x37/0x90
>[   92.205781]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>[   92.205790] RIP: 0033:0x7fe982be8d6f
>[   92.205797] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00=
 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <8=
9> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>[   92.205821] RSP: 002b:00007ffde9f9c560 EFLAGS: 00000246 ORIG_RAX: 00000=
00000000010
>[   92.205832] RAX: ffffffffffffffda RBX: 00007fadeadbe000 RCX: 00007fe982=
be8d6f
>[   92.205842] RDX: 00007ffde9f9c5f0 RSI: 0000000040786445 RDI: 0000000000=
000003
>[   92.205851] RBP: 00007ffde9f9c5f0 R08: 00007fadeadbe000 R09: 0000000000=
040000
>[   92.205861] R10: 0000000000000003 R11: 0000000000000246 R12: 0000000040=
786445
>[   92.205871] R13: 0000000000000003 R14: 0000000000000003 R15: 00007fe982=
e02000
>[   92.205888]  </TASK>
>[   92.205892] irq event stamp: 82723
>[   92.205897] hardirqs last  enabled at (82731): [<ffffffffa617660e>] __u=
p_console_sem+0x5e/0x70
>[   92.205910] hardirqs last disabled at (82738): [<ffffffffa61765f3>] __u=
p_console_sem+0x43/0x70
>[   92.205922] softirqs last  enabled at (82182): [<ffffffffa60f026d>] __i=
rq_exit_rcu+0xed/0x160
>[   92.205935] softirqs last disabled at (82163): [<ffffffffa60f026d>] __i=
rq_exit_rcu+0xed/0x160
>[   92.205947] ---[ end trace 0000000000000000 ]---
>
>Reported-by: Francois Dugast <francois.dugast@intel.com>
>Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
>---
> drivers/gpu/drm/xe/xe_vm.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 6cf7172e84cc..e8e178922082 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -2811,7 +2811,8 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struc=
t xe_vm *vm,
>
> 		err =3D xe_vma_userptr_pin_pages(vma);
> 		if (err) {
>-			xe_vma_destroy(vma, NULL);
>+			prep_vma_destroy(vm, vma);
>+			xe_vma_destroy_unlocked(vma);
>
> 			return ERR_PTR(err);
> 		} else {
>--=20
>2.39.2
>
