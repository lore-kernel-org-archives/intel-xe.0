Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7602AC00528
	for <intel-xe@archiver.kernel.org>; Fri,  4 Aug 2023 20:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2388510E124;
	Fri,  4 Aug 2023 20:48:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C19710E124
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Aug 2023 20:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691182078; x=1722718078;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dVY0ZIPA+uYgOq6UBVtWZnRTtpuvkI4DzTfLFg6Rqno=;
 b=GE2SFLjFyFbYX8hWKnaTErN3bUwCvWOlgALMzCVOQHgtzJACN0qPf8i8
 S40MKWa1tOcOpFdaZw8x/qHmX10dcnerW0qMdlI/EfJid8c1d+fzfLI+P
 x2C3PKVsjkDDorZc1no42Kg8jGkThv7A5OV7Wk3gxpDh1mRtZMw8neIwx
 jFXx1HIg8oDyG9NhXzJtJ4B3chCzD+cnDhzc+wFIcK42zlPPxqX87oRuN
 uYCpzobXV0nkUXLuBSoF5JVeVPL/JREPJ4cXRzTfrC0izT/TQg3Pv2R1Y
 lv9zSyA5N/tCCLWl0msxAqHm32Xdo4GwuNuDlELOvWRuUnAEkd0cy+bZQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369139699"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="369139699"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="723791836"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; d="scan'208";a="723791836"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 04 Aug 2023 13:47:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:47:56 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:47:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 13:47:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 13:47:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kB1OX2Dla1tcNH94kbsPN/bbNXwNuMNPh8NXLuO2kbRHXDzbSR4E8hPGm8ZOKgWpgsEndlHHiuWeqRoNY572EeKZ4TVEVIE5xWLXyWhc1icF/2jFbNyXpOIhShMNxQPktEXfftvQJiR2qghnSbr3XRTRKQ/6spp9+VnP2I8fgRDxLy8tBI9lUIeL5gejfImNRGRwX5tf0AsnPfHfCrlDyMkO92yiYYu97q09mVFbHR8ieMaz6SoIX4lWbCjrlC9DefBLoKm7VhlXwaUX6+tqmTk7dcf81ujBl4DJYsAuUPyzjvObYxkReakgRi5OzABFikURMQ0fdz4Z1MlUXTUgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFZLuYdF0CXCcgNtVjUX3zye7B2CSldzuVBZd55u1jo=;
 b=Y/bquiMrlm5iYhDqBWjCX9CKRMoQzsAmWcRQHbKbP+VXh4AfQWWHVoU/yQVlmWKuxfRTCjpCjTh5otsk6sNlPKfXHyfbKsErBLeGZbqel96jnW2KdZ88SkQ+3R8cdTyNGdxx9XYhQIRs63h0w+py9hgNbj47nQXbUGUAxX2s59CrL6/iIStYCHOVlO0rFyCL1QxnD+/+hz5+/+tHy+GVQif98nSrjAwLTn0wnlqQg6ta3hMLEsKf+J47sHDzYG6h88jVlR5vq2OH+hAjeGUsptQKr5WuHlhCAt4bQP+GpLZDqQkrDscGm9HrPEKRlkyKlOUVMgSrDftRYJFyMt6pmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5587.namprd11.prod.outlook.com (2603:10b6:303:139::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 20:47:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 4 Aug 2023
 20:47:53 +0000
Date: Fri, 4 Aug 2023 16:47:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <ZM1j9PFKuQEt32xb@intel.com>
References: <20230728192518.1951-1-michal.wajdeczko@intel.com>
 <5abeaa6e197e6f63cb3ae7f66084f011be2fa662.camel@intel.com>
 <5e88b39b-6c15-cae4-0a15-0dbd7ef594b4@intel.com>
 <87r0onw4xw.fsf@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0onw4xw.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5587:EE_
X-MS-Office365-Filtering-Correlation-Id: b98ead73-d19b-4819-20de-08db952c1288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SrrElTYSW3zUd3g4vioMI0XpfiUG9FF1N8SkT8KP6xe44Rj7bbS9AQPbMf4kpjrH86I/WAKtGj0pDgd96guzQ2DQNmSzjoKg5gkKj0tL7aJ1Z/OnVPlvL/PsH2lsAl43Qzy44i6loTWsj36n5IhOFZSlEMyk9bnZ0x+1D1hEzorLmUzO6CMKtmM15eK7sIiwPUcb0W4gNwe+dKuaSo0XjWpFhD62o3y31/c1/9mAMAT7svUAsVJa2icjdDBrrvkw68YeHP7UcrpWPQEtVb/iZ0WAewP2sfZBV/NhQJjWl4JMjO9Uh9PVzkTdZL8tka26M0C6VmfdMIR0X3U/RCpwafWt40Qh79BA76IwXyHGCxCz8/elTbvS2xxyT4U5FQTxuONGsE4q+is3ZfDulp3VDSYIHBG4ijCw5fcD31i0DD3p7KvAnGfSM6j4zmLQAh3zuE52sJmWyVlj9NWLtpiWSKVD3etfEnGZ3wcFrfIhaXGtBtE9jMlqhSimHz1/oEwPtcj3nbcOCTM34JVJCrgkLe3twN3LGxAQVh1uG7i8L7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(376002)(346002)(136003)(366004)(186006)(451199021)(1800799003)(5660300002)(44832011)(4326008)(6916009)(66946007)(2906002)(66476007)(66556008)(316002)(54906003)(8676002)(8936002)(41300700001)(478600001)(86362001)(6666004)(6486002)(6512007)(966005)(38100700002)(82960400001)(6506007)(26005)(2616005)(36756003)(53546011)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ymL0tlL7cLoauWU+AXTIqZwqvr2ya0dcYNMEvDP+JPOHOSO/wvYP1UJJyF?=
 =?iso-8859-1?Q?bDhQ9rWtBtboQ2twNa7wbGxb2rXyF368rq38sRDC7s0LueZ8M+9ztAA+hw?=
 =?iso-8859-1?Q?4jqrW4pWGyYE23Q44S6wr++LHW89XlhLISFjgnJThGPS/4PRfF4J/ZcanA?=
 =?iso-8859-1?Q?NWFKc03MOdcBhIu2mTqGxEI+d9t581YLDepp8VrAkqajafqsuWUkmAkYxa?=
 =?iso-8859-1?Q?Md38GX/QMBI64lHDW5TAuaINXlHeLubCdCUT+zio0ySpYRYnQR3aCVJdSu?=
 =?iso-8859-1?Q?//AW8PKH+uByNj3TVrrYxMU2Lo8kKlzlCoLs2FfQ9IOnRA8ubNP63YBvOL?=
 =?iso-8859-1?Q?KW7wzQHuIYg+j3b9I9EN3KD9Q+YzRMqudAY0twd5wXPe1rRZ9zZtk5C+j3?=
 =?iso-8859-1?Q?nSJ+9AwBzLa/Bv1p4SkA6vRc19djHVWj9v+mljenR0py7IccR5tskMn9T6?=
 =?iso-8859-1?Q?Lq/lgL4UkfSWenU/Zv16WsoyFtE/5f4ywbFNHqFXanoAHIMZUuIsTl1X/s?=
 =?iso-8859-1?Q?CgH29aykYpDrZnp3BBAqI7A49dHLyXMw9kwolEReGaDy08T30yH9ZEyVzU?=
 =?iso-8859-1?Q?m4+wI8x9jbujTTNXwMla80iKJehCLqhAtu6Amh6hvTRg8JMAMT301G/1/l?=
 =?iso-8859-1?Q?9mlTsT97fheWDlMzub3x79iLP1JpeHKmez+Zq8ozugV7hcLhyy4YLPrV1D?=
 =?iso-8859-1?Q?/HU1s6T+e9IZS2l6+YBUIYFYdkeSK+bqnyFtasSGdVYNXNH87TZa37bFLH?=
 =?iso-8859-1?Q?ja5E5ZIvB2WtiaYSj2YzAswcsH+23A4mmk/YOTFQtnc0KiYd+Y55uv7NTm?=
 =?iso-8859-1?Q?sBELnGvYWbXnzdbp1mAvmvbAHDA7pd9L7MgaYTuwyGKTwu3AyoejADDnAI?=
 =?iso-8859-1?Q?fuql6MuIaSSGkhNPOKBKXjCDoWLuTxjK0iJc82yVZXkB28NdrUTHgaNw2Z?=
 =?iso-8859-1?Q?+M5jYw2C3WSlf+lgjZGFWQJ3xVV+1H4Ox4YunmCcgoUuJorTEenZdQwt9i?=
 =?iso-8859-1?Q?5JjtcwseW44sbI70hDEEzszkbBnx6P+PMgxRqhTeFtIbI6QoFtdcuWWG3Y?=
 =?iso-8859-1?Q?Zr/HQDS1rsiqHD73Wx9gjeZLshcL7OcV0QC4N34X8egLZ18OnKEPfsPPkN?=
 =?iso-8859-1?Q?CpB8oc2bEH9Zv6N7pfNwoYs+e5kVcpXjpo1X7XdYFRZk5CCDKpEbD01E3r?=
 =?iso-8859-1?Q?HVZlLor+7805ljp3+o/aKu7zNs/X6aeDHExk9u8LsbNq5CLZrpASH+dXNy?=
 =?iso-8859-1?Q?atU5Ibnn4sx8v+ynhWnnTZS+6J8C5XBcS4q2AD3hs7Z6KXL5Xu/8bolqb/?=
 =?iso-8859-1?Q?2n05bsm2oqP1QhRX+bBnweu99KN4If+CesHUaFERvJm2i3ZD4gCAUqcCHg?=
 =?iso-8859-1?Q?cksApp5IG1LQoyh/VqHWwfAfqBHuvgeX40HamCbGi4TJXZRC4s1WxILu4F?=
 =?iso-8859-1?Q?ytk17KOpE+opDxb3LJukBLdkVesLm5IaCImhueDUvelrxRVhnTVqb8t5aR?=
 =?iso-8859-1?Q?IrhuPB6NbQ8Xj3nzEFZuqh8D2PjpnP8DR+iLsKlGK4BoH3O1BVNKhCy7V0?=
 =?iso-8859-1?Q?+e5P5XVSruY7wkwAQd2o/6LWIZG91OUGhKdK3cwfq3eETL9+A2dLPaHbAx?=
 =?iso-8859-1?Q?TURA+pJhGYkA22A1yWB194u+zWC2vUH8pA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b98ead73-d19b-4819-20de-08db952c1288
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 20:47:52.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1Sj/j7NPitRlhmiE+kZv8CvBXh6wL5qfLVeaEg+uyhcCGUn0kGETDY8aR20TD7Il6E1WJ8gZZa+tuC0MsgQfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5587
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: Introduce xe_ASSERT macros
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 01, 2023 at 11:19:07AM +0300, Jani Nikula wrote:
> On Fri, 28 Jul 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> > On 28.07.2023 21:47, Vivi, Rodrigo wrote:
> >> On Fri, 2023-07-28 at 21:25 +0200, Michal Wajdeczko wrote:
> >>> As we are moving away from the controversial XE_BUG_ON macro,
> >>> relying just on WARN_ON or drm_err does not cover the cases
> >>> where we want to annotate functions with additional detailed
> >>> debug checks to assert that all prerequisites are satisfied,
> >>> without paying footprint or performance penalty on non-debug
> >>> builds, where all misuses introduced during code integration
> >>> were already fixed.
> >>>
> >>> Introduce family of xe_ASSERT macros that try to follow classic
> >>> assert() utility and can be compiled out on non-debug builds.
> >> 
> >> This is indeed much better and clear then the XE_BUG_ON.
> >> 
> >> Also, let me be clear that my intention with reply is not to
> >> block the introduction of this assert macro.
> >
> > thanks
> >
> >> 
> >> But I'd like to raise my concern(s?) with such assert macros:
> >> 
> >> In many cases that we currently use these macros are actually
> >> very useful on production build. Whenever we receive bug reports
> >> we should be able to ask the reporter to get a dmesg or enable
> >> a drm.debug and get a message and we could see these, without
> >> ever having to ask the report to rebuild the kernel with a debug
> >> config.
> >
> > you should think of xe_assert() as extension to static_assert() but
> > aimed to be executed during internal CI builds only, when we run basic
> > integration tests, and were we are able to quickly catch all misuses,
> > caused by rapid or multiple changes going in.
> >
> >> 
> >> Then, we add this in the code and we start using this everywhere
> >> without stopping to think if that would be good in a report and
> >> we end up with a code full of asserts and big problem to get the
> >> useful information from the bug reports.
> >
> > those asserts shouldn't fire beyond integration builds - if someone uses
> > assert() to tag unfinished work, then it's simply wrong, in such cases
> > true WARN and correct fallback shall be implemented - and that's the
> > role of the reviewers to spot it ;)
> 
> Naming this ASSERT is the first step towards proper usage, because it
> implies it might be different for regular and debug builds.
> 
> The second step would be adding a comment documenting the usage.

Yes, please. Let's add the documentation so it gets easier to everyone
to understand the rules and help during reviews to avoid the same
mistake written below.

With the doc in place:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> I think in general the idea behind the conditional GEM_BUG_ONs was to
> avoid the performance impact of leaving them in place. But then we've
> started sprinkling GEM_BUG_ON indiscriminately, because you didn't have
> to think about performance. 1200+ instances of GEM_BUG_ON in i915. It's
> just crazy.
> 
> >
> >> 
> >> Aside from the fact that we end up going far from other drm and
> >> non-drm kernel drivers and starting from day 0 a driver full of
> >> driver-isms.
> >
> > maybe because our driver(s) are bigger and more complex ? also much more
> > developers are working on it, with multiple refactoring going constantly
> > on, so we should have mechanism to allow us catching unexpected uses
> > without polluting production driver too much.
> >
> > btw, DRM already has assert() but named as bug()
> 
> Do git blame on that and realize it originated from us following the
> same pattern as GEM_BUG_ON, which got copy-pasted as XE_BUG_ON. It's
> just problematic all around, and upstream consensus is that BUG_ON() is
> not even for CI. Use warn and panic_on_warn instead.
> 
> BR,
> Jani.
> 
> >
> > [1] https://elixir.bootlin.com/linux/latest/C/ident/DRM_MM_BUG_ON
> >
> >> 
> >> I would prefer we have a driver where we make usage of the all
> >> the drm error, warning, debug, info variants on a case by case,
> >> carefully analyzing the needs and thinking about the bug reports
> >> that we might receive from end users.
> >
> > +1
> >
> > it would be also nice if driver is correctly handling all errors or
> > invalid input paths, but at the same time, it shouldn't duplicate checks
> > that shall be already done at higher layer/caller - with asserts() we
> > just express our expectations without ignoring other bugs by trying
> > handle that unexpected case down the stack
> >
> >> 
> >>>
> >>> Macros are based on drm_WARN, but unlikely to origin, disallow
> >>> use in expressions since we will compile that code out.
> >>>
> >>> As we are operating on the xe pointers, we can print additional
> >>> information about the device, like tile or GT identifier, that
> >>> is not available from generic WARN report:
> >>>
> >>> [ ] xe 0000:00:02.0: [drm] Assertion `false` failed!
> >>>     graphics: Xe_LP 12.0 media: Xe_M 12.0 GT0
> >>> [ ] WARNING: CPU: 4 PID: 8442 at drivers/gpu/drm/xe/xe_device.c:280
> >>> xe_device_probe+0x2f5/0x4a0 [xe]
> >>> [ ] RIP: 0010:xe_device_probe+0x2f5/0x4a0 [xe]
> >>>
> >>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >>> Cc: Francois Dugast <francois.dugast@intel.com>
> >>> Cc: Matthew Brost <matthew.brost@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/xe/xe_assert.h | 47
> >>> ++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 47 insertions(+)
> >>>  create mode 100644 drivers/gpu/drm/xe/xe_assert.h
> >>>
> >>> diff --git a/drivers/gpu/drm/xe/xe_assert.h
> >>> b/drivers/gpu/drm/xe/xe_assert.h
> >>> new file mode 100644
> >>> index 000000000000..65306768d637
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/xe/xe_assert.h
> >>> @@ -0,0 +1,47 @@
> >>> +/* SPDX-License-Identifier: MIT */
> >>> +/*
> >>> + * Copyright © 2023 Intel Corporation
> >>> + */
> >>> +
> >>> +#ifndef __XE_ASSERT_H__
> >>> +#define __XE_ASSERT_H__
> >>> +
> >>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >>> +
> >>> +#define xe_ASSERT_MSG(xe, condition, fmt, arg...)
> >>> ({                                           \
> >>> +       struct xe_device *__xe =
> >>> (xe);                                                          \
> >>> +       int __passed =
> >>> !!(condition);                                                       
> >>>     \
> >>> +       drm_WARN(&__xe->drm, !__passed, "[" DRM_NAME "] Assertion
> >>> `%s` failed!\n"               \
> >>> +                "graphics: %s %u.%u media: %s %u.%u "
> >>> fmt,                                     \
> >>> +               
> >>> __stringify(condition),                                              
> >>>           \
> >>> +                __xe-
> >>>> info.graphics_name,                                                 
> >>>      \
> >>> +                __xe->info.graphics_verx100 / 100, __xe-
> >>>> info.graphics_verx100 % 100,          \
> >>> +                __xe-
> >>>> info.media_name,                                                    
> >>>      \
> >>> +                __xe->info.media_verx100 / 100, __xe-
> >>>> info.media_verx100 % 100,                \
> >>> +                ##
> >>> arg);                                                                
> >>>        \
> >>> +       (void)(__passed);                                            
> >>>                            \
> >>> +})
> >>> +
> >>> +#else
> >>> +
> >>> +#define xe_ASSERT_MSG(xe, condition, fmt, arg...)
> >>> ({                                           \
> >>> +       typecheck(struct xe_device *,
> >>> xe);                                                      \
> >>> +       BUILD_BUG_ON_INVALID(condition);                             
> >>>                            \
> >>> +})
> >>> +
> >>> +#endif
> >>> +
> >>> +#define xe_ASSERT(xe, condition) \
> >>> +       xe_ASSERT_MSG((xe), condition, "")
> >>> +
> >>> +#define xe_tile_ASSERT(tile, condition)
> >>> ({                                                     \
> >>> +       struct xe_tile *__tile =
> >>> (tile);                                                        \
> >>> +       xe_ASSERT_MSG(tile_to_xe(__tile), condition, "tile%u ",
> >>> __tile->id);                    \
> >>> +})
> >>> +
> >>> +#define xe_gt_ASSERT(gt, condition)
> >>> ({                                                         \
> >>> +       struct xe_gt *__gt =
> >>> (gt);                                                              \
> >>> +       xe_ASSERT_MSG(gt_to_xe(__gt), condition, "GT%u ", __gt-
> >>>> info.id);                       \
> >>> +})
> >>> +
> >>> +#endif /* __XE_ASSERT_H__ */
> >> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
