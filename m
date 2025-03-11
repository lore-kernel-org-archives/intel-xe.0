Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152BEC282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 21:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE88110E282;
	Tue, 11 Mar 2025 21:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkmLh6pb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFB810E282
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 21:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741727392; x=1773263392;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1w4o4U+EKnMZo4do4zs2inLiueHzwsbmK6FzYNLavnM=;
 b=EkmLh6pbj8jndxOBG7hpyUKtYK0H9RPO/5Y+mYE5ol/KnNCp5DR+zWNJ
 wiJe9oyoTvcMWeB4sKir6W6JWDC0OID7T3wVFdOfxlQwIHEKCcj/Fhkss
 UHUmexrsOaIDhpGuLrhe5Ko3DSww/0n+lh9gPa1OriH4f/zzxJTd8OZHW
 NvR6ozAUNetXpmeS6xghdYikulWXAx855R7kC8O5G8KuvQ2m/UH30XjrJ
 HPUe7/NaBSuRCOwYaJa4NDjRakypKkAvkD2qB2qOr1Q7KIM+OUNz2emub
 fguLecr0qIwKglWq/DJWJ80Hb1W3x/7778QXfqLscOrJ1mFhLbSOi1k8B g==;
X-CSE-ConnectionGUID: quXNxwWnTW6icbAASw/8gA==
X-CSE-MsgGUID: U2DaepM4TGOSPGteMrmWYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42505997"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="42505997"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 14:09:51 -0700
X-CSE-ConnectionGUID: S6k9fTZkSPm/SxpWvBvpog==
X-CSE-MsgGUID: MdFNukK6RyGYoIRIXCEU0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="124609028"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 14:09:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 14:09:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 14:09:50 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 14:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkeUGXim4vpccoTuhxDVjBNcGytrUaWOKj4ONUUf4UVGk4tXqwbjJS8FgYL4GJCH2H9RZemDJh/xbWPQa2W8tH2WGwVvil/N8Qpe+HgvAZ2Ujn+/6VTogm/ceYC4POpASrbRqq8iQhlXGHkv3Mz2XOkodQ1Vw4yFUyNkusV/7MsOiFTVACcRtIuE6NcLvBjkQeiikfr+Doc51Ynub4vHn87xmtyntSUESqqg1PaJEwk0thVghNLW+nOBWCiQ4+25HG2ps07iyGj9iCWHrDNGgm2ih2NiOYK5FW2CSHnh/8BPrarGuVMd+NBTCzMvmWDfw2yQB0UXSnmOFqOLcYEEnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olqwVj9/ohqY8EIGX9X81fp7KssfzBxDqaj2Y8fV81M=;
 b=I+cc6dqJ31zUwoIwP9Ow/B+VaxqXoOMXOC2PQtKFtSTZ9qbs98zEa3Dg6NJg5k19GlSIvEEc7fDidg/LkYJCRNNnnH/gLRVg+BxFUD3oC23BcSUFAoGegFpPUjmU+ZtvQJzqnADxEvr1rC4iQxe67XkCKSuqHzgZziZJH9HAiyMSvyk7/uWjP/L6cJT3IF/wNjHwlx4o6rFQI1yf9t/QR1SxnyKGD9py1Rg0k9eb3a9tND2WdTbGVQ47usHYXa1ihybwi72ATevvbxJbO2GsmPyPW8pDAH81Yu5DwnVMTwr7gU/bQ74SPrS3GPj/xe7mSR+cwH7/ihP3x8LbQN+6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5302.namprd11.prod.outlook.com (2603:10b6:208:312::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 21:09:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 21:09:47 +0000
Date: Tue, 11 Mar 2025 16:09:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: intel-xe <intel-xe@lists.freedesktop.org>, Francois Dugast
 <francois.dugast@intel.com>, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Move survivability back to xe
Message-ID: <d5o2j2fff2ntlmzq43marpyx3r3uec3cyarxjhlq72e64xxydl@gmudrfgn7xhm>
References: <20250311-fix-survivability-v2-0-729ce081155e@intel.com>
 <20250311-fix-survivability-v2-1-729ce081155e@intel.com>
 <Z9CjNDYFg40wqT5l@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z9CjNDYFg40wqT5l@intel.com>
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5302:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9831be-e901-44a4-f1b0-08dd60e10da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JHIOFzDMoHOBC3EoN/iVKC579KDEezpZaBpHvmwocaJ1YHWQELvmzecvQrje?=
 =?us-ascii?Q?rZMEYmJqZC+rjdwllvCWhjj/xAoKQq9VJO08ohNq2PVjSsfceuIjvDBWDSTa?=
 =?us-ascii?Q?FQTmSXCIFz/n2uaX1+v8fTDPhsoSJUrkrLN4w7oXScG9S8A2ZMSwhw6Vz2dI?=
 =?us-ascii?Q?lHKQTIbwqW/5um4/5Nl0efpRyzmY4C66s1sKMN8w11aIOd0bT3NjfZsXSU7s?=
 =?us-ascii?Q?JPlj2F9HO9tNLOlXqdwOG8g8u63RuWBCI9r+8fgh/geLdlgexIFYzjv82602?=
 =?us-ascii?Q?VLsm5Rf0eLeq1FInahIiKmkiUp6HDosmzfhsjfzwE9JCum5hUEb9FdaK7fIu?=
 =?us-ascii?Q?cbEZ1o0Twg/28aJpp2i3h54X6EszrqDMkh1hJW1H+jpLYKq7LiPMTn4UMJq+?=
 =?us-ascii?Q?C8JptSyuY9NCZYEHIGAslSFxPx1/da9HB6dI4y19dhoNz2n1gNq/maixJwRA?=
 =?us-ascii?Q?FWrbGov+xqkiEcLnhb1TW1W/lXzmAqNhR9Tjl5MfzeazhlYdAZKY9TS3iIaW?=
 =?us-ascii?Q?6qX/MfAymYfQamwAnDiH9hC5WkZInoqTILAYoG4jU0ASVkf8Idvn19Sq0Oh+?=
 =?us-ascii?Q?4zoQH2kZZ3tgGgi472xnH9XC0aV+cuf/kEAN/UVziMB3+8fvVhjKsqda7ONP?=
 =?us-ascii?Q?Cja8L10Pqu8DQ8w/7W0D9nNajzm+y1IRY0ySa2kC1nNad4Lsz0zHl43QESb5?=
 =?us-ascii?Q?j+O14wcGy1CAqH+17WNpFzXh8oI9HACrfBff6PB/OnYFbNW7G1DYqlY1jMFF?=
 =?us-ascii?Q?M0/rNQZXguKMz9IQ7tjgpBFWyvggqcOFXKkHJJOlTkOdcR0x8dCHEei3hXbv?=
 =?us-ascii?Q?0I6T+PvZco6BLgZPxiEY7yQhrJHrPkQK/+TaTNQciNolrzLoEpp9q+mG3Vdt?=
 =?us-ascii?Q?0h9Mfb5YCWveNYoHROJAv5GrlV1pIOP72yjdi2liM8V6txNzwqf5ro/1yyU9?=
 =?us-ascii?Q?Qv0LJ7dR/IW8bVfIdIgMfUYZHtDZhFvWre2FEjnCF5al2k3aNjH+tZ82V0lk?=
 =?us-ascii?Q?JyhAOeFFmYPZsH6DkjURIsPfsn0rTOQZZhuwhg4+h60WBq602AE14gYqDxXc?=
 =?us-ascii?Q?t3AKxm+A/RHdI6CJBn1pFBaqBWjDdl+xe0mjxNJkRcgGn7psIYIHwNvQcQAQ?=
 =?us-ascii?Q?H/Kdv7aBTlvniUR1bBvFZ63rOo49Iyl8iCFc1YBV4zyyQUDeDf6Wv30y3O6G?=
 =?us-ascii?Q?PX8AM1AM2AVJM+5D8UCG7a1oJBzbN/ufPzRxrZVN5c5wVSAU6m6agtMPPKBV?=
 =?us-ascii?Q?qJYdiI0lrdXZ0qKsLnXaL2EeJk48m3T6QwVgWdr2ZjgUNWKFE3W5W9YkeQpl?=
 =?us-ascii?Q?tPairBrMW/ZiIYUkqNCNZ11xlK+evSfLsMRhqGQAW2Kzckcf0yPp1s0gE9tn?=
 =?us-ascii?Q?9rzFsaUQeASpgoIaOBAUsvRQAUgn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eDxifMgGfMjJJsEuRX2tKHL0p9mlT9iGag+lRB2DWiQ/Gl+KPs+yH7Qi6bHk?=
 =?us-ascii?Q?wYFldp7/xIm+QvsykNDDS8J9OEMstrsFoZJP7IgLwCXMeayAB8+muIBmOY9g?=
 =?us-ascii?Q?iu72ZyeERsaMN0bjYL3rYCRdSg89k65sO4wEu2HUbohA6W/7lhFASVk65jMh?=
 =?us-ascii?Q?OMEZTyWzZUGSV68pA7rD7CGzz7ejsMqX9SEcmjdiO7uE5UtDiAppkOF9s2YA?=
 =?us-ascii?Q?pS2bJfyjBlUIdSAJBP4yb79rwJxlnKQLmr8K6aLsOuB/IwU4afMykAsTxiPE?=
 =?us-ascii?Q?HIJJAUjpZTV/WluiDUd4wBcZl1+o6iiHzHHhqQAI2ivVdwFtWHmIXYDq64fs?=
 =?us-ascii?Q?Tj568DkBSy2YzyrgLHbVV3Pyspd4ki1U33Irij9wNM3MEtjq7F6AxgwwDAD5?=
 =?us-ascii?Q?gVOJriwcch0JD90+lxJJvUvw2hm2cyZLv7cJSgnlhdPJloAGwIUeucZ4HApy?=
 =?us-ascii?Q?7oTnv2YxSLeUfluXtAXo79RbUd/XAKrExqPW9zjxVNJYbkEqX6ucXSiAf4MW?=
 =?us-ascii?Q?Rfd0NBw4Rv9nOCX1Ujnz+aemIMDmIDQPp2zijYEFkPqq476oPqPywKQsgine?=
 =?us-ascii?Q?IMo54fGZUxE0U+YbqJ3cDoUG2dPvS+0tlLzxDfeHu2hNYvkmmjRo6puH0PKC?=
 =?us-ascii?Q?iT//VQNUffaET6irF+aqVi4CpDkS/BBwysTH/E9w/bSaGkyo604S+HOCN8OV?=
 =?us-ascii?Q?ehh7hVfCEau7cOzN10WoG+eHYGQF0FMi4lKniGfnC9sUMhByCN2lCSzmjvQz?=
 =?us-ascii?Q?KXGaF7UY1B2Ck4E5r5NYGzoBrncW8XDDEmpEi5ni0+mZvCtWnL0a+kHuBE2f?=
 =?us-ascii?Q?iQF/9gUGMmUnuDAvj0T419nk/EP9EvuW6rad5qv74yDPvfraPnKOe++SRL/D?=
 =?us-ascii?Q?K39Br7qBStQR7b/bLv9/k5Fih3Xjlo29ZVOVqpV1h/qW4b62W9Yc+m6rZQc4?=
 =?us-ascii?Q?I8eZEVl/C+KZdWim3XO3ojBVsIhSsiNwUulJ9mTi9OamaeHDvpA2ig02V+ND?=
 =?us-ascii?Q?8tRl9lF52SIw4ppWB8o5Qlx53jbeR3sGkUx6B8H/z5RcdLrYFa2nZ6D8yhJ9?=
 =?us-ascii?Q?7Hy4n2xYSW/SfdrKiAxOoiXxKG7UjPHmjjAOjIwVrox7e2PG3+DGW45TDqjK?=
 =?us-ascii?Q?N0OoV0Jw+cWBh77AXsLACu4x1b7qGOl2BbHnLtasY/7b2G/0/PQPetRSEI8H?=
 =?us-ascii?Q?FYzCLvZ2ZMyGuaRR28Y4OuOceAf3BcCzI7qUowpvJjkCCfMpRFVklzW1TbQY?=
 =?us-ascii?Q?MbqtZUq4yUgDG+GbYm/nMAz/KAwLX71vS1Ta4YiMS5T4R5eZxw/Jp2vqojpg?=
 =?us-ascii?Q?YOszKUMk7zTAIB+LSdcv37Mp/pFJZ5KywIL/egjkbvh8LbfOLgjFZDfcfZz7?=
 =?us-ascii?Q?YvA7u5+schtsI204OS+Cl8WvnJ7EYJ4O40/3V1zF/BfVRXjz8LUXw3LuP3vG?=
 =?us-ascii?Q?w3OoZypxfh5zlaAYYcrB0HlWIWYmuA44B5OOdSVa3DEpZdaMi3aFGZMWnkYI?=
 =?us-ascii?Q?mpLcERZgpUfuycbrqCj9axrKFAZhZfOxmdFWsLJhWBmQyb4E/fqMzY+fnCXu?=
 =?us-ascii?Q?LYmlc2iHr2JBJ4KAq2nhmGYsHMsELDenH4B6otJ9BtMtdK7LrekystyJWYCP?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9831be-e901-44a4-f1b0-08dd60e10da1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 21:09:47.1002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWCluLXxUjtmJ3pxzJl6p95NO2t7qUh89GorZ1Q95IfRTxNAebfkJTPVHj2lIlxN5vftBt2ZVyLGItfIZPdL8/pnjZeuqK6gIOXZ/HtQazU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5302
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

On Tue, Mar 11, 2025 at 04:55:16PM -0400, Rodrigo Vivi wrote:
>On Tue, Mar 11, 2025 at 11:34:55AM -0700, Lucas De Marchi wrote:
>> Commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
>> moved the survivability handling to be done entirely in the xe_pci
>> layer. However there are some issues with that approach:
>>
>> 1) Survivability mode needs at least the mmio initialized, otherwise it
>>    can't really read a register to decide if it should enter that state
>> 2) SR-IOV mode should be initialized, otherwise it's not possible to
>>    check if it's VF
>>
>> Besides, as pointed by Riana the check for
>> xe_survivability_mode_enable() was wrong in xe_pci_probe() since it's
>> not a bool return.
>>
>> Fix that by moving the initialization to be entirely in the xe_device
>> layer, with the correct dependencies handled. The xe_pci now only checks
>> for "is it enabled?", like it's doing in
>> xe_pci_suspend()/xe_pci_remove(), etc.
>>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c             | 14 +++++++++++++-
>>  drivers/gpu/drm/xe/xe_pci.c                | 16 +++++++---------
>>  drivers/gpu/drm/xe/xe_survivability_mode.c | 14 +++++++++-----
>>  3 files changed, 29 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 5d79b439dd625..023290e5be392 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -53,6 +53,7 @@
>>  #include "xe_pxp.h"
>>  #include "xe_query.h"
>>  #include "xe_shrinker.h"
>> +#include "xe_survivability_mode.h"
>>  #include "xe_sriov.h"
>>  #include "xe_tile.h"
>>  #include "xe_ttm_stolen_mgr.h"
>> @@ -705,8 +706,19 @@ int xe_device_probe_early(struct xe_device *xe)
>>  	sriov_update_device_info(xe);
>>
>>  	err = xe_pcode_probe_early(xe);
>> -	if (err)
>> +	if (err) {
>> +		int save_err = err;
>> +
>> +		/*
>> +		 * Try to leave device in survivability mode if device is
>> +		 * capable
>> +		 */
>> +		err = xe_survivability_mode_enable(xe);
>> +		if (!err || err == -ENOTRECOVERABLE)
>> +			return save_err;
>> +
>>  		return err;
>> +	}
>>
>>  	err = wait_for_lmem_ready(xe);
>
>I'm not 100% sure if we can skip this...
>Before this patch if lmem_ready failed we would also check for the
>survivability bit...

which was not the case before the breakage in
commit d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci").
This restores that behavior, without the odd split of "init in the inner
layer (xe_device) / enable in the outer layer (xe_pci)".

>
>>  	if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 4d982a5a4ffd9..6fea3091e2348 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -808,16 +808,14 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		return err;
>>
>>  	err = xe_device_probe_early(xe);
>> -
>> -	/*
>> -	 * In Boot Survivability mode, no drm card is exposed and driver is
>> -	 * loaded with bare minimum to allow for firmware to be flashed through
>> -	 * mei. If early probe fails, check if survivability mode is flagged by
>> -	 * HW to be enabled. In that case enable it and return success.
>> -	 */
>>  	if (err) {
>> -		if (xe_survivability_mode_required(xe) &&
>> -		    xe_survivability_mode_enable(xe))
>> +		/*
>> +		 * In Boot Survivability mode, no drm card is exposed and driver
>> +		 * is loaded with bare minimum to allow for firmware to be
>> +		 * flashed through mei. If early probe failed, but it managed to
>> +		 * enable survivability mode, return success.
>> +		 */
>> +		if (xe_survivability_mode_is_enabled(xe))
>>  			return 0;
>>
>>  		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> index d939ce70e6fa8..153b8d598a270 100644
>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -178,15 +178,16 @@ bool xe_survivability_mode_is_enabled(struct xe_device *xe)
>>  	return xe->survivability.mode;
>>  }
>>
>> -/**
>> - * xe_survivability_mode_required - checks if survivability mode is required
>> +/*
>> + * xe_survivability_mode_capable - checks if it's possible to enable
>> + * survivability mode
>
>that bit doesn't indicate capabitility, but if mode is required by FW
>after identifying if something went wrong like done checks and lmem
>link trainings...

You are saying the HW **requires** to enter survivability mode and yet
there are multiple checks for "is the HW even capable of doing that" by
means of platform and IP version.  Combining all of them to me means
more a capability: platform supports it, and during initialization it
**signaled that capability** rather than required anything.

maybe neither capable() nor required()... but requested()?

>
>>   * @xe: xe device instance
>>   *
>> - * This function reads the boot status from Pcode
>> + * This function reads the boot status from Pcode.
>>   *
>> - * Return: true if boot status indicates failure, false otherwise
>> + * Return: true if boot status indicates failure, false otherwise.
>>   */
>> -bool xe_survivability_mode_required(struct xe_device *xe)
>> +static bool xe_survivability_mode_capable(struct xe_device *xe)
>>  {
>>  	struct xe_survivability *survivability = &xe->survivability;
>>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> @@ -216,6 +217,9 @@ int xe_survivability_mode_enable(struct xe_device *xe)
>>  	struct xe_survivability_info *info;
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>
>> +	if (!xe_survivability_mode_capable(xe))
>> +		return -ENOTRECOVERABLE;
>
>We might want to enter survivability regardless of that bit as well.
>With that configfs work that Riana is doing for instance, you set
>that, but you disregard if that was requested by PCODE in that
>'required' bit.

we'd add the check inside xe_survivability_mode_capable() to account for
that, still checking for platform. For my tests I was just doing a

	return .... || true;

in that function, to be replaced by the configfs check.

Lucas De Marchi

>
>> +
>>  	survivability->size = MAX_SCRATCH_MMIO;
>>
>>  	info = devm_kcalloc(xe->drm.dev, survivability->size, sizeof(*info),
>>
>> --
>> 2.48.1
>>
