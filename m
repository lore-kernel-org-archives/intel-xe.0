Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F66C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 06:30:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAE010E04B;
	Mon, 21 Apr 2025 06:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF7Zke59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5771C10E04B
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 06:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745217028; x=1776753028;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H4f4vUCT25n8xk0va+btM16sW4RUmkPhJkgcQEA4+hc=;
 b=iF7Zke59+pQv+boXbfsZsgd2aBu/BBpDQM325IL91E8Esn+A6b5sxroR
 w7frJPi2d7l3CxWCxqJpNZg7YqREzpQOpsBr/by0PgNcVxbLW/MKi2rFL
 vjaIbapr1ndoqolBdRYD2pmNKoeZ4Ms8NwWc+a7t23VD6HfTF6x7cqOI+
 w+CvWCzfBT9DMgbZ0ayQCMyNMC0Mfx77tDirYGPWGqauUZm32ijZtgQIN
 3PkQCF/75kjwqb9yYQU8D30J0aOnUhn/lBOJPpyuxiYNDNvYLeu4o6CQL
 LMUhmmVgwe1xuRYynTBKYJp7iRFN7B0WlgcNcwOzVD5bRv0u+MbBlitrF A==;
X-CSE-ConnectionGUID: DmoaLnpgSd+X35AGgSXPYg==
X-CSE-MsgGUID: nTG5EcvIQhSArIWRB7rsJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="57405690"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="57405690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 23:30:26 -0700
X-CSE-ConnectionGUID: 2mpta9geTeWizwbLy9uydw==
X-CSE-MsgGUID: d+6wWo6fQEe8Y4uZVwAJJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136603332"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 23:30:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 23:30:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 23:30:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 23:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkyMv9Cps12iepFt8+jsB7uqrkd7UyBJP6V2GWySmSq5HCgAtph9hWWjSDVrr+oD7rMTP8NOqKqHGAf/2HmDtPrVL18poSgmFGZd/CSyLqxj/qaHfVN3og4fXPqyKnD1WVwCtxjt2Q7Zng7GEoZ7olA1HzpX1YyvFHEF94TRPOy9sghw3jGd7ZEExfR4PVk1nNQRhsXrwMFaBkH2ErTtS+9hey6FFE8dsWNRVmlbAssziJ3Hfpzi8wdEar8Cjlv7kV9PcsacM9IYQHOSMmb0jpf2w8my8nt/AR/hL8Bfd3kpvUZWGii6GDWxKK9esKZ0ReqUJQCoQnPV2kAukSK8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewNJRIyd2baNHjv7iMCPVQStSwRPen1+LWVcdPG9HR4=;
 b=VJU6EXNk6OFVb7e+WGzHjwaSkPBXasPQuEZMzAKRUCffZ6Va1lTjzH1Yh6aJv77Tmv6Q3UlOJXkkDkYawI3LnQR5NO1CTG6LSjt2kXaXa/WMvcWvWzGOaYu8LAqefwpMJ2eJ8pq4QndMLz8J3eY9+ogmceb6eKKwyeno9W2xj2gFPS0KUodMZ/1uoIdN4Z64EjwXN866RQ1LZU7Rz1+pRvroTNlnc9gweix1xf2eLupEcVz4SFIXi2f/mdR7hOgT3uZA7ujoRz6ZfnaQEox3DPspVgiueC2Qj4Uoh7oI6+ulbiB2wlV+rtj5GnzpMmKf7Vrah/2pp7cvgAAPb6b7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 06:29:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 06:29:36 +0000
Message-ID: <695d000c-5969-4dfb-bba8-cf398214f174@intel.com>
Date: Mon, 21 Apr 2025 11:59:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/32] drm/xe/svm: Incase of atomic access ensure
 get_pages happens from vram
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-14-himal.prasad.ghimiray@intel.com>
 <aACBRZD2Up9VNZJm@lstrano-desk.jf.intel.com>
 <6c86072d-5c53-49ac-a482-cb9a5aa9ad71@intel.com>
Content-Language: en-US
In-Reply-To: <6c86072d-5c53-49ac-a482-cb9a5aa9ad71@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 89cf4c14-cdb7-4b35-7177-08dd809de327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzhUaXM1MnJLSmZKNGtrelo4N3gyUEdDN1Jabjd0YXUrZ2tTcTV0QVZyZVZx?=
 =?utf-8?B?S2Q4ZWhKR0pKeEVFSmhSSHorRUFFR2FnLzNFVm1JT2ExK1NQaEY4NVRPa2JN?=
 =?utf-8?B?dXZFbFdSNVRIbXBSWU9YemlPWnoxZTR6djhzRXRma0dsREo5YVRwNUZPcFQ2?=
 =?utf-8?B?aXpvY01EMFVVZUtmWkMrNmlpNHJQaC81bW5qV1p1bEVIcXljNmY4WFRpZWxk?=
 =?utf-8?B?ZzVsV3VDdWxuTU1kSE5uMHlyS1Q5WlFqVnV1bEYzT09FVHlBVk1oUElKRURS?=
 =?utf-8?B?dzNuVFFFSGFuYzJjVVpBTEdlSzFaalJ6MGlGb3BwQ290NXZSampXdzdDcnlN?=
 =?utf-8?B?NlpDb2NuM1VJeGxUM1QxanIrK1lmdTMzQThrajZtcmZQOVVvQmliak9PUW1F?=
 =?utf-8?B?WXEyM25leTY2eW1NeVVtalEwYmUrNlo3UHQ0M3JOb281cXkrU2NKREdndUtW?=
 =?utf-8?B?YnRnalVoWnM1ckRvU0pkZUgxempJeWhiRzNnd3FpY0JxNEhJRVhLeHF5aXZX?=
 =?utf-8?B?c2JpcTJiSjdYNTdzY0xvbkt0Qnd3eWFKTi80YXZMQVcrMkkxekpld2lSN2Jy?=
 =?utf-8?B?bVdza3FxVWJjTWI0eVNRRUJxMmtidnZaQ2dYRGppRVpxc0tPT1VlalpBaWhJ?=
 =?utf-8?B?RDB0Vk9xbGFZM2I4bUp4eGdWUjNmQno3UkxyRGFiSnpHbXpzNGZhdW5NcEVV?=
 =?utf-8?B?M01lNzFReXV3aTBGTXZFMVZQanJIUXlqMkRHQ0JUbDRKWUo1WXB4ZWdTMytE?=
 =?utf-8?B?T2xldDJ0UDlIR242SVovSDJjdUVUMm9hdFArbTgweXNpc0lZS3JXWmI1aFJw?=
 =?utf-8?B?WXBwOTBxTFZFeVArQWFGRUp3eVBSZVF2OGM1TC9kdzg0L2hHVUUxVzM4SVE3?=
 =?utf-8?B?WmZVOGJMbzVyV2JVcmhvUlZxZnVEU0RCak9GZGFWUzZ0bDdoMjRvUkpKelVN?=
 =?utf-8?B?Ujl5d1VodklRNU5QdGFsWUZITlpWOFU0NkNyM1RvTmczaTlRK1hyVkxZaHJI?=
 =?utf-8?B?NCtFOUU0OXNyVGF1YzBuTXI3V0pCTGYxZHFqL0N6ZEdqd3A0dmxrcU1GR1lE?=
 =?utf-8?B?bU4zUlFMWjJQMkVsQmVhV3FjSWFZWnoySUdGQnJLMzYyZ3JvaStGREZadVlM?=
 =?utf-8?B?NkhlRG05cXlQWUZEYTJEdTJMZkllTDMwT24xYjJpczJMcVpKcFlYaTZLWXRw?=
 =?utf-8?B?akdwYVl2ekZkUFFWVnYyWng1U0ZBU0VHdWg0ejUveXQzNWdWMkhSdjRNVWc0?=
 =?utf-8?B?ZXFkTVZVLzh1SHlXbXJCZHozREt4K3ZhK1pMTERUZlZhNjJsR1BaQ3hWUUhj?=
 =?utf-8?B?YUprV2NCQ2N0eWZmWkxoNmRJZ2x2R2MvK2k2UEdXT2ZqdExZYTVyRkVVY2lY?=
 =?utf-8?B?dUtMZVVwT1BBUUdOSUM2Nk5tNTV6eGJlM1h5bm0vUDdxNHlndTZralQ2RmYr?=
 =?utf-8?B?VEh4VGZFRnYvNEJ1QmM4Y29VUis1NG5ZSU93K3ZsWCsrZVpKblc3eElsa1Z2?=
 =?utf-8?B?STZHY1pLTFk4VnpIbFFRWnZGUzBmcVh5TUwzajdqSXpkaE90VVdvdHlkVDdY?=
 =?utf-8?B?SG9ac1FhL3c0emtvWWNLdFNJckRsTUUrRzlSTVpMUGlLOVNjMlU5U3ZyZ3pr?=
 =?utf-8?B?STBzWG12QkNaRURFZUpsL3pZSjhSQkw2TjVrU3MwNFZWT3NjQmc5ZkpwY0Ns?=
 =?utf-8?B?MkR4OVdJWDBxVDFUV3hkMXZrZFl1eDdIWnprZzVzb2dsY2JSWDRCY3FDTjRj?=
 =?utf-8?B?djlHWDd0L1I5SnRGRXZxaHVpMHJDalhFQWRoN2lsMlE0QW91VzBQdXpOZGRp?=
 =?utf-8?Q?5lUH3Dv3S/uB3ZD3H+c3Na1gJ5cMWW/ZGe+fQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1grWkRicnVuY2EwZ1c4dTg5eDVuNUdOQWFWUmttL2x4WnVkYjE5ODhocFpX?=
 =?utf-8?B?RnNaTmVzZTc1VkU0OVJBWWlBdWltdTk2RDQwSHhKQXRPeFpNVGNWVGYrOVFy?=
 =?utf-8?B?MjhQTEpRS1JDazR3UTR4Qmk3WUtzazFrZ1RMeVorbEhOYWZ5Z1JhSkcwZHRn?=
 =?utf-8?B?bittTlZUaHBTWXFINnZ4VVNLd25BdDBmeXNzdEEzU0xzQnhjd1N1cVBwajk3?=
 =?utf-8?B?QmpEMTQzVnJUMnAwcFFUa2ROZ2dTeE9lTG1WcHl4aFJ5S3pDZVZVaERYTmlq?=
 =?utf-8?B?UE8za0JLMnFwOE1IMGRYMVg2OFFwZFZLbEhkeFdKM2RHU0hVcTNHdll1dUlV?=
 =?utf-8?B?STVTSWVNcDZYalEwWHdndUU1YWZvTGU1NW56RWlKM293YkUyMmFJL2FjbDZ1?=
 =?utf-8?B?ZjhwamhtQ1FIelU3MUpyUWVDMFR1NUI5RTNYa1ZjYzdkdVllakMrSjNOYU9C?=
 =?utf-8?B?cjRNYVRwM3RjSWlwRkdVVkh1OU1FODA4Y1I1YzNkOVFYRjlkZXB5WTZyeFZo?=
 =?utf-8?B?NUdhVDFPV1pFTWlRbTlCOXFjTnFXWHdZN1VpUi8wbWJ4akRDT2F6d0lQTU5U?=
 =?utf-8?B?M0l6MkhKME14TmtFOGFUdVVFNVo1OGM0NHdrTWFLcTQrSjI4ZWZVcVZYU3dz?=
 =?utf-8?B?SlpDTlZEb3d6c2o4ZTFYRjVlTkd1UFJjZmk4MitQOEVvQnJpNjZzRlI5WmhK?=
 =?utf-8?B?aUwraHROaWNNM2E1ZTNBMXZQNU96OGpTazUzWjVWVGhKaG9nL1lRUFUrMUtO?=
 =?utf-8?B?WlVRQlJCZnFvVzJOYWUrSGFDM1AxNmt3R2pzTHFZUzI3NDY2UlNYNEdKSDJQ?=
 =?utf-8?B?Zk1CVnZ3SXhMVWQ0aFJTeDlwTjNreXRjekx2WExSVFVIdmwwY3hWN1ZIOGMv?=
 =?utf-8?B?NUFQTzRaOUxERmFMUU05cCtBZUZRd0xoUnRhZFVJdTJQTURKTVlCMjg3RFUx?=
 =?utf-8?B?UDRzUlJGd2Y2Si91dXQ2SFFxWlBOUDlxTXBPK241TmIwVGx3TE1oT3Jtc0FJ?=
 =?utf-8?B?UXBqR0k3VWlwWWtPeFlsUjZMck9oUHYzTWFZemZrNlB0b3JpcHBFdGZMMWlz?=
 =?utf-8?B?NmtDWHgxcFNTa0ZqTFNnWWFqTjYrQnpyY2c2YmlCS3RHMUE0V0ZmMnl1OUFI?=
 =?utf-8?B?dGdxZXdIcWdIQUIwakZxM2RWTE1YV0lkUnlzWC9STFJVdGxoYjM2dU5tRjJk?=
 =?utf-8?B?NzNKczZnbTh0SG56WXE0TTRpcTIvN1RpR09ra2d1amtDM2R3MUhMcmdtWGhp?=
 =?utf-8?B?RHFlSjVka0V4aXJXSXVUNlBLcnd1bnQzRndBZHRRT244em5YaWhkT1dKYlBy?=
 =?utf-8?B?dE9Sbm9xNTA4WWNMQXA1ZlQ5c0J0b1FWdW9nc21YTTg1TzV4bUNZMzY2RjV3?=
 =?utf-8?B?Sk83clBTK3AzR3docGJ4TTdtdmhlQ2pCSUZDQWNPT3QrTlFlR3h5RVBwU1dG?=
 =?utf-8?B?S29vc2tFTVRQSlNLaDRKQ1pHQ2FEdVhQMHlxdHlzbUNUZXA3YXJWdGJsRXU2?=
 =?utf-8?B?aGpmYWxCSlZLaTUwb1RqcklyRm9LeENycTVuRWdEQzNCR1VqN29SZklHdndS?=
 =?utf-8?B?NU80NjIyQy9ISThEa3RpK1JFVzFNclRMMnpQK2VpRHRaVHlSY0g1b1pDNVlT?=
 =?utf-8?B?ZHpGclRuMFRSM1ZXdGNFSDU2ZysxWkxwQ0hENFdUaGxBWmxNWGtpcjFOOWFu?=
 =?utf-8?B?UFFjVWFOTHEzRU40UHB0TXYxWWV3N3cvdDZqUXlIaTd3VEtzK3NFeDVYT3Fo?=
 =?utf-8?B?bnQ4N050VVZDQmgzWHJtZmZWc3QzZ1BMVWRraFBOMmdFNUV6ZWE4RW90Z2Fy?=
 =?utf-8?B?eklFZUJFK0xSRDJUR2xjSTNqVHBrYkV3YVhiTVYzUUsvZkdlMGJmQUJDR2Jo?=
 =?utf-8?B?MmNndEdEUHh5Rm0xZTNWS2tJNW1nbnNmUFJvU1puU2FxRTNQWkYzNnpiRm12?=
 =?utf-8?B?c28xZGFmT1l0Um9TZEpOUE9sRGhNdVUrODBRZ3Zwb1p4azJldytDdjhtdlBs?=
 =?utf-8?B?UGxJNUt2ZlF2YVhJVGZIWGZwRCtCREFrRHFjTkFmdnBTQjQ0Rkw5L1pwQXNv?=
 =?utf-8?B?TkdDcjBhVmZNRmZGaFl3UVRJWUw0RjVNajhjN05xN0NVOUYySUxIZW1pOHdG?=
 =?utf-8?B?Y09GQjVwbUprL0c4QW9qWWpPWGhXajVpcER0KzI3RmZ3MDJTc0psS2hCejRC?=
 =?utf-8?Q?0Jlly3LWXtnOG6pSDA6H+C0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cf4c14-cdb7-4b35-7177-08dd809de327
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:29:36.8714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJpd50dUmOPI97ztX0VUwJDK/0tNRdCLWklT5lU1LbjTSF5NxWaqLMWqy9q04lDTx2j8WHibtSpsWpRf6o4AUquieIuI6UXTVAYwIlQa36I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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



On 21-04-2025 10:28, Ghimiray, Himal Prasad wrote:
> 
> 
> On 17-04-2025 09:49, Matthew Brost wrote:
>> On Mon, Apr 07, 2025 at 03:47:00PM +0530, Himal Prasad Ghimiray wrote:
>>> Ranges can be invalidated in between vram allocation and get_pages,
>>> ensure the dma mapping is happening from vram only incase of atomic
>>> access. Retry 3 times before calling out fault in case of concurrent
>>> cpu/gpu access.
>>>
>>
>> Again I pulled this patch into a series which will minimally enable
>> atomics per UMD request. See the version of the patch [1] I landed on -
>> that is basically my review feedback. I took ownership but left SoB by
>> you as it based on this patch. We will need another reviewer though as
>> we are both contributors but feel to comment there.
> 
> Thanks for update. Will use the version you modified for the prefetch 
> series too. It looks good to me.

Actually, I see a retry count check missing for get_pages in
https://patchwork.freedesktop.org/patch/649010/?series=147846&rev=2 
which might lead to infinite loop of get_pages retry from vram.


>   >
>> Matt
>>
>> [1] https://patchwork.freedesktop.org/patch/649010/?series=147846&rev=2
>>
>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_svm.c | 43 ++++++++++++++++++++++++-------------
>>>   1 file changed, 28 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>> index f4ae3feaf9d3..7ec7ecd7eb1f 100644
>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>> @@ -778,11 +778,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, 
>>> struct xe_vma *vma,
>>>               IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>>>           .check_pages_threshold = IS_DGFX(vm->xe) &&
>>>               IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>>> +        .vram_only = 0,
>>>       };
>>>       struct xe_svm_range *range;
>>>       struct drm_exec exec;
>>>       struct dma_fence *fence;
>>>       struct xe_tile *tile = gt_to_tile(gt);
>>> +    int retry_count = 3;
>>>       ktime_t end = 0;
>>>       int err;
>>> @@ -792,6 +794,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, 
>>> struct xe_vma *vma,
>>>       xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>>>   retry:
>>> +    retry_count--;
>>>       /* Always process UNMAPs first so view SVM ranges is current */
>>>       err = xe_svm_garbage_collector(vm);
>>>       if (err)
>>> @@ -807,30 +810,40 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, 
>>> struct xe_vma *vma,
>>>       range_debug(range, "PAGE FAULT");
>>> -    /* XXX: Add migration policy, for now migrate range once */
>>> -    if (!range->skip_migrate &&
>>> -        xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm- 
>>> >xe))) {
>>> -        range->skip_migrate = true;
>>> -
>>> +    if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm- 
>>> >xe))) {
>>>           err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>>>           if (err) {
>>> -            drm_dbg(&vm->xe->drm,
>>> -                "VRAM allocation failed, falling back to "
>>> -                "retrying fault, asid=%u, errno=%pe\n",
>>> -                vm->usm.asid, ERR_PTR(err));
>>> -            goto retry;
>>> +            if (retry_count) {
>>> +                drm_dbg(&vm->xe->drm,
>>> +                    "VRAM allocation failed, falling back to 
>>> retrying fault, asid=%u, errno=%pe\n",
>>> +                    vm->usm.asid, ERR_PTR(err));
>>> +                goto retry;
>>> +            } else {
>>> +                drm_err(&vm->xe->drm,
>>> +                    "VRAM allocation failed, retry count exceeded, 
>>> asid=%u, errno=%pe\n",
>>> +                    vm->usm.asid, ERR_PTR(err));
>>> +                return err;
>>> +            }
>>>           }
>>> +
>>>       }
>>> +    if (atomic)
>>> +        ctx.vram_only = 1;
>>> +
>>>       range_debug(range, "GET PAGES");
>>>       err = xe_svm_range_get_pages(vm, range, &ctx);
>>>       /* Corner where CPU mappings have changed */
>>>       if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
>>> -        drm_dbg(&vm->xe->drm,
>>> -            "Get pages failed, falling back to retrying, asid=%u, 
>>> gpusvm=%p, errno=%pe\n",
>>> -            vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>>> -        range_debug(range, "PAGE FAULT - RETRY PAGES");
>>> -        goto retry;
>>> +        if (retry_count) {
>>> +            drm_dbg(&vm->xe->drm, "Get pages failed, falling back to 
>>> retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>>> +                vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>>> +            range_debug(range, "PAGE FAULT - RETRY PAGES");
>>> +            goto retry;
>>> +        } else {
>>> +            drm_err(&vm->xe->drm, "Get pages failed,, retry count 
>>> exceeded, asid=%u,, errno=%pe\n",
>>> +                vm->usm.asid, ERR_PTR(err));
>>> +        }
>>>       }
>>>       if (err) {
>>>           range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
>>> -- 
>>> 2.34.1
>>>
> 

