Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE98CC624D3
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 16:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F99D10EDB8;
	Tue,  1 Sep 2026 16:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoB2IG1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59A610ED99
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788281105; x=1819817105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=i/q2YcHpjR7Swr6jaEXa9PBY44ibCn/6gK/nHzEVG84=;
 b=CoB2IG1m1pTtyueWftKAReIDj9aBfw4Jr3Lu4V/NW2Hhvx0BnRgV0dwI
 PcYH2X61EHWqn/cN5dtOjXM5Yqu7nhyW/wZQ1cbBiqyIKpECIRjrhyyYr
 cj/KOi0+KdnACUZt4Hm88IgmHo8DfYpjKIEH0FLRVJ4JABC8Ff20sIWXj
 x/razjQaCB9D3J23aEctHOFNPEG3j0+FIi7ESFsz+ceRzdvn2ty6xIgf4
 lutrztxe7Pp1Wlwi1GL2SO+YJptkaxp/LsVEIkVqI7OOlDTcr0acMVYcw
 l8kvB0ftfPLTIegGQErNaPZigEwYZQQqPEPfP6Lw6UK9hmmYBh0zWJiWg A==;
X-CSE-ConnectionGUID: odadJKdhQUixhbw+NoST7g==
X-CSE-MsgGUID: OPQY1tCBSyiEqKd3BbopYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99881817"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="99881817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:45:03 -0700
X-CSE-ConnectionGUID: oOdo819uQmi7P6+Gpm0y2w==
X-CSE-MsgGUID: fRXI46kjR9+kjSUjXoQ3lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; d="scan'208";a="266557046"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 09:45:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 09:45:00 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 09:45:00 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 09:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5ZmsdGHpCX+LibT3uoLVge5wSqZqxUIPbxdpL+WwEXdqFIPyJFXwG4ekYE6aYlOJ8p5l4qVd/YbZhVIXTEWFEN6+9D5xpltZq4T8wk19stntgktBadu67Shv/2hNdzxmSSxqXqa7a2XQ32wVHgdR/0wXPNB71iEpMk6hseCOB/2C7XIBJRf5dVfzm94zbQWA9dGd04g8wawfuy5y/5tnKbt2eZJfB8wOEwrbW02DyWuE9c0r4a1cLmf9P3+s5oMlMMxgO4IbbpC1ujLFrWSOmbD9YxJ4zi9uJleUnAAO0t4LDNS/INDp2u+bDUXxdiDfa0twKK5FGRieFhuMcwD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP1KyTi+8hJLOt+pkA8pzoTLaTa9r2LxGdyElokQXxE=;
 b=PNq3y7nS/YFEx6/9PCZdl/rRMuJwU7kYN7iWz9q7wHARq9TP872I+U5l/cwbzOVoHHseOdWhUYvTMR98SEkZ76RGQ7Pt16+RDsug4om61S2Au+bnbS3Xo36FJyRZebkFi2jrf88FtDD66Ji0V/ac9yrKKmZiDHkLQYrX7ciCvEJ6/04l4jI0D0YTraQAc1bSrAvmICFhkHxPzyqHdQfA4CJijALdyyl0LFbzBSDhw3k+iqTZuVqGOyF6D35hawHYsNByJkALZT0fXrjax2zZyd5UN63uCBm6xjYXlmqQGXoZO1ti+xbneDNksZmhGRH84dplDS39m57woKn60eH6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 16:44:56 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 16:44:56 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 3/3] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Tue, 1 Sep 2026 18:44:35 +0200
Message-ID: <20260901164435.1395260-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
References: <20260901164435.1395260-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0332.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH7PR11MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: ed51ab49-c07c-40ec-860b-08df08485a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|10067099003|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zyGcdrweNvrNu0TLLvkDiwrUw84ifVjnX1rl32wYF59umFFo3p+kq5qQnMzUs+GFOStEPjf5fYbAUwR1FHtHfenGrEgr1IZemfKE5dZdznSzN/vwhCGyF7O3PMXeUqRFFAQaN8EB/+xAm02VHvH+dp804whdvXeMs028WgwfQysR9cYOk0UOIMCdmOuF08qIHqSkGI9puhl3DQfHZEbCdHHnbY1ClCZSpiX7nJfABMblOjxXB0BZMrf8xROxPGGoJXp6cQecO19z9EGrPguRIHYwIBN5a21IqwcFTX8EsfTKzUjGtw2cA/kEFsTXnellGYnl2ALQXPxUP7M0TZ4w9b+2DTWgfQO657GuECum/BJUYsh8poYwSR3hjIbt/o6omlfSTl6fpPVU8vohKAGPiGIMi05hCPmrmejXJBIxkGYEXmLk0BGCT6wu6k41MO4hROyymlr0TtdUyZdLHsKH5+qmKsOOP1y9+VtvBd2SlFmjKAHGYQavOI9v7k1JTEyyiJnyZ4HAwv8b/0sAS7BTD35b40INxWHpS2SmrIUlo6AEw61Y+CwiRCIUdfIZzXi7bLZPDpa2XNK58ZiBktlxApnfHHRXqFBmqP9no7WOqUv7BuC6EESOuzOO6H9XTMLL/fzr5rf9w2H7ed8I18eV8ki8ddAcBV4pEQFRONqo1Gk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWN6bmx2QUwvcm12cEtoTHpoZ2gyWTRzTjdCc0NhVmVPZkhiL1NLNlBjeUUr?=
 =?utf-8?B?V1dMVEh6Q3cxMVAwMHAxR2doTWdIZW9qOUJhNThpYk91U0IrN0J1Y2d2cWI2?=
 =?utf-8?B?NHBhT2dZMWU1N25OYnFPblhTNTBzQXc5c05ldUd6clJSSEs1SFVSQkZ6T3dl?=
 =?utf-8?B?ZmdoZHlxMVBGYXR2QkhwT0NsN3BTZU41L1FiMEp5NlpteWdvSnBBUlF3bGc2?=
 =?utf-8?B?SlZ6VndZVTBJRk5KbldxL2FQV0ZBTlAwUlBTNVBKb1NrWmorRlR1SFJwK1k4?=
 =?utf-8?B?a0RRVEVrVXRxVElBUXJGbEZ6TGl5WG5WTVhDMmJjaktpVGQxdTRCdUNSeEcv?=
 =?utf-8?B?Nmh4R3Vvc0FhS0toQmRjdG41VEppSExHSVFaRlBJYmkwWWFjWFlTRVhBRWxi?=
 =?utf-8?B?OXJuZFI2NjRaZlFWQjNNUUhqa0JPdjhDQ1AzWktqcnJ3ckRDNk5kaDZrMERD?=
 =?utf-8?B?WExnSWRJWFZncjNLdlYybmJTdE1HNW5nT0kwQXNDa1dYNHQ2OUY0dnRqVFk4?=
 =?utf-8?B?UGNzMlRMUU54TTVNa3Q2Nm81d0g3VjkzRWpmM2o1RHNvN2Q0ZG5lQ3Npejhr?=
 =?utf-8?B?bjFMei9IYW40WXo1bTRISFdsT1RGbDlVT3k1WWQ4N1NIMmxPaWM4Q2xjRDR3?=
 =?utf-8?B?ZlYvR2tDS1VMaVViK29MZkZGMjhhbUVucXlvZUNvbzh0WXVDRm5SQVR1UVZo?=
 =?utf-8?B?eEM3Q1B6c3YxN05ra2VDTWRkWnZ0QVJvdEhhTXI2TE4xaDBYR0ROdzlDNlpH?=
 =?utf-8?B?YlBUT2IwaHJ3SWluZThWSkl3Z1ZlUWxDelE1RHlXNzU3U0ZpL2drTTRuU1py?=
 =?utf-8?B?aWxtMGFaM21iTDQ2Qk5RYmlhM1k4Z1JXdXNEYnNPdFdJcnd5ZnNrbEJOMko5?=
 =?utf-8?B?ZHhtY0JreDYvZEVRdGExbVR2Tnl6dGZXWjFCVTQ3U2RnZFBNejJUYlkySDN4?=
 =?utf-8?B?N0VCVHZncnp4ZE0wWEdUVzd3dTV2QUs1THFNUnd5ZUxrcW92Z1JOWGZ4U1pR?=
 =?utf-8?B?cS83OGJHU1pQb0ozZFFEZUZKZ2d1Q1JxYWNSZXBNQWNDdVNmRWxnd2JLNHky?=
 =?utf-8?B?c2ZVbWZsYldQSkl0ZDhZajRiK1IzWk9tWVpqWU9Zb2ZOUkZJOUovbnlqNFQ0?=
 =?utf-8?B?dldOelgvRjZ3VFVVM3QxOVp2QmwyYisyUWwyUGJZSFBDdkh3UWxDOXJDSmtI?=
 =?utf-8?B?ZkhYeVZRQndHV1d4eTYrOGJ1V3dZdDgzRVJoeGR5eCtXNGJobWc1eVVTUEpo?=
 =?utf-8?B?TEthMXIyYmRxNzNwUGFXNnRZSE5wajczKy9YUlpSSHcvWm9jaGRHRFIweXVE?=
 =?utf-8?B?dlB5bHU1WGNrRzF1aGxxYURUT1FZa2wrL1hRcUxYZEt5VUVTb3VkU2NkLzg4?=
 =?utf-8?B?a0dDd2FPT2c5bGV3S2xLc2xyS3U1cVgxR2FOTVRwaXFTVC9ibzI4SE1sa0Zo?=
 =?utf-8?B?RnJDbjYvZ0xTTmpaeFo2SVdjS25EYTc4d1pTN2tCc1p4dHZuUjZhWmZnYUtz?=
 =?utf-8?B?UVMzTlA2V0pETkptWENYNC82SlhKWmpYUTRiT2xjRG1oV0xKQXRERHV4dGtB?=
 =?utf-8?B?RjMvaC90UzIvcERKTWRLaUNYVVV5Z2kyY2tuVTU4L25udk80K3BuWGFieEpT?=
 =?utf-8?B?Z0dBbW9QcFFXbVBuV0hRZ3J2ZkpJNkFLSWtSWkdmdkE5Y3ZvZC8wT2Nxemph?=
 =?utf-8?B?OW1BVWhYcUVnOGxrSDU3MzVMQ2pjWTkyaElHdTd4d1hoWVdzUG5TWllNZDJh?=
 =?utf-8?B?SnVRZlc1dWNqejF0TUdUaFVHS05mY013S2tvdHNsYzZ2MjZOS1hMSDkwdmtB?=
 =?utf-8?B?dTN6b2Y0WnM0bEFaUGVXLzlsUHVxWGNpcU5PbndpQTNmeWpGRDIzelRFWklH?=
 =?utf-8?B?d09pTDVKbVZNS1dibXVRTVBTbnBXMWowZFhtejdEK1g5SEFMQzIzbVhVMDJ0?=
 =?utf-8?B?K2hNejhxVnM4TlJOWWR4MEJ2UUd4SHdnRWNaRVB1VDVvM0dLRk11bExBdXR0?=
 =?utf-8?B?Z3JRM1J6UkVaSmFrNHFSeUdselVxeGJ6L2FCR0JYVVpZS0M0OVgrYjY0NTJH?=
 =?utf-8?B?UGFjdlR2V0hlT2JURXRXTXpiVjlseWlLT25iUHhoYVdCMEVzWEdmbG1FWW9h?=
 =?utf-8?B?bldHQk9lRXdPYmkrQjFuTXVIWmlWeTJjcWZtQXp5RlV3QnpCSVdpVGVFTGI3?=
 =?utf-8?B?c2hDSk9US3ozN1QzVVZPUWlJWkdQUGRKeEVZS0RBakFOMVRUUkdvQmpYVU9V?=
 =?utf-8?B?aGEzRTlqMmk4aHYyQ1VFRlhGQTdxUkFrQmIxREdQanlhNDNZZ0YzeEZITUt6?=
 =?utf-8?B?SVRqSWNQRnI2ekc4OW5IZHZXcE16V1A4cVBPU0MrQ0lIaTQrVStsKzVoMXlZ?=
 =?utf-8?Q?cjrLpzuGqiJLMpL8=3D?=
X-Exchange-RoutingPolicyChecked: nlmZpxNJmpfVkEOCI9/LwC+5O5kV6VpTNZtJsqV1GyLC4T7ZSVDl7Gnd6azMHIXLHUIfGteEZPNmQ5ZDyNS76jycHYvgOdiqHIiVafhvmjF007CekLBLUglMPB8t56fVW05D8KpUx3HUh3F6wLLtp1Aq5oAafRGLtEc1MizzdwrfPZqB1O2wi4kU5uP0bLq76NjXxt8L4bxpfLPbXqGGxK3oae1OHmosLs13obs6ONaAN2hRx11IAR1VHOiAZiIiMl8hMafDdQ5gSe0+DZDKNxKwFcJzm9AtSOjR5J1whlOAlGbpj+6jhJJftHt+BSNiRn0kA3ruYMfq1D7dDCS44Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed51ab49-c07c-40ec-860b-08df08485a71
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 16:44:55.9929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5G0FvnqmqADMlJRPdGsP7iXhIHH1oQhmh13NId4twLQsE0I5rxCxqJfkJYtiSGb5xjeFyxBDoIabFFCXJmtyudIfwumC2IyrsBFS9rNXt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
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

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

v2:
 - Init ggtt.lock with mutex_init() in each test.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_test.c | 336 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c            |   4 +
 2 files changed, 340 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_test.c b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
new file mode 100644
index 000000000000..7d28b97f8afe
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_test.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static int ggtt_test_init(struct kunit *test)
+{
+	xe_kunit_helper_xe_device_test_init(test);
+	return 0;
+}
+
+static void init_native(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = min_t(u64, SZ_1G, accessible);
+
+	ggtt.hw_size = usable;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	KUNIT_EXPECT_EQ(test, ggtt.start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt.size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt.hw_size, usable);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_high(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = usable;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
+			GGTT_TEST_START + usable - XE_PAGE_SIZE);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = usable;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	node = xe_ggtt_insert_node(&ggtt, usable + XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static void init_shared_pf(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, accessible, accessible);
+
+	KUNIT_EXPECT_EQ(test, ggtt.size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, 0);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt.hw_size, accessible);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	KUNIT_EXPECT_EQ(test, ggtt.size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.start, accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt.shareable.size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt.shareable.start, usable);
+	KUNIT_EXPECT_EQ(test, ggtt.hw_size, accessible);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *shareable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       XE_PAGE_SIZE,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node),
+			(u64)XE_PAGE_SIZE);
+
+	ggtt_node_remove(shareable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       XE_PAGE_SIZE,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+
+	ggtt_node_remove(shareable_node);
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       shareable,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+
+	ggtt_node_remove(usable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *usable_node, *shareable_node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	shareable_node = xe_ggtt_insert_node_shareable(&ggtt,
+						       shareable,
+						       XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = xe_ggtt_insert_node(&ggtt, usable, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+
+	ggtt_node_remove(shareable_node);
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = usable;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, 0);
+
+	node = xe_ggtt_insert_node_shareable(&ggtt, XE_PAGE_SIZE, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt ggtt = { .tile = tile };
+	struct xe_ggtt_node *node;
+	u64 accessible = GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	mutex_init(&ggtt.lock);
+	ggtt.hw_size = accessible;
+	ggtt_init_ranges(&ggtt, GGTT_TEST_START, usable, shareable);
+
+	node = xe_ggtt_insert_node_shareable(&ggtt,
+					     shareable + XE_PAGE_SIZE,
+					     XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+
+	drm_mm_takedown(&ggtt.mm);
+}
+#else
+#define GGTT_PCI_IOV_TEST_SKIP(_name) \
+	static void _name(struct kunit *test) \
+	{ \
+		kunit_skip(test, "requires CONFIG_PCI_IOV"); \
+	}
+
+GGTT_PCI_IOV_TEST_SKIP(init_shared_pf)
+GGTT_PCI_IOV_TEST_SKIP(init_partial_overlap)
+GGTT_PCI_IOV_TEST_SKIP(alloc_usable_pool_low)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_high)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_usable_full)
+GGTT_PCI_IOV_TEST_SKIP(alloc_partial_overlap_shareable_full)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_unavailable)
+GGTT_PCI_IOV_TEST_SKIP(alloc_shareable_pool_oversized)
+
+#undef GGTT_PCI_IOV_TEST_SKIP
+#endif /* CONFIG_PCI_IOV */
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_high),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = ggtt_test_init,
+};
+
+kunit_test_suites(&ggtt_suite);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7fcd686f9729..19f9c564030b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1397,3 +1397,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_test.c"
+#endif
-- 
2.34.1

