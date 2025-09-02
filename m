Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9713CA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 17:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7414C10E1E5;
	Tue,  2 Sep 2025 17:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HT1JSGvn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCC510E1E5
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756833384; x=1788369384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/aRkjqk9m7chyPPnu3Y3iu/0IpbICWnIRAftqydx4kE=;
 b=HT1JSGvnsFBtEIP6emvj0/YCroZ7db57hYvUnGAIYEgYFrec+XQKGi8J
 bsjwq9P6SrLeg6WI6GXeppOPoAGUh3hdDPbfL53mbMFboky0BZEATBiBu
 WQ/67HgeXUv1FpKBxvIAl/Jauh+xooArPCtgoleBRHQq8Rbe/NONiokEb
 zQTyaduBa7+W6zVJlU39Wa+l+lLOpqSNkB/X/n3lf6rtOFhqvme0h/wg3
 rHZvPzKTpCO1K5JXvbMxDgjCQwO892HKB+9X3qfZ/jaPYkFrG+bmiOtD0
 krwDHwXHq4sFJYvY/Qppzi07gCia9WV6zsPfYX6rNWFbvLcnEddE0CIZU A==;
X-CSE-ConnectionGUID: iWtvBRsgT9u0o5rWFCXCmQ==
X-CSE-MsgGUID: qzMLPxJcSxCUDGb07S6FFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="84544314"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="84544314"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:16:24 -0700
X-CSE-ConnectionGUID: peMDLf8lQGqMs8XI/JuZJg==
X-CSE-MsgGUID: OgZgIS7NS3G6MfrDhZuWcg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 10:16:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:16:23 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 10:16:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.40)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 10:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBET1B8e1pBOWNPnEhU3KexWpgWGQxom46VcYpGc7r/XjMulGysDxDd+P5YqUhuFci06VltHyM7i89G/cWCASV9NEsVtEf7wuQ3wLBq6D2AmxmfUNBKOLkr5Y5SRHIB9sUnqWUtIatCdkJufg0jD2FmElBAPQFoevrRUb0hZm1rGyu7Jzsa34LISq9xqBuW2UovZiEvYb6b2eiY6ltcbc2+sE8PkBgHZNw+VikWkSJvwwT0FXviMxURvPtvWY0AI6/oGcln5jJGtCpqYopMHSrEA/L8Rphpd7hp7fKN12C1CNgLFciU8Bn7kAMtjx8mpWERi4DgLsXd8Qng2TnyRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdsLSz8C5Od8yfVotadnpWgxGP2tWMgAEYu6qV5xdHw=;
 b=RWdDpFcJFqLBecM3m4Z+qpzdq4lX8OVz53Eg2qicWAXP4aqtwZ4RQ1HWqCPtw6HAvjzz+Z7UEQyc6VlTS2NotR6PELh5QYH6NDj4xdP/83dfnyKn5eNJkhEwS7grJajB9n6clAOL110+NgsgR4WQ+35PxdpQWkNqJME1CIIEEflvoxyASwgqOCbNUQBK1X2w+zxfmuPy3OCQ5rtY8/z1oL4LX3jx3lZpyAT/EvcRvxT08obd3q4J0MmwyZHwlnZJ1k1G3U8JixMv9k0D8g3XV4Y/0yRe5UR/NMp+VwjrYP8b2IAnP5bMALx8awUQ0mJJQHcAaJatsVND9+lGRdQXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 17:16:20 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9094.016; Tue, 2 Sep 2025
 17:16:20 +0000
Date: Tue, 2 Sep 2025 13:16:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <daniele.ceraolospurio@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v3] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aLcmX-B-nC29ALHF@intel.com>
References: <20250829063111.1893121-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250829063111.1893121-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL3PR11MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ab8aab-4cdb-455f-e74e-08ddea446eef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nAFnnSmHXOhM5GOWnfcLF9NZtMlbDePlFEN5oGJn8qY2K+NCFFE80U+qoy2n?=
 =?us-ascii?Q?TK2e400w5JDI+LfPAUiP3xLVxYIhYeracX03Nj1TUhRMBDLfsJjxiXwS4CRk?=
 =?us-ascii?Q?bKvxxPSo6mlgjFEbNOv5PJ8GqaUuBreQDevVYusIOuP4bXy/3PlCRDRTrZlt?=
 =?us-ascii?Q?Adjv94SHNSGNBFehL/eQkMyCXu2mHw2sRWh5eFIa6iplOeZgGmP2dVRvKGCv?=
 =?us-ascii?Q?EmnBmKahFUr1NvcP7hTvq6BAyLo70d38YTgQvAaYWsPuxDx3yH+suHYKRzty?=
 =?us-ascii?Q?EH9zlRGACkuKIKdGqwXD4FR1EwQdESW2TwmixohpZKJHFK/Q+H4b62V+Aget?=
 =?us-ascii?Q?xwuHlZw6lypEy2KV1OXE8UXW7ikCWD4hUjZT4FeR/377pEMhssvyRlSqYfNP?=
 =?us-ascii?Q?O0VYkj2gmN8xOzJO4SGbpDvhx4kSeaQCB7yY1guMzoCrXyIIUZPOxR9m9lL0?=
 =?us-ascii?Q?qO/GSUHmh/NT8VimtLPzulbIEh///LFixIkqbA37gjNMysTvE/tLMNAI+zFl?=
 =?us-ascii?Q?HUyzX7OuCkFdjdWCbaccfKruI4H0PrfTKNbeKh6/uvIqaviB127zUebokIPh?=
 =?us-ascii?Q?xvHrKLTtgpTPHXU+kq3PtvJ3a5gQFoQDsXj6TWg9qg2j1EVFMIrHAuvab5lz?=
 =?us-ascii?Q?2kpcQ4VtGWGNxzrQRt+4Yo4r6CKp2RA4Dqw/ozMPcknpAMeqcdaXMrW6cYG/?=
 =?us-ascii?Q?utOOOf1zcPpkjBFkNSb8VVQsytAGPhHSHnVNYxAUhXANw65/cHTrD9ZlNezM?=
 =?us-ascii?Q?cz8vn4jH/HkqYCRWIZhEpG70Jhk7Pon1ouuZ4s4JJDF8chZ7Kc12H4UdLIpX?=
 =?us-ascii?Q?4VbHhmamVuwe0T2GIiPn2ujlgWvvY80CnHJON6az+k/fPbazAzu2YTzf/xXh?=
 =?us-ascii?Q?defxriydtA2rElA4VwwGzfjGgU6KQ0lKVdiay3OL6Clk4FEF1a9NiMx4sWh0?=
 =?us-ascii?Q?Uy7/EjN6CeeHVvBjjgys8ZNyKSYRToPR5YWtEWkI7m0lwn/Zp6GD62sASeeO?=
 =?us-ascii?Q?VntxSi4oI1Yvm2S/wLyzpnJilvl0Z9rtxMV44E30Kn37i6FggRNF09iCpXFM?=
 =?us-ascii?Q?croTu4PUUlABj9WUlLqY8OIQQ7XK3cU35O/YZ+V+gAfIMWP5nemYVjgzoCwr?=
 =?us-ascii?Q?KXbhLDVAmtPAmq9itgPB/WOalrKUFX66v6KMWzo/+zam7QrXAsW4zdX7V+ec?=
 =?us-ascii?Q?1yCWI+vIi77SM7PnVPnpusj+tCFNNv9X8E8mOiDs5hIN/tNVCtrdypTyz/OC?=
 =?us-ascii?Q?AQNChGhT5j9G4LYOdzmmPgJKLMAkq23QQbDGaEybt6DR5K8jMxcoBxrCl0TA?=
 =?us-ascii?Q?UUOVhiIHJOSgJluXwWXGYPxPpClCJ7RUOo3YluTgOBU8g1xP62QFrTSDLbOY?=
 =?us-ascii?Q?93irBsgHx2iM/RPlp6QkWXPbkUYK9DRrKj0dZJxHou4FeOaGVE+7PcMapOb9?=
 =?us-ascii?Q?yjflzEqnAEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4UMq/4Vlk6WW0+Di5HQH9DhnLR7dVPxiI8MnUbRyT3ps8XYJAc2NpRhVPtAx?=
 =?us-ascii?Q?iRbOfGe694uga9qi3MD44VqYe+BKgOUot89xss/8lu539FYILJDuCL+cJ0c0?=
 =?us-ascii?Q?Yf2qSh4TYObOElRq95sVGv6/RzmUYRVayzTPa5MDh3zKB9oo5co8dxsKRmDn?=
 =?us-ascii?Q?C+iQJ4rVHvGLSXGrvyY5cKTlzpbNL7bbaBHxp4tg2vtmM/za2ck+KJCMh7xu?=
 =?us-ascii?Q?rqzeu55Wy/YYgFfC4t22LHGM3tnlLgPBuI+wz1Stw+xLpSaEcWzBLoGUEvb+?=
 =?us-ascii?Q?NyuAahbMavuBZ2Fal1LAow/bdfDxgtPLLRJggYJTieGydQmECNXMsQeJIQID?=
 =?us-ascii?Q?y9++H00UOzlWmopE9iIZ/KcuaGlaGc2oI76/6qPvCKE72qsEggA7vr3FPt5X?=
 =?us-ascii?Q?cgarl4+0spyVPaYJcRMkXe0+Lk0IcnUf9R1FWoEDz5F7TZUEX5FqmfXua63X?=
 =?us-ascii?Q?f16pUJOK3R1MItzlNmdPq1lUb+OCyDsvhbNOLvSeKLNDImkE3z7M8KY4FiA/?=
 =?us-ascii?Q?NDmIkdPNvyMbDyJPYPc1xNX3bJtXzP6pvXYijxwaT2HPsoh5z/VtwV/LXC2F?=
 =?us-ascii?Q?WHqXEI8TR9Ru1TVUGsr7ayVPi9FPlRV3IxXkMsPa0V83voLa5zWSv+PLtKYd?=
 =?us-ascii?Q?wCGgAKSWglcppp9YEbh+rhWESL4wGqfa1k1TQpEaAyQbUDZrZdDz9nB+EIIQ?=
 =?us-ascii?Q?zuhY3n/j7Cp8xkU8HFGUhUnaQXnVpCd94D8wQ11WTUE9qUR0LcJoh/yZ/TA6?=
 =?us-ascii?Q?u7XmLQRr1+O8Ki+EMrUkniUcml7RoihhaN7QjAPMT5p3V9SOsXDflzLcmcgX?=
 =?us-ascii?Q?y/3DuodLZC1uccpTS4iSazBY8KLyTFZV74FNSmlGI5TDy5dxM2qKE0/BhxqX?=
 =?us-ascii?Q?UsMRwQy7Elk2WWb3evxBRCSzP4ySYq+sW+8uNXf9KpEvnUiE1mFk9Vpftr+T?=
 =?us-ascii?Q?//WeL1oC1je8SCjOD/IKsfL1wXtgu5ch3M+EYy8m0RpihXcUkFWD3Vz3I4fR?=
 =?us-ascii?Q?FXusnPAG5ZMSyiRQyxO4VWSO4Ktk1AJRlqDD0E8wMRE2ngYqmEEFQjdnmSb/?=
 =?us-ascii?Q?OlD2TOnxRaLohYM3kWzemvkfqFYZH0ZxGtHDP6Q2W7zXoI/jGgIfRwZHbbxN?=
 =?us-ascii?Q?Zedvf8yobpdA4Zf2WzVYU/9BrjzjXN56LnHraB3dnd0YsH8bza88955TInZM?=
 =?us-ascii?Q?90oXpPSqCoQOlfeS966iCbXQVPlZKSuW3WYJgjqTJ/i7Mk0GwnUtcD6uxXOj?=
 =?us-ascii?Q?oPxZvv2lCl+SGan6JETvNBZ4vdDIKnR7r5yjSOEVa9yaHdvX0rPGRSgcXXtH?=
 =?us-ascii?Q?vWUWMh/f+QD5I/MSKSgonjUxawoyiTc7oe1StJCYOPDiAzdx7C+YItnjIX3M?=
 =?us-ascii?Q?nBOgYWvSbYvtbfUkaCyUNXJc7S+S6v6aR677Yawojm/+AjTgh1CDRXjEnejf?=
 =?us-ascii?Q?rKfcNiF6LsGYy8V/GEQREI0Gf5pWsAhKhnL+6Mb483AZ5DbufD49rdYyenAy?=
 =?us-ascii?Q?nyKSBBv9Hj0bCOiDfhctk5I2qujuMOTEC6ttq09f2V5036O/rWkYUYd0TJxI?=
 =?us-ascii?Q?QW4YmSu7Mn2g30iDmJxuQaXOaXA1QfZ5XMUqN4Xl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ab8aab-4cdb-455f-e74e-08ddea446eef
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 17:16:19.9066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2R7h40q6/475y0q9bWi6FJwJBmeS+3R8yMthSAswPG0u4myMghSIFJP69dI55wLDl4Vvy2qvuaJbtend11wWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6409
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

On Fri, Aug 29, 2025 at 12:01:11PM +0530, Raag Jadav wrote:
> If power state is retained between suspend/resume cycle, we don't need
> to perform full gt re-initialization. Introduce runtime helpers for gt
> which greatly reduce suspend/resume delay.
> 
> v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
>     Use runtime naming for guc helpers (Daniele)
>     Introduce xe_guc_ct_register() (Daniele)
> v3: Drop redundant logging, add kernel doc (Michal)
>     Use runtime naming for ct helpers (Michal)
> 
> Originally-by: Riana Tauro <riana.tauro@intel.com>

Please use Co-developed-by + Signed-off-by instead of Originally-by...

> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     | 57 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c    | 31 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c | 56 ++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_guc_ct.h |  5 ++-
>  drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
>  drivers/gpu/drm/xe/xe_uc.c     | 29 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>  9 files changed, 182 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 34505a6d93ed..9b07bd017570 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -943,6 +943,35 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_runtime_suspend() - GT runtime suspend
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime suspending\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_uc_runtime_suspend(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
>  void xe_gt_shutdown(struct xe_gt *gt)
>  {
>  	unsigned int fw_ref;
> @@ -1002,6 +1031,34 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_runtime_resume() - GT runtime resume
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime resuming\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_uc_runtime_resume(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     enum xe_engine_class class,
>  				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 41880979f4de..3f793230e78a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -51,6 +51,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>  void xe_gt_shutdown(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 37d06c51180c..f304d260b22a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1355,7 +1355,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>  		guc_enable_irq(guc);
>  	}
>  
> -	err = xe_guc_ct_enable(&guc->ct);
> +	err = xe_guc_ct_register(&guc->ct);
>  	if (err)
>  		return err;
>  
> @@ -1626,6 +1626,35 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
>  	}
>  }
>  
> +/**
> + * xe_guc_runtime_suspend() - GuC runtime suspend
> + * @guc: The GuC object
> + *
> + * Stop further runs of submission tasks on given GuC and runtime suspend
> + * GuC CT.
> + */
> +void xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	xe_guc_submit_pause(guc);
> +	guc->submission_state.enabled = false;
> +	xe_guc_ct_runtime_suspend(&guc->ct);
> +}
> +
> +/**
> + * xe_guc_runtime_resume() - GuC runtime resume
> + * @guc: The GuC object
> + *
> + * Runtime resume GuC CT and allow further runs of submission tasks on
> + * given GuC.
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	guc_enable_irq(guc);
> +	xe_guc_ct_runtime_resume(&guc->ct);
> +	guc->submission_state.enabled = true;
> +	xe_guc_submit_unpause(guc);
> +}
> +
>  void xe_guc_stop(struct xe_guc *guc)
>  {
>  	xe_guc_ct_stop(&guc->ct);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 22cf019a11bf..e3736300ffd8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> +void xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 848065a25c44..5fb41b5bd080 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -465,7 +465,40 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>  }
>  
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +/**
> + * xe_guc_ct_enable() - Enable GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Set GuC CT to enabled state and ready to send/received new messages.
> + */
> +void xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> +
> +	if (ct_needs_safe_mode(ct))
> +		ct_enter_safe_mode(ct);
> +}
> +
> +/**
> + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> + * @ct: the &xe_guc_ct
> + *
> + * Runtime resume GuC CT and set it to enabled state.
> + */
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_enable(ct);
> +}
> +
> +/**
> + * xe_guc_ct_register() - Register GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Initialize and register H2G and G2H CTBs and enable GuC CT.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_guc_ct_register(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -489,14 +522,11 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	if (err)
>  		goto err_out;
>  
> -	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
> +	xe_guc_ct_enable(ct);
>  
>  	smp_mb();
>  	wake_up_all(&ct->wq);
>  
> -	if (ct_needs_safe_mode(ct))
> -		ct_enter_safe_mode(ct);

Please make this a separate patch. It should deserve an explanation why this
change of order is safe and also be bisectable.

Thanks,
Rodrigo.

> -
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>  	/*
>  	 * The CT has now been reset so the dumper can be re-armed
> @@ -553,6 +583,22 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>  	stop_g2h_handler(ct);
>  }
>  
> +/**
> + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
> + * @ct: the &xe_guc_ct
> + *
> + * Runtime suspend GuC CT and set it to disabled state.
> + */
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> +{
> +	/*
> +	 * Since we're already in runtime suspend path, we shouldn't have pending
> +	 * messages. But if there happen to be any, we'd probably want them to be
> +	 * thrown as errors for further investigation.
> +	 */
> +	xe_guc_ct_disable(ct);
> +}
> +
>  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  {
>  	struct guc_ctb *h2g = &ct->ctbs.h2g;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 18d4225e6502..6529cd8d0891 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -13,8 +13,11 @@ struct xe_device;
>  
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
> -int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +void xe_guc_ct_enable(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +int xe_guc_ct_register(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d4b54cd34cff..df61876fda87 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -498,7 +498,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out_resume;
>  	}
> @@ -540,10 +540,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_rpm_lockmap_acquire(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>  	if (xe->d3cold.allowed) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>  		err = xe_pcode_ready(xe, true);
>  		if (err)
>  			goto out;
> @@ -564,7 +564,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>  
>  	xe_display_pm_runtime_resume(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..d99b8a795690 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -15,6 +15,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
>  #include "xe_guc_engine_activity.h"
> +#include "xe_guc_submit.h"
>  #include "xe_huc.h"
>  #include "xe_sriov.h"
>  #include "xe_uc_fw.h"
> @@ -301,6 +302,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend() - UC runtime suspend
> + * @uc: the UC object
> + *
> + * Runtime suspend all UCs.
> + */
> +void xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume() - UC runtime resume
> + * @uc: the UC object
> + *
> + * Runtime resume all UCs.
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_declare_wedged() - Declare UC wedged
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 21c9306098cf..5398da1a8097 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_load_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
> -- 
> 2.34.1
> 
