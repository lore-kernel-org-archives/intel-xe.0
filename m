Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC592C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 20:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4BC10E74B;
	Tue, 11 Feb 2025 20:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fe6PpVNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F46910E745
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739304601; x=1770840601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=JRK9LMt4MNBa0qqsdX8e2LnkaYP4mQVfFbQtkxJZxfA=;
 b=fe6PpVNbmps0j+Y9hp9Yu8G0/Q/9SbV3xbP6yUMxKe+l5XclwO4Yi3Pj
 27of3XX+OI9VynviFMNek1BXpCWONYTEin+WNvQrP50jrUsduPNWOodbw
 guVbq6yX26Kqg5ge5TwrDWgx13DpxVyY6fHOgmwj+MEq4L0ZGFnNMbtEe
 TLHhsn/fwv2pSPWa9cYAcsYwjkUqfbEJPTkTR0HePDK9IjCoWDZInQMD3
 Ae6ygImrBttA20lgdOyGd47yGVyRrpsYy5EsdH2g4F4iOOohPohQFizWf
 zyqi331W38G2NCbaD05QYRL9DcYYBqOa86WHODBPCi9AOh0pTD7BGna5p Q==;
X-CSE-ConnectionGUID: obe7EBBbSGm7KNoYb07Pgw==
X-CSE-MsgGUID: U1TOkyKbRJe3paK9MEcTyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="51335396"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="51335396"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 12:10:00 -0800
X-CSE-ConnectionGUID: Yx1YcB7ATMGGv/DO61Ul1Q==
X-CSE-MsgGUID: yGyMSasDQ/SBAo9ExTqILQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="112596401"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 12:10:00 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 12:09:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 12:09:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 12:09:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ni9cLk57RcDbSISp9ZSpKvqHEjFx6N/AwjsOLEurUEjGmLMzRIqPHmzU1Yx6/I0xHCDSADE8lTQX8aNPg5lTOrZgqwDGHE7qt2skS7T6o2vPVSs5FkhNyaKD44rqo3lH4pcV0ZyLbdxjxWTUxMQsdlr5e/1w/vVMYAtyYMNu6b39dhzUeCDfS1iypIhvUhXE4GSjtLGCkPxKCLr/NjO5IgvoyNMA1arlSmGwC08XZmDbnr423MCqqpyBXR31ZoLYOFP+yY7C/dLnLjgUYDUWTTaft9MAsZF0+dPc+YafP+3gwG9I17fo1uIPnlpyiv1/ru4ghWQqxXIJq89UOnaofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJCzUIl5l2q86GqWkFaKmSKpSyBzogjR9JWrt7MtMjA=;
 b=mOCddOj2wsV9A2Xp/7oJawuKorEDvyhFhWjQ1vxDRyjO1gqSb3ltL9mywAsgkUcDkxuijJYoYvAugYB53PUAxFz7qIxFM+yIa7A8cIxhVv2p/Zf7r0hxIXbEz5RRK4KLD6MtL0RRTzVV1OKLocSYierInkjmS35IeTYzQrEAlPn6Je9/6idzCkoWenFn2AlY69D6ZHYRR7SG3jciqWS1kLlxXk+llhkRwV97Uf9Kqm1F2DaHNGuQo3u/uqh5hVHfa4gOSeVk8hkxSG7Oh6K2BXna+JV0DyrbzUf3ImRtcsGRT6tsR/0eWlaj67xSDAzxwHSk/4wnmda/hFKBpDpOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 20:09:20 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 20:09:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/xe/guc_pc: Remove duplicated pc_start call
Date: Tue, 11 Feb 2025 15:09:11 -0500
Message-ID: <20250211200911.199213-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211200911.199213-1-rodrigo.vivi@intel.com>
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: c9105fce-74a3-40b1-e276-08dd4ad7f7fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GrRUGhXGepg6NuAEiHAn6wYXEPkGyXGr73xEKIcqBzo4hktpBjRzKUqcGJz1?=
 =?us-ascii?Q?lVK5k/6uR0lQisamOMTdHI4dpL2SmNiFo+IoUDKkw8wM7y8NjF0SOW3BnDQY?=
 =?us-ascii?Q?kvU0BANwlPIWJt7zP1e7UgCGofV0fewtEO4d0PbqwEw7dVVYpJRM3tYRjOQZ?=
 =?us-ascii?Q?HYzTrefCMmmpILr2gXvOCif3Xbid1HSJvxIG8tdwlAZbYS9/39rd+a0FVPtm?=
 =?us-ascii?Q?mB4N3yi7f0/R+/4dWXYBqMo9TXFPmcV5Sz9JEC2oQ5kUI3wYkFPpEZX3SVJO?=
 =?us-ascii?Q?9yZ7xcVnq65L2Yt64bn5s2lTWrBvsExDTVEEsEGMMEqicGyeVp7RausBfTbL?=
 =?us-ascii?Q?gBKs9hl1zsVvLVqEdzWqlzPEB2rps+9HOPaMOA9gbXJ39JGma0WC1e8ypJDf?=
 =?us-ascii?Q?REx/OLPR0NW+2areUm9Gja9Zrj2TTXg+Y8Uz+VDQB/h2KWwcD5DVdKlUjuKo?=
 =?us-ascii?Q?zu1GywEdsVJHp4ie6tbMxyrYsbmk+wPSWsiMFHOnEBGkAzA62Nrs8DYepvOD?=
 =?us-ascii?Q?fC9w4XnupN0P+yxsZTmKI5H9tC0RyVrv39NigssJ/LouS2jnmoRUZPZDYG9o?=
 =?us-ascii?Q?pr+zODpXQ4Xwhwz68gq5W0Cv5w+R46N0qAoEYYd9QDplhQANsPbu0HZOrxU/?=
 =?us-ascii?Q?s1AbOSp9HQakERQXzwt01UIjstJGMudwYEdP9gtI9zGju/LYrL08oB+efR28?=
 =?us-ascii?Q?qe4gEthATuCRzG87yui1JQrW1VnOU59pfBtTrTqSsLsX7cGk7iSmavdcJlaC?=
 =?us-ascii?Q?zY5V0/ifluXrnJlZzutqjP/jVLju4J5bEViuGaY0vj80xT/+fn9CgWiTUEZT?=
 =?us-ascii?Q?vRHQ8otYtgFsovQlCjL+BKqk97mxfBYXfo9V8yAjMlp3jeJ9N3WGOQ++1DFr?=
 =?us-ascii?Q?bkios2ci3fcGAgsmhbnOGaHs7OmyhG3o+TYh4l2Sgu/g96Z1STHTBpGSlIx1?=
 =?us-ascii?Q?y1UmjpriTSzDdKotelClaHjHE6bpDEqP6zlSuqwn6gqFRhfUmwdOalfx7OFV?=
 =?us-ascii?Q?ZN6oyxTag2+A2Bi5leFmienFaYN0Uq8FUbBoOxz3VITmehGZiy+v1Sf2UhID?=
 =?us-ascii?Q?1EwT0+aL1xUP6qSir1N3JIkX9D4ePIn537hV1i/RDusnxvCxK+IBZUdH2FiC?=
 =?us-ascii?Q?HmgmCCRkaq6T1N20WQyP2JpohQoiak6mvGTVOMNdqC2IYGeO6ZYKM+V1DcOG?=
 =?us-ascii?Q?1sd6l5FTEWBE9aKsJoekAVuNbGI0sCTVhMMJo4WRq+O3aBwiUfE6FEwMTT1h?=
 =?us-ascii?Q?Thhkpu/dVH0wVzMiGqDRf8CScn2t0DywzFFml+P4NYLrVkaNdCs8vor1z9TY?=
 =?us-ascii?Q?dvqe4IICOLLk08k0Z4LRaUNG2xWl/+P+X/g5sKyFmKIcAn2cSWDoT1UA/3OC?=
 =?us-ascii?Q?pWeiXjNPsKxKoDHWwe9a3WUR6Fp+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xXiTyh59XBRnP4agk0MwPZk0hQq0wXxAf0VWRF8BEbmGZLyECdo8jBznMTMj?=
 =?us-ascii?Q?7lzxMz51wW4km+rPo75wHgzzyKzvXgAbA4d9ZZzV9REg1knk/HfzApE/V4dP?=
 =?us-ascii?Q?SjcTsY9HnA+uhPrf3KdWXYwGO8x5YMbdd9AqJ+FNUgbgq2yKZ+Hr4U8bcEaY?=
 =?us-ascii?Q?QpZo6gEslIsp8/MhhLcResaD7qxPblNg8hdjt/p4bCylBB6QaeAGkvAJPexm?=
 =?us-ascii?Q?XFT5s28FfdDrB3ZWZlRv3fqanXyZ8eBZblGy20qIo6W+5R+heQNaMr4R/Lk9?=
 =?us-ascii?Q?cabBBWmV7AMyMAnPKJdGpS/KALRNN22RygIdHZwaa6wM/sSKtB+bsNGmSUcy?=
 =?us-ascii?Q?THUbiPlpr29g00BYgdpdMSdRp+q/6HurmifCTKt1ADSwtJ8l8B255PxNr2hi?=
 =?us-ascii?Q?e3a/GUG/huTXf2o1nP9cJDZrjms4NhVNllAXs4SJuWzRkgUG08B/2fBLXImv?=
 =?us-ascii?Q?IfYFfF2CoJLoxYLQO5suc/FHzY779arEqO3vUiqddWwGYiSgVdSkHukiMhL0?=
 =?us-ascii?Q?tMd/iZaCBEs8hl404nb2c9X2bah+3Jy4OM67tTm2izRlt38I7F/APd3eAjzy?=
 =?us-ascii?Q?Yi8+JteMVW12MP0VYY/bIAmuCz9rJ6ZDzijQY7wzPJKk47LBhLAx/s1r3kZT?=
 =?us-ascii?Q?4fgrFIi4+BIueJynd25tnEph0XyoP5R5Kg/KqGHbPf21c8nNErUYiTyRiNlp?=
 =?us-ascii?Q?8+1jYrWtYbZup7BD0stfe40BMnaghzNtSydoyJQwtFlYOPu5DJ/tedS838Vh?=
 =?us-ascii?Q?wjWrwtJX85LJFuMXtvfkZ1fNaZWYwkWOBbn6zft0+8bjx2kkxJVTfi7D9IBl?=
 =?us-ascii?Q?UsOcmEQTR1bxRjeH62uG+2MWoIGEegyskw4arUZRHgCcwgXl9efVL/Vtt7Tb?=
 =?us-ascii?Q?4DXRtCJtnEuUp7qS7ZIs+YLa5ySTrZzBmiBLlbgly6f6U8osC/B4WQYV4bwr?=
 =?us-ascii?Q?kkA9HlPrDGIGUAz4pMpOnF0aQaBB0kFlhcNAqJJyZxed0jJOX7IdoaSfp9ML?=
 =?us-ascii?Q?X/s+Fju3Y4n1pcRmfV/Incb539O3cY4LATKhi+L7FJB5rcJZn2cnsZXrWcIL?=
 =?us-ascii?Q?zu1e5wM/U1CZLH7TCJhgf9vrDTr++OCe9PTKWj+jX+LAMY5RzK/fUSs4MWHm?=
 =?us-ascii?Q?OKDHCQivXnZIZqa4ie5HT2WziQ+WkDmx0z8LPDUGj+6KbTU8Q+Z/I2GQTmNK?=
 =?us-ascii?Q?EsGzHyrNlE7dp4UqvIIIIHg3I7yql0PTmL6h/Z23Aavp5ONDTvaqujAsG2k+?=
 =?us-ascii?Q?4uKitxTeiZ4UG91KhB+OxOXyakiTKoSo5yZI98dno1g82x3rHtPcn6iFJnHh?=
 =?us-ascii?Q?5zJy7YMcm4vJDb9Rsije9GurVdvCvFZ5cJ5+xl0mXV1cLWV5ilBTgm95FUjV?=
 =?us-ascii?Q?FwwLyYczM7kH8+FHftDizUwO+rOt7nk2YuZUKRGsodQo6HUkdU2ec3o/oTGI?=
 =?us-ascii?Q?Seyub+nXJuvilUZBL9tlcQPQnXaDbX5bFcOt4eaF+Kv+hDdG+zPLroD4r5Pu?=
 =?us-ascii?Q?zIureZNbKD9HAF8hGai1CXv0haYs7kQTeEy8uFqlftT5VSqK4BW6b4jk0yT9?=
 =?us-ascii?Q?NtvUgiZx4KTPki4duQ8nQtJDMLWt/kWKk4wn7n/aII2VYmUJW26vKgwZw4mM?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9105fce-74a3-40b1-e276-08dd4ad7f7fb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 20:09:19.7596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll2Cy/xvbBvhL8HOBGn8rlAldZY6CnFRfr/A9G+VVQaGL5vSiJ14p7qVvJBy4iiIBQJxrC3HVjG01Te5aS0cNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

xe_guc_pc_start() was getting called from both
xe_uc_init_hw() and from xe_guc_start().

But both are called from do_gt_restart() and only
xe_uc_init_hw() is called at initialization.

So, let's remove the duplication in the regular gt_restart
path.

The only place where xe_guc_pc_start() won't get called now
is on the gt_reset failure path. However, if gt_reset has
failed, it is really unlikely that the PC start will work
or is desired.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1619c0a52db9..eaa035b25aa8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1491,14 +1491,6 @@ void xe_guc_stop(struct xe_guc *guc)
 
 int xe_guc_start(struct xe_guc *guc)
 {
-	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
-		int err;
-
-		err = xe_guc_pc_start(&guc->pc);
-		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
-			   ERR_PTR(err));
-	}
-
 	return xe_guc_submit_start(guc);
 }
 
-- 
2.48.1

