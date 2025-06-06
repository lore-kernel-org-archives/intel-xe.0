Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B04C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 17:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC95310E154;
	Fri,  6 Jun 2025 17:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChjiTbDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BEA010E154
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 17:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749231492; x=1780767492;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hbk/yjSuLgSc5WLlQouUfKbOtKx+V+JI89wioz+FaNc=;
 b=ChjiTbDgm5yCWqWKLUSyC420KOXodhEEfCedx/iRSymffhYoqQwfroeF
 sTbZMPtpCeTeU1BC/GviL9CiYsowneLiYV0Yv4e3bnEBMT14vhGScE9jq
 LNxA0SW5EetSWwzQZatIalyJX78rqK52UhQbdZ7TOFHmTIHArVYimDZsQ
 KBk05MFXTn0T6fYIkssfYBHjYVLGBMvgKcms8xq03VKdnmsiXeezDBalk
 HziJdZA4qh0kTGdr2C0MDR90h16ImKvc+wqiHBQ/d0FgLdDjciljVgeHM
 yZoPs6zyZGU11fZf3gqtqxkZ0IRIs1lmsU+JeoJoaahaf675s35kJY9iH A==;
X-CSE-ConnectionGUID: 3SXZNoazSjWvfTcGMeYung==
X-CSE-MsgGUID: H/c8jYnOTgOZpDfBlQovmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="61655451"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="61655451"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:38:12 -0700
X-CSE-ConnectionGUID: MSOtnq7fQ0SabVXPOyQJIQ==
X-CSE-MsgGUID: ttNE1ExMQemM0d8cUnLFew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="176765899"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:38:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:38:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 10:38:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQNaZ5dhzIFpWBNL5gOLjlCLnPJLKbjidEH1NIyeQdBtn6sImg96UvBRRpYfsgg1hSbB2JlKUtqVu++Ww6GxgTf8h49otYCpR0hNvksJYoSjj67/FVmXqJmqpeA6qdZpqx/9MFT44qlMMgx7bE4M7tkAcuZYrhy8lP7TcUEnpEgRfKrOYCGnMd3ZZsMpPQcfoOVZzrRNnAIIVO6r8EUET6DvhYCYWSdeUwbhV56ERO3So05tbkaGtpZdW8puoi8u4ttTt1fXRVSMPPWQNtTzg/EIASEBFRHEnKLLWq+0GiLXAZ1+HVLqeTWHXZ6eO4w2h9VZidZKhp1d/U8tmqvnaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAWHLKzPihnN8MBd48/uoast+jkwyc4bp9oc0bFYXgg=;
 b=qXJO0iZwVAL1FkInzs8NSeMQoHMobQmPkzf5N5ts1vcmHmgmJNmze2yZPlofsMguYPdUy+8r11npFb50lbjCwJxKduwtXIs+nk8wU3xx+SxiAsX3vAbhFFVCivS7a2T4sbhyMlTXUqJkkqyIdU2G+Fu56CaZ1OC8WeTM8wKhy/jYi/rfJB8ZkZSnWq32omGBdkuimT8CfmUBnc9eKTSfWiP8Pej1kN9HAKYKDnDuFq/awwvm164pOtO27dU5pKVug82db69AAvHJgvU6ue2YOcCGcKOURKYLe9ykxSB1lmHwKIsi0kvio6MlAVG3KsS2KUm7w5fhpcZTN8n7Hj7/VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL4PR11MB8824.namprd11.prod.outlook.com (2603:10b6:208:5a7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 17:37:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Fri, 6 Jun 2025
 17:37:55 +0000
Date: Fri, 6 Jun 2025 10:37:53 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe/oa/uapi: Expose media OA units
Message-ID: <aEMncaSxBClc7A1G@unerlige-desk.amr.corp.intel.com>
References: <20250606160253.4054668-1-ashutosh.dixit@intel.com>
 <20250606160253.4054668-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250606160253.4054668-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0183.namprd05.prod.outlook.com
 (2603:10b6:a03:330::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL4PR11MB8824:EE_
X-MS-Office365-Filtering-Correlation-Id: 313e7e36-79c5-491e-6aab-08dda520de82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmlyUndWL0x1K2tGZTNHRU51WFhhY085aThndHFEMzZ5RGhDaSs4VUFucTA1?=
 =?utf-8?B?YzU5VUgwNTFTbnVFdjFsbGhOdjcxOC9jY3ZFV0JBNndaSHMwMkZmWCt5TUxR?=
 =?utf-8?B?Nm5mMStwY1YzeWxxWE1XUXppY3d6STF2T0Z1NkJUZmJTcGVhd2t4QUZRTUVm?=
 =?utf-8?B?Q2tic2huaGpVRXlDUjZwbFdYN2J6K1JTMVgvMldpTkY5MGxzQTR4dWtWbkEy?=
 =?utf-8?B?cUozN3N5a2hxOUJwd2IyeW5uRDFBWlZPVjlJNUxDTFl0K3laV2V5S0xQL2dL?=
 =?utf-8?B?WmtVWituYXVYbkFTQjQ3LzJVdVgvSkxFaW1YMG9UbGlrc0VJcHhuUFYvS3dj?=
 =?utf-8?B?SmtJbXFSOXgyaUpMZStsSEp2OWJRSmpMRGNOb2RvaXFVRTk3bXY1NE9DSmho?=
 =?utf-8?B?K054MDVQWnVWNHdIaUdybStLNGs5VWRGZlVHbHBidEVPV1BYSmI2eGVjd0RU?=
 =?utf-8?B?WW1aNUJjSllVeVZ4dWZTQUMzU1FXd3phdi9QYm5yUlk2TXhFT243NkpiOVRq?=
 =?utf-8?B?dmc5WEFlcDI3SVFQSE04VFZDbEJRMzBPNVFJaWRmOGdjZ1VpLzRuK3k4STg4?=
 =?utf-8?B?TG0xZDdDcElyNUZzZmZRSlc2blBWNVhGdWh5TTBzU3BuNENzVGdiVjRsVldM?=
 =?utf-8?B?Zi9vVzhNMHpkbkd6YXcrNDJQT0JLVjJwc1dtaTY2N3ROanV1SkhlWDBTS1FX?=
 =?utf-8?B?Qk9kK0VnRldNZkQzMGQ5TUJ4WmRVdVZ0VFE3SVcxckRjNGVCVEhqWWxpdlpV?=
 =?utf-8?B?RitVRHlta1hoR09Uc1h6cXpLZ09kSWdzZHkxZ0xqNE1sYVp1R2tVVWJqVTEy?=
 =?utf-8?B?TWlmcFdYOFJMcStkdG8wYmRESGwwQlkyQVIzWmczTlh0Ti9KWjFwNnlpamdJ?=
 =?utf-8?B?NGh2eGRtKzIvUGR2YlVlZS8xWGIyRWt5US8rUDBUQWlpWWk0dXY2cno1dE4y?=
 =?utf-8?B?RjJyVFI0MURhVnN5eERmcjBmUnpYbFNPSW44QzRXR29vNENMOVB6b3pKUGlM?=
 =?utf-8?B?RkZtZlQ2YTFnZGcrMHpJRFIxeFlBWVdqWUlRRHc5OGJ4MUoxd1dMdWNOekt5?=
 =?utf-8?B?dUlQcExGQ2ZwQUJEN1NkcWJkd0dzVDZBTDVSbXZhcmNkRzl4ekNxcHFaYUZH?=
 =?utf-8?B?dnhMSDhqWFl0d2wwWXhOQ3kySWRMMWo5WGhSMEQzZks4U1F4bU1tMkV1T3Ni?=
 =?utf-8?B?Y2dJdmF4YklVU29FWnlGTWZyMGRja3dHKzNxMGNyZWQ5c0xpOFdIRTh4U0Y0?=
 =?utf-8?B?ZThYNWxjQ2ZyUWV3Sk9hSnVJRklQN1hUZzZneU5QQXNIWndGWG5ZUFZXd0o5?=
 =?utf-8?B?T2Zyb3JERm5yYit5YUswVFN0ZFNxSTd6YnpOMjFwZEIrNUV0aDlIR3REdVgx?=
 =?utf-8?B?QlErUllOekRhV2tYVkl2NmdvYnVqdUVzMkZWa2NSS3BPT2s3ZGFMa0hrazBo?=
 =?utf-8?B?WWp3R2tnM055R29lNllRd2l5Tzk2MEM4Z2JEeWpycjZ0OFVMY0hDaVJ6My9a?=
 =?utf-8?B?NWdmeFlPdDBINElhUWZGcUUyQVJlVjY2bmZpdjMycEVhZC9tWGpuZE5rczNT?=
 =?utf-8?B?c2hzbzZWOXY0dkZGeTBUMHQ2UVg1RjdrL2I5cFJ2KzBoZi84aGpwWmdscWhr?=
 =?utf-8?B?aTJ5dkg0MHRpY3ZBaGZ6a1RFK2tWQXR5SCtpOSszR3NXekkyZ1Nha2VaMjVx?=
 =?utf-8?B?Z3cxVzVOeHJaV3BUK0lVOUlCbU5wcGxkU0RzaUJZTEljMDBST014bHJTY1lG?=
 =?utf-8?B?VUMxNmh0OTJNOWswNytZODRla0RvMEI3ZXJCTFZrWVRvampjWG5yb1JmNnJh?=
 =?utf-8?B?NnphSmwzVlBwV0MwOHh1QjB2aVRyT1FYL3A2bGNCcStYSlF4VnlqSG1YMHB3?=
 =?utf-8?B?eFVlZHlwMU5oQ0drWmVrZ0g5T2lVbzFzOUpKaGRBekROTzcxZFZOMERrL3gz?=
 =?utf-8?Q?hJKmgTNTDbQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUthSzFDYVBEYTJWM1JNWEIxZDFMdDRodVc3UElDSlgvcUVWcjhLaldHVU5E?=
 =?utf-8?B?T2R4b3g2SXZTUFdWemthQ0V0OEszNGtKZFZOUG53V2ZENWcxY253ZkVXdWpI?=
 =?utf-8?B?L1ViMDl0b0ZqVUV4VXl2Mk1XQ0U1U0dMYU5QbG1jVmVkbHhRN0pJR0p0MEFk?=
 =?utf-8?B?QTZIMURFa3A2K01PVGJRdENwclhUK25tQUpOVUs5OW1NeWNzYVE2RlFOR2ZD?=
 =?utf-8?B?UWUreXZGaExjVW1tYWlydmN2TEVDM2F0aU5kS2RKZUF5c3RaaFZPK1Jyb0Zu?=
 =?utf-8?B?akd5VzNaYTFZTC8yclE4WHowOVpEUGc5OTlFWjVtSWVPekdxVWVQUlFlK1hr?=
 =?utf-8?B?TE5vVXlkZUdUVG5KM0Z0aGtKSnFKYjdBaEhTMXoxUTAxcjAxa2hNRzR4NW1B?=
 =?utf-8?B?KzYyRHV3c2haQWE4aDZ4aVNSeENxUTJBbS9XUVpQM2VHNGppRktoa1Y3dDF6?=
 =?utf-8?B?d2ZnNWR5cDU5WlhBOVBMekJla3ZOekc0eDFiNjZwcEhRSGlPWi9RRTZIVklS?=
 =?utf-8?B?RXpxL21FWS9SR1gwYzMwYTdwZWxaS3pHeTdYbWlRQnJ4NjRXQlNYWVBlSXV2?=
 =?utf-8?B?bjRreUxDVjljTHB5bUNmU25JUVhqOWVLMVE3SjRoYjl4dk1BKzhDMEY5Szdz?=
 =?utf-8?B?Qlc0M0E5OFo2RHYyUkV2OTJOZkxJdVh5RVErM1N5YVlOL252bm8zS2o1bllu?=
 =?utf-8?B?RENnZnJYVG9FeHJ4ZWNZN1hoeUFtWHBheE9IdE8vWWljMHBSSVNxZzdxdlRD?=
 =?utf-8?B?a3ZQK29PRHVPaktMWkprajQrSFg2QjJyeW42REo3UmhWZkVTeDF4cU1NMzR3?=
 =?utf-8?B?bEhNbU9kdkVTRFpFbWx4S1BBbUNzaFB1T2xSdUlWT1BJWEFYb0pISzBETUZG?=
 =?utf-8?B?YTYrOUdDMU8zbTN2ZEwzR1FaTnpnUGU3UCswZnlrSFBDYUVtd2pNSE1yeDhP?=
 =?utf-8?B?ZEFVOFk5STlrWkFPNDc4YmtCVjZWVnA4SC9PTVB4dy9PY2s1TWZ4YWFRM05K?=
 =?utf-8?B?N2xrWkhlbjc5aXA5UHNLZGJaUk1PaGt3NzVFQ0xTS2VQZUpyR2JaUTNyN2Ur?=
 =?utf-8?B?azdqeFphc1ZQTWNZQ2FpdnhnUCtqMDB4dkZqWmNPN1FGdDYzNnpDVkdDamUx?=
 =?utf-8?B?eW1LdTI1NUZIeTZaRGpiQ21nbVdWS0JMK1JKQkhFQmRUOUNuU2krQTV4Z0lp?=
 =?utf-8?B?QXhXSG9MNVJIQ2JMZHNrTTNSVit2M2xoWWY5WC81RExVUm9pWDBCR0djb1d0?=
 =?utf-8?B?TzA1RHV3bDBlS1hnZ0toQjBKZmVPSVIzemdCaHhZZFFaNjlzTy9ZYkNjUlZa?=
 =?utf-8?B?bVFZZzFWMWc3cnhaUU9JMTZoaTJYaW5EZlRhd1RFTm54V0VxeG5pbmlxRXFw?=
 =?utf-8?B?aXZMc0Z4TXBDMmdYWnEzcWRlekRTdFdYSGNheVh6SFhMRnFUQWVNYnFDYzFP?=
 =?utf-8?B?NWFLUzAreWdiVlZQNTdqLzdaczJBMTI5MkxGNU1sWmdXUld3N1VKSTk2TWlX?=
 =?utf-8?B?TGIzSjhodm1CUTJrZW9sLzJQckRVclZSQldGbFFIbm5VRGpoaVBKczJtNkx3?=
 =?utf-8?B?djJGUTdMNFBTWk0zMkFqWE1nbUx5RUtUMmc5VmJBanlYQ3pkU1dqL3hFZkYy?=
 =?utf-8?B?RGdBdWpYbFFQSjFjTnU0UU9EbkdFZnJSS3ZDc21YdHpDbUhZK1I4TlErbys1?=
 =?utf-8?B?cEVpY2hyaWFLYi9BV1lIWERpMytIOTJsNy9YWllhR2ZXc3gyOTdpRUxPbEJW?=
 =?utf-8?B?cytDSlFMTkhvRlFtTmpMb3h0ajVWemhCamo3aDhWTVFnRHNrWmFPcGg5SDg5?=
 =?utf-8?B?VVU0emxlNkZhTS9PcTMvMysyN0xTTDFxdVZ1YUFpT3A5ZkQwWHcrcjhOeFh4?=
 =?utf-8?B?bDlZZ043b2xOa2gxNTNEbmVYV2ZjUkJtZSt1V2VQL0V6K0RUN2dEcXB3Y0xY?=
 =?utf-8?B?RlBhbVFTVXFOWU9IcDVQVWRjK0E1dlAybmhPODdrUVZ1UGZJdzhTRTN5UXI0?=
 =?utf-8?B?ZVZIQTRYZ3l4NklQMkkxQ1BvSTlEU0x3cm5wZ09CYlZJVzRKV0lYMlhHTHZH?=
 =?utf-8?B?eGtScGNhZ1FwalVRQm0wSE9iSVBVV2x2cEhoWjROR01aWmJFbW5sS1NXcVF0?=
 =?utf-8?B?S2xsdmJPamZ4Z1V0RXJTcko1NWhkMkFlc0FCZXFEMzFDZk1IMW9remQzdnFR?=
 =?utf-8?Q?cGDd4R0KwQxGqbZDM2FYPVk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 313e7e36-79c5-491e-6aab-08dda520de82
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:37:54.9108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXAc/VzR1swAx0d8V773+WxH+nPvr8PKW0jBgxG6JNCLX/UCW4q+3cUaWi0UKQgXoxlDV+scwrHs/oSXvINJuYyCgzvJxsg8/CYVz9KOz3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8824
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

On Fri, Jun 06, 2025 at 09:02:49AM -0700, Ashutosh Dixit wrote:
>On Xe2+ platforms, media engines are attached to "SCMI" OA media (OAM)
>units. One or more SCMI OAM units might be present on a platform. In
>addition there is another OAM unit for global events, called
>OAM-SAG. Performance metrics for media workloads can be obtained from these
>OAM units, similar to OAG.
>
>Expose these OAM units for userspace to use. OAM-SAG is exposed as an OA
>unit without any attached engines.
>
>Bspec: 70819, 67103, 63844, 72572, 74476, 61284
>
>v2: Fix xe_gt_WARN_ON in __hwe_oam_unit for < 12.7 platforms
>v3: Return XE_OA_UNIT_INVALID for < 12.7 to indicate no OAM units
>v4: Move xe_oa_print_oa_units() to separate patch
>v5: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c | 68 ++++++++++++++++++++++++++++----------
> include/uapi/drm/xe_drm.h  |  3 ++
> 2 files changed, 54 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index fb842fa0552e5..0de0d5a18df74 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -43,6 +43,12 @@
> #define DEFAULT_POLL_PERIOD_NS (NSEC_PER_SEC / DEFAULT_POLL_FREQUENCY_HZ)
> #define XE_OA_UNIT_INVALID U32_MAX
>
>+enum xe_oam_unit_type {
>+	XE_OAM_UNIT_SAG,
>+	XE_OAM_UNIT_SCMI_0,
>+	XE_OAM_UNIT_SCMI_1,
>+};
>+
> enum xe_oa_submit_deps {
> 	XE_OA_SUBMIT_NO_DEPS,
> 	XE_OA_SUBMIT_ADD_DEPS,
>@@ -1881,6 +1887,7 @@ static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
> 		return type == DRM_XE_OA_FMT_TYPE_OAG || type == DRM_XE_OA_FMT_TYPE_OAR ||
> 			type == DRM_XE_OA_FMT_TYPE_OAC || type == DRM_XE_OA_FMT_TYPE_PEC;
> 	case DRM_XE_OA_UNIT_TYPE_OAM:
>+	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
> 		return type == DRM_XE_OA_FMT_TYPE_OAM || type == DRM_XE_OA_FMT_TYPE_OAM_MPEC;
> 	default:
> 		return false;
>@@ -2448,20 +2455,38 @@ int xe_oa_register(struct xe_device *xe)
>
> static u32 num_oa_units_per_gt(struct xe_gt *gt)
> {
>-	return 1;
>+	if (!xe_gt_is_media_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
>+		return 1;
>+	else if (!IS_DGFX(gt_to_xe(gt)))
>+		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
>+	else
>+		return XE_OAM_UNIT_SCMI_1 + 1; /* SAG + SCMI_0 + SCMI_1 */
> }
>
> static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
> {
>-	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) >= 1270) {
>-		/*
>-		 * There's 1 SAMEDIA gt and 1 OAM per SAMEDIA gt. All media slices
>-		 * within the gt use the same OAM. All MTL/LNL SKUs list 1 SA MEDIA
>-		 */
>-		xe_gt_WARN_ON(hwe->gt, hwe->gt->info.type != XE_GT_TYPE_MEDIA);
>+	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) < 1270)
>+		return XE_OA_UNIT_INVALID;
>
>+	xe_gt_WARN_ON(hwe->gt, !xe_gt_is_media_type(hwe->gt));
>+
>+	if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20)
> 		return 0;
>-	}
>+	/*
>+	 * XE_OAM_UNIT_SAG has only GSCCS attached to it, but only on some platforms. Also
>+	 * GSCCS cannot be used to submit batches to program the OAM unit. Therefore we don't
>+	 * assign an OA unit to GSCCS. This means that XE_OAM_UNIT_SAG is exposed as an OA
>+	 * unit without attached engines. Fused off engines can also result in oa_unit's with
>+	 * num_engines == 0. OA streams can be opened on all OA units.
>+	 */
>+	else if (hwe->engine_id == XE_HW_ENGINE_GSCCS0)
>+		return XE_OA_UNIT_INVALID;
>+	else if (!IS_DGFX(gt_to_xe(hwe->gt)))
>+		return XE_OAM_UNIT_SCMI_0;
>+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_DECODE)
>+		return (hwe->instance / 2 & 0x1) + 1;
>+	else if (hwe->class == XE_ENGINE_CLASS_VIDEO_ENHANCE)
>+		return (hwe->instance & 0x1) + 1;
>
> 	return XE_OA_UNIT_INVALID;
> }
>@@ -2475,6 +2500,7 @@ static u32 __hwe_oa_unit(struct xe_hw_engine *hwe)
>
> 	case XE_ENGINE_CLASS_VIDEO_DECODE:
> 	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
>+	case XE_ENGINE_CLASS_OTHER:
> 		return __hwe_oam_unit(hwe);
>
> 	default:
>@@ -2514,18 +2540,25 @@ static struct xe_oa_regs __oag_regs(void)
>
> static void __xe_oa_init_oa_units(struct xe_gt *gt)
> {
>-	const u32 mtl_oa_base[] = { 0x13000 };
>+	/* Actual address is MEDIA_GT_GSI_OFFSET + oam_base_addr[i] */
>+	const u32 oam_base_addr[] = {
>+		[XE_OAM_UNIT_SAG]    = 0x13000,
>+		[XE_OAM_UNIT_SCMI_0] = 0x14000,
>+		[XE_OAM_UNIT_SCMI_1] = 0x14800,
>+	};
> 	int i, num_units = gt->oa.num_oa_units;
>
> 	for (i = 0; i < num_units; i++) {
> 		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
>
>-		if (gt->info.type != XE_GT_TYPE_MEDIA) {
>+		if (!xe_gt_is_media_type(gt)) {
> 			u->regs = __oag_regs();
> 			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
>-		} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270) {
>-			u->regs = __oam_regs(mtl_oa_base[i]);
>-			u->type = DRM_XE_OA_UNIT_TYPE_OAM;
>+		} else {
>+			xe_gt_assert(gt, GRAPHICS_VERx100(gt_to_xe(gt)) >= 1270);
>+			u->regs = __oam_regs(oam_base_addr[i]);
>+			u->type = i == XE_OAM_UNIT_SAG && GRAPHICS_VER(gt_to_xe(gt)) >= 20 ?
>+				DRM_XE_OA_UNIT_TYPE_OAM_SAG : DRM_XE_OA_UNIT_TYPE_OAM;
> 		}
>
> 		xe_mmio_write32(&gt->mmio, u->regs.oa_ctrl, 0);
>@@ -2560,10 +2593,6 @@ static int xe_oa_init_gt(struct xe_gt *gt)
> 		}
> 	}
>
>-	/*
>-	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
>-	 * will appear in OA unit query, but no OA streams can be opened on them.
>-	 */
> 	gt->oa.num_oa_units = num_oa_units;
> 	gt->oa.oa_unit = u;
>
>@@ -2579,6 +2608,11 @@ static int xe_oa_init_oa_units(struct xe_oa *oa)
> 	struct xe_gt *gt;
> 	int i, ret;
>
>+	/* Needed for OAM implementation here */
>+	BUILD_BUG_ON(XE_OAM_UNIT_SAG != 0);
>+	BUILD_BUG_ON(XE_OAM_UNIT_SCMI_0 != 1);
>+	BUILD_BUG_ON(XE_OAM_UNIT_SCMI_1 != 2);
>+
> 	for_each_gt(gt, oa->xe, i) {
> 		ret = xe_oa_init_gt(gt);
> 		if (ret)
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 6a702ba7817c3..5460ba1e4cc37 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1617,6 +1617,9 @@ enum drm_xe_oa_unit_type {
>
> 	/** @DRM_XE_OA_UNIT_TYPE_OAM: OAM OA unit */
> 	DRM_XE_OA_UNIT_TYPE_OAM,
>+
>+	/** @DRM_XE_OA_UNIT_TYPE_OAM_SAG: OAM_SAG OA unit */
>+	DRM_XE_OA_UNIT_TYPE_OAM_SAG,
> };
>
> /**
>-- 
>2.48.1
>
