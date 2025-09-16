Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EB8CAC592
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 21:19:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACFF10E561;
	Tue, 16 Sep 2025 21:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzEsob/t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C630310E561
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 21:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758057595; x=1789593595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NNq2eAUgraY2Jsn1KOQ32+daqLsuzzMu95UOe/hm5pI=;
 b=IzEsob/tiZ7UcpBhFLRXH3CGmg7/tzIAiCxAQY8YKZLpgMgHIdgKiviB
 UpWxDeB6WRU2Q2OzP/lDIRuKTOCGZOOtLrgBMmguwMXzffunRh1macxln
 RJg3gndHiZl8VlWxOb0wNpl0CZzZ8jDSHc5ISUvOvuKy8R56TEbie9fcM
 9e9MLrPhp/SFT2UxwBOuCOL3QYUT+/vmMlFgQHojWO8IbEwLcqvUwxy5h
 kUf0iBNqkeZmXnE6nmq2+UBrh1vI5aQ6U3DtXlSsJQP9tsfa4YXNHwF3z
 YQwoHVrjJLGJ+OQ+6cutYp3F6mPR4y6Tc2DxjQjE8fOOFHEfQZUwTdicS w==;
X-CSE-ConnectionGUID: v+4GI+OGQFmIjb0zYsJwFQ==
X-CSE-MsgGUID: BWvFcZxxQgCB1zutiq4Anw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="59398654"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="59398654"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:19:54 -0700
X-CSE-ConnectionGUID: 9EDes9jVTeqT3Cvo0oynxQ==
X-CSE-MsgGUID: NxdGJrv9SHeZOindiLCqaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; d="scan'208";a="174660029"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 14:19:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 14:19:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 14:19:54 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 14:19:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlr6z1LR6evoiknAGX8Uk25NFUzsNywuDDdXyyVvP7VUFV4A9Zg37eOrrABWU6V0G6eidCwmFjT/hCdlZp0oNM/X3EKfggpixAgGYxGioqEteZAIfPmGY8rjOc01L/VvlbAmIEV85Y5VRwoyaB/nQTAfUHWd80D7t5DUkCUVyd6NX/943r5n8VVwRs/fMVzntnVXNkYu119AEbYATCDifV1quTat7uuEaFjFKOZzavSxsU6P5V2PZGAj60Bg1ebULmIovUW1d84umqrzyJCyWLjPPJOSWgcZ2JaKFbVMQLKZd/PmTGR4CLA6i53aNN4x2deXKg69MkFSjC/r3Cy0Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVe0kC3WiIsKHkwN2Gka60o2e3P2k4+lJAtYmNUup4g=;
 b=zD30bKL6wxfl4dFiDsn0xFvAhS0c/07Ugd/1zQfE3j7hIaMtoCmKFWngAEFGb0y2lVjnt3Z21tZxPjUca5toFgYsdtIc7J+YW/k2lz2iiiDHelJSfIpkmTJwVAJonmMrj5t01UzYic98Hld4Etb+jLjBYhPiUgefR8h0RlSzB+LggZ7erPsOr/+Hdk96LgBSpnVXC69YQ7HpUjThuUfIcYqs7JJDTV3q9T9+z/Bk1eStl1/IsSvqoEZC1CXPoM70bRowYaAbr/e3YloGYXR6qj2QH80LDaRY5W+AxKgvBZWV+qb9gtM8krnNzMpMw/mDmlGR5cL/ov1snrOcqCLdYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 21:19:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 21:19:51 +0000
Date: Tue, 16 Sep 2025 16:19:49 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v4 5/6] drm/xe/lrc: Allow to add user commands on context
 switch
Message-ID: <p4wrvjq6tq6weue32bnki2rowaukquyxw5bc7wggznx65tl6cg@png3chvouixf>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-5-c8f7e48f7eae@intel.com>
 <aMnIQQWdJvWEA0pK@intel.com>
 <qyoilnhjle5cn7sd5ciuo2iwogkpntl5pwssxcgn476issw2pu@ososownuo7mr>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <qyoilnhjle5cn7sd5ciuo2iwogkpntl5pwssxcgn476issw2pu@ososownuo7mr>
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5308:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df2a90e-af87-4d56-8169-08ddf566c635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OGHIIZ74J7N7FqmoVbtZngBq/0Sf7Qofa4xAzGGt5N+I9UcOBmPPv3MTirSm?=
 =?us-ascii?Q?AMKhYcVkeS4RUXz0e1OPe4iEhlvWccUBwer9hR2Nvts42RfHq20PDpWIZP64?=
 =?us-ascii?Q?dAL2nm/X4kQyXOsVzOT8lihM49nsTb05wTHk1d6LL8eetDGRuix81UIjVZH4?=
 =?us-ascii?Q?TlmBvZ45FygPqroXRm7uwtRJCWZGmsXf0sdHXGPyiJ6Hw5gLn12qwV8Ri6ll?=
 =?us-ascii?Q?AHkfxQo9DnGdWXwg0TeE3XcHe+kCPzTGep2K5ByQGvC69uzLusC19hlod/a3?=
 =?us-ascii?Q?DjJuURubxMeVbwXXKxvaf1xwoDg1z0hL9ZHzKAirECKKa4dfvUgjz6WMvmio?=
 =?us-ascii?Q?cEDFPZneVfbzYVNvVXZnILLY7F7z+NYtfs5TW1OSrdq/moxUmo2Mpe/FhuE1?=
 =?us-ascii?Q?RrD540HncUd2INLJqj67MQuQ+KQzCn6DccQlFhCVKefc6Q5Q4+4UNCutdHHu?=
 =?us-ascii?Q?r/aT7D2Yne5CDILiuZzaFhGNXw4N5V+c6pThv9jx/KMrxNT9g1NbrHZqrTMR?=
 =?us-ascii?Q?Ox+YvMHSArriwMbziZ++Smljc5CUk7Q9il/s2DfC50j9joYX0zvVCAPFC8VZ?=
 =?us-ascii?Q?0vjwPtAGdqS0a1omGrlYUJF7Rr+TFvZeGfBlvhkWG+cIe5Jefd0nZ/xZ2aT4?=
 =?us-ascii?Q?f2KP5zL/JUo0//9kKUuMw97ChlP9Tx6PICWu04IOedDp1rfO7DIo5YHS8HkX?=
 =?us-ascii?Q?6WGjSOfTlYY05yKhErwCgaVqWWPdg9aB/uFYTVNreq/l7Jow+FNmz3Q6glNX?=
 =?us-ascii?Q?aC10NTRgcCFMEsRr+TRRSr9RfAf8dEBBPZK9sMX+UFRSDMFm3OP/NeQr+HZP?=
 =?us-ascii?Q?//hRex+qbUFacujM7LsrHSuWLJYC7koMYue3tuGRJRz8IAWo9vm0dqlQ8k7R?=
 =?us-ascii?Q?5NDfN9dKJWRwu7/1SEVSn0cS05h3hYmLBduYsOeYh0BleaEK+Zg5G7ZumxHZ?=
 =?us-ascii?Q?wm9iiE7f7YkkVoFSf+sRbv7a03lKRmgLs7uj7lozQE1UAUFFnzXX5/87no9S?=
 =?us-ascii?Q?AUPPFV0tOsAN9pB+tG5VVYF66VY0lTCSfRuj8j2NQjeLqJsTFR5FmxJZQZ7/?=
 =?us-ascii?Q?asj49iaNt0ZFXFC3j5wmhw3/8fiAcTXkGSoFdTAP6hlbi3i2T+42ND6JlSpf?=
 =?us-ascii?Q?s1TtLf5TYOTeYrWTm72hwoK6oxlsF8bv2SfRB+xwtogHoEUkkXx1G0WtXD3o?=
 =?us-ascii?Q?2B2HkKj6EXxx3pKpG33QI/tLz1xVqPUIjerAnaRaZlIDlhnLE4BOJYg8/yI2?=
 =?us-ascii?Q?bcboxOFm6o8/A75+FthsJPMF5N2FyFFqXhaaP7a/fYRznlWTafY/tNlZukLk?=
 =?us-ascii?Q?+IJd8yvZTwlLD0F4AqZA4GyYx2iKgs6UZD/A/BZFtbAiGPOUKAwozB9rnmL7?=
 =?us-ascii?Q?cqTlosnXqEPZaygSC9c49RxVA/UJhOEfmFVlqopdtzZcX2MLsrNeV6whpa0M?=
 =?us-ascii?Q?id5iAEN5cxg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cza1twfiAtkBblPyk7ri4DNoesdF1KIJEhoSvhUc3lUcSRSnkAKzEtEJqfZk?=
 =?us-ascii?Q?nsJR2YRKyZ9ieBlZNiNw5DW2UI+ir0qOwX5iOnhVXaU1ghQfwzjADuy61jQr?=
 =?us-ascii?Q?HbvyN6rZiGdEA8j7dyCrfsuWPk4+34Mm5JkRD631FoBU5kZ+a2MA2KKUOr3H?=
 =?us-ascii?Q?HtqHCfC2DLeLHFxMTkXU5YgyVlNTIEkSL/YiuD1FYDb6dt//7URP6tqaKcWC?=
 =?us-ascii?Q?PxIUtN3dzCcH8jM5Ww7IcNpyWL7BYiUxxUfH6l3bP9FK7ohlaaptu46uwWlK?=
 =?us-ascii?Q?TTl6AcDvJa8aK/zt+1SxsZXJtLcaACHbo65smf97mgd6S5d5yhPMj9JXacQc?=
 =?us-ascii?Q?dXTamfnrmuwfn/oVQ8C/hakol3cY9sUuY4Wdp+4t1f91OdCTVE1L0s/yGRZ2?=
 =?us-ascii?Q?royx2QB+oADOFly3/LWCCqTrNGxSnBqaFwM+pFymvfvFn2Z6LQ4IwZwf/UMH?=
 =?us-ascii?Q?r0ecQR1tfrNmw8CCfLHLQEZY/e7lSyCT3n7hkgaInjXKNbkLu4LE4QT4pHga?=
 =?us-ascii?Q?CE/g2ak+qe5pHyw6Z3eWOllHHK4Ad+V9gn3G3V+By2nVMhRrPaj6jxkbpqcC?=
 =?us-ascii?Q?XqN9/JrLgjo6CS2+UBhrTOxBtFQ8gnbnzxxZ9wjNZAHC9ItUysQWl71lMvUi?=
 =?us-ascii?Q?Ssx+CSBgGAT2Y1GiKzYkXxa4hDhO68xpL2lJnUdQwABJUB1Z1Ob9rkgkb3Pc?=
 =?us-ascii?Q?qih+5NvVvxlmwF424vlBpR9Ci30nGSKy0AnvFPHjCrKu5lERM149sdLykv1x?=
 =?us-ascii?Q?ZOb69Gu+XIQQIrqoaWS7kojOwwEgcJoNd+VXnNn087KG7urKLAju8qTNUoVh?=
 =?us-ascii?Q?Y1d+AuX6Ks7HbeFCYg9uTXRMQuY3fSbMDmKY7f/fiu6wO/zfXA+GLa3IGvUn?=
 =?us-ascii?Q?DfI0Rz5k2vGkN5w97WMjM0Trr5cCTrfNFr36gAVcKSLO990GwUoeG8x/mSRA?=
 =?us-ascii?Q?ildZBn/RikPFvG2TzT3TvHcLO5rEGKsh7kQlvfqJTFHDLV2vMuouzI3soJgJ?=
 =?us-ascii?Q?O37LuAhXrvZEpIKZSeBRbO54Ga8zq2wvV+wH/Q9TzdbMy9UntFE5jeNn48Hy?=
 =?us-ascii?Q?gsPAzBOFszskDhduR1T3WI2R0xaeO3kJDegUkvXsqABECSorMziPpw263+aN?=
 =?us-ascii?Q?1mJNkgurhsBujVnQUflCfQCzzevp26ZRCRlrfno73i331OSfdNHgoD8OLmNa?=
 =?us-ascii?Q?UfNZFY+qMKCebSWAN1DGFl19jyghbQ0bilZj4kLrv5p/5XDjuXTGktJxJ5ax?=
 =?us-ascii?Q?bwU8IqDgLrmSW62FgjlvyIly2kpPOoErQ62XBOfmMXCciiCQ9S/HpWIQm9r7?=
 =?us-ascii?Q?wU+QwhUNmaBlqgM8lmqP0USqM8te7yU3dFeY4E+Jyz1r6eE7OmD0aGr+RhUp?=
 =?us-ascii?Q?2PbVfxN0C8cUACXpaL7Fs6Gk7QkPiKq0o/y+kxSuxoDVRSxL0pX24Fwd1Hqb?=
 =?us-ascii?Q?DV84I0ij5JS+egjhFWPHCsKI7U8e63Dktj93/a/5YpfgMLGZrmDgpL9el8Gl?=
 =?us-ascii?Q?pRKIJymfMuxmBk4vlfyKu7QNJ5W58tdpZcdZBJM2T7/t0AaaLC+5M63BBmn5?=
 =?us-ascii?Q?EMKENMYJR31JfpUeCogWMX2S06IR58al8Q+n8iYnDPly+1lu3/ujFsIg+50B?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df2a90e-af87-4d56-8169-08ddf566c635
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 21:19:51.8499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNDQI9DhrRor5cquSRvb/+9N23kMASFCsWMpYNw3CvmcwydBO/u2Hl63b64d0VDscm5uetj8dg0IhbUBaqMoJ52YWeb2zZ+wVen8CbKA7Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
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

On Tue, Sep 16, 2025 at 04:07:20PM -0500, Lucas De Marchi wrote:
>On Tue, Sep 16, 2025 at 04:27:45PM -0400, Rodrigo Vivi wrote:
>>>+	memcpy(cmd, user_batch, count * sizeof(u32));
>>
>>shouldn't we use copy_from_user here?
>
>no. When the user wrote to the file, configfs did the copy and
>called us in xe_configfs.c:
>
>	configfs_write_iter()
>		copy_from_iter()
>			...
>				raw_copy_from_user()
>		flush_write_buffer()
>			buffer->attr->store()
>				ctx_restore_post_bb_store()
>
>ctx_restore_post_bb_store() will parse the lines, and save it in the
>correct format to this instance of xe_config_device.
>
>What xe_configfs_get_ctx_restore_post_bb() does is basically return
>that already-parsed-and-saved data.
>
>So... here we are not copying anything from user. We are copying the
>previously saved buffer that is already in the kernel.

btw I was about to send v5 when I received your email. We can continue
the discussion here or move to
https://lore.kernel.org/intel-xe/20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com/

New version is a rebase and extend the support to mid context restore
(aka INDIRECT_CTX). Now there's only the rc6 bb missing.

Lucas De Marchi
