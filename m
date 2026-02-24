Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDD4E9B243
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 09:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4D610E530;
	Tue, 24 Feb 2026 09:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPXJwC7m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDDC10E530
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 09:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771926070; x=1803462070;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=tn9+P9jbhs+C/C3pBWJ7af/TrGCl9yxWxGDgqUnx5ec=;
 b=DPXJwC7mT1tln4/PL6HPLMPvOJ4CvA7LIyk1WZxEKTYxHstCYmOcS1fu
 vtc3PIaHkLDiozFdN/idFA56yxU5eccPJTg8ch0TM9YpevnxMETTUuEyT
 8GpcJc4oD3Jgz0nftOG9EwFaN2vsdZB7jodkUg7Y0IMRwqCc5Piyy93FM
 uFXuNG7oLBg8trCfwhVNQs7WF4+wEbGelHPhio9fbqRDhlDp0jjtAWiI3
 ad/I3XOuKO1RjcbioZVC6Zrt3aNdOJUG4hWQoJL4yKnZ3Am6RmkVuFJX1
 KHgaziMW2z9WjWgu/cYStP2o5PqT1M+SBnkVLOwJBET0EeRMINaK6eoim Q==;
X-CSE-ConnectionGUID: geUhZWdySUimI8i6QsONcg==
X-CSE-MsgGUID: xZtTneCoSnqYEDOApeJrRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76767315"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76767315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:41:10 -0800
X-CSE-ConnectionGUID: /+mFIW+mTOS7MOo8VMLOUA==
X-CSE-MsgGUID: XSsIQ2wCTYygkkfNOm6h0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220422309"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 01:40:48 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 01:40:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 01:40:47 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 01:40:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOJ/VeVP886bK41GWh4g7VPbdzBAmziRsB8vZbXeHPxEtXHxGbYANzpi+dHMEessCcku7dXk0+AmkCHiuo4OvWnLYssygIUt0Ywh8DuAJT6sHuvMRZHgkGCOZG/L4F3mAo1YyKoPZ7vrLMuZCPiMvOfQ8+8UZjXtzpcaUoXm6gRNOqeVrYC4B5tDKmZjADqnNFpUvxlF67FMieXnk+Pm3at7bWA233BGRjPTzeK6GgEisxwCsU82MklnxTkONcO8BUv2c+nvagCRE5JwKEgZwb2v3bpZODKcVFUI7Afp9+fyGZGTHi12XYDZSLF1GmK6Ug8LyvrNImXKeknoiRZuAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mj0O5GTKbsyo4xJ1nOlLiFdoUEnrvzh2t9GnKuDScY8=;
 b=AhZhIS3wO40ECxE764PcEVe5NY9mbgm/34PfnDaOs1YiASCVAcDHcH3ralaMps746xnbydEuQ+yg9IDmC4/YotLIUFi6g3H4g24+JI2JJaxQ+ZbUTJjyG5U65OBW6tnHjj+EkM9WFul/ZZ5DJohfoEWkFBDHSrO2deL1NfVzMe3wZv+Q3zThkxk0XwSJm0miVhGgqsEcl6OMjfpISU2djPsdldVdNmj8Lq27VKhIX9G53WYk9rwxfqoMbBnmifRzFozWKxyHCRiPgWaDhFSAcjbBwhTvPyOTaduWDMvYda5la5f9zZRfodiHN3uoCViFyYWaC+lBfWoFRxHE2LR3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 by DS7PR11MB7782.namprd11.prod.outlook.com (2603:10b6:8:e0::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 09:40:44 +0000
Received: from MW4PR11MB6981.namprd11.prod.outlook.com
 ([fe80::d22f:753a:b894:9d1a]) by MW4PR11MB6981.namprd11.prod.outlook.com
 ([fe80::d22f:753a:b894:9d1a%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:40:44 +0000
Date: Tue, 24 Feb 2026 15:10:37 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 21/23] drm/xe/xe2_hpg: Drop invalid workaround
 Wa_15010599737
Message-ID: <aZ1yFYuCXcxZqVgd@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-21-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-21-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::9) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6981:EE_|DS7PR11MB7782:EE_
X-MS-Office365-Filtering-Correlation-Id: bcad79ca-89d1-4ac7-f3e2-08de7388c7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmJQNFFybDltQzRuMDR6VGRJRWpPeGVOS3MxYndnSnh3SFNDZU5IOGM5M3U1?=
 =?utf-8?B?Z1c1SE5lMGNRM0RIVVk0b1lnemQ2NkIxaERjdHo3NURxaDg1amhSdklMNitw?=
 =?utf-8?B?QnZZT0p0TkRMOEEyZ0FmeXNpQkRDMFE4VGdUWU9qdHRIaVJsMWZ4M2tFK0U4?=
 =?utf-8?B?eFFSR3NmekdObnEvdVlDd0ZuYkZKSTVwQjd3em5oUExtQVZrL25lN0RrZEhU?=
 =?utf-8?B?Z3NxZXJod3B0bHdVUWJKMldBMnVOd3VRQnB4ZXU4OU9hekdSdnVJbjJwZXFz?=
 =?utf-8?B?YUNSRXdidGJzaWM3SVlXbUJsMk9YMWpnWXlaUmtTN1p3NHQzQkplV0k5Zjdi?=
 =?utf-8?B?MW9JMjI1U2JUT2NpcDJTdkxvZ0ZPelorMHVUSUllcVNBZmpkMGhTenR4ZHdN?=
 =?utf-8?B?N2FBWTdZOVN1eVZEenpzTldTZ2hybXYyZmljUjlMbXVYTGYzS293ZTV2OG1Z?=
 =?utf-8?B?dXVFb0tTV2lXajc4aGprcmY3SG9pVXlCN2w4QU9wbHc5S3RiMDNkYWc5b1BM?=
 =?utf-8?B?MkJOUmJtKzEySkY4Z3BPWElBcmtqbnFScElHaTFydytHbEZzWHdReFVjK3BV?=
 =?utf-8?B?Q2tpK2gydVUxMU56Rk1qYTdZM09XTnRkM200ZzZodlk1aWtrQVlOQVNWQWZE?=
 =?utf-8?B?RVJZRlIyTnNFOFNzWnVDRm15cUFxc1hNMUYxNmdlOFJGTkhwNFpqU2JaaGpK?=
 =?utf-8?B?QzN6RmRUSVFJV3FvYjFpZVNWVUF5VHVpNlExUWpidlh1eHFYMnB5U2grbFBo?=
 =?utf-8?B?NEdCL0xaMmxva1RmZUtjbnhTakdJU1FBdktBVXpNOU5PblM2dVB6dG5HV0JT?=
 =?utf-8?B?djh0c1ZuRUVOQjI5dTUxc3lXaHRUZnBXVUk2bjUwWGlYR2JOSTJJSzJjVzdi?=
 =?utf-8?B?SEtnMFZMeDdsSHYvb0xNZi9MN2Z4NWRSeElnVkNuTnNLN2pIZGRPYlhRWSsr?=
 =?utf-8?B?UUgwSE9IMkZCSTNqTWVhS0FCalFvelRodlREQ05aTWhBMU8rbWg5ZVVxajQ2?=
 =?utf-8?B?SjI5N0U5YnRjK2d1bmh2UTd4bUFMWmh2bU9EQktodGExS1BTcExFK3FzNDJx?=
 =?utf-8?B?VlQrM1JGaFhQT0JFRWRBa3I0bVdNUllmTGV6MzFud2g5aURWM1dML0l3M2Mw?=
 =?utf-8?B?eVZ6MzZ4QkVZWEJ2TTRzRGtLQWh1c1hIOTZPUG1NSzNGTUNPYmlHS2VOZHBD?=
 =?utf-8?B?MFUycHh5d1hsakZXWHhObEhUNXR3RU50T01MMTY5T2s0Tm1JR0xjRnZtVGZH?=
 =?utf-8?B?WS9sZ0JacDNHeld5b2dialdNbEdTMjcrMnhPaXlpRFg5am9kRkFCellHd0Y5?=
 =?utf-8?B?eHVuUWFiNTZrU0lwNFhVVkh2SE14ZnFydUdwUnd1YWdsNkhMSkR3OVU1YS9O?=
 =?utf-8?B?bU1RZzJzRVFDV2toSlIvSjJOeHdteXhkUHBxek9vMUFkWDVQdjMydEwvQ2p4?=
 =?utf-8?B?NStId2RkZ1lwVGQvam8rdzNHdkpDbjI3U1pFRy9PMVd0SEFkMEhUbGhleVNq?=
 =?utf-8?B?clh1ckc1N2V0RzliaUg1UjRXZkI5ZFFtMkF6REZYSVA1VExDblNGSEpBaE50?=
 =?utf-8?B?ZENCSEJFSUNKZDY1dVZ2U3NBOGtnWkJqZWd5bERXdS9EbzJ0bWVaK1lhNXlW?=
 =?utf-8?B?RmxPejh1QkhoTGEyb3BMdnZCOUpRTDZBbGtuaU16Wk90Um01aTFFZHl2S1R1?=
 =?utf-8?B?SVdNcnAvRzI3cDhUTndBUlh6bzkyZFJSd092WEJaRUFKNTNMS2IwNkZhWW8w?=
 =?utf-8?B?Um1UNDdXMTdGUmFRRjd2QUNERmhZZmg0NTYxckUvMWhxQ3JvbVM1Z3UvYVRX?=
 =?utf-8?B?dk92TVk4d1grZjU0eDR3Y2w1cmhDUGZ1Q3dmbTY4VnNTc0ZGMWVQNU1YY0NV?=
 =?utf-8?B?Y0prUHVBK094L29NaTk4RUtkZldNbVJUYXZJWDRxWDdDTGRuZlR4TmFkd09K?=
 =?utf-8?B?Q01NMzh2cnZ1UW84NUdZajVCMWhZcXk3VWJmTTQ4YWNsMFdXbkN0K2xUNExZ?=
 =?utf-8?B?WDhLWlJ4T29PZ24wUDl4cjhCNk1CTkFGVUcwVmlpcG5DbE1SbXdXeWd5NUgw?=
 =?utf-8?B?MUIwRGZReFBrZGk0WVlsUnZ0d1J1SE1UcHloTjBBbEYydFlkL0RubDc4UHk1?=
 =?utf-8?Q?wUKg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmR6eGJsNlhhaGV0RVlSLzRTTlRyWDdvM3hNU2RENU40OHl6b0FpTW5yRTNk?=
 =?utf-8?B?NElqOTMwc2pvNnBtb2tFS20zMzQrNnU3Nm53TVZ6eUdHVXFCVWxpajd0SVNm?=
 =?utf-8?B?WmpiTS9qWVBjTlZaSWFBVktsdFNuQlNVNWpoNDE0VkZhajAvdDMrS29za3p3?=
 =?utf-8?B?ckRCL0N2N3ZrRVZQRTljVm5GM25YYm1YTGcxb2o0TzFHcVZ3UHNZQm5EMWs3?=
 =?utf-8?B?VG52aVBaNWtsb1BiYi96Q2ZwRmNBVVo4WFlXcXpzcXpQNFhuZU1jN3llZzhY?=
 =?utf-8?B?SmwybFhsRGZ5dzdRZ2V1aTV0ZU5JR01RTEwrZ3ZzTFlRblZUNXlobDFPcWpM?=
 =?utf-8?B?SUwzM09Da1hrbXdnczFZdU9oNkdmS1owNTg3QTQyNkJ0YlNJMEpYRTZUY2dq?=
 =?utf-8?B?T05xaFpYTFBGdXNVUU0xZEtwRklIbSs0N1NsU0VUc3NRdUVVKzR4T2czSlM4?=
 =?utf-8?B?U3ZnYm1va2wwSFZXeFZaYWQ1cHF1cUlZaGx3UjJSTGYzdUNxZGx0czdCdkZi?=
 =?utf-8?B?L24xeEZrakNLalJOK3BTTmdjMzlJalVrQ3hNMVZtQ0VUaDNWNlZoaWZYSFht?=
 =?utf-8?B?TEhhK09ZM3daUWcvTnJVZFZqWWxOOEJJaFA4Qmk5UDI0SG5rQU5OeWVjMkxP?=
 =?utf-8?B?dktncDZ5Ulk5WU03cEN0ME15RXMxaGwvbmkvSlFPRVdSWnl3TEE4czdrQmVB?=
 =?utf-8?B?TjNYc2dwVklaYWpPYXdPYXlDekx0Ylkzc3FndEhoMmptRzU3VDUxeUM4NXZH?=
 =?utf-8?B?NHFLZHFENHBDdVF1THhVYWlUSlZaYXlkNDNqUHJNNTdpTEIvRm9LVloxaG5l?=
 =?utf-8?B?ZUEwck8vRS81RkJFUE5LblRKbWlwdHl4MEtHMlRkYVc2aVRTeTgvWWIxR1Nq?=
 =?utf-8?B?UGJrRmhyaityVDFUMGc1b1ROVkZkL1FuV0RLUWhMNE9XejE2eXc3cTRqVW1v?=
 =?utf-8?B?MlZ5R0RNT0xrVkNnY0xKWkYvZURsK3phU3dWcWNtbENiTTQ0bFZWamY4RjZT?=
 =?utf-8?B?QTRCMjI4dzcveWxRZHU1Y1lndGppRno2RDhxUzUzTnFTL3U5ZGZTZVg2dmhH?=
 =?utf-8?B?NWhtQkFvakJ1Y3VNeFdQUm44T1FYQ04yQUlrZm5wQTltQm9KMHh4NFM0UElU?=
 =?utf-8?B?N1VjZlRMQ29qSHdzMGljZVpoaytsZlJRYnkrNW0vRHZqODl1OGhrckhIdFhZ?=
 =?utf-8?B?MGQxWnRpb2lMbDFkaXkwSms0dnhodzFmMDVJUHZoMHBFQzQrSVd6ODhnUVYv?=
 =?utf-8?B?cDBCSUdteXhBUW92OVhLUkJYaWJRV3ZaYVQybUkwVk53RFBBWG1sdzgzWFVB?=
 =?utf-8?B?M2d6VEozc3BYdExvOUJEUkxBbGtobWsvZE9kdEVvZHI3VDJJczlXY1lWN2R0?=
 =?utf-8?B?L29vcGhNN3Q0QytMTktSTkM5aHkzZiszeGZ3eHJYTzIzczJiM0l0c0ZGdm9i?=
 =?utf-8?B?YythdmFBeGwzandyMEtMSUM0anBJejZmcWgxOEJ1eXBOcTkyY0cvcUltZTg2?=
 =?utf-8?B?QTJyZ0MyVTU0RmxmV3FOeUVtTFhMU1JSU0Iya0g3RmV6SE41VVlSUGpqdmt0?=
 =?utf-8?B?c3pPV21SK3RKMENaTi9GVyt2MnpFNWliNUpjbGxqWFNON0hEZG54OElYcVdo?=
 =?utf-8?B?U21xZ1p6Kzd4UU1BNXM2ampGeXFVZHVhdXhtcUl5eWdhYzFvNllJWitNNzdF?=
 =?utf-8?B?NmNLNG9NbXZ5bWM4MjFKR1ZycERFZGN5ZDFySGg3QlNvcXA0Ny9rNGhIM3lj?=
 =?utf-8?B?YmFUNWQ4Q2RPamNnS0c1dFB5b0JGSFZBU2dUWkNPTGFhbGZzT09iR2JuYVQy?=
 =?utf-8?B?Q1I5N0pIdjVZMjRTYnFhQzlzdDU3YWFDZXdYREJhSk9wZmo1RFEvdUFJRmdI?=
 =?utf-8?B?MFlwWG5PWGE3QnZ5UDdQWGwxVVZ5UE1yaTBreFNueVBnOGgxRXIvQkdkazNR?=
 =?utf-8?B?U0UvQ2w3MXlLTE1PUnBOT3V3RzdBOGl5U0doYWEwVXdGUUpLK3pab0NoMEsw?=
 =?utf-8?B?ZG1VTXp0RW41K2c5Ynlob1VmVVpmdTZ0WnM0Zm9JR3ZrbzJzczVmdDliVng3?=
 =?utf-8?B?TzcxdzVkdG91UC8wb1ExZXloKzg2S3pKOGdaK1hTVzV6MjF5MzBEY3RURVg3?=
 =?utf-8?B?Y04vNWxvU1ZUa3lOTVdLUmF3emY3NzZ6dXI3L2VRdXdZdnVtcmhpNkltTHRN?=
 =?utf-8?B?bEpGL1h0NjV1WkowMlR1WWlUaFZkWnpxeWNsajY3bkFoN2dnSEVvalRWRmh6?=
 =?utf-8?B?bWo4MW9NUkRGV2FxK3Vna1VKWDBsNnBpcEhYemphWFNNY0VxWFFnb0tUejNE?=
 =?utf-8?B?QzM5NW16TWJXL01Mc1g2MmpzTktFSERnUFBSa3dCeURza0xsL1BKVEtwYUJ5?=
 =?utf-8?Q?AJj/MtTQyn/Hql13+AgDBIYiLd07HcnXU+JfZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcad79ca-89d1-4ac7-f3e2-08de7388c7d0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:40:44.5973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gL+UHJA1r/1cLc3j/mKEFJDLEY+riIVt4eKsZDVLeTriFFesHcF5cbXco0tEFATZhhUpG6CgO9Xx8L6OVy1JtAQNdZYmSBM1sKY7PlwAXhV1dyG6ifLgZGLOnENjcJN4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7782
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_15010599737 was a workaround originally proposed (and ultimately
> rejected) for DG2-G10.  There's no record of it ever being relevant or
> even considered for any other platforms.
> 
> The specific bit this workaround was setting is documented as "This bit
> should be set to 1 for the DX9 API and 0 for all other APIs" which means
> that it should almost always be left at the default value of 0 on Linux.
> The register itself is directly accessible from userspace, so in the
> special cases where it might be relevant (e.g., Wine/Proton running
> Windows DX9 apps), the userspace drivers already have the ability to
> change the setting without involvement of the kernel.
> 
> Fixes: 7f3ee7d88058 ("drm/xe/xe2hpg: Add initial GT workarounds")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala 

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index fa5dce4ead48bae424a49c62142683dbf1971376..105ccd8115f09993b7ef82e70cb87d74008f267f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -734,10 +734,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	},
>  
>  	/* Xe2_HPG */
> -	{ XE_RTP_NAME("15010599737"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> -	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
> -	},
> +
>  	{ XE_RTP_NAME("14020756599"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
> 
> -- 
> 2.53.0
> 
