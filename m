Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E70C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 15:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7328210E080;
	Thu, 22 May 2025 15:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5nchM5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359B110E080
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747927058; x=1779463058;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=opZQSjm/Oe2MK5cvNIvgX63Kzemjow2xGz/PKg9oYHA=;
 b=I5nchM5R0TuJImJ8mrMMOmwBmFLo9S8dRunr68ab4ZNAsQuve6xCIcgh
 oZa26XixNoDJK3Hpz4jMXmmidvW9KtAl9CFM91Ht35y+Og3Rvr0zNmHW8
 Z5FxOY+hYaX7a6+BGEr2TUaqMbkScMZSw7EygSB0HtXHPmZRN4MBH+PmK
 lnPF9THzP4524uf5M9f4+6nVffWes8lHn8pp65xEWykpXY61BxvG16dpD
 bwo/0vCdc1JhaH8JBB8epM/xUvVtXGXWUSJ9EgkSll9Zgl8Zj1WcxpR8r
 Dv6FnKyxVEQdaXS8PSIeJ8oVOsZZu7BxH/fK2umPy38gi+4tosuBJgwH5 A==;
X-CSE-ConnectionGUID: aNjcAdCiRlK/1d51cZbVaA==
X-CSE-MsgGUID: Ftiw7cIST6q0zOTDe+odTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53772371"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="53772371"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:17:36 -0700
X-CSE-ConnectionGUID: dq30OW/SRryWjS6FbMmdJw==
X-CSE-MsgGUID: lpeixo4ZQnypscNK9HrQ5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141709828"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 08:17:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 08:17:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 08:17:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 08:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXIn71WxCoz76GVFh+r0Q0ckhWtKxpLaytMPugMtZeAtzkzQvgBWkjHC9mzKbugKcch/ws0udmpkCdVq5K+xAtHbywD9ZVGPcyH/ozTq3GkvBcSG08d05uvZHG+t3eW8N6Ea66AvRAnn+BC50L6o09dmPsz3E4xHOazdsWMqaE5vZUyvRriSH0C5c2ZNtlJ64FBWBpZmQ++x4Qxtdx22EQ9He3FLzjdSEsoj9RE0LRcwMUHLbXcmEOS9c87Nk7UNUn+XzjlAF2ertS51imqGNGqrYDui3jk0stE82NEh6OzhFI1ARjl4P8g17slQce9pYDLxY3hVLJ+vYkfT5Rm24Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8Jf8KbFNj4TtDLNcue8wRdJhwZrz25jzbSmsUsj3HY=;
 b=J5VbYjkeP6lsuqUzg39zgKU6qBFRM3ZygA4Gd9IGnoxo2DekjgJmrNP5H6GQz+Q9YRmNSmwrSPV29Kuww2tF9DBozK6bBTkjJCVKminzMJFpphs7UzGC8VilROxVq6Sb0dNRvJ2HQ9fBaa0NvLK6wP5WTvuDoZ/cXaOADP/7I6hcGiaMH8MbaHdRAMThPCmrRw3yZJ2SbjJ5w9ak9erO+7PxzqsrTQhSiMVCd0QqFYfmt88HTw4eGVbF0Ri0V0OEryU9TphfmvrgNdXUiUGWGDBY5aierFqd2jgo6QrH8EGTsjLa8+E9mus2ziajJeUVysEaMdpfcQnP89WmAzdieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Thu, 22 May 2025 15:17:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 15:17:30 +0000
Date: Thu, 22 May 2025 11:17:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison
 <John.C.Harrison@intel.com>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pxp: Clarify PXP queue creation behavior if
 PXP is not ready
Message-ID: <aC9AB9FW6zEKt5kt@intel.com>
References: <20250519233228.3754667-5-daniele.ceraolospurio@intel.com>
 <20250519233228.3754667-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519233228.3754667-7-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3878f9-d316-4b56-03db-08dd9943c4dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WGZqeJhqt7aROM8n4QWoprpkdyaxh3wB3ikUCRLSKg+QAxtFyhhQaLyiYR?=
 =?iso-8859-1?Q?Cu51JicXyZ/wRHObYGGAfNiKclX3Qk7n2engwqexQq7r8xvLOROT7/W/RH?=
 =?iso-8859-1?Q?7zTBIVqkPBR0OLEEUnT2GEihc+vuuuatjyqZFMnbtu/Y68pb7Rg36BHu1z?=
 =?iso-8859-1?Q?c18rTBqZr0MmdGO8b8TIrDhsQ2InsNe3eoRFIUBqJYbUWuwZ9qCS5ptkDb?=
 =?iso-8859-1?Q?w+gARXMlOYsb6o17TbcKuGuVSUdIxf6A6Z+clrgJfEQVsMfQ9GTuPat012?=
 =?iso-8859-1?Q?bY2gj2j2+NYMY3upfbXlx+yMl0/JtA/7RbVZPOz36BH9k6colXYv7dk7sN?=
 =?iso-8859-1?Q?4JqMw0Gaoq9HSJC9EF5wDbFlDlBhwz5jT+4GxqhJlyluQaRVtJs6RIotDC?=
 =?iso-8859-1?Q?Jl9zyOLxGt66iyPt5YZ6BG/rdZnVqtb27EN5oMDarShsMdsgQbtttwyiCr?=
 =?iso-8859-1?Q?6XomItTfpf8LhBowZhASYS7MEkcWE5fi0rYGpJD5dd+6kQZD7rl/14o6OV?=
 =?iso-8859-1?Q?vxD5N4jLwScSpJF1p/RnzmfOsPgTWFJZoi6iinLqOUYtZIA7moxJuO86gg?=
 =?iso-8859-1?Q?XVTewEQSVTFGqSTTvnsUHvrsI6/iWUPlEuygjYniPqyDqwXGc+P02lqzqz?=
 =?iso-8859-1?Q?2cDON5cJGMxqM2HgVFPpss6jKdByFDS8qWoWuccLNvjpvj+OdudZrIkomq?=
 =?iso-8859-1?Q?JuCHzISDI9aaaUbV+fNQzb+CNa9z9X3qxKq0tCgU0z7BI6KxgvhR8ukGta?=
 =?iso-8859-1?Q?ZLbKEqCEnkK92omuKpRdhNDz9nJu1kIx4o8BevlpbCyaFhb+3Xr7Jt0vLW?=
 =?iso-8859-1?Q?0iJz2z76rvcGCNcCA0of32xXyN40dLc2KiA8LOTtxiyEZgfX7RqAIjL9nl?=
 =?iso-8859-1?Q?xRvMyBG7HDXSsVS1UrKBjR3ZCluJW6Fo1AkcC2Bu3N/xlyMUJLNUByqQSR?=
 =?iso-8859-1?Q?2/a6z7gvnQ5FI9CUTZJ9dyWwSNj8uaVuvfqmZKD5L60fcBHQ+TYGosI4RT?=
 =?iso-8859-1?Q?ZnOxPVaPi7/m4FPqh2XCJdPPSiHZXCUV8+DKPU50GX6o75SfVjB5MFf7ZK?=
 =?iso-8859-1?Q?aarXchnftYNn2cpnk3gGRTuY8LuLEfB9AfgHf70VnkCmP+2u+DIFtsez23?=
 =?iso-8859-1?Q?BhJ66YbrwhoMgNTlrdWfiRXpxiwKkBi4YuiA4zgoapNpa7mktZJdVtCOeV?=
 =?iso-8859-1?Q?slSseBRSWRLlSIInjCa1UxdjAFB05CIp7Q34SbTUUGPDgCqpKV5k2C200G?=
 =?iso-8859-1?Q?Jn/DP+sUQmOwfNpWe9SpdJsPc6+CuPpYUEDkLlZgE6pfldtCUcZR8biSOc?=
 =?iso-8859-1?Q?TBUO+adWHGVADgt1C7DbUog9o54Y7wr6MSKN1ZDgm2JDyhMbAQ7hdRTFZ4?=
 =?iso-8859-1?Q?fP7oi/Dm0H6jve4Z8dmA9vsQ1GNxWsryex5Fj8xCsHM0ubtLzVyVXMujHf?=
 =?iso-8859-1?Q?/DluFUtJ7WxAUmSRhZd/muUGsYB9w0ZiRj5tPjnwd9YlfQPcg3AZNp+/a3?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xoAKYjE6EgD/6brq/W+T7lps5DvcOtJtU7FuO9d0No8rYgzfVeJqQxrczj?=
 =?iso-8859-1?Q?GL/Y1Ofcw1u4Pa2hYI3GMSUvbrkvPGEgRoP6k6JbxLQYdx8cpdRRpzjMKN?=
 =?iso-8859-1?Q?Q1vL5OYuMZqnPtxukrOAj1qf8j7jqdk3k0JbOpvJzuxirhwdjdZg4Oh81c?=
 =?iso-8859-1?Q?7rQ+jfpOFPWab6FXIYW4vnU6gLNsYgmpmrPxKf1blmCuYVmL3xKeaedbOo?=
 =?iso-8859-1?Q?HO8fLHXC49fYCHy+XqeXoe7/mXUl88uvcumS6C5rTlQn8xW1qu6tHLnD7B?=
 =?iso-8859-1?Q?r1umilwy1Tq2ldEWakFDxyttEyHF/N+Nl9pkR+IYRLhZQyoZ/QBjEmDVfA?=
 =?iso-8859-1?Q?VclWyF1NKw+V0Q6kIcSDZbCSDc+uVwKnJsm+zlsuGjdvmlDHqHAbodpHHG?=
 =?iso-8859-1?Q?m8IaZKZoUjGbuHU3B+3oyYoxMbD/u1wmGESrH6TX9iB8jJeKYQpNkbf40e?=
 =?iso-8859-1?Q?BnwYCuP3OT+E++3eySZGapn2zrOvd3PF8diK2z+/Qe/dz39JQAKtb4PNay?=
 =?iso-8859-1?Q?QC/w/y0emtg70OQiUmNiJriU3hEWI577RJwXfGjgg3dUD3SNGN27aBOGuW?=
 =?iso-8859-1?Q?YR5vOaAA7ZWvTanA+moLpz98nntj6jgh7Ku09L3brVdvL6QLwjz0qlVlt+?=
 =?iso-8859-1?Q?a3xyxbsMRfWWMFopj0iM2MWXBN8DfhIwtyiZ788hLbgJUhMSPR8qtjg2zZ?=
 =?iso-8859-1?Q?HG6b92fE1tri1u3wUfzVoJvwVQVnPN3yNnQRN4WO0EvlVBY4TerEfjfiWm?=
 =?iso-8859-1?Q?1ojHrPZaajfMM4UZk7w1AUoyfoALU2XgGGfMujGrsoSzlsyeD000KUI0pJ?=
 =?iso-8859-1?Q?7zF6aq0NbCz2/WCCCYCC6uvou656e51394kTDBjGiLxtzXWh9/QLvX4MEM?=
 =?iso-8859-1?Q?KOkoLTG+fi9qJR55SWtqp+9NWn5q/psdbpd4Jn9aFKCqa1I/LmOj+IyQIW?=
 =?iso-8859-1?Q?YkwHKHX5Ud4SgmYDNIj6oa1Q76Ct3L2MqOvHZCX+hv6yQFjrYswhcT0wfg?=
 =?iso-8859-1?Q?Koje8ppG4yvfBJdFVjVLJN1WrG6mANI5SP6SmqW07LKJjmo2bGuNb3EaeA?=
 =?iso-8859-1?Q?7S6Yj+QHbB1Ad0y67FbOMJp3sPpxTP1Xka6RxSVhGyuZMs57r0jYnxZHKP?=
 =?iso-8859-1?Q?xQU4LBH7HsD743ArumoF6SBO1oXQBGJrb55Qs2dLgWAT6TFgZ5yzTywhiH?=
 =?iso-8859-1?Q?nFLrRJ1M7ShMb8RpLO3q8AbmOeg5Z4MRlPV/lODBT7pguyRIdjHSU4vUv9?=
 =?iso-8859-1?Q?2X9OjtOVvvBYBQArXBFWKqcnEINHhdP9/EDDdEZoI6jhn6yY8pg+2jfrtT?=
 =?iso-8859-1?Q?+YuKmAGRRawK4mVDYB5pYjm2Eu5gXaGHiG+jl9Mn/yb+ERGCL2C8C9VwgP?=
 =?iso-8859-1?Q?Rj70Wcanq9z4woC14FvtAWzMJH5hNObfCEhPVEatluyN1kpqyx+hSA37Xc?=
 =?iso-8859-1?Q?n++cpBBk/B3dLxMUo8vFOoZihX4jOox7H7PdstlfP2s+bks2uL+VHwTwWb?=
 =?iso-8859-1?Q?DYq2aD7c7F5AJ/e9vVIzUF5vO8raxmirgZIv5XCnXrk6IOdHCMEs+B5TlN?=
 =?iso-8859-1?Q?rsvK/0g/NmFzPsSixNay5kxHfXbwf5Im7LPci1i8s+6RjoYrM5OK8lCmqo?=
 =?iso-8859-1?Q?pKc/Nicde185DvX80lWxvBCFUOkW9hrfNfvhlnDEuaL4gsFDiqrMXv4w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3878f9-d316-4b56-03db-08dd9943c4dc
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 15:17:30.3719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xj0iC/l4S+gHzlkLtOd+jhhUARy9IGvjE4w6X72X3Lopk1nnxeJS8iOKMAvT4Y+T1BK2sylOvi9Vfa7h8WQGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

On Mon, May 19, 2025 at 04:32:31PM -0700, Daniele Ceraolo Spurio wrote:
> The expected flow of operations when using PXP is to query the PXP
> status and wait for it to transition to "ready" before attempting to
> create an exec_queue. This flow is followed by the Mesa driver, but
> there is no guarantee that an incorrectly coded (or malicious) app
> will not attempt to create the queue first without querying the status.
> Therefore, we need to clarify what the expected behavior of the queue
> creation ioctl is in this scenario.
> 
> Currently, the ioctl always fails with an -EBUSY code no matter the
> error, but for consistency it is better to distinguish between "failed
> to init" (-EIO) and "not ready" (-EBUSY), the same way the query ioctl
> does. Note that, while this is a change in the return code of an ioctl,
> the behavior of the ioctl in this particular corner case was not clearly
> spec'd, so no one should have been relying on it (and we know that Mesa,
> which is the only known userspace for this, didn't).
> 
> Fixes: 72d479601d67 ("drm/xe/pxp/uapi: Add userspace and LRC support for PXP-using queues")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pxp.c | 8 ++++++--
>  include/uapi/drm/xe_drm.h   | 5 +++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index 454ea7dc08ac..b5bc15f436fa 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -541,10 +541,14 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>  	 */
>  	xe_pm_runtime_get(pxp->xe);
>  
> -	if (!pxp_prerequisites_done(pxp)) {
> -		ret = -EBUSY;
> +	/* get_readiness_status() returns 0 for in-progress and 1 for done */
> +	ret = xe_pxp_get_readiness_status(pxp);
> +	if (ret <= 0) {
> +		if (!ret)
> +			ret = -EBUSY;
>  		goto out;
>  	}
> +	ret = 0;
>  
>  wait_for_idle:
>  	/*
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9c08738c3b91..2708eb73c590 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1210,6 +1210,11 @@ struct drm_xe_vm_bind {
>   *    there is no need to explicitly set that. When a queue of type
>   *    %DRM_XE_PXP_TYPE_HWDRM is created, the PXP default HWDRM session
>   *    (%XE_PXP_HWDRM_DEFAULT_SESSION) will be started, if isn't already running.
> + *    The user is expected to query the PXP status via the query ioctl (see
> + *    %DRM_XE_DEVICE_QUERY_PXP_STATUS) and to wait for PXP to be ready before
> + *    attempting to create a queue with this property. If a queue is created
> + *    before PXP is ready, the ioctl will return -EBUSY if init is still in
> + *    progress or -EIO if init failed.

This last phrase is a bit strange imho. 3 'ifs' but 2 outputs...

Perhaps the s/If/When/ ?!

But on the overall change if Mesa is okay with that we are good.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>   *    Given that going into a power-saving state kills PXP HWDRM sessions,
>   *    runtime PM will be blocked while queues of this type are alive.
>   *    All PXP queues will be killed if a PXP invalidation event occurs.
> -- 
> 2.43.0
> 
