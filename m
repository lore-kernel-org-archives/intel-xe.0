Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D19E67801
	for <intel-xe@archiver.kernel.org>; Mon, 22 Dec 2025 16:54:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116DB10E08E;
	Mon, 22 Dec 2025 16:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNde1SJ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874E110E08E
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Dec 2025 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766422490; x=1797958490;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=f0YmdB5mDZO6NL+3dWOQSof5YD50s5BOCT3Bkw6t8FU=;
 b=NNde1SJ/MKTpemSOfuwYWcg+pd/iV3hNGKWc8OCAOeVFqkgzCJKjOa1E
 EiJarp1l2fils0xOqasPjuf17XH6cFO7QP9i1DPpvtx+BFdb+/biFSJCp
 WllCcK426L8nAh+IxxAR+lJPr9FfigTaL1rL+QfIxhx2gIlOnZ/77gnvE
 zgdHtSGJh79aTB80tiDNMteAnXtBeR+FlAu5FthcFQQPGyFIQ61nEn+ae
 hYffY2o1rehv+y6nuPfgacB71/KoBV38xlpS1ZXjW2MXAQQ74FVQrKaBe
 pbXHvUAXn1Fb3OSLyUJgdnyLp5Iu/oeJUeqBCDiTSxDVQe8E7aX0S9cyl w==;
X-CSE-ConnectionGUID: Trr4rKo/QCqKit2dWOISmw==
X-CSE-MsgGUID: 69Ego3tLQ+eEgXMJBIM42g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85862132"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="85862132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 08:54:50 -0800
X-CSE-ConnectionGUID: TiGzIWVdR2GcgtPY+HEEIQ==
X-CSE-MsgGUID: JTH14enHQiGYF/hFlHtV+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208";a="200065132"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 08:54:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 08:54:49 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 08:54:49 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 08:54:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R64tLJBvzI88LmnCZDD7E1L3kH1wdAhms98ONaAOi6v/sa98EMta1woP7rXNO9rfvWxBQ1mSHuQoi8p5zQ5doe7GX2jX9DwLtNbyRfaflP7r1+7sKegb42GhWgJef5ATCoDOR3pvmOgrYJeG4O76eeylUiaL59BHggxgLHaS/X0ZevXjMFGpsdlZz4CjFBX1ZnCdYlOws+e5BkgUJOd6UjBSuIZQo6rDyxg1smLNmN4t71hC6ynJGAi5O2mv96bnl5io2DmwNaXUjhIlBLOYEma5aEel8SjwPtsIRzYlVf9WTePDczZidTx82usQwny2oxytZT/S2v9sBvlKuAjLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xl1pNNXDSqntypITK8lRB8LuZAqM4Fzyy9a7dFEd5Ro=;
 b=ZWRdiY5787y+aCTcHB6ryR6dkcltt8zlbtGzJUm9o/N8EJq2n8bgpxqrZDyujhdLmNHrj9hA7iJ/fVLzHwOaMnmgEWITZ4dGD42rFwTzqi9UROo7/A/9blOVhQhiu5zDbee6c0w7Ky1KG8x6YdchJqirlL2fG6erGWjyVK4gLcRRergekpysLzY6TN4XVmyxjsMxvBQAsptZP2TSUB01LpW34YxQqVdIBjpuTgE7f7v6HNTPu9+0LBO2IIoOcAQ1pfUtl5dHcO5n0vDamUuYUZOBluRWwZCg5cwpy4jTbe4gtOKhwN/sFFs3ZT+Dgg9w6xc5j6xOZrwzYfW9/UKddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 16:54:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 16:54:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Calvin Owens <calvin@wbinvd.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [CI] drm/xe: Don't use absolute path in generated header comment
Date: Mon, 22 Dec 2025 11:54:42 -0500
Message-ID: <20251222165441.516102-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0058.namprd11.prod.outlook.com
 (2603:10b6:a03:80::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA0PR11MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: f2fe1c15-3c5e-4b14-5f70-08de417ad02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TPFrnQQdKL13bo+3jAbFS7iDYeaHy3LKe3ESrR6EcVuZp56bU2zATkEW2oDH?=
 =?us-ascii?Q?zBjqqjCo3KHcdk+RmEPYcJ0m58AN4n0RtXmwLOW+ONfevlFqwNNwV+HrdIIu?=
 =?us-ascii?Q?LhK4aUk3TXESyncQ70MU0F1SVy9c48kSww6yFXtXT+lcR9YsG1zvJcD9gSXU?=
 =?us-ascii?Q?XU50EaQHZEqb8jNfot/Lpuir2zs+kSjm50hNrB4bAvAJvYj/AeyYdbuQztgW?=
 =?us-ascii?Q?M9R7zoiw306tu9wDbRl2JBiXwmj145XiixDxdwrd5qSpoPJde+VSfX0PV9A1?=
 =?us-ascii?Q?ukS79oiRB1t2C/BLmNEx1DpID9S3tjbLzyixWguT1EFv2+mk0bZtn+DoWkNO?=
 =?us-ascii?Q?rtwKaquHXZnUHtUVaCdIWXJIhj78ettiAq425/zkbrsDnPxNeXpCmlC3qYj6?=
 =?us-ascii?Q?bVj7zU9AD/O03tthlTn9S7JpFhG1iQ+3e6UP55csPOYFGz0YuKwcW1rpeRoY?=
 =?us-ascii?Q?d3hTgH6x4eDxaYKruLBuW+iU6i95M8Ef4K3C+2z5aOcP9+f6W651JOvFWyLG?=
 =?us-ascii?Q?3PzYuf0H9HoH0D00TY0f4mjQyF4CQ+kKQGvGXAbzf8B0hRfAiTO2XdwiHXHv?=
 =?us-ascii?Q?mnYBXCweb2i4VWXZaXJUhdVgw5sy9su5K5S/VGDqtrYl32srcXkIVy2KYwku?=
 =?us-ascii?Q?/iQDHqgFIPxs6a4HyfkhLaSu+1z0kUKVnKASv9rSk8KxqGLIzE6L64lTbGRB?=
 =?us-ascii?Q?B93YDI5VASluDGqujbqeSR8KiTq7B3YmC/aOtrEzyU7b1cRWA1jMAJpB3H9z?=
 =?us-ascii?Q?6Noz5HaQwTO6KNSj0obt7n95AYCAuHj+CR7asKizkzQRxxGFxoAwEJTdumX2?=
 =?us-ascii?Q?cQfhoOOm5aVWWVwgR5kMoDezWy0g3DD7i7eUE6+oW/7fTKKIKRqEzhOasv/W?=
 =?us-ascii?Q?LU88DeEv6kAe3EjlOclvN0pkxS5zhfWORHlJy30NCd3MpNqhjQHq7gzBuYRc?=
 =?us-ascii?Q?E9p0xCkjTnhUTTOlZLAIaW5qA/zG7nFBlpoWKWUqCyeyqZYs/ClgVC8UfrSf?=
 =?us-ascii?Q?5nTCSnPPIXpYBGTQM8irkJs/38rgb1omKPXX3+ZwME6Lp+RuLpIyCwqedp/e?=
 =?us-ascii?Q?RibdkpDmTuHvrGY8Yu+22VRp3ws2ibQGWjDhA4IUuVzDD8dfxEWlFrJ/8zQy?=
 =?us-ascii?Q?aF+DZG8ALNanEhL62PnLX+6xDfPjxnnAzybZTu69GcLiavHnSLvFhTt/rLiS?=
 =?us-ascii?Q?cR8YsbM/VTEH20JWPZFzBxUkyyFsqU8Q54NulLilVRKpyP0nJEwMM7AXUjJh?=
 =?us-ascii?Q?AvcI0YHFfuELaY+YE+OBTLMLvZLEcr4aPNKqDkkdFY1Pi8fK5JbPsAlaeiUA?=
 =?us-ascii?Q?68H1eEouPIb4wGJC9m4cJ6HydRAQQKc6JB0o9ftKLERnh1cB/6YuzAsxE/R+?=
 =?us-ascii?Q?r2e655K70S2hQA96w+e4gGKme7Qq2oDDKGTr/qVw/9UhpKD3iV5OpgUVZy8j?=
 =?us-ascii?Q?oM4j9IdjjAoa3JzWbD7LZpatFNee07dy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pKWenbjAZWb8PLTwJHi1kn59BlkXpqTJAXWFZWzJ4FVQ1RsM79nguWYAKXCq?=
 =?us-ascii?Q?xINF+EcC326xpQTlcG0Xo/2JOqh/xuGzLqfNA5Do3xP98uzJRp19OW3RTapS?=
 =?us-ascii?Q?3QyniidyYlDNHdYdpy+GJGZsSfPiWf3pZ/TdRE9PanNY+y1P9w0YzlPv2YLB?=
 =?us-ascii?Q?LzE5D7+XjRP4k83Gpec0yrHG+yL4sSIRLXILVmQvc+onXWR0wxNoHNvV2xCa?=
 =?us-ascii?Q?o3KDhqSF/NrIAaDP7zvkRUHSfTgHsr9p9TJQ2ckJ+E+TOCUuGMxY39QSJ/jk?=
 =?us-ascii?Q?NcP5K08sX8pikjUpIw2shBFB6Y5SpArRMtWnD+0nGvsw4QOfshKdY9R/F4S7?=
 =?us-ascii?Q?EknnkLWgGHztjBR7i9muo/mt3HG5tuF6aowK90M1i0xr1omBy6WBckLuKF8h?=
 =?us-ascii?Q?JC51BqRiDJiieEVJGAAmuh+OSQKLi3G5zAxyIDEcY+FsiHhODr265HDYN45a?=
 =?us-ascii?Q?dIhU4lVgPTT4N2o+C71EgaYCF9dgGImppnnn//Yt78hyOvj9sNSeRqmvqgks?=
 =?us-ascii?Q?kkTscuV3O1/dGrTcGFbmRHDjQACm/wqTR06/peGHv0JRvXp/hE+cjpwgYM5u?=
 =?us-ascii?Q?M0HmWAUBUmXhV9yllrr0GbRBVDF/KHkHHuj7yuqjmeXfmKubcwUkPCLq9wps?=
 =?us-ascii?Q?oYmFveXZ7io+qXoV7GqQxPeFqXvQQz2mpZUAx0uQiSREVpZ6jZJq/OXkVu/h?=
 =?us-ascii?Q?y07KdfjZTnmnuK0StUssz6Qn3frHKKmwqQ4oj5JAR2eeVUDCxElGug8IKNJj?=
 =?us-ascii?Q?HKRcWrPVQWlQ/Ju6hciQ483oj+VdY4Y21OWdZ27rdVgNF7HvZyFWnD+I81fC?=
 =?us-ascii?Q?81BiOBTXqTeHtgiHNqo9pvfwfxaRwiBMgnnhYTZ4FtCUS7eZxrTwSrTXr365?=
 =?us-ascii?Q?Tc3Zd1rLkllkdjNe/oBuXERjA2UxUsvAJvjPcfoDPONQeSF92rVIukvL/jNo?=
 =?us-ascii?Q?1v/a4hbiLxo6BSP4SV0HCgZaPtvxnWM64ZkV+RtXAzJFSES0MyFWGHdvSGFH?=
 =?us-ascii?Q?owKIceNMfF/Jlr/FKwDqF3ACmVgL5nO6jbqthJYMg6hra5BZWcTGw3EfQNF7?=
 =?us-ascii?Q?pTtP3nJh/YsANlz0Bgg4NrgIaDoeKaFKtioYL08FNcpV8KTtdL5aWxwVVUns?=
 =?us-ascii?Q?5ps9KSHe7HWjlcWLNx0ibXTIc42yv0WnJKO1ypQIDoUOSDeZPlVI+B1klKYx?=
 =?us-ascii?Q?lOsRfC+5V1uPFQsg2K/8pUNlaYeN4NRPOD4wxZ0kn/A4hendWZ3qoeeRr1DB?=
 =?us-ascii?Q?MZuAojL6fwRCjaCXLQihYlMNnDcRRkBy746zziSkTa50ZZgCRd3CzlApdKIS?=
 =?us-ascii?Q?VZj83s4VPedI2+2yPOcX0lEvr4z7+BxVoIDsaRgO+C1F/Q6UV+Qc4TCZ8u5N?=
 =?us-ascii?Q?H9Y2DqW/Ps2K/ekSQhjzThcIx1e7NehfQF4pc65s/hwIS/TFPrYpGtqkeAmf?=
 =?us-ascii?Q?b8GbyYyil7UproeWbTZTHoto9oxIJREKweSTdMW8mjoE9KXWsIy1bsSWEvOy?=
 =?us-ascii?Q?vMKemOvNy2dgMIH9azvF2NEM8YcsNQfQIoN2dIeM9qNqNAF9A/gE4ezwU8K7?=
 =?us-ascii?Q?EjY//KGEuNKzMw2VZCCN2T058jC99JX2DCjxRVruNpoZFVV6WO5c9X7G+BFm?=
 =?us-ascii?Q?dRnAm0Qn2tUg3CTeVhNa8xaUYTHexZj//kPnlWry8CsYPS0yAUD0KV/qsIHR?=
 =?us-ascii?Q?kiuOJBpJaSi7KVkt8PtAhdyFYAITfjJq/Uxi7wxS3G4SwEoGBbMup9SWBd+g?=
 =?us-ascii?Q?jYAGS8kbEQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2fe1c15-3c5e-4b14-5f70-08de417ad02b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 16:54:46.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ih3grR1W2dC+MLtU2oFmm6iNkOFNmmjJXKkFbCVm/MfZS3rSvDQyrN45baSisdca/+S4pEpT04SyMRzBEbK6QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
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

From: Calvin Owens <calvin@wbinvd.org>

Building the XE driver through Yocto throws this QA warning:

    WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]
    WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package linux-stable-src contains reference to TMPDIR [buildpaths]

...because the comment at the top of the generated header contains the
absolute path to the rules file at build time:

    * This file was generated from rules: /home/calvinow/git/meta-house/build/tmp-house/work-shared/nuc14rvhu7/kernel-source/drivers/gpu/drm/xe/xe_device_wa_oob.rules

Fix this minor annoyance by putting the basename of the rules file in
the generated comment instead of the absolute path, so the generated
header contents no longer depend on the location of the kernel source.

Signed-off-by: Calvin Owens <calvin@wbinvd.org>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
index 247e41c1c48d..e7a50b1348b7 100644
--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
@@ -195,7 +195,8 @@ int main(int argc, const char *argv[])
 		}
 	}
 
-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
+	fprintf(args[ARGS_CHEADER].f, HEADER, xbasename(args[ARGS_INPUT].fn),
+		prefix, prefix);
 
 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
 		    args[ARGS_CHEADER].f, prefix);
-- 
2.51.1

