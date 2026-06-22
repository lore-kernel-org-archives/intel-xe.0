Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8560ECDB471
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 08:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4499010E55C;
	Mon, 22 Jun 2026 08:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fm03iYxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275C410E532
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782116559; x=1813652559;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9W9goOh+J/Ts3/GVkHPEYdAODhpOyw/faee+ob8HpDg=;
 b=fm03iYxxqhcuc1lcUK/HwUh0RjVcHsGOlx92fctgUnNimuZI1tsijrfw
 uzFj7TBWogj6ylXKCH946G7WxPqrEzqT+xuV/Z1e7Wz+HUvr6+6mmoeak
 Lfx8pDlLiHzwMhULxtoQZMtw1t7ZYB22gqdkSDg9npQxj1FhrqN7NoXMI
 tmBZgaqME7VGcarfXoLkCj3Cv09K7HNuevJ43MtOyZB/N7+RzOqEPp/5c
 EKu1XPak/EzqBLWwSY9QVQMkCQ6ga5TmQlvkfcxRdsDmkxUygNvf6GSTO
 oB0oFgoLMk2KRMDaripPvb5VIjmEKu5UJVOo0g4h87p2OkKmZjijcUIdA A==;
X-CSE-ConnectionGUID: gnjiGbLFQqSJkRY3e9I66A==
X-CSE-MsgGUID: OPfJXH+hTOihnQGzpAbdqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="100392837"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="100392837"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:22:39 -0700
X-CSE-ConnectionGUID: FgRhYQgbTtW2uKsA7uDxAA==
X-CSE-MsgGUID: fwnGuTUATFu9+1CRBUcqBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="245017747"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 01:22:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 01:22:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 01:22:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 01:22:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpjIkaJpygjzq5hu7slFSn2sTxTuUX7XrAk0O8kfVd0YnsTSiMJx9K+JzMTY/hM1XxRYkG3D9u9I3F6VgWhJd4FjRsNjYmZBfz4g8NI/dgRkZBA+P4zzcCE7ngcu/G9Ua17K2xqfVXIOG9qPskc1+oMRahmQ6YrOSyawoUFHKpxQl7m2rJTjMc/DeQUQVNL6HJlQ+A+W8zRcsvR045QK+guzdloNzM19DmUGIKTnL9pSRJ17Hkw8NoeuYEsY+qQpfeBoFrL5M4L5lT+i/JG5rz3pPOof4n4ynCUTSQIZo6GqgSfk1IILsM0JQEPMIBVfM6qvgU144dt6eVJkGAv7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/OjPfuanRuE5+yUsecLRB6YL7FW1hJy8cmYCQfmiVg=;
 b=Wqos7l8BIGvdhj0qcWwVLeNZtFZRYttZXk4NAjLLFIzX2U4pe47Lqs7TtC01yW2DhOxxXF9WEb04JWCSUGgI5VR/1DprZuTGWqi71kYmn7Lutm44FlBLbgPCSDk7PvMH8GK0HefxufaTlHusgaKKNpJTgXMdKeDb4/n0UoKAQ2i13ygWJG/As3HdBjAi6qx60WA7F8JUmX+M89cna6n5svtKOXPuVkAYfSdqMX3LXFZEwdpSPeWLFS4z85fgvmK33bAfEr9J8yIAy67xZkLHY4n8eAawA4uRXgQxzLEf60MKXq86aB03mOpI63oceHLeaOFmdkDLHGcEJ9PRKHAAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 08:22:31 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:22:30 +0000
Date: Mon, 22 Jun 2026 10:22:25 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/7] drm/xe/guc: Decouple the GuC ID manager from the
 submission state
Message-ID: <20260622082225.zom3qofb25dcbscb@intel.com>
References: <20260619202935.2701499-1-piotr.piorkowski@intel.com>
 <20260619202935.2701499-4-piotr.piorkowski@intel.com>
 <c39dfbf7-5931-4dc1-b124-6004e9c84f11@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c39dfbf7-5931-4dc1-b124-6004e9c84f11@intel.com>
X-ClientProxiedBy: TL2P290CA0022.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:3::6)
 To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BN9PR11MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f0c099-4953-4daa-2001-08ded0376743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ip3pG+FDvXCx5vXUZe1IAT0InJywXYBOMla/5HTJvrpQCjf2Dti1Uvu9xjH6WSbgnDsGMqVUv6gFmf7dinuTbJWDXJj5OHQKiUgMGayQVqCmASi7zTGksc1wk4xBszwGiHMIPNt7zoSaJl4DS8cC28CSSsmrlydH9XCAPBU7VWarV0NpRRLXJV8t28lKGYJnxEyBLhpl0pPygHFpe+5mAEtcRaThe1/JPbnfW0XsuAkMp/MZtvbD5ZslXtUlDExOSHLNhnE1MWUTCXBh8JtTT+axcGVxdusNFIOkCoDR+d+i/a2yG+XnHeGwnrwrAAYEY6fcCVAcfEr4Jo8WeSALZfiizB8M50jva1T7Paa/tzP7feBY+o+zmfB5kL7anDRxciVU08qQo2/jw6sbv6mnfa0Y4wedIQlDwNYzJ3bjJYPhrduUo0LovDaq1XXUVkVWu8ZfxYmTE8cMlI4UZmhfOpLeb+f0BLA/9i+xvZhpLxiASQnWWKNHtsAvcldLqtQ2sOEhh6olbsI9Z0V2w5A5H+8fyIWQOXZczJBp8htKhqxeL30odXrTvf/WW5NoFWGVwxd5+AELXmcnOaCCO4JR02oDKKkbQ6G/YCBb7IN1kW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDIxandTc3dIeEVQV2pDSUE4QlE3QUNTbzNIVi9JMllxY3h2b25BZS83TVNa?=
 =?utf-8?B?U0pBQ05kMjZvRTloMUZ3VFV0d2Z2ZGk5QTEwY1FReHZuL2tlZ3ZJQWRmYjVP?=
 =?utf-8?B?VDRVczJWWTVPZjh6ZHdIbmV3alFyMFh2K0hoTzl3bUd4d0FtdzZtK2EzcWp5?=
 =?utf-8?B?MWs0alZ2YlBOaHJZYUFTZGlaS1ZiVThTbnVBZGUvb3ZIVHMxMkZNYXF3azJr?=
 =?utf-8?B?WnREWUZHYXpvR1pGbWo1RmhBdzRXb3ZlcklMb0tTcFA4N3RhYUxKei9OcCtC?=
 =?utf-8?B?ZlJYQ3AveVkrYkpiTEtpUFZGMmg1MmNIOHF1a3BybTBrbC9QWFFMWlBOOTRn?=
 =?utf-8?B?dzJveFozaHhGdTUwbXFmSUZHOFVsa2FRWjkvV0did2w5Z1U1a3V4UkQ4MXlR?=
 =?utf-8?B?ZWdNekdueXFKd0F6ekVYTmV1SWVrR1pFVnFoZHVUQ2xMT3FGSjZ5Z3NVaEd2?=
 =?utf-8?B?c05EQ2U3cm5Fb2ErSFA5ekhJaUZDTkJqbGkrN1V1YUFDRG11dkJKVHNsQ2w4?=
 =?utf-8?B?dTlGVmhBR25jM2lkRldoNFBlM1AweEZ2ajJlWlgvTTdGQWU5TzVRd2EvTG5Q?=
 =?utf-8?B?RE5PcGtxL0VXMWtGcjY1MFJRZ2VVajhGM0tIN2pFcEJ0YWFPcEt1dWJ5Uksv?=
 =?utf-8?B?a3pyTEllNjRMOW5FNlpibmxva0YyKzVXME16ZTlLdWU1dlU5Mk0weE5XMHQx?=
 =?utf-8?B?dEc3Mmg4SXM4SWxoOTN1M0xWdXBKdjRRUGRsYjQrOEtkaktVVDZ6SUJNcGgw?=
 =?utf-8?B?Qlk2WjMybzYwZTdZRWFiY0NRblNhZWFsNDl1aVBDQXZUYjd2UnA2SGlkYzlw?=
 =?utf-8?B?ZHZoS2Q0eWo2TVo5WlVrSW5WMXBPOUtvYVZSZlYvTzM3bXl2dXhYa1FHMjE0?=
 =?utf-8?B?M1dCSzc4MjRlMFM5RWRIR2puUVo3bXhZM0dyRXVLbDlQWWtudHZBbGRhcGtC?=
 =?utf-8?B?L2lJbVM4T2xjNDNUMFdCaXd6cW1WS0NDSjh2WWVyL01ISlR2aWR4ZDVZdXBX?=
 =?utf-8?B?cDE0STlGQ1o3dDhZeW5LWjI4djdXMDcrZDdrNFBPTzFmeXRIa0JNQXo0VThW?=
 =?utf-8?B?U3NUeGJ5d25Db3JzWmtlMDVFc3NQSlJxV1dSUlllNG1GNkRwUDRvVGVpTERH?=
 =?utf-8?B?Nmh5M3J6UnprSDdqVTAwR1hZZHh0N3pjdzVIOWhWclpUYWhZYm1YSTZuWHZR?=
 =?utf-8?B?NHpKMGZyZklCcndJb1dXOHEwalMwVlBtbTNLdnJaMjFhQXB2UXdWM0o5YW90?=
 =?utf-8?B?bFpyNkErbTh6REFXWXRGeG8xVEFlMDhRTzRLckZpbUE0aVJIaWJlNzd5dURo?=
 =?utf-8?B?Z2ZmUzF5dk1Xekx4VjdTNUZMZ0JCSkxmVFp2c3FaZy9EWktsUXpnQlNOdjFv?=
 =?utf-8?B?dEZqRXA2RzNFZWVhWFlWQUNtZVh1NWV3TUViVmFZMHcwQW1MZTk4SmxpMjNB?=
 =?utf-8?B?K3o2dkc1M09SMW02NDJzRnB0dG0rUkhvdDBsa252T2xBMldwenlNd3VHb0Nt?=
 =?utf-8?B?U1I1czdXMkFEZ3lKZWt0LzVPR1hUeWtZS2ZTdTRFVDJ3d3lEWGFXS0hRNG4v?=
 =?utf-8?B?dEI2NTRjQ1lTaklJS1B4dVJiT1pZa2d0WHFYUWY5MmI0WnVQQzRyY083eTV2?=
 =?utf-8?B?WTNuSXVRL241WnJ2OERwMVF0TTA5V2N6L3JkWnlzd2JZM1E1bkRTWXZmeWpx?=
 =?utf-8?B?YXkwQVovaUcrM0RDTXdzUnhVUmFJK2dEQ011UGJYaGcxaC8wUklJYUJGTnEz?=
 =?utf-8?B?b2lNRmNaTFFlemxlYVVXOFp5RFUzTmpZaG5yUUF6Mit1UG9kalJ5MDRsWmw3?=
 =?utf-8?B?Ly9wcTZFWGxuYXJtMDA0UnlxQmFRUjRXb2VxWTZ0eXh1b2piNGd4dmxJblZq?=
 =?utf-8?B?Mm92cW4yMDBCUUI2VktsczVlelJVUFNyMmJoRzhNc254dU0yY0kzemFSWmZQ?=
 =?utf-8?B?U0t3RGJyOCsxa3dnM25EYjZmc2hRMkdjWk8weHJVbFF1Zjk4UFRzZFhkd2Fu?=
 =?utf-8?B?dTArNE0rTkNRWVo2dXNxWFl6cnZ1ZzV1b3ZseHhOQzVHN1JlTFNaQ29aWHF6?=
 =?utf-8?B?UzcwanZDOEJZVzM1ZDBKUE43UU8rWmtjMlcwWENzc0xvbzdjMnZSdHczN3dJ?=
 =?utf-8?B?M29KMWJFVDlscHFsWGhuSzRiOXJvbUU1clc4T3Y4d0kyNU0xZ0ltTWtrUkhG?=
 =?utf-8?B?a0lNUVhwOGM5K2NrY3V5RWR6VklJc0lIYXd5amdJUFVRTnQ4Vk1DL2laOWhW?=
 =?utf-8?B?T1RkUU9WWksrREZqQW56Sit4aEU2ZVc4QnUxZkM4YUtqd0lQd0lhM202Q0Z1?=
 =?utf-8?B?MUtFamZEQm5BYnJoMlBPYTExa2ZRalRlTTVpWVpQSjVnallWUzkyWWdpdkFH?=
 =?utf-8?Q?is/yWPhJpuV/K2rU=3D?=
X-Exchange-RoutingPolicyChecked: d1KS5/BDWZG9qCRLFCRLrdtFE+J4djvhhDsAvYDfgACn0VGlzPqhWEAGqDT0iSooWkRhEt5SuVQdJ6iZMAC7UKiOlEmQ9LP9kO8RiQmKtgx1mLeu7SKwCOONBtvNqJ8Uhzo0TC/Nior1K92padtt/qdPI0OdGaxRnD/qwRjaip6P8bSQgBrsUBI8ClR754l2gPwnuax9IgZJSLV4BrVEaFVpI1cNB26FSppoYzGUL9IhLSdHYLz5vdMijPSQOPrA46L+hWS7a09sV+uEB7uG/7cMczVL76Z5TxoTVHxa15c0vGZ1FJZHKVhN4AnINvkhfEwaPXc7uECIEKa5CDkuAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f0c099-4953-4daa-2001-08ded0376743
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:22:30.8581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HMWAMn+9qQQCDgePqbNxjN9swfxKgboG7iNI7hSxM7V4AQC7NdlfeSz1R3yv5HD1R+Lprgip4rkHufmXIpwBopm+OukBFD0jAZ7PvkP65Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on sob [2026-cze-20 18:12:13 +0200]:
> 
> 
> On 6/19/2026 10:29 PM, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Refactor the GuC context ID manager to remove its dependency
> > on guc->submission_state.
> > This allows using the ID manager outside of the GuC submission path as
> > a standalone resource pool, which is needed for future patches where
> > it will be used as a separate pool of context IDs for SR-IOV VFs
> > provisioning.
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  3 ++-
> >  drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c | 22 +++++++++++++------
> >  drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 18 ++++++++++++---
> >  drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  5 ++++-
> >  drivers/gpu/drm/xe/xe_guc_submit.c            |  3 ++-
> >  drivers/gpu/drm/xe/xe_guc_types.h             | 21 ++++++++++++++++--
> >  6 files changed, 57 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> > index dba6e69335d8..c10d2b3f50ea 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> > @@ -104,7 +104,8 @@ static int pf_gt_config_test_init(struct kunit *test)
> >  	pf_set_admin_mode(xe, false);
> >  	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> >  	KUNIT_ASSERT_EQ(test,
> > -			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm, ~0), 0);
> > +			xe_guc_id_mgr_init(&gt->uc.guc.submission_state.idm,
> > +					   &gt->uc.guc, NULL, ~0), 0);
> >  	KUNIT_ASSERT_EQ(test,
> >  			xe_guc_db_mgr_init(&gt->uc.guc.dbm, ~0), 0);
> >  
> > diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > index ee30a1939eb0..4e4b1c890000 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
> > @@ -15,23 +15,31 @@ static int guc_id_mgr_test_init(struct kunit *test)
> >  	xe_kunit_helper_xe_device_test_init(test);
> >  	idm = &xe_device_get_gt(test->priv, 0)->uc.guc.submission_state.idm;
> >  
> > -	mutex_init(idm_mutex(idm));
> >  	test->priv = idm;
> >  	return 0;
> >  }
> >  
> > +static struct xe_guc *test_idm_to_guc(struct xe_guc_id_mgr *idm)
> 
> hmm, while we can move out IDM from submission state, IMO it will be
> always coupled with GuC, as it manages this GuC's IDs, and we shouldn't
> have more than one IDM per GuC
> 
> so the idm_to_guc() should be always fine, but may look like:
> 
> 	return container_of(idm, struct xe_guc, idm);
> 
> as it was initially posted [1]
> 
> [1] https://patchwork.freedesktop.org/patch/573977/?series=128445&rev=1

What I want to propose later - and this series is meant to prepare IDM for that - is a move away
from the assumption that we have one IDM per GuC (and the same applies to DBM).

This would allow us to have separate pools for PF and VF provisioning.
In the case of PF admin-only mode, we would provide PF with only the necessary resources,
and a separate pool would be used for the VFs, ensuring that those resources are reserved
exclusively for the VFs.

Thanks,
Piotr


> 
> > +{
> > +	return container_of(idm, struct xe_guc, submission_state.idm);
> > +}
> > +
> >  static void bad_init(struct kunit *test)
> >  {
> >  	struct xe_guc_id_mgr *idm = test->priv;
> >  
> > -	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
> > -	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
> > +	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 0));
> > +	KUNIT_EXPECT_EQ(test, -ERANGE,
> > +			xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, GUC_ID_MAX + 1));
> >  }
> >  
> >  static void no_init(struct kunit *test)
> >  {
> >  	struct xe_guc_id_mgr *idm = test->priv;
> >  
> > +	mutex_init(&idm->internal_lock);
> > +	idm->lock = &idm->internal_lock;
> > +
> >  	mutex_lock(idm_mutex(idm));
> >  	KUNIT_EXPECT_EQ(test, -ENODATA, xe_guc_id_mgr_reserve_locked(idm, 0));
> >  	mutex_unlock(idm_mutex(idm));
> > @@ -43,7 +51,7 @@ static void init_fini(struct kunit *test)
> >  {
> >  	struct xe_guc_id_mgr *idm = test->priv;
> >  
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> > +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
> >  	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
> >  	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
> >  	__fini_idm(NULL, idm);
> > @@ -56,7 +64,7 @@ static void check_used(struct kunit *test)
> >  	struct xe_guc_id_mgr *idm = test->priv;
> >  	unsigned int n;
> >  
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> > +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
> >  
> >  	mutex_lock(idm_mutex(idm));
> >  
> > @@ -78,7 +86,7 @@ static void check_quota(struct kunit *test)
> >  	struct xe_guc_id_mgr *idm = test->priv;
> >  	unsigned int n;
> >  
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
> > +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, 2));
> >  
> >  	mutex_lock(idm_mutex(idm));
> >  
> > @@ -102,7 +110,7 @@ static void check_all(struct kunit *test)
> >  	struct xe_guc_id_mgr *idm = test->priv;
> >  	unsigned int n;
> >  
> > -	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
> > +	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, test_idm_to_guc(idm), NULL, -1));
> >  
> >  	mutex_lock(idm_mutex(idm));
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> > index 0738fc277bd2..f1e69650fb7e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
> > @@ -16,7 +16,7 @@
> >  
> >  static struct xe_guc *idm_to_guc(struct xe_guc_id_mgr *idm)
> >  {
> > -	return container_of(idm, struct xe_guc, submission_state.idm);
> > +	return idm->guc;
> >  }
> >  
> >  static struct xe_gt *idm_to_gt(struct xe_guc_id_mgr *idm)
> > @@ -30,7 +30,7 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
> >  }
> >  
> >  #define idm_assert(idm, cond)		xe_gt_assert(idm_to_gt(idm), cond)
> > -#define idm_mutex(idm)			(&idm_to_guc(idm)->submission_state.lock)
> > +#define idm_mutex(idm)			((idm)->lock)
> >  
> >  static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
> >  
> > @@ -63,6 +63,8 @@ static void __fini_idm(struct drm_device *drm, void *arg)
> >  /**
> >   * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
> >   * @idm: the &xe_guc_id_mgr to initialize
> > + * @guc: the owning &xe_guc
> 
> IMO there should be one IDM per GuC, so the internal container_of should work
> 
> > + * @lock: mutex protecting this manager, or NULL to use an internal lock
> >   * @limit: number of IDs to manage
> >   *
> >   * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
> > @@ -73,10 +75,20 @@ static void __fini_idm(struct drm_device *drm, void *arg)
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
> > +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
> > +		       struct mutex *lock, unsigned int limit)
> >  {
> >  	int ret;
> >  
> > +	idm->guc = guc;
> > +
> > +	if (!lock) {
> > +		mutex_init(&idm->internal_lock);
> > +		idm->lock = &idm->internal_lock;
> > +	} else {
> > +		idm->lock = lock;
> > +	}
> > +
> >  	idm_assert(idm, !idm->bitmap);
> >  	idm_assert(idm, !idm->total);
> >  	idm_assert(idm, !idm->used);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> > index 25c6f026449a..d0ce8ce85b7a 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> > @@ -7,9 +7,12 @@
> >  #define _XE_GUC_ID_MGR_H_
> >  
> >  struct drm_printer;
> > +struct mutex;
> > +struct xe_guc;
> >  struct xe_guc_id_mgr;
> >  
> > -int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
> > +int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, struct xe_guc *guc,
> > +		       struct mutex *lock, unsigned int count);
> >  
> >  unsigned int xe_guc_id_mgr_total(struct xe_guc_id_mgr *idm);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 537985f4d3b7..154d6129ea44 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -311,7 +311,8 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_guc_id_mgr_init(&guc->submission_state.idm, num_ids);
> > +	err = xe_guc_id_mgr_init(&guc->submission_state.idm, guc,
> > +				 &guc->submission_state.lock, num_ids);
> >  	if (err)
> >  		return err;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > index c7b9642b41ba..0850918c28b0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > @@ -7,6 +7,7 @@
> >  #define _XE_GUC_TYPES_H_
> >  
> >  #include <linux/idr.h>
> > +#include <linux/mutex.h>
> >  #include <linux/xarray.h>
> >  
> >  #include "regs/xe_reg_defs.h"
> > @@ -33,11 +34,14 @@ struct xe_guc_db_mgr {
> >  	unsigned long *bitmap;
> >  };
> >  
> > +struct xe_guc;
> > +
> >  /**
> >   * struct xe_guc_id_mgr - GuC context ID Manager.
> >   *
> > - * Note: GuC context ID Manager is relying on &xe_guc::submission_state.lock
> > - * to protect its members.
> > + * Note: GuC context ID Manager uses the lock supplied at init time to
> > + * protect its members. If no lock is supplied (NULL), an internal lock
> > + * is initialized and used.
> >   */
> >  struct xe_guc_id_mgr {
> >  	/** @bitmap: bitmap to track allocated IDs */
> > @@ -46,6 +50,19 @@ struct xe_guc_id_mgr {
> >  	unsigned int total;
> >  	/** @used: number of IDs currently in use */
> >  	unsigned int used;
> > +	/** @guc: back-pointer to the owning &xe_guc, set at init time */
> > +	struct xe_guc *guc;
> > +	/**
> > +	 * @internal_lock: own mutex, used when no external lock is provided at init.
> > +	 * Do not use directly; always access through @lock.
> > +	 */
> > +	struct mutex internal_lock;
> 
> do we have to introduce internal lock ?
> maybe in case of separate shareable range we can pass the PF master mutex
> that we already use during all provisioning?
> 
> > +	/**
> > +	 * @lock: active mutex protecting this manager.
> > +	 * Points to @internal_lock when initialized without an external lock,
> > +	 * or to the caller-supplied mutex otherwise.
> > +	 */
> > +	struct mutex *lock;
> >  };
> >  
> >  /**
> 

-- 
