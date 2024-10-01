Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FF3CF3188
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 21:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1F10E31D;
	Tue,  1 Oct 2024 21:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ackiZYv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEA510E31D
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 21:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727818350; x=1759354350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rfQ7aqXO8ZoaDofy5V2zmIkaLa770nGuVd0++spTOYs=;
 b=ackiZYv/gCmqpggggtVfBCUNZD+kVQ5tlX9lWJxhgNHJ650fgIDu6pHE
 RQegcg7U+h1uRX9Exv6vZGoaC1ScbYVEwjm5ZnG8F0FEOdGK6ttKJCGtK
 DiWXYbrh3pX4CE1yAawobxB5Q3kLHkfWwKwOmHXvXKoCeTll1sMCwLiX+
 +Vr9/tEzVVHEZ1TxN8aGiWI3hm+NTeVkAArOghsFunngGFtH5g+AVA+Zc
 3CBc/glJFAqZXe6UR8ikHZ33/KMzHNM/AFJt5j4Meg0hf87oyHiw9RPr4
 tBTl+eL/o9ntqZL0CE/jTGHBEKEuwv/eETYLcEIUHtYtathLwA/jzWesZ A==;
X-CSE-ConnectionGUID: Q0aPlqDPR1GzykZnQmfjnA==
X-CSE-MsgGUID: JB8kt3dfRxyu1tiL5+eOXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="14599546"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="14599546"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 14:32:29 -0700
X-CSE-ConnectionGUID: L+nnIT04QFmVOv4D86X0zw==
X-CSE-MsgGUID: jz2wlwgdRV6z56JixcXvkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="78342503"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 14:32:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 14:32:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 14:32:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 14:32:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPURaq4YOrcKR3exh8opZ6saHLhVoZpGtCjzyYNKJJa/HgeTO5TNPvOsfCvVj/rJRJOITX06PrinNgxd7TQHdRD+fJjbz6r5ONGYIaY29kmYqiWAZIXVlAdDR/n8vV8UZxZS6Q8bFRsUCS/UQOBdgx7l7nMXfcf6kKKND+EieY5l78ZygMiVo9LSSLKLalVdkA1ZKoWGX1j+LYOPNY5GKnuyWSiaWoAs5w4e2JT/0a3pSnv6cxPZ5tXMxOjmwhpmnyDvbAIn2M0hDJIvJnx3vZroihGcYElJJLxg0f0Kpq4AwNNrkafEQPhYwSawd5BLC6fVNV4gNkcD+iAu/wjG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs9KKzM+F8LBBUXhd+MxKlkEiOojH+BU60jLV6SZWSY=;
 b=J4WTNym44n8l/AKEwhQd0wpLfWkP2qnCf8FLoWWv6bk7AsQuqbcWi0/BtkE9z6zDENAKxykNVZ8/BSC7egLNHqDpBh0hi0w/pZz0GrE/3RAnQ50YzlAPwrO5KktqR2nYTXbdYGrVxSYkSjiRsJhT1HSv+02LNvexe2P8bg8XOUzm7oAhqWHA1t2eZjq9N1m5OIvdMfd2BXvNUOut5WjJ2/t0IsxRjeGtLza1BBiyC2s1uVvqdn61dlzhTj/wE3L+tbaJjd9ma25H829qV/qX30hq/brpRwccFwlhnfiDeInJNktpM1ClG9Pi7s8waeF4Vk2OzCKtpp/2uji7IlL7CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 21:32:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 21:32:26 +0000
Date: Tue, 1 Oct 2024 16:32:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/pmu: Enable PMU interface
Message-ID: <suyim7ey3uldherzlnfm37uaqdcrekmub2w3nff34q45ju7g2z@dxhshdswhsj3>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240927002344.2565250-2-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:303:b5::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5110:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d27a27-90b5-4d25-cba1-08dce2608b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jvzi2b1U4bLoRRxxZ55Qkn91GtCnQt/Mjta30qzKyaf71oNCOGHAayZER7Bu?=
 =?us-ascii?Q?y+g03kr72IAtcU4J9QnmMezeOlez+XcrAo8drNgGIeghV6HtP48Df1eXR2VE?=
 =?us-ascii?Q?me/WxVe30Jx85f7LQhE/3DYm1xbi6at+b8lgztUpv1cXsJSDsPjNxD0klYLy?=
 =?us-ascii?Q?0nOYzSZIhoKTvqrjtgru+I0aa0cChuvDv2H5m9ivCOWn4qsD7HfryifO66mD?=
 =?us-ascii?Q?HpSt1kOT5Fem/8dDe/XJr2h/ZOF9uSdTnOLmmI0FLtGC4v8q3KgYI9D/q5c4?=
 =?us-ascii?Q?o2KoD4R26jI+ph8gW5Rn3S1tGBig6W845rwqRt26mxbaLyutvzGVcaLW1+As?=
 =?us-ascii?Q?PD/m3D6YLPd7yjNazVGv+/jtA0iIu006EyW54OQz0SEz4yFvmKTh5PkX/U7X?=
 =?us-ascii?Q?JfrBSyomVRWdn71NmrXzKDcX3kza139OgGyejQzND+ohBzp8JcgcVFqOEejG?=
 =?us-ascii?Q?vfFm+MCoeQHyh1o1F6eAdH0VXoujuJqAYhO7MXGtJIMudC0lAF/Ggoaa2Z66?=
 =?us-ascii?Q?VymAmuTmvbeYjOsZpW8hWdMM2YbVnrUm8idA+5SDN0euGIGyxyCy9Yggd2T9?=
 =?us-ascii?Q?HJOVYJqIY/k2aHNf/w68hjGeObsSQyL47BYUVAOlxuYuaGAaOhBkPbMYcCii?=
 =?us-ascii?Q?80r0grx/jF0YbVHVDPBUi7hMBsOJDiUHg8/VJ0bG1AWsSxUkEhmqMfiP9Hgp?=
 =?us-ascii?Q?jx4JL/J4ZQy4kCqNbZpzgCsYMzLZ4zLadlJGHJXE/aSJHbISRoBorZft8xyY?=
 =?us-ascii?Q?fmi3uRLu1cWm6z9F0xFHf0HwzwuX3ekB3HzrgmGexhMmQTmLjpYM1u4zAiYp?=
 =?us-ascii?Q?f487qJfeNpJUTBgP02Q+PrHZPVnzw3YHXsDfES9KPpEN3vUCL8PFk0iC1ufn?=
 =?us-ascii?Q?185Q/WzIuRkehKdgf8TrHIpI3IVDA5q5nAIPgBK+pl/M6LfOtAFBtPUfyjqy?=
 =?us-ascii?Q?RGjnoemGS2tUA34UU4YdaT71rZ6AqIUO0E5ngBEPUaBp7mK9skyoOW+52SiK?=
 =?us-ascii?Q?Qqm9NfqlS6LWvCLHJDhVgRUcXboyGfdgX1nodG3shVtLQNwutIFSfu9uhFLH?=
 =?us-ascii?Q?zKqjnpzRw9vmrbIiPiK7WidArKVxV/Ry4OnNacOyTCgP4MBwyI477N2W0rGB?=
 =?us-ascii?Q?fpJWZ8OJYKVEwElsLwOpOkAO2CRCBdH1kOt6KduxJLSWPG8wMAWrCPj8AZ13?=
 =?us-ascii?Q?o8fzY3dHXQQtmxksTczKy4ctyQC1ys4qS2VxrmbtJejPYcviCHbD4Fs0k29a?=
 =?us-ascii?Q?Y0TyZ6fcHrypV04Wy3hIJv9Tm2C9HqBsE/+5W9k2XA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3JhPI+pYQH0xpRtoSvwLQK6jGBinaznvYEn5gjf+rp/Q9NPOTbZ1grrF4Q3W?=
 =?us-ascii?Q?jHspVm/6+VJnC95ov3Tev+gkk3ADLBIfUn9eUGx3O6lHHVAktMwcSJEiqWPX?=
 =?us-ascii?Q?uv8tTQ189SO3gEef3h12kDrho5hQNnpfVErVz3e5gEQ6B8vJ9k0+Sgkf1dNY?=
 =?us-ascii?Q?PTY64fQhjh8Z0wxaNqeIyAC4O8iYQqp/+mlu6qSsSo/gSBdU3e5rZVlZxzgJ?=
 =?us-ascii?Q?plL5rm8iLP7E02GBrWcWbybekg7dNP/DebxBbjlmQO3SuRm5BobmBRQskAEG?=
 =?us-ascii?Q?vQXv20x3tcZRa9vtwHUzRP4dhn/Ld3wCht59Y0jv7Hzh1f+eDxG2MbNdn1DH?=
 =?us-ascii?Q?zkM2DSp0zEIQVfJoOCAfmdoL0JlxGRPbW0HCtk9seCQQplEYMQla6K/UN1tC?=
 =?us-ascii?Q?u9ziHxFj8svm96OL35EYvZM6f+3Z6HboqMC1o64mE+fYjA4PoX9ZRzWDA5Dj?=
 =?us-ascii?Q?9/7GRjw2dIUqiKDpgvBzPHlB4mP+kFSURt+3DqTMhzJUU8zurXuO6kih+2ay?=
 =?us-ascii?Q?Jn72FePCVkTFVFO70QLBPGy35lMmPRssvFQWATazMC1CpbuOVHPhgGeovnnm?=
 =?us-ascii?Q?MfBOyFc3X19kFptKRHOFED9oqvyc9a1EITN9Fj207voX6eWz8FCDOAxJP+VI?=
 =?us-ascii?Q?q31pn6+2zXbmODDJ+BnzmLNt8DEQqppEHBQhvIf/U/0PK4mYDXFYkVTpVJg6?=
 =?us-ascii?Q?dbb98h1bO6pKgMODlxNxWlHEG4JEpw35w2q+sSQckG87G61EefoHiYqMvkVi?=
 =?us-ascii?Q?G79mDYUGnw1m3s+TS1AVUIaLsADNPSxrhZX4TMobuHST1oKRrt0OMA54XOIu?=
 =?us-ascii?Q?Uvqrt77L9yak42hGz+jgmwwekYQG1CPPUms6xC6JU+5FVZ19muLDakORXkz+?=
 =?us-ascii?Q?G5jSfb9Kb4FW+5gwJzZFxJZHwXrMh9j6bnNYW8G42H2XWvhseU+vlg6EdRk7?=
 =?us-ascii?Q?J+RfkIgZRXMhun3oa/VkZ/9FPgtF0Ppsoh+HdAcHYlIk8mb898upmn9eZrEN?=
 =?us-ascii?Q?k6aUsHZ97bGQ+6i+9ucSx3bXsEX1zI4nIwP1vzsdotK95fiCXVHZHf4o+/Xp?=
 =?us-ascii?Q?U4gEJVAcxNA/LLYEVa/in8yOAW5D4542ZxNHIjTCH2mYRGKX+/Fse5C6h2Zp?=
 =?us-ascii?Q?SmrskrGBcdR7vYKY084CSs0lkYor1nkddCjE2Ove0l8KpoxybRqy4L84U+0N?=
 =?us-ascii?Q?+RNJXdyuclQoQvdxTCvtWy25vz2s302sdNXIzUSQMUDfRJtWTIACrLnUpE/s?=
 =?us-ascii?Q?CJjG5U7Lok2SQ+Nne9LuGyDg4oBcoBZ2Img90+fkFoiEZkqIqbS2DmW60yTG?=
 =?us-ascii?Q?zFLKocQR6xjlm8pSmsWogRoWA6m/lQL05HjbgNs86bs3OUMRvDyOY7rXI7kT?=
 =?us-ascii?Q?Hu9HYxZUlGgLDiqF3KQn123ZaOPhiPHUN+Q5eVGZDgsuZpaWP65jCTt3cc+T?=
 =?us-ascii?Q?Gp9kYH627PtZg5kZSLnV+RvkdWu78bbGXqDV+u0fitNXWKaHA90OIKsymWwn?=
 =?us-ascii?Q?ATKaOcPyYbyFMts+xq1MuN3tWpc50llQFp78QTXZo0a/gZyqpoSsVHruakqu?=
 =?us-ascii?Q?5ASTzlQisgLBFl3q9Uz9GxxN00L02ejsA1mXQtHv+93ZULjmjy7MU0EW5Mvu?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d27a27-90b5-4d25-cba1-08dce2608b39
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 21:32:26.1950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW3re2DR3CaNaB7A7aXRvMMjzhVhfYvwA+ju89vukfHYutDRWOTo4P2PfoQIRKn+hATxOjdZu58Mm3idu0L5DghtWqqf1TxFr/4PB3aG1YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
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

On Thu, Sep 26, 2024 at 05:23:42PM GMT, Vinay Belgaumkar wrote:
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index b6fbe4988f2e..2c5f258eee3a 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1389,6 +1389,14 @@ struct drm_xe_wait_user_fence {
> 	__u64 reserved[2];
> };
>
>+/*
>+ * Top bits of every counter are GT id.
>+ */
>+#define __XE_PMU_GT_SHIFT (56)
>+
>+#define ___XE_PMU_OTHER(gt, x) \
>+	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>+

why are you touching this?

I thought we agreed it's not needed at all on previous version of this
patch: https://lore.kernel.org/intel-xe/602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com/

what changed?


Lucas De Marchi
