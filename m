Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93CDC7EE2A
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 00:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF1410E81A;
	Thu, 26 Jun 2025 00:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5zyivqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671D710E81A
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 00:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750896373; x=1782432373;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zs0buVz4QJAzw+RSBUJ54bFC52o4jW11ITX0Ulqjkto=;
 b=W5zyivqjc9NXkMy241cHNMCsCu24XvRPqZPhVjjqNDFoz4ql4pnQQ+Fp
 ZfUFVDyd1M+fgZ6xfYsZ0MLSEY/zT+1T3kqRWLnbUSfgtnxNg/+HyqHs7
 EJCx+22b2Yw7N4g4a6hMWqHbWxbYj6swpXfZZmR1evL1FiSr5AcX3W9R0
 ztm/3Ncsmb2sqJBCTtDfL5vPFnHpFwwEJ0qQGWyeankUv6JlJWCTbp6Ui
 qExo4DinsXXEFSEroXs3OHz3mM80tjikUv3IJ0Cvli9ikDBbHKio54T4/
 NCUPDNsN+VKcRhPyWAwGPzMwVNHc/Dqtfneddic/6nAKgcEqjPVIELpuC w==;
X-CSE-ConnectionGUID: 68GulZvtQ5m/H1QlloWgPg==
X-CSE-MsgGUID: LQnk8ArCTUOLHQka/bmFKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64539158"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="64539158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 17:06:04 -0700
X-CSE-ConnectionGUID: ZTRUvq38QRCuq81WSwxYSw==
X-CSE-MsgGUID: aMLMXcLoTx6XwYJc00s+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; d="scan'208";a="183249069"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 17:06:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 17:06:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 17:06:02 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.45)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 17:06:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wt+iCmwqSIdPdHX47NE3iaqNasmR0CWLn6ZA2ZQJa6XfPkqt1TxnTcpa10XMGBrLWYVyHeIx7rrVyo1ORrX53MEoypu4gsl78SOnuTq4z+PZcBPeW93gf9PNQqKpP6h6OMQ7/NmbblR/qi/Z4jJgYRwA67f/1gcbOJvw5Q1SY6fsefF4sQ4d5m0tohrY9bGMTNjACirE8EBqBv64Fgm62nmufCsWAv/loBb/gwv/jHGcAHon0HRU7wzQGk+yP/94eoN3WirD8z6TeH6MucXgDvH6Hf1la4Jn+vWOcUqZon4JqZ9r8SCjh6ijuYazTWWXzwhoJk1CDG92w1CUu2Khng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4xHbT0wqf5HdppfvK0as1CZ7+XRHr8UMar82sDmuOU=;
 b=zMmJF6pzNw72qkbnfxqfJumSaWHzW8em7T1SOZs6TmAoCOpq3D1LRR5pEgNnpvc8ckVTcsxqXQVg3T9sTCxTU8OYNvVCjVqcImbH+wQ7lJG1AvVrJVRjuwCPk/AkLXpiVdv57rJD4NnltPJ74VKz6fnmT0+i+/QiopNWbVdEiN2nrluzUjyQtIsNr3lUz11ITEnFAoWXAd90YXLBx0XboD4pqewCuYuuMEEIBgRIv8BoQ7akPweAxZBgD/lBL+ytUAex+EeCMoM7X/E03Fs/X8Vn0LaXNpY+16FF7uVnKjsMDjyW9IsvA0rIUWnyN+Gm62WvXmyUw6cy722TP38omQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB8456.namprd11.prod.outlook.com (2603:10b6:510:2fe::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Thu, 26 Jun
 2025 00:05:59 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8857.025; Thu, 26 Jun 2025
 00:05:59 +0000
Message-ID: <1785c4a5-31db-4963-8f4e-4a693c740bd1@intel.com>
Date: Wed, 25 Jun 2025 17:05:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [CI 1/2] drm/xe/guc: Enable extended CAT error reporting
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250625205405.1653212-3-daniele.ceraolospurio@intel.com>
 <aFyMS/7ZBu+Gafm9@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aFyMS/7ZBu+Gafm9@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d3529fc-b988-4cc1-6edc-08ddb4453b2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0tPa3JOMXcySG02aVZDYVE2aVRsZXVvUGxMZmVDcGtXdVRKK0pqL29Yc1ha?=
 =?utf-8?B?RUZidDlZSjE1MDYxQ0dGRU02UkM5QU85dUg0VDJ4UExpd0V1R2hQcGhnRjdX?=
 =?utf-8?B?Sk9PTGMwT2x2YkNyblBCS29odTA2SHNESTQ2UndYbjZPcUtJYTlJVjV4RzdK?=
 =?utf-8?B?cnh5dXBvSDJNVWc4NUpOM3BlUG9LZWtPWVNNQ05qSCtIWXVJZFJiL2RETXZM?=
 =?utf-8?B?aVhjUWJJcEM2UWk4cDF1N0p2QlNmN3ZSM01lczlNcS9wcWI2M1N5c05ocjlV?=
 =?utf-8?B?Um5rRm9iSXFHWkhTWkNyWFdZSWtJOXErcDhlZnFzVWxQbXdPZkF2RTYxK0Zi?=
 =?utf-8?B?Q2VtNzVDbE50WHJHY3VyQ1pmZVJ3cFRab09aaEM2dmpuNjZ1OG5CeEFQTUVz?=
 =?utf-8?B?Vkl2aVZSbXd6WW5FWDlwSG52RE43TmNOK3UyRm5GaE9yVlYybFNZVXZ1U3RJ?=
 =?utf-8?B?MTRXdTUwRUxhQ0xmODIzMW1MK0xUU3J5VXBBTzcvbU14bXNLaXc0ZFpRdkow?=
 =?utf-8?B?aHBGODlDRDl6SjNleW5OZG95OGllNjZpQlZUaThTYm43S1lEWUxmaDhCeTRZ?=
 =?utf-8?B?bkk3RUFadTBtVU9MUmd2UkVlMkQ4Y3J5YXE0OWJiTFUyZGk4eTc5RmRPVzlx?=
 =?utf-8?B?SU1ESjZHTXYvVUJqYVBvaW5XOTBvSHhELzg0YlRlOTArcWU4Wnd0WkZoZzZE?=
 =?utf-8?B?STl0UEs4ODdHRzJQaWNRamtEeEhNV21JK2ZwY0xIMWUzYlppbzRqT1VDbCt4?=
 =?utf-8?B?citUQ015NHdmZHJCNXhvWTBwd1pWd1FiTDE1ays3bXhEWkN5OHNsRzExWVQ5?=
 =?utf-8?B?SGRyOVlDY2hCN3NJT2FDazQwM1ZIRW12SjEzTXBVbVI0ZnpCZU5PWmNvY1hx?=
 =?utf-8?B?UGZIT2t4Q0VjR2F0MzhuNlNsNWY4VlpKVVUyZFZNNm1BRXNPbWVlK1RYNnNX?=
 =?utf-8?B?ZWZoSEJDNlJrVys3SjY0ODlZQmd5dGlxUkpGRml6aEREK3pyTGplVU1GVmZP?=
 =?utf-8?B?TFpyQktuclVua1pFK0x6SjFwYTEraWpRcm52SklOdW9kR0JkdEtzMHp1Nk44?=
 =?utf-8?B?U0xtM2dYaTk0cmhwYzdMdXY5Q1Y5dUR6Umg2Z1lPZGJndllhN1hzVXVmQkND?=
 =?utf-8?B?dUxsV2NDbGU5UXpkRC83ZVFTaGJkNy81TEdnZDNNcExYUFlhSnZqRTB0ejdM?=
 =?utf-8?B?QWdMTlBDaHZScHRpMjNuR0VSU1NvVkg2VkRNUjFCQzFUSVBWbUM5SE1JWURB?=
 =?utf-8?B?YW9rcW5CM2NkOXZUL1lKRE4xdHMwV1hvWTRUbGxzOEQ1KzJPeml5QVdJdUJu?=
 =?utf-8?B?ZE84aE5Ba05KbllPaVlHTTlSUWFlSzd1RkpFeGtBdXNuNXN4bXJnMWdrQmlG?=
 =?utf-8?B?aUh5blNhN2ZFRTlFMVdIRkM3aWxVT1V0cEZ6RThyUFprZXB0eXBPaWRIc0xu?=
 =?utf-8?B?VEtFRkptbVNVZktLbko5U0JSR2x5WmRPZzZ0QXZESU9IR0FNYVVhQk92UC9C?=
 =?utf-8?B?ekt2ZmRZMkh6WldMd2NzUVF2Wmk5QVhjMHluOE53Z1F0cFNCMWQxYi9xTWRj?=
 =?utf-8?B?aDdwTVk2eWRZZk1iWC9Nd2lsczRzdWR4QUNPT2JzNkJVR0luUlJsNWVpTXJV?=
 =?utf-8?B?RlZMdXBjZjU5alVlRUJXbTlVc3B6REFpTXBkQlhCZ3k2alcvSTNyekY5eElz?=
 =?utf-8?B?YklCOG4vbGZ1WUM3WURuemU3RXN1UlpHM0VjVTlnSlVqWStSS2FwdlRycHRI?=
 =?utf-8?B?VzM3KzcvUmQva2lCbG9WZk1OZ25OcEs1Ym9ZR3pyMEVvZS9OUGRKU0FkOUcy?=
 =?utf-8?B?NCt1NjNlL2o5Y282MTRONnFHQUlyclJidXg3aElRdWE5dWNhZGhYZlNsWlA5?=
 =?utf-8?B?SjRzRVZHeUhJRjJzL0pFWkI2MzFVZklGeE9UMGpJZENhRmR6S29TcWh5MzI4?=
 =?utf-8?Q?2fah6d1ox8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJMdGhYYmc5RzQ0Q1pKME85TFJTemxvNmo2YmEwUzBhQTQ4TGFaUXdnK0ox?=
 =?utf-8?B?bzdtT2c0Y0xaZW12NkFYN0NWekRtRUVYaDVVTnBMQ2NEWDZ5Tlh3UVVySTVZ?=
 =?utf-8?B?MzIvQXNuaStwL2ZCQllEUHhxaHpVNmdUYjdCVGF5aUk5a1QwRCtxVDdYNVBr?=
 =?utf-8?B?VHdHUGVFM1k1UW5sOFVHKzVsTkVTOVlrZnh5ejBlUmF0Q1VQb3Vqb3RMUHpw?=
 =?utf-8?B?ZVNzM1FHYnZQTXU1WEFTUVVlQzhjdmN2ckE4eTN0dXk5Q0k4VXVCbHJPeWlJ?=
 =?utf-8?B?Szd5Y0xMRWozMTdzNFk2UW5RdTdDUXZpcjNabmZHYkVKVEZwTUpiV2o1bHhk?=
 =?utf-8?B?Sk9ibDE2RjBEUVo0bzV2M295N0hJMEFFck84dGVYV0ZxQ2xWK3NZN0pCTjFk?=
 =?utf-8?B?VVQvRWd4c293Rml0N3BOUlFMYm5OQ25zU1V0ZDl1T1p5UGxkS0NhZkUzQUJn?=
 =?utf-8?B?aHpiTDBIeGpnd3ZCdHlWbENsaG1LUmQzNVcyK1lsdHAvY2tucDVieFB3S0pI?=
 =?utf-8?B?SWxPMFY1dG9LM3orMVJFZk1hS2ZNSUFjZGlPL1Z1TzNLSml2SUs0SkJmLzUy?=
 =?utf-8?B?Z0ZLeEN2bDBCTHQ4RXR2emgydlVmTjB2VksvaXdQd1RYUVl2YWplQmZ3NmpN?=
 =?utf-8?B?TzdzWlFKa3VjYUlaK25TaTc2NEV6aTkvNk4wbVRsRzNSK3d2ZkV0aExPaHMv?=
 =?utf-8?B?Znd5NkNGWVFhZ29uMTJIQ2J5eW5XZnpxU0UrNjd2VFA3aXJ1ZzVHSVFlTWtB?=
 =?utf-8?B?dlIrN3lGNUdPT3NsRkl5YlhLSkRWbWRMWlRTZm9qZjg0bzcwVWZrd29ZN0oz?=
 =?utf-8?B?aitCQXlJK2FRS3FUNG8xS2hlY1g0TXg4K2JUSUJyK3p2RTZxa1I0ZnVYTTRo?=
 =?utf-8?B?T1g5M3lvUk5KSElpUWh4UVQrVHlKbmZ4ZnZNWENmMXFTaE0xYTVyWHVsTG1Z?=
 =?utf-8?B?R1dGbnB6S045MFh6VGRlVE8yVjFqeDhHQmh2WkwrWjZYYjFiaDFtRThMa0tP?=
 =?utf-8?B?M1NkbERuWG0rTWtMTlpObUNobytnaHd1cnFpUU0zb0tMS05NNGU3dWdVdjZK?=
 =?utf-8?B?aS9FRkhVZzg1aEhjTWVqM1FHcEFBWnBEN090MStHS01nV0FMai9iTDk0ai83?=
 =?utf-8?B?VlJXenBJaEUwVHVNOSswTjhlQVg0UW5SVU5SR0k4a0JMaGY3NDVlSnNTcnJD?=
 =?utf-8?B?L1lsMHFSV2VJbDIySVUwVDlsRm8vcTR2bUdVRUtoWFptQWFxSEd3QkdNVjk1?=
 =?utf-8?B?RFY4clpPMHZxOGVyRENmZ2dtQkF0Mjc0YUtFcHRsUUpRdFJXRjRhU24yNkN4?=
 =?utf-8?B?WlloTUp1YzgxaXRVR29jVXpEUDJDWUxQT1FETnRnZVVUR0svc2FvSEVndVhW?=
 =?utf-8?B?bFdnTmlkeVRMa3ZQWTRiendaUWoxUGdHOHZRdTlCaFA2R0RsR0taYUloVnFB?=
 =?utf-8?B?VURlaVpheDJMcnYxamFYMkpLd0swaUVJa0RuaW9HVGpYckJWc1JKWTJINW5V?=
 =?utf-8?B?WnRRL3NCc3JiOXpnZEZ3MDYwNjIzWldGR3IxSHJ4T1NaUU5yQk9ON1NwaE5q?=
 =?utf-8?B?cUNyRUVLS2R0YkliUlJHbXZVbWRVZkhqeXA2SjhJZktvRkoxVldSVG5Ia3c4?=
 =?utf-8?B?eWh0c0h3RmJ1ZkJvWEk0Znh3eEMzcXFzSU1XekFUNjJ3MzROZE8vcVhoVTF5?=
 =?utf-8?B?Z2ZRa1B2UmtzNk5GcmU3VGtuNkxMTUhJZUJIeE1hN0txYktkN0dvZk1nRlBX?=
 =?utf-8?B?OTlRVnZKNGt5OUJrZ3lFZjRnbDRaeTA0RWtBdVdZWGJoemFLKzJjeU5oMkph?=
 =?utf-8?B?cWlRb3ZGVVAxdnA2Zi9yNDdaSkk5cnV3aHNvMmRqZ3Y2V294QXhqTTE2eit1?=
 =?utf-8?B?VDF2NUdlTm5OL0ZSMGk5NXRLUnVwc3docDlQUUtQcXBPMEd6UlI2a0l2ZTZL?=
 =?utf-8?B?SUgrL0xZQllmYkFjKzA1ditCWS9Vb1VFUmpaOUZpb29aZnVaNVZRc3h2emVT?=
 =?utf-8?B?TCtkQjR5TWRadTN2QmRJbXZXYlZhbkp6dGhncmxvWVZSVW9STktoeXNIQ0NQ?=
 =?utf-8?B?czNoNlZnMksxSTlsaEx2SDJnQ2UwNS9EU2pIT3Y0L1hWdkRKRkZOTUNINU5L?=
 =?utf-8?B?VS9rNmkzNllMQ2taaW9nbWRka2lZYUMrRXMzZ1d6YjFWMXVObi9nQ0Iwb1Vl?=
 =?utf-8?Q?NTitk7bnAOCwfslAX3t6VLQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d3529fc-b988-4cc1-6edc-08ddb4453b2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 00:05:59.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1X1b0X7p+oSa0vbaKLrLSdFI1mv9X1Zf/buHnBPYiNp7X9jjWvKRwKi8Vw1AaVXGTTTHH9WVT73+4wfuh+wVRHZzrAOdcI5vAjAKgjA35cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8456
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



On 6/25/2025 4:54 PM, Matthew Brost wrote:
> On Wed, Jun 25, 2025 at 01:54:06PM -0700, Daniele Ceraolo Spurio wrote:
>> On newer HW (Xe2 onwards + PVC) it is possible to get extra information
>> when a CAT error occurs, specifically a dword reporting the error type.
>> To enable this extra reporting, we need to opt-in with the GuC, which is
>> done via a specific per-VF feature opt-in H2G.
>>
>> On platforms where the HW does not support the extra reporting, the GuC
>> will set the type to 0xdeadbeef, so we can keep the code simple and
>> opt-in to the feature on every platform and then just discard the data
>> if it is invalid.
>>
>> Note that on native/PF we're guaranteed that the opt in is available
>> because we don't support any GuC old enough to not have it, but if we're
>> a VF we might be running on a non-XE PF with an older GuC, so we need to
>> handle that case. We can re-use the invalid type above to handle this
>> scenario the same way as if the feature was not supported in HW.
>>
>> Given that this patch is the first user of the guc_buf_cache on native
>> and VF, it also extends that feature to non-PF use-cases.
>>
>> v2: simpler print for the error type (John), rebase
>> v3: use guc_buf_cache instead of new alloc, simpler doc (Michal)
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com> #v1
>> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++++
>>   drivers/gpu/drm/xe/xe_guc.c              | 56 ++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc.h              |  1 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 16 +++++--
>>   drivers/gpu/drm/xe/xe_uc.c               |  4 ++
>>   6 files changed, 93 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> index ff4f412c28d8..81eb046aeebf 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -142,6 +142,7 @@ enum xe_guc_action {
>>   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>   	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>   	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
>> +	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
>>   	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>   	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>   	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>> @@ -271,4 +272,7 @@ enum xe_guc_g2g_type {
>>   #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
>>   #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
>>   
>> +/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
>> +#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 7de8f827281f..5b2502bec2dc 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -16,6 +16,7 @@
>>    *  +===+=======+==============================================================+
>>    *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
>>    *  |   |       |   - `GuC Self Config KLVs`_                                  |
>> + *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
>>    *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
>>    *  |   |       |   - `GuC VF Configuration KLVs`_                             |
>>    *  |   |       |                                                              |
>> @@ -124,6 +125,20 @@ enum  {
>>   	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
>>   };
>>   
>> +/**
>> + * DOC: GuC Opt In Feature KLVs
>> + *
>> + * `GuC KLV`_ keys available for use with OPT_IN_FEATURE_KLV
>> + *
>> + *  _`GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
>> + *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
>> + *      containing the type of the CAT error. On HW that does not support
>> + *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
>> + */
>> +
>> +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
>> +#define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
>> +
>>   /**
>>    * DOC: GuC VGT Policy KLVs
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 209e5d53c290..4a7c467ad669 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -29,6 +29,7 @@
>>   #include "xe_guc_db_mgr.h"
>>   #include "xe_guc_engine_activity.h"
>>   #include "xe_guc_hwconfig.h"
>> +#include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_log.h"
>>   #include "xe_guc_pc.h"
>>   #include "xe_guc_relay.h"
>> @@ -570,6 +571,57 @@ static int guc_g2g_start(struct xe_guc *guc)
>>   	return err;
>>   }
>>   
>> +static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dwords)
>> +{
>> +	u32 action[] = {
>> +		XE_GUC_ACTION_OPT_IN_FEATURE_KLV,
>> +		lower_32_bits(addr),
>> +		upper_32_bits(addr),
>> +		num_dwords
>> +	};
>> +
>> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>> +}
>> +
>> +#define OPT_IN_MAX_DWORDS 16
>> +int xe_guc_opt_in_features_enable(struct xe_guc *guc)
>> +{
>> +	struct xe_device *xe = guc_to_xe(guc);
>> +	CLASS(xe_guc_buf, buf)(&guc->buf, OPT_IN_MAX_DWORDS);
>> +	u32 count = 0;
>> +	u32 *klvs;
>> +	int ret;
>> +
>> +	if (!xe_guc_buf_is_valid(buf))
>> +		return -ENOBUFS;
>> +
>> +	klvs = xe_guc_buf_cpu_ptr(buf);
>> +
>> +	/*
>> +	 * The extra CAT error type opt-in was added in GuC v70.17.0, which maps
>> +	 * to compatibility version v1.7.0.
>> +	 * Note that the GuC allows enabling this KLV even on platforms that do
>> +	 * not support the extra type; in such case the returned type variable
>> +	 * will be set to a known invalid value which we can check against.
>> +	 */
>> +	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
>> +		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
>> +
>> +	if (count) {
>> +		xe_assert(xe, count <= OPT_IN_MAX_DWORDS);
>> +
>> +		ret = __guc_opt_in_features_enable(guc, xe_guc_buf_flush(buf), count);
>> +		if (ret < 0) {
>> +			xe_gt_err(guc_to_gt(guc),
>> +				  "failed to enable GuC opt-in features: %pe\n",
>> +				  ERR_PTR(ret));
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static void guc_fini_hw(void *arg)
>>   {
>>   	struct xe_guc *guc = arg;
>> @@ -767,6 +819,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>>   
>>   	xe_guc_ads_populate_post_load(&guc->ads);
>>   
>> +	ret = xe_guc_opt_in_features_enable(guc);
>> +	if (ret)
>> +		return ret;
>> +
>>   	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>>   		ret = guc_g2g_start(guc);
>>   		if (ret)
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index 58338be44558..4a66575f017d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
>>   int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>   int xe_guc_enable_communication(struct xe_guc *guc);
>> +int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>>   int xe_guc_suspend(struct xe_guc *guc);
>>   void xe_guc_notify(struct xe_guc *guc);
>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 26c6c71dc91a..32548c931615 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -2103,12 +2103,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>   	struct xe_gt *gt = guc_to_gt(guc);
>>   	struct xe_exec_queue *q;
>>   	u32 guc_id;
>> +	u32 type = XE_GUC_CAT_ERR_TYPE_INVALID;
>>   
>> -	if (unlikely(len < 1))
>> +	if (unlikely(!len || len > 2))
>>   		return -EPROTO;
>>   
>>   	guc_id = msg[0];
>>   
>> +	if (len == 2)
>> +		type = msg[1];
>> +
>>   	if (guc_id == GUC_ID_UNKNOWN) {
>>   		/*
>>   		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
>> @@ -2122,8 +2126,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>   	if (unlikely(!q))
>>   		return -EPROTO;
>>   
>> -	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
>> -		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>> +	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
>> +		xe_gt_dbg(gt,
>> +			  "Engine memory CAT error [%u]: class=%s, logical_mask: 0x%x, guc_id=%d",
>> +			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> Do we define the type anywhere - I only see XE_GUC_CAT_ERR_TYPE_INVALID.
>
> It would be useful if we had this defined somewhere in KMD headers or
> even more useful if type was accompanied by a string description.

The type is HW-defined, the GuC just forwards it. AFAICT the values are 
not guaranteed to be the same across platforms (the Xe and Xe2 lists are 
different, see bspec 54047 and 72187), so I don't think we want to 
maintain a list in the driver.

Daniele

>
> Matt
>   
>> +	else
>> +		xe_gt_dbg(gt,
>> +			  "Engine memory CAT error: class=%s, logical_mask: 0x%x, guc_id=%d",
>> +			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>>   
>>   	trace_xe_exec_queue_memory_cat_error(q);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 3a8751a8b92d..5c45b0f072a4 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -165,6 +165,10 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>>   
>>   	uc->guc.submission_state.enabled = true;
>>   
>> +	err = xe_guc_opt_in_features_enable(&uc->guc);
>> +	if (err)
>> +		return err;
>> +
>>   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>>   	if (err)
>>   		return err;
>> -- 
>> 2.43.0
>>

