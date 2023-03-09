Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289D0C61DA4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 08:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0959410E15A;
	Thu,  9 Mar 2023 08:34:17 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95BCB10E7AC
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678350855; x=1709886855;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=R3SoILwOsehvFym6wZsqkM5UXDcYejxPJOzMu3r0/F0=;
 b=UWq5Shabw+pud7dw0JeIBnCgadF0ODwJTFLj9/HAE3wowqkWo9bM9JHm
 ClG6vGiq5hGgSSOrftjA6UvQRY8FV2jRebMtLWSTDvfC6KpXNbx7aruHc
 h3aLA0NE+N/SK72oELVt+FzjB2ovw3/lGz0HnbRrpfB+TSSMLpzJ5+YYT
 07UO/xTWbyHcgvsq3NEAVmTMizYKA2P1P8RAWIvaFVSn1BXKUFBceUGqz
 coQ2zR/gm3K5oTHJL2B9Jt6g73gTFflg8i9AU7FQ5nCJ+bwTVqt7dEx7z
 lK99tkVSGZ3F1Tdjrj+N9lKOrW4d0ZiwZ6ABFB3KgMNgqXLtrjBgXP3+Z g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="324710186"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="324710186"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 00:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="679663682"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="679663682"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 00:34:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 00:34:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 00:34:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 00:34:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLM4GK4xWvw8RF/gAAXRnMBRoqZfFItIDUgEurK7rmn6zSBEie+pWpWKeFn2Xp1aImI2q3l2fCFicLHE79LSIIuxlYjLGL0mEmt82dHSDB3TmOxujaK7dwOaage0Svue93yOvWS4Ld+znNr87+E/dj9eW6ZkQPcZxg8ZMCHceLD0QqMaQCnxJ2axju7uUixtXA8WJcpobs+zU53tT3W3MV3fB7HD8VJvx0YuTSYr/ljbIbHgjCFA3beQKpsEw/Ibmzeb6AJ+zj8Sz87YULrW2O1kJkH/UVAidJmM1/ycZUOe1O6yiGgrnv4cj7I9cMprNjKR4BozrsFc+8iw3Boykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8DOVBKyB8K76eJ1rpbyopA46q6NCvkfD4kiHXCWuRs=;
 b=kygdrNS9fFIuG+Ak0EP0a8WiqlHrIHARZxzvge/InjKnT/Md3Oi4TIGh+CGVOBuSpFGNKAiSntJlJlUTq9V1ewKDn3tIK+VFGDVYoErO9Fhfpjpo7IKodl/f6tTN8pY+CQHp7WQX5SsbSCB1xQDGHo+sPMe9kzqIwLpBPo0grEFZ9C1x0hVCfoZNDWdSEXycgEi2ju+Hixy84iKNiz0VK9SuRtV5y/M2bg/YoLQx9/sl1HRTytoDVt6PmE4+91D7+09cuFhrVlYqdWQ6K12YIVgOX6uYo9rsQ7l3SzgdQaJkTxnh35GJMoxN83sjGY/aFIqIgp0W3kF5jaCIkM81sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN0PR11MB6110.namprd11.prod.outlook.com (2603:10b6:208:3ce::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 08:34:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 08:34:07 +0000
Date: Thu, 9 Mar 2023 00:34:04 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230309083404.x4q43l3rrkjy6ukc@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
 <20230307092446.1263266-14-lucas.demarchi@intel.com>
 <20230308225510.GJ1543793@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308225510.GJ1543793@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN0PR11MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a6fd067-b9a1-4770-1811-08db20790c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Jny3lGzSbAJU8v6pWDQiVzkMtHBiIRklplI07yIBkEd1v9+YSk/IXnHgqGT0Pj8YNKG5Ju4HTHRuCkYVueEju41/FsJ1TAovy23ahNs7KIyneZ5Zw0kKXTnKMYl8FBaG6wTjseMNv847hRmzDWpt5/yYBPdPYITWXhTT940TIprEpSgV+GMsS85HwurcvBfofGTDnkMT9PK556L1HWqsapWvLPXAOxpO4k/nH59/9Ilcu4Hm0ah3uJlji2T/hBDeTJseZDxWFX3XQTHy1Q/vRk+pR2qf2Q9akeDp0AXbv1Zcx72/hIN1ZcdwuDFRNJLG5n5aHe+abNGM/5B8/pVWuX8mykHRbD9IUIAkbbO88s3ZMk8aRlwg4guNMfyWPZolr/ML/6z//vItRXCDChvT3qEE+j4CczHUnWda8KXjAPVyVhYZrDhXH8LupXhA076bxjEbG/tPfnoSnEyjwxcbmd2vsOXMhTwyj2gBa4L7pAWGGdgjram9QhDn3fVt9mo6e//N0sXdKmQTcgQVUbMyuC9Uo75dwVWXdgGFfdigT3rkqj0s+mLbwsT3Q4aoxrfs3f3V4Bo0t3XVJOzJ+5/RvpWPKB61k3oKG1YdcdOGS/zDUhCVF17Tb4n/IqtMmoOTSkJvwurTUAQbnQ3vToG2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199018)(82960400001)(83380400001)(6666004)(36756003)(6636002)(478600001)(316002)(38100700002)(9686003)(6512007)(6486002)(1076003)(186003)(6506007)(26005)(41300700001)(5660300002)(8936002)(66556008)(66476007)(6862004)(86362001)(2906002)(66946007)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jbrImQ/Gw1q7RiFPPANkjp102ZQLV7JixUltv/6gmUz+hIecMOBd9TCrFYyB?=
 =?us-ascii?Q?TUdC2GYfBKSMsSa8gyrEDqqq4ZNx3Bvz1o/IBEftGRNQItuM35fcBheqmc6L?=
 =?us-ascii?Q?Ly/abyQgJCiCDajeiey+h8fwi2PoI/Ecw0G5nfIkd2XIrdErSIkC2PZ1fRWH?=
 =?us-ascii?Q?kMCAZcQcnn6twgXHTC9hM7qVGou0q9doszd3q3+H0TNInLtKSEGdc64uBiMF?=
 =?us-ascii?Q?1HiB4ptLOz6JyzYrvRha5oKWh+uTvylI0pVYImKBDIWPuOgYLJ9ZTPzEqmFY?=
 =?us-ascii?Q?bikjsPTr3y9zLt6dyVG8RveYD7PhF0cqBNmoeI1j9NtvYozAEjhPRYo5kHKK?=
 =?us-ascii?Q?oHN1TlyNV5XywfJ3fC2UYed5okRcFizNtHJUJXEOP8rbVFTu+r7lH+uidpUC?=
 =?us-ascii?Q?0KGncgvZDkwUbtzR4kZfNqQvXwoquy5bUe3ERnrUQUj5nDN6VMKxghGl7QrF?=
 =?us-ascii?Q?1o+007IVzpFMQ1Gnfn1IVBHK9gebFSft8lKfVCXFdDtYnln7K3iojV8Ev0n7?=
 =?us-ascii?Q?DrEkA0gfLBdKyunH609rzaL0Jord+tPi0+zRtDdbGyVsaMyTFzN1P7m4DYHR?=
 =?us-ascii?Q?o2YrDIhefKtEb7Gb+ahyj8bckxJZZFsA+mTNi6/6dJGscQjcRpiBLquuOZoD?=
 =?us-ascii?Q?W5ZHSoFuYcODbklq8sg1x7zeyrDbLgOwN+gLU3LekwTO9ByzFGZofL6eWt6+?=
 =?us-ascii?Q?WPh/fK2XbS9T0/BFrbVjyuQSn48XdkjtCwTa0ZN3U6afkAohvj+PF7pe1Jyw?=
 =?us-ascii?Q?vF6XXgaKUeWniBBV6VWq5JF+kZZ/+qQDd/eHKK8vekEcpbzG4+JtJhTuCoaf?=
 =?us-ascii?Q?dPg15ZaMnT7/pqA+LHjCHQ3RdIRkyrvNryAhD9KiRogVSqTWPERSrxCVJ69j?=
 =?us-ascii?Q?AcXqOhTiJ8127Noh3WjiImf5oDp3gBFFbuJJ2mETV54gAJntwd5L/NicC4ou?=
 =?us-ascii?Q?yaN2xRvb3flx6zpzizPmhfC0hNB+T2vY6qvmoNVJAc9uih5RmGbrDDbMGugw?=
 =?us-ascii?Q?t2tXKw/vIa1VsehzESU292O5+vJ4IzP1c44xZkYrE1DP6tjgKyZ2ypQXGnBh?=
 =?us-ascii?Q?UapqcXMBipYUeDagin4QmiEnrfx4S81oWtgEVf9rBdH1Ez2Qtcxt03jNnnnf?=
 =?us-ascii?Q?q0oqsNj7nrbviyQY7EJNinnUtwEpPFg4REHr/lDpuX4TUeTR+R/i46YZggES?=
 =?us-ascii?Q?p2jJvNEPUWLzYeGFNkz8IWPm25qUDFLx3ypl9BQF5/gHZT9O27gveIywdc+9?=
 =?us-ascii?Q?Z/1Xjphug5HvgFfiKFTxW35IzpmLz6bgksZ07PuwYgylyhw9ThkCW6I5y9lW?=
 =?us-ascii?Q?+zMuhvzdPa+rWgiilPgCIlFwAWAJIHdXOo8j3qGH5niQUWVqwJlk41x09c9s?=
 =?us-ascii?Q?/gZrex8KF6CkD872qIWU3yfNv85en7hf6HxKKirPqoS1TfLiVEM37H6XG/aU?=
 =?us-ascii?Q?7tEL0PXUtvkSrkkEbDDyqNdUEFRqQ+s4fXCe3E4cETinicw2tDaH4B8rM52D?=
 =?us-ascii?Q?4DAhlQEGF7IDjcV+A/K9RM9eI5BwSRXOAh//1gx2zhwKtR4qjAlentCjvbG0?=
 =?us-ascii?Q?5u7TSBylB2X/w7hP1IpXQ6+UrAGxm1aFrTDtSmsEkCdmRJLnygkSh3nlCPuM?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6fd067-b9a1-4770-1811-08db20790c74
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 08:34:07.7168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0x/6milTvQx6nOgeI8EgxWfWOGNO1F+1wiWcEKsNhpVrn7ahJDNsVUJbNno4dKSrw+YDoslNWLJ4CHO4/l2TK7bTJ7CVdB36x8i1fgYlcWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6110
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 13/19] drm/xe: Reorder WAs to consider the
 platform
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

On Wed, Mar 08, 2023 at 02:55:10PM -0800, Matt Roper wrote:
>On Tue, Mar 07, 2023 at 01:24:40AM -0800, Lucas De Marchi wrote:
>> Now that number of platforms is growing, it's getting hard to know the
>> workarounds for each platform. Split the entries inside the same table
>> so the workarounds checking IP version are listed first, followed by
>> each platform. Next step when it grows too much is to split in smaller
>> tables.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 93 ++++++++++++++++++++++----------------
>>  1 file changed, 54 insertions(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 67539f9d70b4..155cabe16e2e 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -99,6 +99,24 @@ static const struct xe_rtp_entry gt_was[] = {
>>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>>  	},
>> +	{ XE_RTP_NAME("14011059788"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>> +	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
>> +	},
>> +
>> +	/* DG1 */
>> +
>> +	{ XE_RTP_NAME("1409420604"),
>> +	  XE_RTP_RULES(PLATFORM(DG1)),
>> +	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE2, CPSSUNIT_CLKGATE_DIS))
>> +	},
>> +	{ XE_RTP_NAME("1408615072"),
>> +	  XE_RTP_RULES(PLATFORM(DG1)),
>> +	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL))
>> +	},
>> +
>> +	/* DG2 */
>> +
>>  	{ XE_RTP_NAME("16010515920"),
>>  	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
>>  		       STEP(A0, B0),
>> @@ -162,47 +180,15 @@ static const struct xe_rtp_entry gt_was[] = {
>>  	  XE_RTP_RULES(PLATFORM(DG2)),
>>  	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
>>  	},
>> -	{ XE_RTP_NAME("14011059788"),
>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
>> -	  XE_RTP_ACTIONS(SET(GEN10_DFR_RATIO_EN_AND_CHICKEN, DFR_DISABLE))
>> -	},
>> -	{ XE_RTP_NAME("1409420604"),
>> -	  XE_RTP_RULES(PLATFORM(DG1)),
>> -	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE2, CPSSUNIT_CLKGATE_DIS))
>> -	},
>> -	{ XE_RTP_NAME("1408615072"),
>> -	  XE_RTP_RULES(PLATFORM(DG1)),
>> -	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE2, VSUNIT_CLKGATE_DIS_TGL))
>> -	},
>>  	{}
>>  };
>>
>>  static const struct xe_rtp_entry engine_was[] = {
>> -	{ XE_RTP_NAME("14015227452"),
>> -	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>> -	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
>> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> -	},
>> -	{ XE_RTP_NAME("1606931601"),
>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>> -	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
>> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> -	},
>>  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(GEN7_FF_THREAD_MODE,
>>  			     GEN12_FF_TESSELATION_DOP_GATE_DISABLE))
>>  	},
>> -	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021"),
>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> -	},
>> -	{ XE_RTP_NAME("18019627453"),
>> -	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>> -	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>> -			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> -	},
>>  	{ XE_RTP_NAME("1409804808"),
>>  	  XE_RTP_RULES(GRAPHICS_VERSION(1200),
>>  		       ENGINE_CLASS(RENDER),
>> @@ -217,6 +203,30 @@ static const struct xe_rtp_entry engine_was[] = {
>>  	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, GEN12_DISABLE_TDL_PUSH,
>>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>>  	},
>> +	{ XE_RTP_NAME("1606931601"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_EARLY_READ,
>> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> +	},
>> +	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> +	},
>> +	{ XE_RTP_NAME("1406941453"),
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
>> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> +	},
>> +	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
>
>This one probably doesn't belong in this file at all.  It's an
>i915-desired policy rather than a workaround.  It should either go in
>the tuning file, or in a new policy file (if we decide we want "tuning"
>to stay focused on the bspec-documented suggestions).
>
>Wherever this moves, we should probably copy over the mega-comment from
>i915 since it was explicitly requested by the maintainers that we add
>that explanation.

noted, but that deserves another commit since this is simply reordering
the WAs. To avoid much churn I will add a commit before this one.

thanks
Lucas De Marchi

>
>
>Matt
>
>> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
>> +			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
>> +			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>> +	},
>> +
>> +	/* TGL */
>> +
>>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>>  	  XE_RTP_RULES(PLATFORM(TIGERLAKE), ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
>> @@ -224,6 +234,9 @@ static const struct xe_rtp_entry engine_was[] = {
>>  			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
>>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>>  	},
>> +
>> +	/* RKL */
>> +
>>  	{ XE_RTP_NAME("1607297627, 1607030317, 1607186500"),
>>  	  XE_RTP_RULES(PLATFORM(ROCKETLAKE), ENGINE_CLASS(RENDER)),
>>  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(RENDER_RING_BASE),
>> @@ -231,15 +244,17 @@ static const struct xe_rtp_entry engine_was[] = {
>>  			     GEN8_RC_SEMA_IDLE_MSG_DISABLE,
>>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>>  	},
>> -	{ XE_RTP_NAME("1406941453"),
>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
>> -	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, ENABLE_SMALLPL,
>> +
>> +	/* DG2 */
>> +
>> +	{ XE_RTP_NAME("14015227452"),
>> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
>>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>>  	},
>> -	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
>> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
>> -	  XE_RTP_ACTIONS(SET(GEN7_FF_SLICE_CS_CHICKEN1,
>> -			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
>> +	{ XE_RTP_NAME("18019627453"),
>> +	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
>> +	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
>>  			     XE_RTP_ACTION_FLAG(MASKED_REG)))
>>  	},
>>  	{}
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
