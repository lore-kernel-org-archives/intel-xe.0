Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AB6D3A697
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 19:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0380310E6F4;
	Tue, 29 Oct 2024 19:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZ17vbbu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0E010E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730231435; x=1761767435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U+rpN2OErncp5932SX3HlIidWt9VyJUfsozUNU3CTR8=;
 b=MZ17vbbucUFl6uygRRlu91yMuo8NeU8o7pCczOQPsKYO5tT1BEHO2qTI
 9PUkr1nRTRVzchuG1qwwOK7d9lrk18f2OJHKwCO5E/1mW8zfEU4dVPDo/
 2oHP8qweWjoN9x0UhF7oSaR7CgFy6SzVgevYFc0m12RUeN53Hh2/s9lB3
 Fw9MKyAVnbM26DpciU6QbDP9bi8zIfF9mVNQPMLATENNv+hT/4YN6vKZs
 nmtHxmFGXEhkXjXgk8NuMtIgTQCF6HcdAdiuGgvy9RxyfEE0zhrGogLe2
 QelXFr3uAg4SoYq4WB/u3VMT752SDRfgFzJSpIVkkYJunIYhDC8vCX+LE Q==;
X-CSE-ConnectionGUID: 5YeW4Zy0Q4CVBXB61unfKQ==
X-CSE-MsgGUID: 2JplsFcxRVi2TopYDA7/5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="40481042"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="40481042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 12:50:35 -0700
X-CSE-ConnectionGUID: kVajda2XSrWmgNTGq5HstQ==
X-CSE-MsgGUID: HHRFU4mpR4GLGHiPcxSjnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="81990451"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Oct 2024 12:50:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 12:50:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 29 Oct 2024 12:50:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 29 Oct 2024 12:50:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKnvIbDRZNQtVgKCGwS8iyum4thDsoTyOu4JaoCQbm3/haFlQ1Da54tL9E34DIxaXRdokpEd6WtartDxDwCzIxE1bTDIOOKNgmBAf0U1tXlZqF0ECLbQmX7o56i2UqnFueStEHZyMLExri5ybEYQ/L9FLR4xHJtrPGHaw+BLpanlJnVPRaGj5hwsm2lQuvSyxm5ZIP/J0VDKFrs9wlJwuY4C8xyG2gSwbAKIQxV742CIXHvVfcGDYU29aiaGLOCHGu0izrJjfohtkBc7MtGi0WU/3FwrO/96VyjvYWEyRGAqY9htimM78uUtp2Pi5s8YDhVuUV5RJnoJofNfKRdSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+UXrY5oQiSk+qaDX7zmubfuUp0IPvE32VjJ8rd1SKE=;
 b=r1XzI0NGJVq70fZ0md6nnonKHTjLaE+zKRjuxOTjJ1sV13/dMlaLjzq1TkkT35cdQhzsoHLlSwHQoFB7yUpd9IjQRmm7Yq9inOvGUkzLVX759ByCPIMDoNBP+wChP1yH5X1/3Ei3irYxS9I8qnfIbpsH79Khzn179rTtw6eAloMIYkRLxS2cegGRrOj/L09ib3sy860a+BEUwFLTOknot9+s7qrSOmeFRlWh7OTWnGVjzRK+KMT7BGl0OizGkZJWq+htCT2eDPn6TmvlJRm3m9YZubaVnw8xzmSLrCt8WSfZD6Kzgz8WXvn5oAXPceuIvArExhDS83AcptXOGkhxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 19:50:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 19:50:26 +0000
Date: Tue, 29 Oct 2024 14:50:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>, <intel-xe@lists.freedesktop.org>,
 <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <john.c.harrison@intel.com>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH v3] drm/xe/xe_guc_ads: save/restore OA registers
Message-ID: <tf7jhcw75ijt4iyjmpvvblyqhmnor2c25jts24e5xcp4hqtvoq@eq6kpdgb4fga>
References: <20241023200716.82624-1-jonathan.cavitt@intel.com>
 <pug6v3ckrvxd7hkrfmppwxck7nxz3ta36sorzcekpzdwgk5ljt@4hxdgwvuctwj>
 <854j4uzv79.wl-ashutosh.dixit@intel.com>
 <brnhn6qx55xqnldy5sw6dahr4rkfwegew2wav5ao65kkah4kwv@kwkps2xwmsil>
 <20241029193313.GY4891@mdroper-desk1.amr.corp.intel.com>
 <85zfmmy9rx.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <85zfmmy9rx.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 199da199-a6ca-49a0-c2ac-08dcf852eed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wAN2CZZelfgoUatL3ENjN8M89vJoJO1ESg/yQpoifeU4OpsQu1tTdMCTte7p?=
 =?us-ascii?Q?Djgf9zBKfGHmmfeP7MDarNs0TgSEHuJnhvnEAJ24AlDolh8QbMotP2oxM2bT?=
 =?us-ascii?Q?PwLSuleEZ/MGVRonJ5j4vpeIu7uJcmnfmaXEWdFSNrg03PjLZyjArZm3nyvs?=
 =?us-ascii?Q?GYKxopHkk5F4CMZdL8h2q2ZQYxIb+w/ziIOc5MdFj+ZDZFwDaYkVQGVv8E8y?=
 =?us-ascii?Q?KHzNRpApG3JmwlHCzl0Dzqx3iEsoExwFedRoyWje0GDygpEo30FbMJ9Rjr0b?=
 =?us-ascii?Q?zIP+BCIU929O8sWq7s/LveSGgRXO1ecSd7Cc5mFsQHMP45rkLulQ/7rveYtS?=
 =?us-ascii?Q?HHTux5fG7wLGiLgqp2L5HQwU9SH1FKdLLckfqqZ9g5FtBNeX+HQPEEX8UZIw?=
 =?us-ascii?Q?evSV9QfYBLZourqbe+PP1jkX8n/Q4NOJATTwGayLGKIbqyXmh1hr8HmnMxvw?=
 =?us-ascii?Q?+BlQY7TFWcBUMo6V49h6wZgrKP0mxUtNwUDTJIeG2Dip6hqMb6YxGVwtPK3c?=
 =?us-ascii?Q?rLpsX33TrjKo5s7WfP8VOxMBSPAhPXQzNk7bXW/fIU1lPgC5Mt1/yS56JayX?=
 =?us-ascii?Q?XgQw/uV6/4vtekdM6LzUUYkR96HMfXjsHUeY4g/nxDANNGrDGe3v7rBv17y9?=
 =?us-ascii?Q?uDxfUpJsIhDCZ9cjWKC907x/DoV6RQ0FSCvXuvwUSNeo5zNHIWW1J7XPVYun?=
 =?us-ascii?Q?HYIm/2yhio+nMcCFYkXwVV0ZX2VYMxYP5hppt0VPQUhi+Q/jkFhCO1agQb3H?=
 =?us-ascii?Q?PNlXdsVM8v6ehdO5GULR84gLhdAPk89xbEr2dJom+7OSSyAMK0ejwwMiHEoT?=
 =?us-ascii?Q?LUSdgp0sJAlqDQ5Pn5nTDKRjs2oW5vI2RK1ak5+CkkYCmToNLnSOxBP5Pl+C?=
 =?us-ascii?Q?mv4aYQFaUeWLjN3yctUMJobJQOfc/beJwmOQKUrbkPb5G/OJ94eMpgxXA5nH?=
 =?us-ascii?Q?MZMMEGuMR2V9GAZ/o5Efv1WBLAA2AWQNdydygSJ4l3K71nDF/twRaUXl7Ak1?=
 =?us-ascii?Q?ZDCo5MpvDljgEd5YmKEIx7G/XAAHNSghjFMx2SgXHMOh9xpo8ouxehIb96Iz?=
 =?us-ascii?Q?fNpiIeNR7UxMQ+Inpy7WC6xLfhX/x2WkDnHq5s+c28tSKjNuGKR8h2AhnQ7D?=
 =?us-ascii?Q?g6bOXYvzrWqRkCtus1MAnfrz5z8Ug6qoeknEhPAeBdltdQ/M0blMCUS5tOlR?=
 =?us-ascii?Q?1irK34ql2Npfc/zZZxNBkT8G50qAnw8KiYfjq/9algeKlrNNgWK3BNsUlTEn?=
 =?us-ascii?Q?sJmlk0NrgVPnc4opaDpHjMc48qihxNQ9I9KBCqdMnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7mtt9kP81SMdSPicBW+mzUefCqftdWYmR0pUcQjPmjb6RBIqQGHoOe2BwwjK?=
 =?us-ascii?Q?CIxg4rKjCFzKr0gzaJZdwjGIWImz5ndYBwX5Rl7jnST+qhzpaO+abw59KDPh?=
 =?us-ascii?Q?kDhc7pwtqrNb3quUjUiJCtkIh8oDfPAyDBmp/ExKSaN4GCt/+N4MTi5RjDPj?=
 =?us-ascii?Q?r0jFY1O4YLr647ccno4tzJdMkmKzxAPdX1PgmzyPnEHEnWskZTtyCzey0Ib1?=
 =?us-ascii?Q?gWuc9Pk1n6JtO6kMv8//RYc3lR621bv2X0Hu8d+NYJpVNDV1rToLLYru0RlZ?=
 =?us-ascii?Q?0jfSNOtwiuygO9rlBnAE5cOq+7dLyWyEveTeQUWsplOM3cNBZkJTf0laraPD?=
 =?us-ascii?Q?zPIymDQSO80gD+gxusAe64xLo9GsZb3MUDuaV7YNl2d0/CuOfgDLcmqpooKh?=
 =?us-ascii?Q?TVedeUM3vRrD7V6BSp2eZjcxSDjWhfQW3cz/eTrI/gDDBI5kYvH15pURvQCZ?=
 =?us-ascii?Q?FhIS8Y7ZD/fvyVrqsaNVt3qAveOC7C3okt9QGD6PbemjwtjTMO72wfasnYTX?=
 =?us-ascii?Q?8f6fB/w1c/D/3B/l+EWLheehYW80yE8B1zTD572uQ8mw4V7kRszjQNLJuHb8?=
 =?us-ascii?Q?xxgTJWh1CXdSKcOsuuY9eWFg8z4ZdxJAan9ECkeCTYE+drwVyo8faz8VxQLn?=
 =?us-ascii?Q?CBUxg2TkEsFkB9FvQNZiB3oufNf2FxapuqYzs4xpm6OFJ0l7Ww5i7L4v1Uva?=
 =?us-ascii?Q?xbUg9rcB4rCMi0R231e4GF/e6ae+EODsHwECUokFDvaFkKOSe8voUC4DRTng?=
 =?us-ascii?Q?eiHMAXkCTKy6zPZx1Z0G9cR/HPvshMi6TGQzuIdylTXYdFgr9RUJf6HlGvgE?=
 =?us-ascii?Q?ccvqLouDbx7gNeJEAbnexiTSScKnohrM98ibgjgPllgK1qw5AhFlIfd5aLrn?=
 =?us-ascii?Q?DPByTM88L/DnFOGWo4U3Tr57Pu7hoYZP46lO2COMWnQKruQG5VWKXh0bUudA?=
 =?us-ascii?Q?vArdM+Q6yPOy/hOpsQ2b9FZCrHRmi2tFVqmc0qxi4WIpyCWEd74YxBOBmXl3?=
 =?us-ascii?Q?UxQTjubrugZ3lNoWnhJugq4+TDQh8mDZEXa95SJSeeYzksBu+wk0/OCH1nt2?=
 =?us-ascii?Q?kHuALnTCesRwiytsaqCaCaW4e5cADXGgKD0GaIEwFx6AEeHL9tPgP+ZoAx7w?=
 =?us-ascii?Q?F+mO+FT90m7KUor9sxk5Du7vYk3XuNfgduCNtTU8SWdizzOBfWutp7NNlqiz?=
 =?us-ascii?Q?ZcSRlkoR5SRr3Ngn0p4OSsrQTLT4mm0e5lDkAl9S+DU5SK4qaGPldcM9mmV7?=
 =?us-ascii?Q?rfpKzxirs7NInU14ifk3zw4Qb0egyRVWHZVds+fDC7FRkcwS55zSjJYh6gHS?=
 =?us-ascii?Q?OElaPD9m+yAEVtqh3DdxBs/8usfUNTslEqqf6TFHTCHNjPKDeCt0/daiqzzw?=
 =?us-ascii?Q?cBNVvpWqCoAl5KamLWIcHHbriXHgvQif5Skg5qFe4tpLtiV5P7mh/fJRCUX9?=
 =?us-ascii?Q?lOJLKNpz0+HjxESdnrlSF8lun27G33M0KtT9JqF41p9bLc5BO26C8a+YxvoZ?=
 =?us-ascii?Q?7VUC6rHf/9sihCpaew/Jule38mqDocCCovgZcK5GIRTVTOat8KYvYxeZC+vm?=
 =?us-ascii?Q?b/1uQUblyAOEqV/dMXMyVQAK2iVf9aJ8sa1/XJ+q6lFQKu0deMJ6vgPJosI2?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 199da199-a6ca-49a0-c2ac-08dcf852eed5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 19:50:25.9788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /07Kmezsrqf4tja3JweNv2ys5Ft5+kbvV1hpHEttArnuQBph4LUPy1eR61qBTxGKgGxQXQqwiLTeMcBc9DUx054FHhAg80wCQlBKoHglxxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
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

On Tue, Oct 29, 2024 at 12:44:02PM -0700, Ashutosh Dixit wrote:
>On Tue, 29 Oct 2024 12:33:13 -0700, Matt Roper wrote:
>>
>> On Tue, Oct 29, 2024 at 12:32:54PM -0500, Lucas De Marchi wrote:
>> > On Tue, Oct 29, 2024 at 10:15:54AM -0700, Ashutosh Dixit wrote:
>> > > On Tue, 29 Oct 2024 09:23:49 -0700, Lucas De Marchi wrote:
>> > > >
>> > > > On Wed, Oct 23, 2024 at 08:07:15PM +0000, Jonathan Cavitt wrote:
>> > > > > Several OA registers and allowlist registers were missing from the
>> > > > > save/restore list for GuC and could be lost during an engine reset.  Add
>> > > > > them to the list.
>> > > > >
>> > > > > v2:
>> > > > > - Fix commit message (Umesh)
>> > > > > - Add missing closes (Ashutosh)
>> > > > >
>> > > > > v3:
>> > > > > - Add missing fixes (Ashutosh)
>> > > > >
>> > > > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2249
>> > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>> > > > > Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > > Suggested-by: John Harrison <john.c.harrison@intel.com>
>> > > > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> > > > > CC: stable@vger.kernel.org # v6.11+
>> > > > > Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > > > > Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > > ---
>> > > > > drivers/gpu/drm/xe/xe_guc_ads.c | 14 ++++++++++++++
>> > > > > 1 file changed, 14 insertions(+)
>> > > > >
>> > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > > > > index 4e746ae98888..a196c4fb90fc 100644
>> > > > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> > > > > @@ -15,6 +15,7 @@
>> > > > > #include "regs/xe_engine_regs.h"
>> > > > > #include "regs/xe_gt_regs.h"
>> > > > > #include "regs/xe_guc_regs.h"
>> > > > > +#include "regs/xe_oa_regs.h"
>> > > > > #include "xe_bo.h"
>> > > > > #include "xe_gt.h"
>> > > > > #include "xe_gt_ccs_mode.h"
>> > > > > @@ -740,6 +741,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>> > > > >		guc_mmio_regset_write_one(ads, regset_map, e->reg, count++);
>> > > > >	}
>> > > > >
>> > > > > +	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
>> > > > > +		guc_mmio_regset_write_one(ads, regset_map,
>> > > > > +					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
>> > > > > +					  count++);
>> > > >
>> > > > this is not the proper place. See drivers/gpu/drm/xe/xe_reg_whitelist.c.
>> > >
>> > > Yikes, this got merged yesterday.
>> > >
>> > > >
>> > > > The loop just before these added lines should be sufficient to go over
>> > > > all engine save/restore register and give them to guc.
>> > >
>> > > You probably mean this one?
>> > >
>> > >	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>> > >		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>> > >
>> > > But then how come this patch fixed GL #2249?
>> >
>> > it fixes, it just doesn't put it in the right place according to the
>> > driver arch. Whitelists should be in that other file so it shows up in
>> > debugfs, (/sys/kernel/debug/dri/*/*/register-save-restore), detect
>> > clashes when we try to add the same register, etc.
>>
>> Also, this patch failed pre-merge BAT since it added new regset entries
>> that we never actually allocated storage space for.  Now that it's been
>> applied, we're seeing CI failures on lots of tests from this:
>>
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3295
>
>Wow, truly sorry, completely missed that BAT failures were due to this
>patch. How about we just revert this patch for now and redo it later?
>Unless you or Lucas know how to fix this immediately (I don't).

the fix is easy: update calculate_regset_size(). But I don't like
polluting xe_guc_ads.c. If the register was part of reg_sr.xa you
wouldn't need that since the loop already counts the registers.

I'm ok with reverting it.


Lucas De Marchi

>
>Thanks.
>--
>Ashutosh
