Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140E5C982C4
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 15:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C3C10E3EE;
	Wed, 16 Sep 2026 15:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F3HUYaGF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3506D88FAE
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 15:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789571448; x=1821107448;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pSjL0augwxKddvYZvwizP5MMkkL+KVpc0+yC0nKBxe0=;
 b=F3HUYaGFJPoni3gYMTgA+GedX+C5gWucGB9o0plBom3RkMREKhxVk27v
 Tq5BM7xGHMJcQ2LLNE764JygK/tkQbyJjTWVlvYvGe798RNjVlMz1n7G3
 32frvCR7KEnKeC6lh6plU2ag/wfK6tJUH789sXwqY6ZXyNRbi4Qj0Ghoq
 LH7y5KYRLcCcl/qEsBHfVMPPgXavJF1oJbALwOZSDXT3kXdI2GDFnCxkL
 5MFHggsygB31d1CepWDsfylWj4qkn0g/t53XzbH9xgZwxU/EzTDXCpQlH
 vPdkot4v0gdVL+6h2WmFUjUbQm0a2rHpuBew8Gg4Y42CsyvDv4vth+hWL w==;
X-CSE-ConnectionGUID: suXNvgcmTiWwFRKDGlI++w==
X-CSE-MsgGUID: GKgGPT27RAik0zzD6I5zfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93821552"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="93821552"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:10:48 -0700
X-CSE-ConnectionGUID: G9hD5vS8RWexkL2EFZUrSA==
X-CSE-MsgGUID: lYZd/o86Rkm/vAQV1bt8JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278597035"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:10:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:10:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 08:10:47 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.36)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9sjYBOMYUlK2+oBRbayXo6GJx6Swyp6nQAi7uvI9ibWHpwTdqGkVe/epeDEGDqM0NfbD7n2qt7icirF8fSjcSH15x0ukS2zWdAgBucck+irjp2/TFwraLCYftacqcAkslogc1icBID9c18vV+t+yLjl4uXRnco0Gmie32NaDpOLmHkWW4nurCc6anrnkGjZYLgLR3eDzg6hcUzF5yck0UWQ2abjCjXVHbuyEPdqjF14WNqA6UNPX4wAdhR33sR8YkKr+q5ojmWqyRrbExubVu8tR5vcawLZuej6qmK9BxMAWy1ZHT1wZwtCdm7GsfnDKLPOEOdz6SBl6lh2DOhHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiBanBQkYxomv+xl+37CAuTMmkNtAGwyeim/v5nxN10=;
 b=Q0nZMJMt9zboq8oXBStQr8Ey17jfeSTABAL57b9YxkgVqqvuiC3EFgT6QIhXqbE4AzUUjcna1HiC7rmf2IX7gdPUI9X+OpPN4mxrm211fn7cX7LbwlV27ClbVI/t2K996z5CxMrfnlmBC95pjcyM1BV7mQbfdu5VBdh0ylqooEJ2OMCqCFcafxTPr/T7tN6XWCPKyXsTY6+XBMutUuI01D8+RIWTq9iE58yJXcP1qQI5FfWkFET2M1VHiiyTILmVzZ7PX+I7Cg0qAsRwkl4pZp1n7LmyG+3AAGmELFDMz/wEjy/YCWHxseT3Akgej+bGTldwvH2AQWXHdjMlfAwlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS0PR11MB6374.namprd11.prod.outlook.com (2603:10b6:8:ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.9; Wed, 16 Sep 2026 15:10:37 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:10:37 +0000
Date: Wed, 16 Sep 2026 11:10:33 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <julia.filipchuk@intel.com>,
 <matthew.brost@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v9 1/2] drm/xe: Remove extra newlines from LRC snapshot
 dump
Message-ID: <aqqxaYPw0O91VFAx@intel.com>
References: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
 <20260915174840.531473-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260915174840.531473-5-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ2P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::7) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS0PR11MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: bb52e1ef-b26a-424f-0ea0-08df1404a98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: X2UYI2xetEQEl1CrJK5vLKPBs5JcV1E0NGIlCdVvLPr/dvOlTS0NaxoCp8ifv2W3ZqpJbS3o9SI3xLg6PpIg02z1kG9mp9xVjnkwIYMosSUVdhiLMU0rfx4MuujPUEa7zlWHCf4C0TCY2g0P2zBUkuuyYbHCMtgYr5n9vcLUPJX2wLIqutmowTph7SpXUPSZCMLdjdmVxVpnsrUe5/zivvpmwUtQjIcJNFAzN9TQeeU8NewtCt2tt176RPM6mpAgpOMv3LRRbc7kUcW7+bVSbGs0fX4m2X9ALfXdY2jwZWH9hGFFfnEE5s64GsdS/qLhWuel702qNmEPM798mmGRyzQrAuMKbmFbcJdKeFnj7XVze0gYXzQ7FD9Gy+YLQGsUbojW1leR18kwZ9ElYd8PIktM8jv0VOKK35yCXtBPkcCtGYfDtrBo1tDJA+kqUl3Zf+eYyurebhb4ofPVUCklPx6PanubnGTqU/TQuoASS8fSI5yvmR+WxeEnsmQDNFfZo9GISKPYyW68jQTEhAHFLZoWakzBJhjueIZtqmjYFxIjQtIPVw1jVWe1W1MoV5tv/0G8ZE0woG+y1s/EulSeiAOGXJfeDaFcN825FDbrC6D6/ICVZfX+HpvOkCmSw0NPXe7+HOOUExGNkScj/LGUFZX2kR4sFRBE/GorkceaiZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DqXyvzc5TIaWbUhHvxjvI7Gxvum2+GgfPP7zZMjPV2WU7C+dFFX1t7//PgxX?=
 =?us-ascii?Q?SWbEyprF/0sIAS8jAWO3y+ufrfLi575XvwzuzlhsiQDmtfr/FcSpl3hyU5Q9?=
 =?us-ascii?Q?5SjZMFF0ZN5S6fY7lpaowwCrXIqCZjV6Y64lVatK3/1u3ZkF/lxccC5v3ELy?=
 =?us-ascii?Q?JGg8RAhysS6L4A4aL7rH6dHPqB7twFe93JXcgZaqIe5e/0+Q1juwheReoZio?=
 =?us-ascii?Q?5EXG1bqDJOXeCC7GnsUG3xs+3iR7pSYkovu+hAkLJBfMsaBNlrikIb5mH996?=
 =?us-ascii?Q?g7RvNAqnxqw6Q/VvsST4+5g3oEyY5dpKR+MkIx/wH/zluvOKyyVVUN67OVhx?=
 =?us-ascii?Q?EindEY8XJy9g7nJgav5rv1kLZidzdk07qFlMoP+73TPEEy9wGDaLtaFWLsMT?=
 =?us-ascii?Q?QQyww4Sxb1xzIKpb1XBttOch56XWe0QbLo/PpBi6MfEUZFhj8aq1CPj4GOwB?=
 =?us-ascii?Q?VShyNHgdjSkEE7TJQmDgqf1dM+3mlZMLoqLu+V3Pm63g8dtniCSERphVKfid?=
 =?us-ascii?Q?bBHIPOqJd+By4rL4cVjvFVJCEygph3p0sTKZKxg+l5sCmFwARLprHfc/ZMjm?=
 =?us-ascii?Q?Lfhq00RHDbnBVddYQPQM0pUgNYJFRUW00RuQWWEgvcx6P4/7yLsf/MHJEXBs?=
 =?us-ascii?Q?3x1c8zGdkkbkAkkiisaLxiHBT8RMQYO2MJ4QltXyW5ReaWKz3iohHvTSkFMe?=
 =?us-ascii?Q?j/tHnRSuZ0ojuO/O+L27gdDW0DgToNK9dc+DHDDaiw7NGEUgTR2qFE38/YsW?=
 =?us-ascii?Q?R1ag2E2L/LvpGKvv8htSLMQtD78N/Tzf1plGIPiUqltZsKl6mAWlyJtJVzsR?=
 =?us-ascii?Q?WpRleNxrj8NBpMUhMJB7/j/jW8EGSLks1DvMPHYUt5XB1I+A2h6f4pla67vE?=
 =?us-ascii?Q?igrAZn27POWMU31nlJ1b/QcbZLGZs2zccQNFKDbX88dRpyThopf0B8XPc+uC?=
 =?us-ascii?Q?yPzUHHrev1ihC3N8UStsodDopZnnoMqNSD2RHxuBuly3Gh1uIa7NBocx5X5E?=
 =?us-ascii?Q?PQfyPwjTR+WmhO53W8pBp5vHZzhXV/yJQTJNFznwqaBX4LFbg/SbT+2HB9Lw?=
 =?us-ascii?Q?4Uad1sY1XKaigpZpE67aVlLO9mfyrYaOYkF9VOBUjZyHiS//AG+R5DGxdqjP?=
 =?us-ascii?Q?5NXzYgzJqTm6DKuMyp9C2ND3DBFnqR8zBJPUJxYotOuJO/eAY9ehDdrEbdoA?=
 =?us-ascii?Q?69Gzt5hs9gPMWtH7NFlybp+lw7HXywxAOFhlGX14FbzKmpI66HXcQw19ZjaI?=
 =?us-ascii?Q?TntXhEq2n0+jeZxS68BO97UguAi2077j/mVQb/mxSBrdZX5Nb53JQu0s8Omt?=
 =?us-ascii?Q?wcv+eRTmmg6RFFyWK6tGhlcdyzYp1p71kjrp4d6wwML5LqX5iUy9F3cc18ZK?=
 =?us-ascii?Q?J9e3nnalzp8+yiNNMtr7tjD1EXucpV8gvZLcZF1WgB370pGwp0SM8rfqk6F8?=
 =?us-ascii?Q?KDGkN4559B64VQO/veZyg0cjF1QzIZH6N7W7fY/2THeG+HidAri4LmeUFgbA?=
 =?us-ascii?Q?37xC7+QxK0iCdy62NvIvqqujpFcSavoHFY30+ykv3NH4zE6kGjM6eDYcv7XJ?=
 =?us-ascii?Q?DZbgMNoMi89DTj90M8zC3BmmXR2Yo81qqLeNcIPSNwdy/ZjBlIBQch9xyiBi?=
 =?us-ascii?Q?cgb269uZTBYQ7ayq5UUPRMc5fPgNiG1WSD5L3aXX7IH0hy0y4hEZdvZ9gn91?=
 =?us-ascii?Q?XigEp2oNCerIdz59jy9CkrU4+CTsmNI0oV7qTxvw5unox1ZSPpq3PSG7JsMV?=
 =?us-ascii?Q?1KUXwgzoRg=3D=3D?=
X-Exchange-RoutingPolicyChecked: y/5vJyVxKygObb9f3YWVNpiv6RK0dknsJ7ZdjBOIFD85g6BrY5xeyspQ4SCoxO2AGWSV6McepQDlfmAV1g+5MiAkJVIW7IHb5QxxqAsjxeSZssnS7I0CL2azELP0IYDmnHAIO9Qxw/9QA2isyqpBNJL3nUp5cRO8FAQiUmC+wdlJDJiZzm/K8ztUdmcTKio+AO87Sw/u36ii/mwBvvibTCjFjE5pAfXo17/tUaKU8Y5eyclzJa7kGmyxsiRF5vTX7wFL/pc75uM+n0WvRI+X+x2IQP0EKZWV13oKkKeN6x2SGRXoAS+sHRYHb15nNnxkIRVFFd+pD0mE9Gtql7DSDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb52e1ef-b26a-424f-0ea0-08df1404a98e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:10:37.0125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VczOIEDtBS0wTtYnrq6kbu9/LuuUnk3EbR0vvvIliMiEE0MIKaE/l0Qr7sDQFsh8b7vB+xRVnct6YmGtLCYkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6374
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

On Tue, Sep 15, 2026 at 10:48:39AM -0700, Alan Previn wrote:
> From: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> The LRC snapshot printer adds an extra newline before the replay
> offset and replay length lines. This leaves blank lines in the
> HWCTX section of the dump.
> 
> Remove the stray newlines so the snapshot output remains compact
> and consistently formatted.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

Again, you need to sign-off any patch that you are handling...
in any kind of touch.
If you are sending to a mailing list or git committing to a branch you need
to sign it off.

> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index f1cf1463f1b2..a99c7e044c4a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -2633,8 +2633,8 @@ void xe_lrc_snapshot_print(struct xe_lrc_snapshot *snapshot, struct drm_printer
>  	}
>  
>  	drm_printf(p, "\n\t[HWCTX].length: 0x%lx\n", snapshot->lrc_size - LRC_PPHWSP_SIZE);
> -	drm_printf(p, "\n\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
> -	drm_printf(p, "\n\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
> +	drm_printf(p, "\t[HWCTX].replay_offset: 0x%lx\n", snapshot->replay_offset);
> +	drm_printf(p, "\t[HWCTX].replay_length: 0x%lx\n", snapshot->replay_size);
>  
>  	drm_puts(p, "\t[HWCTX].data: ");
>  	for (; i < snapshot->lrc_size; i += sizeof(u32)) {
> -- 
> 2.43.0
> 
