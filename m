Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E13EC77B7A
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 05:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566BA10E3A3;
	Wed, 17 May 2023 05:08:13 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A609110E3A4
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 05:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684300091; x=1715836091;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ahObLqcarCvRXVSBOaa+UTw2gyw/y3HRbgjIsmxOD4w=;
 b=JPAJFj5iWYmVL5594gEn5J7RX5m84SmzMsquhbie4bFI+mQG0mYUJmO1
 pUKxaqoVrTj3w+B5VupwVvKwSj8zXj525RdjwKpFo5nsmaCd8HnUjfPbT
 z+edTELCSsjFdK6LV2XV9Q5+xbiieaeyt1vBJnKZ7zZ8unaYT7tb92TBF
 4B/qsWqoyn53O/eBXGrk7ElrS09rZihH/YDvyfxLYTtUvJkcxKq7fJVJH
 Xqd21dsWJIl4tepRDRqOaHHOceGIH++w22IRO//5v3Jb1VDbd6ua87FNN
 RHlq7D1zK0lzYeh8XP4PJzrguDSDpOSDg1+E4i9Ipqffc6BDgEurK1FqL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="349164460"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="349164460"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 22:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="771335523"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="771335523"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 16 May 2023 22:08:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 22:08:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 22:08:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 22:08:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 22:08:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R+ePyFlrXUUlqvIMdNcCNzwmVM8EA22sgJMxnI6PF3FMCcSdkITGdRFdlVTPvUJLwm+1S5JIz4/peWYw9tVTZhfnS0GqOvKC7l1bOXj80ebXrkvWD5dGZR8QZC3/1lnrtFlAr0Cke1yCkh1RI1GCww5Zs5ma3ZgiwsKGT+214ZRAheYMpSmrVcNsaUlqS1g8o5RmntfSrpoP0U+VqhqONwVF4eMYqpSIGuTVB/jeuUB3+wH3/3x3iIzacoTADSpgovsVh12lTk7Sbe7UzeNBHp9CPWo7sedIXElSnJgDY2DffIPH6tY/aZ0+YEPp7f+aPAclPeykQHSXi6q7chwGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1S9i7bztOu80pkcDJ9TEBhb3qbVX3U3CTMBkQ4J5Zac=;
 b=SjTFg/3/UW05aSV4ofQdTv6T9II5zRsIzH1H2DJovsL4O1hHdTgaDWvdZBpn9r1DrtZL3kYO+7DdDhubvHxSwH64NZS/My96UCQsnGmKmQZsMrO9Q3AB/jqzrZHnm+HuAJdD9b9CO7IMcEZhuQUnQlh7v564MxZiWoD4F6SSPjZsn4dwF4N0Il2ptBPBXEQpiK8iGltozyeqzJCwftkWmQPMBN08Bn7VFroOHqsdTWsWyexsuKj02IHFGdf9cqHz+rLSexIaYTb1X8a4zSXPbexiHoV8OP4a6CdDkP20IO8FjyrYAH77oKrugLVd64R4qSzGGLDiTZJ96MWoCykJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6233.namprd11.prod.outlook.com (2603:10b6:930:26::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 05:08:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6387.033; Wed, 17 May 2023
 05:08:02 +0000
Date: Tue, 16 May 2023 22:07:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <cpr7cy7yvpjil2ejmi55ewtlfme5vt7by4x26zdi6a4jhbxa5x@kc2vd3mmuivj>
X-Patchwork-Hint: comment
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
 <20230511034722.1929038-10-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230511034722.1929038-10-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 1177bad7-9f4a-4677-10f4-08db5694b0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hlniib58K7NmrVtoTr3m8M1pqvYvnuYKu6x+r8F1QDlvsD1o41bPnfM+XsxU6bmG/CqNkwfPDetuUlBx2AXRCzyijL+VeMIELsYzetK835s84zMXBz4X0r7f+UGnG/IdZfdB9QFmWpSbss9h8va1JitjoyvGub17RMDRqpdQTEM8MXkZg5C+EvuMBSWZvbdnW33g8rnhYtccniZZ3A1Mdr2ybEu33ZRzrsjehuv3XMSe7uYBNeZUXiTkqKRnzSYYvZme4SUDGD5HQDGmfQ101rDi54WjliCp6FaD+OE/m+2/3ufj5rzRTKvrUAFj0VdGw+UCsVEXXDEPMVxnhtMSbIoAx4B9cPCC26ClFhwbxmRzBEbZeyJwZRFiOMH4PF39ihE/DQw//hal8gSIbrdvEpV3Iwbix7o4zTm1wA6MCuH/XeewUbs1tMywNPjGWLbUKpSY5hW+esbv3432RKwrad02Gb03e2QvJxjznMBKBG7aJBKnbd72gb+D9oFDwn3KQeU2IAW6bRVcXYT7wuJ9JamCnYRaaVv75Yyv7MRG/UGC3zKNZteuy2CE4L4cEXhR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(6486002)(4326008)(6636002)(66946007)(66476007)(478600001)(66556008)(316002)(86362001)(83380400001)(6506007)(26005)(186003)(9686003)(6512007)(8936002)(6862004)(5660300002)(41300700001)(8676002)(2906002)(33716001)(82960400001)(38100700002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HydWincWJ3z+A8CwxUlcwMihl4wyfy9c4EsDm3qEJ663l3lZDGGNaFWp19SG?=
 =?us-ascii?Q?UgRKySqGTXwJAg2U9bWvtUG1agUD9b7a8pakKY+NyICXYXzUrX9KpH0A9WR/?=
 =?us-ascii?Q?4sb9uZzQDcdwpz/3dGyRhumc74xBuNae3JPCSmjiXoyf1Uyh5fpg7k/xdvTD?=
 =?us-ascii?Q?xXJQJVYlFnf2KJNTZjEbby8TdDopWySAtxASAoSiywwPq7UPMyNVQlAVjAwA?=
 =?us-ascii?Q?+MRydH8CkeP7+2dD4KttRKpYSql+eQAGjfeXk8nyXCwPh/rbThr+EjVtpn9W?=
 =?us-ascii?Q?IFfPa8iWufUHW4qx4EYNAwPhl9ixA3A9AEKcrOIlK65zmvpkb1/hNIW20Lhq?=
 =?us-ascii?Q?BwEyzUUShsvPfzug3GzCnRsg275w7ur5JQ+HZYcxER3czx6cO42llbiSxzdP?=
 =?us-ascii?Q?bmGYE/lrvikWfEThAGpTcsnWUWDYE9baCNDXtXyXxJDz3vYAaexhNdyVseNp?=
 =?us-ascii?Q?uFmDQFo4J/2NTZIhxVmQuBzH3jyGwSZi/vn/r5i1UHS+DvPXNHlh5iCRNgLe?=
 =?us-ascii?Q?CqSct2szNZmGMBcY5lhNNNaTAMEJ0wo6qj/lXByxGLzJIez30ZBcL6B3oasb?=
 =?us-ascii?Q?3YcgoKeCZGPwqvCKroqdSee6jHzVXZEAQq0loaAsBN93WOqlrbwzJpQ53DfW?=
 =?us-ascii?Q?wiK8TOaHg8MlPAU0DDXwkp0lf7rrFR07CK01dteWTtluLruFxaSWmj3e6hIr?=
 =?us-ascii?Q?cDicSZyhUVf9yHR00uYMGdTT+mYebtxd24/3TV+IxWjlVC8LOEU+9DhEn2Q/?=
 =?us-ascii?Q?S3mpU5J19RZo/pEpox01CKHtVkKIUplEH+fNrnFHRCLYpAPq1G2gaixKE4ax?=
 =?us-ascii?Q?d8fvgViOMHkABkxcIIhsRPLzk6GvGKDh0pzMiABEEkO/WVt7bvf8SyjokgGF?=
 =?us-ascii?Q?cTXWvIJ/qJPe+Eheg1EyBFZ0Z0+H9nNs/qi/OhlIUmb/IrbReSAcWc4NjbVS?=
 =?us-ascii?Q?gfGsu2d0/Y3zK+VLNNVjHBnbRqSWd55nbLVX8B9RP/TQn6EHoWsieTDsl/rz?=
 =?us-ascii?Q?dlZBQ2tQZX77odnOPcKYUxTDiQLkR/0EEE9bS9fyR78LJFQ+cNNKHSBx30/M?=
 =?us-ascii?Q?YRZwzG2VfH9dND7pF2hvk0o5yfEUOXeNZZS76DXd91MKZCJnaCBIK+3x9quP?=
 =?us-ascii?Q?cFBGKixCMqNvb6QeXVxq8ATAPix8o2VOL46TpgXuaQ5VQwdddsgTuutP+aJ2?=
 =?us-ascii?Q?jb45a6PIJc9/3biwYgVtDimeTtrbALgzAqtqvH0erOPQ/IDWFqGsXt/HRWIM?=
 =?us-ascii?Q?h69bz5XDeQg/LmQxUxSxNd/1KIvPtc0kygfRxYbfjUc72SvNQF1enf62DcOL?=
 =?us-ascii?Q?zbkjYwxx4yTwkf/bc4cY9UWU5RjtniVZ7M4WAN+5E2m/8OhvoOzyBKlJhqoY?=
 =?us-ascii?Q?un66rN4yna8xpSlvOUi4WFrFEJQ9nLk/qzn+zxxYW+fu2OB8RXlbh7yCJlHI?=
 =?us-ascii?Q?Y70NJWZBtiUDam/rrEqn5nc8k6728lRN+EaKylL7BicFP5RDqU5XHvd1wNUk?=
 =?us-ascii?Q?HxWQt7JY/tztC7awXbCyzNddZHm5Te1GucFkWpDJOO/eREXL31Bp2XEJNlcR?=
 =?us-ascii?Q?r50bCWofPmCGEChP8mJmKj19FS7yQZ2n0rj8X0WFEs64mUfN8Q85mJ06/HiU?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1177bad7-9f4a-4677-10f4-08db5694b0da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 05:08:02.7063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoB5O5a9W3BWGuW5ZkxsrFUKA+8yUa+k/TUbfRogr1vkOSlETECzeqDK6XgDZU8f0eZJ3FpR7pR56Y/wt2NTJzdMIvQnkWXUAYlcUEnUbso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6233
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/26] drm/xe: Clarify 'gt' retrieval for
 primary tile
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

On Wed, May 10, 2023 at 08:47:05PM -0700, Matt Roper wrote:
>There are a bunch of places in the driver where we need to perform
>non-GT MMIO against the platform's primary tile (display code, top-level
>interrupt enable/disable, driver initialization, etc.).  Rename
>'to_gt()' to 'xe_primary_mmio_gt()' to clarify that we're trying to get
>a primary MMIO handle for these top-level operations.
>
>In the future we need to move away from xe_gt as the target for MMIO
>operations (most of which are completely unrelated to GT).
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h | 2 +-
> drivers/gpu/drm/xe/xe_device.c                        | 2 +-
> drivers/gpu/drm/xe/xe_device.h                        | 9 +++++++--
> drivers/gpu/drm/xe/xe_irq.c                           | 6 +++---
> drivers/gpu/drm/xe/xe_mmio.c                          | 8 ++++----
> drivers/gpu/drm/xe/xe_query.c                         | 2 +-
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c                | 4 ++--
> 7 files changed, 19 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>index 14f195fe275d..6eff72311773 100644
>--- a/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>+++ b/drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h
>@@ -14,7 +14,7 @@ static inline struct xe_gt *__fake_uncore_to_gt(struct fake_uncore *uncore)
> {
> 	struct xe_device *xe = container_of(uncore, struct xe_device, uncore);
>
>-	return to_gt(xe);
>+	return xe_primary_mmio_gt(xe);

nit: this contrasts with the name chosen in the first patch:
xe_device_get_root_tile(). I think it would be good to be consistent.

xe_primary_mmio_gt(xe)
xe_root_tile(xe)
?

xe_device_get_primary_mmio_gt(xe)
xe_device_get_root_tile(xe)
?

The latter seems a bit too long for me.

Maybe also consolidate on primary vs root?

> }
>
> static inline u32 intel_uncore_read(struct fake_uncore *uncore,
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 038074a90584..c93c8895862f 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -397,7 +397,7 @@ static void device_kill_persistent_engines(struct xe_device *xe,
>
> void xe_device_wmb(struct xe_device *xe)
> {
>-	struct xe_gt *gt = xe_device_get_gt(xe, 0);
>+	struct xe_gt *gt = xe_primary_mmio_gt(xe);
>
> 	wmb();
> 	if (IS_DGFX(xe))
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index 745dbb16d417..fc2655484dfd 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -66,9 +66,14 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> }
>
> /*
>- * FIXME: Placeholder until multi-gt lands. Once that lands, kill this function.
>+ * Provide a GT structure suitable for performing non-GT MMIO operations against
>+ * the primary tile.  Primarily intended for early tile initialization, display
>+ * handling, top-most interrupt enable/disable, etc.
>+ *
>+ * FIXME: Fix the driver design so that 'gt' isn't the target of all MMIO
>+ * operations.

again... not sure I agree with the statement here as we may fall into a
situation that it's harder to figure out what should be used for what
mmio. I may need to get used to this after looking at the final result.

Lucas De Marchi
