Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A111AC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 16:58:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE2D10E8CA;
	Fri,  1 Aug 2025 16:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OpbQ5Low";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754D510E3D7
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 16:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754067481; x=1785603481;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=u526FyDIuJsMadit/TJHBrTVAHWcL5oQ62u4NQHsqI4=;
 b=OpbQ5LowgMZLxNu3sZMTvNZh+YhMBi7wQxdk3WhROll0orrxXdb00H4x
 vT/NBqJjzfc29lFcDv/7b+ebwMnWURxVReHonyKFhyQ2aVwsslUmOL/8V
 cebYdeE9o2DfTD+BqCWoMsL2RdiqDQ+D6bXeMtfbvwjt6PR7vIykAFfAh
 tQ0MaWKOwlRZPPhNINT/KAyCq306mSwDFzaDgifbmIdByZ8dq9byTVyO/
 XZ4LdPIAqazEDRXfxri3+CwhnyGfVK7dD4rL91aLc7Xc8XtKsB4D0TnBM
 nob82XkK7tj0cn9xR+Dsh69s3TRyJ4zM/5++LdLE7NsGT6VTGiXs9TEpf Q==;
X-CSE-ConnectionGUID: Q9q/IrTzQBCHgbAQUw46+A==
X-CSE-MsgGUID: eGlJuSapQgSmBsKo77Nxiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59042018"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="59042018"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 09:58:01 -0700
X-CSE-ConnectionGUID: jQRzVmKjRIqRJGHmwHA0aQ==
X-CSE-MsgGUID: jRxdOiHXQRWk0UynGtKhcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="168909259"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 09:58:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 09:58:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 09:58:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 09:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdnlaMD8bo3Fd2A9dTAHLzWfOtfUIyCfhNuqpj7Wy6IA/UkU/twchaYcD0PlujOor2wurex025gfBx6kVg3a2F4vSTorMhasJa/r6JPFIcagpdarSxFGhx4fRUUC8hiz+f4EX8HQpZS2Bg9IVtqaLgIyDtlPOh13xWV3fzZNRqoD76SUj23hOKLP21xWgxL93p6vrRNlcqo3pSGa16kPxaxRcqyfhVrUmLBYJb/AmzujYoC+HvV9xY0I/EFBrRzVqYN0cD4U6NCt1eVIO7vnOusOk0QDjXXMIkC2imdrSjLcTO/ynwqx+127OSMlEC3DETyAWOHJxLSONmmnZk6XUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UwghaOae+B5dW/iduS+ZpF2F+i77jZUudHCgqaCdxA=;
 b=WmpqvULOK2efuWDj5cNXCkLYt51xPC9H/h1KvBlu7we7wT9hknN+S5IpKPfwdWV5DqgG0Jm2HBWMotUlJl6/nEMmliCbKZ7FHTpBFZlFE7v0zP2VZui3IrgSEpgUBpBTnz4Ynu3E8Na9J+f/jmh2SRCMpQsw0xjmRVqeDKolvniRhcv/1lTTX2qmZQ/yqaszqoEya7zWtVdcXHjIe3BJnMSmDly98SprrxGx8wrbFDFlUPsE3C5twhk/K9y4l+YFcm+XVEAhQCkg02ex5KeMMMZP9xfpXzBvr/R120gWW/PJobZHNM8je5WXUdLztKyK9AErAv0/7sZG48Ix65liuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Fri, 1 Aug
 2025 16:57:43 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 16:57:43 +0000
Message-ID: <adc72f34-de00-44f5-b9a8-8ff6b5aad442@intel.com>
Date: Fri, 1 Aug 2025 09:57:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] drm/xe/guc: Add GuC log init config in LFD format
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250722013553.1266218-1-zhanjun.dong@intel.com>
 <20250722013553.1266218-5-zhanjun.dong@intel.com>
 <4c3a225f-fbeb-45c9-9659-ddfb1046d0f6@intel.com>
 <ce8abaad-0dba-4cd6-8364-d83e882f69ef@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ce8abaad-0dba-4cd6-8364-d83e882f69ef@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0282.namprd04.prod.outlook.com
 (2603:10b6:303:89::17) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|BN9PR11MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: 886a6235-d9d7-4810-1fe1-08ddd11c8869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3lVVkl5ak1qTjBmOUhKZFV6MUE5RXJHVDFzS2h5N0VKVVJEL01KdVRYYnY0?=
 =?utf-8?B?M3Q5bHJjbERWckJxdG5sRnlLY2x2MDZkTmJNdCtuYTVvNFBiM2dzTXE2LzJJ?=
 =?utf-8?B?QlBWRHd5Q2w1L0xmSVZ4dUtEM2JQTHdYSWcwVWN2V1JFVUVuVXdVR0lraHNJ?=
 =?utf-8?B?Qit4ajhrc2tYQWJvS0ZDaTV2dW5uTzgyUnU5MWs0bzNBQ1B4a1dVNGtBK0N4?=
 =?utf-8?B?M3RwbHlabHRadHcwYVhhNGx4ek9TeEdmRXgvTDJjYTcyL3VNVzlqbytYNVBu?=
 =?utf-8?B?Y3NsdnNDSWxaWXA1d3RMME93NmE0aGZpVG83VHVxVDVqM0szd3BDTy9oVS9m?=
 =?utf-8?B?THp1bDR2czV1QzBzYkt1Znc0VnB3T1hoSThNRldJV3hEWGNPK3kzd3VITm5C?=
 =?utf-8?B?dlliWFo3VWozVFpNeWN2WGJxUFpNc2lIYURNT3kvTWZPY3NSY0VuRXJZdjlR?=
 =?utf-8?B?alpHUEw5Wnh5ZVhPbERGRGU4YmNUajMyNk1oZjlFTytnMVE3RWoxWlkvNUth?=
 =?utf-8?B?Z3VFdGRQditEa3FmVFRnNzROWlYxUktUaFlKSG84V1RscmRyQWdReEdJL240?=
 =?utf-8?B?ZGJnTjBNOHB4ck1nNnhXbk81YTRxSGZVWlFpdFptK2xaY0xTeHpoczJjRlNT?=
 =?utf-8?B?am04STd6Nk9kcXA3bllEdVZhcllncmc2dlhMK2Z5cmJ3ZVdXd2F4MmMrK2lE?=
 =?utf-8?B?M1FENW84UG1HVHliNmNIQVFYeUNrbHdqMUllcXQ4YUVwN0RZNXdBcFE3MWhi?=
 =?utf-8?B?U1ZGdHVqemdTKy82VFdDSmRNTFhieUVLNUJRM0piSlkvcmk3Y0w3NnMralBD?=
 =?utf-8?B?MDFLUVpYRkRlak5GZXR1ZFR4MEFjQWZMR3hPUWFLcWhWaHhtSEE3L1padVFY?=
 =?utf-8?B?TzZXdy9kN3RkUVJLd1ZmZjErY1I5QThFMURmL2VEVTFveGxnNm04MVZmU3B3?=
 =?utf-8?B?aUhNOU96LzkrOWhjYlQyYXNFNHJJblFQOUtndk1vZjBpTVRkcXV5cHBVSGtW?=
 =?utf-8?B?TCtlakJyWktYbTBmRDVqaXlXQk03Yk5XajZWbTVYenR0ZGNicnFuOWpMRTc5?=
 =?utf-8?B?UDdXU1c4YWFZaVB1SVMzYnhvOFU5NmpQVWZFeFNWQ2o5YkxRWW1VMGtrMm1X?=
 =?utf-8?B?TEZpV0xGNEhVN1pyd2N4MkEzcDh4bkh2WmtxUjNrK2NkRjI1OWVBNmNua0Fp?=
 =?utf-8?B?M01oRzVjQzk0djBHUEgvZmM1NjQyeDlMZFBUZTZpMnlrdkgwcDQwaEpqZnhj?=
 =?utf-8?B?OEFLL3pPUFp6aW1RQkw0YVdRVEtndFJBNE9seSs4ZHNhaHdxbXpXUUFEOGhI?=
 =?utf-8?B?UHNLMWxiR012Y2tpNTNZeGlMSVFkUVlaSFdNbjhJeEYvRGJsZHJ4Zk51QUpu?=
 =?utf-8?B?SS9OanpWYlNwRjVsSnJsSytGc09VWFZUZkZSMXVoVXdmMndtS2JlbFpTc0Vm?=
 =?utf-8?B?Mjl1dlRIUy9aeFRTdlhxamFqNkhhbnpPeUVwMm5VcEFqY1N0UXE2WXMzMjhh?=
 =?utf-8?B?L0tTSVgzaTdBam8zMjFja1M5TXFvREw1TS9TUGxKRzhyYUJZQ2VNMlgwZWpL?=
 =?utf-8?B?UXlFQnRCN1UrLzYwSzVjSi8vTUdqTjJ5b29EUCtFN2tZWlVWQUs3c1EwY0la?=
 =?utf-8?B?ZmNobVVpM0R5TzdJRzRHMW1yVUE4UHlBazRiTUNNN2gwT2NZZ0kzdng0TDlj?=
 =?utf-8?B?d1UwRURscDFYTlZ3eWZVSkRJWjJKOEFhZ3N1akVNR1hka2pEMFlyciswQ1cr?=
 =?utf-8?B?R1o4K3YvTnZLSmhQbSsxYmdON2wxZkRIemJGNms1N3VVZVIvTGZCZ0FvbUV2?=
 =?utf-8?B?cENHZU16RS94TVZDWGI2dXR3dWgzSkxyVlZHNTdhalhvL0Y1RVBvTlI1aTNu?=
 =?utf-8?B?Mkc2TmZuTUNnU1UwMDArR1p0TzdLeG0rcFNOSCtQdWJ4LzF6YTU0N2xGdkha?=
 =?utf-8?Q?DtpWfpQpEww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVlOd0RSaHgxSEpDNlY3ZDRoNTFPTkM2a3VVcUVlT0R4UzdWMCtVVUxCamJt?=
 =?utf-8?B?U3dRU2tEakFWR1p2eUxORXAyVG5mM3FLNTRvc1lNbjVpZlBIVnBKbjMvQjVE?=
 =?utf-8?B?UnA5d1R0cHFtSjhBU05pWDAxaFNQS0hmejdkQ0MrSmJqTDR5M2JmeFBwVnZS?=
 =?utf-8?B?aFZYWUhvcnZTeHhGS25xVGtQUnozTXNHcURqejhPZDYwbzBMbUczZE0rNXZF?=
 =?utf-8?B?SlB1RGlCeVY0dkduUTVXTUFhNEdyNGVNa291V1BpaDVTYlhaRktwSTVFbTNs?=
 =?utf-8?B?ekhmeHJGV1k4dTdPTHZjRmlOVzhZTEhpbWVGK2pKREs4YnlzUERJZWVJRUJG?=
 =?utf-8?B?ckZublQyMk5XajZrdy9veEpTVVBCYXRsbkhtdGF6NDRvSzV2M2RzNnJKQkhW?=
 =?utf-8?B?OFVyMHBISStHbU1vemtQZ0hSa0lWMWJEUjdsR1NGZlJFaTZuVHBQU2pGclN6?=
 =?utf-8?B?Q2xwSVlZeGpHak0wK1VYTWRlRlRLK1o3NVZESGYvUENCSEpYTHVOdWs2cTdu?=
 =?utf-8?B?TE9MOTRycmVNeE11SmlJNThGVmVWa0dFSjFWTnU5VTBjMTJlUG9TdG5WSGdM?=
 =?utf-8?B?SURwL1ZaYUgzak9jZitjSHFRMWEyMWwwVlZ2MU9rKzMyMVpqeklOelk4L3Zk?=
 =?utf-8?B?NHFsSnMwN1p5eXRkSytPSDFWR3ZxL3U0cU41c1dKNFltVi9pVFdLM1JuYzl6?=
 =?utf-8?B?UW5NM3gzYytCM0o3em5SemVRS1RRcmJvdTg0dmgzcUx5UEdLbXVBa2hzdE1j?=
 =?utf-8?B?RXJ2SFQ5QUhIYUI0SFRPODFFSlJSN1VVRVlGS0E2Ri84N1dkSEpVMWdtQWh4?=
 =?utf-8?B?bXlCYzBTUkc2VktVcXQ1WE94d3pKZE5IVmdobnRHS01pYXBuelErbGFnczg0?=
 =?utf-8?B?QVBhTHp6UVJhbmhqZzVITVlJUzNFb0RUODJhcWZ0a3BQa3BWN0haamdsalNm?=
 =?utf-8?B?andHTWlPY0JHcGJXK0ZMMUZEaENPekNWN1RrY2VFUktWMTZhN3NhR3l0Ymxi?=
 =?utf-8?B?TUdvT3dJbmw4cktnblEwUFM1UmF3eUlDYlVwUE04MzJOd3c3bnMxSVN3SjNl?=
 =?utf-8?B?bUcyMWpiV1BXTzJ3TVFualhmUFdDWjZvdkwzSVYvb04zZjFkcUM4d2xRaVlR?=
 =?utf-8?B?VHY4Tkd4QXA2RkVrUHRqUkFtRTR3dkNVRlh4Z0VZeWxTZThHUDJSNWxIOWJw?=
 =?utf-8?B?UDI5NG9vOEN5VVdhWEw3Ty9Td3lSODJEYlk2VjhhUGhOK1Z5K1BJZmowVHln?=
 =?utf-8?B?ckF1bm5OdFlxR2k1T1RGNjB1dVNzS01idlFNNVRlUjc2eFRIV29ta0F4Vmt6?=
 =?utf-8?B?VVFoTGRMRXhEN1Uwc0tFcFV0MG1qQkdoWmIza3BHT0ZoTVo1QVpmNmRTN05J?=
 =?utf-8?B?UWNHdHJPVktjNEZQWi9QOERVbUltbWc1aEZhb1Z5eHlxMXJ3ZWh2SHBlNGYy?=
 =?utf-8?B?a0lhRVRuU3p3MVJoNFRGT3F3V3dOdDRuRnZTZzJEdTE2RkJsUDJrZjROdmJI?=
 =?utf-8?B?cE5tcDNaZkpKTjR2dWVGVGhVMlJWSjFFMkZxaEowMUxHS1d6clhYWUZ6cmJU?=
 =?utf-8?B?ZVdYMnZESW5ud0JrNFUrR29IRFJiaWtoN1BUaXMrM0tmSTdDWENpN2k1MTI4?=
 =?utf-8?B?UVpRZnFpcVg1SWxPdnVqdGgzbGNNQmZVNWQzL0Z5b3dxTUNjR2JuUG1HTVo3?=
 =?utf-8?B?eXVEa3E1YjJHTjRFRXpmbUl6d21maDY3bG1nd20yMElhSVNMdUtmcmVKUnhB?=
 =?utf-8?B?blBxL3lDMzVtZXFzZnBkVitxdzBWQzkxNlRsa2RlT0taS0ZtVFpScGVZc1Mz?=
 =?utf-8?B?ajV2aXhVQ0MwREJLcFllM2s1YmdqQThwZmIxeFNwL0xSMFZ5N0d1dE94MjZx?=
 =?utf-8?B?UlVyN3l2cUZMOUxZQ05keWJLV2NydGtGMlNNOTFPWjRSdXA1bGwzcVJEZS9n?=
 =?utf-8?B?K3pkN3ZmU0NVNFkyazM2c1M1QlVORFVzRC93Vm5tQ3M3NVRnQ2FnbitWVzFO?=
 =?utf-8?B?N1JaajNIZ3VSRWhIWEJQaS9VYWhUVk9nS3FlVTBBa3BsVlZ6MFBVK1pFSjNK?=
 =?utf-8?B?bFZqeVpUN25pNnRhdUZEQXlDbmh2VG56Mlpmd2MrR1g1Rldvc1JiRFBWOEc5?=
 =?utf-8?B?WHNSRUQxOEtUZjFtbXBOczNES2wxeUlpdVFJa3RLS0hNdVhXMUhyRGd0Unk0?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 886a6235-d9d7-4810-1fe1-08ddd11c8869
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 16:57:43.5689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esDXGUw8p2SyxvightdMmUaDTXMx31Uo0YsdkLag7TpHkPo8t7YNxaXWLJmr9oaOZky6ApXcqulvSSHMf/K1dfRsKU0QPecPS5MnAlMRHQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
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

On 7/30/2025 4:40 PM, Dong, Zhanjun wrote:
> There are multiple comments, this reply is focus on 1 topic, see my 
> comments below.
>
> Regards,
> Zhanjun
>
> On 2025-07-29 8:27 p.m., John Harrison wrote:
>> On 7/21/2025 6:35 PM, Zhanjun Dong wrote:
>>> Add support to output GuC log init config (LIC) in LFD format.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_log.c | 204 
>>> ++++++++++++++++++++++++++++++++
>>>   1 file changed, 204 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>>> xe_guc_log.c
>>> index d2256773aaf3..609a9fd5ba0c 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> ...
>>> +
>>> +static int
>>> +xe_guc_log_output_lfd_init(struct drm_printer *p, struct 
>>> xe_guc_log_snapshot *snapshot,
>>> +               struct guc_lic_save *config)
>>> +{
>>> +    int type, len;
>>> +    size_t size = 0;
>>> +    char buf[GUC_LFD_BUFFER_SIZE] = {0};
>> This will add 1KB of zeros as a global static object. You should 
>> never give large arrays an empty initialisation like that. I recall 
>> someone once doing that with a 16MB array and it took us ages to work 
>> out why the driver was so huge in debug builds! Also, this is putting 
>> a 1KB array on the stack. Kernel stack space is limited and you 
>> should never put large objects on the stack unless absolutely 
>> necessary. Just use kzalloc() for this.
>>
>
> I agree with you for static or global arrays cases, which will cause 
> .bss, .rodata or other(depends on platform) read-only segment 
> increase, that's because the static/global data is initialized by 
> loader, loader copy data from .bss/.rodata segment to memory, that's 
> how it works.
> While for this case, which is clear local stack memory to zero, that's 
> not load's task, that is compiler's job. Compiler will generate either 
> memset call or machine code to clear it to zero, for example on X86, 
> disassembly code is:
>
> xe_guc_log_output_lfd_init(struct drm_printer *p, struct 
> xe_guc_log_snapshot *snapshot,
>  501:    65 48 8b 04 25 28 00     mov    %gs:0x28,%rax
>  508:    00 00
> // I set GUC_LFD_BUFFER_SIZE set to 0x258(decimal 600), compiler has 
> some calculation and make it 0x268
>  50a:    48 89 84 24 68 02 00     mov    %rax,0x268(%rsp)
>  511:    00
>  512:    31 c0                    xor    %eax,%eax
>     char buf[GUC_LFD_BUFFER_SIZE] = {0};
>  514:    48 c7 44 24 10 00 00     movq   $0x0,0x10(%rsp)
>  51b:    00 00
>  51d:    f3 48 ab                 rep stos %rax,%es:(%rdi)
>         size += xe_guc_log_add_klv(&buf[size], GUC_LFD_BUFFER_SIZE - 
> size, type, config);
>  520:    49 8d 47 10              lea    0x10(%r15),%rax
>  524:    4c 8d 34 04              lea    (%rsp,%rax,1),%r14
>     index = xe_guc_log_add_lfd_header(buf, buf_size);
>
> Data cleared by instructions, there is no access to RO segment.
>
> Local buf={0} should be similar to a memset call. If you have concerns 
> about support of compiler/compiler options/processor combination, let 
> me know, we can change it to memset call.
>
> About the size, I see warning of stack usage is more than 1K, will 
> reduce it to 600 or 800 to avoid the warning.
> LFD header is small, 600/800 looks good.
>
Several hundred bytes of object is still a lot of object to be putting 
on the stack. For anything over a hundred bytes, you should be asking if 
this is the best way to do this. And in this case, it is not. Simple 
re-working of the data structures would mean you never need to create an 
oversized buffer for run-time construction of fields.

John.

