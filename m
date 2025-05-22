Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB63C54E90
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 20:41:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B911B10E188;
	Thu, 22 May 2025 20:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SDEsONk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FE410E188
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 20:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747946476; x=1779482476;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Bn/xpw2/JLSrNrH6hGxnCio2BNp/pNnq+7tiYfqfBjE=;
 b=SDEsONk+Ix3zO6Uh93920XEVeTPvnU/8ej4pbOppLKc4JMvz/X2v22y2
 DGesA7BKD61qN/zr89Z43M3jnZlZvfj374R5n+Cg6ksXKNdTjx8iBWZUb
 vGjrIDin+2m+tIa3r5Jera1T1PWPXMyQ6pcBi43D8GlbbFPjIUPcFjcm3
 5OYLnSTASs5NmQ+mAmTT/r0EwXZRokyYV+i/LH94qY/m1+ts4yFoYnoYz
 GBn0tJ+lg7qlbPmx8gGfOSvzXS/KkA8aNQmNoPxSmp9ufcdOZGlPFYAWn
 7HufYrQYh/WWT56JG9MyD+H+KZps5BFwE8+Yh8+Ido/f+GhkS4EOxq1YI w==;
X-CSE-ConnectionGUID: GFfGvR+9RxSY8iHlST3Y9A==
X-CSE-MsgGUID: d4l3/Dx7QcyCJM/Lx92ZWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49988184"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49988184"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:41:15 -0700
X-CSE-ConnectionGUID: /cIbEtYTRtOiRfgf1OHyLA==
X-CSE-MsgGUID: 9mv2AIaOQTmzJQHKSW7smg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="145478697"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 13:41:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 13:41:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 13:41:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 13:41:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IymBGZOvKl1YEpB1+7/A21/ebz9R+xrrva5xyiHMEcQhALB6r7siyXIeu0xCuMfCb71dBmUiKZzo/QgZnUM/kGKEmNUVbQXNrqWNHgx5gk88ii62CodPAvr1B8r6GdRoU2FH/YqOKg6XKGxtDCnYBZff7bHB2Qirv2b9sGvMTjiczTi3O14+qzp25DJwaj/wU3FZeTY4681jRbwIQJVOHZRqCiwgbueXMoSTTWQT0CMVYl7L4mPgTdGRaQ5WNhOsBXv38cWlcgldp/+p5UGmXt5aXWs3ZP4PPXtt9Qc0tajfiLeXyVvXxRim6NRGBkKCVaEgka4EIRHipkBAJSRSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iL+J4SXXg7VLmk2nyuRLcM99bpBdboybSG8BYDUrh1Q=;
 b=uEbYuRxQjx74o3WaD39HcBJO3iOpcPlrIzgxLkPrjCyrjkuefKQ2lqEemBOhA2f5hVyB5Iww2TX0hT9+vwvE6D7UlAQgWB/gfNEyqecpHSX36JEVVSsdZYDXMDnegXYj0o1ndGdWFU+YR7OA0D850q2pNCLYNDrs48YXaGcu/OkUdlfdLonwEyCxi5WH97OEvMiPF2EDGoKInuw5xtVkcCszFKh0oijAVHukUYtCmn458P8KS3MxfbN3rPCkcaSoLgdZc7q+WH20XsgaHxXYfXbiPxyac8C0Jyc2i8dp9Z952Llny8EMoS1vscEiffo11apBOpQOKs+8ZcDc3xhc2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 20:40:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8746.029; Thu, 22 May 2025
 20:40:57 +0000
Date: Thu, 22 May 2025 15:40:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, 
 "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add configfs to load with fewer engines
Message-ID: <3khm6xezdu3rzncjvrjeq4hydygqma2dnm3d5m46fqxli4o325@jvoamjuavlnp>
References: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
 <f9b137626b04c04ba7e2f6d44673c11e328ddd9f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9b137626b04c04ba7e2f6d44673c11e328ddd9f.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ed5f80-05f0-4a4d-16e1-08dd9970f421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3yvFB60hSOlQlsrKf7uAOyiH648JtE9DZBFj3a9nyQJNpyqEqnOSSExu8M?=
 =?iso-8859-1?Q?KW7ayOA+MSZojPlT0RpTF8NxOpxUyKhlUI3aoCn6sNRUoAoeX2Vh7yc61Z?=
 =?iso-8859-1?Q?bswZpl27b1pK3VwyWlTR39z+D0yVlTM5gf1Le8E8wMhmI+j0mURIqzYCm8?=
 =?iso-8859-1?Q?HP8+DRwCuY8tW1P8OByWnffEzmUt+fnDJCAwf1zLxhp9jvuk5U0LU4HtaJ?=
 =?iso-8859-1?Q?TVTRoGSbOeqsdP49sK3wc6c0MkKBVwUQyYTkbthjCDepeG4gC57Cvg4U/O?=
 =?iso-8859-1?Q?TSHzntthYvBv6O6T1c3TGF/1o73YaY1S+NrtMACNl8vQ60ds9E7iAZtejx?=
 =?iso-8859-1?Q?ojZn4HKCSTmNIzicWBj9QnuQ4zJw3Sg2eyPHy4ilcvfbutxAoueEhVrbti?=
 =?iso-8859-1?Q?IC87/2FM7OLffz0YJe8Za1Lr7US39eB+Xz6CxTP9WQLypOKK6GqNZN7f74?=
 =?iso-8859-1?Q?5KQcXmclSY5P36oDjG/H6I2FhM5QNUr12033mWZVVeOtxR01b7LN+KvX/T?=
 =?iso-8859-1?Q?cYQAxdvR5f5hjbeE8T1Oap5U/Tw71icQ/o8YWrJVkUVsV9OrisyNN4W8eP?=
 =?iso-8859-1?Q?G9citCsYPpl3u5elP4+E9x+VzxNPuGoMMeenjBYbCndquDGbPqEmoDiWdM?=
 =?iso-8859-1?Q?VWLACJCgkjtGKVpDeDuibYORo65VJzS1aoPf7hAR9B/yl4qN1bZxtnsuUn?=
 =?iso-8859-1?Q?Ccuoiz1T/IR2oVR4Z6FZ64vIhWcs+pNGI+HOTMACl8nfAHn+P2J2xQAX/h?=
 =?iso-8859-1?Q?6ji2FiObCBnbXSOxPEu/k+cM6QjQstF/Hu7qJV+mq6spmUE69TiXtcZEar?=
 =?iso-8859-1?Q?tA6zjM6Przhha8V/8jSiHw9ea0wN1ZPzEEl2UdRMbu2COuGrz9PKTbViRA?=
 =?iso-8859-1?Q?4Jd1L1e4vKmzLJoN/XosGf72SuO8itFHDXswlGZnpspsa2cFDQdRkA8tuz?=
 =?iso-8859-1?Q?Q1JEHl5hXA/HDgzpi37uz1LyfQyM0r8i9LPAWJTlZ5HbnmBSUg8o1hPRrE?=
 =?iso-8859-1?Q?RbMwQHGIPNc93V2xJE6My3YUmLEKWNhuT5+mRNsQ6FsOuylHGqodHhwjta?=
 =?iso-8859-1?Q?G0kIR6FFeUZZ4LWWcAUCPFsdB2A9Gyx6rZGhVCMAvOR+TFS0pzrr5b+++w?=
 =?iso-8859-1?Q?rf3D/aro1SAYEf2ioaKF9EVcYSzD67QQglxUdBtibeW9R3BQv6dRM/zQmg?=
 =?iso-8859-1?Q?KbQZVmGycsjzjAsGUzgzoSjVltUACzNyaKoOCxoyNBBUSDNF3hhim2uFGX?=
 =?iso-8859-1?Q?R2u9fQgX4KwwO++MRwVXTle7u29fL5XMntkhmZlrWAAa+sxnJFsjCt7dN9?=
 =?iso-8859-1?Q?kXvt1ykGJgHemIz8DcbKA7FWIAiGAYPlBwvHqN31JdaiddI2MeYG7QivUx?=
 =?iso-8859-1?Q?X6fOSRNOhYxHlMM+WMX5iH4pcGL3OQgSYAuhp+gfhh0v7bV5JyYv0xdCgQ?=
 =?iso-8859-1?Q?n9gAE9EqSzSDOfOL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Xxa9B2p6MHuf998uL1Q3d8Ts19t3+2cSBCsg22NPnM+rbwNiuGMtJLkV0F?=
 =?iso-8859-1?Q?j+/6S4dFKeDNcR0c5wJLVj27a+bJ4evAOZXksra6orTH8DR+hvYR4MsdpW?=
 =?iso-8859-1?Q?2UXufIFiivWSTIehEnBzofOINhElURfd/CKaWolb9CFjpjEYCnobotMrQV?=
 =?iso-8859-1?Q?Fn7qjw3ZBR+usZDfojghhi9ZuXEcLdvWr46if0t9PgYNfTVEPW2N+RYg8J?=
 =?iso-8859-1?Q?J8bL5eQtyt4Pjnn4giKIqwAGZJhWhwiU1feZ0m1zEppm9DmpUaaAkwqV4e?=
 =?iso-8859-1?Q?NamWgMUhuM6sXSmkuNJzwmx9gmbPeTnzqcHIP7WNfz4AfD5qZBVAUKmMz+?=
 =?iso-8859-1?Q?WGKWxNe+I1qSAjXSMlMxoGJTGYQfGrHn6SpGBTw/JPEz8cy3doYzPK6DhO?=
 =?iso-8859-1?Q?SVvtwg26P91Eo5wvKi1ShtYYgtm1cQdbBpMZsXGxQSNEhBzzP3wHDzNe6G?=
 =?iso-8859-1?Q?5rkpuvV0B/Pi07L49zulny//q2t8b23aU5vGf1Bo/eIu/D/ZxuRV2U2SSe?=
 =?iso-8859-1?Q?5yFZAGphbYmIVvMf5kkaUOI2HajQTWWKzffgv7ODfXxLuUszgAibpyqYVM?=
 =?iso-8859-1?Q?pS5dWRJ5PnAEYc+5lwFHvvd9VWze47zSQ90v1QbrDxeEuAi3pbhPdrM4zG?=
 =?iso-8859-1?Q?7N3g/3y4Sc9NpnBA2PRby5n9SsF7CqbCe1aJvzTFTNsrchJWw6yOMDlRjI?=
 =?iso-8859-1?Q?OW+H61KRmkG0flFHEzyz4x3u7/OCvaJOS2k8vehi/ZYI6x3MkBC33u0i2C?=
 =?iso-8859-1?Q?zoUznsTPJ8YknlCE8i1MUKTXnYIvlouOsssY27JwRSQsX8N2OBxeAJptoV?=
 =?iso-8859-1?Q?s5T8qx/wS1laiIcp73X9ZsDWv7u+lj0Bv3d3s714ACsp67DAI+tcFENaf4?=
 =?iso-8859-1?Q?XwiVLnpX03HRGQXPS0wcjerIHX/n4+DRfSlwXW1/i/kHmK8CiXwLob0yW7?=
 =?iso-8859-1?Q?uPvUf1FL1Hx+iDu7bdBJtMVZqYJXzpnPsN6C5qoITES7XTuEPnqwbowVer?=
 =?iso-8859-1?Q?ffMj30rFTaK6zJdZXZVkCoa60l1kPebHiFt2+wmIU39lvlW5VfACsAeGvn?=
 =?iso-8859-1?Q?PzlbBaTa0KVskhKSFhZXfKiUwVbWStbq5Bkl9fLCpvxcyyv1+8ysa1QVB4?=
 =?iso-8859-1?Q?YLQaUsKfMyaCnAmD7sle9MqJ/QlNAkGYD+WBxt96q9+Ux7hAFQMpWzzheD?=
 =?iso-8859-1?Q?SxE1v/JGDT0gzQHkNiGlxaI2oXy0BTxAexl2uoUx2A6KSQ665A/13Aa0m7?=
 =?iso-8859-1?Q?MO3EgLr5L8/LFFsH2pdvHbrJOP7zzJO5MmWR7tI/ygmf+pKsDcfhsA+QT+?=
 =?iso-8859-1?Q?hnDrFNJ/pnd//Xt+UCw+Zz5HwJySh5EAJwwRL+3eN7y/oq37N1x40HaOa8?=
 =?iso-8859-1?Q?EKlpvwslYYuixWM3QdIyXcc732FpEMY9ulvFmfnqkS32oLAK9ejdF2lWyf?=
 =?iso-8859-1?Q?Qyry3rwzCpDgsd9cpQjFyKaYv2aRlFjLpUu1nVd5P5ivsBNljCL0zpnzCZ?=
 =?iso-8859-1?Q?qaKwNas/ng/rsZhxm9zN7pf2kqtLFKrGkOKGKlgjFNpJ3AvPcQDikVvec9?=
 =?iso-8859-1?Q?3qT3zEoaIdGFTntKLqyXtuIheuy1S/RAVGsNmxJ0QqN4Oft7icYkGclnQC?=
 =?iso-8859-1?Q?i7qzfx4megxJZXUF0we6vs9Iw3fvydSCgK88osuHJBnXsyq0XwnVR42w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ed5f80-05f0-4a4d-16e1-08dd9970f421
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:40:57.0400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE10ihikAWQHQggsiRc01eMiblR1EHJZ+BBZUMWB2kJ2+uWlOw5axpDbx5QnaFvYV5a5wsLE0EfzQzTFdJV/6T8VohvuZbVKPk+JcnUU0Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5095
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

On Thu, May 22, 2025 at 05:59:07PM +0000, Stuart Summers wrote:
>On Tue, 2025-05-20 at 14:28 -0700, Lucas De Marchi wrote:
>> Sometimes it's useful to load the driver with a smaller set of
>> engines
>> to allow more targeted debugging, particularly on early enabling. Add
>> a
>> file in configfs that allows enable only a set of engines.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> Changes in v2:
>> - Fix build with CONFIG_CONFIGFS_FS=n
>> - Link to v1:
>> https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d23b@intel.com
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c  | 133
>> ++++++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_configfs.h  |   2 +
>>  drivers/gpu/drm/xe/xe_hw_engine.c |  20 ++++++
>>  3 files changed, 155 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c
>> b/drivers/gpu/drm/xe/xe_configfs.c
>> index cb9f175c89a1c..fb433503501c8 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -3,14 +3,18 @@
>>   * Copyright © 2025 Intel Corporation
>>   */
>>  
>> +#include <linux/bitops.h>
>>  #include <linux/configfs.h>
>>  #include <linux/init.h>
>>  #include <linux/module.h>
>>  #include <linux/pci.h>
>> +#include <linux/string.h>
>>  
>>  #include "xe_configfs.h"
>>  #include "xe_module.h"
>>  
>> +#include "xe_hw_engine_types.h"
>> +
>>  /**
>>   * DOC: Xe Configfs
>>   *
>> @@ -48,6 +52,23 @@
>>   *     # echo 1 >
>> /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>   *     # echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters
>> survivability mode if supported)
>>   *
>> + * Allowed engine:
>> + * ---------------
>> + *
>> + * Allow only a set of engine(s) to be available - this is the
>> equivalent of
>> + * fusing engines off in software. Examples:
>> + *
>> + * Allow only one render and one copy engines, nothing else::
>> + *
>> + *     # echo 'rcs0,bcs0' >
>> /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>> + *
>> + * Allow only compute engines and first copy engine::
>> + *
>> + *     # echo 'ccs*,bcs0' >
>> /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>> + *
>> + * The requested configuration may not be supported by the platform
>> and driver
>> + * may fail to probe - intended for debugging purposes.
>> + *
>>   * Remove devices
>>   * ==============
>>   *
>> @@ -60,6 +81,7 @@ struct xe_config_device {
>>         struct config_group group;
>>  
>>         bool survivability_mode;
>> +       u64 engine_allowed;
>>  
>>         /* protects attributes */
>>         struct mutex lock;
>> @@ -94,10 +116,95 @@ static ssize_t survivability_mode_store(struct
>> config_item *item, const char *pa
>>         return len;
>>  }
>>  
>> +static ssize_t engine_allowed_show(struct config_item *item, char
>> *page)
>> +{
>> +       struct xe_config_device *dev = to_xe_config_device(item);
>> +
>> +       return sprintf(page, "%#llx\n", dev->engine_allowed);
>
>I realize this is for debugging and we can look this up in the driver,
>but if we're passing in strings here, it seems like it would be nice to
>export this as a string as well. That way we can just copy the engine
>list, remove the one(s) we want to mask for debug, and copy it back in,
>rather than translating back and forth.

copy the engine list from where? My intention here by printing the exact
mask is to allow us to check what's the exact raw mask we are using.

Is it useful to get a print with a **similare** thing to what was passed in?
Because if the user did `echo rcs0,bcs* > engine_allowed`, if we interpret
the raw mask in the kernel we'd print back: rcs0,bcs0,bcs1,bcs2,bcs3,...
I could make it print bcs* without storing the string (which would
defeat the purpose of checking "what exactly it computed with my input).

So... yes, it's possible. I'm just not seeing how useful it'd be.

>
>On the other hand let's say we want to mask rcs0, we can always just
>set to bcs*,vcs*,vecs*,ccs* to get all of the available engines other
>than rcs..

I think the most useful ones will be rcs0,bcs0, and ccs*,bcs*. There
rest is there just to make it generic.

>
>> +}
>> +
>> +static bool lookup_engine_mask(const char *name, size_t namelen, u64
>> *mask)
>> +{
>> +       static const struct  {
>> +               const char *cls;
>> +               u64 mask;
>> +       } map[] = {
>> +               { .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>> +               { .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>> +               { .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>> +               { .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>> +               { .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>> +       };
>> +       size_t i;
>> +
>> +       for (i = 0; i < ARRAY_SIZE(map); i++) {
>> +               size_t clslen = strlen(map[i].cls);
>> +               size_t numlen = namelen - clslen;
>> +               char instancestr[4];
>> +               u8 instance;
>> +
>> +               if (namelen < clslen + 1 || strncmp(name, map[i].cls,
>> clslen))
>> +                       continue;
>> +
>> +               if (name[clslen] == '*' && numlen == 1) {
>> +                       *mask = map[i].mask;
>> +                       return true;
>> +               }
>> +
>> +               if (numlen > sizeof(instancestr) - 1)
>> +                       return false;
>
>This check should come before the one above it.

why?  first check makes sure the user passed rcs* or ccs* or vecs*, i.e.
without an instance number. Here the check is a sanitfy one for the
memcpy below... we don't want a buffer overflow if the user was silly
and passed ccs12345, or ccs00000000000. The memcpy is there because
we need to add a \0 for the kstrto* to work and we can't on a constant
buffer.

Lucas De Marchi

>
>Otherwise the change looks good for me, definitely useable as it is
>here.
>
>Acked-by: Stuart Summers <stuart.summers@intel.com>
>
>Happy to take a look for the full review on v3.
>
>Thanks,
>Stuart
>
>> +
>> +               memcpy(instancestr, name + clslen, numlen);
>> +               instancestr[numlen] = '\0';
>> +
>> +               if (!kstrtou8(instancestr, 10, &instance)) {
>> +                       u16 bit = __ffs64(map[i].mask) + instance;
>> +                       u64 val;
>> +
>> +                       if (bit > sizeof(val) * BITS_PER_BYTE)
>> +                               return false;
>> +
>> +                       val = BIT_ULL(bit);
>> +                       if ((val | map[i].mask) == map[i].mask) {
>> +                               *mask = val;
>> +                               return true;
>> +                       }
>> +               }
>> +
>> +               return false;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>> +static ssize_t engine_allowed_store(struct config_item *item, const
>> char *page,
>> +                                   size_t len)
>> +{
>> +       struct xe_config_device *dev = to_xe_config_device(item);
>> +       size_t namelen, p;
>> +       u64 mask, val = 0;
>> +
>> +       for (p = 0; p < len; p += namelen + 1) {
>> +               namelen = strcspn(page + p, ",\n");
>> +               if (!lookup_engine_mask(page + p, namelen, &mask))
>> +                       return -EINVAL;
>> +
>> +               val |= mask;
>> +       }
>> +
>> +       mutex_lock(&dev->lock);
>> +       dev->engine_allowed = val;
>> +       mutex_unlock(&dev->lock);
>> +
>> +       return len;
>> +}
>> +
>>  CONFIGFS_ATTR(, survivability_mode);
>> +CONFIGFS_ATTR(, engine_allowed);
>>  
>>  static struct configfs_attribute *xe_config_device_attrs[] = {
>>         &attr_survivability_mode,
>> +       &attr_engine_allowed,
>>         NULL,
>>  };
>>  
>> @@ -139,6 +246,9 @@ static struct config_group
>> *xe_config_make_device_group(struct config_group *gro
>>         if (!dev)
>>                 return ERR_PTR(-ENOMEM);
>>  
>> +       /* Default values */
>> +       dev->engine_allowed = U64_MAX;
>> +
>>         config_group_init_type_name(&dev->group, name,
>> &xe_config_device_type);
>>  
>>         mutex_init(&dev->lock);
>> @@ -226,6 +336,29 @@ void xe_configfs_clear_survivability_mode(struct
>> pci_dev *pdev)
>>         config_item_put(&dev->group.cg_item);
>>  }
>>  
>> +/**
>> + * xe_configfs_get_engine_allowed - get engine allowed mask from
>> configfs
>> + * @pdev: pci device
>> + *
>> + * Find the configfs group that belongs to the pci device and return
>> + * the mask of engines allowed to be used.
>> + *
>> + * Return: engine mask with allowed engines
>> + */
>> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>> +{
>> +       struct xe_config_device *dev = configfs_find_group(pdev);
>> +       u64 engine_allowed;
>> +
>> +       if (!dev)
>> +               return U64_MAX;
>> +
>> +       engine_allowed = dev->engine_allowed;
>> +       config_item_put(&dev->group.cg_item);
>> +
>> +       return engine_allowed;
>> +}
>> +
>>  int __init xe_configfs_init(void)
>>  {
>>         struct config_group *root = &xe_configfs.su_group;
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.h
>> b/drivers/gpu/drm/xe/xe_configfs.h
>> index d7d041ec26117..c80131f994a71 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> @@ -14,11 +14,13 @@ int xe_configfs_init(void);
>>  void xe_configfs_exit(void);
>>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>>  void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>> +u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
>>  #else
>>  static inline int xe_configfs_init(void) { return 0; };
>>  static inline void xe_configfs_exit(void) {};
>>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev
>> *pdev) { return false; };
>>  static inline void xe_configfs_clear_survivability_mode(struct
>> pci_dev *pdev) {};
>> +static inline u64 xe_configfs_get_engine_allowed(struct pci_dev
>> *pdev) { return U64_MAX; }
>>  #endif
>>  
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index 93241fd0a4ba3..af750ed8c0f00 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -17,6 +17,7 @@
>>  #include "regs/xe_irq_regs.h"
>>  #include "xe_assert.h"
>>  #include "xe_bo.h"
>> +#include "xe_configfs.h"
>>  #include "xe_device.h"
>>  #include "xe_execlist.h"
>>  #include "xe_force_wake.h"
>> @@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt
>> *gt)
>>         }
>>  }
>>  
>> +static void check_sw_fuses(struct xe_gt *gt)
>> +{
>> +       struct xe_device *xe = gt_to_xe(gt);
>> +       u64 sw_allowed =
>> xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
>> +       enum xe_hw_engine_id id;
>> +
>> +       for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
>> +               if (!(gt->info.engine_mask & BIT(id)))
>> +                       continue;
>> +
>> +               if (!(sw_allowed & BIT(id))) {
>> +                       gt->info.engine_mask &= ~BIT(id);
>> +                       drm_info(&xe->drm, "%s fused off (in sw)\n",
>> +                                engine_infos[id].name);
>> +               }
>> +       }
>> +}
>> +
>>  int xe_hw_engines_init_early(struct xe_gt *gt)
>>  {
>>         int i;
>> @@ -818,6 +837,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>         read_copy_fuses(gt);
>>         read_compute_fuses(gt);
>>         check_gsc_availability(gt);
>> +       check_sw_fuses(gt);
>>  
>>         BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT <
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>         BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT >
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>>
>>
>>
>
