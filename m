Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5C3C77B73
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 22:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6446F10E177;
	Thu, 27 Apr 2023 22:20:33 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F7310E177
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 22:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682634031; x=1714170031;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q+ROwe6XYQgKXQ4LIi525i8AntqNTBWPaR2Pq0fCLvA=;
 b=ew9Mirr5IKmAlliZwVVn2elh+IW3JIw8GY2GIx8j9O2sLiXZTv97r+Db
 ylt/OE+Trr4UIIAEdKu6JE4cbTE/RTKtZ6dbnAnKRLfpc7tlU02NBOXzo
 X8gnLT0+rw9Tc2s/CKMfy1lVofCUSYQDPvKEL0hPRntrHU+GzIfaevHtI
 TXNC8twjgwWGQfW2huvCARar3pCdjx40GsIeoT9TYLWy/3Xzu+M5Pd0h7
 XiLf2Ou+Kb8QiLY37+rBeMpU0ExTJ/C+3IFm3yaElKXMTE0Y8UXmYrsMv
 42ascfisziPE7fk9cc7A9pjTL8UCICR09VBCyLhZDt8XUqPz9PRKCF2r5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="410642364"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="410642364"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 15:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="940839263"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; d="scan'208";a="940839263"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2023 15:20:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 15:20:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 15:20:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 15:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZG6veebMA+z9u2bh5KLSm2Q1Pwre23NUDZ++ZVCOgr9H5pb1WGIVVtYZ2gfKQIziO0ctwsFbiwfZvBXeL/iRm+MC7GoR5RqKxGP7VuZC4w2pY9c1WDyA/a3kK7bFOyoroF/P0yD/J6uRuuoLviXkdsK5b0ZF4LQPauoFK6K/O47JJx3o4v4/7NEYy2WDvpDJx6wJFf0PBfOLvNPe3tabTZR46FbIK1VRG+4jGIDsRh3ujqs3zk8wbururMrUQBbsOdND5N1BGZAcwalqiTMaSD3gBak7MI7xRFCpJuyu+4vIA+fc5eW/0o2DHKkArkSiDtHd06LqKCk1CCDTNIdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLYYHZRm5+adXyuyUTgcvWkqZCaLGtt+YNmjtUCtjpk=;
 b=UFMNkS+eOeyaAIGXc7ls9k1QUtMSOVjq6p7Qm7COLS3IHSDvYJOt2RTs3yCUW9ApJ9oUMkNNYH0Yf/ZOQrZRmOePX/ZGp9NuIai3ZhRl1sitH9mlkLUKAhXVScIHiCzh+9E3xyVMveaA20uKF9+Kj+Q1gmeCnUFbiBVXLe/gsBamtNNRvh5YNdSrF/Na/+r5OG7NQ0S+Ath6lSh9r1bmVnU5Utnw3ua4shvjJgHGHY1bcZn7sLRF+7Yx6PYnnMnKt4oCQS07B/6qhw71f7rSkI/EF7BAFW3yZhG6SpcccV4yTblIKhEduM500roZY8HggAii8xBFjDPY7XYG5f4Z8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 22:20:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 22:20:27 +0000
Date: Thu, 27 Apr 2023 15:20:19 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <luz6c7bsq6txmjlmaczrlyjangj7zzhzpecv2hicif7rsrnpzy@lr5qpykdn3mt>
X-Patchwork-Hint: comment
References: <20230426213242.1315119-1-lucas.demarchi@intel.com>
 <20230426213242.1315119-11-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230426213242.1315119-11-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 451d7f48-93d2-45a1-a52e-08db476d9a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gVUXkUpF7amPZUYM2ZBONO4SEtRPeRS2FveyMwnulMw+cVNWLmR9tYR733Yf68yYhdxvjiGZiw0xEwg749YpVlM1+3BO8mWSxUwkLGTdRW7mj0CiaXJSZDuwhQNKwU+nwZcrP/gjZBPZXjuNt1hbGmHzY7PIpaZ7scqulZp0k8NBXGqGD//F7vd9ULoX6I//NUX6uVaxwm/gLIuLzs1qmFkcF/yhtHlFR1s4hwiZqajcZxEcqlBPgXQp8bEgkXkkClFMN+fdvRTgKy1GVlk/EcDw70fWKLRGMMObyaGpe6fRTCGj+eqbs43YpWUKPbAM5C3/RAY/dqppjfpV+SkCHeAcaJEfeuXwarZs6rM4ulEyHiFvoTCDniYFY9oaPr/hM9vGcPSzA2DPe/pspZQxxB204BPPBeMnSjkLuEePiwTvbrhnXRMgokwiaBSgZrRvyssEB6q1srGIE8tyCbVk5RaYI4pmGi1J7ZBXZlyiafCUMhDGKDjOM6J/6yMaJ8t/HTTzVb3Q22Wyj5h7IU+/i16fsYMQeDz9AZbVSp3qOMw4hVVtdg12Hiw0ZC4dLSNL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199021)(83380400001)(186003)(6506007)(6512007)(9686003)(6916009)(4326008)(66946007)(66556008)(316002)(82960400001)(30864003)(2906002)(38100700002)(26005)(107886003)(66476007)(86362001)(41300700001)(478600001)(54906003)(6486002)(33716001)(5660300002)(8676002)(8936002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2iyQO7ySqSWEorv79Wp3cVfHTyABEPXPtwLbMG9LXa3YmV5MveEoW3pxEMhz?=
 =?us-ascii?Q?zObIECfXA1AQB0RUI8xdjsvCf2GGFUM/JRci97aeTWuR41RynhdIWbFqXfdf?=
 =?us-ascii?Q?X7pjQpBQpxCCoKR+3Wh5o3Dsobwt3spD50vjuxf50+Ol+Hsx8eu6s7sgHGV6?=
 =?us-ascii?Q?WmDH36klTfSr4kzKW+tVIqa6pOyYpqe3EQZOT+BLaIe2e1boqPp419Lv5aJu?=
 =?us-ascii?Q?gmh0LxmdmWb8ox5jWVHIEFSgse60KJQTocMtK/KLGiNHuQzbjxL84Ua2BAZg?=
 =?us-ascii?Q?si3Ir8Juqt1ZQ+b017WBVGIYYwWvL8nhTCFqIlWdAX/Z6ZHYa1ez0TYlfSaV?=
 =?us-ascii?Q?HF4NEP9MndCxDS3IKfspfT6zLMjLno/a8P+XivAcHTCspXf4yA+Wu1sbluz1?=
 =?us-ascii?Q?+rxHisdR1mF/26uy3u1QH/CAW/qNeNGgGM+FVBZNHa8zeo/lYhfJ1y1E+NGP?=
 =?us-ascii?Q?/zbc2I3Fcj+MGA48JtD82LbaflUpKlQlER0T6kF8R20pMIDfinKgIJwcex0I?=
 =?us-ascii?Q?nKhuP2PrdrgNOqMY9jffT03uTLIIB3Cp/DgeC5DlaMFsO6NDgGh7Lla37ULk?=
 =?us-ascii?Q?bR75JliEdI8HYnDx1KH6VMucqDONFHRnPLifG9vTepF4fL3/3YoEYuYFdO03?=
 =?us-ascii?Q?R6UhIHjStRrSwVv/hlmzMkUI2K69x6tz0XlQ4FauOheJPIKiBM1zTaeQeoDn?=
 =?us-ascii?Q?LysOA5MyBazO6i0a6HwpxSDV3FQS9NkGcTLfLEY7SK92zzXwUMRZ/1MR1xx8?=
 =?us-ascii?Q?QSOOklsMcfVbxHjB18qPg4CwYTdVpdpX+lFpz+sNktf0/e4LznakCt7im5Sr?=
 =?us-ascii?Q?eyVSYMhkIvFBptQTHUMzjyvf8figKuebpVGI4LdL0aSCnOuQ6MVyC5LolYsR?=
 =?us-ascii?Q?90wYWNu4jOTFnx8lFi3AHTeTeifKNPk6Dyk+KniL5115mAIdzJn0DS5ptrBi?=
 =?us-ascii?Q?kpQ9XhM9sQSKCiVgJJ5mwM7OyFK8aBJyh/nkWLpmNTIGmYv1W2shMaXj+Kjn?=
 =?us-ascii?Q?fGDvjR7vFmhIqyadtP19y6GMHgIMG8HQkDIAOlKMYxYadyApj3xmXbjsCjk4?=
 =?us-ascii?Q?krU2zGMtV8R84Hwg9K+6DTf3fWg+2KxxZLwj6LhVRhVGxc0A04sLFn7y0RQf?=
 =?us-ascii?Q?8E/v2n+mjO2VPD/AdLC4mWY0QBKSf0+6xNXLvhYVNC9BgU4q/v6c7y8vnTFP?=
 =?us-ascii?Q?vQ6uZYu5mTXIfaJmR1grcfXJQumCuInETAoCGvItSBarEBIJNH60kQHFZjT6?=
 =?us-ascii?Q?p+SQYnUHHsgKCa+ezHHfazsVTdDozeZwKw4IrQxsLpsTEQZdlIc9EXTFwI1b?=
 =?us-ascii?Q?0Xo9vGXqByRjIfdXAEsebgso5RFNZrNrWmc3sSG/wznMT+l3ujunzcianig+?=
 =?us-ascii?Q?fTEom513XY/ziAFTGbt+rAoYGSYA53DxKV8+hrkapFpDLQo0vhK7Ta8miT8I?=
 =?us-ascii?Q?+AH9IWHE2hPG8rJY0HNr17PiINsTSf8AlrQhL16bfWWNv6PGp6BObVdgzPJK?=
 =?us-ascii?Q?JuTjl35zXVPAsG94c0fkmruRcslUzGZs8pG4/IJc1QDwMC+lfGX9Wl7nANBp?=
 =?us-ascii?Q?RlbGMtfcSBQld7j8jLpB9es/ulTFScCG63RlMf+iUYoUzTkKJJO03DiKwkai?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 451d7f48-93d2-45a1-a52e-08db476d9a83
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 22:20:27.4268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eM0erRhTqnI9C8DoK+H/B1uheltOpiAOddTVimlpDFlULBtKnbhSQqUAQ6OLNkxVaZT9k7WwIhJyDOn/6qjTNo52x6HCydAUoBBip4c/IvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 10/17] drm/xe: Use REG_FIELD/REG_BIT for
 all regs/*.h
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 02:32:35PM -0700, Lucas De Marchi wrote:
>Convert the macro declarations to the equivalent GENMASK and
>and bitfield prep for all registers.
>
>v2 (Matt Roper):
>  - Fix wrong conversion of RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK
>  - Reorder fields of XEHP_SLICE_UNIT_LEVEL_CLKGATE for consistency
>  - Simplify CTC_SOURCE_* by only defining CTC_SOURCE_DIVIDE_LOGIC
>    as REG_BIT(0)


As in patch 8, I did a similate test.c to check for errors. I did find
one register that was already  wrong before:

#define   DOP_CLOCK_GATE_ENABLE                        REG_BIT((0)

As we don't use it, I'm removing.

End diff is like:

diff --git a/tmp/a.txt b/tmp/b.txt
index 61924ebaeb5f..c6c91bae1218 100644
--- a/tmp/a.txt
+++ b/tmp/b.txt
@@ -33,10 +33,7 @@ CS_CHICKEN1 0x2580
  CS_DEBUG_MODE1 0x20ec
  CTC_MODE 0xa26c
  CTC_SHIFT_PARAMETER_MASK 0x6
-CTC_SHIFT_PARAMETER_SHIFT 0x1
-CTC_SOURCE_CRYSTAL_CLOCK 0
  CTC_SOURCE_DIVIDE_LOGIC 0x1
-CTC_SOURCE_PARAMETER_MASK 0x1
  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT 0x1
  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH 0x8
  CURSOR_A_OFFSET 0x70080
@@ -169,7 +166,6 @@ GT_RENDER_PIPECTL_NOTIFY_INTERRUPT 0x10
  GT_RENDER_USER_INTERRUPT 0x1
  GT_VDBOX_DISABLE_MASK 0xff
  GT_VEBOX_DISABLE_MASK 0xf0000
-GT_VEBOX_DISABLE_SHIFT 0x10
  GT_VEBOX_VDBOX_DISABLE 0x9140
  GT_WAIT_SEMAPHORE_INTERRUPT 0x800
  GU_CNTL 0x101010
@@ -242,7 +238,7 @@ PIPE_C_OFFSET 0x72000
  PIPE_D_OFFSET 0x73000
  PIPE_DSI0_OFFSET 0x7b000
  PIPE_DSI1_OFFSET 0x7b800
-PMINTR_DISABLE_REDIRECT_TO_GUC 0xffffffff80000000
+PMINTR_DISABLE_REDIRECT_TO_GUC 0x80000000
  PMINTRMSK 0xa168
  POLYGON_TRIFAN_LINELOOP_DISABLE 0x10
  PREEMPT_3D_OBJECT_LEVEL 0x1
@@ -326,9 +322,7 @@ RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ 0
  RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ 0x3
  RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ 0x2
  RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK 0x38
-RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT 0x3
  RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK 0x6
-RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT 0x1
  RPNSWREQ 0xa008
  RT_CTRL 0xe530
  RTFUNIT_CLKGATE_DIS 0x40000
@@ -351,9 +345,7 @@ THREAD_EX_ARB_MODE 0xc
  THREAD_EX_ARB_MODE_RR_AFTER_DEP 0x8
  TIMESTAMP_OVERRIDE 0x44074
  TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK 0xf000
-TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT 0xc
  TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK 0x3ff
-TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT 0
  TRANSCODER_A_OFFSET 0x60000
  TRANSCODER_B_OFFSET 0x61000
  TRANSCODER_C_OFFSET 0x62000


The only nonobvious one is PMINTR_DISABLE_REDIRECT_TO_GUC. But that is
just an artifacting of casting it to unsigned long and having the last
bit to sign-extend.

Lucas De Marchi

>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h | 24 +++++-----
> drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 57 +++++++++++-------------
> drivers/gpu/drm/xe/regs/xe_regs.h        | 12 +++--
> drivers/gpu/drm/xe/xe_gt_clock.c         | 19 ++++----
> 4 files changed, 50 insertions(+), 62 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index bfcb0e9a6d4c..938055f75492 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -22,7 +22,7 @@
> #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
>
> #define RING_PSMI_CTL(base)			_MMIO((base) + 0x50)
>-#define   RC_SEMA_IDLE_MSG_DISABLE			REG_BIT(12)
>+#define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
> #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
>
> #define RING_ACTHD_UDW(base)			_MMIO((base) + 0x5c)
>@@ -54,7 +54,7 @@
> #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>
> #define RING_MODE(base)				_MMIO((base) + 0x29c)
>-#define   GFX_DISABLE_LEGACY_MODE		(1 << 3)
>+#define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
>
> #define RING_TIMESTAMP(base)			_MMIO((base) + 0x358)
>
>@@ -68,17 +68,17 @@
>
> #define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4d0) + (i) * 4)
> #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
>+#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
>+#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 0)
>+#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 1)
>+#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 2)
>+#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_ACCESS_MASK, 3)
> #define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
>-#define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)
>-#define   RING_FORCE_TO_NONPRIV_ACCESS_RD	(1 << 28)
>-#define   RING_FORCE_TO_NONPRIV_ACCESS_WR	(2 << 28)
>-#define   RING_FORCE_TO_NONPRIV_ACCESS_INVALID	(3 << 28)
>-#define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	(3 << 28)
>-#define   RING_FORCE_TO_NONPRIV_RANGE_1		(0 << 0)
>-#define   RING_FORCE_TO_NONPRIV_RANGE_4		(1 << 0)
>-#define   RING_FORCE_TO_NONPRIV_RANGE_16	(2 << 0)
>-#define   RING_FORCE_TO_NONPRIV_RANGE_64	(3 << 0)
>-#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	(3 << 0)
>+#define   RING_FORCE_TO_NONPRIV_RANGE_MASK	REG_GENMASK(1, 0)
>+#define   RING_FORCE_TO_NONPRIV_RANGE_1		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 0)
>+#define   RING_FORCE_TO_NONPRIV_RANGE_4		REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 1)
>+#define   RING_FORCE_TO_NONPRIV_RANGE_16	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 2)
>+#define   RING_FORCE_TO_NONPRIV_RANGE_64	REG_FIELD_PREP(RING_FORCE_TO_NONPRIV_RANGE_MASK, 3)
> #define   RING_FORCE_TO_NONPRIV_MASK_VALID	(RING_FORCE_TO_NONPRIV_RANGE_MASK | \
> 						 RING_FORCE_TO_NONPRIV_ACCESS_MASK | \
> 						 RING_FORCE_TO_NONPRIV_DENY)
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>index 1cb63d747c6f..0d8dcdccdaa3 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -9,15 +9,13 @@
> #include "regs/xe_reg_defs.h"
>
> /* RPM unit config (Gen8+) */
>-#define RPM_CONFIG0				_MMIO(0xd00)
>-#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT	3
>-#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK	(0x7 << RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT)
>-#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ	0
>+#define RPM_CONFIG0					_MMIO(0xd00)
>+#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK		REG_GENMASK(5, 3)
>+#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ		0
> #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ	1
> #define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ	2
>-#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ	3
>-#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT	1
>-#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK	(0x3 << RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT)
>+#define   RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ		3
>+#define   RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>
> #define FORCEWAKE_ACK_MEDIA_VDBOX(n)		_MMIO(0xd50 + (n) * 4)
> #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		_MMIO(0xd70 + (n) * 4)
>@@ -39,15 +37,15 @@
> #define MCR_SELECTOR				_MMIO(0xfdc)
> #define GAM_MCR_SELECTOR			_MMIO(0xfe0)
> #define   MCR_MULTICAST				REG_BIT(31)
>-#define   MCR_SLICE(slice)			(((slice) & 0xf) << 27)
>-#define   MCR_SLICE_MASK			MCR_SLICE(0xf)
>-#define   MCR_SUBSLICE(subslice)		(((subslice) & 0x7) << 24)
>-#define   MCR_SUBSLICE_MASK			MCR_SUBSLICE(0x7)
>+#define   MCR_SLICE_MASK			REG_GENMASK(30, 27)
>+#define   MCR_SLICE(slice)			REG_FIELD_PREP(MCR_SLICE_MASK, slice)
>+#define   MCR_SUBSLICE_MASK			REG_GENMASK(26, 24)
>+#define   MCR_SUBSLICE(subslice)		REG_FIELD_PREP(MCR_SUBSLICE_MASK, subslice)
> #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
> #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
>
> #define FF_SLICE_CS_CHICKEN1			_MMIO(0x20e0)
>-#define   FFSC_PERCTX_PREEMPT_CTRL		(1 << 14)
>+#define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
>
> #define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
> #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
>@@ -59,12 +57,12 @@
> #define PS_INVOCATION_COUNT			_MMIO(0x2348)
>
> #define CS_CHICKEN1				_MMIO(0x2580)
>-#define   PREEMPT_3D_OBJECT_LEVEL		(1 << 0)
> #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
> #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
> #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
> #define   PREEMPT_GPGPU_COMMAND_LEVEL		PREEMPT_GPGPU_LEVEL(1, 0)
> #define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
>+#define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
>
> #define GLOBAL_MOCS(i)				_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
> #define GFX_CCS_AUX_NV				_MMIO(0x4208)
>@@ -131,19 +129,18 @@
>
> #define	MIRROR_FUSE3				_MMIO(0x9118)
> #define   L3BANK_PAIR_COUNT			4
>-#define   L3BANK_MASK				0x0F
>+#define   L3BANK_MASK				REG_GENMASK(3, 0)
> /* on Xe_HP the same fuses indicates mslices instead of L3 banks */
> #define   MAX_MSLICES				4
>-#define   MEML3_EN_MASK				0x0F
>+#define   MEML3_EN_MASK				REG_GENMASK(3, 0)
>
> /* Fuse readout registers for GT */
> #define XEHP_FUSE4				_MMIO(0x9114)
> #define   GT_L3_EXC_MASK			REG_GENMASK(6, 4)
>
> #define GT_VEBOX_VDBOX_DISABLE			_MMIO(0x9140)
>-#define   GT_VDBOX_DISABLE_MASK			0xff
>-#define   GT_VEBOX_DISABLE_SHIFT		16
>-#define   GT_VEBOX_DISABLE_MASK			(0x0f << GT_VEBOX_DISABLE_SHIFT)
>+#define   GT_VEBOX_DISABLE_MASK			REG_GENMASK(19, 16)
>+#define   GT_VDBOX_DISABLE_MASK			REG_GENMASK(7, 0)
>
> #define XELP_EU_ENABLE				_MMIO(0x9134)	/* "_DISABLE" on Xe_LP */
> #define   XELP_EU_MASK				REG_GENMASK(7, 0)
>@@ -203,12 +200,12 @@
> #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
>
> #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
>-#define   SARBUNIT_CLKGATE_DIS			(1 << 5)
>-#define   RCCUNIT_CLKGATE_DIS			(1 << 7)
>-#define   MSCUNIT_CLKGATE_DIS			(1 << 10)
>-#define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
>-#define   L3_CLKGATE_DIS			REG_BIT(16)
> #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
>+#define   L3_CLKGATE_DIS			REG_BIT(16)
>+#define   NODEDSS_CLKGATE_DIS			REG_BIT(12)
>+#define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
>+#define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
>+#define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
>
> #define UNSLICE_UNIT_LEVEL_CLKGATE2		_MMIO(0x94e4)
> #define   VSUNIT_CLKGATE2_DIS			REG_BIT(19)
>@@ -224,7 +221,7 @@
> #define   RTFUNIT_CLKGATE_DIS			REG_BIT(18)
>
> #define DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
>-#define   DFR_DISABLE				(1 << 9)
>+#define   DFR_DISABLE				REG_BIT(9)
>
> #define RPNSWREQ				_MMIO(0xa008)
> #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
>@@ -232,20 +229,16 @@
> #define RC_STATE				_MMIO(0xa094)
>
> #define PMINTRMSK				_MMIO(0xa168)
>-#define   PMINTR_DISABLE_REDIRECT_TO_GUC	(1 << 31)
>-#define   ARAT_EXPIRED_INTRMSK			(1 << 9)
>+#define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
>+#define   ARAT_EXPIRED_INTRMSK			REG_BIT(9)
>
> #define FORCEWAKE_GT				_MMIO(0xa188)
>
> #define PG_ENABLE				_MMIO(0xa210)
>
>-/* GPM unit config (Gen9+) */
> #define CTC_MODE				_MMIO(0xa26c)
>-#define   CTC_SOURCE_PARAMETER_MASK		1
>-#define   CTC_SOURCE_CRYSTAL_CLOCK		0
>-#define   CTC_SOURCE_DIVIDE_LOGIC		1
>-#define   CTC_SHIFT_PARAMETER_SHIFT		1
>-#define   CTC_SHIFT_PARAMETER_MASK		(0x3 << CTC_SHIFT_PARAMETER_SHIFT)
>+#define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
>+#define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
>
> #define FORCEWAKE_RENDER			_MMIO(0xa278)
> #define FORCEWAKE_MEDIA_VDBOX(n)		_MMIO(0xa540 + (n) * 4)
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index e6b81bcff91f..da1d5aa6cdb7 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -37,10 +37,10 @@
> #define XEHPC_BCS7_RING_BASE			0x3ec000
> #define XEHPC_BCS8_RING_BASE			0x3ee000
> #define   GT_WAIT_SEMAPHORE_INTERRUPT		REG_BIT(11)
>-#define   GT_CONTEXT_SWITCH_INTERRUPT		(1 <<  8)
>-#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	(1 <<  4)
>+#define   GT_CONTEXT_SWITCH_INTERRUPT		REG_BIT(8)
>+#define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
> #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
>-#define   GT_RENDER_USER_INTERRUPT		(1 <<  0)
>+#define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
>
> #define FF_THREAD_MODE				_MMIO(0x20a0)
> #define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
>@@ -90,10 +90,8 @@
> #define   DG1_MSTR_TILE(t)			REG_BIT(t)
>
> #define TIMESTAMP_OVERRIDE					_MMIO(0x44074)
>-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT		0
>-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		0x3ff
>-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT	12
>-#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	(0xf << 12)
>+#define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
>+#define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
>
> #define GGC					_MMIO(0x108040)
> #define   GMS_MASK				REG_GENMASK(15, 8)
>diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>index 1b7d00284535..49625d49bdcc 100644
>--- a/drivers/gpu/drm/xe/xe_gt_clock.c
>+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>@@ -17,13 +17,12 @@ static u32 read_reference_ts_freq(struct xe_gt *gt)
> 	u32 ts_override = xe_mmio_read32(gt, TIMESTAMP_OVERRIDE.reg);
> 	u32 base_freq, frac_freq;
>
>-	base_freq = ((ts_override & TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK) >>
>-		     TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_SHIFT) + 1;
>+	base_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK,
>+				  ts_override) + 1;
> 	base_freq *= 1000000;
>
>-	frac_freq = ((ts_override &
>-		      TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK) >>
>-		     TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_SHIFT);
>+	frac_freq = REG_FIELD_GET(TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK,
>+				  ts_override);
> 	frac_freq = 1000000 / (frac_freq + 1);
>
> 	return base_freq + frac_freq;
>@@ -35,9 +34,8 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
> 	const u32 f24_mhz = 24000000;
> 	const u32 f25_mhz = 25000000;
> 	const u32 f38_4_mhz = 38400000;
>-	u32 crystal_clock =
>-		(rpm_config_reg & RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK) >>
>-		RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_SHIFT;
>+	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
>+					  rpm_config_reg);
>
> 	switch (crystal_clock) {
> 	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ :
>@@ -62,7 +60,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
> 	/* Assuming gen11+ so assert this assumption is correct */
> 	XE_BUG_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
>
>-	if ((ctc_reg & CTC_SOURCE_PARAMETER_MASK) == CTC_SOURCE_DIVIDE_LOGIC) {
>+	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
> 		freq = read_reference_ts_freq(gt);
> 	} else {
> 		u32 c0 = xe_mmio_read32(gt, RPM_CONFIG0.reg);
>@@ -74,8 +72,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
> 		 * register increments from this frequency (it might
> 		 * increment only every few clock cycle).
> 		 */
>-		freq >>= 3 - ((c0 & RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK) >>
>-			      RPM_CONFIG0_CTC_SHIFT_PARAMETER_SHIFT);
>+		freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
> 	}
>
> 	gt->info.clock_freq = freq;
>-- 
>2.40.1
>
