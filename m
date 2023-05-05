Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADE0C77B7D
	for <intel-xe@archiver.kernel.org>; Fri,  5 May 2023 19:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD70810E664;
	Fri,  5 May 2023 19:30:00 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80B010E664
 for <intel-xe@lists.freedesktop.org>; Fri,  5 May 2023 19:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683314998; x=1714850998;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W00u1GYz6QoKmbr9vMG51oqXtWy1tvdfDNbcGYX8ljg=;
 b=Tv82+1H2hILq4dxOk1wC1nw08XCZxxt3K5p3d3g3w8hcUl3zv19285pL
 Id3pvJ6V5ovPOzwTz7S6NhI5jjuZe0LHvOlUlCOj/SiHVAHnjxTUkYyhr
 bEtvJYVIsIL/jcJ1C0RJlH5BLw4cVKNf1R4iwLsu6RGGCy1YBiufPgbeq
 mEIFvALgPetw9slSrpUdb5AHxZ7wphQGfvoVoyu7jAA0UkOSIi4+PuSjc
 uosJrz4M7751VcMt5yWqJK3a5OkmoYrh0oIMzVBHAO19+KHgiLXyxRWl1
 +3HWvtyhD1MA6sa8vBk0z5hAJ1y5RnNMjEo6J3vIHg/AQdL/ViWK+panZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="412525134"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="412525134"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2023 12:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="697720025"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; d="scan'208";a="697720025"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2023 12:29:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 12:29:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 5 May 2023 12:29:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 5 May 2023 12:29:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dao/EV6fzQAPNAyu6kgJqF2NNGOuJnNOHb9DfJvmVAGD28ZN69q2RyUikUs4icVSJwBL8wUmzljnN+ZRH6hMzDMt9PMzdwOsNCSP5OB0iSwvs47J8yFrikyZMjER1po2pm/1N990QrA58VaSJuhE26Y40GWYyX3i6kqqvdL9qPVpn4Due8gB2do+f3p8SgmaAe6aneNbVE2hE2S38SwvsPkbwoFl96uriaNXlGOSko/CKqRSm3tVIuhT2hPH52mcQ3lscT+MQcj/DipFMktSrvismTuPcfGfufOuWrk0uakehO0hfZwZVIJMNxJEZHcRbhLXUQwixe40+FZuloYerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B5QwpFay/elQ14UKnp+n7bQ5bAif0dJE3ODCsdc91E=;
 b=cDioNCUat63lq/ONULrRd2lCXnboMI1nZ6AFGlr0+mqFEXEBJ3EFDleg81eJ3jvuvr+/JjDFJi0E8Ava9TR0eZhpflzjuSSxWWDWKymh39syBVg/qOjfCCKj4KgU2Dw930TIaPchDF2XYsURB2nAt2Q0QoyJ+yhuCHtt+ZQLBCtA0QnyUHG+M7u3+b3tBBbepZ1UIqsJZIsR9/VEEwa/xzVnj06Y4il/fT7WZ8rzZ4PDn2qfEKTSBlJ+czxLzgC2to6qjx51CFY/6wurzUI3TlBVQVN0V95kIxmTNRo46B38p/epQYUjlGUbOSBE+YDaf/VSmb+47AeA3vloalqzVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB6765.namprd11.prod.outlook.com (2603:10b6:a03:47b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Fri, 5 May
 2023 19:29:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.026; Fri, 5 May 2023
 19:29:45 +0000
Date: Fri, 5 May 2023 12:29:42 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Message-ID: <w2qlrfen5zqwvcj4foqvf4b3ac53lqkcwyxvuynxpl77p6qnf3@b7cl4scp6ieu>
X-Patchwork-Hint: comment
References: <20230429062332.354139-1-lucas.demarchi@intel.com>
 <20230429062332.354139-6-lucas.demarchi@intel.com>
 <ZFU19MkYZWI+ttvK@rdvivi-mobl4>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZFU19MkYZWI+ttvK@rdvivi-mobl4>
X-ClientProxiedBy: BYAPR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:74::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dee558f-a804-4d74-550f-08db4d9f150a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VbDSJMWYLG6SM4hwfkvJvyZB6hb9gNQuk3uGXM98/GUgVONor+it6MJz5I5fSG104OSdPwyXh7FAkU+WYz2+Ks5jXza8t481EMKgvvm73QpVheuGeiiuvz+DSOfMRo52U4PliKKeDDKB+BuB2a4F3vPGlcokpikb0mgYRXQr6z+nSv74jkKqOFiiFNtRKlryj23vbxHn04EUVA0ugZJHjnTAoiFz/qYwAttD9M6D2vCY7mz/PQUC9eriLxs83WbTw+hLcK7G2oI4UVB1DFhNDsA9PIUNvkZdoUUvTr/x8gAVw0Sb8LT82bcQz1dPn6FFp6iHsS4VxpofNX/MHSnM+2MHmzfzUytLD5Ra7jcIn5tVqa7kbSD8nrnIBl+M6iAuZYkgVXLQ189D82zM/HqF1S7yf0KiWONGl5JDQCwmygMVet787uo2iro+BUafO/FFDCPJJbHlBpAJVDfMJQMGL+BHRQ0+9MfaWxumMoGAquvgLp2SBM7OLzIZrbsSLScM8sKFbcr1h17gS1DE12ANaUpUx04QDEMug2reVKRyh/MZmnKRcQOwuBR8MIIwmIJk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(38100700002)(5660300002)(2906002)(8936002)(82960400001)(316002)(4326008)(86362001)(66476007)(66556008)(6916009)(66946007)(41300700001)(83380400001)(186003)(26005)(33716001)(6512007)(9686003)(6506007)(8676002)(478600001)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H7Mh9+v/Zp2mT7E6hknA8G2re+iNgguEiztLufCR/WdBQJg+ObRqPtzYtm0v?=
 =?us-ascii?Q?ExjtnBousahf99YJDWdjoE0UlJ1rooDUdQZD5hskRBOHVZg9TuOJajYjAkTu?=
 =?us-ascii?Q?3HinUbquVcsnYtI7Dt77UsfG7T4pT3ZzeguumnEuzrHmdWoJipnB2GRe9TJD?=
 =?us-ascii?Q?Yz7YJu9QDC+fLK6wmtVRFdAXG34uzGQ0vZpBquGJmccU9YNjfkBVT7Gh6DRs?=
 =?us-ascii?Q?nNcphVGLt0UGn3B1AYUjD945xzR18BIoG7TP38bI+L30JfJjHb/hFvBrlVj5?=
 =?us-ascii?Q?ZNvsZZxkO2sJD8flj/6kSBUc8se/5WRhzfovBF1/JMj5JGXd/7C3RZk2C7g9?=
 =?us-ascii?Q?mgLdirwdGTWE6ayw4yu7rnENIJvkHpze58NBiXjvr8WYWIBeh+5fkU3JJKJN?=
 =?us-ascii?Q?F3g+Cc0MwYOrejkOHDiH3Cq1Js2+kt1qL8PwW/ViryJGKKbiiXrZkcJa56Ww?=
 =?us-ascii?Q?uOEdR8rgL3Ohs7ro6ZNAPpMbz04kH03IfizyJUHPQT70KCfAqdOg68JvQa1g?=
 =?us-ascii?Q?GvomnGQbMyCwcizCu9cfyP6viGbBKh8P4ZPtDRVLEk8T665nGvSMxqPj/SeF?=
 =?us-ascii?Q?qj1nOIi9ALzBB2asJ5icZG16yptFwetAJ4oynSaR+jPwTDRH0RC3C8up+yBr?=
 =?us-ascii?Q?/8CosP6PX66pYH+6Ki+6qt3oQrZGtMfbdWdtAx6aDILeM2xxnqWigKf3dLjm?=
 =?us-ascii?Q?qdJA223QWDC4vxlUCrc5acT7kJp2zI+9T3/Ul3TFS8+pNjCiW7voZZ/oAqpo?=
 =?us-ascii?Q?6Rml7e8wYjp4A5m6C2cd5aI07Pbag771uTLXVVKYs1ZJdKK7K4wLydpog2bS?=
 =?us-ascii?Q?+iQFco0dowO5KPh6HDxoDDnT29lqsnGQIh3jhsgaDE+BsxzdS7o3qtrqat4b?=
 =?us-ascii?Q?Aph/mvx3U2YtY4y9XkYoC87dta7ySvaPSbIWzyDZk5vKR7Aw2bKT8fBZh5No?=
 =?us-ascii?Q?xF00TzJIQYWrN56VR105YgvwPyRWHx41fInFP4GAg0jtd0HwNDUyo8bOz0q0?=
 =?us-ascii?Q?nWJzJNrUMy+aNjeupJMPkOo5pmBYw/sU7yuDaWuzSPd5ZtMmmGnLbT3wh8Oq?=
 =?us-ascii?Q?zDsSpRFgmuDasYSeeR5wKLRYpDXw+2L7bBaVX/E+Si4Wux//dmwYBSlUnHgO?=
 =?us-ascii?Q?BkUn4fb5s23wq20QbQimFlIIbCgBhnU6bmW/iraaBxaJbvz8b+ZLhpZqZzWM?=
 =?us-ascii?Q?w2oXIfJ2SToSpMmiftlReolBvzwkeSf5zjy6bJ8sLVXS15dOrqFntE9DEexb?=
 =?us-ascii?Q?0+rEucUGOwVSZ+/QuKNwauJsY4X9x61XvW1uM9HD0y7rgCKAJDxnkqH94Pep?=
 =?us-ascii?Q?e6dQl2k4ZDbH8Nb2dtjX5dL/dOes5kZmVGLtEP48k6IFZjK9RfwZ9t6E7hYk?=
 =?us-ascii?Q?3+spzVHhr2Zz0Mt7KpH8dzPrX6GNIGEWs/S7d0SIbM4dYAk0VvzzIwubhCO3?=
 =?us-ascii?Q?6xLzsJIzBEGdlx3c+F41t/XmIn4eAaKNkGLXK3zy4ITeFX9u+F38sE3D8kR3?=
 =?us-ascii?Q?c2LYXeGUl/7omCD8DoHlFPv3prWOGYPqDGg0B7cuNr4uYApuIMOzHZYtDRU9?=
 =?us-ascii?Q?RtLVi2jeMxIV3kRcrR1tYCuGZWJ+7t6HtiIafx6hW4hScq1KH0ONnANHDDDs?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dee558f-a804-4d74-550f-08db4d9f150a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 19:29:45.2999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2OkiAQMDdYr9u8edi3kCexcj5hxa8MiLpQ5oklJ1uUpe9jBjReHSLv5DSLG3jO6MSc0l6WKxF/Ad53GK3VXCxH6R9SlYtclXfUtMWVm+/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6765
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/7] fixup! drm/xe/display: Implement display
 support
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 05, 2023 at 12:59:32PM -0400, Rodrigo Vivi wrote:
>On Fri, Apr 28, 2023 at 11:23:30PM -0700, Lucas De Marchi wrote:
>> With the move of display above xe_reg conversion in xe_mmio,
>> it should use the new types everywhere.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>and this is the one that will likely conflict with the series from Jani
>right?
>
>I will try to merge his series today, then on your rebase you change
>both this and the previous at once.

not sure I understand. Aren't we going to move display up anymore?

If I squash this patch on the previous one, it will create a conflict
when we move display up again, so I'd rather keep this separate as a
fixup commit to be squashed in the initial display commit.

Lucas De Marchi

>
>anyway, on the approach:
>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>
>> ---
>>  drivers/gpu/drm/xe/display/xe_de.h | 89 +++++++++++++++++++-----------
>>  1 file changed, 57 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/display/xe_de.h b/drivers/gpu/drm/xe/display/xe_de.h
>> index 0c76b0d24d96..e6021f6d031d 100644
>> --- a/drivers/gpu/drm/xe/display/xe_de.h
>> +++ b/drivers/gpu/drm/xe/display/xe_de.h
>> @@ -14,79 +14,95 @@
>>  #include "i915_reg.h"
>>
>>  static inline u32
>> -intel_de_read(struct drm_i915_private *i915, i915_reg_t reg)
>> +intel_de_read(struct drm_i915_private *i915, i915_reg_t i915_reg)
>>  {
>> -	return xe_mmio_read32(to_gt(i915), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_read32(to_gt(i915), reg);
>>  }
>>
>>  static inline u64
>>  intel_de_read64_2x32(struct drm_i915_private *i915,
>> -		     i915_reg_t lower_reg, i915_reg_t upper_reg)
>> +		     i915_reg_t i915_lower_reg, i915_reg_t i915_upper_reg)
>>  {
>> +	struct xe_reg lower_reg = XE_REG(i915_mmio_reg_offset(i915_lower_reg));
>> +	struct xe_reg upper_reg = XE_REG(i915_mmio_reg_offset(i915_upper_reg));
>>  	u32 upper, lower;
>>
>> -	lower = xe_mmio_read32(to_gt(i915), lower_reg.reg);
>> -	upper = xe_mmio_read32(to_gt(i915), upper_reg.reg);
>> +	lower = xe_mmio_read32(to_gt(i915), lower_reg);
>> +	upper = xe_mmio_read32(to_gt(i915), upper_reg);
>>  	return (u64)upper << 32 | lower;
>>  }
>>
>>  static inline void
>> -intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t reg)
>> +intel_de_posting_read(struct drm_i915_private *i915, i915_reg_t i915_reg)
>>  {
>> -	xe_mmio_read32(to_gt(i915), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	xe_mmio_read32(to_gt(i915), reg);
>>  }
>>
>>  static inline void
>> -intel_de_write(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
>> +intel_de_write(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 val)
>>  {
>> -	xe_mmio_write32(to_gt(i915), reg.reg, val);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	xe_mmio_write32(to_gt(i915), reg, val);
>>  }
>>
>>  static inline u32
>> -intel_de_rmw(struct drm_i915_private *i915, i915_reg_t reg, u32 clear, u32 set)
>> +intel_de_rmw(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 clear, u32 set)
>>  {
>> -	return xe_mmio_rmw32(to_gt(i915), reg.reg, clear, set);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_rmw32(to_gt(i915), reg, clear, set);
>>  }
>>
>>  static inline int
>> -intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
>> +intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t i915_reg,
>>  			   u32 mask, u32 value, unsigned int timeout)
>>  {
>> -	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
>> -			      false);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
>> +			      timeout * USEC_PER_MSEC, NULL, false);
>>  }
>>
>>  static inline int
>> -intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t reg,
>> +intel_de_wait_for_register_fw(struct drm_i915_private *i915, i915_reg_t i915_reg,
>>  			      u32 mask, u32 value, unsigned int timeout)
>>  {
>> -	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask, timeout * USEC_PER_MSEC, NULL,
>> -			      false);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
>> +			      timeout * USEC_PER_MSEC, NULL, false);
>>  }
>>
>>  static inline int
>> -__intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t reg,
>> +__intel_de_wait_for_register(struct drm_i915_private *i915, i915_reg_t i915_reg,
>>  			     u32 mask, u32 value,
>>  			     unsigned int fast_timeout_us,
>>  			     unsigned int slow_timeout_ms, u32 *out_value)
>>  {
>> -	return xe_mmio_wait32(to_gt(i915), reg.reg, value, mask,
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_wait32(to_gt(i915), reg, value, mask,
>>  			      fast_timeout_us + 1000 * slow_timeout_ms,
>>  			      out_value, false);
>>  }
>>
>>  static inline int
>> -intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t reg,
>> +intel_de_wait_for_set(struct drm_i915_private *i915, i915_reg_t i915_reg,
>>  		      u32 mask, unsigned int timeout)
>>  {
>> -	return intel_de_wait_for_register(i915, reg, mask, mask, timeout);
>> +	return intel_de_wait_for_register(i915, i915_reg, mask, mask, timeout);
>>  }
>>
>>  static inline int
>> -intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
>> +intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t i915_reg,
>>  			u32 mask, unsigned int timeout)
>>  {
>> -	return intel_de_wait_for_register(i915, reg, mask, 0, timeout);
>> +	return intel_de_wait_for_register(i915, i915_reg, mask, 0, timeout);
>>  }
>>
>>  /*
>> @@ -98,19 +114,23 @@ intel_de_wait_for_clear(struct drm_i915_private *i915, i915_reg_t reg,
>>   * a more localised lock guarding all access to that bank of registers.
>>   */
>>  static inline u32
>> -intel_de_read_fw(struct drm_i915_private *i915, i915_reg_t reg)
>> +intel_de_read_fw(struct drm_i915_private *i915, i915_reg_t i915_reg)
>>  {
>> -	return xe_mmio_read32(to_gt(i915), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_read32(to_gt(i915), reg);
>>  }
>>
>>  static inline void
>> -intel_de_write_fw(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
>> +intel_de_write_fw(struct drm_i915_private *i915, i915_reg_t i915_reg, u32 val)
>>  {
>> -	xe_mmio_write32(to_gt(i915), reg.reg, val);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	xe_mmio_write32(to_gt(i915), reg, val);
>>  }
>>
>>  static inline void
>> -intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
>> +intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t i915_reg)
>>  {
>>  	/*
>>  	 * Not implemented, requires lock on all reads/writes.
>> @@ -120,15 +140,20 @@ intel_de_write_samevalue(struct drm_i915_private *i915, i915_reg_t reg)
>>  }
>>
>>  static inline u32
>> -intel_de_read_notrace(struct drm_i915_private *i915, i915_reg_t reg)
>> +intel_de_read_notrace(struct drm_i915_private *i915, i915_reg_t i915_reg)
>>  {
>> -	return xe_mmio_read32(to_gt(i915), reg.reg);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	return xe_mmio_read32(to_gt(i915), reg);
>>  }
>>
>>  static inline void
>> -intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t reg, u32 val)
>> +intel_de_write_notrace(struct drm_i915_private *i915, i915_reg_t i915_reg,
>> +		       u32 val)
>>  {
>> -	xe_mmio_write32(to_gt(i915), reg.reg, val);
>> +	struct xe_reg reg = XE_REG(i915_mmio_reg_offset(i915_reg));
>> +
>> +	xe_mmio_write32(to_gt(i915), reg, val);
>>  }
>>
>>  static inline int
>> --
>> 2.40.1
>>
