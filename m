Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8067CAC5B8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 18:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD8310E148;
	Fri, 26 Sep 2025 18:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIxF3ig9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4669C10E148
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 18:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758911174; x=1790447174;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CZqcRbV1tnCRYew48lqfy8Vf/cqmh1azrPDvab3gVzU=;
 b=QIxF3ig9CS53qzuDVnO1OEreTbRraXbP+UfTzWV48z/o1Tep8Bn7etHY
 t1Ktr7PKH0em4nCufD8Ia3QNF8lMESkuK0Udemo2Jgm6OWFsN5uI0zG4i
 yDbTthK8C1tQwkOaYqRcHJ591KLhYARCvch3W39oCksb0N/GXUdsSQgMo
 NqFfM0iEXWWdRQET01y/FxUcmCD4pXXYmXeqw56MPSQ6kggsmyw45qQ4s
 LRMlpbV/+dsmNfP40S1WAiW+z6kz2xE8/v1dOCclGDkpEFHc3GAjrfUDa
 TD0cegvXWxh9HP+2GxMibKH7QyG7Xn/I5L7PpW2oLQEqSNl8ztBQsDzBW w==;
X-CSE-ConnectionGUID: dGktXkOFSz2hc0PiuLSj4Q==
X-CSE-MsgGUID: hCiDuk3zQaqtKCxYGLI5fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61203877"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61203877"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:26:13 -0700
X-CSE-ConnectionGUID: EaVnMTW/QS+ta6r3EOpXUQ==
X-CSE-MsgGUID: PBS4IMwnS96LqQo/dT/+Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="214822656"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:26:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:26:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 11:26:12 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:26:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jg5ssS9nfpOSxOLmeVSbOyoDXcwdcciwo4uxQ1qQv6OIspnjoYlkgblD3rZpN9H5bgMWne8ubXCLuhJ4lDQvYASk1mmZBZdUCS87dFbEMOmGanWmKccmsWn6VG+mPOUKSDyak/aU0GKFdxm+dKE+w203KGbmvJ7G6GsGTjyRAMNFf7JexM0yPvHrNQLr39SYcXapsmrE3iZmZJ6ZXGgCEe57XjZ117iwdtpNEQ5lTeXYMT5UOemZepmLUFM6UrrH2U++8BDtFQonEMznJ2tS08gxLvkSvrUjJSz9Jck157PmHmFigmECkMRhgAtHGsn3ouCxlQjnW5XFKZ+T6OQAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6D2LKFNN0fQ5vvjgjK1IGL4MMGGhzOxHKsdH0aIWME=;
 b=EnpiaAPhTI++C9vWnUV87MjbQW89gB2e182DV8z1LoaibBKTj2Xqlmb/VcvC1xr2btoSY0dsI2p1MsvgClqmfHBVTWH1h1y8s+OYkZPuJwbskFygnvErg3tU2RfrKBlGgawL26ZehMPyzDl7OuKoKVKHoYzTw9Z1ECsCVl8QaYjRT149WxXmhmkS5GUHbP+LZN927kvz+D6ohe/8dlgLINCT+CiQOMlgrZ3SMLXgyS1F6hXbEY4iVzcEJ4uGDQr83X8UGynO6gGjxuUmmLxly318C1Wm7fYkDCBwrkh2rG6ey0Ym4tYupGDNHH++0LluXKG3O1pgEw0dsRH8lNamng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB7352.namprd11.prod.outlook.com (2603:10b6:8:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.23; Fri, 26 Sep
 2025 18:26:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 18:26:10 +0000
Message-ID: <01362e3e-3ac5-4767-b652-e1f3fb367960@intel.com>
Date: Fri, 26 Sep 2025 20:26:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-9-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250926155948.145934-9-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6cb75f-83de-40e6-5d85-08ddfd2a2a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3NEQndTa3RMaEJaUDkrR04rQ1RtYXUvWGg1ZWZwSThwL0Eyc0dYQkQySnFr?=
 =?utf-8?B?MkI5SUdaOGk3enQ3R1RnU1oybGVmRXllOVRobXNWOEJ5Wk9RcnZOYXF1SUVB?=
 =?utf-8?B?V2RJc3cvYmwwUXlaSkZUbHIweTVVWHF0SDBSU2JwNFJMNit6dEx4WjZrdEpr?=
 =?utf-8?B?bzRvWElmUXJoZVpsTldoeHJzQlpweFp5cmYwR2IyK3pwNjc0WDFOWVozTWVC?=
 =?utf-8?B?SXB5ZERiWHg5dVJFTmxwemZCMHg0UkRLa1N6cjI4UytzQlJqS1dWWWNodm9X?=
 =?utf-8?B?M1FEWVpIT2ZKSGhScUQ0R3RPK0hWMVZUSHFEY2JZWnpEM3JheGdsSGR2N1l3?=
 =?utf-8?B?SWRRUkNOTjlpcmVqQTd5TlkvbUZ4aVp3dlZKL0hCMGw0SXBseEJ3OWcwOFZD?=
 =?utf-8?B?Ym1LNkk5VHUvRFBwVTNadGFLZ1krcTRBMXJWR01tRExsR2szM1YvdGFVcmdn?=
 =?utf-8?B?UmcxQklyV244T2NZV01hb2VVMkFVTk5BR055eU5jVDFMMytXTUJ1Tllxc0th?=
 =?utf-8?B?amR1cWJrYVBZeUxCcGJSVDFDNXJrRkgxdGpBUkhUUExyTlFxbEZKdFJ3WFRC?=
 =?utf-8?B?MndDcGJSNGYzS3djN3BjVFNNTGE2bmhGWXBERGQ2SWhxeUNWS0VyN083VWNG?=
 =?utf-8?B?eUR1ZUVIcEZqSXRHOGZJS045L01VTVZxL2wxbzA3ekZQVmRHbmhmeEdVaC8r?=
 =?utf-8?B?T3JJNXlBeGlUSEN6YXZXcmRvNE5GUjRXWlRvVFNUY1BOa0s0dnNtVC9jeU91?=
 =?utf-8?B?VkpGb1FFVlF3YkhuNFBPZlFqaFhPcTNNcW9xeUJLeW4rWi83S29KRklxTGd3?=
 =?utf-8?B?YmlaN1pyQlJZUXNaLzJWT3VGbDJKZU9nOS85Mmcva3NwTHMyQ2FJdFluNGpW?=
 =?utf-8?B?YldDRTNNRTFoQXIyZ2ZIc3djc2pBZVZONld5eWZxQXloYSsyTE5MOGdPTUFW?=
 =?utf-8?B?NFpaOGg4cjd5ME5tSXdMelZxMEtoL1dKY1QwVVZNcW92YVR4eTRtK3VSVUEz?=
 =?utf-8?B?dlR1OGxMc0o5QXB5ZURza2d1aElYNlpwTXBSc0ViU05oV2hsUy85blZ2cmNx?=
 =?utf-8?B?N0dsaVBnRXRWU0hJWGVpekZjN3VnVFgxbXo1a1MrOGlpcDlYVlFpWjFWeXVU?=
 =?utf-8?B?WDg2VmZ4R1FBTU5Ubll0ZzYzV0Y2TXhkUElxbEZCSllDb3dwNzBPRjE5cVRO?=
 =?utf-8?B?OWVENkpEQ1NvS2VFVVczQmMrOU1HVjQ1K3NrTys3N0RxbkU1MThPdksydGdU?=
 =?utf-8?B?bHpnaXU0TGJBNVhadHpISkRUVy9rVzJRZXpaU3hoa0hSWHdxeHBNd1FhUVJu?=
 =?utf-8?B?MGZjdVA4c3JHejVnVi8wa0Rvd2ZFMys2THpacVMyTSs1T1E3czhwRFV6bytI?=
 =?utf-8?B?RFIySlBjR1dTWFRqaFFlS09YN0lqMjlZSkNvTnBTL3FBZ29UN1dzN0ZXSzgv?=
 =?utf-8?B?dXh4ZUlZaVJsMHYxNGdFbDhDaE9YLy9IM0pkNzJVd1podC8xWkNuakI1cjZq?=
 =?utf-8?B?TFJteVUwMXJnQnE5U3E3V1l6TWJsTGZCeThvUldUU05FQ2tVNWpuTUpvbW5U?=
 =?utf-8?B?b2pyTnpqUHJBblNYaVVkOUxNdU1UUGxKcGUvMlpmQ2FMK3dnV1F5MUZzRXhh?=
 =?utf-8?B?ekxRNUQxZWdNODRmd3FQclVzTDBuK1lEOTFmVi92a2JqYStlN2I1TUYzUHlj?=
 =?utf-8?B?REZjUGdTZ1F2MFVpKy8rY1Ixb0kwd2RrZ1pSN1RSb0RHeGJwWnJuWSt5TTRu?=
 =?utf-8?B?V0VPV2lOKzV6cUt4VXFYQndLdWVCSFZreENUMzltRUZDTG5tNXZVbmlSL0dB?=
 =?utf-8?B?SEx1bHNBejUvdUMvVjQxRDltWUMzU29ZMUdYLzFlS3dENXRqODNPZjVvZEdB?=
 =?utf-8?B?ZTJlRDVHUHh6VStSSWt6WklMeXRjRFBkczRPcnd5RnFEcFk5SWloeWxaWjFk?=
 =?utf-8?Q?+XNr6eZO9lCMnkDOYwWIloe3x//GoaTe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGtqK0lkdlJQN1RsSWt3WDVISjA5U0d2Y0ZXaWp3cndnNHdWVHg5MjByMVM2?=
 =?utf-8?B?NjYwOGFHR203bW9sdzFOYzhtSk5YcnQ1MUZnMEZxamVwNzNRNjFQUldDdS8x?=
 =?utf-8?B?elc4ckFJYW9zUWdFYVBaTWpQS2pHN1RtNXBGSUxpM1V2OGJyZ0lrUWVuZ3Ju?=
 =?utf-8?B?NGhYVW5EbGFJd2JFQmpTa21kd3ZlYmhPRXBnVWFHNWt0bDRnZnFhaVVVVks4?=
 =?utf-8?B?Mk41LzYzVkFMN0hKTDA4NzJFSmY1QkpsQ3R0Ly82MEpMSFlDUG1SWTRmenE0?=
 =?utf-8?B?OE13VHJlSzhHY3pxOFRmdS9tRjRtNXNXOHBIbTUyNmVZWUt2cnE0RHlXSndF?=
 =?utf-8?B?Z2pnRzE5RndqbmplQk9EZFl2ZlVEQmUzZ0JwRnVpTjNRSk1JT1IwMmI2ZWpi?=
 =?utf-8?B?bkJXUjM2eVFadE1abWtIay9GUXpvcHc5Z0Zmc1pFR21YWEZUbkpEbjBJRnlq?=
 =?utf-8?B?U1JLWTI3ekE5MHVIemlSYWd0R2N3MHZ1YjdHd3pMNGl3dno0K2FBbHR3WHVm?=
 =?utf-8?B?M3RIUFRYZDhzZGRMWHlxMEs1RDhselNnbjVvMlU4S3UzcitkTG5yeXRZWld0?=
 =?utf-8?B?MHZoMDhML3V3WlkycFNuWVhzZEs4bktQaVEvSlVJdXVmYndZVEJiTkZoMnNZ?=
 =?utf-8?B?TEZJYmdXeWdGZHhPUGpDN21xdFVyb3o2c1NmckZjYlVIeUt2RjRneGdub2Fy?=
 =?utf-8?B?UDRlRUF4NlhzWDdZcG13TCtCTG9NZUF5Rm9iWTRsdlFDcnlUd3RLYnpsZjI5?=
 =?utf-8?B?TkFBbVBSMmlaaHRyOGhWeS9VbDRDVjhCMEIxMm9PdTd4bmxadVVGdzA1dlBN?=
 =?utf-8?B?alpMRVF5cDlMVURmbHZnN0ViRVdkb3F0OXJ5Q3dhLytXN2tFd2JSNTFtQ2gx?=
 =?utf-8?B?eWgvWlRydTNObnVCNlkvZTQzaXNQSGpnek9raFVmeDU5dkJtT1VhM3kxU0FD?=
 =?utf-8?B?WWJXZW1GQ3hzWFF0K2hzVmhNUUxSNTM4Q3Z5STUzR28ycnNKWVBlWEswNm5B?=
 =?utf-8?B?bHdyT3RPak5BYUROQWRTYUdteUg5ZE50SnFHZVN2RWc3WXZpQy84bVVnYmU5?=
 =?utf-8?B?VENJd0ZHVVNKbVhjTDNlZWZIcFpHdG8rWlNmSFVxMVBUY25QS3F0T21qZWtM?=
 =?utf-8?B?N0NUeTJjbzBRSmh1M3JjUi92Uzh5bFVKV25NWnNZSGFKdmxNWlFEUVgweEJi?=
 =?utf-8?B?TVpSZTA4cnJFaTUzTXdab20rdkR2NTlsWE9sVlNsQzh4UW5YREd2MFVxZCtF?=
 =?utf-8?B?aVpsc21yV2VMTi90YzRHcWJmZmNBNnFtcGJlc1ZrckNMelJaYkhmcE15VlRH?=
 =?utf-8?B?M1g3cTh4K2hIV3Z0di9zaThITjJhbmVHTjBZU09KV0hiUXlqNGZLMEoxMVNV?=
 =?utf-8?B?d2JnOVZiQlNFbUd2alRhTEp3VUZHRUZPajhIcnBrYjEyNWd4aFp1cWlNQ1I0?=
 =?utf-8?B?V3hSZ0x4ZHFzK0JIdTZ2b25RMDB5ZXZoMklhcEdTRllib3BGSXZuWndIVnQz?=
 =?utf-8?B?U24yQlVJSkUxVzJ2SXFDSGJ0TVU2SGVuYklxS2MyOHRPSnFyamZsUG5oT0Iw?=
 =?utf-8?B?WWFrZ2h0YS9NYnJSVFBKQUljdUo4RVBHK1dNd1ZSeGlRVGxxVkZSMEpKR3h2?=
 =?utf-8?B?NTk5bVFaQ2U4VlowU2ZDR0xhamtGWU5FUFJKWHI4T0lVUnR5Zk5TNUs5WHdT?=
 =?utf-8?B?RFlGN3R1TjQzK1JOOEtCejlpaWdtNm9DNitMWlFaQTVWZFlzWHRTWTJoc29k?=
 =?utf-8?B?bEZzMzJGdURkb2VXQzdENVp3U2UzdkEwbDJuS0lTcHE2TFFTMHZrRDAvaG56?=
 =?utf-8?B?VFBzWUg5aVFDZ3ZmZGJqQkgreGNEOU1UWDFaSnBiTi94UjFFZUlxV3VIOXUz?=
 =?utf-8?B?djJYeTRQUlExQTlORnV2UWtpR3hmVXVTWHpINStjVkxuc0JqenoxRGkwb1lU?=
 =?utf-8?B?a01mY2NSSVZSQTBiQXlSQ2NMcWc5M1hBSHlrS04rbDcveEd2UEMzYlE0SWxR?=
 =?utf-8?B?dk1kY0laR0Q1ZEVrN1J4MkoxVEYxRG5vYkJLVXkyaERZUW5BYkxQNmxWUjIv?=
 =?utf-8?B?NGJsU0pHQmZUS1JkNXJPbEVVd3lTcGIyY2lYS1BHSGZ6QzJrZW9nVExvanBn?=
 =?utf-8?B?Q0xaWTlLeGRxUDI3ZGYwamxLTmg1YnZXQlNsTUg0N3NibHJoNDNlcVJtT1pJ?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6cb75f-83de-40e6-5d85-08ddfd2a2a98
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 18:26:10.4017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUxag1lmUdcfAMbXENuEZEoXotvzre6ebII010UUP8lbT0K5OgY06DVaOHgI1dCXI9fAyj7FXQV2LQTpsVqpJ689drHlXULHadn1jW7ciKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7352
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



On 9/26/2025 5:59 PM, Jonathan Cavitt wrote:
> Static analysis reveals the following issue:
> xe_device_get_gt is theoretically able to return NULL in some cases, but
> several use cases don't check the return value before performing a
> dereference, resulting in a NULL pointer dereference.
> 
> Add guards against this in xe_pmu.c:
> - Use xe_root_mmio_gt instead of xe_device_get_gt for the tile 0 case.

it's about GT ID case, not tile, right?

> - Check the return value of xe_device_get_gt when this is not possible.
> - Return early from xe_pmu_event_destroy if GT is NULL.

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pmu.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index cab51d826345..531022d80731 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -142,6 +142,9 @@ static bool event_gt_forcewake(struct perf_event *event)
>  
>  	gt = xe_device_get_gt(xe, config_to_gt_id(config));
>  
> +	if (!gt)
> +		return false;

this function is only called from xe_pmu_event_init() which already checks that GT is valid

so maybe instead of adding redundant check, just pass gt to event_gt_forcewake() ?

or just teach the tool about this false-positive?

> +
>  	fw_ref = kzalloc(sizeof(*fw_ref), GFP_KERNEL);
>  	if (!fw_ref)
>  		return false;
> @@ -219,6 +222,10 @@ static void xe_pmu_event_destroy(struct perf_event *event)
>  
>  	if (fw_ref) {
>  		gt = xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> +
> +		if (!gt)
> +			return;

now you may leak fw_ref itself and its allocation

> +
>  		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
>  		kfree(fw_ref);
>  		event->pmu_private = NULL;
> @@ -497,7 +504,7 @@ static const struct attribute_group *pmu_events_attr_update[] = {
>  static void set_supported_events(struct xe_pmu *pmu)
>  {
>  	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> -	struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  
>  	if (!xe->info.skip_guc_pc) {
>  		pmu->supported_events |= BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);

