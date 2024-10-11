Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48087CFD35C
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 12:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ECA10EAD5;
	Fri, 11 Oct 2024 12:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDPT3MrG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5205810EAD5
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 12:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728648810; x=1760184810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FpAP6XWCyTJezm2jvPXeOaBoxMUv7BZAFvPYgL1myms=;
 b=aDPT3MrGo1+GoJ1Jaw1TWY4B/wM/5xU1rjCHujIWyjGUzAF7Xlt5JZvA
 VlOdowtmsHaSHIyxo0KtYhPx2ubXqJ7q+sqvNLWmXq+DGqBrdT7gieywn
 yJzubGCPe/HrL8GyUNzN5dnlXg0+hRWJkHSZkcdeF/oIdEoeNce0/DRq6
 T2pnqqiDR2VFaQZ7fzFdPxBrgdyjonZzAQnwJ1QWojCm1B+SGg5aXwzkw
 XVy9bD9IEJEKMAR5X/e8fOf1cU5PBcwTE45XKHJ3NitsvKDX5vTvdCLf3
 sz+P4eVTC3zb9ytvxpCq6fYQDqh+KeOyhKHWgMltHETs++PNPmY5jwySD Q==;
X-CSE-ConnectionGUID: ib1mx8ZuS5iomdd0DUlhvQ==
X-CSE-MsgGUID: Rj2x8ptzQJelTZ61etZX5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="45521776"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="45521776"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 05:13:29 -0700
X-CSE-ConnectionGUID: BO/6LJbWQ8Or9s1jeRuvvg==
X-CSE-MsgGUID: DoIozltYTKGAR7a62OOtNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="81510831"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 05:13:29 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 05:13:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 05:13:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 05:13:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcGhvrtXScWS7I1DZQUkPQKnEtOyBgFh1C/va9QqiaVfEVhqtbykCjqW6dvDOkbXyBjXwi1FWkAr6aKhMztJyGNDRjnJsu2aigKlHrzGaxuenC5ynY+BoLCGC+ndkCwq6hqMdS1D+F1+aNcNpI9e6mBavGVxC7ls47eWDbe0oZMVJRD03ENWRHNBiAxE9Zch0jz9SJTsD3ac3rGYqodIst95+faituE1Dk0V0fqi9nT50x0JdOO58zZXkDH89vz9to8vB8vLB5LN8ZFRPXWNX06hNqA99oQl3hZk4h1RDaun8a3BS7RcJF9YUojKJEpKDpN9sta/8z8yLp0oSN1jXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNXgqqN8XMPbjgDoULUTJyuBK3YqHxMyE0zC7WD3VWc=;
 b=iCG3yF0LZW+QKhjMGMHmPCvWVXgQf4n8MivzANHDmZ4bqJi6mIcle3n0n+LlQuNin/XPr8gMd4/sOjcyfIICxSexbUdn5iB8uZaGYcQyBOfm9c1UvwruQ6Q76AhGRcwduUE+kr9Rd+CPVLduobe/IsQvmBk5bt3yKgJp/en/xrmDDnhFLzMWDlycE7pTVfcPF0dd0BtGRHJiV1eJKxX0IMvIH+Y8h2+Z8Q+7l3mEzykQXHEqCHZ6hQVjzHL3NzP3ZqyYdWhkNckDPTcJDWVRfBul8YvVycYnEvmD/0HyGWcNsi/zoCkRlFOa9qTj5BELwq6TWA3HC3DEvjK1/qaqYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 12:13:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 12:13:21 +0000
Date: Fri, 11 Oct 2024 07:13:18 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4 3/6] drm/xe: Add xe_ggtt_alloc
Message-ID: <ams4jra3omnycc5twpkihf377xhnlqo4qzmbavflwy5p5ilv5u@ht7hsqpmm4xh>
References: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
 <20241009125114.412624-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241009125114.412624-4-maarten.lankhorst@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:303:87::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c54adbc-91db-47cd-5412-08dce9ee18e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yNNbgPq9NKkGIBNw6zleJ3wi1Y4yM0RgXyn2xeUmRWzZnpho+t305hl2ZwiX?=
 =?us-ascii?Q?/nXORJ/Zp2yrzW4z4q5W6rOSoBS8a0qa2elJPlX1nqL9wrF6EyQPsxKaS1pe?=
 =?us-ascii?Q?MaU8s7HVLx5IirQumcqedUjAhFCFZL8EbRQKe6cxMPGo2KRtUY/lwxHVz4wz?=
 =?us-ascii?Q?RczoLFz7ODNka4PNh9NK7/IxxZCfEaNAFO/pxa54uSVi0HJR1ZUhRUIpG9Ln?=
 =?us-ascii?Q?GbRSQYlGBgl/K41ht2EbymiAsCWdNTSHOOqOcfXG2q8eAoJtRvd/AQ9PZHfX?=
 =?us-ascii?Q?La80yTGjj9jbgP80RCLF3P34uST5nF+scJwqh5fHsdt/5zgfviwrojyxWhio?=
 =?us-ascii?Q?jDbeH6Y7X17z8721UM+/F/WENvno4/YEMbMB8fmVnfO7J8PSRxSpPy03HN32?=
 =?us-ascii?Q?nY8X5jWOgS7t++O0yq1fYM8m4omJQS0wtpphH1uVOI6EUk9OIUHge8HdqTK9?=
 =?us-ascii?Q?hWpnQncfnRRP5GEKCdJx7wdGWhsSPxqE5YPgje9EaQGwhfdPFFu7jCbJGJi7?=
 =?us-ascii?Q?OAyr1/8RpI3QvN3Mm0wQoBAJMGBNLRuw2z7cYNrKJzN7UoMHcZN6S35M2rZN?=
 =?us-ascii?Q?7DCDN60XRTDZGq5+xVuK74sXroclSRbuUoIZOvsjsqLCzPcY5eIptbQbAhDp?=
 =?us-ascii?Q?a8NhzFnC2AcqhMWOYofnbiJkS84Ckdq9XTTuMmWbo9NhRbFJ6AWRL9LFMJ++?=
 =?us-ascii?Q?hA0SugzD+PPD3IZ3MaT/qJh1fypZIHM00H2Ye8n0wIUhl9fuCz8hLSIka6a4?=
 =?us-ascii?Q?xtBVZgFgeOOi+d3r1ujKnWubDocNqzX63cyRwEWadZRqnOjCYQX0SzcX0RDL?=
 =?us-ascii?Q?RSq/S5TmOSaaBl4PjhI2h8cZeKJaBudamyuycCHFKt23YPTrNLLonOkMWXuF?=
 =?us-ascii?Q?gZHL7V/Yey+5mwtf3CpelEPuWYVn1okensGSVP2BDuDTEFK25HlfoXU4X2Du?=
 =?us-ascii?Q?IliIx+PdYdHNtYJ3vHBQDTbPkGZyO6ednFH2jhd1E6vWD0W/7MuzQPPOtM7/?=
 =?us-ascii?Q?FwAaD2mm4xUQRnd83wx0WjFk6rRVrN4BelAL0BzhX6JBIt8Z3WICI+QfYRIT?=
 =?us-ascii?Q?aiL0B+h1vH/Z/nO1WOjFgvrjUM276KKo/IyNyRO3CsUD/oBIvcukOXAD+5T1?=
 =?us-ascii?Q?9YDNOanWuhJkXzIOpsJP1opSKhXhPOTAx/ibqczTFVFCK8dCfAN9BLEAGPiF?=
 =?us-ascii?Q?XDstdAN6hgO1Ctiq5k8WOA+D9pdHvkl6qxH1jIb1Nk6KhoFmcpo9duDxuhO1?=
 =?us-ascii?Q?8DpjrBZXfB44dFzdaDup1o1YKRTUbXOkKbyfPiMIPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/QBqqFBn75B1HB65IA6IphXzz+9VDHoNdyjf1cTvXhK1RR0xzF5QQuKNy59N?=
 =?us-ascii?Q?id46ToiDAnqxIQNOO+G9eowAMkFSPR57TRs/nh488RdbctzrjWQcQ5phdUE3?=
 =?us-ascii?Q?rPYgvoME4n4TSlDHZF8wuJS0zdHsRDeHvv7dsAMGtKmFl47YKBOGaXEAbQx8?=
 =?us-ascii?Q?GR8B8dycxS5Bq/nEKEV+XvdKKNuHmic51teqQYEsdYs8xFj91Q4PS0ssyLBo?=
 =?us-ascii?Q?z7nBrOGFzlpWb00aSUt1u4b4OL60y72sesmCO3WXJb4P0JBUpF9G6jDp+E+E?=
 =?us-ascii?Q?WrO/MgcAR3rKMtKsPp4USLAMV0OHyBVIqljaC7bWNaR8gFanBmUWDXN6lDYy?=
 =?us-ascii?Q?kk9zi5iCz2aHIOktr++5jxBQpF6/igiKPpa8iMW/nzUmlRxcyUs3dI68R/UZ?=
 =?us-ascii?Q?xRnpEAjg4iBEfFOjsoTOJvOrugvV+YNKSjvvNsWsL+gptODC1t553ysYcZMQ?=
 =?us-ascii?Q?ossMSXW1e/E+hvVCXg47M1b+vWxizfyR1fNuDOGsxDHD3BsAyJaMy19OWIkJ?=
 =?us-ascii?Q?knHjcB3QZpatSpsfIUSyRRgPHbfy/jUkXRzPQcnhXlE47aGOd3MzNCw0M/cf?=
 =?us-ascii?Q?J6gPqB9W3ANpEa0cAZ40WSRtRPjOfKgpplXSc8usv2fmzzqlFU3KyKu6lV5u?=
 =?us-ascii?Q?cic+aW/GOZbxX8JuB6U+Ja/+qCfs0BUQWnz+dVm1tdDglWMccXfnwkfN0cYO?=
 =?us-ascii?Q?UpEK0JN2C0JkuQcuXNTU96mniNOqF3duZzC2vxJMf/AFN/uLJUokvFGV38E7?=
 =?us-ascii?Q?1VJnT+KMffYMouH98c9+74JOO7y6HYjRQWYdwdNf2wLrZ3iJ/5nicb/ufUGO?=
 =?us-ascii?Q?1beiusxCcsmZ9P9yvY3ac3U0huHztf4+DiOn/c7jh8aBWQONjTeHqtiJg5Vs?=
 =?us-ascii?Q?KcaM3PEIqmjyPuoOdIQNyKoiPhL6U9v1XwSVfqMbNo2EfxaA2l/PLWseG2rw?=
 =?us-ascii?Q?2rH8F1YmsSkHEgB4T1EUesrL9/pntgbYS97z+pF3VLrBc9zP932a2Ax9iTuu?=
 =?us-ascii?Q?VixZa9q5rRYjUet5YTo5Zg7J1k+mz2S8JityagTwpIx7lTWtR0vnoMGt1Ioo?=
 =?us-ascii?Q?io1gsIwFz0ozH896vGZmL2UQ6U0l2rQjaZScy6dW6Dk9HN2a2dY21y2wJtcp?=
 =?us-ascii?Q?vlZsD3JJ7zJ7UoqafoJAnZzM9VEQgmIn4zqUHBJpWd1BWMG4jZj2pcMnwu1R?=
 =?us-ascii?Q?KGkztmreDI1SaRf9UJJ8NLPeMJ+q6btkvXdVPKepaJWiwg0iENg2peejM4cz?=
 =?us-ascii?Q?2hGqzcC7KYtuE6eoiqTYBdPTFkoEouob+JB/gwuL2HHGIRf3P4v9LlbIeJvb?=
 =?us-ascii?Q?AyErk6NjgEm61wf81UB52gH3k66CinZSxpuHEbmJc8zFHzh8ydH+d4hhfTgg?=
 =?us-ascii?Q?ZCx2XL/eBd869RvWAOPQ9yUAnG28ccezIeZN5i4/kGxipejYNlTzknO6FJn9?=
 =?us-ascii?Q?0u6/trNU5oWX1pQyoi2g1kSsoTgNSiZsmB7VkMyqbF7RFVXtFs6vbU3vhwRt?=
 =?us-ascii?Q?z8Hzo1BpvOiYf7PDET1fZ069pwLqOXkfSLcjTiowhgDNaBgzgFWpbrTpu1i/?=
 =?us-ascii?Q?eL7T+K1lLL0Mx3isSEBuf7Nrp0L3doy2gRA+uIEp5416MXSDJ6NIoz6WcYt7?=
 =?us-ascii?Q?uA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c54adbc-91db-47cd-5412-08dce9ee18e6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:13:21.0728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: grBAXMKTQtkUuzAS8OC8N+d8t6e3ZgCeZj3wVA6H+SnD1EJa/AAqZw3Jn88QgG7YK5TnKG0+HW9qVkYonR/a6FSHHOHeM3HdcsocSZuPgBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
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

On Wed, Oct 09, 2024 at 02:51:11PM +0200, Maarten Lankhorst wrote:
>Instead of allocating inside xe_tile, create a new function that returns
>an allocated struct xe_ggtt from xe_ggtt.c
>
>Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 16 ++++++++++++++++
> drivers/gpu/drm/xe/xe_ggtt.h |  2 ++
> drivers/gpu/drm/xe/xe_tile.c |  4 +---
> 3 files changed, 19 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 16be6f53b75b2..c9fa9d15b69de 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -160,6 +160,22 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> 	}
> }
>
>+/**
>+ * xe_ggtt_alloc - Allocate a GGTT for a given &xe_tile


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>+ * @tile: &xe_tile
>+ *
>+ * Allocates a &xe_ggtt for a given tile.
>+ *
>+ * Return: &xe_ggtt on success, or NULL when out of memory.
>+ */
>+struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile)
>+{
>+	struct xe_ggtt *ggtt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*ggtt), GFP_KERNEL);
>+	if (ggtt)
>+		ggtt->tile = tile;
>+	return ggtt;
>+}
>+
> static void ggtt_fini_early(struct drm_device *drm, void *arg)
> {
> 	struct xe_ggtt *ggtt = arg;
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
>index 62c8ce636939a..0bab1fd7cc817 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt.h
>@@ -9,7 +9,9 @@
> #include "xe_ggtt_types.h"
>
> struct drm_printer;
>+struct xe_tile;
>
>+struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
> int xe_ggtt_init_early(struct xe_ggtt *ggtt);
> int xe_ggtt_init(struct xe_ggtt *ggtt);
>
>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>index 07cf7cfe4abd5..19814bfbab423 100644
>--- a/drivers/gpu/drm/xe/xe_tile.c
>+++ b/drivers/gpu/drm/xe/xe_tile.c
>@@ -88,11 +88,9 @@ static int xe_tile_alloc(struct xe_tile *tile)
> {
> 	struct drm_device *drm = &tile_to_xe(tile)->drm;
>
>-	tile->mem.ggtt = drmm_kzalloc(drm, sizeof(*tile->mem.ggtt),
>-				      GFP_KERNEL);
>+	tile->mem.ggtt = xe_ggtt_alloc(tile);
> 	if (!tile->mem.ggtt)
> 		return -ENOMEM;
>-	tile->mem.ggtt->tile = tile;
>
> 	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
> 	if (!tile->mem.vram_mgr)
>-- 
>2.45.2
>
