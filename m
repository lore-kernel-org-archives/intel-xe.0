Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB0ECCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 19:06:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8520C10E459;
	Mon,  3 Nov 2025 19:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jvnuykil";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B8710E21E
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 19:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762196763; x=1793732763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lUUkvzR3R3vJ09qxdV1E6hi/xg2WwpWSPX/8J8wU1l8=;
 b=JvnuykilCg5eP7BhuOrRUaZTAwQ3CTrtPgnmcA2Q0B1DhL4r2D0NgB6R
 5LGFfqTbeHNwf2zHO0O/eVsfN/bZpIwFiI0XQxONB0ndUU84BzaX3jS0k
 YNuXmpfYdxjicsr0RKABD4VKXUBlqYCACHpQaqxQ/9Pj4pWPNbil84LU3
 QD5dwFyoKFu9iU1pQ+ewx/FshahvI74pne24+bYxYDo8GwWOKkqZphPPk
 cG0S0CzglOc4AdyA1wX6oMmS0c6fgc+4735jRtloOyP4G+Eq0am1f8ze0
 zBfNL+hF2TsLxcZOV+kyayg/OhZppiU3zzLUHKOohBhMSk33WyBdGp4Ds g==;
X-CSE-ConnectionGUID: /G1B3b8ASvCHhZsGKJYv2g==
X-CSE-MsgGUID: fsozSbmXRpeuSmtW/VJVfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81910674"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="81910674"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:06:03 -0800
X-CSE-ConnectionGUID: gHjCmg9XR+Wg4a7WqtaJ1Q==
X-CSE-MsgGUID: mSDAmvBUSAGozPNUZyAj2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="192041182"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 11:06:02 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:06:02 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 11:06:02 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 11:06:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q80Iz5tgt1/fmYDGKn+9rL3RgcxVuFRVNbokZ4JiL2YGL9/RRKg1ZthvUK0p1syuXc7UKkYLsS8xgaNDu1NePQPPGYVfpWIK991dOfYB1Mf9w89wQDhGOZ5Xxihn9dWAEqPLcFIA+r2YU/JF6gkQCZvPC4QF6jlhrCUvx77uAEoSM/rV+hS/gs59UVe890oCd86PSBpCdRmMowxND3FNoEe+CxuQOS1MTS+k9/v0OYLxOHQwwJ8UAVXS454GZ8CgeuI/h69xK4LKfwMK5o8+4Ql5fJ78bvcIVTSkzCjbqjD4YmGdLzgm7UYzJRa7Hp623zkUEW921RlvQen9jRtuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxCB2sAXCJFvBH2VDG0wImT0taB89y5cY6idWpfgn6U=;
 b=GwrSHQ4FH5LHgmvzx2KzCThN02+8LMY3EX6+ZexYXtVbfN1WiAai+dqrdR2AFo3crHfp89UfA1UqOqm+QQ+5AM0mEnIOXtYe1XSILOC6VOJA2UKRySKr21WUKJc2TNVrMOD1r2PGJ5zu9/SgGcwDO5ox9gpFZ8zX1reT59vNJX7nvcxeBYsjDf2XD8pYGm15Uv34avdp1a8T6SLUYz1ftFgfBZR2+g1qIrGKSUK4gQ9QgHc20Yz7BaoKYWEGRgN6SFzHkyrcwpDr2kLW9xQYS5WLOEA/OYI3f+Lazf2FBvi+uPRA/FrL3D5WJgkWpU6+zsfCHfKGEQQveVy/l+X3ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6286.namprd11.prod.outlook.com (2603:10b6:8:a7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.16; Mon, 3 Nov 2025 19:05:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 19:05:59 +0000
Date: Mon, 3 Nov 2025 11:05:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 07/16] drm/xe/multi_queue: Add support for multi queue
 dynamic priority change
Message-ID: <aQj9FIEQ+WgC/oRT@lstrano-desk.jf.intel.com>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-8-niranjana.vishwanathapura@intel.com>
 <aQaaxtYCevkVoq4u@lstrano-desk.jf.intel.com>
 <aQjxBMcncOOX9k9j@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aQjxBMcncOOX9k9j@nvishwa1-desk>
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 9858c8e6-1af1-422e-a63f-08de1b0c0617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FO8PWBJ/pf1LisoLc4BihRzfTj7sPvShGxXb4OfpbgPGZ+6XhTPgmy+Cfboc?=
 =?us-ascii?Q?5L/CrRqQbpsLhbj9ERlFV9Kvn6gLZiKZKwKZ49Se+tesnH8i6CHD+z7+Hgmu?=
 =?us-ascii?Q?PYH3vMQGB9+boME3Wr1N3zf2DzlKB1E0rvW1pYHTTkeeu3o9dSFt3N7ewgH3?=
 =?us-ascii?Q?BL5X3UOJ/YmSJ8ew3/oW4tNkIqRqcm1SbO2Bm9Ntx9TiKgAO0s1AO+OarJ/z?=
 =?us-ascii?Q?pu8NbJLx69+16htWgFBH16LDhUh6a3pISDueQoTtCZs0mwNdjk9P97j82991?=
 =?us-ascii?Q?NXjja9hwi6//A+21vb4NDNKn6qALzlzsmfDXgvzIgMlgJU++Yhra7faZKBPc?=
 =?us-ascii?Q?lcHMxc84hJKEAuy0h5xorfGQ0JfGyczumvRWMXO1+8rMzPDN4qPySZk7t3tZ?=
 =?us-ascii?Q?R3ZM73NEq7YZH6Gmu1BDiKr0uPZGuLyrXNwIc8chD980APaIBjqJWNvlhBFL?=
 =?us-ascii?Q?v30rpQ3FXTV3O9KOmnFCqdJ7BUhhE1NNmG6EWVX621sPJ7GZFgbOqp6rXyD4?=
 =?us-ascii?Q?AAsagtVHm2om7SliHGR/GN0FQeELng1mjWmcuBa3oSspJaGtaGilQNwRMv3p?=
 =?us-ascii?Q?/eV0/EE4f+WPiOm3ZMi9hlI0UjpgtcmCoRuAynw1UMUecsn4j45b1kY2sD0a?=
 =?us-ascii?Q?FlWstnUeUW75gNRlY9LRczy3UJ0Ub/OBHoHgvHOY2Pf2B1gaX8hktZ+UfC34?=
 =?us-ascii?Q?tXD9bELnLk2S9rJhT8HpnLlwvpL1biXAXcG+gAfyk7WeLA4WNUi5NgRX/MZ3?=
 =?us-ascii?Q?rgpoQ0eHFGXiB14Sqi8xEko4tPAjmxu4WKFtmUFAm4P5yROCdwa5UEUP47nR?=
 =?us-ascii?Q?UPasTA1S/nuwGWbWhQqkulWPBBOTsYlvol1Uq1uHKF8Aj4EtNqx4S1fFVQe5?=
 =?us-ascii?Q?1QeJGCeIw6+m4AlNGXsym1MzVaYNF/jjZgjX4LKrYsdmRIinerm/dV4RW3Gi?=
 =?us-ascii?Q?dN5jPKv0iSB4oKUhmIw8hLgI7QiQmjBnN1j9Wr3M7Bikojv29NLGRONaqGZ1?=
 =?us-ascii?Q?cKBbbMUXnWIjBY4oGWLlxEhnP1vDmMIV7snWjAnMO/l6aFngq0EfwrzIpBnI?=
 =?us-ascii?Q?WJQ/n3Ysg1rXLXPKPnjnC2eAsP81GlwQmvEZHvIdUXpQHY7XccpUDmCBN93V?=
 =?us-ascii?Q?XSsLnBD2AL/7KjuaQfeeTly2aFMb2TEIfxN5gDv5+xdZz5tJVc8djom+Oej/?=
 =?us-ascii?Q?aVVEzRSCZzze+X7UbA1LbPZN/Lbm5J1DjCIzyZ3ZARc+DevpC1H/S1ys3SE0?=
 =?us-ascii?Q?K/Err1JFpS2egd7IQcHhmSUlgD0imaMY6GaqHraZIcufK+kRjlPUHKjTZh0S?=
 =?us-ascii?Q?3Y4jqd9bgrQu9MG6EOH8N1t950/rds+sbUfikziH28BLUwMrEMRlUPcTMDAU?=
 =?us-ascii?Q?63HTrmKVW/4qbdG2VHKDb0pMZ7/lye+j5Yjj+iltIcuznzm/uVA7wCK7dpMq?=
 =?us-ascii?Q?dZd6DbfH3BVO52dXXuMqdQoo2cDfZyol?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pJNFNHmQVEyuW854nCvoVarx7gntzJxbo/tcUZGSzD6IYN5SSCtafIqV6aEp?=
 =?us-ascii?Q?smA3hVx/eRzEi93IsWy6K0/mfcYbygq5ZnVckxQ2zGfIHbRyjJxz8b9GAg6w?=
 =?us-ascii?Q?OPqg1xmk4FthqkCWKZE2s/q2lowmHUxFw8m8VvyYGWbv87LpS+nBMSWas5fo?=
 =?us-ascii?Q?ByzQo3FQVNEtxKINYTnJuLByoGj1Z+DvaVo7PiongsKxfFp9JHQFhifjqGdk?=
 =?us-ascii?Q?tZm1YR8acDRXStyhdESIeywUNppHWPQliDFsJYk59BQJ6VJTsLMSW4hekTEB?=
 =?us-ascii?Q?QYmwKizrR6OnobLqzA6j+DoxUr7MYH3El1ChI2iPJ8Y8M0gkjzB1xj6Hk6E/?=
 =?us-ascii?Q?KKrq7fA6PsIIN9kaO3QJQc56dxDmqrznWfn9PeeXJ5/4BV8uMIJwvnGBaBrh?=
 =?us-ascii?Q?b3K6JUiji1AVpzddmtCVIrZJv3KNFshi6mI5kPBWOQsfxMPoxs4MFlRnFpIg?=
 =?us-ascii?Q?08iYoRzKAP8n0w/R/Y4IMBiJKhiP3HMJxABzjqEDeP17AKzCpufGkKdubnMX?=
 =?us-ascii?Q?jxEl0jyvwLbvpyXU8vNYmlgBRfmU6jbupQSrZeueYS9GTunS5XM+M4vLo/E+?=
 =?us-ascii?Q?2HfaW3XohoGpiX/oLOntFDrh1YuTF7rtvBNxFjg8KWlagIU71DwkLA6UQRV7?=
 =?us-ascii?Q?4FwXQei4HvbIkcimBliPPCuupbCCMvoDqgYmhvYB2Nl0sxWF5ii7MLLnSosH?=
 =?us-ascii?Q?opo/OBlwmtEz9ABlrkI7/1zKOH64NCN6aOKOMVVFb7YbPpCmnrSqfP47A/Fa?=
 =?us-ascii?Q?H9kzquEKWgTEQkhWqPcS5Lh4hlMA0RFtrp0EnQVDDhI5qYWNnbVV//+c/WDo?=
 =?us-ascii?Q?1/UHz0cZ2DBra7xfzvNMdqEHE9JbVEbUwnKQXPPN2QDF0TnCQEKhstD9Kh2F?=
 =?us-ascii?Q?ayrJaTYsXLtVnuzR8Ox/9NoKixOrdd8bn2x8LhCZav/NUTWoqTU2ZUPXWNDR?=
 =?us-ascii?Q?keyrIRewrRcNyVzTTfEjISdPYq2sZPli1+lRB9M8F9VpVSMsw/mI6w/Gxu9I?=
 =?us-ascii?Q?+bHyy3/W8MUVnI7yP+3SagcEorS/NxIZTHjwyAHmmrCgRPexDXXGOAzuD3Kv?=
 =?us-ascii?Q?xMOFEoGePtQhUY5Xvccv7Eti3eS084Zsvy/ejeqRmlK5GUBS4nNW7yVjylm4?=
 =?us-ascii?Q?q+6eAgt8bkUqW7hiICu9nbl89WS8jSbWN7m5PzeEWJ/9wYB/n9CTGH1mMyIz?=
 =?us-ascii?Q?1KzVds7qcf2EKHFY0bg39N67ORIrZqCE+lxQQpFw0YHjaUOcJaL42jSWSpGE?=
 =?us-ascii?Q?nTWefzqy9c2y4h7ZN3+UVwRdwmhMMuH4Z1UXJcCFqtPV3LobBHg67Vg+fGit?=
 =?us-ascii?Q?DdIpSO4TgjBJlIDYFaSM2EV0LEDu8oYQ8FWSPfuCVaHLHK7FSN9fc9YZGbRk?=
 =?us-ascii?Q?+zF3kWwXAYRtaWvqP+vmfvuZR4ad5YvcmO92EO7xMpVj22heXH/oiaDo53jq?=
 =?us-ascii?Q?MGEWwrkrAymteCdtymWM09kMtq7gALUfOadanK1dyr3n+EjG6oltgeAdr525?=
 =?us-ascii?Q?NHCxRg8krY/7MpLnPtdVV8JM2YIgzYOHCfrdxJPg5gm3KnmOv/ohi5vrlvAC?=
 =?us-ascii?Q?6PPdm0Zo/L+Vm1zZrsH0yeoFGFNBcR2a63dqapdtakHxUpURZOw7aluYFLTU?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9858c8e6-1af1-422e-a63f-08de1b0c0617
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:05:59.0538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0smp7VXMGdl7sfsMFvCQZAhfmczY+wLDgd2ZfOWfSmQiyJWj24LXhhkd4zwL4IE8jxImcv2RDVKW1zbCPEIdjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6286
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

On Mon, Nov 03, 2025 at 10:14:28AM -0800, Niranjana Vishwanathapura wrote:
> On Sat, Nov 01, 2025 at 04:41:58PM -0700, Matthew Brost wrote:
> > On Fri, Oct 31, 2025 at 11:29:27AM -0700, Niranjana Vishwanathapura wrote:
> > > Support dynamic priority change for multi queue group queues via
> > > exec queue set_property ioctl. Issue CGP_SYNC command to GuC through
> > > the drm scheduler message interface for priority to take effect.
> > > 
> > > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 12 ++++-
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 ++
> > >  drivers/gpu/drm/xe/xe_guc_submit.c       | 56 ++++++++++++++++++++++--
> > >  3 files changed, 65 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 0264cab00fd4..98f8f1c7f13b 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -729,9 +729,13 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
> > >  	if (XE_IOCTL_DBG(xe, value > XE_MULTI_QUEUE_PRIORITY_HIGH))
> > >  		return -EINVAL;
> > > 
> > > -	q->multi_queue.priority = value;
> > > +	/* For queue creation time (!q->xef) setting, just store the priority value */
> > > +	if (!q->xef) {
> > > +		q->multi_queue.priority = value;
> > > +		return 0;
> > > +	}
> > 
> > I also don't love this check here as if exec queue creation order
> > changes, this code breaks. I'm pretty sure you can just delete this and
> > send on the message to the backend given
> > guc_exec_queue_allowed_to_change_state check will change the backend op to
> > a NOP.
> > 
> 
> The multi_queue_priority propertly can be set either during queue
> creation time (via multi_queue_priority extension) or later during
> set_property ioctl. This function gets called in both cases.
> 
> When this function gets called during the queue creation time (during user
> extension parsing), the guc initializaiton of the queue is not yet done
> (ie., q->ops->init() is not called yet). So, we shouldn't call the
> below q->ops->set_multi_queue_priority() function. That is what the
> above code is handling.
> 

I thinking thevfunc '->init' would have been called by the time the
extension was parsed, but I guess it isn't. I still don't love tying
this to q->xref was would be set that eariler but I guess this ok for
now.

Matt

> Niranjana
> 
> > Matt
> > 
> > > 
> > > -	return 0;
> > > +	return q->ops->set_multi_queue_priority(q, value);
> > >  }
> > > 
> > >  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
> > > @@ -760,6 +764,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> > >  	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > >  		return -EINVAL;
> > > 
> > > +	if (XE_IOCTL_DBG(xe, args->property !=
> > > +			 DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> > > +		return -EINVAL;
> > > +
> > >  	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> > >  	if (XE_IOCTL_DBG(xe, !q))
> > >  		return -ENOENT;
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 964a0e6654c7..dcb55b069ed8 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -241,6 +241,9 @@ struct xe_exec_queue_ops {
> > >  	int (*set_timeslice)(struct xe_exec_queue *q, u32 timeslice_us);
> > >  	/** @set_preempt_timeout: Set preemption timeout for exec queue */
> > >  	int (*set_preempt_timeout)(struct xe_exec_queue *q, u32 preempt_timeout_us);
> > > +	/** @set_multi_queue_priority: Set multi queue priority */
> > > +	int (*set_multi_queue_priority)(struct xe_exec_queue *q,
> > > +					enum xe_multi_queue_priority priority);
> > >  	/**
> > >  	 * @suspend: Suspend exec queue from executing, allowed to be called
> > >  	 * multiple times in a row before resume with the caveat that
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 5ec144c1c2dc..426b64ef8d99 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1761,10 +1761,32 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
> > >  	}
> > >  }
> > > 
> > > -#define CLEANUP		1	/* Non-zero values to catch uninitialized msg */
> > > -#define SET_SCHED_PROPS	2
> > > -#define SUSPEND		3
> > > -#define RESUME		4
> > > +static void __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sched_msg *msg)
> > > +{
> > > +	struct xe_exec_queue *q = msg->private_data;
> > > +
> > > +	if (guc_exec_queue_allowed_to_change_state(q)) {
> > > +#define MAX_MULTI_QUEUE_REG_SIZE        (2)
> > > +		struct xe_guc *guc = exec_queue_to_guc(q);
> > > +		struct xe_exec_queue_group *group = q->multi_queue.group;
> > > +		u32 action[MAX_MULTI_QUEUE_REG_SIZE];
> > > +		int len = 0;
> > > +
> > > +		action[len++] = XE_GUC_ACTION_MULTI_QUEUE_CONTEXT_CGP_SYNC;
> > > +		action[len++] = group->primary->guc->id;
> > > +#undef MAX_MULTI_QUEUE_REG_SIZE
> > > +
> > > +		xe_guc_exec_queue_group_cgp_sync(guc, q, action, len);
> > > +	}
> > > +
> > > +	kfree(msg);
> > > +}
> > > +
> > > +#define CLEANUP				1	/* Non-zero values to catch uninitialized msg */
> > > +#define SET_SCHED_PROPS			2
> > > +#define SUSPEND				3
> > > +#define RESUME				4
> > > +#define SET_MULTI_QUEUE_PRIORITY	5
> > >  #define OPCODE_MASK	0xf
> > >  #define MSG_LOCKED	BIT(8)
> > >  #define MSG_HEAD	BIT(9)
> > > @@ -1788,6 +1810,9 @@ static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
> > >  	case RESUME:
> > >  		__guc_exec_queue_process_msg_resume(msg);
> > >  		break;
> > > +	case SET_MULTI_QUEUE_PRIORITY:
> > > +		__guc_exec_queue_process_msg_set_multi_queue_priority(msg);
> > > +		break;
> > >  	default:
> > >  		XE_WARN_ON("Unknown message type");
> > >  	}
> > > @@ -2004,6 +2029,28 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
> > >  	return 0;
> > >  }
> > > 
> > > +static int guc_exec_queue_set_multi_queue_priority(struct xe_exec_queue *q,
> > > +						   enum xe_multi_queue_priority priority)
> > > +{
> > > +	struct xe_sched_msg *msg;
> > > +
> > > +	if (!xe_exec_queue_is_multi_queue(q))
> > > +		return -EINVAL;
> > > +
> > > +	if (q->multi_queue.priority == priority ||
> > > +	    exec_queue_killed_or_banned_or_wedged(q))
> > > +		return 0;
> > > +
> > > +	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
> > > +	if (!msg)
> > > +		return -ENOMEM;
> > > +
> > > +	q->multi_queue.priority = priority;
> > > +	guc_exec_queue_add_msg(q, msg, SET_MULTI_QUEUE_PRIORITY);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  static int guc_exec_queue_suspend(struct xe_exec_queue *q)
> > >  {
> > >  	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > > @@ -2095,6 +2142,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
> > >  	.set_priority = guc_exec_queue_set_priority,
> > >  	.set_timeslice = guc_exec_queue_set_timeslice,
> > >  	.set_preempt_timeout = guc_exec_queue_set_preempt_timeout,
> > > +	.set_multi_queue_priority = guc_exec_queue_set_multi_queue_priority,
> > >  	.suspend = guc_exec_queue_suspend,
> > >  	.suspend_wait = guc_exec_queue_suspend_wait,
> > >  	.resume = guc_exec_queue_resume,
> > > --
> > > 2.43.0
> > > 
