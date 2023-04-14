Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAD3C77B6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 14:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1040710ED73;
	Fri, 14 Apr 2023 14:37:13 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC0C10ED73
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681483030; x=1713019030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t7mV1ArCIn0VlfbaJDAWGj8BoeakUSZlT6TuJR/SijI=;
 b=np8FohPo4TQIKv5Twq6DffNIOOkgkvk7OlUNl8934bak/TW6NScNcFxE
 UumOSsgPw1332GLWNkb9a0UQfMgRm84ptvLN5XdawOgM+R/c9Cg5wf6Eq
 KoGHuUBSd+2TiV02pqwKHQHbr+dJGgOH3t23fM+W75IfXdH9QF070Gynd
 NR0B7WKr1QlS5GbrQ5ntmQprSYvNSJiY0nl2z9kg5VPm9usZSOus/SXHf
 TuubEQ1QOXIJp4QsNKsou5yktKB4UNsO43UUbPhmbcFvgEyMexM9BD2Kw
 /8vUUhI62XcJJKN30tIH5rwjL3iAeWsxJmGH/E4rJn6tFRT+gY1gcwa3w w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324105306"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="324105306"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 07:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="936032642"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; d="scan'208";a="936032642"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2023 07:37:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 07:37:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 07:37:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 07:37:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 07:37:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJfC1z9nt/0313sWcEUTWO5EAQ/P3JoP5YngY3k32hM3EVzCw+Jwgr3mAPB0SklyutVxEy/foxwl2rBg1Rc88Tpg+tSj7si01/YPBSwjKqTfOH1mByq1s6h7yuZ8vUotXv7IQgTZDT3wxK2LSofNBoX9/HEf0ZQuPsOdCNCZBpn7urCXbhW3mtUa4A08YVNhRLl9jObJisLjipM7zolbvl4kUVfAdjS8T2VsN9xNnr3/U62JWjskH3R1avj/Ul8NcXITRNP2aX9SgfyqqkAF3LtG3I+fC6PFrDC9pJqVvvB7X41f2TTz0Y6Mbw5LvWXS6WJq9f6CZzs43sA4LuMPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+3iNC1vNggZzoCAs7wqnrGCDv9N4SvjqNGtJkkSiBs=;
 b=HSp+oo+fDSOqLr3VS193TpgUdhEiPhYRYV2sy+HzKIsRcPkAHe5TToOBH5KSeqH4IL99xCPPzRgJRJ/eUbBT5UX+cJQJKoSkjRSzee5W+84FarbduSZiuBxhEVES/fJuEDwuKk/NcmxBwARchm1Iu17F8QOn2xGtI+aXln6+c1VwjqXgUaXpB5Mhn+rm6wyuNVDp4UvLCEK4DvJnxBc6Xd/cmbK7vJ4kleWwx9LpW3T64L84TF3xsnT7GMXDDNYTgkJNtlPo81ifULBEsX/n5HE65Gw6MdT5rm7zX/p3k2foi9B+tf1jvDoa+ZYjnuWvgfK5zN5eVWy/Ql37AIxSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS7PR11MB6199.namprd11.prod.outlook.com (2603:10b6:8:99::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.36; Fri, 14 Apr 2023 14:36:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%5]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 14:36:58 +0000
Date: Fri, 14 Apr 2023 10:36:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZDllBWhXoZGag1EM@intel.com>
References: <20230412082054.3314568-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230412082054.3314568-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS7PR11MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 4afb24c4-4300-4f02-d7a9-08db3cf5b356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ifOPuapsTgxPiybzFzoONEIWgFETXHxkRL9h9NaOeNTd7PP5ROywhK770znFYLmx1kAh8WKj7HiGXSroPPSpMbHRJsve7SzPTixspbi0uAbteAoqf/OmlcQ8BPB9gAP7TuUO2fNv2XkOxzqZgd1chsXCGAc3Cem3GZRJwTj872Ij0SqOkWl9PPjQe1Mc6a9DZcX7+Yggvv+7vSOZtxtA7RGmE5ikdV/qUf7sMB4XYnaIikuOGFefUqvhIBMNULs3ljHa14dQqCpw1q5iLNxgwJVLPCrxgZpahoL5ndoa5VqhGj8SHkuTe41617sonuImv3rZ122C9ZavENQ6Zh/YQH3dsFNLb3GjPhEz2aAMb5BoRt84YGPWtcM3Wz4a23EipRyajOt7S0l48jl5ebrtCY04/ss5EJihV5wgG8tKuDXNrer0DnnWJgfwGQT1oMtAWqVsw7eNDw97e7PJnbENJIzhlMR+TPhDBbRnb0qRZ6OQCVEHH40yi/F+s/zyrPXN2L/8ZXXY0WhTqE5D5teUZdzHdrSw0NURavOsTPHRNtfo2FaA7TXfgBPbpLFvz2w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199021)(83380400001)(6486002)(6636002)(2616005)(6512007)(478600001)(6666004)(54906003)(37006003)(316002)(26005)(186003)(6506007)(2906002)(38100700002)(5660300002)(36756003)(66476007)(8676002)(66946007)(82960400001)(41300700001)(4326008)(8936002)(66556008)(6862004)(44832011)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KdF9tnVfAxRaWLKOtoDC3SHBQ/zKCBaHgeb05nH0KRtET4vCA2wZEvzzXtJh?=
 =?us-ascii?Q?ECBONkNomX0Gxg8VWID8t1uX3OWCM35+AJ02y1Ollby/XxVzwILxcqzqJ/4L?=
 =?us-ascii?Q?ENJzkQNREertk92DdJS2GFclSLT7wCa8uCEUWSgSztNhyrQEJ4YblBn7DFY9?=
 =?us-ascii?Q?lTpzJKg5e8jyztLZyrPvSpO1DP/7bTfESakHuIsfVhf+6rIk5N8KHi28JXGA?=
 =?us-ascii?Q?mK97H8WtnqIku0UPmXggGvjOPwwUiNMsEC4xcgLfx8X56cCLNTgKXA2wQaXE?=
 =?us-ascii?Q?T1e01PlsXkjsuRsg76Foos4nEOvIvzChD70A60pvAo/Z2FqsK+shQxzwwUnf?=
 =?us-ascii?Q?jTbOI3to6nZY/uxKPmHbP6vC7csQ6IHJnIvF7aWtKpTsdnpwLtw9r93lcCdA?=
 =?us-ascii?Q?qg/sjhrFGblThVmB+o6zSK5PKbCv93XleTONr8TnzePtl39lzt9dbzeQvP3b?=
 =?us-ascii?Q?vI6h2qJN8LwUHXmTK8NftG6xN2wDmTekTzwIogu69bASydXzZ4hCsHPC3fd8?=
 =?us-ascii?Q?7QEkEzaecm4Uy5uorc5QvZJ9oVute1T9X+GcrkFZ+PwrL1SNBy9lsc12diih?=
 =?us-ascii?Q?ky1oHjqYTI32KhQSvjbZR7jAIrZ67WLZ2gIlpbOI6YgJ+13IwW4C5MM3sBLx?=
 =?us-ascii?Q?sS9HdaL0lPKUa4PQrMrTmQCfpfPggiPpDR9CA0SFIUjLklF8le69MobwY2EC?=
 =?us-ascii?Q?6N2Kik4WxbjsZoptU+Kgj5WJ5SQBHSLhreiviUbZleycixHXpBhb5DuGKJT1?=
 =?us-ascii?Q?sSeTqOUZu0fNtPgRVJapVd16s8Y/U11rcdhJJ0CpsGIM7ijeVFnsE0GS/TK9?=
 =?us-ascii?Q?OGwGtPzROtmLaoS4hi3T0y8mp9ZN456azsDiokmw7nFgyOURStJHaVc24blc?=
 =?us-ascii?Q?FPytNzTBLZeEjlFeTK4klsnj9S8LE5AahPL5XWeU4WPi1q/K4W8XZpR1oOgj?=
 =?us-ascii?Q?7+O52vYFMamtVoZfYWrCqAkRDrgw5uiXb4S2t6tcKBNNclRDJdxLPhgoP3g6?=
 =?us-ascii?Q?r2CAODA7fK2cPl8ZBykYJQyhZ8A+ZkNzKj22yaEfImNo2dhXaV15m3BW09BQ?=
 =?us-ascii?Q?13010lS/lXRt9yjX6tKLoOj4/gZ7htw6DfeZw2Dn+rLnmZeJtv5woGt4YCQj?=
 =?us-ascii?Q?frsBbeZUbPoNPIQIUoU/1ltNovuGHecKt3DyycWMy97STUbODlTF9O+Sr8M1?=
 =?us-ascii?Q?8/ohWRZG/jTfgB4XQpLgmbvhrx6NVr98YYThzJ9z0qp3rJ2bKtQZn3ROdlXc?=
 =?us-ascii?Q?gmU6ZIESY+zSNW/iAo6N1nnlyyjX+2HKJYpjimE92Yo0W7QOd8EsD42RhMwA?=
 =?us-ascii?Q?kL+sbRSOyFjccy82TqA8y0al4GpY5xZYV70e/WThMgeFdOMM/M9nUCKRtNBn?=
 =?us-ascii?Q?WgsLHSVTA/YLS+5VLY3SrAw3ULUuAHnpwGjRT2Mkb7WmxcpE3AI59hM36cLF?=
 =?us-ascii?Q?yuHYvaFzPH/SrlEzlkerqk+7XAb4q5P1GzI4Bk67R8rJPFMcVEHP7wEkZY9h?=
 =?us-ascii?Q?J0uZFIdIyIbvZp8EaQddsGNZSgvBcOkZQ9MiApEmAjqByeKegI8NUB2fhXhq?=
 =?us-ascii?Q?GdzdYBXH2cytQTRGq1zl40tqjcug9zjHtA/+hh9M?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afb24c4-4300-4f02-d7a9-08db3cf5b356
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 14:36:58.1387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EMh7IPHyT+EEnqBNUAqsK3hRItybkq9gwsMN5QXQQSX43b2lfYQy/rxm3Psx3OYMVe9Q2N5o0FNhjAgZoHCbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6199
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 0/2] Dump + OOB workarounds
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

On Wed, Apr 12, 2023 at 01:20:52AM -0700, Lucas De Marchi wrote:
> This is 2 RFCs in one, since they are more or less related.
> 
> PATCH #1) Dump the "driver workaround database" to check what are the
> workarounds implemented. This is useful when checking against the spec
> what workarounds are implemented in the driver.  This can later be
> extended to mark what are the "active" workarounds on the current
> platform.  I think this second scenario is more useful for the debugfs
> usage.

It is actually useful for the w/a assessment to know if the wa is
already known and implemented by the driver.

But for this use case in particular, this information without the
platform that it is 'active' is kind of useless...
I would continue to use git-grep for that while we don't show the
platform info.

But thinking about other cases I also believe this is not that useful
without the active platform information.

> 
> Other alternatives I have considered:
> a) Reuse the kunit infra; with this it's possible to easily fake a
> platform and get what are the WAs considered "active" for a platform.
> This is nice because it doesn't need to run on real hardware. However
> this may be abusing what the kunit is for

First I also thought this was an abuse... but if you think on validation
and we have some way to cross check some expected table against the
implemented/active one then you might build a case.

> 
> b) Just write a tool in C or python that parses the section from
> the .ko and output the info need. Drawback is keeping in sync the
> declarations from xe_rtp with this additional tool. And probably also
> that it'd need to process the rules by itself.

why from the .ko and not a grep in the code then?

> 
> PATCH #2) "out-of-band" workarounds, i.e. those that are sprinkled
> around the driver. In the implementation here I tried to keep the caller
> similar to what it was before. With the addition of XE_WA() the caller
> "registers" the workaround so later we can access it. As example I
> converted 1 place in xe_guc.c to use that.

I liked that XE_WA declaration.

We could even have some tool that also checks if all the XE_WA declarations
are indeed the lineage number and not some random hsd number.

> 
> Note: The "condition" is checked each time it goes through that code
> path.  I was debating the ability to just re-use XE_RTP_RULE() instead
> since it appears all the conditions can be translated to rules.
> Consider this the alternative (a).
> 
> After writing the commit message for that patch I thought: but if we can
> transform those conditions in rules, we could very well keep them in an
> additional table in xe_wa.c, which is the alternative below:
> 
> b) keep an additional table in xe_wa.c whose action is to set a
> bit/byte(?)  in  xe->active_oob_workarounds[]. During probe
> the rules are processed and the ones active are marked in that array.
> The extra section created by XE_WA() is then used to just map
> the WA to the index value. Then the callers would only need something
> like `if (XE_WA(xe, "XXXXXX") { ... } ` since the condition would be
> executed once on init.  However I'm thinking that this may not scale to
> all workarounds we may have.

I like this idea and I believe that it does scale... It also helps
to push back on big ugly workarounds that doesn't fit in this.

> 
> Thoughts?
> 
> thanks
> Lucas De Marchi
> 
> Lucas De Marchi (2):
>   drm/xe: Add debugfs to dump all known workarounds
>   drm/xe: Register OOB workarounds
> 
>  drivers/gpu/drm/xe/Makefile       |  2 ++
>  drivers/gpu/drm/xe/xe.lds         |  8 +++++++
>  drivers/gpu/drm/xe/xe_debugfs.c   | 12 ++++++++++
>  drivers/gpu/drm/xe/xe_guc.c       |  6 ++---
>  drivers/gpu/drm/xe/xe_rtp_types.h |  8 +++++++
>  drivers/gpu/drm/xe/xe_wa.c        | 38 +++++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_wa.h        | 14 ++++++++++++
>  7 files changed, 83 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe.lds
> 
> -- 
> 2.39.0
> 
