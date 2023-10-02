Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397DDE74914
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 19:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99E710E080;
	Mon,  2 Oct 2023 19:23:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F90F10E080
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 19:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696274601; x=1727810601;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=NdGtr3LvcDeTAwlkli5It1+K4I753lVaQV6SBR7v4HA=;
 b=giYiqOeHOGNX8CIdM4RZNeK379FrhQrLShthHSq8nznunaCA2jv1xNcm
 YSq6GbgXNo9oTavPXtQQ8bpeDCHSez/Qv6OEQr7SnT/3oFdC0cGJ85bBr
 0dKDRoQPMEUmalNK2kErBKC590jGkV1fjlpY1A0uZxVePfUym5snC/m5K
 nf+2nNysePiTS2slBnoue+iWXfcQiCbzZjKqZlGNOCVNXxbBReE3jmVKS
 buw0gS/LmiOxeNbsxZQ4cPtBpSZIsYUtxL/QYM3gH5luIA7eUtvEKh/Zv
 MmH8nZYwdTZJOTQjRDG8z7/uQrdlKVW92kzgCfye3wUNk3Ylxxl1YySuR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="362082369"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="362082369"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 11:55:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816371057"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="816371057"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 11:55:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 11:55:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 11:55:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 11:55:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 11:55:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANlxR/ZM0NdU2zuJU7wT1XrOazgWt9ZNrxNApzMk0YYAJT1qo+WSVX+P9mwnbyVqk7VB5kg/Y8Xiyr//rAeDwHEuXvfTqgw46Qw/CLDN3WNwojwYjWc5MHxxkSkzqvzfcNFo6Kfy/8PMg/MZSKaEzvHZQxgN/rxKnOJ3+2HlwDRoQi4HHPLaSeBwXxi1LkJi3bt/NOxTOgtKZhR1I4ShPpUv6RAllE+PLSQA2RhzLSSkjAHJoQY2cNWVsmSIXvZhRY9mTKDl+CGXechWwQ6vvnUJRzvkIftS437vVokZvWqyxNLhWtc6FYy3owlrw5YJvOSRWqco0IKiQ+1jrtJs1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv+1dAnD2zwEcjfkj6pjV7xsj8O6BNiZnrI91umTNj0=;
 b=I7yMQWCKd6HPpfM3OFEtT2IlXuXWhrDSx0u01JqQ91f0IeNlmizLsAWQErk9i/P6B0/6C8QZ4ofA/BEEcGz9tx+vOhbIgzeeSia8FbvaiV0VJLOybzu8BPpFBVjrymUAabJi8PHy26DREbcby+aKVZhf9Rovp+KR8XgY+oUFXWxzMsVyLNDD/EhikiAH5o/zdKsa8RvFshh5e+XFCAg25jBuf5ylhWMJGULsHCMavs7VnVGHcACYzF8n67SD7y/FLZTSOYQrXT7WQH8c4m/0VOmIHFol5GbCIty015S2gTsBmN+5PSoVpW6GnJfTWlsSVlfxsHpj7NtDPkVbvt90dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5104.namprd11.prod.outlook.com (2603:10b6:a03:2db::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 2 Oct
 2023 18:55:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.030; Mon, 2 Oct 2023
 18:55:43 +0000
Date: Mon, 2 Oct 2023 13:55:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <iactwg3a7ddmqwmr5uqh2hgf4lgsvi5yz6fvcar2gw54e2uku6@vnxvbdbbv7iw>
References: <20230929213640.3189912-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230929213640.3189912-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0162.namprd05.prod.outlook.com
 (2603:10b6:a03:339::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df3dd0a-86f1-411e-69eb-08dbc37922a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RYdUHsTw0+IA1QlGvRxhLXWbtmHp3jgVpYaGBFfoBeqqS0kQQckhkvL1U9beR/Ywz87vSkJk8HmAXxCLk8Do7BAEGt5IxxlVJxY1ePSFtWwnFyjS1u+t3yFHR1nvV3VGph/lPDn4h3DEgGvPyUgZiypZNlL5ged+Y+ORlPUv26d1K7O0+daPlNnsm23oU5tzc2yUetRW6JZo4Xkc+hD1LNAbDe3vt/oPtAHFT1w2FGvH3dnx3BD1qevoNadpl8A9CtBKI+tb8wKPWGa+OEQFdKgCKqKbumg+ZxW37Hmn2htI3ooy9VXgOojATLrFQpcS5HE1wsZ06OJF7coIzPjjCFLVNU2RIaYn6ooKPsDDjziCEdr6t3+j07cTEnfXE9ZOnAYJLIGNRYlhOgcmh5eiBt1DD0RFnZktMWUFYYRYmmyAQ54I5zVpqvvWV06URhkCxGomg68U5obJfAYFjo+Zr0ZeRCkH786aAEnTc5Qv6a10RrHNRM3oyTPi+qkeSC7EhQDvLXI66k7bCpsAnrFVcUm27OJ7/15O7drvb2zpEJCIGRZpmhgLgEkK/rsxydSS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(83380400001)(478600001)(66946007)(8936002)(6512007)(6506007)(82960400001)(38100700002)(316002)(66476007)(26005)(66556008)(8676002)(33716001)(2906002)(9686003)(6666004)(6916009)(5660300002)(41300700001)(86362001)(6486002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZCuCUo0tHKimm/DJCGaFXf6yWiwdNcbihJO6RVwSe4ioC0NopR3u2wRs6ooN?=
 =?us-ascii?Q?e4qIvyKgAnMx+kXLVEvnkCa1lHd7xlZYOhebgEJIH/oKpw3Cooa+/V1rNeeu?=
 =?us-ascii?Q?S4q+Y+v9Sioh6wrXxZK159YYJECvFi+728cmGLYMtx8kMVl2gx9Ey8LV+ROO?=
 =?us-ascii?Q?clCS5oZO9sj392x76bGe44flm/yAF1/Ts2Y8/Z+9jBal/iRsBnreEgPJ9N7t?=
 =?us-ascii?Q?iIZ1HYXOdUOLOXsRT+kyG9UsGQa32d6KfIDr+gacVbphg2TGqPE7D6YQxe/N?=
 =?us-ascii?Q?ygE51og/L/BtXf5jXdBWd5EyA40+13dcaDyttN1ey4vtLNaOPinjN3LdDA1k?=
 =?us-ascii?Q?YNMNY5w18RZUPKmkhihaoH6yRfiQ/MdtIQvJXHQyOd13wttL6Ld/eYqnI3q5?=
 =?us-ascii?Q?Zst5LtWSoRAOwVULLj8yTSXBJajN/5GbqB5F4ztyHBgCFWVzdEkZdDzPtBC3?=
 =?us-ascii?Q?GzEAp13RJ35E8VmRclI/C1iAzViu9tYBCkGE/HoPIbnZHa9f94Rbny+Si2s4?=
 =?us-ascii?Q?pn45+7vwh4JhMDQtwXefNIJBQIDZYFe8y8kujIegVnFyHLj1oi8Jlbk//prr?=
 =?us-ascii?Q?9Ki8QMOx4/fiCp6lMt0FaFocdCz4s6y30foGh6dX70eKp8vWcolRF08+5VyL?=
 =?us-ascii?Q?UXHOhYlkf+ANzS2HT6o/TGSFhVFShIjYB4WpvvY6xxjDrujnv187ClwhlVsi?=
 =?us-ascii?Q?xY5RrFPb03/XWv8Y4ETLHpLAG2xBqzoL5n+tCW2C63ItuaLiuqG6vCRnyoyK?=
 =?us-ascii?Q?QWlfrH2NlMFNTkiF/SWmVERhdSuFWhNdKuTUG69W1sEw2GV4FkbNa4mj79hB?=
 =?us-ascii?Q?dsosqno2pxIcRXivazh3iQjyDIQqwupaMC9ZY872IQQZ8YSbmzxC6pcDfw7r?=
 =?us-ascii?Q?BSk+UgsfR35toJyustI5J7hoQTzex2CYw49Bsu5RYfovMEHazMSizPD3TW6t?=
 =?us-ascii?Q?LanQeIdnjTDd7QY2/V+lPER8yJoptf6X+WB7wlj4qtsSlGXjQfUOaNO9WDaU?=
 =?us-ascii?Q?n6tYtpAVNEIKkfcYM0gNaJdRAqGFgwtPQUu95Gh/6zURelivywwkeuopewU1?=
 =?us-ascii?Q?9PV79VUn8dzUkAbjORbj1h6XPvKjEs/pClfDhhebuef7+8SOnElZaq2L3VZE?=
 =?us-ascii?Q?MX6pDTNNBuKCTHKrljKhmrQ2iG47TA/cUF+DQ7SiNUhm3ZSWZ9otnHb7PGsR?=
 =?us-ascii?Q?gW2jC6kXqhHRg0AO1IQdjrSMV9ESfVvmOprMfi3a1Jqszdr2HaBR6tG+cE2X?=
 =?us-ascii?Q?8zVZECVEQppb04jDmrtx4l+qNDdEp4s5ocV2Rg7rXfRREdh+yqFBJ+i/VawF?=
 =?us-ascii?Q?fNXeraSfd56VNtAHJMZSjyO7HiRatDr0jDhZZAv6OrwqRBS230Mxmo24TacZ?=
 =?us-ascii?Q?K5yhtFSuE3md9au/c7e1KJ8iZ/IDnrbaezjhKN9mdy570rXowjzt1JCOQK6D?=
 =?us-ascii?Q?uTLXt6aRZZz4LULUKLlVyJWJLPyLXLgpfrKR4n9Zw0C8VuFcvnVE/bsUgvHr?=
 =?us-ascii?Q?R+Sl+/y0bV+8ypxBiS5Av/m/cxlvxillr83SNOFVTvih01oErs/tT9OMRunG?=
 =?us-ascii?Q?5Af/18OxwRU+Uf9AkO5wD+08yCERYQdzRq8VESaDm1Riqlrr1T5rnNPtwXIG?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df3dd0a-86f1-411e-69eb-08dbc37922a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 18:55:24.4347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fPO2IRqezyYQVdLLnZ9oP89BYcXSVr/Ot8RLD7ixSgjN+OFfA4bj85Ek4236Gx2aXifQoxKPtGZvarwmSRXjIUDMwUVw0nbQpjtevSZ8JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5104
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/4] xe2: mocs and blitter commands
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

On Fri, Sep 29, 2023 at 02:36:36PM -0700, Lucas De Marchi wrote:
>Adapt the blitter commands that gained support for specifying the
>dst/src mocs in xe2.
>
>v2: Handle review comments with small rewords and changes

patch series applied. Thanks for the reviews.

Lucas De Marchi

>
>Haridhar Kalvala (4):
>  drm/xe: Adjust mocs field mask definitions
>  drm/xe: Rename MEM_SET instruction
>  drm/xe/xe2: Set tile y type in XY_FAST_COPY_BLT to Tile4
>  drm/xe/xe2: Update MOCS fields in blitter instructions
>
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h | 16 +++++---
> drivers/gpu/drm/xe/xe_migrate.c           | 47 ++++++++++++++++-------
> drivers/gpu/drm/xe/xe_mocs.h              | 12 ------
> 3 files changed, 45 insertions(+), 30 deletions(-)
>
>-- 
>2.40.1
>
