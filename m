Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C52EE14D0
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 21:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F67710E1C4;
	Wed,  6 Sep 2023 21:40:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5458C10E1C4
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Sep 2023 21:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694036408; x=1725572408;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rgAAgXfRjrCnKS9QVjvCixGqw3jPJGe/eDPjEUtHK1w=;
 b=Kpe5gD9MQsj4djyUMvHYkafAZBjr2z/CCNYH3RH92XMiEyLM/Jv/zMtz
 hNUJlV16SbbL/dbwDnCLH/f0GEk3OhzGjKzpeDnlFkYP+wcxZgdI0RjIL
 yEUnwUK7sjjZmyeyGkfNfOeXZN/XDGBHEuSxKqSzQbPhajw6OQMnrh7r2
 2sM4pnOzlH5sBlZT/K3UruO/LtbxJv9QER3LvI7TQu7YiijDJlazEWOHv
 Sybxys2lZvahQXCFkYTL8qlcZnG40xG2t1G5WxG/8BPAz6YIfdwmB5rsk
 2WC50fniFfYbbJ/3pvXeKUdY4ypqui3QI8LIejiv74WJ1Bt/h7ah54sdk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="374585464"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="374585464"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 14:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741737921"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="741737921"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 14:40:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 14:40:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 14:40:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 6 Sep 2023 14:40:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 14:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDdYueIdkI/PIqYbWbrjUV8v5BlR6pvPBS36kELMKFXivbnBjJfc20nx21vACldUAjrRAJDiM+Dv4JZ7e2KkW2QMH2EKatvoj0c/sSf0xVn+oX7Fdc6X4NWHLrc7Ip/2kZpBFkDlUsc83BVtT5VCt9XYVJel0MLSmOzP8KwHj6klHO0q1IsyetDHBegNZdL8iOq3x5rzPGFGPhP2Tjvnz8pieot0IuwFbHcDOKSt/biw7Yx9RM8JHyFQNBekYq119cAkvhneRFsisYmD16Fk6yTDIvmrxD95CLctSQp8BnY3iuO47K8TXHaLTFPydvYnWkCoA7BwN7nixgO2DxIxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79auIGZ0UniMjXdvxGMa1xOU2jk1r+1nXUtHhH0c6UQ=;
 b=ZzYlwixfc1ylVp0zQiKoRMOpG4WKv89mcgnoZhR37u4OR481ZkxBWJtwcBZTn5bdfyplP7D4EMD6klv1304W+KsXfHK0SVmJkRy1WI5TBTIg4me4zHhO7SYWX8NAE2snpjOZ0lcfQj59ieYbd1OvN1UHZCsfggjfAGPCEIdDE5O0TX+WCIY8cIgqPVxkym5j+5JQLCrrM9PZU//iGQWr4fJBJ3vdqaJ+FMRaft7sqhTU0CXIFefPpsQsxoEgJyW83Tyr8aGhQHnvAMVPHj4R5g4SQyh7Scpt0Nn4dW6NDQ2vV3vdti654S3K6BGyv823JszVgUwO/L9USLYZhfntGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB4239.namprd11.prod.outlook.com (2603:10b6:208:192::20)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 21:39:51 +0000
Received: from MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::396d:bef4:459:c050]) by MN2PR11MB4239.namprd11.prod.outlook.com
 ([fe80::396d:bef4:459:c050%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 21:39:51 +0000
Date: Wed, 6 Sep 2023 14:39:47 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZPjxo27bJJPFezri@msatwood-mobl>
References: <20230823195533.125633-1-matthew.s.atwood@intel.com>
 <20230823195533.125633-2-matthew.s.atwood@intel.com>
 <20230824203555.GA1529860@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230824203555.GA1529860@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:303:87::22) To MN2PR11MB4239.namprd11.prod.outlook.com
 (2603:10b6:208:192::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4239:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3235b5-4bad-4faf-4b9b-08dbaf21cd21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HwhzBgNZnFjKarkATQjg3gLyWeZagDIq45xFoQo8SrjnO+GHDBpDCMxjXLFf4WDEB1/AtL9mn8/suCJhNkV42PD/QiT2VdFN9bAr025XhPtkKUv3Mq1iwKPsSKgDRfTYA+EfEa/zsUwocFXDnmQ4VchIRTvqhbr2Co5obi66H1T9ambtCxmchotI/VVb10a/HZo89wrZZi0fDQIscfg0kqOBZ6IpS8gRM3Qhe0nua017L1nX+ZRll6h5nSoqp7l8dKLTVosda/2BgQSN21vtyIN10yvtN6h3aTQ20HWXboa3KBk5WsqrrAB8uaoPZOcqbTrxGjd5I4x11b69+AH0FLJPynbVB9w4N3G+ioOZe7r5rb7yH7zKS4xR8VskKSBsvfsu9g6bbqMSAhSYXMnnyqCL7FxCjjAO11b+ViisEGZ6ACX4oHnSflzeKzqyI5+/IPSU3GMlmCl2GniAheHuOKrJp7YNiltj6LLO5un6v0AaNoDPn6yaMhhWmJILpyIhWFDcZgH0vTEhs0sj9bkUrbv2bXbGg5qCSUlSRnnvX/cLczREszkanv+2RrqVDzmN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4239.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199024)(1800799009)(186009)(66476007)(316002)(107886003)(6666004)(86362001)(66946007)(66556008)(2906002)(8676002)(41300700001)(4326008)(8936002)(5660300002)(38100700002)(478600001)(33716001)(6512007)(9686003)(26005)(6506007)(6486002)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG44S05lOTBBeHhwTlFGOE9HK0pQZlZVVGZRWGFSNkFPNnZmYVJOUitCc3gr?=
 =?utf-8?B?dkdnT2lRTnFHcDBtUVRwbDVTaWF2RThzSGNRQlJTTVF5K1JoOHZRaEdYWUxI?=
 =?utf-8?B?MFBVdzZtQy93d1dKTmYxTlpnUzExTThjQzZPa2xCcHRTcWN2ZlUvemtxeE1J?=
 =?utf-8?B?MUFMa1ZqWktKZjNIcWc1OHk4ZHNDNktjZTF0NjlHK0x4bElkNGUySUMrbC9H?=
 =?utf-8?B?UGcyd3lRcFB5ellUU3JudkRRd2V2aSs5SlBvL3hBTEp6OEl5RE9USFVmbkhY?=
 =?utf-8?B?ZUpRNlVoWnlyYldEcTFXZzRkSGMvVi81KzIraHc5enVrT2FKVUt0VzcveXVz?=
 =?utf-8?B?dzJOa090b3E2U1dDOWtSY1k1dzZscmE2eTFjN3MyZUJyc0N4Slc4aSs3M3lk?=
 =?utf-8?B?UXk3Tks3YUtLVHBkWHlDb2w1ZTI5cVpWRHZ0VUFodmZuNnRnNFZzajV6cTE3?=
 =?utf-8?B?b3J5dlhWUGpFZVg1a1Z0dXRBYThXVVVZK3h4V0RoeGxhb3E2VjlndkMrbEZ6?=
 =?utf-8?B?MEY3OGpGMHFRMWJmbFcydWhnMjh6MWwrOGd4VnA3M0tFV2xCVFcxQ1VIQmdh?=
 =?utf-8?B?N2E1TDhoajV1VkFkckl0WjNLNWN1VlJUWVp0TkY2MW5RRlBKT01Pb1p6WVlO?=
 =?utf-8?B?c2JRLzJBSXNhQjhlck0rbUJuYmt4a2tuRUJWVU9RRkdpV2RxL1g3dnhpeUh2?=
 =?utf-8?B?Vk9KV0d6a1pQUm5oMU8rOGxqQ1Z6QTJRS2ZYUUVwVjc2b1poNWp6czg1M2V3?=
 =?utf-8?B?dG4yeEZmazRjSnlVcEJRRzB2VE5zKzU3cjQ4RGorenNoQXVYazhXU0pxTmsr?=
 =?utf-8?B?bGpKb1J5SXZLTFI5aGs5V1JZM1ZTUXVSSW80VWdWdHRJdHIweFNLT0duWnlC?=
 =?utf-8?B?czlUbWZLRms4Z0xzdmpCK2dYSy9GVE1tWGI4bW5RaTBsUnVoQkNrVUZnWXZk?=
 =?utf-8?B?MWhoc2p4OTY1anhIN1IybkhuK0VoWCtWeENjNHNlUDBNOERhZzQ3SmlmM2cv?=
 =?utf-8?B?QnJhSkxpejVQNmd5QkdmUjhST1BsR2R0WFZlSmEvY3A2RnRxUUdlSXBWdW1H?=
 =?utf-8?B?OE5IUzFmSUd2S1VrUXBHa0lURXkrdkI2Q2M2T0x4VjJDLzZIYnFhNHBPeFRD?=
 =?utf-8?B?eFlYTDQ0S3BXbU03aGQ5d1Y0bEFwY3VhV2tJR2VXZVNVNlZ6MjlxcWw0MWk3?=
 =?utf-8?B?anZZOW42RzhuWDMxanFlRzB4K2FtOUlrZ24xNk9Valp2d0FZMmFRa3lhaWxD?=
 =?utf-8?B?VUdSeEUrb0diSXhJay9hTVgrbDdMNUtDSlNnOWtqNXdQTUhRZW4rYTdKU0Y1?=
 =?utf-8?B?SWtFWElwM0Q2ZGxtSVFVSytDWjd6UFdWdG90ZWZub2lHSjA1a3RIOTI1ZDRr?=
 =?utf-8?B?bStVOVp3VjczQmtKeEh5WkkxTHpCR2dlSUJQVlQyREdWMGNwd1FNL1NHdVJu?=
 =?utf-8?B?ZWMrdTN5L1BmVWE5WkdqR0FYd1MraXUyT2xrU29TTEMvZHpRVjlsSlhzSmp1?=
 =?utf-8?B?TVBmVDZFOTgxRjdpdVcvcXVBem9kU01KMThVTnJoN250c0pJZlhZZDkySWN5?=
 =?utf-8?B?KzgzZGd2TmxYQUhrN2VZZlBFR0VqN3lXVTV5M2VIYjFOYWE5emV4amhlZVl6?=
 =?utf-8?B?WDJ6ZHVmaTZxcmV1Nmh3cTVNZXY0OGNNODRHLy9PNmRPdkdSUmhwc2pQblZY?=
 =?utf-8?B?VWhhZzZYdEdCcm1NNzRYZWVEcVRPWXVTZTk2K2RGMDk3dzZpVlB6bmg2b1Zx?=
 =?utf-8?B?TjY2c3prLytJRmkrMkNtRGxqMy9zYVBneHNWNlZyOHF1d2ZHU0IzSWFKMDRE?=
 =?utf-8?B?cmVpMWFoN3M0RnJmUmFSV1BaclNOWXNiYSszMHhmTTVPWGZWTUY0UFlOVUk2?=
 =?utf-8?B?d0p1Ym56eWg2cUZkK2lSTWRiOHkwWjMxbHdWM3gzT1p4WGRoTm5ZcVo4MnZr?=
 =?utf-8?B?Y0hxaTdGM0dab1dqZHAycEVwNmlPSmhrMjlwaVk2bkVtR1N0YStNdllvTUda?=
 =?utf-8?B?djFndERRUVVkZ3hTc1VqT3c3SnE3bHhuVkZxdWQrc3gwNGErVVF0M3RTaitv?=
 =?utf-8?B?dW5GVVNNZFJFV2czcnRiVnliY3RIN1FkV21uK0hIL0dGSWh1bE5VZkc0a0xv?=
 =?utf-8?B?MDFvU1hrOUxnYXN5RnJ0Z0duQmhyaWIrOXNVOC9SQ2RBVTRIZHA2TkZmZS80?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3235b5-4bad-4faf-4b9b-08dbaf21cd21
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 21:39:51.5729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vAA1UYTSC8MN+WAjRpMSobqOSz2dv12jNFaueKRJvp8n4QRc6TMW1ac/YesHnTRuf5+/8UzcviiyICUvSHDg4hc0YteR4o38+mQ8ybJeVmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2 v3] drm/xe: add gt tuning for indirect
 state
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
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 01:35:55PM -0700, Matt Roper wrote:
> On Wed, Aug 23, 2023 at 12:55:33PM -0700, Matt Atwood wrote:
> > Force indirect state sampler data to only be in the dynamic state pool,
> > which is more convienent for the UMD. Behavior change mirrors similar
> > change for i915 in commit 16fc9c08f0ec ("drm/i915: disable sampler
> > indirect state in bindless heap")
> > 
> > v2: split out per engine tuning into separate patch, commit message
> > (Lucas)
> > v3: rebase
> > 
> > Bspec: 46052
> 
> These days there's no realy need to put bspec references for register
> pages on workarounds like this.  Reviewers with bspec access can already
> lookup the register directly by name and/or offset, so this isn't
> helpful like it used to be in the old days.
ack.
> 
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
> >  drivers/gpu/drm/xe/xe_tuning.c       | 5 +++++
> >  2 files changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index aa9d7fad41ee..d039e7afe466 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -298,6 +298,7 @@
> >  #define   ENABLE_SMALLPL			REG_BIT(15)
> >  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> >  #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
> > +#define   INDIRECT_STATE_BASE_ADDR_OVERRIDE	REG_BIT(0)
> >  
> >  #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
> >  #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index 702cb41dab53..07ffda39e2e4 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -28,6 +28,11 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
> >  };
> >  
> >  static const struct xe_rtp_entry_sr engine_tunings[] = {
> > +	{ XE_RTP_NAME("Tuning: Set Indirect State Override"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
> 
> This matches every single platform, so this rule isn't really doing any
> good as is.
> 
> However this setting is already the hardware default on Xe2, so 1271
> would be a reasonable end version here.
ack.
> 
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> 
> This register doesn't exist on platforms like PVC that don't have 3D
> functionality (and doesn't really make sense if there's no render).  So
> we should probably apply this rule specifically on the render engine
> rather than "first render/compute."
ack.
> 
> 
> Matt
> 
> > +	  XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> > +	},
> >  	{}
> >  };
> >  
> > -- 
> > 2.40.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
