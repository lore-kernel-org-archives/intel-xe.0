Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14473C7EE23
	for <intel-xe@archiver.kernel.org>; Fri, 24 Feb 2023 18:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81C910ECE0;
	Fri, 24 Feb 2023 18:29:23 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FF810ECE0
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Feb 2023 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677263362; x=1708799362;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e5DfvhliYDj+8QOK1boQpWU+6YFpOhNf+78F7MZzhmE=;
 b=nva9s+9zqClGeNqy/66Ab0LGkWNDRbZT5d0BWpV78Xi6SrOJEHDK4GvY
 iIDwBJiX1qIr2Ap/79krTPfl1qQ5TcYgGfetElqHDceiXX73QXtDh9gz2
 yRRSukJukLKoV5tMX2MUvxZdTpyuf9acpXlFmov6ehWkmy88EgHMVs2SC
 xI+Sp2vHNRP2DRif6F16JtvxCb7A/W7o1bQ5jXkzmr6NZTCjEV6uDoaAq
 VZroe6C/Z4DiuYHs6QtuClgNh7Ov70M7rp2p+Y+Hw4mgeeHmoICFLfFHV
 3QJ5LsTUQKJzrP14ZG8wqqwXS4iVMSpxrJcV/or4+Sibg1sx7cIQhafjB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="398280042"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="398280042"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 10:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="761871349"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; d="scan'208";a="761871349"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2023 10:29:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:29:20 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:29:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:29:20 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:29:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=haS7I/A7719SkL43lLQWcf9d7s9xOsjULG3+WBeAUrp5Of+PViSWX//KmBbPGidY5d18JoPRwBCgJdvQSC/wn4t1lnHlADrvtMbv4ZmDc1P0I5ry4i66hIoYoCGYsS5V2BbbSwHZupQJFWtrCTtzfeIncWZBSDizFxlj9oahlYkmzPdSqxkgR2UpDgdsh+/zCDhJWDCD2b8tI+Es9TGCSN8kGUHbESNVewydKa+hQL4uqci0PR2KMPkTZwjZhIap3k4pVn7xjYKCuJyPVbn0DAqPMn+iOVnwvEYdgJbej3J2CXOA62Xb6TbtNle1YFekOd3JUi5bVbMPIg5eNLaVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEEuOOzdrCCUTk36twTaQcJ7KdI67UewW038m9s0Q0M=;
 b=PKKVey0kO7Dxoma1+4Kfeo/Ztl8UKthrVinsMuXKs3XgwErORHfFpkmp1WkCdqwXcZz/7UD/omdtCXCL9kx4ayLA1LTfnRWVvOthfcb2HKQDSxs5SNyJHJkv7RN0gyqREwJcxg/qpZdbFzzN0XiLDXPBVeuoVtUpwrxQVbUwxCuGThZ3AFA9gQdyiHkJkyPFxpLGiC8/178OtmCYiLv/u6S7dtCCK2cqnc2APMYxUYYfgs2P7jsTnUbf9i3Kw7tINQlI0fBnL4YpO4LOKVPrifdrqSaNysyM5GR0n12Ftmm3x9Pnnj8f0VuSv4cYJbeguG8G9EsUdAOGiBLb+er34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 18:29:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:29:18 +0000
Date: Fri, 24 Feb 2023 10:29:14 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230224182914.ytykgqzkp4o4ibcg@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-6-lucas.demarchi@intel.com>
 <Y/j8lmaf2b49It/M@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Y/j8lmaf2b49It/M@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR01CA0017.prod.exchangelabs.com (2603:10b6:a02:80::30)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 9092262f-c69b-4853-aaa3-08db169509fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HmK1k499dpvGGBN6CKtb0X12pC8hyjcdrajhpOfrULwNYnpfrLeXWRvxevA9ps6wprpLOltklB9uBCWy8SMXZ+JFmU7gQXTU1n+AVpnp3dJgJWG/HO4amaW7Q+YcR2fPebDaWsLn9ZQIk1yrk2Rl9xT7N49PBpsF6DkKboMsWRfqjxns6/mOGmZKpGWIhI4hNSQz/VwLkpEZhGVkhteKJNk3l1S+pYWjmpCn4XnnIv7KGupxC4e21xd6MXt8cpj26/9K96W9g7HSvqlZ8Pc6Zn2ekkl0eMCVH2IHb5HV3a5X+a7+JDi1x6zBxZVDNk7ew5dQlXdHdnNW9iRAsss5ifiAUjLxUBu3JoyXK7SBiGwsOZdmsFupaYvdxChogyCAuuuEcn62nEwz1eBRn1HHRynP8VZF+JjYO070OTumVBM/Cp0RBsuTWXERkMgkJ03sOx0GEPZy0/KObpBy3vPnqsD0aqkHU0Ys8aVLlh9WwDq+vNeaVne6cM2xhkgCFFEEYGt7Uq4wQ2hB8Py1Qdz5mnJGZYIzSgFZBM5w5RLHJkNOvrUidx+aJ2Qtlse1GsrfbxGfiw4fgUkCVGYtnPGchkw57IgN5UORVSlM3/dSbuseTn3DWm3+X0MMt9OuPZWIiF0rhs9IaDwWiGtzAFN+yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199018)(6636002)(36756003)(316002)(4326008)(8676002)(54906003)(66556008)(66476007)(66946007)(38100700002)(82960400001)(83380400001)(6486002)(478600001)(2906002)(9686003)(6666004)(6512007)(1076003)(186003)(26005)(6506007)(107886003)(86362001)(41300700001)(5660300002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LuT/5O6NaIrqE28oShqXxuTWxCrLM3uIFPb/YLzkrhEcROLXhlcRyQ2OENjp?=
 =?us-ascii?Q?bBmDd05yPV8onVXEGhZtNXmNlo6xF42g+3feFIA/aoQf/3fLj+ux8zQJIodn?=
 =?us-ascii?Q?9e9M012QrXGWUula8eNVzTUIK918rlI6Y4vW70sI73HJQR7+UKqFzfw8J/Qq?=
 =?us-ascii?Q?C/9TgoIJC2SfIJLWGQimG903YSfOZCp0OQ9/4tAFVjLdWW0e5BMjn/ZCd+82?=
 =?us-ascii?Q?FBoNIw6cs0RIHQMqhswpDmsO6kPFlkf4P++wlDwnAXSpv9aF31lB6imIhIMQ?=
 =?us-ascii?Q?d2pbz7lhTlDdLi4xBY6gbX+qwcXJkg1MeZvDsDETY3Zk8eDuQ2Ktml9rhYQR?=
 =?us-ascii?Q?jrTF6/1NE7GreMx+NVN1WdoZ/VNcPbQwJoaIzP14enQPAtg3fF8UFyO9ajPR?=
 =?us-ascii?Q?vDXZYkEvyaPL0aM0MzT+VuvkHiL5Ic+B4TxAVlWWfnf5eBWuk1CJFNEyFBBl?=
 =?us-ascii?Q?Jmf/LwPsw8D3stLQu1ISjwCoQ7koUwIM1Fs6tdoenCdsCmKy0kWsmAyw9Fpz?=
 =?us-ascii?Q?WMg8e8A1lg16OEi7silhLHtMHccvotgqCQyZO3CSoxtEDWoLWSSwUGzcQ4VA?=
 =?us-ascii?Q?v+n99PBmgP5IlwKOO+9qlAdDARVF7aVzpRJVrUsfnNHC7u6d4cENXjv4hweV?=
 =?us-ascii?Q?pt3ZZFvbRrkNMmQt3CD88MeglZ4mm0xYAE6Zh7QCr6qdTVxtqy5fm4OkiZlc?=
 =?us-ascii?Q?Gr6xNDXbGvaK68OReMC08RvsUAO5G0vQ9gxd/XI2CY4xMTPMFnvi0i3zCw/P?=
 =?us-ascii?Q?ZGYVPNQQX0fvaL7egwbi4BpS8G/fiQNJPjMFxgeBC0W3yrblaagOAIisJIJB?=
 =?us-ascii?Q?lvmO8uwupdVVg0b4K8yANpvk28VMmgJi0XxZirjMPy7JDiu03qqyn9jx2coA?=
 =?us-ascii?Q?ds0/MjqBFxjxOTFstlMhU3mK6GGATYvoYcp+Az83IoxzwnDrNNsrxOFsVW3c?=
 =?us-ascii?Q?tfDwEfbXajM3C09LzXn5CbMeJYAPEoeKVzQvHhWuouB4QsSSNEoYXTrnN/tC?=
 =?us-ascii?Q?l0R9a2UrETBEQ4goXEk5inwPto0l8QoFI9qN+AaepWnt1i13xlb84KoSXPwN?=
 =?us-ascii?Q?2lJUds4emy0TaQXF96w+wdCAvuySqZh+HhXz5TnjhENrf65PX7XCHksx90Xq?=
 =?us-ascii?Q?68DA8P5UVv04EqYzM49qjikLrRV/i7NQgxs0VGLtZ+iG4nu7zGjwYrsyWnxy?=
 =?us-ascii?Q?jWsm7qd8OAF0T7ODbZyo6wyKTqt+UBEbfQSOUq89Y1C0OqSup6HL0Lz/RTYX?=
 =?us-ascii?Q?WqxlEf3EqZivte518zTFjBHidnXjce6uWQPWW7prf2PjiGu3ONWw+8ADGuN1?=
 =?us-ascii?Q?I1VaEO7txlxJEpXT7/KRTY86KhJoV/Z74VaQlJkHXXsL9k0ZPvLRFWbfIvVv?=
 =?us-ascii?Q?gJjma9biq6mnEBTf4T3RugqKNpREcmqCESznMR748+SeQ92+ilA730OiVZ2B?=
 =?us-ascii?Q?FPdQLO1wwc9Pcsar+pUh9ratQHFCjNiZkRY2mYBNq9+FKEcu2E+HUvqatzMG?=
 =?us-ascii?Q?59edoJ+qtXqkGnybaj4T50kpuqmQ62HvA9OKlKXAchW1n8oOmnrGZI/jAnR6?=
 =?us-ascii?Q?IXdNK05EmtXIFzFv0CFQM+CPvAVklE8y7Z6NP1RlOAgfm5K7lK7JJA0buL+N?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9092262f-c69b-4853-aaa3-08db169509fd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:29:17.8801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lq75Y5qtxGx1+F6dEcDv8Lmr1Kz6MC/TRkff+TrDoSFAdU9fAdPdUvLZHm3htnWGaoqvF1/ofQJSFQq5HY1V08Ov6KT/VF8bFkkBpsvD6lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/11] drm/xe: Remove dependency on
 intel_gt_regs.h
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 24, 2023 at 10:06:14AM -0800, Matt Roper wrote:
>On Thu, Feb 16, 2023 at 04:52:20PM -0800, Lucas De Marchi wrote:
>> Create regs/xe_gt_regs.h file with all the registers and bit
>> definitions used by the xe driver. Eventually the registers may be
>> defined in a different way and since xe doesn't supported below gen12,
>> the number of registers touched is much smaller, so create a new header.
>>
>> The definitions themselves are direct copy from the
>> gt/intel_gt_regs.h file, just sorting the registers by address.
>> Cleaning those up and adhering to a common coding style is left for
>> later.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/i915_reg_defs.h  |   2 +
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h  | 287 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_execlist.c      |   2 +-
>>  drivers/gpu/drm/xe/xe_force_wake.c    |   3 +-
>>  drivers/gpu/drm/xe/xe_ggtt.c          |   2 +-
>>  drivers/gpu/drm/xe/xe_gt.c            |   3 +-
>>  drivers/gpu/drm/xe/xe_gt_clock.c      |   2 +-
>>  drivers/gpu/drm/xe/xe_gt_mcr.c        |   3 +-
>>  drivers/gpu/drm/xe/xe_guc.c           |   2 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c       |   4 +-
>>  drivers/gpu/drm/xe/xe_guc_pc.c        |   2 +-
>>  drivers/gpu/drm/xe/xe_hw_engine.c     |   2 +-
>>  drivers/gpu/drm/xe/xe_irq.c           |   2 +-
>>  drivers/gpu/drm/xe/xe_lrc.c           |   2 +-
>>  drivers/gpu/drm/xe/xe_mmio.c          |   2 +-
>>  drivers/gpu/drm/xe/xe_mocs.c          |   3 +-
>>  drivers/gpu/drm/xe/xe_reg_sr.c        |   3 +-
>>  drivers/gpu/drm/xe/xe_reg_whitelist.c |   3 +-
>>  drivers/gpu/drm/xe/xe_ring_ops.c      |   2 +-
>>  drivers/gpu/drm/xe/xe_tuning.c        |   3 +-
>>  drivers/gpu/drm/xe/xe_wa.c            |   2 +-
>>  21 files changed, 308 insertions(+), 28 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>
>> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
>> index b5e06b6a9478..a6080c983a77 100644
>> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
>> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
>> @@ -136,6 +136,8 @@ typedef struct {
>>  	u32 reg;
>>  } i915_mcr_reg_t;
>>
>> +#define MCR_REG(offset)	((const i915_mcr_reg_t){ .reg = (offset) })
>
>Should there be a corresponding removal of this definition from
>drivers/gpu/drm/i915/gt/intel_gt_regs.h ?
>
>Aside from that,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


good catch. I was trying not to change the i915 headers, but this
one went unoticed while fixing the build.

I wonder if this should be a separate patch to merge in
drm-intel-next by itself. It's harmless though and we could keep it
in the xe branch, as long as also removing from drivers/gpu/drm/i915/gt/intel_gt_regs.h

Rodrigo / Matt, are you ok with this approach?

Lucas De Marchi
