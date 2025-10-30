Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D99CCF9F8
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 18:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A825410E992;
	Thu, 30 Oct 2025 18:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfVpW/oJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA2310E992
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 18:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761849224; x=1793385224;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VT7PnCiCKtRUCU+tUh5OfdGVF7ML5+sqtqbj/yxziW4=;
 b=XfVpW/oJNtkkeUp+bm+9moHDmMm3orYUkzJAHMmSZKZKgvPh2mVRlHDb
 j0zczlW08f74ZC8784C2GrZvQff4JLnl2boNlnTx5Zr5L2x/gPqwj2rqd
 eDRcr+uZHPbJIuh8/ieIfwkC6P+Ln0wEXqYqn2LbnVEbgAf5tazgzGQVc
 X4zd6J+e5L8G3GcKACJOv1yPg1/zgB/LUrGoe2HTRLeG/jog8hegO4Hmc
 6m+pvunMQI1UN2nnozYAQ6hkRyEVL6/yvfhfcAB0nGWHgVbDgsBk03gXE
 eS0/CoMZKPSB5VXpS4AnjcEY3AGro8PTM+q4RQ5irKcoHbaiWoK9BvJEy A==;
X-CSE-ConnectionGUID: cfwpx9V+Sl2mUo1lKduNkw==
X-CSE-MsgGUID: LiSQZb6/RUugBI2A2BqJGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67655072"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="67655072"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:33:43 -0700
X-CSE-ConnectionGUID: 2VOxVnroSyGzfouy6c6drQ==
X-CSE-MsgGUID: v6FC5qwKTvuJS1yDiAorCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="191182393"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 11:33:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 11:33:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 11:33:43 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 11:33:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWKYc5Awc6p3BkPKgpk4U9NEf0xIv84sIpeTHV+kzcEzF1EwA587ThYBX55nJilxr9uCTqT4gQS0pnzLIOHBkTqAojJdfJDT3WwGk5rqn8TYdSj7tJGbLOzXYEmW115kE3bUoCgiZ7FuZWEqhz0ykFrx5VkELgC4sfnJrRMSdvMVjkpg2J952goNkjxRMKLS5PA7bSVHTljHxcsxnC9R8sqpQTACwijJihEwvXPkgPnXzDZLj8Hh27IZUEwgbumkYsBznJYksh/wJYeqr7lOGp1y8NE9iuLqSpBSV/0U3TiVFaZSBmqF5X7vuZjwQ1NJgarVu3+MysI8s6uYqxempw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swP5oOPqDQ9XLx6PRa9/M7KN7hyMZeF2gWF1xBFM5DY=;
 b=y2OlCO5E/ecdcEavBDjC4aoW/PVtLrXmAjRZgx90DVX7TJHL4diOhISCWVbMKiiVEif66FbkN7L0FS5wvqhkxIzlCzvkoj0uRd11gP/noTPmJLtAlrywDUxL4h9hIE+8xcjYajsLxuXdOYyA7aOeVA4Xoj/8qMjmKfYssLqIGrYtikbJJGGIpDI6pjivabaiOdwU1qFCNpYyOnGqJl/FhR76+lgnZee1qQrFhleUNfvhxsHpQOjO8iC938iSeL98kKyEnGO3RONuIJDuUT8ZsAXiB6ihdXv+tDyswBxvT0hExage8qEz2LYkxkrDvF7vzAVJEnlGmhPKwicyHu0pbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 18:33:40 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 18:33:40 +0000
Message-ID: <3595815d-8324-4a0d-a6e6-ba5f332a3dd9@intel.com>
Date: Thu, 30 Oct 2025 11:33:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] drm/xe/pm: Assert on runtime suspend if VFs are
 enabled
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
 <20251030122357.128825-4-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251030122357.128825-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS0PR11MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eadf896-be8c-445a-48d6-08de17e2d8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU8rSlFUM0wvRU5XYlc4Ym9TUFZ6ajU0K3o2bHBnd1pzbEZYRi9GMjFEcTEr?=
 =?utf-8?B?ZlJYczByZllvT09UWVpQM1FuWFdYTzVBWnZBOWlJOXUraFpJWVRwV0xqU0lL?=
 =?utf-8?B?RkFQUVg5M3FhVWo3S3FBSE0vM01CTERTRW1nTWR0RHNQcnk1YmtYU0Q0cVJs?=
 =?utf-8?B?QmFwbGI3Zy9BbEppY25zM1U1WjZ5SDBES0JSUlpiVzBWR3I2V3R1Qm9wNTNi?=
 =?utf-8?B?MUxuREptWks4QTVDKys3UkloS1l5WTB6c0xuZGkyZmx4a2k3aUpRT3RwUmRR?=
 =?utf-8?B?OUtHUzRvd08zcDNZcUtndGxIT0JlVk44eEFLWGEzOEJxUy9qVldsZ3pYUVB4?=
 =?utf-8?B?cDNlTmZmZVdGV1FheHFtOHdBbXNMdnFLY2xnWmxOL0Y1OWlkamhZbGpqMGgz?=
 =?utf-8?B?cTdGOWtvSDl6Y2JOQUFEYTVaQmNGU3BvMmprQXFPcHBhSzlEMi84U2ZHZzYx?=
 =?utf-8?B?akpTTlBSeTR0dEN1L01uQTNEZThUNTZTR1dkcnYvTjhDTlI1Z0t3b0k0YzVo?=
 =?utf-8?B?YllncG5lZEkwWStETi91aEFuOFA4K3FTeWJ1VVNVdXljUm1pYlJRWjd1V0M5?=
 =?utf-8?B?RVdvTnRRWkhqU2ZsY3d5OFBiL0xzWFk4MnFERGdPUEIvQ1hORHBQdGR2eVlI?=
 =?utf-8?B?UWRSaHhJVHNWQjJNM1pVdWNDcTd6VXQ0YWNySCtzVmJNUitiNlFpT0hBSzYz?=
 =?utf-8?B?K0JEbDJ6Ry9naXhibTNYUGRSZ05tME1MRi9GaFZ4OU53Z2c3bExWTllWUERU?=
 =?utf-8?B?M1J5dmdYSlAzOUgrS01KWUxlSHNOd0JXWE5OVG9IVk1BYmpCcWFsWmVQQy9s?=
 =?utf-8?B?SjdHRzJkT2xQNGlzY0RnZ1Jra3FCZ0tFby9nNmpUYTM1MTg3QWdGSDJva1Av?=
 =?utf-8?B?RUZ3NmJmY2V0WFBnaHJIRGZ6NGRwT1N4U21LLzl2VndReExrcmZRWW96OEw3?=
 =?utf-8?B?OFZST1lwWU5FZ2QxVmhleVRTNXJNNXN3d1VTMFhFZUpjemlmSVhjSndhK1lI?=
 =?utf-8?B?RHhXQlUrSzlvUHB0OExNbDdlNEZaRHhmekF3NVBkeE13TUIvWFNIU2hPZUkx?=
 =?utf-8?B?MjkzUTEwQ3l5OWYyUWlLUWt1N0J3UHlYQlhTZlFJTjBNSlNkMHBNSFNPaVdz?=
 =?utf-8?B?bXlUenRjcFBVc3F3RTd3VHpuK3RMNG93U3l3NjNEYWpHU2hFTnJrVHh0L0lK?=
 =?utf-8?B?VCtnVmtFL1VDRE5BaUNyNEQ2QXlkY1M5OVl5Y29ZR0NqUXpzZUVsK0dheTdL?=
 =?utf-8?B?Z0ZKVlAwais1Ky9ZTVFxQXhDeVNmaXhrNnJQZEFMQ25xenFTRW1yTW8rbmdu?=
 =?utf-8?B?R2tnbDd2RzFJUmlubk5zRU1yY2NKbDZQbnQ1TkVNYzJrSTBIM2lqM2ptVUNV?=
 =?utf-8?B?TWdsSmg4N0Uvdlg1emMzOThFU0VuNDBTdXh0b3h5eUp5UEh5b3dENy85eEZx?=
 =?utf-8?B?WGJOQUhDTk9mQk1GR2RBbUdLRkkrSTN3NjBuRFdvbVdGRnpPNExsRGpuWUVG?=
 =?utf-8?B?OXJici9YRHJ5QzZ3T0JVRjhmdzJDQTdTRmw3S3diREl3bW44OFF1djFwMjZO?=
 =?utf-8?B?b0R2a0x2TzZvdktCdmxhbmc4OHJEdjdLLzFFUUYxeXRKODJkL3U4RzNYMHQ1?=
 =?utf-8?B?WEgxSWUzdDM5b1U1UnVyTGd5enhtTzJSbVZYWWdaL2RNM00xWmNMcVB0T1BG?=
 =?utf-8?B?QnNFcW0ya0paVVltaXhDZ0ZtZSt5N0tvSjAraWh4dVJBR2FvcDJubWRCZDNO?=
 =?utf-8?B?bDliR3pZR2dVbEFSL3hVZnZLZ1Y0SjNvb1VvZDNBVkRkdWRZSWdYa0VJeHJk?=
 =?utf-8?B?Q2pvQk4rUHVxNVJDWFhCdEszbkNqdUZ6Qng1MVRpa3Z2MFBiTVEzdFZhK0ky?=
 =?utf-8?B?c0pMalBQNSt1eEZCYjBPSVFmdkNkSGR2TjRBR0h6YVZ0TkMzZWdpQkg2aXBm?=
 =?utf-8?Q?rjvBxM5f1pd2OOPheqqgVTJohvVeT07I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1Z6RlpGZGMyV2c5UENPM0lsR1ViS0g4bWxiMGNTRDZldEdEZzdiV0FEN3pt?=
 =?utf-8?B?UUNaZVRhZDZtc2RiOVJsdHpCZEJITlJIT1hQQTExL2gvNHh3WXYwaE1weWlh?=
 =?utf-8?B?eGdPOFVoWElXdWtKQ1RMM25EaGE5SWUvSHlsTUdEdmJ1aEp1VGRzbi9xTldJ?=
 =?utf-8?B?ekZSS2pQWUR1dHZaZHlrMWk1azdFaVlpdVhHNXdTcXNzOUxWc1dVYzZYR0cw?=
 =?utf-8?B?NTd4ZXFhMUxnVk9UcERKQy9KRVNwdG04VVVKRThIZG80czkvU0g1VFJHT0FW?=
 =?utf-8?B?TmNETkhDZzNOUjJJQWpQR2h6alo3RUZQNnZZNDF6cG9hZ0tIZ2RrNnU5Uit4?=
 =?utf-8?B?cURXUXVQSkhTYTRIUXpES1N4RjBaR2FwR1RmVVBGOWtFSEVod3MzdFJ6RndO?=
 =?utf-8?B?enVhRE9QTlY5TmdKT09jcVJBaXFkYmVxSXZpR0VLVGF3ZWZSYmVLd0N4Vkd0?=
 =?utf-8?B?WU0yVlI3OHkxdHpGNEJOeWJmVGdDNVJjL3hoSWFUclMydmlxdDN0eXVIUWZw?=
 =?utf-8?B?Y21WcVA1UktHN2k2ZUpIc0h5QmY3MTNYWTROODBqc1U2TzQ3SE9lZFFQQkhM?=
 =?utf-8?B?cW9YRUtxV1ZydGZ6S2VCSytWdm00aEZLQVB2Nk1vV1R6c1VmalhZYkRYUzhV?=
 =?utf-8?B?aXhWRHRHempieXd0aURzVFRpNStIUjJDOUZranF0NSsrSitaVWxmRTE0Z2V0?=
 =?utf-8?B?NjMvcFRaYzdiemFINTYzMEdGYmJWajlUbzZ5dDdLN0htWlMxSklzbERFb3VW?=
 =?utf-8?B?YWV5NktrV2Z1aFpMR0t5bkg2bi9WYi9FcGQ5NFlSLyszS3lWYy8xRWMvNGVh?=
 =?utf-8?B?SlR1WmsySXh2dWJGME44dFpPdFNxMk9mcU1LUjNyZit3SlZHdXVqZHQrTEFS?=
 =?utf-8?B?Qk1xcHU2YXFNV1Z5OHRjc2NBaGRvY3JvR1hBUEdyVFdFR3NiT2NpMnNZaEFl?=
 =?utf-8?B?TWFJZk90bGF6TVFrTnllbUtWVkhrVzE2Q2FvMmpaRFJMalJzRGxJR2x5MmVH?=
 =?utf-8?B?b1o0U3pybSszOUxBY242dVNEdlExb0lZMXFpcGxJUkJUaTJpWnJSVmhLWUM2?=
 =?utf-8?B?K3JqSTg2WVpZc2RUeWY3OUsrKzBobERJVW14bHg0RDVVZzQvT2x2KzZPT1pi?=
 =?utf-8?B?MnZaMzJKOGRYTnZhdDBDNTIwYkR1M2F0UU03UzJYVGdzalAydXNiVEdreGY1?=
 =?utf-8?B?dU8rSlJudktkUGljUHlJRFZtRUZiRkdsOW90aVRkTFdzNVdqQ1lGTWpPa3V4?=
 =?utf-8?B?Vmp4RHVrU2JwOG5mRUVkTUVhK2cvWUhVYklzZjZUajY2UmRFNGxYenV3Yis3?=
 =?utf-8?B?QVVNZUZoQjBJRysyTmQzVFhvN0pzTCtmb2lNLzBqYS96Rm1KSXNMNGhQS2t2?=
 =?utf-8?B?WHdaZTRZWDVIMmhxNHNwUHNUUlBTMU0vaEVXaGZSeTVlZ3U3SUpDTEYxaTJL?=
 =?utf-8?B?cGR6bVdIRnMvOGwyT1NzWmpFMDJkcExDQzN2MFgrUjNhMlhDYTNybTB5d2tl?=
 =?utf-8?B?ZGkybmROTUVPK2NMM1B6dktya0ZqRTZMR2c2OWI4cXNFSHZrSy82blJiRXhi?=
 =?utf-8?B?cWwxaWZOUERhNXN3T3lvbkJJYTdDN2UyRFpQamg0enlBSVFXZWJ5RWZhRDNy?=
 =?utf-8?B?TytiRFZTOEQ4c1hEMHB4L2pUZ2RQZlVmOERYK1V6b2wwTXArWERSenpuMkZQ?=
 =?utf-8?B?c0s2bXAwYUtvRi94WWZiY3VsLzllcWpPN0hxV0EyQW9OSkxNSWdZNmlnZzN3?=
 =?utf-8?B?eTFVSjFhQlFVRHdVaFZrdlNIK0ZCQ2ZxNldpNW5RcVZTTVAzSnZiY1VUZHl6?=
 =?utf-8?B?L3FCNFVnRVlYVDhvSC85dW9kL0gzd3QvZnlZa09JWUZ6S3pDajRNcktQaXFK?=
 =?utf-8?B?TGVHRTJUb1l2ejJ5TDdJYnRZME9OcWt2Z2VXV1QwMHdYNkpwNEZlRDUzRHhZ?=
 =?utf-8?B?ZG40V2tZS2hUaVJWS3NuMml5WXgzcjFZM0pKTEVZTHpVYlR3VGVYekk4Wmx5?=
 =?utf-8?B?dzZjdU1zUUJ6aE9LQmV2UDNhZUNqTGJLM1B0amEwZEFBRnVUTEoyWkU2Y3Ny?=
 =?utf-8?B?bkNzV2pXRG5jSXBSSWUvbjQ1SjQ1L0tuUy9OeS8zVkxDM2ZPVGVVbEJDVHpi?=
 =?utf-8?B?Uk9IMUVTV1kyV2c2VlVKOXZZdGJRbTFuNUJHRmQyZTN2a09PUDV0emZJY1hT?=
 =?utf-8?Q?GrMj8DtSmteVNUWzAyreL4s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eadf896-be8c-445a-48d6-08de17e2d8ce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 18:33:40.2300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cn9la7PlTs1Ld/Z+Yhw7hQK9Ncu2Bm30hgTXjXD1paOsxQlT9TCLnen7D8J23akC21onlJQAyfnWY3x44BPqI+fSCigIBnr/FbQErSwv0FI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
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



On 10/30/2025 5:23 AM, Raag Jadav wrote:
> We hold an additional reference to the runtime PM to keep PF in D0
> during VFs lifetime, as our VFs do not implement the PM capability.
> This means we should never be runtime suspending as long as VFs are
> enabled.
>
> v8: Add !IS_SRIOV_VF() assert (Matthew Brost)
>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_pci.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6e59642e7820..1c37f4d91047 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1152,6 +1152,15 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	int err;
>   
> +	/*
> +	 * We hold an additional reference to the runtime PM to keep PF in D0
> +	 * during VFs lifetime, as our VFs do not implement the PM capability.
> +	 * This means we should never be runtime suspending as long as VFs are
> +	 * enabled.
> +	 */
> +	xe_assert(xe, !IS_SRIOV_VF(xe));
> +	xe_assert(xe, !pci_num_vf(pdev));
> +
>   	err = xe_pm_runtime_suspend(xe);
>   	if (err)
>   		return err;

