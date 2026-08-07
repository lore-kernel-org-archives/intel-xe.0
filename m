Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDC4C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:00:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162B010E414;
	Fri,  7 Aug 2026 12:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZWPTlrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D982810E40C;
 Fri,  7 Aug 2026 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786104012; x=1817640012;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lUyHUQ5ol59LCExFQye/4aNBMlJigCXgszA9AOAR4vw=;
 b=UZWPTlrnZ4jTDIE56TvRjTpk9ujK2j/0c8AKeoWLMT3RcIELyfohlhVP
 pO3PFMND/QLXXv2Ogtfl21ak/BcrCW6eMgH5EhOAnbZhqjVyt4m9enVIQ
 aUzZ7U/8TnLlPWGrq8aCwpQOkXjoUsFcWHK/WfinGRUaD1zXzrJOJcAVM
 gmZEHeyhPMP2ZG37pesr+QHlwuGdXbLQbykQlzvOH/Ar19I2oG2QK/Uwj
 J5kuwFkR+lDTVe1szb204MZqoHJ5SsUtf/VoECzSxtWA+Vx89mktBm/Jq
 aSw12b+ndzl9+OWY3/xk0e84FeLElDT6JNAxio9LAQhGAslM7yBLpYzJK A==;
X-CSE-ConnectionGUID: kAO1KMImT7qUG+RHBv3cvQ==
X-CSE-MsgGUID: 92Rnyh1HTzKB/3iTCSB4Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104111314"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="104111314"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:00:12 -0700
X-CSE-ConnectionGUID: FbBZLxCOTC+vtCzScrWvYw==
X-CSE-MsgGUID: YroLDb9ASQ6Tl70596Fdjw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:00:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 05:00:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 05:00:11 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 05:00:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbLkj7xhsXHb5eFbJnCfOzlDQudkiN6wcDicyYW96vinBPPbCC42FSIMRwYBiRMJ/NZp9TU8r2CSUV3/fx5WOhelz4jE1KmysXo9P1PpE82UgF1BtWHxhy3+DR/cf+pbE0jK1/AS1vyBBoAn5rpGxSELnfGsp24BtPikafkgh9zJHAMK4zM0OkpNFDK4W2/rtPRvncJPC+EHqjecGTYjPttJu9z7/XmouimMkgYxMMB169KPIU8hA9KdK1XMH0on7lPU7Wzi7ezGlhIDP4YJpH1CRgrXU+5HtcCeQa4+Ms9WK4O3rVv9ZZ0Ijk6oBb58l3U+u0JnDus34YAEAW33Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UNNf6W4y/Fslgbs4Qhkab0I8BW19irn1HilFGb5d/M=;
 b=HZNCyO8Hpl0Qjo3CdA2cniqLp2XqcQfVXsFUSX9Yi0yFEMeTzmjQBOmt4E+C0EYFPO0iSS6Q6KCTYzjfAHg4vcWNEu8/QOX9NgexY0m9Cvs4Qk2+QG1cpol+JNr33TEXVryT2s2SdyuPNBBuE8rjqL8U4rRHFYgNlJ886ppBQ8GhX7pyLkINy0jfFa4wKDQqGfM4vwGOcsIE/kpwWSMkahYrIZ6hADfVdJYsXmxm/NW5zhmfN7YdJHaJ9CjlxUjCFTS9hyFL3iduNjYIeGsyaX5ddirg9w3MKX6wYkJ8kz1ZYwp5hfgTV9BtW3ibxgLXctifIxKkzN8w5yR9PRdaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 12:00:08 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 12:00:07 +0000
Date: Fri, 7 Aug 2026 08:00:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>
CC: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 <intel-xe@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Nemesa Garg
 <nemesa.garg@intel.com>
Subject: Re: [PATCH] drm/i915/dp_mst: Remove duplicate
 intel_pfit_compute_config() call
Message-ID: <anXIxPly19_UTukH@intel.com>
References: <20260806074819.2631970-1-chaitanya.kumar.borah@intel.com>
 <aeb1e53100b0b28c557061a706fe2ffb04a662d5@intel.com>
 <anTmAUupVyP6fiA4@intel.com> <anXHt7b02V4s-tQ1@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anXHt7b02V4s-tQ1@intel.com>
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MW4PR11MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: cc71a970-0f97-477b-1e5c-08def47b6cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: pAZrqQBGjEHgd45atZmGZtFlaRGii9hzMKqF3yELonDPAxVbibGfAi8uzt+ye7F8x5T27BY/mX99FVn+8D5DvtmhkC372kFilpzSO9+UUqXBVB1jxByUun7sa8oa0zzzqJyY7Kt0s8A/QzhjZXygW9/q8CLyYhge22+Qs5baMTzMDmyMCgNZcCGz4ML9eoPhQ1u4S0ANuIdSyzXAkqadh7A0HJze/rPlfl3N1Oy+jEEDjtOPWQNS41jPrM/fuGxgqCLfaLFD+gCKzaRDt8reUZn+faorxWrHSH1Jq7cD8odOuOn2dHPtvogwmFW1nq2VEZQ9eL62uIUHKbWIW/Ldpsfl5j9NlbkWv7EjpCvlJLCRzs8bTWlq+qvjIXjZKM+jSrBbXB2rh8z7Ojlmszxc85VURt9PvxG4ZqfS/dNAfXER9lqe70r4cNSI+4WsfUrf856DJyLFM7X1a4r1ALrasxTkYjcP5VwJ07LCQ/859f3tvHZ6P1HgrATUbvDr+HR/8OTDH/qYHVpGmH3H1w9/JMriTZ1P3d+8X/smd8hX3xKnwAeKRg1KDzJS3qy1MD67MxFN1NHWDDlpNhGbHxEWef1OAMLYQ2EI27xXYTwxRrkqFKL4kQ7Za9Pm7+tzMhL5uvR2CujAbhvLvWG9b91IVkhQh7xE2zA5FzaK9yHilzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dJQvwL42noWlDtTab/pvWDq6f4vdL/CmCgnBFFyOgS+utVkjcX8R6Cs2dg?=
 =?iso-8859-1?Q?DLqtQ/8qPkNYIkOsNG886/YGLWR6A24HyjZe633eAYyxUWnXlyr3hceDlR?=
 =?iso-8859-1?Q?BdMZyDbV/bRTRj0G0uenB/ip4x2BJLfNe451hzA5jXZJJfGEBmc669qadG?=
 =?iso-8859-1?Q?8BN0ikRPR0qkJOC1wiLyHFii6b7VczkX3Ivf455vaJqrHnaHlhnpSQHyDp?=
 =?iso-8859-1?Q?66LRO/yXEGJp+2B8rdvV7PrBxSmfhEIuShxFdWFNAuZ9Rr3MgE+at4Re2S?=
 =?iso-8859-1?Q?Yxh/fn72Sf+GR+pfY+afO73ZUrRBvGH66F29TsGBLOezcRQHAK6bRYg/zm?=
 =?iso-8859-1?Q?zQ3T5ZTf2zYfGDtm9pJKocKq9PDpXr9uQK5vxYsinW25oRk8fISts0n+Ae?=
 =?iso-8859-1?Q?IphK8gScU4q/Qhguy2Ghuiq0QhpqMSoOpAEONjjIN9RlnfdhM3iovqA0/Y?=
 =?iso-8859-1?Q?M2JkbSlNIKiy+RTYjzuXXaoHhkpPN6LWiSZNZULW5M1Ke6ZF5ioDFDSZJj?=
 =?iso-8859-1?Q?0GnD0fqsAkVHUohFsfXGm2lpuBa5xiveVDOpH9UiLdCl6/JUbIllPXm0Fv?=
 =?iso-8859-1?Q?e/jEH3zEnv6F1roM5jvVcLY2AAGNMJRIPuFG1hw94R4swpNG5h8J/Cc0pH?=
 =?iso-8859-1?Q?H/fsddyFUp7n33/bWsIrFzReWfmS5MEfJT8wJ5uwx2MpJTkScWby7nK6w5?=
 =?iso-8859-1?Q?8HkI/lhqO6udemQVZW5pswgl9VM4/ayewMTR8lL7dDTV+ACgTCKOyvMTdn?=
 =?iso-8859-1?Q?xqgDa6Q5rK/ktyIApfmuPQi/iRtJt4QBD+oMB5MJfwHO0UZp/ULQ8KkF29?=
 =?iso-8859-1?Q?vVCYFg1JMxvISN6sw6JRuHYd5c+uVQv0jGb7jvqlW1q/nPicr7ntS0MDll?=
 =?iso-8859-1?Q?543udK9HJ48TAhZsrWmr9JyKRSXf1YRndfcA60Bkn7/CPXaZckbZ282muC?=
 =?iso-8859-1?Q?Cc0mYH1hei4v96mDxCWv578KuhrSKnEc+YapNfUsa0Tq3bPiz8pBFOIDc6?=
 =?iso-8859-1?Q?PvukP0WC2kL3w4u/3Nqog2/IwTsnIeoBb056/0Ci5Xk4x+e/Q8J/mL0aO2?=
 =?iso-8859-1?Q?RmCjCHcT4KmVn3Vk08Qy+1cLmVjqStXraKPD/bbupeqBi8rMhBF1rtSvGb?=
 =?iso-8859-1?Q?//xpdzmOy/G18RXRK2hxkHb+GXWAl3oPlUCMVsoBB1OETKa5dTWODvAHV3?=
 =?iso-8859-1?Q?V1wB2q5TvVBxxx6fVy3VuW7suAksS9f8kxXOjHj/k6/KnlVBige5eJodF/?=
 =?iso-8859-1?Q?qHGhYLQETnWE4esbwgUeUExihhj5A77wO07DQVfWgBJT+8SVCz+k8hu1bo?=
 =?iso-8859-1?Q?NAA6qfA31wQJzuJ27ig5LAaiS3q/UsG6sF22aqK8NEBgkv7GMYF/qQLUjB?=
 =?iso-8859-1?Q?S5ypn1AcNoVpA7mpom0d3lKLqXfemZAllwb+KLmTnCDyACBrL5rFrsyT3g?=
 =?iso-8859-1?Q?ZFzWFsGLOzzrBW1yAjVRY25ptXsSWe/T1PAALdgUZTUTOfIV8OycKwmF57?=
 =?iso-8859-1?Q?yTt5kjzVzdav7HhHFDrVkpGnoXRQOdhoAn1gprrc6qJDp9Ezy+/4YZA42h?=
 =?iso-8859-1?Q?qPbh++bjQnkIdV7liWLUwrB+vkAdbcXvBO/MwyX2ylcDrfWZK+lNFRu5kd?=
 =?iso-8859-1?Q?p2OyNfVvcr2UaAuYR7WMhCILn5nhjL4+cRjwXrcEwCze/pkxNgNnick9uW?=
 =?iso-8859-1?Q?hmeHF1f6ONyF9Dbe4fsRB+3eeE40tMMfOI6qIdPZhsoMaYO7lDj85Y3OlK?=
 =?iso-8859-1?Q?TWpuU+CBmSlwHVzUyKCwhil0YhthItF03OLXD3EOuxSmrGaAs84DSni2CU?=
 =?iso-8859-1?Q?vZysYqh9Ug=3D=3D?=
X-Exchange-RoutingPolicyChecked: KueJ65FeQmVvre+EfEQv/8mf375FHAGZZmna4HXJWzsfQXR9034lqGmSb3Z6ATXSyyZbFD7XUzn+kPlJtqcG3lJD8vGbqDZbur55y8lO4QhWOiv4sA+8h20DeFYttFkKAAZAHcTKD+/ulon8zcw2tGoslx0gAvfcubzaTg8t1qh6LkzZp7mN7O1DrDrxcDcaO8lfQ8EHoE4Qw+G0Wd7Gk3CIO/8HPbA3dH5XnC6hDRPLuXoNenMVI7wBZGF7KLfeKyOkeM1tEzuNo+clAeAWE391zM2bHoWYhEJJ+MqXiegRsgexWtwd0y0iKmb6sH05wivn2+oxLMFJlgoCL7aU/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: cc71a970-0f97-477b-1e5c-08def47b6cbc
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 12:00:07.7770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzfIgf8tw9JbgrLUdWeZ+i37sDUdqkl0A6jsIZ2mdC/ujGp76DhQH29+QDu2xPbx6ApKoZqQ3iwRnoOvqfy1Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
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

On Fri, Aug 07, 2026 at 07:55:41AM -0400, Rodrigo Vivi wrote:
> On Thu, Aug 06, 2026 at 03:52:33PM -0400, Rodrigo Vivi wrote:
> > On Thu, Aug 06, 2026 at 12:30:16PM +0300, Jani Nikula wrote:
> > > On Thu, 06 Aug 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> > > > mst_stream_compute_config() called intel_pfit_compute_config() twice
> > > > in a row. Probably because of a bad merge. Drop the redundant duplicate
> > > > call.
> > > >
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > Cc: Nemesa Garg <nemesa.garg@intel.com>
> > > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > > Fixes: 5ce9ac1531b8 ("drm/i915/mst: Call intel_pfit_compute_config() for sharpness filter")
> > > 
> > > Rodrigo, by the looks of it, this was an unnecessary cherry-pick for
> > > fixes. The context for 5ce9ac1531b8 shows the existing call, so I don't
> > > think this is a merge failure. But why it happened, no idea!
> > 
> > Indeed weird, I should had caught that on the fixes, I'm sorry.
> > 
> > but it is weird anyway, looking to
> > d4686f34bbeb ("drm/i915/pfit: Call intel_pfit_compute_config() unconditionally on (e)DP/HDMI")
> > 
> > which is the mentioned fixed patch, it actually introduces this chunck.
> > Then the fix patch introduces this again.
> > 
> > So, it looks like this also occurred on the drm-intel-next first anyway?
> 
> I'm sorry, I got confused by intel_dp.c vs intel_dp_mst.c.
> 
> The thing is that 
> 
> 5ce9ac1531b8 ("drm/i915/mst: Call intel_pfit_compute_config() for sharpness filter")
> 
> should never had been cherry-picked because
> 
> ca97f5546f19 ("drm/i915/mst: Call intel_pfit_compute_config() for sharpness filter")
> 
> was already in the same tree.
> 
> git didn't notice it and move forward with the cherry-pick
> dim couldn't have possibly noticed it and proceeded
> 
> I failed to review and notice the duplication. I'm sorry about that.
> 
> and the duplication then propagated to all the branches...
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> for this patch here....
> I pushing it right away to drm-intel-next.

fyi: I adjusted the commit message with the history before pushing it.

> 
> > 
> > Ville, thoughts?
> > 
> > > 
> > > BR,
> > > Jani.
> > > 
> > > 
> > > > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_dp_mst.c | 4 ----
> > > >  1 file changed, 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > index 3be1643f8d03..57daed0b0b36 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> > > > @@ -761,10 +761,6 @@ static int mst_stream_compute_config(struct intel_atomic_state *state,
> > > >  	pipe_config->sink_format = INTEL_OUTPUT_FORMAT_RGB;
> > > >  	pipe_config->output_format = INTEL_OUTPUT_FORMAT_RGB;
> > > >  
> > > > -	ret = intel_pfit_compute_config(pipe_config, conn_state);
> > > > -	if (ret)
> > > > -		return ret;
> > > > -
> > > >  	ret = intel_pfit_compute_config(pipe_config, conn_state);
> > > >  	if (ret)
> > > >  		return ret;
> > > 
> > > -- 
> > > Jani Nikula, Intel
