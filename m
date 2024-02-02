Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FF2C48292
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 17:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE0810EF9D;
	Fri,  2 Feb 2024 17:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MsFK29Aq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7C910EFB4
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706893232; x=1738429232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7xE5m8Vo76iLBEGkr0g2re5BXpzD7/qW+MMXD4e7iFA=;
 b=MsFK29Aqg8x7/MvlE/sxG8sV3tcmBemNI2RQ3lYDkrsqxe9yRHc5QGdm
 3yxBclzZzDs4bnfgednW1/Bn6Qe5oftFi17c11YMZziGgJ4apvAx6Jrbk
 j3MSlkmAAkGYDeRCkQWSVVGX1zmR1M9rfkuwRIoqcmUElueWj+Z/qbkFp
 7BFi3wz4PUlvcXE48MB1zl5/iaIKEknWP0B1zUDjQbSPi3SXGeIJ1UWBc
 cn5JY3xNmYMI+mFkh0LZdver18z81uqAIYMjdVTbvSZbp1dleuDNOPMQn
 xpyb1dvOLX2Am8O8abZAAWZnHPO/4J2wl5FNrwafWsbrDdGjw+foRzax7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="110595"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="110595"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 09:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="932520541"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="932520541"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 09:00:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 09:00:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 09:00:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 09:00:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEy/s/EI9juho3/CwaR64CYs9pZikWoNLaSz1aA//Q7MUf6qdQtSUaRp5RVEenVIMGftB287HO5v2IhGaCqSEUPpOu6qqvX8BcawbAnwp26VgREcN2pLnn1z2RySapGiW7W2NLq1JiNXqLEVPpMSYalOkOiHRlG4FL5dcCS6SpoQECsR3dKr78BaFzAVQNk8+bYYRy+rZOWCXAe68nVJYSvTPnRlOFO4J8qeJvHvndXFm5zl9WhgJVIdOvN2yKMVHctpEpFV0zPyXU5wtsxjlp7qE9xTE/bToEoGX4QGgJivlCdPyYKLeilKoYi7tJv9MQB6nTnHuh8zL6ezWuQLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO5WefxSy4+5rpHS4wslbNLDDz2irKeyHIn2w1pqaxU=;
 b=FGdD+u7tew5yOH0FiMbFrz45NcEvj2pfI2o3ou4SynQQcr0oHSX3SFD1LoVDv6ZIVF+1ymaOGj2r7cRNirn890s8Oro2oRAoVEoRrM7YjSAS3C3MqnbmJWEh02b/fGFeYPlkcRbbaGphOt5XiO7elJg30WuQdjCItfIi+pMZyi4cr8lAbTogAqkqiXUxOCuxpjJECBSgxHAKFOCNWBlDR+PfEun3OgT4edS9K8AhoPphSdJ7+X0Az/HEYoS8/WIlDELqj5OEdmtgD31Qx9Q3Nvg2KdSir0+C6gV90SlNsQ+m5extm4lG/wHvZ4/3AavutoG9ZhIMpa6akNm27Akm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 17:00:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 17:00:16 +0000
Date: Fri, 2 Feb 2024 11:00:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/guc: Add support for LNL firmware
Message-ID: <b5uavkhtyh6blwzrxf3qrjfrmjboziigpfajkzmjde5zlprtdw@bzkezcjbroes>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
 <20240202073050.1986142-4-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240202073050.1986142-4-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:a03:333::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4835:EE_
X-MS-Office365-Filtering-Correlation-Id: cab77d40-985c-4186-fe5a-08dc24106e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +8pAxbGcUEvmcOT41liHPwFF6T5rasG86JmxRokTYwFOObrL1C/wOWI/Kss0YQhO+ouYSV5SKseEdcKc3nUPLCQGw4OUdqNiOOASR5SLufkEJVzjYiDZ6u0MMF47peAZjsdO0ZDZy/HpRxu/HkaTVGbwCMtIPcHKt6XIoDjqDJj+5s3Ya2uAH9vmWzg3RR9npngDYx4akVwrXTJZ+UqEc5cRGLOHcLOVkNQMqLXYo7+8rkfWGR71208pfqOtadNYywJyj6MUu/bvE9YWPHe9lSO2immQ80zbD1cA8YMD2HTeygeHB4rg+M+hxGB0T4m2p8THaCE2Pq4po5uuT7gLrCjHVggVUv4ag2gH6e4chEu6GfBYZF0cHCIWgyF4ETqusQwBD7ejAtSQ159f3ALKF4qT3xZlIyJB0Y59yyGpriUVytPlcCQg7b7n1fL3rt0rgcl/uQ3fq0ZqeaQZLZGVgd/NY8pYs/vzFyQ++bdohO3ZQzIcOYrouQIBJM+32G0SNSP68KINDnCLcE0XVxTiF+1dlpcwrVA6NXGor80AbcJt8ghoAWmH3VxdLcQP0E5Y75lRQ8dGBMLpjLyWBFTmb4XJVMN0Fb2ksiUUz9+pf/tiM5fs5C/XqP6384gY6HCP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(33716001)(26005)(41300700001)(316002)(6636002)(66556008)(82960400001)(66476007)(6512007)(9686003)(478600001)(6486002)(6506007)(38100700002)(66946007)(2906002)(86362001)(5660300002)(34206002)(4744005)(4326008)(8676002)(8936002)(27256008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TN6K1rb1jzMCXUJ00g6NrsygaM5GvtJc1nR/c0tmdyAQn8oO4Exa+4RFiX/6?=
 =?us-ascii?Q?rQjADq6/V/4ug4JQFBLLcknMTOWq2K+HS4aUM6Z3WVA3yb7yr+9RKSBdtD3f?=
 =?us-ascii?Q?uoMYpjtaE1xyEgt/wauL7yI/s+ACkuunIWAQ5y20n8zIxbiBQqQV/HvH6ckF?=
 =?us-ascii?Q?2WebuCS3gbQF36M9l3hwW16+ewkLLdldgK6WN/D2pU+qZVCBW8zlSh4/JvV8?=
 =?us-ascii?Q?/kFwjIaOOTsvASLx8H0ban+kBAmTQgMzUnN45imGVWpVZlY9oBpOLOPhZTg7?=
 =?us-ascii?Q?16lM+hyOc6RvZNi1fnY3Luu+YHzKUlZShvGjtogfh8BQQ47A36R4e+5SZmK3?=
 =?us-ascii?Q?ZSkR+7lOFwmZ2mEhvP8TsOU5yM0jF8Y94YAUr2D7DlapJv3P++/tMk84C3hN?=
 =?us-ascii?Q?PIdp9GuH8GLbLWjIEcdWMzL6fLZIvCPXqWPWphyQlX/U3mgCT/PDtDzGOgPo?=
 =?us-ascii?Q?72hX2vpe1RegImRly20oBINZ9Ewg3YZXi8lnhG+6/T/qmHbcrwwoCFMXQ62H?=
 =?us-ascii?Q?rENH3G9kw9a08MqElpSt7RoL4ZASOMrYcPNJdv2NzC5URc5kx3SoAp6afiTG?=
 =?us-ascii?Q?Y9t5A7BjXynsvZqlf2a9JO321z6bGbJIsQbsQNHv2nMJwieoHP3YbRdWIZCZ?=
 =?us-ascii?Q?N1OvWZbcTiebNscadUrSD+TsNE0W1qcgfjwpYgwMu+aSiX0AkBTMabG3kIwG?=
 =?us-ascii?Q?0+v6078f/vBrsG/a3ZfnFPt9KNGTYjpXrOJLV592GQ12Y3x5CpUcJkHw1XXl?=
 =?us-ascii?Q?NvgEeRQDWDYuY4R7QhT/VjV2Mzq/hDdAWb/8qT2hnFQNyz7hnhtVjX8pc7mh?=
 =?us-ascii?Q?DFfWu6h4A8qgicq36mjKCW0MKmLM7o2x4wJX4Hf+BK8tgn+zhsxsd+ySNJG4?=
 =?us-ascii?Q?EyXTe9HLEG568+vJWRJadbPGPvL7Whws1Q8E8ENDZ8Mc48rcs1MXfsiauajb?=
 =?us-ascii?Q?BJPucXFpb4adHx0ozBpuUBCFRZzG12eCQYaEtEgac1k4aXq7qtv+jRN8vQ7a?=
 =?us-ascii?Q?n6fi8uanLivYGw4aGw4M3XUpF7TfXvNh9B8doJdwcjQfkZUssGOSZC1T6WC4?=
 =?us-ascii?Q?2fLNvmUy9NbL5sBG+f108et1qVS6b43l9UCqCup1iR04aaD6/F0GrVtT780/?=
 =?us-ascii?Q?9yeTlb7cKPNsoDQ2yB5if3dtoNUk7tVTu+4g1fy4+txtTIzt1OWnpTa3bOS4?=
 =?us-ascii?Q?159XVgVHlv1IGXnsPPhmtgJFu6xtF+w1lpeVT2qepdNe0WEMHVQfjEsBJnRs?=
 =?us-ascii?Q?5LpPjqgeVKrhKVmfYFOR2PCeYHZXCItHwKKVA+OzxAmFEde81rEbADYHm03O?=
 =?us-ascii?Q?AsY5xaDUOxBF/cbga95XbvOFmYYrLylgaCOJnO5CrWEScijTd+IVEssrENvh?=
 =?us-ascii?Q?nCy/HCg8kf99LZUDmhAv4ki0Suxx/THHnHUUjQDaZ/aPlu6zM2VMtmdG49lf?=
 =?us-ascii?Q?787xrCQayx4BPqQlsAHUb2g5OljhDg1h6HJGzQjRyYvJ57wcxT+HTtlO6jWi?=
 =?us-ascii?Q?h/XCrZaC+1rVmO0ADmMtVgN4kKfxxDNgMlkTL9yzwCMUDP+VctPVIoeqpMzc?=
 =?us-ascii?Q?4iXmDD6ctkuQR0aIsLhg7vhKB41K/lsQn6AeIq/ADjF7nBfUTE2S7WNOyILT?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cab77d40-985c-4186-fe5a-08dc24106e12
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 17:00:16.5492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLzVts16ldiDqRfbKsjVY7oIPytMI5cSnVTqjyMb9+vzlwPcRVc6HDf2GFbiwvid/yaI71w7cxRX2PezRd4+r4P8cKtl8zM+3aS7ZUiyvLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4835
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

On Thu, Feb 01, 2024 at 11:30:50PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>First release of GuC firmware for LNL is now available, so start
>using it.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index d896c98dd0bb..9814c5d8538d 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -103,6 +103,7 @@ struct fw_blobs_by_type {
> };
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>+	fw_def(LUNARLAKE,	major_ver(i915,	guc,	lnl,	70, 19, 2))	\

					  ^^^^ that should be xe

with that changed and the same condition as patch 2 fulfilled, feel free to add:

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
