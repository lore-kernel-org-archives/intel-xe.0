Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EADC369CB
	for <intel-xe@archiver.kernel.org>; Wed, 23 Apr 2025 15:26:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F3510E6E0;
	Wed, 23 Apr 2025 15:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crZ32bSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D79C10E6DF
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Apr 2025 15:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745422015; x=1776958015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MtBZF422iPxISJioMaNmf3wV3E8h/BnJJqtR1iIHJtA=;
 b=crZ32bSoBiKBvfGgiu56inIQMCcYv160WLlP+ajRk3EpkG5sge4oeUA3
 vjqapoMan3OONPfQf/HbZITOR8cXVdYI3gRoOvK/0YM3Pl+DiSHQQC8Hn
 2jSq574lLOFJI3Q5mJxQvEFCdkGifpDNJ20jOQUNIroGr+3Pjw0aeeeIP
 lYS8COsrooCNNtIn9xtZzdHA6mwYcqq/XtBoH5or/sfNMjF7ljvit/DRm
 T0w4V3PyrJJw4NBGACPCTlAU7XbTTyPYuDuuPdL5iTZL3r62vUW0L+iCO
 vgygcdCkxQzYS617AP6YSpVNsIhzZdo6DHSp6Js17QEymehtrT5x1jxug g==;
X-CSE-ConnectionGUID: K4lyyeZuTKm6IJ7eEpMJ8w==
X-CSE-MsgGUID: KCtp2SnXSO+If9kHYJm92w==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50852059"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="50852059"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 08:26:55 -0700
X-CSE-ConnectionGUID: gI4vZS5IRQ2tUG1AfrBDcA==
X-CSE-MsgGUID: HEjVzX33RX+hDqLe61UFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137338953"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 08:26:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 08:26:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 08:26:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 08:26:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aei+grKUUM26tWADIEUjKzCQjgWSCywocV5XEgk7UPNjgSMy8hvp/KKZ9Zf3LDSsfVQ3h687iwms3lPl64GWndIgnFM9aZxP1x6Co/hbLIQ8V50tgs+/WOiF+bMEYsQy8jqPWr6AqgaMG9IyNPp+pV19yjUHlB1vQhYF/I9E6jg/8orXVXD6T/fwjVZKJvA/70T7u5wo1uPZ4OPuyKISTXxM/ucyCAKszPd6HKxvQhrDly8jrH+nmjq/sF+J3GdKPBilydtPmodmG/A4rSU0MGmxTn21297DJHr3r52gAXlsFYkAL9h4h007BifDdphTCwyf01JeSdqi6YO+Xh2VFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3MIfK3ErAjoYTz3fTfiI9t/vL0/z0BivQre1HRbNjI=;
 b=ZFuXb3zHkHz2AdL8QNYJlDpAos9g4kX67IxqaAsDd9adchoOTNsxGqpWCtrspLomKVugh7nrZ/ezNhfTrJqaoVDMT8ymhr55qr+6mudQBu8MEt4ZpDQZCDIN2GYiXSa/8W7ZUbV62ErFU6BaJ/kvnxJfUNLwRG2Nx3mNzGvPpJHAgytwJY0YVXyX0zCfIQCSAxmcsndbc5hT8qt+fjduDTNEz+81cRmq6H6gBhyl9EOg9c0Rg79TgTUhJytgFeQcj3XkOUwYcn0KJpLjc3ChlbzDOYBMzivUrzd4fan+t4EcSQHfHlS3fle9PCLYF1I9VpkEzmTZwFTGdHgNpEUzLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Wed, 23 Apr 2025 15:26:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 15:26:51 +0000
Date: Wed, 23 Apr 2025 10:26:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v3 2/3] drm/xe: Expose PCIe Gen4 downspeed attributes
Message-ID: <dk3v7gq2x3sjgb6qzlo3kkurev57itpnwivgjxgwahjmj2cjzo@7zpoqczh74la>
References: <20250417111233.2322000-1-raag.jadav@intel.com>
 <20250417111233.2322000-3-raag.jadav@intel.com>
 <02d74b93-563e-4fab-a330-f05cf1898ca5@intel.com>
 <aAipZ3pFfD_w7e2z@black.fi.intel.com>
 <05dc8b40-a37a-4fc6-a759-d1ddc0a6c56d@intel.com>
 <aAjIvZ0eqLBsI2Nt@black.fi.intel.com>
 <csahlwfbgaxsm7rf4g5i747wftr5zet7ta434jop5vr2he5lmw@baknat76wftw>
 <aAkA1swWzrROJbqv@black.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aAkA1swWzrROJbqv@black.fi.intel.com>
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: d9517d5c-2970-41a9-1337-08dd827b451e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P987s7ABd1N/lRi+koiZA+7ApjDDr0V2jBZTeWp8JJt6WsQOb1kTxogjzDci?=
 =?us-ascii?Q?n8ix+rtET+80I+llPTsE07dQjSwAPx6umrG9bX0DhRj4K9pYbeieCeL0pd0b?=
 =?us-ascii?Q?9hU0DASOQ5QdoZU5Q+4a5a0O6Ej923f79aFGkMuSk2N0XqnjaKrTbJZMLknp?=
 =?us-ascii?Q?UXBSNaOBxovA87VWIb1mGYGaW0Fe9CrUVNAFHHz6gcDnQEOT9g009houwcYN?=
 =?us-ascii?Q?SJc7ZRCQHw/QpZZVccelgnXvdtEsEb0BdCG6rk6YDUbuhKPebbth2Ps+jWKK?=
 =?us-ascii?Q?2y+tTiYxtI0sslDP5Edgg6ZkoVmH2ROlSADV5Lj7ahEP5iF+VeMoeOCQmeoX?=
 =?us-ascii?Q?MNaOy54vZAREL8uUv6z6WDDb+9hyg55tLAQ4Pg36YnMVOfMa6fKfENp/+g2m?=
 =?us-ascii?Q?n68PxijANSLrw/Z9tKdu+e/mZkgYb3MKlcSr8O2BZLeUmHPbaG5FK2MhZaF6?=
 =?us-ascii?Q?i/pil284n3iAaDaFNeicY9TMSNjXrBCqU9cU3e6IlTWz9qoV9qxIEyLPYa4J?=
 =?us-ascii?Q?Dd6eUi8ZiP8XLK8vKSfJnZx9gpd3aqpWMKwV5Y66SIn0WnNR3MgysZCnJNky?=
 =?us-ascii?Q?x/SG4gNXcau0LX4blywsYvxXoEM8oVI5PxNxd9wkG2oBbvpFqTkO9zIXbgJE?=
 =?us-ascii?Q?uPICV3naY0O6S0OvUtEdoZiS6XvY5+IV6YTTSFRIeruKfWFOqpUm9jYbCnwg?=
 =?us-ascii?Q?rjppPJV/zzXuxXlnx5tw3ZCdz0mY2wBKCyR4MRQINYThAkSJNFI4KcodxZKl?=
 =?us-ascii?Q?4KB9LseaYitM/nrx4chHnCeigsQ1hXV4KCEHVGPKR/78N9yIc9wgiBQ89UvB?=
 =?us-ascii?Q?/2xqXcN3/CxqazDp2KclP07jDEEFPxJleBiCecH0mdd7jkFXcEBzabjhHg8L?=
 =?us-ascii?Q?uMtOx++sqKEnCor6xqQtwmwkfaAbx4KubivJprT8LOjlvlG188B8kfD/pnjA?=
 =?us-ascii?Q?vg9MB9zvkTkf5jbjQCGxJnrvwyu18nRHOJrQxiv+I0npeHGskACGYXRTm6hU?=
 =?us-ascii?Q?RVSkX0itLpb6tfxGUynQN02ekZxpkC6RWcwHi1grDCJUMWf+crIPCzv8GQs4?=
 =?us-ascii?Q?RKarm3DS8iFvLkvtT87KENzVmJ83PmRpRdJDGdFlGFHOkKde58++OEgw5lHw?=
 =?us-ascii?Q?00a7kyAf34BRds4yFKKQqlZGW1o5JJJSd56fWe/D/ONBfzC+pGubjjeXL9Cx?=
 =?us-ascii?Q?QGtVGmlC9pewyCXnHtJfNot9SOA5JgsDjHlncZhcyf2XBZ6f5z3P4+vLfohX?=
 =?us-ascii?Q?UBmSUY2yZ/gn0nBw8Q4ZfA0go6H5dDN1+b2NDYIwSDwjdiXHPs4V04To/aP0?=
 =?us-ascii?Q?10VhN4La/ruNEyllHQNq9ze6VfAJajI0CtCmghBBp3RMeR5xBC/962nBtIKq?=
 =?us-ascii?Q?xG8pSMeyOK3iz5XcBLdrG9Efz+g9EVFEzS7DZ0cjeZ7Zu8SsUVgqjnO2pLai?=
 =?us-ascii?Q?eN3/gOKyhH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WUUX1bSGGlnAWfzxe3dB1dSEBItyPsDWRaB74HoNT45iegzXVRyme1wL4By7?=
 =?us-ascii?Q?U8vxopqk77MgQuncLtHdm6K1tYYUCSxQeUA2YUcOJJEgpaHpmBmLvCm5HQak?=
 =?us-ascii?Q?13Bsk5XUHJEehMb3ox8Dw3c9jRhNWxBIuLiDKncaTnttaMc6WnyxdbUjf0SJ?=
 =?us-ascii?Q?ZqLWcVjZrA8i55ND5yFLahxfCbTLP2zLdbhkdXQqq0F+8GoRLpkFmfBmikK4?=
 =?us-ascii?Q?eC6cYt3vLaKmbCq+6zSDFpW/qMhHGp0XMX6SOKmtSWSGJXptZBCWBzycazxY?=
 =?us-ascii?Q?TMSgXNkIc4YCiNd5O9Jwy4kiZwr+rE3pEjSVfrk6Q3u8hQ3YWONdApfBFvAx?=
 =?us-ascii?Q?grzGmKW85aNbULoQSd/uwiSE0n9aFb3w9R3QIwI+V+mhRFgdU98eLloMhEN9?=
 =?us-ascii?Q?2sKLrR3EkRlNgYzOYl63rxvYL3kXZOpekhALtmH/kO3AeFlamZp1YJFfMNUA?=
 =?us-ascii?Q?qQVMriAZgTI2J75h5ORbP/YwzHzcxeqK+KLXibPcjDZAsuy73ZrlHWLpGWHj?=
 =?us-ascii?Q?hQTsrP77DoGdemaZ0FR3Damfq8OHA38nNVkVHMx2GW1Eyw2SU7HL6XhRFez5?=
 =?us-ascii?Q?Lp3WW6cqMtKy64+B6VycJtlqY74ueLiYDpCrkV8mm07kD9XSN+4Lmb9wCiHd?=
 =?us-ascii?Q?8sYQsf9owhqbetlva0hQwvkfCyJP6116qnl+SESvc3ds4eGdTW5GxnJkpz7/?=
 =?us-ascii?Q?0uGbtpjNINCp7Oyx4O7RJ+TaD+ffmWSVtioCqrfw4/zfk8x10Nmgubib6M59?=
 =?us-ascii?Q?zjo10dDJbMRJNrJ1siAPYziy6kzI3miMTqJxLafXMx/0kCGHp/3hs93kcAPz?=
 =?us-ascii?Q?gxdqZhbtM6XRo4VVxbtcGjzEUOtlzCiTgAZFK7B9RgdCxPWUhuXFO1Ktk46o?=
 =?us-ascii?Q?wj1u2YHNNI4nQwlE49r+QF1lepi7xGx5boFfKOSq9FkOLVcc12R7VsHOutgw?=
 =?us-ascii?Q?WR2UrthBY0t1dyP4HdHUSHPcTKLpRtwSwl6eBjW9gmDUb/ZGrmHC1v5tt+0t?=
 =?us-ascii?Q?wgnc+IfhguNVXySc7UALyZNf2U6VL7fDzKqGu2uIZwp1nNSD44VVNAswbaYl?=
 =?us-ascii?Q?Hw0dGsVWAsVMvSBTzOIFayB8jDoEIW9buopWXbn41tfxEVjZJzdsNBfuaDFT?=
 =?us-ascii?Q?U4dmtPC8rcob3ASut4iCBlIG1lBdJJYfi77geEYaGu53Y/WediQJjckSGGmg?=
 =?us-ascii?Q?nOZy9Lg0Ay6BLc/I8j+pfQ5TNGH+w2xrrQLbXLIiS5w/hH0rQrlsFdR7iUgz?=
 =?us-ascii?Q?uWbcMdUC4Qf4XREC+SHM9YkhULIW+UDM0u5AsMTf6aPbGfuMXtXHeyKO7EZ9?=
 =?us-ascii?Q?x6QBK/2aQ57myohZ3P3T1d8bwFz/gXo7ymHBl3dZenoGb5C0N48iwXztJdem?=
 =?us-ascii?Q?4KwZ0OfY6Y9pAVS1892f/iqzBELZXN13M1i9SD07mkF0Fmz0Uu527gEfpsn4?=
 =?us-ascii?Q?0eHld08J5NK80yJr0SiTXkjbpc+ZGdUp//vvAu+rfzdaRAvd+hlOSCiDl4PC?=
 =?us-ascii?Q?yCCLaroHHrdnJUIyhzgOOsOVFPrIzT4k5Q3v4OST9mfVcd9lNcupvye2khu9?=
 =?us-ascii?Q?y0NqUUlP/DxwEA2+EVmOZUr21Na0J2wO8m0iK9dFv9x797iDqbJUx6LgOlwD?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9517d5c-2970-41a9-1337-08dd827b451e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 15:26:51.2315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 17mfjCBmMJI2Aa+GteMoxe9LAD9MfUxoyGfXbsRHZJlpbwGSrz4pLRwIIxYpwzYT+aP/ddTJ8ls+dv2elvaVXSJCzISDrWo74cXopoFuVgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
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

On Wed, Apr 23, 2025 at 06:01:42PM +0300, Raag Jadav wrote:
>On Wed, Apr 23, 2025 at 08:35:42AM -0500, Lucas De Marchi wrote:
>> On Wed, Apr 23, 2025 at 02:02:21PM +0300, Raag Jadav wrote:
>> > On Wed, Apr 23, 2025 at 03:29:41PM +0530, Riana Tauro wrote:
>> > > On 4/23/2025 2:18 PM, Raag Jadav wrote:
>> > > > On Wed, Apr 23, 2025 at 10:55:30AM +0530, Riana Tauro wrote:
>> > > > > Hi Raag
>> > > > >
>> > > > > On 4/17/2025 4:42 PM, Raag Jadav wrote:
>> > > > > > Expose sysfs attributes for PCIe Gen4 downspeed capability and status.
>> > > > > >
>> > > > > > v2: Move from debugfs to sysfs (Lucas, Rodrigo, Badal)
>> > > > > >       Rework macros and their naming (Rodrigo)
>> > > > > > v3: Use sysfs_create_files() (Riana)
>> > > > > >       Fix checkpatch warning (Riana)
>> > > > > >
>> > > > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>> > > > > > ---
>> > > > > >    drivers/gpu/drm/xe/xe_device.c       |   5 ++
>> > > > > >    drivers/gpu/drm/xe/xe_device_sysfs.c | 101 +++++++++++++++++++++++++++
>> > > > > >    drivers/gpu/drm/xe/xe_device_sysfs.h |   1 +
>> > > > > >    drivers/gpu/drm/xe/xe_pcode_api.h    |   5 ++
>> > > > > >    4 files changed, 112 insertions(+)
>> > > > > >
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> > > > > > index 6c9d3009aa03..79b7b0ecfbae 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > > > > @@ -26,6 +26,7 @@
>> > > > > >    #include "xe_bo_evict.h"
>> > > > > >    #include "xe_debugfs.h"
>> > > > > >    #include "xe_devcoredump.h"
>> > > > > > +#include "xe_device_sysfs.h"
>> > > > > >    #include "xe_dma_buf.h"
>> > > > > >    #include "xe_drm_client.h"
>> > > > > >    #include "xe_drv.h"
>> > > > > > @@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
>> > > > > >    	if (err)
>> > > > > >    		goto err_unregister_display;
>> > > > > > +	err = xe_device_sysfs_init(xe);
>> > > > > > +	if (err)
>> > > > > > +		goto err_unregister_display;
>> > > > > > +
>> > > > > >    	xe_debugfs_register(xe);
>> > > > > >    	err = xe_hwmon_register(xe);
>> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > > > > index 2d25e5b5d4bf..923612a0a2e0 100644
>> > > > > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > > > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> > > > > > @@ -11,6 +11,9 @@
>> > > > > >    #include "xe_device.h"
>> > > > > >    #include "xe_device_sysfs.h"
>> > > > > > +#include "xe_mmio.h"
>> > > > > > +#include "xe_pcode_api.h"
>> > > > > > +#include "xe_pcode.h"
>> > > > > >    #include "xe_pm.h"
>> > > > > >    /**
>> > > > > > @@ -81,3 +84,101 @@ int xe_pm_sysfs_init(struct xe_device *xe)
>> > > > > >    	return devm_add_action_or_reset(dev, xe_pm_sysfs_fini, xe);
>> > > > > >    }
>> > > > > > +
>> > > > > > +/**
>> > > > > > + * DOC: PCIe Gen5 Update Limitations
>> > > > > > + *
>> > > > > > + * Default link speed of discrete GPUs is determined by configuration
>> > > > > > + * parameters stored in their flash memory, which are subject to override
>> > > > > > + * through user initiated firmware updates. It has been observed that devices
>> > > > > > + * configured with PCIe Gen5 as their default speed can come across link
>> > > > > > + * quality issues due to host or motherboard limitations and may have to
>> > > > > > + * auto-downspeed to PCIe Gen4 when faced with unstable link at Gen5, which
>> > > > > > + * makes firmware updates rather risky on such setups. It is required to
>> > > > > > + * ensure that the device is capable of auto-downspeeding to PCIe Gen4 link
>> > > > > > + * before pushing the image with PCIe Gen5 as default configuration. This
>> > > > > > + * can be done by reading ``pcie_gen4_downspeed_capable`` sysfs entry, which
>> > > > > > + * will denote PCIe Gen4 downspeed capability of the device with boolean output
>> > > > > > + * value of ``0`` or ``1``, meaning `incapable` or `capable` respectively.
>> > > > > > + *
>> > > > > > + * .. code-block:: shell
>> > > > > > + *
>> > > > > > + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_capable
>> > > > > > + *
>> > > > > > + * Pushing PCIe Gen5 update on a downspeed incapable device and facing link
>> > > > > > + * instability due to host or motherboard limitations can result in driver
>> > > > > > + * failing to bind to the device, making further firmware updates impossible
>> > > > > > + * with RMA being the only last resort.
>> > > > > > + *
>> > > > > > + * PCIe Gen4 downspeed status of downspeed capable devices is available through
>> > > > > > + * ``pcie_gen4_downspeed_status`` sysfs entry with boolean output value of
>> > > > > > + * ``0`` or ``1``, where ``0`` means no auto-downspeeding was required during
>> > > > > > + * link training (which is the optimal scenario) and ``1`` means the device
>> > > > > > + * has auto-downsped to PCIe Gen4 due to unstable Gen5 link.
>> > > > > > + *
>> > > > > > + * .. code-block:: shell
>> > > > > > + *
>> > > > > > + *    $ cat /sys/bus/pci/devices/<bdf>/pcie_gen4_downspeed_status
>> > > > > The code looks good. But i am not sure of the word downspeed.
>> > > > > Couldn't find downspeed used in Pcie generation context. For link,
>> > > > > it is mentioned as  'link downgrade'
>> > > > >
>> > > > > Could you share if you found any?
>>
>> I'm with Riana here and also found it strange. User is cat'ing a file
>> inside  /sys/bus/pci/devices/<bdf>/ - it's odd to use downspeed when
>> that word is not used in PCIe spec and...
>>
>> > > >
>> > > > Since we're describing both firmware and PCI link in the same document,
>> > > >
>> > > > 1. It helps distinguish between them.
>>
>> I also don't understand the distinction you are trying to make. The
>> firmware is there, monitoring the communication and and is capable to
>> auto downgrade the link to gen4 if it needs to. I imagine that if this
>> situation happens, the link speed is re-negotiated and we will end up
>> seeing the new one on LnkSta... LnkCap still shows what is possible. The
>> only difference I see here from "I'm connecting a gen5 capable device on
>> a max gen4 slot" is that initially the gen5 is attempted (since both the
>> host and device report they support it), but the firmware may make a decision
>> in runtime to "downgrade the link speed".
>
>And all of this will take place when the user is doing a "firmware upgrade",
>and this can potentially open the door for "link speed downgrade" to be
>confused with "firmware rollback (downgrade) done for the link speed",
>which is not the case.

I think it'd be a stretch for the user to read a file named
/sys/bus/pci/devices/<bdf>/auto_link_downgrade_capable and think it has
anything to do with firmware downgrade/upgrade... it's called **link**
downgrade. There are already other files there with similar naming:

$ ls -l /sys/bus/pci/devices/<bdf>/ | grep link
-r--r--r-- 1 root root 4096 Apr 23 08:19 current_link_speed
-r--r--r-- 1 root root 4096 Apr 23 08:19 current_link_width
drwxr-xr-x 2 root root    0 Apr 23 08:19 link
-r--r--r-- 1 root root 4096 Apr 23 08:19 max_link_speed
-r--r--r-- 1 root root 4096 Apr 23 08:19 max_link_width

>
>> > > > 2. This information is for the end user and has to be translatable enough
>> > > >     regardless of what spec says about it and the distinction reduces the
>> > > >     chances of misinterpretation.
>>
>> when you introduce a new term that is not known, I'd say the effect is
>> pretty much the opposite and it can be even worse if a future pcie spec
>> starts to use that term.
>
>Agree, unless we're expecting users to be informed about the spec to be
>able to flash their firmwares. But if you insist, sure will _upgrade_ the
>document ;)

the recommendation that the user should read any file like that before
trying to flash a firmware is completely broken - that should be done
by whatever is flashing the firmware.

Lucas De Marchi

>
>Raag
