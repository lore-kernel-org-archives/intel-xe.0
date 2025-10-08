Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ADDCAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 19:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C818610E8D1;
	Wed,  8 Oct 2025 19:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSrEK+JA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF6010E8D4
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 19:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759950623; x=1791486623;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MJZiiVWu1brFh/ZJ/mjt8KcJOHyxhV+znmc4WladrGY=;
 b=RSrEK+JAPwtz7TKCLZkSrfHhgSAqA586kWP63Po0Fyo4LbMHD3sD9yJy
 He0lFo5sxvttnFWeQ6ORLsRSsNuUvD81xjp7DaVsAw4/3xLcK4l1pSTpI
 r0RLTGNHXDJ7acoazgHuOiFgpvNTKBaHADclQO6fB6MuYPUfFsBPIAqRP
 HGX3V8qa2akzUqHs8/Cr/IT+ZuBCyYO3i/vuCLjvVic1uJv21OBa7MInT
 XuQ6Gqbk+hUP5rxNOjUfwmo9nOL3VBf6KwUB1x4pJB1ziyEXu5PH8tUfZ
 gAuuyE3EqrgI6OeSm9+/70KWzyX2Ukj2Ke4mrcY3MNK7MhG+VxWenRrmw A==;
X-CSE-ConnectionGUID: hhvZGMg4StaxxH546zsW8A==
X-CSE-MsgGUID: bNGoF+T4Q9yb0qUe99bDsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="72831586"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="72831586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 12:10:23 -0700
X-CSE-ConnectionGUID: LSLmvtfJTDuBCRi9WIbT/g==
X-CSE-MsgGUID: OAapOvUXQ3upK5vignsw+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184781533"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 12:10:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 12:10:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 12:10:21 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 12:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvtuODLOM2zF8xXf8ZmURSv/umi62VS22yRao3lU7ScxwwJwZA5N8tXtfkHKWPYDRWUlI79Wa48nhw1kFapo35OJfoLZXD9MSZjO7R20CMa6v1LdBGIvexuhHwmXdm6OqEd99S9qGTrL38QJaOCTj/dquyuvZS1ac7mpocWgCGcasbxpf+Itt0sZo2O6Lwz6yAyFWX5YATmCMxIrNij6PLKf3AXwLpElNW0aLVNgyuvDoG7ksHLkVEgq4JIY8SWCcVw8P01lNsaOlYkUHoIpTDosejPiDXWTby/9kpRotvvc8nnKOMf6UN3Z4mdUZeSJSjDy5HEPhRPtash+iO3eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZ4Tno74x6oyfVHKFt7WdoxxYJs37j+oHN5ulIow8CA=;
 b=d8mA82vld2kpm4t9WQVUZyvoMktVKgxDM1D8VM6JYfkcToNKZtLKRmROif/6fWzQiuuBoUIjKFhIBepyfxYuMlXvsA5cp7/zg9xAsi8yWStF6L+2jGWcJwqdxTwgn9aeB+tNyHpE1DwTu6L1YU4ZP1KcvwX/1egQiX2IiZzpcRvimGjS1ZRZoLuvhUwYL7BuE2JgO6P9t5A/VGgXNwwOUQnpnLT4vnZH19rIZJ61qe8VjDv3Hp6GlHs9OPKcJYUdXoasdD+DpWmGndozAGoC6e0PLGZIp2GxggoEFUPtbHtNS2zCF+LSd2p+Ff9Dr7UTERi+RM7G8Lhli4b5eOKN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 19:10:17 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 19:10:17 +0000
Date: Wed, 8 Oct 2025 12:10:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 22/23] drm/xe/configfs: Add attribute to disable GT
 types
Message-ID: <20251008191014.GG5409@mdroper-desk1.amr.corp.intel.com>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-47-matthew.d.roper@intel.com>
 <ibppcxcdcx3wxqxxccxun6kru6fr7mtnaddvxfbjzfaoxss65s@n7btsnxddgub>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ibppcxcdcx3wxqxxccxun6kru6fr7mtnaddvxfbjzfaoxss65s@n7btsnxddgub>
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: b6666c96-7970-42e7-ff13-08de069e5149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkFrTkhhN1JtVTI5NURXMy9CMmFrQlZNR3E0T3padFEyUUFHS3VUQ0hTSG1x?=
 =?utf-8?B?MTZYVkVFUm1ZV09zV0xtZTViKzZNdEsvZ2kvTFZrS0d2clRRZm1lY3hqSThy?=
 =?utf-8?B?cXRvNjZRcWlYOHRqYzlIRHVpbU9pM3g4bFNtU252d1RmU1ZpdHFYZDRSTE1v?=
 =?utf-8?B?Yzg4NWJub3cxWnhZMndqeVY1VmxyaVZobnFHbVNzMmQvU0FYQ3loTzZiNE5a?=
 =?utf-8?B?WVhQTnUvTFZORXlyZWRhaXhXSUFGTVpZemtJOFFMZUZ0RVUwTkp6Y0YzUi9M?=
 =?utf-8?B?WTQzU0V6b045K2U0aVk1VGI0VnBpZlh5bFNxSi81STVQWEN2ODlUbTFzQzUr?=
 =?utf-8?B?c0ZOKzZQTTJ3UFQxYVRINDhBU01aZ0VXaDNhWXdpcExhaEJkNlVJdjVXNjRp?=
 =?utf-8?B?SkU1Y1M2NEgvU0tHZWtDZm5HMElZRThta0NQTzlBT0dQTTFJVGQ5ekE5Rm91?=
 =?utf-8?B?TzBMNk52STJ3S1M1OTJPVW8yQTNFZVVGNUdUejZBVUFhMTJrMzlQMnMrQnMz?=
 =?utf-8?B?YWYrRXhyNWxzbDFmZDdxWHVxckNPd3dwQ1dpRW0wSXhxOWpJUWRjQWhrWFVL?=
 =?utf-8?B?RWZBa2hzOURvdmlqOUtBdHRISDYxNUJDSEFETHBrUEdjUWEyUTdIRk1SWU1H?=
 =?utf-8?B?S0N3Y0Q2RGp1cWErd3VEYnA1MUp6MWlsV2JWVUxJWTYvRmRUc2VmWWhEVDFE?=
 =?utf-8?B?WVorc3UxQm5YWkhuM040TWhzQWNFeGhvdFYzU3pidnUzc2dpVW1KOWFlS1N6?=
 =?utf-8?B?ZHZVL3hsQ2hpMUVyaFpkZzlUNG1BNkVXdFN1M1FaN09mdDZmR0grNXN6KzNu?=
 =?utf-8?B?V2p6TmFSY1RBakdUK2tyTVJwMmFCZVBNS1JrcmV1NVYyVEpaWG1ob1E0QkQr?=
 =?utf-8?B?VS9YaldCeG5kWVhLbllZazVBZnVSZVUwVW9VZCt5ZzdLZ3lrVmRJVmE3U3F2?=
 =?utf-8?B?anVSL2FxNnJuR25IZFVPMXNJSVBkajVJaVZrRy8zcFRkcVdtb2hJOXZvd3JW?=
 =?utf-8?B?aUpWR0kwU21wbFU1bW8wakVQL1RBWW5nYzFGcW9XeVA4eHF5bjBMSnlkMVJ5?=
 =?utf-8?B?bE5KN2hnSlJEb0k4bWd2L1A0bVhLTlNzZlA1UU1LQTZBN0wxVnBBOUNudHpJ?=
 =?utf-8?B?Y2piOExqdEZhb1hxQ2VIVkdzZWcvaWhYUkNQU3JJZ3Y5MHhHcXFHL0lPOWRS?=
 =?utf-8?B?dlZEVG5zemV2R0N5S2MzeUltM1BPWUJQQXlOZitjZzl0bllkdlZrRWZoNGQz?=
 =?utf-8?B?VFB0a20yRnpZSktRb3ZnVSs3Nml4T0xUNEt2VHVaSVpLTDB4eEw2VTBHQ21F?=
 =?utf-8?B?Vis0SHU0TEk0cVJWR1NUZzJ0a3MyT25TL0Vkekhja2V3MHVmZFE3d1NVMnRU?=
 =?utf-8?B?QS9iZ1lzVnh3dDFidjdKS0VxdVhMVE1lc3BFNGlBOVZ1OGY0R0tURG8vRDNa?=
 =?utf-8?B?Z1hXR0NkaVVkeWdkajlIQXN4enlWT2pCN3pFcW5KWGYvZlpYcFFkeTh6YjV5?=
 =?utf-8?B?UnlzME5mc3p5dTY2WHFMelF3OTR1ZmdTRTJVZnB6b3VRMTlaWHoxY3lYeDE5?=
 =?utf-8?B?STJlL0tlTnFBdHhrRXF4U08rcjBNMktBNSs3WTg2UDIyU1lzZGVjeEMwcFpC?=
 =?utf-8?B?SjBNb241MnovWUxIZ3BsRGlyOGJQNjgxQ1d1bkNPL2k0K0lYNGhSRVNaUnVN?=
 =?utf-8?B?ZGNRUkFBUVJldjM3NXptbjNsKzh6eEo3VmxrTVFkZ2lpWFpiTDNZMzFFeFpE?=
 =?utf-8?B?RGR5V0N3ZS9nODRwK0pUV0Z6WHdHRXlmMm1oZU5YWWRiKzBybFRNRG5abjJ4?=
 =?utf-8?B?MVRtV3IybWk3SWx4V3A4dW15ZnNDZnU1bStIOXIwbGMxMDMxNkZJMlVRSmRl?=
 =?utf-8?B?SlA0SGNtSk9zSGE0SGNsam1yNkhWUFhQRnBtTDlZTlNIZW4rSW5RY3FxREhE?=
 =?utf-8?Q?bO/6vC1jefu5vdTe684W/wt8CKMmmH5t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHp0dnRNUmNsWjJQTzdOa1NvcnNhL29SZnQ5R1R5M3FxUlZZa0pDS0lITkNT?=
 =?utf-8?B?eHlSS2d4cjRUTEw2Y3hPTDM4WXJ0eXpnZXU0WTNrOEVTMWt1bVBsTlRnU0hN?=
 =?utf-8?B?N3p0bHZkQnQwL1R4YmtUdUVGOEo3Y25LSVo2WHA5NTBvK1puUUhSaHBJY3kz?=
 =?utf-8?B?dnRSNWczSUM4bkQxYTdVVDJtTlFjNjU1OFpJWjhCYzQybXhxQTVtYXNTY2Iy?=
 =?utf-8?B?UHpMa1NYMHY1QUJkUE1YK21sL0RaMGpZU0V5OU15YWVNNFlQRFE1N0s5eEkx?=
 =?utf-8?B?ZzdyWmY2VzRQK2VYaENORjZFZERnT1hKM3JlbFZwQUNlcFk0SjBoaC8xVitr?=
 =?utf-8?B?QU4yeHZoS3lZVW1VVlpCV25mWjVudWJ4eXZ1SVN4YmZ2ZjVqZnZZL1ZqeUc4?=
 =?utf-8?B?ZWNpZmtlaHduRlVMOXdjSmw3Y0xjN1k0bndOU2RuRi9lemh0NzVNbjI1MGFu?=
 =?utf-8?B?S3d6SnluMTcwVjgzYkZSOFhaeDFJVjY3QjAvQTB0UGo3Y1UwakJQQUR4QW1U?=
 =?utf-8?B?ZVJjYUNqdUVVb0hNc2VIS1R1NGkvRkZQMjljdzhONEQ4bFpPN254NVFGRHV4?=
 =?utf-8?B?Y0I0Yjl2N3FYalRiWWovL3dzUXRqbHRnQXMxYSt4cFY2dlgxWjJXeDY5S0tR?=
 =?utf-8?B?ZW4zcFdPbSswelFpVjFkQXNWMHpIaXU5WklhcFJBUHcvbnlYOWlpOHVFWjlJ?=
 =?utf-8?B?V3I5STBvS2ZjV3pYNWF6MzdWc3hic09sVXo0aVpzdWw4Tzh6UVlRVGJnOW1k?=
 =?utf-8?B?Y0l1QTBSdHpMVENTN1ZkRmJYVElvNVdPclZCa3FReXlxQjhMU3VVWW5mWGJQ?=
 =?utf-8?B?dXhaRXNOU2JOY2MrVWlLWE41a3h2YUdTUnVWRjk3Z2YvbG5rYk8vTitRUVY5?=
 =?utf-8?B?Snlxc3VTM1ZWRHRqeW5hdFh4eGR3Q01lbTdFVTVnYnZnY0o3b2VNQ0pPL2tO?=
 =?utf-8?B?cWhNa1ljbCtTcVlXazROYTExRVQ3QUVvSzBTd1BFUlAxc3NreGE3RmlrSkNv?=
 =?utf-8?B?VkxydEpiUmhHMjhUTWh3NEVvS25JbjJ2cFZ6MlgveHN4ZzZZRStZd29VVExa?=
 =?utf-8?B?ZG9iRWxiajVXc0xEZm1BZ3VpRWtyc2hHeElaNzdzcDlTNWFPL0g2VG1wbXhZ?=
 =?utf-8?B?RUxyV05WeXBLK2lkRTg3aHFvUThqMHVQOHhhREFPc2dnNkozWFlEcjQzdG14?=
 =?utf-8?B?eTIzdW1ndTZrcVRGWFhOQUl0TSs0ZVJyRFVyRUNMMy8wZmVwcGpMWjREOC83?=
 =?utf-8?B?ZmxxaDdRVHpnd3ovZm5HMERpQUNpRVNwUkc0azlXWmRHQlpLc2lzMmdTVXQ2?=
 =?utf-8?B?Rkk2YnFDbEFScnkvUkFhR0JTSTRoeU9NbXBmdEFsNlIrU0c0ZHBTTXY1L1BM?=
 =?utf-8?B?M2YrVkxKcE44QjFXNFBNMHhUWjRJZHB4RjlFc1psOEhrRFJTN2QwbFpLNG1B?=
 =?utf-8?B?SEVmOGlYaEtac3BMR3pPVjVvV2xtckxxM0ppcERmTWlCRUtXazQzNVE4WnVh?=
 =?utf-8?B?TE9KdjhYS2xpeFlPcFR0VElRYWhEUEtHKzV0N0JlY1VZN3ZyLytFRUZNMVhk?=
 =?utf-8?B?Snd1cGk1Sy9zN0pmMk5vcmNTSDBLSTJRTFV4TGlxd1kyVS9JTk9FVkZET0Ev?=
 =?utf-8?B?N2hpUTg5ME5WeXM1Zmx2WlFsbzBKMkRiUDRKMDc0c0cwT3p6ZWhIMVhSM2Ew?=
 =?utf-8?B?cVcxMXRGL1lkY3JmVkVLQXpvUWMwWVdlNUsyaU5EVEtEakE4bloxbGtMVERx?=
 =?utf-8?B?amhycGs1WHJQZ0szSEUxM3FVSkVIVE9DSmlSaXNMTGNjb2xaRG14dmFwTmk2?=
 =?utf-8?B?emFqeU9OZFppdFh5V0ZHd1dXdGVOUTBmWStZMWZUNmdTVk53c3V5alJ3a21K?=
 =?utf-8?B?amtnbHgyS1lyNDNIeE52V1VHdXJGTTBMbXlUcytwMW5tT2FUOWR6Y1lKRkRx?=
 =?utf-8?B?NmFWMVV4U0tMQWhWN3JHOXVsaXYvcWJvUVRKeVVwa3o3djJGSWlZNi9TcTJ4?=
 =?utf-8?B?WjBHRlBrUE0xMVVXMkpZLzhsVXB2cDB6czM2QjJRR0FVdlc1VUw3QU1veVVT?=
 =?utf-8?B?RWtHN2tJQjZTL0tIdDMwUEJveCtsbkdRSWc4SlBXRGNSNzluL0VvVVZMZCtS?=
 =?utf-8?B?WEVPcWhjcjNGbDdJTU1aWi9PKzlqTVJ6NHdmVHZpZjZmdVkrUkVjL3U2QzJ0?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6666c96-7970-42e7-ff13-08de069e5149
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 19:10:17.4787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+AAjDUgOUfFoBTvwVA+cPpWXfr97Fp6mwdRHtGRVuT7jjm+v+dKDCtWcgB6WqoIPpWZb5oHqi3H7moJn10/guVcVaRgk4MD4LhoU8EYhws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
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

On Tue, Oct 07, 2025 at 10:37:32PM -0500, Lucas De Marchi wrote:
> On Tue, Oct 07, 2025 at 01:48:52PM -0700, Matt Roper wrote:
> > Preventing the driver from initializing GTs of specific type(s) can be
> > useful for debugging and early hardware bringup.  Add a configfs
> > attribute to allow this kind of control for debugging.
> > 
> > With today's platforms and software design, this configuration setting
> > is only effective for disabling the media GT since the driver currently
> > requires that there always be a primary GT to probe the device.  However
> > this might change in the future ---  in theory it should be possible
> > (with some additional driver work) to allow an igpu device to come up
> > with only the media GT and no primary GT.  Or to allow an igpu device to
> > come up with no GTs at all (for display-only usage).  A primary GT will
> > likely always be required on dgpu platforms because we rely on the BCS
> > engines inside the primary GT for various vram operations.
> > 
> > v2:
> > - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
> > - Tighten type usage in gt_types[] structure.  (Gustavo)
> > - Adjust string parsing/name matching to match exact GT names and not
> >   accept partial names.  (Gustavo)
> > 
> > v3:
> > - Switch to scope-based cleanup in gt_types_allowed_store() to fix a
> >   leak if the device is already bound.  (Gustavo)
> > - Switch configfs lookup interface to two boolean functions that
> >   specify whether primary/media are supported rather than one function
> >   that returns a mask.  This is simpler to use and understand.
> > 
> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_configfs.c | 145 +++++++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_configfs.h |   4 +
> > drivers/gpu/drm/xe/xe_pci.c      |  22 +++++
> > 3 files changed, 171 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> > index 139663423185..e36cc5e1bc8f 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > @@ -15,6 +15,7 @@
> > 
> > #include "instructions/xe_mi_commands.h"
> > #include "xe_configfs.h"
> > +#include "xe_gt_types.h"
> > #include "xe_hw_engine_types.h"
> > #include "xe_module.h"
> > #include "xe_pci_types.h"
> > @@ -56,6 +57,7 @@
> >  *	:
> >  *	└── 0000:03:00.0
> >  *	    ├── survivability_mode
> > + *	    ├── gt_types_allowed
> >  *	    ├── engines_allowed
> >  *	    └── enable_psmi
> >  *
> > @@ -79,6 +81,44 @@
> >  *
> >  * This attribute can only be set before binding to the device.
> >  *
> > + * Allowed GT types:
> > + * -----------------
> > + *
> > + * Allow only specific types of GTs to be detected and initialized by the
> > + * driver.  Any combination of GT types can be enabled/disabled, although
> > + * some settings will cause the device to fail to probe.
> > + *
> > + * Writes support both comma- and newline-separated input format. Reads
> > + * will always return one GT type per line. "primary" and "media" are the
> > + * GT type names supported by this interface.
> > + *
> > + * This attribute can only be set before binding to the device.
> > + *
> > + * Examples:
> > + *
> > + * Allow both primary and media GTs to be initialized and used.  This matches
> > + * the driver's default behavior::
> > + *
> > + *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > + *
> > + * Allow only the primary GT of each tile to be initialized and used,
> > + * effectively disabling the media GT if it exists on the platform::
> > + *
> > + *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > + *
> > + * Allow only the media GT of each tile to be initialized and used,
> > + * effectively disabling the primary GT.  **This configuration will cause
> > + * device probe failure on all current platforms, but may be allowed on
> > + * igpu platforms in the future**::
> > + *
> > + *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > + *
> > + * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
> > + * **This configuration will cause device probe failure on all current
> > + * platforms, but may be allowed on igpu platforms in the future**::
> > + *
> > + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
> > + *
> >  * Allowed engines:
> >  * ----------------
> >  *
> > @@ -187,6 +227,7 @@ struct xe_config_group_device {
> > 	struct config_group group;
> > 
> > 	struct xe_config_device {
> > +		u64 gt_types_allowed;
> > 		u64 engines_allowed;
> > 		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
> > 		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > @@ -201,6 +242,7 @@ struct xe_config_group_device {
> > };
> > 
> > static const struct xe_config_device device_defaults = {
> > +	.gt_types_allowed = U64_MAX,
> > 	.engines_allowed = U64_MAX,
> > 	.survivability_mode = false,
> > 	.enable_psmi = false,
> > @@ -220,6 +262,7 @@ struct engine_info {
> > /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
> > #define MAX_ENGINE_CLASS_CHARS 5
> > #define MAX_ENGINE_INSTANCE_CHARS 2
> > +#define MAX_GT_TYPE_CHARS 7
> > 
> > static const struct engine_info engine_info[] = {
> > 	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
> > @@ -230,6 +273,14 @@ static const struct engine_info engine_info[] = {
> > 	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
> > };
> > 
> > +static const struct {
> > +	const char name[MAX_GT_TYPE_CHARS + 1];
> > +	enum xe_gt_type type;
> > +} gt_types[] = {
> > +	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
> > +	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
> > +};
> > +
> > static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
> > {
> > 	return container_of(to_config_group(item), struct xe_config_group_device, group);
> > @@ -292,6 +343,58 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
> > 	return len;
> > }
> > 
> > +static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
> > +{
> > +	struct xe_config_device *dev = to_xe_config_device(item);
> > +	char *p = page;
> > +
> > +	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
> > +		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
> > +			p += sprintf(p, "%s\n", gt_types[i].name);
> > +
> > +	return p - page;
> > +}
> > +
> > +static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
> > +				      size_t len)
> > +{
> > +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> > +	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
> > +	char *p = buf;
> > +	u64 typemask = 0;
> > +
> > +	if (!buf)
> > +		return -ENOMEM;
> > +
> > +	while (p) {
> > +		char *typename = strsep(&p, ",\n");
> > +		bool matched = false;
> > +
> > +		if (typename[0] == '\0')
> > +			continue;
> > +
> > +		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
> > +			if (strcmp(typename, gt_types[i].name) == 0) {
> > +				typemask |= BIT(gt_types[i].type);
> > +				matched = true;
> > +				break;
> > +			}
> > +		}
> > +
> > +		if (!matched)
> > +			return -EINVAL;
> > +	}
> > +
> > +	scoped_guard(mutex, &dev->lock) {
> > +		if (is_bound(dev))
> > +			return -EBUSY;
> > +
> > +		dev->config.gt_types_allowed = typemask;
> > +	}
> > +
> > +	return len;
> > +}
> > +
> > static ssize_t engines_allowed_show(struct config_item *item, char *page)
> > {
> > 	struct xe_config_device *dev = to_xe_config_device(item);
> > @@ -672,6 +775,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
> > CONFIGFS_ATTR(, ctx_restore_post_bb);
> > CONFIGFS_ATTR(, enable_psmi);
> > CONFIGFS_ATTR(, engines_allowed);
> > +CONFIGFS_ATTR(, gt_types_allowed);
> > CONFIGFS_ATTR(, survivability_mode);
> > 
> > static struct configfs_attribute *xe_config_device_attrs[] = {
> > @@ -679,6 +783,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
> > 	&attr_ctx_restore_post_bb,
> > 	&attr_enable_psmi,
> > 	&attr_engines_allowed,
> > +	&attr_gt_types_allowed,
> > 	&attr_survivability_mode,
> > 	NULL,
> > };
> > @@ -846,6 +951,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
> > 				 dev->config.attr_); \
> > 	} while (0)
> > 
> > +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
> > 	PRI_CUSTOM_ATTR("%llx", engines_allowed);
> > 	PRI_CUSTOM_ATTR("%d", enable_psmi);
> > 	PRI_CUSTOM_ATTR("%d", survivability_mode);
> > @@ -896,6 +1002,45 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
> > 	return mode;
> > }
> > 
> > +static u64 get_gt_types_allowed(struct xe_device *xe)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> > +	u64 mask;
> > +
> > +	if (!dev)
> > +		return device_defaults.gt_types_allowed;
> > +
> > +	mask = dev->config.gt_types_allowed;
> > +	config_group_put(&dev->group);
> > +
> > +	return mask;
> > +}
> > +
> > +/**
> > + * xe_configfs_primary_gt_supported - determine whether primary GTs are supported
> > + * @xe: xe device
> > + *
> > + * Return: True if primary GTs are enabled, false if they have been disabled via
> > + *     configfs.
> > + */
> > +bool xe_configfs_primary_gt_supported(struct xe_device *xe)
> > +{
> > +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN)) != 0;
> > +}
> > +
> > +/**
> > + * xe_configfs_media_gt_supported - determine whether media GTs are supported
> > + * @xe: xe device
> > + *
> > + * Return: True if the media GTs are enabled, false if they have been disabled
> > + *     via configfs.
> > + */
> > +bool xe_configfs_media_gt_supported(struct xe_device *xe)
> > +{
> > +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MEDIA)) != 0;
> > +}
> > +
> > /**
> >  * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
> >  * @pdev: pci device
> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> > index c61e0e47ed94..5624e965b911 100644
> > --- a/drivers/gpu/drm/xe/xe_configfs.h
> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
> > @@ -17,6 +17,8 @@ int xe_configfs_init(void);
> > void xe_configfs_exit(void);
> > void xe_configfs_check_device(struct pci_dev *pdev);
> > bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> > +bool xe_configfs_primary_gt_supported(struct xe_device *xe);
> > +bool xe_configfs_media_gt_supported(struct xe_device *xe);
> > u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> > bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> > u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > @@ -28,6 +30,8 @@ static inline int xe_configfs_init(void) { return 0; }
> > static inline void xe_configfs_exit(void) { }
> > static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> > static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
> > +static inline bool xe_configfs_primary_gt_supported(struct xe_device *xe) { return true; }
> > +static inline bool xe_configfs_media_gt_supported(struct xe_device *xe) { return true; }
> > static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> > static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> > static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index a5932e4f4a23..9c8ab2b41737 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -695,6 +695,11 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
> > 	struct xe_device *xe = tile_to_xe(tile);
> > 	struct xe_gt *gt;
> > 
> > +	if (!xe_configfs_primary_gt_supported(xe)) {
> > +		drm_info(&xe->drm, "Primary GT disabled via configfs\n");
> > +		return NULL;
> > +	}
> > +
> > 	gt = xe_gt_alloc(tile);
> > 	if (IS_ERR(gt))
> > 		return gt;
> > @@ -720,6 +725,11 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
> > 	struct xe_device *xe = tile_to_xe(tile);
> > 	struct xe_gt *gt;
> > 
> > +	if (!xe_configfs_media_gt_supported(xe)) {
> > +		drm_info(&xe->drm, "Media GT disabled via configfs\n");
> > +		return NULL;
> > +	}
> > +
> > 	if (MEDIA_VER(xe) < 13 || !media_desc)
> > 		return NULL;
> > 
> > @@ -829,6 +839,18 @@ static int xe_info_init(struct xe_device *xe,
> > 		if (IS_ERR(tile->primary_gt))
> > 			return PTR_ERR(tile->primary_gt);
> > 
> > +		/*
> > +		 * It's not currently possible to probe a device with the
> > +		 * primary GT disabled.  With some work, this may be future in
> > +		 * the possible for igpu platforms (although probably not for
> > +		 * dgpu's since access to the primary GT's BCS engines is
> > +		 * required for VRAM management).
> > +		 */
> > +		if (!tile->primary_gt) {
> > +			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
> > +			return -ENODEV;
> 
> 
> I think "fail to probe" should be ok. Advanced user using this interface should know what
> to do. I was thinking about blocking this at the configfs level, so the
> user is not allowed to do it until that path is cleared. Any particular
> reason to do it here?

You mean as opposed to doing it somewhere like gt_types_allowed_store()?
The main reason is because I expect the condition to eventually get
relaxed and need to be combined with other device-specific information
that we don't know pre-probe (e.g., dgpu vs igpu type).


Matt

> 
> Lucas De Marchi
> 
> > +		}
> > +
> > 		tile->media_gt = alloc_media_gt(tile, media_desc);
> > 		if (IS_ERR(tile->media_gt))
> > 			return PTR_ERR(tile->media_gt);
> > -- 
> > 2.51.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
