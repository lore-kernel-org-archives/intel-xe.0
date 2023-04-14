Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC970C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 22:11:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77396886A4;
	Fri, 14 Apr 2023 22:11:52 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781E9886A4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681510310; x=1713046310;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3VFtcEK2MicphPqHVcYBU5sDnq7oP7ghP8KBvtZh60E=;
 b=nan5fmGvhxBqUO2nMzKDSxssgLpTowkMg501BtHINLUYTddwFaV4XrGw
 vo94/2omXFlqzJ04yWiGKlcyIKZ5QlXwJYUrOQ/AMBJQwML6nv9ucGHLU
 mWEyct69qUjcPocygTrhKsMuT60l+kbIzslHoNIh2WTTYWepAlZtdJaHy
 bjXJNblwTOS71CWUY+sfyEmiHri/ZKywibgDkCHZGML1/nlvGVChIa0sU
 CqxyTkq/69CnTdJooJIOdaFT4WuByKOTOoYYPe7UIuanOFo7IA5yc+3Rw
 2Zpr8lIBuWbA8Tt5truw1V7B8IpgJNby1yTUTH6UEsTUx9E2MthkIJuK9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="343337680"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="343337680"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 15:11:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="936158726"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="936158726"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2023 15:11:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 15:11:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 15:11:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 15:11:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 15:11:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAhaRTHSo3VX8vPd/Abcm9WOmnPzI9GtnVpd0X9jQ4EqwOKOOebKNTIjXmPTZ7APpgG5wlTVze2LYd7vQijCX/J02NVhD433t2o9ZFVkn/Cno7FYcQv94cziphFEIM6r9woTC0VrdbXxJ3cdrI9WjTa1ObjWCVytPgNgCY+n3Vv5bUysP1IRi4m5CA/wSELF0/NWjMhr4T+snkzOgagha8WE7R9jRsZS1EdrpaEihu1SkK/CgGfCfJoOBxZrZYh/KYk2Q55KjAk6Zk0wZBJWF5yKD3Rm94m4+ar0jr5EtOTMoDO8cf5v9Q/CvFN0V97Vy3/FJvu8Xv3sj4NyLL+vBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3jUl+GgzEVgazfbp6319IcMxtY4HzekhRupw1JguDQ=;
 b=kPZZTizK9ol3O71fy4f4wjGa5bOgH1JnTIIMVWfiRB+bW47HAdgSfhOdqMQEdPP/RRLspJ4WsJ6Eqo/irhoscNsXYymEccL9A0PcEQJZxOmBTajuypEEkKWxqCpuP1beO6lJOHkuNt5RrqQK9qAzDkgzsfg/LbBHQus17hpJSC50Ra0Gev4osKwKNQezTzPsyGsxDtGxOWoGzUCR1z5wd0B+TKJLo+awNxQcH0AVqPxaqB/OzmcZlqA4vHW2B5rHIkQRozZcmSyjf2NxGujLgCjedBCtqKVv/xWDqnikhdcG2OaWRk241QEFULmgdWlYqZHDsJSDtGdqjKiHrfgazw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB8234.namprd11.prod.outlook.com (2603:10b6:610:190::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 22:11:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 22:11:46 +0000
Date: Fri, 14 Apr 2023 15:11:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
Message-ID: <lphv7flakz3kbvlucsi36algthnlien4dbdlk3nlbobibnsunf@hm4s6nanxybb>
References: <20230414193355.143875-1-matthew.s.atwood@intel.com>
 <pvlaxodbiqhygobzzr6mlhmd3olalqsevsrqendc2tzds3qvlz@b5paj6w74nyq>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <pvlaxodbiqhygobzzr6mlhmd3olalqsevsrqendc2tzds3qvlz@b5paj6w74nyq>
X-ClientProxiedBy: BYAPR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6d0843-f299-4323-d58e-08db3d353c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHN3lLh35ovde5EGdAhdgLNCDNBq1XQ5CeAKEq2DLJQfL5K9pDFY30fZuAHeuKd6x5QSzd16qa2gJnMBYdSaBNFLeaZ1ibufy+ak1JLQDd7eG8apQz/ntMr5LN5g7ZULFrTRg3TbPhXRTRG3poR+dBMB+Fvcrd7qGSTlzo499U+0kov0az1J+m2LeuALLdcrYasZM+xvPZS9Gv1KJ7Z/aekd8nBurXra2A5+hu4VvZFUi519Zf8m/8gKn9V4oatTynV1oYwBN9wqyDZoaGBL3so73tXR+jaSvfHjegIaXIuFZE2eDDcwrpdvragC/R5c+C0l79YoEBLeADDyg5c12mNYmNkU+Ccf8tuBoPaPG1KjeNUeJlPW+o6ElhbC13vSfIYacGaTI4eHKW6GImM18y3dt2SLLr8/xK8eLU2enu8Zd9/lJQWhi/IMPahZdQsCm7ZXpchEZTXMsMIqFZ7Hyinp4JktdOtgUxlO2EwO2erOiSTZdUyHcgW4g3YrcUKqtZGUlzTGRes5V/aGtjO3YyTrS9h6hV8Z5uzHYwR9Wb4d8XP+2brc0vv4xhQ+ftJq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(136003)(366004)(376002)(346002)(396003)(451199021)(6506007)(6636002)(83380400001)(186003)(6486002)(478600001)(26005)(107886003)(6512007)(9686003)(33716001)(316002)(38100700002)(5660300002)(2906002)(66556008)(66946007)(66476007)(82960400001)(41300700001)(4326008)(8676002)(6862004)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VORt+nO20eVtN50hetTxvbcVcPqRnvIacwgTacMmGvQW3C+boVa3cBIc3c?=
 =?iso-8859-1?Q?zZsbhUOy2p2pod0GkKzL4lBsy9wrCQERwnPwg5lMq3LwSVaFZGJSlYg4Rf?=
 =?iso-8859-1?Q?7IHpaX55U1BYLhjvy/+BydYwC4RLx/8kzpoKYK08CehWrsiaR1YOs2R/eX?=
 =?iso-8859-1?Q?OSmMwlznukdvUTwI6igaivnEZh6NjslPQ2/jNWG8Xo/97NYS88HMLpK6kc?=
 =?iso-8859-1?Q?V9Bl/6lQJ3FgMxiXUdOyespi/EGEHV+ku4H5lVvtPez4GbL8AVuieAjAFv?=
 =?iso-8859-1?Q?calB+W8Spg07O6YvDwKjrBZfHylcFGC7we83MbFvAsjZjhD8YEPE7ZzfoN?=
 =?iso-8859-1?Q?iXKzwQAZwAVQmtCKAVbJrCDDSmuYznNWoRMXh5bWmvqphoJ8sx5tjpnC3+?=
 =?iso-8859-1?Q?gN/crdQdvEtDiWMf9u41TgusO3SRZVlxFmQcF0n+AP9EtlCQ2okIQb+4yV?=
 =?iso-8859-1?Q?qf+ikjjkbv7gsRPbIP2N1z8XOrC+iAHt9vL/OstN7WYl486f/yPqy0wyLe?=
 =?iso-8859-1?Q?nnkfApV6ozwt0JHfOBnNY9CJifBJJOCuIaTJ1E19oeuisvvuzCKgByCFkO?=
 =?iso-8859-1?Q?T+ZtGMUgzbRKT9CeTD2nLcDUFv8q72owCL/aZWh9rsgWejWVuInRkHX7tN?=
 =?iso-8859-1?Q?jzrouJAV1HEBbaSvoWytR1AOTLFXhMZ9AqfyFjWQkcwCMneOe8XFEQVlUo?=
 =?iso-8859-1?Q?5HCPcRBEPSEZsx/tQde42AqUhNJiL4IxGeJPP6ckEJmr8ctY83Lh4I9o42?=
 =?iso-8859-1?Q?H/snL9fo5Hi5nR9bmxfsAkARkzF6EASrsXBawfDU3vg7VKTbhynLnU2fCh?=
 =?iso-8859-1?Q?vDJuXoyPJjz0aOKRbI+1wxHjGxjc2oGDFReXj7AMPT18Meb48gIzDu9l/q?=
 =?iso-8859-1?Q?Be5OSYklr3Ot/iSpjQ8vEFN+SucUpQoya+g3HHb5Bk5a3i6t7ymmKdEAG3?=
 =?iso-8859-1?Q?r1Zuzm5DEbNTCWqKSlh+34Iri5tf5tmbSR7LyasuQrgPCTXwHHRu1DyXpy?=
 =?iso-8859-1?Q?UVRFZWrlR8f8CN/IT831Eo9h3wYhDeW79iCUxEvaB4O3yHAQJ1Zcfer8kk?=
 =?iso-8859-1?Q?R2U7Ckeg78NBpW+U3SKbpeT7uRvvFg5aycaHOvoh29L/jnlAmI/gMTGWgf?=
 =?iso-8859-1?Q?l3iwJsAvOsGwtckM5sCnLMIBsVnTuZns1kWXLrgyvcezghfsMKvDGByu+R?=
 =?iso-8859-1?Q?UT2nPmAonpO5tR1ovysDQMkQMN3SFpfvR4ZIcv1F+bGutphOaV2MsA3fVR?=
 =?iso-8859-1?Q?JbgntWeP4sqUTb5S8BkkSvxyYKl21ZQP7+5P6uO3jWd7LDwwh5FMPVwnUz?=
 =?iso-8859-1?Q?oL2+hYJfpwwJQ/ovuwQrUyImdZWdOpUnGCQfiyNPjPQ/tqMqrhdyu6d+Je?=
 =?iso-8859-1?Q?zi6Z22GDxrjb9W5YR+2Tv8TyUeGJHlw1Gtho1BeePmZnSFqBoXtILqTmfI?=
 =?iso-8859-1?Q?028aPKvLRizTcXwl/lO0pbwXyPb2nv54lg3C7loaQQXsKHxWrqDb9iIbtZ?=
 =?iso-8859-1?Q?4lOivZRFraNqs/q5PHtR1NsOrGvqG99e2NgtPz2inbtwiOGMevzQex+/yL?=
 =?iso-8859-1?Q?ywEC/cOvBVW4yD5oeEmazDXRqp1Oq/qhmYMAblYSUojGS0m3yeF0rIGWfn?=
 =?iso-8859-1?Q?FggeRI9QDrir06W5k0MUAqxvcoFPQipeB/WLmuq8CB2ls/jUyj/h7d7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6d0843-f299-4323-d58e-08db3d353c84
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 22:11:46.2713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JebI7CsONmmybuLTDrZOLO5ZtiPG1MJahyBc7seeSCafAtz7v7Hw6zeNEjHEYvGtQOoXyoI+1WyZwYGTY0SLPxhjU7qEtda2vEExO7vH9lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8234
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/: add gt tuning for indirect state
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org,
 lionel.g.landwerlin@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 02:59:55PM -0700, Lucas De Marchi wrote:
>On Fri, Apr 14, 2023 at 12:33:55PM -0700, Matt Atwood wrote:
>>Force indirect state sampler data to only be in the dynamic state pool,
>>which is more convienent for UMD. Behavior change mirrors windows
>>behavior.
>
>Better than the last sentence would be something like:
>
>Behavior change mirrors similar change for i915 in commit 16fc9c08f0ec
>("drm/i915: disable sampler indirect state in bindless heap").
>
>
>BSpec: 46052
>
>>
>>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>>---
>>drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>>drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
>>2 files changed, 6 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>index f174758d8307..b7324aede6b6 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>@@ -286,6 +286,7 @@
>>#define   ENABLE_SMALLPL			REG_BIT(15)
>>#define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
>>#define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
>>+#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
>>
>>#define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
>>#define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
>>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
>>index 27cf1330facd..5abef45a10fc 100644
>>--- a/drivers/gpu/drm/xe/xe_tuning.c
>>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>>@@ -26,6 +26,11 @@ static const struct xe_rtp_entry gt_tunings[] = {
>>	  XE_RTP_RULES(PLATFORM(DG2)),
>>	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
>>	},
>>+	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
>>+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, -1)),
>
>as noted by José, since we have that define let's use it:
>XE_RTP_END_VERSION_UNDEFINED
>
>with those changes:
>	
>	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

taking that back, sorry. Just noticed this setting needs to be
re-applied on engine reset, so gt_tunings is not the right place.
Please add 

1) engine_tunings[] array
2) xe_tuning_process_engine (to be called everywhere
xe_wa_process_engine() is called.

This can be done as a preparatory commit so we don't mix the addition of
this workaround with the additional infra.

3) Make sure to add FUNC(xe_rtp_match_first_render_or_compute) to the
the rtp rules

Lucas De Marchi

>
>Lucas De Marchi
>
>>+	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE,
>>+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>>+	},
>>	{}
>>};
>>
>>-- 
>>2.39.2
>>
