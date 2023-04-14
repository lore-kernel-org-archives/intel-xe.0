Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A12C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 21:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C79210E1FA;
	Fri, 14 Apr 2023 21:09:15 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D00D10E1F4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 21:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681506553; x=1713042553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=80qQdbY40onDAht7gOaFKBtcIY6G/Z3/R7E4BJe67fE=;
 b=FU8yJSiNy5pBPc70Ni9IGpzHWfCe+5SSffCm3tt0bB833WUHSWIEd0po
 Y/Hl7b1vHmSNaA4W7WGBA9NpRGsisPSmyVfII8dvyAJc37dmijV79D1XW
 vWW5nX39nIiFeFhzon+3ayH9Pi8JQ3/K0waLleG3FPlTTa1HOTqig+awE
 B2YLvbye4WkJuJBz/hQHVNhe35hUEldzMFt/XZgE3sZOXOszYtePVjdW2
 F1f9owdsaTPLqgTclOu54vmVMvsXWnSnxc6KMSRXiYPrUJZu1RQh2WmwI
 74ZW4P+A0IsPsBcmzVtdOpbcwfzm5X7kL6RXVL9UVRzHZOHM0p8JFADlN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324920388"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="324920388"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 14:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="720417588"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="720417588"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 14 Apr 2023 14:09:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 14:09:11 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 14:09:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 14:09:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 14:09:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMf166gxDkQYhNyggj+33lViHvW3Zu0vQ3KGX2+A0geg5JTjUh3O5kEM6qgNO0TUNB+RkjS48LMfEGyAURGOxGlmBQBcKCZ+V5s4GN+alP+BQQu7gW3Qc7+ahVgD3KAJ00CoaLPAW/JZhAicOZ+YLPH/lNgvHvcyme9fojNtcPa6YgCqdci6hqvBjtoN6EXq7VaU/y1WXWfHGDA+4fpFfTpekqjzBqTJjW8J/Zorhga42v403pQM0/uM4VdahefeLTbJ5DQBKtEoZ2xUCPlyseuVmdzctSnLoZEoZvmrYcp3zUJ5tTtxjLRnvoMf9iGP3d9YBvABF6qjMOGQvgoVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLORJp2kUfx4HnlF2HzO3BDFp5DhpawenkIAQpG5hxE=;
 b=hHJH0EvEf6Hs7fzkJj8gLA1JAgdsJ4gvOA7gnu1tQKw5nWkzUR0j9edRGXGeltAOd5sqlIUa2JNtL1O/lP/gc6OJXBt6wOyl6uYpDoasioH1Bgzcp/Hxipzk+9cKYGMhBP9fcyIQLk7OQDafM+dSfMxOQx1Uig6bAY/80dVMQ8cR9d8A8zN4SkUlV9mHoOKhUtiaZGEOEhhXF+I1/cuAdfZxZo327nBL5scyh15LlNIwnBPkvVuo5EcZPj303+Zu7MwwRPf15YKD9f9hnMQKmOKJ3Iy9O4GHO8o9JRFa8CLJfPscCCCwHHH0jyqyLmUdYfvQdKPhAdvh320zhOdDJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7141.namprd11.prod.outlook.com (2603:10b6:510:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 21:09:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 21:09:06 +0000
Date: Fri, 14 Apr 2023 14:09:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <v2msdn4xhqzg45j4hts3mg235gmo4dfn6sdh6557ponc5mm5yv@4vgq4reqszsj>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230412225248.3229571-8-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:303:b8::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5204de-e825-4d66-38ad-08db3d2c7b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jO+d4kDQLFJ5VRJWJ3jZgmJl9he304J9ZypQ59So/NZtc7vSsQK/Tcpz3eFdVDIOYicQc9NnGlUMe4s017hwlK7PuXBcMYD7BT1dOeGi1bty+w94vvKHvIrJOiYpVorUDxmLliQGogjf0TZrfzE2g3U13GrQYJ5LT5/Y5L7yupSm632ICuomM0sHYqnUXbnckt/HHDKmFAVYsSsnajKRlopyoSpQ3sV4H/7caevGtBR5sDEuacrQwUSGkIZG97uB3+YcJj5L/pOX7A6M+qAtbwnufTm3cFRp4FsmnFT2oe8MP2AUj3MroDuP4VBzA28o3cEnXGDjHCjK9OD/nfqsT6bjGzDOaRlFhtY5LgYTxkZtgsfn03e7s27B/D+t1tTvLG7Jjcs62b9auQbcm+Il8rlqpv34fs04MUCzQpxK3Xg4ZM8HxHuYiHjSqBJc9fKow0x8uM4ZpmFAJxAg0NvKrQst9JhQHA5HeQwdh5MFTsIl/L6pUVSlrUVQtHAv+AEE1RNRdU4SRFW2Cd+FLX4C2m3Z7vlT0n3ekTp3j5eXQepiB7u04V/hEuw+1E6o9GtW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(4326008)(66556008)(66946007)(66476007)(316002)(2906002)(6862004)(8676002)(41300700001)(33716001)(186003)(8936002)(5660300002)(6636002)(478600001)(86362001)(38100700002)(6512007)(26005)(6506007)(9686003)(82960400001)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x/N7QncMV1ciolpdj28Jb2LtlG5RbDZp3Q/JX5PBmcBZ3NRfUWdPrMpNuYco?=
 =?us-ascii?Q?q34N15HQpXaRpN8mNmvKNpJ6MGk5lEkuPFOGvuay5Yk09nS3qFt916h3vjmP?=
 =?us-ascii?Q?0RTZIp1TCpXfohkxFZhLs1CFJJ92FJyFAMoWdZ7OvIg8sIaEyM4gMMxoxHLa?=
 =?us-ascii?Q?DfytDVK/Z8iaxxOAKi4zIVLLS8IoOba6Mygp8R18HEq8XiPWpZrcT/HNlDT0?=
 =?us-ascii?Q?rd4xRcZKyKlKDIHMpTPmOyqCydUhM7jtrzLr0nFF3HyrmIOB5I1yh7Qz5MzS?=
 =?us-ascii?Q?t/4rH6+QqNAS3z9dXx7VnjLjNaw8Oz2dxO9x+amlOkmrZTYP7/y4Xm6YLmsE?=
 =?us-ascii?Q?XXTs4CiG7ALrzzOrLJJTjK9ZmVv4Frm80TV/j8Hv8LZj3zjce7gc4us1r4dC?=
 =?us-ascii?Q?YmYhH0z0mzX+LurfBVxqelHBLdaQmJzQdfmq5l6BHCYkUo/t022VHinMgi7d?=
 =?us-ascii?Q?38Tg0GDscsrbSXBf7uQgUH0uWcofZFpR0iXtJqETO9ZbomoHto09GLiP2Pqu?=
 =?us-ascii?Q?XWnUlPOpD1o0e3PRwABAfkAWH9U9+ziRIgYc/cK+B+fAaXn1Ku6V6yZGSkXk?=
 =?us-ascii?Q?OPxwfXTuLC4Iqu7a09sW5cMp1Iva6PfgDqwmJda2loL1zEL+Pd7TAhV4TKx9?=
 =?us-ascii?Q?y25RFDhyy4Tzc49BZ6zJZ0LUJn4VCS7INiN4EOFUUEzHBIthygN10QNPbunj?=
 =?us-ascii?Q?JBR/9r2iUgFa815unDrhCzDAo/EDab4CHbgwWmQxX1TCTCD19IDOTCkcZg5r?=
 =?us-ascii?Q?/gVdgKQ1JaJ5nzHkc7n0eHTezf7nATnM9IO0w2x71RSNeli8/IFRZ6Ny/8xu?=
 =?us-ascii?Q?+KRUb3m4r3FSoCokP+hJPZzLZ0nCZ+fR4RuhqfGbVWkGyowdbJjfJ3HbUPi4?=
 =?us-ascii?Q?O4v9OtcnagAj7nSqhA0ZqWDVGKFzL1GnUNE7bJjEgtP1LF7L/5CXir9L+dWa?=
 =?us-ascii?Q?Qcyoom/XueISc/xHMYzww1XIoNmkNANcmJMddfinC3J1mOUR4uak4O46k0Qy?=
 =?us-ascii?Q?8y4e03pjrt2qdk1d9WFKEjAa8FnyUd2lgeZK8llcSMhYtfE/n2WSfAV2rjm1?=
 =?us-ascii?Q?/IvMBr31ong1xMXTp5L+FUnM9UNz6fLC3OoiEO8Bg3H3KmVXq1+cIlBOoBar?=
 =?us-ascii?Q?9Pdf2H1u9X0rDyjCG2UtRh6U5ut3T9qtwneYBcGrebrB3siA9DGwtxiWUq+3?=
 =?us-ascii?Q?I8Dp31/LKYOJFVrSnRGMZHtMwotOqK+CfVDjnvJmGuJtjTfqTX6qrA7HKxPe?=
 =?us-ascii?Q?+GyC5PYEvRAtq9rakV5ay/DjyMt8IoYCBMfbJhbYRtqSAvdNusDZXrhSEJus?=
 =?us-ascii?Q?A2C5NKzu/1ZOLXwrFCaW1jYel6eT7An70lZwbPyOw2SmuFRB38kZg+06t/Yf?=
 =?us-ascii?Q?DTxW3b0hJ+BFN1YPYIC6HQWrUc+tcUfkJeGvKQyGjbjrZzg3vY9QWAnWXGuZ?=
 =?us-ascii?Q?JF3ltrvyyzy+nPnGVHpuUvm363DJwrOw3UHCn+URrIGoqELuo2pTnk4Hui1Q?=
 =?us-ascii?Q?qRV6DLYZJe2byntGyNemm/qs+ZiaLWMIIsaEj2vXlR1U/HY8MzSHJH1qUSRP?=
 =?us-ascii?Q?fv37JgbGbnmvlg8x6ty3V1vSZMIErZmEPhncsr9MsZg0BOhhg0BIzpYOmUNT?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5204de-e825-4d66-38ad-08db3d2c7b37
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 21:09:06.0580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/S/kokBoHR9WCr7DunBJ6mKAwXaqgW7vI5UOmTP916ztes29vXec1JeJ6gPb5Wy01shFA9uK5mYOe4EYXAfUOyKhfkMiSAjbA1pX5gLhkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7141
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 7/8] drm/xe: Invalidate TLB on all
 affected GTs during GGTT updates
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

On Wed, Apr 12, 2023 at 03:52:47PM -0700, Matt Roper wrote:
>Platforms with a standalone media GT share a single GGTT between the
>primary and media GTs.  However each of these GTs has its own TLBs
>caching the page table, and each needs to be invalidated separately.
>Convert ggtt->gt into a list of GTs so that we can iterate and
>invalidate them all.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

it's not clear to me if the call to xe_ggtt_invalidate() in
drivers/gpu/drm/xe/display/xe_fb_pin.c needs to consider all GTs or if
it's ok to keep that one on the first GT only.  +Maarten

Anyway, it should be done with one additional fixup commit due to the
way we are moving display up on rebases.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_ggtt.c       | 15 +++++++++++----
> drivers/gpu/drm/xe/xe_ggtt_types.h |  2 +-
> drivers/gpu/drm/xe/xe_gt.c         |  4 ++++
> drivers/gpu/drm/xe/xe_gt_types.h   |  2 ++
> 4 files changed, 18 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 0ae373b604f6..374830a7a0cf 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -98,7 +98,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
>
> 	XE_BUG_ON(xe_gt_is_media_type(gt));
>
>-	ggtt->gt = gt;
>+	list_add_tail(&gt->mem.ggtt_link, &ggtt->gt_list);
>
> 	gsm_size = probe_gsm_size(pdev);
> 	if (gsm_size == 0) {
>@@ -139,6 +139,7 @@ int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
> static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> {
> 	struct drm_mm_node *hole;
>+	struct xe_gt *gt;
> 	u64 start, end;
>
> 	/* Display may have allocated inside ggtt, so be careful with clearing here */
>@@ -146,7 +147,8 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
> 		xe_ggtt_clear(ggtt, start, end - start);
>
>-	xe_ggtt_invalidate(ggtt->gt);
>+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
>+		xe_ggtt_invalidate(gt);
> 	mutex_unlock(&ggtt->lock);
> }
>
>@@ -263,6 +265,7 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
>
> void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> {
>+	struct xe_gt *gt;
> 	u64 start = bo->ggtt_node.start;
> 	u64 offset, pte;
>
>@@ -271,7 +274,8 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> 		xe_ggtt_set_pte(ggtt, start + offset, pte);
> 	}
>
>-	xe_ggtt_invalidate(ggtt->gt);
>+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
>+		xe_ggtt_invalidate(gt);
> }
>
> static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>@@ -316,13 +320,16 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>
> void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
> {
>+	struct xe_gt *gt;
>+
> 	mutex_lock(&ggtt->lock);
>
> 	xe_ggtt_clear(ggtt, node->start, node->size);
> 	drm_mm_remove_node(node);
> 	node->size = 0;
>
>-	xe_ggtt_invalidate(ggtt->gt);
>+	list_for_each_entry(gt, &ggtt->gt_list, mem.ggtt_link)
>+		xe_ggtt_invalidate(gt);
>
> 	mutex_unlock(&ggtt->lock);
> }
>diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>index ea70aaef4b31..fd527179f81b 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>@@ -12,7 +12,7 @@ struct xe_bo;
> struct xe_gt;
>
> struct xe_ggtt {
>-	struct xe_gt *gt;
>+	struct list_head gt_list;
>
> 	u64 size;
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 4186f7f0d42f..a07d17af3db0 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -71,6 +71,8 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
> 		if (!gt->mem.ggtt)
> 			return -ENOMEM;
>
>+		INIT_LIST_HEAD(&gt->mem.ggtt->gt_list);
>+
> 		gt->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.vram_mgr),
> 						GFP_KERNEL);
> 		if (!gt->mem.vram_mgr)
>@@ -81,6 +83,8 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
>
> 		gt->mem.ggtt = full_gt->mem.ggtt;
> 		gt->mem.vram_mgr = full_gt->mem.vram_mgr;
>+
>+		list_add_tail(&gt->mem.ggtt_link, &full_gt->mem.ggtt->gt_list);
> 	}
>
> 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 7c47d67aa8be..1eff57f43731 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -164,6 +164,8 @@ struct xe_gt {
> 		struct xe_ttm_vram_mgr *vram_mgr;
> 		/** @ggtt: Global graphics translation table */
> 		struct xe_ggtt *ggtt;
>+		/** @ggtt_link: node in GGTT's GT list */
>+		struct list_head ggtt_link;
> 	} mem;
>
> 	/** @reset: state for GT resets */
>-- 
>2.39.2
>
