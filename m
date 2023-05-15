Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D58C7EE26
	for <intel-xe@archiver.kernel.org>; Mon, 15 May 2023 13:09:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B90C10E1CD;
	Mon, 15 May 2023 13:09:35 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7E410E1CD
 for <intel-xe@lists.freedesktop.org>; Mon, 15 May 2023 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684156172; x=1715692172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a6S2Gpkr6EvZ6/Sq/PaqInKnVDVLqCXSbyf1jhuYqtI=;
 b=dlx7Tw7hopKxJ5q5rKFgKc4hz8fJHnCq1jOZVTPPiuL4WMjpcKAOZSvf
 SHuCeQyVIPUrFG9WUa5qtXMlhVWXJYLvis3YhlH1I41UGCcuLebHn3kNA
 1jEQ4ADfeQPm8e4cLRJJxMO7/K+kIdL4rAZMni5NdmHBsAnUFOn7shmtk
 u5M3NvB7K1dwEk0BKV+6yLyVf2n/mg7FWG8EeI+Xl2CRWT2wTPUD6yM5I
 BZruvR0y1nJt4d5rFEFxgdELUVvrJKfkx3J5Iq+uGQ2dfvbd3mg8CnV+/
 Kq0SG21lJ/FJbLv6QU5MSFuJtNxfndcxZgwyCvWgdje2s9bhT2Ed5fICd g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="350034710"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="350034710"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 06:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="1030904270"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; d="scan'208";a="1030904270"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 15 May 2023 06:09:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:09:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 06:09:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 15 May 2023 06:09:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 15 May 2023 06:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmvZUagBSW+t+R69Hrz858qBVKBQOn9ExBmIr2kut8tUS2IbQilXsx5CQ5jXjdBWt5lMP4HU/iqQksoZlqyExSxtsjrRiSlCsummRY3WVvofIqishsHnacMSpu1QuWCIiAYgQoVT5LrSAiGLOIwipcHZxaJ4VO5+j0jnq8mp9A2gnGSOV6sShltM7th6YBS0n10vnPbMCmMpKRUiTroqrg60yYR68ZQmQ6KQfRPE6x7AjGDN8YTyWfauJlkEGu9mPWa74n0QAnEWuljlBXPf09X13OUeaKWlwiG6Z66JtpzIB3y/CuWej1YyqxGUlq9fGavT0EorApe4UHgwvWwnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kydv4cs5rIy1/iVZ10I6JeqeeusFnUf9j2T3sJEiA0w=;
 b=SyZg6iP4i5jNDGKtLUhYCqvClZ/Y0p8o07Si6YXoVS5tvwA71I3VfFGmpf0OwU6FROZfeK/A+dk9XM0EQqgWEDzQWKT6QAVHLljfI97d9kGOTbuJaf7wxwlybFBuxQuV5kaE7W/IthRM6zji014I2aN5xA7N0YqkTq1pxkduuVpIxkRM2R4b7awPK76g750CBvb1i8/Nxg58zx8cO28aAsOZfS13DYgWLjs7KkrhThaMtacUkxx9D71qJkVooTb01nHKf0GO7O3czAFn/yOGoUpxxgBHeY5XO8QoxHjvCFpdmE9WuAHYHMogBGpEeU6CD4EqHdrSmR13aycC0OteXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8210.namprd11.prod.outlook.com (2603:10b6:610:163::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:09:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 13:09:06 +0000
Date: Mon, 15 May 2023 06:09:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <njrytadrmzfwedendeh7uywl4lc7lmwqo4bgefs6fl5cbgrxln@axrqkor5tplk>
X-Patchwork-Hint: comment
References: <20230512180313.1765011-1-rodrigo.vivi@intel.com>
 <20230512180313.1765011-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230512180313.1765011-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0072.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8210:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1edbf5-d863-4363-7726-08db55458ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JWbu9hxgfFypSoUs1bYfpkpadZnTgi3+mJ9Z129pK3OUZbr7yDLPv7h7+O79969sPkcAKkgXDLLXTgKvOFLnO6wxxZxFDvjKChMYBbKM8M1kZ+tXaa4q0l82SR9DpgK3lAgeQ8qEXMIgjTt4p91yLINJcBks1qs8HyvoUkYKaB8VoUHAIsNaHCQcyhXE9bhS6W58E2tJOEN+4NH9eC9X5PWoRrUD31iaRyHaRNmFpuzBNLywHmj4pX2aajQSnaABA3gZMbsXf01KlvS5PoczhHrAcleCEpgWrrg8fOJX1cNJ2MZI6QuNWklJRn0FGyANZaf7afq8oR6a/qQdPfTURHMutYwUqjCVH6um4R7aXsRx88d9qPuNEznNUb6K/dxWLs7o7LanY7PaQ4OdyGpuf25fTKlBxNXKKVsW2SxpQJz6fbUvI+RSi+N8sI48oORYKcRtiGwTo32Wstr/MlGzN4Re1Tioivmt2SuWrmK+ec0Xy5+zfbCjmNXRaRTSV7U3+FfE0gW7Ab/NFeleL/l1wiI8A5G8GB4hBay3PxshrVkU5hV8Ngo09v5ETOBTl/TX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(478600001)(66556008)(66946007)(66476007)(6486002)(33716001)(316002)(4326008)(86362001)(6636002)(186003)(82960400001)(38100700002)(41300700001)(5660300002)(2906002)(6512007)(6506007)(6862004)(8936002)(8676002)(26005)(9686003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xC49BIT6d8RVhylhIZpPczcvTGa6n6ITAVY6mvCR1OcJ4wSoSda96LjPqk15?=
 =?us-ascii?Q?cWy8rUpD+b2N46lBClYvckA1+ETEOzo+rlslUb6GGU7nZZl2vM1FHMgxgcGt?=
 =?us-ascii?Q?/3PF1zpmMZcrNFKulv4/+41cPvpHOBZzCPFjZ6Ys8zJe+2tpTkv27F9pQCFx?=
 =?us-ascii?Q?JIAqEBuH9dmGq3rvecwa7MWeBGfuLs0lIVzlHZg+97/uSoQy/AkbXVi7Q6FD?=
 =?us-ascii?Q?BDIFjT4bW9gCjTmlSRb6NzF/1gMGlR+lz/7ouJVvgbVD7HXqf2zSxFP4zzwc?=
 =?us-ascii?Q?L5eAvQx0Aa1GacpjNn0EjDDp3wz5PXq1UqnUPmemeV0qaGfUthATXkUL32KL?=
 =?us-ascii?Q?CwrMRQiuFyuQLCCVwuBv5adjCS0caO4Rj7izSnDKY0sIWAN7T82eqJqyaoiG?=
 =?us-ascii?Q?Bz8vCEYwy4kVJYPmB38hbJNvcr6KSzO5uuA5LSDcAXpI4ut/lwygZlDpo1Lq?=
 =?us-ascii?Q?SLP+n+SUfYeP0Aly5qhup+r7ZA6eYobHDZZKDkKNlV1btDXL6JtsKntG/a2N?=
 =?us-ascii?Q?Y9PGEbxf1KFgUqriJIJ4kVpHuyfArQpC6pHrmemgsOboDpYKNCIFRgBiBdAA?=
 =?us-ascii?Q?Evv1bD7mmCXOqj9apO/3PZpadoSMypcAXz8yVarEX+3AAflC1Nw5NlG+G0Mu?=
 =?us-ascii?Q?r2Na1onsRKoEHB3ZeldNGrve4J+AuaRoVz3U3N9h1JhsERN1FVvEdo7u55Uv?=
 =?us-ascii?Q?VFruwyh1C82AthmjzfLmfa45BvSW1kqKhWpyIoyS9q1Z2YtsDLpltGn5oO0H?=
 =?us-ascii?Q?ejHvaIsB5dYh3pVC+1NamA9HBkZIKsQoef4PMwQNMfagMmkxb8KY2iv011HG?=
 =?us-ascii?Q?fiS47snubkmzCPg0dr9LShnbFV5ErJecyh7oaZE6gU1ZQKbTbYXcDnrHnr1w?=
 =?us-ascii?Q?/e12FZdRB/Hrd75ePKjTyWgl9hD5W/bFqfPKRUQlJmSb3Fmv8d4W+HhBiUE/?=
 =?us-ascii?Q?8y3m1Z7z40naJlYotFOHbAUSqn2/lZz8ftUvmkzqaquzKRR7fQgnSf27XP3I?=
 =?us-ascii?Q?irhWajct3XfiPUcS5zdRKtDx8hKIiaZAj5dJR4qooJ57fzecxAzfyzkl65OH?=
 =?us-ascii?Q?rNz/BIF1MGzfHBxZnI50XPvi1LJ2Khxt7DnIeh4NlMk3IGV5+vULvL++TvOP?=
 =?us-ascii?Q?YupGo5uw4intD9TPFbbOiOFfqrf0dfqRSrIrxSHHglu+/rxnQM+fsqatRG7u?=
 =?us-ascii?Q?QE0wnkXbuypp8168ufFib2abn9NapNllLC4j6MwVazH+1O45XhMeAAmoM4/K?=
 =?us-ascii?Q?p/27wXEyRN2JGbjnJT9mAEGh+thMrQlt1DsAbyx3GW44YT3FvmFVLRRB6ZVz?=
 =?us-ascii?Q?LVNLrwr7V3zjkO5cnB6QwO3AiiDMHevYiQXLs4nh/1Bk2FFOEhfPuOKzU5sk?=
 =?us-ascii?Q?0qOfh6iJ3Yb1K+hVj81rWeMlip9IufhYLpGYroAsT1kt4IxmliaB+MkWWAxS?=
 =?us-ascii?Q?nxqVAR8+IU1vbHdysojN0yjBNespsc0ncWMwV5Ht2fsUDwdhqPcnBcH8DOuq?=
 =?us-ascii?Q?h3QNJ6rfaKIV/a2WZWUPmlTmNU3X8vk7oeiOgK+4QIGRGajfTuW7iXOO0niI?=
 =?us-ascii?Q?AbGTs3arxTP9KHEZXyyqw5OUSUWkIdq5b4ADbcNfe32bKnX5bDgHwRx5xWv8?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1edbf5-d863-4363-7726-08db55458ffe
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 13:09:06.2352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opQPvE84pB2uRqzktIV/S3dn47agd8RErT22hODz9XoDJ9lzntUEWJ0nQo24DkWyM/D21FqJkXqcNTGOWh1N7xuF2Vor+0dJC3HlTd83pcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8210
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/7] fixup! drm/xe/fbc: set compressed_fb to
 NULL on error
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 12, 2023 at 02:03:09PM -0400, Rodrigo Vivi wrote:
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_fbdev.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
>index 6362c4ce15b6..d89edd98e5d7 100644
>--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
>+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
>@@ -179,7 +179,7 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
> 				    DIV_ROUND_UP(sizes->surface_bpp, 8), 64);
> #else
> 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width *
>-				    DIV_ROUND_UP(sizes->surface_bpp, 8), XE_PAGE_SIZE);
>+				    DIV_ROUND_UP(sizes->surface_bpp, 8), GEN8_PAGE_SIZE);

isn't display going to be on top? It may fix the build now, just to
produce a broken build when display rebases...

Lucas De Marchi

> #endif
> 	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
> 							  sizes->surface_depth);
>@@ -363,7 +363,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
> 		else
> 			info->fix.smem_start =
> 				pci_resource_start(pdev, 2) +
>-				xe_bo_addr(obj, 0, XE_PAGE_SIZE, &lmem);
>+				xe_bo_addr(obj, 0, GEN8_PAGE_SIZE, &lmem);
>
> 		info->fix.smem_len = obj->ttm.base.size;
> 	} else {
>-- 
>2.39.2
>
