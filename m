Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B731FC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E767B10E274;
	Thu, 26 Jun 2025 07:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IV7/CWm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AAB10E274
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750921652; x=1782457652;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=kRuhSXGHnXNnEEC/HHDphf9Vo1gRyZKmbVrlMa3FZxU=;
 b=IV7/CWm9CJ1oC5j7v8rPBUJMVqolBuCs+d4EoGcXyENLtemrvYAv3G5t
 mwcgFtXi22+c3p5ZYy8U8Q3zz4oQqC2ATH1cAoA+bKQappcPUVRAwOM6/
 LOSJX59ky3NI4CZIB1UqFlaG4lebh5PN+jK+NjBRjeThL/IwJbEqOuSWK
 HfrwhJjWQcBFjIBpIOoXubBILydXXiVe/7HsIU+f4N+G6qR9M6WGEDkeu
 FizYk1II4PdtKO3nXcFTUhcuJoav2M1wwdMWJfUOhxsNvC8akBQJ/bGJj
 hPexeviCyQb6lVWyC0ukUTzEHkrFNqH266aiEVyRMnGDH3Fbb3pwDt7WJ w==;
X-CSE-ConnectionGUID: cLvzEq81Ri6PwTQLkIO+gA==
X-CSE-MsgGUID: qCAuQO33SbeoHGJs5F/68Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64640199"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208,217";a="64640199"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:07:32 -0700
X-CSE-ConnectionGUID: P2cRmX6uQO2OffrmAlvBlg==
X-CSE-MsgGUID: TNcgRHd4TPqx+MHD3hPZAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
 d="scan'208,217";a="157004262"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:07:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:07:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 00:07:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:07:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r72k44PtbBU1/14sA3UftfRBU1KPbvzxfpplce+otzu+2Td6QOe7RAH181lwUp7EDN/frjxdkL/RVgnAFgQt8HnRK7n2fkk5KfbLyjPpM6uvEpBodcdneC6J4dTsLUSRb/ijgjkioTkrHuoWc6W2iYCnhQpJsgzlXfx8al+ysYgkz1lOg27ognL5TSRqwLOAESp/7+fHXvxjj38GWH2faE/RfOBBBAKwzj+YqH+qR5EaLA6K1Ad2USc0oxcKZXrlaHxkYcRkBNXp9H5esemrBb3eAzMkY6mRAXZ45S/KKk3JMFsRqG4uVvySEWswUOP4ELyYxu5gY5scK3doglRj9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vHwR3jU68TRdx4+cQ/xa55uh6c4+iN2y6XscvQWUyE=;
 b=G9pPmHiiqA6h6J8oJk3qq5mULhioqzAWSvB6gCFbkj2drp0UBFB+evpBSnzyvaq8ioOxuQz/los3UbWJEdzoDCYsiJpBQB55HvsfAG/ueHWdChzT+5ihoBQYJIWPwxQk+dxqOCpIxMtmve7UL+KRh0HKN2JmVfCADO2wM06niI3FhWswE44jbod7xhywh6nt4MMLj+bhnKtIenoNfp69teJz7tQuTxQG9f7LThqSgzQwBbCGndoO/rZSirQXxr1xBOQP2Z9D+uIbzzYgfbyeARfA6Sk66ic0P3e9+DJUe6SQB2AjCZilhEZWnSXjSuBYPV0RHGuaDhB+bi75hVJI3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by IA0PR11MB8378.namprd11.prod.outlook.com (2603:10b6:208:48e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 07:07:17 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 07:07:11 +0000
Content-Type: multipart/alternative;
 boundary="------------oLgpwzJKPp5nrGYTHSvdZIdQ"
Message-ID: <15e9d766-bb8b-41e3-a808-388f91c89bc1@intel.com>
Date: Thu, 26 Jun 2025 12:37:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
Content-Language: en-GB
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
References: <20250625143254.3505218-1-soham.purkait@intel.com>
 <20250625143254.3505218-3-soham.purkait@intel.com>
 <CH0PR11MB5444E60E76CB4BAFE1CF0CDBE57BA@CH0PR11MB5444.namprd11.prod.outlook.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <CH0PR11MB5444E60E76CB4BAFE1CF0CDBE57BA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|IA0PR11MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 42439562-609f-4680-2fad-08ddb48011eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUdtRkRucHYrOWY3UGNEZklRM3RPdzN6OU96UGx0MjQ5UjBFWUczaFZYYVhj?=
 =?utf-8?B?MFZlTHRwRWZsaW9TOWp1aWE5c1BxRmRWdmNjRDJOK1BscnJQcDNTZ21WTXJX?=
 =?utf-8?B?d0txS0czRFI4TklNWGcwZWFyZlhaelNBWFlFODFiTVM0dDNGTmVaSnI3MWlT?=
 =?utf-8?B?S2x2anljYXRKL2ZsMzUvNktRM25PSTVqTExqLy9VTjNBcjR6MG5GOHZXazda?=
 =?utf-8?B?bWdOL1ZpcU9XMGFFLy9QZFZQM1FyQTlKRmpIWjJINUttb2pScmZJRG1GKzR6?=
 =?utf-8?B?Nk1HVW5DbEpCemU3Q1BLcXBTMVNUcyt1UExnakJjTk5sbW9Jbkx4VjNSTVZB?=
 =?utf-8?B?VFlDbW12azh1WWhKdm9xcDlnelNKbHdtR3k2U3Exc0F0cDVuOWtLQU9EbUpT?=
 =?utf-8?B?bjdBS25Cajh1QmRBUlAzRmRFWG1vdTFKNTZVaU5hSG4xeW9Vaml3NFZ6Rmkv?=
 =?utf-8?B?V3ZGU1NJRExFbkk0eDcyOXZtRCtmWDV6YTNQR1BZVWxSYVd3R1pOQ3JjZ2tV?=
 =?utf-8?B?OVlIbVhPa3J4Yzg3UWh0NTdpbXN0a1VJQjk4cUpKeWhyRjdvZ3UzbExaWDhD?=
 =?utf-8?B?WFhoaVc5TzJtUlBJUkt0cjkwa0xIY0w1REp5aHVFc1EyU0lDTXQ2RUNyWkt5?=
 =?utf-8?B?VnlvaVhDTHd4MWYrZzZrZGltNWV6aHc2cHIrYmRkOHFoUW5HL3NvOGNRaTQy?=
 =?utf-8?B?bmhXWXZnRVN3MytBckd0YTlEVzBCRkNLb3FLQW4zWnEybUo4OER3L0g5MTJp?=
 =?utf-8?B?VXgyWW4wR2FYUFphVVhiUnBLb2R5SExlbFBNWks1ckoybjZYbjN6WlBaK1FZ?=
 =?utf-8?B?VlplRVNlcWlhSG45bkw3aTF4K3hzdzdzZEhGR1o0dmNueTVHaGtTM1crZVpY?=
 =?utf-8?B?L1hIT2FlRkk5UVZVT05mNWZJaXBNUXlKYmdiWTdXdkdIYkY1eTNHNmtpT0hj?=
 =?utf-8?B?c09zd2JVTFZZQXhISHBwZ2pjQ2FZVEtqTUZKaUxHbzd3MDZ2QUEvSndoUklO?=
 =?utf-8?B?TU5NdUQ0RlJaaE9rbXN4L1I1SGxLSWRIUzJQV0xrenZCRk4vUzBMU0V5dGs2?=
 =?utf-8?B?MXY3Z1pnRFFiTzN6UGYxSXJET2xqcXVVRXBUV0MvNkxhR1IvWUY0cXh2Rzl0?=
 =?utf-8?B?NzdUWCtpbDNSUjl3RUh0WlpPWit6QkE4K09GdVRPa0JselhtdFFxbng5MUdP?=
 =?utf-8?B?K2RQWlpqL1NNbHk3NzJiVE5CMnlDNkZWc1BRVzFTQ3F0Mi9YS0VtVE1SMEww?=
 =?utf-8?B?L2t6eEF5bURNeFEvYm1rQjJnc1Y1U3hFbTBrRW5mU1RRZVk2cUZGUWJHc1oz?=
 =?utf-8?B?cDEwbHAxRHN4L0VTdXFTaWJCVHNDbjN0bjcwWS9HMnlsc0hsMzQ3RXBJaDNQ?=
 =?utf-8?B?Z0NpVW8zSHVIV05GMkRKN2tEaFlWaTBtdkNJTGNOTTk0b3pDTkJsbHF5bFZ1?=
 =?utf-8?B?V3VYZzR5TGtMSGdRbTcrMzVkb3ErNkQveFlzcnFGR3NYZlF3R056YmJkYjhE?=
 =?utf-8?B?VUl1YUlrQVdvUWlwV0RNYWZhcWFlbGQ5THVINFVoa1R6N0o5aXh3b0pLVTNV?=
 =?utf-8?B?c3VueWJyRUx5cUV0K29KZzA4Y3FrdWZzQWVrYkoyYnBJTk5SalFyWXRwTGht?=
 =?utf-8?B?Z0dqWGNzWFJ1VmZhR1FtYThzSk43REZwaWRHU3hWcURDdzFvQk1Pa0pKYjJa?=
 =?utf-8?B?VnVFTzh3M0hObDBXS1gvQ2hveG90SU1NbEs5ZGo3eGJvZlZXK0VmR1UwWFdM?=
 =?utf-8?B?bVdEUHlpTGY4bFhuNFRkbndvSDNlajZkaktpT3l2UFdrc3pIY2N6YUF3c2hP?=
 =?utf-8?B?Q0hQQ1J2dHNTTnM5VThVSWtUN3NHQnBPTStTSWFHYWNQeXhYR1hHajVweDl4?=
 =?utf-8?B?YklNaUk1TkozRWE5VDlJdUd6WFFCMnAwaTdhcG1qbWEwUXF3c2w1REY1VFd3?=
 =?utf-8?B?VW1nSVd1Mnk5N1Zkci9Hby9zSVlOaFhRbGcyOVBvUjBmVzhvb0I4d0o4djF4?=
 =?utf-8?B?TW9la2RVbCt3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amRKdGt6dFNPQkk3c1BHZUE0YzVSSC9pQU14aUVaR3RuSWViWkxLUnN3OUhC?=
 =?utf-8?B?UCtndkJETGJoOEU2S25sNG9ORHU1S2RYekRST3FGTnBZUlhXMEp4VVAvdkw1?=
 =?utf-8?B?REI3Y0FhRitHQklrb1R6S3hqY3lFcEtuL2pQZDlaK3lGdjQ0ekg1WXRLY1RP?=
 =?utf-8?B?Qm1CZ2VuTlBUYTk3My80RWR5VlNxUzdxSnpnVlNnWHh1Y2dQZVBFT2lpSThu?=
 =?utf-8?B?K1dWODVPRnp2NDlXTVJZaHpBdWRvcjl3V1J6MkhOK2J3eUIrZjEvRGFFQnli?=
 =?utf-8?B?VUVZbU1UakZLRmg0VUx2cWdiMGlIVDdIZzZSekkxd2ZlbFowUHRhYUNzSTc0?=
 =?utf-8?B?U2x2WkNBbkp4bDd6RFlhczkwVXBIUzFqZzNWaHhVUlhuTEFrZTcrSDBSVzJ6?=
 =?utf-8?B?bHBVTEdITkx5ZkFFMjUwSTUvWkJRSDNzc3ZYOGdHNXlQVTlRcEVUYy83bUdt?=
 =?utf-8?B?ZFJFWkZVQkoyNjhGOGtDYzRyT0tQVU1DN3BNQ0pBQjhhdzc5bEtVYUNXQjdK?=
 =?utf-8?B?UXZ3ZWlsam1zNW1ZUXJpa3g5T0duSmFaQXhKNm5jRDhwRUltbEdIcnl6UFl6?=
 =?utf-8?B?Y3BDZmtmaVFndWRGYVQ4dklVRmhpSm11ZHJWOE8zUHk1SEJvVWVEMCtkTVo4?=
 =?utf-8?B?c29UUWw3aStOd3k5R09HYnBLY2R0cjFtWE1QejNUNTB2SUwwa1hpbXpYekIz?=
 =?utf-8?B?VC9kQ1I0M1Q0Z1VCSHBRTzdjc2VmaDQ5cUtnSy9ZRTgrb1kvc3lidFc5eGU5?=
 =?utf-8?B?d0xnWFBic05QN09sQnRtY05NdFhLOTEyYzJRUmVRVzB1SzhOQ1RyWVJvVXds?=
 =?utf-8?B?NlhsOXB2dVNNdm5yNWhuaDFvT3dXMHdyYWd4cGJOc1VxT0IrdE9BcnBGTFVq?=
 =?utf-8?B?UUpYVmV2c3RiWkp4T2JKeS84Q1lic0hTYXlNN3dJMjBHYnFGaUV5R29FQWQ5?=
 =?utf-8?B?c3ZjM0w3REFETUk3akV0Wk1hdkl3R3lpNExKeXp5UWgzZ0k4Vmo3blQ3U0JI?=
 =?utf-8?B?N1FRN2xmeitFZCtCVERmdHdUUlJzU0hhajZLTTEzYVNSYXpqQ1lkMXNmcDIw?=
 =?utf-8?B?aUFiUHA3d3phcWpjNU1BY3NubFJkUjlCbDg4REx5RWdLaHYrTktma3RVRlNW?=
 =?utf-8?B?eFl3RmZlSk10MVQxTXRLYVo2UGpudllyUmZUMFd4cHh6dUtaaEdlRDhxUWo3?=
 =?utf-8?B?d25qN2F5Zll3ZVpuRzNOYjlJM0lwNUpUYk53M2NYL3pIVnI3dUluRTBReW9F?=
 =?utf-8?B?YXRXUzg0OFUwSm5wSTNnNEpwKzlXYllkRTd6SFNFZHdDUTV6QSswTGo0ZGNU?=
 =?utf-8?B?K1JYdURGS29xNUV2M0g2aGdQcXNjT1FyaWR2aHpqQS91cU9uNGE2UWx0NHVm?=
 =?utf-8?B?NGFXS0ZjV2diSXRKWTE2T0s4ZER0OFNyQnkySHZua09XRWFvQ25ReHNTcTJ6?=
 =?utf-8?B?aWRGRTdqQ054NWhzSDhNdXpyRWhrclpkMXlsUm1RWXYxMWdxYnp2eGQzSDBJ?=
 =?utf-8?B?Y1kxRDdQUnl4c0hvRTVvd1E5SVNSQUVvM25pOVNDdHhzcXlaNnlxalRtTGM5?=
 =?utf-8?B?a0p5MFVlWG1OUkdBZUd5anlyaXdObEg0dVRPZCtqMWdjZnNvZmY2dlZMVkMx?=
 =?utf-8?B?dFpTaW5RM2RmYUx4dWovZXZZT1ZEUy9iSXNlS0FrNmZacU9vd0piWitvSG8r?=
 =?utf-8?B?b0lDYVR3cmQwRVhEUnVJMDlFRGRLdU1uK1gwbldsdzVML0VVQTJCd3FjVDgw?=
 =?utf-8?B?QTJ1WldZK1g2NFc0dkJ1aWdEdnI3YktYRTZITm1PQW1YSGpPRkJ2TGR0QTBt?=
 =?utf-8?B?Tk1rbldJd1hkWVNtWEc0U1JLZ1BFK1ZFLy93UWkwck41NTRhRklzKy94TmQ1?=
 =?utf-8?B?RzROeGVHcFRFZnlSWkJPY1VMdjVYdjByNG56RnJsanYvM3p5NWZod3BVZ3B0?=
 =?utf-8?B?S2UzdDJPWFZvbkVHTk43MjRXZGFVSHY2VE1PNU5GZ3YzU2RxNXYvcnFtNlY1?=
 =?utf-8?B?ZmVXWEZHaEdvaW1VSlZxVVZjbFFKZlAwOEtkVkRhaXc1YmRWNm9xSmoramZ0?=
 =?utf-8?B?SXZQaG9EalNmZ0YvcTRMbUU4eU5TWTJqa3hOU283OEhPWEd4QXlyQ0w1Y1Z3?=
 =?utf-8?B?U215aGJWN0lyQlV1NHlFTWhoTnJQTWZkb1cvdGRPOGtsYmFCb1E5WCthQzVG?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42439562-609f-4680-2fad-08ddb48011eb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:07:10.9765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9RUmLOcY02HSD6vWLllYlO/ih71uPcO+Km1XrYs+l40a10iWtOmUAC1rxGiKVzHl04oTgZ0XU09vNSBthC9yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8378
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

--------------oLgpwzJKPp5nrGYTHSvdZIdQ
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 25-06-2025 20:16, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Purkait, Soham<soham.purkait@intel.com> 
> Sent: Wednesday, June 25, 2025 7:33 AM
> To:intel-xe@lists.freedesktop.org; Gupta, Anshuman<anshuman.gupta@intel.com>; Nilawar, Badal<badal.nilawar@intel.com>; Poosa, Karthik<karthik.poosa@intel.com>; Tauro, Riana<riana.tauro@intel.com>; Cavitt, Jonathan<jonathan.cavitt@intel.com>
> Cc: De Marchi, Lucas<lucas.demarchi@intel.com>; Purkait, Soham<soham.purkait@intel.com>; Dixit, Ashutosh<ashutosh.dixit@intel.com>; Nikula, Jani<jani.nikula@intel.com>
> Subject: [PATCH v6 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency counters through debugfs
>> Add debug nodes, "dgfx_pkg_residencies" for G-states (G2, G6, G8, G10,
>> ModS) and "dgfx_pcie_link_residencies" for PCIe link states(L0, L1, L1.2)
>> residency counters.
>>
>> v1:
>>   - Expose all G-State residency counter values under
>>     dgfx_pkg_residencies. (Anshuman)
>>   - Include runtime_get/put. (Riana)
>> v2:
>>   - Move "dgfx_pkg_residencies" from "gtidle". (Anshuman)
>> v3:
>>   - Include debugfs node "dgfx_pcie_link_residencies" for pcie link residency
>>     counter values.  (Anshuman)
>> v4:
>>   - Include check for BMG for and add helper function for repetitive code. (Riana)
>>   - Use "drm_debugfs_create_files" to create debugfs. (Karthik)
>> v5:
>>   - Reorder commits to reflect the correct dependency hierarchy.  (Jonathan)
>>   - Simplification of commit message and rectified register offset.(Karthik)
>>   - Error handling and return before printing.   		    (Riana)
>>   v6:
>>   - Remove check for DGFX as BMG is discrete. (Karthik)
>>
>> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
> LGTM.
> Reviewed-by: Jonathan Cavitt<jonathan.cavitt@intel.com>
> -Jonathan Cavitt
>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index d83cd6ed3fa8..3f276d85c2ba 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -11,16 +11,19 @@
>>   
>>   #include <drm/drm_debugfs.h>
>>   
>> +#include "regs/xe_pmt.h"
>>   #include "xe_bo.h"
>>   #include "xe_device.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt_debugfs.h"
>>   #include "xe_gt_printk.h"
>>   #include "xe_guc_ads.h"
>> +#include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_pxp_debugfs.h"
>>   #include "xe_sriov.h"
>>   #include "xe_step.h"
>> +#include "xe_vsec.h"
>>   
>>   #ifdef CONFIG_DRM_XE_DEBUG
>>   #include "xe_bo_evict.h"
>> @@ -30,6 +33,23 @@
>>   
>>   DECLARE_FAULT_ATTR(gt_reset_failure);
>>   
>> +static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>> +				   u32 offset, char *name, struct drm_printer *p)
>> +{
>> +	u64 residency = 0;
>> +	int ret;
>> +
>> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
>> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
>> +				&residency, offset, sizeof(residency));
>> +	if (ret != sizeof(residency)) {
>> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
>> +		return;
>> +	}
>> +
>> +	drm_printf(p, "%s : %llu\n", name, residency);
>> +}
>> +
>>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>>   {
>>   	return to_xe_device(node->minor->dev);
>> @@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data)
>>   	return 0;
>>   }
>>   
>> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>> +{
>> +	struct xe_device *xe;
>> +	struct xe_mmio *mmio;
>> +	struct drm_printer p;
>> +
>> +	xe = node_to_xe(m->private);
>> +	p = drm_seq_file_printer(m);
>> +	xe_pm_runtime_get(xe);
>> +	mmio = xe_root_tile_mmio(xe);
>> +
>> +	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2", &p);
>> +	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6", &p);
>> +	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8", &p);
>> +	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10", &p);
>> +	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package ModS", &p);
>> +	xe_pm_runtime_put(xe);
>> +	return 0;
>> +}
>> +
>> +static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
>> +{
>> +	struct xe_device *xe;
>> +	struct xe_mmio *mmio;
>> +	struct drm_printer p;
>> +
>> +	xe = node_to_xe(m->private);
>> +	p = drm_seq_file_printer(m);
>> +	xe_pm_runtime_get(xe);
>> +	mmio = xe_root_tile_mmio(xe);
>> +
>> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L0_RESIDENCY_OFFSET,
>> +			       "PCIE LINK L0 RESIDENCY", &p);
>> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L1_RESIDENCY_OFFSET,
>> +			       "PCIE LINK L1 RESIDENCY", &p);
>> +	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET,
>> +			       "PCIE LINK L1.2 RESIDENCY", &p);
>> +	xe_pm_runtime_put(xe);
>> +	return 0;
>> +}
>> +
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"info", info, 0},
>>   	{ .name = "sriov_info", .show = sriov_info, },
>>   };
>>   
>> +static const struct drm_info_list debugfs_residencies[] = {
>> +	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
>> +	{ .name = "dgfx_pcie_link_residencies", .show = dgfx_pcie_link_residencies_show, },
>> +};
>> +
>>   static int forcewake_open(struct inode *inode, struct file *file)
>>   {
>>   	struct xe_device *xe = inode->i_private;
>> @@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
>>   				 ARRAY_SIZE(debugfs_list),
>>   				 root, minor);
>>   
>> +	if (xe->info.platform == XE_BATTLEMAGE)
>> +		drm_debugfs_create_files(debugfs_residencies,
>> +					 ARRAY_SIZE(debugfs_residencies),
>> +					 root, minor);
>> +
>>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>>   			    &forcewake_all_fops);
>>   
>> -- 
>> 2.34.1
>>
LGTM.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>


--------------oLgpwzJKPp5nrGYTHSvdZIdQ
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-06-2025 20:16, Cavitt, Jonathan
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CH0PR11MB5444E60E76CB4BAFE1CF0CDBE57BA@CH0PR11MB5444.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Purkait, Soham <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a> 
Sent: Wednesday, June 25, 2025 7:33 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>; Gupta, Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>; Nilawar, Badal <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>; Poosa, Karthik <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>; Tauro, Riana <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>; Cavitt, Jonathan <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
Cc: De Marchi, Lucas <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>; Purkait, Soham <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>; Dixit, Ashutosh <a class="moz-txt-link-rfc2396E" href="mailto:ashutosh.dixit@intel.com">&lt;ashutosh.dixit@intel.com&gt;</a>; Nikula, Jani <a class="moz-txt-link-rfc2396E" href="mailto:jani.nikula@intel.com">&lt;jani.nikula@intel.com&gt;</a>
Subject: [PATCH v6 2/2] drm/xe/xe_debugfs: Exposure of G-State and pcie link state residency counters through debugfs
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Add debug nodes, &quot;dgfx_pkg_residencies&quot; for G-states (G2, G6, G8, G10,
ModS) and &quot;dgfx_pcie_link_residencies&quot; for PCIe link states(L0, L1, L1.2)
residency counters.

v1:
 - Expose all G-State residency counter values under
   dgfx_pkg_residencies. (Anshuman)
 - Include runtime_get/put. (Riana)
v2:
 - Move &quot;dgfx_pkg_residencies&quot; from &quot;gtidle&quot;. (Anshuman)
v3:
 - Include debugfs node &quot;dgfx_pcie_link_residencies&quot; for pcie link residency
   counter values.  (Anshuman)
v4:
 - Include check for BMG for and add helper function for repetitive code. (Riana)
 - Use &quot;drm_debugfs_create_files&quot; to create debugfs. (Karthik)
v5:
 - Reorder commits to reflect the correct dependency hierarchy.  (Jonathan)
 - Simplification of commit message and rectified register offset.(Karthik)
 - Error handling and return before printing.   		    (Riana)
 v6:
 - Remove check for DGFX as BMG is discrete. (Karthik)

Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
LGTM.
Reviewed-by: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
-Jonathan Cavitt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d83cd6ed3fa8..3f276d85c2ba 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -11,16 +11,19 @@
 
 #include &lt;drm/drm_debugfs.h&gt;
 
+#include &quot;regs/xe_pmt.h&quot;
 #include &quot;xe_bo.h&quot;
 #include &quot;xe_device.h&quot;
 #include &quot;xe_force_wake.h&quot;
 #include &quot;xe_gt_debugfs.h&quot;
 #include &quot;xe_gt_printk.h&quot;
 #include &quot;xe_guc_ads.h&quot;
+#include &quot;xe_mmio.h&quot;
 #include &quot;xe_pm.h&quot;
 #include &quot;xe_pxp_debugfs.h&quot;
 #include &quot;xe_sriov.h&quot;
 #include &quot;xe_step.h&quot;
+#include &quot;xe_vsec.h&quot;
 
 #ifdef CONFIG_DRM_XE_DEBUG
 #include &quot;xe_bo_evict.h&quot;
@@ -30,6 +33,23 @@
 
 DECLARE_FAULT_ATTR(gt_reset_failure);
 
+static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
+				   u32 offset, char *name, struct drm_printer *p)
+{
+	u64 residency = 0;
+	int ret;
+
+	ret = xe_pmt_telem_read(to_pci_dev(xe-&gt;drm.dev),
+				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
+				&amp;residency, offset, sizeof(residency));
+	if (ret != sizeof(residency)) {
+		drm_warn(&amp;xe-&gt;drm, &quot;%s counter failed to read, ret %d\n&quot;, name, ret);
+		return;
+	}
+
+	drm_printf(p, &quot;%s : %llu\n&quot;, name, residency);
+}
+
 static struct xe_device *node_to_xe(struct drm_info_node *node)
 {
 	return to_xe_device(node-&gt;minor-&gt;dev);
@@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data)
 	return 0;
 }
 
+static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
+{
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+	struct drm_printer p;
+
+	xe = node_to_xe(m-&gt;private);
+	p = drm_seq_file_printer(m);
+	xe_pm_runtime_get(xe);
+	mmio = xe_root_tile_mmio(xe);
+
+	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, &quot;Package G2&quot;, &amp;p);
+	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, &quot;Package G6&quot;, &amp;p);
+	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, &quot;Package G8&quot;, &amp;p);
+	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, &quot;Package G10&quot;, &amp;p);
+	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, &quot;Package ModS&quot;, &amp;p);
+	xe_pm_runtime_put(xe);
+	return 0;
+}
+
+static int dgfx_pcie_link_residencies_show(struct seq_file *m, void *data)
+{
+	struct xe_device *xe;
+	struct xe_mmio *mmio;
+	struct drm_printer p;
+
+	xe = node_to_xe(m-&gt;private);
+	p = drm_seq_file_printer(m);
+	xe_pm_runtime_get(xe);
+	mmio = xe_root_tile_mmio(xe);
+
+	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L0_RESIDENCY_OFFSET,
+			       &quot;PCIE LINK L0 RESIDENCY&quot;, &amp;p);
+	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L1_RESIDENCY_OFFSET,
+			       &quot;PCIE LINK L1 RESIDENCY&quot;, &amp;p);
+	read_residency_counter(xe, mmio, BMG_PCIE_LINK_L1_2_RESIDENCY_OFFSET,
+			       &quot;PCIE LINK L1.2 RESIDENCY&quot;, &amp;p);
+	xe_pm_runtime_put(xe);
+	return 0;
+}
+
 static const struct drm_info_list debugfs_list[] = {
 	{&quot;info&quot;, info, 0},
 	{ .name = &quot;sriov_info&quot;, .show = sriov_info, },
 };
 
+static const struct drm_info_list debugfs_residencies[] = {
+	{ .name = &quot;dgfx_pkg_residencies&quot;, .show = dgfx_pkg_residencies_show, },
+	{ .name = &quot;dgfx_pcie_link_residencies&quot;, .show = dgfx_pcie_link_residencies_show, },
+};
+
 static int forcewake_open(struct inode *inode, struct file *file)
 {
 	struct xe_device *xe = inode-&gt;i_private;
@@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
 				 ARRAY_SIZE(debugfs_list),
 				 root, minor);
 
+	if (xe-&gt;info.platform == XE_BATTLEMAGE)
+		drm_debugfs_create_files(debugfs_residencies,
+					 ARRAY_SIZE(debugfs_residencies),
+					 root, minor);
+
 	debugfs_create_file(&quot;forcewake_all&quot;, 0400, root, xe,
 			    &amp;forcewake_all_fops);
 
-- 
2.34.1

</pre>
      </blockquote>
    </blockquote>
    <!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-IN</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;
	mso-para-margin:0cm;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
</style>
<![endif]-->
    <p class="MsoPlainText">LGTM.</p>
    <p class="MsoPlainText">Reviewed-by: Karthik Poosa &lt;<a href="mailto:karthik.poosa@intel.com" class="moz-txt-link-freetext">karthik.poosa@intel.com</a>&gt;</p>
    <br>
    <blockquote type="cite" cite="mid:CH0PR11MB5444E60E76CB4BAFE1CF0CDBE57BA@CH0PR11MB5444.namprd11.prod.outlook.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------oLgpwzJKPp5nrGYTHSvdZIdQ--
