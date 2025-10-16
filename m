Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7975CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 03:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A125410E13F;
	Thu, 16 Oct 2025 03:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fZ+xSc9L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EF210E13F
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760585164; x=1792121164;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vE5BOc/pPhvWpIqYKO/JJsCqHdleR5NGuVTcvTlzspE=;
 b=fZ+xSc9LW/aaEIdAHZ/CFEz4cTfrhRTLrRQKByNUx7u/Mu4lLYfWjeV8
 DviZOuJ3yqzr+GESgw0yydW42qAkq/tD6bnmJpKFSOkovyu+zfN1bCZY9
 E1DjDXPaiInEE+coufLqUK9osOAmnNSfMPQLdHuyCysAxG3v4wRQjeftn
 oeOy7ZkQHeeZB3VMx1C0IyK5/bLfmmdx2A5Pa9kcpFh5JHBAy1MGXJvPB
 3aeCXT/MagdD0lzsCGikTZKbuD/CPkNBmW4vT9bDfGhcv7kwsJ+HrER60
 cDFrGfbWwTo4ngjLVucuDPdwsG8Y4H73azVnk7/JQIc5v3u/OG/dm2G9n A==;
X-CSE-ConnectionGUID: WJtaFoOoSAOdXnqkuwYs4Q==
X-CSE-MsgGUID: 0vJhoFbqTz6xQ1D+Sj5kSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62666293"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62666293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 20:26:04 -0700
X-CSE-ConnectionGUID: iEQm0esYQQmW8spRcr6CKQ==
X-CSE-MsgGUID: KebJ8spbSZiXCzc+SSer6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="212937907"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 20:26:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 20:26:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 20:26:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 20:26:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUt8GZWVdbVDdYSkc2yNJu1u4DdfmQHOQqMec9h5UtSoTJ0mzG8RRc00r/v6YF3XjYJQqtgCAn7Li4d32qKPoMKdd/GJ1eCGDeDqnpZ2XHBH7bC+fRQUpTkS8PtgIU3WCx23fCXWN2yUGGaZH8umhHXeOrxyTzENg8nKWzd7PN4m7En07HxGETq/+e/yGPdKLJCsuCalkl7iLN65iIB6tQEDw3TH70IKs/jtBh8kbjQ3xuZFbPl43hn9UFbNcPnYdqDFdAybwd1sqhY09P2i9g55nU0A3YhXBjJlGb7YWkIRhNcDocF2oOyCHzCaFmCAsNEh5sBheNOH3X5+lZZGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgJZR7QMUAQ1MBmQzLZLlEJfqHr5hzReixnv58ZFQcw=;
 b=dY7uhE0ARbvl3tUNu5Cgf4XSR5O7wgwpWs9dOg0hIeoUe2uETxhaXhQA2aC3J66Lsb6W4ylZnuPJhY5KNfrj5ZHqssOh77XE3y7jGHXo4uYtFF1dZ6of1lBtQSiRIptoM2YqQqfsqJegIQwNM1g2Bb4YkJJp+3EjQaDrcaHKXLh0RTzTj1n6AfaRA9eplvTziyEtDq6RRa6NgsnThF9ZJ2PAhPaOri4CtrNFTnseiOEOR+Y/4PFhbb740+Tzd65YntSrjG7Tcuy5JG325Qk2FDCIcvdXISWOHwuvKpqgjii8p7dAfH8ef4XXOz8pEAIyswgzXur/48sLhekJ7L+WQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4966.namprd11.prod.outlook.com (2603:10b6:510:42::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 03:25:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 03:25:58 +0000
Date: Wed, 15 Oct 2025 22:25:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: Re: [PATCH v2 22/22] drm/xe/xe3p: Add xe3p EU stall data format
Message-ID: <mrtn6l5fscugycerecnij4snlmusqpre3vyzmozqw5drbn5ssf@soxwelciqzy6>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-22-b9189b3056a2@intel.com>
 <87ecr3iuo3.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87ecr3iuo3.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fa8525-1c62-4097-7ea6-08de0c63b931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nH0zUp5vwb+H0R8aaDU7qMj0fWiQvI0LKwQJevhu1l+YfOvSGeogOvXLpq+M?=
 =?us-ascii?Q?Cz6SaY876i5/S24ZyVVfI9yv6z8FUOmgLORiYguwpiigRRiLJFnAtUFH+HXQ?=
 =?us-ascii?Q?QsZg9SYmyyWNMQKn2YYNMd4XByngEoHl+6A1F7a7KKKvVUR5I87/4zP4akg5?=
 =?us-ascii?Q?rC2JtirQqK22UBjsTcEZiuKSq2QXUs/fwdQ3VSyHqAgkPFVxCtixHZ7beXAj?=
 =?us-ascii?Q?sCl2MQXha4e8uc6gTmNX5ebxqnphemnZyNMFK3lGMw9YgJWyS+bAIhS2Yjt2?=
 =?us-ascii?Q?O1oinDvIhCkuRDrUw14L/1j366zkiucJ8d/cxWl1uKO3CpsJoFvZGwybhww4?=
 =?us-ascii?Q?lphuEivDT/GFikBRasCXl4wtyDFYT8vmV2aZgG/wPl/FPGAW4BdCBUHhWlI/?=
 =?us-ascii?Q?1OdA3sgoPFcBf5cGCeA7giP3VTjY4o9u8vDW6Wh0N7B8iN71Q8EZOyGgbehY?=
 =?us-ascii?Q?WN6PI2y8/UK9BmVsbjgU6aZE3ax//EYBz/oOPgB0cb/YWQL1rwF7u4ndjdsj?=
 =?us-ascii?Q?LaSDAVG0c18q6hABO/niRb4qjlBd3vjVTqcnHvSGtANDLS/cJhVty8RRIATN?=
 =?us-ascii?Q?h3p6VrFdsULzhx2RuU+iKkIkqVapmiRv8j4KLhDkxaTmgIYqVD5gd81bBfeM?=
 =?us-ascii?Q?2SgaWRcTfRyci7mH4vbWNzXejHOWAuPyga+r52eaKf3qOvw+1KXp1mmBU88O?=
 =?us-ascii?Q?9JvDLPjff1/MlI3wEo0+uIX3w4HD6GHWSMZrnXeBmfavvDzVymy9HSqZU98C?=
 =?us-ascii?Q?bFkDE8T/WQSytAo3zNhVEwqi7XiHdSkkbvnP/U/UiqcGAbQR4UckAfmn/myX?=
 =?us-ascii?Q?y6YpsGmW6WeyRvqOEsKtPwlXh2kdMe+kZHGiUFlrjytr8tTYn6CHrJe32+Je?=
 =?us-ascii?Q?+2wuJCiC1H8noHwEdbIIspa5uG3FaFZ0459vLlBW8ibHl865smfJiU5TqSK8?=
 =?us-ascii?Q?EiYcLu7uR87RC101Ty6tPGuwoMG++B/sPeqSIV/XRcyJGmxvrNdXv2mLcv/3?=
 =?us-ascii?Q?gLad1ayMM7Yy6zvf+eZ7ek6ZWK3jiTqU4znaZhND1j+mKQ5izOkXdriEj2JD?=
 =?us-ascii?Q?tYskV6kJvx2qgvq3tBNj1jVDXOwxMt3N/E5A1cPltsHg4Wib1LyhZyqxxR7Q?=
 =?us-ascii?Q?60gsV918Lw5QTjUzJSXAc4Lun5OapWHaK7vKI5/mMLEA/zY48iJbds5OvwKM?=
 =?us-ascii?Q?I+feJdmIe4jowVhC5gfbvw27h7Df/T+laipDcM8lyxsYuE3U8bhRosp4AaPy?=
 =?us-ascii?Q?5FtZHMtJX50Ucy+70NULPkNRBnQHIjfxscuRZ4kkPWQpTHXoMQctBybbb5++?=
 =?us-ascii?Q?VOE86NBdPA+sT8dykjRZyi68GIuUtgkusSjg/gaxBQ3diJwLBfOsIu6XCTeU?=
 =?us-ascii?Q?1if38lWgCaFQt8u+h2C2iVB0U1N2CCfukJhcg88qzJxvXZFwQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MfmVWHBubj+IJoaMO1iOSL6rgCV4L8sBAxLZNFfgmJYXcZhR+PmL3WVwrXR7?=
 =?us-ascii?Q?7DrWQ6nN9hH/vJn15VHSn59PzKMk0pdCjXWwudA0jznw8zz9lx/eSxra+Ijh?=
 =?us-ascii?Q?+G1zNbLSL1bDxSEzBWIZY/ClvL0pedLshFzmQr4CFDvgUmok1eMziaiRM9HR?=
 =?us-ascii?Q?6S0kTt10QYLYe4lWENNJJ4UVgZzw9kttSPdGGfweKwXf3mI2FsisTDS13UWk?=
 =?us-ascii?Q?ITLW0eGi4X5cWOvAgPmm5EyW1hDrAmPX2YQT8+U56CNWhj1/Mrrn1GupEcfN?=
 =?us-ascii?Q?Pkd7ANtOS/N/vgfiZCL/KMXl3xMd6dzQ4b9OzGFPfMk/K6A27LHO0ikiHHFT?=
 =?us-ascii?Q?ecnJqKQusUpN6mKkeF4s8P3GkXRhIv+wU4N5RAIRbodK0Y53jxKeLe9JMOCM?=
 =?us-ascii?Q?xJOKv3IXlvycUDQE39UIzOtu0QEc1KEn8UBc4lbD/w2DOtap3yaA8uUE3W2Z?=
 =?us-ascii?Q?5IRCOVvhRlOT2/ZfJy/Nper4TG2M2faRiIJFFUCmn+nu1vbWavxE2BwzDV/o?=
 =?us-ascii?Q?MUX+NBa4dNeVbTWRYtZ/j32kQu9oEe3/yCa2s3e8/fHXZ5zeDeGYM6Wmy5U0?=
 =?us-ascii?Q?x/rSquO71S8p3f16pt+dgcw+MD0DmPrdrRkKy3sPofvNM8BrBAsoTRXuIyIV?=
 =?us-ascii?Q?JabvKnaJi8VDG12tMOXD8pMWLfzKIik0/UZaZsjFFKApIFptNREoptEr1Uov?=
 =?us-ascii?Q?6FARUUXBCB9tszRGfuvBf6ibCxE5KI2ZficA/g+iaB1DpQqEliN88cbTdw1t?=
 =?us-ascii?Q?V1jNhHPxi3DZtO+Z40X82YE0N2vnqihSTghSABRsirEUjvUju4oBpyJiCkhI?=
 =?us-ascii?Q?Omno/xUT51VtcH5haRkoZWNVBX37PSkXhS23T2VLMTXvqif50uRdxtryhmjV?=
 =?us-ascii?Q?gqWGMrUEG6aoR9xZCEN4wwDcwHA8PXzcFPQWnDHQ08V1USaaUlQ7q9Z6ZfuQ?=
 =?us-ascii?Q?XZg3UNbvfsTusccP5b+MPww44YOCvRE78EXmCTunHgKW3DC7RHZvNQ6QEsbp?=
 =?us-ascii?Q?p6x5S+oz5L3bzWvNG+WN39vjfJ1jx+KClWxa9IycKC0aabixfV/l8DmLWSQ2?=
 =?us-ascii?Q?zxr2y3h74+Fp2qbgqQyIS0g7c48iTyx0gQzGPGNKm8JC+Os9F//v32K/d9YE?=
 =?us-ascii?Q?hr8j2yd0uLnH8673OjWYxhiglEVRSQGA+e6VQdLW6UmvS65gdK5IyMDw+4Ok?=
 =?us-ascii?Q?gTHDz4Xv18p6mUQElOFv8vQZobglXICR7iPefjdg0F9LzOwadjUkzIH39TGd?=
 =?us-ascii?Q?9CuhOqDHEC0RYNwWKDuSNn6JfnF1At7klgisgJ9/l+v9difubHrmKDJGIA6X?=
 =?us-ascii?Q?8VTkju1V80gGUKvpjDZgvQxZNE8A4GZXgxExD814qFveGXVtvl+TfdovNXHp?=
 =?us-ascii?Q?iT/J1e3/cBYw8EqmIdAsISQR75s2H3F1o7zWcEvHyIhhMq3gLv43foSQIeZw?=
 =?us-ascii?Q?R5gGL2fwyzfUcci2i6kwjMnwApgGci4bNab7jgjEO5f8oGnI/hbgHOElmwG3?=
 =?us-ascii?Q?+9Bbh/4s3oD38c5NGNlu2znXaHRryOcQoA/8Ean92LEMUvs8WSBLCHfRaF8Q?=
 =?us-ascii?Q?3qsZn3kkbK9T7OrqZCyeECtHqQQJaRK4sJOA/5ROGWu73LuaLZTGaGVus6uz?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fa8525-1c62-4097-7ea6-08de0c63b931
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 03:25:58.3016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdkRaqfYiJW5vST8m43tEGB/4VXViLZfOh02sEq8xZiCD3wSatGpuTswF2P1uB/j89aMv6mttQcIFMiy4wEhftKB21wEagpi5bHFL7Le3As=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4966
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

On Wed, Oct 15, 2025 at 04:58:52PM -0700, Ashutosh Dixit wrote:
>On Wed, 15 Oct 2025 15:06:37 -0700, Lucas De Marchi wrote:
>>
>> From: Harish Chegondi <harish.chegondi@intel.com>
>>
>> Starting with Xe3p, IP address in EU stall data increases to 61 bits.
>> While at it, re-order the if-else ladder so the officially supported
>> platforms come before PVC.
>>
>> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2: reorder the if-else ladder so PVC is the last (Lucas)
>
>Don't we want to commit the version log as part of the patch?

I don't want, no. It's something we've did even if the general kernel
doc says we shouldn't be doing: https://docs.kernel.org/process/submitting-patches.html#commentary
I'd say it's good if people stop doing it in xe, particularly when they
start to contribute to other areas of the kernel, so they don't get
another barrier to get their contributions accepted.

>
>In any case, this is:
>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

thanks
Lucas De Marchi

>
>
>>
>> TODO: double check data format as it's missing from bspec
>> ---
>>  drivers/gpu/drm/xe/xe_eu_stall.c | 28 ++++++++++++++++++++++++++--
>>  1 file changed, 26 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
>> index f5cfdf29fde34..650e45f6a7c7e 100644
>> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
>> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
>> @@ -124,6 +124,27 @@ struct xe_eu_stall_data_xe2 {
>>	__u64 unused[6];
>>  } __packed;
>>
>> +/*
>> + * EU stall data format for Xe3p arch GPUs.
>> + */
>> +struct xe_eu_stall_data_xe3p {
>> +	__u64 ip_addr:61;	  /* Bits 0  to 60  */
>> +	__u64 tdr_count:8;	  /* Bits 61 to 68  */
>> +	__u64 other_count:8;	  /* Bits 69 to 76  */
>> +	__u64 control_count:8;	  /* Bits 77 to 84  */
>> +	__u64 pipestall_count:8;  /* Bits 85 to 92  */
>> +	__u64 send_count:8;	  /* Bits 93 to 100 */
>> +	__u64 dist_acc_count:8;   /* Bits 101 to 108 */
>> +	__u64 sbid_count:8;	  /* Bits 109 to 116 */
>> +	__u64 sync_count:8;	  /* Bits 117 to 124 */
>> +	__u64 inst_fetch_count:8; /* Bits 125 to 132 */
>> +	__u64 active_count:8;	  /* Bits 133 to 140 */
>> +	__u64 ex_id:3;		  /* Bits 141 to 143 */
>> +	__u64 end_flag:1;	  /* Bit  144 */
>> +	__u64 unused_bits:47;
>> +	__u64 unused[5];
>> +} __packed;
>> +
>>  const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
>>
>>  /**
>> @@ -167,10 +188,13 @@ size_t xe_eu_stall_data_record_size(struct xe_device *xe)
>>  {
>>	size_t record_size = 0;
>>
>> -	if (xe->info.platform == XE_PVC)
>> -		record_size = sizeof(struct xe_eu_stall_data_pvc);
>> +	if (GRAPHICS_VER(xe) >= 35)
>> +		record_size = sizeof(struct xe_eu_stall_data_xe3p);
>>	else if (GRAPHICS_VER(xe) >= 20)
>>		record_size = sizeof(struct xe_eu_stall_data_xe2);
>> +	else if (xe->info.platform == XE_PVC)
>> +		record_size = sizeof(struct xe_eu_stall_data_pvc);
>> +
>>
>>	xe_assert(xe, is_power_of_2(record_size));
>>
>>
>> --
>> 2.51.0
>>
