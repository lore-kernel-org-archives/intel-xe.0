Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC5ECA0FF6
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 00:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E5810EB03;
	Fri, 29 Aug 2025 00:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pl+kT2v7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC6C10EB03
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 00:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756425639; x=1787961639;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QLqeKi5xTxkpoOG8u2xvArA5FXiWI8+jGJk+BaoTI6M=;
 b=Pl+kT2v7Vq3Oe1UkxpjroIkApmLruTlZn8a77PZ2KIrrj1EcBQPluKb/
 W/2IQkJo10bsVjfXL4Xv5bBqf3Zu1tzrUEwdg5+42ntlRbEyM8HAu/d0Z
 b5XFRUnLfJKCp1MNjr7oFUsfdigPqLj+JhAaW3JF2WTOxdjTPrBi19Hpp
 2y4LGRo0kdDXOnVGoSMEJkmQNDndeE7L6rRWCFJnAqD5nPdrs1CXNaPGt
 BkkyWtjEqs81APQdf+pE/kaf3/6lpryEbwQszSvr5x2ElAGi7cQcLqnl8
 0yDXv37L9N9wxdY5NaolJKey2LWr//hNjGPwcKKwMffSCIplmjFJHfnR/ Q==;
X-CSE-ConnectionGUID: 5M1F0UeBRzu+lTsFd4XD1A==
X-CSE-MsgGUID: TXiAKbPOQ72da9RgorlnyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58773038"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58773038"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 17:00:36 -0700
X-CSE-ConnectionGUID: hdOEYPlGQVuMt5wpdQUDwQ==
X-CSE-MsgGUID: TungTVf2Rr+oAXW2HcRB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169770051"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 17:00:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 17:00:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 17:00:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 17:00:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oG+cOPH+ZYQtd/QqplZaedjF43bZxldbDq+ys0b6ninQ9tNdif/bo2pmn2+HQmd6lu1rh98B6ZZRoMxijkyxuaRKCsWYrVpow/rYoTvdOOsanXlGpy6n7HbZZ7j796fYBZSmzIgILuxlLdDGnpjLICFzO4gjEZSj1YJAC/PpWTEHC6D4SH/GVTlPvDRu3TGxUHHN+1sNnN/aoXEe9TcXgd4NWaWpcpWRM48yaZ+xSu2LZ8kHC3K3zpJZo/rExWsunk8rawK09UzSpSUb8BT64BuhK4qPM98xUl2ZugdSteTlv0jaNJ9K9ZCxOktODL+S+KDSmX7RvpmsZsfJWnsizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLMXrjsp9bZLgKe231Ke76l7j0ZyjDZ67r5hFkSWGq8=;
 b=m6gRXKG1PX70g+B4YjMVITC6txXCFfSTFyzr3v9rMJgYtUUCXDHCz5WLpah+I2JOMmaZP79cbK4T2/NgJAha+DsesFz6FLv6POSMZPmgne1CP1RbvdJqhZeNrl6C80Qjo+ZJPgjEEV+0+zW+sQ/yBuaPMlcZFlrXP4hpgZwgbvi/PV4dZqaXdp+4EUVpYYmh80rZ6Y5ltT5BGLJMlkd6cMB3Pqjz1QTllB8fL0V820XYX6sPH85JVt1NqzcvFN8vHf4cDvyEea62gR5bhSLQbaoNdPh9AgBZmwbdFbzQheQpnnbH0OOzFlw/v8ffFJThCj7wSd7AXSnzmpU4f/UvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by CY5PR11MB6161.namprd11.prod.outlook.com (2603:10b6:930:2a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 29 Aug
 2025 00:00:26 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 00:00:26 +0000
Message-ID: <d0da1a9e-b4f9-4885-a5e3-0b03d001d12b@intel.com>
Date: Thu, 28 Aug 2025 20:00:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Update GuC log buffer type value
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
 <658967b09cecdf0f20ad3547d4ab5ed3e016964d.camel@intel.com>
 <0b71e049-bdc7-4ece-a978-26e4f538efc6@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <0b71e049-bdc7-4ece-a978-26e4f538efc6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0304.namprd03.prod.outlook.com
 (2603:10b6:303:dd::9) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|CY5PR11MB6161:EE_
X-MS-Office365-Filtering-Correlation-Id: 027c1c85-023c-4706-7f94-08dde68f0e82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXVYY1owUVlaYlN4MFlOdExDd1NJbFhSMlY1VU15SXVqMFVSNHRRTGY1Y0Qr?=
 =?utf-8?B?bFFYQ3hpZDg2Z3ErVDdZdWFOQ1hIeFNWRmpwckN6WEZhL1JGM0tmMTMvUXpm?=
 =?utf-8?B?MHlhQ21MK1lkUGdwMzQrQ1JTMm9XZld2czhYejhSejkyOVBuTlk2bFNNb3pt?=
 =?utf-8?B?UlczZjdrWGxTM2FycWp6d0g0eHhNVU56NUVGdzM0VUhSNlBtaFhwSUJtKy9R?=
 =?utf-8?B?M3lSTXpEeXNuQVpRbGluQ3lFWC95eCtVUWIyK1R5SGNpKzZYQW5XamlMNEVG?=
 =?utf-8?B?VllxYTNUWjBzWCt2am93NVpHdWdCWkZERUlHaEY1Mm9rN0xUeG9vTVcxcVlp?=
 =?utf-8?B?N2xqNDBVU3RCbjBud2RaUHlXNFpsc1l2MStkTHZOSDdnNlEyOWFuWUxISlZM?=
 =?utf-8?B?Wk1ZTnNzdVRGbjlqZjJNd3pkdVBHbzR1azVsNnpsWnREbXVCR1V0N1hOcGYr?=
 =?utf-8?B?MnBGUDNpbXRsZTYvbFBZbU5jVUZSazgyNXZWY3lqNWE5ckgxT05WbkJXdlZn?=
 =?utf-8?B?bXlSMm9Sb29ZRWsxYXdiMWM3SFp2YmJGMjJNQjRtcG8xMVRLWklJckNEeVhG?=
 =?utf-8?B?SGxaTTZ3RkU5eldkR3NkS2wrbVU3dDlJQ0VKSFlBSHdJbVlDa0tHMk43bkVS?=
 =?utf-8?B?eW5DakEwY05nMVIrZ1NkNy8rcmZOeTBmdURyeFc1OEY4dmFLcVRqQ203VUlV?=
 =?utf-8?B?clpvYUY1cmRCbEhtUWpJbVMwMUJMQ1hncjlVM1QrUVlDMmtkVmd6dm1aVUxG?=
 =?utf-8?B?U3p3MlZCdnFveFZ0b0J2MFk3dG5Jb05RVjJwODA2WnRqYUx3K3prQlBaMmI4?=
 =?utf-8?B?VkVHZ3VBM3dILzkwbk16T00veW1hNzZrMU8ySmxzZE81eTF5UHN0ZXQ0cUls?=
 =?utf-8?B?NWIybXdpMWRLQ09sMDRvbDgxN0xUZ0lYdlgyOW9pWXJ3bFExR1l5VUFjSW5o?=
 =?utf-8?B?YkxlcklOa3NqYkNiYlFZQW9IWnlPMzJkN1ZkK1hVN1dmclFQdTJnUUVQWE9w?=
 =?utf-8?B?ZCsrTFJDTjZNQy9oaVJ5N0taRlFMdytwWTdsUllTNmFIR1dpdHd4V0FTTkhs?=
 =?utf-8?B?dER0blpxSld2RksycHdpOENaKzliWDl1ajBxcXR5cG9hdlgxMkJKbk5IN0NR?=
 =?utf-8?B?UXNuRGQvRlMwWTlnckdmeWQ5ajhOdDkxM1hkYS92bU8vb1VVSzNaZ0tQL2Ry?=
 =?utf-8?B?WFYyODhaTW1Dc0lqNlIzK0RrN3hRYjNsQVpKT0JRV0RnZTM3SWFrY2lUSzBw?=
 =?utf-8?B?KzRtN3c3MUtDVDBJbk5WWDBybUdIQjdSU3hKYXpGeW1pbHdxMEE2SVhIQmk1?=
 =?utf-8?B?b2tBWnluY2FPOFYzRlcwWFZmU2pZWFRoZzc4VGZEZ2I5cjNMUTZiYTc5Y21W?=
 =?utf-8?B?cTB4cUJYVW9jNmViZUMxUGNLYnRzM2RlL0NCbDlLQm5JcExFVGVmQUhpRVNq?=
 =?utf-8?B?SnJINXM1R25JSlBHVVRQczUwZ1p3Z25oemJQc2haMWdFSVFKWUVKOTNBTWd5?=
 =?utf-8?B?am9YUFBTYWVUVFF6U0NCNjEwRloxWmVURzNWemdkY3RrbmMzRW5hb2pmZ042?=
 =?utf-8?B?RVl5Q1daMUdvenArVmRrN3AxMjJWWHJrbjh0ZG1JcW9UUjlVTDg0K3NscDBX?=
 =?utf-8?B?WVhkZTIvTytyZ1lHYnJPSGx3V3VKL04wY0FVV2d3UTMrRXZSY3ZMaVNKdlpR?=
 =?utf-8?B?SFl6aTZndlVxK3VsR3BTSDFYSjV2dlBxV1VSeklJMnRkdkNFVDdEeGZzUXpv?=
 =?utf-8?B?UitQQWtsOU91Zm5ZVTcySmxvWVpoVkxFTHRuYmRZcnExclhySVNpMjBTc2xL?=
 =?utf-8?B?RkQwUkZFM09YUCsrTkFyRjJVc1hvK1lCQklrTlQrTnBqTWhsOVJ5cHVQYmhQ?=
 =?utf-8?B?TEsyN0JqM2Z2TXhDNkNXNzZFQWJObDZrSTF4Sk5WRVdZS3BMUDZkMVk3Mno3?=
 =?utf-8?Q?vVpBlpGYmq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRpRElidlIyUTFrY1BJYk5TbFBjaGtFS2VqaE5ScFhNTVcwcXVmQUh4ZFZN?=
 =?utf-8?B?cjRkL3pVUnAyMVdLcnJLSzhxeHNZQjFMdEVnRjRoY1pIQy9YVU5vN0I4dVhl?=
 =?utf-8?B?QjhLTkErT0cvUGpSV09OUG9WRDZ3OU10eHNKMUt1eFFaSmFNQjQ5ME54ZzYr?=
 =?utf-8?B?N1MraTNNUzFyRDhnQmZuOGQrYjlmU1lCUUIrN05BS2xQMlRpQkRVbUhvN0Rv?=
 =?utf-8?B?cGZkaHFkY1c1cGhCQ21YdFlJeXJIeTEyWEFPRWJVMTFPd3RwNWNNWVdyck4y?=
 =?utf-8?B?bEI3eDdUU2htc2lWdHBrUUc0RFhRdWN0UmNMVkNybU5nNU5FUHQ1aVhWWGtV?=
 =?utf-8?B?NXhRb0RVaTFBUDVvUXVqa2dnUzZQd01leUppTjhjbmhYajJKckh3elhSNVVS?=
 =?utf-8?B?Z0NZbGE5emZRbTBZMUs2NjhuV3ExYzhuY2dQMGxqNm9FeXA2MERKQmx2cEY2?=
 =?utf-8?B?bXNSMWpEbXpwaTFLcVBQd3lUQWw2eVVIdlhHeUtOcWJCQk1PMHU5MkVqcmdH?=
 =?utf-8?B?QkNDSlR0L3FFVWFJQi9wb3pNbFhGcnJ1bE1QRnlHdzhFSGlDQkVraTlPeTA1?=
 =?utf-8?B?Mk5vUloxVUtvK1BoaFBwZVNUSDZFalEyS1NVQi9BSGxCNFBJWnR5UGRReTN2?=
 =?utf-8?B?S1NsKzFyd1RMdU9kZlJQc1ZLYVFZRjlQOWJRK0VJbzgxR21Kd3lEVlBwZTJZ?=
 =?utf-8?B?aGNUUmNkaEtoNWZTQUZYWkhoTEtYclQwOE9GRmNiWHpSMlY1UjZ0WnJKN3ln?=
 =?utf-8?B?VE9paTdCZHNabnRzdjE4UnoyUXpMeE1GMSs2YWRrL0xZRnAxc3pTaHI4Vnd4?=
 =?utf-8?B?MVVaU1BpaHkyWjFNN1ZMa0NIVGFabkVWVG9TeEVXc1dtd3k4c2hNTkpuci9n?=
 =?utf-8?B?bDAyKzMwMnhKS2xkVXpGUmJIZndWMVREc3hjMHJ2NW91amI3NWZLZFVaSWtX?=
 =?utf-8?B?THRiUmpVRjRTUjhYQ0U0V0FPN3dxamtwUkFJRUEySGtRdlJuMEhNUDh4dllZ?=
 =?utf-8?B?YWtzaDZua2hMK1c2SUh5NHFsekMwQmQ3SlNTQVN2QktZRVpMYmd3VWNYbFpr?=
 =?utf-8?B?S1R2ZEtHU2R3SFhBOGEvdWlUTWRwa00yWS9TcWVwZUxoUlkzZHhCaGJ4THZ3?=
 =?utf-8?B?TFZXK1VzQkh4MDNEOTdKVExvM2wwY2xhK3IzK0djcU95Tm12VFBJSWtoSGhj?=
 =?utf-8?B?K1BpZDVPQUJwNHI1RHZ0aVBOUGk4U1p1cU5SMGhDUzFCNXUzVlNwTzA1Zzgr?=
 =?utf-8?B?MGJ5cUlLd3E5MkxKWHQxczFqb1Z2SE11L0QxUVRnUWVoMW9GNXpPNWU2Tm1k?=
 =?utf-8?B?ZDF5VTZXbm5DbHE4bUZzQnlvS3grYXZnMkRyTElUOEpWS1J4UGkxZUk4cHdF?=
 =?utf-8?B?YnkzSEJRREY2UUV1YzFnNFAxZWkwelZNL1VuUlNOUHphS0UySmF6Y0ZOMkdG?=
 =?utf-8?B?ai9aRk1yaVhCN1BRNFA4TnYzNEJ2YzBVMWZ3amErQmsvdFZmOHVyajlzSjlB?=
 =?utf-8?B?SEppMHJ0bnNwMUVDS0Y3ZjlOUUtCNVRBTjVaYjgveklFcDRIZEFncmRONU5q?=
 =?utf-8?B?Wm5HTExGQUZXb1BoN3p0STNndEgyUUVoRWRaNTN4bVIzdFRiVFBJVmJBZmFw?=
 =?utf-8?B?S1hiSncvdVV0TTA1a1VUdUNvYVJ1cS9CUkJISXFqVXZEVXRIMDI5WURwMlhL?=
 =?utf-8?B?eEN0cnlSUkpGNlRPNDh4NEl3TlhPUmV0QWNFK2UrWmFwUCt0cUNXdktCcWVh?=
 =?utf-8?B?WFh2QXNYNmhWVjJUQ2Y5aVJoM0IrcXd2c29FUjhvZWxsYndJc2hPOG8xc1FO?=
 =?utf-8?B?RjB5cGcwS01uT1JILzJBSHVsdUZrSzdFUktYaDExUFBlV0RUVDNndzJETVBp?=
 =?utf-8?B?emZFZ3p4N3VNU2lBOXp4aGQ1OFI5RVAvaUpsZURTRitZMVQ4d1dMcmZPRmd2?=
 =?utf-8?B?alJ6UWE4cFpUTFN0LzNjcUVzS3NNMlRITWQ2ZTBjMTk0WTRidU1ZVlErK2NQ?=
 =?utf-8?B?WHV5cHU1L1cyMTJFL0l3ZVJXMDBaZ3BzS2wvUGpUb2FtM2E5WkZmcDVMeVRr?=
 =?utf-8?B?elFFako0ZmY4SkpTYUVZOXBuVEZiMTd6aHZCaHJqZXFjekxvcldLWHhNUmZT?=
 =?utf-8?B?dm9JS0VVck84aTRIUXIvcnl1dDdCSGNCVkdrc2tmK1ZFYWhGdjA1enJOV0hi?=
 =?utf-8?B?bUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 027c1c85-023c-4706-7f94-08dde68f0e82
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 00:00:25.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcaLcAMB+ic/SU1FNl0fN7qUc4GoyYEQdDfZPdsv9pmq/X0F2UNTjHOVtXkaSS3iB0QZr7+4zMhO71U2H5+HzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6161
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



On 2025-08-28 5:49 p.m., Michal Wajdeczko wrote:
> 
> 
> On 8/28/2025 8:59 PM, Summers, Stuart wrote:
>> On Wed, 2025-08-27 at 17:52 -0400, Zhanjun Dong wrote:
>>> Update GuC log buffer type value, make buffer types equal to
>>> guc_log_buffer_type in intel_guc_fwif.h.
>>
>> This is just to maintain consistency with i915? Can you add in the
>> commit message that intel_guc_fwif.h is in the i915 driver?
> 
> hmm, but looks like a FW definition (it's part of the ABI headers)
> so IMO better reasoning should be:
> 
> "to align with the GuC ABI specification"
> 
>>
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>>>   drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> index 554630b7ccd9..b1819679fa35 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>>> @@ -10,8 +10,8 @@
>>>   
>>>   /* GuC logging buffer types */
>>>   enum guc_log_buffer_type {
>>> -       GUC_LOG_BUFFER_CRASH_DUMP,
>>>          GUC_LOG_BUFFER_DEBUG,
>>> +       GUC_LOG_BUFFER_CRASH_DUMP,
>>>          GUC_LOG_BUFFER_CAPTURE,
>>
>> Can you move GUC_LOG_BUFFER_TYPE_MAX in here as the last enum also to
>> align with i915?
> 
> GuC spec does not specify MAX
> 
> it's our implementation helper (so shouldn't be part of ABI)
> 
>>
>>>   };
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c
>>> b/drivers/gpu/drm/xe/xe_guc_log.c
>>> index c01ccb35dc75..470c83ead543 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>> @@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct
>>> xe_guc_log *log, enum guc_log_buffer_typ
>>>          enum guc_log_buffer_type i;
>>>          u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>>   
>>> -       for (i = GUC_LOG_BUFFER_CRASH_DUMP; i <
>>> GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>> +       for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>>
>> I see that i915 is going from i = GUC_LOG_BUFFER_DEBUG and not from 0.
>> Should we do that here too?
> 
> actually if "i" was defined as "enum" then we shouldn't use 0
> nor TYPE_MAX (since it is also not part of the enum)
Sure, will avoid to use 0, to be changed to GUC_LOG_BUFFER_DEBUG>
> maybe the implementation should look like:
> 
> 	offset = SZ_4K; // don't use PAGE_SIZE!
> 
> 	switch (type) {
> 	case GUC_LOG_BUFFER_CAPTURE:
> 		offset += xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_CRASH_DUMP);
> 		fallthrough;
> 	case GUC_LOG_BUFFER_CRASH_DUMP:
> 		offset += xe_guc_get_log_buffer_size(GUC_LOG_BUFFER_DEBUG);
> 		fallthrough;
> 	case GUC_LOG_BUFFER_DEBUG:
> 		break;
> 	}

In spec, layout split into 4 sections:
First is 4K buffer state structure
2nd, General log event
3rd, GuC crash dump
4th, Error state capture
To get the offset for the type, it need to add up offset with previous 
section, the loop is needed.

Regards,
Zhanjun Dong

> 
>>
>> Thanks,
>> Stuart
>>
>>>                  if (i == type)
>>>                          break;
>>>                  offset += xe_guc_get_log_buffer_size(log, i);
>>
> 

