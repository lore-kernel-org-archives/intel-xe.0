Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDD2C3600C
	for <intel-xe@archiver.kernel.org>; Tue,  1 Apr 2025 01:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E6310E1B9;
	Tue,  1 Apr 2025 01:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+rcXHPC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1257810E1B9
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Apr 2025 01:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743469407; x=1775005407;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fqBq2P6W2atYTpRtXEPF23OrLd6B7x2JsYwUAsNxglY=;
 b=N+rcXHPC90QUQLcmgPvzN+s637dWCSou/Qg51FwoBulwJ7kfNtwQFnPo
 mVxdfd3x10x8MguQI1R0Ss5ntsUT5SZYa55drzOnyDGZ5ePLX3O9vCsti
 /mF8i2JyLRxH3GlOAL5evz8XKGisO4f9U/Ria+Wx2Zvnu/Ltcl46cfJ33
 wWq+/mQca1aH6vpklPZUtwEwA5YvLzZeQFbLRQyWlJNI/8MbdZD3j2908
 pCyqEhGuJuQSnJC+cqOc8TJz4qLHljb+q06bc1xKgjtZVeNcfBJZwc0Ad
 sf0rHO5iURrEoS6WSXgB0tqbR1VhhrejvpmOxJnNjDDyYac4DXoexzQ6N w==;
X-CSE-ConnectionGUID: NpgRZQkQR7mAJYQ8UK6/lA==
X-CSE-MsgGUID: h+EhKC3sSa+WdQp+yk9UkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55435168"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="55435168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 18:03:25 -0700
X-CSE-ConnectionGUID: XnnVU6LWRcCKbbqSiI+cjQ==
X-CSE-MsgGUID: KlD03H0bSdKY4liR3gLlNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; d="scan'208";a="126464657"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 18:03:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 18:03:24 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 18:03:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 18:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snpboc8N0+t3oB+KA6b9Zii84ZJDcDr/6cENOI44sSuKeHA/pEhS4ROZZKx3k2gi31suGxuTpWfumk4/KJ3VxKCuJ8+TpzAvwOsUeMEx5//rZON6mDcs8rzfC6eb4BnkqlQ7qIeFt1hfY+EyvvFTB7wSp78wC+tq4vtWQH0Uci+V4wyjiIltloIOkIy01mAl+6DxK5dB+J1TKkCKHVb1Pb62ckIQZhBCx9wqnnR/4pyHwN3X4Bc+r13PXrbamCptTa54ostmVKC+DwwKRaYeTJW2V94nSnfaYr6zA1J4y5XnebIwIyNiQUQpb/vvTuu7t3GZnB5Y8S4eeAurNNzUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLLra20R6uAiFt20zkc2Fe05mrQPuiM2Mh8MFfIzoCQ=;
 b=hETMIOXprdkv6cLofCixQjjqLbnUWXoOLIlfvU4AcYqlO8oL2rJ3Jvjf/aZAzXHfcvwAZEH3z9WPiVkVq/JiiBcDRjdsbRN6liAusMRQtXESlnZQDWEvAFmY5O3JySFYhdECpogbuT91o3vQOUE1qX/xMcc2QeHNMLDs+3dHvrH+J/T06XsTwtUyFzhi36SnsztOwBr/hCsLdTcSpojTTPWdpLT7htEDe8K4HLd7KbztQUF9OkPkL8vTByKnfvuSEITVaPYLeyFrsJtolLnWrW/aiwo/Jy3db1OrU+HZGpq/4gHTh/8IbFBAbhroiZE65HwBUDcSmjsS3rsx0v0JUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7426.namprd11.prod.outlook.com (2603:10b6:a03:4c4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 1 Apr
 2025 01:03:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 01:03:21 +0000
Date: Mon, 31 Mar 2025 20:03:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.d.roper@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add configfs to enable survivability mode
Message-ID: <52rohjfpmrdvdqs2kzyc7xkts2qnus34n2mexk2fkf5dr5o5eg@be4in62elg3r>
References: <20250327064204.459968-1-riana.tauro@intel.com>
 <20250327064204.459968-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250327064204.459968-2-riana.tauro@intel.com>
X-ClientProxiedBy: MW2PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:302:1::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 42b9bb0b-15ec-4673-0cfa-08dd70b8fecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?At0PqCsp5IuyM8H7V0S5K3PMck4koKfdSyZwnAM02DXIuyD+/CeEZin+3f?=
 =?iso-8859-1?Q?x2HNqt6TwwVHHtI9dx7n1WaCjwbLTY88iafH5MdInOtmO3RbGIA7pD7/Kk?=
 =?iso-8859-1?Q?d+rE+7IxHJa/ON5u0bDLA567OW3o9pQYn0F+hDTwpkmwhmq1OGJWKtB2yS?=
 =?iso-8859-1?Q?X5eebahib2IiaqNsQV3LNl05eCJjawpg5YSEBGg++2HBi7mzd5JdLoW1DX?=
 =?iso-8859-1?Q?L9MiKS79RKGqkDdhfN8X8Fmuo5wRNdCddaqxOpxxC7ZOKecQO4w0qAyVAH?=
 =?iso-8859-1?Q?rjYUnEMLeNCtK6OjHlwsJ1rQzbm+6prD50XqolnBEkVoQfe68SLr7mPAay?=
 =?iso-8859-1?Q?LQ6/E5PlVlQrh79EE+eaTTFn93F9QzkJw9v/zwV1e5EyJlk3DDawJw29VR?=
 =?iso-8859-1?Q?njeCwDV102dveaRW/YnuRjDHu2F9hvJ0BzOa6VDwalfEo6plcKeIK6DkLQ?=
 =?iso-8859-1?Q?0xF+AsgbSb4IkxYkk9YdzgT+TmT2cwMrQyjIZH51yqNcUZUIjp/VW1mK3M?=
 =?iso-8859-1?Q?z532rcQwu57UmGfidGKJcWTETrUcvgzHG7m6v4HcaS3qetoezxNkEFAve6?=
 =?iso-8859-1?Q?O54ukA09jUSKyqzrON5FDA0iIA1c90DW5eIcTjIcCpS4kbiKy0yEXliy7y?=
 =?iso-8859-1?Q?M9ezl7Ov+3VtP7WsstsHxzC4CCpfNHzES7KnKXttSwFRCjIh8Ri0mSnM0G?=
 =?iso-8859-1?Q?cSv+X71LqVxwy+u0HRjkWhPuDpN+Tys+uBZgzLQ95GTFGVFPDOKhGFYSSa?=
 =?iso-8859-1?Q?54riXs0St9/92DNwBExJGQaf/Oy12cYTGn3JF1V50FjSjOVt4AG5rHFdkE?=
 =?iso-8859-1?Q?Dy4fNlGSp+2U36F6wvKfPUbvxKKysqcGLOlUtKF22rWyqzFBIyP3Y7ji1p?=
 =?iso-8859-1?Q?VkH5AXhUEpxwvlYwky7RAmvvtFCNg1rIGwKh5S5+FrsmAB4Nu/m1zPOPe/?=
 =?iso-8859-1?Q?R+lonHfevz+TgXeMzqZkTpL3iTRsjIelHOkpTY1ce2noZ/v291yp0dlaZD?=
 =?iso-8859-1?Q?rPSN2J6LQMBiP6Wq46LUt2kHjOP5FZ7l4Yz19pjOR3CoV09MaMl+eEvPua?=
 =?iso-8859-1?Q?/qQ3MMoOyy4XPzwFbPDrPfcRxN0JMB3ozwxeAANrmtjpHF/7LSyzpYEFie?=
 =?iso-8859-1?Q?Bul0SUpjKJDBjlkQh48jJc5Sv8ARTxRV8+i58PUr0+ITjLz5LkmeWuatbG?=
 =?iso-8859-1?Q?Y+ZIYO5h5vRmTccLw0NBnFlUpQp24Dk2b15n+TV1QD0F8KbHwLB0msJjkk?=
 =?iso-8859-1?Q?ACxirJLZkNVg3/jVdAi+ekZEcRLRUDHGelDUCnBdTuJMVwBY5kPYOkCJrq?=
 =?iso-8859-1?Q?l38KZMLRNV+ZbPa57o4XtXC5NxPUexWkKI+96fXIHLx/fbL4mQrM35NhdJ?=
 =?iso-8859-1?Q?H33ajx7qx1Ven7MFK+Wyl1OYd71BDNJ4LyA1KtxyBeX2cuYgwyXe+dI8u+?=
 =?iso-8859-1?Q?aMDtnsBA4sBzk99Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?s0rVt0DQHIl2mu5ZAcpKQ4pgiAsakXykoDVct6ROHHRg7n9VEsYucUSXAC?=
 =?iso-8859-1?Q?dRUGgj1Vk2ZV3cDYjOuhwBvLSG78hBA3Iy2/pOjpGY6qi4MgyNsEk7JGME?=
 =?iso-8859-1?Q?nl7SQULaAUxnQskxDYgR+q8ejSgX/bBDvC6qKPi5bD2+VtWvbF6YNFbJhp?=
 =?iso-8859-1?Q?0OfMqTps4GFaON58ST0BcvM+7YoStfYIwDm7dptJzNBNU316NHx06nHLXg?=
 =?iso-8859-1?Q?Aq+jkJvu3Z8+UFnjyk8rjMDVk+CQBSNsR0a6ASN01iINc4T3dK3gjn5jlM?=
 =?iso-8859-1?Q?XceM0LTqC58qAgyFyEAA8Sr7EYkZ1PzjbwK1m8RhXuPeAFFsZfgxXgF5B/?=
 =?iso-8859-1?Q?qtaV1UcFsKoZUGML1nP0liEoIS4ETs8xRhy5Nk8nKciKqIsPoa+zSIgCeE?=
 =?iso-8859-1?Q?K1ivqxcr918ZNTOc3svSBthPUFOB6aV2dmX7PXaX0LLETE3aW1rYtGt5vE?=
 =?iso-8859-1?Q?KrWWG5WjLXZxcGGYNUmpWS4/WRs1NyDtseLl7s3RlCpxs6stPKWHla3G1R?=
 =?iso-8859-1?Q?is7S+OYGXWPQ8pSlchFGYQFd1eymSkdivM3jLZPJFfA8K+2Sdn9T4uyAdO?=
 =?iso-8859-1?Q?ALfKklKCENCwoA/jWYa89B64YptyCgyvDF1b5Pf5TQXt47Ohn/CCfVksxX?=
 =?iso-8859-1?Q?bFcCUXWI9gSEYEeVprjhK2/hEkU3eM8nyKJuDOG575g9vsl96q+1roOr+n?=
 =?iso-8859-1?Q?IOOZ3scoqjVfYteLrZsmwIoE+0y8p7uKZPCYFkWmlwWbqh8DtFK3AgDZ01?=
 =?iso-8859-1?Q?o8H/TfbOyC3k8hH+xwiE5pLNMFurkfVJxUVa8UeZO3weDUshkSgMeRWhG8?=
 =?iso-8859-1?Q?7yyYWgtMkh6gmwgwvZl4Ka7Wke9QXcrmOi4VqaUGCIen9UYEbEJIalZ0lt?=
 =?iso-8859-1?Q?7NClAgT/JbZw3iDgrBbwm1h4GJyRd5n3JKNFjHv5KL/MC6fDsQ6jajXqJi?=
 =?iso-8859-1?Q?/1jFbJVNPtdebSdd5LH9yt163i6/zgZ6E4jdubRwCNFlw9oLX4LXTGLcRM?=
 =?iso-8859-1?Q?AdS2pJ0lG6T6CBVCHxvE+9mO1AKe3dvxXOUc/7WGGRTXedIdfQ6pdB+cLP?=
 =?iso-8859-1?Q?v4/D6DMSi2LUlmOxIcpLKwQiklatKTdp2WX/5T7xY2uWDbAgxkLprc7vut?=
 =?iso-8859-1?Q?gmgKIblOrPoiF7BEz4bkRLcLEekQ/G41xs6u8imrEbDDIyrmT2aQwDCQV7?=
 =?iso-8859-1?Q?fVZUgsJFQj6TBPleddkEQx5I4M5G1QgBm+txM0S2He/QiNMDI/KfmqO4kf?=
 =?iso-8859-1?Q?U5QLElsgPmEzHOWoNqbSXT50NU+CXg43GeD3cFRu5yyO57k50KjIBWbor1?=
 =?iso-8859-1?Q?SnZf+d2/cQ+KMHHLdBguUM9Io54YZZhOQhNeE/DUgX8PocGS3fXdU4rydf?=
 =?iso-8859-1?Q?JumO3vbptF6M6n3eZ4aHEEIRt6MUJyZ5jVzrVJOuy6kRPPAw1KI3DktfW8?=
 =?iso-8859-1?Q?2NlCgIlmpYQZ1KUlMaSYz79U4fEjbdfXV0pERBmBvJwcl15GohpKLLSPoR?=
 =?iso-8859-1?Q?CEGj/uu5ZFjBOr/OE7rrNDK6MA8ZoUgWwM07px7BnFM9P6lhik241bAMLB?=
 =?iso-8859-1?Q?R67V4AGMhe7MwOHljW6Kr0nd5U3GEjMmQ9m+24+hiBeR9GoQMJo7zDXjhe?=
 =?iso-8859-1?Q?FeBFyi2ZBr5/uOOefCzw3hsevBLP3hW23rqnsROHLly6G5gmA93xuQCQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b9bb0b-15ec-4673-0cfa-08dd70b8fecc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 01:03:20.9986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhzMMAzAI9qSljSpfxmMPart6C/OlxCnUQZsc3jaD4fAwaaG96HRaUStLl/Pc6ddy/KVFTQdPZAsbkG664R3YZwec0IchHz0329OGuV8PpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7426
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

On Thu, Mar 27, 2025 at 12:12:01PM +0530, Riana Tauro wrote:
>Registers a configfs subsystem called 'xe' to userspace. The user can
>use this to modify exposed attributes for a device.
>
>Attribute exposed:
>
>/config/xe/<device>/survivability_mode : Enables survivability mode
>
>The attributes can be modified by creating the device directory under the
>configfs directory
>
>mount -t configfs none /config
>mkdir /config/xe/0000:03:00.0
>
>echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind
>echo 1 > /config/xe/0000:03:00.0/survivability_mode
>echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> drivers/gpu/drm/xe/Makefile      |   1 +
> drivers/gpu/drm/xe/xe_configfs.c | 174 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h |  11 ++
> drivers/gpu/drm/xe/xe_module.c   |   5 +
> 4 files changed, 191 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_configfs.c
> create mode 100644 drivers/gpu/drm/xe/xe_configfs.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index cd464fe26eb8..190176c2e10d 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -28,6 +28,7 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
> xe-y += xe_bb.o \
> 	xe_bo.o \
> 	xe_bo_evict.o \
>+	xe_configfs.o \
> 	xe_devcoredump.o \
> 	xe_device.o \
> 	xe_device_sysfs.o \
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>new file mode 100644
>index 000000000000..59e1bc4c5f76
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -0,0 +1,174 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include <linux/configfs.h>
>+#include <linux/init.h>
>+#include <linux/module.h>
>+#include <linux/pci.h>
>+
>+#include "xe_configfs.h"
>+#include "xe_module.h"
>+
>+/**
>+ * DOC: XE Configfs Support
>+ *
>+ * Overview
>+ * =========
>+ *
>+ * Configfs is a filesystem-based manager of kernel objects. XE KMD registers a
>+ * configfs subsystem called 'xe' that allows user to configure various attributes
>+ * See Documentation/filesystems/configfs.rst for more information about how configfs works.
>+ *
>+ * Create devices
>+ * ===============
>+ *
>+ * To use configfs exposed by Xe, mount the configfs directory and create the device directory
>+ *
>+ * $ mount -t configfs none /config

nit: once upon a time I think the "standard" was to have a /config. Same
thing as for debugfs. Nowadays I think pretty much every distro settled
on /sys/kernel/{debug,config} for debugfs and configfs. Mine even gets
mounted automatically:

# grep Where /usr/lib/systemd/system/sys-kernel-config.mount
Where=/sys/kernel/config

>+ * $ mkdir /config/xe/0000:03:00.0
>+ *
>+ * Configure Attributes
>+ * ====================
>+ *
>+ * /config/xe/<device>/survivability mode : Enables survivability mode if supported by device

    * <configfs>/xe/<device>/survivability_mode: Enable survivability mode if supported by device


>+ *
>+ * Unbind			: echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/unbind

please, no unbind. The unbind part is part of "the previous time the
driver was attached/bound to the device".

>+ * Enable survivability mode	: echo 1 > /config/xe/0000:03:00.0/survivability_mode
>+ * Bind				: echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind

are these extra spaces to try to align anything?

>+ *
>+ * The device enters survivability mode if supported
>+ *

trailing line.

>+ */
>+
>+struct xe_config_device {
>+	struct config_group group;
>+
>+	/** @survivability_mode: enables survivability mode when set */

I don't think we should kernel-doc this. But if we are, then it should
be proper kernel-doc, including the doc about the struct and not leaving
members undocumented.

>+	bool survivability_mode;
>+
>+	/** @lock: protects attributes */
>+	struct mutex lock;
>+};
>+
>+static struct xe_config_device *to_xe_config_device(struct config_item *item)
>+{
>+	return container_of(to_config_group(item), struct xe_config_device, group);
>+}
>+
>+static ssize_t survivability_mode_show(struct config_item *item, char *page)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+
>+	return sprintf(page, "%d\n", dev->survivability_mode);
>+}
>+
>+static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+	bool survivability_mode;
>+	int ret;
>+
>+	ret = kstrtobool(page, &survivability_mode);
>+	if (ret)
>+		return ret;
>+
>+	mutex_lock(&dev->lock);
>+	dev->survivability_mode = survivability_mode;
>+	mutex_unlock(&dev->lock);
>+
>+	return len;
>+}
>+
>+CONFIGFS_ATTR(, survivability_mode);
>+
>+static struct configfs_attribute *xe_config_device_attrs[] = {
>+	&attr_survivability_mode,
>+	NULL,
>+};
>+
>+static void xe_config_device_release(struct config_item *item)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+
>+	mutex_destroy(&dev->lock);
>+	kfree(dev);
>+}
>+
>+static struct configfs_item_operations xe_config_device_ops = {
>+	.release	= xe_config_device_release,
>+};
>+
>+static const struct config_item_type xe_config_device_type = {
>+	.ct_item_ops	= &xe_config_device_ops,
>+	.ct_attrs	= xe_config_device_attrs,
>+	.ct_owner	= THIS_MODULE,
>+};
>+
>+static struct config_group *xe_config_make_device_group(struct config_group *group,
>+							const char *name)
>+{
>+	unsigned int domain, bus, slot, function;
>+	struct xe_config_device *dev;
>+	struct pci_dev *pdev;
>+	int ret;
>+
>+	ret = sscanf(name, "%04x:%02x:%02x.%x", &domain, &bus, &slot, &function);
>+	if (ret != 4)
>+		return ERR_PTR(-EINVAL);
>+
>+	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>+	if (!pdev)
>+		return ERR_PTR(-EINVAL);
>+
>+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>+	if (!dev)
>+		return ERR_PTR(-ENOMEM);
>+
>+	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>+
>+	mutex_init(&dev->lock);
>+
>+	return &dev->group;
>+}
>+
>+static struct configfs_group_operations xe_config_device_group_ops = {
>+	.make_group	= xe_config_make_device_group,
>+};
>+
>+static const struct config_item_type xe_configfs_type = {
>+	.ct_group_ops	= &xe_config_device_group_ops,
>+	.ct_owner	= THIS_MODULE,

Rodrigo, 		   ^

this is what makes the config side take a ref on the module, as it
should.

>+};
>+
>+static struct configfs_subsystem xe_configfs = {
>+	.su_group = {
>+		.cg_item = {
>+			.ci_namebuf = "xe",
>+			.ci_type = &xe_configfs_type,
>+		},
>+	},
>+};
>+
>+int __init xe_configfs_init(void)
>+{
>+	struct config_group *root = &xe_configfs.su_group;
>+	int ret = 0;

pointless init as it's overwritten below.

>+
>+	config_group_init(root);
>+	mutex_init(&xe_configfs.su_mutex);
>+	ret = configfs_register_subsystem(&xe_configfs);
>+	if (ret) {
>+		pr_err("Error %d while registering %s subsystem\n",
>+		       ret, root->cg_item.ci_namebuf);

return ret;

>+	}
>+
>+	return ret;

return 0;


A bunch of nits above, but looking pretty good.

thanks
Lucas De Marchi

>+}
>+
>+void __exit xe_configfs_exit(void)
>+{
>+	configfs_unregister_subsystem(&xe_configfs);
>+}
>+
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>new file mode 100644
>index 000000000000..2c30be9a2c7e
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -0,0 +1,11 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+#ifndef _XE_CONFIGFS_H_
>+#define _XE_CONFIGFS_H_
>+
>+int xe_configfs_init(void);
>+void xe_configfs_exit(void);
>+
>+#endif
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 475acdba2b55..15b3cf22193c 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -11,6 +11,7 @@
> #include <drm/drm_module.h>
>
> #include "xe_drv.h"
>+#include "xe_configfs.h"
> #include "xe_hw_fence.h"
> #include "xe_pci.h"
> #include "xe_pm.h"
>@@ -91,6 +92,10 @@ static const struct init_funcs init_funcs[] = {
> 	{
> 		.init = xe_check_nomodeset,
> 	},
>+	{
>+		.init = xe_configfs_init,
>+		.exit = xe_configfs_exit,
>+	},
> 	{
> 		.init = xe_hw_fence_module_init,
> 		.exit = xe_hw_fence_module_exit,
>-- 
>2.47.1
>
