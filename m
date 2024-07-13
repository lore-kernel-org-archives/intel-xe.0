Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964ECC2BD09
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jul 2024 00:15:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5D610E1A6;
	Sat, 13 Jul 2024 00:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMxShB4B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FF010E1A6
 for <intel-xe@lists.freedesktop.org>; Sat, 13 Jul 2024 00:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720829705; x=1752365705;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7U06Co7SlaSwCPRmk4mvpG3yhUf0P+a1dpXthsRC6rE=;
 b=WMxShB4B2RPWwtqyjJP3AY3UJNxpT76jlUYrGp+AwPe/xS3POWGpiF/T
 SRn/b4k4X3pp6cQUcdVVpM0ME8Kmsa2VZNY4WAjzcoYzy6VvNWHmUAGlf
 09TpN/oBR3cLsAauDGubiICvT8hqvNhK+rkbkfU9k/Q+Bsb5GzpFAiT3J
 z+WzMn2JiaWXY3MqeLc69xkPTYwMDkMokoTr/KvJvggHYUlyvgXcSjG1N
 x6/IkJemujsrglQcw8hA/QvzlsBa+jw8+F3gKRFfRXohLYDOuzs8+WWB4
 25A7WHVLfxCwBetecnM96URJpMYCtwVrlFiLfxbBp0fdFA4KwTIslDC1N g==;
X-CSE-ConnectionGUID: wfNNSRLxSh6JhJA/5PtHiw==
X-CSE-MsgGUID: 0PFfJmS6SM63N4BcfaWziQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18406099"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="18406099"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 17:15:04 -0700
X-CSE-ConnectionGUID: 9pGUkOYWSpCRfP53WBb1DQ==
X-CSE-MsgGUID: u/mPOitmQZ6hsL+A77sLfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="54246267"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 17:15:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 17:15:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 17:15:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 17:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFZiIbZxh1YvUwoJHx2BnWJsF2yKX8tojrVYD74mVYPd4FVTpBPlujKvJKXiBcWJ+kvhibDdqIgM2ahdLANObW2TvHEt7PfnCjzRcNJ+xcc6RB7D5QfR3b/MUawWadGDqozdKyfolZqs87XeQvzOMBm022VdtJxy6Jtb3Q4zYXzMxyKQkw9V6H9Uj8chvCDtouQkwLeoJ/AlU7fhEmDN/RoeFZDKdhQ5dOaJLsb/9/MxkOgqtQmBSuk827mXGU/zgNrE3ixNIXKfU/kg0FXEqj6sOYDYRW6fLHlX2v6MH+RGZsG7qAs21kWV3eYW+Ma3ZsVfPnzIKnVKONeatrzAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PLJnwabOISe+9oPHmdXIyc4eD7oJ2vUAbBfOnNHWyQ=;
 b=sRUEHszMRtLvcJZCsynQD3vXnY5T2mwn3LXOCRpwS2V8PRjB8cYXV6QHMxc+U2pYm/I8tthfo01V7bUCttcw7O0TP6oLObLH7IgT9Mqnd2wN2H6GvuI9zOkFZb61sTsPCiGr+HJ5DnL+oxzy/nW6uJHBUIY0eLm0bwykgBiaYWctF+NKkbU5XUrj1y/Mm4OjBY+2Tlcy4PLuT8nxi33tkeUGEy7ObgLuonNktS5ivx9Sl61KCvwhnIw6zA8h/75lTD9DAWIsIXNE0IZOj7J3HvPJj3B0hnov4VEnN1L9pEByM6V9zKiQXI3FQ9VZxCkBqBnpoytfJscVeFbIm2zLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Sat, 13 Jul
 2024 00:14:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7762.024; Sat, 13 Jul 2024
 00:14:59 +0000
Date: Sat, 13 Jul 2024 00:14:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <akshatajahagirdar6@gmail.com>
Subject: Re: [PATCH 3/6] drm/xe/xe2: Introduce identity map for compressed
 pat for vram
Message-ID: <ZpHG0ELfGmf1utKC@DUT025-TGLU.fm.intel.com>
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
 <87ec90a618b3977873ea57e781cd594dbc23a121.1720689220.git.akshata.jahagirdar@intel.com>
 <a0c6cc4a-6240-47bf-a3d2-d1eabb053b04@intel.com>
 <91be0b86-296f-4810-855e-42d4b4907b5a@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91be0b86-296f-4810-855e-42d4b4907b5a@intel.com>
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a703295-37fd-4151-157d-08dca2d0d4df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWVCU2dvNk1weVZTa3dvcTVnemllR0FoVmVNbHNDQndCWUtNRElxWnRXUVYy?=
 =?utf-8?B?WFFMd3lVdWwrYkN2QmM5V1ROdG9nMkVDcUM2YUhuSm1kVEVMdzRXT1F1Zjds?=
 =?utf-8?B?NHhWSzdyU0dGbTduV3pWVFFlblFuNkt4T2h3cW1rRlE4bmpmUDg4UTZBVkQ0?=
 =?utf-8?B?VUdCVlpKanV1eWxjRGdycjgzR1hQUVhnSjh6WFRpeVI1cXpWQnlSN1RCYjRp?=
 =?utf-8?B?dVNjOW1XNHp0SVFKa29GMldkRGpHQ1BiNFg5aEdtS2RDVGN0Z2FQZUZMYjNa?=
 =?utf-8?B?ZStURXloQmF1QUpHdkRJRFc0THhhMUtxVVFBVHFkUGZ2UzVjREU1ckM2Zzdi?=
 =?utf-8?B?L2JkOVlCSGtwMktxVElmWEtOVlR2Q2Q5ZVhvTzc5ajJtbitzeGs5UG1TNWRM?=
 =?utf-8?B?UjBWYTY5RmFOa3F2cjBGZ0g5dHdVYnpUdnlOWmZhQ25BSk55YWJHTUpmbW0w?=
 =?utf-8?B?QWxEVWlrQUFmS29qOGpkQStZRERzR0toVmNNY3hNSWtxTlhLQkw2V3pGZEN1?=
 =?utf-8?B?VWxqY1NoQ3pLKzRxRk9WdTc5TWpSelpjeDBEYkppRWJtUFpmUGV5UGdWVzYx?=
 =?utf-8?B?N3hXNXA1QVc0aXNObS95WDdMK0hGWGt1VFJaSXhnQW5qYWQ4ZlErM0tMTmFo?=
 =?utf-8?B?eENLcFIraXZZQmJ5eVJGMFVYcEJsYXYwQk1tQS9TY05qbDROZ2lKRGNDMkcy?=
 =?utf-8?B?ZmR2eHV3SFloc2VmaGlXZ2JsdVcySmNVZW91cFJSVjVKeUlOcjZ6b2J2bU9l?=
 =?utf-8?B?VDQralRKVkdjN3NWazRpaHh5anRkQWFhNUlmMFBBYlV1eTJ6V3UvRnZPcFV3?=
 =?utf-8?B?RFEvOW4wcnoxem5sZE1aK1RkWVhqcnE2RDRmenlzV0JjV1JBemdRQWpTKzRV?=
 =?utf-8?B?dSs1dTVuaE9pd0p0S2dXRGJ6MERNOEl6YmphN3lHKzFVb2hzditvdWxqWXVn?=
 =?utf-8?B?am00M2E4cTlReXdVOG1GT1JsVUE0ZjJSWHFJT0dCSUVqeFRRSHVPZURPaHpp?=
 =?utf-8?B?MTB6aUt4THhrUHpRYzFrRWVnM3hHcEl4em5HM0dSbnd1dGVmNmZwWi9USUha?=
 =?utf-8?B?ekxLVlJ5aXVpK1ltWitITUp5N0hWTDRiTys1RHU1L2tRSlN3VDM5emRFWXU0?=
 =?utf-8?B?SXpnS3hrTlZEMzBySXVzZkRJNlRqd01wVlI0U1dpS2xBOXhoUkhrYTdMM256?=
 =?utf-8?B?UEc1MXRPK2d1Vk55a0oyOUphZW16QnFsb1JaWHFib1prc0twaHZvSlhSOHdT?=
 =?utf-8?B?SVpsOGRjbFFSTzNZNmV6UmhlRElUZlF1TkhGSDlWalpZWlhQSndzVHBSWDRy?=
 =?utf-8?B?ZGZkcWNraENDcUFSazVFbXJZTHB6d0kzMUYvLy9YQ2o1cjBZcG5CenBtdUF0?=
 =?utf-8?B?Y1IzcmZQbHo2Yy8zdmJGQ0oxdUdYTmQ1NWRCS3Z1bk13QkUyeFBhN2RNUjhZ?=
 =?utf-8?B?YzI4eHREUi9hY1RyM3B2MHFVR2FlcWNXelBoMmJIQWJ4RTZxOXczbzJYL3JI?=
 =?utf-8?B?c21YZmpscGxBVFIrM3d6ZDJnYWZDSzl0K0JTUkhmSi9UVDRQb3pac1E0RDdu?=
 =?utf-8?B?Sk1uYUIrU2o3c0xpK21vSWtDTko2UkRwYnpVbjJHRjJCbXhDL0xtYlZJRmYv?=
 =?utf-8?B?WVJhOHVyck5Tb3VmTHZ4NmZXakw4QzR5YWw5UFVEaTM2U1pFeWI3cEZaanF0?=
 =?utf-8?B?M3prOTlWSTg0NzN4YTJvRUJkYUxha204NUE2eHYrbmpOaVpjVlZqS243ZjIv?=
 =?utf-8?B?Y2VqMElmbFlJTVA5ZWErTFkzdzNIeXkvbTNzM1B3elp6dllYUXVDdmNlNFVQ?=
 =?utf-8?B?bVRzd1JTdGREeURoMGg2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEZ1enZONFJyMDJrekxjT3dtRlh0K0hqZk5La1NCTXV0cisrZjNseHlPTUtS?=
 =?utf-8?B?VEFwVWVsQXRRUzVMenViT3RwTXRtYnl2eHo3K2kyd2Q0YXpzS1d4dUkzZ1l0?=
 =?utf-8?B?UFFpbUNRc0RlcllDbFBRMjZFWEMwc3Q1aDNpMm1UZGNOYzg2UU5CZ1Q1czdK?=
 =?utf-8?B?MEdwNStQeEVtMlZpZjBRa0RtNGpZdjR1ejJwUDcxakJnUlhPVUhKVWZuZmtw?=
 =?utf-8?B?NUNRSXZZbDhSQnFoM2lWb1JtanFxYTFTcTZxclNkbnB3WXVYanpXb1pCaGxU?=
 =?utf-8?B?V3pLZFZ2M1VpZVNiZm1BRUZRdi9ISU5uTkpHQlZpbnpRdlQrbzJIeWlqQ3Qz?=
 =?utf-8?B?Wi9Ta1lGR002T3M1c2NWSklVc2pDWlhCVis2RW1vM2ZhOGpDZEhmYlB3OFJa?=
 =?utf-8?B?VzJITFVLaERweDhRUnpRUVdnOGE0bHNhS2VpbTQzanNjVE85NXFQT3RuUko2?=
 =?utf-8?B?NE9oVWpvL1NKcjhUc2JTL0Z3UHkzbDdKTWRIRWMvMjNlODVDNlVNbjVqaHll?=
 =?utf-8?B?cW8vK1hBS1d4NTJraWhtVWVZSW9SMHN3WUM3UzNvTTA2SXY1dWpFOVA2ZmpM?=
 =?utf-8?B?Vzh2eHMzT056dXBjTVVxNG9ZMkYrVjV6YjdJUkd0eHNHSWh2bGlVaFkwWk00?=
 =?utf-8?B?VmtJVjBub0d4cEZmL0l3amhxK2NnZmx5RnVMS2tzbk4zaGU3K282ZGZKdXRq?=
 =?utf-8?B?WkMveWwzVnlUNzk5WHBLN3RWQnpIaURyQVh3d05HanFlZGFZNlVQQjNuVkVr?=
 =?utf-8?B?MEo4RGFjSkNPM3JIU2M5Wk1LbWRlUmNKcFIyN21WMFduK3BQNkk1bk1pODg0?=
 =?utf-8?B?bkk3Skh1eFo0QTVxbkZHdW9ZMlk2VnBvekw3T2FvbUNaWEMxeDRtbXNQTHRw?=
 =?utf-8?B?a2kvOXJ5RjJ5RXRSNmJoanA4Z3lVMGkzazFhQ3JXWFpSVUhOQnVHZ0w2c2NB?=
 =?utf-8?B?RXJQN1lNSytrRnhDZnFYR0dNNVlBaTVtanVLalBFOVdkdDNKSWN6NnkwTnRL?=
 =?utf-8?B?U0xPTS90UGxGcVg0NXRtYzNWMTdLamJrc0d2WmNRWUorVGd0aEU0MjBrSG9T?=
 =?utf-8?B?cTRqSmVpV3IrazJlU0FZdW4yU3NZdUw0ZnFpdjNOd1lVNzhvR29SQ2JKSWxZ?=
 =?utf-8?B?UTlocEVvRTRGbWZOd2g0VGZHbjJkT2xUS0pHS2pFMkxLbXFneDlMNndrSUx6?=
 =?utf-8?B?Z2UvT0MvUDRrb1BrTGhSSVFsakt5VWt3elBKZ2xvMjNNQ3UwTzBBUFBqN2gz?=
 =?utf-8?B?TU1IM1dMckNBbUlJdkJkeTZJVVBEL3BYOVJVci9rZVFReFdHTGZ1ZEJvOVRK?=
 =?utf-8?B?c0lXekc0R0dYU3hIZDVlaDhiR1B6TTI3K2hSWlhIQld3bkFyNXRpMzhuQmtp?=
 =?utf-8?B?eko1WU9mWXl6ZFl2aTcvTlp1WUZqTzB5NzYvK1pUSTlRQnFKNE5QS3ZJckhB?=
 =?utf-8?B?RGpRY2UvVjRkSVdHS2VndmpvK0Fldm1yajVCTzAvWjRBSVpqWGgyRm1PbjJC?=
 =?utf-8?B?VHNOZ1F5dXNRUVIzakN2TlNQc3lGdzVrek1OeGZ0a2Q0aEdVbnVwTlhyYmRo?=
 =?utf-8?B?MEVlZ0RSZWJRTDAzMmowN3U2Ri90UmVZKzZvd1dmaitFVWNEeVFPODREU0hM?=
 =?utf-8?B?RDVoc052eFRRSS80ZitZVWFkVDR0dWpLYktsZUN4SmZocWlvRXl3K0FuMlhI?=
 =?utf-8?B?REpOVHBKNjRLR1ZnbDUya1lYcit4NEZ0ZkxoUGxqak5Hc2ZUM29QY2tMUTNJ?=
 =?utf-8?B?a0lzWUV0SHUraEdhSHVPRzN0a3FLenE1dVdDM0FhOCtUQkVGVWpmWElQOS9l?=
 =?utf-8?B?b1BIMmJ3bXVDaVpIMlpZS3hrZHBkZ2kxL2s0cTdTZVJGbC9YNExXM004b2ZZ?=
 =?utf-8?B?dzNPMEZFekU2UHhPeGJUa0pUMXZCS0tyOFEwWWhLa1RvVlpzQ2Rwamw1MUN2?=
 =?utf-8?B?bVJhWmhVNzFXV2hnTTJiR1BIUW9qY2Q3bXlGNWgrM2pYbXZ5RjIwYTJzc2lG?=
 =?utf-8?B?OFYzNDJrZWJqV2J0aXdnUTNtZiswWE8rdTcrZmlBZlo2WmduMlV2ZzRhbWdZ?=
 =?utf-8?B?d0wvQ09lKzlUR3pxajVtbG81L1pkMUtJckJBMVJZRCsxRVNIbGx1WDZJRGRy?=
 =?utf-8?B?RHVEY09VallXdCsraU0wWWFZc25OTXp6aWZSRkJnQzI4aTE5TzBTMHoyZE14?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a703295-37fd-4151-157d-08dca2d0d4df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 00:14:58.9568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIJte+Vy0ifc3kM9ihhhGdGLoY7SqdCIpsuCzdcRb1cvn2uhKdVD5+1i1Cu2DHYwEC/NGJIuR1KyM223gPfoHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
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

On Thu, Jul 11, 2024 at 09:24:47PM -0700, Jahagirdar, Akshata wrote:
> 
> On 7/11/2024 5:32 AM, Matthew Auld wrote:
> > On 11/07/2024 10:19, Akshata Jahagirdar wrote:
> > > Xe2+ has unified compression (exactly one compression mode/format),
> > > where compression is now controlled via PAT at PTE level.
> > > This simplifies KMD operations, as it can now decompress freely
> > > without concern for the buffer's original compression format—unlike DG2,
> > > which had multiple compression formats and thus required copying the
> > > raw CCS state during VRAM eviction. In addition mixed VRAM and system
> > > memory buffers were not supported with compression enabled.
> > > 
> > > On Xe2 dGPU compression is still only supported with VRAM, however we
> > > can now support compression with VRAM and system memory buffers,
> > > with GPU access being seamless underneath. So long as when doing
> > > VRAM -> system memory the KMD uses compressed -> uncompressed,
> > > to decompress it. This also allows CPU access to such buffers,
> > > assuming that userspace first decompress the corresponding
> > > pages being accessed.
> > > If the pages are already in system memory then KMD would have already
> > > decompressed them. When restoring such buffers with sysmem -> VRAM
> > > the KMD can't easily know which pages were originally compressed,
> > > so we always use uncompressed -> uncompressed here.
> > > With this it also means we can drop all the raw CCS handling on such
> > > platforms (including needing to allocate extra CCS storage).
> > > 
> > > In order to support this we now need to have two different identity
> > > mappings for compressed and uncompressed VRAM.
> > > In this patch, we set up the additional identity map for the VRAM with
> > > compressed pat_index. We then select the appropriate mapping during
> > > migration/clear.During eviction (vram->sysmem), we use the mapping
> > > from compressed -> uncompressed.
> > > During restore (sysmem->vram), we need the mapping from uncompressed
> > > -> uncompressed.
> > > Therefore, we need to have two different mappings for compressed and
> > > uncompressed
> > > vram. We set up an additional identity map for the vram with compressed
> > > pat_index. We then select the appropriate mapping during
> > > migration/clear.
> > 
> > Nit: Formatting looks off.
> Will fix this.
> > 
> > > 
> > > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > 
> > Should this not be earlier in the series. I would have expected it to be
> > the first patch, since both the new clearing and copy logic are built on
> > top of this AFAICT.
> > 
> So, clearing logic is not dependent on identity map changes.
> To clear the BO, we modify using an uncompressed pat-index that indirectly
> updates the
> compression status as uncompressed i.e zeroed CCS.
> So, kept the current patch order as
>  1. Handle clear ccs logic for xe2 dgfx
> 2. selftest to check clearing of bo and ccs
> 3. introduce identity map patch - needed for migration changes.
> 4. migration logic implementation
> 5. migration selftest
> > > ---
> > >   drivers/gpu/drm/xe/xe_migrate.c | 55 +++++++++++++++++++++++++--------
> > >   1 file changed, 42 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > > b/drivers/gpu/drm/xe/xe_migrate.c
> > > index 2fc2cf375b1e..a3d6d3113ac2 100644
> > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > @@ -120,14 +120,20 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
> > >       return (slot + 1ULL) << xe_pt_shift(level + 1);
> > >   }
> > >   -static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
> > > +static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool
> > > is_comp_pte)
> > >   {
> > >       /*
> > >        * Remove the DPA to get a correct offset into identity table
> > > for the
> > >        * migrate offset
> > >        */
> > > +    u64 identity_offset = 256ULL;
> > > +
> > > +    if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
> > > +        identity_offset = 256ULL +
> > > + DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> > > +
> > >       addr -= xe->mem.vram.dpa_base;
> > > -    return addr + (256ULL << xe_pt_shift(2));
> > > +    return addr + (identity_offset << xe_pt_shift(2));
> > >   }
> > >     static int xe_migrate_prepare_vm(struct xe_tile *tile, struct
> > > xe_migrate *m,
> > > @@ -214,12 +220,12 @@ static int xe_migrate_prepare_vm(struct
> > > xe_tile *tile, struct xe_migrate *m,
> > >       } else {
> > >           u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> > >   -        m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
> > > +        m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
> > >             if (xe->info.has_usm) {
> > >               batch = tile->primary_gt->usm.bb_pool->bo;
> > >               batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> > > -            m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe,
> > > batch_addr);
> > > +            m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe,
> > > batch_addr, false);
> > >           }
> > >       }
> > >   @@ -251,7 +257,7 @@ static int xe_migrate_prepare_vm(struct
> > > xe_tile *tile, struct xe_migrate *m,
> > >             | XE_PTE_NULL);
> > >       m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
> > >   -    /* Identity map the entire vram at 256GiB offset */
> > > +    /* Identity map the entire vram for uncompressed pat_index at
> > > 256GiB offset */
> > >       if (IS_DGFX(xe)) {
> > >           u64 pos, ofs, flags;
> > >           /* XXX: Unclear if this should be usable_size? */
> > > @@ -294,6 +300,30 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > > *tile, struct xe_migrate *m,
> > >           }
> > >             xe_assert(xe, pos == vram_limit);
> > > +
> > > +        /*
> > > +         * Identity map the entire vram for compressed pat_index
> > > for xe2+
> > > +         * if flat ccs is enabled.
> > > +         */
> > > +        if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
> > > +            u16 comp_pat_index =
> > > xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
> > > +            u64 vram_offset = 256 +
> > > + DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
> > > +
> > > +            level = 2;
> > > +            ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
> > > +            flags = vm->pt_ops->pte_encode_addr(xe, 0,
> > > comp_pat_index, level,
> > > +                                true, 0);
> > > +
> > > +            /*
> > > +             * Use 1GB pages, it shouldn't matter the physical
> > > amount of
> > > +             * vram is less, when we don't access it.
> > > +             */
> > > +            for (pos = xe->mem.vram.dpa_base;
> > > +                 pos < xe->mem.vram.actual_physical_size +
> > > xe->mem.vram.dpa_base;
> > > +                 pos += SZ_1G, ofs += 8)
> > 
> > Nit: Formatting looks off?  There are some other formatting issues
> > reported by checkpatch in the ci results.
> > 
> > Also it looks like there were some recent changes in
> > xe_migrate_prepare_vm, with how the identity map is constructed. I think
> > this will need to be updated to match? See:
> > 6d3581edffea0b3a64b0d3094d3f09222e0024f7.
> > 
> I see, will update according to these changes. Thank you!

I think the whole loop to program the identity map can moved to a helper
function with a couple of arguments too which we'd just call twice.

Matt 

> > > +                xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > > +        }
> > >       }
> > >         /*
> > > @@ -475,7 +505,7 @@ static bool xe_migrate_allow_identity(u64 size,
> > > const struct xe_res_cursor *cur)
> > >   }
> > >     static u32 pte_update_size(struct xe_migrate *m,
> > > -               bool is_vram,
> > > +               bool is_vram, bool is_comp_pte,
> > >                  struct ttm_resource *res,
> > >                  struct xe_res_cursor *cur,
> > >                  u64 *L0, u64 *L0_ofs, u32 *L0_pt,
> > > @@ -487,7 +517,7 @@ static u32 pte_update_size(struct xe_migrate *m,
> > >       if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
> > >           /* Offset into identity map. */
> > >           *L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
> > > -                          cur->start + vram_region_gpu_offset(res));
> > > +                          cur->start + vram_region_gpu_offset(res),
> > > is_comp_pte);
> > >           cmds += cmd_size;
> > >       } else {
> > >           /* Clip L0 to available size */
> > > @@ -778,17 +808,17 @@ struct dma_fence *xe_migrate_copy(struct
> > > xe_migrate *m,
> > >             src_L0 = min(src_L0, dst_L0);
> > >   -        batch_size += pte_update_size(m, src_is_vram, src,
> > > &src_it, &src_L0,
> > > +        batch_size += pte_update_size(m, src_is_vram, false, src,
> > > &src_it, &src_L0,
> > >                             &src_L0_ofs, &src_L0_pt, 0, 0,
> > >                             avail_pts);
> > >   -        batch_size += pte_update_size(m, dst_is_vram, dst,
> > > &dst_it, &src_L0,
> > > +        batch_size += pte_update_size(m, dst_is_vram, false, dst,
> > > &dst_it, &src_L0,
> > >                             &dst_L0_ofs, &dst_L0_pt, 0,
> > >                             avail_pts, avail_pts);
> > >             if (copy_system_ccs) {
> > >               ccs_size = xe_device_ccs_bytes(xe, src_L0);
> > > -            batch_size += pte_update_size(m, false, NULL, &ccs_it,
> > > &ccs_size,
> > > +            batch_size += pte_update_size(m, false, false, NULL,
> > > &ccs_it, &ccs_size,
> > >                                 &ccs_ofs, &ccs_pt, 0,
> > >                                 2 * avail_pts,
> > >                                 avail_pts);
> > > @@ -1029,14 +1059,13 @@ struct dma_fence *xe_migrate_clear(struct
> > > xe_migrate *m,
> > >             /* Calculate final sizes and batch size.. */
> > >           batch_size = 2 +
> > > -            pte_update_size(m, clear_vram, src, &src_it,
> > > +            pte_update_size(m, clear_vram, false, src, &src_it,
> > >                       &clear_L0, &clear_L0_ofs, &clear_L0_pt,
> > >                       clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
> > >                       avail_pts);
> > >             if (xe_device_needs_ccs_emit(xe))
> > >               batch_size += EMIT_COPY_CCS_DW;
> > > -
> > >           /* Clear commands */
> > >             if (WARN_ON_ONCE(!clear_L0))
> > > @@ -1146,7 +1175,7 @@ static void write_pgtable(struct xe_tile
> > > *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > >       if (!ppgtt_ofs)
> > >           ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
> > >                           xe_bo_addr(update->pt_bo, 0,
> > > -                               XE_PAGE_SIZE));
> > > +                               XE_PAGE_SIZE), false);
> > >         do {
> > >           u64 addr = ppgtt_ofs + ofs * 8;
