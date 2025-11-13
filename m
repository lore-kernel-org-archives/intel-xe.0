Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B253BCD6E5C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 13:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770D910E81E;
	Thu, 13 Nov 2025 13:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJGR8Egd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C219E10E81D
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763041592; x=1794577592;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=3ozaUVdOq9Yt4DubpCdVLp0mYHSIDSOGiLKBp42Q0AQ=;
 b=ZJGR8EgdXXVFLVuXUxoa6HINbBteZW04B7znLJ2D0FwV4Oyxj1CiAqO3
 +FkDppAmo7lUsxQEfPLkv/4pil56afUYzVFeb+1GMPJozCYCFeGBTTcRs
 yVFsGKTMsmzyvkOJEu3zPBqhNGa2GXuegbv5UhhBa5U1cqrhnYFnXhq5w
 2E1Y4gBYOPOLOTNWGaQWwnuDfKh7D/yaRyUZTF5q1poOexlZ+jdoweHcQ
 Wv+5jm50trMDxVfZ2a3kxpH3YhMbShXuWqskk5fK1atIbxsA3gfCiCqDI
 gzMSX/3l/8fB3BwFf5gci5Qx8Y2ks1V86a1m7fDnmFYiriZdp5DEswsPl w==;
X-CSE-ConnectionGUID: bd4WkngIQbm/8y4z1vpLbw==
X-CSE-MsgGUID: 5Q3IeC9dTy2RWeu2Qpqn/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75730883"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="75730883"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:46:32 -0800
X-CSE-ConnectionGUID: eCps3z0aRamcPOhdY4dRCQ==
X-CSE-MsgGUID: ygj+16/vR2qHjMobaru21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189929623"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:46:32 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:46:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:46:32 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.43) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:46:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcxT+g89eNjBhWY2OwVoVsGLzUcGfYSErMRaHI8eyAmB/yLZArRM1IY8jd6TYPYL37EHlIUgCi1ypp5wk9GwZnyZg5LnKHqiOfNyRbcr1eO5pbSd+l25WF4hRU/0I8QAnL6iolEvUgdLTp730JewK5iOur9kdHT3IWiQQAR6G7unFg4L9b8I5E+DayUEmisZJrsP2kK499oCb2LSU5ENRnyI+T2Ade2eW2z3UJKtNQIJKOnZzYzhf0DoeklwmHjVHmRxs/2iP09AaA/9vv0mYgL9s6k2WAgzuIjDF8tcchra0I7ARfi6e7/nU7nzwkEftEBHHMP/R5DNK97dZU21Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nubPk9KUKwWxBk+S85dV2zB0Id8LFArghtsbG+4O+D8=;
 b=VV95F/ObDtFkXwAq9yGpnQkTlpB+IkaX9838BrTkX6yoVcBIXTXjN4y+MqzlMsAsxUvwiGpicH9e255uONCY5Qt8m/h0WvN7gZhFxW/WfXRLrq71z6TMyfXkli1n2iP008GUZ2qVxc/NitZ3hARgS+8DeMGgV28Z6qaAz7T9PyFzv5F/5v35vTumYZZ5PMeN+2/665b0Se58BjcPP+nCLHFsZBPkfQjz2Eu1pwRUV2tepj9glfJk6jCqnYwx1vtHwaQ18evjHc8VryiPLeD/kFXshLjABi+PcTuBOiP7viOW/4aRPjXx5tTuP4cB823IwaNKzUA6tFIidSL6N3l/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV3PR11MB8742.namprd11.prod.outlook.com (2603:10b6:408:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 13:46:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:46:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-45-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-45-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 13/30] drm/xe/gsc: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 10:46:12 -0300
Message-ID: <176304157269.3698.3001533226149805199@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV3PR11MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 07afcbc2-399f-4d18-56c8-08de22bb0c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXVsZ0tTVTQ3VFFERWFiOWVSV2tmWXVWbGVSVnl4K2ZGL040SzQrWURZUHE0?=
 =?utf-8?B?TG9qRW0rTVhKaGptWnErb29MbUpncWVISUIxYW1uOTBZT1kzQVBScm94RXE4?=
 =?utf-8?B?czdOL2pWL09SSzFTQmpBQmx1aWt0Mkp4R1g4VENsTjBRTk1DN0U0VWtWOVRV?=
 =?utf-8?B?WG1OTDBFWUN2d3oyUU00c1dnazhjQ09tWjBzbWZiTTRDNU5tMmxqZzEzMVNT?=
 =?utf-8?B?RGxIV3lERWhNSmNOMkFUak9nS0xUbEJQVVhwS1BpdTNrRHlsNU5wL0UvUWkv?=
 =?utf-8?B?RHhORWlCQzVTYjhDZ3I0N0hEcjlFQkFIbjZVZ05hZnJra3k1WVdCd2NESCtk?=
 =?utf-8?B?bTJvSnlsTGUvdS9QdHBJMWs4RFZPWGIrcWtENkNnekRDR2s4TmhEMEdGN1gy?=
 =?utf-8?B?Y0lOSVdWaXEvUy85TWEwTmNTUTM3dU1GS3h5OUQvRkhuQzBuZ3RVWmVvYWFn?=
 =?utf-8?B?Q2JCN1RJRlBFdWtZZjdIMWhUdnJhYVJzMDBLOXlEOFY5Rll4c1FUYkZrQjh2?=
 =?utf-8?B?NDdXcDlTREYzc3JKdjhYOEs3UDZtemQvY2tCV0Z4ZE1CM0tkQ2h6SFp3SWxn?=
 =?utf-8?B?NXRzM3prOFpwREhIeUVDZ1BUclI1aTM4bGw4MlV6aXFGTXhlQm1HNXNldFV4?=
 =?utf-8?B?a1ZjRVJraGNLUTJFQXVhdk9yS2l1aTVkWmEwaTk0NXppbmVtNUVLVTVtY1N1?=
 =?utf-8?B?Vmh0ZlM4T05kOEY5a2NtcEQ0eUR6MSszRnVWbldCT2NYdU0zU0xoZmFNUUhF?=
 =?utf-8?B?aFZvNHZHRDd2NWswM1E1T0cvZW52dEJGRndWQ0U5dWgxc0tJRHYxVkdtdGc1?=
 =?utf-8?B?VVBkOCs0aGM3VlN4ZHBqdGEzOHN0NDgxT2pCZG8wMm9WeVArRGE1MS90a01x?=
 =?utf-8?B?V2IzYXJlaWgvYWl1T2xlQkVrWDNucGZPM2JkNG9SUW1uRFJ4dEZ0V1Rrd3BO?=
 =?utf-8?B?ZzZ6UjI5bG9kYlRkckZRV1JsMGtpbFJyZ21LVFowaEw3c3hOWXA5UENBU0Zz?=
 =?utf-8?B?eTJoSm93QW45TW9yOTBLV0Uvd2NjZ0NRSXhqSVFiWXhwNkNhemdtOThQSVdl?=
 =?utf-8?B?cTZJUmcrZHB2ZzgwSFFHMURheWdWaFZaWFphNk1tckVkQ0hnUGlqQklBUEU2?=
 =?utf-8?B?RnNqdnYvKzFyN25TUk05VUt4U2ZLb25EQXZhOGNqNmdJL1JRcy96MWJzam1U?=
 =?utf-8?B?N2FvRklsSURCN3NvV1Q0NWRoNEZIYlVuNXlZSGJVc2FYWGliUmtPRmdRbWkw?=
 =?utf-8?B?dGo5WkkzeGc5SE5obk1Eek5wYzVDL1dVS0NmV1IrQ3JJWFpLWDJaUzNzZU9O?=
 =?utf-8?B?akRGbTdhSDNaK296MU5vR09YOUM1cmdJWGVCSmU1aFFOTGJ5VEdkRmVIazRy?=
 =?utf-8?B?TVpZWkVyUldmRVBQOHV1YlpXMVIwR2RMT0xQQTZXdldmaWZIUHE3S2NoSjI5?=
 =?utf-8?B?REhiZDZBWXB2WG9XRURWMWtQaWhLeXlxdHVHNjBJMlNUOVJBSENuSnBRTUV0?=
 =?utf-8?B?ak1iT0ZNNG81T0ZEUDNGK3hIRkJrb2UzR0ljS1FMT1BBaVkxRkRySitEaC9m?=
 =?utf-8?B?RCtQNnNoMG1QTnNPZWdOSG5EUFlwTXRNRTlKTTRWcjNBb0ZVWXdyMmd1a3F6?=
 =?utf-8?B?MHA4TUhSendWUXFqZHM3cU9nYU1aeGFtK1RQOFMxdnNjUG1ubFkvZEU2cXJr?=
 =?utf-8?B?RFVnMG9jdElTcHJaRjlZRWZlaXAxdEZTVC93S21yOTJEZWt1SjJOL2Q1RlZS?=
 =?utf-8?B?eHpnYTVMSTVwS2NDeDdWM1JEYU01eHM0YVBNT1FQTHlJTEZSYlAzaUY0SS9t?=
 =?utf-8?B?M2Q4Q2NId2VUSWxyOGZwTXRIOWJpVlBxR2FEd0x6U0hyQUkvanpNaXJIaDhp?=
 =?utf-8?B?ZFhDc1JJZ3RzSDlOWVNyeGZTcXpCVWxqRjFFR09JTmJGYnpnUTZNeXhQTDk0?=
 =?utf-8?Q?/VcXlyhTQ+BR4leeDLe6aG8VafPIZ2Nf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YThWOGVGMVBvZ1VRdElEM0FMbGZHN3dFTHhtY2VxT0F1VS9tTUNGbXJFN3pD?=
 =?utf-8?B?QytPM0dPbmxDMDEzKzUyczkxWERUK3ljTFp3ZUI3dEhLdEJ5UVZtT2wrajFQ?=
 =?utf-8?B?QjYwTXNWMGtJelpmWmt4TjhuSGo0aUsvQTZLTkxXV2ZKaGRWWmowMGN5L1lo?=
 =?utf-8?B?MFZTSGJERXFxTUNzOGlxdGZSVGg1V0o3OEtCZmpsRCtHSW90a2VqdERHRjZs?=
 =?utf-8?B?Kzg3Q2RTeVF5UVNIV05XRFZBaEZ4YUlNM2FNVGxCNkFqMUJpVnRsWnlJaXBq?=
 =?utf-8?B?VDJ6UWRHY2RnWXFydFBYbUhtbjI1R1pnQ2MraGhGajV6dFNGa2cwUTVhdGhz?=
 =?utf-8?B?c0M5WWpjd1dwZk8wMitFempja3V3WnVvdUN6RlVseFBwYkJRTnloVjVkVUNl?=
 =?utf-8?B?R3U2OFBSOVRvbHZDOEpEdFFhWGROTHlRY1g5REhPTHhGQVFNcTNFK3FtakRa?=
 =?utf-8?B?ZFhRZzdFdFdvWDNQblU5L0VacTlEUTdNeW9FV1MxWVBkNHpnWE02Q2tXSFNM?=
 =?utf-8?B?Y3ZWNmIvYTZZanNhU2hjYVNQZzhWQUxsWkkyeXYyVkhvYnFJZFFCM2p5bURj?=
 =?utf-8?B?aGk3RnIrYWZKMFp2MUpYNmhFWG1RM2k2RWlhbDZrQnpGeGVLaEFrTW56Y1JU?=
 =?utf-8?B?ODJmT3FyaXFqbmE3WnZ5NVhidlVGNXI4SmdtQ2pEUk51cjJaL0FKWWVWZytJ?=
 =?utf-8?B?TGhPTUdkSzR4Y2ZISURvMXlrUXVuWVc0eCtyRFF3Yjl4cmgzbkU3TmpYSG9k?=
 =?utf-8?B?Ym9PTW1KNkk0ZzFtdWRNYVFTQ0NDa2ZmNndWbGNub3ZJaGFNT0NxU0w4Nitt?=
 =?utf-8?B?ejIrbU0vZnBMVWg2Mml0eWJ0azZPZXY3N3p5Zy9JS1RmR29ua3JHdXFyVndi?=
 =?utf-8?B?c0pId0JGclBBVHpOMGZ1aGFqY0p1VjY2WXpkVUxyWFZsenA0ZU4xa2dBWnR5?=
 =?utf-8?B?amZGVVlrQktOQ2RYSC9nUHhJcTVodXZpNG5OK2trd3ZlWnZPTThVTFphVDdP?=
 =?utf-8?B?d21yT1h4UHJtR1ZBL1ZUNGkvanB6bDhrM1kzajh5bEFhd1JEaUQya0doQm9v?=
 =?utf-8?B?bzNTWmZzM1dPVjBEamRUcGJQVlREUEFBNTBiN1ZndWRDL2xDdVJEYTZJajJY?=
 =?utf-8?B?RnFTa0V1MEs0YTE3NjEzcjA3ZjVJbUVYNFFOVnQ0ZGpKczZSL0NFNzVJLyti?=
 =?utf-8?B?ZUlJOGl0eGNiRDUvaWl1aHBpSnBjNUE0bmRzOVBMQ0F4TmpZVWJIWXJTMnRk?=
 =?utf-8?B?bzZueVBwZnFjaHJtRnBHYjNUa09VaHBMMmxhb1N3MDBybjZyRDAwYmNNWTBn?=
 =?utf-8?B?UXAxRU5TN1JLWW5iTEFEMm1HcTlJZ3RrTlh3WXB5bHVNdi9VeTlWejBmRlN3?=
 =?utf-8?B?V3QrbWFOM2pvQzA5SUJ5T0NObHk5RHlVTFRwUldiYTNyRFFHVlkvUThWSnkx?=
 =?utf-8?B?aUp2MTc1TSthWFp1Qkswc2E0UlpUdmtWMzJ5Ti93R2pXa0I1QzhTNXBJdHVI?=
 =?utf-8?B?enQ5d2k5TnZTcnFUK3pLdHorWFkxVDZpL1ZsZ2VoQzU1em9majlmZVpvZ3Vn?=
 =?utf-8?B?T3d3c0lqeTNTZ2EyWWI1MXRaeEZwK0U2ZFYrOUVOckZwMGlsL0xXQmQzMnNH?=
 =?utf-8?B?MVhGSDhsS0ZDQzBQZXk3dTBqN1dkVEZwOTBvWlNtN0JOcmxIb0dtcEQwTmpq?=
 =?utf-8?B?RWdUMkovbzB6eStwRXJETkE3WUo3NHVIMlRmS21YQ29ucmNQNFlnZWNmbDdz?=
 =?utf-8?B?VEtRR1JiNEgwSmE0bUl4NHo4dnBML3dhZEZQbjhZN2dWWkpOa2pnTlZiWjg0?=
 =?utf-8?B?Qy9Wb2lPR0NhSlJNVWRHV0JJTmFpNGd5Zm5zWjZiWHRVVXhsSlpzdXovTGdp?=
 =?utf-8?B?UnRIZmtXL0dvYUc4R2pteTFZUjBJUW0yU0tKaEY4Z0JreWlUSE92dnZiY283?=
 =?utf-8?B?NmROdDhFTUVHU2lSN00xL2J3QzBHQUFtSTJtZWRxUGVzWUw4Y0phV0FXa3Ja?=
 =?utf-8?B?eVZ0djErTmRZekJyZ2RZOHVnRE9aRVdJM3lJNU9TTEp2RndLL2MzQ21SdUl3?=
 =?utf-8?B?Z1ljZjQ5VzB2T0grclJJK3RKdDdQVEMwaFdjeFByZDhET2FreWM0MWpFT1FW?=
 =?utf-8?B?VTVZZm1vMW1PUllUMzFJQnlXOUJEUkVuYkJvTHc3ajVZZGYwaExSV1RaQm04?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07afcbc2-399f-4d18-56c8-08de22bb0c98
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:46:30.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKSTHiMopenDFW9afpTxRfMkzzXH4Cj0FJd9FXDjfYpEWEyAtgfwGmtvJIO7eCQXlAksy6MwFfA7MNCrxagdZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8742
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

Quoting Matt Roper (2025-11-10 20:20:31-03:00)
>Use scope-based cleanup for forcewake and runtime PM to eliminate some
>goto-based error handling and simplify other functions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gsc.c       | 21 ++++++---------------
> drivers/gpu/drm/xe/xe_gsc_proxy.c | 17 +++++++----------
> 2 files changed, 13 insertions(+), 25 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index dd69cb834f8e..a3157b0fe791 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -352,7 +352,6 @@ static void gsc_work(struct work_struct *work)
>         struct xe_gsc *gsc =3D container_of(work, typeof(*gsc), work);
>         struct xe_gt *gt =3D gsc_to_gt(gsc);
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref;
>         u32 actions;
>         int ret;
>=20
>@@ -361,13 +360,12 @@ static void gsc_work(struct work_struct *work)
>         gsc->work_actions =3D 0;
>         spin_unlock_irq(&gsc->lock);
>=20
>-        xe_pm_runtime_get(xe);
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>+        guard(xe_pm_runtime)(xe);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>=20
>         if (actions & GSC_ACTION_ER_COMPLETE) {
>-                ret =3D gsc_er_complete(gt);
>-                if (ret)
>-                        goto out;
>+                if (gsc_er_complete(gt))
>+                        return;
>         }
>=20
>         if (actions & GSC_ACTION_FW_LOAD) {
>@@ -380,10 +378,6 @@ static void gsc_work(struct work_struct *work)
>=20
>         if (actions & GSC_ACTION_SW_PROXY)
>                 xe_gsc_proxy_request_handler(gsc);
>-
>-out:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-        xe_pm_runtime_put(xe);
> }
>=20
> void xe_gsc_hwe_irq_handler(struct xe_hw_engine *hwe, u16 intr_vec)
>@@ -615,7 +609,6 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_=
printer *p)
> {
>         struct xe_gt *gt =3D gsc_to_gt(gsc);
>         struct xe_mmio *mmio =3D &gt->mmio;
>-        unsigned int fw_ref;
>=20
>         xe_uc_fw_print(&gsc->fw, p);
>=20
>@@ -624,8 +617,8 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_=
printer *p)
>         if (!xe_uc_fw_is_enabled(&gsc->fw))
>                 return;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>+        if (!fw_ref.domains)
>                 return;
>=20
>         drm_printf(p, "\nHECI1 FWSTS: 0x%08x 0x%08x 0x%08x 0x%08x 0x%08x =
0x%08x\n",
>@@ -635,6 +628,4 @@ void xe_gsc_print_info(struct xe_gsc *gsc, struct drm_=
printer *p)
>                         xe_mmio_read32(mmio, HECI_FWSTS4(MTL_GSC_HECI1_BA=
SE)),
>                         xe_mmio_read32(mmio, HECI_FWSTS5(MTL_GSC_HECI1_BA=
SE)),
>                         xe_mmio_read32(mmio, HECI_FWSTS6(MTL_GSC_HECI1_BA=
SE)));
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc=
_proxy.c
>index 464282a89eef..e7573a0c5e5d 100644
>--- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
>+++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
>@@ -440,22 +440,19 @@ static void xe_gsc_proxy_remove(void *arg)
>         struct xe_gsc *gsc =3D arg;
>         struct xe_gt *gt =3D gsc_to_gt(gsc);
>         struct xe_device *xe =3D gt_to_xe(gt);
>-        unsigned int fw_ref =3D 0;
>=20
>         if (!gsc->proxy.component_added)
>                 return;
>=20
>         /* disable HECI2 IRQs */
>-        xe_pm_runtime_get(xe);
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
>-        if (!fw_ref)
>-                xe_gt_err(gt, "failed to get forcewake to disable GSC int=
errupts\n");
>+        scoped_guard(xe_pm_runtime, xe) {
>+                CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
>+                if (!fw_ref.domains)
>+                        xe_gt_err(gt, "failed to get forcewake to disable=
 GSC interrupts\n");
>=20
>-        /* try do disable irq even if forcewake failed */
>-        gsc_proxy_irq_toggle(gsc, false);
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-        xe_pm_runtime_put(xe);
>+                /* try do disable irq even if forcewake failed */
>+                gsc_proxy_irq_toggle(gsc, false);
>+        }
>=20
>         xe_gsc_wait_for_worker_completion(gsc);
>=20
>--=20
>2.51.1
>
