Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC79C2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 21:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3004F10E32A;
	Fri,  7 Aug 2026 21:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TGu6BAhq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AC210E32A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 21:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786136512; x=1817672512;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rDUO4mJ+9ORbqgHjO0TJLG/ypX3O2RKBglcL6IS3LAk=;
 b=TGu6BAhqH9keki6xRSrcnsPDOxial3ilhVoKB8CkW+KxiwLNNtorPonJ
 XmGPcCRQ0xpG+sHcYw91I8E/hjUY/7cGnq29dfA/cwQICj6UULn5FcWLm
 hglJ22899k8SOkYnXdA6YvVBMsiVxvQ/5EUJ3rJNL8N50d6ShwtCrKK0x
 7EBiHHXOe+Ym5kTwyblIP4OxSnNsszuVd5/eV7TmTZT18+DtV2C9yR0by
 GgCUZQfuIOrH99HRteJrl+Jw+5Y8NNYfQatFtV2ni0PhdMJMYETo8Bv/V
 uJklytGJlW/H8nZbCzB8aqkCwru2qQ7hUsKjCO0VRC45tA0QUnZcGwvvG A==;
X-CSE-ConnectionGUID: mzCV2DiDRzqez1Pre7XiAg==
X-CSE-MsgGUID: C9H/XgJFTe2Es36Zvg6bBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86778642"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86778642"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 14:01:52 -0700
X-CSE-ConnectionGUID: rgCI0oPPQJSJxAfB2cKa7w==
X-CSE-MsgGUID: aL6okzcwRD61xBYsZB98OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="261207284"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 14:01:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 14:01:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 14:01:51 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 14:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekq/+WwiLvJcdPIS38ADaQ3DAg1ifYjX7386CC625Q40qUizS0PvCkmXVW3/r9bEgdJHavh9yzSvEC7IxrnTUO8bPz/Xiz66DJd0efssIAC37AfCo5e7S0GOAq6h/6MVxHqSXDxpmWnWixEJF8ARL3uuiEJvhBJoZ8Smi/6H3c5ej4OVSuX26v4pNHuf6lC/72IUwQ2sJ7V08RbfWFa/W3L6Ts6rsqK2bCOmgrlAXW8Q4u++S7fzIg9CnueSPRsbrU+rdWHmxlFP3PcvQMabUiC50t1jUPZDA886Ww0JZgM7uZhRfmehvnc7vxfnye/MrC4SI6Q9pfOsBfMK21MT7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJkMUb32Mpt/T5c6+CpAztnLYjgbYZNHueCFrp2qBiM=;
 b=eOVYzQHGZpsfxyhxRc1hFX1I8vsP8HKpniRmkRHrlFoXzA+PwUbVaqK+k3atVrQbgalJW4J7zWP8UlbTnp7GdnOIVvjtNnzNy5w1GXN/hvLlgBYyR+yQmsshLMZxUC+6CLAfXH6tiDUm7vJPi2SW+b0V4d8QlrbsiAfdr0R5GLHM9jCS0+57Lp5By4e+fac2s05/j+j0Jj2nhcBXkxssH5X6GfWQ+TUtwIZKwbavXI7aOEzRsW6weNUNajuzgXWwbYFynY/aiGbg18/HDqQnz6wpio1LXV6GIPFHF85KqhPDGeAuYN0+G4vWt5y1ygT1yQV5FKEiQfPE4mWUNLAzOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB6221.namprd11.prod.outlook.com (2603:10b6:8:9a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 21:01:47 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 21:01:47 +0000
Date: Fri, 7 Aug 2026 14:01:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v6 2/2] drm/xe/sysctrl: Add helper to check oCode
 firmware readiness
Message-ID: <anZHuDQSMjvblJVV@soc-5CG1426VCC.clients.intel.com>
References: <20260806120930.2072613-4-anoop.c.vijay@intel.com>
 <20260806120930.2072613-6-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806120930.2072613-6-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR13CA0219.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB6221:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe8a49a-5c80-420c-53b5-08def4c71828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 1nJKfYp+AvSzcp9UanJqNdMjoBOO2IT9UWiidfod5Pe1ZXB4cGFbBrYJqfLxnW0bFnx8dsMDa40JYZrX3UbDNd5aE38ydpcqDJ2tHT7wFWUNmpeYL9Z7Viw9AGkFou0idCy79+mcGm42mlUBQQGBi6LzOlBS5BM7g/PH3i0VOh72y89ENxGluCw2UXkTTCC3Dnm3acijcFlRKGd4yQvp+wJRzQlczkzXUKzbFJGj1j2HrH8GzgjrI6erT8AmxPZjfMUR9L5Ul2HI9sjYVJ7HZr8Pj6RH+9pP+Tn9UHd2WULgKatBlfz6bUMaFRj2WjgbY6iYrwgyzZV24ucNF+wmhjqAGmVsY5z8sJqjO0kIJ8fWO7HllnsFoFZ7GfqaNRol+a7txQRmJPfdB2gzvZicIuevIZIxGPYyAZnmilW5K2IXiWLv71DpZWg6vtyzG62tpq1YtoDKXbY/RLOw4WT7Hd5L2UBU3MlPaTfGJY3Hd0GCfz3OOklccOohUIPiV08UVYlYJ6g5V8Ni7ty79zxTItUZGxqrbXJy6nZnRF5vJogJNJHEhMIyku64fvwLtdYdEK0GdHygzWqWj3xGnFqSVVGBuq8vrKsNmzLASyXUVCQOgNEz9/d0l2t43hB7B5Yvt27aLPvDkYCgVLSAADoU0OKgLiJJJt2kvvSRpaGg7I4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXB5cElqYm45ZElxYUJSU3hIWTU1c0J2aTJCK3pKT1hDTGNWT3h1c1dGMk90?=
 =?utf-8?B?ZzE2K1k0MWJMMzZPeXYwTVNGVEplU0o5aXVGcmZwRC9Kb29OQ1cyZXZpOHhM?=
 =?utf-8?B?Y21HT1c2NGU3S2RLM0JhMFNvV1ltdkVmT0QyMkVQcFNINjRGaWc2UC9iK2xH?=
 =?utf-8?B?ekozanphY09yc2prcGx4QUVvMmUxZlJhSWxvYm1vYkkrSkc5Z2NiN25vK05K?=
 =?utf-8?B?bFhSVVIzSkpPOWF3a1BSdnlFamtZTGlDUThxNXFMME56VzBhVS9rblhFU2l2?=
 =?utf-8?B?VmtQREJIaWhJUVJYcHhmSlJIVVpaMmNlU1NaR1dPRDh2RUpzemFZWm5HYlU1?=
 =?utf-8?B?UnB0Y0ZVOUNpVCtaM09zcU5KSVZ0TnFDUSsyM2d4eStiaXJIdzI1dTh4dTZP?=
 =?utf-8?B?MXlVVWJvZjN5dTVmQ0htdStJOVBuT0ZUaXhGK3JudTlCejlHNnBxTnpNZzhq?=
 =?utf-8?B?UGVmM3NReTB0TGY5SXN3RWdMR25oUkxNUTI1T1RheWdNalJ0TUFiRnJ5OE5J?=
 =?utf-8?B?ZEFpb1picnhsZjg5RnpMYjl1OVZXb2d1QWh4VjRwVDF6Tk5hZkxadlJ5T2Ji?=
 =?utf-8?B?V0ZQeUVxVHNBaWkrRDBadlYvdndhOVVnQ3hkZWNVUTFiNjVQcE5SWnIwejgw?=
 =?utf-8?B?NDRtTm40QlFQZjB0UDdZdEF4SXBlWWV4TUsreFB4WnRiVm5vVEU2S01yVzh3?=
 =?utf-8?B?aFBYRDBPVldBZWRPaUZVTTBENUFzaS96YmNqY3FWR3I2MkhpaC9JdHE0L20z?=
 =?utf-8?B?YnlMSWNOb1ViMGVST0plWmZsL0RmZDZZVGpJNVdvVk9qTURicjMxSjNvWkRG?=
 =?utf-8?B?L25VRGlKTDgvSlVCQXc4WmRPb08rRGNzQzVrR3lEc0ZUVXB5RUtSWTNYT1cz?=
 =?utf-8?B?R3hvVTM0TGdHU2RjUG5aNDBZR25nTTVqRTdOUDEwL3F5c2tSNlN0TjBZWVdI?=
 =?utf-8?B?YitWR243K1dIbWtkWUN2Y0lSbmZWUFk5VFIrTG5jajZGM3JKdlRlcEhTVi8r?=
 =?utf-8?B?QUsyQ09ELzA2aW1UenBhTytvdm9KZUI1OGhCU1EzSGZ1UWF3MFo3V1RGR2hq?=
 =?utf-8?B?VUlVQm1HeWxuV0VodldpdVhhL2txM1B6ejdXNXJ4UlRPS2VtTUEvL1c1MC9u?=
 =?utf-8?B?MysrajdlNS9RUmFjem16bzVoc1BaUS9qT1dKQjY1VHIzVXZqSHdKWjdWeEJ1?=
 =?utf-8?B?elpSOXZhakNNYktVeTVJU0RBM1h3aGc4KzZzVnBXa3NCM3VKSTE1VUF5RGZz?=
 =?utf-8?B?TDFnZ0EyRzk2R0NxMjdBUVRjOGxMQWxUS1pXTlFvYUxIbmtqQTV2bjFWS0FV?=
 =?utf-8?B?RFZnN1lyaUd3Rko5YkNuVVNPMHNQUVhhT1Q1b2tWSlNTU3JBTVhsdUdhODB0?=
 =?utf-8?B?MWVjQVlKQm9URERhN1lzeHlPN2N2UGFkYW1vMDJ2TkNrSVZhZzZmOC96QjBv?=
 =?utf-8?B?blI1cmVHWlVCemgwWmE2eE1SUzhjZHVSNDRveXFKZjJ6S0ltaVVDTEdSYXJi?=
 =?utf-8?B?bVI1b1ZBczJ6bmNtcHZ2ZFl3eTM1Vmw3N0xQV0lRTEJJUnQzcWJDNzNMbGdK?=
 =?utf-8?B?bFNxVnhUaEJLUC9mbGlrUFpEZHJZa200dGNHdHpoTURpU21MOE9NSmdpSHlS?=
 =?utf-8?B?WFZiVGJVemNGQ21adGN6OUNmcEVPSHVNdHpIbW9JV0NrVWo0RUxpOXlEU2k4?=
 =?utf-8?B?YTNwMVAzVXJLazBlc3MvTm80bFlqb0lGenVSb1VlUkxTSjh6Y0FGUDZHUEQ1?=
 =?utf-8?B?b0xPYTRKcUVUL0dHTklZRkJRTXcwRUNJYWwzVUw3dkpMWWlnWnJ3NjI1WTZL?=
 =?utf-8?B?YnZ6TmwrMXR5ZzFmYmxhS2ovd1ZsYVZ4RnJITkRLVVFhVkJUM1BZRG5uZnp5?=
 =?utf-8?B?SzF4SXoydWg4NGwvZ1N4VFh1b2tEc0ZLR1FaQTNCZWZwWHV6WW9ONVhOSHNZ?=
 =?utf-8?B?aGhxNkQ0aGs0bVd3Vlg0VXRxa1doZXpOTDNPcTVacjdhVHBudTZ0U0tsRTlL?=
 =?utf-8?B?L2JPMjY1Z21LVkR5cFF6dXhOMVhkRlY1WUl1NEkwcUlCSnlnNlhwSUZGOGFU?=
 =?utf-8?B?SENlYmdoREdDOURkMmJxYkJiaXVvZU9uWlVGWmd1SVM3cjRXYkszM2Q2bzZz?=
 =?utf-8?B?WW41UXZjOWpvak9wMkxNN0pmenM4Nk1KaUNseWVJTWR6T1lCamxNQk14N2ZV?=
 =?utf-8?B?aGFvdVo2TURFWUlWSGJoOUI2ZXM5cG5hVEJqSURzRDBPQW4rOEMwa1BuWEhF?=
 =?utf-8?B?cENzK1RHV1phRHU4NVdhWUZQOFBDcmh1M09vLzQ5MVViTWZpNkttenNPbFRP?=
 =?utf-8?B?YWJ6OElvbGdpQXduOFlJUEJ1aFQ5TVpSb1ZCRFJCNWhNZGxTdTV5U0pxR2ZO?=
 =?utf-8?Q?dA4gahoZGmmKeFQM=3D?=
X-Exchange-RoutingPolicyChecked: ggyFyJKCkDKGk52QjpnCwq/sUfONRQt5l+/uHzpkzpqQ5fNWo3dZSSTRY7OqVUoLiFDa3ktQe/Bq95Ra2+bWKWBL92HJJuMtgYtIEFycCYRW5tqcVFKxh72Wqr1ezDasqGtNuxL/31q9wXW263TdUfUCbr2bVckDx79SaY52tmRrhqgaMWz9gxrtffIIjE7jMaH0Np9ddSw7mEXyMg3FNJ7W7dEKEGSrs53MAP8CwqCPDl1IIXNt/bCKoU/nrMx9W65Mp90kRbbztxFW+3O6QSgfWMwi4r+CgyNqDzzefHlJaFIJhKJc6KQ5VgLwsxL6vR8UhCk8JvBmG6sNAfsdug==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe8a49a-5c80-420c-53b5-08def4c71828
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 21:01:47.6938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmNdofDuK1I1RKwd/90WxKHjhY+a3BDaOBxCo5Kjmmx5oBGspZ6ntciVPgYG69ULkJX5AieaaWUfL9ieoGyiFtBcol7aBrZFTpnWwcLAaP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6221
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

On Thu, Aug 06, 2026 at 05:09:32AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add xe_sysctrl_is_oobmsm_fw_ready(), a convenience wrapper around
>xe_sysctrl_check_app_status() to check oCode application readiness.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v6:
>- New patch — split oCode application readiness helper out of the
>  original patch into its own commit
>---
> drivers/gpu/drm/xe/xe_sysctrl.c               | 19 +++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 ++
> 3 files changed, 22 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 35b8b8b85a48..8eac58647265 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -175,6 +175,25 @@ xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id app_id)
> 	return XE_SYSCTRL_FIRMWARE_APP_INITIALIZED;
> }
>
>+/**
>+ * xe_sysctrl_is_oobmsm_fw_ready() - Check if oCode firmware is fully initialized
>+ * @xe: xe device instance
>+ *
>+ * Returns true if oCode firmware has reached the initialized state, indicating
>+ * it is ready to handle requests. Returns true also on platforms without System
>+ * Controller support, as there is no firmware gate to wait on.

Same question here. What does this mean?

Thanks,
Umesh

>+ *
>+ * Return: true if oCode is initialized or sysctrl is not present, false otherwise
>+ */
>+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe)
>+{
>+	enum xe_sysctrl_fw_status status =
>+		xe_sysctrl_check_app_status(xe, XE_SYSCTRL_APP_OCODE);
>+
>+	return status == XE_SYSCTRL_FIRMWARE_APP_INITIALIZED ||
>+	       status == XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
>+}
>+
> /**
>  * xe_sysctrl_is_diag_fw_ready() - Check if diag firmware is fully initialized
>  * @xe: xe device instance
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>index 8dc576796890..b69a3f474236 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -20,6 +20,7 @@ void xe_sysctrl_event(struct xe_sysctrl *sc);
> int xe_sysctrl_init(struct xe_device *xe);
> void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> void xe_sysctrl_pm_resume(struct xe_device *xe);
>+bool xe_sysctrl_is_oobmsm_fw_ready(struct xe_device *xe);
> bool xe_sysctrl_is_diag_fw_ready(struct xe_device *xe);
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>index 5e39d2a9c2b0..b507e1553cbb 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>@@ -95,9 +95,11 @@ enum xe_sysctrl_fw_status {
> /**
>  * enum xe_sysctrl_app_id - Known System Controller application identifiers
>  *
>+ * @XE_SYSCTRL_APP_OCODE: oCode application (firmware ID 12)
>  * @XE_SYSCTRL_APP_DIAG: diag application (firmware ID 13)
>  */
> enum xe_sysctrl_app_id {
>+	XE_SYSCTRL_APP_OCODE	= 0x0C,
> 	XE_SYSCTRL_APP_DIAG	= 0x0D,
> };
>
>-- 
>2.43.0
>
