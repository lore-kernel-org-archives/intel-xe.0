Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9489DC71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 01:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C52210E0C7;
	Tue,  8 Jul 2025 01:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FeNvsiXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7410E0C7
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 01:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751936593; x=1783472593;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SpnQqC4gbCZ6+M7U5K/zubz1TgY6EKbtsblnYItx4IQ=;
 b=FeNvsiXthSt9hE1ykUOxy2kXlEFm0+tCcaVhu/TY1EHp2FhrOG50KXbK
 Mo0XEn1j26f/yoQ0WsWmiweIi7ouHkgKskKEVSV9SpNbRv6qfm4gBYDBq
 LEyMFm/fQ2B1h/89ejn1OB4+XbWLzWn/ZE6cpOHhUh4dKH7P1WuHp3snW
 VubE0W7OgIJ0X1gXMjTmPekpXEl9CaCRfTNu6Th3jgI3Qiupugb+trvdn
 TDd/5iKBeneY+hp4ccS5sF8O4DP/KlukMaKMhmyGDDj5DDN8p5eqXtUZT
 KhKfODv1avLflbRTO3JMGFSyqpbPk/JtZZzvf2h1trsgAbzmolgmPlRba w==;
X-CSE-ConnectionGUID: M6zynJTYRBOqOttUID+Mkg==
X-CSE-MsgGUID: bzUiZlWbRr6KUg08pOG7IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64756507"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="64756507"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 18:03:12 -0700
X-CSE-ConnectionGUID: ytJ9/XAeQ8qyXLmpw29tIg==
X-CSE-MsgGUID: qjWxjlR9SP6i265feTakXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="159899593"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 18:03:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 18:03:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 18:03:12 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 18:03:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gm7DmqX+wgkrADqifDua5GN0fkJMeZkjz3UtSyS03u2/MsdUasXSBQgnY/5bvhR9U1iKWpl+MsxvadmU7s+M4bXt7X2EgBFfvXR0PSuij/J+meaICTcPxW327ozmB3gBkJPhqOW9YJhg0WBzLBdAfJk5TWXxm2YztJn9GXSxvMPWv9oQi30XGAwEB80une1bkw4FAZrH8yCtV+dATdSLjtaNnvfpWkRNtD/V6xibWUmmJGkEV3cfDW6K/eHfL0vAoA95/Kia0pn1vhB7zWbu6c+5NNPOcBbs+spo9GNWZ6nExOxZ9apOgjSXJmNMgUJZFlvcZoIV1g4QDFnBywBPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=903GaOvZKkD2F/HGR/TKbKRmZDfJrvGz9fqzWaqjfAM=;
 b=Paz2W7ztzK/IvqueRLWLhAnPZh4igt5sFAeLLMKv/UyZBrsEuOwKFksitqbmwRTeqQu7gdo6WYnYKQPkLZTmpnPAtn1xxZLPFC2pgDB6nm6n4IWILKtGWeEXYP25RFyc1ZlemRxzn8AhfK8e2ICgjGOdTa9xba7aV0UaZwnz0E8vjG1YojwIi3dfGMKqBIZ1hN0CxKKk/rk5syIYRXGpaACQujEmhMlPmeWVgJvVIsIzEWE32ObosaARkieBf8DMLd8Gnzu18PDew/EtHMbI1gJd7LJaIfXeJ+Ty8XW/pnhTqYksdwgxn5HEYEe0NAwpKlXTGbkzei+c84gXdYvewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB7109.namprd11.prod.outlook.com (2603:10b6:806:2ba::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.36; Tue, 8 Jul
 2025 01:02:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Tue, 8 Jul 2025
 01:02:36 +0000
Date: Mon, 7 Jul 2025 20:02:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 4/7] drm/xe/lrc: Add table with LRC layout
Message-ID: <56qiayiq47ootqdkdqrc3nfa5scekuoqmhy5hzcsclssg55stc@fbi7nyryh7th>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-4-6aa22f174041@intel.com>
 <e81ce1b2-f7d2-4639-b840-f56e1dada189@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <e81ce1b2-f7d2-4639-b840-f56e1dada189@igalia.com>
X-ClientProxiedBy: BY5PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: a9525655-7678-41bc-d033-08ddbdbb208d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ioZ+PSFIGtpC/XqUPGEeYHr8tpYMxJfHftlUKmSgEE8oSOsELGi7HGQP0toJ?=
 =?us-ascii?Q?MMhjDeSYQphD1gIurGNVt/h9R6dOkERIQmsrdbt/Hp5tICDG2NrjruxVsvMO?=
 =?us-ascii?Q?kvRw9Zuc5GebIDVnAyo3siwtfORhx4stwblQU3Qj13PVBagRpKFG1QCHg0at?=
 =?us-ascii?Q?1YFTS9y07AE3Cr9Nkox0fed07SNyQpNwKHTnc2aNQoklMBmWD7ftF/olj60M?=
 =?us-ascii?Q?OWJYC0sUL+tbn4mtgozq4qNmFtpCZ3Hg0zgJHRktkfWfDXOLpTRXu6KWNNfb?=
 =?us-ascii?Q?m4dlnV03+3TXtqIdCHoMtk6grFW18Bx7uR/TwcgcMae/iZ1HfN1j2IrF7DNI?=
 =?us-ascii?Q?hAYzwS1EsweblNiGthFt3B4ldqxmKitW/VT/8z9scSiZey9C1Asl9X8opTUD?=
 =?us-ascii?Q?1Y9Sjl+gfpeMVHC8BW+RnsRfRZIgzjwgoxwqUmsMLgGu4ER17nAMUFHnbVOq?=
 =?us-ascii?Q?siNn4Pd4AsPXBnqEpS07+yvljGEUfJyYWObTpT2gHwyZwmfR9Qnjk+HPaLH+?=
 =?us-ascii?Q?xSqE7PB1QdQYjpcXSg5ACLba2H8QBcAIhBrJ8gG880JARU20NEaOZZGeYi9n?=
 =?us-ascii?Q?cSoqbI5h5KmD2IdSJFAKs97HLESNs5Tz6taLuUli3B07kinBe7MIIrEXGs/c?=
 =?us-ascii?Q?oa6jjuaqDsDbSHzlPwhbpvuW4FXDZ6eDy1sprUGU0UEJ1abqzm4ezwNiEzgj?=
 =?us-ascii?Q?AOkJXNgz0mYSL4TJifUqkWA/+2OqbMdC7BjyjmjJ3ehUrB5V3yXozOqJ+gaF?=
 =?us-ascii?Q?yp62y8l7pJGBOQQrv+0HpP2uqpgi6KiooLSqSgWHuhkrF8bthHWqBTwzBHr+?=
 =?us-ascii?Q?ZhARfGI0M+tZ53GNbNPnIX+yIr2O/xzMI1jL8cjtNiNjP/or/ms3+QKgG8YN?=
 =?us-ascii?Q?xZDFXixuJi1/fK7S090x3KBVCmfSKXNEc/H9wwoWst4QiWflgpR3P5xrwpXc?=
 =?us-ascii?Q?iJxKPhFtwXLAQ/L25jSxE5IKOgwSlwexBa38fTgeWKSTSDqkXjnnvA8BOZPH?=
 =?us-ascii?Q?2Bq9xCno0r30y4C4ROLatzYs8qWlPEldR6Wy9oXZds0W/cUazXvSc0t3+lbD?=
 =?us-ascii?Q?D5/qDjmpjAZMhyHuUIKvfAMfqLXPDJWXLkm0g01URkZWBsSLW71UWImJ5BBj?=
 =?us-ascii?Q?84c5rb8m/nKTRej07sWZHPC2jyUQCcdBIuEC1DL6hYaQ7HZk5hsV81ZocCPS?=
 =?us-ascii?Q?AWeH1IHozL4wuwUfnCKBfZX0Y0FFFYK2zn6UvSnWkPp+l5Rv17Ddl3F7e1I9?=
 =?us-ascii?Q?DZ70aDOaX34mHByauULAoWMkRLo3c3FYULYK2nap+51ALVg6JxMqSdIXtLS7?=
 =?us-ascii?Q?JGpyv02sYOlxL2V/qlfrROCIZNHYM1+AAEBihCJQNIZ1uD8VihBf5Foj+c0b?=
 =?us-ascii?Q?jTI5CNjbqMKGpMDCDbEc9+sosS9Z0Qm3fSKIuwejhoob1hJff8vJhSiZQVok?=
 =?us-ascii?Q?g8o2SOdTMlo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H9Z74Fw15slrip3F7gKoMoZUcKrqdfzgmgK29anplOMB+JtlV5CbWAiHBbXm?=
 =?us-ascii?Q?k6KFGSzMUto7ecvBbfa98nXGjdmainBUQr4yKBljsZ38ywlF1OyL9N42fsld?=
 =?us-ascii?Q?INn/6Q5v+GseOiE9Uf0c421+pCVGnM96/je/hCm4gQtkIJNs1FkS6fiYDf+j?=
 =?us-ascii?Q?r2Yep33blszQkadqA+MF/zHV2yUs9G6omxXQPAS28QyiRna/uwoBs06UilzX?=
 =?us-ascii?Q?jXsXqpjUxizGsqyJ//pRljmrePBKFG7b2oobdLASkMHDX+uKhcWFtbTlIneK?=
 =?us-ascii?Q?1yMrTMvup8lXoO/pn4ALsJxnqW6xk/C8VYHKAk7h0y1UFa6/Vh9s64cuadZl?=
 =?us-ascii?Q?1wpOTEIzfnRN8baTZoI8zC2U9Hp3tk4rfukH8WNA7S05SjnmoBiPRBBKKee1?=
 =?us-ascii?Q?cQyXygwLtkOXMYem7BdhVWyGfvC8nFZ9QdAjvhBhpCX+UavDGfeKuSjGvmb2?=
 =?us-ascii?Q?++Qmx1b8oGNjddS3LGfE4odvHsl24UtUKiaa4STaNgxfjiWkipQ4z/FBqNuZ?=
 =?us-ascii?Q?mj8QPjiZMch8+kGsDWVPMXVm2JcbwkgDCKe+ucgAlKVZ8a5CozM3Jj69VMBg?=
 =?us-ascii?Q?wyuOsOaJ+KWvXG5sC5gaJ2BpeKMHIkLjlyHO5dsBd9NM3HuTj/DweegOcSjH?=
 =?us-ascii?Q?j+k9TogsrowPb8IrEkOWMlLQb5zAgy3bVttoUiFAKt0jTjWqJFTYwQTtnaTH?=
 =?us-ascii?Q?Ayuqj/NjEOJXJHaU+jJwMHpzmiwuQdvpdgnOmQ9Fqki5V/gdqMEF5NmaNVGU?=
 =?us-ascii?Q?nU9BaZmMQE92Tn/fx3psX1ggkfB++i3sk8EjX8XRvirVREdwmXfk9bOihbqx?=
 =?us-ascii?Q?C2/5osmj7eeiyqVxlXn2wSKymH11i+5uZGbnKQs8mYerRXGK0qI4fSk/bTz+?=
 =?us-ascii?Q?DjwZKz1oJNiRsrXYWvxp+BopVgy8S9po9j40pYRxBdQwLpU55qDsRUID51lK?=
 =?us-ascii?Q?QxqKG7sX8zfXkvx5qoVoYSGtEUHDIJkRw7bolM+ZvinynS6UvnCVsJoM1pwe?=
 =?us-ascii?Q?QmiZwxTTorhHfg19CdhTDXPXPp+JTbxCO+5AnX6PiUtDuKflnAIhxyIQ2Dt+?=
 =?us-ascii?Q?tXdx/9cab2ZzI9JOigzt7B35b/6D4jq0zV0GvxiK9GzJV3c2w3iJIDd3maTO?=
 =?us-ascii?Q?pJToRxCD5S9hVM9pvENscWJo5hG8jhvuRaJ+nLITSURbJ+/i+7sP8vr5zNoM?=
 =?us-ascii?Q?7h1ad2NTbXTRRZMjTpsdz0Xl0/jchj+oVnUg6NA1GFk5uI4ipTMiFj1NWNMl?=
 =?us-ascii?Q?v6sRUZvXfCMD94YCwqja/CJpOK8YGL6JDTEAgo1vaXHZet7qb4PijiP1bbM+?=
 =?us-ascii?Q?8ObxwVzg8oestHNSGXR3lZ989DUbYhyrL6MYYrDGIbKZl2GzU00HIr/jHntb?=
 =?us-ascii?Q?WXhVC8IieQ6WOk6ok73LfG+NhIRBc9xmJMlYAIDlHI7s/UQgNmNxRXzPdLGo?=
 =?us-ascii?Q?QaHfvK/sIFjx7Jn/XUHeQdX9CO4Sg6sAgu6b8Wa7za/fjYzHqOC4q7UyHWnr?=
 =?us-ascii?Q?fVjk4SffxlssAILVGlanhT9fOm4KpkUnzGrlusSnEXV8ChWTkhhDUp62JZiw?=
 =?us-ascii?Q?EHIzgbdIhWkzcRp20QybHcKvQBY6+ms86eZlBc+RcfJoTxCSwhgHSH59G00H?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9525655-7678-41bc-d033-08ddbdbb208d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 01:02:36.2867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8HbikfsRoz0saJQYXxzsnZIrb3q4wTDCgs+572TJ+N+YjoaYFS4it9W8gInq5hpyZjL+j2hb5ZKCV3q+egORtltPdQRGnxy5MenCFyg5EQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7109
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

On Fri, Jul 04, 2025 at 11:41:17AM +0100, Tvrtko Ursulin wrote:
>
>On 03/07/2025 23:41, Lucas De Marchi wrote:
>>Add a table to document the LRC's BO layout to make it easier to
>>visualize how each region stacks on top of each other.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_lrc.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>>index 7cde827ddbec9..75f4678cb090a 100644
>>--- a/drivers/gpu/drm/xe/xe_lrc.c
>>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>>@@ -42,6 +42,27 @@
>>  #define LRC_INDIRECT_RING_STATE_SIZE		SZ_4K
>>  #define LRC_WA_BB_SIZE				SZ_4K
>>+/*
>>+ * Layout of the LRC and associated data allocated as
>>+ * lrc->bo:
>>+ *
>>+ *   Region                       Size
>>+ *  +============================+=================+ <- __xe_lrc_ring_offset()
>>+ *  | Ring                       | ring_size, see  |
>>+ *  |                            | xe_lrc_init()   |
>>+ *  +============================+=================+ <- __xe_lrc_pphwsp_offset()
>>+ *  | PPHWSP (includes SW state) | 4K              |
>>+ *  +----------------------------+-----------------+ <- __xe_lrc_ring_offset()
>>+ *  | Engine Context Image       | n * 4K, see     |
>>+ *  |                            | xe_gt_lrc_size()|
>>+ *  +----------------------------+-----------------+ <- __xe_lrc_indirect_ring_offset()
>>+ *  | Indirect Ring State Page   | 0 or 4k, see    |
>>+ *  |                            | xe_gt_lrc_size()|
>>+ *  +============================+=================+ <- __xe_lrc_wa_bb_offset()
>>+ *  | WA BB Per Ctx              | 4k              |
>>+ *  +============================+=================+ <- xe_bo_size(lrc->bo)
>>+ */
>
>I assume '---' separates parts which are considered engine lrc state, 
>while '===' is for other data which happens to be in the same BO. So 

yes

>for indirect ctx I will use '==='. Just unsure if indirect ring state 
>should in that case also be '==='? Looks like LRC image points to it's 
>ggtt address which would suggest it is equally separate.

correct, indirect state would be another page, separate by ===, since
it's not really part of the LRC, just kept in the same bo.

>
>>+
>>  static struct xe_device *
>>  lrc_to_xe(struct xe_lrc *lrc)
>>  {
>>
>
>Modulo the above:
>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

thanks
Lucas De Marchi

>
>Regards,
>
>Tvrtko
>
