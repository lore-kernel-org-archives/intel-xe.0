Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53646EB64D8
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jun 2023 15:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2825610E581;
	Thu, 22 Jun 2023 15:11:50 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C981910E581
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jun 2023 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687446708; x=1718982708;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MsDRxv3/fF/lGNSqqLL8SYuHF0lauQ40sF5FNVMagiw=;
 b=eH49Huf1/2aGNKtb+QsKyUgS2zEb/udacv4i7h5KkPf26TzYtYt90VIQ
 cRauT4rDVy4B8IF0JWhGrmr+pT8AUd8eQcm7fT+cxC4YA1EMouZiTU7tm
 oPxJMqL4ueKZ2dkaBD5c7UP3pQrplEOirgZXXba6Fea43/cKA/gLeIuR1
 3/bwOwjpo/wr8Hik7cbg3XhMwBbjwJMzCSdwYYwz+/y5SiBi7+g8eO1KQ
 y0/uJyCqbY/WB5o+Kt+nNEGa7RqqdAxaket1FfJWrMnv6EyQWZ/xO/jap
 Sb2MKozZHzAAbcZn6woViKbO3l57CF0vhQAtWhIOJyWQpJU44V72rf/VV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="390275738"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="390275738"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 08:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="859485869"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="859485869"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2023 08:11:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 22 Jun 2023 08:11:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 22 Jun 2023 08:11:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 22 Jun 2023 08:11:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOzNcW0UgXpaZ2i9ARKmMYoJCTm+tDFct4ttIQI2AJ02cOIWRgic8j83YXZfFKZNuh57lWKchd3HkzOBgjfNR9Jg8gzRjoFSHNAenV5EgYkGEUEzOJeA5jjzUHm4nUshc9O2Rx00HEsZ+ayu1QFYT4cYszfdV6NgTi8v7O8VNHctPukdXIBodP6f3/Hb0pCK0JZ2nDg4E5EvVvHBgSYdKrbrno0k19/PpcjgZbxkvyShurg3DoLTnRO16FewhTofZltCfIo/PBTb5PhJJMqBtCI41uvGFL7GyTsmHyRl5/I4qjyUO+yBl3Lo+nOlF1EOBXTdSqFapVAx3aE5V8vwrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/XMuXdqw6Xswni34LBX1Q++QZu4MV4em3rU5irT/PY=;
 b=X+y75DsTAiBn71N++y3Ul8JOYkuhl3Ib5NMwgkwfXAixlGH5F/z5EyTjC9SVyjOZC0h65fG/Bz8PSw+QFxpGuRQwVS/NGvAkr/5etbLgp1/oL5JhWrmMekPRTfg/CP90VtKq3PKdTyg0C3xdGqaClcQyOJxyq33WkQFRfo9QGsVAbBRRKu4CxGUoRVU2lg4h1iUhyC2efhOpVFodYiA4GZDVrttndBJkfI9ilPgCP5ugtASLcKI7bBvSvBJnJeJ1aLvd5i5cC/2r3/uDv+LuXPBnAi5C4Y3/tYWzQ3JuNx1gkICyp3RZtJU2+QXpjGFtKqWm1c2CnIhA7GUZUChaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5429.namprd11.prod.outlook.com (2603:10b6:208:30b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Thu, 22 Jun
 2023 15:11:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%7]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 15:11:40 +0000
Date: Thu, 22 Jun 2023 08:11:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <es5rn7x7sly5xmkaktaackddg7el5mjo46b3irgrlz44tbuljg@dmn6quth7jwz>
References: <20230622123946.7-1-francois.dugast@intel.com>
 <20230622123946.7-4-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230622123946.7-4-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:303:16d::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5429:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ffbb566-04f7-4ca4-80b3-08db7332fb02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CN10+UYZXT7z+RZPbPSDoVyuueKu8dVzwpVPS3YvTygu1rW6t3VO5XsRO9NkKK3gctV41ByGWazNOohUAfKtBbxL0yHvZ7saG2gHgV7Kki2RKPPT0kSx4V0cXkQJQ/hAK3WU9HBKkSNUw8/I6fPckm4YnwJYFIXZzZQ8YaDObRSuVcXw8ZEUJ6FF5TuHAfTfHZEM6308XJo//LAf0thDhJmDx9VZOlV/YuBUArU2hAbTrFvbwyD009o+vISxjOMnFSENyNtpR+uMfe+4tuLQ9I3pNTIQFWGU70m9dIlc559kCogx3shGrw9OHO9geAxY5vynN9wZoPqxxpvxkiYc8QWDG4PU5CxMKH+adpbJf19VhP4zk5QG1UZ7EmLIH7TrmBQH/C6IfcDLQZvgereyb4bODT5RkP+Rxp9uvJjHWQZh/Kuv0xd8GoHnYv/2LWyrNIS2L6zDmuyuriG2tdNByFx6Sk2Dy3YioRti5NOZyk7AErujitvWg9SmrvGeuXTnnzF5mqpA/GrRG/EBls6ck6n6UbLi8TPK339XVoUO22aAj0r7ZPa9/kC1CoDApcbo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(39860400002)(396003)(346002)(136003)(451199021)(5660300002)(6862004)(2906002)(33716001)(8936002)(86362001)(41300700001)(38100700002)(26005)(82960400001)(66946007)(4326008)(6636002)(66556008)(66476007)(6486002)(8676002)(478600001)(186003)(9686003)(6512007)(316002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VEAXEw0QtEhmoZxxarTmsPcy6hbPYSe54kwyUrIrb3G3hOTfgJbvsj1UADrB?=
 =?us-ascii?Q?17iwHfAR3Qru1pH4KbFf82adosC3x3i3jnWcq/jur78G1ga+36fSqqXvfIBu?=
 =?us-ascii?Q?pgSwBNviy/Qs0MlsHmIfyf46N4Z8u07pniB0HhSpsiFXp0S/s7uI1FP9XpfH?=
 =?us-ascii?Q?RYtjqgzHNzOIZUxFWCulhbon2evkQLyviD14xdjuZYzBiHrrY6rp4MxTdWbU?=
 =?us-ascii?Q?LgsS5XEAsVyECrLGIQO1v1G7wnc0LbaDJtUH3sp4aPiKdaQeauXeeYzVyYIy?=
 =?us-ascii?Q?HhXRDUN4wmYqvwuClS47daaR88cCs0tl+ockZxOMfINxJ3yugq7UpMqTKeJL?=
 =?us-ascii?Q?wzLgafm5U1N8zDrHTmIs2y4Z7WdeD/dPdKcagtLpPtA3Q1TArGJvFJyWGw+K?=
 =?us-ascii?Q?W/nwW9zicAwoxscrYHuFjr/1GkFI7sMRbN3Fjhv5XdQSus8ULfG5SA8LxE2O?=
 =?us-ascii?Q?4Dvo0zLE83h4knt42e3mZ47iBQu39eH1FCSNanCEU3Mve4WnPD8I7SzSglXK?=
 =?us-ascii?Q?Azv190etkems7ouK9J9TyEZ6hmE9YskmPHDvxwwTASAh+xWHNKPSMOcoS/K/?=
 =?us-ascii?Q?niuTAmlLVZ1Cq1cXbUvk+ymxhBrSS395ORkxys25ZxWTq7MIc2kBan7H11IG?=
 =?us-ascii?Q?WVvxsGaksZDf4ZRcHaaz8iZniWvqWsx74BXRklCpTa4ec4Z846jQvcP9ljbB?=
 =?us-ascii?Q?7EWvVFjCwcLjFcQRvYxYuoK2lbjpe6bnmpdG0zpSj4SsnZwiNpQOyzFDqOoR?=
 =?us-ascii?Q?M1ANlNKnEQZugSVG25XUC/Xom2BRhSx93IJSV+mcJmKpRgHnUD8nuV1t3k3e?=
 =?us-ascii?Q?RXEDfQAvWosnMQ73s3GRqunS//i2MJan0oQ5dfHjs79gqi8w6tk8mtyBqBQ6?=
 =?us-ascii?Q?5z2/nMrG8WJ/eXJB5BxAuzuNsFUhHNTcwQzko1KCFCTxgy9hFbYOnfE9/4EJ?=
 =?us-ascii?Q?u5StP+I2tMor0XcM3GIXVF5Yx4YNrpoKfI046HuE0pMo/inwGbpTyOCHRGDj?=
 =?us-ascii?Q?/DjUQdrYDWfA3eQeaWb5Wof8NB5V7rUGtSvZEQXBBiZAPqydpzCiSbG8R6ml?=
 =?us-ascii?Q?+/dM9nKl6/+9qtMBo+GhSsAsbWw8NchMW7nJcaZuQOFj4aeZ/PVPEyFjxfH8?=
 =?us-ascii?Q?vZ3BpqriXLuvP999Aqs9f6YiGDttL0PZOA2DPd6se3YSV7SgJMXESJjDBYbb?=
 =?us-ascii?Q?abMJvP3pb/XKZZrPqbnOKbsB0ieyJ+Qmvc0k1GMvoOQYoFWR86puqijJZOFh?=
 =?us-ascii?Q?vBB+8gicm2TLHtQcqJsYGu0clruz6wMVWkmBEHDeJfHMknMzeIZzf9CgPmWi?=
 =?us-ascii?Q?p84xCkfyE7u8CBDj+32oU2pA09Hr6uuF7zx+UYHvhOUlVL+iKMql/1R5R6zv?=
 =?us-ascii?Q?zJWrOeu421ewckiyfMmztKjnB/5CN+F/OHhZhg0PJDcsj9SsBC/fF8Aoiyot?=
 =?us-ascii?Q?/b4GqbSWoZLO8VCZ+nNRFPzSGPExyFTrWhfEKXqD5xkBfjHIGBnwpUOw5BCZ?=
 =?us-ascii?Q?31n5Gq2CuMdiyR2kwGq8TWAfJJzlMLu5g2iHKUTBxeX4TjEHotWxYuh3vl8D?=
 =?us-ascii?Q?9U+yX6kmVZs9wNk4PT/un3xsmh47BXfaDJEKzX7fJvNG6yhglzylp0d705CJ?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ffbb566-04f7-4ca4-80b3-08db7332fb02
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:11:40.1228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkw8BbMFe2c91YJDCGv/XC1L1ompqiUQ97tOn4CjkXoWedcDkA347dqisMEr623m9at7JGjj2CotkiJvIqhYBvonfXRZIjKXPy+cHHxraK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5429
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 3/3] drm/xe: Document topology mask query
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

On Thu, Jun 22, 2023 at 12:39:46PM +0000, Francois Dugast wrote:
>Provide information on the types of topology masks that can be
>queried and add some examples.
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> include/uapi/drm/xe_drm.h | 24 ++++++++++++++++++++++++
> 1 file changed, 24 insertions(+)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index f412150fa636..bcec0df6d115 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -212,6 +212,9 @@ struct drm_xe_query_gts {
> /**
>  * struct drm_xe_query_topology_mask - describe the topology mask of a GT
>  *
>+ * This is the hardware topology which reflects the internal physical
>+ * structure of the GPU.
>+ *
>  * If a query is made with a struct drm_xe_device_query where .query
>  * is equal to DRM_XE_DEVICE_QUERY_GT_TOPOLOGY, then the reply uses
>  * struct drm_xe_query_topology_mask in .data.
>@@ -220,8 +223,29 @@ struct drm_xe_query_topology_mask {
> 	/** @gt_id: GT ID the mask is associated with */
> 	__u16 gt_id;
>
>+	/*
>+	 * To query the mask of Dual Sub Slices (DSS) available for geometry
>+	 * operations. For example a query response containing the following
>+	 * in mask:
>+	 *   DSS_GEOMETRY    ff ff ff ff 00 00 00 00
>+	 * means 32 DSS are available for geometry.
>+	 */
> #define XE_TOPO_DSS_GEOMETRY	(1 << 0)
>+	/*
>+	 * To query the mask of Dual Sub Slices (DSS) available for compute
>+	 * operations. For example a query response containing the following
>+	 * in mask:
>+	 *   DSS_COMPUTE    ff ff ff ff 00 00 00 00
>+	 * means 32 DSS are available for compute.
>+	 */
> #define XE_TOPO_DSS_COMPUTE	(1 << 1)
>+	/*
>+	 * To query the mask of Execution Units (EU) available per Dual Sub
>+	 * Slices (DSS). For example a query response containing the following
>+	 * in mask:
>+	 *   EU_PER_DSS    ff ff 00 00 00 00 00 00
>+	 * means each DSS has 16 EU.
>+	 */
> #define XE_TOPO_EU_PER_DSS	(1 << 2)
> 	/** @type: type of mask */
> 	__u16 type;
>-- 
>2.34.1
>
