Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4F4C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 19:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C124810E333;
	Tue, 22 Apr 2025 19:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W27lPZMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CA910E333
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 19:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745349535; x=1776885535;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NyNU6cLt3uY9HejJkqAmD/mnxUxw9TcHkYaCxGZw2hA=;
 b=W27lPZMFJcFzkPKbEuicNhrwtEXI70prMTMiMpcd8//uQqVX9quAVy+e
 MNOofiseCAkcJuuNOTo0D07NxjJY0tLJEeUzJeOLT/WI7MPp3dQqZAgQZ
 h040NNRHJw4DLh/jhSSAo5CYz0jKU2DPwKyLJIYGf4uO6fOF2McmLqpj0
 cDYsUZH7Y1lv1QOV52871zCm1MiwuoLwEfORhuIMa1/cvdlx2MulH6Uzl
 7V+MyuQQxG/dx+ddGstMQLpbk+dfkEgxeSU9THucovLdyW4iQJ2aR3KB1
 9GYTJJ+bUhP394YgOqMcDoFQxhOLZ/9mJPTUBM8StB/mlnXAgvXH2eXdB A==;
X-CSE-ConnectionGUID: ha4/AAZFSHWL3JfPutYqIA==
X-CSE-MsgGUID: iJ7c6WZDSDejN7KMg4IVLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64454006"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="64454006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:18:55 -0700
X-CSE-ConnectionGUID: C+IQHfTcRKGHNFoQifqwbA==
X-CSE-MsgGUID: oMuMgoAjTXOraX0aMf66cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="131994067"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:18:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 12:18:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 12:18:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 12:18:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXJnXgF/kdtmGzTS8zGAPuynD1PbxCN5VeDszCyT5jxbylLmITJyxoUQhK0ILysmtMRXKXA1I6E2wvqMcMpgMlHblBFLsYB0O1X2Xl3MobKmcnb6mCVTqx4h/FK4Ar/3DwdBNR4g7WbHJtsjZpa9tLD+TjcS4Z4wNkgE0K9yT1x+AxZZJHXKpw3VNTUap3vWMujlOEFdBjAK4kWPRg2V4wXaMinZatTsdShwWdnW56rkitJ41gOxsdJedCOgLMVvFClLqllMqBXJxkAKklg3i2+tQoValu+J4627QtIYCt9uRJTj1x/bAMs7N7SNtbLcroyd6Z/UWJiWSQGQ/GkQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PT0oh4JGIMrNHYOMLuTsm/yAyF66Yms6HX2k/6qH5jc=;
 b=JnZD9nc5zuHsex1JPxNHO5u7F9KacCkcQKGBX5AZDlkQ3BnLy7HUPXQcwawo2Dj+z7IF48NTPaWkHbqKWIYZ5eCWMY8hhgEvMHOZKmehCqVEyT2jx0iq5RtB065vt+rKHLNgBw6Rg3lBXsiywEFbqiaPqTQprA7KG09ZB+xVCJUi7jHo64XMQJLgclrsrB9lInoHtC4sxiEt0nX2DuaIid0+sBCDaPJ55hft3KkPlf45FA+sAhRWUn3qxF6Lq72hrHsUfdHxERZu8BR59ZiYRqpfTodX1xMA3fppIJXEjNeoVfDBZYVCoAc6qMpL6heaoJVKfaOo9fA6aSYFlI2AmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 19:18:36 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 19:18:36 +0000
Date: Tue, 22 Apr 2025 15:18:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Fix CFI violation when accessing sysfs files
Message-ID: <aAfriaiYgLLxtLDi@intel.com>
References: <20250422171852.85558-1-jeevaka.badrappan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422171852.85558-1-jeevaka.badrappan@intel.com>
X-ClientProxiedBy: MW4P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::11) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3bcf41-982b-4114-e5e0-08dd81d27afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g89+HhroklZRxl4wgZ9T5ATfY1Ev9und1BseV+ORnRDmMPX31eieRPA48Reu?=
 =?us-ascii?Q?+oyk1y1aAzHYFLY+6YSkuiZmwuypUf5Z6MqBSiA/wwHZ2Jq54jwIiSgxweLQ?=
 =?us-ascii?Q?bpWkEJPWTUPEUo/A0fyKbdQaW5jDPo5roZaVSPT+gYNT8whEtNSXdZkRliOT?=
 =?us-ascii?Q?59q4O0g6b15fUinEf6U8ogFGSY/XbfS/knuFnlrkodFrpMdEbwUP8tGRa9s0?=
 =?us-ascii?Q?9vKgCnagsyN8wr36Qc3XWkKBNnLsjJk96BWrMw89nbekCZOI6tY/B1D0vi7X?=
 =?us-ascii?Q?YrPCI+EjT0czU59IX5hQh88PH38vM0bsThAHgQmJh1oR07K1BeKcelPi7I9/?=
 =?us-ascii?Q?1iL9O79VFtYWzQEyiTDEsw4C6c8O4jboX/s2HY3849GV8Ev/FH05R7qicyGq?=
 =?us-ascii?Q?rrx72sJoyOav+bKcCDorlY9+UtBiVB8nvACDjtDjLkYLnWaBIV5Z6vme+V/h?=
 =?us-ascii?Q?qw6CSYZpve4M7znVTDowgiMVgxfvJ+YiCtcPohqOURYui/ozkGFRGEDBWFC7?=
 =?us-ascii?Q?2qDtA2F5I564yU1z2rwxsYWgNokh/anCnobAeohhCmSJ1M9p3RRZF6GkcEV4?=
 =?us-ascii?Q?7Oyu5Sv8nU9X1uVlHE3D7oK9eanSsBoOHPC7sfpBsRtH3i7mHv3I3PwOdg3H?=
 =?us-ascii?Q?UnizF0eEARqDaUbux8aa80PtBP/sRcvztG1C2OKh3QvECZUouyZIz08+XZ/+?=
 =?us-ascii?Q?zY4Vi/wdSCEPChFqjIGFe14uNtPEKcmP56cubYYPqpCD7uIVGBUJoFDhMGxG?=
 =?us-ascii?Q?bt9QXwH9IWklI2KsmS02XSa9nAcvfqjP47BPxxHYs2mE94uljgq69NXz1x+t?=
 =?us-ascii?Q?AKYTVO6EwkhPRHok4wd9368dXzpBIuYS43Fug13FMGurr05zpU1j36g8BgQI?=
 =?us-ascii?Q?qUVRrjOr/P0hLOGp2W/BVOM3bbm48o1ZIWtsSZXWvKBBowIZz0jqVD0miawc?=
 =?us-ascii?Q?qeoe0DqZRFaCkKe+uEM8ouW+BEudGp7lWpDpcASWRAGs+r9yDpvEkGbBbs3E?=
 =?us-ascii?Q?mWOmIyOQV1OAHoksNxlf8EtmTdA/LwLHHWA67PDoSRQsr3yQlCiVNe04Yexe?=
 =?us-ascii?Q?CuvG7Z/hqGJAH9BQJaFGV4xtdouFIdTW/vT1EJMmhB5VI2yorcmTSEOTZsAO?=
 =?us-ascii?Q?wq/klGh4m1+FayaYrJ/pmjWltrxwCNUUaucpy+xxyeBtRc/+ywVAqWPD1dmM?=
 =?us-ascii?Q?rMlY5ufBkd2Pprqd17Zk8lS6dCQW7MjIjo8i/OnsuPc0PN2iAvikb+wHAGv+?=
 =?us-ascii?Q?tm0I287kb/EarUSHwb5y/SIq0Cod7UYTWOuJfgc9tFc+xIVInjEuG0VwdlaF?=
 =?us-ascii?Q?GQZV8t6sRgAsY2Rh34FFjUUh2+5+WdllnqohNKNBaHGWl/J7+WVcek+Lx853?=
 =?us-ascii?Q?UVBuPzCw3dXQWNVQLXYSv7VI+R+X0PUbtEch88Nzj9o4laNMswvSHs79af+0?=
 =?us-ascii?Q?h7dlzGVST+s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XJNM+xuJCrlNqwIC6S4gAIYHYW+blxhalR1BuIftZ9ms0K53rOajqge3YMcS?=
 =?us-ascii?Q?AfMnqLoXJuGYN7v+aVwhGKxBQ8O20q/IPIwPv0hmkGKTS+2W5kAODQHX3JUf?=
 =?us-ascii?Q?lBFjgkYPoPDeh6neSLczp3d8FcI8oWDsDn2FgJdk2AZQ1XchSOYKaznpWSlC?=
 =?us-ascii?Q?NQylVZ6YIuYiaNLDe5S0YuQrNPao91dSXxmPdE0kgmCCyoQ1Oz3PZ9ArHtwh?=
 =?us-ascii?Q?FE25UB1JjlNCAZzhTNIVFKsmWQsZAWcG7YbvcmAdNSalR9LoW6K5xPq4jtk/?=
 =?us-ascii?Q?+gyxB7exfdD5QbIhb8qeMIMD40Tj4li6MZl59ZLLb3VmlZfBDKmBjylSHmFo?=
 =?us-ascii?Q?Yl0QOUp7VoEh8H6Mfje55AcffInJ08J0JgMK35+z/zCghPbgpYySfRBw1ZwG?=
 =?us-ascii?Q?QTSLO4TXaXaW2saIl5oII53ss4kPLPTEhkCemamJn0ElWlnbjn8WQKuMX7rv?=
 =?us-ascii?Q?8quo+jOdo1DPZ6kxX2BBvyJv0kfGAwW3I7kCU9opO9S3PjmKjTMURgWffOk6?=
 =?us-ascii?Q?Lvrj29SbFjG3lG22O1S8mSRJtMtxd6sSERZ6zzcXlwdvS2DT/yhgkDrY3UOI?=
 =?us-ascii?Q?4WXc03UrOjX0FYJoMM/Zi8kICQc5o07TjVyOaFZGkea99ALgU5ttu8hYIEkk?=
 =?us-ascii?Q?HLGYfQtWcaLFTPRvn83cGhcOz7x0zQ+Q1ulxBNj6VFm7OKkJTkyg54fxHf67?=
 =?us-ascii?Q?wB9kD+Q3daGHDBS3L/V/JJDH6GOIZe1RzRAJkmlxvD8BSQ1lR843XdL08A8F?=
 =?us-ascii?Q?8TE1+esv29kzVFtE76wVMNKgWkaI4LGQfkOQ/UcUmMqIe0lKmM9FORNO0oE5?=
 =?us-ascii?Q?liFUC8ufM0mkgpjfcynkRGEIt85vSzoCwrTggK6XVs8OPjLuliAjuLXQOtPq?=
 =?us-ascii?Q?5desExT+0M8ygDqfI1qOmihZPfx9OV+/vLcC0XtxBu+A8QVTR0+9FGsAIKgL?=
 =?us-ascii?Q?1KF05DjsYVk231BJyE5Lxja2qSZLB3cWxdKVRbJKpb9ypsg6gE53c0ZFvbdI?=
 =?us-ascii?Q?WjPD5L95LZDiK5rDzsLn3MrCG1YRF5i7p0383GzB/C0iVFkmS1V3MVnAVC5h?=
 =?us-ascii?Q?4WZiGGEu3zXKFOIgmljtInSzv/88RRrFHf/6QJ2NtBM7D2MZxny4h0+X5ND3?=
 =?us-ascii?Q?vVdMoMBM7FS21s9FdQFuANv7JAbZmNGnKHj/M6edHqiV/SHjx9GFWNKKXpC5?=
 =?us-ascii?Q?wPXkkTQ/X7lrkFQ9NBEbaanHGuh8DoGZ4yhgWAT30VaOrE0JWoJPAGzcthJs?=
 =?us-ascii?Q?qqJwkzDQdZ760IXmwL88/n4qPtY5iSy7ndBUHxmGksAc6xSYN/Lx4z0Pj8Dd?=
 =?us-ascii?Q?G5BacC4r24XucjcM627Dzx1ajAlPVIrJY2Hk4DE7uHYBoN2aJnhSGrGjp52A?=
 =?us-ascii?Q?wDAF5TFu0gSKUG8MU87GM7siD1ez57CUw0HZox2NOsh9XZ9VW9NvFEXYDCT5?=
 =?us-ascii?Q?W1oAzMB+ccFs6SfQPxDID9CS6kzS8iulHqnmIFZ1SPskBMugT0vbc+ziy8Jz?=
 =?us-ascii?Q?4k40ZCzggkgbu3NA0cl8SPZQJGX9ZU7rejH19jtx0Sf4mwaXNYZ/WaxpCljT?=
 =?us-ascii?Q?p2jldGIaxBjafESatEp9hAlVHGjABT00Y5FF6Wb1GHRml3NwfKZHNih8pNs6?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3bcf41-982b-4114-e5e0-08dd81d27afb
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:18:36.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQV+J4EZFiW1Ss7TylMzKqXd8vpP7jaZQTDMJuEKLiCNWP9G8Vf2YnVw0oNSNokcH4CDioC92odJTJSqaiai1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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

On Tue, Apr 22, 2025 at 05:18:52PM +0000, Jeevaka Prabu Badrappan wrote:
> When an attribute group is created with sysfs_create_group() or
> sysfs_create_files() the ->sysfs_ops() callback is set to
> kobj_sysfs_ops, which sets the ->show() callback to kobj_attr_show().
> kobj_attr_show() uses container_of() to get the ->show() callback
> from the attribute it was passed, meaning the ->show() callback needs
> to be the same type as the ->show() callback in 'struct kobj_attribute'.
> 
> However, cur_freq_show() has the type of the ->show() callback in
> 'struct device_attribute', which causes a CFI violation when opening the
> 'id' sysfs node under gtidle/freq/throttle. This happens to work because
> the layout of 'struct kobj_attribute' and 'struct device_attribute' are
> the same, so the container_of() cast happens to allow the ->show()
> callback to still work.

I'm trying to understand why the other users of DEVICE_ATTR doesn't face
similar issues.

But anyway, the patch below looks good and it aligns with the sysfs include
itself, although less used then the device attr...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

but I'm still puzzled...

> 
> Changed the type of cur_freq_show() and few more functions to match the
> ->show() callback in 'struct kobj_attributes' to resolve the CFI
> violation.
> 
> CFI failure seen while accessing sysfs files under
> /sys/class/drm/card0/device/tile0/gt*/gtidle/*
> /sys/class/drm/card0/device/tile0/gt*/freq0/*
> /sys/class/drm/card0/device/tile0/gt*/freq0/throttle/*
> 
> [ 2599.618075] RIP: 0010:__cfi_cur_freq_show+0xd/0x10 [xe]
> [ 2599.624452] Code: 44 c1 44 89 fa e8 03 95 39 f2 48 98 5b 41 5e 41 5f 5d c3 c9
> [ 2599.646638] RSP: 0018:ffffbe438ead7d10 EFLAGS: 00010286
> [ 2599.652823] RAX: ffff9f7d8b3845d8 RBX: ffff9f7dee8c95d8 RCX: 0000000000000000
> [ 2599.661246] RDX: ffff9f7e6f439000 RSI: ffffffffc13ada30 RDI: ffff9f7d975d4b00
> [ 2599.669669] RBP: ffffbe438ead7d18 R08: 0000000000001000 R09: ffff9f7e6f439000
> [ 2599.678092] R10: 00000000e07304a6 R11: ffffffffc1241ca0 R12: ffffffffb4836ea0
> [ 2599.688435] R13: ffff9f7e45fb1180 R14: ffff9f7d975d4b00 R15: ffff9f7e6f439000
> [ 2599.696860] FS: 000076b02b66cfc0(0000) GS:ffff9f80ef400000(0000) knlGS:00000
> [ 2599.706412] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2599.713196] CR2: 00005f80d94641a9 CR3: 00000001e44ec006 CR4: 0000000100f72ef0
> [ 2599.721618] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 2599.730041] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
> [ 2599.738464] PKRU: 55555554
> [ 2599.741655] Call Trace:
> [ 2599.744541] <TASK>
> [ 2599.747017] ? __die_body+0x69/0xb0
> [ 2599.751151] ? die+0xa9/0xd0
> [ 2599.754548] ? do_trap+0x89/0x160
> [ 2599.758476] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
> [ 2599.768315] ? handle_invalid_op+0x69/0x90
> [ 2599.773167] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
> [ 2599.783010] ? exc_invalid_op+0x36/0x60
> [ 2599.787552] ? fred_hwexc+0x123/0x1a0
> [ 2599.791873] ? fred_entry_from_kernel+0x7b/0xd0
> [ 2599.797219] ? asm_fred_entrypoint_kernel+0x45/0x70
> [ 2599.802976] ? act_freq_show+0x70/0x70 [xe b37985c94829727668bd7c5b33c1d9998]
> [ 2599.812301] ? __cfi_cur_freq_show+0xd/0x10 [xe b37985c94829727668bd7c5b33c1]
> [ 2599.822137] ? __kmalloc_node_noprof+0x1f3/0x420
> [ 2599.827594] ? __kvmalloc_node_noprof+0xcb/0x180
> [ 2599.833045] ? kobj_attr_show+0x22/0x40
> [ 2599.837571] sysfs_kf_seq_show+0xa8/0x110
> [ 2599.842302] kernfs_seq_show+0x38/0x50
> 
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_freq.c     | 82 ++++++++++++++------------
>  drivers/gpu/drm/xe/xe_gt_idle.c     | 28 +++++----
>  drivers/gpu/drm/xe/xe_gt_throttle.c | 90 ++++++++++++++---------------
>  3 files changed, 107 insertions(+), 93 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 604bdc7c8173..868a5d2c1a52 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -56,9 +56,10 @@ dev_to_xe(struct device *dev)
>  	return gt_to_xe(kobj_to_gt(dev->kobj.parent));
>  }
>  
> -static ssize_t act_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +static ssize_t act_freq_show(struct kobject *kobj,
> +			     struct kobj_attribute *attr, char *buf)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  
> @@ -68,11 +69,12 @@ static ssize_t act_freq_show(struct device *dev,
>  
>  	return sysfs_emit(buf, "%d\n", freq);
>  }
> -static DEVICE_ATTR_RO(act_freq);
> +static struct kobj_attribute attr_act_freq = __ATTR_RO(act_freq);
>  
> -static ssize_t cur_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +static ssize_t cur_freq_show(struct kobject *kobj,
> +			     struct kobj_attribute *attr, char *buf)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  	ssize_t ret;
> @@ -85,11 +87,12 @@ static ssize_t cur_freq_show(struct device *dev,
>  
>  	return sysfs_emit(buf, "%d\n", freq);
>  }
> -static DEVICE_ATTR_RO(cur_freq);
> +static struct kobj_attribute attr_cur_freq = __ATTR_RO(cur_freq);
>  
> -static ssize_t rp0_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +static ssize_t rp0_freq_show(struct kobject *kobj,
> +			     struct kobj_attribute *attr, char *buf)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  
> @@ -99,11 +102,12 @@ static ssize_t rp0_freq_show(struct device *dev,
>  
>  	return sysfs_emit(buf, "%d\n", freq);
>  }
> -static DEVICE_ATTR_RO(rp0_freq);
> +static struct kobj_attribute attr_rp0_freq = __ATTR_RO(rp0_freq);
>  
> -static ssize_t rpe_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +static ssize_t rpe_freq_show(struct kobject *kobj,
> +			     struct kobj_attribute *attr, char *buf)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  
> @@ -113,11 +117,12 @@ static ssize_t rpe_freq_show(struct device *dev,
>  
>  	return sysfs_emit(buf, "%d\n", freq);
>  }
> -static DEVICE_ATTR_RO(rpe_freq);
> +static struct kobj_attribute attr_rpe_freq = __ATTR_RO(rpe_freq);
>  
> -static ssize_t rpa_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +static ssize_t rpa_freq_show(struct kobject *kobj,
> +			     struct kobj_attribute *attr, char *buf)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  
> @@ -127,20 +132,22 @@ static ssize_t rpa_freq_show(struct device *dev,
>  
>  	return sysfs_emit(buf, "%d\n", freq);
>  }
> -static DEVICE_ATTR_RO(rpa_freq);
> +static struct kobj_attribute attr_rpa_freq = __ATTR_RO(rpa_freq);
>  
> -static ssize_t rpn_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +static ssize_t rpn_freq_show(struct kobject *kobj,
> +			     struct kobj_attribute *attr, char *buf)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  
>  	return sysfs_emit(buf, "%d\n", xe_guc_pc_get_rpn_freq(pc));
>  }
> -static DEVICE_ATTR_RO(rpn_freq);
> +static struct kobj_attribute attr_rpn_freq = __ATTR_RO(rpn_freq);
>  
> -static ssize_t min_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +static ssize_t min_freq_show(struct kobject *kobj,
> +			     struct kobj_attribute *attr, char *buf)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  	ssize_t ret;
> @@ -154,9 +161,10 @@ static ssize_t min_freq_show(struct device *dev,
>  	return sysfs_emit(buf, "%d\n", freq);
>  }
>  
> -static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
> -			      const char *buff, size_t count)
> +static ssize_t min_freq_store(struct kobject *kobj,
> +			      struct kobj_attribute *attr, const char *buff, size_t count)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  	ssize_t ret;
> @@ -173,11 +181,12 @@ static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>  
>  	return count;
>  }
> -static DEVICE_ATTR_RW(min_freq);
> +static struct kobj_attribute attr_min_freq = __ATTR_RW(min_freq);
>  
> -static ssize_t max_freq_show(struct device *dev,
> -			     struct device_attribute *attr, char *buf)
> +static ssize_t max_freq_show(struct kobject *kobj,
> +			     struct kobj_attribute *attr, char *buf)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  	ssize_t ret;
> @@ -191,9 +200,10 @@ static ssize_t max_freq_show(struct device *dev,
>  	return sysfs_emit(buf, "%d\n", freq);
>  }
>  
> -static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
> -			      const char *buff, size_t count)
> +static ssize_t max_freq_store(struct kobject *kobj,
> +			      struct kobj_attribute *attr, const char *buff, size_t count)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_guc_pc *pc = dev_to_pc(dev);
>  	u32 freq;
>  	ssize_t ret;
> @@ -210,17 +220,17 @@ static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>  
>  	return count;
>  }
> -static DEVICE_ATTR_RW(max_freq);
> +static struct kobj_attribute attr_max_freq = __ATTR_RW(max_freq);
>  
>  static const struct attribute *freq_attrs[] = {
> -	&dev_attr_act_freq.attr,
> -	&dev_attr_cur_freq.attr,
> -	&dev_attr_rp0_freq.attr,
> -	&dev_attr_rpa_freq.attr,
> -	&dev_attr_rpe_freq.attr,
> -	&dev_attr_rpn_freq.attr,
> -	&dev_attr_min_freq.attr,
> -	&dev_attr_max_freq.attr,
> +	&attr_act_freq.attr,
> +	&attr_cur_freq.attr,
> +	&attr_rp0_freq.attr,
> +	&attr_rpa_freq.attr,
> +	&attr_rpe_freq.attr,
> +	&attr_rpn_freq.attr,
> +	&attr_min_freq.attr,
> +	&attr_max_freq.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index fbbace7b0b12..c11206410a4d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -249,9 +249,10 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> -static ssize_t name_show(struct device *dev,
> -			 struct device_attribute *attr, char *buff)
> +static ssize_t name_show(struct kobject *kobj,
> +			 struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>  	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>  	ssize_t ret;
> @@ -262,11 +263,12 @@ static ssize_t name_show(struct device *dev,
>  
>  	return ret;
>  }
> -static DEVICE_ATTR_RO(name);
> +static struct kobj_attribute name_attr = __ATTR_RO(name);
>  
> -static ssize_t idle_status_show(struct device *dev,
> -				struct device_attribute *attr, char *buff)
> +static ssize_t idle_status_show(struct kobject *kobj,
> +				struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>  	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>  	enum xe_gt_idle_state state;
> @@ -277,6 +279,7 @@ static ssize_t idle_status_show(struct device *dev,
>  
>  	return sysfs_emit(buff, "%s\n", gt_idle_state_to_string(state));
>  }
> +static struct kobj_attribute idle_status_attr = __ATTR_RO(idle_status);
>  
>  u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
>  {
> @@ -291,10 +294,11 @@ u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle)
>  	return residency;
>  }
>  
> -static DEVICE_ATTR_RO(idle_status);
> -static ssize_t idle_residency_ms_show(struct device *dev,
> -				      struct device_attribute *attr, char *buff)
> +
> +static ssize_t idle_residency_ms_show(struct kobject *kobj,
> +				      struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt_idle *gtidle = dev_to_gtidle(dev);
>  	struct xe_guc_pc *pc = gtidle_to_pc(gtidle);
>  	u64 residency;
> @@ -305,12 +309,12 @@ static ssize_t idle_residency_ms_show(struct device *dev,
>  
>  	return sysfs_emit(buff, "%llu\n", residency);
>  }
> -static DEVICE_ATTR_RO(idle_residency_ms);
> +static struct kobj_attribute idle_residency_attr = __ATTR_RO(idle_residency_ms);
>  
>  static const struct attribute *gt_idle_attrs[] = {
> -	&dev_attr_name.attr,
> -	&dev_attr_idle_status.attr,
> -	&dev_attr_idle_residency_ms.attr,
> +	&name_attr.attr,
> +	&idle_status_attr.attr,
> +	&idle_residency_attr.attr,
>  	NULL,
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle.c b/drivers/gpu/drm/xe/xe_gt_throttle.c
> index 8db78d616b6f..aa962c783cdf 100644
> --- a/drivers/gpu/drm/xe/xe_gt_throttle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle.c
> @@ -114,115 +114,115 @@ static u32 read_reason_vr_tdc(struct xe_gt *gt)
>  	return tdc;
>  }
>  
> -static ssize_t status_show(struct device *dev,
> -			   struct device_attribute *attr,
> -			   char *buff)
> +static ssize_t status_show(struct kobject *kobj,
> +			   struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool status = !!read_status(gt);
>  
>  	return sysfs_emit(buff, "%u\n", status);
>  }
> -static DEVICE_ATTR_RO(status);
> +static struct kobj_attribute attr_status = __ATTR_RO(status);
>  
> -static ssize_t reason_pl1_show(struct device *dev,
> -			       struct device_attribute *attr,
> -			       char *buff)
> +static ssize_t reason_pl1_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool pl1 = !!read_reason_pl1(gt);
>  
>  	return sysfs_emit(buff, "%u\n", pl1);
>  }
> -static DEVICE_ATTR_RO(reason_pl1);
> +static struct kobj_attribute attr_reason_pl1 = __ATTR_RO(reason_pl1);
>  
> -static ssize_t reason_pl2_show(struct device *dev,
> -			       struct device_attribute *attr,
> -			       char *buff)
> +static ssize_t reason_pl2_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool pl2 = !!read_reason_pl2(gt);
>  
>  	return sysfs_emit(buff, "%u\n", pl2);
>  }
> -static DEVICE_ATTR_RO(reason_pl2);
> +static struct kobj_attribute attr_reason_pl2 = __ATTR_RO(reason_pl2);
>  
> -static ssize_t reason_pl4_show(struct device *dev,
> -			       struct device_attribute *attr,
> -			       char *buff)
> +static ssize_t reason_pl4_show(struct kobject *kobj,
> +			       struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool pl4 = !!read_reason_pl4(gt);
>  
>  	return sysfs_emit(buff, "%u\n", pl4);
>  }
> -static DEVICE_ATTR_RO(reason_pl4);
> +static struct kobj_attribute attr_reason_pl4 = __ATTR_RO(reason_pl4);
>  
> -static ssize_t reason_thermal_show(struct device *dev,
> -				   struct device_attribute *attr,
> -				   char *buff)
> +static ssize_t reason_thermal_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool thermal = !!read_reason_thermal(gt);
>  
>  	return sysfs_emit(buff, "%u\n", thermal);
>  }
> -static DEVICE_ATTR_RO(reason_thermal);
> +static struct kobj_attribute attr_reason_thermal = __ATTR_RO(reason_thermal);
>  
> -static ssize_t reason_prochot_show(struct device *dev,
> -				   struct device_attribute *attr,
> -				   char *buff)
> +static ssize_t reason_prochot_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool prochot = !!read_reason_prochot(gt);
>  
>  	return sysfs_emit(buff, "%u\n", prochot);
>  }
> -static DEVICE_ATTR_RO(reason_prochot);
> +static struct kobj_attribute attr_reason_prochot = __ATTR_RO(reason_prochot);
>  
> -static ssize_t reason_ratl_show(struct device *dev,
> -				struct device_attribute *attr,
> -				char *buff)
> +static ssize_t reason_ratl_show(struct kobject *kobj,
> +				struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool ratl = !!read_reason_ratl(gt);
>  
>  	return sysfs_emit(buff, "%u\n", ratl);
>  }
> -static DEVICE_ATTR_RO(reason_ratl);
> +static struct kobj_attribute attr_reason_ratl = __ATTR_RO(reason_ratl);
>  
> -static ssize_t reason_vr_thermalert_show(struct device *dev,
> -					 struct device_attribute *attr,
> -					 char *buff)
> +static ssize_t reason_vr_thermalert_show(struct kobject *kobj,
> +					 struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool thermalert = !!read_reason_vr_thermalert(gt);
>  
>  	return sysfs_emit(buff, "%u\n", thermalert);
>  }
> -static DEVICE_ATTR_RO(reason_vr_thermalert);
> +static struct kobj_attribute attr_reason_vr_thermalert = __ATTR_RO(reason_vr_thermalert);
>  
> -static ssize_t reason_vr_tdc_show(struct device *dev,
> -				  struct device_attribute *attr,
> -				  char *buff)
> +static ssize_t reason_vr_tdc_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr, char *buff)
>  {
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_gt *gt = dev_to_gt(dev);
>  	bool tdc = !!read_reason_vr_tdc(gt);
>  
>  	return sysfs_emit(buff, "%u\n", tdc);
>  }
> -static DEVICE_ATTR_RO(reason_vr_tdc);
> +static struct kobj_attribute attr_reason_vr_tdc = __ATTR_RO(reason_vr_tdc);
>  
>  static struct attribute *throttle_attrs[] = {
> -	&dev_attr_status.attr,
> -	&dev_attr_reason_pl1.attr,
> -	&dev_attr_reason_pl2.attr,
> -	&dev_attr_reason_pl4.attr,
> -	&dev_attr_reason_thermal.attr,
> -	&dev_attr_reason_prochot.attr,
> -	&dev_attr_reason_ratl.attr,
> -	&dev_attr_reason_vr_thermalert.attr,
> -	&dev_attr_reason_vr_tdc.attr,
> +	&attr_status.attr,
> +	&attr_reason_pl1.attr,
> +	&attr_reason_pl2.attr,
> +	&attr_reason_pl4.attr,
> +	&attr_reason_thermal.attr,
> +	&attr_reason_prochot.attr,
> +	&attr_reason_ratl.attr,
> +	&attr_reason_vr_thermalert.attr,
> +	&attr_reason_vr_tdc.attr,
>  	NULL
>  };
>  
> -- 
> 2.49.0
> 
