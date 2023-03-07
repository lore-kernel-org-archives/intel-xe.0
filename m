Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617B0C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 20:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240BF10E53D;
	Tue,  7 Mar 2023 20:05:10 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2D910E53D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 20:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678219507; x=1709755507;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LU/bUFgH+/UBbsoAxmSrwGTgEBUskhLpK2w2xyTJrU0=;
 b=TdBVKdPBSoBR8qjwNcjA1BpYiiZ7GVRKMKA5SC76U+16rGEXIpt3Ry3v
 QtQCa0L9GHhBTwYsvy22jSQRkRUyqqyJJZmuOAJDYJbUvLBGfHX1ud2Ld
 PzJ5uUQbMl3C9pMzX6+fWQtP0dD6ubAg85kWe/5sJc/UxSkOyTxaqgVAk
 auunx9cO/aRhq69nBS4ndyhfcVAyet8h2wwrUqcD+hJEAkYZvnq4b2lqi
 tt0MpJJH27lqb3K0Q/VKB3YpqFADUw+vETxQgD5UMfNR12yBa4E0dyr9I
 9lmeDYfQ026Fm5DQOEUsvHHUtyvmXx+cFBW+qxg1k9kfEWeHzter+iT+Q g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="324268547"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="324268547"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 12:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="765759639"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="765759639"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2023 12:05:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 12:05:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 12:05:06 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 12:05:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFP6XoCZlf5OEYheA1M8ZYr3aSbIIZLS0n/Amaxv5YWAiDyvIwGr7vxHw1VpfEjZZ/KN1CAShREh/CT31h4qOutDMRT76AE3GO4sD7jmj5J0lgqjNMH3qwJhVQXANrEuLzlNBJ47AthtsaRXfOZoRnaeHhPnt33pS415rQeuHZw4cgxHc9HhQd+xg6bWUUOt0Uw55P4tjX/nTtY5V4I/aHSGM5mSaJg96qGa9Xe+GYt1s7EvfsxwnNAU3k2vOvTfO0n5zyBD0FrtYrCZa+4GqyELq/ANr8zsYyDDAI9sl8+2FlFDc2bvmBhUeIjiJrnu6qGKwQC8nBvuGluPFaiIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNXpPRhJe16UIiidghNIZ/JZEcev6G/oYM1JOLyx4uo=;
 b=EL/BW+8UCxvqjNnDe2XuUKyzylvSeqlh/KJL06bKPVjkcm3bFM8VEMOwXpcdNnyr2hHKpLUSAs+TnFMCTeVwoGrXJ78uF+oZt1/8Gzdew40+IeTkGxT+HqyBedKl+xzCFJ+9vBC4KHuFlxNJDe8m4yoip0JaxV+VZqgfa8OTuj3aqKWNcxGwVP/LwwXxrJnlKgIckaAByoywgxVzQOt2JkPp0mvzV+nvltVq3nxfRpglJWkKDUdqTG9mmZGwss0WWEtq2z5lRX/02JLtLf2IO9llewvGDBG1J2bsHyCCok04IS8jdxlggNE6f4LWoDpVDZIHBAq9737k+mfEcVpDuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB5959.namprd11.prod.outlook.com (2603:10b6:510:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 20:05:04 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 20:05:04 +0000
Date: Tue, 7 Mar 2023 12:05:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230307200501.GO1175070@mdroper-desk1.amr.corp.intel.com>
References: <20230307015635.986043-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307015635.986043-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR05CA0084.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: bda9f995-6468-454d-9136-08db1f473d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bY3Uhv+5EJlsqYtvLXyhCRe6XlQSTKOI0pXp7szqbPqg7sRHotyfwF449f+wPyxXCD29n6Fm4ukKld50FbOCFVeF4OtCEo6qVGeKC6XlMlaO9gOHsmPrN5gXnPoXhN1R/PqeMMI7+448zmG3SmYoUfO4S1aZvKVFVgqITjvZWpfUiUjAuIw6zfqYKhkAeCN36WEV9Za1hyhhZkN9TqzwwdpMX+UowtNbMBeByemg7xPpcFIqH+jx2yudvNEO8fzwhXLkSY9UEIDv86mtNYznxxx+shB8enEW4lDdQ2YjionSzbyN1RJUWGssy+Eyu8sVe17VRv4aTPHfkm0Q2WGjTrdKafHkO7yNt/jLEOyvFoej1nY7lJIBo0x+qKmAtBbJQVuuZ3SkInPnP8oYPNKcm3iQ71Nw05YhOm5J+bUvQOzSLHCywatO1n9K6qzrGXPD8M35KjyQrQBNBYfjcCCj83bw/GHzrcpHFMg6ozfNt1QWn63zOADgEn4vJmurf75NN4w8ETJdj7ZG/fVS/Y/0CRVRH4IINRVl+hchTcmTC1awzL7gYcJdGP0G/NL45cXUfbzbHKYehtjOSn91/IOudXIHRplV/KnrOlbVEZDUYvhUgq7lSH2z3Yg9IFI6d/1LhgT3Gpkh7GRaiVfjsz+VNc7Q8H0oT46NbDXvLFBalCUwHFxbH9mlR+ggrKk1VGjy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199018)(186003)(38100700002)(8676002)(2906002)(41300700001)(4326008)(66946007)(66476007)(66556008)(478600001)(6862004)(26005)(82960400001)(5660300002)(8936002)(6512007)(6506007)(1076003)(6666004)(6636002)(316002)(33656002)(86362001)(83380400001)(6486002)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HX2+ESBlisKkTVf2iaQh9t47x4tyGzC5AEhXfB7RRbVvZaIXSQEq6l5yDIIy?=
 =?us-ascii?Q?sL3Q1rHUDOxa1IfrSYCj5Z5ODtU2E7IVrrYOo8v3I5AS4fLMBhRKlXTrP//w?=
 =?us-ascii?Q?xDprESpoBo0uUpNZCYLDwoGAJ93O/ZeYgSiJUzF5Zv9hpmhyeQbWAZ0ISBG/?=
 =?us-ascii?Q?93VpyhPTlQsKtGQWtCyAoHYUVo/JGy4DJ1GwHydMpVVitgqEH/4qWqT99MpE?=
 =?us-ascii?Q?Fly+CfncP3kiyN7ynng36HZ2VF9MozS8PyYs5JosZ4j3GuCI+ZFZsQ8tlcDt?=
 =?us-ascii?Q?oP0OVC1BKdnHNAuVSr7IkgTX8KpcS3AIHJRw7ouspEEKGE1HCLMpgwYpOPDL?=
 =?us-ascii?Q?+USu1C8F336Jis9Lkvj57oZZTkiQv+QiyP4cOrAT7Qk+4Taspl3PFo5npiw7?=
 =?us-ascii?Q?RX+KpIcaDvpzekQInnJRhYy62qloDOksTKn+xD8PUXnzvkEystojnrpJQqZ3?=
 =?us-ascii?Q?kVUXHr7VdHPXs4Eweu94aUqdvfjm0CrM6b47D6X3V4RXTep+j+VC5Iloac0t?=
 =?us-ascii?Q?yJO/11qs376Qi/6FgvNxbk8JQvAMCgdWCv6Plz0kyKELjHldxk9INQYNZBsO?=
 =?us-ascii?Q?Szo+VjMJ5VATCvU+gSr0ke81JNnvVrPzwjdyTgHIvfjF5O9r/S02T45pryoi?=
 =?us-ascii?Q?TEhbSkVL8fHNiGUyoTrvhg6Ho+s5/u/70+utJUha+6FQc9qtR/FFYfeRPEyU?=
 =?us-ascii?Q?QUzchMqZ5ciccqKoLVJ+mN28ZZGzWLqv4GbZcuBY15Ja9J1fMkSlYgUDxGUx?=
 =?us-ascii?Q?EfsttRfJWXwhLafVuUPL733y3yov+o8Ys2KvFLv7acwcci+nq1wfTmyjZQ4l?=
 =?us-ascii?Q?08S9vwdOTnCw5umHO6fy+zU40sn2U3TcwjIdAO3FMbppjZQtqQELMR1evJbC?=
 =?us-ascii?Q?4iNZFjAQfRcTj6xRATadTNEdwREQGWwed31SxdvYX3IRNViqgFIkWyKr3xkH?=
 =?us-ascii?Q?H8urtyhRWd+ehPjV5d87xHp/aOL5dtLjYYiICblBEN0gJ9Jq6q/qdOIOlh/6?=
 =?us-ascii?Q?N1ay2RsB6VemxtsOkkebdyW8bD2KdZnCCkZaxWlTYHr9m8bezdmwlCKuYTdR?=
 =?us-ascii?Q?UqqHQbFJFc/NhrcU4YAMll4RY6V0ufZcdVZmEK7IdzAIdst0jteOOMcskoUy?=
 =?us-ascii?Q?dHIQwnpZpfNCHPf9/JRuQ0gNVtAI1E4cecBCA0tndgtq0CV1drNADmC2FiNf?=
 =?us-ascii?Q?AtkJGI+rZb/bljQDyc1HeaE6Gdafm/rWeBc0zjEvVbAgTnKGoP2o19V6ogdW?=
 =?us-ascii?Q?M0UgP9gv/zHwFrA9PfvHdTcOccyBf2kAXnB9vuKKXjfapsrlNI2NlCiKGj3N?=
 =?us-ascii?Q?NQoij1Iwi+OTyTK5oNBZWibKtPfppJ+E2Al4InKwpf9nf2tulkgcfBa1ItXs?=
 =?us-ascii?Q?2/tuZs2Fdt5RNr7I/b3kU9dFqprCwLJTk0A4dmpc985n+pu7mqfsT8sAqwQn?=
 =?us-ascii?Q?L8ei6SzJQaNzRZs/WrwsfxqW3Q+W4n01x4nrPJag82TKpQqWa+CQtjFi0msc?=
 =?us-ascii?Q?qoUo3OxEgA6hkZHjR50QqDPwx7yKzbh6b48/yUSN4H7LyqXz7w4Vhz7AYvqw?=
 =?us-ascii?Q?MNt/0FZAV0LitMTVD9/oQOXem8SXt3Qnd3rb/PYE3nF7z0hRTaM10tItkvd+?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bda9f995-6468-454d-9136-08db1f473d9a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 20:05:04.2548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WBHIOuNAIzYltAr0HQdJpSmEsqZJIec6gSOjAiMU4w7bdYTkD0ZLO/edeqnBP1RAqwumjPlTYzuYCCiE5sUswJmm9uPWWHVxuuBLRTQw0UE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5959
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mcr: Add L3BANK steering for DG2
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

On Mon, Mar 06, 2023 at 05:56:35PM -0800, Lucas De Marchi wrote:
> Some register ranges with replication type L3BANK were missing from the
> driver table. The following warning was triggering when adding a
> workaround touching the register 0xb188:
> 
> 	xe 0000:03:00.0: Did not find MCR register 0xb188 in any MCR steering table
> 
> Add the L3BANK ranges according to the spec.
> 
> Bspec: 66534
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_mcr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
> index fdbf9edb14cd..694a79b40ec0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
> @@ -47,6 +47,12 @@ static const struct xe_mmio_range xelp_l3bank_steering_table[] = {
>  	{},
>  };
>  
> +static const struct xe_mmio_range xehp_l3bank_steering_table[] = {
> +	{ 0x008C80, 0x00BCFF },

I think there's a typo here.  Upper bound should be *8*CFF if I'm
reading the bspec correctly.

We also need a new clause in init_steering_l3bank() to select a
non-terminated instance properly (it differs from the other platforms
with L3BANK ranges).


Matt

> +	{ 0x00B100, 0x00B3FF },
> +	{},
> +};
> +
>  /*
>   * Although the bspec lists more "MSLICE" ranges than shown here, some of those
>   * are of a "GAM" subclass that has special rules and doesn't need to be
> @@ -277,6 +283,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>  		gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
>  		gt->steering[DSS].ranges = xehpc_dss_steering_table;
>  	} else if (xe->info.platform == XE_DG2) {
> +		gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
>  		gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
>  		gt->steering[LNCF].ranges = xehp_lncf_steering_table;
>  		gt->steering[DSS].ranges = xehp_dss_steering_table;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
