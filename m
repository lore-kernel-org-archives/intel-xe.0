Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2130CD1171B
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 17:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32F510E0AA;
	Tue,  2 Dec 2025 17:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNA+ODDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D491D10E6A8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764697189; x=1796233189;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hUw7d1Vo1gIgmXQ0qWyPOwfr23gl4ScQB3SiNuR10XE=;
 b=cNA+ODDx/8O5OxZi6IobzDyg8W4e3us4HYCHX40PNzsv/WiiIBcYmWwJ
 R/rkuykGYhlDERNHx4VFfr71zsF2tdLOYUe6Y8YhgN8PnqpFvSaHTn/0r
 LsOI/AgAhMDy4ThH45rJe9X9CBfT8IjMXfOinPfp7J7yHHL/wsSt8dQtD
 bnoQM9icLyxQ6wfmEmbL0aT7Tin8FoJuB0KosgL+LACCypva8kjGObS1C
 P4IW5RfN5PGOTKjmmzGsiBVuAAXujWnbQlhtQuOx8dbTqNedl3TFFmLdm
 PCxrVLYvt3+Nd9VM6bGsKcAsNQp8HccCLZYOv+Ctp0H79M1Ya2+ucOtn+ A==;
X-CSE-ConnectionGUID: yMzetuoASr2jA+R9zMmigQ==
X-CSE-MsgGUID: 957CU9VfSMGkOxnIFrPneA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66564330"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="66564330"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:39:49 -0800
X-CSE-ConnectionGUID: JtPWCO7bQOmP/RELMMTXmg==
X-CSE-MsgGUID: jGYJNgenRsK/NQWtDNXaLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; d="scan'208";a="198616922"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 09:39:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:39:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 09:39:48 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.11)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 09:39:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeIwBC3p5wQ4LTZU1aQvcgChlym2NrNYGY43pnHiZFxX1qDAzNSq3KzawxSVzzBaU5ELFsl5TUfAiNxFn5Vur1GzMQth0g7/vHVuE26DBB2zEYegMc0wmczvEZh6R2gI2NRqcZHQcEnc04eUMaZ+NeOJ0Y2cl8AciFrFuz3gI+ztWIAAQ08Tttk8xIri78ZlJrx3C/jTi0dT0wV1UYFqp1YnV+nDMIrPhVPKCwM6gfrqAyoW+qrf9/BrBlQh66HO+MeMzKzT4y01WrOhNRzcjc5qekIziPUEBi0Xd4mFUHLFqDz7qeIx/OMQ6yZrbb7FqnMXZW3dGb4D3HULAvLA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eDUvzcXHt+fpi5akvt5weba+ozoB6hsFc5Zm9WeJnk=;
 b=YY8b3jeCU9rcz05UjipXivDee5mnMg72/g1rH7/S6/0BKv8Bk7Iqlw5sNMFlk6oEp93lFAlFruaomGIS52TN8Ca6+UIxjBTXsDhD5iERUOAsprFHOSDKULncVsw3KgX+CLigkcYl4l3vGoUPK+/UD4f9CH3ZC70QPA+zl9rOdv1BSpyH48mpFp5gJSwOPxamh9cqNnqWUohFI5bE6jVoV1dxuQTvEK6ZU/kpNQDzlG9YuSIuRVAKDY9ENzjIJQZWd1xWepJS89oHyRDpa6FxxvmCVv/9kNcM0dydGujkI0ZW8OYvxXSgUFgPq4kL5w+RZ5pRwRowlYBaoRBfqtBV/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 17:39:45 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 17:39:45 +0000
Message-ID: <b4bcf5fb-2743-4155-9bc0-df42ba36b134@intel.com>
Date: Tue, 2 Dec 2025 09:39:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/xe/sriov: Add support for enabling scheduler
 groups
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251127014507.2323746-12-daniele.ceraolospurio@intel.com>
 <20251127014507.2323746-15-daniele.ceraolospurio@intel.com>
 <cb4816e4-f0c9-4f1d-8628-ff8d3eeedb9b@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <cb4816e4-f0c9-4f1d-8628-ff8d3eeedb9b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV8PR11MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: a334ca4f-a145-4031-1d6c-08de31c9c83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVNwU09Hbzh5Qnd4OXJ5UlZhdmhMZldFTVZMWWZmcjdhYW52V1RTNTRCeENw?=
 =?utf-8?B?YWExbEVpOW0xU3Y4QW5IMkVtNHVUdEM0dnhSRmt2T2RLeXFTaWYrRCt2c0hv?=
 =?utf-8?B?LytXY2x5L3l4YUlzdnB4RnNtbG5JdFVTa3ROQ09mSDdLMXFta2JvNzZicXA0?=
 =?utf-8?B?S2FuZlVoTnRwdWdTMWlLZWErRUFoN0h1MytMOWt2RVlRSit4cXB4bDBKSUpi?=
 =?utf-8?B?dnhTSENQekt0VFd6KzRXMDIwTHFBUXIrM3k3bzhMVSthMW92UWovRVlVYXVO?=
 =?utf-8?B?R1IzaDF4S2tCK0xwSXo0SWVlbTY5ZDAxZEdvaTFPa1pWSnczRGh0cnpQOFJm?=
 =?utf-8?B?WWI5RmhxTmtUYnRGS2VTaE1DMTVseURaT0R2ZzRJWVRlM3F2a1R0Z2IyUWli?=
 =?utf-8?B?TTYxLy94dFhTWXFnbmJObWRISDFFU0FoRUd6R1g4RHB6eENTOTRYYVNoQndw?=
 =?utf-8?B?VllpckEyaXpsMHVlTVdFYW1uUmFuR0lPUy9FQ1pVa1pnVmlFM1dDMTMvb1pl?=
 =?utf-8?B?clg2bkRUK1NMY3BIcjZ4WG9wNlN6TzFRb2w3TlhPZHlINHp5ZVpxYlJUc3hJ?=
 =?utf-8?B?aU95RHg4ZE52Wi84R3BUWEdmRHFaYmhyeGhURnkwRFN1V1pGVjcxRHROa3dP?=
 =?utf-8?B?QnNabVJId2VFRGVyanRUVUE3S1Y5bDRwUkVwMGkxS2VuSGN4SHNlVlg3OVZJ?=
 =?utf-8?B?VndnMkduV0g1QmFLcGw5ck5uZ3BxaFZpSUFPUnUvdVoveVUraC9UbzQ2MDlJ?=
 =?utf-8?B?bnlLN1V2N0g0OGhWQnMzc0JQajRraDFWQXFTUXpCTWdvYnY1dVlHYlMxQnh0?=
 =?utf-8?B?VUNpWVNHY250V0NBbHRIeVpJVk9qSkNBZmxoKzdRSHZRcGFzRE1iZXFvejls?=
 =?utf-8?B?dXBKbUI4bk9WdXF1SUlMaG1ySDdCcHBiT0tRTnlSQkk2eG9WY0dTdXM2bTZz?=
 =?utf-8?B?dmY0SDVjMXV4Vkh4cCtBSlcyN0ovNTlJbEFDbVNZQ1ZvbE03dHhDRHZmMzk3?=
 =?utf-8?B?eUdCY29IdkxQZFpUNkJwUWh2U3N3eFBPcVVkUmNpWVlNWWtpNHl5NzYva1Nh?=
 =?utf-8?B?SjJQRWE2REtOYm5mSG92MDhOMEpkQmRGeS96UUpVNEM1RVBXSHFJcjEzRDBR?=
 =?utf-8?B?M2dDQlgrU3RoS1RyR1JzQ2lETElqSkdPaU91ZVVMb3l6Ujk0SXlzQ1FYR0xP?=
 =?utf-8?B?WjdrQmFwMWdIK2NWSGlZcUdXa0tRZlFpaEl2cEJLQkxha0kyN1VDa3Q2NlRv?=
 =?utf-8?B?d2JJa0VuVEg3QkZPVEcycDZCU1FPTllQQXB6UXV0SE00SytyYlp5VVNyYnh0?=
 =?utf-8?B?dEducWtlRHBncWcvQnYzTDZiWmY4UW9WR1E5d1lUUks1ZUFLZURyN1BsMWlW?=
 =?utf-8?B?aWZvM28wMXZBUXA4VG1PS0tZNUp2ajRCbll1YkQrOTlUbXNrOWdJdHFLcHdF?=
 =?utf-8?B?MzNnSXNOOUxPSytqNFZKYVpqZlh5RzkxTjZRUXNGcStmYS9lQzF4ZVVlRVNv?=
 =?utf-8?B?NC9tSEZnZTNTbjdFMlVJZVJYQXFtUW5GdkFkdndqTHpjUlpoQjAvS0JYUDBD?=
 =?utf-8?B?VnlxZEtpZ01HQ1ZBU2hEQ2g5VGpJeU5Jdk5NMDl6S1ZZNGJkVUxOT241NytK?=
 =?utf-8?B?Qkt5L3JRZlgxUjdjR0JiSTRJRTNkRkt0cHpLRGFDSnNRMVI3dnNnajV5c2N6?=
 =?utf-8?B?MnpRbmNwRUQxVVVUR3FWLzBrMXVhWjJrT01tNVowblZjRGJIYzkyMExGUFNJ?=
 =?utf-8?B?STZiMTliTW5JdHE0eDZtZ2RIVEJ2dFpyTENpekZwcGowaTIxdVMrN0RGSUJk?=
 =?utf-8?B?a216TzE2b1pxbHJ4MllMU2RxSW1ELzVjSm12NzhrOUgweGl0eGxqV0xkUnJD?=
 =?utf-8?B?aE9sYmI3WXozS3JRWS9mcXBic21DQmRoTHpRa1JxQnVXaWtoUlUyb2dRakY4?=
 =?utf-8?Q?D9+Nnc3pcIosh99l19bGjy8R3YT5BETC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERHTG5pdW9HQkdzT0xKM0FSbUc2cWFWZjFGaWNQbytlTVNBdVJORFVRblhi?=
 =?utf-8?B?cGVNclJ2RUpiUXRGcGNiTDlWc2t2QnRBMlpEQTJ5b2N2NkY2UytWUEFGZTJw?=
 =?utf-8?B?L0p0OEgvYzNKUVVOcDZFaE9OLzZqSG5ZL3VxZkFaaEhqSzNEcGhiY0Zzcll3?=
 =?utf-8?B?R1BFQ2dPcDQraWw3S0VyZlNESzZyaVZUN280QzJXa1R0ZncvTmhneXV5M0o3?=
 =?utf-8?B?SlhSUllxUVRNMDgremFUa3BSQzNjVVFjeVZsS0x3Y3E0bDlNZ2p5UW5VVDd1?=
 =?utf-8?B?ZEFsY0RFV3dlYmp1ZmFhK3A4d2lkZTAyWWJVVFF2SmVHUzhrZ2F1eE9KTmxw?=
 =?utf-8?B?Y2V3R2FzVURPdDlKM1NzSGZaNFNieGd0S2dIUkpRdzdHYjZhM0MyRjIvZ2xl?=
 =?utf-8?B?dVB5WWhGalYrcTd0Z2hBRzFQUGdWcW1yc0prd1kweHRhQzlzOUF4bTYxQVpl?=
 =?utf-8?B?LzZxb3FETWt6U25EaDF1UzBua2ZZbkswdVp4YkxONWdEbzFQNVN1a21pRkZU?=
 =?utf-8?B?VU5nVzNEY1ZRSGZjMEZwTm5qWlZ3NG1kWjNWVVM0WXBDZG1Ka3VLTU9XUEk0?=
 =?utf-8?B?NnhMRnNHUHRVd1k0QStSbnhRLzJJTUhBYk9SRENjK0tyMnVVd2tHSmFreGZy?=
 =?utf-8?B?NGd5b2x0cXJKeXc3RjBBdlVoYzVwRE9UVUY0dUF2QnZVZUJJbzhNYmUzdHVU?=
 =?utf-8?B?SEZvVG1ZcmRDcDhyY1NKWjMzS29tcjgxRjJYMUMwekZ4aW83dmRNMWJDWThK?=
 =?utf-8?B?N3pJL2ExU1U3QjVveWhBdDA0L0FkbHplV3JQZ0N5b0MxSC9IaGxUUW9mWS9C?=
 =?utf-8?B?MWY4ZytJVmFzUVNlZWszK3luTW9jcnRhR29kQlljMDNxeVRCaG03MkxoQVh6?=
 =?utf-8?B?aEZRTlRLc1VHUzVaNVBJaXVyakxHU3lPNnNWVTF6bzlkSjN2V0VUTkpuZko5?=
 =?utf-8?B?NHVQWFNyMGI4OExRY2JZak1zaVVaOTJ2T0xaRWJMWjJ0UklHRXdwaitIbDg2?=
 =?utf-8?B?aUU4TE5Ld3JmM1FFQ2VKb1RyWnM4dEVmWk9kSUlPZXBsdkpjMHphVGp0OWMw?=
 =?utf-8?B?eVhrdkhyN1ovNTJybi9vb2RxZlpTaWwyaVc0MmY4K0syL0Z6K1RibnVqZWRl?=
 =?utf-8?B?RGp0OXBNaVJnZXNUN29GM0dGb3hUczNySlNqMk1kNW40Z0h6YkptU1FZekRK?=
 =?utf-8?B?cnVaaUQ2RlZKZWNDTWtZYkJJaHZJMjdiQUNqczI4d2ZmaVRKY25QWDhNNDVT?=
 =?utf-8?B?eC9sQ3BKOVlvWHZVdkljZjRXZ2l5ODVXOE02OVBTcWtqQjhRYU5WQmM4OVNv?=
 =?utf-8?B?ckRuRFpwRVQvMUFRZHh2a3hvbll2Wk5SMm5uU1I0MWxqcSs0SFhUcWdjRWtE?=
 =?utf-8?B?TGxNRG1Qdks4QlhCR0xpUGJTeFRNMUM2azVVSndlN0t0SktrajczckhZYldz?=
 =?utf-8?B?Q0NRenNVL1BXQUR6RkpLY3JzTklickwvRW1ZV0kxamJ2cVB3RHVWeXYrYTRC?=
 =?utf-8?B?a2ZKN1I1Kys3NCtmcmVoaGhjeVFOOFR5YTBPZUcvM3RMa1F0M1NtT0RHZG45?=
 =?utf-8?B?TlRXWUZDSDRkVXh0b3B1TlBYTWU3cmlzbHc0c0E3NElqSGY3SmlBU2t6Z2NO?=
 =?utf-8?B?eUpMUHJuSWJDZVpscDdpTUZ6eGVHd1F5WlVLS1R4VlVnMzB3VUkwNGdEc0cw?=
 =?utf-8?B?K0tyQkxZWlJvbHY5SUZaWTJzNUE3K1NJSWdRT2hYQjFZSzRWdGZJRXlKMStD?=
 =?utf-8?B?ZGhxNHdlMHc0aytFZkhmKzhtalZhU2VPZXJDaUx5RkZ0dUNodDJoZVR6MnJn?=
 =?utf-8?B?ZytScy9qVGZMNkY4UTVUanQ5MTA2U2NqU1JNbWVwbkVubEZ0di9ob0pSNDlT?=
 =?utf-8?B?MURqOXJLcE9qNnAxS2NmdmxDems0MmlYSVp5SklWZDRJY2ZrUmFtd3QxMWhx?=
 =?utf-8?B?aHdQeG5KeVBaV2NrZGxFU1hHNWk3Nk0xRUl5YVJXN2F1QkVJR2pkb2lpZ3po?=
 =?utf-8?B?NTE1Qnl6b1pVRWpXWE5vYXU4Qm16QmlPYWhNVDdsY2IvWEJLUUp3bzZPcDVO?=
 =?utf-8?B?eG5BZzJEUS8venRFeG5VMlBzMHVKRUVFYk90ZEo2d0N5Yk55Z3RZSXNsQ3F5?=
 =?utf-8?B?Ny9aOWczOSsrZUo3a1JtNDZ2UGhmNnlLeklndDZRcDlTTHA3M2RFYUc3ekhZ?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a334ca4f-a145-4031-1d6c-08de31c9c83a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 17:39:45.1850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkmHfhelJHAtIvOHFU96O9btItlgHJPhIsORFLXEPb5kclhDRL+QAhovNzzH9IxSOAO1gW27frCod+0kisqbj9MIDmfk73/EfUGgJWpUSr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
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



On 12/2/2025 3:49 AM, Michal Wajdeczko wrote:
>
> On 11/27/2025 2:45 AM, Daniele Ceraolo Spurio wrote:
>> Schedler groups are enabled by sending a specific policy configuration
> typo: Scheduler ?
>
>> KLV to the GuC. We don't allow changing this policy if there are VF
>> active, since the expectation is that the VF will only check if the
>> feature is enabled during driver initialization.
>>
>> The functions added by this patch will be used by sysfs/debugfs, coming
>> in follow up patches.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  17 +++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 129 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h    |   1 +
>>   .../gpu/drm/xe/xe_gt_sriov_pf_policy_types.h  |   1 +
>>   4 files changed, 148 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> index 265a135e7061..274f1b1ec37f 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -200,6 +200,20 @@ enum  {
>>    *      :0: adverse events are not counted (default)
>>    *      :n: sample period in milliseconds
>>    *
>> + * _`GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG` : 0x8004
>> + *      Ths config allows the PF to split the engines across scheduling groups.
> typo: This
>
>> + *      Each group is independently timesliced across VFs, allowing different
>> + *      VFs to be active on the HW at the same time. When enabling this feature,
>> + *      all engines must be assigned to a group (and only one group), or they
>> + *      will be excluded from scheduling after this KLV is sent. To enable
>> + *      the groups, the driver must provide a masks array with
>> + *      GUC_MAX_ENGINE_CLASSES entries for each group, with each mask indicating
>> + *      which logical instances of that class belong to the group. Therefore,
>> + *      the length of this KLV when enabling groups is
>> + *      num_groups * GUC_MAX_ENGINE_CLASSES. To disable the groups, the driver
>> + *      must send the KLV without any payload (i.e. len = 0). The maximum
>> + *      number of groups is 8.
> don't forget to update xe_guc_klv_key_to_string() to recognize this new KEY

ok

>
>> + *
>>    * _`GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH` : 0x8D00
>>    *      This enum is to reset utilized HW engine after VF Switch (i.e to clean
>>    *      up Stale HW register left behind by previous VF)
>> @@ -214,6 +228,9 @@ enum  {
>>   #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_KEY	0x8002
>>   #define GUC_KLV_VGT_POLICY_ADVERSE_SAMPLE_PERIOD_LEN	1u
>>   
>> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY	0x8004
> maybe we should add some _LEN macros for completeness?
>
>     #define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MIN_LEN	0u
>     #define GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_MAX_LEN \
> 	(GUC_MAX_ENGINE_CLASSES * GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT)
>
> which then can be used in some asserts where we prepare KLV payloads

ok

>
>> +#define GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT	8> +
>>   #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_KEY	0x8D00
>>   #define GUC_KLV_VGT_POLICY_RESET_AFTER_VF_SWITCH_LEN	1u
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> index 9b878578ea90..48f250ae0d0d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
>> @@ -97,6 +97,25 @@ static int pf_push_policy_u32(struct xe_gt *gt, u16 key, u32 value)
>>   	return pf_push_policy_klvs(gt, 1, klv, ARRAY_SIZE(klv));
>>   }
>>   
>> +static int pf_push_policy_payload(struct xe_gt *gt, u16 key, u32 *payload, u32 num_dwords)
>> +{
>> +	u32 *klv;
>> +	int err;
>> +
>> +	klv = kzalloc((num_dwords + 1) * sizeof(u32), GFP_KERNEL);
> no need for extra alloc, use
>
> 	CLASS(xe_guc_buf, buf)(&gt->uc.guc.buf, GUC_KLV_LEN_MIN + num_dwords);
>
>> +	if (!klv)
>> +		return -ENOMEM;
>> +
>> +	klv[0] = PREP_GUC_KLV(key, num_dwords);
>> +	if (num_dwords)
>> +		memcpy(&klv[1], payload, num_dwords * sizeof(u32));
>> +
>> +	err = pf_push_policy_klvs(gt, 1, klv, num_dwords + 1);
> and then
>
> 	return pf_push_policy_buf_klvs(gt, 1, buf, GUC_KLV_LEN_MIN + num_dwords);

ok

>
>> +
>> +	kfree(klv);
>> +	return err;
>> +}
>> +
>>   static int pf_update_policy_bool(struct xe_gt *gt, u16 key, bool *policy, bool value)
>>   {
>>   	int err;
>> @@ -444,6 +463,7 @@ static int pf_init_sched_groups(struct xe_gt *gt)
>>   	for (m = 0; m < XE_SRIOV_SCHED_GROUPS_MODES_COUNT; m++) {
>>   		u32 *masks = NULL;
>>   		u32 num_masks = 0;
>> +		u32 num_groups = 0;
>>   
>>   		switch (m) {
>>   		case XE_SRIOV_SCHED_GROUPS_NONE:
>> @@ -463,6 +483,13 @@ static int pf_init_sched_groups(struct xe_gt *gt)
>>   
>>   		xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>>   
>> +		num_groups = num_masks / GUC_MAX_ENGINE_CLASSES;
>> +		if (num_groups > GUC_KLV_VGT_POLICY_ENGINE_GROUP_MAX_COUNT) {
>> +			xe_gt_sriov_err(gt, "too many groups (%u) for sched group mode %u\n",
>> +					num_groups, m);
> likely can be replaced by xe_gt_assert
>
>> +			return -EINVAL;
>> +		}
>> +
>>   		if ((m == XE_SRIOV_SCHED_GROUPS_NONE) || num_masks)
>>   			gt->sriov.pf.policy.guc.sched_groups.supported_modes |= BIT(m);
>>   
>> @@ -473,11 +500,112 @@ static int pf_init_sched_groups(struct xe_gt *gt)
>>   	return 0;
>>   }
>>   
>> +static bool
>> +pf_policy_has_sched_group_modes(struct xe_gt *gt, unsigned long mask)
>> +{
>> +	return gt->sriov.pf.policy.guc.sched_groups.supported_modes & mask;
>> +}
>> +
>> +static bool pf_policy_has_valid_sched_group_modes(struct xe_gt *gt)
>> +{
>> +	return pf_policy_has_sched_group_modes(gt, ~BIT(XE_SRIOV_SCHED_GROUPS_NONE));
> hmm, I still don't buy that NONE must be represented as valid BIT
> IMO supported_modes shall only hold bits for valid configs/modes
> and supported_modes == 0 would indicate no support for EGS

I can change that to not have a bit set for XE_SRIOV_SCHED_GROUPS_NONE, 
but I'd still like to keep that as an enum value as it makes everything 
easier.

>
>> +}
>> +
>> +static bool pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode)
>> +{
>> +	return pf_policy_has_sched_group_modes(gt, BIT(mode));
>> +}
>> +
>> +static int __pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>> +{
>> +	u32 *masks = gt->sriov.pf.policy.guc.sched_groups.modes[mode].masks;
>> +	u32 num_masks = gt->sriov.pf.policy.guc.sched_groups.modes[mode].num_masks;
>> +
>> +	xe_gt_assert(gt, (num_masks % GUC_MAX_ENGINE_CLASSES) == 0);
>> +
>> +	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY,
>> +				      masks, num_masks);
> having helper for explicit disabling EGS would be nice:
>
> 	return pf_push_policy_payload(gt, GUC_KLV_VGT_POLICY_ENGINE_GROUP_CONFIG_KEY, 0, 0);

IMO that's not really useful. If we have this as a special case then in 
the debugfs/sysfs we need to explicitly check against "disabled" and map 
it to the disabling call, while right now I just have it as part of the 
loop to map string to enum and call the same function.

>
>> +}
>> +
>> +static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>> +{
>> +	int err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	if (!pf_policy_has_sched_group_mode(gt, mode))
>> +		return -EINVAL;
>> +
>> +	/* already in the desired mode */
>> +	if (gt->sriov.pf.policy.guc.sched_groups.current_mode == mode)
>> +		return 0;
>> +
>> +	/*
>> +	 * We don't allow changing this with VFs active since it is hard for
>> +	 * VFs to check.
>> +	 */
>> +	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>> +		return -EPERM;
> maybe -EBUSY instead?

ok

>
>> +
>> +	err = __pf_provision_sched_groups(gt, mode);
>> +	if (err)
>> +		return err;
>> +
>> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = mode;
>> +
>> +	return 0;
>> +}
>> +
>> +static int pf_reprovision_sched_groups(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	/* We only have something to provision if we have possible groups */
>> +	if (!pf_policy_has_valid_sched_group_modes(gt))
>> +		return 0;
>> +
>> +	return __pf_provision_sched_groups(gt, gt->sriov.pf.policy.guc.sched_groups.current_mode);
>> +}
>> +
>> +static void pf_sanitize_sched_groups(struct xe_gt *gt)
>> +{
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	gt->sriov.pf.policy.guc.sched_groups.current_mode = XE_SRIOV_SCHED_GROUPS_NONE;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_policy_set_sched_groups_mode - Control the 'sched_groups' policy.
> new BKM is to add () after function name
>
>      * xe_gt_sriov_pf_policy_set_sched_groups_mode() - Control ...
>
>> + * @gt: the &xe_gt where to apply the policy
>> + * @value: the sched_group mode to be activated (see enum xe_sriov_sched_group_modes)
> maybe at this point we should already use enum instead u32 ?

ok

>
>> + *
>> + * This function can only be called on PF.
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value)
>> +{
>> +	int err;
>> +
>> +	if (!(pf_policy_has_valid_sched_group_modes(gt)))
>> +		return -ENODEV;
>> +
>> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> in Xe we started converting driver to use
>
> 	guard(mutex)(...)

ok

Daniele

>
>> +	err = pf_provision_sched_groups(gt, value);
>> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>> +
>> +	return err;
>> +}
>> +
>>   static void pf_sanitize_guc_policies(struct xe_gt *gt)
>>   {
>>   	pf_sanitize_sched_if_idle(gt);
>>   	pf_sanitize_reset_engine(gt);
>>   	pf_sanitize_sample_period(gt);
>> +	pf_sanitize_sched_groups(gt);
>>   }
>>   
>>   /**
>> @@ -516,6 +644,7 @@ int xe_gt_sriov_pf_policy_reprovision(struct xe_gt *gt, bool reset)
>>   	err |= pf_reprovision_sched_if_idle(gt);
>>   	err |= pf_reprovision_reset_engine(gt);
>>   	err |= pf_reprovision_sample_period(gt);
>> +	err |= pf_reprovision_sched_groups(gt);
>>   	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>>   
>>   	xe_pm_runtime_put(gt_to_xe(gt));
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> index c9c04d1b7f50..36680996f2bd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
>> @@ -17,6 +17,7 @@ int xe_gt_sriov_pf_policy_set_reset_engine(struct xe_gt *gt, bool enable);
>>   bool xe_gt_sriov_pf_policy_get_reset_engine(struct xe_gt *gt);
>>   int xe_gt_sriov_pf_policy_set_sample_period(struct xe_gt *gt, u32 value);
>>   u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>> +int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
>>   
>>   int xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>>   void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> index 3b915801c01b..5d44d23a5ed4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy_types.h
>> @@ -27,6 +27,7 @@ struct xe_gt_sriov_guc_policies {
>>   	u32 sample_period;
>>   	struct {
>>   		u32 supported_modes;
>> +		enum xe_sriov_sched_group_modes current_mode;
>>   		struct {
>>   			u32 *masks;
>>   			u32 num_masks;

