Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317A1E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 17:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB63610F0B6;
	Fri, 13 Dec 2024 17:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cgjwvyfb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02ED910F0B6
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Dec 2024 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734111291; x=1765647291;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XCgvVDvZnEPzv38dACqRDRMgi2hoyg2ht0laVvkR2bU=;
 b=CgjwvyfbSl0Yl1KfSQGTuxz0d/ZUBSGje5slYAhI0J9Iyg81s1LbVpN0
 WT4HaBwaN5HHJfskN9ZSkWHGEdw690pJXwP5YgxmiTSZ3anIaHIYCKHGI
 Op/GlAx/tJSpURRu0r1+rMiEQ1r3HUcnTJ20eOXUtI9O0+xttSguPo/Bs
 jE5poTvUveoE1fL8CBbENT7+KRJr1JddhQgVun9GJa5CLO6kF+vZJj0H9
 xKMOndexrdw+7ygWk4PtHQVpKbzb3AsZQwjz0kSTlB7Ietm9uw+g/DvLA
 I3czVwcpbk2o9HKeFaZIAl6tCBbHv/q5fEpBitEGdHMJkxlxpt1vb/JQG A==;
X-CSE-ConnectionGUID: BOBVNxLwTVWCz2JC+plong==
X-CSE-MsgGUID: fbbe6A52RGq09lbX7V23Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="33869768"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="33869768"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:34:50 -0800
X-CSE-ConnectionGUID: q1UGjrIkT0iqf+TqUtlCnQ==
X-CSE-MsgGUID: HVytlN7ITAy6JN4CUASykQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="127397861"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 09:34:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 09:34:49 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 09:34:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 09:34:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+RiYjJNTxmxaGO1xX8+iR8T0U33I5Kl5dbIVrw9uhW2OkfSlrXvW4z/7WdFOdK7HK/8I3T9qmRwP7jfIBOGNbYmTYeyKbrnnZreWgsXsmQPnmEcPhs+/ea7vIARoyiZ5hpCW1SRLJQ427HKBM/X5Z37n+0tG1hgbBi9k1Y4GMop2PopWfbtFZk6FQjr54/Zlw9pih8pfwZEn2QFPWV+4qRonhYzoUcn7Zq67XU/l1DXfycN6JQRN+9Ug/X9CIxDj3Y3ymW62G6yD+GXLNLj3giWSyvRupozF7sTFeJXiJsHQgeGTBZ4B3+oE+d39XSufmkuugHtiJDecnZWnknPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezY4qX1dlVLMHyp5tIEXcaZ5Nmr1Un4nDCTfB6Bu1P0=;
 b=cycntIgIspb84w/TaXOYvvnSNPOD6a069DsYvV2LENWYaROMJwWvOMzNnc2ii4cfHC6wLptWVsvml7mHo8MXX+WVbR6OksoBJmFuFb6NeugW0WleLLfFglkWQC5sg7421wCP2Umlc4wuXvkRq70LYLM8dGqxZ5baGiK3gS2v74UlXZChij7PFTIauk14AaCHbkEqf64fxeFcpEMMuf384mtZqwI91+PqJBfkTe8JXJE9i4dZMsjT7PHANx5469GoTX+dWFSoMPiKquwgtTkdUI8h1bpoFV+jAamilKpjs/tOBMcsA3OQG2DXBPZ3duMJfjiv92qA6t4kfX1UdMRJtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB8400.namprd11.prod.outlook.com (2603:10b6:208:482::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 17:34:32 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 17:34:32 +0000
Message-ID: <744d4c47-7419-4050-9d6b-dba48b8953b7@intel.com>
Date: Fri, 13 Dec 2024 09:34:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Filipchuk, Julia" <julia.filipchuk@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
 <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
 <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
 <208f50d9-58e8-413e-915f-95ca077e0fa0@intel.com>
 <dahmzb4tveblm74nwhq5mabz672xivpfeuvkpzb6hnjfs4qrwt@rl6c56v6mfyy>
 <db943f8a-0d92-49bc-827e-46284739e8be@intel.com>
 <zy2x47cknwhzycszh7otjn5t65pvsotwwftcbleq44cmzbibaw@5gsx7zp7t2sm>
 <421289df-ed8e-41a3-8f66-959d42e3b9b4@intel.com>
 <wsg6l3h3ofwmok724jqqoilseve4lj5if7nucuvz62neitlfg2@atylma4bdedv>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <wsg6l3h3ofwmok724jqqoilseve4lj5if7nucuvz62neitlfg2@atylma4bdedv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0183.namprd04.prod.outlook.com
 (2603:10b6:303:86::8) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB8400:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c63f07-cd6a-4dc9-1ca5-08dd1b9c67bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnNwWmw4aEEyOEpRcUlhSkhic053Tm5UdUJ2eC9LUCtRMVlWMmtPQ21QaFV3?=
 =?utf-8?B?bmp6bCtmLzdCZ0FDN3U5NEc5YmVYM2xXbFIwTXNIYzlWYnJHYTdud2RpL09w?=
 =?utf-8?B?cE5CZ2kzZklZUEFNbC9pUi9oNFIvd0hsdWJEZTFMM0Q4RTB1SVBFc29yWjNI?=
 =?utf-8?B?eldkWUNSdlFtcmJ2NjVwQStZVldpUlNWNU1FZ2VmMHRyV0Y1R1gzQUcybi9Q?=
 =?utf-8?B?L0U0YkliZmxoMTAyUDRoOW9IaC9NbHgrUjNla3o2L2JIaFNGcEhpUy82Q1lq?=
 =?utf-8?B?ZEpnLzRlRTBYTlBGQ1RpR1B0SkMzK0lCSVFWTW53WmlyM0VtMzJnT3VTZnZZ?=
 =?utf-8?B?S0lVTS85VFZVVllIeU5PWXZ1MFdlNmNWZUFISThRaVNuQkZHWjZQeE5iTHND?=
 =?utf-8?B?VnVOcFNDYzUzODVkaHgvVzJla3NqSklqQ2x0N3lsTVFTaWpWU0ZJYmgyeXAz?=
 =?utf-8?B?WXQ5djhucUlkcVdmdy9vSVFHQnEyY3RicVZFWC9CaUU4OUtBTGRnRjVVSllO?=
 =?utf-8?B?SGFIVjVzbjhpTW1mZXR3dk9SZWhheU5ZRnRqempoeEc5SDlxV1JUM0VqS0N2?=
 =?utf-8?B?NGNMZWpHK1h4bXFXWUwxQ0F5UnE5TmZWYTVWaW1xaGFNcFZoZkl6WFlSZnp2?=
 =?utf-8?B?NTJCd1JybXlycHpzOGtmMmZIVTExUXFDckN4blFiMU5aMDhZUE5hSGNNZ3M4?=
 =?utf-8?B?NGhoODJLTHFYVk9FUFByK2pjUjZEejNKMWlOYjdaWnlDM3Z3YnZJUUFDSm9M?=
 =?utf-8?B?a2tObzZ0SVphNlZ4Q0gxYnY2SWpqOXl3c0ZNZTM3cEo3bVdPancrdldwdWc5?=
 =?utf-8?B?ZkMzTHROMU9udGVYNUhSMUpnUnMwbEo4cVRtUEF3dUJjSTB2dkJiNDh6Z1ZV?=
 =?utf-8?B?aW9pclhnVmRvSUFGWU1MU0M1bmZ0SW9SYTFmWWtnUFA0YmdDdFJ5a0VRa1pL?=
 =?utf-8?B?ODN0d0dTY1VVY2tyZG1vdjlQa2tlaVFMWHB5QkJkdUJsU1BDUUhzRUVMZ1RT?=
 =?utf-8?B?T3ltWUU1YUlNaEp1aGpaamlrR3EzaWpHNlNvNjF4aGttcFNoZXV5RWZnN0Nz?=
 =?utf-8?B?MlR6VnVTL1NQYStxNXMvc0MxMHpSTDhzaFlwYzNjdmtoNU9LVkFCSFNYaFQv?=
 =?utf-8?B?MnJtckZEeEs2MkVYSEhNait5OVZ0UGd6YklqakwrQWZrVEd4dDh3Ukt0VWFQ?=
 =?utf-8?B?YzkrTUpVMkU5OTVyd09QaURqWk5XckJUS1Y2T256NFFGalFHQ3EwN2NsL2k1?=
 =?utf-8?B?UWtXUUNac09QaExVbnVra21ubWsvZmJPa2F2WWpyRHovWS9VSGhybkI4TUI2?=
 =?utf-8?B?d2JqVWEwb0E0c3k2L2tzTzd6TVBBK25hVHlFY010OUcySGFDUi93RkRRYmto?=
 =?utf-8?B?MGhuR2NhaVg1NzREQkd2cWpLZ2hBc29VazVuNGJkTHFPeHMzbXlYWFNsUTd4?=
 =?utf-8?B?ZkQ2OUx0UWFMemk1Z1FLU2lsQVQwblFVb3I3L0hvaHhpR3B3MDgzKzdreG5t?=
 =?utf-8?B?UkJFYStnOWRjRUFMQzFzZWFxQm5MTERYVEhsSThtMjVua1NYOUM0OU5JdHBz?=
 =?utf-8?B?Q1NxcWd6cGR0cmw4YzVBSWVhZWovT0JCdGJNeUp0SUQxdncwMjBwTlA2MVVF?=
 =?utf-8?B?ZDZhOE83SHhpWW1PL3F2Zkgxazd1cGQrT1hQR0Zja1ROTVgwOTRIc3QyeGRH?=
 =?utf-8?B?TXZ0K0VVdHB0QWxldzB5S29nK2JEWThUejNESHp0N2pFSEl1bGdnRmk4TTBY?=
 =?utf-8?B?WFU0bDg3ZE81MTRCWlR3b1oyc29QSTJJV2YzQk41UGNlbnVrdkszOWFBT3RD?=
 =?utf-8?Q?/LTgY7y3rClE3pT5zpFA8LlPdFS1dbKhehimI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlg2UzZIZDVtNjdHTndzdUdoVWJuYzRoeWdxVzlVS2xhSldIR1p4WEc1Yy9K?=
 =?utf-8?B?cXdrUFJTYkdZbmFXRmxEa3dKTFdTdVpqSnBEQ25SYnN4TUJJMW1uNVh1TGhE?=
 =?utf-8?B?MHNQdHZiWGVOUGJveitSMWg5bmZqUGJkeHFhdVhSNUJaTU4wSSsxeEVtTXJE?=
 =?utf-8?B?SFdKUkxzelNGRTlRc1dSU285emFoM0NuL2NCdnRTUXJ1YUVaR3Y3ZlRmTFIz?=
 =?utf-8?B?WDBpSXFkaGIyZXBTZFY2bktxbVRDVmxaU3RlU0dkaGpDeFB4TVcxVVRyUGpv?=
 =?utf-8?B?SkxqOFdKREdjckV1b0hsOTZvNEVaUlRJTXM0SThrWXB1SXhJcnU4VURLT05F?=
 =?utf-8?B?WFMzb0ZiVHMxUi9lV0FWVkdpUEtySjgwQnVaRU5FaitaN1NMYlNhU2R5Z3cv?=
 =?utf-8?B?SE85OWxzMmNtek9HRlNoTU5UMWM1cEFVaWJmN3NZbUlzZGFRN1lqdWhlYXJZ?=
 =?utf-8?B?UzVEamVmd2lQbFRBaUxaYTgzWFEzcVI3MHB5RnRNS1daK2lCNVMyenVSZ0tt?=
 =?utf-8?B?WnBiLzZtYjI4NDNPRkRKR01NcEVRWFdMZzRYaHo4aUxoZS80UTBtckxiZWVm?=
 =?utf-8?B?Y25zWXBkU094cWhWQ1c1WndzRVNMRXp1bGxYYUVUL3gzOXZ0bGh0REhKcnlH?=
 =?utf-8?B?eFFsU3FvQVFmbTRJZUk0NEtxYlQvK0hsT1Z5QWp2Njlua1VJVTBEUE9FRnFO?=
 =?utf-8?B?bEZuV2FJUnBKcFJsNzlGc3E3Y2NoVFV2VDhxTGl4YXlHUWFta1ZZY3hONUxp?=
 =?utf-8?B?R2J1V2lyQWVoS3NOV2R0MWx5SzNIeVo5ci9vbWpOVlQxaElwWTZ3K1BkRnRu?=
 =?utf-8?B?VFlUampGaXY0cDkxY3h4NS9SR3VDYzlJUlkwNTFBUXZIaVhYK2dEOFhwUEhx?=
 =?utf-8?B?cG43RXFKMndEZUhDUDllSzVmM0JVck5nek1YMkQ5MnFsQnRPdTFIem1keFRN?=
 =?utf-8?B?cGNBU3pOWE81MlByVDMyTEpZdENEbXFZR0ZQdllzaXpPSnl1enltMG9sbUIr?=
 =?utf-8?B?K0poM21LS2RHMEhQWEx3UmJaUnZubDJGVmk1NXBLbElLRjRjak93TkhYVTV5?=
 =?utf-8?B?Rms3Mm1kbDlsMjZ4cFJ1eVF3NTA2VkwrYk94TzllbmVFakZSek9DUmZJZGhl?=
 =?utf-8?B?T3NEOGZmR3ROK1RRTnp2QnUrSTRhZ1hmdHRYWFVoeEtkWFg2Y3lUL25NRm45?=
 =?utf-8?B?MXY5a0hTOUlWaFhpNVFOZ2ZGeUFPTGVkNGdteE13QWEzZ2R0cklQdGUzc0Vh?=
 =?utf-8?B?dFovT2E1bE1WZXBEUndxZjE3QnVFSDl3YllzdllhaDhHT2JTcnpYTUNlSkNJ?=
 =?utf-8?B?RUVKOVhBZCtSRlZXb01aSUNxQU8rUHkvVFFuV2o0d1hvWDBlWmZqSFVwdWJy?=
 =?utf-8?B?RGNzdU1RajVJbWFzNWtXNUlSZG5hckFPYUpIUmhUM1d4Z3h6cVN6dk5CV2ZL?=
 =?utf-8?B?ekxhVWp5T1l1TkpLOEIzR3BKSmJXenBDZjdKdEdGeUpTZis0a0ZlWDVxRitv?=
 =?utf-8?B?SkdaaFlFS25XSnNxZ1JJQUlzNk1JM0dGNEtaTVFBSmZKTlp3L1VUbmpXSm00?=
 =?utf-8?B?V0VGcDIwQ202V3UydHJ1bnRtR3hNcFgxaVVjTTl4YzA1N0tHa0YxQnhEYmg5?=
 =?utf-8?B?UWpCNWJPL1NoT0ZDSzllV0YzTElaK25DbFFoSzVVZ2tuM2o4UkhXbzNqbmZI?=
 =?utf-8?B?b2E2SGF1dnhNd1dmNStGQU4yL3o2Q1EycWZJbFF4MFpRdDh6L2hiaWNhZU1G?=
 =?utf-8?B?SVg4bXphcmh1WFFva0xTcjBRMlZuc2d3VHNXTG55dTlZWDhINjk0SG9kaHRz?=
 =?utf-8?B?N080UFVISEFlSmk3YmRUMldrOU5LT2lSZUE3bTFGcU0xRUcwREtXM2Z2MHFL?=
 =?utf-8?B?RTNNTzNndmpnenBBQnBlUS9BTEg2ZEZoR1VLemp2czkrK21lNnlaU1BTcUV4?=
 =?utf-8?B?cW9LYmt6VjBCMGZvWngvR2ZrQUZYMGNFVVhtT3paTXpJN0Z2SDVZdlBCSWFr?=
 =?utf-8?B?UEM4Tzloa3Q3ck81SlowVEYrb0pGYkJJc25GMkNqdjhOUTRqZDNGbUJwbmRs?=
 =?utf-8?B?VTArRnpMKy9oS3RQQ21Pb0VZY0VuNWNVREsxdFY5L0VQdjFLM1hpMXB6UDda?=
 =?utf-8?B?SG9IWGVWYjhvTzdrYjluRWllczNBVGFNRkpQVW55czgyTHZ2ZVVzOTI1S0pT?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c63f07-cd6a-4dc9-1ca5-08dd1b9c67bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 17:34:32.7510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JYeyPhzvB+7fH93C5DuKQKhLN4G8m4Tnw85ObZRNMPz0JphOqjaOVcfiqFWkHhCTRPeMGtn+NpZqWlm/nufJoH9Ajx+q2MYv/ruuKQvZkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8400
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

On 12/13/2024 09:20, Lucas De Marchi wrote:
> On Fri, Dec 13, 2024 at 08:36:43AM -0800, John Harrison wrote:
>> On 12/12/2024 16:32, Lucas De Marchi wrote:
>>> On Thu, Dec 12, 2024 at 01:04:23PM -0800, John Harrison wrote:
>>>> On 12/12/2024 12:52, Lucas De Marchi wrote:
>>>>> On Thu, Dec 12, 2024 at 11:14:23AM -0800, John Harrison wrote:
>>>>>> On 12/12/2024 10:45, Lucas De Marchi wrote:
>>>>>>> On Thu, Dec 12, 2024 at 05:41:41PM +0000, Jose Souza wrote:
>>>>>>>> On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com 
>>>>>>>> wrote:
>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>
>>>>>>>>> There is a need to include the GuC log and other large binary 
>>>>>>>>> objects
>>>>>>>>> in core dumps and via dmesg. So add a helper for dumping to a 
>>>>>>>>> printer
>>>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>>>>
>>>>>>>>> Another issue with dumping such a large buffer is that it can 
>>>>>>>>> be slow,
>>>>>>>>> especially if dumping to dmesg over a serial port. So add a 
>>>>>>>>> yield to
>>>>>>>>> prevent the 'task has been stuck for 120s' kernel hang check 
>>>>>>>>> feature
>>>>>>>>> from firing.
>>>>>>>>>
>>>>>>>>> v2: Add a prefix to the output string. Fix memory allocation bug.
>>>>>>>>> v3: Correct a string size calculation and clean up a define 
>>>>>>>>> (review
>>>>>>>>> feedback from Julia F).
>>>>>>>>>
>>>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>>>>> ---
>>>>>>>>>  drivers/gpu/drm/xe/xe_devcoredump.c | 87 
>>>>>>>>> +++++++++++++++++++++++++++++
>>>>>>>>>  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
>>>>>>>>>  2 files changed, 93 insertions(+)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>>>>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>> index 2690f1d1cde4..0884c49942fe 100644
>>>>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>>>  #include "xe_devcoredump.h"
>>>>>>>>>  #include "xe_devcoredump_types.h"
>>>>>>>>>
>>>>>>>>> +#include <linux/ascii85.h>
>>>>>>>>>  #include <linux/devcoredump.h>
>>>>>>>>>  #include <generated/utsrelease.h>
>>>>>>>>>
>>>>>>>>> @@ -315,3 +316,89 @@ int xe_devcoredump_init(struct xe_device 
>>>>>>>>> *xe)
>>>>>>>>>  }
>>>>>>>>>
>>>>>>>>>  #endif
>>>>>>>>> +
>>>>>>>>> +/**
>>>>>>>>> + * xe_print_blob_ascii85 - print a BLOB to some useful 
>>>>>>>>> location in ASCII85
>>>>>>>>> + *
>>>>>>>>> + * The output is split to multiple lines because some print 
>>>>>>>>> targets, e.g. dmesg
>>>>>>>>> + * cannot handle arbitrarily long lines. Note also that 
>>>>>>>>> printing to dmesg in
>>>>>>>>> + * piece-meal fashion is not possible, each separate call to 
>>>>>>>>> drm_puts() has a
>>>>>>>>> + * line-feed automatically added! Therefore, the entire 
>>>>>>>>> output line must be
>>>>>>>>> + * constructed in a local buffer first, then printed in one 
>>>>>>>>> atomic output call.
>>>>>>>>> + *
>>>>>>>>> + * There is also a scheduler yield call to prevent the 'task 
>>>>>>>>> has been stuck for
>>>>>>>>> + * 120s' kernel hang check feature from firing when printing 
>>>>>>>>> to a slow target
>>>>>>>>> + * such as dmesg over a serial port.
>>>>>>>>> + *
>>>>>>>>> + * TODO: Add compression prior to the ASCII85 encoding to 
>>>>>>>>> shrink huge buffers down.
>>>>>>>>> + *
>>>>>>>>> + * @p: the printer object to output to
>>>>>>>>> + * @prefix: optional prefix to add to output string
>>>>>>>>> + * @blob: the Binary Large OBject to dump out
>>>>>>>>> + * @offset: offset in bytes to skip from the front of the 
>>>>>>>>> BLOB, must be a multiple of sizeof(u32)
>>>>>>>>> + * @size: the size in bytes of the BLOB, must be a multiple 
>>>>>>>>> of sizeof(u32)
>>>>>>>>> + */
>>>>>>>>> +void xe_print_blob_ascii85(struct drm_printer *p, const char 
>>>>>>>>> *prefix,
>>>>>>>>> +               const void *blob, size_t offset, size_t size)
>>>>>>>>> +{
>>>>>>>>> +    const u32 *blob32 = (const u32 *)blob;
>>>>>>>>> +    char buff[ASCII85_BUFSZ], *line_buff;
>>>>>>>>> +    size_t line_pos = 0;
>>>>>>>>> +
>>>>>>>>> +#define DMESG_MAX_LINE_LEN    800
>>>>>>>>> +#define MIN_SPACE        (ASCII85_BUFSZ + 2) /* 85 + "\n\0" */
>>>>>>>>> +
>>>>>>>>> +    if (size & 3)
>>>>>>>>> +        drm_printf(p, "Size not word aligned: %zu", size);
>>>>>>>>> +    if (offset & 3)
>>>>>>>>> +        drm_printf(p, "Offset not word aligned: %zu", size);
>>>>>>>>> +
>>>>>>>>> +    line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>>>>>> +    if (IS_ERR_OR_NULL(line_buff)) {
>>>>>>>>> +        drm_printf(p, "Failed to allocate line buffer: %pe", 
>>>>>>>>> line_buff);
>>>>>>>>> +        return;
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    blob32 += offset / sizeof(*blob32);
>>>>>>>>> +    size /= sizeof(*blob32);
>>>>>>>>> +
>>>>>>>>> +    if (prefix) {
>>>>>>>>> +        strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN - 
>>>>>>>>> MIN_SPACE - 2);
>>>>>>>>> +        line_pos = strlen(line_buff);
>>>>>>>>> +
>>>>>>>>> +        line_buff[line_pos++] = ':';
>>>>>>>>> +        line_buff[line_pos++] = ' ';
>>>>>>>>> +    }
>>>>>>>>> +
>>>>>>>>> +    while (size--) {
>>>>>>>>> +        u32 val = *(blob32++);
>>>>>>>>> +
>>>>>>>>> +        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>>>>>>>>> +            DMESG_MAX_LINE_LEN - line_pos);
>>>>>>>>> +        line_pos += strlen(line_buff + line_pos);
>>>>>>>>> +
>>>>>>>>> +        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>>>>>>>>> +            line_buff[line_pos++] = '\n';
>>>>>>>>> +            line_buff[line_pos++] = 0;
>>>>>>>>
>>>>>>>> This breaks ascii85 parser that we had up to now.
>>>>>> It should not break the decoding of existing sections. This 
>>>>>> helper is only being used for the new GuC objects at present. As 
>>>>>> per the TODO, the intent is to use it for all blobs in the 
>>>>>> future. But that was deliberately left to a future update (which 
>>>>>> hasn't been posted yet) to avoid breaking the mesa tool.
>>>>>
>>>>> it broke nonetheless because then it fails to decode this line the 
>>>>> way
>>>>> it was doing:  each line starts a new key.
>>>> It barfs on any line it doesn't understand? Seems like it could be 
>>>> made to be more robust in general.
>>>
>>> I don't know, you're welcome to look at the source and understand how
>>> it may possibly break when you are doing a change like that. Even 
>>> better
>>> if you can make it robust so it doesn't break. I'm sure you know where
>>> the mesa repo is. I was just looking at what I wrote in the email 
>>> thread
>>> I pointed out when reviewing this. I was surprised it got applied as 
>>> is,
>>> knowing it would break (because I had pointed it out) even with 2
>>> maintainers saying we shouldn't break the mesa tool in question...
>> To be clear, no-one *knew* anything would break. The vast majority of 
>> that email thread was about whether we should include any ASCII85 
>> data in the devcoredump at all (which is something we had already 
>> been doing for a long time). What you actually wrote was:
>>
>> +José, would it be ok from the userspace POV to start adding the \n?
>> Then we can at least have all fields in our devcoredump to follow the
>> same format. Are these the decoder parts on the mesa side?
>>
>>
>> Which to me reads as a question about whether we can update the 
>> existing ASCII85 sections to use the new helper function. It was not 
>> a question about whether adding a totally new field (using the new 
>> helper function) would cause a break. And given that there was no 
>> response after several weeks, it was reasonable to assume that it was 
>> not considered a problem.
>
> no response? you even replied to them. In the very next paragraph of
> what you quoted I had already stated that by looking at the mesa parser
> it didn't seem safe. José replied to my email confirming it would break
> the mesa parser. Rodrigo replied to that saying we shouldn't merge if it
> breaks the mesa parser.
As above, my understanding was this discussion was about whether using 
the new helper for existing ASCII85 encodings would be a problem not 
about whether adding an entirely new field would cause a problem. So 
yes, it was known that the new helper could not be used for all existing 
ASCII85 output. And hence the patch was not attempting to do that yet 
but to leave that update until later. But I apologise if I 
mis-understood that you were saying even adding new fields using it 
would cause a problem.

John.

>
> what is this part of your reply that is not "ignore that it will break
> because I think I can break"?
>
>     > > It will break the parser and I don't think we are allowed to 
> break it at this point.
>     > The intent has always been to add compression as we had in i915. 
> That will
>     > presumably also break the parser. Although I'm not seeing how a 
> debug log
>     > parser counts as critical user space that must not ever be broken.
>
>>
>> And there was never any discussion about whether adding extra section 
>> headings would cause a problem. That was never even considered to be 
>> 'unsafe'.
>
> yes, the issue about moving that keyval to another section was not
> considered.
>
> Lucas De Marchi
>
>>
>> John.
>>
>>>
>>> particuarly it being just to please something that shouldn't exist (a
>>> garbage dump to dmesg).
>>>
>>> And before you argue about format version and potential breakages if an
>>> hypothetical parser is doing obscure things... this is different than
>>> real breakage: we know there's a parser and we ignored it saying we
>>> don't care. That is not acceptable.
>>>
>>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>>> And I think there is not safe way to parse it now, how would 
>>>>>>>> the parser know that the blob reach to end?
>>>>>> The GuC decoder tool simply ignores leading/trailing whitespace 
>>>>>> and keeps decoding until it finds a line with a new field - i.e. 
>>>>>> anything with a non-ASCII85 character such as ':' or '*'. It is 
>>>>>> totally
>>>>>
>>>>> character set for ascii85 is [33, 117] and 122, which includes 
>>>>> both ':'
>>>>> and '*'. Hopefully it's hard to hit a collision, but we shouldn't 
>>>>> design
>>>>> it in a way that is possible.
>>>> Sorry, getting myself confused - it was a while ago when I was 
>>>> writing this. Yes, punctuation marks are part of the ASCII85 
>>>> character set.
>>>>
>>>> The GuC decoder looks for white space - a blank line or a line with 
>>>> a space in it. Any new field is guaranteed to be "name: data" so 
>>>> will have a space. And sections are delimited with blank lines, 
>>>> plus section headers are "**** name ****" so also guaranteed to 
>>>> have a space.
>>>
>>> space is good because it's outside the character set, so an
>>> if/else chain with `if (strstartswith("RandomKey: "))` could
>>> disambiguate it. But maybe it'd be better to have a space at the end of
>>> the line so a parser knows when the next line should be a continuation,
>>> just like with use "\" in some places. That is better then trying all
>>> keys before deciding "never mind, concat with what I was reading 
>>> before".
>>> That may break your guc log parser, but it's probably less drastic than
>>> just reverting this whole thing.
>>>
>>> Lucas De Marchi
>>>
>>>>
>>>> John.
>>>>
>>>>
>>>>>
>>>>>
>>>>>> reliable for me.
>>>>>>
>>>>>>>
>>>>>>> Just looked at this code to check if we also had a "Size" as I 
>>>>>>> remember
>>>>>>> seeing it in previous related patches, but we don't. If
>>>>>>> we did then you could use that to calculate how much you still 
>>>>>>> had to
>>>>>>> read, ignoring the \n. With the current scheme I think one
>>>>>>> way would be to continue the previous key when the line doesn't 
>>>>>>> start
>>>>>>> with a new key. Awful, yes, and not future proof.
>>>>>> Any new field is guaranteed to have a colon in it and any new 
>>>>>> section header is guaranteed to have a star in it. Sounds pretty 
>>>>>> reliable to me.
>>>>>
>>>>> that's what I said by "continue the previous key when the line 
>>>>> doesn't
>>>>> start with a new one".
>>>>>
>>>>>
>>>>>>
>>>>>> The other option would be to have an explicit prefix at the start 
>>>>>> of each continuation line. E.g. "A85:".
>>>>>
>>>>> let's not make it worse than it already is. And not future proof by
>>>>> given the encoding algorithm the meaning of "continuation line".
>>>>>
>>>>> Lucas De Marchi
>>>>>
>>>>>>
>>>>>> The problem with a size field is that ASCII85 encoding is data 
>>>>>> dependent - it has extremely basic run length encoding of strings 
>>>>>> of zeros. So you only know the size after the encoding is 
>>>>>> complete. Which means either the size field is in the dump after 
>>>>>> the encoded data (which is therefore useless) or you can't stream 
>>>>>> the encode and must encode to an in-memory buffer first, then 
>>>>>> print the size, then print your pre-encoded data.
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> John, I explicitly said *we can't break the existent users*,
>>>>>>> pointed to the one in the mesa repo and confirmed with José it 
>>>>>>> would be
>>>>>>> indeed a breakage. Please check again the past email thread at
>>>>>>> https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/ 
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>> That discussion was a question for Jose not a statement. As there 
>>>>>> was no response for several weeks, I assumed that it wasn't a 
>>>>>> problem after all.
>>>>>>
>>>>>>>
>>>>>>> Did you at least prepare the mesa parser for that additional \n?
>>>>>>>
>>>>>>> We shouldn't have merged the kernel patch as is with the excuse 
>>>>>>> it reads
>>>>>>> better in dmesg, when we also said we should not print that 
>>>>>>> garbage to
>>>>>>> dmesg :(
>>>>>> Not following. Should not print what garbage in dmesg? As I keep 
>>>>>> saying, none of this goes to dmesg by default except in the case 
>>>>>> of catastrophic CT failure. And in that case, it is extremely 
>>>>>> useful and the only way to debug issues.
>>>>>>
>>>>>> John.
>>>>>>
>>>>>>>
>>>>>>> Lucas De Marchi
>>>>>>
>>>>

