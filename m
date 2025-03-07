Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBD6C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 08:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831C710EAFD;
	Fri,  7 Mar 2025 08:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAm9dXpu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86D610EAFD
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741335239; x=1772871239;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=V9j3pbEipiCZ07yLLskDedFKLumpX7xn8Dbmbg2nuFQ=;
 b=DAm9dXpuFaOjUZ1Vu9zEHnH9qqAqf5VkLd1nxVmcpKOdZTO/6HPk9Nir
 XvYyI6DggEq0NJuBYI0FfR4Bj9LuSWgD29pP/yDwHkHBxNj9STkUsqLr5
 TkQPtW2DaSY55v/nL597IJVZgdBAUd2mNnoMyysmiJKRIXVLznHbgfD11
 LxH28B8cXKcbaX4O2bd7HH5Zt/RU9HMfIw0tyMJNVaau4fdKbl+seyRkF
 eOJzxsUVHhZfV4QSRqBa7KPWMocy/5EWMmC9WUdLwF5rA6n6dd1lWSKyY
 YB3eNWEwzCEcr43nGjOqoCS09SRCqt1V/dwn0/05nMcIvY3QkUrrY6D6i A==;
X-CSE-ConnectionGUID: OCvvoIP8QWOG3zotj4U1zQ==
X-CSE-MsgGUID: 7y5OO5kASCe39vYGqR9rsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42087702"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="42087702"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 00:13:58 -0800
X-CSE-ConnectionGUID: 5ByZS9uQSLm2aGh8AnDr0w==
X-CSE-MsgGUID: ZpitVBJzRsuhQzPrL9XSGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="124352654"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2025 00:13:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Mar 2025 00:13:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Mar 2025 00:13:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 00:13:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VuNWTllKgDY0k0nwY6CTxkIOSEBVmSXCRhwWreUQTFOo8Q/iHojgNZSSprXUWJTf1+R7aKSaBwK49CR68fLnTA/CinCPMT8GMsgMppIphyfE15w3wlWF5SmbJjXdonSFTR4FHDKrFx+1HdeHCKnM2gB+ftEy58q3a/LJpd8fnezx3jAmpsSlfcmti/iTQeiIIobaNWjKMqSG6TDFUHvYfPOTNf2U05Rp0WFYi5qJ23/XgoRfVjJB7+2cau1HDsVj6AobiToFNtrf2Bb6M7PmayJSdm3JYZGwhf08/g7N+84I17hYiZIDDU1Q/RrS7UdxOCRk9N6HB9vGGaBn2/Svxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd9T1aSYLK2xE5Ny6buvs2SxNslo0mKPE2EUjXVzLlk=;
 b=q+HMbFvLO8LDVOccQXjwIPmMq+kWbkNcApSwHvz9vrgJVeTlOWczOjPjgYAH81dIjf6EKiH//G/WLPsrF1WajEUyZOmTECRU0f0ik0NnjF4pOeWEwl5dgOQWn0i/HEOkuh5ItMWWpNep60QVP9xd9fvqjHldJbLBiZAiA3eP0Lw+5KGmZRdPLF2w8b5oDgsRVgCih/8r7n9fus9NQiGNKrtQqPVtOmWg8ZHoNdItFQ1Y3ptcE3soMTo0RNUu6Bxzjyh1Jdxp167/w+5Ly4QljNCSoTZeUtK1KulgIa/YWuqel4ZVfyB7qyWnPW8VszmJojN5n0J3slrY0fatBxVorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 08:13:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 08:13:17 +0000
Date: Fri, 7 Mar 2025 02:13:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Release gud ids before cancelling work
Message-ID: <7ca2dtmih4yi7sofvnsyhf5faio346cpmvycfcbydkg6oc3ds4@e34lsdylsjdi>
References: <20250306131211.975503-1-tejas.upadhyay@intel.com>
 <Z8qL9RW3DCzkS0q9@lstrano-desk.jf.intel.com>
 <SJ1PR11MB620426A08AFDAA4DC2DCAA0C81D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB620426A08AFDAA4DC2DCAA0C81D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0092.namprd03.prod.outlook.com
 (2603:10b6:303:b7::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0c04f2-f012-4b02-be8b-08dd5d4fea67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RKQL1Ez9WFs+Ut8Uw8tqtsWs7mzizJLLdOODNHPpowH4fo3WyFledQ1MQTsn?=
 =?us-ascii?Q?UKNjBUE1fp3l9D+kWRIp6LVRAuFHf/3ZEGBVgbQOiCx7nPrxLADl6Sn/W4NT?=
 =?us-ascii?Q?TlcTykIh6bDU5ocnfANdCedH2uYYX3h7u8K+YieFMZ8VMmNSalWaeHyMnZp1?=
 =?us-ascii?Q?2NS/36G4iHzhGzrktTnc83pTtYxrIy7QPqbrJ3WgCUYIxVs9GGKgL4p2cCsc?=
 =?us-ascii?Q?PXmvJEjGxg94xt8nKo7O2/93ProXgQjMl+6zUS/9Gi8wA9BQZUrmk73lWM9s?=
 =?us-ascii?Q?fmFkWjNMdxWwpDus6jEzfQrkAH5URMi1kP7PNskfWG7NIoZsVaIU09jtBa0F?=
 =?us-ascii?Q?VVwqcjiNFq40FWvQFgUgI/vH9+ubqVgpMYBuuDPNqrMQDF+8uENY0o89KSA3?=
 =?us-ascii?Q?nWj/dOfSUfmzfbf2AZP+X7FldOs0Qn6BeQV2cTmdJpYVEIe15dE0riCItM44?=
 =?us-ascii?Q?Qh/1zk8b5HCUh8snpu46PBQ+2RqhIxn4JepMCpd6ZB3JOZr4U5WVfVCtxAvc?=
 =?us-ascii?Q?eypAUeCyVWiXBaLjbmAW16tVg9NZZ75Mr93mUQ/0ljaxivl2ncp21CgENy0T?=
 =?us-ascii?Q?nh3D6DvZN4hCjpiRLBay4cl8NtGfELvq6e5V5e7qXlPWsY86wZQlF+HEaoWi?=
 =?us-ascii?Q?KrfdZXyx8nbJpkaz2+UsdSFtjCVh7Rm6MwJ7Vo8DuDSRhccicZncuO18fF+t?=
 =?us-ascii?Q?AdxvPiFWzuTuTzYJdhmTj+sGujMUbcpx7GcYnNns/gPXYjQRfAWRv1sgu3QA?=
 =?us-ascii?Q?xAA+9jTh/Da/nco0IYtqWTMz/e80LhuStQklfb6pkqQe54llsHV4DkkBh+qe?=
 =?us-ascii?Q?jux0tlMWz/8/l8WE2fETFPy8z/ECKaiKmGvJmTHkSvXRcrfMgmoqtxbA4FlN?=
 =?us-ascii?Q?y4GUS0Tt2zcJDgoaVzggw+1KchEfXOPWEcFall+UtIgZOYR6ZHC4mIiVCuwo?=
 =?us-ascii?Q?gbZNT0OsAdZlYD9/N/aoKT0h7dlRqE2QpwrqIvGxAZXWIHwYMtT6ALjW7M07?=
 =?us-ascii?Q?lGTr/vXiT8n3j/Lu32v7T3yl8rq3Tml0+EGiEQ8SYoujLz7UmITi00lq7Vpo?=
 =?us-ascii?Q?tiQuiKpmbNrIIYihiKeEfsMMqYT9r8gY0uHvyvtNOZe3s7AP1y9gpOEm9Jyf?=
 =?us-ascii?Q?JSS/HVy41f3QypzDw6Ih8Bc4B3dvhbMzS+aE2dHV0UcrMWdiCfOQaY1nOCmu?=
 =?us-ascii?Q?yDn1emUUgBYC711kdgjzmutAZv5OaGa4bJC980L/PRe7vcVd6gjIKmEvI1Je?=
 =?us-ascii?Q?2HBzMsGAOHeG7dimGWx8SpOvxt9qvQM5PBhSuwBij6UzWc7511PcdR031Ow9?=
 =?us-ascii?Q?Y3ty7lCBKmbLGjluoiYZOBMfubShoMa5DAjbjGrSg5wVoFkhxiSaIWIBALhD?=
 =?us-ascii?Q?HA//9G+66sTdsTGBRHAWLYHVvJ2E?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BnebC+/mjelTxQweHXSZUCwOzzK1jbYWeSd0+DSXqMkOfnjUefz5pQeXkApH?=
 =?us-ascii?Q?tkdA5PpWCTR8tKMnSNn8yVZGs+76IS6hIgQjk5Z7chEZNKdpxUWayvUHJCQ6?=
 =?us-ascii?Q?WGQD/0sB1FNA8A/3SE2WC/tLO4V5SHhIr5Uf1RkNjrvPMCC7nKYqzafPOmnU?=
 =?us-ascii?Q?5+mvtw9FUx44ccaj4LmCldZ8uQRqOx2hvd2bGM50Wpdl10apeOwSUiwoA1iE?=
 =?us-ascii?Q?BHSPy3P3L7bdVncpRtjsstZ/0ywHG3UNqrCRT2uBecsf1zZqx1U6tPL3hDl5?=
 =?us-ascii?Q?ps4FhMwAQsnLCjf3GMefGduQIvDqpNaBrLGa5x9zeoMcYI7z8OSwNIqOaYQi?=
 =?us-ascii?Q?RScUVKBPShe0q+5r6H3dTgLhpjnT9xjVRQaKSj1wVybz91q/h0Y0TAqls2qK?=
 =?us-ascii?Q?1F9S7+/Z5jIrl0i0OpvY2D9jjeiL4lMNP2MPPZLMU6iDpeH4cPxeVWQZevK/?=
 =?us-ascii?Q?tqY1ceZpFQx9EpWksNLao59TpSKJq0iFpXtZgNk/sWbkoKgdF3z9MgdBnWuq?=
 =?us-ascii?Q?JfikrK77QF6NxFcVcUhx6huSWIjZBwuPTlxO8GUlLaXOULWvrm6c0K5rLXQL?=
 =?us-ascii?Q?vwO/hNRWKSYI/nDBCu1RGxWyC0yLJtsgDpO0+EgzH79Jg6GXCoekEbpQM3WA?=
 =?us-ascii?Q?u2ELiFmPgAWiWRgn9kzR9OGzGmIvGXNOWyKQniBcKZlVEol4TnyCJvJ+w+up?=
 =?us-ascii?Q?jYOw9zXm4znYxHPtTbBHC6ERszYk3nX/ZV1A5OE7oQUMvzuBTcdUaISGEXfO?=
 =?us-ascii?Q?l+eqdrkokHJ1X474EN/ExLMqgFy0cTvsVJzAzqx+x1pqCOC+y40ktqI7JNxw?=
 =?us-ascii?Q?wi8Ppn6aHjOCcsuS9n47VWyiDSUAto6UdatkUg9lMJPzd+RJAyhEqQiEYMdS?=
 =?us-ascii?Q?QGgjcUUm9fflZP/F3li+uGZ4XdDGJWvrFu5ZNUeytCxwW5mDGFaw1BRcYANQ?=
 =?us-ascii?Q?C3Th8mPQghymTRE1Fhm6nexqT2P+fMRW6xoEvBcJ5kGHqM85NRuMDSqHCDT/?=
 =?us-ascii?Q?4AFNnb6dXffjUcff+tsrP0tbYd7PSZGKsSyotktFrQy+1GJU777Vw29oeDL/?=
 =?us-ascii?Q?A4wGODGc7ZX5boItNMcJs87L1jyHYhZwmILZ1srOXoqeCkKMTrWnVfnSg9lk?=
 =?us-ascii?Q?HM++rPuPokktvTvaMu+brZx/nZzFZb0W1CyviaThDriygYFVhWU786OaOIzf?=
 =?us-ascii?Q?Mx7vuZZpvsuNN4/TWjAAc48f2kypRW6Cu9drizZIQyOYG0dJmZ94N2w4jBlH?=
 =?us-ascii?Q?1ZbQREGQs5y7yhWj00/Jv7qQiVjErPlDaxWFJZVLhxK4k+IyQdBpBkCq+3lR?=
 =?us-ascii?Q?jS2AbH/hSfWRxzX+If9n2nNxLagAR/aVmVBRFzqJjU7FvOIJ1GY0P1r2gWZQ?=
 =?us-ascii?Q?MFvNQhjvzspbtlYARPOM8Hoz5x6uWFtXYq9ML9kzvSHgL/nv9Qyi6ECVI64R?=
 =?us-ascii?Q?ZZgf0ndDddOq21h833IPHdqs4MrvD3i3TfpJoFmm8Bk8Uv9870Tx3L4PMvOx?=
 =?us-ascii?Q?XSsAM5LNdujFdHSpDPzfxecQE8jCyp45s42yGdhaFcamhhOto3BKIW4QNTr1?=
 =?us-ascii?Q?Dty6TYoqH6WIL9juULLDAwd3OGTD2lOzvuU9EQlVlxP+rWvGGjwzxyVJzw6m?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0c04f2-f012-4b02-be8b-08dd5d4fea67
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 08:13:17.4710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQeL7LdbamioXAjUmN6rhRJgaccyQftw0GmosC3hQwmbtQCGURO3OkUeqHLTCpIsq/VEY37E2Q+9M7imJ3W40P5/AarC/ubi50SLwQuBm0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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

On Fri, Mar 07, 2025 at 06:03:53AM +0000, Upadhyay, Tejas wrote:
>
>
>> -----Original Message-----
>> From: Brost, Matthew <matthew.brost@intel.com>
>> Sent: Friday, March 7, 2025 11:32 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/xe: Release gud ids before cancelling work
>>
>> On Thu, Mar 06, 2025 at 06:42:11PM +0530, Tejas Upadhyay wrote:
>> > A GT resets can be occurring in parallel while cancelling work in
>> > async call  which can requeue these workers.
>> > to avoid that, lets first release guc ids and then cancel work so they
>> > don't requeued.
>> >
>>
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>>
>> > Fixes: 8ae8a2e8dd21 ("drm/xe: Long running job update")
>> > Fixes: 18fbd567e75f ("drm/xe: cancel pending job timer before freeing
>> > scheduler")
>> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> Were you able to verify this fixes [1]?
>
>It is not reproduced with or without fix, Ran 1000s iterations of whole testsuit on BMG as well as on LNL manually through scripting. May be CI can test it better.

I fixed the typo in the subject (s/gud/guc/) and applied
to drm-xe-next.

Thanks
Lucas De Marchi
