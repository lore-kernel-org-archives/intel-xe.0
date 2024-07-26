Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC943C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 15:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DD110E9C8;
	Fri, 26 Jul 2024 15:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SG7sZ+Pr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289F210E9C8
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722007348; x=1753543348;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=i+v+1q9ljzOeY/6wAfHhwTnMM3tTSo5Zi8eaVosWTgU=;
 b=SG7sZ+PrgcV0FYGef0FnpwWLKvoqnTD4/AGcSs2R6VAl1dLOq0nH+YxV
 OxVppBr+ocdBEQQFMv7zoUON632f//lmmpfNiqWoBjXg3vHsF93F4Qkvt
 oDIS+V8YCYZvBWASWoT7yJ3X+QF4C53xL9m2cdY/0Pc7+gFHcuRR0Ny8f
 1aH9ZY5CpseD3DI8FBNPQqFvVfxfsv5gbL9ev8LvKy88fEhVPfQ35BH7U
 ZikQu4R8JYE1XvabiUsYeYKJfRFuISkHzhXjh7NUxpb1otNwLkp6tKtb0
 +6/Kb6YdDUKbAwWuHk/RaQAuWepnEgWkWJIgwGQdSvWUjPQuYfFnSZW9y Q==;
X-CSE-ConnectionGUID: SVN/Gr2RSEyFTSvh2jEIAA==
X-CSE-MsgGUID: KiKjRHLFQZeax9IWtsmVbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="31193514"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="31193514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 08:22:28 -0700
X-CSE-ConnectionGUID: xkkGAn3GSQG1EqmwMg2tXw==
X-CSE-MsgGUID: FEV+K3JjQOid3FdbLrkSaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="90758159"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 08:22:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 08:22:27 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 08:22:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 08:22:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 08:22:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RP9EQ0I+UwY4ft7HqCPMDfTjyMJHuazBcIZBkQTK7CB7Vwcgq8ikbz4xiKpbqzxKcRqrd0dBLdZhONp4iVXcdT7xQ6DwRzokbbr/JIzQr81nskhfkxwTHfiug9LRbtzkdroiNAORHonYPBMk55R6ojojLriGxSjZHOnYXnAJQYM0NoehkWfEkAPaRHSHByG+uXOGv0Zg98IxAXPP5IeWS284jnW6hpgteQdmtdXO3SyYqiPpU9XnL0wAzRnv5RITNXtPDrcEhzo/sfG2Yci2HCrTSe5n+Y10AzWf4O6HS+Wkzs5Fso4+pkrF5apdoxNh+2GGRNbN95xZWYzjHET/Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tjjmoa5CPTEaAVXTgSDGQD9VmVNSp0TLNUPEXhPrk8=;
 b=HfxEOuVlTPuoeIyh66wQBzn/++SFAXN+kD6k/uo3lPRCaJ0OOSYgxfvJ9aDanNUu9F9JnBk0vdbIM3LuJRfJJsbix8uwHoGeBM+brjckPy8rY2WE03yHC/v7XFHBljWyNHoObMgV/kR5vgCmDRmnkuQFoTfLUOUTCGpqY+TzXQxnlfO55HGrArtvm3Mm+GILGoRb+ZYK6hM5Udcd47cxel2QVJInj6ToKeXifV2XdX6L7JQIW5BtRWykLpqBKsa1ko0S2OaakUzUb8yWtaH2SGxomnN5AKGilhcbl/7F6d1CJiQFZKmiJTlgN7nHbqLHyuMlvLbEvDMFIK8CmJleMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6769.namprd11.prod.outlook.com (2603:10b6:510:1af::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 15:22:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 15:22:23 +0000
Date: Fri, 26 Jul 2024 10:22:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/7] drm/xe/kunit: Test WAs for BMG
Message-ID: <5nwjmhyvajzn753bv4opiwk4dsehkb63ocs3beh7h7rqq7na7t@fnf7c7o7ndf5>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-2-lucas.demarchi@intel.com>
 <172200620773.1586.16792563297272373730@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172200620773.1586.16792563297272373730@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:303:b5::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b9506e9-9ac5-4c7e-a49b-08dcad86bfc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xEt4Nqs0w+FNWHGJWLosPMPXVcPPFeTOn6ptjzpLcOSgLK3LcLFqSIKlX4bX?=
 =?us-ascii?Q?qWq2nvTR64kPIEQY/X7yqN9n0Ms5nbOiDdabEtKbA5iV3WWlyx9KzyHvTfD2?=
 =?us-ascii?Q?kkLez1hQubNxMVT4beA6pzyGLorfQX00Xms8Y3XCb7ysqiNdUoUTLvrCagnM?=
 =?us-ascii?Q?BfSiH+zNZOUe24JWFHq6gNot8ttgncdbdXFc7IIkSAsb8OEOZk5zwjP2+evp?=
 =?us-ascii?Q?gPFs9oC+9FVh5Sg3vejgGDfQoGxFppMeLcwP3pHdh1oI/FfL4R0d5kPWDV/q?=
 =?us-ascii?Q?aq5Due54e2i76i82sj5CS9M+5O3JCbvbbtsmpjKMfRnJQqUGLod5xPsm1UWk?=
 =?us-ascii?Q?DpkI53CgIP/S/jWrypIvgfJUEZce7jql3E7RIZUxu4FY3W4gXL3Uu2LENSre?=
 =?us-ascii?Q?HLeqWkGlM9L3pf9IwvHm8/N4Y/eQzD+9rNTYLA6uClMCfwXNTMBKlq1W4+og?=
 =?us-ascii?Q?AjRF/kcDhq8b2N7sODJAWVL7CtBYfEF6XkJEzfVnM6U8jAczQIUQyJQJTPlG?=
 =?us-ascii?Q?8FzHXRdtqSLx/AbP+tlo0nr0KKeZo8OfSzAPSDKxTC7UIlGdCq7r40vdGrcD?=
 =?us-ascii?Q?fbjVF7kAe3gTSJC8oTDIY2gIXI0M72LNcFxmIa0sYx//Wo+U0hBx2m/m8lNC?=
 =?us-ascii?Q?wj7dtVqy2aAAzDuGLG2FkPyuZWg+NjlxIlzfTeN5aOtn3BGZhePNNPIo4fN2?=
 =?us-ascii?Q?yLbOlSQUAuUvofH2DfUiSOx9mLFvC9Gh4QoShTJ7Q3UHxtCK/+M/pNoxmJJs?=
 =?us-ascii?Q?poRUDNBmGj5/ib3fGmp02iYygAcdwlJmdSNOnl0THai1pgaJld6K3PE0sHQO?=
 =?us-ascii?Q?oYwsbL/iTWIhKaIh29VY4cPgtk+oaYoFml7S0PD1odbp9mOD02y1VYpL/xRx?=
 =?us-ascii?Q?+3H7pdQekF35vuoEhnIdV9in/BJ21Ko3B2KaS+glabCR8Et2dB3BanWJt3pu?=
 =?us-ascii?Q?LVEU94BW8kt7EJ3p93Ke04+r14JJCsmLV9Djl3WIdSolF11mp/lZBGTpgk+V?=
 =?us-ascii?Q?KGXCsFYuuAoDIOVZuJUHhVUKzdpMdGPAKsPb0O73yZAyl2Sy5bmdltV5KtlY?=
 =?us-ascii?Q?f0TlH+BpPGaO3YyWfSP2huF2BMEgsVFY/2CuL8g2b7yxyq0WPND6ASFBw9uP?=
 =?us-ascii?Q?IxbZ92xP/Gc9S2B7BDg+NIR60ZP1oxt7x1da0EqxK5crenB8u/yljpajhtPH?=
 =?us-ascii?Q?peqylHwbqv3KsoP8jO21y97NPjRsWEll0zhLeCLxWdmBo//9c7ePb/gh2I28?=
 =?us-ascii?Q?PWw0uS2G6ZdRYtdfCVs7e0z06okOr4YX8su3xuoe+ZkySgWOyWFCBx3Fdzzh?=
 =?us-ascii?Q?Gqkb1oQmFVHAOku7sQ2nlkwnNYyS02Ns9njJSjbHoA8c7g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TJJBHMRJcUZuV6sCWuA4XEcOIF0t/3gKTAsceMbq3aXUgAtrP2vi5b2baPLS?=
 =?us-ascii?Q?rdkGcpMY61n6urOR8zqy4rdpKnI1KeOV0tO/uDtJV6800uVX6WBGEmkX2Zxi?=
 =?us-ascii?Q?9Nt4shPqURudsahxSuMtnSheLE7yBZpTw2cqTB5yS+2Kp/IxdNUT+ooyn+nD?=
 =?us-ascii?Q?e6MTYUY290pjUO6i1oDpUGl0TDIHJaXU2t2QNG8U/hrfvV/eRLqYQIxDtjVW?=
 =?us-ascii?Q?y0MZAFc9Cg1u7CvosC7TccNGDLssZHe1AHiI63lvoFGZeaXmMC1Ti7n75AlK?=
 =?us-ascii?Q?ov3p4qDDNJt1lkdFTmQuuDrTUDO9ILMcPMV4mvQwcgtEp9LOahFpWzTRJINv?=
 =?us-ascii?Q?BFCVTV2tPJgpEazJhAC6bWNTDUKepHjQVr2xBC8aoaR7LrDQbmE1KwIr6EaY?=
 =?us-ascii?Q?C26iH+Zx4Ptq/sAcEASp7uFTTei4gHHHBBJkUmf0lUq3kmIP45qSfpL5UfrN?=
 =?us-ascii?Q?D2H6E0Sl1aRWpEtHySE5xhDTZ90gB2me9V8WYEY7+RQwyGz22ir6VtYzVbJB?=
 =?us-ascii?Q?8LK+mN/yXUapaqvzeWgi+Ds1jP+DxGr2NQD9ewqgeSaZ/mRr4PTv5oCzGjA0?=
 =?us-ascii?Q?HOIWYcnYp8Ad9wzFqGY/Hhov3lECKuejaW6xkkt8RC2ayri6eo44uhsahExT?=
 =?us-ascii?Q?pOTMiPJiBE9yS9yj0vdPR75VD31W69Qtx+Lvb24AYAWPaWmH4uWXlQ8Wuo9O?=
 =?us-ascii?Q?FUQHT/2hpDTXFPsf90hKM5dZfELfVIbHi08tBz0IfCIQm77Ct1IDcsMHKA8e?=
 =?us-ascii?Q?N+ofQ9v3XTIYYKpej32UoyuS90iVvJneGgy6iL7QXOzc5A6NPcVSaryWr9Jd?=
 =?us-ascii?Q?/hAmmCRYNNVX7Aw7s5uyxb19E05Nzw7R1qqIDcf9a0yRLgkvSQSkSaYxnklf?=
 =?us-ascii?Q?5j+8fioC6Zgr54e91Dqd2MD9BJdC6KHLDXgLZwLW9+4BQGQ8my1tmUIKImwX?=
 =?us-ascii?Q?jvEkbEDf0Z9LySw2V+NtA8wTATukToYjvDhkd3DAH0QQ6FOP5qUn70i1qfxz?=
 =?us-ascii?Q?cnZlb99VrXz45cAYObqQf2Ef+YiYUG58V4C5yiRB5wkfMjkA/LMi+KlrUB3i?=
 =?us-ascii?Q?gcll8+kY4BdW18o10uWy2mZFsxajskrZ+dsXRMSoY8p8lOuZP4oVmLJSrYgt?=
 =?us-ascii?Q?6WlqhVCytmlPdLImXw1Zs9VPzPVTppTEJmIkAob2oP5qPNODHjdpuemuF/jT?=
 =?us-ascii?Q?DhnK++tYr3ycjDd4eR1goPdEs1NZux44XTKkxoG0hUHDaHB8JAwQctMMVMZx?=
 =?us-ascii?Q?ZXCSrzgpaFF1VQ56C4vrtQSZTWy32w8MNP+rbwIx8cL8q3wCikr9b4IrQAnO?=
 =?us-ascii?Q?ZBGfzyNauUaXLWosJcn3mbGePXqVNM3/HWW5J/rdcFsnCOCpLfOW+bnrYcfU?=
 =?us-ascii?Q?hoyJ47oO4Y+x1pdQY5akE7Mn8+FWiaKNjx/8ZuZhHx4UwgDWlgWje6a8T+Bu?=
 =?us-ascii?Q?53RQNp07K4L7KX+RyIT9h5Fql3pG32zy9zsyyo8iJFUEWco0FjyXUw/5x3XC?=
 =?us-ascii?Q?ZGtmCpVbz9V2sqKotyhyU9m/9ZXYwYb+Xr0KkbNHW6tom3VaRE2UU8RMpzoD?=
 =?us-ascii?Q?xmj1GVmIhcMpvSv5esQKF5CRgGX+3CrX4tUj2mB6YZbQHhdwlyUnwvNbniSb?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9506e9-9ac5-4c7e-a49b-08dcad86bfc8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 15:22:23.6183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1loOFE0szNsUvcb0Wbf8OseTlXFJBzept0/QFMth8Fh36JAcQbdWejNU3966s27aKg0Jve5a3YIap43vXZCKwitluM7dNtU542il/lOKPbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6769
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

On Fri, Jul 26, 2024 at 12:03:27PM GMT, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2024-07-26 03:43:31-03:00)
>>Add one variant for BMG to make sure the workarounds do not conflict.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
>> 1 file changed, 1 insertion(+)
>>
>>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>>index 9d0c715142b9..8d6a77fbc716 100644
>>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>>@@ -74,6 +74,7 @@ static const struct platform_test_case cases[] = {
>>         GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
>>         GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
>>         GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
>>+        GMDID_CASE(BATTLEMAGE, 2001, A0, 2000, A1),
>
>I think we should use 1301 for media version to be more accurate and
>actually match workarounds, right?

right... my bad reading the log and typing the numbers. I did look there
to get what was stepping used :-/. Should probably add the 2 important
lines to the commit message too. Currently in CI we have:

	xe 0000:03:00.0: [drm:xe_pci_probe [xe]] BATTLEMAGE  e20b:0000 dgfx:1 gfx:Xe2_LPG / Xe2_HPG (20.01) media:Xe2_LPM / Xe2_HPM (13.01) display:yes dma_m_s:46 tc:1 gscfi:0 cscfi:1
	xe 0000:03:00.0: [drm:xe_pci_probe [xe]] Stepping = (G:A0, M:A1, D:**, B:**)

thanks
Lucas De Marchi
