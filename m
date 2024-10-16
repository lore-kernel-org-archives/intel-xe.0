Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F9CD1AD50
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD17010E6BA;
	Wed, 16 Oct 2024 12:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmomC3H+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002CC10E6BA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729082480; x=1760618480;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Shqk/+KkA6dYA8DxtNHw+9peVCchMfKKwskqXXPGSpM=;
 b=XmomC3H+nbEBEwuwR/8jmPZD/+Rx/9YAKsJ2rzojY5Y1v7tEY/Lm1nkc
 wXAriYEVFqzhOxwfunT4gl8UAjkzlKbqSPeCDSpVgN2kAQ7bjBCUkLfz2
 uPFUhiWsjc9Vn2IogZ/CMDmslnDpce++oCwoGim7u4EDDJvFLAQ+DYNoG
 /OpxX3KKPlAcdxPJMjYWQDHxdMupl1plQGhkSWhFq36Ct6Sdo+GrhR39j
 70pl65hP9a2fIO4eWrhcvcTssy/BL08RPpxGVskBtAtotD4UisB2Zl0Gc
 aZAyQZ+J4QA1WheXxfCiO1gi4thl9QBtNB5tHGBaBhfPh14Ef9f3W6lTX A==;
X-CSE-ConnectionGUID: RfdrifNCTNO0RE/a9dQ92w==
X-CSE-MsgGUID: VWawkD3tTuaHQXgKNRStIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="27998414"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="27998414"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 05:41:19 -0700
X-CSE-ConnectionGUID: KWXml1YfStCvqi/rLTo5lg==
X-CSE-MsgGUID: qZ87D1YIQq6dGFOSdDx1Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78101821"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 05:41:20 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:41:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:41:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 05:41:18 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 05:41:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5+KOEqSvneLMPMHSOIrgVOMaWhpfwsJQ7S9AI2pYmuuMij3+VF+BlCXcRToPngr3W3OvgOhFO908WcctpC/7pb05GgiOYJRWqmgUGzpqopZd59moCI7pWXh8MBaHqAseViTvWKoomcZ0yMMgcJdkX8ZlcDROXlEcDi1OAiYPrWEhsYdVANGW1Zuw6fs365vtAoyLrDKWQW65v+ej+Y93pWW9lv1d9Evj1DW9KDfC0h4Y8uNN2/Y3xxabvmvma6ZVDLeteO5x7GWCU1HHmKOkRJ5iE95RIAsx47fK2nls3CHt1WNv0JdOfusGwl3z3Q4KwBn/nwMrAItS+1m6L0Deg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faQ5OGbsl7aSQYi9Qx5hUGvQITwdD+S8QA7cehGntBA=;
 b=M3jMHQHc/s/wvq9hqOYGxfNAiueUkVwVsrLnLpszs5IADuaSxRZggjAg6h2Q8oT9xakakLAmafOCSf0UxbNy4oWb6B2DPCcEa1nqTElynnc5zG2KzPKzBKh02ns98oY+PrlqGYb5WfgMUDJTqJb/9VxVGiJFK0vgK24SCUJFauVS50oVVJy3aXVZH2CIP/vD//clFp9C0bYoqfRP1VXLpZ4MxrqZZyLITwPf3CG6Sv0cPrUL9kiYtcfsWKx9lfhf3q0vLSUfAdA/odsNQj1OtNE2uAdNm4OwkopxlB3uFyP1q8IaiS7IY0ihOdCdlkJg+0Sn8OQ6xPzQSS9YcaTwiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB5015.namprd11.prod.outlook.com (2603:10b6:510:39::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 12:41:15 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 12:41:15 +0000
Message-ID: <88be5305-7d02-474e-b0af-c744f5f9ab3a@intel.com>
Date: Wed, 16 Oct 2024 18:11:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 23/26] drm/xe/vram: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-24-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-24-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB5015:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d105829-55a4-4a6d-76d6-08dceddfd2c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFk3aWVyRmdTemRkb25Cc3JZcUJ5NUgwMEhCRzJpZXRKOUZ3TElkbW9TcjJl?=
 =?utf-8?B?Y3VVSWxFREtiamJ2Z3p5S2I2Vks0V3Faa0F5Q1BPdERjVWo0M05La2crSnIw?=
 =?utf-8?B?azV3bGQ0cUVuUTUyQWlJd1E4akhCK2JIOUduSVd5RFZMcVc0cFZkMXFvZitU?=
 =?utf-8?B?MmZOcG1SbUdpOEtzMkxNTU5PL2QrTFpJQkVvUStVM1NWYWJvVTJweGJGK0xY?=
 =?utf-8?B?MnlXV3VBWnU1YTc3WVhERUtpTWNXZ2tjZjRDL0tnTjh1K283MEdCc0QxQW95?=
 =?utf-8?B?YlZ5MmN3ZjlzbDhVWmNOOXdVZEhiOXFCL2ViYmtZaEdMamFrOU00ZnZXa2Nm?=
 =?utf-8?B?bVA2UnlIRklCYWZXa3RyeGNLbWE4ekN2alBTd0YrZ3pLODhEcVhpSXBOVExT?=
 =?utf-8?B?T2l5cjdpSEpKbEV3cU1PWGZvYUF0REdtSllEc1JKWkpMZGNJNGxDV01PRGdN?=
 =?utf-8?B?Y2l6V3FFRmFwbGU5OFNSbUdWWnNlNytPSnUrRnhWZFdFUEVGMjg5Ym84WmpB?=
 =?utf-8?B?UmhGRG4xWEJObXVjME9Ud09BeERFdGE4aWZiTlFQRHNnWE1xWklEU041Ui94?=
 =?utf-8?B?ZVJDeHJOT3VkWU9QWlBuTXVIeFNKbTYweGZqbkExNkg2eDVGRy9yVXRuRlY3?=
 =?utf-8?B?VnZobVd1eU1jck9yTG1XR2hxdVBaS3hXenBlOVUvRjV5T1dIYWRzeDlJdkhi?=
 =?utf-8?B?NUdleEI1Zjl0bDdna0kvUkZGM1Q1VldnTktYN3ZTZnNTVFpaVDY3SzdvLy8w?=
 =?utf-8?B?d01vNmVBeDJIbUhQRE16WWlOS1pUQlQ5QmtoZWJDSTdHY1crVUNxSXdaY2M2?=
 =?utf-8?B?OXIwMnQ2LzZ1anZXa3hhOTBEWFJaTVVwYjNrVm9VdFlXUm1jYytUNENqV1E0?=
 =?utf-8?B?TkZvZ1RLcklFb3BwWnpxN1JpSllIVmZQMnR2WHNBTitmT3ZRUkdUZCt0UWt4?=
 =?utf-8?B?emtnenN1eFVPbVhoaGlPQ1ZadTNWdVowUkdxQlVuL0pXYSs1d0xDT2hXcHRV?=
 =?utf-8?B?TXMzc0JjUnc5bm5PUDVGM3Y4djN1UWtQb2JMU1c3TEhVQTlOL3JYTFlkdkcy?=
 =?utf-8?B?RlpCb3B1aDhkN3g0dmpBbFZyY3dWMHp6SVd1TWFOeC9yQXZQcm5XOTdBdU5M?=
 =?utf-8?B?RkRwSFFsem5Kd21td3RsVWUxYThoTXVzcVU1U3ViYkc3RFJ3alJZRlBtSmp4?=
 =?utf-8?B?QXhtTVdFT2pkTE9hVVRsalhvRFo3Zzk4TW1ITGlMZWVPQ0dCa3pOYlE3d00z?=
 =?utf-8?B?WmtjNGpsMVIvWlZzR1Zjbm1NRzJUSndrcEh1ZDN5em1LSzZyU0xZS2JrMU42?=
 =?utf-8?B?RWs1UjNObEFjaDVKaVhHRmhIaGhGQTRUN0F3Vy9iOU9ESE9kRHN1TmNzazh6?=
 =?utf-8?B?K29HOFRDMTVvZkp1bVVBU1ZiUXduS0R5clcyWkRMcG1tNUsrTUZWMEtzL01r?=
 =?utf-8?B?M1lrU3Z6WDVRTElobktMOHBPVUN3ZU1veklkYjRxVVpBV0FlK1VHdWdYNjVQ?=
 =?utf-8?B?R28rSEFpZEZBTndMV1U4aDdKek1GRG1PQTZKWElUUm1qc05BRHFab1YrYXRa?=
 =?utf-8?B?WHY0ZXVMWlNVSWRZaHc4a2x1cVRhaERRQzB5cGlqQ0x0SDcrQzJjdU01cVpo?=
 =?utf-8?B?UmxzeUVQK2NSL0Y0cENnT1hqYXJRY0F6a0JFekJHQUU4SFFQaXpNSEtEZnhq?=
 =?utf-8?B?K2J2clB2ekdqajlFR2ljVU5WMzMzenRMdlF2dXYyYWlzeW9uVUtFVFZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alhxSzYvdlRybEx0cGo2a1dDNU9yUUtkNDhFMkwyU1BXTWczc2VjaHprMWhM?=
 =?utf-8?B?bDJjUGdmMjJ4bzFZZjd6TE1zeDh4MmNicXQ0R3FUSm5iU2pHRU9FVzZTcFZK?=
 =?utf-8?B?WFRJRSt5dnZxWVBaajRqUDVEYkpEWTNKRWYvOFd5ZmNqaFB5aG80Y1BYb2Rl?=
 =?utf-8?B?QlhvQ0RubTJVT01KT3FPckVhTnE3cmFBZ0wxYzlrSVBqNEFNdjlEdFpHTTRY?=
 =?utf-8?B?TE1ieXZFdzA3WUY3WTBIOXplc1RUS00wN3AzQ0JtN3lnYllXcE1JOEtLK0Ir?=
 =?utf-8?B?ckt4NExYQzlZSy9scmp1MlZ0eTFIQ1ZJeFBjeXRqRytIa0hsZGxUVmpEcXJM?=
 =?utf-8?B?dUhxZEFRdlAzeUtCZGZyekhZaXZHOFgrQ1ZUcnhTS29zRlRLTzkvOGx0c0VH?=
 =?utf-8?B?bFVpd3VBdGdWQjF3TERSbGxsek9mczNwTmFRb3BRZEN1QktQcEd4S3BPYUxP?=
 =?utf-8?B?SWhhTVRkZUt4bVo1YWE0Ui9ZV2NMeWI4Nk44RjRzZit1WDdsRWxWS3Y1ZWdR?=
 =?utf-8?B?YmxwR0U1SVdjc1J2SmJ3UmMxVEMxODdxNnZZUDN3eUc5WlpVSytsM0traDlS?=
 =?utf-8?B?bk1qblYyeWxXSHpOWndGMkhWTVh5b29obS9JczlUZVB6OE5CT3l6amprK1gv?=
 =?utf-8?B?Y3VrSnBnSHRIdDRtME8ySEgycEhBekhwL0pna1hNVzhxT3RKeldpSzBxSzZi?=
 =?utf-8?B?bnRlcndTTllOM0k4ZDU2clpOSExNdGRpOE5NTEk4ZFY1S2x5QUhqK1VBQWRW?=
 =?utf-8?B?V2UyUU5DS25yWlcwS01ySHM4YUIyWFdWOHpGYW9kTmkxR0htUWo4ZlJ0UTMr?=
 =?utf-8?B?ZjhESEFlK3NraldkelZRY2sxbFBMdERwMEgremFUUVhMcjRVVnoxVkE5TDFk?=
 =?utf-8?B?NlNNbUI1MXltODhFZlM2bG1RaElYbUphenFBOEgvT0VaYWlJeDZJU3RTOE5Z?=
 =?utf-8?B?MVBUY1hwRHZsWlM0dzNrVEltZy9vSWErRVlhaDJ0cURTc2pWTmFQUzEySVpT?=
 =?utf-8?B?UFdVcXlJanJzR0xid1NJMXRVbG9MQnl0a1ZZQzJXRUs0RTY4aW15ZnJFV3ZZ?=
 =?utf-8?B?c2FoUVVoTGF3Y29xTVB1MkU2OHlTNnpSYWYyZ2piTUxUQXBjazNYNW5rc3JX?=
 =?utf-8?B?WTkrZm15UkpWdjBBa3Y5VGpITHhvYzVCZngrMGpZdkd3VVZLanlJVFVOZ0VY?=
 =?utf-8?B?WFZDQTU3cDMrR1BvaUZLYnBHd2pmUndRdXAyOEhmVXgzdGh5YVlRdWxoYjgz?=
 =?utf-8?B?NmZKUlI4dFNtTHBUWm9aUTlyYWVzbnhLbFJ4enk2a3VYUnFwVi8wNFNaUmh3?=
 =?utf-8?B?SzBsUTR2eHRhTTlqN2dSa0EyVzVMdkxtR3FWYzYzdlJrRWY2dVhEaWtHdGlt?=
 =?utf-8?B?b3VJL2ZXcDV3WnlmMGVWcVpMQUNCZVdsYXEwdnp3YVRBdUtITmhhTytpK2R5?=
 =?utf-8?B?ZHA5TkZZU21jdHFVQldKTmVGcllJTEc5SVNDUVkwekZ1M0VYNi93NnNXMUtG?=
 =?utf-8?B?NUZFYS9Fd1MxS0FmN01ocGVPd2xTV0dOdlc3aDNlNEd3bjQ2UkQ2TzEzNHd2?=
 =?utf-8?B?TXBnQXRRS1A2dlpMYkFHd2UzNm04NjB2czNsRnNvY0oxOFl6WDIyUHV1WUhm?=
 =?utf-8?B?UWh2ZUVkMGtJLzd6UXEyVlpxWnZtd050M1JWNzNTYU9VN2J0SkhWQzZJSnRx?=
 =?utf-8?B?SUliZnd6SWRyL1IyNE9LNHFsbzBtSHFlWXFENGVVQ1VqbVRsVXp3aGEycnNi?=
 =?utf-8?B?WkpkYzI3OFlpbWovK2NGTHVJMGZveVhHMkdXTy9pR0dhZjlTNWVyU3ZBT2Ja?=
 =?utf-8?B?UEtWczlGRUVGYzRiZW9WUGJDV0RhczJ6UEZkUktwZTdvalFxRTlvMUlMbHBJ?=
 =?utf-8?B?THZXQjJGRU9FNzNMUWtzRlV4SnZJQi9BSTFOSTg4ODZwbjA4NVJWenZTcVFx?=
 =?utf-8?B?Rm1yc1lXVTZYZ2IrU21GYVFkZnAwbTllRGVyZURqb3o3K3RxY0hYaXZuVjZ4?=
 =?utf-8?B?dFZiVDF2RjVNY3ZEa3hoc0NrcFl6eHI5NlNxTDFkSm1xRXJJdDRseVNzY3lR?=
 =?utf-8?B?OWU4TVEzQnlseEg4ZW9nNXZHQzFudnpOQVFodWRlRjNIVEdQS2xMTUFrSFdp?=
 =?utf-8?B?c0U5VkYwMmUzSGN6Y1B1ekR0aGpZYWFJUTNSSUVzeUx6eEpYQ0VyZXF3V2ow?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d105829-55a4-4a6d-76d6-08dceddfd2c0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 12:41:15.2110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6z0XL/tFtjA7lekclAJOOuZejPaDwnd/7UsVEL8pDx1juXJjVV1SE/lXK4oWpLBI0C2O57l7et81yk0ae7kow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5015
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Update the return handling of xe_force_wake_get()
> to reflect this behavior, and ensure that the return value is passed as
> input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be escalated/considered as
> probing error. It internally WARNS on domain ack failure.
> 
> v5
> - return unsigned int from xe_force_wake_get()
> 
> v7
> - Fix commit message
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vram.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 2a623bfcda7e..b1f81dca610d 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -220,8 +220,8 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
>   	struct xe_gt *gt = tile->primary_gt;
> +	unsigned int fw_ref;
>   	u64 offset;
> -	int err;
>   	u32 reg;
>   
>   	if (IS_SRIOV_VF(xe)) {
> @@ -240,9 +240,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>   		return 0;
>   	}
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		return err;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>   
>   	/* actual size */
>   	if (unlikely(xe->info.platform == XE_DG1)) {
> @@ -264,7 +264,9 @@ static int tile_vram_size(struct xe_tile *tile, u64 *vram_size,
>   	/* remove the tile offset so we have just the available size */
>   	*vram_size = offset - *tile_offset;
>   
> -	return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	return 0;

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   }
>   
>   static void vram_fini(void *arg)

