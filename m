Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5D7C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:42:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DF610E190;
	Mon, 28 Jul 2025 19:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGxYfexl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B410E115
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753731741; x=1785267741;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7/NI2rG7+d+U0xKXNvoGjBnFzs2/pTPdSQFua6PkczU=;
 b=DGxYfexluYS+ZMkpSNimQWkJsMn3IVjT/8AdrEwD1CoywEOLxWCmx0W8
 H2doeFwcQ06Ve1Df/j8tOAyU7wR1J79eE4uKxGKOS+JlFBqBmOhqcFPZE
 GBJTT6sjcme+A3hyPAYvaACLzjTSvJzyQ2nr6ciRj981+R85Wx/2UtPI/
 1gdOFZLH7dTDdsUR0ENE5EkuxgnNuuovZwYFe1NMkiy+KFPhh7PWO7Icf
 xktTMEczJUSNLPWKhFA8H3qiNc/uu7LUIGG2EItIIUCEemfer5imsZMJl
 TKNpkE9h5jzquXlLgA4jeP+iPNTIkmWcA9ZSZfRjDfk8m792CpVPXzhnP g==;
X-CSE-ConnectionGUID: EdXk6uC0TK6kwevGsZSHcw==
X-CSE-MsgGUID: 8U3O4mLjSUeOkpXt9SzaCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="59813188"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59813188"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:42:21 -0700
X-CSE-ConnectionGUID: vfqKRbaTQf+mAUwq1ZbvsA==
X-CSE-MsgGUID: QHeDa6hbQciHdV+dOBairg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162850851"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:42:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:42:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:42:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.64)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3xiJ7UgqpTKKvLAT4PDQJggewWBvtkaKalTQnDBsw7T9EZedjBGpJmWzvgoaeVNlCqjMjiFdSMpzN8Zwh9q/eUsZJFfzH83ACR5d3qocJ1bbUgz3ZRkCYUqRzJ+7Xo5AONko4Po5oFIzcynj56gzSEJQRxYjTwtvmYDcr0ktwuZfla9qmlHJRstMQi2cHSxFYHBJzfX1oW8ZC27JozxjVV7Oy/S6dAOc0Nuxx/3JlcY1JjoHRDy5HQIwXxavVDxBjn8U/z0DKwdg7bxrhSBX/nlIvcLSdgVVhf19dYIEz6r7pt95QsNR4Za1dqM3kXEAvBWQa+Qidkua4zbworrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GU6lmit0yFEaKIH4cmZVcJ/0ygEusz3T5p8+06T1xBw=;
 b=LXZ2Onm5k/LJfnUMF2i2yvcvnihnNQH9MwrrLRbLh1yxz9LdtrL1uY++xs7SITRzuUkVlBA2JKJnaTV2w0kBkDsuzUPIiqhDWCF5bE8oW+Akk3lUEmqT0CdbDp7XdA0KslMJGvyWXyResh9ORwfpMjGUdQOtXRXXwHrLA0FZF7TK4UalODP1EquiBvleRW/UkbGD4Ncfprtox9Qi/mZm9uLr9/Vw0YgfAmbUnWqylTP6V5XUGqHs7Mm+nlyE66aL0phaUtRjLOEbBERuzYlqZY702nF1IsCsmv9QK3lhsycCKezEhRy0U9RRw3YdtNum/HNMbqoUypvwn/FmY75wTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Mon, 28 Jul
 2025 19:42:17 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:42:17 +0000
Date: Mon, 28 Jul 2025 15:42:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 03/11] drm/xe/configfs: Destroy xe_configfs.su_mutex
 on exit/error
Message-ID: <aIfSlrbsDVaf04im@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250727172009.587-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH0PR11MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6cac3f-de1d-4adf-f5f0-08ddce0edbea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yV02leIBCDmblKIPw/R5yE9BvtaVhekBZnUpabcOsieQ0Vz0vAa7XNsOUvd1?=
 =?us-ascii?Q?9/fxJFxEEU/GW2i0hHXYrKBRuE/iCqgRF4l7gwi2HZ9JY+mr3bL9xTQ1jz8G?=
 =?us-ascii?Q?4tXF7rPUfGNQec0PfwoYU8rzQeSAk2sESEL3TQ5cBMHstLXQX05gSubmMhuA?=
 =?us-ascii?Q?NBdICHEd1eIPrZBzMoCFsQ/378dd4CWh1Njm6z1zhBji18lqkIuEGwteXJK5?=
 =?us-ascii?Q?t8j5sYo1tI9LfNvYH6T/efrA9wRZ1k1fne+w1pkVpMZ9gcRhpDAEvY7jWCEA?=
 =?us-ascii?Q?bgza3oxia6dVcgbCR3AG2Ljk8HhtmlDa3D4vMuGBXzS81j8GhfqOBgH9HQa/?=
 =?us-ascii?Q?r13nsw08gZvME4dewKEn/S3zip8JUp+zA1tYG3JcVnQQV2OGe4PMiWTMBOdd?=
 =?us-ascii?Q?T95WqwO9YH0h8hPcDzV0gcM7tc9WR4HYEBuzMGuK0BsRDZXiaoeeZyJ8e0Rc?=
 =?us-ascii?Q?xAi85ybX0YhdiJjoi1giMafRqcQ4HT09KHK6gBpsVWaxz8BsGQfSGSdIPzIQ?=
 =?us-ascii?Q?pu3ZCqCF9eaivg05sQ1LW+UyzDK7WJZhsRfv1k3+PXaciiZvpUVhB/Bz92p+?=
 =?us-ascii?Q?jbDp5CdKCWCt91temOmebWtchMf3Bw8YidAYTwdn1nWN1VCKM5IK2dBn3IDo?=
 =?us-ascii?Q?4PUMlnp3aBJ58xK+KaZjmcvjMfZPTeMaYEwyONqSD2hiYSO6xjgnzOyiQWyF?=
 =?us-ascii?Q?jNr2DKbdhyu6JeL+am4ubtU6KpwEtjjP0XCodZhIp53ZoW64jJhMV3bYEj51?=
 =?us-ascii?Q?doAGf6Ll42d7i2WGvqLNzR+o0wvaRMZTJdLG8mKcc8cV/hZskR7H5Gdz1B2x?=
 =?us-ascii?Q?WIDEigQvaLnr7AVod7/511pYKnkBR+ZZy0evfnlloy31gEJaRiItdDVlfMtZ?=
 =?us-ascii?Q?TXhPQSaeHeZ05Id1XvrwDLVhAt/dxNfuciRZC5kTTVd10/lD5QfCiQli+t6S?=
 =?us-ascii?Q?jjFd3wAYR6WtCKmq7juoYdiZ/yXzSz12mZzom3qJSO8S9TS929TD+F+1vKaR?=
 =?us-ascii?Q?UTqBxtYL4ALWYA1wHOlddgHhLm+OZ5TNOdITHtS1oifqc1Z/vEnpIdd3cn1X?=
 =?us-ascii?Q?7gV8yFkCKtcusvgNIobrb9Hy2xThLwheJJOYYi0IuryIauqCp+PHug21Mvpx?=
 =?us-ascii?Q?9cwlQc6Js56G4ut/I32Xrr/3vN6zoD7Tsg76MVm0HFdHqPaaOviHlPJoxiXB?=
 =?us-ascii?Q?tvITOybTWVVvA5Y0ftqAvyeAdu1zvdqg2UHBQXvdzLPn/6CYn0lMhC4vDtgl?=
 =?us-ascii?Q?N98XNHcrhRTeiDzhBy5zmtpqyZt6rAIT9UsdRU2oLac8Ab28dcrdPspNX8cZ?=
 =?us-ascii?Q?RBEdhtN+uuU7iYiZP9X9WQyVBPBhFQ+vhmPsSR0FK+Bxopo0IqM1InGHJTmJ?=
 =?us-ascii?Q?x84RwbF32epR9UhgrydU2iFSPKsSGAC96QUQlaovYvErc+DShGkp1myY5/DH?=
 =?us-ascii?Q?fZVUyRktXrw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MlOMWLY4q/Ax6ZkuT6McLClaB5s6XDIftRcJG6GDvkfjmHvz7Dtjf9Sh1W9h?=
 =?us-ascii?Q?8q5BWBr3oM0iSV8qvcgQQI+DnNmTu12cn0a5AEfi/m1z1HTRhl8a0EPlKFPf?=
 =?us-ascii?Q?d34nNs/Z8L+HclE1gnThsJhvAadROgAAJOCD3StJVgO8NEPeSk8X5dL6gQbx?=
 =?us-ascii?Q?1bYeSnezOT0bJyMhyuKhVn4EsYqtgx8VipeguSTtaJF5ZaJX/SynEeYqC/Lp?=
 =?us-ascii?Q?kxIEBdU0veKoK0a+yYFTLp3e7AMOD0S0qQpS1SO64KQnEBYp5cHlgxnjDUk0?=
 =?us-ascii?Q?6CNLgl37qVERq7Sl9stR8IxzLFuxbkgc2cmjNV7rQcOzg0y8apoiZSltTc+v?=
 =?us-ascii?Q?FdA0kQ6QqFk7aeh+bGkPl4BIK6rFY9b3AHAcQFSEAtxrgRVhmqStlL854f6p?=
 =?us-ascii?Q?Fd74LMK2wer5UBVCc1XGW28hwWoYlncCxKIeUx2N5WOQMMb8geMwup8uV2LR?=
 =?us-ascii?Q?7V/1QesyBu4dneNSDEQMkWXQYsWUF1YD/tQdQ71qKgCQSojl+Hv/NX9S7oPn?=
 =?us-ascii?Q?inFFcXRVYbp0j9hzT8yKpbAInxCwzj49HRoeoPze8kJsqMy3dHROJxVx7dDH?=
 =?us-ascii?Q?oSIigRQooaD+LFy+DdRwv1buphOnfzYD3ZEYfYVwcdb899ASI4IVM8JF+5mj?=
 =?us-ascii?Q?5zRFXgFs6aSltzeG460e8goA/EEIB3bqXqC0kzTlSpmrsqxOwwWDwT9zeQI/?=
 =?us-ascii?Q?hNGZWUDwtmcnTp3VvyGPz1YW6SpDLiHZ/UfTnJ1Bamx5co5Suhqlz5C1oIzZ?=
 =?us-ascii?Q?9KQQ8d6mQR53YfcD3Gw6dvZ+mlZWEWVvPlEJ0fOTtMp6saaLdklweqUmT+++?=
 =?us-ascii?Q?Z/7sqHOhU2BrlOfcoTs9xPNzp8xeNEyhRexfEj/CGVMrnygANRYnYP9zgDxr?=
 =?us-ascii?Q?crXtSTFaGegJay2+Qf6pCw9Rhevupjd2we8nmt5GkYw72zsncbVXOtXbbBiW?=
 =?us-ascii?Q?pGE+PkAC4hjuy/9ZnAISs65o0om+1FFHz0zCckA+svmzW8tmPEvf8LVK6LYE?=
 =?us-ascii?Q?40021pvbwEf3pMWUUV036Bb08U52Sw/BaFkykeaMbjfHhOVWYFokdK3v9JAa?=
 =?us-ascii?Q?5u4tol6j1k18OqUd6BrE9rSYmSGRSePO9hYjgbkzpj1roBFlPaONJe2oYCxl?=
 =?us-ascii?Q?KLYtT5/waDVQ5RY/iSetHMOtMCc4OlQiYJdkb0iB16h3VFk7yzQFNwWcwbqD?=
 =?us-ascii?Q?sUDYiO1Us6obZ9sWXdHWs7uRqHbYzZ1obT2AWX1Vyvi7e3DYmZzUw4vcUNWa?=
 =?us-ascii?Q?tE98iYMovQxcJ7D2UYQC9hSrkthp/UUolaF+VYtgEvwuxv8ec9/R3TnQxkR6?=
 =?us-ascii?Q?y7MilqSfJnHwUhuJTKlpG3liI0R1GwxNjbEai5vG1GOpgU5CGKcwqoNBR+hf?=
 =?us-ascii?Q?SAN9V4uR1uqjuZqoDDEHTwEPP0jNfa97eULszr+TqsUBkjmIz0hWxcZY2uxA?=
 =?us-ascii?Q?Vfef+738HEUFHc0CgAjcuT97Q6m6Jj/Pg+gROvkJF9jXQ5vRdNrrs2qQxCnR?=
 =?us-ascii?Q?S+zv+Zvc16spRd5g+EQJ0O0u+xOe9wUVOTNBl7ibr638scu84CwPen+amvpa?=
 =?us-ascii?Q?RNfdcGmO1J+qYOo6qUT851nWBpQSN5B+pbLCD3LC7IcwEyzpHnrsrly9JOUy?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6cac3f-de1d-4adf-f5f0-08ddce0edbea
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:42:17.4587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcaJkwYLtyxYzChaDQOFVwHwJKmGW+5+18b3XtcA8GR3Ru4mJae6s8FDezmB37uZNurG+E+DHvKr2rzHGFfYmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
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

On Sun, Jul 27, 2025 at 07:20:00PM +0200, Michal Wajdeczko wrote:
> While mutex_destroy() is NOP when CONFIG_DEBUG_MUTEXES is not
> enabled, we should still call it.
> 
> While around, simplify init() code as there is no need to print
> separate error message, nor have a temporary variable, which was
> likely just taken from the example code. And drop a traling line.

The temporary variable was good while used in the pr_err to minimize
the line size. But I agree it has to go with the pr_err removed.
But perhaps 2 separate patches here? one for the mutex destroy
and one for the pr_err removal?

> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 36e2b45b305f..6aa0531bcf76 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -392,15 +392,13 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>  
>  int __init xe_configfs_init(void)
>  {
> -	struct config_group *root = &xe_configfs.su_group;
>  	int ret;
>  
> -	config_group_init(root);
> +	config_group_init(&xe_configfs.su_group);
>  	mutex_init(&xe_configfs.su_mutex);
>  	ret = configfs_register_subsystem(&xe_configfs);
>  	if (ret) {
> -		pr_err("Error %d while registering %s subsystem\n",
> -		       ret, root->cg_item.ci_namebuf);
> +		mutex_destroy(&xe_configfs.su_mutex);
>  		return ret;
>  	}
>  
> @@ -410,5 +408,5 @@ int __init xe_configfs_init(void)
>  void __exit xe_configfs_exit(void)
>  {
>  	configfs_unregister_subsystem(&xe_configfs);
> +	mutex_destroy(&xe_configfs.su_mutex);
>  }
> -
> -- 
> 2.47.1
> 
