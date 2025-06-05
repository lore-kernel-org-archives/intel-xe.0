Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4CAC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 21:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1703310E9BD;
	Thu,  5 Jun 2025 21:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/Fu9cAV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9031D10E996
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 21:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749158120; x=1780694120;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=McYLGS9+2uh75ttI8Bka7di35dLQrPx1lw8bdS9K1YE=;
 b=n/Fu9cAVBEzCUGDeMXBo4r1Xk4tisJkIcjUO1pIUMNLfZNE3rvQcvgrf
 cPOgCTzV4KmkX8WhRRhdLgPD5bA7c4DsIaRyojTUpmCE0x8fHxJ4TVlKc
 s9lA9JAGL96ONWZhKYskBa+39jiBh221UtKKvOBPfzSb0aUQJzPeXXa8P
 xCgVkoqV3NtjmYj/MmsO++8EFQtNV5KRfFkr2sKywLgkfQvVugrMqiWP7
 pznIe+il9sAFJXCnEFaWhpoP3xFdkf8hJRy7zoPBo6qL/4WLk3Oyapeng
 WjPM+bq87yNkFBQawG9yYcCJ8D3Q0bdS6fb4w4yMZpFtcaowi6XTG8LlR w==;
X-CSE-ConnectionGUID: +WgMGMR/TDWLObKLnF/RYA==
X-CSE-MsgGUID: A72rlligTUetFi2GZxPytw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55106250"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="55106250"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 14:15:18 -0700
X-CSE-ConnectionGUID: 66DAh61RQxmF7S/W8711xQ==
X-CSE-MsgGUID: tP5+BKhpTr+ok43KHeeFfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="146613832"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 14:15:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 14:15:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 14:15:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 14:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUvwwV4/andjoNrXku7y6T4vdKYAjd1NmHMkAdEZ4HjEf2oUsLvEln2A6hFG1IPGPxHyXU+9AeNCsl0EUMHX8q9k+ousFh12RXcOhFrx2OjfUG1OqZxlV2t9hdAsisED7uAUtm810Vyy9zZ+C1joxbAiSf1IFFEOhIcGCfgYSSoRgcjEgEh9u+uC7+BJlpb3gth67UOBzEruv/EEq5zRx5nR9+cJrBDzhjjQhKYinmdDuQEOiRCyDNe2FnmnonbTevrgR7/IktOLbRGQaSYXAgChaG4yYP/7d/416A9mhAhHH0uIPHFRF2yoG62tf+B1aueTBtgLDL60TJZqL/qSqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z17t7QQV8pLlCJQFU1fakO8zpTX5E1P/D1uLc6mqWfw=;
 b=g0bV/C2cdxxFjzfSb8mNt/23bzDhkVe6uZfisbdVvG+2n3BhFT1YsmqfYlyJibGAkCF+hcpuhiUS8O3fhRF5Vu5mozweaQt6npvaPmRfT3mjMk/hNo7eq6D3cXJg8a/q8rP5/bNd4etNt6fW437INwGDLTo1zE79rjlxuQifmGvgJcNFHn1Vxx8GlTqU0hVBgepWqgU1TI5wKd874MEe4hWaLd2epRZ7ZvjwUBGgHdUQooiag5MDt3YnjcV3E9wwbVcxfb1vqPgKDeA066WoQgbBB6OAyyZIMcQaOQ8SvjpY/tn2QqMqUEPDHR8E0Avr2EUQBTexLkihY3ypTo5I9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 21:14:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 21:14:45 +0000
Date: Thu, 5 Jun 2025 16:14:42 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove IOSF_MBI select.
Message-ID: <hp6a5nfdi22wpogdz6i6mz32twkz5ljrq4qwl43ylte3l324md@xnh6hewrvq4i>
References: <20250605074644.71036-1-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250605074644.71036-1-dev@lankhorst.se>
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2b7deb-73ac-427e-9591-08dda475feca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nBgP5XkRrfiYrMECWiLmDmSWYVOdrrmN1gjoqBFZhJM2rMtSTZ/xzddi4+kj?=
 =?us-ascii?Q?Nm+Losl9mXRkxfK2/jQfaeoBXZmSxEOrn7Gt/tMUHsxRbVgTNYzRgZ4/aHjq?=
 =?us-ascii?Q?4Qzz4wJTpR4DiZvMW1UqdsqP60sUzCDKK1/oocEhFtvWla0F588xn2Q1qgeT?=
 =?us-ascii?Q?Cxg/f7MWnCQIstNHm8AMI5QwyEmYToh0CuNCNIqr2AOcrqOlG3pjcGIqM0F+?=
 =?us-ascii?Q?++ddm0Zs+VQWkyAOAQfcRp3YSyIJlezDLgKKg/9ilwKeRl7WrbBt/0DJEuoq?=
 =?us-ascii?Q?lVFgF3yO2YQFJekz/rYhqa8/3qgKilyjgvuKml9K03ipHHACWJKXqLdpH0OC?=
 =?us-ascii?Q?AJ8xF1p3hTHsv2PasAVz8Vy5nH3MIuYUL/1gl+DeWb5C9rN9Ufh6u8VCyaCX?=
 =?us-ascii?Q?Nsswlvt0wzqwYEue3qI3qs5F3FTmseEseMyq0YHGgNurxTjloeQqPZCTRxf3?=
 =?us-ascii?Q?xjfcD5PVSMHPlgIb843yKKs9dB+n6FRNfAFkS9vy0RLlqJ9QB+QWZAjUon2t?=
 =?us-ascii?Q?nLuav1VnDY6emEV8gyCeBKyiIoSijz4oxZX/uCB5L0jLrTbaA3qh31wnL71W?=
 =?us-ascii?Q?k7Mg/7LItOPmKcrQ/uOn3Q///1X+Mb9XSuR/QOBhnkJAYEAmPpEY8Tlw4/tM?=
 =?us-ascii?Q?n2RyaO7R81Kn/ZQFFoQZhuy3k0wAcwvdIcGR33u0pjTayIhOFRjx5eqASTfj?=
 =?us-ascii?Q?T+0UbgTWYZMHqgDP6EO9JnA21pgnsQ/wZ303zDnU/uYrmkmIP98gC2rxG4MF?=
 =?us-ascii?Q?IGba2KSuKtATJKBZ5uYjiZhCZEk0WuF2usmfrnA87TCKtFNkntPJmuLFkKvl?=
 =?us-ascii?Q?Sx0X+QKL2n/y1owkmIRc7toveeovhd4sb47287NMllVKdV5ZnzZZ8WxuR9p/?=
 =?us-ascii?Q?5M1d12sYJsEUq5qIWrKYkNLmLjKK82T5NFM4EbwQkNpWijrW73zgV87TywWv?=
 =?us-ascii?Q?C/D2K9r6ror3yBRV2kod2sb6jpaYKrQ0rx8I2lSNV2WIW0dGgSEX1IcMPhxC?=
 =?us-ascii?Q?Cx6jui6UlFlgFTrP59h0htdxXUaxlPCVAB2UeK/Ap50yW28Q0eQouSmQJO0D?=
 =?us-ascii?Q?8GJiOXn46PukPqFgj14p6VjECbxB7ftFUR6cJs5pFdkt/Sa6IYy4z0CIey9p?=
 =?us-ascii?Q?PUOmgaoTs+R7eF54Y5mX/ojsgEZNeOIU1FUCa/hFXMw7gwJ+PcQoh/jzFMp3?=
 =?us-ascii?Q?tynZ+h3zow86JdmiKzYlM58gak/77YZ6xJvsbrT7qqlNpw8HiVctIlJp9iuf?=
 =?us-ascii?Q?mtWR7NwSZZo06QYOEFn4C2PJ9cL7Vu3SXPTWjnu4NBiYZJAWmSKNou62wjQ2?=
 =?us-ascii?Q?WKe0cVSNwE2S9TsBUNyTN7SlO41A9P+qyZg1f08Wc9fGgU4mFz2MoCuBHNB4?=
 =?us-ascii?Q?oj9IQesY5EDg3UzmM8QTzwKzWGLiEJc3jYeHLw3hzLZL41KONrg37xYkxTck?=
 =?us-ascii?Q?ZF1cAx6w1/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5sM+X/9knswLgOoLtQ/qJ0zz5RNQscrQR5Z34JGRn6ycMCH5i5CV4N3sxk0V?=
 =?us-ascii?Q?+Utk/98rtgAqOnXkPopMzQrSnyEMm8vDZy2At5jMRx+WEO5zFShWXf8J7xIy?=
 =?us-ascii?Q?Wj+aRKfkV93hHSx5tc4wzE5jWO1gCsb1P667pya7QYGdZ0cLBZTot6YVmRk3?=
 =?us-ascii?Q?zg+lxGyzbWX36iKyLfvh7+3mN15ZW1ICkiEQXhjfoBW0UYP3zZMibkuUeijV?=
 =?us-ascii?Q?kCi5Lw+tztXr1KEWvaOH+saJlUo++WvR6R1SPI9GwAkrme34V0LQCKOtJrtG?=
 =?us-ascii?Q?sdlcrhcOKxZVaH1gJpdWDUucr25+E1x4LOG2HXKRiH8oF182Fql6ToTNOb4C?=
 =?us-ascii?Q?uxuoSqybHi7Bg46dTwJQ85p+RssQyaAocE3vj0QdmgDOxnANQCJ73TCnRUpF?=
 =?us-ascii?Q?V62k2Ukg2rNvaMQfvtHXmpOH0Nb9pmcj+d6irJpnmCyNJ0VShPH5CrE1zWrK?=
 =?us-ascii?Q?U34Nwpurqf6yAZ98CCrEO5dCAUeR7eQeCcPeylocZaZY3i4kwTpm5IAfjpru?=
 =?us-ascii?Q?PncaDJUZQzRbzXVOiLnqydzVqEH4uQayf1t35RjJGAg0QzUSn6hAQAHvCajY?=
 =?us-ascii?Q?p9o/p1ivDM4mADUZ80IVfn/N0Du7hRGpw2zIegE9FSnP08wrT7lRGeAhvjgf?=
 =?us-ascii?Q?BgrHFBwSuXnQpkof7XpMqfKA1KiOftSoR5k1hGI+qhahQSC8/g6WSDCjB2fM?=
 =?us-ascii?Q?MHqueC2tFnut4F5x9BB8lrWX3roed4HtVdlwlqcvsJcDyNh47Oa4dSfQaOLM?=
 =?us-ascii?Q?t8ozk1x2lTmqtZcyDBP4ssTekkFVnstmxgLENjK4tWbfIYKcLTz9UHXWy0tf?=
 =?us-ascii?Q?6u8nvXqWAMi0ekyLKS5sC1j/+NsR9d+sD0rz3P805socBef26BsxmqVMz9E3?=
 =?us-ascii?Q?M3XCJCKbu0nSsrhh8UYcbVxdwtzUOB7lTIYD3Not0x8Wjp8gkcK/RmnKBvkj?=
 =?us-ascii?Q?2K2hqX53XQ2BKHWyhNS1CLGHOfD1hbVTy8KIa9741crIcd2Uk1p2wBNo7DkK?=
 =?us-ascii?Q?uP3yNLSaqWCHEnivBVVTONt13WqPVI9dEaqJL5n2Dlh3OzrKIUBwcROXtP9J?=
 =?us-ascii?Q?MlrlTDiqwyrLBkYnkEyIKxEKSOIdkaMcZtJj9UthvTKkMNdVOhSQPpeyDL2I?=
 =?us-ascii?Q?fZL4bnrJNRb4j84FWXchLTcygHd007r/twnkGUa0jLTZnk/3VAkACoQv3TAI?=
 =?us-ascii?Q?UFI3EQ3cVKQ5ob/MpeNGxZuaucCWGeIzAtNQPA8h7/83M4CaNoGizmi0wws1?=
 =?us-ascii?Q?pope0EWbpbJ6sEjqZq/Y6G9iDhoAePcNIVL27Zj+jSNWsJzLr56NJLY+uCzW?=
 =?us-ascii?Q?VY//cQe3CJ4BY+Hse5+PNm8GztGdyv2Vzl4xPDx6Mn1HmVah/DwWfscx1AQB?=
 =?us-ascii?Q?6/SLjY1Sg+jncdxQy1CERAfiNSha/7auKmmOBQED6TX1fMJ9t3kBEKei7UIe?=
 =?us-ascii?Q?lTQtLF6zNcAlUycHOw09DOMN+dj77HwvEHpqPlbXo+8ql24ldauN+9qxzETD?=
 =?us-ascii?Q?Cad8dQ7mZWSZCguMTZJdSlxNnNkXhsZ6fjugaRK7MF0iVLqg336jKUmknCxA?=
 =?us-ascii?Q?TeDmYZhk2qj56q9TX1qGYAkygJIbsmWC8auKMYzTWhqJQRjvsTDOotEgg5Ut?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2b7deb-73ac-427e-9591-08dda475feca
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 21:14:45.1282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JVHCb8tmMtJJzTNVK2xxL3w+ulMstaLXAleiQgVg5/wkUeWbKmhoXziY/lal1DxiVR+C2vUudB8xNvWRHlNRisAqF3o3SZ6BTALNJoRg2Ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
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

On Thu, Jun 05, 2025 at 09:46:44AM +0200, Maarten Lankhorst wrote:
>IOSF_MBI was only useful for some gen8 platforms, which were never
>supported by Xe. Presumably needed for display at one point, but display
>is fixed to put stubs in compat-i915-headers/vlv_sideban.h.

did you mean compat-i915-headers/vlv_iosf_sb.h?

other than that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>---
> drivers/gpu/drm/xe/Kconfig | 1 -
> 1 file changed, 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>index 9bce047901b22..9a3bca3ed7d82 100644
>--- a/drivers/gpu/drm/xe/Kconfig
>+++ b/drivers/gpu/drm/xe/Kconfig
>@@ -30,7 +30,6 @@ config DRM_XE
> 	select X86_PLATFORM_DEVICES if X86 && ACPI
> 	select ACPI_WMI if X86 && ACPI
> 	select SYNC_FILE
>-	select IOSF_MBI
> 	select CRC32
> 	select SND_HDA_I915 if SND_HDA_CORE
> 	select CEC_CORE if CEC_NOTIFIER
>-- 
>2.49.0
>
