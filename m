Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD22E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 22:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854D910E627;
	Mon, 16 Dec 2024 22:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+0zYDNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7400810E627
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 22:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734387657; x=1765923657;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SwHzyqlXGRqgjPmbrFAt7DnbRGbJJYc2Bx5WWQVTuzM=;
 b=C+0zYDNFyGDlxlkZLjvM4G8Urd6/EX6WdztBBFnY9GZI0ugIg5BXfNTs
 wwLlKwwNhi8BsporQw29tf+G+b/55d0LfD/Bw4ngsCW+h3NdzIPQ6dEoV
 P4zxgkrd6lUpDkD/QGIbprAIvxxRP+LgKnrsmVWRwmt736HmdP2nGCOAX
 jGd5mgxSvsE+6F9qM8+QIKFypvRYUN5kxR49j+bffWBlGvSX5Vq38U1a6
 tfCAUEKaoPuE4H+/2CTfrH4bshHC3XRx4Jh4YhP1IVXZsgobu6MumfBNP
 0d5itP0bx7oJNfAWsffVvLTgpfh4+SmGrvacG1ud77gXPqoMQkaFy3PW3 Q==;
X-CSE-ConnectionGUID: 1jfEddebR6GD6vj4QThu0w==
X-CSE-MsgGUID: SYMv1cWrQpGbL58o+OEhLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45796702"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45796702"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 14:20:53 -0800
X-CSE-ConnectionGUID: oH8pqb+lQuGtxcF4FcWSpg==
X-CSE-MsgGUID: QEySzus5TnaKJlCNPipGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="97110072"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 14:20:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 14:20:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 14:20:51 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 14:20:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOiUZ/NYRAGlW0Xi+/rHo85/v3ZjP2twbwvlMQN9GdofcyIVXbbvZ1392keMNlu2BkYaQF7w7g49tqyyqAOXKKYjdfva7SDpX9QVNIfEm1pj07aB1VMHPUlEGq/W9BNgEaBLJN71kEJCGAOdQKyxJw9XNb3h/cJ6tC7MU4TmagdfmrEVaBMmu4RjDtLQk5MVpytfylDhl73ad5N/WOXjmsyb9s7q3MV+sEPhj5EMKIuFRFIlETT6dou/IYKNJkcVnKy99oiykFnpku2hhrsqAbaPBWb4Pkq0XkGX1etBZMOCfnUEWtrLR0JzDz98KzF23gA+jH0yN4tbyMrCppSldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hc6gjDD26X97/uTX2hfmiuhe3Dan9/56WwGdb8KoT8Y=;
 b=vq3h3rzYhPkzfA1sT4nUBsGOTxkHLBTqiN33In4lX9HeN2WyJwk9NCQU/ZxYLu/zM/2BWorK8UT9niwsd1FxBwXsbRGBMp9bFerwH3SNgtyTOPHioTPLdQkxg4y2ILxA861oIExreQJlo6oXrGO1D7qX2Ifev7+69W/k2K1HHI7C1c8IZDzFmU39fAZ3hswC3j1zU7Z9xcPnY3Ie7iAM0doB270kkrJ3flKHarR6vsgpUKGiDNszMs7sSXqo+NcEiSQCLicBSvrLfKuHdC/iVdQdS5exoXMsE5glUk/biJykK3Uh3w62QB8brNgPDisAyrvrBQB5wepJ02VxTI4c6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8253.namprd11.prod.outlook.com (2603:10b6:806:250::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 22:20:46 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 22:20:46 +0000
Date: Mon, 16 Dec 2024 14:20:43 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe/vf: Allow VF direct access to extended
 registers
Message-ID: <20241216222043.GV3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241206133929.891568-1-piotr.piorkowski@intel.com>
 <20241206133929.891568-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206133929.891568-2-piotr.piorkowski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: b02f0e8c-18d6-40a5-6165-08dd1e1fe367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KFGl7dFuw1/NjaBmJKfx+xX8kzuTjt0PRDBpClRrqU0FFoPbweHJFJJsmM?=
 =?iso-8859-1?Q?C2NfqEEphEyFrPW3B1hCdC9u7EgvSC9nt3M1mfUJoGO9rFOfLQK9a5+9Vu?=
 =?iso-8859-1?Q?EGVcge+ObWWUjj6oaf585pcmioFEcNLcVyMybKAXGpnmm3S9WdxXJePmqr?=
 =?iso-8859-1?Q?lRDzaiuNMCBQgOF6hwAyNUUX8ERyo9Fpluku354/cFFFGbN4JuRm0XJQZf?=
 =?iso-8859-1?Q?SkfJLYEfUFQsWIb4alU/uUpOkNw2LdPO8kAEt+l6ThPnwCTUgvcyHD+qlw?=
 =?iso-8859-1?Q?qOj0t7Iqs1rpVl98MPoYZ6QIyL7UzzM4YirL8x0ngwVnA3MAoK/j9EVbGr?=
 =?iso-8859-1?Q?igo9D1eOf+sqzP0Ww/h/IVoICBtu6qI72cg8hYpJGGV0tVfTgALxQKoUND?=
 =?iso-8859-1?Q?UwryrGY7zBqg3og56KCEvMdikTYwkydMrtRVy7B63X9H5eotM95tVWU2gC?=
 =?iso-8859-1?Q?3iIUYE92gUr0hZWUWRdz/J+iWPT3XwYdIZOw1pzDHstehsCWByB6CKb6LZ?=
 =?iso-8859-1?Q?prkVQvQcf3OmWWbq//nBWlOoeq328o2X+qojGs0IpegemS9MGROJzxgchD?=
 =?iso-8859-1?Q?jHZb07/aDJxfz+weQMwHWaNdCdWWmOlI2ycB5/ZHUFkXnU8uapmUS5quxE?=
 =?iso-8859-1?Q?AuI6U2BftSO11e4isCnTF1HsbDTLeEdhmOl2SnFcfhIaeHnB6xVGJKk2/d?=
 =?iso-8859-1?Q?tbAbqcy/TafWbEFopOqDUIX0/qi3X5orbFYb2PtyKhSaoQxLwNnZvEv35m?=
 =?iso-8859-1?Q?nSSkGQA6AON/V5EPjd1ZPRoQqNsvN82vBlQsZaKIhWg0sNKBuLEMw0QjzG?=
 =?iso-8859-1?Q?+ZTyA23U6CzCmbW8TCmMk7E/nDAEm++/hR4Eeh657wQB71W91qotsSMjsr?=
 =?iso-8859-1?Q?S8eQv5Mw2tAejS3lbfoulLBxd74ScWaPaUbYn41k49mkLMA60Qmpp4RLJo?=
 =?iso-8859-1?Q?c5aLyRrG79eI7qnfBfxPhxNYOXg3Q5PRzHNdu8O4RmMxpuxdx7ahjZzsRI?=
 =?iso-8859-1?Q?dvYzChEJFEjeLKTNoc0cdvPXxEIriJxDEqY9zquGVQ291HNrDgb79yk30r?=
 =?iso-8859-1?Q?FRz1n5v/QvYK4NYXbW4W3B6XLI4kXK/27CLFw6YYDrUrESQHpagngAutBn?=
 =?iso-8859-1?Q?Oco6BriWGE/+k58fx6mSAI55YQjnWsrsAbAhbgqwh2wcpLDuzeIJ0SBaHi?=
 =?iso-8859-1?Q?k2yiflwssf/cAhPe4Punka3Tgx7S7bqbaR1+1iqcbocNTBfy+xvT6r399T?=
 =?iso-8859-1?Q?s2pOOk4SIXGN1N3FMe0irguuO3L5h+CXhUZLq0HAmUIfM2Q1ASX3kiL6EK?=
 =?iso-8859-1?Q?eK9b/D7B6u0IyYo7uXg5MjmL5BbZlONx25kmPfPigr09RSoTom9oX4DrWD?=
 =?iso-8859-1?Q?210bjd0e8dfzru5UrVCaLQxzgqbEuBa2QW1NCmYJOH2qWgYEcPMHuj6T4K?=
 =?iso-8859-1?Q?0FVsFWq2tjjIJi6A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oAUgmoExvB8lgbjIatG2RjNxAMJ6KHkfzudBO03HuuBxZ1orafADGV9We0?=
 =?iso-8859-1?Q?3+99kTB3p0y385fKK9akKlSAC0fIWTr9KKaUATzchXmCD0uRVcJsrr+fyy?=
 =?iso-8859-1?Q?nEJsGvyWDcZ1Dr8vMkftdMCUZ9wEopQtjl7LKNIzH3OnuvuVrFgPx6hWw0?=
 =?iso-8859-1?Q?ogY2BMQDFjViX1gTiSPVOJvZhz/YTmaczoYnoochoMOp/j/uwBGK9N+z1t?=
 =?iso-8859-1?Q?G9QhqgXvUGf6npaTRFaHIcDJMqCxjTC2hIwkmpyz5CaShAxVys/KYeQ1EW?=
 =?iso-8859-1?Q?VU1wEHofAZQO6v0aXfyYXAbpTuecFqVI4TvZ9ho1+woNGVclAxYX9GOhaU?=
 =?iso-8859-1?Q?YVfbNIfMBQQb/Rlxcbx4j6GVTPF0KP5ZK8Ip7qRu3KRxQI+bbsGTEoVsmw?=
 =?iso-8859-1?Q?hOlAvBINrJwxheV1qa5s8rN62897mZU+PEcVbL7qTDFw278+FLw8uH43uU?=
 =?iso-8859-1?Q?nPaiIH5VkT08x/70f8rAYskJypqw71IF8GbVypyZS/nC1H0UOEo/q955LU?=
 =?iso-8859-1?Q?lwZW/PUniJwq93/E/8W5M+dKDjgh1BTWIUHoDGFuMvlGn5CvIOzaUKoiGQ?=
 =?iso-8859-1?Q?ftvu+qJvy2D8PhMfp/CXvaktqW45kBDXaqLD5Xw+BqzBVMJw2Ob74KgF4Y?=
 =?iso-8859-1?Q?w83GCcTjvYqptyKrkcS8FKGgNN83mOsKhDL4QumRm0f7+Vs/JDXkau0jV2?=
 =?iso-8859-1?Q?Nu4F68c9NPf/ITCHaPYs+P4zYh6TNV9azLnz1b0bzQ1YSUbppxdsCqzF81?=
 =?iso-8859-1?Q?Fd9sXBRP5GD4Kt1P4FrW4Z2Qg2IegUAHG7AmJFdgIxdutmSNOMTyso0d2H?=
 =?iso-8859-1?Q?nxh/oMFwSxtCr+GKVyb8Obn6HUHObnLt6aNiqaIQiVyz2s7os6jnLkj9J7?=
 =?iso-8859-1?Q?qS4nsqMwcjDSxV0xMMnGAgQyGRQr7HuLVA952K+v4/yrDAm4EufGsVpOGC?=
 =?iso-8859-1?Q?fRzcQNDIqS+j7RX4tkjp/6dJomWhB2woWvapil2UPSdmpKlyKH35gXaIxX?=
 =?iso-8859-1?Q?3SA2WgDW7PDGWzvoZi592oGgYoF80yr0Fb+4yptA6oExNYUGrXyIOUb9YK?=
 =?iso-8859-1?Q?S+HV0cnda66gPoFsLxaIDnvSZE7fONO9rDLZVqY48H7BqpEMX+mxGDj8gc?=
 =?iso-8859-1?Q?YJLzCLdlxGZR7YLSs6WBaxD3WPej3geCQQwbhWvQxBf9VNukcG/QuJZNW6?=
 =?iso-8859-1?Q?rv1prCCUxSVWFKecGOrgwtf3VgaJUu/2uQgaeBQuAqEJTH7jOpj3FCJ+xs?=
 =?iso-8859-1?Q?mLT0hq9U4xa8b5yRFNFBOQndwVS4g+8SuZZInDp1mEwg6Y22AlRWr48P2S?=
 =?iso-8859-1?Q?hv9Lzk+a6VSzHym4teUR3zMp9a96DJYviozLZVnC6AqB4bn0Buyz6UScCm?=
 =?iso-8859-1?Q?VxsESxj/CFpO0X2dRyd4EybhjVRcWJhNZBIW0L0spjl7WEjeHOn78GZrDX?=
 =?iso-8859-1?Q?8Hd8JqqtRPmtVbrHs65SDBYKCAh1+v6hN7EspnWtHtaz/4tXAQROHh1+9Z?=
 =?iso-8859-1?Q?TxO2wFdvnQ7f0ZtXe2FUqdjTh45ViHX89Lh8HHBirIQ1pH//9P3oXagAWj?=
 =?iso-8859-1?Q?fW/gVOhNRWcX7d/pJxqj9ffnqFSVUpSQMXyOULcoTtC3sPeEvl1rjBaqpQ?=
 =?iso-8859-1?Q?Bu3y5SUZxxllk6P91FnrUNqTTHvxvApdtKNR/4o8Y3kqgo9yppSDwVqg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b02f0e8c-18d6-40a5-6165-08dd1e1fe367
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 22:20:46.6463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +H0q7rbgCcNsNdcNHOqRi7uAPNUCZJvTN3+q5F3sl1w87uqNfUyQABKVuLGQeLy53yVGNbWSLu4hTORUCEEL9DJwmXlr7ggEFSsaw8SJXEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8253
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

On Fri, Dec 06, 2024 at 02:39:29PM +0100, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> While VF by default does not have access to regular registers except
> allowed ones, the rule is reversed for extended registers - VF has
> access to all except forbidden ones.
> So let's allow direct access for extended registers by default.

The plan is to delete the whole mmio_ext thing completely.  It really
never should have landed in the first place since it's not used anywhere
today, and we don't plan to ever use it in the future either now that
we've cleaned up the driver's register access design.

If platforms have separate register areas (either in the same iomap or
in a different iomap), then the proper implementation is so just create
a dedicated xe_mmio representing those, and then provide proper offsets
into that region.  If there are characteristics of the region as a whole
(i.e., registers for the new "Foo" IP unit can always be accessed from
SRIOV VF's), then that's the kind of thing we'll want to track as a flag
on the xe_mmio itself rather than the individual registers.


Matt

> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index a48f239cad1c..b6f64b78deda 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -233,7 +233,7 @@ void xe_mmio_write32(struct xe_mmio *mmio, struct xe_reg reg, u32 val)
>  
>  	trace_xe_reg_rw(mmio, true, addr, val, sizeof(val));
>  
> -	if (!reg.vf && mmio->sriov_vf_gt)
> +	if (!reg.ext && !reg.vf && mmio->sriov_vf_gt)
>  		xe_gt_sriov_vf_write32(mmio->sriov_vf_gt, reg, val);
>  	else
>  		writel(val, mmio->regs + addr);
> @@ -247,7 +247,7 @@ u32 xe_mmio_read32(struct xe_mmio *mmio, struct xe_reg reg)
>  	/* Wa_15015404425 */
>  	mmio_flush_pending_writes(mmio);
>  
> -	if (!reg.vf && mmio->sriov_vf_gt)
> +	if (!reg.ext && !reg.vf && mmio->sriov_vf_gt)
>  		val = xe_gt_sriov_vf_read32(mmio->sriov_vf_gt, reg);
>  	else
>  		val = readl(mmio->regs + addr);
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
