Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BEDC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 08:37:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E2C10E881;
	Thu, 26 Jun 2025 08:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHLjTcl+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6373410E881
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750927038; x=1782463038;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Aej74EdiZf6Z+I0CEWBdQRzbMoCGpadQLqYBCvedY8w=;
 b=AHLjTcl++HNVbM6iq1dPvn8KSiI+VZGPao9ntXer+ZOYG9lfhRirT2l4
 Z300oFUBHhJkcQJ/aT/7hFU/xKtP6P6To5WUlHWUqbosJ6ZaWNOB5WJoY
 ymmnfbZl2U+c6NUdFsUavtaRLiXyDBgYtGZcAnNjJtU0RS6P3OqDhDOLp
 Evu3K1oHq6BjfMBsUwJol8SBxwDDNbyDO8ByUdE5iN9tq5VqtEy06yeOi
 AGcFfI9BSzYwJCQ67DzMqQuRZEFdUAeLNOHZ1i0H0+cT66igXvfKbQpfU
 Eaqo7xW+1dfWoUcXFPLZbe+b85RH1I82lzPF6Nt3R/k6OcvZUR/AVKdci Q==;
X-CSE-ConnectionGUID: BvDeNDU9S5W8+l1w0poLcA==
X-CSE-MsgGUID: yD40SZCuTDCce3huLtgPAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52331746"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52331746"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:37:07 -0700
X-CSE-ConnectionGUID: QkCWAudjT9OtryUFxyKjaQ==
X-CSE-MsgGUID: OF76YUdQTvipMuhNxhOZew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156725479"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 01:37:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:36:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 01:36:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.77) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 01:36:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIFnDwdgP44i4t+tMxrFiMKdxJUqywcoUEY85GXMc9z0OshrBLGHHSiQ3dcNOY2QUrNRWPWAj5YI/e8YnxqdvhlxgMwr9PTknD1/XKM68vyqL4QWF89Q+5uYAB/NJcIBEzhy9pZOLLf/J93278jwgaezfNm9TcCTUKnjRP42EG0AX6JoxOJ5N55wVD63D58LXFC/kSK5vT6fR/MJhnyOP0bMB6lRPNxsb9vmXYgATNcuk47wPYQsbWXG/1Vukc0Kfk6D9kQ+FGjGi9vVcStMZYrq0acZZac2eqerWxa53Qf2z7ykpKAAWuY8JY7QJuRVdGSJByA3UkqRSD5KgfYSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vn1snXkNr3R+8SRbH2v3aToEiGFBXTkf5eih9Int74=;
 b=bM5NzAdYFyZ5oFPgRh3WMOR3X5vdCoRl2aQPkxni3t8E/essbGuXbS0s2q8/CX3dDrNjrPNGrv0bOfm0GkYrFlDzkOHcb0PTF7aQxjQ7tcPJsL9H2gIRWUCjwdfNEgSWnVNvfyfsyyGZ2Zg0AeDZo+rVeUSLhnovkS+vSB6E3AG8As1+ReLL6DJ5u+Lqx1GDWHHTSq4Z68gEEsYIIsd9vzOb7/8JXv6oFVpXOwcYmcvbaAczM8ALqne9iIw38H/ZncDp2+78T9w078fpfD9BzgWaff70yClFWspcYnudJwKYxBELB9j571DdCrYQINMbpv5bj6j86zLQnHWS4pwT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH7PR11MB8551.namprd11.prod.outlook.com
 (2603:10b6:510:30d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 08:36:56 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Thu, 26 Jun 2025
 08:36:56 +0000
Message-ID: <a4e921a1-ea63-41a8-a925-974a5ff80723@intel.com>
Date: Thu, 26 Jun 2025 14:06:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/20] drm/xe: Implement madvise ioctl for xe
To: Matthew Brost <matthew.brost@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-10-himal.prasad.ghimiray@intel.com>
 <DM4PR11MB5456041A620E64B89F40BB9EEA7AA@DM4PR11MB5456.namprd11.prod.outlook.com>
 <aFzlfMdVOAAI+zO4@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aFzlfMdVOAAI+zO4@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH7PR11MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: cd403fd9-fac5-4664-6752-08ddb48c9bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkVESFNZRE01NjZhb3FXQlkxMnp4ZHluZzRTMXAxdk1jdjE4d2FEQWwxK0Zz?=
 =?utf-8?B?OXY4dS9lODRvbHRPM2Z4Q1dCMDRnZEFWR1RsM0FIaXJlT1MwZU9Remw5MkJt?=
 =?utf-8?B?eXZTT1dWa0I0M3FxYnRGWjZ2NjVsaUJHcTM2MjdRVjVYWmU3ZzZ5MVJLaEhC?=
 =?utf-8?B?LzJTdDF5UExOZDVnKzdCMVFDMWJONzFrdFVETlkyRjhQY0dlWnkvYW8wSDBX?=
 =?utf-8?B?WTlXeEhvZEp4NmU3NVhUMG8rZkJWNWcwZDNjVVpSS2xQYzl3Mk9ZU2hpT2dQ?=
 =?utf-8?B?anpvZk8wRGxTRXlRdkllZHlXQ1hGb1U5WmdDVnBLbW1QRTdCaEJ6VzRmSWI1?=
 =?utf-8?B?cmcreTdFbVFrTnlzNUJQZmZNU3AwR3E4cEtWQTJyaUlWYlh1TDJuTXoyWmVD?=
 =?utf-8?B?VzJ4WWZaTjNZZGhKMi9vcDBZOE5tMlVOUlNzZ2xHb1ByRnhyN2ZJeXNBL05v?=
 =?utf-8?B?NzZ1QTdsUTlqckNxT3A3c0xIVHBLVGppalFLbmRDbnRLd1FzMXJtYmN5aUJV?=
 =?utf-8?B?L2dxdTZ0T1lhTVhOR3lmUlVCVHNKbzRzcUdDYmxVQVpxQnZHeXMzTjBZeW1s?=
 =?utf-8?B?TzZZTlhJYTBBSVYzZFFxaUpZSHhpN0UwWnRpVDZzQUhyMXRxdEYxL0xCN1h6?=
 =?utf-8?B?dTZ6MVFCQ09pRG51N1ZiQm1jNXk2MWFXSXBwYWsweDh2QkQ4eXk0WnlkbjAy?=
 =?utf-8?B?Z1ZDaXQya002U0E2VzhXQTBPMXl4Sy8xQ2V5MWJKY0NWbXRNdEFRV1RPRlly?=
 =?utf-8?B?aWZTTHVDWU9UNEF5R1o5Nk1uS29rdFQ3R2VlS2R6L0p6bDVYQmRiZzZ6cVp4?=
 =?utf-8?B?SFA2WlZLTFVjd0JYS2RWNkRwWWVkQjZJTDYyZkF3N09uS1BEKzNsRFJsUUV5?=
 =?utf-8?B?SG90ZkVMY3RBU1dTYXBtQVlUdFBpMDBteEwwVk00SmF3cUd4aWRVUGNIZDFs?=
 =?utf-8?B?N2tucjBxSVV1aEJzU0pyQXlWc2hFd2NKVkVVNFBITWs5R3hEYzJOaGZ6YmVQ?=
 =?utf-8?B?SUk5K3JLRU9VYjBQNkVzMm5BcllnbWx0T1lMNW40NjVRUTJSd2RLc21Sejdm?=
 =?utf-8?B?ZWhMS0JydHkyTjlMVmMxOXlsT0tNTXV5L0pGa2FldE84OVFtNGhNQ3dzNlVX?=
 =?utf-8?B?bUdaNEt2R2NRQlk5L0x2Q0IrVi9NK3JrR2JrVENLdm9FWkVpTEUvYkt0Y2Fj?=
 =?utf-8?B?Y1I3aSt4UWl1ay9zVkZVVUJjTDZ1d1FmcjBPU1hYV2hFbVRFQ1pNcCtWbnZh?=
 =?utf-8?B?c3FJMnh6UkhMUlFROVpKLy9YTWlqWEpvZm9hdjUvMXJ1Y2VDdnZ6VnlUcGxB?=
 =?utf-8?B?QVY3SHlaSE8zcTZjbXZzeUgyZUR1YlNuUW9ud250Lzd1Q2dzOElOd2lWODBL?=
 =?utf-8?B?UWROUFZTSWxyK0dzZGoyUWhpTjdycUplQ2ZDem14YzNmT3o5eEh5ZDVOOVBh?=
 =?utf-8?B?M3U3aE9KVEVscm8zRG9sclpnem1UVjZITnFqTGo0RTBQSzZQUE53SDVLeXNh?=
 =?utf-8?B?Unc0TGdLaFRJT2NBQUFibXpENWh5RWxkNko3TjErNmp4RG5SMlRxZGZjT0Zl?=
 =?utf-8?B?TENNUzRHalF0VUh6UngyVDVBZk5pZWRyOTVRTXY4UG5GMCtXSEdYZ0dkSldS?=
 =?utf-8?B?dVkxcVpoUm9GMlBvTDRuWTAxdFZOdVNReFBGcTlDeVE4NnZkSzZhdDFxUkdB?=
 =?utf-8?B?TEs0djdJNTFmeXdsbDVyc2RtQzJCSDVvK3RvT0t2THEzZGNiejRNQ0RuREZt?=
 =?utf-8?B?S01oSURSeVkzdkJ2ODVxQUE3bmpOWTdTWit1WmRqUk95bkRKYm1LVHhXTFVZ?=
 =?utf-8?B?YzlSeWtUbFhUdURKMjFxc214OGpyekJpRjhkSXJLenRzbkR3RkI3eGx1VEVS?=
 =?utf-8?B?a2VvdDBpaDJIT0dIQ1ZsditwampNemhXSjVOZTJPZWhMTHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjJaUXpMcXpjYlR5d2F4ZWVSeXVrUnhVSzlrVm90N0VDakFtQ1U4eS9RR3Vl?=
 =?utf-8?B?dTdNY3BXemE2WWhSNkxuTG83NDlUeXlYQVRVcFg1T3V1RHZnT0VNMVNaelNH?=
 =?utf-8?B?UEdyc1RKbWJRVGxHa0JGQlBlZXkwaEtHY1Z0SWRMUXN5THhjUzdwZnFhYmx6?=
 =?utf-8?B?c2JTRmdLM1c0Y0t5ZWJhNEVmREdOeTRpRnkvY3Uwa0hCdVFSWU9qcmJlbjFM?=
 =?utf-8?B?cUo0cW0waU5HY2xzMVBKY3M5ZWZPYWZrNmI0Nmx4d2xPdjZuQUZSUEhWOVRy?=
 =?utf-8?B?RFJkMWREV01wU3hIeGxWeTFtT21xMUlyOWliWWQrR2E5c3pkYmZpRy9YeGZL?=
 =?utf-8?B?em9oQ1dTNW83a0R5M2FtQnN5SUMycjFxY0J5ODMwYnNqdmk2QjlDMmJIN3gw?=
 =?utf-8?B?OFNxdEQ5blZCS2lUcXY4YVJsc0ZDeTNMajc5MUlZNWRpVEFhRGk2b0tJd1h3?=
 =?utf-8?B?K3ZMZUE1NUV2amo5ZFZvblBmeVc3SUlBRkpNZXFvRVBzUU5rb2QvZmlmbkNj?=
 =?utf-8?B?T0grSFNIZHVJYTdBN2FQUDZtRzByUXA5MkhNVDV2aHFHV2lmSHJ2YldDZ0sw?=
 =?utf-8?B?aGMwaGhlZ29KSlN3RFl0VVJWRmlpVHFkNXJrMklia0dZRW9QaWpwNVd4K0tE?=
 =?utf-8?B?UGNUZStVVXVlUmFURzRCK1dHRStjdWlBUEcwS2t1K2VJK3dHcnlsWncrV2to?=
 =?utf-8?B?d1c2c1BraTczWU9nZlpzVllFbm1ocmg2RFpCdXJsUGJUenF3dElZVXMrUmhK?=
 =?utf-8?B?ZzU0WkQxbkl4T250aXhBRCthRE1hczlScW1WbHZ4eHREbExOeExiS1VaSXNa?=
 =?utf-8?B?djJrUXphek5BSXVxU2ZpWWRYOXRkcXR3NjJUY2t2WTh0NWlYRFF4bjV3bEJK?=
 =?utf-8?B?ekxycUo5Ulh0a0Rob1VHVDU0ZWh5aHBjTVhZdHkrZHQwTlhXY0VrTS9TRlNa?=
 =?utf-8?B?aGNtcjlKNzZLbG1XTVNySGpYdFI1MWtQNk5Hb3lUYnFGK1RmYjdNU3B1cEJv?=
 =?utf-8?B?REtjeTF2d2w1WFB4QXhSR2NkcTZzNUFUSnF5bGJ3N3FXWGRrUDhwbzZQei9s?=
 =?utf-8?B?bnhKekJQSnpNdEI2UlY5Rmt0MWhWWXpEMHVrRTdQaUZPTmhXclo0K2c1MS8y?=
 =?utf-8?B?UDV3Q0pnVjBIODd2QjRBQTZJV3kyaWZSelFyNmdxRmt4MC9qdnF3ZHJHeDNR?=
 =?utf-8?B?QWtkVUxGczg4bmdTSWxDTVd6WkhoRUExY2pKU0pidThmQVVBM2RISHJpU2Fo?=
 =?utf-8?B?WmJZeDl1UzErWTZTSGRxN1RLS05URm9hRG9tTHJsY0R5clRGRWJQdHR5UnI3?=
 =?utf-8?B?eEdHbEhBT2RocDcxL29rVTVRcmpaRHI1cm9iRWtwQkFCRURBWnVsYWNJWkls?=
 =?utf-8?B?VlFwaU5pbXhhYzQ0VjFPWW9QNytHRkg3c0VPUjZLdEhPZmErOWxTQTRjNlor?=
 =?utf-8?B?cHhlSUhvcy9RY3VzZytLdGY1YjhhRlFnSG5nbTJQN2RlSjIyYlc0bE5RMnkz?=
 =?utf-8?B?OU1Ta0dmbytGcDhlMEpQbVFKRjNKdVZzbWJXdmpSSFJFK3ZMRnpoZXNjZGh4?=
 =?utf-8?B?SGs4cW8yZ1dxaitrWEs4OEl2VC8xUUY1bmMwY3FQMENnZ1lweGZMbUZOSS9i?=
 =?utf-8?B?SXByTW9aNjJHakxiWGYrRHJ4Wm1KRUlpMDhjNnU0d0VNY3dOeTdSQ0NDT0NB?=
 =?utf-8?B?ZGhtL01ZcnkzSWlFdlVKK2xJa2VZNEx1clRDYUVpdC9ZL1dkWWZpMCs4YnVz?=
 =?utf-8?B?UjhSVGJNNmRJVHlZR1lCZmhiU0lremw3Y3kvYTh3a3lPZlRrSCtVUk5EcUIz?=
 =?utf-8?B?WktXc1RNUG14V21JMUZvRE42NGZ4bndKVnJobEtzNU1oakd2NXFHclBveTBp?=
 =?utf-8?B?UWhsTjhvN1M3ZTFqbThIamhuSEJ6NVhEK2o0dEt1enN4TnZsSXArREROVW8w?=
 =?utf-8?B?eHZqb3ZmbU90Vk81VXZScGZuYlhEWHBwKzdBU3Mrd0Y5SlhWMW52MHZBSlZL?=
 =?utf-8?B?V21WUGNFejN5d3RPYlRNNkllQWtFU2dnbzFOblp1WGh4NGhCd2xHUEFyT3p6?=
 =?utf-8?B?NTJnL2JEWXdhM1R2OE1vKzc3WmlnNHJwOTIzSGZ1OUlTOUY5dHhLeXd3bkdo?=
 =?utf-8?B?WHIyNDB1Mkliek5yYTNUWVpxWWpPMUp0MmZ6U3I1L29YWS84T0RTZnRUVWZ1?=
 =?utf-8?Q?NtAC6R6aSSmBjdV9gTzFM6w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd403fd9-fac5-4664-6752-08ddb48c9bf5
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 08:36:56.4892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd/jsk/7f6bq7jVvH/UQ5VU2xBOx9MAnRYK0zKeoGXI20gTbiHiotV5n6nJaQZQkQof1xLc4b+1iozNqB/dCh5Cx5oVNw54Bp08mmtrR+u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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



On 26-06-2025 11:45, Matthew Brost wrote:
> On Thu, Jun 26, 2025 at 12:04:07AM -0600, Lin, Shuicheng wrote:
>> On Fri, June 13, 2025 8:56 PM Himal Prasad Ghimiray wrote:
>>> This driver-specific ioctl enables UMDs to control the memory attributes for GPU
>>> VMAs within a specified input range. If the start or end addresses fall within an
>>> existing VMA, the VMA is split accordingly. The attributes of the VMA are
>>> modified as provided by the users. The old mappings of the VMAs are invalidated,
>>> and TLB invalidation is performed if necessary.
>>>
>>> v2(Matthew brost)
>>> - xe_vm_in_fault_mode can't be enabled by Mesa, hence allow ioctl in non fault
>>> mode too
>>> - fix tlb invalidation skip for same ranges in multiple op
>>> - use helper for tlb invalidation
>>> - use xe_svm_notifier_lock/unlock helper
>>> - s/lockdep_assert_held/lockdep_assert_held_write
>>> - Add kernel-doc
>>>
>>> v3(Matthew Brost)
>>> - make vfunc fail safe
>>> - Add sanitizing input args before vfunc
>>>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/Makefile        |   1 +
>>>   drivers/gpu/drm/xe/xe_device.c     |   2 +
>>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 282
>>> +++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_vm_madvise.h |  15
>>> ++
>>>   4 files changed, 300 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.c
>>>   create mode 100644 drivers/gpu/drm/xe/xe_vm_madvise.h
>>>
>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile index
>>> f5f5775acdc0..d375b549c30f 100644
>>> --- a/drivers/gpu/drm/xe/Makefile
>>> +++ b/drivers/gpu/drm/xe/Makefile
>>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>>   	xe_uc.o \
>>>   	xe_uc_fw.o \
>>>   	xe_vm.o \
>>> +	xe_vm_madvise.o \
>>>   	xe_vram.o \
>>>   	xe_vram_freq.o \
>>>   	xe_vsec.o \
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 7d9a31868ea9..632d3ab12392 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -61,6 +61,7 @@
>>>   #include "xe_ttm_stolen_mgr.h"
>>>   #include "xe_ttm_sys_mgr.h"
>>>   #include "xe_vm.h"
>>> +#include "xe_vm_madvise.h"
>>>   #include "xe_vram.h"
>>>   #include "xe_vsec.h"
>>>   #include "xe_wait_user_fence.h"
>>> @@ -197,6 +198,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>>   	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE,
>>> xe_wait_user_fence_ioctl,
>>>   			  DRM_RENDER_ALLOW),
>>>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl,
>>> DRM_RENDER_ALLOW),
>>> +	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
>>> DRM_RENDER_ALLOW),
>>>   };
>>>
>>>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg) diff
>>> --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> new file mode 100644
>>> index 000000000000..ff560914ad7e
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>>> @@ -0,0 +1,282 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#include "xe_vm_madvise.h"
>>> +
>>> +#include <linux/nospec.h>
>>> +#include <drm/ttm/ttm_tt.h>
>>> +#include <drm/xe_drm.h>
>>> +
>>> +#include "xe_bo.h"
>>> +#include "xe_gt_tlb_invalidation.h"
>>> +#include "xe_pt.h"
>>> +#include "xe_svm.h"
>>> +
>>> +struct xe_vmas_in_madvise_range {
>>> +	u64 addr;
>>> +	u64 range;
>>> +	struct xe_vma **vmas;
>>> +	int num_vmas;
>>> +	bool has_svm_vmas;
>>> +	bool has_bo_vmas;
>>> +	bool has_userptr_vmas;
>>> +};
>>> +
>>> +static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range
>>> +*madvise_range) {
>>> +	u64 addr = madvise_range->addr;
>>> +	u64 range = madvise_range->range;
>>> +
>>> +	struct xe_vma  **__vmas;
>>> +	struct drm_gpuva *gpuva;
>>> +	int max_vmas = 8;
>>> +
>>> +	lockdep_assert_held(&vm->lock);
>>> +
>>> +	madvise_range->num_vmas = 0;
>>> +	madvise_range->vmas = kmalloc_array(max_vmas,
>>> sizeof(*madvise_range->vmas), GFP_KERNEL);
>>> +	if (!madvise_range->vmas)
>>> +		return -ENOMEM;
>>> +
>>> +	vm_dbg(&vm->xe->drm, "VMA's in range: start=0x%016llx,
>>> end=0x%016llx",
>>> +addr, addr + range);
>>> +
>>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr +
>>> range) {
>>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +
>>> +		if (xe_vma_bo(vma))
>>> +			madvise_range->has_bo_vmas = true;
>>> +		else if (xe_vma_is_cpu_addr_mirror(vma))
>>> +			madvise_range->has_svm_vmas = true;
>>> +		else if (xe_vma_is_userptr(vma))
>>> +			madvise_range->has_userptr_vmas = true;
>>> +		else
>>> +			XE_WARN_ON("UNEXPECTED VMA");
>>> +
>>> +		if (madvise_range->num_vmas == max_vmas) {
>>> +			max_vmas <<= 1;
>>> +			__vmas = krealloc(madvise_range->vmas,
>>> +					  max_vmas * sizeof(*madvise_range-
>>>> vmas),
>>> +					  GFP_KERNEL);
>>> +			if (!__vmas) {
>>> +				kfree(madvise_range->vmas);
>>> +				return -ENOMEM;
>>> +			}
>>> +			madvise_range->vmas = __vmas;
>>> +		}
>>> +
>>> +		madvise_range->vmas[madvise_range->num_vmas] = vma;
>>> +		(madvise_range->num_vmas)++;
>>> +	}
>>> +
>>> +	if (!madvise_range->num_vmas)
>>> +		kfree(madvise_range->vmas);
>>> +
>>> +	vm_dbg(&vm->xe->drm, "madvise_range-num_vmas = %d\n",
>>> +madvise_range->num_vmas);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm
>>> *vm,
>>> +				      struct xe_vma **vmas, int num_vmas,
>>> +				      struct drm_xe_madvise *op)
>>> +{
>>> +	/* Implementation pending */
>>> +}
>>> +
>>> +static void madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>> +			   struct xe_vma **vmas, int num_vmas,
>>> +			   struct drm_xe_madvise *op)
>>> +{
>>> +	/* Implementation pending */
>>> +}
>>> +
>>> +static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>> +			      struct xe_vma **vmas, int num_vmas,
>>> +			      struct drm_xe_madvise *op)
>>> +{
>>> +	/* Implementation pending */
>>> +}
>>> +
>>> +typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>>> +			     struct xe_vma **vmas, int num_vmas,
>>> +			     struct drm_xe_madvise *op);
>>> +
>>> +static const madvise_func madvise_funcs[] = {
>>> +	[DRM_XE_VMA_ATTR_PREFERRED_LOC] =
>>> madvise_preferred_mem_loc,
>>> +	[DRM_XE_VMA_ATTR_ATOMIC] = madvise_atomic,
>>> +	[DRM_XE_VMA_ATTR_PAT] = madvise_pat_index, };
>>> +
>>> +static void xe_zap_ptes_in_madvise_range(struct xe_vm *vm, u64 start,
>>> +u64 end, u8 *tile_mask) {
>>> +	struct drm_gpuva *gpuva;
>>> +	struct xe_tile *tile;
>>> +	u8 id;
>>> +
>>> +	lockdep_assert_held_write(&vm->lock);
>>> +
>>> +	if (dma_resv_wait_timeout(xe_vm_resv(vm),
>>> DMA_RESV_USAGE_BOOKKEEP,
>>> +				  false, MAX_SCHEDULE_TIMEOUT) <= 0)
>>> +		XE_WARN_ON(1);
>>> +
>>> +	*tile_mask = xe_svm_ranges_zap_ptes_in_range(vm, start, end);
>>> +
>>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>>> +
>>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>>> +			continue;
>>> +
>>> +		if (xe_vma_is_userptr(vma)) {
>>> +
>>> 	WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(v
>>> ma)),
>>> +
>>> DMA_RESV_USAGE_BOOKKEEP));
>>> +		}
>>> +
>>> +		for_each_tile(tile, vm->xe, id) {
>>> +			if (xe_pt_zap_ptes(tile, vma)) {
>>> +				*tile_mask |= BIT(id);
>>> +				vma->tile_invalidated |= BIT(id);
>>> +			}
>>> +		}
>>> +	}
>>> +}
>>> +
>>> +static int xe_vm_invalidate_madvise_range(struct xe_vm *vm, u64 start,
>>> +u64 end) {
>>> +	u8 tile_mask = 0;
>>> +
>>> +	xe_zap_ptes_in_madvise_range(vm, start, end, &tile_mask);
>>> +	if (!tile_mask)
>>> +		return 0;
>>> +
>>> +	xe_device_wmb(vm->xe);
>>> +
>>> +	return xe_vm_range_tilemask_tlb_invalidation(vm, start, end,
>>> +tile_mask); }
>>> +
>>> +static int drm_xe_madvise_args_are_sane(struct xe_device *xe, const
>>> +struct drm_xe_madvise *args) {
>>> +	if (XE_IOCTL_DBG(xe, !args))
>>> +		return -EINVAL;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->start, SZ_4K)))
>>> +		return -EINVAL;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, !IS_ALIGNED(args->range, SZ_4K)))
>>> +		return -EINVAL;
>>> +
>>> +	if (XE_IOCTL_DBG(xe, args->range < SZ_4K))
>>> +		return -EINVAL;
>>> +
>>> +	switch (args->type) {
>>> +	case DRM_XE_VMA_ATTR_ATOMIC:
>>> +		if (XE_IOCTL_DBG(xe, args->atomic.val >
>>> DRM_XE_VMA_ATOMIC_CPU))
>>> +			return -EINVAL;
>>> +		break;
>>> +	case DRM_XE_VMA_ATTR_PAT:
>>> +		/*TODO: Add valid pat check */
>>> +		break;
>>> +	case DRM_XE_VMA_ATTR_PREFERRED_LOC:
>>> +		if (XE_IOCTL_DBG(xe, args-
>>>> preferred_mem_loc.migration_policy >
>>> +				     DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES))
>>> +			return -EINVAL;
>>> +		break;
>>> +	default:
>>> +		if (XE_IOCTL_DBG(xe, 1))
>>> +			return -EINVAL;
>>> +	}
>>> +
>>> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>> +		return -EINVAL;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * xe_vm_madvise_ioctl - Handle MADVise ioctl for a VM
>>> + * @dev: DRM device pointer
>>> + * @data: Pointer to ioctl data (drm_xe_madvise*)
>>> + * @file: DRM file pointer
>>> + *
>>> + * Handles the MADVISE ioctl to provide memory advice for vma's within
>>> + * input range.
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct
>>> +drm_file *file) {
>>> +	struct xe_device *xe = to_xe_device(dev);
>>> +	struct xe_file *xef = to_xe_file(file);
>>> +	struct drm_xe_madvise *args = data;
>>> +	struct xe_vm *vm;
>>> +	struct xe_bo *bo;
>>> +	struct drm_exec exec;
>>> +	int err = 0;
>>> +	int attr_type;
>>> +
>>> +	vm = xe_vm_lookup(xef, args->vm_id);
>>> +	if (XE_IOCTL_DBG(xe, !vm))
>>> +		return -EINVAL;
>>> +
>>> +	if (drm_xe_madvise_args_are_sane(vm->xe, args))
>>> +		return -EINVAL;
>>
>> The upper error return will miss the "xe_vm_put(vm)".
>> BTW, the function name drm_xe_madvise_args_are_sane is somehow a little misleading. The name looks like a boolean function, while the return value is 0 for success and error code for failure.
>>
> 
> Agree with Shuicheng, drm_xe_madvise_args_are_sane should be a bool,
> need to avoid a leak of the VM on a failure.
> 
> Also will I'm here, avoid drm_* prefix in Xe code. So...
> 
> s/drm_xe_madvise_args_are_sane/madvise_args_are_sane

Sure. Assuming the incorrect value from user should always be -EINVAL, 
making it return bool and return EINVAL at caller sounds ok.

> 
> Matt
> 
>> Shuicheng
>>
>>> +
>>> +	down_write(&vm->lock);
>>> +
>>> +	if (XE_IOCTL_DBG(xe, xe_vm_is_closed_or_banned(vm))) {
>>> +		err = -ENOENT;
>>> +		goto unlock_vm;
>>> +	}
>>> +
>>> +	xe_vm_alloc_madvise_vma(vm, args->start, args->range);
>>> +
>>> +	struct xe_vmas_in_madvise_range madvise_range = {.addr = args->start,
>>> +							 .range =  args-
>>>> range, };
>>> +	err = get_vmas(vm, &madvise_range);
>>> +	if (err || !madvise_range.num_vmas)
>>> +		goto unlock_vm;
>>> +
>>> +	if (madvise_range.has_bo_vmas) {
>>> +		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>>> +		drm_exec_until_all_locked(&exec) {
>>> +			for (int i = 0; i < madvise_range.num_vmas; i++) {
>>> +				bo = xe_vma_bo(madvise_range.vmas[i]);
>>> +				if (!bo)
>>> +					continue;
>>> +				err = drm_exec_lock_obj(&exec, &bo-
>>>> ttm.base);
>>> +				drm_exec_retry_on_contention(&exec);
>>> +				if (err)
>>> +					goto err_fini;
>>> +			}
>>> +		}
>>> +	}
>>> +
>>> +	if (madvise_range.has_userptr_vmas)
>>> +		down_read(&vm->userptr.notifier_lock);
>>> +
>>> +	if (madvise_range.has_svm_vmas)
>>> +		xe_svm_notifier_lock(vm);
>>> +
>>> +	attr_type = array_index_nospec(args->type,
>>> ARRAY_SIZE(madvise_funcs));
>>> +	madvise_funcs[attr_type](xe, vm, madvise_range.vmas,
>>> +madvise_range.num_vmas, args);
>>> +
>>> +	kfree(madvise_range.vmas);
>>> +	madvise_range.vmas = NULL;
>>> +
>>> +	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start +
>>> +args->range);
>>> +
>>> +	if (madvise_range.has_svm_vmas)
>>> +		xe_svm_notifier_unlock(vm);
>>> +
>>> +	if (madvise_range.has_userptr_vmas)
>>> +		up_read(&vm->userptr.notifier_lock);
>>> +err_fini:
>>> +	if (madvise_range.has_bo_vmas)
>>> +		drm_exec_fini(&exec);
>>> +unlock_vm:
>>> +	up_write(&vm->lock);
>>> +	xe_vm_put(vm);
>>> +	return err;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> new file mode 100644
>>> index 000000000000..b0e1fc445f23
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.h
>>> @@ -0,0 +1,15 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _XE_VM_MADVISE_H_
>>> +#define _XE_VM_MADVISE_H_
>>> +
>>> +struct drm_device;
>>> +struct drm_file;
>>> +
>>> +int xe_vm_madvise_ioctl(struct drm_device *dev, void *data,
>>> +			struct drm_file *file);
>>> +
>>> +#endif
>>> --
>>> 2.34.1
>>


