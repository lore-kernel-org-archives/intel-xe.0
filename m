Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B59CC6B1A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 09:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70110E02D;
	Wed, 14 Oct 2026 09:28:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4845710E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Oct 2026 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791970113; x=1823506113;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lq+I4kHYrX4AlGUi8zGO2WKHJRmjxtJP4IKP0WD1t2c=;
 b=RPe/8VzCH93M5dQVWYIoXWQDAMfZAXN5kDc2hT9z6SFAZVDYg/F46oy5
 QUQ1RIsxvVTMPFfMCm6GrxFpp3O8mrJvjcClHvA3VgYQvFgJ9wRiCqr1F
 yXi2URhbU/fQb2V7g+NRbtUbnu1YbpTPg0xr55lQpw6qXTisaQ744vqv4
 RJrL06bTlK2wRLRfcBSaAnM24T51g36egZeEJcvmNARGHhY/1H4owRPt0
 uLJdVPnhEvdbzMdbapiLlbpn5lBBM5T6Y+070RqRVPCZpokoStEOPwnve
 UgR8BGim/XMxolbTtttlHnsc6egtlM/IpVKBI44Um1xTrO8ijzrVpLHHn Q==;
X-CSE-ConnectionGUID: tuQrOoOIS3yFAedJH4flXA==
X-CSE-MsgGUID: 1fs8dyjnT2WxdeR0/7Jtjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="612032"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="612032"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:28:32 -0700
X-CSE-ConnectionGUID: P8VJ2uQiTvCvADCQ3A1pMQ==
X-CSE-MsgGUID: 68QzJ7QTRpetZ8dwxC5TaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1845290"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 02:28:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:28:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 02:28:30 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.69)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 02:28:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xcu6axrGrhFnMTRSwCPlWMI4I56jM6JnmCCp2354Vq6DGVYdVxCqxPzSmGSifpdoajZqbnoeSMj+HjA+Nhd4Kvx2CPocbQcBQzEneZ3I2wCpkfpl2YKNcJSYDJoRWUAS0uCdq3swz4HOxY5VTWGJBGzNwx3trnqNGjksNc8+RGH3GwQgjQGyGFHO51y5E9ZcFyNqwI0C97iSYZHTwIjBYlIc+eEZAVQu+ce/fPb0ichuA/vWYuBZUxwQ30cjD7KZwvSNMnATSMPfdVR2LGjeNmxOSHCmPP4u+8TjU7F21hjqL7W/NhainqJi55CKaqWwIYGFncXR5Fu7T6sGlLUI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//9v1WYnZCS4ZkFXX3gJEgWI7m2u7ptx4TJ4svMq9tc=;
 b=kP8Wah3BgIRnnx/3tHBhwotARPbmaV8Tzm/mxfWkY0YoPep8OyxSkIhPXcBof9GyZWYBK8Ugrl5rlIeu/s1H7D+SY0njbaontSBwy9le4FxkGasl77lrqr7dRHWduVOkXNX2bWdeV0JuBPXkyTJRXTVKM5wnkczltZXAWHtPKoznXkh1tBSpmhgeHFfcrZT5GkpJkrkOpcAER5DNptejK4ReqADOS87nvQTZGxLHdhGtknG/X7rKSiKlpkFqxx9SaCYizWdAx9bU+7RIJmups6cgLtvrG4/XFQFfpfPvHWT85yBNn+TxqgOe0mwV+cd7RYNZE4dlSM3vO2YmXgqsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Wed, 14 Oct
 2026 09:28:23 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 09:28:22 +0000
Message-ID: <4db5864f-c058-4609-a563-efcea4b5b4a5@intel.com>
Date: Wed, 14 Oct 2026 14:58:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] drm/xe/xe_ras: Report core compute errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <arvind.yadav@intel.com>,
 <syed.abdul.muqthyar.ahmed@intel.com>, <nitin.r.gote@intel.com>,
 <pravalika.gurram@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-24-badal.nilawar@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261009104602.1075405-24-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0357.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::6) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS0PR11MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f9c620-2881-4b0e-1c6c-08df29d57d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|56012099006|261009223027099003|4143699003|11063799006|10067099003|22082099003|18002099003|261009221227099003;
X-Microsoft-Antispam-Message-Info: CCi/2JErNCu+ZO+j3TWvG6fQyqkoAUw8cVitzHN1VfNJkEaelgS0OXQOGtaBigS089mLKJU43R75s2vPKLUhv7fh1Sb+iP/PahbPd5FJ5CbEgXRBEpj52BlWWSAuPOlJz1BxjMl/aau7qIna4zV2yQJBsc3G7xs9H/KAok5BbADUyxVUM1WmrDJSALM76XRmK0NaZVdR0KD3Yay6ZfBLFW0zqGcyBo1+xmVKsEeCjRdhQQf1hJ6T/caQzNZxfCfYjllEoVg7Rcavp/mapBDRUVeCu3xi/FLE/U9ChQUWlSP7wI6jWr0tDCtArrCoYbpSKhq80jQxw5878DL+T3VEKh8/AJ7aOcDpqSf27WJdjkmXFJM53Ztq14wnqYPAk2jp7SUTUk11i+Yfz7EvAIRFvJ8HFk2kr+I8gTa7jXytOM7T9P/V2w8JIoNHKH45tv96Ce5mJhb7A93rIoIxSD/x6qLOZVFTCaHDdYO2MubkSO0MSKKl1CGmGi4CB9gKEjh0GwtOH7fv1Y/MaTGlI9x1gfVGYI8MFyCK1OdHAPWoJ1gG8zmkGGudjy6cADxDi+L7rgS9XZBhggRJOSBlYggxv9sl/sQQ96QYVd7PL3taxZQnslcLYPmnUKbEei3cVnxLhECKFVUbyiHnBZzrJ/EGAcv7x6/+rlfSVPtomFciVIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(261009223027099003)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(261009221227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHNwNktOVGJLUDZ0a2VtMHg2WmxXQU1PYTJqa1c0QnVCTVBUbno1SmhYVk9N?=
 =?utf-8?B?cXdiU0RSQzkwZkNHODluemFpamJTYXJRNHVXNHhkTHFIODlyWjhSUHd5Q3l1?=
 =?utf-8?B?SWFBMVRpTkFRRStQNEhuTTdxRC96bjRYK1g0aGhKTTY3eG9FZ0o2SWlYbjZq?=
 =?utf-8?B?SXJxRDJqUmpTWWtqdTZpaVR2ZG1mTytlaFFCTm40RGU3bWlHTWxITUQvYkZ2?=
 =?utf-8?B?dHlNOERiaDRFY0tBMEFTRTJGUTJRV3NuaDFIZlhTQ2J6Q0xzZTAvWXllTnVP?=
 =?utf-8?B?L3ZGa3NUUmtpLzUzdVdtMWFsN1V3NzRvbFJjczZXYTBGdzZSRlEya0Y2ZHRa?=
 =?utf-8?B?N29RVjQ5bGg0Rit3STBMZkNFZUYwcjBxMmQ0YkZqUzNMWjZLeGYvbW1rZzVw?=
 =?utf-8?B?RnduTDFET0ZBbE82ZExZNW1zT3RqSXVVcitFRUdTZGRJYXhhekxCR0VIdTdy?=
 =?utf-8?B?ek16bmMzQXRud2JHa09JWjNGYXNkTk9QbUYwZmZSa09FYU5jOTBPeWNYV0J0?=
 =?utf-8?B?UkdBQWt5UzcvQnRmRTU0L0liTWNhcWdmSGxYV05ZN2h2UTIvS2l5aEVYR281?=
 =?utf-8?B?MVYyK3ROUGZMdC9UUDdIcmVTYlM1N2M0TzlnMGxCZHlKaVNXb2RiWkVSRWU0?=
 =?utf-8?B?b1I3S3BjZmJOTEN1cTFuOHprOXF1RTZqd0VrUHBNb05rbm4rdEpjUkFYTk1Z?=
 =?utf-8?B?a05YUzhzMGIrNVZ6cGJwNk9zUW9lTTh3UmRHN1dKQjFjcm4rbVltU0dZdkJG?=
 =?utf-8?B?TG0vb1czQU9IUXJxUCtEaVNBdGNRa0hMZ1RJOVQyV0FtQTFXNndnbFlWbEVq?=
 =?utf-8?B?VExZWEFhUmV5dThIWUQ5MVliRUcxV1VUbG5VcVlJRUxCcVR5MUY2Q2c3d2Jp?=
 =?utf-8?B?dFJhU1I5WjMvZTZETHdjVTdlY09GRDVXQ0J3YnhhWS8wbS9iU3REODY4ZnZ5?=
 =?utf-8?B?MXBhYVFFMVZWaFBDRWJqbFJ0RmFoaHJOQnlBeW5hMmp0MzhsQVFpN29lcldM?=
 =?utf-8?B?cmFNMkVTaGVPdWtVZ0tQS3BlUXo4OC9KVEROZTFkZENSWXh1bW53OGtHZi9V?=
 =?utf-8?B?WEtzalFYaEZkRXJ4V1Njcml6b0NXR0thdmQ1SElNZkZXZjhkVDlnOWdLTVJz?=
 =?utf-8?B?cG9GSlBZRHpRU3NTa2lTdHp1ZFJZQkRBQnhUOGJ0eVFJaTMvYy9Xcnh0M2JB?=
 =?utf-8?B?TXB4QzM0Vk1mTTRMaDM2T1ZtbnVjeWp0bVJOamRTNEJNb3pjVzFSWUFYbEo5?=
 =?utf-8?B?M2lvK3U1YTl0WnZkRVZjcjRQWWNMS0U0OHd4VEN6ckhrU3dsOFRGaDhoY2xn?=
 =?utf-8?B?YnVMWFlld25heU12YmZ4Ynk1S09ncU9GUDBWelZ6WEpOd29SZCtqbkNNMDF3?=
 =?utf-8?B?RVIvajljYTZFRXRyd1I2WHpNa3pLWWpydlM2SUNtbEF0d1RuSm5WcXY1OUwr?=
 =?utf-8?B?bDl6Sm9aK1lobko2ZXA5VTJnT3pTbDZ0K0tFOWdITVJyMVZpZjg2ZUtGQTJV?=
 =?utf-8?B?WGsyTnRVM2ppeVNKOFh1aGNRdER1NHYrOFJnWW5Db0RwQ3BMMlQ3R2Q1UGVY?=
 =?utf-8?B?SUprRzVibGdGdFpFdWcvR0tEMmtMRWJaTVNuZlpEelRka2UzWUNvSTVaZ1dx?=
 =?utf-8?B?cUVKUjJhUzN3eWFPbk1uOEZjbWs4VDBKZ2ZIYlZnVmNkYjFpdEc3NVdpYWJv?=
 =?utf-8?B?T3pmN3d0U3dwQmtsSnhhckpvSGZLTEpTekcxZHRFVlQ2NUlVV3NRd2ZKZVFN?=
 =?utf-8?B?R0lzQzhtTHY2Rk10Tk8vUzl2bW1qREZOc2JibjJCWWlicjR5SDRxWGU1TDF5?=
 =?utf-8?B?K0ZpQnA2L0pNV0s1VjdlWnpSN2ptNllIdkh0Z0xoaFM2dHJTdUNmTm9zZ2t3?=
 =?utf-8?B?Vk5rOFlvOHRVdUVITW5kSDZjemQzYXMvbU9BUHArREQ2UWpBdVRDU09pNjl2?=
 =?utf-8?B?Q1Vja1NMOWtRVDdEaFRtMkNDVlE2OVJqOXpLaThUUjVYdnhSdXI3KzNYckwx?=
 =?utf-8?B?T3UwSDRScnhxS2VCNFMwRjN0NnF4MVN3K1hjbzVDQ0lvNlFHWW14eEIvdHly?=
 =?utf-8?B?VkJKdkdSUmt2dzhTSlZqSEd6WVBFcDAzQWhpMVFFcStDK1lJZXlyaDVIUGNy?=
 =?utf-8?B?UzJZVVNadXRjMDdwSVpiVGNvQ21FeXFTcHJhUnJPeDI3eVk2c0V0U0g1M1Mw?=
 =?utf-8?B?Zk1QMjRCamdITWpleExUZTVLT29RWjlZZ0pJVC9RTXpWbFZTSFJXa1gzSnp2?=
 =?utf-8?B?RFM4L1puOTRJWWtVS2hqMlJVMTJJbDlXNTF3T2svYlU0WkdxelRKNVNNb2hO?=
 =?utf-8?B?dm4yQTc4V3VnQ2dTdEFJaXcyYkRlRi9iY2ZFSkExVDBrcE5LaDFyNmpxTlB5?=
 =?utf-8?Q?XEK//mYC0qeVvip8=3D?=
X-Exchange-RoutingPolicyChecked: 5txYtzOk+cQnX8KHebvi4TLfUBrWGtD4QVXNLAP318ujZDIJiZGXzgOhakmiMONvgA2+u/4W/Vywq4baiE6ofneTC01/ulI2wRRnR6g5tkJYCr4MSotqASh/7fV1xZCBjSRvWyr8Hoak/ILzd+CAZxBYjG/Ieo2cPJUB09a8vMLjvaJmVCV/QQZ4ahXPGbKyMBFwcJWp/380cpDeEeHmq7HD25ZtCrLRdm9KCt7mjys/aUoF/48VHXF0gA24LLk0WRlBOgTtXJuWwhUTteqTSe2XpYdz7OznOsCI4tarINwCIU5cLsG52NjLqGbOaGFkKLoD9yD/UoI0T1ulkUONEg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f9c620-2881-4b0e-1c6c-08df29d57d90
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 09:28:22.4715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7veGqUNHzthb5UaMjvO+nivJbJtpvViBYpCyTZzvRRCJ+jvyQ51iIy8ya0yoLn5ZR93dO84l6I7CbbMTI4RbKdbp+a49hcNj7/yI3qrAUho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
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


On 09-10-2026 04:16 pm, Badal Nilawar wrote:
> Use xe_log_* helpers to report core compute errors.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2:
>    - Pass RAS firmware reported severity to xe_log
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 8ed4a6992ef1..6647300c7f17 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -332,21 +332,27 @@ static void ras_send_error_event(struct xe_device *xe, u8 severity, u8 component
>   	xe_drm_ras_event(xe, drm_component, drm_severity, response.value);
>   }
>   
> -static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
> +static u8 handle_core_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>   {
>   	struct xe_ras_compute_error *error_info = (void *)arr->details;
> +	u8 cper_sev = ras_sev_to_cper_sev(arr->counter.common.severity);
>   	u8 uncorr_type;
>   
>   	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->log_header);
>   
>   	/* Request a reset if error is global */
> -	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR) {
> +		xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
> +			    "Global uncorrectable error detected\n");
>   		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}
>   
>   	/*
>   	 * No action needed for other errors.
>   	 * Local errors are recovered using an engine reset by GuC.
>   	 */
> +	xe_log_comp(xe, cper_sev, CORE_COMPUTE, &arr->counter, sizeof(arr->counter),
> +		    "Other compute errors\n");
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> @@ -592,7 +598,7 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   
>   			switch (component) {
>   			case XE_RAS_COMP_CORE_COMPUTE:
> -				action = handle_core_compute_errors(arr);
> +				action = handle_core_compute_errors(xe, arr);
>   				break;
>   			case XE_RAS_COMP_SOC_INTERNAL:
>   				action = handle_soc_internal_errors(xe, arr);
