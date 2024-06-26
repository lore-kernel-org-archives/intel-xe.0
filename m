Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2938AC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 22:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B672510E311;
	Wed, 26 Jun 2024 22:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FMwBEnt4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B1F10E311
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 22:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719440422; x=1750976422;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GHXpdOmKsHqI/OlL1xS5ZFG0jHxNIg/wth/x8BXjIOs=;
 b=FMwBEnt4h+H1EvtIfdyzgLreQaP3CpwbIfqKxwT3debLp/lW4w9OTfWY
 A0KuRpPb9Sfce2RNif6fqBgkdhe7Jhm3Lnx0idjw1rWoNIw+0BksNuP/N
 rpWKMDxtuEBTQyVJw/6tF59XMIIVHiSYZR9zkmxjXtX/qmaaov6fhIYSD
 mWKxsqCjuBwa6Ci4kpmQvQgwdicaQg8nOhByxv4mnZoXdNfTbAa2trV6C
 GTP6qfprmnoxMuvYrrkSRPK0RlGn+umH2SRmG6GvoeUA8XjsZtJwvqUtY
 QJOxzoytrAVLtu2hWwf+5LzcYztJl6pKJEQ+e9a6+AkEcWxYhV6ZJfb2e w==;
X-CSE-ConnectionGUID: MUljujiPQOKfcP7NwktEcA==
X-CSE-MsgGUID: mhqqwsjOTdClAPvlrPTVsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="27165438"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="27165438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 15:20:21 -0700
X-CSE-ConnectionGUID: 3Vk/NMS8SFqoBkf2onnf8Q==
X-CSE-MsgGUID: IoIgdKYkReK36lHkVriTcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; d="scan'208";a="48607115"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 15:20:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 15:20:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 15:20:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 15:20:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP/9gMauyeG/qK6XR6t6rzHW3qc12qFP3pXq3ddrBdEsO6WGzDPnpWVVzX5tmZegdMEzijzgIQhxLR59GV5tH/rCplFV8Dmhdh8LWUKTlH/4Os9E3KTc+0eGytbuSVtpp6sb8R2bW57qTqeLAImbmLHED50IMvEJ/efQ05TBR6cUYNvC0VjZrPxgFrYijaQjG9VBGOzXiQ35av/hA21NhNH+eT+WxZgQLD2YvR8JTaO6/4RUSydWXzkDVI1M0MWb6lsm6Ob9bcEo7652UYLraH/Xs/b0BMKqiIeMIHMc3sj5jXs9tt8ciocM0ReNUk+ED+0N8P2UdYqcJ2dDKmNwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0MGB0pa5uxO6gxb0b8UemRXKV9FJMQr7Inbuvh5lFY=;
 b=mecxHrszxQdRDGAwwwWWQEbb9QMEefTFZOulwVT4uiazQbYw1puu650V7hjKptREdxWxhujh7WZttK55Z1uLDl83hE7WSWrmVuWST1Mf7UhCO3/JacgRjgW/DZ32He8F8PtYAm1xZsJ+bS5zT81LSGNef9THk20/qLIcCqG5VDNxOMTs3TrqtGdHNDtTKi2nyLJ02+QA4Y1a2EQsNdlw1pFelXxLBItfNzBP72WZtWSL+AZ9cgLABmEO0Uz6F3DM6uU4oNLvK45viwpoZNE7irv72lCVtJW8z4FeVbvK/uCO3cxKBWx7mUPsaRMVt6dnfHOIbWQpPckKhSZcHafyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7281.namprd11.prod.outlook.com (2603:10b6:208:43b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 22:20:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 22:20:18 +0000
Date: Wed, 26 Jun 2024 22:19:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/oa/uapi: Allow preemption to be disabled on
 the stream exec queue
Message-ID: <ZnyT+RCYm2Th0HYK@DUT025-TGLU.fm.intel.com>
References: <20240626181817.1516229-1-ashutosh.dixit@intel.com>
 <20240626181817.1516229-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626181817.1516229-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR13CA0187.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::12) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 176fc920-f3c8-4766-48e9-08dc962e2901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DRxZmtUCcgYKKyX/iFMoVCpu2beMLarst6VTN+6/3IE7HJYJSoVu2rUdRw?=
 =?iso-8859-1?Q?UCLb/vXTAI47W5GEwjS6KdjJBZzvwUozFEOEzhVArstCladj8j0+44r3+I?=
 =?iso-8859-1?Q?mF4pcR+4xD7QZRTYvhzvEJa+iEflmi99T95hs4wBY/A2C1XGmDXPcAi4uD?=
 =?iso-8859-1?Q?Y8Gd6/fuDElFQslb+nZriyRE7BB25fcezP7k1zzvvfhqULdS1UQdjbWp2h?=
 =?iso-8859-1?Q?MrT/WkhDobv/vurpAyKq98rC3quC6bqVrEAK3biOFXIxC/i9nDLySmlrQ+?=
 =?iso-8859-1?Q?C0Vlcmmwl1ExwsW78hrAbmrDHaimv2gT1KxtTqWPCMlmr1JIy88cPEm12T?=
 =?iso-8859-1?Q?tiZV6hD1BSDIWPhbgFMq4s7zzyetxBCeX0YiruIzr5ud2IlNPGo+jgsmkK?=
 =?iso-8859-1?Q?GumGDJq6BZIa7mkKwjf0+LuO+KQQ9v2cxJ89S2lIVagsyoY1Q8eS3/GMOf?=
 =?iso-8859-1?Q?wu3xJseMWLqf7zECcahi8PasWoaeYPahnhzImmfQc3V2jH/ipnqoHKOOL7?=
 =?iso-8859-1?Q?1kzOHITX282/EUD4utdswZFgJfsEIly4/AQQBtxs/m6L0J2MUnmSTCZStg?=
 =?iso-8859-1?Q?c3qOgY60Nev6SjapVBB5+s6sxs4GaCkl2qLDJ7CjRur2fliKM4TpZ3F2bu?=
 =?iso-8859-1?Q?LFt7SVdz7Hwf3wrdG293YOvYOCZOD+NE+AW8kX1ZGwVvT0Nq9oHfGorgZZ?=
 =?iso-8859-1?Q?N8vQBEpsaYXmofbZAeNXWNZmw8/xGT6ZD274HRsnvcTpEu6GIx9hJVIcQt?=
 =?iso-8859-1?Q?6WlON5hzRMVnEMr87zl8FapS9//U3mY3t7Lbc+WFxQpZAHEKRsF56GiSzd?=
 =?iso-8859-1?Q?2D+7hEv4rN16c3r7N0ZXE5h9EOSw8+4HteTJA7yekRojsoPSqwIBXvhYX7?=
 =?iso-8859-1?Q?nnbFiTtNWd9SQ9kq3HjiTzH6sfmRlSotvgsc4ap+qrcVl81WVGT/Bvjkuc?=
 =?iso-8859-1?Q?hUc6zigHN1ppomoLFddk3H2SCGYLVS7eZbUSmxLdesondMATCaxUrlVc48?=
 =?iso-8859-1?Q?LGx0nqKBGNIlEyy4DouSdk5WRWI3Zpeq7FdRlPzTdBJrpP4VzoJDG8sh9W?=
 =?iso-8859-1?Q?XR6cY3OEcp4Md5v7kZtjbMBsM585/oHmhY1t2IAB7ZBgbCYdcsD5EPPqzU?=
 =?iso-8859-1?Q?kaBmlz6YWrO2ER8RfDPmkjrFCIo/7Xpykj2RjW7XSewTgB6b3rovOhLDRE?=
 =?iso-8859-1?Q?Rp2Ve0y92cgTIu0ORNh/mmOd//77JQYTaLqaEPwniWu4v3hY3ytu6IeP/7?=
 =?iso-8859-1?Q?fbuo6rIMDEeYAUwGyRqlZyNUX6yjfCocGbeECzFl6MWwAv238Qa06TQfmn?=
 =?iso-8859-1?Q?505Umhze3ovIWKnPPCiGiKTIzVZZ4ldUSRXa8IZZdtf4qOLY4ludBWVTRo?=
 =?iso-8859-1?Q?2uDQQM2PaG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vhz85YWqlvn/woXJ2Q9jJ2tSYcYzIaBUbO7yOLkAtgllYtIlPoJmJrN0ZB?=
 =?iso-8859-1?Q?L+8KdyDiIKvhDU2aRXCy7iQ/yacJNLZDVy26TZld7ZU2bfhgU+84YyXLfv?=
 =?iso-8859-1?Q?ZefeGbfZ9elNsV3fv9iRPJ1FyJOLBqF8i0XUyeS6mG2n0c47gMjtmsBS4s?=
 =?iso-8859-1?Q?4PQlbybziDiX9gWLFn7X5iUCpDI6Lz8gzdRbJGQHwrNv6G318sVn7nlc4y?=
 =?iso-8859-1?Q?TPpHpCi+NsY10MB0qk3+fGDMzV5H9/SWI5+r9XZ2xIfh/FPa9LNfbLdxwE?=
 =?iso-8859-1?Q?tuFbl4WZzeDsonB37C033tz/AdTBbuoWi1pUdnnb1LDEYfDzgFobUygJgd?=
 =?iso-8859-1?Q?t+NnpS3deYvNyzjkUeFvBaYrzBgObQyaZpAbRm5V7pUVfhPspWroXkGaqG?=
 =?iso-8859-1?Q?WkWNh/ARxTa5t6i5H7KvIROT0lKJhWYQP1oicvMHcMz9FgTpRZuChhKjBU?=
 =?iso-8859-1?Q?udjMkTKsOxmlvnOKXaT9yiAGvEGPZlNDCaLvzUKK/Si25Ka8TM0oYEI+1C?=
 =?iso-8859-1?Q?0qTpNqVTilOXodhaHQvldHufs4jl54Oh9G/jTN2TQNolISD6Wy2jXUCRF3?=
 =?iso-8859-1?Q?3Q6+BpVVZEWkXKwCM9Tt6mwCp6RfkQoW4yt9NF41ReHgIYtPXF/EhZGHfr?=
 =?iso-8859-1?Q?gUhX7NRZ4VMjLG0qJA+BdFxFtpK6/ba6r9tqatMKR6uRXpiUDl7W74pzR3?=
 =?iso-8859-1?Q?HkyMkJtE5fWSfT135nGVapZ6J/5xko6W1H/SrQT5LP4o8lw+exCW5I4Lzs?=
 =?iso-8859-1?Q?ZE083bt+GpwvgbhEXInByd3SDQK5n2UtEFXp4HEhaL9kW6FPPwYBChDpKV?=
 =?iso-8859-1?Q?YMitwavc1lwRebmjouqS7lRMQTRZNcNpFi0yRUV0TZ5Es0GiEIjkaTpqe6?=
 =?iso-8859-1?Q?tn8Ok5PzTc8JOjMeRblKy+8ECCOLHwa0g3E6k2SqGGFPOKfkIwudYOqVyH?=
 =?iso-8859-1?Q?VP9WcMFEgg6qAyS4atJAZFLGC5pSEkHWFs8QmXSe2Tjx6EJiyP+fuC1kBE?=
 =?iso-8859-1?Q?tkt5do2H87zo5DvwFwHw+BvlFUoUY4GmaXGGA7pCphWKIn74MbVMQwhtdJ?=
 =?iso-8859-1?Q?PyImhWFIs5gK5MvB28iUfaiPBOCBFDX+ItghZw0+Ji5D9vQv4JHgYZLTRF?=
 =?iso-8859-1?Q?zddSCoUgMoJtXa1xaMOUBn68spelhdlVP+hI7GqN1Mc/JQaVk2Zq06zIAs?=
 =?iso-8859-1?Q?x+J++kagJXZTaaQEI1HvXqFOkTZTdtEZ+LuH317sZ5tADCRF83TS5A0hcZ?=
 =?iso-8859-1?Q?/ZdQozvOHuuHWMUmNwEGFGwAGRDFfIPiqBQdOvGrDfYURbluC8sHNjSBOb?=
 =?iso-8859-1?Q?sehzu6eMo87Udm6Z3gAdIX2nmj5gNTJBxME4foly8Zo0kZrv8RAkKQ7OoU?=
 =?iso-8859-1?Q?I5dbtgm7iA+4+/+1WQlmGV4MeJwIcg0Enb32P55rp4dJ/FVXpvT8ZS8hY+?=
 =?iso-8859-1?Q?wuYvv5EQRtW2vhj6tUquZK6rSxjoPbBMpRPCIwTwqUK6Tt3HZ442rDl6+A?=
 =?iso-8859-1?Q?nWEoNF8tAkidHLpPPiZ3WVauON9TFjMm3W7pkyuz56xgU1G8RKe7z1zvVa?=
 =?iso-8859-1?Q?l/L6taQbyz5CmJ4E826grGlkpVbK1l+0ZQVWuK12uu5pRwB9iXH+onv/gg?=
 =?iso-8859-1?Q?4tvxD0daLvspS/PuPjDms75h0at26JHU3BJi/T+kMKTbDYWQUFLHCA/A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 176fc920-f3c8-4766-48e9-08dc962e2901
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 22:20:18.2115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkRyzgeJoHLzjFN2KrYkW7KfgLjU65wFyQD+nLg0Sdt/hoeFt4RIKIYzT+mlaAVwoZA9y0HVhYawY7DzL5HHSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7281
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

On Wed, Jun 26, 2024 at 11:18:17AM -0700, Ashutosh Dixit wrote:
> Mesa VK_KHR_performance_query use case requires preemption and timeslicing
> to be disabled for the stream exec queue. Implement this functionality
> here.
> 
> v2: Minor change to debug print to print both ret values (Umesh)
> 
> Acked-by: José Roberto de Souza <jose.souza@intel.com>

Acked-by: Matthew Brost <matthew.brost@intel.com>

> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c       | 70 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
>  include/uapi/drm/xe_drm.h        |  6 +++
>  3 files changed, 78 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index a68659fd5386..6cc3f0217341 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -80,6 +80,7 @@ struct xe_oa_open_param {
>  	int engine_instance;
>  	struct xe_exec_queue *exec_q;
>  	struct xe_hw_engine *hwe;
> +	bool no_preempt;
>  };
>  
>  struct xe_oa_config_bo {
> @@ -1013,11 +1014,55 @@ static void xe_oa_stream_disable(struct xe_oa_stream *stream)
>  		hrtimer_cancel(&stream->poll_check_timer);
>  }
>  
> +static int xe_oa_enable_preempt_timeslice(struct xe_oa_stream *stream)
> +{
> +	struct xe_exec_queue *q = stream->exec_q;
> +	int ret1, ret2;
> +
> +	/* Best effort recovery: try to revert both to original, irrespective of error */
> +	ret1 = q->ops->set_timeslice(q, stream->hwe->eclass->sched_props.timeslice_us);
> +	ret2 = q->ops->set_preempt_timeout(q, stream->hwe->eclass->sched_props.preempt_timeout_us);
> +	if (ret1 || ret2)
> +		goto err;
> +	return 0;
> +err:
> +	drm_dbg(&stream->oa->xe->drm, "%s failed ret1 %d ret2 %d\n", __func__, ret1, ret2);
> +	return ret1 ?: ret2;
> +}
> +
> +static int xe_oa_disable_preempt_timeslice(struct xe_oa_stream *stream)
> +{
> +	struct xe_exec_queue *q = stream->exec_q;
> +	int ret;
> +
> +	/* Setting values to 0 will disable timeslice and preempt_timeout */
> +	ret = q->ops->set_timeslice(q, 0);
> +	if (ret)
> +		goto err;
> +
> +	ret = q->ops->set_preempt_timeout(q, 0);
> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +err:
> +	xe_oa_enable_preempt_timeslice(stream);
> +	drm_dbg(&stream->oa->xe->drm, "%s failed %d\n", __func__, ret);
> +	return ret;
> +}
> +
>  static int xe_oa_enable_locked(struct xe_oa_stream *stream)
>  {
>  	if (stream->enabled)
>  		return 0;
>  
> +	if (stream->no_preempt) {
> +		int ret = xe_oa_disable_preempt_timeslice(stream);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
>  	xe_oa_stream_enable(stream);
>  
>  	stream->enabled = true;
> @@ -1026,13 +1071,18 @@ static int xe_oa_enable_locked(struct xe_oa_stream *stream)
>  
>  static int xe_oa_disable_locked(struct xe_oa_stream *stream)
>  {
> +	int ret = 0;
> +
>  	if (!stream->enabled)
>  		return 0;
>  
>  	xe_oa_stream_disable(stream);
>  
> +	if (stream->no_preempt)
> +		ret = xe_oa_enable_preempt_timeslice(stream);
> +
>  	stream->enabled = false;
> -	return 0;
> +	return ret;
>  }
>  
>  static long xe_oa_config_locked(struct xe_oa_stream *stream, u64 arg)
> @@ -1307,6 +1357,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>  	stream->sample = param->sample;
>  	stream->periodic = param->period_exponent > 0;
>  	stream->period_exponent = param->period_exponent;
> +	stream->no_preempt = param->no_preempt;
>  
>  	/*
>  	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
> @@ -1651,6 +1702,13 @@ static int xe_oa_set_prop_engine_instance(struct xe_oa *oa, u64 value,
>  	return 0;
>  }
>  
> +static int xe_oa_set_no_preempt(struct xe_oa *oa, u64 value,
> +				struct xe_oa_open_param *param)
> +{
> +	param->no_preempt = value;
> +	return 0;
> +}
> +
>  typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
>  				     struct xe_oa_open_param *param);
>  static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
> @@ -1662,6 +1720,7 @@ static const xe_oa_set_property_fn xe_oa_set_property_funcs[] = {
>  	[DRM_XE_OA_PROPERTY_OA_DISABLED] = xe_oa_set_prop_disabled,
>  	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] = xe_oa_set_prop_exec_queue_id,
>  	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] = xe_oa_set_prop_engine_instance,
> +	[DRM_XE_OA_PROPERTY_NO_PREEMPT] = xe_oa_set_no_preempt,
>  };
>  
>  static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> @@ -1766,6 +1825,15 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>  	if (param.exec_q && !param.sample)
>  		privileged_op = false;
>  
> +	if (param.no_preempt) {
> +		if (!param.exec_q) {
> +			drm_dbg(&oa->xe->drm, "Preemption disable without exec_q!\n");
> +			ret = -EINVAL;
> +			goto err_exec_q;
> +		}
> +		privileged_op = true;
> +	}
> +
>  	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
>  		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
>  		ret = -EACCES;
> diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
> index 706d45577dae..540c3ec53a6d 100644
> --- a/drivers/gpu/drm/xe/xe_oa_types.h
> +++ b/drivers/gpu/drm/xe/xe_oa_types.h
> @@ -235,5 +235,8 @@ struct xe_oa_stream {
>  
>  	/** @oa_status: temporary storage for oa_status register value */
>  	u32 oa_status;
> +
> +	/** @no_preempt: Whether preemption and timeslicing is disabled for stream exec_q */
> +	u32 no_preempt;
>  };
>  #endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index b410553faa9b..12eaa8532b5c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1611,6 +1611,12 @@ enum drm_xe_oa_property_id {
>  	 * pass along with @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID or will default to 0.
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE,
> +
> +	/**
> +	 * @DRM_XE_OA_PROPERTY_NO_PREEMPT: Allow preemption and timeslicing
> +	 * to be disabled for the stream exec queue.
> +	 */
> +	DRM_XE_OA_PROPERTY_NO_PREEMPT,
>  };
>  
>  /**
> -- 
> 2.41.0
> 
