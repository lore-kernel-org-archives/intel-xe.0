Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB68ACDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 16:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21F810E624;
	Fri, 13 Oct 2023 16:46:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5955810E624
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697215577; x=1728751577;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8ttgi0ZVA3eMpSF4+zYA6DCZNx5IpCzDJke+5XkU9Ak=;
 b=oGTYp5grUl1vKDZIM5Tu8I3UXxJBPzq8QY+zsww8/eUW4BH8do8JFXXp
 eDSffdt2XtDa5vlvnRDKVd01S3IQNekXWhIdrONfimECQXI75FjheDbSO
 r531kHv/BImhoukoH9hBM2TiQrvsZQpnIS9i8iyUmmyrSy2+iZ+UjKF05
 xjO3G/n1GfHdT3F975foUXvCvqYlvOdXsmLl7rvX0NnLqJKHVhMcmOfA2
 cjMFPFouQhnn6L1rw/admdMVG6V+LsPK6uU0Grj2LFOcFYLpLXSEbhMmr
 fphaCfuKS30JKOJ4UJWUlYooy7S704aCfQ0b+2uRJC/OhxO8a7x7FMYT2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385059707"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="385059707"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 09:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871149805"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="871149805"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 09:46:16 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 09:46:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 09:46:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 09:46:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPVv889razxUvHxaXJfl+PyD2lxVsImXskOh0BJrrViV645MPW4aDp7uWKKoOXdKOkhqKFMrTNG3iX9EnVwkjcC/pm3bhnnOVdOGdTacrMPV35qjRN/TRtK8iOIzWUhVAm4u2mK6N7t4W1GyYzcC6nLjXaPWNLKUrtwlHWQeSwVJMOGVNgzOf9fsSpU8DnJRjMlPsQ2bn2pjYazCb5Brt/20WnizuUqJ3mKzCP9DsKlt6y8JmJeQNk3mVu0EV1W2ceY+ymyBEA1W2p36pCJR1rmfVERXsith4FDN3pJoGpGHIa1ZseYMjpWiznugRCD33K+CzlLkkvYXoNc0ATc5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSvtd9oj5Qa4Q/wI4DgXmUZE1Z53FEjBNEuAQoLSjjw=;
 b=IXLpSS99pqRXEMKtEwvly61n7ebcC5DNId8vA+TytqXNQ0IKOmpSYq4SLG5KzBYvHJRDz1/FxJ2nD2IJYaZPVqAlpZye64/HS+Lsyn3hzJOoVoBSsGIZwpi1QZv+r9ib9Gx6V9MwJzGAILdYSKhUBbYGK8FixAPbAgNgpQd2NouemCSLpNnv73VU4fVeM567dffj7J4HpGXGDv+N4/NTuQoqAafgtqCC22DYu9WMtkekgtxLTHp2FETnR4ZMu/nEh4LLbHG2nzK5qYOvfwHA1PIf/RCC6ET9vydEWBwezoCnSZcaNt/ABx+bnDucohdgZEWPUqP2rsVxaIdWFf1kpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 16:46:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 16:46:13 +0000
Date: Fri, 13 Oct 2023 11:46:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <maarten.lankhorst@linux.intel.com>
Message-ID: <t7vmgosuher6tyz2vdjdfrnsleyzempabo7mer7gf4i433vybs@xlfjgcz6psl4>
References: <20231013151452.52457-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231013151452.52457-1-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fa54208-380e-4322-d139-08dbcc0be95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p4ypRvtQS9Qa5SF/85+vOHhHX442AEOFZFAR1WIOGmu/382p40zOHOfgbxpFhpThIc5E2Whjnq2VkTYROeOJpgGYXCMH72t8t+DQ5e+b5yoQN0ddGv76bEHOAKzFhZM+y1OyXiDMjoUf1WMl2hg9iEuQSpl82ocJ7HveerglhFBjfiIh1L8jWDlgFiNiKvan+2yGwQcG0wAD4uqJtKvYeFbEeV7lGJhhvFLwKo5TJAplknV5x31SK8Y2LDQS3YGfqZWG+GIyP7KqZy748pOCZQBCFY357YaLhCkzxUJQO4SQvfK4yePEuS7/x48hFwVNk+QJJbIgM9DbImbi8p2aZrnAQcKTLbbGfUscP19vG1ekoLQQfjrNnQnEYjbLjCAbjJ0K/FSN/IXo4eW3PleZ8jrTlnLotF7D7SqCnUpXeyG2gEq5Aez/Jc26WBRDDHYbOFLg0JcBrUFYAx1Ajsn1INtzy+N4WKuEXF8iHAW9BJKifbDpmF9YFjV6iJlUyE2c9gHNYsvMg6kBp2I2c8/TfCalg4U1y1XgPeJCKiq4rQVtko8J4AwXlYvsbmF9GHwj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6506007)(83380400001)(6512007)(9686003)(38100700002)(86362001)(33716001)(2906002)(66476007)(6486002)(4326008)(5660300002)(8936002)(26005)(8676002)(6916009)(66946007)(316002)(66556008)(41300700001)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lh1bKlC+rzH+6hNzWI0YzssM1+UkL3wI3W3JlDBhgOQDxxa0pGKlPzDzqxkG?=
 =?us-ascii?Q?bSwFyw+b6JFJDFJ9rLMi2XkSkicIWArJtxcw6dP8SkVWhLYr4KZsoPQ2c4+n?=
 =?us-ascii?Q?dYkNB/Z/kLUHNb9tO7aWlBkJ0Qx7kVynl/jq1rZrb6INa4xJ0YJHD1vlx1I1?=
 =?us-ascii?Q?bNpQ1bWM1c17fjPCjdnWAl4BWLwD299iZAJ2momVI+b+R/tZG8a5fyIfWl6g?=
 =?us-ascii?Q?RnfFKKqEBo8JsLUNr8XbflFjJ7AlNDzdIQH/W7JoogdGnzOQ63NoPiHy7Jn2?=
 =?us-ascii?Q?wSlk4ygq1NkR9qTcSDwiYEO4Ag0ddnngseNggYgOePk9YxukE/AsnhP39+r5?=
 =?us-ascii?Q?DmglNPUd/kdxSl+mnzr5r8rokFtFq5YoVAhcijF/c10tz3lS00QJpjDMTgi9?=
 =?us-ascii?Q?nSsMYUyoHCipBZYrLWZJwffu8W03TbidbhjeCIJl7WlMdRA9HhsxSj+yuSoN?=
 =?us-ascii?Q?nBuILJp1ppfRSDMP0UAIZm+KgtS64EdNUPkoBBNrrm9zyJIO6T4dd7t5yd+g?=
 =?us-ascii?Q?WNWNC7z/RBVas5m5GNCyjUA4YhjTjfIZfNlr1wqLGnyjFQH7Yn+frxjVm7z7?=
 =?us-ascii?Q?eJ3ldUTQvL3VJK99Su0vUcULZuL1G7MxVRTXyUVBz/mk4D++J0+8uhB4U1rz?=
 =?us-ascii?Q?gmavrDBZWSZd+OcWztYf3G6fAYlbNtd6o9dJdJNr0wzni9w1BgkS+CTTRkGd?=
 =?us-ascii?Q?WLqPc33O1N4lU/gBPmYwbsivMxRWzXhnF1jRBCb4S9uHUhWns0uwRQjeiMwE?=
 =?us-ascii?Q?lPFfPgPfjJmHn2DPf5CI8AgkzM9ggfUwkrFsIQSKgHVGPLppV3HSh5hlU3PF?=
 =?us-ascii?Q?Z5GnZ3LrYvRmih9XmV9EilQWCYy3635SmYgzDvMpWTrnuQvKl9yNHPHlH5ui?=
 =?us-ascii?Q?yRNRw0YBl6eat+vulJW2uXgqJlKkT3KdkEXZfNpWGT5s4wR1sCuz2vo6jO4j?=
 =?us-ascii?Q?B+hTNATlkoRBudLedL2YNJb1ZgSimhTIJKERyO1bFucjt34ixQXxy5dx0I77?=
 =?us-ascii?Q?XTqx324s9+fCgOZDyoI5cfOhyDMHC//9F/PP4kcfknqbI4BXnk53sNYGP1uU?=
 =?us-ascii?Q?XGozGgLTV+/y4xscxKnRGaZg8x1//8SqnP9tsueerHf4V0rPa5o2wNyiMnP1?=
 =?us-ascii?Q?7bda0kmGEVFW8INHTTc6kjamWjMvFcCVyCEgwUJiZCEZJQabz1zXN1kuEb/b?=
 =?us-ascii?Q?HSglqK5+Ghnc7xY+f/iDSdkevPx+vPhYxQ409UDthmGyyDoJw/s8BIWvoYbA?=
 =?us-ascii?Q?4Vqd/VzuPy2uhlANv/oZ7F1MTVaaLFxyi/2vuCcQ7ovkFJYAnnAOL2tpVEv5?=
 =?us-ascii?Q?1LcWIsUWaUkBihOVMMPVd92EFwwoXCBRhsa/9VyJOkIq+sphn8FRZpgyY5zM?=
 =?us-ascii?Q?a49iTHWDLbvOvaamKKNx78k4nKTFNHRrw134qLk4O2x/o8Vvyii/aKzHTfc2?=
 =?us-ascii?Q?m3Y3As4HBLrc1ElnNRivm8QsedHxH9O1goLIVUdnDbzCvxu81k9vNbCofmuc?=
 =?us-ascii?Q?9Qvtaadr8M5CUx5mhYPfPNLovz5ylHMHS0xYpThAnquemsWSpuD/PxYdcLRe?=
 =?us-ascii?Q?bPcOVjEb9IuCK/9JhgT0YrsARl8Gxy6kvfwBcT4tYqGmmC0xGMX6Qr5tFhi3?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa54208-380e-4322-d139-08dbcc0be95d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 16:46:13.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJRUmeAujwuKbsmwP2FHzACdw6n6ivSbkxr9nI5vuhA9SqRcQRse1+fyi91ufEEXRZEsFJ/XTSb04Bec4XEW4WSE56JoTCNiKr8Szfa/naI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/display: Handle NULL ggtt_vma
 unpinning.
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Oct 13, 2023 at 05:14:52PM +0200, Maarten Lankhorst wrote:
>From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
>Makes cursor patches work on xe. Probably best to commit to xe as well.
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>---
> drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>index 2c36e5032433..48d394e152d8 100644
>--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
>+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
>@@ -324,6 +324,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state)
>
> void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
> {
>-	__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
>+	if (old_plane_state->ggtt_vma)
>+		__xe_unpin_fb_vma(old_plane_state->ggtt_vma);
> 	old_plane_state->ggtt_vma = NULL;

any reason to deviate from what we do in the i915 side? There we use:

	vma = fetch_and_zero(&old_plane_state->ggtt_vma);
	if (vma)
		intel_unpin_fb_vma(vma, old_plane_state->flags);

Also... aren't we using or going to use DPT for MTL and above?

Lucas De Marchi

> }
>-- 
>2.40.1
>
