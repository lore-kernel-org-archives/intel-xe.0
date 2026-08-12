Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8975C5CFDB
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D41D10EF9D;
	Wed, 12 Aug 2026 12:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NRNlhLr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C883710EF9B
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786537488; x=1818073488;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u76odiA+9lG3WK/OIn4KSC34zFQQ54r/u/e4JpuCFdk=;
 b=NRNlhLr1K6IpBr7mCIK1BSMwE7OWS49v7nIOi7/P/3bfdFGwG3t662xd
 cUzJQUuRwu/2woYJQ13CpSJgAROPHM+1b5+usY/a04PKj0Csf6chUEXZ5
 6kttzsPlHB0Qj2wnoTjtHkBB8ps0quY4Xz9k2QghRVIIB+Tp8vqiCza7u
 e4TTVX7n/cNG77Oebkp3KBoVOvNCZqOPz6q648dar0f3rD2GqeQopMwmT
 GNTHwQm2EQRwkrQWXEsSnrE2uADcGkMuCqGp6GkmtfiHtndv0QQMTAh6r
 5oh1yj1hNC4o9TnGHZ9O8UOKsPhm73PVK7pHOG63e/IIcr6c1wB9R0MRz g==;
X-CSE-ConnectionGUID: DWk0EWe9TcmPkQfJ7Xl0PA==
X-CSE-MsgGUID: PfhPtt/JTY+3d+YydurpEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="97676621"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="97676621"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:24:47 -0700
X-CSE-ConnectionGUID: Y11kDnhGRl2pVpEeEVieLA==
X-CSE-MsgGUID: cgAShk4TRGSaeVD91w0Lug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="257431578"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:24:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:24:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 05:24:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:24:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c95LfF/JoaZOmqgMkoJtHVlTXl44Jzjgsh3VYCRtBiXbUZgk/V7lIafAf1vNVfG6vPwoEFxA5MhOc8blhPT3g+mCl6DPnGrVNmDSANxu8tLQ5YLsw9hHxuYoLfTsl+6QtAYR7ky9UUsrDtt/A7ZCsgXUqGgUsE290sb/hipgBiLXGtUwMRuz7n2AWZ/vYK6mh1vHOC0ueDBNkfeaeMF761LWZNSIniCvd8kIP6n+Kbu6yMLSJ5+CCMQ3zqSqhVvBq/noG/NXj18uzhbgUfuQCJb+2bzQThlPX+8X2RpG1uB+FTNyxh/BgdDXR53PLCfsdym263lj3dobB/efT5Wn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81xdwNqdcrsqxv5g+RXf9Tf3Ajmch25XGDQxIKJxWJQ=;
 b=MgSx66MnjZRDtMaJBDZOomxEV7wDM5knmNQsKFSn4H1HXV+a24M92aRx9s8pwSHGQAd3VL3A9Q7ID/PBRIrP6iCCeOamd6ia93tPY4qpgI5H9SK2t07OT9WfISbSNpzccrxIr55UReDrilJtO4R4WV1wyta7odNa8h0AZQo4RBtOzbGpnE+Sdqy7I0JMDSP9CznSWRUNHee7raWgnCIrIlju+FhEyNBAnsz9xFPTAJAqk3ZrJkxbHjsUQR6d0uPx4OYWWvbzibtg2MyDk5kDBcHandB1MKhRklyHeaxhw1iH1FWpLO4pp8zv3x/PVwBv2eRYlDx5KvzBf/nQezsN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by LV2PR11MB6048.namprd11.prod.outlook.com
 (2603:10b6:408:178::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 12:24:37 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Wed, 12 Aug 2026
 12:24:37 +0000
Message-ID: <7134f9ad-1244-478e-9e0f-7c4eccc8de1b@intel.com>
Date: Wed, 12 Aug 2026 17:54:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 13/14] drm/xe/uapi: Expose ban reason in
 EXEC_QUEUE_GET_PROPERTY_BAN
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, "Michal
 Mrozek" <michal.mrozek@intel.com>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-29-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-29-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::18) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 611fd3a0-e50e-4a89-571b-08def86cace7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: zkgWmQvXXDuP4NSvnRxMy8tgG/f5+Y4F2K0Wh1bdoTek9L40lK8ZNpFm7cAdVboIu/OPQMYPIBUpl9g/JFvIZmAvcjy2aSoZFo2vSS66G2yE84583dy58neL06YDxch57FQJl3AOzgr1BI3IDZCYt1wZqCPUoXbnRlnQ2S91mNIbnvnQJW7zVXWUlzVsE9yMemAD3BtS4O0i3/Y5si3CsocWVZ1hgwdRSbCaYHAqgGux/ZVLcZYUrqnHCQohM43j/rvG6+YSD/4UPyla0DuzldJuCVmsFXIWEcPx3RIlP1Ehx1Fn/swpPtVsZSxQ9s3EltVo4UNG1O+5gVy/waalHqmuhGKVRlJuvNEhSRAquNASWmpGlmrHajjI2evo4w7f3DI8qcgpfoUeX5P14x7aNd0ruip14zea/VcDZ3iu8iEpV7nY6bGllex9Cymabx0jAmlMXlHQOA7MTV0Aeduxqh7KzwTnqySKlpeEA7CIrN7uMfsgH+N5hX3Lw5uoAHP1V3mY148V87xknTd5jAz7Bo9IsMHAuqSUGjr00lY1HH6TA3rZQo5+oQlH1PzwjEvRV6gFesKWJGL/Jq682o45NPo7rT5Soyc4jW1YcZlZ9E6FzK15rwZbVkNlU5azAaGDU8Wfi1khKdXoea/T75Or9P3/TzsgsAWw0I2l55xmUlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHBoNFBieS95ZVpvMzkyb2RQcWpVOHRyZXhvdm1vUjQ2ckpSN01JaDFyaG5h?=
 =?utf-8?B?M0cvME5UWFFaWEs3U0lKYXBkUUtHR1RPZjNGSExEQ1JiU1U3K0tyYngxQ1N0?=
 =?utf-8?B?a0t2cnFoQ1NPQWJkZmhnU0s3OGdUamphRUJkRXZMQVBSNWxxYiszeWZRNjB6?=
 =?utf-8?B?T0dMYURwQjVSSHAxbUZ1clJScDUwM3ZqQmdrdDBWRXhZaFpvY2dWKzBzcTRF?=
 =?utf-8?B?Qml6cWRqdjRoMklUeFUxSzhuTGhkY2lGWjBSYVl6R1g5Y0ZJRzMyNXQyZTNn?=
 =?utf-8?B?S0FydVRZUThiTEVXMmtOemVINFU3SWNZeWNlclpVOW9lcEZoNlBRMmVKNDU2?=
 =?utf-8?B?SzdzYWxSMGNLREJ3UG1tWFdGdnJDYTV6MzZEMGV2Z3hWTkd4emhFWit4cm9U?=
 =?utf-8?B?Y0loUnpKZlFGdWIwbU55K2J0VS9DV0NqbWo2RWx2L0Q2RUlPRnBhNk91OVEy?=
 =?utf-8?B?QVZOcEtmRnY2SkRsSnNzT083ZTVra0phUVl0L3F6T3c4TXgzOHpLcWJWclc2?=
 =?utf-8?B?aHIrY2dIaTRzK2JqUzM4Zkl2QXpwdUpNMXltSjE2N1Y3Sm9Gb2ZKQk5xYXlt?=
 =?utf-8?B?b2piSmRqT2gwMEZ0YXFQRDZqNHV0RHNReVgrYlRPMEViQmVNZWhEZnFTNi90?=
 =?utf-8?B?NkQ0NGxwSXRudk1yTEJ2OXdrWmxzOFhDbzl5ZXB3SVlJOFhWZ2ZNSWVEbXh5?=
 =?utf-8?B?UmNDTHZWL2RTbW1FVm9GdGZEN1RoYTh6NHVheUl6Q25zZkZRZXFmWGdSdUlE?=
 =?utf-8?B?MjBscmNiamtucXEzaUtTOE9XdXJScWRTbCszVEdXUS81Z21pdU9TOVEySWdM?=
 =?utf-8?B?MFUxYVBKWUxWTVJKc05RZXUwRTJkK0FIS1FxYStQRldINklKWHU0aW0rRXpp?=
 =?utf-8?B?aUJzSG5LNDR1UEo5SnpDbFJUMzJKK2I5dlV5aG9JR05QenNiS3Z0c0RQeC9o?=
 =?utf-8?B?RlNlekQyaU5icFJRYUwwTDJ0QStsNkZJTWRMd1hxRmNwc2xldDlib0FQVEpE?=
 =?utf-8?B?c1J1L01HMGdTRGgvcXNrM2ZzTGVvME9wazBUZktNb2JiOFA4aS9aS2xsSklZ?=
 =?utf-8?B?SEMxUm5zNldBS05DRFhDYUdoWkorVUxvOW9HV2diRmlJZnplVFMySFdZUG0x?=
 =?utf-8?B?VzhQQU82TGFsaTAzWmxnaWtQQWRUR2x3dzRING00T3hXZW05a1J1eXlTYXpC?=
 =?utf-8?B?QUlWMEZCM3RTUWtvcVVDUlQ1K2ZGMkRwNUZpcTBIK1c1dlZNVUdUNkFuTW9u?=
 =?utf-8?B?cVVPcnF0MFN4V3MzZ2xvK3M1dTJwNExEUjZDNjJGdHlTK3dYMklHSnRaQ3Er?=
 =?utf-8?B?ekJtNHk2emtiYXc4YTJZRUpCcTh5Z2prUmtTZ0tHZEpNMXJHU3F4ZnpOdXZM?=
 =?utf-8?B?N1orSTBrRHVOWUFZdVBUUC9UWVlmSTNwR3Q2TnQvWGhWTjd6YTlnb2ZLQnR6?=
 =?utf-8?B?ZVl4czNCVHgvelZ1R2RrdFF1ZU43bnlCaDM1OEZMWDZlZ0EwVUJrSjNYYnZm?=
 =?utf-8?B?L3NJUU1jMDVNZlZSVE1NaHJuMmNRb2RwYkFrU3pXZU4vdE5XY0p2WVZLYzFS?=
 =?utf-8?B?Rk5sQjBZZEhMcGJROHJ1Qzl2bW00REhCLzBTK29PeXNIQW5BL0dIakY4aUVv?=
 =?utf-8?B?Z2FkTkZwekRBbHZNbWU2VkRpWG91VUtPQk1jQVg5aTRRLy9sWFVEUCtib3ds?=
 =?utf-8?B?ZnROTjFBL1JaVUVnNE11azJnWjZGYmp1NFBCbCtvazBYS1l3bHg5NStkOFQr?=
 =?utf-8?B?dEsydzIwSHd6Qzl3ZWt6TTA3VzVRNGYxQ1g4dFhkUjh5ZFd1TW9FNDBiOUUr?=
 =?utf-8?B?UmNyYytjOEI1aGZsdkZ2d1JyTU5IbXBkTXJTeGx3NW82TVMrR3BmRm8ySCsw?=
 =?utf-8?B?MXEwQnR6c1crNHZjNnY3bnNTYlFIT1dHcW1QTWNURlBIUlVqZkdHeU84MXNJ?=
 =?utf-8?B?L2dxbFBTaVFoWkIyS01JanI5azR0ZlVkdytGNlRWL3BwVUdGZkh1Rlp4V1FB?=
 =?utf-8?B?VFNKRnpFTHZLbnFIcThITmw1OUZMRmJiMmoxMm5hRVpGdTBITVRZQXdrMjc3?=
 =?utf-8?B?MEhDcDVHTUJldXROenRQOVBSaGYxeE5ORjM3b2N0d012aW9BOU4xdFFPQVV0?=
 =?utf-8?B?ODd0RXVHQy9aSDQyaUtERE5lZ0ZBTHdEWGhLbVo1Q3ZVMS9hcWliNnlwWFJp?=
 =?utf-8?B?UkNiOGlDQjNHbDYzSmlzaHh3OEx0ajZRL2dYWTdSZHh6TTd1KzgyeitUUG5i?=
 =?utf-8?B?RytXNnZhOXdxNDhBdGlmdTEyOTZpYmgzVVhZRlQ0RHcremJMa2pYNHNFWjRw?=
 =?utf-8?B?ZGxrcEVyMGh6ZFNUcE5uNjRvUW13SVhFaTQ4alV5TERLTHlEa2x0RVBXWGF5?=
 =?utf-8?Q?dpD9RvVFLCw8GrPs=3D?=
X-Exchange-RoutingPolicyChecked: P/ttCTqVM3hf/gaTkmJNXpZ/4MGGJL82D31QC/4/C5owCJRpDIHdLPKsGPHlXL58xCXeYlQrA8JS4doAKU98bQllqr4l5/JiAhqgg92SkB07+frVab/MRsn1Ay7si6hVk5V9PiSXm2VG7N+JZd9kuheACoyZaoXPEnHl2JopBG5Ywn+EXkt8vCLZS3dK3X36QL3xJpJrcQn+bNXttOkHc8FSF83X0QiZyxZmRQtomtra1A7xiGavey1DFijmxWOSIePK6QEuUULao0vKuckylgb8yaq7UtynzCwdgANUeu1LUIzLAfRchcCYsbfudS6Kjd1+dNHadvTQ1LaqJ0Qi1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 611fd3a0-e50e-4a89-571b-08def86cace7
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:24:37.6053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SvzQh6iaODBFhntOQfdLomWgtZy192l/ufM2hIqB1K6c8tOpPqtKIHK4lYrbLLVxKrEYmAvg1uzUHEX/qRnMJd+V1jQKq0Vbt7v7UC2uU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> Extend DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN to return a bitmask indicating
> the reason for the ban, rather than a simple boolean. This allows
> userspace to distinguish between different ban causes:
> 
> - DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG (bit 0): exec queue was banned
>    due to a GPU hang or job timeout detected by the TDR.
> - DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE (bit 1): exec queue was
>    banned because a VRAM page backing its resources was taken offline.
> 
> The ban_reason field is added to struct xe_exec_queue and set at the
> point where the ban is triggered:
> - In guc_exec_queue_timedout_job() for GPU hang.
> - In xe_ttm_vram_purge_page() for memory page offline, before calling
>    xe_exec_queue_kill() or xe_vm_kill().
> 
> The reset_status op is updated to return u64 with the reason bitmask.
> When a queue is banned but no explicit reason was recorded (e.g., from a
> generic CAT error), it defaults to GPU_HANG for backward compatibility.
> A value of 0 means the exec queue is not banned.
> 
> v2(Sashiko):
> - Use atomic_t for ban_reason to fix concurrent updates from TDR and
>    page-offline
> - Guard GPU_HANG bit with !exec_queue_killed to avoid masking
>    page-offline reason
> - Clear ban_reason on queue recovery (clear_exec_queue_banned path)
> - Use atomic_read in guc_exec_queue_reset_status for lockless read
> 
> Assisted-by: Copilot:claude-opus-4.6
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 ++++--
>   drivers/gpu/drm/xe/xe_execlist.c         |  4 +--
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c     | 10 +++++++-
>   include/uapi/drm/xe_drm.h                | 12 ++++++++-
>   5 files changed, 54 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index b2276559c2f6..a21916359e2f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -156,6 +156,9 @@ struct xe_exec_queue {
>   	 */
>   	unsigned long flags;
>   
> +	/** @ban_reason: Bitmask of ban reasons (DRM_XE_EXEC_QUEUE_BAN_REASON_*) */
> +	atomic_t ban_reason;
> +
>   	union {
>   		/** @multi_gt_list: list head for VM bind engines if multi-GT */
>   		struct list_head multi_gt_list;
> @@ -350,8 +353,8 @@ struct xe_exec_queue_ops {
>   	 * signalled when this function is called.
>   	 */
>   	void (*resume)(struct xe_exec_queue *q);
> -	/** @reset_status: check exec queue reset status */
> -	bool (*reset_status)(struct xe_exec_queue *q);
> +	/** @reset_status: check exec queue ban status, returns ban reason bitmask */
> +	u64 (*reset_status)(struct xe_exec_queue *q);
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index cc33ae80e8cf..534e7c4e0099 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -452,10 +452,10 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
>   	/* NIY */
>   }
>   
> -static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> +static u64 execlist_exec_queue_reset_status(struct xe_exec_queue *q)
>   {
>   	/* NIY */
> -	return false;
> +	return 0;
>   }
>   
>   static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9036f89dff7d..f52577de1ac2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -6,6 +6,7 @@
>   #include "xe_guc_submit.h"
>   
>   #include <linux/bitfield.h>
> +#include <uapi/drm/xe_drm.h>
>   #include <linux/bitmap.h>
>   #include <linux/circ_buf.h>
>   #include <linux/dma-fence-array.h>
> @@ -1593,6 +1594,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	if (!exec_queue_killed(q))
>   		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>   
> +	/*
> +	 * Only tag as GPU hang if this is the original timeout, not a
> +	 * consequence of a prior kill (e.g., page-offline).
> +	 */
> +	if (!exec_queue_killed(q))
> +		atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG, &q->ban_reason);
>   	set_exec_queue_banned(q);
>   
>   	/* Kick job / queue off hardware */
> @@ -1676,6 +1683,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		if (timeout_needs_gt_reset(q, job, skip_timeout_check)) {
>   			if (!xe_sched_invalidate_job(job, 2)) {
>   				clear_exec_queue_banned(q);
> +				/* protect concurrent page offline reasons */
> +				atomic_andnot(DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG,
> +					      &q->ban_reason);
>   				xe_gt_reset_async(q->gt);
>   				goto rearm;
>   			}
> @@ -2570,13 +2580,25 @@ static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
>   	}
>   }
>   
> -static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> +static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
>   {
> -	if (xe_exec_queue_is_multi_queue_secondary(q) &&
> -	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
> -		return true;
> +	if (xe_exec_queue_is_multi_queue_secondary(q)) {
> +		u64 status = guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q));
>   
> -	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
> +		if (status)
> +			return status;
> +	}
> +
> +	if (exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q)) {
> +		u64 reason = atomic_read_acquire(&q->ban_reason);
> +
> +		/* If no specific reason was recorded, default to GPU hang */
> +		if (!reason)
> +			reason = DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG;
> +		return reason;
> +	}
> +
> +	return 0;
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index c22669955147..5bb66c7b5505 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm_managed.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_buddy.h>
> +#include <uapi/drm/xe_drm.h>
>   
>   #include <drm/ttm/ttm_placement.h>
>   #include <drm/ttm/ttm_range_manager.h>
> @@ -541,7 +542,12 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
>   	xe_bo_unlock(bo);
>   	/*  Ban VM if BO is PPGTT */
>   	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
> +		struct xe_exec_queue *eq;
> +
>   		down_write(&vm->lock);
> +		list_for_each_entry(eq, &vm->preempt.exec_queues, lr.link)
> +			atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &eq->ban_reason);
> +		smp_wmb(); /* Force all queue bits to be visible before killing the VM */
>   		xe_vm_kill(vm, true);
>   		up_write(&vm->lock);
>   	}
> @@ -553,7 +559,9 @@ static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
>   	/*  Ban exec queue if BO is lrc */
>   	if (q && xe_exec_queue_get_unless_zero(q)) {
>   		/* ban queue */
> -		q_to_put = q;
> +                atomic_or(DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE, &q->ban_reason);
> +                smp_wmb(); /* Force bit change to finish before state change triggers */
> +                q_to_put = q;
>   	}
>   
>   	if (bo->purgeable.state == XE_MADV_PURGEABLE_PURGED) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 509202a7b13e..1600e8f0885a 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1503,7 +1503,17 @@ struct drm_xe_exec_queue_get_property {
>   	/** @property: property to get */
>   	__u32 property;
>   
> -	/** @value: property value */
> +	/**
> +	 * @value: property value
> +	 *
> +	 * For %DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN, this is a bitmask of:
> +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG - banned due to GPU hang/timeout
> +	 *  - %DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE - banned due to memory page offline
> +	 *
> +	 * Value of 0 means the exec queue is not banned.
> +	 */
> +#define DRM_XE_EXEC_QUEUE_BAN_REASON_GPU_HANG		(1 << 0)
> +#define DRM_XE_EXEC_QUEUE_BAN_REASON_PAGE_OFFLINE	(1 << 1)
>   	__u64 value;
>   
>   	/** @reserved: Reserved */

