Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A98C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 15:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1C110E72E;
	Wed, 24 Jul 2024 15:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lou1HOXT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D7210E72E
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jul 2024 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721835825; x=1753371825;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jem6J0ziHo//JZOTUy87btscl9ktFchfUhC2sm+aKg8=;
 b=lou1HOXTn4uetObvipC10fVo7BEXU1IFH0rpxlj8TQOFkYpa8Iw8ZmJs
 TLFU/TsIDh/B4XOYkFaMtJoHc9hbUFQ4hkJJkrg5kh7cME0YTQ/fv7rCY
 ZQovlEPD6kvOF/9dQYduVtjIGycNSGuwNUv6GLuWrXOnmdtD92/mau9OY
 sTH4LwRhVjf+w30BQ+0H599qatifSzi56NqN8NGbvIrWdzjo1b6mV8KeN
 fJeVprtf3CMfhzzCFitpTS6/0pRTZbKZpn5ANuRIjuNLvJc7/XvI2toMX
 Y1L0KDAP9wDbHZ2Xy7MGybUGEMqe2yy787nLBcSPjojmnJtWfNgeM/gwN g==;
X-CSE-ConnectionGUID: RgB2YTShQL6iytfRRJbINA==
X-CSE-MsgGUID: DKsXwX/eQfKn2yFWI6+x9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30126688"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="30126688"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2024 08:43:44 -0700
X-CSE-ConnectionGUID: ifqoNO17QBOaUAK7/Qnv6Q==
X-CSE-MsgGUID: WESjaMMKQuGk4t/UEDdiEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; d="scan'208";a="83231259"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jul 2024 08:43:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 24 Jul 2024 08:43:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 24 Jul 2024 08:43:44 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 24 Jul 2024 08:43:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6wEDjB4FBBLq9p+kdiJv92q0wtwbyKArAPKUPNCLpVO1wxdBjlkMrMSO7xBnrbUzX42eYI7Fc2sSGMP1AAD65c8lqNVV2PW6c8vPS7pWnnJq/yDMnzn3v6322F/DiMqWpRz+HXc8MEVrvsFRFud1+bleNUnuAt/netNTKykwgJyeUi1wOaEEfKZBetlYtPERH/0iLrWynbl9vShBOzjpmeNnJ0moIxkBl5XgdorDwf0d37qO1JkeHKkB059djd9UnOmfphB+5dopSgM3ckz9AH4LyuTrfeJGa0W5A4asTREB+AVPo0rHILbTWDgaQOQNzxjOGX+ze+bGQHpC3VSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjleVbpRM5AkX+V2u/2BlLESSDEOO344ttxarRzb05M=;
 b=caLfRXmXqixo/X7VqiSzn02moFqQd2+J2ep7Wg59GVBPN8YicQSas+A6wQS/uuGQnaRO/fPY+jpKjmiy+JIX1Xz0APCvzixwttPw3w2tG+eGcUbM4UVCjVUT2ET4j3NW9ptwrP7rdr2AIGY1WXBSpfl94+hD/mqn+epkyCcK7+UvBVEkZuKeU+6sAhWExEfE6eywlBIqHPYXsEOXTWsG6cDI+W10/50u1qbOe84Tss9bw5+iyp6tE5002K44mnVedDkojBjO3J6Dd7WrkGIunncjKKd/H1BG+aYcpQuqf5KljQwrWN/UGXORjluxl7WIna8zY5WbE6Iqoo0f8iq3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.30; Wed, 24 Jul 2024 15:43:40 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.7762.027; Wed, 24 Jul 2024
 15:43:40 +0000
Message-ID: <5f501a69-fe4f-4841-89eb-3d55b5f92b62@intel.com>
Date: Wed, 24 Jul 2024 21:13:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix possible UAF in guc_exec_queue_process_msg
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <dan.carpenter@linaro.org>
References: <20240723191903.1753729-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240723191903.1753729-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f126238-de3b-4992-b706-08dcabf763c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk1nekZ0YVJQZVZOSTdqN1NoMmNKZnk4bFBuL0VwMkJ1dzhzakQ5cTRnS0Ro?=
 =?utf-8?B?RWZmS2RrTUozTlNTbmloSk9MSnpROEdWbFRaWUhPS3FOS3dZTGJ1SFdHRmph?=
 =?utf-8?B?RVZyUUx3Slg1VGg1QUVLUHU0d1ptSUd1N0xMNi9FUWk4M00rRlk5UWN5QXd6?=
 =?utf-8?B?YURVcUpBUnVRVTUrRVkwQnI5WnFqdFphYWFZYys3M2xOU2gzaDRLVXk5YnNx?=
 =?utf-8?B?T0ZXZUJxcFRaclpXNHpSV2JvR2FkL0NSRUlhL2p4ODBkSEtJbi9jaWROVTR2?=
 =?utf-8?B?MXZLZU9ZU3NuRWxRbU5UNkNwb29GL2toeHNpcTMrTk9PZmk3ODFLNHNqTVIz?=
 =?utf-8?B?alBpQmxva29KYUFWVXJraFhZSWtIQTVNUng3L21nbjBvcWU4RHZaOVNBNjJy?=
 =?utf-8?B?OFJKZFdMZWJsNXkzdkF4T1RmSTBIY0NJQkU5S202NlloK2NnVmhTWTNtZ3pD?=
 =?utf-8?B?MmR1cldOQ2ViNHhnVnJkUW1rQkt5QzdCQ3plbEI0NkxpM3VJRFZ1NEtmRS8y?=
 =?utf-8?B?OUMrcW5NclBYUCtXd0VHWmVTZzJzT1d3aUhmbENFTzc1cUxlanNuZjduR1VD?=
 =?utf-8?B?eFlNRm9pRG5FV1dDMGRRd2Z4SjJ3RVVGN0FvdEh0Y2FOTlk1NkkyT3BRWHhJ?=
 =?utf-8?B?Ty8yZXRVckdMaE5tbE02OWhxUlluOW5NSW4rR3V6UTVJcENHSm9uRnFBWWRQ?=
 =?utf-8?B?NC90ZVFoQ2cwMmUwQ1E0eVhZUkhIZ1IxZ3IyZCt5Y1JoLzdmeVNBU1czNmIy?=
 =?utf-8?B?VXBLeXpNbVRoUEM1U1RVZ2hSNnNsbkpxcjg0Q2wyQnZNSUNTYTRPM1hmVi9i?=
 =?utf-8?B?SUZoaEtsZ0UxbXBnditnYmdkdFBGUWs1ODJ1ODh0LzhNSERSK2tEKzBWN0Zq?=
 =?utf-8?B?amc5ZjYvT082Y1hnYnJCZVlqclptU3huVjdiTU51bENSRDVBSWhnNTh5ZSt1?=
 =?utf-8?B?dkFYNkR4R2RlYnhMV3ZPeWhKMTlQZlpaRzlVOG84N0tFOWFRcEtKTG51SStB?=
 =?utf-8?B?SnVqakY0R1pNMko0dGZ4TVF2TXh2NmZ5cVQzd0FVckpJMW0zditLYjdwc2tQ?=
 =?utf-8?B?S092a2xVcVI0RkttVHBZNHNneFdrREtyNWVPQ3hyZFc2MXZtZWpRWE83bndR?=
 =?utf-8?B?Q2o1VFE3djFkSFM5TVAvUFM5VlQrUkhnQmhwYjJoZEZwZTdGNUJMQXBvZVox?=
 =?utf-8?B?OU9hUHdtL3VBUWxIYVVqNUtJY21scGtuL0hzbGZXVFkveEMwbW1Ub0FJYkhs?=
 =?utf-8?B?T2NmdGxlOW1mQkdMWE1hMDdmWXZVdVhJTE9LV3JiKzdkcVhwcFZZMzJld3FI?=
 =?utf-8?B?Y0x5bXlTV3hSNExtV0tXL2pNT0NmQzRQYkx2clNvTGNZNW5KVnNQdzNPZUJE?=
 =?utf-8?B?RHRyakZVVzgraWJtdEdvYXhrS05iZndrSUdNZDBEd1ZwcWFJVzVUczA3VzJ1?=
 =?utf-8?B?SDNhYmNiR2R1dVc4SkRHeVFrODNUWmtmYmRyUFhFK25LQWpNQXNGQXdYN1I5?=
 =?utf-8?B?cGVzNkJ3c29vS0YwRVlXNlRqd0JDTC9mUEFhOGJCWitqV3dRTGRGT3NUMk1K?=
 =?utf-8?B?Nmpxd3JzK3hMZjNYeUt0bFYzT2hDYUhwR1RieGczYXZGTVEzdDdVZU05Tmdy?=
 =?utf-8?B?N1lxWWpCeURYZ0RrNTlKa0lZSmtaWmpRK2R6QlJSMEU0aGJ4cjBWTmRrRnlt?=
 =?utf-8?B?VGs2Ynl2RkkwODk3bGFvampUcS96bHU1YUkvcERxa00ycW9MN2JKRStYNmlT?=
 =?utf-8?Q?pXjNWSuJjStbzNh2jU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEVlSmZJQlczR1k5TEZZMG9PNnJXMlVWR2JCY0dZbTNWZjMxQU90QTNQSkdM?=
 =?utf-8?B?K1BYZFE4MXhscDIxN1lGdEUwdkJzVTFXWDE1Vm81bTRVZnNYNkVHY3JyR3M5?=
 =?utf-8?B?RmhCaExXUWw0dnhTVGtEY2JTQUpSdTRYbmlRRUpLa251cW5YNGJLbmE1VzhV?=
 =?utf-8?B?UjF4d01palc1UDFXSDdIRWdwS1BLYXhFc0Y1c2Z1V2xIaHVlWDFHR3VHOFlo?=
 =?utf-8?B?SU80ajNjdEV1Q2FOdUNid2FWTUMwZ2pLeXU2dVJ6SXdmQkd5WnhsRG9LNG45?=
 =?utf-8?B?Y0IrYTVaMTF6SUc3c2tIK2MrMG5XZlVId0oxK0xhRXF5eS9ONllGSENOc05C?=
 =?utf-8?B?Q21jTlpWNDNXbWVDaDVvUkM2emwwTE13UEhIY0I3eEhJMHJDcWs1YWhaMy9S?=
 =?utf-8?B?N2dxcWRLSEFEZzRFdFJTa1JkUHl6d2c4RzlYdHg1WlgvZS8xQW50RkwyNEdp?=
 =?utf-8?B?SFhRcnQxdE56aXM2dU5sQkJmcXIwNXFIdURDbGlqMmxKUDl5Qk9vWE9SUWJG?=
 =?utf-8?B?MDV4MloyM1A1Z3FSakxuKzU3VGR4U2R2aWZvMWM3L2U5ME8wYWZlbWMyOXBj?=
 =?utf-8?B?dVY3MzZjMzFoRVZqLzZIYi9obEtnUnAyaVBCVHI2UVZPVERBZ0F6WlRYZGQy?=
 =?utf-8?B?THEwUUc0STR1TUtpMG1NWjhOZzhNM21CZG1TZ2p1ZFB3UmZwbDMrR1ZaMWVu?=
 =?utf-8?B?M1F4UUUrUFRnM2tIb1NVKytBdkFjT2tBd21rdjRhQWU0RXlTU2xBUHFRa2ZM?=
 =?utf-8?B?eFp1enRPUXNpNmgxdVJDaTQwSjI3L2NrUEorbjIzOXZYR0JDN3BLTkVUTnBF?=
 =?utf-8?B?YUtPdEJiOVFvY3NUejRiZjgveFREcmhqaWcrRXJPNkl2WDJ0UXBlanloc3Zt?=
 =?utf-8?B?VVd3bHFhUDI2aXhyZ1FBbm4zQldueWx4OTlTcWxzMWFxejM0a3ZadUQrZ1hS?=
 =?utf-8?B?SWRJVXRYcWUrMDFHZVpNUnZqVEVrbmpQQ09CYUhaS0ZkbHNPSk5pZzZRaDJn?=
 =?utf-8?B?MWdOS1M0TW9xNzZqWFBnNVo3SnowVGJ2b0E1VzJZdWhNUTdhc0NEUHhjeXMv?=
 =?utf-8?B?Ylkyb2ZMOW8wazVtdTdnVWZOaGtaelIvRUZoNEFWTFRHTzBDVzZmMVBLbmUy?=
 =?utf-8?B?RHBOcDNmOEZDUjZJZ1ZXbjA0M3hJMlBOcnJVbnVDVmJIRXhpckdRejRuY3Zv?=
 =?utf-8?B?ZmlhbVhYanZTNHJoVUhlWCtHbkN6aWpWZjUycnh5a1paUVorM1lmMnBISE53?=
 =?utf-8?B?Mjdlc21GT3h6K3luUE9UVy9rRUFnZmNrQ29sNWRVRXhUR3RMdCs0MUYyREVj?=
 =?utf-8?B?VDIvQmphSkJ2dEdmaWRZNzlmVHhWNk9wWU5pKzNJMzI5RTBZRWRYMENUOXJN?=
 =?utf-8?B?VnRUTVF5Nlc3VGpnNTBTeGI5eDdWUkI1KzYzMHc4Qzc1MjRzZnd0TXUwOVJz?=
 =?utf-8?B?TmNqeWZFMFE5clR6WWFsb2N3L2FpcjIrcFF0NkhHbXBVZ3FBYldCNHpoQ1hC?=
 =?utf-8?B?MkFpMllOL2o1TkxHZ0xHeGFVYzBaM0MvMjlZazQ4d2R4MWNqbDdESXZKQUJi?=
 =?utf-8?B?R1VUYXJqTjhwdUFTSTdhZStqS0NKTDBPaXpMdWFRZGNPdU4rVlBqMTVCTEJI?=
 =?utf-8?B?TWNYMU9GdFo3TTBBSXB0dmNnNlE3eVRTNytraFdWdUlEOEFpVnZCN0UrV3Zy?=
 =?utf-8?B?elJTVTFKc0d1N3h4U0o1bnI2T1RjejNCaXByeTdsa0FrS2xJbUdrYkNmWDU3?=
 =?utf-8?B?bFJMZ1BvMEVIVEN6UVpPQ2dYN0hLTWowR1dzTEw2cDdoa0dQUGVzR1NzaFdD?=
 =?utf-8?B?eDBzbVpJdWNBZVRha3RhaUpMdnFHbEJuMkMvbHAra3MwNXY2N3RpZmRWbjNY?=
 =?utf-8?B?QVFVTjJRaG1hRnJ1UEFEVGtudTFscmJvZmhibVY1Q055RU1SZlRiQ0YyUUVR?=
 =?utf-8?B?ZU5hbkl2OGpKWFlKRURmY2piYytjdmRjQWtpV3k2SVNMNmxVODByYXRuTzd2?=
 =?utf-8?B?T0xON1V6N0VxRVoyMVllWU8wTzZQUkdBYksveG5qV1NQMGNGY2phZCt1WkVH?=
 =?utf-8?B?bytNRUlyRFJ1c3ZOYnhCaEFYeHAvT0gwKzU5a0JxYVVnRmt3Ky85N1NQdmZj?=
 =?utf-8?B?UUNJckJJcXhlUVBvaEFvakdLVWFYeTVzOVhPNzF3WTdsSkJIS3prQmNrMTdK?=
 =?utf-8?Q?fsDlTV8M6+JfLdoAmVQfba8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f126238-de3b-4992-b706-08dcabf763c2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 15:43:40.1832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVHZnIsvBJtOGQe9OCcxAKp595fDeVoNpD/yvSdGJqGQ2JhO4oru6CTovylrR+L8mtBNZuECGCUpuMjL6z10rbJZoxq5imMdaSeYAwjRjpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
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



On 24-07-2024 00:49, Matthew Brost wrote:
> Store xe_device ahead of processing message as message can be free'd in
> some cases.
> 
> v2:
>   - Including missing local changes
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/
> Fixes: d930c19fdff3 ("drm/xe: Build PM into GuC CT layer")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index da2ead86b9ae..b8f938539a90 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1395,6 +1395,8 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>   
>   static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>   {
> +	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(msg->private_data));
> +
>   	trace_xe_sched_msg_recv(msg);
>   
>   	switch (msg->opcode) {
> @@ -1414,7 +1416,7 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>   		XE_WARN_ON("Unknown message type");
>   	}
>   
> -	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
> +	xe_pm_runtime_put(xe);

Patch LGTM.
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   }
>   
>   static const struct drm_sched_backend_ops drm_sched_ops = {
