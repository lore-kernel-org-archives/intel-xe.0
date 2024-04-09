Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8D3CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24B010E3F5;
	Tue,  9 Apr 2024 22:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHC3U/Mn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067CE10E3F5
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 22:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712703488; x=1744239488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nmhk8KMkELxVk7BGM+m8zZxIbZZpivSUpJbsyLbgt0o=;
 b=XHC3U/MndZMAG1WY0DXuB1kLPhpRtwOaMACa5mGnZ0fM2fHW1shhOVGC
 mwLh/xvywqYOvB00uzA6vJoHvWiK7N+KqXRHaaFhtRAqwvSXsXjOUzunC
 FifPkZTZnvkTxkcfaHAfiR27RbptvEgPJqYIr4/ldUuHpOLadwklgCvjY
 xCt8lnblv8efMIOTUdZ8DnF6l3A5uTITIUAeXjczh6GJiIgm3AX1m9FGG
 JRMXqOoA9NP9jIQutQqIK7TvoNi2M0URm9teUeIau2jtPKviEtiBKcSys
 fonJBkcjtQHRrS3n+iRiZPNYVjYp+r74ny22QJFGOP1/odGCcybGWJtf9 w==;
X-CSE-ConnectionGUID: 9ADONnj1T1WC77hZuGE1Zw==
X-CSE-MsgGUID: 1JQjaBYGS0OHe7JivQPiQQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8221861"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8221861"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:58:07 -0700
X-CSE-ConnectionGUID: ybpNhjgySm2RMOnWgty9Zg==
X-CSE-MsgGUID: /7PU6tQwTVu9wSIolQHYhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="57811959"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:58:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:58:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:58:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfLtGQWSzJXide2Qdb2tsNYIOQIB5I75nw0T+VN9pmIBTvwBwrIPPpBGS2E2M7HiBpmxhDrYYlYw7xUtIX6xJN5q0r/fuptsnIPcbzHBAn1irzP99Ugqw6Y7D76PDwRfYkMOj0ta0MBN5eZ4YjJ94mt2kxr+uGCLnf9JTZp1Z1eRY5TQCSviFaLxzCN0xwpZ+IuVQr2+u/OwfhDacgiUD9iMqMmRLpJvjS5LxIlhE/R5KLJmPNKSsmlVeJ/M6+u/NID1TjtX1Jbs3WHBH/ldMXCU2po/QYef9hVBrECtIAykVgi9QIxBAwjLo9GdMb61lJUj5QK5V4hZcvWjYrC/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMjTW29p2F5xHDbwvZW7i0h4qTRuYyaRAy2a4qvWmGc=;
 b=XRXokSwJBRhs4+tM9KxElC9iS3wmQhz0T+e4HOzweWqwEFJPB6Jm2X5kkLDrBNT5k1kLR+O09+Jq82+TIPLSaRqYIQWND7QgYL18NkpKSanaONbEQuqFueYGHD/SmOCCzvMWRrwx1c16GbECQvHZCAIutFu0iw+Kk/FQhxXXKavgUwnWZlD8NFFH8/IiSVl3N3z4IXZ0Qz28Y4HzPozSPn6jkXXWEcypyPle0gN68xQQeO8sh8dWlnjW+2v0xo0n9/YhdMoq7KEjG0SkfDOmSeq5uAnVZrsGPKJ+MXHORILFkuYfgrsGizJxlCBjjVBwtAYn3czrecSSWFyS/Bd1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6106.namprd11.prod.outlook.com (2603:10b6:a03:48b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 22:58:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 22:58:04 +0000
Date: Tue, 9 Apr 2024 22:56:46 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <john.c.harrison@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/xe_guc_submit: Declare reset if banned or
 killed
Message-ID: <ZhXHrgyoZW2KhdEk@DUT025-TGLU.fm.intel.com>
References: <20240405175505.1161756-1-jonathan.cavitt@intel.com>
 <20240405175505.1161756-3-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240405175505.1161756-3-jonathan.cavitt@intel.com>
X-ClientProxiedBy: SJ2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:a03:505::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6106:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pNmaVhwLJp2+mKhX8EXh0QaB7mpyBYzblW/TJ/v++iaLfDq99iExc6Vpv1+V9c+w59bU/67urBELXjlyoT4q67/unpapCqgTaluO/K2iJB59TDkSD32B6jgoEtnncnwSyYsRk0vVKzrHy9kBDL3GTyhXz5EeOCUhmSOFCGaoIgqQWPVFSVPXjDqk6kdb/hSKuLejygQVN8Gytuy+q3Y0NO1466PU8lIX/G67fAtaPpL6SC0dXKVA+mh551MZX44BccGUjXLOzk4l+KEeZfkFdZoZpy/za9yp089lesdIXkghTHgqN089m8ckiS+HuGJRgA9vjReP0NuNFpDjGyzy3bdFnle27O/p9lbFIJW9/nuBr2BetytQ1dJa+PtUHRJlSqYQsnv5oXLIKqMM+WrfPv20FZ7eUa2QB1xbQcBO7SUGWKfaHTzWTyF1+BxrCurlURzyTG5NHTzGhgpaKMuBdNKiDXNZuELgdL2ZK8PFNm3xnLw8cSwJcNIGjYxJeFE2bkBd2TANIXoU10HUVl13v6QXWSQV/1nN41LaB+2Kome6Fj/N6K3laJQQvYhSEuBJcDAv2qJqYd3/YfuHxO2Pfj3m7utbSzsPXYdHvRBkdiy1J1NucdtReNdUXgOdSdhoiZjvuEGxMcxrcbgoAI+veGOvmXneC4CbFlpNnRGaLNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RvwnpjLUgMlzY3mUnfxbPzmP8AToEQ6hf2wNLRHAYcUXrWAZY/3rhQHTi1V9?=
 =?us-ascii?Q?lmRd6NXtue7Lmp0KmLe1Zm900VRXh2Ji/lPZ72mEWNNr+qqKjSxCEmgalSRa?=
 =?us-ascii?Q?7lN1pE/kYzdh7705ge6TOL9Uk0LN5yy6WPoBe/ZTU4J3L4pdNSXS8wOSKFKn?=
 =?us-ascii?Q?BQBi98csevhSOb2eeKh+oLMu2ohksq6NuIWGvNrWVC0VXmS/Mic+HGJb9DQb?=
 =?us-ascii?Q?wSbBzM/0oNUPb4g9JMCsSHUNlfRwgfLs5NoOBY+RnqwLV6plQAF5lf/0l/zn?=
 =?us-ascii?Q?vZwEOGDhF5fKHYsKADcxx3ySrK6G+qEvQWyLW9fRTEhGDB8GqWF5BF+yUKTQ?=
 =?us-ascii?Q?AQZSf2EMEO4Ej2U97gGiiCTsYrUdL3PWO+gJACbKjOQUzYitO7OSR6orwAFv?=
 =?us-ascii?Q?eGVIv9YyAl/x+6JhlSL1Gr3ehA7ayP+GlN2pd7JsUFnGXuUPOpvlMhmH7YtU?=
 =?us-ascii?Q?g1VhqkIuMvSGbW3zZL0kzmHlsfEgE4BKa2JihLykcsiHK0ip/iLLb3Z4NGwz?=
 =?us-ascii?Q?gh9Uazux7narjLEf9Bie2zDac8owkTTQUUfI21mKJ/cS7+TXfQyGVH6VNKwe?=
 =?us-ascii?Q?a2jl7IIhdB+VHuV1bwieBA4VsVbdG90vvUdMyCQ5iDjinyVofGjNKd9C9AWL?=
 =?us-ascii?Q?H+fOz/tHNkv+gokVq1fEpaFW0tQW1W5Dda1e5zU6828eFa18INFfhYvrGqkb?=
 =?us-ascii?Q?ObXEKp+tBX7dK5UVaOvE4MMZD4605KiRMDRfHMc6R9HXWKlUvfmezqdHeQbZ?=
 =?us-ascii?Q?vUrY259jvHH4yhgyba03Se5KcYWBP3uf0Plcjvo60Dzr9T7vowAyFlZCDUd7?=
 =?us-ascii?Q?lRRzORsNuKecDeVUCLHyAWL0pkvf4ArIgKZu9PBk6TMBOriiQwLLHnKclkLe?=
 =?us-ascii?Q?IxkyYDlBR4vXQayybXpisX+H0YIyEVtqeYhiMqZvZFx6i24LVfu1/He+9t4n?=
 =?us-ascii?Q?cEqm8AMil8ip/BL8Efi6WEw3gta9+mE0FBiT+OrxAFCnEPN5pmwa4lyS5mQU?=
 =?us-ascii?Q?OurkPTncie3wYtmZ54IlBQhat4iN7AfzM2BcitMO7JJRjuaDSyYO4hQTb8Xz?=
 =?us-ascii?Q?CcT3L+9HJtTgezVjC2rYwyJsHdhb8Y4BbbMr1uIEERsSLnOHsQp+f8Tzb2W4?=
 =?us-ascii?Q?EbQoBXF0/Q/l/nuu9Az7UlFuHYo5848u3TA5lQSSXtucTWR376hWX4Oxb450?=
 =?us-ascii?Q?E6AGVRbsl5dxL7MrrmuLLoBwUcjCYOeWz/hwuxh7LPwa0CT2W9mJErPWgo1D?=
 =?us-ascii?Q?cGhW4Q6PHmYdaY7KJU3Xiqb9RSEe6LLbhjscRytxd9Ikc15VGweYJ6Oud7ky?=
 =?us-ascii?Q?u/H23jHf+ipkqcyt78d07M/WIKWDV9KcRAwVu9bnU6NxKDfaADnP36umgRLq?=
 =?us-ascii?Q?Ey0vvUf206veQBa++AUqQk1cELf1/8e+f8un9BP1WBOpOTph/cMq/YEK7zM8?=
 =?us-ascii?Q?EdsDhBfiJvarXiyKRYTU2eYdnsV5mMrejha8SlbCdfLymxsCheh3ZDgHGkpy?=
 =?us-ascii?Q?zD3GzNERIdk/V17S2khwjVH5/6eOOLKxR8P5gMr8M2pZV7bA8aWKYdq/l0f8?=
 =?us-ascii?Q?tuI3DozWz8awbdNM45+6yUPc6Yl/1MXPECHB7YznZHbd0OMjmcHp433jAHVX?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98979c4e-2ca0-4b89-bbc1-08dc58e8839c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:58:04.5292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcE3EfiieUjVyM5YHgZ5vFPoV25AZ1ExXm7wEfXAMgkRhGIxbSrJBpUTCrap2knLRB+iEyahCgTm5j4oMhu1RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6106
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

On Fri, Apr 05, 2024 at 10:55:05AM -0700, Jonathan Cavitt wrote:
> Add an additional condition to the reset_status guc_exec_queue_op that
> returns true if the exec queue has been banned or killed.  The
> reset_status op is only used for exiting any xe_wait_user_fence_ioctl
> that waits on an exec queue without timing out, so doing this will exit
> the ioctl early in cases where the exec queue can no longer function,
> such as after a GuC stop during a reset.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e72f2a6cad60a..d5182f66177f1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1371,7 +1371,7 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
>  
>  static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  {
> -	return exec_queue_reset(q);
> +	return exec_queue_reset(q) || exec_queue_killed_or_banned(q);
>  }
>  
>  /*
> -- 
> 2.25.1
> 
