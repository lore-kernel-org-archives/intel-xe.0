Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F0DC7618E
	for <intel-xe@archiver.kernel.org>; Sat, 22 Apr 2023 14:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5AC10E2FA;
	Sat, 22 Apr 2023 14:57:58 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B4F10E2FA
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Apr 2023 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682175477; x=1713711477;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gLrRnvBnSNdUCO8Rz6bmKBtGiNrOUe9h0cVS57EnTQA=;
 b=QYuIdptViQE6Jnng1fpjvVXb/N88oOie/ij3ErKwGRvIxcWPRFFf3L5J
 Pkd1mXxB+kkiat4EX54r1BJq83m1W/HuSQHVDHU330tbg39fiw6/a56Bm
 H7Vz1nvSPkWAeLc4vDwZNMnYnZJCcA1isoZ2UAeH4V/236fERtL8n6Njy
 KgSYlKbtgh1AUcx6/FcO+NLBMYrpHjDX5Dr04R/Nc94/I7uxP3HjPvW4H
 DrfsW89fYAF6/H7Qe/WfV/aQqFFwKQFLRUjJXJV8IxmHewWXEqiii1ypH
 gzRPBvTpGi+Vom6Zy31wqjQqkbw12V6BCF3bMxs/Faz+0QxONrzI6fQMB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="348959880"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; d="scan'208";a="348959880"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2023 07:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="757194799"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; d="scan'208";a="757194799"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2023 07:57:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 07:57:55 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 07:57:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 07:57:55 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 07:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWo+18Rf6CXC3/VUcFd2aDAijdHfOECZvC3LiY/UXCKSHJ963wb2PHtMHUy1lzQJ7jQO/gFLbfP3eWWgfHbYhjSKvPRsmzu8pSyHaDFqKPwBYv+ZeDyT2JWheczRuIiwqMiivs0WvgK8yfShLtwbr6uKKHfgQx1IFIOgKZ7cXddwkn6+DBbR/9u0YvTkYHFZIYyLcfyQoB4KJUk07mj0b4v8vJ0FMLcsdzyeiug+DC2ZQYASpEa5G/lx9guFSn6zqSNPy4jWnvnrxEJJTpVYsdq0AAUB1yRPAV8rNdINsbwerLE/Fusxy466tMzToctsvBXRhPpQb1+hUs9R5t7acw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/VQ9GCm9l6O+2Meya12p79rySCqyXwKeD6HESjFcTM=;
 b=OcsvW1sH4sFILWS1pmJ1N+iegFH+Ch6RuI6iOPCQ54fyT9OSHGq1FMJ9TUpl+6Zk3zfIiDYK8o9Ka9Q8CAO3IzKCbHQ8W5A1EKdM5KUQypnQ0WudjfKuK76EAmoZvISFG9kRhMTiEsQ/6hjSksV/v1Rja/DmSc4WEIHoMetG9Mv2Yj48puLAU2NeExfCK45FAvTuWvWqcnNCM8Jm4yiED5n3AJixphm2d6KEKP/ynzw1bUP42VRegNjwgBebbWRqSfIdQYwILh4bnAHV5nAOPnywoXtJzmhttfQ6HSwWtnPhe4Fz7MSToDVVHJ99/gTUNurPO8cp2n5t7LSsX0fZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.28; Sat, 22 Apr
 2023 14:57:53 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::e15f:6c7a:7fd1:d63a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::e15f:6c7a:7fd1:d63a%7]) with mapi id 15.20.6319.022; Sat, 22 Apr 2023
 14:57:53 +0000
Date: Sat, 22 Apr 2023 07:57:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <zvyln6khtdvvjefsrfnm72fehxbgnf6mc4vyx7lkx6ptzsjev3@clay6qyalkd7>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
 <20230421223258.128781-6-lucas.demarchi@intel.com>
 <20230421234141.GP2825255@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230421234141.GP2825255@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: efd08ff9-113e-4220-c1ab-08db4341f265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWZArc10NX6BoCfE46UFGGExv1MMcGnp33y6wmwPMHR6QawD9MsFONzqhjZ8UtNsxi9Phc7q8f828qg/GQ/1jj6TR2QM/GcDifsS/O+z9Rzut1tp1YVv1J4B9Q81CWGqddlMHocxG8BxkZ2+R+bBr5eXUt5hNAalANUDScx1oFAKKsRxt4sVQhtWJuxS90i/baYnyKkZC02ouv50mopd+kkNR4AS0DHFU446PlnsU1ENVratkvjE2ASTM1c62kwAp6iGb1yKqwQ/6WwIGiPaF0A2N7lPAhXI4KT/yqWScFIFR74pNC6SllWl8KBUcGnJoF9FqfwI1tsJwvGCX1sGtwOK0arQtgwrJz/z5hqKh6NCGtbY8Yc6bIT2MvQH55CZwTnU5C2ZHQBFBNjwzd2mox+zT/VDMPDjku0qBD0uxFF16eGBMKcXHkpvFMmb0x+MpTXUAmRJUkWzw4o67CspBGKcRMuKum2ZdH2RDNvb//gZlLux6xrZ/kP6VN0zJmtadlrjNpl3BOwcZcYcL1ybjrvHYwYJc52T1mwXjBfMRUHcUNgjicozdfuP1rh1/2LK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(66946007)(66476007)(66556008)(4326008)(186003)(82960400001)(316002)(6486002)(478600001)(33716001)(6666004)(54906003)(6636002)(86362001)(9686003)(6512007)(6506007)(26005)(5660300002)(2906002)(8936002)(8676002)(6862004)(38100700002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QtwTyGJFHHZkU2/+I8WGjvG/yeZ5AI6hVbYrqsMc9fUJTmsRHvAwyGeeWtOS?=
 =?us-ascii?Q?9enBGw215dBwFVhUSlmR+enhKXcbhRzsem15yNldIFq3Ex08lHHQixyn9sx1?=
 =?us-ascii?Q?fsYVEmJjRdGw9aHEqrfz4+64GAxn6Sb0pP9UkePZ8PD6zYWN4AZX8vKaY/w8?=
 =?us-ascii?Q?Pz3xXPUBUTBGnby2/EweYBlasj6stD2k4R6B1IT/wmBC9ECR7AO+WNDTUR9d?=
 =?us-ascii?Q?+Y1AaIUeAcCap34G8Kgfsme+D0Ve7InhGZDdpPmgvsvn3cGXsQ1FYGusESvd?=
 =?us-ascii?Q?wY39MrQ6n1gdM8t1FhXXUe6rBrv0ZL9xLtETRgpjCi6SBr81njbYZ5jbvNvn?=
 =?us-ascii?Q?3UiqBREFx+wCjXS4dWWfIEpssAGdpp1ntnq9fnfobm/+QGa+8g4aU/aD2nVZ?=
 =?us-ascii?Q?8yHMdDMJxZTx49iIfoQE+YNciudUmI+IGm+NOhNNwIkk2PtKQiNp9J0VjT4i?=
 =?us-ascii?Q?lPGx1rdPquF/W6iunh2b9MvIJx35Eho6mwPWhqz4bpH37b4xrG6iA+kgiZw+?=
 =?us-ascii?Q?k4WikC4pcNHCDcmxFEMhVPuUBZuo1KM5aF7kSBkas0zCVVkuIVs3aD9CCK+p?=
 =?us-ascii?Q?LGu8tc3eVKoNIx3Y7GTY6adB9q3Q7/yT+e36PS9jn4kO0UxPL0H2InHwm4Md?=
 =?us-ascii?Q?O+ThYnuL1ZmjepOdijLikS/iYHX6+ZQ7L6/qHRjKFTdOs85Fxp0P6eqcEAGL?=
 =?us-ascii?Q?JD1o4OUQltRHSlxJdfheYgcIHgkg+WwtA1sIdsDzbRGvLynS6YhPEjIJbKrB?=
 =?us-ascii?Q?LFLUI8RYyk1B5CemLqshtQQWjAzTwgrwwP6I+UxGWR0wlnjxzCYAF6DxRaUZ?=
 =?us-ascii?Q?H3t/vmcLyjkHj0mh8iaRF5woJOJlNTPjTGOMSq8m6Vtz7XTk9RhL1/QHl+3o?=
 =?us-ascii?Q?qpLEQG0WeJSnotdRjgX3FMZzFLnA1n8ZU1XXL0Bc5SHzpGOG13OEFk5OfjsL?=
 =?us-ascii?Q?TDV6b3E4iWvuwQZU6Sx1D7mMK7iP5zJZ3God+3Ueyiqmqsr+/Ynb+ggDqeb0?=
 =?us-ascii?Q?8Vtebn4b9Knh8Wtat4c3INKFE4IfDXfrt0evVo3ONzcxf30tu+PB8IsD35yP?=
 =?us-ascii?Q?yuTFCCF2rStHecgPllLE113z54gGF7drilUKTUZfW2JkhR7AhclPb56F0RRK?=
 =?us-ascii?Q?3KC2RDkIwBZCmGNwF3qzrw/lYhrvTf2KJMgVROIRB2NpJqNfG8wZhkGD9EzI?=
 =?us-ascii?Q?fMhXZOjNj1NeUY5+fqgeDifdmxqiaLiEAL/lN9/LgFmFHavCFYqXZPOcSLuZ?=
 =?us-ascii?Q?BO4f3P/q87hrouJtlKcJVgof8GixSkbzpl52s80KvtSZ2jSuienhdi8loesE?=
 =?us-ascii?Q?t3SXDMzUn1pv20Mz0oBaNVVJ+B0dvuLNOp+nwluDSfEzUfMvLVYofnI8dOFx?=
 =?us-ascii?Q?y1uQl6q4BpGs1tFF1npgMbCznsYFSe62Go2sWnO83wSda9oabtbOvRTBHj/W?=
 =?us-ascii?Q?5TPcfy45VvZDhUgSHn4OyKUpUIY5a6v745SCdxobvTYNu8nCDDG8WjWz5PYk?=
 =?us-ascii?Q?Smwgso+/DE4HqECVjEs8GFJT3LNGhd1sQaVPrgsPCFdWXI4LtPMIQVpOeNH+?=
 =?us-ascii?Q?BKQxH4eKvfNL6b5XeTi3VCiIbn1Mq384ek3wlgG/A8je3tRwHOK2DFUgaJ1/?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efd08ff9-113e-4220-c1ab-08db4341f265
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2023 14:57:52.4512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EC9RaYbGePCA5DyV0CIoD/7bLj7qxjQ/NCGNGQ5m/twDMIyi/0N+Hf30rct5ssd0vGWPo+WR0Uu4H82a7ESi+1AVpdYsweCHIxb5d+HsEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 05/17] drm/xe: Rename instruction field to
 avoid confusion
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 04:41:41PM -0700, Matt Roper wrote:
>On Fri, Apr 21, 2023 at 03:32:46PM -0700, Lucas De Marchi wrote:
>> There was both BLT_DEPTH_32 and XY_FAST_COLOR_BLT_DEPTH_32 - also add
>> the prefix to the first to make it clear this is about the FAST_**COPY**
>> operation. While at it, remove the GEN9_ prefix.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Looks like i915 (correctly) uses the same definition for a bunch of
>different instructions (XY_SRC_COPY_BLT, XY_COLOR_BLT, XY_FAST_COPY_BLT,
>etc.).  But Xe only uses it for XY_FAST_COPY_BLT, so this rename matches
>the usage.
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>
>I do wonder if we should think about changing how we emit GPU
>instructions at some point.  Even when we get the bit shifting correct,
>there's still potential mistakes if you OR the definitions into the
>wrong dword (which has happened at least a few times in i915 history).
>Maybe we could do something like create a C structure per instruction
>(e.g., "struct xy_fast_copy_blt") and fill in its fields to build up
>these batchbuffers.


I agree. When I'm updating these parts I always thing I'm doing the job
of a compiler or something.  It's very error prone.

thanks
Lucas De Marchi
