Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1149C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 12:49:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3010E038;
	Tue,  5 Aug 2025 12:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFi3znB6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9AA10E26E
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 12:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754398171; x=1785934171;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oTeE04xnChUVRMpgsIVPrz5npkZfm/9ULGslcMjxtks=;
 b=DFi3znB6Dku+ntysING76VYYfXIXs31mPQeSoBDryTv1haf6+Aax8W6J
 59azBecrhrEtSb8SrvzWqGsd03nGHDSorjJ0EkExW+IdW2oPfSF8l66Tz
 2JKxLZK4sMhEMdroK+nP9KyQPHxpB/R3rYdN50oxNFN1QUS2A2Gjdz4oU
 7NBpYE4eHvNiNFW62RHZchOi2GEn/tcL+cdzuo5oZaBEmAvHCStafujCH
 8Ot7daW9qNPS8Jygseh6FCXua7lGeaTmOOjmQO102kpkYqTwtQpBXDUtt
 7U33Wlzr2mRY++aB0F8FjTBRuZlNuVkVL0eSSYsbG01jBjHPhtOn+/jWG Q==;
X-CSE-ConnectionGUID: dzna52SwRk2H8E7xjqjJ6w==
X-CSE-MsgGUID: lJSz73RuQc2sy0B6NKlWGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="79242557"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="79242557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 05:49:30 -0700
X-CSE-ConnectionGUID: 2yLuP/A3QUSHxtYpyWS1zA==
X-CSE-MsgGUID: mmRL0OjhS7KkZEMYA3UuQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164387409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 05:49:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 05:49:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 05:49:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.78) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 05:49:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wm5MBRzZxRHwaxtCT7p5qKQZ0aOhB/ny1Smn3gurKlOdo8wHGpM0OLyW4nCT9dMdd2pG+S20rCwClWjL8Wmb/gk7UJcvxJm3oHLdZC9aWzhGFJsChll05AvoDBaCwP9IargbQkUztuP7YtT0YG6iGz8C7eY6IpgO7eESzZZuzbJW7Cm4oFHDR8Jg9k+8X9zJ5AspzxQppjp0kTQHdH7Zh/M0KPRCggxfr+yEiCNs1MMqvKyF/RknQ3WnzV7rOQG5Iki9R0jYZawHBlO3bfSlrRJGd0lrIabVTixcvfZB72SLepMxKRVULXFF5NizpFqvp2Da/SQ6moP2ZpHegvVwqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QON71e+78zKR30CLRR7WKkyZQrqno7ntZV10VCb/eAU=;
 b=oWy9aM0sHPKatnB4rg4wW4Mcr6wqdFTnvYtMMbig2+xvBOEih+SbVKnoMUqtApFHIU6wZybpn4y6U3Sd/x9XblxwQ7s/6zPTkCeEvt/lpvtfByEToBJy/yh6BTg5LEMTpY7GfzegOMrrlqFtErVnCrSX8MAzRq4yCefUq/LD+ShjWfIpM/YjV79c2A1pLeJUKkRilV/LXWh2614iKbwrZcNgA7GEOkdj5WxPhSeOKReKAC21E7Ay6IfqqoGrvzI+eiHfaMebCnM7iH562BYqlx6gK2ao33cpKMMYMEwLLvZSS9IcZC4Fk2AmqpAW0y1+4gz8DChubPXw1hJhPq+Bnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6193.namprd11.prod.outlook.com (2603:10b6:208:3eb::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 12:49:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 12:49:26 +0000
Date: Tue, 5 Aug 2025 09:49:15 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 03/11] drm/xe/configfs: Destroy xe_configfs.su_mutex
 on exit/error
Message-ID: <4pacx7s4qu4u22zmx3jzm3zdlfr5tz4pj2cpmr5v6blq7jrnrv@4habjzvitzl6>
References: <20250729114215.177586-1-michal.wajdeczko@intel.com>
 <20250729114215.177586-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250729114215.177586-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BN9P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c7942e-71c4-4491-2552-08ddd41e7fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jmzzJdUAXxsXf6J+77vx7XF+0SZ84nM4H0PKTr9CQZI9Xg9NczV+yF7Fb000?=
 =?us-ascii?Q?FOcp4s9wp8Y/fnDHM663/anApe/RsQb482UZLL9tjpphAP0+ruo06ep7lacV?=
 =?us-ascii?Q?88rd8ifRl/Agi65uw4O5BzsPhX36oTyQpOUZOsjOgmUwuLMQ6Od9oa1PO10z?=
 =?us-ascii?Q?nVSqkS4yJ2hPcz+HQ+Jy7GVzkdbrqdjVqWNfNAEg5eRVoxnfAPCfc0YFt8GP?=
 =?us-ascii?Q?zl6jTeuSjUncPhNZYYaxgBs7KuXoQTUumqxdeYrt9tdCR3ulBCUYJSxqckSi?=
 =?us-ascii?Q?uHfwZqCVev4lgIFp386at6Ny5+QjLVcNR+5iCWdNvh2U7eBoArfDzjyqXTnB?=
 =?us-ascii?Q?lZznwNYl/TskcyaxZ0p9nZm3mtyEsn0v20qjk0PM3Q+iT9TP59FWXoB5LUto?=
 =?us-ascii?Q?CSlYF9bWJ6PgjYBUkhsu8PLJU0Kplj/VcUhxmxnykvCrrtWXpc6+vbs6H4Hm?=
 =?us-ascii?Q?4yG6nP/tKFL/dt4KRpeynT6Puif2RITA9DLa9mCWI1z67hFp8etac+MTX7MD?=
 =?us-ascii?Q?rmRlUo4fkBjQ3aSQRNF9wgz2oeWZflhyhRB2NXlKwcv3N9e9vcJsBsIfjYsF?=
 =?us-ascii?Q?kND28dbV23PrMZ1tX96A9veY5i1IpSVovm0sCwWHLcsm6pLJIa3d8v2h6uah?=
 =?us-ascii?Q?WIVNO8fvBAI7doTcpuH/eFYNSUp0o/IYlj+55+corpgrEAATJaZk0f1HmxaU?=
 =?us-ascii?Q?RudbTc/ga0I31yY0yKaaFRwxQttDLgSZM/jwcxOVHZNm92AfyztRKIXCZu2p?=
 =?us-ascii?Q?6yS9Ih/W6HX6nzZMWvcYTQQdXeeb5H7q1pj4vFiragNPYOyB49XG40shTQqy?=
 =?us-ascii?Q?EU2ozHpAJiXo+w9OkLRCOYqUUhPsFmYYNBA2Q768Sb+T938qLepqGWuUakBS?=
 =?us-ascii?Q?WXos4MGLsRNeSfiDAi6UdwEhs0wnYSDLkpQ5hYFTkax/yCchZCZgUjb0AHLC?=
 =?us-ascii?Q?SkEDQnBz9UTBUEgJms3b1Er0zPvc5UhRm+6rHpsrP9MgRmCJOTJjEeMwq8Fm?=
 =?us-ascii?Q?Vsj91eEjiF3ZVugBgkOcUyUPlax0SB5/QomwyObBaeLD/NmacRjcWo6uIsAS?=
 =?us-ascii?Q?lQprK0qZ/F0ZZU1120DNT/rI8jHynMYfYr2Pi+4LbsCL9XeaFbK48fHzyopL?=
 =?us-ascii?Q?orl4D6AYTEVu44OOynHC24YI2f7X06QPbhnXOvVtngf0yRLEYjc7JSJ8Ssgj?=
 =?us-ascii?Q?XiRLY0/U8yx1MnYxra/V2WL8S3DAAzHTji7su9tiBMr9MdOTm5kqtrb5rRJA?=
 =?us-ascii?Q?E/GPTe+ZqCqAGqJfxfHHnwhXw0VQI30lcpfBFS0rfMXlAzAuJofTErfkvc6b?=
 =?us-ascii?Q?42sRuA5MAMDdmY3aWeqcLvVY3dxgik67Cp1TIN4uk5Ne+HXEWJtGCzojuapD?=
 =?us-ascii?Q?YJPRZa3bCJH152iFlL0bHSlZaCCm1NjdJL8t+vi51blxYlJ05baKUpYXRjO0?=
 =?us-ascii?Q?jUwIXfiGZHw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l/HjjhoAPUZnZzjBFO9hjVCr5VDbMS3S3wiKlhJ5Mjl1nlJx3SfK7oy7F2W/?=
 =?us-ascii?Q?Sq1Sjb7d1zHmg+VZwcgFHrIxfCZbB57eIQBvO4dzG5yb8pT8Im+IvccCQTDy?=
 =?us-ascii?Q?iYHQ4RwQ0+QzN6mfEsQnkyIpP7ZOaBltz9j6DSHNJzTMYQu3d1QF3sbrKlD9?=
 =?us-ascii?Q?EzKwWExfMrKlxug8z3MiKcUeSahCETSvNVdcHtofvT9ieaxzH5K60Cy3ejzg?=
 =?us-ascii?Q?a7qaaS6w/hAG2W3zj0UXmmqK3CBFuDEXqFEOxhRCwqUYZsu/8PKZhwIirwwD?=
 =?us-ascii?Q?YFrkCA7rUo5pwivezG9hw5VWzeM3ZB3D7HuVErFnEFSs5Iw3uNn1h2jeyg6P?=
 =?us-ascii?Q?jBNBpZRaAYan4kMLtZeQ7czQpDRCPBrEnmY0qHqF9XjqkH+Yk11D02jkN3NP?=
 =?us-ascii?Q?zUVnX51400wSwlqof3Pbqx8DKPTsDXfu6sY1BZ+Sl1Em3N570RZXpWWWFKof?=
 =?us-ascii?Q?DfSZ23j6RBkNmQOJGhkJGkOapqbdEJhKdNqA9YxfN1Tag4w+4odO5VcNE/9o?=
 =?us-ascii?Q?5HQ3XZZhcNslXYnV4X8p/WypVrlWfEvXbVdbsoRbUfEDYlyKVFdvJQQiI6ek?=
 =?us-ascii?Q?5SThFc89QqNgtEX5FoP5mwLj91v58sPnfTBgpV6PXWGQKvzsSwTRrdCxnOLk?=
 =?us-ascii?Q?H4ioey+hPhmnKl1mU+MnFYtWrKOXOKYq3chxH5tPsHcZ5F+/1kdZ1v4NLC2S?=
 =?us-ascii?Q?qOBJWLDopl4NCaGcnLwXuMa+bduOp5efk+XnNNMUDZIXg6boDl6jsK6igVzz?=
 =?us-ascii?Q?UfONGwy70I65OoO0O44N7ArSP4aCxEmQBSH5UplKw6T1t2zkzhb/hYVfqAxO?=
 =?us-ascii?Q?wwD3nkzld9X92lvZLVUkrkqWygMU+kmJXXRA7P15oGwdzkG7IpBcSW6qvEdH?=
 =?us-ascii?Q?6r6aueWIwACX2t27sj6fRW28CdDw5dIkmujMAtbldK2jj7ghLug3NsS3jpdO?=
 =?us-ascii?Q?8hp5yNGZFHNJbi5/xZcB17JA442TakRX55KehbFZ1/cyb0857h+76IJlzaXc?=
 =?us-ascii?Q?GHk7/i35oa1ercoB9LXvUqQrTvOpriOl/lOX8oW2qHQbTeh0tY68/NaP3/0K?=
 =?us-ascii?Q?qCqrYvB4IMTEWnKGB0JPkNFE44TkovYHCwDuvdiuDERjmzIi399T2XQ4T0HL?=
 =?us-ascii?Q?op08LkjZvB+sqRSZQR2/zY2uqFrG/ou01u7h28ESzVNDnYSigzn9oYCgrKAb?=
 =?us-ascii?Q?+owDL677oGZG0EBhOD/ZtKx/Z7hPBdxuWXQL310njAhYeZkJEBDJdCqqR5ac?=
 =?us-ascii?Q?VkujEmSvxsJ2L8zCDduy7YmDHW3YTnZPXi1Kf3owFG91qB1tiTJupqoVTEEH?=
 =?us-ascii?Q?WKlbaqcW/Hh/Crf4VVQZUpEI2FKsCltMZpUP2J23jHPqqCRzwbBLl7uhBm1J?=
 =?us-ascii?Q?6dV3Fic5O8WuF/R4vG9qSkBYFtjcm4oI6O1Pvoxw1a6Ipq+CnkeYI9nyRTci?=
 =?us-ascii?Q?tzkfH1fKI8uzuMz5oBHnoGaBEYKbgxzcgTd0NcKKmOS94cAhamgstFV2ZK5g?=
 =?us-ascii?Q?RgN2r6izQ5389wyfJ/nNkPJeuUgufVLu0NffPt6BYvcvjaWoMVzRuPcCSiqy?=
 =?us-ascii?Q?Yn8Wb0v1rl5isaFtWlUEqHUianHLiqvqOawf/t2s/GoVhhBZhJvz9o7TNbce?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c7942e-71c4-4491-2552-08ddd41e7fd9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 12:49:22.0446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kT80gYgfIBG1CODldhuBNdAl0T5UiCnNkTRGd2n9VZ5WX+zra7Jf6edz8k8xXpSSBJCAcZG+nYLmnlFROpJPZK6rDQQLUVpm+ZIhUGu8SBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6193
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

On Tue, Jul 29, 2025 at 01:42:07PM +0200, Michal Wajdeczko wrote:
>While mutex_destroy() is NOP when CONFIG_DEBUG_MUTEXES is not
>enabled, we should still call it.
>
>While around, drop a traling line.

s/traling/trailing/, which can be fixed while merging.


>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>v2: remove pr_err in separate patch (Rodrigo)
>---
> drivers/gpu/drm/xe/xe_configfs.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 36e2b45b305f..56fbf4c1c37f 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -401,6 +401,7 @@ int __init xe_configfs_init(void)
> 	if (ret) {
> 		pr_err("Error %d while registering %s subsystem\n",
> 		       ret, root->cg_item.ci_namebuf);
>+		mutex_destroy(&xe_configfs.su_mutex);
> 		return ret;
> 	}
>
>@@ -410,5 +411,5 @@ int __init xe_configfs_init(void)
> void __exit xe_configfs_exit(void)
> {
> 	configfs_unregister_subsystem(&xe_configfs);
>+	mutex_destroy(&xe_configfs.su_mutex);
> }
>-
>-- 
>2.47.1
>
