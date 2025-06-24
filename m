Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC215C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 16:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EE710E5E7;
	Tue, 24 Jun 2025 16:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/glRvnt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2852D10E5E7
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750780943; x=1782316943;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y0xUpBKM7SJK52mcSfHOIpL5VF6l5BbgJQBD+hWaOeU=;
 b=i/glRvntfssbQA7mJSPUi/D9cBtEAKF9RFvC7mePdZqSa/eL6eQnl4NG
 iBEeSXix3DcuNuN0BwldDSW/Qjwz45hJhIvXrsixTtmM3ycnUV1pR+i7A
 l377U2yBbhO7W+L2zNrlo4JwcGmsSPU6tR6XrAm7eY3pAjZ1hrBjoHaFO
 JDSoQRLfo2oqbBmIx3jAUfsKfLzx4vxKzv+n1/JLLZW/w+zhB38jAqjxb
 34QAiUeFI1OAEOfWdcQjuAThvfNJ4RJIb2S10hztghSaeyFzVqVt8PE9W
 kBs8aQ6/8tZhATqsQ+ywkSO7vtbFMBP3eq5ne6xMyN/+hZgoqtYd3p5e5 Q==;
X-CSE-ConnectionGUID: ASek3mqsS+WuDdt2ltBZQA==
X-CSE-MsgGUID: e2FQ22xRRRKQZZ6n9SbGrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63629797"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="63629797"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 09:01:53 -0700
X-CSE-ConnectionGUID: Y0NzGcYMTS2uteVCh1nAsw==
X-CSE-MsgGUID: FaQLi2/3R46LbLUEMhvADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="152247063"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 09:00:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 09:00:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 09:00:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 09:00:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCkemNJs3CElD0tRnui/HxdDifgVb+bWW/tPu+GGWr2OUvVdXxBQ/ftDw4CokcAecEoOEe87AD5xnz1rJYbaNgRsNUJB39LDY2Wl+nLQdJm6ooITrGWxG3o2Swo/oKbscT73VbPPcWhUrd/+9X7VYtvLj3O5ZalvznO0PirR6kTx+ZEGeSlgt+H+hMtclU/5vQz7PQJwEOKykqLwDws88WN/3TPkhjAkySsYCBGStGzHdlKaAujulgOnInp/vRfbq8Se4opgYeiPpla3PzI1O5fGFokeRnhFlmV9LYXA0quvH2Q6q8D1tTsM0FOtsjvp/MQd7nDrTuU164n1YduIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwF0pwt5lRQXs+6BvQJL/HC3RdsG5I6/VeiuiRKxgPU=;
 b=kx7ZeaGq9o1w2W3g40hwFN+kgM98ckCaCqar0kAmeqpVZkjHfYGSbGa/gamvTAve4NmSb8cx8z6bgrzBgBUxkHamuyAjuuxP4CMTyI+g/heGJhtamZFmYNcNt8CKLcGKg6lsd1ZHeW325sQbDjM3XF0unXEre0yZs2ZExEi9hG6qRezxy5oxLtvqPpqII8WPpiPkB+zcHGfEzW2McYxJJwlhtOaFWWmtA/hu3UkiytaoOEToWCEjiJ3YmwZJLDcBQyB2QsCg+BOKq5gjlPiJokxW2qUdybUmK/l8Iss5HbB9EQJ56GKd9OEVrP36tDmlKYIy2X1c28pAjXlI3sKumA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8699.namprd11.prod.outlook.com (2603:10b6:408:1ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 16:00:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 16:00:23 +0000
Date: Tue, 24 Jun 2025 09:02:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
Subject: Re: [PATCH v9 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aFrL+gP0hK2qj45U@lstrano-desk.jf.intel.com>
References: <20250624100010.12254-1-satyanarayana.k.v.p@intel.com>
 <20250624100010.12254-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624100010.12254-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: 2090c91b-0ef4-4e00-d8a7-08ddb3383a10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2hHK2Z5bm90QjZPOEJrbG5pcjM2ODIwSjN6UnQzS0l4RUcxZGpReW5LbERM?=
 =?utf-8?B?MjMxVEdmbXQrQ1RxeHFGWUFqQTVFOWQ4QldyR09XRGp3Y1RPM29oOGRaejZu?=
 =?utf-8?B?cURFaVJ2dlU2ay93OUxFSDU5c2JNRTRYejl0NFhobmtWNDVFNSt2RE96RTJS?=
 =?utf-8?B?c3FFcitjOVUvMEd2ZU1ZcFJXRHJOdUlqdUQ2T1V6TEpWTXZvVXFGSXVYNjNV?=
 =?utf-8?B?dWIwdHF0ZWxyeDd6S2t6RmZzK2sxQWlEKzZ4dkJkWXlRQ3FzZUszN1ZDbW11?=
 =?utf-8?B?SjhvRDA3M3Q2eFZOZXlRTnd0WVdiUGdzM1I1aGNSQ0hJZklLakMxUDl1TlhV?=
 =?utf-8?B?Nkx3QjMxMFA2NmZWQkQydlZlSVZoSXRBUkNtakUrVGtXRGVEaG53NnpqTS9y?=
 =?utf-8?B?VmRMMnBNS2grUmM3TXR4dzlzazJQcGtSK0lvbk93RG1NVUlwWjIyelhoOG1S?=
 =?utf-8?B?RTI0THNmbzhpS0taZzJTeW9KUUZDTWlMako1WFhPVHRvNXIxeUpCMndKOGds?=
 =?utf-8?B?WjJZQklIZHBlUlloWHhZUFl4M0lHYVZESDVaOEJVNVBjcTVVNTB3MXoyMnk4?=
 =?utf-8?B?aHliMnZ2L3BoNGdIT2JjTHVmT1FSd2Y3eDdyaXpubUJ0TlJwYnJZeFUzaGRl?=
 =?utf-8?B?OEpmdE55THBFUE1ZMDJvWStVUHdFKzhoVVlxc2wxSlZjUkwrSkRkVHoxZGd5?=
 =?utf-8?B?RzE2N2x1SUl2d2tGc0NhbHp5YVFpYTBsL0hPTzFBbVdCZnl0SDJZazFldFV6?=
 =?utf-8?B?VTgxSTNYdXJRQlpaTUtZOWR3TTh1YjdGOS9vR252Yjg5SG95VXpPbTlKbnM1?=
 =?utf-8?B?RW9oMStLZE04QmwyRDZXenlFNzlpcjkzN1JZTG5FbFgxN0VzRWhFWG9xZXlu?=
 =?utf-8?B?Z2pMVFdLTlg3Y0NQK0pad0k4a2h4bUF4TXBYaUlWcDcyaFVpTkhKSXFtc1pW?=
 =?utf-8?B?V2J0NngrUGk5ZlVqMk53N0VaUzRITFRPeG9kWG1GQnB1QUFxMjgyMC9XSzhs?=
 =?utf-8?B?SFBPZTJ5VnlnOFFjTXRka1ZZbFFHRlhOV3Z4UExXWUlqU1RRdGZmT1YvZVE2?=
 =?utf-8?B?eHMrbUxaRmNVVTMwSlBWZndNb085U0J1cHNtUmZXVDRqcWxhOEdYT1RlNGJC?=
 =?utf-8?B?TlYzcnBoRFVVOGVsTEx4a0YrQVZyQ0duU2l2Q1VHRi9yM1lra00xbDlHV0dJ?=
 =?utf-8?B?Y3h2citRbFpraFJHVFdLRkhlRVFIZGZodi9XUWRXSC9wYXJWbExpK2xsWjhI?=
 =?utf-8?B?dWFhSEM1bU5oRXR2Q3J6TmFlL0Q0REJleXZhd2ljN2Q3N1RlQXo0TVgzdXp1?=
 =?utf-8?B?Nm1DR0piYW9OLzNZVnlRNTBIdG83VzdJK1g2aFdkL2ZXeG1od1Z4SnkvZG5R?=
 =?utf-8?B?U3BMeHcrdEdPakdJckJsd2l6OTBZUXViNmt6Y3dZNzVKdkFyaDFXQnFMSkNv?=
 =?utf-8?B?dWp6alRocENFb2J0SjJ5UGhGKzcwM1hLNFJrWnJUVEhjd1F0TTc5WnZHYzVx?=
 =?utf-8?B?TVBORytteGVsOVNXNmNicC9mU3lYQ1dkV2thcDNwOXdoUC9YZXBUeUdzYTJB?=
 =?utf-8?B?bnlZWjdGai9FYmtGVWl2OEs0UU9NdzBCbHh0bjRMUzhuQndmTzIwbEJwakQv?=
 =?utf-8?B?ZWtwZGxLQU8xelVjQUxrRjgvMWpCR09RWitKMnpNcmZiOWhKdTV1UXdQN0JX?=
 =?utf-8?B?TUdkWVhUUWhZMGc2ZHI1Yjh5aVZkbnpiLzNpT29panBKc2RodkVGUFBlNkto?=
 =?utf-8?B?VWs2T1NrcnFRbHVjUDlKeGdNOElZakEyWjE1SCt1NVMzNjNPRllJai9yNkhn?=
 =?utf-8?B?K2thTmZrdFNCVHdUZ0JvZmt1ZXVEbndqN2QxSlhZMisyQ25kWEZJcENqMWw1?=
 =?utf-8?B?TkhCSE91MU56bVJZS3NNVXB0UlZ6Wi9ueCtNS2hlSlplaC9vaFlocWZHVis4?=
 =?utf-8?Q?frEVzNxAxYw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFFDcFBzQ3Y4NC8wRWp0NkNraXJsR3JLSzVGaDRKeEdaTEN6b3A2TXdYVHZO?=
 =?utf-8?B?NVZkY2tYVWxkZ3dscS9qUE1QTENKWnJZYjRDQi9UazJUdWd3S1g0N1BlYmtr?=
 =?utf-8?B?OUhrWlZramIzc2FXSHVTS29HYjdpSWVDMmZ5MGJ2ejVUeGRpRDRpcjZCRE9K?=
 =?utf-8?B?b0pNTG1HNUtNa212dGZGSGFNUi9uaFRzS2xHMitEc1R0YUZYYjJ4NitMNXNP?=
 =?utf-8?B?TFR2SFI1ckFpK2tzTTVnVHdIbUd1OE9PNDhkZW4yLzJMV3BZNjZ2TVRVcnNm?=
 =?utf-8?B?OVBJUnBwQ2pWTGwvUkZaVGQ1VEJwcTl2SzJPZHQ2cmJ0bklDaE5BMEZ5UTRu?=
 =?utf-8?B?Sm5LYUk5OE4yczhjaUFHdWhYYXhSVnNYMFI0ajhzTTlDTHpjTTc5eC9nNXVY?=
 =?utf-8?B?MEplSEF6TlhOMXljUE10N2VmL25Dd2JmUS9jciszTWduZ2ltUjhCWjlMWlZC?=
 =?utf-8?B?aG9ERmlDRWJlejA4RXZJTUpIWmlmQUtLc0ZYdk11cTZJUVI5eFdiUTdlaVNJ?=
 =?utf-8?B?TTN4VVE1Vkx4Y3VqYzEyUHUyZ0RwYW1CN2hPc0lwZHgxMU5ZaWV6bDdLSzA1?=
 =?utf-8?B?QWpBdzh5bWZldmVoUmpVczBvajg5My9reUE2MFNvN296cTJyTlZaM1JVOGk0?=
 =?utf-8?B?NlBzNnFiaEFwbEhwUGNKcHJnOXdMMnErNXczS1NEYnQ3VFZaTTY3Q005VVI3?=
 =?utf-8?B?M2JjQWxlaUpoTDJZQ3NXUi9nZGt3MWpNN3hla2p0UDI0ME0zVWlqU0xEZjRU?=
 =?utf-8?B?ZndkSXlJck5GQ2hFTnBNVWxacGZNRWQ2alo5Z3F6b04zMWFUbnU1VDFUOHNM?=
 =?utf-8?B?ZnFmY2h4R0Z3Z0grSThsL0FTMm9jRUVyb0FxdzNwRmFWNUxmM0JUMHVjRXdN?=
 =?utf-8?B?WnprdFJFOU9BdUdoNGVQQ0xBQlo3WExSNmxDVkNxZ0pMTGErZmlmNlZrZHRY?=
 =?utf-8?B?K0NRZ0RXOEJsNk5xUWdJcTM5cUpPUmk4b09FMGp3d2NrdmphbUhJS01RdmZs?=
 =?utf-8?B?RUJuQmROakNFc2VQdDNNdEhQSjMxSm9tVExDOG9zTjRyNVJ1ZDA3bU43SjdE?=
 =?utf-8?B?NCtoaXU5b0JNZ3h2UkhRMDFKd2QwUEZRMlpKMVdqVEd4enR0ZjVKMWtpa3N2?=
 =?utf-8?B?SWNxUkNLTHBOdEZXRW41T1ZmOEVEQXM0ZDNWS2x4azVZalhFOGlLaVdDZ0py?=
 =?utf-8?B?aUlmUHlrVGQrN3FxaUl3QjJmZklwTExyU1BRTmhYcjNDbm56SytDai8xaC9Z?=
 =?utf-8?B?YWxDbjNReE5qMVVxcldJUzVUMmdGZW56anlFb2J5bGZwRUZuMC9IUXdyU1dU?=
 =?utf-8?B?Si9XcmorRE9mcTByZkQ2NDU3N3lCb1BJSVk0aU0vVVl0bzhWTHNPZGJmWHhU?=
 =?utf-8?B?L1FYNFRZektrUkcxUFNDSzdPZURVSGNiZ2hLUDNDb2JKUU5GTWpvSXRZNHJ0?=
 =?utf-8?B?NnA4TjVLQWU4YlZMQmFlQWpNU05OaGV5QmJOTlBaRCtpS2VySi9qUExoLzIr?=
 =?utf-8?B?a1BKYzZBVDN4Y0xnY3JSMkdOZDlzQ2R4QXJvekFYd1AvdXV0OEhnVUYybXY2?=
 =?utf-8?B?eWFTQ2xSSlgwVUZxRGpZZnlBNG16RXRuNnlSdUNBRC9TckIvZ2xsRFUxeGxs?=
 =?utf-8?B?SnRBaE5uVXh0QTRUQVFGeURtTm9CRVEzMlNqL1JUU2JqWVhRRjdGOEkvRmkx?=
 =?utf-8?B?WkZ1VWVKVkdyTlBaVnZFUkRrbWdRU1Z0VEYwR0ZpSHdoVXZhRDdvL1FJZkxB?=
 =?utf-8?B?UUxkTDgvMHRGN0VTZm56ZmxYMHEyMEJ3TnhoeDJGenBPLytteExWRVlpb0FX?=
 =?utf-8?B?TXFQSU5nQ2xZemhMOEpYQlUvbXlxNzJtYTYrbnZhL1FrbzRnTHVOeFFTeGlR?=
 =?utf-8?B?c3grOEc1bVZuTElmU09wc0JWK2pFbkgyZndDcFVUdDJ1VFhSMndoRTk5aGU3?=
 =?utf-8?B?ZkR1cTByMmNLT2tDMnBaWUsxcGdrL2ZUMi9tUU0rY29GTzU3TFBSNGl4ME1U?=
 =?utf-8?B?TDU3Rjk1anU4LzVMajBlaUkxTGZEc2psd3RlUG1yYVhIUnF3OVpiaythSUhZ?=
 =?utf-8?B?ZDNBVUVOOTFyNG83SWZRU3djRzBRNzZXWGhVTHdld1Q3WjRKYXN3aDZtQ2hX?=
 =?utf-8?B?U1lTQ20wbTAzYi9XcWk3ZVo0RUFrNFNyKzVWb25xWUZkQk1FTC9NOEZ3WW55?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2090c91b-0ef4-4e00-d8a7-08ddb3383a10
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 16:00:23.2555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpyjJ+0wJRrQvqQChfC9GrFvmnaZ5TfEW7tHM7qpVu5zMQuC/8sai9dsogGJ1liFlvt5sh+b4y3Df1PBxM6xvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8699
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

On Tue, Jun 24, 2025 at 03:30:09PM +0530, Satyanarayana K V P wrote:
> Attach CCS read/write copy commands to BO for old and new mem types as
> NULL -> tt or system -> tt.
> Detach the CCS read/write copy commands from BO while deleting ttm bo
> from xe_ttm_bo_delete_mem_notify().
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> V8 -> V9:
> - Removed MI_INVALIDATE_TLB after emitting PTEs (Matthew Brost).
> - Fixed review comments (Matthew Brost)
> 
> V7 -> V8:
> - Removed xe_bb_ccs_realloc() and created a single BB by calculating the
> BB size first and then emitting the commands. (Matthew Brost)
> - Added xe_assert() if BB is not NULL in xe_sriov_vf_ccs_attach_bo().
> 
> V6 -> V7:
> - Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
> a list. (Matthew Brost)
> 
> V5 -> V6:
> - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew Brost)
> 
> V4 -> V5:
> - Create a list of BBs for the given BO and fixed memory leak while
> detaching BOs. (Matthew Brost).
> - Fixed review comments (Matthew Brost & Matthew Auld).
> - Yet to cleanup xe_migrate_ccs_rw_copy() function.
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Attach and detach functions check for IS_VF_CCS_READY().
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_bb.c                 |  35 ++++++
>  drivers/gpu/drm/xe/xe_bb.h                 |   3 +
>  drivers/gpu/drm/xe/xe_bo.c                 |  23 ++++
>  drivers/gpu/drm/xe/xe_bo_types.h           |   3 +
>  drivers/gpu/drm/xe/xe_migrate.c            | 129 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h            |   6 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       |  67 +++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |   3 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |   8 ++
>  9 files changed, 277 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 9570672fce33..533352dc892f 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -60,6 +60,41 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +{
> +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int err;
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +	/*
> +	 * We need to allocate space for the requested number of dwords &
> +	 * one additional MI_BATCH_BUFFER_END dword. Since the whole SA
> +	 * is submitted to HW, we need to make sure that the last instruction
> +	 * is not over written when the last chunk of SA is allocated for BB.
> +	 * So, this extra DW acts as a guard here.
> +	 */
> +
> +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> +
> +	if (IS_ERR(bb->bo)) {
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> +	bb->len = 0;
> +
> +	return bb;
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
>  static struct xe_sched_job *
>  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index fafacd73dcc3..32c9c4c5d2be 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -13,8 +13,11 @@ struct dma_fence;
>  struct xe_gt;
>  struct xe_exec_queue;
>  struct xe_sched_job;
> +enum xe_sriov_vf_ccs_rw_ctxs;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021a..beaf8544bf08 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -31,6 +31,7 @@
>  #include "xe_pxp.h"
>  #include "xe_res_cursor.h"
>  #include "xe_shrinker.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	dma_fence_put(fence);
>  	xe_pm_runtime_put(xe);
>  
> +	/*
> +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> +	 * BBs from BO as it is no longer needed.
> +	 */
> +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> +	    new_mem->mem_type == XE_PL_SYSTEM)
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
> +	if (IS_SRIOV_VF(xe) &&
> +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> +	    handle_system_ccs)
> +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> +
>  out:
>  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>  	    ttm_bo->ttm) {
> @@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (timeout < 0)
>  			ret = timeout;
>  
> +		if (IS_VF_CCS_BB_VALID(xe, bo))
> +			xe_sriov_vf_ccs_detach_bo(bo);
> +
>  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
>  	}
>  
> @@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  
>  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  {
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
>  	if (!xe_bo_is_xe_bo(ttm_bo))
>  		return;
>  
> +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
>  	/*
>  	 * Object is idle and about to be destroyed. Release the
>  	 * dma-buf attachment.
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..642e519fcfd1 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -78,6 +78,9 @@ struct xe_bo {
>  	/** @ccs_cleared */
>  	bool ccs_cleared;
>  
> +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> +
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>  	 * objects. Exceptions are system memory on DGFX, which is always
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..72f342924ad2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -940,6 +940,135 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> + * @m: The migration context.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> + * memory and vice versa.
> + *
> + * This function should only be called for IGPU.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
> +
> +{
> +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> +	struct ttm_resource *src = src_bo->ttm.resource;
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	u32 batch_size, batch_size_allocated;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_res_cursor src_it, ccs_it;
> +	u64 size = src_bo->size;
> +	struct xe_bb *bb = NULL;
> +	u64 src_L0, src_L0_ofs;
> +	u32 src_L0_pt;
> +	int err;
> +
> +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> +
> +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> +			&ccs_it);
> +
> +	/* Calculate Batch buffer size */
> +	batch_size = 0;
> +	while (size) {
> +		batch_size += 6; /* Flush + 2 NOP */
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = min_t(u64, max_mem_transfer_per_pass(xe), size);
> +
> +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +					      &ccs_pt, 0, avail_pts, avail_pts);
> +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +
> +		/* Add copy commands size here */
> +		batch_size += EMIT_COPY_CCS_DW;
> +
> +		size -= src_L0;
> +	}
> +
> +	bb = xe_bb_ccs_new(gt, batch_size, read_write);
> +	if (IS_ERR(bb)) {
> +		drm_err(&xe->drm, "BB allocation failed.\n");
> +		err = PTR_ERR(bb);
> +		goto err_ret;
> +	}
> +
> +	batch_size_allocated = batch_size;
> +	size = src_bo->size;
> +	batch_size = 0;
> +
> +	/*
> +	 * Emit PTE and copy commands here.
> +	 * The CCS copy command can only support limited size. If the size to be
> +	 * copied is more than the limit, divide copy into chunks. So, calculate
> +	 * sizes here again before copy command is emitted.
> +	 */
> +	while (size) {
> +		batch_size += 6; /* Flush + 2 NOP */
> +		u32 flush_flags = 0;
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +
> +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +					      &ccs_pt, 0, avail_pts, avail_pts);
> +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +		batch_size += EMIT_COPY_CCS_DW;
> +
> +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +
> +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_DW;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +						  src_L0_ofs, dst_is_pltt,
> +						  src_L0, ccs_ofs, true);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW | flush_flags;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		size -= src_L0;
> +	}
> +
> +	xe_assert(xe, (batch_size_allocated == bb->len));
> +	src_bo->bb_ccs[read_write] = bb;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..96b0449e7edb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -24,6 +24,8 @@ struct xe_vm;
>  struct xe_vm_pgtable_update;
>  struct xe_vma;
>  
> +enum xe_sriov_vf_ccs_rw_ctxs;
> +
>  /**
>   * struct xe_migrate_pt_update_ops - Callbacks for the
>   * xe_migrate_update_pgtables() function.
> @@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> +
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 9000d618978d..7fde8aab3e20 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -5,6 +5,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "instructions/xe_gpu_commands.h"
> +#include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_migrate.h"
> @@ -206,3 +207,69 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  err_ret:
>  	return err;
>  }
> +
> +/**
> + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> + * @bo: the &buffer object to which batch buffer commands will be added.
> + *
> + * This function shall be called only by VF. It inserts the PTEs and copy
> + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> + * function.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_migrate *migrate;
> +	struct xe_tile *tile;
> +	struct xe_bb *bb;
> +	int err = 0;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	tile = xe_device_get_root_tile(xe);
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		bb = bo->bb_ccs[ctx_id];
> +		/* bb should be NULL here. Assert if not NULL */
> +		xe_assert(xe, !bb);
> +
> +		migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> +		err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> +	}
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
> + * @bo: the &buffer object from which batch buffer commands will be removed.
> + *
> + * This function shall be called only by VF. It removes the PTEs and copy
> + * command instructions from the BO. Make sure to update the BB with MI_NOOP
> + * before freeing.
> + *
> + * Returns: 0 if successful.
> + */
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_bb *bb;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		bb = bo->bb_ccs[ctx_id];
> +		if (!bb)
> +			continue;
> +
> +		memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> +		xe_bb_free(bb, NULL);
> +		bo->bb_ccs[ctx_id] = NULL;
> +	}
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5df9ba028d14..5d5e4bd25904 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -7,7 +7,10 @@
>  #define _XE_SRIOV_VF_CCS_H_
>  
>  struct xe_device;
> +struct xe_bo;
>  
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 6dc279d206ec..e240f3fd18af 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>  	XE_SRIOV_VF_CCS_CTX_COUNT
>  };
>  
> +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> +		struct xe_device *___xe = (xe); \
> +		struct xe_bo *___bo = (bo); \
> +		IS_SRIOV_VF(___xe) && \
> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> +		})
> +
>  struct xe_migrate;
>  struct xe_sa_manager;
>  
> -- 
> 2.43.0
> 
