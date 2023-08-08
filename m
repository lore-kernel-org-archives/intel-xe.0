Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F2BC001DB
	for <intel-xe@archiver.kernel.org>; Tue,  8 Aug 2023 14:37:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1DD10E1EC;
	Tue,  8 Aug 2023 14:37:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7147710E00E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Aug 2023 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691505453; x=1723041453;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WFXfF5C5JIhItTfGe56sNt0oikRRzdPCywo7dP051Fo=;
 b=Bt6Aas65sObFCiEQaWjlS3IfqSj/N07vf9JniamWjot0RAchddSgck3a
 IV2XPPuoqNkMJqe+6eKO2Ohh7evMGqqMmM55QAB/ipQckNo58HsSrAc9p
 dfWxXQ4sCWAS4F8vjpPDAKDBkgJMNgviJ/xfHsycv1JKFmnj6vSbkNfBW
 oSax9VZI8UPOPgJLo5Pvl2RN871frmUxfoIXZ/umpRpncYNXL6ud7Zacv
 TMClKe7ne9cW98C4QERK7i8xfqvHfSWDXUvenBV5NQ+26aBmQ6kSLsTiw
 TgXy0G7AHdy4BnuQsLYrE7j1KkQdpEe8wZlNN/fnebrpwV8ont34jeGBA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="401800402"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="401800402"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 07:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="724938740"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; d="scan'208";a="724938740"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 08 Aug 2023 07:37:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 07:37:32 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 07:37:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 8 Aug 2023 07:37:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 8 Aug 2023 07:37:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxSlw0Lo2O6V9TPLuqZRzAlNTx/0fbT04oiZ7qH2g489l+tIotGnr8j9B7QKQM1UvPLso4Dxi+eH+9m/9IoXg4JD3NH/q8WPGTx824/h7bY3xkmDrY4ETBv3plhoZeYi1RUaPLOMvEBUqjPNI50Yfe+R+I8+MNZE/rDGKQ232ojAru06XWtp6Wt2fLiTZjsudWwxd2818jI1LDLdrPnbI49MK0oBSlLuiPQmqsZCZpku/KNP33BY117FpgJdGlcOVPTZ54WFIQMnO7pFdG5qGKK/ye0bHmgpBJZjg6eXmUXvhoCzw6BQ/P16fpSyEEBA5ge+Tl+m6AmiQV9JdbebkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaOEGJEivAm3TA1XHPX/HaJrfzzDOF+lDZ1N15Jw2xw=;
 b=NM1WiWCGcslJQs8KkPMrkOrfYm+emYe6NhH16GwtreqtPqk8UYN47Pmhu1L6KOJfwk6mV0pjbEiDMrRJzqUTvhM874mvIRB/UMMmmKixGj/TTUE95mw19CmvBSBQu1OH7O3aLDZOMuYezMcZcl2oAGGk77xsbjVUadZkpMMq6iuvd6r3Lcr4YY7QsQ+TeUGWNl9V4gO4TRcSNts9tjeu28mHUac2h94HA4E+EfmXTkybCU5jVeOULgkQO1nab8/EtdBO7QocAbr8ORSriGzeeoNQbwlp/wn7b2gNr0/R2dFcaph45L7XsBT7sO2g8cyDOb0jKXTLPf6e1XMq890Dig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6956.namprd11.prod.outlook.com (2603:10b6:510:207::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 14:37:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 14:37:28 +0000
Date: Tue, 8 Aug 2023 08:37:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <a3bof7gwvoiqgcjlvhogomb45qhylrn6i3mbetvxofs4sthe5u@ka2lh4hbmsk6>
References: <20230713150611.7-1-francois.dugast@intel.com>
 <ZLBfsNWDeWYx+c/X@intel.com>
 <3zwh5c6wvaure57flxp5jrqe2rira6des6an3ws25anrauxsnu@a24cb3vjzbh3>
 <87fs4tu7xl.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87fs4tu7xl.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 998f7c14-9f50-42fa-e413-08db981cfda6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOlYZc+astvRLr2F0sd45bSivKjkXsvHDd5VvPNLVV57P6lB/fukhLMkIiChzlO0YJb33IdUhfx1CK7K6J/PhipaivhOIkN4CcQtExW580QwwxqS9T7YqSo0Et5MBVQcVrWEVRFN63fwn2VmHky9XQ4f6NPNGI4lQH6HTxY59GXyfkSNZMsHzPcmG51WVjvHRBWsg0ayOkF4X19DGDz0w9RoOrjYywUfl6mBa3GhCF9nnRcQJT2RxZzTr5tBH+0nzIghw46V/5cQ97oJJtkt6Xn72YKeQuQFYSwM/uGXlWNWkWzm8PTtHkwn0bfd90hUREm6gk1FjJAwqH0s7i+VC6NRUlfrCAP3+adaon0pJe4PiTplatb8MxlUdp+cbEmK9rBBgvdpXAPjwALPC5kjjzu1lFYPMl/6O486ScCflZ1wN2YZkofkPXOKLdICc82+qRlwiMWcA+tBY3W8AG2U573vrCTreZA4eUHma82t1fKkZnDI7Ma9ao0TIF7lTql+EXdoCy7dFvI6ECPwIvuAmN93oLngu4CNX/NEfgqCp+ZDLuLaXe1416+/+kGKEvYo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199021)(186006)(1800799003)(8936002)(8676002)(41300700001)(66556008)(66476007)(66946007)(54906003)(478600001)(5660300002)(4326008)(316002)(6916009)(6512007)(6486002)(9686003)(2906002)(83380400001)(6506007)(86362001)(26005)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8PUsAkxLw1WT+nY6bI79nRq1++ylRw6uwZpwypimR/r6cCKwEY3A+YJTfEuX?=
 =?us-ascii?Q?JbYc7Xd5/t6hqoM7v3wbHVnDhnAx5zURDn99O5ZDfXanFHCYPUJ9UZEjWop4?=
 =?us-ascii?Q?RXWceV66DOLXrFaG1LNM07z54J1tLfJi/zxz9ONmdaUWTTNzwcmi/FXeayry?=
 =?us-ascii?Q?UdjMvQFHCarlPs/6S8wurlvisvuYrAXQrDKOXxF1Fcvusvzhdbdg96xNYCts?=
 =?us-ascii?Q?3yC4oT563ENrdQ2oJgL/bmPep/XCfig6pbMiNe/xXH99qMDj+t6VEiiOJU+5?=
 =?us-ascii?Q?dicPo54+hDXj6sZi2PGcr/0k+M8A9fPC8vVTXgMUnBNYZJpj0MCad+oxIC2l?=
 =?us-ascii?Q?/ofhMDL7U2H3MUnBV2UQUsPgiX+VdCC/nPhO/kqG51zin7G0s95oEY8uIos7?=
 =?us-ascii?Q?S7ev2cEf3ujR8kOXbpabd+VRrcBf9CDhFg9eS5iluQhBuOmPjZdN4pLTuBuR?=
 =?us-ascii?Q?YU/KWcf7BLiBqIdiJOqBlrZF/PcY8E9HeQtRkwwQAgnb5swNEmhTGyQhyu2l?=
 =?us-ascii?Q?F5qIjOwH9ATFkNxKd9ldBFwRdI2A3osekA+OxrSd9mSDQ3Hq2colkslKIw6r?=
 =?us-ascii?Q?hgosu0THNw9lFgM6+/xcw2ByK4m8OZD8JB1Q05oP/lhw3m2jumt3YplCrMsm?=
 =?us-ascii?Q?j8aPvfhz6IDDiJokxbAT9vN/dlk3rwe6kiGPtPyZVjngcU0/WC0BtaIG6meH?=
 =?us-ascii?Q?kGVtrffdBkhAQwmRuSCB/OettL4pPwh6Pd8SdOodHTiq9oWh2T6dL0TRmTZB?=
 =?us-ascii?Q?G9254pBaFoOZGF50+Tsg+C4BHFKBnZyIAZH1SNzP5yYerQj02nlejMup65g6?=
 =?us-ascii?Q?I4/o0J5KcGVGl5Z14AC6r3JFZZ+K1EZlK6+HDmUbwpVygt6k/tWLB6Z+0d/Z?=
 =?us-ascii?Q?BeDMRCi/1MsjANfnvmBawjJQ6t2hJGo5NGfGg3VyGKiZBrfh923R6YfMAoOR?=
 =?us-ascii?Q?U4QqaEOGVtoT8M6S4cxHqdlVUyQirNAklJJv69pxqnDrxzlxvsFNREkgAet3?=
 =?us-ascii?Q?J0Z/Uxfsnz/mF7p3EXClvsNGVB13o+rOvC2ftBLTxa3G2OfB0Cam6BYqtx31?=
 =?us-ascii?Q?got2El3lQAK3bsIDAdwwCg/b/lWiWGxXpYPuHM6fC70DMbPGfPtudkGDGPzg?=
 =?us-ascii?Q?aOyFyA+/Rox5ej3M9Q9rPMEFhp2dSu+jVzrf4Tz0ni2n31EjznN2HeT2W/H3?=
 =?us-ascii?Q?qmDhTa/gTZxnDowOnRExo6D+z72qxxCCaGqL3vChtPNeuFwvWmWPDq/mq2E5?=
 =?us-ascii?Q?UM0JtbLCi6smsQeXGWUELUSIaVYMifNvcL373g66AkSyJL18gU8HMhbxU2+Y?=
 =?us-ascii?Q?ia8ZphdC8KeZ9QjeZsM8eKpz2hr6WJi7SFoPnFLTg+9F4OYw7r4YH13MNtBm?=
 =?us-ascii?Q?YTgDEBpJDC6DteW25m0GS2SIUZQQiExdtHQrpBcDafAMhTNI8ogOH4Tnal0G?=
 =?us-ascii?Q?B7aiURoX/P8mRb9AujsdT2AlPZYkYLZx6TCyQpVJrxjP7/pwQKl6WrvSOLXb?=
 =?us-ascii?Q?K+xDOdxAoJt9CTPSSZ7SnTTxdyPNhR+oTzBb424lF//mIeTYecPwrBWPjXbd?=
 =?us-ascii?Q?GJ6uUKpqV+MUFU1LTvrU5kNdbsUluyv6VWWqyjnAS/NY2u5oBMhAn3GF4g4u?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 998f7c14-9f50-42fa-e413-08db981cfda6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 14:37:28.7086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmsNEhaqOFx26l6d06ZszKI47vy3jCrAlQVw87TE/YYD0lFFSspJYdDPQ14V5FfeMDT9mfiFeHbrirXmY5gi+VQW8C8Gkh9X6ertVyBAo98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6956
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/7] drm/xe: Code cleanup
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 08, 2023 at 01:47:50PM +0300, Jani Nikula wrote:
>On Mon, 17 Jul 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Thu, Jul 13, 2023 at 04:33:52PM -0400, Rodrigo Vivi wrote:
>>>On Thu, Jul 13, 2023 at 03:06:04PM +0000, Francois Dugast wrote:
>>>> Fix minor typos and reduce ERRORs reported by checkpatch.pl from 95 to 22.
>>>
>>>I wonder if we should do this with !fixup patches...
>>
>> I think that would be a nightmare to thread through the conflicts.
>
>For display it's a nightmare we have to plunge through. And this just
>made it worse.

This is automatically resolved when we move display up in the branch
though.  "Automatically" meaning that the pour sould doing the rebase
has to resolve the conflicts. I don't like doing it, but what's the
alternative? Last rebase I did a "squash-heavy approach" because moving
display up means some commits don't make sense anymore, even if they
apply correctly.  Those coding style changes would just be squashed in
the respective commits.


Lucas De Marchi

>
>BR,
>Jani.
>
>
>> Let's just accept the mistakes happened when we werent' checking
>> for checkpatch in CI.
>>
>> Lucas De Marchi
>>
>>>
>>>But we anyway need this,
>>>
>>>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>for the series
>>>
>>>>
>>>> Francois Dugast (7):
>>>>   drm/xe: Cleanup SPACING style issues
>>>>   drm/xe: Cleanup OPEN_BRACE style issues
>>>>   drm/xe: Cleanup POINTER_LOCATION style issues
>>>>   drm/xe: Cleanup CODE_INDENT style issues
>>>>   drm/xe: Cleanup TRAILING_WHITESPACE style issues
>>>>   drm/xe: Cleanup COMPLEX_MACRO style issues
>>>>   drm/xe: Fix typos
>>>>
>>>>  drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h  |  4 ++--
>>>>  drivers/gpu/drm/xe/display/ext/intel_device_info.c | 11 ++++++++---
>>>>  drivers/gpu/drm/xe/display/xe_fb_pin.c             |  4 ++--
>>>>  drivers/gpu/drm/xe/xe_device.h                     |  6 +++---
>>>>  drivers/gpu/drm/xe/xe_device_types.h               |  4 ++--
>>>>  drivers/gpu/drm/xe/xe_engine.c                     |  4 ++--
>>>>  drivers/gpu/drm/xe/xe_force_wake.c                 |  2 +-
>>>>  drivers/gpu/drm/xe/xe_gt.h                         |  2 +-
>>>>  drivers/gpu/drm/xe/xe_gt_clock.c                   |  8 ++++----
>>>>  drivers/gpu/drm/xe/xe_gt_debugfs.c                 |  2 +-
>>>>  drivers/gpu/drm/xe/xe_gt_mcr.c                     |  3 ++-
>>>>  drivers/gpu/drm/xe/xe_gt_types.h                   |  8 ++++----
>>>>  drivers/gpu/drm/xe/xe_guc.c                        |  2 +-
>>>>  drivers/gpu/drm/xe/xe_guc_debugfs.c                |  2 +-
>>>>  drivers/gpu/drm/xe/xe_guc_fwif.h                   | 12 ++++++------
>>>>  drivers/gpu/drm/xe/xe_guc_submit.c                 | 14 +++++++-------
>>>>  drivers/gpu/drm/xe/xe_huc_debugfs.c                |  2 +-
>>>>  drivers/gpu/drm/xe/xe_hw_engine.c                  |  2 +-
>>>>  drivers/gpu/drm/xe/xe_lrc.c                        |  4 ++--
>>>>  drivers/gpu/drm/xe/xe_rtp.h                        |  4 ++--
>>>>  drivers/gpu/drm/xe/xe_rtp_helpers.h                | 10 +++++-----
>>>>  drivers/gpu/drm/xe/xe_sched_job.c                  |  2 +-
>>>>  drivers/gpu/drm/xe/xe_uc.c                         | 10 +++++-----
>>>>  drivers/gpu/drm/xe/xe_uc_fw.c                      |  4 ++--
>>>>  drivers/gpu/drm/xe/xe_vm.c                         |  2 +-
>>>>  drivers/gpu/drm/xe/xe_wa.c                         |  4 ++--
>>>>  26 files changed, 69 insertions(+), 63 deletions(-)
>>>>
>>>> --
>>>> 2.34.1
>>>>
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
