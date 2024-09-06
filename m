Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02953E6FE30
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 15:54:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAED10E070;
	Fri,  6 Sep 2024 15:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="guhcf3y8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C0E10E070
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725638049; x=1757174049;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WxWu8W0QW82sAs8zlf66lqa5YIDuBwt12iIlfeo74Bg=;
 b=guhcf3y8858kpVa/+yY/ANh+HNcnGrKuqXy6kcO7hSKXN+2/QTSGTTPs
 /EYd8eFQ5MWhMkvr4RYmYk5uxfbw8QZoVam8nsbcXCPkWEStuiacDCslY
 EcHIe3pw016J+5LzWEjFT7FQ6bQwMHFTQMk/jFaQB/pEm70jVDA2uJPO6
 C+XHtPUOT+tJ90BSIG6DD4HqGEyBNWcn3pc16OoONn5Xijm6VqPoH19J4
 W9v0CUB5kP7WoliXWROQV57FlHEmP7HzEA/U/+TMsSD4ZUzgpHgoxn7jV
 IyBlbBaSRvaUcLYo9sDgDxMR52SICwQzbSSguJ7IWl84NDkZhz6pCIkro Q==;
X-CSE-ConnectionGUID: TKbk4Vv1QRK37wg/y0n7fA==
X-CSE-MsgGUID: BEozqrQ1RZOk7FT2jrk4mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="23907065"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="23907065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 08:54:09 -0700
X-CSE-ConnectionGUID: MuLiWj0JRf+89BsHnvQ4Vg==
X-CSE-MsgGUID: btQ7BoUZQsWu4Weo+uu95Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66738257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 08:54:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 08:54:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 08:54:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 08:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XT6DgnQZAWXQiNpE4tsPt0mi/1kDBVraRXErd2eoDhenhPSPbE+Bb6MhtP0BJ6PNivs+O5He7ehGC7uSNby14o6y0V51FZV1/RE1dTyhUFHn9OEH5D7NR4HArSAoD+jwx17vfiCnMqiBE65XfHEK0ff7D3wKgkHBQQonWjBkOXnOX1u3K+RoZ/taxM23FrOsgRY1h5srd6cZ3j2CA3j1H8/GyWZ5xfe1WbOUNIcWwt6EvqJrbEOklgRqT4dXR2p9rVtvioqskNLPP+/Gp90ECsH0Y308oHzh9WxBganMuAAE6arDEt0GrQ8CJqw0QXxvd7iGROQv7pGqSWriN65zXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxWu8W0QW82sAs8zlf66lqa5YIDuBwt12iIlfeo74Bg=;
 b=uzQji4O2WabLLx/5afKZrI1ioc19lSo4bb/1RvDQZdW5Wcna0ka/yfQhIz1Nfu9d5bUWRKaNcLJD53+pP/EWic1I29Nlj0wzvbm0zklyOonWnxHl4wrGFHMROIFfvunZdymLdpEscD0fTUDbiEFAgg8t+4GY75ZMv6PPoP7yxGcEBXtq6lop+lhR9a9Fwd7nv6hCftQld0ElcIvygVDzaeSj8jOxkKepYrJxdhUix/dvwk2nITmrzrq6Vh3yzil6Jb+rDXGwfsXBFYPfWS7GzKi1KHcNh8CfuzxxTvTsdIq0CQRfzVdH3ip/9IIhdPyfI7m0APA886d/lXVM7CaJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 15:53:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 15:53:56 +0000
Date: Fri, 6 Sep 2024 11:53:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] drm/xe: Implement device shutdown to make kexec work.
Message-ID: <ZtslkOB3kx4klloM@intel.com>
References: <20240905150052.174895-1-maarten.lankhorst@linux.intel.com>
 <87frqeovgq.fsf@intel.com>
 <3cf1bdff-3abe-41b8-9078-c4fc5607f3e7@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3cf1bdff-3abe-41b8-9078-c4fc5607f3e7@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:303:16d::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 33495435-7e13-4c46-e59b-08dcce8c1d22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4rq1LPGmoLdDy+LUbch5sZzt73ZNNJc4Ys3VgDySXGq5i3FtlIjxnG2LWa2f?=
 =?us-ascii?Q?Sy7CaCukpA27zLhxaZdCzdcwqZ6V/LA9GuZIcSKI2L94p28lcmRQfCv/s/Fk?=
 =?us-ascii?Q?540oN6VV/0tKTO4zfIOB2ZhZUgWlb2MpZWRwv1gg8vAylwRIscwj3/0RWDI/?=
 =?us-ascii?Q?8JUN/qIlIZFHGsFm6VzapVz8VdLcfTrfKlHJzXJhd1Hd6SzZZVowbH5pkASa?=
 =?us-ascii?Q?P/20X3ThsnBszPtL6jp08z46MomTvdfkn+tZDK2MXQDGYIvmOv/fxQ4IPgYS?=
 =?us-ascii?Q?kgmAN4+2DkTcujFNDMQ7PKDbOQjk/GBwX3VRH/6XBGTv4GMmLLhOT/LlmZ6d?=
 =?us-ascii?Q?rLaxJSxhDcA3RkY7wwCzpFj2b0jI5F0zzafVPEpqDXceBKecHiwYH2vupBVU?=
 =?us-ascii?Q?wIU/AFOTjF05uv0kdcDOgnYu0hPs+PeoA27Mzj9gUSVx8nd9RCYLkqewOk1c?=
 =?us-ascii?Q?jWxF752S1L7YhQFEBj7f3QZbLYP/FEAm9ecrNNIXPV1jw2VY/FF8x1r+bzEC?=
 =?us-ascii?Q?hVGIjuW7OQb6m0CoarRajmEyrTE7jreO3zjW4JKPGr7YcFRADX5fv68jjVvz?=
 =?us-ascii?Q?AV5NyNU633Wk7oQQuO++oFlurdA+VPs9vwawNTH1uwb+V0FXosiPRaJi78sq?=
 =?us-ascii?Q?ROlD4ibXEOM8JApU8moKzvhR77dTYojwBn5ULgD/gtoUneP9B6sJgBdHdiPd?=
 =?us-ascii?Q?f4u6a//366pViPgueZn5xvB18P/WxND5PH7E9XEA2hr4fXDCtpA+eYZHMKZZ?=
 =?us-ascii?Q?OvpQTwMsIj9y/AFiLmpIUYmNXHU/gqSAZgFjIy/a9LqKJd9kswU2ltZ9kEnc?=
 =?us-ascii?Q?ra1Fv/QKFr8e3erPRsgLLkBqWWMPicbVPaQ/n737g2Luj4Jdi8MACEB6CzDI?=
 =?us-ascii?Q?oDDbsq8LusUzzQK+7YmHDbEz0EuiI71kWYZ7YvHSP5M8vwKe25GVAX4OS3X/?=
 =?us-ascii?Q?5YI01w1X08qwES8DrMId0pewoshJ4iWXqtYyKa9t4MUQJ5k7koaAQg6PT+Ov?=
 =?us-ascii?Q?J0PL/Lkxm3akGfQxn/KMmE7TrRiLLG9fRGbPXcu2J5vwxDJdNl7dWFkRWSAe?=
 =?us-ascii?Q?qP2QB5yCSFhbJJD7np9XnHpdYk+YzqnFt90o6j/szPsipcPcTJhpbVhI/CDn?=
 =?us-ascii?Q?qu+MbrZ4N2W38JR3OnaP1hjHYzZD7EUEEa3AzRitROmLaZtWUeBq1DTNJqkK?=
 =?us-ascii?Q?tKWcQvKbMIAIYP+wTghhcaaewddmPiD+NvrAruXcfaa2hVJ60VMl/8uuBzJX?=
 =?us-ascii?Q?EPmbgUC1FyiFaKP0BJMx3mXgLlX85l/zzBSfB7OUz3X5n3m+YhjFwZKQlp/U?=
 =?us-ascii?Q?hSBQGNvFPkbnFAs3yJlVW3hTVCbi9BTKuY08tOsW9ofkdQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CQxKHfeziYHN+OLDrKvURHTx8zyYQKbO6lMOHkmvrql8aRtw0/Q08xJmjOJt?=
 =?us-ascii?Q?XDSWws5LVGRzFGcd5sDxuFVpEplypIvjlBhdppLrwhcP0pewJQaklyTFBYjZ?=
 =?us-ascii?Q?kToJwZ2qGDMksBh3PmciLEMbGSlr5S0ROLO0uXFn2lW8sk0f1P2HyWyoL1EB?=
 =?us-ascii?Q?0gcohvVl9XKVujSRBwlNQ/KqIwed2h0EEsmHl8NiNhvZ8YgJ8LGtLKf7AQVD?=
 =?us-ascii?Q?8J89En94ggmEDazsju3HlG2KhxX9aYaw8kh9/OB7Y8Xp4jQUACU/Od9JZ026?=
 =?us-ascii?Q?Fv4ja2oYK0gl7MrqrAF1OSqLTTJvY4yxrVSCYSpYvvRTspff6d7AkOcdDitN?=
 =?us-ascii?Q?FiZiAjhEBCT4og96S+tV2tnL+F9FBhx2PGuvKM18U1RYk/UXspcVzpXUc7tN?=
 =?us-ascii?Q?8FxLJKJW2JyhkFtbptH955eexHwUnWGNpUlhq9x3ssmLIiWLbAVFXzABMpmr?=
 =?us-ascii?Q?2X6yUstvfjH5XvctXrTEd7H3NB31vPkL2YA9AQZHGKraG/4m2XWmya5abofr?=
 =?us-ascii?Q?11LhefoqdXd6lklCVF/Q2AbxlQ4impzBI/s+7wcDJunbB7HNol1fmUiuZ7ML?=
 =?us-ascii?Q?k1cwM7cY7TkpT9zIP0DNsrJgXUt51tCOpyU4DRplPvrFkfKBU2j4qZQz5JXe?=
 =?us-ascii?Q?ViRktDJ54gV0LN//Z1HArmNNx6C07QfLyX57HALnn3JhEFtJ7s2makp6D14J?=
 =?us-ascii?Q?Wc+yP/KbsBufqhDfK7ObCDuYmWRPrmjbOYq62VB45ZTb4RC4OcwBY80RNnHD?=
 =?us-ascii?Q?4jvC5RP0ScMRQAUCUhJH2+xhuOCaXyVh3jh6K9ml0hr2N/gGEMApl4c8qzwE?=
 =?us-ascii?Q?JQ7lumPQ8nAySG3WJsbg01bcbCvFIjNKBa5IPs8UALNGyHq7CASpQXbGrz7X?=
 =?us-ascii?Q?1iesUAKSxhkjoKtdIXakK+SCxtyyU1hlpe/Dxe4OBVB0aaIitw8gg0abovAS?=
 =?us-ascii?Q?wYlyImOEjAV/S1E4q7WyoRVykhYroIL9pOmet/WRAKRWrfc7pjbF63prEqIB?=
 =?us-ascii?Q?t1/Wi0cnF+BotidOgiAS/QSCLG61sSWbaxkz2ajQw7Xl5DkJYBqxeBzDWT38?=
 =?us-ascii?Q?1Ck5E5oKyzkRyFo0CC0++Rm1KmN69UNsyt5E4HKQRe6qJh8uYWQ63JL49zn3?=
 =?us-ascii?Q?sFxBbVvXaGl5yNHCB8WX7tCS+T40n6T5FBpP7WvWFLokNEMdtXIRKlVMdEpW?=
 =?us-ascii?Q?dbMHPnT95CcUSSocUunS243jOjt6fWCS7Ugkdyc2h4qgNkUesjP0cfnx8xZt?=
 =?us-ascii?Q?RjJOXZABUxLVC1OMnIDDh1AwvhmChPBTRFI98KgBcWckLGOdlepNHGA3YjFv?=
 =?us-ascii?Q?5oEHV5LYw44FZ1m1El59G0SSNq/dcWVcxP/FWSzUq21tF1sgnqeZltbdabID?=
 =?us-ascii?Q?zX/i1REpi37CnPLuq3EH18u3CB4AgsL5602QdrNi0upwYpbfOftQS95RrH/v?=
 =?us-ascii?Q?zg9UBC7T8dFStEgNVK1yHveHEeVfj4acCH0QiFpkYMsSZZERR00S1baLePXn?=
 =?us-ascii?Q?Hytwmz0hrb3NYw5E9alNZwKYsRXUwBGB730Yoz7vLq3w2Lg0hOVDwZOlOlUj?=
 =?us-ascii?Q?pEFJAXhbDFz3Dz2nGuZ5aFYO0WJKQ2J4f/eteyzT4+AxfojXAFbVj+HrrLzv?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33495435-7e13-4c46-e59b-08dcce8c1d22
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:53:56.3694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9DVfeVevHR9tGz/hT4AowGS5bVhybkAYxt4hWgFm7dUtOKjzvizzw+/HH/MW1Sd4uJc78WTwzlfZ/23lKkyJJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
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

On Fri, Sep 06, 2024 at 11:52:43AM +0200, Maarten Lankhorst wrote:
>
>
> Den 2024-09-05 kl. 19:34, skrev Jani Nikula:
> > On Thu, 05 Sep 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> >> Testcase:
> >> kexec --reuse-cmdline --initrd=initrd.img -f vmlinuz
> >>
> >> Because we don't shut down xe correctly, we cannot reload xe afterwards.
> >> Implement device shutdown by performing a FLR, then we can load the device
> >> cleanly again afterwards.
> >
> > Maybe a silly question, but what's FLR?
> Function level reset. It resets all the resources on the device, so display, all gt's etc are all turned off.
> It's far faster than resetting each component separately. And it even works if display is the cause off a panic
> since no locks are qrequired.

Just to avoid confusion, I like to call this one as driver-initiated-FLR.
It is a feature introduced back in gen11, I believe, where the driver can use
MMIO to request the reset of many IP blocks including GT, SGUnit, Display, etc.

But it is not the same as the full PCI Function Level Reset as some components
won't get reset nor have the memory wiped out.

The only way to get the PCI FLR is doing echo 1 to device/reset:
echo 1 /sys/class/drm/card1/device/reset

On my scripts when I want a full clean start I have something like this:

echo -n "0000:00:02.0" | sudo tee /sys/bus/pci/drivers/i915/unbind
echo -n 1 | sudo tee /sys/bus/pci/devices/0000\:00\:02.0/reset
echo -n "0000:00:02.0" | sudo tee /sys/bus/pci/drivers/i915/bind

Hopefully on Xe will be able to support the echo 1 > device/reset
without having to unbind and reprobe:

https://lore.kernel.org/intel-xe/20240422065756.294679-1-aravind.iddamsetty@linux.intel.com/

Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

>
> Cheers,
> ~Maarten
