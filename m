Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7ACC2BBCA
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 00:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF1E10E134;
	Wed, 26 Jun 2024 00:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AI7RQhKu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E0410E134
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 00:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719362172; x=1750898172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JVm/+J7BsNaFg4FRlmXMKHhMLLH6NWXv3b/E2UPr8ZM=;
 b=AI7RQhKu/JloxcJjh/ITVVsABchV/RUnLnnQ1XBD5YPpk6oXid+u5cNo
 lYyQxfAMiEoKQaUI30zhe3j2XDjKQPNWa9r72mMmxvX5xXF/6EaYF37Uv
 /TIQZ3qdlZYkTOv/makpF8Ewf/61e7IzBtrI6IPOBIZ4MD7tmVi7+05Ur
 +yvnsWOV02LeiclwQg+OC3iAkUQIpJGZTAGYC/vY2IuJfVxM2s+w7bNc9
 +RurOmjAuOZsoZp5/U0PBX6PXLIotzt4UbKnoQmVitMkIxKbCnOieBfoB
 GGJZyaUyG/9moxhjLCH3o8bNlYnhY67tcYmFoPJQuVlccGyk1X8DeSACF Q==;
X-CSE-ConnectionGUID: C38a8rtJTaCvX4TvjbrWTA==
X-CSE-MsgGUID: 7gK74vH8TOqLmFtdkNIzIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="12248197"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="12248197"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 17:36:12 -0700
X-CSE-ConnectionGUID: hkAcxBPNS4eXCoyU9Hovvw==
X-CSE-MsgGUID: 5rZhx0zRQ0eIeNBA67vpBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="48992667"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 17:36:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 17:36:11 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 17:36:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 17:36:10 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 17:36:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyBUptfhoXy+H3R7AeibnYvSLaU6jtoXM2gI6hEv3hkEmIvV6v3RFChXgLDOZx9rMWwfo3ZDB1r77z0bdH5JCFsRfz7C969fvbbEEpvhozmDSHhvK+/tBzes+0cCMfFX3LvpBZJmHLKObyxYSXYDHoEYgJRvETtciceV8hjOr7OZt0SCA+BcpuTHiuN7R0Z4iFVRawXrfWfYa7LiMYguaWky00NI0YARTP6NJeCX9XJeVH6/gAfVnK3OzndMnvqiYrSJjxP+JagJH9FKJMUYU2QkqpIYJfyj5WuI0sgF0ovCrTy7O2ZWa7deEuBK/GsmjPPFxVsJh0mejcQQ6tFynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoV2e6uECn0qarTKBwdoelvBuFV4VXY/8npZNhLyasM=;
 b=EWskd9chPuWyvFep97t3ZcdkNyLR1xuixKEFaEzdy3EUqUgIw5UrCH6RGRuSCZ3NserrHgWXKI/3yZ2ev70oLK98PF2CiDmLbDSPiVCfB7V2CUwNGYUsHRfPIwNiKPL+Mk3v1VXcT2ritVtssRQr3lggajEW6pXPhG0nXCbB0Mp//CgJEwNLIEMutifdKwujoPWHgD4PfMHASLeYeywmfR5iPzb0VAM5zjIFXVga8tTGiMXsDxmqM1lhwJLN1UCZI+K4yXZxz6Ogf1H0K3PK7V8XQge6MyV5ItSYxp3Ge6dq8Lukhf/MtzEQ1K1weuHJdMHfMETbw6yJcLP9M6rn/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Wed, 26 Jun
 2024 00:36:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 00:36:03 +0000
Date: Wed, 26 Jun 2024 00:35:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lionel Landwerlin
 <lionel.g.landwerlin@intel.com>, Jose Souza <jose.souza@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Exec queue op's to enable/disable preemption
 and timeslicing
Message-ID: <ZntiT7iS5FMZk0wp@DUT025-TGLU.fm.intel.com>
References: <20240625201518.766925-1-ashutosh.dixit@intel.com>
 <20240625201518.766925-3-ashutosh.dixit@intel.com>
 <Zns9O4SNJ5YIilUR@orsosgc001>
 <Zns+LDMVXrBp04nU@DUT025-TGLU.fm.intel.com>
 <87le2sh7ok.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87le2sh7ok.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7083:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be23617-2524-4092-1398-08dc9577f569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7N0r/ruWpm03n68snJtYu35MWvMkb/rbY9/xxdpPl+J4FRH72cztXOTkPnNP?=
 =?us-ascii?Q?ZnFZT66F2Ol3zEpUYTMuRkq2I/SpMS8VelaRHzxhDh0v0heM/XseK+aTX7z3?=
 =?us-ascii?Q?a5DamdanHlxn4Qnixh6BwaCbbySjn/Ho7MdyE0EVbkgiG85jJeBhrf+iPYhC?=
 =?us-ascii?Q?KfMxAn9zqyWKDWqUGtZnIQ5j80P2VPoXYaV7ccT3YqYYaJlIBnDwRfRHTgJk?=
 =?us-ascii?Q?xtOy8r5q0XpLnwgbZvmvJsxwKeGBnlf7JQ5vT+JEjsjlFtL9YCzEN0Np3o4u?=
 =?us-ascii?Q?2obOn5wIGIYozHVeP2RvLajhOHX31J1fdQ7i2ufllqrG2v2oQj7fk6RsmBSg?=
 =?us-ascii?Q?TjCepA5YVd0FyLhCU4Rsh8ZLAMG6G/Ngym05w3bqo89c2/qS2w1/98CQJwJg?=
 =?us-ascii?Q?xlk82Ed1hImfPHzgOHE38LZE2o+YuvG3CCNN39H42ygGsO8q4V1PFV8zn/hW?=
 =?us-ascii?Q?1ztAq8Vi/XaXRXaAOBBtJGfh7Yn4yjhgkX2hpfJ2bW9rvEZdIr+rhSP2Dstx?=
 =?us-ascii?Q?B3awhsEpol2eyOIwoqIxuq/kTYcVbvDt4RMWR8HMYZjyTGJpZyIgtVWhalqA?=
 =?us-ascii?Q?KD3zFHskHJWaR1Elaq8UmgluP/sRewfzeYrz5t5YRiZ2wpAojpm6l4JqqKmL?=
 =?us-ascii?Q?KkE/64NgJ/lb4/8EGXKwS/1RFbvgZKU5FbkbmnY+jaYgAlLXWgOrRV7jA0et?=
 =?us-ascii?Q?eUJjLAA6IOOyy+IrZLqAZh/Q9XiVCOSxJ6jKxE5atfObIlrFWCs1NYs/vToG?=
 =?us-ascii?Q?ErEb1Jf05rl+dyOClgfcZXYp3JrAyg0+YRGh28iV/RsNbKgJp1g+OnOzl/uf?=
 =?us-ascii?Q?72qyOoSaq5hJS4ygTCmDicCoNX4w9pzpCcT/+/zfwxfwDFsFiNHMzEqiVE8P?=
 =?us-ascii?Q?hp08ElqaXC7z4DaEJa/2u69ub1v1Fl0KNG2D20If75cIk3UfHuOsoqcsHaLQ?=
 =?us-ascii?Q?XxTengfcwRzQqoyidv5cyO43C7dMmDFfA5xxm1B/uoLUK+TMz7mP1MupXyzD?=
 =?us-ascii?Q?3pytSkdx40kpSUDfpqk4MIt3qK1vrPbwVAb6bUDNKINoohF10TlZNscL8ULo?=
 =?us-ascii?Q?4GFkQIJTclyvnnCP9h+9IiKYQ3mroJx9Q8mtXgofGHz22wVUV4Augi/r8xSk?=
 =?us-ascii?Q?t8QxXoxbUrl1ruksGiib9gNMr2+V0wEGNihRPPo6e7VY6F3XQ0UyDL6F99Of?=
 =?us-ascii?Q?8a1xgOBpGeF+RP1WmX/BitWYsV6dQztn7K3VBZenSij8027igyudlofG4iW/?=
 =?us-ascii?Q?Id2Qu1Mc5xpg8JCKyC2N+vMfq3torT0fp3ysyQxtNDYHadVPIiAKV2w6YpzU?=
 =?us-ascii?Q?cxczA1f8KqDy7HuZU/fT24a+WKUoIuF7WPm7sYDFNxzaHw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+6j5tUiNOh5/KNpZfeOLSzRpFlmXRC0DM31QKK2aOiFsX8mth0CsCdR/xfDy?=
 =?us-ascii?Q?m632QEWdXawScQd4AZsxG1OdPYdcXxXGxifqibuTiBGLf0eQ8HD76qF5Q99/?=
 =?us-ascii?Q?kHjNeWMsxTbgUA1fiVH0BF01o17LQ9AJW9YJqMoqiRZPzsUEzWVMVRCk/SuZ?=
 =?us-ascii?Q?qjJ1hwOfxtLqI9ntlxmOJv0axQWQ0EqDXSAJtgke26UbtI+lSbgtstmcwFxW?=
 =?us-ascii?Q?RtzFVGSoMi3rGSINrd34TVwneVBWkwDq/ZFokmMwjBc7lRPKKicnKetnRMkG?=
 =?us-ascii?Q?0zn7Saf9szmc9OWr9Icn4COakgLEKncv2h78H6bjeozSPueszI0HibcrPUKt?=
 =?us-ascii?Q?OU36ZYPdu7KuT0QAu+K0mpFmbIZ+jawAru/DuBpZR3MYbE0tJYpJtlGojL0j?=
 =?us-ascii?Q?67o1E0sVf6dAVlN4Stt3nd5Aiyf6Wrn6PBcnU2wmNT7TQ5mdqDyBbZu61sFK?=
 =?us-ascii?Q?2/q1Q8mMgxpW/8/lL6D3YnLqz2g1l3i37mu84qStxAvuDsrQ/A/k1sK/pzhh?=
 =?us-ascii?Q?G341MVLSXGHhRj2+b31krMHIkcCeBxxAf8k6Yi85V/4G2uU5MLyY8Vz4zgj4?=
 =?us-ascii?Q?hTjIFOimN9AXzvkU6Ae3LVMPsgogZrQug/vT6kYt5vUiIMZ03aC25P5e8C0W?=
 =?us-ascii?Q?qNbWCIjHv8fdqKuFxr3I1i4pdvIvD5Yru+9fKI5O208qniJZPxpph0+a6KNT?=
 =?us-ascii?Q?vtLjixlBQgVW5JdRqBqD2SSZxsrZvgkjD1l4L5kBUUb++V/v5IhonRp0Xghw?=
 =?us-ascii?Q?/iVxVvQVBtClT84CR+GIOwZVeaUJGQCxyZ4/l/PuCrvLinc5akM7ZJbiayZE?=
 =?us-ascii?Q?OcGIombh1iJxu3OQmx8rF3rc3msJimGMBr7YGxJiky6oMFivptLmaNVkgGwV?=
 =?us-ascii?Q?B7O/Wpl/fUKgdtIPgpW9rEikOyG40CL2jL02yMf20OtlbwF4HlAEKZ5bN4Hk?=
 =?us-ascii?Q?DmhoFzBujckIGt3EbjJBN07OPXg54GdI3x4etZZm3GA1MyW1ai6qxBM7tSGn?=
 =?us-ascii?Q?+fbapXk0T1/B8OSK49GHuK8iZ4epavL0x/Zyfj2LS39a4+ts6aUxCVOA0Cjv?=
 =?us-ascii?Q?S4fGikopibkszUt0AHBKUJwJkmUyBQcR+BE1iwfoWbaDsarVtXZaU/EnrYbm?=
 =?us-ascii?Q?xgZS/d49uxwBsviLH6NeD6/62Q+uYqo54XxqH2xgB1F8FKndZo1oTctJAn9y?=
 =?us-ascii?Q?7UD7G5v4TCMGjDzh764Ew/GSFRurjxTAH4uD8yxWSMyyHIFeMNYpg4Ks/T0a?=
 =?us-ascii?Q?sVeaKVDfoWzUlg1GpSMUrOBsaec1eNboOAT5S9QRc18ZXRrl0I2cVNGgDx5b?=
 =?us-ascii?Q?4CDYpDt7GiyDLL+gdnNB9xz63AJV7Yye8aROenCujEbta+XR+mmDqKhn7qVp?=
 =?us-ascii?Q?aM5Zlf6irnuoLxEvuqbECAaQv3AKFCyMTaApLru+3OoX0O1la4YyttOwJ9Rr?=
 =?us-ascii?Q?gVSwLH+WNHCkf6uxCZvPjxMmh6R0C//wRLjLl8iX687l37KBxt6cKucoIAjn?=
 =?us-ascii?Q?Up7I+Eye+h7LblABWFtusnpbBOG1VbHgpfgII/QbMjEvScxzbLZFbKv2W95l?=
 =?us-ascii?Q?a5uFTZ1JPq9mh+nEhv7IASs2Yk2QIUc4ouT05mZu0q73oa0BBvh6gskvKEYQ?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be23617-2524-4092-1398-08dc9577f569
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 00:36:03.3627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPCzOvvjY6jpxD3L+3VkK8+QmAt9xWvyZcegmxAtWJDbjNjXkxS4MIaiBxhwKgB+pAnbYJWwT6PZp/MjpgSqBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083
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

On Tue, Jun 25, 2024 at 05:24:59PM -0700, Dixit, Ashutosh wrote:
> On Tue, 25 Jun 2024 15:01:16 -0700, Matthew Brost wrote:
> >
> > On Tue, Jun 25, 2024 at 02:57:15PM -0700, Umesh Nerlige Ramappa wrote:
> > > On Tue, Jun 25, 2024 at 01:15:17PM -0700, Ashutosh Dixit wrote:
> > > > +static int guc_exec_queue_set_no_preempt(struct xe_exec_queue *q)
> > > > +{
> > > > +	struct xe_sched_msg *msg;
> > > > +
> > > > +	if ((!q->sched_props.preempt_timeout_us && !q->sched_props.timeslice_us) ||
> > > > +	    exec_queue_killed_or_banned_or_wedged(q))
> > > > +		return 0;
> > > > +
> > > > +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > > > +	if (!msg)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	/* Setting values to 0 will disable preemption and timeslicing */
> > > > +	q->sched_props.preempt_timeout_us = 0;
> > > > +	q->sched_props.timeslice_us = 0;
> > > > +
> > > > +	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int guc_exec_queue_clear_no_preempt(struct xe_exec_queue *q)
> > > > +{
> > > > +	struct xe_sched_msg *msg;
> > > > +
> > > > +	if ((q->sched_props.preempt_timeout_us ==
> > > > +	    q->hwe->eclass->sched_props.preempt_timeout_us &&
> > > > +	    q->sched_props.timeslice_us == q->hwe->eclass->sched_props.timeslice_us) ||
> > > > +	    exec_queue_killed_or_banned_or_wedged(q))
> > > > +		return 0;
> > > > +
> > > > +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > > > +	if (!msg)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	q->sched_props.preempt_timeout_us = q->hwe->eclass->sched_props.preempt_timeout_us;
> > > > +	q->sched_props.timeslice_us = q->hwe->eclass->sched_props.timeslice_us;
> > > > +
> > > > +	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
> > > > +
> > > > +	return 0;
> > > > +}
> > >
> > > Why not just use the .set_timeslice and .set_preempt_timeout hooks instead
> > > of defining a new one to do both?
> > >
> > Umesh's thinking seems correct.
> >
> > Just use the existing set_timeslice & set_preempt_timeout hooks with 0
> > for disable and q->hwe->eclass->sched_props.timeslice_us for enable.
> 
> This was the approach I had taken in v1, I just resurrected v1 as v4 and
> sent it out.
> 
> > > Also how do you check if this operation succeeeded? Is there a response from
> > > GuC indicating success?
> > >
> 
> .set_timeslice and .set_preempt_timeout have an error return. But otherwise
> I don't know what happens after these ops call
> guc_exec_queue_add_msg(). Maybe Matt Brost knows? Matt, is this operation
> guaranteed to always succeed? Since there is no return code from these ops
> except -ENOMEM.

The only failure point is the kmalloc.

Once the op is submitted via guc_exec_queue_add_msg it cannot fail. The
H2G which communicates the change can get lost but in that case
something will trigger a GT reset and upon next register of the exec
queue the correct value for timeslice / preempt_timeout will be setup.

Matt

> 
> Thanks.
> --
> Ashutosh
> 
> 
> >
> > Matt
> >
> > > Thanks,
> > > Umesh
> > >
> > > > +
> > > > static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > > > {
> > > >	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> > > > @@ -1598,6 +1641,8 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
> > > >	.set_priority = guc_exec_queue_set_priority,
> > > >	.set_timeslice = guc_exec_queue_set_timeslice,
> > > >	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> > > > +	.set_no_preempt = guc_exec_queue_set_no_preempt,
> > > > +	.clear_no_preempt = guc_exec_queue_clear_no_preempt,
> > > >	.suspend = guc_exec_queue_suspend,
> > > >	.suspend_wait = guc_exec_queue_suspend_wait,
> > > >	.resume = guc_exec_queue_resume,
> > > > --
> > > > 2.41.0
> > > >
