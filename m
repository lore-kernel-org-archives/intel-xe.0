Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357A7CD98F2
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 19:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C5310E123;
	Fri, 19 Jun 2026 19:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IQVqriEo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5356710F52D
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781896338; x=1813432338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sH9VL3+5ttsXEmF1coADRGk1H4BHlygA/MNosgS1Rdw=;
 b=IQVqriEoAb0V6Rji4pphA6lSrpkkVps9deedqIFyrZ0QFwYKSS7d71ua
 QB2g955IxBx/yoDYUpcNpt8HaE1Bh9w4wqLtjPMg98UvpzVoLi4HVXbhe
 RKf5Mrrf89K31lg1biD+waa5SctoqOIqpA1vGi1+t2JbgtkcbnyxiQp0s
 eEI+XRaJM1TrdY2seNd10Y/uMLd6NnKyqUmhazjT8mWTPesEFsTr9mYrT
 VxUCcvQVhyedNwTNHPJkr1JVsqf0rr1EwPxfuK6PGe1oIyNvePMyVs0az
 XA8o6d7Cdff5lz5vR2asTGUqazbGGn2c2n9KYZgs6s5skgRZGjR76u/U+ Q==;
X-CSE-ConnectionGUID: 7/9OaChbSDCEO45+QxRbOA==
X-CSE-MsgGUID: WnwFyDvrSEu7nBihL0/i5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="81845240"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="81845240"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:18 -0700
X-CSE-ConnectionGUID: llAc9VfATtyXn0fagSggnw==
X-CSE-MsgGUID: wkuHYvlfSbm04BmWWthSwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="248753263"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 12:12:18 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 19 Jun 2026 12:12:17 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 19 Jun 2026 12:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjerD9TpKn7Xkw6eWZ0yt+pZrVRzvAju5Jq+9SPc2aW0nVWAr2sJgXVNDZzM0S+Km12ZXZf2qnrxTBM7dzOBlfP3fOUgs406R0SKu5p21sYKrYAcBCgq3m2a3kcKHUP7phVMhYnhjqCyO/KDklaUz5R/UtNnTMgd0gKAPIY2O6/VZVca5KRkFVPPXSo5p8fj7RLNuNAPuGBWiRpS+O/z+NQPMokJBpfn/XlfPna/antN0F7KPxYc4AKbbcSaVoZscNHHuLh1dKcGLmk0SYHy+G7ritjPN51QBEQqgfzJMjwG3lwcIxAyBxttuzhdVlEwYGXQTbu5K6L5xETTCHDMQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/RmRj2rnIJKXBWELdWl80t5EePsODjR4/K0zeopni0=;
 b=uxSi3XGYMuVNmfAgxPVWf9IZrZz4YnpHxV8Zb1VvgN21Ys6pTo4+zzewxYwCjF5TBWkScUYXyYlXPcyaMpyPIlb28Xdw212CuQjwBAmx2IKQETdIVzZc2o3EbWoP4CQbLz27sKoWqtq1hk/FIRrlY6Y67YneL+f+BJOFrehYjxgb3PeEX6ZShyDmCQ6HVDukObb5pL/YG2eesGd73PkuPjuq9/WZ8OVlP84tvH3Gavh+w06TYYnSMcHu7O6+3AwyyboV1iZR9fFF5i5LguB/HnGzi0KhypBqAWvHUAF4Kr/WYbxW2QVZtfb5H2V48lCpt7KZhQHY8fygBANSGmmemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 19:12:15 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 19:12:15 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v1 7/7] drm/xe/guc: Allow reserving GuC context IDs without
 retained range
Date: Fri, 19 Jun 2026 21:11:07 +0200
Message-ID: <20260619191107.2628783-8-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
References: <20260619191107.2628783-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 704d0ef5-e111-4398-06cc-08dece36ac9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1qWR49NzePYgEJYpYe4N2qR+4aXAjEXeiPI93MvrN0dmEpL/Xv8W5fQi5+4ePLWl0bwUFOpCv2m5A8qf3+sqMPAUdt3usljGVOmKFlDmD1OqTXjeIts6zw/87R7ZHGPsAzVbQnsb5Juv6VYPOjswE02FQOna13OxHpKdDv3uw2DVvizzeWYYqFA9VwNHh0dZ7Feb/d2VKpDr+iSEJUACtwpu6lub+rIPdNXw7ro5wX7rERUTohvL1wU7mHvyAmgrSbn23wTUvYe0iKBJt/uXUKiuc/SSIY3DNrp+UVr97PJ//RcQEshaPOHMMMdb5oX3LqcnkP6MVcj3CqmpNg91SEydYhg3C1SwtpD6Wv+xHxP2HWNhSFdDid2KVTiCNkkgBeXyXK5EVcaz4TmRxCUk9HN73mXtjnvHP+YVbuSatyVLmmKYZ6ufJY5cv9myyWxcy0nUiq5lu3+jzB5jCGFnEtrDjqU7AD6FtTkJGGlkqgxqKyo0vFJq86GVx2vRtSRKpl0knqhfZ9OdkPMFoQDGBxRY9uE4fEPkQKWAmK/Daw2DeZLDZlM54/21LOVDJ6tDDdSzqg3rcVso9m5GnE5vrkWEbJydzJk5X5gNEzD4/ucSke7YUZgFlcINSee6fX6yOT0Z0rOKc1MqC/MWB6yQpxiZ0QHdw9hvHaMb6vATQ+4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEZQWGxqbEw4M2wyeHF5MWpFVkdxeHZXYVdFcTV5dCt5ZE1ObmRzZkNJc1p6?=
 =?utf-8?B?UFNTMnRmOURScDFYK3FiL2JiQmtYSUtMbHNhbzBqZFYzUE9xMG10Mkd6RWtT?=
 =?utf-8?B?aXA0YXJFbGJnVmlRRkkya3M2RmtrWDZCMWZLQ01mUmZFZ0ZMVDRUbjFqblVL?=
 =?utf-8?B?blNPUnVTYVVEQWRRQnFNaHVKTWVmOVcvdHEzaXRaMTk0TEtNTFBFREMvd0R4?=
 =?utf-8?B?YVMrb0lNL3lGOTFLWDhCNFdVVEtoR1g2dHdBSDhnVWRhVitUZVBoY20xQmRx?=
 =?utf-8?B?a0p5blQ1U0d4ZHczK05CVlNzVXJyN25WZjhYQlkxSXpDRVJsbkZnbE1sUWdv?=
 =?utf-8?B?YytLbFRYRkR0UWlNdWFocmtJSzcvU2VCb1FvZVU0NnNrZ2xjR0lveEpadm0w?=
 =?utf-8?B?QWxJMjVXSVJTNGY4QzhLU3BpVFBZME1mcXh1cHE5ekpaelVyWkdBR3R6a20w?=
 =?utf-8?B?S21GMndwbFJla1VPVWpFalkzaWtUTEQ0TWgxbitiVk5Hd2xtL3l4Sk9zZFNH?=
 =?utf-8?B?LzJxR3l1YS9OZ2NJaFoxbzh5RU44dXkzeUYvenFncjh6Tlo0RHVkbWl4cXlX?=
 =?utf-8?B?RlE1YjArVGFtdEgzZHZIaXVHUXBSN1l4U0RPcUEyUkU1SHRSZnllbkVvSVRL?=
 =?utf-8?B?bmVmenA4bmlWdlJ0RnBMamZjOUhPZG0yRmhNeDhwRXpGVXlTOFVNRloydUg0?=
 =?utf-8?B?VFFvbnpaUmlFSTlDUGkvam9EMzZNaGl4QUlqSmVjN2U4cmdRa25LektVZUdO?=
 =?utf-8?B?eUxFeUczTzU3Y0xhQ3FRdEpvekwrNjhwd1A0VDVqbkVmUFdrOXoweEd6VXhY?=
 =?utf-8?B?aHhwOTlkcEpZUlE0UnZ2ZEtwZ3RWeG0vS01nM3dXRWZqeEFNYXo1MUNwanhQ?=
 =?utf-8?B?RkpGYmQ2RHk5bnREODlXL0lKbHp2ajhTM25NVjV2TThBTkNDM2J0YVJKNmFD?=
 =?utf-8?B?bENGTWt3VE9YNDFDemVWcGNibGx6aFVpLzhERnFHNmdLOTVxbDFNVzk3alJ1?=
 =?utf-8?B?R0JXQUY5N1ZkTDBTZm55RE84TGp3YUlDeXI4eGhnckN3U0VDMVl0R09aUGRF?=
 =?utf-8?B?bWQxV3Y1ZHBSdkJCSlpsQlpHNXNNNkRYZTArVlp4TE16VEczVUp3elVhMDI2?=
 =?utf-8?B?QXFKenNLbEZsbGd1dlZtaDN6a3Z4WHNCSkpwcitmUS9YUUFlajhQcEo3YnZq?=
 =?utf-8?B?MjZUeDg5U281UkI3Z09RVmZNeDZwdUsvZmRIb2FZQ2s1SVJ3MVJDa1NSMkpW?=
 =?utf-8?B?Ym14VERnNGdGYkFWNUVTMS9oWENkSmhDYjBFd0FFM1JRcGlhbzBUR1JmT2Nw?=
 =?utf-8?B?b2MxeFVFWkh2WnpKNXN4dm55MEN0OVVWRW5GcWQrZWZNdWhINnJaUWdWMWYy?=
 =?utf-8?B?NnhXdmZtTEl5R3ZZc3BCMjE2blh6bXJZMDBMS1lhRk9BcGdrNWlnR0plYUk4?=
 =?utf-8?B?L0hmb2pZMzRsN0xMaVBpRmhZd0J0UmdzZWEzOVFYNi9OOXhZNVRzWkF1SmNv?=
 =?utf-8?B?a1ZsTzlPZUVpNVpaWjlNSFpXYXFRbVBoWXBUNXg0b2paL0FKR0w3M2gxUjRj?=
 =?utf-8?B?aXdHR0svQ1JHWnY5dklMTmhxV2IxQ1REZWVyK29ZVE41QlVlN3BGRGEvMGt6?=
 =?utf-8?B?L0h4YzJWMVdrNnBwZVJvQ2Z1TVhSTUFVc3hXZkNvZ1ZyMlN0MVVod2JzVVZq?=
 =?utf-8?B?NStkNE5lbHM1ODdVVGZmQ1BHLzMvdGRFWTB4emRGOTNEMEtXUVJCM1RrMzBT?=
 =?utf-8?B?bjIrSzNsZkV2dnB2OE0vNkFtcmhoOVVFTWdNRXN1NFA4RGJuM1JkNksrQS9s?=
 =?utf-8?B?YXpLUVltRnF1WkpWSUZML05uSHdQWC9aUGt1Q2tGOHFkMDc5UUxPVzNQc0VJ?=
 =?utf-8?B?Q1dvbWtLZTZzZ1dSYjE4Q05JeTh2VUZHd0d4VzZra3JHZFZzb3IwWlhIOWx2?=
 =?utf-8?B?eEpNMUJoTWtFUVZJWmRRWkRGL1F0b3ZITDJvTFE3T0xWM2VBWklqaC9KWkJw?=
 =?utf-8?B?dEk3cWd3ellPUVNzMG9OME5YVWZOaHpuU0NLcTEwK1ZNSzR5WG9waXdxN3hU?=
 =?utf-8?B?Tm5rWkd2bFRXZEdma2s2aHhueFloT2JrbkpGdDRRT2hqaUlTRDkwNytRTHpp?=
 =?utf-8?B?cWtqUUdRUDcwTFB4V1gwUHY2dGV1WnpudzZHaktmQnEvSEk0OTRWSm1xVWZj?=
 =?utf-8?B?aHlsbjNMZWNlUjJYdDhrQ2hML1dlRHA4czBlVHdjMlFwNG56YXRmZXJ5aTBk?=
 =?utf-8?B?KzlSTG1wY0ZROU55S3VNSkpVYkphVjhrZUNjZWhjanl4UWpTWnpsVHIxbjNl?=
 =?utf-8?B?ZG9nUEc1VWRRYjBQaFFQWE5jV0RLR2ZBVkdDU05sbDBML25rYXpWaUcwODVu?=
 =?utf-8?Q?2E8KH3jjI8Ez9Pco=3D?=
X-Exchange-RoutingPolicyChecked: rWJ94msqxj9AvvcHqQSISY1VqxLIv+aK1ie/sK3wzAf4RVDqTVPteg4DzCUUkypyFLraK/reIXI6ih6HR1jZdfQBFRqd7sDr0Qt0aukC/K6Xphh9991kf/7RQCdENyZmKhfXzeiFN0Xuxbi3q2CHQkLUS9SDKi/uR1tjjN3gqiy6dNK33bOI7oBrMFGk1ol9vvsktuWUGgdgvr7Q/1j8McFnMt/mLR5s9B0fbzgjCI1q1/7ivMrCOk3EjDwOhjN6EJ80jAGkZBCLTKVpi9F+ibZKV+xM25d2cYEiDScYFUjYmgegDJmeGPr7JyClv6j3W3rMiKazFtTb1Vta64ivWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 704d0ef5-e111-4398-06cc-08dece36ac9e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 19:12:15.3807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uib1uymvHmTwVE4NlnPi7jyyrIl37yJjaNl+rvqGrfn/3XqOJ1BJ6vB38R0nKooL9J8+UW5GjnNfjHr6P5MWkdPJS4y/aK3DqPrmVCKObvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The GuC ID manager currently requires that some IDs remain available
after a reservation is made. This assumption no longer holds for future
use cases where PF and VFs operate on separate GuC ID pool.
Let's remove this assert, to allow reserving GuC ids without retained
range.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index 8eaf2ca46f37..925710f22418 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -250,7 +250,7 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
  * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
  * @idm: the &xe_guc_id_mgr
  * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
+ * @retain: number of GuC context IDs to keep available
  *
  * This function is dedicated for the use by the PF driver which expects that
  * reserved range of IDs will be contiguous and that there will be at least
@@ -265,7 +265,6 @@ int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
 	int ret;
 
 	idm_assert(idm, count);
-	idm_assert(idm, retain);
 
 	mutex_lock(idm_mutex(idm));
 	ret = idm_reserve_chunk_locked(idm, count, retain);
-- 
2.34.1

