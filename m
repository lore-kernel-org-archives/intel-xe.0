Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3607CCAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 09:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8A410E6D4;
	Wed, 24 Sep 2025 09:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiYtEEjp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512A310E6D4
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 09:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758706534; x=1790242534;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fxa/8apa3RHVOPmnmSk3Oi1paLUWgvKEx8uWvEolWtU=;
 b=YiYtEEjpvAsBIZ4ucrf/WyEw1ffGnkLdlLD9XSWAJeLT9Bgzd078riy/
 IrbOfwSsjjLm/q2HPC5KjdjN47+sjYdENDgIO1RfNFaxmVHTyvnZ6Ge2H
 nDLYlbiM8P4ObWrAblN+xNuU+L0IB2G7PvnUJDECPOVHtLkFK1kUZnvJO
 3utUXu3FoxqD5IW0aJXiP/FYF55ZpY3aZhQ0bjbaySttIybKYXtb9n/6S
 mQDnr8pgH1OPC2LaTzZzkuu9Esj8gUiGBjj768M20Nz5GWIhds8273s9N
 drKSTcHQpTvRTDhV+43I9wdoieEhBVlXmaT7qiOhzpJeHwgSUo4ZbYpop Q==;
X-CSE-ConnectionGUID: lJYzqVJIT7uNejQuW5+A9A==
X-CSE-MsgGUID: FW+jugilQhGSFZkX+MLb6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60887756"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60887756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:35:33 -0700
X-CSE-ConnectionGUID: ZsH+CK75TYCc8QJdouo2pQ==
X-CSE-MsgGUID: fU0q5DvdQJC2WqG7d4mzRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="207732263"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 02:35:33 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 02:35:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 02:35:32 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 02:35:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caWkdTmoHlj3F0tIz6aS1J9NUVp4KQHz31yc9fDUEIp2ca1DWR5FepSgQqseL5O+syrS5PwCDcJGpzQ8iTZN7T6Snqxvl9K0rWDvtt/pqMUS+ZUTh52rTknjHNbDnP03OuaoqC5MV7uG/IeeVvN1RqXlWcOqykppncKy7LECzu9+dV3nZI6Vo9uqumXjdlWtqzxAf8q6moNYMmJ0GN+pmZ/BLSpkaagwXNPLdUQtk/4ylRAYYE+L2EOMoOUQcslg62lq6KPs7C2G8zqWECNH8W/i0sn22zP2O91Q12rjytj6f0XvNMjVe9ccbE97YTGryuiILerlUAsY8oxqEU2r0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwt2CrUqETjZJPUHej+G4p6PuVU7mwcZXD7I6AzI/3Y=;
 b=Rjjhgd7Ow7sQMnrOJfnHJtTqkCk/0mjnz/DpTcbpV94NTxKABWm/egrK1dlcPW5ECMHLxJUoGIdIkI4UuiPMfAesPL/KFBitmX9Ubr5zHs35Tg3mYuvRMFSCT0H+Q/Uj4AFQuj2LrnrvoCzPvMWJPSoNp+s5q37f/dkkaOleu+PlFQagr52RfQ4279VWNl4ZyywDKpKvfB3w76mWOI6UkSjLvJce6CMH8be0kPBk8ydZkvlW2qSyP7l7LCx4TTil3lnedvvDBpjAf217Oty4LtkRHK8pAgvCWMm9E7FOBd0WXOj2Liglal0IQLk1CKJk0cfNcScZjgshonU5cAQZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB6861.namprd11.prod.outlook.com (2603:10b6:303:213::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 09:35:28 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 09:35:28 +0000
Message-ID: <5b8a1b50-b725-4869-a631-5059fd5f7424@intel.com>
Date: Wed, 24 Sep 2025 11:35:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/34] drm/xe/guc: Document GuC submission backend
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-11-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-11-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0048.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::10) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7be654-154c-4d24-f399-08ddfb4db23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXJNMzF2UDlyK1RUN29JQmp2SVJtWmVRekV5VWF1cTdNK3NkMXZ5ZGlScGR3?=
 =?utf-8?B?ZUdURERNNGZxVDdNN3lDL2p0QlhjTkFHaDBOMFZMalp3MVRiL0xRamw4VjlN?=
 =?utf-8?B?UUUvdTVha2s0ZXN2VVdWV0Vrb3ZYSzViZ1pPZU5zQThubTQ5K2grVEZPYzdz?=
 =?utf-8?B?ckdkNCtFZlkxVktoMy8xMmNyOXVHQXZrSnBLV3hZSTZ3cHdJMHFRU0d4Tmcx?=
 =?utf-8?B?NVJtOVZlcThyNklGYWtVTktOcFpQYmJxSUJKc2hnd2FjdVl0eTRuaFhxa0hi?=
 =?utf-8?B?WnlBamhMR1ZPYjFUV1JpRlRPMzJOKzNGeEx1bVJwanZQTUxoYW9QK3REeEt3?=
 =?utf-8?B?WmNlaGt6ZWx4aUVBeldYMXExM05abzJBZ0JQK1FON25GenYyakJnQUliMVU0?=
 =?utf-8?B?TFBaM1I5OS9KbmNrWVpFQXk5WTdiZkhzZmVmWm5YWE12OEtIZ2hRYVM2Q1kv?=
 =?utf-8?B?SWJCTjdLRFJGMnpkTmF5dVkzWnpXZ0huRnNRUzhFdmhQSkdmRGhGOXZnb3pO?=
 =?utf-8?B?eUpoeU9TRVpDbFphdjcxMXBzRzBibnVJWHo5b0hHMEU3VWVSVDFqMlRaaG1M?=
 =?utf-8?B?ai8rd0NubmorQXBZMVFIQ1RWYWlmNzlaQnoraEk4OHBPNHlKMmlvVjdXNS82?=
 =?utf-8?B?bDl5WjB0N1U0YUkyYXJ1NmFXOU9mb0RvTWdyUk80U29LejdvRkJmb0VKYUQ4?=
 =?utf-8?B?NWFVL2VwdVl5bHoySnhCOUc5bTJkUlBKREdVSGR4SWoyKzNNbDdmSkhBZEhL?=
 =?utf-8?B?YldtaTE1WjBqRHRvdmo0UU1lY2NjR3cvTmhQbjlSNmtkNGN4ZE5jcktaRDdE?=
 =?utf-8?B?YVRrRGxIT0hCRkdrejU5bXpvaUNzRUZGSGpoZmVZb2NkZWV0UmxnUmdnTVp1?=
 =?utf-8?B?c3gvVUhvWlB3VmROQXJsdHFxZUcxUDh0dU1WcVk3dTEvYm1iY0N6T1ZXOUNM?=
 =?utf-8?B?aW9IZDVSTWdiS0Z2NlBZVTF3bjRzUUdnVEZyV3JxYlJUSktoWjRNdGFkYW1h?=
 =?utf-8?B?ZXNrbjBBejhUemkxdjIyZzJ6TEJZMU9mcDRhVGNMTEs0MDdKWXgxcnY5WDUz?=
 =?utf-8?B?eDgzdEw4VVA2b2VONzhaT0w0QzROUTM0TEF6K2lUUllRTGtsbkRJSk0vRllY?=
 =?utf-8?B?UVRJRC9QdUNMQkdldXd5eUhvYkdxR1VwckZadjVaQ1E0eGlmYVR3WCtRd3NJ?=
 =?utf-8?B?eUZqa1VpRDZVTHNSSHg5RDI4cVZhbkNKaHJMcmdQSnNBaGFpNnl2ZzRBamNq?=
 =?utf-8?B?SUlCa09OSnVZa3Z0UUxxaG5rRzY2aFY5eDhjNnZ0bmV2WWFFL0RsUzRkeHdn?=
 =?utf-8?B?L3c3WnVkK3BiWFZvT0lGT1g2WHlPY0JUaE41bkZRR0RIdE9PSG11dE45RnVt?=
 =?utf-8?B?bTlrY0tyMzFRVkVGdnRyZ3NmOERoOFBYVGtXTTU1Vk1pcmhYS01Ja0x0b09V?=
 =?utf-8?B?TUdxMkU0YjZkd3N0TmpCb2VtSzF1OUNQdDhlN2FueEk2RmNVbEhHMVRWck91?=
 =?utf-8?B?dTBxQWZHaHJLTFpydDN1WjhVZTR3WEh4akE3bmh6eXpuSXNoQUlxaTVxUDdV?=
 =?utf-8?B?N2lKY1RreXZDNFBDZzhaMjY5eWFRM1EzR0Jvc1dBY0NIaDk2Vm8zbGVBeVB3?=
 =?utf-8?B?VEVBYnJtOSt4MjNpU1VhdjVoTHNkMkpSVmRzUDVZMGF5NmpmOGI4WmxoTk1L?=
 =?utf-8?B?RTJYNkFkQ1JWSlFCOEs1ekZxVTlXa003Nytac2s4Mng5ekdxaEVzaVJrNEpy?=
 =?utf-8?B?OFNGbmk2aGNBazh5OElsOWNEZ3UrRVZ1Ri84Yi9KM0lnQ1ZwZFB1eDAyTHo0?=
 =?utf-8?B?R0pUVjl0d1EvdjF5bmhCaU1UaFIwR0dhMExqOW4wUGVVbEpLUVA1ZFBycDAv?=
 =?utf-8?B?V2w2V2JYQ2JBczM5Y0hMZEJOc2hSRU40L0FoTWJVK3pGZlNrMUJrMHpOcHI2?=
 =?utf-8?Q?8EdEiHkufVc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHhsRko5OVJrS1lsUTYvSHJnMkpBWnl5bjhLWUJkSFVSYzBVWS92Mk93WnU4?=
 =?utf-8?B?QkE2T01kRXphdytLY2Nuck9FYmp2bjk2ZUFnVHRUUVZlVkZZUWhvQVZhdlpy?=
 =?utf-8?B?ZCt0WWhpMlpmVGR4YUg2NWxKRXBwRVJ6Z3FycHFwQzhyWTNFYmp3VytrVmN2?=
 =?utf-8?B?SFBJa1JYQ01pK3kza2dMNVhMTm1DTHdlZVhsamxRck9wVHlMWURZaEVsUVZG?=
 =?utf-8?B?TmJUZWxCZzRROHlkZTkvM2FuRm52TlE0cGtqcWtZME91L2hpdUZlQVQ1WllZ?=
 =?utf-8?B?cERDNEdzellRSzRlZGhvWmx2d3EyMGY3LzFpYlZhRTBUZSsxaVFXSmxXbUVV?=
 =?utf-8?B?cnRWODlkR2JMQUpHWjVtU2ptemkxeUhEMG1GL0xPaXpCQW1HNnZiVk9UdUNQ?=
 =?utf-8?B?SE54VGN4blQ1RDBodkZTZ3ZrRVBCdGZBY1RSQzVPOFJCeTM0ejBjbTBmUTEy?=
 =?utf-8?B?TFhJMG5nZms2dzAvU3JSMkhkczNHNm41UmE2K0l2eUUzV0x4T1cvcFkwWmdS?=
 =?utf-8?B?bHl6WkhXakxWdkpab0tzNy9NMlRHYXBDTTRycWk1T2FTeWJCNnRTTERhTjg1?=
 =?utf-8?B?YzNCMjUvdUErbWtvVnpIREErUmYyT2RzQVc5L0x6bXhUZmFHRmFHRHZYeEVi?=
 =?utf-8?B?SWFXWkcvRFc0MG9pQzFXblp3Z1p0M1ZCb3d2TWM5YnNTWTFKbjllSnppUDls?=
 =?utf-8?B?SG9lMzdhNEtHb1pvN0lFN1FxdWVrSDRCQlpycVVNSCtrWnIweFdKYkIzbUFK?=
 =?utf-8?B?TmczNG5hdlNIUnRVaG1Id01PWmxGV0R2WGxETW81NDY0RkJheUxkWGEwTlJX?=
 =?utf-8?B?UVZGQXk3cWFuMzNjTWk2cXlaSW5sL1FsUjNxb2dpbnVSTVk0YmIwQ0VtM2Jt?=
 =?utf-8?B?a3ZoRFN3S1JpaC9PMHVMYTQ3cDcrTGlYZzlYSklSQUcvVVhpTkxXbjRaVzJU?=
 =?utf-8?B?Y0luL2RxZ3ZkRkdQb25uWWRQRzVSek5nOWFGNXoyREJza1lrdGp2Mlc2OHF0?=
 =?utf-8?B?bVFQUzduNGRFZndVNFZ0d00vN2tIMUIydkZ4RlBVMm93eDlvMm9xcTk0QU0r?=
 =?utf-8?B?YTMrZ1V4L29qNE9ZdURrVzRpbjNORmozNXV4MW0wVVNidWY5bmU5SHBzbW4z?=
 =?utf-8?B?aXpwY0cvL1h1Y2hUeDhMRnB5N2JaQXF2ek1pdzBBVUI5czJLWDVic0JZU3RN?=
 =?utf-8?B?djY3L2toWnd3UVRmQWNSb0lqYkRsMGl2SEJtOFhDbGcyeFJsSzQrMlBmZEt5?=
 =?utf-8?B?cWxrZ3FRT2s5bVhvdDdBVFNTMjY1L2NKZXgrb0F5dnM3TW5UcGYwTXRIOWZH?=
 =?utf-8?B?SVF1c1NCSm1yQ2RrRFFWUkZna1k3YXlSak9hNlVUSnpZSEkyaEl5TEZzcWd1?=
 =?utf-8?B?LzhlNC84dFFFbEg1MVJ4dnNoamU5OGxNQytmdzB2QWRUbXRNUnE3bXd0WDc3?=
 =?utf-8?B?dVVwS000UlNmTTdhQytVcjk2Zld4VHFJRlU5MTVWeHg0clhqUUFvU0x6SHgw?=
 =?utf-8?B?a1doMGV4SHZtRk1jenYxVDJZT3lGVlBvV3BkdXhXYjJtblBwRTdPQ1IweCtP?=
 =?utf-8?B?U1h3bysvNzhKTTg0TENESWhWTU5zM0JYWFlVN2d5Tk41OVBtVnZMdGpCRHJl?=
 =?utf-8?B?NGNoVlRSbGRPeXlSdDl5UVozcVpVbml1V25Hb1FMOUFsVC9ZV3h0bVlzY2sv?=
 =?utf-8?B?QVR4d05Ha3ViK0FuQ1N4c2wvQTNsVGVINm5BZjI3NkNjSis0YSsyQ0VGdWVL?=
 =?utf-8?B?WnVoSGhNeDBZU1M2YWdkRFZwVHAybTd5TFB1R2plOE9NL3I4TU9talpETkxi?=
 =?utf-8?B?eDhreHZ4T250VFdhWDBvNTd5SzRuOHljc1BGVlVBbGV1aE1UL3RhaWhEdFVH?=
 =?utf-8?B?S1BFamFNSWZVbS96LzlYdlVUc09SY2o5MkprWTUzM0RtZFZDOW5ZZDVRd2Vq?=
 =?utf-8?B?Q3QrQ0gwRjhjVzZCZUFjZS9zdE5Zbm5BU2VPOW0zYmF6NTZMN0V1c3pnYWVa?=
 =?utf-8?B?bzh1aW5TcCt3dVZjczJ5d0Q4VkFsMlJwRXVZSXc1ZWNpMEpvc2dXL1NuR0Fv?=
 =?utf-8?B?UVc0NzZLWG5WYkV3SElDcG5KL0lDWWljY0pBMEViN0RqOFk2Z2ZSWnNVVWRU?=
 =?utf-8?B?dTRFWkpoT3JVUldLTlQyM0gyOTJTU21adnVRWVNzOUdHOFB1Mm1jYU1hZTlH?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7be654-154c-4d24-f399-08ddfb4db23a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 09:35:27.9771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJObEtouAPz0MNnKhv0TiKvTE1qDotqXLRHfJgppJ+1TI3JJR90tc1lRpNKfgGRXkjCQdM07YgZuPjyT82aI8RVDfwSBcojDkJWszJocLWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6861
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> Add kernel-doc to xe_guc_submit.c describing the submission path,
> the per-queue single-threaded model with pause/resume, the driver shadow
> state machine and lost-H2G replay, job timeout handling, recovery flows
> (GT reset, PM resume, VF resume), and reclaim constraints.

can we split this patch into "general doc of submission path" that could be
reviewed and merged separately from the "VF recovery" doc that will stay
in this series ?

> 
> v2:
>  - Mirror tweaks for clarity
>  - Add new doc to Xe rst files
> v3:
>  - Clarify global vs per-queue stop / start
>  - Clarify VF resume flow
>  - Add section for 'Waiters during VF resume'
>  - Add section for 'Page-faulting queues during VF migration'
>  - Add section for 'GuC-ID assignment'
>  - Add section for 'Reference counting and final queue destruction'
> v4:
>  - s/VF resume/VF post migration recovery (Tomasz)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  Documentation/gpu/xe/index.rst     |   1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c | 282 +++++++++++++++++++++++++++++
