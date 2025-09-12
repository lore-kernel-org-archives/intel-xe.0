Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E322CCA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 05:30:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C8110E435;
	Fri, 12 Sep 2025 05:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMOrnIKh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A7210E435
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 05:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757655015; x=1789191015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EUFc41qwF8tq2rSxTJnjoXTBmBo95n87VsP2HARguZk=;
 b=KMOrnIKh5L7Pw+G8HSZ5RQY/yxdF3YWpe9seG3640doP/pItBS5BBId7
 A09u3QlUfAuYEtnLeaHrmbcJ20QeYZ3RsLseVNO4ZePnATKMrTbl1E92Y
 XwyFOfrey5A8g1YEH8zwf9IESt8ik6hGhC2SulP5/73e4tUsTzvHEeJb2
 dwmpLXx0/Qzx44T0brvgLt/hoN0CQDHUVAzzxhpUE+JmcN+4gBgX57sgU
 cRChON5HL367V45B9/qD9dbcB0mQApUjIH9h7KTs5pfU+vOsvP3VVBiUE
 CO3V+ZnA3ayWJ59t7kn5mGnuAfe7/0+mUPp3Q+XE33JQSlwnJX4XW11Zt A==;
X-CSE-ConnectionGUID: mndlEOUgROObEEafGGKO0g==
X-CSE-MsgGUID: xpvp0EVuRei7hOSxL+4M/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82586401"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82586401"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:30:15 -0700
X-CSE-ConnectionGUID: adR3KY/9TBq5wy0BHJlt8g==
X-CSE-MsgGUID: 5r8HFjvYT12rUVPZ7jUE+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; d="scan'208";a="204650561"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 22:30:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 22:30:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 22:30:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 22:30:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3jWufxZGb04NaigvtPMH2ckIM5K9BPNy4nBAom9oGvcJ2dLAPOnwcNo/tviSwWGzapoG5vpB8huo3gxVddO/Wg2oGA5xTnnAInZUG3ADeceOo6WriVil6TELjDXdIor9X9F0wesdkXYJfdwnQSfaxEdjRZX4nAsHkE30LGiEYJ2keFaNkYeCNpyrS9z32HJYLaw0T+aEz9yDPzsXpSunm+LdslPAELdEG2m4tttqBfGybvrrUD/run/iX3HXyj1NgWGOsefIEaHNxjLAKXDyto20PLA+apwQaQisTf0jtaDZodaJL3l2kw5DJRcnhfbwxaSZvaIPezlEWcZKwT7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKNTrMHZwv4WddG0YPLZw8gp+F3aY1gLGzbghZG3pCA=;
 b=w0RB7k1Yvxtmiz99GayZBXKWEe6MnMLhziwF3wDyj3CuXIzB9/UA36jq0fCn9bV4VAyPrpyO7hQM7BZtae/P05JNWli9JCjUGu8+qLo49WrN3vpKXfdQVzbQBqPSj7JU/ZrOGcHNQutZ8f7hL9zS5CpAY836o4KhJlm5FbDL0jTDQkGj8R+KBTk5bIpec6LWf8wkz8IaDwDmuzbVcASpk8O3XHS0K40wbN6mffHKdtWMhB85UXzsXjXpzKw6wtNqUcKzyYtdguZG+UM838InIW7JALLUWM/7PwxWN2KLeWSOiOsi5SLcfBCGENyVzk9A1xZ9JQNS4vR5GJye1WjfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB7148.namprd11.prod.outlook.com (2603:10b6:510:1ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 05:30:07 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 05:30:06 +0000
Date: Fri, 12 Sep 2025 00:30:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Umesh
 Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v4 4/6] drm/xe/configfs: Allow to select by class only
Message-ID: <dc5frrvi2wi6fbfd3mggumu3ohlbjohbifrxil4fzsy7pqxa75@zaofnmz5tea5>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-4-c8f7e48f7eae@intel.com>
 <aMOtLe6FIwy0X_JQ@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aMOtLe6FIwy0X_JQ@black.igk.intel.com>
X-ClientProxiedBy: BYAPR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::38) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a412cff-b7a1-4114-b64f-08ddf1bd6edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HH4JHKIPn0iNM+esYDFrQiyy/EF+OtS1cJ5HM3E+13cQLXskFMoQeeQPQ9X8?=
 =?us-ascii?Q?XMuLKnyT3cSeYse28jZsttVx1gnpS+sbJiqaN1EGFf7U4W02uE9Eqml1Vmm2?=
 =?us-ascii?Q?pQrcxD5W5X6EwfghN7xTfO/rHy3EouZUjArqY3Dnqln7DJKHmJjA7sjTpDWc?=
 =?us-ascii?Q?aY+ZnuWI3H5UBYU+np52dKCOeNfv9YU/1PFOquwLunIGvcClcHwQvXt9g5wU?=
 =?us-ascii?Q?gwMo5S+4GlO9sxzWFUFeFXnHbr75Ks0viV6Va/B1mJ5+7OfzJ8NVdnh0/O30?=
 =?us-ascii?Q?sQX/RPKxHYqZVqc8obLlUuuiKPNOax7Ge2ajBKO8+fTuPazKj6WXIWn0Mn9N?=
 =?us-ascii?Q?8k4gLFRRXLamLEmLfNsbSdIdAIpKhQb93dTEA7dz/077nYqlJRnB0S7q+Pj/?=
 =?us-ascii?Q?0CDAejfbIE2vSMgWsGxbOqcD+Pb5BjT2MMb/0gtf430SrfKxknZn16h1CcVs?=
 =?us-ascii?Q?f9iAe/TX6HCEjp+tO2j5b4+c3jnQ3DczIL1gg81B7HpZaDptLkxf8XDsMliw?=
 =?us-ascii?Q?I+ynqnKNkAbiOk/phvR79ZIjGmELbY+FRHsbxgTJ1L2C6eIGQ6FQeGwgmBUO?=
 =?us-ascii?Q?PSxRqoJbP+eQJ5bWQybai+GswW8D4Z+hAmN0i6F1z8zdOcCx+IkrTG5N+d9c?=
 =?us-ascii?Q?oatbsDKukhGhNZMahe0a3sWRkbd8E9GRmlPA8wabFN6/5h1inCSHioFfnOPE?=
 =?us-ascii?Q?0tXI9b6qxffSB4DASpxpqg3/uw7rZvlG+nCzHPmINolUWTz3CENZrZKndWuU?=
 =?us-ascii?Q?2CqKHJwW+s1nwGrmd2Gte2bgXd/oRRPde+r7HS5f5Yd9sNjpf1lvsz89vWvv?=
 =?us-ascii?Q?FltzfSJFWZLZk8qdpHom+NythJ1FCrzJNhfYgGMQOfAYaJbSXqbNLyhUUGZx?=
 =?us-ascii?Q?SL+s933JTzD6mPZyBvrWGHBhqZs9b32yQQQicLjGVRGGnUbCqj8/sijk10iu?=
 =?us-ascii?Q?O/zPnCzfun9ng1chnmJzYpJiBGo2q5mytqr7Ein2omGxTzxfBdcBcwkSfmBS?=
 =?us-ascii?Q?SE60dSidWo5YNtSBVuxolUAAsZDt0HN8X6d9weatmbcXMK+Qty9vQ3lpbTpb?=
 =?us-ascii?Q?DEUPBBu0yDETnPN1srHUge5fkW6FI0godKNsZASPkynv5dMsrdNreY1ZHCuX?=
 =?us-ascii?Q?cRuSJFBLYW0n5+244HtBNlGZ8mW71nQjBqnATom++4X4jM9KWWyYTrJCfjG3?=
 =?us-ascii?Q?5H/Grlj0O817nA/lI6U3Ar0pZOeFzfPEtij+Itb0sPls12iy15F3D5gJuVt+?=
 =?us-ascii?Q?HWEMIYB9J4aTSPsXDBZc6RRptTuYRUiGR2x2OD9cb18KFA/3RwcUtKKuyAZ0?=
 =?us-ascii?Q?JG51jdisV1wSMfuvBIXI8N62w8WlsBnOKglj3mIPFynJoHrgNpmF0+CJTx4O?=
 =?us-ascii?Q?15mEs/m0A0gpo7ng/aYdUhgqPgxxoYPQkMROrVpglpLWvn/6uOtawNDTsvRs?=
 =?us-ascii?Q?gucHsdHa0kE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zNG9As9SIJ9jMto+ZsUdWfQKKsiwHm8UzvrF7DVsEdlofWWjY86CVW4i/keN?=
 =?us-ascii?Q?IuyaA/vQjIKI5N/w3W0ZXdMcyx0QMB3nk4/RwR6c29deXPAvRfcTIasdpH4i?=
 =?us-ascii?Q?NqmA/RodJWDqlhXsDQPc4N8hR6e4r430H7STTN57CTIUmH3tfgOWo0oYejcO?=
 =?us-ascii?Q?RjCP80Zfd4p8iKQOdpfiTTXLlM95YYBkCpJjOqtAMtU4+j/5SiAO3ziNniey?=
 =?us-ascii?Q?NTxQh2ZY26tWBglrHQCdYKIMxWGdwcIJ3RL0jHghIlMJejdma8ZRYkAinYrA?=
 =?us-ascii?Q?vana/XeTrHKlydG6nqAVOh5/KeeDNYQEeWEavYUV1z4KHh0lsGj0alQ16qXf?=
 =?us-ascii?Q?bLeDf2SJgl9AOkTHIfJPajYuKNoDY/XlorX8Uf33mk0Y8P/8LLtjQT1h9eMm?=
 =?us-ascii?Q?3EtFRkD4NxpV/hxbhvFZ6sYF+XxpKbbdk4B3bw8mqhSeN0n93WNOJkPhLVb6?=
 =?us-ascii?Q?cqgeexaIVbLySpOSNK0/W1zNYOrjz0im379QW1pr/7/ZZ2vE3MVlxEliH3Qm?=
 =?us-ascii?Q?d/mAUmHOKuMYjXIIMFnMzVCXzU3XQ0/N+ga9Bv+xLFj8Qrs8saOR4C5SxyCb?=
 =?us-ascii?Q?VCrbt8YkWm++es+DYSEJG8a0odVxv4GdOaKULnd/BeHABYWrOzb4I9ZDohN9?=
 =?us-ascii?Q?67Kzx8PXJI/bcDNNDQSw9akw3A9Fqp6DjjoVCOlpnFg2IFubgQFiu95EKzdI?=
 =?us-ascii?Q?DShPMDm0lxCnxn8IkQ02FZ07SV91LuqwQOiJzDA/S1VXZqqdeGGNbpZuQEYN?=
 =?us-ascii?Q?iBmO7GKEZIyaBORLFBOwpCCGo7PcSZP2GpzcROwc4mLBziPbyKCCvXuKRKSF?=
 =?us-ascii?Q?ti39EegaeKRCGBzfW2B4gjueDkqO4k52ebyRQjF1FcQOHY3/S4cnfrJeeYBT?=
 =?us-ascii?Q?ORQwLkceKQRbMJ+GwPzA/xzzEf5JFFNfk20250PGfek8mxUqyq3kgLfplxBo?=
 =?us-ascii?Q?15REaZSD8e7hU/TOZDjhlIp2YLZlmmXaDw4d0P4/bl0Z3IKdq8kClqQiTz4h?=
 =?us-ascii?Q?eX+gK6D7Qocfuk30/+byIMUWGhbOMVl0psTYhGVJA3V2eCoOibuHBzN7dQ9o?=
 =?us-ascii?Q?RTxFIGCdwaNScadMq7XFbh7dq9+mt/SdmvgwCx0UrNT9CpvLRb1/xZVAEoO+?=
 =?us-ascii?Q?J0qV9hDfZvsbyxCMFoDgOaLledIyCABlD5QRRtGuy2SAplOuS5FI1aBKYQxx?=
 =?us-ascii?Q?vy/fJ4+WNK5V9D8GPIun2DHasaF0Qf69d7TJ93l4MK3vEKEvV6U0yVGtyTYs?=
 =?us-ascii?Q?3MS7o7X6DKo1TFVeTkCu99rN8pgnkIXvXEZ3Aqj/02HBr0qAFqKS7/2i/qa8?=
 =?us-ascii?Q?68SgOpeTiVY72fogKUhQ8u9ih1kwMF9k/xN1vZyq3GWFygPgft/ZHNIPDXmK?=
 =?us-ascii?Q?YHr3FbNCkvHdlyYrKl0G2X++9WOvfYCtVklVPHgoEDYXw6lH4+lhr2vI0MMI?=
 =?us-ascii?Q?cvvQT3xAuR1kwkGdvnFpLZ79kzfLq615Sb0f0LcEuTOl2oFA09PIhwyQhTZE?=
 =?us-ascii?Q?NVpSCAJmxwzmczskqajC5QiWR9hn/OLzJsOJ2L3Z7rWWns1B8UUkHT3IeZX2?=
 =?us-ascii?Q?G2LPRfOksf+K7a/fjbrXQpp6yvB5QZAZ4mwawgV22iPwQpR7rXikWWBdWEVx?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a412cff-b7a1-4114-b64f-08ddf1bd6edb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 05:30:06.8554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBA281q4A6SJMHTb+X1DpmSgbVewlHH0M17JA1qI2hCImczsTeNLyw7zWUWOBEodELpndhsON8/aCMAc6WYJvwo7Epy4NylmuK/Yg4Tc/IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7148
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

On Fri, Sep 12, 2025 at 07:18:37AM +0200, Raag Jadav wrote:
>On Thu, Sep 11, 2025 at 12:36:28PM -0700, Lucas De Marchi wrote:
>> For a future configfs attribute, it's desirable to select by engine mask
>> only as the instance doesn't make sense.
>>
>> Rename the function lookup_engine_mask() to lookup_engine_info() and
>> make it return the entry. This allows parse_engine() to still return an
>> item if the caller wants to allow parsing a class-only string like
>> "rcs", "bcs", "ccs", etc.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Reviewed-by: Raag Jadav <raag.jadav@intel.com>
>> ---
>> v2:
>> - Rename function to lookup_engine_info() and return the entry
>>   directly instead of the index (Raag Jadav)
>> - Add named initializer for new entry for consistency (Raag Jadav)
>> ---
>>  drivers/gpu/drm/xe/xe_configfs.c | 50 ++++++++++++++++++++++++++++------------
>>  1 file changed, 35 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 8db7a2af11011..45fdb6cf26b5d 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -152,6 +152,7 @@ static void set_device_defaults(struct xe_config_device *config)
>>  struct engine_info {
>>  	const char *cls;
>>  	u64 mask;
>> +	enum xe_engine_class engine_class;
>>  };
>>
>>  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
>> @@ -159,12 +160,12 @@ struct engine_info {
>>  #define MAX_ENGINE_INSTANCE_CHARS 2
>>
>>  static const struct engine_info engine_info[] = {
>> -	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>> -	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>> -	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>> -	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>> -	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>> -	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK },
>> +	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
>> +	{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK, .engine_class = XE_ENGINE_CLASS_COPY },
>> +	{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_DECODE },
>> +	{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK, .engine_class = XE_ENGINE_CLASS_VIDEO_ENHANCE },
>
>Hmm, so now checkpatch doesn't feel so good about this.
>I usually try to shorten the variable/macro names instead of wrapping,
>but I guess a few more lines in an already huge driver wouldn't be much
>noticeable ;)

it's a table and wrapping the line doesn't really improve readability.
In this case we should taked checkpatch output with a grain of salt

Lucas De Marchi

>
>Raag
>
>> +	{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK, .engine_class = XE_ENGINE_CLASS_COMPUTE },
>> +	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
>>  };
