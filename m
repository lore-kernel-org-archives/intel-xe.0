Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DCBCCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 14:21:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA14610E300;
	Thu, 16 Oct 2025 14:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nP93INOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17D910E300
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 14:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760624480; x=1792160480;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yptbQXPcuxwZ4MTeIpwkuUQeE/xOx2DV3tUmcn74eNo=;
 b=nP93INOPBoC6AsRDZ5uYu8FfWwwHOWF+JP2GjZU0SLgAIsQ/CQIfLbW/
 PB7J03x3SMYNbIbmzME2eAQ9GUll395Qkc4Z/WL987jvuVKxlCVqHD+QK
 Y0z3NooqITvR6PHK6e3TCswL0BexIBKyJ3rrUs+8KOe9DbNtmaaipgHys
 TA5mgo71806y6TvKio2926Oraam2d+o17HGpOO85Mm+6CHAacPtmv6T/w
 VkjxLfGQlNZNFBRm6G+Hp5Ay4lhdIqJuqYkyRMw6ao9tfs6UUYbE44w3A
 aXv9kz03D8IRlpfbnbnPHK8VGCT4dSaLdzoEZ8zhuvF9/RI9XUHAJXyUq g==;
X-CSE-ConnectionGUID: fh1nOW/QSxSrjHLxhxVBlg==
X-CSE-MsgGUID: vBmDC0oQQfmsyBzW27PnWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="80454288"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="80454288"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:21:06 -0700
X-CSE-ConnectionGUID: 6ceso6hwQlqgi5LOgO+G6Q==
X-CSE-MsgGUID: lpg6NgcpQOGgzsTV26keRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181679040"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 07:21:06 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:21:05 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 07:21:05 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 07:21:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vI2Nhn2BAcdfre6lqC6P9/36U2bgBpKvwx5whvhyM8PoX7TLZncImRAJEbqHjYO2qlX7Rram9YGQQdL854bIHATf+gBoeKFUC0HGHlGdGwy3b6aQSOCLdtp+XPACcVpsq9Fxh5I7x8ABGgxbSpx8d96L2mWMhCWqQeSVLooEansavKkedxoU9AlgUykzsikBoGpHymrlPegekLEfwWNJBpL7pFaiVay/za8bgyi7a7c0ZQxiIFZYw6vSqrcqJuwAlnjRkxVOd1zhEoc/QVjrr4By7G2jFfPxFpRBc+USlQ0afYDSZvcj7SvCvUC94JdkTfOVCzV4up7nYcoY3xTn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnFrIAdLBAeBB7xocLQoLS2c8jFyTv2S4LUym8QIb0Y=;
 b=XGeUasH3lUiBAUcZvmWgNG+ahsqf4cfM3cdSUqjN+HFFLeLalRyPqNk/2WE6CDXQsXPQxeuDpxkLqxgr/XNvgVCR/GWAxX1LjARxp67Yy4DJ1y4Fx3cNcFocJXKGvro7FCCsmydBiWWfgwPEZeuMhEkqtPJ4iSj2l9HR0Kw49KXRqKBMSl87RhzTjECNNnwSx6sYpMr2g17vh1ytcQ0zaeJg2czl0NM4U9vXESLJ6Cs9o2Z4GpcuTP9hGblUfiwXgaPaceOSNzUMxYsdk0wiSuKbHvohs0SNjrrlT/fB3d+3FMnuJEYsgRdRK0pLOJPxgJaCUO4+EBTdDfIibEWWuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 14:20:56 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 14:20:56 +0000
Date: Thu, 16 Oct 2025 19:50:48 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Shekhar Chauhan <shekhar.chauhan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 03/23] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
Message-ID: <aPD_QK8r_DvW1SOX@bvivekan-mobl1>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-3-bfb74f038215@intel.com>
 <20251014163403.GO5409@mdroper-desk1.amr.corp.intel.com>
 <jkedmz7ocmab6vs5wchwuazhpmysh4synxcd6hrs3a7v5g2vlf@suwamovrz6jb>
 <aO9BB6ZagPke7o71@bvivekan-mobl1>
 <jvumbsccpra6yu4vqn5xtjlmfn5n5cflr6yaofjazfylrbfk7t@qd5lkufxluxp>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <jvumbsccpra6yu4vqn5xtjlmfn5n5cflr6yaofjazfylrbfk7t@qd5lkufxluxp>
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 363d9ed9-8b75-43f4-040e-08de0cbf389f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enZMTktCemJjeSttWmJicm84OVN1YzdHNUFTRUVLL0w4emtPY0l6R1lyREJu?=
 =?utf-8?B?RkJWVW10L29XN0NRc1h0ejR5V05yRFgzSDJ2cEdNVVV5SEFNbFJpZVliQTE1?=
 =?utf-8?B?VUNHY2ZudG1HVXNHOE9WSGNvWEFNQnNYMHR6SnVGZTZ4dEl5eTZWZS9pSGx2?=
 =?utf-8?B?NFFRczFJRktoOGpjaW9mWUYyRmFhT1RQWXM2VGliempNajJZN2o0S3RTSW5U?=
 =?utf-8?B?aTUycW80KytiVGFzWnRraXNyT2pxdHdjWVlCbGFLbUMzUEZYcThXVk1MQXlW?=
 =?utf-8?B?NlhZUTdOME5hWGRFOVJoU09hNWVoSC9pQTU4SFZVZ1FVTk9sWVNKa3JqY2RY?=
 =?utf-8?B?NXFYeHN3Yjdib2UvUnZJQjhmZHBQbENrM0pQUEI1bEVaTTAvMlFSVktHOGNC?=
 =?utf-8?B?RzhWRXVYWFh3UjMyd0o2R2ZHQVRSamN0ZTdBSjI0NGd6czN4aWRGOFE4V1ZG?=
 =?utf-8?B?R1Q4bzhCNjFDM09LQXVUUFpxTlVHbnpHTHpSdUFGQmZsdGtqdTFmZDZPNnhw?=
 =?utf-8?B?dGtCM0xKRTdPNzdEZjE5TFdhODZFTUpBeWpqdUtTem91WVpIREhaRFdYc0dt?=
 =?utf-8?B?emtwSXpxZWJNQ3lNU3BRRWJnUG1DQjkvVGhTcWFVQ1F1TXBGaDBUOExpeTV1?=
 =?utf-8?B?L1AwdUZNL0FjYmR2b0JxTThzRGhHZldyamVkWUVKNFhPRnhDak5yWVJZRjFO?=
 =?utf-8?B?YmdGWGtsSWIwc3pVcWVqQ1N0cUxNazd4VDhPV21FWnBzdjJDMy81ak53RkhB?=
 =?utf-8?B?MHVLWnRNdXJtdEVjcjc2QUEwNWhWU01yRkNwL0NZOWdnZG9sUEN6dzlwOWQv?=
 =?utf-8?B?ZWVtSWxqSFpxNkJVcFlJM0hGbEVpY3hBV01RdGttMWkzYnU4djloNzRkbTV6?=
 =?utf-8?B?VEE2RURvV3NpTmxQa1ZteUhtMVpLYTlqQ251SnhFNVR2TWVucXhIc25jL1pk?=
 =?utf-8?B?d09MaGRaMXFLUW5iMUwwdzU2RlNMTjdWTk92UTRTK2pSRk9yT29XYXIxNGEx?=
 =?utf-8?B?R0NVV3RaZHFOL2NTWHBCazI1WTlLK0lpck10M3ptRWkvV2U3cnVMWC9QNnla?=
 =?utf-8?B?TFFMby9PWGdGbmowZ2kxQXZLSTZTLysvQTJ1UEwyZkpuUkowTnhWL3dzQUFK?=
 =?utf-8?B?SXhHZXhwYXJwby9MSUR3dmlOR0htR3FQdDBDbnRHYlJQaUhVdGN0d0FhWFc3?=
 =?utf-8?B?cnlGTDR0d25ldkoxTkRSQ1JCTU02M2tzZjhjSGZCWUNsOFI4SHRnZS8vQ25K?=
 =?utf-8?B?MXpOaERsancxWFVZaDVrRis2ODRKMXQwYkVVM3Z6OGN1cllZd2R3aFgzT1Nw?=
 =?utf-8?B?UFcxNG9FbDRTTmZqYVVLLzhsdmp5ejYxQk5wSjRodXEyNEY4N0RXc3lFbGdT?=
 =?utf-8?B?cWlLN2hNZEM5cE9tQ1RwK25sNjZOZWNpUkFqa2RXUngzWHpHanpWeGkyS2Rh?=
 =?utf-8?B?OUhEMkkrQXFSOVlJR2cvTzNBYzM4R3JkNnZ1MTNNS3A2dEJvbkFvWUVFU1Fo?=
 =?utf-8?B?OHJxenFuSW1CbVlOTzlER2FkNHovaVFTSlRNUlpzUkR0bXk0elBhNmhtSzhB?=
 =?utf-8?B?WVpIYjUyNndsd3Yydm0wYlRDRVhGMUU4ZTNTUlVqNmI4Y2dXcGgrcjJqTmFa?=
 =?utf-8?B?dkpMQ0NBb0hOZXFIZTRyTUE0bnFtSStQRmRwVGlQVjlINlUveGE4ZldOU1cx?=
 =?utf-8?B?TGhXQnEwWUdZTzREc0RtNS9uaGU4MWc3R0toRFFKSWUvbWpIc3dlTVM0b2tm?=
 =?utf-8?B?YVNxbXpqOG1XeTBqQ2VKK0dGRFdsWlhMTE9VQnFsMkJ0QXpiQmpxa3BLVXJF?=
 =?utf-8?B?dEFYcC9yanFuWXcvR01KbnNqM1BFcEU5UU1Cb1NCQ2Z1STY2OEZoRzBzSnBq?=
 =?utf-8?B?aVk1bjJOREtyU3ZNUnBhNVlDRlBZODNlVGhxdmZpMVVwem5TbEZQNUxkc01Y?=
 =?utf-8?Q?Ec6prpI4sKqig89dExHj7fHST+vXKlNI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L092ZkFFWk5DZUxzSGV3dndtcVNDZm5sY1pyMkhGMitGT2RHZXQ0VktBOXVE?=
 =?utf-8?B?RjhrSE9Zb1k2SFcxVWYxZ2MyM3U0a3pTK0Q2ekRXRkQzSklRYkhYd2VOQTFm?=
 =?utf-8?B?TFlpV0wrOHdRMld6TXV1a1BVTjM1TWVhQnFGczNjQk5GaU96Q0FITklCb0Mr?=
 =?utf-8?B?QTJQR1pFOUNCNzJ2N3FmMU9jMkRaWFZlME42d28wdzhXOVo0STF2YVRiMFhE?=
 =?utf-8?B?UmJGWXVmYXFCbGN5dmRHd2ZBbVJDVVFyU0JTRDR6S3lhd0FFZ1gxSXE3NmpQ?=
 =?utf-8?B?b29EOVhqKzNrU3oxVWMrVjY3NEZHU1pBdENnK3JxRGcvNUhFTk12VHk5K0RG?=
 =?utf-8?B?bSsrcEhYVzRHaHNualY4aUdQcjl2b0dSVTdWVnFNZ0F4WUxWeEt5eHFxUUM1?=
 =?utf-8?B?ZGFMUnc4N2FQN1BBQTJWcXVmR042Y1c3ekhlYUFQTEVmMmgvNVVwVVdsdXEz?=
 =?utf-8?B?M0dHQXcxN0MzK0xEdUJGUzM2N1lmV2lQR0FGWkJLSUN0ZW5yUmFzbnVmZDdB?=
 =?utf-8?B?QmRZeXNyc1JSMEQ2YjJ5WXQvUXV2NEp3aFZGZmRwbk5CVkxXVittK1BqQ21l?=
 =?utf-8?B?UGpIWU02aFdlbEp4MUJ0R2lKSDZxendHUnJWSE1jVU40Z2FkcDlpQVBjYXZE?=
 =?utf-8?B?TnFoUTF4TGp2cUlIRnlMZDNCSW01UW5EbjFRUGdjMDUrdStVS3doT3pmU1Mr?=
 =?utf-8?B?NlVRcUpBdGtOb2xqa1B1VG1rRURtYnFZZVFhRmd6Wi9EejdKUFkzRzl2SXNp?=
 =?utf-8?B?WVd3OU1yOU9sTitGcExpOUhtbTlORGx6WCs3NkhBd0JqdDFENG9qUVNObDFl?=
 =?utf-8?B?bnFaZGEzbGlsNytsVlh1d0lpcDNWWTZTMXVlL3BiU1cyVUQ0a1BTZlFTTUth?=
 =?utf-8?B?RW9hbFQwV0VVUUtQNHpjN2k2cENCRTJpeE1JZHRFWkFLbDdQenJTd05tZUhE?=
 =?utf-8?B?aE5XNlo5aGdJcnE4dzN2TEY5RGxLekZHOFlUd0lRL1gwcGZzQlRnTHdSR00y?=
 =?utf-8?B?RVpqMGF6cCt4NG9ZZHhISW5CajBkZGY5bTFPcG0vRjROcStVMUZqOEpqT3hI?=
 =?utf-8?B?YVpMTStMaXh4N3ZtTG10V0tFSk5VMklYcTNObnloeUY0ZHY5NXJwckRsSkJz?=
 =?utf-8?B?RWhNS2FqRnR1WmE4MHRKN3kyaEN5NHR2OFE4cWFzZ285V3FYTFd6SUdlOCtP?=
 =?utf-8?B?SHcrRVNBaFRneUF6alROVWdzb1M2UnBibGprVXRNTnQ2dWduaE9wUGd5Qml1?=
 =?utf-8?B?Zm0reEhMZ1Y4Zm9CeVFpT3JiOEFtZTJwMjRqQzRZRklpcy9uTU5xSUI4amI3?=
 =?utf-8?B?YXRqM3Vra09CNXh2OUJRV3FyRyt6enRBaG9abWdZL3Z5OU1NeEVZdFA5RUNk?=
 =?utf-8?B?cWpYbG54OGlCcDQ4UkxEbkJhZGpabWk0WWVWVlFXRlVDTGRadWx1UXpEU21j?=
 =?utf-8?B?NSttbzhuRkoxUVJuRVk2cjlDRTBoVVhmZUVhMGI4Ym5pQnpmeVBCYnRnZWEv?=
 =?utf-8?B?MFR2MVBuWmUvcUxiL1VFSXZjRUVPYWh1dElZZEFsQTlYMm9wZGVKR3ZmYTUw?=
 =?utf-8?B?dGR4ZnFUOFhSUWVnV0xKOVd3c3l4ekRwSVQ5dmZRMjBuYmtkMmRGVEQ0Ymdu?=
 =?utf-8?B?Y3lScExuZGE0WGRuRy9ldVBoSG1SaGNoVEtHaCs2eUh5MkdGTm12VDVieURF?=
 =?utf-8?B?NDJxQm12M3VOUlBvRStaS3BGdXlHZGVvUkQydzZFTDIwVFFDd3RMb2dZNVlo?=
 =?utf-8?B?SWF6NFZBM2ZPNm5PaWxNTllxRysrZkJzZnBuQTlaYngwRDZrWjNDMDM2QkhI?=
 =?utf-8?B?WGloaW9ESU5NQUZxMmxmbllLc1ZZamlkTFJTeGZwdkc0MjdZbDh5UktVZG5z?=
 =?utf-8?B?dGJhc1ErU04vVWtEbHgzbVBWNnd1QXQ4UCtDajJkT0YzaXVDU0l1aGxJUUd0?=
 =?utf-8?B?QUFIMmM1aUFzNHZmQklEWjE5QWtjY3FueGR0ZVg3UXcraFRkUEoyek9CWi85?=
 =?utf-8?B?QzZKN2RLYnNIOEhxMk9BemVYclNhVTY3cDZJcjNCNXZpbDN6SkZSMWh5MHpB?=
 =?utf-8?B?b1h6TnVwSExCTUVXSEIwSjRQVFRaVGVUR3htMmVEdytBaG9UT0s3R2VBelYv?=
 =?utf-8?B?YkxkbVYrdkZEWVJsYzVpNXdibUh5Q09uQ2QvNjl1ZFkrcWMxbDU0TkJoQjE2?=
 =?utf-8?Q?MKpLRTEH34ObxlfFW8e7eus=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 363d9ed9-8b75-43f4-040e-08de0cbf389f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 14:20:56.4976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCQg/Sxn0IABY17zMMCWFtne9F9uLocbDQP+w5URYwUd9M7JjvtGSxNY5EAMlMRax6Dy6Ags8C+MsE+2lyxnBbGO/r+HBvjB2cfkGK6WFSFI46XC2XYHJWBTxAfoi93W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
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

On 15.10.2025 09:03, Lucas De Marchi wrote:
> On Wed, Oct 15, 2025 at 12:06:55PM +0530, Vivekanandan, Balasubramani wrote:
> > On 14.10.2025 21:28, Lucas De Marchi wrote:
> > > On Tue, Oct 14, 2025 at 09:34:03AM -0700, Matt Roper wrote:
> > > > On Mon, Oct 13, 2025 at 08:24:35PM -0700, Lucas De Marchi wrote:
> > > > > From: Brian Welty <brian.welty@intel.com>
> > > > >
> > > > > Starting from Xe3p, there are two different copies of some of the GAM
> > > > > registers:  the traditional MCR variant at their old locations, and a
> > > > > new unicast copy known as "main_gamctrl."  The Xe driver doesn't use
> > > > > these registers directly, but we need to instruct the GuC on which set
> > > > > it should use.  Since the new, unicast registers are preferred (since
> > > > > they avoid the need for unnecessary MCR synchronization), set a new GuC
> > > > > feature flag, GUC_CTL_MAIN_GAMCTRL_QUEUES to convey this decision.  A
> > > > > new helper function, xe_guc_using_main_gamctrl_queues(), is added for
> > > > > use in the 3 independent places that need to handle configuration of the
> > > > > new reporting queues.
> > > > >
> > > > > The mmio write to enable the main gamctl is only done during the general
> > > > > GuC upload.  The gamctrl registers are not accessed by the GuC during
> > > > > hwconfig load.
> > > > >
> > > > > Last, the ADS blob for communicating the queue addresses contains both a
> > > > > DPA and GGTT offset. The GuC documentation states that DPA is now MBZ
> > > > > when using the MAIN_GAMCTRL queues.
> > > > >
> > > > > Signed-off-by: Brian Welty <brian.welty@intel.com>
> > > > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 +++
> > > > >  drivers/gpu/drm/xe/xe_gt.h           |  6 ++++++
> > > > >  drivers/gpu/drm/xe/xe_guc.c          | 27 +++++++++++++++++++++++++++
> > > > >  drivers/gpu/drm/xe/xe_guc.h          |  1 +
> > > > >  drivers/gpu/drm/xe/xe_guc_ads.c      |  6 +++++-
> > > > >  drivers/gpu/drm/xe/xe_guc_fwif.h     |  1 +
> > > > >  6 files changed, 43 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > > index 51f2a03847f9d..47e13a3fb9072 100644
> > > > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > > > @@ -545,6 +545,9 @@
> > > > >  #define SARB_CHICKEN1				XE_REG_MCR(0xe90c)
> > > > >  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
> > > > >
> > > > > +#define MAIN_GAMCTRL_MODE			XE_REG(0xef00)
> > > > > +#define   MAIN_GAMCTRL_QUEUE_SELECT		REG_BIT(0)
> > > > > +
> > > > >  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
> > > > >  #define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
> > > > >  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > > > index 5df2ffe3ff838..9d710049da455 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > > > @@ -22,6 +22,12 @@
> > > > >
> > > > >  #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
> > > > >
> > > > > +#define GT_VER(gt) ({ \
> > > > > +	typeof(gt) gt_ = (gt); \
> > > > > +	struct xe_device *xe = gt_to_xe(gt_); \
> > > > > +	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
> > > > > +})
> > > > > +
> > > > >  extern struct fault_attr gt_reset_failure;
> > > > >  static inline bool xe_fault_inject_gt_reset(void)
> > > > >  {
> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > > index d94490979adc0..37e3735f34e63 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > > @@ -91,6 +91,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
> > > > >  	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
> > > > >  		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
> > > > >
> > > > > +	if (xe_guc_using_main_gamctrl_queues(guc))
> > > > > +		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
> > > > > +
> > > > >  	return flags;
> > > > >  }
> > > > >
> > > > > @@ -1255,8 +1258,13 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
> > > > >
> > > > >  int xe_guc_upload(struct xe_guc *guc)
> > > > >  {
> > > > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > > > +
> > > > >  	xe_guc_ads_populate(&guc->ads);
> > > > >
> > > > > +	if (xe_guc_using_main_gamctrl_queues(guc))
> > > > > +		xe_mmio_write32(&gt->mmio, MAIN_GAMCTRL_MODE, MAIN_GAMCTRL_QUEUE_SELECT);
> > > > > +
> > > > >  	return __xe_guc_upload(guc);
> > > > >  }
> > > > >
> > > > > @@ -1657,6 +1665,25 @@ void xe_guc_declare_wedged(struct xe_guc *guc)
> > > > >  	xe_guc_submit_wedge(guc);
> > > > >  }
> > > > >
> > > > > +/**
> > > > > + * xe_guc_using_main_gamctrl_queues() - Detect which reporting queues to use.
> > > > > + * @guc: The GuC object
> > > > > + *
> > > > > + * For Xe3p and beyond, we want to program the hardware to use the
> > > > > + * "Main GAMCTRL queue" rather than the legacy queue before we upload
> > > > > + * the GuC firmware.  This will allow the GuC to use a new set of
> > > > > + * registers for pagefault handling and avoid some unnecessary
> > > > > + * complications with MCR register range handling.
> > > > > + *
> > > > > + * Return: true if can use new main gamctrl queues.
> > > > > + */
> > > > > +bool xe_guc_using_main_gamctrl_queues(struct xe_guc *guc)
> > > > > +{
> > > > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > > > +
> > > > > +	return GT_VER(gt) >= 35;
> > > >
> > > > Revisiting the spec on this, I'm not sure whether using GT_VER() here is
> > > > actually the right thing to do.  As far as I can see, the media GT does
> > > > not actually have a "main gamctrl" register range at all (i.e., bspec
> > > > 76445 only lists MCR gamctrl ranges, and 0x38EF00-0x38EFFF falls within
> > > > a reserved/unused block).  That means that registers like
> > > 
> > > true
> > > 
> > > > MAIN_GAMCTRL_MODE that we're trying to write during xe_guc_upload above
> > > 
> > > We do have MAIN_GAMCTRL_MODE for xe3p_lpm in bspec 73540.
> > > The tagging is odd, but there is a reference to the register at
> > > 0x38EF00. It wouldn't make sense to have a 0x38xxxx register instance
> > > for primary/graphics GT.
> > > 
> > > So either
> > > 
> > > 1) we don't have it like you said
> > > 2) we have it and there's something missing in the MCR ranges
> > > 
> > > > don't actually exist for the media GT.  Furthermore, the tagging on the
> > > > register detail page 73540 also seems to imply that this only applies to
> > > > the primary/graphics GT.
> > > 
> > > so... in that case we'd need to check both the gt type and graphics ver,
> > > so we load GuC with those different flags. I will take a shot at that
> > > and check if anything breaks.
> > > 
> > > Bala, since you did the patch following this, do you remember of
> > > anything related to this?
> > 
> > There seems to be a conflict between the Bspec and the HSD. HSD
> > 16017994409 and the HAS claim the MainGAMCTRL is supported in Xe3p Media
> > IP whereas the Bspec page 73542 and the Steering table show the
> > MainGAMCTRL register range as not available for Xe3p Media.
> > 
> > For me it looks like a Bspec update issue. We have tested and verified
> > the current implementation which enables MainGAMCTRL for Media.
> > I would say lets keep the code as it is though it conflicts with the
> > spec and raise a Bspec issue to get it clarified.
> 
> I'm circling this back with HW and Spec people. I also did some changes
> local changes to test. Although since the old queues are still valid, I
> guess it will just pass, but without this optimization. On the other
> hand, I'd expect it to not work at all with the current code if it
> didn't apply to media.

There is an Bspec update to the steering table yesterday which now lists
the address range 0x38EF00 - 0x38EFFF as non-MCR. But still the Bspec
filtering is not correct. So the register range doesn't show up when
filtered for Xe3p Media.

Regards,
Bala

> 
> Another point is that we can delay this patch a little bit, since the
> next patch turns this off for media with the special bits set.
> 
> thanks
> Lucas De Marchi
