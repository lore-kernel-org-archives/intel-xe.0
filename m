Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2783ED1A424
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 21:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93EC10E2DE;
	Fri, 11 Oct 2024 21:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jB5Jg/Qm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A17510E2DE
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 21:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728683913; x=1760219913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TUnaThwXLXk1tcLgNqMdHkqpgaoIumxs2q3D805UiBI=;
 b=jB5Jg/QmwrIgOpvLwJXJ1wb4Xg2QvFSHqFGr7MeabQxkz0d2HTQhAcAY
 +pUwfL4rVQGemYQ7C/KUmn574C8sB94RR+xZIp2MrupXz9l1Ac6iRZuto
 zfxAbPpv/pI4quNtwP+phlh2enH5jB8QvO5qAcXZpopWsgvhVMqH94/5H
 xfH1aeoA3FiXxv3CEZCDsJg77I818xQnAueCf4q2MFnIUWRn93oG1UlBw
 cHpAEiUYqQNHbuLuaC7Alogc3o+UAosOTrqdOa35H0E7SQoQgSngb/zM3
 94bwNSYtqLzIg1PRY+/Ot79DbhFmYxgI/2Xt0g+CfzHlOuF0SllPqZA8z A==;
X-CSE-ConnectionGUID: Yiar+x2oQL+AWk6Yb7KPcw==
X-CSE-MsgGUID: 0HaC2feQS6ix0C/8auF8CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32003620"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="32003620"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 14:58:33 -0700
X-CSE-ConnectionGUID: NYayMY+VR2aVzx/J0lA4gQ==
X-CSE-MsgGUID: hawIcKlPRRWEfHIfvhJ0Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="81027316"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 14:58:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 14:58:32 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 14:58:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 14:58:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 14:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UaTK9dUg9lcdCGoglzO/yBVDWafWa2fWGgYeJLj0+307dr/OVEwm2quKsSVak2FKuHSGPkBIKkrp9moPbV/E6Xprx4wJo1Tv89Rc8niCzCX9pSJfXqsyyaeYJntvCZ375zXc1gHH4zQXVWPFNoGW43yJXm9eRh7wpbccp7XfUzcMAYvx4zYE+roYYYqSLvSQffF6N3DDqgNUbDtmgkcn8C7hz9mIC4QJGh7L2uuxHgK5jasGHeye+4r98GaPlTotjI4VYVQD4zZma8uIquI8flwJapX7VO5qLtwvvx25aLzTHwS2rwpFRMUUS0XRhcO4fX1nRAvWaIunKmFakp1/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSSBwWkIQyU44jwQLJRn6U1+bujizlpeYripP3svsBU=;
 b=OD6Zan63vHgzX5wW1kvUXLK2PU5WwR2mFYFoEhLBW1xRxhZPLyaProTljxOhyuT9NJMnOZxu2upmfhcSl2Ns5yYXMUpU2KfENFBS3da24xbxUWeAR9MYOroi8BOPTtUboa7aWTTiNjsazy5bk2HMvO8QFYqRHtJDH8nCm9mLiSuHKS+SW5I2kIqDL0s9AhWHU311DG2EnuttcJ+K2WFFlyp3px6+M4WQgGC5vWCTZwZpzhVvP9Dlvrtg95naAeLKYnRWah90XZMkADT+JaOdA4oNdO1dHUHfKfV4W+nhJXPhBf5ggylq8gbep4G+Qk6f0eY8/ZYiKBE1O2hhecNkCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 21:58:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 21:58:30 +0000
Date: Fri, 11 Oct 2024 16:58:27 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/query: Move timestamp reg to
 hwe_read_timestamp()
Message-ID: <lf3ld57o6lkx6t2zc7my3tnznpfpb73rv45rsvpgiqmeqz73xv@ijlckuat32dm>
References: <20241011035618.1057602-1-lucas.demarchi@intel.com>
 <20241011035618.1057602-2-lucas.demarchi@intel.com>
 <20241011211715.GB5725@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241011211715.GB5725@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW2PR16CA0043.namprd16.prod.outlook.com
 (2603:10b6:907:1::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e308bf4-e010-47b7-127c-08dcea3fd790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6vg4ld9BITYCKNLr5sL3+tE5/eL78BgwQx6Ed1+Z7Q6ZF5qa9hljxxdj7z/l?=
 =?us-ascii?Q?ngvFoURuFNW4QaTdLwl7WmVBeu7nleI+DBbP4gNyZ+6TIRFNgXcYtHXkf3VZ?=
 =?us-ascii?Q?kP//16UrqYtdhihJcL1vVdPvVzZckET2TK338iT8REyanGtijmaoeADSSc+K?=
 =?us-ascii?Q?Ob6YgpcqMyul2zBsePaD2zSnnKRXclTxpLT2Nh+9ALgkc4SeNqoeerokpr3g?=
 =?us-ascii?Q?izpaac0kq8AkBtnt7PFyehTSPam+HvLY3KePkCmSwvdjFRH7JkgYgZuR2BFs?=
 =?us-ascii?Q?x2xvPulpfpgRvSDnx8APiz01arwKpsDa/QBS94W3TnFukZ8vFWagzNaLS7dr?=
 =?us-ascii?Q?F2KtWbfOhVYx6nNJQl87exrc2y1DT2vAnoaPD/Xz6aDuDy81NLRc8VZsuxNy?=
 =?us-ascii?Q?VHlvjfexqmutvDR96nv3LEqrd31nQTv3Jptzis31Wm0pZcaMAlGBK1h8Ih+l?=
 =?us-ascii?Q?K4AePM+VZ9UIwuSyIxyTZTH0uvyFppkjKfWrKAAzOyXopFOYPyNN49W9+eWW?=
 =?us-ascii?Q?aM6yIRyZpqATbMzLdp7pQNVQvZt0x9IEeR9e1QWkzXCt0fpr2+100TvtmXS3?=
 =?us-ascii?Q?+2BDgxYmfRoXGYUaaqdVXdg/C1QIstv6N8asX4e+aLZ4caHH8DTmicmBnF+a?=
 =?us-ascii?Q?Wh+JXNOxOvJJxitg6Jkx5200MkD/qiLSqp9qA0zmaliQZPZS7wSf/+5lWsPp?=
 =?us-ascii?Q?KVroyBOdBld9AcEmBBvk/IldC6TI/y5wL9ElZWNK3OOCZPJAvSKUysTBW/Pj?=
 =?us-ascii?Q?FccdpQD+WzctKW5PhSLiHbukjQkGwQaxlgDJWPNcWxtFqwaDSCr2nAktm1MF?=
 =?us-ascii?Q?hyPqYLGMaTJhjj9VIW3zCaOqMFM5Y/olf/gRLFuZy4xjwOjNwknTcNAw++mV?=
 =?us-ascii?Q?04j5RV2lG58c0coaJo/y0/KESV/ZdN6JId353sfyPQ2q9MpqYG45BemEIHg1?=
 =?us-ascii?Q?bya/Gy7aNcdXY7tVmckeQ87yhCFpqMZKkFsLXJcz3uzzYvKKVRhOA+S+IYKh?=
 =?us-ascii?Q?/DcBLaVaNcBjH9fvHXwFWGOmyMK77ftnXU/o+gcCUygLIsK5NwzLY73bvZrk?=
 =?us-ascii?Q?Dbi/k2jpJcsXR/ue6/UX/rVATjmIy1aGjqHy8SsP5DQ+gCgl08+mjcs02uTv?=
 =?us-ascii?Q?OlPZ4igYbDc6L3ETMz6hoTRcA8FXLdwACO6RwtJyinqfR0dW7USmS5KD4l7L?=
 =?us-ascii?Q?CaB0wrV/J80Yvx1LlbZWXGtIbSstL7amDk88qg4aKV8P5jHvRe5WZY0vnRvo?=
 =?us-ascii?Q?Q9OsRsSOfcnmWpkxNIYJawtsXr5dVZPDjcJSiCEuxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?As4LDGje6kzt6U+QROrt8aP7AdfmUsR60JzpOkGIKBDGHPCkg9p6zvIDBlwK?=
 =?us-ascii?Q?Ei7P4Full8fhcWErjGped0gSEDGP5Xd+udKtdMR185AIAybapxJCiKF+NZ4+?=
 =?us-ascii?Q?DjcQTDjqbIAIubLEyIJMTQgwW/dndwXaPTLCvT5XF8ojvzB/ocCq7MFcVCk4?=
 =?us-ascii?Q?/90RLusiRICqpyiG+5TzjO+9zHnqg4H4XV5qtqMlc+/Y+cRV35pnDkiZQ8V1?=
 =?us-ascii?Q?6P7aU8YafaXGQECqhtaREi66RWEEWEJYwSHHxftKnQvlPMgM3KKceEOBYnjH?=
 =?us-ascii?Q?2QdCr3/PwcYfPZSqfsHeBLDTTmkQuGQdF6nTgJ1PeJ10JxYmjckqVgwd23dq?=
 =?us-ascii?Q?Z8DKSqUBMWjTuzBJvNhKdsDv3GAV3D+XOKJnMVkuARvK7j87Oa+3YE5BPPtK?=
 =?us-ascii?Q?O8TNwqu11mJHIe1cm/z+P+e3dqjFJTGncjOXqE6sXF3a8HeWFFtSqkcrxTEr?=
 =?us-ascii?Q?Bk0iKvUr4d18iQSbokbIRNaGBIDZynMFh1Cf5v/IsFo4yFDKbEbyQ1uXZUy0?=
 =?us-ascii?Q?7VgfRdO87U9+PP2qXcfmkKWI8WhETKLQZEGZBMldVXxgfUd3M2Nc4M5Wx+N6?=
 =?us-ascii?Q?Mm2M6BMZHU3ENxphVcdXkOe1ibmitz8lZAZ1Y+bM+gWF8Xz9KCcmv+OOaaCJ?=
 =?us-ascii?Q?BXFZqFnbJMHlbyhY1hwDQDuRk72J/adOHPRS+2BSWJsNBup4zJQEzm9k07W0?=
 =?us-ascii?Q?ZM6vyYEO9ZtHLxZ6dYJAYR54qC5ZY4Y79ehhf7ZEkLPWSzup+T5BEASLlDrt?=
 =?us-ascii?Q?Nj/ydq3ejrLx82oWVr4htkcgAwy7uwoYRMhKZazpvpDlKEobDmbzFj4VFBfC?=
 =?us-ascii?Q?B8JUxDAmoGY5u78vQCZL8FxKCRgt0VtmCubBbfEpUIKjvzkAEiTKJ1vpWsOj?=
 =?us-ascii?Q?KOUsfzyPXAGqtGnZq8kbGKzF6w2shut7azAP8HyoGJBtpince8YtviZNTJvk?=
 =?us-ascii?Q?VQQd+HbSXQqRgrcRmE3j3FizDy7OL37ttNSrCxJGkYeqGCaikqAqrS8x934q?=
 =?us-ascii?Q?7BnMMvJJeg1BquJFfq/e2yTZi8KSiD81bbbKUTyhyO3Mb8efmMrR2cWo0VrW?=
 =?us-ascii?Q?Gq0954oSmLm/jgsQ1TiMx6AfmQ+USdDV35uWxSPeiQlEvYrztO+2VxDaRwGI?=
 =?us-ascii?Q?YqPOR3XbT2BC7MyDn4u5BU8A0qSdqV0HfUFVpbV3CAMjqCzFuqqW0WLqzi2k?=
 =?us-ascii?Q?FRZFh9bspKNAMQDba5u+e7G5BHI3+hkLGbF4g0PsdEx+hzn+bOYjwq07Xon6?=
 =?us-ascii?Q?7tjvSNIJvDCymWATCj37ddWefvwVVxznSoA0dE85tWGNbZOslFgPFqkiEjEp?=
 =?us-ascii?Q?+nyJYnPph1geAwWkW+Exw/3NowAPYk3SKaU/rFkZxQ6R9Rsc23XHFeViC+bq?=
 =?us-ascii?Q?MMXAQB2mqg9XGj811lSTuuL+IZugYJ3e18qd7LkHwX/SaS8/c8BHqiiOq5Jr?=
 =?us-ascii?Q?Rm2xuxj4le2PtA1lPanC1oRX/kOBS4FjPx6oFxzsVw4aYUjsnHaICE9T3rZC?=
 =?us-ascii?Q?TywYgT1H+MLsjCd+ZwKTDLI22uxVSKwUAI/3kEn9VCV7feV9oHrcD49ZxOJG?=
 =?us-ascii?Q?M0yLD5kqX8DVg4ptXiKT8PBechRyGzcRQkzpjL88eHndktCR32A9kwM40awg?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e308bf4-e010-47b7-127c-08dcea3fd790
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 21:58:30.1738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IlyDzXNo6+srQzGs6jPTvfHm9LGsKvo3Ua8NsyPZ/C6zIXnAvJ7lXM9nBhnZ+wK24kTBohGpRVIoYvWfJmRlJsigHVvqSG5kC6qqI/b+8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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

On Fri, Oct 11, 2024 at 02:17:15PM -0700, Matt Roper wrote:
>On Thu, Oct 10, 2024 at 08:56:17PM -0700, Lucas De Marchi wrote:
>> __read_timestamps() is actually reading the timestamp from a certain
>> hwe. Use it as parameter, move register declarations to be inside that
>> function and rename it.
>>
>> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_query.c | 22 +++++++---------------
>>  1 file changed, 7 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 07093af0b32e3..69307ff4146a1 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -85,16 +85,13 @@ static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>>  }
>>
>>  static void
>> -__read_timestamps(struct xe_gt *gt,
>> -		  struct xe_reg lower_reg,
>> -		  struct xe_reg upper_reg,
>> -		  u64 *engine_ts,
>> -		  u64 *cpu_ts,
>> -		  u64 *cpu_delta,
>> -		  __ktime_func_t cpu_clock)
>> +hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,
>> +		   u64 *cpu_delta, __ktime_func_t cpu_clock)
>>  {
>> -	struct xe_mmio *mmio = &gt->mmio;
>> +	struct xe_mmio *mmio = &hwe->gt->mmio;
>>  	u32 upper, lower, old_upper, loop = 0;
>> +	struct xe_reg upper_reg = RING_TIMESTAMP_UDW(hwe->mmio_base),
>> +		      lower_reg = RING_TIMESTAMP(hwe->mmio_base);
>>
>>  	upper = xe_mmio_read32(mmio, upper_reg);
>
>Not specifically related to this patch, but is there any reason why
>we're not using xe_mmio_read64_2x32() to read the timestamp?  It already
>has rollover logic specifically to handle timestamp reads like this.

yeah... I was thinking the same thing when implementing this: why are we
not re-using the _2x32() variant. But... see where the CPU timestamps
are taken. We can't simply take the CPU timestamp before and after
xe_mmio_read64_2x32() - it's in the middle of the calls with
configurable clock id (via vfunc).

>
>Anyway, this patch looks fine.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi
