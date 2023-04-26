Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3479C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 26 Apr 2023 00:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DF010E844;
	Wed, 26 Apr 2023 00:22:41 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CAE10E844
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Apr 2023 00:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682468559; x=1714004559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r/VDYK2Wz7Az5gR4NMU9irU4fiDacJwWYB5sOKAA+M4=;
 b=a2yj41XTdTEpRI/USmNUbB9JCX4vd1pmB3BhmsDmMXkOBheKc0YTGgkl
 CeaLke3kfWSI7xHT1/h/wGzuyq3ON05bcQaf+573/z0B6ikwF+nactEnX
 QQySlIqJLwGZ1KFumElR6cZjEft3bbQinL9A3gfRlMQpFlj0pqR6k+oCP
 3tnfUxdPv/f586NKWyF6L8/sMoHJGh8iA0s9++CuM16xWBD3Nw15BQ8NO
 dGhM4umG7NV+x/uUj70XPZ08DGmiZmYoVgChF4sqdej7qCdxIrD94oVP1
 GHjIEcwd+c22gp0GQO7TuSqE62riZkJjqF/YGrZ3zoIM6g8oqkWJoAhLH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="327262316"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="327262316"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 17:22:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="696403470"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="696403470"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 25 Apr 2023 17:22:39 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 17:22:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 25 Apr 2023 17:22:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 25 Apr 2023 17:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAhH+MgCULOHApb6DERfsnCBgctYXu/roT0VjGtH8j9VcFigsGyHOP8uWkUWeRRJie3ggkYhM2RZ1XcOvg3sFmi2dD+Lptl6nUH/jCGRQInDKh6ub1Cnj4fc/upGBv5IZHN8eDW7RkP0GpnLwRYZrfiCFxlCJKMbvSAIkPdwEPctOGo0bBblUVHd0xq6iDHJAoy/N0wDF7D/oPOksJdgxkFbO3z0u/lBExF6oX6gcoM78ZmvY5Tk6eg8MxWtTSPFpRVFINXZZji3z7yP/en+f3nXSICWA83PNp2t4uWU+57bHlN9MbdLLozUj7MZzNUBccZgJLzb1g5StH7vB7YI9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TXHkhlV1YF94dWOzW9a93FPgVzDyY5vFLw41XeXYulc=;
 b=C4FJ7YnunrsNSJ/tBzcoQHo6k069BKRB9Iss97n04FZCTmOtreglPOS7+88YYuj8UUYe/6US6nnkK/rOlXuFk30dTW7G5VR+2uHsTiykYpXTY/a+FwkVthksuFXd1PjQ1TMIwj6VVfkxrKvTWVcOjlKsbu2pJQAlbm0+E/dKYAPqhkSxQPVOyy36VJQad68EdgN3z1zNd/NuGGwEoEfsHqs1SaB4QWz5QpXWNsZ9mw23hdENklA5RcMxYhQmFwtfvrskukFohbXvjtjwjTKHarK1twfyrFX4NCw/asOdLyl6vie8SLSeMOg+Ut8T+ibPFe/Vz49dh2Ywzsg3l1WTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5507.namprd11.prod.outlook.com (2603:10b6:610:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Wed, 26 Apr
 2023 00:22:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 00:22:35 +0000
Date: Tue, 25 Apr 2023 17:22:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <tximigyq6m3h4xnwifsyyshbf7eposlrnmetcusstk4b56lnvb@g2idj7bro7wj>
X-Patchwork-Hint: comment
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-13-lucas.demarchi@intel.com>
 <3286caad-48f5-01e0-6e15-4e15c69e3a3a@intel.com>
 <fk47pjv5rnfsnxac4goeqhwlolffa3wnsyejjn23b2ji2ud6ma@llik644c37ma>
 <475b902a-b734-53b6-cab1-4a78838a5a68@intel.com>
 <jaoxg7iio733vdhbfxeqrl3efq6dt6ojirbcvtazcg2sepj34w@6z76cml323df>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <jaoxg7iio733vdhbfxeqrl3efq6dt6ojirbcvtazcg2sepj34w@6z76cml323df>
X-ClientProxiedBy: BYAPR05CA0062.namprd05.prod.outlook.com
 (2603:10b6:a03:74::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5507:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c86ba7-0a76-4e31-3535-08db45ec55b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8p3WP2bhLqOwe5PLpka25SIa+4/QyhJUgG77QxcH+MEgmPlcX2phx1PGRleFGKhj+cgLxhxDl1QdJoOCAFZX6yeWugalnyPQtwQ58SKaz82aQkY5NX1hAq3b6YIQsl+sRAZ141T3F2mC8RQrbAaOXODVGdbim9fmIugaLcXNXixD0ZSqwU+52EvQCQqdkYHsn1Ok1H6UukqJa5ki/T3fgxNMt1wRXQXPSJMAQ+lg53sNH6oh4YgwdoROGUzqgs/+onxIrcSla0Nl0XmhLxr6EKpixuPAm0wHlLF5DePxzkjoddMq+9ipSXUdvyWNYbfU/84GRelnipszy3LdLz8UVJJNcLgMhUY42T5fUdEDhWNA/TMS2UpL2uc55J4rfwzlS9qcQq5Ov/s9QHVGvnK5X444xRYLi98cswFUcdeMX8lG2R70INX5iSwE2uFBuATJYvVz5Mx2tKn3ZIuHKhGitMck/XTYjZmNs4FWsCraR5nTzzAz/sL4sizvLpzk7i+ZC6k8zYirBuFDWbd/kwi/B3GW0tRVggVNhn5yk6jHKdett3Y36QqACfETKRUi1c1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(478600001)(4326008)(66946007)(66476007)(66556008)(316002)(54906003)(6636002)(8676002)(8936002)(6862004)(5660300002)(30864003)(82960400001)(41300700001)(38100700002)(186003)(83380400001)(6486002)(107886003)(9686003)(6512007)(26005)(6506007)(2906002)(33716001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wjuQhLySJVn8+W6WU8GJ2s0CRNMKL72nSjmuvKCQTvexsiPD1cT6TutIGJ?=
 =?iso-8859-1?Q?wUjQq+QtrL/J8k3nNOrQ07F61BPiM4lYPZaE9eWS1AbWbfa7kp3BmosQUp?=
 =?iso-8859-1?Q?GRy0mWTsGNfPUkekZn+zKPkY3ddl9vjXtrQKwpNAlotwyCzwZ743IPncDx?=
 =?iso-8859-1?Q?gXOiPEDC6boH7Vk3j30ufq271qgyV427M77p88J7FIKkr4UQVTB61837jH?=
 =?iso-8859-1?Q?Tin30veNBpptc2m/e8OZ7OUYbdQe2hqkINrAZYLcCGQbi0u7PCCzpnaT/m?=
 =?iso-8859-1?Q?XAvktdE0MHNYLRxsvtD8+PZ/xC+RLhxonHiDmQu/P4OSpny9eqp27ox/Qi?=
 =?iso-8859-1?Q?DdHcc0Yo/wtEpaR4I/VznGNmT8eCxAoQoMvTbrUudFEo5w9mQVAbC8SWaI?=
 =?iso-8859-1?Q?v5Jhbz5OM316ZKt50/XJ7a3iyav3wtut7RHioiR0pOF8mQ88thuqXyVM/Y?=
 =?iso-8859-1?Q?6XqkcKIIZLUvWEQQMR/pD/LhZnnyfwX3HABBkMw86kWXOxKU9Y2Lcr9BkE?=
 =?iso-8859-1?Q?rKi7dtfG6Y7QEZYywQaxm/JHB//uC/U2Du9BJ1pBukkquwpOJGCTobIQzw?=
 =?iso-8859-1?Q?EXJe+6w7taw5Tzyt5NH6bSf2EVhMCeda+8cY8NiG0HOfM8XA3U1LTHIG8P?=
 =?iso-8859-1?Q?6IN5MUjuV1TFaiAKCklNnyWgDhHNiqq8wMvhVuW9b1YNGwdbLMEmLpAiLx?=
 =?iso-8859-1?Q?7aAQdNuQxOy0BS5GSVWhqn97NOGifvzCQ5VM8a+vkaONRxi4Lb2LSdk5iD?=
 =?iso-8859-1?Q?zKOiMVkOnc7DIY95A7p8q57Brqd/FAt+89CS/ZpP1Z1V3jCn/eNYbX3ad3?=
 =?iso-8859-1?Q?HepdBArCAJwf0KfDLM+EJ3rt9o021uCjblTIEJUZowrEc15Pas/P3fN2Tw?=
 =?iso-8859-1?Q?yOWyHbl4qpeABrJKJ1SITa7IMx7bsC9s3E+Dfs6FuHg7a5do8id9bdeYSB?=
 =?iso-8859-1?Q?hs8AkPZxAHh/ul+HVfdOe8z/IFd9A0b9fMaR1NuHnG8OGFcmj9lExyUD/X?=
 =?iso-8859-1?Q?Zd4BhzM75yRjjOllchr69IptQpgvc4n6dybMabjslF1/B0aRcvbfKgWfzz?=
 =?iso-8859-1?Q?KuWCbunVVkiqdHaTCbyCXI+Ac8wam/gubUBeHUnXIxiKazL5sal0m5UZx+?=
 =?iso-8859-1?Q?hHwWmaDQemLee0K5gZl878/OppGGZ29nRKV5JDHXmOLe7QMQvr33oA03VM?=
 =?iso-8859-1?Q?nmHBY3bCjbgY1syHP+W4XOQqlT2ZQGtJosyfa0xf6dysvCokdfGX1Ee5GT?=
 =?iso-8859-1?Q?rbpgvnlL8A+XPbWzO6lrbbotQoDCZKzjCTW+DzsAkDfb6OUkGvgbZESGXf?=
 =?iso-8859-1?Q?Cse5sEBzeaBqW/pwSqHvozR6bO8NXVOrKCp6abKZomux2rihnGU4jCrTGq?=
 =?iso-8859-1?Q?krMcSa/FtbYBj2UmbjQ8Bmu8uQ7y087RxlRmXoO+tPoSQdeXAP6K+kMo/I?=
 =?iso-8859-1?Q?D/dcGR1N75sI42oSo7Oaw3jCeu22uDsOIA/4hi67vEr8DzVjKSitU7WSwV?=
 =?iso-8859-1?Q?hEvu41p2fB0dz9QmPQ6VFftnzoSsi8dvirhjaNF6KXBrlt2KAFy+asdaGd?=
 =?iso-8859-1?Q?H0xbfw/07eT7R2jbH+SUOBiBERqkpzYr5LbmoyCTYFx1fMYiv+20Fba6vt?=
 =?iso-8859-1?Q?UW+yJpA8DZ/jd69ma9zYY0NtZu4UTHrEPHo+rttx2tygyttV5pGTdBBw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c86ba7-0a76-4e31-3535-08db45ec55b3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 00:22:35.7580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULRHc5ItUzLdXPOrnQ1KaQKcKwhjmU3SOhSTTLTsgLOZD3T9hJ9Gva4+0GjplL0gL8/yjGsSEfzN4pfwDxSmffLdTw0z4TPoNFkG8VsEXDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5507
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/17] drm/xe/rtp: Improve magic macros
 for RTP tables
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 04:13:10PM -0700, Lucas De Marchi wrote:
>On Tue, Apr 25, 2023 at 07:00:31PM +0200, Michal Wajdeczko wrote:
>>
>>
>>On 25.04.2023 15:17, Lucas De Marchi wrote:
>>>On Tue, Apr 25, 2023 at 01:03:54PM +0200, Michal Wajdeczko wrote:
>>>>
>>>>
>>>>On 22.04.2023 00:32, Lucas De Marchi wrote:
>>>>>The macros for writing the rtp tables have some downsides:
>>>>>
>>>>>    1) They are fragile, and when making a typo it's hard to know
>>>>>       where it's failing for someone not used to them
>>>>>    2) They polute the global scope. The CONCAT/COUNT_ARGS/etc only
>>>>>       work because they are defined exactly the same as the ones in
>>>>>       kernel.h.
>>>>
>>>>hmm, I wonder why they were defined locally in first place ?
>>>>Can't you always use definitions from kernel.h ?
>>>
>>>I didn't want to include kernel.h for the 2 macros it would use
>>>when people are actually trying to reduce the size of kernel.h due to
>>>being kind of what our i915_reg.h became. Also the count args to 12 is
>>>not exactly what we want.
>>
>>sorry, but I still don't follow
>>
>>if a ready to use macro is defined, I see no reason to define own copy
>>just because we don't like to include header where it was added/defined
>>
>>if size of the kernel.h is a real problem, then I would expect moving
>>CONCAT/COUNT macros to linux/concat.h/count.h rather then creating its
>>own macros in private header (unless they are really non-generic)
>
>my thought was: it *is* happening. Slowly. Over time. Let's not add one
>more dependency on it.
>
>At the same time, there is no good reason to block the rest of the
>changes (and actually the entire xe module being merged upstream)
>by attempting to create those headers. Yes, that could happen in
>parallel and go through the right upstream branch. That branch is not
>drm-next though.
>
>We have only 3 macros that were typed over and over in the last 30 years
>in slightly different forms.  Once we have a concat.h / count.h we can
>easily migrate to them.  Example: `git log --grep str_yes_no`: such
>common infra takes time and synchronization between several trees.
>
>See:
>d2a8ebbf8192 ("kernel.h: split out container_of() and typeof_member() macros")
>
>And the disclaimer in the header itself:
>
>/*
> * NOTE:
> *
> * This header has combined a lot of unrelated to each other stuff.
> * The process of splitting its content is in progress while keeping
> * backward compatibility. That's why it's highly recommended NOT to
> * include this header inside another header file, especially under
> * generic or architectural include/ directory.
> */
>
>
>
>>
>>>
>>>>
>>>>>    3) They are not compatible with rules/actions with registers
>>>>>       passing additional options
>>>>>
>>>>>This new implementation fixes (2) and (3).
>>>>>
>>>>>For (2), prefix everything with "_XE", so there is less chance of
>>>>>clashes. Also, the maximum number of rules and actions is 4, so there is
>>>>>no need to make the helper macros go until 12: reduce that to 5, so if
>>>>>more arguments is passed, the compiler gives an error that there is not
>>>>>definition with _5 suffix.
>>>>
>>>>I'm not convinced that adding local definitions with XE_ prefix that
>>>>mimics functionality already defined in kernel.h is the right way to go
>>>
>>>see above
>>>
>>>>
>>>>>
>>>>>For (3), change the implementation to concentrate on "pasting a prefix
>>>>>to each argument" rather than the more general "call any macro for each
>>>>>argument". Hopefully this will avoid trying to extending this infra and
>>>>>making it more complex. The new changes to how the arguments are
>>>>>constructed using tuples will allow extending the interface where it's
>>>>>needed: passing additional register fields to allow creating our own
>>>>>xe_reg_t.
>>>>>
>>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>---
>>>>> drivers/gpu/drm/xe/xe_rtp.h | 68 ++++++++++++++++++-------------------
>>>>> 1 file changed, 33 insertions(+), 35 deletions(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>>>>>index a3be7c77753a..53650f09efe9 100644
>>>>>--- a/drivers/gpu/drm/xe/xe_rtp.h
>>>>>+++ b/drivers/gpu/drm/xe/xe_rtp.h
>>>>>@@ -22,43 +22,42 @@ struct xe_reg_sr;
>>>>> /*
>>>>>  * Helper macros - not to be used outside this header.
>>>>>  */
>>>>>-/* This counts to 12. Any more, it will return 13th argument. */
>>>>>-#define __COUNT_ARGS(_0, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10,
>>>>>_11, _12, _n, X...) _n
>>>>>-#define COUNT_ARGS(X...) __COUNT_ARGS(, ##X, 12, 11, 10, 9, 8, 7, 6,
>>>>>5, 4, 3, 2, 1, 0)
>>>>>+#define _XE_ESC(...) __VA_ARGS__
>>>>>+#define _XE_COUNT_ARGS(...)
>>>>>_XE_ESC(__XE_COUNT_ARGS(__VA_ARGS__,5,4,3,2,1,))
>>>>>+#define __XE_COUNT_ARGS(_,_5,_4,_3,_2,X_,...) X_
>>>>>
>>>>>-#define __CONCAT(a, b) a ## b
>>>>>-#define CONCATENATE(a, b) __CONCAT(a, b)
>>>>>+#define _XE_CONCAT(a, b) __XE_CONCAT(a, b)
>>>>>+#define __XE_CONCAT(a, b) a ## b
>>>>>
>>>>>-#define __CALL_FOR_EACH_1(MACRO_, x, ...) MACRO_(x)
>>>>>-#define __CALL_FOR_EACH_2(MACRO_, x, ...)                    \
>>>>>-    MACRO_(x) __CALL_FOR_EACH_1(MACRO_, ##__VA_ARGS__)
>>>>>-#define __CALL_FOR_EACH_3(MACRO_, x, ...)                    \
>>>>>-    MACRO_(x) __CALL_FOR_EACH_2(MACRO_, ##__VA_ARGS__)
>>>>>-#define __CALL_FOR_EACH_4(MACRO_, x, ...)                    \
>>>>>-    MACRO_(x) __CALL_FOR_EACH_3(MACRO_, ##__VA_ARGS__)
>>>>>+#define _XE_FIRST(...) _XE_ESC(__XE_FIRST(__VA_ARGS__,))
>>>>>+#define __XE_FIRST(x_,...) x_
>>>>>+#define _XE_TUPLE_TAIL(...) _XE_ESC(__XE_TUPLE_TAIL(__VA_ARGS__))
>>>>>+#define __XE_TUPLE_TAIL(x_,...) (__VA_ARGS__)
>>>>>
>>>>>-#define _CALL_FOR_EACH(NARGS_, MACRO_, x, ...)                    \
>>>>>-    CONCATENATE(__CALL_FOR_EACH_, NARGS_)(MACRO_, x, ##__VA_ARGS__)
>>>>>-#define CALL_FOR_EACH(MACRO_, x, ...)                        \
>>>>>-    _CALL_FOR_EACH(COUNT_ARGS(x, ##__VA_ARGS__), MACRO_, x,
>>>>>##__VA_ARGS__)
>>>>>+#define __XE_PASTE_SEP_COMMA        ,
>>>>>+#define __XE_PASTE_SEP_BITWISE_OR        |
>>>>>+#define __XE_PASTE(prefix_, sep_, args_)
>>>>>_XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_,
>>>>>args_))
>>>>>+#define __XE_PASTE_1(prefix_, sep_, args_) prefix_ args_
>>>>>+#define __XE_PASTE_2(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>>>__XE_PASTE_SEP_ ## sep_ __XE_PASTE_1(prefix_, sep_, _XE_TUPLE_TAIL
>>>>>args_)
>>>>>+#define __XE_PASTE_3(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>>>__XE_PASTE_SEP_ ## sep_ __XE_PASTE_2(prefix_, sep_, _XE_TUPLE_TAIL
>>>>>args_)
>>>>>+#define __XE_PASTE_4(prefix_, sep_, args_) prefix_(_XE_FIRST args_)
>>>>>__XE_PASTE_SEP_ ## sep_ __XE_PASTE_3(prefix_, sep_, _XE_TUPLE_TAIL
>>>>>args_)
>>>>>
>>>>>-#define _XE_RTP_REG(x_)    (x_), XE_RTP_REG_REGULAR
>>>>>-#define _XE_RTP_MCR_REG(x_) (x_), XE_RTP_REG_MCR
>>>>>+#define _XE_RTP_REG(x_)        (x_), XE_RTP_REG_REGULAR
>>>>>+#define _XE_RTP_MCR_REG(x_)    (x_), XE_RTP_REG_MCR
>>>>>
>>>>> /*
>>>>>  * Helper macros for concatenating prefix - do not use them directly
>>>>>outside
>>>>>  * this header
>>>>>  */
>>>>>-#define __ADD_XE_RTP_ENTRY_FLAG_PREFIX(x)
>>>>>CONCATENATE(XE_RTP_ENTRY_FLAG_, x) |
>>>>>-#define __ADD_XE_RTP_ACTION_FLAG_PREFIX(x)
>>>>>CONCATENATE(XE_RTP_ACTION_FLAG_, x) |
>>>>>-#define __ADD_XE_RTP_RULE_PREFIX(x) CONCATENATE(XE_RTP_RULE_, x) ,
>>>>>-#define __ADD_XE_RTP_ACTION_PREFIX(x) CONCATENATE(XE_RTP_ACTION_, x) ,
>>>>>+#define __XE_PASTE_XE_RTP_ENTRY_FLAG_(x_)   
>>>>>_XE_CONCAT(XE_RTP_ENTRY_FLAG_, x_)
>>>>>+#define __XE_PASTE_XE_RTP_ACTION_FLAG_(x_)   
>>>>>_XE_CONCAT(XE_RTP_ACTION_FLAG_, x_)
>>>>>+#define __XE_PASTE_XE_RTP_ACTION_(x_)    _XE_CONCAT(XE_RTP_ACTION_, x_)
>>>>>+#define __XE_PASTE_XE_RTP_RULE_(x_)    _XE_CONCAT(XE_RTP_RULE_, x_)
>>>>
>>>>maybe local macros should be defined with full XE_RTP prefix and be
>>>>tailored for your specific RTP usecases:
>>>>
>>>>#define _XE_RTP_CONCAT(a, b) __XE_RTP_CONCAT(a, b)
>>>>#define __XE_RTP_CONCAT(a, b) XE_RTP_ ## a ## _ ## b
>>>
>>>these are not to be used throughout the source code. The only difference
>>>I see from this and what I did is the prefix being *XE_RTP_ rather than
>>
>>also the actual outcome of the macro includes "XE_RTP" prefix being
>>added automatically (making this a non-generic concat macro)
>>
>>>*XE_.  Since this is not to be used outside the header, I'm not seeing
>>>much value in make it even longer.
>>>
>>>>
>>>>#define __XE_PASTE_XE_RTP_ACTION_(x_)    _XE_RTP_CONCAT(ACTION, x_)
>>>>#define __XE_PASTE_XE_RTP_RULE_(x_)    _XE_RTP_CONCAT(RULE, x_)
>>>
>>>this contradicts what you said and following that would make it very
>>>ugly:
>>>
>>>#define __XE_RTP_PASTE_XE_RTP_ACTION_(x_)    _XE_RTP_CONCAT(ACTION, x_)
>>>#define __XE_RTP_PASTE_XE_RTP_RULE_(x_)        _XE_RTP_CONCAT(RULE, x_)
>>
>>or
>>
>>#define __XE_RTP_PASTE_ACTION(a)    _XE_RTP_CONCAT(ACTION, a)
>>#define __XE_RTP_PASTE_RULE(r)      _XE_RTP_CONCAT(RULE, r)
>
>humn... if this works, then it seems to be cleaner. My previous attempt
>on trying a similar thing ended up with the preprocessor not pasting it
>on all args, but I think that was still when I was using the
>CALL_FOR_EACH macro. I will try with this one.

there's big caveat here that the macros are being joined together to
form the macro that will be called... we can't have it called
__XE_RTP_PASTE_ACTION since the rename cascades from the other macro,
called by the actions/rules setup.

There is also this other user without the prefix:

#define __XE_PASTE(prefix_, sep_, args_) _XE_ESC(_XE_CONCAT(__XE_PASTE_,_XE_COUNT_ARGS args_)(prefix_, sep_, args_))

with a lot of changes the renames could probably be made to work,
but I'm not sure the small gain of using XE_RTP_ vs XE_ prefix really
justifies it. It won't be simpler.

I will think a little more, but if you have it done, please feel free to
send it here.


Lucas De Marchi

>
>thanks
>Lucas De Marchi
>
>>
>>>
>>>
>>>Lucas De Marchi
>>>
>>>>
>>>>then there will be no complains about overlapping functionality with
>>>>macros from kernel.h
>>>>
>>>>>
>>>>> /*
>>>>>  * Macros to encode rules to match against platform, IP version,
>>>>>stepping, etc.
>>>>>  * Shouldn't be used directly - see XE_RTP_RULES()
>>>>>  */
>>>>>-
>>>>> #define _XE_RTP_RULE_PLATFORM(plat__)                        \
>>>>>     { .match_type = XE_RTP_MATCH_PLATFORM, .platform = plat__ }
>>>>>
>>>>>@@ -315,8 +314,8 @@ struct xe_reg_sr;
>>>>>  *        ...
>>>>>  *    };
>>>>>  */
>>>>>-#define XE_RTP_ENTRY_FLAG(f1_, ...)                        \
>>>>>-    .flags = (CALL_FOR_EACH(__ADD_XE_RTP_ENTRY_FLAG_PREFIX, f1_,
>>>>>##__VA_ARGS__) 0)
>>>>>+#define XE_RTP_ENTRY_FLAG(...)                            \
>>>>>+    .flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ENTRY_FLAG_, BITWISE_OR,
>>>>>(__VA_ARGS__)))
>>>>>
>>>>> /**
>>>>>  * XE_RTP_ACTION_FLAG - Helper to add multiple flags to a struct
>>>>>xe_rtp_action
>>>>>@@ -338,8 +337,8 @@ struct xe_reg_sr;
>>>>>  *        ...
>>>>>  *    };
>>>>>  */
>>>>>-#define XE_RTP_ACTION_FLAG(f1_, ...)                        \
>>>>>-    .flags = (CALL_FOR_EACH(__ADD_XE_RTP_ACTION_FLAG_PREFIX, f1_,
>>>>>##__VA_ARGS__) 0)
>>>>>+#define XE_RTP_ACTION_FLAG(...)                            \
>>>>>+    .flags = (__XE_PASTE(__XE_PASTE_XE_RTP_ACTION_FLAG_, BITWISE_OR,
>>>>>(__VA_ARGS__)))
>>>>>
>>>>> /**
>>>>>  * XE_RTP_RULES - Helper to set multiple rules to a struct
>>>>>xe_rtp_entry entry
>>>>>@@ -361,16 +360,15 @@ struct xe_reg_sr;
>>>>>  *        ...
>>>>>  *    };
>>>>>  */
>>>>>-#define XE_RTP_RULES(r1, ...)                            \
>>>>>-    .n_rules = COUNT_ARGS(r1, ##__VA_ARGS__),                \
>>>>>+#define XE_RTP_RULES(...)                            \
>>>>>+    .n_rules = _XE_COUNT_ARGS(__VA_ARGS__),                    \
>>>>>     .rules = (const struct xe_rtp_rule[]) {                    \
>>>>>-        CALL_FOR_EACH(__ADD_XE_RTP_RULE_PREFIX, r1, ##__VA_ARGS__)    \
>>>>>+        __XE_PASTE(__XE_PASTE_XE_RTP_RULE_, COMMA, (__VA_ARGS__))    \
>>>>>     }
>>>>>
>>>>> /**
>>>>>  * XE_RTP_ACTIONS - Helper to set multiple actions to a struct
>>>>>xe_rtp_entry
>>>>>- * @a1: Action to take. Last part of XE_RTP_ACTION_*
>>>>>- * @...: Additional rules, defined like @r1
>>>>>+ * @...: Actions to be taken
>>>>>  *
>>>>>  * At least one rule is needed and up to 4 are supported. Multiple
>>>>>rules are
>>>>>  * AND'ed together, i.e. all the rules must evaluate to true for the
>>>>>entry to
>>>>>@@ -388,10 +386,10 @@ struct xe_reg_sr;
>>>>>  *        ...
>>>>>  *    };
>>>>>  */
>>>>>-#define XE_RTP_ACTIONS(a1, ...)                            \
>>>>>-    .n_actions = COUNT_ARGS(a1, ##__VA_ARGS__),                \
>>>>>+#define XE_RTP_ACTIONS(...)                            \
>>>>>+    .n_actions = _XE_COUNT_ARGS(__VA_ARGS__),                \
>>>>>     .actions = (const struct xe_rtp_action[]) {                \
>>>>>-        CALL_FOR_EACH(__ADD_XE_RTP_ACTION_PREFIX, a1,
>>>>>##__VA_ARGS__)    \
>>>>>+        __XE_PASTE(__XE_PASTE_XE_RTP_ACTION_, COMMA,
>>>>>(__VA_ARGS__))    \
>>>>>     }
>>>>>
>>>>> void xe_rtp_process(const struct xe_rtp_entry *entries, struct
>>>>>xe_reg_sr *sr,
