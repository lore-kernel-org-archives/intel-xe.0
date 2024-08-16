Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1270C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 16:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8020C10E802;
	Fri, 16 Aug 2024 16:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTKfrDuk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EC310E802
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 16:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723824578; x=1755360578;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NPrzSCpHw6hE2mp6BXUA+2s42P0UYDJQSZ8tycWa708=;
 b=LTKfrDukXnPpDKRAoFa3B/kIOlg0MkUTzYyk9rks9WK8WCaJTl99iTWB
 dJwzYq28fZermfcrbO+CkIeuE9Xc/Q+d8anIGK5PWmlRUOM1bQ/ESTPBz
 bEZyGrEHnGL7wNbcCFJxfXqBmMTfyTf2m6CJdGYXzi/f5y88oBKqM92JF
 GtAm7MBvY1dHOWHCMxXRiclt0lA0HJ0NczyXg8VdwezBVMXkNm936zEzp
 hhnK8atVSo8KxjWqukKipJ/FVVeP+p4K8VYkS4QHrKSHCAAEGCMWmSPRk
 I/r9351pFSn98qDuUzJPBkqF3L6L6qtzxhGV7qaE7+fQt1DFVWp6f7YOG g==;
X-CSE-ConnectionGUID: Ydoh3hNVQLKzXqanal4Gjg==
X-CSE-MsgGUID: +xiNCHgiR9qBwhWpZ6+bog==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21758651"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="21758651"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 09:09:35 -0700
X-CSE-ConnectionGUID: UlR8qs8kQLa3Aiz4NFeScw==
X-CSE-MsgGUID: yn2Bvz0pQGyhYreZXy1QUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; d="scan'208";a="90486469"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 09:09:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 09:09:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 09:09:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 09:09:34 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 09:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eO93ips3d0vhAs0SmznwG1fxbbvayeHqsEM4s6kHBEZBAJL6svcCD9gKb37c1KjNdmOGVcwmqazLbT74tyJ4CV9l8tRqYEGsn3VVGxfcpU0Qb0LjC1P8S34TN4oLaPija9TuM7+qc7uu3AKU28K/1cCttMP7B/iPPraPGOgeNgYMz9Rlw822MFOFZ1MQl9gw3J3vrdhgTapg7c3OYb0HvFCpqw7twq8sZnmQqJDIAGmfZMzPUmXGCPzZpC++DpcQB5OflCHs1JWsBhrUD7jK0j9r3X9G7I/tQ4hlorWB2B8rKtxItmfIYGSK4icXaxzEowSzT5dMOkBOyrZamO3DTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ8AQ+PCabV5IpaKlFaUja/sjCzvdLa2ZRhQ9zoQW8U=;
 b=B5rTscDRvRN064dnsX9uQRM+YXSJxmwzx2JfWQ8xnw+XdvYRLSvU3OaC/POjckcOXThMHifz2wsKbSKQoq8UZA6lnnYGOq2pspzIwqiKwiLC3Z7X45q17sJTtZCViinZWUusR8A3Y0T29N9a9+A9xHC3am/eGvoLHw+NBFtE9+J62lwBHYtGysVyZT09/Oy0NhznTLyaIrmei7Yoqo23w4FMmPCISRle5KGMsK0Jfnx0PiiZ4qn/A/yqbWMEAUYhPBHHIyTRgm45jp01s83HwEdz/mxqfD1VBRiME5prU+hmhkW6qi9SQQSEPsN4peA807WzgAA5hR7V7jXn7Rwr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 16:09:31 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 16:09:31 +0000
Message-ID: <7576e466-1b64-459e-b44f-8e0aa2973b75@intel.com>
Date: Fri, 16 Aug 2024 21:39:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use for_each_remote_tile rather than manual check
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240816040208.62695-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240816040208.62695-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0172.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fdebd8-a098-4898-56f6-08dcbe0dcfd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekY0VzdmemZicU5VdnlkK3plR0dNRzkzSFB6czhNSWhqNmwwbUVXamRJNG5I?=
 =?utf-8?B?ZWJoRDZjaHhYQVZ1dm8zU1ZtSk1WRkNwb3h0SXdYMjY0VVhtZVFnUFZERkkr?=
 =?utf-8?B?YXozcWdKZ09qWVdlalJIV2JOYkRMcFcyaS9zckF5cDk5TmlUQzl5K3pjdnZX?=
 =?utf-8?B?RnRyWDR4ZVlnV1FIMVZ6TTFQNmJFZi9ML0RoYjRVOGxmclpxRWsrV3d4OGNm?=
 =?utf-8?B?TkVlajRXUEJpSWMwOTNCZExUSEVLWWtKNHAweE9yYTRmQkF1bU5pL0Q5Z3dG?=
 =?utf-8?B?R0tCdEZBdy9iVnd6R2ZHY3pmbUdQVlpyaFVnUE9Qb1ozb2RSa3o1REpScnRr?=
 =?utf-8?B?cnlrdGVwT3ZteFl2djV4dDd5MUhFa3FRNGJHOXZHQzUwM09Bb0c4Y1krMTRS?=
 =?utf-8?B?RjFwSkVTL3hkWms3bXdib2FqWUlxS053TThiQ2NXMm1IVEJYMmc0THA4Vndl?=
 =?utf-8?B?VHUrZFkydm93Tk5PQjJyZTU0Z3E1eXZTUkJvRUR4R1VwZDZQS0k0Y1d2U1pK?=
 =?utf-8?B?dm5raHF5YmlFZVhlRkRhUFZPTkdUSUxpdm1vQjVWQjVGU21ISndZWVJVNnZt?=
 =?utf-8?B?REVTdzk2OXppbU9JVFVwTDhaTnNHNXdNK2Z1S2MyZEJSQVZPWG5mMit3QWxS?=
 =?utf-8?B?ZWVocUZab0NyZmVUay83cktiaitYNDB6MTBabWRQUWxIN0dPZksxaGdMQlZh?=
 =?utf-8?B?TFpWcXJJQ0xRYU5Ga3I0UVJhNURHUE9CQ3Znb2MraE9vZElFeVdlSzFaZUJC?=
 =?utf-8?B?VnNqY2xaS0c1WXc0cUlUeDBHL2lONVc1TytWdCtRTng2TnFWVDlUeGxpLzU5?=
 =?utf-8?B?UTRVN1dhcUVRdVpvK1RzT01xU1dEYnhVNUNDdXlTK2FCVXpCMTBwb0V4UTJt?=
 =?utf-8?B?bTRSK1NkaEFzbC9CNk1CZTF2dSswWmRWNU5xUzBWTXpZKzd6Y1VtS3NXTjYr?=
 =?utf-8?B?MGlVL1M0Z0oxdlRaSFFWbGRQTHB5amNkZHhQZWpiRXV2SlkrZ093SGxBcURT?=
 =?utf-8?B?MkQ4T2toV240dWhkSUU1U0FpTGpnYU5kN2FjSGlWa05ZV2R0dlhVM1ZORG12?=
 =?utf-8?B?THFQNGJPMEdJZ01ibW5sWHZPK3F6UDZDcnNHa0pHYm0wQlJGbGlkS1lhMzU5?=
 =?utf-8?B?ZkZFc2hraFF6YU9mVWI2YTZuTHQzSGVhbTZzbWVxYTVtb3dCSnlhRjhXb3NM?=
 =?utf-8?B?NGpqZjEvb3BHbkFrMmJsT3FZRDBGZExKTU1PZ1VEY1RKUVVtOUhoSzc5dzdU?=
 =?utf-8?B?MWlFdHUyaWJTdXZ3dzVrN1BtVGxla0pRWFdaSkRpcnhtLzAzc0ZCbTljOWIw?=
 =?utf-8?B?MUwrNVQ0RUgwRW11eG50YWoxUlBpU0J2QnhEMDY2TFlnUk13Ynk3R1ljeDNI?=
 =?utf-8?B?d1hxYVhISVJVdGhHcHNKVnZPN2lKTEtnTklFQUVkODg0c3VjdUVLd0hjcDY2?=
 =?utf-8?B?WWJtUWRYNVFhL3IrWjVudVhzK0NoMk5IdnFCd1h3K2NkRjlycS8zWTF2b0Z3?=
 =?utf-8?B?Y2ZUaVVDWVE5OHFoTS91YW54SldkOFU0bFdyeHR0MndSenFQVGlRY253RDJl?=
 =?utf-8?B?c2lqaytCdlU5K2FwVVVwb3RsQkw5bGY4WURzdEtRT0V0cThsTTluZ1J6UnFX?=
 =?utf-8?B?cTNMTzVCaHRxVjhCcnhrK2xjTUtrZmxmeUVtNEFwYzdicmxCZDJJa29HcGxQ?=
 =?utf-8?B?R1ZqUEF2SXBBMnQxYXlpb3RSOGNFVDJ6VExaZ216SUlYeUZELzlDOTVWZDZP?=
 =?utf-8?B?SHVINXM4Z0lMZ2lRVFBTTHZacEdRaDEvWEM2Y04zTjFnSWdCT081bDN2emVx?=
 =?utf-8?B?VUY3L0hQZkNzcnNOcFZHQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHRKZC9HYndSZy9WdUZvazBlTnVJcVVkZUluUktUSU9Mczd6eG5YR29aS1RX?=
 =?utf-8?B?Tmo1UW9WcDdNNkJDMEwyRnFLcm1LcmFIZVNKS1hvRldLYzhmTU05NWtZcEVa?=
 =?utf-8?B?UlZ3a0ZSM0NQR3dHYVRtUTZzNkducXNIeGJFZGN2cHBBaHZmS0l1NGFjNmpn?=
 =?utf-8?B?VHR5OUJCWEtJTmpnVzRoMnlQOWhleWNkcWxYbjJBanlRaThWVjRLRE5zRW9C?=
 =?utf-8?B?WmYwUkFaQmxWRzM5dGpMdUZtbmJLV2daTk1uMDBJSnNLQVJCbmd0aFFTNk1s?=
 =?utf-8?B?QzFUdWtsNncyYVd4ZEU2cERIVXh1ajNUbFpmTHdQM2VqMWRJV0FUbmtObW9k?=
 =?utf-8?B?MVR1a2RSRE9NbFpLU1czb2Z2UkM4QThWZGRMYndPT2tvbmNialRGZ1dJaVNB?=
 =?utf-8?B?OXVOQ3lqd0xhZHlodXh5M1RsYXl2M0ZmY0NCdVhuR3l3c3RscGYybzh3eTEr?=
 =?utf-8?B?TVlndkZGYzdJWVY3ek9hbzRob2w2ODhwbTRuZTdhcitkYzh5c1hCWUJ2Y2dl?=
 =?utf-8?B?MFVwZ2tRZHA5RnZLdkxyNzhjNmJ5TktzTFZqWWhRc3dTdmlydVFqd0pPSXow?=
 =?utf-8?B?VmxMaHR0akVHb1p4VGJLcHFWU0dmZlVqS2xMbEJxTEo4S2o0NDhSaGd5RFA4?=
 =?utf-8?B?d1RlRzFHOHRKL3I0VXZWQmtXN0JuTUNZQ0hhWVJQc1J0QmtXZkpkY2xGaTBt?=
 =?utf-8?B?elltOFB1RW9hYk9oSjJtQXVRS1VZVW1MMDUrUVU5TkJxQWhBME9OelRjYzgw?=
 =?utf-8?B?T01ua1VMbE9oWDdoTG52M2E0Um41OHE3aS8rL0xRdnVlQWJiVWtIOUZXbFVn?=
 =?utf-8?B?bExHcnJYSmh1MERJMFBWa3FENkVVcGQwSmtxZVlZaFRkTGxlU3hmS1JiZFhl?=
 =?utf-8?B?RWxvMGJJVXRDVTdqZnpFRUhDby9sdWNkZDUramtjaytmTjNmQ1JqeGRoTEFG?=
 =?utf-8?B?N0FUci9lU1NtbHQ3VTNJNzZ1KzJWS0Z3bEhvbDBZSHZtZ0tLQ0xtOGE1WE1Y?=
 =?utf-8?B?KzVlbWtJRmplMm8yZ0hTS3FmZmtqMVB3eURHUWZNbnVnK0JQUFJWTlhsZzNr?=
 =?utf-8?B?NlZ0WG9IM0RaWXI1QXNvS3MwdThjbTE4Wi80UFJHQmp0R3lKN2RHcGxpaGJF?=
 =?utf-8?B?TlNjaEJORlVLZ1poUlBqZklMcEVPWGlyT2tucTdTaVAvWFQ2anBDNXBudXls?=
 =?utf-8?B?dlJNV1lTYTVDRlVOaXJMTlVkQk11WmtOeDNKQXZLNVdiOGRoSDdrNnFmejR3?=
 =?utf-8?B?NDRFUUVRTkg1eDMzSzYxT1BXZFBBYnVNaTNsc0dESHF5bWc4SS9GV2ZqeS9X?=
 =?utf-8?B?RkhCa3RBdUI0SmtNYTJLczRoVFBSUnRqVkhOUmxEcExSVGJpUVdMZzlOaE5j?=
 =?utf-8?B?SmErUDNiNFRXWlFhS01NS2hXZXZhR0xHdFphZzAxRm4vTytMNTZkOHhQdzhW?=
 =?utf-8?B?QStIVVZSMHY4eXMvNWQ4R3R6eG9KeE0wbEdXZGdPYkVIN3dxa09GYnBIV20v?=
 =?utf-8?B?S3NNT0pXVXFpK1Z5TlZGMWhFRndCVUhRZ1V6cXp1RDFsdk5GNWFlVmpxUlRN?=
 =?utf-8?B?aklNSThLNWdoMEFTTVhOcnZFcGliQUwyMGc0ZDZmVnVmZjZtbWd5cTd0MVRq?=
 =?utf-8?B?QWpRbzI3dmNYc0dtazhIRktPdldsNldIbU5ZbDkwNExaalVGaFVVUG5LbGtu?=
 =?utf-8?B?U2ljczBSK3NTOVE0endwMUpIcy93VmxVdjRvYnJqa1NQYkVJMnkrTE94Rllk?=
 =?utf-8?B?N05KZ1R0WWloMEQ3MUgvVnU1bm10dnoxV3poejllL1JhdzcwV241eVZtL0x4?=
 =?utf-8?B?VHRnZGRvMG5nUVZwWDRtWXM1V0Ezak9JaW94aFFpVDVTVkVBRlJYR3FZb28r?=
 =?utf-8?B?WnFHKzAyT1paN1BLQXRmdldIVGh1b2dBdnFUeW11bi9tTGNLMytqMHhsR2xS?=
 =?utf-8?B?bnpoTzRrOUQzSDc5M2EvdnRYNHpaU2tPM2kxYWF5Y2xVU2NhMm9qZUxzWVAy?=
 =?utf-8?B?SUVsUGFrcXJabk1xQzJkRERjNHgxYk9ya3ZlcDJCemRPL1lpdUN2VzMwZkZZ?=
 =?utf-8?B?bDZBQmRFYlZxVnJLOVlEUWJneDBVaFBsY2Z0WXlXMHRSVWMvQ0orWkNiNzJU?=
 =?utf-8?B?YWE0bkZLdG9jNWRscnQ5OUh5ZkRYT2xENXpmNkFrUVYxbVhRNzdtRHcydlRB?=
 =?utf-8?Q?dk98vOwdHyHVmrWqMro+Qc8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fdebd8-a098-4898-56f6-08dcbe0dcfd2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 16:09:31.3569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyBpAeGhwEadMpj7oXrhL6Zb5tipscOnyfID2oiHixJH0X8B2Z+tGkNia2lqxm8vYYbwjUV2X4Cz1dRTCzuTgIHcoUqioXl6Hrachjpkiq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
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



On 16-08-2024 09:32, Matthew Brost wrote:
> Replace for_each_tile plus a check against primary tile with
> for_each_remote_tile in tiles_fini. The latter macro does this for us.

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mmio.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index f5bdb540e823..3fd462fda625 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -29,9 +29,8 @@ static void tiles_fini(void *arg)
>   	struct xe_tile *tile;
>   	int id;
>   
> -	for_each_tile(tile, xe, id)
> -		if (tile != xe_device_get_root_tile(xe))
> -			tile->mmio.regs = NULL;
> +	for_each_remote_tile(tile, xe, id)
> +		tile->mmio.regs = NULL;
>   }
>   
>   /*
