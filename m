Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3034E6F07D
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 19:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A7710E209;
	Fri,  1 Nov 2024 19:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIcHiv4i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5F10E209
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 19:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730488770; x=1762024770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4W6i9D2fyZds9vQ1A1M2dcAUvg/98MBxPobBLC3miQg=;
 b=BIcHiv4iL5JS0W233oMZ8rxGhZrNY97FeS91OaRAthgCnRINOE7Bi9ut
 AU963TwqluoI+QrsWAOUpNhONQ3FEVpk2lcLvP839qYRXJFF3QryBhnwz
 9XSAqrzhbF7re5+a12eaU9u5n7auF+2Dp4SV24Fy4GgAz0d8D2GMd6Msk
 YGjYBzS/rel1L0uY82UYSCojwrllOOl7SSYKu4EkeK3PpUgs+d33O0Rif
 PswDGodMMQM7nt0/9TBmIAc8Z5SdCO8mqW9joE8rRO05PGPMYsRzRIo+m
 hUHAjzdJ17JuflXKHivHUOiEZlfZBAM944nsmFwAzgTRoPOuQvxQRvLFF g==;
X-CSE-ConnectionGUID: rDWHC+vxQXKzlsKYZQW+3A==
X-CSE-MsgGUID: +fI5lxuGQ26q2fYt0CnbCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="41659191"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="41659191"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 12:19:30 -0700
X-CSE-ConnectionGUID: eodkdIxPRFyKrIT0E7NBAg==
X-CSE-MsgGUID: 3RVRcqhrRrycapbQKhEHgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; d="scan'208";a="83500093"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 12:19:29 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 12:19:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 12:19:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 12:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9DMBXmPxjIuU3zy55JtASxzvclHKKvsQO40LMfu4mZ+6ihcIfuvFzamCYYF8J8prxbbIBUVQi/viB1/UzVrQkNbh431KYNcfEh1msnHxhFj5aW5jpHkd5Wzx2IDGlke3ItG8ijeSOdE2kZ4gBo1iGbsssqo9xzaAQ4QZGJeQ1aC5xHueHFBOPe3kitJ3vDbVgh2tF9j5wWdxJTWcGxVF91BXe3vDmaB3C58bBEQflFlJIOh/GREsueQcNIdfn1KZ0wHbwfCbpmbH/9zrsqYBsIQx/42uxaw0C0g9cUtg3xWeQWAqLuUd4KTcmcxCmEzYcMo6Tc0vOU6QUt6IbUjog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsxxlH81iTQgkdXiwSyt0r2DOXaxKD2ojdgzvV3ws+Y=;
 b=JVyfTBh2oKxW4a2M31D2EHBIqm+ARUecHukTfq4Pn4bP6JUBktOYV4zTBg8P4U8dTvRLmPunnXnq66x07GorKPOCX/jhhPPmcYRnJqYtB0q4z5WempEk3ZtH+BQ2q1K2+E9JbvcjD1JSbTbgVjnkICuQ54lHEqS+NzSZN810CMCX/HLvw98dJgC7Y7Rpd6lsoaGaxysmgHwQEw8yKivjaalF+sSCjb/78heTKrdAvWFfb36fT0fXIHHuZfZn7ghextgf6RaqDt2QHcbUF3eNX4civbLg5RWKZOBJ+VTFrdkyGqv+1PbszPrzw17QCIChoXHIhR8hPcjEQ1xKCik/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 19:19:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 19:19:25 +0000
Date: Fri, 1 Nov 2024 14:19:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, =?utf-8?B?Sm9zw6k=?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Improve devcoredump documentation
Message-ID: <dpxgkdqk4xlqfezu2xdig63di2nbsim3einoyf4uqytygfxttx@n32pwkzfpg2y>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-2-lucas.demarchi@intel.com>
 <ZyRrisQfc_59rrK-@black.fi.intel.com>
 <4kw2zzb76m42zbisvsy2fu52q2litchy6dfl4hyrmvze5u5dvk@hjs2pdynjemd>
 <ZyTutrXXD73sofRo@black.fi.intel.com>
 <49fb16e0-8cf9-4d2c-b783-1ad851bf9dd0@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <49fb16e0-8cf9-4d2c-b783-1ad851bf9dd0@intel.com>
X-ClientProxiedBy: MW4P222CA0027.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7791:EE_
X-MS-Office365-Filtering-Correlation-Id: 085abff5-79cf-4fb4-a7ff-08dcfaaa1934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3O9mxVZiafroKtYdxkq1w3LAZ0O/G0f1YLNXOB7YGOp+0UFN51Z+dZFO6ZXV?=
 =?us-ascii?Q?+GOOndSNdq2ZfmKjhkM/0KkICBpJn9Dv4msfukiZPQN7O3PoNKAHV3z9QDfE?=
 =?us-ascii?Q?ew3KPgpO423BJY/s/6VXBPK0xMQ0oITarbKQ357KwtGl91o3jL7eL2We3/tD?=
 =?us-ascii?Q?ucusxxO7kwnoDXH7TOyH1HBCqDBs9yzchTyQafWM/dI1NngPUBMNR92aIufS?=
 =?us-ascii?Q?LtyjCEbbozMv+96Np04Gy3cE01gUF2i9ja+HfolWLzaETQQsSq5c799ufSSS?=
 =?us-ascii?Q?+gHWjF7bJjLUPQQibH38VUjf8OdUZFqAlp5m9kLMgFTrL0uUK8It17kCzwHM?=
 =?us-ascii?Q?V/qiOV7jG89Bw8zUi1sf8tMkQDhF3Ojo5pB9zj8U1YOHpG3tic3MxZ9g0ApM?=
 =?us-ascii?Q?lKU17yebqCnTcu2WfGKPqOFWxXlDXfjgHU4t05TGA2Y2OrKkbgsZasUh0N1h?=
 =?us-ascii?Q?nAM/x5h5OP8VjOC/gNYc5+adpXFNoq/TOXnAx0ajEsxHTdF7yTQoz+6omiB+?=
 =?us-ascii?Q?Rony3gx3xGDSdLdmz6BNTjdfbJiJ+s9tZuKeZHwcHNjcBdZ3hmDJ/1qN8TIW?=
 =?us-ascii?Q?jUS7ss0q3TMNAU4H5dmL1q+3J+3e0+CssuGjIVD8AShY4U7FXK3n1KoahoJi?=
 =?us-ascii?Q?31mtPxX0a8sxpqmMBWuvExYCOMq2iB9qRp9TyJHzvkorrJMFwINO++OQ9e1F?=
 =?us-ascii?Q?jwbw2TogcsGDcKJPr9a7lGoDu/IHbGH2jm7IadygjIJRR3+HUMdvT6rUKypL?=
 =?us-ascii?Q?EcRZ9vPEoGn9m2QrLiaZg5b8raoGyd7d8bm7dDILFDGkQE/gOlG2qSLxSJ0U?=
 =?us-ascii?Q?jvxIFn77yoxNzQhuba1WzBSh72hk99ywiy7SCxmVYYjuMh4ucLv8jemwcV2f?=
 =?us-ascii?Q?1fVpF/TsM4ZEWbKIOazvJxLPQvtZh3MUcDhw1KuoHZn2TCFX1Q2ONF6bhkXL?=
 =?us-ascii?Q?N0bopvL2nofAXqkKXbHlhHd1OHXx4bWBtE6EC2cRbo5VGntY7X52rshL7Lrt?=
 =?us-ascii?Q?JJf/zS68HwuGaWMX/xSMqCB085EXw2LNIKuygw+KsEL28Nmr/g0F1fUh/QJV?=
 =?us-ascii?Q?ODmYUeaYHLzl/QVab4Dn1oaygDHzOCB5UevmXAW6uLDboHeZu7eX/nC9hjdM?=
 =?us-ascii?Q?Cil6a2yQgUU19QWEtTDOqunbFG5TZ9CXGbukM5Gc/EoV5go9oV6+QRigDTbL?=
 =?us-ascii?Q?w5NSkgqT2uzlS5zXxzuZk5drHLxsxKBYmQAGXONoozIs9t+jTaon6EycJqmV?=
 =?us-ascii?Q?JQvDr5lLjxZrm0b0CHx6g4gnTcXjY5X7ttudeRAw+JzrcNgD7u9wIb9A8QD+?=
 =?us-ascii?Q?H/w4y35DlqIGCHs+ZX0B7/lt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lVf8wmN/uTzz51rg2exd0M5AInrX5gfvWwqWzRQgpiwEf2vtdHHhecuGze/j?=
 =?us-ascii?Q?WyRlqRCV4Z+x7gbBfWgeTXkgakRQs/rdJ64bdLKoOacJRzHeGav7YwUMavRa?=
 =?us-ascii?Q?76I2rW70vLuYuHxN3KBQMun1tkRdGzNfLE/VnLP59LfadC/35mxoYD1UOPkF?=
 =?us-ascii?Q?ZQnXm0onDqNWEP3ki4wWpsZVtQZyRObysW6D+L8fUviKEc3keqH0ZvBhyr1m?=
 =?us-ascii?Q?1rrlcaqRScl7G7/jaIJVmS+nirtp3EOX9lBV6Td/RED3Helui68Q/IS41kge?=
 =?us-ascii?Q?j/ied4LhANmTyC8dnPoVQ6Lw5q6JKKiOn9tfukv8oETGDZU0u09JP4heHtkB?=
 =?us-ascii?Q?XKLQpV2HhqQg8tls4jrvHjMOFVw4hp0lhuJdGPaCE5rWVQga3nvPAa8yoflI?=
 =?us-ascii?Q?NyakVqtCmGQHR4SXGGdnteEOrjiHq/mC3wr0sjd5+DkQJDE3j7VvIqxsKUbm?=
 =?us-ascii?Q?qRdo+3KoegGYPZ8WLw5tV5VC1WtBtojVeJEMdpSWI0DVWqtq+uyTvdVL+O6J?=
 =?us-ascii?Q?tbkLVIR2hzFQhMA8ObunTJKwJwCmEj/45ZlH9XEu8LIqd3OKuOVk+pRs0+ls?=
 =?us-ascii?Q?WxkkCm6IRLEu9GvrRQPH3hGlkIZIkZD2y/T0241dKgOFpw3nWp3F4+c5MhoZ?=
 =?us-ascii?Q?0xt+rIMQm7tg7vEioFUBCyYZdKv/J7Vd0Aa30GUnM5eqG3Tuph9xEH1U8//5?=
 =?us-ascii?Q?Tcj+7yST/5JPE3dWcLajnZADhQTTblxBrcNu4NpV46w792EEnl9AINFbjeUC?=
 =?us-ascii?Q?b6D1nIlVmNt6jHue6Lfdgxoqg/e3mHMJlX0tCd1C72Ts6fnUygVgluB00YLJ?=
 =?us-ascii?Q?Pqh7WvV8jfffsEyCiZfsRVsJBoEjYxl7Lr0PPrlsVKSjdyKTfCwAhthtAhaZ?=
 =?us-ascii?Q?jFcQAqcwwEs4UgyXbsfZBLvS8k6RsWtaiGpqTR+XuyHGu0ryAK92/kMNxpsj?=
 =?us-ascii?Q?9JabJatFF8ooyu1qb7wCtK0DW57WaoOmVnkrs6/bhWzia+PBIc2Vx+lldAU7?=
 =?us-ascii?Q?+jCo1YZzXwpZPjpZZJH+nXYuDRl+m81MGG9CSSnRvWrehDVcKn4gtOrGJf0Q?=
 =?us-ascii?Q?vwISj0ssvJGmMdIho9ZsGsJSWBrXYBRiaU1aF4U4RybyHn/tcIbdv4qKz/ln?=
 =?us-ascii?Q?TmBHFltSoMIKtxp5zcZS5YRXR7OJm1gqkftcjPH99wKA+SOrCvG2T9Gx1L/P?=
 =?us-ascii?Q?OOghXtMTj7JmVsVz4etliNtIfoRTli45bmdC9wfnttEG4EC1Hp/2dWDJE/tb?=
 =?us-ascii?Q?efkelqQlUKXKqe4HJT1F9jF7E7MO7Ow/aJdP8ljT6Y5H0ZkH08cHSmGEBaCS?=
 =?us-ascii?Q?BJjBbRy9jZVOGZRoj5Oj5h5fjBkwWtTtwpsUYq0UzCaMpdTWoNleq02H/6qy?=
 =?us-ascii?Q?+a1VE2VMHLgE8wfkQsCtnSr+L31tRcnJKp5CdTy0zeY/YLCLLAYq2IP2NaYX?=
 =?us-ascii?Q?VYSSPDcvTn04Y8JIhUXHxfwgYcPnl8ZltGg0FqpJ5vfwfQkYdMr/vf7gYm5K?=
 =?us-ascii?Q?03s9teLf4bCYuglgaDZTABTnB+lxxPqCtlm84BQtjo3Q+yoEj2xoJmIDoLMc?=
 =?us-ascii?Q?6Xc64whs6C2FTeDB97ky6xVdLwTJBOJ9jwRlvHIlbGZnDkuMCTx++Lz4i8Xq?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 085abff5-79cf-4fb4-a7ff-08dcfaaa1934
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 19:19:25.6367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Vrble+R2vo7NvN0yLPv4ZAYsIMv8DPim89xH7fnAm+bgHIL5XPw0SGKj7idnImq4/oJsm+NT4MDXSnDGJb22jqW/z1sYTeW0dsEcAq/DQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
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

On Fri, Nov 01, 2024 at 11:39:59AM -0700, John Harrison wrote:
>On 11/1/2024 08:07, Raag Jadav wrote:
>>On Fri, Nov 01, 2024 at 07:44:37AM -0500, Lucas De Marchi wrote:
>>>On Fri, Nov 01, 2024 at 07:47:54AM +0200, Raag Jadav wrote:
>>>>On Thu, Oct 31, 2024 at 11:29:15AM -0700, Lucas De Marchi wrote:
>>>>
>>>>...
>>>>
>>>>>- * Snapshot at hang:
>>>>>- * The 'data' file is printed with a drm_printer pointer at devcoredump read
>>>>>- * time. For this reason, we need to take snapshots from when the hang has
>>>>>- * happened, and not only when the user is reading the file. Otherwise the
>>>>>- * information is outdated since the resets might have happened in between.
>>>>>+ * The following characteristics are observed by xe when creating a device
>>>>>+ * coredump:
>>>>>   *
>>>>>- * 'First' failure snapshot:
>>>>>- * In general, the first hang is the most critical one since the following hangs
>>>>>- * can be a consequence of the initial hang. For this reason we only take the
>>>>>- * snapshot of the 'first' failure and ignore subsequent calls of this function,
>>>>>- * at least while the coredump device is alive. Dev_coredump has a delayed work
>>>>>- * queue that will eventually delete the device and free all the dump
>>>>>- * information.
>>>>>+ * **Snapshot at hang**:
>>>>>+ *   The 'data' file contains a snapshot of the HW state at the time the hang
>>>>>+ *   happened. Due to the driver recovering from resets/crashes, it may not
>>>>>+ *   correspond to the state of when the file is read by userspace.
>>>>Does that mean the devcoredump will be present even after a successful recovery?
>>>yes.... if it's not succesful then it's moved to the wedged state. Easy
>>>way to test is running this:
>>>
>>>	xe_exec_threads --r threads-hang-basic
>>>
>>>You should see something like this in your dmesg:
>>>
>>>	[IGT] xe_exec_threads: starting subtest threads-hang-basic
>>>	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=34
>>>	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, logical_mask: 0x1, guc_id=32
>>>	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=18
>>>	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=34, flags=0x0 in xe_exec_threads [2636]
>>>	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vecs, logical_mask: 0x1, guc_id=17
>>>	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=18, flags=0x0 in xe_exec_threads [2636]
>>>	xe 0000:00:02.0: [drm] Xe device coredump has been created
>>>-->	xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
>>>	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=17, flags=0x0 in xe_exec_threads [2636]
>>>	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=32, flags=0x0 in xe_exec_threads [2636]
>>>	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=ccs, logical_mask: 0x1, guc_id=27
>>>	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=27, flags=0x0 in xe_exec_threads [2636]
>>>	[IGT] xe_exec_threads: finished subtest threads-hang-basic, SUCCESS
>>>
>>>
>>>If you run it again, it won't overwrite the previous dump, until user
>>>cleans the previous dump or the timeout on the kernel side fires to
>>>release it.
>>Yes, which I think we're covering at later point in "First failure only".
>>So maybe establishing the mechanism itself before explaining reset/recovery
>>would be a bit neater...
>>
>>> From a distro-integration pov, I think it should have a udev rule that
>>>fires when a devcoredump is created so the dump is copied to persistent
>>>storage. Just like it happens with cpu coredump (see systemd-coredump)
>>>
>>>>Perhaps moving the 'release' part to above paragraph will add required context.
>>>not sure I follow. Are you suggesting to swap the order of "First
>>>failure only" and "Snapshot at hang" ?
>>... in whichever way you think is best.
>Note that 'snapshot at hang' and 'first failure only' are totally 
>separate concepts. And neither explains the release mechanism. 
>Reversing the order of the descriptions would be incorrect, IMHO.
>
>The point of 'snapshot at hang' is to say that the universe continues 
>existing after the snapshot is taken. It is not just that the driver 
>recovers but that it keeps processing new work. In an active system, 
>it is extremely unlikely the system state (hardware or software) would 
>match what is in the snapshot by the time the user is able to read the 
>snapshot out. That has nothing to do with when or if the snapshot is 
>released, nor with how many snapshots are taken.
>
>The point of 'first failure only' is that only one snapshot is taken 
>at a time. If there are multiple back to back hangs then only the 
>first will generate a snapshot. Further snapshots will only be created 
>for new hangs after the existing snapshot has been 'released'. And I'm 
>not seeing mention of how to release the snapshot? It would be good to 
>add a quick comment about that.

does this look better for y'all?

  * The following characteristics are observed by xe when creating a device       
  * coredump:                                                                     
  *                                                                               
  * **Snapshot at hang**:                                                         
  *   The 'data' file contains a snapshot of the HW state at the time the hang    
  *   happened. Due to the driver recovering from resets/crashes, it may not      
  *   correspond to the state of when the file is read by userspace.              
  *                                                                               
  * **Coredump release**:                                                         
  *   After a coredump is generated, it stays in kernel mmory until released by   
  *   userpace by writing anything to it, or after an internal timer expires. The 
  *   exact timeout may vary and should not be relied upon. Example to release    
  *   a coredump:                                                                 
  *                                                                               
  *   .. code-block:: shell                                                       
  *                                                                               
  *      $ > /sys/class/drm/card0/device/devcoredump/data                         
  *                                                                               
  * **First failure only**:                                                       
  *   In general, the first hang is the most critical one since the following     
  *   hangs can be a consequence of the initial hang. For this reason a snapshot  
  *   is taken only for the first failure. Until the devcoredump is released by   
  *   userspace or kernel, all subsequent hangs do not override the snapshot nor  
  *   create new ones. Devcoredump has a delayed work queue that will eventually  
  *   delete the file node and free all the dump information.


Lucas De Marchi
