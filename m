Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20617CCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 13:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D148E10E0F5;
	Wed,  1 Oct 2025 13:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+bpXktB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933FA10E0F5
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759326809; x=1790862809;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VWJJ1ChmUac5osarQPu3om+YnDSPxSlkFP9rKUxjsz0=;
 b=U+bpXktBCpAr634AIgj1VHF+DMY7OPPSwZxp56FiKR0uJXM+B9Rczpae
 EX6K0EQ0mj8n3q6OkBR3mqbdVjgMG4wC2V7JbpGJQwrb0+49X34H+P+hj
 LJYvV2KtBBSy2I4R24HSnfjLJYSiWZnqzYtJwXOqsD9kWH4CJWJkugDNr
 7kjJ+heKv6UvGJVh2OY3rKAzjiMQvrBVajwbBWpe+8vVrtnnzDXjO5FAb
 Hj+lLqv4a2ml2IBwDJLXzymXOm+DRozQX1r4h4Z0Hy1AM7zPW89U/X5DI
 np+Heoq+6nI3uCvjkP7pYD2gDFbfaXo2ZQ2YagkDs3FJXNEUWsFSHdOIE A==;
X-CSE-ConnectionGUID: mqpp52qARtqzg9uZx/RVPw==
X-CSE-MsgGUID: LYXBx48PRTSzC8e9lAmZLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="49156026"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="49156026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 06:53:29 -0700
X-CSE-ConnectionGUID: H/zscDF6SLCX0mIc0eW5wA==
X-CSE-MsgGUID: LwwPJxclTKq2VINdVgn4PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178408241"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 06:53:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 06:53:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 06:53:27 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 06:53:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYFBiyB771FdwakdQAM7CkSCvsjHgbaJ0HXnSBPp3J3PHHIJXr55LDtFtt1se8MQM9cjv9Dr35FblajX33FLpBkDyJVzk0JJdXkUdavN9bwJhMh8KZuw/M/pQuUGtn6gs3IvlWNLWyqezD84gYTwFIzAqfrqDBs7M3hLROu2I5lPOiiW5pXjjmpS2PgUsPPWzLbWIjHx7sbTNY6HbeU159AF0nzqR8kRyHeCyjx26iW4uEl9iBR0jgcaY4CU44GwGFZlIMOrgIUbhllKNP86bJvZZ9dTzINEhn/wDDxlgUiKJ4n8OuoEFik4RRXaV6q5Uu9cBlq1bV/L7KbufYHFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeZqPd/WQcud3cijdgfVmnehzE7aXhIdVBsQ7VgLmeg=;
 b=nZXw6evQgPUPsojoujOzBJB3KhhSOJGu8sdNlRvCSM69HhP20Fg43DnOoutfCnynUctqoY88MSxDYKdKfFXsRQh7fFVqp1o7Pr7w4g736JuvF9Trw1E0tQYp16gIWh94Do/GDZaI4kkgcwMaCTz3Ug9io5GJI6CdyO8qb6TjRkAgdsxcxYa0TtNabv9ZeTgo1EZwaZqrjNHUqFpqzCp+tGFHGooo/2etOLFRAHnyhlA9jilYVnN87L//2BzRpAeBRZx5aNygH7aT+kQxxRW9wdPhH7T/ZfrtuG9olQjadqfvQrn80q2WFSIAinRjUl6PQD0sCDBA49WSBIpKCKpQaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH3PPFD114713BA.namprd11.prod.outlook.com (2603:10b6:518:1::d50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 1 Oct
 2025 13:53:24 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 13:53:23 +0000
Message-ID: <25cb326c-d64f-487a-93ac-ee4d4fbf35d2@intel.com>
Date: Wed, 1 Oct 2025 15:53:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/36] drm/xe/vf: Reset TLB invalidations during VF
 post migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-25-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-25-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH3PPFD114713BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca5cd1f-c0da-4c08-347a-08de00f1e30b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3haNFJ4dWFxUitwZTZtSEhZOHdZaEQvOEVyVVVYTWp5aHlCb2pNeUdyNWdO?=
 =?utf-8?B?ZUpoUEhZYnlxYlQwVmoyblFuOVM3aFNCOUFlVzlEQkIrVTNBbVFsYUUvVHFp?=
 =?utf-8?B?L0lReFdlRDVXR2xRdDJwTFZlWldleGFBbHlvV0VPQmJrVGVqY2RWWnhkUkdz?=
 =?utf-8?B?NkczWTViTTlZTUVMaUlnaTJKK3EvNWF2ZzNSMkpSVU1yKzNjNnN6eWZmUjJt?=
 =?utf-8?B?Ny9nNUF0bTExNE1SN2hTaGVicm9DWm9ueDJyNFJJT1BIZkRaNzJ6K2xROFRp?=
 =?utf-8?B?akxRZlRWNTk2VUlzbStLeS9KUWxpam5LNGVnSGJBMzloMyszcSsrUjE2WUxS?=
 =?utf-8?B?OGhjdDdPemxZL3M4UWFHdmNZdjR3YWhGUUJXb1pPVTYzV2dnWC9jZmlSNVFs?=
 =?utf-8?B?WU4yeDRCOExuSFNybmtna1VrcmsrSktHVDdxdnZ2RnFuNmxVc0U5aUU4c2dU?=
 =?utf-8?B?bFFpUmRUSld0TXJkZDl3L2EzbzM4L1ZFN05wYlFLc3dYcGFXekxjWWZxeThJ?=
 =?utf-8?B?VUlEaDFYTWI4bm83YzUxRnR0UkF5Z0NXMmJxdG1hZnRYVVVGbHpmNjZjWnVh?=
 =?utf-8?B?cUkydjVvY3JuTWFBb1VYaTl6KzBJano2QTI2RE40cngwUm9QZHpKZTJ5Y3gw?=
 =?utf-8?B?a3RWK2Z0VVNrUFRhSGZINzkyV3AyNmo2SitMVzJ0NkxXS3hSdHkrVVlJcUh6?=
 =?utf-8?B?Y01uRkxibm5hWWREdTl4bWFEN1hUZVBSZW9QSWtOVURrOWN4UWdzSEJCQWhq?=
 =?utf-8?B?Y0hCZlpUODNyZWRKb3JySDh4Yjk2RnpQTGNNQ01LMjhZM2hMcC9iR3pOYkwr?=
 =?utf-8?B?UDAza0xrdEJDa05hN2gvREFieFJ3Y1BPQm5jZmw2eU0rYUZBTWZkK3Z1L1Zx?=
 =?utf-8?B?SjVSRlRSUzNUVkVkZUNvdlM5UXdaamZiMlFISWczMFpoc2hKbFd5ZEIxcjRk?=
 =?utf-8?B?c2NlYWpRSnBmTU1oQ0tPU3RTbGlKU2dCSXZDZlNKRTlpbEhyWVVQMDlNMVdJ?=
 =?utf-8?B?NDUvTlV6d1pQcWhTMlNYei8wUEpDUWlOYnR4dFZSREM5RVg2ZFNaK2JKck5V?=
 =?utf-8?B?R0VDOWtpMm9KYkc1WHhsN2Rhbm9halMwRDFHOXBQVERESVBINUxTMzNrTUo5?=
 =?utf-8?B?WmtBYmVKaTN4bjdwbEJ2MGlDNGplK1dadVAxeTJvamhoKzFEbjVPck0razJJ?=
 =?utf-8?B?a1EybmRSa3RGSGp5MUxtQS9VSmdaTS9QT1QyOWo4OGVMbzZBS255ME9nSTcr?=
 =?utf-8?B?QUdzZDJKTnlUVXhrWjhhN1YyM0Q4OTBWVUcyYWVyZkZqMFdTendhVlVjaWpu?=
 =?utf-8?B?emZpdXJsQndLKzhWdWlkckxNUEptMlJTdDRuaDFna2kybXFodytJemN4bnp2?=
 =?utf-8?B?ZHNheSsxbWRwaU5jM05FMHdadHdEd0pMM0RBbThFM0swSlNrSEhlckgrOXND?=
 =?utf-8?B?V1BEMzhOOVQzK2R2VFVtRncxSGJ4cWJlbFFIRjlNVDQwSkZzYlFKUFR5eUZ0?=
 =?utf-8?B?aGpuY0lQR3FJS3F2Nkp0b2x5V1Nkd1hZR0hwQmt4OVdXYU1ibEdoYkhKOVF4?=
 =?utf-8?B?elBSQ0V5SGhEOEpzUm5oOFBtbHNjMTI1eHpwdlVpLzdwSXhxK3pKRUYwd1g2?=
 =?utf-8?B?ZnkzbUhJRjJEcWUwMGRVK0R4UkE2NFdOdUR6TmZNNDZKTmwwQ1Vnb2YxbndH?=
 =?utf-8?B?V1RVNm1ZS2dONkpDb0REQ0VYcGdCVlVsdU03VXBoY05tZ0ZKQVpVODB1R0Ew?=
 =?utf-8?B?UWRvMFNRS3pJU3Nld0o2dzRLUDlaYXdGTHdvVU5rUitFQVRNME8xckpQQ2lM?=
 =?utf-8?B?YzVxcGd4UXFXcUg3Mi9rTXcwUSt5TU83aHQ2YVN3cjdlUWJNMUJzbjRQTGN6?=
 =?utf-8?B?ZkxYVlM3cktWQUg5VmZ2SVlxY0wxR1Z4c3dKR1BBWStoeEVtOXJuNG1WY1FQ?=
 =?utf-8?Q?g30JBwRsWybJfjt6AjXd82mtMlWqCVR1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bStUNHdCemU3a0t0d3VJbjhsRlRPY0Rrdyt6SnV4aUx2Snk4WWhzcW1XNUJ1?=
 =?utf-8?B?TGhGVzN3S2treUpkblVUZjlHVFBJMmhkejkzTmVvNWdFcGFsY2pzMVk5R2xr?=
 =?utf-8?B?SVJhRHg0bDVKbWxoNjg4elhZeGxMM2ppSUZHQ3c4Y05OeFdBRy8rckZ1M1FR?=
 =?utf-8?B?dXJVZFNINDN6QXJER2JTdVgvRVNjQ3QxWXpOZlcyUytCOEIyemRoUWVJcWJl?=
 =?utf-8?B?RHM0eWhEMEZQM05aZ0xnUk5ONFJqOEloTEcwUUpkVDZTUUo4Q3Z5NFczRUtH?=
 =?utf-8?B?Y2xTYUpNUUZmSE5MNGlNLzZlQWY2VC9iNWlLaWhhOW44WEFud1dPQjcwS1Zs?=
 =?utf-8?B?SjZKQlJWVGp3V2kzRTlqQWJ0cFFvaHArZjRwYldaS1pzSTFSa1VOV0ZBVWJI?=
 =?utf-8?B?bmgzRnBkL3lJbS9KMzR0S1BxSTEyTktRdEJNYVI1SDQzRmtpOXdVR1A5enRq?=
 =?utf-8?B?NmFKdGhwRDJEVE5aVjhEWlI4cGtaWkpRN3NWUm9oU3JCakpHUjQxT3NDU0Zw?=
 =?utf-8?B?cEhBUzdoZmZxV1RjVzBtZ3BnRkcwMFFuVmRIa3M5SjhYekZOSUpCYXNiZ00r?=
 =?utf-8?B?WVJrRjF5Ui96ZVBKZE5PeXRjR2MvbXM1aWViMElPSlM2T090SGRmYWNPdC8v?=
 =?utf-8?B?SmNaRFdCMWxTYlFMVktTSmJpVklwbnBlS2hQNmVSeVczVjdyNWFtV1BSbWNv?=
 =?utf-8?B?aG5IQXR1LzVTRnpEK3lLb1VWVnM2Njc5eno5SE16WUIxT0JDTFlvNXVIL2V3?=
 =?utf-8?B?ZTJoN1BKazNRanJaR1lRbDdZUjdGVlFHRWtJTzlMaDd1TGlXN3k5SE85TTlE?=
 =?utf-8?B?L1pIc0MrVTVrbGx6TlA4Y1VLbWdka2ZEQXFVUGpLMHhqZ2ZTTmxNNkFlUUJm?=
 =?utf-8?B?V2xweXd3L3JPL1R0UXNQS0Q3MDFjZlFwS1plaGx6RHgrYTBld2hnRnJJSDYv?=
 =?utf-8?B?NTg2bkJlbXd3ZVJhYmROWEhQTGpBQmszL1JhZ1cxRXdveFpBR0J2bkhTVXpW?=
 =?utf-8?B?WEcxU0o5Y21EWW9TZSsxbnNLVFFDbDArQUpDTzJleE4zbEl3c25hcDhNbzJw?=
 =?utf-8?B?ZVJaaHRuRlFTZ3JsaWtrd1M3eE5zcXl0Zmd4WGNHL0FMd2EvbFdkN0U5T2wy?=
 =?utf-8?B?NUlpQnUvVUR1RkZWZEN1VURoTTB3NUxISHd2bk9ObloyV2RVSmZxQjNlMFlW?=
 =?utf-8?B?aHpEWC84WnBhMnBwbkZBNHNmejNJUkFzUDdLMmk4QndkOFpoYlJ0TUhhbTht?=
 =?utf-8?B?M0hWQ0lJQ3BFNzhHeUFwUG8zZFk0NVNPbzJTd3RjOUxaWVMxcVlRdDJpM0lh?=
 =?utf-8?B?RHZwM25iT2QxT0VoSXYzaFcyQjR0bHRBMCszNm0yZ3Iva3NGb3FxM093dE96?=
 =?utf-8?B?QlpoM3k5UUxHRittSVAwRE1RcUo3L2N4bDZ2TjRvczc4ZGt2S1pmZHFUbjRX?=
 =?utf-8?B?Tzgyb0xRVkljNlhTMnFjRnVuQXk5akI3ZmZ4cmVtR1Fucko3ck8rSUowbnQ5?=
 =?utf-8?B?cjNzQmRYU3lMaXpVTHU1aHlIWS9TZ1VSWkJLcnVUZ2g0ejkwRUcraFphMDJl?=
 =?utf-8?B?ZmlmQkVKcmdHc1FiRFpIVXlNTklYblFxb2ZwRS94TVY3elVzMUhrWVBlaWh2?=
 =?utf-8?B?Q2FQRWtQejhkSXpqdG9BT3FxUXlDQVRrKzdUQXY0QXU2MUJIKzZ3YmJlV1o2?=
 =?utf-8?B?MHdsWVh0d05iMlhaU3NrVU1sL3JWRkIzNUtTWXJVUzhXYlEwRWl0MDBOb1Y3?=
 =?utf-8?B?T0llLzNuOXBQM1BGU3Z2THBZNWpSQW9VTTJhdWo0eUMxQjBGNWFkczF4Ykt0?=
 =?utf-8?B?UjAwM3IvVzdHSUQ0aHFLczVFNUYwMlNhTHRQdXVWYUZKSDlFZHFQVjQwSmE5?=
 =?utf-8?B?OFNHcmtKVUcveVZycDhHVi9STk5xTVFiOUs1ejJvOUNMVlRXWloxZHljeGRw?=
 =?utf-8?B?SmhlSGp4ei9XNkM3dzVZVWwwL2dESzRaSUpIbmVqRm5rZ3lEOUM2cEFSV2tm?=
 =?utf-8?B?R0V5Q2xoRFJKU1dhdjRZSUdLS0RpK2lwT1VUNGYrS0FnN0N0aVRpWU1pV0Zi?=
 =?utf-8?B?TTNFODFzRGxxSGkwM0hyU1NoYWw1cWZETGhXVjNKNEFHc09SMCtkeVB6K2Vj?=
 =?utf-8?Q?uq4amv+6Z4RkRJULwsRZL78+U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca5cd1f-c0da-4c08-347a-08de00f1e30b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 13:53:23.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5AAhkkn67jWod2Rqe28fmOY+Lc3s1ohJbw0f5jyqzIe2pa0dhSCjSAIVbBbIjBN7iP6XMcpImCfALoTbW/Tjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD114713BA
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> TLB invalidations requests can be lost during VF post-migration
> recovery. Since the VF has migrated, these invalidations are no longer
> needed.
>
> Reset the TLB invalidation frontend, which will signal all pending
> fences.
>
> v3:
>   - Move TLB invalidation reset after pausing submission (Tomasz)
>   - Adjust commit message (Michal)

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37ef1c42bacb..c9d94620d197 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -35,6 +35,7 @@
>   #include "xe_sriov.h"
>   #include "xe_sriov_vf.h"
>   #include "xe_tile_sriov_vf.h"
> +#include "xe_tlb_inval.h"
>   #include "xe_uc_fw.h"
>   #include "xe_wopcm.h"
>   
> @@ -1188,6 +1189,7 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
>   
>   	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
>   	xe_guc_submit_pause(&gt->uc.guc);
> +	xe_tlb_inval_reset(&gt->tlb_inval);
>   }
>   
>   static size_t post_migration_scratch_size(struct xe_device *xe)
