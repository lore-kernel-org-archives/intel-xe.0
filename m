Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB944CEF173
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 13:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BFB110E530;
	Tue,  8 Oct 2024 13:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iXHy/jNh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B430910E530
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728393935; x=1759929935;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e6+thbDuhhv1nrTBFol73gXryXCmTLxwT0f3nmmLpAA=;
 b=iXHy/jNhLEyrtxiGcqILrIwTVgwdiozIm+g442wXdg7f+ZLdsIdn6We/
 M0IO+FsTrpq248ui/oIdHnyBaJYAB2SEOef1XqBJ/wsxCudOu72SllpD1
 ZSu9OylgUifxeumuxB8SEaVHJfYm78ubWJiYyfPOsmMYGnTRX/7Q6U1uQ
 z18n2oifBIVgAEiGNtAcsooiYKCBrqYVIf28DGc6AjXNESza2kX4gcpxL
 qVhBu3GEQQS4HY8RllQjuyMLOkTC02uzAui8HO2imSxhL2Uzo0GkZt4qx
 xPuJbn+YuflkLmL2SJPIgeFeJoJ6fpBWsCWdwXp5KtCKJe12cKeKhfeBM w==;
X-CSE-ConnectionGUID: 3+mQmf3/TseYi3+nkd91vA==
X-CSE-MsgGUID: SyJKdPzPQAa1MAXr+JRpCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27679517"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="27679517"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 06:25:34 -0700
X-CSE-ConnectionGUID: I6eJotjZQE6UaR3QvL6fmA==
X-CSE-MsgGUID: oh1rbXKcRCaXnYjb0zar0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; d="scan'208";a="75795211"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Oct 2024 06:25:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 06:25:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 06:25:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 06:25:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiv84cUNUxGSHymtgNnE3E8ENFQZ9GFIyPVg6BW6wDCzw9rL6nK5TCyTo8PFPhUE57s3kCQgjlW8XerZvRoFkfpZnh2vI5a+Tzsj1EGDzNT7hO5LWCAd7Ji71nexilSdVn6+zbWEYMzO2TioEYIzfItHb/hTZB4b6HfTOgY3z/uO8+HrQLvBPbDALdZ7/JreSvHHjs7m4M1q7rd0WLQLh5UiJaXB4PWrKkVRI1Kq1OJTR/D3HEeAZji8TEZnOmOdYK8LNBi8VNj6S8kxRnc2lX4HK+FndYp6HcSROwKsvCgy3xn+La5sOioAJOGeajdwv1ueTOyrNfcr0T0EJe50Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEhhBQCKhcZDhCfleMnj6VmAygdUuKUIAjXntciL+OE=;
 b=kt6SxqmbwaU9z/5yjsIGvVckfodgj7TxnSaUy4iwwx8oDj2zaeCQbiwFBbDzB479LfJJ5d6aXcNaLwQUh/yurKZXnkG+2seg+B8z7vr4++Z710OHNTcHLQWNQduNwEtUq3QiBlPCoOx0zNLnXSJr7EDWyMgDH1osEEyJZj+kBVG93tSQMIaQsFgSx5868ksolUfACLpEs1jJxSO5Wk9YYZKcXDmLhCgBM9HvBYaWJtakW0Zt/G2OWDzQTJNXZkXPI6TbD/tfF7HiOAqFqzSbUG51LnC5verVqD+SNoi1FHmaDEyhGnL3xHYo6j9sKKaic+auFoCcNBe/I24Bg0biag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by PH7PR11MB5793.namprd11.prod.outlook.com (2603:10b6:510:13a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Tue, 8 Oct
 2024 13:25:31 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%3]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 13:25:30 +0000
Message-ID: <f3a2666d-1773-4945-86d0-24148d0a91d3@intel.com>
Date: Tue, 8 Oct 2024 18:55:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/xe/ptl: Add PTL platform definition
To: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Haridhar Kalvala <haridhar.kalvala@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
 <20241008013509.61233-6-matthew.s.atwood@intel.com>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <20241008013509.61233-6-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|PH7PR11MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: e0540739-05bf-4f1f-acf6-08dce79cae28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3g1dEMySXVFS2VFWlBsa0gwelg2cXgrRVZFN1FtamlObzVIcXN5a1FsZ0Rj?=
 =?utf-8?B?aWkwbGdWU0FDdnNWTnFGMGJnbHg1T25BRUlKN2JCdXJHQkVWKzNzOSs3VE9F?=
 =?utf-8?B?Uk83bnpMajZrRzQxZVdFWHhKcEVKQzVLWlE2VkdtdFpYbHVYQTR2empyTHBr?=
 =?utf-8?B?YW1ObGl2QmNsOXYwa2YrM0pWcEtrekd5aVA4U3ROYm9rb283N0FJUHMrdjNJ?=
 =?utf-8?B?QTV2WUNxekhRY0pxN2tGeFc1TGZuSjZLT1h5YmZzZEduNVV5MlJCdVIzQXFv?=
 =?utf-8?B?YjRlSzduTXVCMnVJRlE0UWdzekpScFlVTndMOU1ScnpxVHMzeWRpai9lZHdW?=
 =?utf-8?B?aStTVmFLMlFDcTBPaWJJUjc0dU1IQUIvWEZvOHFFWGFycGtET3pBZk9WQW5R?=
 =?utf-8?B?b3VyNlpvb01ZWWpOaVpwdlJiM2M2dmtaa2RsYU9rK0luVmwrTTB0ZGhNbEVl?=
 =?utf-8?B?S3NIMFU5VDZsSGhBYVYvaVlvK2YrYWdVYzdqaUNBUG1MSXhjQnltYVk2Z0lM?=
 =?utf-8?B?eUtBcW1JQXJjTERUNmdhakx3TW53WHdwMGNnV1RGMGsyK1RlOUNmQjlxNVFY?=
 =?utf-8?B?N2hxMHFGcDhveUZUUDhTeUp6OGx4d0dvaXdSd2Y3TFZUZkQwZEtLNTN4aUNR?=
 =?utf-8?B?ZWRFOXBaWEx0dVVxOHBrenFBcWhDdjRvdGk1YUNzSFl4V3ZTZjJDd1NYWVhP?=
 =?utf-8?B?V2Y0WDJtUmJ3bTZHdk53T2IwT3Nlc3pyK2dTZFkyU3NyNmNKV3U2SDZBKy9r?=
 =?utf-8?B?OHZNL0l5cDN4Smt2dnZPckpDazdWZjVkL292VU53ay9GeFo0a1lCRERMeDFp?=
 =?utf-8?B?UHgrTzVXR1Z1a29DREkycGMwT3Q1SU5PdU5MOHdQRGFzQmlvekZ4ZG82S0xa?=
 =?utf-8?B?ZjV4aFNaZStTM0s4MUVIVHNTRjhwWHk4TWpxaGxrTjNLajJ0ck1rM2dibmJ6?=
 =?utf-8?B?bEwwckFhS2svaEYxVDlYQVpSRWp5YmNneGtib1pYU2VOT2VFU3pOVU05SDk0?=
 =?utf-8?B?aE0xNnJXNFFkU1Bhd3ArZFEwVHdod1VDTGpYcEVQZjVEYnlyemsrb2l0ZTA3?=
 =?utf-8?B?Z2piR3llUXdyTWlBallBODROSzUyVjBkZ0t4WVNmRW92dlMzZG5kZk5UL1g1?=
 =?utf-8?B?T2Z2SjZwRkpzeE0xeThCWTNYZGJqaEtlVWpMeEVudGcyTjBvK3l6R3A1U09q?=
 =?utf-8?B?MHhlTlJMeGxPL01BZUFsS0VtNHJPK0VKR2RpZjJPNklRMk90V2RMekZ1RExG?=
 =?utf-8?B?WkYxNXdxZlNrdjM5MDFZK05uUXc3Q0hIcThGa2k4MTl4SkV3c2YvUWFWb3c0?=
 =?utf-8?B?YkpSbCtDbDMySnNyUG5JdWw0alo1THVwWkwyaWFlZEkybE84RE54aHd0eDdh?=
 =?utf-8?B?VkwyWHhBYnFQYXdlMFNsQUVCa1RlUTRRNmRNdThleHVSYWhkc0k0NldJSEln?=
 =?utf-8?B?ZG15a0dRVWdMOExQS0sxaEtrOHZ2S2ZvNGo2ZTVxRFhnd3EwV2dsbUJmSlcv?=
 =?utf-8?B?RUIxTi85V21hL1lDRS9ycWZzRk1jUVpvZTlta0JISSs0Rk9lWXZWR2R0Uk1F?=
 =?utf-8?B?dy9DWlJIWmhSZDN6RlZJWFBaSmEvdFdmQWJiSXdQOFM2L25Cd2FxM3lKcEJy?=
 =?utf-8?B?dHlPUDBCakcwamtCSmdLQXJrZm4wY3ZubGRxclhNaUxFekk0QkhxTW9ZSEtK?=
 =?utf-8?B?OGdoMENLdHV1NHZOOXpWKzdTTWJqSGRyMUtjanRTRi9FMmlFUW4rY2dBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek8wUUcyMHV0V1l3YUI3a1V5MHZReHllbGd2WGtiYVFNRTBQUXUydnNENlBG?=
 =?utf-8?B?WDNZeUdqeVpsQTdqMmJTa0hJTk9kVHZwRE1qQ2lZdFZ6ZHQzVFlTY1FiZENY?=
 =?utf-8?B?MHJiTWNlWXMvdzk1QW9tQ0dKV3l2MHo1RlhOQVdKM1dmMyt0STliVlVBUGR3?=
 =?utf-8?B?clRaaVAxVWQwVmdDalhpYUNRUURPMXBqZ1RVaDByWDNPWmpVeVRsb2R1dDRn?=
 =?utf-8?B?bVNkdnB2dXoyRm1FeWFkSi9HMW5tY0toY2thMVh5Zy9JUzE2eUIvQmRGN1Fa?=
 =?utf-8?B?RVdvbTM5OU1zeHNjNWJlMGZXWXVpcmFZUDlNM25pbmpsd0VpTDZtdStwczlj?=
 =?utf-8?B?MFNMc1VXSTlFS2pwNndWRmdXRnVTNUl5ZkV1cUJTMXRNTm1ZSjdKNEhnLzhq?=
 =?utf-8?B?UW5mRUJkSldRSzNaNmNtSVVVU2JFQU85eGI0aWlweDNTTWRsa0NwZkY3ZEIw?=
 =?utf-8?B?T3ZVbVlrVnQ4L2RMVll5aHlLcXhxRkdxcTFMLzkrd29OT2o1Y3dIV1AvRXp5?=
 =?utf-8?B?T1dSZTQrTFpCR0wvQ3RZV09OY0tGVTYzMlBCUk1WUFVGT3J5b0tyM1lsSUtu?=
 =?utf-8?B?MWRMQ0JsSkU0QnN1anh3cjNPcXJEMzVRVS9JVnVKeHd5NDdOZ2NaTTZhTHVj?=
 =?utf-8?B?ZXV5ZkpveEVkc0RlZGIzUkE3b3I0M1QrSWJHbGtzVnFaUXpBMWNodDE3c2Zt?=
 =?utf-8?B?YmRjSEFtUDd2ZXRSaGFIbHg2TFBIdWQ1d1EwUjJKb2hQV0dkVlhla0dHUDVy?=
 =?utf-8?B?ek1IRnFBK0tNYVJ3TkFSTDVNK3pJWFo0S2FMV21sTDVxbzRoY28zUDFiODNF?=
 =?utf-8?B?anBvVFRYSitGVTRieTNxZFRmUm5OR05rTmNxSU42QjcwaDkrN0V5d09TZE82?=
 =?utf-8?B?dGI4T1BtbTJBcXMzWjVxZDVicTcvNDIyN0ZscjR1YkpEbmNrRUN4TmNENzVE?=
 =?utf-8?B?TmlWN2tIU01pRzFndGxKdGRBNjFRNVpHL0p1L285QmhDbEs3TnU1bkpJUG8r?=
 =?utf-8?B?cGFlUlQwM3ZRQVZnUlFJMUE5c0R4ZFRwSkp6VGJ3N29OaXgwVnlvWWFUcjNs?=
 =?utf-8?B?b3RkTVlydDBBV2hvcHhqRXlTRnl3VEhYTXZ1TVVkS3RRRWJXaTNEbk9renFM?=
 =?utf-8?B?S0w5S2N6ZFQrQS9sOVQzVk94NUpSOWJaaFFJTXdacEIzaGZRRW9TbjNlaG1l?=
 =?utf-8?B?WWpxYXM4Y1YvYmNMeXNwNUhiUW1hR1JRKzRwYVplOXloS216M2lxRUw1RlBO?=
 =?utf-8?B?WGF0K2NiSlNOZkcyRFhqUHM4Z2FKSjR2WFRUa0JuVTlONzhUQzNwaU1hT2U1?=
 =?utf-8?B?SmFvYWVSTWtoc2VHM3ZzbSt6V2V2NHNhUDQ1cXNZQ0xXMzloMnJOUEEwcm5R?=
 =?utf-8?B?UEdoMXdOVUtlam12Um1XTkpxK3pzbG5HMHp0UmZ3QnJ0b0NET002NWNxRDNM?=
 =?utf-8?B?YW5ZM1JBV0lpNTg5Y01peEpNS0NQcGNmMTRkbFR5anZuQ3lzc2p3bnBNNlpO?=
 =?utf-8?B?Tkl4cFFHaFBwMDRhQzJOOVgwU3RFclpIZnRaSFgzVEptcW1LTmJKcEh0WWVD?=
 =?utf-8?B?aFRTVWdaV1F0U2ZpRlNnRm1iYVdlWWRzcU9TcGJBbkhQd21uV283elI3VkhD?=
 =?utf-8?B?aUt1VUJhbmx6aHNoeTNUYm42N2NERlNMYy9xYW5NOVhSTjVmTkk5VXVNUmFO?=
 =?utf-8?B?bTM3dVRQdVFwTlIvRlVNazVMQmYxZy9yUTNQKzNlQ1lOVWIvRzBoRWp6VTdu?=
 =?utf-8?B?TEtkKy9oTHBnYmxQMzZRL0R1ZnVYcUV3d3lNSmp5RTh6ejYxVUtTMGhOQUp1?=
 =?utf-8?B?eDcyN3J4QUs1TUdrVjhkVkFXejR0ZXVWRDRJU2I4NlV0a2taQ0M2M0I4S01y?=
 =?utf-8?B?SlV5ZG9XWkxQOG5nbHIyVjUrYjNjaGU5dHBkVHlraVlscFc0NmJYSGRGQXh2?=
 =?utf-8?B?TEdrbHJEUXRUaUFRMGF1TVZ6TS8zaHZMUktxSk1tdHc2VnpTd3IvSWpia2JL?=
 =?utf-8?B?ZnA5WUxYTXRrUUUwVWJrUWN2UzdZNkQveTlxNFpqaTh3SVNrYmMzcjhsQllL?=
 =?utf-8?B?QjJBWC9kKzRET09jdWdPazhJbDAxY1V3SE9nWFZtdTJsdFlleGc2VXgveGY3?=
 =?utf-8?B?ei82aTZSdlQ5SzJqUmVsczBWS3hGYksxWEVKTjI5bVdTczZyNXlXTlJuV214?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0540739-05bf-4f1f-acf6-08dce79cae28
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 13:25:30.5516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYnrzM2Icv/0+BiEL9EKpXiQ9ElChCGTWXQSQH4iH76HMzJ8Fy1SlXq38A1tTIt0LYZOizG1vjSVKikIpOz6F7+l6ex5Jphuy44ePh0RXHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5793
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


On 10/8/2024 7:05, Matt Atwood wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
>
> PTL is an integrated GPU based on the Xe3 architecture.
>
> v2: explicitly turn off display until display patches land.
>
> Bspec: 72574
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
LGTM,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pci.c            |  7 +++++++
>   drivers/gpu/drm/xe/xe_platform_types.h |  1 +
>   include/drm/intel/xe_pciids.h          | 11 +++++++++++
>   3 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2139edba9062..4085bb3b6550 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -350,6 +350,12 @@ static const struct xe_device_desc bmg_desc = {
>   	.has_heci_cscfi = 1,
>   };
>   
> +static const struct xe_device_desc ptl_desc = {
> +	PLATFORM(PANTHERLAKE),
> +	.has_display = false,
> +	.require_force_probe = true,
> +};
> +
>   #undef PLATFORM
>   __diag_pop();
>   
> @@ -400,6 +406,7 @@ static const struct pci_device_id pciidlist[] = {
>   	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>   	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>   	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
> +	XE_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 79b7042c4534..d08574c4cdb8 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -23,6 +23,7 @@ enum xe_platform {
>   	XE_METEORLAKE,
>   	XE_LUNARLAKE,
>   	XE_BATTLEMAGE,
> +	XE_PANTHERLAKE,
>   };
>   
>   enum xe_subplatform {
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 65520a90c17c..6d8d013f74e0 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -220,4 +220,15 @@
>   	MACRO__(0xE20D, ## __VA_ARGS__), \
>   	MACRO__(0xE212, ## __VA_ARGS__)
>   
> +#define XE_PTL_IDS(MACRO__, ...) \
> +	MACRO__(0xB080, ## __VA_ARGS__), \
> +	MACRO__(0xB081, ## __VA_ARGS__), \
> +	MACRO__(0xB082, ## __VA_ARGS__), \
> +	MACRO__(0xB090, ## __VA_ARGS__), \
> +	MACRO__(0xB091, ## __VA_ARGS__), \
> +	MACRO__(0xB092, ## __VA_ARGS__), \
> +	MACRO__(0xB0A0, ## __VA_ARGS__), \
> +	MACRO__(0xB0A1, ## __VA_ARGS__), \
> +	MACRO__(0xB0A2, ## __VA_ARGS__)
> +
>   #endif

-- 
-shekhar

