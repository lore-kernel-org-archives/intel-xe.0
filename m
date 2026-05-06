Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3361ECD3427
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 03:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C4D10E4D2;
	Wed,  6 May 2026 03:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iHbjO+qM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7DC10E4D2
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 03:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778039284; x=1809575284;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M0wgTk5HhIn2S/bnomPguBH1WCuJn/k5HP7C7LcNtdo=;
 b=iHbjO+qMpt5PrKb8EDHCftNXOt/qHe0O7yERps3lq/ZiCEEXoLIiqFyy
 KMlt5u4ULGdbI1SdFI0Y4fb8dn3to2Z+aW5/9R5JWkT+VNiFUT6IMqflW
 p+Ghpp0bNp6zseHC97MYaZl9rU+xG2LXEI42ASokgb4yMR85dnraOv0l9
 9QSVzxQC3UrvKB46RNcqS+K1m26L5VpkLMz9M+Rd+0fctaPHyQ10Q+EM6
 uXrROx6F/HqDDpHwtsmx63ranqRPLorm2ZFbBzoeOHRW3WlyjF/bd3FTn
 Rz9PuaUXq7vm8Uf6Ddmy+24JuOGMxzVyVFo8UStrdN7MAkIfT0/Zl55Kg g==;
X-CSE-ConnectionGUID: qI3VZMIbQpynHDANfGXH2A==
X-CSE-MsgGUID: 9XoEJ2epRFKZxoxtqAICgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78972999"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="78972999"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:48:03 -0700
X-CSE-ConnectionGUID: LQCOUH2+QO+pYC536dTQdw==
X-CSE-MsgGUID: ByP79EiySyqpzGhu4NulpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="231613829"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 20:48:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:48:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 20:48:02 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 20:48:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JK4w3YVhlQZJG2tCE/Fd3TCf7u7amtB8h0k/RaQeXcRUIJkHUb7zro7zRNV4DmBVpibIUSlHYxx2nRSfRb8J0cdZvJjCZRJXDxS+TBfvt6iZw0vfb4gRCT3DlP43EPPeHR3X5d6JQrjPbB/qQ+R7xdWcrhxb7KGHYgGF+gNe7HEeyzuiu2akM/zH8jKNnG3tEMtZP/MY1a3h2/yI6DvIZ9nzm5ZBEDA4MtSy4wm9p0Sxxf7FHPw77BTYV8rVF0mFp8pnxFOZaGEAzpkr+4FvLQ9Lb2CGX60QG0rlihsutDV0i1DarfC9VD8+gHS4OBjwnbh2zJTSKUjrVLgBPD9mew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCUq2RcUCl6NeHr7n2j9qozJXvVVdt5IsRiiE1OG5F4=;
 b=fCmiKNL1Te7zU06k5gE9gg7YH5g88rpdJcFRoe7iFYHGQ5O5cycnyDWNZgHvGshtvZf6OKHY5lHNqnw217vuM6i28+cVDaYT6vJRKUWxsNM09Dd9fVOoWgLrTZT9pkd+fDE8/Ehg96m2oSrQ9U1XuLcDvtczEMqUHREq9/oEYd2BQNyO0lh4+FzZdpEKyHo/BaC7ISz4AlBxDoNFq8MVfDJ8K4hXUk3gsDOIk/XynjCa/f3MFLR/niRCxvGFgIFyVm2CuSUeghhZqGlDStPyaetlW7wyC5mSU+iuRoLv4pb5ok5CO+9nPxDAuFxhpqNeUMJiszcJVk6P7OU/CcNgQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 03:47:52 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 03:47:52 +0000
Date: Tue, 5 May 2026 20:47:49 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v3 05/11] drm/xe/multi_queue: Store primary LRC and
 position info in LRC
Message-ID: <afq55fDpLg276JcL@nvishwa1-desk>
References: <20260505234408.3552147-13-umesh.nerlige.ramappa@intel.com>
 <20260505234408.3552147-18-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260505234408.3552147-18-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: BYAPR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::22) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA3PR11MB9037:EE_
X-MS-Office365-Filtering-Correlation-Id: 831e5fb8-1cb4-425f-01cd-08deab223f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: cVyj89H5TDppSopNWNpNpNQTzpAUUXaN6LGDA8BG5ySFuNU8oYw13EbtPsVuKTcmgJkpRKTItrALcLtzBctel010cdkB51psVnwNpCj6UYapFdIMzNB23EjABjsiaTxFtuzyUyyKdpZF2lIIOn2IuomUEWrxgIGelZjgRjUauBsGHTJmcPRKLqS5+zP0NDbPHt7DFBLirqaTTsca+lhR5eoVo7+HgOtQY44szxRLHALIeP6PT5OI1JkjzDsimHdE860j3UYWCzi/l8cTDPVsptHbGnmef6Z5zFfCmHCsvqkFcbgiZstyxP6xR26p6GAx7Isu/GI2HO2whA7SwTtEdadjQEPGExAPpIeDe0ikuibvmIGgmbGH1cgLcTRRWpEeuYmI8uteXUg4PJvxbGzPFGAFAIPl3BhuaXmGfX4O2b6HJi7iIIwAk+Z3cTVDtQFcobKN/esYcsTCAGJ+INejXM+QkE3ydC3pM5BniTMatObcEGJN7tPEw7wz3Q3zvakW3M+BrbLtBkOEZnDLjtD+HGoLhp8pULpVeWIPX/TZy4sdMOb8TmTOeGJgwi/JEi/QHd/6rxpb2s04XSR9m0drTY93g6RKDbna8howovShfjR2Lis4zhXRrSSdowznXsF89dr7Bvj3Znzf/eEWCPmdr3GwHzYj01hvM9L7yRZPgHQ4orqWinf/ZJzYZG3qlDmS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GzoOpVCYdJbOCFGYHXDlqNKYWD2RjkLaetPTrWyCm8KVpkY5P5ePyJqIofDP?=
 =?us-ascii?Q?bzM2H2tl6W6AV8H2560M8zkw3/p9FmlKDYCGyJU3/TUKDlXMjatB14T8/NRy?=
 =?us-ascii?Q?cJ6oiZVQc1kbh8IQBiqY+O8QHzzPm1esCD+p9j6p42oTSP4ok4CWOH7M84o6?=
 =?us-ascii?Q?Fk7ZcyvrmRjH6noYKDVJ5X1zde9Q6YOBMYPpL/IMIBJcupSu1VZTc1ZYbthH?=
 =?us-ascii?Q?1aqbVIab7J/NC6xM5jGanCjpVYPOkiAaqhrudbFrmXqU9K/435xERCiGcJG2?=
 =?us-ascii?Q?r0kX9rDhUMfvhKicrqFm4Qq5X1SIsjKkJMwAox9/t9Ts4Ake4HMdAy5Tyr9a?=
 =?us-ascii?Q?30RzXbfjneSCkcJr/5GdWHS4ErSIroYpBQKNTKJww/TPomPNFBjlm0Q/UdUN?=
 =?us-ascii?Q?dBB8UO5FGPkKAEZGvcTqA23pWHV9CDDA9ZkIiY6+lmNmZvJMi74dsNbNIh4G?=
 =?us-ascii?Q?XPI232LhMscfiTaLu0Qv/TyBpCZK6RmlnaLvuYplvtIL7GeuIImHvyLL3hv9?=
 =?us-ascii?Q?ZJmyz6ET8GEXhT6SsU6lmcJ7CeuckAtc3opmLA7kL6m8hseL/GlXoq/y9zxP?=
 =?us-ascii?Q?eOQM4ntCNEWIOlygN+IJ4a6tdagObt7U642es8VHbxih1rJOK9XnOtohugzt?=
 =?us-ascii?Q?IvWXijRvo5dYCsP3vcWAE1yDo5vlkxSHfgbP6g5Tyuf4uGhf8TOyrREeVv6h?=
 =?us-ascii?Q?5c8jypWrQMmzg9vS1SrJPgbKzWxOgkkemPOG+Kfb4yhOBpZPfqHLnZfCvpMx?=
 =?us-ascii?Q?9lYMhcEi0a4RohFAlz/JDVVsMJv3U4ipqWmIvtfQbWaxokrJKXdj4LZmroaW?=
 =?us-ascii?Q?IC0tukw+aZtQ9gJ7Vx5FCH0vHLdtrKZxgsPiC0ZBH85DzLnWtKVdsxMyTrAZ?=
 =?us-ascii?Q?+A0KGSFIPVK74cPe+/2jqplI49VN+6ILCRGhO3V82YWTL+DbgGMwpu1y78Uk?=
 =?us-ascii?Q?dwMlymEX9ZwzXHbaPpZMmTZYL9FPn0mk2SLAi32Qg+LDRJzBbbWJJQK6SR8h?=
 =?us-ascii?Q?UxDPRWuJ2IZ8JayfaDSBL8kltQHnt7Vj0ocsPOysbWQSN3FMAEVK4MFvc/jn?=
 =?us-ascii?Q?nrt98e5etePvcYo1yy6wY9d6FAYIlrJtC0yOqLXyrllShHDX5L7TXMJO5j7Y?=
 =?us-ascii?Q?8bSJ3nK4kTlrEu2u1M3r/3/pGCVKzDyGxCfTD4Gdw0H8NolYxcbW3b8vhs9Z?=
 =?us-ascii?Q?B9fBekOy5daa2m9gxn9wweNJWepJmc0ME7RzJaxX6y40OGqt5ohprrbA69Wd?=
 =?us-ascii?Q?BsYNxIChPIUrp81Ti83rVfajNSTukAIHBNk7EmhmsjUCpMmbhK+wkmw1R2VJ?=
 =?us-ascii?Q?vvAYsJl+0PPt+qu7zMB3I//ImWy0fGcjuLBQsQR8BOlEMJUtqmhoLcjNAJiG?=
 =?us-ascii?Q?x3IUg3KLO0Q1P2uVNuYdpn+M/x1bnsqD3g4mZezQNsHcm1sdJ1d1YVLtKW8e?=
 =?us-ascii?Q?4hDvYbj0+/o91P3bKEVELkcAXttx56lkz+mhUf4GVMfboi19j/0bZF5RikTN?=
 =?us-ascii?Q?Ju9dqtp8v6AehKs5VwazqTvWDLiw6sI89NSlAwk5YOMBmIdLa2/Z+WUqKljH?=
 =?us-ascii?Q?4ONjrK4JtpB9noOPkPQLSJrmIWBpXeMFrRqLUbIcJZxRo49H0DVzlI9BQxpW?=
 =?us-ascii?Q?U9cK+PvEPWOpB6/AjHGV6Uee4/6d1EjAdSTOVVaiSfd1jtxiKRP0QLi5mzol?=
 =?us-ascii?Q?GKiS5XHgvnER4Y62JPgZ2bf4Yyg9ZDU63yLf+uF3o3r4fogAedB4iJIqDqjI?=
 =?us-ascii?Q?UUVOnpUE7SFJKMUrvTNreJ2lOr+16yTOkEy30TJAqYQSituW8Q/K?=
X-Exchange-RoutingPolicyChecked: cz78mN/oQ96F61tUlkD4bLPYqTYdkGf+C4D90pWdkOrAHLzBp/HeyRmQyLY/3UgbTGh4Od6U3vcT6I+DDbkZdLOnUK+Hpf/xW3L+s66Qfwq4vQ+a3EWxjXrfVJUsPKKl2kPKan4Qtdk4RuMqtrzdabpRoxBtk/sScvsFxCp30uRRR0kodDvddF9/MPpZmvcU9L4l8aLtR03KRogtK5t8iu4SOFocXlFtnsprty8c3Nk6jJSI+/dD3SiJ0KV4xFSePAhvOwHjNq6CoxwgtUVK3bvjEhy97XYKqAVhkvlXaP46C1Bj0oWGnfdOm+nv9q2eZDKuiKTqKSoI9geXGU2D6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 831e5fb8-1cb4-425f-01cd-08deab223f7c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:47:51.9739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrs5A2s9qpSdtKC2dMlkykRw81FqpPp8eI/UhbtSEmfeX4GvWkGD1SpibGo0VUY2BQX00/S45QznC11i3iIpqoNm7yhy+C5fET/4Wz+E7FIXp2oU+6MwzW5x59GPY72z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9037
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

On Tue, May 05, 2026 at 04:44:14PM -0700, Umesh Nerlige Ramappa wrote:
>Given an LRC belonging to the secondary queue, in order to check if its
>context group is active, we need to check the LRC of the primary queue.
>In addition to that we want to compare the secondary queue position to
>CSMQDEBUG register to check if the queue itself is active.
>
>To do so, store primary LRC and position information in the LRC as well
>as take a reference to the primary LRC from each LRC in the queue group.
>
>A note on references involved:
>
>- In general the Queue takes a ref on its LRC.
>- In addition, for multi-queue,
>a. Primary Queue takes a ref for each Secondary LRC.
>b. Each Secondary Queue takes a ref to the Primary Queue
>
>In the current patch, each LRC in the queue group is storing a pointer
>to Primary LRC. Both Primary and secondary LRCs are freed only when
>primary queue is destroyed. At this time there all secondary queues are
>already destroyed, so there is no one using secondary LRCs. We should be
>good without taking any additional references.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2:
>- Store primary LRC instead of primary queue (Niranjana)
>- Drop the valid flag and check if primary_lrc is NULL (Niranjana)
>- Document/Revisit references (Matt/Umesh)
>
>v3:
>- Drop the reference logic since it's not needed (Niranjana)
>- Move lrc->multi_queue initialization to a later point (Niranjana)
>---
> drivers/gpu/drm/xe/xe_exec_queue.c | 5 +++++
> drivers/gpu/drm/xe/xe_lrc.h        | 5 +++++
> drivers/gpu/drm/xe/xe_lrc_types.h  | 8 ++++++++
> 3 files changed, 18 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index 9b36ff5b09a6..bc8110a9b054 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -1389,6 +1389,11 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> 				goto put_exec_queue;
> 		}
>
>+		if (xe_exec_queue_is_multi_queue(q)) {
>+			q->lrc[0]->multi_queue.pos = q->multi_queue.pos;
>+			q->lrc[0]->multi_queue.primary_lrc = q->multi_queue.group->primary->lrc[0];
>+		}

This is fine, but looks bit odd without proper comment in the code.
I can think of two better ways to do it,

1. Do it here as below

/* Update lrc multi-queue information after secondary queues is added to group */
if (xe_exec_queue_is_multi_queue(q))
      xe_exec_queue_set_multi_queue_lrc(q);

Yes, xe_exec_queue_set_multi_queue_lrc() will be new static function.

2. Remove the code here, and...
    a. set q->lrc[0].multi_queue.primary_lrc in xe_exec_queue_set_lrc() if queue is
       multi-queue, so that it gets set for both primary and secondary.
    b. set q->lrc[0].multi_queue.pos in xe_exec_queue_group_add() for secondary queues,
       (for primary, pos is 0 anyway).

Niranjana

>+
> 		if (xe_vm_in_preempt_fence_mode(vm)) {
> 			q->lr.context = dma_fence_context_alloc(1);
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index d280e6572398..557dce004d48 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -91,6 +91,11 @@ static inline size_t xe_lrc_ring_size(void)
> 	return SZ_16K;
> }
>
>+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>+{
>+	return lrc->multi_queue.primary_lrc;
>+}
>+
> size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
> u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 5a718f759ed6..0a5c13ec2ad7 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -63,6 +63,14 @@ struct xe_lrc {
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>+
>+	/** @multi_queue: Multi queue LRC related information */
>+	struct {
>+		/** @multi_queue.primary_lrc: Primary lrc of this multi-queue group*/
>+		struct xe_lrc *primary_lrc;
>+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>+		u8 pos;
>+	} multi_queue;
> };
>
> struct xe_lrc_snapshot;
>-- 
>2.51.0
>
