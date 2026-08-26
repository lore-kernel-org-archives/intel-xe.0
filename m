Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49770C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 19:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E4C10E301;
	Wed, 26 Aug 2026 19:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HVdHpAHZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7067610E301
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787773564; x=1819309564;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OVBOyuagXLUOmGRglHqtHIFfSQ/OmGrBrOjKqQy1N70=;
 b=HVdHpAHZY1jxgYKxoZlpjuX/nAbteVhuneRVcLIiuDiWGsnlAOaXqtQN
 p1S8ZBq2WBsMRtiLiRW59pxPosfB1SObJjHEOsn2ig9c93qNAeE/hiqR4
 N/wU5Zm+MiMs6Rzhex9kvKUUBFP1u1gxp2rAobfYqD1pdaMDfZaiThijB
 t7f1+55eaJRIytNtW86fdLh1ewkpFAHLJ453txndpNBzeEm9wjASBP65T
 GHTF7Rs467+jb/zFUVZU8SkV2TD7ZhzLzC4D4cG5n+js273MdBU2EMzC/
 4Cq55oP210XzLkeYox7RY/ggGj9tSX4Gzcm1TMlNy2kDSehYDCTkl3jDL g==;
X-CSE-ConnectionGUID: ii96mWsqQVK+NCrLECVLLQ==
X-CSE-MsgGUID: NgIkYeY8RPi1Ed8zUFgbbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98932478"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="98932478"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:45:50 -0700
X-CSE-ConnectionGUID: XstIDsQtT2SZItwXJhLXNQ==
X-CSE-MsgGUID: 85RbP9E0TEWbEd45LC6FKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="268242851"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:45:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 12:45:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 12:45:49 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 12:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVMlSRpVM7pVV7/AbdnXuPoo3Z3+AO5ISSctci1uoQqOqEXWg/tzYOKCcgeRE0N/Smk9GCyvYE+dAjpGoJwCJ64pDuXqZZsGIZVZOPJPywxhOOY5wv2STJhWWHCoxK3rw7ZkP6108VmDRS6b2KEYppFsEstdyMoCgN3A5nMwoenvgzgwINU3RkDChkueRRpstR9U3XD+y/yzf8i6IBvDhVn64mBntZMsTyttdTypoES2jQEhNdLYEPLR+NGOlhmfGtDorHjQi5uw+aMFHmYWgiTDfPdp/nXcfmxz09fGUzqbxVCsccsNJo11qAe5eo3q8+P+jSv9BjNPUMVUrxj/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmueoOfjAjlDdiOeYZb6mGIEpg3QiW4MuUEnQhY+60M=;
 b=dTUFmW0Po3qav6S7ruIJt3weO7H3yuNlA9AnxVB3DKK9UCHSFFxj0rfcNQh3TcOIl0PrPcIIn30/mICRQZV4ikjMq09T8XT7vU6N6/qCA0M224HnjSDzwoIw9SaL2KuN4LQ+/aSlIQQvxtQBkVAaYe9uEk/I+e+Iao0vb4Gpb2HAhli+6Y6So72f0Ni7PWCwKfnUxDsensj5V8ikvvMHj4LCfRdPg19G67y+0DX+hUIiLyfvcr22jJ4TrW0aIArKl2hcUdKcs4i4y/ZDLqJY1WWHYmpYiYefokmqn+6R+YFIo6NGAmiQWZbtcOdV/ZWUyu8+1szzMpFCoDFl5Vy0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SA3PR11MB7486.namprd11.prod.outlook.com (2603:10b6:806:314::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 19:45:45 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%2]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 19:45:44 +0000
Date: Wed, 26 Aug 2026 12:45:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for
 multi-queue GTs
Message-ID: <ao9CZbjcBZAhRZVK@nvishwa1-desk>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260826112533.3289978-4-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::6) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SA3PR11MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c16be5-faa9-4842-0207-08df03aa9dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DWnqhroLZ5en9eUPedewRWIedVUGeaUJDoVfr7selLKDQfg+HTvxCdto1oSSbV+1JlDkQZ8OB+/XdItUTm640M7sVKkGPKP/vtHSjd3v7BrBeJT7UIfjt2xSOhu7Wws9oR9N1AXMSnoOkqA2L2Iy2AvuSF4EkRB6mhJ14DvUDAdvVUAlOp+i6wvldonfH7QrAAkDcOSj3U8NYVTfCt4pYy7VI547vv5586LS6iJVZWYE9u2noNUcVUjznztp3xyiwKJSdGvzpi5RAsDvTZeS68rfxbwIdGprj91BzEHWVDJrTtu9wi1Xnp5kpj6hFuGPcAeMrM6Bbt2aQlDc2qc4JaDNNK2mO7ruCaN8axHln2137XNLfYoNDteM8Sq4Ms6EexuDO5Hz1Cjadf/Ji0K8QjSZyNZeoDcSsVv038DnUp/vvzsXFNCYNW2M5TQroWd2gLYxcge0KZAN1DRjPpvTPnHRON6/ZClcKuyNL2fayOtTGccHN/EXaeiG3Ah/n6JdXbrfUewFeVJ7Itvcx4+3xEXhLt8RcuCz8akq6q9W0UCf6/BmY6q4muJQU/z3vQPPGccE+5toNo5yDgJIS7YstAB+t72K5e3/L91Lg3KXjwmPZ/P+oGTlsXBnd06kD+wQRS3+9KziP8/0GlFv3/xXu2cjI1DmkkEZyXadiDCZFVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k6FY7GVSMYbxX7x9ceycSqrwBeY1jJ+JGN2CXJZrP5XjsM00yJuKUFHHbc13?=
 =?us-ascii?Q?9DapmUsaQc+HRvKopag+pX7M1v6EMPRa78NpayvaCz5jXwnRPC6aBKryGl/7?=
 =?us-ascii?Q?A1sRrMQWeOfqV05QJOFVwP5NFyAlpA/F+FWlv6aZBegG5lmhzoS/256qcyZA?=
 =?us-ascii?Q?tCpXOQ6vV4kNggGP8pxRr60fG8j9vjuYl82VaAr7oT+gukYUdbq3TZHTy2vC?=
 =?us-ascii?Q?8w8kE1+p8lz8CsDW2YErn4mX5qHop/A9Hq/pzWX9ozyrvpZhkbZqKb8ifgw4?=
 =?us-ascii?Q?s5pxRLCSHy/6rdPj4W6Mc0HS9aOyXuD3JSe9Pv93uZemo7ePvYHy9dyJUWOv?=
 =?us-ascii?Q?eOki4/t1SL1KiClM5YJQ0CJigXgJjHmP3b1LP9NhP309EAQaPNg4NE2esSAc?=
 =?us-ascii?Q?MQ9XEVfLLi6Rd3pINh680AwAAEP7I7jijUf3x9d8TCpei6brWvYTTWXZuRga?=
 =?us-ascii?Q?JIF7wiw+iUmkBXoLRAxNsd8kot08PVg41RQ52UM7ERvrnNuDUhkpIl35S3Oz?=
 =?us-ascii?Q?W/jmgBmW8X/mphRaxDeItLQ5EbuCGrMoguFSOy0BikL3OXXxiqAH7fkVdbxS?=
 =?us-ascii?Q?8wowAVUbDLgZFN7CXCJpXMCB//Ip7F2PHqTRo/uZi7zxpZdLwNpGYX/SYicK?=
 =?us-ascii?Q?e60g1ZOkH5nyvmoUDFSeixvO9dhu45UWCqOK9hk3NkUB+oR8nYMfaGUfRAOu?=
 =?us-ascii?Q?fClw3ek20ETvqtvUFc/IMysM1k0XdhLRcv8+jdswIaVtEmB3utICeQ6AqGKy?=
 =?us-ascii?Q?1qQlqz3ehL0DuS8hgi0qbUNV8m7EB0Xgt29ViUmpnzmQYzaww+0ITbD16OUo?=
 =?us-ascii?Q?r2ooQQcwQe65DaUOpv2P3Ji1CddfVobYouvm/5nNAAUpusJBqFyHx4cNWKRk?=
 =?us-ascii?Q?m18JPz1JRMSrRiWHXYlIQVA5pLEiXCnv2DQLURdDplzVbbv5ijfUBw8MymgK?=
 =?us-ascii?Q?vjV6MDFVvef/wVcE2z7sGEUH4BsK96oj+Jb8k8tWQ50lL070ZtoRKvdjB+5L?=
 =?us-ascii?Q?FQ5jVJdcRA1EMkmPV8x389A8NinPubh+UpYhH9EFOwpzHVuCL7U8rmKTLNf9?=
 =?us-ascii?Q?z6aTpQXFhikZxlqNUnK46uq3Z1PDwTd0sGXhT+JZh0jg2b7MU6vFqnKQaJtA?=
 =?us-ascii?Q?anJV/IpOfo5kvPRJJE0rpHprGX4PzQZp1h4pWhDI1WcP2YayRvwWu2g1Ny3X?=
 =?us-ascii?Q?7gSckO8E0teiRmx3hxeDXXAzwTohl/kQRDBbeICaIrNYh56jw0sJudGTsufj?=
 =?us-ascii?Q?uhHb+QRvPYvyONK7qtg+q0dSUgyDejCnEOT0tV5MIp1YdkJip56clUO7iIn/?=
 =?us-ascii?Q?VwViJmVkFnTSWopHlJV1WLFPU/UzVJNJxLrAe/RvPrwgg3iESv0MD7Xc0hFG?=
 =?us-ascii?Q?js73oZQlAwNefbAFHllexlN3LVU7RNF9kLTIJGRC4G2VSk2cicbbGgLhqAY7?=
 =?us-ascii?Q?MrvGCPZwiE1yljfEDJzAYG/LN2JcOoXLSc7U7HEhLtsHuNfwPPn+KRKwrGew?=
 =?us-ascii?Q?BEWEmGg6hQagEkSkVQDyidJix4XnI0l7TsM6V1lI7mizFPy5EGKs/J4zq9a6?=
 =?us-ascii?Q?e6aIyWmzyaCaNHg6gM8/9sUk5UBZZIktT/5bnzYRN80cEeMIgTUnPa8vJBpU?=
 =?us-ascii?Q?4ttWndETHHjRz/XDijmSv6Z+Ytzq8QTn3HQIz2J0C/XVTUkIdQGq3P25dOJU?=
 =?us-ascii?Q?vfy49codSIK8fzvIwRO5wCoCvTfqU78JUtjw85jer5B/1Exl0keLvCK9hAda?=
 =?us-ascii?Q?p88cYYV5bI5uyklQgKXEJDwiVxSMjoNQ+w6zSPmZ8UNP2XcXvdq2?=
X-Exchange-RoutingPolicyChecked: S+kXwfxPQzl/oWv9W4v0nukmNARvpwkeTMfTgImNC4G1Jnjj7hPETF5psMNuEkqDMfyOG1JwwsbI+VMhqV1Nk+V+2gz/TCtfGXfm7APWNo5K3uBceL37lv2mvjf7pqIfRBKZBbmbzx7aAtuzBXZCc1SXwHzHSzvQCnFFLrbjc0vN7awSoAPEuCrg6+lEcjlZ1UhwOaz5vB4mD8iddrmerkTftugJxsy+/twjFG3XSkKIINqpGO7ut6Kw0Q7sKJCScWy523ReTo18T/5aFUm+7cwkYlSJhBBHB0Dn/z1Zh0nuDkpVQ6oZeLNfofuXhJB734gW0PUcLs8UNyK7a3KWXA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c16be5-faa9-4842-0207-08df03aa9dda
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:45:43.8944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SAEdwHszCM/rhtQQgZ+NhBWUikDJZFTR3FwguSj3hIHtyz+xSFETBQch8YDckRwb2jPL6s5icoSNPqUwW2riTgU9U5A57a1TcnCGWckB4BlQordLiKawM5tpUjojnmG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7486
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

On Wed, Aug 26, 2026 at 04:55:33PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Engines cache GGTT translations in their own TLBs, which the
>xe_tlb_inval_ggtt() does not touch.
>After a GGTT unmap the engines can still hit the stale translation and
>read the old page.
>
>Issue an INVAL_FULL (intra vf) invalidation on GGTT unmap, gated on the
>GT having any multi-queue engine class.
>
>v2:
>- Use xe_gt_has_multi_queue() helper and address nits (Niranjana)
>v3:
>- Invalidate both the primary and media GTs, similar to
>  xe_ggtt_invalidate() (Matt Brost)
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 29 ++++++++++++++++++++++++++++-
> 1 file changed, 28 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index bd65100283e3..cc43089de34d 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -451,6 +451,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>
> static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
>
> static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> {
>@@ -482,8 +483,11 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
> 		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
> 	drm_mm_remove_node(&node->base);
> 	node->base.size = 0;
>-	if (bound && node->invalidate_on_remove)
>+	if (bound && node->invalidate_on_remove) {
> 		xe_ggtt_invalidate(ggtt);
>+		/* Drain engine TLBs so a recycled range can't hit a stale entry. */
>+		xe_ggtt_invalidate_engine(ggtt);
>+	}
> 	mutex_unlock(&ggtt->lock);
>
> 	ggtt_node_fini(node);
>@@ -600,6 +604,29 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
> }
>
>+static void ggtt_invalidate_gt_engine_tlb(struct xe_gt *gt)
>+{
>+	int err;
>+
>+	if (!xe_gt_has_multi_queue(gt))
>+		return;

Acutally, this would require an explanation here as to why we are
doing it only for multi queue here. Or, we should pass a bitmask of GT types
that require an invalidation while invoking xe_ggtt_invalidate_engine().
As these are all static functions here, I think a comment here that should
be good enough.

Also, may be check for '!gt' also to keep is similar to ggtt_invalidate_gt_tlb.

Otherwise, LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

>+
>+	err = xe_tlb_inval_ggtt_full(&gt->tlb_inval);
>+	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
>+		   ERR_PTR(err));
>+}
>+
>+/*
>+ * Drain engine-side GGTT TLBs on teardown so a recycled range's next
>+ * occupant can't hit a predecessor's cached translation.
>+ */
>+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>+{
>+	/* Each GT in a tile has its own engine TLBs to drain */
>+	ggtt_invalidate_gt_engine_tlb(ggtt->tile->primary_gt);
>+	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
>+}
>+
> /**
>  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
>  * @ggtt: the &xe_ggtt struct instance
>-- 
>2.46.0
>
