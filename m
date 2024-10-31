Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95FDBE68954
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 05:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB0410E0D5;
	Thu, 31 Oct 2024 05:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lR7druTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5C910E0D5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 05:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730352138; x=1761888138;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+7qoqLG+bex0SAXhq47bHNt4FZIswJetkl7hlqwoSW4=;
 b=lR7druTPcefG5g4OATL61QB6LTO12jGaU/42EFSgDFfKXgov0/N3nmO3
 DwdRasasdyGiw5WdNGWLS4bp4CziCDkieVqG3Sxa+mMifnWsVrW2GZs/x
 8HkQSO8I8GFLugAhFsECCsq0tTFJc884S8bRmAA+aauKNye7eeFH7SSf6
 5sDrS9EkscSAJmCYix92j4rpgoW9wVZqEzHlM8qICooG49TNHVQ6bVdMt
 4zAiOAWBMsELBHW2VzPvRmMiP9zef2KG4q2ZM++foelpyNInZfjXDLkc1
 NKi07oRY8WjAVYclOtFlgqkcltp/ros049ZFU2c9skuHWJZNtjxnvp2ie w==;
X-CSE-ConnectionGUID: ypemc/bNQHKUIqYkqZQznA==
X-CSE-MsgGUID: C6zVEfrpS/+jQCPL9VDolA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47535905"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47535905"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 22:22:18 -0700
X-CSE-ConnectionGUID: uIZQbv8+Rhql6IT6vtjkYA==
X-CSE-MsgGUID: Y+DvklUGQ+mmslS3EcAIzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="113321189"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2024 22:22:17 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 22:22:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 22:22:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 22:22:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grNIZTtP2thcAra7+/CnUdEPX26wHzNj0B+sDBZr4b1B16EH/lrQKyHzCvBegx3IKwUrcz3FqvsLRFdvXaIm/msWGboww9zVkKBwkpdxnRAMjlo4xk0BctK7h3Z8LC6CTlX/xuD5u2MxfJni0bO5C0Rye/Gn0YlDmQnR5srGffbGzGeCKStfd6bEU0Gz5dN25mUIphr1GzZN4tkjlZPtvXNoJzOuc9YvKgNyJz/TXesKWG00rNwasUR0YnWeUnlDpG48znC+mUasoZm19ovBqg3/FYBFy8B7BdM5GKT4BLLV0mAyK1K2OHPcQE88b5+nDA9snQtteksfu7K6wD9Saw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q32YlZQ8TG7c3+lrpGeuMQpbwxB0Xsr92pefk2stMo=;
 b=bne3k1PWOJ2kwBe+immMPiT4My4o/Bl9VXdZ1qE93s2ThPesY5sccDu4h5jIuwDsKp2w25shfIT+9Pz0Eh++WeHlmg1rgxAka3BVC5WQxeFXpieXMrOqdhMmlEVfbp2biy2Oe8etAMHrqDCUs+j+j2/Tsl5KsPmJbJTjq/vpvjikISC6YrCYqAy13qYrBCjNYc203jXQqNTMqWLYibezUxO+R48puPrpefTvQ55Ge2aM8+vqxilJ2UucZ2jbRb+RXsHFw/jVPUEwcc2+eRbrGZZRblLRa6eicSFXozsHsROgwJh55/L+QIE0xzt/3GQ3V0Jn4KJfsiOqcWUA2R5SnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Thu, 31 Oct
 2024 05:22:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 05:22:14 +0000
Date: Thu, 31 Oct 2024 00:22:07 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <john.c.harrison@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH] drm/xe: Add mmio read before GGTT invalidate
Message-ID: <5mayyhg7qvbwe753kn7gtteqx6dq5jpkhmvmkuqe53emwzp4jy@ikzamghm3z4p>
References: <20241023221200.1797832-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023221200.1797832-1-matthew.brost@intel.com>
X-ClientProxiedBy: MW4PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:303:8d::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f69048-d837-487e-f106-08dcf96bfaaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?7J8uxFjMffEO7UuhaX4CYdSDl03K+C9UQQeEJc5jKw0mMFy5YlpdiCQUZK?=
 =?iso-8859-1?Q?L4SEpU6FUeszPwNSianZuGwaJvSb4gkUmv2W+CLwCSKQCwmvCyk7UiuYVl?=
 =?iso-8859-1?Q?uDqx1aKLwFzO9C8IqH6I0btlA4d7G00UfMibUUTAhgFBaP9K+QFl809FeG?=
 =?iso-8859-1?Q?yF+/DssUTK+w05imAl81D2+eQ9XdLoD7NhQ/YJvqgsTnvmFN114+62/MJk?=
 =?iso-8859-1?Q?T0JmtbrScRzMYbxlRh4aNPU7Up/H1gPtPs52rQ1R/XXf2Zja8AhoJhohPt?=
 =?iso-8859-1?Q?f2O6l3SFq4Ha3hM2//UK6QMcwd6i1a7CzfD3y/VzaYA8hWVU7d4b54I0X1?=
 =?iso-8859-1?Q?w3OHeWI2H/uRX3eivdk5N0oYjJ6rbeXQpEaWf1nJ8IoWVKE6vkM1pe7pug?=
 =?iso-8859-1?Q?rDpnvlhpf7TNtOvQQcvrHpCvKwbo5/wbc5/NtQB7q/wkOc/NIIfG28xqcQ?=
 =?iso-8859-1?Q?vvTvsdtA2ykfzOSgX7BVuMDRu7JTiF8akkUEUCufchCfnHVSl2EPPyBc2j?=
 =?iso-8859-1?Q?Pgxo1N4dVEgVyh3BJItQb6Tbe4Hw9wQp8QaEt6KVNd6wHg++PjkfQ/0Nt2?=
 =?iso-8859-1?Q?SzqFTemTVaXqfyRgk31QVdEWoQ8BdYhGK27JocHm4Fpo2QcMbGOySQfBEj?=
 =?iso-8859-1?Q?hEuhCvwZBnzex6WqxUVzy8VospzeHz5DxxUtIx0ViQxVLtarkGIZsVeh9X?=
 =?iso-8859-1?Q?LDoAtDbq+ddu1xoOi/WwUbmn+hLvnCdtGZ1vNhHvdM9EnIcGqw0/Gsx8X/?=
 =?iso-8859-1?Q?nJ8oTMGLaVcvYI+Gn8+12m0YqzpklBefhWdYxNfgMQWsXJ9ONZMCPWp2ZB?=
 =?iso-8859-1?Q?dIcUX7kCboI6t4g5/Wre/YmFfkm+iFp+L0BBg6tsUFo2F28vzjr/69xj6f?=
 =?iso-8859-1?Q?y7hrZw4JnCUvIKUKmwqwg24BWRGxOPBHUQvokSz9YaIF9eaOTtH3Bo8M3q?=
 =?iso-8859-1?Q?HNLFoSdFRJIOFjabO/i2pjLLMYMhpTNN8ZrPR1xpznU8u0t0hzS3lpTuyi?=
 =?iso-8859-1?Q?oHmCOUC+I3LxAQYlJjkYcKVG13VK8+eu5rQge5WUMWdq/S+olw+MaLooIZ?=
 =?iso-8859-1?Q?hL07KPrvJi6OoGxHGODsyxuZbjDk/83b5cLjFdBnmZ6jOJ17OWHXXken9v?=
 =?iso-8859-1?Q?2TBErXgnTNJg+WE/w6HgzYcdsI8Sbu+a9afsGGhXa3yQ4eZF5jmmYAADMB?=
 =?iso-8859-1?Q?nqh1H6tIsrB14ozyDJDySk3fiJKfxOCZsgsQ62drshBIvnfkhMGoUHHU78?=
 =?iso-8859-1?Q?xGXY8cJrzHp2Xbk+sjEaO/gQqnYXQXLXLHMTz7KX5Bcs3SF2AKEyyFWdEB?=
 =?iso-8859-1?Q?0DLr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7fydIjdLcubnUwcprtURAU6/EAEz8PEWW0eVT0ca5Mf8TS3obBDZ2mhvNu?=
 =?iso-8859-1?Q?3oGPVO6SL8AFHLgFxhuKcB5qbe9vvt3pT93+dQzkgpRxQ2MGceyZbSEQCh?=
 =?iso-8859-1?Q?dDz+BoxhW7L2b6F1WOVkB/evpxhcnY+7xlRl8QYFbLMLirLkf9r+ruTDkq?=
 =?iso-8859-1?Q?HqyAHdeIlyf26M226rtQYm5FgeK+HeFf+VX/7PqEv7DyxXGR4Vloi42dKA?=
 =?iso-8859-1?Q?nxrzxFDw/m1yTyDrIiO3i/2GqNWyPOFfic+NQ2iWMo3fSsp/JvwOPaITbz?=
 =?iso-8859-1?Q?WerO5Mrxl5cDHtRGqr5N8Epu0jIObNVQdAbyaSUyQKp7lPCXR1ph+MC1qe?=
 =?iso-8859-1?Q?BEB5BRIRypbTncXODChILWhRxbFD8eNLNknjel+0nit7oEAeAVhrgfFuR0?=
 =?iso-8859-1?Q?/Oes3qgDpVM5/wHoen7l0o+Tp/0FF30oMeJqgnFGhzJWhSYyfgQO4uFtu4?=
 =?iso-8859-1?Q?iACHr9x3QaMViMj0mnlFncIjcw3tbqmMchUxk/kTe2Gbn+8tVyxYYmHZ25?=
 =?iso-8859-1?Q?mu/RYVfqIPeAeQfrFdwN3P7KjrWq/2xrmVmGa8SHmGVPRHa8M4qi5jshDT?=
 =?iso-8859-1?Q?PDnaAHtzM8evISTRcxU7tsrHJFH3D+SN/WJNHvuAFFpVnFMG731HKCCgM0?=
 =?iso-8859-1?Q?BsRHeUWS9Ow/11jKPclDM9qm22K4GvPV3kgieLTIOIGAKCbt5u8ZAxbfoF?=
 =?iso-8859-1?Q?n8SqOTV/HYv8Q9tRsXhofZ9I+HUmWtf3eoThb633WfZFOmx737daKjZ2HF?=
 =?iso-8859-1?Q?z94A0dvomlGutuG7RcFNIdPKjfmwF+7jGudoHHh8tJEoJ7nBbRaX8Q84Bw?=
 =?iso-8859-1?Q?vX8QJ3xJgS996zl78rFu12VL7Ofesey0htEWhUagKFnYBu5kBLsw+N9knk?=
 =?iso-8859-1?Q?P/bdz9b8VlZ34roaDOpt5biSw56PusKCzFZwKdivJpm3/FIUpV7gpWZrJi?=
 =?iso-8859-1?Q?8G2MOFewOlQHzQxhPmDSJVJqSyFvPVXwr/hqFvLYmapiPxEFVogNy0mU7h?=
 =?iso-8859-1?Q?GfBi26WATBIdABjIdFJj4ajKZXF+L/+CXdwAMds7cCjz2J2vWa2ihF/RXp?=
 =?iso-8859-1?Q?riSnPPcStG1jD4MNlNKi3stagSJz/2QDHtpNuIABG8RUPRF7cXbQgnNBKp?=
 =?iso-8859-1?Q?QaU2hL+3ETRmISwvqHAYENrr5ojAqfrro4uANwvvhwOWVmACMdiuUOKd6L?=
 =?iso-8859-1?Q?kdpxS/h+AjHjwwdj/I7CsOyaL9efWYAg1YqsNhmXNV9w4A/gmasgXie5Tu?=
 =?iso-8859-1?Q?WEmSA6bFvu8kbdxfvt5N1bwx27WLQbiZtAvfQGK4fXbXcmokU4LPG5YK88?=
 =?iso-8859-1?Q?QFD3/drqOLiw50onqIposhmJ8MSIexfjZNL4VlwPwlUZFDAJI0kxnGh2UN?=
 =?iso-8859-1?Q?7mV1//zAFaEPuynZp3k+lMK6AXa7Ox6BRuaC0ir6leFpLHVyzdPfsYvXMq?=
 =?iso-8859-1?Q?EfX/0vc1PZQz2aefAm/0z21cZR+Ysvesej921+B1B7JTvY9fmtTBHXbkiL?=
 =?iso-8859-1?Q?nIK3STOR1U40+5pejWPdXXb5IGhnIQdIx8Z9m6iMq6vS74lXwfb2ivLyOU?=
 =?iso-8859-1?Q?oNKUz0GLQd2Rgqf3mAOfzIoEgPomOGWZyWlC99xl904xfJQsm2x6AU+8j6?=
 =?iso-8859-1?Q?93IGIObGnVxHjvw2S5T6bt/7CzsNktwH8lpWvP2FfkXeFk7WH4XEdivA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f69048-d837-487e-f106-08dcf96bfaaa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 05:22:14.3327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kScJfmnjuIkkXC/1a+YY8aIY36jPUigxhEAEjBRlY9livb72fFae+1PyH2i1SkyHlvvrpFcKrc1Wgi+tWez4+8wRSqANvzJohjGMO/RQ30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
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

On Wed, Oct 23, 2024 at 03:12:00PM -0700, Matthew Brost wrote:
>On LNL without a mmio read before a GGTT invalidate the GuC can
>incorrectly read the GGTT scratch page upon next access leading to jobs
>not getting scheduled. A mmio read before a GGTT invalidate seems to fix
>this. Since a GGTT invalidate is not a hot code path, blindly do a mmio
>read before each GGTT invalidate.
>
>Cc: John Harrison <John.C.Harrison@Intel.com>
>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: stable@vger.kernel.org
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
>Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3164
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and applied, thanks.

Lucas De Marchi
