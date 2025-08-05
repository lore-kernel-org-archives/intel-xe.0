Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF82C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:18:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B271810E013;
	Tue,  5 Aug 2025 03:18:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWO7SVz6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A567410E013
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754363927; x=1785899927;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ydv8EY/wZSkAhOaf5XPv85T20R1KCEByLr89jKpeTss=;
 b=nWO7SVz6d5GpkdmERxiqo+IXk/NHXcgpFByE+cSOU3B4TD0XvNHs/JU6
 io3f2VS4lQc3J/RkDVw8GS72F9Nrjm9RgTBXT2OQ2rfJtAVVmdqOR8Lc9
 pbLr2y/WIWhfB7Vhfm7U5rpmwdxLm9od5xIYD5Lh+JG7cOZk8Gl31R5MB
 PNIXUiP7UHmcUpaqC01TqRfxVCj1kG0ZvBX8lKaGP5Q2cyMwMyItG9TEa
 d/1liLVI64Hz94D80aPlWPWQUzWkpZzSp9cBOyJe+uNCdTeSgI7latMZk
 GoW1zcZwV9/8LePabZMJdw4R/hFKX9zdXDtjEmMav8a8cW7/JzmsTKtT9 g==;
X-CSE-ConnectionGUID: hpcB9mH5R1WbcHyxJNzTfw==
X-CSE-MsgGUID: yW2m61BhT4O00fgsikZUDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="59256617"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="59256617"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:18:46 -0700
X-CSE-ConnectionGUID: UHCjd4b6SGGhU4ebRIVHdQ==
X-CSE-MsgGUID: buNJZ98rRCqEM0tBCuJKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164013943"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:18:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:18:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:18:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.81)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 4 Aug 2025 20:18:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehmV1rmbZnUHjv+9Am5v5wDDAm4Pltuyr8zrFNrTC73IH8ePK7YywQyA7KW60ZGPYuwKrXorxwVCF8aSphWc51QrZAwOe371Q2tdaAR59TidMcAJJGcfmrgg5kk3YCfhNZELkPMvANX5BIM8CesewIxHrBT6WfF4vDKc4/PQiL3aMokUHYUNQQvEZgFVwubfnfBiQoBERK6oG0IUGLDETh8yHU6iswejDl2DvtdNXlZLydyiRbcqu4SVz5ecQtLlXJdEwRf0sTywXjkU2Nuk6y5xzudaOsR1QX2JFI+iHqW6T7EUxk+uvq2mQcnqel9HfXLEG3M4HTgK50F5OkVrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gGNvFcr0fmX86Bva8WLxiz8imM540PXVFu+AqO/2LE=;
 b=zOWxLL6GLFOBKwEdekkORC7n8OyLOfjF/YkA39sK1TaOlnExgCvPUfZ2TU9c9jm2ZM9QCcOiJ2dSc5B4ou+5y9SyxeblT35alyywlOaW+W94X5+sXuadDGzRdDr2U3ZhS1aGACfX8oxpQo05lLkO4lNlqjuIEGIw7ubpVAV8pCnZuzP5pypM/NHsgYPkPPTgzA65z0wEbawbva2B4LbXWbnO80KxICrG5zZ5VAVYRwS4sP0wzavyqO9PiaMTqy04j/QexFyBpad8yHRrSWpMpa2UvQXlmuPk1WliRCCePDF+p0UHxuzcWIDY5kg+HYESln+UwDaDZxZ2b842HfGjjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7786.namprd11.prod.outlook.com (2603:10b6:8:f2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Tue, 5 Aug 2025 03:18:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:18:42 +0000
Date: Mon, 4 Aug 2025 20:18:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/6] drm/pagemap: Allocate folios when possible
Message-ID: <aJF4D8D8D+yMbkWu@lstrano-desk.jf.intel.com>
References: <20250730142357.3851167-1-francois.dugast@intel.com>
 <20250730142357.3851167-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730142357.3851167-5-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:303:8e::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 31572824-4a45-4ff2-10a6-08ddd3cec7ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFAyTHhOUXI4WGhHTXRvK1BTaTB6bWVyUkwwaHNnTVMrRlIxZThRTUcvbFRp?=
 =?utf-8?B?WjBPam9aRGJ4RHFrWmVrYkdTeDg1bE9xaDA1QmhybUEyOWU5MkRRM0pTODJn?=
 =?utf-8?B?QjdicXFCb0VaR3k5dkFWMnQvQ3lpeVdsSHZrclBZcG1zakRWMXN6R2pwMC9W?=
 =?utf-8?B?NUlTVXJGSkNFNm8zaGU4Tzl1Umh6YjAzb0ppYitOaGZMMzNkcCtDbldsaWow?=
 =?utf-8?B?MGRoUFBiNXo2Y1loS1BMbGdiQS9oL2VrOGxDcWNyM2hvZFlrc1JWUC96a0dl?=
 =?utf-8?B?UWx3K0hvMXpJR3JUTFJzdG5jV1pEQzEyZkliak02VEJpaVBXODUvNURaZFl0?=
 =?utf-8?B?elFmYUlqZlJ5SGo0djQ1bE1RQUg5VWlyVitaREoxRFJjTEdLelk2NUh5amV2?=
 =?utf-8?B?MmJ0YVdGMXUwUGpyUTYxaVZpalloYzVFSEJVSTEyQUtOLzJoMVJCOTA2OUdV?=
 =?utf-8?B?RWc0eFhDRGhpaFo1dlQxZElkRHNqVmJhcFFTQWhYTjFuNm5OZmNGVnZkRXRX?=
 =?utf-8?B?a3pCd1dIek9IZ0hVQjhRdkNJK0hGUVZFb28xcVlhcmpFUnNscWhVU3ppVTgr?=
 =?utf-8?B?SW5ZSnlOa2x1ZEZWbFovUVduczVkbS9QVERIKzZvRWJ0Lzl5N3hpWm1xTlVS?=
 =?utf-8?B?K1JIcDZhcGttTmVGbzBYdCsrcm5HckJYbTBmdmgxTzloeW1jMmZuQ2M2dXBq?=
 =?utf-8?B?RTBhRjg0blc2aUw5YWpmeGM3K2E1TlJGSW9vVURYZm5LOU1qcWJuT21DeEox?=
 =?utf-8?B?RVpnL1drVmRpZ3VIME9FYWJiblU1YTQ2SXVCV09RRGN5WlVWb21tYTRCbi80?=
 =?utf-8?B?cHB6RnRCWVpGakp6REQzaGpSM3Q5d3l2K0NJRkllZzkrYTNzWnNtSXZMVThI?=
 =?utf-8?B?Z0dieWdOT0xuVjJlYUx2cWdhTDJYTlY3NVFCVFRNS3E5Yk5kM2lGb1FzN2dC?=
 =?utf-8?B?RG5aTHAva1cySkRGUjBsL0Q5NXQ2bFpTcGV2STBSaTVTUDliQWFoNW9lZ3NY?=
 =?utf-8?B?WkJtdDN2cnMzT2FUcm1NcEI4U1FpQjFRRHMxd0FUckdRa0R1TG1tYlJySXNu?=
 =?utf-8?B?YW9Fd1o5UXVLYXlEQmNydkZTeDFQR2JEU1pwMEEzbzlRUVEvMXp1TXpnZ2ZZ?=
 =?utf-8?B?anRtSC85UExVK0FvRG5nbVVSMkFldjBGbTVWMzNNbWZ2RUEvZURsV2ZlQ3cw?=
 =?utf-8?B?KytlQVVYckg4OFNMbVRwOEp5Z29yaENEOXRJSTFrZ2xxNEpBZEp4dzRBR0Jv?=
 =?utf-8?B?Wk1WMDV3RDhuRUtaa0ZHRTJPdUlxRWE1WDVxdDJNTWFHYTdSSzJyOVRPRkY4?=
 =?utf-8?B?MWpVSmhOQzN5ZVlBT0xhZzhVK0c2Y2tNcHQ2MDJ4bTY2OEpWYnRwRko2ZnR6?=
 =?utf-8?B?K0NLczdRNUttWUFuSTFnZUVYK3hSVEZIbmhKNGxkVTRLYTRMakFiUUkxeUxo?=
 =?utf-8?B?K2ZLWEhEcWRqVm9yamRaWG5vVmI2bUdrbE1WKzU5SkcxMEZURHhTK1I1NHNi?=
 =?utf-8?B?N0VxbWJoL2JEVGdVOXNJRGpOZmJiVXFSLzd1YkVCNG94SzRXR2MwUWV3cVpQ?=
 =?utf-8?B?dEJCZy9VT2JRbHNsMlNhcnU2RjNlMytwNS8yZ0hPdndpOE85QVFOWkRlU1dv?=
 =?utf-8?B?ZzU2NVZqQzRCdVpaTjI1VENHZGd4ZVRqUFRwalYydUo4Z0NxL1ZrbDc2WHha?=
 =?utf-8?B?dWNpOFdlOElLaHVrWXk1cC85OVZuWUo1UktJOXhyT2VGOFNSK1BrcktuQ011?=
 =?utf-8?B?MTRBUGpCZTkydnhoaVFLc0hRcFFBWmhNSEpsbTZRVE53VEdoaS9pRjZHQnds?=
 =?utf-8?B?OGVOYmdKMlpLVTNrekVsbnNZUHdFYzQ4SHk5djBjM0JHQU1uVTVGdTd1cTI2?=
 =?utf-8?B?SHo4V1cyU05Vb2ZnRjBzTVNnaU1SNXd1UlBrR2xmN1BFMzQ3WmlUdjZGQVE3?=
 =?utf-8?Q?db24z6ESRoU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1h6bEdoRWxvYW55c2U5Z05nRnFOVm5YWTNJRG5PWGkwOVpObzdFNVJ5SkxJ?=
 =?utf-8?B?bVhDTTZYRTFZRmxLaitHRE5FMVZGcHE4WE1XRGNOK0x2L0R5NlM4TU1mR3Jh?=
 =?utf-8?B?WUZnL2FDZHcxQkpZaUluZXNsSWpwZzV2OVlLZEZLVEdxeldKM29ZNll0WUdX?=
 =?utf-8?B?ZEFreWRDV1pEdXFqOTBJUDFxaFZWWldleXc4MEhHOUgrRWxWbG9TNlp2WDNN?=
 =?utf-8?B?bmUwNml1Z0w2TG84cWNIYWJLakYyS1VtY214SGEvSVhwbzE4bW83ZFZTd3Nx?=
 =?utf-8?B?ZkZRM24vcmNYcHBZOG9lQlhzZWdnWTNDaGZFd3hqUkNMNWZVbGtFRXdGaW5O?=
 =?utf-8?B?SHFUTEpDbURSb1lNTWNTR2ppVXliQzdLSkMyU1JtcFJRN29oZUhtT2lydmxj?=
 =?utf-8?B?bWh5RisrTEJZekFHa2JldmtHUGR4MUtTNHdZYlVTZUVSU0hrYkpud0c3SEEw?=
 =?utf-8?B?TWdyaVlSakhDWFRhaDJXUFJLbllNMEFJR3FUaTROTzg4WHZ6SW9mQUNDcWRx?=
 =?utf-8?B?Q2VxeGw3eUxzaDU3VmpGa2I3U0U4NHowZ0dhcEFXZEpjcDZ2RXhjSldpRVJu?=
 =?utf-8?B?N2RsM0FITTYvcmNlbndJcWFOQUZPQW8wdXAyYi9meStGOWNmcWZNTlFIdXE1?=
 =?utf-8?B?U0FYTlhnK0hKQnhzNEE5ZFVWVkhmMmJQZXpWT0Zmak5uRjc0b1ZkMkJCNEUw?=
 =?utf-8?B?cHRkNUZrMFpVTWtydW5JNEhtYVl5Y1FSdGdWZTFHY0VlTk1QellwSXFubHVm?=
 =?utf-8?B?MkVMVkczSW9uaFVqT0dSVTlpR0Urd0JtQ3JzNWwwTGlpcCsramNrNHcyblI0?=
 =?utf-8?B?WXFqalhFc3pYUlNYM0x2Y0ZEOWRsVGlCeUFRdTdNNG9JSjBaa3hoZmhmNEhD?=
 =?utf-8?B?SFFZTGdqWjU1UUlwbk8rZXZENmt1YS9sVmk3cFhGanVVYnpOWG5ydEdKMmxh?=
 =?utf-8?B?TXNQMU9CMkdqUDNEME42TkFmMWRrZmh6aTNjYUhLTFNlSGVPV1luUW8rVGNN?=
 =?utf-8?B?TFVkMXpsbTBtT2U3TC9oM3BURStsNCtPM0FNMG1RSjdhRmFWTGxpaUhSTUFP?=
 =?utf-8?B?VnhRTDFTTnV4MVlnT0ZSbkdXRFU5K3RINjNYcmV6cmNwSGt3c3pPQXNpM3dt?=
 =?utf-8?B?STNzYzdkZjNUQzB5MStLSUI3M0V4eU0xT2p6eHJHM0Q4U20zK1RsYTZhaERz?=
 =?utf-8?B?NW9nZHZ1TWhZdWlENmxFaUp5dFdyWTJZWkJLOWIxYTQ5czZDK2E4bFJNem5Y?=
 =?utf-8?B?RHl2b21HTXF1bENWSk1sT2NVVkgvak42VlFRbUxCeWhLczRRMHN5WEoyY3pn?=
 =?utf-8?B?enpzWDRmN1FzaStVRGRtV3owUmZnWTBzSTVuNkNNOW12UzcxbWJJWjUzZWNK?=
 =?utf-8?B?YzNYS0hBeU8zcno0aGxmVkNMUjJSR1BRWktPQlJYOXRkUG5Ca00zWHZLRnps?=
 =?utf-8?B?bzBhNGJyVFYvUlhuVWgwN3lpemxQSHJtQk9pWWMvanJYSndqY1d5Q3hqM2Uw?=
 =?utf-8?B?dnRrVWY2RWtBT2pUQWlYSFV6RktqaE55eXl5THoveFFiQjFhakJTSGt2UGh1?=
 =?utf-8?B?dWRZak9RS0tSa3ROUmo5cSsyb2xKUWszNTBYbzMvMFlrQ0xnLzg4YzlUWlph?=
 =?utf-8?B?YWJ3VXFJaGNFYXhENVcyOUdEM0JpL3QyVjBhdHhYdlFIYW5xdzhpcHFzNDJV?=
 =?utf-8?B?U1J2ajdwUXc1VVZ0endOdktvQ2xLYkZvTXRVdTllNFl0UmpRYjJ3MUZySU1s?=
 =?utf-8?B?QWRWNjBlbndPRDFiOEZGWmhUK0tzNDlVd1NGd2VSaWE4SWNDaDh5eGcrZm9R?=
 =?utf-8?B?QVl3VUJ4YVlwT1lZakpWRVhWVTJhd2NYeWpvUHk5WEtHMGtJZytWaDdaK3dK?=
 =?utf-8?B?bU1iazRyRk9CZC9jYmVmRTFZOWxCODhDN0IwdHFVbVlOck1jWUs5OUsrWnFs?=
 =?utf-8?B?VkJLeFIvK0ZDNi9Udm9NK1VzV1h1THVBZy9KdnJMQVR2Qkp6MG5EdTArNDhn?=
 =?utf-8?B?VFhuZkdHbXBYeXVPcWpqc0ZGQUNQNENrYS84ck9zcEUzQk9hU1lHWG1XQnRl?=
 =?utf-8?B?a3ZvNTBuemxrWGxyQTlZeVp6K0JyMUpzZE9sUytNMC9YWjRac3BmL3B1b3Qx?=
 =?utf-8?B?SkErUHRLUmhib0RpeklIYnl4dk9KYTljNGFJdCtwa1ZsTW1JYXNhYXF5N21E?=
 =?utf-8?B?L2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31572824-4a45-4ff2-10a6-08ddd3cec7ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:18:42.5159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzY5VzpGp9039fHZ3iMrzkAq4xqxIHN+PaTVvb5bZEvWKL6V59mCfS2i2LjmarkHme4CTsrYUWrOxuNWTgrE0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7786
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

On Wed, Jul 30, 2025 at 04:22:49PM +0200, Francois Dugast wrote:
> If the order is greater than zero, allocate a folio when populating the
> RAM PFNs instead of allocating individual pages one after the other. For
> example if 2MB folios are used instead of 4KB pages, this reduces the
> number of calls to the allocation API by 512.
> 
> v2:
> - Use page order instead of extra argument (Matthew Brost)
> - Allocate with folio_alloc() (Matthew Brost)
> - Loop for mpages and free_pages based on order (Matthew Brost)
> 
> v3:
> - Fix loops in drm_pagemap_migrate_populate_ram_pfn() (Matthew Brost)
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 50 ++++++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 0312edb8d4a8..e43676e15fe2 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -460,54 +460,80 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> +	for (i = 0; i < npages;) {
>  		struct page *page, *src_page;
> +		struct folio *folio;
> +		unsigned int order = 0;
>  
>  		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> +			goto next;
>  
>  		src_page = migrate_pfn_to_page(src_mpfn[i]);
>  		if (!src_page)
> -			continue;
> +			goto next;
>  
>  		if (fault_page) {
>  			if (src_page->zone_device_data !=
>  			    fault_page->zone_device_data)
> -				continue;
> +				goto next;
>  		}
>  
> +		order = folio_order(page_folio(src_page));
> +
> +		/* TODO: Support fallback to single pages if THP allocation fails */
>  		if (vas)
> -			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> +			folio = vma_alloc_folio(GFP_HIGHUSER, order, vas, addr);
>  		else
> -			page = alloc_page(GFP_HIGHUSER);
> +			folio = folio_alloc(GFP_HIGHUSER, order);
>  
> -		if (!page)
> +		if (!folio)
>  			goto free_pages;
>  
> +		page = folio_page(folio, 0);
>  		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +
> +next:
> +		if (page)
> +			addr += page_size(page);
> +		else
> +			addr += PAGE_SIZE;
> +
> +		i += NR_PAGES(order);
>  	}
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +		unsigned int order = 0;
>  
>  		if (!page)
> -			continue;
> +			goto next_lock;
>  
>  		WARN_ON_ONCE(!trylock_page(page));

I missed this last time—I'd suggest using this to make it clear we're
now operating on folios, even though the functionality is the same:

s/trylock_page(page)/folio_trylock(page_folio(page))

Reviewed-by: Matthew Brost matthew.brost@intel.com

> -		++*mpages;
> +
> +		order = folio_order(page_folio(page));
> +		*mpages += NR_PAGES(order);
> +
> +next_lock:
> +		i += NR_PAGES(order);
>  	}
>  
>  	return 0;
>  
>  free_pages:
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page = migrate_pfn_to_page(mpfn[i]);
> +		unsigned int order = 0;
>  
>  		if (!page)
> -			continue;
> +			goto next_put;
>  
>  		put_page(page);
>  		mpfn[i] = 0;
> +
> +		order = folio_order(page_folio(page));
> +
> +next_put:
> +		i += NR_PAGES(order);
>  	}
>  	return -ENOMEM;
>  }
> -- 
> 2.43.0
> 
