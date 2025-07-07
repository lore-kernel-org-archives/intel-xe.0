Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70951C83F07
	for <intel-xe@archiver.kernel.org>; Mon,  7 Jul 2025 14:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345C310E4CA;
	Mon,  7 Jul 2025 14:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0ijWbB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E52310E4C1
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Jul 2025 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751900234; x=1783436234;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=JPktQqqRhgkU8k+bcdhLowuMMco+Ca4Z+5jBHrgK+wk=;
 b=c0ijWbB7erfzoW8EMhAbvEGf/1eDsNCMzYnILQ20SEuU11UXgy+/Wo1D
 qyck+8E9g9nAGMgxGLhe8UKJYmSnElxaju8tCugdlMdB40tqeZ9GNW0I+
 TRXjGFoaDLfrol0iUJuIJ7wvzyAWmYucy2h8zdGDkhnXAHnc/iJwjYGHy
 Ja/TBNTaM/eQifxNSjjNP/WryR/VPhtZu2GWdEqmnqOsd9Lq2bvl+XtSM
 C2iMiDqO4H+gdyvthYc37Lnjz1W2i17OqSFfy2HvBHxBBYDjB+N1j/2TT
 3ckP3oShyBRQrOJd/I0coxZY2ILlL/TM6+7Sul1yGAQqUYgvYxIVw4NWf g==;
X-CSE-ConnectionGUID: vQLId9W4Qhm8ZzoVTHltqg==
X-CSE-MsgGUID: BpCTfSGzSiiiu/L3U+aJeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="41746971"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="41746971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:57:02 -0700
X-CSE-ConnectionGUID: 0ORAVNl7QQSkOw2UknesKw==
X-CSE-MsgGUID: 1OVG/CJ6SxGsqvHuamn1jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="159775907"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 07:57:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:57:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 07:57:00 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 07:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAC8TBz7vQo7dCLPoSRs9X9oDSyTsoLbcuwCKW0YyECnfBRbvpoX9Aky85RIFxGgOaTR5ai+4tfBNgZaJxZj2MohxG7tqUggaMa6DkGSKJ8Q97OIyQk0rE8knyJli7VQaEsUsyRDXuVnlX8IukTaObOoZXcXZ2KGyLBwgpRpCPQzpiwhg0Wmoe92SkSQjfYTqC2eG3yDaFtMjYnk1Wukiw5fo9qEOKtXom4PAcKxMCUdCuiG+B7kXAyvIqc8+UJYTBEQOUQnHH1CLOrEik8uRELQ87roSQDITCzSPyzckjWEENL5su+R3W49HMcPbrNEc8jIZKYWePvxP9vJ8b5SKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpOvfH2nhSFKhpjBe2UZFiDpb4DSktRTqOQTUUGf7eU=;
 b=scFRxRmyj/ZvXFJc0XiYALZgFSTFn5PiA4vQJWKraxQMhtEs5283TmC0z7mZIkoyhEJk1ICJC9FGpTl/BaqXGi9OSNaS2oCvEceaJMk6I8G2NpZ86BNe6YZhHaZpZKpGcLc+yH0BMcnaKztceeT7afxIyLKkFaUjIg7Wn8362Q2mbi/X3Y0C4TL5DujAlZX0YvHYmlHQhbi+nV6LAQX8/UuPdkAhwCkK7BGHT4HkWdY58/ZVsrZD1vBv62h6h3NAZn6qmzWGqUR222cb4xmtwoyhyW98HYn77jssItBM00W/XwzLRhUSBiSZZWnAaBVl5DSC4J4w1qzrp80cV/qd1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7417.namprd11.prod.outlook.com (2603:10b6:806:345::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Mon, 7 Jul
 2025 14:56:17 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 7 Jul 2025
 14:56:16 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v9 0/4] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Mon, 7 Jul 2025 16:56:05 +0200
Message-ID: <20250707145609.3857467-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d05732-78fa-4206-14ae-08ddbd666ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWpoVTFsVEs3ZjVhVXJrRlFMUUV5bXRHTjExZDBRT2Q0djlEcWhSczhpMzVm?=
 =?utf-8?B?WVNpZEFTc1B4cTVwd2NNVFBFNlFOLy9jOU0vSDRrdENWVURSUkpZaWRKR1pw?=
 =?utf-8?B?bGYxZE8vRHJrNVFxRVB4TURmdU9oY0o4WkY1RDIrTGZNYWlkL1o0S2gwYjVY?=
 =?utf-8?B?M1hLR2NOU1UydmJ3SUh5TkxFNFJUckRpUklnVlpCNFpuTk9NM1BiSFpsVzNF?=
 =?utf-8?B?MU5zQXJmS1NKWUp3Z095eFVyU2VmQU5YOTlSY3hvOE9mMTR5d3l5Vmc3aWhF?=
 =?utf-8?B?VDNrajFnVWtqZlplVEtYV2h3NGhMeWJ2Z056QUhVNGpIZUtLUTJ4S0Z2dDFK?=
 =?utf-8?B?TjZLOWN6TzZudlY4WENZdDRERUd2RkJrdC9PU05DZ0U1UXo0VmpQZTFiVDUv?=
 =?utf-8?B?ZlZjUVl0MWszazRncFlleTlFMHFMYjZWUEJSNldnSzZnV3Q3azEyUWh2MWVL?=
 =?utf-8?B?KzNjaWt5YlZTSHZLbXBiRFNLL1NhMkY5UGtRMmtyK0hNZEJ1VnZBNWZSWGhK?=
 =?utf-8?B?WTh6aldFdGs4eG1MdklWNXg2QXl2WnBNaEJsRjZjUmZ5YVYyTjkrb21rUmtx?=
 =?utf-8?B?TTdoL2FNMk9WeXJoTTVPZTJacTZHS094QUI5Q0Z6Uk9iMzVkb0tOWExVQzJU?=
 =?utf-8?B?enZWeGNlV25iTUNnK2hybE5hTkJWRVFGeExranY3YXB1M0xRckd0dXJSVHV6?=
 =?utf-8?B?c0RZeWFobm05OUVxdVNlZnUvd3FnbzNJOUI1VUhCM0cvMGd5WFRjVW0rZ1k0?=
 =?utf-8?B?K2NJUTdyNS81L2R3Q0tmV3ErYWJnQWJ6TVNyY2pGNThLSytsdGN3Um5uMDRX?=
 =?utf-8?B?eU41NHFTYyt2Yk9PVzJ5bUVoVXpKNjdWM1lHeHN3V0Vxb21FazdIMlNuZUJW?=
 =?utf-8?B?a0NPRTg5RWl0V3JhMi9hd0hoNXd3RUdVbUkzQUtDSlVQTEFPZnJDUWNZRkxx?=
 =?utf-8?B?MGZWR2ZoSXJYalJ5M1ZxZ3lFaE9nVVptdjdhK2k2NHppblhaOWlmUXhTZjJO?=
 =?utf-8?B?eGp3TjBsK3ROdWJvdnhHQ25hR091bzgxK00ycWY1ZS9rUzVxb1c3aWlYbmZ0?=
 =?utf-8?B?Titsd3hMR2gvQU9TaC9EdGlXR3RhbGh0QkdkUVdHNmtscUt6QXpzRjM3SlEz?=
 =?utf-8?B?SUNFYndzSS9NUGRMUDNDdzM1V0ZQa2w0d0M4Q2JUWjlYVWkyQXowaDR5SGcx?=
 =?utf-8?B?d2dDTmRPZ3dPb1FPUXdpNDJHQjR6eXFHTWhnUXUyeS90WitNRit3K1NMYzdF?=
 =?utf-8?B?RHh4cW9taUhjNHRiMnlaKzNtckFoQVFtTXgzV3c3MmpPcXk3cllzYytJcGtv?=
 =?utf-8?B?ZXB4U3Jlbk5pTDJ4QUNBNUg5U0JEbUY0YXpxajlPbkY1bjNMeEc4OENvdVNl?=
 =?utf-8?B?dElyNUJyK0EvMHZXMFdLakYzNTlKSmQxdXZ4eU1WYXBBQWJrdUw4d3JHYkIz?=
 =?utf-8?B?dmpsL0JibDdOSlppSU4xUTBSbzRCNXQzZjRtRElXRTNRaTJPbmg5cWRVU0h4?=
 =?utf-8?B?M2JOZCtWY2xFWDBVbE8zeUk2RnMwV09WdE42ditVWU0vQVhMUm9IRTl6UVpE?=
 =?utf-8?B?YVdMbjVxWlVlVHlkNG41ZXhGN1ByMStQYkVNeG9CU1RnbWtMRkRMOEowUGRo?=
 =?utf-8?B?azJ4YlhPVDR1aU0xalYzSlJaeExrR2Zod2YveGU0cm15RS9BRld0QmZLem11?=
 =?utf-8?B?bWxrZUdwWjlpV3dZL2YxaDJqdWhGQ0pYUnlxUkpoVW10RFhacWRSV2tNWG53?=
 =?utf-8?B?Si9kMWVyUm5PakdPSk1uZDM5bzJwd1o4TGpVQVI1TEZ3bXhOSnRnYm0yY1Mw?=
 =?utf-8?B?SjVaWWNxeEZzOUVJbkR4SU5JS3d5MU5IcmYyNDI5QW1iazdEZTJ6U2RUdXAw?=
 =?utf-8?B?dklaK0hVTmM0bU1malBhQ2JhUWltQkhCYVlBL1ZreU41RmY0YWxidHBjeGJs?=
 =?utf-8?Q?tpt9ZnhGKw4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3h4b0Rzb3JVdmdHVHltc09jekJ0bGxwMlVYQkF5cUdsODhueHl3Y2RxRGhN?=
 =?utf-8?B?cFdOYmwvTmdZSkZmVXhHQzg2YURSLytBdndnS2xYUDFFMGc0eDEzM0IxemJj?=
 =?utf-8?B?Q00yVW5OaGtZRElZNlBRamxLZzRnL243bEVMbHFpcVJIYVNCa09RWGNOMUZM?=
 =?utf-8?B?VGh3aUZjTHNkNUtyZzlhY3FXeEcvRTVCUjQzelpKMTJSQVpmb2FCbkZCbG1T?=
 =?utf-8?B?dnlhSVc5dVU0V0dXQUpnL3JDU3k3enVqK0N5T0lIbGlMQWlhcjU0bUJOZmRO?=
 =?utf-8?B?UmsyZWkvZ2xKZWRhcTF5dHQ1UHZ5TnBJRE9uMGhlMjZGdXJNTlB0VXVpUzh3?=
 =?utf-8?B?QVRYbDN0Y1J2bUtORy9sWXViOHd1YlljbTd4cHlTYmZrZTRtY0p0eEN6UHRy?=
 =?utf-8?B?SGVSbUNxZmFjWWZzTE5GTVdHdWZoMlAvYmQxdlk0eDJYeHJGMlhMRGZTN2s5?=
 =?utf-8?B?R2pyNXYvTE5oS1NOckRWcENlbklBbzcxOVlmWXV4Q0RqeWRPNWlUUWFTaC91?=
 =?utf-8?B?dGJ1QlFZUXRJWWM5U2srZnhkVFVFTHlVckY5ZTVuc3c3R2JwYkFDc0VDdEth?=
 =?utf-8?B?NkFIZzh1NkhHeXBybmxvaDJpMGtlTnRyWW5GL0R5MWJVUGVTSUlveGNHbTcy?=
 =?utf-8?B?WWlPWlh3WVE0R3pocUg0MCtYVE5Ua0RiejFpWFpTeU9TZDZpbEhscWZSVlJs?=
 =?utf-8?B?TVNncGdZZGdXSk1HTVl3WmRkSjNxUEdEV3RzQmlPY0ZxbUx3Ui9TRit0RFZK?=
 =?utf-8?B?NUhKQ05sZk15NktMYVI4MEhuUHF2ZG42ektxSjBreDBRY3JkdWg2SW9hMnRH?=
 =?utf-8?B?bTZzQVNHajNNOUZ3eVd6dDUyMDh2ZW9xZ01ySUJPSGl4TkQxVHB1OEZjb3Jm?=
 =?utf-8?B?aTJhU2hCbTZQSDZURWFHQXhzd05KbWd4OENVNUROY1ROUERTM3Mrc0duRnJG?=
 =?utf-8?B?elgvRTE1d1ZTdTVES0EyNnJNMHk5MkowTXBwUXAxRWw4Y2FvSnowRFBTUGNx?=
 =?utf-8?B?ZUNUd0tSRGF2dzdDTTd5eXppenN2SVViWUJzeGlGdTlTM0hKVStUVXhrUU5W?=
 =?utf-8?B?VmVpQjhISm05ekV1Ty95N2R5SDlWT0pubWdEVURVMVlBbDYzSWJuN1FUakoz?=
 =?utf-8?B?TldmSFlIQXN0RjduWmROc1dod1h0eUQ3OWozaEJaUVZEWHpHWGUxNkhxUllz?=
 =?utf-8?B?S0VOTDhjKy9hQkxIejNQcENRaVpGeVIrUG0wb1ozb3B0MS9uejJDcEdSdEJI?=
 =?utf-8?B?YlFKTWR3RWlZUzQ1NEZrSVVqSk5qZi9pN0hyOEtrNGZuTnh2Zm9UanZGSm5o?=
 =?utf-8?B?b3VVbUd3bEw1OHBXdEtyUXhyc1ZJRitsNVdsSTJoeHkrSEN0OW5ISFRlbk5U?=
 =?utf-8?B?dGlMa0RpeTUxUDFvL1BrWUUzdGY5bmw5T0txU1BPSktsTnF0K25ZSlZ2OGFq?=
 =?utf-8?B?dHVNL1daUi9CcUNLVkd2NHZQWHJSYmVKTnRzczVWYkdqQVgwNG81ekZvdi93?=
 =?utf-8?B?ckQ3OEFGTG1WUjdUcTJOcXYrVWZyTnJvbE4rbG04a3pFVWl4Yk1GVzNpR1FX?=
 =?utf-8?B?QUg1Z3JnNGpNMzBSc0JVNzl1aVF1WXN3Z1FhR3o2K0pQWW45NkVxU3J5bHlN?=
 =?utf-8?B?a1BUV0ZudTl5WmswcVhveDJ2cSs3TmFRMU80ZEY2T2xhVFpXQmNpWnUzeW85?=
 =?utf-8?B?alNrK2pHUERkSGdHaUN0MHFiN1JPUTBxZUx5alJOOHBYbEk5bnFkWWVPVHly?=
 =?utf-8?B?QVV5RUVHWjl3Y1BmNFZqLzBobnFlcStBYloxem1veWVVaTV0V293YzFJYXQ0?=
 =?utf-8?B?eDk1bFc3R1BLelJMcm9mc0tQc3ptSmwrdmttWGt3ajdQZ3lPRHIwdHBYNm5m?=
 =?utf-8?B?QVZiZXNyV0M5MXRVM0Zmb0lCbnYxNFVNVVZ2TGYvMUhicDNYUmMyMjQwMk0r?=
 =?utf-8?B?Z3ZaTTVua3lOQTYvMldBdkJFQ0ZXVFN3dFczQjBiRHRkU0lTTW1iZEJ4STkr?=
 =?utf-8?B?b3Ayb1p5amY5ay9yaGpyNlpyb3BqNm9IMThzNGo2Ymo2TFVSTUc4cG5BbEJ1?=
 =?utf-8?B?RkI1dUJxTGR3L0dQVVBYMW94UUVwVncwakhQalhHSEpVOXZyQ28wUEQwUUtQ?=
 =?utf-8?B?RFhWTVh5eXlCaU5BSXFtbVFqUW5yTEdSK2RLV0xmVEtBTmtyWHpnTnNqOEdU?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d05732-78fa-4206-14ae-08ddbd666ca7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 14:56:16.5417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwZ7yt4vm5bA5Mit0RbRm5XbNiG/p/BlOEHoVRhCUS0NjgmRhPdZx8paKaabsUsJJwqZryGmex95+c/ZmRXV+RH8j/2fpHXWa31mQ0u4VQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7417
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.
v4:
- add new patch "Use devm_ioremap_wc for VRAM mapping and drop manual
  unmap" (Matthew)
- add new patch "Move struct xe_vram_region to a dedicated header" (Jani)
- fix null pointer dereference in xe_assert when VRAM region for tile
  hasn't been initialized (Michal)
v5:
- Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v6:
- Fix build if CONFIG_DRM_XE_DISPLAY is enabled
v7:
- rebase after new changes related to SVM
v8:
- rebase
- add a helpers for accessing fields of the xe_vram_region structure in
  patch "drm/xe: Use dynamic allocation for tile and device VRAM region
    structures"
v9:
- rebase

Piotr Piórkowski (4):
  drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Move struct xe_vram_region to a dedicated header
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   3 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  20 ++
 drivers/gpu/drm/xe/xe_device_types.h          |  62 +-----
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  25 ++-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  27 +--
 drivers/gpu/drm/xe/xe_tile.c                  |  58 +++--
 drivers/gpu/drm/xe/xe_tile.h                  |  13 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  22 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 205 +++++++++++++-----
 drivers/gpu/drm/xe/xe_vram.h                  |  11 +
 drivers/gpu/drm/xe/xe_vram_types.h            |  82 +++++++
 21 files changed, 376 insertions(+), 203 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

-- 
2.34.1

