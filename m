Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D00C77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 15:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9C510E32B;
	Wed,  2 Jul 2025 15:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wqb4azMh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CA410E0F0
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751469391; x=1783005391;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mkVLWNs2DF0vVWJ07cqLqisicR/l9k+BMJVyjY2bQWU=;
 b=Wqb4azMhivVG8iaLOYHvaAzgBx5RhJX3lgPKqKnUCsCsrkH0JeIiIadv
 GAaRXId1cOHFgMiRW7Rp5bwPvcvpv34tujFWfMP8Q59c36yEWgRQLcRkA
 trDJqzpNDIpw8PyD4lxkHnqRn747KX2+aL3XFsPgHzzbGJi0es7/dz+DP
 YDepe/PWG9jjW0w/kM7kTJNbYVDAnUkSip0BJvSNr7h9Tp4FcZUKWHCCi
 nbAINN9gZRtXjWOTFq+XozPHYdDikPM9OfnWAFBNrouDLybvUddZOq9aZ
 RILQGIOfvpQzsTVIwMXzOol6atcPOskt+mx04yhijQAuRm/lPzXArD9i1 g==;
X-CSE-ConnectionGUID: Qe4ypAMMQeqaLwnbB6BqDw==
X-CSE-MsgGUID: Vyg0IS/XQ2yIcCLSQR2sHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57582944"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="57582944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 08:16:29 -0700
X-CSE-ConnectionGUID: nBtgxBAtQ52viy3sfmKDsg==
X-CSE-MsgGUID: vwq4lT5QTM2yHa+eCbPo3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="177783035"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 08:16:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 08:16:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 08:16:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 08:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtljPa2xFKoLp6BbyiyE2KTI7h8WYjOrgaEwlMzNDAhmYzFHsKsyeRxGDnt7AN9uuN2pmY+2LnFdVplp9C0QSIdVp+1GYGuu5ys7qGoQEPD8xvkEzkKrDicA3y7ta3PXtlToM/EBb4l3ODQAj7GhgYbUcaBohD7QRp6SNCUS2EF0DKdkNjYtFp/0GDH+qchh2vNC3eTHAY2EbGuA4e0nDxceRWyiSFkZ7jpmvGEtORRam3fgictGKWt6QDbLVeur6fN3UOe+PTlOqEh5xDmzfxSmi/96kZaV38kS/Af0By+AazGuSZrGqgQw5+WXak+v1n0IlDfxRnMsDTZIC7N/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CY83Fd8I1/jnsF1hBJfezPb+6il06ER3lxarY2099W4=;
 b=sdnTR+cMw5uS0kucBDLSOLFXq2YdsGDItuM3YYwJDENGi10ypGkRCEQoxI2AEzi2TbMefrPMVt7B7XeDZv4qw2gsaaT2z/Ul1/dNGIG1FQ+ZAGvRYiIq6in7SRTbSabF3UvZE4rXhJcSsSJdxsY+s/JZOJso/2MVh4M1gWp8o7KFBxbuMNfeaTrwELj9EUw4cjnL6wRI/vIpf8xM07xM61S0UlC7AzoF9UZXwlo9OSUb6xZfHTxjhl1m3ctk0TeP62BpcL7bRcI+lmxhOhofJSm49/ZcHOWwSzP52xYf47fadDFTDYKj71/hItssIocQyEpbMAsKaAjfz63uI+CtHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PPF90FB92BE6.namprd11.prod.outlook.com (2603:10b6:f:fc00::f38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 2 Jul
 2025 15:16:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 2 Jul 2025
 15:16:13 +0000
Date: Wed, 2 Jul 2025 10:16:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH v7 2/8] drm/xe: Generalize wa bb emission code
Message-ID: <h6o7yuyqrppcpegpxl5gw3v46zcrvvqmiw726p2gtthzhrvfby@2vx5zcldbmm2>
References: <20250630122244.7949-1-tvrtko.ursulin@igalia.com>
 <20250630122244.7949-3-tvrtko.ursulin@igalia.com>
 <y774muxwsly4v76txbtqrixk5zxse7dj3b77qi3ge2vypmrgv6@ljviakys45th>
 <1b87eb6e-6a37-4a61-9e0b-158ca27c3969@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b87eb6e-6a37-4a61-9e0b-158ca27c3969@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PPF90FB92BE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c3de76-0fe2-46f3-52bf-08ddb97b61fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XbB/SL1KQFewPMQ6HiICe+0eNTJpB/YJFAN5KAhsFzs9+sncRlbtcVi47s?=
 =?iso-8859-1?Q?VqTcJagJ/m74AX2oAEpL5I0k3Xpg9eEiQyD2a0C+KwNlYed8auduxpxpht?=
 =?iso-8859-1?Q?Zxczt2dAhGtw1yhjzPoKNtCjWEaeCr29w4ap1SAERAeCh8Z5Aj3PGdSpgL?=
 =?iso-8859-1?Q?ZlZVRFwHHjuSC5IivZm+qjEX45QENjNUMUUMLoyaEErMLLHiY3DN2YckeA?=
 =?iso-8859-1?Q?AB+oB0tMxdmGKLheGPIs4YN22oRBi4kgKaATd9/C7tsP0Ljp009vce2ECJ?=
 =?iso-8859-1?Q?+yJ5JeJeF93gXXdKA1ryUDlTU3IHLm/j6uuJyaiwA5AhNbBiZWTPxpL8ET?=
 =?iso-8859-1?Q?t4ogOuhMH8psiLKDOGYQ8AV+7KlQxzD9jf0c1zStF8DlSW4EjidwQ2In/w?=
 =?iso-8859-1?Q?EQXpwfszu1VCmewMDKXfIto40Tj2IP1JqFt26t96HnDDJ/JeAbSZnoOINz?=
 =?iso-8859-1?Q?MAFSg82cHej+uAkYuNkk3rPUqzRd0Vrk6A1H0kF4S0P1cg0Pk2v2U0FIht?=
 =?iso-8859-1?Q?FzXlL1Uu70vtBqv4R1z0H/SkWI6gjX/t9xqJF3VOz06t1L9XCXkh6OMI2c?=
 =?iso-8859-1?Q?YkFexQQm7V5ML+1XSis7mzTl611kvimpyOAKDryQBoGH/sG6DlxGWjyg6h?=
 =?iso-8859-1?Q?tZvj3/jnAGdv06XFVlLvn8eSGq8Y5plUS8I72Mvbi01yeCkkKAOj4VC4Go?=
 =?iso-8859-1?Q?GFonR+PCfi59lF0YOkj46b1ClMOn32yrgCMeaZp1ct/5NLq30j5W7JTuTG?=
 =?iso-8859-1?Q?9b4ELTtrrZCjujZ+x7VfvURPXdS/hu1EDiJHceEsBHryJs3S8gGkNrw+vw?=
 =?iso-8859-1?Q?BmAiwmDvNLAxtKqXahD5zfah+behHt1hzj2IhwVlXVqT2yULmnxybJJbFV?=
 =?iso-8859-1?Q?WYmRxD70+F367VyxOpLCKV2FArnyrbJtx32O8C+bslecHoNGJRbAgxN7gF?=
 =?iso-8859-1?Q?ZCOTZtQwXArX11WbUtoGumowm0kgBbx6GrxSjhr1spMx7UklL0eN7YnC6O?=
 =?iso-8859-1?Q?CS3NxXZ6bV6KOfz+S/LerlPYHKhtEMPlUJggGIfwDRPUJjNmyAmcFSrgCq?=
 =?iso-8859-1?Q?vtSAA6HqvMVd9rI+4kwCzB7ESwNCfPEY+CGTDnbTQuszL8McLystHN3hvt?=
 =?iso-8859-1?Q?dw0PSJOhH9SK0akDRNjURiJfR7jnSCJnLNsYQu2D7QpJqUF/Etw7hqpM+c?=
 =?iso-8859-1?Q?X+/B9ouOtTVLhIkGXtojhD2N5g8Tt+Qom+iFY05uJ0IX3+4WhGYLtMMdys?=
 =?iso-8859-1?Q?zUScPqryYhaDWq9ai92XEHiqlKYkwMYz9bJxUV73xHXsB/61KfUs9WrNKW?=
 =?iso-8859-1?Q?014DGKnSWr6WPW5Yz9yQBsr6hcs3JYXDOn1Qgp1gmwJFHnSRyY5xWWzWq2?=
 =?iso-8859-1?Q?Qf5EeCUiyxUU2dUICwq/3MfrP2iKCUcDv7qRnkfhsTLwQr3VULUS6JRSG2?=
 =?iso-8859-1?Q?KQe1W54SkbbZypZ3JeZfIUKGv8ZI05qr79wsoUBmFls2I7EULh8WiVCUlZ?=
 =?iso-8859-1?Q?A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jd0QbpPUuRIv5v4Ky1IIT1E855uPALgvME5LwpmAQjQCSn876SBu4Crik8?=
 =?iso-8859-1?Q?rmLb6s8WkXoyXOWEn95fEHcGRTqkRQW1mj3KAvubUQZIb7eDT6+Ht/aNeV?=
 =?iso-8859-1?Q?W5JiY1+R9hPdYWV9HcrWqn8AHFCvXXJu+X8oTZ7O2jeJNaBQFbEzeGP0aL?=
 =?iso-8859-1?Q?u6WfPIZUrhscHhRLcr+wzPQwyJCt0OXu01SOdQwOUwJMoVvrXYu3B3qs4Z?=
 =?iso-8859-1?Q?DJsjJGK2+4ekSmJKXSgXSUYSUuVB3PKw6RrYvrA7dtBQO+KcOlnODZdb6E?=
 =?iso-8859-1?Q?e1pSrQvtzSEiXp9evUnHgddX1mAz1vhU/gd0P291sfVnrSD7M/IxMzGaAk?=
 =?iso-8859-1?Q?xZiAjo1nTQzo/+E2fJzs9fPgcsHuT4tLAwNmhm/C1G0VELW8uiUbUbtOme?=
 =?iso-8859-1?Q?8XhSe786wyDpL5Tux3kHw4OLKZzjwiP4mRjtRioQ+biQtd6EefE3MI7FiF?=
 =?iso-8859-1?Q?yiypZ25Wr8ImDQ0Awe86ZbvnWJ0AOBxVBK10zYr4wFtvGFYIixN0Queqws?=
 =?iso-8859-1?Q?+imTfWkt9dJkgYCUeSbQ2s7yF+mKyqMutn7klbLqm8iGkdvkHV2diyxWDT?=
 =?iso-8859-1?Q?HEs5N71BPYBg5+1ZyELW3TI+2UP0hzkvLYM8DPCPStSNuQqU3oGdCidOmp?=
 =?iso-8859-1?Q?b006AM6CFelwJZA7Zew7oChQZ3+hQBdzSuvHIXPm4Jk89DAY1WEh1/O5s2?=
 =?iso-8859-1?Q?82nnoyWl2eyE+pSy/g3xJVhhNMlKqkBPQ5UtH7J4o9uGOyaMzrMcHG9hdh?=
 =?iso-8859-1?Q?7eOo3Ov2m/hHnIVao+yQCrxLL4PCzdj2biCHKDTQYVtWvnAcVeL2mTAjXj?=
 =?iso-8859-1?Q?W56NV29EPi5QnEZUHW0PGVd2Na0WEgznGmo/2wwPuPV+g+ViFa9QlBYhdy?=
 =?iso-8859-1?Q?eJtNfDK5J5pe5V2t16EQhKzbAlCzMLcgKKssLbTXfFhyLqEUMQoGc38EX8?=
 =?iso-8859-1?Q?DQwEV3QWiGmSZQ2mpaP/LSxdIm+R5DwfgH/O6T1D3WHNJyyc6JmIi/nL5H?=
 =?iso-8859-1?Q?CZqiD7u71g+MGdXhFCnUJ0fBuNWJiXjMGF4E5ssMgtmsE175O8G1yqZEtP?=
 =?iso-8859-1?Q?90ANnEPnKuGI1/XEAyVQ8XRtpNk/IiiwvcPHM+1FIw4fIZ/fMHQz0g/i77?=
 =?iso-8859-1?Q?RBhmtW3PvrAiIYZvyr2DSSGmCyPgac4hydA+GICEvhwxVx4tdn0YaG9VBC?=
 =?iso-8859-1?Q?dK/WGVFvP7NeKKgvnT31ckecgNLv9hw9KOxp7xMFzRiS+qrWdFx3Wribok?=
 =?iso-8859-1?Q?QThcHi4tKY1aF/Sxr5s4M5cM1v/EztCGMMgRX3sml6EGzPYSnotOgKqmTV?=
 =?iso-8859-1?Q?GbaAk/kUsJ5eYKZCA4RJFz4iJvDh2YzQ0x62FW7OR4lIsWRcmZpMPytm91?=
 =?iso-8859-1?Q?jK4vpYYeMLB78VWsUJHdsypt0+gausArLkzwyy9IUxXKd6yzMYzlypv2T5?=
 =?iso-8859-1?Q?fE4uDZnrTzq/gEdwEQrRJabF79kl04k8tY92IJk2Doez5loikxFuvM7dZx?=
 =?iso-8859-1?Q?kur1TOV47WgIgZG7+HCUgyS1clgP0m5E5tJzv0OsldGFoRMmn9WgPyqTz1?=
 =?iso-8859-1?Q?ExcAAX/9Yl8Cd+0K25wRR2beXgiYH3eNzTcJBm/K3SH3NOno0ZZfhjop9u?=
 =?iso-8859-1?Q?p+mExtctMPe1Bl8G0ygr0ZNH/mS1XRBHd6DAFJ3NlS/3435me3yVLLRg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c3de76-0fe2-46f3-52bf-08ddb97b61fd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:16:13.5879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZyeJhs/TBY1xo3H9Gnn/4wLZSr/HLdnwngwF/Eiqi0H+fYJa9cIcJ8AqZtnh6/mYSb0qyoOMLL6vaII26isEVxdCBpnLYnM19QVqr17XMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF90FB92BE6
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

On Wed, Jul 02, 2025 at 10:49:26AM +0100, Tvrtko Ursulin wrote:
>
>On 02/07/2025 06:13, Lucas De Marchi wrote:
>>On Mon, Jun 30, 2025 at 01:22:38PM +0100, Tvrtko Ursulin wrote:
>>>Generalize the wa bb emission by splitting it into three phases - setup,
>>>emit and finish, and extract setup and finish steps into helpers.
>>>
>>>This will enable using the same infrastructure for emitting the indirect
>>>context workarounds.
>>>
>>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_lrc.c | 77 +++++++++++++++++++++++++------------
>>>1 file changed, 53 insertions(+), 24 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>>index d2ad8fe737eb..c07fe23e5e73 100644
>>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>>@@ -972,32 +972,37 @@ static ssize_t 
>>>wa_bb_setup_utilization(struct xe_lrc *lrc, struct xe_hw_engine *
>>>    return cmd - batch;
>>>}
>>>
>>>-struct wa_bb_setup {
>>>+struct wa_bo_setup {
>>>    ssize_t (*setup)(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>>>             u32 *batch, size_t max_size);
>>>};
>>>
>>>-static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>>+static u32 *
>>>+setup_wa_bo(struct xe_lrc *lrc,
>>>+        struct xe_hw_engine *hwe,
>>>+        const size_t max_size,
>>>+        unsigned int offset,
>>>+        const struct wa_bo_setup *funcs,
>>>+        unsigned int num_funcs,
>>>+        u32 **free)
>>>{
>>>-    const size_t max_size = LRC_WA_BB_SIZE;
>>>-    static const struct wa_bb_setup funcs[] = {
>>>-        { .setup = wa_bb_setup_utilization },
>>>-    };
>>>+    u32 *cmd, *buf = NULL;
>>>    ssize_t remain;
>>>-    u32 *cmd, *buf = NULL;
>>>
>>>    if (lrc->bo->vmap.is_iomem) {
>>>        buf = kmalloc(max_size, GFP_KERNEL);
>>>        if (!buf)
>>>-            return -ENOMEM;
>>>+            return ERR_PTR(-ENOMEM);
>>>        cmd = buf;
>>>+        *free = buf;
>>>    } else {
>>>-        cmd = lrc->bo->vmap.vaddr + __xe_lrc_wa_bb_offset(lrc);
>>>+        cmd = lrc->bo->vmap.vaddr + offset;
>>>+        *free = NULL;
>>>    }
>>>
>>>    remain = max_size / sizeof(*cmd);
>>>
>>>-    for (size_t i = 0; i < ARRAY_SIZE(funcs); i++) {
>>>+    for (size_t i = 0; i < num_funcs; i++) {
>>>        ssize_t len = funcs[i].setup(lrc, hwe, cmd, remain);
>>>
>>>        remain -= len;
>>>@@ -1012,23 +1017,47 @@ static int setup_wa_bb(struct xe_lrc *lrc, 
>>>struct xe_hw_engine *hwe)
>>>        cmd += len;
>>>    }
>>>
>>>-    *cmd++ = MI_BATCH_BUFFER_END;
>>>-
>>>-    if (buf) {
>>>-        xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap,
>>>-                 __xe_lrc_wa_bb_offset(lrc), buf,
>>>-                 (cmd - buf) * sizeof(*cmd));
>>>-        kfree(buf);
>>>-    }
>>>-
>>>-    xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR, 
>>>xe_bo_ggtt_addr(lrc->bo) +
>>>-                 __xe_lrc_wa_bb_offset(lrc) + 1);
>>>-
>>>-    return 0;
>>>+    return cmd;
>>>
>>>fail:
>>>    kfree(buf);
>>>-    return -ENOSPC;
>>>+    return ERR_PTR(-ENOSPC);
>>>+}
>>>+
>>>+static void finish_wa_bo(struct xe_lrc *lrc,
>>>+             unsigned int offset,
>>>+             u32 *cmd,
>>>+             u32 *free)
>>>+{
>>>+    if (!free)
>>>+        return;
>>>+
>>>+    xe_map_memcpy_to(gt_to_xe(lrc->gt), &lrc->bo->vmap, offset, free,
>>>+             (cmd - free) * sizeof(*cmd));
>>>+    kfree(free);
>>>+}
>>>+
>>>+static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>>>+{
>>>+    static const struct wa_bo_setup funcs[] = {
>>>+        { .setup = wa_bb_setup_utilization },
>>>+    };
>>>+    unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
>>>+    u32 *cmd, *buf = NULL;
>>>+
>>>+    cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, offset, funcs,
>>>+              ARRAY_SIZE(funcs), &buf);
>>
>>I'm not seeing much advantage in this generalization when then you need
>>to extend it with the free pointer (which is then also used for offset),
>>and number of written words etc. I understand what you did with 
>>setup_wa_bo and setup_wa_bb, but they are soo similar it looks like 
>>a
>>typo.
>>
>>Can we keep the wa_bb and indirect_ctx separate and eventually merge
>>them  through helpers rather than making the wa_bb stuff fit the needs
>>of indirect ctx? In other words, go straight to patch 6.
>
>Hm I don't exactly follow the critique. Apart from the bb vs bo in the 
>naming, but that can be easily improved.
>
>Purpose of the generalisation is that there is one copy of the much of 
>the code and vfuncs which emit stuff can be shared and used for either 
>wa_bb or indirect ctx. In a way setup_wa_bo() and finish_wa_bo() are 
>helpers. Helpers for anyone who wants to emit a series of commads to 
>some BO+offset.
>
>Apart from avoiding duplication the ability to share is super 
>interesting for workarounds which need to use different mechanism 
>depending on the engine. For example the CTX_TIMESTAMP wa, which Matt 
>found BSpec calls to be emitted from the indirect ctx for RCS and as 
>wa_bb for the rest.
>
>If we look at the end result (trimmed a bit for the purpose of comparison):
>
>static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>{
>	static const struct wa_bo_setup funcs[] = {
>		{ .setup = setup_timestamp_wa },
>		{ .setup = setup_invalidate_state_cache_wa },
>		{ .setup = setup_utilization_wa },
>	};
>	unsigned int offset = __xe_lrc_wa_bb_offset(lrc);
>	unsigned int written = 0;
>	u32 *cmd, *buf = NULL;
>
>	cmd = setup_wa_bo(lrc, hwe, LRC_WA_BB_SIZE, 1, offset, funcs,
>			  ARRAY_SIZE(funcs), &buf, &written);
>	if (IS_ERR(cmd))
>		return PTR_ERR(cmd);
>
>	*cmd++ = MI_BATCH_BUFFER_END;
>	written++;
>
>	finish_wa_bo(lrc, offset, written, buf);
>
>	xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>			     xe_bo_ggtt_addr(lrc->bo) + offset + 1);
>
>	return 0;
>}
>
>static int
>setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>{
>	static struct wa_bo_setup rcs_funcs[] = {
>		{ .setup = setup_timestamp_wa },
>		{ .setup = setup_invalidate_auxccs_wa },
>	};
>	unsigned int offset, written = 0;
>	u32 *cmd, *buf = NULL;
>
>	offset = __xe_lrc_indirect_ctx_offset(lrc);
>
>	cmd = setup_wa_bo(lrc, hwe, LRC_INDIRECT_CTX_SIZE, 15, offset, rcs_funcs,
>			  ARRAY_SIZE(rcs_funcs), &buf, &written);
>	if (IS_ERR(cmd))
>		return PTR_ERR(cmd);
>
>	/* Align to 64B cacheline. */
>	while ((unsigned long)cmd & 0x3f) {
>		*cmd++ = MI_NOOP;
>		written++;
>	}
>
>	finish_wa_bo(lrc, offset, written, buf);
>
>	xe_lrc_write_ctx_reg(lrc,
>			     CTX_CS_INDIRECT_CTX,
>			     (xe_bo_ggtt_addr(lrc->bo) + offset) |
>			     /* Size in CLs. */
>			     (written * sizeof(u32) / 64));
>	xe_lrc_write_ctx_reg(lrc,
>			     CTX_CS_INDIRECT_CTX_OFFSET,
>			     XELP_CTX_RCS_INDIRECT_CTX_OFFSET_DEFAULT << 6);
>
>	return 0;
>}
>
>I thought something like this was what you wanted from the earlier 
>discussion, when I waited for you to land "drm/xe/lrc: Prepare WA BB 
>setup for more users" and then rebased this on top of it.

looking at the final result above helped. Maybe the names threw me off
as you are using wa_bo naming for both wa_bb and indirect_ctx.

If we have both setup_wa_bb / setup_indirect_ctx and use helpers
called e.g. setup_bo, it would be clearer the function layering

setup_wa_bb() {
	...
	cmd = setup_bo(...);
	...
	finish_bo(...);
}

setup_indirect_ctx() {
	...
	cmd = setup_bo(...);
	...
	finish_bo(...);
}

or even hide the bounce buffer usage inside the struct you are passing
as param, but that could come later to avoid multiple changes here.

>
>But if it still does not look clean to you I can rewrite it with code 
>duplication if that is what you definitely want, no problem.

Nah, what you wrote above clarifies it. Thanks

Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
>>>+    if (IS_ERR(cmd))
>>>+        return PTR_ERR(cmd);
>>>+
>>>+    *cmd++ = MI_BATCH_BUFFER_END;
>>>+
>>>+    finish_wa_bo(lrc, offset, cmd, buf);
>>>+
>>>+    xe_lrc_write_ctx_reg(lrc, CTX_BB_PER_CTX_PTR,
>>>+                 xe_bo_ggtt_addr(lrc->bo) + offset + 1);
>>>+
>>>+    return 0;
>>>}
>>>
>>>#define PVC_CTX_ASID        (0x2e + 1)
>>>-- 
>>>2.48.0
>>>
>
