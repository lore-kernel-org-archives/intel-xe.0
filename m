Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650D8E7718B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 21:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CEC310F052;
	Fri, 20 Dec 2024 21:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i+ATw12Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B733410F052
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Dec 2024 21:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734730918; x=1766266918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=UU7U6n+SquBhFLL68kxeej5S9X0HEs3vcR7budiPbyg=;
 b=i+ATw12YrYAHR3YOlka3jgT37DdK/SJhpavr36AOQbuhRbus8MX0gK/W
 Rp1WdL3hPI4K/q7UGRHHLOjMoWP+A7uv4/Kwa696wBo6c6MsWHnjdAINE
 fGFVb38Dpjjp3qDum/8jlIiYE28pmoAyfNXur93ecwE0blwWKrA6GpShY
 ugG9KqowLVO9dFiUjTq7rmLi1ybDBXnV1wqyc05JK3FD4WvhTDNialKbC
 t72P0zcX1oY0J9cMu3Rxi/wHix+GrR7mC61gcexh1IjK/pwNidRE1XKWi
 YPosXeH6bL+dd+WkYf0nrQsoJPKrU7UCz/cldiVRGBAwLoA5OllLCaUf+ Q==;
X-CSE-ConnectionGUID: zo4LkN3gTgK3l8UATXHs6Q==
X-CSE-MsgGUID: kJrGrFodRPyCbegN+Ag7cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="39225144"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; d="scan'208";a="39225144"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 13:41:55 -0800
X-CSE-ConnectionGUID: 5DY18T5HQLOaQpXMtVJrSw==
X-CSE-MsgGUID: DD6fTrC7SQCbxLiLzMphYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135963091"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2024 13:41:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 13:41:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 13:41:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 13:41:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFEYheXc7NvodbRl+Rf6BDU20BVeegbqJk01E11cMZXzDAemOMZlTnEKWQWtHpftrQ/BpgE8n00UmnhWjBriJA5YNkLho3FdaPYgfDL3mrtJNoekppTaOsLZFKxKayROx7XQpHblPy/m3A1JG3Y0z13UrbMfAoJN6izNRRNHRpq16f5IQMFqe6zucBPDfaPVpM+s0yXR1rKWwCVZB4fJkfRFvhpxIzJMgeV81Wh0JtZGHdNa/nApY+Ooy1jgmgNWwo7lGRRuCoRY9Rv2XHqQ96KmpYyv8uUyGZWjSPBmcbMEJECvV2uZEAjHtJxJ8f/LXisWF2IsaPKfh31QVkmDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXtnMTytfIR9gHWeqXTlLfjdbF+zdMTGEcGixEYMTUY=;
 b=Dbdbto94gspH81wmxXlCBj6A6YT0opEgQNRdvkGEjebPfXkOozQkrug8PcsKSUhyrUCNaaLwi3sZASmDEdNmIwyChTXN99WZV1mfCiAemYgR4AzXxX/MR0yM80w5lzu4Xpl6IBUpuCv+P9CX5pTFMiIXw7zP3dbBc4jSrNITnH4Hca0SgbZXK8JwaEZ1WVAp+dy5Us+wOOa/zNCFS3dju4a3dUdjaJiMnyDPEoFmCauB/sp53MCfLbQWqpNtdUz8/1q9YW8DlzlmuKlPd4GwTW0aUbzxKt1UerMmRL9RVWbhnkQUQmKF6C08Zt3elWb4Jk/r+K28bo8RvNa69HhITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by DS7PR11MB6173.namprd11.prod.outlook.com (2603:10b6:8:9b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 21:41:46 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:41:46 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
Date: Fri, 20 Dec 2024 16:41:39 -0500
Message-ID: <20241220214139.773729-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220214139.773729-1-rodrigo.vivi@intel.com>
References: <20241220214139.773729-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:303:b9::17) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|DS7PR11MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bad350b-f5b2-432f-173d-08dd213f1a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xHq46+qhZcZ3GVLcLnBvd3mMzDcPXvYB4eBueBBi46iOVD1drbfv+qc8ERK8?=
 =?us-ascii?Q?0UNXuEjxcPOW5ipShL96CdfADtC65CIBv9GijItqW233yoQaPBEiWcLYAclv?=
 =?us-ascii?Q?9gVtcu8+vIY02kh62PuVogCgtCPKSw9Fkqu+Y04ReEpG/kn9fkESxUC4b/Se?=
 =?us-ascii?Q?8cB800pa2JrPYyIaCQ6JC5kjmFY2DZhtAssiMNPatFCsrIaALPlbP4JCH1Nf?=
 =?us-ascii?Q?kcF6Ak5RN/NxzNOP/Cuj1a9kK1lsCXkVIZFC+pNNpXrCLeGGDn4h3NDMiYcD?=
 =?us-ascii?Q?c41GREjrDhzSgRlgOl2cfxH7fNTBx7YvtTOLxmCI4WrvtKw035KEfdDattTO?=
 =?us-ascii?Q?AZSkQQn3rURCGcTpN5Zrvj63gdzsmIKwhNfVWRQL3WMA03d6yn48b+zvMaf/?=
 =?us-ascii?Q?xtkFdmj6kFL3zxSc4EmmQe9xgETLZe479bmGrJnAEBFQ2LVSQCZtVPj849mg?=
 =?us-ascii?Q?yPM9Kb8Xtai88HgzzdsYozKXWs34WenljTat9GkWmn9eaWdaZEWtcs6c/39e?=
 =?us-ascii?Q?pXZTXd2TdT32LrFrnAaRad82beTot8qETHVZ2bEHYplVKUoi2RyZN00ZffLk?=
 =?us-ascii?Q?2n+iMW3HIdZZAnDnGvEtawQguLFVnRg8kbqn+7SwP7tL9Cq00wmhtBpdwPba?=
 =?us-ascii?Q?keOYPyO5WyCPfE7Twe6EElSSP7098oo5yZgimc5XEL1FhgYInj0Mp+GOuRcf?=
 =?us-ascii?Q?S0Y6tETiOv8ATNxb/79g4rpGevaQGWO19uN8t3KHF0Q7/IdLfvbxqXDCuRPP?=
 =?us-ascii?Q?uqU8EFIiMyhxhY/N/vDdi1IFGWbU+62LCY0PqBZHGnZtQ/XBD7K7pmxHz08v?=
 =?us-ascii?Q?Dq8l6s2uNdQx6H29JWVud8SnQRWsvE1OSLIbPESj+5tSiyIpVmTFBJpXqiip?=
 =?us-ascii?Q?2/tS5e1EbA3rAXzXs8ipxwSTDT835GR6MP1Jrb+4f8qLNk+dOa/Pwp6vmI5N?=
 =?us-ascii?Q?Xdyr8AMi7LpCdRxUFI50HvjwNI02458WXrJbJLPFwsNcCc+SeAzRJ1VTjdT0?=
 =?us-ascii?Q?kkIFRhQTgJe9O+0e29/uwKxXyKRyv9j8inrZn2GejraioYAiI8GXuVoymO9b?=
 =?us-ascii?Q?Qwe74KH8UTg2+n+bFkMLMeiEcj7S5YbVDHUCJVJlwSy8fQG4VsqwKYNWjcoY?=
 =?us-ascii?Q?80iV1d0npLDvcCL6Ykbfbg4xlgeDy89JOBJ/aMlpFxkog5C/mVygkE+pbTiU?=
 =?us-ascii?Q?MVQoMU1LndC/WkwN0o1rHspHoTrTpK9O8RWtPsLCR339gTxmLVGGB4sFwbvT?=
 =?us-ascii?Q?p43vcZhPr4xfsZf+SPMS/MkUdfJBpcegr+ClkNO0IwZ2nskGMFaHcs1o4TPW?=
 =?us-ascii?Q?b2CoyOlPOQiUajo0u+eMPYqgEYZ1HdT2WWRryjO3VYW2lW6Lf1YylwwaCvoi?=
 =?us-ascii?Q?1Wpo98CmvlY/BaRehuIvkmtH/4dH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D2NIiLS8df9aRwYhURlLmaSBKkz9HfS1YbJHCULeDHOTxTcuAfOaELGIseqr?=
 =?us-ascii?Q?w0zV56AaG8ICvk57tk9zink19H5xTwEn9PM2nTu5ZbPjDjMUFVJYzARbVQ/H?=
 =?us-ascii?Q?w9iiekIXys2PHwwysxbYKElne030LsUaJnKsGR23x18fe74JrYU+a3KGg0lU?=
 =?us-ascii?Q?8O83rS7mHa04qW5Nck6ZJj8MxWmqxr/T438yPFLSzzQFLgWIZcw7JgWbwVVv?=
 =?us-ascii?Q?hUIHFisQUt3UzNStqnWKojGOlMokU/aMyeHoqrEJ3X5opfbPp+/ALH14lEz4?=
 =?us-ascii?Q?gCtSjqZGC0B8vJ7E2JrXIp70buJLhWJ2DIfm5FROM9AvW7AE5sD1S1DW69/b?=
 =?us-ascii?Q?dSMglR/4tgLgAMc7+tlQnRKbtH2aKRk4ocVn3CigAXabk5VDmBy5zGLE/2E1?=
 =?us-ascii?Q?AICFFJRMjP48EH/6OADIWCM3jwaQqt0zptj3sN2/yTZzh8sgbI4+QLXb7B3F?=
 =?us-ascii?Q?X29N/avhTxRXESB1UUpwkUwxKG0OX++uvW+EKMvCpR29UPNzaQ0QAQW+H1jf?=
 =?us-ascii?Q?J/bu9dbVoWJftHAIqQ+iEmBW7TYFzOX0pFDoO0EWlz0Br2QSi8Mh/hpmCWnr?=
 =?us-ascii?Q?PQ0fguXiy3M8rto6Ic72WFjq3mkWE6cHaMOs2Dz6eiG9MVuIeyDyvlFb3FF+?=
 =?us-ascii?Q?X71VRj8BP/a/JLb7e215cYFNcVCIOl9v60tOIuq+1iIBN1IHDUZrmPoQl+To?=
 =?us-ascii?Q?Jsur7iYi9SXJT5wX22i5UpAdoEz4HM88+DCXTJKy9zGEEQrlPBOgz8ZJI3b6?=
 =?us-ascii?Q?Gb13lrofwAlkgsospFtJ0fd6DqbU4dWRNE5kxYoa77dEWlr/3G6Ws2iEJqTj?=
 =?us-ascii?Q?RLYpqWKLTNuqUbHFxXLD731DSnzc0AIME7KVr3QoK8/pZneY85EXJG88Ju9X?=
 =?us-ascii?Q?V+TAZ+MJlo+QUchEqIKCN5FAQLN0bYf0NIbr2tZz+2BPUbBVDLPmbbV8Na/D?=
 =?us-ascii?Q?CMkD1SLTJzyQj46sbDEhM4M5haEf6mSkJYN/Uc93IgtUO5c8jHd8DGgirgpN?=
 =?us-ascii?Q?JZLEEu8img1PwoGKZ8/hwdFdqQ6kDmm1tTWfwbOpFX6GiROTmcMIQyS9V0+M?=
 =?us-ascii?Q?/KB46zfC5DgK4icBaCoswtwhvdXTPtrFAhSQVDqr6Q0k6vfXNSO6UJTeTyQX?=
 =?us-ascii?Q?RWL8uV7f29YFHKgmSb1H/D5FKw/nEEV8cR1JJWJW1rP9B/fJnIU/49MgI3Ce?=
 =?us-ascii?Q?eSL0yTQg6HxqOZS7iXwN0xf0usn1VM9AmQAHe5QJB/iHH+6Zou09cBWGVdSP?=
 =?us-ascii?Q?aaGoUqAgtWO16QftBHozaA2zp+BEePak3UorMWVcxJzMUU7DclKSVzYc4IsH?=
 =?us-ascii?Q?tfkzGQATc3egvsuZd7qLBT5c4iJ5aJfML+VgFjf3DFmtO6m9J0C/8HOYaMlx?=
 =?us-ascii?Q?gDVYOaXyzgNSnACv1q5KFnz9XX+ecc1T87/FRA4E77LDCv43B/WKtdgTwZ7w?=
 =?us-ascii?Q?DLjhx+6P3ERA41zgsLcd3t3gyY4/THLVpBz5evKnmTSvsWIV0mTlmXCcauQA?=
 =?us-ascii?Q?oc3NU1MkB5Mo5m80fWWtFJBZz5p4xR5vlGxNn1KAF+m+aayaWMPWfweEZoVd?=
 =?us-ascii?Q?g7HHkzwSHSXanIWK2qTENasfJc1+krbAopuCJ7w8DRKCnlnV/JG79TdrsVNx?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bad350b-f5b2-432f-173d-08dd213f1a38
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:41:46.5053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7N385nGtGXLBv0JNyswHXyShjPXeVZW2nQWLEn+p8v5gvbWrrk1CxPxyEbQN4Ji2xvXn96tHShZoRRcnnZMDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6173
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

Enable DCC (Duty Cycle Control) in Lunar Lake.

DCC is the SLPC task that tries to keep
the GT from operating inefficiently when thermally constrained.

Although the recommendation is to enable it, LNL GuC is leaving
it disabled by default on LNL.

It would minimize the GT frequency oscillation on throttled
scenarios, which could potentially reduce latencies.

v2: Move set_policies call after wait for running state, so
    we ensure it is not overwritten. (Vinay)
v3: Fix English in the commit message (Jonathan)

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 5080cbea3790..1ee826049b93 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -956,6 +956,16 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int slpc_set_policies(struct xe_guc_pc *pc)
+{
+	struct xe_device *xe = pc_to_xe(pc);
+
+	if (xe->info.platform == XE_LUNARLAKE)
+		return pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
+
+	return 0;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1000,6 +1010,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 	}
 
+	ret = slpc_set_policies(pc);
+	if (ret)
+		goto out;
+
 	ret = pc_init_freqs(pc);
 	if (ret)
 		goto out;
-- 
2.47.1

