Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D993BC87FCD
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 10:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9674210E2D4;
	Fri, 25 Jul 2025 10:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IZE2euTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AC410E9AD
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753437737; x=1784973737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tTNK8JPpMXFwkOxO6Nj59O1PCA8ovI8Srw2NelmlH/Y=;
 b=IZE2euTYHYzYhQyL6KC60kw9t6o0TFTkfuxvW7X6jpQY9xVzkkQAwlJQ
 J4B+p2bg8h/fc1eLi0C18GuwUxru7u70WXJTAwVQG5I4KIfnJSFVRwDpX
 rXA1dH5WZC2YWNb+gQO04I/pmspMPq3GsFTaL4Ouk2BEpX14+yPkdtbHm
 eHu+fWHhf/DE1X2MLrLwJP0LBktH5pME6GWSviyqyn/1BOK1hGUCMK2ZQ
 010fe56/gezYaIoFvJms7RjTeHSxSi+5J0wENMKsJwRNidVqat72RsT2X
 XioMq2Qr78KXS5oNEJm5DLp4kQ3z2gd5sEbJLhAgUwXiEOYsYNE4lcDdS A==;
X-CSE-ConnectionGUID: ssZfpF/mSjCOjLkxxphSIA==
X-CSE-MsgGUID: gJFIW2TTQAKx9eiSwEFJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59423988"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59423988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:02:16 -0700
X-CSE-ConnectionGUID: yFtzE4r2Q+G6hD8IE9QJTw==
X-CSE-MsgGUID: IBAdcm4mSfi6jIY0MD1CcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="164890169"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:02:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 03:02:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 03:02:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 03:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpdoWBKLLKlAWo/Mfc8ASTxk6AB4tB8KtZ68ElIbhPKBIPYcd/BdpzSteKbi/sr3O5uS0oqEZ529Wh3MVX8OpBuC3t5Uv0Gjjdp/vEGqSZRiITG4ohaWqU3ovwWcq2H6s/rmXvxpYjYivyjWFlg6mKHS0thyCp8wQmWSbkdZdsyxsAmmFh4CQKXEzo+tWsq7TiIhbx/jqxcmweq7xk5OlrR8WyPnM9XD2SjjqKAwZEhC34Fa0dvfBofGj6vzXUxGOYUAazdlBGoE+JYaD0alGs7xRd/ckuhF/ivr0Q5txSUBOFfHDignrPJ7ze6MMTl9nwaZMe8LF8+lbqsjM4/jbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oVxxzxcKSXALFLKk4vuVgQxgZXDxR1su3SVSX28bHo=;
 b=dTo/qcEn41kHXlun5BLiMKi6+yekrfSALrUufdv3ZmlZHF1XJ+XxoY7/W0E3JyYHZy0s/LDn7dJBAakQxQn0JJnnxES0YjzQLlxSGCOjg6aztpqDzuDx6RCFv3zliPPHbb0C/6Ff6d8bpUTQvEfmKMVgfGTPTgEIviFIKDxQGiOdsn7gwmP+d5grNj7CHp4bt0wDSJhwEg/++7JALXC4cZSXvyYJDl+xKkgja3qzXAv9e4JNkr876+QT2rDoYz3aTpMjPfeuywoURIfs8/k7Z8eN0a0pTdHxLftnDzmc6WdrLP7l0IXErlMMV6SgP/xxZDQ9GRiWvDoEAzNQKWRg8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 10:02:08 +0000
Received: from IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::62fc:d6dc:d0d2:bc4]) by IA0PR11MB7838.namprd11.prod.outlook.com
 ([fe80::62fc:d6dc:d0d2:bc4%3]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 10:02:08 +0000
Date: Fri, 25 Jul 2025 12:01:59 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/hw_engine_group: Don't use drm_warn to catch
 missed case
Message-ID: <aINWFxs_YG48k3Z8@fdugast-desk>
References: <20250725090508.571-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250725090508.571-1-michal.wajdeczko@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR03CA0010.eurprd03.prod.outlook.com
 (2603:10a6:10:be::23) To IA0PR11MB7838.namprd11.prod.outlook.com
 (2603:10b6:208:402::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7838:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e61201-26e7-4e97-ff4f-08ddcb6250ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?edrRGwftU7n024uliP9V9QjJ5riRowXGwIy9kUmM9GihhjygJSADkQfngXJb?=
 =?us-ascii?Q?HY/LAcOXtocloN4CnsNjX2ZaPmYTzSvWYhTqINdiwNG9b/5V5+XbEVPiZnfv?=
 =?us-ascii?Q?3lSGJP/rtEOyjEJ8xIWefFBhQQvo8iFmqdws8mzWjAauigh5HPFoCd/EwO6e?=
 =?us-ascii?Q?Rqfk0PpQoMG3uuvrDaPbGO1gG3LBYr2hR5Ghbp/Jdg2fpfXMkelW8bznqRfD?=
 =?us-ascii?Q?XLHxDaIvAcpis9N4LwO11Gc+eo4HKSTWydgA8QnBcWkvis+5Qnoa0S9zOsSY?=
 =?us-ascii?Q?WnfuGFfqOnd3Z36il9LrNH3z9N2Ze439hXHR2RLFC8xfAp/kS98lovgs/6tk?=
 =?us-ascii?Q?1TXQvOT8f+dUD8OlCLOPYQQnX8goLcqCLOAJJ3lbxZXx3JaQQA7pwO2PI+q3?=
 =?us-ascii?Q?yzy1ROqX1p97FDFAzTn6/J2DEitpUDQbaMx7CeSdiyTO9km9Rc3Uz+qkjmQt?=
 =?us-ascii?Q?HAEu9tJk8BZy+98RYvh9N8l5GC1pqlwlKboX9/5f3d17wRXBJcqEX8iqoB7x?=
 =?us-ascii?Q?LFOhO/E2N35T1rsZMIYp3BE66aBSYE3u64X9vFYCgZoJxbkN4qaaYBGt9GAF?=
 =?us-ascii?Q?JsBribn/TI9grKbOoeqTWHT3VfU7P1y4BhxjP5LKPJ0cLRxZJOcQS9JnSg3P?=
 =?us-ascii?Q?0b2ga70Wy+g2saWzEHjdSioZdiyAGH/9jvG3BxSIWwDvCFeOfy7dDHMx9Ki3?=
 =?us-ascii?Q?CX9SIqR4OnGVEX4hPCE7Mie7MePkuTtyvsjBtYOr/jLznc7l3MVoYdSau8YE?=
 =?us-ascii?Q?vtZavdPtEFzzTAXgcW0UUPpihbykacqnFfkMmZU3AqtIqxT5Wvm7g4/zrGEk?=
 =?us-ascii?Q?zT5iqtj+Tsd899x2pd4toramuf0hTBb/MBTBRQ7YJhkNqX0wtW0hnWkNTD1r?=
 =?us-ascii?Q?++ez8YeAR982RNs2h9zkcBdOTSDOTYTnM6GMAl3iGjljmRYh3PsCG0rjPJn5?=
 =?us-ascii?Q?SCfXCqVtJ2c5gGlMGM4dNCnHs9zlooG5P4q0se0kVvtr6Zx0sVSaWJnOMrEY?=
 =?us-ascii?Q?4pKwBJf660XwXsNVpgcIq0QH2eUbYxkZVH/xG4hGYmm12s4GuH/RyattNaEV?=
 =?us-ascii?Q?VInqg7RBtOFePKfnvFSjSbPTgsgef5DxJuqlbksAX2/moq9lQ2qbtxaipkpW?=
 =?us-ascii?Q?dYk3ROITVv8tA5uFPBFqZH4+S8j83n0MOBlDbKpVaG5efIixdnRs4v0VPDwv?=
 =?us-ascii?Q?+dXcIjAEexf6iYN5zXK/aIkhS2R6SXP7PoSmuQU/6HXNNS42jTvSwFQoMYxR?=
 =?us-ascii?Q?cBMNIiuX3iIrBFiRmalzGsDXZCdscDMoyRv44PrPRIWjRjGnqZkPmpGEYe62?=
 =?us-ascii?Q?PKVlcgmCY/COqFHO0oMOrv2elYFQEtfjGoCWJv8MhgpCSHnHReQlniP+zhrO?=
 =?us-ascii?Q?1OcghkOfm/rOM7lkdyNu00KdwOTLztYYWi/McnF3SGIfde1W5TvKuSvz58zO?=
 =?us-ascii?Q?4prvJe6IunQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7838.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gj0YnyEFSaLx3mZ9wgYagFjWT1aXewg2gHBlbuJveEs1OynE2op26IvQ8Q1v?=
 =?us-ascii?Q?TfcSYyKi9iLO7BitgmoDh47XAfBYg4ymgchtP0J8xC4LpH6WWYnt76jBtwHs?=
 =?us-ascii?Q?V6U3rankNR18UCiNPFqukiNVakIPO5nKiZNFt74Ht7TXYHuWMa17r+AoBJsf?=
 =?us-ascii?Q?leR1EfrjyzxujwMpAWns9KuiUL7sp577l6FU8JDw7Agcbf4/q56oWAkFVSCk?=
 =?us-ascii?Q?/XvRGBNMDLiSxdK1GsaMzGEBTYO/tTD0nYEtR9TK+2MGM7Rs4ahrZuQnkCna?=
 =?us-ascii?Q?hwea5w1GbttSXJDBSmDKD9I5vzp0BHQcCFj5B5bjw96tPXJUGb3QcFEw0zSR?=
 =?us-ascii?Q?4PCd4jmZNYKplAJk8jko6cYPTyIzQu8xNXa6V1P9v0WIqEqLfnPR9syI1ccK?=
 =?us-ascii?Q?V8ipXJkCvIJbF0ND6qu1kSVlejrp+xFDcN4KFVNaDy93C9ZHRDz22vwptlbb?=
 =?us-ascii?Q?h6h3T4UwOU6mmIay9o5h5uuqrXQSFmE4CGwtI6ODYwK1U2BI63YA/i0Q6nWh?=
 =?us-ascii?Q?lFSO/IFtDgnL7amEQGeTdUnEmdoBrwLFOGZP1JAsR6KUL+TUF5eJ1YrHIXt7?=
 =?us-ascii?Q?zFSSbi6p/VEcwdwaBf7oCcZgP83CZn+RhzRWzCOFRUsNtMPgVlrMKi4g1wiG?=
 =?us-ascii?Q?EXABEmc/iAswgBQlmwOrBvL5qLKdxWdvKbxKgLET8pXi87EFkPoJYyQ+AEBL?=
 =?us-ascii?Q?XTBsXnuN+UAPrJHyDsIpeLAGqN/THqHD3J5XTBFCDHyE5ZohZ5heBowrVxfz?=
 =?us-ascii?Q?aKPkFMC4CI0gMShQuI0opX3zTPPh/G3t9eLs8sJIF7WASwGLuAEgwxUfl8Sp?=
 =?us-ascii?Q?TIdu1WhwbIE943/aqvgYsSGxhJu3a8/TM8E7am9Y3R5PsoVzMkTTDrwxY55N?=
 =?us-ascii?Q?AuZ3w5wqvxH36L7Y1xXVEKpgmBlG0M3mRNeSnEJ6vjumWW/wMcXNIK5KzyAR?=
 =?us-ascii?Q?QKmmw06vEvbNzCZu+Tam8wFJRpoJd1CtyIqsMaNeHT4h0cuFvLCnW4V6dgwh?=
 =?us-ascii?Q?IM9HR49xCRKgtB/+DuPVu3Q04Z+CrNrcp/BZ5yh9tJWcAPhTJy28LOHahX2g?=
 =?us-ascii?Q?IfsRsuOE3YIkVKakF5wx8RtJjKBWZuvs/zvA7CCkLVNAAegq5HI+8TB+ltPm?=
 =?us-ascii?Q?1F6xx6gqUI5kzei+sq5tKm/nyGenrZ80dHFctmBRboEDLHSbm+mBB00u+PRR?=
 =?us-ascii?Q?ccc0iiKJqEN44kMsQzbu5WPhesLVumNBGBOtdFUmSqYCafkPebCPIOKIzQrt?=
 =?us-ascii?Q?/cDP9F5+8lCwCQLi1FvYkkE5EEyvEq2Tr/k8gmIJt+Og8Demssmpui2F4RPC?=
 =?us-ascii?Q?qDtH5w8oY+TYgi0DNjMyjY6UOnZd2w0ZH7ELNQqCfNbnw/faj4rxhUTSWtGP?=
 =?us-ascii?Q?agLrp2n6YYj7Zr2il1QWHS8EgRUDMUpx2fqElPZ9t6ttrjYZp1I0154AICag?=
 =?us-ascii?Q?Fp/F5tvGm99hBzuM0UtF4JW3nvnG5uRuL4AZs74LVIDrTcepImyw1haHBAXd?=
 =?us-ascii?Q?NcFc3Vm3lvUvxRaDOTxlzLqb6vZWB4flnzF0bAxgLpSreH2jMqQcAhTqZVXX?=
 =?us-ascii?Q?NHNRFPHkm3+atf/ZrDFCsDA/TBIXjvG58bXucfYbrwdyL0BK093waWAYynJZ?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e61201-26e7-4e97-ff4f-08ddcb6250ca
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7838.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 10:02:08.0602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1y/2hdsyyRchnCJknUvCAn7nCQ4rRwgbehdL7wBgIJfF7CeiKTFshLvLhVR58q5Yz5yLQ2SY6eqbd8kY7JLqAsv2bPUlpbwebdRHtRIFlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
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

On Fri, Jul 25, 2025 at 11:05:08AM +0200, Michal Wajdeczko wrote:
> Since hwe->class is an enumeration we can rely on the compiler
> to catch any unhandled engine class case at compile time thanks
> to [-Werror=switch]. Any unexpected use of a special CLASS_MAX
> enum case can be guarded by our xe_gt_assert() instead, which
> will be compiled-out on the production builds.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

It seems there are a few other cases in drivers/gpu/drm/xe/xe_pt.c.

> ---
>  drivers/gpu/drm/xe/xe_hw_engine_group.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> index c926f840c87b..58bee3ffe881 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> @@ -103,8 +103,8 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>  			break;
>  		case XE_ENGINE_CLASS_OTHER:
>  			break;
> -		default:
> -			drm_warn(&xe->drm, "NOT POSSIBLE");
> +		case XE_ENGINE_CLASS_MAX:
> +			xe_gt_assert(gt, false);
>  		}
>  	}
>  
> -- 
> 2.47.1
> 
