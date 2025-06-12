Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED97C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 17:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2609110E0BE;
	Thu, 12 Jun 2025 17:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuxtCqy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C931610E07E
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749750590; x=1781286590;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Xk1FiffLQ1ch0X6sNBJkSrTKhjTjzKnMsyEUq9sxyHg=;
 b=DuxtCqy8A1jStoBzvoo6m2rPOhgAxrbUMh8cMv4LxYVxKS/I4cLfdBd5
 GYFKrp1K4ZYNlWQVhE096eBoWmDUhVNsMJe873nIQc173DLPGIh9xYrN2
 BLE3Ixe4IxR3TKwO2kojJPrr+PydK/k2S84lVx+Am1Z8ba5ogKFr8qws2
 SKE5M2KHIqi6/PvTKJAUC+I7Y4pkMruAHoQ75Ga+sJdxcKzTtO4SMBtEs
 bpAWgpuduht07vwCBisDC2IpS6z/YSvGkfF8bO9xSHThaId9+1YZDdsOa
 mi2B6xDmvtyvUhLzuZ23rcuLTDdnxMQf+SMgE96Wj5OQevKQ0tTJGlqJJ Q==;
X-CSE-ConnectionGUID: HfDc/lu/RYqbLRr/U81kvQ==
X-CSE-MsgGUID: 65aZmgQMSiKeKHdUI1pSAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51663623"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="51663623"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:49:47 -0700
X-CSE-ConnectionGUID: yAJoutEoTDaB5rV+H+8QgA==
X-CSE-MsgGUID: dUa/t0m4QFmDh5m1YFqBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="152501172"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 10:49:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:49:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 10:49:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 10:49:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgP1tzuSjlQuazEprt8FbR8C7svkDAkh7+MnxJFuQGIkKgk4ZjrMZZ1T6leuam2In1LF0SsO2DhhLDfZ97NWmcGXmUX0yQaVG+WQmyZSEPG1SkC/g/bTB2TI0xfyt4tw9YfRyfgiyDOVawVSzh8CvpConY3ocWK1CkwO0oAeu3fGaylO0+TGwkQDjKDu5HhNc3qrMpZJW9X+p58oVeH9rDmzcOPdoA0jPOwBaAesh1PzOG3Mdzj60phACQy2jjsyFej44lk+wBYWD/GPGVJCbvh85q13W73CncsWvwZirEvjCXKMPCJRT6hySGNqhmu1/lHB4GAYOuporgkjUuGDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjFKrNGLBl/kyAXavvvdLrvjJzOAMfb3aWozoW1k1gA=;
 b=fbUiLcIZgAvikGDyfESOS+n+zpoLk+qRFXZD9JMmx8Q9KdydbGKysko3JZuiLAV3lqdyayr0mRXfflikmqD/qd3tuTEZLIkKWdgpD703W5MjjLQBshXKSDtakFbQPe5syX2cG0maCGUjwTt9056YFeg7p9xVl5+CvMOzv43IcqOvwrWUZ1ClgU+vv+qHNauTmKfdlixisno1EDpxaUZs7ABLJvK7mpu9BR1BbayPMwREKikLem3kWwl62vY6SpZbedR/QLk0MKhhOm+Exa8Sw9KfXoEM2rXFE7VL3BRt1erDWu58NKB4IFIDoxyJaJAP3cwmGVVZxFkYzBM1tLahAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA2PR11MB5068.namprd11.prod.outlook.com (2603:10b6:806:116::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Thu, 12 Jun
 2025 17:49:41 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 17:49:41 +0000
Message-ID: <f466922e-2884-4e42-ad64-4d1ce063b4fa@intel.com>
Date: Thu, 12 Jun 2025 10:49:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <CH0PR11MB5444BB01251782688FECD0E6E575A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <a47f94c7-7677-4945-ba4e-cba894428472@intel.com>
 <CH0PR11MB544461EFF28E40A16C84A175E574A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <CH0PR11MB544461EFF28E40A16C84A175E574A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0280.namprd04.prod.outlook.com
 (2603:10b6:303:89::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA2PR11MB5068:EE_
X-MS-Office365-Filtering-Correlation-Id: 78ae8495-b326-492e-22ae-08dda9d981d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXdHYUErcmtzSFRxU3RkalZjMnM5MXdCZDZVVVZ4alVlcjVLNnA4bjVXMWN4?=
 =?utf-8?B?blVoaENXaGt2cDEzZzAzRnByM25yaTJzc214SzAyNThoYWp1WGFObnVpdWkx?=
 =?utf-8?B?akUwRHcvczNzWS9xckkrZ2JMTXhCbnNkREM1ZFJkVkdNdGNQaE9TelJqVnZU?=
 =?utf-8?B?TkxVTlhFUGs2Z3VYUkF1Vld0SW90Y1BCZmlaa0t6Rzd2Qjdzd2ZKa0F5L0M2?=
 =?utf-8?B?ZEtEczlYUVJzaCtobTR4YjRsUVd6VnczYlJhWWMzVGFnVE5Xckd1MHFJRCtG?=
 =?utf-8?B?dDY0ajVtVXhIelhXakhqditIRE1sVGkvR2ZaVDNheVNyaWNML1UyU1NZYkhG?=
 =?utf-8?B?czQ3QXkzWjVDcW5oQzhMS2t4S3ZPRlJablNwUmoxOVRVWVgvSGRVNCsvZmRI?=
 =?utf-8?B?UVcxVnY0c0pOVjRJVzdiWE1MRTBCYmlTczMxRVR5YjlkblR1VmhqVXdCOXdL?=
 =?utf-8?B?OEdjOWdvNnowTmlOL2h0cERuNHRsMkxuWkFQN2NxUjNDTmw3QTdxTTE5WG85?=
 =?utf-8?B?WEJKbkxUL2V0NXBiNE1ITElYcDMyT1hTc3k5d2ZRYngzRnhkNnQvSVFZQ0NT?=
 =?utf-8?B?WWc5cVRUdG8zWXZmK0lPTC9JdnZpeTg1NTFTam5iOWJJV0JvRjdxcExtYVpO?=
 =?utf-8?B?Qk82VmMxaFY5aTZKUGZIVUxDMWo1bzNZNE5ySnMxMXozZy9WKytmaWtBRnJB?=
 =?utf-8?B?SWZwL2kvQjJpSUN0aldPT0V0WFZKc2dkc1FtdjMwRW5UT2dCc0JjZlVXeUpt?=
 =?utf-8?B?SGVJZ1ZtSWszUWdFNmRTc3FpbE5oWkROVEUrQ1JoaGJzbVdHR005RFpCb0lQ?=
 =?utf-8?B?RnZtQ0ljT2xNZzJ5ZXJuRUpkbTJhOWlOQ3lQY0pTMHo3cGIxaGRpTGV4QkJm?=
 =?utf-8?B?T1prZ0lGQnN4TloweTAwajJkL2wzOS9FclNoN0VSSVY3TXBWTDhXUVFYR1BF?=
 =?utf-8?B?OG1aWHlhdjFvQ3p4MkdLY2ZFNUdwdnJpeVB4TEF1S2xtSGdyb0t6RG1ZWm44?=
 =?utf-8?B?T1RZUklyV0xCOUVkalpHNnJtRnJqNVU5dnd3WVhyeC9tUDEzZE5wRnNoU3pQ?=
 =?utf-8?B?WW91SkVGKzZIdUQ3UFNTbkp4SE1JTW9XRVROVzFtek1MaVhGcEFDcitsbkcr?=
 =?utf-8?B?QWJhcC9JNDdzcmxVdDM2aWk1QjFnMnk5NDZKRTUveG1hYy9kNXNsdUlWM0ZP?=
 =?utf-8?B?eGwzU1FaKzJiekIxNnhsQ2R1eDI3REM4WVZUdzNvZHRVVG1rRTM3SnFVNVAv?=
 =?utf-8?B?SFhxVnhwdVA3VjN5WGVJcVlQZUxNQlgvMWZoNFE2M3AvMG85UzVNdjh0T1Zy?=
 =?utf-8?B?RXJTeUxCblg1akNFZ2crcUU2M0l5dFNsSm9PUFhBMHI3d1RCbm5kRDZiNm9h?=
 =?utf-8?B?dGUvRVdqVzQ3Yy9ta1lQdC9MUVNUaUc3UDdrTFluNnZYZ1R1WDd3eXhRemhl?=
 =?utf-8?B?MnNNQU81aEx0cVNNQWlkM1Z3RUJoaEJTeDU1ZVppQ2ZuYTUyWVJoc3FhUjhE?=
 =?utf-8?B?cUdPbWdMOWE5YmxVMmdpYVhvSDc2aUZtbCtUTjkvQURubUlDeEJUMitRZkl4?=
 =?utf-8?B?UWVJczd1ZVNNdWJlOTJQbVFvYmMvK1FhUmM3ZmV5d3VJMjVaY3N2T2drKzMw?=
 =?utf-8?B?RDREQjNkaWpXTlM5RU9maFN6cWU5c2dtWjgrYjdYZTcrSTRRN3FNMFNhSHZt?=
 =?utf-8?B?OXBFdndNM3JaR3R5ZGxveklxd3JQU0xlYTg3TjFwbFhxeks5UjNPOHhuVXp1?=
 =?utf-8?B?c3dxS2ZZK1lmRmhXZUo4TXVKWHZGNXNMbGtzLy9xWnZoazlPVS9FV0NaQUVt?=
 =?utf-8?B?QlR3UjhGZ0NzR3p1WFBzdzl3bWlxanptcTlNcGJXeDdDRnN1NVhJUkRoZFpX?=
 =?utf-8?B?RFY2WVFFSzB4enM0NE9rTzM5a2tONEljTXdYRjRGVnNsbFRwWmxZLzNOa1Bo?=
 =?utf-8?Q?OPE/8B4fYI4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNNSVczZjZKb0FLWDJKU1dkc2ZjSEJYRnFxWTJ4cDJta3hTYjAxc0NxckdN?=
 =?utf-8?B?K3FISHF2T2lYbVRTdytFWnE4OU1XYW95a0tlZE1tWWIwcktZTHZJL1BkM1lw?=
 =?utf-8?B?cTYxaUx6emF2OE1aRENvQ08xaVRYN0xhZ2FTNFdJRElIbVNjQ054aWJ1eVZo?=
 =?utf-8?B?amdTbE1UVjZqcFhHOVVINy80WDZqUGNVNzhqWTkzTjJrY2FBQTMzblU0czRX?=
 =?utf-8?B?QjlOaXd3WHFqNmpUUTF1RHpNS3JlRVQ1L2QrOFlSdTVQZXdLTUVzSGdsZ0xx?=
 =?utf-8?B?UjdZSDNtT1lwV3Zsd25wc1NYZHVLNUQzelZhWUVxdHVSSitRRG5tNUZOUlUy?=
 =?utf-8?B?WGU4NmNhanFzVmZTYnhNOGp0WGpZdTIxazNDcjMrZlNrRHVPVGlFZjJuanRU?=
 =?utf-8?B?eEs0UzRoSnBnMmFGVTNoR2tJc2lVUWZXZUdPQWIwREdNSVhEWE5PK3hrZ2hw?=
 =?utf-8?B?by9UWXZzSXVXcW5PUk9JYmFCWUtLQ2xnUFpyaGxtSkFGaVdHMGFOamRPOGRW?=
 =?utf-8?B?bTc1TFQwSHVPN2VNSU5sdGJNcU4zMnpRYW1scnJaRFRDR09aSmU5aXVNZGJG?=
 =?utf-8?B?V0pJOUxmRU9XOTV2MnJNdDBBeDU0MVBjN1NYOGNIazlhVnZRcGxtU0dOWkFB?=
 =?utf-8?B?OE5NMWppVjNMR1AwQkE5SHl6QU4yV2FKUmo2N0FucXVGc1dzMnZsR1oyZTdt?=
 =?utf-8?B?ZEt5KzBxUmJYdi9ybG5wWm1CWVdWOUdHZVF1cVJxYklJSk5RSnpQVWFPay93?=
 =?utf-8?B?NGpnd25UZnlWcm5KNUhPczZTdjBOUTBGNnNTSGhTcnovcUlCT1hjem5vYldv?=
 =?utf-8?B?R2todkQvOUI3aEJtdkh2bzJacjNvYjJITm5tY1VWWjNqYjd0bVhWeVk1dmJF?=
 =?utf-8?B?Ym9acGhoWEJCYWF3VEhjNWlWZUVnZXI3MlN0RjcyQ1BTUjV5U1o0WlVZV0M1?=
 =?utf-8?B?blhwa3dUMWFqSkhEdWxCZWVrYnNJcEM1LzZFdkY0RjNHT3h0bVhDcUJIOUNn?=
 =?utf-8?B?aGowcEhGRmhqNVNUOWptbHM0TTk5ekRvV0VGc25ncWxlM2hsZWNCVnJubERm?=
 =?utf-8?B?WVlva2EvZzZJTmtmT1hqNkQvUGsvSWN3RkRaeEpmRjROdnhETER3a01Danoz?=
 =?utf-8?B?TEo2OTRoSHh6dUZER2JIWlpkYk43dWkrUEJtRDZjTHJocUhFRysyT2NwWnVs?=
 =?utf-8?B?UGhSR1U0eEZMK1d2WGFwTThNVGRZeGg2Wi9oeG5td1dkUDBGTWVaMjJrVXpj?=
 =?utf-8?B?ZHNnZ3dhZkdmRFlKSWQ2MTFCZHhEaDJwNzBnZVIyVkJIcnZ4enA5UTBrTFZI?=
 =?utf-8?B?ck1GaDFLeWxzcmhWaXM5UllZTXpMWTJQYUtWbXdEZW9odERGN3FZc3JaQ1lw?=
 =?utf-8?B?blhkTnRZVEpvVUpjUlJ2MlBxRCs2aWEvajZYaXl1MlIxQWpRZHVvWUxtbjNy?=
 =?utf-8?B?akR4c1N1WkVGYmlPL3JYMmFOUXBmeTc1enZMdkp4WEl4cytnKzJ0eWxTamNZ?=
 =?utf-8?B?QlBUamM4SWtxaSt1VFF0N3Qwa1RiU3I1MTJKUUdMVStqRURYU1M3cXhDczcw?=
 =?utf-8?B?ZWtXZWdkSEVSYStZcWtZeVJUVmE2L3JaMEpZTmRzdlA4dFFxM0d2K0lBWWxW?=
 =?utf-8?B?L2t1ZGtNWm5DZEhSRGFyZHVRR1FPVmtpRzJIRnNkV0VnMHNNOGd0ZFBDNzBt?=
 =?utf-8?B?cTd1NnpsOER4bEt6bUNnVTNsRWhiYzd5eno4UEliK29RYWNtdW1ieC9sWVFw?=
 =?utf-8?B?R1BIL0xONEdjMlUyVVR3aGNwZlQ0cnBRKzlvVFhFU3RVNlNXVWtFbGxMVnBL?=
 =?utf-8?B?K29nU0QxKzNhWGw5T3VZVEFMUkNxOGREMTFqenNFZFhvdkpuaU1BaDR3eWgv?=
 =?utf-8?B?QTFUTDYrYWpOMmdZV2U5MVFtNEdnWEY0dE05RGRNWDlXMjNnd0lvK0hua1VF?=
 =?utf-8?B?V0o2VjRqVTJQY2JIcGhFNGs3aG5lcFJyMThueFVacWZtK3JGUEtJNS81YmVu?=
 =?utf-8?B?NFdlRDNvNjdoMjNsdFhRbnpEYmRXYXdqejlHZkRpRitmNVRCakphZXZlMGJp?=
 =?utf-8?B?VUd1a0h2UGI5VVpYcFlqQ0JKRVRBcXdXVXBmZS94R0lZbFU0MFplRWNOcFJr?=
 =?utf-8?B?WmRob094cTl0MWprbElpMDNqSDJxVXVUODRYTGdpUzI4YkZhQnZLbkJuSmQw?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ae8495-b326-492e-22ae-08dda9d981d0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:49:41.0424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgodTj1NO2BAWyXGLQ8M5h8/oghpIw6TDR2vzkBRwDE4PfDxx3e7dCBr0K/eGfMJ1Srm5hQ1HifNd+jM/1w/hg13eT7ACJM1+ycKe9K9V20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5068
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

On 6/12/2025 7:32 AM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Harrison, John C <john.c.harrison@intel.com>
> Sent: Wednesday, June 11, 2025 4:57 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Intel-Xe@Lists.FreeDesktop.Org
> Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
>> On 6/11/2025 3:04 PM, Cavitt, Jonathan wrote:
>>> -----Original Message-----
>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of John.C.Harrison@Intel.com
>>> Sent: Wednesday, June 11, 2025 2:06 PM
>>> To: Intel-Xe@Lists.FreeDesktop.Org
>>> Cc: Harrison, John C <john.c.harrison@intel.com>
>>> Subject: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> The GuC has an option to write log data via NPK. This is basically a
>>>> magic IO address that GuC writes arbitrary data to and which can be
>>>> logged by a suitable hardware logger. This can allow retrieval of the
>>>> GuC log in hardware debug environments even when the system as a whole
>>>> dies horribly.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> So, this is basically a new modparam value that redirects GuC logs to
>>> a specific IO address?  I take it guc_log_target = 2 is the default value, and
>>> guc_log_target = 1 would print the logs to stdout, then?  I'd ask why we
>>> use 0 as a default value and not just default to 2 all the time, but I think I
>>> already know why (we need to guard against guc_log_target = 0 anyways
>>> to prevent printing to stdin).
>> Um, read the patch - "(0=memory [default], 1 = NPK, 2 = memory + NPK)".
>> The default is zero. And no, nothing prints to stdout. This is about
>> hardware level debugging. It has nothing to do with stdin/stdout/stderr.
>> Those concepts do not exist in hardware nor in the KMD. If you send the
>> GuC log to the NPK target then you need a hardware debugger (JTAG, etc.)
>> to read it, as described in the commit message.
> Ah, okay.  When I read "This is basically a magic IO address that GuC writes
> arbitrary data to", I thought that was indicating that we're writing to the
> in/out/err IO addresses, and that the data being logged "by a suitable
You say "the in/out/err IO addresses" like there is such a thing. 
In/out/err generally refers to stdin/stdout/stderr, being the default 
first three file handles of a unix process. File handles are not IO 
addresses. Such file handles also do not exist in the kernel. And they 
absolutely do not exist inside the GT hardware. My comment was referring 
to memory mapped IO addresses, i.e. hardware registers. On a normal 
system, there is nothing connected to said hardware so the logged output 
goes nowhere. However, if you have a hardware debugger attached to the 
system then it can trap those accesses and record the log.

> hardware logger" was occurring separately.  I guess I also thought NPK
> was a writing protocol and not a hardware address.
NPK is neither a protocol nor an address. It is a block of silicon 
called North Peak, also known as the Intel Trace Hub.

>
> It didn't occur to me that we'd need to directly write the logs to the
> hardware logger in cases of catastrophic failure because we already have
> methods of streaming the logs directly via the serial ports.  Though I
> suppose that we're talking about different "logs" at this point?
I don't know what logs you are talking about. This patch is quite 
clearly only talking about the GuC log. Which is generally accessible 
via debugfs snapshots or as part of a devcoredump capture. It is not 
ever 'streamed directly via the serial ports'.

John.

>
> The reviewed-by still stands.
> -Jonathan Cavitt
>
>>> I also take it this is modified on boot by, for example, writing
>>> "xe.guc_log_target=1" to CMDLINE_LINUX_DEFAULT as a part of the grub file.
>> That is generally how module parameters work. You can also set via
>> modprobe.conf files as long as the Xe driver is a module and not
>> compiled in.
>>
>> John.
>>
>>> Yeah, seems good.
>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> -Jonathan Cavitt
>>>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
>>>>    drivers/gpu/drm/xe/xe_module.c | 4 ++++
>>>>    drivers/gpu/drm/xe/xe_module.h | 1 +
>>>>    3 files changed, 9 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index e16d19b44bcc..9c0e3113f7d5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -35,6 +35,7 @@
>>>>    #include "xe_guc_submit.h"
>>>>    #include "xe_memirq.h"
>>>>    #include "xe_mmio.h"
>>>> +#include "xe_module.h"
>>>>    #include "xe_platform_types.h"
>>>>    #include "xe_sriov.h"
>>>>    #include "xe_uc.h"
>>>> @@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>>>    	else
>>>>    		flags |= FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>>>    
>>>> +	if (xe_modparam.guc_log_target)
>>>> +		flags |= FIELD_PREP(GUC_LOG_DESTINATION, xe_modparam.guc_log_target);
>>>> +
>>>>    	return flags;
>>>>    }
>>>>    
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>> index 1c4dfafbcd0b..fc8c681819b9 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -21,6 +21,7 @@
>>>>    struct xe_modparam xe_modparam = {
>>>>    	.probe_display = true,
>>>>    	.guc_log_level = 3,
>>>> +	.guc_log_target = 0,
>>>>    	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
>>>>    #ifdef CONFIG_PCI_IOV
>>>>    	.max_vfs = IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
>>>> @@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size (in MiB) - <0=disable-res
>>>>    module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
>>>>    MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>>>>    
>>>> +module_param_named(guc_log_target, xe_modparam.guc_log_target, int, 0600);
>>>> +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=memory [default], 1 = NPK, 2 = memory + NPK)");
>>>> +
>>>>    module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
>>>>    MODULE_PARM_DESC(guc_firmware_path,
>>>>    		 "GuC firmware path to use instead of the default one");
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>>>> index 5a3bfea8b7b4..4d978f6f26b6 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> @@ -14,6 +14,7 @@ struct xe_modparam {
>>>>    	bool probe_display;
>>>>    	u32 force_vram_bar_size;
>>>>    	int guc_log_level;
>>>> +	int guc_log_target;
>>>>    	char *guc_firmware_path;
>>>>    	char *huc_firmware_path;
>>>>    	char *gsc_firmware_path;
>>>> -- 
>>>> 2.49.0
>>>>
>>>>
>>

