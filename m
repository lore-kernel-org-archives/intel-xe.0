Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A544D2FEF5
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 22:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC31810E5CE;
	Tue, 27 Jan 2026 22:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2+moJc0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073C510E5CD
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 22:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769554194; x=1801090194;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bpeJ2+DJ4Hfs/C9t1VGEz+1UqZs8L3rSyAnZsWnlYrA=;
 b=D2+moJc0Er0GY6xfrOaYPsvNtXoAmUnldsiHB/sXdy66zNZdUROLo76C
 qHU4IuLQAiMlqu/VcFjQwLFgExvfiXA2VGv0xby7sFV52tyqtJYkbhwgg
 Hma/QMLH0mFZ7E/nrHZ5Fv6bwfiWJ+36zafdUVyc1L03qS/LJdshrghZD
 LklJLx4W4J13Y6fYC49yWBjd4SyFag2MvVyY+mWC5fhVpTX8w6vf1juYv
 A57Fx91PldDdNT1Ue/PBT0NrZL2W6yclm+YfKY8/c29OR5Nfd+zzI0Lg7
 robvyuQOUqGkLammTeG8p9tmpmvRtKKlyakxQ6uA5MrjWftde7b3f3sdv A==;
X-CSE-ConnectionGUID: lQ9FnI5OT8ukVYvq1JM+iw==
X-CSE-MsgGUID: 0imggntPT3WMvS5q7ezuKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70927945"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70927945"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 14:49:53 -0800
X-CSE-ConnectionGUID: LtPzfj3sSL6dMv2pfFJGfA==
X-CSE-MsgGUID: g8ivaMbkTgmNXktok/cdSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208547641"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 14:49:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 14:49:52 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 14:49:52 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 14:49:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFJVlRH8H8x+BjaI0LcxISGobObvyLGun7y0T5skWU5HX+VVzs2WuJxRPL9HVm4LufpYiHLYiOo4kvm+XlQvfnfFN2m3cgS+VdbKNfwGgbxaSG9xeK3DeBdqf5v1b45VQcna6PjQ5SnWUYyBUc6IzeXYo0AIeEj/MjE/WHhoa7GAmAWytClZKVPfZHrFsKdW6w7ibLRQ7fo7Gnb0samZaX/C/sd9xcmKdPgeALdvv+dxKzzCeMQzdVOKromrbWtTircefc4KdNx3xOkiye/SRQNyrmBKKmH42AsUXUGarIzgix2a7glxmjN1ZCy8eBFen3O8fii/0lKs0o8r8sb8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrcRiZ5Kl0M7QpuV3pPB0TpLtlHUe1mCpoNjUhUEWt8=;
 b=DS/lInkLMATAwXAz95mEweE3qLor+DYRPc/cMaSjnOpic4rqGncT2VrMxfQgL4NionrwpwWiM7Pc7XqwjBBtLL+QTYmiCzaoU7HMRs+DQD94oB90edIzV2IJYiOoov5G5NvOg1LBawjZtihCo3NMFM5AcpWVBiyFdnWvZuWggma1GSpTdUkTp6YcvV+5KZMDQlMH4GKEFxTymEfFR7/xuseYKY5GdgKmvxTsgGBFAzeXHW4HFLOzpne97T6+VGpp/Zl5Be3Ho3sygQPnfApVeCLAhpknE7tBEsA/EaAV38nFvGurqf1XQdXq4lg267KxyzIORDXo/VLi33tguWUbSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Tue, 27 Jan
 2026 22:49:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 22:49:49 +0000
Message-ID: <6e33c2a8-f50e-4c6f-a495-33447f89c29f@intel.com>
Date: Tue, 27 Jan 2026 23:49:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260122100613.3631582-12-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0117.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: ed57a991-58ae-4dc8-f181-08de5df66090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azI1MDZHc25McUc4MGFGa3d2bUthUkpJaXMzRXdhS0hHN3ZmOXBDU1hROFQx?=
 =?utf-8?B?N2JXOUgrc096Z1dlcWNGNmViVDdMcndnTVZ1eEg3S0xuOVY0N1JxVU9KYXB4?=
 =?utf-8?B?dmN0b25kYmgxYW81WXBJbGw4YTRWQ1BNUVJWU1doQy9LWERvUHhKNE1FTGRh?=
 =?utf-8?B?NGxacjZRWHhHTlNFWSs1Q2l3elpIWFlTVFh0ZHBsbDhqd0JSdk50dDFsUytW?=
 =?utf-8?B?ck82MnVzekNxZTNsYkhvQVMvZFo2cTMxREFVNXhXL25yNVB1NmlrbkFDQ1hj?=
 =?utf-8?B?aGc0NFJ6ODdqYnZMT1dlaDlscFJPWTNUWjhDRTJNdHFUZHlybVJRSHNCTGlk?=
 =?utf-8?B?aU1YRUVlV1lEWDNXR3V3dXMvMlhvWGZZdC9BWlFsZUU4alB1aDNzNTdFWXds?=
 =?utf-8?B?TVRpckpXVVBmUzV0V3VncHphOW40R25RZkdZamFYTHNHR0pzVGZTWlhObXNr?=
 =?utf-8?B?SUZTMEttcnJYaUlVWG5SOVJxV2hVL0gwVkY1NCtNQSsyemFZTDR6ZUthaXVu?=
 =?utf-8?B?bEpERHNQTytVM0owWWxaRFZNYWFqamYxWThYeE9NN2ViTEJ1SFlHQXRhK3Rt?=
 =?utf-8?B?NW5QTXM3YkVYMmU1UFlxVlJjRXNiVTByNUdlWmx4aUZXaGdEbDc2Y1lleFZH?=
 =?utf-8?B?N1pvUTNmMFEySE84MW1odEtaRDY4a3dVM2htY1Y0Yzlacjl0OTduZjN4RVNG?=
 =?utf-8?B?TllqUGZUQ3pnbzYxRnR0UDZKVzU1WnFGOWpIc0NxSUZvTXdTZ2puTndrblVT?=
 =?utf-8?B?S3dSOElvakZOMjEwSHlHM0ROcU5WMTRMSWJ3bzMwcisxY2taSVdNVE5tRjE0?=
 =?utf-8?B?V3prTGZUVEE4Zlc1OU4wSnBSRFRtTWQxRW9zNVZhSFF5NEpoZFRMVWg0ZVRi?=
 =?utf-8?B?MmxLYkVkdlcrSFRzYUdyU2FiWU9KcHJqR05kOWxydElvWStNbWRia0NEelYr?=
 =?utf-8?B?ZENVNDJ5MitrY3g5d2NqNm1teEpKSUJuWDVUTXIzNjVRMzV6MHR6TXVXRE5u?=
 =?utf-8?B?OG11VXAzYjE4NGFmZVZOY3VlQ2JEZHhhZ2ZxeXhzdjY4Q0RoZTdMNUNPUlFF?=
 =?utf-8?B?R3hVQjNWQjgxQXFNa0IwbnN1TmcxQnBUNGpUaHVWM29pUUlwNDhBazJ1Ykxu?=
 =?utf-8?B?SDZHRXp1OE52ZjNhMWxBN2JvUkg0d0NHdExDbFRrTjk3UjcvWEFPV2VvYUtB?=
 =?utf-8?B?Vms3YjZkeVoxNTY1WmRKQ3FnMlU3TXo1T1Ric2I2T1pmdnN6Z1JiZDVxRDU0?=
 =?utf-8?B?azl4TjFEOGZ1YjR6dmFiWDNiTm4xcHlnZkVGdkR1TCtpU0JCQ0pPVlNwNGtu?=
 =?utf-8?B?Y2l0Nno1NXM0VHJiQVVGdWhLMlJ4MlRad2dsaFBwZlp6MTRBc2V1SnBRaUxL?=
 =?utf-8?B?Y29kdHNHbURHNVlPbkd4SEppa1laMVZqUnlDZzdmZ29qMEdhLzRqVTR5Y24y?=
 =?utf-8?B?c3lucTBTRWRDZFlWQlN3bFFhWjBZeDAvVmFIMVpQaGhTQmdSTkp5eHdPdzVL?=
 =?utf-8?B?NXNKWG1IeXdmVkViY1kya3hLalhIanNHY0lyR1B5L2VjcWZCcnI0Mnh5US9t?=
 =?utf-8?B?ZFVHcU9icUxZa2J3RU9KUWczZDFOdElhOWNrejJ0Ykpsem1QUFM3NmNKTHIv?=
 =?utf-8?B?ZmJzNjRuNFVTTjZ3REl1bGlWbFI0Zy9JZGJmYnoyZlFGQjZpUzgxTjFOaVJm?=
 =?utf-8?B?Z0VKUDFSMDBPU1BGVEMzR2l6UDJqTCtMdUpUUzl3UjVMQjNndk96Z2xtZE9n?=
 =?utf-8?B?M28zLzJLbXVEd2lvd0JFUGVRVUwveXR4RnRtTHZLQ21qcUQzZHZUUFZVdTU5?=
 =?utf-8?B?K0I3NCtJMmFaL3FnelFWc0tza3crNEluTm5aK080UitPOVYxcjA4eXkrWllE?=
 =?utf-8?B?dWlEN1pBaEJDUEp6ZlRsVDFHVy85MVJldTVkUlRLMlBjYW52dmhVM05mMnlk?=
 =?utf-8?B?YnZEVytFdktTQkRGSXQrWnJWL09OZVdqQWNMUzJOSjJnQ1ZwOGRrVFBiczQ3?=
 =?utf-8?B?aUFVdSthWTQ0ZnRVQ0labjVPZVlib1NoWlpKaTdCNjVxWlBkd1o0aG5rT0JU?=
 =?utf-8?B?WjBGL3VQRjNROWpEeThBVHpKM1VGcmc5OEEyNytUZklLSmlJc1NkSEJ5Qm5B?=
 =?utf-8?Q?/hZc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFRxTDNzUVFURUJUb0lIQy9oWHhFdlFUOTQ2UjJhY0ZUQWhFLytneUhlRE1R?=
 =?utf-8?B?M1QwZkN3WVI2eEFHdjF2b25XUkRXR3NjcytEdkdWMVBtQzhMNmZobHFJeWk0?=
 =?utf-8?B?L0UzODBuazJGN0JaY01LTFRPbDFZd3pxaUlBTnRwZkRzN2RobXJJRFUwTU5H?=
 =?utf-8?B?K1A2Y05QdktoUG92VGxvRWd0eWFDVitMdm1KRndpOHpUYUFKMENFWUYwSWxE?=
 =?utf-8?B?RFF4Z1NuOXcvVEV3aHpiOGNmY0VYdE95d3MvN25jL0Y4WjlkbDZzRkc3dVBa?=
 =?utf-8?B?cFhVRnhjWElVZmNvSEgxUkUzREdBamRoVmZZUWkrRlNUV1ZaZ1pUWnBwTERP?=
 =?utf-8?B?QzZNVjA3UVV5bUVlcE1rWG16THNNZkR6eWZ4ZTJhYnJxN2RqM0RBY3FJVjRk?=
 =?utf-8?B?a3lTbE0xK0NodksxNHZIekppaGd6bHlQT1FHUnJXcERxOXJ1d1g1alRkeEl5?=
 =?utf-8?B?Q1VSZDkzdTlQUXJDSktjK3BQMThkRTMrd2Q1OHFQUzVjZGk0SnNGREp5Zm44?=
 =?utf-8?B?ZXFMa0Qvd1RSRWduUzREQmVlcElvVS8xeDJVa2JvMTBNd0JlMVJNajU4NEhU?=
 =?utf-8?B?MjN5d3poMDFGSmNJMytwZlhvNG5wdndWd2p3T1Y3cHd3YkNTK2FJOVJKelJV?=
 =?utf-8?B?WWs2K3dRY3JVczEyK1U3S2NjUU90TEJKMjFINUN2VEx2MTJyRnVTNWpVSlg4?=
 =?utf-8?B?L2VKK1g1UmViczNPTnl6TTZDSi96R0ZCWXFsbFJaTkRjUGtHVk9JOUdueGYr?=
 =?utf-8?B?RndKS3FjODFEWDd1ZkVRSzZqNzZGKzJOcFV5TWhNWjV2NWVEOS9VY2hEeG43?=
 =?utf-8?B?YTRnZ1J2dWxOWk5JWm1pcjZmWU1KUHUvOVZCNjBHZnZ4RmI4Qlh1OURtTHo0?=
 =?utf-8?B?d1NIS01LVUJlaEVXNzRYeVhnbkNoS1hrNThhS0pVcHpMOXhsK2Vtd1JkMDBu?=
 =?utf-8?B?ZUVlZGxPWVRiNmR2MHdDSmYxWjkwc2EweE9IQ0ZUK3ZOajJJNVhZdEZ2N0FU?=
 =?utf-8?B?dzBXVkF5VTFzNjJ1KzFmT25pelAwMmxXYXhqZTFUVDcrLzI5SWlpa0w4amJj?=
 =?utf-8?B?a3o4R1NwZm9kSm02ZVJuRUlHMGhCbG5jVW05MzZydTU0UkxyclM2WFdHdTYr?=
 =?utf-8?B?Zm1jVmlQbWJkQ09xVFJ0TVpBYXpJRy83OE9HT2JDcVNDWUlVTkVJVGxMYkZz?=
 =?utf-8?B?aHBDZ3N6TjFXUWZjT1pEU0N3eHJOTGFaaG9laWdxUHNTckFQeTZTZnoranRQ?=
 =?utf-8?B?Vy9haXo4KzhMUklVVmFoV0VoYndZelRvK0gva0xLY0w1cVY0SVhJdUZXbENW?=
 =?utf-8?B?S0tGUERzNUNaWktHUmRsMnJSQ0hVRkVPandKM0pCU1JENHVRZFB1TzFLbEJ5?=
 =?utf-8?B?alBJcWh1Z3U3aDlKVkUwbUpuZzVFc3FUS1Awekp6ZzFBM1BsRExjN2JXTlhS?=
 =?utf-8?B?VHN4cWlnOUpIZWc3anFPZEpKUjVaS25hL0hZUDRJczFaL1lsaUtBMndsbm9T?=
 =?utf-8?B?SGszUzJBZlZKNjZyS3lmV29abVNraHRaUnN1aVNrc1Z2NGxrOVYxZ3VVZERL?=
 =?utf-8?B?WTVVR0UxbmFHMjFnL2g5MzJpT21EWlNoeDk1MkllNW13Z2ppT2pFa3U2TEc3?=
 =?utf-8?B?Zm1JMGtlczd6eEdCSlRNaVV4YUNDeGVaazduRHVwNXhlTFNsaFNSajl0RUh3?=
 =?utf-8?B?bHFCNzFiVG9CcTJodU52SStRdWM2NWpvc0JzbFg4YXk1QmVKUHhIa09MbSt2?=
 =?utf-8?B?WGx2ZUZKcGFuTGRrckpUcW1hUXNNZE9EWTJmZDVtWFdkczFtOEhvd2M1TUF1?=
 =?utf-8?B?WHIxR2h2UFpwcFJCWGN0eXlGcFRTYkRJVDlIelMwUlpXTWtaWDN4bTFTYnlC?=
 =?utf-8?B?TkZBUXpzTE1BKzBFN0k1K3hoVUVaWXptbkU3TU5WR1IyRUJlRGt2MkJhYm90?=
 =?utf-8?B?WE13MHVxUVdHWks4RFl1MXFoOWNnSmxDRHl0alNZTXhEd0p0am4vUWhKK3Ay?=
 =?utf-8?B?YURuTWk5Mm0zSVhDdXF0Ty9SNUZzalBXM2cyd1hRdGkvbk9lK3RudW82YzlP?=
 =?utf-8?B?YnZseTBiR2pXbmpSR1ByTlFkSVVLcnRScmh5L2VXb2JFMW1jWHdMMit1RW9V?=
 =?utf-8?B?ck5PdnhuY0p4UGRWbkNqNFFTTVJFaDB5ekFCNUpoS1QzTUdvWWg5b3FNYzNR?=
 =?utf-8?B?WjNaaDVaMG1iR1llWjZsRXJ1M0RtVWVuVGtKWVc1aDlvaHJxM3ZvQ0FnUCtu?=
 =?utf-8?B?WVY5NGJiVTN0OGp4SFRrZVNhTGRzQi9MNERkU3FRV1BDenJiUkovLysvTkR5?=
 =?utf-8?B?T1l4Q0RjR1ZqcUJpS3MxNFBRNFoyeHc2WTdxU2JTV01Ic3Z2WTJrVUw4dWR4?=
 =?utf-8?Q?XliRO2iVUxAOXBUc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed57a991-58ae-4dc8-f181-08de5df66090
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:49:49.8359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oAfEp/USusPmtDA5EHMHmevLeh5mJtRhxGS7cUoyorw6DC+z1fDZO6pdY7T1l2vTFWv51C3U8sFsljbNRL5dOQ9iPdBRgaTMuy2IzKy3XzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
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



On 1/22/2026 11:06 AM, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume
> recovery callbacks to handle PCIe Advanced Error Reporting
> (AER) errors.
> 
> For fatal errors, the device is wedged and becomes
> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
> error_detected to request a Secondary Bus Reset (SBR).
> 
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback,
> the device is queried to determine the error cause and attempt
> recovery based on the error type.
> 
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +
>  drivers/gpu/drm/xe/xe_pci.c          |  3 +
>  drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
>  5 files changed, 107 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f6650ec3ab42..5581f2180b5c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>  	xe_page_reclaim.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_error.o \
>  	xe_pci_rebar.o \
>  	xe_pcode.o \
>  	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 58d7d8b2fea3..81480248eeff 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  	return container_of(ttm, struct xe_device, ttm);
>  }
>  
> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->in_recovery);
> +}
> +
> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_recovery, 1);
> +}
> +
> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
> +{
> +	 atomic_set(&xe->in_recovery, 0);
> +}
> +
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
>  int xe_device_probe_early(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 944f909a86ad..2d140463dc5e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -669,6 +669,9 @@ struct xe_device {
>  		bool inconsistent_reset;
>  	} wedged;
>  
> +	/** @in_recovery: Indicates if device is in recovery */
> +	atomic_t in_recovery;
> +
>  	/** @bo_device: Struct to control async free of BOs */
>  	struct xe_bo_dev {
>  		/** @bo_device.async_free: Free worker */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c92cc176f669..e1ee393b7461 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>  };
>  #endif
>  
> +extern const struct pci_error_handlers xe_pci_error_handlers;
> +
>  static struct pci_driver xe_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
> @@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
>  	.remove = xe_pci_remove,
>  	.shutdown = xe_pci_shutdown,
>  	.sriov_configure = xe_pci_sriov_configure,
> +	.err_handler = &xe_pci_error_handlers,
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..a3cc01afa179
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <drm/drm_drv.h>
> +#include <linux/pci.h>

nit: usually all linux includes go first

> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_pci.h"
> +#include "xe_uc.h"
> +
> +static void xe_pci_error_handling(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	xe_device_set_in_recovery(xe);
> +	xe_device_declare_wedged(xe);
> +
> +	pci_disable_device(pdev);
> +}
> +
> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
> +{
> +	dev_err(&pdev->dev, "PCI error detected, state %d\n", state);

nit: you can use pci_err()

> +
> +	switch (state) {
> +	case pci_channel_io_normal:
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +	case pci_channel_io_frozen:
> +		xe_pci_error_handling(pdev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	case pci_channel_io_perm_failure:
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
> +{
> +	dev_err(&pdev->dev, "PCI mmio enabled\n");

s/mmio/MMIO

but should this be still an err level?
hmm, as we just report static result, maybe we can drop it?
there will be already:

	pci_dbg(bridge, "broadcast mmio_enabled message\n");

> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_err(&pdev->dev, "PCI slot reset\n");
> +
> +	pci_restore_state(pdev);
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	/*
> +	 * Secondary Bus Reset wipes out all device memory
> +	 * requiring XE KMD to perform a device removal and reprobe.
> +	 */
> +	pdev->driver->remove(pdev);

what will happen to all devm/drmm resources that previous xe_pci_probe() has allocated?

> +	xe_device_clear_in_recovery(xe);

is it safe to access this xe after calling remove() ?

> +
> +	if (!pdev->driver->probe(pdev, ent))
> +		return PCI_ERS_RESULT_RECOVERED;
> +
> +	return PCI_ERS_RESULT_RECOVERED;

also recovered? maybe this should be PCI_ERS_RESULT_DISCONNECT

> +}
> +
> +static void xe_pci_error_resume(struct pci_dev *pdev)
> +{
> +	dev_info(&pdev->dev, "PCI error resume\n");
> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.error_detected	= xe_pci_error_detected,
> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
> +	.slot_reset	= xe_pci_error_slot_reset,
> +	.resume		= xe_pci_error_resume,
> +};

