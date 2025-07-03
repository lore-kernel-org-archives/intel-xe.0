Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3120C83030
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 08:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C29510E7EB;
	Thu,  3 Jul 2025 08:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="St5j/qHd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3A410E804
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751531328; x=1783067328;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sj35D4miDRrWs164HT2RapX9Tb3tUZfok/Aqd5qmt3M=;
 b=St5j/qHdTDCudEi64R0NYlarbQsnQz5VmcWfE3yLvRae2Wm2eOM/QQQU
 FcKbyWBzLt/2UK4HvFH9+TrQ15OmHV1LEc41bQwq8W3OVJReaA145Zu1Q
 dX9aiXnhZN2+Sq7IAO79TPvq3T0vytQvfcxJldaUtCu4ZruCC2Cb6Aqyw
 I9+juu/oaCSrv6XoYVPihp1+V7KkS9ahAcbxjS3G4GK9nFCmmlXeb6Pfe
 sqvGyiYlOVS4RdYj2NQK9paaUw2duboPVf2O3/9KFFxb+GBQDlJfNVcOT
 KehAKIejuc4JPBox8JTqa9cfqLUbS73ybRuohCJ7PC4uQgNc/NndFRTg6 A==;
X-CSE-ConnectionGUID: RsD5eu7oQreCPxjQZHe6uA==
X-CSE-MsgGUID: ZAJeJRpAQ9+aAXB9YuY/Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71417323"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="71417323"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:28:48 -0700
X-CSE-ConnectionGUID: t4nJba3ZSMiIHK4ZtwupIw==
X-CSE-MsgGUID: V/HUUUAWSRWUYncXcwl7cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="159815875"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:28:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 01:28:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 01:28:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 01:28:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KpNFdSeaUb0ukebHh8DCLh/L5qDpaH6QORY5fPOF/HgR9YxDva6Z/ij7aDg7QwRmeAEgeTtWbve5KBR+EgdbyKYY86MM/gbMaaN/z6F1bJG+zEDVW+krTgBa7+/6bNQKlzCT7ufwJbn8TO61m53iQbpbnvyWXxKosZu3X5+IsJDCCt0nY0Q5oGMcBqvfpGNWfjvXvQLetY8xzmwdhKUbemdqn2F3dg+LAipaHOmEymoEpEc8BNBp0T2cOS8hueGqlkWiGhtXZX0u8WAymO/EWTaOJrmkGYcEByLq16RwhauYJsmUNeW0syWGXUwCSy1h7R16RWRXWjxQQGD9tqMZ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00Cbkb5VrVuqMjmeKNhRvE3R5Dlqony5FarPc0PBRW8=;
 b=GJMWkmSTs4H5GvUO5bgcpvGk5FCmfaV9wps1OGSv7DLy0QFsVFIAeS9F++TGMOZ7bcF+W9yt6v0evDNb5VXnfA7nxHUdP0sXhuPg/qtzUDNYrqZP7inzuoVN38xtAM7xajbGi1Jh0fAEkOIK47vYpZ4CcJpeJ1twgISaQHFzbhIhKPvhFBzPqz5PVUGiabaf0q2hS2IfFPq6rxPAA895f6r5clc8u+i/1+HZms6gQ5DvNzGAjYvVZVb1vYNG1ZnrXcc8X0lR/zawm4jFCPwIqut6fJ7eHYSMsQ+InrXIzA9i3esxSEGT5yFCQ2f6sksfl2KCt3vGJVXQ1um0gfVA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB7385.namprd11.prod.outlook.com (2603:10b6:208:423::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Thu, 3 Jul
 2025 08:28:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 3 Jul 2025
 08:28:44 +0000
Date: Thu, 3 Jul 2025 10:28:42 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Clear all LMTT pages on alloc
Message-ID: <20250703082842.6l452pp52ndx2vt2@intel.com>
References: <20250701220052.1612-1-michal.wajdeczko@intel.com>
 <20250702080231.givgpmcdn7qxjlrp@intel.com>
 <11cc0374-959c-4bee-848a-815fe33de4a0@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11cc0374-959c-4bee-848a-815fe33de4a0@intel.com>
X-ClientProxiedBy: LO6P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 733cb759-0320-4103-b6fb-08ddba0b9fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alRnUHYxemt4R0NOUVhUNmxmSjNkWk4raGlGaHZmZVRrWmxrdUZnV05pSktF?=
 =?utf-8?B?K2crWXllbFlzZGg5M1c4WEQyRjlYWm5EdDIwREQwS21wQjE3cHl4RXZsTTVS?=
 =?utf-8?B?MG9UT3o0M3Vvdk5JM0xOVUE5RnAwUHpoSGhocUxYQnB0bFErVnZ4clJiU2xF?=
 =?utf-8?B?cmFsNlFZSkFlQlBRbmVnV0lQRzUwdk02cWlDTUFwVWlFdElFYWVLV1pCeFdZ?=
 =?utf-8?B?QXM0NlZQSzNsb3dDZGMzOStVSnN3UzZoL2EyLzlFZndWeVJCcWlLNDVvdHht?=
 =?utf-8?B?U0NJTldudGE2U24zQXZpMVJBOGdreEJBZU5OQjRpeGNSSGRmUmUrZ0l2cHdK?=
 =?utf-8?B?aWg4U1ZPQThUcTR5emdNWmNBYnJ0NU1WWW5uQUE2MGl4eElnNW5hSjcyYzJH?=
 =?utf-8?B?TzNOcWlQbjFtam9rbFRVck5xTkoyQ2hOTEQ3OUgrNE42QjR6OWFObTlQTnF1?=
 =?utf-8?B?Rm84Wi9DRURlZS9pUVBoR2VoYnl4QjFQRXBGRndmMWJoUDRRRFE4Mks1K2FS?=
 =?utf-8?B?R3JVRDBlV2d3VTdkSmZtdXBZOW1wRWZqb2g3aUN3WDdXa2ZtUWxuM1V0OUpU?=
 =?utf-8?B?eGdHbHJMbzhBN2ZCUGFNYnRWRDJMNmphUFF5aVA3dE5KWlFEaDRvcDkvV2oz?=
 =?utf-8?B?QTRrdEVUOVdFS3hpVVZpaEhlMGFqOVNlYnBhcUN5K3VrSFZmUHlKd3NsbVFv?=
 =?utf-8?B?aXJDRVQyNE91NFZaM2VjaFkzWGNBWndzQW1FRGszb3BWOWlleDFud1gwUFdB?=
 =?utf-8?B?MkRrdUE0aW50Y2xvTkVxV2k1QWxNY0N5SGRmZVYzTTNxRVByWXVYS1RxRHdv?=
 =?utf-8?B?Vm8xYnZuNmsvY01JWTQ0ZnNobmxVU0ZTTEJ0SVlicTMxY3EzK1EzVDRaeTJV?=
 =?utf-8?B?dnd3VVNTL1F3YnF1dVdBSy91d29vMVhxZm5jMThrQU9yRktlYXFEclpjVmI0?=
 =?utf-8?B?S0NKM0xjRW9acktqSUMxRnQzN2F5WHRacnEwbEdhSGZVTVNJU3hYVDhNMGV1?=
 =?utf-8?B?bFlNV0Y1VTBoMDR4bDN6Wnc4VXI4bFlMbkQ4LzF6MTdlQTErTVFCTnlkSjZY?=
 =?utf-8?B?WUxaU215SURZYlB5VmlsODdXZ2IxWnhPeXo5dkJEQzIxZEdlMXlFUHJWVXhy?=
 =?utf-8?B?Q2N4M281d2N0K0ZRUDNIRjZmUXdzMXNwck51Y1lJU3FPYm1XcGJYQzNxL0tC?=
 =?utf-8?B?czNTS0VPNml2ZjZ4dE9LR3FwbjFsMVNlY2dQcnFheTAzcEJDM2wxcDZOeFBn?=
 =?utf-8?B?T0dpUGl0VjUvNjYxVWpqbGE0dXJueFlZUEtoZU9zd2g5dnlWNk1CQWQ3QzJv?=
 =?utf-8?B?VzZsODVnRkNHbjlFUW45NFZDWkJpSnZrWWpocFVJenVPMGZRREVqbldtNlJO?=
 =?utf-8?B?ME5IU3cxM0ZBazFjSXY1TmZOd1FLWnRhVUdDTUVWbm95dkpGRlowN1gxZ3JY?=
 =?utf-8?B?Y2hjbkhDSnhLRnlHRUJpRXIrUkJaUUJlL1BqNVpnUk4yeXkrNUJGbjc3SURD?=
 =?utf-8?B?dmcwaFB5dEdWK0xoQ0xyTDhMWWZ2dExseUlGMmhIYUlQWXZMZmQvWS9uYnpy?=
 =?utf-8?B?OXBPWW1DQjl1MFFCWUdRZ25RZjg5OXZQWmJVb3drT0VHVXlha2w2cWo2MEF6?=
 =?utf-8?B?YXRWbVlpMTlhSTl2OGpINkxabUFwdTQvRkVOajV2ZWdGRmRVTzNyMitMN2Er?=
 =?utf-8?B?YlZReVYzbEM0LzJBbFF5SXd3K2tHdVQvTlc5NXB3dElzL3RXRjIvazVEUW1k?=
 =?utf-8?B?UnBjaUdiL21ZUHJEMGEwRVR4dktGU2IyUzlHWHhYZkg5eStCYkl6SGlVakdL?=
 =?utf-8?B?bWVwSlRnS1Yza2hpQUE2RzdWb0NEMEFBeUtpczlnRWxMQUtteUpiK2pGZC9l?=
 =?utf-8?B?TUZWemNlb0FRUGd3QUowajJDMk56d1RNS0RFR3k0MnEyby83VEVRWE5yR3Z1?=
 =?utf-8?Q?7naE2YSRTpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1h5VDNoaEU1SEdBSS8zVFZIOFROMEdYdlVIemxBTjd5SjlDQlQvTTRRS0Zv?=
 =?utf-8?B?WTFPOWV2Q3N1RjZkQWIyZW1WcVQ1c3pLTkliTjMveWdFa2RGMHBkNm9KKzFX?=
 =?utf-8?B?ZE1BK1lIT3hBNWFtMDVDaml0UXFCOGxWR1NLQjh1L0lGbWhib1N2OUNQMTFo?=
 =?utf-8?B?MW05bFdUR2wrd3RFY3dZZ0xramt1ZWhvVEhxQ0tPMS9vMFZLL1duRlFvdDUw?=
 =?utf-8?B?cEVNRkNlLzdJc3ZvczZhZVpCNVo2OHVQTmtJNWFnMXA0Tm8wT2VndTh1UUxG?=
 =?utf-8?B?VG1Cdkk2WVZuM0lTRlR4cEZZYnNwN1FMdXE0dmtWWVBCQXlScFpUMWZLVElU?=
 =?utf-8?B?U0RKVEp6dUJiUk9zT0pUdTJBenNKcUtiRFRpeUx1eXRMTmdQK3phTndBQjhj?=
 =?utf-8?B?ZHlESjY5b21GUU0vRzMwWlc2N21TTm1tYkQ4V1JhdkQzTG8rOVRvRlZuR21n?=
 =?utf-8?B?ZlprS3FtdmZaSTJaZWxwc2hsa1paTWhsK1dkN3Nudm5CbG5Lbm9mYXpNcUdU?=
 =?utf-8?B?bTlZRDM4V2JZc2g5Ykgxdk9XN0R5R0xVaGtralE4eGxPYm5NNlhrMWg5Lzgr?=
 =?utf-8?B?c3M4OUJibnd1bHFKUHBIZnJyRXl4WTQ3cENWV0pwUVlrdVRJRUNkWDEveGU5?=
 =?utf-8?B?OHlXTlFIYm8zL08zbHJZYUxJZ0NJajFoVDc4c2NkOW44UjlzYlo5WW5zTm03?=
 =?utf-8?B?UlpIeWNYbTMvek9ibjI2VTBTSGIxK3A4MEsyZHhUVWxuLzZGTUl6YjRIWWJk?=
 =?utf-8?B?aWRBQTR2SEZyVWY1OHFSYlhnQk9GN0lDVm44eXpkbkFSQU5wQmZvM0svNWM0?=
 =?utf-8?B?UkFoci9HbVVPMkhCRzI2UEg1N0tBMEdCZWF1clNRb01TQkIwRFdjNm1GNG96?=
 =?utf-8?B?WDVMeTEzQlRERXYxNkNUUlJRT2lORTF5VGlNMXRKZW1udERqZzZjbitqcUdr?=
 =?utf-8?B?d1JrcHVOanpKMDhoTVNOS3lJeDFiT0lKZVVVVCthYVRkZ2E0K1gvbmYwdk15?=
 =?utf-8?B?bUxjV2pab1hoVk8zMVhObldxcjNtRyt0QUQ0aWZickpSR1ptUWoxcURHdTR3?=
 =?utf-8?B?b2xCWWl5N1dIZGlPT1VST2wzNzJtb2Z2SFFycEhKWHBkeHNHNzd6UjhqU0tL?=
 =?utf-8?B?VUV0eTM4NnVVYXMveTk2Qk9yS05LMncvbGg2dURaQ0F5enNHcUpiRGw4SUlX?=
 =?utf-8?B?MHdra2pFOTZ0eloxZ1d3djNuUWpEQnc2SlZEYWduZVMxaDZ3VjIrMFhNeVN2?=
 =?utf-8?B?UG5wM3E0Qm1aMGx5WG1HbCtQc0RUYzZ4N08rQjZPMmI2bUl5ekVjb1Evc1NZ?=
 =?utf-8?B?SlEyellwSUhjUWNMTUFUT3MzT2RUdysxaVZsVWNON0dET0pEMUZUL2RiWkMv?=
 =?utf-8?B?eUs5WE1sZ2kwUFZmWFU4YlZNSDlHZmtPNTAzc2c5a05KR1RnbG0vNnlBUEdW?=
 =?utf-8?B?K1ZRY0Rhd1h6QjJ0a0QyN1pSem1jUzdveGZsaHNsbHJJakRtNTBwQ3F1UFFn?=
 =?utf-8?B?NU15RUk1OWRaVzNldkVnWXlMWU1oU3EyMlRHWnhLRWMralZIMUMwamtYTS9k?=
 =?utf-8?B?WCtNUEoyak54NzlscGtuQXdhOVZoU3phbW5zd2VSV1Rpb0E2eVNIRlhHZlk5?=
 =?utf-8?B?U093RG5QajYwUGxsNUM1OFI2YkJ3SDJOYjJtUXorSVI3d1B2aExuU2tiTnJL?=
 =?utf-8?B?VzZZVENjMlczbC8ySVpKdkJwd2RqUE1qSkZWRVd2R3RxNmhwN3MrV2lxeXFr?=
 =?utf-8?B?VHhkaUFxTGw5bGdGdy80Q0tWMGJ6UlFYL0JmeTFvcHFnR2xwcDIrbFJqdCtI?=
 =?utf-8?B?UlIzcm9xQm5sSEtSbTdBUTJxUjJlREppTzhjOXYxYUNOdVYwYm9lVWlFcjJq?=
 =?utf-8?B?T0hhdGlKam5TeUhzMjRmNEhhbFpxdWZuaTJXZGxhUFlXZ3BDVWFCMElySU9o?=
 =?utf-8?B?TGwxcTJJalpXTjhYS2x2VjdIYitRSUxIYXpiMjB0YlBpaXMxdWNtcWxBTWFQ?=
 =?utf-8?B?MDgwaTJSMnJxdzNtcit6NUpHb00rSHFBTmdHRUxzbHp4cFBxSlUzcGRPRjI5?=
 =?utf-8?B?T21uZk1RTDc2U1hPV2RKMTNaZC9SN0k1WXJmSzhaWUhVS2E2ZmV1QnN1OXRO?=
 =?utf-8?B?Vjl3ME9iQTNHTGJvWmFRT3FkU1c0RVdJQmtkd0dyL1V2UU1tVkV3NEZET3dt?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 733cb759-0320-4103-b6fb-08ddba0b9fd4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 08:28:44.6348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8kEoS8jCk+ubuAAiytHUuM271Tzr8i8nBu4PFqMbCd6tj8XFPya1mUgEVQK4No5HI9F64HlHjpDVXmelO9OChgEGdJRxBQ5HXjRB3/mweg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7385
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lip-02 11:37:08 +0200]:
> 
> 
> On 02.07.2025 10:02, Piotr Piórkowski wrote:
> > Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lip-02 00:00:52 +0200]:
> >> Our LMEM buffer objects are not cleared by default on alloc
> >> and during VF provisioning we only setup LMTT PTEs for the
> >> actually provisioned LMEM range. But beyond that valid range
> >> we might leave some stale data that could either point to some
> >> other VFs allocations or even to the PF pages.
> >>
> >> Explicitly clear all new LMTT page to avoid the risk that a
> >> malicious VF would try to exploit that gap.
> >>
> >> While around add asserts to catch any undesired PTE overwrites
> >> and low-level debug traces to track LMTT PT life-cycle.
> >>
> >> Fixes: b1d204058218 ("drm/xe/pf: Introduce Local Memory Translation Table")
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Michał Winiarski <michal.winiarski@intel.com>
> >> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> >> index b56437a816e4..381f576036d0 100644
> >> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> >> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> >> @@ -78,6 +78,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
> >>  	}
> >>  
> >>  	lmtt_assert(lmtt, xe_bo_is_vram(bo));
> >> +	lmtt_debug(lmtt, "level=%u addr=%#llx\n", level, (u64)xe_bo_main_addr(bo, XE_PAGE_SIZE));
> >> +
> >> +	xe_map_memset(lmtt_to_xe(lmtt), &bo->vmap, 0, 0, xe_bo_size(bo));
> > 
> > We have a dedicated macro LMTT_PTE_INVALID
> > Maybe it's worth using it here.
> 
> this would require to introduce  {xe,iosys}_map_memset64() helpers
> 
> but at this point we only care about BO being zeroed, not filled with
> any specific value (like LMTT_PTE_INVALID which accidentally is also 0)
> 
> > 
> > I wonder why we care about cleaning LMTT only during allocation and
> > not in lmtt_drop_pages and lmtt_destroy_pt.
> 
> because at lmtt_drop_pages() we explicitly remove all references to
> existing PTs by resetting root entry at the PD level, so HW can't walk
> those pages anymore
> 
> > To be precise, in lmtt_drop_pages we do lmtt_write_pte(lmtt, pd, LMTT_PTE_INVALID, vfid),
> > but from what I understand, this is missing at the lmtt_destroy_pt level.
> 
> the designed flow is:
>  - call xe_lmtt_prepare_pages() to build PT tree with clear leaf PTs
>  - call xe_lmtt_populate_pages() to populate leaf PT with PTEs
>  - call xe_lmtt_populate_pages() to populate leaf PT with PTEs
>  - ...
>  - call xe_lmtt_drop_pages() to remove whole PT tree
> 
> since currently there is no way to selectively unmap any address range
> or change the back-end BOs, thus there is no point in doing selective
> clear of any PTE, except at the top level PD, which we do

Thanks for your explanation
In that case, it looks fine to me:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> 
> > 
> > Thanks,
> > Piotr
> >>  
> >>  	pt->level = level;
> >>  	pt->bo = bo;
> >> @@ -91,6 +94,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
> >>  
> >>  static void lmtt_pt_free(struct xe_lmtt_pt *pt)
> >>  {
> >> +	lmtt_debug(&pt->bo->tile->sriov.pf.lmtt, "level=%u addr=%llx\n",
> >> +		   pt->level, (u64)xe_bo_main_addr(pt->bo, XE_PAGE_SIZE));
> >> +
> >>  	xe_bo_unpin_map_no_vm(pt->bo);
> >>  	kfree(pt);
> >>  }
> >> @@ -226,9 +232,14 @@ static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
> >>  
> >>  	switch (lmtt->ops->lmtt_pte_size(level)) {
> >>  	case sizeof(u32):
> >> +		lmtt_assert(lmtt, !overflows_type(pte, u32));
> >> +		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u32), u32));
> >> +
> >>  		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u32), u32, pte);
> >>  		break;
> >>  	case sizeof(u64):
> >> +		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u64), u64));
> >> +
> >>  		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u64), u64, pte);
> >>  		break;
> >>  	default:
> >> -- 
> >> 2.47.1
> >>
> > 
> 

-- 
