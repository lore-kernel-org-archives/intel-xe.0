Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305C3C05052
	for <intel-xe@archiver.kernel.org>; Fri, 18 Aug 2023 07:16:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2C610E46E;
	Fri, 18 Aug 2023 07:16:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7CA10E46E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Aug 2023 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692342984; x=1723878984;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XWv6j+6/CU/mhZ24IKk4cCRYcfmZylSw0dFzcLOGNPg=;
 b=fS0v11Nvyf5R3PkSV5uLt/HBtcClYcCqAMdeUnmpj+qFN/9GrFDteCjD
 RwFS3gcAQcf6POiR2w/HWnQc2vq0jNyJogFi5AcqoW2sRKfZhYb9cZVvF
 KwV0pKRBsGGkLn90LdprGJY08E0iuQV9WkBeldajb9kkSqVdGFzrwv7gS
 ftTHB/mRXz5nqG+E35YIY4UrnV5MBAoJAntjt/0pF1khpWEi3HhRmnkkz
 pkIDtoTInRw5b5EsvEaBH4Y7JQ9Rg5CzXg1GX/KsKLrXQ5zjGkFvY+sMe
 5raTfZUbIlRe5pCZu/vHy+W7c+I6Xx7Qz5LkNOE9BqsQwKGg011aiUWxI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376791632"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="376791632"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 00:16:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908755624"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="908755624"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 18 Aug 2023 00:16:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 00:16:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 00:16:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 00:16:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 00:16:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuZc13t9b+Q9mU+fhdLAc1+oNULuSV27CchFvo4xT0sysN8vYb0iJn+qugz1IYvs6yLERhug8PGsGH+RLUvTXbzMMBeMHmvDLiFiawsjxjSyRW3YqdNmdCvkD/u9NNW0nGQQLNYi47xqpi/bpDg5IIJor1fv5Bw4sBy/AsJ2PtcEI6ayE1Jti2BA2bfG0NIblOn5VIaJwgImmXwqNb9lzPn5DeaGrs2LZT2M56sg8WoE7sMkwZiFruXf98+Gqqygg2aujZwfUl3HmmpXoTVOwNAxT8OejeSzZlpbgYqoGiIPz7n0RKCTuVCKAcMVtL275V0ZPDpznU8cVy/X5ujwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvDiF5AntiWLGFT2f6UatY+TMmg9+daC7lYUaX/o5JE=;
 b=kWIR4P6krlQL1rtXKvl9GVNYvhmirmKXjBfkocH0cIMS9aOGclMUvWAj7L4iE0ZmcD9WDg72GlBbr50NA6M3JZ0Z2QHy87HUntQNlxy5qH9FxI1RPhrYQ5gqgl5AF60+ndpYju0rORDHn34WkcBry1+cjXQBdLCE9kY92LydwSwsAB55zX0RpvsXa/1kAU5Nvz9OVrYgDxRcDtnBZvNVRNEl14bqfrNJP9SXxh0a+NBgMv19+t5SpPb7mfW3gVWUUTEYMOYCH8dojcEC5NQobgmGQfBY6b4q0TflmUCxkmQqANi6AWxW13WVC0U5/OY6+RujYFbskRVbd+PwpBYUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 07:16:20 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::864b:5f88:8b9d:517f%4]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 07:16:20 +0000
Date: Fri, 18 Aug 2023 12:46:10 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZN8augpsnh1J+MRu@bvivekan-mobl>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230811160618.477297-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: PN2PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::20) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b11a35-f673-4a59-b1eb-08db9fbb055b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pm9Ys7TJq0flf7/yivV9TmeK9ijPNVGPNL7Z5p5rnUnQIkOM8JJ00b+TOXAaojJKW9tclnuySClg03I4hLjtb+UEG4AoPsGOCvrZPu9tqii+ktbwFHpvH3wmj/wXAd2O5mfSKgwq+vCMQceXBe3Wo4yBpwsY5GfNs/3LuxccDu5MIYf5rBiBElpyZZjT4PUUIJdQiKteX52eCt0C6p8+eMoAv4Dk1FVxOqll0B/YGcloWQaT0NiLDVNgYlg8NhgjDKvKsHXV45d1LEw5rqLAAldQt++cmEqdyAWWJdBp/Rh+svkknJFyw5H3SNzEolbnOYs6RO2hTOr6+Gb5HXEDtpVWTsd+k+9n/sbaEk29XEoeWqtNRINSu6hoQTe8WOVCgtcX7Uy8DM4TiUljMA7kLlYfv91nr4fru2lDNhw3dy6qXUlY6d9B63pgAUvfre9jNgY6o0DCGC9DISjSef3BamnCQ2O6CDINn/pTKZvdPVy4bjrvGuSd4aNuOzUHWDweCKPGpluAcuL3xIT/hTFUQFM0Qt4Ro1+v4ccgmDhGqYG1tq11xgg/lqNpg2+WyzSTFvY9/R/kKrVAmhanjGiJt45PxVOei3Y9cN6iNzojtp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(136003)(346002)(376002)(366004)(186009)(1800799009)(451199024)(82960400001)(86362001)(316002)(66476007)(66556008)(66946007)(478600001)(41300700001)(38100700002)(6486002)(6666004)(6512007)(6506007)(9686003)(53546011)(26005)(107886003)(8676002)(4326008)(8936002)(5660300002)(2906002)(44832011)(83380400001)(33716001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1pZd2ZKdXJ5QUVOSFBwS3d0N1N3Y0dhZTF4YkNUQXF5VWUvQ1RPUHp4dncz?=
 =?utf-8?B?UU1mT0xITjNrRzZ5M2VWbkVXUnZxV0wyR0NhaThVMzFaWEtsSUc4a1d2Qzhy?=
 =?utf-8?B?ME1jYUdWbWdpeGJXU2JuRis0ZHRuSkw2RDViell1OFpGQkxTZ1NudnJZWjlZ?=
 =?utf-8?B?b0VqelBPMENVSEJZdFhmcHVTajBwQVFDSlJSR3hodDZtSTFsUGRqdEJZWVhR?=
 =?utf-8?B?Y3Nva1NmZHZjYjNCV0J2K3RTOUZWYzZXSUVYbVQxR3dVaTRXYVRMbk1vTFVl?=
 =?utf-8?B?T3JQMlpFYS9iVkVGMFlsRkRzaEZzclVmalgxdzRJL2dhV1ViTFJvT3dwdFJz?=
 =?utf-8?B?R28wenNIN1JjeG1ha2wyTWhPc3lvSXZMTkJxdkFCcS9wQytYL3ZXRW1uYzZu?=
 =?utf-8?B?ajN6OG1ZRCs3UlpIWWlOTjFIRmpOODlKYmttTlA4V3pRUnhsd0syWVRoUWds?=
 =?utf-8?B?a0VWb1FSbHVreFovZG11UXY4aHdUWlEyYnRNcmE3OGpsVmRrRkJrR3c5Wm50?=
 =?utf-8?B?K3NBeHhGaWIxRTUxNEVRVXp5VUNsQVFsbm5DaEV1SWkyUjltejVsZ2JzWUFS?=
 =?utf-8?B?UHNCejhUcWZnTHFwUWc5b0p0aGVQVUx2Z242ZUFUL1BNckFaS2pZSmxRd2R1?=
 =?utf-8?B?U0VPbFA4WklSNkxsUER1WU4wa244UmdHQVQvOUhOQkViR0ZlYm8wVTM5Wm9U?=
 =?utf-8?B?ZExqQkVWL3NyeDQvWjgwekhZNmI0TmtsbjlJa1IrU0xsUUZEOURCUlRGMmJ0?=
 =?utf-8?B?MnZ5ZzNDbWlVZGxIOW53b2hxekhOS2tTaVpqblVYUGw1Nk5ZNjJqWlRrdlQ4?=
 =?utf-8?B?YVJsRHhnS3RrRzViR1FKZGFjOTNZaDVDQ3I3RFZwenFVSXJaWktiR0hySmty?=
 =?utf-8?B?T3pUaHFoZHBLcXpoamplM0Z3cnZwdllGWjY0OUJ6QWQ0YXM5RjRhcC8vZy82?=
 =?utf-8?B?aENrejZvWTR2dURTMzBtMkJVUURjSHBNVWhsb3Ztaml6REl2MkpVcTZSYWxy?=
 =?utf-8?B?bkJsVjNKR0Q4Vi9PcTFOSWhPRGxIWEEzR0hkbmZrOTlZdGtQVG5ydUozWWJs?=
 =?utf-8?B?RHNZWDkrd1U5bDhmUTdvaW9Rc0VWWjlJWVVxSkpzdFVNK3ZCQy9HY0MzTC9C?=
 =?utf-8?B?djVsYlNmd3pScHhUT1dRSUhQY2ZFdk5JbWhYeE5sVytrUndaUDBqS1l5TUNJ?=
 =?utf-8?B?ZTBqUE94dFJpZnRyZmg4MWw5THFlRTZPcTNicmdyQWFKNDNsdDVOSkZtTlVn?=
 =?utf-8?B?c3U2MTh3Nm1kQURPb3FVbzcralVsbDd1cHN4M29jNlJvZlMzLy9iazJPYm5F?=
 =?utf-8?B?TCtMVm1oUkMzejMxbVhJTWRUQ0E1UE1Ga2JOdDlzT3FMcFAzVkJMbXNCeitX?=
 =?utf-8?B?bTJxT2NXSk1SRVJEL3hnb2VocWRJU3VCMUFZQjFFc2UwZjdGK2VjMzVUbjIr?=
 =?utf-8?B?MW4vM0RXb0h5d0sybzg1eFBDdzczTEdEZkp6MEtmQmx2YkhXRDNuT3JWaVAw?=
 =?utf-8?B?UEJwbkZjamJoWXY4b0xwSmY5eGV3Zkduc0ZtV3pORS9PbXhZQ3NVM3M3MVJh?=
 =?utf-8?B?NEZidFFaZjV5ZFpYT2REdmNNZjFUd2ZEWHNOYjFvak0xUkRnWmYvTUhMTXE2?=
 =?utf-8?B?Sm90K3FhMENSU3kvWUlGSERJQjFSNWt6RWZnQTZ6OFF6d1JpZDFZOTBJQ1Vp?=
 =?utf-8?B?OWd4dTdWT1ljK3lCeUtIOHhCMzJlRUFhYWEvMnNQVDdLeU1QbDR2ZzA0VGVW?=
 =?utf-8?B?aC9OVUY2UTJ5b2kxalNjclB0ZDAyZ3RrL2lkWnJmc1JLQ1pEanpvSWpPc2hH?=
 =?utf-8?B?YjNJRUZLdHFWUHFxUlpSaXo0Q3JvZHBHY0VHRU5BNWlDVG9tbklRSDRtUkVn?=
 =?utf-8?B?V1BjckNwRm1LUEQ0SVlWWXArM1JUak8rTEpTYThOU2MxQ1pmd0NzNUUvZWNL?=
 =?utf-8?B?cm5EeXErS1dIQ3YxcDBKOFhLUUorZW5BL2ZVb1IxYW9jUE4xNVZUSE9sR1lO?=
 =?utf-8?B?OGJicytRTDR0Nk9tZ1hkM0toUnpodE5VVXpUdmxRQlViRW82aWw2MXNCZGVz?=
 =?utf-8?B?UjFqL1YvNmJBbk5tWWkzNUVnakEzUG1BR04rWGRlQ1MzeTFaTjJKQllpdTJx?=
 =?utf-8?B?blRqcmgyWHBrU05HQm1sdUVLN3g5enNCendubndRc2FFb1pzWDd4dVd2SUxN?=
 =?utf-8?Q?zr04OnzBgfCnopxPeVfEeGE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b11a35-f673-4a59-b1eb-08db9fbb055b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 07:16:20.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEtZY+NuwMluMHQs6SzQeQkYGEzU1gm3wPqq0xpfxjbCKf6quMsLfaQhcDsXPZvbwaTpybOWVFjDbc7bPaIYZU5RKV0NDvQhQxL3Lh0cmvhqRr2PMe86KYtQjWI+QKtT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/15] drm/xe/xe2: AuxCCS is no longer used
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 11.08.2023 09:06, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Starting with Xe2, all platforms (including igpu platforms) use FlatCCS
> compression rather than AuxCCS.  Similar to PVC, any future platforms
> that don't support FlatCCS should not attempt to fall back to AuxCCS
> programming.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 4a474ab04f96a..8c50ab4fdc6a0 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -242,9 +242,11 @@ static bool has_aux_ccs(struct xe_device *xe)
>  {
>  	/*
>  	 * PVC is a special case that has no compression of either type
> -	 * (FlatCCS or AuxCCS).
> +	 * (FlatCCS or AuxCCS).  Also, AuxCCS is no longer used from Xe2
> +	 * onward, so any future platforms with no FlatCCS will not have
> +	 * AuxCCS either.
>  	 */
> -	if (xe->info.platform == XE_PVC)
> +	if (GRAPHICS_VER(xe) >= 20 || xe->info.platform == XE_PVC)
>  		return false;
>  
>  	return !xe->info.has_flat_ccs;
> -- 
> 2.40.1
> 
