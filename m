Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E176C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 13:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D892C10E0B7;
	Fri, 31 May 2024 13:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RR2Ms77R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6C710E0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 13:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717161573; x=1748697573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ow63uz+8JVhUOrsshJxWqnc9BufC9gnAuhgSog7raUg=;
 b=RR2Ms77RB/MgERyNSdfsNTmuBMBpFLWrHH1IgGEG8n2rmldP317Y+CRt
 nlqMSM0y925QbVrzV8jsOxrE0Ix2gkyHD7p9u9bPw10YZZi4MaYX8iJuH
 NEAdDB88kTTH60/I6XBEcBzyzc5iC5towYdVKPZe03HD33ACbvw03FnXY
 hOCtFN2XrJIyGP/GCEmRghsOoLyFF8ae5oO6whAmMkppycxR3eQiUB5sa
 t8cxdddaNieZ38dtolQ8pYvK7HkEs4CJgd8SZwa0MHIiZZ6AhYCk41nSZ
 en8+jeBhtNEln8q1QPVvB5WuASrHQXmKvH2bvC3oGmSi+aCZttQqQTJ+w A==;
X-CSE-ConnectionGUID: oIY3is+DTyycC+4982oipA==
X-CSE-MsgGUID: VtqibIVQRYS24tPCd5iqLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13896536"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13896536"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 06:19:24 -0700
X-CSE-ConnectionGUID: CskhS8PKQcO7XpsnMVBaqA==
X-CSE-MsgGUID: CvEp+WSbTvWl8h0vnjvEeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="59331315"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 06:19:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 06:19:23 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 06:19:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 06:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwCGw5pGlpuUHN6tSNiMkdTFgc9Sb1qMgpm4l4u9pdzCF5iJlzW9EcBn27Ex5DkQjt+/9pzCAgJ544QIn+KmlsX8d0KZT7E8mKxSvkRdq/6TblY4PG0NxPK6aAL7IEcr+81ePzHGYDomw6tMtMRm/h6wfG7ELtO9Yk7V5KJ+Mu6CDWGECMgSmyC3xgzBflvlCxNq0TG2WulWS+bPjWi7m6pWqDWglzJOqxe+KS3IPtOLHJ7G08COwL9nxYVOvfPtH4SkdFaKziCGqYDfjBAmNGK00RHrJTMuxdGYqgfDgcxcP7iOpq/RF2w8oBITMLTEmczUBELqD211Zk92gUI8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUFUJwNw0OCHyjpsxUfGv4moeXIFNGc65Ec0H3yln8g=;
 b=J8e6b+NA45VGSWxjysAwMff7LjnBmJMy/doc2LORxUUPZVYgsOix4T5EUw45W1IXb1loUm1OTIzZmBLyX5uYRxxF5/lr1fKNGG03lOs3X8CdYNJx3otIlAOMwhsaWTiqdLU8JYU+UeyTbx7oQZc1QECCRy0jObZVzQJzJAuyFwjtZVhmJtB0Ygvlr+p1Te0MuLnRqmc7e6bRiXbCVilpv/ckBjAozgR9pJmUzTHp1kQikw/s3nEzpO/2TZUTnM7Sq4HTiujRIhiJUPWuEbKMNBjuNQLtJ/jUZqUU8lGrFstVc9uLVesD5H7oziHYq56AY7DIYM2bGTfSlkHUE5kaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 13:19:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 13:19:22 +0000
Date: Fri, 31 May 2024 09:19:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Message-ID: <ZlnOVvmtsrWS80Ff@intel.com>
References: <20240531064845.930740-1-himal.prasad.ghimiray@intel.com>
 <20240531064845.930740-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240531064845.930740-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0PR13CA0062.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: ee045042-1a50-408f-b86c-08dc817448de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FkEWM9XBJidhaQ9bB1XaQh5guA6FqgcL5gU96eyxvKcf86d3XxOZdQRB6iXC?=
 =?us-ascii?Q?qTIv24v96Wou8fMEZ4rFzxKx0PDJ/kvySXutkzk8zY3Cw8CQTOYjq42BDqvf?=
 =?us-ascii?Q?XUkZ6iY+LeRKSPS801j1J4uYVOLGSmn3fEzCI8cSbqv24WsS92xjex8cJbz1?=
 =?us-ascii?Q?fCKKRDwrpaV4sW3/T2BZ+oYidP4IhRQdaU8sVRBWQIOXPynnoqfKbW5C22aS?=
 =?us-ascii?Q?HVMfkPQ2hajyUI2OnN2tviktE3Ddrhw34Xf30eV7KBRpmQWFoBDEE/4rxeem?=
 =?us-ascii?Q?UQc8K4vgwdGUwxA99/EQu8D+zoDcLNTS0361Lu6sgSTB2s3hgMjln53kf78N?=
 =?us-ascii?Q?NWMDakSQ+Cxq2gLr4ZZk+VG+UYk1/403I3Q7+2RSjanO3TFrdcXayc0GEpIJ?=
 =?us-ascii?Q?33T7rgwyxDSh6eHtPVfTtPAduwxAz307DrU1CsUTpy/kR/+tTHvj+OZyPtXL?=
 =?us-ascii?Q?aubsw5sdw7lOEUUFYotYYccS78QbZUd5lBxHxyQF0JpuFpGiQSXxSa0ruvxG?=
 =?us-ascii?Q?gPm0M+nPZ197MPCORUmmkAXpWLLCgo1rTD5a5Q9GXP/8eR7U5yuZCNXpl0XI?=
 =?us-ascii?Q?V9Tb1R/TPzZJ+QxFNuwwCWPxlzniv4rWJW75RRUp33HkOPWkco/22rXdrxJ9?=
 =?us-ascii?Q?LtqycUyQh/4xpTpd0dxVHQ9URpEAz3CbP8DnAHRG0qEX4bR0GXK7T5KbwqJ+?=
 =?us-ascii?Q?eM827IK1olPGFz0c5EMPzKyYcHe7e3v1fxHy+TG0AsaS5epnZXOPHWTU+fVX?=
 =?us-ascii?Q?CWM5ZYEWPmdGlw0SDOcXaYqZHdLT74CnydjoaQnH2h5HzNZ/UcApa4OIv1Gz?=
 =?us-ascii?Q?UQPfCLMjWebmePh3ZkiB9YT4hZ8IaEDt9r2PI+Cpza85F8zGzDUHXYmhpZDa?=
 =?us-ascii?Q?g2A4w+PhgRYZYu0qdOy4DzJwvPVOVv7BKxRj5oyNEfSh/EOhh6l6nqzts1VL?=
 =?us-ascii?Q?XaNE/AFuayW1Don4fTAJdWj6bsz0jMGUFp+UaQosrVRHxfHI4pWYOsMm/e1T?=
 =?us-ascii?Q?QP3erNUwQdW7DwK5XxC3s2kApqUtrl5SBOgfs4A/Mr22tZWvRfk2lLdNffRh?=
 =?us-ascii?Q?a4+BWKKNCHG8o0e98DgSCQJzisd7sGIfdLxB2ac7/5Cj+2oEJR0qT+QCReiw?=
 =?us-ascii?Q?9hC9JybjBIQlR36XEQTyOZ1L1741agb2czDaulKAWaXJme+wGgIR2hNeRiwg?=
 =?us-ascii?Q?DeDdzH8FIoNk6g6nTkNE6g3QCOb5043AvX88tRu4F5Gh1mbr5taEhxdm4jyU?=
 =?us-ascii?Q?Z/mLFpQzIned3DzM4tF4pMwhtv4VnKW2HHi1u/K9UQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?07VAIptMFGK/v4CO0mraFGirV69xl2leOvUa52xoqMLyjHUV/8WiRh0A9Xxj?=
 =?us-ascii?Q?OaQpklKrm8NFm+cEvq43gptYEsvXbpASELwz8BM7iOxTQAMQIoFwdcetNu1S?=
 =?us-ascii?Q?rhOvALXYMD6xN6cDJvk7UWtcIiFbW218DKseYLJH3MhIN2IMAZWjm1gzv6nQ?=
 =?us-ascii?Q?GUgfC1niayyj0YptyttSiAGtrsWJ0dZA/iQ01P3QPZN/4u6l4WfpU8nD7rgk?=
 =?us-ascii?Q?QE8e5uejESoc/3emGERrFKt+03T1N0765oJlwSrw94WehveSwPgWcgPURnI/?=
 =?us-ascii?Q?6A2LIC2OO665bOUCANA2l+0Y+9jel1/pdorCHv0yZ/O+P4nnwCPu2LwRg2N3?=
 =?us-ascii?Q?W8OVP2bcKSuc7z0tTK4NbMHiBxaR1OsiF2z8yYx6jn+DEswYkG0os6QcB0vo?=
 =?us-ascii?Q?Ie4EV5EiOr4GjihpGP6dHXvxkT1vzif62Yv0NFAnbiDdR53zBYXHcno+ZMz0?=
 =?us-ascii?Q?ozpwYTi1LzAJcWLzE/XzWcoDZ1ASFx6cjEbR2VJNeDFAqVpg300vnL5+tUtS?=
 =?us-ascii?Q?MjcJ8JLrDqrHI4wugbEdVXd1jUwKsXThQjExt+rwCkHvrBljGv5pDFsJ1Jlm?=
 =?us-ascii?Q?WScfy9VqitLxB+Og3wAYmrSNUplT26J3WrF/rWqP4VnTlctttI0a65pPuUVO?=
 =?us-ascii?Q?qeF7R8AIwJkBzO5kYML0Wf4IU3gTma3gt+MJPlbjT9aZus0jT9f9r6bySMyW?=
 =?us-ascii?Q?pWzZ49HOwVCmpTDhrDbrU8pTqXYUtjOrJYysOfrXc/zJGGkhyX5frMoW4xaf?=
 =?us-ascii?Q?9sVCkN6S0HawDzbhRpai8HWiIGJgqGHGPVMXCWHTt1AJPLdZkyH7eAVe/kSS?=
 =?us-ascii?Q?2+nwHArbEcEaqUrpKgIBQEoqGRG1JfJ+Wr/vOMxOARELHP+r5/OX/XBJJ+VK?=
 =?us-ascii?Q?rfKSXBGJdqW/0AAvvLbGhsXl2A4EU03BQAvLMz+6uOnb586Sn0qnvKZplxsW?=
 =?us-ascii?Q?KEH7CGCdlQflZ/7R9m9cKFvRIag7cI9kzgT6zwT3gF69vTX9s4OZvhoTZFj8?=
 =?us-ascii?Q?W0bSnXAUhVJUSQ/HsozA8sppsaa8SO5X68QD3cC0bWE7XwvAQ+e4P6vCnq5K?=
 =?us-ascii?Q?52PSDJlpkf02bje5o1quqQpAu4EvTDYALqByp/DVOZMFXmuEytzql7Wynlir?=
 =?us-ascii?Q?RtbkmyWGxaChFAY/XPR1IIaV7zq35eEFP4v6P7lrfatyreToXx6wpcyGV5J9?=
 =?us-ascii?Q?huTA1G6Z325+8xoDB6ozFy7VTMB9nwDuddC2aZeKAgjGCdd/PkB6sH/f9A7d?=
 =?us-ascii?Q?4qNidpK/Dt/IqMVquNMHScx+yoQ12fqeelmRJrNRuOWFaq25mZHajWWsqIhj?=
 =?us-ascii?Q?zLAMWJqyLbQmuQ4jxKeyNyabZHAvea90L2bC+0OXT3LtWElE27nUNaEQs69y?=
 =?us-ascii?Q?CknN40LqBKA9BnsscdHx8q1zpJGBc+/3mcAGVVAxwlM7/SBiMUWsTGLLWtFw?=
 =?us-ascii?Q?3Hm+eyYeAQ/k+x8Dsqp6InICrZFpS+EdNfw+z6NVd5ea1377CpIUahqNRQ6i?=
 =?us-ascii?Q?//rDsGJve5zIPfOJrYO/sxmBfMdtHoVmFSTOfTJxn/0Zx7r3qaj4ebNbbfo4?=
 =?us-ascii?Q?WFuUoAjhqzuVeh9tkuduuSkrrlbdQVm0CqkE6ZAs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee045042-1a50-408f-b86c-08dc817448de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 13:19:21.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COnQMujEaxR0zmb0ClNvajvAqdq0Wqp0uAidVIPqlbMHawiUsY7F/3enmPj/cqqm35SDt6v7FS2k6hho/1Duzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
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

On Fri, May 31, 2024 at 12:18:45PM +0530, Himal Prasad Ghimiray wrote:
> Make sure that the assertion condition covers the wakefulness of all
> supported domains for XE_FORCEWAKE_ALL.

The most important part is missing here: why? what issue are we trying to solve?

> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_force_wake.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 83cb157da7cc..4c986d72cba7 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -32,7 +32,12 @@ static inline void
>  xe_force_wake_assert_held(struct xe_force_wake *fw,
>  			  enum xe_force_wake_domains domain)
>  {
> -	xe_gt_assert(fw->gt, fw->awake_domains & domain);
> +	enum xe_force_wake_domains is_awake;
> +
> +	is_awake = (domain == XE_FORCEWAKE_ALL) ?
> +		    fw->supported_domains : domain;
> +
> +	xe_gt_assert(fw->gt, (fw->awake_domains & is_awake) == is_awake);
>  }
>  
>  #endif
> -- 
> 2.25.1
> 
