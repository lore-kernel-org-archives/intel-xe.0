Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E126ACA5FBE
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 13:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7AF10EA2C;
	Wed, 30 Sep 2026 13:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j3eN0RcK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584CD10EA2C
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 13:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790773960; x=1822309960;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v01p6H3WhVBT/ibi1IUM/kgrfCJWC9BLlWgI/fSHuH4=;
 b=j3eN0RcKmo1Goai2QigHIWPybOv1MFxLtgPerx9lCAY2XFucTTNbD2P9
 89I2pvbl30kSAud8zx8RhTFaJuQyz5Xcve/Yyjxixq2miNnJ0ppmYHULl
 CFvs3Ab3bfyfJfyzZ+BEJz/NtdlMiNYhgLZT9Fwmo8l7PwTH66Cji6F15
 TtfDsC+mQj9YNT8nvVJUBg4v6pCHlZ/eL26Jiweu7jPC6TRjHWhcpR2/J
 Lz2pkjgVIbFlKmEk0AD+dmLq7cf1HIkxQhbL1C15eFwF0Q0KAeFFh/ibt
 ihERNNULZzlUa5TRG5QUD3Rc8ca1f/fGfFYn9jtzbtMSFelp3o0bqMrCR w==;
X-CSE-ConnectionGUID: K8xeAib/RIetSZ1zFZXbZw==
X-CSE-MsgGUID: 1SvIC/Z5QeW0qUqSKTTnVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91608241"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="91608241"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:12:40 -0700
X-CSE-ConnectionGUID: aGE0GYgATE2QWRaccluOjQ==
X-CSE-MsgGUID: boQzXdywSmeCKYm0Vv7z4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="305194862"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:12:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 06:12:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 06:12:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 06:12:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwsyTzFpUPWMSX0ksTod+M+LmriTvUmE3WHiIFU6a29NajYJbjgABljX9Q9bb+UthSph847XWrvnYdLlxmI/+xu3E4pmEgThv3RzGbqmBBAg8jNoiSkYA8qcS5hrZkh5kUUoPzPcoE8UQZNAmqETOisW1e0fwXgRAgPaYkQGiAFtm+RgxDBvXLsOM6sJzDbUR/qzEn5KmeQTTe+mYdwW9ExVGDxOjmWZYPcUk6w/aMyxg26WmFOD+csdqh49TST+7/jGTrxJAeNOvnMgza+sMJimBxa1MXDhZWM339wdYsf9Hd3zBKzS3u7mAQRJJ1ftesEzMDs2+TmXlhS/xecJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tX/bLMxCNCuVwKHjMn8W+DMfPb5oRo3J11AiW4KZrc=;
 b=w2NDyCwFKnq4gkIicI9OkmIUkRbXt/3DiTX8GFWkCn6TB0TvyhcmaqtmTzivjNC7S4F7/DcIBjWvDmu0PHDmuXj+3r5wwpbiDGDyjjOIuesHFAWU+nvVqhWb+4ylJ/TFZRXNrFymp24EZ8yK+bm6x7CpZc8LTq+Y3UJzAzQk+KugoXR3Yl4Pr10VFvXJPkfndmjS86ugEuz0QhHSpVvJkp25bgCw9lwEKaGdrrirbExKa5YDRonJgCXJAv+G195k9Z8GFkqAuOR7xXFZPrcRBGQKIMewx31rExlQ0u5hs33zZDaKHlMYDmSi0/ZCB6VegJ9O3nB77fy4Lo7eAsWkoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7192.namprd11.prod.outlook.com (2603:10b6:8:13a::22)
 by SJ5PPF04AA7285F.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::806) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 13:12:31 +0000
Received: from DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb]) by DS0PR11MB7192.namprd11.prod.outlook.com
 ([fe80::c747:a502:4a7f:f5bb%4]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 13:12:31 +0000
Date: Wed, 30 Sep 2026 09:12:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe/cri: Expose device UID through sysfs
Message-ID: <ar0Kri7MYtu3oZ_T@intel.com>
References: <20260929171823.3811737-2-badal.nilawar@intel.com>
 <4bda9ba4395d2578abf71eb44ddd5a49d261208c@intel.com>
 <56bce828-8f56-43b2-92a5-1081ce18c595@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <56bce828-8f56-43b2-92a5-1081ce18c595@intel.com>
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To DS0PR11MB7192.namprd11.prod.outlook.com
 (2603:10b6:8:13a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7192:EE_|SJ5PPF04AA7285F:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d8ee27-a757-4120-3965-08df1ef47af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|4143699003|10067099003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NjrDabYgl/SLZhdmAcuWviHN3iGhLkaXaMrIrsvpSbeRYXFvyaVq0lRSXL/h7uxSi5bS+OiisUFm3Z/C1+stBdpjbVR46DKg286ETRFPHcdagB/40HljenU8jIDM/WlCBquO6MoVStRmElG5R91YTpxekNtLWved2A21J8iPd/Bs4OaomxX2kZBSchvENigQXTHupU+UZ5LlC61ZD8kjTcYNr0bLfpYj3zmS7CqDQfjVtCIs3EtXaiRDiOJ2baJakw2+Za+gthfAC5VDof44DJQb2QDQ29BLMTZs+kR1Z1XQUzXGqon0knaWFdYer28aIzy2HuBV7Y6MsUV4stf9IXzgDfh2bOLrCXCVRFUYDwkjePLFZTKcFgCbDllhFm2ZbJxtz4/4BUXr0kp0X9/0bY34jzag4QxXam9XDCHJeXKN22tMBCVcCzxt9MBK64+Wtrd2J2YkUrnUqxbBPC9mgpsEg8KMHF8P7FSM2uiEICPQ+agzEhRUnC/B9U16uTl5+5t0OsqNmrpnNT3wdaA+jYAEMe7t/aIAqOIM/tzdeAhV1UtoIBD1TATAA/aYGygeSfs4Nh09d9flXGmgnqhBwz6Ea2XxWNoMBtN8DIOtf5hV/uHizD8wccHQi9hiz3eKbmTSNqbLe3d223mdcBVcV0C/t3n8Y4tx1TxQkVY+0PA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7192.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(4143699003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OON3dMsANSJJoFNvFlqIjGRhRLbIy7hJqZo3ohMDniQ9Y/o8HK0p86tkJeQn?=
 =?us-ascii?Q?cfK/BhaFTZXu/ay8JLUyt2r9xV8gVRPI2GpwkHrhsZlnU0eM2mUOMlM9ZzoP?=
 =?us-ascii?Q?shT4wAgQZwcuRaiqI3/CmC0wviSN9VWw0F/kZqc+08iUCkex159S2wdw4tYy?=
 =?us-ascii?Q?lxiXpcLZq84LcfLYvnV1wKC8cnwZ/AKlPdiQQ6bF9bvKAgTTV7zAuWBv+m2s?=
 =?us-ascii?Q?o+oGQ4LzA754ykA6hbtbT2rKV4mwgaB+9jPyxodgSmdQnjx+BzqW/10oL8Az?=
 =?us-ascii?Q?Hu8DE0ZPOReteoPHPYrfIie6ouxf/QKvqfmAIKVjQIDUxwmFGljNCvM028Ly?=
 =?us-ascii?Q?3E/qIuQrOjMIOTuwYAF8bsIflG0z5GWf80t19tBVzmhLkeowS2bj67lyF6cU?=
 =?us-ascii?Q?fJOpaTpEOanNNYvr1JfiF8oKXXgzhsym8QB8adisywIqDiKODArpkPwAIXKk?=
 =?us-ascii?Q?PwPUSM6hqRe5EDIMe5n9w26iVKXwuyzlIIKXmWBvwiaytgtmrRmvS6LJNyOj?=
 =?us-ascii?Q?ubGTi5cT8m1fvgFvTadz8+r7pDdtXg77NGMywON7/Fi8B3cmqP4tj37sSWCT?=
 =?us-ascii?Q?NKwLwMqeBlefNmIBVvFeP9YTmIFDkpj6mn7C7M4NmVwuja0V6XutJsv2aQHl?=
 =?us-ascii?Q?cszXW5PYH//lKY/PpUt21dzW2hdpAB8MKwAq+/HDC+COrwqhpBo3AFrYwB5C?=
 =?us-ascii?Q?o9fZPEf+INk/sFhWNQg58cFWqJibkljrwnp5SnwehTyG92I110uQH/72Dbyl?=
 =?us-ascii?Q?rbRkzsSxCkF0Q+IyUQBmXCjyV5gYd4dIRhkTDrBB82X12uhe8KB/nV5iBn6I?=
 =?us-ascii?Q?FV9wRj97uXH7JJyhUcLRzLkAL5Xyjd8Rq+zcxoE9wjF5LRKAfq8lsBpY6PCl?=
 =?us-ascii?Q?+1JQNtc1FsG77GC0Y3po5F6Q5NihgA18OLBv75PFd/ciswzRCToAjDja/mL6?=
 =?us-ascii?Q?DM1v0hS2bcCSNREwSHNzpNzyfYp5wlZAAhWZSXz9bDKSTPX0IK+lBwtRdSOy?=
 =?us-ascii?Q?T1hL02zVd7qIMrAL6c0KMj857ue+/Bd65/U/P1/UT2nd7ydLkFSmW/TS/XN8?=
 =?us-ascii?Q?G8VbxVTCv6DemSoNHmw9eSk0HgKmNrKOFUErsE4C3L9X9R9rgZ+WqRYCBq8p?=
 =?us-ascii?Q?euMXzP/5hWvgrEEXM8DTE6S/u2hEy2NFCmxXftGSfNEF7fJwzUI2IGDG0Y3U?=
 =?us-ascii?Q?udMcTaiYNtsO21n9ZwUcq0mo3g6oOp3znrk58ZtuNgz5uujrBSLlhxP39zNR?=
 =?us-ascii?Q?gJqHH3IFocrS/lkISFYYCUhk4/Hex24UaHiJ4guhBP8Rzkd0vSI2L0p1VmQw?=
 =?us-ascii?Q?wcBhpNT2fcsCnjPKA9dZUDCNq/UnuWMlXKPhAtV5Mzt/q7uY0qPdi5lQB5W4?=
 =?us-ascii?Q?vx+lzpsBg7/USzeuLjQojSINhJ0wIYIkuwEmGRhy4UJ21nc73hRWMlWoBE5V?=
 =?us-ascii?Q?wvWfCbuizqDX82s5BmXVTL1Qif1h23y/9WpZcUrcWr0dQ/82Hyh4JH4Wz2gr?=
 =?us-ascii?Q?dAfojVHuWuskyXmlSWxcVveDq/ptDMfQPBwl1OhcdXVDy4P0MECTjN5dOu93?=
 =?us-ascii?Q?FVxiVuLZwKGsM2GaX1+DbQVZlzmChOOh5BsPWpgS/SQP2CTbRKmFzYVCnEIn?=
 =?us-ascii?Q?4C6oagdl80L4SvAp0y7c0YaD7alqIC0vVDo1FVn7mO3MoKi0htrtzCR9pqv3?=
 =?us-ascii?Q?3f1DKgWSdV3saNrIrv/qxD0JWT9jxl2sIsH+hp+5qFizS58Fhj3dil3e+DZq?=
 =?us-ascii?Q?brlj5xwcQBrQ4T5E2eIKfzM6SHtqkZU=3D?=
X-Exchange-RoutingPolicyChecked: RRc7iIBfFuGbZDUUTbbdraY8O2ijqxJiinImgTl+0fLuH2jl4zvMf9HNQkMYGLQaaitzMRrmFZOAI2DGF6JifEbI0w7sHVhp9mpHhhclRMLjQQLtLzML4yh7RtMce1f/94PRglvUMS7F15My4a7nSEq534sQBaZkTyebQhMIQhOI5MU+Plv2L+esole+e94s/2RzW5L8QSjNYt8m+32nk2+/8Bz2NlGyDK+m/UVCu00LvdkrPapb/rzYt2XIUbAgAXo2rAQlXA3eJsV+qgPbtHrEGNSxWWvlznm5tHOEk/t6C+uZGKRi/j4Hlk6L43LazXUwU4b0DWE7bG9I8O/p5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d8ee27-a757-4120-3965-08df1ef47af9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7192.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 13:12:30.8538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHZQ1hdi4/KxLiZymjeS3XoFjBFvqtucn4arb/yZCbEaQyAkvQNswF7zaur6yyHDw3eoV9GQclATkE4Bm9pefw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF04AA7285F
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

On Wed, Sep 30, 2026 at 05:23:06PM +0530, Nilawar, Badal wrote:
> 
> On 30-09-2026 12:56, Jani Nikula wrote:
> > On Tue, 29 Sep 2026, Badal Nilawar <badal.nilawar@intel.com> wrote:
> > > Expose a read-only sysfs attribute, device_uid, that reports the
> > > GPU SoC's unique identifier.
> > The commit message does not answer the question *why*.
> 
> Unfortunately this patch is merged. Use case is to provide alternative to
> PCIe DSN (Device serial number) Capability, which is currently not supported
> by Xe platforms.
> 
> In scenarios like hotplug or recovery from wedge, PCIe bdf may change after
> rescan. With device_uid will help userspace app identify recovered device is
> expected device.

Hi Jani, sorry for missing that. I had a biased vision already and my poor brain
assumed universability. Anyway, in large deployments with multiple GPUs in the
system with resets or hotplug cases, BDF is not enough to identify the part.
So, for a proper debugability and server maintenance it is necessary some stable
identification method. UUID would be the ideal, but we don't have this in our parts.
But UID is enough for now...

> 
> Thanks,
> Badal
> 
> > 
> > BR,
> > Jani.
> > 
> > > Bspec: 53048, 53049
> > > Assisted-by: Claude:claude-opus-4.8
> > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > ---
> > > v2:
> > >    - add has flag instead of platform check to determin uid support (Anshuman)
> > >    - Fix the DOC: section (Michal)
> > >    - %s/_uuid/uid (Joonas)
> > > v3:
> > >    - Restrict device_uid to admin users (Sashiko/Joonas)
> > >    - Address review comments (Michal)
> > > ---
> > >   .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
> > >   drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
> > >   drivers/gpu/drm/xe/xe_device.c                |  9 +++++
> > >   drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_device_types.h          |  5 +++
> > >   drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
> > >   drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
> > >   7 files changed, 65 insertions(+)
> > >   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> > > new file mode 100644
> > > index 000000000000..4dc4afc3961d
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> > > @@ -0,0 +1,10 @@
> > > +What:		/sys/bus/pci/drivers/xe/.../device_uid
> > > +Date:		October 2026
> > > +KernelVersion:	7.4
> > > +Contact:	intel-xe@lists.freedesktop.org
> > > +Description:
> > > +		RO. Unique 64-bit identifier of the GPU SoC device, exposed as
> > > +		hexadecimal value.
> > > +
> > > +		This sysfs file is present only on supported Intel Xe platforms.
> > > +		Accessible only to users with administrative privileges.
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > index ef4746b7b5d3..437485b5a0af 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> > > @@ -30,6 +30,8 @@
> > >   #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
> > >   #define   TILE_COUNT				REG_GENMASK(15, 8)
> > > +#define CRI_DEVICE_UID				XE_REG(0x102008)
> > > +
> > >   #define GGC					XE_REG(0x108040)
> > >   #define   GMS_MASK				REG_GENMASK(15, 8)
> > >   #define   GGMS_MASK				REG_GENMASK(7, 6)
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 44975e7823be..e1979bbcf7bc 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -672,6 +672,7 @@ static void vf_update_device_info(struct xe_device *xe)
> > >   	xe->info.skip_guc_pc = 1;
> > >   	xe->info.skip_pcode = 1;
> > >   	xe->info.has_drm_ras = false;
> > > +	xe->info.has_device_uid = false;
> > >   }
> > >   static int xe_device_vram_alloc(struct xe_device *xe)
> > > @@ -872,6 +873,12 @@ static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
> > >   }
> > >   #endif
> > > +static void xe_uid_probe(struct xe_device *xe)
> > > +{
> > > +	if (xe->info.has_device_uid)
> > > +		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);
> > > +}
> > > +
> > >   int xe_device_probe(struct xe_device *xe)
> > >   {
> > >   	struct xe_tile *tile;
> > > @@ -879,6 +886,8 @@ int xe_device_probe(struct xe_device *xe)
> > >   	int err;
> > >   	u8 id;
> > > +	xe_uid_probe(xe);
> > > +
> > >   	xe_pat_init_early(xe);
> > >   	err = xe_sriov_init(xe);
> > > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > index a73e0e957cb0..18783a286a83 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > > @@ -8,6 +8,7 @@
> > >   #include <linux/pci.h>
> > >   #include <linux/sysfs.h>
> > > +#include "regs/xe_regs.h"
> > >   #include "xe_device.h"
> > >   #include "xe_device_sysfs.h"
> > >   #include "xe_mmio.h"
> > > @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
> > >   	.attrs = auto_link_downgrade_attrs,
> > >   };
> > > +/**
> > > + * DOC: Device Unique ID
> > > + *
> > > + * On supported platforms, Xe driver exposes a unique 64-bit GPU SOC
> > > + * device identifier through the 'device_uid' sysfs entry.
> > > + *
> > > + * See Documentation/ABI/testing/sysfs-driver-intel-xe-gpu for the ABI
> > > + * specification.
> > > + */
> > > +
> > > +static ssize_t
> > > +device_uid_show(struct device *dev, struct device_attribute *attr, char *buf)
> > > +{
> > > +	struct pci_dev *pdev = to_pci_dev(dev);
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +
> > > +	return sysfs_emit(buf, "0x%016llx\n", xe->device_uid);
> > > +}
> > > +static DEVICE_ATTR_ADMIN_RO(device_uid);
> > > +
> > > +static struct attribute *device_uid_attrs[] = {
> > > +	&dev_attr_device_uid.attr,
> > > +	NULL
> > > +};
> > > +
> > > +static const struct attribute_group device_uid_attr_group = {
> > > +	.attrs = device_uid_attrs,
> > > +};
> > > +
> > >   int xe_device_sysfs_init(struct xe_device *xe)
> > >   {
> > >   	struct device *dev = xe->drm.dev;
> > > @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
> > >   			return ret;
> > >   	}
> > > +	if (xe->info.has_device_uid) {
> > > +		ret = devm_device_add_group(dev, &device_uid_attr_group);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > >   	return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > index cd9ed8ff2940..41f703a87916 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -179,6 +179,8 @@ struct xe_device {
> > >   		u8 has_cached_pt:1;
> > >   		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
> > >   		u8 has_device_atomics_on_smem:1;
> > > +		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
> > > +		u8 has_device_uid:1;
> > >   		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
> > >   		u8 has_drm_ras:1;
> > >   		/** @info.has_fan_control: Device supports fan control */
> > > @@ -265,6 +267,9 @@ struct xe_device {
> > >   		bool oob_initialized;
> > >   	} wa_active;
> > > +	/** @device_uid: unique 64-bit GPU SOC identifier */
> > > +	u64 device_uid;
> > > +
> > >   	/** @survivability: survivability information for device */
> > >   	struct xe_survivability survivability;
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 28f37e034e02..032a08fe41e6 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -472,6 +472,7 @@ static const struct xe_device_desc cri_desc = {
> > >   	PLATFORM(CRESCENTISLAND),
> > >   	.dma_mask_size = 52,
> > >   	.has_display = false,
> > > +	.has_device_uid = true,
> > >   	.has_drm_ras = true,
> > >   	.has_flat_ccs = false,
> > >   	.has_gsc_nvm = 1,
> > > @@ -793,6 +794,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > >   	xe->info.is_dgfx = desc->is_dgfx;
> > >   	xe->info.has_cached_pt = desc->has_cached_pt;
> > > +	xe->info.has_device_uid = desc->has_device_uid;
> > >   	xe->info.has_drm_ras = desc->has_drm_ras;
> > >   	xe->info.has_fan_control = desc->has_fan_control;
> > >   	/* runtime fusing may force flat_ccs to disabled later */
> > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > > index 71068cdb3558..448bbe5ba1d7 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > @@ -40,6 +40,7 @@ struct xe_device_desc {
> > >   	u8 has_cached_pt:1;
> > >   	u8 has_display:1;
> > > +	u8 has_device_uid:1;
> > >   	u8 has_drm_ras:1;
> > >   	u8 has_fan_control:1;
> > >   	u8 has_flat_ccs:1;
