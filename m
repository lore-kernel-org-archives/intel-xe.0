Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DA3C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 18:54:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87CA10EC56;
	Fri, 22 Mar 2024 18:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKjx+2fg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA49210EC56
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711133646; x=1742669646;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SL4qnpxcANJ4kXckqv7CBg8p7xBb3FjO4G0UpGYhj2U=;
 b=gKjx+2fgET0ytEgNXa1ZUh3LeJMSRX1Oz4xQkUTBb00jVXE+ht5teOvz
 pJ5ck6fDQP3FrRRzxMCdL2OG1XtAcZtgif/sIxHeE4iOXyETdK8X/n3KO
 8b6MKC7HzExLOJMFWBtsZSO4wiQ8Sd+auXHSJm3kn6PQIZevvqE/WL45E
 rEnwn3lNBSnhzWGi96BVcXOtAxnaFuraA2ucMHStT5hu5H46lbtd53UEn
 Ovi9ZrhcnZMILzkqILkKpbTDj5MxJS86YEySb/kECRSuOKoMYbejONtIe
 +VLLsGOBK2VIyJU6WWdhsW1O8hvj8LYbI6RciRz55V+gn6GJD1HCes/2a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6053940"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="6053940"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="19697600"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 11:53:56 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:53:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 11:53:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 11:53:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 11:53:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBg7sm5CrixSSpBir9IwBas7rbQ5AeNLt/BL5Evn7/eGlRzNKUoVomqpQBERZ1pD46oyIGmpzIU6D3gAheqD7l98rHK6RpNMOiTClIC1JaquLhhekRKlQEUkZbIPnbrbAcsbflUovK5Uh9bSWsNltXLWLK/xKOwl/AVTY0wLsOgJC+aqnqelJsUYV/glIzYRRT89LG1lVGpVYTXn4n6pXq3wBeVTfFIZ0DsFFXUqWoX8wmKH+6yj72wNNpYmUcBq1KOb/0ZWcf24zvcBTPbbh8lq9QCbZ/RU3hac3qrlZeELd/npRxl/QJJXPWuOVtKSgdaypU2E/6hKgT7nunSKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGU4NqSVGoNEYyfm1YwTDx+/Sy/TguopsPprRi/QBD0=;
 b=JG/p/Cpxytb3KX/Vv7Ut1oBBbCNz0zAk6Df2zk7fLtAxjEZ883QxBHD1e/UMU2qrvjaQEX966x3i2MuZ/c3xx0XJXM/Nze9kE8CFvtw8jYI8c8mhkyLT/aEbPVjIJzN2bthST3q71eXtlcQJtOrN004uCiDj3EBX5ugPK6mPKNfPEltQaRR/AbCnGzT4DFeDaVy3GiAnTl24dc2yJ+Ta4Ge70I6pO8yO5kPMuWavX9KNeGNilsorsMVbGZXG2zfTK85TWJabRkJvuDJDdAnqWVh//Pp9TfKh8VceaHN4r71SRCTPZFwVe1TF0nVguYjLeUV0FQS8t4DP+RqiAf08vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8115.namprd11.prod.outlook.com (2603:10b6:8:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 18:53:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 18:53:52 +0000
Date: Fri, 22 Mar 2024 18:52:57 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v2 7/7] drm/xe/bo: Allow eviction of unbound local bos
Message-ID: <Zf3Tifskoks51r/S@DUT025-TGLU.fm.intel.com>
References: <20240322090213.6091-1-thomas.hellstrom@linux.intel.com>
 <20240322090213.6091-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240322090213.6091-8-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0370.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c36f2d7-3fea-41be-7675-08dc4aa16b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2N39c/97GHgRVtHfwU5bWSIA8m1HlxNInw3BKrRazg3vonzfFNqa9nfu5joNhJvC5+GO+vFffkjwWeamctlstp1q7aH0REBTfPJQCcRFPVl3I2Ak0YqT/DgRuLn7mn7vdulZtMJIMLPHhwwcF1aLw3WanYhpLdWoodq0k9kkYtnY4C2RXw+3D7gQ6kPuQSXmHQkqh1aa9aArZCEiiVsptIhutz+ILTHHCmXoSZD1HTV1gO4dmRggM1nhVZ+X1iuth7HXQoFFhq2eoX/iXBUNwFxpAOlb6erLFKZTsTm7X5m+u6AOvfF1hMV2yQYYIYwX7xvwvgF7jdPl9fmnahvVlnhK4Pgmj92tdfD/9gy+kKPahSTIi7mAdEljYmmhmnQbuStArn1euIrB6MoQDfgOULCI4Z3+ST8uXQvVjY0CnNKrJ3cfmcuqUeEbVsinDS40IfgfI0hyKvub3ryzrBj5OkxE2RFsb06zJAFRmlnqiPIfrywVTonQG9RBhSyu0+KvJpNGlmo4dGkpV0BBsByH6TLFvylZbzhaiTmicOYxeiOIecRGILPQP0LHuyiXlMAhO6qPDkQQzC616DIkK0WYszrxxxFIcZjL1gwTlNzR9A9jNCMBBckSW9VfHwIjPadJ6N2C1C1kgVh6a40CyqbheOTKWOSY+PWAIN7HA3JhBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RwjIGL7sRxJtCVYNTz/4vQ6sLinRri+xGuclxuBSIKyi1vlMlYERIHzC9L?=
 =?iso-8859-1?Q?4aiyu/gKyPpI1B47m/2/ZkO3CfP8OhiYa7+z54uPcoI5K+mDAmZvKLtMzl?=
 =?iso-8859-1?Q?LnQM0tFVKrxh+K237L5rqhuUPMWGvKfULnfwsJPX4Am5GGCkFM/+UquEs4?=
 =?iso-8859-1?Q?KPXHeh0V7ZEHNM1P0Et75gVlHjKkxCS33Lwuf40nvNYk1Z2ugMzWCLTAEv?=
 =?iso-8859-1?Q?7GOIDtl4XvnrWYMty7BnbdLPKsGOcIOjA6JtnAdWuqGiF1hkIQU44RRnML?=
 =?iso-8859-1?Q?6e6cCS3cLid1W37AmPiODPxv+rMUbQS9floaL+qKHtV9U9CroaKY6jHQV1?=
 =?iso-8859-1?Q?PNqQG/rq/xcx4hZLJ3KdpYYNwFPWu+mYYtTOLTHeW99rS/NIKyugRRfLbK?=
 =?iso-8859-1?Q?9pqgj9YGVNs+nws7xMLeEk384sqGafPwJ23aE21l7Esi4J27uA2iugWi1r?=
 =?iso-8859-1?Q?C2WSLX4rvME52w3A1kclkNgPAzmI1dOloCEUgEnNsudKTIFMNSUHUBa5G4?=
 =?iso-8859-1?Q?rnPVjG04ifan1K6iPF40KXKADyLtoEA3MXfkpZFH1KndkNiQ/nEN+Lcs57?=
 =?iso-8859-1?Q?D8sDRXHpLBtzJViOddS2KgQkiu7nPT88p38m3Knyqu3iOV/2/clywjP2Te?=
 =?iso-8859-1?Q?JhPyZ4Rmsz3KsGT+f0a+snkuuwUuu9oyLQPhtL8D6g12MPEwzQEJ41sZ1m?=
 =?iso-8859-1?Q?kpQpoHuyAIWgb0Ln8JbeACM3o90I30Y25LQCoMXeKH8/gEzGg+ZGzHXrQO?=
 =?iso-8859-1?Q?85OoHuCxowau7xZL90sdN/jEvBQnICvWsezb4LIGGBmprE8CcsmVCuqFmr?=
 =?iso-8859-1?Q?fH5nPBTb+NzOhLmJPIOEU4L/1aQJlcc05OuJbBANzJlKW0O1Xh2Sbaswac?=
 =?iso-8859-1?Q?+Ze+Ib3jxgcrt+HfQB4YuNxQ2TuTHGKR7DBxg0HQzeMEZuKIxyJVfZv+zJ?=
 =?iso-8859-1?Q?wfGluWRpZtmEzYU7kgBcHV7MVKgYao7C0QDDy773FiuZMuPLppNzlmyf1u?=
 =?iso-8859-1?Q?ExSDMFk2R5PR7Bpwn2Crh4nJLUPDyljUPWCOsq9xdqtTsD1Baun8azE5Fj?=
 =?iso-8859-1?Q?hRsE5hWq3R76dJp0ZBiJxs/9hKKRv6PGd7Mg/tBSzk8YOW3886bsm/2VId?=
 =?iso-8859-1?Q?ZPyK0vQMf3AhwLPBWpJv/VRe9hoQLjDFcHcEFogOQ6KAcBknMHjeVJc5d/?=
 =?iso-8859-1?Q?SevkzROGEPCj4MR2DD+S/Zizcos+w1KCAxjX8Kz5xYfSZLZK1QQUHXBUfh?=
 =?iso-8859-1?Q?OhTSwlE4wTALzfAgU0xkS1AhqWVz4j4I1Rm1ahWFyTGfwLvERyjOcDrZCq?=
 =?iso-8859-1?Q?7w7kWVvj1qEXYbNbClTQMIlG3FQreSqcdh2NjTkAb6W/rLmQuPGtcVQokT?=
 =?iso-8859-1?Q?eO5fvLbAHtbg++DQs5be9nnnpyKaN1MQeBUmc3b65s0HPOQnib43Z3nbhN?=
 =?iso-8859-1?Q?lBap5ljyn58a6RcSHHKJVNrgWvLVPJtINHN8TTJKC63GQ1Hij6nrGepPWG?=
 =?iso-8859-1?Q?zVVZqdlOFXHh0SJK/732ULT048fDE+8egUb3kGsqw3QvVzuagdPlWJXZAz?=
 =?iso-8859-1?Q?O13x+g+qkkWhh1qzoWS3OlrULn/PhkSoeebGrVaj3GWoma3YKwDWEt3c5o?=
 =?iso-8859-1?Q?AbH1dpoq+z2wX7/OPj/3ODBMVv9qg/vuL+CNekg/IrOG+BmYoE19ZI6Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c36f2d7-3fea-41be-7675-08dc4aa16b19
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 18:53:52.8551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GChIDlLUGHvKaNKPJA9bTticyBWEh+jIdxKwgI37nZ0dau0DCWjeq2lqaBqvtwHAb2tPNwKP5kXM9W18cO3OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8115
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

On Fri, Mar 22, 2024 at 10:02:13AM +0100, Thomas Hellström wrote:
> Local bos that don't have any gpu_vmas set up are allowed
> to be evicted. Support that.
> 
> Fixes: 24f947d58fe5 ("drm/xe: Use DRM GPUVM helpers for external- and evicted objects")
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index db4cd1da8ef3..87e6aff52ca6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1029,10 +1029,14 @@ static bool xe_bo_eviction_valuable(struct ttm_buffer_object *ttm_bo,
>  		if (vm && !drm_gpuvm_is_extobj(&vm->gpuvm, &ttm_bo->base) &&
>  		    vm->is_validating) {
>  			xe_vm_assert_held(vm);
> +			/* Not bound to the vm? */
> +			if (list_empty(&ttm_bo->base.gpuva.list))
> +				goto allow;
>  			return false;
>  		}
>  	}
>  
> +allow:
>  	return ttm_bo_eviction_valuable(ttm_bo, place);
>  }
>  
> -- 
> 2.44.0
> 
