Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65091C55182
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 22:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0950510E071;
	Mon,  3 Aug 2026 22:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXV6y4D9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A4410E071
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 22:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785796310; x=1817332310;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uHn/oD5WC7cFPtgCb7RVhzGkiaHgRToiSmhrRvLjckk=;
 b=YXV6y4D9XiKiXzjU/Zndx+WAYK+oM37wOgc77LM8onvjGbpZYCNm6xA2
 zKzPKcR6bHSVtC0yt1r1yVNzfp2HIFFSMNCdNX+VBFCbebbhjzvM3Mioe
 8RKnOl1Ow3CvnwZc8HICbYOvH3YK8Fe76XLPrbQWf+iwV7/Qg/hr+2KAg
 tRs3++5eQztE8QclOMFWcFvLJXU8c3jBM3e07qY3hOLz6Rrhk00/upEDS
 a7fsv6Uq2N1VbfcA1C0NCURYRtnccjIpq5pB+sZpGCm4YElMXfZg/YE7w
 ERXji+mpfAPbt9gcpUchI8DorgYsxuVH+5NlLd1kkBumhSv4ajSyKu/4z w==;
X-CSE-ConnectionGUID: YOXU3mzgTF+jzrRiy1j0DA==
X-CSE-MsgGUID: RCU01x5vRlqIbAeUcr2fvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86291078"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="86291078"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 15:31:50 -0700
X-CSE-ConnectionGUID: zEuRu/TeQ9SDpG6xYuR/xQ==
X-CSE-MsgGUID: jn0dZs1XThuBKEi/pY+voA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; d="scan'208";a="255048181"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 15:31:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 15:31:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 15:31:49 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 15:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=due9wTdd/hTFLJIb2SAAJTcTKL47jaoptU2fpPnnLX4PnmflpIH6BJliEji+QMO6paW1+Kg8x27yBYOlfBmK3yohOD2/jc8/6enR49IU6whvUFpnHyKxasG/a9JhcXgLxPcD0teo8qkiODcKjtQKJNjfC+0Bo8gUM5uf4DoCnKB7j5bf7W+rvjuS3X8VM3+yzmWUL5ot81rkwEyCI8mNonBRm9LaFdno3uOEGV7QtBWwSg4Iv80a/NbxPZlOAsAb6A/kIJ01spTgWotNpjNAb8d+GilEAXRkwX/5pP3lZESIXYwChNKMGjTarrMmdz/QqxuyGNXWkUh0zp4cxg0MJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWHjgtZx+mfyc75UR5AmIuzU8nXjl4WTHhaZobGEYjc=;
 b=llUX7kuFS1sbWflSNWYwWDLYLXs4dlzipTCdp/lfHcLnQ4hOhfAZAC4Y/aRaYVhq8qRGVUIC7C8C37qxtmpooMJ31gFf/eqHi/PaknCGSdmLyNku9Kmi6BmYV+UVPn1LuAQbNc+213AfeTROFipqZzQWT6cqN72dB916HwxJc/Ta77dBBQyiT1nH6UhlqArx/5/DrHMAEZpUlxrbMmBSe4DohDkIjC0th5HLtfipksXE/DK2vWqso10MMjC4J917e5ZFvcmVpQKCg9NcbAWEZrQWCv11DXQWgCV6UFG+6wwAGYGE0zQejUqPlvCeo9DlXpa+3ji9oL9trzxnCIm4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 22:31:47 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 22:31:46 +0000
Message-ID: <ebb9bad7-9df6-41bf-af7d-9275384169e5@intel.com>
Date: Mon, 3 Aug 2026 15:31:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/xe/xe_late_bind_fw: Fix firmware leak on
 missing manifest entry
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <michael.j.ruhl@intel.com>,
 <anoop.c.vijay@intel.com>, <shamim.begum@intel.com>,
 <anthony.giardina@intel.com>
References: <20260723083659.716683-7-badal.nilawar@intel.com>
 <20260723083659.716683-8-badal.nilawar@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260723083659.716683-8-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:254::24) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|SN7PR11MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce4b913-6a17-443d-c4b1-08def1af00ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HLH4Zhv2tb5ztmje00EQ0TGlnIz9Nq88fqggEKkYfVV0CZbaaDLMqPvIHWbZ6uzKifHFQIC++ly2zyDuiQiAew6kY0ZC7RvATyB10KniIK6iXkhE+pQjzZcwn4GymKF0z7/0VJq1F6nF5bhifbAWBlvSFLF5NmBrXpcQtS8ZsE3pplpW+XB1NydUWFJcPjInMt/+YlJJdLs626zNfp6MJLZlJAkifH0U2TMRRN+zfmqNR1/0pm6LY4NfsmgSmdgjwNP0z7hcDJpn7BYChtIIOQdurhqCzBQvpPegA0XyomMUWBBPm5PB9st3AbBopAk2qJr97WwX82773utPXjnzSCG4BYRx8GjwQokS+SygOTJSUOCdaDIgy2+mnOKdXe56addhr2iDguEsagdibJh4wqjYtMFufXuQqx/QQTSy8ZRt0KPxM/+/1gPxWszQinkhLaiSvRkEF2/rgCiY0zVpZwYnY3/DKD00DKETBm6EY0/FnaU/qbYuYnuJWSQy4WmB1u5JXEihRIg6nCn0M6Cy4HnAsprTS18Z8OZdwNlsX68TNu5tU1vHBk5Sb0fSRgu4SgzWJ1A7VtNa5KF3QOAUcSpBDwpnPPfhe6JGdRWrByKqqUNsRYMK4Lwi8csMQdNgLyHvBOTE1RoZrFiZ5JKHIy/xeP+ZVI086r3cgWHeAWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R08zOEpTWDNpdEVabC9uOGFVTkRFOUJxdlVwalhGVllTaHl5UkdRVmdNNldP?=
 =?utf-8?B?c0RBUXNwNm5tUlZDMWNLa3JmN3FRbUVRY2ZudmV1cmFhSmdDMmQrakxhTXNJ?=
 =?utf-8?B?M0U0V1g2d0M3dDdCbWVudWRHZGpSQ1RWTjZIcHgzYlZRQzBIODhJZW1RTHU3?=
 =?utf-8?B?OGpMUk04WkM3UGdYZHJDQkVnTERtdUczcGtaWXQwRTdVeGdlRkZ0VGZXK1M2?=
 =?utf-8?B?ajhLK2hoWXd6RWZuTkx1ako4NEszelFIcXlQT21CRGQvZkZWWjlKTHNEK3BH?=
 =?utf-8?B?MnJrYldaV2c1cnBWN0U5UTZIYVI2ZEpyWTExblJoT2x5OU1iYjA3Q3lERi9t?=
 =?utf-8?B?MUhwLzlrY0ROL0RYWlRWcVU0dEltSTVtSjcva0I3RkFXWkM0UTYvUDIyTENi?=
 =?utf-8?B?ZnQvQlZPRXhIbW5lSlZrYWloUjd0SFBYYjJRRURZMGZ6R3gveE9odjF4UUwx?=
 =?utf-8?B?RFNUNlVBZnI0Zy9mZXA1dUxuY0RSVzlQN0I3Unl3bTRnWDg4L3VtQm51Z1p3?=
 =?utf-8?B?WHBLRDJqeHBIMWZkMVQrd1ZjbXlIYnNJSVVzVWs2SkNuN2pOTERMTCt5cExm?=
 =?utf-8?B?bU5FRjVVNFlEM3Rud3dYZkRXbUxKb2E2NjJuTmtXN1V5OHZvQVJyZjVRY2JR?=
 =?utf-8?B?SkdETDZDS1pwcndub3RFcldvRGJVSmZHcXRmenlVMlZId2FJTzRZeURuc28y?=
 =?utf-8?B?RnZHcXA5YmRtWlFDcG1DQjhDeGlsLzVjZG1nYW1qekZTNVJVTkNrSDM1akJm?=
 =?utf-8?B?UzE4TnlYZU0xd3dzNG9SRU9PdXpKYW4xTjUwZDRyYmlJOEYzQ3FLUmI1aDNZ?=
 =?utf-8?B?N2tPNmk4a001azV5dDJuNy9vb1pUajAzZ3ZoZDhNM3pOUzZCTTdFWnpqOXFW?=
 =?utf-8?B?WCtHR3FNTlgxdENhMThFcjBXQkZMRzRKSVd4RUNjSXpqYUJhRzN5TGNNYTFt?=
 =?utf-8?B?c1puOTlDN0ZwT0s4U2tac0w3TDZIb0U5TDFaTUx3Z2NoSTFGTDc4WmU2b2RB?=
 =?utf-8?B?enlpVGg1UkNQTDVQTzlyRlZlUGc1OGdtUVp3dlJHbTVuS25QNnpCOXFBV1h3?=
 =?utf-8?B?aFFIU1M2NGo2RzhmdFhoZmxPKzFKcHg3bDBaSnFMcVM4eTN1SkJaM2pHMXBh?=
 =?utf-8?B?ZStsWDhTYjVwK3VsWmtCLy83TXRzWllYRDVYQUxHWHVNK1dxMC9yL2M0ejhk?=
 =?utf-8?B?b1VWckFUZHpGR1hhVnZFWFArT3ZKTzluM3pVS2kreFBUcm1HUHUvdnFDOWNl?=
 =?utf-8?B?Vk1zcmY2ZHNielJWOGp2Nk1lSThTbk8rV0krWUVBQzdpNVJCZ3FxNnQ5Wkg5?=
 =?utf-8?B?Y2hmTlNGQnhydGZtUVJpWnB5WFAxUHdOMkY3VHJxMm5iZE5kK1k4YlFIbDVv?=
 =?utf-8?B?RmJLb3Q5anpxaWdyaUFtbDZ2RVZhYkVvaCtXYktUQUVneVRpR08rSXRSVlcx?=
 =?utf-8?B?UnlCSktvam5lWTZyZ0lnV3dobDVXSXloWEpSaXZvVHhsSUZueEhibFBwMGxl?=
 =?utf-8?B?Y2laaVgxTzMzKzczTHBOMmpEaXpIdzk0ay8rZXd0UTY2NU9tcTB2RkZNeUFs?=
 =?utf-8?B?eVloTERPVjJHdFRuWE9rWFRNMmRZUm41M2JFV1Rya1RoeUVNMDhxQkpONDFH?=
 =?utf-8?B?ZlVJaTdnU3lCRTNBbEtyN3hiN1JiVld6ZW1xR1g3SExkS1JEZWdzZkFjdHh4?=
 =?utf-8?B?NzFMamNaNENuMG9lQldMNGRUZ0FkTDRZTkZaT09UWHhIdGdnelNiRW03eG9l?=
 =?utf-8?B?Mkd0ZUc2Q1V2dUc2N050bzJJWlRyYU5YUmR2a0FFZ3VtOHA0VzdFYzRsRGZD?=
 =?utf-8?B?NkJMSXpXWWFybDk4bkkwek04Z2J6azFRMkgvaWFCcDBJRGFQS3JiVVVsUlo1?=
 =?utf-8?B?N21UZDBWZzZNNy9PL0F3UGhrL2Zxd0VBTVVqZ092SzRHZG9pNWhQeTRFQ2E0?=
 =?utf-8?B?ZmVUelk4eTdzOE1vcWVNSjJ3M2tPNkxLTUl5bjFuMmFJTjZrTHpieGtiTU5s?=
 =?utf-8?B?QzV0UHVUMU9lM3BZRnQxREpOMDFKSTNadGZMQ242MXZwRkcycE5TQUhOSEkx?=
 =?utf-8?B?UEkzOTJieUJ5UmpuYUhRbldHaHNSMHZFalNwK0JOOFRuYktiaHkzNHNYL1VP?=
 =?utf-8?B?S2dKdjdMQlJhc0xDZWZiZFJERFI0Ukhqa3JVZXJxMG9jZGJEcEZsMGR1Vlda?=
 =?utf-8?B?UGM4bmp1L05GQWczWm9LSTlQd0YzSGdSZmtFSktWOExIb0NZVTlwZlBSTUsz?=
 =?utf-8?B?ZDBXcUl6RXJMSytoZlptdDN2ZW82eDB3aFJpUUJMemNUNlVJOXhEbmE1VnNZ?=
 =?utf-8?B?T0dUVE9VQWdTS0JJSk5aUVprMGNlM1pyMVRFNU42bFkvb2RIc015VEljanQ1?=
 =?utf-8?Q?UJ6KQogcNnqRLM78=3D?=
X-Exchange-RoutingPolicyChecked: UdoVP2LXF2uytY9biHb64GTJWNMVoaCHecNzfI8HIq6LyMJxGcMz7GUhvg2B2axVMXia+UVTk4yabq1nJFStoz9CidYZkbaoCPep9uCF3HvVdRefXmrqlAS+0G1KGKN1KxteWBp19X8T1twyMp8y8hrQdXeY7/HzNN//2lXh/zI0RRF/3pDrNBCF81KpPNUpd4an1dcz7nUrL7vmd6UAydLWGcymXHDRkUjZhthlgZCjnqFVlSVrGwp5zkWB0BkfHj2RPQY+6JqvTBmfvUa+xqMyUOrJ53hUOYh5sNO+hpj5y4SBJpb2mnaZLU6sQ6Laf8PCrC0F/GicFZDVaEG26Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce4b913-6a17-443d-c4b1-08def1af00ac
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 22:31:46.7403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqXCgMxHG+QcutTHqFnDlhIkG7mldSORKmfmt0PS+jXVkfXtsFvY0VIj71GF+OAik39JSG2KYb6/m18MQUfLQ/nnsoRIsX9Qr2vyb7kXTXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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



On 7/23/2026 1:37 AM, Badal Nilawar wrote:
> Release firmware when the "LTES" manifest entry is not found in the
> firmware header.
>
> Fixes: efa29317a553 ("drm/xe/xe_late_bind_fw: Extract and print version info")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> index 768442ca7da6..1529a1de4051 100644
> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
> @@ -335,19 +335,19 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   	if (fw->size > XE_LB_MAX_PAYLOAD_SIZE) {
>   		drm_err(&xe->drm, "Firmware %s size %zu is larger than max pay load size %u\n",
>   			lb_fw->blob_path, fw->size, XE_LB_MAX_PAYLOAD_SIZE);
> -		release_firmware(fw);
> -		return -ENODATA;
> +		ret = -ENODATA;
> +		goto release_fw;
>   	}
>   
>   	ret = parse_lb_layout(lb_fw, fw->data, fw->size, "LTES");
>   	if (ret)
> -		return ret;
> +		goto release_fw;
>   
>   	lb_fw->payload_size = fw->size;
>   	lb_fw->payload = drmm_kzalloc(&xe->drm, lb_fw->payload_size, GFP_KERNEL);
>   	if (!lb_fw->payload) {
> -		release_firmware(fw);
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto release_fw;
>   	}
>   
>   	drm_info(&xe->drm, "Using %s firmware from %s version %u.%u.%u.%u\n",
> @@ -359,7 +359,9 @@ static int __xe_late_bind_fw_init(struct xe_late_bind *late_bind, u32 fw_id)
>   	release_firmware(fw);
>   	INIT_WORK(&lb_fw->work, xe_late_bind_work);
>   
> -	return 0;
> +release_fw:
> +	release_firmware(fw);

shouldn't the release_firmware a few lines above be dropped? Otherwise 
you're calling it twice in the successful case.

Daniele

> +	return ret;
>   }
>   
>   static int xe_late_bind_fw_init(struct xe_late_bind *late_bind)

