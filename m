Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533C5CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 16:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BF410E169;
	Wed, 27 Aug 2025 16:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ndJ92eCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFCF10E169
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756311962; x=1787847962;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jlyXQNJ3I7AefNpOZkhhyKEQZ2VkR4QQWxq80Q2uH3g=;
 b=ndJ92eCUThlMeza25DAB4EerhbXGW0GwmARKzDZ9B6GbwulRRh3Qhl92
 v9r/1tPljYWCkXLQi+e0rblzu0MrIpbvOJBi5KDNCaDdMI0Een6ulL/YO
 TtjY4njnPFFrClcL7btmJeYgVYOgLV3c4bQKdS8UrTK10YQ2BHxy7oqE6
 TSRPneLfhOAhbxyldRNe6hhmtcoGMp2NrxOPjqFR9znCBa8LKIH4a66RX
 iZCgmmpdQpqoi8lGam0mXohMozguvbwLPVby/OYsFjrjuO98BkJbSJYEF
 +FeCe/+N/PbglLSdlGreQSYiAeilVxbRt93Wcl1lVKI38SxSkWcF+fFdc Q==;
X-CSE-ConnectionGUID: tzI0jnR1Rr+yd1uuvigVmQ==
X-CSE-MsgGUID: GklFq1NSTQKEFhfLyCNRcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69939341"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69939341"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:26:01 -0700
X-CSE-ConnectionGUID: KDbU/ASiRICZxkDVu+GJlg==
X-CSE-MsgGUID: j5T9zU2KSYql/xOj+UUAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170047476"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 09:26:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:26:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 09:26:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.63)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 09:26:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCcs1p3PeBEopL+XwAEuYETsOOoj+y0qYEAMqjvUtMpv7YxCnu9N8AHs5YphkUKEQGP2Q91ksrV2qc+bbO9X6yqZDJDjRvRrlxqp1gR7a/H27dUHLr4R1xH+8+bZ7ZtN92Y0swx5a9htVzTj8y/xJ2zozj6kVrWxooQhb2ctjAykgLaRiKYgsGqf48EB5IhcWGS2jlQIUTOSNfRyB/ea6TF0VTHvfmWIkJ7+BxhREio74pc97BzS5Oeo8HF8SBnqgyd9WIXW9nhF4IBpMb+5qPseaaAJwPBaGwFLqsiVvX7QXrO37irgqeoKdeoSmPadh9HhG7pb5hG/MP9TeaGTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0KPe7lqMdOGlH9NXQZxKl2qUSfpmQiCwuA6JPhHbok=;
 b=MriJu/aEA/OtRBB3/l4FliRyEBfoNv41o1zOtYupMTFmnowqBTknTcEvAMJMQJ1W0VRrFI4MiI0lKyDPaiQ6UYUErsHrubndgwR4VM5r5R9A8DBr0jKqfePHKTNKAs9FCs3tkZSytINbHyNbFzL07ukI4HlMwJiwZKeF834g1SfLpLwsE1ujVlIxJrap814hdcMcTh3wtytAYhC1L+8wSFkKmzKMazvNWt/FoMJifE+aJSPikuqHYCsJmzRBwsWH1P/Fu0nboLBnDnwhOfQyrS93jYSqvb4MZOTAxBcR8Iy0xe8QGLG8As/sXe0KLJoUQYKzXq1m1RSMm0MGbgZygA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 16:25:58 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 16:25:58 +0000
Date: Wed, 27 Aug 2025 18:25:49 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.mrozek@intel.com>
Subject: Re: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Message-ID: <aK8xjbyAZDxVR37H@fdugast-desk>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-2-matthew.brost@intel.com>
 <aK8kauwpALcoSxwr@fdugast-desk>
 <aK8sbZxVd+MlS1ZX@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK8sbZxVd+MlS1ZX@lstrano-desk.jf.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR08CA0275.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::48) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|MN6PR11MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 601e8ca1-2737-49d7-8624-08dde5866758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K29sQnlnQW5lMTVxRDFrSFg1d2JDZnZSMkdqbkFOWjB5QU9mZURQOFRTREdL?=
 =?utf-8?B?RElvY0J4UFJSUjdVN1FCV1FtZksrYUlWZDI3TnNaTWFOdEVvT0F4ZGV5cmRW?=
 =?utf-8?B?c2kzbTVCcXNJMXpJc1psY2c5Tk9PdDlBeit1aFNNR3I4c2gzUHphZXNTOWFT?=
 =?utf-8?B?bjJhcXdUU2JSa0RDYmx6WnpObjU4MUhreWZQditwVEtMUVl0aU1TNXFqemlx?=
 =?utf-8?B?SloxdnZrdEptK0cxWlhMelFjVHRwNnlDQ2tlS3d4VUY2OHFmWG9iQ3VCNWhs?=
 =?utf-8?B?ZGNTbDltVkZrdU5BbHFPNkUyVEIzNEU5TlNTN0RvQ2VEeEtDaFBQS0t6c2pz?=
 =?utf-8?B?ZTZJQkppQnRnN0QyTENqcVFTRGpZTkkwMmxqblc5L09OMUk0OWZiLzBPcDZV?=
 =?utf-8?B?QWdvQklWM3QxTTBLVWtOaVJMc2t5eFo0eHBaRjVsNnVWK1cxNVdjSHc3UFJq?=
 =?utf-8?B?VjJjcXVYT0IveGZYeWhpeGFpMlZicGRtbC8wQkluUnI1aTdtOGtaWXdZdk1M?=
 =?utf-8?B?ejNvU01Tckd3QmNXY0JJSFgwNWJ1SFNaalh0aUN0N29LbEoxamtwTG5pNkNI?=
 =?utf-8?B?YTlNdWVFbFlFcDdOaktZMzdaQTI0RlYrV0dpR01saEovMndydEtLRDEwR3k0?=
 =?utf-8?B?Rk9CV1pzTGsweU9taVFxRi9iU2x3Um11bVZveUJsM1V6T2g3b0xFZUFuK1Qv?=
 =?utf-8?B?b05JcHhrZE1qSU9QNklEVEtyMFlHbkwrK05Jck1JRm1Zb29YNDlTakxFVXVQ?=
 =?utf-8?B?ZWpDczRHRklCVWFHMWd5eEdSdGlyYnFsdTFnQm9Jd0VsV0NURFVqOXVXQ0RI?=
 =?utf-8?B?dWo1VUd1R0lYNmRJYkx1ZnNyaDVrZ1NrMllHbkRqTktuWUJDT2hQdjBYSEtj?=
 =?utf-8?B?TDlWUUU5YWRJdXdiOGJHNEpwWm1LVjBvdVB5TXN0anl0eWtmQkltdVB0Mml4?=
 =?utf-8?B?M1lKclJtZDBuTC9qbVl3V0gvMXo2elB5b1BLSVBMOWg0bVdLL25kWUdPOE9z?=
 =?utf-8?B?WGZlMzBscEEyUTNTY3VwRzJTZTRnUXRzNDhndGFLNjRjMThGdCtyVE1TT2VF?=
 =?utf-8?B?dEdmUWVUbjd0cTBYWXY1RjM5Zk1JNm9oMFhiZTNKV3FOc295b24rdzRSZ250?=
 =?utf-8?B?QzF0dDloYThVam01VDhMUHBtNU5xckhBSVZhbW1EOVZWaFdpaUhqcnJiM3Bs?=
 =?utf-8?B?TENVWDQ0OEJNU21wb25qbkxsUlBNMnpWci9vSzE4bCtHVGdNQWZacGpFVks5?=
 =?utf-8?B?WWM0djhHUWZKc1ZwN1l0QjZGMlc4M29Zc1FVWTc0OTRjY21XT1gvN2YrenhD?=
 =?utf-8?B?RkVqVUtVL0N3Y1JQYm45TEZCWVRwUDZkSjAwUTk2c1lzY2p4d1hydVFYNHBx?=
 =?utf-8?B?cmd4a3pWY1lFRkpJZXJrcDErZnlvS3pXcEdxVlQveG1KbDJEbnBvUFl5VDQ5?=
 =?utf-8?B?eGczNDJLREMwbmZoYmRNdnd3TE5oeUpTOERlWlZxcEZKTy9EVTNQVzNwM1lS?=
 =?utf-8?B?RDZCWURoZHRwU2NDd2NrTm8vWlhHM1drcGhLUDRtL3EvNVFCdzZoek5hK1NX?=
 =?utf-8?B?S3NHa2JwdCtJbXE4YktVUHlabWRiV0ZYWlFWKzllbGx4V2xJaWgvdWtjcm52?=
 =?utf-8?B?dzZCem52ZS9qYzV2NzFGSVNLNnlVVzNDdUw4RVVPR2NTRzhEa0VkVmE0NDZh?=
 =?utf-8?B?WGlDSnFDeDFaZGpMU3JyMmpXbktMdkdjS1pQRW5kTGRrTVNLd3hIUThMbWFG?=
 =?utf-8?B?eU1QYTJvbUxva1hTVlNDYlpmSGN2N0Q4SmVEdUJEVHc1OHVldHBOWWFMak9v?=
 =?utf-8?B?Y1hDTTI2d05SSzVoR0I3NVkydUxyVjVJZmRGdnM1dTNjWEdnc3JnY1lOQklI?=
 =?utf-8?B?T3h4T2VZRzZ2bktJOVd6ZWJRd0NCeWc0RkhFSWZDa2pRbWpMWE5halpVNG13?=
 =?utf-8?Q?nrP6UATF4M4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTJBS05icXNQVmdmSTV4TE9GNGgrWWphMVUzQ21wc3huaHVSMXppc0EwU01Y?=
 =?utf-8?B?dS9URitCMVlvUG8xTzVPNlNOTkRmbzhYdWdMWkRudXhLbE9jd1BzQXNmd0hV?=
 =?utf-8?B?K0NFL3NMT3MyN2NNOWZjaVR6cGtFYVJGQWVic25ReTNEaWN6Zi94MlVvMCt4?=
 =?utf-8?B?bUw3TlVNbkJaK0RKWHZrb0Q1NjFNa1ZtZGNYYmlmZXFJcmxJR1pUWmdnUkdE?=
 =?utf-8?B?aktLQzhDYzhPNU9UZVVhZEl5Wm9DUkJpUTJYMDgzblBoK0trbVdrS0VxcWp0?=
 =?utf-8?B?eWxmMUhwalpUYWJpL2JvWTBIQnNRL0cySDVjSHpxbm1NeWpVcW9iT2xZUFZm?=
 =?utf-8?B?NU1MK2NXM0ZtZytjUmwyVitORnhpUlpUaG1pR3IweGx0RjAvRzl5OVE0SDZL?=
 =?utf-8?B?dThvdkpJQVZWZURkaDFlTitZdUh0OGZIRjZpN2wwRGJCVVpRVmtVd3BMdmR4?=
 =?utf-8?B?QkRoZGl3aVRaTlcyaG5TMmFhNHVFbTd0QW9oSGJZYmVHMXhHdUFiU2U5RE8r?=
 =?utf-8?B?eS9VVHB6Mk9lL3BIT21iSnhPb0JMM3lLYTlJR21Zdyt0M05sMTBHYy9wYVlL?=
 =?utf-8?B?TG5nSWtMcTNrT0NVLythMkRQZWM5OVFMYmhKK1UzcWlYU05iTldDT01SMEtL?=
 =?utf-8?B?enBBSVR3N0o3bFU3MHFjOHlveS9KSVpaSWl2YzNTUURUdVFaVVl1c3Qvemtk?=
 =?utf-8?B?ZnNibEE0YnJwSWpaYSs4MmJCR215Zm5sWGpWZWRMYyt2QXcvQXdYNmJ3ZVAy?=
 =?utf-8?B?dFVzZi9KRW0rSkhzU0MyeVU3SEdqem9DSjFHSzhLWHJnaVBjMkd6NzU3MjEy?=
 =?utf-8?B?dU1qTlVzdm5OVHBldmJmTHM0akt6QTlnZUxacGdnRkE2SmZXS2lxMDdheTYr?=
 =?utf-8?B?QXlCOXFDdE1uTG5wdUs1aG1tUWtiUHBPVFN5aDR2Uk50eWJnbXA5bjExZFBX?=
 =?utf-8?B?QjFUeURDR3pSSkc1QWduSFdnenlPYXRNL243c0lnUmx5WkIyRVNiaGdpTG5n?=
 =?utf-8?B?M2hsQ281U1dtdFU2OVFQWEpkMjJrbDV4T3M2ZEY0bUU0NGJBMWsxeWRiM0Vw?=
 =?utf-8?B?YmtzY25xenlCOFA2N3J0UHZCWHNTQnY0TUwxQTNOR09UQ1ZaRW8vZG9MTVV3?=
 =?utf-8?B?Qm4zS1lPTnVjMWlPR290a2pqZWVaVDBNUk5YbHJ1aEE2dVNxUTk0UjZtUlpT?=
 =?utf-8?B?bHMydkprTnQ4MldudDhaQnpWSy81N1hrZUV3bDluT1VtWWR3RUFUN25FRFZF?=
 =?utf-8?B?R1dPWHBMVklsWDFMR0ZSTDZxUGhJL3RNZjNtSXY2bG44R3R6UllYL0NsZ3JX?=
 =?utf-8?B?aDZKOFVVNWMzQXZ2T0NpS2twalVGTnBtWjA5STQzZnkyNHFNOVpBU2ZQem9X?=
 =?utf-8?B?TG0wN3VJMUJCWlhuL2xnbkJmMTBLVlBOdDJYQldyWlRCQ1d5T2xXeFdXSXMy?=
 =?utf-8?B?LzJrT0pCWHQvWTUrc2tjTHFVK3hYMU1LSm9tMElaM09wNUtaeEZOT2libWIw?=
 =?utf-8?B?b0FqaW94ZmI4QmlHV3U4dVh0Rnk5YjNsSXFwSTdENmdhcnRXdTQ4OE5iZ3Vk?=
 =?utf-8?B?VWd0eGU2WHZUZk9pejEyb1ZjVkxCSnc3M2hCaWRSb0lOZ05ZUGcranY4aWIv?=
 =?utf-8?B?dVprellBUDFLWEFkeHRoeG1sMXBqSmkzU2lBZGZLTXRkcVluM2N2NUlQM212?=
 =?utf-8?B?T2VTbHJ4SlBiNk5Qa040K1I4Z2VXL0hkNHJ3QzdBaTBiY0hlZzRUWWFOZ0Rm?=
 =?utf-8?B?UklZa09raDUwcUhSZmZLeWVKU1ZOK3Noc3VvL2lhOVRQclBQRU8zNlpVdmJF?=
 =?utf-8?B?cUkwMi9BQ0xISDNrcXBnTTgzSC9QZE9CMTQ2SERZclVyYWgxcG1PYW5oQWho?=
 =?utf-8?B?TE41MmpKNlUzbDEzVmhEeWZGMDhJSktKMG53VUJIS05YdFd4dkxhVWZvR0oy?=
 =?utf-8?B?SWNqeTlTeUw2VkNGVmRIUzl3K3RwaXdIV004L2pZM2hiOWFBQU1ScE1TblJF?=
 =?utf-8?B?dTZYcWxwVGJPTWRWeUNZak8vOHFhNGxlTDUvSUYxZnlYbEhlYXllU2xOZXZO?=
 =?utf-8?B?NGJXY1c1amVEeWFpZkUyYUdIVmh0ckZJd3I5NUZ4TUxEUFJHVDdtUDZ4ZFlO?=
 =?utf-8?B?WTdYQ1pSSUZiYjVZZnU3NkFaTUxaNHkvOU9uV1MvRUh4UFBxTDN4VGVicUx1?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 601e8ca1-2737-49d7-8624-08dde5866758
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 16:25:58.0339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj9xOEoUCSPkGEpVLXAL2y0zkHxVorf+SfCSJw3E90t00vG2BywiCMvodtYaAqqgUmUgGo50nPU+POBWcAjRPGoRDsO/G6MeUS+M3FW7hPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
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

On Wed, Aug 27, 2025 at 09:03:57AM -0700, Matthew Brost wrote:
> On Wed, Aug 27, 2025 at 05:29:46PM +0200, Francois Dugast wrote:
> > On Tue, Aug 05, 2025 at 11:22:32PM -0700, Matthew Brost wrote:
> > > Stub out the new page fault layer and add kernel documentation. This is
> > > intended as a replacement for the GT page fault layer, enabling multiple
> > > producers to hook into a shared page fault consumer interface.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile             |   1 +
> > >  drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
> > >  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
> > >  drivers/gpu/drm/xe/xe_pagefault_types.h | 125 ++++++++++++++++++++++++
> > >  4 files changed, 208 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
> > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
> > >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index 8e0c3412a757..6fbebafe79c9 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
> > >  	xe_nvm.o \
> > >  	xe_oa.o \
> > >  	xe_observation.o \
> > > +	xe_pagefault.o \
> > >  	xe_pat.o \
> > >  	xe_pci.o \
> > >  	xe_pcode.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > > new file mode 100644
> > > index 000000000000..3ce0e8d74b9d
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > > @@ -0,0 +1,63 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#include "xe_pagefault.h"
> > > +#include "xe_pagefault_types.h"
> > > +
> > > +/**
> > > + * DOC: Xe page faults
> > > + *
> > > + * Xe page faults are handled in two layers. The producer layer interacts with
> > > + * hardware or firmware to receive and parse faults into struct xe_pagefault,
> > > + * then forwards them to the consumer. The consumer layer services the faults
> > > + * (e.g., memory migration, page table updates) and acknowledges the result back
> > > + * to the producer, which then forwards the results to the hardware or firmware.
> > > + * The consumer uses a page fault queue sized to absorb all potential faults and
> > > + * a multi-threaded worker to process them. Multiple producers are supported,
> > > + * with a single shared consumer.
> > 
> > I am not through with the series yet but xe_pagefault seems to be the
> > consumer code only, while the producer code will be located elsewhere
> > such as in xe_guc*. If so, might be good to write it here or in the
> > functions below.
> > 
> 
> I didn't want to mention the GuC specifically as it is intended to be
> generic. The GuC is a firmware, which is called out as potenial
> producers.

Sure, sorry for the confusion, I did not mean to name the producer here
but rather to add something like: "This file contains the consumer code."
to link the doc and the functions below.

> 
> > > + */
> > > +
> > > +/**
> > > + * xe_pagefault_init() - Page fault init
> > > + * @xe: xe device instance
> > > + *
> > > + * Initialize Xe page fault state. Must be done after reading fuses.
> > > + *
> > > + * Return: 0 on Success, errno on failure
> > > + */
> > > +int xe_pagefault_init(struct xe_device *xe)
> > > +{
> > > +	/* TODO - implement */
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * xe_pagefault_reset() - Page fault reset for a GT
> > > + * @xe: xe device instance
> > > + * @gt: GT being reset
> > > + *
> > > + * Reset the Xe page fault state for a GT; that is, squash any pending faults on
> > > + * the GT.
> > > + */
> > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> > > +{
> > > +	/* TODO - implement */
> > > +}
> > > +
> > > +/**
> > > + * xe_pagefault_handler() - Page fault handler
> > > + * @xe: xe device instance
> > > + * @pf: Page fault
> > > + *
> > > + * Sink the page fault to a queue (i.e., a memory buffer) and queue a worker to
> > > + * service it. Safe to be called from IRQ or process context. Reclaim safe.
> > > + *
> > > + * Return: 0 on success, errno on failure
> > > + */
> > > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> > > +{
> > > +	/* TODO - implement */
> > > +	return 0;
> > > +}
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> > > new file mode 100644
> > > index 000000000000..bd0cdf9ed37f
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> > > @@ -0,0 +1,19 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_PAGEFAULT_H_
> > > +#define _XE_PAGEFAULT_H_
> > > +
> > > +struct xe_device;
> > > +struct xe_gt;
> > > +struct xe_pagefault;
> > > +
> > > +int xe_pagefault_init(struct xe_device *xe);
> > > +
> > > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> > > +
> > > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
> > > +
> > > +#endif
> > > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > new file mode 100644
> > > index 000000000000..fcff84f93dd8
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > > @@ -0,0 +1,125 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2025 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_PAGEFAULT_TYPES_H_
> > > +#define _XE_PAGEFAULT_TYPES_H_
> > > +
> > > +#include <linux/workqueue.h>
> > > +
> > > +struct xe_pagefault;
> > > +struct xe_gt;
> > > +
> > > +/** enum xe_pagefault_access_type - Xe page fault access type */
> > > +enum xe_pagefault_access_type {
> > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> > > +	XE_PAGEFAULT_ACCESS_TYPE_READ	= 0,
> > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> > > +	XE_PAGEFAULT_ACCESS_TYPE_WRITE	= 1,
> > > +	/** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
> > > +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC	= 2,
> > > +};
> > > +
> > > +/** enum xe_pagefault_type - Xe page fault type */
> > > +enum xe_pagefault_type {
> > > +	/** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> > > +	XE_PAGEFAULT_TYPE_NOT_PRESENT		= 0,
> > > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
> > > +	XE_PAGEFAULT_WRITE_ACCESS_VIOLATION	= 1,
> > > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic access violation */
> > > +	XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION	= 2,
> > > +};
> > > +
> > > +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > > +struct xe_pagefault_ops {
> > > +	/**
> > > +	 * @ack_fault: Ack fault
> > > +	 * @pf: Page fault
> > > +	 * @err: Error state of fault
> > > +	 *
> > > +	 * Page fault producer receives acknowledgment from the consumer and
> > > +	 * sends the result to the HW/FW interface.
> > > +	 */
> > > +	void (*ack_fault)(struct xe_pagefault *pf, int err);
> > > +};
> > > +
> > > +/**
> > > + * struct xe_pagefault - Xe page fault
> > > + *
> > > + * Generic page fault structure for communication between producer and consumer.
> > > + * Carefully sized to be 64 bytes.
> > > + */
> > > +struct xe_pagefault {
> > > +	/**
> > > +	 * @gt: GT of fault
> > > +	 *
> > > +	 * XXX: We may want to decouple the GT from individual faults, as it's
> > > +	 * unclear whether future platforms will always have a GT for all page
> > > +	 * fault producers. Internally, the GT is used for stats, identifying
> > > +	 * the appropriate VRAM region, and locating the migration queue.
> > > +	 * Leaving this as-is for now, but we can revisit later to see if we
> > > +	 * can convert it to use the Xe device pointer instead.
> > > +	 */
> > > +	struct xe_gt *gt;
> > > +	/**
> > > +	 * @consumer: State for the software handling the fault. Populated by
> > > +	 * the producer and may be modified by the consumer to communicate
> > > +	 * information back to the producer upon fault acknowledgment.
> > > +	 */
> > > +	struct {
> > > +		/** @consumer.page_addr: address of page fault */
> > > +		u64 page_addr;
> > > +		/** @consumer.asid: address space ID */
> > > +		u32 asid;
> > > +		/** @consumer.access_type: access type */
> > > +		u8 access_type;
> > 
> > For type safety we shoud use enum xe_pagefault_access_type instead of u8.
> > 
> > > +		/** @consumer.fault_type: fault type */
> > > +		u8 fault_type;
> > 
> > Same here with enum xe_pagefault_type instead of u8.
> > 
> 
> This structure is carefully sized to 64 bytes. Unsure if using enums
> here will throw off that sizing. I'll check on this, but I suspect it
> will, if it does I think u8 is the correct choice.
> 
> > > +#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> > > +		/** @consumer.fault_level: fault level */
> > > +		u8 fault_level;
> > > +		/** @consumer.engine_class: engine class */
> > > +		u8 engine_class;
> > > +		/** consumer.reserved: reserved bits for future expansion */
> > > +		u64 reserved;
> > > +	} consumer;
> > > +	/**
> > > +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> > > +	 * by the producer and should not be modified—or even inspected—by the
> > > +	 * consumer, except for calling operations.
> > > +	 */
> > > +	struct {
> > > +		/** @producer.private: private pointer */
> > > +		void *private;
> > > +		/** @producer.ops: operations */
> > > +		const struct xe_pagefault_ops *ops;
> > > +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW	4
> > > +		/**
> > > +		 * producer.msg: page fault message, used by producer in fault
> > 
> > s/producer.msg/@producer.msg/
> > 
> 
> +1
> 
> > > +		 * acknowledgement to formulate response to HW/FW interface.
> > 
> > s/acknowledgement/acknowledgment/
> > 
> 
> +1
> 
> > > +		 */
> > > +		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> > 
> > It is clear from patch #6 why it is more convenient to have this in
> > struct xe_pagefault rather than local to the producer but this seems
> > to go a bit against the elegant abstraction provided by this new page
> > fault layers. producer.private could store a struct with {guc,msg}
> > but that is probably overengineering so up to you.
> > 
> 
> You can't malloc (with GFP_KERNEL) the producer path, at least for the
> GuC as we are either in softIRQ context or under the CT lock which is
> the path of reclaim. The only option is have these fields populated in
> the stack xe_pagefault structure in the producer which then is copied
> into a preallocated page fault queue, sized to sink all possible faults
> on the device, on the consumer size. I can add kernel doc explaining
> this.

Thanks for the explanation, would be helpful as kernel doc indeed.

Francois

> 
> Matt
> 
> > Francois
> > 
> > > +	} producer;
> > > +};
> > > +
> > > +/** struct xe_pagefault_queue: Xe pagefault queue (consumer) */
> > > +struct xe_pagefault_queue {
> > > +	/**
> > > +	 * @data: Data in queue containing struct xe_pagefault, protected by
> > > +	 * @lock
> > > +	 */
> > > +	void *data;
> > > +	/** @size: Size of queue in bytes */
> > > +	u32 size;
> > > +	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
> > > +	u32 head;
> > > +	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
> > > +	u32 tail;
> > > +	/** @lock: protects page fault queue */
> > > +	spinlock_t lock;
> > > +	/** @worker: to process page faults */
> > > +	struct work_struct worker;
> > > +};
> > > +
> > > +#endif
> > > -- 
> > > 2.34.1
> > > 
