Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C32CA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99AF910E175;
	Wed, 27 Aug 2025 19:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fi3xt/hf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D9F10E175
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756322929; x=1787858929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cGgVKzhFS8cu+mf2wiLpBbQYUVCTAc5RYzMSsjK3V6o=;
 b=Fi3xt/hfmkjlTFGYuJI39Q4hNAQ+hsJBRQUoeJL+ePGB8MBG4esrUJSA
 /XZif9GXB/khg23yAz0AT51p+8pGffeAqgD/7zM2DNjDXcctaODHcphX2
 1PGsi+79akJl5U79ITlPgXYPt2omJlGSf01S88TiEoKJ64FKHtB5KR+Jm
 CAxD+D8nls9bJi5hhcAmvMc6bz91jiFPe7UD9HD4qW1voYgQru5aNGADM
 OCMzxpoZjDy8/7fWZtMAPsvd0vkmUUcfoBhdpermvQYrgIQAG2I2MnfoA
 A+B7yQdHoq5Ctv4feeglyk0JY1cihE1md0LxSDuxDOkLTokwqdpbmm0zx w==;
X-CSE-ConnectionGUID: JEVYze4YSdKeAJufHFwbOQ==
X-CSE-MsgGUID: fZWCtrcsT1GLSIKzYF6nGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58526739"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58526739"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:28:48 -0700
X-CSE-ConnectionGUID: OP7jxh2UQVCpRlBcBt6KKw==
X-CSE-MsgGUID: NcHcAQ5/Ro+6QtmjrrR37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170087340"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:28:46 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:28:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 12:28:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.87)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tb7G1Y3ZLD/8TDWy3fqWo+R1OnCKALB8iBBYbHKsLAM9vm4U0P+r9DKfIVpbyclvk/Jsr8NiqpUvSw4BIoUv4jgY9h5wg5x8RaVcXVTUl9wdSAZByFgDGW//7XWSBvo+x9Xd8VzDW18Oai6tvPapuK9ZwcDdePVn4DnNmJY47aTsZdwE3tJbQfdL+Kb2zHpYdwSPVIhSK0jq93R7tLzMce34DShfr+xVOZ2EDYlDvp6BrNKw62h8gBNtMAInmiD+Fz+Ml/2O/u4cS8VfbMO2MqLOzkdwl87Pea7TzosVGL+eskoWSX3M3qkKCFFndQygj1jwDV5+AbwMIEMnRfb6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWFbvSt9Q0rKShkxzSSf3nVUQBOWsEYehoEFAPvPJH8=;
 b=xo3YHThyNbSEv1TNEy5MNidfv7QIEh9pQesTJ82r+cyN8qGBIYCrhWpqknrkhvzDpNc80KUI9+pNIioupVz06OJSlGUrhwzLwX/glxjQeU8zxHseL/4EeVEG98+jnAHxC4tjPZgaelym2V1cO5eOKFxxxMWZYMWlytQcQPoNUja/AogrP2U3ZlezjwXNBOZFrd8mx/9Qd7m72WefUPyABtyauaFsTIEbvrMSvQWLcA2zuu893l1FRvBupNFNT42Exn4UtbCQDJpv/Gz6jy5pHeDaQr/FnxA5Fl0UxxeTG+/+qPa2PVXrvV/Qul5wWytvDw0taaItW4hhUvNuyMGutA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7877.namprd11.prod.outlook.com (2603:10b6:8:f4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Wed, 27 Aug 2025 19:28:39 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 19:28:39 +0000
Message-ID: <dbdfba5f-1026-4ecb-86d7-f33e84eb39d9@intel.com>
Date: Wed, 27 Aug 2025 21:28:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe: Add error_injectable define
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <john.c.harrison@intel.com>, <matthew.brost@intel.com>
References: <20250827182612.106364-5-jonathan.cavitt@intel.com>
 <20250827182612.106364-6-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250827182612.106364-6-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P194CA0035.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 077aa3b0-5547-4123-32bc-08dde59fecaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3o5N09TQlJaeXpTeDBTbDhCTGNqampWaGlpUVkxV3lIQXozR0NWU3RkWmJt?=
 =?utf-8?B?b2dhY2twZm1PWit4NExld2dSTFFjdWV3WXBzVUlua3Znd3ByNENPWTRVTkhT?=
 =?utf-8?B?YTl5TzhMK05qYlE1YjhFTmhqUkdqN005UnZ6dHRzUFNlbzNXK1AvaEhUVHd0?=
 =?utf-8?B?SFhGNnF5ZjNRakdZMGo3MnhzOGYvTURYc1NMVVoyNUY3UnJGQUM3a3Q5WXVC?=
 =?utf-8?B?cllCWjlOR1dQcEJJeG45RHhvL0hXdFFQRlliVUJFQWFoeTZMUmdodk12V3du?=
 =?utf-8?B?R0NuR1BqNkhYM25yTi9xdk9lR2RlamdmSVkyc1ZZUUFkYTVrWEZ3bE9QZGxL?=
 =?utf-8?B?anFIZ3A4K2RiTHMyZUZITmpVdUF4a2o4cEJWOVhvYTMxR2dyc0FkWmJJdUhZ?=
 =?utf-8?B?L1N6Z0dNaWlaampsTUxWL3NaVFdaRC9teVdKaE5RNWhsQWdENkZWYVo0T3BY?=
 =?utf-8?B?QWFQeS8zbUdVcEFQdktDM0NrR3RnWkNBR3J3dnA3RHNWTmVmNVlvZ3BqaFNE?=
 =?utf-8?B?ZVVCcTgrYWt1bEo5eXpvb1pEMWhqdVpVeDVlUXhEbXZDNHp6TTVGczN1eUFF?=
 =?utf-8?B?U1pjbjVpWDBJQUdDYU81SVZZaWNjZHVxV0IramJVbjRBZWNpWmVMcEM2TmZ3?=
 =?utf-8?B?OVljZFpCaGdWamZxbGhSY3dHc0ZEWmlVRTl4UXpUS3FQNGsvVTd1WVlHb2NO?=
 =?utf-8?B?cHY5VHorL3lVTE9IbGxJZVROQm1jTWtlcTl0OUZMVzZDV0FmSFllVmQ4bjZ0?=
 =?utf-8?B?QVlwbzE2RzRPYlo0V0hTemttL0x5MFRhYnN3WWhFdk8xSVdsR3dMTXMzMTFP?=
 =?utf-8?B?UDdCdVl0aXphRytraXVjeE50RlZxYndnZ3J0OXJwSzQ5UkcvcStPczkvY29Z?=
 =?utf-8?B?RzFOcHVmeUZNand6SExTVTVuR1VmaUFoamptUExabEwva3BTZTJKS3BHbDhk?=
 =?utf-8?B?V1J1Rmt0aDNYNkxvbDlnM21pRUNFdm9HVHB4UFF4V1dLZGF5UThTZTNDZjJM?=
 =?utf-8?B?R0JqWVVlVk5nZjdhYzkvRUlGUGNic25WRUFSTmpYa3FxZkNXMHYyQkQ2VXBq?=
 =?utf-8?B?eW5qbWdaNXFIUitBYU5KUWd2UkFzcTl0ckNTbzBYTnBGekUwaTdXcEtPVnQx?=
 =?utf-8?B?OWZBK3FLQ3VXZ3gvYUc3KzdZS2dUNXlTSUJaUng0MVp4blU5TkQvbTVFdkky?=
 =?utf-8?B?d2NWeG5KNmpaMVVoc0lkSVJ6c2M0aTBPQ2NGTTVuUWo2ak5BVWdZajY1dTFP?=
 =?utf-8?B?Szk4MEVMOHZtZVdxd0tEOHljeDZ3Ukk2ZUNNOGRkc0tXQ3orYnNIeTNHWENn?=
 =?utf-8?B?TXhralVWdVkwTkVCSEVhbDVUS1NQUHFjTkhTdlkyQ0tjTVJ6SCtCQjFHa1Qv?=
 =?utf-8?B?d0F4bS9WUkxHVnY4bGxXOGZmWUVKN04yOWQ1dFI2c3lEd1Z6VlJ1d1FJclFK?=
 =?utf-8?B?V2oxMFRick9GR1RNbkFUeG00ZW9XVWhWSXZSSE5CUjFUdGtIbU93bUl2cndN?=
 =?utf-8?B?Y2huS1h6TTZOcS9yclcyUnJkd1UzemlOZzVkc2FzOG5XWmM3aEZLUi9RM25U?=
 =?utf-8?B?aEY3NXhYSnlUU0xLbHJlVjNpdDg4UnlPRi9BN0lLTHJpVk03eTdnWkxQSm9I?=
 =?utf-8?B?UVpDdTVwRWh0QUZxWlkzai9zUC9xM1Z5SWhuK21TSHZ0VUNuYmk2ZnA3Rmhw?=
 =?utf-8?B?aHZzSi84dFgrblJBT01EMWhSVHNsWnhSOHpKMFY3ZHI4RXBreEF4eW9haUdj?=
 =?utf-8?B?LzFCVGp4ZlA2NUhReUpyNWZRL2dpRG1xWklGNkJkY01BNmx5OUdDbWNaZVVK?=
 =?utf-8?B?ZHdwa0JIWnRXWHZGK0E4RjVoamNxWitVUFUvZGE2UTlrcUtsUW56eXJTR1pn?=
 =?utf-8?B?dG5jMnMzcmRPbHlNNzVuc0Mwdm1WN1pmZDZ2VWwrTkVORTgvTUovZ2p6cGNZ?=
 =?utf-8?Q?LTu4spJP7xc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmM4K2x2WDZCUG5hS1p2U2R1SXFFT2VOVUNlMVU3cWpWNXl1UklLS0pjY0E2?=
 =?utf-8?B?UGVyOGZKRFo3dWNSN055a1RTVitjNU53eU1hdk1aMjZjWGl4WVVjb0xiTFhW?=
 =?utf-8?B?N01EdWdXYzhYVFBYOG5OaUhIV1pMYWdJb0d1WFdONWhORkk4SVByLzJVTXFT?=
 =?utf-8?B?MGhvVWNPUWtVVnBaUnU2TFJQYnBTYithVWpaRXJ2WlpwdTNzTmxEd3hmSGZm?=
 =?utf-8?B?TTlnbjBoalpOamlOWTZkZFBYa3crUHdCSlRJSFpwZjY5RFZtRkwvVXY4dlB5?=
 =?utf-8?B?VStiSnNMZEZsU0JSYlVIUGlrMFlGNG1iM3dpcHRzRWJJRlBnNlZ1UythYitm?=
 =?utf-8?B?QnhDalAzN0lNODR0NlgvaE11VmJSdndKeEVPYkxWU0RIZ094aHFDOFh4N1o4?=
 =?utf-8?B?Z29BaWNQTWJWTWdlSWZjUHVxOUtwWGt5eFgyR0JjYTdGRXZhNEw5bW5rQ3BG?=
 =?utf-8?B?cmdlcW1GdDhlZ0dmdWs0V0tuejA4aFhxeVNxdm5yTGZGUEJCV3Y1dVRTd0d2?=
 =?utf-8?B?U0lOUFB4aU5zM0MxVTZzRE1BRUUrUVkrSmlKZU9lZFhaUmJyNnRPVXVYbE9Y?=
 =?utf-8?B?aHlDSWhlZDR0KzJMU0NQUDd0cFpLK2NONWI1RnFzMTF2akVPZmlEaEZ0dFBn?=
 =?utf-8?B?VmIyeHFkSThtaHEzYzd4aThlZjRGeE9vWWtPRDd1OHpWR0ZkSGFiamRCeWxZ?=
 =?utf-8?B?WVQwUGNmMml1bklsekVKaDVSSk5KNTNDZnQ0NWl3Vnp4WmRFdGN3K2oyeVcv?=
 =?utf-8?B?NWZwV3NoOXh6QTFISGZqbWxUSnRDaVF2aVlMNDRCS0pBVmI3UUlXNlo4SlRa?=
 =?utf-8?B?RkhGNlFxNVpiRndUS0M0WU9wSFNGa0hKSzBuUHhrMEFiL0VmZjByd2RmejY0?=
 =?utf-8?B?eTZieTNKclBHRHloRjUyYnh4QU84MXVxYmJueEJPQi81ajBLeVJOR1lYa3Qr?=
 =?utf-8?B?Q0IzTHNCY3hwNFEvNEtDUTNnakl1b3lSNXRaU3RkR3doK0JpckhZLzdybVVp?=
 =?utf-8?B?cUJXdUp4bHJveTNSWVliUU5FMnNJMStqZGlsTGF3RUtzOVE0UkhSNWdiZUR4?=
 =?utf-8?B?QlVEcWx0RjVEUU9EaXFjYjhBaXFDNEIrMlMrUWZ0aHAxVW55N3JiNDMwNXJq?=
 =?utf-8?B?YXJqUndjbWltMzliYllqV2NJemZySlJkTEQ4M3l1cU1YMkkzcGFIeWF1MHJx?=
 =?utf-8?B?eHBLRnlZaTN2R2NaN0wxRFd2UUxGTXp6bHNhWllyeVVNT1F2dXJmbFBwS2ZR?=
 =?utf-8?B?YjhWV2hWeE94dHQyYkFWR2dkZG82UE52YVVhN3F0M01HZzhaT1ZNak5KQWpv?=
 =?utf-8?B?YjM2N1RUWnRmWWZpR3k1S05aS2F4Y1FiNVZwYVhKSk51M1Rrd0hLR3B5MHl3?=
 =?utf-8?B?UFk3N0xDZGEzMFpsb2lha3kyQkViTDJKL25kMHZTdS9Oc0NMZjJ4QmNsUHdQ?=
 =?utf-8?B?OWNLR0JrbjJqV3hMOHkwd05OYXVHNEZTenl0elh6aWRrNlp2c2psTUgyMXFR?=
 =?utf-8?B?UHhobmFZWGFMazFXT1pYRGtEN2V4eFJtQ2RWOWN4d214RzVDbEdYSkZRcnl3?=
 =?utf-8?B?ajJVc29FU0plVVBpY0tMbkR4V2s4VEQ5TVB3bU5LMUpmVGNTSXo0MDdWZWRy?=
 =?utf-8?B?ekpzVEgxN2JmL2pJTjVCT3lWekpJZmUxUnNwWEZldzFLK0VnblJzOWlZakdW?=
 =?utf-8?B?T01jOE5UbnZ0RURHcmxOWTNmM2xXUFp5N3NEeFhDSm9XWU1ScVVDMnN0elph?=
 =?utf-8?B?Si8weExvN0xidDhtN2w0dHJaMlU2dnZlamhNb09zdWJETEdmWVAwdEs1L0l5?=
 =?utf-8?B?UGtFSDRGWmoxZDZ5SG5uaEViZ3JzMWJMcFpQQWZVQm9mNVVEYkdnVmtOMHRM?=
 =?utf-8?B?YitsVUl6NnlPWFRKeTlTNkxVZysrU1VEdzdLcjU3UjQ0bG1KRmpRaFJydmpu?=
 =?utf-8?B?ZmI1MFU0ejkrOWVERTR6WVI3QktkREZvbWdwQ25lZE5sWEpJUFR1NkhnSUVz?=
 =?utf-8?B?eE5Jc2VuczAvUVM0WlVDcnVRWkpJWmJmRXFTQ3BPVjlhK3FpNGdKQ1dReXpM?=
 =?utf-8?B?cDNNeWRaSVA5djB0eTJFN2NFdmNxUThReEwwa2pSb1V3VlB0T1hweFNBUVlN?=
 =?utf-8?B?d25yYlBrSnhzVGFobTJxcWNURTJUK2ZXT3RheWNINGd6Y3BmSHhmQTB5RHNB?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 077aa3b0-5547-4123-32bc-08dde59fecaa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:28:39.2368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjVeL7jGUoDF/csH7ahpx1+kbE7/Z4r4IvwAxG2tmDlTG7+fpmw29OOBUceKn3+jpLsPGFDEHidmJSgw98qh4CFwIBf2IftKZvRN+bPT+cM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7877
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



On 8/27/2025 8:26 PM, Jonathan Cavitt wrote:
> Add a declaration for the function attribute "error_injectable", which
> appends noinline to functions tagged with ALLOW_ERROR_INJECTION only if
> CONFIG_FUNCTION_ERROR_INJECTION is enabled.

this really doesn't answer the question "why"

>  This function attribute was
> added to drivers/gpu/drm/xe/xe_macros.h, 

this can be clearly seen in diff

> and has been applied to
> all Xe functions with ALLOW_ERROR_INJECTION enabled.
> 
> v2:
> - Move error_injectable from error-injection.h to xe_macros.h
>   (Wajdeczko)

it would be better to just say (Michal)

> - Reformat function attribute application to minimize diff size (Brost)
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c                |  3 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c            |  2 ++
>  drivers/gpu/drm/xe/xe_ggtt.c                  |  1 +
>  drivers/gpu/drm/xe/xe_guc.c                   |  1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c               |  1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c                | 20 +++++--------------
>  drivers/gpu/drm/xe/xe_guc_log.c               |  1 +
>  drivers/gpu/drm/xe/xe_guc_relay.c             |  1 +
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  2 ++
>  drivers/gpu/drm/xe/xe_hw_engine_group.c       |  1 +
>  drivers/gpu/drm/xe/xe_macros.h                |  6 ++++++
>  drivers/gpu/drm/xe/xe_mmio.c                  |  1 +
>  drivers/gpu/drm/xe/xe_oa.c                    |  1 +
>  drivers/gpu/drm/xe/xe_pcode.c                 |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c                    |  1 +
>  drivers/gpu/drm/xe/xe_pt.c                    |  3 +++
>  drivers/gpu/drm/xe/xe_sriov.c                 |  2 ++
>  drivers/gpu/drm/xe/xe_sync.c                  |  1 +
>  drivers/gpu/drm/xe/xe_tile.c                  |  1 +
>  drivers/gpu/drm/xe/xe_tuning.c                |  2 ++
>  drivers/gpu/drm/xe/xe_uc_fw.c                 |  1 +
>  drivers/gpu/drm/xe/xe_vm.c                    |  5 +++++
>  drivers/gpu/drm/xe/xe_wa.c                    |  2 ++
>  drivers/gpu/drm/xe/xe_wopcm.c                 |  1 +
>  24 files changed, 47 insertions(+), 15 deletions(-)
> 

...

> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 3f4e6a46ff16..a7b7045fc732 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -213,6 +213,7 @@ static void primelockdep(struct xe_guc_ct *ct)
>  	fs_reclaim_release(GFP_KERNEL);
>  }
>  
> +error_injectable
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> @@ -252,6 +253,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
>  }
>  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>  
> +error_injectable
>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> @@ -1149,6 +1151,7 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   *         DATA0 from `HXG Response`_ if &response_buffer was NULL, or
>   *         a negative error code on failure.
>   */
> +error_injectable
>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>  			u32 *response_buffer)
>  {
> @@ -2069,22 +2072,9 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  
> -#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> -/*
> - * This is a helper function which assists the driver in identifying if a fault
> - * injection test is currently active, allowing it to reduce unnecessary debug
> - * output. Typically, the function returns zero, but the fault injection
> - * framework can alter this to return an error. Since faults are injected

you can use some parts of below explanation in your commit msg

> - * through this function, it's important to ensure the compiler doesn't optimize
> - * it into an inline function. To avoid such optimization, the 'noinline'
> - * attribute is applied. 

....

> diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> index 8a77c2423555..0d09a213eaba 100644
> --- a/drivers/gpu/drm/xe/xe_macros.h
> +++ b/drivers/gpu/drm/xe/xe_macros.h
> @@ -19,4 +19,10 @@
>  	cond__;								\
>  })
>  

and it wouldn't hurt if we also put some description here with
how/when to use below macro
> +#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> +#define error_injectable noinline
> +#else
> +#define error_injectable
> +#endif
> +
>  #endif
