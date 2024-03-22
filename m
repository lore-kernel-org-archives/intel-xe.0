Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FF0C54E71
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 18:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88FF112591;
	Fri, 22 Mar 2024 18:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsNQ/ibg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA79112591
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711132102; x=1742668102;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ghn0NzHCvzxqprg9Vpr9sqNxwIcJZ1yU46ha7ShtId4=;
 b=jsNQ/ibgUgXZWmo/+4m+RN14LCmOiFOba3LYOBJcUpuq5QQzqy+URr4p
 ad01FiYHBJPGYCh1U0Bk9SqcCrbHIQHpkcxhj02A/u7scv0spGoBs4ev0
 Q+hSBuEjDLM/amz0JLq4MJUj5u+7vxJ+TO8IgehXAF0DIILBEUd+1m6YP
 EByX+Yu+hGSSphv3l66yBIcFDOwa6vtUnHOIBQlffIhFR/cxX8jeI4vxC
 1BVxlgYnzBRZ7g8nH4B3m+6FxLaRl4+pcGk+BixxcfJH3p7fGqBWBXgpq
 lGAZSqR6myo7cez+zNwe+8N7c6MThoQETLr+U4wsRZEhDkRjRCayeslcZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="31633320"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="31633320"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15093300"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 11:28:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:28:21 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:28:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 11:28:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 11:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoE7k8rLeVaZ+Cxj7D+893zY5gp9PrrTLZDbxl/vbQgnw0L+LdBihtJZYlns7vevLC6vfoDQd1/Wz0VHKMDXMTC9gyzr0P3Jm8wcoXdxIlY25ZhmrLQPRj4R2a4axFSGMoPdwNgbQG8uqv7p3YAOSg0l0ooXrGagmefX1IFwWP4R5Vgb52SD+ELwO59aUgma2G4Aj9mrFZnWTzmftZxAJXmLDDEa31YQQ50l8D/cFvnaKaOoY1KRxjtUjCd2InhwaMdqT/mJsZGPa9BkRVR3rqvejbf6Qqp+dw01xkOGtA30EaBoUG0/6kVmpwNOnJT5D23ZJ6kRmcIrfdIk7Uk67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ghn0NzHCvzxqprg9Vpr9sqNxwIcJZ1yU46ha7ShtId4=;
 b=GtmU/bz/XQuZBgeOJ+KKSA+sWg3GCJ8l++ZVACATweHD6/hAffdhh8Vntl5lo+xm0iL2lcRjMbX9QyRQbYrKkXHvYTZczIUSl0NY1BsJ6njsls73wF7jur0ENgk5pK8evLSVJsP154RztyuDSdKpgCIWEBT/GBFx3oMwf1TzCdzlIVbrTc/kKGGd3Pyc0JmSQrB0AdIBtaU9AqnP1NgtYptnkqT0P0ipViTHLbOeSDFCjic84RhhleI1Z0Shma+g92U7TUxtWfejWwc4FPhkmCdSqEwHjFgKS4gJaDHUpaEbgdNR58/B6hWvkBVwYylvdqxiRK4zYumYeRK5LwdS9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.24; Fri, 22 Mar 2024 18:28:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 18:28:18 +0000
Date: Fri, 22 Mar 2024 13:28:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix END redefinition
Message-ID: <7cafamgg57kgvfgt3hofjevwnwpgkz2oyx3o6g4jdhfsqnmbdt@al7hkz2as4ms>
References: <20240322145037.196548-1-lucas.demarchi@intel.com>
 <87msqqjoek.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87msqqjoek.fsf@intel.com>
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 02abda16-f1eb-43b3-3b8c-08dc4a9dd8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTS2anOW8WSp5SgAqyhQnU3kbMosD6FRAHfjjQDBjeBqjFarqwd4IOIMQNLHJP1/YQ8rD3yHreg5EOjOuS70t+aQzZj9AsK6TMPRnlotaS21bWi4kAbPLC3N1E38krJ1O1g1OUjTVEkDr9v9bQOzum1iw1RkeQpAZN1QM9NQ12OQqVGqmEZor6VTWFz7xbvdHnATwhL/13EZCtNFrW09HEW8YHE0BRDRxeRAch4Ep8hN2+8AuWImmDQ4alJHXEjXR5GiBBPi7ci1BsDOIKtZaAgCfCdHtIVW1jfqadWzS4kJSXhBrss5P723cV14wBzgQag+wFOFkm7LJO/Cmpj19X0+dsca8678XgR99IP7T/LvRwuBHkE3Ev0Hn48S7rukxhT7GtOWm2fofV8QWVIESXBzrswrtY2kELwZrEnh03FE/sdyLEgF7ogCjk00WxyL0edp+Ht1oIF8NsugE3xv5fj/fPsmC/+EeSdrlEPU9qxsGQjbVT7F6wJKwpqC0M1wt7KETIH8OeJyyXdfy1tfKmvuyiKVy4bHT/BJ2dy1+Z0tVCQjQ0eV5ZI4APbkpQkLMKUZsySJn4whBwba730LEksi/HJ/FbIEElwfdx4F85Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ghX6X0zZTN75eqMVRJHRTFGxN3mXRBZaGRcCpwkX1aq/r4VgzIOVeX6AVFhR?=
 =?us-ascii?Q?Snu4mheUyUTR6CTdpYyZuNtkznLWHqKXfT3xSjXH0KcidXhOFrA7IQuB0SNV?=
 =?us-ascii?Q?0SOJBC4V5PtOgFwEaJR8sBsn1IdhvexzMoQbErBfelMtQPrs16I6Fiek/7bK?=
 =?us-ascii?Q?fiymsvHq7DraSW2SAiBUXIZNM6PSOXszu0lgNBJo9QYm+2PkhUZenj81pIbO?=
 =?us-ascii?Q?oedEPA/wZzWdaa2iJLmf1Kp4j2WJ2+fskzEYZQT1/oSR1FoQ3IvRpJ0//L2S?=
 =?us-ascii?Q?zuFL7uh723NaAoLatY83Ye2CTdvJAPpPDDnERfCX4+N/xfnkFlab6LYufy8R?=
 =?us-ascii?Q?CWLLWEWQXHy+1k9Dt/qx/4X0f2LuyiI9/tUJpC2BJpfM+xT6Uvz/um55Nbs8?=
 =?us-ascii?Q?cs453TEJbFilYd2gQYU+O0tQQDGOg/IiEsrL2pZeEtb+Rik/WDS6DoROTPV/?=
 =?us-ascii?Q?PygnUwco4glmisb0CN+Kg088HN+7SA78OCGtYNrXVDWpmRcIuOY8uE2DcKy+?=
 =?us-ascii?Q?IEwhMw7lIN8nmoB1CDHlkTNL+tbMVO2wE1ttQMe/D2SUe40HjwD7zv86bWUN?=
 =?us-ascii?Q?TjfYcEJ5brK5twlRSfsjoyCIf30Qi/7IJE3w1NzLYIeblYmVF/RcqKvaMG//?=
 =?us-ascii?Q?8w3FY7q5ednsWabrE6fSGBswl3JmQGy7YXGzvKooZCJtsqbKaIky/I9wCjre?=
 =?us-ascii?Q?Y9Jgh0fTzzrXfnmpXDtufyMu9P1oF7zwzkPsQxUQt4B1LtFZshVDv4n/gqA+?=
 =?us-ascii?Q?gZ9ExlS5sFPIIaxN32bryj/eL2vb1+1VNK5aNI3eJK6qkpsknPYv6yWvxPKX?=
 =?us-ascii?Q?9PXS+n+X/PPBiLDW5DtRyfBai/eXg9xSUpTRm5ActXINoLnpN4Qhotz2D+Gl?=
 =?us-ascii?Q?xzqUlN2HVFV6QiX0t0ib5mhdsQPbcpXuvsetgHlLBvhZ+II8svE8ydXI6vsQ?=
 =?us-ascii?Q?7Os3KcTsC1TvGj8/KnUXQtkwtMOIqj20vYPFlEWM7Ah7PM9fWVuW2/tZRJDx?=
 =?us-ascii?Q?GXhiJ93p+a4kuvAW9QtVb8kpf3lMueI/urcFyEdAyqPCNUCqLACtmIS8x3Ea?=
 =?us-ascii?Q?7hHSG41UM6rYUnXQqpGVDIB+0JeYIFYfwnpuF5WmSpTiqqpx+GHA8T1NH6lg?=
 =?us-ascii?Q?FW9bekEdT+tv0bDysbM+SpT1VSJ+VKnSQ0e5tD3MWLh3DWgxOhbFankqdKz7?=
 =?us-ascii?Q?VJo4uv1+vJkDjf2knzi/jEynXZ2EQm6Aau0fwxOQrTHW+8QWflzOxIUpKQsY?=
 =?us-ascii?Q?SPFf9cHgmzmaaKtIPHRD95B0KArELg7vXDPeQOBlwMPvrKdSpoJzADr51MCr?=
 =?us-ascii?Q?BXxMJVkbMvnOWnouglHmlJ87O4HvmJHAwHrXKGQ3O6TFuniBU+A50REsolnA?=
 =?us-ascii?Q?wN2cZEuc5t/wRhqSspQ3Y0qU34H8YirYuOndLW8tnbcr+yGAyBoTzqGTEZ3G?=
 =?us-ascii?Q?uAD77+fKzMcveIO6cODIlbFoYy75NChp2KfinrxqRrFkrCuwIbh4/6YdnYyK?=
 =?us-ascii?Q?X2xZfhftaSj0r3g1SQLAc2loWjvuHBEGUejC17yj3XCPoh1lKTwBkM9D1jyC?=
 =?us-ascii?Q?Mv7RJJjjQX7ewJb7MnhaP/vTGNqL+/k7u82LaWKWCXqewfyDg/oC+8l/JD9T?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02abda16-f1eb-43b3-3b8c-08dc4a9dd8aa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 18:28:18.6399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oB9sb7Nrgycz7JShfN+XJGo+8Dwn5GGWLoR1fd+r1xP3rKJ2Km6tZDm7djW3iZXLxCcVgehzFo+khe9VXRzOXKowHyvIo7IJJLOWS+K0S8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
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

On Fri, Mar 22, 2024 at 05:07:31PM +0200, Jani Nikula wrote:
>On Fri, 22 Mar 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> mips declares an END macro in its headers so it can't be used without
>> namespace in a driver like xe.
>>
>> Instead of coming up with a longer name, just remove the macro and
>> replace its use with 0 since it's still clear what that means:
>> set_offsets() was already using that implicitly when checking the data
>> variable.
>>
>> Closes: http://kisskb.ellerman.id.au/kisskb/buildresult/15143996/
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Jani Nikula <jani.nikula@intel.com>


applied to drm-xe-next, thanks.

Lucas De Marchi
