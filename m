Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BF9E7BDA9
	for <intel-xe@archiver.kernel.org>; Mon, 16 Feb 2026 12:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF7510E02E;
	Mon, 16 Feb 2026 12:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcJoV0ZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C6710E02E
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Feb 2026 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771244870; x=1802780870;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qU2+Kppv6h0+wz3Q3rtykhetF65GkizcN0e98sfPyVs=;
 b=YcJoV0ZS/5RyEb1Jn7c80gMX0w0yvsrgnx6CrEB7br1+Yd9B8zI5Z9sy
 bBozD65KeZkjIo1rk67ByhnE+fvePS5jmm6vRlVMBIyJcYf1rhV6K4rlq
 QYsCo4WeZn4u/aZmocW2sZzOslpp+j47voS1ut8d7yGu74/15SdIr7vIt
 NR2BoOb8jF+sYtX3QaqXvom8WJ6auoLyqEBOtYYWqVB9GuJegbMRtylWc
 vlF7W+k53Ui4OmhJz2mEmSPPZLxhJ/tbz7lKTMXLayrXamY2I9WRCKfUd
 LpcN59ODB8iOXVo9VLmgMIolQySh7GPUR6MRGGYUbqs4k2Wwd2MAyHUxd w==;
X-CSE-ConnectionGUID: d7JH0a5yRmSek8uIoCMQig==
X-CSE-MsgGUID: jVUbRlbkQv2uqcuspyB77A==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72036679"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72036679"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 04:27:49 -0800
X-CSE-ConnectionGUID: yQMtTBDiRwqkRkZGm/D62g==
X-CSE-MsgGUID: GT770xoJTgW+s42OYWUMFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="212849857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 04:27:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 04:27:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 04:27:49 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 04:27:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sm8GtG2y/sPB7dOShXk4WuqUdzhwWSCxPRbqkIE6WE0S9RwAb+KTI0Wt0E9c6cJaX9o5dvuosmHRjrfjya+lwDIOPWru2P72GZ27oii2OS6QNAP/Zg8gdivSWrUaor9jzlm65qUa8hk4Vjg4D2+Er8VqSFtAEkRYRUH/BXGobxplrEfhdR21qZRFiBDZ3Y3Ohg1rfsF8WzQArfuLa421miSe1u8r5q78Afc1BD/m5Rw2GSenqewLcAKu/FdA/zKxpX7OlX0RjD+OeokZF+kL5MAg6FUitidEYe3kJGlALiMVpHShnScELeBnL4CaZUZPVkcvjSjo7fiTGm21k8V+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERWY1AgKula8izLU1TxeMb4v/Sph4WnHE9sxkkAqptE=;
 b=yveknQzdn0dvoHZhTi16834rad9V0r58gHCyW6WrXopgVgsRsYge2Fo23s5m7EqpB+iacaSYG00VG+cAWoJ1HbdN8s/LDWcpkSH8hAoWHtlpgPp1c1ZiT+aRTMs/bZIs+64OSD2kVwnJjGT5Tg3CehN+YAcoUBketrdB53H6Zf7gGNrFptf9hvdYM57KnMgFsh5mwuM4FyeodU9+JazLT18PSqoQdwcfwygJlkXABu9e25Edo8qetPFjyEzq/ZdHen0dbslprGI2tem0ty6AeGkDL4H2OLdbt06h0JzLu93QNq/db5/UrSLMGqlZOKDDo8V5opTZ0O3mIRjeqXVGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 12:27:46 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 12:27:46 +0000
Message-ID: <0ff0af91-aa7d-4cf5-853f-d457be035c81@intel.com>
Date: Mon, 16 Feb 2026 17:57:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-15-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260122100613.3631582-15-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b84fb0-53af-45e2-542b-08de6d56ca70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QS9lNlp4VmNLb2w1OXJtbVo4Q0RKblQydWxFU1VVVjEvWjlJZGRPTjF4OWhY?=
 =?utf-8?B?WWNaenBwdHVOSzl2NkY5Z0ZZc3Nra3VVaENSVGhwL2Y3SWF6SlFvU1JVR3FM?=
 =?utf-8?B?aVByVzgvSmZnSEpFV1VDbVZmTzdicnBiejAzdWxVcFdpUzNMKzVkc0UvZ0tq?=
 =?utf-8?B?WlhxREtQOTZ2MkZwZEVGOVBJM3RUNVE5WmcvNjlkYjMvWDFFYTBBYS9BK2Rn?=
 =?utf-8?B?ZlpBUXRGK0hMd0VuSHdWSkFtbldvYUVPalBqcWtGN1hwUFRTNTYvTDRydStl?=
 =?utf-8?B?NGRGZTU0SzRMREN3am0yMVNFcmorb0dmOWNYMTBXQ1dNQ0hwWE5lU0lZRThp?=
 =?utf-8?B?emJhY1JmeEo5YUVpMFA2TStMdWNaMDJYdG9Wb3VWamNTbVBlTEFKait1YXFu?=
 =?utf-8?B?bERxUFVIblFmd0szNG1id2tuNGZCNDV6U1QrWU0yWjZwem1wbnpLQzZWd2Ev?=
 =?utf-8?B?U0ludGFvS2N1ZFMvdzdiZm5hRXZFcVlNc2g0RlpzOCtOT1k3WVlUVDdoTFdo?=
 =?utf-8?B?TmMwNklJYmZaZkEydnB4Z2NHNjZCRjF1Z0dvU2dmdHpEQnlHY1NjNTZoUVdN?=
 =?utf-8?B?a0J2VS9qMzJGVENKQTQ0c0c2VWo5WVhIR2ZuUVp5NVdGQWZHdFVYUXZ5cWFo?=
 =?utf-8?B?QkJKcFVtNnl0U0loNlRxaEtTSnd2YU1ybklTRDRtMzVNekx3UW1JMUN3emc2?=
 =?utf-8?B?K0prU3huMk9ZcGdJaTZtWUIxblNtNldHc1dlSUZJdXBIZUJ1d2tnTmNUUnJY?=
 =?utf-8?B?TkJHLy9PcHUxL3d6bW5TbWFwVFFEWGFHZDJoaTNRWSs0bUxwbzQ2ZDJpZ3Zh?=
 =?utf-8?B?MXF3T3kyb3B5MC9lcFBncEUyQzMyQ2lzY1lhdHQ1eHFPbG8za3pjYms4aXcz?=
 =?utf-8?B?QUdvbGxGTWdaNUpYd0lmYUo1cFhFcVdseklzQ0RGN0tTK1l5MlI5SXBTQzZ3?=
 =?utf-8?B?VlNFMHZBdGdQT0cyYzViUUFyOGptdUppLzBXbU9xeXhHU2ZEbDBOa01YcEFs?=
 =?utf-8?B?WkNJVkR5Y2J5OXBhU2xyNTEwcDZXMnhrL3gyWFZwbHFSWlBJZHVkckNNeDdX?=
 =?utf-8?B?KytDYWdjRFZER2VHcHdXWE9QRGtnU2Y0d3owTHU3NG9RWCtZdEJ1RGFOVi96?=
 =?utf-8?B?WVAxMmxiN09mK2gzSGFMMitmdnZCZEt6N3doOE9oc25GbjF1VU9zckZkbmhE?=
 =?utf-8?B?eENoMzFGcDZtWm1Yd0RaSTNyMkNwdU50WmdYNmVNcnhQbWtPWjV6NjdUQjBQ?=
 =?utf-8?B?czdsajNwWWdGNmRyS1BNL1kzMmpIM2MyUjNKYUszS1pwOW9WVVh6bFJad1lN?=
 =?utf-8?B?R0oxUGlvd25vcUlyVXk4OVp0VmVZeEMxMVdyT2F2dUdiMXdqbHF6SE5ZdWdx?=
 =?utf-8?B?bmJxSk1GZkRDWHZyME1xbmQ5QnBFeUprbTE0SXY3Z05raFJ6ZkNpU0JBZHdS?=
 =?utf-8?B?K1hTRUpYVnBuTlVrOFlwRXBnSnZDNjkzODJ5cFY3UUVOcHVBU1dIQUUwaVVB?=
 =?utf-8?B?bEV2K052MFlOYWd1YWxOU3VoVHJWbU5seXkwWDM1aWRFUFdSR0owbDB1aGJP?=
 =?utf-8?B?bXZ6b1U4ODgyZENoQkhOVXA2MjhlcDFnS2dzVVJJM0hVa2ZTSURycHMvSXN0?=
 =?utf-8?B?TVhranU5SmpvVkVabGVSQ1pnR05peFlmTTV3N3l6Y1dTU0FZa1ZRYzlQbzlp?=
 =?utf-8?B?cE83bmdTcnZYK0hiMUl0T2dIVW0zcmtFeGd5eDRSbmRUcWJ4NVp0bFdYSGlY?=
 =?utf-8?B?eEJkeE56b0Y3MzV1OXpvaTJqcXV3SFFJUDYwMmthem1MdHp2YUVURWZxV2h5?=
 =?utf-8?B?QStSWWVPSzJjTk9kdFk2R2IzRHNubnNKSDI3N05vTnZWZ1M0bHJSeUV2bHhy?=
 =?utf-8?B?eGhvbUNPbmFFelpnNmZsNjgwUWlPMjh4VGowNDcrL1hsZkF1Um92WTAwUXB1?=
 =?utf-8?B?VXNONnpoQXBlM1c3TFNuL0Y3WHZ2TVpvaURYSkdRdGpsQ0F2WHI4aXh4eTRU?=
 =?utf-8?B?RWY5ZFUraGx1OWtSYXUzdWV2bDhTK0dwb1VsTHpYVFNPNzNDK0Rac29tNDhO?=
 =?utf-8?B?REpKc0pTMy9CNDN6RFYxby9XWjNBZzU1U1dVRjR1NktiV0IwR0UzQ3o3NFRV?=
 =?utf-8?Q?GsXc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVNVQlQ5NUFhTkdHdldiRHg1Q0xSTlNGT2pGS0Z1dTB5NUpIRThyRUN4Vllu?=
 =?utf-8?B?WmNuN1RuR0VkWi9CM2FuOVlRUklXVi9aUENrbmp3WXdwY0ZxRVowUFpneE1S?=
 =?utf-8?B?aEQrbG9WOFN4Rk5GSWFHbHAxTWpteElLdG0vV2dXTm5JQVczTEQzMnI5R285?=
 =?utf-8?B?c3R0WlUzbzFpbzh3K1d5QmwyRUJHRHo1Sy83QWhEdE5pTXNaSjR2ZVhzVjhI?=
 =?utf-8?B?VXEyNUFKb3R0QVE2OTM3bm1xT04wb2ZrRVRjTXkxb1AxRlMvTmkyaEhDUits?=
 =?utf-8?B?ak9HcVZZMTRTSWJFMkIyWWZaV1MxeG1Wc0VvQmx0QjFYVTRoYU1kSVdTUmp0?=
 =?utf-8?B?TCtwckltZVhhNHJGcHg2Z2FVZ0lMUlZTcUgxRHF5MjIrVDBXSGxUY3h5M0lW?=
 =?utf-8?B?WldIZk9WQ0QzbFZDWFlWWWVWZTdHZGREV0kwWURmclRndGVFT3VjSFpmZjJG?=
 =?utf-8?B?Mm5NWXhrVkRkZ3Z6R1d4YlFjZzZGaTU3eHR2TzU2QVNiaUdOU0ZYNEUyQlRX?=
 =?utf-8?B?S1NmVGdPT1duZ0RUOW4vMXA4VGh0SW5xSkRQdkoxYVIrVG5TZlhvT1NKSEc3?=
 =?utf-8?B?SWw2TURDMzd6Qi84UW5Zckp4YXJkUFZZUWJ5SHhLd0xrOEQ1VHF2U3o0MVlu?=
 =?utf-8?B?SGovUVAxak5uV2h6c0Frak1YSjVhb0pMS1JyQXdZc2tUY285bUVLdytjYXk0?=
 =?utf-8?B?dnBzckhCZWJvTGRFaHorcWhCdVJkR3lRWkNTOEgzOE1iUlhFbUZQaFQvcDVr?=
 =?utf-8?B?SncvdEJUeU44U2lsRkVCVjR6eEwyNzN3dUVzZGU3RUNqdm8zSm51cGd1Zngz?=
 =?utf-8?B?S2UxQ3Rxa3FkeEZQdFFaeC9kWGRPbFg5L0V2Y0VIb1lTb01wQ3FCU0t4RUZX?=
 =?utf-8?B?dmxkNEtBbjVZajVwSmZBNXZTdXJhcDdIQjdMSnNTdUU3eWVvM052VDZWUW16?=
 =?utf-8?B?M1l2d1FZTWxscTNaczY4ejNFY1pqZzB2WkNkaEMyR28rUEJzSWVYVm5jRHJu?=
 =?utf-8?B?NzduWDd0ZDhtWjE5eWVEQm9ZUGxjdkUyZHdVYjBOWlMwZktjcUtBU2N3Ym9n?=
 =?utf-8?B?MWVaSjhIQ1UzNEhsSjRZaWxmMnRCeExZcWkzMlo3MElhR003RjBaeFl6dmYx?=
 =?utf-8?B?cVU4SnJpSE03WFArS0J6TW5iV250V081NWFMOHZpR1R0cnkvajRNdGxGQnpS?=
 =?utf-8?B?NEROZW9jK2lIaG1KaXEyR28rK2xsTmI3dGVKYnl1K0FJUklJWEJSeFJMalhQ?=
 =?utf-8?B?TXJzaXN1QUptQmlEK1NMaytVb0h1bTQyUTlQYlpET1Z1MzJwZnVKeTZ6cVgr?=
 =?utf-8?B?SmxQQ0VqTldvVDR2VnhkNkpjRWFkUTd2OWdTNmg5eHNsN2ZFU0tkMVVUdjFl?=
 =?utf-8?B?dWluTGxKWW5SVEpXNi9KTFZPbUMvdzFtakJySi9uRmlIc0p5Rm8vOHgvQUVL?=
 =?utf-8?B?WGhBbjQvbkwycThTL2xjbWUvR3U5N1VnSWRobDZxbS90UkxIR2NnVTdNT3J0?=
 =?utf-8?B?cmc3L0ZiRWk2MGVWbVlDQ1FPVWlJaWY5OEFwbFpHekhHUTd4RXR2QmkvUEFs?=
 =?utf-8?B?amd4V2ZNYUhvbVloRCtwaW9ZVE9FbkhxdFZLU0VFQkJDMmVBZ0xxYVp0Y2Fk?=
 =?utf-8?B?TzNkSlcrTnhFeUtoZ1pROE01ZzU1aVlhQ2RiRnZqbDMzTHp4RTM3YSttVGho?=
 =?utf-8?B?Lzk5MUZnbXRmUzRqWVYyVTgrc25DejJKQVZIVFptS0V6YitMeUpzS3ZDVEdp?=
 =?utf-8?B?aW1GVEFDN0FMOFdBL2tBOTBlV1lkNWpHakpPZVVxZDJRTzNQTWNQc1k5WXJ4?=
 =?utf-8?B?YlJ3ais0YnN3WkFta1NHTHJqdmVVTFdtMHUwc3J6RzAwM2tjNEI5QkdJdVYr?=
 =?utf-8?B?MjRlald5TjdqeU5pa2tEcUhtbmFFWFhRSzE2OVg0SnpHMHJ0WStHMWhiTHdY?=
 =?utf-8?B?RE4yTmtMV1BaWDQ3NkdsanlJOFhDMmRqV0hJVHNCcWlXUXlvd05DZHUvZVRh?=
 =?utf-8?B?UTZxWUMxdzB0VnlIQ1pzTzhKZTIrc0xsRmtQRnZ2Qk1uSWtxYWNaODZNSUtI?=
 =?utf-8?B?em1DbnFneFNvekNDQmdQRElwT01PejhYcmp4bHJENUpkbFRLeTBWTHZMWFhE?=
 =?utf-8?B?NGhsQ0hqbWZuMit5aXcyeE9IZWMrNEdJNVJEQmNIOGZtOHRLNkJPajFjMUVO?=
 =?utf-8?B?TTNnMStJZFY3ejAzejl6ZUxTck50MFF1bTZLWUxqNjJYaHFtOFhJMnUwTEFQ?=
 =?utf-8?B?R0toWnBSZ2FQS0FNSENNMU1RSlg5ZG9tL3BUb1ZuOWFINldqY3ptZkUvUGNE?=
 =?utf-8?B?QTRhZFdzajRyVzZVTHRLQmMyQ2NOTTltV2hTUGxxcWRUT0o2S0Z4ZVhrQTU1?=
 =?utf-8?Q?pXnckjHkEAy98hdo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b84fb0-53af-45e2-542b-08de6d56ca70
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 12:27:46.7708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ybr/ri/VpsBK10j0yUqdysLGh/G23qmTVe96bbmOwhfLB18DngQP20RhEnP7B3r9gTxIFGRTpEgn2hb9L5hwMlYnaWihCg90io3MxUNICpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
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

+Adding more comments

Hi Riana,

On 22-01-2026 03:36 pm, Riana Tauro wrote:
> Uncorrectable errors from different endpoints in the device are steered to
> the USP which is a PCI Advanced Error Reporting (AER) Compliant device.
> Downgrade all the errors to non-fatal to prevent PCIe bus driver
> from triggering a Secondary Bus Reset (SBR). This allows error
> detection, containment and recovery in the driver.
>
> The Uncorrectable Error Severity Register has the 'Uncorrectable
> Internal Error Severity' set to fatal by default. Set this to
> non-fatal and unmask the error.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile    |  1 +
>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>   drivers/gpu/drm/xe/xe_ras.c    | 71 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h    | 13 +++++++
>   4 files changed, 88 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5581f2180b5c..85ec53eb0b62 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>   	xe_pxp_debugfs.o \
>   	xe_pxp_submit.o \
>   	xe_query.o \
> +	xe_ras.o \
>   	xe_range_fence.o \
>   	xe_reg_sr.o \
>   	xe_reg_whitelist.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index f418ebf04f0f..be89ffc9eade 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -59,6 +59,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_ras.h"
>   #include "xe_shrinker.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
> @@ -1019,6 +1020,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_vsec_init(xe);
>   
> +	xe_ras_init(xe);
> +
>   	err = xe_sriov_init_late(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> new file mode 100644
> index 000000000000..ba5ed37aed28
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <linux/pci.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_ras.h"
> +
> +#ifdef CONFIG_PCIEAER
> +static void unmask_and_downgrade_internal_error(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *vsp, *usp;
> +	u32 aer_uncorr_sev, aer_uncorr_mask;
> +	u16 aer_cap;
> +
> +	 /* Gfx Device Hierarchy: USP-->VSP-->SGunit */
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp)
> +		return;
> +
> +	usp = pci_upstream_bridge(vsp);
> +	if (!usp)
> +		return;
> +
> +	aer_cap = usp->aer_cap;
> +
> +	if (!aer_cap)
> +		return;
> +
> +	/*
> +	 * All errors are steered to USP which is a PCIe AER Complaint device.
> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
> +	 * detection, containment and recovery in the driver.
> +	 *
> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
> +	 * Internal Error Severity' set to fatal by default. Set this to
> +	 * non-fatal and unmask the error.
> +	 */
> +
> +	/* Initialize Uncorrectable Error Severity Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
> +
> +	/* Initialize Uncorrectable Error Mask Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);

Handle pci_read/write_config_dword() failure (return non-zero) scenario 
for both sev and mask.

Impact: Silent failure leads to incorrect assumption about error 
handling conf. Driver may expect

non-fatal errors but still get fatal errors causing unexpected resets.


Thanks,

-/Mallesh

> +
> +	pci_save_state(usp);
> +}
> +#endif
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl)
> +		return;
> +
> +#ifdef CONFIG_PCIEAER
> +	unmask_and_downgrade_internal_error(xe);
> +#endif
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> new file mode 100644
> index 000000000000..14cb973603e7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_RAS_H_
> +#define _XE_RAS_H_
> +
> +struct xe_device;
> +
> +void xe_ras_init(struct xe_device *xe);
> +
> +#endif
