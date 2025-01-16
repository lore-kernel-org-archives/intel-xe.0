Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A4BC02187
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 20:55:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C13910E9F6;
	Thu, 16 Jan 2025 20:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxEtH6Uj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9A810E2E4;
 Thu, 16 Jan 2025 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737060956; x=1768596956;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=i1rayYNp71hlRiKZHcwchuiW2FoJlGtaDUeLi+DmAJo=;
 b=GxEtH6UjWHKMvcerHdLc+i99VFKmyf7hEf8/0BVOXb90ARvpe8EhV4Rl
 CuGWsBo7H7nMiG8KX21RCEG8p0t7WxbqgN5UqOsPKjtbW6LM9X+5aSrHC
 yXKhbTROkWc7OKtptqEWBZJsb7C8hHiYJk5zjv18Kw9xCNwP+QpLtieaF
 9pZNPjOuXFe77PwxIsqYcmGojKL2MTe+GxqxAPlRWwb0vGDrV9laLBjkr
 6DAFVPTa1gMHd++Soo3hCoXHxiAi5mJt3i22jZ2cmH2Hgu+dHFkVwrlum
 1sluIe84OaUCxnN4uV4k3oGxpSvVzOXiDwtn856CXWVQ4PUje1xj7DmbL A==;
X-CSE-ConnectionGUID: UYA/Z7bdQCGgUylfauM43Q==
X-CSE-MsgGUID: WPJ2UwvcSvmPTni7PultXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37387376"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="37387376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 12:55:56 -0800
X-CSE-ConnectionGUID: O6wpd+T3R/ule/YoM2d3mA==
X-CSE-MsgGUID: DF6d3RsKTjeFkN9i+sf2PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; d="scan'208";a="110596818"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 12:55:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 12:55:55 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 12:55:55 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 12:55:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wrwt96e09KnEZ9Dp42DShHMdBstn896KzlMvx7xpTmWDBLQXYsdZiiV20STYBo8tzORSnOH3WeXGxRl3KH7IfUws5NfZ8gO4LVK9HkUA7aNurBRfuUe8PghX+bvSuH2t/WF7R4bvmxaNZfR55HnG5p1nYLjl2Bokt86VjQ3fVuTao/FI8MOUT/6gCT5Hy1Q77cLTZv/1cAbmHty+W1RgRVUbAgGh8f4kY4Q3CkCQ+9EEmgpOiFMSInCO0BSTryQTE4g/7iILvGYZpolE8lBKFUIypgTsPCZASgRAHI5BdAd7R4nxY1MUZhdPLPB0eVNW41XtlMKmC2rgghFbTBMm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMJrqUclEfgHja4dU4TNeVAKN09SZXFT2q2RN4yMloc=;
 b=R7WdjQES0tz5PVCSSqHSN8jSwmc29qGI+d37Zw4mnRTO3OKuOoHC9qNSGyYoeeEObR1qmKudyVRsnY+gqpthxpKkYIIx72MOUdhjHu3Dxdebs9IvYsi/tdjIMP06cjmoxQXMFLQETVO8j3ODntdj+ut3I85O5pYM6k9elQJt2NNvO9lq/MQo5RhdMBEdaRZCDVwz2Knz92C9+bwMRuNjUNtM/Sg8VEGXw+x4DLk4AzS9Bf+LfV6fJs2KxI0bpkYI1rjFh6hgyUSUUresoQ1HNnogCkflxr/vG1sPPBnJGK4Jgf6Zd5lWmb1Rp/Hn22sJ8oEa1rJVlyyddPiV7OyTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 20:55:53 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 20:55:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173685904259.3595894.1684606779647538429@b555e5b46a47>
References: <20250113204306.112266-1-gustavo.sousa@intel.com>
 <173685904259.3595894.1684606779647538429@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/dmc_wl: Track
 pipe interrupt registers (rev2)
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Jan 2025 17:55:47 -0300
Message-ID: <173706094734.1623.12523889226379542683@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:303:6b::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: a4596b5d-09d4-4870-82fb-08dd36702a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUpqc2tiUjJKVyt2M1hSU0lmZGJ3VHF6Y2lHWWtxSmZkTThwT0JFdlB5dUFx?=
 =?utf-8?B?QWZGb0RsNEhqU0w0ajhFRjVCRzFWdEIyTWJMVjdZOTVjSEUxZk42VHVXVFZu?=
 =?utf-8?B?WHkyS3JsUE9iSVBxNWJsMXhXM3JpUjcwNW93WmxWdEFHcjliRkExcmtUaEdI?=
 =?utf-8?B?dGY2S1gwZ1c2d2ptTldsSEV0QXFaK3ErUXhnN0lMVnJ0eWg2dmZNa2oxRUk0?=
 =?utf-8?B?WFBMbm0xMFEzQVZNUWxHMkI4cG9nSi9IQ3VKMWZBeUFIbE5SMDlUd3RFaXh6?=
 =?utf-8?B?Y2NrcExYNlZUdE9SbmsySFlNY0p6UmR1Yk9LRHQ0eUlBa2VHY3J4RysyWDFh?=
 =?utf-8?B?WmtlKzVqTVUybWZQMkdjVDZaRjlJNjd0N1V3T1JFMVRyTjlFV0xuRXhwWVJU?=
 =?utf-8?B?QVUybmJyOEZWM1Z6WldrRXdkRXZzdXQzemJ6MEpHd2VkVHRkVEd5NmFIcG0r?=
 =?utf-8?B?Q2I1d2R4NU16eTBnVitzbG9LRjNrUEU3TE1IYVBVVTV6Ri9HZ1BDa084aFNs?=
 =?utf-8?B?SllqUjdwelBwUEpJUFJTQ3NKYmNlTUpHUXd6bm1wREJlMmViS2VyM2dyNmRT?=
 =?utf-8?B?YXhYbkxmMXB5TjA1clVaeU01SmhuUWZhWmtzTTNkMW1aM0xmakpjUzRYNXZF?=
 =?utf-8?B?enQzbEN6Q1p2TmNibEdtVEFpQm13eXYyeUcvU2pFbVpyaHcvNmc2VWVHTlpr?=
 =?utf-8?B?NEFsMHd6bUVXR1hkTitndnVKODBhNkplMWhFa0NVUmdGa3lPSjl0TVAxc0Iv?=
 =?utf-8?B?T01aS0kxZUlGcC9pVnB6bjBFd1hrME9iWmNuQ3VpcmQvVE1PcWpiQ25pZ1po?=
 =?utf-8?B?RUloYjI1bWlWOHVjUnlURUo4Tll1aWc0NWgyeTY0T2ZINEZRYlcrd1MrMENx?=
 =?utf-8?B?QnZic3ViR0lnKytNaWVyS3VJbDBEbm5paHJ5YStrUkljQW1FVUZrSm5wZ0Uw?=
 =?utf-8?B?cDhGUjFnUXJ5dkNPRFJKTStENDJqaHArRW9EUG90TGpjck1BMTBiTFhUMWV4?=
 =?utf-8?B?ZWJtK3hISFRtUmtXcFc0MnZaWXo0eGd2TTVIQ2pVK2JCN0w0OWM2WEtTaFZU?=
 =?utf-8?B?YUlZbDFwTjlYb1RRb1F6YlRyM2doK281bk5SSEd1QzJhUklkMzh6UzJZb1p4?=
 =?utf-8?B?c3IzNHExRU9qR1pCNFQrRU11SzZtcytLTnk4cmdrTEFnb0FTWllPRWQvLzA0?=
 =?utf-8?B?c2dZdFpFL1A1d3o3VVd1dmQwVC82TXk1cG13Vmg0V0hZRHJmbHUxQW1tUVNu?=
 =?utf-8?B?T3l1cWFXcklmMmJ3TlVQSWEwOW92eUFnQ2NTeGgxMmUwMWxXNGwwT21SUExn?=
 =?utf-8?B?UkNKWFhUcTd0MFd3Q2IrQ3BUU05SekRLeERQYXNLR0RzVWVYK05HRE1iTDJo?=
 =?utf-8?B?YmdQRkhlYWswekw0TmJDdXZ0NkpvWlBVMlJJTUZwRXZ6RHVuK2hXS3d6aHFX?=
 =?utf-8?B?R3JSU3oyclZOTERhNjF1b2FqM3pZaW9QNzViZEtWNDl0ODJHaEF1VmRVYWdG?=
 =?utf-8?B?U2VEVzM5UHVEY090WmhtSWRzVzBRdVI0c3BYUWhnR1ViNmtSOWhDYnB1ejc0?=
 =?utf-8?B?MEI5K3BzMmZmeHFSTUdPQWxXZVJEeEtJbEEwZ0tMazZzMkQxNjBLM0xtOUpi?=
 =?utf-8?B?VWdsVWU1ekcrd0FWOHg1eWdEREJ0cU1qOG5iNDAvMDI4N3MyZmI2UVJ2cWtN?=
 =?utf-8?B?bG1ocUVjcjJXOFd1RHUvdVpId09jWm91ZFpldVRFdkJBd3Q2OUM1aVNPSGNR?=
 =?utf-8?B?U2JHTWVXdG1JQ1ZvNEttSXdpRE1qTmlSZStxdVpkUFRZaHoyajFaV0h5YXRx?=
 =?utf-8?B?WlRjbWxxNllCRGh1WEN4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0xrcndkdUYrTVlDaXBVTDZKcDZ3WGY4c1VCWXdnazl0RVJ5SWZmTUttU0Nn?=
 =?utf-8?B?WDlxeXNiVlkvVDh6bnI2UlNNNmhKK2oyTEVZajNFUlg2YitqRnkwbkJnSmRJ?=
 =?utf-8?B?S2ZxYzNTUVp5a0NRNlJ1UFVOdTdZOUtRU3VsU0FKcHZFeVBibThTYVEzaTNu?=
 =?utf-8?B?a2ZOb0FYM2l4UGxaNjJ5TlZzaUJtZlA2dGdaQk9pcTd4bFBrcjB0TzdOK1RZ?=
 =?utf-8?B?czJjMm8wK1J6QzU3Mlpra2h3THBoWWp5OEJtUjJZREJlM21VTysvWG1ZcjAv?=
 =?utf-8?B?RWMyUEVsa1F5V2ZyV05FTFFtUVlESDR6K2lWWk56Mm9HTlY3TWhCaG5GdGlW?=
 =?utf-8?B?NGZCTHR1ZHZyNlNkeXNBeEpSbVRicnBkMitLSWU3N0s2ZkdLUXM2WGhGNnQx?=
 =?utf-8?B?amt6RTE2RFJEcVR0ZE4zZmdVdWJPajdXVDYxWURBM0FrVWtOV0pwT3o5YUNS?=
 =?utf-8?B?cjhscEZFeUV3bGtCUFV5MWlhaTJFWGxMYWtZb1lQOTBLYTAyWXRHUWN5bGNm?=
 =?utf-8?B?bjBTZndjVkg1SkQ2cThEOGNiRG9MVVVhUlRUbnU0VkVSczk1TWhLNFdqYVZu?=
 =?utf-8?B?UUVZWUUrdTIzTHZMaFZyb3VhclZFZ3Zrb20yYjZZVnZGd2I3NktQUXNrUnNi?=
 =?utf-8?B?Y21UTUhWd3ZHR3lvUXFSM2lLL3dwT2lPd2N6REZCcTlWaW1DZUpmNWpMSGVI?=
 =?utf-8?B?aGdvS0VsT0tsTHJiWHQ1azNzcVhiWXBRVVJZcUxCT1FmSk41aUJzdThRY2Ru?=
 =?utf-8?B?bHY2L3hxRjVlYjNhVkNtKzNyUG9UbnlpbTFyYUdDbVFZeStPTTdrTmtZRXlN?=
 =?utf-8?B?NHk2elRXL3Z0N09JMEZRWmliRWtlNDIwNVE3b3NVTlFlYmNKNUlVRi9jUlVY?=
 =?utf-8?B?RDZqU1BRZmVxZDlCaTZUeWp3OXo2ZHhuNHYrK1hPTjNjZ2hCdThhLzNUclBQ?=
 =?utf-8?B?SWp6T09Qb0hTVjljVGkyd294RDBRckxuRXVSek42azFpSENqYSsvM1E3QWRJ?=
 =?utf-8?B?ZkJRUHBhczlJaUw5L1E3RUFhaEYwOGJYeExobklqVmNXUS9CRllkcjB2OUpU?=
 =?utf-8?B?dWpocHMwSmdyeExhQ3ZnendHN3Y1T2RVWnR6aE5jcnZub0QxdFJ3K2V4U09U?=
 =?utf-8?B?emowUkFMSkFYSlk2OENlWHg3MUplWWNidzFPcmJiNGh6L0orTi9ybU1NS0Qr?=
 =?utf-8?B?Z2dhWmYyQWVJazBsQ3htb3lFTkxRSjU4eUtGNXN3UnhSV3ZBSWxGYmR6L2Z5?=
 =?utf-8?B?b2lZNXVHS0k2RmJsTDUrVEtQMmk2dDFSeU9sZlFsdi81bUNBSHoxMGNxWE5Q?=
 =?utf-8?B?WE9wVmFVWGJwbFZXMVo1UmxlUWZuU2tXV2J6bjczN2g2a2NiaGNBTVdNSmpP?=
 =?utf-8?B?L1FRRVg1eks0V3lCKzZaRGNDZlo1d3gwQ1UwM2YwcXRBTm42ZERuR2tKeUJL?=
 =?utf-8?B?aWpRcndYWmJWOXVQemJuYklYdExIY0xlTVBZM29QTnZYelJvMmEvU1pvZUtt?=
 =?utf-8?B?bXRGY05wRjVTekczMnNZYW9iYlpNb0phdzIzL01YUktzNmI3Yml6cTBLTGRP?=
 =?utf-8?B?VXJsM0toa2xtWXd6Mi9COHRrdWdpU3RNT0t4aENDeCthQmQ1Y0lMc2dma0tz?=
 =?utf-8?B?amxxZ1VSVUlwSzNTMXBQaU9RUk1CR2hWcDJmaHFUYnlTR2NjUmt2RFc4N1RT?=
 =?utf-8?B?MkhkZXRRb09ITTZKZDBtTi9xc3JEK3JhODE3Y1k5QXlLNGRMWWY4alRFTTBJ?=
 =?utf-8?B?akFLakJmWTJNUyszWlF5YjZSSTZka3dUeC9kVWIrOTJEeDVRWjYzOXFpRWdq?=
 =?utf-8?B?QmFjd0FzRXNDcnBvemRxOUZvTnkvUU1tcktBSjRJbmhwZ2JtMEV0emtOczlt?=
 =?utf-8?B?Yngzc2htbW1MbHhBb3k2THJlYkNzNVlCbzljVCtIKzJUNkJNNzRwdnd5ZXdJ?=
 =?utf-8?B?QnlUbEtTZ3ZnOExxUHM4Zks3MG9tUnhIN29OcWpWOStLZDVhSU54NXBXMjB0?=
 =?utf-8?B?T1F5YlVYb3pOY3QycU1ISGZvNkJGeURTQ3NKaE0rMW4zQ3RiNmFVOEgxcTR4?=
 =?utf-8?B?SjdlR2xYNUp4dVh4eDFrVHo3eEtHdU5MVVlUNjJTUXVyL0pOUlZFWEx4cGly?=
 =?utf-8?B?dnJ5OWF6NU4ydUpkQnZnQTRKTEtLMnhzOVBxZ1JsQjFxQUJ6elJTMGFSRjlq?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4596b5d-09d4-4870-82fb-08dd36702a58
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 20:55:53.4509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZw7sqV40P8i0zrJ3RCSySq0uAXOcmxgkezux6iGuJmv+pyvkhgUHGbQus9cYjYtGd9/WtO3yggHnIrPcsK7SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
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

Quoting Patchwork (2025-01-14 09:50:42-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/dmc_wl: Track pipe interrupt registers (rev2)
>URL   : https://patchwork.freedesktop.org/series/143103/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2480-20058aae3e619821197cd32b736893f1d7917ba3=
_full -> xe-pw-143103v2_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-143103v2_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-143103v2_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1431=
03v2_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@core_hotunplug@hotreplug:
>    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2480-20058aae3e619821=
197cd32b736893f1d7917ba3/shard-bmg-4/igt@core_hotunplug@hotreplug.html
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143103v2/shard-bmg=
-8/igt@core_hotunplug@hotreplug.html

Looking at
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143103v2/shard-bmg-8/dmesg8=
.txt,
it seems like the test went through, but CI thought it was incomplete.

>
>  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
>    - shard-lnl:          NOTRUN -> [FAIL][3] +1 other test fail
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143103v2/shard-lnl=
-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

Looks like LNL and BMG have had issues in going into resume in other
tests as well:

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4075

This should not be related to this series.

>
>  * igt@kms_fbcon_fbt@psr-suspend:
>    - shard-lnl:          [PASS][4] -> [FAIL][5]
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2480-20058aae3e619821=
197cd32b736893f1d7917ba3/shard-lnl-6/igt@kms_fbcon_fbt@psr-suspend.html
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143103v2/shard-lnl=
-1/igt@kms_fbcon_fbt@psr-suspend.html

This was already happening, but not being captured by CI bug log. Some
examples:

https://intel-gfx-ci.01.org/tree/intel-xe/xe-2492-72400937e76c02ae6345f0dfa=
5a598f0b284ab09/shard-lnl-1/igt@kms_fbcon_fbt@psr-suspend.html
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2466-c066c8811476b15e9eda12171=
3b5518d21f2347e/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html

Possibly related to: https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4767

>
>  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
>    - shard-dg2-set2:     NOTRUN -> [FAIL][6]
>   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143103v2/shard-dg2=
-432/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

This is (or should be) tracked by: https://gitlab.freedesktop.org/drm/xe/ke=
rnel/-/issues/3321

>
>  * igt@kms_flip@flip-vs-suspend@a-dp4:
>    - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8]
>   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2480-20058aae3e619821=
197cd32b736893f1d7917ba3/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-dp4.h=
tml
>   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143103v2/shard-dg2=
-464/igt@kms_flip@flip-vs-suspend@a-dp4.html

Possibly related to this? https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4839

>
>  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6:
>    - shard-dg2-set2:     [PASS][9] -> [FAIL][10]
>   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2480-20058aae3e619821=
197cd32b736893f1d7917ba3/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-inte=
rruptible@b-hdmi-a6.html
>   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143103v2/shard-dg=
2-433/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a6.html
>

Possibly related to: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/=
886
