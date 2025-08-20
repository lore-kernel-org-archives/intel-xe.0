Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F7BCA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 20:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A20E10E7B6;
	Wed, 20 Aug 2025 20:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apjkAz+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F326310E7B6
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 20:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755722580; x=1787258580;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zTTPeFcmH3GZ+7SGBN7tHCsp5Hi/L9fPnmUVCoGfe3k=;
 b=apjkAz+SuEA8JD9vqYc1G91o3/Bo+hnixSLZlnZ+I+aH0e2pwmrMWExz
 jgcpCnIZER9NjW9TBtYag7j8ftX9B1ukBap9YM77qOecivpPEjf8dquxq
 Vkm80gVvkcAH6sfK26dwz+IbXk8huu2I3Ehhe/a4u13wM5UVOybcD3BC+
 mTrs8cUSTU9yOfFucsyPXK/XzcOjiePy/NPX1ae9oih+0cFaloAr/E2u5
 pBmRmk8NdKub+UBzKIi8yIgNPXJHic92j6Ig+ire8i0HgeiuZ8giSwKpE
 Bs9No21UMBLohsM1fYrzWuq3+CvmO/GatZsUJ19q/OZRG9EVU1c/Ug2FP A==;
X-CSE-ConnectionGUID: eZ2b/ZLpRz2x0SgrSmJdUw==
X-CSE-MsgGUID: W1PijPMrRnqXFKTA2eeiFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68270365"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="68270365"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 13:42:58 -0700
X-CSE-ConnectionGUID: WkWHMc+VQ9GonIJRrcljmg==
X-CSE-MsgGUID: +9rpAJJBSuCBCtkClzkqOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="167837983"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 13:42:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 13:42:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 13:42:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.55)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 13:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeltOsPd0I5yrw20QbvkaZgForC7rdxYzHumhYO5OvXs5N+6sFhZK4Wjldkysy0IRZVQEXgrtDFPSrthxLldSJ0eMS93GstWfXv8srGoDKqyXxtJ+x98kA9y5AZFIIKxgOS6/79qZ7ZJgWdz0MjkoSsQijvrWcaKa2AdYjMNreDBTKtrJ81cXRMLDGTdjvb/L+ta3jcYaaasQuFIw05bzt1Zod4unlwdV/noCn38FlDbqGH0y+Q20pRjEI0qK1N34kt1SnjoRYBGfTZf52S9n4smIiseIRX6PTXZ7SRMZn3yTqTyYBsHNlPDyomEW0wkCBEt/KO7CUNrr2jaNmjFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiMjOPFYlAZiT2YScOeuMk1r0XzB0F60WeqL6I8EH7g=;
 b=pT8Q9u5CzsVYs8+wpANCph9ODEA/xbT+tefDRonHCoQJ95sQPS+fslPGqvVdy9QRN12dIbqwdCZmZEYuCYrAs6AM8BFqXDwkEbvCL7m6lBKlVdVewgDkCNIhpESllL/S8V/WW2Nt6l/GUzJ8+xGjfzKtSotXQBZ8DTyQtAqrdXn9PJLgXvaZ9tHBGM2fnFiZTPoHMWqZ5pfaEyNsmISZhOf1HJ7OYCjlJzpdnXhhALM0LsVp9sqyR4HbSBxAuJ1hHwqnTSpNGeeyRlP1oHU26B2XYwgluC8tMY3qno7ybu4nma794ogF/3LLmW7U+6p4t9MkJfJmOK6w7pLXS/wwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by CYXPR11MB8689.namprd11.prod.outlook.com
 (2603:10b6:930:d8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 20:42:53 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 20:42:53 +0000
Date: Wed, 20 Aug 2025 13:42:47 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <prashanth.kumar@inte.com>,
 <dnyaneshwar.bhadane@intel.com>, <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v4 05/13] drm/xe/psmi: Add Wa_16023683509
Message-ID: <aKYzR0l0NIhtiShu@msatwood-mobl>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
 <20250818-psmi-v4-5-a330783ce1c0@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250818-psmi-v4-5-a330783ce1c0@intel.com>
X-ClientProxiedBy: MW2PR2101CA0035.namprd21.prod.outlook.com
 (2603:10b6:302:1::48) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b41925-db0f-4850-bbae-08dde02a22a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2I3ZExHYnVwWnJ6dW03aWJYVUkzN1RCckZrR1lPS3hWK2VTNlZ0Q2g2UldI?=
 =?utf-8?B?VDdjamVmeXFPNjB5aXdBdHV4N0haSHBJdXgzQXRiNjMzUkc4dEcvcTN5cjlU?=
 =?utf-8?B?SVRQcGV4VTd6QmtBdXA3RXN5YXlpbFIxdGlUWmc5R0tudEdZMGhzQ0kxRWV0?=
 =?utf-8?B?L1F2OUJrZEV2SWdWQ0VTNWtLdCtwc0J3a0VvSGlyc1dFZWhVdi9OcFZTL1RP?=
 =?utf-8?B?VVIrZzRna0E4Rm83RzhYRlg1YitOaUlVaXhtWnA4dEhCeVJ4ZVg5OE0wc1NL?=
 =?utf-8?B?c3ZFV0xEaENhMGpxcDdEa0FGbHo5R3NqR0JsSk83Y0tzTVVvS2ZPa3BSOVBD?=
 =?utf-8?B?ckdtdEpremtMMVVySXJWMEtnRCt2cnlwV0JQZ3IyMFBSdmdaR3lTWWFJdDMv?=
 =?utf-8?B?M09YVWFoRzRRRkFJUlhWc1U5a2RPVkt1TnZoYzZPNlY2ckhxTzk3OGkxMGww?=
 =?utf-8?B?UHlKWGlWcFBTbXBmenRlQTdNYWVnejdGMG9jUFhzUDJud0RiZFdkZGVyNGE1?=
 =?utf-8?B?RTA5Zk5nUlRMY3hJclp5ZWZTSGE5akRISlZMRmdrcE9LWHM5UDl1M09DaDdM?=
 =?utf-8?B?TW5zZWVEdnZXVHJxMCtnRnIvcFV3TEg1L0dFTTR5Y2YreWlPN3BrWitxblY2?=
 =?utf-8?B?S3hVTXZyNkxxS25wMkFVc000M1dsVTd4MjJjSmpqMktGY1NTN3JPbnJHMkNH?=
 =?utf-8?B?UzF0ZnB4Q1duQjZvWjF5d1JRN1hnTHFPWTZZTjgremc4cTRiUE9TRTBqWFZP?=
 =?utf-8?B?c1I4VXlMWmc1WkVYcTQxZUVMVkVVTU90S2ZKMUlQVlplZmtMMGdvcUtmajNO?=
 =?utf-8?B?QmRVbVJSbVYrZUhDM2VFNkJMMVEyMHBWdC9ncDUrZU1nNTZkRWM0TXlEVEND?=
 =?utf-8?B?Z21EVFBvUzlzT3NPb3dtbHJTUWJwd3BNclhsNTVUU3dCRGhTYk1UeWZYRjVm?=
 =?utf-8?B?YmtMOWlFK1dGZ0c5YndvT2k3ZlQ1cG5uMVF6OHZ6UVVmS1JKUDBaL1lldnkz?=
 =?utf-8?B?WWk4T2dmSENITkloazMxb1ZzWFJLZUNlL3BFMDR4SHBFUEJlMDQ5ZktLL1ZX?=
 =?utf-8?B?NGtaRWpoTS80V1ZjQjhwR0R6Q2dsbVpEeDU4QUNPOFZqM2RpWk9CcmZFRVoy?=
 =?utf-8?B?SjdhRExXbUE5YUhqcUsra2VtOFIzOWQzdEdidXdoSVJZaGlmUEZFWnk2dEZE?=
 =?utf-8?B?b3NsQ2hxM24zZ3JUOUtRRE5MbEQva1dHaG9pdldBMnlCcjU1UTIzcVcxZnZX?=
 =?utf-8?B?MVhEb1FwODFha2pFQjhwU0J6Nk1hYVJqQjVIYmlDVmdGZ0Nzb3M5OUIrcExs?=
 =?utf-8?B?d2VlSDN5WTkvOVBFdXYyRSt5bW83WTl6Z3cvZzdSaFZ0MjFIWC9QZTZVa1I1?=
 =?utf-8?B?ZUhqT044K0U4ZFB5WDdONjF6RG5UWDZvcGUrWWNxQjdFd2dzTnl6RUpldFlC?=
 =?utf-8?B?ZE9nNEFRZDVvOVBFZDl2Y2ozdFR4QnBXVzJickt1Q0JJclVTM0JGZXcvTEVU?=
 =?utf-8?B?cWovR085TFNZQW5Pd2hibEoySlYrK1NXeVMzUU0yZGxOelAwRjkyenpUQ1FP?=
 =?utf-8?B?MmE1akdsRUVMb2lSNlM1SXlqbkVMM3VRK3ZzTmxOcG1LOTR6WXJVeTQ2MDdC?=
 =?utf-8?B?TXVsY0gvZkM0QitYUXg0Z2lFak1IWGUvbDFSd0dQNEJyYjJkb2dKWEV3TDBK?=
 =?utf-8?B?M1c2WExWSUxHcTY3VFVCb0VZNTRhd2E4TC93OFNrelBrdVVVYk8xQ3Nidis3?=
 =?utf-8?B?M3YrOERUU3dJOExWYkpVMVJTQUdpTTkzNkE0RzNuMHFiQWZqcUVqZzh1YnBs?=
 =?utf-8?B?L2FPNWg4Yk8ydGhNNEloZkwzcElSZjE2MXR2UDM2YmEvK2U0V2s4ZkxmNDFo?=
 =?utf-8?B?RnFVcVdLWEdZZjgyQVllMkQ4M1FvdkJObUJ2RnRIRGM1M090RFBQdnhsOTIw?=
 =?utf-8?Q?0ZK3J4NJewQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUhzRlZWRGJJNEU4NjhPVUZlSUhMbHFvQitHQ2xWdDlvWVN0a3dhOEFMZDVO?=
 =?utf-8?B?Q1pDVXB0NGJrc1VHY1EzMXV2WkJrSTd6UFhDeVE1NkthR0tGazMzUXpSajh2?=
 =?utf-8?B?VmVabkt4di9iYUJoWDVXcUEveFZoS1MyRHQxTXVjemdRTFp3eVdNbUgrcElO?=
 =?utf-8?B?RHhQb3pOa1BjOTIvUzkraEc1SFVOb2lrWUVSbFczS0plbi9QbWk5LytMejdB?=
 =?utf-8?B?Q0VQNlB1b3UrRUlrSFoxWWpZd0d1ZkhYb2FLNnBtaXN6b0ZvaGVRM25XcUtS?=
 =?utf-8?B?QWpmRm1IcVF3aEdNeUx2Nk1hTHNVRlZXcER4bGJYMnZQdWY1dlBOSTZVT2tE?=
 =?utf-8?B?K3VlcGVjTFpuT1Rma2RIMDFpbG1aa1lRd1ZiM0FDS1B1MFFyWkRPNDNUa0ZU?=
 =?utf-8?B?WG03YTFEU3ViU0RaOHRtdXpLMkRZeDRZS3VUNHVjN2U1SzMwK1MxNC9hNDZK?=
 =?utf-8?B?TUdIMTVPY2VYclkvYmxOdHlMYzZrNHp1T0FiampOdEl1UjV4c1RlUWprYnc5?=
 =?utf-8?B?WmREK1pYNlVVL1Y0VTgydkhmUTdhQ1EvQ29kWWhxOUlLdmZkbHI2a2IxazA0?=
 =?utf-8?B?T1VFdmFLdDFVQmhScHU2ZDNRdTJQeGtTdVp3dHgycy9rQ3hJUGRMb1JLZnZt?=
 =?utf-8?B?YzJJNjVrMGQ3TVAyZHNHODZyNkNVOG5MeGdsQWEvWlduOUQ5L2RKT0hBOUxB?=
 =?utf-8?B?VVJCcjlsOUdLWG96WnpZUHc2cmZzVWlkMVFEaXByY1hvb2g3UGd1bmdCWXVZ?=
 =?utf-8?B?bzNIdysxZlZEcE9WcWhxMFJkUUdRVmdjZ2pIV3pYM0d3M3FKUFNXTWpBczhI?=
 =?utf-8?B?ZFY1bCtIcHQ4Tmp2ZWJWVGRNR05aclJWbUNaZlptL2M1WWJTejZVWGJ4c1lZ?=
 =?utf-8?B?RjIrM1NnRTZ1Si9Na3ViR1dMUjh3UUpkbDIzUmFRS28yc0xQSE93OXBxUmJ3?=
 =?utf-8?B?a0FGRURHdEo5WFBmRndwZlIvSWRkK2UyNXFabUptR3VvclRxNTZrT1d5dDdP?=
 =?utf-8?B?eUJialZVOEx0QUFCZ0p5NFNNWTFTUkw4TjZKbU5KS2xMMTZtemk5NmtOVDJZ?=
 =?utf-8?B?TEZKQmVFd3lHR0xrN05tYVo4MXBBeUhOTkVHcEVxSlA2bjMzdlBLamNpMTUz?=
 =?utf-8?B?OEpWYXhTQnRWWU5NZDh4UGpad1NOaWpXOGlURThqam1rZjREYmU1emFTbnZu?=
 =?utf-8?B?SWtDSWlaSThqTEZFVnhTSmRTQzFhTjFmT2RZZUZQNyt5TldiNkNYbkUyNHpm?=
 =?utf-8?B?SUh3cEJ2TFVYWm5WMWRPbll3TmpzeHF6Uk9sTWVISzl5Y2F0d2dHNG1EczlN?=
 =?utf-8?B?MkZuZlBPUWVURGpYTWN4czcxaHpIcFJKaHR6bHZzbS9rdmpESHh3aFRJRFZK?=
 =?utf-8?B?ZXRxbS9saE0xUWIycFdkQjg5cno2VTRNTjY5Z1BQakxNVnZ1Z2N6MVYreWhn?=
 =?utf-8?B?UnJIcUhsSEdOTnNiMUtuKzByZGd5THZqK2FTWG1LcURRNDNmNkFlWVZweVJk?=
 =?utf-8?B?eEZMaFFJY3Q1akcrOGd0cGpLWWpxUWJpQ2xlSHZBNHRwU25mQ1RLUFAzYlJJ?=
 =?utf-8?B?aXVnR2wvcldPNElFaTB5ODhhL3UrTjNkOUFZMW9wbTZEc25mbDlQOGhxU2FI?=
 =?utf-8?B?M3lOR2FWZm5VK1RVdlZMay91dUNTT2lDRG9ieEhCRnFVM1kvV3NFMUdGZnBn?=
 =?utf-8?B?VEJVUWpRWWZObnNtc0VXU0FNR2JvVVlHL2ZUVDE3STFqSTQzTGc3Z2tBMGR6?=
 =?utf-8?B?dlN1ZEU1ajZ0eEhvTG9xUE10cUJPYVZZYnRwVmRJT1U1dU5PUVBrRnNHdCth?=
 =?utf-8?B?N3BxZTlEYTJlby8vdERyL1ZGRlVMd0JDbmVSUDczQmZuSHFXWnl6ZTVDaVlC?=
 =?utf-8?B?MU1NZE5ncWJTSzhZT3grM3ZHeitOVmo4Q0pDSG5kS2lxS3BmWXpvNE1HeVNh?=
 =?utf-8?B?MWZ2dmY0QVBDQnJBRGxxZTl0UVhCeXNmMUY3eHJmMmJzUnMzR1NweFlRQ1FS?=
 =?utf-8?B?RmFzL2hkdXA5V3dod2dHMzVZajRFT2g0MHBtcEpyYkc3NjdEK01LYmd5WUR6?=
 =?utf-8?B?NDZDbXZ2YUxRL3N4b3p1KzFlcVg4N0Myb1FvakFFNnhpTTBDK0p5M3JmNExh?=
 =?utf-8?B?OXRwTHZoM0twQmdZNGVjVkYvUnBjd0k0eUgxa2VDN2J4RFFaYmxmZEQyMktF?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b41925-db0f-4850-bbae-08dde02a22a8
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 20:42:53.3046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qTYUU0GbjEbhjvpp0htFCBzSMljf2/RGubilH6tVAaVwkCr8ATNt44kunekVG2WMsEuP7nO3Z9o+rW7q8TH91q2ivbYI9/ICxVd2TGkxo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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

On Mon, Aug 18, 2025 at 10:37:30AM -0700, Lucas De Marchi wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> This WA ensures GuC will restore the media MCFG registers at C6
> exit.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2:
>  - Enable only when PSMI is enabled
> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 3 +++
>  drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 883f700e532a7..37d06c51180cb 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -219,6 +219,9 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_GT_WA(gt, 14018913170))
>  		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>  
> +	if (XE_GT_WA(gt, 16023683509))
> +		flags |= GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6;
> +
>  	return flags;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 400004f1838a0..0508f1064178e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -108,6 +108,7 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
>  #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
>  #define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
> +#define   GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6	BIT(25)
>  
>  #define GUC_CTL_FEATURE			2
>  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 303a5e05d9932..fe369e8a01012 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,6 +72,8 @@ no_media_l3	MEDIA_VERSION(3000)
>  		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>  		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
>  		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
> +16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
> +		MEDIA_VERSION(3000), GRAPHICS_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
				    ^MEDIA_STEP(A0, B0)
MattA
>  
>  # SoC workaround - currently applies to all platforms with the following
>  # primary GT GMDID
> 
> -- 
> 2.50.1
> 
