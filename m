Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151B5C7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 14:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC50210EA48;
	Fri, 27 Jun 2025 14:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEygYpZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8793410EA48
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751035015; x=1782571015;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zgld7VksumXp1Rh6U7t60ndGI62jfKhiJUf5GuynvDk=;
 b=eEygYpZdcJLhTeVsTz0a4g5W0YBibHLvvq0g4s1hkBuG6RisvjvP2+FQ
 saCh6lfeYh/9eNwEix9Dfdr0NT/T8bw3MXL62Ys0V+CYHxQwfh+NhClpN
 JXATvcvDzlvoBv34BeJYnjhdzDka6GXsRW4X5LInEhWGEh/5j91x8fY8N
 1cafhirZTqeQOTLNeXAO2lpuayVB3aDgCPyPWFQwcJirzdqYTFPpXGsFL
 e6gLRDFG2QUx0Dz1z7o1BQ5XeS+Hxn1qHZb453cuxFsHSlPzvVg9zFT/u
 cye92WAAgFeHW7icGJaovKFeX84Ld7HSUGull6vNJyT6bM7NyFCderKZm Q==;
X-CSE-ConnectionGUID: +BYBCu5PQ6ubldwSsKgcOg==
X-CSE-MsgGUID: w5ePgtfESFKFVaCkvr/V6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57026239"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57026239"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:36:55 -0700
X-CSE-ConnectionGUID: fJx8x/mCRAqhUa/KtyFflw==
X-CSE-MsgGUID: wQ7thD1qQh2KVQBD24IYUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="153354152"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:36:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 07:36:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 07:36:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 07:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lw4ryiXLHIxDcyIkvWKK9LqRe3cplZkqBFlNA418qapaqtylovFrLhlrdVT9TqjCrodx+BNqso1Ujymr9tvu9Ddsaeph2jpEoAmdCbso3oUX1jOesmUlk6H2iXScBPE5s1z3IWtl8oPu4k25825OVIyd0dDr1UN900EoXVj9E9Eo9YoVDkBHkufbDPRBA1H6SmI5xLAb18Jodd341t1PMRzHD+xofUzOFzWg3waN8Y0XvSu5rxI4nGc6bp9ZJuFomxXRjpLJcVMW0lsFcyM5Wplc521RlznAr+vM/zdHpYg5spGgwdXk+eC46iI9fu03ceFHv1fNyglBv70v8deP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqVv/LZ5jKPv4+G2OHqK7HloskXvSEdF8adejof+m9M=;
 b=ip7RSWeREU0MkEK0J7P7EO6wzhoPp9Hw0lEFoD0MWGcqMpfv08809ntc5fG3WBnc2KTrjfjfB2bLe2Vh4c4GWwgxtmXSuV0VCOTgORuRq3wpNIOus7r/DbNM++mWgMM5TtJwjg90E8n/kJ8Czqt3RehChe05S3JztLNbo5cDTV4Brk/u/brTH6TOXGu5Pex9try2R4LOJgmC+LRRpRIZ/Z5HlaRKjTpeQs/JGOmsgBT0658u68doWI0ovWOOOuu8k91540wq16kXnpmePcGf/UMOYks8UDUjb8lFoLtzYnl9aySFP+hDwAGc9Q+Y0l7YQpw58bfiXVsrxyElwCVKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 14:36:25 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Fri, 27 Jun 2025
 14:36:24 +0000
Date: Fri, 27 Jun 2025 16:36:21 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/7] drm/xe: Introduce xe_tile_is_root helper
Message-ID: <20250627143621.h3ctm63um6c3oz4r@intel.com>
References: <20250627124916.1392-1-michal.wajdeczko@intel.com>
 <20250627124916.1392-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627124916.1392-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: LO2P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7c957a-db9a-4342-5b0f-08ddb587fe3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVZ2R3BKeXNVM1NrOWNWMnpYOHdiamE1b0xwaE8vOFk4TXFqV0xUYXhXb2Va?=
 =?utf-8?B?VGwvaXptM0R4eHFtb3pBTUw5azNyeVRoUi85YkFiVVZ1S0NkR3BOU3UxcUM2?=
 =?utf-8?B?UG8wVFYvQ3BlNXRrb0h5dnlLdGF1VGxOUzFGSUJVVmZDV1NydTJzcWorRXho?=
 =?utf-8?B?TWlyU0hKYnZrMWljRFgvZGpmZDh5TStrY3VwbExNT2hPRUF6S1AwSk5IRzda?=
 =?utf-8?B?cVdOSThTUzF2Vjc0SVBZVzdzUEJUTkVBNEhxaHcxVlFqKzNsUkxsb2JyME04?=
 =?utf-8?B?MEMwUHIvbm9TaUtsMEtKcFRCSWR6dnRiY0RaMGdzQjhTK1hwY2l6bk1nK25Z?=
 =?utf-8?B?V0tlRnpCVHBvWEp2Tkg5SXZNRmpCQjI0VkE0UU9Eek1iM3pPalVzT2RYTFpN?=
 =?utf-8?B?d2JLZXNLTXMvNFZhZ1hPdXlDU3Erb0Y2Z3dnVC9NT1FhdWVONDZKd0c1YXRl?=
 =?utf-8?B?Qmc1RkRTdXl4TlcxS1piSjF5TnVTaW1MR2JnL1lsNzZ4NXltZlJjaFF3Qzll?=
 =?utf-8?B?L3cwVGdiZ2t1bVpaK3JLazFwbWtpUXRNU0ZBRjNoNjBDRlhSVTB3WTVwZ3hG?=
 =?utf-8?B?S09zN1U1M0UzTWRiTWFtS0Y1MTVBa2ZUWEo0ODViVktVVFg5WnBzSmZsaVBR?=
 =?utf-8?B?T3k0RllrNUVVY2Q0a3phSXJUdlZTbU1ManNQVDh2b2dkcCt2bmZZd0QwSEpi?=
 =?utf-8?B?OVJDalFYd3FLam05WW9aV0JYeWJaZXkzUU5lRHIwc0R2UUZEbEFkQ3VWQWND?=
 =?utf-8?B?R1RONW04Y0RrUDVtbUtoamRGb3Qrc1JuSnVNQXhtMkdhQk9yb3NpUmk2Z3Fx?=
 =?utf-8?B?K0UwY2J3T0MrV25Hei9rV3lQMDA4V2M5TGplY2lMVzFWMEVSQUJ4WFoyMlRS?=
 =?utf-8?B?SU5QelEvRTBaSzFpTC80Zk9lYW5NY0xNNzVOUjlNT3V5WG5wREhtQXhrQWhM?=
 =?utf-8?B?RzdUVytZcnhDZktVZ0JsbnlSMjdUUnN5czNiejcwZk14b0FuVjFwampLaStX?=
 =?utf-8?B?bGsrSkc1alhSQ3ZzMUZSTXBMZ1BoajJNYlF2K0REVGxHVWVXeDNieCtSMFNr?=
 =?utf-8?B?TnRZMSthWFJVNk1oVS9lSHY4N2RtQndKQ3ozb1FxdXgyQkV1TFFSa1ZYMzhW?=
 =?utf-8?B?NXRnSzRhZkwzbGRqNHRUV0RYQXJoWVovdXduQm5iMFcwN3RQMHlpMnd5T1d1?=
 =?utf-8?B?Yk5NY3IxU0lCTHVjbi9lKzVRR29kKzBmakxrYzBBVStYSmMyb29DcjRIV3JK?=
 =?utf-8?B?dFhSV0NzYVdZZ1hodTdXUStpMzBZUEoyL24yWDgyVEV2K1lYQjRMem8zVFVk?=
 =?utf-8?B?WmQ2WG9QYXI1UVFyTEJQZkM1dWZ2Wnh5RU1SVDAvcG1JZDlPSDhORG5IZ0tP?=
 =?utf-8?B?aDNIellrSU1Mcm1xbnMwTXBOWThDTVdtRDRQWk5IUEx3TlVkSGk4dWhJdGNY?=
 =?utf-8?B?N2duU2lTK2hRdWhHcjcyejdON2VMUEdHNE9YelNubDZNSjJFbDdSYjBpbEcy?=
 =?utf-8?B?NmxUQ0ZmNW1ncDd1QWs3YzZoQUoreEMwd0pPZVRWWU1DSlF2amFmK3B5L3Fo?=
 =?utf-8?B?dlBlNi9hZEZ3RThjMUU0eUR6alhlY3RaZkhWQ1FrcXNSWmZvM2V0ZUpJakE4?=
 =?utf-8?B?WjZTRHZ1ei84R0dUYlo5K1VBU202N08vWEU1TnpKRytPQzFaR2VwODI1REV2?=
 =?utf-8?B?eFh0UFI5eTJNMU5EclZ2cGZwendtV3VlQVA1blZiYml6YUl1QkM3bEh1ckpJ?=
 =?utf-8?B?eHBKSEJ3blVLN1lGUjhOM01rL1pyZk40UG5SeTAydjVQNjY5aEhuSi9Jblp6?=
 =?utf-8?B?Q05vNDh2dFBYLzhENzNrRmNrMERNQmxJS2NYbnU0WnBIOVpmUmV6TExnOFZD?=
 =?utf-8?B?NXZBY21naThZSjZSU0kyaityKzlpb0QxWXdaM3ZydEJBMWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0JkSnQxSTc1eTQzL0xuZGFWOEh5MEw1d2VFUFZCQUhLSGt1eWJqeSt3bHlK?=
 =?utf-8?B?YmJmOWdwNTlIamNkRzlMNDVGT3locXpNVEUxSHU0cS8rcU52N1ZxaitJeWh5?=
 =?utf-8?B?WElkS0NuOWcxWVE1VkxxeDFlMW5qclNsUmZlYTFrV0RYMkJSTWM4MjNXTjV5?=
 =?utf-8?B?bFNYTmtTSmlzUVh3SVRQQ0VWdDloVm81bHk5ZzRQTk53b1hJd2pjZ252ZTE0?=
 =?utf-8?B?ZHlNWWgydmhNNmVBUjhyZG03aXE2WGVtQS9hOHovbDAzb2FObExxMXBDc2c2?=
 =?utf-8?B?Y09RSm5jOG0xdllaL0VwWnpHM2V4MGFjekZlUEN3L2djTExJcHRjdWJqU3BO?=
 =?utf-8?B?eEZZSG9PN0laNGRPY1I2UEZydnhKYVlsbEQwTEY1WVhnM1VsVGg4dm9USWJ6?=
 =?utf-8?B?b3dBTFBTcnowR1ZNTG15cHFtNkovNDFkNmRpOHEvSUtOMWJnWlg5MzZpTktS?=
 =?utf-8?B?SEQyVlhDY2ZQK0hqWHQ4bjlkaXlPNjZoWGZ4V3JZRXI1WjBQbXZBNFdnbUZJ?=
 =?utf-8?B?b0VsTWZER2pVSDVzY2ROUEQ3d3A1VThFUStIMDh2Wm4xNjVQQ2hOMWtVd0ho?=
 =?utf-8?B?dlVOOGZDYW5HSUk0eWhKSHVXeVozVkZjVDJtanM3aUM2N1lvZHFhcXhVYkZB?=
 =?utf-8?B?aXQyVW5CUWg5RkQwK0laU28yZ2FMYyt2T21PN3EwdkpUS1NDNk1GankwWndk?=
 =?utf-8?B?MGhSTHMwcHlTTG5TdFpPbkRZVjVsWUU0RWxCK0Y4Wi9iR1p5cHdNTUFETlF6?=
 =?utf-8?B?TG1DNmJVdDRPMjU1MHp0SVMwQXhYeVJOclI5NTMvMFVKN1dFMnR5V1NRUWln?=
 =?utf-8?B?aHo4bk5uY0hYdmhVK0NNd0RrNGVYa2pVWUI2SVhud0RXZ1hNRElLRXRxTjNw?=
 =?utf-8?B?SkZxakl6MjZKWWJkK1piOGNmbUMwK2ZjblZFdEZQbE9aSVN1ZmFFaXdhRjUx?=
 =?utf-8?B?UU1aZWtUOTZocTNHSVBBOUx4MFRoMnp0SWJWVGwrbWk0WEh2SjFPL2NhMG5V?=
 =?utf-8?B?eXFBbSsza0J2bjg4YVc5QjV3bDBFdFBoYTJwamtEdVBZU3lyRWtmUnFhM3pW?=
 =?utf-8?B?ejBENUJENmRHZmk4K2RWcFhlQ2xPSGdtZ0U1aEtyNWxTV0dIWnNKblFKS2ow?=
 =?utf-8?B?ZlpSalErRlUyTnhIcTgzZ3pyS3pwa252dXFIckpvS05oeDN4RkZWbDNJL1h4?=
 =?utf-8?B?TnlGWldXcGI3UzNrbU8zc2NLOGo2ekNlTkpBdUYrMEVGMjVGQ2pOaUFXeVRz?=
 =?utf-8?B?VVR4Z3dLZFZkUzBDMk42UFZGTXZJNlY2aERIYTVmc2V2VGd6bHRvUjNnVUF0?=
 =?utf-8?B?RlNsNUljOGN0YnYxaWtqK0UweEZFakNWZm10Mnp2Sit3dVJONHIyMVVGRHhp?=
 =?utf-8?B?UG1jTVBJcWpOZDZ6NUlXamJsM2Jabjd0ZldOSWlRU1JlUVR4YmhzNjBvUHJH?=
 =?utf-8?B?MEYxcFpBT0VDRUZjVW50aVBLaEdsWFo4MkdjZTZNK3Jna2NMNGJDZnpYTWY2?=
 =?utf-8?B?a05pQTlWZllJVnUwV09sQ1pWdnU3WjJJR2NpRmwybDQ2bmJUSE51Tmt3WUFj?=
 =?utf-8?B?WUZqbExqS2kveWlIaGlZVUhSbXBoQ1d5T2lWMlNUR3M2ZFMxK3VQVUdKTElE?=
 =?utf-8?B?V2NFa2xZbUY1RTJoUCtTME9DTU5qMWNScGpLdXllVUpnMVRLc2ppWWxocVgv?=
 =?utf-8?B?b1VzeUhtQjBmVW5kZE9UQmcrZ0ZuODZMS1RTTjEwR0hJSktkeHJsaEhkZGMw?=
 =?utf-8?B?M3k1SjVaOW5RZTYrU1RUQUhBelNEY3lEMW1XbDZoNGh4L2ZXajhSalljZFZa?=
 =?utf-8?B?YUdUOGdNeCt6Sll4T3VSSUFBS1daS1hYU05OWVduU1l5eElJRE05bjNBQmgy?=
 =?utf-8?B?NCt6QzM1blVibmh6RmJRSXZIT1NOT1AyQXFlUUVvUVZPZWQzekJQeVozNnpH?=
 =?utf-8?B?Y3NqUW1UbVYrNVNYaThXd2VBK0E4ZS9hSFEvVWE5U1hlSFM1Vko1emF3RzN2?=
 =?utf-8?B?KzV4dHRBZGV2WlV6UllTYWxkMEI0VHBrVW9UTjJwS0QzcU1ETEFCQjFtakwv?=
 =?utf-8?B?RjdhM3IyVFE1aC9FZGNBRTdHZEJLL3cxN2hGKzArV0p2TlRtTjFNSGE3MGxU?=
 =?utf-8?B?My9xOXA1MTJhWk5hNTJGUzRid1RDTWNzRVpNUDErZS9ESTl4dzk0dXZvdE5s?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7c957a-db9a-4342-5b0f-08ddb587fe3d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 14:36:24.9044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVTDwvCf/PxcvY4ha4SijZbR4jXeHAPB9q3B4EwElgHfxY9QAzpeaNnP5gB4KWGE4VMCSGmdGeTE55IBN2DRE9Cd6WUDT90r92GIg4Acpp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2025-cze-27 14:49:12 +0200]:
> Instead of looking at the tile->id member provide a small helper
> to explicitly express our intentions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h    | 5 +++++
>  drivers/gpu/drm/xe/xe_gsc_proxy.c | 2 +-
>  drivers/gpu/drm/xe/xe_irq.c       | 2 +-
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index e4da797a984b..741afb7029f5 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -60,6 +60,11 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
>  	return &xe->tiles[0];
>  }
>  
> +static inline bool xe_tile_is_root(struct xe_tile *tile)
> +{
> +	return xe_device_get_root_tile(tile->xe) == tile;
> +}
> +
>  #define XE_MAX_GT_PER_TILE 2
>  
>  static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index d0519cd6704a..3ca8af721435 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -483,7 +483,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>  	}
>  
>  	/* no multi-tile devices with this feature yet */
> -	if (tile->id > 0) {
> +	if (!xe_tile_is_root(tile)) {
>  		xe_gt_err(gt, "unexpected GSC proxy init on tile %u\n", tile->id);
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 5362d3174b06..1e6540ce9914 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -550,7 +550,7 @@ static void xelp_irq_reset(struct xe_tile *tile)
>  
>  static void dg1_irq_reset(struct xe_tile *tile)
>  {
> -	if (tile->id == 0)
> +	if (xe_tile_is_root(tile))
>  		dg1_intr_disable(tile_to_xe(tile));
>  
>  	gt_irq_reset(tile);

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
