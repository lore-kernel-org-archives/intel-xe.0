Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E178C64EC4
	for <intel-xe@archiver.kernel.org>; Thu,  9 Mar 2023 21:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9BC10E8E5;
	Thu,  9 Mar 2023 21:32:44 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FBF10E8E5
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Mar 2023 21:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678397563; x=1709933563;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ecOXdAZ2RVqIPNXUPMvYYKvWQ1M4t06+MeFGSDndqWQ=;
 b=HOml8t0VvWKapDrwCD4riWz3o7+R+cJrVY5tu0+GFg8VSGBv4gCJ2/rS
 YnX/E2W6amG9VUGbEQ+YBsw0LXkFTUr9V2ZW+S3IU4MFPInSBO/Wpwow4
 YLfg10vmgiLeGiwoXt9H4IM8nlRRR36RaaeXhOp8d+rjFuQIBS9Aqvpu4
 jcOEz9HNrhdjVOKqKLhx3q3V7ICmSkvIxdqvrws88JPfRJfXdWXVK/85Q
 6fwkzOEGzwm/4lRJsUS2w2z/m0TL+VC+YnX/La3Y+hgdnpPE2jaFcuBKG
 59AQjJUUdilY/U5IADGPflACHKESMt5yXHy7jkEPnArQP31CPKg+Tbbui g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324924472"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="324924472"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 13:32:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677551625"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; d="scan'208";a="677551625"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 13:32:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 13:32:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 13:32:33 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 13:32:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xhx1BA5qiXNkx14uFABfVxvQWeZBcaRx1H1RJazt+YBkDiVuFha6xN16E6LgqYpSBpn4FCX1arLR1ELOQFlnWCWldYc7WEBQw8YFF4rv4fOEudmOiFT10NraVeYiMOpQ3h/jRRkfYWQPAXVVckSsIa6OCkq2MQzQ50SM3sB9UbOyBmJpftca8OlPsuRyqbEc9HHEKxAqMqsw52FIhU5idaxTNXFrmgq6vxQOn1xaSwRRS324izSsoLC6IJqnHJrVbiRqft0VTzfivV+nRDcRKQWieUcS9SQtpHcPK2s6crWugFL+JuHXUHGby+t/UEJbNtbtzNEra4oVYwK2wkKlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q440mod0c5kAi/3Gz4MqCAKh0o9dKH1BGx+dKa3GWPo=;
 b=SEL/WX9Ln3bdOo68gD5yLHHi0cCEwFQ7dklbbrqTOtffhqIOXEn1lWCfnWK2Dxg7EuuIAE/T1aUlGaISdb7UPw1TUIrRecXIoJCSL6cKiA+gOqnXWbeW3Spd0wSdRzEXTuukgjT9dBUVIwXtmg61gT52oA5QRrgR7Ujp707+7jCpa8sIa6WZhDaNJ323xyz+ojDV9wCceAdCqV7we+AM36PIb63erQRgm5EOHeXrnFENLP0YVdjoy1iLOTvEGPDH9+ATRiCMgsFu9KtX+WByfr/tfHmkg9hb8ov/Jsl/CzfcebF9IaXwg63DiX5y1PHqCUhOhiqAHz2bX7m4F+wLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6113.namprd11.prod.outlook.com (2603:10b6:930:2e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Thu, 9 Mar
 2023 21:32:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Thu, 9 Mar 2023
 21:32:31 +0000
Date: Thu, 9 Mar 2023 13:32:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230309213225.nprqxan6322sns37@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230309211210.1713613-1-lucas.demarchi@intel.com>
 <20230309212103.GC3408186@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230309212103.GC3408186@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d33140-ff90-4c22-7fa1-08db20e5c9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AvPYhomM89RLZxntjt9Mdb9j76/XnCKDif7vP/0aHNvJijnldarV9XAr/PJOmkiFem8f+rYCyKURal6HyCLRdRdGkThM58B7yojKdSnDPQIEOvy0By/qr0wuK0/NnR0+YxQ5D9cKZ995QmPrtXZTEHMDdEoWbJaozMi70p/z+UsqGQ1y4kSn1wcPSnqjclAaYznfH/UlvO4uTApSpmYasx2MV4GublIOPDFu8v81lOCNW+vtWKw46XUlSNj1Vc3zzksWk4oh6HspbYNaaTEzAIfz7A+/8kfCMxIrg6a+BDNIZ3xkWtZ7QzAkFkzWjQvNFluQl1VR9MtI6cqZ0clg1UpNNaBS78QBzDKhG4qOeTKJxB9ervDwcQtm0zA0qLqjZemyBn1V/GyjJsQMgCxzNV9DalOz89IS1wTEaPhAPuw3U0VMq/llL7hi3X1PhtCDzI02CahQ6kjsAFUtkEdEmKQ/5c2opp/pO4HPUTaCeO0sXZnV+EH3DFTx92KaVfHvXFUK0zE7EyN0BlmKEYUwfovKlaSIHK0s22fBHdYB6bst1q71/knfoe0mxkZEUiur9ZD4dRr0SgWsjR+Z8Ri2wJTMFjdWoj7RBFHSLL8NBYGdeeb1875aSGz8Trp80D0gnhsYZIxAOUCXn59JOMgtyYGX8DlfbiwVRS1uG0R4twfepFzIEB69+CUVuZx8W6fc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199018)(9686003)(186003)(38100700002)(19627235002)(478600001)(66556008)(6666004)(6862004)(5660300002)(66476007)(2906002)(4326008)(82960400001)(41300700001)(26005)(66946007)(8676002)(8936002)(1076003)(6506007)(6512007)(36756003)(316002)(6636002)(86362001)(83380400001)(6486002)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LHN99bWzaj2SvT5RIAe6K/z+Rj6F2A7oSNtGhuvth9GZ47CjOBg1XzjLTp7I?=
 =?us-ascii?Q?4MenmP47bz/NpQoafUL/7qLZ2EeSt4pWuxZtDZdJhj/abTIqJnxVNkP7er5+?=
 =?us-ascii?Q?RMWAjue4nZ7AucKZZ1uboGSmPdVH7ix6eSg8yZ49+pqmVDjzU9h3PJcVCFqF?=
 =?us-ascii?Q?Co6/Ah3gBo8weC9EIHEzwQJc21dPPfFZPqwTVwwyVpJe1D843S7LHuXjaG5h?=
 =?us-ascii?Q?X7jjXgvoaC5DAAOPfjQgrWvaRGOWkQRvcmOkyj0Ph+j5B+8VSI7FXMatfG6I?=
 =?us-ascii?Q?R7nenlHjdE1SDiIC3/JFOzbitZCg2kBHul35LGzz3Q4UV8nHycrLgy4qn91Z?=
 =?us-ascii?Q?4uiVWKEjPwmlKBAkefFS8H6lASSLQURr6Aenulh3GjoE6MAQ53E/JLsZVK01?=
 =?us-ascii?Q?gQr4LGfJZRbwC9FTwPHMPzKcB7GUPfDXzBi3NXA1Un6wLGmsslGykeVmLxbv?=
 =?us-ascii?Q?yQuqlZtsG+6a8jrwlafwtzXlp5V9eM2rGsXUhaCqq4dm9wQbkFdCaNJjkSOB?=
 =?us-ascii?Q?nGoQGbnqaOryf0aQxC9E/Z4lAtMQu80NXR1oF5cweIWnKO393/87pa1pWCH2?=
 =?us-ascii?Q?i3V/xySFYi8/hBaBY73+87yDSn8pu2XmVq7YRgm5zgqNW8wlfMtotxniqXKx?=
 =?us-ascii?Q?oGgWNiSN6Dx5sRnbo/81FevCG96RNMSOHBqANRn05tJO1ffoUZyp9u0sQpCD?=
 =?us-ascii?Q?hPSBs6ycAoXIy2XxSh4f6d8gSsJ1sEXPeeykVZbU6qfbIGlgmp/YyVCBHCNR?=
 =?us-ascii?Q?TQbb4KTKG6nwgSjuYFiM9/rs8Vh2QbAaQlulGrlhGpAs2aXU7Mu5ekmJtJSm?=
 =?us-ascii?Q?M0mm81vD34/Np5nzQO/4zPwNcQerd57woKRlKAlJjniE+F+C1sYhjTj4ERp+?=
 =?us-ascii?Q?m1ltgjWTPZbmfgHZ1lTCrvlD+JNx70nsPfwdD3y0/pwgxW3U4jcWbwL4DWcn?=
 =?us-ascii?Q?twKOLBSyTReg4MvReZ0n/vOUWQcH+HrCc0czESntTUj5x0sn8Z/ptO0/ejQL?=
 =?us-ascii?Q?5tKceSySqWV8mrPCZ+AZ9fc3lRSAXecRP6pQjIPhHzJcYLHclfIt6CRi2K5T?=
 =?us-ascii?Q?99rVoiXlxknHjqSBDn38G9N3AWTrh7+bVvzt2OPVvQ+HXRIe7VYcQtT+sb8h?=
 =?us-ascii?Q?KwCjj9wtKVYKw1/ZDv1yZKJD0CVoyVMBytZUXXtJcb01H2gYulc4hwsubDgt?=
 =?us-ascii?Q?yNPRGskA8F26sD4ylOSTXNsDwledSm6KR4sAd1OGOblquafrMQql4X1wDPXJ?=
 =?us-ascii?Q?f4w/eDOBjqsDy1z6T08RUGiRHcSO6bsCsy7kJhTwz+012+JGyVOadO8KD0IF?=
 =?us-ascii?Q?SdhdYtmyuYSLWDXD4dTNJ6XeSsqLzhHH//1NCrNK7l62essopIKhIovUnl20?=
 =?us-ascii?Q?KATSfe0ZjRe69P5OO1OStBjoGIRqR+Cxa52S8/l/7npFD791j9DdKY+umWoU?=
 =?us-ascii?Q?Pqdza/lfR5R2GjeBRD2UkyK6S3oZ+CAVEF708goMgiLDXFWVGfnEjjSHhm5a?=
 =?us-ascii?Q?cCe5ac5hHLfTCEhR6NF+uh1z5NlFfYTECJw5v/jGPvkxlJ2bTcQ/+YttExRL?=
 =?us-ascii?Q?MxdjytYH/ftGkGqozuTHH/fv/7Qg5AbGd6PPB6OoviA2UPqEE0/4PDm7sgsS?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d33140-ff90-4c22-7fa1-08db20e5c9a3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 21:32:30.8091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ye4BukXrJYuN/FMUuWLwU81mTATl7wrmIAntIE4CT1nmXViUZGRoCBHNEb8GR0aHhCdTs6rBMdQnkfWWEmTRA63lNQfzTGWlLt6YMrMKG7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6113
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/mcr: Add L3BANK steering for
 DG2
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

On Thu, Mar 09, 2023 at 01:21:03PM -0800, Matt Roper wrote:
>On Thu, Mar 09, 2023 at 01:12:09PM -0800, Lucas De Marchi wrote:
>> Some register ranges with replication type L3BANK were missing from the
>> driver table. The following warning was triggering when adding a
>> workaround touching the register 0xb188:
>>
>> 	xe 0000:03:00.0: Did not find MCR register 0xb188 in any MCR steering table
>>
>> Add the L3BANK ranges according to the spec.
>>
>> v2:
>>   - Fix typo in one of the ranges: s/0x008CFF/0x00BCFF/ (Matt Roper)
>
>Nit:  the correction made in v2 was actually the other way around
>(i.e., replace BCFF with 8CFF).

I think I have to change my glasses or change my programming font :(

>
>Aside from that,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks, I will update the commit message while applying.

Lucas De Marchi

>
>>   - Add termination rule in the init function for L3BANK (Matt Roper)
>>
>> Bspec: 66534
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_mcr.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index 10eff02cc7db..ab8fc649ba52 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -47,6 +47,12 @@ static const struct xe_mmio_range xelp_l3bank_steering_table[] = {
>>  	{},
>>  };
>>
>> +static const struct xe_mmio_range xehp_l3bank_steering_table[] = {
>> +	{ 0x008C80, 0x008CFF },
>> +	{ 0x00B100, 0x00B3FF },
>> +	{},
>> +};
>> +
>>  /*
>>   * Although the bspec lists more "MSLICE" ranges than shown here, some of those
>>   * are of a "GAM" subclass that has special rules and doesn't need to be
>> @@ -180,6 +186,18 @@ static void init_steering_l3bank(struct xe_gt *gt)
>>  		gt->steering[L3BANK].group_target = __ffs(mslice_mask);
>>  		gt->steering[L3BANK].instance_target =
>>  			bank_mask & BIT(0) ? 0 : 2;
>> +	} else if (gt_to_xe(gt)->info.platform == XE_DG2) {
>> +		u32 mslice_mask = REG_FIELD_GET(GEN12_MEML3_EN_MASK,
>> +						xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
>> +		u32 bank = __ffs(mslice_mask) * 8;
>> +
>> +		/*
>> +		 * Like mslice registers, look for a valid mslice and steer to
>> +		 * the first L3BANK of that quad. Access to the Nth L3 bank is
>> +		 * split between the first bits of group and instance
>> +		 */
>> +		gt->steering[L3BANK].group_target = (bank >> 2) & 0x7;
>> +		gt->steering[L3BANK].instance_target = bank & 0x3;
>>  	} else {
>>  		u32 fuse = REG_FIELD_GET(GEN10_L3BANK_MASK,
>>  					 ~xe_mmio_read32(gt, GEN10_MIRROR_FUSE3.reg));
>> @@ -277,6 +295,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
>>  		gt->steering[INSTANCE0].ranges = xehpc_instance0_steering_table;
>>  		gt->steering[DSS].ranges = xehpc_dss_steering_table;
>>  	} else if (xe->info.platform == XE_DG2) {
>> +		gt->steering[L3BANK].ranges = xehp_l3bank_steering_table;
>>  		gt->steering[MSLICE].ranges = xehp_mslice_steering_table;
>>  		gt->steering[LNCF].ranges = xehp_lncf_steering_table;
>>  		gt->steering[DSS].ranges = xehp_dss_steering_table;
>> --
>> 2.39.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
