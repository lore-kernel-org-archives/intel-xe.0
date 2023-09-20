Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB567C04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8875410E541;
	Wed, 20 Sep 2023 19:29:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0610E544
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238195; x=1726774195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6/3gUHeBOZfCd6ArrAhglsd1+cx4PIkN1D+FcGH4zYg=;
 b=PORE3vRTg0duKg26pfeaNgpF3rF54d3VG5d5VYnsZwPxEhRUaFcAxdju
 a8E000LMmUSIXr8rxDV+RwxDO1NE5DRrk/KtSCWI+97/TTwHJui0kz/cA
 eljZ18TSRpjpzzmiqiMOJlyZ3rc5SPSZ3uQ5MfIx3GRQpQ+RDseezFKdr
 Q0ksmC5jnBC7R5eGG/HCbduUiHGPQI5UYNS/GkJ+SfHDTxGjR/BgpNxUb
 QDiT4Za2Tv38zz8im/sDnweYR76zCtGsvyCcSnUdBfWxSyQey3IWBBUXX
 cW5jPO3yLpIc1xxS5bGO6IK74MExioSv5aX5kWSGXG0hU4x66kKSf3Mm2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466630230"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="466630230"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746771583"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746771583"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:29:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:29:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:29:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:29:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfK3h/qibbzAiDzAujelyHUiw4TTohDPyGFLLwLfs9RjXiAu8HorzBNHJzmV7ryGBoYJRR5JSnh2A0DnIDqTcQ6oHbRvRBJBDTGtw5imTuJbeIDF4khYsyl/dQDnjCzsFzcEugfSsWFpVRzP+OTV5sNFlfCGUs2BdYLmzyGMko/JAgv+6AoU3iDDbV440DyJTXWwsw5gZ7bmWCOl+uWRuR4jVVvhwGTlPH43rTCGVOnAOAwdZ5joeDDiQxfQrlsqwVaQyC/xMdB1O8gLDeVUovMqRnz4kcJvf6KoWnaOLmjZahZ3zFuWLHJEjlTHPq0LYseK+yFAEWW17QFyG3aMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgHDSzZZOhy70pbbsryDJjszDzFJ0GMiQlPcVNEvACE=;
 b=mVTi+5fwhmizBu2QpeIUBwZD4J/FQ0U98mxALOrPUEJXGoY8Y/CTpGBdzJt96vJPlvvgqjI8HjZoSr6sm/2aNrRLzmJsCnjIvq6EdzY1zCdRfPOhz4LryzaSwMhtbMVwfgpujZlbEDiaUEoFYnn34p/D2A9o1x/DGIL2sKxs3LNHpttySXDXPt2pRS6ujmRCcb4twH7r9Y7aFtazn7hd4NgTcY1iBVz6B5wtZEL5n6C/0sxJ/BDlpxl87k2UV07sw4FaliqbwaB5TBbXIF0cQK8Bv5F55ujcb8SCWqFc5CZALOBYJE7qxFF2/UK6OSeMOdTEa+t5T0gGb7GQvwaQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 19:29:48 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:29:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:21 -0400
Message-ID: <20230920192940.135004-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0192.namprd05.prod.outlook.com
 (2603:10b6:a03:330::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 01492ec6-54cd-4370-af90-08dbba0ff3e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZTn4U/cFXMXKM+1CmMkKTWvdZ2iVg65kytYP6yMrRboqIdKHUgzewRM0wM+BR4jN0tuUrUWnYasSVlW/P9EAtbF8CvwfnLFZAR5kx+7ygn7uxfexn4+fkWwy7ufu2zWQJbvMVp3DBEaTFt6ZMJTa5Ejxo+cDfbJtHG4N2yt6Qa+IQ0vouuxsmuoYVcm96OFFGKe9s0Or+GpOK7Y+bvew+fGKJR8xvIUuOJQ3yBRKvwJrwfrFy+NWcmqD108G78dGX9C2UBse4QppXUEPEoCHCNlRXuCHdlUhxgvUfnLzP+iQ9GBkt7CTeYhtPufNNvk3NYrQcttKR3jgJ/Lg3oVUAQZPGYY8pUOb7u2miXGr2f5n6UN03nNvYayd41CFPGCdNT/4IN/8NFa1OZQTOhjKChB9pHuamd6pl5JAc5qyEu4UDxSPDOKSIfaAsM/9YJXrH92VltsIGBZ4IuyXxMMcOj18D0+CzeJYAxWJbxxWDW9Q7yr4+dZS8k2BHWCo63l7K/cicdBnzkR5J8TOqddb5Tr+8fT96HRdj7dAt6eV/vdDIVevbMtDqczysOy13Fvp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(346002)(376002)(366004)(451199024)(186009)(1800799009)(83380400001)(6666004)(478600001)(44832011)(86362001)(107886003)(1076003)(6512007)(26005)(41300700001)(6506007)(6486002)(4326008)(66946007)(66556008)(8936002)(54906003)(2906002)(36756003)(6916009)(66476007)(8676002)(82960400001)(316002)(2616005)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AIEgq8fgMqUaFvdHO/fuVE67ZHPokdeMLrVz7tewpn7vAV3thHWbG9exarBA?=
 =?us-ascii?Q?R/bwbX5tPcqOaLREsUNuctn8b+fVJB/7tPYF0XiHY0VbxbYrP1fayu3GIDhB?=
 =?us-ascii?Q?w/kAcTJtJa5TVbtGGJQnvFmpEiths/qe9wNo/yTZABSoRE0G6Ui5yTLlBXp9?=
 =?us-ascii?Q?IaHbvJ1aSzb+SHWt+Fo7c/KDYQqf2caQ0b74azNnjiS5N0Widj/jmTHRUFzV?=
 =?us-ascii?Q?Iq+76IDi6RQf9wkhjvTGjKukCMpZW+k3j0VxL3xY5UBXJU5HDlwSdyQK4azn?=
 =?us-ascii?Q?Q9GdkmJVHXDnKNNXjHN0zHC8u2iyGvv8tSab+IidvwZ0KYTXL4esqSKqTpuA?=
 =?us-ascii?Q?HY1pQwOLsoCFHhQ/1Ewvff7dPnf5OVKIFsL2WJd7HzqwCuPs6OFZcAOo2MZM?=
 =?us-ascii?Q?YwgTLU1DK4j4l+3icBqtGsA4lbESPNc11tE+ISO5UoeweceolfyMyzSh4Wf+?=
 =?us-ascii?Q?tPYzcbXvf/UkxUmwTKaAUj4uqD41x0jhMPs1TAF5YOGa/mo4xqnq8FKHlc+E?=
 =?us-ascii?Q?g0gYEjZa61bvJjKyO7FU/ZrMLI/T85gvuf+Pqo1R/My/+t1k+bRQsxnJWOPE?=
 =?us-ascii?Q?9MgvBSXjTA005tcIg1A0xy1/YtVyA87gBGp0ZAgYYj0ti5fjMecuhYh81jYI?=
 =?us-ascii?Q?XyQ35k4ndru47qRXdOYLSbH1pQkpbXGGdLfC1Myc5ArIXrXXJp2/WyZHEvyw?=
 =?us-ascii?Q?bFCALOMNhHY4flceOM1lzD+6RNHYw3p9qy+1LZJQgi7ZQ2msYgR6hTqFdktO?=
 =?us-ascii?Q?KwVsdnyHeRrGkBVpWq9hH9MPFRG9kfpkgtNBu7PPTwrQ5PBDkqziWx2dxzdz?=
 =?us-ascii?Q?DdeWmKQjDXI4NdC2W8mdsJBp88md3PzdcCxyCrvJ/ncnO5JMaHnisJGwZeRE?=
 =?us-ascii?Q?dmnbONLDdr3T0dCrfpqDECjmpOj0/HYviD013MeWaKJ6kkK06Yg6b34vReBQ?=
 =?us-ascii?Q?LIzFjP3HaNHVpBat5+kFr8IIJk4dRccUdEqvRcLv9B59RqMWzXC80PaLDTcc?=
 =?us-ascii?Q?7QFhGccKM9oj594/lQHvLpgSM+zq/woGOTHpzYYHsBXCnMI26PncDqMZIHGy?=
 =?us-ascii?Q?R+QqTogI+5gezw8e8bSfKvvq1qmKFeHfbH1wZwqOV4RfFqfaNoTwF7Ry8cft?=
 =?us-ascii?Q?zs329CezLbju8RWs2JihzmYSfvlbw4wC95ziH55/6UCn1+psR1GNNyEaxLu5?=
 =?us-ascii?Q?tda+L8a4rZ9FcSJT8RG0vlGa8wwP//OJuaeFMxRhe9QFiw4ZwCX4dK8+vJgF?=
 =?us-ascii?Q?SawzeZFFMdFggHn/d1bBMLPts7P7QPNeX56qAWNaLiv7dLdv8V0YkCVFuU9I?=
 =?us-ascii?Q?M7e8OBsC4nWCW1T9+E++0RMf+gn8Z2Mf9RtbVb0rDYnPpS+2MEVfLnVc0ve9?=
 =?us-ascii?Q?2LMNllcAfL4vUvuyeQURlr0B2nuGVpSvLFDjundN3lXbZmr+j4ecTy8W9Yx/?=
 =?us-ascii?Q?wNhvWvmdmZyQfOcEIEQJSwC88n75iDSs4pXEGEjYJ68mpXsL8Jba6VOH7V5S?=
 =?us-ascii?Q?6mp4xYYdPieXDWOxmDWprrEdkGFlKzdAilOIxxowTnuuVv4Ysg2V+DH3eZ1Z?=
 =?us-ascii?Q?F95i0lMw2qzqpprZ8rZFreBQtnlY7jhpNzpVMW2jB0/giJ6qmTuqI8yudYAK?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01492ec6-54cd-4370-af90-08dbba0ff3e5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:29:48.4377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9CuQsjJkwosqBp5B7tR42qZJV0BI+PRljSVLmqZfv7sW5plUPlyw7hi3ZmKJWOeG1lI3NX9KnGxbp2TrkV0kXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 01/20] drm/xe: Fix array bounds check for
 queries
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Queries are 0-indexed, so a query with value N is invalid if the
ARRAY_SIZE is N. Modify the check to account for that.

Fixes: 22504d560287 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fe..e0c2203e428e 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -381,7 +381,7 @@ int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	    XE_IOCTL_DBG(xe, query->reserved[0] || query->reserved[1]))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, query->query > ARRAY_SIZE(xe_query_funcs)))
+	if (XE_IOCTL_DBG(xe, query->query >= ARRAY_SIZE(xe_query_funcs)))
 		return -EINVAL;
 
 	idx = array_index_nospec(query->query, ARRAY_SIZE(xe_query_funcs));
-- 
2.41.0

