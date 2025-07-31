Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9998BC87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 20:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E07E10E2C3;
	Thu, 31 Jul 2025 20:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUcG8cLC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E6310E2C3
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 20:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753994859; x=1785530859;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4cIzxYpHN2OM+OfLbOCNgJSVwPLSxwjit74hLeib2xw=;
 b=DUcG8cLCxyy9kDMw7qMVMLl8ch0F8QaFEl1+GwEbyYoPW5if58Yj4rR1
 PgzuXsmJJnuWM0X8DInuW3YLjUWvvJ9IOfOz2f88ner29LcCMu6FC+nLf
 5IBNk/zgFHAnLu/iY1/nu2Z4BE7vlPDPONMBZYyXr0M0NS29QtoJYwEfc
 OYtRhdTu1tFwO9JSTKUcPuJcYRrnuxNBAm3TlbapBYEEzUCO8xwaMe1hM
 IaQ2MGk8nfJyA+iUlIY8d07MHohrSo8v20a5cPJ3poCenl4wSTgqmnZti
 IME3GsmfdYBiJljmIDon+I8dmUYupxCKSWS0qnO8UbnuKjN5YslaUzwVk w==;
X-CSE-ConnectionGUID: Rxwo9eqERtG89/PR/hQj7w==
X-CSE-MsgGUID: duwr3SP4Q6yI+oCuPGpjKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56265440"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56265440"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:47:38 -0700
X-CSE-ConnectionGUID: 6LHff8TZQkC6Q4QC8722/g==
X-CSE-MsgGUID: o3U1U7VpRdq3GQnOISy1yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="164158140"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 13:47:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 13:47:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 13:47:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.43)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 31 Jul 2025 13:47:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inKnrs5Yufs2F1bMsXLzHBLEIhMvEDbxOpA6bVOzzhEQiJ1zDm8Y+2kSLLprk6mRiXsd+mDvUMVonajfkRecZ6N0/M8JOjjNeYQ0zYr35latuz07/jbZs16in2k23X2bSRQ7h9iObhALcS+6hA/6f87P2g22SRtBGeRV4QElh5vemTIo36V9sL4A9bsPTKXXkhyhylIvk/h7PbAhMYgrQyty3LeI3ROvrtuW/69x9mZOKgwDO0pcokpQ6K6RhjtQK6VknA97AFmcyQ4CxHjSwsHi1xT2AZWQMejeD9t8e+MM32mfJLCHBLT/jZNkJNyDRQEvKTd12K9yDMc0mD0mPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekenc8jCMhMNCWGaN4TPjpWufr2POPYAvMB8DRL2C/A=;
 b=KntVKG7M58/s3OmY6Beot3tDOat8V6XCTI293wCSzdO7GeyJKGEQx/Z6Pnf2jRRMGcnB0sFPBy0V9XLPz/Ux/45g3+TIwY8Kx+A+vYN7qbVlq9Xq31uOAOO6nG8YtSk+pIXUMkmgOa/6IsiRl4AxO4YGq99KJnHRu/T6mrIgrzkB3SLO8PBwPNOm9S07T/bIIwqx00kEYzXYvn8B4OfR7pwSwX0eqgHIbYliiQFDbcxRBQR/aBB3uSQlKX2pJ80xmMmhnuFV8J0mkpNbS3W2KSq7QGO3cJG+iZvI7/jeT4qT3iPjNSm0+phV33Ek8MsE5WfTIiT0KRiTl+E43K2N/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Thu, 31 Jul
 2025 20:47:34 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 20:47:34 +0000
Message-ID: <3697c14e-48c4-4b17-b5d8-d08396514d85@intel.com>
Date: Thu, 31 Jul 2025 22:47:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Skip LMTT update if no LMEM was provisioned
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250731194633.179852-1-michal.wajdeczko@intel.com>
 <CH0PR11MB54440FFC8F47F6C4D554D41CE527A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54440FFC8F47F6C4D554D41CE527A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0131.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: d4d05112-3249-4e5e-ba41-08ddd07379cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OG1lU2U0YzJnSWZTUXdYUmFMbDdybUNHL2dxRkthdHg5bXNIMVNGYkdCaXFq?=
 =?utf-8?B?eTRlS3BVbE5NTjV1QjFOOUwxV0Z4TVRsbEJYNG4wRXJWRHZkSXFqVzNjTkRm?=
 =?utf-8?B?Wnh2UEFxYkVOZFhTRUVlZW1PZlNocmd4Ylp4ODMrSThOaXdVOEdIOTcxU08r?=
 =?utf-8?B?Z3g3b0hrZWNodzZSTVdjQzBNWFBPYWtOR3BXNnhBSy9WZTRDMkxEK1g0cEVC?=
 =?utf-8?B?V1RndXRwWFNBSW1wWUdxa1pNcE16end4VjNMNW9sUkJGeUlLdzAvVFNkanFq?=
 =?utf-8?B?VGZvZTNkYmZhWWd1WnZIM0lPQkovVXRUMHVZUXlOSEt5UyswRDJaSnhMQ1Ra?=
 =?utf-8?B?RStnYzYrWTBMaWFubEZoUXNMQlZabWNoQmpKRE5hWVowZitqVTdEVGp1b3gy?=
 =?utf-8?B?Y29hbXJkKzI4WFlzNTJ2QS9oVFRXdm52M3psSGVSTjlZYzhsc0tJR2NmdmVy?=
 =?utf-8?B?TkYra0VtL01WRFZ4cEM1TUROTTFTNlk5dWxjU1F3dUJMNUFERzRoQnlJc2R3?=
 =?utf-8?B?UEx5YjJVYVdHbVprYzd3L2JlYnhHNzA3L1JuMDM0dC81cDh4Y1hweDJXbFBw?=
 =?utf-8?B?RjVjRmtzNktPQWdrMGVINyt4cW5PZ1oyczlxbzMvTnVic0QwZ2trRGtoKytr?=
 =?utf-8?B?eGl3b0pJaHZUZGxETUxuZEw0NUdaZUIyT3ZZNDRhU0xhTFJVdENQWVJyOEZr?=
 =?utf-8?B?ZmFBcGoyb05pckQrQk9IeGtBRkI0MWRsYTRDMmRkMnZaMWJPMUZSRGdKRWtC?=
 =?utf-8?B?MW9hQmlueWhlbXZMcWdPVnJQOWVmQXIrY0p1UG9sK0R0UHUveHJaRGhybVVx?=
 =?utf-8?B?ZG1xTm5mdUk1MVVpR3R2Z1BTZGJ3bW9qNWhrTjdSbVlJMXY5SWJZOXNkNTFy?=
 =?utf-8?B?bktKT1M2bXp6MFdaK3l4b0U3ODM2NU0yamJPSmdoMkhHVnk2dmRpa3lCOEFz?=
 =?utf-8?B?Rjhac1UvTDI4ZE1UbEpHQ2FNT000MEo4ZFdvVnY3U2xmeWR2L216ekNST2dx?=
 =?utf-8?B?eEhHNG1FSlVvR1ZRNmlveFB5cHRVVjE4ZEYrcXBucFdUZ1puWFM3S3h4YUh4?=
 =?utf-8?B?elFoazV0VkxlaTNkOTZmRTczOUpWUmdGQVRDaFR3ZU1LcGROeHlPOElTaDdM?=
 =?utf-8?B?NFk1Q0JSQm00ZzNyL2swQmZpYWhJSnpSWWRUYzcwMnZ1eWkwZjBzTEV3TzRh?=
 =?utf-8?B?L0Jma09YREIwUGUveWVsUVZpczY1WEZpSXk1NzdBSjk2Ykp1LzkzV3VtZ1B0?=
 =?utf-8?B?K2pWVkFDLzlHS0pINEhIODlHSmd5WENhaWx6eWRnQVJCWVZZRllyeVphRkt1?=
 =?utf-8?B?dzlhcHhNWTlFZG9Sc3NZYnVEdzRCRlYwOVNQNldCaTk5dkxya0s5SUduL0Ew?=
 =?utf-8?B?SzR6S3diVC92anlCak0xSnRpTVh0K2ZWVXo5Wnk1MEpxVDhnUGlqRDJpN2tF?=
 =?utf-8?B?dlRFSFJrZGtRUm45ZDRXRmJGVitPTW1ha2krVjhNU0J5ZmFDMURZWG9VTXVx?=
 =?utf-8?B?KzV3eVc0NlNpcnkvNFpQVTJUSWxBZjU5NklOalZLTXRyQXZqbXJrMHJ1M05D?=
 =?utf-8?B?VVdOejVuQklLNDNid0I2VUhHSGhzbkRDaUFPYkM4bTMxTXI4dGEwNU80YkNM?=
 =?utf-8?B?VlhKcG5INHJzcFFGTjB0YjRUbk1uL2wzZi9OWjNieFpEVk9zc0NwVU5QRHdu?=
 =?utf-8?B?bXQwMjdweXNmRE1ud1B2NWhhMGpYeXlrdzByQWVtNWh3NnNVK0ZOKzJiV00w?=
 =?utf-8?B?UWgydjdSYm16M0VReWlQbnFOcXlmZHZ1bCtTNlZBSFpQeFV0aDNEWTdtdllJ?=
 =?utf-8?B?QXFaN1RJcnl5WUdNM04wZEZxNDh3a0hyRVV6U0l3QXNoM252aXFpQ3NwVngx?=
 =?utf-8?B?bjF5WnEwTEVYdXhYTGk5cndod2VWZll2M1RNYXFKbG1kMy96eTlkamdpeU91?=
 =?utf-8?Q?1Ci8V8LbPxM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anlhbkRpQnRHZWt2Q3kvNnVxYjAzYkd4ZHUzTXR1bkV2L3c1NUhzS2xEYjkw?=
 =?utf-8?B?R1BUQ1U4d3NNOXZEa2tXUW92M1NUMDl1WVMxZlVaUWFiM2k1Zm9rVlg2dmpN?=
 =?utf-8?B?WngrTnoxYUpRUThMN3BDZ0QyVlowekVnYTBvek5jc2R3NnRYSm9jT3NiMWRl?=
 =?utf-8?B?VTVEVE9wVmN0RHV4QXBjUHcvOHFVRlIrMFE4OE80NUphL3FCa29LVThQYXBq?=
 =?utf-8?B?eGVEU3BXWE5SRDdXM2hzR2c1YitteDN3R2QxU3NzaW1PaXcycGlLTVdZWnBR?=
 =?utf-8?B?T3l1d3RRbVZUMkJ0c1hZRmpvbUgxZ2lVZXNNbitSTDV3OWl4Y2tiQm5yUS9U?=
 =?utf-8?B?SDg5ZExKWTdrNG50TTdhckEzYUtVZGNuWDhqeTlNenFGRVBRcklOTWtoazRL?=
 =?utf-8?B?YUJQc0M0M25mYXR2NDdYTkk5bmlJOS9HQ3hjZGJzYkxwZ0NRbXZkOEQrYjAy?=
 =?utf-8?B?enNBR3ZNV3N4NWJ4bVJyZlM3RUNzeTRRZ0ZSUC9VZFdxOW1lN3dIV2w0RCtD?=
 =?utf-8?B?OTNJN2VKSDY1emE2SGVWdW4yeUtGeU15ckVreUNCZjlUZkFQU0FCRmlDekMz?=
 =?utf-8?B?S2FOMDRVb3F4UUdzZFRDZ1JSRWlBN2J1K2QweUxKWlB5NjhoRDFjMjVvWUxk?=
 =?utf-8?B?UkVQQ1F2Wit1YTNUUUVJa2JtSkZDMHd5VmhwbG1MeEx3WGVoMllRNGl5Y3Nl?=
 =?utf-8?B?Q0dHQ3ZUZ2UralI4U0pac3BZMzJwUjhoZ1Z5MWlUWkgvQ29TalNHVForNVl3?=
 =?utf-8?B?cVNxTkduTW5LRlFIbWlxVE8xLzltb0ZmeXV1WG9FMHJac1pNOThDZ2p5eFFI?=
 =?utf-8?B?NENBVUdrM1BJT3c3OVRNRExDbWQ4d2NTRDNsNmo1NFQzcCswVW1DZWo0ZW9K?=
 =?utf-8?B?Qy8rS2kwTnE4N3dKKzNsVjRYMDNudVFRUEJhOXc3K0FMTXMwRGtHS1YweFo2?=
 =?utf-8?B?VUUwMDNac1k3UVhKaUUwMEFHczZNUnk0NE5Qb1RRZmdnK3RaeXVvaVd4Sy9j?=
 =?utf-8?B?L2lXay9wMXE4ei9Lb3FkeGZ1bTdCWVVpcVRyYXZDLzFEMGJxV2JTbFBqUTVl?=
 =?utf-8?B?MkpRNEl6NXdvWmdXeHo2ZklkeUNpa210S0Q4MnpCZzZsbDk3UnFwc3EzNkoz?=
 =?utf-8?B?UmFyRS9pbXIzZTZwc3ZUN3g0U2Q4UGZBV2VWUTZUQlJ1OGV1Q0IxOEJETHh4?=
 =?utf-8?B?RHYwN0xSTVZtQnlSRzlzT0VoNVpKbVAxTUZTZVF3M3RjRURBYmVKTklQSWNE?=
 =?utf-8?B?TkpqUEhCNHM0UmVEa1ZjQS9RbDVxYkoxcS9HdjBURUVBcWp2U2hqaFQ2VWJo?=
 =?utf-8?B?VHdOanppV2lQanh3U0pSelpFUkRFbVBQcmJOQXF6WC9qT2k3ODdPQ3NmYll5?=
 =?utf-8?B?ckJDd2t4TUhlK3FqcW9SZG5yczN0OXlXY0NiZC9hTEhXeG5NR1JvWjFibHMz?=
 =?utf-8?B?ODBwMWxVTXVwbzBaKzQvaGFsdUN2MGFzSU40ZHFKYnd2SVdqWjVqOGhranlW?=
 =?utf-8?B?UWNuQVVycmhvTGhZU3VocnZRNlRUTy9VNlVBRm5Vb1huanlpeWNRek9mTXNL?=
 =?utf-8?B?RE1LVm9xMktKMForL1lTT2lTeGVDbGxIRzkycC9OTzJNUTBJODJYOXBXUHhL?=
 =?utf-8?B?cmQ5K24yQTYzK2swcDBwRnkvamtvR3kvOGsxVktWMlhrc3hTK0o2OGE3VDN5?=
 =?utf-8?B?UTFoZnE3OUZjNUhSWFovM2g4a2RSdU02ajBkWTFoTkN1Y1hBWllCNWFuOHdr?=
 =?utf-8?B?aTA0NERSSnlKbWkvZDcwa3Y2a1Vmb2xhV3hYdkdZUkd3V3pPSFFsY1VHcjdW?=
 =?utf-8?B?TW1OY1h4ZEFpYmwyYXRhU2tkTXBhUW4rL1ZlNHZMVDZNaHdzWUNwS0dmQVVq?=
 =?utf-8?B?d25BMmE5aHVlbjNyaVJyK1BWSWdKVUk5YkZBNnE0WGl1UTN5TFBNOERJZWZr?=
 =?utf-8?B?MWRjY0tjbU1qeE5tL1VEdXVuOVhpKzdnRjV3VklNdDFFUFNvNU9YSlBhbTJ5?=
 =?utf-8?B?R1ZHbm1HeG53eFdPUEkxeGRBR0wzM2FjT3RKQjlSb1l6VnpzbHYxWU4xMk55?=
 =?utf-8?B?UVdsOUhlQjJ6Z3RPS2l5Z1VrOFdocmw4WDRZS1RzQUZ5OWI2ZysxMW4wTUMy?=
 =?utf-8?B?WDNibnY3eWZRUlMrUkNyeEZTYkVIMWtvRnFTak5OUTR4c2g3UzBFRzVyemlT?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d05112-3249-4e5e-ba41-08ddd07379cd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 20:47:34.1030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nj/watsmMkm6+uajeR8WY+39CVnEciBUP+rM9iHb9P3Hea7oFYBf2/3gpHO8Lk8zFYkiTIqKIZj2WXiDdJfuqObU7/RPNBHrXOxnqDyBx2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
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



On 7/31/2025 10:14 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Thursday, July 31, 2025 12:47 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH] drm/xe/pf: Skip LMTT update if no LMEM was provisioned
>>
>> During VF unprovisioning, if VF was not provisioned with LMEM,
>> there is no need to trigger LMTT update, as VF LMTT was never
>> set. This will spare us sending full TLB invalidation requests.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Some nits below, but I'm not going to make any of the suggestions a requirement,
> so:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 11 ++++++++---
>>  1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index f00cce81f1ff..692b174dd5b8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1434,8 +1434,10 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>>  	return err;
>>  }
>>  
>> -static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>> +static bool pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>>  {
>> +	bool released = false;
>> +
>>  	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
>>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> @@ -1443,7 +1445,9 @@ static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_confi
>>  	if (config->lmem_obj) {
>>  		xe_bo_unpin_map_no_vm(config->lmem_obj);
>>  		config->lmem_obj = NULL;
>> +		released = true;
>>  	}
>> +	return released;
> 
> NIT:
> Storing the return value of this function doesn't seem immediately necessary,
> as we could probably just return the value directly as a part of this branch:
> 
> """
> 	if (config->lmem_obj) {
> 		xe_bo_unpin_map_no_vm(config->lmem_obj);
> 		config->lmem_obj = NULL;
> 		return true;
> 	}
> 	return false;
> """
> 
> But I had a similar thought in a prior patch of yours, and I agree with
> the sentiment that it may be useful in the future if we ever need to use
> the return value for anything else.  It also doesn't hurt anything to keep,
> so I won't make it a requirement.
> 
>>  }
>>  
>>  static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>> @@ -2021,12 +2025,13 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>>  {
>>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>>  	struct xe_device *xe = gt_to_xe(gt);
>> +	bool released;
>>  
>>  	if (xe_gt_is_main_type(gt)) {
>>  		pf_release_vf_config_ggtt(gt, config);
>>  		if (IS_DGFX(xe)) {
>> -			pf_release_vf_config_lmem(gt, config);
>> -			if (xe_device_has_lmtt(xe))
>> +			released = pf_release_vf_config_lmem(gt, config);
>> +			if (released && xe_device_has_lmtt(xe))
> 
> NIT:
> Same as above: storing the value of pf_release_vf_config_lmem isn't
> immediately necessary, and we could just pass the result directly into
> the if-statement:
> 
> """
> 	if (pf_release_vf_config_lmem(gt, config) &&
> 	    xe_device_has_lmtt(xe))
> """

I'm really against obfuscating the code just to some save few characters/lines

modern compilers can deal with that and our priority should be clear code

making complex if-statements with nested function calls is not making code
easier to understand or more resilient to mistakes

> 
> But, again, it doesn't hurt to have, and it'll be useful if we ever expand this
> function in the future and need that value, so there's no required changes
> here.
> 
> -Jonathan Cavitt
> 
> 
>>  				pf_update_vf_lmtt(xe, vfid);
>>  		}
>>  	}
>> -- 
>> 2.47.1
>>
>>

