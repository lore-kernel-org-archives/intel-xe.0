Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9654EE4996
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 15:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A9710E387;
	Tue, 22 Aug 2023 15:21:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885E710E387
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 15:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692717691; x=1724253691;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DNeZkZXCeOpAxoTSbTW0DecBPrX9fbnXDwbPtMJiQbU=;
 b=HohRgYxA0wz0vEAsHKKl6l03iCFDwCZQGolBCdN7mEgqftI5Kb9MI8ZK
 4BTZ0r/v6Su+NJ0q88ZWgIxUwAYw7KtnkyoEejCjf/dUkfaSHb509YWtL
 3wkfzuSrOXVIx6orjlpaDciPVrHF5K2fXSXLvFYfsReb5fDajF/cyePBJ
 I9nPPBqC/Oh/l1s9AbCQ4cPFC4m1+wNhSSeRiWe3/2+MVL8Gf44P3dCJh
 JG1x0X3PM5BrB/+o/kRoxGR+ZWzgvRmpzRnBZog2a/knWgmgR2OKo42S8
 EjfzCPCeiBSL18d/b9OysblR4MnumLYitcbmC7NM9hPE0anp+zzpQqToK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364083782"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="364083782"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 08:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="910108275"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="910108275"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 22 Aug 2023 08:11:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 08:11:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 08:11:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 08:11:36 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 08:11:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UC8+D0ONKy/UBZjCEJaj+MDN6uX5HEanAqRRMfhLn1gOwUaelbNQSvI/iJeJAZDhWNXBoJvnsPuaYNAnH1i1vJZziMVIBbntS1y5gPMc5UzlSvRUH9ucUcF4FBXQdyL2xvQFTG8/oM8m9qPGBC51wdpp7A7eWE4jZapBSHD9Xt4ZzREWJtkaxDUtyIh5XpVQs8R8EAPa7QnUmznIYWvMDhzDGj7TRUAS+GfEQNaWFwpiZv9eKH0ctroEsLaXDdaMFTv709K02mLg+Xy3AY2bNXeItTOjQUPTWQZ5EhOv/tMOj9YgoaTZ+xm3atzpTgQFrTVybCjiBLVFFg+/NkzAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abQ2g7weJcO5Qhe+9GvFtfixiWGr+9l91Cm3Qeg+H6E=;
 b=heh/tWRU5X8+rHIv70xPrhSkWGX4Mqp4PnVXO1P+/T+GXr+XDQerPdTkG5K8NIn6DhGb+cQDjyw+8eJBH1QidGyWvoPj0aTMTp0f5FvUOCOQvX1vKakxnBckJKRrIw/xgWVAQ4vfZQ64lddTYY7lD6NkQF1c72AhyDmREv6CMtW2BfNkH6AvkFoZ25I8bgPRI56kmHthpXeyslE8j09GmFIxpIdaXAE/3c9kjSIldSjFugCoJSfsqTHcNdWZz/L74wMQ5B+6Wf+FzHZMUTOAZHSNvxselBlBMJF5/rKuZZTbq7fV3ifO/yz2FHQJYiYalQzDfs8IGda6oUaVgDPRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 15:11:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:11:34 +0000
Date: Tue, 22 Aug 2023 08:11:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <7aq5ozooxjqlyp72kc4z27d65w5wxb7lbaknexh5unmujuwdy5@3afkxibnsq3y>
References: <20230821234322.758689-3-matthew.d.roper@intel.com>
 <20230821234322.758689-4-matthew.d.roper@intel.com>
 <d6uoulsbl5l7uibznwqy6jkrcp2yctoryre67xn5pa4znolrb6@skw5zmgvydtm>
 <fgxtgocqv5zi62fhwmnck52xi2ytmthy6i6ssmvefaovycvuxa@7qe6igl4mbbe>
 <efe65c1d556539d94fee3775c34726f93f03d9d1.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <efe65c1d556539d94fee3775c34726f93f03d9d1.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0248.namprd04.prod.outlook.com
 (2603:10b6:303:88::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b328b4-fdea-4770-0446-08dba32212bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1U3TWNP7Pu0tski/HtG+NIOx5YbkfTirlkH01ksXUOt3hKqKADQrWUOSdtvoUG+oxCaZTbCkY5lyPpSu0gtTp9ecsW+CSEEWXfB9PVD1bvHDVIPKEw6VWSjHdVWB2Kyp/d6dsRPVQh5Fs6hCdX2i4hQ/qryAj7JsTirbzWGqxmqxTKXE6MEALcrLiDURUP8FQj8nsgjR2zMt7emPHoSdrzNefNuMRxoVPhYOIfcbW6/ZXSyTvRmu0h7iXzhuvT37D6CJl7x61YE3ibMf2fgETysPX9HagPWJGTEmksbmKBCy0cvt9AGboWuOHeeOqevuKQeIU86h5dlKz3VVeClg5laa+3+9hbeiPs/Yp0vZF0Cn9uKvyeVDtzlQXRQW5QLzH3BB8mL83RVSsgBrJe8GF8NpfPPMzj92E++iN8868RIKOk0LqejbbtdtgGGprGK355ntLTMHgCDofJfiLDK+5vM08mgjF5MtCX+QOp2WkVErRqFYhgrbSEYXFUwSM2xHlB2t15LBnV+wAEQFzddlDEbijVv8z+Khr9unxRF8Y3p/Og4J/rVyHWzpmTjp+mQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(66476007)(66556008)(6512007)(6636002)(316002)(66946007)(9686003)(82960400001)(8676002)(8936002)(6862004)(4326008)(33716001)(41300700001)(478600001)(6666004)(38100700002)(6486002)(6506007)(83380400001)(2906002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?g7fAGUAcghnUm+sSA8VSOfOdrOqybXcqHfkoDiOy9qR2/vpYuhsYfHDPV2?=
 =?iso-8859-1?Q?+WEblmuDT1l9e+da0kL5EE3ICj8Xr/rwQYcMF5NbFADBr8a5x8fkQgypRB?=
 =?iso-8859-1?Q?CjHTNUvnpoU9MLI787va6w2gD87zR2c3BSf3xvEK2GCaqRK7dZnoGIBoAH?=
 =?iso-8859-1?Q?bAESVwakCyHizx/bc1ZN/rlMGSeZCnxAa199dxYcRT/hdO941TqHhZPFq+?=
 =?iso-8859-1?Q?soatHRbfINMjG/r+7AnD9dbl12rhinh0ERortIkxkd6aJhza56bei33h++?=
 =?iso-8859-1?Q?6wD0LDFAc0TDNF3lOBzNS/CPcrj3B2gI8dJehHNajd8/ecLMvJv4I5nsxD?=
 =?iso-8859-1?Q?j1uR30n1fbw878NSFo5YtAWLlZsEb7kt7OapRCEiJQnFkJTE/qXDOZKrib?=
 =?iso-8859-1?Q?i4Lf+NTr2f3Obn6v1JcqifPNZrdzMNV0Fyb1PfzdrEUARZegiWkT2l+s66?=
 =?iso-8859-1?Q?XxJBOaKPNZkhQhutz3bVHpY4F7hIHWb9TA0gkLIHuyy21xh1eDBgRxC56k?=
 =?iso-8859-1?Q?6700OzHbqRQh5IVZt2Trrw787HxwMCYWvffiLe8vtL+YqaFELqZ9ytLgyw?=
 =?iso-8859-1?Q?gQkxtaCbpstYdpF21PzCN8LzqjCLxUKBda1rwIj1d/t7+D4TrrbnZLhlaZ?=
 =?iso-8859-1?Q?YlwyF7NobGcf2zqO1nj0BfaOWrgpASR7BOhu65yX3ZQkJ3SlgC+N0L2wmb?=
 =?iso-8859-1?Q?0gvZ74OB4a4hB+2dsQWc55LzEs9UBc3oxf3Mr/fnenddlFGMecauIW6F7s?=
 =?iso-8859-1?Q?M2zE+wv5tOUzFnD8YdP2yJo/QBzhPNRwLQ+kXLls3hVs5MGjZ0FmcEDRBX?=
 =?iso-8859-1?Q?I1D4H82EohT/L7FeQzahiBgs/Usl+p/U1zBOdXRkXo/z64B1M8QE3x6Qx/?=
 =?iso-8859-1?Q?xrVvmGZx8SSAjd8ZzSW77xfUynvAM2BpvL+VlftRJP+t1ccekfb9XDPQ7Z?=
 =?iso-8859-1?Q?2dksqg3Fmvjk9bQ0ogoxAOVCqtajyUS0CFvC1o/5I7KSsT4Ybp6px6XGYS?=
 =?iso-8859-1?Q?/zetH5tgZOXUSvuzVdYnZbW3pvP4hKQ8dzNrfAdly8tACMdKcDwTr81yP9?=
 =?iso-8859-1?Q?kkJvpSEVOxn38+0msvT89zrc+opDTX5o8mCN2Q4g6bE2FC0JxzQQN+bXdK?=
 =?iso-8859-1?Q?IKs3nte0c9q5xluUJHxEWclbQaPdL3nBR4k1Su3I75fioZ5PByIcYZZGqb?=
 =?iso-8859-1?Q?4ck5/SkF7fybBg6cI/0n4HQ82F+j00fQRmKtvEmYEu86z3gMfDuqfzkPi6?=
 =?iso-8859-1?Q?KcOeICq/91pKGHKmLObBpyY1gKAViwpbQGyKNTIs0eXcLMkR6HgpaFzo/3?=
 =?iso-8859-1?Q?tvbxXg4DkByaCC10+HE8kjY1CeglAt/h88h4lL9PqeQu6ezbD2BmtMgglF?=
 =?iso-8859-1?Q?wFQB31M8Wc8TR8Ny7/p8RGaKGLPTj7BpaieujTmhBWGBh2xrw43ZM08lcQ?=
 =?iso-8859-1?Q?S0/0b3CsLjGk491St9AXdebl4iFDcPtUG7vWDvyy0IiR9aGNPdajLBU9jD?=
 =?iso-8859-1?Q?ZggtzLuEeWsdEQF4o2DD1Ed0YNgOF6usHTO4VDaHe/YOdWjsSy5dz9qfiU?=
 =?iso-8859-1?Q?krJatQdaFuPV2LXGvY4J2VrEs78T52O5e8CRcAKOJ9/92zLMdCP9VGHa/f?=
 =?iso-8859-1?Q?W3C3ALl+aJ/s1rI1b9iy+ohKNpkirqpv67HAj36ZjfHEM5pmAi0sa9iA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b328b4-fdea-4770-0446-08dba32212bb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 15:11:34.3386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WmWJPGLlAqbqsHE6aaKXxM3zlzUGu0mECjagXu0Z7Y3H1x0TdSLYrL/MW5d32s/Sszh1rsfbY9dZPDcqvKCDPemkOCsiuTuNn4GIWPIL9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Drop xe_mmio_write64()
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Aug 22, 2023 at 02:51:55PM +0000, Jose Souza wrote:
>On Tue, 2023-08-22 at 07:15 -0700, Lucas De Marchi wrote:
>> On Tue, Aug 22, 2023 at 07:12:48AM -0700, Lucas De Marchi wrote:
>> > On Mon, Aug 21, 2023 at 04:43:24PM -0700, Matt Roper wrote:
>> > > The only possible 64-bit register writes in the driver come from the
>> > > highly questionable MMIO ioctl.  That ioctl's register write support
>> > > only operates for userspace running as root and cannot be used by any
>> > > real userspace; it exists solely to support the "xe_reg" debug tool in
>> >
>> > mesa also uses it for some operations to avoid the extra latency of
>> > setting up a bb. Have we confirmed none of those accesses are 64b?
>>
>> but you are actually only removing the write side, so this is fine and
>> the rest of my comment can be ignored. Sorry for the noise.
>
>Maybe add something to the uAPI about 64bits writes not being supported? not everyone is going to read Xe KMD source code to figure it is not
>supported, with that both patches are: Reviewed-by: José Roberto de Souza <jose.souza@intel.com>

it would still return an error (-EOPNOTSUPP) due to the default case
handling, so it's not needed to read the source :), just correctly
handle errors :)

Lucas De Marchi
