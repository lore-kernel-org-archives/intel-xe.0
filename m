Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE00CA0FE7
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 18:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E375310E530;
	Mon, 25 Aug 2025 18:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GuU61BqF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893BC10E531
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756146788; x=1787682788;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=riMnVize4WsyrKdk4BSdeeFLJPcIeSLVTh/unxzuSbo=;
 b=GuU61BqF9V8a4NtjhFLuXqzg2upNvSlDuczDBsE9kd9VUDKjwDCJd9e9
 LgSt2fLGdkuD7cBCQpxhSXHIf7P3FAFwXOjfoQcI1LjSPd068T3VlW22s
 5dN8r46wkdq1r7Sxx8Fn7ZrhdA7mJaGV0PYtQCO7VoWTSzula5IeApJUD
 E0YPKH1r5R1+Jit5Rn4NyaQMlZtDGFdZ3y1xvkhdPuCmUm+/U3HOogGN9
 HgcsNo7/UcQTZ7hynfhqnHrAvsc7A4CSAm3qQIq/ams0D4dDOEEBKYhmb
 prt72D8zHJv9wBPOmJMLBuZvKxuMebCrmsPjkogNfmVAU9YL4EiebESKa g==;
X-CSE-ConnectionGUID: F4Ds5q4tSfmWlLrsTp7Erg==
X-CSE-MsgGUID: v6cfGqKyR/KMpMVTUUKB4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="62014137"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="62014137"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:33:08 -0700
X-CSE-ConnectionGUID: cNdSQvC8R8i2PgRMPDTZ6A==
X-CSE-MsgGUID: 2u0LzeZhQ+e3DcXyUvWaSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="169759860"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 11:33:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:33:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 11:33:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 11:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc50WRNDS2k4i0JoGBwD8GXvYr2pJF8I98OkgIpr4aLYS63x0X4kJNI4mY9dyqCNEhqcA3+j9k3hmJoVGF+QHQGbeSjc7/GjI4xESLBwwS5k7+Jc0AdlrgQh1DlqOBiNihQ5MXJnyb/1sEgQL+aG3AOEyoQllZA3WTvM6FXBIzzEKmGvLNDoWR7K+c1e2Bq1hbwkbNTPgJJS/YTm22tsrbO2q0p/r4I1VwipDsN842/V5oBE+6N9Ri/wH7X312LjxD9lN/47iM64iJp5G3ByjzjK6WflfsojemDW8L8OBqtHWXDHZpJMmcBAKrvvknUaJR2RjWWAbM35mLGwLt5WcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Mixj52hwuNsLoWbv13Z4V2RNAQ4KaNORh1FP83VQSA=;
 b=FC/i7xOGkQXtxiBxcAoObZ7zg+BR5rQIj+5ivdIU5EkzDRKteKgYJiJk0sRdUf+LnmXtTGF32V8c0Wo9CdXCeqO+KBBHqmcdiutjunU0mohvsQM9hN4lassGpiQoqGHhyUF/YgExOKFAJLSnWVMBjYXGvWbCthKNE8h9f5V+BketsLKFIjQl8YuPHuUq8AYfCx7xaiEafzdXc5cnz4EYWW038vd8UDIW4RAZxFGOGEbCYmqOwIppqL8Mqt+JXTYoyM4H2CGXs9DP2ZXhkwqvp2iH9hEznVCIVeZuuhAAp/ZB2HAXxmyHCNN8nqZ50r3dQsucj6JOtxKAN68+gwgzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Mon, 25 Aug
 2025 18:33:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 18:33:03 +0000
Message-ID: <23ab9f6f-2169-4fec-95d5-c9954f5d80af@intel.com>
Date: Mon, 25 Aug 2025 20:32:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/xe/kunit: Introduce xe_pci_fake_data_desc()
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250801181350.180780-1-michal.wajdeczko@intel.com>
 <20250801181350.180780-3-michal.wajdeczko@intel.com>
 <h77lujxjdbmuoiq2iswniv5noov4zrigsjfwcdaxau2m2wrjo6@g5jbnx5gcmmj>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <h77lujxjdbmuoiq2iswniv5noov4zrigsjfwcdaxau2m2wrjo6@g5jbnx5gcmmj>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0023.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: a2439453-62f3-4265-7155-08dde405d3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmNvczVVYW9rMUczaldjK3JRNmtvQnFFUXhTallZUmRXRHdpTlpSMm9ZRzVB?=
 =?utf-8?B?NThQcUJaQTdoRXJSS2Roai9OT0FycktoQVhGS2JMY1JSalg1NndFTm0zWm5I?=
 =?utf-8?B?TXU4Y2VWUnBqVVJ3RHRRVEhWWDFEUWo1ckhrb0NjRGFUaXF6VUVTQ2hlaFpH?=
 =?utf-8?B?NFdiVEt3NFNKMUYzOFhjdDFsdkMyMGtyN3ZML1lhMmVNcHdnbXBVSWs0WWtv?=
 =?utf-8?B?cStBam9TNWcvR0VvQU9hMFU1SUFnVEtYWDgvMDFMZzFON2dQaElmZElEZTFs?=
 =?utf-8?B?NjlUaHIraGRkU3V0WTFYRWxZaTVBRXhKTmF5bHNFcVdHVG5XSmszQ1BDVk44?=
 =?utf-8?B?dWlPdlBtYzQvMHd4bHpGTzBtMU9xcXJaWUpTdFJzQ1BnMGFpUlpxTVlYeURp?=
 =?utf-8?B?d2YzUzhSTWZZRVp4Q29SbllrRHorOWNzTWF2ZkZsdGJRdTRQTXV1ajMyZ0dq?=
 =?utf-8?B?d241Tzc1ZkRtZjROV2JrLzk0Y0ZzT29qYWYvUWU3bVd3M25wZkJHbzRDWlg2?=
 =?utf-8?B?L1pmcGNJYVpDL1pYYm9XVXBMTGo4RXpBeTBzclhVMDBnMXMxMWJsWDlEczA0?=
 =?utf-8?B?dFZ5NVNXTWhYblZzSU9GVVRUZWp1ZVRhcWRiUWprUTBWczBLTE9RaUlGbnND?=
 =?utf-8?B?TTM1Rm93Rkc3OFREV1BiNCt3U2F0OWV5cHdwWU53QktMZXRIMUhUbXJmeHJp?=
 =?utf-8?B?dzNOQWhIQkVNSDh1ckRkUmhEdTEvcllmbUhnRGdMaTBtd001dUtWRHFwcGJv?=
 =?utf-8?B?SEhXRG0zYjNlU3lLZnhSdlQrOFErOUdmenI1MkJ4R1ZweFROU2FlWHF3eHdF?=
 =?utf-8?B?MDJVZi96MFIzS3I3ZEdGVG9PMnNBczJXcnMzWk9OdDBHQlpBRUZ3Q3p2Tkww?=
 =?utf-8?B?NmZScFU1MGNWZ3hEV3JoWi80b3BFSVJFK3hUejRZcCtjK1JCcG1mYXFERUNo?=
 =?utf-8?B?cElVT3ZDaDZ2dHJrdFBFQ3lmL2pZY0NmMWg5RFVBaUtvMVVmSFFFR3pBTHlw?=
 =?utf-8?B?dzVOU0xncDlaaDhWbVhIM0pPVW1VNEE0ZVJaQ2FHMWUvcTFXaFdjOThZRnhN?=
 =?utf-8?B?UGNQbzJIUUhablZPelczOTc0UmNFY25uVjRhd05iOVR2Y0NGTG1VVmM4Z2tB?=
 =?utf-8?B?b2R2U0VnRG9ueFdOa09xb1ZUYTdHMjNkUzZIdlhiUXhGcjVZM1dYdFVoOHRG?=
 =?utf-8?B?MEhoWGxIYWZYL08vKzlDTGdGM2wvenNXTzZ4NXRWeFd0TEgydDFMK3psSUNI?=
 =?utf-8?B?bnd1amFXUTV3T0g0NkZKOG1KRGtzenlPakRkNS92bXljN1pudk5QS1lXZVBq?=
 =?utf-8?B?YVBrRXNiMkdBeVV6SkZJdm5uL3FxdjNhVW9HOEVWT3V4dE1Cd29tK2dyVmQx?=
 =?utf-8?B?Q0dEdzJWbitDcnIweStqZHhqZWxUVlJzTDEyaVdSSFl3STcvQzhpRlFCTTR0?=
 =?utf-8?B?L2lQdWRhNEFwaTR1TzltQWFKa0lQZlcxRVNRV1hHbDFDd254eEtZUS9JWXVx?=
 =?utf-8?B?dVBuWXQyNSt2QXNTWlBwRnpZUElJZ204UDV2MElWbHhUa2d2ZzlRNVlRYi9E?=
 =?utf-8?B?a2IwU0pFSFF5Z0l3U0pBdWIvbHJkMTdGTWpVZm1RUnp1NjlqWVJsUTlSd3lL?=
 =?utf-8?B?aHpuSWt3TVE5OFo1bDBWbmhsTk1MQzEwK2NaKzBVU0JoOVRoaDNQZmVxQWwy?=
 =?utf-8?B?NkZEQnZ1ZzJzcy9HMUJ3SStIOWg5YnljU2ovRG85WnE1V0ZhTGRHait4ZTUz?=
 =?utf-8?B?RE8raVhBWG1pbklPZnZkMlRGVmk2d3B2cFNDMVlQNnBlL3NBbDB2bEM5a25O?=
 =?utf-8?B?T1BSbnFQd3FtUktocG40NjhUdktMbWZFUjE5SmVXSXBXQ0FIemNXRjFyNEVV?=
 =?utf-8?B?eFB4V2l6YnpJaldPZUMzSDNlZ244K251M0ZCN3lBSWVMOHRZbC8wNUpyUWZ6?=
 =?utf-8?Q?P60/bkOF5sI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGxHSlh4cFNwNVlBYXFYQm9zeUIySjUvOUZxWnVKcHBVRTBPQkU3bDRybG1l?=
 =?utf-8?B?b2N5amJSMDhuVkh2RU1US0RuUzFSemxWS09hSXQzY0xkNHRCV29KeXNVQ2dZ?=
 =?utf-8?B?OVp3a0tpZTlpZ2JITnQ3Ny90eDRRSWNjVlhzdEtOWWJjRDdFbm5wL21wcGN3?=
 =?utf-8?B?V1k0NG13ODBIU2ZXdG0vWndyRHROck9aazRibzBOVEhBSGpsUkJaMlZBbVVU?=
 =?utf-8?B?WTlHdlI5OU1LakRoZk1DZE5hZTV3NmZkcm5KMHhRaDJOQy84eEY0VXA1R0Zn?=
 =?utf-8?B?b2JlV3RQZGhnTFVTcHlmR1lQNERtc082UGcrdE9hNUpjWmVuQnU1citLeFJ2?=
 =?utf-8?B?NUNJa1RWUllCNkFyQ1pSeEpHa0V1dVJLYkR5NzlOMWVOKzlzd0QzMlo2MVhY?=
 =?utf-8?B?ZDNoUXFwR0NSYTdoYTJBRjRoU3JCaGo5K1doSU5EamQ1ZjZLUUhiY3pGdWdB?=
 =?utf-8?B?UW1WRTJjbEVuUkRVS3EyMEdLbzkvV2dPaTVXVUM3RjFGRnVPSlhLbG5TNVZ3?=
 =?utf-8?B?ekF3ZHV3Y3BDTTRCWXdlSzJVYUhuQW1wdThydnd3ZmdGSmpGTHBRc3JTd2hC?=
 =?utf-8?B?THBSUmd3RTF0ZzErblhkaWpmaURrcDRKcTMwZkgyZHZEWHl6Y2czUFlXL0FC?=
 =?utf-8?B?UkdnWmJjYVNsTVBnUmpocmpBMXhVLzN0VnFBeE1FbEpadjRZaXBCbXZQM0U1?=
 =?utf-8?B?Qmg1aCs3dEdJczJpZHRnRm5IeGNBa1ViSXJpRU9BNFRSa3RIYlFOZnkzQ2Jy?=
 =?utf-8?B?MWxUWkpEUjd6TGllV2JmdnR2WjhIUk1raU8rMy9NSHlFdkVNS3dZdzFvTDBO?=
 =?utf-8?B?SGs0OGYvN2NVUk5lMXcydXdyQWJOazM0b0dVR0NWN1lZUTUrWHBkUnNTamx6?=
 =?utf-8?B?ejRsRXlwM3AwTm01bzNTcENLSlZXMlFsTVZEZUVBRm11YTlLcVBqRXNla3Q2?=
 =?utf-8?B?YVZ3MS82UDQ0TDVEeEZSUUJqSE5hV1hPZWZOcmFtYkVETG9EZ1RDMFl1ZG12?=
 =?utf-8?B?TkRhM3B2SldVRlNkOG8rYkhXaEJVRncxS1EzbExzRG9LcEYwUllzRTZOZWJ6?=
 =?utf-8?B?OW5QdE9neWpUeWhTSjdjbnBQKyt6a2NscXVkc1B5Q080cEdpRys1MEp4MFB1?=
 =?utf-8?B?L3VMcFN1MHgzdTh2d3pGTlI2SWFsZitMais2S0NVWm1jNHZjZHVaNkdvdStp?=
 =?utf-8?B?TzcyaG9HL09oMEU0b3dDdjB2TkJGR0ZLaWo3eFpzR2ZOL3BBRlBRSCt5d2lR?=
 =?utf-8?B?U2thMGZNa1d3aUdkb05NQ2RsU2lOODdyVEdVMlhBUkpzQW9uUlRMOFhOS3pF?=
 =?utf-8?B?YUtRZXFkSXBWVU40NXQ2OWRFTTBydk5HWk02eEhDVzduZ2RrQXhXZlBTQlA2?=
 =?utf-8?B?L1l1RXVReFphN1FkT1daRHhHZmNjOHhZOVp6dmkzNng3Rjh1bFdQR0xyd2VE?=
 =?utf-8?B?M05rRjFkdEFiTDh2U3lWWmYxOGYrQlVaNnhGLzZWa3Eyb1VSbFd1QVZXOXBh?=
 =?utf-8?B?UG9EMzNpL014KzZ2RytHbmlTOVdVNVE3MjJmY0ZnbmRoWXJtUGdXa0VWWDBv?=
 =?utf-8?B?RTM0cmUvZkZPOXY3RmE5cGVESUZHRzhBaWQ0VnN1dXJxcHhkNmdMcnI1K0Vq?=
 =?utf-8?B?Q3lDWTFraUUrT3NNL1duSko2SzliNEowYlJyVzRiTzRhZENNVVEyTm1vRHJv?=
 =?utf-8?B?aG83ODgrZUplbFd3eEoxUERxRnZkN3htUDlmY1NtNVFIWGYwRVBXZ2twMk1C?=
 =?utf-8?B?SXdXS0psekRnSmtvQVV2L1lKUzVpT1cxaDYzRE1TelV3UkU3OHRmZWhXMzBn?=
 =?utf-8?B?S1hOVEVtOEhJZVcwbSszaDV5TGl2WVhDUkp6YmNEUXNOT0o4bU5rTFVJSWQ4?=
 =?utf-8?B?N0dLODhOOXdCUllnSW9kaEg2VG5NNnlwM2hZOHVpUnZBeFJWcGFqQkg2eGY5?=
 =?utf-8?B?eFlybG9XSkJ0dE1DOXQwOGRpWXRaV1hSRmdOZitCaEtsREFBaHNjcHRob1Bn?=
 =?utf-8?B?MDd6RWhZL0pBMDJLMVhaSmErUko5OXVzZWlhbk4yVWdJcUR2WGMwSURKdndR?=
 =?utf-8?B?ZE9YS2IwdTR1bzNxN1pSaXEwRTBuaVJqV3gvRmNHdVlYZmVzSllHSVllam9U?=
 =?utf-8?B?bzhySGZBcE9NNkQzTXE0OC82Tm8zR1BDL0E4eHZSbmN2Q3Q1NVVBZEp2UnBL?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a2439453-62f3-4265-7155-08dde405d3b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 18:33:03.6701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/Tlrip3jCpszKGwMiCTHRYbTeONe/pgmV/VJT87XnNJHWa5Dz+5BHBW5jPVtgmIf0TuL9godIhWJ81tfqstCoj5MPKj/S2vFcLQzdQWfuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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



On 8/18/2025 6:18 PM, Lucas De Marchi wrote:
> On Fri, Aug 01, 2025 at 08:13:46PM +0200, Michal Wajdeczko wrote:
>> We already use struct xe_pci_fake_data to provide custom config of
>> the fake PCI device and soon we will be using thios struct also as
> 
>                         ^^^ typo
> 
>> direct parameter for the parameterized Xe KUnit tests.
>>
>> Add function to generate description based on that config data.
>>
>> For platform or subplatform name lookup pciidlist which already
>> have definitions of all supported platforms.
>>
>> Examples:
>>
>>  TIGERLAKE
>>  TIGERLAKE A0
>>  TIGERLAKE SR-IOV PF
>>  ...
>>  PANTHERLAKE
>>  PANTHERLAKE SR-IOV PF
>>  PANTHERLAKE 3000 3000
>>  PANTHERLAKE 3000 A0 3000 A0
>>  PANTHERLAKE 3000 A0 3000 A0 SR-IOV VF
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> drivers/gpu/drm/xe/tests/xe_pci.c      | 101 +++++++++++++++++++++++++
>> drivers/gpu/drm/xe/tests/xe_pci_test.h |   1 +
>> 2 files changed, 102 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index 81bc86647499..5c6403785984 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -12,6 +12,107 @@
>> #include <kunit/test-bug.h>
>> #include <kunit/visibility.h>
>>
>> +static const struct xe_device_desc *lookup_desc(enum xe_platform p)
>> +{
>> +    const struct pci_device_id *ids = pciidlist;
>> +    const struct xe_device_desc *desc;
>> +
>> +    for (; ids->vendor || ids->subvendor || ids->class_mask; ids++) {
> 
> why ids->class_mask? for xe we should never match with vendor set.
> 
>> +        desc = (const void *)ids->driver_data;
>> +        if (desc->platform == p)
>> +            return desc;
>> +    }
>> +    return NULL;
>> +}
>> +
>> +static const struct xe_subplatform_desc *lookup_sub_desc(enum xe_platform p, enum xe_subplatform s)
>> +{
>> +    const struct xe_device_desc *desc = lookup_desc(p);
>> +    const struct xe_subplatform_desc *spd;
>> +
>> +    if (desc && desc->subplatforms)
>> +        for (spd = desc->subplatforms; spd->subplatform; spd++)
>> +            if (spd->subplatform == s)
>> +                return spd;
>> +    return NULL;
>> +}
>> +
>> +static const char *lookup_platform_name(enum xe_platform p)
>> +{
>> +    const struct xe_device_desc *desc = lookup_desc(p);
>> +
>> +    return desc ? desc->platform_name : "INVALID";
>> +}
>> +
>> +static const char *__lookup_subplatform_name(enum xe_platform p, enum xe_subplatform s)
>> +{
>> +    const struct xe_subplatform_desc *desc = lookup_sub_desc(p, s);
>> +
>> +    return desc ? desc->name : "INVALID";
>> +}
>> +
>> +static const char *lookup_subplatform_name(enum xe_platform p, enum xe_subplatform s)
>> +{
>> +    return s == XE_SUBPLATFORM_NONE ? "" : __lookup_subplatform_name(p, s);
>> +}
>> +
>> +static const char *subplatform_prefix(enum xe_subplatform s)
>> +{
>> +    return s == XE_SUBPLATFORM_NONE ? "" : " ";
>> +}
>> +
>> +static const char *step_prefix(enum xe_step step)
>> +{
>> +    return step == STEP_NONE ? "" : " ";
>> +}
>> +
>> +static const char *step_name(enum xe_step step)
>> +{
>> +    return step == STEP_NONE ? "" : xe_step_name(step);
>> +}
>> +
>> +static const char *sriov_prefix(enum xe_sriov_mode mode)
>> +{
>> +    return mode <= XE_SRIOV_MODE_NONE ? "" : " ";
>> +}
>> +
>> +static const char *sriov_name(enum xe_sriov_mode mode)
>> +{
>> +    return mode <= XE_SRIOV_MODE_NONE ? "" : xe_sriov_mode_to_string(mode);
>> +}
>> +
>> +/**
>> + * xe_pci_fake_data_desc - Describe struct xe_pci_fake_data parameter
>> + * @param: the &struct xe_pci_fake_data parameter to describe
>> + * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
>> + *
>> + * This function prepares description of the struct xe_pci_fake_data parameter.
>> + *
>> + * It is tailored for use in parameterized KUnit tests where parameter generator
>> + * is based on the struct xe_pci_fake_data arrays.
>> + */
>> +void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc)
>> +{
>> +    if (param->graphics_verx100 || param->media_verx100)
>> +        snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s %u%s%s %u%s%s%s%s",
>> +             lookup_platform_name(param->platform),
>> +             subplatform_prefix(param->subplatform),
>> +             lookup_subplatform_name(param->platform, param->subplatform),
>> +             param->graphics_verx100,
>> +             step_prefix(param->step.graphics), step_name(param->step.graphics),
>> +             param->media_verx100,
>> +             step_prefix(param->step.media), step_name(param->step.media),
>> +             sriov_prefix(param->sriov_mode), sriov_name(param->sriov_mode));
>> +    else
>> +        snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s%s%s%s%s%s%s",
>> +             lookup_platform_name(param->platform),
>> +             subplatform_prefix(param->subplatform),
>> +             lookup_subplatform_name(param->platform, param->subplatform),
>> +             step_prefix(param->step.graphics), step_name(param->step.graphics),
>> +             sriov_prefix(param->sriov_mode), sriov_name(param->sriov_mode));
>> +}
>> +EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_desc);
> 
> our dep here to be in xe.ko seems to be pciidlist. Would it make sense
> to simply export that instead and then move all this into

while we could export pciidlist this will not allow us to drop completely
tests/xe_pci.c file as we have other param generators there that require
access to full array definitions (like graphics_ips)

> drivers/gpu/drm/xe/tests/xe_pci_test.c? There some potential name

but tests/xe_pci_test.c should contain just test code, no reusable
helpers that will export

or did you mean tests/xe_kunit_helpers.c? but that's xe.ko too

> clashes. tests/xe_pci.c is more to export what's needed for the tests
> than to add helper functions like these.

but this _are_ helpers for other tests, not just the current xe_pci ones
in tests/xe_pci_test.c

> 
> Lucas De Marchi
> 
>> +
>> static void xe_ip_kunit_desc(const struct xe_ip *param, char *desc)
>> {
>>     snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%u.%02u %s",
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/tests/xe_pci_test.h
>> index 32452bd65bff..1195839999ab 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h

btw, this file has the confusing name ...

maybe we should rename:

	tests/xe_pci.c      to xe_pci_kunit_helpers.c
	tests/xe_pci_test.h to xe_pci_kunit_helpers.h

to make it clear what they are for and avoid clash with original xe_pci.c
and xe_pci_test.c ?


>> @@ -24,6 +24,7 @@ struct xe_pci_fake_data {
>> };
>>
>> int xe_pci_fake_device_init(struct xe_device *xe);
>> +void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *desc);
>>
>> const void *xe_pci_graphics_ip_gen_param(const void *prev, char *desc);
>> const void *xe_pci_media_ip_gen_param(const void *prev, char *desc);
>> -- 
>> 2.47.1
>>

