Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE12CA0FED
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 21:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74BC10E2EF;
	Tue, 26 Aug 2025 21:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8flOdvT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AACA10E2EF
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 21:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756243777; x=1787779777;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NomaD+V7Rg13s388wky4fS2l0YsL02GDyF82DsA+fwY=;
 b=l8flOdvT6Y9ArIm/VRi5FFy2NUVF21mKDXmj6CrQBIceay32Jkux53QR
 AddnOzMIzhZx4Io44/0J+10qkldPLclL3iyC4pcLnYGkAo8bPTZjg5XXS
 BYmV00hMP8NWOC+sI2aX7zSK9OtiK1rZUqb8BN379bfn/c1A11h7/TYMm
 C6zMYW5gxu1FvxJE4np8pIy4yyjz8JevItX+ARGbxIRM0dwTQrr8O6dQr
 I2Bax3OuTqJOu2VeYCbmtcLaPwH4MRcbN7epvn3XHH3JI6i5HY0Z+0RXG
 yWmVdiTJ45lSGQw4xZA5nrQrsXWmBlFJXtP7qNX/VrL0bMdkRRDLak+b0 w==;
X-CSE-ConnectionGUID: AhhbaPQ1SzawKpQxuyURaw==
X-CSE-MsgGUID: /1UOHhf4Qv6OxbqjJMmEwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="75946859"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="75946859"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:29:36 -0700
X-CSE-ConnectionGUID: UwJu9DTKTEG9fMPmfUWosw==
X-CSE-MsgGUID: XxNi21wlSmOs6rVOEnjYAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="169186993"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 14:29:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 14:29:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 14:29:35 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.53)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 14:29:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2bEcrZwWyXUuEQq8WNH88dpXGfCu98jNjzQT6wYrxVkibg8oWMWQt+TPExphBQLJu61ElSsmnOHyXrIZq3Bs1zxzLatRs5PnrwHSU/T+7qU478OgbbRKvsrgMnDsdQRwBJbI8lZ5Oj8pJn3rAVE2jYViuzPtBYDzjsux+dUGGzVU7IHWmxoIC8GPx4ZuvkpMKgVsWSnUkK6z6XyOO9I2Xfr0R7oa2Z2+FnS0F9nUJ+1siVEt9fyb/pk2xp78KE8LmQW51HXa2/50aw6Gzhd+aLrnpdHQWTwNJFue8rdG58Xj3hauZjgmtsldbnPslxePC9SSHmm64Zbj46RptmN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojX57oEVmiNDl4U4EKMMKEyc4ULUiutigkK6f7dWX+8=;
 b=plEMSLjdFggTl87ycaX+T1otguFzqMhBbR6ujpbNxlgkVxL4pTzxf538XycESFfvAvaXdE15HHiZMWqdmo2xxls/kS8NTGsSswNALRjKLrTpPQpz0JTHx2obh65Q7Wj6HwC2nuYwtgFluGL2PriVR2zp1dhNh9qkhNtkw5XJCLc7iaLrhTd1VjlKYdrB9pVwrs/0xBxDZNbDoAGy0N4OruWai5/47zYnTGulML7u9XAB3U8EHBkZK8itK6V1i0TjLq2QMq4nqeJCoe/BVncsfnvIqFcjTb/69GfmEB6OpWuwWp+OaQpVgi5pkTnCEGF+IM6Y5m9e60uuQztGNucOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Tue, 26 Aug
 2025 21:29:32 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 21:29:31 +0000
Date: Tue, 26 Aug 2025 14:29:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v2 10/16] drm/xe/display: Convert __xe_pin_fb_vma()
Message-ID: <aK4nOBP3cu1SE9s9@lstrano-desk.jf.intel.com>
References: <20250822094030.3499-1-thomas.hellstrom@linux.intel.com>
 <20250822094030.3499-11-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822094030.3499-11-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 08624267-6288-41e7-90d4-08dde4e7a522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ysBQmabltD/wPW7ZthMvys1SkUo2mw81mEslHJ3dKu3rhM8LkUOvVoxNkJ?=
 =?iso-8859-1?Q?cdJpkLL/D9/FOPSn2B2xQv1RBfphiZEEtRDD+E/8JR3Ivgb4lgKkjqyyB6?=
 =?iso-8859-1?Q?xmKOBMdEhmWTyJM0bm19so0w7kTagu9ET9wCKQko+m6gBHuogjtDCTKXyV?=
 =?iso-8859-1?Q?c7/sAKZnZFmT5mIhdgtoNhA8VrNKreohY+TPZlRXVVR3prUp0QkWWdqOgu?=
 =?iso-8859-1?Q?3b2ytgt88pXsSBr5q/Ly4nWMQ97ON6s+Uw3ZPKKvIXYmyexMum+xQITPlQ?=
 =?iso-8859-1?Q?ke8nU7CunLHGSxWCjKUE4qR6A32r6iUDc0oqwL+sqUU7osAqTLlzTpyUH3?=
 =?iso-8859-1?Q?rUBOVkA30P2VvtUWI570woim3/9Bt23uT/Nf+Mxf328tXvjkDVTDhGfn0E?=
 =?iso-8859-1?Q?9kZD7wDiCmXPYj7VU7qRPjFjjADNeHOZ/3yQqqdirXaEYFjJW02QYxpIZD?=
 =?iso-8859-1?Q?NC9p63nGr3nFc4ZfagwiILa5FUGeMhdoETiPlFhj9FMUT8TQ9V7IBxbA2x?=
 =?iso-8859-1?Q?bt0qwoa6+gb8KVGEyigPRU7na1MlkAJE/JG0Pr6R2G/Ap1EjGntlrjDBvj?=
 =?iso-8859-1?Q?iby2FwvXRiYSpbH8HppnWnUT7F9lNigdJejBYfeWZtk7AT12mT0WmHu5Xa?=
 =?iso-8859-1?Q?MYAgUIyH8AmYfph17R2BC3+AhqYPUw0ek0MnuYIn+we+x7/XEUhaIHsyEF?=
 =?iso-8859-1?Q?CKyWxktd8vYx1gk4IaqbLBzzwlr/kpRwDcUAMclOJwPjaejw6nMccsd0dP?=
 =?iso-8859-1?Q?4iwL/qWRiyJhDNXWhscX4RMyPPzFAOLu0sEhvtCADSQIvTpx64P/7VCLho?=
 =?iso-8859-1?Q?aAWOcT2XF2G6wvJhKt2qJ2lCgUiKMVVl8/VNPU7S5JCNMsPgY8Ebj+m/Zo?=
 =?iso-8859-1?Q?nB26XrniORFG8v0q/vWzJW2FpiilWJIfbXyEgVe5/TEmqvQkJBn4wGPqat?=
 =?iso-8859-1?Q?QERa4VOwwX0v45P58X/DenyfMWflG+yJhsuAOgSvQAnq5vG9PJ5E1YRlLy?=
 =?iso-8859-1?Q?u6UKoRbUwr85inEMfYI3K9FafFDA9UwUNvXm+9/wLtTLT9cnirCeD1Lkh3?=
 =?iso-8859-1?Q?g2AHkyUrKMuBQ+80qmpCe05p1CTG/pTn8L8xIGYTClarndM3unQajpzr4T?=
 =?iso-8859-1?Q?ufVmiA0Uajg61ZsqrqrRzmAE0WyJ1Mq61/hA/lIsmOnO6/7zSoVfV/VeJV?=
 =?iso-8859-1?Q?yk2zS1Vk+i5qDEV6EJnsKKATZcOVSH+vJcaLRy1MWwEwVHN0EJidkmnwIJ?=
 =?iso-8859-1?Q?N+goewfmEHOaLEfEKiepvbyyz3aAmN+XU6Sy9xqqxCjFc/0W4REOwc16EF?=
 =?iso-8859-1?Q?hdqkE3RDzhZ+K8ftTeM+/cMeQ+P+QSqAnGnb8KhrBuuq3dxhw8B441CsET?=
 =?iso-8859-1?Q?+4jEIoQFv1829dkB1M3jNrepobx35pcHxJx5RhN8tk6+Om8y27xj0UvbWy?=
 =?iso-8859-1?Q?gjhekyB3Q81vd96s5RwhcTowD5Jj7vLGuTOC0vXnJgBUBdYOx3rtn4suyw?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OkUHxcVPPFv7hZMGjyAFAHCcKetkIh7hzKbPRRRFxSRtmZrYT/dccIWavi?=
 =?iso-8859-1?Q?hbIC014wBckE29V0y6oFM+e8KcOB9q2hfHpHJOgwQ34Aa7YN5T3yMsRKqm?=
 =?iso-8859-1?Q?3rXWOLtQUltWw/Wm/Y3/UyE1DfNjHtehRhj0MCbY7/K/lPxCLOk7fqPl+3?=
 =?iso-8859-1?Q?Dq0SFj8s6+V1U4eGMI3+oDVo/a6DeezWJdYhUyGFs7o+iVFWOnQVjZIC1J?=
 =?iso-8859-1?Q?eyDo9KLPrBTFtHKz8Y3ttxExt+CLCGZNSNqGp8dZTJ7hltOBq9h9TaPEeX?=
 =?iso-8859-1?Q?zpFK3AWVtlrOUSLRGf/64Ri1PcTjcHBjdNXmRb+kk7o5zNaGvNPCVluQ+I?=
 =?iso-8859-1?Q?liKpegOtqYllWAgHA8CCNfP3HkTydwWPLi8ASj1d2MFMeG7gEQIGqVoVv7?=
 =?iso-8859-1?Q?2gm7Kot9Vn96THkSVhD/v15Fr/o15Qbyz80rm+NEOrX1YuBcrcYci3/uuu?=
 =?iso-8859-1?Q?soUSSRGDEzyLtC01z5jj52bKu1ZepuxnSh0ELLRonBo4Lv0Di+J5Y7Eg8B?=
 =?iso-8859-1?Q?AsSWj9/MrZz8CKuUz8C3Tqui0TjtrY469smLxrQA6q8MH+/MMcKHlGIXix?=
 =?iso-8859-1?Q?7+/9G5Hxmj+VJ03Iix7e/AmYGxTy0Qorqyy3t5z1sezpyJDBwwGX0W/FYp?=
 =?iso-8859-1?Q?eKtjRZUrTzmDcZAKHlt8Q3E/QAwx+gGdyVXkNLi43TIsk0KUNFUaHakJ5k?=
 =?iso-8859-1?Q?MFUVsufhdJ9EhY9iRZIrjRKWd5+kItmseq6Q3AWlJcZLKdpOR1l3qbVAm7?=
 =?iso-8859-1?Q?jXCFSmFDwhuJnd6r7Za6uSsSYZwCUFrKLuNLL5Z4OSmpRCMQyym6Ji3zRL?=
 =?iso-8859-1?Q?MMtRx8DycVXBaNpRMECNrlrCpB/PdTS80Yxerldwa1kKQnWVQBa+p9L/Z/?=
 =?iso-8859-1?Q?EaX5lClbUztdM3ybFHaQH95YP7sbHd9XFcH6eEEEYnjq6MZCRhIP7l6r9l?=
 =?iso-8859-1?Q?B/7BJJKpXM0i2Y26LeHgPp7aDARI2mLDzAMvQcQJv1apc8APKzzvaamnYR?=
 =?iso-8859-1?Q?zlvzGxlRf89BLScx7RZ6kEUwt75Prk0z+rB8dSZ2PCWK6/2hI5W/lbo94e?=
 =?iso-8859-1?Q?bmbd7Y2hHdXnRSuowRZPAcIlTjrY3kQNVjv8Uu97ZjYKcAWTfpFZxteors?=
 =?iso-8859-1?Q?UN9KSTh0N7OYlbrPSXvDb9OF8XYwUEu5isSSkt7e3lJ5MV+AYZqJQrGzgn?=
 =?iso-8859-1?Q?+cB4adiaU0pRFXoVJunA+M3TWwukLVgYcf7HUUGTgh1yTn4yFabO8eTGf+?=
 =?iso-8859-1?Q?W7pk5oA5R+P9aAjmE2yfoLRWsr9EScU9TNjRfxHenIlrY9DzYAaTcjCCmX?=
 =?iso-8859-1?Q?wI3Wc19COgswajPm2Mk5wYS7SHcQWrROSHY/1FLI04jC9PMczG/XNHSSZw?=
 =?iso-8859-1?Q?16DKvrcQRYWfJgHp87BTCD61N8k2RmvLOv1ncMKM+4sOmFaktF5edJH53Q?=
 =?iso-8859-1?Q?+vzArdAwb9nC40HWe8Y5zgNZXxBvrLPhMx00Q7tMoabmynEWB0jOtcAQ8L?=
 =?iso-8859-1?Q?yMXgxJHirIA+HjuqNzHcfQhc8nn8qowP7wkwkPSnzQltMNuVNv9P3V9d9A?=
 =?iso-8859-1?Q?44r9obCOqJb+j5DUXNt+tvWPTq/7S32GVO8wWBZSDiWDOC7Hnk2e/Xs/uK?=
 =?iso-8859-1?Q?g2z4kRtu4XjwLlH2t7lFVu8Cke1XlFpp8Prfkv8h2q+ZzoesiE3yds/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08624267-6288-41e7-90d4-08dde4e7a522
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:29:31.8314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cHA9Nu2ZKXRz1JuXC7T2JBOjTirfCmMKqrbWjuXiO1kJ/87hHbifpq1Wd0jt95NZrpmHQ5hM+PNlndS4X/h/Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
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

On Fri, Aug 22, 2025 at 11:40:24AM +0200, Thomas Hellström wrote:
> Convert __xe_pin_fb_vma() for exhaustive eviction
> using xe_validation_guard().
> 
> v2:
> - Avoid gotos from within xe_validation_guard(). (Matt Brost)
> - Adapt to signature change of xe_validation_guard(). (Matt Brost)
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 29 +++++++++++++++-----------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 4b0748e6fdd6..fe0000b211d9 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -281,7 +281,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>  	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>  	int ret;
>  
>  	if (!vma)
> @@ -309,17 +310,21 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
>  	 * assumptions are incorrect for framebuffers
>  	 */
> -	ret = ttm_bo_reserve(&bo->ttm, false, false, NULL);
> -	if (ret)
> -		goto err;
> -
> -	if (IS_DGFX(xe))
> -		ret = xe_bo_migrate(bo, XE_PL_VRAM0, exec);
> -	else
> -		ret = xe_bo_validate(bo, NULL, true, exec);
> -	if (!ret)
> -		ttm_bo_pin(&bo->ttm);
> -	ttm_bo_unreserve(&bo->ttm);
> +	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, ret) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		if (ret)
> +			break;
> +
> +		if (IS_DGFX(xe))
> +			ret = xe_bo_migrate(bo, XE_PL_VRAM0, &exec);
> +		else
> +			ret = xe_bo_validate(bo, NULL, true, &exec);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &ret);
> +		if (!ret)
> +			ttm_bo_pin(&bo->ttm);
> +	}
>  	if (ret)
>  		goto err;
>  
> -- 
> 2.50.1
> 
