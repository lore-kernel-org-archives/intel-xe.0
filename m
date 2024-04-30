Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0F5C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 03:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A010010E230;
	Tue, 30 Apr 2024 03:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5KrBnT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1618010E230
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 03:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714447709; x=1745983709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FIRvLUcc2vkW27HKegryDlHv2hQKOE0EEvUUD40+hVs=;
 b=f5KrBnT8ULlPEgZAZDC0lgZI/xibtW7msjhvzyV7OOCd1ff437D9eJrv
 DPQjVTJGQsMpDsLr9Ve8V/WGcroZNjMhMX8O+UvyHF9hqpih/xkNHWKyf
 YBKpNZ0G5tP+GWFMIGTYFgOQejtHGP/h9Hmd21/EdMc0W+TfiSKM/aPTI
 rnKt/vp7QEygYF+d0L68+9AIR50MIZI3D2A2D42QqSq5ADCU+A88C0RGH
 z88SIaY/9S5hDZehFbhbhwIkPX1yKTYd00uElI0LoIG6T1anWtmEkWo/r
 HCm4gSV8UhikHz8fY5fv8omlzdrYcPkZxpqbOIGvBKKxva3qKJXLATxlN w==;
X-CSE-ConnectionGUID: s1rKYPt1SiWhOo6xLReDQA==
X-CSE-MsgGUID: yZoHXG8AS3Oqg8bRFrY1kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10252755"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="10252755"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 20:28:28 -0700
X-CSE-ConnectionGUID: KR7yoCEnS/OdVNJ1+PP+cg==
X-CSE-MsgGUID: SlQ0MANuT5OLX6Zxo/aTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; d="scan'208";a="26298305"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 20:28:28 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 20:28:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 20:28:27 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 20:28:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFxE+yJYzArgl1FqYL7EuaDQTUUmO5YL/tGukkoI2dsr3InWEGCXITJ9/fi0OnE6B8VpQyoNkOsaYeGojk1g5iYdqIB1ShM7zEPgPbPvUlNjkeFdVyTAF9Lgau/ka2k60dap8lM06bkODSuUzw5oCf0EPMCpUC6hFNwezJ0aKJGyMnTpTxBvEs/vUO5zu1xV7tdBh+uSZYYqwVopcT5GbSZDn71ABp9f/mBYrxHjpO7wh0IIE66a4i+o1lJEfuayZR79JSqYeq8NlWQcxzBvBjE7nAHTKquK///RVhUgj/bOWey9eIQ16uqoe6ISeCCRcrWf5QCh5baEHqgJYFN/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONa4lfLSTaa8Sqb4+wl09nL7RLedlQ1uI2z1Vn1PLgw=;
 b=EFXn5c+ifmGzwge48Yv5a3xD3yE6rKc4XNlfzDahcnvaKK3Bn0jq+0eat3STEdXz+uXDzQAaZmkSx8Ji9vWQ1Gyw0eU2udsvCmnFGBe2+uaRY8RPRNujrEqUAtAmT4uTduODRiM+Fj9PDRCb3kn0lv6FkhkXTq05y7UNBeW4FArLdb938xgV9hK61vuEZStrqwzN9guB0r/Fq/uvbP+JY+rUYCKsM1ba5mqDM6Am94D8NgXzX9J340X+5Eh5l/CXB0A585Uw+VU1RgiUmEED7+yasFZ78YAYBlGw1JxKqADpEu2WaFNfZV6dhnrRp4dvtHZr2ySGruimVITB6g8BBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 03:28:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 03:28:25 +0000
Date: Tue, 30 Apr 2024 03:28:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add engine name to the engine reset and cat-err
 log
Message-ID: <ZjBlUXTVmuXq0v8z@DUT025-TGLU.fm.intel.com>
References: <20240425121856.4500-1-nirmoy.das@intel.com>
 <ZiqW68FPS+vJ8TtR@DUT025-TGLU.fm.intel.com>
 <e2c55678-55f8-4ee8-9be9-f941f29f7724@intel.com>
 <Ziq9n0f24pKHCQTN@DUT025-TGLU.fm.intel.com>
 <2a989da8-26ad-498f-bf7d-19796eac2fa8@intel.com>
 <5ce5dda0-5de8-4619-bab4-5875c46d9c92@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ce5dda0-5de8-4619-bab4-5875c46d9c92@intel.com>
X-ClientProxiedBy: BY5PR20CA0012.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: ffacdf1d-c334-48de-26a7-08dc68c5986b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ynK6u/GI9tS2C+fhodYld8iFjYIaZB1Y/4n5ZcYRz2+b8mG1G7HJk7cvtD?=
 =?iso-8859-1?Q?4TX7V2YqXyJ1ErT0lTGvxtIG3RlcUfpwL3dPeZs7UwkIIAzEK1IOfwgWLj?=
 =?iso-8859-1?Q?QszG0j6JdAyHmmcJOnUu69ypKkRwDmANDQN+SMV/CMjFkPFzCebNdU2Q0Y?=
 =?iso-8859-1?Q?2Ca//5GGKvLlgVJHYJy/mrlaPrHxlWYJEGyASqkcJVOqFE/sdRC6x5PRtp?=
 =?iso-8859-1?Q?aNkh0AQJiXbbDiRZw4si6Is8/xIo5ZtkmhavnXOBZZ4OpNFZrQ+wtL64Zr?=
 =?iso-8859-1?Q?v1NNqGHIJVMcH7w2zjSqGuSsEztzvphHMbJ7nQ7s479jUalZB0bWXKdl3b?=
 =?iso-8859-1?Q?rmABCT7iKeUW6RNWnigYWiOa/B7RitFPqdQbuziYznhM3os+9IIxOxOMro?=
 =?iso-8859-1?Q?MVfFUlFWnmzUx0KacIWPUUC7/jBuhYzHLMWIDzYl6w/0Kl3NhuHmTkjZot?=
 =?iso-8859-1?Q?4NbWoe7yMV5MCD9KalTmXen2jsjAjxAu71Dgdn0AXct3xmZAFve7FjYtfj?=
 =?iso-8859-1?Q?VL1k2yXD/t8uCrVy0l4SUcwL7osjxkrl9teNTdBqWJPRngcJbhFJVRcOua?=
 =?iso-8859-1?Q?MK5bmwzCYZdV5HQNLRRJl4riNQ+nWAmFn70kpDTEzM+Wxs/gay+Jk1UiLZ?=
 =?iso-8859-1?Q?hTkqogs00r994o2mkrc3ixLeoaLoTtfG6NmzZ0vM6syY6kfcXJW52DduZQ?=
 =?iso-8859-1?Q?HbaV8akwdKpu2HsI4MRQf1DczLBbJo2fRI1xpeWoIkC8rBwbJrfqQkwiMT?=
 =?iso-8859-1?Q?m3njPB1EQPXQWTxAF11F7eH4eOJ0T0jKfawgrf2BWHQSAQ+urYZPOTFPdq?=
 =?iso-8859-1?Q?hTpaKeNgAcw/BZS0RtrQ3U6WuToHyIT0aELdE9/CMWK88FfqBCW2B5sHgC?=
 =?iso-8859-1?Q?nO7ZX6Jh/TJzo5qt4COWVRNcCIB72nbLWdGXg+I2IRIE3yf3jl56mzlNKV?=
 =?iso-8859-1?Q?vCl+hN9w++OX2KwdFQccNTvYlnfZHWP1fmhKRffFO5iPZebr0UhvXPTg41?=
 =?iso-8859-1?Q?9yPH6pNM0KaJCVob6eeuSS2RMq2CYr9wf/a8H5zE90UEXIWOHje0miTDd1?=
 =?iso-8859-1?Q?D4cAvjlmJNT4X1sWGK8tU42H9n+7nNqAJ3QFEP+B+ATpzezS1LFdKtFHUl?=
 =?iso-8859-1?Q?qQ4fzzRrwwPSV+HNERi9q1OwJRLd/XvYOAOKJEo68P418uwTEXirYJcoir?=
 =?iso-8859-1?Q?4UWe+74O6gZYk8D/UXFTMfnoeCv5W8uDiORBvH7LS1C8DKRB9oPdgjqvgZ?=
 =?iso-8859-1?Q?dKSTLuPE4zGh1/79nI6D5p8/m4wudGjESQy9ZyKDnngwoBhnNmVxPpoXU3?=
 =?iso-8859-1?Q?9yf0F/wOjVp13SdmJfXlOqgWKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WxMEH4Ezjp36rJVACZXgXNQzfLL7ZLMO+K04usQEuIzZZZkroVkdeYRD0s?=
 =?iso-8859-1?Q?BknOsoCEU8QNWw5JTiawDcf4wfcEDShpNReRE8fkz2UrTvs2wvqHK+S9/c?=
 =?iso-8859-1?Q?gwgyBdAevsEdFUn6nZn2kwYZMiI+RFK+mi9bpkAvw/4UObqAP0m3WuXchi?=
 =?iso-8859-1?Q?dDmbBt5EipFoa6bEy2BKowHzbPtXq797U4Hrd5pja5jzUVYbRNx1T5qyo2?=
 =?iso-8859-1?Q?V59Y5Ej8DA7dA33hUgCY2m4Ve3f6s4MovAtovthYtY8zRMpf/FNFcT4PqS?=
 =?iso-8859-1?Q?unuTqRPcCt0yAckKDKJ8uLbCuINgXynq+YBo+ZXzUIcGg8snaSQbdEIcRD?=
 =?iso-8859-1?Q?2wN5RPbD0eW509fxQ6ayDi5KoA6ftOY5sJTJc6BNbPNG4KNyUE87wV7Xad?=
 =?iso-8859-1?Q?U8XWf2188QTdr+80qNJGktCFOaUTkPDygVC5YEAaqzSJnhwluGBT9+EbTt?=
 =?iso-8859-1?Q?hVzU3Breb/oXm0647QkFS7XURGpuLqx0svU7C2aAqOxMZRylEA9ch0GsS3?=
 =?iso-8859-1?Q?1Od0y91d62wazhgIHFtRHS/ZxlglLtPO3w3QVCIjSIzmfMUtGJvc1BYVHd?=
 =?iso-8859-1?Q?y7oLDc2RjhG2dEs/INdeZVtY6wpqRKoL5s6c93TX82HOxls2RHbjiwRJn6?=
 =?iso-8859-1?Q?V63ByQmViLLKlTdeR+x3rxmu5O3cB5dXNmsSkjW9KNPD34HiYqPZ9oB8hE?=
 =?iso-8859-1?Q?mZZxwMf5YMRcEBMZs88acmPTJln5H2t6d7NKmOoXFCg6bFOl+FbKTSaFN7?=
 =?iso-8859-1?Q?u748t4DXJvfo7BVS0krWjLfEwXISo9zV9MunXhLfHsIiHcsW0IFzdn1S+J?=
 =?iso-8859-1?Q?Nnz2TNqu5ti3iK5gKb4JJfmIxW+gjFlFLkDP3QGWw2ckukYO3DiPaICd41?=
 =?iso-8859-1?Q?F58md0PkIMtses0lP3abd7L+ubVdJN7BRlLcQ6IPKEYRLjuc04jFA/VTro?=
 =?iso-8859-1?Q?sdmCwPJSU/agYLHHZ0CUjwXL8LHgsDnwpQ3e9DR80shOTPqg1mGmXWrPV9?=
 =?iso-8859-1?Q?BZeD9/Y4fSgk/yQOojyNAdCfUHn1wqKPa/S3RIt5v5iP6vYs1h+omaJRhr?=
 =?iso-8859-1?Q?3zR8NngXIC+WFpnAmJDjocf1huBmF6r1kbDruMisDXUnZzi8cY6ZhhVUjo?=
 =?iso-8859-1?Q?O12anq4Qfq6fFhnGo9QArepX7QVqUdElrIhLrFwuBn38ZUHWgvn2vRj6C0?=
 =?iso-8859-1?Q?Dqa/4/PQl/Yec5mZk9gQIyomgsz0GQrHfoLdd6xaRmdvOnh35c5cnsojW+?=
 =?iso-8859-1?Q?mIGq46hA9qv0XcE808TTrzsZqyIbs08tn4eeEy9+b4WUmXWAbortVpGCMK?=
 =?iso-8859-1?Q?LPluULVpTOIvsyhoYzd5W7oyVTdfL4fTYXVayIpUor/pEJIBtvCO8pwL0x?=
 =?iso-8859-1?Q?+VH8D42I9EAzULHESeY24v9CbdKdBWhagPYCnOdbTUCayKFoWWwHs2whjZ?=
 =?iso-8859-1?Q?f5PmaRqzEPD4jQpWJsHePqKP7K2SM7C+/5BGW3KyeBZDuvUv5WUrng1/8l?=
 =?iso-8859-1?Q?M6idKUTQ0D5+eGG9oaBd47b8akNUyqPYbku0YdCW7Icx7QtAUDp4bkj0xZ?=
 =?iso-8859-1?Q?DG2tTRIFsqt6yPm2HgcYJtvyuGPJyrdHI8BnzVOVmC/WBXi4xR9OcNq2AI?=
 =?iso-8859-1?Q?ZOU1ozjqaL9VU4otIFO/Jx0iWRNGk4lnlxjnDGUFcMKfA3bwd1+9rscw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffacdf1d-c334-48de-26a7-08dc68c5986b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 03:28:25.6102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blFt5uUnBNoNchk+fXQt/5jo4qVgb8dt7WwbKdRjLG73cUEPJKpCVWgtTVe0KzUce2KUGWyHrJpIM1kQqzJdnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
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

On Mon, Apr 29, 2024 at 02:17:31PM -0700, John Harrison wrote:
> On 4/25/2024 14:16, Nirmoy Das wrote:
> > Hi Matt,
> > 
> > On 4/25/2024 10:31 PM, Matthew Brost wrote:
> > > On Thu, Apr 25, 2024 at 09:11:22PM +0200, Nirmoy Das wrote:
> > > > Hi Matt,
> > > > 
> > > > On 4/25/2024 7:46 PM, Matthew Brost wrote:
> > > > > On Thu, Apr 25, 2024 at 02:18:56PM +0200, Nirmoy Das wrote:
> > > > > > Add engine name to the engine reset and cat error log
> > > > > > which should be useful while debugging.
> > > > > > 
> > > > > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_guc_submit.c | 5 +++--
> > > > > >    1 file changed, 3 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > index c7d38469fb46..245e29d095c0 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > > > @@ -1655,7 +1655,7 @@ int
> > > > > > xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32
> > > > > > *msg, u32 len)
> > > > > >        if (unlikely(!q))
> > > > > >            return -EPROTO;
> > > > > > -    drm_info(&xe->drm, "Engine reset: guc_id=%d", guc_id);
> > > > > > +    drm_info(&xe->drm, "Engine reset: name=%s,
> > > > > > guc_id=%d", q->hwe->name, guc_id);
> > > > > I don't think q->hwe->name name is useful as it might not actually be
> > > > > exec queue is running. I'd drop that, and replace with
> > > > > string indicating
> Not following this. What is q->hwe->name if it is not the name of the exec
> queue which owns the given guc_id?
> 

A hwe is a 'struct xe_hw_engine'.

> Note that the notification is officially about a context reset not an engine
> reset. The actual implementation mechanism might be an engine reset but the
> intent and purpose is to reset the specific context as identified by the
> guc_id field. That is, the error report is not that BCS37 failed and needed
> to be reset, but that context 43 failed and needed to be reset and the fact
> that it happened to executing on BCS37 at the time is more coincidence than
> cause.
> 
> If the q name is not meaningful and just some generic string then maybe the
> better fix would be to make that name more useful?
> 

Again that is a pointer to 'struct xe_hw_engine'. We could use q->name
here I guess which is the class + guc_id.

> I would also change the base string to be 'Context reset' rather than
> 'Engine reset'.
> 

That old nomenclature, 'engine'. 'Context' isn't used in Xe either.
'Exec queue' would be correct here.

Matt 

> 
> > > > > the hardware engine class.
> > > > I will resend with engine class instead.
> > > > 
> > > Maybe include the logical mask of exec queue too.
> > 
> > Will do that!
> > 
> > Nirmoy
> > 
> > > 
> > > Matt
> > > 
> > > > Thanks,
> > > > 
> > > > Nirmoy
> > > > 
> > > > > >        /* FIXME: Do error capture, most likely async */
> > > > > > @@ -1690,7 +1690,8 @@ int
> > > > > > xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc
> > > > > > *guc, u32 *msg,
> > > > > >        if (unlikely(!q))
> > > > > >            return -EPROTO;
> > > > > > -    drm_dbg(&xe->drm, "Engine memory cat error: guc_id=%d", guc_id);
> > > > > > +    drm_dbg(&xe->drm, "Engine memory cat error: name=%s, guc_id=%d",
> > > > > > +        q->hwe->name, guc_id);
> > > > > Same here.
> > > > > 
> Indeed. This is also not about an engine failing and create a memory error.
> It is about a context attempting to access an invalid address.
> 
> John.
> 
> > > > > Matt
> > > > > 
> > > > > > trace_xe_exec_queue_memory_cat_error(q);
> > > > > >        /* Treat the same as engine reset */
> > > > > > -- 
> > > > > > 2.42.0
> > > > > > 
> 
