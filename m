Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DAFC001B0
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 21:44:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E9F10E705;
	Fri, 11 Aug 2023 21:44:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC2010E704
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 21:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691790270; x=1723326270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yjGXK4zIS9jsPfjOYsJkaEJTzB5Fq+OOQFda0hwlSWw=;
 b=HotKqFm9aChISMOcH/dMU0t/CCB3QzqZKgEWGlvfDHDTlNLcTEeMG69U
 eXNZivnI8WaqCYXR/dkWuDSp2VrNbuqawmZU+/s6JC3GiXLBIrL9LXVKT
 jyct75/v9ZU+z98QB6Uismj2bPrdzZkAB0GHaoj+96z8B4aWw2EMCd8P4
 L0X7GCNYVBIjj8AVyZioowr6PtO22FJnD5yl+7dnclrjVhi23LRVVsBYo
 G2Qc39+FutghsQGS8tXUWpVBZKXWw137iN0c6UrkQFsaU63u7eGfdUbF7
 gVDbIrZvYLie8au5LxvUIlrzTtHBoNE/3eoGHflZRR5vkwEotFiI3r/8l A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="435663318"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; d="scan'208";a="435663318"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 14:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="876318310"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2023 14:44:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 14:44:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 14:44:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 14:44:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 11 Aug 2023 14:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DPc9tJrrOmuU0GMdvl33TwrTuR4N7MxUxyfoGXrp7NVtgVDWI1h352BS6+hrUNjxw+a4T3Xa/w6rDMB2xsjO8KvigLVYNq6h/dKbn2+jKW0uy6EhmsaCff0ABbUmwjHxD5Mga8LbvBez0aphbzrdaBxa09DBLHZhLTzZjTWqQoeojZCPOq6rTPRQBtueUpKxRKb/rQ1rLu37o7IN2/ivBbaqA+zK6ZciePt26cLrP1qk1w++HiUkIsgLM7v7Efn6gtz4fe/ddOlhBy83b0v4Dy593LMIRjL5ljaKJVdLSdlf6B9p+riE6wHFTgrAmm3e2XwNfbiY6K/DxSBIV5AVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1DagMupf6FxsFBwL8K5wR8geXNvFyjNpf+5jQtiwvY=;
 b=H5zSH/Whcw937z9ZQ4vGYRSr6xwO2vJtEub80kRLzmvsuY5MmwyeF0T9V74AKAxosiZ2NMzaQZEn2zxbkeM/rcu1ntWERpvxZdYt+Wxsc+2+bTYaZuM8h5FMKQUpNZB4QHIpw+DytzA0AzbnoDBko4RwInNrmMvPMkeCvnXaUnha/cicuEYjUEfscNMa3ojVrj+rGDtfX2A3OmwrfFQ0vF6aeWZWyINUfGPTVQD2DZbkL04DT8m4Efvyx7y1tqkKsKf2r3ppVzTTJXktqbxXIk+Sgb8Gw/yoXYZth6dJ1zPsGUXpqlggVdD/qoYS049LKe3sJrKcMYNJfWfm01Ua0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7505.namprd11.prod.outlook.com (2603:10b6:8:153::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.19; Fri, 11 Aug
 2023 21:44:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 21:44:23 +0000
Date: Fri, 11 Aug 2023 14:44:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <jc2zlwchuasa2maydbm6rulonda4glv4u2zwwppxxfraipw7xk@vl2jtqlgy2be>
References: <20230811160618.477297-1-lucas.demarchi@intel.com>
 <20230811160618.477297-12-lucas.demarchi@intel.com>
 <20230811162106.GF3375865@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230811162106.GF3375865@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:303:6a::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: a783d008-61c8-4440-037d-08db9ab420a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s6DkM2NJYdDtfjaKRT8Zdd6unx2DTZZGWz6cow5LywxzePlzZh+fmfTWiWHSF9Uoj7L0hPR19+hV+b+gxXxLwhx03Swhl6Oklk5MlXdxZbtWUbJfvrZngJRtBWOlcbxD7WNBsRNhRnCNN4nKvVfhT1DW2EZVZ2rdeKLUaUgUlJ6d6Ztqi8KzSQdjOFB0LYU87CFT0d1FVLeL0T8CouMAirAa6DxBdGqGusCa4Jl72YfrEvAadiQzXjbyiIem2usC5uE1kHZ9yvbkQPdwdIEaAiIfNC7vgJwgLYKTqhMew7tJdfSMiPn8GbEd5O7LF4v2o0XoagaQDO0umvRQFa8bAdPXeKYG5N/rSy+R1mX8QVb0lZCvKYreZTaodbWXCA5thI5PnNZxTrxdPtsEE1TEvakWbKJVi6LNp/Wm5QGC0KFQgL8sLPbOAdTzNB5nujqT+d1wlaHOSKbwJv5CFqXCXVV5TC/EhA8Ngqe5TFCr66b/q0svnKxxbNS42xhOXLoN9si/WlM72Yo4AnzzZosIKGX1ANbYM7/BybY7/sQN9WUiAdbGfmTcWEFbSl68ehZY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(346002)(136003)(39860400002)(376002)(396003)(186006)(1800799006)(451199021)(316002)(9686003)(6512007)(86362001)(82960400001)(38100700002)(26005)(83380400001)(478600001)(6486002)(8936002)(6636002)(107886003)(41300700001)(4326008)(6862004)(6506007)(8676002)(33716001)(66476007)(5660300002)(66556008)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wTpuhkXP1nAoUJgbxgzG4Sa2akL3c5glqXpeGssJ4NClD1YuaqbSplwAjAeq?=
 =?us-ascii?Q?b47tcNOhHd6WqGV5crQLh0rRc1TQcFFA2OjbQme3Gd/iJ3sbiKIOJWNZMXOx?=
 =?us-ascii?Q?x7Yv2kaYFYAErymhvZvJhyA2EQ9NnbW4rzDJdXat9dCwKilZBVrbUu9/fDe2?=
 =?us-ascii?Q?r7Rn/RLEeTwx06GZe/c4w5ivU225z3nQ7CnsIDn+rQkAaR0eFrkZeiyar2if?=
 =?us-ascii?Q?9pJi4cfqONUKdPMNdA7imbiwg3AsS/vsD75eULx8wtPGq9W5gaATm1MbKLgn?=
 =?us-ascii?Q?shgWL5ozF5SdHXDUWHNh+XMVjmdK0XfvUlkVvisvnHr/XEQLwRJoJ0gI9Af7?=
 =?us-ascii?Q?5PoTM/f/l1IEAcT55mlnv6ncaSlU3Q86n6YRWX+BrDfaDRFKYx8pPRrJHkmv?=
 =?us-ascii?Q?nZMR4aQ6din6SJhkkjOINJpVpkbaifvbUJf8KDeqqLZUxtxjJkaxCQPJYZPI?=
 =?us-ascii?Q?C8JMGThvl+QslJECXNSp3MWx7dJxZrlAVTkcSTpJGDQBEa3l8TVVDRlIc+Ij?=
 =?us-ascii?Q?58JJ8gGkJ7Gat/4tlmzXNFF+kbbDnkiLDdy6QIu04JWPPtvKnrLCIiE1B4bm?=
 =?us-ascii?Q?TOC15u1dhFZopIE1bIRZdwIxibT6mYCl+gWexR1SELksvxafTCoF9IJUq8i2?=
 =?us-ascii?Q?n5zS0e592uZLa98ZliC6eGWVPLulTJC+2mRI9zw5V1ejOHvqjfLsMRRDkVQB?=
 =?us-ascii?Q?zZyG5mUpYIgTah7qkgt9ZO9lq7ymos3mqVgyjIQ88q41DmImT0NDEu1la2cX?=
 =?us-ascii?Q?eI1IAdzBKvfX+a298L2PvH+UWIbihYbpwFYGS//WB2JwSDHCeIE5v1CPuGHY?=
 =?us-ascii?Q?b29Swj8PUij4o7eFqABiKtaCph/FeUUqO8JPyEgXpcqXSMDlw4ngU5Z+Gds8?=
 =?us-ascii?Q?4L+zPrbbPjeF3IBsqBMZbeLR0oIx51jQkT7YgmpHWwUJccr8JXWGKKn94iqL?=
 =?us-ascii?Q?QrD+Dlo+kYb1/NfIc5zfsPJ+h/ot8TmHhYxopdttnvvPlT4e7goK7P0/Ayvn?=
 =?us-ascii?Q?JIMcY/1o6OiC796IYzbynKSY0FzzZj2qJ/CdNQS3S+HCeNPbcVpmco9BjBpp?=
 =?us-ascii?Q?SAvwj5/00m/CNqH/pqmwz4T0iG7M2XGnLaoXYao2vFMZ22SPTWCAq92SqWBi?=
 =?us-ascii?Q?K+vtGil3TqMB0Vgy9QG24Bxslp3pw/avEQ46tiz9CamopaOiCG2gBeo8cbkM?=
 =?us-ascii?Q?NVhq9tpQVVrBc8BVuztBFLpZMc75RANrN/Zcq0ropYUwOhTXkMc5EDDGjD19?=
 =?us-ascii?Q?IsjLaEIjDDVN4jP+2IONF2OR87hh4PA2gnV1Idp9QcN7RzGfIZdK8BNBtqG7?=
 =?us-ascii?Q?m8BQWr3FnkzxPkSVfuiYVY3YeDLgq0k+BlSZgHCPxKaAulsqul5QZtsO/qwO?=
 =?us-ascii?Q?V8Bvs0bGikv59pD126M9Hab8YMrdcWdGV9n3P/+S3xEjg+5MIK3o74Kd+3TR?=
 =?us-ascii?Q?+uTi2sekOKuKDrhQ8LNvNNau9nLcdEZdaHa5B+O2FbrdEyeofcpM2yUycAI8?=
 =?us-ascii?Q?G4ACidNhBx4laYmxOZOzKUhoFeErUFv8rxk0bCVGOeY7+G/H9OV79Fkwl/df?=
 =?us-ascii?Q?FZtKPDO6GTr8JoJvW8CkoDjsFlGsM25vOx6bEc1hS4Cc5MMiEPDBJkuHRFK6?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a783d008-61c8-4440-037d-08db9ab420a6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 21:44:23.7123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANoHUNsDmQICt17qIiB1li2RNnR4d27O3CChCVoDawAgI1YXb4yrQDDosDHg3Yxn/Gb1dqT50x4NV6IvzaCotsyTlE4ALeVmS5n1algWD7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7505
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 11/15] drm/xe/xe2: Add MOCS table
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 09:21:06AM -0700, Matt Roper wrote:
>On Fri, Aug 11, 2023 at 09:06:14AM -0700, Lucas De Marchi wrote:
>> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>>
>> Additional minor change to remove L4_2_RESERVED, which will never be
>> required.
>>
>> Bspec: 71582
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_mocs.c | 29 +++++++++++++++++++++++------
>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>> index c9653978fc9f5..d779ab8466d32 100644
>> --- a/drivers/gpu/drm/xe/xe_mocs.c
>> +++ b/drivers/gpu/drm/xe/xe_mocs.c
>> @@ -62,13 +62,15 @@ struct xe_mocs_info {
>>  #define L3_LKUP(value)		((value) << 7)
>>
>>  /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
>> -#define _L4_CACHEABILITY	REG_GENMASK(3, 2)
>> -#define IG_PAT			REG_BIT(8)
>> +#define IG_PAT				REG_BIT(8)
>> +#define GLOB_L3_CACHEABILITY_MASK	REG_GENMASK(5, 4)
>> +#define L4_CACHEABILITY_MASK		REG_GENMASK(3, 2)
>
>It looks a little bit strange to have "GLOB_" on the L3 but not on the
>L4; should we make these two names consistent?  The symbol names
>recommended on bspec page 65553 are "L{3,4}_CACHE_POLICY" so maybe we
>should just use those names (with "_MASK" on the end) since that won't
>clash with the old LNCF define?

yeah, that sounds good. I will add the rename on next version.


>
>Anyway, it's up to you if you think it's worth renaming anything or
>not.  All the values look correct so
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks

Lucas De Marchi
