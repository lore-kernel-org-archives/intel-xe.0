Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8072FB5173
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 00:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C3310E2F9;
	Tue,  7 Apr 2026 00:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OA2MoO8Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C510E2F9
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 00:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775520949; x=1807056949;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zlq5vuSAJy7ZPl8YUZnN9fvuz8SWktpjCTDpTblcgpM=;
 b=OA2MoO8Qkaxw5qPh88j24+218+gjqLziekla1Cc7BFJjvn3Owd1iRIP2
 ZBouLYKyirSGZ7Vv6LznxtaXSS/n8oEymGfXGa1uPHePMktON+/UFKwjw
 X5PF724J9gzTKE7o7TmbPQhLqowLGTWQY+ouoX+i6RXLjgXhChYP6Ye+9
 l1Xu9r8xmpVSowSc9WJ5xS0ApfDwRKNth/bN5RQXaGakdKGze4/r7n74I
 ozsOPZNF3U1L8izexGQmeqhDggqOrM7WQodTmuMqVD70+DwGv6EwYdnh+
 CWFqm26BYjcXPnfm4/380wAItT/VB1XNToHhYRpSz6SFx1uP/0wZcmMNW Q==;
X-CSE-ConnectionGUID: 214pfHTjQbeHnljrygHxng==
X-CSE-MsgGUID: Yc0p0aB3TcWuqtKs4BVKnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87930514"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="87930514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 17:15:48 -0700
X-CSE-ConnectionGUID: 0VONIkJ9ShyYYJqAMaVK+Q==
X-CSE-MsgGUID: dY3lsvMySAmdeOohQW3K8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="232967918"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 17:15:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:15:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 17:15:47 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:15:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FnkN66WFYy9+Vryd9JOjyP3MfRS3splR6muka3F9XQwDPDkhyip7mhMnCV2OBr3uGzryW+dK5W2sur5fxojTSOB8J6jGT4q09diYI5P27mrTU+ZSbMjyQMgWrk7iD5prnbWkhqo99kgiSlYl6F/t3lqg1U0sZjHX5+qrzDw3y2Bkv2CHAEJ/jszGtrKTb5QC0rDPL3ZFys8h7MV8qnBDXrLnvmuM278gi/nQjtj31fObXtkqVqhbVXSMxetQS6T+H+Bc+yNmYtEn7jyxA1Fl5TzsrgC1Tmm97w/eKRvyGnDGHNef+tJkA5KZci3ToboOXCMDwmSu2qYsLbqOV0IGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tltT7z/tlrZcbFDMdj2z6DwujyqxuVC/V85k2Zi330=;
 b=Wk0qYvs24xZHV7mt6IdouX79cHFTWWJPXhbdpn79ce2/u09DyLdu2ytIQbkKdoCKUoTW85WLTi7bllmw41WJQ17KLKaz1uMsFLDd+DClXIv4x23Tk1i/iEBKqxgiWIShf2dNW/Z2TwIfl1t5J+zpl+WOEGuUebE/V6RPhHi60B5sXGfnDCFqVbS0BMWhbY6LpxmS9Wvdcx2QGqZduulh60SweTIn4UfHr2d/j8fccOV04mX6j514JHXrp7NOK+I40Gyfz5p3PLtFHLq2v26HeqgSUjVCwWKC7hlELlZ97+NtT05Ho4043QL3Qfcqkz/0mwV7Z3eXq0qc7bUfcnnRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA3PR11MB9351.namprd11.prod.outlook.com (2603:10b6:208:57c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.14; Tue, 7 Apr
 2026 00:15:45 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 00:15:45 +0000
Message-ID: <6c5be6e1-0c06-4bc4-b232-4b55112f3c66@intel.com>
Date: Mon, 6 Apr 2026 17:15:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe/uapi: Fix doc formatting and completeness in
 xe_drm.h
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260331172049.3053871-7-shuicheng.lin@intel.com>
 <20260331172049.3053871-12-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260331172049.3053871-12-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|IA3PR11MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a31c72f-e40c-447b-66d5-08de943acfda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: bw/iNnu6OtteVKNZiRzTmvUPEhX1G4EipSoS7kY9hVVFBVCN7MehYg4G16ewar6zNwPsMubGhuYhviCp3pApyZkGE9zhg89OHLDeF1D8sgN0Q42rMGaCsjrHZQYK/Dkoay7IGWRSLeJEdRhzissg/bKO8DTKRbTs1xlv8tbzv5kVqB7wmb15aPf+E1lQX2jSPUnK6WWFu+QwwX+5s4h3nzmFKXo/Y9j0KAoyIymt3VxPjld9/ZHy3tgXCWvw2bWWj4G/eP/+q/OxGk7lZaUsA5e7kr6wRhaa1n8ZqTGoiMTpF30PaKmO4CJVEnAz9WifPZA9EokfzFq3rP+xYtsi9ApwhFikERA/fyg8cma/NiU0x1n+2pKpl7HNgBY/LAp1sksP/cfNoDXpOafw/pAGqWU7pezMOfxWSmcZbMXNbEBDP0jQrL1EGpT4c1CxsxGnFtotpq5cRFs0yEOSRC520iF4Ibfhf2JblIFR65chRiELhfKnLE48HCVRCGjjsuKKK0EZ/Y6Vc54YrrlYHcMbs7JEWwDtXYkXQdcfumiD/gcotW0+NekP7CmHiXdhSel4+BLdHmO3BJ5KPNW6moEDgknydnBSPb0sR2ELUpq70/kB1WMC7XccyXtqCjFVGJExGlle6mVAMA8KqCqFptxKclFJHSo2pwu3SAHb8hSdNLVYbN2U+pDMSO//zRr1iL+d/89i2qhQ8G9efX+m6Cpl4G59IM3t9VcMHH1NwEYOVVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZWNVlSWnIvRmRPNFJkd0ZDbzJDNGRCVzYvSXJ5VlVNZGNhdGc2b0pLai8w?=
 =?utf-8?B?bWpLc0F4SFRVeVNWaUJqNFlIbDZTR01ORWRyaTdTanhoY0RJOGRRUDJVSzZJ?=
 =?utf-8?B?TU5oUjVBWi9EK0lGRjJyZlBGUTVHOUxjOEh0OUViNitvYVA4UVczc0h5eWw2?=
 =?utf-8?B?bHFBVjBjc3JuTGRIS2thMWE2NnM5M01ienJDMWJFeUx2NEVCazhDaURxbzdR?=
 =?utf-8?B?SUI4Q1BackgrdTVlU0dwM2NmKzBSOWZEUFNzWmVKeUJXdVp0TTloVWpwSEw3?=
 =?utf-8?B?dGFnVGhuaHYrUkRzbzkveXRyMnJhUi83b1JEaXI2K2d6MGlPMnhkTVdla0Nk?=
 =?utf-8?B?aXpid3VvMDIvY2M1TitmN0hzemI5dHVualB0RmpWdTRNd3dVN1c5MWx6eW5W?=
 =?utf-8?B?aEJvd1J5VnprRURCMW9CRWVMTk9DM28yVlJaUUtUcHVtcE9FNVRrUzBIUjRS?=
 =?utf-8?B?OHFrUWt0eFJQd2tUb3d6WGpiNVVuUDVlVlF3eHg4ZWxXZG1INzQ1RW9ISERE?=
 =?utf-8?B?bXNua1NKWnZCVkhVYWpzaTlPZnprcFVXRjRwUEtSbWdvaUM2M2xWakVtbFZo?=
 =?utf-8?B?Zm5rTE15MDVuRVBGZkVraU12T2tJaVZPQ3BKZzJvYzhnMkhWM3VTaDZjanV1?=
 =?utf-8?B?NWIyTit4WWxKdEVzMG9YalMxZlg2RzNmMkpkMzNiL2FGclozc1hWVjNnWFRk?=
 =?utf-8?B?YUdQbUVNa3hDMmNDSFpFVXB3SU9Gd1R5T3RpSFc4SlZhZTlQblpjTjIrN3Na?=
 =?utf-8?B?UjZUaUxML3crSmU2Zms3N2lmRTFiNFNpNHVFdFdhMmhsaE1ETEJZOURzVXR6?=
 =?utf-8?B?ZEdLQnJOSG1FeXRqMEpXTXVjTGtYbEpXQ3gyVjNwMXhGeW5IQndjbTQyL29J?=
 =?utf-8?B?NUw2M0ZBZVNqUFl4RWswVVozRW9EQ2ZYS3Z3V3FadFBxbTlZNzZSWXc3cXFi?=
 =?utf-8?B?eENsS3FqbHJwQVZwdytlMjltNm15ZmxxM3hGVVNoV0ZCNXV3UDN1N0twdEg4?=
 =?utf-8?B?bTFvTkMzVHVZUHl1OTlETHNsaWc3OHpiLytrS0hGOEs4SE9CaTduRVBSUFdJ?=
 =?utf-8?B?Sng2aDUySXZGSEFoUHhvMGtMeDJYQndSbjNwRGw2c2JaZk9sVm42MlJ0Zldm?=
 =?utf-8?B?T0NsM2RoVEZkZHExT1lnNzdLajVzT3BkbUR2Wmd1RG5mcUVJclV5NFE1cklL?=
 =?utf-8?B?Mlg1dVVENit3VndyV214NHpVdU9ZTk82WitCOCtndFVHUExnTUNCUVZnUWRo?=
 =?utf-8?B?VFNHQTJ6T1Q1Y2lBWnpXWGk5SmVFMjhBazBoWDQrUjhtWEgycGxvOEE3VGZW?=
 =?utf-8?B?UUxqNUNscWp1LzZ4d0s5UGZ3Uk5iOUNWVzdNOVc3dS94UmV4YmxybmJ6VE1r?=
 =?utf-8?B?a3BBb0t4S1Ava1F0d2NHNjdyMXJIbElvNmkyNGUzaVdiSHI3SFIzQmRFRS9D?=
 =?utf-8?B?Ly9SYzY1azlxZENNRjNaRUZoWnlwTDJVRzRFVlFON2laQnVhZkpYVU44Q3Br?=
 =?utf-8?B?WlJGT0VkYzRwS0VCa2dXYjlzZHZQZTlsdmFsQUdTWEV2aldZbW1zYU5UQlRr?=
 =?utf-8?B?TVVpbVlTRTBVUWx5dHBSOHdrTU1YK0J0Y2hMWStIdGFkSUZHdzRtZDJ4QXdR?=
 =?utf-8?B?S28wREx3S3pPdkZuOVgzSURzSGdSb25XSlUxc1BieFNiSDc3Z213QndMT0NX?=
 =?utf-8?B?ekZReEN1SFhRVUtiSk9SVmF1VkxSODN4akNZaTJjeFBFblJTT1B6WERjNDhl?=
 =?utf-8?B?eUxpRzlUVVFGczNTMjVRbkQ4Q1VaZnlUMUJOdGxtOXlDLzRYYjI0SnNOY2Uw?=
 =?utf-8?B?TGtyZjBUSTQ1VXZvdks3aHlaRGFCZjZ1emh0ZWl0RkNURUZtV2NUbWpRdVE4?=
 =?utf-8?B?VS9RRUJVMUhuVHdNRFlDN1B2ODF1Wkd1amh2NkJsTjdlUDdKcm9MSHlQZUV2?=
 =?utf-8?B?OWJrb3Mvdk1DeEhWWDZQc2tBb0RLNjZpUmhMMFB1K3FWTUg4djM3WmdtN1hV?=
 =?utf-8?B?bEZRN0U3YlhRYzFPa3E4S1dHMjVLZ0dEZHk4aTF1a0hjYkdmWEg0N0xSNDMv?=
 =?utf-8?B?dTlzY2ZzZHFEdWFDb1RJdytvNncwS0JNcDQybmlhTndXV0ROZkZ4TU1OSnp4?=
 =?utf-8?B?WXB2WERBUC9laTVWNEI1UVl1Zkh3VzJtN3RPbExTMS9UOXVzMkkwY1d2dlRm?=
 =?utf-8?B?SWZpK2xKZm4wWEpHd3ZnYVYvZitsVE1sc3l0SnJaekR5Vm5qVFRldldFQW53?=
 =?utf-8?B?blgzcWp3OUZ4RVhMa0d6Si9kdzg3bk1SOC9nUmhlODhHWGcwVi94N0JvWHdR?=
 =?utf-8?B?ZThsWlBsZmxPdEVuUmMvNjhVOVFmUlhxMjBnRUVaRDJYNUptWHJYdz09?=
X-Exchange-RoutingPolicyChecked: YxRJvKCQCb1hYtHi8QR5zJkBTr26pX+kscIGKXSdu7+K3l30AwEI7f7nT4U9wgD8V9sDNp8A2j14Qefxho3jxViyS1DdDp+Jv9f4577fmXtJYFqiPY3yD4Ypn2Vyaoe3Dm8h7S/Gp5QK8VrfAUmtEe97AefftNkbWBiRMc1xqnxgNS47Paf7Mq7KCcYvec4WnuN36tfe5rHqy2YN7Nk8NT6ZKHEsul3dSX4irsIJmWVqRMtAluaE6vAOQm6wnpmyX7Pf0oIbJxESki9hdK+hhA8f2K2c+J3Wf0MJtyqCV4LLPe4NyfF4ArXvwY4NDWtRHKgzp5VhS0hRsRfMDjNWFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a31c72f-e40c-447b-66d5-08de943acfda
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 00:15:45.0978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AICN2hFsn/j4BeWgiL5baFYpPVjutnmtobI/+X7w9+aYEb1Mf52wJ01ro+sLiuzTBcNQAoa9gYboVQgS1qP7sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9351
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


On 3/31/2026 10:20, Shuicheng Lin wrote:
> - Fix missing leading space before closing */ in
>    comment block
> - Add DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY to the
>    IOCTL overview list
> - Add missing query types to the device query doc list:
>    DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
>    DRM_XE_DEVICE_QUERY_OA_UNITS,
>    DRM_XE_DEVICE_QUERY_EU_STALL
> - Fix ioctl's -> ioctls (not possessive, 2 occurrences)
>
> Assisted-by: GitHub Copilot:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>   include/uapi/drm/xe_drm.h | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index c2e8cf31a82a..9bec0ba1feb7 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -83,6 +83,7 @@ extern "C" {
>    *  - &DRM_IOCTL_XE_OBSERVATION
>    *  - &DRM_IOCTL_XE_MADVISE
>    *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> + *  - &DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
>    *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>    */
>   
> @@ -167,7 +168,7 @@ extern "C" {
>    * Typically the struct drm_xe_user_extension would be embedded in some uAPI
>    * struct, and in this case we would feed it the head of the chain(i.e ext1),
>    * which would then apply all of the above extensions.
> -*/
> + */
>   
>   /**
>    * struct drm_xe_user_extension - Base class for defining a chain of extensions
> @@ -705,7 +706,10 @@ struct drm_xe_query_pxp_status {
>    *    attributes.
>    *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>    *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
> + *  - %DRM_XE_DEVICE_QUERY_UC_FW_VERSION
> + *  - %DRM_XE_DEVICE_QUERY_OA_UNITS
>    *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
> + *  - %DRM_XE_DEVICE_QUERY_EU_STALL
>    *
>    * If size is set to 0, the driver fills it with the required size for
>    * the requested type of data to query. If size is equal to the required
> @@ -1758,10 +1762,10 @@ struct drm_xe_observation_param {
>   };
>   
>   /**
> - * enum drm_xe_observation_ioctls - Observation stream fd ioctl's
> + * enum drm_xe_observation_ioctls - Observation stream fd ioctls
>    *
>    * Information exchanged between userspace and kernel for observation fd
> - * ioctl's is stream type specific
> + * ioctls is stream type specific

Reviewed-by: Xin Wang <x.wang@intel.com>

>    */
>   enum drm_xe_observation_ioctls {
>   	/** @DRM_XE_OBSERVATION_IOCTL_ENABLE: Enable data capture for an observation stream */
