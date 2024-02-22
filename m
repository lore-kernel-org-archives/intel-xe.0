Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E832C5478C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 22:25:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2006010EAA2;
	Thu, 22 Feb 2024 22:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GVUYenLD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E2710EAA2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708640723; x=1740176723;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K0233D9n7QHxfq6qzWBJ38+VOSum3/Xlm7noCSDKjKE=;
 b=GVUYenLDZlKHxDOBZHFkUDjUA+LeNJNcRj1nkLmakejmDJUpTHc5CV8g
 V9/NC5eUT2Y7qB96Kj/I7jse8AKINCCFXbNixD12W84CUDEONui3Y3966
 meo74dAtka4fHbGrq8prf85da9cT+MEt7/6W5oswJox2IGV25ET4jc3aC
 1bxnOS5vY5QeI+88AesN4EsKDLG/7y81iw6ekkjOVP7GCnwBhxRNOHgfz
 x8dxqGKaAOJvnitJH8pjiNZyMoHov5PzmvgY8kJiiDlpsOJvC5CxCgB6s
 PsgG93eE7sDmQ4xGBnxlflUHP551VWVRbHSvwNwSC9nuDzyBOlh3mLRCk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6684996"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6684996"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 14:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5950815"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 14:25:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 14:25:22 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 14:25:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 14:25:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMVV82cv1IPibfQD6dIEH3pTL7S6hSFqDZVVcPlOy4KDeeNY3TJLUm/xbhEFV1TQjEHd0YYfdpVe8ExXnTw8SbhdpEncW3Pw1qVFJIhIDxB0VllaQKruaR9pKbpdSKoxcM/z2m61eSm5l6WbtqXaihmnSBsKzZkiCA1TNJEhtsNO/oWfmv3tYEbFA8ZhI6JBljWs/sWOH/CgEM7X6+wHGIfkPZyyx6PI3D0fTNenBGCtHShSyfZFGaeTzDMCMtc7A0Lj/a+eyD4Ih3vUMkOnXBLjdyJx/BIuxY22lSkPJvB8nrdehzR/h6ALOtfulYP3PCJC4c8VUxFyQrcQEbyU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFYltuP4lEnUgKEQnA0dMmKX3uogDeW0qjMT3XTHRos=;
 b=UWNtGf7rAhQ4y8zkHJM2+JzgvWQEzEezWp5IV50O12Y6KD5eeoU0DChuPNmsc4S/gU/lZmFXAxMirBs6Eye83/FouPQh/H7J/WkUBe5dM4lA4SjfLXPwtlYrrNiyzD12qkZ520f1e9Gb2xWUAjsu02QSEn4JXBwGYvL9/6PGsIWmmbPZCHgzZCWHyqQWH91RUGc8O0aotV8tuf5EhlNiVLJKtfloJoiULlcrp3GSe+FLOpX1XxkGKhNNW5d/KnoQDznQFV2rg8pMFuKQELeaJjhUiLfmVUs4djNOHBSPh99da1O91T8td5PRlbtzwdcCm3JyUJrIHxRJViFBZwpbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB5967.namprd11.prod.outlook.com (2603:10b6:8:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Thu, 22 Feb
 2024 22:25:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 22:25:19 +0000
Date: Thu, 22 Feb 2024 16:25:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>, Oak Zeng
 <oak.zeng@intel.com>
Subject: Re: Re: [PATCH] drm/xe: Use pointers in trace events
Message-ID: <zcnft4trtmidlvv3acin6gg35xpsmnahfzo6x6irjbr7iicopw@zmutqemp6zsc>
References: <20240222144125.2862546-1-lucas.demarchi@intel.com>
 <b27b522576d493cac238b7f68e29ee569eec9a2c.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b27b522576d493cac238b7f68e29ee569eec9a2c.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: e05517ea-a667-4ec5-aacb-08dc33f52721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A6DWIzR75qMZuvFXLtVHQySTC6kS0ggN22gfEYfMyzY/bxBCVxZHzVsjn02xzyRf9i1jRUNCHl2RyXAV2kGVdDvh4DPgSV2iJbvIakVJY7wFf12saBQWed1UZkpZVPG32mILH2MH9t/+Kv2PCMio0WInfXtCK+1T7gnujowb3ydQIWQmT5eUENJizQ1PxMpJH9vWoiTFaWoQvNxZ+xSDtpd4I21/iVFR/7LVc0VW7m3pZlNm3lanN0cC+Aj90bXdOHgF4eEQIV9xrS0pXyTwsqrTHGaacz85cjzoLw/FJNNLTLUq2ICdpx7LUek75Qlz1S3r6w5ytZdA9yL7V540UB3vS9zJsRyrwfmrlKZGFem2499B6N//waQiLeCk/OC8cGFU9v4p2IPd4PZazm/ucnvAwTUrVumlLuFOjDf8eoAeXMav01OXqpmSvwPqqCNCByTnWJ/9UXmTI/H+Bv4f4D4eVuTd39fuUwymqN+7xsz5zPoKB+1vzHP3XMDbscksF3IRKPIldIvIEXqtWcLn8A5ZsQNTg01/aVkSQHi02Ic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Y8iOO6/afBKQ4bYHjoyWYN7yI0G/fX6kW3RHPFASvTG30jtrecUBNOPvJJ?=
 =?iso-8859-1?Q?LswOtm5275chOKXhD8JVKBn6XRwGCEw5DZF7bQC61wlr1SkxgaDkqd3niO?=
 =?iso-8859-1?Q?DjKtXTeD+Nu7U287xjEXdef4cc6c/h1SsZXrPj6+759SBvwHVf/mSw7UOe?=
 =?iso-8859-1?Q?IoVxt9a3oIFFH6BBuE9iaC3HW94ZAkDY/vKdRl4xOmLRK24fvPU5/2rjZN?=
 =?iso-8859-1?Q?wGgHgf9HCXIxO/J4hqCS5jU1U5dAhMpovoh36Lm7k8R2Q6Dauzqs8azqeA?=
 =?iso-8859-1?Q?+3+Y/bqtjEjPzctI4PNkg65DswZOEYakYHwW5njJ8TlGcuv6k3r6d0T5UM?=
 =?iso-8859-1?Q?jh/1W33JZTEaxunBGq+dz5tF07kHYhsU5uz8vz99I/o/7rQ+qXE77ZAlWE?=
 =?iso-8859-1?Q?Db4WWqhIDkxRpXcGnxrdg64cNLvoGnamfFMmsujCgNgPM6O1+CoVt3s41G?=
 =?iso-8859-1?Q?RL+1fIOOW4o+JCjzbwpMhmLT35CQ1Bu5mSMmtxkOyKeR2o5gAKqGLRI8OH?=
 =?iso-8859-1?Q?Mup1DBnsWIjTyGbAodlOBQVqe8qnxcs6L59ZoTpdc8RJgoQN15fy2RsBFc?=
 =?iso-8859-1?Q?d2FQv9LRB+sQlW0k2NwI8qshbkhuaDOfTSiRHRrRZL43i/aa4qFbuiSunm?=
 =?iso-8859-1?Q?3kWmHaKOicXIxXV4/7ayiBycEzg2yNIPd+6XLHTaWf3ORa+6bghSZ0aq/p?=
 =?iso-8859-1?Q?0hEL4J4mHx/K5vnmYiXDx5Gf5SNl3IkaO+cAEd6S3D7KJfzP+FBcCyxOUs?=
 =?iso-8859-1?Q?KhKTOxl5O5MeuKTLdNai1fGry62BDdPzPdR/teUgPzSZkM5X2gx3PydR9E?=
 =?iso-8859-1?Q?Vs45Hy1HOdDL0PSjHM2k4Z3l0UVTnoguX5iVC7rn9HJmanT81QexGkLsAC?=
 =?iso-8859-1?Q?e+lS5BenWH3M60AMRKdiio8xDfpbSvjX5mrblYsD4O7w1K5tMXZoYbCR94?=
 =?iso-8859-1?Q?Sbkhb9AqjNGw3+8Ixz4+79wmPjC4bi4cRULBLU8Lamuuk4twN+8DVOVwEr?=
 =?iso-8859-1?Q?FAJqNxOjo9WnEBYI2GX9d4FC7VU7/JVj+1b92Sx6s9PMFQhh/1RjxcNx+J?=
 =?iso-8859-1?Q?ehbG5eT5YgBF24SNTW9BOsKxUii2FIgFPWGy6iucosLcA+fOK09kK6+wOZ?=
 =?iso-8859-1?Q?IbMcyWCTF3cB5E/+lTtPhUlTAxWsERaE/MYOWdxBD2N6/qHVXcp/4LfIEU?=
 =?iso-8859-1?Q?XAFQiiBH8dGxiX60+qpX3oPC15gROuNbHb3FSDwzJMAdgUBcvYAwKeMJDE?=
 =?iso-8859-1?Q?LAkJh6ckcm8x2emHo6C4et1v8j1sIYR6Ot8Y+tRfPjiYssTN3Qnuwu93W1?=
 =?iso-8859-1?Q?oI/1s6FPNoNKOdIe245env1YY831Bxh6xKsckDCefSUtR5XZHGrDkP/g/l?=
 =?iso-8859-1?Q?6Sqwvi5JhMmWfPGPfQY0mvmWe56Gtqnfay/Kld6pWiuBy9GCino3h61AJr?=
 =?iso-8859-1?Q?OHJ4e2NDKKwpDW2zrKFoLfGD2wVItqn4wJmFGZ1CgeXXUZ2KG+dODyAXGr?=
 =?iso-8859-1?Q?Ab0G6T/AdDhRZhJEJ+i54bBxQv55FBZLITGM/jMopJmPDGnuKpp85tIYJs?=
 =?iso-8859-1?Q?LDKegRdgkeCXKtm2iq/Pf1tRr4FKm8pVO3Au0mFiooUEGrojbzWU+5pX5l?=
 =?iso-8859-1?Q?O0vw6e+hVfbFuyf0p3+Vk9rT9mLje6Fk+3141btq786nND6A4d+PGk0w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e05517ea-a667-4ec5-aacb-08dc33f52721
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 22:25:19.8213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6o8BsjMAHRgqtzANsvEqYfCJGJEWgJve+jRrA3x5UmvYTIVzUuxpckwAjvILWeNf/i9iH/K0Aqe0JxHMeApubmTYtxAyDzwq/s0tSAiO+TU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5967
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

On Thu, Feb 22, 2024 at 05:12:11PM +0100, Thomas Hellström wrote:
>On Thu, 2024-02-22 at 06:41 -0800, Lucas De Marchi wrote:
>> Commit a0df2cc858c3 ("drm/xe/xe_bo_move: Enhance xe_bo_move trace")
>> inadvertently reverted commit 8d038f49c1f3 ("drm/xe: Fix cast on
>> trace
>> variable"), breaking the build on 32bits.
>>
>> As noted by Ville, there's no point in converting the pointers to u64
>> and add casts everywhere. In fact, it's better to just use %p and let
>> the address be hashed. Convert all the cases in xe_trace.h to use
>> pointers.
>>
>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>> Cc: Oak Zeng <oak.zeng@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

normally I'd leave it on the the mailing list a little bit more for
people involved in previous discussion to chime in. However this is
blocking the pull request to 6.9, so I'm applying it.

thanks
Lucas De Marchi
