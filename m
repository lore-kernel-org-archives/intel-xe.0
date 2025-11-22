Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5D4CFD30B
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 22:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D23310E011;
	Sat, 22 Nov 2025 22:16:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EyzhOjTb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7F710E011
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763849766; x=1795385766;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iL3JbLOZ3+x4lW7HlUDSHypIy84ll+54BZqy5f7nYew=;
 b=EyzhOjTbut+1SCL6toUvFb5UpyVxOH2gL0BmZPPvIIi/h7mePN0sXTm4
 KDNqdpUQt96kFrB0stMIaXvYcRrJ7zNqbgICk21LqJ4FPHaDrtI4Pdi56
 n0MbTaTKSlKVB3MYkhvduuoMTC05H/HVcA/saQiAGK8h8e1chyQTh0lrn
 QlLgZLDECDHfpMEsKLb56+tf+GvOTHWL70CwApAZat8rak3dlkRo+CIuK
 OHJkRGrwMPJZ4EQHGI6j/VqE8VpJhqa48kvriNYCOVj03k8WaFHiWptlE
 ht3zFP6TV94yo6vuNDStj1eHPHoEmFfhcEnTL0gwDUWgFThn0yPstUZS3 g==;
X-CSE-ConnectionGUID: B23OVL42SYqPkIkZlaVQtA==
X-CSE-MsgGUID: lTKF4tGTRTqJkgzL8mWbPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69768691"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="69768691"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 14:16:05 -0800
X-CSE-ConnectionGUID: CzVpI51MQhKwN5OsvN7TBQ==
X-CSE-MsgGUID: qsfCsOn1R5Or1ASLAwe98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; d="scan'208";a="191273843"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2025 14:16:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 14:16:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 14:16:04 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 14:16:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxs5XGaaV3sczM9sLA1scdAJgS17cvIVOr0lxO7XQK0yW6m4SP65qq5LcQ1n4lGGkl8x79n3oaG3BNqG5zA1OTI5mh/Y1Ol4wtuoX9s61I51pZkb4ZFSpt7qG5xUhr7aWOhs0fpMPoTWDJZ18BwexJ0RQDr4xySpEezfWEDL9s6E63RgDbarOFbxwimG28gn6WVY51rseDvC/Ia8R5t28GkFknl6ruxbSpZMRv9KFFxhigodUb8O+8aS2EQwwO/5ICk8+XeNF8Ae8aV6gAALEgVA1ZeYzRyRgfitimBLij0YG+LS6bR1atZwCEZ/MmCQyxQfoQSmKhrq3Z+p72nhNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DU3R9URr1xfRPDzXRn9GzdTHDJpJeBrlY2lCVZZcXtc=;
 b=mbEhEwdYkluMQNmzLGuux1P2FERhNMjb1g2W+9eAl3VyUM0n+mipgYCqf7vQtxlaVwRa+dGbpX9TptKYL6PxsyR1L3jwfSut4cMBK6uHv37LqYDyQCRbnQwcToH2Y9E0fMhKUzC3yUJu7zUFWjcHDN/5a1kvkkiEtdAe7I95rlvSBsr3R/luaIExGO3rlEUNG100eALqE5HY2Qiam0upI15SrAl9aCv1lV+Hb1dqQZISaQWEBU9oBDWsycJGZkoAxrW5Ygw3PGOmgzqNRODMfbyH0udgn02qVoTJlDmoL4Y+W8MoYnmY7URftKSpipfCqh9eIOOUqVV8pcWavC1O/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sat, 22 Nov
 2025 22:16:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 22:16:02 +0000
Date: Sat, 22 Nov 2025 14:16:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/18] drm/xe/multi_queue: Add GuC interface for multi
 queue support
Message-ID: <aSI2INADswba/Fha@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-23-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-23-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: d78dc402-ae58-447f-5717-08de2a14b8fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hXD3XM7zhjZ+LQDSfTes+eEqWB2IdjvvtwuJBEaQuUPQwph2lYj54YVZtpRC?=
 =?us-ascii?Q?BeakZnYlPC0xVHJW3ZNr0CMHPZIdNa8uUWmqZBpLgyfQSsxw6c4mIBpsM4xO?=
 =?us-ascii?Q?D99lmeaDLs4bW5RtlB6+SJb3ZOa9Anp1bY7cBJYPzz9532JKuai4eUFBxZ7R?=
 =?us-ascii?Q?H4txyqQNJEzTPsG0eegFv6GJywdDjxx8TCvDF7+JMfBIiD6jEra7JCVHXTSV?=
 =?us-ascii?Q?CUA0ssVIE41EmfZYN0vvz92bQmUdsmYRo20kVZ6qe2hGidhw5V1TTDvGa0cR?=
 =?us-ascii?Q?FLhscmz8BryLOrEp1uqP7LSBTkWXsn7elhU1ngbim46PObJrxZgFdjaUjqv2?=
 =?us-ascii?Q?s54uc4f+uDQQOUnowwCJCbNFrnoQD4yRzME0KvkMHedHtDM5AQ2yk2ZSCSdH?=
 =?us-ascii?Q?XyS3W1P8/1njKL6uiNnZh+8O57bioCezy88D0CR66z1gCBZmgtY6emV2vOzN?=
 =?us-ascii?Q?ElVPIBYnRxYMUWh2SzOmLOXaUtBHfmwMPaoAluknJpJPMB4F5gavHRkMeQpA?=
 =?us-ascii?Q?hVkwVBvpcUnoEDhCgEG6dUn2TTLIs4Ap1iAXS/dacKzpakhlszoyd6KWnDHK?=
 =?us-ascii?Q?npyr5YU+bIDHSZytR6pW8Ko1f+OjpB5gugSV3vj8pfGOUeExxlETbXItnFcw?=
 =?us-ascii?Q?j5UZkTvHaQoOs4aivmIsXoyG5ZpG+rN5AzfD9zaRhbnWTeNDm0VpTsTqhjS4?=
 =?us-ascii?Q?rF2zZcpmX2xw5B2cOc9l5QzUkrJGpwgZDqu4fN6a4gZNdSQEdcPCC4Uc+7NG?=
 =?us-ascii?Q?v0tyYm9jjYGLgju7Cz9kgVCaq4dR1nHOws7mHQ6oX9qQjpceb6yq9XX4PG+C?=
 =?us-ascii?Q?7Izs/m4L2ZzegMV4bNOSqnGHIr0cRxAtC5I3j1En1sTcXvAl7hoG7T4F5AIe?=
 =?us-ascii?Q?1Znjt7nQjVW0nrCkfMZHzGfLG500c6emvV9PuRMec35vh2uZDAIjnQ3tOkyI?=
 =?us-ascii?Q?QMfe0g7ujtXcyWoaPbOZ7rtZW4g8LmlZCbQIhcZNUBKXIdpKMlDPcZAA1WqH?=
 =?us-ascii?Q?Nvk0LB3m+Kn5RL8VoVNYvbRymHXoe8dVkJ7Er9eG/+42B2smAKhbwYHBN7EF?=
 =?us-ascii?Q?dBsf9W4SgdsS4P1bSqDmeKdWpiLQpZtwXZtJuMn0ll19YkYZNeNm8WY8RESU?=
 =?us-ascii?Q?0kdFf7QTKs8iToximcw2Ko/lvA2zTEMk3ewuKu3yJ4fM5TA6gGc9Bs7l893u?=
 =?us-ascii?Q?YLc2dmTGDJfhIW7EPtjBxw0VqSff56gMKObMJQrmv+608ERWD62Cu+Jo/z40?=
 =?us-ascii?Q?OihfveUViX65/pOK/l+HBPIodJbHFb2ZhSJ8yiGOvXYu7hGTXO6/XOAJ4F3d?=
 =?us-ascii?Q?G13lQA/AewOeCtZ89HQgIcV+L00cFqs1HcSs/6jIvjb2zIGGrVldRr6YbBVt?=
 =?us-ascii?Q?UGljhpgNofQgE7AJ63/87wstAh6RGRS31IM3DK1oFE69yJH7YlJudvY7Hg75?=
 =?us-ascii?Q?mwH3lzyWZi8IRbYP6mmilEYZDho2UdbY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VFvp7nb2CniuZZ9ev9+2nYX/N6pbe2kYWPzUYTUmAnI99msDiFGJyozjeqfE?=
 =?us-ascii?Q?pXGCKMxL8Z0ZkQ6q+wVSxS2drgVuWZb2vGxZjbiZI6dGba7k5vMg25cKnk2w?=
 =?us-ascii?Q?xuK5Ozh/VOetaJ5gBhXEt02H0h22a3OFKLdVyzJd7CSNruipI8bEezQIRp3C?=
 =?us-ascii?Q?woSZn/LGfy2F2ql3HKupCAtsh6Kcy4PziEsCWYSSEgZ/l5zJ79ytqI2D9KaC?=
 =?us-ascii?Q?oPcne3BUic8APow4CZKwFsTdF1heIxYKPHtTPK4rcY6RP5lqty4Rt9dXrvbl?=
 =?us-ascii?Q?227Cii7UYNibLbMxO+qTQ8p9hKR77AJY/NpjE3cAhDWD5vZibZrahF1EsSZi?=
 =?us-ascii?Q?C0QBNhleFO8TDQYIs/4zEGgh88rTWzvb16Vk7DNIWL7YSt9E/SJbMMfi8ClD?=
 =?us-ascii?Q?5lTmjKlaMWFmVfRFdDta8bwuV88lKPCQERnBt8tJL4AtWB24KMbSx41hQXdF?=
 =?us-ascii?Q?s09su4Q0SjE/4bgXxiJd8QnF9r/1CY/1SGG+7vx3VaaX//OKGxJ/UFttI8Uu?=
 =?us-ascii?Q?hC+eCA9SYRFt3y/UMMHpYQoxi83CrKmxgT3UCYJZaChTDz3raMNXLfG1k4oa?=
 =?us-ascii?Q?S2rViEzSI7gWkYN8b/NIMlrR3nIZm1E7+wYZfM+eQNW2+TEDSaLqDkL8deR0?=
 =?us-ascii?Q?zrnicH+WfpIgmghDVQUQpMO1DqhOrSICtoi0VL9W597AKn4iaH3riX9ka15R?=
 =?us-ascii?Q?tLh60GSUNsTOUDYd1f2OEN4a0DMuOkUeaFgGRr+EovdACOlgeMH/j0KPikz4?=
 =?us-ascii?Q?eiKdfxL4r0YlBB1siZhNo0VD3GCNgtClSHL7ZYM+Bq3hYBpy2uv9l1+K6CEx?=
 =?us-ascii?Q?ylRAaSAJUeFLcYUaPysuRengp6mKyYA8mEs78HhJ4BMfA1CY2XeuCkuCeM9S?=
 =?us-ascii?Q?pbS7ikQzERHYcOBNZx4oE5Ody4+GvCI8d+ppp1OHq8nm/5J75LDadNaQm/bI?=
 =?us-ascii?Q?C32EIAByDuIslgSA1dMsENCClhD6Rhqt0dK5bGrnpsLMw4qAEDJoMbzSgNk7?=
 =?us-ascii?Q?ajBCT/d9vSMr3qLvaBCsgesnsqxk71gemZKvw3SFpjdnOJJZlkN1NN8Vxr47?=
 =?us-ascii?Q?KHo++pJaA/oZl81aFQ3FPMWQYW3kza+7mAr0ZBDg+XT3JgQnBI9eonshWG+g?=
 =?us-ascii?Q?LlRCM6oknoZJFBBQa3zY5IHTfhHSBOGiFv+OuxG3HUjx2hj52IW+mAoVvGKe?=
 =?us-ascii?Q?IwbcHDygc18sgfz0ttrNY0IHSqSBoy1LY4j5AqwPHumLswLp05PpbkWm3lDp?=
 =?us-ascii?Q?keEgTrp4Ts1oku+Ruhat1GgoTFfH8rjaWEc939D7qehgJr3zZULnNJD98nBJ?=
 =?us-ascii?Q?EBwCBAur6BotraaZPJr4rAG5bwWt2NpzCVcsXfmEYgtk6EEgZO3uT2p4vOpy?=
 =?us-ascii?Q?T7KE+/cXQdomahSAiW3x2xzfNgeA3pnoLwMg7E3NZaLnTS4DvnE5RfVqze4m?=
 =?us-ascii?Q?YrAwWCyxqLLZawaBdto24kCi+8QVdiCB5obKwsMwRl52EO+Hs1EZIZr8tw5l?=
 =?us-ascii?Q?SjcJYO91ol5n9sCW1x3YL2GeRsO93HE8QVML514t9NRNpeQnVB2f0KgJd7q1?=
 =?us-ascii?Q?w7jEmPj4alulVlb5cdkRac+qf6cd4D//RNzItRqsf2JYt4JDDV2KwyWQ3qP5?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d78dc402-ae58-447f-5717-08de2a14b8fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 22:16:02.5654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhsCChgsNSiVyIn281Yp8mxgiyoTt7rVp1Zdw0SdD8cbsUGd1iyxGbSYM8AGrzcIjjeFQEUnG795BwMsezkpsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
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

On Thu, Nov 20, 2025 at 07:51:37PM -0800, Niranjana Vishwanathapura wrote:
> Implement GuC commands and response along with the Context
> Group Page (CGP) interface for multi queue support.
> 
> Ensure that only primary queue (q0) of a multi queue group
> communicate with GuC. The secondary queues of the group only
> need to maintain LRCA and interface with drm scheduler.
> 
> Use primary queue's submit_wq for all secondary queues of a multi
> queue group. This serialization avoids any locking around CGP
> synchronization with GuC.
> 
> v2: Fix G2H_LEN_DW_MULTI_QUEUE_CONTEXT value, add more comments
>     (Matt Brost)
> v3: Minor code refactro, use xe_gt_assert
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |   3 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>  drivers/gpu/drm/xe/xe_guc_ct.c           |   4 +
>  drivers/gpu/drm/xe/xe_guc_fwif.h         |   3 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 276 +++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_submit.h       |   1 +
>  6 files changed, 267 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 47756e4674a1..3e9fbed9cda6 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -139,6 +139,9 @@ enum xe_guc_action {
>  	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
>  	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
>  	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> +	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE = 0x4602,
> +	XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC = 0x4603,
> +	XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE = 0x4604,
>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index f429b1952be9..b9da51ab7eaf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -44,6 +44,8 @@ struct xe_exec_queue_group {
>  	struct xe_bo *cgp_bo;
>  	/** @xa: xarray to store LRCs */
>  	struct xarray xa;
> +	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
> +	bool sync_pending;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 2697d711adb2..43a79bcdfb18 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1307,6 +1307,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  	lockdep_assert_held(&ct->lock);
>  
>  	switch (action) {
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
>  	case XE_GUC_ACTION_SCHED_CONTEXT_MODE_DONE:
>  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
>  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> @@ -1569,6 +1570,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
>  		ret = xe_guc_g2g_test_notification(guc, payload, adj_len);
>  		break;
>  #endif
> +	case XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE:
> +		ret = xe_guc_exec_queue_cgp_sync_done_handler(guc, payload, adj_len);
> +		break;
>  	default:
>  		xe_gt_err(gt, "unexpected G2H action 0x%04x\n", action);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index c90dd266e9cf..9b090d9b95f1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -16,6 +16,7 @@
>  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
>  #define G2H_LEN_DW_TLB_INVALIDATE		3
>  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> +#define G2H_LEN_DW_MULTI_QUEUE_CONTEXT		3
>  
>  #define GUC_ID_MAX			65535
>  #define GUC_ID_UNKNOWN			0xffffffff
> @@ -62,6 +63,8 @@ struct guc_ctxt_registration_info {
>  	u32 wq_base_lo;
>  	u32 wq_base_hi;
>  	u32 wq_size;
> +	u32 cgp_lo;
> +	u32 cgp_hi;
>  	u32 hwlrca_lo;
>  	u32 hwlrca_hi;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7e0882074a99..c68739fd7592 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -19,6 +19,7 @@
>  #include "abi/guc_klvs_abi.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_assert.h"
> +#include "xe_bo.h"
>  #include "xe_devcoredump.h"
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
> @@ -541,7 +542,8 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
>  	u32 slpc_exec_queue_freq_req = 0;
>  	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
>  
> -	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q) &&
> +		     !xe_exec_queue_is_multi_queue_secondary(q));
>  
>  	if (q->flags & EXEC_QUEUE_FLAG_LOW_LATENCY)
>  		slpc_exec_queue_freq_req |= SLPC_CTX_FREQ_REQ_IS_COMPUTE;
> @@ -561,6 +563,8 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  {
>  	struct exec_queue_policy policy;
>  
> +	xe_assert(guc_to_xe(guc), !xe_exec_queue_is_multi_queue_secondary(q));
> +
>  	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
>  	__guc_exec_queue_policy_add_preemption_timeout(&policy, 1);
>  
> @@ -568,6 +572,11 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  		       __guc_exec_queue_policy_action_size(&policy), 0, 0);
>  }
>  
> +static bool vf_recovery(struct xe_guc *guc)
> +{
> +	return xe_gt_recovery_pending(guc_to_gt(guc));
> +}
> +
>  #define parallel_read(xe_, map_, field_) \
>  	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_)
> @@ -575,6 +584,117 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_exec_queue
>  	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
>  			field_, val_)
>  
> +#define CGP_VERSION_MAJOR_SHIFT	8
> +
> +static void xe_guc_exec_queue_group_cgp_update(struct xe_device *xe,
> +					       struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	u32 guc_id = group->primary->guc->id;
> +
> +	/* Currently implementing CGP version 1.0 */
> +	xe_map_wr(xe, &group->cgp_bo->vmap, 0, u32,
> +		  1 << CGP_VERSION_MAJOR_SHIFT);
> +
> +	xe_map_wr(xe, &group->cgp_bo->vmap,
> +		  (32 + q->multi_queue.pos * 2) * sizeof(u32),
> +		  u32, lower_32_bits(xe_lrc_descriptor(q->lrc[0])));
> +
> +	xe_map_wr(xe, &group->cgp_bo->vmap,
> +		  (33 + q->multi_queue.pos * 2) * sizeof(u32),
> +		  u32, guc_id);
> +
> +	if (q->multi_queue.pos / 32) {
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32),
> +			  u32, BIT(q->multi_queue.pos % 32));
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32), u32, 0);
> +	} else {
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 16 * sizeof(u32),
> +			  u32, BIT(q->multi_queue.pos));
> +		xe_map_wr(xe, &group->cgp_bo->vmap, 17 * sizeof(u32), u32, 0);
> +	}
> +}
> +
> +static void xe_guc_exec_queue_group_cgp_sync(struct xe_guc *guc,
> +					     struct xe_exec_queue *q,
> +					     const u32 *action, u32 len)
> +{
> +	struct xe_exec_queue_group *group = q->multi_queue.group;
> +	struct xe_device *xe = guc_to_xe(guc);
> +	long ret;
> +
> +	/*
> +	 * As all queues of a multi queue group use single drm scheduler
> +	 * submit workqueue, CGP synchronization with GuC are serialized.
> +	 * Hence, no locking is required here.
> +	 * Wait for any pending CGP_SYNC_DONE response before updating the
> +	 * CGP page and sending CGP_SYNC message.
> +	 */
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !READ_ONCE(group->sync_pending) ||
> +				 xe_guc_read_stopped(guc), HZ);
> +	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {

As this series isn't quite right for VF migration, I'd leave out any VF
migration changes. However I'd add a "FIXME: VF migration" in a follow
up + maybe open a Jira to track. I'd like to VF migration working for
multi-queue by the time we remove force probe for a device with
multi-queue, so have a bit of time and we discuss further on how to make
this work but I think it shouldn't be too bad.

> +		xe_gt_warn(guc_to_gt(guc), "Wait for CGP_SYNC_DONE response failed!\n");
> +		return;
> +	}
> +
> +	xe_guc_exec_queue_group_cgp_update(xe, q);
> +
> +	WRITE_ONCE(group->sync_pending, true);
> +	xe_guc_ct_send(&guc->ct, action, len, G2H_LEN_DW_MULTI_QUEUE_CONTEXT, 1);
> +}
> +
> +static void __register_exec_queue_group(struct xe_guc *guc,
> +					struct xe_exec_queue *q,
> +					struct guc_ctxt_registration_info *info)
> +{
> +#define MAX_MULTI_QUEUE_REG_SIZE	(8)
> +	u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> +	int len = 0;
> +
> +	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE;
> +	action[len++] = info->flags;
> +	action[len++] = info->context_idx;
> +	action[len++] = info->engine_class;
> +	action[len++] = info->engine_submit_mask;
> +	action[len++] = 0; /* Reserved */
> +	action[len++] = info->cgp_lo;
> +	action[len++] = info->cgp_hi;
> +
> +	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_REG_SIZE);
> +#undef MAX_MULTI_QUEUE_REG_SIZE
> +
> +	/*
> +	 * The above XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_QUEUE do expect a
> +	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
> +	 * from guc.
> +	 */
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +}
> +
> +static void xe_guc_exec_queue_group_add(struct xe_guc *guc,
> +					struct xe_exec_queue *q)
> +{
> +#define MAX_MULTI_QUEUE_CGP_SYNC_SIZE  (2)
> +	u32 action[MAX_MULTI_QUEUE_CGP_SYNC_SIZE];
> +	int len = 0;
> +
> +	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_multi_queue_secondary(q));
> +
> +	action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> +	action[len++] = q->multi_queue.group->primary->guc->id;
> +
> +	xe_gt_assert(guc_to_gt(guc), len <= MAX_MULTI_QUEUE_CGP_SYNC_SIZE);
> +#undef MAX_MULTI_QUEUE_CGP_SYNC_SIZE
> +
> +	/*
> +	 * The above XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC do expect a
> +	 * XE_GUC_ACTION_NOTIFY_MULTI_QUEUE_CONTEXT_CGP_SYNC_DONE response
> +	 * from guc.
> +	 */
> +	xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> +}
> +
>  static void __register_mlrc_exec_queue(struct xe_guc *guc,
>  				       struct xe_exec_queue *q,
>  				       struct guc_ctxt_registration_info *info)
> @@ -670,6 +790,13 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD |
>  		FIELD_PREP(CONTEXT_REGISTRATION_FLAG_TYPE, ctx_type);
>  
> +	if (xe_exec_queue_is_multi_queue(q)) {
> +		struct xe_exec_queue_group *group = q->multi_queue.group;
> +
> +		info.cgp_lo = xe_bo_ggtt_addr(group->cgp_bo);
> +		info.cgp_hi = 0;
> +	}
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> @@ -700,11 +827,18 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  
>  	set_exec_queue_registered(q);
>  	trace_xe_exec_queue_register(q);
> -	if (xe_exec_queue_is_parallel(q))
> +	if (xe_exec_queue_is_multi_queue_primary(q))
> +		__register_exec_queue_group(guc, q, &info);
> +	else if (xe_exec_queue_is_parallel(q))
>  		__register_mlrc_exec_queue(guc, q, &info);
> -	else
> +	else if (!xe_exec_queue_is_multi_queue_secondary(q))
>  		__register_exec_queue(guc, &info);
> -	init_policies(guc, q);
> +
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		init_policies(guc, q);
> +
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		xe_guc_exec_queue_group_add(guc, q);
>  }
>  
>  static u32 wq_space_until_wrap(struct xe_exec_queue *q)
> @@ -712,11 +846,6 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
>  	return (WQ_SIZE - q->guc->wqi_tail);
>  }
>  
> -static bool vf_recovery(struct xe_guc *guc)
> -{
> -	return xe_gt_recovery_pending(guc_to_gt(guc));
> -}
> -
>  static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -833,6 +962,12 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>  		return;
>  
> +	/*
> +	 * All queues in a multi-queue group will use the primary queue
> +	 * of the group to interface with GuC.
> +	 */
> +	q = xe_exec_queue_multi_queue_primary(q);
> +
>  	if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>  		action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>  		action[len++] = q->guc->id;
> @@ -879,6 +1014,18 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  	trace_xe_sched_job_run(job);
>  
>  	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> +		if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +			struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +			if (exec_queue_killed_or_banned_or_wedged(primary)) {
> +				killed_or_banned_or_wedged = true;
> +				goto run_job_out;
> +			}
> +
> +			if (!exec_queue_registered(primary))
> +				register_exec_queue(primary, GUC_CONTEXT_NORMAL);
> +		}
> +
>  		if (!exec_queue_registered(q))
>  			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>  		if (!job->skip_emit)
> @@ -887,6 +1034,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  		job->skip_emit = false;
>  	}
>  
> +run_job_out:
>  	/*
>  	 * We don't care about job-fence ordering in LR VMs because these fences
>  	 * are never exported; they are used solely to keep jobs on the pending
> @@ -912,6 +1060,11 @@ int xe_guc_read_stopped(struct xe_guc *guc)
>  	return atomic_read(&guc->submission_state.stopped);
>  }
>  
> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> +						    struct xe_exec_queue *q,
> +						    u32 runnable_state);
> +static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q);
> +
>  #define MAKE_SCHED_CONTEXT_ACTION(q, enable_disable)			\
>  	u32 action[] = {						\
>  		XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET,			\
> @@ -925,7 +1078,9 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>  	int ret;
>  
> -	set_min_preemption_timeout(guc, q);
> +	if (!xe_exec_queue_is_multi_queue_secondary(q))
> +		set_min_preemption_timeout(guc, q);
> +
>  	smp_rmb();
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 (!exec_queue_pending_enable(q) &&
> @@ -953,9 +1108,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>  	 * Reserve space for both G2H here as the 2nd G2H is sent from a G2H
>  	 * handler and we are not allowed to reserved G2H space in handlers.
>  	 */
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET +
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
>  }
>  
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> @@ -1161,8 +1319,11 @@ static void enable_scheduling(struct xe_exec_queue *q)
>  	set_exec_queue_enabled(q);
>  	trace_xe_exec_queue_scheduling_enable(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 1);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  
>  	ret = wait_event_timeout(guc->ct.wq,
>  				 !exec_queue_pending_enable(q) ||
> @@ -1186,14 +1347,17 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
>  	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>  	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
>  
> -	if (immediate)
> +	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
>  		set_min_preemption_timeout(guc, q);
>  	clear_exec_queue_enabled(q);
>  	set_exec_queue_pending_disable(q);
>  	trace_xe_exec_queue_scheduling_disable(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_multi_queue_secondary_sched_done(guc, q, 0);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
>  }
>  
>  static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> @@ -1211,8 +1375,11 @@ static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  	set_exec_queue_destroyed(q);
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_deregister_done(guc, q);
> +	else
> +		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
>  }
>  
>  static enum drm_gpu_sched_stat
> @@ -1655,6 +1822,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  {
>  	struct xe_gpu_scheduler *sched;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct workqueue_struct *submit_wq = NULL;
>  	struct xe_guc_exec_queue *ge;
>  	long timeout;
>  	int err, i;
> @@ -1675,8 +1843,20 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
> +
> +	/*
> +	 * Use primary queue's submit_wq for all secondary queues of a
> +	 * multi queue group. This serialization avoids any locking around
> +	 * CGP synchronization with GuC.
> +	 */
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +
> +		submit_wq = primary->guc->sched.base.submit_wq;
> +	}
> +
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
> +			    submit_wq, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> @@ -2413,7 +2593,11 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>  
>  	trace_xe_exec_queue_deregister(q);
>  
> -	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
> +	if (xe_exec_queue_is_multi_queue_secondary(q))
> +		handle_deregister_done(guc, q);
> +	else
> +		xe_guc_ct_send_g2h_handler(&guc->ct, action,
> +					   ARRAY_SIZE(action));
>  }
>  
>  static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> @@ -2463,6 +2647,16 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  	}
>  }
>  
> +static void handle_multi_queue_secondary_sched_done(struct xe_guc *guc,
> +						    struct xe_exec_queue *q,
> +						    u32 runnable_state)
> +{
> +	/* Take CT lock here as handle_sched_done() do send a h2g message */
> +	mutex_lock(&guc->ct.lock);
> +	handle_sched_done(guc, q, runnable_state);
> +	mutex_unlock(&guc->ct.lock);
> +}
> +
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  {
>  	struct xe_exec_queue *q;
> @@ -2667,6 +2861,44 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>  	return 0;
>  }
>  
> +/**
> + * xe_guc_exec_queue_cgp_sync_done_handler - CGP synchronization done handler
> + * @guc: guc
> + * @msg: message indicating CGP sync done
> + * @len: length of message
> + *
> + * Set multi queue group's sync_pending flag to false and wakeup anyone waiting
> + * for CGP synchronization to complete.
> + *
> + * Return: 0 on success, -EPROTO for malformed messages.
> + */
> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> +{
> +	struct xe_device *xe = guc_to_xe(guc);
> +	struct xe_exec_queue *q;
> +	u32 guc_id = msg[0];
> +
> +	if (unlikely(len < 1)) {
> +		drm_err(&xe->drm, "Invalid CGP_SYNC_DONE length %u", len);
> +		return -EPROTO;
> +	}
> +
> +	q = g2h_exec_queue_lookup(guc, guc_id);
> +	if (unlikely(!q))
> +		return -EPROTO;
> +
> +	if (!xe_exec_queue_is_multi_queue_primary(q)) {
> +		drm_err(&xe->drm, "Unexpected CGP_SYNC_DONE response");
> +		return -EPROTO;
> +	}
> +
> +	/* Wakeup the serialized cgp update wait */
> +	WRITE_ONCE(q->multi_queue.group->sync_pending, false);
> +	wake_up_all(&guc->ct.wq);

We have helper for this now: xe_guc_ct_wake_waiters

Still need to scrub the entire code for 'wake_up_all(&guc->ct.wq)' and
fix those up but let's use this in new code.

Other than these mirror nit, lgtm.

Matt

> +
> +	return 0;
> +}
> +
>  static void
>  guc_exec_queue_wq_snapshot_capture(struct xe_exec_queue *q,
>  				   struct xe_guc_submit_exec_queue_snapshot *snapshot)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b49a2748ec46..abfa94bce391 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -34,6 +34,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>  					       u32 len);
>  int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
> +int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  
>  struct xe_guc_submit_exec_queue_snapshot *
>  xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
> -- 
> 2.43.0
> 
