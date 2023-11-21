Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060B5C61D90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 17:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E9D10E54D;
	Tue, 21 Nov 2023 17:47:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F1910E54A
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Nov 2023 17:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700588821; x=1732124821;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lgatBahZr5mxPTLcNfxkuIRupivbHUBoWTSQoj/wcvQ=;
 b=X2MPBlPgHz0x496d24RmGeVfU/sQlrEFE/OMPMcf4bkWbWk+TU6S0cex
 ni9hzFy0y7T5GtLGgIiYAA04Kb5ckZPdKUaHwULnBp3NmuewJ3WKSpCqS
 +qDcCoE815vwRFm4reguLOg9GCQkMarjmvU1yq5E9ecwnn0BAlsIlbia8
 YlsCSXGNQEzU0tg54wYSVzmt6WJuqszf4XWculyaImMIkStzVtoLTtNx7
 UpyM3zi/PQH7GyIVMAoODMGhi7sys/QET6R7aZOGv6XqF/TLmbzAJkF8q
 3OeE9nAwJhKWVJfl3iBosoJ5SDYYqakEuslt19QI1qOOVGjmA4gJ3SCj6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="422986876"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="422986876"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 09:47:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760170812"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="760170812"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2023 09:46:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 09:46:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 09:46:59 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 09:46:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg/WYU4oNUxWdeDKdgifmTIazPMvgnDV819IL0KgL3cLtF5TjLbeBffjDI02cFsmDabamBN35vb4lNnSjwOWsPHj+0vh6ZYtG8g1oKL4ro386VSAJwwHWtsqSRW92Tt9od4cwMCW+XY3K1zSCkoXTzQyHG37P92dZOvb0NkKIQQ6GYzNRGqCyboDe4N+A0uh3wFSvqb5o5fS7L+iTpbGhgufGYdF+HiyO6xOTS9AZZB6eadnq71IDAttSnj+s4U6njL32ChOB8NAxBcV7SUonZROfy88H9Tyt5k79T9hckwb7Q7rd5MCsd5WgErOx0tKXj5lyG9uT0rpKJxCB303QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yPQs0zyqVa9AUoKsepAHGKSzbwmEPDNKP5Xgp6hK6o=;
 b=USpvrLWs0KkV2Hii/Z4gwbNPfSqR/hxyJirLhn5WsWrGMdxLrvwEFXv4e5opCsF2QOtFaLptp70YNpI0AUKhV1R+US0OBnqq8dPZM8GS4XDwcuzpk5qzzrernGstuYcWFrhozBjSg3pnpmEI4ng3UEyd46gSIlnB5jTkJik5Qp3Ag+11bPSBz5/YRmcWNLj+lFludTTEEBETTIjMCgHi7yeK7e/6CYUcJFOHhyQLlqge/MviiTT9U5owh7OmbgzzNdNGathoewVLVSb2ww9gqwm5AVFKKp3dpDMv44ZGIQvIslYqLmzvD4xYdGROd6PkOkKV7C5QqLkYhHE54G5gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 17:46:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::4f1d:17b5:88b5:76b0%7]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 17:46:57 +0000
Date: Tue, 21 Nov 2023 09:46:55 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20231121174655.GH1327160@mdroper-desk1.amr.corp.intel.com>
References: <20231116215152.2248859-1-ruthuvikas.ravikumar@intel.com>
 <170047267782.29477.17397086124121381071@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <170047267782.29477.17397086124121381071@emeril.freedesktop.org>
X-ClientProxiedBy: SJ0PR05CA0138.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ff3153-6053-4e8b-8d78-08dbeab9db39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4LLbi6XMwkgZBMxF0w9l8rs61NF0KeQgNKGkFdHfmK0rIx8r3t1gARcd1Grjn3NNTu8mBMfDi8MxZIZTd9RXmymkQEcEhAFzy7cdcJ3uRIOEf0APM9povRS/ImpSlyd8CoLUw5vOUir7P3LML0N89T9MNTG9x2qdsN7m4GJYrBVWuJQZ/uuHrv8Rgyt1u5uVgTcA05LLhynnA5OJPX6Wi6bJuzFt7bpJLfIjDcEx46P2vZQSqOqzC07jTnoVSaxv8pe5evHqLHUXRvvssC58EudSbKRiTsV+dJmXnI7rYJGMnD7Q6hFxlbdwrqWdGPabquyOSR51JTDU4he4+nkERNQVteowtYE0hD+REXvjBaHsCBW5pYPwRhWI1SJoHEMrHnoTJYXbLu8+i0Gmwr7IPLn7R46rpBStCoy+1nnrjkQ8kuR1oMdKNbTIXMQRdHVI3YvZEOrC5h0Hw7pnP/pWmDA9r31egpZNyhXkFEgx80FcBN/UEIR8PKEDIjPc52RDm77OYHQIb9BVqkBAJHJaa0Yols73N5FpBu1FVFo7HSVcj2P+xvY3OIPCLOnhdLLQzHlnKfdnz2TTbBTs33M+ED1kxnTNJsCdjZlK+o/VRBZWQ5mYIGTxBSBu9mDivcYJKQS6Qj2ID2TA4bQ1Nx64g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(39860400002)(136003)(230173577357003)(230273577357003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(41300700001)(82960400001)(38100700002)(2906002)(6506007)(5660300002)(86362001)(6512007)(478600001)(33656002)(966005)(6486002)(8936002)(4326008)(6916009)(26005)(316002)(66476007)(66556008)(83380400001)(1076003)(107886003)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2YvwFPQlai4SRIzkf56JROxWMAV/1CK02C1ib46SF3gWIvwL1vgLyubVYLQo?=
 =?us-ascii?Q?VcUXn8VYmxUxpR7kMu8d9fkzKqunD7Pautv/vW2nMXGdNF+SgqoYY1/dv6xw?=
 =?us-ascii?Q?SKUq15sxjAcXwDB+qNXZ6S4gipDFW1usTWDAcVUSQPgqGznjQsSGeLoJibU4?=
 =?us-ascii?Q?vkQfk4Fp7zhW7oIEjEJQLZh4nwdfMZwCy4c4Gcmu6FJgRO2n4ZS4dC8r3ayv?=
 =?us-ascii?Q?P1hBh0dQ2n85W/s4Cp79jS8ncJnQXjJuQc4sNbn98poIyEvVC0wwRFAY83An?=
 =?us-ascii?Q?zaHixWxeKl4slY5q1xFr5xVd7u1/OP/8MRTC7+UabVeVA7bVGQc8+Zmpyhqg?=
 =?us-ascii?Q?XmZF5MXwfwdynOh0T+V/w1j/SyAeze33CbXN/UmG1CkR9wCwtgxdGkkZlHEE?=
 =?us-ascii?Q?cfTP/FermHrdAHEd/szqd4ar9+cJXT88w4AqnsmJ7rbPFtsa/52Mabi28K0B?=
 =?us-ascii?Q?iyXhq91ds8ahlTwWLRU06vfV/5x5L9vy197Kj+QhEFFfRuiBAMJ+VRXqgFfw?=
 =?us-ascii?Q?7wZkWQKkKFMpOgBqR1UnGzlPTSuFkTlA0/ync62cEyQij2l7Ur8l+p57MIka?=
 =?us-ascii?Q?HKEAWZMz49JHWahNWtYgG3Obxx6OriNKVxlezy8SBsnpi/vaewqY7olaGPjj?=
 =?us-ascii?Q?2FBP0NdcI9sMQIA3qg421pZHPxMFW9h2C92FhgtMB0KhYc2prlmLBVzUK2Eg?=
 =?us-ascii?Q?w28Y46si4HVudnuPyQbpfvbU6hRbu16VDvidVfICedSMxDS49plPm5jyGoPv?=
 =?us-ascii?Q?WXMB3stSHDFrF+8ouh3ZI9OpmyOJkxERipI3/4cb6UmIsR4BrXlsHBcJJwGc?=
 =?us-ascii?Q?/1mxVJH4y/WZUrY0WWZYfuT3O0IuKjEv8RuX4js7NGR0gs/k7QxKXuqyDkNz?=
 =?us-ascii?Q?6GEKIRnMwqdv2Zi9HvbXzwYy1s7kd0aKLICmpCpNr0uW3lOjW0UapaD5sshs?=
 =?us-ascii?Q?g/6Z15vk8qoh3S2vMI9QIFyPSMeHfdf9Kc01gt3JZVZNS5bKTUfaBxNR/TnR?=
 =?us-ascii?Q?ELMSwypLg4Qm4NQAPr6awQBdTVAnHPIboRGeXqs3BzHXVUwnLyMLMW19Ly12?=
 =?us-ascii?Q?6F6Bpxt4vTRpQCE8IdFWwj7ODywOBIjcHNuP0kTpNslw9T2q33VFzK8IsD7e?=
 =?us-ascii?Q?8ItpHvmVDwhlkgFr7vVIOXodOErsDsuPFxjKtJlMlK0lIo0XAdKbjMZdXMF6?=
 =?us-ascii?Q?fePxB9nrh3JzfwY41DHdqtD+jdF129KWdFzBvry5TAq6FQnnnjT3HCztOkl4?=
 =?us-ascii?Q?wswYAuzhP3oy0lPJnaznxnvyfRA32I3pTxLF0/0wRrwAx2uzkXUuMgGQW9bu?=
 =?us-ascii?Q?U4Ovis+D4vXBPnFUsHYFhrlsyoP7oPUbI282yznQHGTsmYZySeggQ0qVCHvf?=
 =?us-ascii?Q?DqQH0/zCGiHk0E2aXjHzBMqyNe6D6K1+dbkHeY+Dq0MT6qB1xOt+i5nBxe+l?=
 =?us-ascii?Q?/akM20Vw2l+ZYrleCA7GoK5Ajj7VvDEif8Y9uCsDjqEDSPp2v5rwtuY1YUwb?=
 =?us-ascii?Q?3CxebPOuxqqnUJfsly5p84hia6KOZ3vfcduZn62RCz8Db/zh1SHw+8i7+pK4?=
 =?us-ascii?Q?Vk6BH7/ucgO/KVGSSwwEmXclCvX7ZEO/kFIC7Y99xwyd3h9Dia0CZume4T6g?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ff3153-6053-4e8b-8d78-08dbeab9db39
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 17:46:57.2014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j+mevJWYdsoOAnDJC8jI6vok0NT30OHTNvY4j2e44lwVFgKzNmiPjl7oAF4vZ80nbOHnq+QJc4zIVm/wx6yVTBiuxtiAZJNATKcRtyjUWps=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Add_mocs_kunit_=28rev16=29?=
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
Cc: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Nov 20, 2023 at 09:31:17AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add mocs kunit (rev16)
> URL   : https://patchwork.freedesktop.org/series/124926/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23_BAT -> xe-pw-124926v16_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.

Applied to drm-xe-next.  Thanks for the patch.


Matt

> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-124926v16_BAT that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>     - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([i915#2346])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v16/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#692])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v16/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>   
> #### Possible fixes ####
> 
>   * {igt@xe_create@create-execqueues-leak}:
>     - bat-atsm-2:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v16/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - bat-pvc-2:          [SKIP][7] ([Intel XE#626]) -> [SKIP][8] ([Intel XE#541]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v16/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset:
>     - bat-atsm-2:         [SKIP][9] ([Intel XE#626]) -> [SKIP][10] ([Intel XE#541]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v16/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
> 
>   * igt@kms_frontbuffer_tracking@basic:
>     - bat-adlp-7:         [FAIL][11] ([Intel XE#616] / [Intel XE#750]) -> [DMESG-FAIL][12] ([Intel XE#282] / [i915#2017])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v16/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
>   [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/626
>   [Intel XE#692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/692
>   [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
>   [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
>   [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7594 -> IGT_7595
>   * Linux: xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23 -> xe-pw-124926v16
> 
>   IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-505-b25aa17bffa88c86fec716e40bdb3848eea17b23: b25aa17bffa88c86fec716e40bdb3848eea17b23
>   xe-pw-124926v16: 124926v16
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124926v16/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
