Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6B9CD5BCB
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E4D10E3C8;
	Tue, 19 Sep 2023 14:26:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D469210E3CB;
 Tue, 19 Sep 2023 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133588; x=1726669588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=rFmabiJE1sZD9E3fc+l4fXYsEtxezeIXsDspKh/6TlI=;
 b=Fj3Xe5SA1JX52svHtRUU+KvKyCCwALD+AGJERY66tZa0Zy9aXXw7xI5u
 ZnHQNnR66dxoqrt7AF2l0nviPJzpeFHx7RNZf9ipr23M/DMJviEjQyyPK
 00qot1myF+xKsePXtDHfEic4LHAdQiDC/nGfBA5sJ2RycMBuVh8+NR+SI
 DLTRr4SmhVVDrx8Z9y0+BpKVrZXi0pewSHe20s9TFHlKqr7REYqZ78Wb3
 Plt2hBgYgc3TobtkunDlX3+xLgTLsh/Ma6nr7wZD0jMPRjUWUAQcz4kEw
 0tudVQcThs6YjdkfPNk/IQUM6x3/b2rwAzC0bFwIgA1k3n7s4F3g5Y/mF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="383786122"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="383786122"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="781319681"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="781319681"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrgDo+npb5F6kO6QfGovlVcfCXwvcznh8+lgzIuNq3ustEsR5hmvcKcfEKx/d2spxJwth1rm7jzU2eRmwPCXd9J/sA6+NzNHjkmDpcER0BT8wO95qEK97mTbSh9lB//f9VWyK6Vh6BznVHYQRz78xTpj4m5MIWqHIA6gXCsvngVrm0PEWNaWeCcyacClRTnpCuarQEyBWeBxRVWXpMZEMWtEHapfz1ADUYxqAYcUShfxpSFL/QN8gdakjsjSRuHwnZV86tH1zuyjXs6FdjnrJjP3wconyt0i6VpKdP6HFR405swRg31fphwv9TqwIJ/Ns5B+WHq0wag7TF1DqP5+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05XjKV3aAuQ4dsc0pvK2fRucgv3X2pADUaOzDuKc3+c=;
 b=P51qxlTrmf2kAqGUfNC4ds3kN26lyCqlluC2EqvuvkoAez2jQ6d9SgZkuUrcZruYfOJazx9/3qG0zVg+eWvjXzkltOGEKcLPGqAJ1DKTPvcqiCNm4yZZ3rVI2jY3/AWoxkTGMizyXZV3LNbbKCHdAXcdK4CZT82WklbJ1szX7rGXPF0jvGCKA9bK8X15RG4B69C0zOm80TAHjSqCCSIPo8zLvsT+8p6LlUuiBiptWxUqoTaJhRTaA2Jx4zSxQzBSyH5e7Cl9D6fvv63BEaKUarM9RHNwpkE86m/N5BmkpkMkg4sZ9lXhv8rUl3GKi3mo0IQ5otV0coQJFmYt17YMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:54 -0400
Message-ID: <20230919142000.91363-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: da4d7833-c3c9-4740-064e-08dbb91c5e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jY5buwxoFB5L1oaL07JEFK3YG4Vq9PlV4wBz7Q/lsu99PRw1BSjMR36QOVBi+c/1JaWtuQs3j++aw4le97CbK5egjo0xKB9pv1j0vLdPxknJ8RnikM5tZjte8VqaBn/AVTJZ1ZS4RSjwzNSjru2rHjz+4WXEeNohX7OFVwwH93Hfa3Ct48O3JWI8tICf34iNRMAckyHcWzL2XZI/qf7IBvwvU+Vphxr8Ll26hGBXNGvmKiK57eJwdEM6+Ks9J6F727xZDRkDn/mW/3migKLt+4X0ISJqy5uFXkKzQA8ekth/hPBKD9DK/ban3BT528hQmpDy+MVFX77cWay7y0DgtNhlwXZgH59ciBNj9WHb9/eyL4DW+0F0qUE8jFxeZChhfsgRmK9ae2hD9MEBLzAHZN0KgFwFrZL356B43IzmE9nsM3bdWgQjprqTv2/9rJRrQI9GwULOc9DrGpY+D4cZW8YIERFqcpPAfIoK1NIn+IkOEmVN3uPk6JS0rOS2YtIrsHG+eJ8/VWzHNnfizvHjzCU8i/gS4PUgp9t9HAvgNEZygaKmfwVS+R2io7VQ0ets
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(450100002)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ESYmPi2M7GgY5B6EAeWqiXyggGr9ygbcAYEvFBb/SvJXRI5hyC/QQkBfDKu2?=
 =?us-ascii?Q?6T19IKNp+yiICG3XQaC0WXnq/p9zVfAJm7X+R3ARR3a1n1969i3xD7QVAuzS?=
 =?us-ascii?Q?WkBck/b3OHuZqykyMXJcQ9RvIDgXmTspGkdDmveBxyxRYIiYEpnFofs85J8a?=
 =?us-ascii?Q?CF8NJhXNB8WkG8z4iupRP9HA7GnVJQ5EVuE2urdrnRzQc7uTvU/vZAWbIM1g?=
 =?us-ascii?Q?L+q6q18jj4lV4uN0HZpGXZy7fr3yVc+Iu57yTZaU1OOX4oOL8ei7KmdaKNiw?=
 =?us-ascii?Q?AOk1mCSq9HuE19MddO0Dzs7+CR8WzZQOKZzHGfwdem6lTW9b85TQi9ylppRm?=
 =?us-ascii?Q?o2eQh8n8hHe4e7TTSucSHBOFywx4pVkph0qTJ+N7mksiveDx/UUTUrdU4o0r?=
 =?us-ascii?Q?Ky3vqCN43X9TUuN0jg5ApY4SljeNAnnNSVXZzI6NAs9qkD0/ajL+8e4S9lPY?=
 =?us-ascii?Q?ZpJUKu2BoLnBmeJl8PSZ/DbPuLeuUgY1W10dv2+ycbMQdV8ODyqerURIyisY?=
 =?us-ascii?Q?/gXgj4tnJ/M3Jg9bcM0atE+uLa0O5KBd4c0ekrzzvZc/ESld2BhTrxWON5Nw?=
 =?us-ascii?Q?3C7v/j8KvgJ9sh748yolHNPg9ubtpds02n4QYH8151VDzBwINYoYcv9biFAJ?=
 =?us-ascii?Q?+RRpeogxTc1ZMMNEQgbdjVSJnz5JQAWL5DgnucqA3ifCGUkwOod2j1WBj5Fd?=
 =?us-ascii?Q?Kfyh1Xba52aqhe2634h5vApJWvQwar0+EDLktHgYpX95Awe+78hmclyNBGA9?=
 =?us-ascii?Q?2A9KOwsAJSmMWfr31UA4vuwRF4M4nsROr3aVBfV83ojdTMY8Ybrdfk3QzNdd?=
 =?us-ascii?Q?4jViVVDnUnyif8F0SSsOqi06yBKUHQNX4BFZx/rEgti07kbRy0iedyMoI65m?=
 =?us-ascii?Q?NtriisTU/URuNWT3fn6kQFr4KObpCo37J/k+IaKx0yoAutEj3aWXEmD8PLoI?=
 =?us-ascii?Q?GCNVd39VkKn0gXMZxSAG7l9X5UY6wlVkCZLIs5GqScPkeomIY8YsNPa2h6aP?=
 =?us-ascii?Q?jqnMkiAKbSvsci7DjqsJpUGc7jLBDTi6NYlHqd1VUg9w3JdLC38ms5acDYcb?=
 =?us-ascii?Q?nWHlzb74CNg4ltgim2SGMCcO3IN/lTs6I5W0lJPzV/JWfzf+NvMNxkEZx42V?=
 =?us-ascii?Q?VctUEAkr3ds4z/bTlW4N5tYier6L1TqRuEZO8Z9gGZZuqQZCUlBGKrIIf7L2?=
 =?us-ascii?Q?FChvjcSeU6NbaxbVpMeBkXptX2Kt04uiSYSo8etii1GysTOKOvA4kBu2hpt0?=
 =?us-ascii?Q?/J0+JTjOtDg//m7TqrGWcL31t8FbmnMho1IULkctoKq5Gfa3P3EQk4WVM2M/?=
 =?us-ascii?Q?r2x3lmXmKjU/jTBxH46Ws0o8eE3+rpHBgmq0a+XcIKDSDOGBXWenV8Phhynr?=
 =?us-ascii?Q?dC6+CEyQ88SURA/raeuWGHIdDJvuyWhgqbI+VK+eK9sqt+Bx9uecyO2Ex2U6?=
 =?us-ascii?Q?zvSatoYsYZZV6sRkX2SxJY7a46Bkm+JK4q63320KeBxVzSu8BuHeexQJS8IF?=
 =?us-ascii?Q?4ZMrCn12J8pN+Sa1Wf3L6R7MTrT2a44koHLWFM8Jx5wFXMuIFPCRE+4D/1lr?=
 =?us-ascii?Q?R2VvIvv6ujso1+cSGN6rt5efwigEQNavv+XpmghKY2amYggOPhOaGmKq/1c9?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da4d7833-c3c9-4740-064e-08dbb91c5e5b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:09.9813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5K3TXWB0lfDU+Sxub6PkLr4JClKelSZvltDo4Yzy2IDszzJw51Ojm8FMY8Ba2H5svdz2CpGvC+qIsy7+z5dlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH i-g-t 11/16] drm-uapi/xe: Remove unused field of
 drm_xe_query_gt
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Remove unused field of drm_xe_query_gt")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 2 --
 tests/intel/xe_query.c    | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 544f2f14b..6ba86c1f1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -354,8 +354,6 @@ struct drm_xe_query_gt {
 	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
-	/** @features: Reserved for future information about GT features */
-	__u64 features;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index eb8d52897..3aa2918f0 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -281,7 +281,6 @@ test_query_gts(int fd)
 		igt_info("type: %d\n", gts->gts[i].type);
 		igt_info("gt_id: %d\n", gts->gts[i].gt_id);
 		igt_info("clock_freq: %u\n", gts->gts[i].clock_freq);
-		igt_info("features: 0x%016llx\n", gts->gts[i].features);
 		igt_info("native_mem_regions: 0x%016llx\n",
 		       gts->gts[i].native_mem_regions);
 		igt_info("slow_mem_regions: 0x%016llx\n",
-- 
2.41.0

