Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A622C48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 05:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AD510E620;
	Wed, 21 Feb 2024 05:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UxsOxBSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA32910E620
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 05:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708495032; x=1740031032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5T/TvWIbpHxS4gCF4vAaSPTHbYUqLI3Nz8gsicn5oHg=;
 b=UxsOxBSaW2XZd68F4+IY2r2omTO6E4mx3cNXg8CZALQiN9ZW4a/SNXzR
 t/U/LKdP3Dw/LyX8P7mAPBHKNwc8yuulY/SfUywxAdgUdBdxiL6dyV1dj
 Agl7jz0PbgKRiTUYxrE1WUluyQ1QpyOPfvdAcEZ5GQhpACW5iNUCU/fBs
 tEZzk7bhFkqfwYsM3vf1hsjt0Q8FTaLjFohgKev/Hr0COD1X8hxeMC5yM
 Oekn6kaaHu3s875xMTouDgGLKTzVYWoAMhpZDtCNMIwIGHcgb860UWAdG
 oTkrnk4cAhlqrG+UFebciB9gqROlyMQLft7obOa+NIYwh4WucCmv2EEOG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2774116"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2774116"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 21:57:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4982284"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 21:57:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 21:57:10 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 21:57:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 21:57:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 21:57:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=id4hi9kmROodkLpMGTTjsfCFGmBBuIhIjiDHFTdZDg0PPVfEX6BP0MJmI3gZTZpvxotxixnbee10jmEMoJT2DLtPKOdM0j//KUClS4GqG67/WQxatWZRAN1JWIUJWoai4Uaqqbu9eyD7gXoymlGevpWrH6IDO94HYVocwqlzxX/sSVEgWhNrvrCyMPKJVegnNbBO/XDoHtKRiZRb0FxoAp8ISlbGTYfxIs0VUJHZbxo+dh7vVnuKENm84okvJFq0DV6wZ2ql5btXhFEnQaj/2qBf71gFHef+pS1ToypY7vFHKLnTw7wOu2pwFJ/Rep1iM6yg17uElqUodbk3AnzWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mx2RyOiSIGLyWz4PWnEB9jo8Pflig5FclGVzjhDhGIU=;
 b=Qp2YCMqX9cqOdHQRRcPF+ZxGLZ3wbo1Dr7b1YzjKCB288J0hZVzq9H7m/C7YLdENsvZggufkjwAr6L53nhqHD+3ywg8khArNUMvKwP60tcW0MC4wsNkehp0lvOrb5B0CU2UhrizadIJosDLHJPZnEyzluS1ixAwuxVktTKoAkT2akCGfErefSDD3Sx5hBB+T/GNFkZaO1DiEIcvyK8vtttG99pQVurtdsJvUu2WNJHsWferWm8PceiJj3j58dfsB78NZAD6P4yGl7x7vbMD4TOoL6YDkt8mp0KKIta3WJCwi5Btor/G9xuiZdjuChA9pYq/ovIrKcMSYjh1kS/EcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Wed, 21 Feb
 2024 05:57:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 05:57:08 +0000
Date: Tue, 20 Feb 2024 23:57:01 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ohad Sharabi <osharabi@habana.ai>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: skip register UC debugfs if UC disabled
Message-ID: <lnatfbxxrwwb44mttxtwkfrpumd65c2vvbp3pxtjpjqv7almtf@n36d2cxfcjwj>
References: <20240104100557.1204296-1-osharabi@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240104100557.1204296-1-osharabi@habana.ai>
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6f66b9-428e-4983-6805-08dc32a1f067
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJuqD0rI1p2Fqv6pak4rj14UYrj972p28+kdW0BNxz9o7u/t1k6K9NS4iPsxpRxa4RkvirW37b+TcaizYZckBXXdiHszSaI4zUzP/1/xvY+TvwvVp5zMqk0dtk+3NneoyJimqDb8DI0mrkt/Rr94kJrPGItH16w3UqS0fK35l0JIRsrz6MtzTTs25/jQnqIcvFBpMfVucs5wLNeoi65JOz0HoSf5+42CCSen4E0Wxx7AnlMGtVQ1YQ7AD/G66eGoOxoT+TEkXHahJRvEDhfw9O1SC+rwoTfEhyTgSquXF0OnYXBv3ajvpfPXmpHy1amRtpA0Q4NDJC7YhYQ3GrAOBotCVgLOhTYWIzqE5tPwV7pq7HLrCM0Hmz7dPyu4XDAbQJ8XCh36QQVkA7lbgulobkBMVvW7VUV3coL9aQWRlq45BdOhvOqA0PcKfpzcHqjWjBxwqK2U9qaFsrxf+ad24JozmDHJmvSFsAvcPnv8wNKR7OoHldtR/ljPJ2Sjzq9/09wBaWZu6thu/c/PK6xv7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x18KpFLIeafwgJNz2kMxRlw/6AMKH18X52FkQKGl54VX/2ITl7IESS315LAh?=
 =?us-ascii?Q?LjPFbdpDsK8gVwFmMHaub+Szf/f6jbdC9PjKkaFcf5ITG9/IgwA4h5aEhmxm?=
 =?us-ascii?Q?czHBHthdaP3KNRw5I4h0Ozahd54i2V7QY5JvEmjEerUFQ0VT7mqR04S+8Nc6?=
 =?us-ascii?Q?UnFApnDLApQmvJBBI9wS1oidxwRL13D2gr7Y/ut5VE7Ro82zs15//+Lc9+35?=
 =?us-ascii?Q?GCODJqYClKWHOw894MPOIdQJoHj5UXB3mgxRjY+DG/yHfgkAOsDIkcXTtLB8?=
 =?us-ascii?Q?h89J32ryinc8V+11jMmAGtc0yEp6m3KnTPBaufPbMh2w+Zmr5fINe0KZwY0Z?=
 =?us-ascii?Q?Qr4TOgMu3sCVE2+iz7kW6p0ZQBFCHNvFBzoG6TG+JjRudoCTu7SWjM6D/0xh?=
 =?us-ascii?Q?XO4D280OFlohEdmyJ4824Mo6+58iI4JOwba2a+oQ1ldxWr+3hrAb3mB8ViZ3?=
 =?us-ascii?Q?hk4WAzj9EQ15SiKA72d1ikZg06/hbiN8ZUBkl/NdCo370e5qNOH1CNUDYidr?=
 =?us-ascii?Q?D+s914K2lBnLnr1Npfw2ytuB7ZqTdthOeJT/3AqdHsPf/hICbcU0+LLn6BOp?=
 =?us-ascii?Q?DrRoLlT+EG66N42OU4bfBaXMFjoo/zBYgZPQNwSFuIwasB3aZiE81ZAxJlqL?=
 =?us-ascii?Q?+x0ephgHvM+e8o2YF5U4YWWadSTZiME+/GINxmGpNh/Bet6BKLs7K3LIj2R7?=
 =?us-ascii?Q?ILGDoNcASQh4HibF2WU02fNMNb23nJPcs/JUoKYuu5GlLZl+xqbUkE0glatF?=
 =?us-ascii?Q?7WDKC3owZsPwtXpOpUcArjBIFlGHFBuyeeXYtEvGnClBwlkrtHrQhJneXexa?=
 =?us-ascii?Q?JoNKl+tTZDF/d8oG73fAW/asNCT2FLOT42Hx8AKXAhZVzhXJ+ImeD8hMu/iA?=
 =?us-ascii?Q?zH+kDgj7lvfEeaK9wc5p6hrVZABa5wzGXKBOTy5OSQWQXJKBska9BWmIoGBh?=
 =?us-ascii?Q?2kj9Ek6LOb5Hkb7mmM8qA4Ro0dUvkoSn+IGEPzzJth8qM7EeCYbcdDOjxFCy?=
 =?us-ascii?Q?UotT8prEarQtNkBXP4CvrLcSZrjDVrtbwqd5mEUil5HHJOVCRtYdjDFcDCiD?=
 =?us-ascii?Q?E5a05Uy9lnhoSHHpwDDZ3OcPEXko8foamYTtzUfSzcmObRcHdvEY3BXF5tA3?=
 =?us-ascii?Q?em57N0XGV9OQMywBsHYEOwbdowb/W5nmWKCTU8Cb92OT6ib/olRef+QOXOcZ?=
 =?us-ascii?Q?s9VRTVnKpN3aYoYtQ+GokdIZGovRb9jGz5xQj7XFnfCqNKqTN6MozP4Ceea4?=
 =?us-ascii?Q?5voKr6wfiTaVyHtpGBTiBCr5TEL09hpX3ZIijFEhTGN30H9b4AQ7+6NGABLq?=
 =?us-ascii?Q?uLutroRUmmU1t4uADxUTj0nk9G1kNxffLaG2Y9wTZLyGUWQIND5Ns1Ssf/wo?=
 =?us-ascii?Q?UegTtolMbkW7MB/kIRjwb82GcMbSHkIawfaUxdUkave17LOfhXNQLu9+7Zkc?=
 =?us-ascii?Q?LDT4GROkedDKvnb3wbW48bTDcHPhuiDDx+o+Wop08NSHMXUCvas6nMA0L8Bw?=
 =?us-ascii?Q?QHHekTaaytMVF8Q727JaQIxbLiVBpsAs9sUK+HBvPlGN5mUsfCtLQaq/TrRi?=
 =?us-ascii?Q?yAQtA4qPY2E81K9G/e+530OQ4DGrXKO9KTik+QF1gh54lNb8uVNN2oqd5HGL?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6f66b9-428e-4983-6805-08dc32a1f067
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 05:57:08.5721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo1KHnDafX6ts1jRZk7T7PLf4X1NbmKlrSJdwUNZdkh/CViOhzi6TQYEgHBc5jqG0Egv6CgbV9FngTqTClScfCINTRWSMwcaWlZZsCe4JPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
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

On Thu, Jan 04, 2024 at 12:05:57PM +0200, Ohad Sharabi wrote:
>When working with execlist we should not register the UC debugfs entries.
>
>Accessing those entries when UC is disabled can lead to a kernel crush
>(NULL pointer dereference).
>
>Signed-off-by: Ohad Sharabi <osharabi@habana.ai>

it seems this never got applied. I don't think this is the only problem
with trying to use execlist, is it? Do you have a more complete patch
series with all the changes required to make execlist useful?

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index c4b67cf09f8f..bafd55a7fb16 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -245,5 +245,6 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> 				 ARRAY_SIZE(debugfs_list),
> 				 root, minor);
>
>-	xe_uc_debugfs_register(&gt->uc, root);
>+	if (xe_device_uc_enabled(xe))
>+		xe_uc_debugfs_register(&gt->uc, root);
> }
>-- 
>2.34.1
>
