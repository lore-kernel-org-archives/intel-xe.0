Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C1210A88EC
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:34:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725B110EBA5;
	Thu, 26 Mar 2026 17:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iAsnBIbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4D310EBA5
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 17:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774546442; x=1806082442;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Z2WJ2WdF/fMOwB6tqctwaBLfhb02OaSvgiBkTHZhyl0=;
 b=iAsnBIbfW2Dp6LOyAJYciQPiE5FSUEleRvkrE/TfrNpcujvQ5eJ3GS8D
 zwjXI6o+U4TdgnwVxD28q5s5SO81xrewpL3c475smTDe5UawTXGHZBoqZ
 09eZiTg5Yu+P6dZNmmdz+U808EJO3BnYHye+9sGuEVzw/1d5L7WyUNX2M
 KLUNpNK/fAh4vZT5kqvBiUECVxNxzJd11QG3oPt8ORsAi/jtOVU3nTny1
 pNKP24ihr/Ykz2qaJOs+1KQakMrsP8X6DMJmt5IvHJnE4QY1u4HoXghcw
 OD1IZYjNo8LTFUghfcbj8k70RQfMzL0nRFAPTW4Z/yScBE+4VDHIYQ1ce w==;
X-CSE-ConnectionGUID: I7H4SmOTSa6/9YCG3F7bdA==
X-CSE-MsgGUID: YFkbf/j1Q6iC2aSCdwp9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="78210586"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="78210586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:33:48 -0700
X-CSE-ConnectionGUID: I/q0+x1aThSMYcUfWj5AcA==
X-CSE-MsgGUID: 3rGlXWdZSZi7o1DuU+602A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="225074849"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:33:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 10:33:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 10:33:47 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 10:33:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmDtAoNUmkU7V91NZzcyTeV4/vPoV8Bq42avC1hrDgtePM6WnNRnzCTAoWZeEKL4xTZiFAWzvJ7oXYTZKUYr5RNURzbypu1DjNy/amfKKIi+z1jyWlzkWjQLWrm1cBqlazGp4EZS3pkXqxKfl2/NwXAz41fkXqX2JvUKj7BE0+evhtO0O+XDY/+UhHBKgHwZ18ilfJQmVHcOUj6h5Agu3riq3YbUK7fxT1XBo51XbSt9qtwF3kZmuU1y/lmplmAUYtpfZukGNAc23xHhBLXLPvKkNx2zUXitbFjvwhH6McA2If6ZWRz60G5zYDnAF8KD5SxIhOOBtL02j0sscUkFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTkT9GhPi7dfANeRFy/qF3NXq3yYPBYB1e+4bQeEan8=;
 b=m2JxLvT1tn/hiYCVtr0ZGS8QXuQHv2EdOWqZXeOdRNLOJV5PvrW/OjCuMJWNCB3QdLcyVsYdYbEzO+EjfSZeqy03FF6uj5u5Xl8eIL60mVfS6EJ6kO2e/EEsFFFtJprHvwUFEY7ZNDqBoZDkl2MIy6jBVHMH1XHsc9X4+F8dEHyyb77pEQL0P9IIyHzjdf+IcVLjyMns1LqT/1sFjiz77XahMbybIgtDlAiomHHWgC5WhUOf2pVrSTm5fzpA0Ojbwpj3RMNL3mH5hRX0l7blQD34aeqSbA+BU60ZtoxbjcXKQU4+1Kwf0yzgQNMwJtQTsHpXlqqLpr79Hr+pA8VEvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ5PPFA0B9CD929.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 17:33:43 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 17:33:43 +0000
Date: Thu, 26 Mar 2026 10:33:41 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v12 4/7] drm/xe/xe_sysctrl: Add System Controller
 initialization support
Message-ID: <acVt9QFp3ujdWHDD@soc-5CG1426VCC.clients.intel.com>
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
 <20260325120030.510480-13-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325120030.510480-13-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW3PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:303:2a::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ5PPFA0B9CD929:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c526be-54c6-4324-7e62-08de8b5dd3a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: saCZzXEp6RtPZpkKw4kbmcaZkMJS3JBrd1B4EaGBMR6FYni908FhcUJ5zbR+asSUKt9Sj/jedMMU9LftHmojBqH6BPHerbsVqCikpPzBd8O2l99hStiYdrWN+q6jZ0rosBXlNuaRgfPx5jkpP98rGsXDEAcc8ndCjTB280VEJhZ0r7aTVBPZLsWPdW0avS/qc1tsqAZqL3CxUa0Q1agPrm9O2KAYsho2F5tHqLzPlcgW2ZlQU1w8sfLDh7nqlWRcHHoKYNDsFOM0J0bDSybRLsQn/XNPa1qEfyKBEtR6QCwxa+gbNaHtaccLDy8p2gr/H/lR3Bsm3AYSC5fTQ9+dqJq71Nr+YVmhxKIW6Ruc9ZAaUss1pHgMD6xrxNz24MMPVpJLuDmZnOn/DETzJPIbBt+BinFOj7T3Zz5lcCVhibt9ZFCBTLlx/Zse+WT7fIpE8OYzVgeLk6IPPh6Skh8bTS59MipfElH9bbRiNPttTKumdDM1/rONeDYBdW5vGcr5qSVtSkznHk0Gpc2cqWRaMjvaQmXxtefjBgYKVmb+WvtIxzd5mEBxUKDFFRDKx9LJyyaFZATex6grOBrbNuHGBtCpTM9ch0ez2mS0Sj9vqTDY5v7oFBH/JgPADFDUM+o0YnmYA7+zcX7a87/NtqS18PX3KJVi9ZWckL9ivp0KfSFhnG2Wnco7L9mcfRkw5CNe2ld2TLShrruiUCk8g190cobjnd3k/Eza0I3h1hjZMPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzFXMlBlbU5BTGFzai9hdXpNQ0hKYThReGNtSkRGeXYzdUdhYmhLTlVHMkNr?=
 =?utf-8?B?dE9CbGF6K3ZjOXVGZFdCK0g4ZjJ4VDh6TnRXWkUwNjNjSzlkVW5Makl5K29I?=
 =?utf-8?B?UDZBVGZ5ekl3QXA3aG1XRUhUcmFmRjVNeEt5TnZCWHJVQS9yeitDcmRJSnVm?=
 =?utf-8?B?ZjB0WCtVQkFuSzdLdDJLMVJ4dFRGc2x2MkQyeHhnV1V1dnpwR2Q4N1RwNzJN?=
 =?utf-8?B?RXhOdEVBdkFXam5mWVlIRSs4ckg4K0M1M09iYm5qdEkwUklCZGNkNGkvWDNr?=
 =?utf-8?B?NC9pQWp3Smsrd1hHTkZ0SmtpNVAzMGVGLzJML1UxRUtabkgvZ25hYUMwTi90?=
 =?utf-8?B?WXJMWnpEQmF3WjFhRjZMNnRGSE53M1Z2aWlkZkVEdlJlY1puUCtmRjlVN0J4?=
 =?utf-8?B?ZklIRXpjTDFiQTJNT3cwekVNU3NIWFE4UkJ2TTRjVjlSdEVMdEU5aHVWYkJ1?=
 =?utf-8?B?a0d6eFh0a2l0ejV3cjVBbFJzdUt5aDJVWGJIT21SNHZNMDM1VnJWNzZyYncx?=
 =?utf-8?B?eXJxdVV1MXFwdW5pcTdTQ1JBUlpNM2NMVnV6V0RiOVNxdTRWS1BIeVRoSUN3?=
 =?utf-8?B?VzluUTgvY3dJZmFQNzhnMkVzSjN4OWNPN0pLOFhEMDBUVU9aWjA5OHpxTG5U?=
 =?utf-8?B?WmFILzZIVmZBcnFuZ3NOTUxuQzF4MUZkMnFTUkhOSStMSjJzWmQ5SVhuM3d4?=
 =?utf-8?B?b0ZRQ3J4RllRTlROTGtFVzltZllUQWhYNVQzZ3hEazQ1ZU1RN3UvRGFsVDRr?=
 =?utf-8?B?OTQrbFluOWNKTFkxOEpHSWdYNkxLWWhRZ3FHbUxzSEhKVS9rOWxMaHcvbEM0?=
 =?utf-8?B?SFF5Q3U2Y2VWTWZWdGJOazNlYmtZY0UxZ3NmZFMwMG8wRTgzaExzNXYwTEJ3?=
 =?utf-8?B?bzJUKytBNWZnakt2NjVOcVVTSHIxZkZwSWxaUGEvVldqemNKQjF5dkYvYWdz?=
 =?utf-8?B?Z1hNWjQwMHBhT3BpRmxpQmVGZmthbVBjQytBZGN4MVVjbVhUVXVqSVJjNmJV?=
 =?utf-8?B?dWsxWU1wWFZLVytERzlqWWFzS0VVNzQ4dzVhOVFQMWkzaHJBQTI2ejV5a0Vs?=
 =?utf-8?B?aStqeXNZUGZWaUdJbVpHZGZ3VTIzanBNWGNLV1l6bGR6aTVvNFpwdEFjYTJC?=
 =?utf-8?B?UWJUYnF5NG0rckVzcStZSmhob2RiZEcxRXF6QmtHZDJxbVR4ZWg5TzlGV3Zs?=
 =?utf-8?B?YXZCbGxIVWs3UmIxYmRmUWkyell0ckhQTWVLMkFFM01nMGhUZUhrUVFBMk9Z?=
 =?utf-8?B?N3pvbllkcjdGVUN4QzBqUDFXckQ2UEQ4V2R4NTR5QWxSY2R5cjBmWnNQdEhB?=
 =?utf-8?B?YU56L0FHeElVVVpSMWNXTGx0SytxTjVJVTE2cWltelQ5Vm92bHlJRnc4enNK?=
 =?utf-8?B?WjJDWkhkaHJHenRUMzE0QU9xSm43MWt6Z21XMXRKOG1wMHhubTFwaVIwZFoz?=
 =?utf-8?B?d25sS1N1R1BIWllSVUdvM2RQbDNaam1VUitwL1RzTlVnSUZpZEUyNWIyTXZL?=
 =?utf-8?B?S1BCdHlVYVlsUVh2YmIwTytSdXZ6UlAybnlUTng0WFh2MkpDeTJpRkQ1dHlP?=
 =?utf-8?B?YWhtMWZYREo2VGVPYlloRmF5VFFQVHF4OWVtc1A0SSsrODRXbkFxNWdSeTVs?=
 =?utf-8?B?T0N4Tjg1Rk1RdkVuOEVEbkg1aStkRk1MMjZLL0dKZGdlbFl0RFF3Q0MxdDUy?=
 =?utf-8?B?YXp4Tk94MFNNUVYxSUJOWmsxbjNDajhMK1ZHaXFydGN2TFFhREhKZ09mUjBk?=
 =?utf-8?B?ZTBSSUtNRWRTUGxYaXVQVWlveTRVcUNVejJIZHY5ZFg1QmVCSkx3Q041YzJN?=
 =?utf-8?B?Sm9mbWJUcnZtblEwVTM5NStLdS9KSGtIU3BzQTNiK2M4dVNMQ25tUjRBMmY5?=
 =?utf-8?B?c0JJTUdkYjcrT1ZYczc1OVdyUlpqaFBrN082Rzc1SnhJdkN6UjFsYXkyR0Vx?=
 =?utf-8?B?emVBMzVQWjJWM3I5VUZzZlFYK2dtcmp6clNxRlRZc2haZkxyTE50clkybTBN?=
 =?utf-8?B?RDIxanZDM0FDTkdpVHo3QzEyT005Zmh2QWprVElkNElEeU44MFhLSTVtc3lu?=
 =?utf-8?B?MXRWaXg1Z0hxZkZXanJwMjh1NDdKS3NIbVliaE14Z2kwajdZaksxWG41Wkxs?=
 =?utf-8?B?TElTeEhPZVROcW1sRVFCbXozVi9sT0gwTW5qRjlFaFVSK2xlbFMxbTRJUzkw?=
 =?utf-8?B?ZlBYL01IMjl3ZVptRmgrbG5SZmpiNjlRM2tWcHpqcWtSTVZ2bm0yUU42d3BW?=
 =?utf-8?B?ZkVBY1ZWQWEwVEdRbEYyRnZWS0plOFFZVjNTYTdCTTF5K0RrTUhhTmVDY014?=
 =?utf-8?B?amEyRlpEMW5obEJkMStyM0xVcTNQRXk3RUkzQXZQeUxuOGFyNUNHL1ZBOGpQ?=
 =?utf-8?Q?NYSIKYn3Z1e90/P03birjWm18xPsJ7zkfYt5W?=
X-Exchange-RoutingPolicyChecked: abOdYQ96s4RT89il4ZZ+Gk8zGuHDS3NUiL7zcMrpU4QTQhY4hQ1tV2rxDmdEFiFdn+v3x9sFWm12bX1EJZuk3DZXr2c0IE+SsXy+CWHqSWKrSGsb5yxPitdLrLZR/gu0TpbLoqvKJDsm8Jv+MOlITywQP0PgAAq1RHj09s9rLyKsbDkH5uopZyZOgXwH8Gwv4EtzgDfB1XcNnt3+LMuyak47NwxUbHD47s8dPiHHisBZfjTpDgtPdd8UlFAE0zmWnQC6D28vCfsSYPNe+UGS4pjrrH8k5gk4oy8t9XDCPJ4FUiFYuKpsfsf34+eyROEz2p7+ulW+joCIE2iigai9Ug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c526be-54c6-4324-7e62-08de8b5dd3a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 17:33:43.4601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: np7gYK7rbIeFb/BIHng8GpKzxk0qG4YoDl+ViaC7yhMZ3zfOZIOAGPOK1c4zovgPuDtOKKwtwm1At8MQIjPm4iMducYyiRe5lXvrUnaapkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA0B9CD929
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

On Wed, Mar 25, 2026 at 05:00:31AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add initialization and cleanup infrastructure for System Controller
>subsystem and integrate it into xe device probe path.
>
>During initialization, platform support is checked via has_sysctrl
>capability flag and the mailbox region is configured through SoC
>remapper interface.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v8: (Matt, Michal, Shuicheng)
>- Fixed include order
>- Added VF check
>- Converted runtime checks to assertions
>- Added sc_to_xe() helper
>- Fixed kernel-doc syntax
>
>v10: (Riana, Anshuman)
>- Updated sysctrl documentation
>- Cleaned up commit message
>- Fixed mutex lifetime management
>---
> drivers/gpu/drm/xe/Makefile     |  1 +
> drivers/gpu/drm/xe/xe_device.c  |  5 ++
> drivers/gpu/drm/xe/xe_sysctrl.c | 82 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
> 4 files changed, 109 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 49de1c22a469..b2d44e7169dd 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
> 	xe_step.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
>+	xe_sysctrl.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
> 	xe_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index c8e91ff464a7..6df85a240f83 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -65,6 +65,7 @@
> #include "xe_survivability_mode.h"
> #include "xe_sriov.h"
> #include "xe_svm.h"
>+#include "xe_sysctrl.h"
> #include "xe_tile.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
>@@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_unregister_display;
>
>+	err = xe_sysctrl_init(xe);
>+	if (err)
>+		goto err_unregister_display;
>+
> 	err = xe_device_sysfs_init(xe);
> 	if (err)
> 		goto err_unregister_display;
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>new file mode 100644
>index 000000000000..fd23f345d8c7
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -0,0 +1,82 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/device.h>
>+#include <linux/mutex.h>
>+
>+#include <drm/drm_managed.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_assert.h"
>+#include "xe_device.h"
>+#include "xe_mmio.h"
>+#include "xe_printk.h"
>+#include "xe_soc_remapper.h"
>+#include "xe_sriov.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_types.h"
>+
>+/**
>+ * DOC: System Controller (sysctrl)
>+ *
>+ * System Controller (sysctrl) is a firmware-managed entity on Intel dGPUs
>+ * responsible for selected low-level platform management functions.
>+ * Communication between driver and System Controller is performed
>+ * via a mailbox interface, enabling command and response exchange.
>+ *
>+ * This module provides initialization and support code for interacting
>+ * with System Controller through the mailbox interface.
>+ */
>+static void sysctrl_fini(void *arg)
>+{
>+	struct xe_device *xe = arg;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>+}
>+
>+/**
>+ * xe_sysctrl_init() - Initialize System Controller subsystem
>+ * @xe: xe device instance
>+ *
>+ * Entry point for System Controller initialization, called from xe_device_probe.
>+ * This function checks platform support and initializes the system controller.
>+ *
>+ * Return: 0 on success, error code on failure
>+ */
>+int xe_sysctrl_init(struct xe_device *xe)
>+{
>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>+	struct xe_sysctrl *sc = &xe->sc;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return 0;
>+
>+	if (IS_SRIOV_VF(xe))
>+		return 0;

If has_sysctrl is set to 0 in xe_info_init for VF, then drop the SRIOV 
check here.

Thanks,
Umesh

>+
>+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
>+	if (ret)
>+		return ret;
>+
>+	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>+	if (!sc->mmio)
>+		return -ENOMEM;
>+
>+	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>+	sc->mmio->adj_offset = SYSCTRL_BASE;
>+	sc->mmio->adj_limit = U32_MAX;
>+
>+	ret = devm_mutex_init(xe->drm.dev, &sc->cmd_lock);
>+	if (ret)
>+		return ret;
>+
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>new file mode 100644
>index 000000000000..d5d8735038ae
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -0,0 +1,21 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_H_
>+#define _XE_SYSCTRL_H_
>+
>+#include <linux/container_of.h>
>+
>+#include "xe_device_types.h"
>+#include "xe_sysctrl_types.h"
>+
>+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>+{
>+	return container_of(sc, struct xe_device, sc);
>+}
>+
>+int xe_sysctrl_init(struct xe_device *xe);
>+
>+#endif
>-- 
>2.43.0
>
