Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574FACCD199
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4BD10E1DC;
	Sat, 18 Oct 2025 02:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGDR4YPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A393810E352
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755827; x=1792291827;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=40FT+Y/LoGh9zGBb4Gbj7tSjKE9GLq349h71o9XT1tc=;
 b=TGDR4YPpMnjEZ4FyPrmLwSeVOALxGpw1bqhCx5toSNPMZ90roUAzq/Z9
 BzrH9HDD4K70YWzcNGOMA55pjt5BB0WLqWIQkZRNqgAiEJj/1LuOBASfI
 lY3jDM1zHNxDzkHVJ/rFnEqyZcASH2mGsujT5PTCAIglqiwLFevm7Y73Y
 wi8itL7WLnNJyQJ5R0N5PCDiryQ2q2OJbrHPP/PPzlkzOkldO0ul8Xvmu
 Qp5BtzhSXOH9aWymUcPACh6/dMRZqM0E1VeudhqW+W2ENq5a9SaeDSl6n
 ysFNRlBb9q0QB0B1kLwYKaGPBZjBv7wxXHvmX9i3s73lEDA7Z1N4KhzgQ g==;
X-CSE-ConnectionGUID: wLAkTzsVTmKZErGWNjafGA==
X-CSE-MsgGUID: a13PpWQzRIiq/RT1z6wR4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="65586699"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="65586699"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:50:23 -0700
X-CSE-ConnectionGUID: hlksRPhjSHmoIho26sTuQA==
X-CSE-MsgGUID: FW4ST65jQYKbd0KOyvk0ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="182820082"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:50:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:35:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 15:35:17 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:35:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dRhLxXkYl2RVa+KBvy7k0xsoVia+CbujF0NzN4fQHtiouPXAUoXVqARtTt9mGwEEMvVZPl+sfBZ+RzEZe91PLn6wB9nU6xzcN7qOOqKUlNV+gkcRn2Ip+Q3q1a1tbY7pKR7xfTlpz20BaCO+DWotPcrSX86RUsONGSpBorsTki5MYhsQfvrv2JCKTPahBcYs+2v4GchqBuWs8cGN0x3xnxS4GycYbcIcOwIy7ZLDsyJk4djIn4LJjhJtk2voA0jlmGwszX3Jzg4w5JvCwSdY12omqteuy5vCHJzbF5qrCe+ig3238o1k+szC3HYr0vOCoGvfZx0fRGjHROjNi5cVXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmdoOI/8i8mpi2/go+2FlTk1tsOWDPRcI8wpyWJwo40=;
 b=qQrhRn0S9Dq2LrLLRItQpEAvY/060yY+KH7b7TlWfyN3BBYZwUWNGSZm7YwnpCGRgve8JSXLavZuMQheo3Uxh249Wr0knMwFREc5v0Bi2E6saUNb8FydJ8xhTpLapUHLKLWUyXMmw8Px7gqhOXbfGrtHeD6ZUkc/zeXV5LWgr6hs+eTC9oymyPMd12j5A70oVAoIbK3Jnx8MkqNw8Cz5RORsP3E28lFF9hxY2j7GuCWS7lcBRMx/6kP/wHQms41GYAtGczG8dStu4Sz5g0dMNm9JnUpvbW5h5Jq0Sh1+tC7KRLQ1iOqaKvVvfCW8A6etDgSxauxymqketeeDcbYq0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5031.namprd11.prod.outlook.com (2603:10b6:510:33::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 22:35:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 22:35:10 +0000
Date: Fri, 17 Oct 2025 15:35:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "K V
 P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aPLEmxlCHYgcrwbx@lstrano-desk.jf.intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPJSNo8XM3cpGZCb@intel.com>
 <78cc87ee-6d2d-4a85-9e42-7836b97ea435@intel.com>
 <aPJgP9ShLrvSeXzU@intel.com>
 <34f2d811-6d95-450b-978f-e4fa2d21c986@intel.com>
 <aPJ0I7V4srCj6qo4@intel.com> <aPKJRxvJzdvEZ69f@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPKJRxvJzdvEZ69f@intel.com>
X-ClientProxiedBy: MW4PR04CA0390.namprd04.prod.outlook.com
 (2603:10b6:303:81::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: c39f64f0-9d26-41fc-7f8c-08de0dcd6e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ellqM0FjYkdSRFRkOTczS3MrZnBzcCtqcVJyY0dFUXdUQjlNQk00Q3NhZkMv?=
 =?utf-8?B?Q2c3VVBKUUpPVXNubFBkeCsxZTlvU1lYMFMzR2VSSmR3MXgvTnU5Yis5aDF3?=
 =?utf-8?B?VW5MOWc3dXpyV3RRVGUvZnNoMkFqaGJTLzhHVlhrbXFEZit1SEZEazJWTjNw?=
 =?utf-8?B?dEl4NExNckRLUGVaZVZPY1lqdWUvOHRtM3BvZVR5UjV4RnRiMTdQYkZrM1Yx?=
 =?utf-8?B?VnJKSEdCckIzTlJVQlBhazJkZkhKQmYwdDA4T1ZYMHhHWFNmU01WeVlBQUdj?=
 =?utf-8?B?a3F2V3NpOTR5OGZ2cVFFaWc1RXRMSVhyZFBWcytJVWdrTXNKdWJLTEFhakxk?=
 =?utf-8?B?R3FBV0pnZjdIYzFibVY4T21ZVXh5UmVOMVM2RjRQRlU2V3NBMVdpRUZWbHRa?=
 =?utf-8?B?NkJ2UmwvYXZHaE9iUzRHNG1yY3pDRjAxNFBadTkrd2IycDQxeHpFblEyczJ1?=
 =?utf-8?B?M2dqUGd5OCtQNGZES2RpRFQzRmNFVHJJSHdDeHBheXBtRUQ1R0ZCbFhSZGZF?=
 =?utf-8?B?azdiWGhvUGhDQlBsRWd6a0lKaEtFWm5pNlVPK09yWU9zN0hrTS9HSzBxZDBz?=
 =?utf-8?B?SEh1dnZLa2s0TS9lK1NheXY3VGJlL3hkbm1qSGpYaitVZnNlN1BvTk5sOGh1?=
 =?utf-8?B?cVREQW5LM0ZQNGVodTdseHV5OHlxUW9WVVNXb0NTaDlibEFDVEtieFB6dERm?=
 =?utf-8?B?UDgrWlhoTnF5ZEYvTnFPYmRSRGhrQXE2RC9VUG1Jc3JYdGVkNVliaExsQmli?=
 =?utf-8?B?bGRXMlVwZlZidVdNZDJ0UU0vOUI0M29naGxQWERSNGN1T21PT1BJTHpLbE0x?=
 =?utf-8?B?alZtQitRcXR5enRiRXRZSlVUeFF4SkhiY0JJTWNuRUVTZ1JIWFhrQWpSZlR2?=
 =?utf-8?B?aXRpaTk1TC8yVitOYmJhcDhPQW5oL0xPNDZ5b2lDRUQ3SmJGUHBENDhYam81?=
 =?utf-8?B?S0RzMVhzT3FiRjNJQTAzNHZUZmJacHN3TzRENktiMDVYWlNzWXd2SGY5bVBW?=
 =?utf-8?B?NmM2M3pQVW40WEN5Y1NoUnVaT1lHZ0tuNXhEazdnam5HOHhVeWE5ekJWVXZv?=
 =?utf-8?B?dEduTWFJaWw3OUVCaFFqRTQ5U0N4QnJZSHBCSHVjVnZsQ3JDWnlsYkZZNWhB?=
 =?utf-8?B?aW1NZ2VMWmpTY01Ba2pUbFQvalh0Tzd5R3RORzlxVDlRREtnQ043endrNGVx?=
 =?utf-8?B?RjBkU3JNUS8wazNSTHlkYzJjeGVramZtM3RXY21VbEhkQ200WHRXd0YxNHFG?=
 =?utf-8?B?YVM5SU5iR2VXYkxhY3FBd2NxN01vbkRSMFNPUEQ2ZVc5ckNXL2hGZHo1U1hz?=
 =?utf-8?B?LzFmaDRLMlJ0eCtvaFFlV3U1Um5rcHFHR2M4UTdkbjN3NExMalRoNjhCRTdN?=
 =?utf-8?B?VjA0N25yOHhvUzZCSVVEWHJKQ1hUeUw2Tys2NkJhNUlLNmNWZlh0c09ZejYz?=
 =?utf-8?B?RDJZNWRnZFVUMjMrSTlHRUR3VnM0cWNMU2pOdjVMNkp3TEhod0dXM2lGMDdk?=
 =?utf-8?B?b0lKeXZoVFVvYzVucjRCREo2RjJJRmY0bWVJK2FVMnU1M05IVGVUNUxuSDB1?=
 =?utf-8?B?T3hHcjd2d1dkQnhyUWovei94dTR5K0xuQWxnN1JFeVhsVWVLZ010RWp2ZXh2?=
 =?utf-8?B?TGtJdEhoaHZQNHA0WEE1bENkeGx3Yjd0OFU3QTM2TTVoUkhaSzBRK21NeXdn?=
 =?utf-8?B?K2NreXdmalFXS2RvTXFJY0JMS1JQZWFSRmg0M20zMU1YS3BKa0tISHJINi8r?=
 =?utf-8?B?U1llbTFqYytZUFltdzl4NDV1emw3eVFRY1h2YVE3dGpSeXl4WTEzcVg3QVV6?=
 =?utf-8?B?Wk4vdmkrWUc2aVIrcUxEQ2hoWjhCemV5c3loRytuMTY3c1JjenZwU3E4d0Ja?=
 =?utf-8?B?a1paU3grWlRBQ1lZWTZLWVZTTEFMUy9Hd1JPN3p5QXpCSFdVZmZoRlo3UFNs?=
 =?utf-8?Q?TY4TA0y87/RQ+e8CyoqhQtt/BSulXAC3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFcrVW4rMjljSFM4YWdWazJJZ3VHWWRhYnBYMXc5cnVVMmRHaWR0YUxNUGZq?=
 =?utf-8?B?c0tLTXZLK3VWcGUwTHdoRnhSVmFKU25FYkZGVFpqVlpLQk9rMzBZVWxISDgy?=
 =?utf-8?B?SjQ5NEpHNlk0RjR5S09HNENhdVFsTWdOenMzblV4Tlovb2VmRVVsUFk5QnNh?=
 =?utf-8?B?THF6cFBIcTFvM1dJR0NTK1FVaXlCbVhSL1NiR29xTFJjdEdHRmdmbHRmeEEz?=
 =?utf-8?B?dE5iLyt2SytRZnRIMmIrM21PQ01wOTVEK3M0TVZtTUsvNXZyMzhPczlsTGVP?=
 =?utf-8?B?WWgrTS9MeVFIYk5JM3gyK3NjMEJRZjQ5NVNpM3UraFBRc3VNZzlETHF1YWZN?=
 =?utf-8?B?SExlaHVaSWlSUDFTS09rUjRzTm9lOGtERHlSaW1OcVFCemV4bVVhZFN1RGZN?=
 =?utf-8?B?dDAyOHZIbDA5MDNTdndJcW5yaTdVaHBxOURuSFpoRWRmVElzUThWZTNJalpR?=
 =?utf-8?B?M3ZJTFdFanlYeGxJdnRUYW1sNjAvV0V0bWN2TCtqOG1JUkd0Q1lMSmdueDdj?=
 =?utf-8?B?aWt0Wmo1cVMrb2oxcGt1RVZDOFpDajRaLzZOSTVBeDR4YXM0eHpDK0lOdDZu?=
 =?utf-8?B?MDJTVDNLeWRrT1VwQlVKTUNLbk9jMnJybGdpNUxZVFhZVXcreGZxT3QxZldr?=
 =?utf-8?B?c1RxaUlpSHpKdUNoN0JELzRoZ2VhSkhRcW5BQnZnRDlySEFRMlp4dnF6aENk?=
 =?utf-8?B?SDR4SXhMWittK3JzN3dMemwrbC9QY0lxZXJvZC9SREcyd2puM0VrSURTVisw?=
 =?utf-8?B?ejVVUTRMVEk0UjFxVERNVnFnQzRRMXlGWkthbER3ZlhuTCtBVVZDVHk0M3Ni?=
 =?utf-8?B?a1Jzbk9kaWxTY0NRQSs1ZG4yM2cwa1RlbTRSZ3pkdXkwOGJxY0lWaUpyeWtG?=
 =?utf-8?B?RFBpbGJNYVExeE8wTjI4YWNaQ3dTWGpNSE52VzQydzJQVnBtOWxBemYvWW9O?=
 =?utf-8?B?T0ltNy9hQnFEU09Ec0xDdEFJTTgvQWhWUHlRT1pmWEUzRlVYYWlGVjlNZXNZ?=
 =?utf-8?B?Z0phMnpBank1MHF5WEczSmpVYmM0OHNUSThlMkdESlIrMStwbjZISW92bVYy?=
 =?utf-8?B?b3I3MGRLTHhSc1JsK2ZhQXQ5dXcvTk5hNTZyZEZsc0hyNkFSaVY4ZjZ1T2pR?=
 =?utf-8?B?WVlBMnhPbkxQeTRPQ3J6YlRNR3R3K0xtdHRrUEdKUnduZ1hVcXQrVDJ1Zmdn?=
 =?utf-8?B?RUV6YlZIODZVbTZCVHU2NE5nTFpyRkFBbjN0aVhENktaUkZSTU40NFBEVXd2?=
 =?utf-8?B?VUZFU0pvajhzSzQ0UEROaG5aRG5yZTk3MWVLZXoxbjFDZHlmWDNXTmFoRWM5?=
 =?utf-8?B?WFAwdVRteWJHYk9TOUtEa3hvd1g1a0RYVWNDcWRwc2xIS0MvM0xSLzJVSHU3?=
 =?utf-8?B?MldKRENxUkVLOXB0aEVsV08zUHptNXFLcXBWREVSaXBKKzZRdENsUSs1YXAv?=
 =?utf-8?B?bkRDMDVPc2JTdTFCMUJMRVdCTFNLVnJ3cmx6SWh4YVJ0ZmZXVzIxcFpCUm5n?=
 =?utf-8?B?ZWgrek9mdXFCckVPYlNGYldHY0NSdVcxZGJtcldabThRUFZ4R21YZ0NnRWtP?=
 =?utf-8?B?Z3ljUVdzVzFsaC9wM0ptcXJ1bXd5WDJMSkp2UkNvZFVjSktSay8yQnFqU0xS?=
 =?utf-8?B?TlhMbHJJYzFadjVCU0RTT0F5ZE1tYWx6enlvV2V4dFZXQ2s5ajdKdzFWeC9t?=
 =?utf-8?B?c0hYL3lWVkVSRktTeUg4SDFsbHN4NzE0dFhBTGZqSjNMUmNINW5tZVI5WDR0?=
 =?utf-8?B?cE1YeFFvTUwrTmxEWU9hYmtJUzFiQUhYaEQ4OTBXU2tsclduQWhvYmpBbWZs?=
 =?utf-8?B?WUVJY0dEN0Y0V0hPemtTcWI3RFdZS2NkcVpIQkt1SmlHNjZuQVgybEdkMnRq?=
 =?utf-8?B?UVhtZGhyK2ROUDhRWTIrazFPS2xkZFR6SU8rTU55TjQ5MnBrZ2xoM3BZZkZh?=
 =?utf-8?B?M20wOUxObCtCc0NsQWZHYy9yZ2RXMW9RdW1idVpzckJBL1dqb0pxRDJPQjY2?=
 =?utf-8?B?QURvOGg1KzBqMmlFWm9SamozSDhkM055TzUzVGFXSjROeUk4M0RZY0FsYnRq?=
 =?utf-8?B?RjZHSzcrbExFdm1ONEtnWTkzZWJCZThBR3BpWDF1dU85aDVnZlVhVTRubnhV?=
 =?utf-8?B?aHljUTdOeXNycE5ZTzBzdkR4M3pSenJwc2FaREQ3ZFZZWUJHcGUwc1RIcEsw?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c39f64f0-9d26-41fc-7f8c-08de0dcd6e31
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 22:35:10.2984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UKb5T3RbHt7YyLrgrSroHldyzxa8xyoyMLZ+xtQiuFY23wDWnGwJTed866gWJRygsPy2a9kCw2WebCDOqEK5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5031
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

On Fri, Oct 17, 2025 at 02:21:59PM -0400, Rodrigo Vivi wrote:
> On Fri, Oct 17, 2025 at 07:51:47PM +0300, Ville Syrjälä wrote:
> > On Fri, Oct 17, 2025 at 09:59:48PM +0530, K V P, Satyanarayana wrote:
> > > 
> > > 
> > > On 17-10-2025 20:56, Ville Syrjälä wrote:
> > > > On Fri, Oct 17, 2025 at 08:46:37PM +0530, K V P, Satyanarayana wrote:
> > > >>
> > > >>
> > > >> On 17-10-2025 19:57, Ville Syrjälä wrote:
> > > >>> On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
> > > >>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > >>>> save/restore while this sequence is being programmed, partial writes may
> > > >>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > >>>> instruction to write the sequence atomically.
> > > >>>
> > > >>> If this whole thing is so racy why don't you always add a new
> > > >>> BB_END after new commands, and only replace the previous BB_END
> > > >>> with NOOP _after_ the new commands have been fully written?
> > > >>>
> > > >> We maintain a suballocator for batch buffer management, with size
> > > >> proportional to system memory (e.g., 16MB suballocator for 8GB SMEM).
> > > >> Batch buffers are dynamically allocated from this pool based on the
> > > >> number of active workloads. The entire suballocator region is submitted
> > > >> to hardware for CCS metadata copy operations.
> > > >>
> > > >> We cannot insert BB_END commands after each individual instruction
> > > >> sequence because additional GPU instructions may be appended later.
> > > > 
> > > > You *overwrite* the previous BB_END after the new commands have been
> > > > appended.
> > > We do not know where the new BB allocation will be. It may not be 
> > > sequential and every BO has a BB. BBs are allocated and freed so often 
> > > based on BOs getting created and destroyed. So, we can't use that approach.
> > 
> > Hmm, could perhaps use second level batches then. Each BO would gets
> > its own second level batch, and the first level would just call them
> > in sequence. Or is this already running as a second level batch?
> 
> This I'm not sure...
> 

Embarrassingly, I’m not exactly sure what “second-level batch” means.
What I can tell is that this is a batch buffer (BB) executed from a
single BB start command in the ring.

> Matt, do you know?
> 

I actually thought about this, and I believe it could be made to work.
However, we would need two BOs and suballocators. The first BO would
contain only jump-to-second-level batch instructions, while the second
BO would contain the CCS copy commands. Even in this mode, the
jump-to-second-level batch instruction would have to be written using
AVX instructions. Maybe this approach is better, but it would also
require a significantly larger rewrite.

> > 
> > It might also be getting a bit complicated I guess, but at least it
> > wouldn't have all obvious problems of the SIMD stuff:
> > - looks like it will explode on non-AVX capable x86
> > - will be broken on other arches until someone implements the equivalent
> >   code (assuming the arch has such an atomic copy instruction
> >   and supports in kernel SIMD stuff sufficiently to use it)
> 
> This is Pantherlake only. And the reason why I asked to add a
> check with error/warn for IS_DGFX()...
> 
> which by the way is an assert... I still don't believe it is enough.
> I believe a return with warn_on seems more appropriate to really
> never try to run that code in case of a big future mistake.
> 

We don’t have an issue here since this is an iGPU—for now. Let’s hope
that a future dGPU doesn’t consider a solution like this a good idea for
anything, as this PTL approach is questionable at best. A big WARN_ON
with a return is probably not a bad idea.

Matt

> > 
> > > 
> > > -Satya.>
> > > >> Instead, a single BB_END marker is placed at the suballocator's end to
> > > >> terminate execution.
> > > >>
> > > >> This patch ensures race-condition-safe CCS metadata save/restore
> > > >> operations by guaranteeing atomic writes to the batch buffer, preventing
> > > >> corruption regardless of when save/restore operations are triggered.
> > > >>
> > > >> -Satya.>>
> > > >>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > >>>> 8 dwords instead of 5 dwords.
> > > >>>>
> > > >>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > >>>> chunks.
> > > >>>>
> > > >>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > >>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> > > >>>> Cc: Matthew Auld <matthew.auld@intel.com>
> > > >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > >>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> > > >>>>
> > > >>>> ---
> > > >>>> V6 -> V7:
> > > >>>> - Added description explaining why to use assembly instructions for
> > > >>>> atomicity.
> > > >>>> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > > >>>> - Include <asm/cpufeature.h> though checkpatch complains. With
> > > >>>> <linux/cpufeature.h> KUnit is throwing errors.
> > > >>>>
> > > >>>> V5 -> V6:
> > > >>>> - Fixed review comments (Rodrigo)
> > > >>>>
> > > >>>> V4 -> V5:
> > > >>>> - Fixed review comments. (Matt B)
> > > >>>>
> > > >>>> V3 -> V4:
> > > >>>> - Fixed review comments. (Wajdeczko)
> > > >>>> - Fix issues reported by patchworks.
> > > >>>>
> > > >>>> V2 -> V3:
> > > >>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > >>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > >>>>
> > > >>>> V1 -> V2:
> > > >>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > >>>>     (Auld, Matthew)
> > > >>>>     - Fix issues reported by patchworks.
> > > >>>> ---
> > > >>>>    drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
> > > >>>>    1 file changed, 91 insertions(+), 21 deletions(-)
> > > >>>>
> > > >>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > >>>> index 3112c966c67d..e0be7396a0ab 100644
> > > >>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > >>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > >>>> @@ -5,6 +5,8 @@
> > > >>>>    
> > > >>>>    #include "xe_migrate.h"
> > > >>>>    
> > > >>>> +#include <asm/fpu/api.h>
> > > >>>> +#include <asm/cpufeature.h>
> > > >>>>    #include <linux/bitfield.h>
> > > >>>>    #include <linux/sizes.h>
> > > >>>>    
> > > >>>> @@ -33,6 +35,7 @@
> > > >>>>    #include "xe_res_cursor.h"
> > > >>>>    #include "xe_sa.h"
> > > >>>>    #include "xe_sched_job.h"
> > > >>>> +#include "xe_sriov_vf_ccs.h"
> > > >>>>    #include "xe_sync.h"
> > > >>>>    #include "xe_trace_bo.h"
> > > >>>>    #include "xe_validation.h"
> > > >>>> @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
> > > >>>>    	}
> > > >>>>    }
> > > >>>>    
> > > >>>> -#define EMIT_COPY_CCS_DW 5
> > > >>>> +/*
> > > >>>> + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
> > > >>>> + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
> > > >>>> + * VF state/restore operations.
> > > >>>> + *
> > > >>>> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > > >>>> + * VF state save/restore operations. Since these operations can occur
> > > >>>> + * asynchronously at any time, we must ensure GPU instructions in the batch
> > > >>>> + * buffer are written atomically to prevent corruption from incomplete writes.
> > > >>>> + *
> > > >>>> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > > >>>> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > > >>>> + * sections. This prevents vCPU preemption during instruction generation,
> > > >>>> + * ensuring complete GPU commands are written to the batch buffer.
> > > >>>> + */
> > > >>>> +
> > > >>>> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > > >>>> +{
> > > >>>> +	xe_assert(xe, !IS_DGFX(xe));
> > > >>>> +#ifdef CONFIG_X86
> > > >>>> +	kernel_fpu_begin();
> > > >>>> +	if (size == SZ_128) {
> > > >>>> +		asm("vmovdqu (%0), %%xmm0\n"
> > > >>>> +		    "vmovups %%xmm0,   (%1)\n"
> > > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > > >>>> +	} else if (size == SZ_256) {
> > > >>>> +		asm("vmovdqu (%0), %%ymm0\n"
> > > >>>> +		    "vmovups %%ymm0,   (%1)\n"
> > > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > > >>>> +	}
> > > >>>> +	kernel_fpu_end();
> > > >>>> +#endif
> > > >>>> +}
> > > >>>> +
> > > >>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > >>>> +{
> > > >>>> +	u32 instr_size = size * BITS_PER_BYTE;
> > > >>>> +
> > > >>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > >>>> +
> > > >>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > > >>>> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > > >>>> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > > >>>> +	} else {
> > > >>>> +		memcpy(dst, src, size);
> > > >>>> +	}
> > > >>>> +}
> > > >>>> +
> > > >>>> +#define EMIT_COPY_CCS_DW 8
> > > >>>>    static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >>>>    			  u64 dst_ofs, bool dst_is_indirect,
> > > >>>>    			  u64 src_ofs, bool src_is_indirect,
> > > >>>>    			  u32 size)
> > > >>>>    {
> > > >>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > >>>>    	struct xe_device *xe = gt_to_xe(gt);
> > > >>>>    	u32 *cs = bb->cs + bb->len;
> > > >>>>    	u32 num_ccs_blks;
> > > >>>>    	u32 num_pages;
> > > >>>>    	u32 ccs_copy_size;
> > > >>>>    	u32 mocs;
> > > >>>> +	u32 i = 0;
> > > >>>>    
> > > >>>>    	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > >>>>    		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > >>>> @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > >>>>    		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > >>>>    	}
> > > >>>>    
> > > >>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > >>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > >>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > >>>> -		ccs_copy_size;
> > > >>>> -	*cs++ = lower_32_bits(src_ofs);
> > > >>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > >>>> -	*cs++ = lower_32_bits(dst_ofs);
> > > >>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > >>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > >>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > >>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > >>>> +		  ccs_copy_size;
> > > >>>> +	dw[i++] = lower_32_bits(src_ofs);
> > > >>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > >>>> +	dw[i++] = lower_32_bits(dst_ofs);
> > > >>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > >>>>    
> > > >>>> +	/*
> > > >>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > >>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > >>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > >>>> +	 * write the sequence atomically.
> > > >>>> +	 */
> > > >>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > >>>> +	cs += EMIT_COPY_CCS_DW;
> > > >>>>    	bb->len = cs - bb->cs;
> > > >>>>    }
> > > >>>>    
> > > >>>> @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > >>>>    	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > >>>>    }
> > > >>>>    
> > > >>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > >>>> +/*
> > > >>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > >>>> + * save/restore while this sequence is being issued, partial writes may
> > > >>>> + * trigger page faults when saving iGPU CCS metadata. Use
> > > >>>> + * emit_atomic() to write the sequence atomically.
> > > >>>> + */
> > > >>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > >>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > >>>>    {
> > > >>>>    	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > >>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > >>>> +
> > > >>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > >>>> +		      MI_FLUSH_IMM_DW | flags;
> > > >>>> +	dw[j++] = lower_32_bits(addr);
> > > >>>> +	dw[j++] = upper_32_bits(addr);
> > > >>>> +	dw[j++] = MI_NOOP;
> > > >>>>    
> > > >>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > >>>> -		  MI_FLUSH_IMM_DW | flags;
> > > >>>> -	dw[i++] = lower_32_bits(addr);
> > > >>>> -	dw[i++] = upper_32_bits(addr);
> > > >>>> -	dw[i++] = MI_NOOP;
> > > >>>> -	dw[i++] = MI_NOOP;
> > > >>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > >>>>    
> > > >>>> -	return i;
> > > >>>> +	return i + j;
> > > >>>>    }
> > > >>>>    
> > > >>>>    /**
> > > >>>> @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >>>>    	/* Calculate Batch buffer size */
> > > >>>>    	batch_size = 0;
> > > >>>>    	while (size) {
> > > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >>>>    		u64 ccs_ofs, ccs_size;
> > > >>>>    		u32 ccs_pt;
> > > >>>>    
> > > >>>> @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >>>>    	 * sizes here again before copy command is emitted.
> > > >>>>    	 */
> > > >>>>    	while (size) {
> > > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > >>>>    		u32 flush_flags = 0;
> > > >>>>    		u64 ccs_ofs, ccs_size;
> > > >>>>    		u32 ccs_pt;
> > > >>>> @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > >>>>    
> > > >>>>    		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > >>>>    
> > > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >>>>    		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > >>>>    						  src_L0_ofs, dst_is_pltt,
> > > >>>>    						  src_L0, ccs_ofs, true);
> > > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > >>>>    
> > > >>>>    		size -= src_L0;
> > > >>>>    	}
> > > >>>> -- 
> > > >>>> 2.51.0
> > > >>>
> > > > 
> > 
> > -- 
> > Ville Syrjälä
> > Intel
