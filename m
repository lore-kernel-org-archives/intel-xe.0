Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AF8D3569F
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 04:36:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBCB10E7C0;
	Thu, 29 Jan 2026 04:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+/i+9Vo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FAD10E7C0
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 04:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769661359; x=1801197359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wtLn5XBHAhzDUK2UdW1VWnM1VweDIJuSXmRrDkJqVb8=;
 b=G+/i+9VoX0vO54RdG99I+3TBGQz/NvIXsrZvd9y98RRSeKa1TB//hZ37
 13yVDIaYpGkwH9U4tu4um93qW8nx4EaPw/e1LR+BEpVIDRPD8VrO/Thaj
 xGNiY7FwQgRqvHswROt+eyEw06ZWNYIXUvHiC6NhieWaChYUODmj4HA1f
 aFOn2Xds2DuKZQqEe34IBHA8rddxw/9M176NjW9zBU20/Jd5xyoQZk/qp
 FG6pZ/9qMHMMjzg37juaE0A4BA7IeNtmfBnoYvaY/mmUnlyuYWQcUc7Rd
 d+Fu/I+y2QDUBCMzTq4r/GKfvRD4t2EtLEDQSVFQSPGyFz0GSf+hrgZhH A==;
X-CSE-ConnectionGUID: bmViLcevRNem7MI8My1GGw==
X-CSE-MsgGUID: Z2isVmgjT2K3IGLOpeelFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="73481811"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="73481811"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 20:35:59 -0800
X-CSE-ConnectionGUID: r4poj76ETAOnEru8ZKL40g==
X-CSE-MsgGUID: 63Gdijl9TfGnCZD6MYUg3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="212547474"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 20:35:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 20:35:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 20:35:58 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 20:35:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TPL3aFpf/K6x+5a96CDVyDJoArTMg88epUq+MBrB86Pxe58vjGAjdKiyYZqONOnICdiRZAw7p1kiqMS52cncO/UNsHXo59KOGPoBglJyLt3Z1LrKAarD+Kg80qxQNTtGvwU5TYrxtLYEudkehYgP3PIbhxKZX/cnJX1tRmNEeufIkr9wVuJBDk4rdwAUKf4Ly/b1cldpH0B2+r/ckRVL2MOy69P1XDIwk45rbsZZ+CkBxqFGooL2/Bxo+vQcULoG+nL3XEyKUGBxFpmlcoapR5MAW3tXfSJJBfhhN4M567y5w08cyIunyfpdu6Lyg+NJ/y28FvmV8H8JycWagC8hQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODOosou5N3tPhN1awqdaOb9JSjKOANJ9WxUAICvjPXg=;
 b=ID2kyV6s+j6Wb45hB8nVnZxpV9LAvBJs4lHQ4R9fkxWGoxr+PyxS4ynUcX85jeU8U08oDcwOTD239M5bwtAUXRjkVVrzJkap50gebAhDKNob9Lj4w+e+suE3VYT/ZEVgunt30UKzdX8maGbhRp6CfPwC1j36YONkfrZLh6vkV8sutqQW82NgIPyfG7zhFHCHnc9rFLpDV5Zdky7hh3yy3fMwLAFw4Gfu6E+I7CODm43lgn3I/JhZbuxdwLo/pf7gKxJX8cse6ZpjmtxZke7vjGvsabraHYZqw/kvTrYOz1he8NBDM3KadiIh/XSs6UadHGlaxPZ89jm6yYwzTxfYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF307806035.namprd11.prod.outlook.com (2603:10b6:518:1::d13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 04:35:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 04:35:56 +0000
Date: Wed, 28 Jan 2026 20:35:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jia Yao <jia.yao@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Reject coh_none PAT index for CPU cached memory
 in madvise
Message-ID: <aXrjqX4cN3/0cZoc@lstrano-desk.jf.intel.com>
References: <20260129000147.339361-1-jia.yao@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260129000147.339361-1-jia.yao@intel.com>
X-ClientProxiedBy: MW4PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:303:16d::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF307806035:EE_
X-MS-Office365-Filtering-Correlation-Id: aeef6d53-af5f-4607-a990-08de5eefe48e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BDW8tQL3zc5RmDhVi3avkFUMjsOtoONWLXYVAG3xeiHbIjPPKKSru6RgtS54?=
 =?us-ascii?Q?2dKN9er8hl8z0osdMV0Iyd8PPU2CBqjroyc3IOEdBosHKSAgB0dU1+eSrwks?=
 =?us-ascii?Q?RT5V4RIxFrJ8TUtoSItVPyneyAWbUvv4h63pnShPgjaDlEOR1rCuriU92iS/?=
 =?us-ascii?Q?eh6VqHBvjk7k3U/x31tlg/ptb32FxEvitF1GZwcBuiIhJ0DAy5KN4Qbx6nlO?=
 =?us-ascii?Q?Y9vCxCgPICigsPtvs52zNMJjfyJoZ6O9jB3W7R3JGjxqOQ1pFNfj4DvQ1N9U?=
 =?us-ascii?Q?v+kHxRK/vH/YtxX0uxmPOsZZpvu39rTrjYHVpiD3MLeQbc1KB0WPgzbuvL6r?=
 =?us-ascii?Q?SQy1FzrkeAYz1KEn7iePA1fRZMTGv1cxImlSUZyjrSXO+l1k/Dk56d/6QhTq?=
 =?us-ascii?Q?dVjxaP5alvxOy51O3WRnWfEhfSxYx0BOULlg7j6agOPHCuZpa77S4CtbSYxx?=
 =?us-ascii?Q?ptRTYwQHCH3D/ebKAMdlIzo4vpSM/ZRwmf/QwsAE8a1woRnrWFHGolkoLu/M?=
 =?us-ascii?Q?0PcTel80VEdHzNo15FyzWhkPXzddI14AEtJ3TaTfkzhJjqq8lGH1JPrTX3uH?=
 =?us-ascii?Q?9rDx2njD29x+6DPWs8X4JR668ARY9VeaQSWEA6F5XMt4Y0zSDRGwl9IWbvOr?=
 =?us-ascii?Q?fqVAmOiqkwJ7A06Zjump91uXz+Y6BTwXML9HAj9JZkk6mTZd7afMEC2gDJqU?=
 =?us-ascii?Q?GaI0mfA6nvxSsO+TOiWwPha8xbKKBwlqoy6D/t5JAUkJTEgnM8BuvAueT5oC?=
 =?us-ascii?Q?HTlp4HAkXQxIcPS9XNKqOaRfR7/T5kDxDVV9RSnzl0Tc4MoRBq49Lk8rmn63?=
 =?us-ascii?Q?MChBrv/LQTeSWuPYMLuY9AlvPyomdo+7zjWo69+SBCKjHxZ7U56sjakkHuaB?=
 =?us-ascii?Q?ABy0IyB1BPBmInfrhLsiv6pcdb8EJY8PfLi1XmAObE8JhZgKP8+1EPRr0jk6?=
 =?us-ascii?Q?oLOealKPrcoIghTxn4W971GAe2OiPe9r+vPgrmxkJ+B5V6raCeA78e//XEYJ?=
 =?us-ascii?Q?BBCs7eGsg5vNiCp2JQ2W6A0/dRDv9/oaBeWyAIl7UqR4ITjBvZ7vSMj4QkwE?=
 =?us-ascii?Q?HHdcOoJTFFmc4swF7uMXd/vbwlvnKcAtwCwVtv9Xofh6TV71E8ROtOGXNINn?=
 =?us-ascii?Q?nVYbJulrs4ks+KAbUOMtburXXFNgp9hfaONa4rS+dHfn4Tv7CCEC/KNkXiDt?=
 =?us-ascii?Q?YV7tGWE4tY8o7YoJnrz9a7Y025av+A+foFVwEs+dVLhjHynuCpNmVLZyrCba?=
 =?us-ascii?Q?KvHDXv+ftmchHN61AuQyiI10oyPgcONEVRh+D4Oaex+2rvUBzMa6GS/VYunc?=
 =?us-ascii?Q?ljHPuecVqaUQXNmtT+/3IiUN4dydjD2UNrhVjt955Mwg8H+jmTBoWRmzEAU/?=
 =?us-ascii?Q?IglcxnBpneBaj8dpjVkOu4X6cOU76KjN107iwvZEG5zmcUXX8F9G61zVJZE1?=
 =?us-ascii?Q?6xWQbWC/M/bi1IfPBAyTCciOWJW3xsnjp1wiV1EOV00sYSGIGgTvQwEQ250l?=
 =?us-ascii?Q?xFbEM1QgncydS7FPkjL8A8yGYdw/iNO7agC6djh07M+7HKQRkvryYv6UnKgF?=
 =?us-ascii?Q?hQ6Fx5ox+rTC0h458Us=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KmE3oQUoHEJkYWOQE5wpyQwIZ03acCFTs7fzydPrx+rQxjO9jRqITbgLAEtf?=
 =?us-ascii?Q?xQfMFjeRWgjT0NQbxKxV7ATnDF7RhTvFec0QwcTDCwOSO/b9XwIpee8UK8GH?=
 =?us-ascii?Q?Fk0Scp2b9yHPkSGQO56yMWxQK7ot7+/7noiw57+bbVK2osJkNnt7D0SAjepV?=
 =?us-ascii?Q?RexOzIwIsUAK/9U0Gn7GCmI6JOLdrnkbLO632WS1eitKatAKAytibFrmPOVQ?=
 =?us-ascii?Q?eqDgldHOSf3Mck2O5edF0HkSU+VB2VzTtqm9HH2NeDLlXpFGvOmP58t5dNTM?=
 =?us-ascii?Q?fer+4Wqrxh1FJlWWJnqIXTUU0l+41keCcZZ2nxRwmNx2L9vY9MJJ7xyDMNaf?=
 =?us-ascii?Q?6wNPozojTfIpgKmhcZdXxst07vytxFoVDrOsGm2hzEjWVYugBeapG7FDd3bi?=
 =?us-ascii?Q?Mh4krG8J9asdVBNRCw1hwTPRYRYAVUcNwT8GC6zNVuS1rcRbjM6YS1cCxPhw?=
 =?us-ascii?Q?18vLqRGZPXlB3orWTU8E6HkHY41g7BUvHyOkvcUZ0N8lEfqYai9UbfdLSYN6?=
 =?us-ascii?Q?x0ofrFC5IE/Hn/vDHZFhzDh1zMqTmFdzSwR2wI04WaWLymejlZLjFuEWPcvh?=
 =?us-ascii?Q?V3HR0G7KD6XkQAiDD0gGJ4i7MKwt8NglqPkH12UeISgEdKxJt/8J3RAwyM+3?=
 =?us-ascii?Q?ykO8bjAGkVxjDi8Um9g1RL/Aa6n3JI2nA+WXGl10suiHcWjnA5XhwPvWdu0Q?=
 =?us-ascii?Q?jj2fJZjlC2Xuc50FmyOq9OxoFqkUtzjqPwA81DLw8c0nAA5dbRDYgk/jdS8G?=
 =?us-ascii?Q?2nn1I4E6NGAvuuPmBNFygBNyNQyo9cNlglHcs1SXeQFX/EVz3nem8UVmWKFK?=
 =?us-ascii?Q?+pXaEcqpUGF5wlYPXasPCb/UAN0WTYOCDa7KwzPWR89cfxldQkDCLDm3mcjF?=
 =?us-ascii?Q?eSgz9UA39VvY/ESAIg9l0x+c4kNCV9MDZAjzqCWr1Wr5XCiEklmtGZFPD4di?=
 =?us-ascii?Q?iU56QhdXbtBGRt/kY5g2/NV05Bpm3Xm4jYopPn9bHiQn8PaO7MRbL6/dauSI?=
 =?us-ascii?Q?T5V5VPcOGbDsZ7T0YN7/7r6cc4Iwx0QJtmJzc6UBzmlfQ7z0mVABKSXvsbIl?=
 =?us-ascii?Q?+/gOaxoR9xXU65HF8tmRmTqbpEGfgumUHXKCG+nwJvGfOQOMdC0HZ9yi92Do?=
 =?us-ascii?Q?YjYps8bTcSUS0XxQcVqnqbg3Glk0sRzjbXCumn8KaHz9G1zIKgU5QVbZrcAj?=
 =?us-ascii?Q?oNGXImbLmkXR/lF5uXKDOESF53LCLU8Y3TqvGcrDZj+tum8cjO7LeuEdPaAG?=
 =?us-ascii?Q?10U0BEVVnevAqt8NVaFoHOG9i6L7RNggjpPKq86R5sUGqvVmh6Rre9vcEfqm?=
 =?us-ascii?Q?kwjnkb5BzL/wff+WiTNzkzklw3QSTaz9Cfl3ii6E9o9AFa9M5fdWu/ogl11U?=
 =?us-ascii?Q?wftut/RPNipdTtbfLTl8YxfOsNcSC6c4TXesbUNlni1TYaGjVd4ZY+QIJEsz?=
 =?us-ascii?Q?BlB81F45Ax+DiiGYwNHAPafRS2e8mPx8Fhs8JghPu1J3HPpNq5ycRG3W0uSc?=
 =?us-ascii?Q?N0e3v9z8fWLrQ3/4VQjQJuhmB2ju5aAJ0IzzcSGH0GepN71wLEhtky0qpprd?=
 =?us-ascii?Q?UH6O3foVvXWxI+siK6SqEDG2f13fdvEy4HSKuXySYl+1T/I0eVqsLT2WZnlX?=
 =?us-ascii?Q?3ZB15a1zomDbHoj3drbnK5p/lVuRhXAkgM0xVeaC3WcTSI2tiD0VmvzzXedd?=
 =?us-ascii?Q?Fe1FE54H8KrevL6VZglLB5Yp4LiOhvFyWIb7xrCI68ywzkz5R0Ha7XV5Q92R?=
 =?us-ascii?Q?vu1vesTN8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeef6d53-af5f-4607-a990-08de5eefe48e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 04:35:55.9865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBs9jC69zdoFTWF6M2ogynvPrHY7VpSuxS2H7AalfhwzWmf/i0VTonnJSi6y26pw5uKKCv/7QdWMGnGf/1BvFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF307806035
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

On Thu, Jan 29, 2026 at 12:01:47AM +0000, Jia Yao wrote:
> Add validation in xe_vm_madvise_ioctl() to reject PAT indices with
> XE_COH_NONE coherency mode when applied to CPU cached memory.
> 
> Using coh_none with CPU cached buffers is a security issue. When the
> kernel clears pages before reallocation, the clear operation stays in
> CPU cache (dirty). GPU with coh_none can bypass CPU caches and read
> stale sensitive data directly from DRAM, potentially leaking data from
> previously freed pages of other processes.
> 
> This aligns with the existing validation in vm_bind path
> (xe_vm_bind_ioctl_validate_bo).
> 

This would be a fixes patch.

Not a full review but a couple quick comments below.

> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 47 ++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index add9a6ca2390..3fbaf7d1d662 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -352,6 +352,44 @@ static void xe_madvise_details_fini(struct xe_madvise_details *details)
>  	drm_pagemap_put(details->dpagemap);
>  }
>  
> +static bool check_pat_args_are_sane(struct xe_device *xe,
> +				    struct xe_vmas_in_madvise_range *madvise_range,
> +				    u16 pat_index)
> +{
> +	u16 coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
> +	int i;
> +
> +	/*
> +	 * Using coh_none with CPU cached buffers is not allowed.
> +	 * Otherwise CPU page clearing can be bypassed, which is a
> +	 * security issue. GPU can directly access system memory and
> +	 * bypass CPU caches, potentially reading stale sensitive data
> +	 * from previously freed pages.
> +	 */
> +	if (coh_mode != XE_COH_NONE)
> +		return true;
> +
> +	for (i = 0; i < madvise_range->num_vmas; i++) {
> +		struct xe_vma *vma = madvise_range->vmas[i];
> +		struct xe_bo *bo = xe_vma_bo(vma);
> +
> +		if (bo) {
> +			/* BO with WB caching + COH_NONE is not allowed */
> +			if (XE_IOCTL_DBG(xe, bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
> +				return false;
> +			/* Imported dma-buf without caching info, assume cached */
> +			if (XE_IOCTL_DBG(xe, !bo->cpu_caching))
> +				return false;
> +		} else if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_userptr(vma)) {

} else if (XE_IOCTL_DBG(xe, xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_userptr(vma))) {
	/* System memory (userptr/SVM) is always CPU cached */
	return false;
}

Matt

> +			/* System memory (userptr/SVM) is always CPU cached */
> +			if (XE_IOCTL_DBG(xe, true))
> +				return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  static bool check_bo_args_are_sane(struct xe_vm *vm, struct xe_vma **vmas,
>  				   int num_vmas, u32 atomic_val)
>  {
> @@ -442,6 +480,14 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  	if (err || !madvise_range.num_vmas)
>  		goto madv_fini;
>  
> +	if (args->type == DRM_XE_MEM_RANGE_ATTR_PAT) {
> +		if (!check_pat_args_are_sane(xe, &madvise_range,
> +					     args->pat_index.val)) {
> +			err = -EINVAL;
> +			goto free_vmas;
> +		}
> +	}
> +
>  	if (madvise_range.has_bo_vmas) {
>  		if (args->type == DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
>  			if (!check_bo_args_are_sane(vm, madvise_range.vmas,
> @@ -485,6 +531,7 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  err_fini:
>  	if (madvise_range.has_bo_vmas)
>  		drm_exec_fini(&exec);
> +free_vmas:
>  	kfree(madvise_range.vmas);
>  	madvise_range.vmas = NULL;
>  madv_fini:
> -- 
> 2.43.0
> 
