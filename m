Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F265CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 14:58:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1176B10E7DD;
	Wed, 22 Oct 2025 14:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQk0UdoP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046B10E7DD
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761145123; x=1792681123;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3oeGXhL30BK48C9uHAaOHCvb0nfaIw1LWJavSn5w4Dc=;
 b=PQk0UdoP1XZ530OTBbdGiKR2nBGWJOyue65T/ACb/S9GhaQI1kgzTTki
 mL3l48zJz3sccCTWeFU2Cte/hypqfud1GxUiSRolX+Mxl5d7OAuod5rz1
 UUHZkbWy4Dl8wAxE4F/nZh6FE/FeqKlEyrOdd5pvICG9Z07O5ITWHxqfj
 McNE0kJxa2Bf4JOCdojL6WMebTCqoWjNTM/qeX6q0Ew8nB9wx9VOFn9Vf
 yK0ReEISnWsJKFD9QxuJnHbPs7AI4XzAxNT1NMGCTApi8To+a9vGvmQ8W
 Aztila7Dzq6fRZb4tfYgjk0FDK/Ymp8tUFU4yNcYfU0ZJliRfWzy1AJBb A==;
X-CSE-ConnectionGUID: I2+GC9eTQYCxhdF3XJAx6w==
X-CSE-MsgGUID: RYNW0qAqSAuwftyF5XQ23g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74641495"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="74641495"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 07:58:43 -0700
X-CSE-ConnectionGUID: XIaAJ+DQRQm/kGTJ+S4XSw==
X-CSE-MsgGUID: i7dkfP6KR8iMwaBOBT/lvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="214541812"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 07:58:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 07:58:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 07:58:41 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 07:58:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFPoPJJTq0fYW24MxXLZdFZIFodEdIzXXAnzwazFL6aj8HVWDyEMwqwI212Y5DNSIapgVsb4fzURmJ7UbON+u/ptSNkNPGTZ/NLgM6G5tyixC8JxYI7Gfq48O2oxfcsxJl58YJJ9tSmMZakW4YhVfSXHf4ww5ky/j1dKX9Oqdt0h8lsvzZdwOLxp1SUYYBEuP5OW+wdXuBOGrD37E/THocovPKJD5HIg+wo3vn1ObDI6vyPaOo5PYD2mqqFbH66tS4eKTha+7G9IHMIXaPfnaSi0DBGtvRtugf7pRi5mfj8Rv04yWyRJX6GCjHZFs5ZK+zcnXrr0EG50tS8ILYQLKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9+tdV8lIno8OY1GTKS44a2CKlz/lvUp13iAg9u84ug=;
 b=B5jv4xiyRNT1yS9ywjuY0Qf1ee1zrlP8ZysRyGQGZGJ8gvR34KDR1rmRuTMNher8yKo13703fCj313OGFQRHdQrg688Ubt70iAE5P5I2Zc47Sx2CA86abwYON+cbRqtfXFdrOflZMDLSoRe3+1F2wGx03z8BM0qAUxCB3dz59B3dkMpCLOxCMS2qj6Boweda5NrRHsa1+rGuucEvcR+CG5cS5/y+B6s+oYb4rvNSGpI6xyuzz1n/BJjfVaaeAWbBvkc1vaAvuhztABSHP35EQCGbHGKSjLdm2iVLjgTV9PvtJTRSRB7WV8FRlwrG90Q8I9yvZwzvUFfU8Sr6MI+8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 14:58:39 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 14:58:39 +0000
Message-ID: <aa7fa70a-b54d-4bc0-8c2a-01d300fa4b1d@intel.com>
Date: Wed, 22 Oct 2025 20:28:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/xe/cri: Add CRI platform definition
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
References: <20251021-cri-v1-0-bf11e61d9f49@intel.com>
 <20251021-cri-v1-1-bf11e61d9f49@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251021-cri-v1-1-bf11e61d9f49@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0160.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::8) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f86a25-4f0b-4b40-efda-08de117b7bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzR0ZVZ0TWRZclpYUDJMZFIxMng2ajg1cTRyKzdJa1Vpb0dFNlVuWGY1Vnl0?=
 =?utf-8?B?bkJXV0tRaWVFRXRBOSt6ekR5cWRIUmhlS3pGV1V5dzVWcHA3d1dqVGI4aUU5?=
 =?utf-8?B?Yk52ekZsclRQWU9HU2dlRXRxRS8yOE5vc3krWmNaR3hXWTl1ZzAxczlWcVgy?=
 =?utf-8?B?eVp1Uk5FMFhYSVd1Zm54ZFlEZFhsTE1oU0dLa3ZqM2FsZ01WcmxISExzd3Jn?=
 =?utf-8?B?b0RDVE5FVjFqeVdGZjhJVzdNSmhpcnRIQXhqVERBdTF4eHpNWVZQeFJRR1pw?=
 =?utf-8?B?czlnNHZLcExxUnF3Vk1TaWlvWEdPWGhrczZvVkMvQThBQWdvZmR6ZkJzdjNz?=
 =?utf-8?B?WGlNOUkyTXc2a3ZnZnp4MlVPUlQxaHdRL0NMRmpVZVZkc2dpUzNvbzJvOVJD?=
 =?utf-8?B?UXVzQkNIcEthQ0E0b083TGhidEVQcjU4VDE2aVFIWWZkZXh3NDBJSnBGeG5S?=
 =?utf-8?B?M1l3WHpvVlB4QSsvRHlqcGo2dndnNit6WXBlMmt0Njl5aFR1VG9UMTc1UGtC?=
 =?utf-8?B?SzBQNUZ0RjlGNGs4NWpkWndmUVU2eWlxa1Q0dXRkd3ozTXpZVGs2Y2pNcFp6?=
 =?utf-8?B?OTdSYmwyb3Y1QmtaVG1TQzFLUisyWG1Makk5eThaOGttNUdVSzY3OURNMTFP?=
 =?utf-8?B?MjBiTlRDOE1EQkN5OWEzMVA3Sm5TSnp1Z2lLOXRqZEpNUXZMTXlxN2tuTmxt?=
 =?utf-8?B?dDhicTlxNUlHRzdPMytKY28xMUZYb3dQdTEvekRKejlKMnBQNE53Y3Y4THR1?=
 =?utf-8?B?ZktMUXFLTXUxUWdKZFYwVS9IL09HSlZlbWJzVkNCOEZQR2pSU0VlYzBaZm1o?=
 =?utf-8?B?RG16eFZLOS9NOTNSdm5hQzlyV1pabkovS1dNZUwrWGNNMlhybHR1NkNoSnl1?=
 =?utf-8?B?OGhVWXhjRGpPNUVHb0ZOOTVSd3FxTS9IeUNzY1U5ZW9SNHNXZExCZTNNaTA4?=
 =?utf-8?B?eXA2WGlkbXpSWjRJWWhyYnB4MnAwLytLd2g4M2x0bnJaWGtzY1d4K1NHMnZp?=
 =?utf-8?B?K1dTTkR5bVV6ZVFRUDhsWGtGMTB4cWpFZno0ekxWMC9KN2YvYXIvZks4Q201?=
 =?utf-8?B?T0pkSkR0dFhQdFIxbGllL0lDRHRNb3dPNVZNSy9DVXJZRzIxZ25iY20xWGtF?=
 =?utf-8?B?cjBMM3ZBVDQwdXF5OEx2Q2MwR1JXd2owUzRuSEYzWTF2Z2UreHk4VDFxRk9H?=
 =?utf-8?B?U1BhQVVEMGp2b2JuSXNyd1Y3YlVWQ2NKR1A3czVGWmFOUEZQZnp4dkQzK1Jk?=
 =?utf-8?B?RkQyeHNUbSt5T2VNbkRTSENYRnk2Qzh1MFgwc0FtMkVndzc4Wk5wL0lUUzRz?=
 =?utf-8?B?Wk5IQWZJdEFMNFdlR2FRS3prb0UzV1pGWFlhSVNtYTRiSDJCdnNUUlV5bGhs?=
 =?utf-8?B?TDkxMjJwUGNYNmpOZmtocWFtdlJtc25OS0xtNWNzZkxIakJ2dFJuVC9IMWQ0?=
 =?utf-8?B?aUY1MzZTRVFYZWZIMHFmeUJ2WVZyK004YjRjL2lnYlZ5ZHk2R3QrcnQ0TFo1?=
 =?utf-8?B?dzFHYy9wcEJ0S2RNaDFjakZGQURid0JXMFJJU3M5dDhmblNkeERtT01JN25v?=
 =?utf-8?B?Z2NmMmZkajRFU0JKNFFlKzVSMWFxQXhtU0YwaHBDMWZXcUhiTHJRQ2d2R3Q5?=
 =?utf-8?B?djNQSFZkdkZXTW1NRkNzd0F5Y3Z3V0F5a3pTM1hjSzU1OHp4WGpid2ptZ01U?=
 =?utf-8?B?ampkdlhqL3ZXbmdsLzM2bldYSTFnVVFNOEY1c2lhSG5MdnR5ZlRaR09CL2F6?=
 =?utf-8?B?WDRMUDFDYkVHYXg4bGQzM3MwSk1qZHIzRFZCam5ua0huSklPUUdIcHVta1Jn?=
 =?utf-8?B?OXhSRnJ3dE1mRUZlaVZRTFl0eFFMVkR3LzVUTnVidXVGSVd4cEpTUmhndmNZ?=
 =?utf-8?B?YmJjVzdNdHU3M1p4MFRxYlh6NzlKUWxpVUhmeEV3b1pzd0FLNi9KbTA1dGZi?=
 =?utf-8?Q?8prq7CrGTnamBw/6b894K2jL/J4TthBv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXVtbDFGYmNHMWRpei9TK1lISEQ3cXczTjFuWDJrNktabVpWSmNHZURCUktl?=
 =?utf-8?B?VDh3TzBqeFI3SW5SYmNjWFhpNW92Yk9nY1RZcURqcEVDZ1J3dlgwZHFTL0h5?=
 =?utf-8?B?YzdTdzFCWXFQTjB1VFJtZkZuZnJVOWFFQXJhRGVhRE9BelkyVGtySTlaNi9y?=
 =?utf-8?B?dlJ4MGJBRVVIREpna1FWcTZ2cGpHZ2ZuZlhQVVo0aC9LTUY3SjF3ZDBVNlI5?=
 =?utf-8?B?NlA5MHJReXFCTGRPMnkzVndRcjc2ZDZjcktwWnVSaGc3QmhkS3JCdSsxZ2tO?=
 =?utf-8?B?Qmcwb2owcU5leklJelQ1OUxjRHMwNHZ6RFdtV3dKM1MzbkhNdnRhcUJJQzZN?=
 =?utf-8?B?VEc5aFpkWi9DQTRCekRsVVZQcWFsZU5qWngxRzNnb0UvNEJINEp0VFNSQ1VD?=
 =?utf-8?B?SGNVaUJVS1VJeVpUeW9pVVRZL1lhRkVqbFZqbzc4WjFqZ245UUs3WjBxMnF4?=
 =?utf-8?B?ZS9jOGdLckk2cGlINkpSQ0ZVQnV5M2ZPNDd6N0Jpem5IaEYvenpBTElvVDVr?=
 =?utf-8?B?bnlKUG5kNUdZRVJjWlNpeUMwNEhML0JIWDJjUUFxZnAvSytxWkdBZnhPRVl2?=
 =?utf-8?B?aFgzRGlDQ2Zsak5uVW5JS2pzVitlUGZ1VzI1ZmJjTjd1eTN6RFBMMkdzOEJ5?=
 =?utf-8?B?UXlCWGxLMjBzNFpicmlyZEQ0RHZoQjIvWGgycHIxeHZDb0MrUkNJamd5MDh5?=
 =?utf-8?B?RmFFTGx3azVEK0YwbjdCdHY2TFRrVTVHWXd5MjkvOWxVM2VJSEp5T2RvUS9V?=
 =?utf-8?B?UGVMbkdzZjRoTUFHYmFEK1o0eHYyNnYzWFFLTVV2eDUvaWsxZWFlcXphRzNj?=
 =?utf-8?B?RitDVXNCTXd3cEpaY2o3Q3I3aThqZFJ2a20wd3hMT2FjYWFGQmsydTE0MTRr?=
 =?utf-8?B?YWdiaEhZYUtIaWNwdGF2Tlo5eWFBYlNzOE5xYVZQazd5dUxJNDMwL3RJZ2I3?=
 =?utf-8?B?cFJ6T0JHbWJ2aWV5MG1qUHVWUFY4R0paQzRvc0F5Q0EwMGhFdEs5d2ZmT2Ju?=
 =?utf-8?B?WUJhU1ZtUkR4MUdnQTBBaWRGQzlsdFptZnpxaFU5b3dxbXdvQzIwWUE0R0lL?=
 =?utf-8?B?RU13SXJMdTZZVWYzRXlSb1h5YWxaNGY5V1dldE5kdnFpUFhMVng2c0pPUDRI?=
 =?utf-8?B?Y1FTUHRjbXM1Z21UeDdxakVuQTI2bm5jdU9xZm5neVVxclVkRlA0enlhYkxk?=
 =?utf-8?B?ZDVjUHd1RURvcUowRjZWSDBRSytrb0krKzRzNTlDS1ZPS3RzWHA5ZGRaRDg5?=
 =?utf-8?B?S0lYZkNDM05mSFpEUVlxTWJpUHdrb2Y5dkZwbk54VmdkRjhBT0lZRVlERjMw?=
 =?utf-8?B?bVQ5YzUzNS9FcnVGN1FnR0RIajlvTkVld09Lb0k0WGtERWRsUUtocS9PMEds?=
 =?utf-8?B?SW1FZk82Q3dRWDRQUXF5RVl0eEY4VjloMWE5MVByY3U0WlV0OTVhZXloZS9M?=
 =?utf-8?B?WFMzMVgzcUFGL3pUajhHNVdhWWJBT3grU3JidVd0eC90dTZWa1hndkdTWVFy?=
 =?utf-8?B?M01va3ZlTE5MckpkVzU4aWtZeUhBMVNMR25yMW5kYlhaRmZXcUw2THhWSVlj?=
 =?utf-8?B?OGxMZ2NtSlg0M1FLZVVDblJERWRPcEZaa1RNRUdOWlZUVzlUWVF6eTJGMTVW?=
 =?utf-8?B?VUt2OE5aTnRMM3pjVUJ4Zk9MM0pIc0lDcC9kQ254ZmdGa0VZYWZOUHcwb2FH?=
 =?utf-8?B?OEdrRXljQlJGYS9NNmZzNFp2TjhWcXVtamJ3bzgxZFpQMi8rcU9IaFdQek1V?=
 =?utf-8?B?L3gyWHNSYmNzN0F1NXp5Qk9HRUpwbDRVeUJXNHdFYUlUQnVEaWdsQm1GMXNK?=
 =?utf-8?B?TEI0RTBuNkdzQUptc25aYlIzdDR3cGtSbUkvSEtRYUl3SUR3Wnl5dVBEYUY5?=
 =?utf-8?B?NXVHSWg1NWFCTFk5VGhIQ3VxTTJYdWFPN1RZTnNOR29pd2RUUEE3TFNqVTFL?=
 =?utf-8?B?UzhvMFBYWThiZnhQejZzZ2ZNL2pyTEMvT1prUVl5Z1I5bnErSk5PdE95elpH?=
 =?utf-8?B?QVppcE5ZRlN4ei9jb2V5VUIzeHNSOVZBUFJrSFhzN3VNRG8xT3BSRHY2OGNW?=
 =?utf-8?B?cTdvcndvL2kwcW1HRXkvVGFHOW9wWE54eUdoR1MrMVliWTFuRXJTV0VLMnY1?=
 =?utf-8?B?dzRrNytwQ0ZCZW81dm1QUzIyYkorNXJ3dkRCTmF2R1EwbnhKQlZpZHJ0QWhj?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f86a25-4f0b-4b40-efda-08de117b7bc8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 14:58:39.2633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyFu/wzyNmbju+G4DAEDVQI7iEsKNcdjnTuvGxFKHfdWh4BRpFdNJurC8QIAh/X1uzJ/MvBERTAFoWuukYkp1hiwxFgTSMLgxPcKRFV+mjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
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


On 10/22/2025 10:47, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>
> Add platform definition and PCI IDs for Crescent Island.
>
> Other platforms use INTEL_VGA_DEVICE since they have a
> PCI_BASE_CLASS_DISPLAY class.  This is not the case for CRI, so just
> match on devid, which should be sufficient.
>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Nitpick: Maybe include the Bspec(s) associated with it;

but other than that, LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pci.c            | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_platform_types.h |  1 +
>   include/drm/intel/pciids.h             |  4 ++++
>   3 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c3136141a9536..000bb30b97712 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -396,6 +396,20 @@ static const struct xe_device_desc nvls_desc = {
>   	.vm_max_level = 4,
>   };
>   
> +static const struct xe_device_desc cri_desc = {
> +	DGFX_FEATURES,
> +	PLATFORM(CRESCENTISLAND),
> +	.dma_mask_size = 52,
> +	.has_display = false,
> +	.has_flat_ccs = false,
> +	.has_mbx_power_limits = true,
> +	.has_sriov = true,
> +	.max_gt_per_tile = 2,
> +	.require_force_probe = true,
> +	.va_bits = 57,
> +	.vm_max_level = 4,
> +};
> +
>   #undef PLATFORM
>   __diag_pop();
>   
> @@ -425,6 +439,7 @@ static const struct pci_device_id pciidlist[] = {
>   	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>   	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>   	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
> +	INTEL_CRI_IDS(INTEL_PCI_DEVICE, &cri_desc),
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 78286285c2495..f516dbddfd882 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -25,6 +25,7 @@ enum xe_platform {
>   	XE_BATTLEMAGE,
>   	XE_PANTHERLAKE,
>   	XE_NOVALAKE_S,
> +	XE_CRESCENTISLAND,
>   };
>   
>   enum xe_subplatform {
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index 13c592e1a28c7..b258e79b437ac 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -896,4 +896,8 @@
>   	MACRO__(0xD744, ## __VA_ARGS__), \
>   	MACRO__(0xD745, ## __VA_ARGS__)
>   
> +/* CRI */
> +#define INTEL_CRI_IDS(MACRO__, ...) \
> +	MACRO__(0x674C, ## __VA_ARGS__)
> +
>   #endif /* __PCIIDS_H__ */
>
