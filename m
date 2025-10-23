Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BED7CCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 13:08:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC1310E0EA;
	Thu, 23 Oct 2025 13:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CL+ftOP7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574AB10E0EA
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 13:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761224926; x=1792760926;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Tg5zImcrsQ11v8GryqYHV8EtKzKXyu0+1Z78qxY6nk0=;
 b=CL+ftOP7ECqn4zg0M+zcpMya7pX6Kop8EENEw22CdFhNVQUJAgtRL7cy
 huCgzwFOxAmhJtX+/SLhfPXkhrXYzvru9yUSoR7NkS9UA555/nnQV4aqC
 nVmtInqIkA6MKsnYWxC7Vqq1CtpoLHn6GlXkh0I3nj9Dq4wxqWbuo/4s3
 R/oQabw1WKDEVWsFgVLTowH6LXJlThj8Im388ToEA+cOfAYX5OtGd/N8C
 NLMEQS0pOVLUrC6tKXyiYvqplslgw03LJzcDpi9DjvG+NyonNaRATlGXw
 n52KtvYFq7eF1tr8cP5YqZGwbRBqtKoJSABcpvDOlANumG1j+MQTEb0Yp w==;
X-CSE-ConnectionGUID: nx74nO4oTe2jb6o5yp2TgQ==
X-CSE-MsgGUID: 8n19fb51TV6Qn8W4lRLNiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50972114"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="50972114"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:08:46 -0700
X-CSE-ConnectionGUID: nEQusbuFQhqVW0cTKR5fJA==
X-CSE-MsgGUID: ZBGtx3kLTNiz/V22uuTk8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184224072"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 06:08:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:08:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 06:08:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 06:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwmz0Pl8WF8A4EWoMaEvhABxGutlldRZvSW3aGUTIZS5MQMJ8Dx0NnRrUV0VexcVRelNiNF1am7xEl6BaNWj/4M5vY/1lVvzII4vxOQkBPxeYNJJ+Fx4Vhp/TjfNAQBKeivXD1JLhIPjIv8c3bonszrXAmQgJBuqlchgN6KJY19YR/XUMPwVGta6O7Wdz7Ha+M7aR2glGRw+joOBOis2alScLvB9/Y5/LIHsqV4HiiVOH7Xop+UFNrcLqGp8+/qN96/nY4OweGm4Akc6wU6UoHmmc46DO0AaLe4YBimFktCx0zelZxd0mmdebHageASx6PEYMoB8NX4yjhV7wOBZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXKNufx/PQA2aN1rjbZMv8ssebeAgVy/bk1LJoxsl9o=;
 b=NeyQ+ZSyQB0sByZBiILybzKYWFKUCwVN5P2KgXGL2Iwt+7uvj4KP77gstTbwKm38ULZnePlH4k9V5S4QoYmWhGBvBDplEZgI04a+wOedYRAikZkJWF/xqSmWT35HpbY7APubXb0eMi0Lc1DZS86DH1e/0DwLuuD/Nuolnx4epe2jDYvEpnL+TgZDgEUJt3wFE569dVoFU6/EHAMPjWPVEgjU9hrqEQ/DEAjfTiI6CnO+f3lVSCP4wmDfz8+Y85DBHDplYUmXnYCYDkwQ94x7GO5D5o6k9/u0nj8yOlkA85DvjAZF+kMh98oQ7N+MSitDanb8cyxCFIuneLvtCBUGDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:08:41 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:08:40 +0000
Date: Thu, 23 Oct 2025 09:08:38 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Fguc?= =?utf-8?Q?=3A?= Eliminate RPe caching for
 SLPC parameter handling (rev3)
Message-ID: <aPoo1hQrW0p0gAXo@intel.com>
References: <20251016092536.1918086-2-sk.anirban@intel.com>
 <176067641152.24656.11350417770914321658@97596180aaec>
 <cd63843b-3eb8-4bf4-9a77-dff7d9321e06@intel.com>
 <aPlB1OiwPbShKD_X@intel.com>
 <6fe3036d-2de1-44f0-ae1b-a43352fa0116@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fe3036d-2de1-44f0-ae1b-a43352fa0116@intel.com>
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 8396705a-2c82-4762-61ff-08de12354942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXF1NUk4QkxCTHhLQ1E2S0k3bjZZcEgrMy9MeUtabVNDNHphazlGYzVRRDlE?=
 =?utf-8?B?Q214L0pVajAxNDYwK0JJSUJ6K2crbS9BUUF1S3M4anZJdElnbzQwTFNySjFZ?=
 =?utf-8?B?cW5uT0o4UnFjbHcrc1NPZXc2T2cyeXZSRFd1bmNodThrZEd0NXRleXp4MDli?=
 =?utf-8?B?b1UzTXRoa0VPb0FVNjBmQmpuYU01RjRKOVlTUVpETlhBOXlRYXlWUDRPczI5?=
 =?utf-8?B?OGJMNmVuU3VPVU5xbGdLU0Y0dHdzUDZOc2ZLUWh4QnU1cGtuWlREYlAwQVNG?=
 =?utf-8?B?REZETUp5cTFoM0ZzNnYyZWV6bk9KcWVuVE1vRU9VMzRkVGI2L21vT3hLajVr?=
 =?utf-8?B?UUhGM0J6YjJTSmpjTEJ6aUwzT044Z3JLQmdFYlB0b3lqYlhvWm9VUDdpN2xI?=
 =?utf-8?B?aHN6anV6Q2tPTUwyZEFwUlJZZDZNV2trdllYMzhPTklMVkVvMjI4enB0OXQ5?=
 =?utf-8?B?d0JoZzRCenM5aElrcTNTb3dyK0I1YTIzVC9JbVVwUkJadzFiSk1WM3JhU080?=
 =?utf-8?B?bm90R2dxSTFoakZ6OXlQOTYxNU1IdzNYMW5qTnNIZ0FJQ3NNNWdSM004TEpD?=
 =?utf-8?B?K2tBM0lxamJya0ovWGxoMU51bSs0NlJyNXluZVdjdGhld00ramQ4cEhDc0Ez?=
 =?utf-8?B?ZXNsY1J6RWxVdGYxY2Q2dE5BS1gydVFNK1hmU2FvTTN2TGFScnVNY1dUVjVJ?=
 =?utf-8?B?TzJ6ckVPK2VTeDY3YlZNVWl4aVBaeURyZXYwbTI2cWl1UWp1b21TOVlOc21w?=
 =?utf-8?B?cVA5UllMay9aeERIWFlxeWQza0dZRldyZzJXOFlMVGVGOG9mdTFnZHVtbjBq?=
 =?utf-8?B?czRjWnFoakpsZVQ3b3htZnlQd05IYTFxQ2cwOUViUXJYaCtQaHFwRUFSQnY1?=
 =?utf-8?B?dldRMCtCWHpsNXdDalRaV0NVdVlZR0xQeUdEcjl2dXNYVjZYSmFDVTZuaGJT?=
 =?utf-8?B?UmNET29BVmNPOTFGWTdYMEdEZ1ZOVGovM1ZDUGRMSGdWUGVzQzByU2lFUmlS?=
 =?utf-8?B?QXVyelNkS0RVQy9iOW1CZUlDSWhMMnZCSnJId1l6ZDRRS2hFS2VXS0Y5cWQ1?=
 =?utf-8?B?QjVIUWRxc3N3ZVVYeXcrOWpCazFLNzVabzdCZG12QmhzdGdBMXFXYkNtVjBL?=
 =?utf-8?B?d2tvWlZ5VGVKWFJFSUlzVlgzMmF0OHNjV3d1ZklkM09YV2h1WlFKeDg5Z2ZX?=
 =?utf-8?B?anFVeGc0L1ZqMVhsK3FvakZIdlEzUi9zTFpFTFU0YUNud3UxZU85NzZQczd4?=
 =?utf-8?B?Zi81ckczNUJkeU01NHdsR0E5U1NGZ0tVR3UyUHFiSyt5RkZpQmxpSzZmcURs?=
 =?utf-8?B?VVlBTzRQVzJySjk3eHh4VjNMT1ZaT1YvdzltbUxMQzVhQnNhODYyREk3WEtP?=
 =?utf-8?B?bFhrWjhUSWpwUkx0SmIyanBkVjM4bE5sckVBSlQreFZMbXMvSTh0amJVZVdx?=
 =?utf-8?B?T1FMNGdabXFHdEpZNFRVZGZaSGhqNmhvYVczdTlsMmFvYUU3VHoyWEhSU3Bv?=
 =?utf-8?B?NXE1V0F3dElRUkNUdGYyWTBEMkNLRXdabm5rdXpHKzdCa0pPTE9uL1J5Zm5r?=
 =?utf-8?B?YnBCcjRzRnBtbmJkQm9vRzBiTVJBY3ZudVBEaEcrY2J3RmRWbWFjNEYwaHpa?=
 =?utf-8?B?Q1Z4NXdtT3djZW4yVXZGSlFKZGNVOGt2Nm1SQ0Zhazk0QkJ5eGRnZXgvRFUx?=
 =?utf-8?B?d29HQkZYWmlEY2VkbnJMTklWeU1mVW5iK21UcVhOZ1BISkNmdUd4MG4zNUR6?=
 =?utf-8?B?MXFkUFRqUXJzeWlocklWZm5oZHBMVU50ditQYk9MdHQrdnhaT0VKT3FFc0pW?=
 =?utf-8?B?aGhlQkhTWmRUUXFzSnR5VFVhWmhaNU1waFNTUXVPa3N6L0FvUjFuU0dLWmtB?=
 =?utf-8?B?TEdIeC9TaFFVRy9FcXUwNFpma09BSmJ5d2JSWGExR25UVVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEVIWW1IRngzczIzUlR1UmxSWWg5QUFTRk1nNjEyOXRyaVlOTlBiS1RTVkRi?=
 =?utf-8?B?MVdRTVN6QUFIRFlrQW4rdkZmK0pFYlY4bEJYTmQvTDN3aVFyM2x3N1kvV25F?=
 =?utf-8?B?R0lJTGlrajlHc0Z1emJ2eERtZHpVcFZwY0wwVHJPLzRsb2IwVGZNTmpFQ01Q?=
 =?utf-8?B?SDJ6WjAzYUZNQnZTcXVVc2N1cU0rVm1BakZwaTc1L1RmbnhEMVlLV0JyaVF0?=
 =?utf-8?B?YnZZd25aWXRvSWxUTnRCTStmR1QrdWJ2NCtoRk40YXo2K00waXRab0JjOWlx?=
 =?utf-8?B?VWYvcS9wRUlubTJNOE94dXVZV0lDRTIzNElGNDU2ck14dFJjWDlwQ1Q4RjZ5?=
 =?utf-8?B?SzFvU0lWYVlCcjBHTHVBNGswVU1YM2FpbE9jUmtacldWSFpITkNDVm53Q3Ns?=
 =?utf-8?B?RlhTdTZwb3J6bm13VkVxbk1sMjFidTVNY2ZOS3pLcXptODlWUmhhMW84MGFT?=
 =?utf-8?B?bjVhN0dOR3A2OWFVdjczTTNVdkJ5NklsRWdXOFgwbVVnaithdmpRWTJOMW92?=
 =?utf-8?B?OW1tSllYbVpNeTNaazYza2ljWVl0NnJiMEp2b0J0bHN6ZkJxdEJrRkNLQ1FJ?=
 =?utf-8?B?ZGJpNGp3S0pIUUpPdTV4Ylh0eUZHek1PSVNjS2pjUE1CUVFlQ2VlNllLelEv?=
 =?utf-8?B?R1RzY3VRVTFaL1dGWUc5bldlN0hMUC9LM3JhSm5SZDM3aDhnMUhtbk4rTHBt?=
 =?utf-8?B?NmM5VGJmSlVZa1FOa2MranFtdUM0eldvRmp6YUhrc2lnRFEyMko1Tjk0ckx1?=
 =?utf-8?B?cHJaM0gzOXVnWXFrdkdvUk1pNzlTQlBWZGJuRDZwd2lRbnJvbkF1dm80dHNU?=
 =?utf-8?B?NEh3UUVQWGtpbmJnQTZxOHZSSUdWMEZzb1NOOGJ0aUVKRjZiRDBQQmVFRE9C?=
 =?utf-8?B?WlRwL0dCNFNUVnNGMVhWUzdMU01pZldhbGhUZXFwVDNoT2lPSlpoNWxJUE56?=
 =?utf-8?B?ZUNXamRScFdJTFQ5cjlSaVNxK2FQaWkvOU83d1VJbFQ3YVdLN1VFMVNrbm01?=
 =?utf-8?B?cUlMcytLYStqOVAyMzN2eTZJVm5zbU81ZGIrekU2SjBzL2lvZmcrZE0wWUx4?=
 =?utf-8?B?YlBldlQwQm9QeUZWN1VOTHZzdTUwb2twdEFYVSsvUHJZdnNyMTc4SndpZGxD?=
 =?utf-8?B?VnZDSUdjaWwxWll3WStHaDJMeDVOWGhKMlJmWmFrNUEycjJEYVA0V0F4YlVz?=
 =?utf-8?B?OCt1bkxiZGxseU1qeVFid0tUYjRVNUFkMmtLTHE2UHh6cndSVDgvcHFRMnpx?=
 =?utf-8?B?cGFxUDVuMnNPQkNhdjdJWVcxSkJOVHlqK1RraFZha2ovc2U3eEdTaUU2SW5G?=
 =?utf-8?B?MCtnSHAzdG5rajMydHBIUWtzZmpnRFR1L0xmZnhZWk1KbzM1cjNYZnNockhi?=
 =?utf-8?B?aG5FcVU3MnlRUThmUHhaKytPbUIzbHpCcEVoVG90YVVJYXFPSDl2cXVNU0JU?=
 =?utf-8?B?SFF0S2pyTmFjOWUwV3VwekFlaWZkOGtveTYwaVVYZDNUdDU3VXM0MHZZVlN1?=
 =?utf-8?B?dTV2dHExc0JDQjRSMEg1R2NtUEpQeGJvekt6Umg3dzlTQ3ZzU0wzQnA1MVA5?=
 =?utf-8?B?eWprU29sNndZTWt5TzdxdG51WUswTVM2Y0p4V05JZmM5TFVtWEEvM3IwQTh3?=
 =?utf-8?B?Wlk0eEdvMndJMUhveTN2UmRzREEwa2hGemovektjVkdnZStkSkFybnNMd1kr?=
 =?utf-8?B?UXpBZDYwWTNZNFc0UEUwYjFqY0o2YmJROS8xcU9KT0dFRjA4UDh0d0Q5U1cr?=
 =?utf-8?B?Nlk4ZVdjVUxMQkJKc3VxQzdJRDUzV282ZVg4aVo0bkJTdVF2b3picmNZK2Zi?=
 =?utf-8?B?LzQ3R0J0RTlSUTFocElrWmtzdlpyUzZ1UFJZK2Q3OUdwMkx5RXgrV0t2dUQz?=
 =?utf-8?B?TGNPQVR5cXovMUdyY2ZKUldPdjNVbGpnZCtCUWZra01pU0ZzTTNTbm1Icy8w?=
 =?utf-8?B?S00vTTlEcXFrS0hQQkJzRXd4UEtBbUpuUmJ1d1l2eCtWZ0FPYm1NRFRGWWc0?=
 =?utf-8?B?YkF0WWhnUkdJTDVOVkhQK2VnRXlMbVhTb2Nucm9UUzYvR2RSS1A2eENTM1hr?=
 =?utf-8?B?RlRvOUFWdmo4d3VFb3BpUk10bnBERmdCV1liSTYyMDdCWlNXUStzcUtuMW5u?=
 =?utf-8?Q?lqJZMT4mgPCLkZWK2XEUGKtf1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8396705a-2c82-4762-61ff-08de12354942
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:08:40.9022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ryr0k7h8CLn7uj7IVmS5m6U/IwJ31aESnL8Rd8QlPgULQ/t8dMGAmAjHA2ZZdMe6k0mTAybFHLmTvqk0xtlfIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
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

On Thu, Oct 23, 2025 at 11:42:14AM +0530, Anirban, Sk wrote:
> Hi,
> 
> On 23-10-2025 02:13, Rodrigo Vivi wrote:
> > On Wed, Oct 22, 2025 at 05:58:03PM +0530, Anirban, Sk wrote:
> > >     Hi,
> > >     The failures reported here are not related to my changes.
> > I'm sorry, but I'm not convinced here.
> > 
> > 
> > igt@xe_gt_freq@freq_fixed_idle:
> > shard-dg2-set2: PASS -> FAIL
> > 
> > Seems really suspicious.
> > 
> > You are touching the freq behavior and seeing a freq related test to fail.
> > 
> > Please get a DG2 in RIL and run with you patch this multiple times to
> > be really sure that your patch is not causing this.
> > 
> > Thanks,
> > Rodrigo.
> This issue has been observed across multiple Xe builds and has already been
> reported here https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6407.
> Additionally, I have tested the patch locally using the specific test case,
> and no failures were encountered.

hmmm, indeed. Sorry for the noise.

> 
> Thanks,
> Anirban
> > 
> > >     On 17-10-2025 10:16, Patchwork wrote:
> > >     > Patch Details
> > >   Se> es:  drm/xe/guc: Eliminate RPe caching for SLPC parameter handling (rev3)
> > >   UR>      [1]https://patchwork.freedesktop.org/series/155809/
> > >   St> e:   failure
> > >   De> ils: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/index.html
> > >                              CI Bug Log - changes from
> > >     x> 3930-aaaff197c9186f4959c2bcb18035725188b950ed_FULL -> xe-pw-155809v3_FULL
> > >    Summary
> > >     > FAILURE
> > >     > Serious unknown changes coming with xe-pw-155809v3_FULL absolutely need
> > >     > to be
> > >     > verified manually.
> > >     > If you think the reported changes have nothing to do with the changes
> > >     > introduced in xe-pw-155809v3_FULL, please notify your bug team
> > >     > ([3]I915-ci-infra@lists.freedesktop.org) to allow them
> > >     > to document this new failure mode, which will reduce false positives in
> > >     > CI.
> > >    Participating hosts (4 -> 4)
> > >     > No changes in participating hosts
> > >    Possible new issues
> > >     > Here are the unknown changes that may have been introduced in
> > >     > xe-pw-155809v3_FULL:
> > >     >IGT changes
> > >     >  Possible regressions
> > >     >   • igt@xe_gt_freq@freq_fixed_idle:
> > >     >        • shard-dg2-set2: [4]PASS -> [5]FAIL
> > >    New tests
> > >     > New tests have been introduced between
> > >     > xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed_FULL and
> > >     > xe-pw-155809v3_FULL:
> > >     >New IGT tests (31)
> > >     >   • igt@kms_atomic@atomic-plane-damage@pipe-a-dp-2:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.84] s
> > >     >   • igt@kms_invalid_mode@bad-hsync-start@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.00] s
> > >     >   • igt@kms_invalid_mode@bad-hsync-start@pipe-b-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.00] s
> > >     >   • igt@kms_invalid_mode@bad-hsync-start@pipe-c-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.0] s
> > >     >   • igt@kms_invalid_mode@bad-hsync-start@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.0] s
> > >     >   • igt@kms_invalid_mode@bad-vtotal@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.00] s
> > >     >   • igt@kms_invalid_mode@bad-vtotal@pipe-b-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.00] s
> > >     >   • igt@kms_invalid_mode@bad-vtotal@pipe-c-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.0] s
> > >     >   • igt@kms_invalid_mode@bad-vtotal@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.00] s
> > >     >   • igt@kms_sequence@get-forked-busy@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.48] s
> > >     >   • igt@kms_sequence@get-forked-busy@pipe-b-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.46] s
> > >     >   • igt@kms_sequence@get-forked-busy@pipe-c-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.45] s
> > >     >   • igt@kms_sequence@get-forked-busy@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.45] s
> > >     >   • igt@kms_vblank@query-forked-busy-hang@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.44] s
> > >     >   • igt@kms_vblank@query-forked-busy-hang@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.41] s
> > >     >   • igt@kms_vblank@query-forked-busy@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.42] s
> > >     >   • igt@kms_vblank@query-forked-busy@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.41] s
> > >     >   • igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.27] s
> > >     >   • igt@kms_vblank@ts-continuation-idle-hang@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.23] s
> > >     >   • igt@kms_vblank@ts-continuation-idle@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.27] s
> > >     >   • igt@kms_vblank@ts-continuation-idle@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.22] s
> > >     >   • igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.76] s
> > >     >   • igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.72] s
> > >     >   • igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.43] s
> > >     >   • igt@kms_vblank@ts-continuation-modeset@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [0.37] s
> > >     >   • igt@kms_vblank@wait-busy-hang@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.45] s
> > >     >   • igt@kms_vblank@wait-busy-hang@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.42] s
> > >     >   • igt@kms_vblank@wait-busy@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.43] s
> > >     >   • igt@kms_vblank@wait-busy@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.42] s
> > >     >   • igt@kms_vblank@wait-forked-hang@pipe-a-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.33] s
> > >     >   • igt@kms_vblank@wait-forked-hang@pipe-d-dp-4:
> > >     >        • Statuses : 1 pass(s)
> > >     >        • Exec time: [2.29] s
> > >    Known issues
> > >     > Here are the changes found in xe-pw-155809v3_FULL that come from known
> > >     > issues:
> > >     >IGT changes
> > >     >  Issues hit
> > >     >   • igt@intel_hwmon@hwmon-write:
> > >     >        • shard-adlp: NOTRUN -> [6]SKIP ([7]Intel XE#1125 / [8]Intel
> > >     >          XE#5574)
> > >     >   • igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> > >     >        • shard-bmg: NOTRUN -> [9]SKIP ([10]Intel XE#2370)
> > >     >   • igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
> > >     >        • shard-adlp: NOTRUN -> [11]SKIP ([12]Intel XE#607)
> > >     >   • igt@kms_big_fb@4-tiled-addfb-size-overflow:
> > >     >        • shard-adlp: NOTRUN -> [13]SKIP ([14]Intel XE#610)
> > >     >   • igt@kms_big_fb@linear-8bpp-rotate-270:
> > >     >        • shard-dg2-set2: NOTRUN -> [15]SKIP ([16]Intel XE#316) +1 other
> > >     >          test skip
> > >     >   • igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> > >     >        • shard-adlp: NOTRUN -> [17]SKIP ([18]Intel XE#316) +9 other
> > >     >          tests skip
> > >     >   • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
> > >     >        • shard-adlp: NOTRUN -> [19]FAIL ([20]Intel XE#1874)
> > >     >   • igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> > >     >        • shard-adlp: NOTRUN -> [21]DMESG-FAIL ([22]Intel XE#4543) +6
> > >     >          other tests dmesg-fail
> > >     >   • igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
> > >     >        • shard-bmg: NOTRUN -> [23]SKIP ([24]Intel XE#1124) +2 other
> > >     >          tests skip
> > >     >   • igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> > >     >        • shard-dg2-set2: NOTRUN -> [25]SKIP ([26]Intel XE#1124) +2 other
> > >     >          tests skip
> > >     >   • igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> > >     >        • shard-bmg: NOTRUN -> [27]SKIP ([28]Intel XE#607)
> > >     >   • igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
> > >     >        • shard-adlp: NOTRUN -> [29]SKIP ([30]Intel XE#1124) +13 other
> > >     >          tests skip
> > >     >   • igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
> > >     >        • shard-adlp: NOTRUN -> [31]SKIP ([32]Intel XE#367) +4 other
> > >     >          tests skip
> > >     >   • igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> > >     >        • shard-adlp: NOTRUN -> [33]SKIP ([34]Intel XE#2191) +2 other
> > >     >          tests skip
> > >     >   • igt@kms_bw@linear-tiling-2-displays-1920x1080p:
> > >     >        • shard-dg2-set2: NOTRUN -> [35]SKIP ([36]Intel XE#367)
> > >     >   • igt@kms_bw@linear-tiling-3-displays-1920x1080p:
> > >     >        • shard-bmg: NOTRUN -> [37]SKIP ([38]Intel XE#367)
> > >     >   • igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
> > >     >        • shard-bmg: NOTRUN -> [39]SKIP ([40]Intel XE#2887) +1 other test
> > >     >          skip
> > >     >   • igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
> > >     >        • shard-adlp: NOTRUN -> [41]SKIP ([42]Intel XE#455 / [43]Intel
> > >     >          XE#787) +41 other tests skip
> > >     >   • igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> > >     >        • shard-dg2-set2: NOTRUN -> [44]SKIP ([45]Intel XE#2907)
> > >     >   • igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
> > >     >        • shard-adlp: NOTRUN -> [46]SKIP ([47]Intel XE#787) +62 other
> > >     >          tests skip
> > >     >   • igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> > >     >        • shard-adlp: NOTRUN -> [48]SKIP ([49]Intel XE#2907) +1 other
> > >     >          test skip
> > >     >   • igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
> > >     >        • shard-dg2-set2: NOTRUN -> [50]SKIP ([51]Intel XE#455 /
> > >     >          [52]Intel XE#787) +9 other tests skip
> > >     >   • igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
> > >     >        • shard-dg2-set2: NOTRUN -> [53]SKIP ([54]Intel XE#787) +27 other
> > >     >          tests skip
> > >     >   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
> > >     >        • shard-dg2-set2: NOTRUN -> [55]INCOMPLETE ([56]Intel XE#1727 /
> > >     >          [57]Intel XE#2705 / [58]Intel XE#3113 / [59]Intel XE#4212 /
> > >     >          [60]Intel XE#4522)
> > >     >   • igt@kms_cdclk@mode-transition:
> > >     >        • shard-adlp: NOTRUN -> [61]SKIP ([62]Intel XE#4417 / [63]Intel
> > >     >          XE#455)
> > >     >   • igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
> > >     >        • shard-adlp: NOTRUN -> [64]SKIP ([65]Intel XE#4417) +2 other
> > >     >          tests skip
> > >     >   • igt@kms_cdclk@plane-scaling:
> > >     >        • shard-adlp: NOTRUN -> [66]SKIP ([67]Intel XE#4416 / [68]Intel
> > >     >          XE#455)
> > >     >   • igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
> > >     >        • shard-adlp: NOTRUN -> [69]SKIP ([70]Intel XE#4416) +2 other
> > >     >          tests skip
> > >     >   • igt@kms_chamelium_audio@hdmi-audio:
> > >     >        • shard-bmg: NOTRUN -> [71]SKIP ([72]Intel XE#2252) +4 other
> > >     >          tests skip
> > >     >   • igt@kms_chamelium_audio@hdmi-audio-edid:
> > >     >        • shard-adlp: NOTRUN -> [73]SKIP ([74]Intel XE#373) +14 other
> > >     >          tests skip
> > >     >   • igt@kms_chamelium_color@ctm-0-50:
> > >     >        • shard-adlp: NOTRUN -> [75]SKIP ([76]Intel XE#306) +2 other
> > >     >          tests skip
> > >     >   • igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> > >     >        • shard-dg2-set2: NOTRUN -> [77]SKIP ([78]Intel XE#373) +5 other
> > >     >          tests skip
> > >     >   • igt@kms_content_protection@dp-mst-type-0:
> > >     >        • shard-bmg: NOTRUN -> [79]SKIP ([80]Intel XE#2390)
> > >     >   • igt@kms_content_protection@dp-mst-type-1:
> > >     >        • shard-adlp: NOTRUN -> [81]SKIP ([82]Intel XE#307)
> > >     >   • igt@kms_cursor_crc@cursor-offscreen-512x170:
> > >     >        • shard-adlp: NOTRUN -> [83]SKIP ([84]Intel XE#308) +2 other
> > >     >          tests skip
> > >     >   • igt@kms_cursor_crc@cursor-sliding-max-size:
> > >     >        • shard-bmg: NOTRUN -> [85]SKIP ([86]Intel XE#2320) +2 other
> > >     >          tests skip
> > >     >   • igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
> > >     >        • shard-bmg: [87]PASS -> [88]SKIP ([89]Intel XE#2291)
> > >     >   • igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> > >     >        • shard-adlp: NOTRUN -> [90]SKIP ([91]Intel XE#309) +6 other
> > >     >          tests skip
> > >     >   • igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> > >     >        • shard-adlp: NOTRUN -> [92]SKIP ([93]Intel XE#323)
> > >     >   • igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> > >     >        • shard-bmg: NOTRUN -> [94]SKIP ([95]Intel XE#1508)
> > >     >   • igt@kms_display_modes@extended-mode-basic:
> > >     >        • shard-adlp: NOTRUN -> [96]SKIP ([97]Intel XE#4302)
> > >     >   • igt@kms_dp_linktrain_fallback@dp-fallback:
> > >     >        • shard-adlp: NOTRUN -> [98]SKIP ([99]Intel XE#4331)
> > >     >        • shard-bmg: [100]PASS -> [101]SKIP ([102]Intel XE#4294)
> > >     >   • igt@kms_draw_crc@draw-method-blt:
> > >     >        • shard-adlp: [103]PASS -> [104]DMESG-WARN ([105]Intel XE#2953 /
> > >     >          [106]Intel XE#4173) +3 other tests dmesg-warn
> > >     >   • igt@kms_dsc@dsc-with-output-formats:
> > >     >        • shard-bmg: NOTRUN -> [107]SKIP ([108]Intel XE#2244)
> > >     >   • igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> > >     >        • shard-adlp: NOTRUN -> [109]SKIP ([110]Intel XE#4422) +1 other
> > >     >          test skip
> > >     >   • igt@kms_feature_discovery@display-4x:
> > >     >        • shard-adlp: NOTRUN -> [111]SKIP ([112]Intel XE#1138)
> > >     >   • igt@kms_feature_discovery@psr2:
> > >     >        • shard-adlp: NOTRUN -> [113]SKIP ([114]Intel XE#1135)
> > >     >   • igt@kms_flip@2x-nonexisting-fb:
> > >     >        • shard-bmg: [115]PASS -> [116]SKIP ([117]Intel XE#2316) +3 other
> > >     >          tests skip
> > >     >   • igt@kms_flip@2x-nonexisting-fb-interruptible:
> > >     >        • shard-adlp: NOTRUN -> [118]SKIP ([119]Intel XE#310) +11 other
> > >     >          tests skip
> > >     >   • igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
> > >     >        • shard-adlp: NOTRUN -> [120]DMESG-WARN ([121]Intel XE#4543) +7
> > >     >          other tests dmesg-warn
> > >     >   • igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> > >     >        • shard-lnl: [122]PASS -> [123]FAIL ([124]Intel XE#301) +1 other
> > >     >          test fail
> > >     >   • igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
> > >     >        • shard-dg2-set2: [125]PASS -> [126]FAIL ([127]Intel XE#301) +1
> > >     >          other test fail
> > >     >   • igt@kms_flip@flip-vs-panning-interruptible:
> > >     >        • shard-adlp: NOTRUN -> [128]DMESG-WARN ([129]Intel XE#4543 /
> > >     >          [130]Intel XE#5208)
> > >     >   • igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
> > >     >        • shard-adlp: [131]PASS -> [132]DMESG-WARN ([133]Intel XE#4543)
> > >     >          +2 other tests dmesg-warn
> > >     >   • igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
> > >     >        • shard-bmg: NOTRUN -> [134]SKIP ([135]Intel XE#2380) +1 other
> > >     >          test skip
> > >     >   • igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
> > >     >        • shard-bmg: NOTRUN -> [136]SKIP ([137]Intel XE#2293 / [138]Intel
> > >     >          XE#2380)
> > >     >   • igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
> > >     >        • shard-bmg: NOTRUN -> [139]SKIP ([140]Intel XE#2293)
> > >     >   • igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> > >     >        • shard-dg2-set2: NOTRUN -> [141]SKIP ([142]Intel XE#455) +10
> > >     >          other tests skip
> > >     >        • shard-adlp: NOTRUN -> [143]DMESG-FAIL ([144]Intel XE#4543 /
> > >     >          [145]Intel XE#4921) +1 other test dmesg-fail
> > >     >   • igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
> > >     >        • shard-adlp: [146]PASS -> [147]DMESG-FAIL ([148]Intel XE#4543)
> > >     >   • igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
> > >     >        • shard-adlp: NOTRUN -> [149]SKIP ([150]Intel XE#651) +18 other
> > >     >          tests skip
> > >     >   • igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
> > >     >        • shard-dg2-set2: NOTRUN -> [151]SKIP ([152]Intel XE#651) +12
> > >     >          other tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
> > >     >        • shard-dg2-set2: [153]PASS -> [154]INCOMPLETE ([155]Intel
> > >     >          XE#4842)
> > >     >   • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> > >     >        • shard-lnl: NOTRUN -> [156]SKIP ([157]Intel XE#656)
> > >     >   • igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
> > >     >        • shard-bmg: NOTRUN -> [158]SKIP ([159]Intel XE#5390) +4 other
> > >     >          tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
> > >     >        • shard-bmg: NOTRUN -> [160]SKIP ([161]Intel XE#2311) +6 other
> > >     >          tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
> > >     >        • shard-dg2-set2: NOTRUN -> [162]SKIP ([163]Intel XE#653) +13
> > >     >          other tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
> > >     >        • shard-adlp: NOTRUN -> [164]SKIP ([165]Intel XE#653) +18 other
> > >     >          tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
> > >     >        • shard-bmg: NOTRUN -> [166]SKIP ([167]Intel XE#2313) +6 other
> > >     >          tests skip
> > >     >   • igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
> > >     >        • shard-adlp: NOTRUN -> [168]SKIP ([169]Intel XE#656) +51 other
> > >     >          tests skip
> > >     >   • igt@kms_hdr@invalid-hdr:
> > >     >        • shard-bmg: [170]PASS -> [171]SKIP ([172]Intel XE#1503)
> > >     >   • igt@kms_joiner@basic-big-joiner:
> > >     >        • shard-adlp: NOTRUN -> [173]SKIP ([174]Intel XE#346)
> > >     >   • igt@kms_joiner@basic-force-big-joiner:
> > >     >        • shard-adlp: NOTRUN -> [175]SKIP ([176]Intel XE#3012)
> > >     >   • igt@kms_joiner@basic-ultra-joiner:
> > >     >        • shard-adlp: NOTRUN -> [177]SKIP ([178]Intel XE#2927)
> > >     >   • igt@kms_joiner@invalid-modeset-big-joiner:
> > >     >        • shard-dg2-set2: NOTRUN -> [179]SKIP ([180]Intel XE#346)
> > >     >   • igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
> > >     >        • shard-adlp: NOTRUN -> [181]FAIL ([182]Intel XE#5195) +4 other
> > >     >          tests fail
> > >     >   • igt@kms_plane_lowres@tiling-y:
> > >     >        • shard-bmg: NOTRUN -> [183]SKIP ([184]Intel XE#2393)
> > >     >   • igt@kms_plane_multiple@2x-tiling-none:
> > >     >        • shard-adlp: NOTRUN -> [185]SKIP ([186]Intel XE#4596)
> > >     >   • igt@kms_plane_multiple@tiling-yf:
> > >     >        • shard-dg2-set2: NOTRUN -> [187]SKIP ([188]Intel XE#5020)
> > >     >   • igt@kms_plane_scaling@2x-scaler-multi-pipe:
> > >     >        • shard-bmg: [189]PASS -> [190]SKIP ([191]Intel XE#2571)
> > >     >   • igt@kms_pm_backlight@fade:
> > >     >        • shard-adlp: NOTRUN -> [192]SKIP ([193]Intel XE#870)
> > >     >   • igt@kms_pm_dc@dc5-retention-flops:
> > >     >        • shard-adlp: NOTRUN -> [194]SKIP ([195]Intel XE#3309)
> > >     >   • igt@kms_pm_dc@dc9-dpms:
> > >     >        • shard-adlp: NOTRUN -> [196]SKIP ([197]Intel XE#734)
> > >     >   • igt@kms_pm_dc@deep-pkgc:
> > >     >        • shard-adlp: NOTRUN -> [198]SKIP ([199]Intel XE#2007)
> > >     >   • igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> > >     >        • shard-bmg: NOTRUN -> [200]SKIP ([201]Intel XE#1406 / [202]Intel
> > >     >          XE#1489) +3 other tests skip
> > >     >   • igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
> > >     >        • shard-adlp: NOTRUN -> [203]SKIP ([204]Intel XE#1406 /
> > >     >          [205]Intel XE#1489) +12 other tests skip
> > >     >   • igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> > >     >        • shard-dg2-set2: NOTRUN -> [206]SKIP ([207]Intel XE#1406 /
> > >     >          [208]Intel XE#1489) +2 other tests skip
> > >     >   • igt@kms_psr2_su@page_flip-nv12:
> > >     >        • shard-dg2-set2: NOTRUN -> [209]SKIP ([210]Intel XE#1122 /
> > >     >          [211]Intel XE#1406)
> > >     >   • igt@kms_psr@psr-cursor-plane-onoff:
> > >     >        • shard-adlp: NOTRUN -> [212]SKIP ([213]Intel XE#1406 /
> > >     >          [214]Intel XE#2850 / [215]Intel XE#929) +14 other tests skip
> > >     >   • igt@kms_psr@psr-sprite-plane-onoff:
> > >     >        • shard-bmg: NOTRUN -> [216]SKIP ([217]Intel XE#1406 / [218]Intel
> > >     >          XE#2234 / [219]Intel XE#2850) +4 other tests skip
> > >     >   • igt@kms_psr@psr2-sprite-plane-move:
> > >     >        • shard-dg2-set2: NOTRUN -> [220]SKIP ([221]Intel XE#1406 /
> > >     >          [222]Intel XE#2850 / [223]Intel XE#929) +3 other tests skip
> > >     >   • igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> > >     >        • shard-bmg: NOTRUN -> [224]SKIP ([225]Intel XE#3414 / [226]Intel
> > >     >          XE#3904)
> > >     >   • igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
> > >     >        • shard-adlp: NOTRUN -> [227]SKIP ([228]Intel XE#3414)
> > >     >   • igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> > >     >        • shard-adlp: NOTRUN -> [229]SKIP ([230]Intel XE#362)
> > >     >   • igt@kms_vrr@flip-suspend:
> > >     >        • shard-adlp: NOTRUN -> [231]SKIP ([232]Intel XE#455) +33 other
> > >     >          tests skip
> > >     >   • igt@kms_vrr@seamless-rr-switch-drrs:
> > >     >        • shard-bmg: NOTRUN -> [233]SKIP ([234]Intel XE#1499)
> > >     >   • igt@xe_ccs@block-multicopy-compressed:
> > >     >        • shard-adlp: NOTRUN -> [235]SKIP ([236]Intel XE#455 / [237]Intel
> > >     >          XE#488 / [238]Intel XE#5607)
> > >     >   • igt@xe_ccs@large-ctrl-surf-copy:
> > >     >        • shard-adlp: NOTRUN -> [239]SKIP ([240]Intel XE#3576 /
> > >     >          [241]Intel XE#5610)
> > >     >   • igt@xe_compute_preempt@compute-preempt-many:
> > >     >        • shard-adlp: NOTRUN -> [242]SKIP ([243]Intel XE#6360)
> > >     >   • igt@xe_configfs@survivability-mode:
> > >     >        • shard-adlp: NOTRUN -> [244]SKIP ([245]Intel XE#6010)
> > >     >   • igt@xe_copy_basic@mem-copy-linear-0x3fff:
> > >     >        • shard-dg2-set2: NOTRUN -> [246]SKIP ([247]Intel XE#1123)
> > >     >        • shard-adlp: NOTRUN -> [248]SKIP ([249]Intel XE#1123) +1 other
> > >     >          test skip
> > >     >   • igt@xe_copy_basic@mem-set-linear-0x369:
> > >     >        • shard-dg2-set2: NOTRUN -> [250]SKIP ([251]Intel XE#1126)
> > >     >   • igt@xe_eu_stall@invalid-gt-id:
> > >     >        • shard-dg2-set2: NOTRUN -> [252]SKIP ([253]Intel XE#5626)
> > >     >   • igt@xe_eu_stall@non-blocking-re-enable:
> > >     >        • shard-adlp: NOTRUN -> [254]SKIP ([255]Intel XE#5626) +2 other
> > >     >          tests skip
> > >     >   • igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
> > >     >        • shard-bmg: NOTRUN -> [256]SKIP ([257]Intel XE#4837) +2 other
> > >     >          tests skip
> > >     >   • igt@xe_eudebug@basic-vm-bind-discovery:
> > >     >        • shard-lnl: NOTRUN -> [258]SKIP ([259]Intel XE#4837)
> > >     >   • igt@xe_eudebug_online@debugger-reopen:
> > >     >        • shard-dg2-set2: NOTRUN -> [260]SKIP ([261]Intel XE#4837) +2
> > >     >          other tests skip
> > >     >   • igt@xe_eudebug_online@single-step:
> > >     >        • shard-adlp: NOTRUN -> [262]SKIP ([263]Intel XE#4837 /
> > >     >          [264]Intel XE#5565) +18 other tests skip
> > >     >   • igt@xe_evict@evict-beng-large-external-cm:
> > >     >        • shard-adlp: NOTRUN -> [265]SKIP ([266]Intel XE#261 / [267]Intel
> > >     >          XE#5564) +1 other test skip
> > >     >   • igt@xe_evict@evict-beng-threads-small-multi-vm:
> > >     >        • shard-adlp: NOTRUN -> [268]SKIP ([269]Intel XE#261) +5 other
> > >     >          tests skip
> > >     >   • igt@xe_evict@evict-small-cm:
> > >     >        • shard-adlp: NOTRUN -> [270]SKIP ([271]Intel XE#261 / [272]Intel
> > >     >          XE#5564 / [273]Intel XE#688) +2 other tests skip
> > >     >   • igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
> > >     >        • shard-adlp: NOTRUN -> [274]SKIP ([275]Intel XE#688)
> > >     >   • igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
> > >     >        • shard-adlp: NOTRUN -> [276]SKIP ([277]Intel XE#1392 /
> > >     >          [278]Intel XE#5575) +15 other tests skip
> > >     >   • igt@xe_exec_basic@multigpu-once-null-defer-mmap:
> > >     >        • shard-bmg: NOTRUN -> [279]SKIP ([280]Intel XE#2322) +1 other
> > >     >          test skip
> > >     >   • igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
> > >     >        • shard-dg2-set2: NOTRUN -> [281]SKIP ([282]Intel XE#288) +12
> > >     >          other tests skip
> > >     >   • igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
> > >     >        • shard-adlp: NOTRUN -> [283]SKIP ([284]Intel XE#288 / [285]Intel
> > >     >          XE#5561) +33 other tests skip
> > >     >   • igt@xe_exec_reset@cat-error:
> > >     >        • shard-adlp: NOTRUN -> [286]DMESG-WARN ([287]Intel XE#3868)
> > >     >   • igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
> > >     >        • shard-bmg: NOTRUN -> [288]SKIP ([289]Intel XE#4943) +2 other
> > >     >          tests skip
> > >     >   • igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
> > >     >        • shard-adlp: NOTRUN -> [290]SKIP ([291]Intel XE#4915) +362 other
> > >     >          tests skip
> > >     >   • igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
> > >     >        • shard-dg2-set2: NOTRUN -> [292]SKIP ([293]Intel XE#4915) +124
> > >     >          other tests skip
> > >     >   • igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
> > >     >        • shard-adlp: NOTRUN -> [294]ABORT ([295]Intel XE#4917 /
> > >     >          [296]Intel XE#5530)
> > >     >   • igt@xe_mmap@small-bar:
> > >     >        • shard-adlp: NOTRUN -> [297]SKIP ([298]Intel XE#512)
> > >     >   • igt@xe_module_load@force-load:
> > >     >        • shard-adlp: NOTRUN -> [299]SKIP ([300]Intel XE#378 / [301]Intel
> > >     >          XE#5612)
> > >     >   • igt@xe_oa@mmio-triggered-reports-read:
> > >     >        • shard-adlp: NOTRUN -> [302]SKIP ([303]Intel XE#6032)
> > >     >   • igt@xe_oa@non-zero-reason:
> > >     >        • shard-adlp: NOTRUN -> [304]SKIP ([305]Intel XE#3573) +6 other
> > >     >          tests skip
> > >     >   • igt@xe_oa@oa-formats:
> > >     >        • shard-dg2-set2: NOTRUN -> [306]SKIP ([307]Intel XE#3573) +1
> > >     >          other test skip
> > >     >   • igt@xe_pat@display-vs-wb-transient:
> > >     >        • shard-adlp: NOTRUN -> [308]SKIP ([309]Intel XE#1337 /
> > >     >          [310]Intel XE#5572)
> > >     >   • igt@xe_pat@pat-index-xehpc:
> > >     >        • shard-adlp: NOTRUN -> [311]SKIP ([312]Intel XE#2838 /
> > >     >          [313]Intel XE#979)
> > >     >   • igt@xe_peer2peer@read:
> > >     >        • shard-adlp: NOTRUN -> [314]SKIP ([315]Intel XE#1061 /
> > >     >          [316]Intel XE#5568)
> > >     >   • igt@xe_pm@s2idle-d3cold-basic-exec:
> > >     >        • shard-adlp: NOTRUN -> [317]SKIP ([318]Intel XE#2284 /
> > >     >          [319]Intel XE#366) +2 other tests skip
> > >     >        • shard-dg2-set2: NOTRUN -> [320]SKIP ([321]Intel XE#2284 /
> > >     >          [322]Intel XE#366) +1 other test skip
> > >     >   • igt@xe_pm@s2idle-vm-bind-unbind-all:
> > >     >        • shard-adlp: [323]PASS -> [324]DMESG-WARN ([325]Intel XE#2953 /
> > >     >          [326]Intel XE#4173 / [327]Intel XE#4504)
> > >     >   • igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0:
> > >     >        • shard-adlp: NOTRUN -> [328]TIMEOUT ([329]Intel XE#5213) +1
> > >     >          other test timeout
> > >     >   • igt@xe_pxp@display-pxp-fb:
> > >     >        • shard-dg2-set2: NOTRUN -> [330]SKIP ([331]Intel XE#4733)
> > >     >   • igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
> > >     >        • shard-bmg: NOTRUN -> [332]SKIP ([333]Intel XE#4733)
> > >     >   • igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
> > >     >        • shard-adlp: NOTRUN -> [334]SKIP ([335]Intel XE#4733 /
> > >     >          [336]Intel XE#5594) +4 other tests skip
> > >     >   • igt@xe_query@multigpu-query-engines:
> > >     >        • shard-dg2-set2: NOTRUN -> [337]SKIP ([338]Intel XE#944) +1
> > >     >          other test skip
> > >     >   • igt@xe_query@multigpu-query-topology:
> > >     >        • shard-bmg: NOTRUN -> [339]SKIP ([340]Intel XE#944)
> > >     >   • igt@xe_query@multigpu-query-uc-fw-version-huc:
> > >     >        • shard-adlp: NOTRUN -> [341]SKIP ([342]Intel XE#944) +3 other
> > >     >          tests skip
> > >     >   • igt@xe_spin_batch@spin-mem-copy:
> > >     >        • shard-adlp: NOTRUN -> [343]SKIP ([344]Intel XE#4821)
> > >     >   • igt@xe_sriov_scheduling@equal-throughput:
> > >     >        • shard-adlp: NOTRUN -> [345]DMESG-FAIL ([346]Intel XE#3868 /
> > >     >          [347]Intel XE#5213) +1 other test dmesg-fail
> > >     >  Possible fixes
> > >     >   • igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
> > >     >        • shard-dg2-set2: [348]INCOMPLETE ([349]Intel XE#3862) ->
> > >     >          [350]PASS +1 other test pass
> > >     >   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
> > >     >        • shard-dg2-set2: [351]INCOMPLETE ([352]Intel XE#1727 /
> > >     >          [353]Intel XE#3113 / [354]Intel XE#4345 / [355]Intel XE#6168)
> > >     >          -> [356]PASS +1 other test pass
> > >     >   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
> > >     >        • shard-dg2-set2: [357]INCOMPLETE ([358]Intel XE#1727 /
> > >     >          [359]Intel XE#2705 / [360]Intel XE#3113 / [361]Intel XE#4212 /
> > >     >          [362]Intel XE#4522) -> [363]PASS
> > >     >   • igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> > >     >        • shard-bmg: [364]SKIP ([365]Intel XE#2291) -> [366]PASS +2 other
> > >     >          tests pass
> > >     >   • igt@kms_cursor_legacy@flip-vs-cursor-atomic:
> > >     >        • shard-bmg: [367]FAIL ([368]Intel XE#1475) -> [369]PASS +1 other
> > >     >          test pass
> > >     >   • igt@kms_cursor_legacy@flip-vs-cursor-legacy:
> > >     >        • shard-bmg: [370]FAIL ([371]Intel XE#5299) -> [372]PASS
> > >     >   • igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> > >     >        • shard-bmg: [373]SKIP ([374]Intel XE#2316) -> [375]PASS +2 other
> > >     >          tests pass
> > >     >   • igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
> > >     >        • shard-adlp: [376]DMESG-WARN ([377]Intel XE#4543) -> [378]PASS
> > >     >          +2 other tests pass
> > >     >   • igt@kms_flip@flip-vs-expired-vblank-interruptible:
> > >     >        • shard-lnl: [379]FAIL ([380]Intel XE#301 / [381]Intel XE#3149)
> > >     >          -> [382]PASS
> > >     >   • igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
> > >     >        • shard-lnl: [383]FAIL ([384]Intel XE#301) -> [385]PASS
> > >     >   • igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
> > >     >        • shard-adlp: [386]DMESG-FAIL ([387]Intel XE#4543) -> [388]PASS
> > >     >   • igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
> > >     >        • shard-adlp: [389]FAIL ([390]Intel XE#1874) -> [391]PASS
> > >     >   • {igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc}:
> > >     >        • shard-adlp: [392]DMESG-WARN ([393]Intel XE#2953 / [394]Intel
> > >     >          XE#4173) -> [395]PASS
> > >     >   • igt@kms_joiner@invalid-modeset-force-big-joiner:
> > >     >        • shard-bmg: [396]SKIP ([397]Intel XE#3012) -> [398]PASS
> > >     >   • igt@kms_vrr@cmrr@pipe-a-edp-1:
> > >     >        • shard-lnl: [399]FAIL ([400]Intel XE#4459) -> [401]PASS +1 other
> > >     >          test pass
> > >     >   • {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
> > >     >        • shard-bmg: [402]WARN ([403]Intel XE#5786) -> [404]PASS
> > >     >  Warnings
> > >     >   • igt@kms_async_flips@async-flip-suspend-resume:
> > >     >        • shard-adlp: [405]DMESG-WARN ([406]Intel XE#2953 / [407]Intel
> > >     >          XE#4173 / [408]Intel XE#4543) -> [409]DMESG-WARN ([410]Intel
> > >     >          XE#4543) +1 other test dmesg-warn
> > >     >   • igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
> > >     >        • shard-bmg: [411]SKIP ([412]Intel XE#2311) -> [413]SKIP
> > >     >          ([414]Intel XE#2312) +7 other tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
> > >     >        • shard-bmg: [415]SKIP ([416]Intel XE#2312) -> [417]SKIP
> > >     >          ([418]Intel XE#5390) +5 other tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
> > >     >        • shard-bmg: [419]SKIP ([420]Intel XE#5390) -> [421]SKIP
> > >     >          ([422]Intel XE#2312) +2 other tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
> > >     >        • shard-bmg: [423]SKIP ([424]Intel XE#2312) -> [425]SKIP
> > >     >          ([426]Intel XE#2311) +6 other tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
> > >     >        • shard-bmg: [427]SKIP ([428]Intel XE#2313) -> [429]SKIP
> > >     >          ([430]Intel XE#2312) +6 other tests skip
> > >     >   • igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> > >     >        • shard-bmg: [431]SKIP ([432]Intel XE#2312) -> [433]SKIP
> > >     >          ([434]Intel XE#2313) +7 other tests skip
> > >     >   • igt@kms_tiled_display@basic-test-pattern:
> > >     >        • shard-bmg: [435]SKIP ([436]Intel XE#2426) -> [437]FAIL
> > >     >          ([438]Intel XE#1729)
> > >     > {name}: This element is suppressed. This means it is ignored when
> > >     > computing
> > >     > the status of the difference (SUCCESS, WARNING, or FAILURE).
> > >    Build changes
> > >     >   • Linux: xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed ->
> > >     >     xe-pw-155809v3
> > >     > IGT_8587: 8587
> > >     > xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed:
> > >     > aaaff197c9186f4959c2bcb18035725188b950ed
> > >     > xe-pw-155809v3: 155809v3
> > >     Thanks,
> > >     Anirban
> > > 
> > > References
> > > 
> > >     Visible links
> > >     1. https://patchwork.freedesktop.org/series/155809/
> > >     2. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/index.html
> > >     3. mailto:I915-ci-infra@lists.freedesktop.org
> > >     4. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html
> > >     5. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-463/igt@xe_gt_freq@freq_fixed_idle.html
> > >     6. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@intel_hwmon@hwmon-write.html
> > >     7. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
> > >     8. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574
> > >     9. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> > >    10. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
> > >    11. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
> > >    12. https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> > >    13. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> > >    14. https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> > >    15. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html
> > >    16. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> > >    17. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> > >    18. https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> > >    19. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
> > >    20. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> > >    21. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> > >    22. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >    23. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
> > >    24. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> > >    25. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> > >    26. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> > >    27. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> > >    28. https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> > >    29. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> > >    30. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> > >    31. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
> > >    32. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> > >    33. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> > >    34. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> > >    35. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> > >    36. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> > >    37. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
> > >    38. https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> > >    39. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
> > >    40. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> > >    41. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
> > >    42. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> > >    43. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> > >    44. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> > >    45. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> > >    46. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
> > >    47. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> > >    48. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> > >    49. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> > >    50. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
> > >    51. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> > >    52. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> > >    53. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> > >    54. https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> > >    55. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
> > >    56. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> > >    57. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> > >    58. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> > >    59. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> > >    60. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> > >    61. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@mode-transition.html
> > >    62. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
> > >    63. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> > >    64. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html
> > >    65. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
> > >    66. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@plane-scaling.html
> > >    67. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
> > >    68. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> > >    69. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html
> > >    70. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
> > >    71. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio.html
> > >    72. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> > >    73. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_chamelium_audio@hdmi-audio-edid.html
> > >    74. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> > >    75. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html
> > >    76. https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> > >    77. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
> > >    78. https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> > >    79. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html
> > >    80. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
> > >    81. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_content_protection@dp-mst-type-1.html
> > >    82. https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
> > >    83. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> > >    84. https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> > >    85. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-max-size.html
> > >    86. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> > >    87. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> > >    88. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> > >    89. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> > >    90. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> > >    91. https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> > >    92. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> > >    93. https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> > >    94. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
> > >    95. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> > >    96. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_display_modes@extended-mode-basic.html
> > >    97. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
> > >    98. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_dp_linktrain_fallback@dp-fallback.html
> > >    99. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
> > >   100. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
> > >   101. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> > >   102. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
> > >   103. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms_draw_crc@draw-method-blt.html
> > >   104. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_draw_crc@draw-method-blt.html
> > >   105. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> > >   106. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> > >   107. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
> > >   108. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> > >   109. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> > >   110. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> > >   111. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_feature_discovery@display-4x.html
> > >   112. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
> > >   113. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_feature_discovery@psr2.html
> > >   114. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> > >   115. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
> > >   116. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
> > >   117. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> > >   118. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html
> > >   119. https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> > >   120. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html
> > >   121. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   122. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> > >   123. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
> > >   124. https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> > >   125. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
> > >   126. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html
> > >   127. https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> > >   128. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_flip@flip-vs-panning-interruptible.html
> > >   129. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   130. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
> > >   131. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
> > >   132. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
> > >   133. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   134. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> > >   135. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> > >   136. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> > >   137. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> > >   138. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> > >   139. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html
> > >   140. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> > >   141. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> > >   142. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> > >   143. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> > >   144. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   145. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
> > >   146. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> > >   147. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
> > >   148. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   149. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
> > >   150. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> > >   151. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
> > >   152. https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> > >   153. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
> > >   154. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
> > >   155. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
> > >   156. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
> > >   157. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> > >   158. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> > >   159. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> > >   160. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
> > >   161. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> > >   162. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
> > >   163. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> > >   164. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> > >   165. https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> > >   166. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
> > >   167. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> > >   168. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> > >   169. https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> > >   170. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> > >   171. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
> > >   172. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> > >   173. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_joiner@basic-big-joiner.html
> > >   174. https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> > >   175. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_joiner@basic-force-big-joiner.html
> > >   176. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> > >   177. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_joiner@basic-ultra-joiner.html
> > >   178. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
> > >   179. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
> > >   180. https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
> > >   181. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
> > >   182. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195
> > >   183. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html
> > >   184. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> > >   185. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_plane_multiple@2x-tiling-none.html
> > >   186. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
> > >   187. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html
> > >   188. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
> > >   189. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> > >   190. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> > >   191. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
> > >   192. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_pm_backlight@fade.html
> > >   193. https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> > >   194. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_pm_dc@dc5-retention-flops.html
> > >   195. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
> > >   196. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
> > >   197. https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
> > >   198. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html
> > >   199. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
> > >   200. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> > >   201. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> > >   202. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> > >   203. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
> > >   204. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> > >   205. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> > >   206. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> > >   207. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> > >   208. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> > >   209. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
> > >   210. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> > >   211. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> > >   212. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_psr@psr-cursor-plane-onoff.html
> > >   213. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> > >   214. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> > >   215. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> > >   216. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
> > >   217. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> > >   218. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> > >   219. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> > >   220. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html
> > >   221. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> > >   222. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> > >   223. https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> > >   224. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> > >   225. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> > >   226. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> > >   227. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
> > >   228. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> > >   229. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> > >   230. https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> > >   231. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_vrr@flip-suspend.html
> > >   232. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> > >   233. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
> > >   234. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> > >   235. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_ccs@block-multicopy-compressed.html
> > >   236. https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> > >   237. https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
> > >   238. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
> > >   239. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.html
> > >   240. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
> > >   241. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5610
> > >   242. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_compute_preempt@compute-preempt-many.html
> > >   243. https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
> > >   244. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_configfs@survivability-mode.html
> > >   245. https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
> > >   246. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> > >   247. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> > >   248. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> > >   249. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> > >   250. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html
> > >   251. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> > >   252. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html
> > >   253. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
> > >   254. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_eu_stall@non-blocking-re-enable.html
> > >   255. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
> > >   256. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html
> > >   257. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> > >   258. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-discovery.html
> > >   259. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> > >   260. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html
> > >   261. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> > >   262. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_eudebug_online@single-step.html
> > >   263. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
> > >   264. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
> > >   265. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html
> > >   266. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> > >   267. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
> > >   268. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict@evict-beng-threads-small-multi-vm.html
> > >   269. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> > >   270. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict@evict-small-cm.html
> > >   271. https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> > >   272. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
> > >   273. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> > >   274. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html
> > >   275. https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> > >   276. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> > >   277. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> > >   278. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
> > >   279. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
> > >   280. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> > >   281. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
> > >   282. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> > >   283. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
> > >   284. https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> > >   285. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
> > >   286. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_exec_reset@cat-error.html
> > >   287. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
> > >   288. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html
> > >   289. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
> > >   290. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html
> > >   291. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> > >   292. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html
> > >   293. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
> > >   294. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> > >   295. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
> > >   296. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
> > >   297. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_mmap@small-bar.html
> > >   298. https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
> > >   299. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_module_load@force-load.html
> > >   300. https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
> > >   301. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
> > >   302. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_oa@mmio-triggered-reports-read.html
> > >   303. https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
> > >   304. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_oa@non-zero-reason.html
> > >   305. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> > >   306. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_oa@oa-formats.html
> > >   307. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> > >   308. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_pat@display-vs-wb-transient.html
> > >   309. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
> > >   310. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572
> > >   311. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html
> > >   312. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
> > >   313. https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
> > >   314. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_peer2peer@read.html
> > >   315. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> > >   316. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5568
> > >   317. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pm@s2idle-d3cold-basic-exec.html
> > >   318. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> > >   319. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> > >   320. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html
> > >   321. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> > >   322. https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> > >   323. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> > >   324. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> > >   325. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> > >   326. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> > >   327. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
> > >   328. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0.html
> > >   329. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
> > >   330. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html
> > >   331. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> > >   332. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html
> > >   333. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> > >   334. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
> > >   335. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
> > >   336. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
> > >   337. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
> > >   338. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > >   339. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_query@multigpu-query-topology.html
> > >   340. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > >   341. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> > >   342. https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> > >   343. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_spin_batch@spin-mem-copy.html
> > >   344. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
> > >   345. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_sriov_scheduling@equal-throughput.html
> > >   346. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
> > >   347. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
> > >   348. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> > >   349. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
> > >   350. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
> > >   351. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> > >   352. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> > >   353. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> > >   354. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> > >   355. https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
> > >   356. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
> > >   357. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> > >   358. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> > >   359. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> > >   360. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> > >   361. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
> > >   362. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> > >   363. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
> > >   364. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> > >   365. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> > >   366. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> > >   367. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> > >   368. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
> > >   369. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> > >   370. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> > >   371. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
> > >   372. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
> > >   373. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> > >   374. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> > >   375. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> > >   376. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> > >   377. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   378. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> > >   379. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> > >   380. https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> > >   381. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> > >   382. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> > >   383. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> > >   384. https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> > >   385. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> > >   386. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
> > >   387. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   388. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
> > >   389. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
> > >   390. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> > >   391. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
> > >   392. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
> > >   393. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> > >   394. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> > >   395. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html
> > >   396. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> > >   397. https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> > >   398. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> > >   399. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> > >   400. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
> > >   401. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html
> > >   402. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> > >   403. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
> > >   404. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
> > >   405. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html
> > >   406. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> > >   407. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> > >   408. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   409. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html
> > >   410. https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > >   411. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> > >   412. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> > >   413. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
> > >   414. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> > >   415. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> > >   416. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> > >   417. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> > >   418. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> > >   419. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> > >   420. https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
> > >   421. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> > >   422. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> > >   423. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
> > >   424. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> > >   425. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
> > >   426. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> > >   427. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> > >   428. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> > >   429. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
> > >   430. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> > >   431. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> > >   432. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> > >   433. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
> > >   434. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> > >   435. https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
> > >   436. https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> > >   437. https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
> > >   438. https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
> 
