Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C585DC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 16:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BDA10E27A;
	Fri, 27 Jun 2025 16:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IGG8iRz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA25310E27A
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 16:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751041500; x=1782577500;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0/e64jFyvJwADnFep8t+qnmiDHYfPKQKNnAGZOjltv0=;
 b=IGG8iRz4fABUdM2vC+4UJhpn/Z+XZedID7kG7AE1VX6D9F1lQqREAgBl
 QBGTMbABWXY0DT8/PtkQIYGpqOtaq5utGPUc3NOu3UHHZcE9cJx8yItpM
 KYGwqRDpnPhvA29MCO8wYUspLR3x1Fc3ZU3DT+53iHg09hQ5stw1HBdiO
 Quc8iqbdLyIPIGkyY2SkSVIQIOawdKFqtHrPWbSZgUJ+djxY/2/K2wFoK
 Vq3tqof259hu10cjmWUahMOB8tHyz5o4DksRl0N6S1BC1jfsfCVDXMOLZ
 UDv8tX1N7yKqiybeDZUFFq+2XDTWSe4ngYw1EhNMFh50c7KaefV+Xr2Ii A==;
X-CSE-ConnectionGUID: /vxLlJPDQq6eFQFeQ0GVpw==
X-CSE-MsgGUID: gAdWgzzuS6eM1y7cKPCFJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52476744"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="52476744"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:24:55 -0700
X-CSE-ConnectionGUID: v50fep8GR1C2KrmzdoPrIw==
X-CSE-MsgGUID: rbT/ty6WRju44fhONsVMaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157230468"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 09:24:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 09:24:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 09:24:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 09:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJrTZ6YrJisfeTOwo4vWodXcoTGp52xzKeks7Yob+zHzL3oVU8D5FSnpv2Fk7F3+ZkKbfakU3BSTzTa28BU0VniuvzuqD/9fpdiLVJkk7yzTA5mj3DsHzh58/MoJPcg0whtJ/Q4YYJsE9a/JiPLoz51yx0Ubuaz/1sQZa+MqDm0pJghTDdQw0e0r/UIVZjUg2xzlmVB1Hf5oPR7VyEZy4Kmt5/y+MjP4bKtIHBBCzypyIVc0hlkqUCMjQr43mwHLA7nRGvmIEACV3Qcyxn2btFmFD5ppugJ3shYUVG90Bk8zI8vctp5XNDJjf3+tDPNqGQTgfWc++b5j8Zwd7Lri/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUPqQiAPtM1yP/+Kg8k2wXNoBPS6bMfkPUSwkneDsEk=;
 b=OBL+V8rw9GX0MlT1hNC/lXE6Vnu+23ufOlzpBXerhoqBJWS/QtdmBbbkaFo7QPgXGajDhxpdcJRubwGv+dkFI9etYFFCwho5yoORfXcKN+hYG9OfIVblSHG2xkmrBqyHcVsbklVcwBcEuHApkGn3bi55vMxDkYgtXowxIv99EOkI8gkdToJQ8BmmRuTKRt5BPzSa+CdZOc8I7sebOkHmAUgATY2qTVzI79wJLcKXnD+3vvi0US+A7LwfxTH9mEZPhC1UxwX+5iOOhiuuC7jh+SOKFiPmkjdXvXKQ3IhGy26JsVqqTIM6F/dx62/6wdkp89DXiyGVMOZt72LMC+TkQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Fri, 27 Jun
 2025 16:24:50 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 16:24:50 +0000
Date: Fri, 27 Jun 2025 18:24:43 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe: Add clear_stats GT debugfs
Message-ID: <aF7Fy97aD8raPlvD@fdugast-desk>
References: <20250603233445.2304383-1-matthew.brost@intel.com>
 <20250603233445.2304383-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603233445.2304383-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::20) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: d8499da2-b934-4aa9-d218-08ddb59723fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E39wrw+6YJcfQ7337Qr9op81d9q7/mIsKE4r+00US6ck7vW1EvrsbcoMCbEO?=
 =?us-ascii?Q?VM4/26T4rjNZRcML2xipcpS/rJDAyz5hppadWRNT/V2CaEmB5Ka9oKHd0bKD?=
 =?us-ascii?Q?31dnurpF/UQEu/QJ6uGQUuAviz1Nf4SaSyQlkLyToN2oz2v9s3CN7DZfB0Fu?=
 =?us-ascii?Q?zAKD2xWwjonag1nK15emRn7K1acsgzxiETU8nFuOoQicQLHYtx2Ej79A0F62?=
 =?us-ascii?Q?weIF9y+MM1nx2Hi3iii9SRJA07VCSosRaTuzp57bQ54uAGiQEigLS9U+488F?=
 =?us-ascii?Q?+29gEzJdAbxZKh8ug56KVb+Qmz22ZNR8N/vDluwUzvHw9pxiNOg5aHOuU8Zw?=
 =?us-ascii?Q?vhwsbetLt39V2FGPJmsW3u2D2QS+Cpw+1miOarBl+I2Z3sYSaN+Gh+q89QVB?=
 =?us-ascii?Q?VnAmjZ+w87BgKJlu8gYzzoNFjyO6FqHNR3vqHAKD1hSwSRkA80l72DpPS+Ro?=
 =?us-ascii?Q?erVf2YQx2ZkmTCD4j7hoxYxVU8/5TItajH6xRmheWbDzf2KusvviaAWqx4SU?=
 =?us-ascii?Q?zAU/U5NNt/we1iLfojC2B6jXbms9OkFHcoLai6ZbmSsnFonbFhxq/lB9HJ5x?=
 =?us-ascii?Q?2su+RW22TjcGWv6LgR0L8JxNRxWhpV6gPU5C0Nx0C6vWMIbAOXFVk9onUw2b?=
 =?us-ascii?Q?z/ZxdqOTEVw1xyv31CwwgmWD0T/h2OuLBpeggoeC/L+6QKYDZLDdA8ChHrmG?=
 =?us-ascii?Q?BYW+MjwO/LTDA2BoBW7nZrlFiQRUMN9JdF92mXUCrtHksNtLjRd6iPScbdEi?=
 =?us-ascii?Q?IxIWy59cbdHnRvcJodIsfe1XwiEE9SyaC8gqYSN67egANy0jrqRZqtzCbgvE?=
 =?us-ascii?Q?Jz642YvZqgrinYaYTFJFtxdV6vQszcogWtYfg2KdJPTF5XsNbMe8YQrsOiPt?=
 =?us-ascii?Q?TZL38CmxO+SSf5uI6ACsK5P2CFVrlos38azvTIlTTvBACL51HO0ogqS4BgKh?=
 =?us-ascii?Q?LA81wM5/NaCxQG6eKWDlq04DtAq6hB+mBAkgnxXaABAI4uOxxuNvJMZfGQFa?=
 =?us-ascii?Q?71PRe+MSCkLth2c3QSpBSnbkDC+wJkBs7tLIh93uN3/eIzQLxiJX2w8A3/Ww?=
 =?us-ascii?Q?UrmLwD4+rid62+2Rq387hTLLhmTaKScq+HUalR5Z/Tq1/pLBh8V2sugCbLOW?=
 =?us-ascii?Q?2OmnArEOZD5MCVXYSdLxeDSUJ+U+BoCI1tNV5d0NfE3v/WCCKCLEeTy0CHuM?=
 =?us-ascii?Q?H9jDeptVxdtnchjJ7WqkQJnsc+ps66dV9ByVpqzDO7nfHpnz6h/0QOD5907z?=
 =?us-ascii?Q?5Q/mYAGZ6qs9icMj11X7gXyXori4wF0fdwN4ls/SVL3EGqExO4MicQOH0djL?=
 =?us-ascii?Q?zdxzNUFGCUS6M4ScPqPt9nJ79qZjSlygpoTvsyJI82HuUcBlsQK889DKGctG?=
 =?us-ascii?Q?JFGt0RI3ZSoqlh1rWEG/LTU5i6QrcItFHc5RAwcgLakZDnOoyqBh7RWb3F79?=
 =?us-ascii?Q?OPH/74CLOr4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e7zBDLxQ0QKao+CxYA52pDnFimDT+tkrl50zJoPQV1Gg3oPepUUie6TZwiDx?=
 =?us-ascii?Q?MMrVLC2zRxXfmRfmecEiS4JRdoeim7g6+1G7C3ULw3RdrMGapYIYEn11FNmt?=
 =?us-ascii?Q?3qqhJNpiG5nt9VrPJRQMjNguyx3ks2bL+Y/opb5JcqKLa0TwNFvyhFPNSPhz?=
 =?us-ascii?Q?9H4wFCXskW4tJmHD+GxAQnpht5b/6novqEud/7S+pFXbKc7/C7AgPoShhp9q?=
 =?us-ascii?Q?zk2PZt4NrMKIgtI75mSXiswBilu5QuhcZ06kcVZ8jdhU1CuGWmtEuB7HQgUy?=
 =?us-ascii?Q?o8l0OYnNiwuHq+LmZ4nwV5kL4tAYrig+SYISem+hXE93HdSMnNblbD9Nkyy6?=
 =?us-ascii?Q?cT1aG2mwCM0ss5wRQvVOlmSq9WNRNkOEtP4qRb8Vwgme+OHsc+2H3ZwR7Bg7?=
 =?us-ascii?Q?bjg3wxX4H9th7zlHjpbombOKW8QVVGtapY360SeV8BOzzKbQQnCS2P5f7R5v?=
 =?us-ascii?Q?sbGiKZTidoMqQ3QEbHHmjKIq5eEEIHo8bh5nkhQv3oxzN/CPQxGxFGc/Q7ZT?=
 =?us-ascii?Q?yTRD83F6B6BHgd3fBEuItYoMOMDwctEPyryzjWJlyMr/DJ5bUg6VKPCJprZb?=
 =?us-ascii?Q?GhkQ58eo44zN0ouDlyknrvaj5wz1b1XpYxpGANsBuPhOIfXjBxq0tQrWrf2S?=
 =?us-ascii?Q?x6Q0X52vLg2xXrsjPYAOL0KkbWEBYJ2uQcFRv0bBUfmO0sI3mnBQyMD9KQvx?=
 =?us-ascii?Q?Jkx3VJY/c1Akau012THrFk5JSr9hYowFAZOXE4SiruO8i/u/WOHZqLZkHuT+?=
 =?us-ascii?Q?IaGx9RyYvNI9RBY3FUJkU81glRzAqQHzqc51k+Cg2nreLwlUM8EA+lzRM5WY?=
 =?us-ascii?Q?ql0JHP4XmUwPzYqq8fJd4uITtB1YG86YDtxSfEO+k4/IQNq1bgz1JU4y2i90?=
 =?us-ascii?Q?6zp5PsLU6birhRf+tQNYelPB5bbY96gLxS3tuE8j389rvZ9ezjOT4YyprKc5?=
 =?us-ascii?Q?kOEzs3BAPLb8s6c/UWOUY/Q/AailPjFO9d9lqOGlYpTnJsU77aPZXTT9idau?=
 =?us-ascii?Q?M78C39OIG0aNTCtFgzoXDqlZ8anWrq4O1GEU2JSm+nReZ9OYqxS0vb4Ae/ya?=
 =?us-ascii?Q?lYYHd5PXoZMUFUcgpjiAdpt/OTqjQNad7bcjarAUdTo4SvQhUziEEopSfDbO?=
 =?us-ascii?Q?GFT5QQHT+SmnQq6HUEMcufN/CSmwsQyfhud6U6G2w6XAnWH+/b1nU6S6gIuK?=
 =?us-ascii?Q?dijtKiFRhqy+hrdCOVs1txeXhPkxZNsBI25W5j2wIIhgkVlOfF+BOTySRX1i?=
 =?us-ascii?Q?qTkqSBT2kuq82apF7dWhQIt3M99XY0UMt0xGulpgKsaTBveIIU1lt+g1YYIh?=
 =?us-ascii?Q?i0Q2AryPoFjPjTO/mV2odDjnRhol3XX/lMO9p/YKFO0Bi6kQPw9MWGIVWh6d?=
 =?us-ascii?Q?FHVvE345F+BHx2fJmkj9muj4dUboG3gdkKo51aP6H8yC+hm7O+EsELkclpIB?=
 =?us-ascii?Q?s/xtuJLc/2y1NC2WhBx/47x9SPNj8jotsLCV3/pFMm33f2aN835YE8rf44K9?=
 =?us-ascii?Q?wqphuw9WA7r5T+w0uiN+c/8KjeLmugazdXqVYsjbgBY5v4qZWXZSS4IY6wXR?=
 =?us-ascii?Q?COKTHq6+8390DTqbNQPNb0nspLOcftNO5aaoIa5UrRtKRgkPmHKOJWMxn0EW?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8499da2-b934-4aa9-d218-08ddb59723fc
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 16:24:50.6468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3diFVpAukT6VZN2kgKIMDxlzWap+wL+U2VvHp1lwG2MEuJAPhk/Al1BoOsGsmxW4gWAKZK+qe6bZKZ1fAdVgmGism6qfgv7JkSAwcCrhsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

On Tue, Jun 03, 2025 at 04:34:44PM -0700, Matthew Brost wrote:
> It helpful to clear GT stats, run a test cases which is being profiled,
> and look at the results of the stats from the individual test case. Add
> clear_stats GT debugfs entry whih allows the clearing of GT stats.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 22 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_stats.c   | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_stats.h   |  1 +
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..a6888f03a4dd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -328,6 +328,27 @@ static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t
>  	return count;
>  }
>  
> +static void clear_stats(struct xe_gt *gt)
> +{
> +	xe_gt_stats_clear(gt);
> +}
> +
> +static ssize_t clear_stats_write(struct file *file,
> +				 const char __user *userbuf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +
> +	return write_to_gt_call(userbuf, count, ppos, clear_stats, gt);
> +}
> +
> +static int clear_stats_show(struct seq_file *s, void *unused)
> +{
> +	return 0;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(clear_stats);
> +
>  static void force_reset(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -408,6 +429,7 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  	root->d_inode->i_private = gt;
>  
>  	/* VF safe */
> +	debugfs_create_file("clear_stats", 0600, root, gt, &clear_stats_fops);

It seems Himal's comment on v2 regarding permission is not addressed in this
version.

Francois

>  	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
>  	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
> index 30f942671c2b..7e12fc3759e2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.c
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
> @@ -50,3 +50,17 @@ int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>  
>  	return 0;
>  }
> +
> +/**
> + * xe_gt_stats_clear - Clear the GT stats
> + * @gt: GT structure
> + *
> + * This clear (zeros) all the available GT stats.
> + */
> +void xe_gt_stats_clear(struct xe_gt *gt)
> +{
> +	enum xe_gt_stats_id id;
> +
> +	for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
> +		atomic64_set(&gt->stats.counters[id], 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h b/drivers/gpu/drm/xe/xe_gt_stats.h
> index 38325ef53617..e8aea32bc971 100644
> --- a/drivers/gpu/drm/xe/xe_gt_stats.h
> +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
> @@ -13,6 +13,7 @@ struct drm_printer;
>  
>  #ifdef CONFIG_DEBUG_FS
>  int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
> +void xe_gt_stats_clear(struct xe_gt *gt);
>  void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr);
>  #else
>  static inline void
> -- 
> 2.34.1
> 
