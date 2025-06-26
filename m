Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28CCC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B63B10E042;
	Thu, 26 Jun 2025 07:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UL6VVpZL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD3810E042
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750924528; x=1782460528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X1fITINnFUXHQeHyDceD7qZGT7rTJgTpiSl4xqBFGhg=;
 b=UL6VVpZL6MW6V3hZRbDjQFVlDwgH1EqP6Ovmv2zWnyMbgkzjfU3j44M0
 THkZFE7cGOsmhaXT1wZFDbYTMwzsxQkN7fgshG5B9VvOExNQSbVAsud7J
 GHtklR/CAIsozLt8MemVozbmtXUiTADRewDl3Bzm5WTWnJ2XbunBSrf37
 DfH/+RcuVkfqIv2ynvfztmVKN2pSl5mevNkXXH2A6XqVPfV3a8OG84kF+
 bozbQb+EM2qBG2Y4kBXku6GFwh66wLHiD6Uc3jeatE9K2/PyCN2/tCVm3
 5KXxx9+ds8nUGSpdywlTwQqXvrZjJHgdIDfCg64S07vOkXN/ZXHQ/y16K g==;
X-CSE-ConnectionGUID: JKCvxAezSj+ZL/MLoCHlvg==
X-CSE-MsgGUID: 0TE2/UmuTH+IiCcQK8cAog==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53082927"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="53082927"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:55:26 -0700
X-CSE-ConnectionGUID: fCASgKscRqqv6GMDFIex0w==
X-CSE-MsgGUID: xVPh1me7QbqIGXdYBigcSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="156833273"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:55:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:55:26 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 00:55:26 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.61)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:55:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YsDOBJFV/Xt6ixbC1zH9wjLD65Q/oo0MbK9P3f28WJPRQ6aAGntxdzClBx5dpGmrtULYxIAp60YDyPqTjETe8SZC64DIbO2YxS7k8F3RBV41sxIKQNiCNDFJo3JhJiEWprQjUvuRlOuFx57xxUEflFGtWXL1OwoFt+YQZj7Pf8ZzfE6difXLlo8GrbTg/bRdwoeLNZgpJvs6wvEZlUEQY9kYLAuMvbH2GPBW7V9OTaQot6ZjDDMLYpoZlyZtpF6VTm9HwAj0Ujz1t2TnGraVHBy0PPEIxQ8j4NzpNe9e9591EJkIqzdjmVgetkYa8URFdvje7Nb6lDzR0q3K6ZjVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfvwMBpCk6ow4EO+bMC2c88Mzyr+E2ZaIWo7Dkdmxm4=;
 b=iqW+wIj0DvnLBZIF4yFVzMtBSORlWtHDoqh+Bt7NEdNVuQ1Iy70efZAHXzBz3YpxXEcDqUpkUm7oPt9+GE0WK1X6Qinx96sb/0Jwjre7NjCUHu8M8bFS3/lCs/tpJ7TpvieNyyps2AprcdC7M3LhqB7zXaWiPAJmNqiHh4G09XCSQDxZVAXs9s8fzsTRGUYJU8cDbCtRWyy/zjMOwo8BusC6canhjK89BrmW2YZQWHKsCYvwsLV7wA46HmPQd74Aq/rTQs2QXBug28ZfoXbCqT2NuLclGLuRgn1nEQRzeEU4lwk61Cx+cdVbMWCZPEkFB+mE9NaH8Y0PeZ1hknDDjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Thu, 26 Jun
 2025 07:55:18 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 26 Jun 2025
 07:55:18 +0000
Date: Thu, 26 Jun 2025 09:55:15 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe/vf: Store negotiated VF/PF ABI version at
 device level
Message-ID: <20250626075515.yumhop5k7fdqbjhl@intel.com>
References: <20250624200923.1348-1-michal.wajdeczko@intel.com>
 <20250624200923.1348-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624200923.1348-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB7PR03CA0099.eurprd03.prod.outlook.com
 (2603:10a6:10:72::40) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a17d69-bdbb-468e-5a93-08ddb486cb15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzIyd2FRMThNYjloMFVTSTJpeHJiblZLdUpVTzFjU3FyclN1SkxidlZXY3Iw?=
 =?utf-8?B?R01uTXQ4TnY1eVNCTFBsWU5vRFI2eU5IQWErM3lzRytML1RZRFNkT0gyZkpu?=
 =?utf-8?B?MHlrN3BMWmRQRFZyL2dQS1NuS3FxbTQyNVB2MmpRN2I0NE5WOGR2VERTbi9N?=
 =?utf-8?B?eEM3NU1QNXJxZ2lwZFhjc2dFelRmRWNBdnZtT0Y3TFNLb1NkYTdXazJpZ2JH?=
 =?utf-8?B?UmRmTFJ2eE9mdnZkSlRpT1B6alFjUTRMUmx6NTdqK1pFUGsyV0hUY0owSlRS?=
 =?utf-8?B?SUtVc3RjV1ExZHBSYlduYjh3eW5KRHJqc0k0RGRVR1EzZGxIQllwNitlWmpI?=
 =?utf-8?B?NHFoZDBrM2ZrQTJ6UDZ1ZXRxOTAxVWYremZvUHErbVhQSDQwL1VKN2M0dllT?=
 =?utf-8?B?Qys3dWFXVHErUUpaTVE4b2VEdkd6dzE1UjhUT0pyK0dLVHIyVCtFUDdlWjM2?=
 =?utf-8?B?UmtlRGhBU2xvc1BUN0dQVEYzTlBWRU55V1czS21vZnNtcUhiWk1KM25nM2ht?=
 =?utf-8?B?cTdHOEd4aUxtSlZJYUd3ODh6U3Z4MmhiK0dOVE9DeDhScDJvYVlmRWRoK0hs?=
 =?utf-8?B?K3ZJZFJKNG14TVFiTHBldDJXOVRoQzRmQmVjY1B5QnBSREZVQkxWaTE4MEJD?=
 =?utf-8?B?RUh5cTExZzRBV1VPYnZ1bHdqczRsYjNCMFUweHVTdnJCUW5FeFRpbG52TGw5?=
 =?utf-8?B?WWE2RzdENzBMdXo1cjBNQnkvNnN0Q1o5eUhhbVI5TC8wbzVoS212d1ZoYUZI?=
 =?utf-8?B?UTNrcXUrU0dNRFFZSzlIOHBpYXM4N2hHeVpDdGRhMzdITHY1VDM5azcwdWRR?=
 =?utf-8?B?TzM5b0RtMXdjOXhHMFdoQWxyMzBqSGVvcU8rS05CbjdYT0U1Q3RDUGcwN2R6?=
 =?utf-8?B?REQ4TmIyNWs2dVJOWmxtWlk3cjk5dVc1RDZBNXB2eFE4a0lYYS8yaDk1M0x6?=
 =?utf-8?B?M2xpMm0vMVVQZCtCWWhxTVRLczlidGNPdGQwcm9KTGYxUi9QZVBYUEY4cGhR?=
 =?utf-8?B?WXl3djJ1WVUvcVlrcWtmUEd1M2UwVjRvZXNVOXRiL3N5QkFJakI1QnhwWlhz?=
 =?utf-8?B?ZHhkUzRGNTZEYlJ2cEZIcXlmY25xQ25UdUVwSkdheHNnNG52R2toQXVmTFdL?=
 =?utf-8?B?TS9QbEE0V2tKbDBOazhldU40T205aWVhVFJ6S010MWlFUGhTUXMzMzVEZEhs?=
 =?utf-8?B?SlZ6RnNDbkdsMG1OcWdyT2o2YWQ3aFh1OEFwTzRDNnpNMU5FL3hmRG5JQWZU?=
 =?utf-8?B?M2o5ZTJsQ0pXK0IwZkZwL0dJY3JObWlvT2Fwc1RPc3hMTG00M2VqalVETys3?=
 =?utf-8?B?a09RVi8xSG00cm1EWFVRdFNZb0pMRHFjTFcvT21nWWFPQTFuSi9PTm92N3Y2?=
 =?utf-8?B?V3NpdXFkRVQ5MWRrYnlVT0ZMZElxT1A2SVMyVWsxNTZkaXc4VWNvLzI5TlJo?=
 =?utf-8?B?bmxhS09SQzRmY3ZHTTh5bUhkMnROY2R0Q3N0ZmY3bmplWFlXbTlWaXF1U29n?=
 =?utf-8?B?YzE1T0dDRDFhMjVRbmJyU0N5bUI0NEdFK2E2Tm9rUlZ1eHRkaGM4M2tkYmpC?=
 =?utf-8?B?WTIwUXVaN0M4bmE3V0ZDWUJwekMxU2pUWU9keURFVTl0Z0hIY3AzY0xmUUpJ?=
 =?utf-8?B?RHJRdU4zTC9DN0JrakhmWkNHWUxuQ0tucDhwNmFGd1JWNWpkODZUZG1BbGdZ?=
 =?utf-8?B?R2JQYUxCYmc2NWk2Z0g4WFpIUDJTRG1wTG9QNEw5YnNhb1l4QzNUY0FJRHVH?=
 =?utf-8?B?NXpmbXpmOGpDRlVIWHMvazl0N3dhSkFPMzgxaURYeEE0dEFQY2NIWC82RTZO?=
 =?utf-8?B?RlF2ZVB5b2R1dFFiSCtFSGFMQ2orVThnY0VVbElNSDBla0pETitHRkFnY2RW?=
 =?utf-8?B?aHc5WmpJalM4NlNxUFpYRHFpb0dUZi8vbXpEaDB4UnZYUWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFE1YW81MVJrUGs4UFkyQ0ptV3B6M21GNGVnYTMwZWVWTkNVdkt0NVE1Y3N3?=
 =?utf-8?B?THIrSWljKytZcGpkazV0QTl6UmRTR3kxbWJCZU10bDNNSTNDc3dFaGszc3Fk?=
 =?utf-8?B?MS91SVVvSTl3U1pTWHg0djFCell2YkMvMExWT3BQYlhwVEE0YnRtM3FObUhy?=
 =?utf-8?B?aFQvU3dhdVNtSUdSbFpuM1BFaGxuWFg0bkpSWXVpR2N0eGU1WGdXSk1EYUNZ?=
 =?utf-8?B?eUJvT2pTemFPeHFqU2VNbitSYjd0VXdFMkdXRUFpME4zeThHdWR4dVdKL2Fi?=
 =?utf-8?B?SG1oN3kvYUIyZGplZEs2WnowelhMaHQrSjFqQkFZV0JyWklTMEpVUmg1a3Rw?=
 =?utf-8?B?dDJ1bFlKL1BNQ1lmYWp1OEF4aUFNVEowWTRRRmJRSHZqQyt3ang5aXRxRDA3?=
 =?utf-8?B?RERRUEIxeDJ3UTBBMStGckpqQ211aVBmNXBSbW54OFhSOVpROEdQa2psMStI?=
 =?utf-8?B?V1ZOSlZuak9oVE1pcXpQekt4SURiNUd0MmtSZGFFdkMwSXVrWHdOVE0zN3lw?=
 =?utf-8?B?azRSd1hGanZwY0ozSGxQb2dPbWhoYmZPM0xibHN0dDNsK0tKMmxtU1FGaFM4?=
 =?utf-8?B?NWc1bzB0TGZkOG9pNXNNUGJhRXZ6bmZLOVN3NjlEcWJwdGp5dUhpTVZGdjlV?=
 =?utf-8?B?QUJKcTZUV2MwUk9xWWZ6WUdDOWdrbld0UGlGaXFvemNHdmxWdXp5YWRvMzJB?=
 =?utf-8?B?dlJlVm1BaEF6dFIwNEdmZy83V3NRNlowaHVtanlxcWJnQlhHZ3cxeVVsaWF2?=
 =?utf-8?B?cFIxQ25yR1gwRnhlNW1wa3MwaVpBREtkc0RIUVdPTm5ZMUpHK2xHWGIxc3pW?=
 =?utf-8?B?R3Fic2x3M3ZFNWtGN1VDOE1IWkl2VlFnYWpSMFJQRjhoZGpUS3RrTUd5ajZx?=
 =?utf-8?B?cWkvSG1Dc3VZb0dycGx4a3VXZTUyYnZHR2dSbE90dUR6Y1FuYTFyNENwSlFi?=
 =?utf-8?B?LzJFUzFDYWhhbEp6dVhrbktTUVlOSVZiYWtPWVBqZmR3MmJRQWs3UElRUXZ2?=
 =?utf-8?B?aEh6ZFIwRjl1RVBRLytwUGVsZ2ljdmM1bXN4dm9PcHNPZXhKTFc0SUxOU3hC?=
 =?utf-8?B?RitZekRkQXAvbVpMbFVObHAweStkSkI4UUNzbVM4aFhOU3ZVSXAyZ2ZFZHlL?=
 =?utf-8?B?ekdtYnduSE5aU2dkdWg3eDVOZW02R004VzcxNEZMQU5zbm5mTEphZUVoV0FJ?=
 =?utf-8?B?eDVYN2RDR1UyeUFwMmJMdFFuR0VVelMwWlYxYm51WWtYbmVTUGUwa2NFSnlD?=
 =?utf-8?B?blVCMkVNdXZlc1ZkUmlBTEhkbC9NejJMTGQvdS9hQllseEhGT3RZUURpN21O?=
 =?utf-8?B?Q0pqRHc1ZEtDbk1uaTh3SjFsVElIMGRQZ253Mk1PTm9UbVlBQXhTVG5QR2Ev?=
 =?utf-8?B?WHhta0w2eWZCNVdzdDBXd2xJMDZFWnFDYkc4Ym9lMTM1ejAyL3JYL1JOU0wz?=
 =?utf-8?B?TTZORlcxWVdXK2RuMXpDQm00K3Y4b3hIdlFwVG1XeXk3Vm1LY1ZKTDIxVHI5?=
 =?utf-8?B?cmE1akY0YjlLUHhxWGs4aFlGK3RhUDI0NSsvZXhhdlZmNEtORXRRclAxd2Fl?=
 =?utf-8?B?NVZTZHQ3bWRObHUyLzQzb0pMU0RGaHkwQTFGOEs4aTYxMlI5bDJyUGtlOWZ4?=
 =?utf-8?B?RkdWTDBLaEhBRmlmM2xxeGJ4T1F2R3dyTDlQNy9DNkhnM0NCeG9DNmdseTBy?=
 =?utf-8?B?TXRuTGNUbXRKdldEMUNZRE9VS3oyTldIdHN6UTZadlJWS1JaUWxzUVdDcTE1?=
 =?utf-8?B?L05EUnc1UXcrbUVsRU81WFBYanBST2hoZW4rUXBiK0ZlSzJBV0ZDUmVudlA0?=
 =?utf-8?B?SVlyUzM1QzNsb3IzdXNqcndlQzJiaEFHSFQrV0xCekdUaWlVaGs2YXFGSEYv?=
 =?utf-8?B?b3F3ZjNKNjBtbFYvbVNzUGtnVGlXTldqMTNlWUIyOWd3S3AyM3RLdFlnVjlx?=
 =?utf-8?B?d245ZHdPa2NDQnJ0SWRnWlplVDM2T3Ixbm1PVWVyKzU2SG9vYzBZaWlRWHhW?=
 =?utf-8?B?Q0dNcGdwL3d6RjdxNEtsTWtxM1NCcUZ6QStuUkJqSmNQWXUvcGcvRGM2elZy?=
 =?utf-8?B?dGhxc2hqMFlRRkRxWmFqdVpseTgwTGJYVkYvWlVZWm5ERXF2V1g5NEU2RlAy?=
 =?utf-8?B?dmlRR1FmMzRKcmpJSjVJaGxOTndjd3ZqZEJYQ1ZMU3JCdFpOa1NQRXBJQ040?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a17d69-bdbb-468e-5a93-08ddb486cb15
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:55:18.3312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YtIPngQB5sgwGKYMWw5GpF+HvQzYD1qG6ppyBw3McehYitgrWjTZIPBs1oRO0vq7pzxoAPUgdyTFnkCsOerZdcnTIxWgFjHajyy1lwCkaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8019
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-cze-24 22:09:23 +0200]:
> There is no need to maintain PF ABI version on per-GT level.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 30 +++++++++++++----------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h | 12 ---------
>  drivers/gpu/drm/xe/xe_sriov_vf_types.h    | 14 +++++++++++
>  3 files changed, 31 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 9b2fc9db55b8..d168264e63ea 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -686,21 +686,22 @@ static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>  	return 0;
>  }
>  
> -static void vf_connect_pf(struct xe_gt *gt, u16 major, u16 minor)
> +static void vf_connect_pf(struct xe_device *xe, u16 major, u16 minor)
>  {
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_assert(xe, IS_SRIOV_VF(xe));
>  
> -	gt->sriov.vf.pf_version.major = major;
> -	gt->sriov.vf.pf_version.minor = minor;
> +	xe->sriov.vf.pf_version.major = major;
> +	xe->sriov.vf.pf_version.minor = minor;
>  }
>  
> -static void vf_disconnect_pf(struct xe_gt *gt)
> +static void vf_disconnect_pf(struct xe_device *xe)
>  {
> -	vf_connect_pf(gt, 0, 0);
> +	vf_connect_pf(xe, 0, 0);
>  }
>  
>  static int vf_handshake_with_pf(struct xe_gt *gt)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	u32 major_wanted = GUC_RELAY_VERSION_LATEST_MAJOR;
>  	u32 minor_wanted = GUC_RELAY_VERSION_LATEST_MINOR;
>  	u32 major = major_wanted, minor = minor_wanted;
> @@ -716,13 +717,13 @@ static int vf_handshake_with_pf(struct xe_gt *gt)
>  	}
>  
>  	xe_gt_sriov_dbg(gt, "using VF/PF ABI %u.%u\n", major, minor);
> -	vf_connect_pf(gt, major, minor);
> +	vf_connect_pf(xe, major, minor);
>  	return 0;
>  
>  failed:
>  	xe_gt_sriov_err(gt, "Unable to confirm VF/PF ABI version %u.%u (%pe)\n",
>  			major, minor, ERR_PTR(err));
> -	vf_disconnect_pf(gt);
> +	vf_disconnect_pf(xe);
>  	return err;
>  }
>  
> @@ -775,10 +776,12 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>  
>  static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
>  {
> -	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	struct xe_device *xe = gt_to_xe(gt);
>  
> -	return major == gt->sriov.vf.pf_version.major &&
> -	       minor <= gt->sriov.vf.pf_version.minor;
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +
> +	return major == xe->sriov.vf.pf_version.major &&
> +	       minor <= xe->sriov.vf.pf_version.minor;
>  }
>  
>  static int vf_prepare_runtime_info(struct xe_gt *gt, unsigned int num_regs)
> @@ -966,7 +969,7 @@ u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg)
>  	struct vf_runtime_reg *rr;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, gt->sriov.vf.pf_version.major);
> +	xe_gt_assert(gt, gt_to_xe(gt)->sriov.vf.pf_version.major);
>  	xe_gt_assert(gt, !reg.vf);
>  
>  	if (reg.addr == GMD_ID.addr) {
> @@ -1073,9 +1076,10 @@ void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p)
>   */
>  void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_uc_fw_version *guc_version = &gt->sriov.vf.guc_version;
>  	struct xe_uc_fw_version *wanted = &gt->sriov.vf.wanted_guc_version;
> -	struct xe_gt_sriov_vf_relay_version *pf_version = &gt->sriov.vf.pf_version;
> +	struct xe_sriov_vf_relay_version *pf_version = &xe->sriov.vf.pf_version;
>  	struct xe_uc_fw_version ver;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index ef041679e9d4..298dedf4b009 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -9,16 +9,6 @@
>  #include <linux/types.h>
>  #include "xe_uc_fw_types.h"
>  
> -/**
> - * struct xe_gt_sriov_vf_relay_version - PF ABI version details.
> - */
> -struct xe_gt_sriov_vf_relay_version {
> -	/** @major: major version. */
> -	u16 major;
> -	/** @minor: minor version. */
> -	u16 minor;
> -};
> -
>  /**
>   * struct xe_gt_sriov_vf_selfconfig - VF configuration data.
>   */
> @@ -66,8 +56,6 @@ struct xe_gt_sriov_vf {
>  	struct xe_uc_fw_version guc_version;
>  	/** @self_config: resource configurations. */
>  	struct xe_gt_sriov_vf_selfconfig self_config;
> -	/** @pf_version: negotiated VF/PF ABI version. */
> -	struct xe_gt_sriov_vf_relay_version pf_version;
>  	/** @runtime: runtime data retrieved from the PF. */
>  	struct xe_gt_sriov_vf_runtime runtime;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 55c2421d4b2e..8300416a6226 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -6,8 +6,19 @@
>  #ifndef _XE_SRIOV_VF_TYPES_H_
>  #define _XE_SRIOV_VF_TYPES_H_
>  
> +#include <linux/types.h>
>  #include <linux/workqueue_types.h>
>  
> +/**
> + * struct xe_sriov_vf_relay_version - PF ABI version details.
> + */
> +struct xe_sriov_vf_relay_version {
> +	/** @major: major version. */
> +	u16 major;
> +	/** @minor: minor version. */
> +	u16 minor;
> +};
> +
>  /**
>   * struct xe_device_vf - Xe Virtual Function related data
>   *
> @@ -15,6 +26,9 @@
>   * @XE_SRIOV_MODE_VF mode.
>   */
>  struct xe_device_vf {
> +	/** @pf_version: negotiated VF/PF ABI version. */
> +	struct xe_sriov_vf_relay_version pf_version;
> +
>  	/** @migration: VF Migration state data */
>  	struct {
>  		/** @migration.worker: VF migration recovery worker */

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
