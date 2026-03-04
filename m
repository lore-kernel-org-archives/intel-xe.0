Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849F9EDEBF7
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 00:29:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9C710E8FD;
	Wed,  4 Mar 2026 00:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hrYeL46O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138DB10E8FD
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 00:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772584193; x=1804120193;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1xJp9hmqtiRziyxKcKFaRsb/K8DccM5pkw+F64pB46o=;
 b=hrYeL46OIDQhs58+Pop3AF1wbJfn1oboVZ8IZ3fv234aYpdrxhlolCyO
 2KH5KSvWnZVcjQqC1JxpFyIHSSwyJlOn31CwswcU5wt3PrrmCARu/jGGx
 4Oj8PWrlpyN7sT7qcui89Yht2iKlGuwrAorqzjtCPwvo/6epGFicMDrI9
 SeOksXv0TG9clObr1C0/5D3jO8GDmhlRz6bzKrAw7Thagd+YTqOpc34xM
 OHSnpie5xxM1QyDKguiqup97TCGNv/RY6wiEjOcuJofsJVX2Qbr+QFmO1
 kZW+vmM2QNDLcHnonck66VAaUIcSA5kmMe0QwzNJZLBYxGOrLygCQyhXG A==;
X-CSE-ConnectionGUID: fCwxIQicRlOalBTOK4+LfQ==
X-CSE-MsgGUID: qd2aPyuYR02t0u9EOfk0ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99112749"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="99112749"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:29:53 -0800
X-CSE-ConnectionGUID: zSXUa5vdRx2JhgwY+YnZoA==
X-CSE-MsgGUID: QNDgi8eJSBefLxDh8xNnOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="216042836"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 16:29:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 16:29:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 16:29:52 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 16:29:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZV5fLRa/OQzoUcPkCQxL7/TEzDKboM6WKoWACmNMR86wqfg3PJk2WbWH67z3bAKco+IT7KVcEIo/Qs2Uc23/sFJai22MDZi4+ty73HGDws6M/eY9PE8wA1OSa6FKU+R/15uunpqZAlc0mQ4nPQHTD8rzF2Q2q6JCdYO2mJzapAMCUfvARCdPBovySWh1Qug/4Y2vO/4FANdlvOtrf1SZeQrjNZHDH+It7N9DHKbfsH9JcgrxKokm8D4WXl/u2df8cT24EljNFwEh72hvL8EWK/bP3sLazmuRnLUKg62nMSgGgHOxN2DRniQrQjSZuAu0NZw20RUgQxooS2s/oHccZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCd4FPPb/FMX+Xs+ima07/26R7Sda1PhBVZcVSB8iJM=;
 b=Oljx6kPwxmrJan5B3WTL6+9CLIwX4nuKAsivolD3jlw5B684RQQD5j+exI7RCNi5kJKpE9+cNjcrsjdwvaGasB2+1vtVPVz3NCFwpNy3gYi7EmqC9orZ5H5Y2IIpWfY4JWV+etTmuNMfDOOgTavy697eUjeGDNLslSpsJlKs/lTKb/l90hIlkhVVqk0nI5uoSqWX77c8E6bAtzOLsbKcrSqh9TvqBgOtR/5R6SxTg4MLcFj1SUUY7A3JUhqi/6xPMvpJ36ywPMc4t3mfqSWAHvK26BGpkXZIeY8jnpYAvJZa0hW5uW0G/MkoPElHPgfcsWOJNPicXWi/JiL5LsLjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7135.namprd11.prod.outlook.com (2603:10b6:930:61::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 00:29:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 00:29:49 +0000
Date: Tue, 3 Mar 2026 16:29:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v2] drm/xe: Fix exec queue unwind on hw engine group add
 failure
Message-ID: <aad8+9SPhClAwp2H@lstrano-desk.jf.intel.com>
References: <20260303235219.1035961-2-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260303235219.1035961-2-shuicheng.lin@intel.com>
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 116e8b34-741e-462f-98e0-08de798524e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: qY1i/7eeaw1VXls0V4Y9TKGL43rMlWP/Go4hqaL9uh2aCvCmq/zAuvMOlkjtn62kYkH56bktzIVUSHlPzz3X/ty1Kb4hDFeZR8SRQB7n6MD5jvMmcE6+wd4vcb7117JJWdLMb+0TlyI43HnF8UNBNgEV49ujvbhivm92fV1yPIVnf28N7rQZDeTEY27evQsEkeMz+FUox2l2gQgnSRsE4lW72TxUq995o5R7+YueM/IlWItvYRh9nGCSWQ3Klka5GClef/1xed9LqMY0JahYKBsruYt9upW/22/tbL0ecY4aZMvpIaujxwh5GdFHk+qnpHOU5K5f6xwszHy/nDev2eK4jy7Lnf+0g2QTelB6Q9wIVjjplo+jGvtpXT4QTpMEu6Loj3LuN2Lj3vrB2th9ooGJ0G9rrmQ9unZaDFFnIm9qGvIvAKwf845YT+PjPdRxNFdiJAoxLdmknVXrTfp/mCmHUBQSp3VVVGYiewAYXFwGMYKdM8BVVkdtJLxZj66/syq0+e9jX5LT3F/FjDmgA3HWLMedx44TqJgYsSqb5NaELC67TSLg877AuIYfOh8O/l8HuSFEOEezwjyLHVFAYPH16Raxv2E3LYWEOqJkAd4z45ff7akjoum2qu8V89DxDnOrDZCkwPRGuc/9bOzwJQ89F5jmepjWd4HTYbmAW6MPNUvPaqVyQl/1Gfk+sIrYmT5n21f/gRhEXUdDJIjuLhG6JUeXIuMKIByNgBnw5ZU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VuSLyI8hnt/ian1yOXXhDJBZoKGhFyuFjqmMZMBRKMbW2SYqHJwPswNObu/s?=
 =?us-ascii?Q?c3V/zVKTU0aLRtPg5QLDjaBfyU8m+sXQ5j7rOj/MSHTY+lPrS+ibXN0114Dh?=
 =?us-ascii?Q?/M/O05mOEXQx+q34sBjKdy3JfZ0+HO/KKpDXscnXBWixZDPCrlcpL4KsnCNY?=
 =?us-ascii?Q?Qgj2oeYZSr2JncmFEpYmcVHocobX7HQU5LVEykOi4DqcOwsvbLjXDeXi4wTn?=
 =?us-ascii?Q?8aqIXSRbc+JdjX6TD//pxCMm6uZcQ2Etg4ETozJwYPetsGYR9Sz8Fln33bvv?=
 =?us-ascii?Q?CqCkjCeRM6WNd2dAUVYkdYyhyu7OFjw0tRsP/+hO+pps6gb3QAJEYZ4Rsd7X?=
 =?us-ascii?Q?3I9B5NmCDUldolneOp24EPT4kXlaN0n874A/H2K+aT51P8gkqFEpVtNv4Mvb?=
 =?us-ascii?Q?kORAMZZw/PCfs/q3ydDA6aSZD4A9h41OF02SpRnb0tBogJD34QVo5Mf/Wmqb?=
 =?us-ascii?Q?V3pyHwr6ZD9cg6ttEBQkfl7BhgS9zsq3Pg9FLTewvm+BLrB2VieQqUuyP5HX?=
 =?us-ascii?Q?ClQcy5XzkmKn7nE9u+Jaky5A9BXAyodw8XOve3B8k+3junfhUk0evBPFRpNm?=
 =?us-ascii?Q?rDL5gmaSmOtHq+IwuNBfi/BYfotpAi8wBqKO8pZZE/708mYpOFR0zRoB9Chd?=
 =?us-ascii?Q?eCbnA+Zl1ZslEns/pLrqJaymLJaMJ9g3hEvwpcf+e3xuO7bKSUACU3ZvYZQr?=
 =?us-ascii?Q?zbMjLUqXK40XFTAq+jx7fdbjnSKYpFhKkVxdol8sHdcD4GgrmVIMPyGbeuRf?=
 =?us-ascii?Q?g1uXrOIGXFh32bH7nBDbLhn+s4cqe0wjVnbaaZCNEXBIwvHGWcFJ8uekHG9j?=
 =?us-ascii?Q?pB/PSL1jREJFML8eCiss7Z47zXjAe6Mh9n1N7lgdRF7iYL2Cs//sL1vPnNHp?=
 =?us-ascii?Q?pbJUgGU1RNcc3cpM27yJ9TiNivAkFDlUWxp8pxQY/8zTHjunRG16EM8AUwAp?=
 =?us-ascii?Q?HgAOGgcaGOhDa6nAFSnx21w4dmVKC/vqmM8sxW7667NRkFlFCtRvdlQs+hZG?=
 =?us-ascii?Q?OiPSjOUuLo7psUZ4wae/jJoKUAaV2O6ej9R4rk/TW4dL9skl6wCSjs6sDX2g?=
 =?us-ascii?Q?k8xv5fkJ/r08EQribNHu2klvlv508rGXS0oxhneo8MDTCKYRJwgh6vC3Hp+C?=
 =?us-ascii?Q?1voQmlBscZRegw1W7PYtSCQu5UpgfDPJskETJnOEE+ko4bN3xg1Zzr5/JM+W?=
 =?us-ascii?Q?dhYWcHycE0+xdwB8qLoZTokdRXL2g8B4CiPxwfHsWy/BZ71+c0veqVQDMLC9?=
 =?us-ascii?Q?Oqo/TTv26br9Qc4kbUMWaF+Vuk5wP8aj8N9n30lnpo84P6CsWNm1k6UyWmw5?=
 =?us-ascii?Q?Nv3lxSAh0LuifBDpSK0cV4bf4l4ROl6XDU0/VovZC9Yn0zTIKjdXGzCYvZ8p?=
 =?us-ascii?Q?A9VNqIqRgyyehvX6Gq+RN4/qp7Gzt6C+CCYeGMwvS0zOnEEu39+htDXKqpF+?=
 =?us-ascii?Q?q/NfZr56t1AVgJSHuLb6bCJwTypVTvBdQwID0ZrIUehgMwiOoMmyl+5yk6Ii?=
 =?us-ascii?Q?nnejHVGb6404VQ988QNnoqfcrEzm4vjQ1qSEPxupZ2/8N2To9ENiqgijZxHH?=
 =?us-ascii?Q?goWGRy8WxXSn/fUtNy7rJ+/6vl1a3j3QRcSE+csKd4gQX1BL8vWJbacG77ep?=
 =?us-ascii?Q?O8LQpwLXvpkjBXn+Si9ZUMl+Z6w+WbBojSgeX4y5NcoMfc/2se2OngYXmRVq?=
 =?us-ascii?Q?ul1rxMzj+5R1epMKq68A3GBk46PrIL3GV7m623BIxhT40S4L+WNejf1mdvkz?=
 =?us-ascii?Q?rvvLDyCiB2KZzofwGUZoyJvSVgFUNZE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 116e8b34-741e-462f-98e0-08de798524e6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 00:29:49.1214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axdx6+6OiWcA1doWi3wA1NinX5wIF7G4bcJweGxiUUi2zKCDVgKeuJa8kRm7fxKRdJj6Z2zqWqCSKxjfaOMbFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7135
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

On Tue, Mar 03, 2026 at 11:52:20PM +0000, Shuicheng Lin wrote:
> When xe_hw_engine_group_add_exec_queue() fails in
> xe_exec_queue_create_ioctl(), to undo xe_exec_queue_group_add()
> and xe_vm_add_compute_exec_queue(), the code should unwind through
> kill_exec_queue rather than directly dropping the queue reference.
> 
> Fixes: d9ec63474648 ("drm/xe/multi_queue: Add user interface for multi queue support")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> ---
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> 
> v2: correct the jump label from delete_queue_group to kill_exec_queue (Matt)
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index bb273ca02d28..4dc59f448f2e 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1297,7 +1297,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		if (q->vm && q->hwe->hw_engine_group) {
>  			err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
>  			if (err)
> -				goto put_exec_queue;
> +				goto kill_exec_queue;
>  		}
>  	}
>  
> -- 
> 2.50.1
> 
