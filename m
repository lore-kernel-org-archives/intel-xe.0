Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20213C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 17:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32BE113C94;
	Wed, 24 Apr 2024 17:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEAJFkoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8F7113C94
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 17:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713978127; x=1745514127;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=V34yMJG5MxkMibwUL08dDkrMlpVPTPZGXv0/KGDisZY=;
 b=ZEAJFkoL2svRS19glkNxLzdLxY05N1uZ7qJorkNCaJ5dMxobN7KwONEO
 Q2w7YST6VRvG2gr6blh4q4ANmNw2emg94/hkoN6YzdDGEADJLgpfqUdyD
 pfK2nfPQPHLXO+3aCiXou8C3RXk1IZsbzfBlDuBBO8oHuS+LFUOVU6vkC
 5aRV3an6ishy2D5S8lMdqkOF5Te38/1x73wBMM7JWjC5ydWNwK+jTae+E
 v+HwOJGmHpErqg/wPMtmWOjFBOO3vnxs12ehxvdPpwXS75zOg9g3K3M40
 c3cijgVlMIZcg0I6FSf9qQWF4m4JvyLs5duyKXhBow8eYN4wfkmZ/M5p1 A==;
X-CSE-ConnectionGUID: L6lRmAHSTZWQPUv5BjljDw==
X-CSE-MsgGUID: Zyge4bWDQxmOG+w0E/Xzaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9790169"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208,217";a="9790169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:02:06 -0700
X-CSE-ConnectionGUID: GvVedEJbSmicZz65F3xZ8A==
X-CSE-MsgGUID: vW7ZjD1ZRriZ9FojUDzv0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208,217";a="29239756"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 10:02:05 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 10:02:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 10:02:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 10:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cw19Zvoztxr6+BSjxjStwGXQe5ie0e62canU2HXYI3aiq9CgHyhSGakQskVKJnwXAzhAWhv+zE0yI4PZ+ZS6IOdw5nPoix2ip8TmPNucNVb10vlwthtrMvOWj8Lka7Qx02FVzdeaxblYqhrzX8w7e/JRrEczUsb55k6qXbLkwwMELKYBemweDwhcq9xDVPPJk+lh1BPNvZzmWMFef06qtZVMl5NXAHFgR/a9C4UQKk3y3QGsKz/MhGY94pdEwTA1oUiE3/M5Ahy3PQvhHglRAGQsYtQGBape0Aw00J6aa3d7GP7r2I2IYP8ppZy4yYd0jIZt0JdCr9cEjoH7+geOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7f0jbCmgHu8WrB0WwpY0eqAwTmws232qwVp6ek9lttg=;
 b=oBKGIdlfgPZvaYhOIgcOsXE7VGQ+hxdWhoGkCJj4YpoMpgPFcwDGmes6vSVQXndypQMDudRVPp2vGCzv56XRxHJ+5w8PXkh5eQYbhS53jsWmEXjr4jVsbqtOhSwGnU1GQN4s79AyHNb1ut4sVx8U+AromoLT94Qigfq2h6q4rF4ttWncAoYNlMUnaLq7I8CnKlDnAqGn/tmhUC6un9mtbVsnRlFUmU2JGMeL0Ct3rCXtBzVo+mrbNwPyMLo5vzoPMYvkFSshaX5IpSMirgYK60LYFTGmn9BRJtg9qXS8/jejLV1KWNu31SHgp82hih1holoY7MMmoTilxXu7yULhwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Wed, 24 Apr
 2024 17:02:02 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 17:02:02 +0000
Content-Type: multipart/alternative;
 boundary="------------0yNyKZStMx05iQiNj30tUP0d"
Message-ID: <668f4543-dab7-4d7f-a2b8-595e5ddad465@intel.com>
Date: Wed, 24 Apr 2024 22:31:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon
 any GPU hang
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Dafna Hirschfeld <dhirschfeld@habana.ai>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Himanshu Somaiya <himanshu.somaiya@intel.com>
References: <20240423221817.1285081-1-rodrigo.vivi@intel.com>
 <20240423221817.1285081-3-rodrigo.vivi@intel.com>
 <05145d94-73f4-4448-9ec7-db9f06f68a07@intel.com> <Zij6Qh1rvGTOG3e6@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Zij6Qh1rvGTOG3e6@intel.com>
X-ClientProxiedBy: PN3PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::23) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 517f21a9-643d-404f-b834-08dc64804310
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEJicWFVUnQvbkVLN2VtRUVJdDFKVDlWM2hYcCtpSGI3TnNwNDFNNmVPdjI1?=
 =?utf-8?B?UUhWenQvNEgrQU00czRpTk1yejY0UE5ZU0t2OUw0L3FRQnlNRnNCMGxRNkNG?=
 =?utf-8?B?RWp5UVo5ek9QVStENStIYm1QeEpwLzVHYjNtYXBtYjJTYmZPSWhrZGZ5a2M1?=
 =?utf-8?B?THZrRCtuTnNibmpoMjBzbjFzVmZtVTBZRXpERzJNWEovU0E1Yys4N1FXVHFZ?=
 =?utf-8?B?WHhIeDlIdFpsbUt0dG43Nkdyd3NqQ2o4RUlNMDV0a1BuNWYxeUErRGxYaWZD?=
 =?utf-8?B?eVJKT1B1YTlxWmZLcGdmTFhKcUI4K1BablJ2c3UwOG5hL1dhVVgrdWhNNStO?=
 =?utf-8?B?VmgwMHlGejlDVzNHV1YrQ1VmLys4K2tNWXhjNEZNS0Q1K2d0UU1JNnhZUnFQ?=
 =?utf-8?B?M0E5RngrckFSbVQyaXNQVFVyZ283UW5TSGhxS25Mc1laK3c5aUFmMzdiaXg5?=
 =?utf-8?B?djI3UGdzdk1qbXNFOFRoa0pqNmlzWGRHRHdodkc2eEhCaGlMaFlYZG5OUHVF?=
 =?utf-8?B?c216alFnREkzNmRTYmJ1Z2NGblBlTUlWd05DdVNka004cHNTTGJhZ1dxVVN2?=
 =?utf-8?B?Wnd0dGZYY1pJYlhIcitNdk5FK0FHd2J5alJwd3JVd0ZSZ1JTKzZVZkNmZnl1?=
 =?utf-8?B?U2w5OWRubWRWQzNiR0NGV28rMWVsc0RJcUFHdldqSEJLclJ5OFVKdjNEMFo0?=
 =?utf-8?B?Q0IvVzNXQjZCaExuYXc4enpOcVBqU08vR3A0UnMxZy9CdlZkNlhNYlhkbXBH?=
 =?utf-8?B?S01rc21Bam1CWDRxQkdhaXRrNGRmTFpYWWFrVS9Ld2VBYVZHY0FtZUsvNkls?=
 =?utf-8?B?TDVpMkp4cEZHMzZ3RDVtRHBHbXRmemJHRUdhRzN2UWhDZDY3bXF1d3YzbnpB?=
 =?utf-8?B?Zy92Z0tKODJ1Sm44Ky85VU5RU1RlMjFscnhMYnJHZTlvS0kvNm45UFd1MXpu?=
 =?utf-8?B?cnF3VTJTcXV0VitZQ1JOOTJCVFVKd1Npc0ZBbEhQODVtZnhGME5KL3ZVK0Nw?=
 =?utf-8?B?eHFPZUxZZHo4eEhicUFDelZRSnpPMTFVRG9oaGkycVNTVGhHQW5DdWlOVU1k?=
 =?utf-8?B?OW55Z0dxM0VhL21kS29lUTc0eWRZSXhreHhZS1E2RWVnMUlwV0FOR3cwSU5v?=
 =?utf-8?B?WkxYRVR4a2NpQVRSbEhiNFp1QVBMRnFOc1A4bitYWWFwdlV5SWgzUlMrZ1Jm?=
 =?utf-8?B?QTNLc3ZJc2N0TDlhUkNwdTZ0TWVsaUJWV3JRcnJmUnpHNnNzVFRWdzlPMFFy?=
 =?utf-8?B?MnhhZmF2RFh2a3VXMGl1K1k2VUZSNjNtWnZ5dm1vaDhpa0J3ejhkRkUxTUE3?=
 =?utf-8?B?Unhna1J4VTI4MUt2R04vaHhHeDNpZHhlUzJTY01nU0gyQWl0NGR4M1NUZzR6?=
 =?utf-8?B?ZUtWNk9ObXAzSTUxbnNpMUErek1vZWpZU1ZZMU9nODJtNFFGcktzN3YrOHo1?=
 =?utf-8?B?cUo0NVJ3UllzOGt0TG12ZXppZ0Q2d0JoZUdLaXhjcXoyTmhzakpYQXJMT1g4?=
 =?utf-8?B?ck1tTlFrNzV4REZvNFd0OFpPMnRZOE9XZHk3MG1Qd2d5VnJCQVBFNmtVSWNu?=
 =?utf-8?B?SU5UdUdEcFJ1blpBV28zWVdCbXkwY3B5USsxNkhFQXpTUk4raUo1bmlhN2xi?=
 =?utf-8?Q?18HGMhxZP+QpZDlFdHn8z5orAsAqgdPSgjf3LkssyMiI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFA5bGkzNGFUTjJTYksyd2JpTXljYTMxdTVZVk4rTnZmb01mbEJaWGZUNFd2?=
 =?utf-8?B?eWdZV2VFc1pLWklLWUk2aFVIYU9LdG51WWo5N0hPT3lSNG1pSjNQREtQbDJx?=
 =?utf-8?B?ZG81WFZZWTNZaStYN2dkQ1FUVG1mT0RQQzJ3MWNBMXMzVVJKUEJQM09teUc2?=
 =?utf-8?B?RHRhcWE5SmEzNFQxU0l0TVNFOFcvSGZMMzFIbTNMMUc3M0IrcVlZTEFVamdP?=
 =?utf-8?B?TkwxaDE5bWNuZjlXanhqeWJXTjNzVld5QVhCcE9EdThybVBtd1NSVnRCb3g3?=
 =?utf-8?B?bTM3RnErUjlTaFAvTkJTNkt4enBpSkdIcVNvT1dqT29NVzNPb3ZwQzBMTTho?=
 =?utf-8?B?ZGpMa1FHbHd2aXl6RHRYWWJYYkYvUEdDdEFadStOMXZFMllsaUpCbkRreVp3?=
 =?utf-8?B?Z210NGJhTjBaSnNHb0NRcVlrMzZmM1VHYXFnRDV5bkVVQ1BKS0xrc3BoRjdJ?=
 =?utf-8?B?NERGbmZ3QmFLNEp5dk9DMkUzTnZCOHQ1QVFZU2RTaUo0VlA5Wkk3aFZyOVZm?=
 =?utf-8?B?am45ajVDa25yRTFZWFFublRsWlluY0NrL3dBVnExL21MWGZzaXV3NFVIMjVO?=
 =?utf-8?B?dVRNZnZKUHR2eGNKRk1OWmVGeTQyTjZsRk54ZVZydFM3NUtKVXVIWDB3V3Rs?=
 =?utf-8?B?emNqcC92cExPLzdDRURWRnRNV2Ura2FoZFFXSVJTMk1BTTlrbnNUQ0dOSzYw?=
 =?utf-8?B?SGRYUTNQemsrTmpoV01jTlgzQjNyVjFXbEg4NDc3YlBWRkNuQ0k3SXZldmF3?=
 =?utf-8?B?ay83ZkRHMDd0QnNBU3ZNUXJjKytSaG9zc3oyd1R5ckFndmpLbzhCUGhZa3Nw?=
 =?utf-8?B?dldDaG1MQnNMZUhoakdLVGEzNGVySEpPTTFVa2R6UHZVaGxVTjF1WmFtVmJw?=
 =?utf-8?B?alJIMDJHTEFaNmN4ZzRpUDZVUkFMZ25EbTh0MnZOZWFESGdUL25FdHVYWXlU?=
 =?utf-8?B?bmpKdjIzdjh4YzNGUWFqL1p1VEdVYmcwSlJ0VGFwdEwvdktJQ2VFUHRkenJ4?=
 =?utf-8?B?QW1TQkpzakgvMnhxTnZQNFVhQmVqZlNYRmpZVUJEUHErSWgxbXVNdzNiNXFo?=
 =?utf-8?B?UkkyMWtVMVROTDBRd0lFUHdaL0IyTlhCbkNDNWxUTWl2czVJWTlHTXZpL3pu?=
 =?utf-8?B?TXpCbStYL28xREtQV05lQjZNcE9QSEhlRExKaEt5a1F4ZEFWOGlmQlNmcmdI?=
 =?utf-8?B?cGNpeTExT2hKMTA4MXdBME1VaDBoRmFHU1dxZ3pGVlRxekpNVnVOWGVKTDkr?=
 =?utf-8?B?azUzOUZkUjREVGVPM011SllMQmpkM1JwNGJSQVh4R0Fsdmp6Unl1TEZISysw?=
 =?utf-8?B?VnFLLzFERjB1cWI3YW55YTc1emcxb29Nam4vVWJNLzlyZktMT0MrQk8vbXI0?=
 =?utf-8?B?RDZjem5Ib0dubnlkK0RueWR4cTU5elN1Z2dTR3QvcElZTU1iTHJlRThWNHNL?=
 =?utf-8?B?UnNKcUVCanRoa1c1WTVnVFhOVnUyVU1WQm5NSWZiVHErNkQ5TTZRSTAxcitK?=
 =?utf-8?B?QXo1UHhFRVVFYVY2N1VaYnFBeHFXa2FRU09ZS3hnNFpuaGJOT1VsNFNXOVBC?=
 =?utf-8?B?MUc0VFBZYjM2K3loRit2YVVJYUZpOXl6L2V0TlIxdGpiNTV5VmxkYlVkNVY2?=
 =?utf-8?B?YklOeUxoZHRWd3EzSGtPOVc3K3BnTnBsUzNTK0w4bjNYdXVnN0k2MlRyY1ND?=
 =?utf-8?B?V0V1alhyYVl4TTVmckt1Mmp6Um5oMVJoSGNzUE5xL21xR3FVVTljVnZTbUNV?=
 =?utf-8?B?UDBEVWlJNnI0NlU5QUhMeHhtQ2NEODRocjE1cUw3V01VdENwMGk5NHE5a0tT?=
 =?utf-8?B?TFBPNng5S1JweXRYZ3pORXQrdWpPVnhiRm1OSEJHZ0FTNEJoQ1JCQkNuU0t1?=
 =?utf-8?B?Sy8rdHNHcjJRcjJQNDBxbWhOZlBSd0duSzJJMEkxVHUvbm9SZGRUMTlMWjVR?=
 =?utf-8?B?T0ZIc3B4Zy9qaHJhSmZoVUZlNVhlNkdrT2xqaHV1RlgxeUtCMXBoNVNLWWpV?=
 =?utf-8?B?Mzh0dVFQU1UyblZJU0N0TkZBMzBVR1V2SVRrMDJWc1E5cEE1aDUyR2VUVXMr?=
 =?utf-8?B?S2VKY1dGT2ZXR3RSRTQyR3htajN1N0YxMld6SUJiWm1DYlBObmVhQ2Y1THBZ?=
 =?utf-8?B?bHlPUEJkZWhBY2d5VmJYQldUa1pvcUZZL0EycUdFbkw0MVZnRW8wdlhXME5Z?=
 =?utf-8?B?bmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 517f21a9-643d-404f-b834-08dc64804310
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 17:02:02.6771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR8XvkHYtWddLhAOQLbC7OlIyPI/gfsLwLu9pWE4FHxMydQ0hEqSJ0MfKtv8rx1w+/2n/FGOxpSFbi2CaTjsTyMUQ8mkIPQaqpdWZZzvSwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

--------------0yNyKZStMx05iQiNj30tUP0d
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 24-04-2024 17:55, Rodrigo Vivi wrote:
> On Wed, Apr 24, 2024 at 08:50:45AM +0530, Ghimiray, Himal Prasad wrote:
>>                                                                                  
>>     Hi Rodrigo,
>>                                                                                  
>>     The debugfs entry introduced in [PATCH 4/4] of the series offers the same
>>     functionality as the modparams provided. Do you perceive any additional
>>     value in using this modparam?
>>                                                                                  
>>     The behavior of loading the module without using modparams and setting
>>     debugfs mode to 2 before executing the workload is identical to loading
>>     the driver module with the modparam xe_modparam.wedged_mode = 2.
> yes, they are.
> But there are situations where the hang could be happening at boot time.



Oh, I get it now! With this explanation,  patch LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> That's what the modparam is for. SV teams wouldn't have a way to debug
> the hangs on boot. But in general the debugfs is enough for most of the
> cases and better because it is per device and not for all devices driven
> by the module.
>
>>                                                                                  
>>     BR
>>                                                                                  
>>     Himal
>>                                                                                  
>>      struct init_funcs {
>>             int (*init)(void);
>>             void (*exit)(void);
>>     diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>>     index b369984f08ec..61a0d28a28c8 100644
>>     --- a/drivers/gpu/drm/xe/xe_module.h
>>     +++ b/drivers/gpu/drm/xe/xe_module.h
>>     @@ -21,6 +21,7 @@ struct xe_modparam {
>>      #ifdef CONFIG_PCI_IOV
>>             unsigned int max_vfs;
>>      #endif
>>     +       int wedged_mode;
>>      };
>>                                                                                  
>>      extern struct xe_modparam xe_modparam;
>>
>> References
>>
>>     Visible links
>>     1.mailto:matthew.brost@intel.com
>>     2.mailto:dhirschfeld@habana.ai
>>     3.mailto:lucas.demarchi@intel.com
>>     4.mailto:alan.previn.teres.alexis@intel.com
>>     5.mailto:himanshu.somaiya@intel.com
>>     6.mailto:lucas.demarchi@intel.com
>>     7.mailto:rodrigo.vivi@intel.com
>>     8.https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n
>>     9.https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n
--------------0yNyKZStMx05iQiNj30tUP0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-04-2024 17:55, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:Zij6Qh1rvGTOG3e6@intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Apr 24, 2024 at 08:50:45AM +0530, Ghimiray, Himal Prasad wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">                                                                                
   Hi Rodrigo,                                                                  
                                                                                
   The debugfs entry introduced in [PATCH 4/4] of the series offers the same    
   functionality as the modparams provided. Do you perceive any additional      
   value in using this modparam?                                                
                                                                                
   The behavior of loading the module without using modparams and setting       
   debugfs mode to 2 before executing the workload is identical to loading      
   the driver module with the modparam xe_modparam.wedged_mode = 2.             
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
yes, they are.
But there are situations where the hang could be happening at boot time.</pre>
    </blockquote>
    <p><br>
    </p>
    <p><br class="Apple-interchange-newline">
      <span style="color: rgb(13, 13, 13); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Oh, I get it now!</span>&nbsp;
      With this explanation,&nbsp; patch LGTM</p>
    <p><span class="reviewed-by" style="box-sizing: border-box;">Reviewed-by:
        Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a></span></p>
    <p></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:Zij6Qh1rvGTOG3e6@intel.com">
      <pre class="moz-quote-pre" wrap="">
That's what the modparam is for. SV teams wouldn't have a way to debug
the hangs on boot. But in general the debugfs is enough for most of the
cases and better because it is per device and not for all devices driven
by the module.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">                                                                                
   BR                                                                           
                                                                                
   Himal                                                                        
                                                                                
    struct init_funcs {                                                         
           int (*init)(void);                                                   
           void (*exit)(void);                                                  
   diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h 
   index b369984f08ec..61a0d28a28c8 100644                                      
   --- a/drivers/gpu/drm/xe/xe_module.h                                         
   +++ b/drivers/gpu/drm/xe/xe_module.h                                         
   @@ -21,6 +21,7 @@ struct xe_modparam {                                       
    #ifdef CONFIG_PCI_IOV                                                       
           unsigned int max_vfs;                                                
    #endif                                                                      
   +       int wedged_mode;                                                     
    };                                                                          
                                                                                
    extern struct xe_modparam xe_modparam;                                      

References

   Visible links
   1. <a class="moz-txt-link-freetext" href="mailto:matthew.brost@intel.com">mailto:matthew.brost@intel.com</a>
   2. <a class="moz-txt-link-freetext" href="mailto:dhirschfeld@habana.ai">mailto:dhirschfeld@habana.ai</a>
   3. <a class="moz-txt-link-freetext" href="mailto:lucas.demarchi@intel.com">mailto:lucas.demarchi@intel.com</a>
   4. <a class="moz-txt-link-freetext" href="mailto:alan.previn.teres.alexis@intel.com">mailto:alan.previn.teres.alexis@intel.com</a>
   5. <a class="moz-txt-link-freetext" href="mailto:himanshu.somaiya@intel.com">mailto:himanshu.somaiya@intel.com</a>
   6. <a class="moz-txt-link-freetext" href="mailto:lucas.demarchi@intel.com">mailto:lucas.demarchi@intel.com</a>
   7. <a class="moz-txt-link-freetext" href="mailto:rodrigo.vivi@intel.com">mailto:rodrigo.vivi@intel.com</a>
   8. <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n">https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n</a>
   9. <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n">https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n</a>
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0yNyKZStMx05iQiNj30tUP0d--
