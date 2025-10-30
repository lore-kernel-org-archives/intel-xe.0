Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EC8CCF9FC
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 12:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4907510E26B;
	Thu, 30 Oct 2025 12:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2LtT24T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1477E10E26C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 12:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761828242; x=1793364242;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Vv6a7K6ArZi47PXmGd5uiUp1Qz2ji5NrBbkpvopmN/0=;
 b=M2LtT24ToQGz33Knj1e2TCFbEpcJ5HffZlZQVYdbvf6QXSupRdxkavWn
 HQWif2ASeSlCMnvVTvohFupsDdyzUOQanEtNyV/94sAnEQASo6LOkjiCD
 xiboft9Kr99DAA/NEUh3UNIKb+0pYNhC51OL2MUdzNHGr5NH+sApVvwkX
 fkYNF0ZZ6chPFNy+QRJnUWw5VQ+v0ulcHIMfrt87YP8LGBkg2evv80SaS
 iW+3Dv4ElXWSUAqYmjlvgknZERXgJEWlihnzC7MBgjAvq51PM34Go9025
 q6hg1VoLPj+KGKD5JjVsWFlyETrubH8BIlkxXWZ67MN5r/q44/UzxSxFE A==;
X-CSE-ConnectionGUID: JXSFiI4ERTiqSSa4yVCmxw==
X-CSE-MsgGUID: 59xSCwuwTYmL66iiMQlkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="74259055"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="74259055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 05:44:02 -0700
X-CSE-ConnectionGUID: EhmeAwmISnKc0WRzK77mjg==
X-CSE-MsgGUID: rcAxN79dRbi7srggHgireg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="186686685"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 05:44:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 05:44:01 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 05:44:01 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 05:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdpEvKLUBFvPUmJWWJVXG+ILollIoSkpROJ0zEhgGoMszcS1jf/fhJItKg8s0abUXztXlU9xVTxpBD7K/n/YrCS9oLM8Si8pPhMgr7U1pL8wIMVRSW85VGiyvjIR83dVL/eHDsSsLsSaGMHxrbJJdPLgazNE/1wE4O1Bf+Akn42CHfy/9XNIZIpj5ODWefHbT0CnUcGRF5fwPYtKGy2QAsWrhN6ix2J7EZ460PLfqjoS2m2neduEiUpY15HLntTXyXYnhgkTTPG5neGTUCDIUTl0zExluaxLZrEyx/ieV1X9isvLurhNN0m2v4eyaQLDwODLCQD/5sWpzXnkXkoCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StUUd5K9Bz3kzklYrJd0KOs4BzNOAX1w1Ce/bFDopME=;
 b=rG8wEv0QmQ67P8/b98ULqUB/cu+ThmkpSQtEzN7WsFPx4v45n8lfqLfI1rkscjBZfZWPJGgH7vdeAAByrIqZ8sVSqYjcTnlnmv0YFegt+rTxqtvCR5Vly4zBy+21suMCSAV1MeTxUABqAzn+iwtdI/KJs/G2bhKQXkwlU4o7fm3uu07itIPw8tcLxnR7vw1UX+MoTFo46+3vDMJeRJzHot6BgF+C8+2OOpHvlbbQkE+g4kxTCDjhuC5LBD23dlaaDHseFl6g6vcZG0qTQUDXHLLXSo+coT6nYl2QE8sefdhzKgG9cGRK9WLY8uGtMjO4cb4lYl8UAxL2aW3s+c9IgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 12:43:59 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 12:43:59 +0000
Date: Thu, 30 Oct 2025 07:43:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 12/17] drm/xe/pf: Allow bulk change all VFs priority
 using sysfs
Message-ID: <vydnwitzonbyxgxdydh7cscvrz2eoep2m6tp6q4adr27xdqzsc@fv6uyjga2tzi>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-13-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-13-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0080.namprd05.prod.outlook.com
 (2603:10b6:a03:332::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c932230-8c2e-4a45-73ef-08de17b1ff10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVVxMUsyczlXKzVxNUlDMml4L01Ec1FKaFFaZ1ZnVTlaUUtNQ25ucVhUbUhJ?=
 =?utf-8?B?QmN3bTJiaFBHZ1hwL20xdW9jQ1BHYUR5STE2S1lRYnRDZ0pDdHpIeWhtc0U4?=
 =?utf-8?B?azZyZ1pHT0RoR051TkdQR1VWbUgxL3lGYUwzVGkvR1FVd1lOZXdFc1RLMTNX?=
 =?utf-8?B?T2ZKbzlUS01ZdmU0UjZ4ZDRFdmpiNVpRa0tMZXV0NU9GbE8zNDFITmwyMnd4?=
 =?utf-8?B?OUw2N1ZZaUsrOVJBeE8zWkIyNlN2emxzWFBCYWt3bTU0MHFSUitNUityRWNl?=
 =?utf-8?B?dXp1YkpxOXdJaURpdk01UGU0ZnJ6a3RoRkg2SXI4alAwRW90SWlIbitZcnJS?=
 =?utf-8?B?MVQvdmdsWkc5WXp4Ym11MzBRLzI5bTJ6aUNia0lPVGNXVnBqbDhrdUJkU1Mv?=
 =?utf-8?B?MjNSWko0VDNBN3k3b3V1ZXFNL3M4bDNpdTUwdG1Idko1aEhtbXhsRDFDODFj?=
 =?utf-8?B?VUJkVktGdlNubWlIdXhwNGM4Zk1iVWxKeXZiOVh0aFdON0s1SDMzUXpLamlO?=
 =?utf-8?B?NkJsZjJFRVNGMFh6U1pZUko3ckorZ01la2xsSFhHcWJBd2lYcWQzZUo1aUtp?=
 =?utf-8?B?SHgzS0MzM3d6bGo0ZzRoQjhlUzFCejFrbVVqaWlPM0ZCdzQ4MSsvRytmbVpS?=
 =?utf-8?B?bjRacDlJbC9XRjR2Ti9iRExLcys2TlBBWTJwYnVvSXBSdnNYQkZGNFhnSTR1?=
 =?utf-8?B?L1RSdFU5dEtKay80NGZmYUFpU2tlb1U4TFRNZ0x1YmpHSStQb2tFUzNBM3hT?=
 =?utf-8?B?c2REcWk5a0FHdWwrUlNIRVhvelNrYmg2TE1hL3ZPVXBtYmwzemVXdklvOHpW?=
 =?utf-8?B?SStIbmV4L1JIVFc1ZTUzUldSbk1GeUFsUmxzVHFFSDJJZ2xucFNkUjNIWnJh?=
 =?utf-8?B?YlBNQ0hWbzFxcUhFYnRZM1o1eklLd0c5NHFERXhLNmhlOGYwaHhsZjlXalhD?=
 =?utf-8?B?cnRJUVdWY09XeU9jdHZhemFPejllOXBEWnIrRDk2NTlDU0JTYnY4cSswQ244?=
 =?utf-8?B?RVRHMHpFM0lpUk1mSW9XRXNSdlJLTUs4RldtZisyaG04VG1GM0REMU1DeVBV?=
 =?utf-8?B?REU3aVJ0dE8zTTYrZnc5UkowTVYyK0I3QjY5K2NsanNQOFNWSDN6ZGZVSzUy?=
 =?utf-8?B?ZGlrK21hVkZTd3ZyalJtTkw5TDJhbnhmS2xGRXRQa1BuTlVXWGVZbGNoS3FX?=
 =?utf-8?B?Mmh4bi9YckFIOGhVY0dsT0lxOU5iYS8xbENmMC9CK0RMVjNwb2ZldlkwbkJz?=
 =?utf-8?B?OGh5ZFc2MW1Pd3E3YVVZNTFyNkphazZxaVU1ZGNzZ3VaU1RLZjRZOEp0RGdD?=
 =?utf-8?B?NjliUlBkWUR1SUdaVlJmdzZRcVBGS0dkT2JERmNBTmVBWTlxQXBHWURMNUd4?=
 =?utf-8?B?ZFZ0RGQ1TWpFRnh0M3RFUUY4aFBZZU1INlNqOFZ5NWROeTNQUG9iUWF2N1pG?=
 =?utf-8?B?VFlIRVJNNDBZa25TWE1kb2Z0ZlBjUGttNzgxK25mcmUwWHRNR2lHT25nNVZr?=
 =?utf-8?B?bDQwczhQZlMrNTg1Qk9zbUV3VFRHSzJkb1cyYTk1Wm5uQWVWY1hwSThueEhx?=
 =?utf-8?B?TlJTcGxDbWJGek1TTzFReTFrMGE5SGF5RmlES2JwclMvaXFDTGg0WTdaQXAv?=
 =?utf-8?B?TU9UQ2NRTmE3dG1rdVJ5SjhhUy95eUR3VXlpWHdBRlpWL3p3aGJGS2t2WWVl?=
 =?utf-8?B?NGtJZ0Y5aGl2R1U0cnFhbmQ3Z2hxcVFybHB6NElHN1ZtYjZOVGhNWE9rVVN5?=
 =?utf-8?B?SitFSDZGbHltNnhPZHlzQnN1WitGTEdxYmdTSHEyeXEvYWhGY0ZzdFB5cFlx?=
 =?utf-8?B?TThBQ0ZrcE9JbVZhL0t0RGRIVTVGZ1d2a1pTNlNObHE3OVg4WHdVVFVYb3lK?=
 =?utf-8?B?QWlMdEV6OUcrZjlyb3NRT1BTVFFkZStnMlFOTktOZHN4T0hZbXhzRnpNWnBP?=
 =?utf-8?Q?1MWc6u6Dmxf+/b7HB4IAYYiK5O8uNjrB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3F5KzR0S0pQZ2NTMzNtSFc0S0xIQkRrMnF4WG90NzhOd2NSY2JDN1M5K1Zo?=
 =?utf-8?B?dXdHYit5eU9CTldqRTFSQXdSampvNzdsTjY0Z1FHajErYUlZRmt2MEhIaExh?=
 =?utf-8?B?dVlKZmt5dmpMK1NockdhMmxJNmJqWFlIQ2kvMHpyMWRJWDgraXpvZVVPQkZa?=
 =?utf-8?B?WDk4bEFVN2dzY2lnNEoyRktYa0kxdDF1Y3JhWnEveXBQK1FEQ2ppVTY3QWNh?=
 =?utf-8?B?NTM5cUk4citqNlpNVVdLZnBSay9nQ0ZDYWY0ZTBoWDBQTVM4SEx5Q3JPNncx?=
 =?utf-8?B?MEZ3QUlocnc1RkVENzBvWmx4Q3pGMXpTR2Z2U1Z6U3Jmb25tNi9qYzM2Tnpt?=
 =?utf-8?B?blB3TWtOYm1zMlQxSWxvdDBMS0RpNkJhLzcremdsRTl6N0lGL2JlT0pZVjky?=
 =?utf-8?B?b3V6R3dtVjhVdEpvMEdaSjh5Y3N2TEV2aTdiTnVuZlhDZi95RFJtV1VmdzNt?=
 =?utf-8?B?Q0xJY2xhSFpNSDhneFFoZkdhdjZFUVF1TytDbC94WGl3L3UyeWZmd1hRV3FY?=
 =?utf-8?B?eVZtNXRabDZZelUrR2NCYzhmTjN4clhSdVZianM4S1FSTnFkcTNWWklOYzZu?=
 =?utf-8?B?VXYzcXFFVkRaalJMc2lsSmlFdmNGNmxWQkZjVFVEemhXVGZhWXYzUTQyeGhq?=
 =?utf-8?B?QzlrMUF1MWtJczRvTjJXZFJyck1tYkZGbG9JTEZ6NE5hYm9XUTYycWpGSThD?=
 =?utf-8?B?MjRaQ0pidmplV3RFK1FJcGhRWGk0SGVRYXlZUSs1WktHbWN4bUpaZE5Nbjcx?=
 =?utf-8?B?WmFIQzdYaEIwcEsweHkxMGhYZXU1ZHZvNGZZUmc1U0Z0S0FieHpnUkVaa21E?=
 =?utf-8?B?RkxLNzZCdWgyczdiendmY3BLUGlza3h4L1lwck95Tzc4YUFhSU1DNnNBNXND?=
 =?utf-8?B?S0RqcWhpc0s2Rmwvc3pnVGQ5UnJiRWRNWDhhck5YT2IyY3VLeFdjNk5mT1Ba?=
 =?utf-8?B?SHliYUZOYnphK1JJWERJMGZrWjY3eDFQS1BwcmljM2hydllGN3NUZHZ4eExO?=
 =?utf-8?B?Q0ZSY1hJQ0xSeXRjY0tmQUJUdHZQRHBkejJRdmFQWTAveFVzN0tlOE1OTjhV?=
 =?utf-8?B?MW5EeUpDRk9hc1UvV1Z1OVE5QjNIQ0Z0b0MxM0NmVGdITi9tRkNKUml5cklx?=
 =?utf-8?B?NlY3U2hrWHowUnh2V0c0VVFJNG1RT2RnMTFZd3hNYzNYQjZTczg0VmJ2emFT?=
 =?utf-8?B?R2FTd25YMmhyUXZOVFV0ZmdEQkVpdFgzQUNlWkZCMVMrdzEycVdFMFlCaDdN?=
 =?utf-8?B?TWp3OUJUM1hocWxuNVlCdVlQeGFoeTQyMVZvYUNmREliK1dwUDRiMFFZRDlY?=
 =?utf-8?B?MGQ2L05WelF1UzBZT3VHY2dIaHRzRzJxWVRaK3dLclBqaEYrZXMvbmNNZkJq?=
 =?utf-8?B?YTI1Zjh4UWtpS0hPVVJZaGF5ZU9nYlRIUUIrM3hNOXhKTVlBV0hZL3hLa1h1?=
 =?utf-8?B?ZE5tY1JDV2crSzRmOEdQMk0xc0NoUmE3UXlQK0RQT1dkd2pMZW54RzRMZDdK?=
 =?utf-8?B?Ni9YVkw3R2RheGlRT3JZMWtXeUF1b3AzZ0FCeGExaFZLYnVyREdqRlpnYlB2?=
 =?utf-8?B?a0RjWUxqeWxCYStUYVM3a2grWXdRYU80K2hlY3dBTERZejBodmNlRVU0QXFZ?=
 =?utf-8?B?WTdwNFNEeCt1NUYrVy9tMjhqandLK1RJd0cya0lWUGthUWxJclV5TDZZSzlG?=
 =?utf-8?B?YkhWWmV5bmEydnFvdHlBblY3RG9MWmE0QkJVWC94bE5Nd1UzMjhtZzZuNVhx?=
 =?utf-8?B?YnU0RWh6SnZXMDRPUDB0T3J5Q3pmWisrUUhJOUE1T3A1bFlCeHNaQ2tJQWs3?=
 =?utf-8?B?am1TRmRSOGxEd0QxODY5VTI0SUQ0ZTJFUnNYV2xQa0ZpQWhZU0NuTVVkRVR1?=
 =?utf-8?B?cTRoQ2VWZ1A2a0szL0VuNmZtWnR5Z2oxZWR4SE9KYXFMbXNBN2NwQVhVQkk5?=
 =?utf-8?B?dER5T3BmdUx1WUtrcXg5eWt6QlVrcmM2U0RTYlRxRzc3cmtUa3dkdlM2N1dG?=
 =?utf-8?B?c3FTdk1WSk0wdC9QZEJIT21EVmtrbUJKV0dqVzFLZ2hIQmcvMWUvUGpzT0Zx?=
 =?utf-8?B?a3V6Sjc3MlNWbWpiUnhmbTVjbFhoUisvU25OaWw3SFA1YlVpcEEyMzFIQlMr?=
 =?utf-8?B?WllTUldqNFZvK0NBV1NHNXJKSWlKWlZ0Mjh6TFdmYVZHNG1BWDczdXd4VVBZ?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c932230-8c2e-4a45-73ef-08de17b1ff10
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 12:43:59.1833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyaAmm5zeC7lOo5OPscZlmXxf3yTcE8AyG392q/dv84ePgGwLF+2UCcyRjlMmVHWJJ2xG4O9rX7n767FW0uMVteNvKHtFK8MC4a50GZotYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
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

On Tue, Oct 28, 2025 at 06:58:26PM +0100, Michal Wajdeczko wrote:
>It is expected to be a common practice to configure the same level
>of scheduling priority across all VFs and PF (at least as starting
>point). Due to current GuC FW limitations it is also the only way
>to change VFs priority.
>
>Add write-only sysfs attribute that will apply required priority
>level to all VFs and PF at once.
>
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── .bulk_profile
>      │   └── sched_priority		[WO] low, normal
>
>Writing "low" to this write-only attribute will change PF and
>VFs scheduling priority on all tiles/GTs to LOW (function will
>be scheduled only if it has work submitted). Similarly, writing
>"normal" will change functions priority to NORMAL (functions will
>be scheduled irrespective of whether there is a work or not).

the only place documenting what low and normal mean seems to be this
commit message. We need it documented somewhere that is user visible.

>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c | 42 +++++++++++++++++++++++++-
> 1 file changed, 41 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>index 0430ffaa746a..19724a28fb33 100644
>--- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>+++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
>@@ -24,7 +24,8 @@
>  *     ├── ...
>  *     ├── .bulk_profile
>  *     │   ├── exec_quantum_ms
>- *     │   └── preempt_timeout_us
>+ *     │   ├── preempt_timeout_us
>+ *     │   └── sched_priority

below this dir list I think it would be a good place to document them
and then make this show up in the rendered documentation.

Lucas De Marchi

>  *     ├── pf/
>  *     │   ├── ...
>  *     │   └── profile
>@@ -108,9 +109,48 @@ static XE_SRIOV_DEV_ATTR_WO(NAME)
> DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(exec_quantum_ms, eq, u32);
> DEFINE_SIMPLE_BULK_PROVISIONING_SRIOV_DEV_ATTR_WO(preempt_timeout_us, pt, u32);
>
>+static const char * const sched_priority_names[] = {
>+	[GUC_SCHED_PRIORITY_LOW] = "low",
>+	[GUC_SCHED_PRIORITY_NORMAL] = "normal",
>+	[GUC_SCHED_PRIORITY_HIGH] = "high",
>+};
>+
>+static bool sched_priority_high_allowed(unsigned int vfid)
>+{
>+	/* As of today GuC FW allows to select 'high' priority only for the PF. */
>+	return vfid == PFID;
>+}
>+
>+static bool sched_priority_bulk_high_allowed(struct xe_device *xe)
>+{
>+	/* all VFs are equal - it's sufficient to check VF1 only */
>+	return sched_priority_high_allowed(VFID(1));
>+}
>+
>+static ssize_t xe_sriov_dev_attr_sched_priority_store(struct xe_device *xe,
>+						      const char *buf, size_t count)
>+{
>+	size_t num_priorities = ARRAY_SIZE(sched_priority_names);
>+	int match;
>+	int err;
>+
>+	if (!sched_priority_bulk_high_allowed(xe))
>+		num_priorities--;
>+
>+	match = __sysfs_match_string(sched_priority_names, num_priorities, buf);
>+	if (match < 0)
>+		return -EINVAL;
>+
>+	err = xe_sriov_pf_provision_bulk_apply_priority(xe, match);
>+	return err ?: count;
>+}
>+
>+static XE_SRIOV_DEV_ATTR_WO(sched_priority);
>+
> static struct attribute *bulk_profile_dev_attrs[] = {
> 	&xe_sriov_dev_attr_exec_quantum_ms.attr,
> 	&xe_sriov_dev_attr_preempt_timeout_us.attr,
>+	&xe_sriov_dev_attr_sched_priority.attr,
> 	NULL
> };
>
>-- 
>2.47.1
>
