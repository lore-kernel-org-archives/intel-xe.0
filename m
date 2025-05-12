Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2720BC3ABCD
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 12:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D494910E403;
	Mon, 12 May 2025 12:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jjNIpz0C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE49A10E403
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747054716; x=1778590716;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YnVLBR7zKJNu42kox+aK/J0c8sfDjbc/d3/E/zdjGjY=;
 b=jjNIpz0C1loqgXwkpiHQsCQJfyJZyxHqxuuE6KKBouf9ZeZFMA+M6Y7J
 +g5Xe7TeQm/lSxhDbnfowoh6WBqtEdhJJXFUQic0RLQQ4DpDc5Y0LtbQ7
 uxAphBGv+NvyKImgT5bpVwSlTRGfk+Ky1pEbbe76vZnG66jjHaB+cyruu
 gjyQWHXqOgoLPwixqYcW71bqtBSbtiFu2Qn7z8MXKHgVZKPnGMIxCXjhg
 K4qsW0J8FmBNi6M3tvLuuMrh+f4zuysz5EZpKeF1McjLHCyDwrHtrPOau
 UIpOgW5Ck/xBnokXvZxvvOVtGKj4MSucTuAT8WwCEnWWUvgntCXnTBU7A w==;
X-CSE-ConnectionGUID: y9dVnEX2RsCjhVc+bXdxbQ==
X-CSE-MsgGUID: 0xI9X74IRyOHbmH1vOJQPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="60252027"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="60252027"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:57:03 -0700
X-CSE-ConnectionGUID: lBUx+MJpT2GqgKSeBw0JhQ==
X-CSE-MsgGUID: NqXYglJ3SP6Sza6Qpd/kJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="137869222"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 05:57:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 05:57:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 05:57:01 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 05:57:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqnS1l37UK0o6zNxStSlZpOsfTIJt23cGybCsCvoSH5YvQ7mGBo3kJfAI3q2J7elR3ye0EkqqwPOEwgWvXLlfzlhvb4S2qM9AvsekYl2xeHh8U6k9U5SIyysM6ibfmFNh7S1MT6n81a2qB45VzjTVPp88Ogf/v1h35QWp+S6rO/xe7AS8QDugSN1XNrdIvX04ifUlAgAtiWLqDtvA7IMJAv7cTRZj/zgTNJXOY7jwQD1myeEjVYBzeAmnggA7BM7OapsJiQ8Fode0HNU87uZHljoR/40sWG1GL+c7GsB+toUikqD0yTNoWlepuqDdOJH4tKciu3/N/0zs46Ni06kCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+exQ/21meCU+3LQJRi5ZCIRIMmPMy1Zyxh4FrkSyQ+E=;
 b=BULbIEVhyIw4Go+9m+8nyo78XJ186LkaeBvgUnGGn3bJh9aJe+J0yblwcgr3/IkVau4yFeqshQ1bk21Y6KkB5yQPCfMz+hvKZKCzrGpFW46psOhTeOmPL07YmZcwh6Zon1XZBwlktMjynEnlQFxE3iysClTt+z7qWcHWvVBTnQhgSsLA0OnrHVw3RzK1yy4qMnirfhDssg7gONgD9y6OecAOF1ECkov/coZmHbV3vVGzliYJLEFemA/qKiw/olfDwY1GjyxbZcWyw+yvZp3MtIwmZczBm/qZmpHeCQdf59z9tcYFpPx12idt92accwqOa++cGJQi1BCCFeO6obTLDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8051.namprd11.prod.outlook.com (2603:10b6:8:121::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 12:56:58 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.8699.022; Mon, 12 May 2025
 12:56:58 +0000
Message-ID: <46554c17-0529-47dd-ab8a-5aa4701b2a25@intel.com>
Date: Mon, 12 May 2025 18:26:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 19/20] drm/xe/svm: Implement prefetch support for SVM
 ranges
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
 <aCHuGSH+da4/mfvl@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCHuGSH+da4/mfvl@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: a4251113-4444-43fe-d203-08dd91547a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjZLVzc4U2J5ZmF5S3JVOEwxdjhaMWI2eVB4TUFoOWZ2MUFoRFpuanNGVy9S?=
 =?utf-8?B?aVA3cnFVUHM4bjUxc0gxeHdqQWFOaWh2UERidFNYNVp2QVl0SVhCUVNoQWU0?=
 =?utf-8?B?aFJwcVk0a1ZWQWJKWWZiTkVzSUJCZE1qME1qN3hZWURQZ1FQd2dOLzZNUXR4?=
 =?utf-8?B?eG1TVDlDYlJUNTh2T2hxMG9XUElPS0NIbnUxa2RxMzN1SFF3S0R1QXBTUWVR?=
 =?utf-8?B?UzZkWmxZTkY4ZjhDaWxPTlN4ZGswYklrWU5KYW50TlZIbHpETks2ZW5oYVZ4?=
 =?utf-8?B?WGVxQlhhb2c2d2dJM2xPblkrWHhVcjFKS0htTmh2dmVjOEVvUE5sRE9NZ3NS?=
 =?utf-8?B?WGlDbWpodGM3Ti9ZWWRzRVo0VUFpbkp0R3BCcFI3d0lNTHpnWXAyaWIvZ1pW?=
 =?utf-8?B?WCt4d3N5STZmMVBmdTBoUitKZm9tc2daR3dnK2Z0K2w3QlJoUjJkTkhubWdo?=
 =?utf-8?B?MUZvbFNCUGlWOXBMakpJeW1DZXA3eHA0VnlEWlQyWnpsSU1VM28wZHpITndS?=
 =?utf-8?B?YmFGL0V5aXNGOS9xUitSeDNFdlZhNEFyaFVRYUNHd0lJakZZbWQxOXNIL0wr?=
 =?utf-8?B?UUpuWGMyZ1l0MVA0L2dNYndEVGJ2aXhEQk1RM0lEQ0p0RnJBTGZDbndRWCtC?=
 =?utf-8?B?ODRnVWw4UU9FQmlwK0lKbkgvb2VHTVBabzUwZ3BsenVDczRvZmxpSUZJUHdw?=
 =?utf-8?B?aVp1VHBidnQzZTYvQ0QvenFrcmorbnJhSE9BVWxGNDlEMjJGOS8xUFdZYkk5?=
 =?utf-8?B?d1dYMmovTVhCdzVlUFhTUmp4ODhZR0RnSisreGhKc20xSm9aaDhRZGpTb3NX?=
 =?utf-8?B?ZTZDbzdlZlZBeVFXKzdPcURqeDAza3lnZmRDVHZhMzJmV08zS2IvaGJLdmZ4?=
 =?utf-8?B?Qm94MEFoL1NWYmw1OHVQVW9NVjNkS241VUpvelZ6TFJNeUFiVFY2WnJiQjQv?=
 =?utf-8?B?OHZVZjNiK0U4SmlMdWNJSHptaDlDcCtzUmFTQnQwcVJqdnFnOHdYQzJTZnVR?=
 =?utf-8?B?SmpoYXJwL1Mya2YvUzdEci80b2VRZzFISmc3b1pKTTlKRmFxaEkxNnkzSUg3?=
 =?utf-8?B?SDNMaU56OWdJQ3NWTmV6cnRzdXJoSmpOUXNIN20wOVRhSys0OTdiS1BLdVlZ?=
 =?utf-8?B?UnIwclpRdWZlMlN1YnBVZFB0WGdGMkVXcmpwQnFrR1UzcFpib1cvd0RaOUlU?=
 =?utf-8?B?QVNGM0hWTFJUeWlxdktNSmNBK0xpU3hSbFpuNXRWUS9FWSs4YU5DdUZwaWcy?=
 =?utf-8?B?Q3dINjNFbXA3emtOUDMwNVo3OTgrZ0RzK3RJWGVZTkorR1ZYR3lZVHUzRFRP?=
 =?utf-8?B?NkQwTUF3V2lUM2diYVJyTXdLYjhQZ0ZtOGNHVTFzNWtKMi9oL0ZOb3BxejJF?=
 =?utf-8?B?Y3o3Mm9lOXUwTmtLT3NwRFNWRXNnSFNNeTNKelhZdkZLYXdFSGtpSTV4Y0c2?=
 =?utf-8?B?b0NPMGlFcloxbTYxaC9UQjJrRVlCVGJjYUtlRHVFMWoxTUJLSXQxTkE4aGZp?=
 =?utf-8?B?S0hhcFJmbkpQcDhQTmFkeXZBclV0T0RSV2tYcUdyQndtTGVQVXJpNHBUeGhL?=
 =?utf-8?B?ZjNZQVdTeGlZMmhtakFUak1ocGZJYWZVVUVMcEF6Wkpma0RVN2dkR0s2RTNH?=
 =?utf-8?B?N1Nxd05ZYmN1enozcllWSUw3a3FGam5oUWZoY3NCK0k0TnV4dm1wWWFRazFG?=
 =?utf-8?B?cFlLUThVV0U0bFh3d2RCazN0U1JkNllFVDIwRmxkSXptQ2NSRmdLYkVld2tR?=
 =?utf-8?B?Z3RiU1h5UWVtVjBUNDNyR055R2VyaSsyRUJ2b1dYMWM0WVVoRmFzdFQrR1hY?=
 =?utf-8?B?TnZmeEVPWEFoUGZjeWZvZFZTeEhUQkFhTlRQaXowQkpoK1V5TUZWNFJRZzZW?=
 =?utf-8?B?OW1odGljenpzcHNNclp3aW5jU3E5b2ZrMTlpbERsMDlMWGZNYUZoVVo5cmRC?=
 =?utf-8?Q?sAo+y3u2JCU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjkxQ1hhVmM3VmVaVnNMb3d6aFFMYUY0NFByQ21reGx0MGVxMVlRcVB5TGZ3?=
 =?utf-8?B?OVd2MTlvallBWnY4RXFFaWpMR0svSXdwWkdWVERITkM1SU44Z3FsMDZsVlRq?=
 =?utf-8?B?eWtweUUyNmFzajdvWWZmVFNpUCt6T1dSYnhCWFRlQjliSnA0WGVXRUd4cFFz?=
 =?utf-8?B?UkFDY1NpS2pMOFBna3lBYmtHRy8yRys0TmlmUyttYTdMZGJzWE9YYkZMM3lC?=
 =?utf-8?B?VWxUM3dEbnNVbzI4SU1LOW1HdFRpdXRzT1UwOXVtTkhhdGtWRnNTeHB0Wk40?=
 =?utf-8?B?Szd1NU41TmQ1a1BXZzNHelZFRWVlVGprNTB1L3Z4SnBtOWNtd0dHcnduQ0lI?=
 =?utf-8?B?R2tDRndPR1JjeU1tRmlhM2R6Zng1UyttdDY5Wjg5bTQ4bVM3WHJLeFVCKzlX?=
 =?utf-8?B?NE1KVDYvSWoxTmt6VkRmSW5FbitrMzU1TzJjbHl4a2FKQjJQOFZvT0hCNmlz?=
 =?utf-8?B?RzB4YjZZNUNJSFFXS3JTK0dmbU1TWnRTMWttMEs2eFJ3Vm53bGhxTENoOXVN?=
 =?utf-8?B?enNBeHlaQVFZNUg5V01haUs3OGxNdCtPOEI4UXJjYmVaVTBtM25IZ1ZKZEl6?=
 =?utf-8?B?TVM3Q05sWFh0eWlwaVpUK1Q2OHFPODB3RTNaQW9tTkowY2t3QWtLOW5OV3hr?=
 =?utf-8?B?SWtlN2pqRzNhcGdOc1FsM2txT2liclVxUm1qQ2xNcW8wdkVFQnluWHBhczlE?=
 =?utf-8?B?Mm1uWVBiZG5scElUQ2ppWG9ucW9iM3o2eVhWWlh3aTlqY2xLMVk1b244L2N6?=
 =?utf-8?B?MkJaZnMzSE94TVg1c0FUWTZ1ejRwd3NTYW84Y1JYejJEWmJPS05HZFZRekJN?=
 =?utf-8?B?VnZPVmlCbTZ3U0h3eldGaUtUb3IyRGdlYUdCdE5KUkc0VndnVGRyWVNWM2hu?=
 =?utf-8?B?WkROcE9ZRXFVRS9MOUtNbG8xZGREb1IxM3dndFZtYnhQVlVQNGt0RDZQeUlX?=
 =?utf-8?B?ZnFvbnJSa2NLb2RtdU83OGJSeWNqQnRCcG9ZMEhmRXErT0FiNXlYTXFiTUpa?=
 =?utf-8?B?cGwxTEhyWHJocXYyVWdhZHRneVpUMTE0WU5kY1dCZjNJNUI3MUlUcDNQOEhC?=
 =?utf-8?B?dnpIVXlsb21HTmx2TUtqNnNmVnJ2enYvOC8yanFVU29Md3F5Y3M1N3Q5R2Vm?=
 =?utf-8?B?WmF0aFhLQkpBb0JUb29NSWd0TFJjaDJHN2dyOGN2WHVPSE5qaEV3cXFiMVN5?=
 =?utf-8?B?MEwyaTk4RHFTUjFYMm41dWtPd2wzNGllYVlXTUdTVnovTGRzUHZOd2JhR05B?=
 =?utf-8?B?VGFWV0NnMUEzRmxGM3djWjgvSVc1aVhSUTdXdWoxSFEra3I1aVhJYmlRSGRX?=
 =?utf-8?B?QTBWUGkrTWRaT2hVVmRGa2VYcllJSCtXek5kcVpGUGFPSytMb0tyME8zUUtL?=
 =?utf-8?B?TTZ2SncvUlpPUExwRTViNFBya3JuOXZSaURHb1JqZW0vZThucW1KTlN4Q01p?=
 =?utf-8?B?bGxPZDVaaEtTMjE3OW9qWFhLcURqaXcyRGZGUUs0Y0dkMDBiYlgzZzBMUlhC?=
 =?utf-8?B?ckpwemNDd3FzNFVMYXhIY2tpaXZzNmdudzQxd0tjcFZMeTNHOFpQb2drMlRC?=
 =?utf-8?B?S1IyUWFTTkZjckVrTklITUt3UmNLcGNTWWpnQjl4UHVlb1V6cGU3SkhXWkNn?=
 =?utf-8?B?Q2FYWWxhT3JKbEc5bnRGbWtzZCtjNXBmZ3Jjd2hJK09rZVhpTzBLazRNb0RW?=
 =?utf-8?B?ZXdoTFlQckdJekU4MG1PYVQzVDZyQ0szQVRSekVBRVRYVWVLUDN6SjhhZ0ZT?=
 =?utf-8?B?YXBFczZ3WFpYZGhjRHB1eFd4ZE1mWUk3eWUwSmVZNCtTRVZ0czRSQ0QyNFFK?=
 =?utf-8?B?MmNSbzdpUUFxdWVpNURJRGpuaVZ1QjAvUzltS1IrQWovVUVxZmszV2dMWllV?=
 =?utf-8?B?QnpJMFR2eUg4dE14VFY3WDFGc0F5dU5tMW83TUZZOG9DVXplVURieElKVHdK?=
 =?utf-8?B?a2FWcURESWlLZHI2cVdObHdUci93Tnk4WCt2bDVMeDFUR0tCSWd6TldsS1JE?=
 =?utf-8?B?cFI4Zm5YaEFZd3ZXb3pMampQQ09yK0U4TFN2dGlSOVdsZkVxVFJOdkkrNXBx?=
 =?utf-8?B?YkMySTFhSkRYWFRaQlYxVktSamNhSzlKUHpCbGx4YlRmU1pLNVAyMGtJbkZt?=
 =?utf-8?B?bnhtRnJSNDJYVElLbEtQQzJwc2lSUnVXVXhXeDh4OCtCcDlYZzNkS3VoYXBt?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4251113-4444-43fe-d203-08dd91547a9e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 12:56:58.1224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vP4sROn4sf//OMsYfYCEbYAtDPr49u8D68S6k5Fhx5+euTMovzABoXfZVeSedYXCzmeD3NJA6usm7TajYimZcUJwKmkLRBMv9dh6L78kIPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
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



On 12-05-2025 18:18, Matthew Brost wrote:
> On Wed, Apr 30, 2025 at 05:49:11PM +0530, Himal Prasad Ghimiray wrote:
>> This commit adds prefetch support for SVM ranges, utilizing the
>> existing ioctl vm_bind functionality to achieve this.
>>
>> v2: rebase
>>
>> v3:
>>     - use xa_for_each() instead of manual loop
>>     - check range is valid and in preferred location before adding to
>>       xarray
>>     - Fix naming conventions
>>     - Fix return condition as -ENODATA instead of -EAGAIN (Matthew Brost)
>>     - Handle sparsely populated cpu vma range (Matthew Brost)
>>
>> v4:
>>     - fix end address to find next cpu vma in case of -ENOENT
>>
>> v5:
>>     - Move find next vma logic to drm gpusvm layer
>>     - Avoid mixing declaration and logic
>>
>> v6:
>>    - Use new function names
>>    - Move eviction logic to prefetch_ranges
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
>>   drivers/gpu/drm/xe/xe_vm.c | 197 +++++++++++++++++++++++++++++++++++--
>>   2 files changed, 234 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index de4e3edda758..f3a99ee4f733 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -1458,6 +1458,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	struct xe_vm *vm = pt_update->vops->vm;
>>   	struct xe_vma_ops *vops = pt_update->vops;
>>   	struct xe_vma_op *op;
>> +	unsigned long i;
>>   	int err;
>>   
>>   	err = xe_pt_pre_commit(pt_update);
>> @@ -1467,20 +1468,35 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	xe_svm_notifier_lock(vm);
>>   
>>   	list_for_each_entry(op, &vops->list, link) {
>> -		struct xe_svm_range *range = op->map_range.range;
>> +		struct xe_svm_range *range = NULL;
>>   
>>   		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>>   			continue;
>>   
>> -		xe_svm_range_debug(range, "PRE-COMMIT");
>> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
>> +			xe_assert(vm->xe,
>> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
>> +			xa_for_each(&op->prefetch_range.range, i, range) {
>> +				xe_svm_range_debug(range, "PRE-COMMIT");
>>   
>> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +				if (!xe_svm_range_pages_valid(range)) {
>> +					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> +					xe_svm_notifier_unlock(vm);
>> +					return -ENODATA;
>> +				}
>> +			}
>> +		} else {
>> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +			range = op->map_range.range;
>>   
>> -		if (!xe_svm_range_pages_valid(range)) {
>> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> -			xe_svm_notifier_unlock(vm);
>> -			return -EAGAIN;
>> +			xe_svm_range_debug(range, "PRE-COMMIT");
>> +
>> +			if (!xe_svm_range_pages_valid(range)) {
>> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> +				xe_svm_notifier_unlock(vm);
>> +				return -EAGAIN;
>> +			}
>>   		}
>>   	}
>>   
>> @@ -2065,11 +2081,20 @@ static int op_prepare(struct xe_vm *vm,
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> -		if (xe_vma_is_cpu_addr_mirror(vma))
>> -			break;
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			struct xe_svm_range *range;
>> +			unsigned long i;
>>   
>> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>> -		pt_update_ops->wait_vm_kernel = true;
>> +			xa_for_each(&op->prefetch_range.range, i, range) {
>> +				err = bind_range_prepare(vm, tile, pt_update_ops,
>> +							 vma, range);
>> +				if (err)
>> +					return err;
>> +			}
>> +		} else {
>> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>> +			pt_update_ops->wait_vm_kernel = true;
>> +		}
>>   		break;
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>> @@ -2273,9 +2298,16 @@ static void op_commit(struct xe_vm *vm,
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> -		if (!xe_vma_is_cpu_addr_mirror(vma))
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			struct xe_svm_range *range = NULL;
>> +			unsigned long i;
>> +
>> +			xa_for_each(&op->prefetch_range.range, i, range)
>> +				range_present_and_invalidated_tile(vm, range, tile->id);
>> +		} else {
>>   			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>>   				       fence2, false);
>> +		}
>>   		break;
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 555ed10dac85..dd5c63ee8720 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -798,10 +798,33 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>>   }
>>   ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>>   
>> +static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
>> +{
>> +	struct xe_vma *vma;
>> +
>> +	vma = gpuva_to_vma(op->base.prefetch.va);
>> +
>> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
>> +		xa_destroy(&op->prefetch_range.range);
>> +}
>> +
>> +static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
>> +{
>> +	struct xe_vma_op *op;
>> +
>> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
>> +		return;
>> +
>> +	list_for_each_entry(op, &vops->list, link)
>> +		xe_vma_svm_prefetch_op_fini(op);
>> +}
>> +
>>   static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>>   {
>>   	int i;
>>   
>> +	xe_vma_svm_prefetch_ops_fini(vops);
>> +
>>   	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>>   		kfree(vops->pt_update_ops[i].ops);
>>   }
>> @@ -2248,13 +2271,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>>   	return true;
>>   }
>>   
>> +static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
>> +{
>> +	struct drm_gpuva_op *__op;
>> +
>> +	drm_gpuva_for_each_op(__op, ops) {
>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +
>> +		xe_vma_svm_prefetch_op_fini(op);
>> +	}
>> +}
>> +
>>   /*
>>    * Create operations list from IOCTL arguments, setup operations fields so parse
>>    * and commit steps are decoupled from IOCTL arguments. This step can fail.
>>    */
>>   static struct drm_gpuva_ops *
>> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
>> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
>> +			 u64 addr, u64 range,
>>   			 u32 operation, u32 flags,
>>   			 u32 prefetch_region, u16 pat_index)
>>   {
>> @@ -2262,6 +2297,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   	struct drm_gpuva_ops *ops;
>>   	struct drm_gpuva_op *__op;
>>   	struct drm_gpuvm_bo *vm_bo;
>> +	u64 range_end = addr + range;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>> @@ -2323,14 +2359,77 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   			op->map.invalidate_on_bind =
>>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>> -			op->prefetch.region = prefetch_region;
>> -		}
>> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> +			struct xe_svm_range *svm_range;
>> +			struct drm_gpusvm_ctx ctx;
>> +			struct xe_tile *tile;
>> +			u8 id, tile_mask = 0;
>> +			u32 i;
>> +
>> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
>> +				op->prefetch.region = prefetch_region;
>> +				break;
>> +			}
>> +
>> +			ctx.read_only = xe_vma_read_only(vma);
>> +			ctx.devmem_possible = IS_DGFX(vm->xe) &&
>> +					      IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
>> +
>> +			for_each_tile(tile, vm->xe, id)
>> +				tile_mask |= 0x1 << id;
>> +
>> +			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
>> +			op->prefetch_range.region = prefetch_region;
>> +			op->prefetch_range.ranges_count = 0;
>> +alloc_next_range:
>> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
>> +
>> +			if (PTR_ERR(svm_range) == -ENOENT) {
>> +				u64 ret = xe_svm_find_vma_start(vm, addr, range_end, vma);
>> +
>> +				addr = ret == ULONG_MAX ? 0 : ret;
>> +				if (addr)
>> +					goto alloc_next_range;
>> +				else
>> +					goto print_op_label;
>> +			}
>> +
>> +			if (IS_ERR(svm_range)) {
>> +				err = PTR_ERR(svm_range);
>> +				goto unwind_prefetch_ops;
>> +			}
>> +
>> +			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region))
>> +				goto check_next_range;
>> +
>> +			err = xa_alloc(&op->prefetch_range.range,
>> +				       &i, svm_range, xa_limit_32b,
>> +				       GFP_KERNEL);
>>   
>> +			if (err)
>> +				goto unwind_prefetch_ops;
>> +
>> +			op->prefetch_range.ranges_count++;
>> +			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
>> +check_next_range:
>> +			if (range_end > xe_svm_range_end(svm_range) &&
>> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
>> +				addr = xe_svm_range_end(svm_range);
>> +				goto alloc_next_range;
>> +			}
>> +		}
>> +print_op_label:
>>   		print_op(vm->xe, __op);
>>   	}
>>   
>>   	return ops;
>> +
>> +unwind_prefetch_ops:
>> +	xe_svm_prefetch_gpuva_ops_fini(ops);
>> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +	return ERR_PTR(err);
>>   }
>> +
>>   ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>>   
>>   static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>> @@ -2645,8 +2744,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   					return err;
>>   			}
>>   
>> -			if (!xe_vma_is_cpu_addr_mirror(vma))
>> +			if (xe_vma_is_cpu_addr_mirror(vma))
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
>> +							      op->prefetch_range.ranges_count);
>> +			else
>>   				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>> +
>>   			break;
>>   		default:
>>   			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>> @@ -2772,6 +2875,56 @@ static int check_ufence(struct xe_vma *vma)
>>   	return 0;
>>   }
>>   
>> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
>> +{
>> +	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
>> +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> +	int err = 0;
>> +
>> +	struct xe_svm_range *svm_range;
>> +	struct drm_gpusvm_ctx ctx;
>> +	struct xe_tile *tile;
>> +	unsigned long i;
>> +	u32 region;
>> +
>> +	if (!xe_vma_is_cpu_addr_mirror(vma))
>> +		return 0;
>> +
>> +	region = op->prefetch_range.region;
>> +
>> +	ctx.read_only = xe_vma_read_only(vma);
>> +	ctx.devmem_possible = devmem_possible;
>> +	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
>> +	ctx.devmem_only = region && devmem_possible;
> 
> I don't think this is right. In the latest series we only set
> devmem_only on atomic faults. Also if user prefetches a shared mapping
> (migration not possible due to core MM limitations) get_pages is always
> going to fail and abort the prefetch. I just wouldn't set devmem_only
> here.

Thats true. Will assign 0 here.

> 
>> +	ctx.timeslice_ms = 0;
>> +
>> +	/* TODO: Threading the migration */
>> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
>> +		if (!region)
>> +			xe_svm_range_migrate_to_smem(vm, svm_range);
>> +
>> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>> +			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>> +			if (err) {
>> +				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> +				return -ENODATA;
>> +			}
>> +		}
>> +
>> +		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
>> +		if (err) {
>> +			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
>> +				err = -ENODATA;
>> +			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
>> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> +			return err;
>> +		}
>> +	}
> 
> Nit: I'd add a newline.

Sure

> 
> Matt
> 
>> +	return err;
>> +}
>> +
>>   static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   			    struct xe_vma_op *op)
>>   {
>> @@ -2809,7 +2962,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   	case DRM_GPUVA_OP_PREFETCH:
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> -		u32 region = op->prefetch.region;
>> +		u32 region;
>> +
>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>> +			region = op->prefetch_range.region;
>> +		else
>> +			region = op->prefetch.region;
>>   
>>   		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>>   
>> @@ -2828,6 +2986,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   	return err;
>>   }
>>   
>> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
>> +{
>> +	struct xe_vma_op *op;
>> +	int err;
>> +
>> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
>> +		return 0;
>> +
>> +	list_for_each_entry(op, &vops->list, link) {
>> +		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
>> +			err = prefetch_ranges(vm, op);
>> +			if (err)
>> +				return err;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>>   					   struct xe_vm *vm,
>>   					   struct xe_vma_ops *vops)
>> @@ -3478,7 +3655,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>>   		u16 pat_index = bind_ops[i].pat_index;
>>   
>> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>>   						  addr, range, op, flags,
>>   						  prefetch_region, pat_index);
>>   		if (IS_ERR(ops[i])) {
>> @@ -3511,6 +3688,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	if (err)
>>   		goto unwind_ops;
>>   
>> +	err = vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
>> +	if (err)
>> +		goto unwind_ops;
>> +
>>   	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>>   	if (IS_ERR(fence))
>>   		err = PTR_ERR(fence);
>> @@ -3580,7 +3761,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>>   
>>   	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>>   
>> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
>> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>>   				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>>   				       vm->xe->pat.idx[cache_lvl]);
>>   	if (IS_ERR(ops)) {
>> -- 
>> 2.34.1
>>

