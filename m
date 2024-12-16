Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB330E7717F
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 17:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9347F10E732;
	Mon, 16 Dec 2024 17:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCaQtWlw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D671810E732
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 17:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734371311; x=1765907311;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=l5Uv/3wWvsoTDG71+fuP6NyW7ax0lQixAvCFqo7njC4=;
 b=nCaQtWlwMsSpH0ksBYS0TR42Gtr/YOsfNX4cTYfGvytWPoNC4kBU9+ye
 KDPYjQ4cyMWOS4/wjkLETVK6ODkPA3WOYmy1cR6TSFpxrbBD6L3fEVdgB
 9YYToGdJDR2Sf2rsKCIxE97d67WcDd9C95rG6DpdWzQoyHlOrNX5oWd05
 lXQU0QI4ANRV1ohe2ygE80nqMf4pR+FRmxVKm+8CNUOkeZrIRA17CIxKr
 nu2SrSVY2616cpLjkkL4zJ5EU34YpG/HthLmLcOFBrZeD26n3zu/o3QuD
 4khV42XQ9YY60+RniVl0ywIe5UM/49d3jQ2n06Lj2FOBzbnOwiEoMdTIJ g==;
X-CSE-ConnectionGUID: v/JepRWqSUO8w6mgEHiJag==
X-CSE-MsgGUID: 54uHX/2sSme4Oy+KhYy+ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45253659"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45253659"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 09:48:30 -0800
X-CSE-ConnectionGUID: 6UgoYpWYS3aXp23JshIFEw==
X-CSE-MsgGUID: kWr5oJZkT/SQI7okcO6gqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134609087"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 09:48:31 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 09:48:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 09:48:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 09:48:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6uhqyUdzSoSm1XizkcfjawWC/hwHpAEDIVqWn5B/LjLT2Ah8OtT20POTBnr1ylcYqlQ5lUiXdzpumxxQCL7cWo08Tzp1YdErLN6XjpMDijk8UXR7HNDGnrGHUygPafOrwf/uBXQ9T1v4TDHgMl9CY84ScRtx4UqLKh18QyghObWdrSxhyzFUF5V7ZuCl/Jdd91Jta2sWtL69361q87pgtXptjAoothdY4ErKHa8ggLI7lEv0GuUwIJPXb6WlaPGE784RwRzV34vOQzCLTAvE3bejvd3yadhiumR2fjOPxBeDfq0fERNF/7UpAHSNf2YAgiZGdjpn9y2LN4WRTc5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ32OZGUbs0vF9aVrUuaFuR+xQrnFLdIIpGGL959NCA=;
 b=RtwoAZnmCqKQZuJuwWBOMembHwe5rajGPTXOh+tbWpoMWKmE3IZuCWZkf+6Cmurcq3RqFuv3Ud9Z5pFcibsEM8WOh/MH2uT7JPMHiSjWDr98ohnMitkoMoaC07PYVyECzbcItE14o/DWKVF0Y7YQwsXGDYKx45oUghw1ibGRCR3dfxvq7NRrv0y/HWr4NMI7P3cfG8aGsGLEJW4MLGg44txXAXlnm0qdiXjZWOS7NwdmtXVEqLL4vJx+mjd1BOwC29V6uTrWesRgmf+xcRkPkgfowq3qkS2rxKfKSq5hWf4hpsuOi8iz+KaTXmQm2lnBcWqmW26nczN/dJ67/p7ltw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 17:48:26 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 17:48:25 +0000
Date: Mon, 16 Dec 2024 12:48:21 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@intel.com>
Subject: Re: [PATCH 1/2] RFC drm/xe: Add functions and sysfs for boot
 survivability
Message-ID: <Z2Bn5af9FSHSIrfX@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-2-riana.tauro@intel.com>
 <Z1tqV9UpBeG_fITD@intel.com>
 <ccd408ab-ede9-43d5-bde0-0e8e989b332c@intel.com>
 <Z1ycWEYbI745oiBb@intel.com>
 <6efef814-f727-49ad-84ad-6701b7a97716@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6efef814-f727-49ad-84ad-6701b7a97716@intel.com>
X-ClientProxiedBy: MW4PR04CA0207.namprd04.prod.outlook.com
 (2603:10b6:303:86::32) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: a299b1b1-fc6d-482d-44cd-08dd1df9d74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjJOUXIvVmhPbnhXY3dxaHkxN3lTdXNnSTFLUlBtV2t1WTlCM0dQTVhYdDBv?=
 =?utf-8?B?Z290TzdFTnk3VXpzb0p2R0tpSVc2OXIydVNrZWtzVFJwTjZWMzZzOVBGSXBU?=
 =?utf-8?B?aVRBZ0Z3c214QXFRVGhkcEVwY2VmemJwVHNlakVJZk4zQk1BOXNPUXFsOVRo?=
 =?utf-8?B?Q0ZHaGtZWnVFVXJYNmx0aWpVbTd5TFp4QzB6VHVKUWlKZ0EyRE1Pa1E3UGpK?=
 =?utf-8?B?U1pXWEZDR1NTc3VQL2NwUFpUN2tnc3QwSzliVDBKQnVlQUM2eVN2a01nYk92?=
 =?utf-8?B?ODNiZzA1NDFEQnZoK2VSNGhFTDNPL0VqN3IwZmxEUFNLcTRuY2xsY0hHaFo4?=
 =?utf-8?B?aGZlNmxBZ3J4RnBPcmlZd3R5RHhCaWx5bXhZUFF6T0RNOVh5ZXRELzV2Wm44?=
 =?utf-8?B?VTArMzhXS0c2c0ttWGdoNnE3T0V1eFlBUHprdGluNmcrQTJCRDNhWmZ2Z0NR?=
 =?utf-8?B?TjVYZE9jam1CdkJKVHlmNFRRTXRWcjBiWEZZTWdjS0MydkxVWWJ0clRCa1lJ?=
 =?utf-8?B?eC84aUk2UGZlV042UzJ4cHArRGd5cDhtdjNrTnhrQjh4S2F4UWVsSFN2ZDdH?=
 =?utf-8?B?RXF3VHZMWU12a29jWlJ2L2IrV2drdzdFam9FeFV2SVZpcVFDM2Z4dGIyOUla?=
 =?utf-8?B?WVJ1Sm9tdHd6Z29TR1MvN09VVk94ekJYbkttcUJuK2JTeGNzYnhCNGoxUHFC?=
 =?utf-8?B?TmlOVEJQbkc2Tko3a0FNaS8xZ0hQaXRXTS9TVUZaUmYrK29YakttTERvTmps?=
 =?utf-8?B?MThlRWF1MmxUaFRaTkRKQ2h6NXFtMDJPa2c4a2VSR0RzSzVBelZkT084cG5v?=
 =?utf-8?B?QUl4SWVpRVpReWpVTTJoc29WK3I3L3pqYXg2ZEhBN2JmbVNKakgwbEpEK0NP?=
 =?utf-8?B?b2hXdi9oeWJUR3ltODZFMEtHUTBPa21pajlVMytOVHZaNTFpWXpXZEpXVlF2?=
 =?utf-8?B?STc3a1VIU3NNYzcrMCtUa2ZWakp2cUlLSWd5QVVwRlU1M3ZoQ20rTEcvMnY0?=
 =?utf-8?B?UGRLN0w5cjJTMnBXZVAxTFMvZkphaCswa3dVMVlJTGtSSGFHa0Y4YzlhRHVz?=
 =?utf-8?B?eHBjRHZBV2ZhdHZJWEpnV251dlhGdVdiUUxyTThTc3lBTmRZYSt5NXVHM3dE?=
 =?utf-8?B?Z1gxV3NGVU9oa1B4NXhqYUNsb2Y5cXV5bDV1NFh6ZklMa2pVUitXUjlzSGF2?=
 =?utf-8?B?TURSSC85d05BNy9xbnp5RkcwbzhxOW56M1BrYitoZkF6NzRjYlJrL1I2dkxt?=
 =?utf-8?B?Sno0M1AyRWdCM0U1UGh3T2U2NFZDVlZhVFh2NzZNR1hPa01WanVWMFQ2aVhI?=
 =?utf-8?B?S01qMG9tdzREWXRTc0hLVFludTN4K1NmbVkwM0lHOW1EZVVDSXZwNUNqYS8r?=
 =?utf-8?B?cm9pOVlMSittRHNOZ2lpMmcyOEVidlRycFdTdG1OUktiTTV5QzB6NVpqUkZK?=
 =?utf-8?B?TFVMbVNJTVp1SXlUb0VmYmV0em10OE5OenZZQnZYZDJBT21keG5hZEdkOHpu?=
 =?utf-8?B?Z0k2cU01Z1hKbTFrZHFPNGFGWnJ4N0xMOG9oQlhDVDRueU5CK3p6Z21wWnJ0?=
 =?utf-8?B?RnRFekpDMjg2U29MVzZERWxPQlZaend0bExMSEVzbVFwVEZ3K3NJZGwySzBn?=
 =?utf-8?B?dW82OE9ldENnVklYSDZ6RFJzVmlMbTUzRmM4NzNraHlkd1ZUR2U4dURjdWR6?=
 =?utf-8?B?RDBDZnNBbUh5QkpxN2VhUGxNVy9zSHNUb25NTWhhZ01RbklzWUppbjdkS0Vh?=
 =?utf-8?B?TE5YY3BrenIrSDZ4K0hha0FNY21zbW1ETm1zQmFhNEYzTm5pOHZMaU5XR0ox?=
 =?utf-8?B?eW85VEplVzd0OTdHY3NtUTFlRkd2a09PZzZieWNpWjdFdVJSMC9CRVNNZ0wx?=
 =?utf-8?Q?3UUVBvQmE0w/e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHZNUGEyRE53d1VkdWczRENTSHdOZ0x5NktVRm1jbEV1UVl0UldiR3dCOVpE?=
 =?utf-8?B?M1g2ZzVpbHlzTk03b1psdjVnOS8xUThOdjdRMWphSUdQbWFWeUdJeURrQUpR?=
 =?utf-8?B?NXc5MmNpRHlBcllab2VQeldHVnFxUENQMGF0c0wvd2xyVzdMYWM2OHQ1cUhH?=
 =?utf-8?B?cE9qVWQ4TDE3VUhSV0l2R242WWc0eGY5bTUvWG5NRVJNbHFUN0lhVStOUmhK?=
 =?utf-8?B?ZmM0MHdPWjNoLy8rZlZWNEZpQ1g1WklnaUlOSG85TFcyakltT0pPSkoyaU5P?=
 =?utf-8?B?TEUyWUNwaG9PZDduMzd5NC9icFRYYk8vSkwxblR2Zk9rMEpEaVU0czRTeVpN?=
 =?utf-8?B?UENMN3EyeHc2dGIzUkZHR1pnSVlUei95QU1IN3lRV2lEVmxzaWdrbE4zSzUw?=
 =?utf-8?B?ZU5id0k2MnJPdVBEOWcxbEVKZTlOQjlmSVR5UU54cndNa3NJQVFRM2tHZnRL?=
 =?utf-8?B?NVVYOERObmlodDJXRk5ZdDlUcWU0SWFieWdac21IWDhGeFpPa05oekpraUNr?=
 =?utf-8?B?bjI1M0ZIb2R5ZmE5UzB5UWhJMmdjaDkxVGk2a0crbndtcTJGdTRDRHBpRGZw?=
 =?utf-8?B?aEVNSWxQUW1zYkp0ODVrUVBtK2Jma2Z1QVRyZllWY1dDWG0xcFgwclI1MVM1?=
 =?utf-8?B?R0Q4MlU3Zm9rUkQvc0xWcVNDbFhIUEh0Qy8zdGRkcG1KelNIRkcwSDA5NUR2?=
 =?utf-8?B?cndibmt1UHVBTTlZUXRMU25CcVJQLzlmN3FUeDR0a3lhblF1Y3o1NVJJMlhp?=
 =?utf-8?B?RVk1NW1LTFZJSmIvd3dmSFBYSFl1OG1PQ1V1bUM5aWpZUUhkYUtDWmNaajJN?=
 =?utf-8?B?SUtPZU9yS25lTTV1V2xGVGM4Z2dVUysyenhvaDhIS1RVdmM4OWdJOEc0eHA4?=
 =?utf-8?B?Yzd6dlpEd1M1TmNVVmgrVkI3RXBYcXRtY2V5RG50c3NHL1JpRmd1UzFPdkU2?=
 =?utf-8?B?N0ZPd1BJRGZuTHlTaThTS2xDbTd5dGRKYlh6VVhRdlIrRVBlTlZjYkQ1VnlC?=
 =?utf-8?B?c25zOW4xaUJGeVIxUFBFMGVMUjZFT2lvSU9HTmd0VWRhR2VLekhHUzZTSEpT?=
 =?utf-8?B?Vi9DeEpVcHJEL0ZGT3RvVXo5cEQxS0xINW9RdlU5QzNYaExvb2hvSUE5aFRQ?=
 =?utf-8?B?WVgwQ1M1b2Z3a3IvTTFyaUZEeUMzS0VhWnpuZk51UklrZ2oxcDk1bWtWUnhl?=
 =?utf-8?B?TkhBcmFPd2x5TUdRUC9rZ0krMzJxK2FKTGQzVzZVOWhVR1dxbG9CV0NuU0ZJ?=
 =?utf-8?B?eUtCbmE3V3M2b1dqMFBSUHZpbWZyMTJRODQ0ZmI3RWxTcENxL1NSNDByeCtn?=
 =?utf-8?B?c1FsdVd1c3RSVHcvc09HdDJZd3BZekFmeDBwOGx1K0lBWWhDc3YybFBZVlZR?=
 =?utf-8?B?ZmU4SDB1dlFPeVNkY0t1bU8xOXgzS0YzRFZMUlhqT2h1UFN4SnR2SnJveHcr?=
 =?utf-8?B?a3NYSGxFa1BxdmxZdnUweWpySnY5c21CbWsxbXZjK1hyc2JHdWllcy9CU29z?=
 =?utf-8?B?TnRxWEpxOVJiWW41bjIvV0dIcWwrRTc0V0NPNlVVYzErVkIyalJrYnc0VEll?=
 =?utf-8?B?Q2pvdzN0Nk9qR04zMjhQNFpuOXJJdWIzY2tRUVJNejFVMm5ydExIclpiYTNJ?=
 =?utf-8?B?Y2NubGlRekx0Z3V3Z3BwaUJMLzE4Y284SFpXWjdqZzVYOHArQkNpR3pMQW5o?=
 =?utf-8?B?UFZsSGJhTXYyeVNyTDk5UHEzVG02aElDM2F1NkJRUVNzZmY1UnFRQlFRRndP?=
 =?utf-8?B?UDZQUUxwRk5rOWMwaVlEeERheWJHekxPZ01mREV3b0Vlb0tUbnozdTAvRUJX?=
 =?utf-8?B?MHNkZ09uVFJXYWNRRmJzTWRMT0VnN3BocFJwRmExcE9HZVl3RjQxdlJKbTFi?=
 =?utf-8?B?dFhwUnFMMXdWV2ZNeUxyUCtRd1h5b0hBYlRwcVJpdStYOUF5TTk2V091ZU81?=
 =?utf-8?B?VTZ5Z2EwK3N2N0krU0Yvcmk3QjJyaTF2VXI4QnczbVpWeVNHK0N2cUZZRUVO?=
 =?utf-8?B?NEtObjFuZnlUZXpQaTNCR1FYcTlJQWkrWUpXUUZJTUxpQU5HWkQrTG9hQ0xr?=
 =?utf-8?B?U2dSWDBIQnR1QU9NbkthQnZWdnFkeUlvSXowT2Fob0F2LzJnKzBQUlZ5QjJp?=
 =?utf-8?B?dmNDMzE1QkEvcnZ6QWtLZ2xEaTJKcDdxNG9WQ0hmYWZ1UGxLV2tWWG1sWERQ?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a299b1b1-fc6d-482d-44cd-08dd1df9d74e
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 17:48:25.4778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWTmrO8OwRe6br6zWtLXxe1H1FpdF5acmJVtcQI6VjwYALEha+mtXRH1PGNne4wiTBn32w8EYajR4Uu2xiwfpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
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

On Mon, Dec 16, 2024 at 01:33:14PM +0530, Riana Tauro wrote:
> 
> 
> On 12/14/2024 2:13 AM, Rodrigo Vivi wrote:
> > On Fri, Dec 13, 2024 at 01:34:23PM +0530, Riana Tauro wrote:
> > > Hi Rodrigo
> > > 
> > > Thank you for the review comments.
> > > 
> > > On 12/13/2024 4:27 AM, Rodrigo Vivi wrote:
> > > > On Thu, Dec 12, 2024 at 11:19:44AM +0530, Riana Tauro wrote:
> > > > > Boot Survivability is a software based workflow for recovering a system
> > > > > in a failed boot state. Here system recoverability is concerned with
> > > > > recovering the firmware responsible for boot.
> > > > > 
> > > > > This is implemented by loading the driver with bare minimum (no drm card)
> > > > > to allow the firmware to be flashed through mei/gsc and collect telemetry.
> > > > > The driver's probe flow is modified such that it enters survivability mode
> > > > > when pcode initialization is incomplete and boot status denotes a failure.
> > > > > In this mode, drm card is not exposed and PCI sysfs is used to indicate
> > > > > survivability mode and provide additional information required for debug
> > > > > 
> > > > > This patch adds initialization functions and exposes admin
> > > > > readable sysfs entries
> > > > > 
> > > > > The new sysfs will have the below layout
> > > > > 
> > > > > 	/sys/bus/.../bdf
> > > > > 		     ├── survivability_info
> > > > >                    ├── survivability_mode
> > > > 
> > > > Let's make only one file and get all the info inside the survivability_mode
> > > > one.
> > > Then any application using this will have to parse value?
> > > 
> > > Oh you meant, the presence of the file will indicate the mode and contents
> > > will give the required information. Okay will modify this
> > > > 
> > > > > 
> > > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/xe/Makefile                   |   1 +
> > > > >    drivers/gpu/drm/xe/xe_device_types.h          |   4 +
> > > > >    drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
> > > > >    drivers/gpu/drm/xe/xe_survivability_mode.c    | 225 ++++++++++++++++++
> > > > >    drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
> > > > >    .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
> > > > >    6 files changed, 296 insertions(+)
> > > > >    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > >    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
> > > > >    create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > > index 7730e0596299..dc60512a5c47 100644
> > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
> > > > >    	xe_sa.o \
> > > > >    	xe_sched_job.o \
> > > > >    	xe_step.o \
> > > > > +	xe_survivability_mode.o \
> > > > >    	xe_sync.o \
> > > > >    	xe_tile.o \
> > > > >    	xe_tile_sysfs.o \
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index 1373a222f5a5..79bd0bd94e9c 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -21,6 +21,7 @@
> > > > >    #include "xe_pt_types.h"
> > > > >    #include "xe_sriov_types.h"
> > > > >    #include "xe_step_types.h"
> > > > > +#include "xe_survivability_mode_types.h"
> > > > >    #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > >    #define TEST_VM_OPS_ERROR
> > > > > @@ -341,6 +342,9 @@ struct xe_device {
> > > > >    		u8 skip_pcode:1;
> > > > >    	} info;
> > > > > +	/** @survivability: survivability information for device */
> > > > > +	struct xe_survivability survivability;
> > > > > +
> > > > >    	/** @irq: device interrupt state */
> > > > >    	struct {
> > > > >    		/** @irq.lock: lock for processing irq's on this device */
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > > index f153ce96f69a..4e373b8199ca 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > > @@ -49,6 +49,20 @@
> > > > >    /* Domain IDs (param2) */
> > > > >    #define     PCODE_MBOX_DOMAIN_HBM		0x2
> > > > > +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
> > > > > +/* PCODE_SCRATCH0 */
> > > > > +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
> > > > > +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
> > > > > +#define   HISTORY_TRACKING		REG_BIT(11)
> > > > > +#define   OVERFLOW_SUPPORT		REG_BIT(10)
> > > > > +#define   AUXINFO_SUPPORT		REG_BIT(9)
> > > > > +#define   BOOT_STATUS			REG_GENMASK(3, 1)
> > > > > +#define      CRITICAL_FAILURE		4
> > > > > +#define      NON_CRITICAL_FAILURE	7
> > > > > +
> > > > > +/* Auxillary info bits */
> > > > > +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
> > > > > +
> > > > >    struct pcode_err_decode {
> > > > >    	int errno;
> > > > >    	const char *str;
> > > > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > new file mode 100644
> > > > > index 000000000000..7e36989efd68
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> > > > > @@ -0,0 +1,225 @@
> > > > > +// SPDX-License-Identifier: MIT
> > > > > +/*
> > > > > + * Copyright © 2024 Intel Corporation
> > > > > + */
> > > > > +
> > > > > +#include <drm/drm_managed.h>
> > > > 
> > > > this include moves together the linux group below,
> > > > on top of it...
> > > > 
> > > > > +
> > > > > +#include "xe_survivability_mode_types.h"
> > > > > +#include "xe_survivability_mode.h"
> > > > > +
> > > > > +#include <linux/kobject.h>
> > > > > +#include <linux/pci.h>
> > > > > +#include <linux/sysfs.h>
> > > > > +
> > > > > +#include "xe_device.h"
> > > > > +#include "xe_gt.h"
> > > > > +#include "xe_mmio.h"
> > > > > +#include "xe_pcode_api.h"
> > > > > +
> > > > > +#define MAX_SCRATCH_MMIO 8
> > > > > +
> > > > > +/**
> > > > > + * DOC: Xe Boot Survivability
> > > > > + *
> > > > > + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> > > > > + * Here system recoverability is concerned with recovering the firmware responsible for boot.
> > > > > + *
> > > > > + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> > > > > + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> > > > > + * such that it enters survivability mode when pcode initialization is incomplete and boot status
> > > > > + * denotes a failure. In this mode, drm card is not exposed and PCI sysfs is used to indicate the
> > > > > + * survivability mode and provide additional information required for debug
> > > > > + *
> > > > > + * Xe KMD exposes below admin-only readable sysfs in survivability mode
> > > > > + *
> > > > > + * device/survivability_mode: Indicates driver is in survivability mode
> > > > 
> > > > We need to make in a way that the presence of the file itself is the indication
> > > > of the survivability_mode.  No file, no survivability_mode. No survivability_mode, no file.
> > > > 
> > > > Which I believe your code is already doing this below...
> > > > 
> > > > > + * device/survivability_info: Provides additional information on why the driver entered
> > > > > + *			      survivability mode.
> > > > > + *
> > > > > + *			      Capability Information - Provides boot status
> > > > > + *			      Postcode Information   - Provides information about the failure
> > > > > + *			      Overflow Information   - Provides history of previous failures
> > > > > + *			      Auxillary Information  - Certain failures may have information in
> > > > > + *						       addition to postcode information
> > > > 
> > > > then this move into the single file...
> > > > 
> > > > > + *
> > > > > + * TODO: Notify mei about survivability mode
> > > > > + */
> > > > > +
> > > > > +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
> > > > > +				   int id, char *name)
> > > > > +{
> > > > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > > > +
> > > > > +	strscpy(info[id].name, name, sizeof(info[id].name));
> > > > > +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
> > > > > +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
> > > > > +
> > > > > +	drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
> > > > > +		 info[id].reg, info[id].value);
> > > > > +}
> > > > > +
> > > > > +static int fill_survivability_info(struct xe_device *xe)
> > > > > +{
> > > > > +	struct xe_survivability *survivability = &xe->survivability;
> > > > > +	struct xe_survivability_info *info = survivability->info;
> > > > > +	u32 capability_info;
> > > > > +	int id = 0;
> > > > > +
> > > > > +	drm_info(&xe->drm, "Survivability Mode Information\n");
> > > > 
> > > > no need for the drm_info here
> > > Added a prefix here to indicate the below information is related to
> > > Survivability
> > > 
> > > Otherwise it will only display as below in case of Critical failure.
> > > Critical failure currently doesn't enter into the survivability mode
> > > and will not have sysfs.
> > 
> > Indeed. for the critical error we print dmesg, do-not create the sysfs
> > and fail probe. Perhaps that deserves a separate function?
> > 
> The same is being done even now. The init function below returns after
> printing dmesg.
> 
> /* Only log debug information and exit if it is a critical failure */
> if (survivability->boot_status == CRITICAL_FAILURE)
> 	return;
> > > 
> > > 
> In the review comment you suggested to remove
> drm_info(&xe->drm, "Survivability Mode Information\n");
> Without this, in case of critical failure there won't be any indication that
> the below dmesg is related to survivability mode.

So, just print them all in a function for critical mode only.
The regular mode doesn't need dmesg, this information data
is already part of the sysfs file, no need to repeat.

> 
> Thanks
> Riana Tauro
> > > [ 4708.689214] xe <bdf>: [drm] Capability Info: <value>
> > > [ 4708.689221] xe <bdf>: [drm] Postcode Info: <value>
> > > [ 4708.689226] xe <bdf>: [drm] Overflow Info: <value>
> > > [ 4708.689230] xe <bdf>: [drm] Auxiliary Info 0: <value>
> > > 
> > > Will remove if not required or add the function name.
> > > 
> > > Thanks,
> > > Riana Tauro
> > > > 
> > > > > +	set_survivability_info(xe, info, id, "Capability Info");
> > > > > +	capability_info = info[id].value;
> > > > > +
> > > > > +	if (capability_info & HISTORY_TRACKING) {
> > > > > +		id++;
> > > > > +		set_survivability_info(xe, info, id, "Postcode Info");
> > > > > +
> > > > > +		if (capability_info & OVERFLOW_SUPPORT) {
> > > > > +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
> > > > > +			/* ID should be within MAX_SCRATCH_MMIO */
> > > > > +			if (id >= MAX_SCRATCH_MMIO)
> > > > > +				return -EINVAL;
> > > > > +			set_survivability_info(xe, info, id, "Overflow Info");
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	if (capability_info & AUXINFO_SUPPORT) {
> > > > > +		u32 aux_info;
> > > > > +		int index = 0;
> > > > > +		char name[NAME_MAX];
> > > > > +
> > > > > +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
> > > > > +		if (id >= MAX_SCRATCH_MMIO)
> > > > > +			return -EINVAL;
> > > > > +
> > > > > +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
> > > > > +		set_survivability_info(xe, info, id, name);
> > > > > +		aux_info = info[id].value;
> > > > > +
> > > > > +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
> > > > > +		       (id < MAX_SCRATCH_MMIO)) {
> > > > > +			index++;
> > > > > +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
> > > > > +			set_survivability_info(xe, info, id, name);
> > > > > +			aux_info = info[id].value;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	return 0;
> > > > > +}
> > > > > +
> > > > > +static ssize_t survivability_info_show(struct device *dev,
> > > > > +				       struct device_attribute *attr, char *buff)
> > > > > +{
> > > > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > > +	struct xe_survivability *survivability = &xe->survivability;
> > > > > +	struct xe_survivability_info *info = survivability->info;
> > > > > +	int index = 0, count = 0;
> > > > > +
> > > > > +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
> > > > > +		if (info[index].reg)
> > > > > +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
> > > > > +					       info[index].reg, info[index].value);
> > > > > +	}
> > > > > +
> > > > > +	return count;
> > > > > +}
> > > > > +
> > > > > +static DEVICE_ATTR_ADMIN_RO(survivability_info);
> > > > > +
> > > > > +static ssize_t survivability_mode_show(struct device *dev,
> > > > > +				       struct device_attribute *attr, char *buff)
> > > > > +{
> > > > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > > > +	struct xe_survivability *survivability = &xe->survivability;
> > > > > +
> > > > > +	return sysfs_emit(buff, "%d\n", survivability->mode);
> > > > > +}
> > > > > +
> > > > > +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
> > > > > +
> > > > > +static const struct attribute *survivability_attrs[] = {
> > > > > +	&dev_attr_survivability_mode.attr,
> > > > > +	&dev_attr_survivability_info.attr,
> > > > > +	NULL,
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * xe_survivability_mode_required- checks if survivability mode is required
> > > > > + * @xe: xe device instance
> > > > > + *
> > > > > + * This function reads the boot status of the capability register and
> > > > > + * checks if it is required to enter boot survivability mode.
> > > > > + *
> > > > > + * Return: true if survivability mode required, false otherwise
> > > > > + */
> > > > > +bool xe_survivability_mode_required(struct xe_device *xe)
> > > > > +{
> > > > > +	struct xe_survivability *survivability = &xe->survivability;
> > > > > +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> > > > > +	u32 data;
> > > > > +
> > > > > +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
> > > > > +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
> > > > > +
> > > > > +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
> > > > > +		survivability->boot_status == CRITICAL_FAILURE);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_survivability_mode_remove - remove survivability mode
> > > > > + * @xe: xe device instance
> > > > > + *
> > > > > + * clean up sysfs entries of survivability mode
> > > > > + */
> > > > > +void xe_survivability_mode_remove(struct xe_device *xe)
> > > > > +{
> > > > > +	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * xe_survivability_mode_init - Initialize the survivability mode
> > > > > + * @xe: xe device instance
> > > > > + *
> > > > > + * Initializes the sysfs and required actions to enter survivability mode
> > > > > + */
> > > > > +void xe_survivability_mode_init(struct xe_device *xe)
> > > > > +{
> > > > > +	struct xe_survivability *survivability = &xe->survivability;
> > > > > +	struct xe_survivability_info *info;
> > > > > +	struct device *dev = xe->drm.dev;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	survivability->size = MAX_SCRATCH_MMIO;
> > > > > +
> > > > > +	info = drmm_kcalloc(&xe->drm, survivability->size, sizeof(*info), GFP_KERNEL);
> > > > > +	if (!info) {
> > > > > +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	survivability->info = info;
> > > > > +
> > > > > +	ret = fill_survivability_info(xe);
> > > > > +	if (ret)
> > > > > +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
> > > > > +
> > > > > +	/* Only log debug information and exit if it is a critical failure */
> > > > > +	if (survivability->boot_status == CRITICAL_FAILURE)
> > > > > +		return;
> > > > > +
> > > > > +	/* set survivability mode */
> > > > > +	survivability->mode = true;
> > > > > +
> > > > > +	drm_info(&xe->drm, "In Survivability Mode\n");
> > > > 
> > > > this one is good!
> > > > 
> > > > > +
> > > > > +	ret = sysfs_create_files(&dev->kobj, survivability_attrs);
> > > > > +	if (ret) {
> > > > > +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
> > > > > +		return;
> > > > > +	}
> > > > > +
> > > > > +	/* TODO: Pass Survivability Mode notification to required child drivers */
> > > > > +}
> > > > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > > > > new file mode 100644
> > > > > index 000000000000..0d5c325322a2
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
> > > > > @@ -0,0 +1,17 @@
> > > > > +/* SPDX-License-Identifier: MIT */
> > > > > +/*
> > > > > + * Copyright © 2024 Intel Corporation
> > > > > + */
> > > > > +
> > > > > +#ifndef _XE_SURVIVABILITY_MODE_H_
> > > > > +#define _XE_SURVIVABILITY_MODE_H_
> > > > > +
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +struct xe_device;
> > > > > +
> > > > > +void xe_survivability_mode_init(struct xe_device *xe);
> > > > > +void xe_survivability_mode_remove(struct xe_device *xe);
> > > > > +bool xe_survivability_mode_required(struct xe_device *xe);
> > > > > +
> > > > > +#endif /* _XE_SURVIVABILITY_MODE_H_ */
> > > > > diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > > new file mode 100644
> > > > > index 000000000000..f9dbb6d80692
> > > > > --- /dev/null
> > > > > +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
> > > > > @@ -0,0 +1,35 @@
> > > > > +/* SPDX-License-Identifier: MIT */
> > > > > +/*
> > > > > + * Copyright © 2024 Intel Corporation
> > > > > + */
> > > > > +
> > > > > +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
> > > > > +#define _XE_SURVIVABILITY_MODE_TYPES_H_
> > > > > +
> > > > > +#include <linux/limits.h>
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +struct xe_survivability_info {
> > > > > +	char name[NAME_MAX];
> > > > > +	u32 reg;
> > > > > +	u32 value;
> > > > > +};
> > > > > +
> > > > > +/**
> > > > > + * struct xe_survivability: Contains survivability mode information
> > > > > + */
> > > > > +struct xe_survivability {
> > > > > +	/** @info: struct that holds survivability info from scratch registers */
> > > > > +	struct xe_survivability_info *info;
> > > > > +
> > > > > +	/** @size: number of scratch registers */
> > > > > +	u32 size;
> > > > > +
> > > > > +	/** @boot_status: indicates critical/non critical boot failure */
> > > > > +	u8 boot_status;
> > > > > +
> > > > > +	/** mode: boolean to indicate survivability mode */
> > > > > +	bool mode;
> > > > > +};
> > > > > +
> > > > > +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
> > > > > -- 
> > > > > 2.47.1
> > > > > 
> > > 
> 
