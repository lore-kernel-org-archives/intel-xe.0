Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C83CCDD556
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 20:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2746910E0A0;
	Wed, 18 Sep 2024 20:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DDmjMx89";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E7A10E0A0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726692930; x=1758228930;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=bpXeQ6n6ulT9J0nVSHmrcVhbnaXQV9vAoF8EFE2yyo8=;
 b=DDmjMx89y1MMEi3/BGAHavzPB4fxWIE2ttnL5ALQ05oxEqyJqIFcfFis
 OLPbeGpV7EdduH8Ss5S8LW2ltSPXo2ldZEIZLORXePZloBFNW9NFE4zSB
 fBa/N7UU6Sl9EIbIxu9J6wqZq7PcazXZYUF7OzT+haN5hppDN46oUGdN/
 efDd0KIydINXTviVAwfPpqUH3HNPzopLC7VkGPm7+bFAUlw/HNthuHFwf
 6dCfBYjsz91pQhnEXzaZhYTRb1/h6WiXBlPOQrakZLfmraPqBlgCeJtG/
 XlYyNPh2tuGhijDst0Y2nY9calJml8QhbPfKpmcaLJHJKTIRowV+n3MyO w==;
X-CSE-ConnectionGUID: t+wPS192REGkACBT41bOgw==
X-CSE-MsgGUID: jNyqO7rWSJWoNz8I9Q5o3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25503053"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25503053"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 13:55:29 -0700
X-CSE-ConnectionGUID: 8GcAoL3GSQ6pbIxYJejslA==
X-CSE-MsgGUID: 3mQy3G8yTWuoWAw94Kf0oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69815554"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 13:55:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 13:55:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 13:55:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 13:55:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 13:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX7d/qIuhJ6jZRLUlnmf/W6kIsQTZbtqhANb1eDqFSy5xYkmVUP3rry7iSisC2dxVMsqqu+J96ksEa6QiPjLooTDO7Sw9jUUdXc/uDMnszy+nPI73E3QhB1VGOE6qrSyOBswGYlA5H0Z8Z3Ti1VQZt3h2Rrf8fi1kjCjjO4aUeEqd9uHR7pbBDEKMJi0oEazZPq1L7z6e7CQsDgbKdGJjQOxIhBf2JirT7boI1nxv8ANFLl5rnzPcOjzbEEGhqSgjTKmxBXICYpsauSF0t7SvHmnimBBdfoMeYn/877nhQcej3G829vt9jHQLcJxss4S5QARTsLn0k0HWcVNDN6rPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlAbw0xxyzZ/Ep4gIYunrKwgocU3fJdJ8SLOrto8Wro=;
 b=Gvz9LA/puIjiT7gEJOoPDLox1h3PiIB2Bl5pV6EbyK3nmTjIZE+9lNzx6mJgcXtEsgOoiYXhSuNBFR8wlPj1P9rIQj/oV8nTm9t1uxUN6shL/TfJQrwJAtAc6l9jvmV97Slibk+ta1KN+8ERhslbrNj/g41aTI0Mtytso4pUae6FtlS3RBN1771dQ6puCWv/irJJq/3vrWh8e/HaygqmEAJ3zBYHa3RKkWHBZMnTqkqyXLE8nAtn57SR/8oWsvbRbgsSEzSUcZAKZa16ffPYI0wrhY73nNDkdV/c7ib90XUjpAseWWPyEPyBla6zJ5GFnz0g16PYOzNYcIS2XYgirA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY5PR11MB6163.namprd11.prod.outlook.com (2603:10b6:930:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 20:55:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 20:55:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <172666928049.2301.8057233356990184953@gjsousa-mobl2>
References: <20240917165400.40592-1-gustavo.sousa@intel.com>
 <172659255821.1857.18423882338010122836@gjsousa-mobl2>
 <20240917224243.GQ5091@mdroper-desk1.amr.corp.intel.com>
 <172666928049.2301.8057233356990184953@gjsousa-mobl2>
Subject: Re: [PATCH] drm/xe/xe2: Extend performance tuning to media GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: Matt Roper <matthew.d.roper@intel.com>
Date: Wed, 18 Sep 2024 17:55:01 -0300
Message-ID: <172669290167.49928.15718545452726386002@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW3PR06CA0011.namprd06.prod.outlook.com
 (2603:10b6:303:2a::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY5PR11MB6163:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d719276-cbf6-4b96-85a8-08dcd8242d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXNlSFFnMVl3S0wxWXdCQ1JUWGRJOGM2MTBFeWRMR0x1ZVVwVm9Fb1NkdVB6?=
 =?utf-8?B?QWlaVklWeWhENGVJc3dQM0Q1ZzlXN2ZVU0lQenFWYjl6Z1RrNFU4MlB5a0ZV?=
 =?utf-8?B?eU9paEQrMm9vTXVyanBBVGMwbW01cHRyMjZ0UURJN2ZySzRkMEkzTGFIbmV3?=
 =?utf-8?B?Rmliem10Z1RuZWltRmpPN1UwK1hVTjl5YzZxeEJBZC9BZE9uNUNKUWYzMWJP?=
 =?utf-8?B?SkFJalFLSW95WjJhamNwVk1ibG1sR1VXd1NWdWpRQWxpc3VzUXJXV0JEVVds?=
 =?utf-8?B?bjRHbDU5RlZmajhvZng0aDMvY29FSWh2dHBja2M4QXRZTmo5THJIYS9oei9y?=
 =?utf-8?B?bnBpN2RSY1E1NU9aKzNLR25yQmRXQm5PVDUzWDZ6YlR1VkpVQ0lvR3VMQkxE?=
 =?utf-8?B?Z3NpOHJOMkpPNzR5Vmk2d0xidmxhTmdUU2YwYW1VY1NEWWZNRHNqRTRFMjlm?=
 =?utf-8?B?WEVLeGdsZW10bHRZeUY3TmZiRVVvVWhkUUhHM0hSeGs5UnRzMlBYbCt4VmtZ?=
 =?utf-8?B?a3MvbkZ2ZDY2MXlWaHRnaEJpSFl4QVFEM3FoWkNuT1JlZHBzQkdia21LRW1a?=
 =?utf-8?B?WEVvWnBVMjg0YkM3SXVjWjFnOFI1QnBmN2NtU1VNbkV1UmRFWmgzMmY4VXQr?=
 =?utf-8?B?bUk2U21PRGE1bkpIVVZrN0plTHVYNWE3cis1b201NXd0ZGh4b0h2NjdDQld5?=
 =?utf-8?B?QisrZ3VVVW5JR3VjZWZNYlhReTBYRFhPeDhLTndPT29TRmlmTlZzT21XMGVX?=
 =?utf-8?B?L3lOcUpQSlNTMDZnaHpBZ2RZTVhQN3ZmSnhYSUdiczJ2Tk9WeGhBd3d2SUF0?=
 =?utf-8?B?RmpaK00vZ29QWDl3VnRHSDVJMWlPUHprKzdNT2hsR1dyUWZ4dnZhUmczTXI5?=
 =?utf-8?B?eUR4eVdjS3BTbHAvaUlsOGdQTXdqMmx5TXJUQ0FVdG11MVlYMzdVK0JwdVZG?=
 =?utf-8?B?MDEzbTFBZnZzQVdlMnBrUk5lSkpkMmhLOUVHdjdSVkRwblJLbTVlb2t5ZXl4?=
 =?utf-8?B?djJ0SC9vUURtdDFyNm80MlI2WXdhUVR5RHpXSWdIVlV1b2NScTJDTVVLcE0r?=
 =?utf-8?B?c2Y5US9BV2RVNlpCcnJFd1gzWlF5dFYrZ2lobDJkZlhGUnN3aXNabjlGTkRw?=
 =?utf-8?B?bkkxL1c1RWhDMThQYytDRmJMZXpGTzMzbkVUWmRGd2dCY01UcmVseU1lR0kz?=
 =?utf-8?B?eUpBNms4KzBwMGdPSGhwclpobHFRTHpkeGVkYzZoeVVrdVg0Q0hSOUdDM3E3?=
 =?utf-8?B?ckg1bUZyQk1jUUlPaWduVEx2Y2ZxVmVGeEROVmdjK3l4WmtZa01mYmRhQVRI?=
 =?utf-8?B?R2ZxeXFuQ1crVEU3VTJ0aVZXekFmaDVKdS9tV1RlOXdueTRoWW8yK2F3cllK?=
 =?utf-8?B?eFhDc1BsS3lRWVBNdm9qdHNSTFNuSXhpaU80NHJxQnFRajJKSm9mTWlWR0Nj?=
 =?utf-8?B?S21Sc1VJeDkrMkE0RlNrMWdWeWwrSnJmY3JYNzhWUzNDVGRPaFA1K1VqMS9r?=
 =?utf-8?B?SE1KTEN6L1liNUJvZ3QyNCtYQkhlRzZwUUpCMTFwOTRsdnR4V2tVdXg2R3px?=
 =?utf-8?B?L2RFNVJvcWgrQXhSYXJuT2tod1ByU3R0QjdXSzJnbnhzWWI2ZVlvbnVLNDIr?=
 =?utf-8?B?NEUyMXBCK2pCSWVFcU05VVFuaW9OTHRsSkVta2lJTktxbFJyeU9DVlhHZEI5?=
 =?utf-8?B?K0pSbThxejF2ZGNnVWg0T2ZCaDdJWjVzZXhNQWM1RDJ5UG80dzJ0ekZ5S1J0?=
 =?utf-8?Q?9JnyYolpKTX88OBIS4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wmd6NHZzUVVXSHhGQ2g1dmQvMXl3N2hkUFdOZW9XM3V6d3pVLzFTWWRTNzF1?=
 =?utf-8?B?cG12OWt4SUw0S1Vqa1pzclk2eG50anNkOEMwRW1pd3Z6VjEzelhyZk5mZDAz?=
 =?utf-8?B?bEMxdjVrdHEzbmVBSVl4WmdiS1FIS1REK1ZGTkl4YjNtd0dxU3hZSS8vL3d2?=
 =?utf-8?B?N0Npd1l5RXFkRm5NZVN5ekVUNmVzOWIwVjNrYUxuNzlPOEFqdjBBZW9pVThz?=
 =?utf-8?B?a3lVcmkrTTYzU3dONGxmZ28wNmRDRWxOaFZKKzlGakRwYm9YdzNQUHRFUjV5?=
 =?utf-8?B?L1Y0SzZNOEtjZHoyWkdxRVVDN1gwTHpXUHhEVndsTzg5WlBvVG95Z3Z4YWV3?=
 =?utf-8?B?UE1pUFkrakthSi85T2x5alBxNTNjeEdyNDJ0K094emNzNGk4bFdtNGs5TWto?=
 =?utf-8?B?SVFkODVQOEZXR3JpczVWK0ZJaG5DRTQ4c2JPbkFlNXVPNXBoSlRzT1ZQUkpH?=
 =?utf-8?B?NllxY085cnJkMG1aZjZPOVZzYkV3OEdleGxPa0FwRFkzcldnVDFRS0w0MzBY?=
 =?utf-8?B?cjA3SGtQRWVSZEwzS3RORjJ1Wk1RQUNPaE1qek00K1k2UHpYTzVXYk5qMS9m?=
 =?utf-8?B?eFNTLzlWRnpjV1ZmVEF5Rno3TDN4Y1dHRE9SVGRuR1JTcTluM0gyOG1tdEgr?=
 =?utf-8?B?MFE1cFVncGZLN3F0dmJiMTE4Yml3TERzTjBEekp2Q2RHTFhCUDBXZ0VhVFBa?=
 =?utf-8?B?K0QwUTdGSGFuZU1nZSsxV0U1OTdkYmt1VTdVYUU5clkwNFpBdmxnWk8xc0JT?=
 =?utf-8?B?V0cwTFYyd2hCUWhQaE1nd0FZLzhtWThwOExDYlNUM1E1a2lHeTkyRzRnNEVB?=
 =?utf-8?B?Z2xiVHVHMkR5MXVsYWs4Q2NXNkt0VG41eU9tUjNoT0lORWFqczh1THhGUnBl?=
 =?utf-8?B?aEVKb29aaVhZZEZGZFRlS0EwVjBqRWJNSnN3VjNuOHMxR004bG84ZEFycWsx?=
 =?utf-8?B?cnJZK2JJV2xlaE1kVnd5ZnVubnQrR0dsTEowSU5UQlpvUk91QzlFK21jTE9T?=
 =?utf-8?B?M01PSmtjK2JJUytnUGdtNVRuWjJ3Y3dJWHFQWEsvZ2xCNmdjdURYKzZUaGVD?=
 =?utf-8?B?cExZaVpTckpVZ1ZETVRUcEFFUS9jL0pVT2tSemx0TW1MOHpQQkVqV3BaK2Rz?=
 =?utf-8?B?N0dwZkV6YWdvRHB1ekg5N1V0bXgxd1E0YTRxdWxMamR6T0ZneEZVbVNQYk12?=
 =?utf-8?B?OG9qKzRsZHVEZFpwUzlWY2dVbHFjRVllUlAvMWw1QzMzY0l1TEZHck1zU2Rx?=
 =?utf-8?B?QnMvVXBvOEM0aWk0clRDSmkxYjhzVDY2M1BiaVJYQVd0NGpTSGxlaUFTYnVL?=
 =?utf-8?B?TmNGODdJRDQrWFVQOWVOMVRkNjJSclN1dGNSZWxDVlBlbU5uK0RuNDhtYXo3?=
 =?utf-8?B?a0tZUDlOTWdjSlgxUHFMcGVsTlRybncxZVA4LysvTzU4SWVKZ2NIMnJDeEEr?=
 =?utf-8?B?bzM2aXVua3MrY0s5MTNxcFlGQWpjRXJCVlhpYnZiaEVpZ0YzVEtTQ3o4NjR3?=
 =?utf-8?B?THd2Szl4RDg1TWRqSC9ucGJvdjZUc25icjlMaXhEOFJOaE8yMFpwMEtDNTJ2?=
 =?utf-8?B?S2RIN3BSMEFlVVFBOEJWMGpLN0lGb1pRUGU2Z2lxbCtXcUhvTFF4L2NaYmtL?=
 =?utf-8?B?dm9RM0Y3YXU3S1FDKzErUzIwOUFLZ2JtdzdqQUhuV2kvdktjTXNqdnNpTG15?=
 =?utf-8?B?S3BxRGltQUdXaWpBVDI1TGxROFRhWE92QlovTXhqcVBKV2lxWjNMbEVvalFh?=
 =?utf-8?B?cHpaYkxLc0dlWVo3QldVcWtaSThza3Y4MmpRVDZiQ3RPSVEwdHNINmc5TXp1?=
 =?utf-8?B?eHVQdTVJMGlWS3NaVG8xd3doZWhvNFZJUnhMKzczN0xLeUhVeWRhendTSEc4?=
 =?utf-8?B?eEM5WXdmVitrMDBTekthTUpaVnBGUHU0dUVPRDAvWWtpZmIrTGdaNTBIbWE0?=
 =?utf-8?B?V1NDTTNGR0syRC92aFZXcTlacUorMFJrQ3pRZWR4WEpqMmdNSGE0bDZCS3Mr?=
 =?utf-8?B?aE1HSTNZRXg4TER1MldMQU1FellIOWVDcjJVcEVnOVVsWVVmdnRpaFRtdDVZ?=
 =?utf-8?B?eWplTHJPVWlEUHQ2VVJ4NGZuaWE1Vk15UVpwb3o2b2I4QVNialNOMktMRzc4?=
 =?utf-8?B?NGd1bFhLeVhEZjJjWWJZY3RpcVJvemY1YlZLU3F3aUFvbGJUcjJJaEdEN0Fk?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d719276-cbf6-4b96-85a8-08dcd8242d8a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 20:55:07.5535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3qn7h5e2U53VkKxOP0KW3O0tOXHMJyDZucsPv2ZZ2n0oqCVLoLOqaAJvRDBShYsZ/gOae3TYWFcRScU3mP9VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6163
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

Quoting Gustavo Sousa (2024-09-18 11:21:20-03:00)
>Quoting Matt Roper (2024-09-17 19:42:43-03:00)
>>On Tue, Sep 17, 2024 at 02:02:38PM -0300, Gustavo Sousa wrote:
>>> Quoting Gustavo Sousa (2024-09-17 13:53:54-03:00)
>>> >With exception of "Tuning: L3 cache - media", we are currently applyin=
g
>>> >recommended performance tuning settings only for the primary GT. Let's
>>> >also apply them to the media GT when applicable.
>>> >
>>> >According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exi=
st
>>> >only in Xe2_LPM and their offsets do not match their primary GT
>>> >counterparts. As such, we need to have Xe2_LPM-specific definitions fo=
r
>>> >them and apply the setting only for that specific IP.
>>> >
>>> >Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and the
>>> >offset on the media GT matches the one on the primary one, so we can u=
se
>>> >the common definition and apply the setting to both IPs.
>>> >
>>> >Bspec: 72161
>>> >Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> >---
>>> > drivers/gpu/drm/xe/regs/xe_gt_regs.h |  6 ++++++
>>> > drivers/gpu/drm/xe/xe_tuning.c       | 19 +++++++++++++++++++
>>> > 2 files changed, 25 insertions(+)
>>> >
>>> >diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe=
/regs/xe_gt_regs.h
>>> >index cf21de3adca6..2e655291a84a 100644
>>> >--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> >+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>> >@@ -169,6 +169,8 @@
>>> > #define XEHP_SLICE_COMMON_ECO_CHICKEN1                XE_REG_MCR(0x73=
1c, XE_REG_OPTION_MASKED)
>>> > #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE        REG_BIT(14)
>>> >=20
>>> >+#define XE2LPM_CCCHKNREG1                        XE_REG_MCR(0x82a8)
>>
>>It looks like they forgot to fill in the complete row of bspec page
>>71186, but I don't believe this is in an MCR range on the media GT (and
>>we're not considering it an MCR range in xe_gt_mcr.c, so defining it as
>>such here will cause a mismatch --- looks like CI already flagged that).
>
>Yeah.
>
>Although this is also my bad on simply copy/pasting from the original
>definition and forgetting to check the steering table!
>
>And looks like we will also need a non-MCR definition for Xe2_HPM's
>STATELESS_COMPRESSION_CTRL.
>
>I'll revise the definitions of registers involved in this patch, thanks!

V2 of the this patch was sent with
https://patchwork.freedesktop.org/series/138844/.

--
Gustavo Sousa
