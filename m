Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF00C67861
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 12:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A6F112542;
	Mon,  8 Apr 2024 12:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlpT/qRn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65768112542
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 12:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712579909; x=1744115909;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rlYrHghzpZGeb8IyZ+4nYZGASl7xpgE1U+JY2fgJIoc=;
 b=JlpT/qRnolsxyIu++Q6+knTULVgLpRiLNjRlLCkXinR0IewSaDzoKGsx
 UmclEu3W15XS9e46XNP2a83r6Vyix76m5r4BMAwn3bNxhpBSIwxZ8e0NB
 pxWIWwzXNRFf0eZlbibVYTUik61eU0i4hbmafWzhnTip1bBXU8CRKt7cI
 XEl4ePX/Hby+jzLDnurv9fhsGvtfZUfI3NagdGlMz+7pDtSxXOj1hIqhW
 X6+6YbwMLWhGVzo3hzWlI6tdZfRXa5+b4DJXywOEDTuaz4wMjzvOZkD0Y
 gOiaR64iBlYpMIG4cdqnUP6J7ShKLHLFZvvivJN9a11zS8f/bNDOvyQzF Q==;
X-CSE-ConnectionGUID: Adbi4n1iSp+uBcvaVDCmcA==
X-CSE-MsgGUID: mGqr2NlJSVa2NLcwF5Rxkw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="19288936"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19288936"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 05:38:28 -0700
X-CSE-ConnectionGUID: NETtAYQ7SouY5k98EQxFXg==
X-CSE-MsgGUID: 42Y68lczSEmiCTVEkCS+Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24507854"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Apr 2024 05:38:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 05:38:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 8 Apr 2024 05:38:27 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 8 Apr 2024 05:38:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 8 Apr 2024 05:38:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQh4qG22jx7Gg2fIM68HTbTYux85PTcYe9nHTwuO+Do5tZnbZlq8Q5yGqByRyZUq+aKDbL+Yv2cmLVRUc9dPmnv4QIFBt38oJw9E5u8gKnctGgMN96/ZezfdpSWGoByBWR21XxlPxt+Ny8LY5fq+psTe4bn8sCr+RCK3fXsMB151uvz0qRBBurj5QiMFYq1LM7zUJdXvL5SpN5kuN02UX0oh6LZ+WyGxvOY2Ab3GL5Go1Rkev3SRuFobBb49yjvqnzsl0NdslbydxqPtCOPqLCGj9laDv3xLfdjzr7Dgzo6PrI9uEU0IjKI31h1NgoVpEcEIJ89mMRxoooYw80j9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnhfDHn1qf3mTpia+b4cOK4xRdQzny3vd2Tqapnu688=;
 b=PMv7etRTq50InL94y60Zslx1BUzPBxYcdn/4DgQR8s0eGGxHUgBXzF5kOhQwzNaKRMAd+nf/UKWF0pX3cY+Zn7VjTLFKAvu2sGkf0iKOi+0+wFx57j0bT+VHSIU57ZhIKN0OBTpfDrHVfJbn00nNlw6R952mHEIb8OHcRwlRtG511DUzE5v2nHII2s8LRW4zhqRmNEItKkIHOWm8zu3Ok+TnJQkDsPsIRCsI/4+bhxwcGVNuZQL2adCAfuVeRS5tj4KJNEC0jsgXgvcQdm1thmA8UHPBeauAiFTH6+sGcrCcYFhjYLid0jB3HdUEeZhTHFVypHbIQKp5jduMr0269A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH3PR11MB8153.namprd11.prod.outlook.com (2603:10b6:610:163::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Mon, 8 Apr
 2024 12:38:25 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7452.019; Mon, 8 Apr 2024
 12:38:25 +0000
Date: Mon, 8 Apr 2024 14:38:23 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/vf: Mark supported firmwares as preloaded
Message-ID: <20240408123823.ci67mmvqkktoostw@intel.com>
References: <20240404173814.715-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240404173814.715-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DBBPR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::36) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH3PR11MB8153:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ns1Ce85ss5DKFh8Iz2/oPhbfe9/nZ0Nk9bdTNJvYV88As1XqKwBnLPGNcyxuf41X72a2sRVmell7H2Tw5eVviV+kCIgAedl0oPLBb920+a7KTS7cg+Bsjz3zkW++2wrywSsto/Udjb2q3CV46RMeHnLp/3+8C+aC5zZa42P4LEysDcpYpi1odL7EijOHTIBOTSWVQR3i0UNhP/7xfo6Joeq2TpCWLA+MgtoigZOaKANruHV5LyCzKPrze1nqE4h8/fbJUF+42i/FHZZ78XgRMGQav5jGNEa/5qSsiip8b/hx8UwEgCL6YvD+iHSoGct/HTdxj+vUqbPiblWOdTLwAJBsSxBy41+BqezYG/163doviUX+R/e1KSn/h9Ef8Gmj5uxyygOWZar0Ck1+NEgLoOBK9uKkXNTHS9I8wgiG935EbNjDCrfpFTqth6/rKJ36uuyd9JqAwAxVDN2+nHJiXkQmrjh3/s9219R3uCvOB8+LnvtABueGIn702fB2tkapCenwPfaeeye9228rRUXGjIIzvhMuZmvziDaNnC0RPjYNMCPYSUhrh8bA3UfHMksLp+5dhzsCoDVfzq120MUd+zoKdd10OxVSmtBCDc2CBmiy/NFwOBfzrlBNhwjxUnOT1V6KXyfDbemXGcYUSGD/EYfo1gsmmXecUiZ51oaK3VU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWZUbUtsQVM2RG8zREQvZzRadlFTaHJ0bWh2b3dWamlheUphSTl0Ri82SExh?=
 =?utf-8?B?aGpQZmgyUkpia0txNFNuYzBMQlNHcy8yQ0szMklDS3JsN05ySzBFbHNVQnF6?=
 =?utf-8?B?SGlYQXc5cS9uNnBCQy95YWs1eVdtRk1OYkJsampZTWdBSDNpeGRETWYrczdG?=
 =?utf-8?B?Qy9EcmJndzhrN2JSdDZ1ZGQwTUp2WWxzZTRQMGN4RjRtcDBSbXNvMk90TGFY?=
 =?utf-8?B?aUF5OGZHQW03SUVRVlBvcFJJc2pkdVNwK2tRUVRMbnBOR25PQVlnSUlFM2d3?=
 =?utf-8?B?R0hrb0tzMHVxWkI2em1EOGU3MWhRS1RwSzNnenlGTFRaaSt4bnExVlRSbGsv?=
 =?utf-8?B?ZTV0VUJxbForTUJtMXJXcStFU2xaaStudW9BMDB6Y0FyWkR0Vnk3Tmc0c1hB?=
 =?utf-8?B?UDdVbXZFSVJUYlAxemQ3MFZGWUJEZldyMXZ1NHdNTk9EOXZ6SDg3WVpmamdY?=
 =?utf-8?B?ekNVVjZMeTZNMkNNTERxeU9LZjlZTDlPeWREUXBUQ1dZUmRyZDBqTTVLeG1I?=
 =?utf-8?B?M1R2Ky8wdm5tYlhNcnJwME5oVkZPbUJDaFh4OStRYndBSE1HUlNOK3E4c1BO?=
 =?utf-8?B?aDN3Q0xsK3dMMnRHSm9wTTNvZkdnd0xLWXBBNUpWeHIwVC81ZmlqYnUvV3JU?=
 =?utf-8?B?c0VTbTExUS8yR1VKZDNYVFFkdEZRdUlSMld2NVUvMTJESWR4ZVhFMXltK1Qz?=
 =?utf-8?B?ZEtWeEIyTXJZOExMQnNjL2dlSlhxSEJFbUk4NzBvSmZSTzhxVnNxczdhKzJN?=
 =?utf-8?B?WkljTUlRS0k5L1ZWeGJ6MGhaK3ptbFhLbXZxODFoSUJwckNQcjlNS3Zwam5H?=
 =?utf-8?B?ZEVBN2FxVEx2UEN0QzczUmdqRWlQQlo2bFUyRDlMaU1Sb2FWSmlHWlpmTkhN?=
 =?utf-8?B?U21nZ2c4cFJkeXFsanRneWljN1NETlpDOWluckl3bWJWTWo3bkJFMGtGZmFi?=
 =?utf-8?B?eFFlZ1h0aFNEcFQ1RGNJYlJaMmljRzdUQ21YRUtPYzdkQkdpM0ZmbHR0cktR?=
 =?utf-8?B?UklwejIrSEQrcFFhVWlLamIzbStTenAwS2Y5ZW9zSEN3MTkwbVZwbTdkQVhD?=
 =?utf-8?B?MlJ0UCtETGhmRDQ4TThpSzNZQmlrTkMyeExtWG45Y1ZlT1E2WE1xNk1nNlpZ?=
 =?utf-8?B?UTh2SFkvbDM0YzRZdVBCTlRsWUFXczJDY3B0dWRHM1RibjZUWHJoaENjSkVs?=
 =?utf-8?B?TEpjMkRURVZ1MVAzeGk1b3V3WVdMMmlaeXFPNXEyaU1zSXZRbFp2K2pjSFRp?=
 =?utf-8?B?Q3kxM3l1RlBlNWNXUTBIWnpwQ2dndWhkWEd4dXFsN1dTVnl5bjZzVHpJMEVD?=
 =?utf-8?B?SUZkVURYdHVlWHg5QlZZZWJMd3NIaFJZeFBqM01RbWVjR0FHbUZkSS8ybjVC?=
 =?utf-8?B?aUdxSUFBMW9sMHZwZERscVlmcXlTQnd0cllsZnJrZjhVYlZrUzJXSWsxeUpB?=
 =?utf-8?B?b3p5WUFOTmhLclljUklMWHdlQXhqRUkyU1lDNmNSVUtmdDRkcVBYVWFTQ1RU?=
 =?utf-8?B?S01YdHNYMFg2VU4vaWFQWVpRRGFUdjdXRk1WNkdMLzg0Q0dYNzZ6RWxnYVNi?=
 =?utf-8?B?Mml1eEdGQjVSSlUrVjBsUm11dU9JT3g2SnlMcExNMkRaMHhoQ3ErVmU0UU1X?=
 =?utf-8?B?Uk5rUUpVUXJNWlYzQUZTWnpudVBwR2J1VVpQTWZWcGRVcUhIeFJUTnVaeUJ3?=
 =?utf-8?B?VUNXTjhJTk5acnZWZ1l0TUxUU2orVzFWd3d4SGtoTmxVVTRnTWhDSUNIU09l?=
 =?utf-8?B?aHltNUo2VFlsaG8yWEl1VkQxVVdjdGlPdnR4K1J0WVlNWktqOTJ3Sk1tcG5o?=
 =?utf-8?B?K2UrVWx6bHJFblVqMWtDTERCNzVDRDFJUytab1VtMm1BN0xQUm5tREhnWGxr?=
 =?utf-8?B?NCs5ME9vZTExTnk0eDNuaGpiTk85OXVNMkVBd3FBWDMySDNZekM3c1JIR09a?=
 =?utf-8?B?SW0wUllCUXBNS0c3ekZpUXNhakNoc1lSSVZEQUQyNGZmRDZvVXF4UFBmWitw?=
 =?utf-8?B?QU5YRW43TzNrNGp4bWIyTFB2eEwzWDQvWDZ3b1VzenRmeWdSeXFGalRwQ2Vw?=
 =?utf-8?B?R0t1VWVyV0hRaUkwRGR6cGJ0L3pyaGx6SzkxalB6U3ZPWFltK1RiZlVEcU96?=
 =?utf-8?B?OEFpWmpEZkZQbVlieEpRSDBuTy9WRFl2OVBVdU5hZjh0ckNCcE5DenU3a1JQ?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 928b0f64-4d77-43bc-bd28-08dc57c8c8aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 12:38:25.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/fi7mP7fgzh1xRMUFYpH56rs8ys/Fuc9VJV9MDRt7jabIc4kbTPm2wQwgwiCBheu3k50kmtmbHj7OYBywVwVMEjPQhxwRZEawbOV3LDf9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8153
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on czw [2024-kwi-04 19:38:14 +0200]:
> On current platforms supported firmwares, like GuC and HuC, must
> be loaded by the PF driver.  Mark those firmwares as 'preloaded'
> so we will skip fetching and loading them on the VF drivers but
> still correctly report them as 'running'.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c       | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_uc_fw.h       |  8 ++++++--
>  drivers/gpu/drm/xe/xe_uc_fw_types.h |  3 ++-
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 6adca3a0427c..f27e96c47baa 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -17,6 +17,7 @@
>  #include "xe_map.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_sriov.h"
>  #include "xe_uc_fw.h"
>  
>  /*
> @@ -652,7 +653,17 @@ static int uc_fw_request(struct xe_uc_fw *uc_fw, const struct firmware **firmwar
>  	xe_assert(xe, !uc_fw->path);
>  
>  	uc_fw_auto_select(xe, uc_fw);
> +
> +	if (IS_SRIOV_VF(xe)) {
> +		/* VF will support only firmwares that driver can autoselect */
> +		xe_uc_fw_change_status(uc_fw, uc_fw->path ?
> +				       XE_UC_FIRMWARE_PRELOADED :
> +				       XE_UC_FIRMWARE_NOT_SUPPORTED);
> +		return 0;
> +	}
> +
>  	uc_fw_override(uc_fw);
> +
>  	xe_uc_fw_change_status(uc_fw, uc_fw->path ?
>  			       XE_UC_FIRMWARE_SELECTED :
>  			       XE_UC_FIRMWARE_NOT_SUPPORTED);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
> index 85c20795d1f8..35078038797e 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.h
> @@ -59,6 +59,8 @@ const char *xe_uc_fw_status_repr(enum xe_uc_fw_status status)
>  		return "TRANSFERRED";
>  	case XE_UC_FIRMWARE_RUNNING:
>  		return "RUNNING";
> +	case XE_UC_FIRMWARE_PRELOADED:
> +		return "PRELOADED";
>  	}
>  	return "<invalid>";
>  }
> @@ -85,6 +87,7 @@ static inline int xe_uc_fw_status_to_error(enum xe_uc_fw_status status)
>  	case XE_UC_FIRMWARE_LOADABLE:
>  	case XE_UC_FIRMWARE_TRANSFERRED:
>  	case XE_UC_FIRMWARE_RUNNING:
> +	case XE_UC_FIRMWARE_PRELOADED:
>  		return 0;
>  	}
>  	return -EINVAL;
> @@ -134,7 +137,8 @@ static inline bool xe_uc_fw_is_available(struct xe_uc_fw *uc_fw)
>  
>  static inline bool xe_uc_fw_is_loadable(struct xe_uc_fw *uc_fw)
>  {
> -	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_LOADABLE;
> +	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_LOADABLE &&
> +		__xe_uc_fw_status(uc_fw) != XE_UC_FIRMWARE_PRELOADED;
>  }
>  
>  static inline bool xe_uc_fw_is_loaded(struct xe_uc_fw *uc_fw)
> @@ -144,7 +148,7 @@ static inline bool xe_uc_fw_is_loaded(struct xe_uc_fw *uc_fw)
>  
>  static inline bool xe_uc_fw_is_running(struct xe_uc_fw *uc_fw)
>  {
> -	return __xe_uc_fw_status(uc_fw) == XE_UC_FIRMWARE_RUNNING;
> +	return __xe_uc_fw_status(uc_fw) >= XE_UC_FIRMWARE_RUNNING;
>  }
>  
>  static inline bool xe_uc_fw_is_overridden(const struct xe_uc_fw *uc_fw)
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> index bc800b696866..0d8caa0e7354 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> @@ -50,7 +50,8 @@ enum xe_uc_fw_status {
>  	XE_UC_FIRMWARE_LOADABLE, /* all fw-required objects are ready */
>  	XE_UC_FIRMWARE_LOAD_FAIL, /* failed to xfer or init/auth the fw */
>  	XE_UC_FIRMWARE_TRANSFERRED, /* dma xfer done */
> -	XE_UC_FIRMWARE_RUNNING /* init/auth done */
> +	XE_UC_FIRMWARE_RUNNING, /* init/auth done */
> +	XE_UC_FIRMWARE_PRELOADED, /* preloaded by the PF driver */

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  };
>  
>  enum xe_uc_fw_type {
> -- 
> 2.43.0
> 

-- 
