Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A69C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 17:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFAC10EFF0;
	Fri,  2 Feb 2024 17:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAcv4PhJ";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 17:00:26 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2964010EFA9
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 17:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706893226; x=1738429226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XIrmahf2QiLetjOtvRolr0UtQtGq+Ka4Tw6EnJr9Adg=;
 b=lAcv4PhJVJ5ditrbiqrWrPQKuFmu2zo5vSHGm13im55Z+eJCcVOEMZC3
 UH21rRi1BdJRyuyNYKfFUvmpIZAUQAXyobZqkE7MPLfv5yQd/BJu2ZbWX
 RrJbH3MGJcTiDq9IV0n72na5i0I4kAo6G2MFE44779iKlUp2iAy6NkEWK
 uo0hzYKUpnUKqAHIYkXbS6NFr7tvVP3q30wvK7D8IYahCbcHlgUgeG44y
 ZlqjO4OeLJSyBMfqJLjQ1H4kyJnTp9wSwPWlVjGYVwW/U1CnG+TZUmxlT
 P0PzuU2KMvPzv4FCkq0bZSCW/RkpFyS3odPpl6EFZXy34LZQIrUg1XACX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="104482"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="104482"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 08:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="37542645"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 08:53:20 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 08:53:18 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 08:53:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 08:53:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR4S0GQ45eKT9GnO/nUaP54IqTEO1RsekdaG10GjM/XiFZZGQZvg7VzU2KQKNK07+KWGjIAgVD5Bd6fsqqrBR6Hh+dOPdlPCqGvW9ZKSJvJ/iIvX5UrfExb2kqcH6w8nMpWni8M2bZznXo9DbPGNB/9WNQb016P9m8T9VP8bDLn9P5+jRO3JmnQh+vO3z+khWz1I8J0401bp73VGtJ+JpZRhhn/AB8Qbsn+uFhlsUPd0/0DL8IJ8GiJGdHRGQ6iqJU7ySWxWWoJxb2rX26vWIkJSffqk+PGXDE69IffkwhG6a0psYkutHH2GUzrC73dH0QX+f4nZIn+ThH5SBC+HIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hO4iNVh0GhNmXARrxG+tjjiMUuG4w2yXtmawLsB8X0Y=;
 b=GGblUOaU+ki+jbzOFiv4hKtOdvjHPqqMYH5l4lKkzWPBy9lrkwibzFW1/G7aUtDpTfBy8OgRGNhPhhhRCqzruk70TnqAUPfiQLv1VIEEpy7dC5DHGmqmhfFblNPaFOsTL7yf6qb4VSzEke6Iz42VJzl4s+GdBAn4kuCTBJ0Dm89/z2x7hb2pnECV8fWtimTAqJbfJHMC2ezsyn9hClqHLGyggkDzixjXceO0BKZEtbcA+H+06/Q9r0Nlwd3cfJvoAo75BKwMlZu4LMJonT7DCwO/u20wOKOcT5bvlSelvq+SSwDI3dgR2fZjBRzYowoDOGCNNqfD7vlH9W7axsEQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 16:53:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 16:53:05 +0000
Date: Fri, 2 Feb 2024 10:53:03 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/3] Update to GuC 70.19.2 and add LNL
Message-ID: <njcmjcrd32ztgxa7gwmgsmhszwsm5je3ojv7mfvpkmm5s7dfep@mqy2hfmadmif>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BYAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 593a33c8-5659-49a9-c7bd-08dc240f6d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PVlY3f5WnE4kjPjSuIuYsl0LC53/ayM37NWBQzdLwpOCp1ZosOn/suLys+iZhlGyB1JnK9XKsaho4c0MUrFSz8FXmVUSjk9v5MgTs3u9YvynzAoccL+UlBtwqa2hrFqVRzcs9jrI69PEgS1Gd27+4VPER03TK8qw25Gam6WS7GXmWWp/UAp/S1zgPVsiwOlINOSCCdGwdlUPN8EMaMlQCtv6eUg4fB8QaqsrIQLO1Sxad6X2R0ZNjcqhmKHPdaQ2ZYpV2mReN8nlOnBb7eT3uLImXv44nB70hVA0TtkvM5hAk6vCEmKCmOL+T0BTnvNCdA+yXgG8Go7T4cTRd8K/BIPb38ReBye27zquKsCy45ny/Z+KEHlSnBmdpXFFpg/x4Kvfm7BGFTbLXI+Hl5GR/xj06qPX2UwAbVhfETh2iT28fc3skAuP+NbuKwFDXz2OenAgyjQ+ylk+QsvoiTS4/a9quZmzc9gOxCtf+9Kb3MaNbb32Vvri0IjwIauDxLG0GID0MAkRV31Qb53MjFNOGthO/MMGq4foTIMWrtvpdI0AqpJVF+p+72uX96N82lDF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(39860400002)(346002)(366004)(396003)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(33716001)(6512007)(38100700002)(26005)(9686003)(5660300002)(4326008)(8936002)(34206002)(15650500001)(478600001)(2906002)(6506007)(66556008)(8676002)(66476007)(66946007)(6486002)(316002)(6636002)(41300700001)(86362001)(82960400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/6AMSNzxHY6bKDyfKVDZcup2VeaUQsbmh4FZfsvuZ6f40o+yhHsc677B4tLq?=
 =?us-ascii?Q?a/fG9cD2gVF2CpD8JLFmUeDP1SggRsgBoTmtLnDnZNOdVII4x2nx/3Ofv4gu?=
 =?us-ascii?Q?09Eo7HyIMnPobQQXQorxPtz+l/nRu5l4yzw8EQ5UUjefoT7YVeZ1RnTDRh1z?=
 =?us-ascii?Q?LW5VSUcfpa7cOmJIPsGHGdvIFmw36T2GxoiJJOaCbreaupdwAgu4xqPGke8S?=
 =?us-ascii?Q?3syCR05cPyfIabStOai5vcvVDMPRlaFITG8StFITLuEp+hIKVWC0zzkMCxV3?=
 =?us-ascii?Q?KxXSxIa+sv5MRFysvS6wzngMDUIU1WCUnA+0aVcnTblfY5pA3xuH0HoppjNv?=
 =?us-ascii?Q?5MuI/zM2tyZpvEu2qebgC2/GyOcFJk3CwIFgKsB2uc56hJ7LSFbAwhbZUSfr?=
 =?us-ascii?Q?cUz5acCG4JM9IOwUmd3h3cLhUslbeBNhClilywviDm/pRY5+Ybg1iH1u72z/?=
 =?us-ascii?Q?5Fn2ToPwiRnIRQBdk3JAS7rDJ2sviwk7BKh5+4bJiluIJZoiuaUb6BTSA0F8?=
 =?us-ascii?Q?6opmTSQtyk8PqfkirTPB++1u8pFlk8ebSITVu1TGFiefU6zwkWwmYACp51jd?=
 =?us-ascii?Q?okVE8gJqdkioNQ3ru13EhnQxmecJae4/+Fz2Ps+5JJ0h0Bqzlv4Pqc+Vx0dc?=
 =?us-ascii?Q?lPnjYq8FUnHi5cBZwvj6LvcULtf4e5aZV3F5WxwuyqZ+ksy0cF30r10TL51X?=
 =?us-ascii?Q?+9FKsPYcR4YaC3sHLpo87H3yrfMgLS5eXGwf2Nm1cBRXKJFdF5uu7JLKJ1Wq?=
 =?us-ascii?Q?U4YkWZBGEHBQm/fHCHO70NzGn5gEoLpCy/5aBUL0K5BXpEhb+RLP0OiU6t90?=
 =?us-ascii?Q?/yj2U6F46PFIKauLwIhIBqgNMyaOJaPzhWZglAvs778VI/pqHbNZnVHa8wcd?=
 =?us-ascii?Q?Xu+q5QPNsPZ68vSkrTsaYQkcspqciwYViSB8fWg6qCKhAQMkN9uEXNzg9BDD?=
 =?us-ascii?Q?ZtwORcMe+9+zj1nVj/sdRanjhafjsUO3Vc0gZ8+FU/3Gm33+NMkxovYNIBY6?=
 =?us-ascii?Q?MHl7De8bkJ+UOFec0xpQw3xa9Dz9ya+6G1bw3gDltYYXyLg1W/QjmP6KRrA8?=
 =?us-ascii?Q?xJqSNh6xeR8o3I75pp6DT0xJLU6uqa2J2rkuAAofHu2+nYUxyOi6KO+AV4dj?=
 =?us-ascii?Q?sRkQdNz+iHpxuQ20sV8ejHFUw8PygOlcT6XNBBwv0MqCLHYzuajQRSEH3yBe?=
 =?us-ascii?Q?A8kwUMxMEMz8kQX49BfrTrogcrm6/gqCDr+HYaAwJvcp+qBjMSuiwTdn/eGB?=
 =?us-ascii?Q?Aw71EVm4yq3EWrM9dTs7xJj2wyT6NW1Z5sMZfM0bd7uC2/Cr/9dwXcB2IfuV?=
 =?us-ascii?Q?ZZGiDiC+54lXVSJK3eYedwpQojh4HJyfqS08/uLjZxrzKhX8UirB8eRm9xN+?=
 =?us-ascii?Q?mJCt+HiunWZfJkuGNJcRefNj8HlQy+2S/5X9PKXZOXm95o3oQZJ1GFYwIVQj?=
 =?us-ascii?Q?/8cza2q+e6k6clJvjUj25EXZ9mY5JEecYOXOyDq/C045NIEnklQ7HV54lb/w?=
 =?us-ascii?Q?8jLjXYsdtSPwcB+Wx6O0fWG+pwP7cK1qoXJwCf2pqJgbgTjp6WOYXJffG3XM?=
 =?us-ascii?Q?NsSJKbGkozbR9WV1M0LQj+oP5ooLHZrAK/gLT88LcKLS20zROduMfBDtw0d8?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 593a33c8-5659-49a9-c7bd-08dc240f6d4f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:53:05.8424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jsv7HhOeeuKC+7scUmHN+3EqyCkMtk42cpm4044ZHUDzaA3InHcPtFtD058fm3IN29GQNZDY5daZNnWGwIYo63pw8Dhn1luak39c9rFNUG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
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

On Thu, Feb 01, 2024 at 11:30:47PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>Update to the latest GuC release including the first release for LNL.
>Also include the patch version in the expectation check as it can be
>important.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

For CI to be able to test this series you have to do:

a) be on top of drm-tip, not drm-xe-next
b) revert the commits from topic branches that would conflict

	e4cfe0cd9819 ("drm/xe/guc: define LNL FW")                
	6fed16fd875e ("drm/xe/guc: define PVC FW")

c) Add the patches you have in this series
d) Add back 6fed16fd875e with conflict resolved and mention that
    specific patch is for topic/xe-for-CI only.

Lucas De Marchi

>
>
>John Harrison (3):
>  drm/xe/uc: Include patch version in expectations
>  drm/xe/guc: Update to GuC firmware 70.19.2
>  drm/xe/guc: Add support for LNL firmware
>
> drivers/gpu/drm/xe/xe_uc_fw.c | 50 ++++++++++++++++++++---------------
> 1 file changed, 28 insertions(+), 22 deletions(-)
>
>-- 
>2.43.0
>
