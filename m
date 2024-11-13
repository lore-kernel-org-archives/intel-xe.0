Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67334D462B3
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 14:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3645610E1B4;
	Wed, 13 Nov 2024 14:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OUN9R4OS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715710E1B4
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 14:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731508964; x=1763044964;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zyLSS4I05P60OY0yo5o4i31TO6Qux7eBj+Ugs8uh7Ls=;
 b=OUN9R4OSrUGdCAg2seBMeWOrorLmPJlu9AP7ipKfW1+Af9Z0GPhYz/et
 u8ivXfXqtkFqY9bYgcqG3S4u5CM7Sgi8utJ3iBEbWto2xmRQuZWTt58ju
 lsJ57B/70Hhm+tdICCbPEOeMai3B0MAIIEFmbwcAyZyDMeam9qGVMqtM5
 6MOEAG5w7M9EBAvJlv+IYI+A87HaD6Fhh/njoU9K7+JLQC+N3XIr/SjA5
 HWTY7Huf+fH/qVD/eKyjGL18BoX5aR9CUCeQt6VLzzq7DSx6Sfoz+8s/x
 oxQZ3zcSzbZXF1+jhw4nnIMTm8D59f8tAWKkmvTv20daPnghRP2WToy33 w==;
X-CSE-ConnectionGUID: 9KDCMES3RjW20DWBP8hrTg==
X-CSE-MsgGUID: Sk09X5gmRcekWrimc6VtlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="48911900"
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="48911900"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 06:42:43 -0800
X-CSE-ConnectionGUID: ZTgmqPRRR/OtTmWzk+newQ==
X-CSE-MsgGUID: QZmwT04FQ2avOLir8IAZ1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,151,1728975600"; d="scan'208";a="87635227"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 06:42:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 06:42:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 06:42:42 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 06:42:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RE/37RGueAbuIEhySOAk9YJKOBEj2k0trglaE3zwSDubBTIg+TaAkEOvRd2/NpMynrNClFCjZvpOyi/5bOBzPZe+jCUOWBtQI25Dz7OkFPq8N1SQYCpPZ1ZOLeZLyXO4SBiQTjAftipKIl69sc+vPR+/cJ6vS6UiiKqujIO1e+ku4/WnBzSByFrFgZ2USGcgBg0lT3s/3UtwvDfc3zL4ETq31x/InIbX889rAPNHiVqj2aV+BcclhXwO98dyL778XwYs9Kehe1qrOXLcF3N+XfClqda840kqyzIQ3Top+uoBmvFK1eMTtdX35qNEf7vxuOOW8r+adfmjL3jlBsv87w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8yaYQhY8yhOD/8APdS8Vq1ix/z0wDPXV/DFMVOcNYs=;
 b=BYXDgrn1c2/5BpaEwSjCvyNEKOcEeAN7XXCPDFQkj6u4wc46DAsXyhugbxCyYcBVN356Yugc6OYqErIZROiAUGHkdaEkJKkWFrKvq4Ped3g1dUw8dVh0kqX7mxsa1j6adNlW3YUg7F6e48jtYGHjs1ILvp0sWUr+zpfKmiOkzXjYKoGJECUdAAZ/sw+gv+8xTqoaeIWRziEo3QgetyVsuVwRf76ElRfZdHeFc9ojJ8+JjRIHWPSUcllPM+cKXlsyzTkh/lGp0r54JWabgLe5SNN3/WLaZWDU0vQqwKX7J7JyCvMLy495E29RntGSK5mLdNelRyQnSbq4fzYZ+Cdo/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4597.namprd11.prod.outlook.com (2603:10b6:208:268::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:42:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 14:42:39 +0000
Date: Wed, 13 Nov 2024 06:43:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe: Clear GGTT in xe_bo_restore_kernel
Message-ID: <ZzS7AJd24jmRq+sB@lstrano-desk.jf.intel.com>
References: <20241106183514.4174086-1-matthew.brost@intel.com>
 <20241106183514.4174086-2-matthew.brost@intel.com>
 <3c2203a0-2731-4f5b-bf58-ecec21662002@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3c2203a0-2731-4f5b-bf58-ecec21662002@intel.com>
X-ClientProxiedBy: MW4PR04CA0316.namprd04.prod.outlook.com
 (2603:10b6:303:82::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: db6afb35-0ec5-4953-18df-08dd03f16c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1S7zIAR2nBVSqH3DciGB9tDGavaAHvatDRdJDEEV855pib8L1faUmfnh5z5A?=
 =?us-ascii?Q?PP0BwlNLZxC9JvRZe/r0Y9rvVlXIte2fa05O8ZLo4krnXUbDnWlgDqB6CzI3?=
 =?us-ascii?Q?Nl8IS6MIQwWrznqnsz6Jh4qCclBSdcXgLnxC0SlrDDQcLoL7SgU/T6B23R0L?=
 =?us-ascii?Q?rAuR2m5HUyBFzel86G1+OpDHueQsAumvstjSTR3b4TNYm018zq1aLWcPHmRf?=
 =?us-ascii?Q?bSS8A0Gj2l3OcKm4W4jh6B4C5I+FZi0d2DC91y4rFEQPllqLh7VK/xNgU8L5?=
 =?us-ascii?Q?Omag/Zj1khhBKV4t5OR23jJP0qhCuVkpSSTRaUtLDtThhT7AoSqQW77ZY6m2?=
 =?us-ascii?Q?70B0FWL6dpqhXCKOrRMU9fiHhbC7OIqZjL+10pGEI5PRXgFPSPpQC0x/1oXO?=
 =?us-ascii?Q?LpN8sUKZZZWkVOPq2DLtQvy9k380hfomG0FDIcb5R4bWy9dGNU995S4dCJc+?=
 =?us-ascii?Q?L2PX/VQd/eQqfSFFjHPMMu7JomKPfOAqNaSKr4j+OTk5sCOxuIZcK9isc+it?=
 =?us-ascii?Q?egn2Qm7KiSLSKAVaHI3K8jdZiCQZfgWAFhTib3iPjrp5gaAomvyd7cXYgC4o?=
 =?us-ascii?Q?PDd+ERj4lP1BqMqjrwx689R99bYvBWN+6Kkb9rMi55had3Bish3e5B8IGaR3?=
 =?us-ascii?Q?MAom7VZEek6ineo0IH7mnWcjAIoireou+bwpJXYUgQoiYD9C6oO4Nct2IPVi?=
 =?us-ascii?Q?xrjtq+d9gGBu/XC8TjoQ71TX9TGbO6WRK5nHzgwwsJpOA7OCKQI3HeF6LYRA?=
 =?us-ascii?Q?xacNCf6+8MPFj8/s+4Bw+BEA0tUMyMyKGFVvWpLph3yKASS3x34WMFWAVChM?=
 =?us-ascii?Q?gD0v0/Pna7Km11Cel85SXCmVC1RYV12YUctx1yxDoQ2UncAY1ie9zABQNNXX?=
 =?us-ascii?Q?bhIGnbgDYynVX4rtSgP5KOHRjetkh1wY+uNw8Ose440ZlrgaPdi700Vf6HYI?=
 =?us-ascii?Q?1XTaxa5mbirXMHsWDjG8tSWqKedKbw4YNXxdAizAH+PldKjiKdOyagWYqeEn?=
 =?us-ascii?Q?9ihHazjmGtFRqH/juJYsiSXkFKOzRTE5SSaHYcxMqeZHwcD++Qa2z06tpTC8?=
 =?us-ascii?Q?Griu+ruCEI9pQTFt1K7iIadraCod/8928Gg+VpsBlMI4rgzVPhlJ1gExZ025?=
 =?us-ascii?Q?WgbPSqLP7GY11H/YwIb2VLcyqgj1/kdyJ/j+U2NOkRF6wss63Ol/FbiI6DK6?=
 =?us-ascii?Q?zws17yKs3XnaniB1n0wayg6lyWhfRpkXjYworbpzETywB5IthIymZQ7f2or8?=
 =?us-ascii?Q?LljEpWIoPAknyBG2Th1U8HCdHN8G2rOTXaBdBMWqt2NxGpVDU/x/FK6Na3xZ?=
 =?us-ascii?Q?b+yZHlOcVKMv0jR3rHmnWFNm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?szCibyjTEcei2YBmVEZ/u21K24X2UWEIhFLRfMAasqyPBSw6gq1CUakxDBIG?=
 =?us-ascii?Q?w9UrHQA37/vkOF2BtARM7pWGePP3yHDfFEGUz/UCPODF6CuEHTL+yW7ks5iW?=
 =?us-ascii?Q?SZrvxZFmm0swOqQNXA5w4g1HpAM7GwGaQdcIAFnUGnFAqcDC9xkWWcR8A8ON?=
 =?us-ascii?Q?5XeqUJsyLOptysEtc8436r4sSU0jd3IEi0srcMtwryi//4LwEJeUQBhEJZtl?=
 =?us-ascii?Q?6gP70kcIRJI/qWBya9KSRw+CyROFEKzBtNKji5kJp7Iq+PPr1zCYpoxB7UZm?=
 =?us-ascii?Q?F0ucYzRB5ZemILmHHyq6ThfpQUdPnGabFGNcj2MsBkPY0aoO3Dq19m8R8SVA?=
 =?us-ascii?Q?AFf4UR11KkfAZ+McNWLZq7M6Oghm1Y5V8ZFeJnZVslCn9Y2AOFfCtb5NufaD?=
 =?us-ascii?Q?uzEIG+V7mpL3Hi0kpZZqBy0neXqX8vx4Y7MihibLjLomu6KbSzTSUXI4/pCF?=
 =?us-ascii?Q?Jsv8U690EyZnS80FiqgU4BsXHd+V298mKrRRX9K8YSAWmAUBnqd1fDkYphGZ?=
 =?us-ascii?Q?kYDVicyfN3MzzAmZGtcSRpUrLf2LhNqY+IXNO5yx85KY6PqjcUppKsI0hYhT?=
 =?us-ascii?Q?N2umL1cY/Xa3YZbRPJ6z54dYW+t7u9K+O5qEJ9YKj3Zhtkjwn/nTozy0yeg1?=
 =?us-ascii?Q?EZFfES0lBzHO5R0WfIlJPG1A8277UrlFzvu2kE2yFfg7lRazoxtIrzR3zFLs?=
 =?us-ascii?Q?5F/vdxqf2cVU9TBeCj1CN3r2rWsiME7xIFu1ik898FJl2oZ4oW/rp/5c9qq4?=
 =?us-ascii?Q?n78pHhK1cOAM98fqBTpcGDK3UW8RpLBYkIMyCMaDrN5RFC2oQ6tsh2BOlYqa?=
 =?us-ascii?Q?Rx7gCaFQ8sT5hhc9ko1M0FCmdx65+b7wKIEc5Tu9qxl/BfhT9pXVPDPFquN1?=
 =?us-ascii?Q?jXYf63T3DEGXXZfb1QywwjOt5OWTECCz4kYhHvkmQMvGOVYWhUDEbrpoHGc9?=
 =?us-ascii?Q?dQXLWmgr+1wetiBrX8kcHKzKykxMsIWCT04giCHAvW9IeNBO91gedEJMM4CE?=
 =?us-ascii?Q?mJcMk2+x1zOU1hpKSW/6v8XPAZ3ARDglyFSLFjiEOqG6Frx8WYz6waSJAcc2?=
 =?us-ascii?Q?QpYIh4vwgBi/DtTskblHfTRqyUqPvEwYgJmFJwYgiqQHXroWB3eElm0kXzU2?=
 =?us-ascii?Q?BTSzboIhoHeo52SfDP7vHnqt08UVLh8Uy+7EMnzpqWR5B1ErFeFgTlzJMk1v?=
 =?us-ascii?Q?SXWgZfKuXSBmrLNB0vSH5Gf5Cuat/v/ALovD/f1EZWGt9Ok5Ag1S63B4j62k?=
 =?us-ascii?Q?YFC3Ga9vbPj4mMzhQZ1k6nhoy5bTKeYXT2ON6JeHE+AeJHhfwNXpG3mtDavD?=
 =?us-ascii?Q?AfLxZdI8AIlSxeujCXFDXMo2fpeRJm9bllSPJrgtJ9qYLS2m1pDm8aEUTzsV?=
 =?us-ascii?Q?MxvsyZ/wb3OjzG8QZKQO+xTSmyyeqPFEIUvglywNERULG+tBg/ZL6ENR6CYA?=
 =?us-ascii?Q?j7hPAMkK5oJaHtXcvwHkjS2uwGWqfeoWtLxzE4WWyZgiXovsGWh8CSOyadzd?=
 =?us-ascii?Q?9OxisKDq3yYHJL0VbMxwei69dcS5PQ0IJvw0HYFAQatGxUWhII+7hXI5fKQm?=
 =?us-ascii?Q?IXxW6aVbLMEEJIcWXZPetjw31L+lfd2OAd6L7poWiASeoDgwSmAUvPDVtHph?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db6afb35-0ec5-4953-18df-08dd03f16c07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:42:39.2645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQAuJGbK9IaVDghs70O3dYwl4WyvQMJSgNC8SFAcl0GGs90eJA5sYzjeQAQMSajppQuPzmNTIGZckJ4IqXNqSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
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

On Wed, Nov 13, 2024 at 12:55:35PM +0000, Matthew Auld wrote:
> On 06/11/2024 18:35, Matthew Brost wrote:
> > Part of what xe_bo_restore_kernel does, is restore BO's GGTT mappings
> > which may have been lost during a power state change. Missing is
> > restoring the GGTT entries without BO mappings to a known state (e.g.,
> > scratch pages). Update xe_bo_restore_kernel to clear the entire GGTT
> > before restoring BO's GGTT mappings.
> > 
> > v2:
> >   - Include missing local change of tile and id variable (CI)
> > v3:
> >   - Fixed kernel doc (CI)
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: <stable@vger.kernel.org> # v6.8+
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

Thanks for the review but I'm pretty sure this is breaking display... See
our CI runs, hard to exactly tell because of the instability there. I'm
thinking only the parts GGTT without nodes need to be cleared, i.e., do
what xe_ggtt_initial_clear does.

I am a little unsure how the display code restores it GGTT mappings
though as it appears that code bypasses BOs? Do you have any idea?

Matt
