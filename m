Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFB0C27C53
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 00:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB9910E013;
	Thu, 13 Jun 2024 00:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jd+HikP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D35410E013
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 00:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718240082; x=1749776082;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u/BkQebcGr7lRza0hUpnDLZVdUBYcMqIGjm7irPR+6E=;
 b=Jd+HikP5VzQ9gnzm6SKkfr9R4Z5SDPJjq1mkgynnXk+A/Onwaj41S2X0
 H7O6ENAva6FcEtWI9vsOPnkGx62FcoLIChpXNZIwru5eBjD6r4A5CHy+e
 ty/gHut+UWHXuusgS1Z8YpH1cXs/odH836JA1gkSsDFX8PKY76DdaLn9F
 HEx0wHBhHhvct3XJsNRENQlzYSv+7YlJwMAlGyYlH34v3DKEkznXxaNEs
 hmYXZYzPMyXClL/wvjKvSairorU0dNWm4Tvvyx+LbHHO7VwFDhEANsN5p
 SkbW13/kPgztWeJwxZDfXBmmYFeKdPFioV78I4NPUMaIEzeE53huqWOYk w==;
X-CSE-ConnectionGUID: lqUM7XnqTMuyh1zopSgjXQ==
X-CSE-MsgGUID: lTLHAtafTuGxkhcaIK+lOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18816448"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18816448"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 17:54:41 -0700
X-CSE-ConnectionGUID: H5dR1surQfSv+MpYSCoaGw==
X-CSE-MsgGUID: YD4TrK5dQYyzXNoRb5wmzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="63148596"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 17:54:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 17:54:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 17:54:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 17:54:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLR1i7lZybaAP7oHxvasTtsmBsB+eH9neetIDUsGyiAuwkl3yLFvKk9kMHMmNDSqg6ip0NrUNJk90H6FtxE9Nc3ubStnspPtXhsw1pwTxzCshyNEUOj/EILYCbA9SHzaawj0zSFIVpCKvslfV3FqSx43l/Icp0wWeGhHkyyCAyXzSGw9aO3cSJ3VQO91HvB4x9HMVH2J1DqyT6DLO7lUyLJiIdLpbrhSsxD4R+AFU7kJqmSlGGhOv4abDaQYljEASha9z1Herti6QgVpt2XKG/aMD159CpyqFRakSZQr9iE92M5P5MddTALryYdymhfE5EZSpuoislEYW7M2r6kmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Pie1fkkB0Y0cg4kJAVSEnRvxPwr880yTWDZipNPB4o=;
 b=gl/chBYpCVMZkJVTRXgUJf4uXEPxwhbUGCBctLzjcbwkHzpmu0c6lENsFgwTdja+PE6orkoyZJhxEbJuG9QV/SAPA3dOsqkb4f2GlooxNPZ5Ma56cdWaY3E7HGa6NmRjsNwYj72oi4kjRYNjX4JbM0LCNPF39l+OtCi+lmK5GLf/cQ9q1QVevhT6BE1Bx+cAUx6eKQiF3sOfDiJIdfrj33un5FU1mMedpdfgtZV3eB5qtphz9qJeB/JUh0SG2gjDiN1A5FS5Mc2nDbq0JYPecEY/FfB/+xImnmrIj5kG8jiQccuqwU6keci9CzPeWC/R/UbRaC8NIKbPXihIpWxPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB6549.namprd11.prod.outlook.com (2603:10b6:8:8e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.21; Thu, 13 Jun 2024 00:54:33 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Thu, 13 Jun 2024
 00:54:32 +0000
Message-ID: <72968729-ac99-4e63-bd2c-ebf1d6d3df25@intel.com>
Date: Wed, 12 Jun 2024 17:54:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] drm/xe: Assert runnable state in
 handle_sched_done
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240611144053.2805091-1-matthew.brost@intel.com>
 <20240611144053.2805091-8-matthew.brost@intel.com>
 <70b451a2-b23d-47ce-8d20-501046744959@intel.com>
 <Zmog3JDBVPcX71Ru@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Zmog3JDBVPcX71Ru@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 57418df0-7383-42a3-cd9e-08dc8b436371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXdvSGpNUG9mc2U4Sk9qc2JYdTRoUVZsTDJPV3F0b0dvNm1KN0ZYNTdUcmhN?=
 =?utf-8?B?cWMrY3E0MzdSdlM0TWVoQXpMaHcxN3hIMkZabCtYUno3VWd3VXQxaUlZNjdG?=
 =?utf-8?B?aW9idCswMmxjc2liV2RRMjJaZjVRSkIvazdZK1dhdjJNV0dIL2U4ZkNBWmhy?=
 =?utf-8?B?dHB1QURvS05FSkNCd1U0S2FiUThFTzc4dnJKQ2tuRmhxdnY1YUxYaC9LaUt4?=
 =?utf-8?B?dlUzZlRuaGU5TmJuSWlkdk5FNjZVaGhRcUZGY2RNUm1wVTF0bUxaa0FRdUQz?=
 =?utf-8?B?akFrN294SUZQTVBjQlR4bzJueGVHSFc4TWswcFExblVlWlRQVnpOVDhyU2pm?=
 =?utf-8?B?ekk5SWRXS09CRjRmUGRTditNSm1hWHRZKzVGYWxJUjJzRFFWdXhGQ0kxNHkz?=
 =?utf-8?B?UGVrSWhraHFrRWJ5akdmWUJZT1BtYnhaZEROdlZxcnRpVXEwTjQ1alVETDEy?=
 =?utf-8?B?Q2hraFdFTk56WjhGVHRHeEU3T284NXZLbjEzcEJoZmJLK1VRR1R0akU2VVVn?=
 =?utf-8?B?Qi9jdXl2bnhvZld2QzNEWXkxYmRseEpETk1EaWhhWHBsS1lZbUlYRDB6NVZB?=
 =?utf-8?B?bmQrcW5QbnNnMy8wMWd3U2ViYURCKy9XQ0pMQmFaOStJVVNzVUcwZG8vK3dv?=
 =?utf-8?B?YmVXSlZmdXUydkowbm1CQmlremVhZnZ6N3hOSmhkQ2pZWmlMTTBmVG9ESlVm?=
 =?utf-8?B?V0pkcmhmQUV1Tm1yaEtXU0N5dkZYMDZ3enVoa09MWjJmZXRNQ2tGK1VvTGYv?=
 =?utf-8?B?UTdjL2dwRE9QdkkwbjRWd0hvRldYWEtFRE4rcWh0a2pvajRlSndBTkhYaGVG?=
 =?utf-8?B?ekY0Wlg2MHZtYTI1ZWVGbjRkMUs5QWdKdHNkdHRHQ3pwRG1MakE5OURZc0hH?=
 =?utf-8?B?a1dUUWJ0Y1RZeE4vN1hwcW9vaCtNdjlpTkRmOG4wTjlEODV4Nzgybk5pamhQ?=
 =?utf-8?B?UEdJV3ltUWhBM2UyWnBYYlNsZTUyaEVXSWRXaUxaWks2YldDR2tickFNSk9K?=
 =?utf-8?B?a0k4eWNlU1JXUnJVTHhJaGFncjN3WTlrbTdnZ1FlY0JEUGR2UjcxR1dKOWxy?=
 =?utf-8?B?QkR6YU1NVzVKbCtZcFNVZWNENHdIaG9JUGhMVmN1dXlWa1JXQ05UTFZoTHJS?=
 =?utf-8?B?OUxyVzJlUVBaMzlGVXpEUzkzVDNmMDNIeXZFdW9Ia0I5d1JWUllpNkx3TDBR?=
 =?utf-8?B?WktTdE5HM1dyVmppUjVwZW1La3YxdUI2blo0TUE4MDNBcHhUdGcwUmt5L2xY?=
 =?utf-8?B?V09oTTVDSGFFUyttVW4zQzFyeURyd3FDYkdiZnVUSUgwc0sxVlRJNFZEMFhC?=
 =?utf-8?B?NHZPZGIzRkNlL3ppUVl6ajlYVlMvOFlKWFNkeXM3N2NWamZjN3JwTTg2VnNG?=
 =?utf-8?B?R09COU4wOVlmTk1TbHgxbGpmTi9TM0FHa1lRUHhwdnB3Vk1Tc2owUWV2RjlJ?=
 =?utf-8?B?a1dsb0VuTjNWb0dzdlAxWjdDeWt3TXhncCt2TG95V3p1cFlRRVIxM09PRGk2?=
 =?utf-8?B?TGtHbFlFZWNvbkxDamRNSEVtbUErN1pOY3ZQdUNLOXJ6RVVRa3Y4V1lET2pi?=
 =?utf-8?B?OEMzRE15OElCZUJoVHFIN2dLb2pZbzVUU0NnZVFYWUkySUpZdFdpRXJXTE51?=
 =?utf-8?B?M3BlaGdkZXBTVk5Ud0s0VXc1cjZJRUxLODV1Q2UvMW44SjIyYTJoSS8yaWxK?=
 =?utf-8?B?RDZwd090V25hYTBmcUFqMExmLzFxVDRERkYxS0hNNkw0MmtkUFUrb3pETTBS?=
 =?utf-8?Q?GGjYVcsuKMI4PNBOUCPjBGD40hKM/DV78ogyd0M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(366010); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHVCTytCRXZxYlRqOWRCNkp2UkNGRWZPQmp1bDc5ZmVFQ3V3eXVRU3F0S3lw?=
 =?utf-8?B?V1ZlaDVMdVFlZklPbzdONUw2WktCN2FvQUJIVGRZNEdwVFVZRDFlNENMYnBN?=
 =?utf-8?B?ckFySWVjWlN5L25pNGYvdjVlUVJ0Uk43TWVFU05QRElsUENUeDgvRlhKKzFn?=
 =?utf-8?B?QkZFZ01GL0pPTnBkU1JJUlU1VkUvNnIxdXRqc0RJT1JsWk5TVSsvNThSZUxa?=
 =?utf-8?B?N3pYY3AxM3kwaDZzVjdZY2NielAxN2VCcW01TFRTc3BMaEFobGtwN1N3UlZN?=
 =?utf-8?B?RXl6NWFMWU0rdWRtdHhSb1ZWdUZSRWlYWDl2ckpMa2k2N2ErM3E0eXRsRzdv?=
 =?utf-8?B?bzRxNUJsVnVOUHNldVhzazdoa2ZMRXRrdXl3Mm5BZi81eDhnbjVsN3NQVnp0?=
 =?utf-8?B?VUwrMmRQMHdITmF2eDdOd20yNmV0aWo1RDRpV1piemZHeXQzNlBKeUMyeG8y?=
 =?utf-8?B?VHJxS2t6a3lxSHFQNUR1b1VXekVkV3I3R0FJR3kxWkpwbW1hMjBnSDJ5SFMx?=
 =?utf-8?B?QlR4MkhmblhmMU1pS0YzeERCd0RadVJ1d0RQY1NhWHg2ckYrSVBoOEhvdlAx?=
 =?utf-8?B?T2tQRnVSSUU2L0FrSnNGUXY4dTBOclJYbzFkaFB6S1grcGZ3YTVtT1Q2VzVJ?=
 =?utf-8?B?YmRlb1QyT1VaZENjckxtRklGUUxTOFZnd1M3ejNxaldOQnRYejJHRytKajg4?=
 =?utf-8?B?Z1NxbXBuZ1drajhIZUwwajk3YlpGTTh5WGtXNUdoSEY3ajBwKzFrSWhHMXdQ?=
 =?utf-8?B?Q2l5VW5aeHJVSlVId1RnbytjQ3krQ0dPRTZuTXZla2prVEN3aGZHU0p2N0NU?=
 =?utf-8?B?KzhsK1JlRXQwU2VMQVZnM0psL0d2djMraW1oTUdsUzd2czkwbHcwZFhGbTh3?=
 =?utf-8?B?SkZwSnBDOXdzZXVZNU45TGtIVTVWZXhKajFGbEFoZ2FLRzExS2VqKzd1M3BT?=
 =?utf-8?B?NEpNVWV2M2I5bFBibFRySDhMWWRrM3c1RDZrR0VRSEQ2ci9zUVNoR2tDdlNB?=
 =?utf-8?B?Ti9EcFY0M1huVVFwWTU5c3RmbkdCT08zOWgyb0kzM2kvQ0szMjVaRTNiNktK?=
 =?utf-8?B?N0pxdWJGbnIzekZ1RmlVbTdycEx3SVpXSFEwUHBSbHlVN3pRbGRYVkpKRldY?=
 =?utf-8?B?SWpMMzVSWEh3QTl0T0F1ZkJMK2JxMHhac3RVblJDUjZJNWY3Q2UzVWpxdTFw?=
 =?utf-8?B?NXJVb1lHYTk1VG10QUd6TEIvR3RQTms3MVJRMmNBVDFkbjZFZm5BVWJ3dDZi?=
 =?utf-8?B?eFg0UjBnSGhlSDBQTEg1VVBHTld3RjJOcHRCenl0b2tLMjIxL0NQNzkwNkR0?=
 =?utf-8?B?UVdMOGRuUlFTaVFHZ3A0a2dUSGxwQlh5bm9NaTQrbEFkVXgyL21Qd256eHVN?=
 =?utf-8?B?eFBHWEV4aUh0UlpHZ0EzODM5dzBLRzY4QzRPbERxTGg1S1V6clhVNmtOVmdJ?=
 =?utf-8?B?UUtIS252TGt0a1NmVml6VnVxdkU4d3hwRHlqWktvb2RsOEFNNUJnV2ZFZG83?=
 =?utf-8?B?Z2dFaEcvdDA0TTlDVVFoclVkM2V5ZjBUSmFEcGN2dTRYdTE3aGdCcnVaUmJ4?=
 =?utf-8?B?UEtaVXBtc1M1NHJHWFVmODZDR0VWbTdPSXhnVlg4SXRDNWpYLzl4M04zb0pO?=
 =?utf-8?B?alhxaWZRZHpaQ1FZMWVXcnZWRmZVUVlhYU1iUDUrU01vQ2I0Y0RaNnlrUDJP?=
 =?utf-8?B?UWZxRXNQQnVOeS80aWpaRzhyZjNGcVRHSnJoaU0zcXB3UXpJNnV6c3hpR3Bl?=
 =?utf-8?B?YkFVaC9CQ2ppdGw2Z1diclhqT1ZNV0hXbFV3Y0lGemczNHpYVWxyZ2Q5OC9E?=
 =?utf-8?B?SjBtdk1JeWpXemNTeW9IQUFoUmVxNnlCNHJweEI2MzE4QzJ2bzhIL2NZZFNQ?=
 =?utf-8?B?ZVc2MkZoU1Y4V0M5R0ZybjhBVnFEY0JhSWNlU2Z3VFJRSmhKS0Zwb0FCNTFP?=
 =?utf-8?B?QTRQNTNZMHdHNUhxYUNnKzJTNTdPNGV5SnVyYnpyZE5DT1k3aE5MS2U2SXV0?=
 =?utf-8?B?NFB6UHRQRFV4eEZmMmlYWXV0djVXV2tvYStZUzI5ZlBuSHpGVXc0WFl3NW96?=
 =?utf-8?B?L1hCWXR6S082T3hvQVV3eWVjZ1lyR2Z5Ly93WFROVXpETTh4a1ZBQng1UjVI?=
 =?utf-8?B?a1Vkd0NPR041cC9aaGJ1SUZWeGhYQWQ3UU9mdDRmZmRwaGdrRExjQzhIQkFv?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57418df0-7383-42a3-cd9e-08dc8b436371
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 00:54:32.8846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMIKVIRDP2+z9cPMNCfKwqK3xBYVOMT59i4QANxb3ssu0qwLHRrbYpwWYb7JkxvTSn4FTW2SLAqA4sYN5347/hWLcXhrxXmD8FpCQlJZG6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6549
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

On 6/12/2024 15:27, Matthew Brost wrote:
> On Wed, Jun 12, 2024 at 02:25:40PM -0700, John Harrison wrote:
>> On 6/11/2024 07:40, Matthew Brost wrote:
>>> Ensure G2H and KMD GuC machine match.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 9 +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index afd22a8d815d..ab0dc93d7740 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -1592,16 +1592,21 @@ static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
>>>    	xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
>>>    }
>>> -static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
>>> +static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>>> +			      u32 runnable_state)
>>>    {
>>>    	trace_xe_exec_queue_scheduling_done(q);
>>>    	if (exec_queue_pending_enable(q)) {
>>> +		xe_gt_assert(guc_to_gt(guc), runnable_state == 1);
>>> +
>>>    		q->guc->resume_time = ktime_get();
>>>    		clear_exec_queue_pending_enable(q);
>>>    		smp_wmb();
>>>    		wake_up_all(&guc->ct.wq);
>>>    	} else {
>>> +		xe_gt_assert(guc_to_gt(guc), runnable_state == 0);
>>> +
>> Isn't this the wrong way around?
>>
> These asserts are per my testing and CI.
>
>> You made an earlier comment that sounded like it is legal for an enable to
>> be queued while a disable is still pending? If so, then you would get in
> Other way around, a disable can be sent when an enable is still in
> flight in the case of a preempt fence.
>
> Enables cannot be issued when a pending disable is in flight.
>
> So I believe this patch is correct.
It might work but it does not feel correct.

On receipt of a disable notification, the code first checks to see if 
there is a pending enable. That just seems backwards. It is more logical 
to process the message according to the message type actually received 
rather than according to the message type that is expected.

If there is ever a valid reason for sending back to back 
disable-then-enable, then this will break. Whereas, coding it according 
to the notification type rather than the internal state would allow that 
sequence to work just fine.

As I mentioned earlier, this code is basically broken in i915 and can't 
be fixed without a significant re-write of the upper layers. It would be 
greatly preferable to do it properly in Xe.

John.


>
> Matt
>
>> here for the disable notification but with both enable_pending and
>> disable_pending flags set. That would hit the assert. Whereas, if the if
>> checks the runnable_state parameter and the assert then checks for pending,
>> you will not hit the assert and the code will do the correct thing.
>>
>> John.
>>
>>>    		clear_exec_queue_pending_disable(q);
>>>    		if (q->guc->suspend_pending) {
>>>    			suspend_fence_signal(q);
>>> @@ -1640,7 +1645,7 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>    		return -EPROTO;
>>>    	}
>>> -	handle_sched_done(guc, q);
>>> +	handle_sched_done(guc, q, runnable_state);
>>>    	return 0;
>>>    }

