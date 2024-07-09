Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F40AC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 19:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E13D10E640;
	Tue,  9 Jul 2024 19:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QM5dQFGX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3488610E640
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 19:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720551967; x=1752087967;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qG1GHFDWZ91Gc6wq8V0LJC75JaGrFPw7jZkva2zsrQs=;
 b=QM5dQFGXykcftAOFxO5zqYtPRcXZkFODkSWcKMCkdleF5fJZuT8IhR80
 cnctD7RJ4bTFeZQCIfLQ5BbQICu8rQ2oI7OwMGH9ophnBie3yIcQ3+/Q8
 BePFUukzVspgR4+FciBagvKkUZZxtdYsE50rFtktrsuVAzPEBz5kS8B5K
 f0Vv6r9xeqpkG1d6h+qt1DV6T+wB5azWVdlJPv1V0kB2wHQAJpbAF2ILE
 j8Jw4m/Ld3s0bGlediJ8F3eoJiirDs6xn1y3xS9wGxP805TrzSPk3OVN7
 x+AFKN9V3/pZGiDgPPifkaaC+o83JdB+SOGHpKGPEmgboqva7cCX6dq2n Q==;
X-CSE-ConnectionGUID: ipVON4qTTOSZ77aylkHtLg==
X-CSE-MsgGUID: ZCcVIheeRzKrA7y6+SGrug==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29228013"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="29228013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 12:06:04 -0700
X-CSE-ConnectionGUID: w8Viv7j8QbK912VO+n76RA==
X-CSE-MsgGUID: P3qU78jtTfKTo6Rlt9VZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52357588"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 12:06:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 12:06:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 12:06:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 12:06:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BfHdwBN+IK61af4E8J+C/PNkelz4+mz0p/auhqVYlQHgNJqw7Eq6vlJf6yPR+EbFndp7swMa9s0w4q3jQi+ZGzbWDo0AyhW1kHgnGEULWJAJM3RdTDAQxo/08IABedyxeVXdic0UGpJqzq7q/FVgQidjCmYhJT0sP1Zoc5d+QjXKM5UI+OAzWNA8P2gLVajooUQhbtuXhWF+CpnNvPNZQ7h8YdUOu8b0RrS0AfFbHU6cwB1/wfC9Bnhn5k1k1OwwBPGlUouyK9p3NIBGQIKurn9hdTrAiGsS9biiSrI5QPw222T7Qgi6U0Dnvfoj0L9Z6rPcPuzGl5n3jdMOnDiDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKF82QqafuYbtF9xjwR3GflxXXmZDrbevAPCKV7iKbY=;
 b=E4lA/2O/o05BKh13z8pkj9vyH0P+ZllSoL1+6Mx44+E6QeJshXXxCYKBOxXJfec237XbPYsOUaZLykVfTfJ/H3rQdQBnOnDU0Gi4j3k/jtZo3r9y1WwLXatgpJw1WneUdPzR8Mf4UpaBJIp1JUa/V1graiZZbOQeRUBdI08oibeRA42HvmzkokkQ+9fP8j3HLPtkIeW+CKvQ8U2p106C4y8uVYSufzqm/chzJ+AMPKTgivCRSBvlpFk1nY9m8b0CAEmTzBlB8my1gD/TK5tdYvA8sP3NaTfNEznI5MRUz2IDqayJOH+qWmkGlLRTDJp5YKO9vVSjOyM4MCGAuiGeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 19:05:59 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 19:05:59 +0000
Date: Tue, 9 Jul 2024 15:05:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Separate 64K physical allocation for
 display
Message-ID: <Zo2KE14JirJ7T3Eh@intel.com>
References: <20240709122514.538137-1-zbigniew.kempczynski@intel.com>
 <20240709122514.538137-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709122514.538137-2-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: BY5PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::19) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 566d9a9e-e7a9-41dc-7fad-08dca04a2af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0c2N0YyZklIbE9iRDBMOFRuMUc0NDkxZnhjcFpNaHppSFp6QS83M3A2YSth?=
 =?utf-8?B?K3c4aFdjTlc1WFR4L0g4MjdERzVDeWk0ellRUmU1MUd0czljSzJZYXlFQW8v?=
 =?utf-8?B?dWxpVlJSNEozQlcrSnhTODJib0JvWHVMSWFxbzlJb2hmWDJNL0ZuYWdFd0F4?=
 =?utf-8?B?RXV3SWMxK0l5U2tIc2tSUjl5Sm5rWTBzYzQ4bE1mbjcxcit6N05TL3FycWd6?=
 =?utf-8?B?ejZ4ZVFYWlJHRnBxL0F4anRRdE84bklraEhoK3NJdG40d0llOWlFOG5UZHJy?=
 =?utf-8?B?RlFOUGJSbWtWQlJUZmxKam5KMzNQMzRScG9MK0dsZ2JidGxZZHRGNWdTT3BZ?=
 =?utf-8?B?TTBRc0dNejUxWXMrU1JMSFFvc2k5eUNGY1hMSEcrM1hmWi9PN3N0ODZjNGZv?=
 =?utf-8?B?THZScmhMOUpqRjJIcXdIdjhIZXFaUVlHb2hTbnVLQnhyZmtBK0VTM2tLOG5u?=
 =?utf-8?B?STBSd0NhNTV4eTVrNXArdzAxaG4rNmVJNzRhOGcvZXF4QnpOdy9wKzNIbU05?=
 =?utf-8?B?ajF2ZzdUTWtYZm9vQnIrTnQzRVNoNEtZdWx2aEtzblRsN0JxYzhuNmQyTkUz?=
 =?utf-8?B?RmdWc3BuMmJsYUE2SmlTTXQvRjgyWGdXemMycThWVTV4czJoTmtzVll2cmJ1?=
 =?utf-8?B?SkRmTGJRYW52SXdub081NXA2YTNibGJlR1hOMVI1U2RNcTN6QnpyRDVuYVFU?=
 =?utf-8?B?MGJFSGdCUmcwUEFLWWtsN3ptZ2paZ1VMQjdUWnY1TXdxSkxPNGFVMkx6M3pE?=
 =?utf-8?B?RWZxQmZBNkVxQUtDWjhOMjNYRk1lQVN3VHRQSGJ6dEpwREtodzBpUUVuMUUz?=
 =?utf-8?B?Y1J1NDNNTHlmKzdnSFZzUGM5OHZLR3V6TWdOZFdFL2tHNTMrekF3cHJJRERt?=
 =?utf-8?B?ekZKV2FGSjYvTi8rL0FKeVE2QlU0RTl1N3R2VjAyQS9mMXRpZzVzQksyOWZO?=
 =?utf-8?B?amlpelVpVVpsOFB0OUhTak5JNUtmRW92dldETHhVTmhnNjZOUlU1WmZ3bFhS?=
 =?utf-8?B?M1dyazFJTGVWVGh1dkVXUll2d05yVEN5THdHcGIzcXp0T3VpaDh6bjFNb1Rr?=
 =?utf-8?B?MVBKOVBtNmJVVHlwVWNkUGRMdFF1NG5yMmlvQndqSmZocHc4NUV3elh0bWtx?=
 =?utf-8?B?bGc2ZVlWQnBkWjdOWEdlOXNzeEQvR2JGdXdpVFZDcU5wTWFST2RQYUNsYXRz?=
 =?utf-8?B?bjR4NVFFUmRjdm1ia0hkdEhiN1ZSR29DU3ZFMm9ZSjQ2SHVVb3RGYk13YnRR?=
 =?utf-8?B?dnlES21CeFVBdnpKZ0hGY01xTXJCVFM4YWZuU01kNUdqMlMrbmtBWDhIeTRG?=
 =?utf-8?B?SThDLzhUdWQ1NE85N01WQzUzenlDK0VUWnNUdUphOGJ2QjBMVjZIaC96YVhs?=
 =?utf-8?B?MnN6b0V2YWd4U0FMQzZXaURNU0pwZCtQaG5HMVhyWFp0Qk9DQ1RtdndISjli?=
 =?utf-8?B?MUphS2tLR2FNL0lXeUQ5Vm5WbXFaOEpxL1hWQkxkV2pzRmpTcEJqK201eThp?=
 =?utf-8?B?NnAvb0ozd29idHplK2VQT0xKK2J3blJmV29kcm5CTVZIaS85RE1KcFhpaFJ6?=
 =?utf-8?B?MWNBRVJEM1M4YmUxYXZBTDdDeGlZdXJCWExRQmtwNGJTdmtRVFBDdjVPaHB1?=
 =?utf-8?B?L1RhbEN4WS9ZdzRDWmhySUhvQTNBZG1xTmcvTU94YnczaVF6Qk01Y3ZFc1hV?=
 =?utf-8?B?VnFDb0FHbGdKd1Y5SEZRcGdmWDFIdjlCU1pIMC9YR0RZK1dZSUh5YllwWnZW?=
 =?utf-8?B?MkI0NzZLZStsRk5oOUJhNkVEekN2WjJhNnpHc0lpcUVnZ1k0RWJkVDlwdG9F?=
 =?utf-8?B?VCtDV0hSQWNWTjczbG51QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3BEN2FpTEF6cG11U0hEOHRZWFZBRVRCUTJxMi9tckgwU2dlakZESUdhK1NF?=
 =?utf-8?B?Q09BYnNqblI0bTZRcko3TzAvWGJkSzNqbGpjZmVteVlhL2VjTTY5WWlSZzVo?=
 =?utf-8?B?RUhNNHovaS9id21LWCtHR3l5RE8yWWFma0FQaE9XY3hnSm1Fd2sxMFRwZGpC?=
 =?utf-8?B?alJscjdYb1puTWlKelRSazdNeXozU3h3dE5TTk9LL0hiZ2hWZ0VFYldtMmU1?=
 =?utf-8?B?MVpmeENIVzk4dnBkT01SbThYOFQwRmxHajMyUEFEdDROVnJQb05YQUFkdkZO?=
 =?utf-8?B?eHY2UEtQQVFKQnM1dE1CQlBaWlQ1RWowWWRpL0dTUWw2aGRFektNTkJBWGZW?=
 =?utf-8?B?SEM4WjJXWHE5WS8rSEtnK2c5ODAyZDVvRkdGYW5JaUdiN3FwTmF6SlNZcnRS?=
 =?utf-8?B?S3l5L2R2Z1QvRDQ5YjNrY1hlNE1OTXJ0clVic2tEMVBQZEppRjVwSE9qQ1R4?=
 =?utf-8?B?Tkk0dDhKSnJQZExTWEdnVHhQaks3ZFErSUpJWTMzOVNWbVFrbk5QajZNUEFO?=
 =?utf-8?B?VHJZRTZsUmtYNTc4VHpLR0xXUzdQbWJTODRaQjNZSDB4Mnhwc0huOVRLbXRy?=
 =?utf-8?B?YWhPKzVKRW15blVZWEN2d2g4Uk9NTjNiaEdXKzlyZWhhTDhzb3NwM2QzNXRX?=
 =?utf-8?B?bDM2aUdoUXFWQlUzd3IwUSs4VTQ4aHNqa2lwOUFhUFFNdm1qU095WUpmZFZl?=
 =?utf-8?B?U1NyQUlLNzMrS05iMUtPOEhkcjlyQzhHNGxjbEU0VTZjT0dkYUlpYU1oR2Zn?=
 =?utf-8?B?TnhyRy9FR2wvNll4RXpNYkJ3OFc2NDJXTTBCY01CN1NCRC8yVnlqQldOeW8z?=
 =?utf-8?B?ZTN1d2k4OTA0RUJXQ0NacDNqeW5SMzZxMW1zUGJtdUZ1MWRaL3UxUXJkbkI5?=
 =?utf-8?B?bXFLd0NQWDk2eGxPMERLdml5UVVzV084bXdIT0RhSEVKdHhRVVA3Ky9XYXZO?=
 =?utf-8?B?UEpvZFdoRGRJV010M3RPM2JNbGg5TTRmOUt3ZTJZUGc1WllZQnEvYjlORGVz?=
 =?utf-8?B?bGNvSE02ODQvNjlPL3R3cFVTMnVwSHJ6bmYzczg2MGFxcFJtaFdTMmlUV1N0?=
 =?utf-8?B?RzNRQUo2MEROV0hycmdSV242eGFIMHVUWHV1dmdUOXkwa3NjQTRkbXVFVmVo?=
 =?utf-8?B?dkRySTcybnVRdWFhNDZhZnJIQTZ2d3JIcGtsUENjcm4vOHU3MFhsU2NtUkVy?=
 =?utf-8?B?UUx3eWR3dXp1V0l4aWhtZHQwL2NyV0NSV0t4d0lqUDdhVW1HKzY1bEhzTFJ1?=
 =?utf-8?B?RnhucGczR2FFUkIyQmlsSjJHTllKdzRneHI4R0k5QktJTVJoVWpPdS9HSFhK?=
 =?utf-8?B?V2pOVkNDU0xrWE5Ha0gxR3lNR29RUUF0dWExRDloNFlnSUs2djdrQnZhL2F5?=
 =?utf-8?B?SG1BNWZtTDkwb0hvdGRhYWZNYUZiRVBXcFpEb3RQLzU0a2ZwNStJMWxLR0xR?=
 =?utf-8?B?TjNtOEtlOGhlNHpyWmxucldFeHRTVm9ZVG1iVVhQYndoVnhseVVreUs0cDd2?=
 =?utf-8?B?K3I0K2ZJZkMwUVR5bDAxOGxUU0RjbzNwbWhZdGlwZ2l0Y2FpS1JEQ1JLSVBx?=
 =?utf-8?B?b3V3Y1JZbTZVSHFuak04Rk02d2lwV1VqYjNta0EvejFxejFVOGlPT1pSWVFs?=
 =?utf-8?B?emQ3bXpweWxZQjRBemt0OEdSNTNydXlCblBrVnc3OXZwTitLVTRLeTBha3l2?=
 =?utf-8?B?SHNUWkZPbkwyM3gzNXVxQ01zRmFUYzNxRmdIenREZFQza3kxcEtYYTh1Ykth?=
 =?utf-8?B?RUFmbmVlRWxKNkREQ2FTU2ltS3lUQnV5STQ5Vm1zdnZ5OGFRM284c0E2TGVD?=
 =?utf-8?B?bW9neGk3OHdRNU5ZWDhndlg5L0g0VnlyZmxaNzdXc1UzQ3phTCtQZGZPNnhC?=
 =?utf-8?B?M2F3Q0ZQT1BWVEdYYkx1YnlzTHNKSzlxOE1hVllRVnR2WE9HTmpybkxOYlNp?=
 =?utf-8?B?RlEvUmxZUzFMYncyMHdEMjJXdWpjUkJyL2Z3emlrUi9LMlVKYnJmSERaZkda?=
 =?utf-8?B?KzByak9wdGhVQUdKTjFQbGJJdGdtcDhkTHc1SzkrVmNDbEJJbjQ0YVprVi84?=
 =?utf-8?B?bDROSi9ZeVdtVWl5NGFkM2FBT0gzdUd5bmxmRTliaGVjNGZsZlFZVXhYN0NM?=
 =?utf-8?B?eW9kWUNiRnFORVlWQStJMWJ3OFdXUUxaQURzUnZqODZFT1Y0STJBV085dGEv?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 566d9a9e-e7a9-41dc-7fad-08dca04a2af9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 19:05:59.6092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9oC6NuJG/0IGuSVjzQlq+NAGEds//+TAiw2xvBGYEjO7IOQ3pFnFyESjCenIKZvG8T7XlNavI+dQX95XJqkhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
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

On Tue, Jul 09, 2024 at 02:25:13PM +0200, Zbigniew Kempczyński wrote:
> In case Tile4 + compression Battlemage requires physical 64K pages
> for allocating display framebuffer. Add flag which distincts
> buffer created for scanout from other buffers which don't need this
> restriction.

I believe these 2 patches could be squashed together because this
phrase here is the explanation for the next patch as well and
that one just tell what it is doing without telling why.

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: Distinct 64K for Battlemage only (Matt)
> ---
>  drivers/gpu/drm/xe/xe_bo.c           | 9 +++++++--
>  drivers/gpu/drm/xe/xe_device_types.h | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 31192d983d9e..fbcf77698bf1 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1984,9 +1984,13 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING)
>  		bo_flags |= XE_BO_FLAG_DEFER_BACKING;
>  
> -	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
> +	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT) {
>  		bo_flags |= XE_BO_FLAG_SCANOUT;
>  
> +		if (xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K)
> +			bo_flags |= XE_BO_NEEDS_64K;
> +	}
> +
>  	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
>  
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
> @@ -2315,8 +2319,9 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>  	uint32_t handle;
>  	int cpp = DIV_ROUND_UP(args->bpp, 8);
>  	int err;
> +	u8 flags_64k = XE_VRAM_FLAGS_NEED64K | XE_VRAM_FLAGS_DISPLAY_NEED64K;
>  	u32 page_size = max_t(u32, PAGE_SIZE,
> -		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
> +		xe->info.vram_flags & flags_64k ? SZ_64K : SZ_4K);
>  
>  	args->pitch = ALIGN(args->width * cpp, 64);
>  	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index f0cf9020e463..386faaffac53 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -46,6 +46,7 @@ struct xe_pat_ops;
>  #define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
>  
>  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
> +#define XE_VRAM_FLAGS_DISPLAY_NEED64K	BIT(1)

I was wondering if we could simply reuse the existing flag, but probably looking
at the next patch I believe that it could be intrusive and cause other issues.
So, let's go with this.

>  
>  #define XE_GT0		0
>  #define XE_GT1		1
> -- 
> 2.34.1
> 
