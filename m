Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1B3CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 20:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC58810E9B7;
	Wed, 27 May 2026 20:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+0yvDe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9CC10E9B7
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 20:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779912279; x=1811448279;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zV6Ok0RpLZKZ8bUqOUiPAx7ZmmnJ8C6dWS06M24+mwU=;
 b=k+0yvDe5NUIF7I+fE2kSb55GxtA5Q3St3aegtugDmfcVegXIArPbmDOK
 s/oOFJn7sOiyyC/RG0eBMLBF5PEc8l0B/XtUAbHbVoDvaPojh3SAf6+si
 NPoskHfLkbt/H+BvQIjSYTF3NHZhYI0ESlcA5AQcrv6cMyLvKpCdY0Kdx
 ugCaVTvNwVXf6VvsyJSYrM04hrNKZlNzzQYZ5+zaxpNTKvzctCtfOWiTY
 lgtJ8W8NVveedclgLoZXLF7W7XNhtotM2evTZ7y7B/Uu0mRpqEclW+beQ
 bYnhk3p+xcI+0ZsdgAvUF1AucoM69RJTjruvrYRzWxarZP1OqH5WxxM+w A==;
X-CSE-ConnectionGUID: /488zKtIQu26H6TkSVvw8A==
X-CSE-MsgGUID: fEoyhcIsQmuHCTE1KKi7Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91326079"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="91326079"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:04:38 -0700
X-CSE-ConnectionGUID: fmlMNhN+TXei1o6Vx+1NoA==
X-CSE-MsgGUID: umbtS03HQDeknVkjnoX6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="239338607"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 13:04:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 13:04:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 13:04:38 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 13:04:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSgQAp4Hiv+sNwx21XeDqs4kg7Rm1UcfVM4Qa2VcNr7+Y16vcio8ZXsF8TQ9INA15uEEktW/gK07IHJxU7+NuHOg4ROntjX59fmjoXTJPnpR3tbsEW52dW+g8xmNM36n/nhMjfNe3xoR3cXZp8HBPEPDL0fQe+AO/GWu2bDzOVJ3KiMcmjbuljc/AdEWN1MK97TZpiNVk4NU77ZxYZLHSwdzfFnQWkbbAB/25rXbNG8QuXqhUfgbWoq/H2XRMThuebOhzhd0gXeDF58i3jOl7Q0CWAo6T7FcnpDiooIe95fOBb7eOw1uGHBnA3wL++0LRHDDNjfZgx2KASnUbjh7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TksVfsF1JYOHo3MwXHds3Pd24NEhYaAynJOSxZX9ozk=;
 b=Svwk2jCjbwZFnSt9KKDxBKU/opfGo0+imh4TxJKCdo6WqKhjBhHBGtKVNLJT4QsxgyyQv20C9TZdsQEdIaWb6xznU1W3WuCCy0eE/9GBNpC4rWLqstYdD5709bcKzO90QSlcC97FkZwIYctUmYJP353rfzzFXiwyyNNwH4wiW7d7JklGBugcCpbF0Er7l9yP/jM0ZKx6lX5FYQGA0CFHH14XsfzYpBmZp9R7Mtx49t52Lw3JYUDjjOpvS2ATTRf6ZhrxLw1h+K8lZW0Ltva2InCRxYuQrSmacGFkoUximhyFY9XOX3Oz8bxL9O59Q0JDV8CJnK/rsP3Dc1kLT/3eyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 20:04:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 20:04:33 +0000
Date: Wed, 27 May 2026 13:04:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/xe/rtp: Ensure locking/ref counting for OA
 whitelists
Message-ID: <ahdOT9RQfFIXS2mk@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-10-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260518234716.1540123-10-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0206.namprd03.prod.outlook.com
 (2603:10b6:303:b8::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa801d6-a774-4488-3016-08debc2b2b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0JDPJM0bqbXUE4Wl8MMiPv0RB6G39J4MvilLj5nejT4aaEigImy7F/3CY1hVsrJoKKmXKg4uc347p1BWSk31u8+ZEELduKPZfEkoDhqHqZaKhXxfw6nupFpzntXAxV9nT3mFKk346jBXxOH83jFS852EV2z1GrUODLpuJRkXiqxZIdYmV4I50JTCDJcDYcxxkfnn8CCYywkYaICEyyDctlUFJO3spX/Aro3E02NZmC4/ISt+aAU66ERAzibd4JlIevkzM5zwhJT4wVUMHKlspMns4QekVS3Xkwd5L3ODhOJ4bXQdALD7+iKEJx0A4phiBUgtP8h5FrjCZmf/Qso7EfxC+oV/Thl9QmV8BE7BtcK7YStw/YXxPOOefMFcKXPKRVIWZeWtKMvIjmI7iMnWAZrJ3Yqmv4beXRsZLxgb2M4Vg/7QrmzX2Z+HoMR/B7EXj4apnqr+ILw0OYoTWmz83LQ9GG4yRJSJYGQX2Rs4pdJFvPu83bKq5Bb9kSvV0vJMTIjrdcZfHX0IuAWsNWAebM8voRICx8whRY469U1kMooTCGT9J5j9DGe4D0rtUyl/baCehoOZJu6XqgZeRVd8JoAsxasikQyk1Zm2W2VJi2/268T5s8/a46CBnYQE0aULmuZJIKQf5b0iYCYA9/qeDI/atYHuzZrJre37TkJC5MuXqnw5gbum5fNa3y+G5ZoD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHkyVEIxTEVRNkk1Z1NLU1BIN0JQYTFxUTZuSGFodVI3cTRxcWxRQ0hiUjQw?=
 =?utf-8?B?bldJazh0REVybVVyL1paWWkrTUlqN0hvZ1RFekl1cFJCNnUzQ3pUMVRwMnBH?=
 =?utf-8?B?ZjlTSmdnMXBJK3NpWHp2bFNuOHNqQk5zZU5iVUllbmtNL0lSNm1SajkyR3lN?=
 =?utf-8?B?eWJBZzNFR0p6eFpBOGdldG5aWXMzaDRIWGQwbU1PUEpmMUJSaThkcWhGRzRu?=
 =?utf-8?B?Zy9XRUtqSFlpbGM4NExVTnlXM3pZdnJRbC81MjNlRGwrTGo4Y3hXU2ViMDR5?=
 =?utf-8?B?UmZGdGZxT2ZhVDhvbmk4alJPOW81NGV3ZnRvSXplZytWeHFidTdWUTZnTXJL?=
 =?utf-8?B?L0lDMzliVnFtMUNQc05Oa0tueFhrQ0c4cFVWRFpwcVdiOVdqeTlIZ21MczNQ?=
 =?utf-8?B?MlF1NWxKMXhnL0p6N2xUam9tWXZkZVVxVmJ0L3lqRFdoOW5TWTZQNUtpUE5O?=
 =?utf-8?B?U01aWnIxM3V5c0RwMmp6MlFIV2JvdW5kUG5mSFo0Uzl3cnV1eGlkM3NVUXVU?=
 =?utf-8?B?Wml6WFV3V211alR2WDJNc2NWY3JQdTJvS2V1NTg5MzFjWTBJUSttdVhHdUgw?=
 =?utf-8?B?UEZPcHhNYnJ3YXRGaWlERHRZUUVVbHpEV3hiR2ZxL09RaWFBOG1laGJ5cndR?=
 =?utf-8?B?bXRDQ0tsejlWcVBJSllJb1ZOK3FZMHhSK0g2N2twVHlJUkZra2pRWUNhSmoz?=
 =?utf-8?B?eUkvdklZS3BCSHEvTVkvM2xwbVg4RU1WV1pqRDQ0MFBBZDVhMzJWZHVObWxM?=
 =?utf-8?B?TEVlbUF4dmhxWTNhR2hhYUUwcnBHdmdFRGNzREpqekZUbm4weFVrWDVmVEs4?=
 =?utf-8?B?dk9mK2FDYVFzeVczL1psb2Q2cmVQZHlWR0tKVFhwaHdpNEU4VEIwTVh1V2VF?=
 =?utf-8?B?T1A5YXdlRm5BQ3NpdDhkVzdlRDB4V2pHRTg2VUpYa3ZiMlF3K3Y4d2srVzA4?=
 =?utf-8?B?V1lZUWRBdWNldU9rR2QrMUhPQU15YnE2RCs0a0NYMGhNa2IvaFdrWDRNbjBO?=
 =?utf-8?B?Z083dXVkTXhZczhtWFJnR1NaejVSSWFnejBiMkJaTU9qS0Y4RGswVGRaaFVU?=
 =?utf-8?B?WW9kNEh1dDRVemJyYlFKVUZESy9SSFNUZnhUa2Y2eVZ1K0ZiMC9TSEg2YTJa?=
 =?utf-8?B?Qlhpa0JMaVRDYk5iUTlnUHJ1QVpXVFRwNkREdDMwek9YK053djZOM3p6aElX?=
 =?utf-8?B?bVh2clJvT0d3a1RpSHp5Q0g1RVJNOWRSeTVwS0ZkN05KL25zSFY1SGRCVEtO?=
 =?utf-8?B?YUt5NUhwSjdMUEtrVUN6M3o0LytidzlzdFNSZHh1N3VSZ3hMZzlpQW9Sbk5m?=
 =?utf-8?B?SzJZNHk5d1RXWEV5aVRGL2kzOVFmV3ZCUzFvbk5wdUZnZ3JBNEVRcmxaanJa?=
 =?utf-8?B?SGtLQzZyS29JSk82dnhJUlN1b3IvTllVdElrekZUWkVKd3p1RlVJSVZZMHVt?=
 =?utf-8?B?TUN0eFYyQUVtYmVlNk52dGlWRXhEaHZHaXRTMXVITnJwWVU2K2xuWVJtamt1?=
 =?utf-8?B?cDk5YU80anpiVzhzbDUwdXVWYUJZVnNaeFoxTnZBeTIxM1lZTnU1dnVZeDEw?=
 =?utf-8?B?VkdSaUUrTTQ1MnhZY0xsOEFxdCtvclpCV2VpZUVGejJhTkV0Z21rZjNuSkgy?=
 =?utf-8?B?M1BSOFJDQUpLT3RSSzQ1RVZSVjlzSFMzUUd4YmdMUTFxQTlrNHE5dFdOeHlE?=
 =?utf-8?B?dGQ1WnVCU0QyM3I5dWVhS3REMHl5eWp3RFN0UzFzcjZnMURHdUtIQ0xtUlB5?=
 =?utf-8?B?UUd0Q1JpMVpUSjlZT1dPNGZLc09xMHIxQnlpUE9YcEFTNWRLWHE3NUlDUENU?=
 =?utf-8?B?bWQ4cklMS1pyUDVlWDNDNEFGcGxDbW9Qell4NUZWWjJ4cSt2NEZydWFqTWlu?=
 =?utf-8?B?UFdLdmllVHJDTmtxOUNYYXZoeVBieHlrRmEweTRZRm55K2ZveTZONEppcDdv?=
 =?utf-8?B?dzE4eTF5L1BCZFpaK0FEVFIra0d0dkhQZ3lmYUtHMkZoQk54V0IxbmlvZnd3?=
 =?utf-8?B?VmtONHdzRUo2YzZjSHlNOThHSE52dW9Tekk3dXVjbklYMWNJZnRJUHY4ZThM?=
 =?utf-8?B?M1h4OVN3bzdlblhKY2w0Y1c5Uzg2S2luVVdnR09PaVRZeUlhZlZKS2tBQklS?=
 =?utf-8?B?MXVKV0VBaWdwRlNTT0NNTWh2ZUk3aUhIVWlBdXRQT3Y4Q0pNRUhCU2lDdWFj?=
 =?utf-8?B?akphdGNQWG9GZ0hOeHBlZXdUVmo0a2gwcUZDcEYwZlZGcnI2LzV4NFdjMno3?=
 =?utf-8?B?ekk2ZVhiWGN6bDI0R2E5bDM4dzk2RUNaaG5idHhoOXlMakxZeUQ3R2dkRzN1?=
 =?utf-8?B?OWZwbHVMbUJ5bXc3b3FJSTJ5RDQvRUpxdy8wSGhvUFlIT1JPalcrWXcyWlov?=
 =?utf-8?Q?jiqfGeMUSD1ZJI6hTNYhIw4n/aYFNXHlZ44Oa?=
X-Exchange-RoutingPolicyChecked: VU0Lgo8KrcYJq6PkXYunBnkptCiAWTmS5tqS9hBDdntW1BvM2WCtWMzadJ0Q7HD8aVEi4S49gjPzz7WmVEpEDGaATUAsMDoBs6+WlONJtG0aQwhuaV8A/ShDS9giBurUHsjxcid0FjFmrPS6zNDazblpQIj5EEJlavRFIZqblXL6KQz9+qeWF7uoKp4aEUpGivqKg8U31m+AtCGYibGfNAF9wH3dSUz5aviVxoY8/DMnLOEy20hmsRQcQ3nLrBJ7iObWYlmds6nq7qBOMRNAk/5OwmQH3rZYPtds08fBPDfjnGjfkrS5VY0hxPx5HxJaFGqdpBk7sy04L2d5SUoBSQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa801d6-a774-4488-3016-08debc2b2b9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 20:04:33.6079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /94aaw1jjts7dkQ2RvRrA537LSKiBvuQofAnEafWrsNI3zutkCg2YSqOrwHv/QCE4P0nvKgdF4o9vD1QIljOZPYSdSLjtFY+KGOZO4rH+Ls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
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

On Mon, May 18, 2026 at 04:47:16PM -0700, Ashutosh Dixit wrote:
>Since multiple OA streams might be open in parallel on a gt, ensure that
>proper locking is in place. Also ensure that OA registers are whitelisted
>when the first OA stream is open and de-whitelisted after the last OA
>stream is closed.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa_types.h      | 3 +++
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 9 +++++++++
> 2 files changed, 12 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index 3d9ec8490899c..e876e9be92ba5 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -126,6 +126,9 @@ struct xe_oa_gt {
>
> 	/** @oa_unit: array of oa_units */
> 	struct xe_oa_unit *oa_unit;
>+
>+	/** @whitelist_count: number of open streams for which oa registers are whitelisted */
>+	u32 whitelist_count;
> };
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 50b34c5008df7..1b72f0d2935a2 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -255,6 +255,10 @@ void xe_reg_whitelist_oa_regs(struct xe_gt *gt)
> 	struct xe_hw_engine *hwe;
> 	enum xe_hw_engine_id id;
>
>+	lockdep_assert_held(&gt->oa.gt_lock);
>+	if (gt->oa.whitelist_count++)
>+		return;

Any reason why not using kref here?

Thanks,
Umesh
>+
> 	for_each_hw_engine(hwe, gt, id)
> 		__whitelist_oa_regs(hwe, true);
> }
>@@ -270,6 +274,11 @@ void xe_reg_dewhitelist_oa_regs(struct xe_gt *gt)
> 	struct xe_hw_engine *hwe;
> 	enum xe_hw_engine_id id;
>
>+	lockdep_assert_held(&gt->oa.gt_lock);
>+	xe_assert(gt_to_xe(gt), gt->oa.whitelist_count);
>+	if (--gt->oa.whitelist_count)
>+		return;
>+
> 	for_each_hw_engine(hwe, gt, id)
> 		__whitelist_oa_regs(hwe, false);
> }
>-- 
>2.54.0
>
