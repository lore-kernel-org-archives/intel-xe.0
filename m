Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1095FC7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 10:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B6788284;
	Fri, 27 Jun 2025 10:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzH/aqpE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2F810E9B0
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751018607; x=1782554607;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=H/ust9kbHF8QLXvMVu0nii9ipc8aoE+dFpDFajIpXi0=;
 b=lzH/aqpET9N+Tv77R03g3TmA8EV7LnBrrywq9kAHzleL6+xUlp3H3ikk
 o2brdp6cuJroZi7qwm/sK5ngUNsdq8xS18aIf8tpoEbxkMnzpJwitg1GV
 pPQgB9YDibEOMY139edpb3kXtYWLlNBtVyBiOBoMc+a0khKiXjGJDO5ew
 4nxr1tf5ilKPHyQQq6GrRS7SVnUQqpqsqy+tmMhigf9Yu+LSfIZ+tm2Xm
 TQgvRR6g+08cmSimgZX9OB5VFL1U4qg1O2RdJHWCh8KBls5yVED8pm2MM
 NedMioY75wwwoZmPlwdo8H343QU1pa/SvCqgZ8ID/bOHYUWCv8HelTrFK w==;
X-CSE-ConnectionGUID: rO+CE6pGQAuTX5Hp7tPH4w==
X-CSE-MsgGUID: dqbeLh22Ti+AXUFfFe22pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="57008086"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="57008086"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:03:26 -0700
X-CSE-ConnectionGUID: /P+EkTJOR4GOh4rbw0Ns2w==
X-CSE-MsgGUID: oCZOWAdSQhe3BPqLwRgG/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="152158661"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:03:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 03:03:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsW/Fi7rAFyrdGmRz++6KCknSRvrYrQoOT8MSfAMavuZFe0deZSzfn8couGvD6Xd8jsQVnA17nql7ToDM00Gj4xOVwIwuyHA2iic9i7ghRTqFbjACBE4j5wgkjgR3VYdqW4QHOMXovXuWi4/+z3ZLfP5ihGBCanyoHzRN10aTB3vzQ5FW5ZGiexN6JAcY8idG+lp1evtAmdeAwBXVXTHIAViMjUfeAQ3Fh7hNcxkp/6dtf1anP9m1sOtZJK3pGDE0qcONC78Y2lU2KJNqTKND/xZLbb82dl2Mne3hVp9nEI31eZZ+e9RvcthanUNAwgbKYoVwuDZqiHsfb88AwbQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7R4TgNEBZtNpdeQ9uj+KKYIhnY75nwuE5LzoKHPwnw=;
 b=HISOLaTlcNxiZ5aTCyI/jEr0QWLXCEqBhJHA+I2WuaOq+en15Q8s+s0O9y6Q8rZGgkYP1aJVtguNTlKLKe+oWC4gwT9KM03SDrDW3utvf2dlQNaHlmNHjmstVBbS7H5czNfR6oaJye9ojK+Cnhob33XffDVPWjFWRMPVwa1L4moa5F5oSNXp2eH+wXnzfLQVUjJ3vmF3RI8vz6NWlTBRIyHM48TJFtQKrJJSxoJULACzCqRcBY3pLpq4ziCzVrNQ74bpoU2/b9JwIRPrjIW0HmBEIaC5bqy9KXeLEvJnFk/jBh8fFdxvXntC5/zUUG374ZhrFab15IWIm4aX1JG7EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 10:03:21 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Fri, 27 Jun 2025
 10:03:21 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>, Stuart Summers <stuart.summers@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 0/4] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Fri, 27 Jun 2025 12:03:04 +0200
Message-ID: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:10:36::33) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0ff168-0db4-4196-e8af-08ddb561d8f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTJkK2pMUlF5TnZwY3NTY0o3aFZXOFY2R2tsL05WZ2t5RVhEK1JDZ0RsK05F?=
 =?utf-8?B?TE1tMGtXTEY0ZXI0eG9sRzltdnVtdW9FMllIN2hNaURTQ0VTa1ZDeHRRNWw2?=
 =?utf-8?B?amt1U2RUWkloTFdBL1htWFVCS0pYRThrVThvWUZURElNY3hrNWZQejBsRW1C?=
 =?utf-8?B?VDcrVEhudDA2UUFPR1ErVXhsVkV3MzBGaXJ1Mlo0NEJEV2pUemFmOC84WCs0?=
 =?utf-8?B?WEhHTERPN2lQQVFMdHU3TElKUThYeS93RzFJLzRlTEdHbDNwT1Q3VEd3c2oz?=
 =?utf-8?B?ZFQ2allRc0JZTzNJRFlIYW9Ec1N4aEJzVE4vTGNEZDdsK3k3NU5IM3p5Vjky?=
 =?utf-8?B?YTBOMlh0MlBjVGxYaCt6Yk9jcXpzbHNqNGk0OWVWSlEvTFVERy8zKzExb2hj?=
 =?utf-8?B?ZXp3a1lqNDR4M2lLRWswdEVGUGkwNHpvM2ZwZmk5Y09TVkFIdVdrOURTNTdm?=
 =?utf-8?B?cjVhNjZOVTREaUtGTFliTkZuU0p5U3lBTStKVy9yQlJjTE83YlhvWHRxTjlG?=
 =?utf-8?B?LzFTNEQyK3FKTGNpOXhSeUdmcy9pZzI1RkZNbjdKenRnalV4eGpqbW5obkNR?=
 =?utf-8?B?T1A5dElIWVhVRStJU29Jc2VySjBlcm1oUU5BdnpwK3RXZFpqdGdVRUxhSjhL?=
 =?utf-8?B?cnloK243VTIvaWFmV1E1cmxwenFPVjQ1d3FXMGNhKzcwUTMzSG13cFRHc2RT?=
 =?utf-8?B?NDFjYjJpT1JXcVozenI2SDNlcjdsTUVDNlJ1NFd4QWdNRk92ZS9Hc2xySUNC?=
 =?utf-8?B?RUsrVVFjTnVpaGxsNS9vN3dMRHgwak9zOTk2Z1lHZ3M5ZzhIeVh2RVZ2VTIz?=
 =?utf-8?B?VDM1TUJwMHlzcUthTFBiVi9tdE81bm9pOFZtWGxFWEpjOCsrTUhmZ2dCWWNR?=
 =?utf-8?B?THFFR1A0bmdqNTh4ZU9lTmMrQjRNdjQyVS9SNWRONnhZUUNKT3krUVRxVUtP?=
 =?utf-8?B?YVJrRVR0ZjUwdkNtbnl0QklXc3Y2aCtGcUxXZ1RXMWJJa0VQTGZwVG1Lb1M2?=
 =?utf-8?B?N1R0NEVxZ0lUSnUxK0JXUzJQc0o4cEFrRjNYYm5DaW5ncEJKSDdNMXFUTWJM?=
 =?utf-8?B?aXRDMEpKaDlVRUMvaEtiOWRNbnNnR2hUbXpCcllod25YZXBjZHlRZ3hwMmEx?=
 =?utf-8?B?bHREZkZyemtkRFJHMWhwazNKSUt1ZkRTT1Qya0xGUDZDbU80REhLN1Nhbko5?=
 =?utf-8?B?ZEpabEZGS3Q1MjVKZXdRUWJIdnl0ZXp1amQzL0pwT3ZpUFJBSTlhUW1XZWRY?=
 =?utf-8?B?U1N3QjRnV2tFWlB2NUYxT1I1MmF2azhOelFGZitUdDNoU1ZXRmFZYnVvbjdZ?=
 =?utf-8?B?aGY0NXlvakN5NElRakhMaWUxcC81TnczSExjWE1Ta2s3K1JrdmgvdFZvVmxY?=
 =?utf-8?B?WTZhZzh4OXgrMk5iQS9yMVZLL1FzQzZ4Vk1BaDBlM0Qyek1TMkx2dy9UeWRU?=
 =?utf-8?B?d3ZPeGJIbnFvb0lKWDljZFlXVTV0WncwN3BlVU05TzJjTEM0WlhZSy9TdVVm?=
 =?utf-8?B?RjBybnRnRGNBcE5JbDRjR2FUZlBPc3pUSkdaRGtiRjlZYjlaVGJHZzBJR29T?=
 =?utf-8?B?aks3eEw3U200Q3B3UWdlelJtTk9lMDZ5Z1FESTlwRTJUR3NRRWx6RTM5ZStj?=
 =?utf-8?B?ck5XcVBSaHd3VzFVWVA5ak02QVp2M2l0d0I2SkkzMmQxNVU4ZXcyb2dzOFF3?=
 =?utf-8?B?Nk55RHpxVi93eVBBMlhFdUwrcEd3Z2MzTzZxRDkyUWZuL3gwQUQyUEhpbUli?=
 =?utf-8?B?azBKSHJadDBUR3hWV1VqaHNlRVpUalRwU1ZOM2dKcjlvMkp0eTlDTXhwRUJn?=
 =?utf-8?B?NzRrUXcxUTNoc05HUjVtQ0d2NzJwNGdwOGw3STh3UVk0eERHcDlmdGRBekc1?=
 =?utf-8?B?anlxSzVoS0xocDdkcm54Tis1MUVpd0o4WldDSWJ2K2hpVXhWTUEyVWNqU2pz?=
 =?utf-8?Q?5KQbr10LFus=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?citPenBNS1A5cmxDMldKZVMrZEVLL1VDNGFyU0cyWG03WW5WYmV2ekd2Tk9Z?=
 =?utf-8?B?ZDlUZEFBdXMzcHBHRFF3cFJKaHRxNjVyVm1vSkVPZXBhVFAveFI4VGhveWFO?=
 =?utf-8?B?dTRzTGY4dlIzZElpeWZGZXN1ZTNrb2ZzZm9PRFdZdi9GdFdHY1QwR2FJR1Jp?=
 =?utf-8?B?QXVKTXZENHdSMUZiT1JGOW1GWkV3TkhJRllNcXgvRDRBUFY1cmhGdVZKckRt?=
 =?utf-8?B?SFRJWTRwTzdnT1lrbnA1eUlYd0NkekFkNXowV2FtaFA1aGhsVDRLYVNHVnJ3?=
 =?utf-8?B?YzRCMHhQTlVvMnIvZFFBc2NUUlBzZFJZRWdpYjNwVlI0elhNN1U3SE53S1Rl?=
 =?utf-8?B?NmhZSmljWWk2d1B3amNJRDFiSGdIcWUxbVpDbFMxYU5FNUYweWNKK1B6bVkr?=
 =?utf-8?B?b0FhOHJLSUNkVWZQTk1YQ3hhT3RLNFR5cFM2bjZ6d3lzOStTSlo5VDZsc1RN?=
 =?utf-8?B?SXF2ZGhoOEJSM3Q2K3c3bjRreHRQb09qYXhEZE5TQkp0UFVlb0xRbUNQNEZM?=
 =?utf-8?B?ZlNkWjc1Wk0za2V4QlRRR056RlZCcEtveTVnK0tNR1JLNG1IclJyVVFTa3g3?=
 =?utf-8?B?TXNPNnlHZlJYSjhZNTR3bHdTK0twY0VyTUhjR3VZaWlVTXpFVVhUOFpaa0l4?=
 =?utf-8?B?Q2lHWnJqRmhEMVVVbnNxWDJROHBIY2ZUQkRQQUFIQ0lGbEFzQjdpQXp6cHM3?=
 =?utf-8?B?Z1lMWVBNN0hUUU5xUnhSS2xsVFJmY0FhVHc0QTRlM04wUDBuMnAxUkRQdk5T?=
 =?utf-8?B?UEd2OVZoSlFQMzl4Y2l1ZUJpaVFqRHgzd1NVKzZBRWFhVHNwRGNpeFpLUDlO?=
 =?utf-8?B?WnA3ZFJUT3ZDYjBQOCtyTXFPa3J2N3c0V2I4Zlh5elB4eHpOTEJSZEtSMW5l?=
 =?utf-8?B?L2RObWNlNEhnODBJQlpCSUw2Tm9BK0ZJcnNoVm9JeHFHU0EyU1VwamdoRFVE?=
 =?utf-8?B?UWtKUmtqSFRYSEt1NGU1c0lvb2VhV2hVUjdtQ3lUQWxLWkxqNkZJTUo1dE1u?=
 =?utf-8?B?am9rMHNzamJkZEtTSERpVUtYNzFhc2x4OTUxWW42SlA1eXo5TGIzYll4QVNQ?=
 =?utf-8?B?RU00aFBYR3d0UjlZMmFlZFBZS1ZPblhBV0EvVUphbW1aSzdzalFqQlBONzRJ?=
 =?utf-8?B?aFplb09oNzFDSkFVaHFUc25CaUtkL3hqZStXRmxxcWZxZmhES3MybWI5bUJv?=
 =?utf-8?B?Z0F1MkhPK24vbFlmdUxqVllOMHRHclFzeklsSk55dnlxL2ZxNkpNMWRDYlZB?=
 =?utf-8?B?Z01KN25OaUNPVjl2NUdqVHhLN1dadUFDbUM2M21kOXRuZnJIbU1XNHJ1b1B6?=
 =?utf-8?B?aCt1blpxUXBlL05wNnk4K1ZDajFmOXcwUHpDVUxHaXJkalVncytjMWVkZHlz?=
 =?utf-8?B?VHk0VEhNRkk4aldjcTRUaVVEMzYySVBvcGpJYU9nNjZCcWxHU0hVSWhKVklS?=
 =?utf-8?B?QlROM001NUNxTTNsN1N5SWd4SU9Ra3NscmpNcTgvSlVjZFNIeHVRbVhUZEk5?=
 =?utf-8?B?Tkp3VWVPOS9FS3NDRFlYRld5T1R2V2ltNW1wMXFHajk2OGVrTDIyVStpNmdZ?=
 =?utf-8?B?SUwwNk5yUTBJNEJrMU00WFEvMGZuTjVPbm04MWxNTXhjeEExTHd5MFlqQktp?=
 =?utf-8?B?MEdoOHBMc0hINVIyOGtIQ0hUcGtwZXBMcU9zZUhTWmFVM0tDMWUraEpBcnpE?=
 =?utf-8?B?OEFlNVZ5TVhDYmtMOGV4UDVzclpLZlpXSG55eDU1QWxRM2pZWlVkVktlVXpL?=
 =?utf-8?B?bG11Ukh5dWtoMHd4MUUwQllySTJwejQ2dnl6Rmo2NmxMQjNFSzV5aDRiVExH?=
 =?utf-8?B?ZG5RYVlvZ2gzTk5jajBLMm53cmJteURqUGlGTzEwajM5N3ZmVGN0NHVpTDlY?=
 =?utf-8?B?Qmd6ZXFwVmNxRHRjSzdqTktjWkk4b2pBSnFmR3pCL05MRWJyWE95ZHRpUnln?=
 =?utf-8?B?RDNkWWxTTC8wbW4xVklOTVhraE0vV0dzNVBCaklPdkx2dzZEVkVYWTdtV3hm?=
 =?utf-8?B?WVBqMVZrWFMxT3UwbUFVZ0pVR3A4Z2JMcXBpSUlqbVhyT01zNkhQb1lHK0dQ?=
 =?utf-8?B?TXNrcHhTS0ZneWNCVVR1Mlg0K05TdUtmMzFkbS9xeFNkd0s5MjZSdGxSRmVq?=
 =?utf-8?B?cmJGazNML2o1RjlkMzZiL0tFNWVLYjRkaHdZMkYxMnFMdkhzMjBjWGx1d3pL?=
 =?utf-8?B?SUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0ff168-0db4-4196-e8af-08ddb561d8f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:03:21.4838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrURmTg8qyZoypG8spAjmVsax2qIdPXJPk598+aqfd194OfUyOu2mVBfR2uVvtzB+GKZsYkqUHKqEEMwTOZRKln4t+iSF0zMtO2vWRw9+bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Piotr Piórkowski (4):
  drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Move struct xe_vram_region to a dedicated header
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   3 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   3 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   1 +
 drivers/gpu/drm/xe/xe_bo_types.h              |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  20 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  62 +------
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  19 +-
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  27 +--
 drivers/gpu/drm/xe/xe_tile.c                  |  58 ++++---
 drivers/gpu/drm/xe/xe_tile.h                  |  13 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   7 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  19 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 163 +++++++++++-------
 drivers/gpu/drm/xe/xe_vram.h                  |   5 +
 drivers/gpu/drm/xe/xe_vram_types.h            |  82 +++++++++
 21 files changed, 318 insertions(+), 199 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

-- 
2.34.1

