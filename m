Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6892CC02196
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 11:31:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1601310EAE5;
	Fri,  7 Feb 2025 11:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJkyjn0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E8C10EAE7
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738927893; x=1770463893;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=YJbZeHu3Vw/3Z7HZ13xM3uGEDbMrrlhJ1hJuBTZlrAE=;
 b=jJkyjn0orUOSzf3sMvwR6mHQXagqDaENTQRyP7S2n6dzEv80QCZjo8EH
 3wZ9MypESuzZJJ7T1RTzE+0SVEYxX6OMzGpSt+luEMdNgjFD2SzL7mOBJ
 6odZSm8MZGjmDNUivY5NojLc7zX7fvEBFNLBr3plsgdixTkKtsIQAnZ+X
 ZAaoMB+5ghEAbGHwpDUsODN6oc5x7N1GGF+Ex7j1ay5ZG3SgbpkvYvCDa
 tVMb/7Hf3z53KwwquXLdIkk0ITFgJMaap7Grwl34i+g2JhM4D/f5Q0ffR
 TtVkWNi4aBetZOBnCEY0hvX1ZuAxcwjncTv2YqBhflwAsTOKoav4qhnNZ g==;
X-CSE-ConnectionGUID: 9twITrzVQgGdK1CNKSjapQ==
X-CSE-MsgGUID: YCAFapwUSvesndDBK8J8aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="62043177"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="62043177"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:31:33 -0800
X-CSE-ConnectionGUID: E4bTXL8+QbiekYHZmbEfog==
X-CSE-MsgGUID: FoA3dClhRpaaf8zT/DVQgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="116504187"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 03:31:33 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 03:31:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 03:31:32 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 03:31:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERdGV4L+CF4dcRXbkpsn2AsC4tEWi56fo5fBFaJngcuxb+rnk7RgjyPgPq16us2j8PNVg5ReTmJScohiMn38S/SWGsWqez9HdCUY6wZ68/XFguy1ujuUnDx0SW2RKywxgNBQwIjWzT5n3cmcI26hc8Cw3g06KyJf06wOaHyGYUlvXKwZGC3akmA/6PqjvUkC7YdqmfWEZcIqm7Kz/pIECmxPsyS8ZUi4Zk2pt+rwPcMUVWTmLI1CRSzOoQE3VqKZsCtFWjdaRFjzwf7BUy2PIdydwxpZUi9/MEaVyo/6Ymjb34hvW+e9kPqcVhrq0jImy+8zyl3kYHKDT422W+RoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOf+TIb8wPGvovVRTSi4qUBeEl3yCCQzx+AegNgEuzM=;
 b=x6Nid1PWfI7xkgR94Wb2KALLLPV58Z+xVxiToBumb7BxY6ZrGU86tmNqJuTHB4I2tOsq3bM/cKYMd7uiGkoGZnFie7twdBErqnt9MvO3cPiVn7jf59kY2A9IppU8HXLd6sroVDX2uv8hjc1SfJislv417dJqWu3uXC5aTq/ghFILJTUL9uZWCiztLDS2RIj3GxOSgvMJZ3Tdvi2qPU4fv1VY5B8FybBMNAuJoj/H460xqe6kQgU9ntC7Tu1w5AjEhXOJmprkDvvW/BiMVEO10gEoS87M0V0pKxkjIsS7UlmAd0gvmPr+oay2ncFviIMT5wco1zdzMgkfufPKbDcsOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.12; Fri, 7 Feb 2025 11:31:29 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 11:31:29 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 0/1] drm/xe/pf: Use an explicit check to see if the device
 has LMTT
Date: Fri, 7 Feb 2025 12:31:10 +0100
Message-ID: <20250207113111.853821-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d6c0a95-f9bc-47b6-2a61-08dd476af730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkcwSVZieW04VmlyMDBCak5uVVlZSlorRDFlRXNDQkFPOTFNR0tyTk5CT01Q?=
 =?utf-8?B?L3NLNnVoUWVEK1c5V2hxQzM3Q3F6dERLV29KZm8rZTdwbCs5b3hNWGZyUXVS?=
 =?utf-8?B?U2gxa2FBczdleEZTMlpudm5ScFB2eEZPMFV4cS9QaHBpL3ZVdU1KQkoyQnhm?=
 =?utf-8?B?OWRSYmFHTS95WituWHlKdHkrMVdDWXZWb002L1R5YjhUZFNvZW9laTkvbGhu?=
 =?utf-8?B?MStDcGdNYm0zakkwWnFOMzJoS0pRQlRzSXNYZjhGRExJcXBQL3pMaHk5Z2Ji?=
 =?utf-8?B?anI0MmJCWURCbEJJR3NXVG1Vd0o5Qy81WFo1Q0hVUHR0MkhadkhnTmZuY25J?=
 =?utf-8?B?WnFPeTY2ZWMzN1dxNktMbitIKzNKN3pISFFJTDV6U3RER3dQMHBIbi9KcEs1?=
 =?utf-8?B?YVd6RzByeC8vT05KSWZ5Q3I2Y2RrUzU5c2o2eTlnVUExa2h5WkdvbDE1TURt?=
 =?utf-8?B?aWRuMWZSY013QUd3UXZBbk9RN1MxMklPR2x4NGc0M3hkdFZCcWJpd0JabmYw?=
 =?utf-8?B?elFqNzVFRzBMOE9HMTlPRmg2NXZvTEcxd3I3WGhJN2FpbkhvcHIrS1M2Qnhs?=
 =?utf-8?B?U2lkMC9PM2RHTk9Nc1ZrZjRIVzRTVUdKUi9JRUd1VGJMODZJUHlUR3hTYXJs?=
 =?utf-8?B?UUdxdDlTZ2dBVGhtYnhHclFiRTJ1V2ViWjd0RjhncWxqb2tNcUhRWW9uYjZR?=
 =?utf-8?B?Rk14Z1U5dE5VL3Y1WU9ISUJ5MTA3QVE0QXJzR055b3JKSmdTQlJ6WE4vMEJr?=
 =?utf-8?B?OC9XQXNxNkIvejlMR1RuelFOWUJmQnVza3Z0UEV5NXBZbUYwdVJyU0V0cUxt?=
 =?utf-8?B?bnNyN0xvdmhVUFM2WWVWUnBXTGpOYXJzTWpEOTNjd2QzRDBiSENSR0NENzJz?=
 =?utf-8?B?MjhzemtCNTQ1ZCtWSWx0dEM2aHVoZmVjZ3BYaEx3emtMVlI1Ni9GTWpnWkpS?=
 =?utf-8?B?V2tCTDhENWFhaXM1WG1Cb2dxL0M3YlRYV0Yway9EN1ZSVzl3U1NibDJFdWxV?=
 =?utf-8?B?dEdVMmVwcURhUnJHWVhmeklKbjZNdWExVTdOWkh3SUtBVUYwY0d3YjNjeEhX?=
 =?utf-8?B?Ylh6MFdMTGduYUVPbXRMRllJb2dCYWo4akNPUm5nNTlaYjJRQTB6ZzJhYkJK?=
 =?utf-8?B?R293SDZSR1ErT0RFL1BMOGpDVm0zbWJqZ1gxY1VnT1JGeXg2bXJQaVU0YW1p?=
 =?utf-8?B?QTBtUGZBbnpnZ3ZwRFFySWNSM0ZjZHJvYmF0RDUra1lEN1Vla3JGNm5NSmxR?=
 =?utf-8?B?N2JCVzNXcTh4SklqaEdyOVdvUzJqZUR6VmRWc3piODVKUXZTWGtBUzZQNWw5?=
 =?utf-8?B?S3RDUXZFQ3RzMUI2eEt5RGF2MkdJbjJSbXJDYlNrcXhOOGswenA4UFNaTUJz?=
 =?utf-8?B?azQ2cmwxS1VoVkZMdnlxczNEZ2FWbFE4eDZDU21ZVW54R2xuVHE4Y0lUYkVY?=
 =?utf-8?B?RWhFN0JCU21mYmpBQ3V3bzBpOHdsaTZYdUI0QUFoWFl2ekhpQmJoMVNkd24y?=
 =?utf-8?B?bC9OSUMvelNBMmhDZkxacWkxRGoyVFd1cmRacTRxak5XZWMxWWFJNHBieEli?=
 =?utf-8?B?blp5dk92bHZqTlFPWC9OSGZCa0srTGgvUUJpL3NnSjMrRERnRmZxNDN0YUx5?=
 =?utf-8?B?Mk5XVyt5SmxLNmNQM3NOOEFEcTdkaDVKVlpCTEJubWl4WGtidnFNSXdySVM2?=
 =?utf-8?B?M2xVZWVwNnZvSldHbjdQd001UzJiV1FYK01zWkhBSEorS3h6SldRbkpKNXph?=
 =?utf-8?B?MzcvNzkxL1VLaDhMcERlZCtWVnZiODVocXBRNUh1OVdkOERzZm5PWmlzTVV5?=
 =?utf-8?B?ejc2TmJJUjFhcU1TQkJ1K1ZTOG5JcDAxRXo5Qm5mYW1EemhzQmpTRmx4ZVFJ?=
 =?utf-8?Q?lbp7GHHEZs+er?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V05wVE5LVS9nVkNWMmRjRzFyUXpyUmJZMFN1Ujk2aEdwSndVaGlyb2NRUWRI?=
 =?utf-8?B?TkpEbGhVd3RhenhlTHZOK2UrbEFzOTJzd3RIZmVnZFU2WDlldFhSRVNYaU5U?=
 =?utf-8?B?VGRhZG5UelJ0Ny9lZEc3VUdWbXhOcHk3aXlEa3JnWXEyUWloSUpvTHptWWRl?=
 =?utf-8?B?Yk5oQUdFWmpuQ3dzNFFUaSt6M0Nob3prb3o0dmlhdlByNXR6cWU5dmRvTFMw?=
 =?utf-8?B?YTI3VzZqekRXRzZKZzN1SlJ3M2c5UXdBZU9LdzNJbmYvNWtRUE8yRVZKNzVk?=
 =?utf-8?B?d3h0TGJsQzc1aFY3cFI2Tys4OHU1UTN5a1huZEpRSWh4S1BkbUdzWWRvYzFq?=
 =?utf-8?B?Vkc2QXlueFlPOGd6TjN2R2NzVzZLaFFJWTd4czZrTnVtREYxMlFRbmFHNmJ0?=
 =?utf-8?B?djFQUk9IemNQUkZTazErMmx0NGc4aldPczFDWi9tbmR0VVNmNmFOaXhTTUpW?=
 =?utf-8?B?b05TaDFaMG14VmY0LzRPdVZlbUxQWFhTcUFPcWtxYVJjYzVmb3l6eERNQ1Vx?=
 =?utf-8?B?VVhuN0h0NXJjVll4NnhHc3crRjM3OUN5SUplL2d4RGIrQkJkbTN6N2loUkZn?=
 =?utf-8?B?NlJGVHE0WDNLS2tLMEV3TGwxNXdOSWpoL01lZUhPQXJVN2VxN0ZMMGVhSXVy?=
 =?utf-8?B?MHMvMFRHRnF2T2dQQ20vQ0xVRS9LZ0JialNpNk9ZOTBUSnE2d2pvQ1lwVjdK?=
 =?utf-8?B?a2h3RERlVG9LMHN4cVUvYmQyVnAzdUZDMS9UTjRVZFBqaWVnYlIvbVhMTjVF?=
 =?utf-8?B?NnFlWnNNQWFPL3IrWHBqQkpoNy9nMlRLUzFSK09FYXJGSkZ0b1hVY09FVUZy?=
 =?utf-8?B?dUFNb2NBZ292SXhwOGNXWXE5M0ovYUtvQ0hHSmkyN2FBc3dhaHFZL3U3aFUz?=
 =?utf-8?B?VVk5UXVxY3hEdm9teGRta1FtSzFNYWhHSmJmaXBhNnQ1eEtTN1FTcDYyMEZG?=
 =?utf-8?B?NWhYYy9lRTZCWHZBZWFUVlhFdmtabXRGTlNZZjhjNHRkUlozSm1DNjdYUXhv?=
 =?utf-8?B?ZWtsZjJ0WXQyRDFRMkRxZ294R1RrU0VIK2F5dlBiY2lBUk1sTDNOaEN4SnZx?=
 =?utf-8?B?bWlNUnNoMnZZRnpzdFI4ZDFxY1RIZWJHY3dRdExwUWlqV0xHaFpNTGpib1I2?=
 =?utf-8?B?MmZhdHByWjBtSnVsTitaVmRrTTBiYnM0QnM0NDd2S2ZoeEw3VVJkajlYcnFj?=
 =?utf-8?B?NU5ENlpYZi9JT1BtdWJTcHFlM1V2dGdxbS9vMERURTJDdW5TT1R6SWlJdGhM?=
 =?utf-8?B?d3A5YVBqSUtCc1pmaGNkcGJwTXpEalU5RWdIOUovRitWa013bWVPWFhBYUZL?=
 =?utf-8?B?YkhRdUlZd3JmUE02NmZlUDdZZkYyRUhlVHBWVGdLNzJRT1VpL2gzWEk1V3B3?=
 =?utf-8?B?dHk4TWZzZnFRT0NDUXNvVlpLYW1tOE5iaEk4NDNENmdkY2NFZmlrbnl3VVp3?=
 =?utf-8?B?akZ4Qlpaa3RJZmM0b2dGY1BoQ1dJeGplVy9BY2t4TCtkQlNKSFlNV2FaQllI?=
 =?utf-8?B?UjY0UHFBTHV4eUZtVFM5aUlzekRUbmJOaWYyd1dqNXRJdG1FWW9TdTkwbzFZ?=
 =?utf-8?B?NmpJOUlwT3Jkc2htQWpHemVDVHBIZW9xdEpIU0dpMTQxa2xGTURyUitoTTVH?=
 =?utf-8?B?WkFNT04xbGc3Zzk3d0l2ak5lNzFaYlJhaFZLKzE4RlF5VElmMlVPYUY4QTly?=
 =?utf-8?B?THZQSFMvUVE5NmdXNkllNk8rV3paaEdLUmkzNG1XVktzWHlaSlJmS0pDcDdh?=
 =?utf-8?B?RGk0MFhybkhTSnYrTjd6TzAvaUFEYXFtWElGZnVTUjRlTHpnd3FCbjlEWlpw?=
 =?utf-8?B?REp0V3p6TE5JL3JqOFY5dkRKK2FGejVPdlN6U3U5S2EvREtCTzVVbUNIbXVy?=
 =?utf-8?B?NE4veVVmcVNzQTNyUmg5Mi9SU1Fib3dnclYrQURVUGZRL3JJaXJSZ0VVaHFz?=
 =?utf-8?B?a2QrUzVKU2o3YWNnTXlyTHVHK003RXFERUNSRU9pMUl6eWgzaThOOS85NGZz?=
 =?utf-8?B?VTdYZTBPZnNESTFudFRuN29sK21hNkVYQndqRm15MlpnZGRTVHZCZjFYbS84?=
 =?utf-8?B?YjlhUWdkZTd3bW42YUJ0MExCMTY0dHBHdWdma1ZQY2ZaMWM0TTEzMSt6cFc2?=
 =?utf-8?B?RGlBcHNwcWtLZHk1bWRSaDhud3JDaGN1endmemozczZZcWhjcVV5VWpnUk01?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6c0a95-f9bc-47b6-2a61-08dd476af730
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:31:29.6805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzmZCEyxwNene38DJ8pjfSo/NtPI3t4cWK8TlE4MtYRbrwOoNaEwjut6Uphx2KMVlDJdFSI2yJGwXW1BD9MEDwjgxpG0QDWo2DWex8ja0Vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
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

v2:
 - use xe_has_device_lmtt only when necessary - leave IS_DGFX for other
   things related to LMEM provisioning
v3:
 - remove IS_SRIOV_PF condition from xe_device_has_lmtt (Michal
   Wajdeczko)
 - keep IS_SRIOV_PF asserts in LMTT-related code (Michal Wajdeczko)
v4:
 - update commit description


Piotr Piórkowski (1):
  drm/xe/pf: Use an explicit check to see if the device has LMTT

 drivers/gpu/drm/xe/xe_device.h             |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 21 +++++++++++++--------
 drivers/gpu/drm/xe/xe_lmtt.c               |  4 ++--
 3 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.34.1

