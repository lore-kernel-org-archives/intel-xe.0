Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6872CCD193
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 23:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B98110E99D;
	Thu, 23 Oct 2025 23:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKpZvadG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1938E10E99D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 23:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761262405; x=1792798405;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5gCepJ51fAv4v3pioBdZe05lq7pjHHyVjp6BPDF/llc=;
 b=RKpZvadGkZGWrAYdOMwwIOI4bjaPZ67Zc8ON/zAyuux99uHUZpdNUJGX
 t84VD63CGDcNDoqAr3sD4n/df7WKhZPr1HQY1ko1otgSwNZex2K3u5QwO
 24BHBhpTbSpV0F0R1OATuI3j94KTKjstQVD9je1Gi5hIeI+owJeO3hNDB
 vQSPB5hoGMttrHKXa1gmJCO4ksWNsfGAjn7TyTys1j1KF29xEzer3kfay
 PA6tvQiHg2nFDdTyRYMkC0fHB4SnjotDHorDwZQjrulmHF3Csy/STSsP+
 TRtI1EwR6MJFgKk/lBkJnks+WSBryiQiS2n5GCPl7WzfX+PUtEarbANJ0 Q==;
X-CSE-ConnectionGUID: m8fh3AaLSKK+EWU4lZ3+uQ==
X-CSE-MsgGUID: J/v5VKSeSDGzxQtyNm/jXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74115235"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74115235"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 16:33:25 -0700
X-CSE-ConnectionGUID: MHTFE5jHTQ+IsnlFgR8vTg==
X-CSE-MsgGUID: Hrho32lSSSupDe6bg2HCUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="185062442"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 16:33:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 16:33:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 16:33:23 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 16:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlC9PJ7ys2LjFbQeddds4g8AEmbE+C2auBSk2s6uIFglJLhx5raM4MhLm2HfiXS6tVtLdD8OlO3uZdwVYsJ4yvpWl5HSPxJP5XPy40Ueo0bUiHM4vka618+BQFohFqbU2f0zyt/okkiuk1Nha2FC5GYgfyyqBMApMswGpc93kNB36b7M5y182zQocvqMWWOs+BV3rJxB9x29MPAg+BiC+Ry3qDm4XQ2j9g23xwYj5jo+2mn0munWWfw0nXhvlmwlh8/f+ss9+pOZaIAxznKZfhznUgKm2H2FD6l2+61HrM7g3aNfySaXiC+Cy/6yZ1s3i2UirkiRSE8ySQAs86FNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzyAvBLEr4YNy/KQbVBFfpBcIEIo/SZzjZnUbtvZPPM=;
 b=w79ir3V8yq41dSvPzK/zXfm/tpFbOS4saTbFIrs/IU/JqJ3vG08xQcmJUzDaso/a1qgqjKWG3bfhlW94vC64Jvseohk4AFI2mPHkaiFV1Xa94IujvFCmm4GALZYvQYAYnQFDcHAGh8rJpXegCe9+2WE8XfcHSSKQmapjoH7yETTsRbvq1OVATZ/GoL0fIyohVnTKMs3yesB0z0JC9fj5pk3UtYpYkIZzvS3LOcqs52uDlcrlrvslf7JWOTeDMGA8V+xiIYbFggPiwc9B/bWU/SCTvRphOFpdx1teWMTaVRRUMJsb/3mQW7K8V3+ApWQ9UK/2Yh/Zwao8oJUwMwCKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6215.namprd11.prod.outlook.com (2603:10b6:8:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:33:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:33:16 +0000
Message-ID: <cd44e3b5-cd3d-4297-a1a3-f417163e8562@intel.com>
Date: Fri, 24 Oct 2025 01:33:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Introduce RESFIX start marker support
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
 <20251023153616.3790-5-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251023153616.3790-5-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7a::9) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5205d8-f72c-41f9-2be1-08de128c8a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anRSeVlJbUg2YmQ5dVY0dXNLejI2QjFxeEFLdDRva0YvejAvc2h4SE1LQlAv?=
 =?utf-8?B?R1NrR3R1dWtydXlhVVBWbExsZmpJNEdhcjdkem8wb25hbnJjQy9EY3V0RW01?=
 =?utf-8?B?Zkg4YjFJZ2Zvd1RvaDdIckJ1SlNvLzEwV1R4RnZDeUxWSUhvZGh6aVBuSWV6?=
 =?utf-8?B?U0xyV1pwSjRnWFNZb2kzZS9LTVJJU2JBZitMZVFsMVJQR0pyOU1iNWpzYURV?=
 =?utf-8?B?VHdDV1FFcm5NNUhtbXhvQUNvK0VPalVGTGFpQ3JsYVFkVVc3bGlJc1NJTGFh?=
 =?utf-8?B?Mmd4NVBNeTEvOWxlK0U0WXdMN2U3anN0V1YrZmpDbW1wbEJ5ZGI5UzdZUUIy?=
 =?utf-8?B?aldpK0dlc2JXTHBVQkd6VzVxVzBRUEpsUHR1Z05QQ29hUzNXZUhzUm5DQ29Y?=
 =?utf-8?B?REtjbWNzTnBVTlMvc2paSi8xQ2V0dDlDRytZUkRwL2dZajEwU2FNaXJ2eU52?=
 =?utf-8?B?ZjR4QWROVHhKdFlLV0pzTUJTWWdBODhFZUVPRXprMnhFeGpjdm5ONm1wMWkx?=
 =?utf-8?B?K1VqcUNPaS9xcnh1VWhHVGlhNlh0bXUzM3BGd2EyQ2cyazhCOGZ5eFRZTDEy?=
 =?utf-8?B?YUZKcFNHRzVESSs4T0pZUENMQlM4Q01UUkRQdmZXRmRmaFRLNXFPY0JPVTR3?=
 =?utf-8?B?cXVMbkJoSE41OURXUGMyT2tnYk1vcUUzeTd1YS96SURWZVRieVV1Mi9DRGd6?=
 =?utf-8?B?YU0raHZETFBJVmNsZ3puYUc2cVArcGdGQ0NwRG14eVZRSHVORzVDVHJWMUJy?=
 =?utf-8?B?UTBwVVFCUVVzbmljeW5FNkx2S2tVcVQ5NHU1eXFqUDQwMHcyRUdyWGZxZkdQ?=
 =?utf-8?B?cmZSanFUVnYxS3p4OFB1UTdyT083SXdKWFhoN3RrTVA5YVdhbWxZNWVhWjUr?=
 =?utf-8?B?cis5YkFBaDhBKzlyUW1nNFFEell2RzFiUmxQaVI3K1Y0SGdJbzRVZHlsVStS?=
 =?utf-8?B?RFQ0LzBMblh1WnNheU04R0JmN2dXaDkyc2dZdjBMdlUxNnZmNDZLSDlPVW81?=
 =?utf-8?B?cGRwNFhzeE81Wk1RR3ZTU1YrdlBaTml0K0VNVFJxVUgwZnZZL3JWcXZ3ZmxU?=
 =?utf-8?B?dThzeHJXZDJ6V2lwUENpbnFsTzEzbTh0UThoYmlDNkpLd2F6dUR4MGNRVFlk?=
 =?utf-8?B?Rk53VVdTT2wwbDRNN3ZUQVZvK05FNE9qMFZ5VWNxeTMxbE85VHkrZVE5R3Ay?=
 =?utf-8?B?eTZVWDJHdWM0ZlVVbkorQnd2ZktwdjQ2TG9kZ01qSWdjZFlpZFpvRCtYUk9l?=
 =?utf-8?B?UmlzcjdMRGNUWnRRNDM3bDFRTFhGUEtrN2VGUGlWQ0V0Z2hkU2E0bk5oam4w?=
 =?utf-8?B?cXRsK2t1WjUzdmtwQzIzeVplYnBuaGpEUkYxRnpacFRBczI0R3pjVlBVaDda?=
 =?utf-8?B?NENNOEFpQmlPM0Y3U3RzT2xKZGJ1enpSa2tNWHNuTWNzTVJYcktyTlV1QmZm?=
 =?utf-8?B?d1NkRjhoTTN0cHdCVkR1OGgrUmdkZWhSMUU1TEtxNC8raUhTcUlEQm1QM0sr?=
 =?utf-8?B?LzVqekVEaWlTdDZjMTViQWxKWFd3Q1owUkltNGFmWWFTNUl6WWNrMWxmM3NT?=
 =?utf-8?B?Q040b1haRWN6TzhKV3pCQ1o3RlpoaHBzZTZ4RU1hK3JJdFhnd1hCVXZUNm5u?=
 =?utf-8?B?bnVENTJSZzlTRXlCeDhnc0ZJeEs5bEtqRUtmVVJIOHhXYlkxRWJzOTdpdjh3?=
 =?utf-8?B?MDI5SVhWZzNqRDZLRUZvNHVHY0J2cXlUMjdCVW1QRUEvRVFYdjRyTm1QMHl6?=
 =?utf-8?B?QzRmZFJGTjZLcHlqZ2lrVzc5eWVCYjE4aVVZbkN0eDZsT2lhUlp1RmkxdE1M?=
 =?utf-8?B?MGtXM0lvanlkR0Y1QVVWK0ZnV29CbFUyY2xUUGhwbDl5bVNzQWRRbkhINlJE?=
 =?utf-8?B?UWpnY2lOMzd5NXpjTVhJWjVldG92NGRyN2sxdGRYWnZ2YWV4aytkVERmRGlL?=
 =?utf-8?Q?4QAYe4his364pXf4qIBmBLy6a0tJZygT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d09mZm9OUmppbTZHVHQxMjZMSno1S09IcG5yL1c2eDgrOFhtTnc4b2w0dHNB?=
 =?utf-8?B?bG5Fc04rcGgxQnMzR2JBTUd4aVFkUEFNU3hoOXR6c2s5OExrTjBoV2t5d3dN?=
 =?utf-8?B?Nm1hVWhiQ0Ztc1Znd2tzeXZjSEtBanBWdDU3M0trNzU3OVVKZGtXY25QYXlZ?=
 =?utf-8?B?U0d1MVhBdDJJMEhjdE5qOWpjU09GVTdtbGllNDF1MkwwT3BGZjBhazNnZHZq?=
 =?utf-8?B?V0k3UVp5L0JwODQ4SUkveFR0LzBQc2ljcTh1QjFDRllHVG43ZkpIWW4rSkJ3?=
 =?utf-8?B?RHFJTDVEWEkyL21Ya0xLZ1RoTjBMRXhGVCtySC9NQ3BRckgwWm44VjgvUUdO?=
 =?utf-8?B?dHZLNURBQ3J4b0ZGSmxhWDhJakxzVTdidUdVOHFYL0dtWm54U2daU2pLZm53?=
 =?utf-8?B?NUFYZkdpb2ZVZEl0aDNleVhJekVpWXpzbWwxL2JoSE1uUEpnYkRQekRkWVpo?=
 =?utf-8?B?c2lrSTBOeWQvQ2t0WGwzRXFYQ1o5NlVHQ1F3K1VDTC8rRXhBYVNQaHZyS29j?=
 =?utf-8?B?cEdxWnptTHl4c29UblJEd0NOQXl3elZXRkdFeDZhUzZtQzhUWkN0cmVXMmNi?=
 =?utf-8?B?YmhadzRGZjNaYXE4eU5NaXRwRzlPR1daMS8rcjNsQXdsei84RmxQUHQ2blJa?=
 =?utf-8?B?dG9sbW5YQXJYa2hCQTVCZUUvWEhPK1Y5eTlBaHhlOUVLSWloNE5jcHQzOVhV?=
 =?utf-8?B?WlFRZUJNbmdidDUvS1pmdnQ5ampoTFIvM0FldEVZQlZXVXIvYXo1ZXpzOFM4?=
 =?utf-8?B?TUZ0ZVdRVzdBYlJQRjdpTWtGUnZjU3FhWW1tVHU3RExEbWNsNXlGRXMrNkFO?=
 =?utf-8?B?WFRZWWZzQXN6ZFFJdWk4S0NZUVlmbTc0VUhlbXIySzZ0SWtSWktORm9ndWdJ?=
 =?utf-8?B?NU1JRnFBbGVQZFhVRUI0bnhRcnU3U3Z5VjV2cjFLbVVjcVlxNEZMOW9KRnNt?=
 =?utf-8?B?SlRBNnNXTmh4RWtwd2paT3ZHSDgwaFVJSmlTOStXc2MxNmFVWjJkdVFla2NE?=
 =?utf-8?B?SnBlWlFycW16d2lKMHVSY3NmZkJsNm1GbkkzVjdLWTFGMjRKSUpiY1Q3Qlk1?=
 =?utf-8?B?ZHRqNzNBTmxoc1M0OU80TDlJd21Rc28zWEZLTERrQVNtQXlpYlRlSzFxb24x?=
 =?utf-8?B?L3FSRjFvRklYRmcwNnlhTkNIaUlqYjNhdDVYMjBCaldLeENzNDFpc2lhOHBy?=
 =?utf-8?B?aUlLdGtRaWFIQXdxVDUxN2FFYlJWRUlISEZtd1ZzWUJIcFRvRVMvdGtRNlFG?=
 =?utf-8?B?cGYwdHlWS3g0ZzhrU09MWmFySXJOblZ6QThWNWFaWUhQMnFjQ0U0VVNVYkht?=
 =?utf-8?B?RlFCSEJUQ3JWSGNqQzNBaHRXNklkRlV4S0VDRmJwaXZObFEvVFVRQVUrYkky?=
 =?utf-8?B?U0xZN2U0SnNRY3ArV0FHbXN0SWhmSGpGb0NHbGUvTVlseEFsVEhSTGZLdFYz?=
 =?utf-8?B?ZENtRW50c242Tk9wa1dqZnBva0NrQUxKMy9wU1dXRU53SFBtQzhQMDd2SW80?=
 =?utf-8?B?czlOSTNDOURYUG84T0pjaHJkUDBCNTRTMWl0N0ZsNFZUdERZNkpiK3J6ZUZ2?=
 =?utf-8?B?MXdUY0JvSGp0M2p2cDFkYnVaU00zV2kvU2E1MVhWeHRKWDBpWjJ1aHh6MjFO?=
 =?utf-8?B?SlhCQzJWNUxOaEViR2RNVVp5eGNTK3RMSTJPV0Q4eHA2a3RSczUvcWhocGJ4?=
 =?utf-8?B?bUpFLzlaREl0aGM2MDNlYVJyMUoySlRwWCs4V0ZuZ1BXZnh6Q2NpS285N1Ez?=
 =?utf-8?B?NVJ4cEh1bEF5b0Myay9BVWR6TURiUnVtRWRyZC9WVytic2YreFJIT3N4Skcr?=
 =?utf-8?B?aXc3bGZzYUFEbEhQekhGTmN3Q3oxS2wrS3pYWWpnVUFHY3JuTk92YVIzWHFC?=
 =?utf-8?B?Ums1dWs0OGVvWTNRaUhjS280eU9VMTcySU8xcmZxQlYyait1SDRiL1k5a2U1?=
 =?utf-8?B?UDhnSG1xMk5TSm5mbWJaRlRKak1DSS9MWWVkZHR2RHZaeWdPdXBZRVU0b25s?=
 =?utf-8?B?UWNVYmRYWG81VnUxZFhtRlViaTJ5Q3ZUMWgwYzdsYkpQM3NheW44SDV2MzJ4?=
 =?utf-8?B?Nk42RUx5MlV6eE5NVXk0anoyOU81NnZaUjVqZzB4MzU3NDNraFBlZ2FUVU1T?=
 =?utf-8?B?aGYvL2o4bDArbFhSR2QzSUtrdkZhUlFubTAwUWRUd0krcjZ0Ym52MGhOUmRs?=
 =?utf-8?B?M3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5205d8-f72c-41f9-2be1-08de128c8a9a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:33:16.5431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClvqL0Y45P4GqRLgjWwU7+CtE+E4xM7vgtiREagOQgYSOHy4psCqnX5zj7Lm/rGh5dEjODJGqga5XcZjkSiKC0wIJGm+QLPFnuWr1C69QVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6215
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



On 10/23/2025 5:36 PM, Satyanarayana K V P wrote:
> Post migration, a marker is sent to the GUC prior to the start of resource
> fixups to indicate start of resource fixups. The same marker is sent along
> with RESFIX_DONE notification so that GUC can avoid submitting jobs to HW
> in case of double migration.

it might be still unclear "why" currently it is not working

try to better describe initial problem first
	(done message could be sent without VF notice 2nd migration and need for new fixups),
not just the potential solution
	(use of the start message with marker)

> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V1 -> V2:
> - Squashed "Enable RESFIX start marker only on supported GUC
> versions" commit into a single commit. (Matt B)
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 38 ++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 87 +++++++++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 42 ++++++++-
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h        |  5 ++
>  5 files changed, 169 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..b9141497bfd5 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -656,4 +656,42 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_NOTIFY_RESFIX_START
> + *
> + * This action is used by VF to notify the GuC that the VF KMD will be starting
> + * post-migration recovery steps.

since this is new H2G action, IMO we shall say here from which VF ABI version it is available

    * Available since GuC version 70.xx.yy (VF 1.aa.bb)

but I can't find those numbers yet

> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MBZ                                                  |

from the code it looks that this should be

    *  |   | 27:16 | DATA0 = MARKER (....)                                        |

> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START` = 0x550F   |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START          0x550Fu
> +
> +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_LEN     GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_0_MBZ   GUC_HXG_REQUEST_MSG_0_DATA0

and this shall be

	VF2GUC_NOTIFY_RESFIX_START_REQUEST_MSG_0_MARKER

> +
> +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_LEN    GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_NOTIFY_RESFIX_START_RESPONSE_MSG_0_MBZ  GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index d0b102ab6ce8..8c1448d6c81d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -299,12 +299,55 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_START) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),
> +	};
> +	int ret;

we should assert that negotiated ABI version supports that new action

> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +/**
> + * vf_notify_resfix_start - Notify GuC about start of resource fixups.
> + * @gt: the &xe_gt struct instance linked to target GuC
> + * @marker: marker to identify the migration.
> + *
> + * Returns: 0 if the operation completed successfully, or a negative error
> + * code otherwise.
> + */

no need to document trivial static functions,
there was a reason to make then small/trivial and thus self-documenting

> +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +

put this dbg_verbose() here and include marker value in the log

> +	err = guc_action_vf_notify_resfix_start(guc, marker);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start (%pe)\n",
> +				ERR_PTR(err));
> +	else
> +		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup start\n");
> +
> +	return err;
> +}
> +
> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION,
> +			   GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_DATA0, marker),

note that not all GuCs will support non-zero marker

we shall assert that non-zero marker is only used on newer ABI
and zero on old ABI

unless this new ABI is Xe baseline (but AFAIK it's not)

>  	};
>  	int ret;
>  
> @@ -316,18 +359,19 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  /**
>   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>   * @gt: the &xe_gt struct instance linked to target GuC
> + * @marker: marker to identify the migration.
>   *
>   * Returns: 0 if the operation completed successfully, or a negative error
>   * code otherwise.
>   */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> +	err = guc_action_vf_notify_resfix_done(guc, marker);
>  	if (unlikely(err))
>  		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>  				ERR_PTR(err));
> @@ -1183,7 +1227,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	bool skip_resfix = false;
>  
> @@ -1206,12 +1250,27 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));
>  
> -	return vf_notify_resfix_done(gt);
> +	return vf_notify_resfix_done(gt, marker);
> +}
> +
> +static bool vf_resfix_start_marker_supported(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	return xe->sriov.vf.migration.resfix_marker_enabled;
> +}
> +
> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	return ++gt->sriov.vf.migration.resfix_marker;
>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	u16 marker = 0;
>  	int err;
>  	bool retry;
>  
> @@ -1227,13 +1286,27 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Increment the startup marker again if it overflows, since GUC
> +	 * requires a non-zero marker to be set.
> +	 */
> +	if (vf_resfix_start_marker_supported(gt)) {
> +		marker = vf_post_migration_resfix_start_marker(gt);
> +		if (!marker)
> +			marker = vf_post_migration_resfix_start_marker(gt);
> +	}
> +
> +	err = vf_notify_resfix_start(gt, marker);
> +	if (err)
> +		goto fail;
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> +	err = vf_post_migration_notify_resfix_done(gt, marker);
>  	if (err && err != -EAGAIN)
>  		goto fail;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..ccd850313328 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -60,6 +60,11 @@ struct xe_gt_sriov_vf_migration {
>  	bool recovery_inprogress;
>  	/** @ggtt_need_fixes: VF GGTT needs fixes */
>  	bool ggtt_need_fixes;
> +	/**
> +	 * @resfix_marker: Marker sent to Guc prior to starting the
> +	 * post‑migration.
> +	 */
> +	u16 resfix_marker;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 39c829daa97c..10d6e43fffce 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -55,7 +55,21 @@
>   * When the VF driver is ready to continue operation on the newly connected
>   * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
> - * CTB messages and scheduling workloads from the VF::
> + * CTB messages and scheduling workloads from the VF.
> + *
> + * In scenarios involving double migration, the VF KMD may encounter situations
> + * where it is instructed to re-migrate before having the opportunity to send
> + * RESFIX_DONE for the initial migration. This can occur when the fix-up for the
> + * prior migration is still underway, but the VF KMD is migrated again.
> + * Consequently, this may lead to the possibility of sending two migration
> + * notifications (i.e., pending fix-up for the first migration and a second
> + * notification for the new migration). Upon receiving the first RES_FIX
> + * notification, the GuC will resume VF submission on the GPU, potentially
> + * resulting in undefined behavior, such as system hangs or crashes.
> + *
> + * To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
> + * sent along with marker and when GUC receives the same marker with
> + * `VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF::
>   *
>   *      PF                             GuC                              VF
>   *     [ ]                              |                               |
> @@ -102,6 +116,11 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]

you may also show below the flow when GuC rejects RESFIX_DONE due to a marker mismatch


>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
> @@ -169,6 +188,26 @@ static void vf_migration_init_early(struct xe_device *xe)
>  
>  }
>  
> +static void vf_resfix_start_marker_init_early(struct xe_device *xe)
> +{
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_uc_fw_version guc_version;
> +
> +	if (xe->sriov.vf.migration.disabled)
> +		return;
> +
> +	xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);

as CI already noticed, this could be too early to check ABI

> +	if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 24, 10)) {
> +		xe_sriov_notice(xe,
> +				"Resfix start marker requires GUC ABI >= 1.24.10, but only %u.%u.%u found",
> +				guc_version.major, guc_version.minor, guc_version.patch);

hmm, are you sure about these versions ? I can't find it in 1.24.11 

> +		return;
> +	}
> +
> +	xe->sriov.vf.migration.resfix_marker_enabled = true;
> +	xe_sriov_dbg(xe, "migrate: Resfix start marker support is enabled\n");
> +}
> +
>  /**
>   * xe_sriov_vf_init_early - Initialize SR-IOV VF specific data.
>   * @xe: the &xe_device to initialize
> @@ -176,6 +215,7 @@ static void vf_migration_init_early(struct xe_device *xe)
>  void xe_sriov_vf_init_early(struct xe_device *xe)
>  {
>  	vf_migration_init_early(xe);
> +	vf_resfix_start_marker_init_early(xe);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index d5f72d667817..626c11a6dd1b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -38,6 +38,11 @@ struct xe_device_vf {
>  		 * was turned off due to missing prerequisites
>  		 */
>  		bool disabled;
> +		/**
> +		 * @migration.resfix_marker_enabled: flag indicating if resfix marker
> +		 * support was enabled or not due to missing prerequisites.
> +		 */
> +		bool resfix_marker_enabled;
>  	} migration;
>  
>  	/** @ccs: VF CCS state data */

