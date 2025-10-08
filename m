Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38EDCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 10:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8437510E7B9;
	Wed,  8 Oct 2025 10:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLsOUhWC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BBA10E7B7
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 10:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759918365; x=1791454365;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7lSeUswAtyPXHlIpMAZKH1az5nDofvGZNUhsHjEHpAk=;
 b=nLsOUhWC2cxNTAYutzdpLm4pPjueKtvqXnyUEAuFVbTae3dThmUMuGEO
 WgCOG05EXb3DbrrpYCnbqxYj6YaJQvy+M3vGyoJU6NLkwRUU5RN4tuVLF
 lH9mxpjA3qzhl4PdU40O0ZaVFOfJfCYLTmbOQ+9AlHhUWWz4gayJdfJTN
 LXYry1YuOvfeKHVU4m7ViaQN3UQo8cFGDktp7F/obLtopMsBHT9sTgSMg
 wkzbRJSMN8ZJyKf2u5w1v0pq6+IL/mv0vZ7eDpjd2wXJZTMwjUzwHOYza
 5DqyDmVtXcBoWYJvhyKHsyJ0EHPMhlyoG7dXht988ZB+Ny1Lumed1RiAh Q==;
X-CSE-ConnectionGUID: 95K7s9UiQSK0ShYwWNIOXQ==
X-CSE-MsgGUID: P0fVtIlHRNCCBX/vunoTNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61313026"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="61313026"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 03:12:44 -0700
X-CSE-ConnectionGUID: SuVCZrZ5RkqNneK6u/34mw==
X-CSE-MsgGUID: OG8d0BhZRDayfvdNtiKoKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="181164419"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 03:12:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 03:12:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 03:12:43 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 03:12:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB0L2vzhHJLz9oYxKiETXurJ4vYl1oUoking3HAB2Sa5Tak+7qFnnAdh9gA7zvZqknfVC2d4jnrq9JawLiqr8dN6ap5wKaxAZ35Cohhs35p0Nooq+tpXq9L5XD/sIsMPirwcIqtRZ3C5QDCkLsMwixzlnRk+paUhKBr7d/dHg3pfTN0K4vCOpee3fVrjDR+cZrct4pcCenL2byFbYHDPoi3TwvcU+97KplGBEA08tgWZqS9UMPmH7uDqlaklweFITHKOnhycfZHYnHXrb5YwfmFQEuZHMb4J01PooszlvKEShKXXmyetG0iaSQl99P6maGhS6tgQ9gPtudHdAsyUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drxkTwe6Icr2gpEtfA0DAPTzeAm1U3Wm3crifq6z0rw=;
 b=lzgIPfaMGKQbd/JZWp40RQrN6WChdIO3q5ifHfmtZj826u7di8ukDS0yHcW9y8O0VsiUsmdZL0rO+gCrc/poGy4QxcQ7rVSSxnKdImcZYNABq28PNGjMCWoGb62DnFPfAwqXZ44p7WqCnQkDGwK0sy+wl69OFMkVtGF1XOe1cpYYsBBb0CXXNLPF0MkBZI7ccXv9Pj2k+VUQkA64VxFRrckFgJ2rVSm2lVO0wvfTuzzXj9uzhR/dR78kLqpT/BjSbNePyL82lyZzwuFOzIbx5IQ2Sze9cA7dFXP8KV0g9rqZB4qKpyRXmKmH48YY2fdgws5s/qX6DJxNXsEvArVnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8512.namprd11.prod.outlook.com (2603:10b6:408:1e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 10:12:41 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 10:12:41 +0000
Message-ID: <c45b55d0-697d-4e3b-82d3-5cecda6362ff@intel.com>
Date: Wed, 8 Oct 2025 12:12:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/23] drm/xe/configfs: Add attribute to disable GT
 types
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-47-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251007204829.1468209-47-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0388.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 0622746c-08f9-40de-60ce-08de06533744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjArRjYyWmZua3lTbzZhRGE0dnFwcjB6QXJPTE1kWmFEQWczT3JzUzRLWjNu?=
 =?utf-8?B?U2RxUW5pVU1YZWZzQjRwTE9qYXpnUWwzeitNTW9MenIyVXFQbW9xcThsSitE?=
 =?utf-8?B?NG5OREoxVFg3R0ZRMTRGYjE5U1MveTdRUlRiQ2RycFc0azhXdWY4d0JWOFN1?=
 =?utf-8?B?MVJHNENvUEhFQmtBNlY0ZWRrK2pqSGVsb2g4WDB3djkyM3NselpQZVl3SlJa?=
 =?utf-8?B?SWsraWZmTEp4OWJKa1VsT2dxeWpXY00yVVNpdW1jK2ZFMVlMNWdnTkdDVWNa?=
 =?utf-8?B?emg1TXgzK0dhbkZNcTUyM1R3V1J0aWxMeE4zSjJ3czloakZpclcyTkhlcno3?=
 =?utf-8?B?S0FFaDA4N3VkSnB0TTJ4NndCMGRFUGRDSG1SRlFYZ3ZqYW5vV0dlSzdoTCts?=
 =?utf-8?B?NkR4OXJLalpOYTFRQ3ZmT0xOc2RsYytrVU83OWRoQ3YvQzhORWZEOXpwYjRE?=
 =?utf-8?B?WExrVEJpMmxhVmlnWFpGelVwYVJPNThhSVpBczd4dDVFcC9JNnBZbmpNZE1G?=
 =?utf-8?B?NkNnQlNPVEtEUnhqZ25BejltUnpRam1CSWRuSXNhZ2VHN1pTei9GdXU4a3VO?=
 =?utf-8?B?YndIemJIK1NNRjJwRHBVVWg4bkczcjNHeEZ6TklrRURUc1JxbmtDTDZTQ0Qy?=
 =?utf-8?B?V0Qwb3ZSLzRkcmJpL2gxRkRZbitUZjRZVlJGYlpKcmxjbTJPVHM3YVczVUY1?=
 =?utf-8?B?Q3krZUdwcDNCVStlc0E4bjRadU9JVkxVQXN2UHJrbE9nL2FSTnJFbDZOS3R6?=
 =?utf-8?B?TmV6MjUzK1Yxa3E1YjA3c29YbWlmMUJrdnZWWEl4K0ZSYWtYU3NQdktueHdX?=
 =?utf-8?B?ZW82cEY2aEtSNDhTSVZUMitxT05reTdtdWx4Z0VIL2RwSTJrTGVpczhRRGg5?=
 =?utf-8?B?NnFZai9nRlR2UlZrWThGRzFxajV3a01KNWZVcWZSMFBDM2JsNkxNRmJsT3JR?=
 =?utf-8?B?b0t3K2U0ZHhRREVmSnRiS0ZnVWMwZmV6MmNNNk5LdHJnVW13Ulg2Mm5tOTNp?=
 =?utf-8?B?ZVlhWGdqSC9FZmMvWnBoWHpEc0ZHcXFsekx2N1hQRGVubTEyeGdXUWhndkti?=
 =?utf-8?B?MTAzL2VTY1Y4U2FyVm1QcHRjbGltd0duM0dxTkRLNm8vWDFTVjQ4UmUwdCtr?=
 =?utf-8?B?VWVwKzNLbHc4K1FMTnNjMm9YLzV0YWdIandLT2tJR2JsYS8xVGtlQkxWRHl3?=
 =?utf-8?B?d1YxcG96VndEb2lYWStxdHRKN0cvcWxGeEMzd0xiU1FwYkhXVFd4VlJLbEM5?=
 =?utf-8?B?Vk9ZdUpOZXozVWNmSTVKOCtOcWtOR045OHcwckhQc1lMZEw5UmRGb1pBUXds?=
 =?utf-8?B?RXZEWmlJRGJTMEhNTFNGVCt1ZnIwVmk4R3NLQzI3QUw3M2RJZzNEVmpGMGdE?=
 =?utf-8?B?UWx1TnR6d3MzNWlqKzFJTDQ4Y3NSVExIcVdveUE1bGd6UUE4c2xoa1duRHgx?=
 =?utf-8?B?ZlYwR0xaRWp4bVBLTkRudTl6WmFmOEFIaWdYeFpyRElMaDR6NkI0UG5NcTQ0?=
 =?utf-8?B?c0gydU1KR3lnRFpjdm9WR0hwZWphM3dBYW92SGZtWFUzNTRxMVRJMmRUa2hk?=
 =?utf-8?B?Rkw2ZmswKzJYbWNESVNFRzdIelJyWE0yTGRLYm5qcW5FNlJUb0M5dDMxWW5k?=
 =?utf-8?B?Sm0zYU1KMml4QXQ2eEdubENLSW5OVUNjZHJrdyt2S3VwQjVJQ1M1WHNvVEdi?=
 =?utf-8?B?RFBReFl5anVKTlNhK0V2Zm1yMGJaLzRjYWwxZnpPTkRVVE9jVVVmM2dvcklL?=
 =?utf-8?B?RDRLWm1xSmFTVVY5QStESkVLTFJ5eGxyZ29Pc3pxUnBKbHgwaFdzLzJtMmYr?=
 =?utf-8?B?dTF6UkVxWHpsRHlUMnBLZEF4VUtmQWJ1THJkQjREbTFJUlNjYjNWcU1xY2VD?=
 =?utf-8?B?Y3F6cW5HejdCdzRNWTJFbXNaWlVrN1VxcGdBeDhOeFpuZ0lpR1RjOWRjdlFF?=
 =?utf-8?Q?3gcQxYIXBcsdBrzC7ChjXn4zSazA66jq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3JZQnluejRtczU4cG9uSGlUWWNDQ0EwOFhzMnlCRVQrK0lZbGZIL0Rhdlpq?=
 =?utf-8?B?TEkzcnlSU2lwQnVyQS9oYVYzZGViUHg3aGh4YnpWZ3lyK2hSSVJydHcrT3lz?=
 =?utf-8?B?TFYrUytlbVBvZTlLUWI3Tk00Z0tGWmhkVVdOV0czZ2Q3SEpkeFJ5QmRXc3Ru?=
 =?utf-8?B?VHc3bURSN3dFYlI5NWZqWlIrRXpZQkJZM3lMb0toc1hWUzdyMURuYzdoM2FB?=
 =?utf-8?B?YlBjRXdqNStKZThPVlJqd0pIMGFqWXFnbVNyNDh1Y3hqdWc2TVRBaVU2OU9C?=
 =?utf-8?B?Q3AvelZVdXNZMFRpZWphN2NvN1NkQklhcmpzeEorZUVuVWRiRlFRL1NqSWV4?=
 =?utf-8?B?dW9xYnBROG1TeEhHWDREZ3N6WDJQQ1JHb2tpdDJnYnQ4ZjRXWUx3TE5Zd0hB?=
 =?utf-8?B?cHdUVGxHOWhMZjloeS82WXpMRlFBWCtucnRrQXhudDRkYzIycE8zOGgyWTVR?=
 =?utf-8?B?ZzRlN0dhS3RUZjN0Nk5naFdMcXpIcmc2dlVRS0xLN2t2bmJ3T2tPK01IbUth?=
 =?utf-8?B?UFB3MWQ3VHA2MVZTb0ZvSk5DaS9zcFBralhGdUF0Uzd2TXlMMjlrdzZoQnlt?=
 =?utf-8?B?bGZBZnZ0RTB0OS9MK2lvZXc0a1k0ZVAvTk9HdVpwNEllbEdpUFVuSHR3TzFs?=
 =?utf-8?B?RXpsc0xCTzR4YUpGeXNvcW5Kc21wRi9hcFQ4RFFpd0FYZ0dyVFZBQU1GQWR5?=
 =?utf-8?B?LzVzWi8xcHc0NFBZNGFUYUFHM3BzYkFjcUJFV1F2cytHNHcybGRTQjJJTk90?=
 =?utf-8?B?VW4zaTZKRjI5WlRpL1FDTmE1RFFIMjgxZzhKUlJQeWpuMk1QK2ovMHI5bytT?=
 =?utf-8?B?ck1JUUNLMm5PVFRYUlV2YUY4Yjl4SGdFZklSSmVjSW50Tjl2Y3Z3dmVUejh2?=
 =?utf-8?B?Q1dIYnFhZjd3T2xTdWloT2k5bWphUmFFOGFEMG1BODFzQno0YXNMOUIydVk0?=
 =?utf-8?B?eEVPckFBTjNOMkhBZGJuWDhxZ09rSCtFWmNGSWN2clVPQTlSR0VFTW14ZnF6?=
 =?utf-8?B?UEkzTk9qRUl3NWpEQzFaUjY2NXdVWGVVaFJhTkFOYytKM2F4SDFvQlhrUlBm?=
 =?utf-8?B?K1l2dUR5Y0JFOXh3cFJUMUpickFiS2JrNkMyNGF0c1EvUXMrT3hnTUwrbFJQ?=
 =?utf-8?B?d3Ntekp0NHZjSzBCemkvdVZaVGdUQVNER21qaUxiejFEWVB5czFpVFd4WUVr?=
 =?utf-8?B?cjVWT1lRMDBaTVdjOE5TVFdIMklqNG5OSVdqa3ZMakE3cjBodVBlcm4zTVZk?=
 =?utf-8?B?bzhoUkhWdFNxa2V3bFJKZGs3TWZITEk0UGFWQjJNNHA5RE5rb3JZUVFnZEJQ?=
 =?utf-8?B?d2plaHoxb0liSndZSjd4QXJHVVArWWxsSlRYc0VZb0VEVHI2eVVzWDgxSDBX?=
 =?utf-8?B?OFMvZXdTWVBYdUFCaEs4LzlQWFkvaWJnQXppWi90VTc1WWthQU9weG5wM3FB?=
 =?utf-8?B?VGFRWkRKclFERjQzc3p2TEEzcjFxRGR4ZjZaS1NTeHo3TmpsWHlVZ0kvUlp0?=
 =?utf-8?B?U3FOcG5DUlpZK0g1MzdiM0ZlOUYwNWdMUVoxenNQS0pFWkhYN0pYWElLVGd5?=
 =?utf-8?B?TUFXWXJBaTZESU81WmZPYzhVcjZIM3VxQnJYblpNbFZIc2NZL3RRWFEveEIx?=
 =?utf-8?B?VHgxbEx6MEZaUGR2UElveHVSTERpL3llQ1JFc1p2VnQrbmhZZEZ4dzAxRFQv?=
 =?utf-8?B?a29BNFVRZ3dOQjVHeXhVMi92ZzhLTDZmQmZ0eVRpM3VhYmx4a25VNlp1UzQ2?=
 =?utf-8?B?Sm9URnlYOW1RUkdJMDF5dEJaRHlqVmV5ZGV1di85d3c0WUFYOXBzcG1XVVV2?=
 =?utf-8?B?WjVRaHFWa2p5c0l4WmQ0ZGVUb0hZb0kwQ2UxZHBoeUZRSUxhaW5QM1M4cFM1?=
 =?utf-8?B?d21qSTdqV0VVRlVkdVlpaFhGeE1jUjh2dUU3M3phY0NHWnAwUW5CNC9WQ2pl?=
 =?utf-8?B?Z1lJUEoyVGdSekUxWk1oVStvcjBIRGJkZE95ZUpEdkNvT0d5dFFodzJTVUxo?=
 =?utf-8?B?QTdtdGhBdXFPUWUyRlNISDJyVFVDNVVKWS9HZFAwYk44amYxK2x6b2ErVXNZ?=
 =?utf-8?B?S2RXbHl5N3VOL3U0K0ZRZ01tMTdqSFgzWHU4Sk4rWUxrS0hXaThUVDB2T1Jt?=
 =?utf-8?B?RGJUZ3V3THhLeHg0ZTBaQTc5UzYvRnZvUytaeER5clhVYk8wQzBsV0Npd3Ex?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0622746c-08f9-40de-60ce-08de06533744
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 10:12:41.3761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uzb15/eeuCVVq3oHJewb5kKOXhsOQL6HS1B0ITWkbodS6Oo9UeFs2IiI5K2m9RATjLovigng1Mc0hG1jRZuUXUk8RgZ523pNujVXTFlvOc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8512
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



On 10/7/2025 10:48 PM, Matt Roper wrote:
> Preventing the driver from initializing GTs of specific type(s) can be
> useful for debugging and early hardware bringup.  Add a configfs
> attribute to allow this kind of control for debugging.
> 
> With today's platforms and software design, this configuration setting
> is only effective for disabling the media GT since the driver currently
> requires that there always be a primary GT to probe the device.  However
> this might change in the future ---  in theory it should be possible
> (with some additional driver work) to allow an igpu device to come up
> with only the media GT and no primary GT.  Or to allow an igpu device to
> come up with no GTs at all (for display-only usage).  A primary GT will
> likely always be required on dgpu platforms because we rely on the BCS
> engines inside the primary GT for various vram operations.
> 
> v2:
>  - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
>  - Tighten type usage in gt_types[] structure.  (Gustavo)
>  - Adjust string parsing/name matching to match exact GT names and not
>    accept partial names.  (Gustavo)
> 
> v3:
>  - Switch to scope-based cleanup in gt_types_allowed_store() to fix a
>    leak if the device is already bound.  (Gustavo)
>  - Switch configfs lookup interface to two boolean functions that
>    specify whether primary/media are supported rather than one function
>    that returns a mask.  This is simpler to use and understand.
> 
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 145 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |   4 +
>  drivers/gpu/drm/xe/xe_pci.c      |  22 +++++
>  3 files changed, 171 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 139663423185..e36cc5e1bc8f 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -15,6 +15,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "xe_configfs.h"
> +#include "xe_gt_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_module.h"
>  #include "xe_pci_types.h"
> @@ -56,6 +57,7 @@
>   *	:
>   *	└── 0000:03:00.0
>   *	    ├── survivability_mode
> + *	    ├── gt_types_allowed

I'm wondering if we want to keep such advance knobs at the same level as others?
maybe create sub-group for them, like I did for sriov?

	    └── tweaks
	        ├── gt_types_allowed
	        ├── engines_allowed


>   *	    ├── engines_allowed
>   *	    └── enable_psmi

oops, and it looks that I missed to update this part of the doc when adding max_vfs with:

	    └── sriov
	        ├── max_vfs

>   *
> @@ -79,6 +81,44 @@
>   *
>   * This attribute can only be set before binding to the device.
>   *
> + * Allowed GT types:
> + * -----------------
> + *
> + * Allow only specific types of GTs to be detected and initialized by the
> + * driver.  Any combination of GT types can be enabled/disabled, although
> + * some settings will cause the device to fail to probe.
> + *
> + * Writes support both comma- and newline-separated input format. Reads
> + * will always return one GT type per line. "primary" and "media" are the
> + * GT type names supported by this interface.
> + *
> + * This attribute can only be set before binding to the device.
> + *
> + * Examples:
> + *
> + * Allow both primary and media GTs to be initialized and used.  This matches
> + * the driver's default behavior::
> + *
> + *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed

maybe "all" as an alias?

> + *
> + * Allow only the primary GT of each tile to be initialized and used,
> + * effectively disabling the media GT if it exists on the platform::
> + *
> + *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *
> + * Allow only the media GT of each tile to be initialized and used,
> + * effectively disabling the primary GT.  **This configuration will cause
> + * device probe failure on all current platforms, but may be allowed on
> + * igpu platforms in the future**::
> + *
> + *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> + *
> + * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
> + * **This configuration will cause device probe failure on all current
> + * platforms, but may be allowed on igpu platforms in the future**::
> + *
> + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed

maybe "none" as an alias?

> + *
>   * Allowed engines:
>   * ----------------
>   *
> @@ -187,6 +227,7 @@ struct xe_config_group_device {
>  	struct config_group group;
>  
>  	struct xe_config_device {
> +		u64 gt_types_allowed;
>  		u64 engines_allowed;
>  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> @@ -201,6 +242,7 @@ struct xe_config_group_device {
>  };
>  
>  static const struct xe_config_device device_defaults = {
> +	.gt_types_allowed = U64_MAX,
>  	.engines_allowed = U64_MAX,
>  	.survivability_mode = false,
>  	.enable_psmi = false,
> @@ -220,6 +262,7 @@ struct engine_info {
>  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
>  #define MAX_ENGINE_CLASS_CHARS 5
>  #define MAX_ENGINE_INSTANCE_CHARS 2
> +#define MAX_GT_TYPE_CHARS 7
>  
>  static const struct engine_info engine_info[] = {
>  	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
> @@ -230,6 +273,14 @@ static const struct engine_info engine_info[] = {
>  	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
>  };
>  
> +static const struct {
> +	const char name[MAX_GT_TYPE_CHARS + 1];
> +	enum xe_gt_type type;
> +} gt_types[] = {
> +	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
> +	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
> +};
> +
>  static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
>  {
>  	return container_of(to_config_group(item), struct xe_config_group_device, group);
> @@ -292,6 +343,58 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +	char *p = page;
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> +		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
> +			p += sprintf(p, "%s\n", gt_types[i].name);
> +
> +	return p - page;
> +}
> +
> +static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
> +				      size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> +	char *p = buf;
> +	u64 typemask = 0;
> +
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	while (p) {
> +		char *typename = strsep(&p, ",\n");
> +		bool matched = false;
> +
> +		if (typename[0] == '\0')
> +			continue;
> +
> +		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
> +			if (strcmp(typename, gt_types[i].name) == 0) {
> +				typemask |= BIT(gt_types[i].type);
> +				matched = true;
> +				break;
> +			}
> +		}
> +
> +		if (!matched)
> +			return -EINVAL;
> +	}
> +
> +	scoped_guard(mutex, &dev->lock) {

probably plain guard(mutex) will work here too

> +		if (is_bound(dev))
> +			return -EBUSY;

then we can take a lock and return earlier, before parsing input

> +
> +		dev->config.gt_types_allowed = typemask;
> +	}
> +
> +	return len;
> +}
> +
>  static ssize_t engines_allowed_show(struct config_item *item, char *page)
>  {
>  	struct xe_config_device *dev = to_xe_config_device(item);
> @@ -672,6 +775,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
>  CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
>  
>  static struct configfs_attribute *xe_config_device_attrs[] = {
> @@ -679,6 +783,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_ctx_restore_post_bb,
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
> +	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
>  	NULL,
>  };
> @@ -846,6 +951,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  				 dev->config.attr_); \
>  	} while (0)
>  
> +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> @@ -896,6 +1002,45 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>  	return mode;
>  }
>  
> +static u64 get_gt_types_allowed(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u64 mask;
> +
> +	if (!dev)
> +		return device_defaults.gt_types_allowed;
> +
> +	mask = dev->config.gt_types_allowed;

btw, as we are using guard during write, shouldn't we also guard during read?

> +	config_group_put(&dev->group);
> +
> +	return mask;
> +}
> +
> +/**
> + * xe_configfs_primary_gt_supported - determine whether primary GTs are supported
> + * @xe: xe device
> + *
> + * Return: True if primary GTs are enabled, false if they have been disabled via
> + *     configfs.
> + */
> +bool xe_configfs_primary_gt_supported(struct xe_device *xe)
> +{
> +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN)) != 0;

can't we just rely on the promotion to bool?

	return get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN);

> +}
> +
> +/**
> + * xe_configfs_media_gt_supported - determine whether media GTs are supported
> + * @xe: xe device
> + *
> + * Return: True if the media GTs are enabled, false if they have been disabled
> + *     via configfs.
> + */
> +bool xe_configfs_media_gt_supported(struct xe_device *xe)
> +{
> +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MEDIA)) != 0;
> +}
> +
>  /**
>   * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
>   * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index c61e0e47ed94..5624e965b911 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -17,6 +17,8 @@ int xe_configfs_init(void);
>  void xe_configfs_exit(void);
>  void xe_configfs_check_device(struct pci_dev *pdev);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> +bool xe_configfs_primary_gt_supported(struct xe_device *xe);
> +bool xe_configfs_media_gt_supported(struct xe_device *xe);

I guess we need decide now whether we want to continue to pass pdev or switch to xe as argument for all xe_configfs functions

>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>  u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> @@ -28,6 +30,8 @@ static inline int xe_configfs_init(void) { return 0; }
>  static inline void xe_configfs_exit(void) { }
>  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> +static inline bool xe_configfs_primary_gt_supported(struct xe_device *xe) { return true; }
> +static inline bool xe_configfs_media_gt_supported(struct xe_device *xe) { return true; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>  static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index a5932e4f4a23..9c8ab2b41737 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -695,6 +695,11 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *gt;
>  
> +	if (!xe_configfs_primary_gt_supported(xe)) {
> +		drm_info(&xe->drm, "Primary GT disabled via configfs\n");

nit: you can use xe_info(xe, "...") now

> +		return NULL;
> +	}
> +
>  	gt = xe_gt_alloc(tile);
>  	if (IS_ERR(gt))
>  		return gt;
> @@ -720,6 +725,11 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *gt;
>  
> +	if (!xe_configfs_media_gt_supported(xe)) {
> +		drm_info(&xe->drm, "Media GT disabled via configfs\n");
> +		return NULL;
> +	}
> +
>  	if (MEDIA_VER(xe) < 13 || !media_desc)
>  		return NULL;
>  
> @@ -829,6 +839,18 @@ static int xe_info_init(struct xe_device *xe,
>  		if (IS_ERR(tile->primary_gt))
>  			return PTR_ERR(tile->primary_gt);
>  
> +		/*
> +		 * It's not currently possible to probe a device with the
> +		 * primary GT disabled.  With some work, this may be future in
> +		 * the possible for igpu platforms (although probably not for
> +		 * dgpu's since access to the primary GT's BCS engines is
> +		 * required for VRAM management).
> +		 */
> +		if (!tile->primary_gt) {
> +			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
> +			return -ENODEV;
> +		}
> +
>  		tile->media_gt = alloc_media_gt(tile, media_desc);
>  		if (IS_ERR(tile->media_gt))
>  			return PTR_ERR(tile->media_gt);

