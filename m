Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83648C27C78
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 00:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F306D10E201;
	Wed, 12 Jun 2024 00:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/T/rzYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB5610E1A4
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 00:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718153895; x=1749689895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i7VvX9PkIiDGl9yHW/0o5yqbL7qp4DLJs+DVnYqzI9E=;
 b=a/T/rzYRfsgtRsyMaqI2Z/HW4znEuw3HxiCIBM5pjTSpNHgS+NA0dNCo
 xtDNwk52tZu5a09JwGv1JN+zlRKr6BUTlCivudMbLVHXPyO3KmZyai4v7
 rgmYhkoD0ThZZMoBbntoIKdoLLwu7hBEgNHLRnGNub73Qabq/d+UWpANI
 OIvfFpIOrgKgl5K+f/8Puiz8vprbrpMLFgYeNXlIeSvA5Od/3TthcSdUM
 wksXeS5999iaC0Z8KcVATBhaOoveewn3h0PbgOQb3nqaYLONo2U85hu4a
 mu/gq3d6VN9ZJULXHNlRb8ZwZa1JoyJ+xK6/qRECvfcrjJUrqDFH8h/Cf A==;
X-CSE-ConnectionGUID: wNbzuPQ4Q+ibmz0h36bMNw==
X-CSE-MsgGUID: FD4wG+hsRoydnZm2wSVqEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14770209"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="14770209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 17:58:14 -0700
X-CSE-ConnectionGUID: VOcXEx1nR4SF0h4SLyHNYQ==
X-CSE-MsgGUID: exr88msYR1ywzwiPgzS/QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44173179"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Jun 2024 17:58:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 17:58:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Jun 2024 17:58:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 11 Jun 2024 17:58:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Jun 2024 17:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYDyifU/R2Xp2iozk7DE4jEazDdKKCyhIgdnwoZ1QxTZDIh3a18P2tHSyfn7JXW9Y2C1fSGkKfB/ZafbV34vtnuGxWATeNtqHpPdD/6Tp3UarsP8mXBjvOCxban4vMEFLdXivfl42gOWJpyQnumI4sKLufv6fWNWwVF8xwGPJ4/nBIFCbdC55fv+miBjR5A2rtE8vfm8YVDJ6tH16KpxKj/L6W4EJ0A463NQgoB8pc645bYxB/Wjv7kFfCsOKAUOYzo7NjUp+LfLThAKTf9nM7WHMptLJqPyynVxUrqphCbIm59ZfkyuhhxFK7U55OHigRww/DSDAQSLwFKJy5Wopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HnEM68JGvkqd23OOobaYfMKXDVyB7cIza/ETrRJ8bhY=;
 b=IzfPn28LvbQf0DpUJXHm1gDcAtgPGnOuo7urY3Ncxi3vlBqp6zj5ib7Dgfq0Pf09yi873GRbNi0nqnAM+eHXfuMNSYENC9MJX92inYufTD+VwJuUG9imhJMjhp3xmRLpAlFXLxImJnC9+1h1s55YbQ/+bvAd/cUH/uoGt4+b0l2kVjRCoGttaicinl6SZKK2iihCkqUSgeo1yRRrUwfQaT+Ka9LBCq6r2vEMYQecJ6u2QNdk9HLDepPivmHZGJv02EamUomZfvOC8DilfIRXGo9QUaALHorUVbjT+rJWNX5UxW6c4arc0aq+ttjxcH6nrLxM0zKat21Zix2EFX41eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 00:58:10 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 00:58:10 +0000
Message-ID: <7e08f192-1b2d-4099-9e0f-c83749496658@intel.com>
Date: Tue, 11 Jun 2024 17:58:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Use topology to determine page fault queue
 size
To: Stuart Summers <stuart.summers@intel.com>
CC: <brian.welty@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240610203300.182615-1-stuart.summers@intel.com>
 <20240610203300.182615-2-stuart.summers@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240610203300.182615-2-stuart.summers@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0004.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c53f27-f1ed-4e36-6ad8-08dc8a7aba5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dm9QMGxvWkt4S2VRSXNxZ0YxcjZpQ0VFb2J5QXJiWXVHVk1wbWc3WVRzTTlj?=
 =?utf-8?B?Q1hpcTlVSmVoYXRpV0ZOaExiQitxVTB3bVc3OHhGOVZEWXZRS3AwbDd0NXh0?=
 =?utf-8?B?Rm55ejF0VFltTzZTMW56UnFFekpVTzFnOGZ6dzJiUVUxaGN1MlVBNGoyeHBT?=
 =?utf-8?B?VTQ5OVBTYzl2TUlXS0dTUmNhS0xkSkY4a1FQUitYMlBZT21iU1B4V1Q3QWVW?=
 =?utf-8?B?YXRrdnpYTEUrczB0YlRlVStveGFLN21kb1ExZ0szVm0zWWl3eFArbTRHK20z?=
 =?utf-8?B?RE5rVEhQQ2s4M21YWCtwUk90ZXpCazVmSE04ZEJKM0JCWjV4eTNmVi9QcGJE?=
 =?utf-8?B?S0Rta04yZ2VNU0hEVExHZHpQbmp4SGN6bTEvNXVTVTgva1plWGMrM1BJVXN6?=
 =?utf-8?B?OG1rL3BqOEJKVlBrVHg0RHdPNi9lTzJaYi9BRDNnS3lod24rL1JDVkVjRWFW?=
 =?utf-8?B?di9YcjBIZjhlRG9QSjVRS0EvQ2Q0Y09DVzhmUWhoRUx4aXIyazl6WHBwa0tE?=
 =?utf-8?B?bEh1cjVuZzhWQXc2WDlILzFaaE9hYUZNQVMvcVVXL05HaUcvT2FoZXMyV25z?=
 =?utf-8?B?VCtpNTJpcnNMY2M3MFlSOVI5S1NiR08rOURvQlc3UjFPcXVGUkVUdDNmUHp0?=
 =?utf-8?B?amxvTVdURjMwMktuUjhjRVYrWHdUcEFZSzJIYzIyUEpRUEI1THN2S0NrS2Fq?=
 =?utf-8?B?L29LNEdDc3cxbFB3bDZFRVRFY3dGbmZEbnZDS2JuZHpteTlLR1UwWk9QcXY2?=
 =?utf-8?B?QmtIQWlSMDljcUNIbEkrcDdzbC9vT3N2WmhwVUZ3K2RpY2o5ekdYdmRLNlFK?=
 =?utf-8?B?U3gwQW9uS2RURFBFanJ0UU9RNnNvU2RIYlBCM2VXVTRWTWc0WmdoRk9KQkdi?=
 =?utf-8?B?UWxsNGw3V0RlMmgwTVBhVE1NQUNWMGxMeG5GeTFUVllwNExsZ0k0OWsrcmZj?=
 =?utf-8?B?QWtUR2E1V21aQkIxRDhjWitRMDdjREcxdlpmbjdic1g2VGZPVldUbS81WVJQ?=
 =?utf-8?B?K3lWZ1lFYXFGZmtFMmR4ajFyQzB2RktXV3lQU0FiSjZQUHprTlAxVVpZUkFh?=
 =?utf-8?B?TmR1bFdLUGltbGhMdVhSck02c3U2aW5LSjhXZWMrNHJOSFBVaHBILy9udG9t?=
 =?utf-8?B?Wkg5VmFlT1c3azRNTDZmWkg5aC9vbGx5UzZxdURKUG82eGZjM0tPSmlsYjFN?=
 =?utf-8?B?RmxlMVdFN2pNTkQ3d3BwQWxLaG5sWlY0dGhyYXpYd25IOXFrS2xzWWVNOGtY?=
 =?utf-8?B?VFU3VDNMc0U4dzRrL09QR1NXMUxVTmtpaWVzZWpzdzNHZFpmQWovd1BHdFEw?=
 =?utf-8?B?WC9tZWdOa0xUckcxSXVTWWhOd25iL3d1S0hCNHFkdTgyYkVMWjZMVmVMRFFZ?=
 =?utf-8?B?a2d6MUppYTduZkZZekhXMDhHQWZ3VzhXRGh1ck9pdHhia3JtUWkzMG9YOHBr?=
 =?utf-8?B?cFNQRFg0c0lMb09pVTZPdmxuYTBwUklBMHFCR3JiUjBQWlBWZ0tCN3Y4MGRG?=
 =?utf-8?B?WGprdktSaHBCT2o5MWtpVHRkVnl4OEdqS2RYRzZSSmVkalNMQnJXdlNLeGtr?=
 =?utf-8?B?OXFIMzlFcDdEamI0eHpWMy9wWGV2WjZrakVNcWpNaTFvUldlNCtzaGtsSTVR?=
 =?utf-8?B?eGRTWnJKSHRrWmhyZmtRSDAxTFpjTjBteCtWQWJLUi9CZDZJVTk4ellIbkZQ?=
 =?utf-8?B?Nlh1dkZ1RGw1OFZ4T1p3cGFKdmhWNVY4RHFBNGg3T2pHZU1abGx1d09Sc0lm?=
 =?utf-8?Q?zrDe82CF5DAqbVTHHM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dURIMUpJSzR4MUEyak8rZDE0eWlDWlJKTEp3ZFE4eWJaT29TTnpmN1k4ZTlF?=
 =?utf-8?B?R0paT29Hd3p4TklpNmJCSzdTSkhYaENvVWc4RzNLZkVkNUpFQzljcmM0Mnoy?=
 =?utf-8?B?Vnd1OFJPcE1HZ09YYmorWEJBMm5DRDAxTG0vZVJTWnZ0cTJzamVPenh2Q0tM?=
 =?utf-8?B?MzVkaHlXVjk1QU11R0NiNEJIYjBTQTBoQ0NTbXBMb21lblpENkFKcERUekFj?=
 =?utf-8?B?ekpWS2RWYnJ5dGdkNytyUUdDaHBLZWo4bUlhVFNKRmF0WnZVWUJZYUtnWlFG?=
 =?utf-8?B?R05CWEtUeVNpcEpHVVF4TW5PYkZHUW5lT1lNWTBtRXR6MUJzMk9tUy9JZXNG?=
 =?utf-8?B?dFNYVE1NejJYYnZqaCtkN3c5WDdiTTFlMG02bFZwUmZ1WndtUXBVaUhJY2JS?=
 =?utf-8?B?d2tKTGNONEFaUFFsSTBkVkl0TEkzWDdzblU2dHhXLytIQkYzb090Z2I5YUUx?=
 =?utf-8?B?dHRvRnZ5ZmIySDBsUUZ0T2JKTzVvRzk4N0FhVUJ6bkY4eVZDTlRVR2pGTmJR?=
 =?utf-8?B?WGJ2QkZIamZYTnFxQVI0dzB2ZEpRdG93WGRqeFA5aExpbjdoMDQ0SlNkaUFY?=
 =?utf-8?B?a2RHUXBPZklXSTN1RExIcUZwbFljclQrTnY5Q1lwOVhKMzRTcStRZGlGMmlY?=
 =?utf-8?B?dzZ0bzhLbSsyZ2drZnpTYXhVS21uSzgwTFJlVDBRR21WRForL0RERWI4VWJG?=
 =?utf-8?B?ZFkxRG82M3dlbjgrWUxtQ1BlTkg4S3plVlFtRnh6TnkvalV2UnZGdVZkMTJE?=
 =?utf-8?B?NlllcmdGUkFZNFdnTCtvbGI3NFdWdnd6bkJ3bnlOdUlnVjZiZ1AxNHlZNzJG?=
 =?utf-8?B?Ykc5UjhCR3FQdk1SM3puOHJ0MFNjL2pzc1lSRWxzU3lNUkVWc1k4dVQwakRu?=
 =?utf-8?B?T1VQQ0l3bUZKZ0RlNTJCZy9lWXB2ZWNRcUJneFRwSjBrNEgzM1NrazF3b3NT?=
 =?utf-8?B?NzBQMHp4dmR0S1BwY0g2Sk5ZT2RYVXJIWCtLM01wblUxOUN2RTY2c2kwVldn?=
 =?utf-8?B?RjRJZEpwcnEwc1lMVWF5OEJiQnJEYy9IVkJ5QUhkdHA2QnBBRGpMK0xOMVpT?=
 =?utf-8?B?MWF3aUREeTcwelhKbThFVjZLcDdiN1RrOVVNZXhDZi9CdldJMEdSSGZmTTVk?=
 =?utf-8?B?dGpqUHdtQk1jUk8wY0N6cjB5WVdCeEdiR1hGcmNQTWhmRnUzQ3JIdXZmb0hz?=
 =?utf-8?B?NzZsNFNTdUxTRmNaTkNZTk1GVWV2QUhiWHdsQ2dHbzBBZllNNjVXb29BNzRJ?=
 =?utf-8?B?K0JxZXRwOVQ0TmJkanNndmpjekpIK01HV2FVTWZZV0lkSFg5UFRVcC9kYzJT?=
 =?utf-8?B?KzdnTnhmL3BMYnNxZ1lTQVhOZTBzYzZ3ZHlQTnFWLytXaEt4Vzc3VlZiekVQ?=
 =?utf-8?B?QnVIeXpLMVBxdWF6ckVHRHFxL3R3UG4vRCtld1J0cVFoUmlreE1aOXBmOEcz?=
 =?utf-8?B?VXZ5YTFjdjcyNnNOZzdMaHJqNTByREhtMHVmSUY0UnJJa3FGQTFCK0Z5bTBG?=
 =?utf-8?B?SXRabzNQMElWQmN5OFlwSUp5c2I0eWM0Sk4rWDlQbHcvZkNYdkp4QXZGTVNw?=
 =?utf-8?B?SFR6eXVOdXh3emM2MzcvSnk5dkZWTFFXNHVSNllTanRtWUhYc2ZtZ1g0MEhw?=
 =?utf-8?B?RDhabUhMcWhuTTZFamFId2d3R1IzRFh5SjB0ZVo4cUROZGNhanIzL213dmli?=
 =?utf-8?B?cHJPRTI1dVdycllBNWtuaEY3YnhvNGRpd0piZFFidmtVSDNVajNtNGtIek1k?=
 =?utf-8?B?bC9BNnFBKzFmWG1udzBGaTFIMVNpUnBTVTVjM3A1bGhrd0MwWkphbFBPMkpq?=
 =?utf-8?B?SVJBeC8yNTFIbXNUODhzV0FpSnB1VUhXUGhOK3VpU3laTzFWZmtTWFNvcE5l?=
 =?utf-8?B?YWNNTjJEaERJcldVeXE2ZjhYNlY3UGlNeW01NlE1dnUxVGZEUHBpVFo3Y1Fw?=
 =?utf-8?B?dUI2SDdVeWxieGlJSG5PNC9vSEhqWng2U05WWnhEdk95aEQweVAvYldTVzFn?=
 =?utf-8?B?WC9ud1NucDRpaGN6Vnh3K2VTVGVacmd4SHBGTlozdXV0SEI5Z1AyZFg4bWMv?=
 =?utf-8?B?RzM4RUV6ZHNUazl1aG9KNWpYQk95OGRiREoxcWcrbFVrQkNldnpqV1F2R3ls?=
 =?utf-8?B?WE1nbUJiYWd0MUpGeUE5T256cmpaTFBBeGFTV0ZXVDdUak5za2F3Y0M3U3Yx?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c53f27-f1ed-4e36-6ad8-08dc8a7aba5e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 00:58:10.0330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvaT29NMacKrrgW3Tr7HteKIWr/Mnm50aw9bhSdQaFIivgLKtLxEq4pgfIUwjBxkkT/WqEMgFucSjB0NmMa2HG/SsuUh0z+Oj2afXiqbxHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
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

On 6/10/2024 13:33, Stuart Summers wrote:
> Currently the page fault queue size is hard coded. However
> the hardware supports faulting for each EU and each CS.
> For some applications running on hardware with a large
> number of EUs and CSs, this can result in an overflow of
> the page fault queue.
>
> Add a small calculation to determine the page fault queue
> size based on the number of EUs and CSs in the platform as
> detmined by fuses.
>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 49 +++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_gt_types.h     |  4 +--
>   2 files changed, 39 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 3858c8e0b707..5565732e79e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -287,7 +287,7 @@ static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf)
>   			PFD_VIRTUAL_ADDR_LO_SHIFT;
>   
>   		pf_queue->tail = (pf_queue->tail + PF_MSG_LEN_DW) %
> -			PF_QUEUE_NUM_DW;
> +			pf_queue->pf_queue_num_dw;
>   		ret = true;
>   	}
>   	spin_unlock_irq(&pf_queue->lock);
> @@ -299,7 +299,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
>   {
>   	lockdep_assert_held(&pf_queue->lock);
>   
> -	return CIRC_SPACE(pf_queue->head, pf_queue->tail, PF_QUEUE_NUM_DW) <=
> +	return CIRC_SPACE(pf_queue->head, pf_queue->tail,
> +			  pf_queue->pf_queue_num_dw) <=
>   		PF_MSG_LEN_DW;
>   }
>   
> @@ -312,11 +313,6 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	u32 asid;
>   	bool full;
>   
> -	/*
> -	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> -	 */
> -	BUILD_BUG_ON(PF_QUEUE_NUM_DW % PF_MSG_LEN_DW);
> -
>   	if (unlikely(len != PF_MSG_LEN_DW))
>   		return -EPROTO;
>   
> @@ -327,7 +323,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	full = pf_queue_full(pf_queue);
>   	if (!full) {
>   		memcpy(pf_queue->data + pf_queue->head, msg, len * sizeof(u32));
> -		pf_queue->head = (pf_queue->head + len) % PF_QUEUE_NUM_DW;
> +		pf_queue->head = (pf_queue->head + len) %
> +			pf_queue->pf_queue_num_dw;
>   		queue_work(gt->usm.pf_wq, &pf_queue->worker);
>   	} else {
>   		drm_warn(&xe->drm, "PF Queue full, shouldn't be possible");
> @@ -382,18 +379,42 @@ static void pf_queue_work_func(struct work_struct *w)
>   
>   static void acc_queue_work_func(struct work_struct *w);
>   
> +static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
> +{
> +	xe_dss_mask_t all_dss;
> +	int num_dss, num_eus;
> +
> +	bitmap_or(all_dss, gt->fuse_topo.g_dss_mask, gt->fuse_topo.c_dss_mask,
> +		  XE_MAX_DSS_FUSE_BITS);
> +
> +	num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
> +	num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
> +				XE_MAX_EU_FUSE_BITS) * num_dss;
> +
> +	/* user can issue separate page faults per EU and per CS */
> +	pf_queue->pf_queue_num_dw =
> +		ALIGN(num_eus + XE_NUM_HW_ENGINES, PF_MSG_LEN_DW);
Do you mean ALIGN here? This is queue size in dwords according to the 
name so isn't it just max_queue_entries * entry_size_in_dwords? I.e. 
num_dw = (num_eus + num_engines) * msg_len_dw. ALIGN is just going to 
round up not multiply up.

John.

> +
> +	pf_queue->gt = gt;
> +	pf_queue->data = kzalloc(pf_queue->pf_queue_num_dw, GFP_KERNEL);
> +	spin_lock_init(&pf_queue->lock);
> +	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
> +
> +	return 0;
> +}
> +
>   int xe_gt_pagefault_init(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> -	int i;
> +	int i, ret = 0;
>   
>   	if (!xe->info.has_usm)
>   		return 0;
>   
>   	for (i = 0; i < NUM_PF_QUEUE; ++i) {
> -		gt->usm.pf_queue[i].gt = gt;
> -		spin_lock_init(&gt->usm.pf_queue[i].lock);
> -		INIT_WORK(&gt->usm.pf_queue[i].worker, pf_queue_work_func);
> +		ret = xe_alloc_pf_queue(gt, &gt->usm.pf_queue[i]);
> +		if (ret)
> +			return ret;
>   	}
>   	for (i = 0; i < NUM_ACC_QUEUE; ++i) {
>   		gt->usm.acc_queue[i].gt = gt;
> @@ -418,12 +439,16 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
>   void xe_gt_pagefault_fini(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> +	int i;
>   
>   	if (!xe->info.has_usm)
>   		return;
>   
>   	destroy_workqueue(gt->usm.acc_wq);
>   	destroy_workqueue(gt->usm.pf_wq);
> +
> +	for (i = 0; i < NUM_PF_QUEUE; ++i)
> +		kfree(gt->usm.pf_queue[i].data);
>   }
>   
>   void xe_gt_pagefault_reset(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 10a9a9529377..c40b9c1b5fec 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -232,9 +232,9 @@ struct xe_gt {
>   		struct pf_queue {
>   			/** @usm.pf_queue.gt: back pointer to GT */
>   			struct xe_gt *gt;
> -#define PF_QUEUE_NUM_DW	128
>   			/** @usm.pf_queue.data: data in the page fault queue */
> -			u32 data[PF_QUEUE_NUM_DW];
> +			u32 *data;
> +			u32 pf_queue_num_dw;
>   			/**
>   			 * @usm.pf_queue.tail: tail pointer in DWs for page fault queue,
>   			 * moved by worker which processes faults (consumer).

