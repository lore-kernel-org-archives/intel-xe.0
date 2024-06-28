Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90E8C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C45210ED36;
	Fri, 28 Jun 2024 19:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G75GFzXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F331910ED39
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602916; x=1751138916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=YsG4roaYaJ+2IZB29DGfHg9sAuvRitLxuAYOTfcdz3Q=;
 b=G75GFzXDymEI+24NEF/sYcNAgpO1gFE3MsJ5TJY7b6Qm9bbfr0vKkYF4
 /zStAAdnmUGHszsMsCO9JnT0eV2E6enYUJm1k6FCKBsFrrWgHKvB5a29p
 8su2IKGCsYOGnnvC/gq+MJpXOvYA0Fm7/H9xNaxImSzite+BvXZSXMzPy
 djkgep/nQm3PiEg/I7DHpxfhU7/tcnBXCzmSgsiczQTbWv8EFq4q1l+4Q
 spEX90mBz6K1uVQlE3R1WauaFsXlZZPS+sQXpzg2Wf777nCgEQNN+v+6q
 WBzX/1ItrDJEyi6klORSRaeOGlyKOmkstPY8bWc+7pHkZUc4bPWCL9r0Q w==;
X-CSE-ConnectionGUID: m9/pkfVUQYOC5ORerfQNfQ==
X-CSE-MsgGUID: pBK8J1R5Slm0k4Yi9KUpEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27931006"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27931006"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:35 -0700
X-CSE-ConnectionGUID: 5fTZlCFPQV2GWgjY8PH5BA==
X-CSE-MsgGUID: nInr3ajiRuOBkmJXRhDLLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45253792"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIvOD9pwDqGuba1E2vpgRyAcEzEOh3ZRIcXDOfwJ9s47Fm+NYERfqFA2/ISgSY1sVo7NE06QoygeyO7bniuRwKbWj3Lrslg3786kjoY8jQwpIoGNu9V94XtZfC67tmeW0yq0zUEyESUq95aEJLmkVGPnCdLuCZVND2sRuq4f+tXeOjaj/A+2h3ZQsRct0ovhrtURhV/ddHhcw3xwK4dBYq4RPGsRCvfu5LAyN9EM6WvyMCE70qucXYMVhhMJnSisMlZ7PI8weD9sqZ/e1uqOPHdK/s1u5FOfOzOYXXYc8qCdzSRipuiXD41Pp2yeHTLLkxNaOFgJNej39TqcTWo12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K0cGCsGgaQJDH/KKL/l6IVhsiIpoV7Y8CdhnJQCMNs0=;
 b=OW5aJx8PfrQcfpnov7W2ZClx+zzKhQ/FIoy/2LlxbAnx0DaGmAi7RSFC2CrUSSnLjWaV74vifhHUty9WzWfHMF+UQ/uu8Idh8PRzonIweVIKs3DVfHiJ5qIonBl0FFNYeYAGVOzYj2foEWSeDHzHIVMbQdO5t5oJr3zC6WAFB/FDV8YFRSwXL7Uer2agHkoSG78QTwZHJoIPDGF3VOPdywALIN54jHl5o6UbHLa0HH2UYdQ2Dq1J1aQn5Vfr9T4TBj5RbVzW3SVL/1VLjF03NS7K7n6mOM5Podg4/TzfvLxiaZ8VdcPn+jAyrNde2L1Lfz4SnhAAHGtAw+NHggeRoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:31 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: [RFC 10/12] drm/xe: Rename xe_ggtt balloon functions to make the node
 clear
Date: Fri, 28 Jun 2024 15:27:51 -0400
Message-ID: <20240628192753.386137-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: a547ee1a-1151-4b79-105d-08dc97a87e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HR01XmBFZEzGvQFU8/RIkyd4Ce2LFFLeknYdge4WR2uTL7r0dficX6whpwGu?=
 =?us-ascii?Q?ycy3mxrluVOhn4+6hZSKDDgJmGuwFViduqWVPgKTCegC9YDHcXrVdny7zdTS?=
 =?us-ascii?Q?YCYKartPSpjBdwlqJF2ktYbgAKHmYOPblIxQfcmORy6TlMLGQK6meHzDzBQj?=
 =?us-ascii?Q?/uupoHatUmrBXyvflMzy4sChyxeYY8kFVUf7iy/408gy0I/QE+1797M/M6gz?=
 =?us-ascii?Q?ogFVzj1wJPLiGVqSoYGiyho3PQY8P3Szepw/2f3ZwNs15TI7aapOUL/bZDq3?=
 =?us-ascii?Q?0Jca+H4CVM4hFsxeCa2I9/hX93FTR8cFFjdTO0PRIBLeIiva38cGuOdk2Jnk?=
 =?us-ascii?Q?v5BxDNWfS7fT6q9Jd5ZcvYIhJ8jt0M+QKUbds/x8Kp5uAViJsSZGbl5WngpZ?=
 =?us-ascii?Q?+GyabAwljACJ7aoxENi1GUCtt5w3N05QWCUll+wuoiUGZsGG8jhymoYaNz5E?=
 =?us-ascii?Q?4rcGx9EtFGNQDp1rx88e5K/BUhNu7/fopa4g/31SZVpu/G8KrgCY0zLO3DGH?=
 =?us-ascii?Q?nWYbS9u5GiGWCbLbzVXWMqWRXGXi/KdJtC4KyZv26a7RYYCEBOar1vgjZckm?=
 =?us-ascii?Q?1SrewwGvI4pdqZPUu4t78JlAiowBskWjdzWPZkFC5eakL+2qqUZYe277/dqQ?=
 =?us-ascii?Q?r/vy85zd/X7Hi78O34CXYs0RQ2LfC1eXCBoNcWNBYxWTc9BD5dGNvLPWdK7J?=
 =?us-ascii?Q?vZr15utgEbT8+77P+vFxSOckFs6nGJ/8OU5fz+4oCFo03EbWXZvMF4Sj8iPT?=
 =?us-ascii?Q?zD97Ga/nbS7MhqmXjzTGDM+NcuQUxM5KkaEnuOf48TTGfMdSYW+Y+EtG5bKa?=
 =?us-ascii?Q?qUgJngANpGIBoFzCBQJG/Q2SSMYfKk5TCVL2kgz0ICfir7XprKhizNSXyWtB?=
 =?us-ascii?Q?Fnn0HRC/mfi9/tUU6cSWL7Ul+NA7BNXdgjxgCDLtNR2qiwmkYxsIu3frD+WK?=
 =?us-ascii?Q?C+jg23HV2LMlCMYfnbQ8QYQlGQKizK8IAAHYf1IhOV0D5MmamnLVJg+bUKvG?=
 =?us-ascii?Q?QtNC7ZKaJLa699STOjBH5diR4QMbY8iPvA8pUUEi/dIqD0HMRS+qh10mJHr5?=
 =?us-ascii?Q?5hQ2xlFQfWzB4aqE/bYFrk3PzCAmxKiPBpVZR+pK/Hqhu+n60E4Miq6TbqZL?=
 =?us-ascii?Q?L9wiVaI5P2FTkERaXIo90RbvfleYqAUSftTK+IM1yB0QBQOOIAkAiVvZS3Fc?=
 =?us-ascii?Q?e1znOTIefcrPijaVUT3FExB6+fiTMfwtzGS/bLy806A/AKSCIl/OALHAMm5Y?=
 =?us-ascii?Q?NxEeIAqiIArNDfbEenW4f5suHOmxdoaNQDRybysb70A6fCKNTnmAaPFIjDE4?=
 =?us-ascii?Q?qvNRceaR0/LnXZsQA+iGMXmIghZCHr/cqcbJLA3u/C8XEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8/7/d4rdokEzVmxOQp7dSPLLPzj9UiWXAnVjQpw84XiK+mkwWFxAQUSxnyM5?=
 =?us-ascii?Q?RoiaDWLiRPwGhOIqWr/c4dCkjKp/F3G/z55SGOh+a2g5dVQgnTxdC94bSo4l?=
 =?us-ascii?Q?rY1dLtNn78v6lH3X36zy2R0APWZEUYfru6FSy/fj9hmJUVfBzuqxmX4oZaER?=
 =?us-ascii?Q?P5ZzCsU+I+Ma+Ojn+RDAal6q12Vs5iD9l4OMGRW0Rwva2JM/t0wz3Yr7VRoG?=
 =?us-ascii?Q?UxRDeV9ssfFD+ma8j+tfMOhjWeAy2lpBwM1Wu4ImOFh+9pha/F8IHpNaUpU/?=
 =?us-ascii?Q?1+BcjcwgLWeWVy5RhbHQoLx48E7zWoXdmes+jW40WCRLUm4+Ou4h6R8lSb85?=
 =?us-ascii?Q?91eK1ReN9c9XHPoBN+hfZKqfyRlMXYiln7doNFsgzEm59LfqWjvlBjYpL1/n?=
 =?us-ascii?Q?pkFUkPiAIcPI2f9XDe+w+dba58BZjgKFBjNcdkDBfc8AcrhPQGsgXkLmoO+V?=
 =?us-ascii?Q?7WDEpnLZK+vP476oOiCzM8P0/vRaXK/qj0bXCNeh5HXRlyVOsjG+ITqDlI4n?=
 =?us-ascii?Q?ibFreJiRuYymHKsMlqzQy+sOY9cAy7ECjyYJdPvmj5wb/Oz8Yu+SAvwnxZ4Z?=
 =?us-ascii?Q?vp+EyFzl2gPCg0oyemo2CGUjjB8uJJ6Lh9+oPGeSxIBJiRaER2w5RhMu2O0T?=
 =?us-ascii?Q?CTkmJKF43O5mXZ0EV2+TD1UdOjeOt0cu1FneAoHf/tS1Q2ZtNNNdSvkV+HSJ?=
 =?us-ascii?Q?VIqKegvFteyTPXDWr4U61iHwYENLbd2D9cMPD3+6pSPzgJBwSV8BmWrbg8SI?=
 =?us-ascii?Q?2lxuQfQpGIph1+0muRVodYfZPLUA12gkBqj8lmfH1jwknKXBAIvWWTej+gzP?=
 =?us-ascii?Q?zWwPmKJOWBRqFbWRt69VE1rMqJGmsi7ojvXBhB0F07UoeydofDxuTMoqF6pb?=
 =?us-ascii?Q?JSmsn8F8vuflor6U3WxTCqa+buZEWC1Tql3ZLNjfiv+1FSPwWWf8RnNuItn6?=
 =?us-ascii?Q?NBxgDspNZ4YaE+Txp0TuwMsDun7cPLdIvI/8nBnzl+n536NH3v2whF/Rl/9e?=
 =?us-ascii?Q?3iLytIadBOqxb/gTYM6KjR+/bRGhnhLKPgKjDM+850Fbnp7Y1HMKvEuNWTev?=
 =?us-ascii?Q?ulVcnUpXZAPmv+SQoaRHKjGQ5qVjF9M2YIGpgCj+eknlVjQJljM8/UIql+3u?=
 =?us-ascii?Q?Y7nCN8M/+jblNIUcvnOrTE6jEleTN747L/Mc8ioOOWaXV1HfhNQENkbvvVOd?=
 =?us-ascii?Q?beDdUPL6Sc1LSxONrZ15QNF9E6T6mb4jAyY4pGKLhhNLI8T+0M7iya/3YlSm?=
 =?us-ascii?Q?jE0EREG3n23LovQCqMDzFLo+hmVaIcfQtn0BsHZZpPFUM6s2eyPnDzxjW1Vr?=
 =?us-ascii?Q?/7ot729Eav1kAxC0Cvh5vG9JJs4e2zAWuXHvB+jU5jzpqaz7xAOx5r6huay5?=
 =?us-ascii?Q?ntVSPKdtspF1RTc9fxRRisvjm9uj5sZMSwTZRH2ud+N+dPBDSQIgzFaVqQxJ?=
 =?us-ascii?Q?U1LJOEhbL8VPOF/g3XlMgkJza2Tk8DkFwJV+JyngABPCvfjzAV0ikJY+NGAX?=
 =?us-ascii?Q?MkRXOaoZcnzx4F1CmA3IkH3FnMG1JSQKxXDjThSR4DAPdkNrZpnT2xTrNi+1?=
 =?us-ascii?Q?2zmqLe6JzVf40XitixJ/2qUYf6HaeaHzbuUhsvvg7sR0p1wALlDC3wZxdQw5?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a547ee1a-1151-4b79-105d-08dc97a87e9f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:31.6395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqvFQYg8VhYTzVEXh8ftWBh8/fTygCUpvelMqrBkxoxhmvLK65MimLNdocCCp0OBxUhE7OwuKT4s05AE2Hg6Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

These operations are related to node. Convert them to the
new appropriate name space xe_ggtt_node.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c        | 12 ++++++------
 drivers/gpu/drm/xe/xe_ggtt.h        |  4 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 10 +++++-----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 490d7a4a5324..a4202bcc4ccb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -342,17 +342,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 }
 
 /**
- * xe_ggtt_balloon - prevent allocation of specified GGTT addresses
+ * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses
  * @ggtt: the &xe_ggtt where we want to make reservation
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
- * Use xe_ggtt_deballoon() to release a reserved GGTT node.
+ * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_node *node)
 {
 	int err;
 
@@ -379,13 +379,13 @@ int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggtt_nod
 }
 
 /**
- * xe_ggtt_deballoon - release a reserved GGTT region
+ * xe_ggtt_node_deballoon - release a reserved GGTT region
  * @ggtt: the &xe_ggtt where reserved node belongs
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
- * See xe_ggtt_balloon() for details.
+ * See xe_ggtt_node_balloon() for details.
  */
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
 	if (!drm_mm_node_allocated(&node->base))
 		return;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 67ae5f1602a3..e68cede2e6b5 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,8 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
-void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
+int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
+void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			u32 size, u32 align);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 41e46a00c01e..a478e6e1b20e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -528,7 +528,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +536,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
 		if (err)
 			goto deballoon;
 	}
@@ -544,7 +544,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 
 deballoon:
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 failed:
 	return err;
 }
@@ -555,8 +555,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.45.1

