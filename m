Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03625C5ACB2
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 03:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F7210E056;
	Thu, 16 Nov 2023 03:28:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C6110E056
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 03:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700105285; x=1731641285;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/5Xq+K/w1twPotk8UfDTYrcdrGQ3qh0+ohy6E1ue6oc=;
 b=cKyOd220kp2RcTNJ64Wpb1oIqQgE6++A09M+K9MoPHXxjUVWrHZ+baOK
 7eHfDIx6y53jlG70ixhyApZW7a68mCYhtUoJ2bNv9bqW9DSOtuZi3flin
 VNZpKKxmIXekNTZP8B1XLuAFwmIVtWvzZysHnO0nPuajQ6S/NsUgt4tjx
 K0bRPIxLK9V+WJxfgmX34ApxmjSzMOsqgR9tJWikrc6YZnEYPxQHg8Qrp
 DXniyo1fMTs0vkJTZUUNJhTDi7+/ZS9I5S0bUEaRqR0yD9DSN/1ARuDhS
 6YlH/6WGs40KZ4pSjQMS0/7Cn0yH96z/UTK0x7LODfpcvWvQgmfeRtQpk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389861233"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="389861233"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 19:28:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="6390806"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 19:28:05 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 19:28:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 19:28:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 19:28:03 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 19:28:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpyX0e3llwbqQzKmjow8B/dvGRfIylNfY/v8GjcwDVTkIKENQSHk6jfMBPto9ShQwzYtoKxW6PlJUTiJbkR1NlQHnstu1oB9UXPXuCpixFlcJbzd+RklAwO3c8+WMRpOCDpctPOQ7Crz9IWllIfoLZJ5jJ6adFmFGaQG+jyODlWCPkZqrKdBmgoVgRBwiWJdz/kQjbW40eoViVnn3AlCkhM+NT+wZHvGvjby2Y3uxBLHMDLACCaM+kXNcsulxkwJxFyOkamzk9CdtAJY+A3zCNSjZM6uV1ObwBhYKDT6w7EA8MPlIYT1qZUP+YdFXGQpqJygB9yB//XCKcJiB5auyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcxYPvZV01HdWm3UhrDSWb6EbYHXP2C0RwuJOHxWqZU=;
 b=LYHSI4V+p97Uu7aGya4vjd3U6hJNFtVcxGrbj1fL7roNFhUiQ/yhrtyEyDGpNTmJjYYh/1vYUBiEtokmz9PHGpH7/WVw39QenPUHe1IEtLaEqvPpULyKdH6BtudIDCBjfYBk3RNNXREWcGfKM9HQv23RNwlVhUMrVphc0DkjnS0/d3eb6jifXdtmCBeFpehSDJxo2R4C2tQZbBuI6izoR+cUw4jklOhZGB604xis0wYB+dCjt/2AtOmNFGo3twk7iYZ2s9roD0DjloZO8Fq7niHd5vLPlUaYEitaNLRs1w6DkcHM8mJSMfpth0qTFCNWN1BHS2SL09wuzmCpYIDGkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 03:28:01 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::787c:c5fe:c197:443c%7]) with mapi id 15.20.6954.028; Thu, 16 Nov 2023
 03:28:00 +0000
Date: Wed, 15 Nov 2023 19:27:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZVWMPdGzCDOeZFon@nvishwa1-DESK>
References: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
 <20231114004604.4439-2-niranjana.vishwanathapura@intel.com>
 <20231115005351.GE1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231115005351.GE1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MN6PR11MB8243:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a467d3-c905-49af-defa-08dbe6540890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/VR4z33mTP4+ewRPEJjsRxn9Yu8PJoMpg2UwFSTdooXl/iGn0rOGeF7nlaYm/R71v7zHebr8lSxlGMfcUHgJOx3Jj2VTVXw20KTqMc7amZrptfRKK2ClUVtzQky73caoDi0fBrmS9ToyY0yJYPYq4/EXvqNP9ql/VUeyEnVnAuI0yONRQq4ltWsEmxKp1iudmIrFz0pdcbxngMbMu4N4BDC7CIgeUGggZZ/F8MzR+98FM8xEVo0bulZ0oWDiKObYf/DEWbHgN0NCxrTNmStrILMbYY38/vnbLcLDuNvudgxBm/015crWBEw4X0tw1TNUg+6w16yDUubAxPL90ZnjMg6osXKDfF+ofAeavYmioOGf1lib9bzVOcRfHfsJnEGu2CD1XORL6dYzQekKzwQgB9yCfRTHwq7CNpW/9JdW2mt9QtPV+uywLvmWgOewfWnDjhwRwTgh6NkybI99vmTqSzucATIz6syfVCUl47+nDhCA8LBtvicwoz6UrlBL9egnqtwaCp9t7gHyoX93Ij8mYgxgHH9rZEsZRZI66GXJ10K7g/0uiupnZuxeg4sRUDD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6666004)(6506007)(83380400001)(38100700002)(26005)(82960400001)(6512007)(9686003)(2906002)(5660300002)(6862004)(30864003)(8936002)(41300700001)(86362001)(8676002)(44832011)(66476007)(66556008)(4326008)(66946007)(6636002)(316002)(6486002)(478600001)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S87ioZDCvr4Yt84cjhYsvCJaMZFcwyU6mLSJwPco3XiKdmhy6nm0NSbkWx?=
 =?iso-8859-1?Q?Z3cg2W1xVN+fyUHy7gLCqXnOvdW08FD+eDPcb+OpkJOTgqi5DnpJQGlB3C?=
 =?iso-8859-1?Q?VD2RrOFj8wLzt5cp2z/gMDiYirDnEhy6qyQgZ0Fv2qPzYhEBZPlnf8tK86?=
 =?iso-8859-1?Q?v2U2Y/HbUtH76/Nn1RfW4gQfndTEtopzuoCSmnsUYY49+T0np3qQjymC8L?=
 =?iso-8859-1?Q?++9JokYCt3tlc9mNeFtkJsi8crbABy64eAm9cHliNamQZEKg3ZZJkdBXqs?=
 =?iso-8859-1?Q?zHy1Hfm19ppA6OqKYSKPDmBSUB61v+8mmbSXW2nfAnZwx/IFQybmha2CXu?=
 =?iso-8859-1?Q?2nvP8FGSKHvDdqOnZgcshNvyBQwD/Pi9iGOa7dY9b9i12hN2znt3oMDexV?=
 =?iso-8859-1?Q?HhWRMZiE9IdJyWGB8ZfnHIMO/rImg3LiZkmWrkAe4EmixvLPWUMZ9fBF0o?=
 =?iso-8859-1?Q?mj8z9VTJDgwJ37Nxqu/e/9RrrQJbqyt5cY9Frwnbw5DhVGk2j3MlOclvRC?=
 =?iso-8859-1?Q?yeHauBLagI4cgrhz8+fnh3yge6WxKifXWp3TNft/RjoPHsyYotWYGvjjff?=
 =?iso-8859-1?Q?+hQxBX2azw4opkSk58QBWhZuusSMFkpQEelIXEZVKLmK8qMIocAc6KB23r?=
 =?iso-8859-1?Q?7mhMpA3r8OnEc23UBnjZukyYJMFX2zTz4MHOelGhTE5AJR9ARkWo7n42tD?=
 =?iso-8859-1?Q?/HFC+phcRMKnJE96utU7Og5sH8o2XMwWC0uyfsrgoIMK7tdx9OIsz3VTjm?=
 =?iso-8859-1?Q?LMg6A9p0FVEKFValJVLVGRl14/pYQt6cST9gUMtyW7YFR4HW3vU4RrgSjw?=
 =?iso-8859-1?Q?/bYh12W4VNemVEkRwd9oJQg2GzXLpLh5FyAAA4ixGdjZ/1aQju69mZ66NX?=
 =?iso-8859-1?Q?6Xg33tBW7tiQVhucQHonMrkeAEh0ZEQCspxB1GeXE3Pq0BT6QM9nXbCdrJ?=
 =?iso-8859-1?Q?vkfAwd+ZeXru265SPfQAxgkdFCLsPib5HGU9dkT/a0YDE2naidqOEYKFXm?=
 =?iso-8859-1?Q?Z+fnPYqRn3MKeKKbzfPbek92fzbluDEyoAgRPl+HStgDYsHSjU2jRagydg?=
 =?iso-8859-1?Q?B2rH+0GI51XmO1P7TSngOJ6IeguNWbpBY42PN7MYLgqWCenGtcyNeITqiy?=
 =?iso-8859-1?Q?cVfbHTnAiygnis1e/oKUEC5xo6tWiaw6rLKdJeJpYxbIlpKT5JCd1TUCIp?=
 =?iso-8859-1?Q?7jzbha4adfvj5YCfqVYNAMkKiwwbn3FJw2iABssWb5E/I1VsflUu+yubH1?=
 =?iso-8859-1?Q?u+rwnAfLqKMbFTNklMeuijfr1dKFIkC6wzTQFnlfqhQmHo187MvjHTTjjf?=
 =?iso-8859-1?Q?eKpuefHsVWTM6m993IO+VugDanAzDecPK8q6qW9xt4HMRD0pFGqdB7Z8oR?=
 =?iso-8859-1?Q?Asq6GNCqIP32H58zETBqVNNZZLhR6lAiQfM1McmLVDBm5QiLXU0ZETTzNC?=
 =?iso-8859-1?Q?+/aNLlxE2WMjqGwZECsL/DKca/31pZT10a1UE1X7/VAwVPwmJJI6ZCZPfZ?=
 =?iso-8859-1?Q?jTqc3YnwSaWCWgX3HjDxRk9sASd3nXdmpK6Y5LZSihUt+PGc//b6MNwN7C?=
 =?iso-8859-1?Q?tcsKS6NXLeg+vMqz2N84/PbvfeVRki2MNXqsJFn9lvb9CPFH+Dy5DcYjwj?=
 =?iso-8859-1?Q?BmuOOReye7LZEvphi9VFyZKuYGQ/ODXCmDbVSrruGsu/peUe42zOVW2Mfa?=
 =?iso-8859-1?Q?PkSVo4hQDuSq5Y3rwHk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a467d3-c905-49af-defa-08dbe6540890
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 03:28:00.0676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EL2pDJP5AyjTEfd4m98Wk0FSLpBdqUyR2lYBmKELdXxtjshScI4KlDb292sWjN78+XODr053MdifRhU90LNaMRjyWDbp9vlyoZKH1sHgaBEK2v4wc6ngp8ZPsJGFJfx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v3 1/2] drm/xe: Enable Fixed CCS mode setting
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

On Tue, Nov 14, 2023 at 04:53:51PM -0800, Matt Roper wrote:
>On Mon, Nov 13, 2023 at 04:46:03PM -0800, Niranjana Vishwanathapura wrote:
>> Disable dynamic HW load balancing of compute resource assignment
>> to engines and instead enabled fixed mode of mapping compute
>> resources to engines.
>
>Since the code below is only doing this for PVC and not for other
>platforms like DG2/ATS-M, we should clarify that in the commit message.
>And also, this setting is mandatory on PVC due to Wa_16016805146 so we
>probably want to state that as well so that nobody gets confused down
>the road and thinks this was an optional / arbitrary decision.
>

Ok, will add

>>
>> By default enable only one CCS engine with all compute slices
>> assigned to it. This seems to be the desired configuration for
>> common workloads.
>>
>> Allow user to configure this CCS mode setting through a 'ccs_mode'
>> sysfs entry.
>
>I'm wondering if we should break out the sysfs stuff to a separate
>commit.  Do the UMDs already have their support ready that's necessary
>for us to land this new uapi in the KMD?
>

Ok, will move it a separate patch here

>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile          |  1 +
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++
>>  drivers/gpu/drm/xe/xe_gt.c           | 10 ++++
>>  drivers/gpu/drm/xe/xe_gt.h           |  2 +
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 73 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 22 +++++++++
>>  drivers/gpu/drm/xe/xe_gt_sysfs.c     | 53 ++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_gt_types.h     | 14 ++++++
>>  drivers/gpu/drm/xe/xe_guc_ads.c      |  3 ++
>>  drivers/gpu/drm/xe/xe_hw_engine.c    | 20 ++++++++
>>  10 files changed, 212 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index a1a8847e2ba3..dab5c9a8ad44 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -58,6 +58,7 @@ xe-y += xe_bb.o \
>>  	xe_force_wake.o \
>>  	xe_ggtt.o \
>>  	xe_gt.o \
>> +	xe_gt_ccs_mode.o \
>>  	xe_gt_clock.o \
>>  	xe_gt_debugfs.o \
>>  	xe_gt_idle_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cc27fe8fc363..576b72000ae9 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -395,8 +395,22 @@
>>  #define   COMP_CKN_IN				REG_GENMASK(30, 29)
>>
>>  #define RCU_MODE				XE_REG(0x14800, XE_REG_OPTION_MASKED)
>> +#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>>  #define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>>
>> +/*
>> + * Total of 4 cslices, where each cslice is in the form:
>> + *   [0-3]     CCS ID
>> + *   [4-6]     RSVD
>> + *   [7]       Disabled
>> + */
>> +#define CCS_MODE				XE_REG(0x14804)
>> +#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>> +#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>> +#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>> +#define   CCS_MODE_CSLICE(cslice, ccs) \
>> +	(ccs << (cslice * CCS_MODE_CSLICE_WIDTH))
>> +
>>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>>  #define   FORCEWAKE_KERNEL			BIT(0)
>>  #define   FORCEWAKE_USER			BIT(1)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 6c885dde5d59..1f9b678fc530 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -21,6 +21,7 @@
>>  #include "xe_execlist.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_ggtt.h"
>> +#include "xe_gt_ccs_mode.h"
>>  #include "xe_gt_clock.h"
>>  #include "xe_gt_idle_sysfs.h"
>>  #include "xe_gt_mcr.h"
>> @@ -451,6 +452,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>  	if (err)
>>  		goto err_force_wake;
>>
>> +	/* Configure default CCS mode of 1 engine with all resources */
>> +	if (xe_gt_ccs_mode_enabled(gt)) {
>> +		gt->ccs.num_engines = 1;
>> +		xe_gt_apply_ccs_mode(gt);
>> +	}
>> +
>>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>  	XE_WARN_ON(err);
>>  	xe_device_mem_access_put(gt_to_xe(gt));
>> @@ -553,6 +560,9 @@ static int do_gt_restart(struct xe_gt *gt)
>>  		xe_reg_sr_apply_whitelist(hwe);
>>  	}
>>
>> +	/* Get CCS mode in sync between sw/hw */
>> +	xe_gt_apply_ccs_mode(gt);
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index caded203a8a0..1c2a1d35a2c1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -17,6 +17,8 @@
>>  		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>>  			  xe_hw_engine_is_valid((hwe__)))
>>
>> +#define CCS_MASK(gt) ((gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>> +
>>  #ifdef CONFIG_FAULT_INJECTION
>>  extern struct fault_attr gt_reset_failure;
>>  static inline bool xe_fault_inject_gt_reset(void)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> new file mode 100644
>> index 000000000000..fcbdc13df46e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -0,0 +1,73 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_assert.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_ccs_mode.h"
>> +#include "xe_mmio.h"
>> +
>> +static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>> +{
>> +	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_hw_engine *hwe;
>> +	int num_slices = hweight32(CCS_MASK(gt));
>> +	int width, cslice;
>> +	enum xe_hw_engine_id id;
>> +	u32 config = 0;
>> +
>> +	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>> +
>> +	xe_assert(xe, num_engines && num_engines <= num_slices);
>> +	xe_assert(xe, !(num_slices % num_engines));
>> +
>> +	/*
>> +	 * Loop over all available slices and assign each a user engine.
>> +	 *
>> +	 * With 1 engine (ccs0):
>> +	 *   slice 0, 1, 2, 3: ccs0
>> +	 *
>> +	 * With 2 engines (ccs0, ccs1):
>> +	 *   slice 0, 2: ccs0
>> +	 *   slice 1, 3: ccs1
>> +	 *
>> +	 * With 4 engines (ccs0, ccs1, ccs2, ccs3):
>> +	 *   slice 0: ccs0
>> +	 *   slice 1: ccs1
>> +	 *   slice 2: ccs2
>> +	 *   slice 3: ccs3
>> +	 */
>> +	for (width = num_slices / num_engines, cslice = 0; width--;) {
>> +		for_each_hw_engine(hwe, gt, id) {
>> +			if (hwe->class != XE_ENGINE_CLASS_COMPUTE)
>> +				continue;
>> +
>> +			if (hwe->logical_instance >= num_engines)
>> +				break;
>> +
>> +			config |= BIT(hwe->instance) << XE_HW_ENGINE_CCS0;
>> +
>> +			/* If a slice is fused off, leave disabled */
>> +			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>> +				cslice++;
>> +
>> +			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>> +			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
>> +			cslice++;
>> +		}
>> +	}
>
>Maybe it's just me, but the above seems somewhat hard to follow (even
>though I think it's correct).  I think an alternate implementation could
>be done with bitmap operations (untested):
>
>    unsigned long cslice_mask = CCS_MASK(gt);
>    unsigned long logical_usable = GENMASK(num_engines - 1, 0);
>    unsigned long physical_usable = 0;
>
>    xe_assert(num_engines && num_engines <= hweight32(cslice_mask));
>
>    bitmap_onto(&physical_usable, &logical_usable, &cslice_mask, 4);
>    for_each_set_bit(cslice, &cslice_mask, 4) {
>            int ccs = bitmap_bitremap(cslice, &cslice_mask, &physical_usable, 4)
>
>            mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>            mode |= CCS_MODE_CSLICE(cslice, ccs);
>    }
>
>I'm not sure whether that winds up being more or less readable in the
>end.
>

Yah, it looks pretty neat once those bitmap functions are understood.
But unfortunately, those bitmap functions are only defined under CONFIG_NUMA
(not sure why). I don't want to bring that dependency here for now. May be
we can ask maintainers to move it out of CONFIG_NUMA?

>> +
>> +	xe_mmio_write32(gt, CCS_MODE, mode);
>> +
>> +	xe_gt_info(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",
>> +		   mode, config, num_engines, num_slices);
>> +}
>> +
>> +void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>> +{
>> +	if (gt->ccs.num_engines)
>> +		__xe_gt_apply_ccs_mode(gt, gt->ccs.num_engines);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> new file mode 100644
>> index 000000000000..2f3352173e7b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_GT_CCS_MODE_H_
>> +#define _XE_GT_CCS_MODE_H_
>> +
>> +#include "xe_device_types.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_types.h"
>> +#include "xe_platform_types.h"
>> +
>> +void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>> +
>> +static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>> +{
>> +	return GRAPHICS_VERx100(gt_to_xe(gt)) == 1260 && CCS_MASK(gt);
>> +}
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index c69d2e8a0fe1..e53221c2894f 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -10,7 +10,11 @@
>>
>>  #include <drm/drm_managed.h>
>>
>> +#include "regs/xe_gt_regs.h"
>>  #include "xe_gt.h"
>> +#include "xe_gt_ccs_mode.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_mmio.h"
>>
>>  static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>>  {
>> @@ -29,6 +33,50 @@ static void gt_sysfs_fini(struct drm_device *drm, void *arg)
>>  	kobject_put(gt->sysfs);
>>  }
>>
>> +static ssize_t
>> +ccs_mode_show(struct device *kdev,
>> +	      struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>> +
>> +	return sysfs_emit(buf, "Enabled compute engines %d; Number of compute slices %d\n",
>> +			  gt->ccs.num_engines, hweight32(CCS_MASK(gt)));
>> +}
>> +
>> +static ssize_t
>> +ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>> +	       const char *buff, size_t count)
>> +{
>> +	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
>> +	u32 num_engines, num_slices;
>> +	int ret;
>> +
>> +	ret = kstrtou32(buff, 0, &num_engines);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Ensure number of engines specified is valid and there is an
>> +	 * exact multiple of engines for slices.
>> +	 */
>> +	num_slices = hweight32(CCS_MASK(gt));
>> +	if (!num_engines || num_engines > num_slices || num_slices % num_engines) {
>> +		xe_gt_dbg(gt, "Invalid compute config, %d engines %d slices\n",
>> +			  num_engines, num_slices);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (gt->ccs.num_engines != num_engines) {
>> +		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>> +		gt->ccs.num_engines = num_engines;
>> +		xe_gt_reset_async(gt);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_RW(ccs_mode);
>> +
>>  void xe_gt_sysfs_init(struct xe_gt *gt)
>>  {
>>  	struct xe_tile *tile = gt_to_tile(gt);
>> @@ -52,6 +100,11 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>
>>  	gt->sysfs = &kg->base;
>>
>> +	if (GRAPHICS_VERx100(xe) == 1260 &&
>> +	    sysfs_create_file(gt->sysfs, &dev_attr_ccs_mode.attr))
>> +		drm_warn(&xe->drm,
>> +			 "Sysfs creation for ccs_mode setting failed\n");
>> +
>>  	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>>  	if (err) {
>>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index d3f2793684e2..ab1740005600 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -185,6 +185,20 @@ struct xe_gt {
>>  		spinlock_t lock;
>>  	} tlb_invalidation;
>>
>> +	/**
>> +	 * @ccs: Fixed mapping between CCS engines and compute slices.
>> +	 * Through the per-tile 'ccs_mode' sysfs interface, the user can specify a
>> +	 * fixed number of compute hardware engines to which the available compute
>> +	 * slices are to be allocated. By default all compute slices are allocated
>> +	 * to the first available compute engine instance. This user configuration
>> +	 * change triggers a tile reset and it is expected that user will ensure
>> +	 * the tile is idle while doing so.
>> +	 */
>> +	struct {
>> +		/** @num_engines: Number of CCS engines enabled */
>> +		u32 num_engines;
>> +	} ccs;
>
>Just because the term "ccs" at the GT is a bit overloaded, I wonder if
>we should pick some name that makes it clear that this is referring to
>CCS engines and not to CCS compression.  E.g., maybe make the structure
>"ccs_engines" and the field "num_active" or something like that?
>

Ok, will change it to ccs_mode.

Niranjana

>
>Matt
>
>> +
>>  	/** @usm: unified shared memory state */
>>  	struct {
>>  		/**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 88789826e781..b6be7a7ad76a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -12,6 +12,7 @@
>>  #include "regs/xe_guc_regs.h"
>>  #include "xe_bo.h"
>>  #include "xe_gt.h"
>> +#include "xe_gt_ccs_mode.h"
>>  #include "xe_guc.h"
>>  #include "xe_hw_engine.h"
>>  #include "xe_lrc.h"
>> @@ -454,6 +455,8 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>>  		{ .reg = RING_HWS_PGA(hwe->mmio_base),			},
>>  		{ .reg = RING_IMR(hwe->mmio_base),			},
>>  		{ .reg = RCU_MODE, .skip = hwe != hwe_rcs_reset_domain	},
>> +		{ .reg = CCS_MODE,
>> +		  .skip = hwe != hwe_rcs_reset_domain || !xe_gt_ccs_mode_enabled(hwe->gt) },
>>  	};
>>  	u32 i;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index e831e63c5e48..4f41699f95ec 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -16,6 +16,7 @@
>>  #include "xe_execlist.h"
>>  #include "xe_force_wake.h"
>>  #include "xe_gt.h"
>> +#include "xe_gt_ccs_mode.h"
>>  #include "xe_gt_topology.h"
>>  #include "xe_hw_fence.h"
>>  #include "xe_irq.h"
>> @@ -283,6 +284,13 @@ void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>>  	hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
>>  }
>>
>> +static bool xe_hw_engine_match_fixed_cslice_mode(const struct xe_gt *gt,
>> +						 const struct xe_hw_engine *hwe)
>> +{
>> +	return xe_gt_ccs_mode_enabled(gt) &&
>> +	       xe_rtp_match_first_render_or_compute(gt, hwe);
>> +}
>> +
>>  void
>>  xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  {
>> @@ -307,6 +315,12 @@ xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
>>  				 blit_cctl_val,
>>  				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
>>  		},
>> +		/* Use Fixed slice CCS mode */
>> +		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
>> +		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
>> +		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
>> +					   RCU_MODE_FIXED_SLICE_CCS_MODE))
>> +		},
>>  		{}
>>  	};
>>
>> @@ -841,6 +855,12 @@ bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe)
>>  	if (hwe->class == XE_ENGINE_CLASS_OTHER)
>>  		return true;
>>
>> +	/* Check for engines disabled by ccs_mode setting */
>> +	if (xe_gt_ccs_mode_enabled(gt) &&
>> +	    hwe->class == XE_ENGINE_CLASS_COMPUTE &&
>> +	    hwe->logical_instance >= gt->ccs.num_engines)
>> +		return true;
>> +
>>  	return xe->info.supports_usm && hwe->class == XE_ENGINE_CLASS_COPY &&
>>  		hwe->instance == gt->usm.reserved_bcs_instance;
>>  }
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
