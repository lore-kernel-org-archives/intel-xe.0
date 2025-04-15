Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFE8C369B4
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 11:58:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5FC10E36A;
	Tue, 15 Apr 2025 11:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXH9eTL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E1510E36A
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 11:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744718303; x=1776254303;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/JLNEyQrFvVNuWFKd6Sn0zNWHWGlkIMN3cCNK5HudGc=;
 b=VXH9eTL1I+KGmkvI3y8uLeawEUIoDpLzxJeY2VeQ1ZA9w6hqMr/Us3fk
 qPNQfWXYUju5nWzZgmIYZbiw9/aU7oeZM6dl7h32vGTU7WCeeu6tVu4cA
 hnWpSfhsOMcxcqJP/MhxG+Rer7PuWi8VERB7rx5k4nQgr61DeYxMeU/aW
 7WvMbiFQ00Trf/rePNJrv3z/JRRylmdG/FyPBqI16yZTrxYivwQNgsApF
 zl4wlKIolskC4qswc8nv4kWxrXythFxbxtY5KCVY8C6SEiLGFXJOO8Vyr
 kZ3IKapd9AETJOak9hlaDtPMLBkhCstNJSURWsR4FYn3X4B5HKA5iZm/d w==;
X-CSE-ConnectionGUID: pQsY+2mvRoKtOQZnPgZs6g==
X-CSE-MsgGUID: 2vrAbTf4RsG3PM5BKu1+pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45456823"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45456823"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:58:22 -0700
X-CSE-ConnectionGUID: L9YX7f9LSu+7tyWaMupVsg==
X-CSE-MsgGUID: uMn0/B6yR6aroYrshjF3Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130655477"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:58:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 04:58:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 04:58:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 04:58:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc0odngb5oLLx2+P/K8aaHAezWlcSZTU5pOmkTwT5/daMHpllhRmlENStdq2aZKYnWGrAtjDmAf5gOTRIQGQEApw5KkMSKunGpqrYgL5pdUA4bWnETwVQrHmiTGKwTV1jqoFZWUAx1lb4OLW1bCsvu5vyu6OIj/B5opxtqlAQgZZbDC/I4DVT528VyGXydN2+vPYXePftbtaxZZBJVGsZFYauCpVL97L+173DDOoU6ld39c9TzWtNv1mD3+HThg+kILSdI5H1XSxFhfdKZqWNGEAK4k7oMtM/3FXdvJaoBtGTva1zkBywgLLwkcAUbouRFZSYY3ilmRyYt0FZTsTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1fv1ZnyUG5WGJbnmSY+llJmMrDng3VRdSGrZB268lc=;
 b=Gt/lQmACM4x5cX+EP3xMwUq/eRE7MJdGlCjXSJR7yq8aDZfan+KxyLNXG6Eu08hNOSF1LfshVf5XyCsU0z3M1PW0dA4XoSxKvDrw8JhjW+iTqV6+L4kksQi7fCwuJg2LfJXdYR52zL4ULt8GJlFwhPJZhztJfjvtfB2XI1opoyFqE03arImA6p43quPngaEoXrhp5RM+F4EDQGECwyS6j2lgiZDC6QJ4uXnCOSsjTfCz/mb+afEbrhDAqApaieuyE8CKOUBE9kocpUrIGHDxAMCC1Q47xhPsbmwWb4a2TYNAwULvB5SYlTfi4lkH4vm0vbss2ElIJqA1T2pUwasJGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA3PR11MB7416.namprd11.prod.outlook.com (2603:10b6:806:316::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 15 Apr
 2025 11:57:38 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 11:57:38 +0000
Date: Tue, 15 Apr 2025 13:57:29 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ring_ops_types: Increase MAX_JOB_SIZE_DW
Message-ID: <Z_5JqVAicIiZqaC-@fdugast-desk>
References: <20250415111523.149214-1-francois.dugast@intel.com>
 <7f71ca43-8b14-4dbe-8225-5ee58e93d22a@ursulin.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7f71ca43-8b14-4dbe-8225-5ee58e93d22a@ursulin.net>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR09CA0120.eurprd09.prod.outlook.com
 (2603:10a6:803:78::43) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA3PR11MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d250fb-1a16-470a-a815-08dd7c14b7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JBTXDgOu7DS5//fqN+IW3NHW0XBT3/+Hs/PpxaYmNuzhGj5YZtgxVCvyaAvY?=
 =?us-ascii?Q?TMIJLc9G39W2VSI0JS5V6s7HlMJipcwleTgwI0W7kVhGjjXvcJOxoeGwwly0?=
 =?us-ascii?Q?4JxIM8TZIwsBde18jx4fWxFAU+ZXViTpjNBykOjglTQ4ChcpiuxjhvMe7Szh?=
 =?us-ascii?Q?yZvC4z7Cn2H11oVfAQWfixrjx5kHCgOVG070TkRb2a9By8uVmElA/RKCano1?=
 =?us-ascii?Q?osMDJhx4PYKk1Ujc04rtCnz+hW8Dk7NxPdWQiVhIGWAUvMAsUSxeQWUGqnBP?=
 =?us-ascii?Q?xvyMijTszvBWu3zB8Lk1Hhw4XKVkPrD6IHz5QSqvQ3tc3uQsGrF2JSUVWf2Z?=
 =?us-ascii?Q?oTrcwBA7SpiBf32uus9OV3ogxctBpSqbyJdW0S2dW/P0G3AqY4eX2hIk3d3a?=
 =?us-ascii?Q?2PLgmWT8lmvp/FRISkxXE8aZDKXjTaIy39u+kYEXks8sf4dHGaMWtb2WBKPA?=
 =?us-ascii?Q?835Df9Xz0jGADulpgZCKgcIwUDNowD3F2HzTwmt+czi6tAPvxcsIv37snple?=
 =?us-ascii?Q?X96rjV2mMjZuWXJ1S5PdAhkzkccbW6dHfquy2kLK/bWSSX2Xv8hnGmufNKY1?=
 =?us-ascii?Q?5Rpzm1mn5TVmoiqOUJSAgqj2E7eipC5LV8wD8hKvTUNl0g5fFXgGtJScYWKV?=
 =?us-ascii?Q?xLFEz1NXMheM8NcQ4WrFCXeQJTE2twDLugqCNGT2+xOAsdBKIYFb5rXevfkU?=
 =?us-ascii?Q?u0bRMpiBXl7bi4Pra6hq2JrdaqZF9DGhOIkhuBT4JageiAw8HjtZPleHI3CS?=
 =?us-ascii?Q?zBVSIdHeMxu20m5DZK5tGYXZHrKhIXElM79cpgFiIurW+ya5A0xnqkfgpj/j?=
 =?us-ascii?Q?yyI9mzEBYPtYdwWNjt29t4qiqMp+Ca0wazYcy0vzgIogx2/7XsDtZ6xQEtrr?=
 =?us-ascii?Q?SfHHnq4m6D7MJEqkz6FlHJA1qJxvR8mFdKToY/11i+IA49XWUeB9CF90yb77?=
 =?us-ascii?Q?OL1XV3tOKBCzuo/TDyYhWD7NAp0o7XqSc/CNRZmZ3OfO0YG5cBBUk4e7w07w?=
 =?us-ascii?Q?73aJKAorGxyPeCRT7cFgkRsKNIHAYjfIHvtSa/LD82Q0yZ8QpqV9RCL8N++C?=
 =?us-ascii?Q?O/Xoed4oPbPBvG3cL5OoLMnFtWTTzMxz1Xp9vsduYXwrV29ZChdXLQ79Z1IE?=
 =?us-ascii?Q?vJGBB4neFn4S8OKSVuVTq6Ias3xyAiPat5V/6BSMP55SJGlEqi+Q+2iAZ8q2?=
 =?us-ascii?Q?+bZirHJfoQSLgydsl8BPbGcDxBfqyE5nZ3ymZWOobyO0g9MEnT56/Jihzs63?=
 =?us-ascii?Q?nxk4MZYlhjn/pWajeE8Jghk+IWo4+mBdnpOJV2kvjcZDIhzH8mTpsaHaesKi?=
 =?us-ascii?Q?WNskbokShyYXCXLcRzbrdp+Q47J0zsqC57y3alPdLnYJllwM/+fhEpr2BuNN?=
 =?us-ascii?Q?0RgpXR4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XjN916IfRhnz9RNHIkNfiuOxXuKsn/TbrZImw1oJxGHvuiQ8s7W7j7ZNEELT?=
 =?us-ascii?Q?bf9pEi91staxwmAO9FYXqv1cmM4+dldb0RsdUcr1Y4RbARza/OZMJrilmHr2?=
 =?us-ascii?Q?euCFxHQ6gOnx906knzls85jI83YXOWinHs+xG6nIxs3Ug+q9+p+w2kg91KBO?=
 =?us-ascii?Q?txA9h3PFWVBB57SR/95OTKTXHdH7SG1TK+Xv+Fz9MBODrp51sbfjTS+uimWa?=
 =?us-ascii?Q?Qpoeo1jYDyUVVC0ZHB8esRl76z25Qf3P9soPBlnWE5fAKoNWQt347vaoR38w?=
 =?us-ascii?Q?TgFq/EudCxejdp/zKFjQNYydqdB3bA0N4V/V8Cwi7yns7lc1bRn9YgOjqa1x?=
 =?us-ascii?Q?RCVnLftt353F4UQkIwFtuYB2fYntJMZUj2iFLpzWBFU8L7rvUGquexzKJceh?=
 =?us-ascii?Q?cJ4hGk0cX6/VkBiQDMcijujGYWdHcE1ezIKxfZN6coE8YN9dFfntT6h87L2W?=
 =?us-ascii?Q?YhUaXetGpMGkk8fDzoX5gO+k4V1moQgMtmuxOF6pa7Sbr9Q5kRj8JDg1NCl4?=
 =?us-ascii?Q?w4c8hw/F4l2HFkZK42fabX2MYYn7YaU2zSzN5xqUp4lxcptK9fCPAzoaUHTG?=
 =?us-ascii?Q?E9ChxnSgHjabbVxUKk47/3Bx13mZPArZcdQzDU/hKc6/c003biIiSZFfj0ab?=
 =?us-ascii?Q?AY/GqxeUwIPbS9ZSLTiFbTnY80fb/1vH9HZtEL4qB8D0mm83iFK7pcdlRNTt?=
 =?us-ascii?Q?b/Xd3jVgUCoYsoA8C/CIZQBpHGoAZbrBc9FphNrNk4YmiSP37kDs5i2iRjL8?=
 =?us-ascii?Q?IPbUlrkkr6XzxoZLKCO+X6zZy80kNoaOvG7oSTjczsmFz9d+RPC23TEpdA16?=
 =?us-ascii?Q?R32MxJnt6hCVZlmkl24J+HRYdOcrhwyZF7La/gNwZis3W8GLV9JQQggWst2n?=
 =?us-ascii?Q?O76dcGrq7M71qmJlZDDRZkD+0vlcMV94O/sw1+kX9uuePkX7DIEuwHjmCjU9?=
 =?us-ascii?Q?y6AFS2SNKxWAwEAvycqglFLcUyoFDNB1H0EYeM/ILrjnhvuP4D9BwZU2aCK8?=
 =?us-ascii?Q?7rp0hiEjBocWdqd0T0KuLagrVewyvut2wKWSAnshqU2Blw32EauMLXBZLDe1?=
 =?us-ascii?Q?t4NC1ALHaah+Xe1eC4XQyLUDhBU3lub3T/xnnf9bzcqMGQR+R21IuHfNtmoc?=
 =?us-ascii?Q?kKsoVep5c8MNmakpddI+ichsHfnzszRDYFItHRovuU6HiTs1pWWrPUQxPehb?=
 =?us-ascii?Q?ccW2k/gAzN/Yve/CdyeKwJUfd45anunnslqgLHAiXVysnmte8QKXb74QXTJK?=
 =?us-ascii?Q?szK8JvKzFKvJTk05cYH4LWq0Qc724vdWy7kI4nmYa0H81NA5OlJB5w/AruA9?=
 =?us-ascii?Q?ddM5VVMy2z8A6UWvIwq49ocF1YVx/N+MjW3Xl254FlfbzP08oockIKFO3b/F?=
 =?us-ascii?Q?pHweKuAZQtqZf5E0EnTXmzCdcHFiqd8ooaCDWX1mwoEwvujKWc89QU2I4jCY?=
 =?us-ascii?Q?1BdslIgkwAyaZblJQGJnN6PJl085+L+IneQBxgHEu2Rot5ifYcFC7Z6+kUBE?=
 =?us-ascii?Q?helk5MNE5K8HUhfB/WBIb8Lxp0xep9rhNzUS0Ek4JSvl7c28yZMIi5ttsF+s?=
 =?us-ascii?Q?1DwTUGptmeLFT8TwzrwG0xgybpTFiW+zkd223nfNGlLoH3XD8UZKYlN3x8jn?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d250fb-1a16-470a-a815-08dd7c14b7ce
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:57:38.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A78l+yCLsjqvV4Dryi0JbRBBXATl+PTCx07pCg4h0w2rc0NwTxHuU7Nw3Jj8q9zR0+siKocb3KfsmHKqfC8Twk8DUlMrnsAZ6NS0PVncReQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7416
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

On Tue, Apr 15, 2025 at 12:45:04PM +0100, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 15/04/2025 12:15, Francois Dugast wrote:
> > This limit can be hit, for example when running IGT compute-square on MTL:
> > 
> >      [   63.582385] xe 0000:00:02.0: [drm] Assertion `i <= 48` failed!
> >                     platform: METEORLAKE subplatform: 1
> >                     graphics: Xe_LPG 12.71 step B0
> >                     media: Xe_LPM+ 13.00 step C0
> >                     tile: 0 VRAM 0 B
> >                     GT: 0 type 1
> >      [   63.582408] WARNING: CPU: 0 PID: 2439 at drivers/gpu/drm/xe/xe_ring_ops.c:395 __emit_job_gen12_render_compute+0xa7c/0xc70 [xe]
> > 
> > Increase the value to allow this test to pass.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_ring_ops_types.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops_types.h b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > index 1ae56e2ee7b4..121279c826eb 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops_types.h
> > @@ -8,7 +8,7 @@
> >   struct xe_sched_job;
> > -#define MAX_JOB_SIZE_DW 48
> > +#define MAX_JOB_SIZE_DW 64
> >   #define MAX_JOB_SIZE_BYTES (MAX_JOB_SIZE_DW * 4)
> >   /**
> 
> I've sent the same fix two weeks ago:
> 
> https://patchwork.freedesktop.org/patch/646815/?series=144186&rev=5
> 
> I hand counted 58 dwords is enough. You think I undercounted?

This seems right and I confirm it is sufficient to solve the issue I
described in my commit message, so let's go with your version.

Thanks,
Francois

> 
> Regards,
> 
> Tvrtko
> 
