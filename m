Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901C0C02184
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 16:44:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA7510E726;
	Mon, 13 Jan 2025 16:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeQUKh9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A730910E726
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 16:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736786657; x=1768322657;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nzXdjP+X+3auyuWiHuB5zwlOQdLDuFwLmkypPXyzFoY=;
 b=FeQUKh9jqjYVGii/m8/xH5BYtezJpGCdmU5Hi78+ftbIngEIWaZyJQ5X
 MWfhNU/TxJUagOkqdAMeqloDaD0famnxXgaC66Ii+8Fc+6KmhK+9WX8fR
 R/gSS8xXpxmK5H1/d7vvNXuHDHpIjHIIiJUtY6gLql4DPP5dQeYFCaPkg
 4nCAnrkEXghPGZkDqi/jwzkuuMcVTV9kP6kZ3HjStF0J9YMEj42r0IxXP
 I0co4hrAZp41bLivjtjvDMlVJ4p3bHvnbUBV9GOxp6g7F4ej8Fz6GU56E
 55PVbJYZh9gN6LQJRS+5y1xyAHzy97VTiXqll/x9AGSdx4tmiYRLF9UCJ w==;
X-CSE-ConnectionGUID: uMAn1dezT2Ck8xrxBozZQQ==
X-CSE-MsgGUID: bEhoXXGfSgWLd7zWnfuexw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47549719"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="47549719"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 08:41:56 -0800
X-CSE-ConnectionGUID: b+0ucPiHRVKibQRFXGNWsw==
X-CSE-MsgGUID: XlAz9DWtRGClhDZC5dRmOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104491620"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 08:41:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 08:41:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 08:41:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 08:41:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqUvDSqktsU1Es9yBG9WxkUWKEfZ+nBkY4fkKCQUu9SHFuYgj9O8hdcnjDuwFOn8hDqQe8X4Qz6QSI0jZa43DLCjbPm7NG2rlBt1ZEUm513Rc7w9p8QbiCNCulGAW1scC1gZh6GFpk/r0yHAoiO2/4XL2OvXRJzpDgYqF+DNExwGCr1ybsLWk3T7blU+obSMswMvWnFgCCKvRGO0Kjr3jbcA/ItVkQh0s+luEAsEtIyrZsTYxmE4kcjq3hIbNP5/S9bLSTaeaawd7RHwBsl+ZYOvXaaZUEEMqX13nT9G2oCXvrXTBBYMIVxhW0ku5jaRdj2FAGeZZsXFYg/PjRdEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXCf55Vra7XbZipV4jEAuS76kG9KFmSi7/TGaG/6ZKQ=;
 b=jb9Zn/OOggVp/d3PqHk3FLMFErCua7fgyzOfHdWACuZ2a4BNPHlRIc7ROKyUv6EXbmNGplnkkjtqZ4+l4z5kbGcfdi8cusz3nrtmZ1B7+gzflw8SBW9pvo4BERvIlRNXNDB4C0wz8DZwdLWSQGZkSEMv3N0N4RN40dTqZQrjBC7J6qlv+WMKF1Cn2/HFr+tx4sV40HQitOE8FB72IggH+YgPXtr64rlQqg14VNApBHTC3hEKsuOp1IQp7xXGinY/pySlqCjog6/uAfyuvQwZQfyTnkDRDzUE/qCQnuILvMu8k2BbCtJV+gxMaj5lnnThntJyUCRfUn+ltNCkqUS5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by MW6PR11MB8392.namprd11.prod.outlook.com (2603:10b6:303:23a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 16:41:35 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8335.011; Mon, 13 Jan 2025
 16:41:35 +0000
Date: Mon, 13 Jan 2025 11:41:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Emil J Tywoniak <emil@tywoniak.eu>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: oops in xe_bo_evict on 6.12.8
Message-ID: <Z4VCPB0j_maA1oCo@intel.com>
References: <1686df0ae8f7caf0d97369a685c810e09afdbca1@tywoniak.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1686df0ae8f7caf0d97369a685c810e09afdbca1@tywoniak.eu>
X-ClientProxiedBy: MW4PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:303:b7::27) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|MW6PR11MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d1962a2-926a-48c7-ba54-08dd33f1248f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WaXUS213U0zahVQy9duHnxPc0O47vCUWk+1uPfOIrHoV40F7FIHFVJjkQQU4?=
 =?us-ascii?Q?PawDd6NM8jNEHd0MiFa87yLhSP/lr9bra5OmyybMpXxxhL6rSDYvCwtMrmoY?=
 =?us-ascii?Q?rTHE9DhQMz0ld5q7H5yTIDtpnE8nvGTP9kTlZgTCfOWNvBXGd8eQrP1lclnc?=
 =?us-ascii?Q?rzTU2ShTO85lW8jpyaMhIYo5KGSIcK331IXiMazbRUWNMUEa317i0NWA5GMX?=
 =?us-ascii?Q?jW55D2VCYeeAzM3UrN6a/tC/N24T0Ytz38mN5L7ckDDw/8vr67UIlB2+rkJY?=
 =?us-ascii?Q?T7EvCno07mtQfBIh6jC+I/ujiqlruDYCZGr5xBdqZ7MC6pMtEsR9PQpshNkg?=
 =?us-ascii?Q?m0jQUcD2MHXXEybuqkrYhigKbb/F68Al3hh9AaJgWMJ3l2uhHTR05AQ6+eVV?=
 =?us-ascii?Q?PDYnqvztpr5fHHwyWgyRcLRW1Qh6KVxqDhMHOacWN1kmxz6z/or3rwcan6xy?=
 =?us-ascii?Q?1NMIMH3QMkfyXBvnpgAFSNm9qFRKRbgMqahhdJJpauGgE1fjPjJmITTJJxiD?=
 =?us-ascii?Q?O1E7NGgEWz0DzJg5hzXTmMveZg4vWb9AYEyWogkgulQ1qf44fhAlvufDGLaR?=
 =?us-ascii?Q?sMoHzx25ja6Hub40n6xwYTCU0+19svJ2ciyFK+2KPAx6i179PyQoEQbcuotq?=
 =?us-ascii?Q?hjeEEJUh+bVSt+0ub8aaBzoAyDcZOkdKPqGFhL1hMRZ/UW1mg5i5C0Io6o4W?=
 =?us-ascii?Q?JUF3ej89/s4h8Ocn6dmhcXxmH7i1NekUF5os/jPbLf2z1NIWjTtnaXpTwXOa?=
 =?us-ascii?Q?KYoL6hpdWUuHAx7qafXJGMKdrY8EcI1EqXxnuzKmy2hEjVA8PJjGySSTO/uq?=
 =?us-ascii?Q?gDnkVuZJ95zqSGQEY8SQMwLx4DSlQYDYcM6zbwcEOO7qi92LonwSjAgfRAlT?=
 =?us-ascii?Q?KjaXNRpLXwhNdzlJmGA8eTD9Yi9KMFbTWVBwEYWglPyGCZIr/MxnvB7ly6Tn?=
 =?us-ascii?Q?JaiNT3E5VInBgdZ+e7teLvAM61iyRt0AZmKUNUcG61eNo4QDZY5iMpn5g58w?=
 =?us-ascii?Q?unhP8MUIKLXZ/j1mdLbBPipkB2EvAZWaltA7TAblvw5gS1CdeKmrwFQ0ylhr?=
 =?us-ascii?Q?9JBpb3KRpG84VdBSATAMeyx7AsrxwKtlVa2q5T1btJSs6w0ZEhcchwcQho1d?=
 =?us-ascii?Q?EgmDiSWNnHvJkvZS2+75xelN2t1pViWnZzKVedqN7Zo0YTifxsu9kYj2cNj9?=
 =?us-ascii?Q?5UTuAnpz89RTHUr4Uw48KyHNRFW6id21aU7a1n6KZQ0cdVUKYKvW2TU8CO5D?=
 =?us-ascii?Q?gRgmt63+9IVmY+Mi9pJ1iDOzp3ncFCKGsZacl6REsvhUlaScI3TX6cc5ZjKl?=
 =?us-ascii?Q?Qc2ItR/y0qqj4CmnMMxjf+Cj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0femFphEdZOV2ZZ73fFgzVVKM9v6cpiNx9pPVRaD7fT2Mqy7HAqI153zb2AZ?=
 =?us-ascii?Q?7mEXYU3FIGq15XgapTxH7oUSPCHGEGXXeACQDtshwYuIO6yeuviXSm1VpDGg?=
 =?us-ascii?Q?rTrr23r4fWRlgACKxtUCekyyi1rPTMq+qIkCvPAC02dpEjDLHvKzBF0Qsx9m?=
 =?us-ascii?Q?c+9GxzMHKW8qb9IS/IZxm+1PO+qJYByMS/PyRGPVgI9plOZEoIOHM7Qk/tbz?=
 =?us-ascii?Q?Y8Qb6BTw5rjL4tW0n224htCTqRev6D1QBOVEQRpBYvB5CRjWUF5TCzpbfBSQ?=
 =?us-ascii?Q?HVcafLBKxOfjsOjBHrgMBCuCzLU9/sFGOOH3hgho3IeoAST4bSHrouqvVi6m?=
 =?us-ascii?Q?ynK6TF8qiWR01wjXW5gLIGV8/dcE4USNJp493KUATW9km/lqRAtBV+Mr0xMb?=
 =?us-ascii?Q?NUiJdwUUd7SwbJ1wlLUKs94gE1yagwM4GcS5Fkoml0pIT/YlP64Z1W4QUNEK?=
 =?us-ascii?Q?zxvTn46RNB8J9m/YNJ063TwP6ei/XNdpXnu3HGTph6BGaUjrQy//Jk7ZEOHh?=
 =?us-ascii?Q?lQlMjPSl15kVmNYiBIME5hBUtdPIaFTw3Dh98wjB2JP9GkMNL6m7Tq0JeNAb?=
 =?us-ascii?Q?ACJ0E/yZ1ED57CCX+RWWxfA0f9xeAbeD52E464RM8qxoav99Z1LL9hGFdCTz?=
 =?us-ascii?Q?sKrDDawROfJJHcGzBcDAmonDMQ0IkavVbeNGJOFrbI5x06rWLpoD66VOPQW8?=
 =?us-ascii?Q?CzPeT+8m+qhztH2NLkQMjab5xSTTPbXvKpfnK1/GutGv0hJ9yDXhAh4u0wbD?=
 =?us-ascii?Q?eDmaFQdcEX8wVsg2ZZbVpNcO/g6sKvDzDepfiq8nRv6jxbbJO3zvl1GEPfj6?=
 =?us-ascii?Q?+danxg04lye6JzNlDn0HND2jUh2maJVoiKW2vjbTQ855Fhr5sPc3tAFQdzDT?=
 =?us-ascii?Q?OH2xXAAkTXHEQxcwmNXQVpckdSZxwmtJE6pUP/MIlJGg+zGaHDwPFU6jTtiJ?=
 =?us-ascii?Q?0Kz2RQW15Yzt9djO1yuhaGC+5Bc2LCclSN2ow1pwoPTY/CPYb7HfvfwBWNRp?=
 =?us-ascii?Q?wMbyS9Ioj8BC/cKESeJyKJTwIuPdtDvB3mLPDYNEoDjPFSG+qwwMnXrZu4HU?=
 =?us-ascii?Q?dzT/MQsedrfpzZqVoUnTtHu7ywY7cuww64uCAGt8FSqhrl2IAm0veJds8wrx?=
 =?us-ascii?Q?kjNp3BEqXQfPjAKJNuVHGqQ5KFlvFfC50RU+qhLrIbPHJpjz/WQ7Vuj0JxtL?=
 =?us-ascii?Q?3YzH/aYFfD4YpMZ4UabIxa1/6lWpVIpoZ2f19t7G4vaqsaMmN4N57808Hqp/?=
 =?us-ascii?Q?41IFocDk/QyETG1/qlBFlxVpbLvOG+ZstLPQTlnSNEjJIDSXdLM0XKtmxLRp?=
 =?us-ascii?Q?NSATaU+vBxqy0yxSI3qR5b8YYRV7PzzkPxU3jxRUgUxDQUbbc94/2Mc2cE6C?=
 =?us-ascii?Q?zMqaWeDMMGJryPYWF8x1rL0H4eQcJg23hEZ8YkpgDebo5xx0iPEz4DQixQ2W?=
 =?us-ascii?Q?qUhzPOboekh2PNcrupCbhlRGJaGXNvSuiQdjBsLLUlWPonSuHF2xqvQRZn0/?=
 =?us-ascii?Q?sBKDKsXgupvcmZw0SuYTJYFrxOrnf2tJSc+vsf82L6JJDwfzLKtlh1qyl+Ub?=
 =?us-ascii?Q?YeHpDKkR1kpdaYevne9C9MBPVBe/QNQiMoBpQ8wzMv23Y0UdHQaOOw+rgrHo?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d1962a2-926a-48c7-ba54-08dd33f1248f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 16:41:35.1961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qfLZ714cmaRgdGPMzzF3lJMCgyMVWVKePKqN4FF4Nzr16TQhS7mWmk7/nkcr+kl7kuyCh7dcLj90OfpiRCDh8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8392
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

On Fri, Jan 10, 2025 at 05:19:31PM +0000, Emil J Tywoniak wrote:
> What's up gamers,
>=20
> hope this is the right place to report this oops which possibly is due to=
 amdgpu interaction. The community guidelines link for this list (https://0=
1.org/linuxgraphics/community) doesn't work. Feel free to redirect me if no=
t, even to /dev/null. The Video(DRI - Intel) section on kernel bugzilla doe=
sn't seem to get much life.

Hi Emil,

Thanks for your interest and report on Xe bugs.
Please follow this link instead: https://drm.pages.freedesktop.org/intel-do=
cs/how-to-file-i915-bugs.html

The entire dmesg would be needed to help us to understand what's going on h=
ere. From the pasted
portion below it doesn't even look like xe is in the picture.

But only more details could help to determine what's going on. Also, keep i=
n mind that Xe,
specially for BMG, was in very active development and a lot might have chan=
ged since 6.12.
So, it would be great if you could run some experiments with newer kernel a=
s well.

Thanks,
Rodrigo.

>=20
> I see there have been recent changes to things around bo eviction on xe a=
nd today I caught the following oops when spawning a second VS Code window =
in sway with the New Window command (Ctrl+Shift+N). VS Code was not running=
 on XWayland. So far I haven't been able to reproduce this. I have amdgpu l=
oaded as a fall back for my ryzen 7900X builtin graphics since I installed =
the funny GPU (Intel Arc B580 / BMG G21). I'm on Mesa 24.3.3.
>=20
> ------------[ cut here ]------------
> workqueue: WQ_MEM_RECLAIM sdma0:drm_sched_run_job_work [gpu_sched] is flu=
shing !WQ_MEM_RECLAIM events:amdgpu_device_delay_enable_gfx_off [amdgpu]
> WARNING: CPU: 5 PID: 29199 at kernel/workqueue.c:3704 check_flush_depende=
ncy+0x10f/0x130
> Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_seq cmac algif_ha=
sh algif_skcipher af_alg nft_chain_nat xt_MASQUERADE nf_conntrack_netlink x=
frm_user xfrm_algo xt_addrtype overlay af_packet bnep btusb btrtl btintel b=
tbcm btmtk bluetooth mousedev cdc_acm joydev nls_iso8859_1 nls_cp437 vfat f=
at mei_gsc_proxy mei_gsc mei_me mei xt_conntrack ip6t_rpfilter mt7921e ipt_=
rpfilter mt7921_common mt792x_lib snd_hda_codec_hdmi mt76_connac_lib edac_m=
ce_amd edac_core mt76 snd_hda_intel amd_atl intel_rapl_msr snd_intel_dspcfg=
 xt_pkttype intel_rapl_common snd_intel_sdw_acpi crct10dif_pclmul xt_LOG ma=
c80211 snd_usb_audio uvcvideo nf_log_syslog snd_usbmidi_lib crc32_pclmul sn=
d_hda_codec xt_tcpudp polyval_clmulni videobuf2_vmalloc xe snd_ump polyval_=
generic uvc snd_hda_core ghash_clmulni_intel cfg80211 nft_compat snd_rawmid=
i sha512_ssse3 videobuf2_memops spd5118 sha256_ssse3 snd_seq_device videobu=
f2_v4l2 snd_hwdep r8169 sha1_ssse3 battery sp5100_tco videobuf2_common aesn=
i_intel snd_pcm watchdog realtek gf128mul
>  crypto_simd mdio_devres videodev snd_timer cryptd libphy rfkill snd i2c_=
piix4 drm_gpuvm wmi_bmof rapl libarc4 led_class mc nf_tables i2c_smbus k10t=
emp soundcore sch_fq_codel tpm_crb rtc_cmos evdev mac_hid tpm_tis gpio_amdp=
t tiny_power_button tpm_tis_core gpio_generic button uinput hid_xpadneo(O) =
ff_memless atkbd libps2 serio vivaldi_fmap loop xt_nat nf_nat nf_conntrack =
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c br_netfilter veth tun tap macvlan b=
ridge stp llc kvm_amd ccp kvm fuse efi_pstore configfs nfnetlink efivarfs t=
pm libaescfb ecdh_generic ecc rng_core dmi_sysfs ip_tables x_tables autofs4=
 ext4 crc32c_generic mbcache jbd2 hid_generic usbhid hid ahci libahci xhci_=
pci libata nvme xhci_hcd scsi_mod nvme_core crc32c_intel scsi_common nvme_a=
uth dm_mod dax amdgpu video wmi amdxcp i2c_algo_bit drm_ttm_helper ttm drm_=
exec gpu_sched drm_suballoc_helper drm_buddy drm_display_helper cec crc16
> CPU: 5 UID: 0 PID: 29199 Comm: kworker/u96:0 Tainted: G        W  O      =
 6.12.8 #1-NixOS
> Tainted: [W]=3DWARN, [O]=3DOOT_MODULE
> Hardware name: Micro-Star International Co., Ltd. MS-7D75/MAG B650 TOMAHA=
WK WIFI (MS-7D75), BIOS 1.60 05/30/2023
> Workqueue: sdma0 drm_sched_run_job_work [gpu_sched]
> RIP: 0010:check_flush_dependency+0x10f/0x130
> Code: c0 f3 01 01 90 49 8b 45 18 48 8d b2 c0 00 00 00 48 8d 8b c0 00 00 0=
0 49 89 e8 48 c7 c7 a0 c7 df b4 48 89 c2 e8 82 7e fd ff 90 <0f> 0b 90 90 e9=
 0a ff ff ff 80 3d 99 c0 f3 01 00 75 8f e9 42 ff ff
> RSP: 0018:ffff95dd9ef97c60 EFLAGS: 00010046
> RAX: 0000000000000000 RBX: ffff9265c01b8e00 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffffffc0438c00 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: ffff92681a13b200
> R13: ffff9265c94338c0 R14: 0000000000000001 R15: ffff9265c01bce00
> FS:  0000000000000000(0000) GS:ffff926cb7e80000(0000) knlGS:0000000000000=
000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000050d6d0 CR3: 00000002a38d6000 CR4: 0000000000f50ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? check_flush_dependency+0x10f/0x130
>  ? __warn.cold+0x93/0xf6
>  ? check_flush_dependency+0x10f/0x130
>  ? report_bug+0x10d/0x150
>  ? srso_alias_return_thunk+0x5/0xfbef5
>  ? handle_bug+0x61/0xb0
>  ? exc_invalid_op+0x17/0x80
>  ? asm_exc_invalid_op+0x1a/0x20
>  ? __pfx_amdgpu_device_delay_enable_gfx_off+0x10/0x10 [amdgpu]
>  ? check_flush_dependency+0x10f/0x130
>  __flush_work+0x10c/0x320
>  cancel_delayed_work_sync+0x62/0x80
>  amdgpu_gfx_off_ctrl+0xb7/0x150 [amdgpu]
>  amdgpu_ring_alloc+0x40/0x70 [amdgpu]
>  amdgpu_ib_schedule+0xf0/0x750 [amdgpu]
>  amdgpu_job_run+0x8e/0x200 [amdgpu]
>  drm_sched_run_job_work+0x283/0x420 [gpu_sched]
>  process_one_work+0x18a/0x350
>  worker_thread+0x235/0x370
>  ? __pfx_worker_thread+0x10/0x10
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0xcd/0x100
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x31/0x50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1a/0x30
>  </TASK>
> ---[ end trace 0000000000000000 ]---
>=20
> I hope this tells you something. I'm willing to switch to some cutting ed=
ge kernel commit and report back if I get an oops again, so feel free which=
 remote and commit I should go get, or any other troubleshooting steps I co=
uld follow.
>=20
> Thanks for all your hard work,
>=20
> Emil J. Tywoniak (widlarizer)
