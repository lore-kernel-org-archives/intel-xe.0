Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA55CFC51D
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 06:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FF110E15A;
	Sat, 22 Nov 2025 06:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4XO2kVP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB5210E15A
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763791386; x=1795327386;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2EXyZMdUnAt4geoOzPMEVKvNFnAorLPO3GZ2Kwo5J8Q=;
 b=Q4XO2kVPYmKj6q2tGAjD7DOW23BeBoSL24M5ElTegNLD0Eau82JxWptW
 FhEcaCxzlwBERT13Xcb/xRCvpUu5pv4Ks7Fj/BB2PzS3kRV5omUSK02Cj
 cjSgEPD7qudUsUbtDii9UQ9mwBdoodSSLoUJlGfoi0vsWr77hmVCh2yVu
 ijothN9Kfk/zd/4rEfboqbM7YFRCoWjuJA0ifrXw9TVB99YiUJnsoES6c
 /MTv52SLuatQ3JHYz9ns4ZCB+k0Q+d6qpIuB55IT/eKdpuK783mW0Kiql
 sfDAAIvn7yaGHf32NBO5bLPfxcKcushkzGWW+LiI7/46Wr0ofMT7YPQYw Q==;
X-CSE-ConnectionGUID: BwfYqRfeQninwRayBoT1Lg==
X-CSE-MsgGUID: NOjRdDliQdqwvQf+EafIdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76992114"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="76992114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 22:03:05 -0800
X-CSE-ConnectionGUID: 8SbSn2woQ5KHWj8gcV0G3w==
X-CSE-MsgGUID: cz4KqzNxQwyepfC5KrkOmg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 22:03:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 22:03:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 22:03:04 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 22:03:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvbu+silF7Sxvjy8ksREgmamoOEE6IWhWGq8dD/Q8kXuphkuCJKzavZdtd/nOV2hNuZPiLaB+nVkaAOdCdx1r6aF6Xbvp6ZJ7gZKsjyoqzwF2zexvKuy239u0pB+W/9cv2gXOvbwH6nJPrtuAstmBZnrhQbKgFqKZMAKD+SFs1uWUMJyZIyp4hPP20jRND4040Zw7v31qgKN9+ShprwVGpHcGDC2FeLrimxnn/HWyknlyTnMJY88kFnTi9FSAPKcFc8ZxbfQI5eHp4fcvWJjqNk9NyeaD5oe1pleR5y2kH39H4HvxXZUXjEuFLRZ+swbhmCUWL/qYGVYE3ES4rxPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKwxw+PH4NHh4vPgIVgIJZnU8I1/cbSOtRRabPK8HC4=;
 b=cXTwEWj0IGqySMn2soM3A6M8c3E4TiVSU0qTnCNWJyczk2du+MHjEjJ2TtKKKk9qIut8IP8bSE0YkH8P/BLqz9FjnQmaF7jRhrnCcadZa2jmrAJMoq+1sYlppS9gmNFBKi9nyH6EGm0B/5bj+7ME1i3BwUSobtzDdq+Gw9ZgecQjG1euCQzV4heq3UnmNjitCIlzykGYtZJ0aS0nOunbOFeFkS/BVlUp9BrjZurIUNyDShho5PecBft4IJQIzj2WNRbSxPO9EG2UnLNP2k8a5a5zqAr2SXK4FCKOIxvdbALRu4bfyGHXXV5bm4cy2mTS02A55PH/rnEa1nwIi7Kf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6710.namprd11.prod.outlook.com (2603:10b6:806:25a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Sat, 22 Nov
 2025 06:03:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 06:03:02 +0000
Date: Fri, 21 Nov 2025 22:02:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 16/18] drm/xe/doc: Add documentation for Multi Queue
 Group
Message-ID: <aSFSE8FRzGN4bSac@lstrano-desk.jf.intel.com>
References: <20251121035147.766072-20-niranjana.vishwanathapura@intel.com>
 <20251121035147.766072-36-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251121035147.766072-36-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: MW4PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:303:b7::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 654ff4b9-4f3b-42cc-b54d-08de298ccbab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RK+/v6QO/p+6yJXIObzoETEv/WUnKUouTIINtVDFaEz1UNEmdPHIHXGF0Jq6?=
 =?us-ascii?Q?29NF7wso8c8ygcxdXnI3iYagEO9jiB052e4h/0rmFV1bXEAc7zT4BHgcRXOY?=
 =?us-ascii?Q?d8H4vNC1ckMw4wJGoMNxi6mUG4h2M5pKqNtQ5lNE1WmymV7eOK8IbuD5mJAY?=
 =?us-ascii?Q?Ga40YTXlecTL7YjK9wdcIc0+uvE2dDQM1qVttBQjcE+vkrCTQWPrG9Q9hh/2?=
 =?us-ascii?Q?dzVKZJ6K0+FeXnyDFYwLkKsHQMfeqRnPqiQ83x7+7ND0d4OCQJKMr8pWkJRF?=
 =?us-ascii?Q?2PnJ/JBoDGMzEiiQVgpdCJci4sPwzD7EXWHSk4s0jCbb8Ci/6BRTX8ndmEwB?=
 =?us-ascii?Q?QwEDE+iG1XwIN9/oeKtSiAzBPhJRSWRzMSBxpCdaIlzJsz0XyV1olKIKPqVf?=
 =?us-ascii?Q?TM+aNEZ0VORvXW1a0uo3VQMklMHJf52lr47AUOTbvAnbsBpYJsFdm014yySJ?=
 =?us-ascii?Q?4XZCVDX8ACwxqII1R1n3J2O9Hi84gGz7SUDAlWP9kNb5KmLzRZIczbdxb9UA?=
 =?us-ascii?Q?mlxIlo8VfH1pGYkdWt2l/yZbnb4N6/RHeh4waLqvVRKM+HWszrb79YDoNKL9?=
 =?us-ascii?Q?sXd0aY7AilrrYjpkz21ea092X+D7WGMGbE+TPcfr+EH2U1HfJjlWKikYYAes?=
 =?us-ascii?Q?/eM9LrL3p85B3SXz2f4NDVLrfxvdbzVrmYyTMNTIlcNH2+2h88LsMlrjw1oa?=
 =?us-ascii?Q?bLTZ/KvEcuTFaYBejVJMrIXto+YCfF4FwF4tpyjLCGP2DRuLqueoALVo4Rcx?=
 =?us-ascii?Q?dBSlf6rO1EMd6XmzxfZeQqJezEr9utsWRDy0GJ02j6L44YtVJWPMmnZa3s86?=
 =?us-ascii?Q?7bFypYSdSmzKvI7GSFY7pCmhP39tnQzTcjL4DoYN1138Ge752oDfnsDqLW6D?=
 =?us-ascii?Q?0p0AqU2sAcPTK2kaKg6a4o0P+D81g+L26YnrGWYx2wrNoEqpMxo3mXPcGBtZ?=
 =?us-ascii?Q?k1hG9ARFwHhkU7keX7k2/8fgtR4LnyVBYuf6XOLo3YFqL0gfjotDKEwkVTBi?=
 =?us-ascii?Q?wak9Ni3hnzLVnivziGugTKwsIkmtpLwOHQoKVOD1kly7/TlWOeLr6myL3aSA?=
 =?us-ascii?Q?EW0kUc2W9Qd6VUwT4jXXYbVzmW8XoQkXo9HHE9jlFoUr72ok4l7ct5zvcXbm?=
 =?us-ascii?Q?mZDL4ulBT2f4URQ3wcXxP3q/pdDP4p3mcggDRf6ZO2Koq7AK4VPgNE+hFqla?=
 =?us-ascii?Q?Hu35GLSTBpWIS7IItaQENVKHqe+Riaw4Nvn9R0fLF2EnY6bHKpY7EPaIi4sY?=
 =?us-ascii?Q?Gh6sc8BraGv7o0XZW4nDW5wmm/xe1O8RR+8SIxM/zAJDPTF+n7mq+k6ravHB?=
 =?us-ascii?Q?IKbdzWPCBdzcZgVIzXtZvi4D4mmkdfuQ/YwAfR0Px5PWuoyvoyf9DXlSDjv3?=
 =?us-ascii?Q?AU52xMlYcIZWVnOIzMWBPNfosoRhKLrto6xyns/02KzN7AVs4GjjbqFiMSQH?=
 =?us-ascii?Q?eOc15kheygol3OYP2Se5QEUJuRmsceDU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oipWBntNrLDv640l/nX9v8Z1NRyrhtEQ2KvsEoWyyML2OzllpLZja6kbRnDR?=
 =?us-ascii?Q?HvSD3W7MzhsW4wbFjYL66oWWgUtuXBhxkCL6QiY+dQuhSOd9j75vIih5KaiU?=
 =?us-ascii?Q?VC2pTE6R64SiqZWmo6LmD4BL3BSviD+xTw13Axs5SQWsP/iq1dy0tzymkWUW?=
 =?us-ascii?Q?PzQwGyHyDn35lA8+yBUiaj+u12GRj857J69GLJYh5g1O2I4GsQiBnXJv8zTz?=
 =?us-ascii?Q?WdeXWoMFOiyabl5YgGpqFeKllHXG0Xo4nctDkkLAzLKE1GfsNryvn0Bhu6Ma?=
 =?us-ascii?Q?NJvuwAnHdgsDYiy5SOx6lz3ckcHD28GshrUwBXThYRn1nEDPYEpJATIPu07A?=
 =?us-ascii?Q?aCKx1UI0/bO5mn9tuBT0rRzMq0QWttJVzFuhYEf+irOjIvt2GLrgjOPnuMRV?=
 =?us-ascii?Q?zEHmzictWGP4A8gpw97h3ONmI6KVy5XK5yPaKItA61Ay/jaCiwpw9sdW5lvF?=
 =?us-ascii?Q?y0shGRO87yKi/B0V13nE4fJFG3SF3IjKKTQO3zrropkOgmHjuJELPMY5OJwF?=
 =?us-ascii?Q?MuJakDoQwjILZ4VJ8xV8x5W1yomkTBD+D/2Ic7JEUKMQtwVaIcCCSEP1i91A?=
 =?us-ascii?Q?wF5sGwDhxIYusuwpYwn9hXU7qXCfH2vp/Ww7Eych3aDhaHCB5p9Le1qhdkSu?=
 =?us-ascii?Q?g5hShUOOqE4q7tm//qt6pZoMxX9EX4LZu3SXRzz0JupYb07HqNqtGOiOWsLV?=
 =?us-ascii?Q?ZAX/yPshq6ZL+3WUuIi3vOnLl+AdfnG1xVm6K3bYFN7HT2f20RHoPh6FmsHt?=
 =?us-ascii?Q?yJW8yBM3K/wlsmGCRQ+GIACkJbO0Cgm2pn8bKzAMJwdEDsr5VVTUmWcmbv7i?=
 =?us-ascii?Q?89uPc/wc9oQDGW8mXk7BMTMSfSaqIo5Q7RvBRBwLgCnsYAchGOCRGp3Tbr9E?=
 =?us-ascii?Q?Q6ziyLGgzsP91z0fWgn93mcPPb3MBP9S1tV8ABx00xJKxoVD/dlcQBoynMY3?=
 =?us-ascii?Q?vePK5mfsoDHOPoRMS9l2MbPImoPG1eDmvi0N4gVz5PzM7guGGgzJKQRTdSpW?=
 =?us-ascii?Q?o6gSpJ5lRlW5bIUhdYeL1qPm86FckRMFR5qf1KgRR5Ac4Gdx1EQ3xbeCuk/d?=
 =?us-ascii?Q?LJvJyyUMhbZThmu9x0rLj24BUT5b+n0y3qBwq02KHgTE8URB4/J1P2kQ/yYf?=
 =?us-ascii?Q?Lh26dxWK6lImkNaprQA7113YKawg0/kYqYr9zo/p9fbrGdDgIj96ibbh5vte?=
 =?us-ascii?Q?tSHfFa7Wv7d6nahNzcWQyprnIIC9i/fe6kzXTvOSBjwczgSdd1UNXfNae8+/?=
 =?us-ascii?Q?3HmtC7n8KFdj/O9jo/XC2b+DEbpaJ96f4vZNHdyi6QxIuMS2ik9rpPixO07c?=
 =?us-ascii?Q?PugpMVHscfJniBNoZ5rT/12FGdbhxQRs5YqMGT4TgOhjESw6KriEe1yGlLsg?=
 =?us-ascii?Q?HAxjAGO5UUo0fG76yp6YqdmZQiEQHoBuAx0bZEP1Yy2eJPBd9LarcBNO7R5q?=
 =?us-ascii?Q?ED3kJMTfr2U7/L9BRJUhSddRgFFTu73qmq6cksA09wKJfn8/1FtusMMYFDxM?=
 =?us-ascii?Q?g8tO7NdKiiUa8qMjjecr6/9CT++J7o+7joK8P71QpzKhovozRbT2eY0fduSK?=
 =?us-ascii?Q?+aXP9gM+O3+gCPb4YuNHVnxaAC1gY2pvRuiKKIxy7QvyZkcPpl9uCUQPGnXB?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 654ff4b9-4f3b-42cc-b54d-08de298ccbab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 06:03:02.3950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kqL0dPY3Fxh6Dd1O2sH5Ovr2aZuJFTPYZdPvTtGigMcGgp+2g0BPWZvI1UYoylZ3kyN+Y9BTRXUJ3UAPMYZtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6710
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

On Thu, Nov 20, 2025 at 07:51:50PM -0800, Niranjana Vishwanathapura wrote:
> Add kernel documentation for Multi Queue group and update
> the corresponding rst.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  Documentation/gpu/xe/xe_exec_queue.rst |  6 ++++
>  drivers/gpu/drm/xe/xe_exec_queue.c     | 45 ++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/gpu/xe/xe_exec_queue.rst b/Documentation/gpu/xe/xe_exec_queue.rst
> index 6076569e311c..732af4741df4 100644
> --- a/Documentation/gpu/xe/xe_exec_queue.rst
> +++ b/Documentation/gpu/xe/xe_exec_queue.rst
> @@ -7,6 +7,12 @@ Execution Queue
>  .. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
>     :doc: Execution Queue
>  
> +Multi Queue Group
> +=================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_exec_queue.c
> +   :doc: Multi Queue Group
> +
>  Internal API
>  ============
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 839fb08f09e7..50326b4431e0 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -54,6 +54,51 @@
>   * the ring operations the different engine classes support.
>   */
>  
> +/**
> + * DOC: Multi Queue Group
> + *
> + * Multi Queue Group is another mode of execution supported by the compute
> + * and blitter copy command streamers (CCS and BCS, respectively). It is
> + * an enhancement of the existing hardware architecture and leverages the
> + * same submission model. It enables support for efficient, parallel
> + * execution of multiple queues within a single shared context. The multi
> + * queue group functionality is only supported with GuC submission backend.
> + * All the queues of a group must use the same address space (VM).
> + *
> + * The DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE execution queue property
> + * supports creating a multi queue group and adding queues to a queue group.
> + *
> + * The XE_EXEC_QUEUE_CREATE ioctl call with above property with value field
> + * set to DRM_XE_MULTI_GROUP_CREATE, will create a new multi queue group with
> + * the queue being created as the primary queue (aka q0) of the group. To add
> + * secondary queues to the group, they need to be created with the above
> + * property with id of the primary queue as the value. The properties of
> + * the primary queue (like priority, time slice) applies to the whole group.
> + * So, these properties can't be set for secondary queues of a group.
> + *
> + * The hardware does not support removing a queue from a multi-queue group.
> + * However, queues can be dynamically added to the group. A group can have
> + * up to 64 queues. To support this, XeKMD holds references to LRCs of the
> + * queues even after the queues are destroyed by the user until the whole
> + * group is destroyed. The secondary queues hold a reference to the primary
> + * queue thus preventing the group from being destroyed when user destroys
> + * the primary queue. Once the primary queue is destroyed, secondary queues
> + * can't be added to the queue group, but they can continue to submit the
> + * jobs if the DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag is set during the multi
> + * queue group creation.
> + *
> + * The queues of a multi queue group can set their priority within the group
> + * through the DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY property.
> + * This multi queue priority can also be set dynamically through the
> + * XE_EXEC_QUEUE_SET_PROPERTY ioctl. This is the only other property
> + * supported by the secondary queues of a multi queue group, other than
> + * DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE.
> + *
> + * When GuC reports an error on any of the queues of a multi queue group,
> + * the queue cleanup mechanism is invoked for all the queues of the group
> + * as hardware cannot make progress on the multi queue context.
> + */
> +
>  enum xe_exec_queue_sched_prop {
>  	XE_EXEC_QUEUE_JOB_TIMEOUT = 0,
>  	XE_EXEC_QUEUE_TIMESLICE = 1,
> -- 
> 2.43.0
> 
