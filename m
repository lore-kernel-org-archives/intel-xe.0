Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3E0C87FD3
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 18:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF9A10E308;
	Wed,  6 Aug 2025 18:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lP2P55Za";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65410E308
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754506238; x=1786042238;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Iaj7Uaqm7V5uvNryTPTxoPBEuFZhNoHQNEioN8BcjNc=;
 b=lP2P55ZafZO4I5yIHLSmC5djMlzAjxPatowg0EpJ1uM1uMSxzaz9/WYt
 eaDY+tIWruB8qFIP/oa0kLNzH2FS3ucmG4JJOC033b0HKXbOwV4gXWxLo
 Yi2Bbh8lvv9KHz7oZ1oa8XFSg5oL6tHgOOueyE8ONiTeSMi9c3mlVi7Vi
 5yTSmgqoOtAQ0588dR6M2D4fZvn+T3uIOAWJE8ge3otw4DlI33Sc5Vopc
 PNIYszz+ro6y1rUQJC+bgojo1wOJjGOYNhnGITJtnjwAgSFrsvi7kr8/B
 JjlCZNP+tc/1Acld1yL9YxA79uVZ6ZCB6nRhzZ4/Aw0N12ZybgTr16prX g==;
X-CSE-ConnectionGUID: 3SI8G+J5S0egkDRzrGrN5g==
X-CSE-MsgGUID: LZeo0zURRFSSwESk7ZxhXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="44426850"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="44426850"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 11:50:37 -0700
X-CSE-ConnectionGUID: MUF9IbnZTIGOGWsN+gq56w==
X-CSE-MsgGUID: lbVXLXuETZ+G2eusp6y3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164093627"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 11:50:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 11:50:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 11:50:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.89)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 11:50:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gj8NyJ25hmkD5pPfgEvZVnWZsr2RvqjLsdYa1hP0pjDeg9kB2YjVNF63grTc8NmoD8MnMTrpYdi+BH/NbneE19SXyl7lQGGWZ9mpmDEht4aaOo2Pj2DvyVl3Cu5iBIoPc3okUh9um/esg+1LcM8Ch4qzcHvJNPoWEsL/ecrI5rxyp6MkkF/U367XcY/CnUFpp2HANx1lfnv3yQTUMZuECalsdMdZqtpA0WJNREsgI769T/rB6fESCdcHwILEqONbJgrxnosaoHhlDW5hn+Xl4vj6iGE0+764jf5j1eYg2DoTYUwqHfH031yg1HAjBSd+d0kmAWRMs7R4k3aJFPpwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrtL3ARuivnNKTcexgpF8OsSnGRD0tByXoouCf6ZbDM=;
 b=UALFRPllKhk3XFVlgdTgyRs3N/jDn+XAo8ZK6CpxPUjLoT9McShpLHzHxBF98ffZ3WXxwEE0UA5nrWGJud5/gYaDX+BUsXGg+O1yMcRfFkQfS3kgLmyXd+5H9WKGb4UFSmJ+Uy23DbOi12oBoum8iEeccMpkGmgIMDeUlNIXfGA06MauvdtTCnaRTTXOcUADp52I0Z2mBvTWI3dnr46IJHWndAZ1I4ZAeS/SLm+k+kTJHqHncpBcsMv5WoC3doiXl19grziza4LvZfxVNm8ExY+0wI/2qcCLq/FLX+5UerbNU3Nh4RKrUxY7PA8+Omt/9bOIhKGHmn/qypCeX8fIdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 18:50:26 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 18:50:26 +0000
Message-ID: <34bc7ec7-eec8-4af4-b954-4c12d167a999@intel.com>
Date: Wed, 6 Aug 2025 11:50:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe/vf: Refactor CCS save/restore to use
 default migration context
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
References: <20250806082910.15845-1-satyanarayana.k.v.p@intel.com>
 <20250806082910.15845-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250806082910.15845-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0215.namprd03.prod.outlook.com
 (2603:10b6:303:b9::10) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f83bb1-8780-4b4c-5adb-08ddd51a1b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmdFaDRlWU9UdEhocVpENmg0dWo0dnBKMmNOcEhKWXZsZW5SU0d6UEpSWjdx?=
 =?utf-8?B?YXdKVThvd29GcUJJcTZPNmdkK00ySE4yL0ZVcFE2RHNWMUNmZ2swR0F6Vk00?=
 =?utf-8?B?dnFFOHVtcGZWTHRRWklJRkUwWWRWNWtrNFYzTThOUFRFclczV0lQa2UwTlBo?=
 =?utf-8?B?cEw4OUc1VU9iSWVRQkVTL2srTlhQanZwb21BSjV2MnlqTGU3Q0xxa05jL2Nw?=
 =?utf-8?B?dTBkUE5xUEh5c0lEem4vL0kxbHZ2MHJUd3dTYjdMcjFhdHg5YjZRZkRSeWVT?=
 =?utf-8?B?TkVyM04vS28yeHJvNVhSdDRDcUJLb1BKbkEvN1M5VG1KWlZmcVlQbDc2M1ho?=
 =?utf-8?B?VUpLdmxCTERtZ055YXRhVDlRM2dBQjFjVEdGL01LUTFvTWZLZkNTbkV1eU1K?=
 =?utf-8?B?MEsvR1FVREJiMDZza3RVYWl2KzhMZlRBaTdFRWswdFo3cjN1ck9pSURheGl3?=
 =?utf-8?B?Tkp5eSs5Mi9ydEJ0SGVvU0RCM1UrTzNsZFpRYkRHU0tWS0NQcnNNWTlQYzhm?=
 =?utf-8?B?ODE3dTI3RXhzK2JLVHJRMlZDd2djLzNwSlIzTlZpNzJFamZ3NjYreFA0cWpO?=
 =?utf-8?B?MWJyQ3QySHNZMTBoZW8yNlVVazIxaGlUYk45TEFvUG1WNjl1aW9ZNVdrcVhT?=
 =?utf-8?B?RHJqZEpNU25Ma01LWktTN255cUVTYVp6eSt6S21VTjBWeHl0NEk5OU5ucW5R?=
 =?utf-8?B?ODZwa2Fpaklzb0hiRFZ6dWZjZ2o1bGFkVHBydkZ4Zll5a091QmpQa3JxUU5h?=
 =?utf-8?B?a25oWXVDMU91bldQbFVhVlhOdlkzZXhkL2hZbGdWVmJCcmJjanljMjB4RW9O?=
 =?utf-8?B?M0NKdDVDdWRDZk9tN1M0UEtXNnZoK0lvTGVWdjNoaVhYcUpoOTZNcklJVUpC?=
 =?utf-8?B?MHFMT0hFNm9tQ2M3emNCeEJ0eklJL3puT0lnNUtWbUZkZFB1aGNET3I3SC9U?=
 =?utf-8?B?ZitjeURCMWJPTTF2bEZ6UnExc1BxWGVmTXZCTDFqWjNrbEIzWVUrcm84VUJ4?=
 =?utf-8?B?M2xreEJOUFRwMk9sT2N0MW9SNC9KM3l4eVZic0FucHZiNGRTQXhWNUtyKzc0?=
 =?utf-8?B?a3BmL0k4SEF6dy91MnpNcXppTEx4Q0Rpd3hEOHFBY3R0ZjFNUHJoeUllaFEr?=
 =?utf-8?B?TTNsemk1NnhhcTVkdUZNMFZ3cVl2L09PRjBlekg0TGdpUXVqNkQ3RDBTdjdq?=
 =?utf-8?B?TllxSWtyUG11NGkyU3FlbHNNNHZxQi9VTFkxaHRpdXJwa1hEWFVpQXpIRnQv?=
 =?utf-8?B?MFRoMkJOcG5BajdXNEd4YWVLNnN1TGNYWmdaTFMrdWFZR1dhbG56M0h0Tzgx?=
 =?utf-8?B?ZnVYUDRMdEFlUnJVT3pyUlk5UndOL2FKOEdxY1g0RHdIc1I5VTRGVmtMdXlH?=
 =?utf-8?B?dmZHbjgxUXFOVXlJYWtENm1SN3RGU1dvYWs4QW1JbjM5ak4ycG1sRXhldDVw?=
 =?utf-8?B?a3JCbkd3aFFvejkrUGVxWEVCR2RmdlJHRHRJbDVqbm5HRDR3RldnWFpZeU5K?=
 =?utf-8?B?ekZDR0dmRDcxNnRlT2NibURHRFlMRUY1R1FQa3lCUGtXa1BZZDFBWEwyenZK?=
 =?utf-8?B?R0pQYW1pMlV1eXd5bnljczEvajdFZ3VDc2ZWMzFsNmhFRlVBeFhjYWRjazRQ?=
 =?utf-8?B?S3h3aXlia0ljSGdHUVNSOFdUbElOYUg2Ti92b01QUUR2eURBVGJ0SlU4YURX?=
 =?utf-8?B?NW8vSllmanZCT0hocWc5ZjE3UkpwTndkWFUzM1BDVG9KeW42cEloUllvSmFZ?=
 =?utf-8?B?aFcweUFLWkMwTmxQMlZic1lvbFl0MFM5NUg4ZklTZWRGcmZHeEpaUnhlckhV?=
 =?utf-8?B?TU9uejlHVDFaQURjVmhwVUZsbjRqTGtoTTlEbjN4K2I4eDdHOUFRWHBRWDVO?=
 =?utf-8?B?TjNjd1Fzb1hpcVlLSTR4S1pFOGxVb2tCOGc1UzZ2WmV3eEM1K2pHU2xVcjEw?=
 =?utf-8?Q?g60WJa4eJoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VysrVDJUNTJrYUgwVzgzcHhxUjY4Qlk1a1drb1N1MjczamVDelJDZUFpdEYx?=
 =?utf-8?B?UTlRU0NmQ2tXa2gvQnk1cjkyQ2JXWkk4OG52d0VoRXhRbXcxR0RDcGd4YVNj?=
 =?utf-8?B?NjJ6RXYrSkdvQjdOV0QxYzVuSmNrenBZaFphVnUzcjByeUl5UTNsYUpFelZX?=
 =?utf-8?B?M1pOeDc4YVpKK3I1UmppUHVTc3ZOZ2pqSHJFdWdRQkhEd3F5M0JVY1dzTU41?=
 =?utf-8?B?aHZuMUNHbGxZbTJNUG9kL0hwOFlzMEo5S056YWhtL05OckRoSGRwSXZEZHdK?=
 =?utf-8?B?dGx2U1BxeC8vcFA1UjEvdGN0WXQxMTVVZlQrQXc4WU5RZ1NnZG1GanFMdWln?=
 =?utf-8?B?aDg2U29tMmVSR0V0Q0g1TFBlclJkQW15eW5ydnRHVTQ0a3pEczd2Zm5ZM3Jv?=
 =?utf-8?B?WlZrWldlaUFieGxTTEQ3c0ovNFdXS2x0c2V5Yk5aWWNqV2JpSnNJV090VXdF?=
 =?utf-8?B?dE5HaXBWd2JqUlBKbkh3cTQwUmtoQ3F3ZjZIR2FBbFl0Wkw4T0l0cDRRKzk4?=
 =?utf-8?B?bml0bEJpekVpcVJnUVV6Wm5qelVXUGJvdzdzanBjZVVRSHEvYysrL2oraWZN?=
 =?utf-8?B?dDRZRFFTekpZMjVTL1hITVNVSEZPVUVOVVc0dDNFeUdIc1dmcWJ3K1dISHRZ?=
 =?utf-8?B?Zmw0TGFGZHpaMjBERHFMZ3FlRGFrOUlpamRYMm5QOUxvVEFqdFB6cXZ2VGo5?=
 =?utf-8?B?Ynh1SzdKVDNlVS8yWU96SHdMay9tL0p2dnQrbDlMY29QRHJpcHFGdm9FaVNk?=
 =?utf-8?B?VHZUUVhBamRmN0lkZU9kN3lER2RiU2lkVzFGKy90eTl0UHdic0w0WUg3aS92?=
 =?utf-8?B?VDh6WUpOcFgvejAwM1FvL1FCVFBNaHppeHdZTENBSngzNDQ1U2taTjVzLzU3?=
 =?utf-8?B?blNnQlBYbGI0c0ZZRUFrUTJyZ2VGVzlHNzZHVTRwbWlWWkhMUjJrVVpzV1p6?=
 =?utf-8?B?TUxJRmhZVHNZdGZLbGo3SmNHeURzOS8xWkRlVWY2S0pxRFZBbUFxVzVPYjdn?=
 =?utf-8?B?V25hckVNdDdWdFVTUlArdC91MGdQRVhEVzJpN3hRTFJuUG4xTWdWVkorT0Fh?=
 =?utf-8?B?aG13T090b0Y1UHIvREo3R1Y0eE5qMnNkSS9Sd2RkV3JlcWtZWjJpc0hFQUIx?=
 =?utf-8?B?OFRWdFliNGJDU05heGEwRHlaYjZzZDhWby9JNllvL2JRYytKVERuckhqWTd3?=
 =?utf-8?B?WkxOT2RtUjhJWWxDRnJjVTcrK0gvd0RJNG00RFlFQjZZK2ZNSG1zT3lWTTdy?=
 =?utf-8?B?dHJXNWxqR29DR01ybFdGT1d0ZVppMS9DMHNyNHFLanErTWlwN2xIdXBsTHVP?=
 =?utf-8?B?TlhSM2JkS3p3cWhlM3I4SzhDcUVIR1hzZHdNb3ZMWVg5TVlOVE1DMDZPUitP?=
 =?utf-8?B?R0lPYlVpd2J6L0ZGU0dhSmlCRVdqVDE5V3AxWXl6ZFdQd2x1RFFMMExjT0xp?=
 =?utf-8?B?RkxkQ3c2RkE5b0NVUzVwV3dBbFFuYTdQRUpxbW1rRncwRy9LWVBOcVNSOWwx?=
 =?utf-8?B?VGRxVkVCTUxnaUp0WFFBMWJ3MnpOTTVMTFNBamlmVyswc3MvU2hzOGFUdlp1?=
 =?utf-8?B?S1Z1ZkRzMFFZVlhsUWRpck8zcXh1dXdrcXNKakJpRUlXdFJEZkpzeUNiaHVJ?=
 =?utf-8?B?SnBEY2VNRk1PNTYrcys4V09ieENjNlFYSmZTZDFNSHJLVWJudTQ5d0RDeURp?=
 =?utf-8?B?NXdZeWtEU09TZHZUeEx0cURidmtLSGtWRVo2UUtsTUhJSldNVHhKQ3M2ZGtp?=
 =?utf-8?B?L2RVcEhTc2ppbGpPOUZtdGw5alcwUWMzMWc2aHJCd2c4bzFoKzlhYUIxTzBQ?=
 =?utf-8?B?RXVoQkVoQjNrVUV4SkN1dk1aSHlFN1VWSVZMZVM4S0kxc1kySGhLNHJmMXNW?=
 =?utf-8?B?aTdnTGJtVW4yMVNBUzcwMkFMdTBhV1N5Ung5Z09jR2pJNmtuT2gyc24rM3Av?=
 =?utf-8?B?YVc4ZmNIdXVoellDZ0dnRTZJTHNJek9jVnc2WFg2TnEzbFJOSHZ2cm8zTmJn?=
 =?utf-8?B?ajhEVjA5Nm5oUW9Pbnl6ZjhINnE2cW9zVW85RHNuNWtoUzk2MG1kZnc4cXZH?=
 =?utf-8?B?NkJJLzdHYkhqN3BpNnUxZWRNd1pPd2tlZnlSdGlYcE52VHhWbzRrUzNnOTU4?=
 =?utf-8?B?UnpDMEtEWWpaekxaVFRKRmhoRmNJTUowenpDMGsrcXYxbjNxVTlPRlQvaUI1?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f83bb1-8780-4b4c-5adb-08ddd51a1b6c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 18:50:26.4147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kjp+CyHZwxsvANKQ76f0xn17/SJjEPh3KvyP6NSQvX9aJFFV22SXAnu9352GwU8E/QGPS0E/3rWygP02yTE7VX4Wbgzf6wcffuPO9eK2sA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

On 8/6/2025 1:29 AM, Satyanarayana K V P wrote:
> Previously, CCS save/restore operations created separate migration
> contexts with new VM memory allocations, resulting in significant
> overhead.
>
> This commit eliminates redundant context creation reusing the default
> migration context by registering new execution queues for CCS save and
> restore on the existing migrate VM.
>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> ---
> V2 -> V3:
> - Fixed review comments (Matthew Brost).
>
> V1 -> V2:
> - Fixed kernel-doc issues reported by patchworks.
> ---
>   drivers/gpu/drm/xe/xe_migrate.c            | 18 ++++----
>   drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
>   drivers/gpu/drm/xe/xe_pm.c                 |  3 ++
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 49 ++++++++++++----------
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  6 +--
>   5 files changed, 43 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3a276e2348a2..7d3c7c4e2185 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -960,14 +960,14 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
>   	return migrate->q->lrc[0];
>   }
>   
> -static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
>   				 u32 flags)
>   {
>   	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>   		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m))) |
> +	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(q->lrc[0])) |
>   		  MI_FLUSH_DW_USE_GTT;
> -	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m)));
> +	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(q->lrc[0]));
Is it worth keeping a helper function here to abstract out future 
changes? E.g. "xe_migrate_lrc(ctx) { return ctx->q->lrc[0] };". Using 
"q->lrc[0]" everywhere seems very like magic number usage. It is not 
obvious why that is correct given the very generic naming.


>   	dw[i++] = MI_NOOP;
>   	dw[i++] = MI_NOOP;
>   
> @@ -976,7 +976,8 @@ static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
>   
>   /**
>    * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> - * @m: The migration context.
> + * @tile: Tile whose migration context to be used.
> + * @q : Execution to be used along with migration context.
>    * @src_bo: The buffer object @src is currently bound to.
>    * @read_write : Creates BB commands for CCS read/write.
>    *
> @@ -987,7 +988,7 @@ static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
>    *
>    * Return: 0 if successful, negative error code on failure.
>    */
> -int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>   			   struct xe_bo *src_bo,
>   			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
>   
> @@ -995,7 +996,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>   	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
>   	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
>   	struct ttm_resource *src = src_bo->ttm.resource;
> -	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_migrate *m = tile->migrate;
> +	struct xe_gt *gt = tile->primary_gt;
>   	u32 batch_size, batch_size_allocated;
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_res_cursor src_it, ccs_it;
> @@ -1078,11 +1080,11 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>   
>   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>   
> -		bb->len = emit_flush_invalidate(m, bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>   						  src_L0_ofs, dst_is_pltt,
>   						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(m, bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>   
>   		size -= src_L0;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index e81ea6b27fb5..9e20da6d58c2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -124,7 +124,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   				  struct ttm_resource *dst,
>   				  bool copy_only_ccs);
>   
> -int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>   			   struct xe_bo *src_bo,
>   			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 44aaf154ddf7..5e8126ca8e27 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -209,6 +209,9 @@ int xe_pm_resume(struct xe_device *xe)
>   
>   	xe_pxp_pm_resume(xe->pxp);
>   
> +	if (IS_SRIOV_VF(xe))
> +		xe_sriov_vf_ccs_register_context(xe);
> +
>   	drm_dbg(&xe->drm, "Device resumed\n");
>   	return 0;
>   err:
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index f0ca2a9b2bb7..a87f39eae4dc 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -8,6 +8,7 @@
>   #include "xe_bb.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_exec_queue.h"
>   #include "xe_exec_queue_types.h"
>   #include "xe_guc_submit.h"
>   #include "xe_lrc.h"
> @@ -168,7 +169,7 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>   
>   static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
>   {
> -	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> +	struct xe_lrc *lrc = ctx->q->lrc[0];
>   	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>   	u32 dw[10], i = 0;
>   
> @@ -183,13 +184,12 @@ static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
>   	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>   }
>   
> -static int register_save_restore_context(struct xe_migrate *m,
> -					 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
>   {
>   	int err = -EINVAL;
>   	int ctx_type;
>   
> -	switch (ctx_id) {
> +	switch (ctx->ctx_id) {
>   	case XE_SRIOV_VF_CCS_READ_CTX:
>   		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
>   		break;
> @@ -200,7 +200,7 @@ static int register_save_restore_context(struct xe_migrate *m,
>   		return err;
>   	}
>   
> -	xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
> +	xe_guc_register_exec_queue(ctx->q, ctx_type);
>   	return 0;
>   }
>   
> @@ -225,7 +225,7 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>   
>   	for_each_ccs_rw_ctx(ctx_id) {
>   		ctx = &tile->sriov.vf.ccs[ctx_id];
> -		err = register_save_restore_context(ctx->migrate, ctx_id);
> +		err = register_save_restore_context(ctx);
>   		if (err)
>   			return err;
>   	}
> @@ -236,13 +236,14 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>   static void xe_sriov_vf_ccs_fini(void *arg)
>   {
>   	struct xe_tile_vf_ccs *ctx = arg;
> -	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> +	struct xe_lrc *lrc = ctx->q->lrc[0];
>   
>   	/*
>   	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
>   	 * submits this context to HW on VF pause after unbinding device.
>   	 */
>   	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
> +	xe_exec_queue_put(ctx->q);
>   }
>   
>   /**
> @@ -258,8 +259,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>   {
>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_migrate *migrate;
>   	struct xe_tile_vf_ccs *ctx;
> +	struct xe_exec_queue *q;
> +	u32 flags;
>   	int err;
>   
>   	xe_assert(xe, IS_SRIOV_VF(xe));
> @@ -270,27 +272,25 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>   		ctx = &tile->sriov.vf.ccs[ctx_id];
>   		ctx->ctx_id = ctx_id;
>   
> -		migrate = xe_migrate_alloc(tile);
> -		if (!migrate) {
> -			err = -ENOMEM;
> +		flags = EXEC_QUEUE_FLAG_KERNEL |
> +			EXEC_QUEUE_FLAG_PERMANENT |
> +			EXEC_QUEUE_FLAG_MIGRATE;
> +		q = xe_exec_queue_create_bind(xe, tile, flags, 0);
> +		if (IS_ERR(q)) {
> +			err = PTR_ERR(q);
>   			goto err_ret;
>   		}
> -
> -		err = xe_migrate_init(migrate);
> -		if (err)
> -			goto err_ret;
> -
> -		ctx->migrate = migrate;
> +		ctx->q = q;
>   
>   		err = alloc_bb_pool(tile, ctx);
>   		if (err)
> -			goto err_ret;
> +			goto err_free_queue;
>   
>   		ccs_rw_update_ring(ctx);
>   
> -		err = register_save_restore_context(ctx->migrate, ctx_id);
> +		err = register_save_restore_context(ctx);
>   		if (err)
> -			goto err_ret;
> +			goto err_free_queue;
>   
>   		err = devm_add_action_or_reset(xe->drm.dev,
>   					       xe_sriov_vf_ccs_fini,
> @@ -301,6 +301,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>   
>   	return 0;
>   
> +err_free_queue:
> +	xe_exec_queue_put(q);
> +
>   err_ret:
>   	return err;
>   }
> @@ -319,7 +322,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>   {
>   	struct xe_device *xe = xe_bo_device(bo);
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
>   	struct xe_tile *tile;
>   	struct xe_bb *bb;
>   	int err = 0;
> @@ -334,8 +337,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>   		/* bb should be NULL here. Assert if not NULL */
>   		xe_assert(xe, !bb);
>   
> -		migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> -		err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> +		ctx = &tile->sriov.vf.ccs[ctx_id];
> +		err = xe_migrate_ccs_rw_copy(tile, ctx->q, bo, ctx_id);
>   	}
>   	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index e240f3fd18af..1add0541aed8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -41,11 +41,11 @@ struct xe_sa_manager;
>   struct xe_tile_vf_ccs {
>   	/** @id: Id to which context it belongs to */
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	/** @migrate: Migration helper for save/restore of CCS data */
> -	struct xe_migrate *migrate;
> +	/** @q: exec queues used for migration */
> +	struct xe_exec_queue *q;
Should this be 'migrate_q' or some such to identify what its purpose is? 
Just calling it 'q' is very generic and open to use by other things 
(accidentally or deliberately).

John.

>   
>   	struct {
> -		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> +		/** @ccs_bb_pool: Pool from which batch buffers are allocated. */
>   		struct xe_sa_manager *ccs_bb_pool;
>   	} mem;
>   };

