Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC2BC30633
	for <intel-xe@archiver.kernel.org>; Thu, 17 Aug 2023 15:08:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F68310E0C4;
	Thu, 17 Aug 2023 15:08:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC28310E0C4
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Aug 2023 15:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692284884; x=1723820884;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5PyoQ6upRErgzPVgxxxZDthg3FJ55+UNFycQWWuZuEQ=;
 b=d2MG9n0rAJg1wu6aLvbYyxot/lyq5ZA9zQJWAybr04Mg60Qz8EgVU0MG
 msKbwfubVIy8nWCeR6028fzDFcvwBu89oZ1P9ZxpNNbuqJe/FL5qxhL6w
 JXCmjrBzSJyyFSTTFijiCHBI1AtEEq/7qJKeWHg08SXF8fnouiZMk0zbn
 Pag8rs6f0b27O2MvUs5OR6XOe84o38ikI9J86UGrjFvjhlxBOD11rHQkw
 iLul/yPeYZoRjviwE1fmk+0PpvHOX5K/ylWThwaezhZVdFHbU1xNxcSt7
 65Ct9GVbQiQ7XMbOexZsbAJ0b8F8iVI7JEq5XG/DaePFU5Yjsz+FkFnib Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="403818801"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="403818801"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 08:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="764129165"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="764129165"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 17 Aug 2023 08:07:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 08:07:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 08:07:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 08:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmL0Xa6evXgloFPm8hTlnpcWyeXWt+xkf18hacKJHrW8hczGEYhCQfODOMDlyFNQM0qLU2ijo1YaISIDBCiqOrrvtYhsRb8SrR51VXv9deleb5W9/1vIkBdNmL0NVuI2XQBJ7tPWg+q/S+ES8D4zGYTU+TV+ZjcPYzTSqR2OS+dXdJ0vFk+sylicQVBokio7MJ5xUIbTzPrWg7KnOdIrHFfrhkV+JUnxhxlE/MRjkZuo2TNgT+jtCJ8HZbUwuFp1dhU8CJtd0AHSId/TTUCTPAmXNbXIZ7nl64bkJSaR/DFjYFSP3HuXAhojOG6Bcy7NMyVe/D5GI11iWw4ufrn46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oyGGgaKf2Wf9F/TBfJr4Vgq8fYjN3qmw6opA+bCOqY=;
 b=HBBT7xL+2hK6BAsfbmycwmPY2xljQeXod7wagwoCDPtQ3DiJ03JEHYKQFIPNTqn1wodPvQbO4MMlVA7mPXj33IwijHaQz43zlmN8UKs8N+2LD9FN0ayByMefGs9qZ5SBxWDwhu4ro0tttC4aMihe5SIkuN8mSKBGuJyoI7X1+t5/D9K7NMFAO+nOdQKVykbxtKcUnyhvkYO6nS94v3G18pCjuT3IFyPzG73If7CP3Gn+7wZpFSWWw4uUabXCfTPSN2b73IR65ZpPqwZcc3b/kAyZPUgUosDfIM/oJHyAF/6bXy70iyQ0rKlpp15APDg7NJ6lm+4ig+34YBbGFgCbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7479.namprd11.prod.outlook.com (2603:10b6:510:27f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 15:07:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6678.031; Thu, 17 Aug 2023
 15:07:26 +0000
Date: Thu, 17 Aug 2023 08:07:08 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <2hkiidimeljpu7siqe55bxpnsm6ns7zwnzaab5ezsgsodihuwm@lkgtbh7uiay3>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-15-lucas.demarchi@intel.com>
 <ZNZsyVXLMl7QvrIc@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZNZsyVXLMl7QvrIc@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: SJ0PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7479:EE_
X-MS-Office365-Filtering-Correlation-Id: d29510a8-408a-48d5-99ff-08db9f33aa31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ql6zWhLUonWMmQHQS96nlMeDAL2iGND56U8A1nuRFrZpo0mpcNmdMGZ3EkJ0KD5Qnru2D+WiTmVn3wQeDyDtHoHo1kEQ9Buv3SRKg49gAJwS49h1ZxQSahvbmMr1ea9UNfLB5el8HJrFs8pNdqD+Pa+kjWRQ3dRvkaDCZ4XaXiCRCZbkkrSQ2vnjml3hEYsLB4GTLIz+nOZ8JeE2NzB45mczhciTMEKSb1V3QzuuyLIP/yWXIKy62IL93aWat6VNc/5vTXsaVNUGdxy1I/9ZnymtAndxti38Dw5JMLWdA4uPwW3812gQjFeMxrysIqSeW5Ep6FYtha0Bk4MR29TuNodIawdEC344e6xKqPC3ANe2K7hJhAR7cAiCOmzJkzKf5oEpKR0IuG3J3WPy4tFVDivU2wYJ3Hckx/11apHGFeZYILNZ89aTN83SlDlqlQFKQ44xaS4W43RHtZoS1rQlCU7PZJdDD4q1YP3JXpC6ifwH0NlU64/S604pvta33NXWl6y3PrecAHb5CTnBt0+7PfPYmdh9XW7qBcomxAa2JbTrbkg9laOlHl16PE8+1F99
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(107886003)(6666004)(6486002)(6512007)(9686003)(5660300002)(41300700001)(6636002)(316002)(54906003)(66946007)(66476007)(66556008)(4326008)(6862004)(8676002)(8936002)(82960400001)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/drrD/MKPpJK2OgNk+fGCS9HvH6EH0pCp97hDVuOV7bCEW+8qb7EMlq3lqt?=
 =?us-ascii?Q?u5rBH8T4RPOXo2UOvg4CsRYLgXeVuey8eDilDf6AIo2zl1yLLgWWji6pYXP5?=
 =?us-ascii?Q?wTU+UWfrXXNb77BQ2hw2obUsPriGpVGqiJGiqHZe2reVKqJD3CuaiLhafIA2?=
 =?us-ascii?Q?yRSoNy4vfujST2n7lArvkoSzxV6jO3fOB6IDoJ1mOPPcXOYC3yxBf6xjIp+i?=
 =?us-ascii?Q?/qC81pH/BNunUYsgQ0twVh7pSL71Hs9Js+JVz+SH/EAbr8MuhtNTxPTLOO85?=
 =?us-ascii?Q?reMe57Ls2hb5g35eXxcTlzh7JhM9d2tyPDW+qYN0SO6XY67vyJl346lTqcct?=
 =?us-ascii?Q?heocrxqzazyXDFRcv7G4U03t4WmODTeJeDAtAqOSsFXGRmoiGIHj5voNxOT3?=
 =?us-ascii?Q?EmMEt66El1HhmPxdznoWRxOgPm+mDpweMqlab9qF/JyZjruayqQ8GkyPPSEG?=
 =?us-ascii?Q?vLlZklTW788R66QrzO3pcngoEa4/rSZdPA4lgZRzyjuADMLcI1h1Ru17RW2I?=
 =?us-ascii?Q?tVL5/6FkS60DxdOdhBy166EpvvRg1JAttMot+gGbE7bNsCMIrwtFyt35xiI0?=
 =?us-ascii?Q?YOsDM31Nr9Hj2kZT1fJqcLCxV4ELLx72LR9/8OAhz0ahlHYqEYBZjzbVZLFj?=
 =?us-ascii?Q?nykls+ho8JeuW9Abornv2lmXb5dVAQ26LW5R69wOiIfKZOkPTAenbxbC7cef?=
 =?us-ascii?Q?idhXO7W2BuAlc876JJUPyuHPO58NyFkwdOtEjwZldYUV69ckqQIbzYnOF60O?=
 =?us-ascii?Q?g1yQO6HH0Nlm+kuPKQTl9Tte3BSsmCA0vRl50eZEvpi3OAgKntB4ZeD6MEvs?=
 =?us-ascii?Q?18YEw36PDllr7UW+T3Cgb4bkyZbmNHm13jaFB94CqjQFwUQmcuIcPu/Uu99g?=
 =?us-ascii?Q?IIUyLtnT4mpPZuEYnR/EWoLnjrpyGZ8O1pSiC1bkNPiHmd/cHQ+1y3SocGrv?=
 =?us-ascii?Q?aAtgWeMKvscO+VbuToz/gSH7hvCfYb579o7+FsEEUJAtyhsz+mZ2oE1utpMp?=
 =?us-ascii?Q?aNTYvSulIeKDZUjKSc9ZSGuR2Ldu+o+LhAZtVTwEjPnZ2zK1576G1sZYl7fr?=
 =?us-ascii?Q?3qfA6M7V6JdyLJ6CDFG0yktx8RNNQLuKt7m+Pg8A2oVTZTWt2DLLi1DjISoN?=
 =?us-ascii?Q?DrG+RBORKEhPCYROjf3Z+dIXuIrS8rQGL3Xm65tSY39AgCGHXEfuQZ9KDjvN?=
 =?us-ascii?Q?bK/lKDn2VhjJP0I7DE9LgEl2oymDxsT+iXQo1l3Y8fJotQQfqJGtpo77mRVG?=
 =?us-ascii?Q?ulb0FZw+0qm2N5FSDFSj7F5W19wvL/iwuXsgfeMheuoFJrA8s1wNJestMcYO?=
 =?us-ascii?Q?MD4C/3dzLlITfI6htIE/hwi0LNsmyGW3majZqCLWfw2W5pUw3fr2jKmdItV6?=
 =?us-ascii?Q?phOjS0PRsZWVe3wmA0GYh+S05T1e/hVyPY18NZ04+elX7D8rby88kB3OHQhh?=
 =?us-ascii?Q?Fk/VJbfZr5/EeL1Or247lRl65DLLcCFqlcQkq/ydZT7LYhiWnBsbfDONpoWW?=
 =?us-ascii?Q?D9//CcLCrGuM1+xux+ns041S1cPv2cSKp0HUEzMoAimYUBwxtbFniH8RfDwn?=
 =?us-ascii?Q?jHx3uFQCQKH0v3v7RB/O61Vn8mcOVR2YJ8hHMre/BbspVX1zNP2Wr6P1rM3P?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d29510a8-408a-48d5-99ff-08db9f33aa31
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:07:25.9289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqIQ0llVtHWAhAdyRTNkAFQOfFeSvya0QVn/skaD3vnDno5tamXEyVmgZ4gDx9+WnYgTPow7ZQ/e+CuerYG9MfZaLGoP3+p2vjS8oRN6gfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7479
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 14/15] drm/xe/lnl: Add GuC firmware definition
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

+Daniele

On Fri, Aug 11, 2023 at 05:15:53PM +0000, Matthew Brost wrote:
>On Fri, Aug 11, 2023 at 09:06:17AM -0700, Lucas De Marchi wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> Define the GuC firmware to load on the platform.
>>
>> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

thanks

>
>> ---
>>  drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 2e70dd4880f60..dd6a68ed13894 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -100,6 +100,7 @@ struct fw_blobs_by_type {
>>  };
>>
>>  #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>> +	fw_def(LUNARLAKE,	mmp_ver(xe,	guc,	lnl,	70, 6, 8))	\

Daniele,

Can you send the guc firmware pull request to drm-firmware (or if we are
already using the new repo, to the new repo)? I think it's better to
hold on merging this until we have the firmware blob in the right place.

thanks
Lucas De Marchi

>>  	fw_def(METEORLAKE,	mmp_ver(i915,	guc,	mtl,	70, 6, 4))	\
>>  	fw_def(PVC,		mmp_ver(xe,	guc,	pvc,	70, 6, 4))	\
>>  	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5))		\
>> --
>> 2.40.1
>>
