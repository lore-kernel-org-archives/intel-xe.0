Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17457C282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 17:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B9410E4C9;
	Mon,  3 Mar 2025 17:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KpvjXYPR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5929510E4B0
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741022714; x=1772558714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WgQBKffeRzVqn9kBvzYD4R3mMVMcmhjCOEPJKxTY+c4=;
 b=KpvjXYPRF4kzwdDjSk8yofzTnkjfTHWgulzN5MsXGcUUUtfdQ0Yyxmnv
 44/tLrAuxJ3sZcwmRfLLKPDXUtZeQ+fY2oCfStuJSqDd4EHHDieQUwj+b
 Ts+9b3xHvrSWqIurWPTJnbb9Ww36UTKe6SxvsT34/1qH2Qm7dRNMPGfmG
 3kX9lt3ZN++SXLM7ryn4HOGmKGN4xWGvQIo2XfzOjWLBOhX/i2aPApRLH
 0vbu6Qcp6fbd9znDCjQN9v+eqKjPWVD1gech1cem2diOqwD88Ae2h2RMY
 PpmOWTuCHqR0L+9dWWefZ9/ZalvkEvxX6KAGYhPn+icpc6F6Ru+EuupzH w==;
X-CSE-ConnectionGUID: 23nAsd9+RXevcIPr/a2+4w==
X-CSE-MsgGUID: 99SvIRMHStmiKcXVWnHQKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42028894"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="42028894"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 09:25:14 -0800
X-CSE-ConnectionGUID: QTS2kpR9R6qDRQNtFJGHQw==
X-CSE-MsgGUID: O9cU+redTtKjBrw+5uUHTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123342822"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Mar 2025 09:25:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Mar 2025 09:25:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 3 Mar 2025 09:25:13 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Mar 2025 09:25:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAUsjuyOCLHgLCc1So+sMhaNkdEh4/5UhqCJPHk802aYAHJIFKTS6/22VF4ULBF5mP454TSBQ43trFu3UffVGgInVkQ+GjpleX+Pn8m2pYoPzse8IetaOQlwgR+0rcugkB8XcQobs2RSZSEOREA32aTxZ6L7RURdCF8V0iN411PGZqxAl5x0ON9FLRz0uzAD5yMWdw/x8gzH99nOxVGsYjkAZWZnrGanwdZdAerU2U+JDI7SpuHpbtBRJexA1X62Z3Kwa05a3ki3bItztB3m2NZ7pabpsTUwnDMv8sKxnsbO3OfogCk6bvlJe2A+MdPprviDaVrp3L/ig66VzLwXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgQBKffeRzVqn9kBvzYD4R3mMVMcmhjCOEPJKxTY+c4=;
 b=AfNCnzK6IFeM829WrQZqSq7DGxw1bTVxwzWXKSZDym9kLQHTezz+vHEOdzVYlsGicDEXQedp7ugigR1Et33tiQoHUQGbB3MUxsFvdub1J7lcRLYmtDcpnQXfTOHMWIU/Eivx9EksaGTUn2Jg2fF1irXpvOTgkOrz92ZERBKuTMAsHaaVKiqTDKKeQJ/nZ7yhkzzXe55YfPwwIbOdITx3grwbrym5RTPakablE2HN+1QonaaxxYzbqmHSGbtZcUmuU2Jb8AdjkHw0K/3zV29n+/fbwpi+R0vzkoxIRRLIUAz8ion4mTdIP3yMmxdC9m4j52EQh0aQ/MAV3c78zrBkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 17:25:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 17:25:08 +0000
Date: Mon, 3 Mar 2025 11:25:06 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH V10 0/1]  Add UAPI support for low latency hint
Message-ID: <2kzlq7haneomn6ecl7mujcjsqc74z2jmtnno6n7fxgtn7lzwpq@iqyzihdx4iel>
References: <20250228070224.739295-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250228070224.739295-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MW4PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:303:8c::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee32452-7bbd-49b0-418d-08dd5a7858b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DWM6gBqhN7hMtYR30P6qLSsl1OEfKb8QBTrJA1d/hTCMTC2FjfXK2J35l6hJ?=
 =?us-ascii?Q?7tN5uF0Lz4+/365AAra29VccCEz+I2tgwDBLIpUfoInwXZUqjjbMOw3d5TTI?=
 =?us-ascii?Q?wvgs6hbJ5H3zz/mkwTIKVo+Q3xXPxtYZJYbGOEYZ7zBRCdHGV1homJdi33Is?=
 =?us-ascii?Q?eDgOPDLuPadWfCWfFD/63WA70ESmoNR2JpT0I7WZpQW8VyXb3P8uX6YdOUqT?=
 =?us-ascii?Q?3QLyTLT1APeORb6ZUyhGjdwNDq9o9ZEQ4Ja5zNIMZY7WQ1xFr5tV2ehwKyMm?=
 =?us-ascii?Q?sK8LzyhTiFDMtNqWpRSBHPwoEKopXLIkYfAeQmmqRi2bZmAaMvWjEGpR63oN?=
 =?us-ascii?Q?oHaTdu9AFrhBaenimIUKexag4I+x76PfNTKt6+fyOxhy2sFiPeJv5mSBLfHY?=
 =?us-ascii?Q?ncU9r9q8bJIOzVCKHfOIeC62zvD5tZQ4mkIDRVAFtLOIlpBl6nCSsiwacPjL?=
 =?us-ascii?Q?19u+bmWkXsnR5dAieI8l4Ou7BPPoc7rdK1qOjHXDH2dNM3C192Ne0xgU3RTh?=
 =?us-ascii?Q?II6ygCto96lF0LjTbU9yZ8J1DVAG+Usqxa41fV/ny9doWR1pHQojycJ8I9fg?=
 =?us-ascii?Q?XWen4yA5xkh6phcmMe/bUfaZZev5nxf5ZvPb/iCoX67Mw3saMloyXRCitOhZ?=
 =?us-ascii?Q?uFRciaJeXc6RRCdsvhFMtqLy1kGL/NKdPfrN3+doxp9wx4rB2hZN76FtjtH3?=
 =?us-ascii?Q?J3loIjEpTggIt/y5lNCk9K7JvghN+fr1mZO19Pc7ytrqU08dQz83EWTdWb4u?=
 =?us-ascii?Q?JKrt8v/BgNijk463u5CkVwv9ktdhmnva596KjQ9FPMMHtUVk95HTnmig6FnJ?=
 =?us-ascii?Q?AgWngJ6l2jz4ShebQyKSYhntAM98vdG0PT5mbnLTyt4H38+JGoU2QywQICJp?=
 =?us-ascii?Q?2O/bIdWB1XyldsUqpEvQyKYjnJfpGKRLP3xJwXktzj2KDJx/kTxjTBx3rekN?=
 =?us-ascii?Q?wZ4LYdvx5g6SJwigmDJmYCH0uYtKJe3KHowVZ9tXZRQ8vQqwVeuu4q6p6MQo?=
 =?us-ascii?Q?bFmZh34eSkihlTGGzwbwRJPbn/svLOrhXXGM20LjgWH3wxWFDXEkLN+p7Qrb?=
 =?us-ascii?Q?YzNalFwg7DcPVkrE2QRQL0TDIEz3U41AWJGPW+ttc9DdMouslzg+zaAu++kB?=
 =?us-ascii?Q?WWa6LWwmf3RFECd2FHQVSR6eiMsKXDrD2CGuo863JuOiX1E05pPQkThFLIIn?=
 =?us-ascii?Q?zVh54LlYw/AwYHK5x9BXoP9nHzA8gSiosDTcMnqPhO3RKa1O5kzAac+ObmSC?=
 =?us-ascii?Q?EeuznzQLGXep6dwYwF2iQaUgmE5JEvj17OEEbTXjsIDly6ywKitGiIjej+xB?=
 =?us-ascii?Q?iCGHYzTKwJ/KP4o501z0rjQAviCBiIEbVOlp7unkjwfS5k4p2bfR8s0y7dNi?=
 =?us-ascii?Q?4IFyNM+YxDocoZWl05HoXQC8mKcI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jJKfM+yt38LHEUpxCViSTqzCo1ybJkWRMgFfXRexlHF29y/LXAdbWo945KSd?=
 =?us-ascii?Q?SM2jIFm+3NaUr59lGsTWbC6B7slBWFWB+uxr8vKkd3Ojv16vmyjkMEg+z50k?=
 =?us-ascii?Q?A7o1ZdRmfK0XCiiQ7xHHIkTybJ75Tko2r4VeO6y/ttbN7quxJZx2iK00bTMl?=
 =?us-ascii?Q?0WxabvPH3egF4Oyo43LlmuqRK3R5G4rgdhUxPUGia+ayfv1tFBCnHzrKZagL?=
 =?us-ascii?Q?1wduMBYtCdXwcWeWSieipH3nCv8LHRX+Sf0qYQ+/D5TFSnuAwj5p+ICVWLCy?=
 =?us-ascii?Q?9dHQiQwEnIvfWeffcktIbfglkYjombYBUKvTrzi7nxzvPCHsKF6i7uGMytle?=
 =?us-ascii?Q?mzgItZNajdSt8qVsL4jtMiJkT9zrEcslJg16YY7WctWQgcq4EJlxwAsACSa8?=
 =?us-ascii?Q?Za1MuoLmAUm6ZKvwOEYwdH9J5nlxo1vwtE96cVH1JCINbU6na6gntt+Hc8wk?=
 =?us-ascii?Q?7TgyBuf2YKtHM3nvqhOQ6oOZUzlwK9/E3WQJQW2cL68x/UNoNXNSZG3+uOrB?=
 =?us-ascii?Q?UVIZ2InzB4p4d9652MKuuGYN5GMmw4cBrkA2Qom+8apGbv76Q2k46O6GHNcU?=
 =?us-ascii?Q?7XAPeE4VowPi5CmBaaOqW8GvfylNpdO5t87FSuaLhhDerbGM91ZBo0liHK4p?=
 =?us-ascii?Q?/EoxliktFbkIYVD/sj/JeC18o6uFgyFwgigHeDFnYFelxj/i2avA1WpWjZO+?=
 =?us-ascii?Q?PXwdxCwvakchUALTj7ln31xmOXx9XvEtVIYOX+tRTvmmqSUpCIuMEdHZD7LB?=
 =?us-ascii?Q?PK0KChIQCnVcX8qMT/pHFrR0+jQAI5K3BVxpV6SZZr+BLHD4v6MjGgnZFPyL?=
 =?us-ascii?Q?UdK1wjnMRvMXV1Gil4Z2Lz+VnMCtwR8bVJBtzCbFLl1BSQZWJzHECI5Oyu4O?=
 =?us-ascii?Q?42JqKhHT9aWXxq4E1Mub5PkUadE+caSa88esNyT5Q65rs3d4ntMxwFAvLZX6?=
 =?us-ascii?Q?YAxw+lHfuwchfn7/zeuWGlE/jD1brHzccAab39DLykDjxuUJp/vkmb8tMTNU?=
 =?us-ascii?Q?ivfxxmPc1UFlGML4pBZpB5HO3VWew0m/ZWZvstBIuy2hxU5azrTWHpmQrx6v?=
 =?us-ascii?Q?8uilia3I16c13c2kdUbHSPqjSreMaLaG0+Il3+2ST/9aLuuK3S1lr2W7GCLu?=
 =?us-ascii?Q?9/qYu/KLD+R+sc1UohCrLLUHZND4u96UO5nydP3e6ZXsq2ED7r3+WZbEzCsp?=
 =?us-ascii?Q?TYp5K4dnrN8C9qeQL92yq7bcsI6Pw6T03qlT58F6igD+gmW7NeVF7RX4BZ0L?=
 =?us-ascii?Q?ZpIe8inOPUXix9bsd9DdOUH9CAkGx9lWQQxd0iZUqEw3xoi1S13EF3PMhbUh?=
 =?us-ascii?Q?IHf7pFr8VQ5WPfPyi9PYMyF/cNNbTMt+AvoT4vK2X/KkFo2pWxUAGODzPNO7?=
 =?us-ascii?Q?nCtUTZd73ibuAcvhcRJ23ZLhfDz21GSuY5nh2mcBevgHXxVadWRj2F5s9sXH?=
 =?us-ascii?Q?68FeSMKsJ72milA13pd05j7tYnR4XJEp9jplut/90faQcS69r7n7NbN8z4QQ?=
 =?us-ascii?Q?pcbDTeBeft0mv5B44aTreqlsX9dzXzTMw2LJizXY5hA67crJ/92wfY0zyClB?=
 =?us-ascii?Q?pbGjKGbg+Wq4bxmwenDTAKMz07WR3aLqMWz1VoDik8g4HCMz49wIsla9Xkt7?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee32452-7bbd-49b0-418d-08dd5a7858b7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 17:25:08.8755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgBVeXyDJ0VAFHy7VwhTooihhe5zjwbe6YBlCY8c3AJiltaQgxPaUL1dmVrtCnDvEX3jp+TGCAAC99e0FSPsrbMy2rEylaakWEILoP/wmgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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

On Fri, Feb 28, 2025 at 12:32:23PM +0530, Tejas Upadhyay wrote:
>With this user can hint low latency during exec queue creation.
>KMD will forward hint to guc.
>
>Test-with: 20250227122117.711646-1-tejas.upadhyay@intel.com

There is no Test-with for xe. I just merged the igt side, let's re-run
this.

Lucas De Marchi
