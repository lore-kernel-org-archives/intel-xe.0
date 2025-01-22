Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B858C02182
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 10:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2670610E2FE;
	Wed, 22 Jan 2025 10:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMSCrgo6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332BA10E2FE
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737541469; x=1769077469;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=22zSMDwxMjXXRq4zajqTJjxZUG8MS4wQJazDUoG4uHc=;
 b=cMSCrgo6JCkrjJi0+otFvRoZQ7HzXCnBZG4SwBVZU5A6cq/CyvttxpRK
 +Dd5Izm8m0F82n51LK3mE89AlnDgCTygxJpngMsaqvII8VEM9ZakxWZ71
 hW6RBwP3zEiW7JdItwMltNyKIq6JgcVaPbiknfZIbWId+7yvVzS9upnVb
 QoWFAKSeD7r0l01uNZ97mjLuxYnUpDBF1gvCkqWNNSXG/18gtkYxmPoTE
 bb87FjsQVWM38xgRcqDuhrZ7iRrovZiNRHKmSnbRIlDMCcLXSKo6/O27D
 VekE+lKZi+MJlKMcfdO4vXiuWvJ9mUqNN5epAYJElJTA982jlv558i5UX Q==;
X-CSE-ConnectionGUID: 1LhG4uxEQM2Kq6IxENEkkQ==
X-CSE-MsgGUID: lZ0OI3QURye5GnvXJunqXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55404286"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="55404286"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 02:24:18 -0800
X-CSE-ConnectionGUID: dG655j5QQq+otIUP30rNZg==
X-CSE-MsgGUID: mVcR3sz6RF2yB1EwtQy0dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="107019531"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 02:24:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 02:24:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 02:24:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 02:24:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xC3ttZcpv9hfWjfFmuZZzyqu0zspfMs5tTQFSAl60Ya4/QyUsq+JXwDxhogPXLWZRx/2SdNVUlKz3d3lOYdwm3xHFkcsruOn8bwr3vE7rT4Jr6A8kMBpzHznulp46vNQvY5JEpKTp2bEDqgE4dosyv4RDxAtAPAj3Ds1pRtcqtbFBUEGQUytSI96N1sCMAiOGtlXs69LGiVVZM9DbIPHwcvIzxmqDAewCTn7npIOFB+pF0Ta6dD+hpe+vM/DB8ErRHwYjKMsVg1yt3WrXHibNCjOI+CdPgCcTjboir7e6+96t7JQ/ptoplvpYTui7sODuZEVQu+sKa81nMB44jwTpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps0+Ao2UEx3+zqo2MBF0hpHQDVMZPTDcDxRT280PwFo=;
 b=hEb48jBBjWoSKBTEMQqROm9B6l3/gcMymRVePe/BpBu7Q+5nYA7uXcm76CRBg52kWyJtqwZT4i/2vj/YG+L2baTd4KsDW3mTiAwygTIHDKLmILNDQ4ne/L8yabJXu8uS0oLz4jJz0pX/sd/imjjMs9fjrInIp7wfOTtmZZtEgq5YPm1zGpGNg0zPsIruxCPLowkB2TQBfuLcCOhrgcxZRkhlesizLKE6njmS846Z7KPOrDUtyJANGHfH+zZ8BoAEeHHJWfbXenWiBeP54P72Y5qXvhubzJrsFW1BLmuU+ybBWEEX/f+94xGpxPFbSF/gMhzxyISl62nceOzOc1vSbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 10:23:26 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 10:23:26 +0000
Date: Wed, 22 Jan 2025 05:23:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/oa: Fix locking for stream->pollin
Message-ID: <Z5DHG7-R3pRmSmvx@intel.com>
References: <20250122040204.3239397-1-ashutosh.dixit@intel.com>
 <20250122040204.3239397-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250122040204.3239397-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0275.namprd04.prod.outlook.com
 (2603:10b6:303:89::10) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ea232e7-6aab-4467-db1e-08dd3aceced1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iPP9InliYeYRs2YIrfcR102/6z8Ck9frZxydw79Y9bstNjZGEM3k1eLlTWFB?=
 =?us-ascii?Q?yGURSJ2n/VvSw39pb+PYiczoVdGriEdOimpvUql0P+U5x8vNNCi0nGenptRs?=
 =?us-ascii?Q?5+y5fjrWyhVL1qNs198uy7Fu5QZIY5b5MsCXxrGn3cih3ByEDdEvw/I7xvpw?=
 =?us-ascii?Q?7Y5QLXYdLMcMbG+f/t7tSen2J1ucq8Tvfd4HHphaA0hlKA6QzLxrcKAOPlfW?=
 =?us-ascii?Q?Iaxt4dWTQ0B+BGiCANhTBwHRH/+sGOEhlXjwVaOePyQBuVuoLWbVvwAZMaaQ?=
 =?us-ascii?Q?b1JpDTpquZO1ExrakvpgMKSmtQRkQDLmO1/tq+vEd/bOyAnTS07tgc02J7ck?=
 =?us-ascii?Q?97D3H8wLIJRpG+sZXHORGAtiI5veKR8j1AAAUQxpTKW/OkjqJ+mh9X6bwl7R?=
 =?us-ascii?Q?GveD1zlTF7pT3McS3q5EbtXUL+kuvNOiWb4mnYJbllH+EchQzl2tfh9Z3O8Z?=
 =?us-ascii?Q?YOS7uzgewEhr9wriHRirxAd/Elbj18BeKmXNeJ5ntiWUZ8nEimHPclIT/4TU?=
 =?us-ascii?Q?UPb+rEewzrCkGQ7RcJZ+bbKCrPuZBDaaJ/1p26USQA4ChnAzI2ykUweDGilL?=
 =?us-ascii?Q?PlrOtbK6lN/iP44M5qV3I08MsJzOxX4UuduS/cT1Zjb0XnKFv/SPNtxBjMX7?=
 =?us-ascii?Q?mpsvgU1qHxXSkC/CFmDcflntJFGrsfvuFs2VseeFKXFrq8rw4JDqqhnpgHQJ?=
 =?us-ascii?Q?feEGBRdXVb3Ztlu7meoOVp0uKfzKilhvXUCkr4lnBPvyUdCIpiLVDF19ZS9T?=
 =?us-ascii?Q?hnKl8VPreGGw3UAvat3tnMH3UrcUsyF5cVwsWTsXWzArLVQEB7rfVrCZ0cOc?=
 =?us-ascii?Q?mdsk5uFEoC5aqDbptdh/O2Euz6/ZmdkfaJ5rNoL70IeQqnej+fCCzzeboaBi?=
 =?us-ascii?Q?6FZtLI6x+yBzc5RhytOwT7ej6HSOgCUSpgsIBYLmsgpFxfwoRSyV8WPBBSll?=
 =?us-ascii?Q?YyZKXewFdrXdnN6rixhIjKvRkMzDWc++3EO7Ubj+9EBMenuiVu0ZJbCxdRMw?=
 =?us-ascii?Q?8iX5jUWsbdjqJrxTZvu1dZY2jbEEzOMgwXV6IDXJr9Inw8PR6GRNferarI0r?=
 =?us-ascii?Q?m05TMTOIP75aZJLe2VHhHwpZDyfN8+IUznSySqYar9MXNhA/4EX94DfblKWk?=
 =?us-ascii?Q?ie19MwHTiAIbyxx7+FPnYF6XZDt1PqDrH+kPqHibJvBMEqrpW83Qc/Y3YhhU?=
 =?us-ascii?Q?IeTcwDl/xVeH5HHAtRcI0F8JfIAC0dCsC4rZtHKlE7ETnnrbQNY/mmUuVcaJ?=
 =?us-ascii?Q?FpWXjWWMomXMWFSg1uFkHcmFmC1A4KKvdfLqM8shdTJ2TVsQLsEETtFhzkgB?=
 =?us-ascii?Q?MCFovd710uQiMjfvF4tG+So5BikPBBAUzIDsWQLzqgywHGm2C4+Gy9iS/k90?=
 =?us-ascii?Q?VoskQ7p70PbRCIupTjCeqmg09EMk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N8j0k5O8S/TQ/v8DKNf3aLrn0ZORATIqYahgTQvsh8LcrAFaXknQN6zTF4Lz?=
 =?us-ascii?Q?BHwFDUHAKZ0kZW1xrwn5nI/4D+G/oaEeeX/bvWRLSR+DYwpyVexGZQ4r/iW6?=
 =?us-ascii?Q?MBm5INQGwtLh6uDD9BYc4I25V4N2gX49UDSZRulcSPcljy9bdPXhsPvyU+Yo?=
 =?us-ascii?Q?N4w85FVbNe2Xmp8TPR58TUdBOVhZbTR1WiQIS//5DE4TwmXskeo0HchgdbUa?=
 =?us-ascii?Q?zrLrm5tjYcV3zE5hUZLY0NomkGzePnw79CHK7yFNnACyIlaFx7XTu9IJytPo?=
 =?us-ascii?Q?G2Z19qhkv6ZAOiPJ9uQn29wK+rR5uObOstY/GsMwqh0PqdfVCm0GxBQFY0tO?=
 =?us-ascii?Q?d/6YH398u+ru8HT5aPBQ2BdEuP4Sn1rA+sFOgpowJtbBApvOWXHzFszXkRtO?=
 =?us-ascii?Q?orj7bVgPSoyWUJbeU9YorYEXFIEC3L+H1hnYQvCwsuz8eaP8YRqrYGLRPbX9?=
 =?us-ascii?Q?tgGjaK44/z45FH4w/sRi3h7dGweUUEqnL/X6NmReQSEYWKoT4fpfuQ7hC7Le?=
 =?us-ascii?Q?c2CIuganyPBjw5fTYYXs1OTS3DAzP1LkEkHbxpaKvwsN9CA7SGvhuv4PMMgV?=
 =?us-ascii?Q?pAizTnBOgcmc+0n2d4zeK5WXZojmvFogIH8YoyreYjyP3Sn75v5zBu3CnsCs?=
 =?us-ascii?Q?c1t+rv4fpFSAYVFtoLrdhgA+n0vGZYyatfvhGBRgr/5xS0mRZxKwJ/7iargx?=
 =?us-ascii?Q?KLKymvywyDQWyeGulwuEBk8STunqZlNz2M0szK9kaLxc1kmffu0JFI/ET9SS?=
 =?us-ascii?Q?Y7Ezi8kn0dlp1lRl5tz0xtZ1ewC7RAd9zlPMnqtqqdW2IvsEuutpt3qqkMiU?=
 =?us-ascii?Q?pEQMGA5V8yqqKKUGm8hC64+3U3irAj/qwQa+j3MGDSvPOTlOXtKr4wypKTX9?=
 =?us-ascii?Q?VWcdU3hxShMBq+aZcV65LqjfwpRxN2SoJt4aof/pxMiA4Vnv4Fr4mW/6UsWw?=
 =?us-ascii?Q?ayM8mWPDfiskVvghMyW/eHn9sAdMm8XkKCUFUmX2Ti+FLLoO6zyy4M+HO6ia?=
 =?us-ascii?Q?jns+NKMyu8PWYdHG1VnN7xP+0/fXOSqnm1pA9WBxrHK487qCo9pg7RASR2DQ?=
 =?us-ascii?Q?RaN2zQrfv4QzIm7WiPVKPj2yXo2CAFnLiOn6i+DI3NBMq/WbIpaUa7FhmE5F?=
 =?us-ascii?Q?yVx5D4C9cDptvVoGnTULnfDjox+xvRito2jBrgOE03w/UfhdDZzYBBs893/N?=
 =?us-ascii?Q?tRMSDTnTnnrGE2Wgt/pLT5tqk2Nqtw2/M6olJwmq/pdEP0PekkBXV1zFW4+F?=
 =?us-ascii?Q?pAJRyssFrjeo4jWDiApMk3jRcbPcDbkpaazVNUdqUEmSD7hBa6wjuZ/XlzxY?=
 =?us-ascii?Q?N+L6s08KE0yrT5LtGjvIPE86zX9sZd56qoeciS587DL1+Num8PybU+JjeCSO?=
 =?us-ascii?Q?scUjXJj08VTuKtOLvMCWffNf3KSfE0LQikgUjDV8QLZ7X9HptsUgDJcPG9x2?=
 =?us-ascii?Q?0M5CvVKnRUvmbia+EbWDr+doKHn0i1euYBB8WWm8gKfoZwRt9lSOB2vA/umB?=
 =?us-ascii?Q?f7TTvfGjaFVAQK+kd79SYTc7My233cG6KK83bthCDpr7W/c6YBs/2YeRBip5?=
 =?us-ascii?Q?bdLkeS/dekmQWHOMAc0LSyE9jk2R4kVwY98L82uz8efVhd1fSANQsv9o30pC?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea232e7-6aab-4467-db1e-08dd3aceced1
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 10:23:26.5771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhxVfL+Lb/lI/LNzxvwekZekU+0MZQUgo9+kpLXiinwGGv4GW6akcRDySmod4odcnMmBNgA2A50ga9gPn5gufA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
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

On Tue, Jan 21, 2025 at 08:02:04PM -0800, Ashutosh Dixit wrote:
> Previously locking was skipped for stream->pollin. This "mostly" worked
> because pollin is u32/bool, even when stream->pollin is accessed
> concurrently in multiple threads. However, with stream->pollin moving under
> stream->oa_buffer.ptr_lock in this series, implement the correct way to
> access stream->pollin, which is to access it under
> stream->oa_buffer.ptr_lock.
> 
> v2: Update commit message to explain the "why" of this change (Rodrigo)
>     Document the change in scope for stream->oa_buffer.ptr_lock (Rodrigo)

First of all thanks for the rework.
But I believe I didn't have enough coffee today yet, because
I'm still failing to understand why...

Breaking your explanation to see if I can understand:
'mostly' - Why mostly? Did we face bugs?

'worked because pollin is u32/bool' - this sounds like 'works by luck'

'with stream->pollin moving under stream->oa_buffer.ptr_lock' - Why?

I believe this is the main why that I had yesterday and that continues
today. Why are we using the oa_buffer pointer lock to also protect
the a stream variable?

Why don't you use the stream_lock? Or why don't you create a dedicated
polling_lock?

I'm sorry for not been clear yesterday, wasting your time and 1 cycle...

> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 6 ++++++
>  drivers/gpu/drm/xe/xe_oa_types.h | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index fa873f3d0a9d1..9de62ce4b9e42 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -530,6 +530,7 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
>  			  size_t count, loff_t *ppos)
>  {
>  	struct xe_oa_stream *stream = file->private_data;
> +	unsigned long flags;
>  	size_t offset = 0;
>  	int ret;
>  
> @@ -562,8 +563,10 @@ static ssize_t xe_oa_read(struct file *file, char __user *buf,
>  	 * Also in case of -EIO, we have already waited for data before returning
>  	 * -EIO, so need to wait again
>  	 */
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>  	if (ret != -ENOSPC && ret != -EIO)
>  		stream->pollin = false;
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>  
>  	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, -EINVAL, ... */
>  	return offset ?: (ret ?: -EAGAIN);
> @@ -573,6 +576,7 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
>  				  struct file *file, poll_table *wait)
>  {
>  	__poll_t events = 0;
> +	unsigned long flags;
>  
>  	poll_wait(file, &stream->poll_wq, wait);
>  
> @@ -582,8 +586,10 @@ static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
>  	 * in use. We rely on hrtimer xe_oa_poll_check_timer_cb to notify us when there
>  	 * are samples to read
>  	 */
> +	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>  	if (stream->pollin)
>  		events |= EPOLLIN;
> +	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>  
>  	return events;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 52e33c37d5ee8..5c4ea13f646fc 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -159,7 +159,7 @@ struct xe_oa_buffer {
>  	/** @vaddr: mapped vaddr of the OA buffer */
>  	u8 *vaddr;
>  
> -	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers */
> +	/** @ptr_lock: Lock protecting reads/writes to head/tail pointers and stream->pollin */
>  	spinlock_t ptr_lock;
>  
>  	/** @head: Cached head to read from */
> -- 
> 2.47.1
> 
