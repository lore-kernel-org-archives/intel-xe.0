Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377FDE83057
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 06:07:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912AB88EFF;
	Tue,  3 Feb 2026 06:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOxDwppS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64EC88EFF
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 06:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770098840; x=1801634840;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cJmsHNoXU4RXWwnzQ0yQsNHLQuq4cD6PMh0U59GmR8s=;
 b=VOxDwppSU8UuUifCsvq14HiULk49JaXhnLpCOtubsW65AWsib/C59udc
 NvK17xViXclns8uebsiH2ElcMR0qJf4DhFE0aLd7AtpNfC9QWj0WCuYTT
 UA4ifkq4AGONzQWfjH4fNETo/5lf89qE08Na+LijsZPWnVVRjU26jfak1
 781fBU9oujMQ9V1qT9FJfoVQnqvaannzRtfQrDbn1V71mAyLwWGSiuWub
 CpKUCh3mQenYrXcgbSV+2hhGJBb/3mwu1T75dP9pcFZLaHdPXAxUz1B3w
 gNa8egwvAZqBuCVrkdAop/q4+g3e3sBh4JHsb+ocUxJP7bi+1PFbtaaT3 Q==;
X-CSE-ConnectionGUID: ySn+WWmMQxmicqRe1uqjCQ==
X-CSE-MsgGUID: nWfGWpk+T2WhrRZpY6bRJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70987116"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="70987116"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 22:07:20 -0800
X-CSE-ConnectionGUID: Yzizwk03TWWm+fvoPk3SRQ==
X-CSE-MsgGUID: wAd2U1ncTQ2B2mWLGD+DiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="232667476"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 22:07:19 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 22:07:18 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 22:07:18 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 22:07:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mWLr149F7u8LT7ma5H86G1y1g8cg2jBZfvf2QW0AlE4pPWBaeojLrViz2bw/3FfiUHXDEAU4ER/1N2YI3urDisazaJcA0tfxNTpIvcM1pkQ7E07SYq93qfDE0hQx8ZsYDkQvLkjqOABbOxEtDJwOLq4tYB+ZV6udkUzv01pZV6b6ogCWEDhuqwOZ4fCQwiBx4rEyP4qSBDVn12KoZnOh235HjMCn12Ixx+7Cb+JZiNcIv/yn6xtaDNddcCdf5/+7sl+CqDBxxnKH2RNzw3myylR5fI7dWqG0ByrBFRszVYz43Tmd7iuT+7SPcUVUzlh77SN6gpM2CTPfuHVxlY8Bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WlASLm60Hpkq3nfVXKlLK5EPFm834bm+KLd0c37raQ=;
 b=h5a2vq94onU7paMqQAxsDz92QDvjp1Zr8m3hmNMtm1Vum+O0QFu6YqLLvdpyszQBkJeA66CKbNSych4QEvsnGV6Wy6Yp3m6HH0D8ks43TY845d+UJNFGAgbdqqOgDPTS8ZIQ//5m2CSIDkeDckGtx2XMD33PNDDbJ/Wnx5NEI6w3czkvHmhjv+BpCbuUnYSZFg1h96tZwdsYZZDoiVPcH+sqgWpUyC1+nx+2HQTDZPUfjUfyItjNSztW4pts2mVkMM529ha9Lb42Ylo0n0fQ6TKqMoY/ogYYNs1tH7luJdUD4BdZE2N/mQDJ5rx7Z0Xeu9K8petTSgu1QqmENZmYOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CH3PR11MB7865.namprd11.prod.outlook.com (2603:10b6:610:128::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 06:07:15 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9564.010; Tue, 3 Feb 2026
 06:07:15 +0000
Message-ID: <de027f72-45d0-4254-864f-bc070a4fbdfe@intel.com>
Date: Tue, 3 Feb 2026 11:37:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Add forcewake status to powergate_info
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
 <20260115224040.2668209-3-vinay.belgaumkar@intel.com>
 <a5187a5e-f74e-4d8c-a435-131a86d5f649@intel.com>
 <c07e167c-33cf-4497-8a31-e88c5a0414a8@intel.com>
 <7a7b4693-8a28-423c-bbbb-8b16b4ee2de7@intel.com>
 <e40bb59b-d40e-46a1-9792-93019db06221@intel.com>
 <421a0f41-38f5-4887-8d89-d38442d8fef4@intel.com>
Content-Language: en-US
In-Reply-To: <421a0f41-38f5-4887-8d89-d38442d8fef4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::13) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CH3PR11MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae8dc58-2340-4e63-7d9d-08de62ea7acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlN0VHVoT0gzSHk0U3ZnQ0lZYmxWR2t1S2tuZjB1RnBlSVI5SWMzZnkyQ0p3?=
 =?utf-8?B?emZVVCtydjZqaDMrWVpQcU82ZWJzTXJiS0VWMWpFaUs1WCtEZzBndnExWlFD?=
 =?utf-8?B?bU93WWlRbWIwbGRZSGZaOWk3R1dLK2lRUXlXcXV3LzBPay9ybkNpa2kvMm44?=
 =?utf-8?B?aE1PUHMxV2lDcndVeXdYcFE1WFlnUHVFam5PcEZMVFNiQjNlU082UngxK0x3?=
 =?utf-8?B?WWUwNCsrdjRPN0I0WnFQR1JxcGFUMCtWeVFzUm9SQ0djd0lQeEZud2NyUExl?=
 =?utf-8?B?WUVIeXpDQkp4UWNKMHNEenVEcHhKakVtRmtSWnB3TmZDaWYrSDc3ZWpqNmVp?=
 =?utf-8?B?TkI1ajZuSUxCOGphYWplTTBQd29MUFovbHFsblBaNFllSW5sNFQ1VTJsSFBM?=
 =?utf-8?B?QTVYQXE1b1EyOFk0RGtQWUdEdU1rY0luYU1DaUZRRHc4YTZzSlJ5SHQzUWlr?=
 =?utf-8?B?Z2tyL1h5d0VRNHhib2R4TTNaTmU1WmhtS2lyTUM3ck5va2ZvVVZXOTFrdFJ6?=
 =?utf-8?B?a2pGQkZyL2gwS1JwdEo4SlFpeVZaK1JhREREWTZjNWtaNWJBdFFpT1NCZXRn?=
 =?utf-8?B?QTJKQlZzUjdqRFlDUGtiZERvRGpCZDlFNk1hay9MU054Y1k1UE9wSzdaT1Mr?=
 =?utf-8?B?QXhadGdqKzVMN2RQdG1KUHAyWEg1SE11OFhlbXMrL3VQZ0xTNzNHUGFmUjM0?=
 =?utf-8?B?M2RWWDZYUDk3MDFzbHUwRi9MQ1JsYXdDMFNDUlZwckg2ODhES3VjbjRDbjBV?=
 =?utf-8?B?UXJsV0w2dE4vMXZ3MG1Lay9yZWUrRGk0NjJVMXc0RUJpTHBmQ3gwZnhkRzVN?=
 =?utf-8?B?RzdYLy9GUUVXQURrWTcrZDMvNTQxSU40dW04MEZ1NWNWQndrZzlkYWc5dUFS?=
 =?utf-8?B?and3SjB0YkxYT2l3RVB1VE9ZTGZVdGpGMmFyQitkd2NMdmRZM28xaTgyWExt?=
 =?utf-8?B?MzBkWDlrUWNITzJEeGhGUGFTaG4ycWdBMzVJTThxMVcrenc2UWloQmxsZUVz?=
 =?utf-8?B?RXBRU3FFL2p3MXlLdllTRVdnUXVKbVljOVFCWnNqUlpmVnZQOEdVWDBWcWU0?=
 =?utf-8?B?SFFxSFN2QVBOYzZJaVdDM0I4S0t4NXhsVnJiL3dOVkxqUHl2RTZ3SDQ0Zng4?=
 =?utf-8?B?c1k0clBoVlNlS3ZlaGh6WEpTZ2pwZjk5MHNIRmN6Z2xOKzAwYy9IZzRIem5F?=
 =?utf-8?B?c1ZJNnlkRXhsUDNqRytiR3Z1b1pCMVBCdEd6RmdmUGx6R2s0OG1yalA5dkJS?=
 =?utf-8?B?TURPZ3ordzJLTUh6THdtTGFvbTJDY0FIKytHdUdqNURLNCtCeEk4bjBzczhX?=
 =?utf-8?B?Q3NoS2cxRTBmNSt3NDhzTEpLa1ozR3l5cWxZakpXZnZmZGRSeE1pUHJDc1Vx?=
 =?utf-8?B?Q1pLMzl6OFFtRk9sSWpHejVrVXFSMHFZKzBmQTcrdnR3ZGRVWlIrVkNXR1pt?=
 =?utf-8?B?amdaTjliS3hwdnFvRnUyaXB6b3JLQmhiTkJIWUhzM0wrNW80ZUVJU3poK1U4?=
 =?utf-8?B?WGRTTnJlUVkraFgzTUw4ZDBRcnc1WWdaQTR0NEtuTnVnYU1GRHI0b3RSQ0VS?=
 =?utf-8?B?bVlBOFpvTzNNcEs0TkNiU0V2ZXdLVXpMbHg3ZWJySHBybURNVkZ2QkJMS2JY?=
 =?utf-8?B?ZUdqN2g3L2Q2ZzNmcGhmWU5CbE5YRUZWeXlMTUh2R3dpNy9STWJibndTaXE2?=
 =?utf-8?B?Qi9pSnRlS3FrRk8zYzJuMVpsLzJGd3U4TzAzbVFtUTBOWG80VGdvTHV5VkFy?=
 =?utf-8?B?a3hQNVZjUEVZTmFxeDlZanRDUnpCUytzMFpRQytqYlBZTXFJS1VyQk8xenNh?=
 =?utf-8?B?TDNsdWNTYXB6cmZBTlBOSVltTHdxRlZrdEFJc25RWUJKa1o2bFoxWEtJbk0w?=
 =?utf-8?B?VnZESEpRaHRjNFNoYzkrVUludExPdVpZYm8xQmh6VUJTTUZLQjBIZVNsN3NQ?=
 =?utf-8?B?MDZoWnpFWUpIT08rdFR1RFRtT3Ntay9XU2xkTnZuUEo0aXlHVTFjS1VIRDgv?=
 =?utf-8?B?ZEpFamJlblNCeDhDUDkrdTBza3lHd3dBTnNZY2ZzY3R2UWxtWUtXS0oyK0Nt?=
 =?utf-8?B?KzE4Wm9GNmdGZ3ZsYUdhTE5DOVpTUkNwTGRMMTBtOFRoNCtiTDZtQ3RJbG9i?=
 =?utf-8?Q?4vG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0JxR1hGRUtHdTFPVE9PaHpGWmZQRlNtTzJCYWM5NC9xRWEzV1JDZ0E3My82?=
 =?utf-8?B?cGloZ0RJTFJRb1h6TTlBK0VlWDg2Z0Z3TG9HS0xsZDRhQzVVWUpsckhITVBk?=
 =?utf-8?B?WExoRGVXa3FIemljY3pnSS93UFRJMGxhRXVBbm85WjgrNHNnb0hodGZBd0dK?=
 =?utf-8?B?UnhYdGZyMUx0M0ZiZllYbW9FWWovV0I5YkpXWjRTL0FEMDNlcWprL1NoOW9C?=
 =?utf-8?B?cjNLOHMvc2hyOUxVMTZQamZvQlBkaWZCVmFXUGROeWpoRVU4NTB5WXpCTjhL?=
 =?utf-8?B?OHRQUFUvOXNqSmR2disvS1FkdkM0N1VjWWZsOCt3VURoblVvd1laSHBJUXNt?=
 =?utf-8?B?UnRaYkdCZE5YMENvUWtVSy9vaHpVVWw5TW9icS9wSkR1SnJ4S1kxdXRaMmxQ?=
 =?utf-8?B?MDkwbGR6VXJHZVZYWG1BaWt0K295OWlua2JiTERhMTZkYnFURjhQQmpVbk9q?=
 =?utf-8?B?M0w2R3V1QUtaamJJdHJldlRBYTQ4MkZBMmNyVDJKd1IyelJmN2dGbDRwTDBZ?=
 =?utf-8?B?U2J5M0U0VDQ3b0crcFB2U3JpNVN2K1RNdFhESHJmTzFhVjQwZlE2eFVvbkpu?=
 =?utf-8?B?dG1WOHpaSkJmL0VIYUtkbDRWd1VDamxtNjhNcFRLR3RVaHFwM09ueDFSYlR2?=
 =?utf-8?B?YXNybGRrbllkRTRKL3FQYkhERU9WQWQwWVJiWFJ6Y0xSRm10bEczeVljZ0ZY?=
 =?utf-8?B?STlrT2JtaVVCa2FaSU1TZGVaRktHMDNPNzdTQkxER3l0Vk9BMy8xTXZycUhF?=
 =?utf-8?B?VThvS3FYdWhFK2NDSFVGcWQvSFdrUHdKSU41UXhsU1lDQk5meUt3ZXpNSE5O?=
 =?utf-8?B?dGFNUjV1Q1N4Y2JsZXlPY01VcWlQQzkvaytraW1jUkRjYzljS1BrQktQeEwy?=
 =?utf-8?B?ZHZEakJ0VTB6RVJQU3hNSzJxaUR5VzBzS09WWmhScHd4bmpRTkJ3WllJZ0dH?=
 =?utf-8?B?SmE3ZXQxYVVJa2RmZWVaZzl2NE9vOXBnM2hnQytSZEd1dWxZNE1RNjFLMFZj?=
 =?utf-8?B?Mm9IZEVHdk5KWnpRSU9Xa29MS2gyMkRTMktBZzM4MGZoQ1RSN0Q3QWpLeXNn?=
 =?utf-8?B?aUEyRmxuL0xXZUNYRW1BTEdlUjRSN09qb0IyRW04dmF6NlZtc3lCT1ZmMmdE?=
 =?utf-8?B?N0hKNGFnL1BGd0gvamhhUnBEeEEvOTBxa0ZTSmZidDBvckcxTVlLcE02TEk3?=
 =?utf-8?B?SGk5VVc5L3JMMTdXUEd3QmJLU3VRNVZKaC9tc09VanlBSXp6YUpFdy9SYVNs?=
 =?utf-8?B?U0cwaWRYTjQ3OTBQUkVkTDQwTWl5TkhwWmNDOUIyZmhNWFdrTzFHNUVzZ2Ju?=
 =?utf-8?B?Znp5WmZSZ052YXc0NDlvRHR2VVc0b3ZQcWxIV0ZtNEY1K1BvNkdQcnJPMUJL?=
 =?utf-8?B?UFN0bktoRFB4WkNpSEVSQ2ljRUF0S3AzQmpnYW1XVWZGV3FOUmR2UTJuQTBz?=
 =?utf-8?B?cVF1MHlNSU5yTDFtNjUzWE1GTDR6RWcwOTE5V1A5ZUZ6MElzWFJNOC95cWVV?=
 =?utf-8?B?Sy84SjBadk1DdWFQYUNPOU1rK0h6UVM5VmYvK21TczVYbXdnTHJGbkFla3N6?=
 =?utf-8?B?WTQ4TERMeW9iMnE3MTA0RmVhS0dBMmxrUTBrNzltM3RsNXBmSkpOQmZYdVhj?=
 =?utf-8?B?UXZTd0kxMDdEeDduTjBQVzlsckt1aTNLMk0wOTRaODhITWF5M0pQSWd6aldv?=
 =?utf-8?B?SmdKcE1KWnlyOStUbHNoTC9qdDVIRkRydGlOYkdvZU1TR3p5TENYcHAva3VG?=
 =?utf-8?B?b0gxNFYvUElOSndFRmRYVGxhc2ljb2wydklRVmo2MklkZHpTRldiU3Rna1FO?=
 =?utf-8?B?b1hqcGJ6V2QrMkxWMGxSL2MvcjdIOTk3QVRiL3VuTWVRMCt0dnMwZGNSTHlk?=
 =?utf-8?B?S0pORThOVHBZdnlDT2J6cUFYVHZWZi96NkIvZmlmL2psYVhTbG54eUp5SWlz?=
 =?utf-8?B?N2lWZ1l3V3lCNnhRM1VEUnYwcGNpNURLQ3hUb2FkUTFHalFHeHAvRWVISFNL?=
 =?utf-8?B?S3ZJdzk2SlZibDFjc1cyM0svbU1yaWhUQzNOS284aEh3SVAyTWJaVDlJSktx?=
 =?utf-8?B?N0tzbmd5UGVPajUxNDZLN3J3OFFKSWx1UENJc2pteUc4Z0dPQVJQV0JHZm9W?=
 =?utf-8?B?bVh1S1lvZGQ5anN0ZW1aUmpGaWFXT0FDUVRFSnpBMFc4S1p2QW9XeUs1eUVx?=
 =?utf-8?B?cmxtTWpWNVFIR2d3VjNXSnRwTUxjbGRtSDQvVlp1QlZXVHpidUtQdFFscUhh?=
 =?utf-8?B?ZXBaaE1VMTlUcUZ0aVFrWHFjTjJmUXNTKzZCK3gzUHFWVzZJbjZLQjQyODlw?=
 =?utf-8?B?WWw1R2RaV3pTdlZEdHo3S3hBVFdlQXBiNThBa1lVbGk0ODMwbGVudz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae8dc58-2340-4e63-7d9d-08de62ea7acb
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 06:07:15.6549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwXP27wKgjqvfFuPAbXo+0bGAs5dI3Ft0rcLFyvLbffz9RJJfXB2QX31/1w7ddR4yOlMIVmzNDWnqbsSJk17vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7865
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


On 02-02-2026 22:50, Nilawar, Badal wrote:
>
> On 02-02-2026 22:42, Belgaumkar, Vinay wrote:
>>
>> On 2/1/2026 10:38 PM, Nilawar, Badal wrote:
>>>
>>> On 30-01-2026 23:04, Belgaumkar, Vinay wrote:
>>>>
>>>> On 1/30/2026 7:20 AM, Nilawar, Badal wrote:
>>>>>
>>>>> On 16-01-2026 04:10, Vinay Belgaumkar wrote:
>>>>>> Dump forcewake status and ref counts for all domains as part
>>>>>> of this debugfs. This is the sample output from gt1-
>>>>>>
>>>>>> $ cat /sys/kernel/debug/dri//0/gt1/powergate_info
>>>>>> Media Power Gating Enabled: yes
>>>>>> Media Slice0 Power Gate Status: down
>>>>>> GSC Power Gate Status: down
>>>>>> GT.ref_count=0, GT.forcewake=0x10000
>>>>>> VDBox0.ref_count=0, VDBox0.forcewake=0x10000
>>>>>> VEBox0.ref_count=0, VEBox0.forcewake=0x10000
>>>>>> GSC.ref_count=0, GSC.forcewake=0x10000
>>>>>>
>>>>>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/xe/xe_force_wake.c | 46 
>>>>>> ++++++++++++++++++++++++++----
>>>>>>   drivers/gpu/drm/xe/xe_force_wake.h | 11 +++++++
>>>>>>   drivers/gpu/drm/xe/xe_gt_idle.c    | 20 +++++++++++++
>>>>>>   3 files changed, 71 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c 
>>>>>> b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>> index 76e054f314ee..197e2197bd0a 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>>>>>> @@ -148,12 +148,6 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>>>>>       return __domain_wait(gt, domain, false);
>>>>>>   }
>>>>>>   -#define for_each_fw_domain_masked(domain__, mask__, fw__, 
>>>>>> tmp__) \
>>>>>> -    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>>>>>> -        for_each_if((domain__ = ((fw__)->domains + \
>>>>>> -                     (ffs(tmp__) - 1))) && \
>>>>>> -                     domain__->reg_ctl.addr)
>>>>>> -
>>>>>>   /**
>>>>>>    * xe_force_wake_get() : Increase the domain refcount
>>>>>>    * @fw: struct xe_force_wake
>>>>>> @@ -266,3 +260,43 @@ void xe_force_wake_put(struct xe_force_wake 
>>>>>> *fw, unsigned int fw_ref)
>>>>>>       xe_gt_WARN(gt, ack_fail, "Forcewake domain%s %#x failed to 
>>>>>> acknowledge sleep request\n",
>>>>>>              str_plural(hweight_long(ack_fail)), ack_fail);
>>>>>>   }
>>>>>> +
>>>>>> +const char *xe_force_wake_domain_to_str(enum 
>>>>>> xe_force_wake_domain_id id)
>>>>>> +{
>>>>>> +    switch (id) {
>>>>>> +    case XE_FW_DOMAIN_ID_GT:
>>>>>> +        return "GT";
>>>>>> +    case XE_FW_DOMAIN_ID_RENDER:
>>>>>> +        return "Render";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA:
>>>>>> +        return "Media";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX0:
>>>>>> +        return "VDBox0";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX1:
>>>>>> +        return "VDBox1";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX2:
>>>>>> +        return "VDBox2";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX3:
>>>>>> +        return "VDBox3";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX4:
>>>>>> +        return "VDBox4";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX5:
>>>>>> +        return "VDBox5";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX6:
>>>>>> +        return "VDBox6";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VDBOX7:
>>>>>> +        return "VDBox7";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX0:
>>>>>> +        return "VEBox0";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX1:
>>>>>> +        return "VEBox1";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX2:
>>>>>> +        return "VEBox2";
>>>>>> +    case XE_FW_DOMAIN_ID_MEDIA_VEBOX3:
>>>>>> +        return "VEBox3";
>>>>>> +    case XE_FW_DOMAIN_ID_GSC:
>>>>>> +        return "GSC";
>>>>>
>>>>> How about creating static look up table.
>>>>>
>>>>>     static const char * const domain_names[] = {
>>>>>         [XE_FW_DOMAIN_ID_GT] = "GT",
>>>>>         [XE_FW_DOMAIN_ID_RENDER] = "Render",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA] = "Media",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX0] = "VDBox0",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX1] = "VDBox1",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX2] = "VDBox2",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX3] = "VDBox3",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX4] = "VDBox4",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX5] = "VDBox5",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX6] = "VDBox6",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VDBOX7] = "VDBox7",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX0] = "VEBox0",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX1] = "VEBox1",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX2] = "VEBox2",
>>>>>         [XE_FW_DOMAIN_ID_MEDIA_VEBOX3] = "VEBox3",
>>>>>         [XE_FW_DOMAIN_ID_GSC] = "GSC",
>>>>>     };
>>>>>
>>>>>     if (id < ARRAY_SIZE(domain_names) && domain_names[id])
>>>>>         return domain_names[id];
>>>>
>>>> I was trying to make it a little more dynamic where, if something 
>>>> changes in the FW table, we don't need to update 2 locations.
>>>
>>> Ok, but even with a switch-case statement, you’d still need to 
>>> update it whenever a new enum value is added.
>>> So, updates in two places can’t be completely avoided.
>>
>> True. Similar thing was needed in sriov and guc code, and switch/case 
>> was used there. So, just following the same method to keep it uniform 
>> might be better? I believe i915 used the array definition method.
>
> In xe also its used in boot survivability, late binding and sriov etc. 
> But fine lets keep the switch case method.

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>
> Thanks,
> Badal
>
>>
>> Thanks,
>>
>> Vinay.
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>> Vinay.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Badal
>>>>>
>>>>>> +    default:
>>>>>> +        return "Unknown";
>>>>>> +    }
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h 
>>>>>> b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>> index 1e2198f6a007..f7690cb34ef7 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>> @@ -19,6 +19,17 @@ unsigned int __must_check 
>>>>>> xe_force_wake_get(struct xe_force_wake *fw,
>>>>>>                           enum xe_force_wake_domains domains);
>>>>>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int 
>>>>>> fw_ref);
>>>>>>   +const char *xe_force_wake_domain_to_str(enum 
>>>>>> xe_force_wake_domain_id id);
>>>>>> +
>>>>>> +#define for_each_fw_domain_masked(domain__, mask__, fw__, tmp__) \
>>>>>> +    for (tmp__ = (mask__); tmp__; tmp__ &= ~BIT(ffs(tmp__) - 1)) \
>>>>>> +        for_each_if((domain__ = ((fw__)->domains + \
>>>>>> +                     (ffs(tmp__) - 1))) && \
>>>>>> +                     domain__->reg_ctl.addr)
>>>>>> +
>>>>>> +#define for_each_fw_domain(domain__, fw__, tmp__) \
>>>>>> +    for_each_fw_domain_masked(domain__, 
>>>>>> fw__->initialized_domains, fw__, tmp__)
>>>>>> +
>>>>>>   static inline int
>>>>>>   xe_force_wake_ref(struct xe_force_wake *fw,
>>>>>>             enum xe_force_wake_domains domain)
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>>>>>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>>> index 52436dcb6381..8e36202f1a4f 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>>>> @@ -169,6 +169,24 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>>>>>       xe_mmio_write32(&gt->mmio, POWERGATE_ENABLE, 
>>>>>> gtidle->powergate_enable);
>>>>>>   }
>>>>>>   +static void force_wake_domains_show(struct xe_gt *gt, struct 
>>>>>> drm_printer *p)
>>>>>> +{
>>>>>> +    struct xe_force_wake_domain *domain;
>>>>>> +    struct xe_force_wake *fw = gt_to_fw(gt);
>>>>>> +    unsigned int tmp;
>>>>>> +    unsigned long flags;
>>>>>> +
>>>>>> +    spin_lock_irqsave(&fw->lock, flags);
>>>>>> +    for_each_fw_domain(domain, fw, tmp) {
>>>>>> +        drm_printf(p, "%s.ref_count=%u, %s.fwake=0x%x\n",
>>>>>> + xe_force_wake_domain_to_str(domain->id),
>>>>>> +                   READ_ONCE(domain->ref),
>>>>>> + xe_force_wake_domain_to_str(domain->id),
>>>>>> +                   xe_mmio_read32(&gt->mmio, domain->reg_ctl));
>>>>>> +    }
>>>>>> +    spin_unlock_irqrestore(&fw->lock, flags);
>>>>>> +}
>>>>>> +
>>>>>>   /**
>>>>>>    * xe_gt_idle_pg_print - Xe powergating info
>>>>>>    * @gt: GT object
>>>>>> @@ -260,6 +278,8 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, 
>>>>>> struct drm_printer *p)
>>>>>>                  str_up_down(pg_status & GSC_AWAKE_STATUS));
>>>>>>       }
>>>>>>   +    force_wake_domains_show(gt, p);
>>>>>> +
>>>>>>       return 0;
>>>>>>   }
