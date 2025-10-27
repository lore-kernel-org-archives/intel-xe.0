Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5A9CCF9E0
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 16:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751A10E532;
	Mon, 27 Oct 2025 16:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fQSLPfrd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1226F10E51C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 16:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761583506; x=1793119506;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2oJiNDhlEWAW/S62JawPsEx/KI8Ek4fIHHBuP22kO7o=;
 b=fQSLPfrdbn41/TwTLjnsc4Tzoq1Rzo/5bnVV2nbRfhYpj51hXA8Cotd3
 e3IodUNyRhxcEvbyx4dmVVH9vlJGudUsl9D9xDFVY65FsLl81r6BcdQlJ
 4XDswv4PQoR9fU/kE6KshlDT0PuY/vaFOo4rsiuoU5d/PqOxG0mJAb+EL
 O7UKioGti2c+PvdvaJCLlrtouQ1BX1s549Nwe8vBHlCf2KxX+o1EF0gzV
 qQjk8QZBBAslzMq37/3Pf3YVLqXPSb9MAUTbhEgVWJJQvFrEMaWO6zfZr
 wCYra0mRtJOA9Vvdty9e9Na7dWSJFtmwJlo0mx6yeDkkgb7ZQYXmEPfht w==;
X-CSE-ConnectionGUID: tUWSuGudQIqXbHvBaBemQw==
X-CSE-MsgGUID: lt93/bMESF+cgzf+8puclA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63371473"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63371473"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:45:06 -0700
X-CSE-ConnectionGUID: yx8CkCEhQmaIJFjAossk8A==
X-CSE-MsgGUID: JbvmZUMyRymN4M3ljsB1Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185859354"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:45:05 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:45:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:45:04 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:45:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pM3QtQxY1Y+HZOvON+6uF+7XyO4E+Tv3eENfr3P8mDsR3S8Pim4s9trE+ZXBQUKG7+vd8lTCFsAA6BDrG870Uf1rdlK0kIGEb1jyn4SJ932h6HUO98rUOxsa4WdzlOSr2Zgr0cPJPjCgyrGvAl9NYqUN7gW4qKjUEvS/6KzrZqfraXIOLqxuT7ySNhRQU2XO++XVn7gbETRz+5L6vtd5pE84xOJqL90lfdua1xn4i7FQLm61mWYNU7kEWaHIiyEiPWxrw2L54IsipuElCaZEa5JcVxZpxciuXYYU4M9iOYpqzETMhbWULGbvhodsSlB8MQQi3ORsF0WTEHr2tYWPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WM+S//7ZxGovrMObdHtsrj0Bfjs2QMS7MC7fOvwDiPs=;
 b=HcF/dh+9xmxQ/puv+1H8ywfLwHsVYHQYTl6KushbPTvbeDKpjuKcTGOEmOFyG69DPvMeQc0zniQbNEUH0KC90M4pSKztghvQ3Agwp4iwnd1Q/wOO6mD1MRF2QwEHidz79IYmzyE0+A7F8XDY0SCuvkGIzuxc3wNL/uiMGdvvvIRxvl58OzJn8JImFNGYxBr1wImsRcMTx22gxzaR/3ZnYcYaREqGq6vG87yb9YeupZ4fNWL8GMunbqs8ayGDFb52bd9WcupW2s97Krw2gxXKH5JQgYCot4ovMDY40vjGDUf55t3hzT3CdfUwXU+uKULqX+GU3MVVbSu+YzWsetvflA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by LV8PR11MB8748.namprd11.prod.outlook.com (2603:10b6:408:200::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:44:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 16:44:59 +0000
Date: Mon, 27 Oct 2025 12:44:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 14/14] drm/xe/pf: Add documentation for sriov_admin
 attributes
Message-ID: <aP-hiB44nJIu23HZ@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-15-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020182414.576-15-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0071.namprd02.prod.outlook.com
 (2603:10b6:a03:54::48) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|LV8PR11MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ff24fc-e2ab-4ee1-a323-08de15782ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nIKYibV51UROVvTUVBkVDYVjTfUNVpNu0c1A8aqw/+87qCjXxBFTxup750sV?=
 =?us-ascii?Q?ps9t5iOACyzv5eCZ5wwL/RXeW76rBza6XFWkXfT0tWZ3ectqbtvUx6MN9gic?=
 =?us-ascii?Q?p6L4zTW7pJhi1BPcBBlLbS761vC+kKE30Y5NMZ9/xrt3lr35K4LWJyaSj26q?=
 =?us-ascii?Q?uGSJZnavytdVTbSs+B9TtkRhdyr33pBTx2ESmxFPRckCRKaumAC74no0vqwl?=
 =?us-ascii?Q?s5MZtMioIaRq+6vDlvC0xGIyENylyXwlXUKJpTEMbluKlKYn19W+7yai2LAW?=
 =?us-ascii?Q?mLxF9IjyfMR90jEiIM5Wx3dPCl7cFV6xnB6yLBOKQxDsQdpM4AjV/vVgRO83?=
 =?us-ascii?Q?YAtCTTtOupTFTEnul1pJBmMDBWGt1OyCwV7WQvm7T26DymXaBYY0v8LIaHIm?=
 =?us-ascii?Q?dYjL+6PM0E6VMW3Dk+Z/d4FuzCYYnratbo6XjaSNMZed4/3x2JgtBJzFGUuJ?=
 =?us-ascii?Q?Wl3xMNw7E0NDOqaN3ZT7qg7zKhtwtL9mA0bLhWOAL2ebKCyv/5POxuoKo3z4?=
 =?us-ascii?Q?eqSXu4VI4Doml/RBs2JGoplFvsNqom4RT5qe+xTCur6GPtUY9ZnjO/3e0EIN?=
 =?us-ascii?Q?K6kxvVbh5nrK8xd7PjFcf0+Pe6Wk74/9ma/v6kYaP+8aZ295ltdx6UWxm9lx?=
 =?us-ascii?Q?1F95OsERjgKVIzstIcFqplbw07kgGDvFPbLwCM8XrXYlb2TxHQsUQ0Npjhro?=
 =?us-ascii?Q?jLDFQ+vcsl9/PNQiB5VzICm5rGLuFALGN4Vcra+ayTzsgkDx5tUizMZ0TuJQ?=
 =?us-ascii?Q?ZPG8UmA5Jo9VM2WGfECBBPat7xijh6Z5Id4vr/mrcuQspbkN8b6ROqfSH0Xo?=
 =?us-ascii?Q?Do92clHEA9c79xrmRcyOX885mQvV8CKty0FgDZilY3/d7u27E+JmC/b9IDqB?=
 =?us-ascii?Q?wMf1aCRd9bAxDzKez3OWQzu9njdsHWN06iHLYabYSciyVk4oP6IZdeK4fSif?=
 =?us-ascii?Q?ovM3NvZmJ67l40JuY9qtROVS6fFP5FmN0cw74M0W/+/J7hXMKz7tsMk8fNah?=
 =?us-ascii?Q?xKOl1dMPDB6lCrXOxgBeAIelBWKaQFJ/JtIepIcAQb7edpzPfUjpB1raPn52?=
 =?us-ascii?Q?eKZ5jfEY4UMWggYf1of7NEw/gijKYYzGM39reqgQGg5a3kXql/x8Yo7qYJH9?=
 =?us-ascii?Q?X6jnWacPLmvat8Muyu7hkCdSuKy7/zG3EnLThGtoGz1WUkCYsE2EPgO1VbG4?=
 =?us-ascii?Q?B2vkjQkGWu7C0h1mZKZAAi4aueP2y9iTkIwvVV5OTkQpvMCvzJs9/qC2zRnw?=
 =?us-ascii?Q?N/oiFrgSmrLL9pQbXShs5M/D9k3Q6INdBo0V+dUdXszAiZ2WoamWF/dmcWqw?=
 =?us-ascii?Q?MZaSgzvF7Rd+oxWbrwlPbQt3fS826HZLhiAVxNr8fhlHcqvrlyOnns7BC7fV?=
 =?us-ascii?Q?CWP25Dx+iopMV7pzf4sPZ450rB9JVkSqiCqrH/DG0XKbTqMgFLti5Ddyqu1S?=
 =?us-ascii?Q?Xd1MAOIHu/z/T/RyDgfd5N1pANLr6Imb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LBOc1BiPGEHtMJ5FRXCm3kFzMk1xGBPro+CpWEzeoxKslQVvl1Nu2u7zZu14?=
 =?us-ascii?Q?8xMiu8NQ6OCb1qnZJQw18aVSddvd92hEPm2kRZcflHOUYklnZP9rCV1iF4PV?=
 =?us-ascii?Q?oLrkwMYg8cIqf5p1/BC34g88IXZdsNNyTChsDjCK7EHp2mrE5F0ryHzP1o2z?=
 =?us-ascii?Q?THKzEiKo9makYZt9I5AXxgVATEBhaGFgidvLNEnUelwcyYWAHDjUAfw4sztQ?=
 =?us-ascii?Q?3ZbTHLVubNfeSy+wC8EJhetK7H/tEnL0cI924uyAXHpdz8y+wXdSA0Xe0Dc1?=
 =?us-ascii?Q?KaXlar2sp1Q+OhTw0YOl1AUMt2LoLsblpf19x/Bsm3UB7m1O/lvT68xwR21k?=
 =?us-ascii?Q?z05Hf/U3DBfFF0moVECozgbujZi3r8JqYIbclAuXU7LV6/p01673cqnW+tn5?=
 =?us-ascii?Q?Jhb4EoTW7LQJfVcBz7Yw9Zfq5mu+9MNts5yGjJRq8ZxOM2S6v0cbU76lOlyv?=
 =?us-ascii?Q?7k4gg0Y6AtIatfT4TZUmeddtG2OsoPiJ7Vbt1kJv5hV04YyASx/NVg+Q+SV/?=
 =?us-ascii?Q?F9PclFvsoaz6ulBxSCaga1l8W8btvMXr/hnUhs9B6B8+7Uuf9kI/m9Nb01EW?=
 =?us-ascii?Q?7uMB69WPvKxfITTLPGm9n4pH9akqLQxtBTw9+6xLybo2DKZgWzOGX7vAgYZS?=
 =?us-ascii?Q?wnMP8+Pzd387nIHbgXkjq2Zu4TTcY0+gKzDdqPP6T8UJQltRkXgsoIxrdO9P?=
 =?us-ascii?Q?5n/CbVimaErv7RYr/XynOTxuF14AXJRPES7mp6BU8W5UBT8VwUMyPthXWIWI?=
 =?us-ascii?Q?ns7KXxwx7hZmrlUVcWS8zzrpm93qQWUFe2AI1PexV/itIzVf4LMCYHayNaj5?=
 =?us-ascii?Q?d1AaxJTi22PcYI8KdF8VpECTIvUaDLN6ZVnUngRQMHrwkgQfDZYOjqVVT9eM?=
 =?us-ascii?Q?74S/naigwwCqGUX6FW10Zzhg6wxDJvESJWQ5y13BJ09QFNsWgTdpNKl/dNII?=
 =?us-ascii?Q?TlAC37oCgkGM/yYC+7lF02BTtR3Bf4VGwAs0EybOmK6pWYAXRpI6Qr2E/RRF?=
 =?us-ascii?Q?acVMwAH7VRBqu9C2PAeZcx5X9vXknQ3zll0ckA8vmJbGTDbMKop24O7YkDBm?=
 =?us-ascii?Q?mLF6OtlAzIREXQdmOBw2M2+1lrPW0TI3DI3gSjOzXWlK6Jaw5S3QMSQWOtF+?=
 =?us-ascii?Q?sIl7ZohXYEgEOy/KEv30BW5TO2xh05UAoiWWnDDdejDaYc8i7G0CPMdRYwnM?=
 =?us-ascii?Q?RVjie651qDHlHosOmcz3JIaJVrsDnrShowihO1pvXP2fzvgicDBw80awRyoK?=
 =?us-ascii?Q?JqOo1hcpcPRM3AY7HJcs/hHqTBaTE7+LAIHsghK2LyXFAn6hfXXyW/dzcRf3?=
 =?us-ascii?Q?0ZOwjkhZne3Lf2IdffAho9TRmZ9ABnQWUdrlaJkfkH2RTRMF2RFdZcwpJFhy?=
 =?us-ascii?Q?zorzNdciJqw5KsQuZxm3HlDZpZKrbNvS/8YqNqPAy6e+hyV8q3kNycwjprcc?=
 =?us-ascii?Q?laTnbnfEEl2PW7aL5x4irMNYuCPSbH/Goinwkm902+wl3zE7DBPTE0CfKaPJ?=
 =?us-ascii?Q?z4BVhcjB/xn9qhi5I30yJxIWaaPmfRhPxROyyvfPu29zCAOo317q3wm+sv8+?=
 =?us-ascii?Q?GfeD2MSnvBh5VTwP2Gx1WL6qZvX0VoIknnxXNre1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ff24fc-e2ab-4ee1-a323-08de15782ace
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:44:59.5331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBUBF3dGNiWw5fXwCBHEpTYv1afLg+FbW9cIFGEZQ63Lg1c6elQbQb2qc+I5sdESKt+xGMewSlSjx8Vfq6N51A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8748
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

On Mon, Oct 20, 2025 at 08:24:14PM +0200, Michal Wajdeczko wrote:
> Add initial documentation for all recently added Xe driver
> specific SR-IOV sysfs files located under device/sriov_admin.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-sriov   | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> new file mode 100644
> index 000000000000..ac650b673270
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> @@ -0,0 +1,164 @@
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/
> +Date:		October 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This directory appears for the particular Intel Xe device when:
> +
> +		 - device supports SR-IOV, and
> +		 - device is a Physical Function (PF), and
> +		 - driver support for the SR-IOV PF is enabled on given device.
> +
> +		This directory is used as a root for all attributes required to
> +		manage both Physical Function (PF) and Virtual Functions (VFs).
> +
> +
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/
> +Date:		October 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This directory holds attributes related to the SR-IOV Physical
> +		Function (PF).
> +
> +
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf1/
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf2/
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<N>/
> +Date:		October 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		These directories hold attributes related to the SR-IOV Virtual
> +		Functions (VFs).
> +
> +		Note that the VF number <N> is 1-based as described in PCI SR-IOV
> +		specification as the Xe driver follows that naming schema.
> +
> +		There could be "vf1", "vf2" and so on, up to "vf<N>", where <N>
> +		matches value of the "sriov_totalvfs" attribute.
> +
> +
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/exec_quantum_ms
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/preempt_timeout_us
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/profile/sched_priority
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/exec_quantum_ms
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/preempt_timeout_us
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/profile/sched_priority
> +Date:		October 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		These files represent scheduling parameters of the PF or VFs and
> +		are available only for Intel Xe platforms with GPU sharing based
> +		on the time-slice basis. These scheduling parameters can be changed
> +		even if VFs are enabled and running. Those parameters reflects
> +		settings of all tiles/GTs assigned to the given function.
> +
> +		exec_quantum_ms: (RW) unsigned integer
> +			The GT execution quantum (EQ) in [ms] of the given function.
> +			Actual quantum value might be aligned per HW/FW requirements.
> +
> +			Default is 0 (unlimited).
> +
> +		preempt_timeout_us: (RW) unsigned integer
> +			The GT preemption timeout in [us] of the given function.
> +			Actual timeout value might be aligned per HW/FW requirements.
> +
> +			Default is 0 (unlimited).
> +
> +		sched_priority: (RW/RO) string
> +			The GT scheduling priority of the given function.
> +
> +			"low" - function will be scheduled on the GPU for its EQ/PT
> +				only if function has any work already submitted.
> +
> +			"normal" - functions will be scheduled on the GPU for its EQ/PT
> +				irrespective of whether it has submitted a work or not.
> +
> +			"high" - function will be scheduled on the GPU for its EQ/PT
> +				in the next time-slice after the current one completes
> +				and function has a work submitted.
> +
> +			Default is "low".
> +
> +			When read, this file will display the current and available
> +			scheduling priorities. The currently active priority level will
> +			be enclosed in square brackets, like:
> +
> +				[low] normal high
> +
> +			This file can be read-only if changing is currently not supported
> +			for given function due to any known HW/FW limitations.
> +
> +		Writes to these attributes may fail with errors like:
> +			-EINVAL if provided input is malformed or not recognized,
> +			-EPERM if change is not applicable on given HW/FW,
> +			-EIO if GuC refuses to change provisioning.
> +
> +		Reads from these attributes may fail with:
> +			-EUCLEAN if value is not consistent across all tiles/GTs.
> +
> +
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/exec_quantum_ms
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/preempt_timeout_us
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/.bulk_profile/sched_priority
> +Date:		October 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		These files allows bulk reconfiguration of the scheduling parameters
> +		of the PF or VFs and are available only for Intel Xe platforms with
> +		GPU sharing based on the time-slice basis. These scheduling parameters
> +		can be changed even if VFs are enabled and running.
> +
> +		exec_quantum_ms: (WO) unsigned integer
> +			The GT execution quantum (EQ) in [ms] to be applied to all functions.
> +			See sriov_admin/{pf,vf<N>}/profile/exec_quantum_ms for more details.
> +
> +		preempt_timeout_us: (WO) unsigned integer
> +			The GT preemption timeout (PT) in [us] to be applied to all functions.
> +			See sriov_admin/{pf,vf<N>}/profile/preempt_timeout_us for more details.
> +
> +		sched_priority: (RW/RO) string
> +			The GT scheduling priority to be applied for all functions.
> +			See sriov_admin/{pf,vf<N>}/profile/sched_priority for more details.
> +
> +		Writes to these attributes may fail with errors like:
> +			-EINVAL if provided input is malformed or not recognized,
> +			-EPERM if change is not applicable on given HW/FW,
> +			-EIO if GuC refuses to change provisioning.
> +
> +
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/stop
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/reset
> +Date:		October 2025
> +KernelVersion:	6.18
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		These files allow to control scheduling of the VF on the Intel Xe GPU
> +		platforms. They allow to implement custom policy mechanism in case VFs
> +		are misbehaving or triggering adverse events above defined thresholds.
> +
> +		stop: (WO) bool
> +			All GT executions of given function shall be immediately stopped.
> +
> +		reset: (WO) bool
> +			The GT executions of the given function shall be reset after
> +			completing software-initiated VF FLR.
> +
> +		Writes to these attributes may fail with errors like:
> +			-EINVAL if provided input is malformed or not recognized,
> +			-EPERM if change is not applicable on given HW/FW,
> +			-EIO if GuC refuses to change provisioning.
> +
> +
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/pf/device
> +What:		/sys/bus/pci/drivers/xe/.../sriov_admin/vf<n>/device
> +Date:		October 2025
> +KernelVersion:	6.18

6.19

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		These are symlinks to the underlying PCI device entry representing
> +		given Xe SR-IOV function. For the PF, this link is always present.
> +		For VFs, this link is present only for currently enabled VFs.
> -- 
> 2.47.1
> 
