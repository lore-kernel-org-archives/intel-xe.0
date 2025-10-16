Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E98ACCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 19:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 134F010E357;
	Thu, 16 Oct 2025 19:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TAuXBZ7P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A6C910E357
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 19:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760644087; x=1792180087;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fSiGuzhkDmC3QvEou1PeBnAFYTo0kSjXZjM4sM4pgnQ=;
 b=TAuXBZ7Psca+whfhEjIxhlRwwi6sxfrBusbhWQ4IYgewjxoEDQMAqxzQ
 3m8GOtgh7PzrD6MHto//4cxcH8hVtOHVl41ChN4iR//cauNpZgatmNjn2
 n57jEhzQdo/IsQkqJ5qYlHf7LgW0ynwtum7lFmC8rqMPngkSPEz9t8ZSm
 PVhmP5S/VTf1wRQPIKNd9CY0F0i4OJPZDw+0OOhEz1CC/vyRm0lSSOQKJ
 0iYOa1IRkrd/XjpbLCmmTA+PircqGI7bxHAOW4JYeAuEDJVUUhDLGyPai
 cvktXi8SLs1JETiYBo0xozIAmvdkcbx0nCmTozat5RktGccJaSsJWOVPw Q==;
X-CSE-ConnectionGUID: TBejrSJsRbSpH76/xc00tg==
X-CSE-MsgGUID: oT/+GmEETcmFYjJNHRlXcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62945458"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62945458"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:48:07 -0700
X-CSE-ConnectionGUID: VI4bjVZxSlGk073zw7x/rQ==
X-CSE-MsgGUID: /Gh7x8eVRqyCSIkLYSAuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182477871"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:48:06 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:48:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 12:48:06 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:48:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NL4k/SK8P5esKTeSnpGY+tJJ20bfwtQiD3qa7UX6pKwONZ0ywL9NXlbLuLGwUaIJ28vQhtR0e8UMLypLWX/lAzX5ymOoiRb35aMbN8XDT4ODO1RnOi0l2cZaQPHh3qL009iftZ9dBO9qge0h5rwIrvM+joSPgLqllD8woBFYDCVNfZWMkHZeXk/wwuml5A3GG3+i7OflmnBjxppuoslg5V9mpmusOcr0wR4wzeWY3hjgkwbDVeZ1rO0VInMbavMWuEen+12MhsugmJ8SK5T9aYRjgsvZs1z+T3cNxafTO/CpTP3G0kIASZlR/H3qZfQmNJ+7br/hEZhUVjZbyZhtHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jamGjGjwgKfsPz1RuOl7er3fe4tp5UkG3+MkjCcamzA=;
 b=GWMdeTJLSGq7/pzim5xkq2wt0wy0mX2+ak3Mrcd/HwBM/eXE5JbjkluIfG4qFrXVE8GIRN25oB5hmXQSkfqOaWS94pYKoqDIhsgaxtZwWxoOyHWhUkm5ITkzpWE/v/rfgiIyypuTA8ia2zmwGpXxo5XBoezNieX/iNu4ZSw8v7B3Eju8YD670vtAObT0k/5yCmA/Ad2vmDXwl254okuBO9VMIRP43GH+7yJftfhxNlzwfT9wcv70J9Eykg1bbfrlFfk5xL70D8cVyqW13vNjop/O4bhvloIvEhcT87xawiulo/6mIYUbBU1N+bdgl4/RNJof1Eh8mFPNQ+AVfuKNYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Thu, 16 Oct
 2025 19:48:04 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 19:48:03 +0000
Date: Thu, 16 Oct 2025 14:48:01 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 16/22] drm/xe/xe3p_xpc: Add MCR steering
Message-ID: <ise57wnkjlhka4eivz52xfrwnxfhxfcrhuifruqvarwzuosxuv@7ejlhrrnbkmb>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-16-b9189b3056a2@intel.com>
 <176061507440.3168.6260974313214537346@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <176061507440.3168.6260974313214537346@intel.com>
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: c4fa6f6a-6376-4309-e29a-08de0ceceb8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rXu+zJlK10/6prpfcbcO4z6UqOmypzu+CBr26Y072/SfmSZRageXijuZBSt8?=
 =?us-ascii?Q?z6gU6+I0YcFFNB/bDvFBl5H5nv8svSDt6u4GZ16uXtUhFpiUrAFCvcO7Z8EZ?=
 =?us-ascii?Q?OWm6Wqfjn3CtbJgF8jHoPH12jdixO02sjgdAHFWhTG846aIJTfvg9SToWImQ?=
 =?us-ascii?Q?5q5g3uBeV8wzMN97yVefBFypaVyLSS2GsSxdacEKgO1DbaanPrzb0IvCy1aE?=
 =?us-ascii?Q?gWsNliGqTgV34mKm4G0Rlol/5rNdlri5Uq80uAqaZU23HSkqRErkBBntMqlX?=
 =?us-ascii?Q?BL/fWvWUCEXZ2vh+EdqDP3i7VTnQySJqnBRFybKUuCLK9HFvrxyRZuVHav+r?=
 =?us-ascii?Q?A9pD8DzHmCEND0ieeqZ5yYcL2Y2o2z0j3EGpREwbie8Ixy6aGZMOmK6bilF9?=
 =?us-ascii?Q?TG/78Df5QOjB+ytKOCPG8dVvzhh4eDZgza+0IALG+FxgYyzY8AMnSc5YLYS1?=
 =?us-ascii?Q?GgikEDThkfdw9l6Vn6agt+nKYEm7mXStUpe4ADZbV/aGndUKUKuilf5VO+VG?=
 =?us-ascii?Q?yUSsWJFf4c0w629J3M4TCeFg3oSqcTb5qAl4JwvGnNrsbrLyAjEIBIsGteFE?=
 =?us-ascii?Q?AU1Ib6V0jHCojGSMVl7IaJgGam0oLhKfXBb/JJpognM4jYbETRgGLCu7b6vR?=
 =?us-ascii?Q?4Nu/uyiLjphbWakQB1/X//KVwAzsFRqTXuIn1v57TzXdw1qx0VH4hfdB83p9?=
 =?us-ascii?Q?TTYNTi0+8sS7ER3GMF+oSoB5FurQQ3WEVbv5pquZGdgzHSeiypyH5RXMFhyT?=
 =?us-ascii?Q?AX0E7nGrAWy7FtJJ4nTE8h1Pqf8xPtB474H+32zL80TMiKQXvvk3idkjwDUI?=
 =?us-ascii?Q?hUQqmZGPPJhe8wGRwh8p3nIAxAAZZruTAQYSKPpbLLyxbzpo4bBvisdb6gun?=
 =?us-ascii?Q?gd24V1yWuk5h2cIimhVrrPs894ISrlfeKFI1XEusiYm5XMZqEjBbjly8g2uB?=
 =?us-ascii?Q?jgmVT97ldpFgMztUfyJg3CUjDzlAiJoD9uJplC7sgykWtYRDvyRYyUf6fg4a?=
 =?us-ascii?Q?QcawtwM1ZuKrMJFVxpNVWGMAPMxTw38h3/98ffY8ew0mgkTa9jj9AQ/J1+la?=
 =?us-ascii?Q?tSDJM1exN0ff/YnuqiutBIWKJE8OyeLVoKDuab5ySxORlmyWBaLSjJ2LBmSG?=
 =?us-ascii?Q?Y/y+aJ4lhYaQ4m4jnwYGxMg3UWCfpLyh2MQW67D78+wFzPFRXUxiXB5DQTIU?=
 =?us-ascii?Q?IxMAHPYrNEFnqCJ7A7S6QjZ1Y7QGOjAJRGlg7aRhHa7jNPEyL1gZhP6p51z4?=
 =?us-ascii?Q?8o2DQj7JE9CICSIBJ7QSiDwy8ZkY1pLyFyjrTRwzBxlJIYSn/FS2pzRTwo/D?=
 =?us-ascii?Q?FAoBejCzF2DOsezUbNOe/f26wNycdDG/K0DYP/p7GW+630eIhW8oRTRneYba?=
 =?us-ascii?Q?46o9pyEtTtS4AuxBmPViLpRMy+mjlB/0gjo1SmLAuZryK5ovkawS+Lpnun/l?=
 =?us-ascii?Q?3GU13/UQy29GezXX9Xrw8gI6GRjvgfk6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iNm9qWJq0sviDwYsbXPNUeNWaGbBpXV+8/xZCZSjxqrHl6/puwMpB/wvA1cz?=
 =?us-ascii?Q?HNS2PWtqX66LLpUJqgprIVfrpsO5dZn/WP02WqZZf8CrYAF6c0UwmSHR7e8c?=
 =?us-ascii?Q?WqpOMr76OX8/VhqvcCAFr8rPi7fvHrv+mGzQzMTePmdgx5ADXVf4z5Me1sjp?=
 =?us-ascii?Q?YEjGoaUb4qQitUvDr5K3FrcRm/5GT90JTWO987YLdOH0sSRQAhxKmV5c3h/X?=
 =?us-ascii?Q?UjDAJakX4AXqeeGJ6X9/AFsSsVKHP3Tj4PAEetVOAq4RqYPNSe37kwpiYwbg?=
 =?us-ascii?Q?DBErOXbGYLSseLltcF8Y12UmhrFB6P5gGr+N4eWgm/uuCiT9WquZipc1c0Ot?=
 =?us-ascii?Q?oYQf61rMUKS0a/k3CbozQqoi2caWdqJiT4An24J6VRGivN2dluLF9yiOxcbu?=
 =?us-ascii?Q?4cT9nzVI6Db+N60EGicPE4K9nfI0ogR07Q/+GRGzxZzgHAvkDDJWw+saQ2Vf?=
 =?us-ascii?Q?RdJ6J4LOnL1fLHA3Ddz2KrHRmLza3nxETcwlowsi1qihOY72gFrsSjsFcSkl?=
 =?us-ascii?Q?bYUavTKWyI28guym7h/FlO5x+DuwFYn43soNww+83ihRpLw/4aXqqHuuflqj?=
 =?us-ascii?Q?lU3PN/feUTwhxnTmORD0iNnVhTFoRu1+W4ZIF8clkTHxty7Fx+3Qte6Bt+pZ?=
 =?us-ascii?Q?uyR78MYAg+HI7F/3RfMUBFUmPFMSZBIpUZYu16b0HJIl144RaREGUnvonuiF?=
 =?us-ascii?Q?FINPlrSk1xHlvt+e+scX/Ls7mEzy1ywJKTyMj2dQ026nkOsMVHEBfsJXNsSd?=
 =?us-ascii?Q?DNi6oGPjFVkCt1flRTHFnGrgJFrhSa6G/0wZoS9MfA3ZIEcl1wjjAgZrY3Qv?=
 =?us-ascii?Q?nXKU6iSB7XJBn5ABZncrOWSRZj13i1BgmZFKB3fRzK/xtoJJ48OEBrYR0X/z?=
 =?us-ascii?Q?M4Q7j2hd8E7hgAMjG+EGXCq6/RqjRaR62SkJZ1pzDzoqTSXKs2WUtMc3Qbod?=
 =?us-ascii?Q?+LGYAvoKBU2Ie9Dv48yCZnDyDMaEnCj2e8Mjim4RnyY9i2B9c8E+K0DMUD5Y?=
 =?us-ascii?Q?OUGb7QnroXlCnG2azldxlJBqa6EWR4fhzX3CeQnTNKMRCWk852VYvDXifwxF?=
 =?us-ascii?Q?XXCp/XM3ZSyF3dC7gnlxyK6WMeT+Kipj7+LW0OI/lXFbIeYVDzM91eI5/kWP?=
 =?us-ascii?Q?YiKOYjyAQi/ErpjhdicsAtM+Da8eLSNHuZSkwvzddhRlTvQ9z9if3xKktKuX?=
 =?us-ascii?Q?2CxDomPfVoixdYwyLMSOoQ3AEYH2F0zYStN4ouJ/wbALhe7v5RVcEKiO0slB?=
 =?us-ascii?Q?P5PDDa5lTkw2kHbPUR3a8qwivltmNlyBLb2w5oIiYrr0HFsFo1z4WMxGoIwC?=
 =?us-ascii?Q?iDLUddxEOfnN6nJDAfwP/mPdffb8PtNJM3LSL0CN+qsXyoIZYWaO3t8KjY1u?=
 =?us-ascii?Q?d1ODbOfgPRLted8siGgWBC04jIlsgp88PMmqcWj7VT5s8cLrNO9d1soopV28?=
 =?us-ascii?Q?ZkH8Z8D1UGqYgiMF6oN51eYwJfdGnQRKEvLd30Fp3+oyh6jp4Y9sWaCWFSf9?=
 =?us-ascii?Q?t40fWA7em3e7vBvF5fdjs9ZqOxw0K4hkr1TDfZWTtqB6uTLOzmYaRas8N3/s?=
 =?us-ascii?Q?Z7DYa0HK7lF9joujOu7qRL/3hzAu5Si2bbYWI60gksW2ShB6pXWyL/uIP8eW?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fa6f6a-6376-4309-e29a-08de0ceceb8c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:48:03.8840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTuR9+GWIOHStKRIQtVxGnjdM6aRfEuo6S4YU54g7wWLlgXFFscTGI8Fjs98QJaJjlgGtJiqhSje1ccLqemr9563OiSMe0dSCSOLYnvSocg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
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

On Thu, Oct 16, 2025 at 08:44:34AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2025-10-15 19:06:31-03:00)
>>From: Matt Roper <matthew.d.roper@intel.com>
>>
>>Xe3p_XPC's steering has a few changes from Xe3.  Aside from
>>minor changes to the XeCore (the new name for what used to be "DSS") and
>>INSTANCE0 tables, different rules apply to different subranges of type
>>"GAM."  Certain GAM subranges require steering to grp/instance (0,0)
>>(and thus use the INSTANCE0 table), while others require special
>>steering to (1,0) instead.  Similarly, there are multiple classes of
>>"PSMI" steering, with some requiring steering to (0,0) while others
>>require (19,0).
>>
>>FIXME: There's an "L3BANK" range listed in the bspec that needs
>>clarification.
>
>I think we also have a NODE range that is also missing termination
>details.  I think a TODO/FIXME in the code for those two types of range
>would help reminind ourselves about the need to complete the tables.

Like this?


| diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
| index e5506ec28e147..f35d8a31c1079 100644
| --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
| +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
| @@ -515,6 +515,12 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
|                 }
|         } else {
|                 if (GRAPHICS_VERx100(xe) == 3511) {
| +                       /*
| +                        * TODO: there are 2 ranges in bspec with missing
| +                        * termination: [0x00B000, 0x00B0FF] (NODE) and
| +                        * [0x00B100, 0x00B3FF] (L3BANK). Updated them here once
| +                        * bspec is updated.
| +                        */
|                         gt->steering[DSS].ranges = xe3p_xpc_xecore_steering_table;
|                         gt->steering[GAM1].ranges = xe3p_xpc_gam_grp1_steering_table;
|                         gt->steering[INSTANCE0].ranges = xe3p_xpc_instance0_steering_table;

>
>For the ranges added in this patch, I checked and they match the Bspec,
>so:
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

thanks
Lucas De Marchi

>
>>
>>Bspec: 74418
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_gt_mcr.c   | 56 ++++++++++++++++++++++++++++++++++++++--
>> drivers/gpu/drm/xe/xe_gt_types.h | 15 +++++++++++
>> 2 files changed, 69 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>index e1a2b38fc2a86..e5506ec28e147 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>@@ -169,6 +169,15 @@ static const struct xe_mmio_range xelpg_dss_steering_table[] = {
>>         {},
>> };
>>
>>+static const struct xe_mmio_range xe3p_xpc_xecore_steering_table[] = {
>>+        { 0x008140, 0x00817F },         /* SLICE, XeCore, SLICE */
>>+        { 0x009480, 0x00955F },         /* SLICE, XeCore */
>>+        { 0x00D800, 0x00D87F },                /* SLICE */
>>+        { 0x00DC00, 0x00E9FF },         /* SLICE, rsvd, XeCore, rsvd, XeCore, rsvd, XeCore */
>>+        { 0x013000, 0x0135FF },         /* XeCore, SLICE */
>>+        {},
>>+};
>>+
>> static const struct xe_mmio_range xelpmp_oaddrm_steering_table[] = {
>>         { 0x393200, 0x39323F },
>>         { 0x393400, 0x3934FF },
>>@@ -247,6 +256,30 @@ static const struct xe_mmio_range xe3lpm_instance0_steering_table[] = {
>>         {},
>> };
>>
>>+/*
>>+ * Different "GAM" ranges have different rules; GAMWKRS, STLB, and GAMREQSTRM
>>+ * range subtypes need to be steered to (1,0), while all other GAM subtypes
>>+ * are steered to (0,0) and are included in the "INSTANCE0" table farther
>>+ * down.
>>+ */
>>+static const struct xe_mmio_range xe3p_xpc_gam_grp1_steering_table[] = {
>>+        { 0x004000, 0x004AFF },                /* GAMREQSTRM, rsvd, STLB, GAMWKRS, GAMREQSTRM */
>>+        { 0x00F100, 0x00FFFF },                /* GAMWKRS */
>>+        {},
>>+};
>>+
>>+static const struct xe_mmio_range xe3p_xpc_psmi_grp19_steering_table[] = {
>>+        { 0x00B500, 0x00B5FF },
>>+        {},
>>+};
>>+
>>+static const struct xe_mmio_range xe3p_xpc_instance0_steering_table[] = {
>>+        { 0x00B600, 0x00B6FF },                /* PSMI0 */
>>+        { 0x00C800, 0x00CFFF },                /* GAMCTRL */
>>+        { 0x00F000, 0x00F0FF },                /* GAMCTRL */
>>+        {},
>>+};
>>+
>> static void init_steering_l3bank(struct xe_gt *gt)
>> {
>>         struct xe_mmio *mmio = &gt->mmio;
>>@@ -419,6 +452,18 @@ static void init_steering_sqidi_psmi(struct xe_gt *gt)
>>         gt->steering[SQIDI_PSMI].instance_target = select & 0x1;
>> }
>>
>>+static void init_steering_psmi(struct xe_gt *gt)
>>+{
>>+        gt->steering[PSMI19].group_target = 19;
>>+        gt->steering[PSMI19].instance_target = 0;
>>+}
>>+
>>+static void init_steering_gam1(struct xe_gt *gt)
>>+{
>>+        gt->steering[GAM1].group_target = 1;
>>+        gt->steering[GAM1].instance_target = 0;
>>+}
>>+
>> static const struct {
>>         const char *name;
>>         void (*init)(struct xe_gt *gt);
>>@@ -426,9 +471,11 @@ static const struct {
>>         [L3BANK] =        { "L3BANK",        init_steering_l3bank },
>>         [MSLICE] =        { "MSLICE",        init_steering_mslice },
>>         [LNCF] =        { "LNCF",        NULL }, /* initialized by mslice init */
>>-        [DSS] =                { "DSS",        init_steering_dss },
>>+        [DSS] =                { "DSS / XeCore", init_steering_dss },
>>         [OADDRM] =        { "OADDRM / GPMXMT", init_steering_oaddrm },
>>         [SQIDI_PSMI] =  { "SQIDI_PSMI", init_steering_sqidi_psmi },
>>+        [PSMI19] =        { "PSMI[19]",        init_steering_psmi },
>>+        [GAM1] =        { "GAMWKRS / STLB / GAMREQSTRM", init_steering_gam1 },
>>         [INSTANCE0] =        { "INSTANCE 0",        NULL },
>>         [IMPLICIT_STEERING] = { "IMPLICIT", NULL },
>> };
>>@@ -467,7 +514,12 @@ void xe_gt_mcr_init_early(struct xe_gt *gt)
>>                         gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
>>                 }
>>         } else {
>>-                if (GRAPHICS_VER(xe) >= 20) {
>>+                if (GRAPHICS_VERx100(xe) == 3511) {
>>+                        gt->steering[DSS].ranges = xe3p_xpc_xecore_steering_table;
>>+                        gt->steering[GAM1].ranges = xe3p_xpc_gam_grp1_steering_table;
>>+                        gt->steering[INSTANCE0].ranges = xe3p_xpc_instance0_steering_table;
>>+                        gt->steering[PSMI19].ranges = xe3p_xpc_psmi_grp19_steering_table;
>>+                } else if (GRAPHICS_VER(xe) >= 20) {
>>                         gt->steering[DSS].ranges = xe2lpg_dss_steering_table;
>>                         gt->steering[SQIDI_PSMI].ranges = xe2lpg_sqidi_psmi_steering_table;
>>                         gt->steering[INSTANCE0].ranges = xe2lpg_instance0_steering_table;
>>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>index 8b5f604d7883a..d93faa1eedef8 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>@@ -72,6 +72,21 @@ enum xe_steering_type {
>>         OADDRM,
>>         SQIDI_PSMI,
>>
>>+        /*
>>+         * The bspec lists multiple ranges as "PSMI," but the different
>>+         * ranges with that label have different grpid steering values so we
>>+         * treat them independently in code.  Note that the ranges with grpid=0
>>+         * are included in the INSTANCE0 group above.
>>+         */
>>+        PSMI19,
>>+
>>+        /*
>>+         * Although most GAM ranges must be steered to (0,0) and thus use the
>>+         * INSTANCE0 type farther down, some platforms have special rules
>>+         * for specific subtypes that require steering to (1,0) instead.
>>+         */
>>+        GAM1,
>>+
>>         /*
>>          * On some platforms there are multiple types of MCR registers that
>>          * will always return a non-terminated value at instance (0, 0).  We'll
>>
>>--
>>2.51.0
>>
