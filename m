Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC84D68BCD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 18:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1C510E065;
	Fri, 15 Nov 2024 18:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZfRajddh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31B210E065
 for <Intel-Xe@lists.freedesktop.org>; Fri, 15 Nov 2024 18:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731694704; x=1763230704;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dx/dvEY+rZOa3/byQOe5zp4pBWc3JDXjV80xbA/6F34=;
 b=ZfRajddhWB4w0IRLfx7mwkrkxZ70hUVtt0gAnSLutzqBJ8NSzvgTgwtB
 tExDGrGuRUUXgQm2vuVuHsVRYeaVcWsL3lfsdLqIGl6GPsghnLmotO8Fg
 o0idKHDFP4D+WM97zIRWOj/5ADDTKIOvzbevdPAXXDHiVPbCPFlj+BMv8
 vKwq0fGYbIpuXrtP8DKlVKdlnyXNv4jxNS7M/zjKS+jb5TLZ3eebjmCSS
 nzL3PVGKFjLZNrQkktBtxeYd8/aRSFZOnCg8Xy6JD8KTamU+urc+awoG7
 LgEFHWFPLrcvNPfY57mBAwertCSoXZl6K5xZii+r8H396OmwtZGGB1N5N Q==;
X-CSE-ConnectionGUID: KGk6J/kWROOi16Jg6FcvtA==
X-CSE-MsgGUID: BWZOt47JRoCw3geNvY1Rgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="31965659"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="31965659"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 10:18:23 -0800
X-CSE-ConnectionGUID: rNBUCFUuTFO5ExXig6yMpA==
X-CSE-MsgGUID: NcYP94dFR8iSmpYwpGPnTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93642223"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 10:18:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 10:18:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 10:18:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 10:18:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p54aYDpQQlKeyWNEs7i/DzFDdEUvtA/CzGMrNTP039Lt6ArX0K0HuN0Kizkd1grTrqroI8qGShOUUW0hSqblfQYfTEspvdk8REmGCvpxp3tWyw2FD513F4KqcKYGODeOcqCiox9ZL/Rm7vJqlszxtf9Vbxt50NKDurtvkjMlNlO3V/rycH9Z80bPbEwPtDh9tegePdHnixgeW6FVL/MCd5jZw0dlEcGA06j1v+L9kATp6hW4hHxEl74ZdFRBzBwHtUBXUjp6M7OKI58WXeaki5Xs1j/KfypYb1k7cAgPlRwWuy2/1SsS3PPzlNpl+UIgs115w46ie6rAtQc2YHcAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jFEcHfBTT7qwT8bzKjbZ+9eBsmoU/UZTS+h84JLO5I=;
 b=TIVMZVwTjZHSAP1v7eMs8HdQYfHq4rp9ZQ3PxlNoXQY38hKYZEvse1Pv2hGxQHKd8Q/zjTNNh/cvzQCt87SFmsK2vpntKrC0/4ctaVuB+nxsiRYM1eXaASRFjyKuZ6Re+PGajH4SoADmbx3HG3XqJDSPVw4Un3AlUu5fRFHU0JlL2YDKa4DhbRPWEwGYHKXyuWV4pMpMQt21gbg8gAA9eNpU1I2lbIpxGOp/oF3TCESPAlPemmtTh6XFKfTpg3ednAbjRe8IA67I/If/5V8+mn5DZj+H7uJvzGvRGAmxDCNAvKqIgwQporDgd0UhSz9QOHhxcU6pf8QL6QqD0Q1N2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 18:18:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 18:18:19 +0000
Date: Fri, 15 Nov 2024 10:18:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, Niranjana Vishwanathapura
 <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Allow bo mapping on multiple ggtts
Message-ID: <ZzeQjAXAAX0GZVw8@lstrano-desk.jf.intel.com>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241108202216.2020164-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DM4PR11MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 079ab133-a09c-4047-9853-08dd05a1e1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9tU9cuYWWl++Re4Lfbu/CTpyj8wiRYJGYNw5ZPV7Bdvxuv+zqpIucJISrJU8?=
 =?us-ascii?Q?Q7ynsHxmBxHZUeeefz2xQKUVMgnl9ddrSnDD9OIFcRMLLiLrIbL31jdcOdJD?=
 =?us-ascii?Q?tbXsf+Rm9S41lD1/fYXpRalSy7bpRoJtOmI0hg0lpS7HWEKwn/LN+Nw/bflb?=
 =?us-ascii?Q?zwG5wR4ecYPtHhL7Cv5Iigq1+BCti14xT9DxyBcxx8ZPSCZ2/ino2iiql05E?=
 =?us-ascii?Q?abHR6Ku95FtCu69CqOSQ5W+m1GVvtusfotHFDTfKlD1qK/ggrOLHyx+I1yv3?=
 =?us-ascii?Q?cpnYA1IpbJGi+bAy9TzNcIxOyd/S9vbES6bXef83pJgelnu3v0Iktg8f0YRv?=
 =?us-ascii?Q?LBmdTNKNbExFRNOMMvL//ShZ9gUjPiaYTAvVb7p6u5S/g37fBGMwnlHlIIfi?=
 =?us-ascii?Q?QgSLvGWAhx/wqP957gsfjbG4IcDHkR0EJZfhUxnJnfCgoq12VvMDmvcYMtV1?=
 =?us-ascii?Q?bcyLn4mFkqkb6/tkxOI9QB2SF+6wbQRSvAhUbt1UXWLE4EFM4f1tU6/Ax3Hm?=
 =?us-ascii?Q?ck88usB/o6j53zTS+gdF32s7+7dlz9vJr5ZyNRO+/1wIpEq9wuJY3mT4yXr7?=
 =?us-ascii?Q?mcn+bLVtbQx5RQZ3O7O+UE6WO6dzn2ysqrpMXbILFgcLsGsOF4QmYaWwr4dS?=
 =?us-ascii?Q?b8D6dfyKGoxVE9EOMOtTc+xJow5kZ2B15wEcqkGL0yveA3OxVwYowjF3So10?=
 =?us-ascii?Q?OaxL8c/Lki8BVTVmeZkrpg/wPoZ5JGUWlwCHmQZ1PnxdFzK4Ol8FM6+CWsEP?=
 =?us-ascii?Q?b4GWiskGp5FohwyBDyT4heZgRsCYUcMAseW49lbc3Ks+QbLWdgCzAUllofZZ?=
 =?us-ascii?Q?YiObRWYGFtIZiTKO8gXuBGcO3BJgnmvn1UMXByCP+sUm/1pub1Ig0hc4VHze?=
 =?us-ascii?Q?BWB7zpaCT4vowNQUVoU/sTSwGt22ezsm2DPIpIc3FgDWWpufEFnw7G1jgQqg?=
 =?us-ascii?Q?T62lfgMJ5vtceDZciL4gl9dMUVLMBeSOmuKYh2+uk/0TFzsjYN6Xo7fVLCrg?=
 =?us-ascii?Q?sE9N1C8ZsRkV7egrQ9hbbh2EW4CHndTkX0qBKVXQJrJ0EgT1OfR8igVTaqg4?=
 =?us-ascii?Q?2hFn3+1tUCrfnUoVT7Fi8WYe0F0ciqTxg2S5Yaz8cj13sOD4BAMIzvnsQnWM?=
 =?us-ascii?Q?JhlFd8ZxZOOSVH+dvDS/aWkFiQ6aUljYaM+hZA5g+FHOqPnGG1Vy60nFQDse?=
 =?us-ascii?Q?X9QKyOzDRJZo4gvVcTaVT+mB9XDed9hz1rP6xIrYDpPosW2wziblfzHgaEjP?=
 =?us-ascii?Q?Y8hWyXtzk4nESpPkgIfbYvFxkWwK6DnzHvULpxPXwZpImbTUvEdjXVC5Zw9N?=
 =?us-ascii?Q?LV8BLXNCiuIBs1wzbnKTqIiz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GsU3QByCYPxtYHkXmZvaQKaiT+jonJ3f1548A/or+CRhLVskfdalX94eA11o?=
 =?us-ascii?Q?cz7wtSv0ckKGUZTMjc0iWmJlhFBQV2ltTvZiqBk3MUSsjaf0QoyhSeeng2aT?=
 =?us-ascii?Q?yA9CGpEKwZAf7JJZmLhO224UIRYpfea7qGG2CnK1EzaIPGe+PD7LS6QqZfKm?=
 =?us-ascii?Q?OcvMM0Yg19z0Nqbq4qVSbEubCyTU/AT/ueEUQT+2g/SUBUHjgoiTSyZKhKba?=
 =?us-ascii?Q?vsixQlZH+3PqZZyet9Nh/t2LF6EjNQ/L5r9Z2+mmC4SipglMUnJAb4ecYCtu?=
 =?us-ascii?Q?TprsHoi+RnNj5M9J4vrEdjBFpNxguVrh0aRSOdy8xPaBUM6qkC30K7y8h+z6?=
 =?us-ascii?Q?vk4YupQmqG/jtu87Kb51gch3IiNctsqDv2sc3CoY+xwIvE/PTPe4nQDjiFDW?=
 =?us-ascii?Q?tLbUfMb2VJj/jey23EY7+Wb2jmqmyBmX+Fi3hUP3Ultu+1FFqsgeBomosCNx?=
 =?us-ascii?Q?OxYHpYMxl3rjRvfwWWsi3ER8g2+gUT0nL4lY2FX5ksXpYp3c7T/V/EPEK3rp?=
 =?us-ascii?Q?vDyVrKQEbLzCgpoDgPH6Gh0NRjAF8Klmzh8nCN0qVz6hxVQPQXZno2lokquh?=
 =?us-ascii?Q?2Z7Og0j1a9zPragy2i1fVCq9wBUseHvF+qdrl5oCrLllkf0tNmo/rpSK/PBO?=
 =?us-ascii?Q?AHjn6C5Knr/nb6YDlGs/3cd5bvHydggupKbB4/l02bIEGyPK7ntbAGodteue?=
 =?us-ascii?Q?UrUKm+cuI+CVbzIB/xUQvHukKiz/b/36lvtD6ESDXXS34pUJCoxp5HOxU1gF?=
 =?us-ascii?Q?CS4ZQ2vce9Tsn1cti7XQ0UzdnAS2K1OcEQPg1lm7JZrpbs6vhLwQfna1uYqO?=
 =?us-ascii?Q?HrnNP9rI8RLjvuynTNpX90fT6Dye1KPhbv6z+zx9qxq/5Qj9qcQUdysKct0J?=
 =?us-ascii?Q?1xhghUtaroGvCHmkCi9T9Ra8WW8Qfk7eADT5l1Fgvi30wRjvuRHFf2SH8g9U?=
 =?us-ascii?Q?kF45OPLyZTlwTSXXPL1DkqSIXxZ9FN5A7DVKmDJx9VGPjzP4no1lIt/d2MCR?=
 =?us-ascii?Q?sOeZyx9q1hbI87T7sfPzBHk/mQ0uo77eS9JbG+67ZVwaK82bTFo2qQvXroAn?=
 =?us-ascii?Q?FU5VO4PxVS4Kz7I+5E/x8wa/2RKGX0LV3R+REUfKjG8fwN3LzKu0yz1+z7MT?=
 =?us-ascii?Q?cWujtRsqk77BxsmhQdHS9Mwzz8h6SLJHln4PRWBmVqnJjQ3GY96IUV4teOGW?=
 =?us-ascii?Q?00+M2cVfILKXM6MUemnlk/1WysDK1+Lro7vhZ6jHcT5gD5sYK9eYcawVzxBH?=
 =?us-ascii?Q?di7LIp606uAOkBANONGOEZLFQmBWWPjrJctEH657phJVKj/oxJsEoIojZ7m7?=
 =?us-ascii?Q?i/qCDIrMMnmXluSofaOIWU7w7Xs/m4SWqXu6reHJg8WC+iC6mXm0WGBqendE?=
 =?us-ascii?Q?YzsqamzrSFFK3hjJ7z/sRq1SzumuRkikpQNSAEIDejcyYhwV5FOk8JfmVl+8?=
 =?us-ascii?Q?w8mVf5vPgIjIdCx1fHd2HrYEDXJd2jpIn8lro4N+JIOIJyyjhkMtox2hBIq0?=
 =?us-ascii?Q?T2NT3yqL0qkFKYYVjdd3hr+uhMFg8g6eVlk4oTp8jmjRtwxippyIpJnIuhHM?=
 =?us-ascii?Q?mgt7sdAZQ/ffxm3cXooCfD77b/xO7XFKBwTBEAWro6dyEw4ZlVyDWT4E3qi/?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 079ab133-a09c-4047-9853-08dd05a1e1aa
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:18:19.2215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43cFPQjseGee3qyjW/y9Ff5CvAHq8ANsmiT78tiGoY+1KSoTYGjUj2T4AfFzp/iIaSoNj52KzV7BxWEliB7mdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
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

On Fri, Nov 08, 2024 at 12:22:15PM -0800, John.C.Harrison@Intel.com wrote:
> From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> Make bo->ggtt an array to support bo mapping on multiple ggtts.
> Add XE_BO_FLAG_GGTTx flags to map the bo on ggtt of tile 'x'.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 12 ++++---
>  drivers/gpu/drm/xe/xe_bo.c             | 49 ++++++++++++++++++--------
>  drivers/gpu/drm/xe/xe_bo.h             | 32 ++++++++++++++---
>  drivers/gpu/drm/xe/xe_bo_evict.c       | 14 +++++---
>  drivers/gpu/drm/xe/xe_bo_types.h       |  5 +--
>  drivers/gpu/drm/xe/xe_ggtt.c           | 35 +++++++++---------
>  6 files changed, 101 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 761510ae0690..9fa51b84737c 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -161,7 +161,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  	}
>  
>  	vma->dpt = dpt;
> -	vma->node = dpt->ggtt_node;
> +	vma->node = dpt->ggtt_node[tile0->id];
>  	return 0;
>  }
>  
> @@ -213,8 +213,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		align = max_t(u32, align, SZ_64K);
>  
> -	if (bo->ggtt_node && view->type == I915_GTT_VIEW_NORMAL) {
> -		vma->node = bo->ggtt_node;
> +	if (bo->ggtt_node[ggtt->tile->id] && view->type == I915_GTT_VIEW_NORMAL) {
> +		vma->node = bo->ggtt_node[ggtt->tile->id];
>  	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>  		u32 x, size = bo->ttm.base.size;
>  
> @@ -345,10 +345,12 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  
>  static void __xe_unpin_fb_vma(struct i915_vma *vma)
>  {
> +	u8 tile_id = vma->node->ggtt->tile->id;
> +
>  	if (vma->dpt)
>  		xe_bo_unpin_map_no_vm(vma->dpt);
> -	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node) ||
> -		 vma->bo->ggtt_node->base.start != vma->node->base.start)
> +	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node[tile_id]) ||
> +		 vma->bo->ggtt_node[tile_id]->base.start != vma->node->base.start)
>  		xe_ggtt_node_remove(vma->node, false);
>  
>  	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 8286cbc23721..3504833d5636 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1137,6 +1137,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  {
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_tile *tile;
> +	u8 id;
>  
>  	if (bo->ttm.base.import_attach)
>  		drm_prime_gem_destroy(&bo->ttm.base, NULL);
> @@ -1144,8 +1146,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>  
>  	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
>  
> -	if (bo->ggtt_node && bo->ggtt_node->base.size)
> -		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
> +	for_each_tile(tile, xe, id)
> +		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
> +			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
>  
>  #ifdef CONFIG_PROC_FS
>  	if (bo->client)
> @@ -1316,6 +1319,10 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> +	/* XE_BO_FLAG_GGTTx requires XE_BO_FLAG_GGTT also be set */
> +	if ((flags & XE_BO_FLAG_GGTT_ALL) && !(flags & XE_BO_FLAG_GGTT))
> +		return ERR_PTR(-EINVAL);
> +
>  	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
>  	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
>  	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
> @@ -1506,19 +1513,29 @@ __xe_bo_create_locked(struct xe_device *xe,
>  	bo->vm = vm;
>  
>  	if (bo->flags & XE_BO_FLAG_GGTT) {
> -		if (!tile && flags & XE_BO_FLAG_STOLEN)
> -			tile = xe_device_get_root_tile(xe);
> +		struct xe_tile *t;
> +		u8 id;
>  
> -		xe_assert(xe, tile);
> +		if (!(bo->flags & XE_BO_FLAG_GGTT_ALL)) {
> +			if (!tile && flags & XE_BO_FLAG_STOLEN)
> +				tile = xe_device_get_root_tile(xe);
>  
> -		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
> -			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
> -						   start + bo->size, U64_MAX);
> -		} else {
> -			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
> +			xe_assert(xe, tile);
> +		}
> +
> +		for_each_tile(t, xe, id) {
> +			if (t != tile && !(bo->flags & XE_BO_FLAG_GGTTx(t)))
> +				continue;
> +
> +			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
> +				err = xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
> +							   start + bo->size, U64_MAX);
> +			} else {
> +				err = xe_ggtt_insert_bo(t->mem.ggtt, bo);
> +			}
> +			if (err)
> +				goto err_unlock_put_bo;
>  		}
> -		if (err)
> -			goto err_unlock_put_bo;
>  	}
>  
>  	return bo;
> @@ -2384,14 +2401,18 @@ void xe_bo_put_commit(struct llist_head *deferred)
>  
>  void xe_bo_put(struct xe_bo *bo)
>  {
> +	struct xe_tile *tile;
> +	u8 id;
> +
>  	might_sleep();
>  	if (bo) {
>  #ifdef CONFIG_PROC_FS
>  		if (bo->client)
>  			might_lock(&bo->client->bos_lock);
>  #endif
> -		if (bo->ggtt_node && bo->ggtt_node->ggtt)
> -			might_lock(&bo->ggtt_node->ggtt->lock);
> +		for_each_tile(tile, xe_bo_device(bo), id)
> +			if (bo->ggtt_node[id] && bo->ggtt_node[id]->ggtt)
> +				might_lock(&bo->ggtt_node[id]->ggtt->lock);
>  		drm_gem_object_put(&bo->ttm.base);
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 7fa44a0138b0..d0dce44317c7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -39,10 +39,22 @@
>  #define XE_BO_FLAG_NEEDS_64K		BIT(15)
>  #define XE_BO_FLAG_NEEDS_2M		BIT(16)
>  #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
> +#define XE_BO_FLAG_GGTT0                BIT(18)
> +#define XE_BO_FLAG_GGTT1                BIT(19)
> +#define XE_BO_FLAG_GGTT2                BIT(20)
> +#define XE_BO_FLAG_GGTT3                BIT(21)
> +#define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
> +					 XE_BO_FLAG_GGTT1 | \
> +					 XE_BO_FLAG_GGTT2 | \
> +					 XE_BO_FLAG_GGTT3)
> +
>  /* this one is trigger internally only */
>  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
>  #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
>  
> +#define XE_BO_FLAG_GGTTx(tile) \
> +	(XE_BO_FLAG_GGTT0 << (tile)->id)
> +
>  #define XE_PTE_SHIFT			12
>  #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
>  #define XE_PTE_MASK			(XE_PAGE_SIZE - 1)
> @@ -194,14 +206,24 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
>  }
>  
>  static inline u32
> -xe_bo_ggtt_addr(struct xe_bo *bo)
> +__xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
>  {
> -	if (XE_WARN_ON(!bo->ggtt_node))
> +	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
> +
> +	if (XE_WARN_ON(!ggtt_node))
>  		return 0;
>  
> -	XE_WARN_ON(bo->ggtt_node->base.size > bo->size);
> -	XE_WARN_ON(bo->ggtt_node->base.start + bo->ggtt_node->base.size > (1ull << 32));
> -	return bo->ggtt_node->base.start;
> +	XE_WARN_ON(ggtt_node->base.size > bo->size);
> +	XE_WARN_ON(ggtt_node->base.start + ggtt_node->base.size > (1ull << 32));
> +	return ggtt_node->base.start;
> +}
> +
> +static inline u32
> +xe_bo_ggtt_addr(struct xe_bo *bo)
> +{
> +	xe_assert(xe_bo_device(bo), bo->tile);
> +
> +	return __xe_bo_ggtt_addr(bo, bo->tile->id);
>  }
>  
>  int xe_bo_vmap(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 32043e1e5a86..68956f178651 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -147,11 +147,17 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>  		}
>  
>  		if (bo->flags & XE_BO_FLAG_GGTT) {
> -			struct xe_tile *tile = bo->tile;
> +			struct xe_tile *tile;
> +			u8 id;
>  
> -			mutex_lock(&tile->mem.ggtt->lock);
> -			xe_ggtt_map_bo(tile->mem.ggtt, bo);
> -			mutex_unlock(&tile->mem.ggtt->lock);
> +			for_each_tile(tile, xe, id) {
> +				if (tile != bo->tile && !(bo->flags & XE_BO_FLAG_GGTTx(tile)))
> +					continue;
> +
> +				mutex_lock(&tile->mem.ggtt->lock);
> +				xe_ggtt_map_bo(tile->mem.ggtt, bo);
> +				mutex_unlock(&tile->mem.ggtt->lock);
> +			}
>  		}
>  
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 13c6d8a69e91..5387e0456625 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -13,6 +13,7 @@
>  #include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_placement.h>
>  
> +#include "xe_device_types.h"
>  #include "xe_ggtt_types.h"
>  
>  struct xe_device;
> @@ -39,8 +40,8 @@ struct xe_bo {
>  	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
>  	/** @placement: current placement for this BO */
>  	struct ttm_placement placement;
> -	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
> -	struct xe_ggtt_node *ggtt_node;
> +	/** @ggtt_node: Array of GGTT nodes if this BO is mapped in the GGTTs */
> +	struct xe_ggtt_node *ggtt_node[XE_MAX_TILES_PER_DEVICE];
>  	/** @vmap: iosys map of this buffer */
>  	struct iosys_map vmap;
>  	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 558fac8bb6fb..05154f9de1a6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -598,10 +598,10 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  	u64 start;
>  	u64 offset, pte;
>  
> -	if (XE_WARN_ON(!bo->ggtt_node))
> +	if (XE_WARN_ON(!bo->ggtt_node[ggtt->tile->id]))
>  		return;
>  
> -	start = bo->ggtt_node->base.start;
> +	start = bo->ggtt_node[ggtt->tile->id]->base.start;
>  
>  	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
>  		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
> @@ -612,15 +612,16 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  				  u64 start, u64 end)
>  {
> -	int err;
>  	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
> +	u8 tile_id = ggtt->tile->id;
> +	int err;
>  
>  	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>  		alignment = SZ_64K;
>  
> -	if (XE_WARN_ON(bo->ggtt_node)) {
> +	if (XE_WARN_ON(bo->ggtt_node[tile_id])) {
>  		/* Someone's already inserted this BO in the GGTT */
> -		xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
> +		xe_tile_assert(ggtt->tile, bo->ggtt_node[tile_id]->base.size == bo->size);
>  		return 0;
>  	}
>  
> @@ -630,19 +631,19 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>  
>  	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>  
> -	bo->ggtt_node = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(bo->ggtt_node)) {
> -		err = PTR_ERR(bo->ggtt_node);
> -		bo->ggtt_node = NULL;
> +	bo->ggtt_node[tile_id] = xe_ggtt_node_init(ggtt);
> +	if (IS_ERR(bo->ggtt_node[tile_id])) {
> +		err = PTR_ERR(bo->ggtt_node[tile_id]);
> +		bo->ggtt_node[tile_id] = NULL;
>  		goto out;
>  	}
>  
>  	mutex_lock(&ggtt->lock);
> -	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node->base, bo->size,
> -					  alignment, 0, start, end, 0);
> +	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
> +					  bo->size, alignment, 0, start, end, 0);
>  	if (err) {
> -		xe_ggtt_node_fini(bo->ggtt_node);
> -		bo->ggtt_node = NULL;
> +		xe_ggtt_node_fini(bo->ggtt_node[tile_id]);
> +		bo->ggtt_node[tile_id] = NULL;
>  	} else {
>  		xe_ggtt_map_bo(ggtt, bo);
>  	}
> @@ -691,13 +692,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   */
>  void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>  {
> -	if (XE_WARN_ON(!bo->ggtt_node))
> +	u8 tile_id = ggtt->tile->id;
> +
> +	if (XE_WARN_ON(!bo->ggtt_node[tile_id]))
>  		return;
>  
>  	/* This BO is not currently in the GGTT */
> -	xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
> +	xe_tile_assert(ggtt->tile, bo->ggtt_node[tile_id]->base.size == bo->size);
>  
> -	xe_ggtt_node_remove(bo->ggtt_node,
> +	xe_ggtt_node_remove(bo->ggtt_node[tile_id],
>  			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>  }
>  
> -- 
> 2.47.0
> 
