Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D34CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 19:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3795010E844;
	Wed, 29 Oct 2025 19:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2SZTaLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4CA910E837
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761767489; x=1793303489;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e4ogefNCa5euqSO24Zf3tNtwfsrEfPvafkUVnUVWd10=;
 b=i2SZTaLechSj9dxetwK0Smv8y7WhOGX7W4OBsfDCBcno+/cCaTxiaJ2y
 gCyNkquccRGCdV5bwHRmF7J0pIlJ15Hlvq/qdgKf/M1Am7D1HNGVyEdBJ
 X+iGkbipok6BjeaWVfCb5VmfTb5Fj+wduie2KyXx2DrQLrrKAv1SyMYdF
 mXubin6bjRzqAAmbew5vmTNrVWSVp1PAlSKNX9tqL2nUpQb6sRksduirQ
 cFADPFA53FOz0aVeyOxLrhgOunyJ9E2PI9rlmss/w46K+kkg8FVelitJE
 eIweJpMhKJyOP9OH/m6q9yeZptQBLKzLBCVpamJHCVGiJ9YMKodCqBVFj A==;
X-CSE-ConnectionGUID: hYWxLx9wTqCag7TDJ9YdMQ==
X-CSE-MsgGUID: r5wvUGz6SqK0KT+JppDliA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63939114"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63939114"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 12:51:29 -0700
X-CSE-ConnectionGUID: 2KgeB3TbTWaQ/vVyy1mecw==
X-CSE-MsgGUID: VXeezF4rT766QPsJsV1/XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="190075675"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 12:51:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 12:51:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 12:51:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 12:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwZCSppqWbzBiSJylpaYUbXfqTer52n7VwcfFp8M9FVrFc+Wh9feiuQcgxa58qGoBqwDA77kjzgXEkf7NeyqVv0hmnrCNiRA0V8lPEX+8ohAu76kswMaXBeVr0lPVPBqxC0nqBWpuFuhg73oe+vfh3oP+QJ2vrI6WZxclDlHyXSicv8sqNWGO/tf3GOhw+eB9SNiJoewQ4/UmwAPnwL9/0TRz+X5IrXhM1ykGXpze0+OCgOa8jfadNLBzSxucdkN11uNbahEOl27SrCuA2/pAAMQxEt4yz4A57tSSFKq9Ki9OHzqgEtXIvoeM6lW7P+gnraIJkbJWppP+F+VsmH/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvgsbBjE3mZCcSrTWogfmqQiMMy+4RIYMXtZHkspO78=;
 b=UDwxXGzjE1ylEIOneJynILBJtkycgKZ1IScxJXprSYlccMODPNVu7sTmikEeJzuFCQg+Qh25QleWykeQ3LuhiUxFzXzj2uwouMO/HspoivAtUgsuNBhv/MsVW7XE0fVV+bWS09z7dD99Jqh0Xe3Z81YR7j6zpSdmyiBpRPIl5ceLILNxT6Esvt8+2Y7wgYQNCoSKpYIgb4JXBS6nDZB1XnMHd6QudfxI7ziU9qnGTTi4MGu8YJW38SLybqlh35gBLzCWJgYrJhgl3ImKbqVNcxAy0GBbS2/v+/qEbSGEjtZodg7yGUq1qojnCNttWAinaYfM0A4cgqR6907cI45xYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 29 Oct
 2025 19:51:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 19:51:25 +0000
Date: Wed, 29 Oct 2025 12:51:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Inline gt_reset in the worker
Message-ID: <aQJwO3RMyifEMg12@lstrano-desk.jf.intel.com>
References: <20251029-pm-comment-v1-1-fcfa906dca25@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251029-pm-comment-v1-1-fcfa906dca25@intel.com>
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: f6755f2b-b197-4a5a-3f8e-08de17248b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LKkHSy5sj9CZ+GDZBrao9jnwLh3xiqFwvxz6vxt5ilaqXjgv0msn7DZig54U?=
 =?us-ascii?Q?X0iNNArd9QAKXRaNz5LKihrdnioqRM49dPtqON/Zc1YfwCIM8rgihYt96fWU?=
 =?us-ascii?Q?Yl7SComSLQOAHmsua9+Gc5Js0ZqyA+h+bU/VuNmcS65TJaP+HYww/Zny1Aem?=
 =?us-ascii?Q?E4ZPVbY5qcGv4gs5AoIOuAwI/tGI5ILBVeM6+HxDYJBrzyiQTOJMwr9bMixm?=
 =?us-ascii?Q?n0IPh3LDvyvDUqCBg+sONm4hXZiWVRFze3t8ImuWqDSLeAMtCjdVzESIL1pm?=
 =?us-ascii?Q?pTqiLfEZ7sk6lh79N96T+wCENx/thg1ezE1R8BJeXPQ8nA3go4uf0ZlMcc3F?=
 =?us-ascii?Q?IYP7cQkezZuap30ubfJQ41VefiJwQTel23W7o1vjBDWWeSnzmz2g1nXQn+IF?=
 =?us-ascii?Q?wRYeUwI7gL8mNWeKTOsKRX5Iwhv4VZChdn4KIm0QhkEbFtjkwwoHoCWciyGr?=
 =?us-ascii?Q?CTDLOulMMRYmJczp4WM7w4nEluMi45oB9+ZE1XBGE7Mgq2h5Zmr4BM6kd35r?=
 =?us-ascii?Q?S1syr30rT7ANOKzA4pW2MGpvTZCuZwtk6GB1SI0h9oIMc4yqo6qTqhHMQrsu?=
 =?us-ascii?Q?hYPFOg3zxJBHD8+7epPJyDJwLMUrZswjc2r3PQtzQzg3W3UysSqlvWDuWHgx?=
 =?us-ascii?Q?HiUQrGoKNrKDNi6qAoLluKsqG4vi17X4cWRyjOk1jPnVpx2zlycYVex6bEjo?=
 =?us-ascii?Q?4tnGvf0AoWPeDzNpObFIaWvrSx0q1pVvkeHkrvPeq219qkKQCo6mu18uIZAp?=
 =?us-ascii?Q?4jTB21gpSRnVFR67snekTZQVPgeeQXpBspSTy8+q1tvIbphh9iRQeBMVCoiR?=
 =?us-ascii?Q?/TLQ5tuhfp7a0va/94Q9TsJGP+9fb1C6QhlPhLcknLItAnBkqDClrHLUqQHb?=
 =?us-ascii?Q?22kB9Ci05DuMn0Y4ZCbT+kOSDOzscbnBtVbPQgUf8w+dlzH9CoX6gMxaiGlk?=
 =?us-ascii?Q?JdBX5vPydpLr5gdwjqolAcMHdUzIsrKORn8QxeyaJAHsk7Lav+k+sBtrxqjf?=
 =?us-ascii?Q?+BsqB3nUo1tfiGQQ8rjBX0eULe2bVKEfoU1HG4U1m4Dkm7sO1bnRbtf5txoF?=
 =?us-ascii?Q?834U2lowRLj/f6phxyoxO3lobwCG3erf38BTuiCsaHquLQTy4m+8YcD6I1tm?=
 =?us-ascii?Q?SWOnRNAMHfzhQZc/RI5LqWBv7mUqb4y+sl1a91vl+BELRnOuY8MqG3KR91pL?=
 =?us-ascii?Q?8YU/5VTipOMeM7Jt/O8NJWgFAiGdixx6JeobksAhkuBNidkoB/jqobVrKBel?=
 =?us-ascii?Q?tb4yyR7o1nftish+/GIcornwErGrGf96L9QLpU3rruaZdpt86Iiq5muOCSwg?=
 =?us-ascii?Q?OLvlEcq0ITxj84NE7qGfW8C/S99IkRw4Sah1EmXYfqiQ13FLJCMG9HjtxXox?=
 =?us-ascii?Q?/IDHzVyJ1DShuQzzSMnme0qdZMSzy819nI2YllBWEfcVVbKIFc0OyI0/i+0g?=
 =?us-ascii?Q?XdSao9BKpTM0ZwUGLZQnEp3ynjwupqLA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?856lQJLuvJipJpXj8hTy2pgBgLgLFIYKs98cvi98qE0au+bfRCaEt4qhs/CA?=
 =?us-ascii?Q?WACTrxmuiTUj/XVjCPELm10CrKCdBFAixlfQ0ofX0Jgm1BIWw4OBQSkuVp65?=
 =?us-ascii?Q?l6DcyKVCkSowxmIVpOqMyaRYWpY94QDUfC4lbbdZsRCT+sQYMVkb5ICw8ndq?=
 =?us-ascii?Q?9A8lft9EXq1MK1lWwMZiQz4QcGCHxKLmKRgFpVSc8M4RTUVhDq4P72gBj7yT?=
 =?us-ascii?Q?M52oebkxk9xZTIfgSQCiTisPkel3gNUARrVXLaassiDJ4F/T+dqR5utiyoLF?=
 =?us-ascii?Q?+kkW9ncBl84dEL8LsqlPoiccR6KZ2xvz1X7bc6mSDSehkrBH2GFgLqDwJend?=
 =?us-ascii?Q?KEidQ1bGdDS8FkHvkoWkfqzpnkE+CMPusHZ3Z0mjc0bFx2OG4H/6ujasrhy6?=
 =?us-ascii?Q?eF1sxgFzBQECGIqTPy/YVpMj2ON+MZavWf+YLGtzyZLQo7OyNumCFeGZWjsW?=
 =?us-ascii?Q?5T5lS3LeUFJRy1xqn2F19sGtTYbhElrDtVugxPrFOWojxdxio/USnrGb/vTn?=
 =?us-ascii?Q?yTfkmKP3FuqYh2NJmuWWaeAiWLWu1v9/h+FjQbXzUrJktc2Bs4a3ldl3ohkB?=
 =?us-ascii?Q?5hKXJgKDDU69+1s0AuvO9c4eyJ7FNF+QlXrAe1TmXxujBtfJwzr+aM8umx/d?=
 =?us-ascii?Q?VZHCnEQn1WlRhefwmz2g8im/ge902d9XJDL+4m9assZlK7Ccx+YlaTNrvR1T?=
 =?us-ascii?Q?sdkU98equavWg982P8N08Fxy5pUsTwXHtZLWy8HUX7jXeOm4L4QLvsT2o0bX?=
 =?us-ascii?Q?fA0QTC04iUtXhRd8W+5Ey/Z3lOH/vEnEh0WDihI/6cb51+IG/WaZ3v38waZ9?=
 =?us-ascii?Q?auNJrztzkrGFR7PQ5YriLcIQLTDM9W0dF82N6tQDitIS3QhIAP56jNDD7Zzp?=
 =?us-ascii?Q?MjPVFwCnub/xLbbSZZLVeZeMP5s93kaVvKEVvQ+J517czA+1Uv4rCGUtlFO6?=
 =?us-ascii?Q?vTO1s12qtZjCRs5Tuo3bS3Bqza8fnWibpnYvGfHDRcnuiOLj/vWtkKLgg5EY?=
 =?us-ascii?Q?1M89283a69wvukS2FjF0yTSxSvoJ+E0vq5iE4XNJK0xN7ldlGrIml8XoTlAU?=
 =?us-ascii?Q?PLv+QX8t+ycJRS7KhbBhc1HvwGKts0NgAccqLE5w9VKgwHvWPtSZTIDPM33s?=
 =?us-ascii?Q?eCIaHbKT72/MjFKRewq9ILhIF8Xyuz3YOR3ljZjaVtD26bg5Kxj6mfoOHWQ7?=
 =?us-ascii?Q?JgpssgZk1d2Mys/rsxeY/Y1eZeBbqhl7G7FTKp5OepejYRIm2UDtnzWbaa6T?=
 =?us-ascii?Q?RGeyNy3vAvOx8CVR3PS3uTqIwI9IY5tObzGWt5eURptJszRTJ4SxuMBY6Ldn?=
 =?us-ascii?Q?EzSNY1UGHfBSuA/3yODdaY5h2E7UISjBvr2uf3mfiI1FT+n4SxHatZIg/2ws?=
 =?us-ascii?Q?7KWKoHsezn2RKUEKXwQChPByA6g3Dk5OZm+bTdv+QKAERw5Tr05lQgv/Sabe?=
 =?us-ascii?Q?o0QW3pJhcjGvG/6grG4SiD6Cyqsg2RCqTK+IkRh7yNU8h4Xmuv2E/FFOyfig?=
 =?us-ascii?Q?tAnLoKVEKpYASL3JN0brhDYAdCMkmSzvpEJkdeXkvXIid6oOLMCPa5yyDcjT?=
 =?us-ascii?Q?/I0AjjGI7JZZedm34VriHCJzgEq78RJz3X/VL2iMMRqwgHd7l1FBldVxmr+K?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6755f2b-b197-4a5a-3f8e-08de17248b09
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 19:51:25.3985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wb3IAeBTZWPY7k2sHaoeTFv5Ch74gEqGr6yPyytlPziTgQdj3eobUbleW7545RDiMu8cqGjA9W36JIqmw06JfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
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

On Wed, Oct 29, 2025 at 12:24:59PM -0700, Lucas De Marchi wrote:
> gt_reset() doesn't make sense by itself: it can only be called as part
> of the worker. Inline it there to avoid it being called from elsewhere
> and clarify the gt_reset() vs do_gt_reset() paths. Note that the error
> return from gt_reset() was just being ignored.
> 
> Also add a comment to the xe_pm_runtime_put() to make sure the
> get()/put() pair is clear.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 89808b33d0a8b..51d6b4e4e1311 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -813,36 +813,29 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> -static int gt_reset(struct xe_gt *gt)
> +static void gt_reset_worker(struct work_struct *w)
>  {
> +	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
>  	unsigned int fw_ref;
>  	int err;
>  
> -	if (xe_device_wedged(gt_to_xe(gt))) {
> -		err = -ECANCELED;
> +	if (xe_device_wedged(gt_to_xe(gt)))
>  		goto err_pm_put;
> -	}
>  
>  	/* We only support GT resets with GuC submission */
> -	if (!xe_device_uc_enabled(gt_to_xe(gt))) {
> -		err = -ENODEV;
> +	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>  		goto err_pm_put;
> -	}
>  
>  	xe_gt_info(gt, "reset started\n");
>  
> -	if (xe_fault_inject_gt_reset()) {
> -		err = -ECANCELED;
> +	if (xe_fault_inject_gt_reset())
>  		goto err_fail;
> -	}
>  
>  	xe_gt_sanitize(gt);
>  
>  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> -		err = -ETIMEDOUT;
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>  		goto err_out;
> -	}
>  
>  	if (IS_SRIOV_PF(gt_to_xe(gt)))
>  		xe_gt_sriov_pf_stop_prepare(gt);
> @@ -864,12 +857,12 @@ static int gt_reset(struct xe_gt *gt)
>  		goto err_out;
>  
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +
> +	/* Pair with get while enqueueing the work in xe_gt_reset_async() */

Nit, I'd add commit on other side of this (i.e., the get) too.

Feell free to add that when merging. Good cleanup.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	xe_gt_info(gt, "reset done\n");
>  
> -	return 0;
> -
>  err_out:
>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  	XE_WARN_ON(xe_uc_start(&gt->uc));
> @@ -879,15 +872,6 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_declare_wedged(gt_to_xe(gt));
>  err_pm_put:
>  	xe_pm_runtime_put(gt_to_xe(gt));
> -
> -	return err;
> -}
> -
> -static void gt_reset_worker(struct work_struct *w)
> -{
> -	struct xe_gt *gt = container_of(w, typeof(*gt), reset.worker);
> -
> -	gt_reset(gt);
>  }
>  
>  void xe_gt_reset_async(struct xe_gt *gt)
> 
> 
> 
