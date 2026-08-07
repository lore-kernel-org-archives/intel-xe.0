Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED8C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60310F3AC;
	Fri,  7 Aug 2026 07:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eve9Q1ms";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719EB10F3AC
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786088464; x=1817624464;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rb5qMg1koCtvPUAjwSZAEXmR6tVBfmNjD34C4yazFho=;
 b=eve9Q1msnB8wZoB5CxMH+t/yDrQmbzDOBXFv3FCMDi+GaYtazNHVcPg/
 RuxNbbmYWt9ss9PYqU0+7toMF0oaZgCp3DaZEtdZ6OcS1VLWqP6H1ZwB+
 LxhzazouzGRk8FvHtRz5lo44QJq9S5bS/dzYLbY3K5M5+xF0YDr5I0Ok6
 8S+fY1Tet8LEXaUv37kdFY2jTIDWQu3bDeh8vQo63JnfAasKxXYFa9H41
 o/8weXOl8HrBzLvoitG7K0/xB0JJluOXTRL+9LQRk5ZLN+7LXD6IX05E6
 SjWOkNPqsuZwrVCdyae1antsw+zG4yoch67JHq6ftrt28IShuPIsMISz5 g==;
X-CSE-ConnectionGUID: fdVufThcQyGdo0Ujyw6Xuw==
X-CSE-MsgGUID: GlyIm7f4T2uhH8J7iXNlQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="98053497"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="98053497"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:41:03 -0700
X-CSE-ConnectionGUID: D8ZOTGfpTwam4QsLkM4JrQ==
X-CSE-MsgGUID: JrqMNlm6RZ+x4N+UOm+jgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="267479602"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 00:41:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:41:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 00:41:02 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 00:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsjYltfJU8ir4+3lcJebGuj5GNrxbO/2DdTz5M78MzKZ66FjpH3r/MUGjFpwb9zDs5R3EOE2lK+BkpKPl6QBaHnxi+/kfR52SEhhOYTBBhCW4djZ//l13fBrld00hOL29dyXuFJNHcoYJO494zdlft/ByeWPkVqOWVdiJeK2p/Qj84kuZRd9yRTt281gDTcpELGhPuXQYZWjWYnjn1i1iN8ZVYQjHt0a/cAVHLAc0EUO4JcyEEhckvWmCTDpHcUpFqu7pcFwx9Tw3J2JJhRxNzrs6nh5yBqtKsAIbzHUhbZVPLb2jbsYa8eDyuKxaRFPJP5qrTcJG6vp3Z8MxyKxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSqXpDbAqrjZhnSOIRsBYrDHgTr2ebahU9jSt24akQw=;
 b=MQCJnEYhBZwtghEwpfx6EQVI1yW9+1IUIjgB4x9MvOnHxXoxy7zmrodm+eDST7L9GDdhVKlhqXA94aV3DNZNbyEge3dRcGd8tZTwilIMcq25J2VFdvT2tDGXVZktyeFXyB8lwaL9BJZwOEfE0RQDivIHqt83DKLGCa+f80f7p5vPc2ZARmT8Sh0JRBVEDYyzjqZ1rKclewxuklG1fTEh04Byp/uHpV27ZSQ2QTAK7PC3YXFLng7W8dMTHO3Z6L6N7rUNlGxh0pg/7qbPNC9zQDFge+j/+LrO+m0oilWx2McLrn9v9vQu5zmPXKE1u3K3jdrSSjQs23FLAaYjyDB2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DM4PR11MB8178.namprd11.prod.outlook.com (2603:10b6:8:18f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 07:40:50 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0292.018; Fri, 7 Aug 2026
 07:40:50 +0000
Date: Fri, 7 Aug 2026 09:40:46 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/pf: Add _locked variant of the GGTT bulk
 config function
Message-ID: <20260807074046.6zslcpzwipvgj5op@intel.com>
References: <20260805154733.604-1-michal.wajdeczko@intel.com>
 <20260805154733.604-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805154733.604-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VIVP296CA0131.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:359::16) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DM4PR11MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 218d43fa-e823-49f7-845c-08def45733e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: puZEtym/Crlmh1Xs9IYV33xEXhfFSib+89DkhV4eBa7raSYIbpj5GrXChalLCD1+66qymw/P+CzuZsa3WrPCI8MYjUNyr6TaAQLuHPLcpgFRYn9FTw5UnS0U9kynckDOue2VWQ2aQ/Nf9kSUKDSFuuP7R0HPHiPKrUWTAgF4vZV3cifbKm5p1JPe+6BNYYhexLfM6SmZI0m/X3uXc5wdNonuI1wIuDXgP1cpbdFSusaBfxygh5ybcX/UpV9z9UDdmhYPtRPBSwHj2MIo7LLUG1zKxZCSbxlGmToSfqCc3nZsOBjiVr4NMyt+oYi5IEAFbgmpxh4inYX5lq1dvor8pAJTS8uFUDwVLkuVM1ym6/sNiPBHZnVXG8MHtMPP/Eg0ViJIbWL72fc3kbYAhnOT7m1HXkaNqnE8AIUZWQChPpjQA/s65cjEzIecK6l3pbO/r17P7PP/rSOKVg0sUd6fGJWwvRkVcQZXDacQcQA1v1+lyWArohsk3dGWMuqQwwEXCPw5OVJ5EZOk8k22dfv4+xFkANePq3l0LuiPseCoiCFg6qOFZYvl2UmErkZCWnD928meBOBTXxuxYMmwep/uwfQJMxLO7UFMRt1jp4GMVwPu0N7JzZIrDHFu2KNkPY0J22sY0EgOkpMQRpxM9fIy0Nn8Bp1A+g37wd3Xojzu8bU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sy9KQWd2dURxb1dWMEt4KytDbnQvdUZiMjBHMTROa1E1NnFTYkZpY2FRTThv?=
 =?utf-8?B?ck1iWU05OW5BdkZRb1Q0Z0pPMCtQOHAxVnBuSkwrK2xpRlJSZFRhRURCRXFW?=
 =?utf-8?B?UVNUU2ppT0ZVbmF0YTkyQytCWU45Rm1kSTFqTzNwUXBkZ1pITVNLeUl1ZExo?=
 =?utf-8?B?azk4QjMzbnVoVjJnTExWNW9sVnNWR0NjSDU1SC9pc3R2MEVvUVdFOE1wa2hw?=
 =?utf-8?B?WFlMY0dXaUU1Y253a3pNZ2FtTml6azlqMXk3N0hQR01HbWNkMGZuWmp3UTBG?=
 =?utf-8?B?dnBXdk5NQXBiRjc2bGpPRll3NjN1TDh0eWJCOGl4Ti9BQXFhdnRLSEdQa0tM?=
 =?utf-8?B?MFdLbXY5ZWcveUdBRzNyQTM2ODI1QXBxYlZuemI5aHQwZ0dILzhkenlheFdO?=
 =?utf-8?B?OUFuNURtNEFNY2hCRnVndHVkeUJxMmlWN01JS3FZTnZrMjlWcUJkcnFMR3Rt?=
 =?utf-8?B?TExRZlBPNG8rNzJKS0tUWkFhcUMxTkY4Y2lpdmxkN3FMaDY3cUQ2OHU0UEYw?=
 =?utf-8?B?SkdzYW5PNFlhaFdZTmVhRldSbGluZzRLbTgvSURXUktOcFltN2JEUUw2MSs2?=
 =?utf-8?B?ZTVJdWpYYzVPcy9QUHJkRUQ4UWloWkMxQXorWnNxRzZPaXZEelBUVGFpeVV2?=
 =?utf-8?B?aTMvZ3RDMWlNb2Y2Nnhsa1RzYUJHVkYzNE5UVlZlRG1XdnN4bExYb3M1TzNF?=
 =?utf-8?B?SDZDL2xtSURoYTBrUUlyVmwvejB5aXFUQ1E4N0pTOG01RVpyb0NYWTlKaWpY?=
 =?utf-8?B?LzlDME9hTkJmV3JqdEkwaSsvVENiY0h2SnlIK1JHdUVWV0FyRzZrTGMxem5h?=
 =?utf-8?B?Tmd0VnlhRFJvK3Yzeng0NXN2Y213RkRteGN5SS9RYjlUS3V0eTA1NTQ2ekI1?=
 =?utf-8?B?a1UxcU9TTkVkWEhpSlBBMnhNb2J6RHNJWU9XWXBUMytwendoNnpFNmJKLy96?=
 =?utf-8?B?VytrVkN0TXFpL1RMRUJvYWxjSXA5SnJxMkNRUzFxVUdJaHFQYUNsNjM5WW5i?=
 =?utf-8?B?bFFMVXdiK1NLdGpBRVc0QVVjb1VxUEh4ODNEeEd2M2dyR01XQ3hTNWJWMEFD?=
 =?utf-8?B?Q0ZUQy8vTkszVnB2TzZ2amZLUlkycnhFVncxbkhaWEsrZ0NVcHdXeXBXdnB4?=
 =?utf-8?B?M2d4QWFTUTBHcUtPZE5YQTN5NXdKU0JsQ1VjWEUybVN4Nm9wWDVrZGU0cGVJ?=
 =?utf-8?B?eWtzdmxRNDJRVEZQSjJWNGpPdWdTN0VmazRSZEtxa0sybEZPeCtMQUJVNzgx?=
 =?utf-8?B?VlNLclBGbkN1enlhbFZ3K3FQdnZSVHhkdFlTa2plTjRDM3htc21TNTlLMVVP?=
 =?utf-8?B?STB3eHcwVXpXNTh2aXlhUUR1TW40WldhVEE0SEZmZmRkME5TSkJlL1FVRUo5?=
 =?utf-8?B?cFJQUVI5WXFEMTV1UnZGL1R0U2oxd0NueC8rZ0xzYnhJUStjYUI2UVRtRGFS?=
 =?utf-8?B?dmV2dU9UTGtvRlkzWEpnbk9yRGpralRSeGVNN21OS2hCbkN3THY1WjExdjk1?=
 =?utf-8?B?Zjl4aFJlNTl1VkJjdk9UckMrYnJscndkUGlBNzM0UzFYNndDTHJmNE01L0FC?=
 =?utf-8?B?d2FrU1J2YUY3d3ZsMndYcGp4V1RJVlQwN2FOSXFxTDRIaFByZmw0UVBjMTdP?=
 =?utf-8?B?SlBVb3ZmMEJ0Z3VzN2djR3BYVUxhclB4eTBpOXZqNUxJdkpOc2R5S01US1A2?=
 =?utf-8?B?M1dEd2xsYlRIdzJXd1hXZC8zclczM0syWm13WU9OcGFjc1J4aXA1eE9xZ2hU?=
 =?utf-8?B?VHMxWlB1TSt4WHg1bXgxNnBTbDRTaTBGNmZqWDREQkpvVzh0bEhlbHRoUkg1?=
 =?utf-8?B?SVUyNlFTdXpXWndqNnk3YXNjTVBUMU53ZE1tdm52YnIxVU1MemFGcE4yN3Z2?=
 =?utf-8?B?SWRQampWT29kOTV1U09LMTlTM3lIVmJrQzZ6MHBxNW5Ld1BBeHQ0S2p0OHRk?=
 =?utf-8?B?M1hFSGs2MGEwY2lrbmM4ejZOVllkM05pWmdjTTJsL1k0d0V2M0pScFZ6SXlv?=
 =?utf-8?B?Y0FmUDA2cVlDR1ZBck82ajhvVSswNlJ6dFA0YUhQcGsyMm9iSlE1MGNYSzZr?=
 =?utf-8?B?dVU0REpicXNXRkJ5OTBzZnV0ZzBqWDBsR0lhWjNnQ1ZRdWg5ejY5a3ZOa2VX?=
 =?utf-8?B?ZGd5aWFGWkN5UndCRjhndEcxcm1KL2NyK29JZnRxdkVRMXpST3F0WlUxVTJp?=
 =?utf-8?B?UjdORG10dFJrdTIxdVpPa0NsY1RTUnZOYTNHcGt4VDYrMmpvR1Mrb2ozRGs2?=
 =?utf-8?B?Q2U1UkNNdDV2NmRTek81UmlQTHVZQTZ1YTRLN2pXVXhqR0g5cUs0dkVmVnh3?=
 =?utf-8?B?T3BnVmM4Sy80YXpTZjR4WUlZWThpMmlMNjVQQXA5Z2RXMkhKV3MwNjVjMnAx?=
 =?utf-8?Q?ylGkN5Y+89mEDfDc=3D?=
X-Exchange-RoutingPolicyChecked: XLYWSeL62gioOh+2e+choqkStvJtFR3XO+aJacLoytUipNPsncQ1GTD8+WLwM+gqR3DApVC5n56BTbDGcuhup/LGVQhM7d4h/Y7FwpNHqqoJhcygEgKl63Ty2Buan0gtJ2u1ruPevMf9ifAlQs3cnS9KMHwXg1tGY5y5tn78AxFgQfyZXuQ5xLDIV9z58jW4jFNCOeGCFMD/wv7C/bQBgwjedJQNbm4H8o90mHheP0gUxse1GE21tAoMZk0utr4u/WRdkYSk+sWzEAllYbU5d+mQPnKkSR2k8SKXvotCOCrUKcNpaBtl7OsZLx9FT+YvDf0nqAuSFSunA1OvG+Bq6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 218d43fa-e823-49f7-845c-08def45733e8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:40:50.5499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcWmdtBITYppN2xcJTp1IkS9oQmIz1MfpDT5THvPdNy6dU6rnuou8RSwtNy8cDWWDkAxEQtyyaGTrTmXY9HJX9RieF0u+pePewm3KN2+/UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8178
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2026-sie-05 17:47:31 +0200]:
> We will soon want to provision all VFs, including their GGTT config,
> in one step. Split existing GGTT bulk configuration function into
> two functions, one of which will expect the master lock to be already
> taken. Use this new function in the fair GGTT provisioning.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 37 ++++++++++++++++------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h |  2 ++
>  2 files changed, 29 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 2c9b85b84b1b..47623315d615 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -668,7 +668,7 @@ static int pf_config_bulk_set_u64_done(struct xe_gt *gt, unsigned int first, uns
>  }
>  
>  /**
> - * xe_gt_sriov_pf_config_bulk_set_ggtt - Provision many VFs with GGTT.
> + * xe_gt_sriov_pf_config_bulk_set_ggtt_locked() - Provision many VFs with GGTT.
>   * @gt: the &xe_gt (can't be media)
>   * @vfid: starting VF identifier (can't be 0)
>   * @num_vfs: number of VFs to provision
> @@ -678,31 +678,49 @@ static int pf_config_bulk_set_u64_done(struct xe_gt *gt, unsigned int first, uns
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
> -					unsigned int num_vfs, u64 size)
> +int xe_gt_sriov_pf_config_bulk_set_ggtt_locked(struct xe_gt *gt, unsigned int vfid,
> +					       unsigned int num_vfs, u64 size)
>  {
>  	unsigned int n;
>  	int err = 0;
>  
>  	xe_gt_assert(gt, vfid);
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
> +	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	if (!num_vfs)
>  		return 0;
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	for (n = vfid; n < vfid + num_vfs; n++) {
>  		err = pf_provision_vf_ggtt(gt, n, size);
>  		if (err)
>  			break;
>  	}
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	return pf_config_bulk_set_u64_done(gt, vfid, num_vfs, size,
> -					   xe_gt_sriov_pf_config_get_ggtt,
> +					   pf_get_vf_config_ggtt,
>  					   "GGTT", n, err);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_config_bulk_set_ggtt() - Provision many VFs with GGTT.
> + * @gt: the &xe_gt (can't be media)
> + * @vfid: starting VF identifier (can't be 0)
> + * @num_vfs: number of VFs to provision
> + * @size: requested GGTT size
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
> +					unsigned int num_vfs, u64 size)
> +{
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	return xe_gt_sriov_pf_config_bulk_set_ggtt_locked(gt, vfid, num_vfs, size);
> +}
> +
>  /* Return: size of the largest continuous GGTT region */
>  static u64 pf_get_max_ggtt(struct xe_gt *gt)
>  {
> @@ -775,10 +793,9 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>  	xe_gt_assert(gt, num_vfs);
>  	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
> -	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	guard(mutex)(xe_gt_sriov_pf_master_mutex(gt));
> +
>  	fair = pf_estimate_fair_ggtt(gt, num_vfs);
> -	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> -
>  	if (!fair)
>  		return -ENOSPC;
>  
> @@ -787,7 +804,7 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>  		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
>  				 "GGTT", fair, profile);
>  
> -	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
> +	return xe_gt_sriov_pf_config_bulk_set_ggtt_locked(gt, vfid, num_vfs, fair);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> index 2ec62c12ad5c..3741202908ee 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h
> @@ -18,6 +18,8 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt,
>  					unsigned int vfid, unsigned int num_vfs);
>  int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt,
>  					unsigned int vfid, unsigned int num_vfs, u64 size);
> +int xe_gt_sriov_pf_config_bulk_set_ggtt_locked(struct xe_gt *gt,
> +					       unsigned int vfid, unsigned int num_vfs, u64 size);
>  
>  u32 xe_gt_sriov_pf_config_get_ctxs(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_config_set_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctxs);
> -- 
> 2.47.1
> 

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

-- 
