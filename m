Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29CAC64ED6
	for <intel-xe@archiver.kernel.org>; Mon, 27 Feb 2023 22:08:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E27110E198;
	Mon, 27 Feb 2023 22:08:33 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889AA10E198
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Feb 2023 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677535711; x=1709071711;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UaKyB1FBw/bfER8uBgO2hJ9nGRViYwsfUUT0Mpl1cJ0=;
 b=jhHTcvfzunLo/xvv0HVr7pgEYavBgFvoFJZl1MjIvMIS8FxnO20xIPAP
 /jNOsknAjCVUqIMQDyPCMSdjtWecGT0wuwMt7WLa44ijzEPip1EtHEdEo
 qS1fY4rvFIIH4cIJdf0hI1+sLjZSJV5JJeSEe1nxYJDzYzK/vW2eC23+Z
 Z+A2v224OEWLbRJT3N+cxe0bvB6MLOuxoqbQa0j8nZbAOnHWA41/aDl3k
 CqtH640mkuMmaP2PrSdTRWNvMle+ov/qwfiICWFwe4qkT4kTKE9SuTAHO
 GxTsTJUC7iPWGBXHPjsxt7gUyR2UDSomE7G2Ul7vsTxpMIGIZPoesEyvF A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="336263378"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="336263378"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 14:08:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="676041822"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; d="scan'208";a="676041822"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2023 14:08:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 14:08:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 14:08:29 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 14:08:29 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 14:08:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFB5vpzdAG9xBaouieP0CwQhzKGAKCT7AHvVUarHxxygpBrDBIXff/WiIbljztPn8TCeQa88dJcCWuaJ1QRFnRZgzGQ8O+u5zuf0Hoahg9x63Fw6JfNfqBYRJnrUOtd5ZSjOs+FFJtxyBkRVRgPHgPKeK1s4+qNmxAI58uoGof8r8BKM9vWCExT2i9E6AXJHgMaQWvpHo0izG+CIJhCt/onfFEyRuzQOO6w89DvFeKfYc7aVdf8sZDsxQ0hXHgFIorkONBSmmXAmcg1vQvKSL7BmmpbdjU6lyKUXw/0rpuA3Jd8Wl1Zbn4sphiNUlb1Ro0COfXn4SsXUbf1eiRVTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vsdPsrzxUPWsF4ipq4Mb67TEFM3NhNpJbEtOOx3Fic=;
 b=a5DucLTp4aPKSfepFKf1Ny+K7MxfTSLtpf4OzKLxNtiF4bnLko7x2ubWxjn8p+LhTxQ4ZQpo3cLhiBot7qKOgj/SEUMqqvBf2noUjk4CSz+bCmia7h6o1XSVlbdhIXh12fC5nNQVkMjrEjin1HqAO1KIEm8DBLFC+e9BQ3xXTVs3D6ZHeJ6Bf0O+ce5sCCPwtl5LwZg9JOt0b6KwnlBRBywlksuhoIF8boYv8rEGRopaWqtOnPSHYFJJ6nqpt7teF2Zi0OqIkAHCql9j0VSSAeBmYbfQZw0krw0XNka9r8o9wxcpORjAts+NmBTOo//9tTGiq9OSwqAfj5WBdmzmTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 27 Feb
 2023 22:08:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 22:08:20 +0000
Date: Mon, 27 Feb 2023 14:08:16 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230227220816.7lq2eshvjtn3uvlp@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
 <20230223185740.3356127-8-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230223185740.3356127-8-matthew.d.roper@intel.com>
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: be556af1-ee4e-4063-3884-08db190f22a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKJY0AeT1aUbSjdRic/HNOemxpGXdfXCjI1elTC0GU7fE50nxk270volqUi2CwIC6KYN+aTQsjK4+n5WgnJjubIbKhLqvZezvoV2KCva77JO5ZaVkyZkA+N/itcyf8orMD9fRI5O65lsp3l99NdreO9dq05t9euAO4yhYl+55SMm6d3Kfxij5+pXjppufSs/fiSDc+X41kOJ711w7qVmjLGfZG65A4Ruwh9BRNdwd0+MXaOQFhjPKFDCF/ObGvTzUZg1auo5HEv9a2db4zLOabhYVYRc6r20g6SgYrCJaf5PIzOg+Zn7/ITTeTVKbHEeEOB/TQECuvvZQn4NKtFrStaKliZNSR8JR8RwiEKqLAYRG5Ljh2qUpkj952P4pa4/Wi6cKsi/r5zsqZy64/lkaINYxNDpdE1t9PfM2jXdIdDwBr11GlbhQ7E6c/YY8vAstOXyVLXJ3dgbKax19y4467zziqwsIq+RExRFdYhs6+KmZf8X7DcJjIwOKjD3EXsj7UQoTvaMl3BBDtHcKYbPMlSxk4y3YOhsHOOI2AsuWVfMomLXKFrZ9KRrCSwsJAt5ravnA2XyYbNbrtSv3is4GSe1yQjLZFSCNLszBsbIC+FjA2XSdoEhoP1i8wnAyAue28OkPIlpVFVGt/w40uZ/GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199018)(1076003)(83380400001)(82960400001)(38100700002)(4326008)(41300700001)(2906002)(66476007)(66946007)(6862004)(8676002)(8936002)(66556008)(6512007)(6506007)(26005)(5660300002)(9686003)(6486002)(6666004)(186003)(36756003)(316002)(86362001)(6636002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QEmo/Or1wmNPuiaktpJHIQteGNdqZ3FBx2iIWNAFm26//QAubv8TskVPwkLo?=
 =?us-ascii?Q?dAFEQlc+xpIShE4QDLqZdYha2Uz+iTu/0LBsMHbKab5l8TSyWWAK/ypzU8oX?=
 =?us-ascii?Q?0p9i0YM3vixsKJleYETvPZQxgiC3gbIzNrKIjw//IvGNes7mU5qMPwHLbXGL?=
 =?us-ascii?Q?yLiBmmz/XhGOt+ZahgPPQAZjxuQnuhg59M3pSs33c+looLfVvgc/Y6uQ2dfA?=
 =?us-ascii?Q?SdWj/KtKpfCCJ+C7DnMWmJq30OSmvjxNJu1v/0jPqpPVoEpb879/98++uh1V?=
 =?us-ascii?Q?vGmJe2EzwxuYti6yKOL38XCysIveg8El0wqIreb4RQI5ozE+/OSIk2wzpCly?=
 =?us-ascii?Q?6a2iNtWIWIw+nPNulxxoZv26KpiGUBg0uHlirTQ6Pms1ryjyb/PUgZ/hOfOh?=
 =?us-ascii?Q?qHYQdbof0N1mKtEZgID3O89EgK9RM1/t2YiUvQQZACJzlCZPEdBhfIO+0Fws?=
 =?us-ascii?Q?076h9WPWQ0Cx8fUxXk+ym7An96+/mUHbF0BR5oZVp5vDrJ2dYcrCxgrdTVEI?=
 =?us-ascii?Q?wQp4duHZovXLKXY3L1U9JoN55daKy60L9y8TWlsNTKfn5DgwmnMKYpap146G?=
 =?us-ascii?Q?hyh6pdMJ4EUWgTiyKxV6zOEePZ19QVAbtWZ/3t8/7j3WGD12PmXnKOefcNE5?=
 =?us-ascii?Q?Fy7HiRRjWqqZok4T8ouZBi4ufwwLjVOSl+9FWityBJnmYAiQc+UXrDUWSyca?=
 =?us-ascii?Q?FktRly1e9CBCwWeOKbrLc7rvYEepmM2UN2WtxDO90Guk8Bdf7mYb9IDsXEjc?=
 =?us-ascii?Q?lXUYkie+bRfEO4jFi6mmO5t5qqunEoeIXQ91KNcJUtrrXE63okvxf7gZVibR?=
 =?us-ascii?Q?LnyWMR4F/Nk5fRux5xURsm+OMITEsj93ez/1k2Fqnv4CoBftj9uof3SpssvO?=
 =?us-ascii?Q?IWPgu5Zwq1vl1s4sI78mSVthFc3vTu8uA6RHkwwEB5MaB0UlqIPbkbacKH3S?=
 =?us-ascii?Q?o3AF9+b3MKB6tv6pv8UVkkrS+4XgEIO81VnmOAnusjtfL7zwKR81+596RNDE?=
 =?us-ascii?Q?FCN/1pfSdrtTW4oCjGsukfbNUcqaRyrc71kIshPRuRbwawxzABJWWXSek2TS?=
 =?us-ascii?Q?tGyP1oP5sn7R+jLIMWiPuHealcvWHRqm9CBVBNcMQTrJ5yDyXnXp4HANEJCY?=
 =?us-ascii?Q?chdfRFJ5aPnpSMExI/yzwyuB7KedGpNHG0mTbooXk8KprGFswsTrnf1tQKcy?=
 =?us-ascii?Q?1Dy+fnZUGc0UbJEGb7HFa/12c48SsVG/vruExOgwnaLWMQ0F3Mf/dxJxcs1h?=
 =?us-ascii?Q?r2pa+0d5FW7eZCOfc9XJQklqza4gRpa36ufU2oHLtIkd+3u0h63JP2FtV+/z?=
 =?us-ascii?Q?G3luHE7sWo4d0hytHBM+A39Zv7t9eWu0U5S9xS7+vDyKYgpy+hSKIeN7+aKH?=
 =?us-ascii?Q?LwB6eyZov3Grk6sUcEKFS2D6uPMm3bJW54kcSXCnduVJuPN/Drip9XlJG5m6?=
 =?us-ascii?Q?jyU/XZX2qYcFWz0y3q3wdcEKQeHQLjrZlEUF12kqP07gP2abcn/akW6M6QK+?=
 =?us-ascii?Q?BGMVik5XIKeHbdgvzkgN1lrG5MEdHbKrCiLdebqtcodo1hFV8SxyONN/xojJ?=
 =?us-ascii?Q?dJMlOODgmxl+hQIDO/ydFNqHymCQc6CPIF7/8XeAgTAdvfoML7v+NkVsb2sd?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be556af1-ee4e-4063-3884-08db190f22a4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 22:08:20.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1d1tZKeiFV3QJBKiVDyBw++wnPh7NMyp1e7f2wLH4vAwnMJt/TYas9IQfnWFieEcK5lam2069oqYzjgKez599bNqXelN7RAI/rbWJYQkEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 7/7] drm/xe/mocs: Drop HAS_RENDER_L3CC flag
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

On Thu, Feb 23, 2023 at 10:57:40AM -0800, Matt Roper wrote:
>The HAS_RENDER_L3CC is set unconditionally so there's no need to keep it
>as a dedicated flag.  For error checking purposes, we can just make sure
>the 'table' field is initialized properly.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_mocs.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index c019352ba7a8..1781cbfdd0f4 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -25,7 +25,6 @@ static inline void mocs_dbg(const struct drm_device *dev,
>
> enum {
> 	HAS_GLOBAL_MOCS = BIT(0),
>-	HAS_RENDER_L3CC = BIT(1),
> };
>
> struct xe_mocs_entry {
>@@ -440,10 +439,11 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
> 	 */
> 	XE_WARN_ON(info->unused_entries_index == 0);
>
>-	if (XE_WARN_ON(info->size > info->n_entries))
>+	if (XE_WARN_ON(info->size > info->n_entries)) {
>+		info->table = NULL;
> 		return 0;
>+	}
>
>-	flags = HAS_RENDER_L3CC;
> 	if (!IS_DGFX(xe))
> 		flags |= HAS_GLOBAL_MOCS;
>
>@@ -538,6 +538,6 @@ void xe_mocs_init(struct xe_gt *gt)
> 	 * sure the LNCFCMOCSx registers are programmed for the subsequent
> 	 * memory transactions including guc transactions
> 	 */
>-	if (flags & HAS_RENDER_L3CC)
>+	if (table.table)
> 		init_l3cc_table(gt, &table);
> }
>-- 
>2.39.1
>
