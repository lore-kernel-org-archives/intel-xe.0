Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60467606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 13:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gscIlhsw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B4010E228;
	Fri, 30 Oct 2026 13:43:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4A910E228
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793367789; x=1824903789;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Tq2Xex48+VT4HD1ipeXI3x43K7+UBvlJdv5RGhc+z8=;
 b=gscIlhsw0a1PBfwYDuko/btGIRPr3Ksr42UyH4w20Ur1f/MLWIwzyTwo
 /pIR2yWFi/TqxlkB+0TV5tgrtpyV4RadoDTz8uAUtVGJdxyKiUf/oJtik
 WQS0/BDwX2jWU00WKRbkm5PandAvC0JBSx1zHx39OY5aWI25YxYDwxE1L
 M0blTxpp3zxQAKrI98ZNWSPT22XmTu9Wu1nwCIvtZ/MC+VOu6BM/GXgXm
 vr9k1OrgRVe+ecpkRAtsxG1iS5lCb9OZ1jmT9mYHoybwEW+BUX7UAFjCN
 dAl+vA12d+Giy26ZR+zWJSHM8VfA6eTdqAc0VhOA3wrLy4HZ68by7kpFs A==;
X-CSE-ConnectionGUID: kNll1B37QrGD851bYzlwhQ==
X-CSE-MsgGUID: wIclcBBLTx6KMV32iyz+Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2023499"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2023499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 06:43:08 -0700
X-CSE-ConnectionGUID: Q64TAm5DR3GQUo308G8MCQ==
X-CSE-MsgGUID: 9ybvd/vxQgS3qRve9OQynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5459217"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 06:43:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 06:43:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 06:43:08 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 06:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0wsnpCVeDOExdd+jH+i7yKyirknOo1X50xzhL1VFNaqDqc6nmQb3aPZsS5FQLiTjzbBQBViAR10C+hQw5vNFMiH4nGrwH6prUPxiYZvlM9CzbJTL7ZOmb+Q69m0fQSpo4I22zLT40aEm99s3Ppab1ullHVhBfsYZNiTYxUbOIaCgvb8c6vFi6UL5g+L1Y2jC2qmaez+xxnprorJ8YY5+DrpYPcpwP/nfQxuA+cltT6dk8FMW8QGf/N35/uSe5t4IVHSdFL/Zni0Dh9GLKeMlGS/c7jgiP2qaoshfEufdIoFB6mmnRFnDfzUc2FuYl0a+s+m3Ym7sw4gGt7y8X8Vlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlQPsjcWO3r8OjMCMI2o6RwdVd2SErEm2dXn58SCcgg=;
 b=gmLqnMRXVVCWVit+adCNE1NRSmY0TJjnwXksYjE3mkptt9uOVHba+CPVupkr8zVpDhv1hoea473j7xw/NATWUmPHyD9NQvY4BFQWXJkTDKKAIIf53+Z9A3qGawNVTSkOH0uRhBtKVRYS3pSLpFpQi2ZmPR5JAdzxkVlGXjXrhRPCzL4rPWoCYWwkqo4sVrEdR9Ix3as6wW41Gg/TwjnnealF6qYBWQegUL5t+QfU31uV+/XyBMSTjuJmC6H2UxT4O/CN4BG60kcBQGbMX5y5Br5Ad7rVv6gitwvTe+KDnBDRO71N+nlriQV3uExUrb6P1Fp1JBkKua47ZY72eT1p/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by CHXPR11MB9650.namprd11.prod.outlook.com (2603:10b6:610:2fb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 13:43:06 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 13:43:06 +0000
Message-ID: <b186efb7-fe31-40f5-94f2-7517d147adc8@intel.com>
Date: Fri, 30 Oct 2026 19:12:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] drm/xe/hwmon: Add kernel-doc for fan control
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-8-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-8-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|CHXPR11MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab4f249-219c-4710-aa3e-08df368bba21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|11063799006|3023799007|6133799003|261009223027099003|261028144727099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|56012099006|261026121527099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PCldhtlDCwcG3Wka9SsRWcTK0WbPDRj/ysjjk6GKBQc04SuMnCiLRsddg2cqwaIpRw28Bfz4lVQufQ6DDRyAUVSViem1yG59c2wEBNbYCsWPzlb7h6obI06LGYz4kzL5p0SD70Sl+S+6tk3pknYJj8O6Q7MjjS9HRllR4r8KZTxY6AnG0kK2Rh4PQzK4WuQPlx4NJ9ErcyopshXm/G0+/5LnL/v/dqhOHwvhTCpOuRr2g/ClEAzyvqE0WEtIbQXs82tYYod3ngpGZyWv1X4Ix+Jf8UpVQJB07GZucbjSD80vXA7uWKyVWWiWzzC2WYrF3JLNp7waVtCvuPZdb/c+2B6mzVg2CzA9XwM8A9Bdz4smEzJKEvS42+g97pLsVlE/0RRxvMZDugVhhk2vwGR9uMRxOWpRnaZ4WqfJqZ7CCM1uFtlRwj3W3TssD/+gXa33xISpLrZMJ0sXAcz/7Ho/7h3yVFq9RS8h5BZF+5Q8CtWCWbbpSEkX+MR2ZIJD88t0+lDJniInOtWQ3bwXbDIEovha/luPqgX/AsNvL4sTlQ+tslFA/FuuB5Qorr2QkQzwMr650lC1U9HRc7dM85sK6eX5GOxwDp4u2LfvPAeYrLnsPbZjMHhvuUrfa3fHVYwE+2iGqyasWm5Jx2W7+e1DHnamn2DqzLrmKP+CFjXHGeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(3023799007)(6133799003)(261009223027099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(56012099006)(261026121527099003)(261026140227099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnRsaXJ6RldIMDBVR3RjV3RvZmVNdGxoUUEyZ2ppSU9PblpxZVFoL3hXU3ZT?=
 =?utf-8?B?MnZyckJYQXk3Rk5jKzZmaklOaVBLR3h4Unl5a3pHRlhzaXFBUFVGeGpPQ21F?=
 =?utf-8?B?aER6Yzk4WUVVMWhpaFgvWjVFeEFZYjQ2aFgwUmpNWkFWWk5NdHNnNjNvQjlC?=
 =?utf-8?B?S0Z3MWFxVDd3U2dmdmxtVzdWWTRQNmdWclM5N0dYVmMzaGdkVTlTSGFHaFBM?=
 =?utf-8?B?UU9GOUlQekMwdXlXRjk5MHR5WWwvUkZlNlczM1NaNFY2eTdmdFRzMjcrald1?=
 =?utf-8?B?Wm0yNjhpak5JeUN4Z3RDZUtDbmhBQUg1cVFSUVF6cGlFV2g5R1p0L1BqT3B0?=
 =?utf-8?B?SWxGa2w5ZlVYSjF2ZVREdm51ZTZrdUxrWG8xYnBrOFBySTlWOGZQR09nYXBr?=
 =?utf-8?B?MkRURHJQMlFUMkQzZEVxZ2h2eEY4NVNnZU41MllvQ1EraDBGY0VpK0Q5WXZB?=
 =?utf-8?B?TkxHcEM3TWhnS0c2QVpEdXJyVHNwMEd0YllNeWZhb1lQTnZBRHZsa01GZGNh?=
 =?utf-8?B?ejlFUWpmUFZKYTdjVlVCQkwvMUg5bjdGckxEUkdOdXBaa1ZlZ0dQZ29TYU9x?=
 =?utf-8?B?Sm5haWJkSTJwNTZuS1lhUjluN1M1TUYyZ0JIaXVDQ2k0YU95VmhNYlZOazJJ?=
 =?utf-8?B?cmt1eW5SUzg2ajQyMjB5VkRLNVB1Tk92NWFHTUJBVFNFSjNPV2F0L1ErQW1U?=
 =?utf-8?B?eFVqWVZ2bnNuU0t6YU0zNmRSSWZzV2ZrbmFESFhuS1JNeHhmVFd3MXI1OXdp?=
 =?utf-8?B?UjRmWmtKZkUrcE9GWWh5U2xDU21Nd2Y2bzBUVFJQa00raWxDN3lYNHdhUFZm?=
 =?utf-8?B?V3d4NzFFTnpxYmc5RXJTMjltV1dlUkVyaEszaEJGT2J1ZG55bFhZSzRPUHRW?=
 =?utf-8?B?b2lvOWFqNVFHYk4reTFxU1R5b1hIVHNnTGlkNGsxZzRaTFRYUmk0ZEVCY1Zl?=
 =?utf-8?B?Zi9LZDhZYVF0SjdnRmxjK0tJRTJCblU1clR0RERCN0p5aHh6Y3l1YUVwL252?=
 =?utf-8?B?cGswYk9jSzhJaDMwNjY1Wm94cmw4NVF2SjFsSUp4dm45MFYzRiszTFFHVTdJ?=
 =?utf-8?B?ajh3Um0raWwrNG5aaHpHSXAwQUNLSjdvUHdUVWxwL1BERjZ4a3lJOXBibVRt?=
 =?utf-8?B?ckN2czNoWEk0cHgyNGJvYTVpemxEcVlHOWw0TjVvYWNScXZZeVRsdE1UVi8r?=
 =?utf-8?B?Q3pRTWljOEd0cXZTbllNS1FVUHdYTVgzbnNhL3JkVjhOZnNjVmJnbUVFUkpE?=
 =?utf-8?B?eVdtakdYYmE2U3d6N2M1clBNUGdYK3VsbjZYYnp2VjNVNmQzQnJ1N2V0S2h5?=
 =?utf-8?B?eTRUMFJiQjlVWDB5YlRZWjJlTjU4M04rcHAwVGFnN25lL2dQVkFidnpVcnpw?=
 =?utf-8?B?MWZQQW1HUURKODlFL1lxVUhCMnhGLzI5eTBqQ2doL1MzR3BTa0xTYlgvUTF2?=
 =?utf-8?B?YmNkaDdwUXR0bG1aeGgreGFyS2hTeHNVaXUxTjJlbk9GMTlnTTRoT0NvRm1N?=
 =?utf-8?B?eXh0aGNxMXd1TGJ5NFBEZ0tDWFJIVjg1L1hBZUdWSFc2eDlUa0Y0bkVRRjZI?=
 =?utf-8?B?K2c4WDd0OWh5MEYrcEttRlhIT085NmVzUndrbWtlQ2g3VlZ3UFpXYkE3SFVP?=
 =?utf-8?B?dC9lYjcrSkcwV0FTc243cEZKVUVNeFRBNFRTamI3QmpWLzBWL05FZ3VLdGl3?=
 =?utf-8?B?a1Z1TWlFTXY5bE1WeUo5M1ZPVnFMMTJzK3JhWE05OXJaT1ZaakM4TVZCcEZo?=
 =?utf-8?B?ck03NGVnakMvNStWVGFYcEp4UmZraDNJMHlTOWZOeDJGVFVtd0FyN3BlMXcv?=
 =?utf-8?B?ejRVcmwzdEczY1MrSXNmVkJodVFiTkJMQnh6cTRJV2FWWFBnMTRsVkRPTmFP?=
 =?utf-8?B?MTNhSHlxeGJ2aEZ3d3BSYWI1cmRGcVByNFgrSUZjVUU0dnZwZWZqak1kd09V?=
 =?utf-8?B?d1kzQ0owS29qd2c0eXBNVUVrZEkvKzFCUTZvMmtnUEhsblVkS1c1QUJMbWlG?=
 =?utf-8?B?VkJtUzNydWxZNitDMmxEYjdDWkd1eHNob3U0Tk5CUWQ2SWI3blM2SHlLKzdZ?=
 =?utf-8?B?L1F0SkE0RUR4cVBXNFNGV3VCTTNRZjdzcDVvcE9iODdFMmsveUxLRzM4UXp1?=
 =?utf-8?B?RkhnUklRcFRkK3BCZGhoRHhWL3cyQVZ3T0lrMldvQUd1UERsSjllTDE0UjBT?=
 =?utf-8?B?clludWJPcFFPTUNzL0xycUJjMDRjZHpjY0RCRWZWTFVjUnFnWHJ4Z00wN1hx?=
 =?utf-8?B?SUxwZXR0M01zQy9DRkljaEt1cjNVRHJZZDJkakFCdTlPSnN0bFB5LzNpU1Rp?=
 =?utf-8?B?OG51dkRLZkVDMFl1bTY0QU5jVmJoMEppR1ZzcXRObUs1Nit3UHhKZz09?=
X-Exchange-RoutingPolicyChecked: HLR0KMWZnisoZB8J58xzsbiFddhOW1XxWNa9DYun3d43qdgknwppub1nVm9zg/Pv3RJok+d9xeRUo18ZeyOFLrc9+WZfBhYYfQdT2f9qN6PE4aaY8QVsHYyaLwW4Bea+E6VMdZFGlqH/Thzmu2VX0NzZFtMu80JgpD0rgOPC7vV15pZxKTAy4emuKvQPRZ38fMlxPRjbQysAb7myLbBQp6I4ZGmySV4H+g76HIURoed3J8btu0v5Sb61kld5YXsDLjaNM+3rVsg1ifbKIAWO53mvjLQoTS33KNbLJLzay4zlUxoh85UCUvDth6lyd0Y4jCYC5LmhdBi08Oz9YtqaJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab4f249-219c-4710-aa3e-08df368bba21
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 13:43:06.4383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFnMcZGoS4nOQsG6kKcqHZ8b2g7kPJ8bDJHIGqo8TDH2o8IuX9npQ3Tt38kqolJR6zcoHxEbBV5hWdlH65kecA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9650
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Add kernel-doc for xe hwmon fan control and describe the fan control
> model built around firmware stock tables and driver-managed user tables.
>
> Document the exposed sysfs files for fan speed, maximum speed, pwm
> control, pwm mode selection, and per-point fan curve temperature/PWM
> programming.
>
> This makes the hwmon fan control userspace interface easier to discover
> and understand.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   drivers/gpu/drm/xe/xe_hwmon.c | 43 +++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de2adb56d15b..aa3c921407b5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -139,6 +139,49 @@ struct xe_hwmon_energy_info {
>   	long accum_energy;
>   };
>   
> +/**
> + * DOC: Xe fan control
> + *
> + * Xe fan control is exposed through the hwmon pwm and fan interfaces when the
> + * platform advertises PCODE-backed fan management support.
> + *
> + * The implementation tracks two fan tables per fan:
> + *
> + * - A stock table read from firmware through PCODE.
> + * - A user table cached in the driver and programmed back through PCODE.
> + *
> + * The pwmN_enable sysfs mode selects how those tables are used:
> + *
> + * - ``XE_FAN_PWM_AUTO_STOCK_TABLE`` restores automatic control using the stock
> + *   firmware table.
> + * - ``XE_FAN_PWM_MANUAL_USER_TABLE`` enables the user table for manual control.
> + * - ``XE_FAN_PWM_FULL_SPEED`` reuses the user table path but programs every
> + *   point to 100 percent duty cycle as a full-speed override.
> + *
> + * The fan-control sysfs files are:
> + *
> + * - ``fanN_input`` reports the measured fan speed in RPM.
> + * - ``fanN_max`` reports the maximum supported fan speed in RPM.
> + * - ``pwmN`` reads or sets the manual PWM duty cycle in the hwmon 0..255
> + *   range. Manual writes are accepted only while ``pwmN_enable`` is set to
> + *   ``XE_FAN_PWM_MANUAL_USER_TABLE``.
> + * - ``pwmN_enable`` selects stock automatic mode, manual user-table mode, or
> + *   full-speed override.
Should the ABI values be noted (0 = full speed, 1 = manual, 2 = 
automatic), since users write the number?
> + * - ``pwmN_auto_pointM_temp`` exposes the temperature threshold for user-table
> + *   point ``M`` in millidegrees Celsius.
> + * - ``pwmN_auto_pointM_pwm`` exposes the PWM value for user-table point ``M``
> + *   in the hwmon 0..255 range.
Is it required to mention that point writes also require pwmN_enable = 
manual, else they return invalid?
> + *
> + * Writes to pwmN_auto_pointM_temp and pwmN_auto_pointM_pwm update the cached
> + * user table entries. The driver commits the full user table once the last
> + * point has both temperature and PWM values, which keeps intermediate sysfs
> + * writes from pushing partially updated curves to firmware.
Could the (0, 0) end-marker be documented, since writing such a point 
terminates a shorter curve rather than requiring all points?
and also at least 2 points, non-decreasing temp and pwm, else invalid.

Regards,
Soham
> + *
> + * Writes to pwmN provide a constant manual duty cycle by rewriting every point
> + * in the active user table to the same PWM value, clamped against the minimum
> + * duty cycle reported by firmware for that fan.
> + */
> +
>   enum xe_fan_pwm_enable_mode {
>   	/** @XE_FAN_PWM_FULL_SPEED: force all user table points to full speed */
>   	XE_FAN_PWM_FULL_SPEED = 0,
