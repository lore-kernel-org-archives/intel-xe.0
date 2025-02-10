Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D6DC0219D
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 11:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4E410E192;
	Mon, 10 Feb 2025 11:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3t07Ak9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F17A10E192
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 11:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739187134; x=1770723134;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=W6r4uvyt1C6VlVJDi3aHRuEfx/IgEuF0gP68tufNpdU=;
 b=S3t07Ak9tnEyIUBp0mdlksOijRBEVAHlcamaAQZEQEVhY5tsX4mzlaN2
 hQlsbnNKhV56AKhupFZMeEUNJ9cOg4ZfgMzKd4C9QqSE8c0hnAoxVAVgO
 Ph6vj9C9LsLuPrJsOGaCBtm5QOLxiBXFko4GahyslXQF+VA88JUFR1sjI
 hlbFK+VrkZBIn5/XpFyeW2p39cxHkfNQGttL3oVA3RwG96SA4WPQa4Jdj
 yX17tNOTCknYsF4Vt5mOI3s0pNn1ZoZozcR5/pGMVB0a8AAajiRHb7Twg
 0+D14anqX1ClbPjubs0P+8mtZTL6Im4m+lLQlBt7IrZKDWasaLpBddQJ5 Q==;
X-CSE-ConnectionGUID: GvM6oV0BQ06UHnKzhZLQeg==
X-CSE-MsgGUID: 7CYHQi6ZQJuyPY/0YU2mTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39629143"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="39629143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 03:32:14 -0800
X-CSE-ConnectionGUID: ljk4WYoTT3GGfw7J+jueGA==
X-CSE-MsgGUID: ynWa/U5kTvC6ynXScyc0hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="111930143"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 03:32:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 03:32:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 03:32:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 03:32:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxdvWZB7i2nJaLEtr5cfx3VBXz+ObGEysQ97V4EJxOub2bcNRsJNKJIlMS4b3MXS+26pAkkzXN45DpxkkPUmiMDwG4P7JHAPk4EoiSZH/2qsNl1S6tPBgINTSQiBDvQ7vMzCt8RLcb1b1DbuUmJyh4ZHJoQPJXHoSKWYFnGwuf0S1drBeDOrj6slm/0jaWshfwPB1wC6j+71438rObKPSYw5bf2BjyRtoBK9WtDgfS5vqmWjmeUPt0trtpbQLlE5SEQfC5B6kJHYT86mTL/ONR/cHlYAqSuyIgzvNWKB/xIHKoHGWRGX6KcODqFxVzYpsQ/AMmSqzkFH76hZkhP5PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oTn/nrYnv6kxtf381Nn4x2LwLTKSaf1W/djz7MoE6k=;
 b=EZkIuHHrd3CJFK/BKNxSlaMRy1aIWPgrIxpHSDeZ5XDXW2lm0kgD0g1pb+17/W71/UwxO1zd2u3I/9wuTbLuTTIxPrgLhVpvh9xSMdeM2k8JiVeVrWMqV7jYwiHCup9Vj4r4snBJJCX9kzp3hEbYRBK4KJZXkRE9ophf6xlmIhgCnyIyvAlwb5l7JFpkZD4U11GUoEDMr8x5DrpfuE6BvX/TFHULc6koWnp8pjr0SLTLZL/jz4l2iDEbnQB68xLw/8GizBL4Gyl/S683oswr5NEqJr7QnnCoCEXDhCbDftLLRIv/z3LScuFBm+XwpysSUUIsLaX1dm7nN7GMa9WH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 11:31:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 11:31:54 +0000
Date: Mon, 10 Feb 2025 12:31:51 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Cleaning_up?=
 =?utf-8?Q?_code_relate?= =?utf-8?Q?d?= to VRAM regions and its
 initialization - part 1 (rev3)
Message-ID: <20250210113151.tc5pryyky66kfbal@intel.com>
References: <20250210081511.906452-1-piotr.piorkowski@intel.com>
 <173918613247.246715.15160991922341005679@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173918613247.246715.15160991922341005679@b555e5b46a47>
X-ClientProxiedBy: VI1PR0102CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1eb166-0ef0-413c-77a9-08dd49c684e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDN1U0pVSXdvUVQ0eVhoUGZKMERZSzN4bnVpeDdsbEpLV1RVdWV4aUliUHh1?=
 =?utf-8?B?Zm9NN0YvbXFjWGJZN0szMEdPTGt5dVhST09kTGtJOGRJSGMvNWtXbVVhNnpQ?=
 =?utf-8?B?SVdrMTRNTlFQUGMxVFU5TEk3cXhNZTRpSld3dDhvcnhQSXlBeGJ3eWlTbTll?=
 =?utf-8?B?VGFlWU9xVDhndE1UeXlRVVV2aWxpWUR0eXl3VHFaUGJva1lHNlc4L2pvS1F6?=
 =?utf-8?B?N3pkU0IrOWpCMmxBbVhleWxpbTFsT3BLd1dEbTBhRjhCbUdMckhaY2lkdEZM?=
 =?utf-8?B?OHZMd1IxRDdlQytMbFFGS1J3aHpRaXQ5ZGRGTUpNelFrQjVZU29meGVSL0lV?=
 =?utf-8?B?b05aRUJtWmhTYmhrSTV4eHZLdHhPSUVINEVNakhYRlF0L0tocEp4TzcxdE1P?=
 =?utf-8?B?NDA0NGdrcDVCV2NoZUNsd1FFWnRoVytXVS9zbDVITkNRbk9GL0VVR245RERF?=
 =?utf-8?B?VWlpNnlBY2lGdWRnK1lKclR3b3hCbit2NUFFQmlacXN3T1pLcitOSzFYc2VE?=
 =?utf-8?B?azhsVXJpSVB0YkxIUkk3SDJUUTZuSm5zY1R1OFpTdC9wbHQ5cS9aZ3hqVlIz?=
 =?utf-8?B?UFBqRkVQTkxGazVSRHM3TWdOWHBiclJjM3NUcTVEWjJwTnpjSmNIaDFORGwz?=
 =?utf-8?B?N2FjVWt4OU9BRWk3UzRiMzVjYXJnak55N3dzU1lWRWlyTjJsY3BTdzJtV1Fk?=
 =?utf-8?B?UlV0MnVuNTd6TG5HcGJIZ2RYL25EcnhlR1dkUyt2dGIxcnhYYmtDbDN2Mklv?=
 =?utf-8?B?Wlo5K0QrRHpEdlJUZ2pmOEhPK2NLMWc0TW00VWV4d2pteXBDOElzNEZPSzAv?=
 =?utf-8?B?QisvVFNNclBxdnoyTDZUa0Z4OVlna1R6NE1Db2x6RTN3V2xiVzdjSlQ2Qmwx?=
 =?utf-8?B?SThLeG5BYnhmdXFyak1STUd6K3RMOWpNYmx5em9kU0djaHZPQUJHbDVPTTY1?=
 =?utf-8?B?UzZSR2FrbGNHZk43UzMxTkhTVzk2TjRhMFVhL29WbUg2VnpGUzhsMCt4UUF3?=
 =?utf-8?B?MkZLUCtIZXJXSWQyLzZ4aVdvdDBINk8wWDFjbER3dC9FTjBIUjBJaFZrcUFt?=
 =?utf-8?B?VnpqYWN4bEpWaUNKVGJLc1lwYkVMalpnQTdZNlIrbGVIdzNpS1VGdUhBRmdZ?=
 =?utf-8?B?Z3FXRkExbktKSGg5SXQzVEk1MUdqbkVjSUtzMGwzTTlidWtoK0Eyb2pWZGto?=
 =?utf-8?B?N3g3RzlVT0RtU2NVcDdaaUVyMWtENExKcGUyYm1DUzVDRjZoSGtuZ05yVVRv?=
 =?utf-8?B?WFhWV0lkMTRlSW0zZklKZHB1bnBvS2V2WVkyZmZ2Zm52eWdGODFTWFZ5MzE1?=
 =?utf-8?B?SEdSMS9HcTk2V1FHUVZhWjVuUFB2bFFkNHAvN2lxcHlPNm84bjYvQnNUL3FG?=
 =?utf-8?B?SDdQdm1DNlhFeUdoWVA4Y2U1RitMWDExdlNyN3p4SG9pNnRlTW1YbnlIYTdj?=
 =?utf-8?B?NnMzRkxNdnVncVVCbDJDbS9ZcXRzZ28zQXB0TWtjS0g5OTBSTXBnUktiMW1y?=
 =?utf-8?B?aFlpRktrVjgwWVB0alVtMTN6RjJyaC8wMGQyU2JRMG5mcHJaWXZ2WU9TWDkr?=
 =?utf-8?B?UkFhcG1zVTNJc2N1VHBRNnFRQVY2NWg5R1k1NFJFbzNNeDBoQ1Z6amhBTlh2?=
 =?utf-8?B?UUZTQ0s4aTZiMjQ3akk3ZjV2WEttZDNVa3FtRWZkZ2xCa0tqTWN3RkZ5ZlRu?=
 =?utf-8?B?Y2o5N1F0cko5RHlhT3E5cG1oRjVMTGM1YlhKN3F2VERWYjN6U2g3STdNd1R1?=
 =?utf-8?Q?RmKuLrfxPztwkPvZswoSWXIBfDm/gFeyMDd9gOO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cytaakRsQTIwMlhXc3U5MWRtcjN1WHdWcXF6RGVNKzZCekJtdTZwaUc3Q0Ns?=
 =?utf-8?B?dHVCR3RzQkpCWkNwMmVYRkxuUU9iMDJlbnVJRHdwcmxXVkNJL3N2TklFVWhC?=
 =?utf-8?B?dThxY2ZDWDVwa25LYVBmdDN5ZTljWXVyM05ac3NDaGZMY1daTUVrdGpaT3Yz?=
 =?utf-8?B?YVAyU0ZrdUJtVXpIbG92Q2hzaDB5aUk1ZyszbHhha2JlK3c0WlFwNEZybUMy?=
 =?utf-8?B?amhaR2NiNGUvRWdrT3o4eXg3YWd4ZlRYaHMzT3ZEUDA4RnhHVXhHOW13U0Jq?=
 =?utf-8?B?YThsTnBtMHpRVW1MWkdkR1U0VS9DQUdOZG42Q0xpWjlLVGpyMUdpZXdKOVBS?=
 =?utf-8?B?SEFyc1NTU0laeC9CbjJ4b2RPMzkrVXNMZjZEcjRxUjM2d053NTRTZkJpMWZp?=
 =?utf-8?B?aVFWcmwrR1UrY3pKRWUrQ3lKdjZDRnZTODlGeDQycEpHc2J3UEZJRFdWbUti?=
 =?utf-8?B?NmZJNzBxT1BUb25aZEZFZUZocElqa01OYTR5eTZNaHJOSy9BSFJCYVMwWXhB?=
 =?utf-8?B?ZzhlaFlnbHc2aFVxa0lCZkZNbTRMK0wwdnF2cks0MjdNaFlBZnNKZGJXaUhE?=
 =?utf-8?B?bUtKcWVVaWowTXB6c3dqbEwvRWFuQVFYRGtJQXpac2J1WVhoR1hsVXhKbURa?=
 =?utf-8?B?U1NKZURuVGlaR1k1eGl5RlNSNjJjZEdEYmFGMitaN3NIKzQ4bEkrZUpTeEZl?=
 =?utf-8?B?a1c0NWFyeGtHck5TQjh2SUI5aXpVNkdrSFpSYytCeDJjT0xybHBmb1Evc3Q0?=
 =?utf-8?B?blNaRHU0VU5pV0FHSE1NdWNPbUtDeTU2blVxL2RFZGtZVjJySHZGNmlKbzdl?=
 =?utf-8?B?cXFmeVA0Y05mVWZOVWM5RkIxckNVUFFRakVFcG84S2RjaEI3bXUwdkJUdmhz?=
 =?utf-8?B?TDN1dDZJeU5MOFVPOHc5eGtEL2Q2RDEyY0Q3aktZTWJmeWkrWU5hSnFETnE4?=
 =?utf-8?B?YTA2cDVzVWYrZ0tFODEwV3AxY293NmV0Ty9HZU43L1M2aGhtRzFWemxyUWFL?=
 =?utf-8?B?WDFYNFNMVVFWbWVKOFJVVnFHajZaa0RZVE1aZUpkOVNhdG93TFVpU2plODlq?=
 =?utf-8?B?a3VSS09vcmFlZVI0aWNaM0RVREJoNU9VekNxWWJmT012dWM5a0NwWWxxNEZO?=
 =?utf-8?B?UUxhMzRBTEpha3NtTWdUcVJQenp1aVRtTzh3MldxL09WbEhnMy9EWmpOeDU4?=
 =?utf-8?B?cUk3bFgwYmRZYWtJMmtzMHQ2YngvV2VqS0pYSTN0OWxqak5pR3pGZVZzRDNZ?=
 =?utf-8?B?aEtzQUJFZXg0VWtndWdMbitEQS9nM0F5aG41aFdZL29qa0ZtRzkva0Z0RlVk?=
 =?utf-8?B?d1hHaW1SbEN6aWtqelo5cDdUamp5VlExbTVIZ0NoK08zOEZNcTlBdlovN3Na?=
 =?utf-8?B?OUJhV0FoVjhjWjlrdmpiSENxdVdCdkJmWUVuaTdweWo0Y0F3QThnQmV0NUxL?=
 =?utf-8?B?eklPcjdyc2hObENLaDA2ZWNMZEFaV1VjYllsR3RZeFhVUzlkNGsweTZTV0NT?=
 =?utf-8?B?NG50TWJaZGUxc1Q3OStCUEtyZ0FpeTI2Nk5ybERDN09MWnFiLzNjU2lmSENH?=
 =?utf-8?B?SGZydHNJaHRWZU5Scm8yY0NKUm1lVnJPbEUySmF1bTl1MXBiMnVXdXEyejN4?=
 =?utf-8?B?bWZRZGpka0hxSElldlN0WWFGSHFwSlJlLzM3NHArUzEyWExkcE5TVDY0Szdv?=
 =?utf-8?B?MUdEN2k1ajYzTFA3SDkwbzdpRitPZ05IZFhrM3JmcnNUL2hwd1IzRTFIdzZi?=
 =?utf-8?B?RTJodXBnR2RZMlVBdmNQa0gxUnkyUlo2LzJSSmNibG83b3V2Q2ZBNFZtMUtZ?=
 =?utf-8?B?QnFHaDVJQUNyWUlPNWRMTmpNYXQ4dFBlVHRrb2x5dlFDd0ViN1FJbWN6ZVdl?=
 =?utf-8?B?V01KbkcrYy9tQTc3dURuYm5Ka1pIdmtRSGlVU2VnS0hsVDBhaVAvSHZFYjZi?=
 =?utf-8?B?cE1qYW5hbmhLRUh3OERYa2RxV3A2b2xWQWRaN0UrUzNCdThNd1pUcDhwRXZn?=
 =?utf-8?B?NHo0ejl6QjNxK0tKSWdiMUJjcG5HUkRKNnUyZzZTYTA2TmRjbG9mM3RKZHQr?=
 =?utf-8?B?UFZmU3RRSUR2U3pUK3NoNVFIa2hKdlpxYXBBWm5hTTVRWXdLS1ZhSUxjNDVP?=
 =?utf-8?B?QjdIOEZoSnRUMmRTRERVZ0FHWXB0RHhVTkphdlNPM1V3YTJJMnJRK2RNNSs1?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1eb166-0ef0-413c-77a9-08dd49c684e2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 11:31:54.0264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZR0Rt1PouHJpEflDK5b0Qc7JEVLIk7zBxGQAgbxP6F288OUsNMkkrTCorXYZRAcPFhzJX2dzLRJg6V6pqp2cP4Hpg6uTDfmjZcnoc/c3NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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

Patchwork <patchwork@emeril.freedesktop.org> wrote on pon [2025-lut-10 11:15:32 +0000]:
> == Series Details ==
> 
> Series: Cleaning up code related to VRAM regions and its initialization - part 1 (rev3)
> URL   : https://patchwork.freedesktop.org/series/144172/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full -> xe-pw-144172v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-144172v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-144172v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-144172v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_vm@munmap-style-unbind-one-partial:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_vm@munmap-style-unbind-one-partial.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@xe_vm@munmap-style-unbind-one-partial.html

No logs to deduce something, but for the v2 version which in practice had the same code
(only change in doc) this problem did not occur so I assume it is a random thing.

> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [DMESG-WARN][3] ([Intel XE#1033]) -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

I did not notice any warn in the code, mistake in the report ?

So it seems to me that my changes do not introduce any regression.
Thanks,
Piotr
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe_full and xe-pw-144172v3_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_properties@crtc-properties-legacy@pipe-b-hdmi-a-6:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.27] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-144172v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
>     - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#4173]) +2 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>     - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#787]) +29 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1178]) +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#309]) +6 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2291]) +5 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#310]) +4 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@2x-flip-vs-dpms.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#301]) +4 other tests fail
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#3321])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][22] ([Intel XE#1033]) +2 other tests dmesg-warn
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-plain-flip:
>     - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2316]) +6 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_flip@2x-plain-flip.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#656]) +6 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1033]) +4 other tests dmesg-warn
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#651])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#656])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-rte:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#653])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-rte.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#870])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1439] / [Intel XE#836])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#836])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#1489])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#455])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3:
>     - shard-bmg:          NOTRUN -> [DMESG-WARN][39] ([Intel XE#4172]) +2 other tests dmesg-warn
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_vblank@query-forked-hang@pipe-d-hdmi-a-3.html
> 
>   * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2905]) +1 other test skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
> 
>   * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
>     - shard-bmg:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#4172])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_live_ktest@xe_mocs:
>     - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#1192]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@xe_live_ktest@xe_mocs.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html
> 
>   * igt@xe_pm@s3-vm-bind-prefetch:
>     - shard-dg2-set2:     [PASS][45] -> [DMESG-WARN][46] ([Intel XE#1033] / [Intel XE#569])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-dg2-set2:     NOTRUN -> [ABORT][47] ([Intel XE#4268])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition:
>     - shard-adlp:         [FAIL][48] ([Intel XE#3908]) -> [PASS][49] +3 other tests pass
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-lnl:          [FAIL][50] ([Intel XE#1454]) -> [PASS][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][52] ([Intel XE#1033]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][54] ([Intel XE#2191]) -> [PASS][55] +2 other tests pass
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][56] ([Intel XE#4173]) -> [PASS][57] +1 other test pass
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][58] ([Intel XE#1033]) -> [PASS][59] +15 other tests pass
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>     - shard-bmg:          [SKIP][60] ([Intel XE#2291]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>     - shard-bmg:          [DMESG-WARN][62] ([Intel XE#877]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>     - shard-dg2-set2:     [SKIP][64] ([Intel XE#309]) -> [PASS][65]
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][66] ([Intel XE#2049]) -> [PASS][67] +3 other tests pass
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-435/igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-dpms-vs-vblank-race:
>     - shard-dg2-set2:     [SKIP][68] ([Intel XE#310]) -> [PASS][69] +5 other tests pass
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
>     - shard-dg2-set2:     [FAIL][70] ([Intel XE#301]) -> [PASS][71] +3 other tests pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
>     - shard-bmg:          [FAIL][72] ([Intel XE#3321]) -> [PASS][73]
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-flip-vs-panning:
>     - shard-bmg:          [SKIP][74] ([Intel XE#2316]) -> [PASS][75] +5 other tests pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
>     - shard-dg2-set2:     [FAIL][76] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][77] +1 other test pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
>     - shard-lnl:          [FAIL][78] ([Intel XE#886]) -> [PASS][79]
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][80] ([Intel XE#656]) -> [PASS][81] +9 other tests pass
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-dg2-set2:     [SKIP][82] -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256:
>     - shard-bmg:          [INCOMPLETE][84] ([Intel XE#3966]) -> [PASS][85] +1 other test pass
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-2/igt@kms_plane_cursor@overlay@pipe-b-hdmi-a-3-size-256.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-dg2-set2:     [SKIP][86] ([Intel XE#836]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [SKIP][88] ([Intel XE#1435]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-lnl:          [FAIL][90] ([Intel XE#899]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch:
>     - shard-bmg:          [DMESG-WARN][92] ([Intel XE#4172]) -> [PASS][93] +1 other test pass
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][94] ([Intel XE#787]) -> [SKIP][95] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][96] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][97] ([Intel XE#787]) +9 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg2-set2:     [FAIL][98] ([Intel XE#1178]) -> [SKIP][99] ([Intel XE#455])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_content_protection@atomic.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [FAIL][100] ([Intel XE#1178]) -> [SKIP][101] ([Intel XE#2341])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_content_protection@legacy.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_content_protection@legacy.html
>     - shard-dg2-set2:     [SKIP][102] ([Intel XE#455]) -> [FAIL][103] ([Intel XE#1178]) +1 other test fail
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_content_protection@legacy.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [DMESG-WARN][104] ([Intel XE#1033]) -> [SKIP][105] ([Intel XE#309])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>     - shard-dg2-set2:     [SKIP][106] ([Intel XE#309]) -> [DMESG-WARN][107] ([Intel XE#1033]) +1 other test dmesg-warn
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-dg2-set2:     [SKIP][108] ([Intel XE#310]) -> [FAIL][109] ([Intel XE#301])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [DMESG-WARN][110] ([Intel XE#1033]) -> [SKIP][111] ([Intel XE#310])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#310]) -> [DMESG-WARN][113] ([Intel XE#1033])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible:
>     - shard-bmg:          [DMESG-FAIL][114] ([Intel XE#4172]) -> [DMESG-WARN][115] ([Intel XE#4172])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check-interruptible.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_flip@wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
>     - shard-dg2-set2:     [SKIP][116] ([Intel XE#656]) -> [SKIP][117] ([Intel XE#651]) +16 other tests skip
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][118] ([Intel XE#2312]) -> [SKIP][119] ([Intel XE#4141]) +1 other test skip
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [DMESG-WARN][120] ([Intel XE#1033]) -> [SKIP][121] ([Intel XE#656])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][122] ([Intel XE#4141]) -> [SKIP][123] ([Intel XE#2312]) +7 other tests skip
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][124] ([Intel XE#2312]) -> [SKIP][125] ([Intel XE#2311]) +5 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][126] ([Intel XE#2311]) -> [SKIP][127] ([Intel XE#2312]) +14 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#651]) -> [SKIP][129] ([Intel XE#656]) +14 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>     - shard-bmg:          [SKIP][130] ([Intel XE#2313]) -> [SKIP][131] ([Intel XE#2312]) +15 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][132] ([Intel XE#2312]) -> [SKIP][133] ([Intel XE#2313]) +7 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][134] ([Intel XE#653]) -> [SKIP][135] ([Intel XE#656]) +15 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][136] ([Intel XE#656]) -> [SKIP][137] ([Intel XE#653]) +16 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][138] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][139] ([Intel XE#3544])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@xe_pm@s4-basic:
>     - shard-dg2-set2:     [ABORT][140] ([Intel XE#1033]) -> [ABORT][141] ([Intel XE#4268])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-dg2-464/igt@xe_pm@s4-basic.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-dg2-466/igt@xe_pm@s4-basic.html
>     - shard-bmg:          [ABORT][142] ([Intel XE#4172]) -> [ABORT][143] ([Intel XE#4172] / [Intel XE#4268])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe/shard-bmg-4/igt@xe_pm@s4-basic.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/shard-bmg-6/igt@xe_pm@s4-basic.html
> 
>   
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1454]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1454
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
>   [Intel XE#3966]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3966
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
>   [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
>   [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe -> xe-pw-144172v3
> 
>   IGT_8227: 8227
>   xe-2625-24a5696cb262c7829956cc708c7fc715fefc92fe: 24a5696cb262c7829956cc708c7fc715fefc92fe
>   xe-pw-144172v3: 144172v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144172v3/index.html

-- 
