Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62408C25B75
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 18:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B445710E335;
	Mon,  3 Jun 2024 18:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EnaLiqV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9FC10E335
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 18:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717438595; x=1748974595;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qWcJIc5PW3qMcOyKTl9xbKLwCJhD5TcHfpl5aMjgdsA=;
 b=EnaLiqV/mh41mGLysTZ8mx+tPZu1hRLutUh88ONoau2ULRHMQBeUNj5W
 sv+rEhDtxcX6trSX7cq+v0WmpCWwezkvgjotp59vfcRNVV61PB+fa3dAe
 9Q5CZbVfjVOvomkuyL4+WRsn90SONkaXD/RvMnjFURTJiyW4PJaL80sja
 +Kj+Z0neUxI260iYy/RQv98xGVNRdxNeN4IF6RNs/g3SYBYMdsi1aUfEa
 PjHpnOBan5enjQuVfin3M26ouw8NOsEqwp3yWBJh0t47m7Q/u1qRWdtex
 cRQCxDqeFvhy4yboMzcTLiIX0YCvaUJfMzJ+MEW6NUk5QYG209elbx6M5 Q==;
X-CSE-ConnectionGUID: Q7z26repQUW46jLdCD8vng==
X-CSE-MsgGUID: aAc7Z8waSD2Ulr0nJPrMhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="25347409"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="25347409"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 11:16:21 -0700
X-CSE-ConnectionGUID: lra12vfySBCGMcPn58mUXw==
X-CSE-MsgGUID: /EU64xA9Q9OeOYx9qUdhQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="42037417"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 11:16:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 11:16:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 11:16:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 11:16:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGJg42VCfH77Yc/S7TL28chmDWA25yWLRFjaVVfdTFK8LJPdCyCPfY3lo73YDNqRszyrHho70XQUeR1LYTv2904UQtwJFu/EkogvX1sbarMhBFlHhrwycwTkyVf12N/NxaDIjS8PRg1fvthTXpnZ47UfBQMgSKt4VshgPy9L0DUzbxeY9LbyXwy1vlCwAKI/H7UOVDUoDlhCfQBh9bSGaLny3n2+kMJPEa94OF6hWohwojisCR9r9Wc1geLdztj7e0omX5cw3AEW1J+x69Ksdvf+C1kQ2wGrFrkFY/QTlji1dfhJ3BENXkLO+DLhefFujHChTQ8BUWP1AnOuuFqnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTqoq4wFEhECj7dhIoiNcCsu18g0ypCSNclFjRyDaG0=;
 b=AtTo+JlLFv7BMg2ySzDZh3n1VDjOym3oCcFiws6E/IxKD/PoRnOE7A4s8O00uG3rlTkDUqHJ+PLXe85bTmFqUoK9ojNjIa8qIhkI+rkWSJaTYoOxpxqBVMtn1vwpXabMA8mgtpK00lz90n12/DIqkaGys0S2r9YMOKZIDkQMWIK/kVrYbX3CSDjuC4kKriJUGKvhsTEtsbIfo/e+h7lhqtzm31vsOQI0VbKIXZpIgtjNhsuR5UA7zd29zJHe7CzW7Z3Ip9iqvpVuAEbk715M8o49dPeilBqXrPFGQ66tu8PikCXIbN8Bu7pjaty8W/QlBmmXUUXQYnaRADrw5WR+dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6321.namprd11.prod.outlook.com (2603:10b6:208:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 18:16:17 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 18:16:17 +0000
Date: Mon, 3 Jun 2024 18:15:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
Message-ID: <Zl4IR7xPQFNvPMyJ@DUT025-TGLU.fm.intel.com>
References: <20240531200851.223236-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240531200851.223236-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e3d53bd-d051-4433-5050-08dc83f942ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Zq0HsoE+vtIjUz4dyC5yBx23PmI1eChCO+SrQordH157wv3t9r27mAxCWn?=
 =?iso-8859-1?Q?1xuLRUp6BlgXymHnqwj2pml0ESC4Mqd4TV54/J/ZSTMhyV8ax7lj2FABRv?=
 =?iso-8859-1?Q?Ns1mXgIM8+snvm8oFzKGDaUGMKgdGx/zqRmxr6fHHaHFUL7bCHhmwlDr1g?=
 =?iso-8859-1?Q?r5+Fw8HQ8HlXyswm74yMeISxdqervCrSTxDwtGT3mW0xDnDrENFJrqS/iF?=
 =?iso-8859-1?Q?bb3XyrIdXYPrFY5FeHA2jjtEoaFZmK1tyNVeO+TpNFqApWew5P/pc/9T5N?=
 =?iso-8859-1?Q?w7Og7Kl+pHJ3/XmCkAoubfJrIJuCGz5gRM0U8Bk8fZ+xjc//F1MMR8UaY2?=
 =?iso-8859-1?Q?IICVv/wBbWNE/MRdBU7+MgLzSTC6NBkMRCgZ/1rOQO45OtgGkk9PyZaT7q?=
 =?iso-8859-1?Q?ejv70SuCT8aOz8Fe2OdN/LtHBR7HVL7mff+ATD797BA5OtVQqZZNEav/fO?=
 =?iso-8859-1?Q?MRlKVA6j7nHmsqvO3sheqR3EoR4G2O6H+X5X96J1hnZXltbPMBpF+NyDME?=
 =?iso-8859-1?Q?p00TA5Pm17soXgPNPOkCeYpTGPXFsstIqj37t/Dp01qrpLtPJQPTalgCNh?=
 =?iso-8859-1?Q?2OJ89LWfRiWlZjvpDqztDEtdKw6QpFIg4a6R5MAJ+r71FtpfQA0iWUNua/?=
 =?iso-8859-1?Q?B4B235x905mM/S8vIZL9qt71gB73TKNu7H9KTmCCrjloLIItJPsykEkZEL?=
 =?iso-8859-1?Q?04Ny4L4Q1aQhVIIdCOODZARP2ziZXAtTZzogU0WmFRK9kloN2/UBCJRt6k?=
 =?iso-8859-1?Q?F42hWe0GYCu8Hr+KBu9awE2p4pP4SYfe1N5oMwa7FFyjstSb4nMaAEXoAM?=
 =?iso-8859-1?Q?WLCplI0NV6y2k2FsQBP/JWrEoHu1Fi7Un5UFtUheQdGS1vrorTGA7nMyzm?=
 =?iso-8859-1?Q?1DKcdf3ews3kUHEms9boRq86Tygf0v7GWeitW56f0ayxgwuDAQqbMFLnJN?=
 =?iso-8859-1?Q?IJp6PV+d3Dk5arVct58pYm0BozO4uvQDhROAOeUu6Y/ULCf+fhe0FxNEsj?=
 =?iso-8859-1?Q?P73yXongnbN1mlHJCriVbziKz9K0TkAVelSMu624oP6/mPQQZ/jGkAWs3z?=
 =?iso-8859-1?Q?b+rPdE7YcWKg0mnRJc5TY4kK1F5AgNn12z/FJGFyjqUgILojmgwXCJHtFJ?=
 =?iso-8859-1?Q?3OzwStA6FlAtwlAkbT6Tph6isLuuEnfdtPWToYQK6hJVRWMRmdzw6Ib1gf?=
 =?iso-8859-1?Q?IvlJHjqgmN3lLzM0M+vBIK8QxJfC8KsuTFGV9Fgv9BvK8VWi9qOjNDF089?=
 =?iso-8859-1?Q?zHzcqxaNaKruCCn0myUKPMfQwbZYEg72iIM0dM9jrI1T/j1LFanBiKxtXV?=
 =?iso-8859-1?Q?VejVJe9PY41KbyZJGC9wOrHnZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DdqS2fY5m8PicH3bxwNfzW3QmybZbvuaga8Rv/F2pWa0+FTy9LP01G9lEQ?=
 =?iso-8859-1?Q?eoYZAwMS9MZVOREGPBrL06VYgSGgTVYgUrt6iknRef0ooveniW67oId1yi?=
 =?iso-8859-1?Q?Y+SDsDsrpkyi80eTyDIbsjOxKpxnzERZ9e5S6i4dbe7vlbmSosVYN94l4F?=
 =?iso-8859-1?Q?1Sjk9Qui5PwpFabc9IFnvIn3Ln7E5hTV8B2Kpbu5EES8dHH6NalCue3Ic5?=
 =?iso-8859-1?Q?yNL1nk0ayjf1QzvCb0uyTFQ+W886yKYewnM3K0tHkxnmJKP5Q32XsrCPnE?=
 =?iso-8859-1?Q?F7iBlFNmqpo6Y1/eBWOL7644MgrB7OVuQSSnfd8kgR1SxauhxgiJE6Qato?=
 =?iso-8859-1?Q?ksYeWmEavZiyGjqsc901Ku/6C9KbKjQtCMUf/M/GJBOUvNc1SYkTIkEfk8?=
 =?iso-8859-1?Q?EZV3D3/AmSDGnzWx4VBwv909QNuMzLXcZBHcXQseoZnGL6xy8ViLCU5Hp2?=
 =?iso-8859-1?Q?BAVGfLKgzKBy9V9pa/0RKqCGP6X+gXgBz0SykGvHEDs4mjSixfxWMJwK61?=
 =?iso-8859-1?Q?tu52fFxV5imTwByMZxozqojQgrZrJb41pnxx6zEWy07iygtZAGyXeUvysK?=
 =?iso-8859-1?Q?eLIpf+5+rnN+3Gy1SeRT3rrAxxIp/A7Ta/mSgbLoUDJoG32eNbbL+W95OL?=
 =?iso-8859-1?Q?4spkkBYeK+P7Vz6Sin2mEL4h9oUnfe+nSBfKXI43MjNgb7WBwHbWEN3n7I?=
 =?iso-8859-1?Q?baBEkrk+w2MGCKXyTTWP+WV+wfsl31yXHjQ0HgIK0DNEHB8WGSrQvZPYso?=
 =?iso-8859-1?Q?3vB08eF1rNxtZeJWR1WqNuXztzCGyKz4y0AWYiHE8aV57as6S8Yeg8n563?=
 =?iso-8859-1?Q?cnkSYGll/6ARmjcu5fKGei3olP2zalEPcPX3YlmKAvRmgtvoextf8+wrfv?=
 =?iso-8859-1?Q?9qbedCoXJHNAHsIvGAe6q8/99IrqQfvHOk0GwGahhhCAihUqF8wo8ArjiH?=
 =?iso-8859-1?Q?AJ/PRmfdxHc2ln2N2kMg9qigaK1Kw656op5wt72FgLXihQdsYXeqLA/Q5F?=
 =?iso-8859-1?Q?RwBA6ud5sh7u1fdYgb19dJmQlFnzccsdJv9kpnJkc7mdv3elSTRolAIQGS?=
 =?iso-8859-1?Q?xf7pQX4ZlYavQlyhIsULz9VH5vcJj0kTiP7Dqy+/GifQTTyrsuSfGmQr0R?=
 =?iso-8859-1?Q?J/khGYW4bsF5D28Of5Uxc6XWOLPdCO9aEEX9FNw58dSCpiHHKfP7Lcmaam?=
 =?iso-8859-1?Q?9i3AX75HolWvXVhWHPh9WmrACEF7AHaooPHInwq3M5wUo8D4q6iq/JgOdM?=
 =?iso-8859-1?Q?GlJNtZPZuG5UfaNXhF4P8gsr9KwAa9tesVujSYZ+JIeahFKrQB6Pwg9gnZ?=
 =?iso-8859-1?Q?p8l8JZNkdr4JZMTHworSXrsxEtZaq1y/4uNwsnUCSo6wuBHuJ6gkurzJrj?=
 =?iso-8859-1?Q?4f7hIfU4CEF6AjJP+YvmQu3XxNFmKIp1xr3MKVw3ihUAXzav8y5cnzDuJX?=
 =?iso-8859-1?Q?vb6rO1tL5223iVsE9uFeKTnqldtZN+5KBC8FMtEjW+crfUB86ckav25gLK?=
 =?iso-8859-1?Q?zq8js2jnKeHLemkK+/+ytnJ6m82ynDHwuxRfoxsnqlYBq0kC4/bKJkk9yY?=
 =?iso-8859-1?Q?EX2g43sXPmcOsWfacxjRsNIeBp5NyFp1tIox8uVhTY1gGM7MJZUlbfaoQR?=
 =?iso-8859-1?Q?pCtO6WKJ/dnXqknNoJax3F4xetzvnscDkPMdnT0j1oxkvz86TFdSCnmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3d53bd-d051-4433-5050-08dc83f942ed
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 18:16:17.3541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1STMKu1zCy8GSnZ7T3YFyBcxkuDNDMvQW/t802hiSFJNvLBGGZN7mnf0DhozJ+66wn/YNXamaCcRdENAFV1VUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6321
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

On Fri, May 31, 2024 at 04:08:51PM -0400, Rodrigo Vivi wrote:
> Defer the ggtt node removal to a thread if runtime_pm is not active.
> 
> The ggtt node removal can be called from multiple places, including
> places where we cannot protect with outer callers and places we are
> within other locks. So, try to grab the runtime reference if the
> device is already active, otherwise defer the removal to a separate
> thread from where we are sure we can wake the device up.
> 
> v2: - use xe wq instead of system wq (Matt and CI)
>     - Avoid GFP_KERNEL to be future proof since this removal can
>     be called from outside our drivers and we don't want to block
>     if atomic is needed. (Matt)
> v3: amend forgot chunk declaring xe_device.
> 
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c | 57 ++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index b01a670fecb8..ab086737f910 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -443,16 +443,14 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>  }
>  
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> -			 bool invalidate)
> +static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			     bool invalidate)
>  {
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	bool bound;
>  	int idx;
>  
>  	bound = drm_dev_enter(&xe->drm, &idx);
> -	if (bound)
> -		xe_pm_runtime_get_noresume(xe);
>  
>  	mutex_lock(&ggtt->lock);
>  	if (bound)
> @@ -467,10 +465,59 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>  	if (invalidate)
>  		xe_ggtt_invalidate(ggtt);
>  
> -	xe_pm_runtime_put(xe);
>  	drm_dev_exit(idx);
>  }
>  
> +struct remove_node_work {
> +	struct work_struct work;
> +	struct xe_ggtt *ggtt;
> +	struct drm_mm_node *node;
> +	bool invalidate;
> +};
> +
> +static void ggtt_remove_node_work_func(struct work_struct *work)
> +{
> +	struct remove_node_work *remove_node = container_of(work, struct remove_node_work, work);
> +	struct xe_device *xe = tile_to_xe(remove_node->ggtt->tile);
> +
> +	xe_pm_runtime_get(xe);
> +	ggtt_remove_node(remove_node->ggtt, remove_node->node, remove_node->invalidate);
> +	xe_pm_runtime_put(xe);
> +
> +	kfree(remove_node);
> +}
> +
> +static void ggtt_queue_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +				   bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	struct remove_node_work *remove_node;
> +
> +	remove_node = kmalloc(sizeof(*remove_node), GFP_ATOMIC);
> +	if (!remove_node)

I think a DRM error message here would be helpful too. 

Matt

> +		return;
> +
> +	INIT_WORK(&remove_node->work, ggtt_remove_node_work_func);
> +	remove_node->ggtt = ggtt;
> +	remove_node->node = node;
> +	remove_node->invalidate = invalidate;
> +
> +	queue_work(xe->unordered_wq, &remove_node->work);
> +}
> +
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			 bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	if (xe_pm_runtime_get_if_active(xe)) {
> +		ggtt_remove_node(ggtt, node, invalidate);
> +		xe_pm_runtime_put(xe);
> +	} else {
> +		ggtt_queue_remove_node(ggtt, node, invalidate);
> +	}
> +}
> +
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
>  	if (XE_WARN_ON(!bo->ggtt_node.size))
> -- 
> 2.45.1
> 
