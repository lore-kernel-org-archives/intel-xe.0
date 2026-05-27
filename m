Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D437CD4F54
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 16:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEFB10E26B;
	Wed, 27 May 2026 16:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akZgLkJ7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903110E26B
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779899279; x=1811435279;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ok9cLa6NeuJFiMc72N5L5cMTNqFSSDapMtAGZ+idWAg=;
 b=akZgLkJ7rSEuHsXYCMgz3MOw6Q1sI9/Mk64I4ybLJSTBF0slbwj2jCYX
 TVuH4n2qEN+1qQZPLhvO3jEDTrxx2T5uyJUnEyDOmLQ5Qvl/lYN6/U6MC
 FLn9IPplx6wIwQKmQVYq0dY9GVusaGIKCM6Hr+DXyGDGyScz8gM9aphmU
 7roiyP6zKb+6hMV/eBh9F+EZSRFnw7hOlEmk6z2kRpDbHxdZC1zQBuW/D
 c2fDGMurkn8Zqem+Q1ogz6j3S4wulIrX+oo3+fEOdVBX0ZsDu+3c8Vsjb
 7HglMgZQoxbP72tglsqtkVOeFDyDFZlFTyuVxevh8t6wsalHqPwvcx6K1 w==;
X-CSE-ConnectionGUID: trTeBRWQTkOu6iI4/MDOCg==
X-CSE-MsgGUID: B0SEUqgUQky1oiGr8itHCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="106189259"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="106189259"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 09:27:59 -0700
X-CSE-ConnectionGUID: z+2jrU6iRgGWr6YagkEfHA==
X-CSE-MsgGUID: JVKhO9KgTimx7BtWI77E4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="244113364"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 09:27:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 09:27:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 09:27:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 09:27:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZY9rW6+5S+ToxaIk32ZpNOGNVPP0I8aE89yI17It65hjjTwhr2SxdqHsweUH2JyJEXcMvEiMqKvyiBGMijdxlDdoQnOCP6d0tNAenLh/E4UAnEeMM25Z31njH2N3aZOsrEtdOplv1kEn+dMhjKpdG15USEDvqzzJYrcMM3i7LWjgiMvbdH4yDZ9OCp4GJXoViT84rx1HiKv5zwlv6IWEq+F6E7ebUGpjViwtD71quiIqvPvQqarQrvgZ5IJVW/JajrKXuwhJ/rTFLK7n88FR3FDmNRKdBLhh3kQQsjkXPpudWAVdVLnS7g+NUG1QLkkqkC6nB9sfOn+Eo/2CelZF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXECMl9Tzz/PLTOzV38MxgGNZ7bGXhvk+Pj3rGO1MpU=;
 b=N0iqkBts6wYvegdZ/c+eAXRgqdpISMCDwPB3jOBMHwO3em2BA5U2J0EWc031wTL1d2FlFHCqdgXN5lv8LotkYMbxsaQd9Krxf2HqgBStlOh+EkKxUllhPyuP2s2ewjVE7FNLmRPz5H207vghVIe7H0ckbOkf6oURNSpSnCBCFDThckCP48CabK2T2PrOFvLjKLlOSVu2YzNGB/vAjCli8SrGal1vJyW8svx7Gl2e7B7ts6mtmsIiTMm8zeXJRPsvlXtqkZikG6bbzLokhx6FGKZUh/3/ln9TW0ziGeEaQ8hPkMtJealI6rYvJdT8TJZ6NNcVoas8brU4L5oCNepVRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 16:27:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 16:27:46 +0000
Message-ID: <779913a5-7356-4fd6-a197-829cfb6bdf1e@intel.com>
Date: Wed, 27 May 2026 18:27:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Move xe_uc_fw_abi.h to abi/
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260527112608.22448-1-michal.wajdeczko@intel.com>
 <ahcOcsiSvCL2bAoS@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ahcOcsiSvCL2bAoS@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF0000015A.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::879) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8ad6a4-9e8f-4866-c757-08debc0ce29d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 09agM1nJ6Cb3K/CIJeb5amgwJgo6OXGbPtnhtI/BcqG5OxDp65sei0IEZa9VIxOBRdlf0/KbgfY1rdMaRdho1m54ymGHFEt050B8W/XgwjxlYz9zKEs1KH+JfucClJkF0wr4KGSAugmC+cSSLkwcHgRkozKlNyE0efcChgUQvRU5HKs5umXzO+QSn1K4W7tE2iYcPVH1lJgIygZPDDiNLhMMtW97CrwxKzUxdEUDBmXoqN1SKzDIDLHstcGyRaCTtfQaieiy8gZREQwnwSkfCXAX9tPxjfzgUxpyjHYngR0111FTtOxoXB2aElz4IuNSN7eR5SZfbkRy/bHL7QoOYL0wUF3zob9m+wBfcx8dni8CugAHjo8PhD9BFRU/03tdEgKW295xpZzeb63zvre9DYzHIxbjItDl90e+YWYUVgH7mP6M0w3CFOk7GOMbgWQbkt1pEP2gbLAzoogwqMOBrvC54n+STpm54PJzb87z3yMOXFJNSa0ibHGJrbXpMxKsL220GKaYeP6Z4EepCGtyQB0kgC/igzJV8kW1wQRX7i8FkaGUy3g1dlh2NGmwrmKWNjt+lOnUBMwFda9a1Aa39k9fFMbFLxH778ofSN9Hbhgjtye4FH6XODmSOX+Kxfj5X4CTuPB9PNk9qTE+VxizqtMHLhb32M7/Vkod0I8aVVhKvYJWr51zbrhzPbafNHvC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTQ0YnYwYkVuMkc0YlZMdmZ4MWJMdFFsRjJ4NHhHMnlhc3NORW1XV0hVWXJy?=
 =?utf-8?B?amZxMkxDaGF5ZEZZandUNEk4SVJWSTZ2WDNWU0lmVEVzZVBmZ2YrU1BuUWI2?=
 =?utf-8?B?eDV0cy9LUFRoclRia2R3aGdRakRiZ2R4QnhYUlRndlRubC9oQWJRb0QzVWVH?=
 =?utf-8?B?ZG1keTFsTjJCcldNZThHYW9yY3FIWFh6c1lUTU5wNXlqa0xPbHJ2OXN1S0tW?=
 =?utf-8?B?SEpXelQrTzErbVE3a3ptTE1HSnBvZ1BFdk5jaW81RjJQTUh2Z284TEJOVnV5?=
 =?utf-8?B?K1hneVQ4L1hiMlAzSjk4bHJ3eXdmcGJBYXJCY2hQc3FvRXFFKzV5UFJhM2Vh?=
 =?utf-8?B?d05CNlBsVk5NeTM1T3ZPeGVKMmp6bjIwcTlvK0c2MDdEd0x3RXJXZWJ6YTBU?=
 =?utf-8?B?SllIUUhIRkxmTXZjWFFqK04vVk5UampQQm9UTlg5T1ZCRUI2NkV1ZTJtZHU2?=
 =?utf-8?B?YWxOWTVydlkvbFRIVnlaOFBDVUY0cHFyZG96TkdYVzhCUzAydFFrcFQwM0dX?=
 =?utf-8?B?V1p0YTNlRndzY2U4QzQ2WTN2MTRSRUMwUXRpVWx3RThOMVZMcWhSVi9xZDBy?=
 =?utf-8?B?aCtzWGUvdlpOS01ub3lTYU1PZElhQ3JFK2YzMlZEbG5RSGRvQ2pkV1pzWjVh?=
 =?utf-8?B?Z1JYbXBVdlZZS0RPMDNoUFBqSjlQYkhYK1JWaGZZejc4eExxd3VveWpGL3Ax?=
 =?utf-8?B?TnVlNmdMMThmcTVkeUhIRzNwV3pta1M5YVh5Zm5CcEpWaFNHNlNqb0V5NVFL?=
 =?utf-8?B?ZU43cnRRdnVlTkJHdGVqVUpmUzBSbGVWY2RHSTJrYkUwa1ZSdkRBQ1VjS3Bh?=
 =?utf-8?B?RmNwYUk3di96ckxENHM5WFZiY1htTTB5ZkcvRmlZWnh4SVBPOEtzeGkzNVJo?=
 =?utf-8?B?bHUvZFMxa3dNVkR1c2NVN2QzY0Y0a0pLMEFHRjFRZEFxWXZ2SmZiR2Flek90?=
 =?utf-8?B?cUpLTXVDR3RyYnZ2OTRENWxIZ0I2UnZOb3N6RXJiME9XSHdFeHh4WGRQMzhF?=
 =?utf-8?B?a0w4Z1ovUklSRWtlK3FJUS9BRm11WmlQU3hOZGdMY2ozN2t0MzdUTDZzcjVx?=
 =?utf-8?B?TzlJeFQ0R05Yd3JtQzBseHJIbGVqWUhlci95VjJ0NjA0MzZJbk91R2dSZGZP?=
 =?utf-8?B?dnhsSmhEN0srRFFwVnREMW5ZYzVwYmFVekFnQk9OWTVGTTdpRzhBenRhMHNV?=
 =?utf-8?B?NjJTQjdvRUZPR3RCaGFPQzdKWDhzK21rSktoWjQvQ2w0TEZmZWprODRCOEcv?=
 =?utf-8?B?Rk9EeDFya3Irblc5WkpiWVJMRS8yYW00eXlab2FKNHd6VEMzS1hKOEFLQW5Z?=
 =?utf-8?B?QzlONldqL1h6ZmFQQko3SzVwZU9jTDRpUnBBQjFzdlpOUFZ1V0EwOVRvWjM0?=
 =?utf-8?B?d2VLQzQxcVA0MWVBNGhMQTBlVXcvbGRBcmZ5VkcyaWlISHRvVjNIclRiSC93?=
 =?utf-8?B?UjJRV0Nzc1VGNTlETXhJaWNtZjhXQWZBU3BHdkpndEtRdml5L0JyZWVwamg1?=
 =?utf-8?B?Yk9hS1RXMWREclpiRm1qbHkwdHZpQXNyRjlQOExyOEZyN0s1dzdvY0tNNWZH?=
 =?utf-8?B?c0dBQkdieXhWOThncjk1bFRDa2pxT2FuRkZYUDU4M3lvSmNFRFRmZno5L0Rz?=
 =?utf-8?B?Yk1DaWdqOUMrcGRQUmROd1o2dTV4eTBMS2MzaG1zOVlIeXIrK0xUUDA3M1N5?=
 =?utf-8?B?SXRVaGc5bHA1b0ltOGpGS1g3bHA3eUU5TzVFc252Vk0rTEs3dkhFK0QzTmR2?=
 =?utf-8?B?RkF3azVVNTdJblhlYTdjODluSlMvZEVrODFxQmxaZ2FkYXlxTGs1Q3plc1ND?=
 =?utf-8?B?WnZNcnFIV0pKQ0VzWWpQeEdxMjVyUEMxOHlQZUxxMmZ2TUtNa1VUa25XNy9J?=
 =?utf-8?B?b3ZWYWNsdUVwczNONXc3TFR5TVlwdEdodFRHV3k0M0VjcG5pRGNYcDh2bkp5?=
 =?utf-8?B?bDFjVlJkenFTdTZva0FzdTlCODdQSWZuTjAwN2syZ3NhejBWYkZ4MVZTdjdY?=
 =?utf-8?B?NHJWa3NXYVFUSjlFamFueCs0UVRaemN3UjN6UERtWVA0SEk2MFFnclBqWFJ5?=
 =?utf-8?B?bXVhUnMwTndWUWZlNHNLdFVCbGFHK2NndzVTZzg0MjlFYVo3UUU5RUZ1UXBH?=
 =?utf-8?B?bElsVHgrWFFyekhHSzZZdkNrRzliNkRiWkM1bGlqUjVtK0pucE1ZUTFuNW1N?=
 =?utf-8?B?ejZLQktQYytjNkl5M0h0d2o4cWlYUmcyYnBxV01PYnZsQWVhUHFZSm8rSVU0?=
 =?utf-8?B?Z2dlVXdDNmtvcU5pdXVHNGFiaTRHc1kyeVpGa0NlcmoxbUphT3dtb2tNQ1Jv?=
 =?utf-8?B?OGJpRXNCRHFrS2YwcDdhcnZZN1NYeVBaZENXM2tHYnNMSzBzNDdEdzhhV3Vu?=
 =?utf-8?Q?ueuahnCLRtvaYdjI=3D?=
X-Exchange-RoutingPolicyChecked: Sh3tS3p9+fZDSrK1d6h4tBtSKROqp+OihzsRvo47y0UE7GsydS0/OHWgg1HdeER5sehni3hRylHUF70FDEtUzoJuRcQ9xTnrbDN2BusDc8E+x4sRCPoNSQMsImUYoP6CC1WHMKVZ6QBbup/ip2hQ56cN7sR30LInzfPExxR5lDMhHDWn8dSPvjPDG6aQH8Q9dv4wcFRvJehJgvjd6h17MyPDRfWdjwy64qXWcF0gMyxtMzGSZzT2pZGX6Ide6zUEp6vqWDuI0B1UPXSJ9Wq3LaCZGYh2JqriRSxTlancT0dpt/wrhnvXjLq+aggzRivlANcDTCkg/oIWooCMujZUfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8ad6a4-9e8f-4866-c757-08debc0ce29d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 16:27:46.4029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcrdeVrzEeDVQTKgy9KEYFas2rDo3FMnCP/WDGZx/tZiUSpwKroq/kBZONuWFeir91ccCeSQgPRu0nlGkA/47+sofjR7t+ygJPEd/rIP200=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
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



On 5/27/2026 5:32 PM, Rodrigo Vivi wrote:
> On Wed, May 27, 2026 at 01:26:07PM +0200, Michal Wajdeczko wrote:
>> We aim to keep all pure ABI headers in the abi/ folder, but
>> somehow we missed this file.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> v2: fix documentation link (Sashiko)
>> ---
>>  Documentation/gpu/xe/xe_firmware.rst                   | 4 ++--
>>  drivers/gpu/drm/xe/{xe_uc_fw_abi.h => abi/uc_fw_abi.h} | 4 ++--
>>  drivers/gpu/drm/xe/xe_late_bind_fw_types.h             | 3 ++-
>>  drivers/gpu/drm/xe/xe_uc_fw.h                          | 2 +-
>>  4 files changed, 7 insertions(+), 6 deletions(-)
>>  rename drivers/gpu/drm/xe/{xe_uc_fw_abi.h => abi/uc_fw_abi.h} (99%)
>>
>> diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
>> index 9c15a300bc62..d3030d1c9a84 100644
>> --- a/Documentation/gpu/xe/xe_firmware.rst
>> +++ b/Documentation/gpu/xe/xe_firmware.rst
>> @@ -7,10 +7,10 @@ Firmware
>>  Firmware Layout
>>  ===============
>>  
>> -.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/uc_fw_abi.h
>>     :doc: CSS-based Firmware Layout
>>  
>> -.. kernel-doc:: drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/uc_fw_abi.h
>>     :doc: GSC-based Firmware Layout
>>  
>>  Write Once Protected Content Memory (WOPCM) Layout
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
>> similarity index 99%
>> rename from drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> rename to drivers/gpu/drm/xe/abi/uc_fw_abi.h
>> index 74b888904fdc..198e949660e0 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/uc_fw_abi.h
>> @@ -3,8 +3,8 @@
>>   * Copyright © 2022 Intel Corporation
>>   */
>>  
>> -#ifndef _XE_UC_FW_ABI_H_
>> -#define _XE_UC_FW_ABI_H_
>> +#ifndef _ABI_UC_FW_ABI_H
>> +#define _ABI_UC_FW_ABI_H
> 
> I was going to complain about the duplicated 'ABI',
> but I noticed that we already do this everywhere :/

include guard names in abi/ are following the most common pattern

	_FOLDER_FILE_H

as used elsewhere, see:

./net/ipcomp.h:2:#ifndef _NET_IPCOMP_H
./scsi/scsi.h:6:#ifndef _SCSI_SCSI_H
./keys/ceph-type.h:2:#ifndef _KEYS_CEPH_TYPE_H
./crypto/blake2s.h:6:#ifndef _CRYPTO_BLAKE2S_H
./acpi/reboot.h:2:#ifndef __ACPI_REBOOT_H
./kunit/test.h:9:#ifndef _KUNIT_TEST_H
...

> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

thanks!

> 
>>  
>>  #include <linux/build_bug.h>
>>  #include <linux/types.h>
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> index 7fdb24e810b3..ee5efe60774e 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -10,7 +10,8 @@
>>  #include <linux/mutex.h>
>>  #include <linux/types.h>
>>  #include <linux/workqueue.h>
>> -#include "xe_uc_fw_abi.h"
>> +
>> +#include "abi/uc_fw_abi.h"
>>  
>>  #define XE_LB_MAX_PAYLOAD_SIZE SZ_4K
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
>> index bb281b72a677..f2d3a3e7208b 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
>> @@ -8,8 +8,8 @@
>>  
>>  #include <linux/errno.h>
>>  
>> +#include "abi/uc_fw_abi.h"
>>  #include "xe_macros.h"
>> -#include "xe_uc_fw_abi.h"
>>  #include "xe_uc_fw_types.h"
>>  
>>  struct drm_printer;
>> -- 
>> 2.47.1
>>

