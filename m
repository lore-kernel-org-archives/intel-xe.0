Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527B8C05027
	for <intel-xe@archiver.kernel.org>; Fri, 17 Feb 2023 16:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3B810E2D4;
	Fri, 17 Feb 2023 16:33:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A9A10E2D4
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Feb 2023 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676651603; x=1708187603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dofVxVqvWkF7wbCkftLL1IghH4nKqw5lchku7+jxc9E=;
 b=VxS76K8rEsJKqi+rrd918PO/DjiHmNVI9os/bawXxmOur4BiLRPibLy6
 Y69/Hc7n7ILwGOyijTdXzqLVgPJdrz7Xmi+rAJFzQIszHy1GIlvY08aW7
 Uc3WTSWWwk1xSi3hUULyAU+7gUAsEgOyUGv9hKB2SvY8qly1BlCC+er2k
 Vs8djO7d0Ls9hJHuK17SgfGcZEYpjD5z+xj00eerdr2NSRKLpgHT1JuLc
 ixFp5R+0O1++aKWSHAoYB5H+O8X1Ij+gaKVMyVndnpqZhQ7tulAmZe3Ag
 nHOwRhgWhJufhu1S+/KshdoxloWDZc1vWRI4NNQPOcQgteh0rxiDAwlbY w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332030157"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="332030157"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2023 08:33:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="759420513"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; d="scan'208";a="759420513"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2023 08:33:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 17 Feb 2023 08:33:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 17 Feb 2023 08:33:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 17 Feb 2023 08:33:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hz6fd9Wm+H3OqrUt3XA6yQ6CBJpaGoVoUJqvqm9IWG93nDjyHo4gnMl4SNXco94YazIKsG2FlwOyhA6kZZxIL/drxKDcR0ps4xBtcJztXDE0VNLsqUkLVvXVfh+M8zLhyNLl9PJl+IVVr19A0vyRjqVlvOGO5hCrhU9ip6QppLEI4/JKhs6K/DkVsVvHjsz4sze3kLFkal4o4LHLIutz7S9o2Vbc3OaOxZX180MEdkhNjsN3M7fehjjGO3PRMQeVH625gyYViISLB0DHWh5eEDtosWkdoS9H90pCvZFgiqWrdzWCgEOwYt3BBRsZz5aMjyJ7ktSZTb+OwkKsVA0ZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFWYaHAV0E/IBDD2MHySsTeKgBMgv4vtahU8Sefl43Y=;
 b=goGQxbKquuUWX9kNZ6VPbzdKNwo1MQlpaCRqbWJP9NOUyTVQt2kka6hmIaJt2Wz3T5IhwbkfrQJtY2MB3PuwUEMRkwS7PP4gYeTXk3xQu5uqFLT6dw4Nt/S5BpHts3FTjBHKu1Uz9IMeOt1qnMnrzF4v7eblSfRBy8MpBMXJe+vlvGYMgzGqrbOBCV0tZUrQHahnR3l7ujsEabLyeXr0jiIcMawAZMyAORexjSFd80mu8mFBw4siMjZ27HLcRCaXtOj/VfiZMW+oozTyew3kCL44czB/WmKUmoNDmpiCav1JfmIcoAZbbT//zj+4LJIoPGJCG2GnQ+o30N6GJ0JRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB7536.namprd11.prod.outlook.com (2603:10b6:806:320::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Fri, 17 Feb
 2023 16:33:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%5]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 16:33:17 +0000
Date: Fri, 17 Feb 2023 08:33:13 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230217163313.jj2rbleqgvglalzb@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230217005226.106499-1-lucas.demarchi@intel.com>
 <20230217005226.106499-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230217005226.106499-12-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: a90f2db9-c824-47b1-70e8-08db1104ac45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OZCigk/oCNHthPo/2AN6SnGGMtwNfNjSue8jRqfC1t05NI9xqWZFqtSxP8UXzcvw+tN7DImLu4BdKSNgGhYntZf/Jmm+pGM6v+GFjvUN2hnWuZzXhrZDq2g3U3SpvrnhqoGmBlVptDfcxCeQdt5sU7yQMfuQRTlvb4V5SHw0dqvfR1uWuouLgwdrSLOYY1T/cQdJ46ApAgRHLbBDAuArIT23ydPpKjtq0DzYot7WeeRzt4cMOSv5724lY+XPncvmQ8mO4OKdFrymeK9e3t4kzytCAGI2hxTdN15cGzM+tuMM2e5Bphd/SLebEA7Rsed2WW/7l2lBehBdXCi9tNUrsMyms6uBEE1YUvaI4WGFxPCc9ew8Om96j4jsqLsfQSgWs1aQXiIpnDB/09p4uuixsUI1ZELclTKz+N7D3Ws/qamJFUZZz0VQVnH0/4GaIR4aApILX6/rigz7z02J+tdeyeFZ98S/lOnTd65HjSiPU6/817r0CtKqphUrOXYMPKhT/EydCOSrC2S2CTRo1urStknyEfjrsPVUQSFLvQe/SBzi7YIpPBRbqjxXbVQHP3gn+NGev1cR9GEdN7cric178mEyV6mfptnim5Uq8HrZc7sakX+2HA73lGAjYgyfsCPfDXPqUYRyiNzcnEZ+Sx+7AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199018)(36756003)(83380400001)(4326008)(38100700002)(316002)(1076003)(66946007)(8676002)(2906002)(6916009)(478600001)(66556008)(41300700001)(82960400001)(8936002)(66476007)(5660300002)(54906003)(4744005)(186003)(26005)(9686003)(6506007)(6512007)(107886003)(6666004)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NsGRw6ARRt3DqG+YfNtvdHoL3XdnYwBayM+GqpYYL17Ip6gvlEU38y08MRRm?=
 =?us-ascii?Q?QDfrwcJw9vQugyU6T0Y2w0T3IESkcBx3E70r1CU5+EqOFLjuRxtfetYMir4d?=
 =?us-ascii?Q?3d5aHaNAfROXPaAYwgGGY1IbTQSHEIvveyh+0ArPpOB0srDKA+GBD33hENA7?=
 =?us-ascii?Q?nF5KNBQW9BiN0R0Lqodj79Xj2bwCWlq0ucFOkiIkE4ORA/RPqRJE+KoCgFD8?=
 =?us-ascii?Q?s623nVXFcZr1WUIbl/SrFaYo+U8QCJkytqVyxZHrJHp/DymrKQPsBGgZz28L?=
 =?us-ascii?Q?0gcmnZ48tEZ6k16Gx50l5pQDMnSuahDh+Y2G9crm2FmeffG/+48hpyFqfqKw?=
 =?us-ascii?Q?yQO460LgE+0wrGo9jmDwCozpA93nQZdFkhIuEbmHENb0+XdV2FlsX5hHJXeB?=
 =?us-ascii?Q?WAwSO33eXFSiyBCkWyzdecR8wlsJTeFCPYUv6z/XCogr7uboHTOl5NaLmEHC?=
 =?us-ascii?Q?n2GyysekqA+Ixlb+3ya8jaw4cseB5XqnIw2xhvZSj9ViSFemxT3N7c7+FTc+?=
 =?us-ascii?Q?OC+wRR+AgqQpRlzy3fR4qHhcea4+MRnbJ2vKckiLNPphfzW5cf0ukG0WMCZF?=
 =?us-ascii?Q?wlYEQRBr7pCeF1Nonrdg+cZrpfbAAcLZuKCPompMJxJB/Sx4o83kSMSsteyp?=
 =?us-ascii?Q?xQz/O9hZlgsm4bw39FsIk6+WHx7N3knollik/pC1Y6R7cUFd8n3/5uby5gv0?=
 =?us-ascii?Q?AJdGRgWNcxrbDf+MvKjpD0t+PcB3f9yUb9SRNW58KJx0YHS71TfAhWmf568/?=
 =?us-ascii?Q?7In6dGx9fg3G8L5GgjHUT5YvOsZwOZ7fvbuXyJWlCwthkBAlvnnXEK7W8NLo?=
 =?us-ascii?Q?+qnqFxL3VFqbP5ZphWyi6bljSsxgdo8/pPnp/cwv7ChlJzHSIvZGmRaxaLX8?=
 =?us-ascii?Q?2xaVeE9GlwReRJXIx6HKOJ8GvlbaC+5hSaolyKxwzqHi9IJhdBc7FOuyKg7/?=
 =?us-ascii?Q?HGQC4FVw2JVcKWtOw6VcQx7ZHPxFnKDBhsohDsZwrVFzuUH/h8hjwJzvGVK7?=
 =?us-ascii?Q?VqgJ7JrR91Knd4B1MpoFtnKYfefqyNFO4qME3GieTYVbbJN1mtbUzfePg27u?=
 =?us-ascii?Q?fAhNPNHtoYK+7MNxWGBZVKTVj2FKK7pwKGfxvlel2Rasg2NbH0QX5bryG6dN?=
 =?us-ascii?Q?3ccQMVURKTa8Yl8R91DXQsKUVgaTOXntDIlDoLGoCyE2tWgfvKk3jHtgPQ6J?=
 =?us-ascii?Q?KV8tSEJxCiXD05oj+kP/rnge7fjtnV6WQ5YIkagoUAaAQMHdYnO4cVd6G017?=
 =?us-ascii?Q?JyHVriazZs/MA02teVrTpraCzY6vKwBmkshRxFuKRkUumoXQ7r5XcPsFKHDd?=
 =?us-ascii?Q?MwF8BVzVVsIf3U6051QdBOE+9bqP3n/VAtltCMM/PHmrRW1x6xqb7tjvHgOS?=
 =?us-ascii?Q?hfTqlFv6tMPSoRwvCZHZ7jjy4/eJ56dXCLzH9Y+EPaiCclfF16PJkSCDYWP7?=
 =?us-ascii?Q?kK3OMCazd+p25rtSf1PAB8/fUgOeQLm/qtXgibRrai3IBXbCsjKzDno6bRFD?=
 =?us-ascii?Q?ic6mY1pJZieQlJ0tbOUe802LEyogVEeI6khAqM4ELmgBYvjzGW78MpZDiw8y?=
 =?us-ascii?Q?bfj1kUzuqaM93MWtXnAcgzXkMolTvCDI/OMyzxBHVw/3p3OTw5xRszlwQdvI?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a90f2db9-c824-47b1-70e8-08db1104ac45
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 16:33:17.3173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2vMX3G1fIUDI5FgkeFMuSl1kUKRThfmcAqzs9X7MXZomFxtBuGNq3J0qplUKkwRBxIrAZsQ+k2ITyUCx+wYMIYoIGmwpFAEh9iRhiLw4Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7536
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 11/11] drm/xe: Use relative includes for
 i915_reg_defs.h
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
Cc: Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 04:52:26PM -0800, Lucas De Marchi wrote:
>With the goal of eliminating i915 includes from xe outside of the
>display area, it's better to use relative includes for the only shared
>header, i915_reg_defs.h.  With this the build system can be changed to
>stop adding i915 as an include dir.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

+Rodrigo

I know I've previously suggested changing the other way around and avoid
the relative include. However with this cleanup we are very close to
remove the -I for i915. So I think we can first remove the -I and then
decide what to do with the single include that we still want.

Lucas De Marchi
