Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BECD262A2
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 21:06:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7C910E259;
	Tue, 20 Jan 2026 21:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fv7ITU2q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9709810E259
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768943178; x=1800479178;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Z/xIfqqndUllz3BItYDr7y9lKGv97T29C6gR4gJaaDM=;
 b=Fv7ITU2qLAhXDvl07GIiWpOWAskqgg1ezz7ncYhhjPOOk5+Mz3q3/+Kd
 RKkeokqkkj/2XDDgqxxLiRt9SJ3QRBYvtfL1cK8LjafgAIDa5ddvBdFFN
 C3uD3nhQAO1c+PhKb4dKEYEdKPIhBe+NA/COi6KJxkVAAj8GSWISiW7GH
 lZ74TUpiMXlGm2YifCHQ0BaNMGm0R1u4sk3MPT21x6ABQSu2b3eyxKipx
 iP9Gkv+JjbtC40sHXrP0qG1ZS39f+8Paldrs/BycSvsy1+RcGQQSSj3hH
 nYRAOdeEEFFNfkyGyn5p3OylK6LG7sQ5wSMGNAFJ4E8Gfc0Jk/Iqu98zV Q==;
X-CSE-ConnectionGUID: 291+cgY5S8So89SA9oLYYg==
X-CSE-MsgGUID: +L2KtFhqQVudDRbDPcf6WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="92831165"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="92831165"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:06:17 -0800
X-CSE-ConnectionGUID: kEFpK57qSauu62goEhZkSQ==
X-CSE-MsgGUID: ApFdn0LLSgOY71mMU5vwvQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:06:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:06:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:06:16 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:06:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KN4TqNOcE+p6H2DfzVW/6+uf+3tN0qLsuha+va+jD7GAlDHpgPH/Fk1dKe5QX2u4jnEbzMF8072vdK4FTE5WQF1Lqm9YOq239u3YVfdHHgvpbeevVv1JiDiK/YbHU3D7MU94/rpI3q9Lyii0HgEZr+Lb875U5AWnQYoiPwN9TvU+Vety887/TiJuDzvFRxKR3sqjsIzfe7Xtg0BCL2GGU5foC9xuxclBkqF0RfWSMtiVShgkSKZCWkWyYWQXdUnCXOow9qBxzS3xJHO8v5rLwDS/vnWjr6bgQW85XaWwZexLeucLZPWb6IC189/YHVk7O7QSxI2VCFaknzYyN56k9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCM+eWWPJ58I0+n6/HNvoc09sxtWgl8Acr5AYYtgKSQ=;
 b=T7yu9s4xyLJMDupUqWXvUKdWR4Z24+YtadKQt8jedcFYBqktIfiAy7ygg0H+AIaehNguhQ+uxjqYSiDZHUWMS8T4A21DA/vkceUj/MF1riiweKrAxBQJ4I4qHpEK4RFbZSDpbTGhtTYuh6obL1q8p2cskUBZ5WpsAEFcedqXRiGeVwSWuBwokexfOg9FPLElpQgiLHDDjwwSTqzFLnv1+xKMQjRMyED+1zU/Et9Xp2MFD23MhPCclSEEyrD+qimv4siSDZh7vSwdVFbXI1F3GkR2ZMgzoxX8aTZzCHa2RUbeAWOd5EddVujHi9rRTPIEav2ALKMesLDz1PwLQ826jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Tue, 20 Jan
 2026 21:06:11 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 21:06:10 +0000
Date: Tue, 20 Jan 2026 13:06:07 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 06/17] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Message-ID: <aW_uP9eTH76NHPKZ@nvishwa1-desk>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-25-niranjana.vishwanathapura@intel.com>
 <dc27df4f5351345d6925db872390f3b290909fb5.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc27df4f5351345d6925db872390f3b290909fb5.camel@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::32) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DS0PR11MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da6169e-a774-4237-29a4-08de5867bcb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ASTPZw+yXq7Bia2X7QyCJyyyws53goalABNvJG+QVcHwaxbBw7Kc63fs0C?=
 =?iso-8859-1?Q?0y0zsdC0n9EF2st8UeSQbL6/9ObHB74tFU85j+jRcrOfUMwssPeOl1zAkk?=
 =?iso-8859-1?Q?XmXoemAqmAyFMoHdSEEYu1UEPgf/Hg9z2d8h3tffPLDeqi+3w7PO4oCGBw?=
 =?iso-8859-1?Q?KKX2Uh58odkkUrqPi8fotpKQLHY9/jDL6jnBmtGhVGnxXd1nauPy3Dd5cR?=
 =?iso-8859-1?Q?DjugW/HPixzO9AWgWrhSL+ByUXPVABmNVyAyXOm8tMPTrjKvpJRYgl8TqC?=
 =?iso-8859-1?Q?cZ0k5DBfT5nGskbUuf4Ce+3iK2cQ/fNfuBNn4FE6Uo2tP7437lyFWJnCkP?=
 =?iso-8859-1?Q?axU70hyqDNmL/5MnkZpetivL8I6M0/upCo1lPDx7qiy2bpwCHmIBXos9Lf?=
 =?iso-8859-1?Q?y2K3jS/fiv8UHj9upSE0PnM0fEiJBhpL9lqe+FxZ32J6+pjTiPHuJacVWU?=
 =?iso-8859-1?Q?o5m+w2LQNPVfGZqu00HyCd15ajlAN5jhcZgSOFtkqR5pFEC647mIU57wLT?=
 =?iso-8859-1?Q?Waor2IX6wochL1HohlW13YB4SA2ARlqefWNRDFS9shVuUditqdH/Yioe9z?=
 =?iso-8859-1?Q?44+uo5eiDUUyQ7dueogC50D0msPzgIi6MmWwJXrzrWbbCez1YAYY6PiQk6?=
 =?iso-8859-1?Q?x5aMCNCnl/2ElfH4373oWbjjOfvJn9Os5Hn/mHvK3nF4rFKNsZgoHGLfcU?=
 =?iso-8859-1?Q?Zk4j41Nok4QWY5QbzDoC4U2RbJrX5jT0gznEAEVScH0SVSxR7Hwp0/9WUx?=
 =?iso-8859-1?Q?yt7idO84MZyBzJwdaMYEJJzVXIoKs9RkDXdNU1MvHj3Xtf8GzteGD/l94t?=
 =?iso-8859-1?Q?0KX6FJT/Dppnqsivb3/zpgCRnIKo2zn+8i7evyEzKfO2dW67hAspqdm/9F?=
 =?iso-8859-1?Q?4zftNCKSsFf4KJOAnl12s3TeLZDho4vjNVBBOKrzGxPo/cVn+N1kYdsUNK?=
 =?iso-8859-1?Q?7gS/ns2PcWzEhhUASIvFfnbh+uLqNVK+6mfnENJLkdZxA8IwhToSWGcS9O?=
 =?iso-8859-1?Q?68T0tpuDPVhtZbr3Hkeflfnsf3Bw+WrPpxj19c+XMoP+0WghNpO5jk9k7y?=
 =?iso-8859-1?Q?iJoXZVg8y/M+FwrPWEUhkmbqcg2Qc0aq0fKdCSfEE0T6D6ih7KtYvC8Tps?=
 =?iso-8859-1?Q?EBWLJIT/CprH84Ts2MnV3aR6hTdnlz5QZKtjJbDHVQ20xyU128rcDmBlRl?=
 =?iso-8859-1?Q?y/9eKMGO6a5xFYQuKwFQz4So81mMN6MwBOLg+fmotQkRtSAPkUkqbuTk20?=
 =?iso-8859-1?Q?B5jQt5xa2FCDA+Vi2rlXL+7SqRc2xGGTj1WUcuOjeqyGMzd94BPhjIpq39?=
 =?iso-8859-1?Q?V9RAnxR4jKh4BPYDIjAj1etWtYrJcD3+giq3O86+WV5JKPgA8SLHNlwuOc?=
 =?iso-8859-1?Q?1yJz8ckhIwOvpGAkvl+yg5SGH+OT4BsLNpZlNN5u5oNFqAepdxJlE4v86N?=
 =?iso-8859-1?Q?7t+FiCBbjRbOCa6azBrdMewA9no+ukulZvRHydNuvQ9V7M4zuCMGM0Jgh8?=
 =?iso-8859-1?Q?EJUppk7zewNMwKpjqDLW+NhG4zOxI5VGk5XSmOJxaiumlMtSFRXcWrsuRq?=
 =?iso-8859-1?Q?yIDkHmTtTBGA+VfhhK0D9l47ukLs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5ZH7mswtSIx75Ze9byVVZ4UOYPvg0Wyhud7xIzx/3blPLnhqI9WMHosQuc?=
 =?iso-8859-1?Q?iCL2Hv14VgyV36YAViIcBEV8qU4L/QntlBkP5m9KLO9VgXkWj7bZP8gjba?=
 =?iso-8859-1?Q?+/nlcas1m9fAXd63x+iqK79vR2om+M+sMb5/AGxT2Ggw1O8TY3RQZYITqm?=
 =?iso-8859-1?Q?umZkBOf5rk+tV0O15/pXIZhOKfj6F82Tb3vI5iUJoqkHGgNoMueW3GjUXd?=
 =?iso-8859-1?Q?wOGAj+Q9eBHXFlP/9bXiKAQEgjZv9UBS5ghm3kTh0ZFRsxyNj7vgqAMRZO?=
 =?iso-8859-1?Q?yA0zPc18X/qjri9wT3pTSCxMf9FppV8P00n64kSAWj5esjBjO/yVJly7tG?=
 =?iso-8859-1?Q?C3NcZQCv8VO+IWDlqKWsxIGATpR7eAQ/vJo76USqE3owFpKgVagmkPQxJr?=
 =?iso-8859-1?Q?eviKHVpLq0SxZH9brilp31gJsprOUDwYp3wQ6k6nzVgQ4rjYBtIivlgIhp?=
 =?iso-8859-1?Q?sNQZaZafNLOKx199scI2goeN4++5h8lZJ/EzTv8NBHbRvCPRBKU6XVEqoT?=
 =?iso-8859-1?Q?5hFYqMLb5SvYa7WpZiK19Pj0t3Q88r1gwbC4lMd4NaS9JyIKEE1rVuPCHR?=
 =?iso-8859-1?Q?nLnKn1mrLZxJxMtwDEaEQBjpbd1H7A1vfEsMqV2n6BdWlTWGqQA5gx3fHo?=
 =?iso-8859-1?Q?j3Yzvm/qZoXHJzoVaTTL0F46pBBx7h5btLOUYYBix0SV2g1yPE4hW0q48y?=
 =?iso-8859-1?Q?dg3XTiTOpzp+/CEG56MBcvK8Bf0Co7rDsOsBjeqXzO+XooCOUHCm/0qBcE?=
 =?iso-8859-1?Q?EHO2tCuJQNt1HnUDKsYBXuuXziGM6U1LSUddzUCAka/j/z7twu+5iGlO8H?=
 =?iso-8859-1?Q?CUgvAn6UCbnk1E+D0/ISLUCPAN/c5PVG3az/WNAmYqWEmjkgpmj2Uvaaxv?=
 =?iso-8859-1?Q?UZhHcouPeQzBOjrHnWi2l3TDNf1AIRAZ9yV/EzTV+i185vyCCo9HCYTmeR?=
 =?iso-8859-1?Q?UIrArTtHwWS5nEOPuTuln9jPyr/o2gEZGLBV2obqxN/jVt/i1V1p1N5MP4?=
 =?iso-8859-1?Q?ljBwEn8/AuFCWa2MDDbl7W3xAu8zWqQAiX6OleMNXFDE/ovsppeR/kRkx5?=
 =?iso-8859-1?Q?SUe5f7dIn7moFuxtnPWaK++uWX9Nv9rpIbXQt9XNF4WfC1pKTE8mSzecgL?=
 =?iso-8859-1?Q?e3/8z93MD28e/VXhSjhmw1LlGA3JWo6Vpxo4Wie9UwZPFdO1nq7OhmECnb?=
 =?iso-8859-1?Q?t93cYMVUNEOjfgCUAOf9tKrNOAyRdR4bN80L0PmG9slKHbM3jpBzm1hb8x?=
 =?iso-8859-1?Q?6Hub+AiN/8HcYR5OAPq8hCCdGQ97sxQPDMXbIIE5H+0LDbzFbnN1CJf/pS?=
 =?iso-8859-1?Q?FeGSDiNWwRcl0U4U74ry1PeezagLYQBQ2MpKugaBkgwGbFAxSivF5gsjX8?=
 =?iso-8859-1?Q?O9s88JU8mJ3+77cEOjbZ5jThZJANiwE8RDuHtEnfeJ+6GEm8MaTDbSJSgr?=
 =?iso-8859-1?Q?K5cLF6tt6R0wyBiEMp1O/fPRwHIOfwrVa9l7uVM50Tlf7uLRGtIwS7Xq6L?=
 =?iso-8859-1?Q?Hjv35tYs2y3ADZekH/9a089VzIysPhW8MjvLwxkevh2sPuAkRhFizWxl/5?=
 =?iso-8859-1?Q?xFTcDNrQzR2D/mGXJe3eXYNWplRik5eVF3njovLY3JS3Kg+2t4VZOAjV7A?=
 =?iso-8859-1?Q?QXEklpEXcOoJXGFGT/Z8qg+Skc9g7hIC93jx3iqmmLBkVC08QEA+PkqKd6?=
 =?iso-8859-1?Q?4Cf6e62Dr+JG5833T9j2pw16RxmnuqKyI3inVVUywgyVb9VkCocrCRCI/1?=
 =?iso-8859-1?Q?tPbugIlozwpOKIztsPAM8iv9zeWKQs1duQ0zhuUO4WaMN3qFZHMRy3GRLf?=
 =?iso-8859-1?Q?6kF1jW8P2LXPTkhD1Kk7nlsCEF9FPRSBWh/1IPyJZ6jBOhvMAA0j?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da6169e-a774-4237-29a4-08de5867bcb0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:06:10.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DryKCWVmvj+h/FBTuFBCIV5FLsAhxeWcwtQ9hko1nloIjFGty2olv9nYV8nTsd0dH8oBCdtjI1IxnAk1ptcG6GuUXmlG6gejWGLFs4WsZ94KIaCnbuBaygujLSqGzSTq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
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

On Mon, Jan 19, 2026 at 05:57:29PM +0100, Thomas Hellström wrote:
>Hi,
>
>On Wed, 2025-12-10 at 17:02 -0800, Niranjana Vishwanathapura wrote:
>> This patch adds support for exec_queue set_property ioctl.
>> It is derived from the original work which is part of
>> https://patchwork.freedesktop.org/series/112188/
>>
>> Currently only DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
>> property can be dynamically set.
>>
>> v2: Check for and update kernel-doc which property this ioctl
>>     supports (Matt Brost)
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>Two questions on this patch:
>
>1) I don't see any locking to protect the exec-queue / lrc state.
>Perhaps I missed it, but couldn't this blow up if someone runs two
>set_property ioctls in parallel on the same exec-queue? Looks like at
>least the set_priority is doing non-atomic RMW assignments?
>

Hmm...I think only checking and setting of 'q->multi_queue.priority'
in guc_exec_queue_set_multi_queue_priority() is a potential issue
(as the rest is handled by message handling queue and guc ct backend).
I think we can fix it with a simple spicklock in this function.

>2) Do we really need this to be mutable? In i915 assuming that lrc /
>context configuration could change created horrendous locking
>constructs that were later fixed by making it immutable at first
>command sumbission. I don't exactly remember the details but do we need
>to change properties after first submission? If not I suggest blocking
>that.

Yah, ability to dynamically change multi-queue priority is a requirement
from the Compute UMD team.

Niranjana

>
>Thanks,
>Thomas
>
>
>
>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c     |  2 ++
>>  drivers/gpu/drm/xe/xe_exec_queue.c | 35
>> ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>>  include/uapi/drm/xe_drm.h          | 26 ++++++++++++++++++++++
>>  4 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 1197f914ef77..7a498c8db7b1 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc xe_ioctls[] =
>> {
>>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
>> DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS,
>> xe_vm_query_vmas_attrs_ioctl,
>>  			  DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY,
>> xe_exec_queue_set_property_ioctl,
>> +			  DRM_RENDER_ALLOW),
>>  };
>>  
>>  static long xe_drm_ioctl(struct file *file, unsigned int cmd,
>> unsigned long arg)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
>> b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index d0082eb45a4a..d738a9fea1e1 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -790,6 +790,41 @@ static const xe_exec_queue_set_property_fn
>> exec_queue_set_property_funcs[] = {
>>  							exec_queue_s
>> et_multi_queue_priority,
>>  };
>>  
>> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void
>> *data,
>> +				     struct drm_file *file)
>> +{
>> +	struct xe_device *xe = to_xe_device(dev);
>> +	struct xe_file *xef = to_xe_file(file);
>> +	struct drm_xe_exec_queue_set_property *args = data;
>> +	struct xe_exec_queue *q;
>> +	int ret;
>> +	u32 idx;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args-
>> >reserved[1]))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->property !=
>> +			
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>> +		return -EINVAL;
>> +
>> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>> +	if (XE_IOCTL_DBG(xe, !q))
>> +		return -ENOENT;
>> +
>> +	idx = array_index_nospec(args->property,
>> +				
>> ARRAY_SIZE(exec_queue_set_property_funcs));
>> +	ret = exec_queue_set_property_funcs[idx](xe, q, args-
>> >value);
>> +	if (XE_IOCTL_DBG(xe, ret))
>> +		goto err_post_lookup;
>> +
>> +	xe_exec_queue_put(q);
>> +	return 0;
>> +
>> + err_post_lookup:
>> +	xe_exec_queue_put(q);
>> +	return ret;
>> +}
>> +
>>  static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64
>> properties)
>>  {
>>  	u64 secondary_queue_valid_props =
>> BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
>> b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index e6daa40003f2..ffcc1feb879e 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -125,6 +125,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device
>> *dev, void *data,
>>  				struct drm_file *file);
>>  int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void
>> *data,
>>  				     struct drm_file *file);
>> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void
>> *data,
>> +				     struct drm_file *file);
>>  enum xe_exec_queue_priority
>> xe_exec_queue_device_get_max_priority(struct xe_device *xe);
>>  
>>  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct
>> xe_vm *vm);
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index fd79d78de2e9..705081bf0d81 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -106,6 +106,7 @@ extern "C" {
>>  #define DRM_XE_OBSERVATION		0x0b
>>  #define DRM_XE_MADVISE			0x0c
>>  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
>> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
>>  
>>  /* Must be kept compact -- no holes */
>>  
>> @@ -123,6 +124,7 @@ extern "C" {
>>  #define
>> DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION,structdrm_xe_observation_param)
>>  #define
>> DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, structdrm_xe_madvise)
>>  #define
>> DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS,structdrm_xe_vm_query_mem_range_attr)
>> +#define
>> DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY,structdrm_xe_exec_queue_set_property)
>>  
>>  /**
>>   * DOC: Xe IOCTL Extensions
>> @@ -2315,6 +2317,30 @@ struct drm_xe_vm_query_mem_range_attr {
>>  
>>  };
>>  
>> +/**
>> + * struct drm_xe_exec_queue_set_property - exec queue set property
>> + *
>> + * Sets execution queue properties dynamically.
>> + * Currently only
>> %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
>> + * property can be dynamically set.
>> + */
>> +struct drm_xe_exec_queue_set_property {
>> +	/** @extensions: Pointer to the first extension struct, if
>> any */
>> +	__u64 extensions;
>> +
>> +	/** @exec_queue_id: Exec queue ID */
>> +	__u32 exec_queue_id;
>> +
>> +	/** @property: property to set */
>> +	__u32 property;
>> +
>> +	/** @value: property value */
>> +	__u64 value;
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>
