Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EA9EFB7F0
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 06:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85F210E6B9;
	Wed, 25 Feb 2026 06:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mnHXe5im";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706E210E6B9
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772002711; x=1803538711;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OFRWUFEJDQA4jjydgYzI1QREDmc6BnJXow1SwOMW49E=;
 b=mnHXe5imD6qDyP1gUBZ5guUn5ShRRgYFc57Mk/4L7MbUQnTEJw15e828
 VcxydHlb1XPirkTq0SgGsvznZyyFMfNRoYXiUnzGep3Y3AjgLllJmG0Av
 rLo8jlXkuy92xmZ5MOemQrJzMvnxf2mpTZtf/2sNx6P5voDeeHz/QmObr
 5wy5m6omrTJj3SOeglLXgOoNFOPUfaWpzrKdYylgg3bS1HOp6lRuUU/HR
 D11dzjPrCyH4dVdf6CaW9j4cyXWCLELl07jhCV3L5Xb5RhBYOGpgZE4l3
 HMb6RuAdPOhDL3uY1vnuZisnjv0Cr7b8fzhmeUIV3BT3bcXyF3JQ/lxQP A==;
X-CSE-ConnectionGUID: XXMd64TRT3CcvZg9jgeN7Q==
X-CSE-MsgGUID: Bi+/UBEkS8Wiy1hsm+/CSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72070847"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72070847"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 22:58:31 -0800
X-CSE-ConnectionGUID: GqGDyx5nRYSJx4V+w+hpWQ==
X-CSE-MsgGUID: tLlTkaAYQ6C+6YP0tXlHpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="239156183"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 22:58:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 22:58:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 22:58:30 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 22:58:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyWfwiRlNmMMcSKJ/LEXt7/npfuKdNEiPmwhtAaa9M+0HOjb9hbuS+K2SuQm+pmskf3bRPAorsh0ALh/fMLcQPzXL9opRIJ74tR73ZOEo046HHAAfryBUJh0DTP4JNjWD3CGziL+J7l08V+YTZ+uyD1i5/6/96yjDx4ofdd5dVFvIIgO697r3SpDdRiEmEC0QI5VDdP/h8nYHwYJWG0lxdxXvfY9ymc7+Uqxna4rm1vtB7Xqd3Io/oVEES36bJPEYEESJfrDcCD2eKFO1DW+qmxIzv1kF47WJHxGjCOAipO6zEAEur1zxh4PXH0MwA9cBx6cVGHFEXcfJ08mfoLLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWRquWbeWfbekAhN1jN31oZLyax1SfKPFu8GbTFA+ZE=;
 b=bmeBy8WqYYGoahxxM+FCil14U8RVOeeU1xpcPuX9zFhF7QpGNbgaWkLseyXTroNvxyhiVPMHbfKW6nkhEfpp5qR6sBDLvxQKxTDR4IxFs+nKZ9UkRjZDvRsNt+lYVpvO/wxIYIgJBMyvJhRwiK7LltW8LYy4kKjhyShWV4JsN34vXpal/NAM6Rtv8hDeaVs21VSn6h+PojEOuoX8ZzL9WjnplAW3ckkXbyAWvbsF1aYC75U+8OcC1BcMUGRDEdNxjrQ6FX8jXnA5jrg2bF0tOV3/JiUXNkbX2iOh84YRgMFNrm/3jpMDdt5eNnWo3qd5CLyQ94//Ixrs0bDPJ7O5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5926.namprd11.prod.outlook.com (2603:10b6:510:14d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 06:58:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 06:58:22 +0000
Date: Tue, 24 Feb 2026 22:58:20 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH] drm/xe: Skip BO migration when platform supports CPU
 atomics on VRAM
Message-ID: <aZ6djEEAx/ktco04@lstrano-desk.jf.intel.com>
References: <20260224092758.1880683-1-varun.gupta@intel.com>
 <aZ3Z/fGBaTBtyd2K@lstrano-desk.jf.intel.com>
 <9ad9bac0-1fe0-4dc2-b767-b2285653d4a4@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ad9bac0-1fe0-4dc2-b767-b2285653d4a4@intel.com>
X-ClientProxiedBy: MW3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:303:2b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 164cc9aa-db8d-4f96-4527-08de743b43d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2Y3SXFZaXNHVElwSVp0dVlZbTBXeUlmd0xzY2NVWVNGcmVtdCtRQ0RnOFNW?=
 =?utf-8?B?R3ZObmozcnhZUDhGVk1RTnV3R0xpY3hlcjdsSit4Z2ZHYVRoNTNBU2xDNXdk?=
 =?utf-8?B?dlFYNkRodXI5aS9STy9xbWpuVityRlYxTUJqdllFeE0wd1VPZXlOYkszRXZF?=
 =?utf-8?B?Y2xxZFB1Wjg1SnRaeldLLzRLVlRZT2hlV3F3cmtzZnFyQ0w4MTBHTm43VFEz?=
 =?utf-8?B?V1V6ZGRPOVlhNnQ1SUFwWVNVRkY2bkw1TDFjN1o5d3B5dTQxSGN4WXBTNzFR?=
 =?utf-8?B?Q0JyN0hVcmpPQ2NBSUJvSGc3ZUllSXpGNnVoS1hDaHZqbDVvM3orNThQZmxq?=
 =?utf-8?B?dDA5MCtCYXJEdnJEVlREOS9KTTlISzhRVVNqbHFsNldhc1RJcDJlU3dOZmFG?=
 =?utf-8?B?bGZ6NUVOQUIwMmMrTEdSN0c1eDlEMlZEQk5MQVZzSVBEUHY5WEtpejhURk1M?=
 =?utf-8?B?YWFuOUNrNmpWdzF5UDZKRHBqbVJocCs1V0NreGxiWnJERG9sWXlBai9SVDdY?=
 =?utf-8?B?enkwRFpTcDFEaU9BdkFQM0xVYndEdnN5eXAvZXZuMVFHTE1VemhtZkN1RUVU?=
 =?utf-8?B?MUZ2TUhkdEJUbUtxVzN6dmxLa292NGxnVmFqOEZTek9ib3dKRGljd0c4WjA4?=
 =?utf-8?B?QlJWR24zZVd1Tmxpd3NWZ21iSzZPNzJWSkV4VHZZajlFUWtoWTljUXlBSm5R?=
 =?utf-8?B?ZllMbWhLSDk2dFE2YTl0WGs4VDFWMjR5eVdVY0tYOExKM1BVdUlOUnVzTXZF?=
 =?utf-8?B?RitWdTZoUXBJZk5pd3pBUzR5RXZXTXJUanNsekw2ejVRcE1MNGFWNDJqdnc3?=
 =?utf-8?B?ZjRteXRWQkxpUDh1U3NNaUpPbGk3aExmM3N6WHpKOVFPR1lNenBvRnRxQmFO?=
 =?utf-8?B?WlNlMkUrLzJyZ3g5MncrUjZHUEZiYllvVHM4THVtcktQTDV1bkcwZFU3OW9r?=
 =?utf-8?B?OW1vMlREWnp6c1pFZ0VubUd1ZGlId2wwL05iU283bXZlalFNOVlNVWJYT0VG?=
 =?utf-8?B?a1FhMGQ5cTVtMmJRWG1xZmo2Y09WNlZsZmN2akZxek00dHdsRnQwRU1uVUxF?=
 =?utf-8?B?aWRLV01SMndRZENxZWF3bmtrdTVlK2h1WGRLd2FkVGdSL2dGTGdCckR2OHpa?=
 =?utf-8?B?aDZnNGxPYkR1LzM5M21jU1BIWjFaVlRGeXNpYWtYcW5lNW0rM0l3N2JiVWxH?=
 =?utf-8?B?RHl2YklyNVhFMlVWUDNOTERlTW9zUTlDZmFRbmVLNTdGSEl5aUx3N3ZTbkEy?=
 =?utf-8?B?TitjWll2TW1IVldRZU0vTHRSK0c1WHp6T1V3bkZXQlVJOFlVZzVQWU0xR3By?=
 =?utf-8?B?aHptWWtBNUZvWDF5TkJGZnMwSG1ndDBOQzZ3RTF4dWFzdWVGcWk1eXBRamJ5?=
 =?utf-8?B?Q05GS3Bha2Z6OGhaaUpaNVBzb09JYXkrOWtMcUpQUGFOR2hreGwxRmhQeS9E?=
 =?utf-8?B?ZUdVSkxUdnVuc3AvUkpoUm11NEVHdlFUcmZGU0ZJeUZHVm5kcUx3aS9RaDlE?=
 =?utf-8?B?L3VqWHJQWXVvZEs1dTNiYk4rMTFPRDhLVm93aFVzMUtrZlJsQzBCcEx3VmJs?=
 =?utf-8?B?NGxkYStXZjV3bm9nOHhRVERwclphdWxXVW5mdGtEa1JPa2xZeERzTlZDMTdS?=
 =?utf-8?B?WmhYSjc2T2xGVjBpZ0g2ZVZxQ1UrdkJvUGNKZ2FGSS9odHZ2U3RYWGxlTThU?=
 =?utf-8?B?YmRqZU5oTDFoL09rK0UxSmxBRHlOUENQMXBKNnNWVDlpZkdDTzVRU2xTVzhK?=
 =?utf-8?B?WG42UUJYNm9lNXdHY2ppUUZ1Vk91clorQ1NWNi9DRzV4TDZwU0FPdkFlZVo0?=
 =?utf-8?B?enN1dWdJQ0hTMm13b29BaDVxNlNuYXZmR0xnNFdYQUdnMDBCMXkyelI4SDFQ?=
 =?utf-8?B?SkRBWS83VE12bnVJRzdkZldlQlN1NXk2czN6TXFIVkplaTNONG1WRkxHbmYw?=
 =?utf-8?B?SXhOaC9ybm12YlV3UC8wTUR3TkFkc0Vqc0cyT3ZxaGhvRzNuYVhEbzl0dDBQ?=
 =?utf-8?B?ZnBOUFhRc0VUZXdmSy9zK0hMVm05TUl2NUY3VFExeWx3QnFrcDB1bVVQMFo0?=
 =?utf-8?B?dmhpOUg5U01HWTUrMW5zbkVCN3o5OFJuSjQwOFEzYmpnQjBSZ0VybThYMDF2?=
 =?utf-8?Q?s/Wc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VSt6bDZNekUrZkpqNStXb083RHFmRjZ1S3NyNjJRWEJXSUUxUDFFTVNFdHBk?=
 =?utf-8?B?QTNVQWtueVp5VURLK3hFVXR2ZW1qZzIrUFdsT2dvTFA3aWhBblVtS0JsRk02?=
 =?utf-8?B?OGwrYzJNT2hIaFJhZnkvdkF5Y1hxc29OWldQRmp0bUdsRDFzb1kxbEYyL0RB?=
 =?utf-8?B?Y24yWjhIMm02bTkvVDlMOWdzazhmY01Idjd3RHFGc3hVWDhqU3ZVNzZFZU9V?=
 =?utf-8?B?ZVpFMWNSdVBkVHdoSHNPQWV2ajNacmRUZFIzWFhqVFYrZEZQalJYdCszejR2?=
 =?utf-8?B?L3MvaldhOHNPa2R3Y1NoOHpvT2szeEZUeGgvSVJUWjIzSGdzRHRPVkhpRlY1?=
 =?utf-8?B?ekg0OEVrMTFDUWVOb1JTa2NTR1FwVll1aU43UmlCcjVSS1UxNzQ0cG5vOUxE?=
 =?utf-8?B?UXdnb0ZoeTRNRVV2Y3NQMHNSY3NmZmVGUW5USmIvd3BQUFJMWVZSY0ZCdk5m?=
 =?utf-8?B?RUxHWS9Qdld4TTNpT2pOdFJrbksvaDNDQURHa3BZeVhCTEZZMk9wRUhmSVM4?=
 =?utf-8?B?Nno3OUo3R2pEeENGTVJzQllBaTBtTmNhNUhSa2J1S1lTYk8ycDgzREtDb0M5?=
 =?utf-8?B?RldzSnY0Y3dLK2N1b1lHSEN2UU43alRwUHVqdDJlUEd0eWhjOXBPTm5ueVQv?=
 =?utf-8?B?Y003UHp4Yndsai80TGRYMGFRRzl6Ylowa01ucDNIdFRtODZQaWJ1aWJNdEJZ?=
 =?utf-8?B?WlM2YUVXeWdiOURsTmMrZVFNcy9wazJTdXltZnVQL1RESk9Ib0NrbUUxcEgr?=
 =?utf-8?B?c3lpQXNHRE9zNjRIdHVZQlBHVVZaVzFnR2tzMnZUcWpRTkl0ZmxZZnBJNFNK?=
 =?utf-8?B?YU5rVkdidEQ3QTIzN0ltVkZWV3lxbklXblljVXI1aGx0UGUyQ0VLU1U5UnhH?=
 =?utf-8?B?a29mQ2hoa1pERGErK1B6VVRGU3cxbm5HNmwwMThYYzNXYWFhR2JNODhldW5C?=
 =?utf-8?B?MXQ2REs0RUdtbmNmeG9hVWJPQTcvejVNN25pU2NFUGN0ZFV3VklGYS84Z3lw?=
 =?utf-8?B?MkZ5b1g1b1dXK0EwY2VHdnpjOWtYVjJBM1RpWnVDVzc1M1dzdDFTRndqTVM4?=
 =?utf-8?B?TmtUcHNpS0JyVyt4WFlDZGMxSThna0YzSmJXWFJjOFVrZjRvMG1iZDR3ZXJP?=
 =?utf-8?B?Y3hhWS93TE5OdzVqYXJXVGN0MlIwakFnYm5OZUFhczlSdDRCNW53dC82eUVY?=
 =?utf-8?B?NTZEckNVK2YrWVZ5U2JHbHJNcldhcnQ0Um04cmJkRUtESTR4YmJoVFB1NnZn?=
 =?utf-8?B?Uy9DUHg3Yzk0dDR1amVuMCtsY2l0cWpRalR0U1JnZ1d4Y1JjaEREVzNPZnIy?=
 =?utf-8?B?cnljaE9xR1VYREF6WjAyZ3NXa0pLd1lmVklkaU4xK3VFTUNzZVJRQ0hmSDdu?=
 =?utf-8?B?MHMzeTRVbHp3anJndm84QllOVVA4RFcwVnY4bStmNUtsSWd4VEY1REQxMjVw?=
 =?utf-8?B?d0VjRzJud2grR3ltYXVBaUk4UThkL0tTY2lmaXRFWlhhOXpFUEdhVzk2bmJS?=
 =?utf-8?B?ME91T0RFaGpWZXp1MC9pSjBXT1lwTlhFMm05cDdxOWpEMFRLdktRRWk0NnVW?=
 =?utf-8?B?bUd2bWVVS21YZ1RjSENxc2dEU253Ny9YM3NrN3dVRkd5Q0F4UVdtTUlXYmtL?=
 =?utf-8?B?djRlTHNIeVFiOWhTZGtQZHQ3UmQ4T1EzNDlkcUluSmNSSzlacE9idUREdEI2?=
 =?utf-8?B?Vmx5c0JvS3crYVNWSEtKZzlyYk9TbitLOWozYkVmQzFHdENvYndYcnNxNmJ0?=
 =?utf-8?B?MmxjbTRLLzFUSkd5YkdlZS81WnVaM3N5Tml2SzhCdThFNjJsRVptNmNLZTBS?=
 =?utf-8?B?aUhnN2pQNUZWblZLVzcwY2ttRnVFOE9EN04rUXNaVWZHNVlWSlR1NXh2WUJl?=
 =?utf-8?B?ZW0yTHlVM01WUWZNaE1HaGtTa3hJQ0RDOThpellVcXIzQzBKRmM4T0ljMWNh?=
 =?utf-8?B?NWxqdFhTSGF0eWpwdStyZUNCaGk1U1FxSEhpVTlQNTM1Z3k4ZU9XNzlRZVh0?=
 =?utf-8?B?NTloaElzV1c3emFyeUxyWTNhR1Nubkl6WXVzdWRUU2VpeWpmWTFIZGQ5Qkx3?=
 =?utf-8?B?aHhUV1lwTmI1NTRFNEhRbk1UMTFsWVA5dVR0enRjRjkyMTZEVmp1WkxzMC9r?=
 =?utf-8?B?V2dBWUlCMlV1K0x2WTBhV2N2Smp6d2ZqeEFmWGZYRnBRZDZwc3hDYm1BYnFB?=
 =?utf-8?B?VEd3VjdmbnJBTFVFSjNneXFGMFZoTWJtK2kwZ25pTXBVdmdKb1puMHlFTUY4?=
 =?utf-8?B?VDNib2p3eXhXWDlkcHl1a21PdyszUlNKKzdFNzUvUVVFRzBCNGtwNjRvMW9V?=
 =?utf-8?B?aUwzRGVSQzM5T2c2L1ZDSk1IdmRpaU5HNTNwQ002dmRzejRuRU9GZW85M1dI?=
 =?utf-8?Q?V09i1Du5RSpi6Pi0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 164cc9aa-db8d-4f96-4527-08de743b43d9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 06:58:22.4794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: snLOQZ1fQtqHRusjkFLBTdpMy/mK7KlQfN2JSLQtDpzo6u9elX7upSc5MFp5mZm42/ATWlaaqviiOWubWd3msA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5926
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

On Wed, Feb 25, 2026 at 11:47:17AM +0530, Gupta, Varun wrote:
> 
> On 24-Feb-26 10:33 PM, Matthew Brost wrote:
> > On Tue, Feb 24, 2026 at 02:57:58PM +0530, Varun Gupta wrote:
> > 
> > Are you sure about this? CPUs supporting atomics (i.e., CPU instructions
> > with a LOCK prefix) over PCIe is news to me. Why do you think this is
> > supported on Xe2? Also, wouldn’t the CPU factor in here too if it were
> > supported?
> > 
> > If this somehow works—which I doubt—I think we’d need a test case where
> > the CPU issues atomics and the GPU does too. Then verify the result,
> > e.g., both sides perform 10,000 atomic increments on a VRAM page and we
> > confirm the final value is 20,000. Maybe we already have an IGT madvise
> > test for this; I’m not sure.
> > 
> > Matt
> 
> Thanks for the review,
> Before sending the patch, I only tested whether CPU atomics on VRAM were
> self consistent or not.
> But that possibly worked only because root port serialized the read write
> instructions instead of actual
> atomic operation.
> After your suggestion, I wrote a simple subtest to run concurrent CPU+GPU
> atomics, and observed
> that there are some lost updates (around 150-200 for 20000 operations).
> Do you see any other approach that could make this work, or should i drop
> this patch entirely?

I don't how it is possible to make this work on PCIe without dynamically
removing mappings on either side to ensure exclusive access (current
implementation).

I'd just drop the patch.

Matt

> The has_system_atomics_on_vram could be kept as dead infra for future
> CXL-attached devices where
> host-device coherency actually works.
> Let me know your thoughts.
> 
> Thanks,
> Varun
> 
> > > should_migrate_to_smem() forced any BO marked ATOMIC_GLOBAL
> > > or ATOMIC_CPU out of VRAM on a CPU fault, regardless of whether the
> > > platform actually requires it.
> > > 
> > > Introduce has_system_atomics_on_vram to the device capability flags.
> > > should_migrate_to_smem() now gates migration on this flag, eliminating
> > > redundant evictions on capable hardware.
> > > 
> > > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_bo.c           | 16 +++++++++-------
> > >   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> > >   drivers/gpu/drm/xe/xe_pci.c          |  5 ++++-
> > >   3 files changed, 15 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index d6c2cb959cdd..848467ca6700 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1771,14 +1771,15 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
> > >   static bool should_migrate_to_smem(struct xe_bo *bo)
> > >   {
> > > +	struct xe_device *xe = xe_bo_device(bo);
> > > +
> > >   	/*
> > > -	 * NOTE: The following atomic checks are platform-specific. For example,
> > > -	 * if a device supports CXL atomics, these may not be necessary or
> > > -	 * may behave differently.
> > > +	 * Migrate to system memory only if the platform does not support
> > > +	 * CPU atomics on VRAM.
> > >   	 */
> > > -
> > > -	return bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
> > > -	       bo->attr.atomic_access == DRM_XE_ATOMIC_CPU;
> > > +	return (bo->attr.atomic_access == DRM_XE_ATOMIC_GLOBAL ||
> > > +		bo->attr.atomic_access == DRM_XE_ATOMIC_CPU) &&
> > > +	       !xe->info.has_system_atomics_on_vram;
> > >   }
> > >   static int xe_bo_wait_usage_kernel(struct xe_bo *bo, struct ttm_operation_ctx *ctx)
> > > @@ -1804,6 +1805,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
> > >   			       struct drm_exec *exec)
> > >   {
> > >   	struct ttm_buffer_object *tbo = &bo->ttm;
> > > +	struct xe_device *xe = xe_bo_device(bo);
> > >   	int err = 0;
> > >   	if (ttm_manager_type(tbo->bdev, tbo->resource->mem_type)->use_tt) {
> > > @@ -1811,7 +1813,7 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
> > >   		if (!err)
> > >   			err = ttm_bo_populate(&bo->ttm, ctx);
> > >   	} else if (should_migrate_to_smem(bo)) {
> > > -		xe_assert(xe_bo_device(bo), bo->flags & XE_BO_FLAG_SYSTEM);
> > > +		xe_assert(xe, bo->flags & XE_BO_FLAG_SYSTEM);
> > >   		err = xe_bo_migrate(bo, XE_PL_TT, ctx, exec);
> > >   	}
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index 8f3ef836541e..2fe643c179fe 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -205,6 +205,8 @@ struct xe_device {
> > >   		u8 has_usm:1;
> > >   		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> > >   		u8 has_64bit_timestamp:1;
> > > +		/** @info.has_system_atomics_on_vram: Supports CPU atomics on VRAM */
> > > +		u8 has_system_atomics_on_vram:1;
> > >   		/** @info.is_dgfx: is discrete device */
> > >   		u8 is_dgfx:1;
> > >   		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 56a768f2cfca..f2d86e08e190 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -925,8 +925,11 @@ static int xe_info_init(struct xe_device *xe,
> > >   	xe->info.has_asid = graphics_desc->has_asid;
> > >   	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
> > > -	if (xe->info.platform != XE_PVC)
> > > +	if (xe->info.platform != XE_PVC) {
> > >   		xe->info.has_device_atomics_on_smem = 1;
> > > +		/* PVC doesn't support CPU atomics on VRAM, Xe2+ platforms do */
> > > +		xe->info.has_system_atomics_on_vram = 1;
> > > +	}
> > >   	xe->info.has_range_tlb_inval = graphics_desc->has_range_tlb_inval;
> > >   	xe->info.has_ctx_tlb_inval = graphics_desc->has_ctx_tlb_inval;
> > > -- 
> > > 2.43.0
> > > 
