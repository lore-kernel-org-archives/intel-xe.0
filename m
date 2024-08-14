Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FC6C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 21:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BF810E0D2;
	Wed, 14 Aug 2024 21:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RK33Fq+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666DD10E0D2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 21:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723671018; x=1755207018;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/Z4rji+K1nGrqyar4bJXxSO+6rubKc7/eLjeuqeGZzU=;
 b=RK33Fq+RrIgne72wQernEjvi7iQxUcwq5dhGOn0E7cbHXMTI1hicaxUA
 f+lYK/m7A8vkl9ibO6G2Lk8DV4rm1WVMteKzAnp9oDeU+byRUXQqUWaO4
 T0LqNao8jqmaOreRhhZk+KDImwdCm9RL6ZXWFBm2pLN8Bq4TbbFUbpFgV
 tVSrk9P05fIiu8EcvAdeg6QWrBhrq1z/OuZ1KF9ctb5g8kGAk4yGYFyR0
 KxSEzgvJG30xwamnnNJY3tCG8bjuW6b7J9D0nqRJQmIGRC5bNcff7eNAa
 Axsq/6YLKQmlqUmc2/0WlSxMOoe83Ki8ss1fmhEsUKSqOQVND3hIHlS4J Q==;
X-CSE-ConnectionGUID: kO2AQU16SxKb+ibmIlGO9w==
X-CSE-MsgGUID: 9CCXPjlBTRiK0u8sPs0dOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21882051"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="21882051"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 14:30:17 -0700
X-CSE-ConnectionGUID: QKChLW6LR46nPHFrElot9g==
X-CSE-MsgGUID: n0IWQ1/NTMq+0BvH4yAbfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="59890575"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 14:30:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 14:30:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 14:30:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 14:30:16 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 14:30:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5pOvy71aTvSt4D1QQQHJTYdmL9zXTdgZ8t2oDCB5RINAdj27xuPkSHJJyAy+cN/QAOcPF3huwQfpcPJVNP1nce4nHLRptJH87SrjTBMbY3KnlGE82JaTLnDZUXfQPa8TSE40yJJr9eTFSg+rqEx7+zHXjGTQjjs6VMy4c+EwOaI4DXfI8QnQ10KElGfcFcwrwhn7PgU0G50PAx7VAOuClr9irn5UDB4F8r64set8SyaR/cYkpyOwKf9sq36iqYCI7IgBRGHgXeVq4iMDeUn4Hg+mnWwa2dX2zD38tn692YKAxnqNjRaPmL5akZ7Jv96rGaHKY7HHnNrGhmsD4UxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyIEIV5fxKvZNQfHNT6NNZVigzXB0inhBfP1HUX9weQ=;
 b=AmiE14+Ie6ZNvGkj8F5xBvb5zpepOYmw0WR4iE0bLA7queqLmaPHh1Cnyv/WlMziQZglgyuHvJy7Cun8NRM8+0xzIk6QRLXH556RJ+HPcFZEUMqxuU8vLc6dm7U1aXnyIs6ROZZASNRz0JZzjItFHQr1OBQ71DhbxmLwjdW2s3JJfEAA1AmhOhbm+EpQDaPw6syU4dGSx8BCfW4xEXTDv+/6CV1umvUNcURQcMJig2Jr1gqPfGCDu/bIHLG70OOwt7u0N5DP0sdelNCQ67/opfFNdyYR38S9N2CtZtRx0qwYfjNLo8D4zFMqg/8oIrm3eNE9JDHrPKxEWB+z9cnuYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7425.namprd11.prod.outlook.com (2603:10b6:a03:4c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 21:30:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 21:30:13 +0000
Date: Wed, 14 Aug 2024 21:29:10 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Make exec_queue_kill safe to call twice
Message-ID: <Zr0hpvLC7W0Hyc54@DUT025-TGLU.fm.intel.com>
References: <20240814205654.1716586-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240814205654.1716586-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c16eeb9-7f10-453d-3041-08dcbca84846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B5CnEBFP0UuNhqcvguF2y+UHT/KDzjXy5dFBIU7sZvEvejZxZC7vbrq5Iu7w?=
 =?us-ascii?Q?WTNNK/IGLeo6Z5+z8LAUh4zEJkxYFaO8d058SbB6hYblyNshwY960SNLOeEz?=
 =?us-ascii?Q?zlXWFrxV41j6U5tfJP18rgzt9X4G8BiSbHlg2YtF+by8bPG1gcnsy019O5pD?=
 =?us-ascii?Q?9AiwKDQu5v0j7P9vmQlnhffdkmOYQ9pjh4hP4sUMfd9Zozssw4rFvyUJH+le?=
 =?us-ascii?Q?EB3cCup5+vIbUhC5vpPPl55OHw2XcZg7zsSAVHRm0V7MUJ7ad7zPVlMeLXmF?=
 =?us-ascii?Q?LYvjXBHyTWq8CwP/8+t+P77jjZLP/NBje/b6rBZeN+4LcSuigWiknJkKf2Cy?=
 =?us-ascii?Q?twTr4KrCSaQkLeWTpGDD/RCVCx0Q01AXWwoFvw3WhWgvUNWXsDZ3cOEN5qM+?=
 =?us-ascii?Q?QpX22Fg5K4wS8Kyd1f4sLK/uvVXpPVZvS6qOwOPbqw4pBOPfGKMorFlsxBzz?=
 =?us-ascii?Q?PpVwoCpOUOY3Rgi9G3u8UP82qgnnySioodvRh3kvrLlE0km5ECvjCzDYRl83?=
 =?us-ascii?Q?bjyuRZCu0TPd+2KmdTAeIUOaN/fObhGmbJKuKBsKkVTdOa2aX3PReLZMIsce?=
 =?us-ascii?Q?OLB3oDyf6lYYTTtHrSZS12IVSbNDbndwAeQi/TYyLT9WL4SGGjgww2EU+xwl?=
 =?us-ascii?Q?gs9dY8LSqx/a5cSi3IQCnAk8+1nxikOaRbd9ywKiSwMIIW8UR0IpQOiUKF3K?=
 =?us-ascii?Q?/U5PTaFVeOUX/g2FxGMyjhJJnq+eURVwJEtSsj/PgpbDBDwWrGq0YmORhPRG?=
 =?us-ascii?Q?teINx9ZEyr8IVDBfCd4mQioP6Qc2r8NCOuoKNqBLkQJc0SO3VjCG36O53FNo?=
 =?us-ascii?Q?gpiAejFAeb5z/rHx/fctBY5A9dTBh4m9sBNEYIooqGN0qcwbr/kX9tTwEiFP?=
 =?us-ascii?Q?kg0sVYMwyppwKzI0gAm5pXzJUDhMSzx9yncBZu6908P8ITIaJNOaJkRul4Cb?=
 =?us-ascii?Q?89Yo57p8YuOSk5HrHBKffyoE4jKk636NU3q0v51a2wvLVGvkwDQ+8/aZtrFF?=
 =?us-ascii?Q?f4LKLQWklNEdAul3Zs6m82nu2fml/fcTKHpXBPhIAni6P0WYTDz0NT1XCWkH?=
 =?us-ascii?Q?KAVkw63oK/iyIjf0woQlnbtDb/GX0A9Rpe0y0uj1Xjnh6P7vupelKYTeiIXj?=
 =?us-ascii?Q?Tc1LJbm+bCZ5DvbisoejykT3cBVatW/GpHHLk/fTLLjWb0yxmcM7dp3X6iAW?=
 =?us-ascii?Q?H+H6r3LTwvjLgMpijISqMpw+W4+eOjgawXYkbTtJY9GmKNq0uEwnCOuEHleP?=
 =?us-ascii?Q?LdCsBmA08x7mM8GL9UCKd2hSJAk4hxOLmJull37dEuRsNEkq8y92QrEwk7FD?=
 =?us-ascii?Q?srY8LHAF7QB5X/nHWKnfAwUxb5jaox15UJXLKdkGYLFUsA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMpj1/B7Pg9Hv+ksU2OI+Yc4ugfcB8fd/qLdSmTr2ej/hlH47i/dh1FeeWsd?=
 =?us-ascii?Q?nXmjN5+dtAqv9ggF9y7DVvmQ7DTaEZfjsw1MMI5aMVd3xvM/SzsYIQZHSyAq?=
 =?us-ascii?Q?f0U8nkqKCOWY8F9IfTfdrYZRfY7csyfkIBBIppInggKt29EbHoUirsyoscUg?=
 =?us-ascii?Q?EqJYNY6DUgsUdJYZ57IVhNAo465IDX3sKSGtshGT0lHhgUiviPc075n6LF74?=
 =?us-ascii?Q?HIYSVlypgKZCppNJjEiZwvYUcohmqz/VLbm6H4vlF7LWk9JPOcMN+nmphRXE?=
 =?us-ascii?Q?Mrm5O2qFOSsHR5pKuyveWmaRsvLf3sM9V/W+Glrf3n+jXMZPfOm9YJ5sYjE2?=
 =?us-ascii?Q?WRwfaC7gtMuPkXgIolJc0sc36AhTISsU5pTSmHrdlfJvMZqwIC7JJf2glwwy?=
 =?us-ascii?Q?nxTioIQEm8bawa3YV6fmnzf2OlFsdbhIF9C/zLEMYBkojbG5oKszd4wWMmLM?=
 =?us-ascii?Q?c37Q5dyHDfW3v5D5wLmRGsDU7rHHbRKd8aDpTCEBpASXun0b1Ot8BAr8h5nZ?=
 =?us-ascii?Q?4x4I5jKDnal+3G2wRCJGLed5gKgCdVaBP7wu3H8XFOvoTBJs/qoNwg/d2xah?=
 =?us-ascii?Q?QmO2jKy0xEkJE78Am7/CelzOmDLJ/wCi8snR+iH3vTO2w2NB0tbbc6VqkgPA?=
 =?us-ascii?Q?IlPLfpI4SYHfp5paWS/u/Z7eT+jlmWbU5aknSA3983+0DiMtyvmXGe5Z+E/g?=
 =?us-ascii?Q?O0eO/K922znYICPU8BdvgNaEszcR8gNDbpV5eue82jLotZB3cuQ59Dew4PfT?=
 =?us-ascii?Q?TVN2NXYnS7PGOKgTGBvG+Byq1F8j4S2hoX+vV/ylSoxvBNXP1Cwmi3urHTXh?=
 =?us-ascii?Q?Rsr6MEPAJLIUkZTEyo7023h+zfwwguYGlGb8hWwRoLSBC5KCYqSYdbNKvdET?=
 =?us-ascii?Q?3iejxgqikpY/489fE+gpA8ke3VhVptYjvCj1L7CWXfFK+CPOY8so/fHAO1zR?=
 =?us-ascii?Q?EiER00Sqm5mxFkMxSC1YhtHX6JVzp7IyTKQN8lqBZJv7tRqVeW8HsWKu+Tuf?=
 =?us-ascii?Q?93fOD4BbKCY8/kGamOzqUvA8RmezRb9O1j2HmE0yKGE1Gddp8LBKynsrzmMg?=
 =?us-ascii?Q?wtusiS+/C7TXcq/DR7+LoVW1pMAfviuLltwWLCypyS42QfwDh9LiiPRPTH8E?=
 =?us-ascii?Q?PT1DTfp+p+zsYLpHsYDV2+MLBu5GrhxciPHkyp4emMbnW/ZzWSIvtFvGnWzu?=
 =?us-ascii?Q?luaPSd8B8gDbz6lh1KGv+/fCGRmhbtRwPYz3u1S82/F5bDxAI+Mt2R/fXJw7?=
 =?us-ascii?Q?XKHp1/hvDT9U5gTqyvHz4AkHQb+QnilSaFFShdx0tjfK4rxMYuEbFfN8QHwL?=
 =?us-ascii?Q?BC8/olkzQiOZF6Ot3RQhl2OULekGdXNJLttEr344/6/UuEP+XSw2BzVVJDGw?=
 =?us-ascii?Q?datjyuWnb0HcaMoocu+N7HRvrfU6PNTDYRgJHz2oj6oyzh+pCGgSdIMsGA7Z?=
 =?us-ascii?Q?OqMyh9mma6Qb0QRjwnOVc6OtBg+yW7kVQUAB2WYxVDcAagfsaFcjierGd/QZ?=
 =?us-ascii?Q?ZrX05sCKJaX/R/lhczCsdaCTEMKU+9NasQo6x4WbWPvIDNzLhS98XlKYJOmZ?=
 =?us-ascii?Q?qufFskyJ27P4JWM4hErp17yslcNZcJ2ySOECe/ICrziHKLpCrsaVRopuhyyQ?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c16eeb9-7f10-453d-3041-08dcbca84846
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 21:30:13.4028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE2+Ca7ALVzUqpfQYoq6GnN4w6vkeZnsjz4VWnQRGi8Fg2eASMBF01RuMBfrUkOam4ihSkIm+5lf/Od2p/g8VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7425
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

On Wed, Aug 14, 2024 at 01:56:54PM -0700, Daniele Ceraolo Spurio wrote:
> An upcoming PXP patch will kill queues at runtime when a PXP
> invalidation event occurs, so we need exec_queue_kill to be safe to call
> multiple times.
> 
> v2: Add documentation (Matt B)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++++++++
>  drivers/gpu/drm/xe/xe_vm.c         | 8 ++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 971e1234b8ea..7d170d37fdbe 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -770,6 +770,15 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>  }
>  
> +/**
> + * xe_exec_queue_kill - permanently stop all execution from an exec queue
> + * @q: The exec queue
> + *
> + * This function permanently stops all activity on an exec queue. If the queue
> + * is actively executing on the HW, it will be kicked off the engine; any
> + * pending jobs are discarded and all future submissions are rejected.
> + * This function is safe to call multiple times.
> + */
>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>  {
>  	struct xe_exec_queue *eq = q, *next;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 22add5167564..6dd76f77b504 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -275,6 +275,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>   * xe_vm_remove_compute_exec_queue() - Remove compute exec queue from VM
>   * @vm: The VM.
>   * @q: The exec_queue
> + *
> + * Note that this function might be called multiple times on the same queue.
>   */
>  void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  {
> @@ -282,8 +284,10 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  		return;
>  
>  	down_write(&vm->lock);
> -	list_del(&q->lr.link);
> -	--vm->preempt.num_exec_queues;
> +	if (!list_empty(&q->lr.link)) {
> +		list_del_init(&q->lr.link);
> +		--vm->preempt.num_exec_queues;
> +	}
>  	if (q->lr.pfence) {
>  		dma_fence_enable_sw_signaling(q->lr.pfence);
>  		dma_fence_put(q->lr.pfence);
> -- 
> 2.43.0
> 
