Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB7410F2865
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 19:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06B410ED0E;
	Fri, 27 Mar 2026 19:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcxdMRPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ADE10ED0E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774639303; x=1806175303;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7+kkQntiGlaqIPh/r1n82PPL5yUfDSQaVJZRX26q6YQ=;
 b=GcxdMRPzUsypETcv4WcvQa6+nbI0Qj3GcEIEuVGvHM1sP2A13DZyti3H
 K11vUA+5B0+Wtfn7cEfChPG7I+CfNRyJtE01VPXKMro2WDRp3Fk0lSRLl
 zfU9Dg58pTbdzjtxvdw8BTxQWYHMW1BRpe+mV7IRX67ogSCpXiNIZJs1z
 2Y4wqAmOTE/+FHNFR1u0u14xA+E6Mwd0OiRfLId9EMVDE1M8s6m8c115B
 L1NmCMi8jRyI1YAzCW7+cf3QN4wAxPJPyzIL7NSIqPmYwji75hnXg0dh1
 kJfPcH7ttRqoHTBiPQ4QKCRMjrkBUgwKbVn+67NGVxTE7rqze3pUzxQSb A==;
X-CSE-ConnectionGUID: YgjSDaVDR6K18A8M5XJzEw==
X-CSE-MsgGUID: QU3DwbHyT5WlXyTwusAJ+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75786921"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75786921"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 12:21:43 -0700
X-CSE-ConnectionGUID: m58xIRs1SK6Zd3T1umq02g==
X-CSE-MsgGUID: oi6v5INmSx2i5AaIfIMKYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="248436151"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 12:21:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 12:21:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 12:21:41 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 12:21:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWy/kORmcWi1yP8Q0MZQBC/xE1nxKpuxAk8Tne7BBgcjoS/4pQCvvLP2k5tD02/FV9Q2ndLYWKNxEVHYUzdSepuetW7RaKuX03tiz4OnMd8OSNg5QLCwGIpp49iQsdfqzZevqZpPAQp0OIPLsCfAMk5vhY7N+/DNoF9XvgOYWfr1aNWTup4jTaxo39chhqlkdz5E8+uRWUtMdHYIJLRAihU+DMFSsPpbHIjsgHFzwirmE32V3iAeNn2bLJwNY7LNpFJG8+vUH409WNM4hOMCYlGoyJ7FMquN9EwZkPHtu0ncN7wGaPow9GvdMOnIJRqEGOPtIgIInzzFOBAqhyo23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xIKZmGrfqpYYxw4SsOC8351luIW7evdUgUvB6EHlSF4=;
 b=ITT3O6tZvqglRExjf2h0fLbjeQwT+Dhed6dRViyfUurJulcMBN2pU0P5vq5nJZAIeReVpVwXoauge3SGSrzQz4JV3ppPmQ5meg/LrIzqbZtW+wZ0Qzl6/T8+APxIsmCQYElKyg/1biXGq8MzISx0ir5xz2V2lM2piQKGYBYPNf0e+DBkd1o7Kes68rYxZwB4u0nHIDqjOw8icRYdFAX8DgR2pdB9nUzRwvs4zM8NzcTwxnoeOmTqTv84WtxMvDb2249mQeoio9PyS0G08FLbBXZHJu3rWNqBU5vSesfZL2iEPi3sL8BexfXD3VnD4DoANjEnAkM77qGkeKenhLIyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by LV4PR11MB9468.namprd11.prod.outlook.com (2603:10b6:408:2df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 19:21:39 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 19:21:39 +0000
Date: Fri, 27 Mar 2026 12:21:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Document GT statistics
Message-ID: <acbYv2BIs5RqDV7V@gsse-cloud1.jf.intel.com>
References: <20260327155817.201865-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327155817.201865-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|LV4PR11MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: aea61dc9-6186-4918-0bd1-08de8c3611cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: 5FNqm3J6TvcVCbF0Q0XbBRk5iXmmYkLROQ3y+ZYGFx27Aep4nMJwtXV6kVRiCdvXuNByGWYa/c6GN4eCl1RdpfO9gkXWS0Ta2wJf8aOAmsYZ1PaJo+n8gfoEZEtvEcebSSVwP49jzG3rRSZWrZYLNCH0GHFme8rnkwBJit9Mf5nF9+fMePetepZ4H5NUurBfWtR9770uZ+47v38IHvDaJkC3g+yK+SVuLyQWGxlQrGGkBEqFc9aiSwRmzi8JJ8EyRPWViYakPJqZcg0FLv0i9FYeB3a0EP3ym4SUqLzIvqs92h9Jx7lTLc1jBYPH4Ky7IRUBOA7KVYehOZ2tRFzTicT6ZM3LD81vXPtZo7+p7fXzPSG+Hfziw/WJsAfPdNGM0qCHpsT5DTkKRxrVcFy+flN8/3mp+Ex3JgejG8oaTJOHe8TEyPJ1zEglG5vbRuG8O8FvdfCBYhjdRizagrNK7z0dyv4qLPoqVuwKM7mwddDNkm7XxNRLk8r4K1dqkF8MINeNvY4rQ/D24PcvNHydMpY5n1basFoj+IaEGrl1VYuUDH26J+kcCPO5lhycGU4Edo8pu2P0McQNzKxndONgPij2VApuvA8Lu7EDSWCPyt1zkuvxIDsI/mzsC6KRf9HTA5jY/KEMQZQWil7/ALAkQg+aG1wjipAGWeRgjZMycLOa5VJ84djolDlirVoPzO7yVb4wju1G1ko54p0I9KZMTFriELhbkMQ7TgyDyrkBNdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2Z4TjNGRlVLelZmSjVxV3BmaWx4NkdGQmIvd2w4R0RlbVpBR3NBMkRKUkpn?=
 =?utf-8?B?NGJBN2drR0g3MjU3VGkraWdQRlRyd0FwSldIMFhNN0VaMmpPSmpVTmxjZUJG?=
 =?utf-8?B?cDJrV3hFVTEydy93M0xQeTZLUVVJcnh5TGxsczBpa3RXRUtWTHlMQ254eUQ2?=
 =?utf-8?B?eTV4Nmczek83T2VDNElUZTFEQ1RsaVZ6b01TcTRSZmJRSElMNHpXODVWWjU4?=
 =?utf-8?B?QmM1SjdYZTNHRTNjTWk4VUhidXZLR0ltalVMZFJudGtGQ1pYQ1RtZzgwNUNu?=
 =?utf-8?B?c1NlYmF1TDNJRnFCWFNPZ2FRQkhGaEJhNWxFdVlUd3VUMXFmaWlZZW4xRHlm?=
 =?utf-8?B?L3dOWDBrelUwVkw5Nm13Tnd4WXpNT0pJMjZ1eWZScEVmd1JDQmZhTm9adVpS?=
 =?utf-8?B?TnQ3NG5NR01XVzVwRE0xcStjQlZhaW1GWUhWMUVMOUhqRFgycVk0QjVPV3E1?=
 =?utf-8?B?emtYYUZPZjJxcjdNSUlzeUFLR2JMN0hkRTB4UlJHVUE5MUNIaTdad1JDT2NC?=
 =?utf-8?B?S2NUTFRyeUdjTGdIaVBtWWFZSWE0TjQ5WEVGcmhuWDFkcUticGYyRDZwSE9I?=
 =?utf-8?B?ZFR1UzBkMFQySVdNS3dUTThtTUZ0SURJQzhkODVqVFEzSkFLcFJNNkFoODY5?=
 =?utf-8?B?N05oY2trL2preXQ4dGd0T2FnVVlySXBiakJSRWhUa3Nnby9ha29XZVd3aGFS?=
 =?utf-8?B?bTRrTjQwVkhHdkF1OHU0eWJyY0VxeWtCaVpjN0F6SjNJWHZHWThCSHgxRk5H?=
 =?utf-8?B?Tm10RFlsVWVuUldabGlCbTAya0h0TkphS2Q2NUFXdC9uUGNNREZwWHBrSXds?=
 =?utf-8?B?Yjc1UEhrNmlGZlZ0REVKV2xYYWptUWpKTWtOcmFNZTlxV0pKYitHbnQyRXcz?=
 =?utf-8?B?VWdQQlJPWlUzY0pjaXZINHpOVHc2cGt4cEw4d1JrK21JcFYyMks3NmQxUTJk?=
 =?utf-8?B?bjRVRExPUjBxaW5ZUDd3cFR5dklnQnA4dHhpQ3JrZmdTTFArNUpzQjA1OUNM?=
 =?utf-8?B?VGZBNzBEelRBK0VWNDE2eklFb3N4S0cwUCtncVVWZCtNN1JBWHl4aGppSjNa?=
 =?utf-8?B?R3I5dldERzBLOXZnS3N3ZFpBWkZBbjlwenRJS0dJNmxyNXdsbUhJS1ZxeFhz?=
 =?utf-8?B?cXlybFMxeXppS1pDb2VOWUZzaHZLRERQMlJWcmVDVlN5Ums5SHRqUUNhNlVo?=
 =?utf-8?B?bVQzRGdnbFdRVjNNVzJtRk5OemxqUGdsQW1PMDlOOExmaWhJY0xTejI4MjUr?=
 =?utf-8?B?a0NBR1FZSCtHeUYrRFJWK2p5NjJHZHROUWF5c3FPT3ZoYTJEbS9VQXE0VHN5?=
 =?utf-8?B?Rlo1UFF2Nm82TEhua29CRHRaSHQ0b1JjdzFTL1JJeSt3M3gra3l0MkY4UjZ5?=
 =?utf-8?B?MWlIN2FxbWJ5VUFrRDZ2VStjVmpQUmJ0c01RbGlCRkkvNVAyMit1UHgwNHho?=
 =?utf-8?B?ODVjYk9HZjNnd21Yak53aEJqc1hGaG9sT3FVc2RsYm9HcFlJNDlGaHRqcU9X?=
 =?utf-8?B?NzF0WmJnQm14Nmtla04yNkxMZXoyMytCTGZIb1JhL0xwaDdYMlJRSUN3cGJu?=
 =?utf-8?B?Y0FkdVp2MmNITkFSYThKaEExTlI5NWlhbU9reW0yRFEzNkNOS0ZYUkNvZHFI?=
 =?utf-8?B?cVBHdkR5MFR4bEZENU83WDFNOHUvUDVGSWJ4SzBnNVA0dENrZXZtYkUyOFRv?=
 =?utf-8?B?MEVYVlBjcEJrYjhvVGhWd3JLZUtCSFRuSnBrdFNPL1VnNWdOeC93d0FmaHlv?=
 =?utf-8?B?Q1FBTnFWUG80ek9FKzhoRzd2eTRwdVdaSUtPeldxVWN0QjlGcXoybElUVy9F?=
 =?utf-8?B?eExTOHlRcWpxck1INzZpMlB5YXlMNGw5a3pXcU1xdTZuV1c1dmlNejJlTUZx?=
 =?utf-8?B?VHhqZzdxWVE4ckdKYWp3Z0hwWk9mV1BJYTlaYzlyVnNaMzZmNGgzWCtVc0l4?=
 =?utf-8?B?WmIwdHBwbW1lOG9nOSt0V1RueWdtb2V6WDdYZWRYY3BPNUNYei9rbTFXb1Bv?=
 =?utf-8?B?SHlJS2Y3U3ZkbWFBNlV1Q2wrSWxiaWdVellrSTlUWCtZdU51dDNGSit1My9R?=
 =?utf-8?B?TEYzbzZkNjljeVh5UVpqTllVaW1lQUlLU1JRUEo2eTE2WWtzM3FjaVVHMk9O?=
 =?utf-8?B?b0FsOW8rTTU2cDEwb3R3YnVHNjQ2VlZ0ckFvRHZTM3BTQ052Q3BpVURLVTBn?=
 =?utf-8?B?VFl3UUF1Rk1qOHRDcW4rRVliRzBqMC9ucUgrY3AyM2JTMmw0dm5BT1NMclNi?=
 =?utf-8?B?VDRURDJVSWlqWG9uRjJuL3pldjJTT2pyWElWVWlqRUxCbWhmSXhHZUxuK04y?=
 =?utf-8?B?eXFOUTVmL2FrNm5lZXY1WXJhbTdtNFhTT2ZYVFhtV1R6MWhlZjcrUT09?=
X-Exchange-RoutingPolicyChecked: VNRoDtH7kuiUzl+KaVPK9ADSGR1ZFInZZ0voFphZtcgLXz8oNPtp6lZjGwmWaTg6a56oEtKOh0O1ExBj/Q1LvhN0f5Bxwx5x0Xog9qCC25bqp4v2af5GhLWZoJbc/mNk6gJwwB+mElQKK7HQFQT08xRawxFO+q7+MZohPTw/ArPT9Vydf40AxXna4eVtjf+UEV8A+1p51bgyeMoRtrEM64ipUnZk2jlkDliDKL9EuuUdk++Fmlq25dYH/anE8j9CimPrwU/qenm5rBeG/ubDSkAF1NsSLQvhoxndnU+AWhlwkSCw6S0lyTHI/fdUGoE1Y1+ZKDbRhSRnUbtXnPrh/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: aea61dc9-6186-4918-0bd1-08de8c3611cb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 19:21:39.0695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jA9kthFpG/1w9s/VeF5NsX7C0Q1Yof3psqm8LrMQ1vIeNcUFtA4cVaS6MbLczwC8Yp6D1lyJy3edHwpX++mLaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9468
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

On Fri, Mar 27, 2026 at 04:58:17PM +0100, Francois Dugast wrote:
> In the context of porting applications to SVM, the Xe GT statistics are
> used by application developers to validate expected behavior such as
> proper alignment, page fault count and migrations. As those statistics
> are made for kernel developers, they assume good understanding of driver
> internals, which is not always the case on the application side.
> Therefore, this commit documents the usage of GT statistics and clarifies
> the meaning of identifiers which correspond to the values exposed via
> debugfs. Documentation is close to identifiers declaration to make it
> easier to maintain when adding new entries in the future.
> 

Thanks for doing this - looks good but some small issues.

> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  Documentation/gpu/xe/index.rst         |   1 +
>  Documentation/gpu/xe/xe_gt_stats.rst   |  11 +++
>  drivers/gpu/drm/xe/xe_gt_stats.c       |  41 +++++++++
>  drivers/gpu/drm/xe/xe_gt_stats_types.h | 118 +++++++++++++++++++++++++
>  4 files changed, 171 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_gt_stats.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index bc432c95d1a3..874ffcb6da3a 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -29,3 +29,4 @@ DG2, etc is provided to prototype the driver.
>     xe_device
>     xe-drm-usage-stats.rst
>     xe_configfs
> +   xe_gt_stats
> diff --git a/Documentation/gpu/xe/xe_gt_stats.rst b/Documentation/gpu/xe/xe_gt_stats.rst
> new file mode 100644
> index 000000000000..5ff806abaddb
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_gt_stats.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +================
> +Xe GT Statistics
> +================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_stats.c
> +   :doc: Xe GT Statistics
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_gt_stats_types.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 59b3b23a54c8..789397514f3e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -9,6 +9,47 @@
>  #include "xe_device.h"
>  #include "xe_gt_stats.h"
>  
> +/**
> + * DOC: Xe GT Statistics
> + *
> + * Overview
> + * ========
> + *
> + * The Xe driver exposes per-GT statistics through the debugfs filesystem at::
> + *
> + *   /sys/kernel/debug/dri/<device>/gt<id>/stats
> + *
> + * This interface requires the kernel to be built with ``CONFIG_DEBUG_FS=y``.
> + *
> + * Reading statistics
> + * ==================
> + *
> + * Reading the file prints all available statistics, one per line, in
> + * ``name: value`` format::
> + *
> + *   $ cat /sys/kernel/debug/dri/0/gt0/stats
> + *   svm_pagefault_count: 0
> + *   tlb_inval_count: 1234
> + *   ...
> + *
> + * All values are 64-bit unsigned integers aggregated across all CPUs.
> + * Counters accumulate since the driver was loaded or since the last explicit
> + * reset.  Timing counters use microseconds as their unit; data volume counters
> + * use KiB.
> + *
> + * Resetting statistics
> + * ====================
> + *
> + * Writing a boolean true value to the file resets all counters to zero::
> + *
> + *   echo 1 > /sys/kernel/debug/dri/0/gt0/stats
> + *
> + * Any value accepted by ``kstrtobool()`` (e.g. ``1``, ``y``, ``yes``,
> + * ``on``) triggers the reset.  Resetting while the GPU is active may yield
> + * unpredictable intermediate values; it is recommended to reset only when
> + * the GPU is idle.
> + */
> +
>  static void xe_gt_stats_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_gt *gt = arg;
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats_types.h b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> index 081c787ddcb6..cec0dddf4176 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats_types.h
> @@ -8,6 +8,124 @@
>  
>  #include <linux/types.h>
>  
> +/**
> + * enum xe_gt_stats_id - GT statistics identifiers
> + * @XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT: Total SVM page faults handled.
> + * @XE_GT_STATS_ID_TLB_INVAL: Total GPU Translation Lookaside Buffer (TLB)
> + *   invalidations issued.
> + * @XE_GT_STATS_ID_SVM_TLB_INVAL_COUNT: TLB invalidations issued during SVM
> + *   page-fault handling.
> + * @XE_GT_STATS_ID_SVM_TLB_INVAL_US: Cumulative time (µs) waiting for TLB
> + *   invalidations during SVM page-fault handling.
> + *
> + * @XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT: Buffer-object (non-SVM) page faults
> + *   handled.
> + * @XE_GT_STATS_ID_VMA_PAGEFAULT_KB: Size (KiB) of VMAs involved in
> + *   buffer-object page fault handling.
> + * @XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT: GPU prefetch faults for
> + *   addresses with no valid backing.
> + *
> + * @XE_GT_STATS_ID_SVM_4K_PAGEFAULT_COUNT: SVM page faults resolved by
> + *   mapping 4K pages.
> + * @XE_GT_STATS_ID_SVM_64K_PAGEFAULT_COUNT: SVM page faults resolved by
> + *   mapping 64K pages.
> + * @XE_GT_STATS_ID_SVM_2M_PAGEFAULT_COUNT: SVM page faults resolved by
> + *   mapping 2M pages.
> + * @XE_GT_STATS_ID_SVM_4K_VALID_PAGEFAULT_COUNT: Valid SVM page faults
> + *   at 4K page size, where the GPU mapping was already valid — resolved without
> + *   creating new mappings.
> + * @XE_GT_STATS_ID_SVM_64K_VALID_PAGEFAULT_COUNT: Valid SVM page faults at 64K
> + *   page size.
> + * @XE_GT_STATS_ID_SVM_2M_VALID_PAGEFAULT_COUNT: Valid SVM page faults at 2M
> + *   page size.
> + * @XE_GT_STATS_ID_SVM_4K_PAGEFAULT_US: Cumulative time (µs) handling 4K SVM
> + *   page faults.
> + * @XE_GT_STATS_ID_SVM_64K_PAGEFAULT_US: Cumulative time (µs) handling 64K
> + *   SVM page faults.
> + * @XE_GT_STATS_ID_SVM_2M_PAGEFAULT_US: Cumulative time (µs) handling 2M SVM
> + *   page faults.
> + *
> + * @XE_GT_STATS_ID_SVM_4K_MIGRATE_COUNT: 4K pages moved from CPU to device
> + *   memory.
> + * @XE_GT_STATS_ID_SVM_64K_MIGRATE_COUNT: 64K pages moved from CPU to device
> + *   memory.
> + * @XE_GT_STATS_ID_SVM_2M_MIGRATE_COUNT: 2M pages moved from CPU to device
> + *   memory.
> + * @XE_GT_STATS_ID_SVM_4K_MIGRATE_US: Cumulative time (µs) moving 4K pages
> + *   from CPU to device memory.
> + * @XE_GT_STATS_ID_SVM_64K_MIGRATE_US: Cumulative time (µs) moving 64K pages
> + *   from CPU to device memory.
> + * @XE_GT_STATS_ID_SVM_2M_MIGRATE_US: Cumulative time (µs) moving 2M pages
> + *   from CPU to device memory.
> + *
> + * @XE_GT_STATS_ID_SVM_DEVICE_COPY_US: Cumulative time (µs) for memory copies to
> + *   device, across all page sizes.
> + * @XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_US: Cumulative time (µs) for memory copies
> + *   of 4K pages to device.
> + * @XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_US: Cumulative time (µs) for memory
> + *   copies of 64K pages to device.
> + * @XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_US: Cumulative time (µs) for memory copies
> + *   of 2M pages to device.
> + * @XE_GT_STATS_ID_SVM_CPU_COPY_US: Cumulative time (µs) for memory copies to
> + *   CPU, across all page sizes.
> + * @XE_GT_STATS_ID_SVM_4K_CPU_COPY_US: Cumulative time (µs) for memory copies of
> + *   4K pages to CPU.
> + * @XE_GT_STATS_ID_SVM_64K_CPU_COPY_US: Cumulative time (µs) for memory copies
> + *   of 64K pages to CPU.
> + * @XE_GT_STATS_ID_SVM_2M_CPU_COPY_US: Cumulative time (µs) for memory copies of
> + *   2M pages to CPU.
> + * @XE_GT_STATS_ID_SVM_DEVICE_COPY_KB: Data (KiB) copied to device across all
> + *   page sizes.
> + * @XE_GT_STATS_ID_SVM_4K_DEVICE_COPY_KB: Data (KiB) copied to device for 4K
> + *   pages.
> + * @XE_GT_STATS_ID_SVM_64K_DEVICE_COPY_KB: Data (KiB) copied to device for
> + *   64K pages.
> + * @XE_GT_STATS_ID_SVM_2M_DEVICE_COPY_KB: Data (KiB) copied to device for 2M
> + *   pages.
> + * @XE_GT_STATS_ID_SVM_CPU_COPY_KB: Data (KiB) copied to CPU across all page
> + *   sizes.
> + * @XE_GT_STATS_ID_SVM_4K_CPU_COPY_KB: Data (KiB) copied to CPU for 4K pages.
> + * @XE_GT_STATS_ID_SVM_64K_CPU_COPY_KB: Data (KiB) copied to CPU for 64K pages.
> + * @XE_GT_STATS_ID_SVM_2M_CPU_COPY_KB: Data (KiB) copied to CPU for 2M pages.
> + *
> + * @XE_GT_STATS_ID_SVM_4K_GET_PAGES_US: Cumulative time (µs) getting CPU
> + *   memory pages for GPU access at 4K page size.
> + * @XE_GT_STATS_ID_SVM_64K_GET_PAGES_US: Cumulative time (µs) getting CPU
> + *   memory pages for GPU access at 64K page size.
> + * @XE_GT_STATS_ID_SVM_2M_GET_PAGES_US: Cumulative time (µs) getting CPU
> + *   memory pages for GPU access at 2M page size.
> + * @XE_GT_STATS_ID_SVM_4K_BIND_US: Cumulative time (µs) binding 4K pages
> + *   into the GPU page table.
> + * @XE_GT_STATS_ID_SVM_64K_BIND_US: Cumulative time (µs) binding 64K pages
> + *   into the GPU page table.
> + * @XE_GT_STATS_ID_SVM_2M_BIND_US: Cumulative time (µs) binding 2M pages
> + *   into the GPU page table.
> + *
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT: Times the
> + *   scheduler preempted a long-running (LR) GPU exec queue.
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT: Times the scheduler
> + *   skipped suspend because the system was idle.
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_COUNT: Times the driver
> + *   stalled waiting for prior GPU work to complete before scheduling more.
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_US: Cumulative time
> + *   (µs) spent preempting long-running (LR) GPU exec queues.
> + * @XE_GT_STATS_ID_HW_ENGINE_GROUP_WAIT_DMA_QUEUE_US: Cumulative time (µs)
> + *   stalled waiting for prior GPU work to complete.
> + *
> + * @XE_GT_STATS_ID_PRL_4K_ENTRY_COUNT: 4K-page entries from the GPU prefetch
> + *   request list that were processed.

s/GPU prefetch request list/page reclaim list/

Affects all PRL stats.

Matt

> + * @XE_GT_STATS_ID_PRL_64K_ENTRY_COUNT: 64K-page entries from the GPU prefetch
> + *   request list that were processed.
> + * @XE_GT_STATS_ID_PRL_2M_ENTRY_COUNT: 2M-page entries from the GPU prefetch
> + *   request list that were processed.
> + * @XE_GT_STATS_ID_PRL_ISSUED_COUNT: Prefetch requests submitted to the GPU.
> + * @XE_GT_STATS_ID_PRL_ABORTED_COUNT: Prefetch requests cancelled before
> + *   reaching the GPU (e.g. due to conflicting page faults or memory pressure).
> + *
> + * @__XE_GT_STATS_NUM_IDS: Number of valid IDs; not a real counter.
> + *
> + * See Documentation/gpu/xe/xe_gt_stats.rst.
> + */
>  enum xe_gt_stats_id {
>  	XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT,
>  	XE_GT_STATS_ID_TLB_INVAL,
> -- 
> 2.43.0
> 
