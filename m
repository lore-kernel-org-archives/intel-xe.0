Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E73C36010
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 16:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8B210E059;
	Thu, 27 Mar 2025 16:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPYJETvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF4610E059
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743093160; x=1774629160;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vzm+EJeAlAiA5MkUQK2BLwcq0IuQGcdO60Y5PX1tnLA=;
 b=nPYJETvGgBFxsUbF3f7vhIe8/5QO23WStTgPtq5vrEiwpVk/0RS/uhl8
 56mVfFlN2JgDDd3MiLOVJRa0tCqje2xByfxcqa8QaNdW8FRsvTWFSmqEt
 SGJzBqtkqnyBV5wNhZEZcsAPVkqnjh9GIrxU7knC6Au7e0AHryRX2pnTf
 2x3I9fLyOdcwV5ZV532r6tSs7IB2ROo/ZWsZLpA9tkNI/qG2z0nxE/Q+M
 AAKe5LJMmhQOH2Nrwdnexo8Ap9Z2PHLkZU5XxrbWi0ghbm8Otn3lW8Q+I
 XbNqfT5Um2ukSSNtbk0Sq47C0MS7nR+5IoUiqNn5qL9QC55UJowsf3p/j w==;
X-CSE-ConnectionGUID: xXRxPyyyQZO28eAIAsvuWQ==
X-CSE-MsgGUID: wF65H5N2QiSBfc+YBIoLyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55807709"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="55807709"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 09:32:40 -0700
X-CSE-ConnectionGUID: vIRHt0piTzOWKSbMLQwpbg==
X-CSE-MsgGUID: JSV8lG2WRiOO1Q5pa+0aFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="130056928"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 09:32:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 09:32:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 09:32:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 09:32:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcN5MIh9EthL4i/JMJGACB2ZpfAhvtb84xeh0WBx+4I2liZ75QDG8GV+XYHh4e049Rz8sSXvT6U+EY1H94pUKUMQlY0mVWwsMml3IpGu/4yqZ2l5Sk1xv6UyNIOcukXuTPlx0hwPlhx81W0UNMJQigd/eeeK4g5pR4JQHGiyalQugquYrHwcyvBK2o0fqZ9WZuKhnhHE9KBVbfWtwxgltAov8MmWIxqs7q+JATxnsqYifdNk8Z3XfmPJqPV+wKY7wblMJehdRpkKbVjdhzA7a3Rxp73z3Lso7oDuSwiMWxOF+tzj9l40C6OmTiBB3J5HlrhOn2xkGejjwAwC0t3m8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfATF4OH0U4FUNYzsFOpwDoxOSRoSs2U1tTg/XVGuNQ=;
 b=MnB/8r6tjRfwmcTUNwr8UakWPp5tV5b+cGyl7VDhY2dzZRupjDbXKS+D3q4WoVN1F3QkWsO3AY1BRa+3qS33oyx6Ce4aAMFAYixBLYpMtHfc62/Gp3H7mUXb2p0WBQpIC5swnlTBvApOxtIB7TFZRRx7T6lmLxsfdcZ+yZ9nImi03Z1UsxYfEYXLqEPRxM7MSc6SdP6/6eHqHN7NtpbEcR/uOSzWEBaP6TH1lWabIJuM6ory0Yc7VVQQ6fnPsrHJHbTbkpR5brscP5hQWrOHAE9HiHBXL4D8b80ya5KwS8MKIuqXY0rm+G1IngxsbuA8SegfcElXRnCyOL9Dzk2OUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CY8PR11MB7921.namprd11.prod.outlook.com (2603:10b6:930:7d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 16:32:36 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 16:32:36 +0000
Message-ID: <8a514fa3-af9a-4b92-a6d3-3c6764b20a5e@intel.com>
Date: Thu, 27 Mar 2025 22:02:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/d3cold: Set power state to D3Cold during s2idle/s3
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <rafael.j.wysocki@intel.com>,
 <raag.jadav@intel.com>
References: <20250327161914.432552-1-badal.nilawar@intel.com>
Content-Language: en-US
In-Reply-To: <20250327161914.432552-1-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0178.namprd03.prod.outlook.com
 (2603:10b6:303:8d::33) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CY8PR11MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c59179-24f2-4495-3ccf-08dd6d4cfbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmJKV1dyR2IzRDZwWG9GSHVYMHhkdUNDS09zQWI3Z0ZSVDRHNmtMT0xVU2sv?=
 =?utf-8?B?RW40dlpSYmJBQzBuMHFkWFdPM3duN0J6U05kRUpGWnc5dTlKemJHNUhEZXhU?=
 =?utf-8?B?b05GM0ZFMGpZWnZHRk9mYmU4aFQ5NS96eXpWcCtySFpmVk5oNDdJOFJtQmhk?=
 =?utf-8?B?WTJQamErc21VQUxvQTFubHRndlJIdTBJRjIxd3dCWGhIcGdaQlVNZHRHQXNo?=
 =?utf-8?B?NDZVOFl3bTFkeEZiVW5oNlJDSDdLV3N0T2N1cXl3dURBZDNZdnJZVVFScitU?=
 =?utf-8?B?c3pnWXI1MDFldytEMjh4SkRyRFY5Z3Btb3BqUVBCWXhZT2ZLNDl3NTJiL3hS?=
 =?utf-8?B?ckdLQnduMFhOUnNzNm9uOGdZWEh4VXNXWXYvbjNqb1FDbi9EY2pOSzVJNmVo?=
 =?utf-8?B?b1ZTMld5WkdOR1VId3ROYi81ZjVRWnJxT2VnemJhTFA2eEN0UUtZTVczR1hE?=
 =?utf-8?B?Nm9LVzc5VzIxOERReVNwamRVY21kVUZkR21aRWFIZW53NGJlMU4vTnA1d1U1?=
 =?utf-8?B?RVpjZld2THJodHpRa1BxNmVWdndqc2RQSFlQdTZuaTBaeTVoMTFTT0FJVkFV?=
 =?utf-8?B?Um8ybk1XODNpeGZzUEZ6RDN4cU5KTGZFWmFzam1mS3htcXVkbmo3S09qK20v?=
 =?utf-8?B?NVpha2NoZXlKR2Q0anl0RTYyWHQ5WTV6RlMzUXA1SDk3M0w2eFZneEhZUWxm?=
 =?utf-8?B?SDBVY0NpV3NmR2QyamtLcVV1d2R0aVhHQnNKWkRqekk5VGQxSTVKN3k5Z2FZ?=
 =?utf-8?B?TEZYL2ViVXMwY0F0d3Nqdm5mQ0cvM2p0TklvRmo3L3gvUDJxSWtlTU9rVmpu?=
 =?utf-8?B?MUN2ZlR0NDBGY0lVM0RvOVpqQ2dNMWhDVU9xODJLMGNVdlZmQXhVYng0NjZS?=
 =?utf-8?B?ZzJnTE9tUlQ1TzVnb1lFVU10TWpWN3BxNEFXRXpjMHVTT0tTWTJIaGpIbVo2?=
 =?utf-8?B?UGk2dW04aXZqMStuT2c4QWV0Nllxa1Jkb2UrbkpacFg2N2lwZEFVYzduaEs2?=
 =?utf-8?B?RGpKTU43SHduMXU1TCtUT21ONkxhSkhvb0FucGd2Qk1WeWpETnFkZlVxUWVX?=
 =?utf-8?B?VU9ueFk3c29rUkpGSkJJTStTdzVEMVVPajZLVktKU3RlUldqVVhBUnJPMlRo?=
 =?utf-8?B?MDlWNC9CUStNMkltWVVXUkhsemc4WE1WVjdYR1NYZi9kSzFOZWlNZnFycUpl?=
 =?utf-8?B?UEFXZEljV1VnU3VER3padnBmNGtsREFlcWxLb0JRMCtwaXdTVTZiWUFWblNE?=
 =?utf-8?B?R0FpaThEdUdYRWpWcEYwYjE3dU94cVY3SWZFVVNQYWlhMDMvL2VqcUV3a0VV?=
 =?utf-8?B?dkNrdHpZRFIyMzFpc2gvc3poelpaR2FSRWtpaXE3YnN4NlhkcDRXazRRNita?=
 =?utf-8?B?ajlzME5oM0lwaUtSck5GZm1wUUlDaWFLVm1Fd0UzeFlSTlFLT3dabitmZTRj?=
 =?utf-8?B?RXlRd0txRS9TMExkeUJLZ0JJSTBCZmpGWEpiWkloaVMvMzhtellVSC9zaytm?=
 =?utf-8?B?RUt2MDFFYTV6a3I3dEU4ZjVRYXB5QWxTTTZYWklrNE9LdkR3OW0yYUJpTnhJ?=
 =?utf-8?B?STlHRlhqVjJDcVJuVFZFZzQ1S2xsNXkzNzVJUys2VFdMOWx2MlVaUHkzR1hl?=
 =?utf-8?B?NmxWcjBHcXBRQ3R3a1Jnbm5hemcvcEpHa3k3TkwyT2lpV2NvZ0FFTlQyaU9T?=
 =?utf-8?B?aVZRSlN2d3FBMkRYZFR1UHMzYlBGakZOUUdPZ2pSWU1mWFpERTZ5dCs2UXR2?=
 =?utf-8?B?RVhad2w2NWcrSWN3WUNmR2JsZ3RzZnYwcFd1MTJsZ2JlV0pXOVdtaFZBS0kx?=
 =?utf-8?B?WWROOFNmbThQaVpOR1MwUTZqN2prZDVRSzQ0SUNpbkUrSW55d2U4QjFIN1Rp?=
 =?utf-8?Q?V0XuJfMYtcLlD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTVkMm82bkRQc0pOVXJnMW81U05McHMxS0N6RTRUemtIak5xRnVoa3FJeHVJ?=
 =?utf-8?B?d1RzRnQ5MHB5OGViYUxKYjVYTUNNajhLNHR3bU1nQmJHeUdSdkhUcFZraS9a?=
 =?utf-8?B?WVJ2ZU5FUlJCdTJUdGwrTVBLTWgxRFUrWGs5dUdoSW0wSGJDck93Q2s1a0E3?=
 =?utf-8?B?YUQxU3VzL0RUdW5lUW1ldHJEWGhOZW9Uc3c4aE5SYnAvQU1SQ0FDTzk2M0oz?=
 =?utf-8?B?S0c3bHNYNG5oNGNYY1hqRm9xcmlKMmI1VkhvZ2RGUS9OUk5EeFI3dE1wOFV3?=
 =?utf-8?B?eFNLU01qSVdIZnZEODhkcUZGbm9rOVF5V3dTT1dqMmE5b1hXamhxbkEzYnlU?=
 =?utf-8?B?T0IwM243a1FJZzRoVzVYcEhwOVZhZ2MrNWc1S1hnZ0VudUd5elZOSzRraDh3?=
 =?utf-8?B?OVh1L1IyU1lGbWE3MFVKZ0xyWW9PclRJZGQ1L1lMc1NKTHFQaVRWSDg4aVRv?=
 =?utf-8?B?VTRCL2Q1OXNsTTRKcjNSaWdBMWpaeFNuQVFDdzlzL0dxQk92UVBQZW1sRVRT?=
 =?utf-8?B?c0hlNHl0bm40UGtCSmJWUm9MWHdBVS9aempFczZSOVNUZDZpRWlGRW81QmRx?=
 =?utf-8?B?QnRYWlBMZWJKUkx0SEs4TUlETnhlWkZBZ2xON3FZYkZIY3plbnN3aFdZVDJB?=
 =?utf-8?B?OEV4VmtqQTlteWxlWjVCWkZQS2NORllwLy8waktsc3RWUUhwVG84Wnl5aUdj?=
 =?utf-8?B?RUJWZFNWemFmYzNVR0NaYUp6alRJdm5rUFZWUkhsdDJkeEIzWGxJK3NWK2U1?=
 =?utf-8?B?elJXbjFmaU4zSGdIcjZIWG9uNCsrSkRNK210Sjc1TUNnMjd6dzQyOUsrelRV?=
 =?utf-8?B?M0xnVmYxSXdSV1FFV1pabEFxcGJRMFh3Z1pPRzN5MFpFbWZLUkVHR3BHdnln?=
 =?utf-8?B?dmJlbkxPdkx4TUl2OVN1bFJzbmlGenJjek9DM3BUMzlKekxFTEtoeVcxb0FS?=
 =?utf-8?B?blJpVTdLYTJjMHhYa3RHVkF2TE1PeGxFRGNTNUdHUUc1b25CZTFCR2Vzd1Rm?=
 =?utf-8?B?aW1yN0lZRksyaEpFcHFCWmVmSldab00xaUJmaXA5Qk9XZ200UVRkZnVKckhN?=
 =?utf-8?B?TzhPb2JXcytmcjV1dWk2OW5vYWpQNm1wRXFmLzZXZUgwTWR4dWpFeUZBQUhW?=
 =?utf-8?B?UEl6cXFQUHZ2TnYzTkwvQS9SVXQ4Uk1lY0lndUxSZm9KekZzSWQzMm83R2Ri?=
 =?utf-8?B?dG1FV1NaSng4dkdQWkZnYmoxbmpXU1V6ZFYxM0FsRWpLQ3JvS0lHMGtnUS80?=
 =?utf-8?B?ZG00VmxtUlUwUXcrRDNremFqZ3hkdVhHaTFMT0RETm1kd3l3MDFPRDVKNGMx?=
 =?utf-8?B?cmVhY3F6WXk1dEQzZkZGMEpwUHcySExKWWxXOFh4Mk96a1hIMTlJR1d1ZWhr?=
 =?utf-8?B?eFRoSE1XamlVWm1xZ2kvSmFhU0NWaTBPLytsbDJzaWs1NjJ5NDQzUnlYN1p4?=
 =?utf-8?B?czZsVFVpTk5ueCtvSzlyK3B6cWN0RGRjaEp5azdWbHFXNXlxNENnUS9KNEpS?=
 =?utf-8?B?d2hjdXcyRWJzaHRTc3ZZRThPQjhRTmd0dUpjWm11WkNUTVNwVkRiV1VvbjJD?=
 =?utf-8?B?MEhUSWdpRDV4MTdyWXBiNWVzRnFCRS9BU3JEMXpMM2dweU9XMGp4V0srTG9J?=
 =?utf-8?B?UUMweTJuUys5TnVZbjVDYm94UDM3TXdxQWJjTGJ0WVhHYi9ndUJUMDhBYUZO?=
 =?utf-8?B?dXEyNGpVblN4d2Z5bTN2SS9Nd1YyMGtuMEZwNUk1RThia0dGMFdTQyt2VUZF?=
 =?utf-8?B?QmtsbnVrdVEzd29nL0dIYXpnMm1RZUl0d0d6a2RCMWVFZmVPY1RmN2hoODJt?=
 =?utf-8?B?ZDBhRk1nalNtM0lMUU9iYUNOWnJqVEpSbFhTbWlSK1EzYTJOT1N5eTRTSGdj?=
 =?utf-8?B?M1EwbFBudmRuZDZqeSt0Yy94Y1RVcUV1T0x2UnJMaWZFVU1CVzhLZ0FCQUEz?=
 =?utf-8?B?aHREN3BFWUV5dXhpd1RRellLT0VhUmRQMURKZW9GZ2VWTkFobVJsc1dyN25C?=
 =?utf-8?B?THJPdWZERUdkbkJqeXlySFczaVZpUVNPdGV4MEJFaDkwTWxIRlp6ck9QK3hS?=
 =?utf-8?B?NzQxZW9KbGd0SmpaYkVDWG1JR2RWZldoYUpMeHFjSTN6WVdMTWgxYzYzRGQv?=
 =?utf-8?B?RUlEVkxRZEd5TVUrT29Sb2xQVnVGSms5K25xVGhiWnlUOUx6VlVjby9aOVl6?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c59179-24f2-4495-3ccf-08dd6d4cfbb8
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 16:32:36.6986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KME2ZLhZ1uhSigpgfi8gb1YKnzeq/LrKPLKU26NNbOz4rrMOBRZqLVuLFHc/msQfdUmoWPm1L9e6vbV6nGbb2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7921
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


On 27-03-2025 21:49, Badal Nilawar wrote:
Hi Rodrigo,

> According to pci core guidelines, pci_save_config is recommended when the
> driver explicitly needs to set the pci power state. As of now xe kmd is
> only doing pci_save_config while entering to s2idle/s3 state, which makes
> pci core think that device driver has already applied required pci power
> state. This leads to GPU remain in D0 state. To fix the issue setting
> the pci power state to D3Cold.
>
> Fixes:dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 7046e7e9a6c7..3317d475be79 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -932,6 +932,7 @@ static int xe_pci_suspend(struct device *dev)
>   
>   	pci_save_state(pdev);
>   	pci_disable_device(pdev);
> +	pci_set_power_state(pdev, PCI_D3cold);

Another approach to avoid calling pci_save_state and 
pci_set_power_state, allowing the PCI core to manage this.
Currently, the above change aligns with the Xe RPM suspend flow.

Regards,
Badal

>   
>   	return 0;
>   }
