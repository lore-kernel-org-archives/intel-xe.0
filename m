Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BC8D1A427
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 02:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB4B10E03B;
	Sat, 12 Oct 2024 02:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBH8PtuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3FA10E03B
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 02:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728701737; x=1760237737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gY+4vpwWHQU3XFQ5raJVIz3SZ4gpFwFpQxfG3iAKd6w=;
 b=XBH8PtuPG+Kq056LEN+3rD0mroe7SHigtdgooe2VYKdZtKxSGIZ4VjDT
 TvjLAVt2uPoqA0f66PIariaboSvzBo768Jgdojjl/i8jFBqHIkbnLJKLz
 RReN7AcP0J2Ox33TfLXnGcce0gGaphwv/a8AWydvl2YF8zdotXl1scTY3
 EEstErg4PQrBCWcZksf+k2jjgzpNamD9o4XN+3s80kJjnO7lE1R9DibL9
 wEDL0EN+XwzFRNUflPfzTJCKR1+oGI82JgbMH5Ow+A2XaJSYyZjBTDy8v
 GhXpGNo7ugmxG9oWJYG/jiLSB9agBOEKB2dWFl6Zhrz+/Neotd95GKeHL w==;
X-CSE-ConnectionGUID: +bioaPyfSDKkU0WWchCWsg==
X-CSE-MsgGUID: zBeGETyfSmuLqeWyS+0mzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28065362"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="28065362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 19:55:37 -0700
X-CSE-ConnectionGUID: 0VzGXWxQROm4ZvGxYdGiNA==
X-CSE-MsgGUID: /kswoqJrSJiinyFLnUnGKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="82078647"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 19:55:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:55:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:55:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 19:55:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 19:55:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPnstqGTqBWfyFL2QACbeARG6MbgM/J4GWQygVLfuDJGjPTkEyFrxoyCmCAG6HQIoC3ODTj5uurvCO4wnM0zN9aYv5DBY87vjEHcKfdi2khYLrVTDD81MZnhUZ6jr787CmjKP6JA67kxNGw3/5FuxPlD13HivXui+nhFfUPLIQpc/lXNgDC6jm13imejVFxTlatqwf9SddBcrC2jUoyd9dYllIGgRzGlmumTOAL0INl+L9uct8f1suzcxaECUMobFLEjnufuudai7+1sDq2h/t38OIihpKdwMn5r7BYtNjyeJ8W/a+oCVtcutCS/pNOEoNxtiCMYvPJLpPHQDO9yeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsUwih+OWFWsj1Ec8NJj83JrNljiwMd8xldeUrn6XB4=;
 b=VZJmiqH7DNEV1DorWbDEzcR5D0T05kqtcuY2exYC60PZU5yrRpxLuSoN1KBKvdImZd++JjtSpogyYKxIeCM7Egv/39CcxfNuAJYTOgxucth1wDgg+q9j+sicfBTknw00rogwLi+lmbJG9eSuk4V9b85BCWSAm+76fLYjxMXPp6Zc2dYwG1vY4sCAgtd7PbXcl79YE/D4htb7VhiCNJ577EcaQnfKxkDCX4Ubc+DB5Lkp/qPCeRIkjL/3XqCDyTNmgHsr1DvIw6K0PNIIpDVPGSbsRTDeqI4+Swgt3qJZ8v5xFn8Zpe+/tdVGLrn9olM2sqOTEUMDt1ZQZeV/JfE1TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 02:55:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 02:55:33 +0000
Date: Sat, 12 Oct 2024 02:55:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
Message-ID: <ZwnlDfr3fZqma3x0@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
 <Zwnha/P1zWiIrNcf@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zwnha/P1zWiIrNcf@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: 571a50d9-6c1d-4e7c-2aec-08dcea695745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hwMpDWrpmZtbW0zKZ3WsPEvOim1rILtQHyjR48cl4oNZX5LMre9VpeULxpmb?=
 =?us-ascii?Q?hKyESqdv5W3o1I7R9dZQLHJXiUjIKmhakMuDidkDqHyPuxvxpDhsd5rJ1pZ1?=
 =?us-ascii?Q?185JC0emH5cttkr6Phvyt/DgJR8wuX+k/scXZI1hwimxq1aL/L5pwyp6m7N3?=
 =?us-ascii?Q?HEIM3HYohn/9zJjauH8k+Sv4/PAuR8LENvDyIXFLIPgCUGYPNRE2ecGgBmp3?=
 =?us-ascii?Q?bKxLDANungxdMHDWb+UDoV91H3WBfpxjMsP9ALSoCeNmfLtpMV9+9B4OlzfW?=
 =?us-ascii?Q?a14FxmgFupIH+7wFXDom+ChyadEdIcM6i1PGGoQ3vX4HiHRMOz9eFVOvGM1W?=
 =?us-ascii?Q?1tfEj1fwtVYgoXNduKgBZdobdguYn0YBWou4aZp9xkeXP56SKjXWZJNytbAv?=
 =?us-ascii?Q?H8wyIYpYjAFgaiFjSTe7cgxFzEDeEEFTHRayGUo8eRV457USJ17HSwnz14HO?=
 =?us-ascii?Q?3h8KaFhlQgYWpVlOPneVJOp08jVu0TGAmGTHY+W6/AfEa7JaEOkTXGjugmmG?=
 =?us-ascii?Q?YSC4Uls+4AtOM0Pq9UQnf4QPb34MFNG//9gwltwFo/apphh/OZjCM+JfDTkA?=
 =?us-ascii?Q?LkMZOfjCxpNdHNf02Pbo1cj0a0LSrz4Fjqff5m2iAj4/wFc3zMf/KVoDdyAn?=
 =?us-ascii?Q?DYhQLPHRejsb8lHEs1XYVoTANsTHS/gYN5cTvBUJ7O12jGFejMlXzYAJ0jPQ?=
 =?us-ascii?Q?F39AJV+oISdZgdxb7/waNhBZh8KHAh6n0w64NZAV0IJSamvhb3CKkX/fTOeI?=
 =?us-ascii?Q?KkGoXeuFDSMI0GagnbPlfUGCheqHh29O5JsFUs4AzrfyN8zffoFFBsTclUKp?=
 =?us-ascii?Q?dIeJ+BLvhL6MlyywwMPm7OpYylcFTXMnhCfSUtzdVveRSYkys72u0AqdvGor?=
 =?us-ascii?Q?bC4myOsgGvonNSZbWngCtPa3bf5rM1C1vZ7kwQ93y0lU0ZKA3SGqKRyecnzj?=
 =?us-ascii?Q?lIBNqjL1MXtqqduoai1k7Nm9bckfFwwLpcgDYh0RaSzOMqhb3QCWZ6L3fUBx?=
 =?us-ascii?Q?mN9A95gbJ89HtFj3+4IbzulEPKB4jod1k06HiiRSSoIiYLjfyOGUL+UL1w/Y?=
 =?us-ascii?Q?S/fyYYdCkuWzOzVwpECzttcrff92zno2fsI5th5ssiIwHvlKGsi5d5DEMwv7?=
 =?us-ascii?Q?TrPcWS8Mqwiz68WUA4riKbX8umBui8BrncRrgJf//TF2/P5l7WNB3RoMNWrS?=
 =?us-ascii?Q?BHRwrnUOhZhT25BtFskCbrA1E7HnTKY6XeZd8biUXf8YtRDFR8Lb4FhBJUg?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gt/1GrSu4IS3jSpJXc+e2trgdGBmIqEl/vT0QU8ui3hhEueB8PO1xWMUm/ql?=
 =?us-ascii?Q?aXoS9NpE1FUo/adL8P3UO4mfpGghtIwI4N9JO4CxeZjDqoanNF8JI4kq3D61?=
 =?us-ascii?Q?WNUjo1X+hPyic/AUhqJtB7Vs5XpDrzvNdl0nAaazHrHrRGUneztAOKFYKYiK?=
 =?us-ascii?Q?c9OPG42rWaV8gfK/e8Hm9F3L3lfHNd80PSJpHK3RMJe5yDNjyx4tE9+AwMhk?=
 =?us-ascii?Q?cfZRX/TYJqJcnZZEFpsRN3LEzXmwpS4D0S6HkwacQIzRDJic4mu5+FSq9Q0E?=
 =?us-ascii?Q?I95wmP+H3EBKa4swTiXvs5NdAFYqpdiQEbUgZh7EphHky6PwJBgWBOOo8cDK?=
 =?us-ascii?Q?KOO7+k9ZTmcL6GL4rfcr9K2XXIdqYqeO/JJVpVoLdQtOuPZ/WAnWO01iSAZ4?=
 =?us-ascii?Q?HDVb+j7fNyGfOlHEmJ6vpJZ01xfjk7lT7X/fUQB6RYIWdCiyUl+7Zp6c7Oax?=
 =?us-ascii?Q?qA2Uw6mx2DkrV8/KvVhfBYFj/LmkJl1YHTv9OxR71BCUrEC784vre0E+pXlL?=
 =?us-ascii?Q?sMKu5BpFpf2wjS/fLzAUSCgzyPv6r73WZgUkeKB+j4I+bvI2nAj+zcRL2yEB?=
 =?us-ascii?Q?b1rmRNxeNGYX55hTzzH7n3RvZMrE/qv4+6Nt5iL/heyDyDdooDOn/6AXoc28?=
 =?us-ascii?Q?RgMYa/2RI9TCWw83sQG0WpS2Mmmav/YEEvGHnhxdr3A2uDN9tg53hUPu2rVO?=
 =?us-ascii?Q?pT/dinCsqmMxoCMhEfszT0APi1Sw/W06jtXhknEaj2MqI4E3nYnrOXxoLVPY?=
 =?us-ascii?Q?QQ/l8apZiCWI/V3niUwMZ0rTqiA7htOWIgESHTy0NkxOCjUz2J8hnrIcmwdp?=
 =?us-ascii?Q?kuQI32OQG0bWfJlWiiOSoYsemE6LvUnFxXGRJnYbcrWVRV+ZqSW0Dxbkd4Hd?=
 =?us-ascii?Q?viXgW+cn/aFmStbL1ThQSpyRXe/IEXDRnmHxMoqBsHXXsrR6sJZuTwFm0MCe?=
 =?us-ascii?Q?1v5tCqPScl7y5uEPls0hfBK9jom2DKCFYKXYBgQwlsnnrqf5EMzRNhhgKj2X?=
 =?us-ascii?Q?I920lZyeNSO/4AcLiLd79UxHWc9zzASovXjhIRMIXcyp/1BJ/g9I9Jm8w/cE?=
 =?us-ascii?Q?WRGyQwWA3vFRJ3b7fvyGooflWrClorvQFH0RxcwoCNHRCBKhC+RiuWqwoKhk?=
 =?us-ascii?Q?aj2Uz2MEM5aIwDWmN4Wlm58QpGBUUYKrprMEKnMogKWgL3VgZPvUunk4dJFB?=
 =?us-ascii?Q?Sm7caFNKqvytv9UNO5Pca29Y3C1adzFiPG2Mk3IGrET02ilcIk1fHD9wJr6r?=
 =?us-ascii?Q?CXhUgNmtgFDmcGaWkwBIRJpZ8S7zlA3NNyf0qBdpdujAx7h+Kpk912fcI74M?=
 =?us-ascii?Q?4WZhSfDSpdkoBnvjFxmbbdyzz4OxmDAyv9kREyoiBwAIxT0M8TMONOxZAoHB?=
 =?us-ascii?Q?93CECf16ljmWB1nq94RL/eKlVn0wfCjo0Ur+71hMf1d98ZhtQ+afWc20GIu8?=
 =?us-ascii?Q?UhgS55GdYdVX0CToQfRvbdEyZgvujpxzYMtqTmplcu5qLIcwmNpTM8zS2RHa?=
 =?us-ascii?Q?2tzVYEzBtYDJf+dQLCwRNwOGMBFFMx99jOLk62OH5GxtoQ2Eyi96LAbxL239?=
 =?us-ascii?Q?7ho0y3p+9MXVTgT52BU5DEJ+lzMyOXFSr4nF0a245zhJMZUFteLOZEAhz0c/?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 571a50d9-6c1d-4e7c-2aec-08dcea695745
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 02:55:33.7778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFRFDyzGMBVlg6UJZdjzBb42EXKH501gIyzsJAhi4BsttASLThU4Q/C7UQLvHWzvflP6qSNXZb1dUHJ4YXv1BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

On Sat, Oct 12, 2024 at 02:39:39AM +0000, Matthew Brost wrote:
> On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
> > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > 
> > Debugger needs to read/write program's vmas including userptr_vma.
> > Since hmm_range_fault is used to pin userptr vmas, it is possible
> > to map those vmas from debugger context.
> > 
> > v2: pin pages vs notifier, move to vm.c (Matthew)
> > 
> > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
> >  drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm.h      |  3 +++
> >  3 files changed, 51 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> > index edad6d533d0b..b09d7414cfe3 100644
> > --- a/drivers/gpu/drm/xe/xe_eudebug.c
> > +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> > @@ -3023,7 +3023,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
> >  		return ret;
> >  	}
> >  
> > -	return -EINVAL;
> > +	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
> >  }
> >  
> >  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index a836dfc5a86f..5f891e76993b 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3421,3 +3421,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
> >  	}
> >  	kvfree(snap);
> >  }
> > +
> > +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> > +		   void *buf, u64 len, bool write)
> > +{
> > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> > +	struct xe_userptr *up = &uvma->userptr;
> > +	struct xe_res_cursor cur = {};
> > +	int cur_len, ret = 0;
> > +
> > +	while (true) {
> > +		down_read(&vm->userptr.notifier_lock);
> > +		if (!xe_vma_userptr_check_repin(uvma))
> > +			break;
> > +
> > +		spin_lock(&vm->userptr.invalidated_lock);
> > +		list_del_init(&uvma->userptr.invalidate_link);
> > +		spin_unlock(&vm->userptr.invalidated_lock);
> > +
> > +		up_read(&vm->userptr.notifier_lock);
> > +		ret = xe_vma_userptr_pin_pages(uvma);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (!up->sg) {
> > +		ret = -EINVAL;
> > +		goto out_unlock_notifier;
> > +	}
> > +
> > +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> > +	     xe_res_next(&cur, cur_len)) {
> 
> This doesn't look right after reviewing [1].
> 
> A SG list is collection of IOVA which may be contain non-contiguous
> physical pages.
> 

This is unclear, let me try again.

A SG list is a collection of IOVA aka dma address. This is the the view
from the device to CPU's memory. Each IOVA may be a non-contiguous set
of physical pages if the IOMMU is on. Thus you can't just look at the
first page of the IOVA and know what the 2nd page is.

Hope this makes a bit more sense.

Matt
 
> I'm pretty sure if the EU debugger is enable you are going to have to
> save off all the pages returned from hmm_range_fault and kmap each page
> individually.
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/619324/?series=139780&rev=3
> 
> > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> > +
> > +		cur_len = min(cur.size, cur.remaining);
> > +		if (write)
> > +			memcpy(ptr, buf, cur_len);
> > +		else
> > +			memcpy(buf, ptr, cur_len);
> > +		kunmap_local(ptr);
> > +		buf += cur_len;
> > +	}
> > +	ret = len;
> > +
> > +out_unlock_notifier:
> > +	up_read(&vm->userptr.notifier_lock);
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> > index c864dba35e1d..99b9a9b011de 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.h
> > +++ b/drivers/gpu/drm/xe/xe_vm.h
> > @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
> >  void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
> >  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
> >  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> > +
> > +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> > +		   void *buf, u64 len, bool write);
> > -- 
> > 2.34.1
> > 
