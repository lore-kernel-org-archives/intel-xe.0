Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41652C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 15:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0401B10E5FC;
	Tue, 22 Apr 2025 15:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SH/MCl2z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EF410E5FC
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 15:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745335041; x=1776871041;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KLMAwHvzh27yO9ksykFoj9pSZXJcVMaHJ7nVtJiDvFs=;
 b=SH/MCl2zoBmXgkf7xZWq6D55SIk9zAcyInDk/SANgve6JvY4HdpGzQHj
 RX0cvItSF2kPZUEzwHru0G3HJSsvO+cs4ygozSIRuM0r/aZXt8CnPDe31
 x/6A0sQ+n6uFmrqvLhVYu44ZAa0MNnBs65Em6cDToEwiM9sVBr35/VP1C
 QCoNLo4yzQ85xQpO6sdW2+ELflTPi057UqXyhWeZWI7Q9GWxUEJnnha4/
 T+VwS6BAjqhIdoLgCDFVFVx25qbbgMaRuORmABtvyHg1kLqYrpVgYaSFq
 4Tgkj+MEDA46Qqa/zY/53h83yZz8zNaJXhadmZL5eN303Y2+5J440BMTu g==;
X-CSE-ConnectionGUID: 5Pg+IonwSA+IAaQq+bnFdA==
X-CSE-MsgGUID: a+h19yg7QBeTEvNFf8c8lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="72287285"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="72287285"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:17:21 -0700
X-CSE-ConnectionGUID: D0JYiDP3RvmV5L0aCnnfMA==
X-CSE-MsgGUID: IfeVJ2McQuqEVJQNgfhjAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="136828525"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:17:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:17:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:17:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:17:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIuA+kMr7Ni0hGBP6dexbKxmJtO/Py6EKa09Jkl79gu5ONZIBg6AMzqSDJo31Lxro/pTxdIkyEgEKXbxXDAPdxnZuFe8bCcCuWhRAQqHe84ug36ZyILe+hywEqsKIJxV52iNiX2QAK4I5w8p6oK+yskgzOWKJ6JAtvRBZKZDmPsOYpcdiu2cY9C3Arw99aFPJznA2DwvzVxnGcoKJLiCfiFBAiaVfAtpCPeXRR19FhvGf59dD0rbIhMBbnEUZJox6v4fqHATD/lX6gSNuy+Tr5dttim7hf7+hmf/cFrGwQvYsJz6KrpnG1gChoN4CKvvRMDYlEVY/j4l2GeU9v1ADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2UfIipXgBwULlqhWRefN/rOwQOIJNrNAqXJWeoOY2c=;
 b=KUgKXkfWzGsp/whGN3rmMp6wXCUvjt1kln9eUrmDLXyQgEb6av/vj5HaRPE9yvjOL1XyEYh10MO+eLRRY+bViY8sjN6sK4xhB07DjJa/CIbj5KcbVxLBkG7UknF139HFtA5gtqytmHluZSsBJwh5u6LzalahrU1GJDTyJtCQG77fgZmtXXdeg36XmUZBObCsibngAOLZGzW0KZNnfsVPuPUlLNUqsR5FayzU0WsuPsFIAV3CV/74p1lGMd2Wn8E7GmqtZL336TLk2gqlSSsHN1fdZhQTk+0yGE0ZCuSf4J0eKKEG5lA4Vb34SkGJvk/ndBSS+ymZCvBDdpqt/f/t7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7243.namprd11.prod.outlook.com (2603:10b6:930:96::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 15:16:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:16:47 +0000
Date: Tue, 22 Apr 2025 08:18:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: xe_svm_range_alloc should return NULL upon error
Message-ID: <aAezL5ir9HMCbAjZ@lstrano-desk.jf.intel.com>
References: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422050606.1074334-1-dafna.hirschfeld@intel.com>
X-ClientProxiedBy: MW4PR04CA0132.namprd04.prod.outlook.com
 (2603:10b6:303:84::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: d3dd77d0-058a-4037-7bc1-08dd81b0b29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uVYakt5wV5/RX5vdc6JsaheQ7azv/PEY06oSo5hLMwddCkCKiWutcrbdccOP?=
 =?us-ascii?Q?yv4+/ViUYJlL0ji/GVyuLPyFZdk/bBvsUJAN253Y5vWv/7+nmDsW2OQbpg5b?=
 =?us-ascii?Q?A2JLeJnDV96W0/8ESGHzXYTGlOZSJ27ft9CREdka6d8x0edCKRJDvv8sbOLS?=
 =?us-ascii?Q?jl/sdHvy5OM/BLq+nPczVXpTIZyYLaTxswmGJGMffPsyAjQoOvJRTMM/8A1q?=
 =?us-ascii?Q?zFFz+2HatDVIypUBoa9roZBIx7CBDMOtHpO6iJOurkJ6vSI6sbizK2frf+9a?=
 =?us-ascii?Q?QGH5OaAIFakVhK8R0AZpGs8T8WYU+L47uYq2PUAEGTpAYjG2Y0GGm0kosuoL?=
 =?us-ascii?Q?Mk1Vl2f65qNJ57N+mf4K4cIdW8/KQWG0l8nVEyitPhbZwp4IW8RSra2NGO3h?=
 =?us-ascii?Q?/toZZ2Xt4kcfZz0arvrH1kTev5lxDjw2wzRBAc6sLF0HoU/rtwH8GcWevyr8?=
 =?us-ascii?Q?JilfMciKVDYZfY69TuN6Xloii+fPKi+1tuQ+VwuCuTwlgC98JnWb+wv/iIHc?=
 =?us-ascii?Q?9AAmGSDnwwtWGF6BBO2eyblTR/qimFjKeNGA8PlP/D4vLEyt+vck7jb1SJHK?=
 =?us-ascii?Q?ZoedLkr5V3+woBrPP1DvkELM03i22G61BBVkYuc57r7iKEom1KBdVbLdON0P?=
 =?us-ascii?Q?b/kRlqvFyshaEPSkZQ241bOu7SHoZzHuEXcsmExH1Bg3urYhS0/8kNidE/Oe?=
 =?us-ascii?Q?Va0hJ877RkXH3syOFZk6F3aGFO3onDycxMBtF1L5/u+vDUm7ptpmzk+gXJ/A?=
 =?us-ascii?Q?Tane8Z+VBbgukgvG+N4vl0I3yFXYlIzzA18hmtL2iDcEr7mqy5h9wV1ab091?=
 =?us-ascii?Q?Q6jtUh4uCk6djkNxaz8atK8sPUHGnhvkRXclLNA7rnwi/+8Fcdp/eftkQXwK?=
 =?us-ascii?Q?ZR/S3Bql7RnMk6+bF+9XE/ty8DnqVL7m6Nh6q+tMfHKQk9X30u+iSMAkPxZR?=
 =?us-ascii?Q?AIPiKriVhJhOXeGXljaRvyhgGC2BDPcFtH89jraxscMHRA2R+Gq/TOzxb1Fy?=
 =?us-ascii?Q?QswW4gx1YM33BhxJgZIrnG+XFI3KNvEUKZehCBSLXXdcWBGc7BiVEHzh5RtV?=
 =?us-ascii?Q?vINsZvcDqk9VhJ3N2zS2it7v8foIZPViAdlYXgLyUZsCyxgX9scVfVcNnpdR?=
 =?us-ascii?Q?ESlX7oKjIbexy6Ah1CAqRk03tiAALouilXG0vaGjJNSC5GOXR5HYmUJQkPzA?=
 =?us-ascii?Q?K9LOOzy5vj7AC/mqLn2UgGwlsp3MkDM4/CxoIanW49hBSbsdWoWAhrTRNgxT?=
 =?us-ascii?Q?j9/joiXtNMHoQzpe7Y3HzrKwVzFXpl0ORQVN7pA0rW8Im9lHFNhD3VcwSNUx?=
 =?us-ascii?Q?cBzX8ib2D/Iuk7UJrKOu+kSHIS6tiIcrXFJOWN3gN3PHXrkGLbECMQn7pcWb?=
 =?us-ascii?Q?JCYNS94=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UcCvY22JTQmufmrRf+P1+fJbVLPPvikqdksrjW235BkeKM4B1c9zr23M+YUd?=
 =?us-ascii?Q?fdVoL2ZUNze/fhZCivo7lh1oKrT8MtqrGiMAt+EZnOElTWbp+h09CfdNZ4VS?=
 =?us-ascii?Q?g7bSAMKG9jok1R991zmQmtDTCApZbjnpCFQHwDgd42r0LG3lTbIfggwpep2m?=
 =?us-ascii?Q?GCCFfEqSd/wSCqj+vyIHfrku1qgdQbwUbfKg+XoduqOwbL7ApWV4/SXCxLuf?=
 =?us-ascii?Q?uVYw2i/FZimvB3c4gcJpXsKT9PMNAlZxWNpGja9Gc/wmMc774EhYEge5ZPEa?=
 =?us-ascii?Q?2T6Jtj8Cs6P7nu6C7ict/gkdjXHz0uwh1+pGFe8RXak9f7LU77rL3pbuxnIS?=
 =?us-ascii?Q?Dh+gqcEBs65fi/uoQJ0F7q5MevbySv0DEoYr4AuNITVKpCL4DHCUuzZJf2Zd?=
 =?us-ascii?Q?nDKPJxVyTTh9NINDjwNAG5K7yd3/QJEa8hvYK1G4xKKXjIFr9hgbVEqHpmUN?=
 =?us-ascii?Q?+uS9cPvBbkRmAJ4Kc4vYknSQ3YPZIhh9CnhOOAg7yjRLzek9U/s7026yi09C?=
 =?us-ascii?Q?t9f3ySErXNSBXt6OgXYgB61aaJMnDi8HLqE2kq2524N2puA/vpJo5jRlX684?=
 =?us-ascii?Q?poZpUtTNttMeiqEOsSHQLGwYgPydRh4LKvFHHWzTk6ACkxtFfj46IAHqnlKF?=
 =?us-ascii?Q?zAGEHiHZjLgpI/hpyT6ROTcBF2T/E4AX2SfkwvxGCdMyL1AiUY8hQP18VCTO?=
 =?us-ascii?Q?l0RqieH9jorlrTatDNf22lZ7zPQQsmhjYN5boPyWe7acD+gPr+FhbPrm3jCa?=
 =?us-ascii?Q?7SyQ/G4f/dJ87DAYv9qCs0TDE/FYfPln9l7e4NyfVlSOkClHyb/zwdk+i9IC?=
 =?us-ascii?Q?A3GsMlBnDj4FzcVRMGRWs30RCNXFzEzM5R+2gJW07q/PhEBRvU+yB4QXcJcB?=
 =?us-ascii?Q?ei0MWcIfLNfMZ3ZJyX2gQZWxIkO9vFjflZ2maumOWulZLl/G2jdbrxK2eu6k?=
 =?us-ascii?Q?5nXYverb+e1N43n3DNbJpBRlTtsopMXej2aCEdB08xFfYIIWV3YFPXzB6f6j?=
 =?us-ascii?Q?wATeNxnD+8JwvAxmZCH+u0dq9YE70tb7WUZ2vuY2om1Jf+B/K1FFAca2ZpZV?=
 =?us-ascii?Q?aNM4uSI1P1bNvMu0F+m5Gc6Bkz4D8EjewBL+BenvarUB54YbjpOOYKFHkYZ8?=
 =?us-ascii?Q?HQD4mO8NWd8zTxJ0foF7Yyi7Up+wp1ivh5sTu+2iEkWeviD6dxgnnVNj9g9L?=
 =?us-ascii?Q?SjxdTtwcIC+/VktHQPA8TXRZo3pkHHL53JhQFqaa6Xib7r7zGcgTOM/KSodh?=
 =?us-ascii?Q?A9TuYYxQKGevJcaeNzu/b1LJjJnsF7sp9p0NXbQN/gtVoOEYzrelGg23N+Bv?=
 =?us-ascii?Q?25n3WJPSi8NPK5akn/0EY6hgQTsulOeNxSMiqS53Jz/N1G8m87wX/JXOPRQ6?=
 =?us-ascii?Q?6vJOQFfXRf+9HhHXhyuyUM5TrPAS+maTA9fv0fwylXZxQo610H6MeBwGM8uz?=
 =?us-ascii?Q?oDqnaynw5TcNJ71idRwPsj/UkTitafevyiKzMVUwyywHBW+Oq3CssPg0u3UW?=
 =?us-ascii?Q?xolti/C1PRzTlZo6nBxraHrye0hIhNepu74mR0TYWwbnXTnSMlRw9wiqpf73?=
 =?us-ascii?Q?0OUIs56Dg1SfBGn67Wu26EasjK9Sxcf1LQBDfyvfG85/Yhsd7/uBYu/3iMk0?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3dd77d0-058a-4037-7bc1-08dd81b0b29e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:16:46.9102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVwFzeTnwlgU4iKpGOQ6+QvEeSaHVwbjboeDzWVPl4HvD5UKGJQi6fF0xyap3pZMWIr7jcXjq+mZgnSouLbmOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7243
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

On Tue, Apr 22, 2025 at 08:06:06AM +0300, Dafna Hirschfeld wrote:
> replace error pointer with NULL upon failure.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>

This was already fixed here [1] but I guess I forget to merge it as
submitted externally. I'm going to merge the external series today.

Matt

[1] https://patchwork.freedesktop.org/series/146665/

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c7424c824a14..d927f50f2a68 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -80,7 +80,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
>  
>  	range = kzalloc(sizeof(*range), GFP_KERNEL);
>  	if (!range)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>  
>  	INIT_LIST_HEAD(&range->garbage_collector_link);
>  	xe_vm_get(gpusvm_to_vm(gpusvm));
> -- 
> 2.34.1
> 
