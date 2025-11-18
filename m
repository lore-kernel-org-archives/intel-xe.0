Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160DDCEE341
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 17:08:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD0810E50B;
	Tue, 18 Nov 2025 17:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q2BmTspU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A946410E50B
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 17:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763485699; x=1795021699;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ol+78sGlNeJkH8q4MX61GdOlVIZM77KSdJMPchRpsbk=;
 b=Q2BmTspUceEAKL9XKKp/RXVzzHK0gQfSbou3s9i7HkBG4OVb+3gNsSUC
 c/PrKPXjp8Le51VJzUvNUXIfe0DUqla8tP3CGitgwNFbfRhrIyQifkWAP
 KO3jTFRRbKy6/Mer71Z4OSUsJC2ALg343dyRdTWXab/s6HlvgbcUm45lV
 A1uf07W/uPovX4UmV6mkA+4HaeGquQUm1cwjq2Om3LTt/ZIRXv/9jsI0p
 lbmd/fAmhp4yHngGuqYjvGjelwsIs6rDAnsXrVrXPYrnTOXbUeLOUXuSF
 gBPZM7wamwQqnHXBFNsK6AH2xiaFmkPG3UWvQaQEgPYi2rBMhnBFgTLOm w==;
X-CSE-ConnectionGUID: 2Vu0NiOYT0KLfmh0bDcG2w==
X-CSE-MsgGUID: axH7LqADSXynM4ccoAIDCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65216617"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65216617"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:08:18 -0800
X-CSE-ConnectionGUID: AOlnr+sVT4qCjqjlCHR6JQ==
X-CSE-MsgGUID: MNnccPC0RF+MPrckFqO3Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221472723"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:08:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:08:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:08:17 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:08:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UM3UXDIfOag5kRCxdv1fBLE96P5vu9NpSuKOgEJUUtAxjPFvyCJyk9LTK9ia+VqBySvLa4QWvKNYbAuQSdixbiVdJbykRr3QeL87PaNfAJVtBoN6pfVSnpe70zhyz868DpS1qC37Qy1Mfou/6UhNoyU7T9prjH0gxBuLI8StbTGZfihq3dkBHRXgeZkFRScZwmra3yciLp5ItI14JWI2TYHL72MOeLsE0JZQD3sAoxPeDXRbgHBFFD/ZMiB9HcPsfzMSQEiqq+0aRuN5WbLjcC60IwhazYF8uS+u89de1pjQCGUSmigEQQ65Y0zb7To33+j8grhBNWaAIgEsBuP3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/Og0tRytOxoiamo7cUim4sKx9jd6eq7ox6/ehLm3ks=;
 b=ytmfAzyD8kU70kyLbOL7Sokk87qH+Iegq2qHCMIxVQ/CD7kgB5xsifF2zsKl9qWKlyX5/7aiVqbugvsHl+ap92045tuL7yk60yRv649bZdPo3nlFlEl7lSW/XHCuquGfnom2ybIK7Et+cddBh2ODw2W4Y4s1hOdd/Cw4s9nWkCm0tIarPcRyRx8XZVt1lLge5Aob56FHvaG1pn2utGWDFupp1qZamK4FEDyn9t9mOMs5zZdmMCpxQ+j0ZoTXxHmD4Jh2tnEOtBy/9scQ9Jj3NSN8jE8V7fInlTUr4suCUxuKVn9Bb85PF9FvHrjcRRhljp1q3ChqS74MORFyx5HKdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF681F257FD.namprd11.prod.outlook.com (2603:10b6:518:1::d29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 17:08:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:08:14 +0000
Date: Tue, 18 Nov 2025 09:08:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Michal Winiarski <michal.winiarski@intel.com>,
 Tomasz Lis <tomasz.lis@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/vf: Fix up GGTT mappings on S4 resume
 across VFs.
Message-ID: <aRyn+7n0vqtEc5jC@lstrano-desk.jf.intel.com>
References: <20251118124741.3504754-1-satyanarayana.k.v.p@intel.com>
 <20251118124741.3504754-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118124741.3504754-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:303:b5::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF681F257FD:EE_
X-MS-Office365-Filtering-Correlation-Id: dcad1e3c-6bf7-42ee-97b9-08de26c50f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HFOD2qe8FmGfV+GGNXkbaaBoSbwg0/QwQoXVaxAA2koYLOV+wZVDuG7VQ9Qb?=
 =?us-ascii?Q?QpUbhJj5Vb75TiLtucsqmkSXZ12ShApFX45iI3IDDQRxFMIajdQKgEwMZ3CV?=
 =?us-ascii?Q?cerfS1SWBOFh62uWJmcp1ABRdcIalGSJeQVpWMC8fpL2ZQ9pbykGabKKJVL7?=
 =?us-ascii?Q?Bt98VqP/Wem3/AlRpRC+JaLWVRUd1kYw7ZMQfD0IGwdqr+2GYsVVlWZheVTN?=
 =?us-ascii?Q?wiIuYZgvhxLq9+yOYhGx2c9j9Pk8iv8TuGKDei744xo5FfI3R+ZVJSapyy8Z?=
 =?us-ascii?Q?YOVfXeOtd+QQIqEYWZ/ko3Mi8B6vNNVEnARjv6POWOgHTX+K1egiBUTZ2+8V?=
 =?us-ascii?Q?LBQdBeqVwtEfdSxH2GCvgV+PaplIS+1BJ0v9R17U5dxbbN3990yiLlyD/2FO?=
 =?us-ascii?Q?qm8Bm6vmaYHTPQlOjyfQNFuC5WgWyOewpRqSYAgQ0IUX+hIkzB5uSNeJ4H50?=
 =?us-ascii?Q?1Bz7Vw4p5Kj0ftJctDNJTYtxo2eLr0QmYUkxHP0DLfIJysgnLA79V7TYzejv?=
 =?us-ascii?Q?2BfQbaXwCduJaa6X2raAvS+/QYmrdfTxpBR43Ig5iwh0nRsKWFg4RHFYAjBo?=
 =?us-ascii?Q?YrqQzXbNh27eJDi4yesvl+bVoEEO3V+3gSRBSTiAdKmdaMrU7tAOTgzjn8A3?=
 =?us-ascii?Q?tn6gCufmyDZi36mHqbjczP4ZfZ/axnSayq5fn8GMzr14pPEIB58akKs2RTFn?=
 =?us-ascii?Q?uSUBlwovulRLIbpG2jOflPxRszrblHiZf8Tnm9JYLFL51QSi41h/8PUtUvp4?=
 =?us-ascii?Q?tfDx3UwzJd0sji6+ig1I4dCYMdlLk/H+287uC9hZSC9lFaQjjsmFjE1SNS9N?=
 =?us-ascii?Q?Yl2eqgxHHoYzVigHE8TAreJ95IGsv37lzXo4gSBWrV+3B40las+xMoQ2/P7b?=
 =?us-ascii?Q?m696/yqKcw/iq7YX1RtFJ/APIXA9ry4w4AUgnRTjIDh+V74vJ1AtxKHuqSfe?=
 =?us-ascii?Q?ug9tRFbyVLIaUa8e7wqdlBCwPvIryuKiwIPS7e9jBxM3a3dMISSqYXlfSQ5i?=
 =?us-ascii?Q?mzeMlglnbLM+Pb7FjK6XJrZD6KMTkk2uo9TOS78ajGbYYkLqw0FZ1bRQxJsp?=
 =?us-ascii?Q?KZyx2mKrXhuZdms1vLhzGMTyvK+0p0+kLWJMYu+Vp6lzdG/RP3kayVLCj0t1?=
 =?us-ascii?Q?reOzXHYofmbJTf6zBtfx6hZLy9GuDYEt8nDAHxMnVxGggJft1Gn0xY70WyE0?=
 =?us-ascii?Q?+ovzH/pyv1DvK2YlZbMQa60TsfPxb0A5B1k8t1gMBNddCjBrxYdzdQkK9xUv?=
 =?us-ascii?Q?Ok+3n4tg/SWFby/Y3azhYHhp2tkMuDmCUA6DErGQAfjy0uBVQrr0sEnRFzvg?=
 =?us-ascii?Q?FlOAnzMWvGnZ4L7gDsehYdt+9FsPzKzs9JNPISZdYv1elaCDsQmQmuVWSnxc?=
 =?us-ascii?Q?6XQpYADOkFJzhklTYGBfCBR1qTq0oajxS8vUjUrB8TFqd/tp8b5j+z1E7I1r?=
 =?us-ascii?Q?V5ZJOItg5gwek1jj9mSwT1VgEeyxtSPw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qff9DWQDnbA7aNpNB2EEScrJe4D+FsMXBYC/oAaYqG5CPNXL6rSKDxnVVg7F?=
 =?us-ascii?Q?zbTL58tPcO+9KFk9lUg+O0g1P1DGsvLcNZJR4jz0SCVskkW29CcenCBPWMT9?=
 =?us-ascii?Q?syacKUmdHOqQiy7y4/ucK89NKPdsG2hYKvYRXuq5joP9BdyyH+0mxeaGIQKc?=
 =?us-ascii?Q?el/nd99G6Z8RBbuhJ3zi/n3Ri0Zd+xPRUgOFQdnhO9pd71eqk1mJNdQG2F36?=
 =?us-ascii?Q?oK3xWN97uZh2xlMtP/hVPCJw8N97fXMDmbdB6wfiunFOF22eQg4kTG60mSZi?=
 =?us-ascii?Q?vB535Yhx9RUV5NH8tQMMs3m+70kBYV5YXdHBlL2BZlmy5K5U3XnYyCrEnbDZ?=
 =?us-ascii?Q?PcCXjpci6gWQvYB9qY3CgkFbRXbogKrBkzDwcTMa6AKVow9xS4/nux/Xf40Z?=
 =?us-ascii?Q?tXHbqn8MCH9EOssqvL9TlVF1KwEYtmoChw/p66O3z9Txq4Cqkwgj6c1gGiYb?=
 =?us-ascii?Q?an3phDSCB9BsHV0N0MqgSv3a06DyIjPGTfmywwnpGf510UMheMpiVnSJra48?=
 =?us-ascii?Q?Wxszzt2ZR09j4cpMNd4UrINLD9r4YLd4cuHSSpGp1AYz/LlfAzzkT7VM9wrL?=
 =?us-ascii?Q?njKDymdSxSsgKbbKMARgddlxqyBTMO26QfklZDqp0PARM3vU21QERhnyk/y4?=
 =?us-ascii?Q?zkbdC1yT9k/1LEjHZvUDmBOoe7t1wv8OPMcvL9EsR2iCExIPD4FN8OQwqgII?=
 =?us-ascii?Q?biaGBhsIT9eu1jmsOU+GnOKqWkutDcKHs4Gwy1D6SjOKwRSi+/KD9aOSbOxt?=
 =?us-ascii?Q?umEzbkNlZGm7Iek3frBu2rO5BJk0w8U1O2iP9kYxD58oNRJ++yhLhLkGwgmr?=
 =?us-ascii?Q?NXzWbhZT5ojYSOVs5osmyCX1hbLwMua/UxOkGuqjkjkMXXjBisgGD/EvLExV?=
 =?us-ascii?Q?npuDLmn8pbRDprSI/PeNEQccLK5XE4D9hvwkdxcC0T0ZjTf9DkyE6BlrICk+?=
 =?us-ascii?Q?DM7pzBr08Ov4hmAYnkSbpebxR3V6qWrd13oXR+Z/EQGR6buy+jnaoSfEUvNy?=
 =?us-ascii?Q?lxM3qeuvME6yAP6EmMTD9UbUdgeiX8FJ4bbdAqgSAlTjfTZ7ZoCnLEijCQji?=
 =?us-ascii?Q?CGShQqeIhQnqr4mLGg/PCgnA3QbBbgkZhawMuiYO4Xa1wk6Wx0+KO0VW1bxv?=
 =?us-ascii?Q?56aOMlozVBhngYHgVVJbp/g/lYgsRr+jip3T73ONhBCFPFjrhgHs7oWm3s6X?=
 =?us-ascii?Q?9mCXhTxorRUaEYblAir2/+oYd/PpIK5altcBRsjvwzHHsMtYAWuoOS7PQJA8?=
 =?us-ascii?Q?FgjVzy8Wkfu0GHk5x/H+jat/bi/mp6A/ornVJkxprbgjfRVGLP959HG4eCLI?=
 =?us-ascii?Q?g0ctkDDIeXPXuW7UnUt+51TTd2s3hrDJ5fMwmmpPzjSM3I8UTwo9dnlQ19Ei?=
 =?us-ascii?Q?I/oj+yA80g+C5zA9JuJezUooE06oaM4cMnR+Cjc4cUWSSt81hogbS6+s/Tn1?=
 =?us-ascii?Q?0KnK1GT3jHE/KOSFWX3eIeYS6RMC+dmfoipFb01qfX8yqUUl8y0fftk+gCyZ?=
 =?us-ascii?Q?qDMHVm/B54kbK3jRvqpIzC3svDD8jWitOuHDglD7lQkFq+llhz5LuCvJhE+Q?=
 =?us-ascii?Q?r0nUvANzIju1Jrc+Crt8DoEymmj2GUY5D33yHtrwQTL/K8aqzNvo8qQfzjAI?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcad1e3c-6bf7-42ee-97b9-08de26c50f3b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:08:14.0655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZMyzgOAbcqtzC63bVyVJmXYerpGOSOLA2PCPEVLwpRVd3+yHR22o3NLcglr9fUdtLU3ov28GJeBwBYA03k1DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF681F257FD
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

On Tue, Nov 18, 2025 at 12:47:41PM +0000, Satyanarayana K V P wrote:
> When SR-IOV is enabled, a VM may suspend on one VF and resume on a
> different VF after S4 sleep cycle. Because GGTT space is not virtualized,
> this transition can lead to incorrect GGTT references. To address this,
> validate the GGTT space during resume and apply necessary fixups if the
> VF has changed.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V2 -> V3:
> - Fixed review comments (Michal).
> - Added a new function xe_gt_sriov_vf_resume_fixups() which handshakes
> with GUC and does GGTT fixups.
> - Updated commit message.
> 
> V1 -> V2:
> - Rebased to latest drm-tip.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 38 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>  drivers/gpu/drm/xe/xe_pm.c          |  7 ++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.c    | 30 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf.h    |  1 +
>  5 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index be7986537aad..87aa1d6576d6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1335,6 +1335,44 @@ int xe_gt_sriov_vf_init(struct xe_gt *gt)
>  					vf_migration_fini, gt);
>  }
>  
> +/**
> + * xe_gt_sriov_vf_resume_early() - Resume from S4.
> + * @gt: the &xe_gt.
> + *
> + * This function shall be called only by VF.
> + *
> + * Returns: 0 if the operation completed successfully, or a negative
> + * error code otherwise.
> + */
> +int xe_gt_sriov_vf_resume_early(struct xe_gt *gt)
> +{
> +	u64 start, size;
> +	s64 shift;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	err = xe_gt_sriov_vf_bootstrap(gt);
> +	if (unlikely(err))
> +		goto out;
> +
> +	err = vf_query_ggtt_info(gt, &start, &size, &shift);
> +	if (unlikely(err))
> +		goto out;
> +
> +	if (shift) {
> +		err = vf_post_migration_fixups(gt);
> +		if (unlikely(err))
> +			goto out;
> +	}
> +
> +out:
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Fixups during resume failed (%d)\n", err);
> +
> +	return err;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_recovery_pending() - VF post migration recovery pending
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index af40276790fa..68026b561d7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -25,6 +25,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
>  int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>  int xe_gt_sriov_vf_init(struct xe_gt *gt);
> +int xe_gt_sriov_vf_resume_early(struct xe_gt *gt);
>  bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 4f8688fd3f00..a6fcddc47d62 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -24,6 +24,7 @@
>  #include "xe_late_bind_fw.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
> +#include "xe_sriov_vf.h"
>  #include "xe_sriov_vf_ccs.h"
>  #include "xe_trace.h"
>  #include "xe_vm.h"
> @@ -248,6 +249,12 @@ int xe_pm_resume(struct xe_device *xe)
>  
>  	xe_display_pm_resume_early(xe);
>  
> +	if (IS_SRIOV_VF(xe)) {
> +		err = xe_sriov_vf_resume_early(xe);
> +		if (unlikely(err))
> +			goto err;
> +	}
> +
>  	/*
>  	 * This only restores pinned memory which is the memory required for the
>  	 * GT(s) to resume.
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 39c829daa97c..a33f86b7986d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -191,6 +191,36 @@ int xe_sriov_vf_init_late(struct xe_device *xe)
>  	return xe_sriov_vf_ccs_init(xe);
>  }
>  
> +/**
> + * xe_sriov_vf_resume_early() - Early resume operations for SR-IOV Virtual
> + * Function.
> + * @xe: the &xe_device to resume
> + *
> + * This function shall be called only by VF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_vf_resume_early(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	int err = 0;
> +	u8 id;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_vf_resume_early(gt);
> +		if (unlikely(err))
> +			goto out;
> +	}
> +
> +out:
> +	if (unlikely(err))
> +		xe_sriov_err(xe, "VF resume early failed with (%d)\n", err);
> +
> +	return err;
> +}
> +
>  static int sa_info_vf_ccs(struct seq_file *m, void *data)
>  {
>  	struct drm_info_node *node = m->private;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index e967d4166a43..54fe6eedeff6 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -13,6 +13,7 @@ struct xe_device;
>  
>  void xe_sriov_vf_init_early(struct xe_device *xe);
>  int xe_sriov_vf_init_late(struct xe_device *xe);
> +int xe_sriov_vf_resume_early(struct xe_device *xe);
>  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>  void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
>  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
> -- 
> 2.51.0
> 
