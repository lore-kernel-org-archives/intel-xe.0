Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38611C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 12:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4C510E7D3;
	Mon,  7 Sep 2026 12:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VknoXQh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1A710E7CB
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788784731; x=1820320731;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gomjvIcLFjyaU52dCybEMYsNkLMgPMa2NQH1sN/KBd0=;
 b=VknoXQh19Xx11LH6ejqTuftm2EcIwgcUiMtR7wCl4KirAx9Uaa3HqrXO
 +A9ncu55T81sb2hBPQz1ZhS5RWeAdMDdXSuMOfJzr9vuq0WEsn0wmXUfU
 tkW9si/JTFQA5kGQ/RWRdXU8Lhue2/yXjaYffoQi7fEXYsVonnM79BmNE
 L12B1o8Ux0MfzoLAfbFK6tuugkh89aBR2rYJTlLsZPr3/NEbJeV/2d/T8
 28T8eiiSgKThyFfeLZu8s0Py+r7l7JNTmW1toWa7X29DugTmHSkvMQMGu
 inP9VUvNuWZfAjEvsm4awRr9zBM1bewJzxHTrMuR60irm7xgulKhZYmVW w==;
X-CSE-ConnectionGUID: tJdd1N6DRp2ck4ByzKTNnQ==
X-CSE-MsgGUID: F9dq4M8HTnSGVJGCn1NF+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89219612"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="89219612"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:38:51 -0700
X-CSE-ConnectionGUID: 19mi8mdjS3iaqV/EoBwL2Q==
X-CSE-MsgGUID: TNZcKBP/SbWO6gQjKwPuwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="271213849"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 05:38:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:38:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:38:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P465JGIXMoYHqL2AhqPTQvm6WE0Vbkp2TMriXprWvpF2GRv1CHiAMoIDpAUI6TdNrYMefNiJiH29g7leCLrZ8E4TdUVxVXky7TUVbA+mvBrAiCGlyGIvk1I2Vz9AYTE2RfKrAfLtRDj6MCNi49VnVTeXGtUTkgzXJ+GgNLNrFP0Iun0y4oXBiLxpQdASbl9VdwQSK6DJ4mA3NtsrhELTE5SCsq/Td+KxKzMMx5+Z6xOTmll9JhSmdLecoiYEA/Si4xWcrmLafPXEsYZ67deghAb0jXQ9RZ4eTne/4wooRPgDlcrbmO2LA0YBAgE0rzEQWAKnwHhdP/URZkAmjRVWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mozXPcwm8LvIAlMKjiV9XzCm19+9/iHQtjfK1DnLYpA=;
 b=cgOuJNtLrXumIOSJTxrMv84INP0bLl6nmT0AMOQREZz6BlbJdp8UmRqNVThJZla2Th8T6s3H+z5ByOsZj4ymagvScgzMX+xTWqUa0kaju1n4Te5QiUIDJzx8PeYwdoslxka0Asvg6OsvJKBNYr/pOp2qLZkCwrtbxJEiFufTqkdYN/9BRHG3SOs92+dWEK+cS13i/l309DEAHYcGrIEI0jmh5cICa4CNrR9vTegYEb9jECIiOjvSgIghrbrZB6VKFmHKjwq88yR800ybMWA8PjyPjnddr6kMC2F81qe32OwPNPDCWoc/AIsfqXU8p/ycWJ/I8oMol5rklHVODSAe7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:38:42 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:38:41 +0000
Message-ID: <c18194ec-cefb-44f6-9338-7470bb7a8ed2@intel.com>
Date: Mon, 7 Sep 2026 14:38:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] drm/xe/cper: Hardware error CPER reporting from
 xe_log
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-15-badal.nilawar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260906172604.2215987-15-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::22) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|MN2PR11MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c7cf0d-f665-4aae-46af-08df0cdcf2cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7IwnJFIp8ya12Rj0/O80d+2ag1l/eP4lXNYTFRY2cwmAhCAyJ00lI/BxK+iesDdWbyKJpgTxLnGlIsBa8JoWqiYgFyryAhy0Pr7HDyauO/Xliw0WMJEJLrMUzhxOh9LFPgd7CNVf5xG5/x5z/H4NtXkY8mWjnyZY5/a2Zm4c5v7QpFPIPP5cPLrTXA4ClTHGz5Tk1a4dkXd5quoBC7F5MUYf9ekq6pSG6UdgGE2t62g7GO+NffhK14AsJhaonOM+fA74KOGXf0O4ena49AS5EcRv152uGqVudvdaDJzTeZpRtJ7AxMzBXiCia4o1Dp1rxDbmlhuZ8gdquZdmIyHKrdoHxdkD2TBLmAi8r/VMNZmtjU/9VpM5UibTWYPUbM5P3+fIFJuplRXvRlL0h9KzKxNAHSNK2rK2iE2122MR2kxNR+rOGkK2wPNymN1lZjkU2NfC2ZU4avdJi/3Ai3ai9McY+vuVu5L4cA8HtB0VlCUuQcbGng93hA6JV88k1CYfyJg8Sg3a30agqAsLHwCSwmJtANo9/OQsn6EKVZc03csVnkN98hF5lrfE/hFXOb3mHU6lyKCYDJcZA0FeN9oD9tUDR7U8h/ETIVqhjCCNi3kDp+l3ggW4iezqb3j7W+awwTWJKIH8HDePpzPggkUuFbs3zPjHfrrkNmWjEEwKVXs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkhSNGZQaWlsYjVaSzB0b1JnRjZqMFAxeHZUL1ZVdjgzb0NGMGZjSUpPNWxC?=
 =?utf-8?B?czZmUHBYYVpqM203U3FPaFQyTFhVQWVGMFU1MkpXMmFHNy9OdUZoeXZCKzdr?=
 =?utf-8?B?TUd2bjF1ZTBTVkxxWkV6VXowZUJkOVRIT1k5dCtDdXQ5bU1FdlZkQTZINzdT?=
 =?utf-8?B?bG1NRXJnc1R1SVdTQnRxaEtMMkozeVJiTWRHV1JoRHQ3VTFWQTk4RU8rNkpE?=
 =?utf-8?B?ejZuem9yUUpJWDN3N08yZ29wL2pkNGhLSW1YYU04eVc4SjBoVWxOZEx3WnJh?=
 =?utf-8?B?UytacU9JL2JsN3pNQzZHdFdBQW1PalhQUlB6TUpnU1BpOHkxYlZhMXNnRlFa?=
 =?utf-8?B?MXA1RlpGUlpkclR4QUI5cTNSb1hlK3oyNVEwM20wSVVtZzA3SnVQUGtCUG5n?=
 =?utf-8?B?Uk9TemZFMXdON3BMSzVNdS9XK210MldtQmcrZ3FKcFBwUzBtUjByQmgweENt?=
 =?utf-8?B?SEcyNm5yM0FJcHFjNUpySEtJY2U4bi9KSUlQL09aRGMrUUV5Q0lZWVNFbCtX?=
 =?utf-8?B?UkZlVjhpNUFobUhOUjVhbEZJU2g0aXJWNnNSdjlkS3lZaStHY3hmNjNBY1c0?=
 =?utf-8?B?RkQ3UURjWWtlNFA0NXN2dkR4dGZ0dCsvZlFaRzQyU1JKaVZwQTdIY2VNSGdQ?=
 =?utf-8?B?OGt1ZWVuQmxFbmJhQTJyTmoxWDI0dHlmN2V1eVRyem1pN2pQUUl6WHJIWld3?=
 =?utf-8?B?R2U1QVlMNE8ycUI5c09NTnJMVWZnNytqK1V3ZkFiUFY2S2JOUUUxZVQ1cUFo?=
 =?utf-8?B?Nk43TXNMM2IxZmFNcFduajBaM3VJTHFjaFRRcHFEOEZNcFhWb0x6d3o5UEVh?=
 =?utf-8?B?ZUlwSmpNTk1KcE5YRm1qV3c0c3lDMXhzU3p3SVFERzdQNEdOV2NTeHFFMDQ3?=
 =?utf-8?B?aG1YL1FrdzZwL3VKdmorekpES2FmQ2k1S1MxWDZWSU84WFA1VkVHdzgwSTlV?=
 =?utf-8?B?N214Qk9YSGFPaE5MVThrWnVoYUdqSTlzWk4weThHSFBpWDhVQUR0WUc2QTRW?=
 =?utf-8?B?OUdBTkl5SWNpTWZ2Qk9FZkVuSU5hSEFrb2NTSUt6QTlQZnh4d3JPT0xESlFH?=
 =?utf-8?B?OEVUNUJSMFlXdlZGdGlRcmJLVEM2bDNjbmx1QzMzd1ZhSG45WUhCL091NHhJ?=
 =?utf-8?B?UmNZU01sQWZuaCtKL0NYS3lyNEZmQjRpM2NSbisxbzA4b2J2QmU5eElXZUYr?=
 =?utf-8?B?eFc0ckZYcUM0NkJmeCtsbVpsZGkwRTRLQmdMR2RiUW1UckMwcTVqZnhZamRh?=
 =?utf-8?B?a1h1SW82cDAzWEptZmszOVhIeUdNL2FuRGRqQi82aHlaakpsSlMzQ0JaU2o0?=
 =?utf-8?B?OXVLb0N0TUE1N1c2UnYxa0dBaWRoZXVSMXRWaFppRjc5eUpmN2svNmY1MUYy?=
 =?utf-8?B?aTBHb0UyeGRXdUY5WGIxeW1qOUpwSnFSelpXU1hSVEJFY0VTZkwwem9KNVBP?=
 =?utf-8?B?dzZyaFJvT01wY0tQSjZpTGJDRXhtcHNOY3NINUZUK01jSDhjUy9KS0pmd0hM?=
 =?utf-8?B?TFdObHhtNURkOFI3cFZjeEhpRkVWVG04K2FWU3NvTkhJenZZZG1tSWFlMFYw?=
 =?utf-8?B?WU5OZUx3WlcwVjFqNTkzbllDZ0RNWU90TWxkMlJKZ2txQmR3aVR3YjBjUFNH?=
 =?utf-8?B?cndCSDhJclliSjhJZHlQMnVCdkI0SGtaeW8vSmRrS1R2aXdITTJYM3RjUS82?=
 =?utf-8?B?REhRQjlySE1ldUhMekZub3Z4UUxjSXgzak0yVEJxaE5veVNnK0ExeFNTV1pl?=
 =?utf-8?B?bE5PWUlWSW14NUZUNEU2L1JEYzExTDhSdVBKR3Zxckw4UlQxaXB3OXl3Mmtq?=
 =?utf-8?B?eUNUb3AveUordjIva1YzclFwaGx0LzFsbkVtcGxMaGxaK2M3MVh2OEtJZ1o3?=
 =?utf-8?B?UEVlYkMyZkMvTG1nUW9sSVBEVjZYei8xbFhrdkR0eUlicEVNMzgyeVlDdDUw?=
 =?utf-8?B?QXdhWElwMGZaMStEMTlzcmlUWmVqWW1xOFFHSHlqUVBJY2dnRlVUMEU3THBZ?=
 =?utf-8?B?WE4waDliMExlVk5icFE4bGJOWFM1RmdpTnB4bkFVZUZCMjdqb2NBMi9CaUpD?=
 =?utf-8?B?blhnZmg5eGxpdks1STArQklKWEo5QlJnLzM1NDUrTHVQYkcrdVNvUUFVZGh4?=
 =?utf-8?B?SXlhams5eFdNc3RpN3J0WGRwOEdhTEhQYVJvUnlSZjg5cHZCQ05rZnJJM0o0?=
 =?utf-8?B?bTBhWEdEK2ZtUENwUnlJbUo3YWxRTWhnai9KUWRYSmN6Mkk5VnVmMlFRTUw1?=
 =?utf-8?B?SmRWOG9Zd3lqY1o3K3AzWmhrNDRaNFc4TW9aNzdZM0F5LzkrZ2xZdUY5bmRJ?=
 =?utf-8?B?Z3NLU09pM1lsN28yeGhLU0xFMmN5Qm1BR3JPL2R6VnJnOGcxTTF4WGZ1cXZC?=
 =?utf-8?Q?0jeuJO9CrOTRZy2I=3D?=
X-Exchange-RoutingPolicyChecked: kRXpHVF6ZwGxBClHV384QSBr19H2KLdBFEuDh8vk0cKiaZXbc64aBE7D5k4IJpAZRVZaqiCgd8fqlgnhow19VhKvsp/KfiGKGhg/34Psbbln7L9ls1EMQJAVRYAvG7D0h8nzeNlTqIfGcbLVPlullN5f6MdSN8IkDz/ibO8RDJaoKGt411fv3R+zDJULk6LDGW127aDpuzgX2Im7KmWgHzPDIm2oe42Puz3bwPehluAZSoMaSSZJMIfqpqCOEiZixwBv4kjxK1EUwLt6H2+6fGckaS1gnB5bnQejLsg/tKB6zSAyWc+nPipq8fAEtemkP3d0qI/McNXpzuHMr4hPTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c7cf0d-f665-4aae-46af-08df0cdcf2cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:38:41.7480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3oaY7WcHYScO713vtaVIRVWKIn97kkkpTiaq7V065zOkzECHasYkoxyGQaybQt9jwyYWmJA30eSY9DNOxFVNC77N76ckI2MoGHIUwJk6rw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
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



On 9/6/2026 7:26 PM, Badal Nilawar wrote:
> Introduce xe_emit_hardware_error_cper() as public entry point
> for CPER reporting.
> 
> Wire xe_log to route hardware SIGIDs through the new helper.
> No functional change is intended yet, as the CPER emission logic
> is added in follow-up patches.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile  |  2 ++
>  drivers/gpu/drm/xe/xe_cper.c | 37 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_cper.h | 25 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_log.c  | 17 +++++++++++------
>  4 files changed, 75 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 67b8b5477639..06b064add77d 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -166,6 +166,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
>  
> +xe-$(CONFIG_UEFI_CPER_X86) += xe_cper.o

shouldn't we use just CONFIG_UEFI_CPER ?

> +
>  # graphics virtualization (SR-IOV) support
>  xe-y += \
>  	xe_gt_sriov_vf.o \
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> new file mode 100644
> index 000000000000..e8017e3ee3a0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/pci.h>
> +
> +#include <drm/drm_print.h>

do we need this?

> +
> +#include "xe_cper.h"
> +#include "xe_device.h"
> +#include "xe_ras_types.h"
> +
> +/**
> + * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
> + * @pdev: PCI device associated with the Xe device
> + * @cper_sev: CPER severity
> + * @sigid: Error signature identifier
> + * @error_class: Hardware error classification details
> + * @response: Response of get counter
> + *
> + * Emit a CPER record for a hardware error
> + */
> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +				 struct xe_ras_error_class *counter,
> +				 struct xe_ras_get_counter_response *response)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	if (!xe)
> +		return;
> +
> +	if ((int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START)
> +		return;
> +
> +	/* TODO */
> +}
> diff --git a/drivers/gpu/drm/xe/xe_cper.h b/drivers/gpu/drm/xe/xe_cper.h
> new file mode 100644
> index 000000000000..c4be7f25a369
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_cper.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_CPER_H_
> +#define _XE_CPER_H_
> +
> +#include "abi/xe_sigid_abi.h"

maybe just:

	enum xe_sigid sigid;

> +
> +struct pci_dev;
> +struct xe_ras_error_class;
> +struct xe_ras_get_counter_response;
> +
> +#if IS_REACHABLE(CONFIG_UEFI_CPER_X86)
> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +				 struct xe_ras_error_class *counter,
> +				 struct xe_ras_get_counter_response *response);

since you're introducing xe_cper component, all its public functions
shall use xe_cper prefix:

	xe_cper_emit_hardware_error(

and since all HW errors are expected to come from the xe, no need for pdev:

	xe_cper_emit_hardware_error(struct xe_device *xe, 

also it's better to let the caller pass whatever data was given in xe_log macros:

	xe_cper_emit_hardware_error(struct xe_device *xe,
				int cper_sev, enum xe_sigid sigid,
				const void *data, size_t len)

and do any data validation/conversion inside xe_cper code

and since xe_ras_get_counter_response is now optional, just define another function (when needed) that takes already validated data:

	xe_cper_emit_hardware_error_details(struct xe_device *xe,
				int cper_sev, enum xe_sigid sigid,
				const struct xe_ras_error_class *counter,
				const struct xe_ras_get_counter_response *response);

> +#else
> +static inline void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev,
> +					       enum xe_sigid sigid,
> +					       struct xe_ras_error_class *counter,
> +					       struct xe_ras_get_counter_response *response) {}
> +#endif
> +#endif /* _XE_CPER_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 5549ef6966fd..2957adec41aa 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -8,17 +8,27 @@
>  
>  #include "abi/xe_log_abi.h"
>  
> +#include "xe_cper.h"
>  #include "xe_device.h"
>  #include "xe_log.h"
>  #include "xe_printk.h"
>  
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
>  static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>  			  u32 component, u32 location, const void *data, size_t len,
>  			  struct va_format *vaf)
>  {
>  	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
>  				   component, location, data, len, vaf);
> -	/* TODO */
> +
> +	if (is_hw_sigid(sigid) && !IS_ERR(data))
> +		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
> +					    (struct xe_ras_error_class *)data, NULL);

you shouldn't blindly convert data to xe_ras_error_class
you shall at least check if len == sizeof(xe_ras_error_class)
and IMO it would be better to move that checks to xe_cper code
(as maybe we can still emit some CPER records for ERR_PTR data?


> +	/* TODO software CPER */
>  }
>  
>  static const char *log_unknown_component_prefix(u32 component)
> @@ -100,11 +110,6 @@ static const char *log_location_prefix(struct pci_dev *pdev, u32 location, char
>  	return buf;
>  }
>  
> -static bool is_hw_sigid(enum xe_sigid sigid)
> -{
> -	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> -}
> -
>  static bool is_sev_error(int cper_sev)
>  {
>  	return cper_sev != CPER_SEV_INFORMATIONAL;

